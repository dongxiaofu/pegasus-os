
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
c0001525:	e8 e7 3c 00 00       	call   c0005211 <ReloadGDT>
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
c000154e:	e9 45 03 00 00       	jmp    c0001898 <kernel_main>
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
c000156a:	e8 59 70 00 00       	call   c00085c8 <test>
c000156f:	6a 01                	push   $0x1
c0001571:	6a 02                	push   $0x2
c0001573:	6a 03                	push   $0x3
c0001575:	f4                   	hlt    
c0001576:	66 90                	;xchg   %ax,%ax
c0001578:	66 90                	;xchg   %ax,%ax
c000157a:	66 90                	;xchg   %ax,%ax
c000157c:	66 90                	;xchg   %ax,%ax
c000157e:	66 90                	;xchg   %ax,%ax

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
c0001661:	e8 7b 6a 00 00       	call   c00080e1 <exception_handler>
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
c000167e:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001684:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c000168b:	75 00                	jne    c000168d <hwint0.1>

c000168d <hwint0.1>:
c000168d:	e8 89 37 00 00       	call   c0004e1b <clock_handler>
c0001692:	e9 e1 00 00 00       	jmp    c0001778 <reenter_restore>

c0001697 <hwint1>:
c0001697:	60                   	pusha  
c0001698:	1e                   	push   %ds
c0001699:	06                   	push   %es
c000169a:	0f a0                	push   %fs
c000169c:	0f a8                	push   %gs
c000169e:	66 8c d2             	mov    %ss,%dx
c00016a1:	8e da                	mov    %edx,%ds
c00016a3:	8e c2                	mov    %edx,%es
c00016a5:	8e e2                	mov    %edx,%fs
c00016a7:	b0 fa                	mov    $0xfa,%al
c00016a9:	e6 21                	out    %al,$0x21
c00016ab:	b0 20                	mov    $0x20,%al
c00016ad:	e6 20                	out    %al,$0x20
c00016af:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c00016b5:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00016bc:	75 00                	jne    c00016be <hwint1.1>

c00016be <hwint1.1>:
c00016be:	e8 93 46 00 00       	call   c0005d56 <keyboard_handler>
c00016c3:	b0 f8                	mov    $0xf8,%al
c00016c5:	e6 21                	out    %al,$0x21
c00016c7:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00016ce:	0f 85 a4 00 00 00    	jne    c0001778 <reenter_restore>
c00016d4:	e9 9f 00 00 00       	jmp    c0001778 <reenter_restore>

c00016d9 <hwint14>:
c00016d9:	60                   	pusha  
c00016da:	1e                   	push   %ds
c00016db:	06                   	push   %es
c00016dc:	0f a0                	push   %fs
c00016de:	0f a8                	push   %gs
c00016e0:	66 8c d2             	mov    %ss,%dx
c00016e3:	8e da                	mov    %edx,%ds
c00016e5:	8e c2                	mov    %edx,%es
c00016e7:	8e e2                	mov    %edx,%fs
c00016e9:	b0 ff                	mov    $0xff,%al
c00016eb:	e6 a1                	out    %al,$0xa1
c00016ed:	b0 20                	mov    $0x20,%al
c00016ef:	e6 20                	out    %al,$0x20
c00016f1:	90                   	nop
c00016f2:	e6 a0                	out    %al,$0xa0
c00016f4:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c00016fa:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001701:	75 00                	jne    c0001703 <hwint14.1>

c0001703 <hwint14.1>:
c0001703:	e8 87 10 00 00       	call   c000278f <hd_handler>
c0001708:	b0 bf                	mov    $0xbf,%al
c000170a:	e6 a1                	out    %al,$0xa1
c000170c:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001713:	75 63                	jne    c0001778 <reenter_restore>
c0001715:	eb 61                	jmp    c0001778 <reenter_restore>

c0001717 <sys_call>:
c0001717:	60                   	pusha  
c0001718:	1e                   	push   %ds
c0001719:	06                   	push   %es
c000171a:	0f a0                	push   %fs
c000171c:	0f a8                	push   %gs
c000171e:	89 e6                	mov    %esp,%esi
c0001720:	89 e5                	mov    %esp,%ebp
c0001722:	66 8c d2             	mov    %ss,%dx
c0001725:	8e da                	mov    %edx,%ds
c0001727:	8e c2                	mov    %edx,%es
c0001729:	8e e2                	mov    %edx,%fs
c000172b:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001731:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001738:	75 00                	jne    c000173a <sys_call.1>

c000173a <sys_call.1>:
c000173a:	56                   	push   %esi
c000173b:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001741:	53                   	push   %ebx
c0001742:	51                   	push   %ecx
c0001743:	ff 14 85 2c f1 00 c0 	call   *-0x3fff0ed4(,%eax,4)
c000174a:	83 c4 0c             	add    $0xc,%esp
c000174d:	5e                   	pop    %esi
c000174e:	89 45 2c             	mov    %eax,0x2c(%ebp)
c0001751:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001758:	75 1e                	jne    c0001778 <reenter_restore>
c000175a:	eb 1c                	jmp    c0001778 <reenter_restore>

c000175c <fork_restart>:
c000175c:	fa                   	cli    
c000175d:	0f a9                	pop    %gs
c000175f:	0f a1                	pop    %fs
c0001761:	07                   	pop    %es
c0001762:	1f                   	pop    %ds
c0001763:	61                   	popa   
c0001764:	cf                   	iret   

c0001765 <restart>:
c0001765:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c000176b:	89 e5                	mov    %esp,%ebp
c000176d:	8b 65 04             	mov    0x4(%ebp),%esp
c0001770:	0f a9                	pop    %gs
c0001772:	0f a1                	pop    %fs
c0001774:	07                   	pop    %es
c0001775:	1f                   	pop    %ds
c0001776:	61                   	popa   
c0001777:	cf                   	iret   

c0001778 <reenter_restore>:
c0001778:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c000177e:	0f a9                	pop    %gs
c0001780:	0f a1                	pop    %fs
c0001782:	07                   	pop    %es
c0001783:	1f                   	pop    %ds
c0001784:	61                   	popa   
c0001785:	cf                   	iret   

c0001786 <in_byte>:
c0001786:	31 d2                	xor    %edx,%edx
c0001788:	8b 54 24 04          	mov    0x4(%esp),%edx
c000178c:	31 c0                	xor    %eax,%eax
c000178e:	ec                   	in     (%dx),%al
c000178f:	90                   	nop
c0001790:	90                   	nop
c0001791:	c3                   	ret    

c0001792 <out_byte>:
c0001792:	31 d2                	xor    %edx,%edx
c0001794:	31 c0                	xor    %eax,%eax
c0001796:	8b 54 24 04          	mov    0x4(%esp),%edx
c000179a:	8a 44 24 08          	mov    0x8(%esp),%al
c000179e:	ee                   	out    %al,(%dx)
c000179f:	90                   	nop
c00017a0:	90                   	nop
c00017a1:	c3                   	ret    

c00017a2 <in_byte2>:
c00017a2:	55                   	push   %ebp
c00017a3:	89 e5                	mov    %esp,%ebp
c00017a5:	52                   	push   %edx
c00017a6:	31 d2                	xor    %edx,%edx
c00017a8:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017ac:	31 c0                	xor    %eax,%eax
c00017ae:	ec                   	in     (%dx),%al
c00017af:	90                   	nop
c00017b0:	90                   	nop
c00017b1:	5b                   	pop    %ebx
c00017b2:	5d                   	pop    %ebp
c00017b3:	c3                   	ret    

c00017b4 <disable_int>:
c00017b4:	fa                   	cli    
c00017b5:	c3                   	ret    

c00017b6 <enable_int>:
c00017b6:	fb                   	sti    
c00017b7:	c3                   	ret    

c00017b8 <check_tss_esp0>:
c00017b8:	55                   	push   %ebp
c00017b9:	89 e5                	mov    %esp,%ebp
c00017bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00017be:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017c1:	83 c0 44             	add    $0x44,%eax
c00017c4:	8b 15 44 16 01 c0    	mov    0xc0011644,%edx
c00017ca:	39 d0                	cmp    %edx,%eax
c00017cc:	74 7c                	je     c000184a <check_tss_esp0.2>

c00017ce <check_tss_esp0.1>:
c00017ce:	50                   	push   %eax
c00017cf:	52                   	push   %edx
c00017d0:	68 10 f0 00 c0       	push   $0xc000f010
c00017d5:	e8 b2 fd ff ff       	call   c000158c <disp_str>
c00017da:	83 c4 04             	add    $0x4,%esp
c00017dd:	5a                   	pop    %edx
c00017de:	58                   	pop    %eax
c00017df:	52                   	push   %edx
c00017e0:	50                   	push   %eax
c00017e1:	53                   	push   %ebx
c00017e2:	e8 94 67 00 00       	call   c0007f7b <disp_int>
c00017e7:	83 c4 04             	add    $0x4,%esp
c00017ea:	58                   	pop    %eax
c00017eb:	5a                   	pop    %edx
c00017ec:	52                   	push   %edx
c00017ed:	50                   	push   %eax
c00017ee:	e8 88 67 00 00       	call   c0007f7b <disp_int>
c00017f3:	58                   	pop    %eax
c00017f4:	5a                   	pop    %edx
c00017f5:	52                   	push   %edx
c00017f6:	50                   	push   %eax
c00017f7:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c00017fd:	e8 79 67 00 00       	call   c0007f7b <disp_int>
c0001802:	83 c4 04             	add    $0x4,%esp
c0001805:	58                   	pop    %eax
c0001806:	5a                   	pop    %edx
c0001807:	52                   	push   %edx
c0001808:	50                   	push   %eax
c0001809:	ff 72 ec             	pushl  -0x14(%edx)
c000180c:	e8 6a 67 00 00       	call   c0007f7b <disp_int>
c0001811:	83 c4 04             	add    $0x4,%esp
c0001814:	58                   	pop    %eax
c0001815:	5a                   	pop    %edx
c0001816:	52                   	push   %edx
c0001817:	50                   	push   %eax
c0001818:	ff 70 ec             	pushl  -0x14(%eax)
c000181b:	e8 5b 67 00 00       	call   c0007f7b <disp_int>
c0001820:	83 c4 04             	add    $0x4,%esp
c0001823:	58                   	pop    %eax
c0001824:	5a                   	pop    %edx
c0001825:	52                   	push   %edx
c0001826:	50                   	push   %eax
c0001827:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c000182d:	e8 49 67 00 00       	call   c0007f7b <disp_int>
c0001832:	83 c4 04             	add    $0x4,%esp
c0001835:	58                   	pop    %eax
c0001836:	5a                   	pop    %edx
c0001837:	52                   	push   %edx
c0001838:	50                   	push   %eax
c0001839:	68 60 07 01 c0       	push   $0xc0010760
c000183e:	e8 38 67 00 00       	call   c0007f7b <disp_int>
c0001843:	83 c4 04             	add    $0x4,%esp
c0001846:	58                   	pop    %eax
c0001847:	5a                   	pop    %edx
c0001848:	5d                   	pop    %ebp
c0001849:	c3                   	ret    

c000184a <check_tss_esp0.2>:
c000184a:	5d                   	pop    %ebp
c000184b:	c3                   	ret    

c000184c <enable_8259A_casecade_irq>:
c000184c:	9c                   	pushf  
c000184d:	fa                   	cli    
c000184e:	e4 21                	in     $0x21,%al
c0001850:	24 fb                	and    $0xfb,%al
c0001852:	e6 21                	out    %al,$0x21
c0001854:	9d                   	popf   
c0001855:	c3                   	ret    

c0001856 <disable_8259A_casecade_irq>:
c0001856:	9c                   	pushf  
c0001857:	fa                   	cli    
c0001858:	e4 21                	in     $0x21,%al
c000185a:	0c 04                	or     $0x4,%al
c000185c:	e6 21                	out    %al,$0x21
c000185e:	9c                   	pushf  
c000185f:	c3                   	ret    

c0001860 <enable_8259A_slave_winchester_irq>:
c0001860:	9c                   	pushf  
c0001861:	fa                   	cli    
c0001862:	e4 a1                	in     $0xa1,%al
c0001864:	24 bf                	and    $0xbf,%al
c0001866:	e6 a1                	out    %al,$0xa1
c0001868:	9d                   	popf   
c0001869:	c3                   	ret    

c000186a <disable_8259A_slave_winchester_irq>:
c000186a:	9c                   	pushf  
c000186b:	fa                   	cli    
c000186c:	e4 a1                	in     $0xa1,%al
c000186e:	0c 40                	or     $0x40,%al
c0001870:	e6 a1                	out    %al,$0xa1
c0001872:	9d                   	popf   
c0001873:	c3                   	ret    

c0001874 <update_cr3>:
c0001874:	55                   	push   %ebp
c0001875:	89 e5                	mov    %esp,%ebp
c0001877:	8b 45 08             	mov    0x8(%ebp),%eax
c000187a:	0f 22 d8             	mov    %eax,%cr3
c000187d:	89 ec                	mov    %ebp,%esp
c000187f:	5d                   	pop    %ebp
c0001880:	c3                   	ret    

c0001881 <update_tss>:
c0001881:	55                   	push   %ebp
c0001882:	89 e5                	mov    %esp,%ebp
c0001884:	8b 45 08             	mov    0x8(%ebp),%eax
c0001887:	a3 44 16 01 c0       	mov    %eax,0xc0011644
c000188c:	89 ec                	mov    %ebp,%esp
c000188e:	5d                   	pop    %ebp
c000188f:	c3                   	ret    

c0001890 <get_running_thread_pcb>:
c0001890:	89 e0                	mov    %esp,%eax
c0001892:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0001897:	c3                   	ret    

c0001898 <kernel_main>:
c0001898:	55                   	push   %ebp
c0001899:	89 e5                	mov    %esp,%ebp
c000189b:	83 ec 08             	sub    $0x8,%esp
c000189e:	e8 d0 00 00 00       	call   c0001973 <init>
c00018a3:	e8 e8 ff ff ff       	call   c0001890 <get_running_thread_pcb>
c00018a8:	a3 e0 1e 01 c0       	mov    %eax,0xc0011ee0
c00018ad:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018b2:	05 00 01 00 00       	add    $0x100,%eax
c00018b7:	83 ec 08             	sub    $0x8,%esp
c00018ba:	50                   	push   %eax
c00018bb:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018c0:	e8 ab 97 00 00       	call   c000b070 <appendToDoubleLinkList>
c00018c5:	83 c4 10             	add    $0x10,%esp
c00018c8:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018cd:	05 08 01 00 00       	add    $0x108,%eax
c00018d2:	83 ec 08             	sub    $0x8,%esp
c00018d5:	50                   	push   %eax
c00018d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018db:	e8 90 97 00 00       	call   c000b070 <appendToDoubleLinkList>
c00018e0:	83 c4 10             	add    $0x10,%esp
c00018e3:	6a 00                	push   $0x0
c00018e5:	68 20 b4 00 c0       	push   $0xc000b420
c00018ea:	68 27 b4 00 c0       	push   $0xc000b427
c00018ef:	68 3e 66 00 c0       	push   $0xc000663e
c00018f4:	e8 c4 94 00 00       	call   c000adbd <process_execute>
c00018f9:	83 c4 10             	add    $0x10,%esp
c00018fc:	6a 00                	push   $0x0
c00018fe:	68 30 b4 00 c0       	push   $0xc000b430
c0001903:	68 38 b4 00 c0       	push   $0xc000b438
c0001908:	68 b9 29 00 c0       	push   $0xc00029b9
c000190d:	e8 ab 94 00 00       	call   c000adbd <process_execute>
c0001912:	83 c4 10             	add    $0x10,%esp
c0001915:	6a 00                	push   $0x0
c0001917:	68 41 b4 00 c0       	push   $0xc000b441
c000191c:	68 48 b4 00 c0       	push   $0xc000b448
c0001921:	68 1e 1b 00 c0       	push   $0xc0001b1e
c0001926:	e8 92 94 00 00       	call   c000adbd <process_execute>
c000192b:	83 c4 10             	add    $0x10,%esp
c000192e:	6a 00                	push   $0x0
c0001930:	68 51 b4 00 c0       	push   $0xc000b451
c0001935:	68 59 b4 00 c0       	push   $0xc000b459
c000193a:	68 53 5c 00 c0       	push   $0xc0005c53
c000193f:	e8 79 94 00 00       	call   c000adbd <process_execute>
c0001944:	83 c4 10             	add    $0x10,%esp
c0001947:	6a 01                	push   $0x1
c0001949:	68 63 b4 00 c0       	push   $0xc000b463
c000194e:	68 6d b4 00 c0       	push   $0xc000b46d
c0001953:	68 e9 1a 00 c0       	push   $0xc0001ae9
c0001958:	e8 60 94 00 00       	call   c000adbd <process_execute>
c000195d:	83 c4 10             	add    $0x10,%esp
c0001960:	83 ec 0c             	sub    $0xc,%esp
c0001963:	68 7a b4 00 c0       	push   $0xc000b47a
c0001968:	e8 1f fc ff ff       	call   c000158c <disp_str>
c000196d:	83 c4 10             	add    $0x10,%esp
c0001970:	fb                   	sti    
c0001971:	eb fe                	jmp    c0001971 <kernel_main+0xd9>

c0001973 <init>:
c0001973:	55                   	push   %ebp
c0001974:	89 e5                	mov    %esp,%ebp
c0001976:	83 ec 18             	sub    $0x18,%esp
c0001979:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001980:	00 00 00 
c0001983:	c7 05 90 07 01 c0 00 	movl   $0x0,0xc0010790
c000198a:	00 00 00 
c000198d:	c7 05 fc 0d 01 c0 09 	movl   $0x9,0xc0010dfc
c0001994:	00 00 00 
c0001997:	c7 05 c0 0b 01 c0 00 	movl   $0x0,0xc0010bc0
c000199e:	00 00 00 
c00019a1:	83 ec 0c             	sub    $0xc,%esp
c00019a4:	68 84 b4 00 c0       	push   $0xc000b484
c00019a9:	e8 de fb ff ff       	call   c000158c <disp_str>
c00019ae:	83 c4 10             	add    $0x10,%esp
c00019b1:	e8 cf 6c 00 00       	call   c0008685 <init_keyboard>
c00019b6:	83 ec 0c             	sub    $0xc,%esp
c00019b9:	68 00 00 00 02       	push   $0x2000000
c00019be:	e8 c8 60 00 00       	call   c0007a8b <init_memory>
c00019c3:	83 c4 10             	add    $0x10,%esp
c00019c6:	83 ec 0c             	sub    $0xc,%esp
c00019c9:	68 ec 0d 01 c0       	push   $0xc0010dec
c00019ce:	e8 72 95 00 00       	call   c000af45 <initDoubleLinkList>
c00019d3:	83 c4 10             	add    $0x10,%esp
c00019d6:	83 ec 0c             	sub    $0xc,%esp
c00019d9:	68 04 1f 01 c0       	push   $0xc0011f04
c00019de:	e8 62 95 00 00       	call   c000af45 <initDoubleLinkList>
c00019e3:	83 c4 10             	add    $0x10,%esp
c00019e6:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00019ed:	00 00 00 
c00019f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019f7:	eb 14                	jmp    c0001a0d <init+0x9a>
c00019f9:	83 ec 0c             	sub    $0xc,%esp
c00019fc:	68 8a b4 00 c0       	push   $0xc000b48a
c0001a01:	e8 86 fb ff ff       	call   c000158c <disp_str>
c0001a06:	83 c4 10             	add    $0x10,%esp
c0001a09:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001a0d:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001a14:	7e e3                	jle    c00019f9 <init+0x86>
c0001a16:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001a1d:	00 00 00 
c0001a20:	90                   	nop
c0001a21:	c9                   	leave  
c0001a22:	c3                   	ret    

c0001a23 <kernel_thread_a>:
c0001a23:	55                   	push   %ebp
c0001a24:	89 e5                	mov    %esp,%ebp
c0001a26:	83 ec 18             	sub    $0x18,%esp
c0001a29:	83 ec 0c             	sub    $0xc,%esp
c0001a2c:	ff 75 08             	pushl  0x8(%ebp)
c0001a2f:	e8 58 fb ff ff       	call   c000158c <disp_str>
c0001a34:	83 c4 10             	add    $0x10,%esp
c0001a37:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001a3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001a3f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001a46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a49:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c0001a4e:	83 ec 0c             	sub    $0xc,%esp
c0001a51:	68 8b b4 00 c0       	push   $0xc000b48b
c0001a56:	e8 31 fb ff ff       	call   c000158c <disp_str>
c0001a5b:	83 c4 10             	add    $0x10,%esp
c0001a5e:	83 ec 0c             	sub    $0xc,%esp
c0001a61:	68 94 b4 00 c0       	push   $0xc000b494
c0001a66:	e8 21 fb ff ff       	call   c000158c <disp_str>
c0001a6b:	83 c4 10             	add    $0x10,%esp
c0001a6e:	eb d6                	jmp    c0001a46 <kernel_thread_a+0x23>

c0001a70 <kernel_thread_b>:
c0001a70:	55                   	push   %ebp
c0001a71:	89 e5                	mov    %esp,%ebp
c0001a73:	83 ec 18             	sub    $0x18,%esp
c0001a76:	83 ec 0c             	sub    $0xc,%esp
c0001a79:	ff 75 08             	pushl  0x8(%ebp)
c0001a7c:	e8 0b fb ff ff       	call   c000158c <disp_str>
c0001a81:	83 c4 10             	add    $0x10,%esp
c0001a84:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001a89:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001a8c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001a93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a96:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c0001a9b:	83 ec 0c             	sub    $0xc,%esp
c0001a9e:	68 96 b4 00 c0       	push   $0xc000b496
c0001aa3:	e8 e4 fa ff ff       	call   c000158c <disp_str>
c0001aa8:	83 c4 10             	add    $0x10,%esp
c0001aab:	83 ec 0c             	sub    $0xc,%esp
c0001aae:	68 94 b4 00 c0       	push   $0xc000b494
c0001ab3:	e8 d4 fa ff ff       	call   c000158c <disp_str>
c0001ab8:	83 c4 10             	add    $0x10,%esp
c0001abb:	eb d6                	jmp    c0001a93 <kernel_thread_b+0x23>

c0001abd <kernel_thread_c>:
c0001abd:	55                   	push   %ebp
c0001abe:	89 e5                	mov    %esp,%ebp
c0001ac0:	83 ec 08             	sub    $0x8,%esp
c0001ac3:	83 ec 0c             	sub    $0xc,%esp
c0001ac6:	ff 75 08             	pushl  0x8(%ebp)
c0001ac9:	e8 be fa ff ff       	call   c000158c <disp_str>
c0001ace:	83 c4 10             	add    $0x10,%esp
c0001ad1:	eb fe                	jmp    c0001ad1 <kernel_thread_c+0x14>

c0001ad3 <kernel_thread_d>:
c0001ad3:	55                   	push   %ebp
c0001ad4:	89 e5                	mov    %esp,%ebp
c0001ad6:	83 ec 08             	sub    $0x8,%esp
c0001ad9:	83 ec 0c             	sub    $0xc,%esp
c0001adc:	ff 75 08             	pushl  0x8(%ebp)
c0001adf:	e8 a8 fa ff ff       	call   c000158c <disp_str>
c0001ae4:	83 c4 10             	add    $0x10,%esp
c0001ae7:	eb fe                	jmp    c0001ae7 <kernel_thread_d+0x14>

c0001ae9 <user_proc_a>:
c0001ae9:	55                   	push   %ebp
c0001aea:	89 e5                	mov    %esp,%ebp
c0001aec:	83 ec 08             	sub    $0x8,%esp
c0001aef:	83 ec 0c             	sub    $0xc,%esp
c0001af2:	68 9f b4 00 c0       	push   $0xc000b49f
c0001af7:	e8 90 fa ff ff       	call   c000158c <disp_str>
c0001afc:	83 c4 10             	add    $0x10,%esp
c0001aff:	e8 60 7a 00 00       	call   c0009564 <test_shell>
c0001b04:	eb fe                	jmp    c0001b04 <user_proc_a+0x1b>

c0001b06 <user_proc_b>:
c0001b06:	55                   	push   %ebp
c0001b07:	89 e5                	mov    %esp,%ebp
c0001b09:	83 ec 08             	sub    $0x8,%esp
c0001b0c:	83 ec 0c             	sub    $0xc,%esp
c0001b0f:	68 b1 b4 00 c0       	push   $0xc000b4b1
c0001b14:	e8 73 fa ff ff       	call   c000158c <disp_str>
c0001b19:	83 c4 10             	add    $0x10,%esp
c0001b1c:	eb fe                	jmp    c0001b1c <user_proc_b+0x16>

c0001b1e <TaskHD>:
c0001b1e:	55                   	push   %ebp
c0001b1f:	89 e5                	mov    %esp,%ebp
c0001b21:	83 ec 18             	sub    $0x18,%esp
c0001b24:	e8 67 fd ff ff       	call   c0001890 <get_running_thread_pcb>
c0001b29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b2c:	e8 32 00 00 00       	call   c0001b63 <init_hd>
c0001b31:	83 ec 0c             	sub    $0xc,%esp
c0001b34:	6a 6c                	push   $0x6c
c0001b36:	e8 69 0e 00 00       	call   c00029a4 <sys_malloc>
c0001b3b:	83 c4 10             	add    $0x10,%esp
c0001b3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b41:	83 ec 04             	sub    $0x4,%esp
c0001b44:	6a 6c                	push   $0x6c
c0001b46:	6a 00                	push   $0x0
c0001b48:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b4b:	e8 e7 a5 00 00       	call   c000c137 <Memset>
c0001b50:	83 c4 10             	add    $0x10,%esp
c0001b53:	83 ec 0c             	sub    $0xc,%esp
c0001b56:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b59:	e8 1f 00 00 00       	call   c0001b7d <hd_handle>
c0001b5e:	83 c4 10             	add    $0x10,%esp
c0001b61:	eb de                	jmp    c0001b41 <TaskHD+0x23>

c0001b63 <init_hd>:
c0001b63:	55                   	push   %ebp
c0001b64:	89 e5                	mov    %esp,%ebp
c0001b66:	83 ec 18             	sub    $0x18,%esp
c0001b69:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001b70:	e8 d7 fc ff ff       	call   c000184c <enable_8259A_casecade_irq>
c0001b75:	e8 e6 fc ff ff       	call   c0001860 <enable_8259A_slave_winchester_irq>
c0001b7a:	90                   	nop
c0001b7b:	c9                   	leave  
c0001b7c:	c3                   	ret    

c0001b7d <hd_handle>:
c0001b7d:	55                   	push   %ebp
c0001b7e:	89 e5                	mov    %esp,%ebp
c0001b80:	83 ec 18             	sub    $0x18,%esp
c0001b83:	83 ec 04             	sub    $0x4,%esp
c0001b86:	6a 12                	push   $0x12
c0001b88:	ff 75 08             	pushl  0x8(%ebp)
c0001b8b:	6a 02                	push   $0x2
c0001b8d:	e8 1c 89 00 00       	call   c000a4ae <send_rec>
c0001b92:	83 c4 10             	add    $0x10,%esp
c0001b95:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b98:	8b 40 68             	mov    0x68(%eax),%eax
c0001b9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001ba2:	0f 84 d4 00 00 00    	je     c0001c7c <hd_handle+0xff>
c0001ba8:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bab:	8b 00                	mov    (%eax),%eax
c0001bad:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001bb0:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001bb4:	74 28                	je     c0001bde <hd_handle+0x61>
c0001bb6:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001bba:	74 22                	je     c0001bde <hd_handle+0x61>
c0001bbc:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001bc0:	74 1c                	je     c0001bde <hd_handle+0x61>
c0001bc2:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001bc6:	74 16                	je     c0001bde <hd_handle+0x61>
c0001bc8:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001bcf:	74 0d                	je     c0001bde <hd_handle+0x61>
c0001bd1:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0001bd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001bdb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001bde:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001be2:	74 34                	je     c0001c18 <hd_handle+0x9b>
c0001be4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001be8:	74 2e                	je     c0001c18 <hd_handle+0x9b>
c0001bea:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001bee:	74 28                	je     c0001c18 <hd_handle+0x9b>
c0001bf0:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001bf4:	74 22                	je     c0001c18 <hd_handle+0x9b>
c0001bf6:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001bfd:	74 19                	je     c0001c18 <hd_handle+0x9b>
c0001bff:	6a 6d                	push   $0x6d
c0001c01:	68 c4 b4 00 c0       	push   $0xc000b4c4
c0001c06:	68 c4 b4 00 c0       	push   $0xc000b4c4
c0001c0b:	68 cc b4 00 c0       	push   $0xc000b4cc
c0001c10:	e8 6d 7f 00 00       	call   c0009b82 <assertion_failure>
c0001c15:	83 c4 10             	add    $0x10,%esp
c0001c18:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001c1c:	74 2c                	je     c0001c4a <hd_handle+0xcd>
c0001c1e:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001c22:	77 0e                	ja     c0001c32 <hd_handle+0xb5>
c0001c24:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001c28:	74 19                	je     c0001c43 <hd_handle+0xc6>
c0001c2a:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001c2e:	74 1a                	je     c0001c4a <hd_handle+0xcd>
c0001c30:	eb 37                	jmp    c0001c69 <hd_handle+0xec>
c0001c32:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001c36:	74 22                	je     c0001c5a <hd_handle+0xdd>
c0001c38:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001c3f:	74 3e                	je     c0001c7f <hd_handle+0x102>
c0001c41:	eb 26                	jmp    c0001c69 <hd_handle+0xec>
c0001c43:	e8 e6 06 00 00       	call   c000232e <hd_open>
c0001c48:	eb 36                	jmp    c0001c80 <hd_handle+0x103>
c0001c4a:	83 ec 0c             	sub    $0xc,%esp
c0001c4d:	ff 75 08             	pushl  0x8(%ebp)
c0001c50:	e8 93 08 00 00       	call   c00024e8 <hd_rdwt>
c0001c55:	83 c4 10             	add    $0x10,%esp
c0001c58:	eb 26                	jmp    c0001c80 <hd_handle+0x103>
c0001c5a:	83 ec 0c             	sub    $0xc,%esp
c0001c5d:	6a 00                	push   $0x0
c0001c5f:	e8 61 07 00 00       	call   c00023c5 <get_hd_ioctl>
c0001c64:	83 c4 10             	add    $0x10,%esp
c0001c67:	eb 17                	jmp    c0001c80 <hd_handle+0x103>
c0001c69:	83 ec 0c             	sub    $0xc,%esp
c0001c6c:	68 26 b5 00 c0       	push   $0xc000b526
c0001c71:	e8 c8 7e 00 00       	call   c0009b3e <spin>
c0001c76:	83 c4 10             	add    $0x10,%esp
c0001c79:	90                   	nop
c0001c7a:	eb 04                	jmp    c0001c80 <hd_handle+0x103>
c0001c7c:	90                   	nop
c0001c7d:	eb 01                	jmp    c0001c80 <hd_handle+0x103>
c0001c7f:	90                   	nop
c0001c80:	c9                   	leave  
c0001c81:	c3                   	ret    

c0001c82 <hd_cmd_out>:
c0001c82:	55                   	push   %ebp
c0001c83:	89 e5                	mov    %esp,%ebp
c0001c85:	83 ec 08             	sub    $0x8,%esp
c0001c88:	83 ec 04             	sub    $0x4,%esp
c0001c8b:	68 18 73 01 00       	push   $0x17318
c0001c90:	6a 00                	push   $0x0
c0001c92:	68 80 00 00 00       	push   $0x80
c0001c97:	e8 1f 0b 00 00       	call   c00027bb <waitfor>
c0001c9c:	83 c4 10             	add    $0x10,%esp
c0001c9f:	85 c0                	test   %eax,%eax
c0001ca1:	75 10                	jne    c0001cb3 <hd_cmd_out+0x31>
c0001ca3:	83 ec 0c             	sub    $0xc,%esp
c0001ca6:	68 38 b5 00 c0       	push   $0xc000b538
c0001cab:	e8 b4 7e 00 00       	call   c0009b64 <panic>
c0001cb0:	83 c4 10             	add    $0x10,%esp
c0001cb3:	83 ec 08             	sub    $0x8,%esp
c0001cb6:	6a 00                	push   $0x0
c0001cb8:	68 f6 03 00 00       	push   $0x3f6
c0001cbd:	e8 d0 fa ff ff       	call   c0001792 <out_byte>
c0001cc2:	83 c4 10             	add    $0x10,%esp
c0001cc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cc8:	0f b6 00             	movzbl (%eax),%eax
c0001ccb:	0f b6 c0             	movzbl %al,%eax
c0001cce:	83 ec 08             	sub    $0x8,%esp
c0001cd1:	50                   	push   %eax
c0001cd2:	68 f1 01 00 00       	push   $0x1f1
c0001cd7:	e8 b6 fa ff ff       	call   c0001792 <out_byte>
c0001cdc:	83 c4 10             	add    $0x10,%esp
c0001cdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ce2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001ce6:	0f b6 c0             	movzbl %al,%eax
c0001ce9:	83 ec 08             	sub    $0x8,%esp
c0001cec:	50                   	push   %eax
c0001ced:	68 f2 01 00 00       	push   $0x1f2
c0001cf2:	e8 9b fa ff ff       	call   c0001792 <out_byte>
c0001cf7:	83 c4 10             	add    $0x10,%esp
c0001cfa:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cfd:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001d01:	0f b6 c0             	movzbl %al,%eax
c0001d04:	83 ec 08             	sub    $0x8,%esp
c0001d07:	50                   	push   %eax
c0001d08:	68 f3 01 00 00       	push   $0x1f3
c0001d0d:	e8 80 fa ff ff       	call   c0001792 <out_byte>
c0001d12:	83 c4 10             	add    $0x10,%esp
c0001d15:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d18:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001d1c:	0f b6 c0             	movzbl %al,%eax
c0001d1f:	83 ec 08             	sub    $0x8,%esp
c0001d22:	50                   	push   %eax
c0001d23:	68 f4 01 00 00       	push   $0x1f4
c0001d28:	e8 65 fa ff ff       	call   c0001792 <out_byte>
c0001d2d:	83 c4 10             	add    $0x10,%esp
c0001d30:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d33:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001d37:	0f b6 c0             	movzbl %al,%eax
c0001d3a:	83 ec 08             	sub    $0x8,%esp
c0001d3d:	50                   	push   %eax
c0001d3e:	68 f5 01 00 00       	push   $0x1f5
c0001d43:	e8 4a fa ff ff       	call   c0001792 <out_byte>
c0001d48:	83 c4 10             	add    $0x10,%esp
c0001d4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d4e:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001d52:	0f b6 c0             	movzbl %al,%eax
c0001d55:	83 ec 08             	sub    $0x8,%esp
c0001d58:	50                   	push   %eax
c0001d59:	68 f6 01 00 00       	push   $0x1f6
c0001d5e:	e8 2f fa ff ff       	call   c0001792 <out_byte>
c0001d63:	83 c4 10             	add    $0x10,%esp
c0001d66:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d69:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001d6d:	0f b6 c0             	movzbl %al,%eax
c0001d70:	83 ec 08             	sub    $0x8,%esp
c0001d73:	50                   	push   %eax
c0001d74:	68 f7 01 00 00       	push   $0x1f7
c0001d79:	e8 14 fa ff ff       	call   c0001792 <out_byte>
c0001d7e:	83 c4 10             	add    $0x10,%esp
c0001d81:	90                   	nop
c0001d82:	c9                   	leave  
c0001d83:	c3                   	ret    

c0001d84 <hd_identify>:
c0001d84:	55                   	push   %ebp
c0001d85:	89 e5                	mov    %esp,%ebp
c0001d87:	53                   	push   %ebx
c0001d88:	83 ec 24             	sub    $0x24,%esp
c0001d8b:	89 e0                	mov    %esp,%eax
c0001d8d:	89 c3                	mov    %eax,%ebx
c0001d8f:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001d93:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001d97:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001d9b:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001d9f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001da3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001da6:	c1 e0 04             	shl    $0x4,%eax
c0001da9:	83 c8 e0             	or     $0xffffffe0,%eax
c0001dac:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001daf:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001db3:	83 ec 0c             	sub    $0xc,%esp
c0001db6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001db9:	50                   	push   %eax
c0001dba:	e8 c3 fe ff ff       	call   c0001c82 <hd_cmd_out>
c0001dbf:	83 c4 10             	add    $0x10,%esp
c0001dc2:	e8 d0 06 00 00       	call   c0002497 <interrupt_wait>
c0001dc7:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001dce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dd1:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001dd4:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001dd7:	89 c2                	mov    %eax,%edx
c0001dd9:	b8 10 00 00 00       	mov    $0x10,%eax
c0001dde:	83 e8 01             	sub    $0x1,%eax
c0001de1:	01 d0                	add    %edx,%eax
c0001de3:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001de8:	ba 00 00 00 00       	mov    $0x0,%edx
c0001ded:	f7 f1                	div    %ecx
c0001def:	6b c0 10             	imul   $0x10,%eax,%eax
c0001df2:	29 c4                	sub    %eax,%esp
c0001df4:	89 e0                	mov    %esp,%eax
c0001df6:	83 c0 00             	add    $0x0,%eax
c0001df9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001dfc:	83 ec 04             	sub    $0x4,%esp
c0001dff:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e02:	6a 00                	push   $0x0
c0001e04:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e07:	e8 2b a3 00 00       	call   c000c137 <Memset>
c0001e0c:	83 c4 10             	add    $0x10,%esp
c0001e0f:	83 ec 04             	sub    $0x4,%esp
c0001e12:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e15:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e18:	68 f0 01 00 00       	push   $0x1f0
c0001e1d:	e8 69 a3 00 00       	call   c000c18b <read_port>
c0001e22:	83 c4 10             	add    $0x10,%esp
c0001e25:	83 ec 0c             	sub    $0xc,%esp
c0001e28:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e2b:	e8 0b 00 00 00       	call   c0001e3b <print_hdinfo>
c0001e30:	83 c4 10             	add    $0x10,%esp
c0001e33:	89 dc                	mov    %ebx,%esp
c0001e35:	90                   	nop
c0001e36:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001e39:	c9                   	leave  
c0001e3a:	c3                   	ret    

c0001e3b <print_hdinfo>:
c0001e3b:	55                   	push   %ebp
c0001e3c:	89 e5                	mov    %esp,%ebp
c0001e3e:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001e44:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001e4a:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001e50:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001e57:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001e5e:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001e65:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001e6c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001e73:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001e79:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001e7f:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001e86:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001e8d:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001e94:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001e9b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001ea2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001ea9:	e9 8f 00 00 00       	jmp    c0001f3d <print_hdinfo+0x102>
c0001eae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001eb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001eb8:	89 d0                	mov    %edx,%eax
c0001eba:	01 c0                	add    %eax,%eax
c0001ebc:	01 d0                	add    %edx,%eax
c0001ebe:	c1 e0 03             	shl    $0x3,%eax
c0001ec1:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ec4:	01 c8                	add    %ecx,%eax
c0001ec6:	83 e8 44             	sub    $0x44,%eax
c0001ec9:	0f b7 00             	movzwl (%eax),%eax
c0001ecc:	0f b7 c0             	movzwl %ax,%eax
c0001ecf:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001ed2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ed5:	01 d0                	add    %edx,%eax
c0001ed7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001eda:	eb 30                	jmp    c0001f0c <print_hdinfo+0xd1>
c0001edc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001edf:	8d 50 01             	lea    0x1(%eax),%edx
c0001ee2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001ee5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001ee8:	83 c2 01             	add    $0x1,%edx
c0001eeb:	0f b6 00             	movzbl (%eax),%eax
c0001eee:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001ef2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001ef5:	8d 50 01             	lea    0x1(%eax),%edx
c0001ef8:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001efb:	0f b6 00             	movzbl (%eax),%eax
c0001efe:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001f01:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001f04:	01 ca                	add    %ecx,%edx
c0001f06:	88 02                	mov    %al,(%edx)
c0001f08:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001f0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001f0f:	89 d0                	mov    %edx,%eax
c0001f11:	01 c0                	add    %eax,%eax
c0001f13:	01 d0                	add    %edx,%eax
c0001f15:	c1 e0 03             	shl    $0x3,%eax
c0001f18:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001f1b:	01 c8                	add    %ecx,%eax
c0001f1d:	83 e8 42             	sub    $0x42,%eax
c0001f20:	0f b7 00             	movzwl (%eax),%eax
c0001f23:	66 d1 e8             	shr    %ax
c0001f26:	0f b7 c0             	movzwl %ax,%eax
c0001f29:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001f2c:	7c ae                	jl     c0001edc <print_hdinfo+0xa1>
c0001f2e:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001f31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001f34:	01 d0                	add    %edx,%eax
c0001f36:	c6 00 00             	movb   $0x0,(%eax)
c0001f39:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001f3d:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001f41:	0f 8e 67 ff ff ff    	jle    c0001eae <print_hdinfo+0x73>
c0001f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f4a:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001f4e:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001f52:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001f56:	66 c1 e8 08          	shr    $0x8,%ax
c0001f5a:	66 85 c0             	test   %ax,%ax
c0001f5d:	0f 95 c0             	setne  %al
c0001f60:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001f63:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001f6a:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001f70:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001f74:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001f78:	75 15                	jne    c0001f8f <print_hdinfo+0x154>
c0001f7a:	83 ec 08             	sub    $0x8,%esp
c0001f7d:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001f80:	50                   	push   %eax
c0001f81:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f84:	50                   	push   %eax
c0001f85:	e8 cc a1 00 00       	call   c000c156 <Strcpy>
c0001f8a:	83 c4 10             	add    $0x10,%esp
c0001f8d:	eb 13                	jmp    c0001fa2 <print_hdinfo+0x167>
c0001f8f:	83 ec 08             	sub    $0x8,%esp
c0001f92:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001f95:	50                   	push   %eax
c0001f96:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f99:	50                   	push   %eax
c0001f9a:	e8 b7 a1 00 00       	call   c000c156 <Strcpy>
c0001f9f:	83 c4 10             	add    $0x10,%esp
c0001fa2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fa5:	83 c0 7a             	add    $0x7a,%eax
c0001fa8:	0f b7 00             	movzwl (%eax),%eax
c0001fab:	0f b7 d0             	movzwl %ax,%edx
c0001fae:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fb1:	83 c0 78             	add    $0x78,%eax
c0001fb4:	0f b7 00             	movzwl (%eax),%eax
c0001fb7:	0f b7 c0             	movzwl %ax,%eax
c0001fba:	83 c0 10             	add    $0x10,%eax
c0001fbd:	89 c1                	mov    %eax,%ecx
c0001fbf:	d3 e2                	shl    %cl,%edx
c0001fc1:	89 d0                	mov    %edx,%eax
c0001fc3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001fc6:	90                   	nop
c0001fc7:	c9                   	leave  
c0001fc8:	c3                   	ret    

c0001fc9 <print_dpt_entry>:
c0001fc9:	55                   	push   %ebp
c0001fca:	89 e5                	mov    %esp,%ebp
c0001fcc:	83 ec 08             	sub    $0x8,%esp
c0001fcf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fd2:	8b 40 08             	mov    0x8(%eax),%eax
c0001fd5:	83 ec 08             	sub    $0x8,%esp
c0001fd8:	50                   	push   %eax
c0001fd9:	68 42 b5 00 c0       	push   $0xc000b542
c0001fde:	e8 42 78 00 00       	call   c0009825 <Printf>
c0001fe3:	83 c4 10             	add    $0x10,%esp
c0001fe6:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fe9:	8b 40 0c             	mov    0xc(%eax),%eax
c0001fec:	83 ec 08             	sub    $0x8,%esp
c0001fef:	50                   	push   %eax
c0001ff0:	68 4a b5 00 c0       	push   $0xc000b54a
c0001ff5:	e8 2b 78 00 00       	call   c0009825 <Printf>
c0001ffa:	83 c4 10             	add    $0x10,%esp
c0001ffd:	8b 45 08             	mov    0x8(%ebp),%eax
c0002000:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0002004:	0f b6 c0             	movzbl %al,%eax
c0002007:	83 ec 08             	sub    $0x8,%esp
c000200a:	50                   	push   %eax
c000200b:	68 5b b5 00 c0       	push   $0xc000b55b
c0002010:	e8 10 78 00 00       	call   c0009825 <Printf>
c0002015:	83 c4 10             	add    $0x10,%esp
c0002018:	8b 45 08             	mov    0x8(%ebp),%eax
c000201b:	0f b6 00             	movzbl (%eax),%eax
c000201e:	0f b6 c0             	movzbl %al,%eax
c0002021:	83 ec 08             	sub    $0x8,%esp
c0002024:	50                   	push   %eax
c0002025:	68 69 b5 00 c0       	push   $0xc000b569
c000202a:	e8 f6 77 00 00       	call   c0009825 <Printf>
c000202f:	83 c4 10             	add    $0x10,%esp
c0002032:	90                   	nop
c0002033:	c9                   	leave  
c0002034:	c3                   	ret    

c0002035 <get_partition_table>:
c0002035:	55                   	push   %ebp
c0002036:	89 e5                	mov    %esp,%ebp
c0002038:	53                   	push   %ebx
c0002039:	83 ec 24             	sub    $0x24,%esp
c000203c:	89 e0                	mov    %esp,%eax
c000203e:	89 c3                	mov    %eax,%ebx
c0002040:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0002044:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0002048:	8b 45 0c             	mov    0xc(%ebp),%eax
c000204b:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000204e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002051:	c1 f8 08             	sar    $0x8,%eax
c0002054:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0002057:	8b 45 0c             	mov    0xc(%ebp),%eax
c000205a:	c1 f8 10             	sar    $0x10,%eax
c000205d:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0002060:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002063:	c1 f8 18             	sar    $0x18,%eax
c0002066:	89 c2                	mov    %eax,%edx
c0002068:	8b 45 08             	mov    0x8(%ebp),%eax
c000206b:	c1 e0 04             	shl    $0x4,%eax
c000206e:	09 d0                	or     %edx,%eax
c0002070:	83 c8 e0             	or     $0xffffffe0,%eax
c0002073:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0002076:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c000207a:	83 ec 0c             	sub    $0xc,%esp
c000207d:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0002080:	50                   	push   %eax
c0002081:	e8 fc fb ff ff       	call   c0001c82 <hd_cmd_out>
c0002086:	83 c4 10             	add    $0x10,%esp
c0002089:	e8 09 04 00 00       	call   c0002497 <interrupt_wait>
c000208e:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0002095:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002098:	8d 50 ff             	lea    -0x1(%eax),%edx
c000209b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c000209e:	89 c2                	mov    %eax,%edx
c00020a0:	b8 10 00 00 00       	mov    $0x10,%eax
c00020a5:	83 e8 01             	sub    $0x1,%eax
c00020a8:	01 d0                	add    %edx,%eax
c00020aa:	b9 10 00 00 00       	mov    $0x10,%ecx
c00020af:	ba 00 00 00 00       	mov    $0x0,%edx
c00020b4:	f7 f1                	div    %ecx
c00020b6:	6b c0 10             	imul   $0x10,%eax,%eax
c00020b9:	29 c4                	sub    %eax,%esp
c00020bb:	89 e0                	mov    %esp,%eax
c00020bd:	83 c0 00             	add    $0x0,%eax
c00020c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00020c3:	83 ec 04             	sub    $0x4,%esp
c00020c6:	ff 75 f4             	pushl  -0xc(%ebp)
c00020c9:	6a 00                	push   $0x0
c00020cb:	ff 75 ec             	pushl  -0x14(%ebp)
c00020ce:	e8 64 a0 00 00       	call   c000c137 <Memset>
c00020d3:	83 c4 10             	add    $0x10,%esp
c00020d6:	83 ec 04             	sub    $0x4,%esp
c00020d9:	ff 75 f4             	pushl  -0xc(%ebp)
c00020dc:	ff 75 ec             	pushl  -0x14(%ebp)
c00020df:	68 f0 01 00 00       	push   $0x1f0
c00020e4:	e8 a2 a0 00 00       	call   c000c18b <read_port>
c00020e9:	83 c4 10             	add    $0x10,%esp
c00020ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00020ef:	05 be 01 00 00       	add    $0x1be,%eax
c00020f4:	83 ec 04             	sub    $0x4,%esp
c00020f7:	6a 40                	push   $0x40
c00020f9:	50                   	push   %eax
c00020fa:	ff 75 10             	pushl  0x10(%ebp)
c00020fd:	e8 5f 5b 00 00       	call   c0007c61 <Memcpy>
c0002102:	83 c4 10             	add    $0x10,%esp
c0002105:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c000210c:	89 dc                	mov    %ebx,%esp
c000210e:	90                   	nop
c000210f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0002112:	c9                   	leave  
c0002113:	c3                   	ret    

c0002114 <partition>:
c0002114:	55                   	push   %ebp
c0002115:	89 e5                	mov    %esp,%ebp
c0002117:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000211d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002120:	88 45 84             	mov    %al,-0x7c(%ebp)
c0002123:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002127:	7f 19                	jg     c0002142 <partition+0x2e>
c0002129:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000212c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002131:	89 c8                	mov    %ecx,%eax
c0002133:	f7 ea                	imul   %edx
c0002135:	d1 fa                	sar    %edx
c0002137:	89 c8                	mov    %ecx,%eax
c0002139:	c1 f8 1f             	sar    $0x1f,%eax
c000213c:	29 c2                	sub    %eax,%edx
c000213e:	89 d0                	mov    %edx,%eax
c0002140:	eb 11                	jmp    c0002153 <partition+0x3f>
c0002142:	8b 45 08             	mov    0x8(%ebp),%eax
c0002145:	83 e8 10             	sub    $0x10,%eax
c0002148:	8d 50 3f             	lea    0x3f(%eax),%edx
c000214b:	85 c0                	test   %eax,%eax
c000214d:	0f 48 c2             	cmovs  %edx,%eax
c0002150:	c1 f8 06             	sar    $0x6,%eax
c0002153:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002156:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c000215a:	0f 85 cc 00 00 00    	jne    c000222c <partition+0x118>
c0002160:	83 ec 04             	sub    $0x4,%esp
c0002163:	6a 40                	push   $0x40
c0002165:	6a 00                	push   $0x0
c0002167:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000216a:	50                   	push   %eax
c000216b:	e8 c7 9f 00 00       	call   c000c137 <Memset>
c0002170:	83 c4 10             	add    $0x10,%esp
c0002173:	83 ec 04             	sub    $0x4,%esp
c0002176:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002179:	50                   	push   %eax
c000217a:	6a 00                	push   $0x0
c000217c:	ff 75 e8             	pushl  -0x18(%ebp)
c000217f:	e8 b1 fe ff ff       	call   c0002035 <get_partition_table>
c0002184:	83 c4 10             	add    $0x10,%esp
c0002187:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000218e:	e9 8a 00 00 00       	jmp    c000221d <partition+0x109>
c0002193:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002196:	83 c0 01             	add    $0x1,%eax
c0002199:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000219c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000219f:	c1 e0 04             	shl    $0x4,%eax
c00021a2:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00021a5:	01 c8                	add    %ecx,%eax
c00021a7:	83 e8 5c             	sub    $0x5c,%eax
c00021aa:	8b 00                	mov    (%eax),%eax
c00021ac:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00021af:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021b2:	c1 e1 03             	shl    $0x3,%ecx
c00021b5:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021bb:	01 ca                	add    %ecx,%edx
c00021bd:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c00021c3:	89 02                	mov    %eax,(%edx)
c00021c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021c8:	c1 e0 04             	shl    $0x4,%eax
c00021cb:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00021ce:	01 c8                	add    %ecx,%eax
c00021d0:	83 e8 58             	sub    $0x58,%eax
c00021d3:	8b 00                	mov    (%eax),%eax
c00021d5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00021d8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021db:	c1 e1 03             	shl    $0x3,%ecx
c00021de:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021e4:	01 ca                	add    %ecx,%edx
c00021e6:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c00021ec:	89 02                	mov    %eax,(%edx)
c00021ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021f1:	c1 e0 04             	shl    $0x4,%eax
c00021f4:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00021f7:	01 c8                	add    %ecx,%eax
c00021f9:	83 e8 60             	sub    $0x60,%eax
c00021fc:	0f b6 00             	movzbl (%eax),%eax
c00021ff:	3c 05                	cmp    $0x5,%al
c0002201:	75 16                	jne    c0002219 <partition+0x105>
c0002203:	8b 55 08             	mov    0x8(%ebp),%edx
c0002206:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002209:	01 d0                	add    %edx,%eax
c000220b:	83 ec 08             	sub    $0x8,%esp
c000220e:	6a 01                	push   $0x1
c0002210:	50                   	push   %eax
c0002211:	e8 fe fe ff ff       	call   c0002114 <partition>
c0002216:	83 c4 10             	add    $0x10,%esp
c0002219:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000221d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002221:	0f 8e 6c ff ff ff    	jle    c0002193 <partition+0x7f>
c0002227:	e9 ff 00 00 00       	jmp    c000232b <partition+0x217>
c000222c:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0002230:	0f 85 f5 00 00 00    	jne    c000232b <partition+0x217>
c0002236:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002239:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000223e:	89 c8                	mov    %ecx,%eax
c0002240:	f7 ea                	imul   %edx
c0002242:	d1 fa                	sar    %edx
c0002244:	89 c8                	mov    %ecx,%eax
c0002246:	c1 f8 1f             	sar    $0x1f,%eax
c0002249:	29 c2                	sub    %eax,%edx
c000224b:	89 d0                	mov    %edx,%eax
c000224d:	c1 e0 02             	shl    $0x2,%eax
c0002250:	01 d0                	add    %edx,%eax
c0002252:	29 c1                	sub    %eax,%ecx
c0002254:	89 c8                	mov    %ecx,%eax
c0002256:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002259:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000225c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000225f:	c1 e2 03             	shl    $0x3,%edx
c0002262:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002268:	01 d0                	add    %edx,%eax
c000226a:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000226f:	8b 00                	mov    (%eax),%eax
c0002271:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002274:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002277:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000227a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000227d:	83 e8 01             	sub    $0x1,%eax
c0002280:	c1 e0 04             	shl    $0x4,%eax
c0002283:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002286:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000228d:	e9 8c 00 00 00       	jmp    c000231e <partition+0x20a>
c0002292:	83 ec 04             	sub    $0x4,%esp
c0002295:	6a 40                	push   $0x40
c0002297:	6a 00                	push   $0x0
c0002299:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000229c:	50                   	push   %eax
c000229d:	e8 95 9e 00 00       	call   c000c137 <Memset>
c00022a2:	83 c4 10             	add    $0x10,%esp
c00022a5:	83 ec 04             	sub    $0x4,%esp
c00022a8:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00022ab:	50                   	push   %eax
c00022ac:	ff 75 f0             	pushl  -0x10(%ebp)
c00022af:	ff 75 e8             	pushl  -0x18(%ebp)
c00022b2:	e8 7e fd ff ff       	call   c0002035 <get_partition_table>
c00022b7:	83 c4 10             	add    $0x10,%esp
c00022ba:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00022bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00022c0:	01 d0                	add    %edx,%eax
c00022c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00022c5:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00022c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00022cb:	01 c2                	add    %eax,%edx
c00022cd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00022d0:	8d 48 04             	lea    0x4(%eax),%ecx
c00022d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00022d6:	c1 e1 03             	shl    $0x3,%ecx
c00022d9:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022df:	01 c8                	add    %ecx,%eax
c00022e1:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00022e6:	89 10                	mov    %edx,(%eax)
c00022e8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00022eb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00022ee:	8d 4a 04             	lea    0x4(%edx),%ecx
c00022f1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00022f4:	c1 e1 03             	shl    $0x3,%ecx
c00022f7:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00022fd:	01 ca                	add    %ecx,%edx
c00022ff:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002305:	89 02                	mov    %eax,(%edx)
c0002307:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c000230b:	84 c0                	test   %al,%al
c000230d:	74 1b                	je     c000232a <partition+0x216>
c000230f:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0002312:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002315:	01 d0                	add    %edx,%eax
c0002317:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000231a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000231e:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0002322:	0f 8e 6a ff ff ff    	jle    c0002292 <partition+0x17e>
c0002328:	eb 01                	jmp    c000232b <partition+0x217>
c000232a:	90                   	nop
c000232b:	90                   	nop
c000232c:	c9                   	leave  
c000232d:	c3                   	ret    

c000232e <hd_open>:
c000232e:	55                   	push   %ebp
c000232f:	89 e5                	mov    %esp,%ebp
c0002331:	83 ec 18             	sub    $0x18,%esp
c0002334:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000233b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000233e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002344:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0002349:	8b 00                	mov    (%eax),%eax
c000234b:	8d 50 01             	lea    0x1(%eax),%edx
c000234e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002351:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002357:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c000235c:	89 10                	mov    %edx,(%eax)
c000235e:	83 ec 0c             	sub    $0xc,%esp
c0002361:	6a 00                	push   $0x0
c0002363:	e8 1c fa ff ff       	call   c0001d84 <hd_identify>
c0002368:	83 c4 10             	add    $0x10,%esp
c000236b:	83 ec 08             	sub    $0x8,%esp
c000236e:	6a 00                	push   $0x0
c0002370:	6a 00                	push   $0x0
c0002372:	e8 9d fd ff ff       	call   c0002114 <partition>
c0002377:	83 c4 10             	add    $0x10,%esp
c000237a:	83 ec 0c             	sub    $0xc,%esp
c000237d:	6a 6c                	push   $0x6c
c000237f:	e8 20 06 00 00       	call   c00029a4 <sys_malloc>
c0002384:	83 c4 10             	add    $0x10,%esp
c0002387:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000238a:	83 ec 04             	sub    $0x4,%esp
c000238d:	6a 6c                	push   $0x6c
c000238f:	6a 00                	push   $0x0
c0002391:	ff 75 f0             	pushl  -0x10(%ebp)
c0002394:	e8 9e 9d 00 00       	call   c000c137 <Memset>
c0002399:	83 c4 10             	add    $0x10,%esp
c000239c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000239f:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00023a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023a9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00023b0:	83 ec 04             	sub    $0x4,%esp
c00023b3:	6a 02                	push   $0x2
c00023b5:	ff 75 f0             	pushl  -0x10(%ebp)
c00023b8:	6a 01                	push   $0x1
c00023ba:	e8 ef 80 00 00       	call   c000a4ae <send_rec>
c00023bf:	83 c4 10             	add    $0x10,%esp
c00023c2:	90                   	nop
c00023c3:	c9                   	leave  
c00023c4:	c3                   	ret    

c00023c5 <get_hd_ioctl>:
c00023c5:	55                   	push   %ebp
c00023c6:	89 e5                	mov    %esp,%ebp
c00023c8:	83 ec 18             	sub    $0x18,%esp
c00023cb:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00023cf:	7f 19                	jg     c00023ea <get_hd_ioctl+0x25>
c00023d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00023d4:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00023d9:	89 c8                	mov    %ecx,%eax
c00023db:	f7 ea                	imul   %edx
c00023dd:	d1 fa                	sar    %edx
c00023df:	89 c8                	mov    %ecx,%eax
c00023e1:	c1 f8 1f             	sar    $0x1f,%eax
c00023e4:	29 c2                	sub    %eax,%edx
c00023e6:	89 d0                	mov    %edx,%eax
c00023e8:	eb 11                	jmp    c00023fb <get_hd_ioctl+0x36>
c00023ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00023ed:	83 e8 10             	sub    $0x10,%eax
c00023f0:	8d 50 3f             	lea    0x3f(%eax),%edx
c00023f3:	85 c0                	test   %eax,%eax
c00023f5:	0f 48 c2             	cmovs  %edx,%eax
c00023f8:	c1 f8 06             	sar    $0x6,%eax
c00023fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00023fe:	8b 55 08             	mov    0x8(%ebp),%edx
c0002401:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002404:	c1 e2 03             	shl    $0x3,%edx
c0002407:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000240d:	01 d0                	add    %edx,%eax
c000240f:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0002414:	8b 00                	mov    (%eax),%eax
c0002416:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002419:	83 ec 0c             	sub    $0xc,%esp
c000241c:	6a 6c                	push   $0x6c
c000241e:	e8 81 05 00 00       	call   c00029a4 <sys_malloc>
c0002423:	83 c4 10             	add    $0x10,%esp
c0002426:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002429:	83 ec 04             	sub    $0x4,%esp
c000242c:	6a 6c                	push   $0x6c
c000242e:	6a 00                	push   $0x0
c0002430:	ff 75 ec             	pushl  -0x14(%ebp)
c0002433:	e8 ff 9c 00 00       	call   c000c137 <Memset>
c0002438:	83 c4 10             	add    $0x10,%esp
c000243b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000243e:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002445:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002448:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000244f:	83 ec 04             	sub    $0x4,%esp
c0002452:	6a 02                	push   $0x2
c0002454:	ff 75 ec             	pushl  -0x14(%ebp)
c0002457:	6a 01                	push   $0x1
c0002459:	e8 50 80 00 00       	call   c000a4ae <send_rec>
c000245e:	83 c4 10             	add    $0x10,%esp
c0002461:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002464:	c9                   	leave  
c0002465:	c3                   	ret    

c0002466 <wait_for>:
c0002466:	55                   	push   %ebp
c0002467:	89 e5                	mov    %esp,%ebp
c0002469:	83 ec 08             	sub    $0x8,%esp
c000246c:	83 ec 04             	sub    $0x4,%esp
c000246f:	68 20 4e 00 00       	push   $0x4e20
c0002474:	6a 08                	push   $0x8
c0002476:	6a 08                	push   $0x8
c0002478:	e8 3e 03 00 00       	call   c00027bb <waitfor>
c000247d:	83 c4 10             	add    $0x10,%esp
c0002480:	85 c0                	test   %eax,%eax
c0002482:	75 10                	jne    c0002494 <wait_for+0x2e>
c0002484:	83 ec 0c             	sub    $0xc,%esp
c0002487:	68 74 b5 00 c0       	push   $0xc000b574
c000248c:	e8 d3 76 00 00       	call   c0009b64 <panic>
c0002491:	83 c4 10             	add    $0x10,%esp
c0002494:	90                   	nop
c0002495:	c9                   	leave  
c0002496:	c3                   	ret    

c0002497 <interrupt_wait>:
c0002497:	55                   	push   %ebp
c0002498:	89 e5                	mov    %esp,%ebp
c000249a:	83 ec 18             	sub    $0x18,%esp
c000249d:	83 ec 0c             	sub    $0xc,%esp
c00024a0:	6a 6c                	push   $0x6c
c00024a2:	e8 fd 04 00 00       	call   c00029a4 <sys_malloc>
c00024a7:	83 c4 10             	add    $0x10,%esp
c00024aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024ad:	83 ec 04             	sub    $0x4,%esp
c00024b0:	6a 6c                	push   $0x6c
c00024b2:	6a 00                	push   $0x0
c00024b4:	ff 75 f4             	pushl  -0xc(%ebp)
c00024b7:	e8 7b 9c 00 00       	call   c000c137 <Memset>
c00024bc:	83 c4 10             	add    $0x10,%esp
c00024bf:	83 ec 04             	sub    $0x4,%esp
c00024c2:	68 13 02 00 00       	push   $0x213
c00024c7:	ff 75 f4             	pushl  -0xc(%ebp)
c00024ca:	6a 02                	push   $0x2
c00024cc:	e8 dd 7f 00 00       	call   c000a4ae <send_rec>
c00024d1:	83 c4 10             	add    $0x10,%esp
c00024d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024d7:	83 ec 08             	sub    $0x8,%esp
c00024da:	6a 6c                	push   $0x6c
c00024dc:	50                   	push   %eax
c00024dd:	e8 58 52 00 00       	call   c000773a <sys_free>
c00024e2:	83 c4 10             	add    $0x10,%esp
c00024e5:	90                   	nop
c00024e6:	c9                   	leave  
c00024e7:	c3                   	ret    

c00024e8 <hd_rdwt>:
c00024e8:	55                   	push   %ebp
c00024e9:	89 e5                	mov    %esp,%ebp
c00024eb:	83 ec 48             	sub    $0x48,%esp
c00024ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00024f1:	8b 40 18             	mov    0x18(%eax),%eax
c00024f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00024f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00024fa:	8b 40 14             	mov    0x14(%eax),%eax
c00024fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002500:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002504:	7f 19                	jg     c000251f <hd_rdwt+0x37>
c0002506:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002509:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000250e:	89 c8                	mov    %ecx,%eax
c0002510:	f7 ea                	imul   %edx
c0002512:	d1 fa                	sar    %edx
c0002514:	89 c8                	mov    %ecx,%eax
c0002516:	c1 f8 1f             	sar    $0x1f,%eax
c0002519:	29 c2                	sub    %eax,%edx
c000251b:	89 d0                	mov    %edx,%eax
c000251d:	eb 11                	jmp    c0002530 <hd_rdwt+0x48>
c000251f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002522:	83 e8 10             	sub    $0x10,%eax
c0002525:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002528:	85 c0                	test   %eax,%eax
c000252a:	0f 48 c2             	cmovs  %edx,%eax
c000252d:	c1 f8 06             	sar    $0x6,%eax
c0002530:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002533:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002536:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002539:	89 d0                	mov    %edx,%eax
c000253b:	c1 f8 1f             	sar    $0x1f,%eax
c000253e:	c1 e8 1a             	shr    $0x1a,%eax
c0002541:	01 c2                	add    %eax,%edx
c0002543:	83 e2 3f             	and    $0x3f,%edx
c0002546:	29 c2                	sub    %eax,%edx
c0002548:	89 d0                	mov    %edx,%eax
c000254a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000254d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002550:	c1 e8 09             	shr    $0x9,%eax
c0002553:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002556:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c000255a:	7f 1a                	jg     c0002576 <hd_rdwt+0x8e>
c000255c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000255f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002562:	c1 e2 03             	shl    $0x3,%edx
c0002565:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000256b:	01 d0                	add    %edx,%eax
c000256d:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002572:	8b 00                	mov    (%eax),%eax
c0002574:	eb 1b                	jmp    c0002591 <hd_rdwt+0xa9>
c0002576:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002579:	8d 50 04             	lea    0x4(%eax),%edx
c000257c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000257f:	c1 e2 03             	shl    $0x3,%edx
c0002582:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002588:	01 d0                	add    %edx,%eax
c000258a:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000258f:	8b 00                	mov    (%eax),%eax
c0002591:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0002594:	01 d0                	add    %edx,%eax
c0002596:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002599:	8b 45 08             	mov    0x8(%ebp),%eax
c000259c:	8b 40 0c             	mov    0xc(%eax),%eax
c000259f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00025a2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025a5:	05 ff 01 00 00       	add    $0x1ff,%eax
c00025aa:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00025b0:	85 c0                	test   %eax,%eax
c00025b2:	0f 48 c2             	cmovs  %edx,%eax
c00025b5:	c1 f8 09             	sar    $0x9,%eax
c00025b8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00025bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00025c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00025c4:	8b 40 10             	mov    0x10(%eax),%eax
c00025c7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00025ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00025cd:	8b 00                	mov    (%eax),%eax
c00025cf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00025d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025d5:	83 ec 08             	sub    $0x8,%esp
c00025d8:	50                   	push   %eax
c00025d9:	ff 75 d0             	pushl  -0x30(%ebp)
c00025dc:	e8 cf 4b 00 00       	call   c00071b0 <alloc_virtual_memory>
c00025e1:	83 c4 10             	add    $0x10,%esp
c00025e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00025e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00025ea:	8b 40 68             	mov    0x68(%eax),%eax
c00025ed:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00025f0:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00025f4:	74 22                	je     c0002618 <hd_rdwt+0x130>
c00025f6:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00025fa:	74 1c                	je     c0002618 <hd_rdwt+0x130>
c00025fc:	68 af 01 00 00       	push   $0x1af
c0002601:	68 c4 b4 00 c0       	push   $0xc000b4c4
c0002606:	68 c4 b4 00 c0       	push   $0xc000b4c4
c000260b:	68 86 b5 00 c0       	push   $0xc000b586
c0002610:	e8 6d 75 00 00       	call   c0009b82 <assertion_failure>
c0002615:	83 c4 10             	add    $0x10,%esp
c0002618:	c6 45 b9 00          	movb   $0x0,-0x47(%ebp)
c000261c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000261f:	88 45 ba             	mov    %al,-0x46(%ebp)
c0002622:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002625:	88 45 bb             	mov    %al,-0x45(%ebp)
c0002628:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000262b:	c1 f8 08             	sar    $0x8,%eax
c000262e:	88 45 bc             	mov    %al,-0x44(%ebp)
c0002631:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002634:	c1 f8 10             	sar    $0x10,%eax
c0002637:	88 45 bd             	mov    %al,-0x43(%ebp)
c000263a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000263d:	c1 f8 18             	sar    $0x18,%eax
c0002640:	83 e0 0f             	and    $0xf,%eax
c0002643:	83 c8 e0             	or     $0xffffffe0,%eax
c0002646:	88 45 be             	mov    %al,-0x42(%ebp)
c0002649:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000264d:	75 07                	jne    c0002656 <hd_rdwt+0x16e>
c000264f:	b8 20 00 00 00       	mov    $0x20,%eax
c0002654:	eb 05                	jmp    c000265b <hd_rdwt+0x173>
c0002656:	b8 30 00 00 00       	mov    $0x30,%eax
c000265b:	88 45 bf             	mov    %al,-0x41(%ebp)
c000265e:	0f b6 45 bf          	movzbl -0x41(%ebp),%eax
c0002662:	3c 20                	cmp    $0x20,%al
c0002664:	74 24                	je     c000268a <hd_rdwt+0x1a2>
c0002666:	0f b6 45 bf          	movzbl -0x41(%ebp),%eax
c000266a:	3c 30                	cmp    $0x30,%al
c000266c:	74 1c                	je     c000268a <hd_rdwt+0x1a2>
c000266e:	68 bd 01 00 00       	push   $0x1bd
c0002673:	68 c4 b4 00 c0       	push   $0xc000b4c4
c0002678:	68 c4 b4 00 c0       	push   $0xc000b4c4
c000267d:	68 a4 b5 00 c0       	push   $0xc000b5a4
c0002682:	e8 fb 74 00 00       	call   c0009b82 <assertion_failure>
c0002687:	83 c4 10             	add    $0x10,%esp
c000268a:	83 ec 0c             	sub    $0xc,%esp
c000268d:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0002690:	50                   	push   %eax
c0002691:	e8 ec f5 ff ff       	call   c0001c82 <hd_cmd_out>
c0002696:	83 c4 10             	add    $0x10,%esp
c0002699:	e9 9c 00 00 00       	jmp    c000273a <hd_rdwt+0x252>
c000269e:	b8 00 02 00 00       	mov    $0x200,%eax
c00026a3:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00026aa:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00026ae:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00026b1:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00026b5:	75 51                	jne    c0002708 <hd_rdwt+0x220>
c00026b7:	e8 aa fd ff ff       	call   c0002466 <wait_for>
c00026bc:	e8 d6 fd ff ff       	call   c0002497 <interrupt_wait>
c00026c1:	83 ec 04             	sub    $0x4,%esp
c00026c4:	ff 75 c4             	pushl  -0x3c(%ebp)
c00026c7:	6a 00                	push   $0x0
c00026c9:	68 80 21 01 c0       	push   $0xc0012180
c00026ce:	e8 64 9a 00 00       	call   c000c137 <Memset>
c00026d3:	83 c4 10             	add    $0x10,%esp
c00026d6:	83 ec 04             	sub    $0x4,%esp
c00026d9:	68 00 02 00 00       	push   $0x200
c00026de:	68 80 21 01 c0       	push   $0xc0012180
c00026e3:	68 f0 01 00 00       	push   $0x1f0
c00026e8:	e8 9e 9a 00 00       	call   c000c18b <read_port>
c00026ed:	83 c4 10             	add    $0x10,%esp
c00026f0:	83 ec 04             	sub    $0x4,%esp
c00026f3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00026f6:	68 80 21 01 c0       	push   $0xc0012180
c00026fb:	ff 75 f0             	pushl  -0x10(%ebp)
c00026fe:	e8 5e 55 00 00       	call   c0007c61 <Memcpy>
c0002703:	83 c4 10             	add    $0x10,%esp
c0002706:	eb 26                	jmp    c000272e <hd_rdwt+0x246>
c0002708:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000270c:	75 20                	jne    c000272e <hd_rdwt+0x246>
c000270e:	e8 53 fd ff ff       	call   c0002466 <wait_for>
c0002713:	83 ec 04             	sub    $0x4,%esp
c0002716:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002719:	ff 75 f0             	pushl  -0x10(%ebp)
c000271c:	68 f0 01 00 00       	push   $0x1f0
c0002721:	e8 79 9a 00 00       	call   c000c19f <write_port>
c0002726:	83 c4 10             	add    $0x10,%esp
c0002729:	e8 69 fd ff ff       	call   c0002497 <interrupt_wait>
c000272e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002731:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002734:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002737:	01 45 f0             	add    %eax,-0x10(%ebp)
c000273a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000273e:	0f 85 5a ff ff ff    	jne    c000269e <hd_rdwt+0x1b6>
c0002744:	83 ec 0c             	sub    $0xc,%esp
c0002747:	6a 6c                	push   $0x6c
c0002749:	e8 56 02 00 00       	call   c00029a4 <sys_malloc>
c000274e:	83 c4 10             	add    $0x10,%esp
c0002751:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0002754:	83 ec 04             	sub    $0x4,%esp
c0002757:	6a 6c                	push   $0x6c
c0002759:	6a 00                	push   $0x0
c000275b:	ff 75 c0             	pushl  -0x40(%ebp)
c000275e:	e8 d4 99 00 00       	call   c000c137 <Memset>
c0002763:	83 c4 10             	add    $0x10,%esp
c0002766:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002769:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002770:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002773:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000277a:	83 ec 04             	sub    $0x4,%esp
c000277d:	6a 02                	push   $0x2
c000277f:	ff 75 c0             	pushl  -0x40(%ebp)
c0002782:	6a 01                	push   $0x1
c0002784:	e8 25 7d 00 00       	call   c000a4ae <send_rec>
c0002789:	83 c4 10             	add    $0x10,%esp
c000278c:	90                   	nop
c000278d:	c9                   	leave  
c000278e:	c3                   	ret    

c000278f <hd_handler>:
c000278f:	55                   	push   %ebp
c0002790:	89 e5                	mov    %esp,%ebp
c0002792:	83 ec 18             	sub    $0x18,%esp
c0002795:	83 ec 0c             	sub    $0xc,%esp
c0002798:	68 f7 01 00 00       	push   $0x1f7
c000279d:	e8 e4 ef ff ff       	call   c0001786 <in_byte>
c00027a2:	83 c4 10             	add    $0x10,%esp
c00027a5:	0f b6 c0             	movzbl %al,%eax
c00027a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00027ab:	83 ec 0c             	sub    $0xc,%esp
c00027ae:	6a 03                	push   $0x3
c00027b0:	e8 88 7f 00 00       	call   c000a73d <inform_int>
c00027b5:	83 c4 10             	add    $0x10,%esp
c00027b8:	90                   	nop
c00027b9:	c9                   	leave  
c00027ba:	c3                   	ret    

c00027bb <waitfor>:
c00027bb:	55                   	push   %ebp
c00027bc:	89 e5                	mov    %esp,%ebp
c00027be:	83 ec 18             	sub    $0x18,%esp
c00027c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027c8:	eb 26                	jmp    c00027f0 <waitfor+0x35>
c00027ca:	83 ec 0c             	sub    $0xc,%esp
c00027cd:	68 f7 01 00 00       	push   $0x1f7
c00027d2:	e8 af ef ff ff       	call   c0001786 <in_byte>
c00027d7:	83 c4 10             	add    $0x10,%esp
c00027da:	0f b6 c0             	movzbl %al,%eax
c00027dd:	23 45 08             	and    0x8(%ebp),%eax
c00027e0:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00027e3:	75 07                	jne    c00027ec <waitfor+0x31>
c00027e5:	b8 01 00 00 00       	mov    $0x1,%eax
c00027ea:	eb 11                	jmp    c00027fd <waitfor+0x42>
c00027ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00027f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00027f3:	3b 45 10             	cmp    0x10(%ebp),%eax
c00027f6:	7c d2                	jl     c00027ca <waitfor+0xf>
c00027f8:	b8 00 00 00 00       	mov    $0x0,%eax
c00027fd:	c9                   	leave  
c00027fe:	c3                   	ret    

c00027ff <print_hd_info>:
c00027ff:	55                   	push   %ebp
c0002800:	89 e5                	mov    %esp,%ebp
c0002802:	83 ec 18             	sub    $0x18,%esp
c0002805:	83 ec 0c             	sub    $0xc,%esp
c0002808:	68 d8 b5 00 c0       	push   $0xc000b5d8
c000280d:	e8 13 70 00 00       	call   c0009825 <Printf>
c0002812:	83 c4 10             	add    $0x10,%esp
c0002815:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000281c:	eb 3b                	jmp    c0002859 <print_hd_info+0x5a>
c000281e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002821:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c0002828:	85 c0                	test   %eax,%eax
c000282a:	74 28                	je     c0002854 <print_hd_info+0x55>
c000282c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000282f:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c0002836:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002839:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c0002840:	ff 75 f4             	pushl  -0xc(%ebp)
c0002843:	52                   	push   %edx
c0002844:	50                   	push   %eax
c0002845:	68 f5 b5 00 c0       	push   $0xc000b5f5
c000284a:	e8 d6 6f 00 00       	call   c0009825 <Printf>
c000284f:	83 c4 10             	add    $0x10,%esp
c0002852:	eb 01                	jmp    c0002855 <print_hd_info+0x56>
c0002854:	90                   	nop
c0002855:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002859:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000285d:	7e bf                	jle    c000281e <print_hd_info+0x1f>
c000285f:	83 ec 0c             	sub    $0xc,%esp
c0002862:	68 0d b6 00 c0       	push   $0xc000b60d
c0002867:	e8 b9 6f 00 00       	call   c0009825 <Printf>
c000286c:	83 c4 10             	add    $0x10,%esp
c000286f:	83 ec 0c             	sub    $0xc,%esp
c0002872:	68 28 b6 00 c0       	push   $0xc000b628
c0002877:	e8 a9 6f 00 00       	call   c0009825 <Printf>
c000287c:	83 c4 10             	add    $0x10,%esp
c000287f:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0002886:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000288d:	eb 44                	jmp    c00028d3 <print_hd_info+0xd4>
c000288f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002892:	83 c0 04             	add    $0x4,%eax
c0002895:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000289c:	85 c0                	test   %eax,%eax
c000289e:	74 2e                	je     c00028ce <print_hd_info+0xcf>
c00028a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028a3:	83 c0 04             	add    $0x4,%eax
c00028a6:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00028ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028b0:	83 c0 04             	add    $0x4,%eax
c00028b3:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00028ba:	ff 75 f0             	pushl  -0x10(%ebp)
c00028bd:	52                   	push   %edx
c00028be:	50                   	push   %eax
c00028bf:	68 f5 b5 00 c0       	push   $0xc000b5f5
c00028c4:	e8 5c 6f 00 00       	call   c0009825 <Printf>
c00028c9:	83 c4 10             	add    $0x10,%esp
c00028cc:	eb 01                	jmp    c00028cf <print_hd_info+0xd0>
c00028ce:	90                   	nop
c00028cf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028d3:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00028d7:	7e b6                	jle    c000288f <print_hd_info+0x90>
c00028d9:	83 ec 0c             	sub    $0xc,%esp
c00028dc:	68 45 b6 00 c0       	push   $0xc000b645
c00028e1:	e8 3f 6f 00 00       	call   c0009825 <Printf>
c00028e6:	83 c4 10             	add    $0x10,%esp
c00028e9:	90                   	nop
c00028ea:	c9                   	leave  
c00028eb:	c3                   	ret    

c00028ec <is_empty>:
c00028ec:	55                   	push   %ebp
c00028ed:	89 e5                	mov    %esp,%ebp
c00028ef:	83 ec 10             	sub    $0x10,%esp
c00028f2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00028f9:	eb 1a                	jmp    c0002915 <is_empty+0x29>
c00028fb:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00028fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0002901:	01 d0                	add    %edx,%eax
c0002903:	0f b6 00             	movzbl (%eax),%eax
c0002906:	84 c0                	test   %al,%al
c0002908:	74 07                	je     c0002911 <is_empty+0x25>
c000290a:	b8 00 00 00 00       	mov    $0x0,%eax
c000290f:	eb 11                	jmp    c0002922 <is_empty+0x36>
c0002911:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002915:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002918:	3b 45 0c             	cmp    0xc(%ebp),%eax
c000291b:	7c de                	jl     c00028fb <is_empty+0xf>
c000291d:	b8 01 00 00 00       	mov    $0x1,%eax
c0002922:	c9                   	leave  
c0002923:	c3                   	ret    
c0002924:	66 90                	;xchg   %ax,%ax
c0002926:	66 90                	;xchg   %ax,%ax
c0002928:	66 90                	;xchg   %ax,%ax
c000292a:	66 90                	;xchg   %ax,%ax
c000292c:	66 90                	;xchg   %ax,%ax
c000292e:	66 90                	;xchg   %ax,%ax

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
c00029bf:	e8 8e 08 00 00       	call   c0003252 <init_fs>
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
c00029ee:	e8 44 97 00 00       	call   c000c137 <Memset>
c00029f3:	83 c4 10             	add    $0x10,%esp
c00029f6:	83 ec 04             	sub    $0x4,%esp
c00029f9:	6a 12                	push   $0x12
c00029fb:	ff 75 f4             	pushl  -0xc(%ebp)
c00029fe:	6a 02                	push   $0x2
c0002a00:	e8 a9 7a 00 00       	call   c000a4ae <send_rec>
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
c0002a48:	e8 26 24 00 00       	call   c0004e73 <pid2proc>
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
c0002a7b:	68 64 b6 00 c0       	push   $0xc000b664
c0002a80:	68 64 b6 00 c0       	push   $0xc000b664
c0002a85:	68 74 b6 00 c0       	push   $0xc000b674
c0002a8a:	e8 f3 70 00 00       	call   c0009b82 <assertion_failure>
c0002a8f:	83 c4 10             	add    $0x10,%esp
c0002a92:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a96:	74 3a                	je     c0002ad2 <task_fs+0x119>
c0002a98:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a9c:	7f 19                	jg     c0002ab7 <task_fs+0xfe>
c0002a9e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002aa2:	0f 84 e2 00 00 00    	je     c0002b8a <task_fs+0x1d1>
c0002aa8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002aac:	0f 84 9d 00 00 00    	je     c0002b4f <task_fs+0x196>
c0002ab2:	e9 c1 00 00 00       	jmp    c0002b78 <task_fs+0x1bf>
c0002ab7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002abb:	74 50                	je     c0002b0d <task_fs+0x154>
c0002abd:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002ac1:	0f 84 98 00 00 00    	je     c0002b5f <task_fs+0x1a6>
c0002ac7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002acb:	74 40                	je     c0002b0d <task_fs+0x154>
c0002acd:	e9 a6 00 00 00       	jmp    c0002b78 <task_fs+0x1bf>
c0002ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ad5:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002adc:	83 ec 0c             	sub    $0xc,%esp
c0002adf:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ae2:	e8 c0 07 00 00       	call   c00032a7 <do_open>
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
c0002b00:	e8 a9 79 00 00       	call   c000a4ae <send_rec>
c0002b05:	83 c4 10             	add    $0x10,%esp
c0002b08:	e9 84 00 00 00       	jmp    c0002b91 <task_fs+0x1d8>
c0002b0d:	83 ec 0c             	sub    $0xc,%esp
c0002b10:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b13:	e8 cd 18 00 00       	call   c00043e5 <do_rdwt>
c0002b18:	83 c4 10             	add    $0x10,%esp
c0002b1b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002b1e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0002b22:	74 6c                	je     c0002b90 <task_fs+0x1d7>
c0002b24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b27:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002b2e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002b31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b34:	89 50 50             	mov    %edx,0x50(%eax)
c0002b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b3a:	8b 00                	mov    (%eax),%eax
c0002b3c:	83 ec 04             	sub    $0x4,%esp
c0002b3f:	50                   	push   %eax
c0002b40:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b43:	6a 01                	push   $0x1
c0002b45:	e8 64 79 00 00       	call   c000a4ae <send_rec>
c0002b4a:	83 c4 10             	add    $0x10,%esp
c0002b4d:	eb 41                	jmp    c0002b90 <task_fs+0x1d7>
c0002b4f:	83 ec 0c             	sub    $0xc,%esp
c0002b52:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002b55:	e8 a8 1d 00 00       	call   c0004902 <do_close>
c0002b5a:	83 c4 10             	add    $0x10,%esp
c0002b5d:	eb 32                	jmp    c0002b91 <task_fs+0x1d8>
c0002b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b62:	8b 40 58             	mov    0x58(%eax),%eax
c0002b65:	83 ec 04             	sub    $0x4,%esp
c0002b68:	50                   	push   %eax
c0002b69:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b6c:	6a 01                	push   $0x1
c0002b6e:	e8 3b 79 00 00       	call   c000a4ae <send_rec>
c0002b73:	83 c4 10             	add    $0x10,%esp
c0002b76:	eb 19                	jmp    c0002b91 <task_fs+0x1d8>
c0002b78:	83 ec 0c             	sub    $0xc,%esp
c0002b7b:	68 d7 b6 00 c0       	push   $0xc000b6d7
c0002b80:	e8 df 6f 00 00       	call   c0009b64 <panic>
c0002b85:	83 c4 10             	add    $0x10,%esp
c0002b88:	eb 07                	jmp    c0002b91 <task_fs+0x1d8>
c0002b8a:	90                   	nop
c0002b8b:	e9 54 fe ff ff       	jmp    c00029e4 <task_fs+0x2b>
c0002b90:	90                   	nop
c0002b91:	e9 4e fe ff ff       	jmp    c00029e4 <task_fs+0x2b>

c0002b96 <rd_wt>:
c0002b96:	55                   	push   %ebp
c0002b97:	89 e5                	mov    %esp,%ebp
c0002b99:	83 ec 18             	sub    $0x18,%esp
c0002b9c:	83 ec 0c             	sub    $0xc,%esp
c0002b9f:	6a 6c                	push   $0x6c
c0002ba1:	e8 fe fd ff ff       	call   c00029a4 <sys_malloc>
c0002ba6:	83 c4 10             	add    $0x10,%esp
c0002ba9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002bac:	83 ec 04             	sub    $0x4,%esp
c0002baf:	6a 6c                	push   $0x6c
c0002bb1:	6a 00                	push   $0x0
c0002bb3:	ff 75 f4             	pushl  -0xc(%ebp)
c0002bb6:	e8 7c 95 00 00       	call   c000c137 <Memset>
c0002bbb:	83 c4 10             	add    $0x10,%esp
c0002bbe:	8b 55 18             	mov    0x18(%ebp),%edx
c0002bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bc4:	89 50 68             	mov    %edx,0x68(%eax)
c0002bc7:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002bca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bcd:	89 50 14             	mov    %edx,0x14(%eax)
c0002bd0:	8b 55 10             	mov    0x10(%ebp),%edx
c0002bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bd6:	89 50 10             	mov    %edx,0x10(%eax)
c0002bd9:	8b 55 14             	mov    0x14(%ebp),%edx
c0002bdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bdf:	89 50 0c             	mov    %edx,0xc(%eax)
c0002be2:	8b 45 08             	mov    0x8(%ebp),%eax
c0002be5:	c1 e0 09             	shl    $0x9,%eax
c0002be8:	89 c2                	mov    %eax,%edx
c0002bea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bed:	89 50 18             	mov    %edx,0x18(%eax)
c0002bf0:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002bf4:	74 22                	je     c0002c18 <rd_wt+0x82>
c0002bf6:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002bfa:	74 1c                	je     c0002c18 <rd_wt+0x82>
c0002bfc:	68 ac 00 00 00       	push   $0xac
c0002c01:	68 64 b6 00 c0       	push   $0xc000b664
c0002c06:	68 64 b6 00 c0       	push   $0xc000b664
c0002c0b:	68 ea b6 00 c0       	push   $0xc000b6ea
c0002c10:	e8 6d 6f 00 00       	call   c0009b82 <assertion_failure>
c0002c15:	83 c4 10             	add    $0x10,%esp
c0002c18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c1b:	8b 40 68             	mov    0x68(%eax),%eax
c0002c1e:	83 f8 07             	cmp    $0x7,%eax
c0002c21:	74 27                	je     c0002c4a <rd_wt+0xb4>
c0002c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c26:	8b 40 68             	mov    0x68(%eax),%eax
c0002c29:	83 f8 0a             	cmp    $0xa,%eax
c0002c2c:	74 1c                	je     c0002c4a <rd_wt+0xb4>
c0002c2e:	68 ad 00 00 00       	push   $0xad
c0002c33:	68 64 b6 00 c0       	push   $0xc000b664
c0002c38:	68 64 b6 00 c0       	push   $0xc000b664
c0002c3d:	68 08 b7 00 c0       	push   $0xc000b708
c0002c42:	e8 3b 6f 00 00       	call   c0009b82 <assertion_failure>
c0002c47:	83 c4 10             	add    $0x10,%esp
c0002c4a:	83 ec 04             	sub    $0x4,%esp
c0002c4d:	6a 03                	push   $0x3
c0002c4f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002c52:	6a 03                	push   $0x3
c0002c54:	e8 55 78 00 00       	call   c000a4ae <send_rec>
c0002c59:	83 c4 10             	add    $0x10,%esp
c0002c5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c5f:	83 ec 08             	sub    $0x8,%esp
c0002c62:	6a 6c                	push   $0x6c
c0002c64:	50                   	push   %eax
c0002c65:	e8 d0 4a 00 00       	call   c000773a <sys_free>
c0002c6a:	83 c4 10             	add    $0x10,%esp
c0002c6d:	90                   	nop
c0002c6e:	c9                   	leave  
c0002c6f:	c3                   	ret    

c0002c70 <mkfs>:
c0002c70:	55                   	push   %ebp
c0002c71:	89 e5                	mov    %esp,%ebp
c0002c73:	57                   	push   %edi
c0002c74:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002c7a:	83 ec 0c             	sub    $0xc,%esp
c0002c7d:	68 00 80 00 00       	push   $0x8000
c0002c82:	e8 1d fd ff ff       	call   c00029a4 <sys_malloc>
c0002c87:	83 c4 10             	add    $0x10,%esp
c0002c8a:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002c8f:	83 ec 0c             	sub    $0xc,%esp
c0002c92:	6a 24                	push   $0x24
c0002c94:	e8 0b fd ff ff       	call   c00029a4 <sys_malloc>
c0002c99:	83 c4 10             	add    $0x10,%esp
c0002c9c:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002ca1:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ca6:	83 ec 0c             	sub    $0xc,%esp
c0002ca9:	50                   	push   %eax
c0002caa:	e8 c8 45 00 00       	call   c0007277 <get_physical_address>
c0002caf:	83 c4 10             	add    $0x10,%esp
c0002cb2:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002cb7:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002cbc:	83 ec 0c             	sub    $0xc,%esp
c0002cbf:	50                   	push   %eax
c0002cc0:	e8 b2 45 00 00       	call   c0007277 <get_physical_address>
c0002cc5:	83 c4 10             	add    $0x10,%esp
c0002cc8:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002ccd:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cd2:	83 ec 04             	sub    $0x4,%esp
c0002cd5:	68 00 02 00 00       	push   $0x200
c0002cda:	6a 00                	push   $0x0
c0002cdc:	50                   	push   %eax
c0002cdd:	e8 55 94 00 00       	call   c000c137 <Memset>
c0002ce2:	83 c4 10             	add    $0x10,%esp
c0002ce5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002cea:	83 ec 0c             	sub    $0xc,%esp
c0002ced:	6a 0a                	push   $0xa
c0002cef:	68 00 02 00 00       	push   $0x200
c0002cf4:	50                   	push   %eax
c0002cf5:	6a 20                	push   $0x20
c0002cf7:	6a 00                	push   $0x0
c0002cf9:	e8 98 fe ff ff       	call   c0002b96 <rd_wt>
c0002cfe:	83 c4 20             	add    $0x20,%esp
c0002d01:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d06:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002d09:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d0c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002d13:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d16:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002d1d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d20:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002d27:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d2a:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002d31:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d34:	8b 40 04             	mov    0x4(%eax),%eax
c0002d37:	8d 50 02             	lea    0x2(%eax),%edx
c0002d3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d3d:	8b 40 08             	mov    0x8(%eax),%eax
c0002d40:	01 c2                	add    %eax,%edx
c0002d42:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d45:	8b 40 0c             	mov    0xc(%eax),%eax
c0002d48:	01 c2                	add    %eax,%edx
c0002d4a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d4d:	89 10                	mov    %edx,(%eax)
c0002d4f:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002d56:	b8 00 02 00 00       	mov    $0x200,%eax
c0002d5b:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002d5e:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002d64:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002d67:	01 ca                	add    %ecx,%edx
c0002d69:	83 ec 04             	sub    $0x4,%esp
c0002d6c:	50                   	push   %eax
c0002d6d:	6a 80                	push   $0xffffff80
c0002d6f:	52                   	push   %edx
c0002d70:	e8 c2 93 00 00       	call   c000c137 <Memset>
c0002d75:	83 c4 10             	add    $0x10,%esp
c0002d78:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d7d:	83 ec 0c             	sub    $0xc,%esp
c0002d80:	6a 0a                	push   $0xa
c0002d82:	68 00 02 00 00       	push   $0x200
c0002d87:	50                   	push   %eax
c0002d88:	6a 20                	push   $0x20
c0002d8a:	6a 01                	push   $0x1
c0002d8c:	e8 05 fe ff ff       	call   c0002b96 <rd_wt>
c0002d91:	83 c4 20             	add    $0x20,%esp
c0002d94:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d97:	8b 10                	mov    (%eax),%edx
c0002d99:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002d9c:	8b 50 04             	mov    0x4(%eax),%edx
c0002d9f:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002da2:	8b 50 08             	mov    0x8(%eax),%edx
c0002da5:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002da8:	8b 50 0c             	mov    0xc(%eax),%edx
c0002dab:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002dae:	8b 50 10             	mov    0x10(%eax),%edx
c0002db1:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002db4:	8b 50 14             	mov    0x14(%eax),%edx
c0002db7:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002dba:	8b 50 18             	mov    0x18(%eax),%edx
c0002dbd:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002dc0:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002dc3:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002dc6:	8b 40 20             	mov    0x20(%eax),%eax
c0002dc9:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002dcc:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002dd0:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002dd4:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002dd9:	83 ec 04             	sub    $0x4,%esp
c0002ddc:	6a 01                	push   $0x1
c0002dde:	52                   	push   %edx
c0002ddf:	50                   	push   %eax
c0002de0:	e8 52 93 00 00       	call   c000c137 <Memset>
c0002de5:	83 c4 10             	add    $0x10,%esp
c0002de8:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ded:	83 c0 01             	add    $0x1,%eax
c0002df0:	83 ec 04             	sub    $0x4,%esp
c0002df3:	68 ff 01 00 00       	push   $0x1ff
c0002df8:	6a 80                	push   $0xffffff80
c0002dfa:	50                   	push   %eax
c0002dfb:	e8 37 93 00 00       	call   c000c137 <Memset>
c0002e00:	83 c4 10             	add    $0x10,%esp
c0002e03:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e08:	83 ec 0c             	sub    $0xc,%esp
c0002e0b:	6a 0a                	push   $0xa
c0002e0d:	68 00 02 00 00       	push   $0x200
c0002e12:	50                   	push   %eax
c0002e13:	6a 20                	push   $0x20
c0002e15:	6a 02                	push   $0x2
c0002e17:	e8 7a fd ff ff       	call   c0002b96 <rd_wt>
c0002e1c:	83 c4 20             	add    $0x20,%esp
c0002e1f:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002e26:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e2b:	83 ec 04             	sub    $0x4,%esp
c0002e2e:	68 00 02 00 00       	push   $0x200
c0002e33:	6a ff                	push   $0xffffffff
c0002e35:	50                   	push   %eax
c0002e36:	e8 fc 92 00 00       	call   c000c137 <Memset>
c0002e3b:	83 c4 10             	add    $0x10,%esp
c0002e3e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e43:	83 ec 0c             	sub    $0xc,%esp
c0002e46:	6a 0a                	push   $0xa
c0002e48:	68 00 02 00 00       	push   $0x200
c0002e4d:	50                   	push   %eax
c0002e4e:	6a 20                	push   $0x20
c0002e50:	ff 75 d0             	pushl  -0x30(%ebp)
c0002e53:	e8 3e fd ff ff       	call   c0002b96 <rd_wt>
c0002e58:	83 c4 20             	add    $0x20,%esp
c0002e5b:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e60:	83 ec 04             	sub    $0x4,%esp
c0002e63:	6a 01                	push   $0x1
c0002e65:	6a 01                	push   $0x1
c0002e67:	50                   	push   %eax
c0002e68:	e8 ca 92 00 00       	call   c000c137 <Memset>
c0002e6d:	83 c4 10             	add    $0x10,%esp
c0002e70:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e75:	83 c0 01             	add    $0x1,%eax
c0002e78:	83 ec 04             	sub    $0x4,%esp
c0002e7b:	68 ff 01 00 00       	push   $0x1ff
c0002e80:	6a 00                	push   $0x0
c0002e82:	50                   	push   %eax
c0002e83:	e8 af 92 00 00       	call   c000c137 <Memset>
c0002e88:	83 c4 10             	add    $0x10,%esp
c0002e8b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e90:	89 c2                	mov    %eax,%edx
c0002e92:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002e95:	83 c0 01             	add    $0x1,%eax
c0002e98:	83 ec 0c             	sub    $0xc,%esp
c0002e9b:	6a 0a                	push   $0xa
c0002e9d:	68 00 02 00 00       	push   $0x200
c0002ea2:	52                   	push   %edx
c0002ea3:	6a 20                	push   $0x20
c0002ea5:	50                   	push   %eax
c0002ea6:	e8 eb fc ff ff       	call   c0002b96 <rd_wt>
c0002eab:	83 c4 20             	add    $0x20,%esp
c0002eae:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002eb1:	83 e8 02             	sub    $0x2,%eax
c0002eb4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002eb7:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002ebe:	eb 04                	jmp    c0002ec4 <mkfs+0x254>
c0002ec0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002ec4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002ec7:	83 c0 01             	add    $0x1,%eax
c0002eca:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002ecd:	7e f1                	jle    c0002ec0 <mkfs+0x250>
c0002ecf:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ed4:	89 c2                	mov    %eax,%edx
c0002ed6:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002ed9:	83 c0 03             	add    $0x3,%eax
c0002edc:	83 ec 0c             	sub    $0xc,%esp
c0002edf:	6a 0a                	push   $0xa
c0002ee1:	68 00 02 00 00       	push   $0x200
c0002ee6:	52                   	push   %edx
c0002ee7:	6a 20                	push   $0x20
c0002ee9:	50                   	push   %eax
c0002eea:	e8 a7 fc ff ff       	call   c0002b96 <rd_wt>
c0002eef:	83 c4 20             	add    $0x20,%esp
c0002ef2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ef7:	89 c2                	mov    %eax,%edx
c0002ef9:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002efc:	83 c0 03             	add    $0x3,%eax
c0002eff:	83 ec 0c             	sub    $0xc,%esp
c0002f02:	6a 07                	push   $0x7
c0002f04:	68 00 02 00 00       	push   $0x200
c0002f09:	52                   	push   %edx
c0002f0a:	6a 20                	push   $0x20
c0002f0c:	50                   	push   %eax
c0002f0d:	e8 84 fc ff ff       	call   c0002b96 <rd_wt>
c0002f12:	83 c4 20             	add    $0x20,%esp
c0002f15:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f1a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002f1d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f20:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002f26:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f29:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002f30:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002f33:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f36:	89 50 08             	mov    %edx,0x8(%eax)
c0002f39:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f3c:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f43:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f46:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002f4d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f50:	8b 10                	mov    (%eax),%edx
c0002f52:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002f58:	8b 50 04             	mov    0x4(%eax),%edx
c0002f5b:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002f61:	8b 50 08             	mov    0x8(%eax),%edx
c0002f64:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002f6a:	8b 50 0c             	mov    0xc(%eax),%edx
c0002f6d:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002f73:	8b 50 10             	mov    0x10(%eax),%edx
c0002f76:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002f7c:	8b 50 14             	mov    0x14(%eax),%edx
c0002f7f:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002f85:	8b 50 18             	mov    0x18(%eax),%edx
c0002f88:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002f8e:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002f91:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002f97:	8b 50 20             	mov    0x20(%eax),%edx
c0002f9a:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002fa0:	8b 40 24             	mov    0x24(%eax),%eax
c0002fa3:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002fa8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002faf:	eb 4c                	jmp    c0002ffd <mkfs+0x38d>
c0002fb1:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002fb6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002fb9:	83 c2 01             	add    $0x1,%edx
c0002fbc:	c1 e2 05             	shl    $0x5,%edx
c0002fbf:	01 d0                	add    %edx,%eax
c0002fc1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002fc4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002fc7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002fcd:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002fd0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002fd7:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002fda:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002fe1:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002fe8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002feb:	c1 e0 08             	shl    $0x8,%eax
c0002fee:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002ff1:	89 c2                	mov    %eax,%edx
c0002ff3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ff6:	89 50 08             	mov    %edx,0x8(%eax)
c0002ff9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002ffd:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0003001:	7e ae                	jle    c0002fb1 <mkfs+0x341>
c0003003:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c000300a:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0003010:	b8 00 00 00 00       	mov    $0x0,%eax
c0003015:	b9 0a 00 00 00       	mov    $0xa,%ecx
c000301a:	89 d7                	mov    %edx,%edi
c000301c:	f3 ab                	rep stos %eax,%es:(%edi)
c000301e:	c7 85 70 ff ff ff 30 	movl   $0xc000b730,-0x90(%ebp)
c0003025:	b7 00 c0 
c0003028:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000302f:	eb 54                	jmp    c0003085 <mkfs+0x415>
c0003031:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003036:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003039:	83 c2 04             	add    $0x4,%edx
c000303c:	c1 e2 05             	shl    $0x5,%edx
c000303f:	01 d0                	add    %edx,%eax
c0003041:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003044:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003047:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000304d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003050:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0003057:	8b 45 98             	mov    -0x68(%ebp),%eax
c000305a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000305d:	83 c2 01             	add    $0x1,%edx
c0003060:	c1 e2 0b             	shl    $0xb,%edx
c0003063:	01 c2                	add    %eax,%edx
c0003065:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003068:	89 50 08             	mov    %edx,0x8(%eax)
c000306b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000306e:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0003075:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003078:	8d 50 05             	lea    0x5(%eax),%edx
c000307b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000307e:	89 50 10             	mov    %edx,0x10(%eax)
c0003081:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003085:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003088:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c000308b:	7c a4                	jl     c0003031 <mkfs+0x3c1>
c000308d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003092:	89 c2                	mov    %eax,%edx
c0003094:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0003097:	83 c0 03             	add    $0x3,%eax
c000309a:	83 ec 0c             	sub    $0xc,%esp
c000309d:	6a 0a                	push   $0xa
c000309f:	68 00 02 00 00       	push   $0x200
c00030a4:	52                   	push   %edx
c00030a5:	6a 20                	push   $0x20
c00030a7:	50                   	push   %eax
c00030a8:	e8 e9 fa ff ff       	call   c0002b96 <rd_wt>
c00030ad:	83 c4 20             	add    $0x20,%esp
c00030b0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00030b5:	89 c2                	mov    %eax,%edx
c00030b7:	8b 45 98             	mov    -0x68(%ebp),%eax
c00030ba:	83 ec 0c             	sub    $0xc,%esp
c00030bd:	6a 07                	push   $0x7
c00030bf:	68 00 02 00 00       	push   $0x200
c00030c4:	52                   	push   %edx
c00030c5:	6a 20                	push   $0x20
c00030c7:	50                   	push   %eax
c00030c8:	e8 c9 fa ff ff       	call   c0002b96 <rd_wt>
c00030cd:	83 c4 20             	add    $0x20,%esp
c00030d0:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c00030d7:	00 00 00 
c00030da:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c00030e1:	2e 00 
c00030e3:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00030e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00030eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030ee:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c00030f4:	83 ec 0c             	sub    $0xc,%esp
c00030f7:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c00030fd:	50                   	push   %eax
c00030fe:	e8 6d 90 00 00       	call   c000c170 <Strlen>
c0003103:	83 c4 10             	add    $0x10,%esp
c0003106:	89 c1                	mov    %eax,%ecx
c0003108:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000310b:	8d 50 04             	lea    0x4(%eax),%edx
c000310e:	83 ec 04             	sub    $0x4,%esp
c0003111:	51                   	push   %ecx
c0003112:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0003118:	50                   	push   %eax
c0003119:	52                   	push   %edx
c000311a:	e8 42 4b 00 00       	call   c0007c61 <Memcpy>
c000311f:	83 c4 10             	add    $0x10,%esp
c0003122:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0003128:	b8 00 00 00 00       	mov    $0x0,%eax
c000312d:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0003132:	89 d7                	mov    %edx,%edi
c0003134:	f3 ab                	rep stos %eax,%es:(%edi)
c0003136:	c7 85 34 ff ff ff 3c 	movl   $0xc000b73c,-0xcc(%ebp)
c000313d:	b7 00 c0 
c0003140:	c7 85 38 ff ff ff 45 	movl   $0xc000b745,-0xc8(%ebp)
c0003147:	b7 00 c0 
c000314a:	c7 85 3c ff ff ff 4e 	movl   $0xc000b74e,-0xc4(%ebp)
c0003151:	b7 00 c0 
c0003154:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c000315b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003162:	eb 49                	jmp    c00031ad <mkfs+0x53d>
c0003164:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003168:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000316b:	8d 50 02             	lea    0x2(%eax),%edx
c000316e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003171:	89 10                	mov    %edx,(%eax)
c0003173:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003176:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c000317d:	83 ec 0c             	sub    $0xc,%esp
c0003180:	50                   	push   %eax
c0003181:	e8 ea 8f 00 00       	call   c000c170 <Strlen>
c0003186:	83 c4 10             	add    $0x10,%esp
c0003189:	89 c1                	mov    %eax,%ecx
c000318b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000318e:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003195:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003198:	83 c2 04             	add    $0x4,%edx
c000319b:	83 ec 04             	sub    $0x4,%esp
c000319e:	51                   	push   %ecx
c000319f:	50                   	push   %eax
c00031a0:	52                   	push   %edx
c00031a1:	e8 bb 4a 00 00       	call   c0007c61 <Memcpy>
c00031a6:	83 c4 10             	add    $0x10,%esp
c00031a9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00031ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031b0:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c00031b3:	7c af                	jl     c0003164 <mkfs+0x4f4>
c00031b5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00031bc:	eb 66                	jmp    c0003224 <mkfs+0x5b4>
c00031be:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031c1:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00031c8:	83 ec 0c             	sub    $0xc,%esp
c00031cb:	50                   	push   %eax
c00031cc:	e8 9f 8f 00 00       	call   c000c170 <Strlen>
c00031d1:	83 c4 10             	add    $0x10,%esp
c00031d4:	85 c0                	test   %eax,%eax
c00031d6:	74 47                	je     c000321f <mkfs+0x5af>
c00031d8:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c00031dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031df:	8d 50 05             	lea    0x5(%eax),%edx
c00031e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031e5:	89 10                	mov    %edx,(%eax)
c00031e7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031ea:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00031f1:	83 ec 0c             	sub    $0xc,%esp
c00031f4:	50                   	push   %eax
c00031f5:	e8 76 8f 00 00       	call   c000c170 <Strlen>
c00031fa:	83 c4 10             	add    $0x10,%esp
c00031fd:	89 c1                	mov    %eax,%ecx
c00031ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003202:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003209:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000320c:	83 c2 04             	add    $0x4,%edx
c000320f:	83 ec 04             	sub    $0x4,%esp
c0003212:	51                   	push   %ecx
c0003213:	50                   	push   %eax
c0003214:	52                   	push   %edx
c0003215:	e8 47 4a 00 00       	call   c0007c61 <Memcpy>
c000321a:	83 c4 10             	add    $0x10,%esp
c000321d:	eb 01                	jmp    c0003220 <mkfs+0x5b0>
c000321f:	90                   	nop
c0003220:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0003224:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003227:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c000322a:	7c 92                	jl     c00031be <mkfs+0x54e>
c000322c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003231:	89 c2                	mov    %eax,%edx
c0003233:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003236:	83 ec 0c             	sub    $0xc,%esp
c0003239:	6a 0a                	push   $0xa
c000323b:	68 00 02 00 00       	push   $0x200
c0003240:	52                   	push   %edx
c0003241:	6a 20                	push   $0x20
c0003243:	50                   	push   %eax
c0003244:	e8 4d f9 ff ff       	call   c0002b96 <rd_wt>
c0003249:	83 c4 20             	add    $0x20,%esp
c000324c:	90                   	nop
c000324d:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0003250:	c9                   	leave  
c0003251:	c3                   	ret    

c0003252 <init_fs>:
c0003252:	55                   	push   %ebp
c0003253:	89 e5                	mov    %esp,%ebp
c0003255:	83 ec 18             	sub    $0x18,%esp
c0003258:	83 ec 0c             	sub    $0xc,%esp
c000325b:	6a 6c                	push   $0x6c
c000325d:	e8 42 f7 ff ff       	call   c00029a4 <sys_malloc>
c0003262:	83 c4 10             	add    $0x10,%esp
c0003265:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003268:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000326b:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0003272:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003275:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c000327c:	83 ec 04             	sub    $0x4,%esp
c000327f:	6a 03                	push   $0x3
c0003281:	ff 75 f4             	pushl  -0xc(%ebp)
c0003284:	6a 03                	push   $0x3
c0003286:	e8 23 72 00 00       	call   c000a4ae <send_rec>
c000328b:	83 c4 10             	add    $0x10,%esp
c000328e:	e8 dd f9 ff ff       	call   c0002c70 <mkfs>
c0003293:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003296:	83 ec 08             	sub    $0x8,%esp
c0003299:	6a 6c                	push   $0x6c
c000329b:	50                   	push   %eax
c000329c:	e8 99 44 00 00       	call   c000773a <sys_free>
c00032a1:	83 c4 10             	add    $0x10,%esp
c00032a4:	90                   	nop
c00032a5:	c9                   	leave  
c00032a6:	c3                   	ret    

c00032a7 <do_open>:
c00032a7:	55                   	push   %ebp
c00032a8:	89 e5                	mov    %esp,%ebp
c00032aa:	83 ec 68             	sub    $0x68,%esp
c00032ad:	83 ec 04             	sub    $0x4,%esp
c00032b0:	6a 0c                	push   $0xc
c00032b2:	6a 00                	push   $0x0
c00032b4:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00032b7:	50                   	push   %eax
c00032b8:	e8 7a 8e 00 00       	call   c000c137 <Memset>
c00032bd:	83 c4 10             	add    $0x10,%esp
c00032c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00032c3:	8b 40 34             	mov    0x34(%eax),%eax
c00032c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00032c9:	83 ec 08             	sub    $0x8,%esp
c00032cc:	6a 0c                	push   $0xc
c00032ce:	ff 75 e4             	pushl  -0x1c(%ebp)
c00032d1:	e8 da 3e 00 00       	call   c00071b0 <alloc_virtual_memory>
c00032d6:	83 c4 10             	add    $0x10,%esp
c00032d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00032dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00032df:	8b 40 30             	mov    0x30(%eax),%eax
c00032e2:	89 c2                	mov    %eax,%edx
c00032e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00032e7:	83 ec 04             	sub    $0x4,%esp
c00032ea:	52                   	push   %edx
c00032eb:	50                   	push   %eax
c00032ec:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00032ef:	50                   	push   %eax
c00032f0:	e8 6c 49 00 00       	call   c0007c61 <Memcpy>
c00032f5:	83 c4 10             	add    $0x10,%esp
c00032f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00032fb:	8b 40 30             	mov    0x30(%eax),%eax
c00032fe:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0003303:	8b 45 08             	mov    0x8(%ebp),%eax
c0003306:	8b 40 64             	mov    0x64(%eax),%eax
c0003309:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000330c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0003313:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000331a:	eb 1f                	jmp    c000333b <do_open+0x94>
c000331c:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0003321:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003324:	83 c2 50             	add    $0x50,%edx
c0003327:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c000332b:	85 c0                	test   %eax,%eax
c000332d:	75 08                	jne    c0003337 <do_open+0x90>
c000332f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003332:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003335:	eb 0a                	jmp    c0003341 <do_open+0x9a>
c0003337:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000333b:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000333f:	7e db                	jle    c000331c <do_open+0x75>
c0003341:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0003345:	75 1c                	jne    c0003363 <do_open+0xbc>
c0003347:	68 c1 01 00 00       	push   $0x1c1
c000334c:	68 64 b6 00 c0       	push   $0xc000b664
c0003351:	68 64 b6 00 c0       	push   $0xc000b664
c0003356:	68 57 b7 00 c0       	push   $0xc000b757
c000335b:	e8 22 68 00 00       	call   c0009b82 <assertion_failure>
c0003360:	83 c4 10             	add    $0x10,%esp
c0003363:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c000336a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003371:	eb 1d                	jmp    c0003390 <do_open+0xe9>
c0003373:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003376:	c1 e0 04             	shl    $0x4,%eax
c0003379:	05 88 23 01 c0       	add    $0xc0012388,%eax
c000337e:	8b 00                	mov    (%eax),%eax
c0003380:	85 c0                	test   %eax,%eax
c0003382:	75 08                	jne    c000338c <do_open+0xe5>
c0003384:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003387:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000338a:	eb 0a                	jmp    c0003396 <do_open+0xef>
c000338c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003390:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0003394:	7e dd                	jle    c0003373 <do_open+0xcc>
c0003396:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c000339a:	75 1c                	jne    c00033b8 <do_open+0x111>
c000339c:	68 cd 01 00 00       	push   $0x1cd
c00033a1:	68 64 b6 00 c0       	push   $0xc000b664
c00033a6:	68 64 b6 00 c0       	push   $0xc000b664
c00033ab:	68 5f b7 00 c0       	push   $0xc000b75f
c00033b0:	e8 cd 67 00 00       	call   c0009b82 <assertion_failure>
c00033b5:	83 c4 10             	add    $0x10,%esp
c00033b8:	83 ec 0c             	sub    $0xc,%esp
c00033bb:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00033be:	50                   	push   %eax
c00033bf:	e8 b2 00 00 00       	call   c0003476 <search_file>
c00033c4:	83 c4 10             	add    $0x10,%esp
c00033c7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00033ca:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00033ce:	75 2b                	jne    c00033fb <do_open+0x154>
c00033d0:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c00033d4:	7e 10                	jle    c00033e6 <do_open+0x13f>
c00033d6:	83 ec 0c             	sub    $0xc,%esp
c00033d9:	68 67 b7 00 c0       	push   $0xc000b767
c00033de:	e8 81 67 00 00       	call   c0009b64 <panic>
c00033e3:	83 c4 10             	add    $0x10,%esp
c00033e6:	83 ec 08             	sub    $0x8,%esp
c00033e9:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00033ec:	50                   	push   %eax
c00033ed:	8d 45 9c             	lea    -0x64(%ebp),%eax
c00033f0:	50                   	push   %eax
c00033f1:	e8 40 04 00 00       	call   c0003836 <create_file>
c00033f6:	83 c4 10             	add    $0x10,%esp
c00033f9:	eb 22                	jmp    c000341d <do_open+0x176>
c00033fb:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c00033ff:	75 07                	jne    c0003408 <do_open+0x161>
c0003401:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003406:	eb 6c                	jmp    c0003474 <do_open+0x1cd>
c0003408:	83 ec 08             	sub    $0x8,%esp
c000340b:	ff 75 d8             	pushl  -0x28(%ebp)
c000340e:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0003411:	50                   	push   %eax
c0003412:	e8 5d 02 00 00       	call   c0003674 <get_inode>
c0003417:	83 c4 10             	add    $0x10,%esp
c000341a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000341d:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0003422:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003425:	c1 e2 04             	shl    $0x4,%edx
c0003428:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c000342e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003431:	83 c2 50             	add    $0x50,%edx
c0003434:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c0003438:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000343b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000343e:	c1 e2 04             	shl    $0x4,%edx
c0003441:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0003447:	89 02                	mov    %eax,(%edx)
c0003449:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000344c:	c1 e0 04             	shl    $0x4,%eax
c000344f:	05 84 23 01 c0       	add    $0xc0012384,%eax
c0003454:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000345a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000345d:	c1 e0 04             	shl    $0x4,%eax
c0003460:	05 80 23 01 c0       	add    $0xc0012380,%eax
c0003465:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000346b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000346e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003471:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003474:	c9                   	leave  
c0003475:	c3                   	ret    

c0003476 <search_file>:
c0003476:	55                   	push   %ebp
c0003477:	89 e5                	mov    %esp,%ebp
c0003479:	83 ec 68             	sub    $0x68,%esp
c000347c:	83 ec 04             	sub    $0x4,%esp
c000347f:	6a 0c                	push   $0xc
c0003481:	6a 00                	push   $0x0
c0003483:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003486:	50                   	push   %eax
c0003487:	e8 ab 8c 00 00       	call   c000c137 <Memset>
c000348c:	83 c4 10             	add    $0x10,%esp
c000348f:	83 ec 04             	sub    $0x4,%esp
c0003492:	6a 28                	push   $0x28
c0003494:	6a 00                	push   $0x0
c0003496:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003499:	50                   	push   %eax
c000349a:	e8 98 8c 00 00       	call   c000c137 <Memset>
c000349f:	83 c4 10             	add    $0x10,%esp
c00034a2:	83 ec 04             	sub    $0x4,%esp
c00034a5:	8d 45 98             	lea    -0x68(%ebp),%eax
c00034a8:	50                   	push   %eax
c00034a9:	ff 75 08             	pushl  0x8(%ebp)
c00034ac:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00034af:	50                   	push   %eax
c00034b0:	e8 f3 00 00 00       	call   c00035a8 <strip_path>
c00034b5:	83 c4 10             	add    $0x10,%esp
c00034b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00034bb:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c00034bf:	75 0a                	jne    c00034cb <search_file+0x55>
c00034c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00034c6:	e9 db 00 00 00       	jmp    c00035a6 <search_file+0x130>
c00034cb:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00034ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00034d1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00034d4:	05 00 02 00 00       	add    $0x200,%eax
c00034d9:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00034df:	85 c0                	test   %eax,%eax
c00034e1:	0f 48 c2             	cmovs  %edx,%eax
c00034e4:	c1 f8 09             	sar    $0x9,%eax
c00034e7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00034ea:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00034ed:	c1 e8 04             	shr    $0x4,%eax
c00034f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00034f3:	e8 5c 14 00 00       	call   c0004954 <get_super_block>
c00034f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00034fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00034fe:	8b 00                	mov    (%eax),%eax
c0003500:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003503:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c000350a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003511:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003518:	eb 7b                	jmp    c0003595 <search_file+0x11f>
c000351a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000351f:	89 c1                	mov    %eax,%ecx
c0003521:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003524:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003527:	01 d0                	add    %edx,%eax
c0003529:	83 ec 0c             	sub    $0xc,%esp
c000352c:	6a 07                	push   $0x7
c000352e:	68 00 02 00 00       	push   $0x200
c0003533:	51                   	push   %ecx
c0003534:	ff 75 cc             	pushl  -0x34(%ebp)
c0003537:	50                   	push   %eax
c0003538:	e8 59 f6 ff ff       	call   c0002b96 <rd_wt>
c000353d:	83 c4 20             	add    $0x20,%esp
c0003540:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003545:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003548:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000354f:	eb 35                	jmp    c0003586 <search_file+0x110>
c0003551:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003555:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003558:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c000355b:	7f 33                	jg     c0003590 <search_file+0x11a>
c000355d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003560:	83 c0 04             	add    $0x4,%eax
c0003563:	83 ec 08             	sub    $0x8,%esp
c0003566:	50                   	push   %eax
c0003567:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000356a:	50                   	push   %eax
c000356b:	e8 9a 72 00 00       	call   c000a80a <strcmp>
c0003570:	83 c4 10             	add    $0x10,%esp
c0003573:	85 c0                	test   %eax,%eax
c0003575:	75 07                	jne    c000357e <search_file+0x108>
c0003577:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000357a:	8b 00                	mov    (%eax),%eax
c000357c:	eb 28                	jmp    c00035a6 <search_file+0x130>
c000357e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003582:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003586:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003589:	83 f8 1f             	cmp    $0x1f,%eax
c000358c:	76 c3                	jbe    c0003551 <search_file+0xdb>
c000358e:	eb 01                	jmp    c0003591 <search_file+0x11b>
c0003590:	90                   	nop
c0003591:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003595:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003598:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c000359b:	0f 8c 79 ff ff ff    	jl     c000351a <search_file+0xa4>
c00035a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035a6:	c9                   	leave  
c00035a7:	c3                   	ret    

c00035a8 <strip_path>:
c00035a8:	55                   	push   %ebp
c00035a9:	89 e5                	mov    %esp,%ebp
c00035ab:	83 ec 10             	sub    $0x10,%esp
c00035ae:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00035b2:	75 0a                	jne    c00035be <strip_path+0x16>
c00035b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035b9:	e9 b4 00 00 00       	jmp    c0003672 <strip_path+0xca>
c00035be:	8b 45 08             	mov    0x8(%ebp),%eax
c00035c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00035c4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035c7:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00035ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035cd:	0f b6 00             	movzbl (%eax),%eax
c00035d0:	3c 2f                	cmp    $0x2f,%al
c00035d2:	75 2d                	jne    c0003601 <strip_path+0x59>
c00035d4:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00035d8:	eb 27                	jmp    c0003601 <strip_path+0x59>
c00035da:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035dd:	0f b6 00             	movzbl (%eax),%eax
c00035e0:	3c 2f                	cmp    $0x2f,%al
c00035e2:	75 0a                	jne    c00035ee <strip_path+0x46>
c00035e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035e9:	e9 84 00 00 00       	jmp    c0003672 <strip_path+0xca>
c00035ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035f1:	0f b6 10             	movzbl (%eax),%edx
c00035f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00035f7:	88 10                	mov    %dl,(%eax)
c00035f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00035fd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003601:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003604:	0f b6 00             	movzbl (%eax),%eax
c0003607:	84 c0                	test   %al,%al
c0003609:	75 cf                	jne    c00035da <strip_path+0x32>
c000360b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000360e:	c6 00 00             	movb   $0x0,(%eax)
c0003611:	8b 45 10             	mov    0x10(%ebp),%eax
c0003614:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c000361a:	89 10                	mov    %edx,(%eax)
c000361c:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003622:	89 50 04             	mov    %edx,0x4(%eax)
c0003625:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c000362b:	89 50 08             	mov    %edx,0x8(%eax)
c000362e:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c0003634:	89 50 0c             	mov    %edx,0xc(%eax)
c0003637:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c000363d:	89 50 10             	mov    %edx,0x10(%eax)
c0003640:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c0003646:	89 50 14             	mov    %edx,0x14(%eax)
c0003649:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c000364f:	89 50 18             	mov    %edx,0x18(%eax)
c0003652:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c0003658:	89 50 1c             	mov    %edx,0x1c(%eax)
c000365b:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c0003661:	89 50 20             	mov    %edx,0x20(%eax)
c0003664:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000366a:	89 50 24             	mov    %edx,0x24(%eax)
c000366d:	b8 00 00 00 00       	mov    $0x0,%eax
c0003672:	c9                   	leave  
c0003673:	c3                   	ret    

c0003674 <get_inode>:
c0003674:	55                   	push   %ebp
c0003675:	89 e5                	mov    %esp,%ebp
c0003677:	56                   	push   %esi
c0003678:	53                   	push   %ebx
c0003679:	83 ec 20             	sub    $0x20,%esp
c000367c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003680:	75 0a                	jne    c000368c <get_inode+0x18>
c0003682:	b8 00 00 00 00       	mov    $0x0,%eax
c0003687:	e9 a3 01 00 00       	jmp    c000382f <get_inode+0x1bb>
c000368c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003693:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c000369a:	eb 69                	jmp    c0003705 <get_inode+0x91>
c000369c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000369f:	8b 40 24             	mov    0x24(%eax),%eax
c00036a2:	85 c0                	test   %eax,%eax
c00036a4:	7e 53                	jle    c00036f9 <get_inode+0x85>
c00036a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036a9:	8b 40 10             	mov    0x10(%eax),%eax
c00036ac:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00036af:	75 50                	jne    c0003701 <get_inode+0x8d>
c00036b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00036b4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00036b7:	8b 0a                	mov    (%edx),%ecx
c00036b9:	89 08                	mov    %ecx,(%eax)
c00036bb:	8b 4a 04             	mov    0x4(%edx),%ecx
c00036be:	89 48 04             	mov    %ecx,0x4(%eax)
c00036c1:	8b 4a 08             	mov    0x8(%edx),%ecx
c00036c4:	89 48 08             	mov    %ecx,0x8(%eax)
c00036c7:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00036ca:	89 48 0c             	mov    %ecx,0xc(%eax)
c00036cd:	8b 4a 10             	mov    0x10(%edx),%ecx
c00036d0:	89 48 10             	mov    %ecx,0x10(%eax)
c00036d3:	8b 4a 14             	mov    0x14(%edx),%ecx
c00036d6:	89 48 14             	mov    %ecx,0x14(%eax)
c00036d9:	8b 4a 18             	mov    0x18(%edx),%ecx
c00036dc:	89 48 18             	mov    %ecx,0x18(%eax)
c00036df:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00036e2:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00036e5:	8b 4a 20             	mov    0x20(%edx),%ecx
c00036e8:	89 48 20             	mov    %ecx,0x20(%eax)
c00036eb:	8b 52 24             	mov    0x24(%edx),%edx
c00036ee:	89 50 24             	mov    %edx,0x24(%eax)
c00036f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036f4:	e9 36 01 00 00       	jmp    c000382f <get_inode+0x1bb>
c00036f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00036ff:	eb 0d                	jmp    c000370e <get_inode+0x9a>
c0003701:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003705:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c000370c:	76 8e                	jbe    c000369c <get_inode+0x28>
c000370e:	e8 41 12 00 00       	call   c0004954 <get_super_block>
c0003713:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003716:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c000371d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003720:	8b 40 04             	mov    0x4(%eax),%eax
c0003723:	8d 50 02             	lea    0x2(%eax),%edx
c0003726:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003729:	8b 40 08             	mov    0x8(%eax),%eax
c000372c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c000372f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003732:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003735:	b8 00 02 00 00       	mov    $0x200,%eax
c000373a:	99                   	cltd   
c000373b:	f7 7d e8             	idivl  -0x18(%ebp)
c000373e:	89 c6                	mov    %eax,%esi
c0003740:	89 c8                	mov    %ecx,%eax
c0003742:	99                   	cltd   
c0003743:	f7 fe                	idiv   %esi
c0003745:	01 d8                	add    %ebx,%eax
c0003747:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000374a:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c0003751:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003756:	83 ec 0c             	sub    $0xc,%esp
c0003759:	6a 07                	push   $0x7
c000375b:	68 00 02 00 00       	push   $0x200
c0003760:	50                   	push   %eax
c0003761:	ff 75 e0             	pushl  -0x20(%ebp)
c0003764:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003767:	e8 2a f4 ff ff       	call   c0002b96 <rd_wt>
c000376c:	83 c4 20             	add    $0x20,%esp
c000376f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003772:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003775:	b8 00 02 00 00       	mov    $0x200,%eax
c000377a:	99                   	cltd   
c000377b:	f7 7d e8             	idivl  -0x18(%ebp)
c000377e:	89 c3                	mov    %eax,%ebx
c0003780:	89 c8                	mov    %ecx,%eax
c0003782:	99                   	cltd   
c0003783:	f7 fb                	idiv   %ebx
c0003785:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003788:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000378e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003791:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003795:	01 d0                	add    %edx,%eax
c0003797:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000379a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000379d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00037a0:	8b 0a                	mov    (%edx),%ecx
c00037a2:	89 08                	mov    %ecx,(%eax)
c00037a4:	8b 4a 04             	mov    0x4(%edx),%ecx
c00037a7:	89 48 04             	mov    %ecx,0x4(%eax)
c00037aa:	8b 4a 08             	mov    0x8(%edx),%ecx
c00037ad:	89 48 08             	mov    %ecx,0x8(%eax)
c00037b0:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00037b3:	89 48 0c             	mov    %ecx,0xc(%eax)
c00037b6:	8b 4a 10             	mov    0x10(%edx),%ecx
c00037b9:	89 48 10             	mov    %ecx,0x10(%eax)
c00037bc:	8b 4a 14             	mov    0x14(%edx),%ecx
c00037bf:	89 48 14             	mov    %ecx,0x14(%eax)
c00037c2:	8b 4a 18             	mov    0x18(%edx),%ecx
c00037c5:	89 48 18             	mov    %ecx,0x18(%eax)
c00037c8:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00037cb:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00037ce:	8b 4a 20             	mov    0x20(%edx),%ecx
c00037d1:	89 48 20             	mov    %ecx,0x20(%eax)
c00037d4:	8b 52 24             	mov    0x24(%edx),%edx
c00037d7:	89 50 24             	mov    %edx,0x24(%eax)
c00037da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037dd:	8b 55 0c             	mov    0xc(%ebp),%edx
c00037e0:	89 50 10             	mov    %edx,0x10(%eax)
c00037e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037e6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00037e9:	89 50 20             	mov    %edx,0x20(%eax)
c00037ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00037ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00037f2:	8b 0a                	mov    (%edx),%ecx
c00037f4:	89 08                	mov    %ecx,(%eax)
c00037f6:	8b 4a 04             	mov    0x4(%edx),%ecx
c00037f9:	89 48 04             	mov    %ecx,0x4(%eax)
c00037fc:	8b 4a 08             	mov    0x8(%edx),%ecx
c00037ff:	89 48 08             	mov    %ecx,0x8(%eax)
c0003802:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003805:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003808:	8b 4a 10             	mov    0x10(%edx),%ecx
c000380b:	89 48 10             	mov    %ecx,0x10(%eax)
c000380e:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003811:	89 48 14             	mov    %ecx,0x14(%eax)
c0003814:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003817:	89 48 18             	mov    %ecx,0x18(%eax)
c000381a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000381d:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003820:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003823:	89 48 20             	mov    %ecx,0x20(%eax)
c0003826:	8b 52 24             	mov    0x24(%edx),%edx
c0003829:	89 50 24             	mov    %edx,0x24(%eax)
c000382c:	8b 45 08             	mov    0x8(%ebp),%eax
c000382f:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0003832:	5b                   	pop    %ebx
c0003833:	5e                   	pop    %esi
c0003834:	5d                   	pop    %ebp
c0003835:	c3                   	ret    

c0003836 <create_file>:
c0003836:	55                   	push   %ebp
c0003837:	89 e5                	mov    %esp,%ebp
c0003839:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000383f:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003842:	50                   	push   %eax
c0003843:	ff 75 0c             	pushl  0xc(%ebp)
c0003846:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003849:	50                   	push   %eax
c000384a:	e8 59 fd ff ff       	call   c00035a8 <strip_path>
c000384f:	83 c4 0c             	add    $0xc,%esp
c0003852:	83 f8 ff             	cmp    $0xffffffff,%eax
c0003855:	75 0a                	jne    c0003861 <create_file+0x2b>
c0003857:	b8 00 00 00 00       	mov    $0x0,%eax
c000385c:	e9 de 00 00 00       	jmp    c000393f <create_file+0x109>
c0003861:	e8 db 00 00 00       	call   c0003941 <alloc_imap_bit>
c0003866:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003869:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000386d:	75 0a                	jne    c0003879 <create_file+0x43>
c000386f:	b8 00 00 00 00       	mov    $0x0,%eax
c0003874:	e9 c6 00 00 00       	jmp    c000393f <create_file+0x109>
c0003879:	e8 d6 10 00 00       	call   c0004954 <get_super_block>
c000387e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003881:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003884:	8b 40 10             	mov    0x10(%eax),%eax
c0003887:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000388a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000388d:	83 ec 08             	sub    $0x8,%esp
c0003890:	50                   	push   %eax
c0003891:	ff 75 f4             	pushl  -0xc(%ebp)
c0003894:	e8 a5 01 00 00       	call   c0003a3e <alloc_smap_bit>
c0003899:	83 c4 10             	add    $0x10,%esp
c000389c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000389f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00038a3:	75 0a                	jne    c00038af <create_file+0x79>
c00038a5:	b8 00 00 00 00       	mov    $0x0,%eax
c00038aa:	e9 90 00 00 00       	jmp    c000393f <create_file+0x109>
c00038af:	83 ec 04             	sub    $0x4,%esp
c00038b2:	ff 75 e8             	pushl  -0x18(%ebp)
c00038b5:	ff 75 f4             	pushl  -0xc(%ebp)
c00038b8:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00038bb:	50                   	push   %eax
c00038bc:	e8 1e 03 00 00       	call   c0003bdf <new_inode>
c00038c1:	83 c4 10             	add    $0x10,%esp
c00038c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00038c7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00038cb:	75 07                	jne    c00038d4 <create_file+0x9e>
c00038cd:	b8 00 00 00 00       	mov    $0x0,%eax
c00038d2:	eb 6b                	jmp    c000393f <create_file+0x109>
c00038d4:	ff 75 f4             	pushl  -0xc(%ebp)
c00038d7:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00038da:	50                   	push   %eax
c00038db:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00038de:	50                   	push   %eax
c00038df:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c00038e5:	50                   	push   %eax
c00038e6:	e8 12 04 00 00       	call   c0003cfd <new_dir_entry>
c00038eb:	83 c4 10             	add    $0x10,%esp
c00038ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00038f1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00038f5:	75 07                	jne    c00038fe <create_file+0xc8>
c00038f7:	b8 00 00 00 00       	mov    $0x0,%eax
c00038fc:	eb 41                	jmp    c000393f <create_file+0x109>
c00038fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0003901:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003904:	89 10                	mov    %edx,(%eax)
c0003906:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003909:	89 50 04             	mov    %edx,0x4(%eax)
c000390c:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000390f:	89 50 08             	mov    %edx,0x8(%eax)
c0003912:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003915:	89 50 0c             	mov    %edx,0xc(%eax)
c0003918:	8b 55 94             	mov    -0x6c(%ebp),%edx
c000391b:	89 50 10             	mov    %edx,0x10(%eax)
c000391e:	8b 55 98             	mov    -0x68(%ebp),%edx
c0003921:	89 50 14             	mov    %edx,0x14(%eax)
c0003924:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003927:	89 50 18             	mov    %edx,0x18(%eax)
c000392a:	8b 55 a0             	mov    -0x60(%ebp),%edx
c000392d:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003930:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0003933:	89 50 20             	mov    %edx,0x20(%eax)
c0003936:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003939:	89 50 24             	mov    %edx,0x24(%eax)
c000393c:	8b 45 08             	mov    0x8(%ebp),%eax
c000393f:	c9                   	leave  
c0003940:	c3                   	ret    

c0003941 <alloc_imap_bit>:
c0003941:	55                   	push   %ebp
c0003942:	89 e5                	mov    %esp,%ebp
c0003944:	53                   	push   %ebx
c0003945:	83 ec 24             	sub    $0x24,%esp
c0003948:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000394f:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003956:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000395b:	83 ec 0c             	sub    $0xc,%esp
c000395e:	6a 07                	push   $0x7
c0003960:	68 00 02 00 00       	push   $0x200
c0003965:	50                   	push   %eax
c0003966:	ff 75 e8             	pushl  -0x18(%ebp)
c0003969:	ff 75 ec             	pushl  -0x14(%ebp)
c000396c:	e8 25 f2 ff ff       	call   c0002b96 <rd_wt>
c0003971:	83 c4 20             	add    $0x20,%esp
c0003974:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000397b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003982:	e9 a5 00 00 00       	jmp    c0003a2c <alloc_imap_bit+0xeb>
c0003987:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000398e:	e9 8b 00 00 00       	jmp    c0003a1e <alloc_imap_bit+0xdd>
c0003993:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003999:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000399c:	01 d0                	add    %edx,%eax
c000399e:	0f b6 00             	movzbl (%eax),%eax
c00039a1:	0f be d0             	movsbl %al,%edx
c00039a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039a7:	89 c1                	mov    %eax,%ecx
c00039a9:	d3 fa                	sar    %cl,%edx
c00039ab:	89 d0                	mov    %edx,%eax
c00039ad:	83 e0 01             	and    $0x1,%eax
c00039b0:	85 c0                	test   %eax,%eax
c00039b2:	74 06                	je     c00039ba <alloc_imap_bit+0x79>
c00039b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00039b8:	eb 64                	jmp    c0003a1e <alloc_imap_bit+0xdd>
c00039ba:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039c3:	01 d0                	add    %edx,%eax
c00039c5:	0f b6 18             	movzbl (%eax),%ebx
c00039c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039cb:	ba 01 00 00 00       	mov    $0x1,%edx
c00039d0:	89 c1                	mov    %eax,%ecx
c00039d2:	d3 e2                	shl    %cl,%edx
c00039d4:	89 d0                	mov    %edx,%eax
c00039d6:	89 c1                	mov    %eax,%ecx
c00039d8:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039e1:	01 d0                	add    %edx,%eax
c00039e3:	09 cb                	or     %ecx,%ebx
c00039e5:	89 da                	mov    %ebx,%edx
c00039e7:	88 10                	mov    %dl,(%eax)
c00039e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039ec:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00039f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039f6:	01 d0                	add    %edx,%eax
c00039f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00039fb:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003a00:	83 ec 0c             	sub    $0xc,%esp
c0003a03:	6a 0a                	push   $0xa
c0003a05:	68 00 02 00 00       	push   $0x200
c0003a0a:	50                   	push   %eax
c0003a0b:	ff 75 e8             	pushl  -0x18(%ebp)
c0003a0e:	ff 75 ec             	pushl  -0x14(%ebp)
c0003a11:	e8 80 f1 ff ff       	call   c0002b96 <rd_wt>
c0003a16:	83 c4 20             	add    $0x20,%esp
c0003a19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a1c:	eb 1b                	jmp    c0003a39 <alloc_imap_bit+0xf8>
c0003a1e:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0003a22:	0f 8e 6b ff ff ff    	jle    c0003993 <alloc_imap_bit+0x52>
c0003a28:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003a2c:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0003a33:	0f 8e 4e ff ff ff    	jle    c0003987 <alloc_imap_bit+0x46>
c0003a39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a3c:	c9                   	leave  
c0003a3d:	c3                   	ret    

c0003a3e <alloc_smap_bit>:
c0003a3e:	55                   	push   %ebp
c0003a3f:	89 e5                	mov    %esp,%ebp
c0003a41:	53                   	push   %ebx
c0003a42:	83 ec 34             	sub    $0x34,%esp
c0003a45:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a49:	75 1c                	jne    c0003a67 <alloc_smap_bit+0x29>
c0003a4b:	68 f7 02 00 00       	push   $0x2f7
c0003a50:	68 64 b6 00 c0       	push   $0xc000b664
c0003a55:	68 64 b6 00 c0       	push   $0xc000b664
c0003a5a:	68 74 b7 00 c0       	push   $0xc000b774
c0003a5f:	e8 1e 61 00 00       	call   c0009b82 <assertion_failure>
c0003a64:	83 c4 10             	add    $0x10,%esp
c0003a67:	e8 e8 0e 00 00       	call   c0004954 <get_super_block>
c0003a6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003a6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a72:	8b 40 08             	mov    0x8(%eax),%eax
c0003a75:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003a78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a7b:	8b 40 04             	mov    0x4(%eax),%eax
c0003a7e:	83 c0 02             	add    $0x2,%eax
c0003a81:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003a84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003a8b:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0003a92:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003a99:	e9 20 01 00 00       	jmp    c0003bbe <alloc_smap_bit+0x180>
c0003a9e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003aa4:	01 d0                	add    %edx,%eax
c0003aa6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003aa9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003aae:	83 ec 0c             	sub    $0xc,%esp
c0003ab1:	6a 07                	push   $0x7
c0003ab3:	68 00 02 00 00       	push   $0x200
c0003ab8:	50                   	push   %eax
c0003ab9:	ff 75 d8             	pushl  -0x28(%ebp)
c0003abc:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003abf:	e8 d2 f0 ff ff       	call   c0002b96 <rd_wt>
c0003ac4:	83 c4 20             	add    $0x20,%esp
c0003ac7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003ace:	e9 b0 00 00 00       	jmp    c0003b83 <alloc_smap_bit+0x145>
c0003ad3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003ada:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003ade:	0f 85 8c 00 00 00    	jne    c0003b70 <alloc_smap_bit+0x132>
c0003ae4:	eb 45                	jmp    c0003b2b <alloc_smap_bit+0xed>
c0003ae6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003aec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003aef:	01 d0                	add    %edx,%eax
c0003af1:	0f b6 00             	movzbl (%eax),%eax
c0003af4:	0f be d0             	movsbl %al,%edx
c0003af7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003afa:	89 c1                	mov    %eax,%ecx
c0003afc:	d3 fa                	sar    %cl,%edx
c0003afe:	89 d0                	mov    %edx,%eax
c0003b00:	83 e0 01             	and    $0x1,%eax
c0003b03:	85 c0                	test   %eax,%eax
c0003b05:	74 06                	je     c0003b0d <alloc_smap_bit+0xcf>
c0003b07:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b0b:	eb 1e                	jmp    c0003b2b <alloc_smap_bit+0xed>
c0003b0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b10:	c1 e0 09             	shl    $0x9,%eax
c0003b13:	89 c2                	mov    %eax,%edx
c0003b15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b18:	01 d0                	add    %edx,%eax
c0003b1a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003b21:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b24:	01 d0                	add    %edx,%eax
c0003b26:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003b29:	eb 06                	jmp    c0003b31 <alloc_smap_bit+0xf3>
c0003b2b:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003b2f:	7e b5                	jle    c0003ae6 <alloc_smap_bit+0xa8>
c0003b31:	eb 3d                	jmp    c0003b70 <alloc_smap_bit+0x132>
c0003b33:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b37:	74 45                	je     c0003b7e <alloc_smap_bit+0x140>
c0003b39:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b42:	01 d0                	add    %edx,%eax
c0003b44:	0f b6 18             	movzbl (%eax),%ebx
c0003b47:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b4a:	ba 01 00 00 00       	mov    $0x1,%edx
c0003b4f:	89 c1                	mov    %eax,%ecx
c0003b51:	d3 e2                	shl    %cl,%edx
c0003b53:	89 d0                	mov    %edx,%eax
c0003b55:	89 c1                	mov    %eax,%ecx
c0003b57:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b60:	01 d0                	add    %edx,%eax
c0003b62:	09 cb                	or     %ecx,%ebx
c0003b64:	89 da                	mov    %ebx,%edx
c0003b66:	88 10                	mov    %dl,(%eax)
c0003b68:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003b6c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b70:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b74:	74 09                	je     c0003b7f <alloc_smap_bit+0x141>
c0003b76:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003b7a:	7e b7                	jle    c0003b33 <alloc_smap_bit+0xf5>
c0003b7c:	eb 01                	jmp    c0003b7f <alloc_smap_bit+0x141>
c0003b7e:	90                   	nop
c0003b7f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003b83:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003b8a:	0f 8e 43 ff ff ff    	jle    c0003ad3 <alloc_smap_bit+0x95>
c0003b90:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b94:	74 1e                	je     c0003bb4 <alloc_smap_bit+0x176>
c0003b96:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003b9b:	83 ec 0c             	sub    $0xc,%esp
c0003b9e:	6a 0a                	push   $0xa
c0003ba0:	68 00 02 00 00       	push   $0x200
c0003ba5:	50                   	push   %eax
c0003ba6:	ff 75 d8             	pushl  -0x28(%ebp)
c0003ba9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003bac:	e8 e5 ef ff ff       	call   c0002b96 <rd_wt>
c0003bb1:	83 c4 20             	add    $0x20,%esp
c0003bb4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003bb8:	74 12                	je     c0003bcc <alloc_smap_bit+0x18e>
c0003bba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003bbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003bc1:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003bc4:	0f 8c d4 fe ff ff    	jl     c0003a9e <alloc_smap_bit+0x60>
c0003bca:	eb 01                	jmp    c0003bcd <alloc_smap_bit+0x18f>
c0003bcc:	90                   	nop
c0003bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003bd0:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003bd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003bd6:	8b 00                	mov    (%eax),%eax
c0003bd8:	01 d0                	add    %edx,%eax
c0003bda:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003bdd:	c9                   	leave  
c0003bde:	c3                   	ret    

c0003bdf <new_inode>:
c0003bdf:	55                   	push   %ebp
c0003be0:	89 e5                	mov    %esp,%ebp
c0003be2:	83 ec 38             	sub    $0x38,%esp
c0003be5:	83 ec 08             	sub    $0x8,%esp
c0003be8:	ff 75 0c             	pushl  0xc(%ebp)
c0003beb:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003bee:	50                   	push   %eax
c0003bef:	e8 80 fa ff ff       	call   c0003674 <get_inode>
c0003bf4:	83 c4 10             	add    $0x10,%esp
c0003bf7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003bfa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003bfe:	75 0a                	jne    c0003c0a <new_inode+0x2b>
c0003c00:	b8 00 00 00 00       	mov    $0x0,%eax
c0003c05:	e9 f1 00 00 00       	jmp    c0003cfb <new_inode+0x11c>
c0003c0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c0d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003c10:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003c17:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003c1e:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003c25:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c28:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003c2b:	83 ec 0c             	sub    $0xc,%esp
c0003c2e:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003c31:	50                   	push   %eax
c0003c32:	e8 39 0b 00 00       	call   c0004770 <sync_inode>
c0003c37:	83 c4 10             	add    $0x10,%esp
c0003c3a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003c41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003c48:	eb 1d                	jmp    c0003c67 <new_inode+0x88>
c0003c4a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c4d:	89 d0                	mov    %edx,%eax
c0003c4f:	c1 e0 02             	shl    $0x2,%eax
c0003c52:	01 d0                	add    %edx,%eax
c0003c54:	c1 e0 03             	shl    $0x3,%eax
c0003c57:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003c5c:	8b 00                	mov    (%eax),%eax
c0003c5e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003c61:	74 0c                	je     c0003c6f <new_inode+0x90>
c0003c63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003c67:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003c6b:	7e dd                	jle    c0003c4a <new_inode+0x6b>
c0003c6d:	eb 01                	jmp    c0003c70 <new_inode+0x91>
c0003c6f:	90                   	nop
c0003c70:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c73:	89 d0                	mov    %edx,%eax
c0003c75:	c1 e0 02             	shl    $0x2,%eax
c0003c78:	01 d0                	add    %edx,%eax
c0003c7a:	c1 e0 03             	shl    $0x3,%eax
c0003c7d:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003c82:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003c85:	89 10                	mov    %edx,(%eax)
c0003c87:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c8a:	89 50 04             	mov    %edx,0x4(%eax)
c0003c8d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003c90:	89 50 08             	mov    %edx,0x8(%eax)
c0003c93:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003c96:	89 50 0c             	mov    %edx,0xc(%eax)
c0003c99:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003c9c:	89 50 10             	mov    %edx,0x10(%eax)
c0003c9f:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003ca2:	89 50 14             	mov    %edx,0x14(%eax)
c0003ca5:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003ca8:	89 50 18             	mov    %edx,0x18(%eax)
c0003cab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003cae:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003cb1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003cb4:	89 50 20             	mov    %edx,0x20(%eax)
c0003cb7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003cba:	89 50 24             	mov    %edx,0x24(%eax)
c0003cbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0003cc0:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003cc3:	89 10                	mov    %edx,(%eax)
c0003cc5:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003cc8:	89 50 04             	mov    %edx,0x4(%eax)
c0003ccb:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003cce:	89 50 08             	mov    %edx,0x8(%eax)
c0003cd1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003cd4:	89 50 0c             	mov    %edx,0xc(%eax)
c0003cd7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003cda:	89 50 10             	mov    %edx,0x10(%eax)
c0003cdd:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003ce0:	89 50 14             	mov    %edx,0x14(%eax)
c0003ce3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003ce6:	89 50 18             	mov    %edx,0x18(%eax)
c0003ce9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003cec:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003cef:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003cf2:	89 50 20             	mov    %edx,0x20(%eax)
c0003cf5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003cf8:	89 50 24             	mov    %edx,0x24(%eax)
c0003cfb:	c9                   	leave  
c0003cfc:	c3                   	ret    

c0003cfd <new_dir_entry>:
c0003cfd:	55                   	push   %ebp
c0003cfe:	89 e5                	mov    %esp,%ebp
c0003d00:	83 ec 48             	sub    $0x48,%esp
c0003d03:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003d0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d0d:	8b 40 04             	mov    0x4(%eax),%eax
c0003d10:	99                   	cltd   
c0003d11:	f7 7d dc             	idivl  -0x24(%ebp)
c0003d14:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003d17:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d1a:	8b 40 0c             	mov    0xc(%eax),%eax
c0003d1d:	99                   	cltd   
c0003d1e:	f7 7d dc             	idivl  -0x24(%ebp)
c0003d21:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003d24:	e8 2b 0c 00 00       	call   c0004954 <get_super_block>
c0003d29:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003d2c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003d2f:	8b 00                	mov    (%eax),%eax
c0003d31:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003d34:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d37:	8b 40 0c             	mov    0xc(%eax),%eax
c0003d3a:	05 00 02 00 00       	add    $0x200,%eax
c0003d3f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d45:	85 c0                	test   %eax,%eax
c0003d47:	0f 48 c2             	cmovs  %edx,%eax
c0003d4a:	c1 f8 09             	sar    $0x9,%eax
c0003d4d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003d50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003d57:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003d5e:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003d65:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003d6c:	eb 7f                	jmp    c0003ded <new_dir_entry+0xf0>
c0003d6e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d73:	89 c1                	mov    %eax,%ecx
c0003d75:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003d78:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003d7b:	01 d0                	add    %edx,%eax
c0003d7d:	83 ec 0c             	sub    $0xc,%esp
c0003d80:	6a 07                	push   $0x7
c0003d82:	68 00 02 00 00       	push   $0x200
c0003d87:	51                   	push   %ecx
c0003d88:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003d8b:	50                   	push   %eax
c0003d8c:	e8 05 ee ff ff       	call   c0002b96 <rd_wt>
c0003d91:	83 c4 20             	add    $0x20,%esp
c0003d94:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003d99:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003d9c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003da3:	eb 25                	jmp    c0003dca <new_dir_entry+0xcd>
c0003da5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003da9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003dac:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003daf:	7f 29                	jg     c0003dda <new_dir_entry+0xdd>
c0003db1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003db4:	8b 00                	mov    (%eax),%eax
c0003db6:	85 c0                	test   %eax,%eax
c0003db8:	75 08                	jne    c0003dc2 <new_dir_entry+0xc5>
c0003dba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003dbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003dc0:	eb 19                	jmp    c0003ddb <new_dir_entry+0xde>
c0003dc2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003dc6:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003dca:	b8 00 02 00 00       	mov    $0x200,%eax
c0003dcf:	99                   	cltd   
c0003dd0:	f7 7d dc             	idivl  -0x24(%ebp)
c0003dd3:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003dd6:	7c cd                	jl     c0003da5 <new_dir_entry+0xa8>
c0003dd8:	eb 01                	jmp    c0003ddb <new_dir_entry+0xde>
c0003dda:	90                   	nop
c0003ddb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003dde:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003de1:	7f 16                	jg     c0003df9 <new_dir_entry+0xfc>
c0003de3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003de7:	75 10                	jne    c0003df9 <new_dir_entry+0xfc>
c0003de9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003ded:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003df0:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003df3:	0f 8c 75 ff ff ff    	jl     c0003d6e <new_dir_entry+0x71>
c0003df9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003dfc:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003dff:	75 0a                	jne    c0003e0b <new_dir_entry+0x10e>
c0003e01:	b8 00 00 00 00       	mov    $0x0,%eax
c0003e06:	e9 fc 00 00 00       	jmp    c0003f07 <new_dir_entry+0x20a>
c0003e0b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003e12:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003e16:	75 1e                	jne    c0003e36 <new_dir_entry+0x139>
c0003e18:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e1e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e21:	8b 50 04             	mov    0x4(%eax),%edx
c0003e24:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003e27:	01 c2                	add    %eax,%edx
c0003e29:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e2c:	89 50 04             	mov    %edx,0x4(%eax)
c0003e2f:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e39:	8b 55 14             	mov    0x14(%ebp),%edx
c0003e3c:	89 10                	mov    %edx,(%eax)
c0003e3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e41:	83 c0 04             	add    $0x4,%eax
c0003e44:	83 ec 08             	sub    $0x8,%esp
c0003e47:	ff 75 10             	pushl  0x10(%ebp)
c0003e4a:	50                   	push   %eax
c0003e4b:	e8 06 83 00 00       	call   c000c156 <Strcpy>
c0003e50:	83 c4 10             	add    $0x10,%esp
c0003e53:	8b 45 08             	mov    0x8(%ebp),%eax
c0003e56:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003e59:	8b 0a                	mov    (%edx),%ecx
c0003e5b:	89 08                	mov    %ecx,(%eax)
c0003e5d:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003e60:	89 48 04             	mov    %ecx,0x4(%eax)
c0003e63:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003e66:	89 48 08             	mov    %ecx,0x8(%eax)
c0003e69:	8b 52 0c             	mov    0xc(%edx),%edx
c0003e6c:	89 50 0c             	mov    %edx,0xc(%eax)
c0003e6f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e74:	89 c1                	mov    %eax,%ecx
c0003e76:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003e79:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003e7c:	01 d0                	add    %edx,%eax
c0003e7e:	83 ec 0c             	sub    $0xc,%esp
c0003e81:	6a 0a                	push   $0xa
c0003e83:	68 00 02 00 00       	push   $0x200
c0003e88:	51                   	push   %ecx
c0003e89:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003e8c:	50                   	push   %eax
c0003e8d:	e8 04 ed ff ff       	call   c0002b96 <rd_wt>
c0003e92:	83 c4 20             	add    $0x20,%esp
c0003e95:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003e99:	74 69                	je     c0003f04 <new_dir_entry+0x207>
c0003e9b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e9e:	8b 10                	mov    (%eax),%edx
c0003ea0:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003ea6:	8b 50 04             	mov    0x4(%eax),%edx
c0003ea9:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003eaf:	8b 50 08             	mov    0x8(%eax),%edx
c0003eb2:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003eb8:	8b 50 0c             	mov    0xc(%eax),%edx
c0003ebb:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003ec1:	8b 50 10             	mov    0x10(%eax),%edx
c0003ec4:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003eca:	8b 50 14             	mov    0x14(%eax),%edx
c0003ecd:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003ed3:	8b 50 18             	mov    0x18(%eax),%edx
c0003ed6:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003edc:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003edf:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003ee5:	8b 50 20             	mov    0x20(%eax),%edx
c0003ee8:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003eee:	8b 40 24             	mov    0x24(%eax),%eax
c0003ef1:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003ef6:	83 ec 0c             	sub    $0xc,%esp
c0003ef9:	ff 75 0c             	pushl  0xc(%ebp)
c0003efc:	e8 6f 08 00 00       	call   c0004770 <sync_inode>
c0003f01:	83 c4 10             	add    $0x10,%esp
c0003f04:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f07:	c9                   	leave  
c0003f08:	c3                   	ret    

c0003f09 <do_unlink>:
c0003f09:	55                   	push   %ebp
c0003f0a:	89 e5                	mov    %esp,%ebp
c0003f0c:	53                   	push   %ebx
c0003f0d:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003f13:	83 ec 08             	sub    $0x8,%esp
c0003f16:	ff 75 08             	pushl  0x8(%ebp)
c0003f19:	68 89 b7 00 c0       	push   $0xc000b789
c0003f1e:	e8 e7 68 00 00       	call   c000a80a <strcmp>
c0003f23:	83 c4 10             	add    $0x10,%esp
c0003f26:	85 c0                	test   %eax,%eax
c0003f28:	75 10                	jne    c0003f3a <do_unlink+0x31>
c0003f2a:	83 ec 0c             	sub    $0xc,%esp
c0003f2d:	68 8b b7 00 c0       	push   $0xc000b78b
c0003f32:	e8 2d 5c 00 00       	call   c0009b64 <panic>
c0003f37:	83 c4 10             	add    $0x10,%esp
c0003f3a:	83 ec 0c             	sub    $0xc,%esp
c0003f3d:	ff 75 08             	pushl  0x8(%ebp)
c0003f40:	e8 31 f5 ff ff       	call   c0003476 <search_file>
c0003f45:	83 c4 10             	add    $0x10,%esp
c0003f48:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f4b:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003f4f:	75 10                	jne    c0003f61 <do_unlink+0x58>
c0003f51:	83 ec 0c             	sub    $0xc,%esp
c0003f54:	68 a7 b7 00 c0       	push   $0xc000b7a7
c0003f59:	e8 06 5c 00 00       	call   c0009b64 <panic>
c0003f5e:	83 c4 10             	add    $0x10,%esp
c0003f61:	83 ec 08             	sub    $0x8,%esp
c0003f64:	ff 75 d0             	pushl  -0x30(%ebp)
c0003f67:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003f6d:	50                   	push   %eax
c0003f6e:	e8 01 f7 ff ff       	call   c0003674 <get_inode>
c0003f73:	83 c4 10             	add    $0x10,%esp
c0003f76:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003f79:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003f7d:	75 10                	jne    c0003f8f <do_unlink+0x86>
c0003f7f:	83 ec 0c             	sub    $0xc,%esp
c0003f82:	68 a7 b7 00 c0       	push   $0xc000b7a7
c0003f87:	e8 d8 5b 00 00       	call   c0009b64 <panic>
c0003f8c:	83 c4 10             	add    $0x10,%esp
c0003f8f:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003f92:	85 c0                	test   %eax,%eax
c0003f94:	7e 10                	jle    c0003fa6 <do_unlink+0x9d>
c0003f96:	83 ec 0c             	sub    $0xc,%esp
c0003f99:	68 c0 b7 00 c0       	push   $0xc000b7c0
c0003f9e:	e8 c1 5b 00 00       	call   c0009b64 <panic>
c0003fa3:	83 c4 10             	add    $0x10,%esp
c0003fa6:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003fac:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003faf:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003fb2:	8d 50 07             	lea    0x7(%eax),%edx
c0003fb5:	85 c0                	test   %eax,%eax
c0003fb7:	0f 48 c2             	cmovs  %edx,%eax
c0003fba:	c1 f8 03             	sar    $0x3,%eax
c0003fbd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003fc0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003fc3:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003fc9:	85 c0                	test   %eax,%eax
c0003fcb:	0f 48 c2             	cmovs  %edx,%eax
c0003fce:	c1 f8 09             	sar    $0x9,%eax
c0003fd1:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003fd4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003fd7:	99                   	cltd   
c0003fd8:	c1 ea 1d             	shr    $0x1d,%edx
c0003fdb:	01 d0                	add    %edx,%eax
c0003fdd:	83 e0 07             	and    $0x7,%eax
c0003fe0:	29 d0                	sub    %edx,%eax
c0003fe2:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003fe5:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003fec:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ff1:	89 c2                	mov    %eax,%edx
c0003ff3:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003ff6:	83 c0 02             	add    $0x2,%eax
c0003ff9:	83 ec 0c             	sub    $0xc,%esp
c0003ffc:	6a 07                	push   $0x7
c0003ffe:	68 00 02 00 00       	push   $0x200
c0004003:	52                   	push   %edx
c0004004:	ff 75 b8             	pushl  -0x48(%ebp)
c0004007:	50                   	push   %eax
c0004008:	e8 89 eb ff ff       	call   c0002b96 <rd_wt>
c000400d:	83 c4 20             	add    $0x20,%esp
c0004010:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004016:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004019:	01 d0                	add    %edx,%eax
c000401b:	0f b6 10             	movzbl (%eax),%edx
c000401e:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004021:	bb 01 00 00 00       	mov    $0x1,%ebx
c0004026:	89 c1                	mov    %eax,%ecx
c0004028:	d3 e3                	shl    %cl,%ebx
c000402a:	89 d8                	mov    %ebx,%eax
c000402c:	f7 d0                	not    %eax
c000402e:	89 c3                	mov    %eax,%ebx
c0004030:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0004036:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004039:	01 c8                	add    %ecx,%eax
c000403b:	21 da                	and    %ebx,%edx
c000403d:	88 10                	mov    %dl,(%eax)
c000403f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004044:	89 c2                	mov    %eax,%edx
c0004046:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004049:	83 c0 02             	add    $0x2,%eax
c000404c:	83 ec 0c             	sub    $0xc,%esp
c000404f:	6a 0a                	push   $0xa
c0004051:	68 00 02 00 00       	push   $0x200
c0004056:	52                   	push   %edx
c0004057:	ff 75 b8             	pushl  -0x48(%ebp)
c000405a:	50                   	push   %eax
c000405b:	e8 36 eb ff ff       	call   c0002b96 <rd_wt>
c0004060:	83 c4 20             	add    $0x20,%esp
c0004063:	e8 ec 08 00 00       	call   c0004954 <get_super_block>
c0004068:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000406b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0004071:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004074:	8b 00                	mov    (%eax),%eax
c0004076:	29 c2                	sub    %eax,%edx
c0004078:	89 d0                	mov    %edx,%eax
c000407a:	83 c0 01             	add    $0x1,%eax
c000407d:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0004080:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004083:	8d 50 07             	lea    0x7(%eax),%edx
c0004086:	85 c0                	test   %eax,%eax
c0004088:	0f 48 c2             	cmovs  %edx,%eax
c000408b:	c1 f8 03             	sar    $0x3,%eax
c000408e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004091:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0004094:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000409a:	85 c0                	test   %eax,%eax
c000409c:	0f 48 c2             	cmovs  %edx,%eax
c000409f:	c1 f8 09             	sar    $0x9,%eax
c00040a2:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00040a5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00040a8:	99                   	cltd   
c00040a9:	c1 ea 1d             	shr    $0x1d,%edx
c00040ac:	01 d0                	add    %edx,%eax
c00040ae:	83 e0 07             	and    $0x7,%eax
c00040b1:	29 d0                	sub    %edx,%eax
c00040b3:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00040b6:	b8 08 00 00 00       	mov    $0x8,%eax
c00040bb:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c00040be:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00040c1:	29 c2                	sub    %eax,%edx
c00040c3:	89 d0                	mov    %edx,%eax
c00040c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00040c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00040cb:	8d 50 07             	lea    0x7(%eax),%edx
c00040ce:	85 c0                	test   %eax,%eax
c00040d0:	0f 48 c2             	cmovs  %edx,%eax
c00040d3:	c1 f8 03             	sar    $0x3,%eax
c00040d6:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00040d9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00040de:	89 c1                	mov    %eax,%ecx
c00040e0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00040e3:	8b 40 04             	mov    0x4(%eax),%eax
c00040e6:	8d 50 02             	lea    0x2(%eax),%edx
c00040e9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00040ec:	01 d0                	add    %edx,%eax
c00040ee:	83 ec 0c             	sub    $0xc,%esp
c00040f1:	6a 07                	push   $0x7
c00040f3:	68 00 02 00 00       	push   $0x200
c00040f8:	51                   	push   %ecx
c00040f9:	ff 75 b8             	pushl  -0x48(%ebp)
c00040fc:	50                   	push   %eax
c00040fd:	e8 94 ea ff ff       	call   c0002b96 <rd_wt>
c0004102:	83 c4 20             	add    $0x20,%esp
c0004105:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000410b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000410e:	01 d0                	add    %edx,%eax
c0004110:	0f b6 10             	movzbl (%eax),%edx
c0004113:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004116:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c000411b:	89 c1                	mov    %eax,%ecx
c000411d:	d3 e3                	shl    %cl,%ebx
c000411f:	89 d8                	mov    %ebx,%eax
c0004121:	f7 d0                	not    %eax
c0004123:	89 c3                	mov    %eax,%ebx
c0004125:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c000412b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000412e:	01 c8                	add    %ecx,%eax
c0004130:	21 da                	and    %ebx,%edx
c0004132:	88 10                	mov    %dl,(%eax)
c0004134:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000413b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000413e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004141:	eb 6b                	jmp    c00041ae <do_unlink+0x2a5>
c0004143:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c000414a:	75 4c                	jne    c0004198 <do_unlink+0x28f>
c000414c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004153:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004158:	83 ec 0c             	sub    $0xc,%esp
c000415b:	6a 0a                	push   $0xa
c000415d:	68 00 02 00 00       	push   $0x200
c0004162:	50                   	push   %eax
c0004163:	ff 75 b8             	pushl  -0x48(%ebp)
c0004166:	ff 75 ec             	pushl  -0x14(%ebp)
c0004169:	e8 28 ea ff ff       	call   c0002b96 <rd_wt>
c000416e:	83 c4 20             	add    $0x20,%esp
c0004171:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004176:	89 c1                	mov    %eax,%ecx
c0004178:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000417b:	8d 50 01             	lea    0x1(%eax),%edx
c000417e:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004181:	83 ec 0c             	sub    $0xc,%esp
c0004184:	6a 07                	push   $0x7
c0004186:	68 00 02 00 00       	push   $0x200
c000418b:	51                   	push   %ecx
c000418c:	ff 75 b8             	pushl  -0x48(%ebp)
c000418f:	50                   	push   %eax
c0004190:	e8 01 ea ff ff       	call   c0002b96 <rd_wt>
c0004195:	83 c4 20             	add    $0x20,%esp
c0004198:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000419e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041a1:	01 d0                	add    %edx,%eax
c00041a3:	c6 00 00             	movb   $0x0,(%eax)
c00041a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00041aa:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c00041ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041b1:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c00041b4:	7c 8d                	jl     c0004143 <do_unlink+0x23a>
c00041b6:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c00041bd:	75 4c                	jne    c000420b <do_unlink+0x302>
c00041bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00041c6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041cb:	83 ec 0c             	sub    $0xc,%esp
c00041ce:	6a 0a                	push   $0xa
c00041d0:	68 00 02 00 00       	push   $0x200
c00041d5:	50                   	push   %eax
c00041d6:	ff 75 b8             	pushl  -0x48(%ebp)
c00041d9:	ff 75 ec             	pushl  -0x14(%ebp)
c00041dc:	e8 b5 e9 ff ff       	call   c0002b96 <rd_wt>
c00041e1:	83 c4 20             	add    $0x20,%esp
c00041e4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041e9:	89 c1                	mov    %eax,%ecx
c00041eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041ee:	8d 50 01             	lea    0x1(%eax),%edx
c00041f1:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00041f4:	83 ec 0c             	sub    $0xc,%esp
c00041f7:	6a 07                	push   $0x7
c00041f9:	68 00 02 00 00       	push   $0x200
c00041fe:	51                   	push   %ecx
c00041ff:	ff 75 b8             	pushl  -0x48(%ebp)
c0004202:	50                   	push   %eax
c0004203:	e8 8e e9 ff ff       	call   c0002b96 <rd_wt>
c0004208:	83 c4 20             	add    $0x20,%esp
c000420b:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004211:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004214:	01 d0                	add    %edx,%eax
c0004216:	0f b6 10             	movzbl (%eax),%edx
c0004219:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000421c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0004221:	89 c1                	mov    %eax,%ecx
c0004223:	d3 e3                	shl    %cl,%ebx
c0004225:	89 d8                	mov    %ebx,%eax
c0004227:	89 c3                	mov    %eax,%ebx
c0004229:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c000422f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004232:	01 c8                	add    %ecx,%eax
c0004234:	21 da                	and    %ebx,%edx
c0004236:	88 10                	mov    %dl,(%eax)
c0004238:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000423d:	83 ec 0c             	sub    $0xc,%esp
c0004240:	6a 0a                	push   $0xa
c0004242:	68 00 02 00 00       	push   $0x200
c0004247:	50                   	push   %eax
c0004248:	ff 75 b8             	pushl  -0x48(%ebp)
c000424b:	ff 75 ec             	pushl  -0x14(%ebp)
c000424e:	e8 43 e9 ff ff       	call   c0002b96 <rd_wt>
c0004253:	83 c4 20             	add    $0x20,%esp
c0004256:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c000425d:	00 00 00 
c0004260:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0004267:	00 00 00 
c000426a:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0004271:	00 00 00 
c0004274:	83 ec 0c             	sub    $0xc,%esp
c0004277:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000427d:	50                   	push   %eax
c000427e:	e8 ed 04 00 00       	call   c0004770 <sync_inode>
c0004283:	83 c4 10             	add    $0x10,%esp
c0004286:	83 ec 0c             	sub    $0xc,%esp
c0004289:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000428f:	50                   	push   %eax
c0004290:	e8 2f 06 00 00       	call   c00048c4 <put_inode>
c0004295:	83 c4 10             	add    $0x10,%esp
c0004298:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000429b:	8b 00                	mov    (%eax),%eax
c000429d:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00042a0:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c00042a7:	8b 45 98             	mov    -0x68(%ebp),%eax
c00042aa:	8b 40 04             	mov    0x4(%eax),%eax
c00042ad:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00042b0:	8b 45 98             	mov    -0x68(%ebp),%eax
c00042b3:	8b 40 0c             	mov    0xc(%eax),%eax
c00042b6:	89 45 90             	mov    %eax,-0x70(%ebp)
c00042b9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00042bc:	c1 e8 04             	shr    $0x4,%eax
c00042bf:	89 45 8c             	mov    %eax,-0x74(%ebp)
c00042c2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00042c9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00042d0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00042d7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00042de:	e9 a5 00 00 00       	jmp    c0004388 <do_unlink+0x47f>
c00042e3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00042e8:	89 c1                	mov    %eax,%ecx
c00042ea:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00042ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042f0:	01 d0                	add    %edx,%eax
c00042f2:	83 ec 0c             	sub    $0xc,%esp
c00042f5:	6a 07                	push   $0x7
c00042f7:	68 00 02 00 00       	push   $0x200
c00042fc:	51                   	push   %ecx
c00042fd:	ff 75 b8             	pushl  -0x48(%ebp)
c0004300:	50                   	push   %eax
c0004301:	e8 90 e8 ff ff       	call   c0002b96 <rd_wt>
c0004306:	83 c4 20             	add    $0x20,%esp
c0004309:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000430e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004311:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0004318:	eb 51                	jmp    c000436b <do_unlink+0x462>
c000431a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000431e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004321:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004324:	7f 4f                	jg     c0004375 <do_unlink+0x46c>
c0004326:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004329:	83 c0 10             	add    $0x10,%eax
c000432c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000432f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004332:	83 c0 04             	add    $0x4,%eax
c0004335:	83 ec 08             	sub    $0x8,%esp
c0004338:	ff 75 08             	pushl  0x8(%ebp)
c000433b:	50                   	push   %eax
c000433c:	e8 c9 64 00 00       	call   c000a80a <strcmp>
c0004341:	83 c4 10             	add    $0x10,%esp
c0004344:	85 c0                	test   %eax,%eax
c0004346:	75 1b                	jne    c0004363 <do_unlink+0x45a>
c0004348:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000434f:	83 ec 04             	sub    $0x4,%esp
c0004352:	6a 10                	push   $0x10
c0004354:	6a 00                	push   $0x0
c0004356:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004359:	e8 d9 7d 00 00       	call   c000c137 <Memset>
c000435e:	83 c4 10             	add    $0x10,%esp
c0004361:	eb 13                	jmp    c0004376 <do_unlink+0x46d>
c0004363:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0004367:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c000436b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000436e:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0004371:	7c a7                	jl     c000431a <do_unlink+0x411>
c0004373:	eb 01                	jmp    c0004376 <do_unlink+0x46d>
c0004375:	90                   	nop
c0004376:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004379:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c000437c:	7f 16                	jg     c0004394 <do_unlink+0x48b>
c000437e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004382:	75 10                	jne    c0004394 <do_unlink+0x48b>
c0004384:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0004388:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000438b:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000438e:	0f 8c 4f ff ff ff    	jl     c00042e3 <do_unlink+0x3da>
c0004394:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004397:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c000439a:	75 17                	jne    c00043b3 <do_unlink+0x4aa>
c000439c:	8b 45 98             	mov    -0x68(%ebp),%eax
c000439f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00043a2:	89 50 04             	mov    %edx,0x4(%eax)
c00043a5:	83 ec 0c             	sub    $0xc,%esp
c00043a8:	ff 75 98             	pushl  -0x68(%ebp)
c00043ab:	e8 c0 03 00 00       	call   c0004770 <sync_inode>
c00043b0:	83 c4 10             	add    $0x10,%esp
c00043b3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00043b7:	74 26                	je     c00043df <do_unlink+0x4d6>
c00043b9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00043be:	89 c1                	mov    %eax,%ecx
c00043c0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00043c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00043c6:	01 d0                	add    %edx,%eax
c00043c8:	83 ec 0c             	sub    $0xc,%esp
c00043cb:	6a 0a                	push   $0xa
c00043cd:	68 00 02 00 00       	push   $0x200
c00043d2:	51                   	push   %ecx
c00043d3:	ff 75 b8             	pushl  -0x48(%ebp)
c00043d6:	50                   	push   %eax
c00043d7:	e8 ba e7 ff ff       	call   c0002b96 <rd_wt>
c00043dc:	83 c4 20             	add    $0x20,%esp
c00043df:	90                   	nop
c00043e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00043e3:	c9                   	leave  
c00043e4:	c3                   	ret    

c00043e5 <do_rdwt>:
c00043e5:	55                   	push   %ebp
c00043e6:	89 e5                	mov    %esp,%ebp
c00043e8:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00043ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00043f1:	8b 40 68             	mov    0x68(%eax),%eax
c00043f4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00043f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00043fa:	8b 40 50             	mov    0x50(%eax),%eax
c00043fd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004400:	8b 45 08             	mov    0x8(%ebp),%eax
c0004403:	8b 40 5c             	mov    0x5c(%eax),%eax
c0004406:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004409:	8b 45 08             	mov    0x8(%ebp),%eax
c000440c:	8b 00                	mov    (%eax),%eax
c000440e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004411:	8b 45 08             	mov    0x8(%ebp),%eax
c0004414:	8b 40 10             	mov    0x10(%eax),%eax
c0004417:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000441a:	8b 45 08             	mov    0x8(%ebp),%eax
c000441d:	8b 40 40             	mov    0x40(%eax),%eax
c0004420:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004423:	83 ec 0c             	sub    $0xc,%esp
c0004426:	ff 75 d0             	pushl  -0x30(%ebp)
c0004429:	e8 45 0a 00 00       	call   c0004e73 <pid2proc>
c000442e:	83 c4 10             	add    $0x10,%esp
c0004431:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004434:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004437:	8b 55 c8             	mov    -0x38(%ebp),%edx
c000443a:	83 c2 50             	add    $0x50,%edx
c000443d:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004441:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004444:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004447:	8b 40 08             	mov    0x8(%eax),%eax
c000444a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000444d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004450:	8b 00                	mov    (%eax),%eax
c0004452:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0004455:	83 ec 08             	sub    $0x8,%esp
c0004458:	ff 75 bc             	pushl  -0x44(%ebp)
c000445b:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004461:	50                   	push   %eax
c0004462:	e8 0d f2 ff ff       	call   c0003674 <get_inode>
c0004467:	83 c4 10             	add    $0x10,%esp
c000446a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000446d:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c0004471:	75 10                	jne    c0004483 <do_rdwt+0x9e>
c0004473:	83 ec 0c             	sub    $0xc,%esp
c0004476:	68 f8 b7 00 c0       	push   $0xc000b7f8
c000447b:	e8 e4 56 00 00       	call   c0009b64 <panic>
c0004480:	83 c4 10             	add    $0x10,%esp
c0004483:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004489:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000448c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000448f:	8b 40 04             	mov    0x4(%eax),%eax
c0004492:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004495:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004499:	74 22                	je     c00044bd <do_rdwt+0xd8>
c000449b:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000449f:	74 1c                	je     c00044bd <do_rdwt+0xd8>
c00044a1:	68 a2 04 00 00       	push   $0x4a2
c00044a6:	68 64 b6 00 c0       	push   $0xc000b664
c00044ab:	68 64 b6 00 c0       	push   $0xc000b664
c00044b0:	68 08 b8 00 c0       	push   $0xc000b808
c00044b5:	e8 c8 56 00 00       	call   c0009b82 <assertion_failure>
c00044ba:	83 c4 10             	add    $0x10,%esp
c00044bd:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00044c3:	83 f8 01             	cmp    $0x1,%eax
c00044c6:	0f 85 86 00 00 00    	jne    c0004552 <do_rdwt+0x16d>
c00044cc:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00044d0:	75 09                	jne    c00044db <do_rdwt+0xf6>
c00044d2:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c00044d9:	eb 0d                	jmp    c00044e8 <do_rdwt+0x103>
c00044db:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00044df:	75 07                	jne    c00044e8 <do_rdwt+0x103>
c00044e1:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c00044e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00044eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00044ee:	89 50 68             	mov    %edx,0x68(%eax)
c00044f1:	8b 55 b8             	mov    -0x48(%ebp),%edx
c00044f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00044f7:	89 50 58             	mov    %edx,0x58(%eax)
c00044fa:	83 ec 04             	sub    $0x4,%esp
c00044fd:	6a 04                	push   $0x4
c00044ff:	ff 75 08             	pushl  0x8(%ebp)
c0004502:	6a 03                	push   $0x3
c0004504:	e8 a5 5f 00 00       	call   c000a4ae <send_rec>
c0004509:	83 c4 10             	add    $0x10,%esp
c000450c:	8b 45 08             	mov    0x8(%ebp),%eax
c000450f:	8b 40 68             	mov    0x68(%eax),%eax
c0004512:	83 f8 66             	cmp    $0x66,%eax
c0004515:	75 13                	jne    c000452a <do_rdwt+0x145>
c0004517:	83 ec 04             	sub    $0x4,%esp
c000451a:	ff 75 b8             	pushl  -0x48(%ebp)
c000451d:	ff 75 08             	pushl  0x8(%ebp)
c0004520:	6a 01                	push   $0x1
c0004522:	e8 87 5f 00 00       	call   c000a4ae <send_rec>
c0004527:	83 c4 10             	add    $0x10,%esp
c000452a:	8b 45 08             	mov    0x8(%ebp),%eax
c000452d:	8b 40 68             	mov    0x68(%eax),%eax
c0004530:	83 f8 65             	cmp    $0x65,%eax
c0004533:	75 13                	jne    c0004548 <do_rdwt+0x163>
c0004535:	83 ec 04             	sub    $0x4,%esp
c0004538:	ff 75 b8             	pushl  -0x48(%ebp)
c000453b:	ff 75 08             	pushl  0x8(%ebp)
c000453e:	6a 01                	push   $0x1
c0004540:	e8 69 5f 00 00       	call   c000a4ae <send_rec>
c0004545:	83 c4 10             	add    $0x10,%esp
c0004548:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000454d:	e9 1c 02 00 00       	jmp    c000476e <do_rdwt+0x389>
c0004552:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004556:	75 18                	jne    c0004570 <do_rdwt+0x18b>
c0004558:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000455e:	c1 e0 09             	shl    $0x9,%eax
c0004561:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004564:	75 0a                	jne    c0004570 <do_rdwt+0x18b>
c0004566:	b8 00 00 00 00       	mov    $0x0,%eax
c000456b:	e9 fe 01 00 00       	jmp    c000476e <do_rdwt+0x389>
c0004570:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004574:	75 14                	jne    c000458a <do_rdwt+0x1a5>
c0004576:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0004579:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000457c:	01 d0                	add    %edx,%eax
c000457e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0004581:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0004585:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004588:	eb 19                	jmp    c00045a3 <do_rdwt+0x1be>
c000458a:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000458d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004590:	01 c2                	add    %eax,%edx
c0004592:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0004598:	c1 e0 09             	shl    $0x9,%eax
c000459b:	39 c2                	cmp    %eax,%edx
c000459d:	0f 4e c2             	cmovle %edx,%eax
c00045a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00045a3:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00045a6:	99                   	cltd   
c00045a7:	c1 ea 17             	shr    $0x17,%edx
c00045aa:	01 d0                	add    %edx,%eax
c00045ac:	25 ff 01 00 00       	and    $0x1ff,%eax
c00045b1:	29 d0                	sub    %edx,%eax
c00045b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00045b6:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00045bc:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00045bf:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00045c5:	85 c0                	test   %eax,%eax
c00045c7:	0f 48 c1             	cmovs  %ecx,%eax
c00045ca:	c1 f8 09             	sar    $0x9,%eax
c00045cd:	01 d0                	add    %edx,%eax
c00045cf:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00045d2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00045d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00045db:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00045e1:	85 c0                	test   %eax,%eax
c00045e3:	0f 48 c1             	cmovs  %ecx,%eax
c00045e6:	c1 f8 09             	sar    $0x9,%eax
c00045e9:	01 d0                	add    %edx,%eax
c00045eb:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00045ee:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00045f1:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00045f4:	ba 00 00 10 00       	mov    $0x100000,%edx
c00045f9:	39 d0                	cmp    %edx,%eax
c00045fb:	7d 0b                	jge    c0004608 <do_rdwt+0x223>
c00045fd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004600:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004603:	83 c0 01             	add    $0x1,%eax
c0004606:	eb 05                	jmp    c000460d <do_rdwt+0x228>
c0004608:	b8 00 00 10 00       	mov    $0x100000,%eax
c000460d:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004610:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004613:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004616:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000461d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004620:	8b 00                	mov    (%eax),%eax
c0004622:	83 ec 0c             	sub    $0xc,%esp
c0004625:	50                   	push   %eax
c0004626:	e8 48 08 00 00       	call   c0004e73 <pid2proc>
c000462b:	83 c4 10             	add    $0x10,%esp
c000462e:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004631:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004634:	83 ec 08             	sub    $0x8,%esp
c0004637:	50                   	push   %eax
c0004638:	ff 75 cc             	pushl  -0x34(%ebp)
c000463b:	e8 70 2b 00 00       	call   c00071b0 <alloc_virtual_memory>
c0004640:	83 c4 10             	add    $0x10,%esp
c0004643:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004646:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0004649:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000464c:	e9 c5 00 00 00       	jmp    c0004716 <do_rdwt+0x331>
c0004651:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004654:	c1 e0 09             	shl    $0x9,%eax
c0004657:	2b 45 ec             	sub    -0x14(%ebp),%eax
c000465a:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000465d:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c0004661:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004664:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c000466b:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000466f:	75 46                	jne    c00046b7 <do_rdwt+0x2d2>
c0004671:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004674:	c1 e0 09             	shl    $0x9,%eax
c0004677:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000467d:	83 ec 0c             	sub    $0xc,%esp
c0004680:	6a 07                	push   $0x7
c0004682:	50                   	push   %eax
c0004683:	52                   	push   %edx
c0004684:	ff 75 90             	pushl  -0x70(%ebp)
c0004687:	ff 75 e0             	pushl  -0x20(%ebp)
c000468a:	e8 07 e5 ff ff       	call   c0002b96 <rd_wt>
c000468f:	83 c4 20             	add    $0x20,%esp
c0004692:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004698:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000469b:	01 d0                	add    %edx,%eax
c000469d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c00046a0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00046a3:	01 ca                	add    %ecx,%edx
c00046a5:	83 ec 04             	sub    $0x4,%esp
c00046a8:	ff 75 94             	pushl  -0x6c(%ebp)
c00046ab:	50                   	push   %eax
c00046ac:	52                   	push   %edx
c00046ad:	e8 af 35 00 00       	call   c0007c61 <Memcpy>
c00046b2:	83 c4 10             	add    $0x10,%esp
c00046b5:	eb 46                	jmp    c00046fd <do_rdwt+0x318>
c00046b7:	8b 55 98             	mov    -0x68(%ebp),%edx
c00046ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00046bd:	01 d0                	add    %edx,%eax
c00046bf:	89 c1                	mov    %eax,%ecx
c00046c1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00046c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046ca:	01 d0                	add    %edx,%eax
c00046cc:	83 ec 04             	sub    $0x4,%esp
c00046cf:	ff 75 94             	pushl  -0x6c(%ebp)
c00046d2:	51                   	push   %ecx
c00046d3:	50                   	push   %eax
c00046d4:	e8 88 35 00 00       	call   c0007c61 <Memcpy>
c00046d9:	83 c4 10             	add    $0x10,%esp
c00046dc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046df:	c1 e0 09             	shl    $0x9,%eax
c00046e2:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00046e8:	83 ec 0c             	sub    $0xc,%esp
c00046eb:	6a 0a                	push   $0xa
c00046ed:	50                   	push   %eax
c00046ee:	52                   	push   %edx
c00046ef:	ff 75 90             	pushl  -0x70(%ebp)
c00046f2:	ff 75 e0             	pushl  -0x20(%ebp)
c00046f5:	e8 9c e4 ff ff       	call   c0002b96 <rd_wt>
c00046fa:	83 c4 20             	add    $0x20,%esp
c00046fd:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004700:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004703:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004706:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0004709:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004710:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004713:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004716:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004719:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c000471c:	7f 0a                	jg     c0004728 <do_rdwt+0x343>
c000471e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004722:	0f 85 29 ff ff ff    	jne    c0004651 <do_rdwt+0x26c>
c0004728:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000472b:	8b 50 04             	mov    0x4(%eax),%edx
c000472e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004731:	01 c2                	add    %eax,%edx
c0004733:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004736:	89 50 04             	mov    %edx,0x4(%eax)
c0004739:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000473c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000473f:	01 c2                	add    %eax,%edx
c0004741:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004747:	39 c2                	cmp    %eax,%edx
c0004749:	7e 20                	jle    c000476b <do_rdwt+0x386>
c000474b:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000474e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004751:	01 d0                	add    %edx,%eax
c0004753:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0004759:	83 ec 0c             	sub    $0xc,%esp
c000475c:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004762:	50                   	push   %eax
c0004763:	e8 08 00 00 00       	call   c0004770 <sync_inode>
c0004768:	83 c4 10             	add    $0x10,%esp
c000476b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000476e:	c9                   	leave  
c000476f:	c3                   	ret    

c0004770 <sync_inode>:
c0004770:	55                   	push   %ebp
c0004771:	89 e5                	mov    %esp,%ebp
c0004773:	53                   	push   %ebx
c0004774:	83 ec 34             	sub    $0x34,%esp
c0004777:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000477e:	eb 74                	jmp    c00047f4 <sync_inode+0x84>
c0004780:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004783:	89 d0                	mov    %edx,%eax
c0004785:	c1 e0 02             	shl    $0x2,%eax
c0004788:	01 d0                	add    %edx,%eax
c000478a:	c1 e0 03             	shl    $0x3,%eax
c000478d:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0004792:	8b 10                	mov    (%eax),%edx
c0004794:	8b 45 08             	mov    0x8(%ebp),%eax
c0004797:	8b 40 10             	mov    0x10(%eax),%eax
c000479a:	39 c2                	cmp    %eax,%edx
c000479c:	75 52                	jne    c00047f0 <sync_inode+0x80>
c000479e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00047a1:	89 d0                	mov    %edx,%eax
c00047a3:	c1 e0 02             	shl    $0x2,%eax
c00047a6:	01 d0                	add    %edx,%eax
c00047a8:	c1 e0 03             	shl    $0x3,%eax
c00047ab:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c00047b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00047b4:	8b 08                	mov    (%eax),%ecx
c00047b6:	89 0a                	mov    %ecx,(%edx)
c00047b8:	8b 48 04             	mov    0x4(%eax),%ecx
c00047bb:	89 4a 04             	mov    %ecx,0x4(%edx)
c00047be:	8b 48 08             	mov    0x8(%eax),%ecx
c00047c1:	89 4a 08             	mov    %ecx,0x8(%edx)
c00047c4:	8b 48 0c             	mov    0xc(%eax),%ecx
c00047c7:	89 4a 0c             	mov    %ecx,0xc(%edx)
c00047ca:	8b 48 10             	mov    0x10(%eax),%ecx
c00047cd:	89 4a 10             	mov    %ecx,0x10(%edx)
c00047d0:	8b 48 14             	mov    0x14(%eax),%ecx
c00047d3:	89 4a 14             	mov    %ecx,0x14(%edx)
c00047d6:	8b 48 18             	mov    0x18(%eax),%ecx
c00047d9:	89 4a 18             	mov    %ecx,0x18(%edx)
c00047dc:	8b 48 1c             	mov    0x1c(%eax),%ecx
c00047df:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c00047e2:	8b 48 20             	mov    0x20(%eax),%ecx
c00047e5:	89 4a 20             	mov    %ecx,0x20(%edx)
c00047e8:	8b 40 24             	mov    0x24(%eax),%eax
c00047eb:	89 42 24             	mov    %eax,0x24(%edx)
c00047ee:	eb 0a                	jmp    c00047fa <sync_inode+0x8a>
c00047f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00047f4:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00047f8:	7e 86                	jle    c0004780 <sync_inode+0x10>
c00047fa:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004801:	8b 45 08             	mov    0x8(%ebp),%eax
c0004804:	8b 40 10             	mov    0x10(%eax),%eax
c0004807:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000480a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000480d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004810:	b8 00 02 00 00       	mov    $0x200,%eax
c0004815:	99                   	cltd   
c0004816:	f7 7d f0             	idivl  -0x10(%ebp)
c0004819:	89 c3                	mov    %eax,%ebx
c000481b:	89 c8                	mov    %ecx,%eax
c000481d:	99                   	cltd   
c000481e:	f7 fb                	idiv   %ebx
c0004820:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004823:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004826:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004829:	b8 00 02 00 00       	mov    $0x200,%eax
c000482e:	99                   	cltd   
c000482f:	f7 7d f0             	idivl  -0x10(%ebp)
c0004832:	89 c3                	mov    %eax,%ebx
c0004834:	89 c8                	mov    %ecx,%eax
c0004836:	99                   	cltd   
c0004837:	f7 fb                	idiv   %ebx
c0004839:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000483c:	8b 45 08             	mov    0x8(%ebp),%eax
c000483f:	8b 40 20             	mov    0x20(%eax),%eax
c0004842:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004845:	e8 0a 01 00 00       	call   c0004954 <get_super_block>
c000484a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000484d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004850:	8b 40 04             	mov    0x4(%eax),%eax
c0004853:	8d 50 02             	lea    0x2(%eax),%edx
c0004856:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004859:	8b 40 08             	mov    0x8(%eax),%eax
c000485c:	01 c2                	add    %eax,%edx
c000485e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004861:	01 d0                	add    %edx,%eax
c0004863:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004866:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000486b:	83 ec 0c             	sub    $0xc,%esp
c000486e:	6a 07                	push   $0x7
c0004870:	68 00 02 00 00       	push   $0x200
c0004875:	50                   	push   %eax
c0004876:	ff 75 e0             	pushl  -0x20(%ebp)
c0004879:	ff 75 d8             	pushl  -0x28(%ebp)
c000487c:	e8 15 e3 ff ff       	call   c0002b96 <rd_wt>
c0004881:	83 c4 20             	add    $0x20,%esp
c0004884:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0004889:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000488c:	83 ec 04             	sub    $0x4,%esp
c000488f:	ff 75 f0             	pushl  -0x10(%ebp)
c0004892:	ff 75 08             	pushl  0x8(%ebp)
c0004895:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004898:	e8 c4 33 00 00       	call   c0007c61 <Memcpy>
c000489d:	83 c4 10             	add    $0x10,%esp
c00048a0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00048a5:	83 ec 0c             	sub    $0xc,%esp
c00048a8:	6a 0a                	push   $0xa
c00048aa:	68 00 02 00 00       	push   $0x200
c00048af:	50                   	push   %eax
c00048b0:	ff 75 e0             	pushl  -0x20(%ebp)
c00048b3:	ff 75 d8             	pushl  -0x28(%ebp)
c00048b6:	e8 db e2 ff ff       	call   c0002b96 <rd_wt>
c00048bb:	83 c4 20             	add    $0x20,%esp
c00048be:	90                   	nop
c00048bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00048c2:	c9                   	leave  
c00048c3:	c3                   	ret    

c00048c4 <put_inode>:
c00048c4:	55                   	push   %ebp
c00048c5:	89 e5                	mov    %esp,%ebp
c00048c7:	83 ec 08             	sub    $0x8,%esp
c00048ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00048cd:	8b 40 24             	mov    0x24(%eax),%eax
c00048d0:	85 c0                	test   %eax,%eax
c00048d2:	7f 1c                	jg     c00048f0 <put_inode+0x2c>
c00048d4:	68 47 05 00 00       	push   $0x547
c00048d9:	68 64 b6 00 c0       	push   $0xc000b664
c00048de:	68 64 b6 00 c0       	push   $0xc000b664
c00048e3:	68 3c b8 00 c0       	push   $0xc000b83c
c00048e8:	e8 95 52 00 00       	call   c0009b82 <assertion_failure>
c00048ed:	83 c4 10             	add    $0x10,%esp
c00048f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00048f3:	8b 40 24             	mov    0x24(%eax),%eax
c00048f6:	8d 50 ff             	lea    -0x1(%eax),%edx
c00048f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00048fc:	89 50 24             	mov    %edx,0x24(%eax)
c00048ff:	90                   	nop
c0004900:	c9                   	leave  
c0004901:	c3                   	ret    

c0004902 <do_close>:
c0004902:	55                   	push   %ebp
c0004903:	89 e5                	mov    %esp,%ebp
c0004905:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000490a:	8b 55 08             	mov    0x8(%ebp),%edx
c000490d:	83 c2 50             	add    $0x50,%edx
c0004910:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004914:	8b 50 0c             	mov    0xc(%eax),%edx
c0004917:	83 ea 01             	sub    $0x1,%edx
c000491a:	89 50 0c             	mov    %edx,0xc(%eax)
c000491d:	8b 40 0c             	mov    0xc(%eax),%eax
c0004920:	85 c0                	test   %eax,%eax
c0004922:	75 16                	jne    c000493a <do_close+0x38>
c0004924:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004929:	8b 55 08             	mov    0x8(%ebp),%edx
c000492c:	83 c2 50             	add    $0x50,%edx
c000492f:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004933:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000493a:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000493f:	8b 55 08             	mov    0x8(%ebp),%edx
c0004942:	83 c2 50             	add    $0x50,%edx
c0004945:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c000494c:	00 
c000494d:	b8 00 00 00 00       	mov    $0x0,%eax
c0004952:	5d                   	pop    %ebp
c0004953:	c3                   	ret    

c0004954 <get_super_block>:
c0004954:	55                   	push   %ebp
c0004955:	89 e5                	mov    %esp,%ebp
c0004957:	83 ec 08             	sub    $0x8,%esp
c000495a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000495f:	83 ec 0c             	sub    $0xc,%esp
c0004962:	6a 07                	push   $0x7
c0004964:	68 00 02 00 00       	push   $0x200
c0004969:	50                   	push   %eax
c000496a:	6a 20                	push   $0x20
c000496c:	6a 01                	push   $0x1
c000496e:	e8 23 e2 ff ff       	call   c0002b96 <rd_wt>
c0004973:	83 c4 20             	add    $0x20,%esp
c0004976:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000497c:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0004981:	8b 0a                	mov    (%edx),%ecx
c0004983:	89 08                	mov    %ecx,(%eax)
c0004985:	8b 4a 04             	mov    0x4(%edx),%ecx
c0004988:	89 48 04             	mov    %ecx,0x4(%eax)
c000498b:	8b 4a 08             	mov    0x8(%edx),%ecx
c000498e:	89 48 08             	mov    %ecx,0x8(%eax)
c0004991:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004994:	89 48 0c             	mov    %ecx,0xc(%eax)
c0004997:	8b 4a 10             	mov    0x10(%edx),%ecx
c000499a:	89 48 10             	mov    %ecx,0x10(%eax)
c000499d:	8b 4a 14             	mov    0x14(%edx),%ecx
c00049a0:	89 48 14             	mov    %ecx,0x14(%eax)
c00049a3:	8b 4a 18             	mov    0x18(%edx),%ecx
c00049a6:	89 48 18             	mov    %ecx,0x18(%eax)
c00049a9:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00049ac:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00049af:	8b 52 20             	mov    0x20(%edx),%edx
c00049b2:	89 50 20             	mov    %edx,0x20(%eax)
c00049b5:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00049ba:	c9                   	leave  
c00049bb:	c3                   	ret    

c00049bc <check>:
c00049bc:	55                   	push   %ebp
c00049bd:	89 e5                	mov    %esp,%ebp
c00049bf:	83 ec 10             	sub    $0x10,%esp
c00049c2:	c7 45 fc 00 32 08 c0 	movl   $0xc0083200,-0x4(%ebp)
c00049c9:	eb 2e                	jmp    c00049f9 <check+0x3d>
c00049cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049ce:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00049d4:	85 c0                	test   %eax,%eax
c00049d6:	74 1a                	je     c00049f2 <check+0x36>
c00049d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049db:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00049e1:	83 f8 01             	cmp    $0x1,%eax
c00049e4:	74 0c                	je     c00049f2 <check+0x36>
c00049e6:	c7 05 a0 07 01 c0 02 	movl   $0x2802,0xc00107a0
c00049ed:	28 00 00 
c00049f0:	eb fe                	jmp    c00049f0 <check+0x34>
c00049f2:	81 45 fc b4 02 00 00 	addl   $0x2b4,-0x4(%ebp)
c00049f9:	b8 d0 3c 08 c0       	mov    $0xc0083cd0,%eax
c00049fe:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c0004a01:	72 c8                	jb     c00049cb <check+0xf>
c0004a03:	90                   	nop
c0004a04:	c9                   	leave  
c0004a05:	c3                   	ret    

c0004a06 <schedule_process>:
c0004a06:	55                   	push   %ebp
c0004a07:	89 e5                	mov    %esp,%ebp
c0004a09:	83 ec 38             	sub    $0x38,%esp
c0004a0c:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0004a13:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0004a1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004a21:	e8 6a ce ff ff       	call   c0001890 <get_running_thread_pcb>
c0004a26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004a29:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004a2e:	85 c0                	test   %eax,%eax
c0004a30:	74 2a                	je     c0004a5c <schedule_process+0x56>
c0004a32:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004a37:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a3e:	84 c0                	test   %al,%al
c0004a40:	75 1a                	jne    c0004a5c <schedule_process+0x56>
c0004a42:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004a47:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004a4d:	85 c0                	test   %eax,%eax
c0004a4f:	74 0b                	je     c0004a5c <schedule_process+0x56>
c0004a51:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a54:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a57:	e9 3b 03 00 00       	jmp    c0004d97 <schedule_process+0x391>
c0004a5c:	83 ec 0c             	sub    $0xc,%esp
c0004a5f:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a64:	e8 0a 65 00 00       	call   c000af73 <isListEmpty>
c0004a69:	83 c4 10             	add    $0x10,%esp
c0004a6c:	3c 01                	cmp    $0x1,%al
c0004a6e:	0f 85 16 01 00 00    	jne    c0004b8a <schedule_process+0x184>
c0004a74:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a77:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004a7d:	85 c0                	test   %eax,%eax
c0004a7f:	75 24                	jne    c0004aa5 <schedule_process+0x9f>
c0004a81:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a84:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a87:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a8a:	05 00 01 00 00       	add    $0x100,%eax
c0004a8f:	83 ec 08             	sub    $0x8,%esp
c0004a92:	50                   	push   %eax
c0004a93:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a98:	e8 d3 65 00 00       	call   c000b070 <appendToDoubleLinkList>
c0004a9d:	83 c4 10             	add    $0x10,%esp
c0004aa0:	e9 82 02 00 00       	jmp    c0004d27 <schedule_process+0x321>
c0004aa5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004aa8:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004aaf:	84 c0                	test   %al,%al
c0004ab1:	0f 85 70 02 00 00    	jne    c0004d27 <schedule_process+0x321>
c0004ab7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004aba:	05 00 01 00 00       	add    $0x100,%eax
c0004abf:	83 ec 08             	sub    $0x8,%esp
c0004ac2:	50                   	push   %eax
c0004ac3:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004ac8:	e8 a3 65 00 00       	call   c000b070 <appendToDoubleLinkList>
c0004acd:	83 c4 10             	add    $0x10,%esp
c0004ad0:	83 ec 0c             	sub    $0xc,%esp
c0004ad3:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004ad8:	e8 fd 66 00 00       	call   c000b1da <popFromDoubleLinkList>
c0004add:	83 c4 10             	add    $0x10,%esp
c0004ae0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004ae3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004ae6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004aeb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004aee:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0004af2:	0f 84 2f 02 00 00    	je     c0004d27 <schedule_process+0x321>
c0004af8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004afb:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004b01:	85 c0                	test   %eax,%eax
c0004b03:	75 70                	jne    c0004b75 <schedule_process+0x16f>
c0004b05:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b08:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004b0f:	83 ec 0c             	sub    $0xc,%esp
c0004b12:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b17:	e8 57 64 00 00       	call   c000af73 <isListEmpty>
c0004b1c:	83 c4 10             	add    $0x10,%esp
c0004b1f:	84 c0                	test   %al,%al
c0004b21:	75 3d                	jne    c0004b60 <schedule_process+0x15a>
c0004b23:	83 ec 0c             	sub    $0xc,%esp
c0004b26:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b2b:	e8 aa 66 00 00       	call   c000b1da <popFromDoubleLinkList>
c0004b30:	83 c4 10             	add    $0x10,%esp
c0004b33:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004b36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004b39:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004b3e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004b41:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0004b45:	0f 84 dc 01 00 00    	je     c0004d27 <schedule_process+0x321>
c0004b4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b54:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b5b:	e9 c7 01 00 00       	jmp    c0004d27 <schedule_process+0x321>
c0004b60:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b63:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b69:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b70:	e9 b2 01 00 00       	jmp    c0004d27 <schedule_process+0x321>
c0004b75:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b78:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b7e:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b85:	e9 9d 01 00 00       	jmp    c0004d27 <schedule_process+0x321>
c0004b8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b8d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004b94:	84 c0                	test   %al,%al
c0004b96:	0f 85 e0 00 00 00    	jne    c0004c7c <schedule_process+0x276>
c0004b9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b9f:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c0004ba6:	00 00 00 
c0004ba9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004bac:	05 00 01 00 00       	add    $0x100,%eax
c0004bb1:	83 ec 08             	sub    $0x8,%esp
c0004bb4:	50                   	push   %eax
c0004bb5:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004bba:	e8 98 65 00 00       	call   c000b157 <insertToDoubleLinkList>
c0004bbf:	83 c4 10             	add    $0x10,%esp
c0004bc2:	83 ec 0c             	sub    $0xc,%esp
c0004bc5:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004bca:	e8 0b 66 00 00       	call   c000b1da <popFromDoubleLinkList>
c0004bcf:	83 c4 10             	add    $0x10,%esp
c0004bd2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004bd5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004bd8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004bdd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004be0:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0004be4:	0f 84 3d 01 00 00    	je     c0004d27 <schedule_process+0x321>
c0004bea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004bed:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004bf3:	85 c0                	test   %eax,%eax
c0004bf5:	75 70                	jne    c0004c67 <schedule_process+0x261>
c0004bf7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004bfa:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004c01:	83 ec 0c             	sub    $0xc,%esp
c0004c04:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c09:	e8 65 63 00 00       	call   c000af73 <isListEmpty>
c0004c0e:	83 c4 10             	add    $0x10,%esp
c0004c11:	84 c0                	test   %al,%al
c0004c13:	75 3d                	jne    c0004c52 <schedule_process+0x24c>
c0004c15:	83 ec 0c             	sub    $0xc,%esp
c0004c18:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c1d:	e8 b8 65 00 00       	call   c000b1da <popFromDoubleLinkList>
c0004c22:	83 c4 10             	add    $0x10,%esp
c0004c25:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004c28:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004c2b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004c30:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004c33:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0004c37:	0f 84 ea 00 00 00    	je     c0004d27 <schedule_process+0x321>
c0004c3d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c40:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c46:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c4d:	e9 d5 00 00 00       	jmp    c0004d27 <schedule_process+0x321>
c0004c52:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c55:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c5b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c62:	e9 c0 00 00 00       	jmp    c0004d27 <schedule_process+0x321>
c0004c67:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c70:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c77:	e9 ab 00 00 00       	jmp    c0004d27 <schedule_process+0x321>
c0004c7c:	83 ec 0c             	sub    $0xc,%esp
c0004c7f:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c84:	e8 51 65 00 00       	call   c000b1da <popFromDoubleLinkList>
c0004c89:	83 c4 10             	add    $0x10,%esp
c0004c8c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004c8f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004c92:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004c97:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004c9a:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004c9e:	0f 84 83 00 00 00    	je     c0004d27 <schedule_process+0x321>
c0004ca4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004ca7:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004cad:	85 c0                	test   %eax,%eax
c0004caf:	75 66                	jne    c0004d17 <schedule_process+0x311>
c0004cb1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cb4:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004cbb:	83 ec 0c             	sub    $0xc,%esp
c0004cbe:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004cc3:	e8 ab 62 00 00       	call   c000af73 <isListEmpty>
c0004cc8:	83 c4 10             	add    $0x10,%esp
c0004ccb:	84 c0                	test   %al,%al
c0004ccd:	75 36                	jne    c0004d05 <schedule_process+0x2ff>
c0004ccf:	83 ec 0c             	sub    $0xc,%esp
c0004cd2:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004cd7:	e8 fe 64 00 00       	call   c000b1da <popFromDoubleLinkList>
c0004cdc:	83 c4 10             	add    $0x10,%esp
c0004cdf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004ce2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004ce5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004cea:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004ced:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004cf1:	74 34                	je     c0004d27 <schedule_process+0x321>
c0004cf3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cf6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cfc:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004d03:	eb 22                	jmp    c0004d27 <schedule_process+0x321>
c0004d05:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004d08:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d0e:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004d15:	eb 10                	jmp    c0004d27 <schedule_process+0x321>
c0004d17:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004d1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d20:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004d27:	0f b6 05 f0 1e 01 c0 	movzbl 0xc0011ef0,%eax
c0004d2e:	84 c0                	test   %al,%al
c0004d30:	75 1b                	jne    c0004d4d <schedule_process+0x347>
c0004d32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d36:	74 15                	je     c0004d4d <schedule_process+0x347>
c0004d38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d3b:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d41:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0004d44:	77 07                	ja     c0004d4d <schedule_process+0x347>
c0004d46:	c6 05 f0 1e 01 c0 01 	movb   $0x1,0xc0011ef0
c0004d4d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d51:	75 43                	jne    c0004d96 <schedule_process+0x390>
c0004d53:	90                   	nop
c0004d54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d58:	74 28                	je     c0004d82 <schedule_process+0x37c>
c0004d5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d5d:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d63:	85 c0                	test   %eax,%eax
c0004d65:	74 1b                	je     c0004d82 <schedule_process+0x37c>
c0004d67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d6a:	05 00 01 00 00       	add    $0x100,%eax
c0004d6f:	83 ec 08             	sub    $0x8,%esp
c0004d72:	50                   	push   %eax
c0004d73:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004d78:	e8 f3 62 00 00       	call   c000b070 <appendToDoubleLinkList>
c0004d7d:	83 c4 10             	add    $0x10,%esp
c0004d80:	eb 15                	jmp    c0004d97 <schedule_process+0x391>
c0004d82:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c0004d87:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d8d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004d94:	eb 01                	jmp    c0004d97 <schedule_process+0x391>
c0004d96:	90                   	nop
c0004d97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d9a:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004da0:	83 f8 06             	cmp    $0x6,%eax
c0004da3:	75 0d                	jne    c0004db2 <schedule_process+0x3ac>
c0004da5:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%ebp)
c0004dac:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0004daf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004db5:	8b 40 08             	mov    0x8(%eax),%eax
c0004db8:	85 c0                	test   %eax,%eax
c0004dba:	74 28                	je     c0004de4 <schedule_process+0x3de>
c0004dbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004dbf:	05 00 10 00 00       	add    $0x1000,%eax
c0004dc4:	83 ec 0c             	sub    $0xc,%esp
c0004dc7:	50                   	push   %eax
c0004dc8:	e8 b4 ca ff ff       	call   c0001881 <update_tss>
c0004dcd:	83 c4 10             	add    $0x10,%esp
c0004dd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004dd3:	8b 40 08             	mov    0x8(%eax),%eax
c0004dd6:	83 ec 0c             	sub    $0xc,%esp
c0004dd9:	50                   	push   %eax
c0004dda:	e8 95 ca ff ff       	call   c0001874 <update_cr3>
c0004ddf:	83 c4 10             	add    $0x10,%esp
c0004de2:	eb 0f                	jmp    c0004df3 <schedule_process+0x3ed>
c0004de4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004de7:	83 ec 0c             	sub    $0xc,%esp
c0004dea:	50                   	push   %eax
c0004deb:	e8 84 ca ff ff       	call   c0001874 <update_cr3>
c0004df0:	83 c4 10             	add    $0x10,%esp
c0004df3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004df6:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004dfe:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004e04:	83 f8 06             	cmp    $0x6,%eax
c0004e07:	83 ec 08             	sub    $0x8,%esp
c0004e0a:	ff 75 f4             	pushl  -0xc(%ebp)
c0004e0d:	ff 75 e8             	pushl  -0x18(%ebp)
c0004e10:	e8 1b 61 00 00       	call   c000af30 <switch_to>
c0004e15:	83 c4 10             	add    $0x10,%esp
c0004e18:	90                   	nop
c0004e19:	c9                   	leave  
c0004e1a:	c3                   	ret    

c0004e1b <clock_handler>:
c0004e1b:	55                   	push   %ebp
c0004e1c:	89 e5                	mov    %esp,%ebp
c0004e1e:	83 ec 18             	sub    $0x18,%esp
c0004e21:	e8 6a ca ff ff       	call   c0001890 <get_running_thread_pcb>
c0004e26:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004e29:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c0004e2e:	85 c0                	test   %eax,%eax
c0004e30:	74 0d                	je     c0004e3f <clock_handler+0x24>
c0004e32:	83 ec 0c             	sub    $0xc,%esp
c0004e35:	6a 04                	push   $0x4
c0004e37:	e8 01 59 00 00       	call   c000a73d <inform_int>
c0004e3c:	83 c4 10             	add    $0x10,%esp
c0004e3f:	e8 c2 fb ff ff       	call   c0004a06 <schedule_process>
c0004e44:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e49:	85 c0                	test   %eax,%eax
c0004e4b:	74 23                	je     c0004e70 <clock_handler+0x55>
c0004e4d:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e52:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004e58:	85 c0                	test   %eax,%eax
c0004e5a:	74 14                	je     c0004e70 <clock_handler+0x55>
c0004e5c:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e61:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c0004e67:	83 ea 01             	sub    $0x1,%edx
c0004e6a:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c0004e70:	90                   	nop
c0004e71:	c9                   	leave  
c0004e72:	c3                   	ret    

c0004e73 <pid2proc>:
c0004e73:	55                   	push   %ebp
c0004e74:	89 e5                	mov    %esp,%ebp
c0004e76:	83 ec 20             	sub    $0x20,%esp
c0004e79:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004e80:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c0004e85:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c0004e8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004e8e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004e91:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c0004e96:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c0004e9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004e9f:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004ea2:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0004ea7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004eaa:	eb 29                	jmp    c0004ed5 <pid2proc+0x62>
c0004eac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004eaf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004eb4:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004eb7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004eba:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004ec0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec3:	39 c2                	cmp    %eax,%edx
c0004ec5:	75 05                	jne    c0004ecc <pid2proc+0x59>
c0004ec7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004eca:	eb 17                	jmp    c0004ee3 <pid2proc+0x70>
c0004ecc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ecf:	8b 40 04             	mov    0x4(%eax),%eax
c0004ed2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004ed5:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004edc:	75 ce                	jne    c0004eac <pid2proc+0x39>
c0004ede:	b8 00 00 00 00       	mov    $0x0,%eax
c0004ee3:	c9                   	leave  
c0004ee4:	c3                   	ret    

c0004ee5 <proc2pid>:
c0004ee5:	55                   	push   %ebp
c0004ee6:	89 e5                	mov    %esp,%ebp
c0004ee8:	83 ec 10             	sub    $0x10,%esp
c0004eeb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eee:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004ef4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004ef7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004efa:	c9                   	leave  
c0004efb:	c3                   	ret    

c0004efc <InitDescriptor>:
c0004efc:	55                   	push   %ebp
c0004efd:	89 e5                	mov    %esp,%ebp
c0004eff:	83 ec 04             	sub    $0x4,%esp
c0004f02:	8b 45 14             	mov    0x14(%ebp),%eax
c0004f05:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004f09:	8b 45 10             	mov    0x10(%ebp),%eax
c0004f0c:	89 c2                	mov    %eax,%edx
c0004f0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f11:	66 89 10             	mov    %dx,(%eax)
c0004f14:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f17:	89 c2                	mov    %eax,%edx
c0004f19:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f1c:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004f20:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f23:	c1 e8 10             	shr    $0x10,%eax
c0004f26:	89 c2                	mov    %eax,%edx
c0004f28:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f2b:	88 50 04             	mov    %dl,0x4(%eax)
c0004f2e:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004f32:	89 c2                	mov    %eax,%edx
c0004f34:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f37:	88 50 05             	mov    %dl,0x5(%eax)
c0004f3a:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004f3e:	66 c1 e8 08          	shr    $0x8,%ax
c0004f42:	c1 e0 04             	shl    $0x4,%eax
c0004f45:	89 c2                	mov    %eax,%edx
c0004f47:	8b 45 10             	mov    0x10(%ebp),%eax
c0004f4a:	c1 e8 10             	shr    $0x10,%eax
c0004f4d:	83 e0 0f             	and    $0xf,%eax
c0004f50:	09 c2                	or     %eax,%edx
c0004f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f55:	88 50 06             	mov    %dl,0x6(%eax)
c0004f58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f5b:	c1 e8 18             	shr    $0x18,%eax
c0004f5e:	89 c2                	mov    %eax,%edx
c0004f60:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f63:	88 50 07             	mov    %dl,0x7(%eax)
c0004f66:	90                   	nop
c0004f67:	c9                   	leave  
c0004f68:	c3                   	ret    

c0004f69 <Seg2PhyAddr>:
c0004f69:	55                   	push   %ebp
c0004f6a:	89 e5                	mov    %esp,%ebp
c0004f6c:	83 ec 10             	sub    $0x10,%esp
c0004f6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f72:	c1 e8 03             	shr    $0x3,%eax
c0004f75:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c0004f7c:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c0004f83:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f86:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004f89:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004f8d:	0f b7 c0             	movzwl %ax,%eax
c0004f90:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004f94:	0f b6 d2             	movzbl %dl,%edx
c0004f97:	c1 e2 10             	shl    $0x10,%edx
c0004f9a:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004fa0:	09 d0                	or     %edx,%eax
c0004fa2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004fa5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004fa8:	c9                   	leave  
c0004fa9:	c3                   	ret    

c0004faa <Seg2PhyAddrLDT>:
c0004faa:	55                   	push   %ebp
c0004fab:	89 e5                	mov    %esp,%ebp
c0004fad:	83 ec 10             	sub    $0x10,%esp
c0004fb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb3:	c1 e8 03             	shr    $0x3,%eax
c0004fb6:	89 c2                	mov    %eax,%edx
c0004fb8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004fbb:	83 c2 22             	add    $0x22,%edx
c0004fbe:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004fc2:	8b 02                	mov    (%edx),%eax
c0004fc4:	8b 52 04             	mov    0x4(%edx),%edx
c0004fc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004fca:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004fcd:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004fd1:	0f b7 c0             	movzwl %ax,%eax
c0004fd4:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004fd8:	0f b6 d2             	movzbl %dl,%edx
c0004fdb:	c1 e2 10             	shl    $0x10,%edx
c0004fde:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004fe4:	09 d0                	or     %edx,%eax
c0004fe6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004fe9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004fec:	c9                   	leave  
c0004fed:	c3                   	ret    

c0004fee <VirAddr2PhyAddr>:
c0004fee:	55                   	push   %ebp
c0004fef:	89 e5                	mov    %esp,%ebp
c0004ff1:	83 ec 10             	sub    $0x10,%esp
c0004ff4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004ff7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ffa:	01 d0                	add    %edx,%eax
c0004ffc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004fff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005002:	c9                   	leave  
c0005003:	c3                   	ret    

c0005004 <v2l>:
c0005004:	55                   	push   %ebp
c0005005:	89 e5                	mov    %esp,%ebp
c0005007:	83 ec 18             	sub    $0x18,%esp
c000500a:	83 ec 0c             	sub    $0xc,%esp
c000500d:	ff 75 08             	pushl  0x8(%ebp)
c0005010:	e8 5e fe ff ff       	call   c0004e73 <pid2proc>
c0005015:	83 c4 10             	add    $0x10,%esp
c0005018:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000501b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0005022:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005025:	83 ec 08             	sub    $0x8,%esp
c0005028:	ff 75 f4             	pushl  -0xc(%ebp)
c000502b:	50                   	push   %eax
c000502c:	e8 79 ff ff ff       	call   c0004faa <Seg2PhyAddrLDT>
c0005031:	83 c4 10             	add    $0x10,%esp
c0005034:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005037:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000503a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000503d:	01 d0                	add    %edx,%eax
c000503f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005042:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005045:	c9                   	leave  
c0005046:	c3                   	ret    

c0005047 <init_propt>:
c0005047:	55                   	push   %ebp
c0005048:	89 e5                	mov    %esp,%ebp
c000504a:	83 ec 38             	sub    $0x38,%esp
c000504d:	6a 0e                	push   $0xe
c000504f:	6a 08                	push   $0x8
c0005051:	68 6a 16 00 c0       	push   $0xc000166a
c0005056:	6a 20                	push   $0x20
c0005058:	e8 58 01 00 00       	call   c00051b5 <InitInterruptDesc>
c000505d:	83 c4 10             	add    $0x10,%esp
c0005060:	6a 0e                	push   $0xe
c0005062:	6a 08                	push   $0x8
c0005064:	68 97 16 00 c0       	push   $0xc0001697
c0005069:	6a 21                	push   $0x21
c000506b:	e8 45 01 00 00       	call   c00051b5 <InitInterruptDesc>
c0005070:	83 c4 10             	add    $0x10,%esp
c0005073:	6a 0e                	push   $0xe
c0005075:	6a 08                	push   $0x8
c0005077:	68 d9 16 00 c0       	push   $0xc00016d9
c000507c:	6a 2e                	push   $0x2e
c000507e:	e8 32 01 00 00       	call   c00051b5 <InitInterruptDesc>
c0005083:	83 c4 10             	add    $0x10,%esp
c0005086:	83 ec 04             	sub    $0x4,%esp
c0005089:	68 a0 15 00 00       	push   $0x15a0
c000508e:	6a 00                	push   $0x0
c0005090:	68 00 32 08 c0       	push   $0xc0083200
c0005095:	e8 9d 70 00 00       	call   c000c137 <Memset>
c000509a:	83 c4 10             	add    $0x10,%esp
c000509d:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00050a4:	83 ec 04             	sub    $0x4,%esp
c00050a7:	ff 75 f4             	pushl  -0xc(%ebp)
c00050aa:	6a 00                	push   $0x0
c00050ac:	68 40 16 01 c0       	push   $0xc0011640
c00050b1:	e8 81 70 00 00       	call   c000c137 <Memset>
c00050b6:	83 c4 10             	add    $0x10,%esp
c00050b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050bc:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c00050c1:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c00050c8:	00 00 00 
c00050cb:	83 ec 0c             	sub    $0xc,%esp
c00050ce:	6a 30                	push   $0x30
c00050d0:	e8 94 fe ff ff       	call   c0004f69 <Seg2PhyAddr>
c00050d5:	83 c4 10             	add    $0x10,%esp
c00050d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00050db:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c00050e2:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c00050e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00050ec:	0f b7 d0             	movzwl %ax,%edx
c00050ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050f2:	83 e8 01             	sub    $0x1,%eax
c00050f5:	89 c1                	mov    %eax,%ecx
c00050f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00050fa:	52                   	push   %edx
c00050fb:	51                   	push   %ecx
c00050fc:	50                   	push   %eax
c00050fd:	68 00 08 01 c0       	push   $0xc0010800
c0005102:	e8 f5 fd ff ff       	call   c0004efc <InitDescriptor>
c0005107:	83 c4 10             	add    $0x10,%esp
c000510a:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0005111:	68 f2 00 00 00       	push   $0xf2
c0005116:	68 ff ff 00 00       	push   $0xffff
c000511b:	ff 75 e4             	pushl  -0x1c(%ebp)
c000511e:	68 f8 07 01 c0       	push   $0xc00107f8
c0005123:	e8 d4 fd ff ff       	call   c0004efc <InitDescriptor>
c0005128:	83 c4 10             	add    $0x10,%esp
c000512b:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0005132:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0005139:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0005140:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005143:	0f b7 c0             	movzwl %ax,%eax
c0005146:	50                   	push   %eax
c0005147:	ff 75 d8             	pushl  -0x28(%ebp)
c000514a:	6a 00                	push   $0x0
c000514c:	68 08 08 01 c0       	push   $0xc0010808
c0005151:	e8 a6 fd ff ff       	call   c0004efc <InitDescriptor>
c0005156:	83 c4 10             	add    $0x10,%esp
c0005159:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000515c:	0f b7 c0             	movzwl %ax,%eax
c000515f:	50                   	push   %eax
c0005160:	ff 75 d8             	pushl  -0x28(%ebp)
c0005163:	6a 00                	push   $0x0
c0005165:	68 10 08 01 c0       	push   $0xc0010810
c000516a:	e8 8d fd ff ff       	call   c0004efc <InitDescriptor>
c000516f:	83 c4 10             	add    $0x10,%esp
c0005172:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0005179:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0005180:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005183:	0f b7 c0             	movzwl %ax,%eax
c0005186:	50                   	push   %eax
c0005187:	ff 75 d8             	pushl  -0x28(%ebp)
c000518a:	6a 00                	push   $0x0
c000518c:	68 18 08 01 c0       	push   $0xc0010818
c0005191:	e8 66 fd ff ff       	call   c0004efc <InitDescriptor>
c0005196:	83 c4 10             	add    $0x10,%esp
c0005199:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000519c:	0f b7 c0             	movzwl %ax,%eax
c000519f:	50                   	push   %eax
c00051a0:	ff 75 d8             	pushl  -0x28(%ebp)
c00051a3:	6a 00                	push   $0x0
c00051a5:	68 20 08 01 c0       	push   $0xc0010820
c00051aa:	e8 4d fd ff ff       	call   c0004efc <InitDescriptor>
c00051af:	83 c4 10             	add    $0x10,%esp
c00051b2:	90                   	nop
c00051b3:	c9                   	leave  
c00051b4:	c3                   	ret    

c00051b5 <InitInterruptDesc>:
c00051b5:	55                   	push   %ebp
c00051b6:	89 e5                	mov    %esp,%ebp
c00051b8:	83 ec 10             	sub    $0x10,%esp
c00051bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051be:	c1 e0 03             	shl    $0x3,%eax
c00051c1:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c00051c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00051c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00051cc:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c00051d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00051d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00051d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00051d9:	89 c2                	mov    %eax,%edx
c00051db:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00051de:	66 89 10             	mov    %dx,(%eax)
c00051e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00051e4:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c00051ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00051ed:	c1 f8 10             	sar    $0x10,%eax
c00051f0:	89 c2                	mov    %eax,%edx
c00051f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00051f5:	66 89 50 06          	mov    %dx,0x6(%eax)
c00051f9:	8b 45 10             	mov    0x10(%ebp),%eax
c00051fc:	c1 e0 04             	shl    $0x4,%eax
c00051ff:	89 c2                	mov    %eax,%edx
c0005201:	8b 45 14             	mov    0x14(%ebp),%eax
c0005204:	09 d0                	or     %edx,%eax
c0005206:	89 c2                	mov    %eax,%edx
c0005208:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000520b:	88 50 05             	mov    %dl,0x5(%eax)
c000520e:	90                   	nop
c000520f:	c9                   	leave  
c0005210:	c3                   	ret    

c0005211 <ReloadGDT>:
c0005211:	55                   	push   %ebp
c0005212:	89 e5                	mov    %esp,%ebp
c0005214:	83 ec 28             	sub    $0x28,%esp
c0005217:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c000521c:	0f b7 00             	movzwl (%eax),%eax
c000521f:	98                   	cwtl   
c0005220:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0005225:	8b 12                	mov    (%edx),%edx
c0005227:	83 ec 04             	sub    $0x4,%esp
c000522a:	50                   	push   %eax
c000522b:	52                   	push   %edx
c000522c:	68 c0 07 01 c0       	push   $0xc00107c0
c0005231:	e8 d3 6e 00 00       	call   c000c109 <Memcpy2>
c0005236:	83 c4 10             	add    $0x10,%esp
c0005239:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c0005240:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0005247:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000524a:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c000524f:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c0005254:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005257:	89 10                	mov    %edx,(%eax)
c0005259:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c0005260:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c0005267:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000526a:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c000526f:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c0005274:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005277:	89 10                	mov    %edx,(%eax)
c0005279:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005280:	eb 04                	jmp    c0005286 <ReloadGDT+0x75>
c0005282:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005286:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000528d:	7e f3                	jle    c0005282 <ReloadGDT+0x71>
c000528f:	e8 bf 31 00 00       	call   c0008453 <init_internal_interrupt>
c0005294:	e8 ae fd ff ff       	call   c0005047 <init_propt>
c0005299:	90                   	nop
c000529a:	c9                   	leave  
c000529b:	c3                   	ret    

c000529c <select_console>:
c000529c:	55                   	push   %ebp
c000529d:	89 e5                	mov    %esp,%ebp
c000529f:	83 ec 18             	sub    $0x18,%esp
c00052a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a5:	88 45 f4             	mov    %al,-0xc(%ebp)
c00052a8:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c00052ac:	75 27                	jne    c00052d5 <select_console+0x39>
c00052ae:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c00052b2:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00052b8:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00052bd:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c00052c2:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00052c7:	83 ec 0c             	sub    $0xc,%esp
c00052ca:	50                   	push   %eax
c00052cb:	e8 08 00 00 00       	call   c00052d8 <flush>
c00052d0:	83 c4 10             	add    $0x10,%esp
c00052d3:	eb 01                	jmp    c00052d6 <select_console+0x3a>
c00052d5:	90                   	nop
c00052d6:	c9                   	leave  
c00052d7:	c3                   	ret    

c00052d8 <flush>:
c00052d8:	55                   	push   %ebp
c00052d9:	89 e5                	mov    %esp,%ebp
c00052db:	83 ec 08             	sub    $0x8,%esp
c00052de:	8b 45 08             	mov    0x8(%ebp),%eax
c00052e1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052e7:	8b 40 0c             	mov    0xc(%eax),%eax
c00052ea:	83 ec 0c             	sub    $0xc,%esp
c00052ed:	50                   	push   %eax
c00052ee:	e8 1e 00 00 00       	call   c0005311 <set_cursor>
c00052f3:	83 c4 10             	add    $0x10,%esp
c00052f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00052f9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052ff:	8b 40 08             	mov    0x8(%eax),%eax
c0005302:	83 ec 0c             	sub    $0xc,%esp
c0005305:	50                   	push   %eax
c0005306:	e8 64 00 00 00       	call   c000536f <set_console_start_video_addr>
c000530b:	83 c4 10             	add    $0x10,%esp
c000530e:	90                   	nop
c000530f:	c9                   	leave  
c0005310:	c3                   	ret    

c0005311 <set_cursor>:
c0005311:	55                   	push   %ebp
c0005312:	89 e5                	mov    %esp,%ebp
c0005314:	83 ec 08             	sub    $0x8,%esp
c0005317:	83 ec 08             	sub    $0x8,%esp
c000531a:	6a 0e                	push   $0xe
c000531c:	68 d4 03 00 00       	push   $0x3d4
c0005321:	e8 6c c4 ff ff       	call   c0001792 <out_byte>
c0005326:	83 c4 10             	add    $0x10,%esp
c0005329:	8b 45 08             	mov    0x8(%ebp),%eax
c000532c:	c1 e8 08             	shr    $0x8,%eax
c000532f:	0f b7 c0             	movzwl %ax,%eax
c0005332:	83 ec 08             	sub    $0x8,%esp
c0005335:	50                   	push   %eax
c0005336:	68 d5 03 00 00       	push   $0x3d5
c000533b:	e8 52 c4 ff ff       	call   c0001792 <out_byte>
c0005340:	83 c4 10             	add    $0x10,%esp
c0005343:	83 ec 08             	sub    $0x8,%esp
c0005346:	6a 0f                	push   $0xf
c0005348:	68 d4 03 00 00       	push   $0x3d4
c000534d:	e8 40 c4 ff ff       	call   c0001792 <out_byte>
c0005352:	83 c4 10             	add    $0x10,%esp
c0005355:	8b 45 08             	mov    0x8(%ebp),%eax
c0005358:	0f b7 c0             	movzwl %ax,%eax
c000535b:	83 ec 08             	sub    $0x8,%esp
c000535e:	50                   	push   %eax
c000535f:	68 d5 03 00 00       	push   $0x3d5
c0005364:	e8 29 c4 ff ff       	call   c0001792 <out_byte>
c0005369:	83 c4 10             	add    $0x10,%esp
c000536c:	90                   	nop
c000536d:	c9                   	leave  
c000536e:	c3                   	ret    

c000536f <set_console_start_video_addr>:
c000536f:	55                   	push   %ebp
c0005370:	89 e5                	mov    %esp,%ebp
c0005372:	83 ec 08             	sub    $0x8,%esp
c0005375:	83 ec 08             	sub    $0x8,%esp
c0005378:	6a 0c                	push   $0xc
c000537a:	68 d4 03 00 00       	push   $0x3d4
c000537f:	e8 0e c4 ff ff       	call   c0001792 <out_byte>
c0005384:	83 c4 10             	add    $0x10,%esp
c0005387:	8b 45 08             	mov    0x8(%ebp),%eax
c000538a:	c1 e8 08             	shr    $0x8,%eax
c000538d:	0f b7 c0             	movzwl %ax,%eax
c0005390:	83 ec 08             	sub    $0x8,%esp
c0005393:	50                   	push   %eax
c0005394:	68 d5 03 00 00       	push   $0x3d5
c0005399:	e8 f4 c3 ff ff       	call   c0001792 <out_byte>
c000539e:	83 c4 10             	add    $0x10,%esp
c00053a1:	83 ec 08             	sub    $0x8,%esp
c00053a4:	6a 0d                	push   $0xd
c00053a6:	68 d4 03 00 00       	push   $0x3d4
c00053ab:	e8 e2 c3 ff ff       	call   c0001792 <out_byte>
c00053b0:	83 c4 10             	add    $0x10,%esp
c00053b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b6:	0f b7 c0             	movzwl %ax,%eax
c00053b9:	83 ec 08             	sub    $0x8,%esp
c00053bc:	50                   	push   %eax
c00053bd:	68 d5 03 00 00       	push   $0x3d5
c00053c2:	e8 cb c3 ff ff       	call   c0001792 <out_byte>
c00053c7:	83 c4 10             	add    $0x10,%esp
c00053ca:	90                   	nop
c00053cb:	c9                   	leave  
c00053cc:	c3                   	ret    

c00053cd <put_key>:
c00053cd:	55                   	push   %ebp
c00053ce:	89 e5                	mov    %esp,%ebp
c00053d0:	83 ec 04             	sub    $0x4,%esp
c00053d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053d6:	88 45 fc             	mov    %al,-0x4(%ebp)
c00053d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00053dc:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00053e2:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00053e7:	77 4d                	ja     c0005436 <put_key+0x69>
c00053e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ec:	8b 00                	mov    (%eax),%eax
c00053ee:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c00053f2:	89 10                	mov    %edx,(%eax)
c00053f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00053f7:	8b 00                	mov    (%eax),%eax
c00053f9:	8d 50 04             	lea    0x4(%eax),%edx
c00053fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ff:	89 10                	mov    %edx,(%eax)
c0005401:	8b 45 08             	mov    0x8(%ebp),%eax
c0005404:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000540a:	8d 50 01             	lea    0x1(%eax),%edx
c000540d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005410:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005416:	8b 45 08             	mov    0x8(%ebp),%eax
c0005419:	8b 00                	mov    (%eax),%eax
c000541b:	8b 55 08             	mov    0x8(%ebp),%edx
c000541e:	83 c2 08             	add    $0x8,%edx
c0005421:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005427:	39 d0                	cmp    %edx,%eax
c0005429:	75 0b                	jne    c0005436 <put_key+0x69>
c000542b:	8b 45 08             	mov    0x8(%ebp),%eax
c000542e:	8d 50 08             	lea    0x8(%eax),%edx
c0005431:	8b 45 08             	mov    0x8(%ebp),%eax
c0005434:	89 10                	mov    %edx,(%eax)
c0005436:	90                   	nop
c0005437:	c9                   	leave  
c0005438:	c3                   	ret    

c0005439 <scroll_up>:
c0005439:	55                   	push   %ebp
c000543a:	89 e5                	mov    %esp,%ebp
c000543c:	83 ec 08             	sub    $0x8,%esp
c000543f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005442:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005448:	8b 40 08             	mov    0x8(%eax),%eax
c000544b:	8d 50 b0             	lea    -0x50(%eax),%edx
c000544e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005451:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005457:	8b 00                	mov    (%eax),%eax
c0005459:	39 c2                	cmp    %eax,%edx
c000545b:	76 1b                	jbe    c0005478 <scroll_up+0x3f>
c000545d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005460:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005466:	8b 40 08             	mov    0x8(%eax),%eax
c0005469:	83 e8 50             	sub    $0x50,%eax
c000546c:	83 ec 0c             	sub    $0xc,%esp
c000546f:	50                   	push   %eax
c0005470:	e8 fa fe ff ff       	call   c000536f <set_console_start_video_addr>
c0005475:	83 c4 10             	add    $0x10,%esp
c0005478:	90                   	nop
c0005479:	c9                   	leave  
c000547a:	c3                   	ret    

c000547b <scroll_down>:
c000547b:	55                   	push   %ebp
c000547c:	89 e5                	mov    %esp,%ebp
c000547e:	83 ec 08             	sub    $0x8,%esp
c0005481:	8b 45 08             	mov    0x8(%ebp),%eax
c0005484:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000548a:	8b 40 08             	mov    0x8(%eax),%eax
c000548d:	8d 48 50             	lea    0x50(%eax),%ecx
c0005490:	8b 45 08             	mov    0x8(%ebp),%eax
c0005493:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005499:	8b 10                	mov    (%eax),%edx
c000549b:	8b 45 08             	mov    0x8(%ebp),%eax
c000549e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054a4:	8b 40 04             	mov    0x4(%eax),%eax
c00054a7:	01 d0                	add    %edx,%eax
c00054a9:	39 c1                	cmp    %eax,%ecx
c00054ab:	73 36                	jae    c00054e3 <scroll_down+0x68>
c00054ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054b6:	8b 40 08             	mov    0x8(%eax),%eax
c00054b9:	83 c0 50             	add    $0x50,%eax
c00054bc:	83 ec 0c             	sub    $0xc,%esp
c00054bf:	50                   	push   %eax
c00054c0:	e8 aa fe ff ff       	call   c000536f <set_console_start_video_addr>
c00054c5:	83 c4 10             	add    $0x10,%esp
c00054c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00054cb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054d1:	8b 50 08             	mov    0x8(%eax),%edx
c00054d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00054d7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054dd:	83 c2 50             	add    $0x50,%edx
c00054e0:	89 50 08             	mov    %edx,0x8(%eax)
c00054e3:	90                   	nop
c00054e4:	c9                   	leave  
c00054e5:	c3                   	ret    

c00054e6 <out_char>:
c00054e6:	55                   	push   %ebp
c00054e7:	89 e5                	mov    %esp,%ebp
c00054e9:	83 ec 28             	sub    $0x28,%esp
c00054ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054ef:	88 45 e4             	mov    %al,-0x1c(%ebp)
c00054f2:	e8 06 27 00 00       	call   c0007bfd <intr_disable>
c00054f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00054fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00054fd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005503:	8b 40 0c             	mov    0xc(%eax),%eax
c0005506:	05 00 c0 05 60       	add    $0x6005c000,%eax
c000550b:	01 c0                	add    %eax,%eax
c000550d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005510:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0005514:	83 f8 08             	cmp    $0x8,%eax
c0005517:	0f 84 8d 00 00 00    	je     c00055aa <out_char+0xc4>
c000551d:	83 f8 0a             	cmp    $0xa,%eax
c0005520:	0f 85 c9 00 00 00    	jne    c00055ef <out_char+0x109>
c0005526:	8b 45 08             	mov    0x8(%ebp),%eax
c0005529:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000552f:	8b 50 0c             	mov    0xc(%eax),%edx
c0005532:	8b 45 08             	mov    0x8(%ebp),%eax
c0005535:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000553b:	8b 08                	mov    (%eax),%ecx
c000553d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005540:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005546:	8b 40 04             	mov    0x4(%eax),%eax
c0005549:	01 c8                	add    %ecx,%eax
c000554b:	83 e8 50             	sub    $0x50,%eax
c000554e:	39 c2                	cmp    %eax,%edx
c0005550:	0f 83 f4 00 00 00    	jae    c000564a <out_char+0x164>
c0005556:	8b 45 08             	mov    0x8(%ebp),%eax
c0005559:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000555f:	8b 08                	mov    (%eax),%ecx
c0005561:	8b 45 08             	mov    0x8(%ebp),%eax
c0005564:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000556a:	8b 50 0c             	mov    0xc(%eax),%edx
c000556d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005570:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005576:	8b 00                	mov    (%eax),%eax
c0005578:	29 c2                	sub    %eax,%edx
c000557a:	89 d0                	mov    %edx,%eax
c000557c:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0005581:	f7 e2                	mul    %edx
c0005583:	89 d0                	mov    %edx,%eax
c0005585:	c1 e8 06             	shr    $0x6,%eax
c0005588:	8d 50 01             	lea    0x1(%eax),%edx
c000558b:	89 d0                	mov    %edx,%eax
c000558d:	c1 e0 02             	shl    $0x2,%eax
c0005590:	01 d0                	add    %edx,%eax
c0005592:	c1 e0 04             	shl    $0x4,%eax
c0005595:	89 c2                	mov    %eax,%edx
c0005597:	8b 45 08             	mov    0x8(%ebp),%eax
c000559a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055a0:	01 ca                	add    %ecx,%edx
c00055a2:	89 50 0c             	mov    %edx,0xc(%eax)
c00055a5:	e9 a0 00 00 00       	jmp    c000564a <out_char+0x164>
c00055aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00055ad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055b3:	8b 50 0c             	mov    0xc(%eax),%edx
c00055b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00055b9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055bf:	8b 00                	mov    (%eax),%eax
c00055c1:	39 c2                	cmp    %eax,%edx
c00055c3:	0f 86 84 00 00 00    	jbe    c000564d <out_char+0x167>
c00055c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00055cc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055d2:	8b 50 0c             	mov    0xc(%eax),%edx
c00055d5:	83 ea 01             	sub    $0x1,%edx
c00055d8:	89 50 0c             	mov    %edx,0xc(%eax)
c00055db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055de:	83 e8 02             	sub    $0x2,%eax
c00055e1:	c6 00 20             	movb   $0x20,(%eax)
c00055e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055e7:	83 e8 01             	sub    $0x1,%eax
c00055ea:	c6 00 00             	movb   $0x0,(%eax)
c00055ed:	eb 5e                	jmp    c000564d <out_char+0x167>
c00055ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00055f2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055f8:	8b 40 0c             	mov    0xc(%eax),%eax
c00055fb:	8d 48 01             	lea    0x1(%eax),%ecx
c00055fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0005601:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005607:	8b 10                	mov    (%eax),%edx
c0005609:	8b 45 08             	mov    0x8(%ebp),%eax
c000560c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005612:	8b 40 04             	mov    0x4(%eax),%eax
c0005615:	01 d0                	add    %edx,%eax
c0005617:	39 c1                	cmp    %eax,%ecx
c0005619:	73 35                	jae    c0005650 <out_char+0x16a>
c000561b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000561e:	8d 50 01             	lea    0x1(%eax),%edx
c0005621:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005624:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0005628:	88 10                	mov    %dl,(%eax)
c000562a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000562d:	8d 50 01             	lea    0x1(%eax),%edx
c0005630:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005633:	c6 00 0a             	movb   $0xa,(%eax)
c0005636:	8b 45 08             	mov    0x8(%ebp),%eax
c0005639:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000563f:	8b 50 0c             	mov    0xc(%eax),%edx
c0005642:	83 c2 01             	add    $0x1,%edx
c0005645:	89 50 0c             	mov    %edx,0xc(%eax)
c0005648:	eb 06                	jmp    c0005650 <out_char+0x16a>
c000564a:	90                   	nop
c000564b:	eb 14                	jmp    c0005661 <out_char+0x17b>
c000564d:	90                   	nop
c000564e:	eb 11                	jmp    c0005661 <out_char+0x17b>
c0005650:	90                   	nop
c0005651:	eb 0e                	jmp    c0005661 <out_char+0x17b>
c0005653:	83 ec 0c             	sub    $0xc,%esp
c0005656:	ff 75 08             	pushl  0x8(%ebp)
c0005659:	e8 1d fe ff ff       	call   c000547b <scroll_down>
c000565e:	83 c4 10             	add    $0x10,%esp
c0005661:	8b 45 08             	mov    0x8(%ebp),%eax
c0005664:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000566a:	8b 50 0c             	mov    0xc(%eax),%edx
c000566d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005670:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005676:	8b 40 08             	mov    0x8(%eax),%eax
c0005679:	29 c2                	sub    %eax,%edx
c000567b:	89 d0                	mov    %edx,%eax
c000567d:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0005682:	77 cf                	ja     c0005653 <out_char+0x16d>
c0005684:	83 ec 0c             	sub    $0xc,%esp
c0005687:	ff 75 08             	pushl  0x8(%ebp)
c000568a:	e8 49 fc ff ff       	call   c00052d8 <flush>
c000568f:	83 c4 10             	add    $0x10,%esp
c0005692:	83 ec 0c             	sub    $0xc,%esp
c0005695:	ff 75 f4             	pushl  -0xc(%ebp)
c0005698:	e8 89 25 00 00       	call   c0007c26 <intr_set_status>
c000569d:	83 c4 10             	add    $0x10,%esp
c00056a0:	90                   	nop
c00056a1:	c9                   	leave  
c00056a2:	c3                   	ret    

c00056a3 <tty_dev_read>:
c00056a3:	55                   	push   %ebp
c00056a4:	89 e5                	mov    %esp,%ebp
c00056a6:	83 ec 08             	sub    $0x8,%esp
c00056a9:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00056ae:	39 45 08             	cmp    %eax,0x8(%ebp)
c00056b1:	75 17                	jne    c00056ca <tty_dev_read+0x27>
c00056b3:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00056b8:	85 c0                	test   %eax,%eax
c00056ba:	7e 0e                	jle    c00056ca <tty_dev_read+0x27>
c00056bc:	83 ec 0c             	sub    $0xc,%esp
c00056bf:	ff 75 08             	pushl  0x8(%ebp)
c00056c2:	e8 79 07 00 00       	call   c0005e40 <keyboard_read>
c00056c7:	83 c4 10             	add    $0x10,%esp
c00056ca:	90                   	nop
c00056cb:	c9                   	leave  
c00056cc:	c3                   	ret    

c00056cd <tty_dev_write>:
c00056cd:	55                   	push   %ebp
c00056ce:	89 e5                	mov    %esp,%ebp
c00056d0:	83 ec 28             	sub    $0x28,%esp
c00056d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00056d6:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00056dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00056df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00056e6:	e9 88 01 00 00       	jmp    c0005873 <tty_dev_write+0x1a6>
c00056eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00056ee:	8b 40 04             	mov    0x4(%eax),%eax
c00056f1:	8b 00                	mov    (%eax),%eax
c00056f3:	88 45 e7             	mov    %al,-0x19(%ebp)
c00056f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00056f9:	8b 40 04             	mov    0x4(%eax),%eax
c00056fc:	8d 50 04             	lea    0x4(%eax),%edx
c00056ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005702:	89 50 04             	mov    %edx,0x4(%eax)
c0005705:	8b 45 08             	mov    0x8(%ebp),%eax
c0005708:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000570e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005711:	8b 45 08             	mov    0x8(%ebp),%eax
c0005714:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000571a:	8b 45 08             	mov    0x8(%ebp),%eax
c000571d:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005723:	8d 50 01             	lea    0x1(%eax),%edx
c0005726:	8b 45 08             	mov    0x8(%ebp),%eax
c0005729:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000572f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005732:	8b 40 04             	mov    0x4(%eax),%eax
c0005735:	8b 55 08             	mov    0x8(%ebp),%edx
c0005738:	83 c2 08             	add    $0x8,%edx
c000573b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005741:	39 d0                	cmp    %edx,%eax
c0005743:	75 0c                	jne    c0005751 <tty_dev_write+0x84>
c0005745:	8b 45 08             	mov    0x8(%ebp),%eax
c0005748:	8d 50 08             	lea    0x8(%eax),%edx
c000574b:	8b 45 08             	mov    0x8(%ebp),%eax
c000574e:	89 50 04             	mov    %edx,0x4(%eax)
c0005751:	8b 45 08             	mov    0x8(%ebp),%eax
c0005754:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000575a:	85 c0                	test   %eax,%eax
c000575c:	0f 84 11 01 00 00    	je     c0005873 <tty_dev_write+0x1a6>
c0005762:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005766:	3c 20                	cmp    $0x20,%al
c0005768:	76 08                	jbe    c0005772 <tty_dev_write+0xa5>
c000576a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000576e:	3c 7e                	cmp    $0x7e,%al
c0005770:	76 10                	jbe    c0005782 <tty_dev_write+0xb5>
c0005772:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005776:	3c 20                	cmp    $0x20,%al
c0005778:	74 08                	je     c0005782 <tty_dev_write+0xb5>
c000577a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000577e:	84 c0                	test   %al,%al
c0005780:	75 58                	jne    c00057da <tty_dev_write+0x10d>
c0005782:	8b 45 08             	mov    0x8(%ebp),%eax
c0005785:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c000578b:	8b 45 08             	mov    0x8(%ebp),%eax
c000578e:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005794:	01 d0                	add    %edx,%eax
c0005796:	83 e8 01             	sub    $0x1,%eax
c0005799:	89 c2                	mov    %eax,%edx
c000579b:	83 ec 04             	sub    $0x4,%esp
c000579e:	6a 01                	push   $0x1
c00057a0:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00057a3:	50                   	push   %eax
c00057a4:	52                   	push   %edx
c00057a5:	e8 b7 24 00 00       	call   c0007c61 <Memcpy>
c00057aa:	83 c4 10             	add    $0x10,%esp
c00057ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00057b0:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00057b6:	8d 50 ff             	lea    -0x1(%eax),%edx
c00057b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00057bc:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00057c2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00057c6:	0f b6 c0             	movzbl %al,%eax
c00057c9:	83 ec 08             	sub    $0x8,%esp
c00057cc:	50                   	push   %eax
c00057cd:	ff 75 08             	pushl  0x8(%ebp)
c00057d0:	e8 11 fd ff ff       	call   c00054e6 <out_char>
c00057d5:	83 c4 10             	add    $0x10,%esp
c00057d8:	eb 7c                	jmp    c0005856 <tty_dev_write+0x189>
c00057da:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00057de:	3c 08                	cmp    $0x8,%al
c00057e0:	75 42                	jne    c0005824 <tty_dev_write+0x157>
c00057e2:	8b 45 08             	mov    0x8(%ebp),%eax
c00057e5:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00057eb:	8d 50 01             	lea    0x1(%eax),%edx
c00057ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00057f1:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00057f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00057fa:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005800:	8d 50 fe             	lea    -0x2(%eax),%edx
c0005803:	8b 45 08             	mov    0x8(%ebp),%eax
c0005806:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000580c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005810:	0f b6 c0             	movzbl %al,%eax
c0005813:	83 ec 08             	sub    $0x8,%esp
c0005816:	50                   	push   %eax
c0005817:	ff 75 08             	pushl  0x8(%ebp)
c000581a:	e8 c7 fc ff ff       	call   c00054e6 <out_char>
c000581f:	83 c4 10             	add    $0x10,%esp
c0005822:	eb 32                	jmp    c0005856 <tty_dev_write+0x189>
c0005824:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005828:	3c 0a                	cmp    $0xa,%al
c000582a:	75 2a                	jne    c0005856 <tty_dev_write+0x189>
c000582c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005830:	0f b6 c0             	movzbl %al,%eax
c0005833:	83 ec 08             	sub    $0x8,%esp
c0005836:	50                   	push   %eax
c0005837:	ff 75 08             	pushl  0x8(%ebp)
c000583a:	e8 a7 fc ff ff       	call   c00054e6 <out_char>
c000583f:	83 c4 10             	add    $0x10,%esp
c0005842:	8b 45 08             	mov    0x8(%ebp),%eax
c0005845:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c000584c:	00 00 00 
c000584f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005856:	8b 45 08             	mov    0x8(%ebp),%eax
c0005859:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000585f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005862:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0005868:	39 c2                	cmp    %eax,%edx
c000586a:	75 07                	jne    c0005873 <tty_dev_write+0x1a6>
c000586c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005873:	8b 45 08             	mov    0x8(%ebp),%eax
c0005876:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000587c:	85 c0                	test   %eax,%eax
c000587e:	0f 85 67 fe ff ff    	jne    c00056eb <tty_dev_write+0x1e>
c0005884:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005888:	74 5c                	je     c00058e6 <tty_dev_write+0x219>
c000588a:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c0005891:	83 ec 0c             	sub    $0xc,%esp
c0005894:	ff 75 ec             	pushl  -0x14(%ebp)
c0005897:	e8 08 d1 ff ff       	call   c00029a4 <sys_malloc>
c000589c:	83 c4 10             	add    $0x10,%esp
c000589f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00058a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00058a5:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c00058ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00058af:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00058b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00058b8:	89 50 50             	mov    %edx,0x50(%eax)
c00058bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00058be:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c00058c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00058c7:	89 50 58             	mov    %edx,0x58(%eax)
c00058ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00058cd:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00058d3:	83 ec 04             	sub    $0x4,%esp
c00058d6:	50                   	push   %eax
c00058d7:	ff 75 e8             	pushl  -0x18(%ebp)
c00058da:	6a 01                	push   $0x1
c00058dc:	e8 cd 4b 00 00       	call   c000a4ae <send_rec>
c00058e1:	83 c4 10             	add    $0x10,%esp
c00058e4:	eb 01                	jmp    c00058e7 <tty_dev_write+0x21a>
c00058e6:	90                   	nop
c00058e7:	c9                   	leave  
c00058e8:	c3                   	ret    

c00058e9 <tty_do_read>:
c00058e9:	55                   	push   %ebp
c00058ea:	89 e5                	mov    %esp,%ebp
c00058ec:	83 ec 08             	sub    $0x8,%esp
c00058ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00058f2:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00058f9:	00 00 00 
c00058fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058ff:	8b 50 58             	mov    0x58(%eax),%edx
c0005902:	8b 45 08             	mov    0x8(%ebp),%eax
c0005905:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c000590b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000590e:	8b 00                	mov    (%eax),%eax
c0005910:	89 c2                	mov    %eax,%edx
c0005912:	8b 45 08             	mov    0x8(%ebp),%eax
c0005915:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000591b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000591e:	8b 50 50             	mov    0x50(%eax),%edx
c0005921:	8b 45 08             	mov    0x8(%ebp),%eax
c0005924:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000592a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000592d:	8b 50 50             	mov    0x50(%eax),%edx
c0005930:	8b 45 08             	mov    0x8(%ebp),%eax
c0005933:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005939:	8b 45 08             	mov    0x8(%ebp),%eax
c000593c:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c0005942:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005945:	8b 40 10             	mov    0x10(%eax),%eax
c0005948:	83 ec 08             	sub    $0x8,%esp
c000594b:	52                   	push   %edx
c000594c:	50                   	push   %eax
c000594d:	e8 5e 18 00 00       	call   c00071b0 <alloc_virtual_memory>
c0005952:	83 c4 10             	add    $0x10,%esp
c0005955:	89 c2                	mov    %eax,%edx
c0005957:	8b 45 08             	mov    0x8(%ebp),%eax
c000595a:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0005960:	8b 45 08             	mov    0x8(%ebp),%eax
c0005963:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005969:	83 f8 02             	cmp    $0x2,%eax
c000596c:	74 1c                	je     c000598a <tty_do_read+0xa1>
c000596e:	68 39 01 00 00       	push   $0x139
c0005973:	68 4b b8 00 c0       	push   $0xc000b84b
c0005978:	68 4b b8 00 c0       	push   $0xc000b84b
c000597d:	68 55 b8 00 c0       	push   $0xc000b855
c0005982:	e8 fb 41 00 00       	call   c0009b82 <assertion_failure>
c0005987:	83 c4 10             	add    $0x10,%esp
c000598a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000598d:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c0005994:	8b 45 08             	mov    0x8(%ebp),%eax
c0005997:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000599d:	83 ec 04             	sub    $0x4,%esp
c00059a0:	50                   	push   %eax
c00059a1:	ff 75 0c             	pushl  0xc(%ebp)
c00059a4:	6a 01                	push   $0x1
c00059a6:	e8 03 4b 00 00       	call   c000a4ae <send_rec>
c00059ab:	83 c4 10             	add    $0x10,%esp
c00059ae:	90                   	nop
c00059af:	c9                   	leave  
c00059b0:	c3                   	ret    

c00059b1 <tty_do_write>:
c00059b1:	55                   	push   %ebp
c00059b2:	89 e5                	mov    %esp,%ebp
c00059b4:	53                   	push   %ebx
c00059b5:	83 ec 24             	sub    $0x24,%esp
c00059b8:	89 e0                	mov    %esp,%eax
c00059ba:	89 c3                	mov    %eax,%ebx
c00059bc:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c00059c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00059c6:	8d 50 ff             	lea    -0x1(%eax),%edx
c00059c9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00059cc:	89 c2                	mov    %eax,%edx
c00059ce:	b8 10 00 00 00       	mov    $0x10,%eax
c00059d3:	83 e8 01             	sub    $0x1,%eax
c00059d6:	01 d0                	add    %edx,%eax
c00059d8:	b9 10 00 00 00       	mov    $0x10,%ecx
c00059dd:	ba 00 00 00 00       	mov    $0x0,%edx
c00059e2:	f7 f1                	div    %ecx
c00059e4:	6b c0 10             	imul   $0x10,%eax,%eax
c00059e7:	29 c4                	sub    %eax,%esp
c00059e9:	89 e0                	mov    %esp,%eax
c00059eb:	83 c0 00             	add    $0x0,%eax
c00059ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00059f1:	83 ec 04             	sub    $0x4,%esp
c00059f4:	ff 75 e8             	pushl  -0x18(%ebp)
c00059f7:	6a 00                	push   $0x0
c00059f9:	ff 75 e0             	pushl  -0x20(%ebp)
c00059fc:	e8 36 67 00 00       	call   c000c137 <Memset>
c0005a01:	83 c4 10             	add    $0x10,%esp
c0005a04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a07:	8b 40 50             	mov    0x50(%eax),%eax
c0005a0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005a0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a10:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005a17:	00 00 00 
c0005a1a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005a1d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a20:	8b 40 10             	mov    0x10(%eax),%eax
c0005a23:	83 ec 08             	sub    $0x8,%esp
c0005a26:	52                   	push   %edx
c0005a27:	50                   	push   %eax
c0005a28:	e8 83 17 00 00       	call   c00071b0 <alloc_virtual_memory>
c0005a2d:	83 c4 10             	add    $0x10,%esp
c0005a30:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005a33:	eb 7e                	jmp    c0005ab3 <tty_do_write+0x102>
c0005a35:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005a38:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005a3b:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005a3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005a42:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a45:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005a4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005a4e:	01 d0                	add    %edx,%eax
c0005a50:	83 ec 04             	sub    $0x4,%esp
c0005a53:	ff 75 f0             	pushl  -0x10(%ebp)
c0005a56:	50                   	push   %eax
c0005a57:	ff 75 e0             	pushl  -0x20(%ebp)
c0005a5a:	e8 02 22 00 00       	call   c0007c61 <Memcpy>
c0005a5f:	83 c4 10             	add    $0x10,%esp
c0005a62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a65:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0005a68:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a6b:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005a71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a74:	01 c2                	add    %eax,%edx
c0005a76:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a79:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005a7f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005a86:	eb 25                	jmp    c0005aad <tty_do_write+0xfc>
c0005a88:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a8e:	01 d0                	add    %edx,%eax
c0005a90:	0f b6 00             	movzbl (%eax),%eax
c0005a93:	0f b6 c0             	movzbl %al,%eax
c0005a96:	83 ec 08             	sub    $0x8,%esp
c0005a99:	50                   	push   %eax
c0005a9a:	ff 75 08             	pushl  0x8(%ebp)
c0005a9d:	e8 44 fa ff ff       	call   c00054e6 <out_char>
c0005aa2:	83 c4 10             	add    $0x10,%esp
c0005aa5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005aa9:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005aad:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005ab1:	75 d5                	jne    c0005a88 <tty_do_write+0xd7>
c0005ab3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005ab7:	0f 85 78 ff ff ff    	jne    c0005a35 <tty_do_write+0x84>
c0005abd:	83 ec 0c             	sub    $0xc,%esp
c0005ac0:	6a 6c                	push   $0x6c
c0005ac2:	e8 dd ce ff ff       	call   c00029a4 <sys_malloc>
c0005ac7:	83 c4 10             	add    $0x10,%esp
c0005aca:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005acd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ad0:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0005ad7:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ada:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005ae0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ae3:	89 50 48             	mov    %edx,0x48(%eax)
c0005ae6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005ae9:	8b 00                	mov    (%eax),%eax
c0005aeb:	83 ec 04             	sub    $0x4,%esp
c0005aee:	50                   	push   %eax
c0005aef:	ff 75 d8             	pushl  -0x28(%ebp)
c0005af2:	6a 01                	push   $0x1
c0005af4:	e8 b5 49 00 00       	call   c000a4ae <send_rec>
c0005af9:	83 c4 10             	add    $0x10,%esp
c0005afc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005aff:	83 ec 08             	sub    $0x8,%esp
c0005b02:	6a 6c                	push   $0x6c
c0005b04:	50                   	push   %eax
c0005b05:	e8 30 1c 00 00       	call   c000773a <sys_free>
c0005b0a:	83 c4 10             	add    $0x10,%esp
c0005b0d:	89 dc                	mov    %ebx,%esp
c0005b0f:	90                   	nop
c0005b10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005b13:	c9                   	leave  
c0005b14:	c3                   	ret    

c0005b15 <init_screen>:
c0005b15:	55                   	push   %ebp
c0005b16:	89 e5                	mov    %esp,%ebp
c0005b18:	83 ec 10             	sub    $0x10,%esp
c0005b1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b1e:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005b23:	c1 f8 03             	sar    $0x3,%eax
c0005b26:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005b2c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005b2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005b32:	c1 e0 04             	shl    $0x4,%eax
c0005b35:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c0005b3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b3e:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005b44:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005b4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b4e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b54:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0005b57:	89 50 04             	mov    %edx,0x4(%eax)
c0005b5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b5d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b63:	8b 50 04             	mov    0x4(%eax),%edx
c0005b66:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b69:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b6f:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0005b73:	89 10                	mov    %edx,(%eax)
c0005b75:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b78:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0005b7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b81:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b87:	8b 12                	mov    (%edx),%edx
c0005b89:	89 50 08             	mov    %edx,0x8(%eax)
c0005b8c:	8b 55 08             	mov    0x8(%ebp),%edx
c0005b8f:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c0005b95:	8b 40 08             	mov    0x8(%eax),%eax
c0005b98:	89 42 0c             	mov    %eax,0xc(%edx)
c0005b9b:	90                   	nop
c0005b9c:	c9                   	leave  
c0005b9d:	c3                   	ret    

c0005b9e <init_tty>:
c0005b9e:	55                   	push   %ebp
c0005b9f:	89 e5                	mov    %esp,%ebp
c0005ba1:	83 ec 18             	sub    $0x18,%esp
c0005ba4:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005bab:	e9 92 00 00 00       	jmp    c0005c42 <init_tty+0xa4>
c0005bb0:	83 ec 04             	sub    $0x4,%esp
c0005bb3:	68 28 08 00 00       	push   $0x828
c0005bb8:	6a 00                	push   $0x0
c0005bba:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bbd:	e8 75 65 00 00       	call   c000c137 <Memset>
c0005bc2:	83 c4 10             	add    $0x10,%esp
c0005bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bc8:	8d 50 08             	lea    0x8(%eax),%edx
c0005bcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bce:	89 50 04             	mov    %edx,0x4(%eax)
c0005bd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bd4:	8b 50 04             	mov    0x4(%eax),%edx
c0005bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bda:	89 10                	mov    %edx,(%eax)
c0005bdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bdf:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005be6:	00 00 00 
c0005be9:	83 ec 0c             	sub    $0xc,%esp
c0005bec:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bef:	e8 21 ff ff ff       	call   c0005b15 <init_screen>
c0005bf4:	83 c4 10             	add    $0x10,%esp
c0005bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bfa:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005bff:	85 c0                	test   %eax,%eax
c0005c01:	7e 38                	jle    c0005c3b <init_tty+0x9d>
c0005c03:	83 ec 08             	sub    $0x8,%esp
c0005c06:	6a 23                	push   $0x23
c0005c08:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c0b:	e8 d6 f8 ff ff       	call   c00054e6 <out_char>
c0005c10:	83 c4 10             	add    $0x10,%esp
c0005c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c16:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005c1b:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005c20:	c1 f8 03             	sar    $0x3,%eax
c0005c23:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005c29:	0f b6 c0             	movzbl %al,%eax
c0005c2c:	83 ec 08             	sub    $0x8,%esp
c0005c2f:	50                   	push   %eax
c0005c30:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c33:	e8 ae f8 ff ff       	call   c00054e6 <out_char>
c0005c38:	83 c4 10             	add    $0x10,%esp
c0005c3b:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005c42:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005c47:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005c4a:	0f 82 60 ff ff ff    	jb     c0005bb0 <init_tty+0x12>
c0005c50:	90                   	nop
c0005c51:	c9                   	leave  
c0005c52:	c3                   	ret    

c0005c53 <TaskTTY>:
c0005c53:	55                   	push   %ebp
c0005c54:	89 e5                	mov    %esp,%ebp
c0005c56:	83 ec 28             	sub    $0x28,%esp
c0005c59:	e8 40 ff ff ff       	call   c0005b9e <init_tty>
c0005c5e:	83 ec 0c             	sub    $0xc,%esp
c0005c61:	6a 00                	push   $0x0
c0005c63:	e8 34 f6 ff ff       	call   c000529c <select_console>
c0005c68:	83 c4 10             	add    $0x10,%esp
c0005c6b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005c72:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005c79:	83 ec 0c             	sub    $0xc,%esp
c0005c7c:	6a 6c                	push   $0x6c
c0005c7e:	e8 21 cd ff ff       	call   c00029a4 <sys_malloc>
c0005c83:	83 c4 10             	add    $0x10,%esp
c0005c86:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005c89:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005c90:	eb 30                	jmp    c0005cc2 <TaskTTY+0x6f>
c0005c92:	83 ec 0c             	sub    $0xc,%esp
c0005c95:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c98:	e8 06 fa ff ff       	call   c00056a3 <tty_dev_read>
c0005c9d:	83 c4 10             	add    $0x10,%esp
c0005ca0:	83 ec 0c             	sub    $0xc,%esp
c0005ca3:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ca6:	e8 22 fa ff ff       	call   c00056cd <tty_dev_write>
c0005cab:	83 c4 10             	add    $0x10,%esp
c0005cae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cb1:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005cb7:	85 c0                	test   %eax,%eax
c0005cb9:	75 d7                	jne    c0005c92 <TaskTTY+0x3f>
c0005cbb:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005cc2:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005cc7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005cca:	72 c6                	jb     c0005c92 <TaskTTY+0x3f>
c0005ccc:	83 ec 04             	sub    $0x4,%esp
c0005ccf:	6a 12                	push   $0x12
c0005cd1:	ff 75 e8             	pushl  -0x18(%ebp)
c0005cd4:	6a 02                	push   $0x2
c0005cd6:	e8 d3 47 00 00       	call   c000a4ae <send_rec>
c0005cdb:	83 c4 10             	add    $0x10,%esp
c0005cde:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005ce1:	8b 40 68             	mov    0x68(%eax),%eax
c0005ce4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005ce7:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005cee:	74 28                	je     c0005d18 <TaskTTY+0xc5>
c0005cf0:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005cf7:	7f 0b                	jg     c0005d04 <TaskTTY+0xb1>
c0005cf9:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005d00:	74 4e                	je     c0005d50 <TaskTTY+0xfd>
c0005d02:	eb 4d                	jmp    c0005d51 <TaskTTY+0xfe>
c0005d04:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005d0b:	74 21                	je     c0005d2e <TaskTTY+0xdb>
c0005d0d:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005d14:	74 2e                	je     c0005d44 <TaskTTY+0xf1>
c0005d16:	eb 39                	jmp    c0005d51 <TaskTTY+0xfe>
c0005d18:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005d1d:	83 ec 08             	sub    $0x8,%esp
c0005d20:	ff 75 e8             	pushl  -0x18(%ebp)
c0005d23:	50                   	push   %eax
c0005d24:	e8 c0 fb ff ff       	call   c00058e9 <tty_do_read>
c0005d29:	83 c4 10             	add    $0x10,%esp
c0005d2c:	eb 23                	jmp    c0005d51 <TaskTTY+0xfe>
c0005d2e:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005d33:	83 ec 08             	sub    $0x8,%esp
c0005d36:	ff 75 e8             	pushl  -0x18(%ebp)
c0005d39:	50                   	push   %eax
c0005d3a:	e8 72 fc ff ff       	call   c00059b1 <tty_do_write>
c0005d3f:	83 c4 10             	add    $0x10,%esp
c0005d42:	eb 0d                	jmp    c0005d51 <TaskTTY+0xfe>
c0005d44:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005d4b:	00 00 00 
c0005d4e:	eb 01                	jmp    c0005d51 <TaskTTY+0xfe>
c0005d50:	90                   	nop
c0005d51:	e9 33 ff ff ff       	jmp    c0005c89 <TaskTTY+0x36>

c0005d56 <keyboard_handler>:
c0005d56:	55                   	push   %ebp
c0005d57:	89 e5                	mov    %esp,%ebp
c0005d59:	83 ec 18             	sub    $0x18,%esp
c0005d5c:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c0005d63:	00 00 00 
c0005d66:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005d6d:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d72:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005d77:	7f 5e                	jg     c0005dd7 <keyboard_handler+0x81>
c0005d79:	e8 36 ba ff ff       	call   c00017b4 <disable_int>
c0005d7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d81:	0f b7 c0             	movzwl %ax,%eax
c0005d84:	83 ec 0c             	sub    $0xc,%esp
c0005d87:	50                   	push   %eax
c0005d88:	e8 f9 b9 ff ff       	call   c0001786 <in_byte>
c0005d8d:	83 c4 10             	add    $0x10,%esp
c0005d90:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005d93:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d98:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005d9c:	88 10                	mov    %dl,(%eax)
c0005d9e:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005da3:	83 c0 01             	add    $0x1,%eax
c0005da6:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005dab:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005db0:	83 c0 01             	add    $0x1,%eax
c0005db3:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005db8:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005dbd:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005dc2:	39 d0                	cmp    %edx,%eax
c0005dc4:	72 0a                	jb     c0005dd0 <keyboard_handler+0x7a>
c0005dc6:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005dcd:	0b 01 c0 
c0005dd0:	e8 e1 b9 ff ff       	call   c00017b6 <enable_int>
c0005dd5:	eb 01                	jmp    c0005dd8 <keyboard_handler+0x82>
c0005dd7:	90                   	nop
c0005dd8:	c9                   	leave  
c0005dd9:	c3                   	ret    

c0005dda <read_from_keyboard_buf>:
c0005dda:	55                   	push   %ebp
c0005ddb:	89 e5                	mov    %esp,%ebp
c0005ddd:	83 ec 18             	sub    $0x18,%esp
c0005de0:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005de4:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005de9:	85 c0                	test   %eax,%eax
c0005deb:	7f 06                	jg     c0005df3 <read_from_keyboard_buf+0x19>
c0005ded:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005df1:	eb 4b                	jmp    c0005e3e <read_from_keyboard_buf+0x64>
c0005df3:	e8 bc b9 ff ff       	call   c00017b4 <disable_int>
c0005df8:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005dfd:	0f b6 00             	movzbl (%eax),%eax
c0005e00:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005e03:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005e08:	83 c0 01             	add    $0x1,%eax
c0005e0b:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005e10:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005e15:	83 e8 01             	sub    $0x1,%eax
c0005e18:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005e1d:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005e22:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005e27:	39 d0                	cmp    %edx,%eax
c0005e29:	72 0a                	jb     c0005e35 <read_from_keyboard_buf+0x5b>
c0005e2b:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c0005e32:	0b 01 c0 
c0005e35:	e8 7c b9 ff ff       	call   c00017b6 <enable_int>
c0005e3a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005e3e:	c9                   	leave  
c0005e3f:	c3                   	ret    

c0005e40 <keyboard_read>:
c0005e40:	55                   	push   %ebp
c0005e41:	89 e5                	mov    %esp,%ebp
c0005e43:	83 ec 28             	sub    $0x28,%esp
c0005e46:	90                   	nop
c0005e47:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005e4c:	85 c0                	test   %eax,%eax
c0005e4e:	7e f7                	jle    c0005e47 <keyboard_read+0x7>
c0005e50:	e8 85 ff ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005e55:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005e58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005e5f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005e63:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005e67:	75 5a                	jne    c0005ec3 <keyboard_read+0x83>
c0005e69:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005e6d:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005e71:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005e75:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005e79:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005e7d:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005e81:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005e85:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005e8c:	eb 20                	jmp    c0005eae <keyboard_read+0x6e>
c0005e8e:	e8 47 ff ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005e93:	89 c1                	mov    %eax,%ecx
c0005e95:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005e98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e9b:	01 d0                	add    %edx,%eax
c0005e9d:	0f b6 00             	movzbl (%eax),%eax
c0005ea0:	38 c1                	cmp    %al,%cl
c0005ea2:	74 06                	je     c0005eaa <keyboard_read+0x6a>
c0005ea4:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005ea8:	eb 0a                	jmp    c0005eb4 <keyboard_read+0x74>
c0005eaa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005eae:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005eb2:	7e da                	jle    c0005e8e <keyboard_read+0x4e>
c0005eb4:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005eb8:	74 68                	je     c0005f22 <keyboard_read+0xe2>
c0005eba:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005ec1:	eb 5f                	jmp    c0005f22 <keyboard_read+0xe2>
c0005ec3:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005ec7:	75 59                	jne    c0005f22 <keyboard_read+0xe2>
c0005ec9:	e8 0c ff ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005ece:	3c 2a                	cmp    $0x2a,%al
c0005ed0:	75 1d                	jne    c0005eef <keyboard_read+0xaf>
c0005ed2:	e8 03 ff ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005ed7:	3c e0                	cmp    $0xe0,%al
c0005ed9:	75 14                	jne    c0005eef <keyboard_read+0xaf>
c0005edb:	e8 fa fe ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005ee0:	3c 37                	cmp    $0x37,%al
c0005ee2:	75 0b                	jne    c0005eef <keyboard_read+0xaf>
c0005ee4:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005eeb:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005eef:	e8 e6 fe ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005ef4:	3c b7                	cmp    $0xb7,%al
c0005ef6:	75 1d                	jne    c0005f15 <keyboard_read+0xd5>
c0005ef8:	e8 dd fe ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005efd:	3c e0                	cmp    $0xe0,%al
c0005eff:	75 14                	jne    c0005f15 <keyboard_read+0xd5>
c0005f01:	e8 d4 fe ff ff       	call   c0005dda <read_from_keyboard_buf>
c0005f06:	3c aa                	cmp    $0xaa,%al
c0005f08:	75 0b                	jne    c0005f15 <keyboard_read+0xd5>
c0005f0a:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005f11:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005f15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005f19:	75 07                	jne    c0005f22 <keyboard_read+0xe2>
c0005f1b:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c0005f22:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005f29:	0f 84 8d 00 00 00    	je     c0005fbc <keyboard_read+0x17c>
c0005f2f:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005f36:	0f 84 80 00 00 00    	je     c0005fbc <keyboard_read+0x17c>
c0005f3c:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005f40:	0f 94 c2             	sete   %dl
c0005f43:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005f47:	0f 94 c0             	sete   %al
c0005f4a:	09 d0                	or     %edx,%eax
c0005f4c:	84 c0                	test   %al,%al
c0005f4e:	74 07                	je     c0005f57 <keyboard_read+0x117>
c0005f50:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005f57:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005f5b:	f7 d0                	not    %eax
c0005f5d:	c0 e8 07             	shr    $0x7,%al
c0005f60:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005f63:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005f67:	74 53                	je     c0005fbc <keyboard_read+0x17c>
c0005f69:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005f6d:	74 4d                	je     c0005fbc <keyboard_read+0x17c>
c0005f6f:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005f73:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005f7a:	3c 01                	cmp    $0x1,%al
c0005f7c:	75 04                	jne    c0005f82 <keyboard_read+0x142>
c0005f7e:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005f82:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c0005f89:	84 c0                	test   %al,%al
c0005f8b:	74 04                	je     c0005f91 <keyboard_read+0x151>
c0005f8d:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005f91:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005f95:	89 d0                	mov    %edx,%eax
c0005f97:	01 c0                	add    %eax,%eax
c0005f99:	01 c2                	add    %eax,%edx
c0005f9b:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005f9f:	01 d0                	add    %edx,%eax
c0005fa1:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005fa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005fab:	83 ec 08             	sub    $0x8,%esp
c0005fae:	ff 75 f4             	pushl  -0xc(%ebp)
c0005fb1:	ff 75 08             	pushl  0x8(%ebp)
c0005fb4:	e8 1a 00 00 00       	call   c0005fd3 <in_process>
c0005fb9:	83 c4 10             	add    $0x10,%esp
c0005fbc:	90                   	nop
c0005fbd:	c9                   	leave  
c0005fbe:	c3                   	ret    

c0005fbf <init_keyboard_handler>:
c0005fbf:	55                   	push   %ebp
c0005fc0:	89 e5                	mov    %esp,%ebp
c0005fc2:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005fc9:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005fd0:	90                   	nop
c0005fd1:	5d                   	pop    %ebp
c0005fd2:	c3                   	ret    

c0005fd3 <in_process>:
c0005fd3:	55                   	push   %ebp
c0005fd4:	89 e5                	mov    %esp,%ebp
c0005fd6:	83 ec 18             	sub    $0x18,%esp
c0005fd9:	83 ec 04             	sub    $0x4,%esp
c0005fdc:	6a 02                	push   $0x2
c0005fde:	6a 00                	push   $0x0
c0005fe0:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005fe3:	50                   	push   %eax
c0005fe4:	e8 4e 61 00 00       	call   c000c137 <Memset>
c0005fe9:	83 c4 10             	add    $0x10,%esp
c0005fec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005fef:	25 00 01 00 00       	and    $0x100,%eax
c0005ff4:	85 c0                	test   %eax,%eax
c0005ff6:	75 28                	jne    c0006020 <in_process+0x4d>
c0005ff8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005ffb:	0f b6 c0             	movzbl %al,%eax
c0005ffe:	83 ec 08             	sub    $0x8,%esp
c0006001:	50                   	push   %eax
c0006002:	ff 75 08             	pushl  0x8(%ebp)
c0006005:	e8 c3 f3 ff ff       	call   c00053cd <put_key>
c000600a:	83 c4 10             	add    $0x10,%esp
c000600d:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0006014:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c000601b:	e9 42 01 00 00       	jmp    c0006162 <in_process+0x18f>
c0006020:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0006027:	84 c0                	test   %al,%al
c0006029:	0f 84 a9 00 00 00    	je     c00060d8 <in_process+0x105>
c000602f:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0006033:	0f 84 9f 00 00 00    	je     c00060d8 <in_process+0x105>
c0006039:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c000603d:	0f 84 95 00 00 00    	je     c00060d8 <in_process+0x105>
c0006043:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000604a:	74 64                	je     c00060b0 <in_process+0xdd>
c000604c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0006053:	77 0b                	ja     c0006060 <in_process+0x8d>
c0006055:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c000605c:	74 64                	je     c00060c2 <in_process+0xef>
c000605e:	eb 73                	jmp    c00060d3 <in_process+0x100>
c0006060:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0006067:	74 0b                	je     c0006074 <in_process+0xa1>
c0006069:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0006070:	74 20                	je     c0006092 <in_process+0xbf>
c0006072:	eb 5f                	jmp    c00060d3 <in_process+0x100>
c0006074:	83 ec 0c             	sub    $0xc,%esp
c0006077:	ff 75 08             	pushl  0x8(%ebp)
c000607a:	e8 ba f3 ff ff       	call   c0005439 <scroll_up>
c000607f:	83 c4 10             	add    $0x10,%esp
c0006082:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0006089:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0006090:	eb 41                	jmp    c00060d3 <in_process+0x100>
c0006092:	83 ec 0c             	sub    $0xc,%esp
c0006095:	ff 75 08             	pushl  0x8(%ebp)
c0006098:	e8 de f3 ff ff       	call   c000547b <scroll_down>
c000609d:	83 c4 10             	add    $0x10,%esp
c00060a0:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c00060a7:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c00060ae:	eb 23                	jmp    c00060d3 <in_process+0x100>
c00060b0:	83 ec 08             	sub    $0x8,%esp
c00060b3:	6a 0a                	push   $0xa
c00060b5:	ff 75 08             	pushl  0x8(%ebp)
c00060b8:	e8 29 f4 ff ff       	call   c00054e6 <out_char>
c00060bd:	83 c4 10             	add    $0x10,%esp
c00060c0:	eb 11                	jmp    c00060d3 <in_process+0x100>
c00060c2:	83 ec 08             	sub    $0x8,%esp
c00060c5:	6a 08                	push   $0x8
c00060c7:	ff 75 08             	pushl  0x8(%ebp)
c00060ca:	e8 17 f4 ff ff       	call   c00054e6 <out_char>
c00060cf:	83 c4 10             	add    $0x10,%esp
c00060d2:	90                   	nop
c00060d3:	e9 8a 00 00 00       	jmp    c0006162 <in_process+0x18f>
c00060d8:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c00060df:	74 55                	je     c0006136 <in_process+0x163>
c00060e1:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c00060e8:	77 14                	ja     c00060fe <in_process+0x12b>
c00060ea:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c00060f1:	74 31                	je     c0006124 <in_process+0x151>
c00060f3:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00060fa:	74 16                	je     c0006112 <in_process+0x13f>
c00060fc:	eb 64                	jmp    c0006162 <in_process+0x18f>
c00060fe:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0006105:	74 3e                	je     c0006145 <in_process+0x172>
c0006107:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c000610e:	74 44                	je     c0006154 <in_process+0x181>
c0006110:	eb 50                	jmp    c0006162 <in_process+0x18f>
c0006112:	83 ec 08             	sub    $0x8,%esp
c0006115:	6a 0a                	push   $0xa
c0006117:	ff 75 08             	pushl  0x8(%ebp)
c000611a:	e8 ae f2 ff ff       	call   c00053cd <put_key>
c000611f:	83 c4 10             	add    $0x10,%esp
c0006122:	eb 3e                	jmp    c0006162 <in_process+0x18f>
c0006124:	83 ec 08             	sub    $0x8,%esp
c0006127:	6a 08                	push   $0x8
c0006129:	ff 75 08             	pushl  0x8(%ebp)
c000612c:	e8 9c f2 ff ff       	call   c00053cd <put_key>
c0006131:	83 c4 10             	add    $0x10,%esp
c0006134:	eb 2c                	jmp    c0006162 <in_process+0x18f>
c0006136:	83 ec 0c             	sub    $0xc,%esp
c0006139:	6a 00                	push   $0x0
c000613b:	e8 5c f1 ff ff       	call   c000529c <select_console>
c0006140:	83 c4 10             	add    $0x10,%esp
c0006143:	eb 1d                	jmp    c0006162 <in_process+0x18f>
c0006145:	83 ec 0c             	sub    $0xc,%esp
c0006148:	6a 01                	push   $0x1
c000614a:	e8 4d f1 ff ff       	call   c000529c <select_console>
c000614f:	83 c4 10             	add    $0x10,%esp
c0006152:	eb 0e                	jmp    c0006162 <in_process+0x18f>
c0006154:	83 ec 0c             	sub    $0xc,%esp
c0006157:	6a 02                	push   $0x2
c0006159:	e8 3e f1 ff ff       	call   c000529c <select_console>
c000615e:	83 c4 10             	add    $0x10,%esp
c0006161:	90                   	nop
c0006162:	90                   	nop
c0006163:	c9                   	leave  
c0006164:	c3                   	ret    

c0006165 <open>:
c0006165:	55                   	push   %ebp
c0006166:	89 e5                	mov    %esp,%ebp
c0006168:	83 ec 18             	sub    $0x18,%esp
c000616b:	83 ec 0c             	sub    $0xc,%esp
c000616e:	6a 6c                	push   $0x6c
c0006170:	e8 2f c8 ff ff       	call   c00029a4 <sys_malloc>
c0006175:	83 c4 10             	add    $0x10,%esp
c0006178:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000617b:	83 ec 04             	sub    $0x4,%esp
c000617e:	6a 6c                	push   $0x6c
c0006180:	6a 00                	push   $0x0
c0006182:	ff 75 f4             	pushl  -0xc(%ebp)
c0006185:	e8 ad 5f 00 00       	call   c000c137 <Memset>
c000618a:	83 c4 10             	add    $0x10,%esp
c000618d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006190:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0006197:	83 ec 0c             	sub    $0xc,%esp
c000619a:	ff 75 08             	pushl  0x8(%ebp)
c000619d:	e8 d5 10 00 00       	call   c0007277 <get_physical_address>
c00061a2:	83 c4 10             	add    $0x10,%esp
c00061a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061ab:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00061ae:	89 50 34             	mov    %edx,0x34(%eax)
c00061b1:	8b 55 0c             	mov    0xc(%ebp),%edx
c00061b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061b7:	89 50 64             	mov    %edx,0x64(%eax)
c00061ba:	83 ec 0c             	sub    $0xc,%esp
c00061bd:	ff 75 08             	pushl  0x8(%ebp)
c00061c0:	e8 ab 5f 00 00       	call   c000c170 <Strlen>
c00061c5:	83 c4 10             	add    $0x10,%esp
c00061c8:	89 c2                	mov    %eax,%edx
c00061ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061cd:	89 50 30             	mov    %edx,0x30(%eax)
c00061d0:	83 ec 04             	sub    $0x4,%esp
c00061d3:	6a 02                	push   $0x2
c00061d5:	ff 75 f4             	pushl  -0xc(%ebp)
c00061d8:	6a 03                	push   $0x3
c00061da:	e8 cf 42 00 00       	call   c000a4ae <send_rec>
c00061df:	83 c4 10             	add    $0x10,%esp
c00061e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061e5:	8b 40 40             	mov    0x40(%eax),%eax
c00061e8:	c9                   	leave  
c00061e9:	c3                   	ret    

c00061ea <read>:
c00061ea:	55                   	push   %ebp
c00061eb:	89 e5                	mov    %esp,%ebp
c00061ed:	83 ec 18             	sub    $0x18,%esp
c00061f0:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00061f7:	83 ec 0c             	sub    $0xc,%esp
c00061fa:	ff 75 f4             	pushl  -0xc(%ebp)
c00061fd:	e8 a2 c7 ff ff       	call   c00029a4 <sys_malloc>
c0006202:	83 c4 10             	add    $0x10,%esp
c0006205:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006208:	83 ec 0c             	sub    $0xc,%esp
c000620b:	ff 75 0c             	pushl  0xc(%ebp)
c000620e:	e8 64 10 00 00       	call   c0007277 <get_physical_address>
c0006213:	83 c4 10             	add    $0x10,%esp
c0006216:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006219:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000621c:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0006223:	8b 55 08             	mov    0x8(%ebp),%edx
c0006226:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006229:	89 50 40             	mov    %edx,0x40(%eax)
c000622c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000622f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006232:	89 50 10             	mov    %edx,0x10(%eax)
c0006235:	8b 55 10             	mov    0x10(%ebp),%edx
c0006238:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000623b:	89 50 50             	mov    %edx,0x50(%eax)
c000623e:	83 ec 04             	sub    $0x4,%esp
c0006241:	6a 02                	push   $0x2
c0006243:	ff 75 f0             	pushl  -0x10(%ebp)
c0006246:	6a 03                	push   $0x3
c0006248:	e8 61 42 00 00       	call   c000a4ae <send_rec>
c000624d:	83 c4 10             	add    $0x10,%esp
c0006250:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006253:	8b 40 50             	mov    0x50(%eax),%eax
c0006256:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006259:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000625c:	c9                   	leave  
c000625d:	c3                   	ret    

c000625e <write>:
c000625e:	55                   	push   %ebp
c000625f:	89 e5                	mov    %esp,%ebp
c0006261:	83 ec 18             	sub    $0x18,%esp
c0006264:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c000626b:	83 ec 0c             	sub    $0xc,%esp
c000626e:	ff 75 f4             	pushl  -0xc(%ebp)
c0006271:	e8 2e c7 ff ff       	call   c00029a4 <sys_malloc>
c0006276:	83 c4 10             	add    $0x10,%esp
c0006279:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000627c:	83 ec 0c             	sub    $0xc,%esp
c000627f:	ff 75 0c             	pushl  0xc(%ebp)
c0006282:	e8 f0 0f 00 00       	call   c0007277 <get_physical_address>
c0006287:	83 c4 10             	add    $0x10,%esp
c000628a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000628d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006290:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0006297:	8b 55 08             	mov    0x8(%ebp),%edx
c000629a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000629d:	89 50 40             	mov    %edx,0x40(%eax)
c00062a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00062a6:	89 50 10             	mov    %edx,0x10(%eax)
c00062a9:	8b 55 10             	mov    0x10(%ebp),%edx
c00062ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062af:	89 50 50             	mov    %edx,0x50(%eax)
c00062b2:	83 ec 04             	sub    $0x4,%esp
c00062b5:	6a 02                	push   $0x2
c00062b7:	ff 75 f0             	pushl  -0x10(%ebp)
c00062ba:	6a 03                	push   $0x3
c00062bc:	e8 ed 41 00 00       	call   c000a4ae <send_rec>
c00062c1:	83 c4 10             	add    $0x10,%esp
c00062c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062c7:	8b 40 50             	mov    0x50(%eax),%eax
c00062ca:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00062cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062d0:	c9                   	leave  
c00062d1:	c3                   	ret    

c00062d2 <close>:
c00062d2:	55                   	push   %ebp
c00062d3:	89 e5                	mov    %esp,%ebp
c00062d5:	83 ec 78             	sub    $0x78,%esp
c00062d8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00062df:	8b 45 08             	mov    0x8(%ebp),%eax
c00062e2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00062e5:	83 ec 04             	sub    $0x4,%esp
c00062e8:	6a 02                	push   $0x2
c00062ea:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062ed:	50                   	push   %eax
c00062ee:	6a 03                	push   $0x3
c00062f0:	e8 b9 41 00 00       	call   c000a4ae <send_rec>
c00062f5:	83 c4 10             	add    $0x10,%esp
c00062f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00062fb:	83 f8 65             	cmp    $0x65,%eax
c00062fe:	74 19                	je     c0006319 <close+0x47>
c0006300:	6a 13                	push   $0x13
c0006302:	68 6d b8 00 c0       	push   $0xc000b86d
c0006307:	68 6d b8 00 c0       	push   $0xc000b86d
c000630c:	68 79 b8 00 c0       	push   $0xc000b879
c0006311:	e8 6c 38 00 00       	call   c0009b82 <assertion_failure>
c0006316:	83 c4 10             	add    $0x10,%esp
c0006319:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000631c:	c9                   	leave  
c000631d:	c3                   	ret    

c000631e <wait>:
c000631e:	55                   	push   %ebp
c000631f:	89 e5                	mov    %esp,%ebp
c0006321:	83 ec 78             	sub    $0x78,%esp
c0006324:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c000632b:	83 ec 04             	sub    $0x4,%esp
c000632e:	6a 01                	push   $0x1
c0006330:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006333:	50                   	push   %eax
c0006334:	6a 03                	push   $0x3
c0006336:	e8 73 41 00 00       	call   c000a4ae <send_rec>
c000633b:	83 c4 10             	add    $0x10,%esp
c000633e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006341:	89 c2                	mov    %eax,%edx
c0006343:	8b 45 08             	mov    0x8(%ebp),%eax
c0006346:	89 10                	mov    %edx,(%eax)
c0006348:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000634b:	83 f8 21             	cmp    $0x21,%eax
c000634e:	74 05                	je     c0006355 <wait+0x37>
c0006350:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006353:	eb 05                	jmp    c000635a <wait+0x3c>
c0006355:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000635a:	c9                   	leave  
c000635b:	c3                   	ret    

c000635c <exit>:
c000635c:	55                   	push   %ebp
c000635d:	89 e5                	mov    %esp,%ebp
c000635f:	83 ec 78             	sub    $0x78,%esp
c0006362:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0006369:	8b 45 08             	mov    0x8(%ebp),%eax
c000636c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000636f:	83 ec 04             	sub    $0x4,%esp
c0006372:	6a 01                	push   $0x1
c0006374:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006377:	50                   	push   %eax
c0006378:	6a 03                	push   $0x3
c000637a:	e8 2f 41 00 00       	call   c000a4ae <send_rec>
c000637f:	83 c4 10             	add    $0x10,%esp
c0006382:	90                   	nop
c0006383:	c9                   	leave  
c0006384:	c3                   	ret    

c0006385 <fork>:
c0006385:	55                   	push   %ebp
c0006386:	89 e5                	mov    %esp,%ebp
c0006388:	83 ec 78             	sub    $0x78,%esp
c000638b:	83 ec 04             	sub    $0x4,%esp
c000638e:	6a 6c                	push   $0x6c
c0006390:	6a 00                	push   $0x0
c0006392:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006395:	50                   	push   %eax
c0006396:	e8 9c 5d 00 00       	call   c000c137 <Memset>
c000639b:	83 c4 10             	add    $0x10,%esp
c000639e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00063a5:	83 ec 04             	sub    $0x4,%esp
c00063a8:	6a 01                	push   $0x1
c00063aa:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00063ad:	50                   	push   %eax
c00063ae:	6a 03                	push   $0x3
c00063b0:	e8 f9 40 00 00       	call   c000a4ae <send_rec>
c00063b5:	83 c4 10             	add    $0x10,%esp
c00063b8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00063bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00063c2:	85 c0                	test   %eax,%eax
c00063c4:	74 19                	je     c00063df <fork+0x5a>
c00063c6:	6a 14                	push   $0x14
c00063c8:	68 91 b8 00 c0       	push   $0xc000b891
c00063cd:	68 91 b8 00 c0       	push   $0xc000b891
c00063d2:	68 9c b8 00 c0       	push   $0xc000b89c
c00063d7:	e8 a6 37 00 00       	call   c0009b82 <assertion_failure>
c00063dc:	83 c4 10             	add    $0x10,%esp
c00063df:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00063e2:	c9                   	leave  
c00063e3:	c3                   	ret    

c00063e4 <getpid>:
c00063e4:	55                   	push   %ebp
c00063e5:	89 e5                	mov    %esp,%ebp
c00063e7:	83 ec 78             	sub    $0x78,%esp
c00063ea:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c00063f1:	83 ec 04             	sub    $0x4,%esp
c00063f4:	6a 05                	push   $0x5
c00063f6:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00063f9:	50                   	push   %eax
c00063fa:	6a 03                	push   $0x3
c00063fc:	e8 ad 40 00 00       	call   c000a4ae <send_rec>
c0006401:	83 c4 10             	add    $0x10,%esp
c0006404:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006407:	c9                   	leave  
c0006408:	c3                   	ret    

c0006409 <exec>:
c0006409:	55                   	push   %ebp
c000640a:	89 e5                	mov    %esp,%ebp
c000640c:	83 ec 78             	sub    $0x78,%esp
c000640f:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0006416:	8b 45 08             	mov    0x8(%ebp),%eax
c0006419:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000641c:	83 ec 0c             	sub    $0xc,%esp
c000641f:	ff 75 08             	pushl  0x8(%ebp)
c0006422:	e8 49 5d 00 00       	call   c000c170 <Strlen>
c0006427:	83 c4 10             	add    $0x10,%esp
c000642a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000642d:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0006434:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c000643b:	83 ec 04             	sub    $0x4,%esp
c000643e:	6a 01                	push   $0x1
c0006440:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006443:	50                   	push   %eax
c0006444:	6a 03                	push   $0x3
c0006446:	e8 63 40 00 00       	call   c000a4ae <send_rec>
c000644b:	83 c4 10             	add    $0x10,%esp
c000644e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006451:	83 f8 65             	cmp    $0x65,%eax
c0006454:	74 19                	je     c000646f <exec+0x66>
c0006456:	6a 19                	push   $0x19
c0006458:	68 ac b8 00 c0       	push   $0xc000b8ac
c000645d:	68 ac b8 00 c0       	push   $0xc000b8ac
c0006462:	68 b7 b8 00 c0       	push   $0xc000b8b7
c0006467:	e8 16 37 00 00       	call   c0009b82 <assertion_failure>
c000646c:	83 c4 10             	add    $0x10,%esp
c000646f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006472:	c9                   	leave  
c0006473:	c3                   	ret    

c0006474 <execv>:
c0006474:	55                   	push   %ebp
c0006475:	89 e5                	mov    %esp,%ebp
c0006477:	57                   	push   %edi
c0006478:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c000647e:	83 ec 04             	sub    $0x4,%esp
c0006481:	68 00 80 00 00       	push   $0x8000
c0006486:	6a 00                	push   $0x0
c0006488:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000648e:	50                   	push   %eax
c000648f:	e8 a3 5c 00 00       	call   c000c137 <Memset>
c0006494:	83 c4 10             	add    $0x10,%esp
c0006497:	8b 45 0c             	mov    0xc(%ebp),%eax
c000649a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000649d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00064a4:	eb 0d                	jmp    c00064b3 <execv+0x3f>
c00064a6:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00064aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064ad:	83 c0 04             	add    $0x4,%eax
c00064b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00064b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00064b6:	8b 00                	mov    (%eax),%eax
c00064b8:	85 c0                	test   %eax,%eax
c00064ba:	75 ea                	jne    c00064a6 <execv+0x32>
c00064bc:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00064c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064c5:	01 d0                	add    %edx,%eax
c00064c7:	c6 00 00             	movb   $0x0,(%eax)
c00064ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064cd:	83 c0 04             	add    $0x4,%eax
c00064d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00064d3:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00064d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00064dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00064df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00064e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00064e9:	eb 64                	jmp    c000654f <execv+0xdb>
c00064eb:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00064f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064f4:	01 c2                	add    %eax,%edx
c00064f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00064f9:	89 10                	mov    %edx,(%eax)
c00064fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00064fe:	8b 00                	mov    (%eax),%eax
c0006500:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0006506:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006509:	01 ca                	add    %ecx,%edx
c000650b:	83 ec 08             	sub    $0x8,%esp
c000650e:	50                   	push   %eax
c000650f:	52                   	push   %edx
c0006510:	e8 41 5c 00 00       	call   c000c156 <Strcpy>
c0006515:	83 c4 10             	add    $0x10,%esp
c0006518:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000651b:	8b 00                	mov    (%eax),%eax
c000651d:	83 ec 0c             	sub    $0xc,%esp
c0006520:	50                   	push   %eax
c0006521:	e8 4a 5c 00 00       	call   c000c170 <Strlen>
c0006526:	83 c4 10             	add    $0x10,%esp
c0006529:	01 45 f0             	add    %eax,-0x10(%ebp)
c000652c:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006532:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006535:	01 d0                	add    %edx,%eax
c0006537:	c6 00 00             	movb   $0x0,(%eax)
c000653a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000653d:	83 c0 01             	add    $0x1,%eax
c0006540:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006543:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0006547:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000654b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000654f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006552:	8b 00                	mov    (%eax),%eax
c0006554:	85 c0                	test   %eax,%eax
c0006556:	75 93                	jne    c00064eb <execv+0x77>
c0006558:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000655e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006561:	eb 04                	jmp    c0006567 <execv+0xf3>
c0006563:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0006567:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000656a:	8b 00                	mov    (%eax),%eax
c000656c:	85 c0                	test   %eax,%eax
c000656e:	75 f3                	jne    c0006563 <execv+0xef>
c0006570:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0006576:	b8 00 00 00 00       	mov    $0x0,%eax
c000657b:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0006580:	89 d7                	mov    %edx,%edi
c0006582:	f3 ab                	rep stos %eax,%es:(%edi)
c0006584:	c7 85 4c 7f ff ff cf 	movl   $0xc000b8cf,-0x80b4(%ebp)
c000658b:	b8 00 c0 
c000658e:	c7 85 50 7f ff ff d6 	movl   $0xc000b8d6,-0x80b0(%ebp)
c0006595:	b8 00 c0 
c0006598:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c000659f:	00 00 00 
c00065a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00065a5:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c00065ab:	83 ec 0c             	sub    $0xc,%esp
c00065ae:	ff 75 08             	pushl  0x8(%ebp)
c00065b1:	e8 ba 5b 00 00       	call   c000c170 <Strlen>
c00065b6:	83 c4 10             	add    $0x10,%esp
c00065b9:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c00065bf:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00065c5:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c00065cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065ce:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c00065d4:	83 ec 04             	sub    $0x4,%esp
c00065d7:	6a 01                	push   $0x1
c00065d9:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c00065df:	50                   	push   %eax
c00065e0:	6a 03                	push   $0x3
c00065e2:	e8 c7 3e 00 00       	call   c000a4ae <send_rec>
c00065e7:	83 c4 10             	add    $0x10,%esp
c00065ea:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c00065f0:	83 f8 65             	cmp    $0x65,%eax
c00065f3:	74 19                	je     c000660e <execv+0x19a>
c00065f5:	6a 72                	push   $0x72
c00065f7:	68 ac b8 00 c0       	push   $0xc000b8ac
c00065fc:	68 ac b8 00 c0       	push   $0xc000b8ac
c0006601:	68 b7 b8 00 c0       	push   $0xc000b8b7
c0006606:	e8 77 35 00 00       	call   c0009b82 <assertion_failure>
c000660b:	83 c4 10             	add    $0x10,%esp
c000660e:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0006614:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0006617:	c9                   	leave  
c0006618:	c3                   	ret    

c0006619 <execl>:
c0006619:	55                   	push   %ebp
c000661a:	89 e5                	mov    %esp,%ebp
c000661c:	83 ec 18             	sub    $0x18,%esp
c000661f:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006622:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006625:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006628:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000662b:	83 ec 08             	sub    $0x8,%esp
c000662e:	ff 75 f0             	pushl  -0x10(%ebp)
c0006631:	ff 75 08             	pushl  0x8(%ebp)
c0006634:	e8 3b fe ff ff       	call   c0006474 <execv>
c0006639:	83 c4 10             	add    $0x10,%esp
c000663c:	c9                   	leave  
c000663d:	c3                   	ret    

c000663e <TaskMM>:
c000663e:	55                   	push   %ebp
c000663f:	89 e5                	mov    %esp,%ebp
c0006641:	83 ec 28             	sub    $0x28,%esp
c0006644:	83 ec 0c             	sub    $0xc,%esp
c0006647:	6a 6c                	push   $0x6c
c0006649:	e8 56 c3 ff ff       	call   c00029a4 <sys_malloc>
c000664e:	83 c4 10             	add    $0x10,%esp
c0006651:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006654:	83 ec 0c             	sub    $0xc,%esp
c0006657:	6a 6c                	push   $0x6c
c0006659:	e8 46 c3 ff ff       	call   c00029a4 <sys_malloc>
c000665e:	83 c4 10             	add    $0x10,%esp
c0006661:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006664:	83 ec 04             	sub    $0x4,%esp
c0006667:	6a 12                	push   $0x12
c0006669:	ff 75 f0             	pushl  -0x10(%ebp)
c000666c:	6a 02                	push   $0x2
c000666e:	e8 3b 3e 00 00       	call   c000a4ae <send_rec>
c0006673:	83 c4 10             	add    $0x10,%esp
c0006676:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006679:	8b 40 68             	mov    0x68(%eax),%eax
c000667c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000667f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006682:	8b 00                	mov    (%eax),%eax
c0006684:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006687:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000668e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006691:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0006698:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000669b:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c00066a2:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c00066a6:	74 4b                	je     c00066f3 <TaskMM+0xb5>
c00066a8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c00066ac:	7f 08                	jg     c00066b6 <TaskMM+0x78>
c00066ae:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c00066b2:	74 28                	je     c00066dc <TaskMM+0x9e>
c00066b4:	eb 6e                	jmp    c0006724 <TaskMM+0xe6>
c00066b6:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c00066ba:	74 08                	je     c00066c4 <TaskMM+0x86>
c00066bc:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00066c0:	74 4b                	je     c000670d <TaskMM+0xcf>
c00066c2:	eb 60                	jmp    c0006724 <TaskMM+0xe6>
c00066c4:	83 ec 0c             	sub    $0xc,%esp
c00066c7:	ff 75 f0             	pushl  -0x10(%ebp)
c00066ca:	e8 f9 03 00 00       	call   c0006ac8 <do_fork>
c00066cf:	83 c4 10             	add    $0x10,%esp
c00066d2:	89 c2                	mov    %eax,%edx
c00066d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00066d7:	89 50 4c             	mov    %edx,0x4c(%eax)
c00066da:	eb 59                	jmp    c0006735 <TaskMM+0xf7>
c00066dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00066e3:	83 ec 0c             	sub    $0xc,%esp
c00066e6:	ff 75 f0             	pushl  -0x10(%ebp)
c00066e9:	e8 a9 00 00 00       	call   c0006797 <do_exec>
c00066ee:	83 c4 10             	add    $0x10,%esp
c00066f1:	eb 42                	jmp    c0006735 <TaskMM+0xf7>
c00066f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00066fa:	83 ec 08             	sub    $0x8,%esp
c00066fd:	ff 75 e0             	pushl  -0x20(%ebp)
c0006700:	ff 75 f0             	pushl  -0x10(%ebp)
c0006703:	e8 2b 04 00 00       	call   c0006b33 <do_exit>
c0006708:	83 c4 10             	add    $0x10,%esp
c000670b:	eb 28                	jmp    c0006735 <TaskMM+0xf7>
c000670d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006714:	83 ec 0c             	sub    $0xc,%esp
c0006717:	ff 75 f0             	pushl  -0x10(%ebp)
c000671a:	e8 10 05 00 00       	call   c0006c2f <do_wait>
c000671f:	83 c4 10             	add    $0x10,%esp
c0006722:	eb 11                	jmp    c0006735 <TaskMM+0xf7>
c0006724:	83 ec 0c             	sub    $0xc,%esp
c0006727:	68 dd b8 00 c0       	push   $0xc000b8dd
c000672c:	e8 33 34 00 00       	call   c0009b64 <panic>
c0006731:	83 c4 10             	add    $0x10,%esp
c0006734:	90                   	nop
c0006735:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006739:	0f 84 25 ff ff ff    	je     c0006664 <TaskMM+0x26>
c000673f:	83 ec 0c             	sub    $0xc,%esp
c0006742:	6a 03                	push   $0x3
c0006744:	e8 a8 2f 00 00       	call   c00096f1 <delay>
c0006749:	83 c4 10             	add    $0x10,%esp
c000674c:	83 ec 04             	sub    $0x4,%esp
c000674f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006752:	ff 75 ec             	pushl  -0x14(%ebp)
c0006755:	6a 01                	push   $0x1
c0006757:	e8 52 3d 00 00       	call   c000a4ae <send_rec>
c000675c:	83 c4 10             	add    $0x10,%esp
c000675f:	e9 00 ff ff ff       	jmp    c0006664 <TaskMM+0x26>

c0006764 <alloc_mem>:
c0006764:	55                   	push   %ebp
c0006765:	89 e5                	mov    %esp,%ebp
c0006767:	83 ec 10             	sub    $0x10,%esp
c000676a:	8b 45 08             	mov    0x8(%ebp),%eax
c000676d:	83 e8 08             	sub    $0x8,%eax
c0006770:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0006776:	05 00 00 a0 00       	add    $0xa00000,%eax
c000677b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000677e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006781:	c9                   	leave  
c0006782:	c3                   	ret    

c0006783 <do_exec2>:
c0006783:	55                   	push   %ebp
c0006784:	89 e5                	mov    %esp,%ebp
c0006786:	83 ec 10             	sub    $0x10,%esp
c0006789:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006790:	b8 00 00 00 00       	mov    $0x0,%eax
c0006795:	c9                   	leave  
c0006796:	c3                   	ret    

c0006797 <do_exec>:
c0006797:	55                   	push   %ebp
c0006798:	89 e5                	mov    %esp,%ebp
c000679a:	56                   	push   %esi
c000679b:	53                   	push   %ebx
c000679c:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c00067a2:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c00067a9:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c00067b0:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c00067b6:	83 ec 08             	sub    $0x8,%esp
c00067b9:	6a 00                	push   $0x0
c00067bb:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00067be:	50                   	push   %eax
c00067bf:	e8 a1 f9 ff ff       	call   c0006165 <open>
c00067c4:	83 c4 10             	add    $0x10,%esp
c00067c7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00067ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00067cd:	8b 00                	mov    (%eax),%eax
c00067cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00067d2:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c00067d9:	83 ec 04             	sub    $0x4,%esp
c00067dc:	6a 0c                	push   $0xc
c00067de:	6a 00                	push   $0x0
c00067e0:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00067e6:	50                   	push   %eax
c00067e7:	e8 4b 59 00 00       	call   c000c137 <Memset>
c00067ec:	83 c4 10             	add    $0x10,%esp
c00067ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00067f2:	8b 40 30             	mov    0x30(%eax),%eax
c00067f5:	89 c6                	mov    %eax,%esi
c00067f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00067fa:	8b 40 34             	mov    0x34(%eax),%eax
c00067fd:	83 ec 08             	sub    $0x8,%esp
c0006800:	50                   	push   %eax
c0006801:	ff 75 d8             	pushl  -0x28(%ebp)
c0006804:	e8 fb e7 ff ff       	call   c0005004 <v2l>
c0006809:	83 c4 10             	add    $0x10,%esp
c000680c:	89 c3                	mov    %eax,%ebx
c000680e:	83 ec 08             	sub    $0x8,%esp
c0006811:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006817:	50                   	push   %eax
c0006818:	6a 01                	push   $0x1
c000681a:	e8 e5 e7 ff ff       	call   c0005004 <v2l>
c000681f:	83 c4 10             	add    $0x10,%esp
c0006822:	83 ec 04             	sub    $0x4,%esp
c0006825:	56                   	push   %esi
c0006826:	53                   	push   %ebx
c0006827:	50                   	push   %eax
c0006828:	e8 34 14 00 00       	call   c0007c61 <Memcpy>
c000682d:	83 c4 10             	add    $0x10,%esp
c0006830:	83 ec 08             	sub    $0x8,%esp
c0006833:	6a 00                	push   $0x0
c0006835:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000683b:	50                   	push   %eax
c000683c:	e8 24 f9 ff ff       	call   c0006165 <open>
c0006841:	83 c4 10             	add    $0x10,%esp
c0006844:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006847:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000684e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006851:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0006857:	01 d0                	add    %edx,%eax
c0006859:	83 ec 04             	sub    $0x4,%esp
c000685c:	68 00 02 00 00       	push   $0x200
c0006861:	50                   	push   %eax
c0006862:	ff 75 d0             	pushl  -0x30(%ebp)
c0006865:	e8 80 f9 ff ff       	call   c00061ea <read>
c000686a:	83 c4 10             	add    $0x10,%esp
c000686d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006870:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006873:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006876:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c000687a:	74 02                	je     c000687e <do_exec+0xe7>
c000687c:	eb d0                	jmp    c000684e <do_exec+0xb7>
c000687e:	90                   	nop
c000687f:	83 ec 0c             	sub    $0xc,%esp
c0006882:	ff 75 d0             	pushl  -0x30(%ebp)
c0006885:	e8 48 fa ff ff       	call   c00062d2 <close>
c000688a:	83 c4 10             	add    $0x10,%esp
c000688d:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0006893:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006896:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000689d:	eb 72                	jmp    c0006911 <do_exec+0x17a>
c000689f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00068a2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00068a6:	0f b7 d0             	movzwl %ax,%edx
c00068a9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00068ac:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00068b0:	0f b7 c0             	movzwl %ax,%eax
c00068b3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00068b7:	01 c2                	add    %eax,%edx
c00068b9:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00068bf:	01 d0                	add    %edx,%eax
c00068c1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00068c4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00068c7:	8b 40 10             	mov    0x10(%eax),%eax
c00068ca:	89 c6                	mov    %eax,%esi
c00068cc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00068cf:	8b 40 04             	mov    0x4(%eax),%eax
c00068d2:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00068d8:	01 d0                	add    %edx,%eax
c00068da:	83 ec 08             	sub    $0x8,%esp
c00068dd:	50                   	push   %eax
c00068de:	6a 01                	push   $0x1
c00068e0:	e8 1f e7 ff ff       	call   c0005004 <v2l>
c00068e5:	83 c4 10             	add    $0x10,%esp
c00068e8:	89 c3                	mov    %eax,%ebx
c00068ea:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00068ed:	8b 40 08             	mov    0x8(%eax),%eax
c00068f0:	83 ec 08             	sub    $0x8,%esp
c00068f3:	50                   	push   %eax
c00068f4:	ff 75 d8             	pushl  -0x28(%ebp)
c00068f7:	e8 08 e7 ff ff       	call   c0005004 <v2l>
c00068fc:	83 c4 10             	add    $0x10,%esp
c00068ff:	83 ec 04             	sub    $0x4,%esp
c0006902:	56                   	push   %esi
c0006903:	53                   	push   %ebx
c0006904:	50                   	push   %eax
c0006905:	e8 57 13 00 00       	call   c0007c61 <Memcpy>
c000690a:	83 c4 10             	add    $0x10,%esp
c000690d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006911:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006914:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0006918:	0f b7 c0             	movzwl %ax,%eax
c000691b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000691e:	0f 8c 7b ff ff ff    	jl     c000689f <do_exec+0x108>
c0006924:	8b 45 08             	mov    0x8(%ebp),%eax
c0006927:	8b 40 10             	mov    0x10(%eax),%eax
c000692a:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000692d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006930:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006933:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006936:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c000693d:	83 ec 08             	sub    $0x8,%esp
c0006940:	ff 75 c0             	pushl  -0x40(%ebp)
c0006943:	ff 75 d8             	pushl  -0x28(%ebp)
c0006946:	e8 b9 e6 ff ff       	call   c0005004 <v2l>
c000694b:	83 c4 10             	add    $0x10,%esp
c000694e:	89 c3                	mov    %eax,%ebx
c0006950:	83 ec 08             	sub    $0x8,%esp
c0006953:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006959:	50                   	push   %eax
c000695a:	6a 01                	push   $0x1
c000695c:	e8 a3 e6 ff ff       	call   c0005004 <v2l>
c0006961:	83 c4 10             	add    $0x10,%esp
c0006964:	83 ec 04             	sub    $0x4,%esp
c0006967:	ff 75 bc             	pushl  -0x44(%ebp)
c000696a:	53                   	push   %ebx
c000696b:	50                   	push   %eax
c000696c:	e8 f0 12 00 00       	call   c0007c61 <Memcpy>
c0006971:	83 c4 10             	add    $0x10,%esp
c0006974:	83 ec 08             	sub    $0x8,%esp
c0006977:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c000697d:	50                   	push   %eax
c000697e:	6a 01                	push   $0x1
c0006980:	e8 7f e6 ff ff       	call   c0005004 <v2l>
c0006985:	83 c4 10             	add    $0x10,%esp
c0006988:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000698b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000698e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006991:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006998:	eb 08                	jmp    c00069a2 <do_exec+0x20b>
c000699a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000699e:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00069a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069a5:	8b 00                	mov    (%eax),%eax
c00069a7:	85 c0                	test   %eax,%eax
c00069a9:	75 ef                	jne    c000699a <do_exec+0x203>
c00069ab:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00069ae:	2b 45 c0             	sub    -0x40(%ebp),%eax
c00069b1:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00069b4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00069bb:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00069c1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00069c4:	eb 17                	jmp    c00069dd <do_exec+0x246>
c00069c6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00069ca:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00069cd:	8b 10                	mov    (%eax),%edx
c00069cf:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00069d2:	01 c2                	add    %eax,%edx
c00069d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00069d7:	89 10                	mov    %edx,(%eax)
c00069d9:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00069dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00069e0:	8b 00                	mov    (%eax),%eax
c00069e2:	85 c0                	test   %eax,%eax
c00069e4:	75 e0                	jne    c00069c6 <do_exec+0x22f>
c00069e6:	83 ec 08             	sub    $0x8,%esp
c00069e9:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00069ef:	50                   	push   %eax
c00069f0:	6a 01                	push   $0x1
c00069f2:	e8 0d e6 ff ff       	call   c0005004 <v2l>
c00069f7:	83 c4 10             	add    $0x10,%esp
c00069fa:	89 c3                	mov    %eax,%ebx
c00069fc:	83 ec 08             	sub    $0x8,%esp
c00069ff:	ff 75 b8             	pushl  -0x48(%ebp)
c0006a02:	ff 75 d8             	pushl  -0x28(%ebp)
c0006a05:	e8 fa e5 ff ff       	call   c0005004 <v2l>
c0006a0a:	83 c4 10             	add    $0x10,%esp
c0006a0d:	83 ec 04             	sub    $0x4,%esp
c0006a10:	ff 75 bc             	pushl  -0x44(%ebp)
c0006a13:	53                   	push   %ebx
c0006a14:	50                   	push   %eax
c0006a15:	e8 47 12 00 00       	call   c0007c61 <Memcpy>
c0006a1a:	83 c4 10             	add    $0x10,%esp
c0006a1d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006a20:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006a23:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006a26:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006a29:	69 d2 b4 02 00 00    	imul   $0x2b4,%edx,%edx
c0006a2f:	81 c2 98 34 08 c0    	add    $0xc0083498,%edx
c0006a35:	89 02                	mov    %eax,(%edx)
c0006a37:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006a3a:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006a3d:	69 d2 b4 02 00 00    	imul   $0x2b4,%edx,%edx
c0006a43:	81 c2 94 34 08 c0    	add    $0xc0083494,%edx
c0006a49:	89 02                	mov    %eax,(%edx)
c0006a4b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006a4e:	8b 40 18             	mov    0x18(%eax),%eax
c0006a51:	89 c2                	mov    %eax,%edx
c0006a53:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006a56:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a5c:	05 9c 34 08 c0       	add    $0xc008349c,%eax
c0006a61:	89 10                	mov    %edx,(%eax)
c0006a63:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006a66:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006a69:	69 d2 b4 02 00 00    	imul   $0x2b4,%edx,%edx
c0006a6f:	81 c2 a8 34 08 c0    	add    $0xc00834a8,%edx
c0006a75:	89 02                	mov    %eax,(%edx)
c0006a77:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006a7a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a80:	05 50 34 08 c0       	add    $0xc0083450,%eax
c0006a85:	c7 00 21 00 00 00    	movl   $0x21,(%eax)
c0006a8b:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c0006a92:	00 00 00 
c0006a95:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0006a9c:	00 00 00 
c0006a9f:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c0006aa6:	00 00 00 
c0006aa9:	83 ec 04             	sub    $0x4,%esp
c0006aac:	ff 75 d8             	pushl  -0x28(%ebp)
c0006aaf:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c0006ab5:	50                   	push   %eax
c0006ab6:	6a 01                	push   $0x1
c0006ab8:	e8 f1 39 00 00       	call   c000a4ae <send_rec>
c0006abd:	83 c4 10             	add    $0x10,%esp
c0006ac0:	90                   	nop
c0006ac1:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0006ac4:	5b                   	pop    %ebx
c0006ac5:	5e                   	pop    %esi
c0006ac6:	5d                   	pop    %ebp
c0006ac7:	c3                   	ret    

c0006ac8 <do_fork>:
c0006ac8:	55                   	push   %ebp
c0006ac9:	89 e5                	mov    %esp,%ebp
c0006acb:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006ad1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ad4:	8b 00                	mov    (%eax),%eax
c0006ad6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ad9:	83 ec 0c             	sub    $0xc,%esp
c0006adc:	ff 75 f4             	pushl  -0xc(%ebp)
c0006adf:	e8 2e 42 00 00       	call   c000ad12 <fork_process>
c0006ae4:	83 c4 10             	add    $0x10,%esp
c0006ae7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006aea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006aed:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0006af3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006af6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006af9:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006aff:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b02:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006b05:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006b0c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006b13:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006b1a:	83 ec 04             	sub    $0x4,%esp
c0006b1d:	ff 75 ec             	pushl  -0x14(%ebp)
c0006b20:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006b23:	50                   	push   %eax
c0006b24:	6a 01                	push   $0x1
c0006b26:	e8 83 39 00 00       	call   c000a4ae <send_rec>
c0006b2b:	83 c4 10             	add    $0x10,%esp
c0006b2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b31:	c9                   	leave  
c0006b32:	c3                   	ret    

c0006b33 <do_exit>:
c0006b33:	55                   	push   %ebp
c0006b34:	89 e5                	mov    %esp,%ebp
c0006b36:	83 ec 18             	sub    $0x18,%esp
c0006b39:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b3c:	8b 00                	mov    (%eax),%eax
c0006b3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b44:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b4a:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006b4f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b55:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006b5b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b61:	8b 40 44             	mov    0x44(%eax),%eax
c0006b64:	89 c2                	mov    %eax,%edx
c0006b66:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b69:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006b6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b72:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b78:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b7d:	0f b6 00             	movzbl (%eax),%eax
c0006b80:	3c 04                	cmp    $0x4,%al
c0006b82:	75 21                	jne    c0006ba5 <do_exit+0x72>
c0006b84:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b87:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b8d:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b92:	c6 00 fb             	movb   $0xfb,(%eax)
c0006b95:	83 ec 0c             	sub    $0xc,%esp
c0006b98:	ff 75 ec             	pushl  -0x14(%ebp)
c0006b9b:	e8 59 01 00 00       	call   c0006cf9 <cleanup>
c0006ba0:	83 c4 10             	add    $0x10,%esp
c0006ba3:	eb 0a                	jmp    c0006baf <do_exit+0x7c>
c0006ba5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ba8:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0006baf:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006bb6:	eb 6e                	jmp    c0006c26 <do_exit+0xf3>
c0006bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bbb:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006bc1:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006bc6:	8b 00                	mov    (%eax),%eax
c0006bc8:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006bcb:	75 55                	jne    c0006c22 <do_exit+0xef>
c0006bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bd0:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006bd6:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006bdb:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0006be1:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c0006be8:	3c 04                	cmp    $0x4,%al
c0006bea:	75 36                	jne    c0006c22 <do_exit+0xef>
c0006bec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bef:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006bf5:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006bfa:	0f b6 00             	movzbl (%eax),%eax
c0006bfd:	3c 03                	cmp    $0x3,%al
c0006bff:	75 21                	jne    c0006c22 <do_exit+0xef>
c0006c01:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c0006c08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c0b:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c11:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006c16:	83 ec 0c             	sub    $0xc,%esp
c0006c19:	50                   	push   %eax
c0006c1a:	e8 da 00 00 00       	call   c0006cf9 <cleanup>
c0006c1f:	83 c4 10             	add    $0x10,%esp
c0006c22:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006c26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006c2a:	7e 8c                	jle    c0006bb8 <do_exit+0x85>
c0006c2c:	90                   	nop
c0006c2d:	c9                   	leave  
c0006c2e:	c3                   	ret    

c0006c2f <do_wait>:
c0006c2f:	55                   	push   %ebp
c0006c30:	89 e5                	mov    %esp,%ebp
c0006c32:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006c38:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c3b:	8b 00                	mov    (%eax),%eax
c0006c3d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006c47:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006c4e:	eb 5f                	jmp    c0006caf <do_wait+0x80>
c0006c50:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c53:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c59:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006c5e:	8b 00                	mov    (%eax),%eax
c0006c60:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006c63:	75 46                	jne    c0006cab <do_wait+0x7c>
c0006c65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006c69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c6c:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c72:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006c77:	0f b6 00             	movzbl (%eax),%eax
c0006c7a:	3c 03                	cmp    $0x3,%al
c0006c7c:	75 2d                	jne    c0006cab <do_wait+0x7c>
c0006c7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c81:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c87:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006c8c:	c6 00 fb             	movb   $0xfb,(%eax)
c0006c8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c92:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c98:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006c9d:	83 ec 0c             	sub    $0xc,%esp
c0006ca0:	50                   	push   %eax
c0006ca1:	e8 53 00 00 00       	call   c0006cf9 <cleanup>
c0006ca6:	83 c4 10             	add    $0x10,%esp
c0006ca9:	eb 4c                	jmp    c0006cf7 <do_wait+0xc8>
c0006cab:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006caf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006cb3:	7e 9b                	jle    c0006c50 <do_wait+0x21>
c0006cb5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006cb9:	74 13                	je     c0006cce <do_wait+0x9f>
c0006cbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006cbe:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006cc4:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006cc9:	c6 00 04             	movb   $0x4,(%eax)
c0006ccc:	eb 29                	jmp    c0006cf7 <do_wait+0xc8>
c0006cce:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006cd5:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006cdc:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006ce3:	83 ec 04             	sub    $0x4,%esp
c0006ce6:	ff 75 ec             	pushl  -0x14(%ebp)
c0006ce9:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006cec:	50                   	push   %eax
c0006ced:	6a 01                	push   $0x1
c0006cef:	e8 ba 37 00 00       	call   c000a4ae <send_rec>
c0006cf4:	83 c4 10             	add    $0x10,%esp
c0006cf7:	c9                   	leave  
c0006cf8:	c3                   	ret    

c0006cf9 <cleanup>:
c0006cf9:	55                   	push   %ebp
c0006cfa:	89 e5                	mov    %esp,%ebp
c0006cfc:	83 ec 78             	sub    $0x78,%esp
c0006cff:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006d06:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006d0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d10:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006d16:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006d19:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d1c:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006d22:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006d25:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d28:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006d2e:	83 ec 04             	sub    $0x4,%esp
c0006d31:	50                   	push   %eax
c0006d32:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006d35:	50                   	push   %eax
c0006d36:	6a 01                	push   $0x1
c0006d38:	e8 71 37 00 00       	call   c000a4ae <send_rec>
c0006d3d:	83 c4 10             	add    $0x10,%esp
c0006d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d43:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006d4a:	90                   	nop
c0006d4b:	c9                   	leave  
c0006d4c:	c3                   	ret    

c0006d4d <init_bitmap>:
c0006d4d:	55                   	push   %ebp
c0006d4e:	89 e5                	mov    %esp,%ebp
c0006d50:	83 ec 08             	sub    $0x8,%esp
c0006d53:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d56:	8b 50 04             	mov    0x4(%eax),%edx
c0006d59:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d5c:	8b 00                	mov    (%eax),%eax
c0006d5e:	83 ec 04             	sub    $0x4,%esp
c0006d61:	52                   	push   %edx
c0006d62:	6a 00                	push   $0x0
c0006d64:	50                   	push   %eax
c0006d65:	e8 cd 53 00 00       	call   c000c137 <Memset>
c0006d6a:	83 c4 10             	add    $0x10,%esp
c0006d6d:	90                   	nop
c0006d6e:	c9                   	leave  
c0006d6f:	c3                   	ret    

c0006d70 <test_bit_val>:
c0006d70:	55                   	push   %ebp
c0006d71:	89 e5                	mov    %esp,%ebp
c0006d73:	53                   	push   %ebx
c0006d74:	83 ec 10             	sub    $0x10,%esp
c0006d77:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d7a:	8d 50 07             	lea    0x7(%eax),%edx
c0006d7d:	85 c0                	test   %eax,%eax
c0006d7f:	0f 48 c2             	cmovs  %edx,%eax
c0006d82:	c1 f8 03             	sar    $0x3,%eax
c0006d85:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d88:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d8b:	99                   	cltd   
c0006d8c:	c1 ea 1d             	shr    $0x1d,%edx
c0006d8f:	01 d0                	add    %edx,%eax
c0006d91:	83 e0 07             	and    $0x7,%eax
c0006d94:	29 d0                	sub    %edx,%eax
c0006d96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d99:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d9c:	8b 10                	mov    (%eax),%edx
c0006d9e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006da1:	01 d0                	add    %edx,%eax
c0006da3:	0f b6 00             	movzbl (%eax),%eax
c0006da6:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006da9:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006dad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006db0:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006db5:	89 c1                	mov    %eax,%ecx
c0006db7:	d3 e3                	shl    %cl,%ebx
c0006db9:	89 d8                	mov    %ebx,%eax
c0006dbb:	21 c2                	and    %eax,%edx
c0006dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006dc0:	89 c1                	mov    %eax,%ecx
c0006dc2:	d3 fa                	sar    %cl,%edx
c0006dc4:	89 d0                	mov    %edx,%eax
c0006dc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006dc9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006dcd:	0f 9f c0             	setg   %al
c0006dd0:	0f b6 c0             	movzbl %al,%eax
c0006dd3:	83 c4 10             	add    $0x10,%esp
c0006dd6:	5b                   	pop    %ebx
c0006dd7:	5d                   	pop    %ebp
c0006dd8:	c3                   	ret    

c0006dd9 <set_bit_val>:
c0006dd9:	55                   	push   %ebp
c0006dda:	89 e5                	mov    %esp,%ebp
c0006ddc:	83 ec 10             	sub    $0x10,%esp
c0006ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006de2:	8d 50 07             	lea    0x7(%eax),%edx
c0006de5:	85 c0                	test   %eax,%eax
c0006de7:	0f 48 c2             	cmovs  %edx,%eax
c0006dea:	c1 f8 03             	sar    $0x3,%eax
c0006ded:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006df0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006df3:	99                   	cltd   
c0006df4:	c1 ea 1d             	shr    $0x1d,%edx
c0006df7:	01 d0                	add    %edx,%eax
c0006df9:	83 e0 07             	and    $0x7,%eax
c0006dfc:	29 d0                	sub    %edx,%eax
c0006dfe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e01:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e04:	8b 10                	mov    (%eax),%edx
c0006e06:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e09:	01 d0                	add    %edx,%eax
c0006e0b:	0f b6 00             	movzbl (%eax),%eax
c0006e0e:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006e11:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006e15:	7e 13                	jle    c0006e2a <set_bit_val+0x51>
c0006e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e1a:	ba 01 00 00 00       	mov    $0x1,%edx
c0006e1f:	89 c1                	mov    %eax,%ecx
c0006e21:	d3 e2                	shl    %cl,%edx
c0006e23:	89 d0                	mov    %edx,%eax
c0006e25:	08 45 ff             	or     %al,-0x1(%ebp)
c0006e28:	eb 13                	jmp    c0006e3d <set_bit_val+0x64>
c0006e2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e2d:	ba 01 00 00 00       	mov    $0x1,%edx
c0006e32:	89 c1                	mov    %eax,%ecx
c0006e34:	d3 e2                	shl    %cl,%edx
c0006e36:	89 d0                	mov    %edx,%eax
c0006e38:	f7 d0                	not    %eax
c0006e3a:	20 45 ff             	and    %al,-0x1(%ebp)
c0006e3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e40:	8b 10                	mov    (%eax),%edx
c0006e42:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e45:	01 c2                	add    %eax,%edx
c0006e47:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006e4b:	88 02                	mov    %al,(%edx)
c0006e4d:	b8 01 00 00 00       	mov    $0x1,%eax
c0006e52:	c9                   	leave  
c0006e53:	c3                   	ret    

c0006e54 <set_bits>:
c0006e54:	55                   	push   %ebp
c0006e55:	89 e5                	mov    %esp,%ebp
c0006e57:	83 ec 10             	sub    $0x10,%esp
c0006e5a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006e61:	eb 1c                	jmp    c0006e7f <set_bits+0x2b>
c0006e63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e66:	8d 50 01             	lea    0x1(%eax),%edx
c0006e69:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006e6c:	ff 75 10             	pushl  0x10(%ebp)
c0006e6f:	50                   	push   %eax
c0006e70:	ff 75 08             	pushl  0x8(%ebp)
c0006e73:	e8 61 ff ff ff       	call   c0006dd9 <set_bit_val>
c0006e78:	83 c4 0c             	add    $0xc,%esp
c0006e7b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006e7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e82:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006e85:	7c dc                	jl     c0006e63 <set_bits+0xf>
c0006e87:	b8 01 00 00 00       	mov    $0x1,%eax
c0006e8c:	c9                   	leave  
c0006e8d:	c3                   	ret    

c0006e8e <get_first_free_bit>:
c0006e8e:	55                   	push   %ebp
c0006e8f:	89 e5                	mov    %esp,%ebp
c0006e91:	83 ec 10             	sub    $0x10,%esp
c0006e94:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e97:	8b 40 04             	mov    0x4(%eax),%eax
c0006e9a:	c1 e0 03             	shl    $0x3,%eax
c0006e9d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ea0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ea3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ea6:	eb 1b                	jmp    c0006ec3 <get_first_free_bit+0x35>
c0006ea8:	ff 75 fc             	pushl  -0x4(%ebp)
c0006eab:	ff 75 08             	pushl  0x8(%ebp)
c0006eae:	e8 bd fe ff ff       	call   c0006d70 <test_bit_val>
c0006eb3:	83 c4 08             	add    $0x8,%esp
c0006eb6:	85 c0                	test   %eax,%eax
c0006eb8:	75 05                	jne    c0006ebf <get_first_free_bit+0x31>
c0006eba:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ebd:	eb 11                	jmp    c0006ed0 <get_first_free_bit+0x42>
c0006ebf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006ec3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ec6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006ec9:	7c dd                	jl     c0006ea8 <get_first_free_bit+0x1a>
c0006ecb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006ed0:	c9                   	leave  
c0006ed1:	c3                   	ret    

c0006ed2 <get_bits>:
c0006ed2:	55                   	push   %ebp
c0006ed3:	89 e5                	mov    %esp,%ebp
c0006ed5:	83 ec 20             	sub    $0x20,%esp
c0006ed8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006edf:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ee2:	ff 75 08             	pushl  0x8(%ebp)
c0006ee5:	e8 a4 ff ff ff       	call   c0006e8e <get_first_free_bit>
c0006eea:	83 c4 08             	add    $0x8,%esp
c0006eed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ef0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ef3:	8b 40 04             	mov    0x4(%eax),%eax
c0006ef6:	c1 e0 03             	shl    $0x3,%eax
c0006ef9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006efc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006eff:	83 e8 01             	sub    $0x1,%eax
c0006f02:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f05:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006f09:	75 08                	jne    c0006f13 <get_bits+0x41>
c0006f0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f0e:	e9 85 00 00 00       	jmp    c0006f98 <get_bits+0xc6>
c0006f13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f16:	83 c0 01             	add    $0x1,%eax
c0006f19:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f22:	eb 58                	jmp    c0006f7c <get_bits+0xaa>
c0006f24:	ff 75 f8             	pushl  -0x8(%ebp)
c0006f27:	ff 75 08             	pushl  0x8(%ebp)
c0006f2a:	e8 41 fe ff ff       	call   c0006d70 <test_bit_val>
c0006f2f:	83 c4 08             	add    $0x8,%esp
c0006f32:	85 c0                	test   %eax,%eax
c0006f34:	75 0a                	jne    c0006f40 <get_bits+0x6e>
c0006f36:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006f3a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006f3e:	eb 2b                	jmp    c0006f6b <get_bits+0x99>
c0006f40:	6a 00                	push   $0x0
c0006f42:	ff 75 08             	pushl  0x8(%ebp)
c0006f45:	e8 44 ff ff ff       	call   c0006e8e <get_first_free_bit>
c0006f4a:	83 c4 08             	add    $0x8,%esp
c0006f4d:	83 c0 01             	add    $0x1,%eax
c0006f50:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f53:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f56:	83 c0 01             	add    $0x1,%eax
c0006f59:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f5c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006f65:	83 e8 01             	sub    $0x1,%eax
c0006f68:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f6e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006f71:	7c 09                	jl     c0006f7c <get_bits+0xaa>
c0006f73:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006f7a:	eb 0d                	jmp    c0006f89 <get_bits+0xb7>
c0006f7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f7f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006f82:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006f85:	85 c0                	test   %eax,%eax
c0006f87:	7f 9b                	jg     c0006f24 <get_bits+0x52>
c0006f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f8c:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006f8f:	83 c0 01             	add    $0x1,%eax
c0006f92:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f95:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f98:	c9                   	leave  
c0006f99:	c3                   	ret    

c0006f9a <get_a_page2>:
c0006f9a:	55                   	push   %ebp
c0006f9b:	89 e5                	mov    %esp,%ebp
c0006f9d:	83 ec 18             	sub    $0x18,%esp
c0006fa0:	83 ec 0c             	sub    $0xc,%esp
c0006fa3:	ff 75 0c             	pushl  0xc(%ebp)
c0006fa6:	e8 1e 00 00 00       	call   c0006fc9 <get_a_page>
c0006fab:	83 c4 10             	add    $0x10,%esp
c0006fae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fb1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006fb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fb7:	83 ec 08             	sub    $0x8,%esp
c0006fba:	52                   	push   %edx
c0006fbb:	50                   	push   %eax
c0006fbc:	e8 61 01 00 00       	call   c0007122 <add_map_entry>
c0006fc1:	83 c4 10             	add    $0x10,%esp
c0006fc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fc7:	c9                   	leave  
c0006fc8:	c3                   	ret    

c0006fc9 <get_a_page>:
c0006fc9:	55                   	push   %ebp
c0006fca:	89 e5                	mov    %esp,%ebp
c0006fcc:	83 ec 20             	sub    $0x20,%esp
c0006fcf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006fd3:	75 22                	jne    c0006ff7 <get_a_page+0x2e>
c0006fd5:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006fda:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fdd:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006fe2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006fe5:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006fea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006fed:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006ff2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ff5:	eb 20                	jmp    c0007017 <get_a_page+0x4e>
c0006ff7:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006ffc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fff:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007004:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007007:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c000700c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000700f:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007014:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007017:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000701a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000701d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007020:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0007023:	6a 01                	push   $0x1
c0007025:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0007028:	50                   	push   %eax
c0007029:	e8 a4 fe ff ff       	call   c0006ed2 <get_bits>
c000702e:	83 c4 08             	add    $0x8,%esp
c0007031:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007034:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007037:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000703a:	c1 e2 0c             	shl    $0xc,%edx
c000703d:	01 d0                	add    %edx,%eax
c000703f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007042:	6a 01                	push   $0x1
c0007044:	ff 75 fc             	pushl  -0x4(%ebp)
c0007047:	8d 45 e0             	lea    -0x20(%ebp),%eax
c000704a:	50                   	push   %eax
c000704b:	e8 89 fd ff ff       	call   c0006dd9 <set_bit_val>
c0007050:	83 c4 0c             	add    $0xc,%esp
c0007053:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007056:	c9                   	leave  
c0007057:	c3                   	ret    

c0007058 <get_virtual_address>:
c0007058:	55                   	push   %ebp
c0007059:	89 e5                	mov    %esp,%ebp
c000705b:	83 ec 28             	sub    $0x28,%esp
c000705e:	e8 2d a8 ff ff       	call   c0001890 <get_running_thread_pcb>
c0007063:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007066:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000706a:	75 1a                	jne    c0007086 <get_virtual_address+0x2e>
c000706c:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007071:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007074:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007079:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000707c:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007081:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007084:	eb 18                	jmp    c000709e <get_virtual_address+0x46>
c0007086:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007089:	8b 40 0c             	mov    0xc(%eax),%eax
c000708c:	83 ec 04             	sub    $0x4,%esp
c000708f:	6a 0c                	push   $0xc
c0007091:	50                   	push   %eax
c0007092:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0007095:	50                   	push   %eax
c0007096:	e8 c6 0b 00 00       	call   c0007c61 <Memcpy>
c000709b:	83 c4 10             	add    $0x10,%esp
c000709e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00070a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00070a4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00070a7:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00070aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00070ad:	83 ec 08             	sub    $0x8,%esp
c00070b0:	50                   	push   %eax
c00070b1:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00070b4:	50                   	push   %eax
c00070b5:	e8 18 fe ff ff       	call   c0006ed2 <get_bits>
c00070ba:	83 c4 10             	add    $0x10,%esp
c00070bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00070c3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00070c6:	c1 e2 0c             	shl    $0xc,%edx
c00070c9:	01 d0                	add    %edx,%eax
c00070cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00070ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00070d1:	50                   	push   %eax
c00070d2:	6a 01                	push   $0x1
c00070d4:	ff 75 f0             	pushl  -0x10(%ebp)
c00070d7:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00070da:	50                   	push   %eax
c00070db:	e8 74 fd ff ff       	call   c0006e54 <set_bits>
c00070e0:	83 c4 10             	add    $0x10,%esp
c00070e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070e6:	c9                   	leave  
c00070e7:	c3                   	ret    

c00070e8 <ptr_pde>:
c00070e8:	55                   	push   %ebp
c00070e9:	89 e5                	mov    %esp,%ebp
c00070eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00070ee:	c1 e8 16             	shr    $0x16,%eax
c00070f1:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c00070f6:	c1 e0 02             	shl    $0x2,%eax
c00070f9:	5d                   	pop    %ebp
c00070fa:	c3                   	ret    

c00070fb <ptr_pte>:
c00070fb:	55                   	push   %ebp
c00070fc:	89 e5                	mov    %esp,%ebp
c00070fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0007101:	c1 e8 0a             	shr    $0xa,%eax
c0007104:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0007109:	89 c2                	mov    %eax,%edx
c000710b:	8b 45 08             	mov    0x8(%ebp),%eax
c000710e:	c1 e8 0c             	shr    $0xc,%eax
c0007111:	25 ff 03 00 00       	and    $0x3ff,%eax
c0007116:	c1 e0 02             	shl    $0x2,%eax
c0007119:	01 d0                	add    %edx,%eax
c000711b:	2d 00 00 40 00       	sub    $0x400000,%eax
c0007120:	5d                   	pop    %ebp
c0007121:	c3                   	ret    

c0007122 <add_map_entry>:
c0007122:	55                   	push   %ebp
c0007123:	89 e5                	mov    %esp,%ebp
c0007125:	83 ec 18             	sub    $0x18,%esp
c0007128:	ff 75 08             	pushl  0x8(%ebp)
c000712b:	e8 b8 ff ff ff       	call   c00070e8 <ptr_pde>
c0007130:	83 c4 04             	add    $0x4,%esp
c0007133:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007136:	ff 75 08             	pushl  0x8(%ebp)
c0007139:	e8 bd ff ff ff       	call   c00070fb <ptr_pte>
c000713e:	83 c4 04             	add    $0x4,%esp
c0007141:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007144:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007147:	8b 00                	mov    (%eax),%eax
c0007149:	83 e0 01             	and    $0x1,%eax
c000714c:	85 c0                	test   %eax,%eax
c000714e:	74 1b                	je     c000716b <add_map_entry+0x49>
c0007150:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007153:	8b 00                	mov    (%eax),%eax
c0007155:	83 e0 01             	and    $0x1,%eax
c0007158:	85 c0                	test   %eax,%eax
c000715a:	75 51                	jne    c00071ad <add_map_entry+0x8b>
c000715c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000715f:	83 c8 07             	or     $0x7,%eax
c0007162:	89 c2                	mov    %eax,%edx
c0007164:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007167:	89 10                	mov    %edx,(%eax)
c0007169:	eb 42                	jmp    c00071ad <add_map_entry+0x8b>
c000716b:	6a 00                	push   $0x0
c000716d:	e8 57 fe ff ff       	call   c0006fc9 <get_a_page>
c0007172:	83 c4 04             	add    $0x4,%esp
c0007175:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007178:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000717b:	83 c8 07             	or     $0x7,%eax
c000717e:	89 c2                	mov    %eax,%edx
c0007180:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007183:	89 10                	mov    %edx,(%eax)
c0007185:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007188:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000718d:	83 ec 04             	sub    $0x4,%esp
c0007190:	68 00 10 00 00       	push   $0x1000
c0007195:	6a 00                	push   $0x0
c0007197:	50                   	push   %eax
c0007198:	e8 9a 4f 00 00       	call   c000c137 <Memset>
c000719d:	83 c4 10             	add    $0x10,%esp
c00071a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071a3:	83 c8 07             	or     $0x7,%eax
c00071a6:	89 c2                	mov    %eax,%edx
c00071a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00071ab:	89 10                	mov    %edx,(%eax)
c00071ad:	90                   	nop
c00071ae:	c9                   	leave  
c00071af:	c3                   	ret    

c00071b0 <alloc_virtual_memory>:
c00071b0:	55                   	push   %ebp
c00071b1:	89 e5                	mov    %esp,%ebp
c00071b3:	83 ec 28             	sub    $0x28,%esp
c00071b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00071b9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00071be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00071c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00071c4:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00071c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00071ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071cd:	01 45 e4             	add    %eax,-0x1c(%ebp)
c00071d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00071d3:	05 ff 0f 00 00       	add    $0xfff,%eax
c00071d8:	c1 e8 0c             	shr    $0xc,%eax
c00071db:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00071de:	e8 ad a6 ff ff       	call   c0001890 <get_running_thread_pcb>
c00071e3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00071e6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071e9:	8b 40 08             	mov    0x8(%eax),%eax
c00071ec:	85 c0                	test   %eax,%eax
c00071ee:	75 09                	jne    c00071f9 <alloc_virtual_memory+0x49>
c00071f0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00071f7:	eb 07                	jmp    c0007200 <alloc_virtual_memory+0x50>
c00071f9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007200:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007207:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000720e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007215:	eb 47                	jmp    c000725e <alloc_virtual_memory+0xae>
c0007217:	83 ec 08             	sub    $0x8,%esp
c000721a:	ff 75 f0             	pushl  -0x10(%ebp)
c000721d:	6a 01                	push   $0x1
c000721f:	e8 34 fe ff ff       	call   c0007058 <get_virtual_address>
c0007224:	83 c4 10             	add    $0x10,%esp
c0007227:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000722a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000722e:	74 13                	je     c0007243 <alloc_virtual_memory+0x93>
c0007230:	83 ec 0c             	sub    $0xc,%esp
c0007233:	ff 75 f0             	pushl  -0x10(%ebp)
c0007236:	e8 8e fd ff ff       	call   c0006fc9 <get_a_page>
c000723b:	83 c4 10             	add    $0x10,%esp
c000723e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007241:	eb 06                	jmp    c0007249 <alloc_virtual_memory+0x99>
c0007243:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007246:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007249:	83 ec 08             	sub    $0x8,%esp
c000724c:	ff 75 f4             	pushl  -0xc(%ebp)
c000724f:	ff 75 d8             	pushl  -0x28(%ebp)
c0007252:	e8 cb fe ff ff       	call   c0007122 <add_map_entry>
c0007257:	83 c4 10             	add    $0x10,%esp
c000725a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000725e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007261:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0007264:	72 b1                	jb     c0007217 <alloc_virtual_memory+0x67>
c0007266:	8b 45 08             	mov    0x8(%ebp),%eax
c0007269:	25 ff 0f 00 00       	and    $0xfff,%eax
c000726e:	89 c2                	mov    %eax,%edx
c0007270:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007273:	01 d0                	add    %edx,%eax
c0007275:	c9                   	leave  
c0007276:	c3                   	ret    

c0007277 <get_physical_address>:
c0007277:	55                   	push   %ebp
c0007278:	89 e5                	mov    %esp,%ebp
c000727a:	83 ec 10             	sub    $0x10,%esp
c000727d:	ff 75 08             	pushl  0x8(%ebp)
c0007280:	e8 76 fe ff ff       	call   c00070fb <ptr_pte>
c0007285:	83 c4 04             	add    $0x4,%esp
c0007288:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000728b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000728e:	8b 00                	mov    (%eax),%eax
c0007290:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007295:	89 c2                	mov    %eax,%edx
c0007297:	8b 45 08             	mov    0x8(%ebp),%eax
c000729a:	25 ff 0f 00 00       	and    $0xfff,%eax
c000729f:	09 d0                	or     %edx,%eax
c00072a1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00072a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00072a7:	c9                   	leave  
c00072a8:	c3                   	ret    

c00072a9 <alloc_physical_memory>:
c00072a9:	55                   	push   %ebp
c00072aa:	89 e5                	mov    %esp,%ebp
c00072ac:	83 ec 38             	sub    $0x38,%esp
c00072af:	8b 45 08             	mov    0x8(%ebp),%eax
c00072b2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00072b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00072ba:	e8 d1 a5 ff ff       	call   c0001890 <get_running_thread_pcb>
c00072bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00072c2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00072c6:	75 1a                	jne    c00072e2 <alloc_physical_memory+0x39>
c00072c8:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00072cd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00072d0:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00072d5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00072d8:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00072dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00072e0:	eb 18                	jmp    c00072fa <alloc_physical_memory+0x51>
c00072e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072e5:	8b 40 0c             	mov    0xc(%eax),%eax
c00072e8:	83 ec 04             	sub    $0x4,%esp
c00072eb:	6a 0c                	push   $0xc
c00072ed:	50                   	push   %eax
c00072ee:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00072f1:	50                   	push   %eax
c00072f2:	e8 6a 09 00 00       	call   c0007c61 <Memcpy>
c00072f7:	83 c4 10             	add    $0x10,%esp
c00072fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00072fd:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0007300:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007303:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0007306:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007309:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000730c:	29 c2                	sub    %eax,%edx
c000730e:	89 d0                	mov    %edx,%eax
c0007310:	c1 e8 0c             	shr    $0xc,%eax
c0007313:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007316:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007319:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000731c:	c1 e2 0c             	shl    $0xc,%edx
c000731f:	01 d0                	add    %edx,%eax
c0007321:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007324:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007327:	6a 01                	push   $0x1
c0007329:	6a 01                	push   $0x1
c000732b:	50                   	push   %eax
c000732c:	8d 45 d0             	lea    -0x30(%ebp),%eax
c000732f:	50                   	push   %eax
c0007330:	e8 1f fb ff ff       	call   c0006e54 <set_bits>
c0007335:	83 c4 10             	add    $0x10,%esp
c0007338:	83 ec 0c             	sub    $0xc,%esp
c000733b:	ff 75 0c             	pushl  0xc(%ebp)
c000733e:	e8 86 fc ff ff       	call   c0006fc9 <get_a_page>
c0007343:	83 c4 10             	add    $0x10,%esp
c0007346:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007349:	83 ec 08             	sub    $0x8,%esp
c000734c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000734f:	ff 75 08             	pushl  0x8(%ebp)
c0007352:	e8 cb fd ff ff       	call   c0007122 <add_map_entry>
c0007357:	83 c4 10             	add    $0x10,%esp
c000735a:	8b 45 08             	mov    0x8(%ebp),%eax
c000735d:	c9                   	leave  
c000735e:	c3                   	ret    

c000735f <alloc_memory>:
c000735f:	55                   	push   %ebp
c0007360:	89 e5                	mov    %esp,%ebp
c0007362:	83 ec 18             	sub    $0x18,%esp
c0007365:	83 ec 08             	sub    $0x8,%esp
c0007368:	ff 75 0c             	pushl  0xc(%ebp)
c000736b:	ff 75 08             	pushl  0x8(%ebp)
c000736e:	e8 e5 fc ff ff       	call   c0007058 <get_virtual_address>
c0007373:	83 c4 10             	add    $0x10,%esp
c0007376:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007379:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000737c:	2d 00 10 00 00       	sub    $0x1000,%eax
c0007381:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007384:	eb 29                	jmp    c00073af <alloc_memory+0x50>
c0007386:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c000738d:	83 ec 0c             	sub    $0xc,%esp
c0007390:	ff 75 0c             	pushl  0xc(%ebp)
c0007393:	e8 31 fc ff ff       	call   c0006fc9 <get_a_page>
c0007398:	83 c4 10             	add    $0x10,%esp
c000739b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000739e:	83 ec 08             	sub    $0x8,%esp
c00073a1:	ff 75 ec             	pushl  -0x14(%ebp)
c00073a4:	ff 75 f4             	pushl  -0xc(%ebp)
c00073a7:	e8 76 fd ff ff       	call   c0007122 <add_map_entry>
c00073ac:	83 c4 10             	add    $0x10,%esp
c00073af:	8b 45 08             	mov    0x8(%ebp),%eax
c00073b2:	8d 50 ff             	lea    -0x1(%eax),%edx
c00073b5:	89 55 08             	mov    %edx,0x8(%ebp)
c00073b8:	85 c0                	test   %eax,%eax
c00073ba:	75 ca                	jne    c0007386 <alloc_memory+0x27>
c00073bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00073bf:	c9                   	leave  
c00073c0:	c3                   	ret    

c00073c1 <get_a_virtual_page>:
c00073c1:	55                   	push   %ebp
c00073c2:	89 e5                	mov    %esp,%ebp
c00073c4:	83 ec 18             	sub    $0x18,%esp
c00073c7:	ff 75 08             	pushl  0x8(%ebp)
c00073ca:	e8 fa fb ff ff       	call   c0006fc9 <get_a_page>
c00073cf:	83 c4 04             	add    $0x4,%esp
c00073d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00073d5:	83 ec 08             	sub    $0x8,%esp
c00073d8:	ff 75 f4             	pushl  -0xc(%ebp)
c00073db:	ff 75 0c             	pushl  0xc(%ebp)
c00073de:	e8 3f fd ff ff       	call   c0007122 <add_map_entry>
c00073e3:	83 c4 10             	add    $0x10,%esp
c00073e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00073e9:	c9                   	leave  
c00073ea:	c3                   	ret    

c00073eb <block2arena>:
c00073eb:	55                   	push   %ebp
c00073ec:	89 e5                	mov    %esp,%ebp
c00073ee:	83 ec 10             	sub    $0x10,%esp
c00073f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00073f4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00073f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00073fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00073ff:	c9                   	leave  
c0007400:	c3                   	ret    

c0007401 <sys_malloc2>:
c0007401:	55                   	push   %ebp
c0007402:	89 e5                	mov    %esp,%ebp
c0007404:	83 ec 58             	sub    $0x58,%esp
c0007407:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000740e:	e8 7d a4 ff ff       	call   c0001890 <get_running_thread_pcb>
c0007413:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007416:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007419:	8b 40 08             	mov    0x8(%eax),%eax
c000741c:	85 c0                	test   %eax,%eax
c000741e:	75 10                	jne    c0007430 <sys_malloc2+0x2f>
c0007420:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007427:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c000742e:	eb 10                	jmp    c0007440 <sys_malloc2+0x3f>
c0007430:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007437:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000743a:	83 c0 10             	add    $0x10,%eax
c000743d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007440:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0007447:	76 50                	jbe    c0007499 <sys_malloc2+0x98>
c0007449:	8b 45 08             	mov    0x8(%ebp),%eax
c000744c:	05 0b 10 00 00       	add    $0x100b,%eax
c0007451:	c1 e8 0c             	shr    $0xc,%eax
c0007454:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007457:	83 ec 08             	sub    $0x8,%esp
c000745a:	ff 75 f0             	pushl  -0x10(%ebp)
c000745d:	ff 75 d8             	pushl  -0x28(%ebp)
c0007460:	e8 fa fe ff ff       	call   c000735f <alloc_memory>
c0007465:	83 c4 10             	add    $0x10,%esp
c0007468:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000746b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000746e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007471:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007474:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000747a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000747d:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0007484:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007487:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c000748b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000748e:	83 c0 0c             	add    $0xc,%eax
c0007491:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007494:	e9 b2 01 00 00       	jmp    c000764b <sys_malloc2+0x24a>
c0007499:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00074a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00074a7:	eb 26                	jmp    c00074cf <sys_malloc2+0xce>
c00074a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00074ac:	89 d0                	mov    %edx,%eax
c00074ae:	01 c0                	add    %eax,%eax
c00074b0:	01 d0                	add    %edx,%eax
c00074b2:	c1 e0 03             	shl    $0x3,%eax
c00074b5:	89 c2                	mov    %eax,%edx
c00074b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074ba:	01 d0                	add    %edx,%eax
c00074bc:	8b 00                	mov    (%eax),%eax
c00074be:	39 45 08             	cmp    %eax,0x8(%ebp)
c00074c1:	77 08                	ja     c00074cb <sys_malloc2+0xca>
c00074c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00074c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00074c9:	eb 0a                	jmp    c00074d5 <sys_malloc2+0xd4>
c00074cb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00074cf:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00074d3:	7e d4                	jle    c00074a9 <sys_malloc2+0xa8>
c00074d5:	83 ec 08             	sub    $0x8,%esp
c00074d8:	ff 75 f0             	pushl  -0x10(%ebp)
c00074db:	6a 01                	push   $0x1
c00074dd:	e8 7d fe ff ff       	call   c000735f <alloc_memory>
c00074e2:	83 c4 10             	add    $0x10,%esp
c00074e5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00074e8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00074eb:	89 d0                	mov    %edx,%eax
c00074ed:	01 c0                	add    %eax,%eax
c00074ef:	01 d0                	add    %edx,%eax
c00074f1:	c1 e0 03             	shl    $0x3,%eax
c00074f4:	89 c2                	mov    %eax,%edx
c00074f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074f9:	01 d0                	add    %edx,%eax
c00074fb:	83 ec 04             	sub    $0x4,%esp
c00074fe:	6a 18                	push   $0x18
c0007500:	50                   	push   %eax
c0007501:	ff 75 cc             	pushl  -0x34(%ebp)
c0007504:	e8 58 07 00 00       	call   c0007c61 <Memcpy>
c0007509:	83 c4 10             	add    $0x10,%esp
c000750c:	e8 ec 06 00 00       	call   c0007bfd <intr_disable>
c0007511:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007514:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007517:	89 d0                	mov    %edx,%eax
c0007519:	01 c0                	add    %eax,%eax
c000751b:	01 d0                	add    %edx,%eax
c000751d:	c1 e0 03             	shl    $0x3,%eax
c0007520:	89 c2                	mov    %eax,%edx
c0007522:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007525:	01 d0                	add    %edx,%eax
c0007527:	83 c0 08             	add    $0x8,%eax
c000752a:	83 ec 0c             	sub    $0xc,%esp
c000752d:	50                   	push   %eax
c000752e:	e8 40 3a 00 00       	call   c000af73 <isListEmpty>
c0007533:	83 c4 10             	add    $0x10,%esp
c0007536:	3c 01                	cmp    $0x1,%al
c0007538:	0f 85 91 00 00 00    	jne    c00075cf <sys_malloc2+0x1ce>
c000753e:	83 ec 08             	sub    $0x8,%esp
c0007541:	ff 75 f0             	pushl  -0x10(%ebp)
c0007544:	6a 01                	push   $0x1
c0007546:	e8 14 fe ff ff       	call   c000735f <alloc_memory>
c000754b:	83 c4 10             	add    $0x10,%esp
c000754e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007551:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007554:	8b 00                	mov    (%eax),%eax
c0007556:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007559:	c7 45 bc 0c 00 00 00 	movl   $0xc,-0x44(%ebp)
c0007560:	b8 00 10 00 00       	mov    $0x1000,%eax
c0007565:	2b 45 bc             	sub    -0x44(%ebp),%eax
c0007568:	ba 00 00 00 00       	mov    $0x0,%edx
c000756d:	f7 75 c0             	divl   -0x40(%ebp)
c0007570:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007573:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0007576:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007579:	01 d0                	add    %edx,%eax
c000757b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000757e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007585:	eb 3b                	jmp    c00075c2 <sys_malloc2+0x1c1>
c0007587:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000758a:	0f af 45 c0          	imul   -0x40(%ebp),%eax
c000758e:	89 c2                	mov    %eax,%edx
c0007590:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0007593:	01 d0                	add    %edx,%eax
c0007595:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0007598:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c000759b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000759e:	89 d0                	mov    %edx,%eax
c00075a0:	01 c0                	add    %eax,%eax
c00075a2:	01 d0                	add    %edx,%eax
c00075a4:	c1 e0 03             	shl    $0x3,%eax
c00075a7:	89 c2                	mov    %eax,%edx
c00075a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00075ac:	01 d0                	add    %edx,%eax
c00075ae:	83 c0 08             	add    $0x8,%eax
c00075b1:	83 ec 08             	sub    $0x8,%esp
c00075b4:	51                   	push   %ecx
c00075b5:	50                   	push   %eax
c00075b6:	e8 b5 3a 00 00       	call   c000b070 <appendToDoubleLinkList>
c00075bb:	83 c4 10             	add    $0x10,%esp
c00075be:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00075c2:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00075c5:	8d 50 ff             	lea    -0x1(%eax),%edx
c00075c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00075cb:	39 c2                	cmp    %eax,%edx
c00075cd:	77 b8                	ja     c0007587 <sys_malloc2+0x186>
c00075cf:	83 ec 0c             	sub    $0xc,%esp
c00075d2:	ff 75 c8             	pushl  -0x38(%ebp)
c00075d5:	e8 4c 06 00 00       	call   c0007c26 <intr_set_status>
c00075da:	83 c4 10             	add    $0x10,%esp
c00075dd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00075e0:	89 d0                	mov    %edx,%eax
c00075e2:	01 c0                	add    %eax,%eax
c00075e4:	01 d0                	add    %edx,%eax
c00075e6:	c1 e0 03             	shl    $0x3,%eax
c00075e9:	89 c2                	mov    %eax,%edx
c00075eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00075ee:	01 d0                	add    %edx,%eax
c00075f0:	83 c0 08             	add    $0x8,%eax
c00075f3:	83 ec 0c             	sub    $0xc,%esp
c00075f6:	50                   	push   %eax
c00075f7:	e8 de 3b 00 00       	call   c000b1da <popFromDoubleLinkList>
c00075fc:	83 c4 10             	add    $0x10,%esp
c00075ff:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0007602:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0007605:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007608:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c000760c:	75 1c                	jne    c000762a <sys_malloc2+0x229>
c000760e:	68 9b 01 00 00       	push   $0x19b
c0007613:	68 ee b8 00 c0       	push   $0xc000b8ee
c0007618:	68 ee b8 00 c0       	push   $0xc000b8ee
c000761d:	68 f8 b8 00 c0       	push   $0xc000b8f8
c0007622:	e8 5b 25 00 00       	call   c0009b82 <assertion_failure>
c0007627:	83 c4 10             	add    $0x10,%esp
c000762a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000762d:	83 ec 0c             	sub    $0xc,%esp
c0007630:	50                   	push   %eax
c0007631:	e8 b5 fd ff ff       	call   c00073eb <block2arena>
c0007636:	83 c4 10             	add    $0x10,%esp
c0007639:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000763c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000763f:	8b 40 04             	mov    0x4(%eax),%eax
c0007642:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007645:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0007648:	89 50 04             	mov    %edx,0x4(%eax)
c000764b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000764f:	75 1c                	jne    c000766d <sys_malloc2+0x26c>
c0007651:	68 a1 01 00 00       	push   $0x1a1
c0007656:	68 ee b8 00 c0       	push   $0xc000b8ee
c000765b:	68 ee b8 00 c0       	push   $0xc000b8ee
c0007660:	68 0a b9 00 c0       	push   $0xc000b90a
c0007665:	e8 18 25 00 00       	call   c0009b82 <assertion_failure>
c000766a:	83 c4 10             	add    $0x10,%esp
c000766d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007670:	c9                   	leave  
c0007671:	c3                   	ret    

c0007672 <remove_map_entry>:
c0007672:	55                   	push   %ebp
c0007673:	89 e5                	mov    %esp,%ebp
c0007675:	83 ec 10             	sub    $0x10,%esp
c0007678:	ff 75 08             	pushl  0x8(%ebp)
c000767b:	e8 7b fa ff ff       	call   c00070fb <ptr_pte>
c0007680:	83 c4 04             	add    $0x4,%esp
c0007683:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007686:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007689:	8b 10                	mov    (%eax),%edx
c000768b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000768e:	89 10                	mov    %edx,(%eax)
c0007690:	90                   	nop
c0007691:	c9                   	leave  
c0007692:	c3                   	ret    

c0007693 <free_a_page>:
c0007693:	55                   	push   %ebp
c0007694:	89 e5                	mov    %esp,%ebp
c0007696:	83 ec 20             	sub    $0x20,%esp
c0007699:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000769d:	75 21                	jne    c00076c0 <free_a_page+0x2d>
c000769f:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00076a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00076a7:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00076ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00076af:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00076b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00076b7:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c00076be:	eb 1f                	jmp    c00076df <free_a_page+0x4c>
c00076c0:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00076c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00076c8:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00076cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00076d0:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00076d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00076d8:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c00076df:	8b 45 08             	mov    0x8(%ebp),%eax
c00076e2:	c1 e8 0c             	shr    $0xc,%eax
c00076e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00076e8:	6a 00                	push   $0x0
c00076ea:	ff 75 f8             	pushl  -0x8(%ebp)
c00076ed:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c00076f0:	50                   	push   %eax
c00076f1:	e8 e3 f6 ff ff       	call   c0006dd9 <set_bit_val>
c00076f6:	83 c4 0c             	add    $0xc,%esp
c00076f9:	ff 75 08             	pushl  0x8(%ebp)
c00076fc:	e8 76 fb ff ff       	call   c0007277 <get_physical_address>
c0007701:	83 c4 04             	add    $0x4,%esp
c0007704:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007707:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000770a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007710:	85 c0                	test   %eax,%eax
c0007712:	0f 48 c2             	cmovs  %edx,%eax
c0007715:	c1 f8 0c             	sar    $0xc,%eax
c0007718:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000771b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000771e:	6a 00                	push   $0x0
c0007720:	ff 75 f0             	pushl  -0x10(%ebp)
c0007723:	50                   	push   %eax
c0007724:	e8 b0 f6 ff ff       	call   c0006dd9 <set_bit_val>
c0007729:	83 c4 0c             	add    $0xc,%esp
c000772c:	ff 75 08             	pushl  0x8(%ebp)
c000772f:	e8 3e ff ff ff       	call   c0007672 <remove_map_entry>
c0007734:	83 c4 04             	add    $0x4,%esp
c0007737:	90                   	nop
c0007738:	c9                   	leave  
c0007739:	c3                   	ret    

c000773a <sys_free>:
c000773a:	55                   	push   %ebp
c000773b:	89 e5                	mov    %esp,%ebp
c000773d:	83 ec 20             	sub    $0x20,%esp
c0007740:	90                   	nop
c0007741:	c9                   	leave  
c0007742:	c3                   	ret    

c0007743 <init_memory_block_desc>:
c0007743:	55                   	push   %ebp
c0007744:	89 e5                	mov    %esp,%ebp
c0007746:	83 ec 18             	sub    $0x18,%esp
c0007749:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007750:	e9 b2 00 00 00       	jmp    c0007807 <init_memory_block_desc+0xc4>
c0007755:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007759:	75 1b                	jne    c0007776 <init_memory_block_desc+0x33>
c000775b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000775e:	89 d0                	mov    %edx,%eax
c0007760:	01 c0                	add    %eax,%eax
c0007762:	01 d0                	add    %edx,%eax
c0007764:	c1 e0 03             	shl    $0x3,%eax
c0007767:	89 c2                	mov    %eax,%edx
c0007769:	8b 45 08             	mov    0x8(%ebp),%eax
c000776c:	01 d0                	add    %edx,%eax
c000776e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007774:	eb 2e                	jmp    c00077a4 <init_memory_block_desc+0x61>
c0007776:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007779:	89 d0                	mov    %edx,%eax
c000777b:	01 c0                	add    %eax,%eax
c000777d:	01 d0                	add    %edx,%eax
c000777f:	c1 e0 03             	shl    $0x3,%eax
c0007782:	8d 50 e8             	lea    -0x18(%eax),%edx
c0007785:	8b 45 08             	mov    0x8(%ebp),%eax
c0007788:	01 d0                	add    %edx,%eax
c000778a:	8b 08                	mov    (%eax),%ecx
c000778c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000778f:	89 d0                	mov    %edx,%eax
c0007791:	01 c0                	add    %eax,%eax
c0007793:	01 d0                	add    %edx,%eax
c0007795:	c1 e0 03             	shl    $0x3,%eax
c0007798:	89 c2                	mov    %eax,%edx
c000779a:	8b 45 08             	mov    0x8(%ebp),%eax
c000779d:	01 d0                	add    %edx,%eax
c000779f:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c00077a2:	89 10                	mov    %edx,(%eax)
c00077a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077a7:	89 d0                	mov    %edx,%eax
c00077a9:	01 c0                	add    %eax,%eax
c00077ab:	01 d0                	add    %edx,%eax
c00077ad:	c1 e0 03             	shl    $0x3,%eax
c00077b0:	89 c2                	mov    %eax,%edx
c00077b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00077b5:	01 d0                	add    %edx,%eax
c00077b7:	8b 00                	mov    (%eax),%eax
c00077b9:	89 c1                	mov    %eax,%ecx
c00077bb:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00077c0:	ba 00 00 00 00       	mov    $0x0,%edx
c00077c5:	f7 f1                	div    %ecx
c00077c7:	89 c1                	mov    %eax,%ecx
c00077c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077cc:	89 d0                	mov    %edx,%eax
c00077ce:	01 c0                	add    %eax,%eax
c00077d0:	01 d0                	add    %edx,%eax
c00077d2:	c1 e0 03             	shl    $0x3,%eax
c00077d5:	89 c2                	mov    %eax,%edx
c00077d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00077da:	01 d0                	add    %edx,%eax
c00077dc:	89 ca                	mov    %ecx,%edx
c00077de:	89 50 04             	mov    %edx,0x4(%eax)
c00077e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077e4:	89 d0                	mov    %edx,%eax
c00077e6:	01 c0                	add    %eax,%eax
c00077e8:	01 d0                	add    %edx,%eax
c00077ea:	c1 e0 03             	shl    $0x3,%eax
c00077ed:	89 c2                	mov    %eax,%edx
c00077ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00077f2:	01 d0                	add    %edx,%eax
c00077f4:	83 c0 08             	add    $0x8,%eax
c00077f7:	83 ec 0c             	sub    $0xc,%esp
c00077fa:	50                   	push   %eax
c00077fb:	e8 45 37 00 00       	call   c000af45 <initDoubleLinkList>
c0007800:	83 c4 10             	add    $0x10,%esp
c0007803:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007807:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000780b:	0f 8e 44 ff ff ff    	jle    c0007755 <init_memory_block_desc+0x12>
c0007811:	90                   	nop
c0007812:	c9                   	leave  
c0007813:	c3                   	ret    

c0007814 <init_memory2>:
c0007814:	55                   	push   %ebp
c0007815:	89 e5                	mov    %esp,%ebp
c0007817:	83 ec 38             	sub    $0x38,%esp
c000781a:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007821:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0007828:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000782b:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007830:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007833:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007838:	29 c2                	sub    %eax,%edx
c000783a:	89 d0                	mov    %edx,%eax
c000783c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000783f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007842:	89 c2                	mov    %eax,%edx
c0007844:	c1 ea 1f             	shr    $0x1f,%edx
c0007847:	01 d0                	add    %edx,%eax
c0007849:	d1 f8                	sar    %eax
c000784b:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c0007850:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007855:	83 ec 0c             	sub    $0xc,%esp
c0007858:	50                   	push   %eax
c0007859:	e8 1d 07 00 00       	call   c0007f7b <disp_int>
c000785e:	83 c4 10             	add    $0x10,%esp
c0007861:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007866:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007869:	29 c2                	sub    %eax,%edx
c000786b:	89 d0                	mov    %edx,%eax
c000786d:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007872:	83 ec 0c             	sub    $0xc,%esp
c0007875:	68 16 b9 00 c0       	push   $0xc000b916
c000787a:	e8 0d 9d ff ff       	call   c000158c <disp_str>
c000787f:	83 c4 10             	add    $0x10,%esp
c0007882:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007887:	83 ec 0c             	sub    $0xc,%esp
c000788a:	50                   	push   %eax
c000788b:	e8 eb 06 00 00       	call   c0007f7b <disp_int>
c0007890:	83 c4 10             	add    $0x10,%esp
c0007893:	83 ec 0c             	sub    $0xc,%esp
c0007896:	68 16 b9 00 c0       	push   $0xc000b916
c000789b:	e8 ec 9c ff ff       	call   c000158c <disp_str>
c00078a0:	83 c4 10             	add    $0x10,%esp
c00078a3:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00078a8:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078ad:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078b3:	85 c0                	test   %eax,%eax
c00078b5:	0f 48 c2             	cmovs  %edx,%eax
c00078b8:	c1 f8 0c             	sar    $0xc,%eax
c00078bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078c1:	83 c0 07             	add    $0x7,%eax
c00078c4:	8d 50 07             	lea    0x7(%eax),%edx
c00078c7:	85 c0                	test   %eax,%eax
c00078c9:	0f 48 c2             	cmovs  %edx,%eax
c00078cc:	c1 f8 03             	sar    $0x3,%eax
c00078cf:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00078d4:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00078d9:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00078de:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c00078e3:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00078e9:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00078ee:	83 ec 04             	sub    $0x4,%esp
c00078f1:	52                   	push   %edx
c00078f2:	6a 00                	push   $0x0
c00078f4:	50                   	push   %eax
c00078f5:	e8 3d 48 00 00       	call   c000c137 <Memset>
c00078fa:	83 c4 10             	add    $0x10,%esp
c00078fd:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0007902:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007907:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000790d:	85 c0                	test   %eax,%eax
c000790f:	0f 48 c2             	cmovs  %edx,%eax
c0007912:	c1 f8 0c             	sar    $0xc,%eax
c0007915:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007918:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000791b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000791e:	ff 75 e8             	pushl  -0x18(%ebp)
c0007921:	6a 01                	push   $0x1
c0007923:	6a 00                	push   $0x0
c0007925:	68 ac 16 01 c0       	push   $0xc00116ac
c000792a:	e8 25 f5 ff ff       	call   c0006e54 <set_bits>
c000792f:	83 c4 10             	add    $0x10,%esp
c0007932:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007937:	05 ff 0f 00 00       	add    $0xfff,%eax
c000793c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007942:	85 c0                	test   %eax,%eax
c0007944:	0f 48 c2             	cmovs  %edx,%eax
c0007947:	c1 f8 0c             	sar    $0xc,%eax
c000794a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000794d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007950:	83 c0 07             	add    $0x7,%eax
c0007953:	8d 50 07             	lea    0x7(%eax),%edx
c0007956:	85 c0                	test   %eax,%eax
c0007958:	0f 48 c2             	cmovs  %edx,%eax
c000795b:	c1 f8 03             	sar    $0x3,%eax
c000795e:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007963:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007968:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c000796e:	01 d0                	add    %edx,%eax
c0007970:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007975:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c000797b:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007980:	83 ec 04             	sub    $0x4,%esp
c0007983:	52                   	push   %edx
c0007984:	6a 00                	push   $0x0
c0007986:	50                   	push   %eax
c0007987:	e8 ab 47 00 00       	call   c000c137 <Memset>
c000798c:	83 c4 10             	add    $0x10,%esp
c000798f:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007994:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007999:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000799f:	85 c0                	test   %eax,%eax
c00079a1:	0f 48 c2             	cmovs  %edx,%eax
c00079a4:	c1 f8 0c             	sar    $0xc,%eax
c00079a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00079aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00079ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00079b0:	ff 75 e8             	pushl  -0x18(%ebp)
c00079b3:	6a 01                	push   $0x1
c00079b5:	ff 75 e0             	pushl  -0x20(%ebp)
c00079b8:	68 ac 16 01 c0       	push   $0xc00116ac
c00079bd:	e8 92 f4 ff ff       	call   c0006e54 <set_bits>
c00079c2:	83 c4 10             	add    $0x10,%esp
c00079c5:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00079cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00079cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00079d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00079d5:	83 c0 07             	add    $0x7,%eax
c00079d8:	8d 50 07             	lea    0x7(%eax),%edx
c00079db:	85 c0                	test   %eax,%eax
c00079dd:	0f 48 c2             	cmovs  %edx,%eax
c00079e0:	c1 f8 03             	sar    $0x3,%eax
c00079e3:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c00079e8:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00079ed:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00079f3:	01 c2                	add    %eax,%edx
c00079f5:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00079fa:	01 d0                	add    %edx,%eax
c00079fc:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007a01:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c0007a07:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007a0c:	83 ec 04             	sub    $0x4,%esp
c0007a0f:	52                   	push   %edx
c0007a10:	6a 00                	push   $0x0
c0007a12:	50                   	push   %eax
c0007a13:	e8 1f 47 00 00       	call   c000c137 <Memset>
c0007a18:	83 c4 10             	add    $0x10,%esp
c0007a1b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007a1e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a21:	01 d0                	add    %edx,%eax
c0007a23:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007a26:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007a2b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007a30:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007a36:	85 c0                	test   %eax,%eax
c0007a38:	0f 48 c2             	cmovs  %edx,%eax
c0007a3b:	c1 f8 0c             	sar    $0xc,%eax
c0007a3e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007a41:	ff 75 e8             	pushl  -0x18(%ebp)
c0007a44:	6a 01                	push   $0x1
c0007a46:	ff 75 e0             	pushl  -0x20(%ebp)
c0007a49:	68 ac 16 01 c0       	push   $0xc00116ac
c0007a4e:	e8 01 f4 ff ff       	call   c0006e54 <set_bits>
c0007a53:	83 c4 10             	add    $0x10,%esp
c0007a56:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007a59:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a5c:	01 d0                	add    %edx,%eax
c0007a5e:	c1 e0 0c             	shl    $0xc,%eax
c0007a61:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007a66:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a69:	83 c0 02             	add    $0x2,%eax
c0007a6c:	c1 e0 0c             	shl    $0xc,%eax
c0007a6f:	89 c2                	mov    %eax,%edx
c0007a71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007a74:	01 d0                	add    %edx,%eax
c0007a76:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007a7b:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007a82:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a85:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007a88:	90                   	nop
c0007a89:	c9                   	leave  
c0007a8a:	c3                   	ret    

c0007a8b <init_memory>:
c0007a8b:	55                   	push   %ebp
c0007a8c:	89 e5                	mov    %esp,%ebp
c0007a8e:	83 ec 38             	sub    $0x38,%esp
c0007a91:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007a98:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007a9f:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007aa6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007aa9:	05 00 00 10 00       	add    $0x100000,%eax
c0007aae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007ab1:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ab4:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0007ab7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007abd:	85 c0                	test   %eax,%eax
c0007abf:	0f 48 c2             	cmovs  %edx,%eax
c0007ac2:	c1 f8 0c             	sar    $0xc,%eax
c0007ac5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007ac8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007acb:	89 c2                	mov    %eax,%edx
c0007acd:	c1 ea 1f             	shr    $0x1f,%edx
c0007ad0:	01 d0                	add    %edx,%eax
c0007ad2:	d1 f8                	sar    %eax
c0007ad4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007ad7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007ada:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007add:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007ae0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007ae3:	8d 50 07             	lea    0x7(%eax),%edx
c0007ae6:	85 c0                	test   %eax,%eax
c0007ae8:	0f 48 c2             	cmovs  %edx,%eax
c0007aeb:	c1 f8 03             	sar    $0x3,%eax
c0007aee:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007af1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007af4:	8d 50 07             	lea    0x7(%eax),%edx
c0007af7:	85 c0                	test   %eax,%eax
c0007af9:	0f 48 c2             	cmovs  %edx,%eax
c0007afc:	c1 f8 03             	sar    $0x3,%eax
c0007aff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007b02:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007b05:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007b0a:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007b0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007b12:	c1 e2 0c             	shl    $0xc,%edx
c0007b15:	01 d0                	add    %edx,%eax
c0007b17:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b1f:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007b24:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b27:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007b2c:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007b31:	83 ec 04             	sub    $0x4,%esp
c0007b34:	ff 75 d8             	pushl  -0x28(%ebp)
c0007b37:	6a 00                	push   $0x0
c0007b39:	50                   	push   %eax
c0007b3a:	e8 f8 45 00 00       	call   c000c137 <Memset>
c0007b3f:	83 c4 10             	add    $0x10,%esp
c0007b42:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007b45:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b48:	01 d0                	add    %edx,%eax
c0007b4a:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007b4f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007b52:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007b57:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007b5c:	83 ec 04             	sub    $0x4,%esp
c0007b5f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007b62:	6a 00                	push   $0x0
c0007b64:	50                   	push   %eax
c0007b65:	e8 cd 45 00 00       	call   c000c137 <Memset>
c0007b6a:	83 c4 10             	add    $0x10,%esp
c0007b6d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b70:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007b75:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b7b:	01 c2                	add    %eax,%edx
c0007b7d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007b80:	01 d0                	add    %edx,%eax
c0007b82:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007b87:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b8a:	05 00 00 10 00       	add    $0x100000,%eax
c0007b8f:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007b94:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007b99:	83 ec 04             	sub    $0x4,%esp
c0007b9c:	ff 75 d8             	pushl  -0x28(%ebp)
c0007b9f:	6a 00                	push   $0x0
c0007ba1:	50                   	push   %eax
c0007ba2:	e8 90 45 00 00       	call   c000c137 <Memset>
c0007ba7:	83 c4 10             	add    $0x10,%esp
c0007baa:	83 ec 04             	sub    $0x4,%esp
c0007bad:	68 f0 00 00 00       	push   $0xf0
c0007bb2:	6a 00                	push   $0x0
c0007bb4:	68 a0 47 08 c0       	push   $0xc00847a0
c0007bb9:	e8 79 45 00 00       	call   c000c137 <Memset>
c0007bbe:	83 c4 10             	add    $0x10,%esp
c0007bc1:	83 ec 0c             	sub    $0xc,%esp
c0007bc4:	68 a0 47 08 c0       	push   $0xc00847a0
c0007bc9:	e8 75 fb ff ff       	call   c0007743 <init_memory_block_desc>
c0007bce:	83 c4 10             	add    $0x10,%esp
c0007bd1:	90                   	nop
c0007bd2:	c9                   	leave  
c0007bd3:	c3                   	ret    

c0007bd4 <intr_enable>:
c0007bd4:	55                   	push   %ebp
c0007bd5:	89 e5                	mov    %esp,%ebp
c0007bd7:	83 ec 18             	sub    $0x18,%esp
c0007bda:	e8 65 00 00 00       	call   c0007c44 <intr_get_status>
c0007bdf:	83 f8 01             	cmp    $0x1,%eax
c0007be2:	75 0c                	jne    c0007bf0 <intr_enable+0x1c>
c0007be4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007beb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007bee:	eb 0b                	jmp    c0007bfb <intr_enable+0x27>
c0007bf0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007bf7:	fb                   	sti    
c0007bf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007bfb:	c9                   	leave  
c0007bfc:	c3                   	ret    

c0007bfd <intr_disable>:
c0007bfd:	55                   	push   %ebp
c0007bfe:	89 e5                	mov    %esp,%ebp
c0007c00:	83 ec 18             	sub    $0x18,%esp
c0007c03:	e8 3c 00 00 00       	call   c0007c44 <intr_get_status>
c0007c08:	83 f8 01             	cmp    $0x1,%eax
c0007c0b:	75 0d                	jne    c0007c1a <intr_disable+0x1d>
c0007c0d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007c14:	fa                   	cli    
c0007c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c18:	eb 0a                	jmp    c0007c24 <intr_disable+0x27>
c0007c1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c24:	c9                   	leave  
c0007c25:	c3                   	ret    

c0007c26 <intr_set_status>:
c0007c26:	55                   	push   %ebp
c0007c27:	89 e5                	mov    %esp,%ebp
c0007c29:	83 ec 08             	sub    $0x8,%esp
c0007c2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c2f:	83 e0 01             	and    $0x1,%eax
c0007c32:	85 c0                	test   %eax,%eax
c0007c34:	74 07                	je     c0007c3d <intr_set_status+0x17>
c0007c36:	e8 99 ff ff ff       	call   c0007bd4 <intr_enable>
c0007c3b:	eb 05                	jmp    c0007c42 <intr_set_status+0x1c>
c0007c3d:	e8 bb ff ff ff       	call   c0007bfd <intr_disable>
c0007c42:	c9                   	leave  
c0007c43:	c3                   	ret    

c0007c44 <intr_get_status>:
c0007c44:	55                   	push   %ebp
c0007c45:	89 e5                	mov    %esp,%ebp
c0007c47:	83 ec 10             	sub    $0x10,%esp
c0007c4a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007c51:	9c                   	pushf  
c0007c52:	58                   	pop    %eax
c0007c53:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007c56:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007c59:	c1 e8 09             	shr    $0x9,%eax
c0007c5c:	83 e0 01             	and    $0x1,%eax
c0007c5f:	c9                   	leave  
c0007c60:	c3                   	ret    

c0007c61 <Memcpy>:
c0007c61:	55                   	push   %ebp
c0007c62:	89 e5                	mov    %esp,%ebp
c0007c64:	83 ec 18             	sub    $0x18,%esp
c0007c67:	e8 91 ff ff ff       	call   c0007bfd <intr_disable>
c0007c6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007c6f:	83 ec 04             	sub    $0x4,%esp
c0007c72:	ff 75 10             	pushl  0x10(%ebp)
c0007c75:	ff 75 0c             	pushl  0xc(%ebp)
c0007c78:	ff 75 08             	pushl  0x8(%ebp)
c0007c7b:	e8 89 44 00 00       	call   c000c109 <Memcpy2>
c0007c80:	83 c4 10             	add    $0x10,%esp
c0007c83:	83 ec 0c             	sub    $0xc,%esp
c0007c86:	ff 75 f4             	pushl  -0xc(%ebp)
c0007c89:	e8 98 ff ff ff       	call   c0007c26 <intr_set_status>
c0007c8e:	83 c4 10             	add    $0x10,%esp
c0007c91:	90                   	nop
c0007c92:	c9                   	leave  
c0007c93:	c3                   	ret    

c0007c94 <untar>:
c0007c94:	55                   	push   %ebp
c0007c95:	89 e5                	mov    %esp,%ebp
c0007c97:	81 ec 58 08 00 00    	sub    $0x858,%esp
c0007c9d:	83 ec 08             	sub    $0x8,%esp
c0007ca0:	6a 00                	push   $0x0
c0007ca2:	ff 75 08             	pushl  0x8(%ebp)
c0007ca5:	e8 bb e4 ff ff       	call   c0006165 <open>
c0007caa:	83 c4 10             	add    $0x10,%esp
c0007cad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007cb0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0007cb7:	c7 45 d8 00 08 00 00 	movl   $0x800,-0x28(%ebp)
c0007cbe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007cc5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0007ccc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007cd3:	e9 dc 01 00 00       	jmp    c0007eb4 <untar+0x220>
c0007cd8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007cdc:	7e 58                	jle    c0007d36 <untar+0xa2>
c0007cde:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ce1:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007ce6:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007cec:	85 c0                	test   %eax,%eax
c0007cee:	0f 48 c2             	cmovs  %edx,%eax
c0007cf1:	c1 f8 09             	sar    $0x9,%eax
c0007cf4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007cf7:	83 ec 04             	sub    $0x4,%esp
c0007cfa:	68 00 08 00 00       	push   $0x800
c0007cff:	6a 00                	push   $0x0
c0007d01:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007d07:	50                   	push   %eax
c0007d08:	e8 2a 44 00 00       	call   c000c137 <Memset>
c0007d0d:	83 c4 10             	add    $0x10,%esp
c0007d10:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007d13:	c1 e0 09             	shl    $0x9,%eax
c0007d16:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007d19:	83 ec 04             	sub    $0x4,%esp
c0007d1c:	50                   	push   %eax
c0007d1d:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007d23:	50                   	push   %eax
c0007d24:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d27:	e8 be e4 ff ff       	call   c00061ea <read>
c0007d2c:	83 c4 10             	add    $0x10,%esp
c0007d2f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007d36:	83 ec 04             	sub    $0x4,%esp
c0007d39:	68 00 08 00 00       	push   $0x800
c0007d3e:	6a 00                	push   $0x0
c0007d40:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007d46:	50                   	push   %eax
c0007d47:	e8 eb 43 00 00       	call   c000c137 <Memset>
c0007d4c:	83 c4 10             	add    $0x10,%esp
c0007d4f:	83 ec 04             	sub    $0x4,%esp
c0007d52:	68 00 02 00 00       	push   $0x200
c0007d57:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007d5d:	50                   	push   %eax
c0007d5e:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d61:	e8 84 e4 ff ff       	call   c00061ea <read>
c0007d66:	83 c4 10             	add    $0x10,%esp
c0007d69:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007d6c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
c0007d70:	0f 84 4a 01 00 00    	je     c0007ec0 <untar+0x22c>
c0007d76:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007d79:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007d7c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0007d83:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007d89:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007d8c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007d8f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007d92:	83 ec 08             	sub    $0x8,%esp
c0007d95:	6a 07                	push   $0x7
c0007d97:	ff 75 c8             	pushl  -0x38(%ebp)
c0007d9a:	e8 c6 e3 ff ff       	call   c0006165 <open>
c0007d9f:	83 c4 10             	add    $0x10,%esp
c0007da2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007da5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007dac:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007daf:	83 c0 7c             	add    $0x7c,%eax
c0007db2:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007db5:	83 ec 0c             	sub    $0xc,%esp
c0007db8:	ff 75 c8             	pushl  -0x38(%ebp)
c0007dbb:	e8 b0 43 00 00       	call   c000c170 <Strlen>
c0007dc0:	83 c4 10             	add    $0x10,%esp
c0007dc3:	85 c0                	test   %eax,%eax
c0007dc5:	75 16                	jne    c0007ddd <untar+0x149>
c0007dc7:	83 ec 0c             	sub    $0xc,%esp
c0007dca:	ff 75 c0             	pushl  -0x40(%ebp)
c0007dcd:	e8 9e 43 00 00       	call   c000c170 <Strlen>
c0007dd2:	83 c4 10             	add    $0x10,%esp
c0007dd5:	85 c0                	test   %eax,%eax
c0007dd7:	0f 84 e6 00 00 00    	je     c0007ec3 <untar+0x22f>
c0007ddd:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007de0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007de3:	eb 1f                	jmp    c0007e04 <untar+0x170>
c0007de5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007de8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007def:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007df2:	0f b6 00             	movzbl (%eax),%eax
c0007df5:	0f be c0             	movsbl %al,%eax
c0007df8:	83 e8 30             	sub    $0x30,%eax
c0007dfb:	01 d0                	add    %edx,%eax
c0007dfd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007e00:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007e04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007e07:	0f b6 00             	movzbl (%eax),%eax
c0007e0a:	84 c0                	test   %al,%al
c0007e0c:	75 d7                	jne    c0007de5 <untar+0x151>
c0007e0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007e11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007e14:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007e1b:	eb 7b                	jmp    c0007e98 <untar+0x204>
c0007e1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007e20:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007e23:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007e27:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007e2a:	83 ec 04             	sub    $0x4,%esp
c0007e2d:	ff 75 b8             	pushl  -0x48(%ebp)
c0007e30:	6a 00                	push   $0x0
c0007e32:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007e38:	50                   	push   %eax
c0007e39:	e8 f9 42 00 00       	call   c000c137 <Memset>
c0007e3e:	83 c4 10             	add    $0x10,%esp
c0007e41:	83 ec 04             	sub    $0x4,%esp
c0007e44:	ff 75 b8             	pushl  -0x48(%ebp)
c0007e47:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007e4d:	50                   	push   %eax
c0007e4e:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e51:	e8 94 e3 ff ff       	call   c00061ea <read>
c0007e56:	83 c4 10             	add    $0x10,%esp
c0007e59:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007e5c:	83 ec 04             	sub    $0x4,%esp
c0007e5f:	ff 75 b8             	pushl  -0x48(%ebp)
c0007e62:	8d 85 b4 f7 ff ff    	lea    -0x84c(%ebp),%eax
c0007e68:	50                   	push   %eax
c0007e69:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007e6c:	e8 ed e3 ff ff       	call   c000625e <write>
c0007e71:	83 c4 10             	add    $0x10,%esp
c0007e74:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007e77:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0007e7a:	a1 c4 0b 01 c0       	mov    0xc0010bc4,%eax
c0007e7f:	83 c0 01             	add    $0x1,%eax
c0007e82:	a3 c4 0b 01 c0       	mov    %eax,0xc0010bc4
c0007e87:	a1 c4 0b 01 c0       	mov    0xc0010bc4,%eax
c0007e8c:	83 f8 68             	cmp    $0x68,%eax
c0007e8f:	75 07                	jne    c0007e98 <untar+0x204>
c0007e91:	c7 45 b4 05 00 00 00 	movl   $0x5,-0x4c(%ebp)
c0007e98:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0007e9c:	0f 85 7b ff ff ff    	jne    c0007e1d <untar+0x189>
c0007ea2:	83 ec 0c             	sub    $0xc,%esp
c0007ea5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007ea8:	e8 25 e4 ff ff       	call   c00062d2 <close>
c0007ead:	83 c4 10             	add    $0x10,%esp
c0007eb0:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007eb4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007eb8:	0f 8f 1a fe ff ff    	jg     c0007cd8 <untar+0x44>
c0007ebe:	eb 04                	jmp    c0007ec4 <untar+0x230>
c0007ec0:	90                   	nop
c0007ec1:	eb 01                	jmp    c0007ec4 <untar+0x230>
c0007ec3:	90                   	nop
c0007ec4:	83 ec 0c             	sub    $0xc,%esp
c0007ec7:	ff 75 e0             	pushl  -0x20(%ebp)
c0007eca:	e8 03 e4 ff ff       	call   c00062d2 <close>
c0007ecf:	83 c4 10             	add    $0x10,%esp
c0007ed2:	90                   	nop
c0007ed3:	c9                   	leave  
c0007ed4:	c3                   	ret    

c0007ed5 <atoi>:
c0007ed5:	55                   	push   %ebp
c0007ed6:	89 e5                	mov    %esp,%ebp
c0007ed8:	83 ec 10             	sub    $0x10,%esp
c0007edb:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ede:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007ee1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ee4:	8d 50 01             	lea    0x1(%eax),%edx
c0007ee7:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007eea:	c6 00 30             	movb   $0x30,(%eax)
c0007eed:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ef0:	8d 50 01             	lea    0x1(%eax),%edx
c0007ef3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ef6:	c6 00 78             	movb   $0x78,(%eax)
c0007ef9:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007efd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007f01:	75 0e                	jne    c0007f11 <atoi+0x3c>
c0007f03:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f06:	8d 50 01             	lea    0x1(%eax),%edx
c0007f09:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007f0c:	c6 00 30             	movb   $0x30,(%eax)
c0007f0f:	eb 61                	jmp    c0007f72 <atoi+0x9d>
c0007f11:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007f18:	eb 52                	jmp    c0007f6c <atoi+0x97>
c0007f1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f1d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007f20:	89 c1                	mov    %eax,%ecx
c0007f22:	d3 fa                	sar    %cl,%edx
c0007f24:	89 d0                	mov    %edx,%eax
c0007f26:	83 e0 0f             	and    $0xf,%eax
c0007f29:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f2c:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007f30:	75 06                	jne    c0007f38 <atoi+0x63>
c0007f32:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007f36:	74 2f                	je     c0007f67 <atoi+0x92>
c0007f38:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007f3c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f40:	83 c0 30             	add    $0x30,%eax
c0007f43:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f46:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007f4a:	7e 0a                	jle    c0007f56 <atoi+0x81>
c0007f4c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f50:	83 c0 07             	add    $0x7,%eax
c0007f53:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f56:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f59:	8d 50 01             	lea    0x1(%eax),%edx
c0007f5c:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007f5f:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007f63:	88 10                	mov    %dl,(%eax)
c0007f65:	eb 01                	jmp    c0007f68 <atoi+0x93>
c0007f67:	90                   	nop
c0007f68:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007f6c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007f70:	79 a8                	jns    c0007f1a <atoi+0x45>
c0007f72:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f75:	c6 00 00             	movb   $0x0,(%eax)
c0007f78:	90                   	nop
c0007f79:	c9                   	leave  
c0007f7a:	c3                   	ret    

c0007f7b <disp_int>:
c0007f7b:	55                   	push   %ebp
c0007f7c:	89 e5                	mov    %esp,%ebp
c0007f7e:	83 ec 18             	sub    $0x18,%esp
c0007f81:	ff 75 08             	pushl  0x8(%ebp)
c0007f84:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f87:	50                   	push   %eax
c0007f88:	e8 48 ff ff ff       	call   c0007ed5 <atoi>
c0007f8d:	83 c4 08             	add    $0x8,%esp
c0007f90:	83 ec 08             	sub    $0x8,%esp
c0007f93:	6a 0b                	push   $0xb
c0007f95:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f98:	50                   	push   %eax
c0007f99:	e8 29 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f9e:	83 c4 10             	add    $0x10,%esp
c0007fa1:	90                   	nop
c0007fa2:	c9                   	leave  
c0007fa3:	c3                   	ret    

c0007fa4 <do_page_fault>:
c0007fa4:	55                   	push   %ebp
c0007fa5:	89 e5                	mov    %esp,%ebp
c0007fa7:	83 ec 28             	sub    $0x28,%esp
c0007faa:	0f 20 d0             	mov    %cr2,%eax
c0007fad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007fb0:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007fb7:	00 00 00 
c0007fba:	83 ec 0c             	sub    $0xc,%esp
c0007fbd:	68 20 b9 00 c0       	push   $0xc000b920
c0007fc2:	e8 c5 95 ff ff       	call   c000158c <disp_str>
c0007fc7:	83 c4 10             	add    $0x10,%esp
c0007fca:	83 ec 0c             	sub    $0xc,%esp
c0007fcd:	68 2f b9 00 c0       	push   $0xc000b92f
c0007fd2:	e8 b5 95 ff ff       	call   c000158c <disp_str>
c0007fd7:	83 c4 10             	add    $0x10,%esp
c0007fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007fdd:	83 ec 0c             	sub    $0xc,%esp
c0007fe0:	50                   	push   %eax
c0007fe1:	e8 95 ff ff ff       	call   c0007f7b <disp_int>
c0007fe6:	83 c4 10             	add    $0x10,%esp
c0007fe9:	83 ec 0c             	sub    $0xc,%esp
c0007fec:	68 34 b9 00 c0       	push   $0xc000b934
c0007ff1:	e8 96 95 ff ff       	call   c000158c <disp_str>
c0007ff6:	83 c4 10             	add    $0x10,%esp
c0007ff9:	83 ec 0c             	sub    $0xc,%esp
c0007ffc:	ff 75 f4             	pushl  -0xc(%ebp)
c0007fff:	e8 e4 f0 ff ff       	call   c00070e8 <ptr_pde>
c0008004:	83 c4 10             	add    $0x10,%esp
c0008007:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000800a:	83 ec 0c             	sub    $0xc,%esp
c000800d:	ff 75 f4             	pushl  -0xc(%ebp)
c0008010:	e8 e6 f0 ff ff       	call   c00070fb <ptr_pte>
c0008015:	83 c4 10             	add    $0x10,%esp
c0008018:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000801b:	83 ec 0c             	sub    $0xc,%esp
c000801e:	68 36 b9 00 c0       	push   $0xc000b936
c0008023:	e8 64 95 ff ff       	call   c000158c <disp_str>
c0008028:	83 c4 10             	add    $0x10,%esp
c000802b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000802e:	83 ec 0c             	sub    $0xc,%esp
c0008031:	50                   	push   %eax
c0008032:	e8 44 ff ff ff       	call   c0007f7b <disp_int>
c0008037:	83 c4 10             	add    $0x10,%esp
c000803a:	83 ec 0c             	sub    $0xc,%esp
c000803d:	68 3b b9 00 c0       	push   $0xc000b93b
c0008042:	e8 45 95 ff ff       	call   c000158c <disp_str>
c0008047:	83 c4 10             	add    $0x10,%esp
c000804a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000804d:	8b 00                	mov    (%eax),%eax
c000804f:	83 ec 0c             	sub    $0xc,%esp
c0008052:	50                   	push   %eax
c0008053:	e8 23 ff ff ff       	call   c0007f7b <disp_int>
c0008058:	83 c4 10             	add    $0x10,%esp
c000805b:	83 ec 0c             	sub    $0xc,%esp
c000805e:	68 34 b9 00 c0       	push   $0xc000b934
c0008063:	e8 24 95 ff ff       	call   c000158c <disp_str>
c0008068:	83 c4 10             	add    $0x10,%esp
c000806b:	83 ec 0c             	sub    $0xc,%esp
c000806e:	68 44 b9 00 c0       	push   $0xc000b944
c0008073:	e8 14 95 ff ff       	call   c000158c <disp_str>
c0008078:	83 c4 10             	add    $0x10,%esp
c000807b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000807e:	83 ec 0c             	sub    $0xc,%esp
c0008081:	50                   	push   %eax
c0008082:	e8 f4 fe ff ff       	call   c0007f7b <disp_int>
c0008087:	83 c4 10             	add    $0x10,%esp
c000808a:	83 ec 0c             	sub    $0xc,%esp
c000808d:	68 49 b9 00 c0       	push   $0xc000b949
c0008092:	e8 f5 94 ff ff       	call   c000158c <disp_str>
c0008097:	83 c4 10             	add    $0x10,%esp
c000809a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000809d:	8b 00                	mov    (%eax),%eax
c000809f:	83 ec 0c             	sub    $0xc,%esp
c00080a2:	50                   	push   %eax
c00080a3:	e8 d3 fe ff ff       	call   c0007f7b <disp_int>
c00080a8:	83 c4 10             	add    $0x10,%esp
c00080ab:	83 ec 0c             	sub    $0xc,%esp
c00080ae:	68 34 b9 00 c0       	push   $0xc000b934
c00080b3:	e8 d4 94 ff ff       	call   c000158c <disp_str>
c00080b8:	83 c4 10             	add    $0x10,%esp
c00080bb:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c00080c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00080c5:	8b 00                	mov    (%eax),%eax
c00080c7:	83 e0 01             	and    $0x1,%eax
c00080ca:	85 c0                	test   %eax,%eax
c00080cc:	74 09                	je     c00080d7 <do_page_fault+0x133>
c00080ce:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c00080d5:	eb 07                	jmp    c00080de <do_page_fault+0x13a>
c00080d7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00080de:	90                   	nop
c00080df:	c9                   	leave  
c00080e0:	c3                   	ret    

c00080e1 <exception_handler>:
c00080e1:	55                   	push   %ebp
c00080e2:	89 e5                	mov    %esp,%ebp
c00080e4:	57                   	push   %edi
c00080e5:	56                   	push   %esi
c00080e6:	53                   	push   %ebx
c00080e7:	83 ec 6c             	sub    $0x6c,%esp
c00080ea:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00080ed:	bb c0 bb 00 c0       	mov    $0xc000bbc0,%ebx
c00080f2:	ba 13 00 00 00       	mov    $0x13,%edx
c00080f7:	89 c7                	mov    %eax,%edi
c00080f9:	89 de                	mov    %ebx,%esi
c00080fb:	89 d1                	mov    %edx,%ecx
c00080fd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00080ff:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008106:	eb 04                	jmp    c000810c <exception_handler+0x2b>
c0008108:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000810c:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008113:	7e f3                	jle    c0008108 <exception_handler+0x27>
c0008115:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000811c:	00 00 00 
c000811f:	83 ec 0c             	sub    $0xc,%esp
c0008122:	68 52 b9 00 c0       	push   $0xc000b952
c0008127:	e8 60 94 ff ff       	call   c000158c <disp_str>
c000812c:	83 c4 10             	add    $0x10,%esp
c000812f:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008136:	8b 45 08             	mov    0x8(%ebp),%eax
c0008139:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c000813d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008140:	83 ec 0c             	sub    $0xc,%esp
c0008143:	ff 75 dc             	pushl  -0x24(%ebp)
c0008146:	e8 41 94 ff ff       	call   c000158c <disp_str>
c000814b:	83 c4 10             	add    $0x10,%esp
c000814e:	83 ec 0c             	sub    $0xc,%esp
c0008151:	68 60 b9 00 c0       	push   $0xc000b960
c0008156:	e8 31 94 ff ff       	call   c000158c <disp_str>
c000815b:	83 c4 10             	add    $0x10,%esp
c000815e:	83 ec 0c             	sub    $0xc,%esp
c0008161:	68 63 b9 00 c0       	push   $0xc000b963
c0008166:	e8 21 94 ff ff       	call   c000158c <disp_str>
c000816b:	83 c4 10             	add    $0x10,%esp
c000816e:	8b 45 08             	mov    0x8(%ebp),%eax
c0008171:	83 ec 0c             	sub    $0xc,%esp
c0008174:	50                   	push   %eax
c0008175:	e8 01 fe ff ff       	call   c0007f7b <disp_int>
c000817a:	83 c4 10             	add    $0x10,%esp
c000817d:	83 ec 0c             	sub    $0xc,%esp
c0008180:	68 60 b9 00 c0       	push   $0xc000b960
c0008185:	e8 02 94 ff ff       	call   c000158c <disp_str>
c000818a:	83 c4 10             	add    $0x10,%esp
c000818d:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008191:	74 2f                	je     c00081c2 <exception_handler+0xe1>
c0008193:	83 ec 0c             	sub    $0xc,%esp
c0008196:	68 6b b9 00 c0       	push   $0xc000b96b
c000819b:	e8 ec 93 ff ff       	call   c000158c <disp_str>
c00081a0:	83 c4 10             	add    $0x10,%esp
c00081a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00081a6:	83 ec 0c             	sub    $0xc,%esp
c00081a9:	50                   	push   %eax
c00081aa:	e8 cc fd ff ff       	call   c0007f7b <disp_int>
c00081af:	83 c4 10             	add    $0x10,%esp
c00081b2:	83 ec 0c             	sub    $0xc,%esp
c00081b5:	68 60 b9 00 c0       	push   $0xc000b960
c00081ba:	e8 cd 93 ff ff       	call   c000158c <disp_str>
c00081bf:	83 c4 10             	add    $0x10,%esp
c00081c2:	83 ec 0c             	sub    $0xc,%esp
c00081c5:	68 75 b9 00 c0       	push   $0xc000b975
c00081ca:	e8 bd 93 ff ff       	call   c000158c <disp_str>
c00081cf:	83 c4 10             	add    $0x10,%esp
c00081d2:	83 ec 0c             	sub    $0xc,%esp
c00081d5:	ff 75 14             	pushl  0x14(%ebp)
c00081d8:	e8 9e fd ff ff       	call   c0007f7b <disp_int>
c00081dd:	83 c4 10             	add    $0x10,%esp
c00081e0:	83 ec 0c             	sub    $0xc,%esp
c00081e3:	68 60 b9 00 c0       	push   $0xc000b960
c00081e8:	e8 9f 93 ff ff       	call   c000158c <disp_str>
c00081ed:	83 c4 10             	add    $0x10,%esp
c00081f0:	83 ec 0c             	sub    $0xc,%esp
c00081f3:	68 79 b9 00 c0       	push   $0xc000b979
c00081f8:	e8 8f 93 ff ff       	call   c000158c <disp_str>
c00081fd:	83 c4 10             	add    $0x10,%esp
c0008200:	8b 45 10             	mov    0x10(%ebp),%eax
c0008203:	83 ec 0c             	sub    $0xc,%esp
c0008206:	50                   	push   %eax
c0008207:	e8 6f fd ff ff       	call   c0007f7b <disp_int>
c000820c:	83 c4 10             	add    $0x10,%esp
c000820f:	83 ec 0c             	sub    $0xc,%esp
c0008212:	68 60 b9 00 c0       	push   $0xc000b960
c0008217:	e8 70 93 ff ff       	call   c000158c <disp_str>
c000821c:	83 c4 10             	add    $0x10,%esp
c000821f:	83 ec 0c             	sub    $0xc,%esp
c0008222:	68 7e b9 00 c0       	push   $0xc000b97e
c0008227:	e8 60 93 ff ff       	call   c000158c <disp_str>
c000822c:	83 c4 10             	add    $0x10,%esp
c000822f:	83 ec 0c             	sub    $0xc,%esp
c0008232:	ff 75 18             	pushl  0x18(%ebp)
c0008235:	e8 41 fd ff ff       	call   c0007f7b <disp_int>
c000823a:	83 c4 10             	add    $0x10,%esp
c000823d:	83 ec 0c             	sub    $0xc,%esp
c0008240:	68 60 b9 00 c0       	push   $0xc000b960
c0008245:	e8 42 93 ff ff       	call   c000158c <disp_str>
c000824a:	83 c4 10             	add    $0x10,%esp
c000824d:	83 ec 0c             	sub    $0xc,%esp
c0008250:	68 88 b9 00 c0       	push   $0xc000b988
c0008255:	e8 32 93 ff ff       	call   c000158c <disp_str>
c000825a:	83 c4 10             	add    $0x10,%esp
c000825d:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0008261:	75 46                	jne    c00082a9 <exception_handler+0x1c8>
c0008263:	0f 20 d0             	mov    %cr2,%eax
c0008266:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008269:	83 ec 0c             	sub    $0xc,%esp
c000826c:	68 a7 b9 00 c0       	push   $0xc000b9a7
c0008271:	e8 16 93 ff ff       	call   c000158c <disp_str>
c0008276:	83 c4 10             	add    $0x10,%esp
c0008279:	83 ec 0c             	sub    $0xc,%esp
c000827c:	68 2f b9 00 c0       	push   $0xc000b92f
c0008281:	e8 06 93 ff ff       	call   c000158c <disp_str>
c0008286:	83 c4 10             	add    $0x10,%esp
c0008289:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000828c:	83 ec 0c             	sub    $0xc,%esp
c000828f:	50                   	push   %eax
c0008290:	e8 e6 fc ff ff       	call   c0007f7b <disp_int>
c0008295:	83 c4 10             	add    $0x10,%esp
c0008298:	83 ec 0c             	sub    $0xc,%esp
c000829b:	68 34 b9 00 c0       	push   $0xc000b934
c00082a0:	e8 e7 92 ff ff       	call   c000158c <disp_str>
c00082a5:	83 c4 10             	add    $0x10,%esp
c00082a8:	90                   	nop
c00082a9:	90                   	nop
c00082aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00082ad:	5b                   	pop    %ebx
c00082ae:	5e                   	pop    %esi
c00082af:	5f                   	pop    %edi
c00082b0:	5d                   	pop    %ebp
c00082b1:	c3                   	ret    

c00082b2 <exception_handler2>:
c00082b2:	55                   	push   %ebp
c00082b3:	89 e5                	mov    %esp,%ebp
c00082b5:	57                   	push   %edi
c00082b6:	56                   	push   %esi
c00082b7:	53                   	push   %ebx
c00082b8:	83 ec 6c             	sub    $0x6c,%esp
c00082bb:	8d 45 90             	lea    -0x70(%ebp),%eax
c00082be:	bb c0 bb 00 c0       	mov    $0xc000bbc0,%ebx
c00082c3:	ba 13 00 00 00       	mov    $0x13,%edx
c00082c8:	89 c7                	mov    %eax,%edi
c00082ca:	89 de                	mov    %ebx,%esi
c00082cc:	89 d1                	mov    %edx,%ecx
c00082ce:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00082d0:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c00082d7:	2e 00 00 
c00082da:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00082e1:	eb 14                	jmp    c00082f7 <exception_handler2+0x45>
c00082e3:	83 ec 0c             	sub    $0xc,%esp
c00082e6:	68 0c bc 00 c0       	push   $0xc000bc0c
c00082eb:	e8 9c 92 ff ff       	call   c000158c <disp_str>
c00082f0:	83 c4 10             	add    $0x10,%esp
c00082f3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00082f7:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c00082fe:	7e e3                	jle    c00082e3 <exception_handler2+0x31>
c0008300:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c0008307:	2e 00 00 
c000830a:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008311:	8b 45 08             	mov    0x8(%ebp),%eax
c0008314:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0008318:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000831b:	83 ec 08             	sub    $0x8,%esp
c000831e:	ff 75 e0             	pushl  -0x20(%ebp)
c0008321:	ff 75 dc             	pushl  -0x24(%ebp)
c0008324:	e8 9e 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008329:	83 c4 10             	add    $0x10,%esp
c000832c:	83 ec 0c             	sub    $0xc,%esp
c000832f:	68 60 b9 00 c0       	push   $0xc000b960
c0008334:	e8 53 92 ff ff       	call   c000158c <disp_str>
c0008339:	83 c4 10             	add    $0x10,%esp
c000833c:	83 ec 08             	sub    $0x8,%esp
c000833f:	ff 75 e0             	pushl  -0x20(%ebp)
c0008342:	68 63 b9 00 c0       	push   $0xc000b963
c0008347:	e8 7b 92 ff ff       	call   c00015c7 <disp_str_colour>
c000834c:	83 c4 10             	add    $0x10,%esp
c000834f:	83 ec 0c             	sub    $0xc,%esp
c0008352:	ff 75 08             	pushl  0x8(%ebp)
c0008355:	e8 21 fc ff ff       	call   c0007f7b <disp_int>
c000835a:	83 c4 10             	add    $0x10,%esp
c000835d:	83 ec 0c             	sub    $0xc,%esp
c0008360:	68 60 b9 00 c0       	push   $0xc000b960
c0008365:	e8 22 92 ff ff       	call   c000158c <disp_str>
c000836a:	83 c4 10             	add    $0x10,%esp
c000836d:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008371:	74 44                	je     c00083b7 <exception_handler2+0x105>
c0008373:	83 ec 08             	sub    $0x8,%esp
c0008376:	ff 75 e0             	pushl  -0x20(%ebp)
c0008379:	68 6b b9 00 c0       	push   $0xc000b96b
c000837e:	e8 44 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008383:	83 c4 10             	add    $0x10,%esp
c0008386:	83 ec 08             	sub    $0x8,%esp
c0008389:	ff 75 e0             	pushl  -0x20(%ebp)
c000838c:	68 6b b9 00 c0       	push   $0xc000b96b
c0008391:	e8 31 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008396:	83 c4 10             	add    $0x10,%esp
c0008399:	83 ec 0c             	sub    $0xc,%esp
c000839c:	ff 75 0c             	pushl  0xc(%ebp)
c000839f:	e8 d7 fb ff ff       	call   c0007f7b <disp_int>
c00083a4:	83 c4 10             	add    $0x10,%esp
c00083a7:	83 ec 0c             	sub    $0xc,%esp
c00083aa:	68 60 b9 00 c0       	push   $0xc000b960
c00083af:	e8 d8 91 ff ff       	call   c000158c <disp_str>
c00083b4:	83 c4 10             	add    $0x10,%esp
c00083b7:	83 ec 08             	sub    $0x8,%esp
c00083ba:	ff 75 e0             	pushl  -0x20(%ebp)
c00083bd:	68 75 b9 00 c0       	push   $0xc000b975
c00083c2:	e8 00 92 ff ff       	call   c00015c7 <disp_str_colour>
c00083c7:	83 c4 10             	add    $0x10,%esp
c00083ca:	83 ec 0c             	sub    $0xc,%esp
c00083cd:	ff 75 14             	pushl  0x14(%ebp)
c00083d0:	e8 a6 fb ff ff       	call   c0007f7b <disp_int>
c00083d5:	83 c4 10             	add    $0x10,%esp
c00083d8:	83 ec 0c             	sub    $0xc,%esp
c00083db:	68 60 b9 00 c0       	push   $0xc000b960
c00083e0:	e8 a7 91 ff ff       	call   c000158c <disp_str>
c00083e5:	83 c4 10             	add    $0x10,%esp
c00083e8:	83 ec 08             	sub    $0x8,%esp
c00083eb:	ff 75 e0             	pushl  -0x20(%ebp)
c00083ee:	68 79 b9 00 c0       	push   $0xc000b979
c00083f3:	e8 cf 91 ff ff       	call   c00015c7 <disp_str_colour>
c00083f8:	83 c4 10             	add    $0x10,%esp
c00083fb:	83 ec 0c             	sub    $0xc,%esp
c00083fe:	ff 75 10             	pushl  0x10(%ebp)
c0008401:	e8 75 fb ff ff       	call   c0007f7b <disp_int>
c0008406:	83 c4 10             	add    $0x10,%esp
c0008409:	83 ec 0c             	sub    $0xc,%esp
c000840c:	68 60 b9 00 c0       	push   $0xc000b960
c0008411:	e8 76 91 ff ff       	call   c000158c <disp_str>
c0008416:	83 c4 10             	add    $0x10,%esp
c0008419:	83 ec 08             	sub    $0x8,%esp
c000841c:	ff 75 e0             	pushl  -0x20(%ebp)
c000841f:	68 7e b9 00 c0       	push   $0xc000b97e
c0008424:	e8 9e 91 ff ff       	call   c00015c7 <disp_str_colour>
c0008429:	83 c4 10             	add    $0x10,%esp
c000842c:	83 ec 0c             	sub    $0xc,%esp
c000842f:	ff 75 18             	pushl  0x18(%ebp)
c0008432:	e8 44 fb ff ff       	call   c0007f7b <disp_int>
c0008437:	83 c4 10             	add    $0x10,%esp
c000843a:	83 ec 0c             	sub    $0xc,%esp
c000843d:	68 60 b9 00 c0       	push   $0xc000b960
c0008442:	e8 45 91 ff ff       	call   c000158c <disp_str>
c0008447:	83 c4 10             	add    $0x10,%esp
c000844a:	90                   	nop
c000844b:	8d 65 f4             	lea    -0xc(%ebp),%esp
c000844e:	5b                   	pop    %ebx
c000844f:	5e                   	pop    %esi
c0008450:	5f                   	pop    %edi
c0008451:	5d                   	pop    %ebp
c0008452:	c3                   	ret    

c0008453 <init_internal_interrupt>:
c0008453:	55                   	push   %ebp
c0008454:	89 e5                	mov    %esp,%ebp
c0008456:	83 ec 08             	sub    $0x8,%esp
c0008459:	6a 0e                	push   $0xe
c000845b:	6a 08                	push   $0x8
c000845d:	68 03 16 00 c0       	push   $0xc0001603
c0008462:	6a 00                	push   $0x0
c0008464:	e8 4c cd ff ff       	call   c00051b5 <InitInterruptDesc>
c0008469:	83 c4 10             	add    $0x10,%esp
c000846c:	6a 0e                	push   $0xe
c000846e:	6a 08                	push   $0x8
c0008470:	68 09 16 00 c0       	push   $0xc0001609
c0008475:	6a 01                	push   $0x1
c0008477:	e8 39 cd ff ff       	call   c00051b5 <InitInterruptDesc>
c000847c:	83 c4 10             	add    $0x10,%esp
c000847f:	6a 0e                	push   $0xe
c0008481:	6a 08                	push   $0x8
c0008483:	68 0f 16 00 c0       	push   $0xc000160f
c0008488:	6a 02                	push   $0x2
c000848a:	e8 26 cd ff ff       	call   c00051b5 <InitInterruptDesc>
c000848f:	83 c4 10             	add    $0x10,%esp
c0008492:	6a 0e                	push   $0xe
c0008494:	6a 08                	push   $0x8
c0008496:	68 15 16 00 c0       	push   $0xc0001615
c000849b:	6a 03                	push   $0x3
c000849d:	e8 13 cd ff ff       	call   c00051b5 <InitInterruptDesc>
c00084a2:	83 c4 10             	add    $0x10,%esp
c00084a5:	6a 0e                	push   $0xe
c00084a7:	6a 08                	push   $0x8
c00084a9:	68 1b 16 00 c0       	push   $0xc000161b
c00084ae:	6a 04                	push   $0x4
c00084b0:	e8 00 cd ff ff       	call   c00051b5 <InitInterruptDesc>
c00084b5:	83 c4 10             	add    $0x10,%esp
c00084b8:	6a 0e                	push   $0xe
c00084ba:	6a 08                	push   $0x8
c00084bc:	68 21 16 00 c0       	push   $0xc0001621
c00084c1:	6a 05                	push   $0x5
c00084c3:	e8 ed cc ff ff       	call   c00051b5 <InitInterruptDesc>
c00084c8:	83 c4 10             	add    $0x10,%esp
c00084cb:	6a 0e                	push   $0xe
c00084cd:	6a 08                	push   $0x8
c00084cf:	68 27 16 00 c0       	push   $0xc0001627
c00084d4:	6a 06                	push   $0x6
c00084d6:	e8 da cc ff ff       	call   c00051b5 <InitInterruptDesc>
c00084db:	83 c4 10             	add    $0x10,%esp
c00084de:	6a 0e                	push   $0xe
c00084e0:	6a 08                	push   $0x8
c00084e2:	68 2d 16 00 c0       	push   $0xc000162d
c00084e7:	6a 07                	push   $0x7
c00084e9:	e8 c7 cc ff ff       	call   c00051b5 <InitInterruptDesc>
c00084ee:	83 c4 10             	add    $0x10,%esp
c00084f1:	6a 0e                	push   $0xe
c00084f3:	6a 08                	push   $0x8
c00084f5:	68 33 16 00 c0       	push   $0xc0001633
c00084fa:	6a 08                	push   $0x8
c00084fc:	e8 b4 cc ff ff       	call   c00051b5 <InitInterruptDesc>
c0008501:	83 c4 10             	add    $0x10,%esp
c0008504:	6a 0e                	push   $0xe
c0008506:	6a 08                	push   $0x8
c0008508:	68 37 16 00 c0       	push   $0xc0001637
c000850d:	6a 09                	push   $0x9
c000850f:	e8 a1 cc ff ff       	call   c00051b5 <InitInterruptDesc>
c0008514:	83 c4 10             	add    $0x10,%esp
c0008517:	6a 0e                	push   $0xe
c0008519:	6a 08                	push   $0x8
c000851b:	68 3d 16 00 c0       	push   $0xc000163d
c0008520:	6a 0a                	push   $0xa
c0008522:	e8 8e cc ff ff       	call   c00051b5 <InitInterruptDesc>
c0008527:	83 c4 10             	add    $0x10,%esp
c000852a:	6a 0e                	push   $0xe
c000852c:	6a 08                	push   $0x8
c000852e:	68 41 16 00 c0       	push   $0xc0001641
c0008533:	6a 0b                	push   $0xb
c0008535:	e8 7b cc ff ff       	call   c00051b5 <InitInterruptDesc>
c000853a:	83 c4 10             	add    $0x10,%esp
c000853d:	6a 0e                	push   $0xe
c000853f:	6a 08                	push   $0x8
c0008541:	68 45 16 00 c0       	push   $0xc0001645
c0008546:	6a 0c                	push   $0xc
c0008548:	e8 68 cc ff ff       	call   c00051b5 <InitInterruptDesc>
c000854d:	83 c4 10             	add    $0x10,%esp
c0008550:	6a 0e                	push   $0xe
c0008552:	6a 08                	push   $0x8
c0008554:	68 49 16 00 c0       	push   $0xc0001649
c0008559:	6a 0d                	push   $0xd
c000855b:	e8 55 cc ff ff       	call   c00051b5 <InitInterruptDesc>
c0008560:	83 c4 10             	add    $0x10,%esp
c0008563:	6a 0e                	push   $0xe
c0008565:	6a 08                	push   $0x8
c0008567:	68 4d 16 00 c0       	push   $0xc000164d
c000856c:	6a 0e                	push   $0xe
c000856e:	e8 42 cc ff ff       	call   c00051b5 <InitInterruptDesc>
c0008573:	83 c4 10             	add    $0x10,%esp
c0008576:	6a 0e                	push   $0xe
c0008578:	6a 08                	push   $0x8
c000857a:	68 51 16 00 c0       	push   $0xc0001651
c000857f:	6a 10                	push   $0x10
c0008581:	e8 2f cc ff ff       	call   c00051b5 <InitInterruptDesc>
c0008586:	83 c4 10             	add    $0x10,%esp
c0008589:	6a 0e                	push   $0xe
c000858b:	6a 08                	push   $0x8
c000858d:	68 57 16 00 c0       	push   $0xc0001657
c0008592:	6a 11                	push   $0x11
c0008594:	e8 1c cc ff ff       	call   c00051b5 <InitInterruptDesc>
c0008599:	83 c4 10             	add    $0x10,%esp
c000859c:	6a 0e                	push   $0xe
c000859e:	6a 08                	push   $0x8
c00085a0:	68 5b 16 00 c0       	push   $0xc000165b
c00085a5:	6a 12                	push   $0x12
c00085a7:	e8 09 cc ff ff       	call   c00051b5 <InitInterruptDesc>
c00085ac:	83 c4 10             	add    $0x10,%esp
c00085af:	6a 0e                	push   $0xe
c00085b1:	6a 0e                	push   $0xe
c00085b3:	68 17 17 00 c0       	push   $0xc0001717
c00085b8:	68 90 00 00 00       	push   $0x90
c00085bd:	e8 f3 cb ff ff       	call   c00051b5 <InitInterruptDesc>
c00085c2:	83 c4 10             	add    $0x10,%esp
c00085c5:	90                   	nop
c00085c6:	c9                   	leave  
c00085c7:	c3                   	ret    

c00085c8 <test>:
c00085c8:	55                   	push   %ebp
c00085c9:	89 e5                	mov    %esp,%ebp
c00085cb:	83 ec 08             	sub    $0x8,%esp
c00085ce:	83 ec 0c             	sub    $0xc,%esp
c00085d1:	68 0e bc 00 c0       	push   $0xc000bc0e
c00085d6:	e8 b1 8f ff ff       	call   c000158c <disp_str>
c00085db:	83 c4 10             	add    $0x10,%esp
c00085de:	83 ec 0c             	sub    $0xc,%esp
c00085e1:	68 34 b9 00 c0       	push   $0xc000b934
c00085e6:	e8 a1 8f ff ff       	call   c000158c <disp_str>
c00085eb:	83 c4 10             	add    $0x10,%esp
c00085ee:	90                   	nop
c00085ef:	c9                   	leave  
c00085f0:	c3                   	ret    

c00085f1 <disp_str_colour3>:
c00085f1:	55                   	push   %ebp
c00085f2:	89 e5                	mov    %esp,%ebp
c00085f4:	90                   	nop
c00085f5:	5d                   	pop    %ebp
c00085f6:	c3                   	ret    

c00085f7 <spurious_irq>:
c00085f7:	55                   	push   %ebp
c00085f8:	89 e5                	mov    %esp,%ebp
c00085fa:	83 ec 08             	sub    $0x8,%esp
c00085fd:	83 ec 08             	sub    $0x8,%esp
c0008600:	6a 0b                	push   $0xb
c0008602:	68 10 bc 00 c0       	push   $0xc000bc10
c0008607:	e8 bb 8f ff ff       	call   c00015c7 <disp_str_colour>
c000860c:	83 c4 10             	add    $0x10,%esp
c000860f:	83 ec 0c             	sub    $0xc,%esp
c0008612:	ff 75 08             	pushl  0x8(%ebp)
c0008615:	e8 61 f9 ff ff       	call   c0007f7b <disp_int>
c000861a:	83 c4 10             	add    $0x10,%esp
c000861d:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008622:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008628:	83 c0 01             	add    $0x1,%eax
c000862b:	83 d2 00             	adc    $0x0,%edx
c000862e:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c0008633:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c0008639:	83 ec 0c             	sub    $0xc,%esp
c000863c:	68 37 bc 00 c0       	push   $0xc000bc37
c0008641:	e8 46 8f ff ff       	call   c000158c <disp_str>
c0008646:	83 c4 10             	add    $0x10,%esp
c0008649:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000864e:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008654:	83 ec 0c             	sub    $0xc,%esp
c0008657:	50                   	push   %eax
c0008658:	e8 1e f9 ff ff       	call   c0007f7b <disp_int>
c000865d:	83 c4 10             	add    $0x10,%esp
c0008660:	83 ec 0c             	sub    $0xc,%esp
c0008663:	68 39 bc 00 c0       	push   $0xc000bc39
c0008668:	e8 1f 8f ff ff       	call   c000158c <disp_str>
c000866d:	83 c4 10             	add    $0x10,%esp
c0008670:	83 ec 08             	sub    $0x8,%esp
c0008673:	6a 0c                	push   $0xc
c0008675:	68 3c bc 00 c0       	push   $0xc000bc3c
c000867a:	e8 48 8f ff ff       	call   c00015c7 <disp_str_colour>
c000867f:	83 c4 10             	add    $0x10,%esp
c0008682:	90                   	nop
c0008683:	c9                   	leave  
c0008684:	c3                   	ret    

c0008685 <init_keyboard>:
c0008685:	55                   	push   %ebp
c0008686:	89 e5                	mov    %esp,%ebp
c0008688:	83 ec 18             	sub    $0x18,%esp
c000868b:	83 ec 04             	sub    $0x4,%esp
c000868e:	68 00 02 00 00       	push   $0x200
c0008693:	6a 00                	push   $0x0
c0008695:	68 ec 0b 01 c0       	push   $0xc0010bec
c000869a:	e8 98 3a 00 00       	call   c000c137 <Memset>
c000869f:	83 c4 10             	add    $0x10,%esp
c00086a2:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c00086a9:	0b 01 c0 
c00086ac:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00086b1:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c00086b6:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c00086bd:	00 00 00 
c00086c0:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00086c7:	00 00 00 
c00086ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00086d1:	eb 04                	jmp    c00086d7 <init_keyboard+0x52>
c00086d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00086d7:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00086de:	7e f3                	jle    c00086d3 <init_keyboard+0x4e>
c00086e0:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00086e7:	00 00 00 
c00086ea:	e8 d0 d8 ff ff       	call   c0005fbf <init_keyboard_handler>
c00086ef:	90                   	nop
c00086f0:	c9                   	leave  
c00086f1:	c3                   	ret    

c00086f2 <init2>:
c00086f2:	55                   	push   %ebp
c00086f3:	89 e5                	mov    %esp,%ebp
c00086f5:	83 ec 08             	sub    $0x8,%esp
c00086f8:	83 ec 0c             	sub    $0xc,%esp
c00086fb:	68 61 bc 00 c0       	push   $0xc000bc61
c0008700:	e8 87 8e ff ff       	call   c000158c <disp_str>
c0008705:	83 c4 10             	add    $0x10,%esp
c0008708:	e8 78 ff ff ff       	call   c0008685 <init_keyboard>
c000870d:	83 ec 0c             	sub    $0xc,%esp
c0008710:	68 00 00 00 02       	push   $0x2000000
c0008715:	e8 71 f3 ff ff       	call   c0007a8b <init_memory>
c000871a:	83 c4 10             	add    $0x10,%esp
c000871d:	90                   	nop
c000871e:	c9                   	leave  
c000871f:	c3                   	ret    

c0008720 <u_thread_a>:
c0008720:	55                   	push   %ebp
c0008721:	89 e5                	mov    %esp,%ebp
c0008723:	83 ec 08             	sub    $0x8,%esp
c0008726:	83 ec 0c             	sub    $0xc,%esp
c0008729:	68 67 bc 00 c0       	push   $0xc000bc67
c000872e:	e8 59 8e ff ff       	call   c000158c <disp_str>
c0008733:	83 c4 10             	add    $0x10,%esp
c0008736:	eb fe                	jmp    c0008736 <u_thread_a+0x16>

c0008738 <kernel_main2>:
c0008738:	55                   	push   %ebp
c0008739:	89 e5                	mov    %esp,%ebp
c000873b:	57                   	push   %edi
c000873c:	56                   	push   %esi
c000873d:	53                   	push   %ebx
c000873e:	83 ec 3c             	sub    $0x3c,%esp
c0008741:	83 ec 0c             	sub    $0xc,%esp
c0008744:	68 75 bc 00 c0       	push   $0xc000bc75
c0008749:	e8 3e 8e ff ff       	call   c000158c <disp_str>
c000874e:	83 c4 10             	add    $0x10,%esp
c0008751:	e8 1d 92 ff ff       	call   c0001973 <init>
c0008756:	c7 05 e8 1e 01 c0 00 	movl   $0x0,0xc0011ee8
c000875d:	00 00 00 
c0008760:	c7 05 ec 1e 01 c0 00 	movl   $0x0,0xc0011eec
c0008767:	00 00 00 
c000876a:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c0008771:	00 00 00 
c0008774:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c000877b:	00 00 00 
c000877e:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c0008785:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000878c:	e9 01 02 00 00       	jmp    c0008992 <kernel_main2+0x25a>
c0008791:	83 ec 08             	sub    $0x8,%esp
c0008794:	6a 00                	push   $0x0
c0008796:	6a 01                	push   $0x1
c0008798:	e8 c2 eb ff ff       	call   c000735f <alloc_memory>
c000879d:	83 c4 10             	add    $0x10,%esp
c00087a0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00087a3:	83 ec 04             	sub    $0x4,%esp
c00087a6:	68 b4 02 00 00       	push   $0x2b4
c00087ab:	6a 00                	push   $0x0
c00087ad:	ff 75 d8             	pushl  -0x28(%ebp)
c00087b0:	e8 82 39 00 00       	call   c000c137 <Memset>
c00087b5:	83 c4 10             	add    $0x10,%esp
c00087b8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087bb:	05 00 10 00 00       	add    $0x1000,%eax
c00087c0:	89 c2                	mov    %eax,%edx
c00087c2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087c5:	89 10                	mov    %edx,(%eax)
c00087c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087ca:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c00087d1:	00 00 
c00087d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00087d6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087d9:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c00087df:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087e2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00087e9:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00087ed:	7e 0f                	jle    c00087fe <kernel_main2+0xc6>
c00087ef:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087f2:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c00087f9:	e9 90 01 00 00       	jmp    c000898e <kernel_main2+0x256>
c00087fe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008801:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0008808:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000880c:	7f 73                	jg     c0008881 <kernel_main2+0x149>
c000880e:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c0008815:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c000881c:	c7 45 d0 2c 00 00 00 	movl   $0x2c,-0x30(%ebp)
c0008823:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008826:	8b 00                	mov    (%eax),%eax
c0008828:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c000882b:	89 c2                	mov    %eax,%edx
c000882d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008830:	89 10                	mov    %edx,(%eax)
c0008832:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008835:	8b 00                	mov    (%eax),%eax
c0008837:	2b 45 d0             	sub    -0x30(%ebp),%eax
c000883a:	89 c2                	mov    %eax,%edx
c000883c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000883f:	89 10                	mov    %edx,(%eax)
c0008841:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008844:	8b 00                	mov    (%eax),%eax
c0008846:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008849:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000884c:	8b 50 14             	mov    0x14(%eax),%edx
c000884f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008852:	89 50 28             	mov    %edx,0x28(%eax)
c0008855:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008858:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000885e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008861:	8b 10                	mov    (%eax),%edx
c0008863:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008866:	89 50 04             	mov    %edx,0x4(%eax)
c0008869:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000886c:	8b 50 04             	mov    0x4(%eax),%edx
c000886f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008872:	89 50 08             	mov    %edx,0x8(%eax)
c0008875:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008878:	8b 50 08             	mov    0x8(%eax),%edx
c000887b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000887e:	89 50 0c             	mov    %edx,0xc(%eax)
c0008881:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008884:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008887:	81 c2 34 01 00 00    	add    $0x134,%edx
c000888d:	83 ec 08             	sub    $0x8,%esp
c0008890:	50                   	push   %eax
c0008891:	52                   	push   %edx
c0008892:	e8 bf 38 00 00       	call   c000c156 <Strcpy>
c0008897:	83 c4 10             	add    $0x10,%esp
c000889a:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c000889e:	83 c8 04             	or     $0x4,%eax
c00088a1:	0f b6 c0             	movzbl %al,%eax
c00088a4:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c00088a8:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00088ac:	83 c8 0c             	or     $0xc,%eax
c00088af:	0f b6 c0             	movzbl %al,%eax
c00088b2:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c00088b6:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c00088ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088bd:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00088c3:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088ca:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c00088d0:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088d7:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c00088dd:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088e4:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c00088ea:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088f1:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c00088f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088fa:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c0008901:	00 00 00 
c0008904:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008907:	8b 50 14             	mov    0x14(%eax),%edx
c000890a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000890d:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008913:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008916:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0008919:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c000891f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008922:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0008929:	00 00 00 
c000892c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000892f:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0008936:	00 00 00 
c0008939:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000893c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0008943:	00 00 00 
c0008946:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008949:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0008950:	00 00 00 
c0008953:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008956:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000895d:	00 00 00 
c0008960:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008963:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000896a:	00 00 00 
c000896d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008970:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0008976:	8d 90 00 32 08 c0    	lea    -0x3ff7ce00(%eax),%edx
c000897c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000897f:	89 c3                	mov    %eax,%ebx
c0008981:	b8 ad 00 00 00       	mov    $0xad,%eax
c0008986:	89 d7                	mov    %edx,%edi
c0008988:	89 de                	mov    %ebx,%esi
c000898a:	89 c1                	mov    %eax,%ecx
c000898c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000898e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008992:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0008996:	0f 8e f5 fd ff ff    	jle    c0008791 <kernel_main2+0x59>
c000899c:	c7 05 c0 0b 01 c0 00 	movl   $0xc0083200,0xc0010bc0
c00089a3:	32 08 c0 
c00089a6:	eb fe                	jmp    c00089a6 <kernel_main2+0x26e>

c00089a8 <TestTTY>:
c00089a8:	55                   	push   %ebp
c00089a9:	89 e5                	mov    %esp,%ebp
c00089ab:	83 ec 28             	sub    $0x28,%esp
c00089ae:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00089b5:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00089bc:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00089c2:	83 ec 08             	sub    $0x8,%esp
c00089c5:	6a 02                	push   $0x2
c00089c7:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089ca:	50                   	push   %eax
c00089cb:	e8 95 d7 ff ff       	call   c0006165 <open>
c00089d0:	83 c4 10             	add    $0x10,%esp
c00089d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00089d6:	83 ec 08             	sub    $0x8,%esp
c00089d9:	6a 02                	push   $0x2
c00089db:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089de:	50                   	push   %eax
c00089df:	e8 81 d7 ff ff       	call   c0006165 <open>
c00089e4:	83 c4 10             	add    $0x10,%esp
c00089e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089ea:	83 ec 0c             	sub    $0xc,%esp
c00089ed:	68 81 bc 00 c0       	push   $0xc000bc81
c00089f2:	e8 2e 0e 00 00       	call   c0009825 <Printf>
c00089f7:	83 c4 10             	add    $0x10,%esp
c00089fa:	83 ec 0c             	sub    $0xc,%esp
c00089fd:	6a 0a                	push   $0xa
c00089ff:	e8 a0 9f ff ff       	call   c00029a4 <sys_malloc>
c0008a04:	83 c4 10             	add    $0x10,%esp
c0008a07:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a0a:	83 ec 04             	sub    $0x4,%esp
c0008a0d:	6a 0a                	push   $0xa
c0008a0f:	6a 00                	push   $0x0
c0008a11:	ff 75 ec             	pushl  -0x14(%ebp)
c0008a14:	e8 1e 37 00 00       	call   c000c137 <Memset>
c0008a19:	83 c4 10             	add    $0x10,%esp
c0008a1c:	83 ec 04             	sub    $0x4,%esp
c0008a1f:	6a 0a                	push   $0xa
c0008a21:	ff 75 ec             	pushl  -0x14(%ebp)
c0008a24:	ff 75 f0             	pushl  -0x10(%ebp)
c0008a27:	e8 be d7 ff ff       	call   c00061ea <read>
c0008a2c:	83 c4 10             	add    $0x10,%esp
c0008a2f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a32:	83 ec 08             	sub    $0x8,%esp
c0008a35:	ff 75 ec             	pushl  -0x14(%ebp)
c0008a38:	68 93 bc 00 c0       	push   $0xc000bc93
c0008a3d:	e8 e3 0d 00 00       	call   c0009825 <Printf>
c0008a42:	83 c4 10             	add    $0x10,%esp
c0008a45:	eb c3                	jmp    c0008a0a <TestTTY+0x62>

c0008a47 <TestFS>:
c0008a47:	55                   	push   %ebp
c0008a48:	89 e5                	mov    %esp,%ebp
c0008a4a:	81 ec 28 01 00 00    	sub    $0x128,%esp
c0008a50:	83 ec 0c             	sub    $0xc,%esp
c0008a53:	68 9d bc 00 c0       	push   $0xc000bc9d
c0008a58:	e8 2f 8b ff ff       	call   c000158c <disp_str>
c0008a5d:	83 c4 10             	add    $0x10,%esp
c0008a60:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008a67:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c0008a6e:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0008a74:	66 87 db             	;xchg   %bx,%bx
c0008a77:	83 ec 08             	sub    $0x8,%esp
c0008a7a:	6a 02                	push   $0x2
c0008a7c:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008a7f:	50                   	push   %eax
c0008a80:	e8 e0 d6 ff ff       	call   c0006165 <open>
c0008a85:	83 c4 10             	add    $0x10,%esp
c0008a88:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a8b:	66 87 db             	;xchg   %bx,%bx
c0008a8e:	83 ec 08             	sub    $0x8,%esp
c0008a91:	6a 02                	push   $0x2
c0008a93:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008a96:	50                   	push   %eax
c0008a97:	e8 c9 d6 ff ff       	call   c0006165 <open>
c0008a9c:	83 c4 10             	add    $0x10,%esp
c0008a9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008aa2:	66 87 db             	;xchg   %bx,%bx
c0008aa5:	83 ec 0c             	sub    $0xc,%esp
c0008aa8:	68 81 bc 00 c0       	push   $0xc000bc81
c0008aad:	e8 73 0d 00 00       	call   c0009825 <Printf>
c0008ab2:	83 c4 10             	add    $0x10,%esp
c0008ab5:	66 87 db             	;xchg   %bx,%bx
c0008ab8:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0008abf:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0008ac3:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0008aca:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0008ace:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008ad5:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0008adc:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0008ae2:	66 87 db             	;xchg   %bx,%bx
c0008ae5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008aec:	66 87 db             	;xchg   %bx,%bx
c0008aef:	83 ec 0c             	sub    $0xc,%esp
c0008af2:	68 a5 bc 00 c0       	push   $0xc000bca5
c0008af7:	e8 29 0d 00 00       	call   c0009825 <Printf>
c0008afc:	83 c4 10             	add    $0x10,%esp
c0008aff:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008b03:	0f 85 43 03 00 00    	jne    c0008e4c <TestFS+0x405>
c0008b09:	83 ec 08             	sub    $0x8,%esp
c0008b0c:	6a 07                	push   $0x7
c0008b0e:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0008b11:	50                   	push   %eax
c0008b12:	e8 4e d6 ff ff       	call   c0006165 <open>
c0008b17:	83 c4 10             	add    $0x10,%esp
c0008b1a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008b1d:	83 ec 08             	sub    $0x8,%esp
c0008b20:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b23:	68 bd bc 00 c0       	push   $0xc000bcbd
c0008b28:	e8 f8 0c 00 00       	call   c0009825 <Printf>
c0008b2d:	83 c4 10             	add    $0x10,%esp
c0008b30:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008b37:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0008b3e:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0008b45:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0008b4c:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0008b53:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008b5a:	83 ec 0c             	sub    $0xc,%esp
c0008b5d:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008b60:	50                   	push   %eax
c0008b61:	e8 0a 36 00 00       	call   c000c170 <Strlen>
c0008b66:	83 c4 10             	add    $0x10,%esp
c0008b69:	83 ec 04             	sub    $0x4,%esp
c0008b6c:	50                   	push   %eax
c0008b6d:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008b70:	50                   	push   %eax
c0008b71:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b74:	e8 e5 d6 ff ff       	call   c000625e <write>
c0008b79:	83 c4 10             	add    $0x10,%esp
c0008b7c:	83 ec 04             	sub    $0x4,%esp
c0008b7f:	6a 14                	push   $0x14
c0008b81:	6a 00                	push   $0x0
c0008b83:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b86:	50                   	push   %eax
c0008b87:	e8 ab 35 00 00       	call   c000c137 <Memset>
c0008b8c:	83 c4 10             	add    $0x10,%esp
c0008b8f:	83 ec 04             	sub    $0x4,%esp
c0008b92:	6a 12                	push   $0x12
c0008b94:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b97:	50                   	push   %eax
c0008b98:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b9b:	e8 4a d6 ff ff       	call   c00061ea <read>
c0008ba0:	83 c4 10             	add    $0x10,%esp
c0008ba3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008ba6:	83 ec 08             	sub    $0x8,%esp
c0008ba9:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008bac:	50                   	push   %eax
c0008bad:	68 c6 bc 00 c0       	push   $0xc000bcc6
c0008bb2:	e8 6e 0c 00 00       	call   c0009825 <Printf>
c0008bb7:	83 c4 10             	add    $0x10,%esp
c0008bba:	66 87 db             	;xchg   %bx,%bx
c0008bbd:	83 ec 0c             	sub    $0xc,%esp
c0008bc0:	6a 0a                	push   $0xa
c0008bc2:	e8 2a 0b 00 00       	call   c00096f1 <delay>
c0008bc7:	83 c4 10             	add    $0x10,%esp
c0008bca:	83 ec 08             	sub    $0x8,%esp
c0008bcd:	6a 07                	push   $0x7
c0008bcf:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0008bd2:	50                   	push   %eax
c0008bd3:	e8 8d d5 ff ff       	call   c0006165 <open>
c0008bd8:	83 c4 10             	add    $0x10,%esp
c0008bdb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008bde:	83 ec 08             	sub    $0x8,%esp
c0008be1:	ff 75 dc             	pushl  -0x24(%ebp)
c0008be4:	68 d1 bc 00 c0       	push   $0xc000bcd1
c0008be9:	e8 37 0c 00 00       	call   c0009825 <Printf>
c0008bee:	83 c4 10             	add    $0x10,%esp
c0008bf1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008bf8:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0008bff:	67 3a 68 
c0008c02:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008c09:	77 20 61 
c0008c0c:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0008c13:	65 20 79 
c0008c16:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0008c1d:	75 3f 00 
c0008c20:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008c27:	00 00 00 
c0008c2a:	83 ec 0c             	sub    $0xc,%esp
c0008c2d:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008c33:	50                   	push   %eax
c0008c34:	e8 37 35 00 00       	call   c000c170 <Strlen>
c0008c39:	83 c4 10             	add    $0x10,%esp
c0008c3c:	83 ec 04             	sub    $0x4,%esp
c0008c3f:	50                   	push   %eax
c0008c40:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008c46:	50                   	push   %eax
c0008c47:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c4a:	e8 0f d6 ff ff       	call   c000625e <write>
c0008c4f:	83 c4 10             	add    $0x10,%esp
c0008c52:	83 ec 04             	sub    $0x4,%esp
c0008c55:	6a 14                	push   $0x14
c0008c57:	6a 00                	push   $0x0
c0008c59:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c5f:	50                   	push   %eax
c0008c60:	e8 d2 34 00 00       	call   c000c137 <Memset>
c0008c65:	83 c4 10             	add    $0x10,%esp
c0008c68:	83 ec 04             	sub    $0x4,%esp
c0008c6b:	6a 12                	push   $0x12
c0008c6d:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c73:	50                   	push   %eax
c0008c74:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c77:	e8 6e d5 ff ff       	call   c00061ea <read>
c0008c7c:	83 c4 10             	add    $0x10,%esp
c0008c7f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008c82:	83 ec 08             	sub    $0x8,%esp
c0008c85:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c8b:	50                   	push   %eax
c0008c8c:	68 db bc 00 c0       	push   $0xc000bcdb
c0008c91:	e8 8f 0b 00 00       	call   c0009825 <Printf>
c0008c96:	83 c4 10             	add    $0x10,%esp
c0008c99:	83 ec 08             	sub    $0x8,%esp
c0008c9c:	6a 07                	push   $0x7
c0008c9e:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0008ca1:	50                   	push   %eax
c0008ca2:	e8 be d4 ff ff       	call   c0006165 <open>
c0008ca7:	83 c4 10             	add    $0x10,%esp
c0008caa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008cad:	83 ec 08             	sub    $0x8,%esp
c0008cb0:	ff 75 dc             	pushl  -0x24(%ebp)
c0008cb3:	68 d1 bc 00 c0       	push   $0xc000bcd1
c0008cb8:	e8 68 0b 00 00       	call   c0009825 <Printf>
c0008cbd:	83 c4 10             	add    $0x10,%esp
c0008cc0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008cc7:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0008cce:	20 77 69 
c0008cd1:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008cd8:	6c 20 73 
c0008cdb:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0008ce2:	63 63 65 
c0008ce5:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008cec:	73 20 61 
c0008cef:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008cf6:	20 6c 61 
c0008cf9:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0008d00:	74 2e 00 
c0008d03:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008d0a:	00 00 00 
c0008d0d:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0008d14:	00 00 
c0008d16:	83 ec 0c             	sub    $0xc,%esp
c0008d19:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d1f:	50                   	push   %eax
c0008d20:	e8 4b 34 00 00       	call   c000c170 <Strlen>
c0008d25:	83 c4 10             	add    $0x10,%esp
c0008d28:	83 ec 04             	sub    $0x4,%esp
c0008d2b:	50                   	push   %eax
c0008d2c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d32:	50                   	push   %eax
c0008d33:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008d36:	e8 23 d5 ff ff       	call   c000625e <write>
c0008d3b:	83 c4 10             	add    $0x10,%esp
c0008d3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d45:	eb 5c                	jmp    c0008da3 <TestFS+0x35c>
c0008d47:	83 ec 04             	sub    $0x4,%esp
c0008d4a:	6a 1e                	push   $0x1e
c0008d4c:	6a 00                	push   $0x0
c0008d4e:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d54:	50                   	push   %eax
c0008d55:	e8 dd 33 00 00       	call   c000c137 <Memset>
c0008d5a:	83 c4 10             	add    $0x10,%esp
c0008d5d:	83 ec 0c             	sub    $0xc,%esp
c0008d60:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d66:	50                   	push   %eax
c0008d67:	e8 04 34 00 00       	call   c000c170 <Strlen>
c0008d6c:	83 c4 10             	add    $0x10,%esp
c0008d6f:	83 ec 04             	sub    $0x4,%esp
c0008d72:	50                   	push   %eax
c0008d73:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d79:	50                   	push   %eax
c0008d7a:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008d7d:	e8 68 d4 ff ff       	call   c00061ea <read>
c0008d82:	83 c4 10             	add    $0x10,%esp
c0008d85:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008d88:	83 ec 08             	sub    $0x8,%esp
c0008d8b:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d91:	50                   	push   %eax
c0008d92:	68 e6 bc 00 c0       	push   $0xc000bce6
c0008d97:	e8 89 0a 00 00       	call   c0009825 <Printf>
c0008d9c:	83 c4 10             	add    $0x10,%esp
c0008d9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008da3:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008da7:	7e 9e                	jle    c0008d47 <TestFS+0x300>
c0008da9:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0008db0:	6e 73 74 
c0008db3:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0008dba:	6c 6c 2e 
c0008dbd:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0008dc4:	61 72 00 
c0008dc7:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0008dce:	00 00 00 
c0008dd1:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008dd8:	00 00 00 
c0008ddb:	83 ec 08             	sub    $0x8,%esp
c0008dde:	6a 00                	push   $0x0
c0008de0:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008de6:	50                   	push   %eax
c0008de7:	e8 79 d3 ff ff       	call   c0006165 <open>
c0008dec:	83 c4 10             	add    $0x10,%esp
c0008def:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008df2:	83 ec 08             	sub    $0x8,%esp
c0008df5:	ff 75 cc             	pushl  -0x34(%ebp)
c0008df8:	68 f1 bc 00 c0       	push   $0xc000bcf1
c0008dfd:	e8 23 0a 00 00       	call   c0009825 <Printf>
c0008e02:	83 c4 10             	add    $0x10,%esp
c0008e05:	83 ec 04             	sub    $0x4,%esp
c0008e08:	6a 28                	push   $0x28
c0008e0a:	6a 00                	push   $0x0
c0008e0c:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008e12:	50                   	push   %eax
c0008e13:	e8 1f 33 00 00       	call   c000c137 <Memset>
c0008e18:	83 c4 10             	add    $0x10,%esp
c0008e1b:	83 ec 04             	sub    $0x4,%esp
c0008e1e:	6a 28                	push   $0x28
c0008e20:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008e26:	50                   	push   %eax
c0008e27:	ff 75 cc             	pushl  -0x34(%ebp)
c0008e2a:	e8 bb d3 ff ff       	call   c00061ea <read>
c0008e2f:	83 c4 10             	add    $0x10,%esp
c0008e32:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008e35:	83 ec 08             	sub    $0x8,%esp
c0008e38:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008e3e:	50                   	push   %eax
c0008e3f:	68 fb bc 00 c0       	push   $0xc000bcfb
c0008e44:	e8 dc 09 00 00       	call   c0009825 <Printf>
c0008e49:	83 c4 10             	add    $0x10,%esp
c0008e4c:	90                   	nop
c0008e4d:	c9                   	leave  
c0008e4e:	c3                   	ret    

c0008e4f <wait_exit>:
c0008e4f:	55                   	push   %ebp
c0008e50:	89 e5                	mov    %esp,%ebp
c0008e52:	83 ec 28             	sub    $0x28,%esp
c0008e55:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008e5c:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008e63:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008e69:	83 ec 08             	sub    $0x8,%esp
c0008e6c:	6a 02                	push   $0x2
c0008e6e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008e71:	50                   	push   %eax
c0008e72:	e8 ee d2 ff ff       	call   c0006165 <open>
c0008e77:	83 c4 10             	add    $0x10,%esp
c0008e7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e7d:	83 ec 08             	sub    $0x8,%esp
c0008e80:	6a 02                	push   $0x2
c0008e82:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008e85:	50                   	push   %eax
c0008e86:	e8 da d2 ff ff       	call   c0006165 <open>
c0008e8b:	83 c4 10             	add    $0x10,%esp
c0008e8e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e91:	e8 ef d4 ff ff       	call   c0006385 <fork>
c0008e96:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008e99:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008e9d:	7e 25                	jle    c0008ec4 <wait_exit+0x75>
c0008e9f:	83 ec 0c             	sub    $0xc,%esp
c0008ea2:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008ea5:	50                   	push   %eax
c0008ea6:	e8 73 d4 ff ff       	call   c000631e <wait>
c0008eab:	83 c4 10             	add    $0x10,%esp
c0008eae:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008eb1:	83 ec 08             	sub    $0x8,%esp
c0008eb4:	50                   	push   %eax
c0008eb5:	68 06 bd 00 c0       	push   $0xc000bd06
c0008eba:	e8 66 09 00 00       	call   c0009825 <Printf>
c0008ebf:	83 c4 10             	add    $0x10,%esp
c0008ec2:	eb fe                	jmp    c0008ec2 <wait_exit+0x73>
c0008ec4:	83 ec 0c             	sub    $0xc,%esp
c0008ec7:	68 21 bd 00 c0       	push   $0xc000bd21
c0008ecc:	e8 54 09 00 00       	call   c0009825 <Printf>
c0008ed1:	83 c4 10             	add    $0x10,%esp
c0008ed4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008edb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ede:	8d 50 01             	lea    0x1(%eax),%edx
c0008ee1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008ee4:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008ee9:	7f 02                	jg     c0008eed <wait_exit+0x9e>
c0008eeb:	eb ee                	jmp    c0008edb <wait_exit+0x8c>
c0008eed:	90                   	nop
c0008eee:	83 ec 0c             	sub    $0xc,%esp
c0008ef1:	68 2d bd 00 c0       	push   $0xc000bd2d
c0008ef6:	e8 2a 09 00 00       	call   c0009825 <Printf>
c0008efb:	83 c4 10             	add    $0x10,%esp
c0008efe:	83 ec 0c             	sub    $0xc,%esp
c0008f01:	6a 09                	push   $0x9
c0008f03:	e8 54 d4 ff ff       	call   c000635c <exit>
c0008f08:	83 c4 10             	add    $0x10,%esp
c0008f0b:	83 ec 0c             	sub    $0xc,%esp
c0008f0e:	68 3b bd 00 c0       	push   $0xc000bd3b
c0008f13:	e8 0d 09 00 00       	call   c0009825 <Printf>
c0008f18:	83 c4 10             	add    $0x10,%esp
c0008f1b:	eb fe                	jmp    c0008f1b <wait_exit+0xcc>

c0008f1d <INIT_fork>:
c0008f1d:	55                   	push   %ebp
c0008f1e:	89 e5                	mov    %esp,%ebp
c0008f20:	83 ec 78             	sub    $0x78,%esp
c0008f23:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008f2a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008f31:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008f37:	83 ec 08             	sub    $0x8,%esp
c0008f3a:	6a 02                	push   $0x2
c0008f3c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008f3f:	50                   	push   %eax
c0008f40:	e8 20 d2 ff ff       	call   c0006165 <open>
c0008f45:	83 c4 10             	add    $0x10,%esp
c0008f48:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f4b:	83 ec 08             	sub    $0x8,%esp
c0008f4e:	6a 02                	push   $0x2
c0008f50:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008f53:	50                   	push   %eax
c0008f54:	e8 0c d2 ff ff       	call   c0006165 <open>
c0008f59:	83 c4 10             	add    $0x10,%esp
c0008f5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f5f:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008f66:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008f6d:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008f74:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008f7b:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008f82:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008f89:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008f90:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008f97:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008f9e:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008fa5:	83 ec 0c             	sub    $0xc,%esp
c0008fa8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fab:	50                   	push   %eax
c0008fac:	e8 74 08 00 00       	call   c0009825 <Printf>
c0008fb1:	83 c4 10             	add    $0x10,%esp
c0008fb4:	83 ec 0c             	sub    $0xc,%esp
c0008fb7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fba:	50                   	push   %eax
c0008fbb:	e8 b0 31 00 00       	call   c000c170 <Strlen>
c0008fc0:	83 c4 10             	add    $0x10,%esp
c0008fc3:	83 ec 04             	sub    $0x4,%esp
c0008fc6:	50                   	push   %eax
c0008fc7:	6a 00                	push   $0x0
c0008fc9:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fcc:	50                   	push   %eax
c0008fcd:	e8 65 31 00 00       	call   c000c137 <Memset>
c0008fd2:	83 c4 10             	add    $0x10,%esp
c0008fd5:	83 ec 04             	sub    $0x4,%esp
c0008fd8:	6a 28                	push   $0x28
c0008fda:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fdd:	50                   	push   %eax
c0008fde:	ff 75 f0             	pushl  -0x10(%ebp)
c0008fe1:	e8 04 d2 ff ff       	call   c00061ea <read>
c0008fe6:	83 c4 10             	add    $0x10,%esp
c0008fe9:	83 ec 0c             	sub    $0xc,%esp
c0008fec:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fef:	50                   	push   %eax
c0008ff0:	e8 30 08 00 00       	call   c0009825 <Printf>
c0008ff5:	83 c4 10             	add    $0x10,%esp
c0008ff8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008fff:	e8 81 d3 ff ff       	call   c0006385 <fork>
c0009004:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009007:	66 87 db             	;xchg   %bx,%bx
c000900a:	83 ec 0c             	sub    $0xc,%esp
c000900d:	6a 01                	push   $0x1
c000900f:	e8 dd 06 00 00       	call   c00096f1 <delay>
c0009014:	83 c4 10             	add    $0x10,%esp
c0009017:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000901b:	0f 8e c5 00 00 00    	jle    c00090e6 <INIT_fork+0x1c9>
c0009021:	83 ec 0c             	sub    $0xc,%esp
c0009024:	68 49 bd 00 c0       	push   $0xc000bd49
c0009029:	e8 f7 07 00 00       	call   c0009825 <Printf>
c000902e:	83 c4 10             	add    $0x10,%esp
c0009031:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009035:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c000903c:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0009043:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c000904a:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0009051:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0009058:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c000905f:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0009066:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c000906d:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0009074:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c000907b:	83 ec 0c             	sub    $0xc,%esp
c000907e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009081:	50                   	push   %eax
c0009082:	e8 e9 30 00 00       	call   c000c170 <Strlen>
c0009087:	83 c4 10             	add    $0x10,%esp
c000908a:	83 ec 04             	sub    $0x4,%esp
c000908d:	50                   	push   %eax
c000908e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009091:	50                   	push   %eax
c0009092:	ff 75 f4             	pushl  -0xc(%ebp)
c0009095:	e8 c4 d1 ff ff       	call   c000625e <write>
c000909a:	83 c4 10             	add    $0x10,%esp
c000909d:	83 ec 0c             	sub    $0xc,%esp
c00090a0:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090a3:	50                   	push   %eax
c00090a4:	e8 c7 30 00 00       	call   c000c170 <Strlen>
c00090a9:	83 c4 10             	add    $0x10,%esp
c00090ac:	83 ec 04             	sub    $0x4,%esp
c00090af:	50                   	push   %eax
c00090b0:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090b3:	50                   	push   %eax
c00090b4:	ff 75 f4             	pushl  -0xc(%ebp)
c00090b7:	e8 a2 d1 ff ff       	call   c000625e <write>
c00090bc:	83 c4 10             	add    $0x10,%esp
c00090bf:	83 ec 0c             	sub    $0xc,%esp
c00090c2:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090c5:	50                   	push   %eax
c00090c6:	e8 a5 30 00 00       	call   c000c170 <Strlen>
c00090cb:	83 c4 10             	add    $0x10,%esp
c00090ce:	83 ec 04             	sub    $0x4,%esp
c00090d1:	50                   	push   %eax
c00090d2:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090d5:	50                   	push   %eax
c00090d6:	ff 75 f4             	pushl  -0xc(%ebp)
c00090d9:	e8 80 d1 ff ff       	call   c000625e <write>
c00090de:	83 c4 10             	add    $0x10,%esp
c00090e1:	e9 c6 00 00 00       	jmp    c00091ac <INIT_fork+0x28f>
c00090e6:	83 ec 0c             	sub    $0xc,%esp
c00090e9:	6a 01                	push   $0x1
c00090eb:	e8 01 06 00 00       	call   c00096f1 <delay>
c00090f0:	83 c4 10             	add    $0x10,%esp
c00090f3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00090f7:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c00090fb:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0009102:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0009109:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0009110:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0009117:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c000911e:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0009125:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c000912c:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0009133:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c000913a:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0009141:	66 87 db             	;xchg   %bx,%bx
c0009144:	83 ec 0c             	sub    $0xc,%esp
c0009147:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000914a:	50                   	push   %eax
c000914b:	e8 20 30 00 00       	call   c000c170 <Strlen>
c0009150:	83 c4 10             	add    $0x10,%esp
c0009153:	83 ec 04             	sub    $0x4,%esp
c0009156:	50                   	push   %eax
c0009157:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000915a:	50                   	push   %eax
c000915b:	ff 75 f4             	pushl  -0xc(%ebp)
c000915e:	e8 fb d0 ff ff       	call   c000625e <write>
c0009163:	83 c4 10             	add    $0x10,%esp
c0009166:	83 ec 0c             	sub    $0xc,%esp
c0009169:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000916c:	50                   	push   %eax
c000916d:	e8 fe 2f 00 00       	call   c000c170 <Strlen>
c0009172:	83 c4 10             	add    $0x10,%esp
c0009175:	83 ec 04             	sub    $0x4,%esp
c0009178:	50                   	push   %eax
c0009179:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000917c:	50                   	push   %eax
c000917d:	ff 75 f4             	pushl  -0xc(%ebp)
c0009180:	e8 d9 d0 ff ff       	call   c000625e <write>
c0009185:	83 c4 10             	add    $0x10,%esp
c0009188:	83 ec 0c             	sub    $0xc,%esp
c000918b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000918e:	50                   	push   %eax
c000918f:	e8 dc 2f 00 00       	call   c000c170 <Strlen>
c0009194:	83 c4 10             	add    $0x10,%esp
c0009197:	83 ec 04             	sub    $0x4,%esp
c000919a:	50                   	push   %eax
c000919b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000919e:	50                   	push   %eax
c000919f:	ff 75 f4             	pushl  -0xc(%ebp)
c00091a2:	e8 b7 d0 ff ff       	call   c000625e <write>
c00091a7:	83 c4 10             	add    $0x10,%esp
c00091aa:	eb fe                	jmp    c00091aa <INIT_fork+0x28d>
c00091ac:	83 ec 04             	sub    $0x4,%esp
c00091af:	6a 28                	push   $0x28
c00091b1:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091b4:	50                   	push   %eax
c00091b5:	ff 75 f0             	pushl  -0x10(%ebp)
c00091b8:	e8 2d d0 ff ff       	call   c00061ea <read>
c00091bd:	83 c4 10             	add    $0x10,%esp
c00091c0:	83 ec 0c             	sub    $0xc,%esp
c00091c3:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091c6:	50                   	push   %eax
c00091c7:	e8 59 06 00 00       	call   c0009825 <Printf>
c00091cc:	83 c4 10             	add    $0x10,%esp
c00091cf:	83 ec 0c             	sub    $0xc,%esp
c00091d2:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091d5:	50                   	push   %eax
c00091d6:	e8 4a 06 00 00       	call   c0009825 <Printf>
c00091db:	83 c4 10             	add    $0x10,%esp
c00091de:	83 ec 0c             	sub    $0xc,%esp
c00091e1:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091e4:	50                   	push   %eax
c00091e5:	e8 3b 06 00 00       	call   c0009825 <Printf>
c00091ea:	83 c4 10             	add    $0x10,%esp
c00091ed:	83 ec 0c             	sub    $0xc,%esp
c00091f0:	68 4f bd 00 c0       	push   $0xc000bd4f
c00091f5:	e8 44 09 00 00       	call   c0009b3e <spin>
c00091fa:	83 c4 10             	add    $0x10,%esp
c00091fd:	90                   	nop
c00091fe:	c9                   	leave  
c00091ff:	c3                   	ret    

c0009200 <simple_shell>:
c0009200:	55                   	push   %ebp
c0009201:	89 e5                	mov    %esp,%ebp
c0009203:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0009209:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0009210:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0009217:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c000921d:	83 ec 08             	sub    $0x8,%esp
c0009220:	6a 02                	push   $0x2
c0009222:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009225:	50                   	push   %eax
c0009226:	e8 3a cf ff ff       	call   c0006165 <open>
c000922b:	83 c4 10             	add    $0x10,%esp
c000922e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009231:	83 ec 08             	sub    $0x8,%esp
c0009234:	6a 02                	push   $0x2
c0009236:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009239:	50                   	push   %eax
c000923a:	e8 26 cf ff ff       	call   c0006165 <open>
c000923f:	83 c4 10             	add    $0x10,%esp
c0009242:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009245:	83 ec 04             	sub    $0x4,%esp
c0009248:	68 80 00 00 00       	push   $0x80
c000924d:	6a 00                	push   $0x0
c000924f:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009255:	50                   	push   %eax
c0009256:	e8 dc 2e 00 00       	call   c000c137 <Memset>
c000925b:	83 c4 10             	add    $0x10,%esp
c000925e:	83 ec 04             	sub    $0x4,%esp
c0009261:	68 80 00 00 00       	push   $0x80
c0009266:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000926c:	50                   	push   %eax
c000926d:	ff 75 e0             	pushl  -0x20(%ebp)
c0009270:	e8 75 cf ff ff       	call   c00061ea <read>
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
c00092a0:	74 1d                	je     c00092bf <simple_shell+0xbf>
c00092a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092a5:	0f b6 00             	movzbl (%eax),%eax
c00092a8:	84 c0                	test   %al,%al
c00092aa:	74 13                	je     c00092bf <simple_shell+0xbf>
c00092ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00092b0:	75 0d                	jne    c00092bf <simple_shell+0xbf>
c00092b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00092b8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00092bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092c2:	0f b6 00             	movzbl (%eax),%eax
c00092c5:	3c 20                	cmp    $0x20,%al
c00092c7:	74 0a                	je     c00092d3 <simple_shell+0xd3>
c00092c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092cc:	0f b6 00             	movzbl (%eax),%eax
c00092cf:	84 c0                	test   %al,%al
c00092d1:	75 26                	jne    c00092f9 <simple_shell+0xf9>
c00092d3:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00092d7:	75 20                	jne    c00092f9 <simple_shell+0xf9>
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
c0009301:	75 8c                	jne    c000928f <simple_shell+0x8f>
c0009303:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009306:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c000930d:	00 00 00 00 
c0009311:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0009318:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c000931e:	83 ec 08             	sub    $0x8,%esp
c0009321:	6a 02                	push   $0x2
c0009323:	50                   	push   %eax
c0009324:	e8 3c ce ff ff       	call   c0006165 <open>
c0009329:	83 c4 10             	add    $0x10,%esp
c000932c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000932f:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0009333:	75 54                	jne    c0009389 <simple_shell+0x189>
c0009335:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000933c:	eb 29                	jmp    c0009367 <simple_shell+0x167>
c000933e:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0009344:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009347:	01 d0                	add    %edx,%eax
c0009349:	0f b6 00             	movzbl (%eax),%eax
c000934c:	0f be c0             	movsbl %al,%eax
c000934f:	83 ec 04             	sub    $0x4,%esp
c0009352:	50                   	push   %eax
c0009353:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009356:	68 57 bd 00 c0       	push   $0xc000bd57
c000935b:	e8 c5 04 00 00       	call   c0009825 <Printf>
c0009360:	83 c4 10             	add    $0x10,%esp
c0009363:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0009367:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c000936b:	7e d1                	jle    c000933e <simple_shell+0x13e>
c000936d:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0009373:	83 ec 08             	sub    $0x8,%esp
c0009376:	50                   	push   %eax
c0009377:	68 5e bd 00 c0       	push   $0xc000bd5e
c000937c:	e8 a4 04 00 00       	call   c0009825 <Printf>
c0009381:	83 c4 10             	add    $0x10,%esp
c0009384:	e9 bc fe ff ff       	jmp    c0009245 <simple_shell+0x45>
c0009389:	e8 f7 cf ff ff       	call   c0006385 <fork>
c000938e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009391:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0009395:	7e 17                	jle    c00093ae <simple_shell+0x1ae>
c0009397:	83 ec 0c             	sub    $0xc,%esp
c000939a:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00093a0:	50                   	push   %eax
c00093a1:	e8 78 cf ff ff       	call   c000631e <wait>
c00093a6:	83 c4 10             	add    $0x10,%esp
c00093a9:	e9 97 fe ff ff       	jmp    c0009245 <simple_shell+0x45>
c00093ae:	83 ec 0c             	sub    $0xc,%esp
c00093b1:	ff 75 d0             	pushl  -0x30(%ebp)
c00093b4:	e8 19 cf ff ff       	call   c00062d2 <close>
c00093b9:	83 c4 10             	add    $0x10,%esp
c00093bc:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00093c2:	83 ec 08             	sub    $0x8,%esp
c00093c5:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c00093cb:	52                   	push   %edx
c00093cc:	50                   	push   %eax
c00093cd:	e8 a2 d0 ff ff       	call   c0006474 <execv>
c00093d2:	83 c4 10             	add    $0x10,%esp
c00093d5:	eb fe                	jmp    c00093d5 <simple_shell+0x1d5>

c00093d7 <test_split_str>:
c00093d7:	55                   	push   %ebp
c00093d8:	89 e5                	mov    %esp,%ebp
c00093da:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c00093e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00093e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00093ee:	c7 45 ec 64 bd 00 c0 	movl   $0xc000bd64,-0x14(%ebp)
c00093f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00093f9:	75 1a                	jne    c0009415 <test_split_str+0x3e>
c00093fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093fe:	0f b6 00             	movzbl (%eax),%eax
c0009401:	0f be c0             	movsbl %al,%eax
c0009404:	83 ec 08             	sub    $0x8,%esp
c0009407:	50                   	push   %eax
c0009408:	68 75 bd 00 c0       	push   $0xc000bd75
c000940d:	e8 13 04 00 00       	call   c0009825 <Printf>
c0009412:	83 c4 10             	add    $0x10,%esp
c0009415:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009418:	0f b6 00             	movzbl (%eax),%eax
c000941b:	3c 20                	cmp    $0x20,%al
c000941d:	75 0a                	jne    c0009429 <test_split_str+0x52>
c000941f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009422:	0f b6 00             	movzbl (%eax),%eax
c0009425:	84 c0                	test   %al,%al
c0009427:	74 13                	je     c000943c <test_split_str+0x65>
c0009429:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000942d:	75 0d                	jne    c000943c <test_split_str+0x65>
c000942f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009432:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009435:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000943c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000943f:	0f b6 00             	movzbl (%eax),%eax
c0009442:	3c 20                	cmp    $0x20,%al
c0009444:	74 0a                	je     c0009450 <test_split_str+0x79>
c0009446:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009449:	0f b6 00             	movzbl (%eax),%eax
c000944c:	84 c0                	test   %al,%al
c000944e:	75 26                	jne    c0009476 <test_split_str+0x9f>
c0009450:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0009454:	75 20                	jne    c0009476 <test_split_str+0x9f>
c0009456:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009459:	8d 50 01             	lea    0x1(%eax),%edx
c000945c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000945f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009462:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0009469:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000946c:	c6 00 00             	movb   $0x0,(%eax)
c000946f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009476:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000947a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000947d:	0f b6 00             	movzbl (%eax),%eax
c0009480:	84 c0                	test   %al,%al
c0009482:	0f 85 6d ff ff ff    	jne    c00093f5 <test_split_str+0x1e>
c0009488:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000948b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000948e:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0009495:	83 ec 08             	sub    $0x8,%esp
c0009498:	ff 75 f4             	pushl  -0xc(%ebp)
c000949b:	68 7e bd 00 c0       	push   $0xc000bd7e
c00094a0:	e8 80 03 00 00       	call   c0009825 <Printf>
c00094a5:	83 c4 10             	add    $0x10,%esp
c00094a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00094af:	eb 22                	jmp    c00094d3 <test_split_str+0xfc>
c00094b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094b4:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c00094bb:	83 ec 04             	sub    $0x4,%esp
c00094be:	50                   	push   %eax
c00094bf:	ff 75 e4             	pushl  -0x1c(%ebp)
c00094c2:	68 95 bd 00 c0       	push   $0xc000bd95
c00094c7:	e8 59 03 00 00       	call   c0009825 <Printf>
c00094cc:	83 c4 10             	add    $0x10,%esp
c00094cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00094d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094d6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c00094d9:	7e d6                	jle    c00094b1 <test_split_str+0xda>
c00094db:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00094e1:	83 ec 08             	sub    $0x8,%esp
c00094e4:	68 a4 bd 00 c0       	push   $0xc000bda4
c00094e9:	50                   	push   %eax
c00094ea:	e8 1b 13 00 00       	call   c000a80a <strcmp>
c00094ef:	83 c4 10             	add    $0x10,%esp
c00094f2:	85 c0                	test   %eax,%eax
c00094f4:	75 10                	jne    c0009506 <test_split_str+0x12f>
c00094f6:	83 ec 0c             	sub    $0xc,%esp
c00094f9:	68 a9 bd 00 c0       	push   $0xc000bda9
c00094fe:	e8 22 03 00 00       	call   c0009825 <Printf>
c0009503:	83 c4 10             	add    $0x10,%esp
c0009506:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c000950c:	83 ec 08             	sub    $0x8,%esp
c000950f:	50                   	push   %eax
c0009510:	68 b5 bd 00 c0       	push   $0xc000bdb5
c0009515:	e8 0b 03 00 00       	call   c0009825 <Printf>
c000951a:	83 c4 10             	add    $0x10,%esp
c000951d:	83 ec 0c             	sub    $0xc,%esp
c0009520:	68 c3 bd 00 c0       	push   $0xc000bdc3
c0009525:	e8 fb 02 00 00       	call   c0009825 <Printf>
c000952a:	83 c4 10             	add    $0x10,%esp
c000952d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009534:	eb 26                	jmp    c000955c <test_split_str+0x185>
c0009536:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c000953c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000953f:	01 d0                	add    %edx,%eax
c0009541:	0f b6 00             	movzbl (%eax),%eax
c0009544:	0f be c0             	movsbl %al,%eax
c0009547:	83 ec 08             	sub    $0x8,%esp
c000954a:	50                   	push   %eax
c000954b:	68 d2 bd 00 c0       	push   $0xc000bdd2
c0009550:	e8 d0 02 00 00       	call   c0009825 <Printf>
c0009555:	83 c4 10             	add    $0x10,%esp
c0009558:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000955c:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0009560:	7e d4                	jle    c0009536 <test_split_str+0x15f>
c0009562:	c9                   	leave  
c0009563:	c3                   	ret    

c0009564 <test_shell>:
c0009564:	55                   	push   %ebp
c0009565:	89 e5                	mov    %esp,%ebp
c0009567:	83 ec 38             	sub    $0x38,%esp
c000956a:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0009571:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009578:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c000957e:	83 ec 08             	sub    $0x8,%esp
c0009581:	6a 02                	push   $0x2
c0009583:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0009586:	50                   	push   %eax
c0009587:	e8 d9 cb ff ff       	call   c0006165 <open>
c000958c:	83 c4 10             	add    $0x10,%esp
c000958f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009592:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0009599:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00095a0:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00095a7:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00095ae:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c00095b5:	83 ec 0c             	sub    $0xc,%esp
c00095b8:	68 db bd 00 c0       	push   $0xc000bddb
c00095bd:	e8 63 02 00 00       	call   c0009825 <Printf>
c00095c2:	83 c4 10             	add    $0x10,%esp
c00095c5:	83 ec 0c             	sub    $0xc,%esp
c00095c8:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c00095cb:	50                   	push   %eax
c00095cc:	e8 c3 e6 ff ff       	call   c0007c94 <untar>
c00095d1:	83 c4 10             	add    $0x10,%esp
c00095d4:	83 ec 0c             	sub    $0xc,%esp
c00095d7:	68 eb bd 00 c0       	push   $0xc000bdeb
c00095dc:	e8 44 02 00 00       	call   c0009825 <Printf>
c00095e1:	83 c4 10             	add    $0x10,%esp
c00095e4:	90                   	nop
c00095e5:	c9                   	leave  
c00095e6:	c3                   	ret    

c00095e7 <test_exec>:
c00095e7:	55                   	push   %ebp
c00095e8:	89 e5                	mov    %esp,%ebp
c00095ea:	83 ec 38             	sub    $0x38,%esp
c00095ed:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c00095f4:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c00095fb:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0009601:	83 ec 08             	sub    $0x8,%esp
c0009604:	6a 02                	push   $0x2
c0009606:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0009609:	50                   	push   %eax
c000960a:	e8 56 cb ff ff       	call   c0006165 <open>
c000960f:	83 c4 10             	add    $0x10,%esp
c0009612:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009615:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c000961c:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0009623:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c000962a:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0009631:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0009638:	83 ec 0c             	sub    $0xc,%esp
c000963b:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c000963e:	50                   	push   %eax
c000963f:	e8 50 e6 ff ff       	call   c0007c94 <untar>
c0009644:	83 c4 10             	add    $0x10,%esp
c0009647:	e8 39 cd ff ff       	call   c0006385 <fork>
c000964c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000964f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009653:	7e 25                	jle    c000967a <test_exec+0x93>
c0009655:	83 ec 0c             	sub    $0xc,%esp
c0009658:	8d 45 cc             	lea    -0x34(%ebp),%eax
c000965b:	50                   	push   %eax
c000965c:	e8 bd cc ff ff       	call   c000631e <wait>
c0009661:	83 c4 10             	add    $0x10,%esp
c0009664:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009667:	83 ec 08             	sub    $0x8,%esp
c000966a:	50                   	push   %eax
c000966b:	68 f9 bd 00 c0       	push   $0xc000bdf9
c0009670:	e8 b0 01 00 00       	call   c0009825 <Printf>
c0009675:	83 c4 10             	add    $0x10,%esp
c0009678:	eb 33                	jmp    c00096ad <test_exec+0xc6>
c000967a:	83 ec 0c             	sub    $0xc,%esp
c000967d:	68 eb bd 00 c0       	push   $0xc000bdeb
c0009682:	e8 9e 01 00 00       	call   c0009825 <Printf>
c0009687:	83 c4 10             	add    $0x10,%esp
c000968a:	83 ec 0c             	sub    $0xc,%esp
c000968d:	6a 00                	push   $0x0
c000968f:	68 0b be 00 c0       	push   $0xc000be0b
c0009694:	68 11 be 00 c0       	push   $0xc000be11
c0009699:	68 a4 bd 00 c0       	push   $0xc000bda4
c000969e:	68 17 be 00 c0       	push   $0xc000be17
c00096a3:	e8 71 cf ff ff       	call   c0006619 <execl>
c00096a8:	83 c4 20             	add    $0x20,%esp
c00096ab:	eb fe                	jmp    c00096ab <test_exec+0xc4>
c00096ad:	c9                   	leave  
c00096ae:	c3                   	ret    

c00096af <INIT>:
c00096af:	55                   	push   %ebp
c00096b0:	89 e5                	mov    %esp,%ebp
c00096b2:	83 ec 08             	sub    $0x8,%esp
c00096b5:	e8 aa fe ff ff       	call   c0009564 <test_shell>
c00096ba:	eb fe                	jmp    c00096ba <INIT+0xb>

c00096bc <TestA>:
c00096bc:	55                   	push   %ebp
c00096bd:	89 e5                	mov    %esp,%ebp
c00096bf:	83 ec 08             	sub    $0x8,%esp
c00096c2:	83 ec 0c             	sub    $0xc,%esp
c00096c5:	6a 05                	push   $0x5
c00096c7:	e8 af e8 ff ff       	call   c0007f7b <disp_int>
c00096cc:	83 c4 10             	add    $0x10,%esp
c00096cf:	83 ec 0c             	sub    $0xc,%esp
c00096d2:	68 34 b9 00 c0       	push   $0xc000b934
c00096d7:	e8 b0 7e ff ff       	call   c000158c <disp_str>
c00096dc:	83 c4 10             	add    $0x10,%esp
c00096df:	83 ec 0c             	sub    $0xc,%esp
c00096e2:	68 1d be 00 c0       	push   $0xc000be1d
c00096e7:	e8 a0 7e ff ff       	call   c000158c <disp_str>
c00096ec:	83 c4 10             	add    $0x10,%esp
c00096ef:	eb fe                	jmp    c00096ef <TestA+0x33>

c00096f1 <delay>:
c00096f1:	55                   	push   %ebp
c00096f2:	89 e5                	mov    %esp,%ebp
c00096f4:	83 ec 10             	sub    $0x10,%esp
c00096f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00096fe:	eb 2a                	jmp    c000972a <delay+0x39>
c0009700:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0009707:	eb 17                	jmp    c0009720 <delay+0x2f>
c0009709:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009710:	eb 04                	jmp    c0009716 <delay+0x25>
c0009712:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009716:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000971a:	7e f6                	jle    c0009712 <delay+0x21>
c000971c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009720:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0009724:	7e e3                	jle    c0009709 <delay+0x18>
c0009726:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000972a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000972d:	3b 45 08             	cmp    0x8(%ebp),%eax
c0009730:	7c ce                	jl     c0009700 <delay+0xf>
c0009732:	90                   	nop
c0009733:	c9                   	leave  
c0009734:	c3                   	ret    

c0009735 <TestB>:
c0009735:	55                   	push   %ebp
c0009736:	89 e5                	mov    %esp,%ebp
c0009738:	83 ec 08             	sub    $0x8,%esp
c000973b:	83 ec 0c             	sub    $0xc,%esp
c000973e:	68 24 be 00 c0       	push   $0xc000be24
c0009743:	e8 44 7e ff ff       	call   c000158c <disp_str>
c0009748:	83 c4 10             	add    $0x10,%esp
c000974b:	eb fe                	jmp    c000974b <TestB+0x16>

c000974d <TestC>:
c000974d:	55                   	push   %ebp
c000974e:	89 e5                	mov    %esp,%ebp
c0009750:	83 ec 18             	sub    $0x18,%esp
c0009753:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000975a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c000975e:	77 1a                	ja     c000977a <TestC+0x2d>
c0009760:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0009767:	83 ec 08             	sub    $0x8,%esp
c000976a:	ff 75 f0             	pushl  -0x10(%ebp)
c000976d:	68 27 be 00 c0       	push   $0xc000be27
c0009772:	e8 ae 00 00 00       	call   c0009825 <Printf>
c0009777:	83 c4 10             	add    $0x10,%esp
c000977a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000977e:	eb da                	jmp    c000975a <TestC+0xd>

c0009780 <sys_get_ticks>:
c0009780:	55                   	push   %ebp
c0009781:	89 e5                	mov    %esp,%ebp
c0009783:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0009788:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000978e:	5d                   	pop    %ebp
c000978f:	c3                   	ret    

c0009790 <sys_write>:
c0009790:	55                   	push   %ebp
c0009791:	89 e5                	mov    %esp,%ebp
c0009793:	83 ec 18             	sub    $0x18,%esp
c0009796:	8b 45 10             	mov    0x10(%ebp),%eax
c0009799:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c000979f:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00097a5:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00097aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00097ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c00097b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00097b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00097b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00097b9:	eb 20                	jmp    c00097db <sys_write+0x4b>
c00097bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097be:	0f b6 00             	movzbl (%eax),%eax
c00097c1:	0f b6 c0             	movzbl %al,%eax
c00097c4:	83 ec 08             	sub    $0x8,%esp
c00097c7:	50                   	push   %eax
c00097c8:	ff 75 ec             	pushl  -0x14(%ebp)
c00097cb:	e8 16 bd ff ff       	call   c00054e6 <out_char>
c00097d0:	83 c4 10             	add    $0x10,%esp
c00097d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00097d7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00097db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00097df:	7f da                	jg     c00097bb <sys_write+0x2b>
c00097e1:	90                   	nop
c00097e2:	c9                   	leave  
c00097e3:	c3                   	ret    

c00097e4 <milli_delay>:
c00097e4:	55                   	push   %ebp
c00097e5:	89 e5                	mov    %esp,%ebp
c00097e7:	83 ec 18             	sub    $0x18,%esp
c00097ea:	e8 47 0e 00 00       	call   c000a636 <get_ticks_ipc>
c00097ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00097f2:	90                   	nop
c00097f3:	e8 3e 0e 00 00       	call   c000a636 <get_ticks_ipc>
c00097f8:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00097fb:	89 c1                	mov    %eax,%ecx
c00097fd:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0009802:	89 c8                	mov    %ecx,%eax
c0009804:	f7 ea                	imul   %edx
c0009806:	c1 fa 05             	sar    $0x5,%edx
c0009809:	89 c8                	mov    %ecx,%eax
c000980b:	c1 f8 1f             	sar    $0x1f,%eax
c000980e:	29 c2                	sub    %eax,%edx
c0009810:	89 d0                	mov    %edx,%eax
c0009812:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0009818:	39 45 08             	cmp    %eax,0x8(%ebp)
c000981b:	77 d6                	ja     c00097f3 <milli_delay+0xf>
c000981d:	90                   	nop
c000981e:	c9                   	leave  
c000981f:	c3                   	ret    

c0009820 <TaskSys>:
c0009820:	55                   	push   %ebp
c0009821:	89 e5                	mov    %esp,%ebp
c0009823:	eb fe                	jmp    c0009823 <TaskSys+0x3>

c0009825 <Printf>:
c0009825:	55                   	push   %ebp
c0009826:	89 e5                	mov    %esp,%ebp
c0009828:	81 ec 18 01 00 00    	sub    $0x118,%esp
c000982e:	83 ec 04             	sub    $0x4,%esp
c0009831:	68 00 01 00 00       	push   $0x100
c0009836:	6a 00                	push   $0x0
c0009838:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000983e:	50                   	push   %eax
c000983f:	e8 f3 28 00 00       	call   c000c137 <Memset>
c0009844:	83 c4 10             	add    $0x10,%esp
c0009847:	8d 45 0c             	lea    0xc(%ebp),%eax
c000984a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000984d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009850:	83 ec 04             	sub    $0x4,%esp
c0009853:	ff 75 f4             	pushl  -0xc(%ebp)
c0009856:	50                   	push   %eax
c0009857:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000985d:	50                   	push   %eax
c000985e:	e8 20 00 00 00       	call   c0009883 <vsprintf>
c0009863:	83 c4 10             	add    $0x10,%esp
c0009866:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009869:	83 ec 04             	sub    $0x4,%esp
c000986c:	ff 75 f0             	pushl  -0x10(%ebp)
c000986f:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009875:	50                   	push   %eax
c0009876:	6a 00                	push   $0x0
c0009878:	e8 e1 c9 ff ff       	call   c000625e <write>
c000987d:	83 c4 10             	add    $0x10,%esp
c0009880:	90                   	nop
c0009881:	c9                   	leave  
c0009882:	c3                   	ret    

c0009883 <vsprintf>:
c0009883:	55                   	push   %ebp
c0009884:	89 e5                	mov    %esp,%ebp
c0009886:	81 ec 68 02 00 00    	sub    $0x268,%esp
c000988c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009892:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0009898:	83 ec 04             	sub    $0x4,%esp
c000989b:	6a 40                	push   $0x40
c000989d:	6a 00                	push   $0x0
c000989f:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00098a5:	50                   	push   %eax
c00098a6:	e8 8c 28 00 00       	call   c000c137 <Memset>
c00098ab:	83 c4 10             	add    $0x10,%esp
c00098ae:	8b 45 10             	mov    0x10(%ebp),%eax
c00098b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00098b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00098bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00098be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00098c1:	e9 53 01 00 00       	jmp    c0009a19 <vsprintf+0x196>
c00098c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00098c9:	0f b6 00             	movzbl (%eax),%eax
c00098cc:	3c 25                	cmp    $0x25,%al
c00098ce:	74 16                	je     c00098e6 <vsprintf+0x63>
c00098d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098d3:	8d 50 01             	lea    0x1(%eax),%edx
c00098d6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00098d9:	8b 55 0c             	mov    0xc(%ebp),%edx
c00098dc:	0f b6 12             	movzbl (%edx),%edx
c00098df:	88 10                	mov    %dl,(%eax)
c00098e1:	e9 2f 01 00 00       	jmp    c0009a15 <vsprintf+0x192>
c00098e6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00098ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c00098ed:	0f b6 00             	movzbl (%eax),%eax
c00098f0:	0f be c0             	movsbl %al,%eax
c00098f3:	83 f8 64             	cmp    $0x64,%eax
c00098f6:	74 26                	je     c000991e <vsprintf+0x9b>
c00098f8:	83 f8 64             	cmp    $0x64,%eax
c00098fb:	7f 0e                	jg     c000990b <vsprintf+0x88>
c00098fd:	83 f8 63             	cmp    $0x63,%eax
c0009900:	0f 84 f2 00 00 00    	je     c00099f8 <vsprintf+0x175>
c0009906:	e9 0a 01 00 00       	jmp    c0009a15 <vsprintf+0x192>
c000990b:	83 f8 73             	cmp    $0x73,%eax
c000990e:	0f 84 b0 00 00 00    	je     c00099c4 <vsprintf+0x141>
c0009914:	83 f8 78             	cmp    $0x78,%eax
c0009917:	74 5d                	je     c0009976 <vsprintf+0xf3>
c0009919:	e9 f7 00 00 00       	jmp    c0009a15 <vsprintf+0x192>
c000991e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009921:	8b 00                	mov    (%eax),%eax
c0009923:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009926:	83 ec 04             	sub    $0x4,%esp
c0009929:	6a 0a                	push   $0xa
c000992b:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009931:	50                   	push   %eax
c0009932:	ff 75 e8             	pushl  -0x18(%ebp)
c0009935:	e8 47 0d 00 00       	call   c000a681 <itoa>
c000993a:	83 c4 10             	add    $0x10,%esp
c000993d:	83 ec 08             	sub    $0x8,%esp
c0009940:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009946:	50                   	push   %eax
c0009947:	ff 75 f4             	pushl  -0xc(%ebp)
c000994a:	e8 07 28 00 00       	call   c000c156 <Strcpy>
c000994f:	83 c4 10             	add    $0x10,%esp
c0009952:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009956:	83 ec 0c             	sub    $0xc,%esp
c0009959:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000995f:	50                   	push   %eax
c0009960:	e8 0b 28 00 00       	call   c000c170 <Strlen>
c0009965:	83 c4 10             	add    $0x10,%esp
c0009968:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000996b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000996e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009971:	e9 9f 00 00 00       	jmp    c0009a15 <vsprintf+0x192>
c0009976:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009979:	8b 00                	mov    (%eax),%eax
c000997b:	83 ec 08             	sub    $0x8,%esp
c000997e:	50                   	push   %eax
c000997f:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009985:	50                   	push   %eax
c0009986:	e8 4a e5 ff ff       	call   c0007ed5 <atoi>
c000998b:	83 c4 10             	add    $0x10,%esp
c000998e:	83 ec 08             	sub    $0x8,%esp
c0009991:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009997:	50                   	push   %eax
c0009998:	ff 75 f4             	pushl  -0xc(%ebp)
c000999b:	e8 b6 27 00 00       	call   c000c156 <Strcpy>
c00099a0:	83 c4 10             	add    $0x10,%esp
c00099a3:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00099a7:	83 ec 0c             	sub    $0xc,%esp
c00099aa:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00099b0:	50                   	push   %eax
c00099b1:	e8 ba 27 00 00       	call   c000c170 <Strlen>
c00099b6:	83 c4 10             	add    $0x10,%esp
c00099b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00099bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099bf:	01 45 f4             	add    %eax,-0xc(%ebp)
c00099c2:	eb 51                	jmp    c0009a15 <vsprintf+0x192>
c00099c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099c7:	8b 00                	mov    (%eax),%eax
c00099c9:	83 ec 08             	sub    $0x8,%esp
c00099cc:	50                   	push   %eax
c00099cd:	ff 75 f4             	pushl  -0xc(%ebp)
c00099d0:	e8 81 27 00 00       	call   c000c156 <Strcpy>
c00099d5:	83 c4 10             	add    $0x10,%esp
c00099d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099db:	8b 00                	mov    (%eax),%eax
c00099dd:	83 ec 0c             	sub    $0xc,%esp
c00099e0:	50                   	push   %eax
c00099e1:	e8 8a 27 00 00       	call   c000c170 <Strlen>
c00099e6:	83 c4 10             	add    $0x10,%esp
c00099e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00099ec:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00099f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099f3:	01 45 f4             	add    %eax,-0xc(%ebp)
c00099f6:	eb 1d                	jmp    c0009a15 <vsprintf+0x192>
c00099f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099fb:	0f b6 10             	movzbl (%eax),%edx
c00099fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a01:	88 10                	mov    %dl,(%eax)
c0009a03:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009a07:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009a0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009a11:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009a14:	90                   	nop
c0009a15:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009a19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a1c:	0f b6 00             	movzbl (%eax),%eax
c0009a1f:	84 c0                	test   %al,%al
c0009a21:	0f 85 9f fe ff ff    	jne    c00098c6 <vsprintf+0x43>
c0009a27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a2a:	2b 45 08             	sub    0x8(%ebp),%eax
c0009a2d:	c9                   	leave  
c0009a2e:	c3                   	ret    

c0009a2f <printx>:
c0009a2f:	55                   	push   %ebp
c0009a30:	89 e5                	mov    %esp,%ebp
c0009a32:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009a38:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009a3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a41:	83 ec 04             	sub    $0x4,%esp
c0009a44:	ff 75 f4             	pushl  -0xc(%ebp)
c0009a47:	50                   	push   %eax
c0009a48:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a4e:	50                   	push   %eax
c0009a4f:	e8 2f fe ff ff       	call   c0009883 <vsprintf>
c0009a54:	83 c4 10             	add    $0x10,%esp
c0009a57:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a5a:	83 ec 08             	sub    $0x8,%esp
c0009a5d:	ff 75 f0             	pushl  -0x10(%ebp)
c0009a60:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a66:	50                   	push   %eax
c0009a67:	e8 dc 8e ff ff       	call   c0002948 <write_debug>
c0009a6c:	83 c4 10             	add    $0x10,%esp
c0009a6f:	90                   	nop
c0009a70:	c9                   	leave  
c0009a71:	c3                   	ret    

c0009a72 <sys_printx>:
c0009a72:	55                   	push   %ebp
c0009a73:	89 e5                	mov    %esp,%ebp
c0009a75:	83 ec 28             	sub    $0x28,%esp
c0009a78:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009a7d:	85 c0                	test   %eax,%eax
c0009a7f:	75 15                	jne    c0009a96 <sys_printx+0x24>
c0009a81:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a84:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009a8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009a8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a94:	eb 10                	jmp    c0009aa6 <sys_printx+0x34>
c0009a96:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009a9b:	85 c0                	test   %eax,%eax
c0009a9d:	74 07                	je     c0009aa6 <sys_printx+0x34>
c0009a9f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009aa6:	8b 55 08             	mov    0x8(%ebp),%edx
c0009aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009aac:	01 d0                	add    %edx,%eax
c0009aae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009ab1:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ab4:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009aba:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009ac0:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0009ac5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009ac8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009acb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ace:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ad1:	0f b6 00             	movzbl (%eax),%eax
c0009ad4:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0009ad7:	eb 3a                	jmp    c0009b13 <sys_printx+0xa1>
c0009ad9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009adc:	0f b6 00             	movzbl (%eax),%eax
c0009adf:	3c 3b                	cmp    $0x3b,%al
c0009ae1:	74 0a                	je     c0009aed <sys_printx+0x7b>
c0009ae3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ae6:	0f b6 00             	movzbl (%eax),%eax
c0009ae9:	3c 3a                	cmp    $0x3a,%al
c0009aeb:	75 06                	jne    c0009af3 <sys_printx+0x81>
c0009aed:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009af1:	eb 20                	jmp    c0009b13 <sys_printx+0xa1>
c0009af3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009af6:	0f b6 00             	movzbl (%eax),%eax
c0009af9:	0f b6 c0             	movzbl %al,%eax
c0009afc:	83 ec 08             	sub    $0x8,%esp
c0009aff:	50                   	push   %eax
c0009b00:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009b03:	e8 de b9 ff ff       	call   c00054e6 <out_char>
c0009b08:	83 c4 10             	add    $0x10,%esp
c0009b0b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009b0f:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009b13:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009b17:	7f c0                	jg     c0009ad9 <sys_printx+0x67>
c0009b19:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009b1d:	75 10                	jne    c0009b2f <sys_printx+0xbd>
c0009b1f:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009b24:	85 c0                	test   %eax,%eax
c0009b26:	74 13                	je     c0009b3b <sys_printx+0xc9>
c0009b28:	e8 87 7c ff ff       	call   c00017b4 <disable_int>
c0009b2d:	eb 0c                	jmp    c0009b3b <sys_printx+0xc9>
c0009b2f:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009b33:	75 06                	jne    c0009b3b <sys_printx+0xc9>
c0009b35:	e8 7a 7c ff ff       	call   c00017b4 <disable_int>
c0009b3a:	90                   	nop
c0009b3b:	90                   	nop
c0009b3c:	c9                   	leave  
c0009b3d:	c3                   	ret    

c0009b3e <spin>:
c0009b3e:	55                   	push   %ebp
c0009b3f:	89 e5                	mov    %esp,%ebp
c0009b41:	83 ec 08             	sub    $0x8,%esp
c0009b44:	83 ec 0c             	sub    $0xc,%esp
c0009b47:	ff 75 08             	pushl  0x8(%ebp)
c0009b4a:	e8 3d 7a ff ff       	call   c000158c <disp_str>
c0009b4f:	83 c4 10             	add    $0x10,%esp
c0009b52:	83 ec 0c             	sub    $0xc,%esp
c0009b55:	68 34 b9 00 c0       	push   $0xc000b934
c0009b5a:	e8 2d 7a ff ff       	call   c000158c <disp_str>
c0009b5f:	83 c4 10             	add    $0x10,%esp
c0009b62:	eb fe                	jmp    c0009b62 <spin+0x24>

c0009b64 <panic>:
c0009b64:	55                   	push   %ebp
c0009b65:	89 e5                	mov    %esp,%ebp
c0009b67:	83 ec 08             	sub    $0x8,%esp
c0009b6a:	83 ec 04             	sub    $0x4,%esp
c0009b6d:	ff 75 08             	pushl  0x8(%ebp)
c0009b70:	6a 3a                	push   $0x3a
c0009b72:	68 34 be 00 c0       	push   $0xc000be34
c0009b77:	e8 b3 fe ff ff       	call   c0009a2f <printx>
c0009b7c:	83 c4 10             	add    $0x10,%esp
c0009b7f:	90                   	nop
c0009b80:	c9                   	leave  
c0009b81:	c3                   	ret    

c0009b82 <assertion_failure>:
c0009b82:	55                   	push   %ebp
c0009b83:	89 e5                	mov    %esp,%ebp
c0009b85:	83 ec 08             	sub    $0x8,%esp
c0009b88:	83 ec 08             	sub    $0x8,%esp
c0009b8b:	ff 75 14             	pushl  0x14(%ebp)
c0009b8e:	ff 75 10             	pushl  0x10(%ebp)
c0009b91:	ff 75 0c             	pushl  0xc(%ebp)
c0009b94:	ff 75 08             	pushl  0x8(%ebp)
c0009b97:	6a 3b                	push   $0x3b
c0009b99:	68 3c be 00 c0       	push   $0xc000be3c
c0009b9e:	e8 8c fe ff ff       	call   c0009a2f <printx>
c0009ba3:	83 c4 20             	add    $0x20,%esp
c0009ba6:	83 ec 0c             	sub    $0xc,%esp
c0009ba9:	68 6f be 00 c0       	push   $0xc000be6f
c0009bae:	e8 8b ff ff ff       	call   c0009b3e <spin>
c0009bb3:	83 c4 10             	add    $0x10,%esp
c0009bb6:	90                   	nop
c0009bb7:	c9                   	leave  
c0009bb8:	c3                   	ret    

c0009bb9 <dead_lock>:
c0009bb9:	55                   	push   %ebp
c0009bba:	89 e5                	mov    %esp,%ebp
c0009bbc:	b8 00 00 00 00       	mov    $0x0,%eax
c0009bc1:	5d                   	pop    %ebp
c0009bc2:	c3                   	ret    

c0009bc3 <sys_send_msg>:
c0009bc3:	55                   	push   %ebp
c0009bc4:	89 e5                	mov    %esp,%ebp
c0009bc6:	83 ec 38             	sub    $0x38,%esp
c0009bc9:	83 ec 0c             	sub    $0xc,%esp
c0009bcc:	ff 75 0c             	pushl  0xc(%ebp)
c0009bcf:	e8 9f b2 ff ff       	call   c0004e73 <pid2proc>
c0009bd4:	83 c4 10             	add    $0x10,%esp
c0009bd7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009bda:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009bde:	74 2c                	je     c0009c0c <sys_send_msg+0x49>
c0009be0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009be3:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009be9:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009bee:	74 1c                	je     c0009c0c <sys_send_msg+0x49>
c0009bf0:	68 ab 05 00 00       	push   $0x5ab
c0009bf5:	68 7b be 00 c0       	push   $0xc000be7b
c0009bfa:	68 7b be 00 c0       	push   $0xc000be7b
c0009bff:	68 8c be 00 c0       	push   $0xc000be8c
c0009c04:	e8 79 ff ff ff       	call   c0009b82 <assertion_failure>
c0009c09:	83 c4 10             	add    $0x10,%esp
c0009c0c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c0f:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009c15:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009c1a:	74 1c                	je     c0009c38 <sys_send_msg+0x75>
c0009c1c:	68 ad 05 00 00       	push   $0x5ad
c0009c21:	68 7b be 00 c0       	push   $0xc000be7b
c0009c26:	68 7b be 00 c0       	push   $0xc000be7b
c0009c2b:	68 b4 be 00 c0       	push   $0xc000beb4
c0009c30:	e8 4d ff ff ff       	call   c0009b82 <assertion_failure>
c0009c35:	83 c4 10             	add    $0x10,%esp
c0009c38:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009c3c:	75 22                	jne    c0009c60 <sys_send_msg+0x9d>
c0009c3e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009c42:	75 1c                	jne    c0009c60 <sys_send_msg+0x9d>
c0009c44:	68 b0 05 00 00       	push   $0x5b0
c0009c49:	68 7b be 00 c0       	push   $0xc000be7b
c0009c4e:	68 7b be 00 c0       	push   $0xc000be7b
c0009c53:	68 d7 be 00 c0       	push   $0xc000bed7
c0009c58:	e8 25 ff ff ff       	call   c0009b82 <assertion_failure>
c0009c5d:	83 c4 10             	add    $0x10,%esp
c0009c60:	83 ec 0c             	sub    $0xc,%esp
c0009c63:	ff 75 10             	pushl  0x10(%ebp)
c0009c66:	e8 7a b2 ff ff       	call   c0004ee5 <proc2pid>
c0009c6b:	83 c4 10             	add    $0x10,%esp
c0009c6e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009c71:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c74:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009c7a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009c7d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009c84:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c87:	83 ec 08             	sub    $0x8,%esp
c0009c8a:	6a 6c                	push   $0x6c
c0009c8c:	50                   	push   %eax
c0009c8d:	e8 1e d5 ff ff       	call   c00071b0 <alloc_virtual_memory>
c0009c92:	83 c4 10             	add    $0x10,%esp
c0009c95:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009c98:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009c9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009ca2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009ca5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009ca8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009cab:	89 10                	mov    %edx,(%eax)
c0009cad:	83 ec 08             	sub    $0x8,%esp
c0009cb0:	ff 75 0c             	pushl  0xc(%ebp)
c0009cb3:	ff 75 e8             	pushl  -0x18(%ebp)
c0009cb6:	e8 fe fe ff ff       	call   c0009bb9 <dead_lock>
c0009cbb:	83 c4 10             	add    $0x10,%esp
c0009cbe:	83 f8 01             	cmp    $0x1,%eax
c0009cc1:	75 10                	jne    c0009cd3 <sys_send_msg+0x110>
c0009cc3:	83 ec 0c             	sub    $0xc,%esp
c0009cc6:	68 e7 be 00 c0       	push   $0xc000bee7
c0009ccb:	e8 94 fe ff ff       	call   c0009b64 <panic>
c0009cd0:	83 c4 10             	add    $0x10,%esp
c0009cd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cd6:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009cdd:	3c 02                	cmp    $0x2,%al
c0009cdf:	0f 85 99 01 00 00    	jne    c0009e7e <sys_send_msg+0x2bb>
c0009ce5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ce8:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009cee:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009cf1:	74 12                	je     c0009d05 <sys_send_msg+0x142>
c0009cf3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cf6:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009cfc:	83 f8 12             	cmp    $0x12,%eax
c0009cff:	0f 85 79 01 00 00    	jne    c0009e7e <sys_send_msg+0x2bb>
c0009d05:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d08:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009d0e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009d11:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d14:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009d1a:	83 ec 08             	sub    $0x8,%esp
c0009d1d:	6a 6c                	push   $0x6c
c0009d1f:	50                   	push   %eax
c0009d20:	e8 8b d4 ff ff       	call   c00071b0 <alloc_virtual_memory>
c0009d25:	83 c4 10             	add    $0x10,%esp
c0009d28:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009d2b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009d2e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009d31:	83 ec 04             	sub    $0x4,%esp
c0009d34:	ff 75 d8             	pushl  -0x28(%ebp)
c0009d37:	52                   	push   %edx
c0009d38:	50                   	push   %eax
c0009d39:	e8 23 df ff ff       	call   c0007c61 <Memcpy>
c0009d3e:	83 c4 10             	add    $0x10,%esp
c0009d41:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d44:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d4b:	00 00 00 
c0009d4e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d51:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d58:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d5b:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d62:	00 00 00 
c0009d65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d68:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d6f:	00 00 00 
c0009d72:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d75:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d7f:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009d86:	00 00 00 
c0009d89:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d8c:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d93:	00 00 00 
c0009d96:	83 ec 0c             	sub    $0xc,%esp
c0009d99:	ff 75 ec             	pushl  -0x14(%ebp)
c0009d9c:	e8 45 08 00 00       	call   c000a5e6 <unblock>
c0009da1:	83 c4 10             	add    $0x10,%esp
c0009da4:	8b 45 10             	mov    0x10(%ebp),%eax
c0009da7:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009dae:	84 c0                	test   %al,%al
c0009db0:	74 1c                	je     c0009dce <sys_send_msg+0x20b>
c0009db2:	68 e1 05 00 00       	push   $0x5e1
c0009db7:	68 7b be 00 c0       	push   $0xc000be7b
c0009dbc:	68 7b be 00 c0       	push   $0xc000be7b
c0009dc1:	68 f2 be 00 c0       	push   $0xc000bef2
c0009dc6:	e8 b7 fd ff ff       	call   c0009b82 <assertion_failure>
c0009dcb:	83 c4 10             	add    $0x10,%esp
c0009dce:	8b 45 10             	mov    0x10(%ebp),%eax
c0009dd1:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009dd7:	83 f8 21             	cmp    $0x21,%eax
c0009dda:	74 1c                	je     c0009df8 <sys_send_msg+0x235>
c0009ddc:	68 e2 05 00 00       	push   $0x5e2
c0009de1:	68 7b be 00 c0       	push   $0xc000be7b
c0009de6:	68 7b be 00 c0       	push   $0xc000be7b
c0009deb:	68 06 bf 00 c0       	push   $0xc000bf06
c0009df0:	e8 8d fd ff ff       	call   c0009b82 <assertion_failure>
c0009df5:	83 c4 10             	add    $0x10,%esp
c0009df8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009dfb:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009e01:	85 c0                	test   %eax,%eax
c0009e03:	74 1c                	je     c0009e21 <sys_send_msg+0x25e>
c0009e05:	68 e4 05 00 00       	push   $0x5e4
c0009e0a:	68 7b be 00 c0       	push   $0xc000be7b
c0009e0f:	68 7b be 00 c0       	push   $0xc000be7b
c0009e14:	68 23 bf 00 c0       	push   $0xc000bf23
c0009e19:	e8 64 fd ff ff       	call   c0009b82 <assertion_failure>
c0009e1e:	83 c4 10             	add    $0x10,%esp
c0009e21:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e24:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e2b:	84 c0                	test   %al,%al
c0009e2d:	74 1c                	je     c0009e4b <sys_send_msg+0x288>
c0009e2f:	68 e5 05 00 00       	push   $0x5e5
c0009e34:	68 7b be 00 c0       	push   $0xc000be7b
c0009e39:	68 7b be 00 c0       	push   $0xc000be7b
c0009e3e:	68 38 bf 00 c0       	push   $0xc000bf38
c0009e43:	e8 3a fd ff ff       	call   c0009b82 <assertion_failure>
c0009e48:	83 c4 10             	add    $0x10,%esp
c0009e4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e4e:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e54:	83 f8 21             	cmp    $0x21,%eax
c0009e57:	0f 84 45 01 00 00    	je     c0009fa2 <sys_send_msg+0x3df>
c0009e5d:	68 e6 05 00 00       	push   $0x5e6
c0009e62:	68 7b be 00 c0       	push   $0xc000be7b
c0009e67:	68 7b be 00 c0       	push   $0xc000be7b
c0009e6c:	68 50 bf 00 c0       	push   $0xc000bf50
c0009e71:	e8 0c fd ff ff       	call   c0009b82 <assertion_failure>
c0009e76:	83 c4 10             	add    $0x10,%esp
c0009e79:	e9 24 01 00 00       	jmp    c0009fa2 <sys_send_msg+0x3df>
c0009e7e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009e85:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e88:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009e8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e8e:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009e94:	85 c0                	test   %eax,%eax
c0009e96:	75 1b                	jne    c0009eb3 <sys_send_msg+0x2f0>
c0009e98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e9b:	8b 55 10             	mov    0x10(%ebp),%edx
c0009e9e:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009ea4:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ea7:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009eae:	00 00 00 
c0009eb1:	eb 3f                	jmp    c0009ef2 <sys_send_msg+0x32f>
c0009eb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009eb6:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009ebc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ebf:	eb 12                	jmp    c0009ed3 <sys_send_msg+0x310>
c0009ec1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ec4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ec7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009eca:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009ed0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ed3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009ed7:	75 e8                	jne    c0009ec1 <sys_send_msg+0x2fe>
c0009ed9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009edc:	8b 55 10             	mov    0x10(%ebp),%edx
c0009edf:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009ee5:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ee8:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009eef:	00 00 00 
c0009ef2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ef5:	8b 55 08             	mov    0x8(%ebp),%edx
c0009ef8:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009efe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f01:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009f04:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009f0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f0d:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c0009f14:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f17:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f1e:	3c 01                	cmp    $0x1,%al
c0009f20:	74 1c                	je     c0009f3e <sys_send_msg+0x37b>
c0009f22:	68 07 06 00 00       	push   $0x607
c0009f27:	68 7b be 00 c0       	push   $0xc000be7b
c0009f2c:	68 7b be 00 c0       	push   $0xc000be7b
c0009f31:	68 74 bf 00 c0       	push   $0xc000bf74
c0009f36:	e8 47 fc ff ff       	call   c0009b82 <assertion_failure>
c0009f3b:	83 c4 10             	add    $0x10,%esp
c0009f3e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f41:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009f47:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009f4a:	74 1c                	je     c0009f68 <sys_send_msg+0x3a5>
c0009f4c:	68 08 06 00 00       	push   $0x608
c0009f51:	68 7b be 00 c0       	push   $0xc000be7b
c0009f56:	68 7b be 00 c0       	push   $0xc000be7b
c0009f5b:	68 90 bf 00 c0       	push   $0xc000bf90
c0009f60:	e8 1d fc ff ff       	call   c0009b82 <assertion_failure>
c0009f65:	83 c4 10             	add    $0x10,%esp
c0009f68:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f6b:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009f71:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009f74:	74 1c                	je     c0009f92 <sys_send_msg+0x3cf>
c0009f76:	68 09 06 00 00       	push   $0x609
c0009f7b:	68 7b be 00 c0       	push   $0xc000be7b
c0009f80:	68 7b be 00 c0       	push   $0xc000be7b
c0009f85:	68 b2 bf 00 c0       	push   $0xc000bfb2
c0009f8a:	e8 f3 fb ff ff       	call   c0009b82 <assertion_failure>
c0009f8f:	83 c4 10             	add    $0x10,%esp
c0009f92:	83 ec 0c             	sub    $0xc,%esp
c0009f95:	ff 75 10             	pushl  0x10(%ebp)
c0009f98:	e8 0d 06 00 00       	call   c000a5aa <block>
c0009f9d:	83 c4 10             	add    $0x10,%esp
c0009fa0:	eb 01                	jmp    c0009fa3 <sys_send_msg+0x3e0>
c0009fa2:	90                   	nop
c0009fa3:	b8 00 00 00 00       	mov    $0x0,%eax
c0009fa8:	c9                   	leave  
c0009fa9:	c3                   	ret    

c0009faa <sys_receive_msg>:
c0009faa:	55                   	push   %ebp
c0009fab:	89 e5                	mov    %esp,%ebp
c0009fad:	83 ec 48             	sub    $0x48,%esp
c0009fb0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009fb7:	83 ec 0c             	sub    $0xc,%esp
c0009fba:	ff 75 0c             	pushl  0xc(%ebp)
c0009fbd:	e8 b1 ae ff ff       	call   c0004e73 <pid2proc>
c0009fc2:	83 c4 10             	add    $0x10,%esp
c0009fc5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009fc8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0009fcc:	74 2c                	je     c0009ffa <sys_receive_msg+0x50>
c0009fce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009fd1:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009fd7:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009fdc:	74 1c                	je     c0009ffa <sys_receive_msg+0x50>
c0009fde:	68 1d 06 00 00       	push   $0x61d
c0009fe3:	68 7b be 00 c0       	push   $0xc000be7b
c0009fe8:	68 7b be 00 c0       	push   $0xc000be7b
c0009fed:	68 b4 be 00 c0       	push   $0xc000beb4
c0009ff2:	e8 8b fb ff ff       	call   c0009b82 <assertion_failure>
c0009ff7:	83 c4 10             	add    $0x10,%esp
c0009ffa:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ffd:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000a003:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c000a008:	74 1c                	je     c000a026 <sys_receive_msg+0x7c>
c000a00a:	68 1f 06 00 00       	push   $0x61f
c000a00f:	68 7b be 00 c0       	push   $0xc000be7b
c000a014:	68 7b be 00 c0       	push   $0xc000be7b
c000a019:	68 8c be 00 c0       	push   $0xc000be8c
c000a01e:	e8 5f fb ff ff       	call   c0009b82 <assertion_failure>
c000a023:	83 c4 10             	add    $0x10,%esp
c000a026:	83 ec 0c             	sub    $0xc,%esp
c000a029:	ff 75 10             	pushl  0x10(%ebp)
c000a02c:	e8 b4 ae ff ff       	call   c0004ee5 <proc2pid>
c000a031:	83 c4 10             	add    $0x10,%esp
c000a034:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a037:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a03e:	8b 45 10             	mov    0x10(%ebp),%eax
c000a041:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c000a047:	85 c0                	test   %eax,%eax
c000a049:	0f 84 b5 00 00 00    	je     c000a104 <sys_receive_msg+0x15a>
c000a04f:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a053:	74 0d                	je     c000a062 <sys_receive_msg+0xb8>
c000a055:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000a05c:	0f 85 a2 00 00 00    	jne    c000a104 <sys_receive_msg+0x15a>
c000a062:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c000a069:	83 ec 0c             	sub    $0xc,%esp
c000a06c:	ff 75 dc             	pushl  -0x24(%ebp)
c000a06f:	e8 30 89 ff ff       	call   c00029a4 <sys_malloc>
c000a074:	83 c4 10             	add    $0x10,%esp
c000a077:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a07a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a07d:	83 ec 04             	sub    $0x4,%esp
c000a080:	50                   	push   %eax
c000a081:	6a 00                	push   $0x0
c000a083:	ff 75 d8             	pushl  -0x28(%ebp)
c000a086:	e8 ac 20 00 00       	call   c000c137 <Memset>
c000a08b:	83 c4 10             	add    $0x10,%esp
c000a08e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a091:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a097:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a09a:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a0a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0a4:	83 ec 08             	sub    $0x8,%esp
c000a0a7:	ff 75 dc             	pushl  -0x24(%ebp)
c000a0aa:	50                   	push   %eax
c000a0ab:	e8 00 d1 ff ff       	call   c00071b0 <alloc_virtual_memory>
c000a0b0:	83 c4 10             	add    $0x10,%esp
c000a0b3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a0b6:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000a0b9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a0bc:	83 ec 04             	sub    $0x4,%esp
c000a0bf:	52                   	push   %edx
c000a0c0:	ff 75 d8             	pushl  -0x28(%ebp)
c000a0c3:	50                   	push   %eax
c000a0c4:	e8 98 db ff ff       	call   c0007c61 <Memcpy>
c000a0c9:	83 c4 10             	add    $0x10,%esp
c000a0cc:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0cf:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a0d6:	00 00 00 
c000a0d9:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0dc:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a0e3:	00 00 00 
c000a0e6:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0e9:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a0f0:	00 00 00 
c000a0f3:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0f6:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a0fd:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000a104:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000a108:	0f 84 96 03 00 00    	je     c000a4a4 <sys_receive_msg+0x4fa>
c000a10e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a112:	75 26                	jne    c000a13a <sys_receive_msg+0x190>
c000a114:	8b 45 10             	mov    0x10(%ebp),%eax
c000a117:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a11d:	85 c0                	test   %eax,%eax
c000a11f:	0f 84 8a 00 00 00    	je     c000a1af <sys_receive_msg+0x205>
c000a125:	8b 45 10             	mov    0x10(%ebp),%eax
c000a128:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a12e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a131:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a138:	eb 75                	jmp    c000a1af <sys_receive_msg+0x205>
c000a13a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a13e:	78 6f                	js     c000a1af <sys_receive_msg+0x205>
c000a140:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c000a144:	7f 69                	jg     c000a1af <sys_receive_msg+0x205>
c000a146:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a149:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a150:	3c 01                	cmp    $0x1,%al
c000a152:	75 5b                	jne    c000a1af <sys_receive_msg+0x205>
c000a154:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a157:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a15d:	83 f8 12             	cmp    $0x12,%eax
c000a160:	74 0e                	je     c000a170 <sys_receive_msg+0x1c6>
c000a162:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a165:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a16b:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c000a16e:	75 3f                	jne    c000a1af <sys_receive_msg+0x205>
c000a170:	8b 45 10             	mov    0x10(%ebp),%eax
c000a173:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a179:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a17c:	eb 2b                	jmp    c000a1a9 <sys_receive_msg+0x1ff>
c000a17e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a181:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a184:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a187:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c000a18d:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a190:	39 c2                	cmp    %eax,%edx
c000a192:	75 09                	jne    c000a19d <sys_receive_msg+0x1f3>
c000a194:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a19b:	eb 12                	jmp    c000a1af <sys_receive_msg+0x205>
c000a19d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1a0:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000a1a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a1a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a1ad:	75 cf                	jne    c000a17e <sys_receive_msg+0x1d4>
c000a1af:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000a1b3:	0f 85 21 02 00 00    	jne    c000a3da <sys_receive_msg+0x430>
c000a1b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a1bf:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1c2:	83 ec 08             	sub    $0x8,%esp
c000a1c5:	6a 6c                	push   $0x6c
c000a1c7:	50                   	push   %eax
c000a1c8:	e8 e3 cf ff ff       	call   c00071b0 <alloc_virtual_memory>
c000a1cd:	83 c4 10             	add    $0x10,%esp
c000a1d0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a1d3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a1d6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a1dc:	83 ec 08             	sub    $0x8,%esp
c000a1df:	6a 6c                	push   $0x6c
c000a1e1:	50                   	push   %eax
c000a1e2:	e8 c9 cf ff ff       	call   c00071b0 <alloc_virtual_memory>
c000a1e7:	83 c4 10             	add    $0x10,%esp
c000a1ea:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a1ed:	83 ec 04             	sub    $0x4,%esp
c000a1f0:	6a 6c                	push   $0x6c
c000a1f2:	ff 75 c8             	pushl  -0x38(%ebp)
c000a1f5:	ff 75 cc             	pushl  -0x34(%ebp)
c000a1f8:	e8 64 da ff ff       	call   c0007c61 <Memcpy>
c000a1fd:	83 c4 10             	add    $0x10,%esp
c000a200:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a203:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a206:	8b 45 10             	mov    0x10(%ebp),%eax
c000a209:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a20f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000a212:	75 21                	jne    c000a235 <sys_receive_msg+0x28b>
c000a214:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a217:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a21d:	8b 45 10             	mov    0x10(%ebp),%eax
c000a220:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000a226:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a229:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a230:	00 00 00 
c000a233:	eb 1f                	jmp    c000a254 <sys_receive_msg+0x2aa>
c000a235:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a238:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a23e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a241:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000a247:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a24a:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a251:	00 00 00 
c000a254:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a257:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a25e:	00 00 00 
c000a261:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a264:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a26b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a26e:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a275:	00 00 00 
c000a278:	8b 45 10             	mov    0x10(%ebp),%eax
c000a27b:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a282:	00 00 00 
c000a285:	8b 45 10             	mov    0x10(%ebp),%eax
c000a288:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a28f:	00 00 00 
c000a292:	8b 45 10             	mov    0x10(%ebp),%eax
c000a295:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a29c:	00 00 00 
c000a29f:	83 ec 0c             	sub    $0xc,%esp
c000a2a2:	ff 75 d0             	pushl  -0x30(%ebp)
c000a2a5:	e8 3c 03 00 00       	call   c000a5e6 <unblock>
c000a2aa:	83 c4 10             	add    $0x10,%esp
c000a2ad:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a2b0:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a2b6:	85 c0                	test   %eax,%eax
c000a2b8:	74 1c                	je     c000a2d6 <sys_receive_msg+0x32c>
c000a2ba:	68 89 06 00 00       	push   $0x689
c000a2bf:	68 7b be 00 c0       	push   $0xc000be7b
c000a2c4:	68 7b be 00 c0       	push   $0xc000be7b
c000a2c9:	68 c7 bf 00 c0       	push   $0xc000bfc7
c000a2ce:	e8 af f8 ff ff       	call   c0009b82 <assertion_failure>
c000a2d3:	83 c4 10             	add    $0x10,%esp
c000a2d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a2d9:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a2e0:	84 c0                	test   %al,%al
c000a2e2:	74 1c                	je     c000a300 <sys_receive_msg+0x356>
c000a2e4:	68 8a 06 00 00       	push   $0x68a
c000a2e9:	68 7b be 00 c0       	push   $0xc000be7b
c000a2ee:	68 7b be 00 c0       	push   $0xc000be7b
c000a2f3:	68 df bf 00 c0       	push   $0xc000bfdf
c000a2f8:	e8 85 f8 ff ff       	call   c0009b82 <assertion_failure>
c000a2fd:	83 c4 10             	add    $0x10,%esp
c000a300:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a303:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a309:	83 f8 21             	cmp    $0x21,%eax
c000a30c:	74 1c                	je     c000a32a <sys_receive_msg+0x380>
c000a30e:	68 8b 06 00 00       	push   $0x68b
c000a313:	68 7b be 00 c0       	push   $0xc000be7b
c000a318:	68 7b be 00 c0       	push   $0xc000be7b
c000a31d:	68 f8 bf 00 c0       	push   $0xc000bff8
c000a322:	e8 5b f8 ff ff       	call   c0009b82 <assertion_failure>
c000a327:	83 c4 10             	add    $0x10,%esp
c000a32a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a32d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a333:	85 c0                	test   %eax,%eax
c000a335:	74 1c                	je     c000a353 <sys_receive_msg+0x3a9>
c000a337:	68 8d 06 00 00       	push   $0x68d
c000a33c:	68 7b be 00 c0       	push   $0xc000be7b
c000a341:	68 7b be 00 c0       	push   $0xc000be7b
c000a346:	68 23 bf 00 c0       	push   $0xc000bf23
c000a34b:	e8 32 f8 ff ff       	call   c0009b82 <assertion_failure>
c000a350:	83 c4 10             	add    $0x10,%esp
c000a353:	8b 45 10             	mov    0x10(%ebp),%eax
c000a356:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a35d:	84 c0                	test   %al,%al
c000a35f:	74 1c                	je     c000a37d <sys_receive_msg+0x3d3>
c000a361:	68 8e 06 00 00       	push   $0x68e
c000a366:	68 7b be 00 c0       	push   $0xc000be7b
c000a36b:	68 7b be 00 c0       	push   $0xc000be7b
c000a370:	68 38 bf 00 c0       	push   $0xc000bf38
c000a375:	e8 08 f8 ff ff       	call   c0009b82 <assertion_failure>
c000a37a:	83 c4 10             	add    $0x10,%esp
c000a37d:	8b 45 10             	mov    0x10(%ebp),%eax
c000a380:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a386:	83 f8 21             	cmp    $0x21,%eax
c000a389:	74 1c                	je     c000a3a7 <sys_receive_msg+0x3fd>
c000a38b:	68 8f 06 00 00       	push   $0x68f
c000a390:	68 7b be 00 c0       	push   $0xc000be7b
c000a395:	68 7b be 00 c0       	push   $0xc000be7b
c000a39a:	68 50 bf 00 c0       	push   $0xc000bf50
c000a39f:	e8 de f7 ff ff       	call   c0009b82 <assertion_failure>
c000a3a4:	83 c4 10             	add    $0x10,%esp
c000a3a7:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3aa:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a3b0:	83 f8 21             	cmp    $0x21,%eax
c000a3b3:	0f 84 e4 00 00 00    	je     c000a49d <sys_receive_msg+0x4f3>
c000a3b9:	68 90 06 00 00       	push   $0x690
c000a3be:	68 7b be 00 c0       	push   $0xc000be7b
c000a3c3:	68 7b be 00 c0       	push   $0xc000be7b
c000a3c8:	68 1c c0 00 c0       	push   $0xc000c01c
c000a3cd:	e8 b0 f7 ff ff       	call   c0009b82 <assertion_failure>
c000a3d2:	83 c4 10             	add    $0x10,%esp
c000a3d5:	e9 c3 00 00 00       	jmp    c000a49d <sys_receive_msg+0x4f3>
c000a3da:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3dd:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c000a3e4:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3e7:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a3ee:	3c 02                	cmp    $0x2,%al
c000a3f0:	74 1c                	je     c000a40e <sys_receive_msg+0x464>
c000a3f2:	68 95 06 00 00       	push   $0x695
c000a3f7:	68 7b be 00 c0       	push   $0xc000be7b
c000a3fc:	68 7b be 00 c0       	push   $0xc000be7b
c000a401:	68 3b c0 00 c0       	push   $0xc000c03b
c000a406:	e8 77 f7 ff ff       	call   c0009b82 <assertion_failure>
c000a40b:	83 c4 10             	add    $0x10,%esp
c000a40e:	8b 45 10             	mov    0x10(%ebp),%eax
c000a411:	8b 55 08             	mov    0x8(%ebp),%edx
c000a414:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000a41a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a41d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a424:	3c 02                	cmp    $0x2,%al
c000a426:	74 1c                	je     c000a444 <sys_receive_msg+0x49a>
c000a428:	68 97 06 00 00       	push   $0x697
c000a42d:	68 7b be 00 c0       	push   $0xc000be7b
c000a432:	68 7b be 00 c0       	push   $0xc000be7b
c000a437:	68 3b c0 00 c0       	push   $0xc000c03b
c000a43c:	e8 41 f7 ff ff       	call   c0009b82 <assertion_failure>
c000a441:	83 c4 10             	add    $0x10,%esp
c000a444:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a448:	75 0f                	jne    c000a459 <sys_receive_msg+0x4af>
c000a44a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a44d:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c000a454:	00 00 00 
c000a457:	eb 0c                	jmp    c000a465 <sys_receive_msg+0x4bb>
c000a459:	8b 45 10             	mov    0x10(%ebp),%eax
c000a45c:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a45f:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c000a465:	8b 45 10             	mov    0x10(%ebp),%eax
c000a468:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a46f:	3c 02                	cmp    $0x2,%al
c000a471:	74 1c                	je     c000a48f <sys_receive_msg+0x4e5>
c000a473:	68 a2 06 00 00       	push   $0x6a2
c000a478:	68 7b be 00 c0       	push   $0xc000be7b
c000a47d:	68 7b be 00 c0       	push   $0xc000be7b
c000a482:	68 3b c0 00 c0       	push   $0xc000c03b
c000a487:	e8 f6 f6 ff ff       	call   c0009b82 <assertion_failure>
c000a48c:	83 c4 10             	add    $0x10,%esp
c000a48f:	83 ec 0c             	sub    $0xc,%esp
c000a492:	ff 75 10             	pushl  0x10(%ebp)
c000a495:	e8 10 01 00 00       	call   c000a5aa <block>
c000a49a:	83 c4 10             	add    $0x10,%esp
c000a49d:	b8 00 00 00 00       	mov    $0x0,%eax
c000a4a2:	eb 02                	jmp    c000a4a6 <sys_receive_msg+0x4fc>
c000a4a4:	90                   	nop
c000a4a5:	90                   	nop
c000a4a6:	c9                   	leave  
c000a4a7:	c3                   	ret    

c000a4a8 <disp_str_colour_debug>:
c000a4a8:	55                   	push   %ebp
c000a4a9:	89 e5                	mov    %esp,%ebp
c000a4ab:	90                   	nop
c000a4ac:	5d                   	pop    %ebp
c000a4ad:	c3                   	ret    

c000a4ae <send_rec>:
c000a4ae:	55                   	push   %ebp
c000a4af:	89 e5                	mov    %esp,%ebp
c000a4b1:	83 ec 18             	sub    $0x18,%esp
c000a4b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a4b7:	83 ec 0c             	sub    $0xc,%esp
c000a4ba:	50                   	push   %eax
c000a4bb:	e8 b7 cd ff ff       	call   c0007277 <get_physical_address>
c000a4c0:	83 c4 10             	add    $0x10,%esp
c000a4c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a4c6:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a4ca:	74 28                	je     c000a4f4 <send_rec+0x46>
c000a4cc:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a4d0:	74 22                	je     c000a4f4 <send_rec+0x46>
c000a4d2:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a4d6:	74 1c                	je     c000a4f4 <send_rec+0x46>
c000a4d8:	68 c2 06 00 00       	push   $0x6c2
c000a4dd:	68 7b be 00 c0       	push   $0xc000be7b
c000a4e2:	68 7b be 00 c0       	push   $0xc000be7b
c000a4e7:	68 5c c0 00 c0       	push   $0xc000c05c
c000a4ec:	e8 91 f6 ff ff       	call   c0009b82 <assertion_failure>
c000a4f1:	83 c4 10             	add    $0x10,%esp
c000a4f4:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a4f8:	75 12                	jne    c000a50c <send_rec+0x5e>
c000a4fa:	83 ec 04             	sub    $0x4,%esp
c000a4fd:	6a 6c                	push   $0x6c
c000a4ff:	6a 00                	push   $0x0
c000a501:	ff 75 0c             	pushl  0xc(%ebp)
c000a504:	e8 2e 1c 00 00       	call   c000c137 <Memset>
c000a509:	83 c4 10             	add    $0x10,%esp
c000a50c:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a510:	74 23                	je     c000a535 <send_rec+0x87>
c000a512:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a516:	74 34                	je     c000a54c <send_rec+0x9e>
c000a518:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a51c:	75 72                	jne    c000a590 <send_rec+0xe2>
c000a51e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a521:	83 ec 08             	sub    $0x8,%esp
c000a524:	ff 75 10             	pushl  0x10(%ebp)
c000a527:	50                   	push   %eax
c000a528:	e8 3b 84 ff ff       	call   c0002968 <send_msg>
c000a52d:	83 c4 10             	add    $0x10,%esp
c000a530:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a533:	eb 6e                	jmp    c000a5a3 <send_rec+0xf5>
c000a535:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a538:	83 ec 08             	sub    $0x8,%esp
c000a53b:	ff 75 10             	pushl  0x10(%ebp)
c000a53e:	50                   	push   %eax
c000a53f:	e8 4a 84 ff ff       	call   c000298e <receive_msg>
c000a544:	83 c4 10             	add    $0x10,%esp
c000a547:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a54a:	eb 57                	jmp    c000a5a3 <send_rec+0xf5>
c000a54c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a54f:	83 ec 08             	sub    $0x8,%esp
c000a552:	ff 75 10             	pushl  0x10(%ebp)
c000a555:	50                   	push   %eax
c000a556:	e8 0d 84 ff ff       	call   c0002968 <send_msg>
c000a55b:	83 c4 10             	add    $0x10,%esp
c000a55e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a561:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a565:	75 3b                	jne    c000a5a2 <send_rec+0xf4>
c000a567:	83 ec 04             	sub    $0x4,%esp
c000a56a:	6a 6c                	push   $0x6c
c000a56c:	6a 00                	push   $0x0
c000a56e:	ff 75 0c             	pushl  0xc(%ebp)
c000a571:	e8 c1 1b 00 00       	call   c000c137 <Memset>
c000a576:	83 c4 10             	add    $0x10,%esp
c000a579:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a57c:	83 ec 08             	sub    $0x8,%esp
c000a57f:	ff 75 10             	pushl  0x10(%ebp)
c000a582:	50                   	push   %eax
c000a583:	e8 06 84 ff ff       	call   c000298e <receive_msg>
c000a588:	83 c4 10             	add    $0x10,%esp
c000a58b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a58e:	eb 12                	jmp    c000a5a2 <send_rec+0xf4>
c000a590:	83 ec 0c             	sub    $0xc,%esp
c000a593:	68 98 c0 00 c0       	push   $0xc000c098
c000a598:	e8 c7 f5 ff ff       	call   c0009b64 <panic>
c000a59d:	83 c4 10             	add    $0x10,%esp
c000a5a0:	eb 01                	jmp    c000a5a3 <send_rec+0xf5>
c000a5a2:	90                   	nop
c000a5a3:	b8 00 00 00 00       	mov    $0x0,%eax
c000a5a8:	c9                   	leave  
c000a5a9:	c3                   	ret    

c000a5aa <block>:
c000a5aa:	55                   	push   %ebp
c000a5ab:	89 e5                	mov    %esp,%ebp
c000a5ad:	83 ec 08             	sub    $0x8,%esp
c000a5b0:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5b3:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a5ba:	84 c0                	test   %al,%al
c000a5bc:	75 1c                	jne    c000a5da <block+0x30>
c000a5be:	68 f1 06 00 00       	push   $0x6f1
c000a5c3:	68 7b be 00 c0       	push   $0xc000be7b
c000a5c8:	68 7b be 00 c0       	push   $0xc000be7b
c000a5cd:	68 ad c0 00 c0       	push   $0xc000c0ad
c000a5d2:	e8 ab f5 ff ff       	call   c0009b82 <assertion_failure>
c000a5d7:	83 c4 10             	add    $0x10,%esp
c000a5da:	e8 27 a4 ff ff       	call   c0004a06 <schedule_process>
c000a5df:	b8 00 00 00 00       	mov    $0x0,%eax
c000a5e4:	c9                   	leave  
c000a5e5:	c3                   	ret    

c000a5e6 <unblock>:
c000a5e6:	55                   	push   %ebp
c000a5e7:	89 e5                	mov    %esp,%ebp
c000a5e9:	83 ec 08             	sub    $0x8,%esp
c000a5ec:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5ef:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a5f6:	84 c0                	test   %al,%al
c000a5f8:	74 1c                	je     c000a616 <unblock+0x30>
c000a5fa:	68 fa 06 00 00       	push   $0x6fa
c000a5ff:	68 7b be 00 c0       	push   $0xc000be7b
c000a604:	68 7b be 00 c0       	push   $0xc000be7b
c000a609:	68 c5 c0 00 c0       	push   $0xc000c0c5
c000a60e:	e8 6f f5 ff ff       	call   c0009b82 <assertion_failure>
c000a613:	83 c4 10             	add    $0x10,%esp
c000a616:	8b 45 08             	mov    0x8(%ebp),%eax
c000a619:	05 00 01 00 00       	add    $0x100,%eax
c000a61e:	83 ec 08             	sub    $0x8,%esp
c000a621:	50                   	push   %eax
c000a622:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a627:	e8 44 0a 00 00       	call   c000b070 <appendToDoubleLinkList>
c000a62c:	83 c4 10             	add    $0x10,%esp
c000a62f:	b8 00 00 00 00       	mov    $0x0,%eax
c000a634:	c9                   	leave  
c000a635:	c3                   	ret    

c000a636 <get_ticks_ipc>:
c000a636:	55                   	push   %ebp
c000a637:	89 e5                	mov    %esp,%ebp
c000a639:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000a63f:	83 ec 04             	sub    $0x4,%esp
c000a642:	6a 6c                	push   $0x6c
c000a644:	6a 00                	push   $0x0
c000a646:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a649:	50                   	push   %eax
c000a64a:	e8 e8 1a 00 00       	call   c000c137 <Memset>
c000a64f:	83 c4 10             	add    $0x10,%esp
c000a652:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000a659:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a660:	83 ec 04             	sub    $0x4,%esp
c000a663:	6a 01                	push   $0x1
c000a665:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a668:	50                   	push   %eax
c000a669:	6a 03                	push   $0x3
c000a66b:	e8 3e fe ff ff       	call   c000a4ae <send_rec>
c000a670:	83 c4 10             	add    $0x10,%esp
c000a673:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a676:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000a679:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a67c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a67f:	c9                   	leave  
c000a680:	c3                   	ret    

c000a681 <itoa>:
c000a681:	55                   	push   %ebp
c000a682:	89 e5                	mov    %esp,%ebp
c000a684:	53                   	push   %ebx
c000a685:	83 ec 14             	sub    $0x14,%esp
c000a688:	8b 45 08             	mov    0x8(%ebp),%eax
c000a68b:	99                   	cltd   
c000a68c:	f7 7d 10             	idivl  0x10(%ebp)
c000a68f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a692:	8b 45 08             	mov    0x8(%ebp),%eax
c000a695:	99                   	cltd   
c000a696:	f7 7d 10             	idivl  0x10(%ebp)
c000a699:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a69c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a6a0:	74 14                	je     c000a6b6 <itoa+0x35>
c000a6a2:	83 ec 04             	sub    $0x4,%esp
c000a6a5:	ff 75 10             	pushl  0x10(%ebp)
c000a6a8:	ff 75 0c             	pushl  0xc(%ebp)
c000a6ab:	ff 75 f0             	pushl  -0x10(%ebp)
c000a6ae:	e8 ce ff ff ff       	call   c000a681 <itoa>
c000a6b3:	83 c4 10             	add    $0x10,%esp
c000a6b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b9:	8d 58 30             	lea    0x30(%eax),%ebx
c000a6bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a6bf:	8b 00                	mov    (%eax),%eax
c000a6c1:	8d 48 01             	lea    0x1(%eax),%ecx
c000a6c4:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a6c7:	89 0a                	mov    %ecx,(%edx)
c000a6c9:	89 da                	mov    %ebx,%edx
c000a6cb:	88 10                	mov    %dl,(%eax)
c000a6cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a6d0:	8b 00                	mov    (%eax),%eax
c000a6d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a6d5:	c9                   	leave  
c000a6d6:	c3                   	ret    

c000a6d7 <i2a>:
c000a6d7:	55                   	push   %ebp
c000a6d8:	89 e5                	mov    %esp,%ebp
c000a6da:	53                   	push   %ebx
c000a6db:	83 ec 14             	sub    $0x14,%esp
c000a6de:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6e1:	99                   	cltd   
c000a6e2:	f7 7d 0c             	idivl  0xc(%ebp)
c000a6e5:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a6e8:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6eb:	99                   	cltd   
c000a6ec:	f7 7d 0c             	idivl  0xc(%ebp)
c000a6ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a6f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a6f6:	74 14                	je     c000a70c <i2a+0x35>
c000a6f8:	83 ec 04             	sub    $0x4,%esp
c000a6fb:	ff 75 10             	pushl  0x10(%ebp)
c000a6fe:	ff 75 0c             	pushl  0xc(%ebp)
c000a701:	ff 75 f0             	pushl  -0x10(%ebp)
c000a704:	e8 ce ff ff ff       	call   c000a6d7 <i2a>
c000a709:	83 c4 10             	add    $0x10,%esp
c000a70c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a710:	7f 0a                	jg     c000a71c <i2a+0x45>
c000a712:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a715:	83 c0 30             	add    $0x30,%eax
c000a718:	89 c3                	mov    %eax,%ebx
c000a71a:	eb 08                	jmp    c000a724 <i2a+0x4d>
c000a71c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a71f:	83 c0 37             	add    $0x37,%eax
c000a722:	89 c3                	mov    %eax,%ebx
c000a724:	8b 45 10             	mov    0x10(%ebp),%eax
c000a727:	8b 00                	mov    (%eax),%eax
c000a729:	8d 48 01             	lea    0x1(%eax),%ecx
c000a72c:	8b 55 10             	mov    0x10(%ebp),%edx
c000a72f:	89 0a                	mov    %ecx,(%edx)
c000a731:	88 18                	mov    %bl,(%eax)
c000a733:	8b 45 10             	mov    0x10(%ebp),%eax
c000a736:	8b 00                	mov    (%eax),%eax
c000a738:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a73b:	c9                   	leave  
c000a73c:	c3                   	ret    

c000a73d <inform_int>:
c000a73d:	55                   	push   %ebp
c000a73e:	89 e5                	mov    %esp,%ebp
c000a740:	83 ec 18             	sub    $0x18,%esp
c000a743:	83 ec 0c             	sub    $0xc,%esp
c000a746:	ff 75 08             	pushl  0x8(%ebp)
c000a749:	e8 25 a7 ff ff       	call   c0004e73 <pid2proc>
c000a74e:	83 c4 10             	add    $0x10,%esp
c000a751:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a754:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a757:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a75e:	0f be c0             	movsbl %al,%eax
c000a761:	83 e0 02             	and    $0x2,%eax
c000a764:	85 c0                	test   %eax,%eax
c000a766:	0f 84 8e 00 00 00    	je     c000a7fa <inform_int+0xbd>
c000a76c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a76f:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a775:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a77a:	74 0e                	je     c000a78a <inform_int+0x4d>
c000a77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a77f:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a785:	83 f8 12             	cmp    $0x12,%eax
c000a788:	75 7d                	jne    c000a807 <inform_int+0xca>
c000a78a:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c000a791:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a794:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a79a:	83 ec 08             	sub    $0x8,%esp
c000a79d:	ff 75 f0             	pushl  -0x10(%ebp)
c000a7a0:	50                   	push   %eax
c000a7a1:	e8 0a ca ff ff       	call   c00071b0 <alloc_virtual_memory>
c000a7a6:	83 c4 10             	add    $0x10,%esp
c000a7a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a7ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a7af:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a7b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a7b8:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7c2:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a7c9:	00 00 00 
c000a7cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7cf:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a7d6:	00 00 00 
c000a7d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7e3:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a7ea:	83 ec 0c             	sub    $0xc,%esp
c000a7ed:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7f0:	e8 f1 fd ff ff       	call   c000a5e6 <unblock>
c000a7f5:	83 c4 10             	add    $0x10,%esp
c000a7f8:	eb 0d                	jmp    c000a807 <inform_int+0xca>
c000a7fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7fd:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a804:	00 00 00 
c000a807:	90                   	nop
c000a808:	c9                   	leave  
c000a809:	c3                   	ret    

c000a80a <strcmp>:
c000a80a:	55                   	push   %ebp
c000a80b:	89 e5                	mov    %esp,%ebp
c000a80d:	83 ec 10             	sub    $0x10,%esp
c000a810:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a814:	74 06                	je     c000a81c <strcmp+0x12>
c000a816:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a81a:	75 08                	jne    c000a824 <strcmp+0x1a>
c000a81c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a81f:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a822:	eb 53                	jmp    c000a877 <strcmp+0x6d>
c000a824:	8b 45 08             	mov    0x8(%ebp),%eax
c000a827:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a82a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a82d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a830:	eb 18                	jmp    c000a84a <strcmp+0x40>
c000a832:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a835:	0f b6 10             	movzbl (%eax),%edx
c000a838:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a83b:	0f b6 00             	movzbl (%eax),%eax
c000a83e:	38 c2                	cmp    %al,%dl
c000a840:	75 1e                	jne    c000a860 <strcmp+0x56>
c000a842:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a846:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a84a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a84d:	0f b6 00             	movzbl (%eax),%eax
c000a850:	84 c0                	test   %al,%al
c000a852:	74 0d                	je     c000a861 <strcmp+0x57>
c000a854:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a857:	0f b6 00             	movzbl (%eax),%eax
c000a85a:	84 c0                	test   %al,%al
c000a85c:	75 d4                	jne    c000a832 <strcmp+0x28>
c000a85e:	eb 01                	jmp    c000a861 <strcmp+0x57>
c000a860:	90                   	nop
c000a861:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a864:	0f b6 00             	movzbl (%eax),%eax
c000a867:	0f be d0             	movsbl %al,%edx
c000a86a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a86d:	0f b6 00             	movzbl (%eax),%eax
c000a870:	0f be c0             	movsbl %al,%eax
c000a873:	29 c2                	sub    %eax,%edx
c000a875:	89 d0                	mov    %edx,%eax
c000a877:	c9                   	leave  
c000a878:	c3                   	ret    

c000a879 <create_user_process_address_space>:
c000a879:	55                   	push   %ebp
c000a87a:	89 e5                	mov    %esp,%ebp
c000a87c:	83 ec 18             	sub    $0x18,%esp
c000a87f:	83 ec 08             	sub    $0x8,%esp
c000a882:	6a 00                	push   $0x0
c000a884:	6a 01                	push   $0x1
c000a886:	e8 d4 ca ff ff       	call   c000735f <alloc_memory>
c000a88b:	83 c4 10             	add    $0x10,%esp
c000a88e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a891:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a894:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a89b:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a8a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a8a5:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a8aa:	c1 e8 0c             	shr    $0xc,%eax
c000a8ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a8b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a8b3:	83 c0 07             	add    $0x7,%eax
c000a8b6:	c1 e8 03             	shr    $0x3,%eax
c000a8b9:	89 c2                	mov    %eax,%edx
c000a8bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8be:	89 50 04             	mov    %edx,0x4(%eax)
c000a8c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8c4:	8b 40 04             	mov    0x4(%eax),%eax
c000a8c7:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a8cc:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a8d2:	85 c0                	test   %eax,%eax
c000a8d4:	0f 48 c2             	cmovs  %edx,%eax
c000a8d7:	c1 f8 0c             	sar    $0xc,%eax
c000a8da:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a8dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a8e0:	83 ec 08             	sub    $0x8,%esp
c000a8e3:	6a 00                	push   $0x0
c000a8e5:	50                   	push   %eax
c000a8e6:	e8 74 ca ff ff       	call   c000735f <alloc_memory>
c000a8eb:	83 c4 10             	add    $0x10,%esp
c000a8ee:	89 c2                	mov    %eax,%edx
c000a8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8f3:	89 10                	mov    %edx,(%eax)
c000a8f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8f8:	83 ec 0c             	sub    $0xc,%esp
c000a8fb:	50                   	push   %eax
c000a8fc:	e8 4c c4 ff ff       	call   c0006d4d <init_bitmap>
c000a901:	83 c4 10             	add    $0x10,%esp
c000a904:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a907:	c9                   	leave  
c000a908:	c3                   	ret    

c000a909 <user_process>:
c000a909:	55                   	push   %ebp
c000a90a:	89 e5                	mov    %esp,%ebp
c000a90c:	83 ec 38             	sub    $0x38,%esp
c000a90f:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a916:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a91d:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a924:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a928:	75 0e                	jne    c000a938 <user_process+0x2f>
c000a92a:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a930:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a936:	eb 0c                	jmp    c000a944 <user_process+0x3b>
c000a938:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a93e:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a944:	e8 47 6f ff ff       	call   c0001890 <get_running_thread_pcb>
c000a949:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a94c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a94f:	05 00 10 00 00       	add    $0x1000,%eax
c000a954:	89 c2                	mov    %eax,%edx
c000a956:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a959:	89 10                	mov    %edx,(%eax)
c000a95b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a95e:	8b 00                	mov    (%eax),%eax
c000a960:	83 e8 44             	sub    $0x44,%eax
c000a963:	89 c2                	mov    %eax,%edx
c000a965:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a968:	89 10                	mov    %edx,(%eax)
c000a96a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a96d:	8b 00                	mov    (%eax),%eax
c000a96f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a972:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a976:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a97c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a980:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a984:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a988:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a98c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a990:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a994:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a99a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a99e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9a1:	89 50 34             	mov    %edx,0x34(%eax)
c000a9a4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a9a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9ab:	89 50 0c             	mov    %edx,0xc(%eax)
c000a9ae:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a9b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9b5:	89 50 04             	mov    %edx,0x4(%eax)
c000a9b8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a9bc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9bf:	89 50 08             	mov    %edx,0x8(%eax)
c000a9c2:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a9c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9c9:	89 50 40             	mov    %edx,0x40(%eax)
c000a9cc:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a9d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9d3:	89 10                	mov    %edx,(%eax)
c000a9d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9d8:	8b 55 08             	mov    0x8(%ebp),%edx
c000a9db:	89 50 30             	mov    %edx,0x30(%eax)
c000a9de:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a9e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9e5:	89 50 38             	mov    %edx,0x38(%eax)
c000a9e8:	83 ec 08             	sub    $0x8,%esp
c000a9eb:	6a 01                	push   $0x1
c000a9ed:	68 00 f0 ff bf       	push   $0xbffff000
c000a9f2:	e8 b2 c8 ff ff       	call   c00072a9 <alloc_physical_memory>
c000a9f7:	83 c4 10             	add    $0x10,%esp
c000a9fa:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000aa00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aa03:	89 50 3c             	mov    %edx,0x3c(%eax)
c000aa06:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aa09:	83 ec 0c             	sub    $0xc,%esp
c000aa0c:	50                   	push   %eax
c000aa0d:	e8 53 6d ff ff       	call   c0001765 <restart>
c000aa12:	83 c4 10             	add    $0x10,%esp
c000aa15:	90                   	nop
c000aa16:	c9                   	leave  
c000aa17:	c3                   	ret    

c000aa18 <clone_pcb>:
c000aa18:	55                   	push   %ebp
c000aa19:	89 e5                	mov    %esp,%ebp
c000aa1b:	83 ec 18             	sub    $0x18,%esp
c000aa1e:	83 ec 08             	sub    $0x8,%esp
c000aa21:	6a 00                	push   $0x0
c000aa23:	6a 01                	push   $0x1
c000aa25:	e8 35 c9 ff ff       	call   c000735f <alloc_memory>
c000aa2a:	83 c4 10             	add    $0x10,%esp
c000aa2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000aa30:	83 ec 04             	sub    $0x4,%esp
c000aa33:	68 00 10 00 00       	push   $0x1000
c000aa38:	6a 00                	push   $0x0
c000aa3a:	ff 75 f4             	pushl  -0xc(%ebp)
c000aa3d:	e8 f5 16 00 00       	call   c000c137 <Memset>
c000aa42:	83 c4 10             	add    $0x10,%esp
c000aa45:	83 ec 04             	sub    $0x4,%esp
c000aa48:	68 00 10 00 00       	push   $0x1000
c000aa4d:	ff 75 08             	pushl  0x8(%ebp)
c000aa50:	ff 75 f4             	pushl  -0xc(%ebp)
c000aa53:	e8 09 d2 ff ff       	call   c0007c61 <Memcpy>
c000aa58:	83 c4 10             	add    $0x10,%esp
c000aa5b:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000aa60:	83 c0 01             	add    $0x1,%eax
c000aa63:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000aa68:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000aa6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa71:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000aa77:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa7a:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000aa80:	89 c2                	mov    %eax,%edx
c000aa82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa85:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000aa8b:	83 ec 08             	sub    $0x8,%esp
c000aa8e:	6a 00                	push   $0x0
c000aa90:	6a 01                	push   $0x1
c000aa92:	e8 c8 c8 ff ff       	call   c000735f <alloc_memory>
c000aa97:	83 c4 10             	add    $0x10,%esp
c000aa9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aaa0:	05 00 0c 00 00       	add    $0xc00,%eax
c000aaa5:	83 ec 04             	sub    $0x4,%esp
c000aaa8:	68 00 04 00 00       	push   $0x400
c000aaad:	68 00 fc ff ff       	push   $0xfffffc00
c000aab2:	50                   	push   %eax
c000aab3:	e8 a9 d1 ff ff       	call   c0007c61 <Memcpy>
c000aab8:	83 c4 10             	add    $0x10,%esp
c000aabb:	83 ec 0c             	sub    $0xc,%esp
c000aabe:	ff 75 f0             	pushl  -0x10(%ebp)
c000aac1:	e8 b1 c7 ff ff       	call   c0007277 <get_physical_address>
c000aac6:	83 c4 10             	add    $0x10,%esp
c000aac9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aacc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aacf:	05 fc 0f 00 00       	add    $0xffc,%eax
c000aad4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aad7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000aada:	83 c8 07             	or     $0x7,%eax
c000aadd:	89 c2                	mov    %eax,%edx
c000aadf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aae2:	89 10                	mov    %edx,(%eax)
c000aae4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aae7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000aaea:	89 50 08             	mov    %edx,0x8(%eax)
c000aaed:	e8 87 fd ff ff       	call   c000a879 <create_user_process_address_space>
c000aaf2:	89 c2                	mov    %eax,%edx
c000aaf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aaf7:	89 50 0c             	mov    %edx,0xc(%eax)
c000aafa:	8b 45 08             	mov    0x8(%ebp),%eax
c000aafd:	8b 40 0c             	mov    0xc(%eax),%eax
c000ab00:	89 c2                	mov    %eax,%edx
c000ab02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ab05:	8b 40 0c             	mov    0xc(%eax),%eax
c000ab08:	83 ec 04             	sub    $0x4,%esp
c000ab0b:	6a 0c                	push   $0xc
c000ab0d:	52                   	push   %edx
c000ab0e:	50                   	push   %eax
c000ab0f:	e8 4d d1 ff ff       	call   c0007c61 <Memcpy>
c000ab14:	83 c4 10             	add    $0x10,%esp
c000ab17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ab1a:	c9                   	leave  
c000ab1b:	c3                   	ret    

c000ab1c <build_body_stack>:
c000ab1c:	55                   	push   %ebp
c000ab1d:	89 e5                	mov    %esp,%ebp
c000ab1f:	83 ec 48             	sub    $0x48,%esp
c000ab22:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab25:	8b 40 0c             	mov    0xc(%eax),%eax
c000ab28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ab2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab2e:	8b 50 04             	mov    0x4(%eax),%edx
c000ab31:	8b 00                	mov    (%eax),%eax
c000ab33:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000ab36:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000ab39:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000ab3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ab3f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000ab42:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ab45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab48:	8b 40 08             	mov    0x8(%eax),%eax
c000ab4b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ab4e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000ab55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000ab5c:	e8 9c d0 ff ff       	call   c0007bfd <intr_disable>
c000ab61:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000ab64:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000ab6b:	e9 c2 00 00 00       	jmp    c000ac32 <build_body_stack+0x116>
c000ab70:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ab73:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab76:	01 d0                	add    %edx,%eax
c000ab78:	0f b6 00             	movzbl (%eax),%eax
c000ab7b:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000ab7e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000ab85:	e9 9a 00 00 00       	jmp    c000ac24 <build_body_stack+0x108>
c000ab8a:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000ab8e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ab91:	89 c1                	mov    %eax,%ecx
c000ab93:	d3 fa                	sar    %cl,%edx
c000ab95:	89 d0                	mov    %edx,%eax
c000ab97:	83 e0 01             	and    $0x1,%eax
c000ab9a:	85 c0                	test   %eax,%eax
c000ab9c:	75 06                	jne    c000aba4 <build_body_stack+0x88>
c000ab9e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000aba2:	eb 7c                	jmp    c000ac20 <build_body_stack+0x104>
c000aba4:	8b 45 08             	mov    0x8(%ebp),%eax
c000aba7:	8b 40 08             	mov    0x8(%eax),%eax
c000abaa:	83 ec 0c             	sub    $0xc,%esp
c000abad:	50                   	push   %eax
c000abae:	e8 c1 6c ff ff       	call   c0001874 <update_cr3>
c000abb3:	83 c4 10             	add    $0x10,%esp
c000abb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000abb9:	c1 e0 0c             	shl    $0xc,%eax
c000abbc:	89 c2                	mov    %eax,%edx
c000abbe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000abc1:	01 d0                	add    %edx,%eax
c000abc3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000abc6:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000abc9:	8b 45 10             	mov    0x10(%ebp),%eax
c000abcc:	83 ec 04             	sub    $0x4,%esp
c000abcf:	68 00 10 00 00       	push   $0x1000
c000abd4:	52                   	push   %edx
c000abd5:	50                   	push   %eax
c000abd6:	e8 86 d0 ff ff       	call   c0007c61 <Memcpy>
c000abdb:	83 c4 10             	add    $0x10,%esp
c000abde:	8b 45 0c             	mov    0xc(%ebp),%eax
c000abe1:	8b 40 08             	mov    0x8(%eax),%eax
c000abe4:	83 ec 0c             	sub    $0xc,%esp
c000abe7:	50                   	push   %eax
c000abe8:	e8 87 6c ff ff       	call   c0001874 <update_cr3>
c000abed:	83 c4 10             	add    $0x10,%esp
c000abf0:	83 ec 08             	sub    $0x8,%esp
c000abf3:	ff 75 cc             	pushl  -0x34(%ebp)
c000abf6:	6a 01                	push   $0x1
c000abf8:	e8 c4 c7 ff ff       	call   c00073c1 <get_a_virtual_page>
c000abfd:	83 c4 10             	add    $0x10,%esp
c000ac00:	8b 55 10             	mov    0x10(%ebp),%edx
c000ac03:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000ac06:	83 ec 04             	sub    $0x4,%esp
c000ac09:	68 00 10 00 00       	push   $0x1000
c000ac0e:	52                   	push   %edx
c000ac0f:	50                   	push   %eax
c000ac10:	e8 4c d0 ff ff       	call   c0007c61 <Memcpy>
c000ac15:	83 c4 10             	add    $0x10,%esp
c000ac18:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000ac1c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000ac20:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000ac24:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000ac28:	0f 8e 5c ff ff ff    	jle    c000ab8a <build_body_stack+0x6e>
c000ac2e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000ac32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ac35:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000ac38:	0f 87 32 ff ff ff    	ja     c000ab70 <build_body_stack+0x54>
c000ac3e:	83 ec 0c             	sub    $0xc,%esp
c000ac41:	ff 75 d4             	pushl  -0x2c(%ebp)
c000ac44:	e8 dd cf ff ff       	call   c0007c26 <intr_set_status>
c000ac49:	83 c4 10             	add    $0x10,%esp
c000ac4c:	90                   	nop
c000ac4d:	c9                   	leave  
c000ac4e:	c3                   	ret    

c000ac4f <build_process_kernel_stack>:
c000ac4f:	55                   	push   %ebp
c000ac50:	89 e5                	mov    %esp,%ebp
c000ac52:	83 ec 28             	sub    $0x28,%esp
c000ac55:	e8 a3 cf ff ff       	call   c0007bfd <intr_disable>
c000ac5a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac5d:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac60:	05 00 10 00 00       	add    $0x1000,%eax
c000ac65:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac6b:	8b 00                	mov    (%eax),%eax
c000ac6d:	83 f8 38             	cmp    $0x38,%eax
c000ac70:	74 06                	je     c000ac78 <build_process_kernel_stack+0x29>
c000ac72:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000ac76:	eb f0                	jmp    c000ac68 <build_process_kernel_stack+0x19>
c000ac78:	90                   	nop
c000ac79:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac7c:	05 00 10 00 00       	add    $0x1000,%eax
c000ac81:	89 c2                	mov    %eax,%edx
c000ac83:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac86:	89 50 04             	mov    %edx,0x4(%eax)
c000ac89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac8c:	83 c0 2c             	add    $0x2c,%eax
c000ac8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ac92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac95:	83 e8 04             	sub    $0x4,%eax
c000ac98:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ac9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac9e:	83 e8 08             	sub    $0x8,%eax
c000aca1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aca4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aca7:	83 e8 0c             	sub    $0xc,%eax
c000acaa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000acad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acb0:	83 e8 10             	sub    $0x10,%eax
c000acb3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000acb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acb9:	83 e8 14             	sub    $0x14,%eax
c000acbc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000acbf:	ba 5c 17 00 c0       	mov    $0xc000175c,%edx
c000acc4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000acc7:	89 10                	mov    %edx,(%eax)
c000acc9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000accc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000acd2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000acd5:	8b 10                	mov    (%eax),%edx
c000acd7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000acda:	89 10                	mov    %edx,(%eax)
c000acdc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000acdf:	8b 10                	mov    (%eax),%edx
c000ace1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ace4:	89 10                	mov    %edx,(%eax)
c000ace6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ace9:	8b 10                	mov    (%eax),%edx
c000aceb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000acee:	89 10                	mov    %edx,(%eax)
c000acf0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000acf3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000acf9:	8b 45 08             	mov    0x8(%ebp),%eax
c000acfc:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000acff:	89 10                	mov    %edx,(%eax)
c000ad01:	83 ec 0c             	sub    $0xc,%esp
c000ad04:	ff 75 f0             	pushl  -0x10(%ebp)
c000ad07:	e8 1a cf ff ff       	call   c0007c26 <intr_set_status>
c000ad0c:	83 c4 10             	add    $0x10,%esp
c000ad0f:	90                   	nop
c000ad10:	c9                   	leave  
c000ad11:	c3                   	ret    

c000ad12 <fork_process>:
c000ad12:	55                   	push   %ebp
c000ad13:	89 e5                	mov    %esp,%ebp
c000ad15:	83 ec 18             	sub    $0x18,%esp
c000ad18:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad1b:	83 ec 0c             	sub    $0xc,%esp
c000ad1e:	50                   	push   %eax
c000ad1f:	e8 4f a1 ff ff       	call   c0004e73 <pid2proc>
c000ad24:	83 c4 10             	add    $0x10,%esp
c000ad27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad2a:	83 ec 0c             	sub    $0xc,%esp
c000ad2d:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad30:	e8 e3 fc ff ff       	call   c000aa18 <clone_pcb>
c000ad35:	83 c4 10             	add    $0x10,%esp
c000ad38:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad3b:	83 ec 08             	sub    $0x8,%esp
c000ad3e:	6a 00                	push   $0x0
c000ad40:	6a 01                	push   $0x1
c000ad42:	e8 18 c6 ff ff       	call   c000735f <alloc_memory>
c000ad47:	83 c4 10             	add    $0x10,%esp
c000ad4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ad4d:	83 ec 04             	sub    $0x4,%esp
c000ad50:	ff 75 ec             	pushl  -0x14(%ebp)
c000ad53:	ff 75 f0             	pushl  -0x10(%ebp)
c000ad56:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad59:	e8 be fd ff ff       	call   c000ab1c <build_body_stack>
c000ad5e:	83 c4 10             	add    $0x10,%esp
c000ad61:	83 ec 0c             	sub    $0xc,%esp
c000ad64:	ff 75 f0             	pushl  -0x10(%ebp)
c000ad67:	e8 e3 fe ff ff       	call   c000ac4f <build_process_kernel_stack>
c000ad6c:	83 c4 10             	add    $0x10,%esp
c000ad6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad72:	05 00 01 00 00       	add    $0x100,%eax
c000ad77:	83 ec 04             	sub    $0x4,%esp
c000ad7a:	6a 08                	push   $0x8
c000ad7c:	6a 00                	push   $0x0
c000ad7e:	50                   	push   %eax
c000ad7f:	e8 b3 13 00 00       	call   c000c137 <Memset>
c000ad84:	83 c4 10             	add    $0x10,%esp
c000ad87:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad8a:	05 08 01 00 00       	add    $0x108,%eax
c000ad8f:	83 ec 04             	sub    $0x4,%esp
c000ad92:	6a 08                	push   $0x8
c000ad94:	6a 00                	push   $0x0
c000ad96:	50                   	push   %eax
c000ad97:	e8 9b 13 00 00       	call   c000c137 <Memset>
c000ad9c:	83 c4 10             	add    $0x10,%esp
c000ad9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ada2:	05 08 01 00 00       	add    $0x108,%eax
c000ada7:	83 ec 08             	sub    $0x8,%esp
c000adaa:	50                   	push   %eax
c000adab:	68 04 1f 01 c0       	push   $0xc0011f04
c000adb0:	e8 bb 02 00 00       	call   c000b070 <appendToDoubleLinkList>
c000adb5:	83 c4 10             	add    $0x10,%esp
c000adb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adbb:	c9                   	leave  
c000adbc:	c3                   	ret    

c000adbd <process_execute>:
c000adbd:	55                   	push   %ebp
c000adbe:	89 e5                	mov    %esp,%ebp
c000adc0:	83 ec 28             	sub    $0x28,%esp
c000adc3:	e8 be 04 00 00       	call   c000b286 <thread_init>
c000adc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000adcb:	83 ec 0c             	sub    $0xc,%esp
c000adce:	ff 75 f4             	pushl  -0xc(%ebp)
c000add1:	e8 5d 05 00 00       	call   c000b333 <thread_create>
c000add6:	83 c4 10             	add    $0x10,%esp
c000add9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000addc:	05 34 01 00 00       	add    $0x134,%eax
c000ade1:	83 ec 08             	sub    $0x8,%esp
c000ade4:	ff 75 10             	pushl  0x10(%ebp)
c000ade7:	50                   	push   %eax
c000ade8:	e8 69 13 00 00       	call   c000c156 <Strcpy>
c000aded:	83 c4 10             	add    $0x10,%esp
c000adf0:	83 ec 08             	sub    $0x8,%esp
c000adf3:	6a 00                	push   $0x0
c000adf5:	6a 01                	push   $0x1
c000adf7:	e8 63 c5 ff ff       	call   c000735f <alloc_memory>
c000adfc:	83 c4 10             	add    $0x10,%esp
c000adff:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ae02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae05:	05 00 0c 00 00       	add    $0xc00,%eax
c000ae0a:	83 ec 04             	sub    $0x4,%esp
c000ae0d:	68 00 04 00 00       	push   $0x400
c000ae12:	68 00 fc ff ff       	push   $0xfffffc00
c000ae17:	50                   	push   %eax
c000ae18:	e8 44 ce ff ff       	call   c0007c61 <Memcpy>
c000ae1d:	83 c4 10             	add    $0x10,%esp
c000ae20:	83 ec 0c             	sub    $0xc,%esp
c000ae23:	ff 75 f0             	pushl  -0x10(%ebp)
c000ae26:	e8 4c c4 ff ff       	call   c0007277 <get_physical_address>
c000ae2b:	83 c4 10             	add    $0x10,%esp
c000ae2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ae31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae34:	05 fc 0f 00 00       	add    $0xffc,%eax
c000ae39:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ae3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ae3f:	83 c8 07             	or     $0x7,%eax
c000ae42:	89 c2                	mov    %eax,%edx
c000ae44:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ae47:	89 10                	mov    %edx,(%eax)
c000ae49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae4c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ae4f:	89 50 08             	mov    %edx,0x8(%eax)
c000ae52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae55:	83 c0 10             	add    $0x10,%eax
c000ae58:	83 ec 0c             	sub    $0xc,%esp
c000ae5b:	50                   	push   %eax
c000ae5c:	e8 e2 c8 ff ff       	call   c0007743 <init_memory_block_desc>
c000ae61:	83 c4 10             	add    $0x10,%esp
c000ae64:	e8 10 fa ff ff       	call   c000a879 <create_user_process_address_space>
c000ae69:	89 c2                	mov    %eax,%edx
c000ae6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae6e:	89 50 0c             	mov    %edx,0xc(%eax)
c000ae71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae74:	8b 00                	mov    (%eax),%eax
c000ae76:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ae79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae7c:	c7 40 10 09 a9 00 c0 	movl   $0xc000a909,0x10(%eax)
c000ae83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae86:	8b 55 08             	mov    0x8(%ebp),%edx
c000ae89:	89 50 18             	mov    %edx,0x18(%eax)
c000ae8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae8f:	8b 55 0c             	mov    0xc(%ebp),%edx
c000ae92:	89 50 1c             	mov    %edx,0x1c(%eax)
c000ae95:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae98:	8b 55 14             	mov    0x14(%ebp),%edx
c000ae9b:	89 50 20             	mov    %edx,0x20(%eax)
c000ae9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000aea1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aea4:	89 50 24             	mov    %edx,0x24(%eax)
c000aea7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aeaa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000aeb0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aeb3:	8b 10                	mov    (%eax),%edx
c000aeb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aeb8:	89 50 04             	mov    %edx,0x4(%eax)
c000aebb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aebe:	8b 50 04             	mov    0x4(%eax),%edx
c000aec1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aec4:	89 50 08             	mov    %edx,0x8(%eax)
c000aec7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aeca:	8b 50 08             	mov    0x8(%eax),%edx
c000aecd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aed0:	89 50 0c             	mov    %edx,0xc(%eax)
c000aed3:	83 ec 0c             	sub    $0xc,%esp
c000aed6:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aedb:	e8 93 00 00 00       	call   c000af73 <isListEmpty>
c000aee0:	83 c4 10             	add    $0x10,%esp
c000aee3:	e8 15 cd ff ff       	call   c0007bfd <intr_disable>
c000aee8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aeeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aeee:	05 00 01 00 00       	add    $0x100,%eax
c000aef3:	83 ec 08             	sub    $0x8,%esp
c000aef6:	50                   	push   %eax
c000aef7:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aefc:	e8 6f 01 00 00       	call   c000b070 <appendToDoubleLinkList>
c000af01:	83 c4 10             	add    $0x10,%esp
c000af04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af07:	05 08 01 00 00       	add    $0x108,%eax
c000af0c:	83 ec 08             	sub    $0x8,%esp
c000af0f:	50                   	push   %eax
c000af10:	68 04 1f 01 c0       	push   $0xc0011f04
c000af15:	e8 56 01 00 00       	call   c000b070 <appendToDoubleLinkList>
c000af1a:	83 c4 10             	add    $0x10,%esp
c000af1d:	83 ec 0c             	sub    $0xc,%esp
c000af20:	ff 75 e0             	pushl  -0x20(%ebp)
c000af23:	e8 fe cc ff ff       	call   c0007c26 <intr_set_status>
c000af28:	83 c4 10             	add    $0x10,%esp
c000af2b:	90                   	nop
c000af2c:	c9                   	leave  
c000af2d:	c3                   	ret    
c000af2e:	66 90                	;xchg   %ax,%ax

c000af30 <switch_to>:
c000af30:	56                   	push   %esi
c000af31:	57                   	push   %edi
c000af32:	53                   	push   %ebx
c000af33:	55                   	push   %ebp
c000af34:	89 e5                	mov    %esp,%ebp
c000af36:	8b 45 14             	mov    0x14(%ebp),%eax
c000af39:	89 20                	mov    %esp,(%eax)
c000af3b:	8b 45 18             	mov    0x18(%ebp),%eax
c000af3e:	8b 20                	mov    (%eax),%esp
c000af40:	5d                   	pop    %ebp
c000af41:	5b                   	pop    %ebx
c000af42:	5f                   	pop    %edi
c000af43:	5e                   	pop    %esi
c000af44:	c3                   	ret    

c000af45 <initDoubleLinkList>:
c000af45:	55                   	push   %ebp
c000af46:	89 e5                	mov    %esp,%ebp
c000af48:	8b 45 08             	mov    0x8(%ebp),%eax
c000af4b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000af51:	8b 45 08             	mov    0x8(%ebp),%eax
c000af54:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000af5b:	8b 45 08             	mov    0x8(%ebp),%eax
c000af5e:	8d 50 08             	lea    0x8(%eax),%edx
c000af61:	8b 45 08             	mov    0x8(%ebp),%eax
c000af64:	89 50 04             	mov    %edx,0x4(%eax)
c000af67:	8b 55 08             	mov    0x8(%ebp),%edx
c000af6a:	8b 45 08             	mov    0x8(%ebp),%eax
c000af6d:	89 50 08             	mov    %edx,0x8(%eax)
c000af70:	90                   	nop
c000af71:	5d                   	pop    %ebp
c000af72:	c3                   	ret    

c000af73 <isListEmpty>:
c000af73:	55                   	push   %ebp
c000af74:	89 e5                	mov    %esp,%ebp
c000af76:	8b 45 08             	mov    0x8(%ebp),%eax
c000af79:	8b 40 04             	mov    0x4(%eax),%eax
c000af7c:	8b 55 08             	mov    0x8(%ebp),%edx
c000af7f:	83 c2 08             	add    $0x8,%edx
c000af82:	39 d0                	cmp    %edx,%eax
c000af84:	75 07                	jne    c000af8d <isListEmpty+0x1a>
c000af86:	b8 01 00 00 00       	mov    $0x1,%eax
c000af8b:	eb 05                	jmp    c000af92 <isListEmpty+0x1f>
c000af8d:	b8 00 00 00 00       	mov    $0x0,%eax
c000af92:	5d                   	pop    %ebp
c000af93:	c3                   	ret    

c000af94 <findElementInList>:
c000af94:	55                   	push   %ebp
c000af95:	89 e5                	mov    %esp,%ebp
c000af97:	83 ec 28             	sub    $0x28,%esp
c000af9a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000af9e:	75 19                	jne    c000afb9 <findElementInList+0x25>
c000afa0:	6a 60                	push   $0x60
c000afa2:	68 dd c0 00 c0       	push   $0xc000c0dd
c000afa7:	68 dd c0 00 c0       	push   $0xc000c0dd
c000afac:	68 f0 c0 00 c0       	push   $0xc000c0f0
c000afb1:	e8 cc eb ff ff       	call   c0009b82 <assertion_failure>
c000afb6:	83 c4 10             	add    $0x10,%esp
c000afb9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000afbd:	75 19                	jne    c000afd8 <findElementInList+0x44>
c000afbf:	6a 61                	push   $0x61
c000afc1:	68 dd c0 00 c0       	push   $0xc000c0dd
c000afc6:	68 dd c0 00 c0       	push   $0xc000c0dd
c000afcb:	68 fc c0 00 c0       	push   $0xc000c0fc
c000afd0:	e8 ad eb ff ff       	call   c0009b82 <assertion_failure>
c000afd5:	83 c4 10             	add    $0x10,%esp
c000afd8:	e8 20 cc ff ff       	call   c0007bfd <intr_disable>
c000afdd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000afe0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000afe7:	8b 45 08             	mov    0x8(%ebp),%eax
c000afea:	8b 40 08             	mov    0x8(%eax),%eax
c000afed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aff0:	8b 45 08             	mov    0x8(%ebp),%eax
c000aff3:	8b 40 04             	mov    0x4(%eax),%eax
c000aff6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aff9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000affd:	75 07                	jne    c000b006 <findElementInList+0x72>
c000afff:	b8 00 00 00 00       	mov    $0x0,%eax
c000b004:	eb 68                	jmp    c000b06e <findElementInList+0xda>
c000b006:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b009:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000b00c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000b00f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000b012:	c1 f8 03             	sar    $0x3,%eax
c000b015:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000b018:	eb 36                	jmp    c000b050 <findElementInList+0xbc>
c000b01a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b01d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000b020:	75 07                	jne    c000b029 <findElementInList+0x95>
c000b022:	b8 01 00 00 00       	mov    $0x1,%eax
c000b027:	eb 45                	jmp    c000b06e <findElementInList+0xda>
c000b029:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b02d:	75 07                	jne    c000b036 <findElementInList+0xa2>
c000b02f:	b8 00 00 00 00       	mov    $0x0,%eax
c000b034:	eb 38                	jmp    c000b06e <findElementInList+0xda>
c000b036:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b039:	8b 40 04             	mov    0x4(%eax),%eax
c000b03c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b03f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b043:	75 07                	jne    c000b04c <findElementInList+0xb8>
c000b045:	b8 00 00 00 00       	mov    $0x0,%eax
c000b04a:	eb 22                	jmp    c000b06e <findElementInList+0xda>
c000b04c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000b050:	8b 45 08             	mov    0x8(%ebp),%eax
c000b053:	83 c0 08             	add    $0x8,%eax
c000b056:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000b059:	75 bf                	jne    c000b01a <findElementInList+0x86>
c000b05b:	83 ec 0c             	sub    $0xc,%esp
c000b05e:	ff 75 ec             	pushl  -0x14(%ebp)
c000b061:	e8 c0 cb ff ff       	call   c0007c26 <intr_set_status>
c000b066:	83 c4 10             	add    $0x10,%esp
c000b069:	b8 00 00 00 00       	mov    $0x0,%eax
c000b06e:	c9                   	leave  
c000b06f:	c3                   	ret    

c000b070 <appendToDoubleLinkList>:
c000b070:	55                   	push   %ebp
c000b071:	89 e5                	mov    %esp,%ebp
c000b073:	83 ec 18             	sub    $0x18,%esp
c000b076:	83 ec 08             	sub    $0x8,%esp
c000b079:	ff 75 0c             	pushl  0xc(%ebp)
c000b07c:	ff 75 08             	pushl  0x8(%ebp)
c000b07f:	e8 10 ff ff ff       	call   c000af94 <findElementInList>
c000b084:	83 c4 10             	add    $0x10,%esp
c000b087:	3c 01                	cmp    $0x1,%al
c000b089:	0f 84 c2 00 00 00    	je     c000b151 <appendToDoubleLinkList+0xe1>
c000b08f:	e8 69 cb ff ff       	call   c0007bfd <intr_disable>
c000b094:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b097:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000b09b:	75 1c                	jne    c000b0b9 <appendToDoubleLinkList+0x49>
c000b09d:	68 9e 00 00 00       	push   $0x9e
c000b0a2:	68 dd c0 00 c0       	push   $0xc000c0dd
c000b0a7:	68 dd c0 00 c0       	push   $0xc000c0dd
c000b0ac:	68 f0 c0 00 c0       	push   $0xc000c0f0
c000b0b1:	e8 cc ea ff ff       	call   c0009b82 <assertion_failure>
c000b0b6:	83 c4 10             	add    $0x10,%esp
c000b0b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000b0bd:	75 1c                	jne    c000b0db <appendToDoubleLinkList+0x6b>
c000b0bf:	68 9f 00 00 00       	push   $0x9f
c000b0c4:	68 dd c0 00 c0       	push   $0xc000c0dd
c000b0c9:	68 dd c0 00 c0       	push   $0xc000c0dd
c000b0ce:	68 fc c0 00 c0       	push   $0xc000c0fc
c000b0d3:	e8 aa ea ff ff       	call   c0009b82 <assertion_failure>
c000b0d8:	83 c4 10             	add    $0x10,%esp
c000b0db:	83 ec 08             	sub    $0x8,%esp
c000b0de:	ff 75 0c             	pushl  0xc(%ebp)
c000b0e1:	ff 75 08             	pushl  0x8(%ebp)
c000b0e4:	e8 ab fe ff ff       	call   c000af94 <findElementInList>
c000b0e9:	83 c4 10             	add    $0x10,%esp
c000b0ec:	3c 01                	cmp    $0x1,%al
c000b0ee:	74 64                	je     c000b154 <appendToDoubleLinkList+0xe4>
c000b0f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b0f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b0f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0f9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b100:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b103:	8b 50 04             	mov    0x4(%eax),%edx
c000b106:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b109:	89 10                	mov    %edx,(%eax)
c000b10b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b10e:	8b 50 08             	mov    0x8(%eax),%edx
c000b111:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b114:	89 10                	mov    %edx,(%eax)
c000b116:	8b 45 08             	mov    0x8(%ebp),%eax
c000b119:	8b 40 08             	mov    0x8(%eax),%eax
c000b11c:	85 c0                	test   %eax,%eax
c000b11e:	74 0c                	je     c000b12c <appendToDoubleLinkList+0xbc>
c000b120:	8b 45 08             	mov    0x8(%ebp),%eax
c000b123:	8b 40 08             	mov    0x8(%eax),%eax
c000b126:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b129:	89 50 04             	mov    %edx,0x4(%eax)
c000b12c:	8b 45 08             	mov    0x8(%ebp),%eax
c000b12f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b132:	89 50 08             	mov    %edx,0x8(%eax)
c000b135:	8b 45 08             	mov    0x8(%ebp),%eax
c000b138:	8d 50 08             	lea    0x8(%eax),%edx
c000b13b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b13e:	89 50 04             	mov    %edx,0x4(%eax)
c000b141:	83 ec 0c             	sub    $0xc,%esp
c000b144:	ff 75 f4             	pushl  -0xc(%ebp)
c000b147:	e8 da ca ff ff       	call   c0007c26 <intr_set_status>
c000b14c:	83 c4 10             	add    $0x10,%esp
c000b14f:	eb 04                	jmp    c000b155 <appendToDoubleLinkList+0xe5>
c000b151:	90                   	nop
c000b152:	eb 01                	jmp    c000b155 <appendToDoubleLinkList+0xe5>
c000b154:	90                   	nop
c000b155:	c9                   	leave  
c000b156:	c3                   	ret    

c000b157 <insertToDoubleLinkList>:
c000b157:	55                   	push   %ebp
c000b158:	89 e5                	mov    %esp,%ebp
c000b15a:	83 ec 18             	sub    $0x18,%esp
c000b15d:	83 ec 08             	sub    $0x8,%esp
c000b160:	ff 75 0c             	pushl  0xc(%ebp)
c000b163:	ff 75 08             	pushl  0x8(%ebp)
c000b166:	e8 29 fe ff ff       	call   c000af94 <findElementInList>
c000b16b:	83 c4 10             	add    $0x10,%esp
c000b16e:	3c 01                	cmp    $0x1,%al
c000b170:	74 65                	je     c000b1d7 <insertToDoubleLinkList+0x80>
c000b172:	e8 86 ca ff ff       	call   c0007bfd <intr_disable>
c000b177:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b17a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b17d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b180:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b183:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b18a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b18d:	8b 50 04             	mov    0x4(%eax),%edx
c000b190:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b193:	89 10                	mov    %edx,(%eax)
c000b195:	8b 45 08             	mov    0x8(%ebp),%eax
c000b198:	8b 50 04             	mov    0x4(%eax),%edx
c000b19b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b19e:	89 50 04             	mov    %edx,0x4(%eax)
c000b1a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1a4:	8b 40 04             	mov    0x4(%eax),%eax
c000b1a7:	85 c0                	test   %eax,%eax
c000b1a9:	74 0b                	je     c000b1b6 <insertToDoubleLinkList+0x5f>
c000b1ab:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1ae:	8b 40 04             	mov    0x4(%eax),%eax
c000b1b1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b1b4:	89 10                	mov    %edx,(%eax)
c000b1b6:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b1bc:	89 50 04             	mov    %edx,0x4(%eax)
c000b1bf:	8b 55 08             	mov    0x8(%ebp),%edx
c000b1c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b1c5:	89 10                	mov    %edx,(%eax)
c000b1c7:	83 ec 0c             	sub    $0xc,%esp
c000b1ca:	ff 75 f4             	pushl  -0xc(%ebp)
c000b1cd:	e8 54 ca ff ff       	call   c0007c26 <intr_set_status>
c000b1d2:	83 c4 10             	add    $0x10,%esp
c000b1d5:	eb 01                	jmp    c000b1d8 <insertToDoubleLinkList+0x81>
c000b1d7:	90                   	nop
c000b1d8:	c9                   	leave  
c000b1d9:	c3                   	ret    

c000b1da <popFromDoubleLinkList>:
c000b1da:	55                   	push   %ebp
c000b1db:	89 e5                	mov    %esp,%ebp
c000b1dd:	83 ec 18             	sub    $0x18,%esp
c000b1e0:	e8 18 ca ff ff       	call   c0007bfd <intr_disable>
c000b1e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b1e8:	83 ec 0c             	sub    $0xc,%esp
c000b1eb:	ff 75 08             	pushl  0x8(%ebp)
c000b1ee:	e8 80 fd ff ff       	call   c000af73 <isListEmpty>
c000b1f3:	83 c4 10             	add    $0x10,%esp
c000b1f6:	3c 01                	cmp    $0x1,%al
c000b1f8:	75 07                	jne    c000b201 <popFromDoubleLinkList+0x27>
c000b1fa:	b8 00 00 00 00       	mov    $0x0,%eax
c000b1ff:	eb 6b                	jmp    c000b26c <popFromDoubleLinkList+0x92>
c000b201:	8b 45 08             	mov    0x8(%ebp),%eax
c000b204:	8b 40 08             	mov    0x8(%eax),%eax
c000b207:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b20a:	8b 45 08             	mov    0x8(%ebp),%eax
c000b20d:	8b 40 08             	mov    0x8(%eax),%eax
c000b210:	85 c0                	test   %eax,%eax
c000b212:	75 07                	jne    c000b21b <popFromDoubleLinkList+0x41>
c000b214:	b8 00 00 00 00       	mov    $0x0,%eax
c000b219:	eb 51                	jmp    c000b26c <popFromDoubleLinkList+0x92>
c000b21b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b21e:	8b 40 08             	mov    0x8(%eax),%eax
c000b221:	8b 00                	mov    (%eax),%eax
c000b223:	85 c0                	test   %eax,%eax
c000b225:	74 11                	je     c000b238 <popFromDoubleLinkList+0x5e>
c000b227:	8b 45 08             	mov    0x8(%ebp),%eax
c000b22a:	8b 40 08             	mov    0x8(%eax),%eax
c000b22d:	8b 00                	mov    (%eax),%eax
c000b22f:	8b 55 08             	mov    0x8(%ebp),%edx
c000b232:	83 c2 08             	add    $0x8,%edx
c000b235:	89 50 04             	mov    %edx,0x4(%eax)
c000b238:	8b 45 08             	mov    0x8(%ebp),%eax
c000b23b:	8b 40 08             	mov    0x8(%eax),%eax
c000b23e:	8b 10                	mov    (%eax),%edx
c000b240:	8b 45 08             	mov    0x8(%ebp),%eax
c000b243:	89 50 08             	mov    %edx,0x8(%eax)
c000b246:	83 ec 0c             	sub    $0xc,%esp
c000b249:	ff 75 f4             	pushl  -0xc(%ebp)
c000b24c:	e8 d5 c9 ff ff       	call   c0007c26 <intr_set_status>
c000b251:	83 c4 10             	add    $0x10,%esp
c000b254:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b257:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b25e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b261:	8b 50 04             	mov    0x4(%eax),%edx
c000b264:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b267:	89 10                	mov    %edx,(%eax)
c000b269:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b26c:	c9                   	leave  
c000b26d:	c3                   	ret    

c000b26e <kernel_thread>:
c000b26e:	55                   	push   %ebp
c000b26f:	89 e5                	mov    %esp,%ebp
c000b271:	83 ec 08             	sub    $0x8,%esp
c000b274:	fb                   	sti    
c000b275:	83 ec 0c             	sub    $0xc,%esp
c000b278:	ff 75 0c             	pushl  0xc(%ebp)
c000b27b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b27e:	ff d0                	call   *%eax
c000b280:	83 c4 10             	add    $0x10,%esp
c000b283:	90                   	nop
c000b284:	c9                   	leave  
c000b285:	c3                   	ret    

c000b286 <thread_init>:
c000b286:	55                   	push   %ebp
c000b287:	89 e5                	mov    %esp,%ebp
c000b289:	83 ec 18             	sub    $0x18,%esp
c000b28c:	83 ec 08             	sub    $0x8,%esp
c000b28f:	6a 00                	push   $0x0
c000b291:	6a 01                	push   $0x1
c000b293:	e8 c7 c0 ff ff       	call   c000735f <alloc_memory>
c000b298:	83 c4 10             	add    $0x10,%esp
c000b29b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b29e:	83 ec 04             	sub    $0x4,%esp
c000b2a1:	68 00 10 00 00       	push   $0x1000
c000b2a6:	6a 00                	push   $0x0
c000b2a8:	ff 75 f4             	pushl  -0xc(%ebp)
c000b2ab:	e8 87 0e 00 00       	call   c000c137 <Memset>
c000b2b0:	83 c4 10             	add    $0x10,%esp
c000b2b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2b6:	05 00 10 00 00       	add    $0x1000,%eax
c000b2bb:	89 c2                	mov    %eax,%edx
c000b2bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2c0:	89 10                	mov    %edx,(%eax)
c000b2c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2c5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000b2cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2cf:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000b2d6:	ff ff ff 
c000b2d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2dc:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000b2e3:	00 00 00 
c000b2e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2e9:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000b2ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2f2:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000b2f8:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000b2fd:	83 c0 01             	add    $0x1,%eax
c000b300:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000b305:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000b30b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b30e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000b314:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b317:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000b31e:	00 00 00 
c000b321:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b324:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000b32b:	cd ab 99 
c000b32e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b331:	c9                   	leave  
c000b332:	c3                   	ret    

c000b333 <thread_create>:
c000b333:	55                   	push   %ebp
c000b334:	89 e5                	mov    %esp,%ebp
c000b336:	83 ec 10             	sub    $0x10,%esp
c000b339:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000b340:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000b347:	8b 45 08             	mov    0x8(%ebp),%eax
c000b34a:	8b 00                	mov    (%eax),%eax
c000b34c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000b34f:	89 c2                	mov    %eax,%edx
c000b351:	8b 45 08             	mov    0x8(%ebp),%eax
c000b354:	89 10                	mov    %edx,(%eax)
c000b356:	8b 45 08             	mov    0x8(%ebp),%eax
c000b359:	8b 00                	mov    (%eax),%eax
c000b35b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000b35e:	89 c2                	mov    %eax,%edx
c000b360:	8b 45 08             	mov    0x8(%ebp),%eax
c000b363:	89 10                	mov    %edx,(%eax)
c000b365:	90                   	nop
c000b366:	c9                   	leave  
c000b367:	c3                   	ret    

c000b368 <thread_start>:
c000b368:	55                   	push   %ebp
c000b369:	89 e5                	mov    %esp,%ebp
c000b36b:	83 ec 18             	sub    $0x18,%esp
c000b36e:	e8 13 ff ff ff       	call   c000b286 <thread_init>
c000b373:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b376:	83 ec 0c             	sub    $0xc,%esp
c000b379:	ff 75 f4             	pushl  -0xc(%ebp)
c000b37c:	e8 b2 ff ff ff       	call   c000b333 <thread_create>
c000b381:	83 c4 10             	add    $0x10,%esp
c000b384:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b387:	05 34 01 00 00       	add    $0x134,%eax
c000b38c:	83 ec 08             	sub    $0x8,%esp
c000b38f:	ff 75 10             	pushl  0x10(%ebp)
c000b392:	50                   	push   %eax
c000b393:	e8 be 0d 00 00       	call   c000c156 <Strcpy>
c000b398:	83 c4 10             	add    $0x10,%esp
c000b39b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b39e:	8b 00                	mov    (%eax),%eax
c000b3a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b3a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3a6:	c7 40 10 6e b2 00 c0 	movl   $0xc000b26e,0x10(%eax)
c000b3ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3b0:	8b 55 08             	mov    0x8(%ebp),%edx
c000b3b3:	89 50 18             	mov    %edx,0x18(%eax)
c000b3b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3b9:	8b 55 0c             	mov    0xc(%ebp),%edx
c000b3bc:	89 50 1c             	mov    %edx,0x1c(%eax)
c000b3bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3c2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b3c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3cb:	8b 10                	mov    (%eax),%edx
c000b3cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3d0:	89 50 04             	mov    %edx,0x4(%eax)
c000b3d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3d6:	8b 50 04             	mov    0x4(%eax),%edx
c000b3d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3dc:	89 50 08             	mov    %edx,0x8(%eax)
c000b3df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3e2:	8b 50 08             	mov    0x8(%eax),%edx
c000b3e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3e8:	89 50 0c             	mov    %edx,0xc(%eax)
c000b3eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b3ee:	05 00 01 00 00       	add    $0x100,%eax
c000b3f3:	83 ec 08             	sub    $0x8,%esp
c000b3f6:	50                   	push   %eax
c000b3f7:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b3fc:	e8 6f fc ff ff       	call   c000b070 <appendToDoubleLinkList>
c000b401:	83 c4 10             	add    $0x10,%esp
c000b404:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b407:	05 08 01 00 00       	add    $0x108,%eax
c000b40c:	83 ec 08             	sub    $0x8,%esp
c000b40f:	50                   	push   %eax
c000b410:	68 04 1f 01 c0       	push   $0xc0011f04
c000b415:	e8 56 fc ff ff       	call   c000b070 <appendToDoubleLinkList>
c000b41a:	83 c4 10             	add    $0x10,%esp
c000b41d:	90                   	nop
c000b41e:	c9                   	leave  
c000b41f:	c3                   	ret    
