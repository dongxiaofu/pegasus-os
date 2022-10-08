
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
c0001525:	e8 a1 3c 00 00       	call   c00051cb <ReloadGDT>
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
c000156a:	e8 c9 6f 00 00       	call   c0008538 <test>
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
c0001661:	e8 eb 69 00 00       	call   c0008051 <exception_handler>
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
c000168d:	e8 43 37 00 00       	call   c0004dd5 <clock_handler>
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
c00016be:	e8 4d 46 00 00       	call   c0005d10 <keyboard_handler>
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
c00017e2:	e8 04 67 00 00       	call   c0007eeb <disp_int>
c00017e7:	83 c4 04             	add    $0x4,%esp
c00017ea:	58                   	pop    %eax
c00017eb:	5a                   	pop    %edx
c00017ec:	52                   	push   %edx
c00017ed:	50                   	push   %eax
c00017ee:	e8 f8 66 00 00       	call   c0007eeb <disp_int>
c00017f3:	58                   	pop    %eax
c00017f4:	5a                   	pop    %edx
c00017f5:	52                   	push   %edx
c00017f6:	50                   	push   %eax
c00017f7:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c00017fd:	e8 e9 66 00 00       	call   c0007eeb <disp_int>
c0001802:	83 c4 04             	add    $0x4,%esp
c0001805:	58                   	pop    %eax
c0001806:	5a                   	pop    %edx
c0001807:	52                   	push   %edx
c0001808:	50                   	push   %eax
c0001809:	ff 72 ec             	pushl  -0x14(%edx)
c000180c:	e8 da 66 00 00       	call   c0007eeb <disp_int>
c0001811:	83 c4 04             	add    $0x4,%esp
c0001814:	58                   	pop    %eax
c0001815:	5a                   	pop    %edx
c0001816:	52                   	push   %edx
c0001817:	50                   	push   %eax
c0001818:	ff 70 ec             	pushl  -0x14(%eax)
c000181b:	e8 cb 66 00 00       	call   c0007eeb <disp_int>
c0001820:	83 c4 04             	add    $0x4,%esp
c0001823:	58                   	pop    %eax
c0001824:	5a                   	pop    %edx
c0001825:	52                   	push   %edx
c0001826:	50                   	push   %eax
c0001827:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c000182d:	e8 b9 66 00 00       	call   c0007eeb <disp_int>
c0001832:	83 c4 04             	add    $0x4,%esp
c0001835:	58                   	pop    %eax
c0001836:	5a                   	pop    %edx
c0001837:	52                   	push   %edx
c0001838:	50                   	push   %eax
c0001839:	68 60 07 01 c0       	push   $0xc0010760
c000183e:	e8 a8 66 00 00       	call   c0007eeb <disp_int>
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
c00018c0:	e8 3b 92 00 00       	call   c000ab00 <appendToDoubleLinkList>
c00018c5:	83 c4 10             	add    $0x10,%esp
c00018c8:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018cd:	05 08 01 00 00       	add    $0x108,%eax
c00018d2:	83 ec 08             	sub    $0x8,%esp
c00018d5:	50                   	push   %eax
c00018d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018db:	e8 20 92 00 00       	call   c000ab00 <appendToDoubleLinkList>
c00018e0:	83 c4 10             	add    $0x10,%esp
c00018e3:	6a 00                	push   $0x0
c00018e5:	68 c0 ae 00 c0       	push   $0xc000aec0
c00018ea:	68 c7 ae 00 c0       	push   $0xc000aec7
c00018ef:	68 f8 65 00 c0       	push   $0xc00065f8
c00018f4:	e8 4d 8f 00 00       	call   c000a846 <process_execute>
c00018f9:	83 c4 10             	add    $0x10,%esp
c00018fc:	6a 00                	push   $0x0
c00018fe:	68 d0 ae 00 c0       	push   $0xc000aed0
c0001903:	68 d8 ae 00 c0       	push   $0xc000aed8
c0001908:	68 b9 29 00 c0       	push   $0xc00029b9
c000190d:	e8 34 8f 00 00       	call   c000a846 <process_execute>
c0001912:	83 c4 10             	add    $0x10,%esp
c0001915:	6a 00                	push   $0x0
c0001917:	68 e1 ae 00 c0       	push   $0xc000aee1
c000191c:	68 e8 ae 00 c0       	push   $0xc000aee8
c0001921:	68 1e 1b 00 c0       	push   $0xc0001b1e
c0001926:	e8 1b 8f 00 00       	call   c000a846 <process_execute>
c000192b:	83 c4 10             	add    $0x10,%esp
c000192e:	6a 00                	push   $0x0
c0001930:	68 f1 ae 00 c0       	push   $0xc000aef1
c0001935:	68 f9 ae 00 c0       	push   $0xc000aef9
c000193a:	68 0d 5c 00 c0       	push   $0xc0005c0d
c000193f:	e8 02 8f 00 00       	call   c000a846 <process_execute>
c0001944:	83 c4 10             	add    $0x10,%esp
c0001947:	6a 01                	push   $0x1
c0001949:	68 03 af 00 c0       	push   $0xc000af03
c000194e:	68 0d af 00 c0       	push   $0xc000af0d
c0001953:	68 e9 1a 00 c0       	push   $0xc0001ae9
c0001958:	e8 e9 8e 00 00       	call   c000a846 <process_execute>
c000195d:	83 c4 10             	add    $0x10,%esp
c0001960:	83 ec 0c             	sub    $0xc,%esp
c0001963:	68 1a af 00 c0       	push   $0xc000af1a
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
c00019a4:	68 24 af 00 c0       	push   $0xc000af24
c00019a9:	e8 de fb ff ff       	call   c000158c <disp_str>
c00019ae:	83 c4 10             	add    $0x10,%esp
c00019b1:	e8 3f 6c 00 00       	call   c00085f5 <init_keyboard>
c00019b6:	83 ec 0c             	sub    $0xc,%esp
c00019b9:	68 00 00 00 02       	push   $0x2000000
c00019be:	e8 6f 60 00 00       	call   c0007a32 <init_memory>
c00019c3:	83 c4 10             	add    $0x10,%esp
c00019c6:	83 ec 0c             	sub    $0xc,%esp
c00019c9:	68 ec 0d 01 c0       	push   $0xc0010dec
c00019ce:	e8 02 90 00 00       	call   c000a9d5 <initDoubleLinkList>
c00019d3:	83 c4 10             	add    $0x10,%esp
c00019d6:	83 ec 0c             	sub    $0xc,%esp
c00019d9:	68 04 1f 01 c0       	push   $0xc0011f04
c00019de:	e8 f2 8f 00 00       	call   c000a9d5 <initDoubleLinkList>
c00019e3:	83 c4 10             	add    $0x10,%esp
c00019e6:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00019ed:	00 00 00 
c00019f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019f7:	eb 14                	jmp    c0001a0d <init+0x9a>
c00019f9:	83 ec 0c             	sub    $0xc,%esp
c00019fc:	68 2a af 00 c0       	push   $0xc000af2a
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
c0001a51:	68 2b af 00 c0       	push   $0xc000af2b
c0001a56:	e8 31 fb ff ff       	call   c000158c <disp_str>
c0001a5b:	83 c4 10             	add    $0x10,%esp
c0001a5e:	83 ec 0c             	sub    $0xc,%esp
c0001a61:	68 34 af 00 c0       	push   $0xc000af34
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
c0001a9e:	68 36 af 00 c0       	push   $0xc000af36
c0001aa3:	e8 e4 fa ff ff       	call   c000158c <disp_str>
c0001aa8:	83 c4 10             	add    $0x10,%esp
c0001aab:	83 ec 0c             	sub    $0xc,%esp
c0001aae:	68 34 af 00 c0       	push   $0xc000af34
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
c0001af2:	68 3f af 00 c0       	push   $0xc000af3f
c0001af7:	e8 90 fa ff ff       	call   c000158c <disp_str>
c0001afc:	83 c4 10             	add    $0x10,%esp
c0001aff:	e8 e9 6f 00 00       	call   c0008aed <INIT_fork>
c0001b04:	eb fe                	jmp    c0001b04 <user_proc_a+0x1b>

c0001b06 <user_proc_b>:
c0001b06:	55                   	push   %ebp
c0001b07:	89 e5                	mov    %esp,%ebp
c0001b09:	83 ec 08             	sub    $0x8,%esp
c0001b0c:	83 ec 0c             	sub    $0xc,%esp
c0001b0f:	68 51 af 00 c0       	push   $0xc000af51
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
c0001b4b:	e8 db 9f 00 00       	call   c000bb2b <Memset>
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
c0001b8d:	e8 a5 83 00 00       	call   c0009f37 <send_rec>
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
c0001c01:	68 64 af 00 c0       	push   $0xc000af64
c0001c06:	68 64 af 00 c0       	push   $0xc000af64
c0001c0b:	68 6c af 00 c0       	push   $0xc000af6c
c0001c10:	e8 b2 7a 00 00       	call   c00096c7 <assertion_failure>
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
c0001c6c:	68 c6 af 00 c0       	push   $0xc000afc6
c0001c71:	e8 0d 7a 00 00       	call   c0009683 <spin>
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
c0001ca6:	68 d8 af 00 c0       	push   $0xc000afd8
c0001cab:	e8 f9 79 00 00       	call   c00096a9 <panic>
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
c0001e07:	e8 1f 9d 00 00       	call   c000bb2b <Memset>
c0001e0c:	83 c4 10             	add    $0x10,%esp
c0001e0f:	83 ec 04             	sub    $0x4,%esp
c0001e12:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e15:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e18:	68 f0 01 00 00       	push   $0x1f0
c0001e1d:	e8 5d 9d 00 00       	call   c000bb7f <read_port>
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
c0001f85:	e8 c0 9b 00 00       	call   c000bb4a <Strcpy>
c0001f8a:	83 c4 10             	add    $0x10,%esp
c0001f8d:	eb 13                	jmp    c0001fa2 <print_hdinfo+0x167>
c0001f8f:	83 ec 08             	sub    $0x8,%esp
c0001f92:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001f95:	50                   	push   %eax
c0001f96:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f99:	50                   	push   %eax
c0001f9a:	e8 ab 9b 00 00       	call   c000bb4a <Strcpy>
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
c0001fd9:	68 e2 af 00 c0       	push   $0xc000afe2
c0001fde:	e8 87 73 00 00       	call   c000936a <Printf>
c0001fe3:	83 c4 10             	add    $0x10,%esp
c0001fe6:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fe9:	8b 40 0c             	mov    0xc(%eax),%eax
c0001fec:	83 ec 08             	sub    $0x8,%esp
c0001fef:	50                   	push   %eax
c0001ff0:	68 ea af 00 c0       	push   $0xc000afea
c0001ff5:	e8 70 73 00 00       	call   c000936a <Printf>
c0001ffa:	83 c4 10             	add    $0x10,%esp
c0001ffd:	8b 45 08             	mov    0x8(%ebp),%eax
c0002000:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0002004:	0f b6 c0             	movzbl %al,%eax
c0002007:	83 ec 08             	sub    $0x8,%esp
c000200a:	50                   	push   %eax
c000200b:	68 fb af 00 c0       	push   $0xc000affb
c0002010:	e8 55 73 00 00       	call   c000936a <Printf>
c0002015:	83 c4 10             	add    $0x10,%esp
c0002018:	8b 45 08             	mov    0x8(%ebp),%eax
c000201b:	0f b6 00             	movzbl (%eax),%eax
c000201e:	0f b6 c0             	movzbl %al,%eax
c0002021:	83 ec 08             	sub    $0x8,%esp
c0002024:	50                   	push   %eax
c0002025:	68 09 b0 00 c0       	push   $0xc000b009
c000202a:	e8 3b 73 00 00       	call   c000936a <Printf>
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
c00020ce:	e8 58 9a 00 00       	call   c000bb2b <Memset>
c00020d3:	83 c4 10             	add    $0x10,%esp
c00020d6:	83 ec 04             	sub    $0x4,%esp
c00020d9:	ff 75 f4             	pushl  -0xc(%ebp)
c00020dc:	ff 75 ec             	pushl  -0x14(%ebp)
c00020df:	68 f0 01 00 00       	push   $0x1f0
c00020e4:	e8 96 9a 00 00       	call   c000bb7f <read_port>
c00020e9:	83 c4 10             	add    $0x10,%esp
c00020ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00020ef:	05 be 01 00 00       	add    $0x1be,%eax
c00020f4:	83 ec 04             	sub    $0x4,%esp
c00020f7:	6a 40                	push   $0x40
c00020f9:	50                   	push   %eax
c00020fa:	ff 75 10             	pushl  0x10(%ebp)
c00020fd:	e8 06 5b 00 00       	call   c0007c08 <Memcpy>
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
c000216b:	e8 bb 99 00 00       	call   c000bb2b <Memset>
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
c000229d:	e8 89 98 00 00       	call   c000bb2b <Memset>
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
c0002394:	e8 92 97 00 00       	call   c000bb2b <Memset>
c0002399:	83 c4 10             	add    $0x10,%esp
c000239c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000239f:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00023a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023a9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00023b0:	83 ec 04             	sub    $0x4,%esp
c00023b3:	6a 02                	push   $0x2
c00023b5:	ff 75 f0             	pushl  -0x10(%ebp)
c00023b8:	6a 01                	push   $0x1
c00023ba:	e8 78 7b 00 00       	call   c0009f37 <send_rec>
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
c0002433:	e8 f3 96 00 00       	call   c000bb2b <Memset>
c0002438:	83 c4 10             	add    $0x10,%esp
c000243b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000243e:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002445:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002448:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000244f:	83 ec 04             	sub    $0x4,%esp
c0002452:	6a 02                	push   $0x2
c0002454:	ff 75 ec             	pushl  -0x14(%ebp)
c0002457:	6a 01                	push   $0x1
c0002459:	e8 d9 7a 00 00       	call   c0009f37 <send_rec>
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
c0002487:	68 14 b0 00 c0       	push   $0xc000b014
c000248c:	e8 18 72 00 00       	call   c00096a9 <panic>
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
c00024b7:	e8 6f 96 00 00       	call   c000bb2b <Memset>
c00024bc:	83 c4 10             	add    $0x10,%esp
c00024bf:	83 ec 04             	sub    $0x4,%esp
c00024c2:	68 13 02 00 00       	push   $0x213
c00024c7:	ff 75 f4             	pushl  -0xc(%ebp)
c00024ca:	6a 02                	push   $0x2
c00024cc:	e8 66 7a 00 00       	call   c0009f37 <send_rec>
c00024d1:	83 c4 10             	add    $0x10,%esp
c00024d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024d7:	83 ec 08             	sub    $0x8,%esp
c00024da:	6a 6c                	push   $0x6c
c00024dc:	50                   	push   %eax
c00024dd:	e8 ff 51 00 00       	call   c00076e1 <sys_free>
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
c00025dc:	e8 76 4b 00 00       	call   c0007157 <alloc_virtual_memory>
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
c0002601:	68 64 af 00 c0       	push   $0xc000af64
c0002606:	68 64 af 00 c0       	push   $0xc000af64
c000260b:	68 26 b0 00 c0       	push   $0xc000b026
c0002610:	e8 b2 70 00 00       	call   c00096c7 <assertion_failure>
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
c0002673:	68 64 af 00 c0       	push   $0xc000af64
c0002678:	68 64 af 00 c0       	push   $0xc000af64
c000267d:	68 44 b0 00 c0       	push   $0xc000b044
c0002682:	e8 40 70 00 00       	call   c00096c7 <assertion_failure>
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
c00026ce:	e8 58 94 00 00       	call   c000bb2b <Memset>
c00026d3:	83 c4 10             	add    $0x10,%esp
c00026d6:	83 ec 04             	sub    $0x4,%esp
c00026d9:	68 00 02 00 00       	push   $0x200
c00026de:	68 80 21 01 c0       	push   $0xc0012180
c00026e3:	68 f0 01 00 00       	push   $0x1f0
c00026e8:	e8 92 94 00 00       	call   c000bb7f <read_port>
c00026ed:	83 c4 10             	add    $0x10,%esp
c00026f0:	83 ec 04             	sub    $0x4,%esp
c00026f3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00026f6:	68 80 21 01 c0       	push   $0xc0012180
c00026fb:	ff 75 f0             	pushl  -0x10(%ebp)
c00026fe:	e8 05 55 00 00       	call   c0007c08 <Memcpy>
c0002703:	83 c4 10             	add    $0x10,%esp
c0002706:	eb 26                	jmp    c000272e <hd_rdwt+0x246>
c0002708:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000270c:	75 20                	jne    c000272e <hd_rdwt+0x246>
c000270e:	e8 53 fd ff ff       	call   c0002466 <wait_for>
c0002713:	83 ec 04             	sub    $0x4,%esp
c0002716:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002719:	ff 75 f0             	pushl  -0x10(%ebp)
c000271c:	68 f0 01 00 00       	push   $0x1f0
c0002721:	e8 6d 94 00 00       	call   c000bb93 <write_port>
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
c000275e:	e8 c8 93 00 00       	call   c000bb2b <Memset>
c0002763:	83 c4 10             	add    $0x10,%esp
c0002766:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002769:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002770:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002773:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000277a:	83 ec 04             	sub    $0x4,%esp
c000277d:	6a 02                	push   $0x2
c000277f:	ff 75 c0             	pushl  -0x40(%ebp)
c0002782:	6a 01                	push   $0x1
c0002784:	e8 ae 77 00 00       	call   c0009f37 <send_rec>
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
c00027b0:	e8 11 7a 00 00       	call   c000a1c6 <inform_int>
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
c0002808:	68 78 b0 00 c0       	push   $0xc000b078
c000280d:	e8 58 6b 00 00       	call   c000936a <Printf>
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
c0002845:	68 95 b0 00 c0       	push   $0xc000b095
c000284a:	e8 1b 6b 00 00       	call   c000936a <Printf>
c000284f:	83 c4 10             	add    $0x10,%esp
c0002852:	eb 01                	jmp    c0002855 <print_hd_info+0x56>
c0002854:	90                   	nop
c0002855:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002859:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000285d:	7e bf                	jle    c000281e <print_hd_info+0x1f>
c000285f:	83 ec 0c             	sub    $0xc,%esp
c0002862:	68 ad b0 00 c0       	push   $0xc000b0ad
c0002867:	e8 fe 6a 00 00       	call   c000936a <Printf>
c000286c:	83 c4 10             	add    $0x10,%esp
c000286f:	83 ec 0c             	sub    $0xc,%esp
c0002872:	68 c8 b0 00 c0       	push   $0xc000b0c8
c0002877:	e8 ee 6a 00 00       	call   c000936a <Printf>
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
c00028bf:	68 95 b0 00 c0       	push   $0xc000b095
c00028c4:	e8 a1 6a 00 00       	call   c000936a <Printf>
c00028c9:	83 c4 10             	add    $0x10,%esp
c00028cc:	eb 01                	jmp    c00028cf <print_hd_info+0xd0>
c00028ce:	90                   	nop
c00028cf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028d3:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00028d7:	7e b6                	jle    c000288f <print_hd_info+0x90>
c00028d9:	83 ec 0c             	sub    $0xc,%esp
c00028dc:	68 e5 b0 00 c0       	push   $0xc000b0e5
c00028e1:	e8 84 6a 00 00       	call   c000936a <Printf>
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
c0002924:	66 90                	xchg   %ax,%ax
c0002926:	66 90                	xchg   %ax,%ax
c0002928:	66 90                	xchg   %ax,%ax
c000292a:	66 90                	xchg   %ax,%ax
c000292c:	66 90                	xchg   %ax,%ax
c000292e:	66 90                	xchg   %ax,%ax

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
c00029bf:	e8 4b 08 00 00       	call   c000320f <init_fs>
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
c00029ee:	e8 38 91 00 00       	call   c000bb2b <Memset>
c00029f3:	83 c4 10             	add    $0x10,%esp
c00029f6:	83 ec 04             	sub    $0x4,%esp
c00029f9:	6a 12                	push   $0x12
c00029fb:	ff 75 f4             	pushl  -0xc(%ebp)
c00029fe:	6a 02                	push   $0x2
c0002a00:	e8 32 75 00 00       	call   c0009f37 <send_rec>
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
c0002a48:	e8 e0 23 00 00       	call   c0004e2d <pid2proc>
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
c0002a7b:	68 04 b1 00 c0       	push   $0xc000b104
c0002a80:	68 04 b1 00 c0       	push   $0xc000b104
c0002a85:	68 14 b1 00 c0       	push   $0xc000b114
c0002a8a:	e8 38 6c 00 00       	call   c00096c7 <assertion_failure>
c0002a8f:	83 c4 10             	add    $0x10,%esp
c0002a92:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a96:	74 2f                	je     c0002ac7 <task_fs+0x10e>
c0002a98:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a9c:	7f 15                	jg     c0002ab3 <task_fs+0xfa>
c0002a9e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002aa2:	0f 84 a5 00 00 00    	je     c0002b4d <task_fs+0x194>
c0002aa8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002aac:	74 64                	je     c0002b12 <task_fs+0x159>
c0002aae:	e9 88 00 00 00       	jmp    c0002b3b <task_fs+0x182>
c0002ab3:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002ab7:	74 46                	je     c0002aff <task_fs+0x146>
c0002ab9:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002abd:	74 63                	je     c0002b22 <task_fs+0x169>
c0002abf:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002ac3:	74 3a                	je     c0002aff <task_fs+0x146>
c0002ac5:	eb 74                	jmp    c0002b3b <task_fs+0x182>
c0002ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002aca:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002ad1:	83 ec 0c             	sub    $0xc,%esp
c0002ad4:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ad7:	e8 88 07 00 00       	call   c0003264 <do_open>
c0002adc:	83 c4 10             	add    $0x10,%esp
c0002adf:	89 c2                	mov    %eax,%edx
c0002ae1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ae4:	89 50 40             	mov    %edx,0x40(%eax)
c0002ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002aea:	8b 00                	mov    (%eax),%eax
c0002aec:	83 ec 04             	sub    $0x4,%esp
c0002aef:	50                   	push   %eax
c0002af0:	ff 75 f4             	pushl  -0xc(%ebp)
c0002af3:	6a 01                	push   $0x1
c0002af5:	e8 3d 74 00 00       	call   c0009f37 <send_rec>
c0002afa:	83 c4 10             	add    $0x10,%esp
c0002afd:	eb 4f                	jmp    c0002b4e <task_fs+0x195>
c0002aff:	83 ec 0c             	sub    $0xc,%esp
c0002b02:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b05:	e8 98 18 00 00       	call   c00043a2 <do_rdwt>
c0002b0a:	83 c4 10             	add    $0x10,%esp
c0002b0d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002b10:	eb 3c                	jmp    c0002b4e <task_fs+0x195>
c0002b12:	83 ec 0c             	sub    $0xc,%esp
c0002b15:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002b18:	e8 a9 1d 00 00       	call   c00048c6 <do_close>
c0002b1d:	83 c4 10             	add    $0x10,%esp
c0002b20:	eb 2c                	jmp    c0002b4e <task_fs+0x195>
c0002b22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b25:	8b 40 58             	mov    0x58(%eax),%eax
c0002b28:	83 ec 04             	sub    $0x4,%esp
c0002b2b:	50                   	push   %eax
c0002b2c:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b2f:	6a 01                	push   $0x1
c0002b31:	e8 01 74 00 00       	call   c0009f37 <send_rec>
c0002b36:	83 c4 10             	add    $0x10,%esp
c0002b39:	eb 13                	jmp    c0002b4e <task_fs+0x195>
c0002b3b:	83 ec 0c             	sub    $0xc,%esp
c0002b3e:	68 77 b1 00 c0       	push   $0xc000b177
c0002b43:	e8 61 6b 00 00       	call   c00096a9 <panic>
c0002b48:	83 c4 10             	add    $0x10,%esp
c0002b4b:	eb 01                	jmp    c0002b4e <task_fs+0x195>
c0002b4d:	90                   	nop
c0002b4e:	e9 91 fe ff ff       	jmp    c00029e4 <task_fs+0x2b>

c0002b53 <rd_wt>:
c0002b53:	55                   	push   %ebp
c0002b54:	89 e5                	mov    %esp,%ebp
c0002b56:	83 ec 18             	sub    $0x18,%esp
c0002b59:	83 ec 0c             	sub    $0xc,%esp
c0002b5c:	6a 6c                	push   $0x6c
c0002b5e:	e8 41 fe ff ff       	call   c00029a4 <sys_malloc>
c0002b63:	83 c4 10             	add    $0x10,%esp
c0002b66:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002b69:	83 ec 04             	sub    $0x4,%esp
c0002b6c:	6a 6c                	push   $0x6c
c0002b6e:	6a 00                	push   $0x0
c0002b70:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b73:	e8 b3 8f 00 00       	call   c000bb2b <Memset>
c0002b78:	83 c4 10             	add    $0x10,%esp
c0002b7b:	8b 55 18             	mov    0x18(%ebp),%edx
c0002b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b81:	89 50 68             	mov    %edx,0x68(%eax)
c0002b84:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002b87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b8a:	89 50 14             	mov    %edx,0x14(%eax)
c0002b8d:	8b 55 10             	mov    0x10(%ebp),%edx
c0002b90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b93:	89 50 10             	mov    %edx,0x10(%eax)
c0002b96:	8b 55 14             	mov    0x14(%ebp),%edx
c0002b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b9c:	89 50 0c             	mov    %edx,0xc(%eax)
c0002b9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0002ba2:	c1 e0 09             	shl    $0x9,%eax
c0002ba5:	89 c2                	mov    %eax,%edx
c0002ba7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002baa:	89 50 18             	mov    %edx,0x18(%eax)
c0002bad:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002bb1:	74 22                	je     c0002bd5 <rd_wt+0x82>
c0002bb3:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002bb7:	74 1c                	je     c0002bd5 <rd_wt+0x82>
c0002bb9:	68 a5 00 00 00       	push   $0xa5
c0002bbe:	68 04 b1 00 c0       	push   $0xc000b104
c0002bc3:	68 04 b1 00 c0       	push   $0xc000b104
c0002bc8:	68 8a b1 00 c0       	push   $0xc000b18a
c0002bcd:	e8 f5 6a 00 00       	call   c00096c7 <assertion_failure>
c0002bd2:	83 c4 10             	add    $0x10,%esp
c0002bd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bd8:	8b 40 68             	mov    0x68(%eax),%eax
c0002bdb:	83 f8 07             	cmp    $0x7,%eax
c0002bde:	74 27                	je     c0002c07 <rd_wt+0xb4>
c0002be0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002be3:	8b 40 68             	mov    0x68(%eax),%eax
c0002be6:	83 f8 0a             	cmp    $0xa,%eax
c0002be9:	74 1c                	je     c0002c07 <rd_wt+0xb4>
c0002beb:	68 a6 00 00 00       	push   $0xa6
c0002bf0:	68 04 b1 00 c0       	push   $0xc000b104
c0002bf5:	68 04 b1 00 c0       	push   $0xc000b104
c0002bfa:	68 a8 b1 00 c0       	push   $0xc000b1a8
c0002bff:	e8 c3 6a 00 00       	call   c00096c7 <assertion_failure>
c0002c04:	83 c4 10             	add    $0x10,%esp
c0002c07:	83 ec 04             	sub    $0x4,%esp
c0002c0a:	6a 03                	push   $0x3
c0002c0c:	ff 75 f4             	pushl  -0xc(%ebp)
c0002c0f:	6a 03                	push   $0x3
c0002c11:	e8 21 73 00 00       	call   c0009f37 <send_rec>
c0002c16:	83 c4 10             	add    $0x10,%esp
c0002c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c1c:	83 ec 08             	sub    $0x8,%esp
c0002c1f:	6a 6c                	push   $0x6c
c0002c21:	50                   	push   %eax
c0002c22:	e8 ba 4a 00 00       	call   c00076e1 <sys_free>
c0002c27:	83 c4 10             	add    $0x10,%esp
c0002c2a:	90                   	nop
c0002c2b:	c9                   	leave  
c0002c2c:	c3                   	ret    

c0002c2d <mkfs>:
c0002c2d:	55                   	push   %ebp
c0002c2e:	89 e5                	mov    %esp,%ebp
c0002c30:	57                   	push   %edi
c0002c31:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002c37:	83 ec 0c             	sub    $0xc,%esp
c0002c3a:	68 00 80 00 00       	push   $0x8000
c0002c3f:	e8 60 fd ff ff       	call   c00029a4 <sys_malloc>
c0002c44:	83 c4 10             	add    $0x10,%esp
c0002c47:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002c4c:	83 ec 0c             	sub    $0xc,%esp
c0002c4f:	6a 24                	push   $0x24
c0002c51:	e8 4e fd ff ff       	call   c00029a4 <sys_malloc>
c0002c56:	83 c4 10             	add    $0x10,%esp
c0002c59:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002c5e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c63:	83 ec 0c             	sub    $0xc,%esp
c0002c66:	50                   	push   %eax
c0002c67:	e8 b2 45 00 00       	call   c000721e <get_physical_address>
c0002c6c:	83 c4 10             	add    $0x10,%esp
c0002c6f:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002c74:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002c79:	83 ec 0c             	sub    $0xc,%esp
c0002c7c:	50                   	push   %eax
c0002c7d:	e8 9c 45 00 00       	call   c000721e <get_physical_address>
c0002c82:	83 c4 10             	add    $0x10,%esp
c0002c85:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002c8a:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c8f:	83 ec 04             	sub    $0x4,%esp
c0002c92:	68 00 02 00 00       	push   $0x200
c0002c97:	6a 00                	push   $0x0
c0002c99:	50                   	push   %eax
c0002c9a:	e8 8c 8e 00 00       	call   c000bb2b <Memset>
c0002c9f:	83 c4 10             	add    $0x10,%esp
c0002ca2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ca7:	83 ec 0c             	sub    $0xc,%esp
c0002caa:	6a 0a                	push   $0xa
c0002cac:	68 00 02 00 00       	push   $0x200
c0002cb1:	50                   	push   %eax
c0002cb2:	6a 20                	push   $0x20
c0002cb4:	6a 00                	push   $0x0
c0002cb6:	e8 98 fe ff ff       	call   c0002b53 <rd_wt>
c0002cbb:	83 c4 20             	add    $0x20,%esp
c0002cbe:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cc3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002cc6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002cc9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002cd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002cd3:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002cda:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002cdd:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002ce4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002ce7:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002cee:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002cf1:	8b 40 04             	mov    0x4(%eax),%eax
c0002cf4:	8d 50 02             	lea    0x2(%eax),%edx
c0002cf7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002cfa:	8b 40 08             	mov    0x8(%eax),%eax
c0002cfd:	01 c2                	add    %eax,%edx
c0002cff:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d02:	8b 40 0c             	mov    0xc(%eax),%eax
c0002d05:	01 c2                	add    %eax,%edx
c0002d07:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d0a:	89 10                	mov    %edx,(%eax)
c0002d0c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002d13:	b8 00 02 00 00       	mov    $0x200,%eax
c0002d18:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002d1b:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002d21:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002d24:	01 ca                	add    %ecx,%edx
c0002d26:	83 ec 04             	sub    $0x4,%esp
c0002d29:	50                   	push   %eax
c0002d2a:	6a 80                	push   $0xffffff80
c0002d2c:	52                   	push   %edx
c0002d2d:	e8 f9 8d 00 00       	call   c000bb2b <Memset>
c0002d32:	83 c4 10             	add    $0x10,%esp
c0002d35:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d3a:	83 ec 0c             	sub    $0xc,%esp
c0002d3d:	6a 0a                	push   $0xa
c0002d3f:	68 00 02 00 00       	push   $0x200
c0002d44:	50                   	push   %eax
c0002d45:	6a 20                	push   $0x20
c0002d47:	6a 01                	push   $0x1
c0002d49:	e8 05 fe ff ff       	call   c0002b53 <rd_wt>
c0002d4e:	83 c4 20             	add    $0x20,%esp
c0002d51:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d54:	8b 10                	mov    (%eax),%edx
c0002d56:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002d59:	8b 50 04             	mov    0x4(%eax),%edx
c0002d5c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002d5f:	8b 50 08             	mov    0x8(%eax),%edx
c0002d62:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002d65:	8b 50 0c             	mov    0xc(%eax),%edx
c0002d68:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002d6b:	8b 50 10             	mov    0x10(%eax),%edx
c0002d6e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002d71:	8b 50 14             	mov    0x14(%eax),%edx
c0002d74:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002d77:	8b 50 18             	mov    0x18(%eax),%edx
c0002d7a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002d7d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002d80:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002d83:	8b 40 20             	mov    0x20(%eax),%eax
c0002d86:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002d89:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002d8d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002d91:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d96:	83 ec 04             	sub    $0x4,%esp
c0002d99:	6a 01                	push   $0x1
c0002d9b:	52                   	push   %edx
c0002d9c:	50                   	push   %eax
c0002d9d:	e8 89 8d 00 00       	call   c000bb2b <Memset>
c0002da2:	83 c4 10             	add    $0x10,%esp
c0002da5:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002daa:	83 c0 01             	add    $0x1,%eax
c0002dad:	83 ec 04             	sub    $0x4,%esp
c0002db0:	68 ff 01 00 00       	push   $0x1ff
c0002db5:	6a 80                	push   $0xffffff80
c0002db7:	50                   	push   %eax
c0002db8:	e8 6e 8d 00 00       	call   c000bb2b <Memset>
c0002dbd:	83 c4 10             	add    $0x10,%esp
c0002dc0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002dc5:	83 ec 0c             	sub    $0xc,%esp
c0002dc8:	6a 0a                	push   $0xa
c0002dca:	68 00 02 00 00       	push   $0x200
c0002dcf:	50                   	push   %eax
c0002dd0:	6a 20                	push   $0x20
c0002dd2:	6a 02                	push   $0x2
c0002dd4:	e8 7a fd ff ff       	call   c0002b53 <rd_wt>
c0002dd9:	83 c4 20             	add    $0x20,%esp
c0002ddc:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002de3:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002de8:	83 ec 04             	sub    $0x4,%esp
c0002deb:	68 00 02 00 00       	push   $0x200
c0002df0:	6a ff                	push   $0xffffffff
c0002df2:	50                   	push   %eax
c0002df3:	e8 33 8d 00 00       	call   c000bb2b <Memset>
c0002df8:	83 c4 10             	add    $0x10,%esp
c0002dfb:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e00:	83 ec 0c             	sub    $0xc,%esp
c0002e03:	6a 0a                	push   $0xa
c0002e05:	68 00 02 00 00       	push   $0x200
c0002e0a:	50                   	push   %eax
c0002e0b:	6a 20                	push   $0x20
c0002e0d:	ff 75 d0             	pushl  -0x30(%ebp)
c0002e10:	e8 3e fd ff ff       	call   c0002b53 <rd_wt>
c0002e15:	83 c4 20             	add    $0x20,%esp
c0002e18:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e1d:	83 ec 04             	sub    $0x4,%esp
c0002e20:	6a 01                	push   $0x1
c0002e22:	6a 01                	push   $0x1
c0002e24:	50                   	push   %eax
c0002e25:	e8 01 8d 00 00       	call   c000bb2b <Memset>
c0002e2a:	83 c4 10             	add    $0x10,%esp
c0002e2d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e32:	83 c0 01             	add    $0x1,%eax
c0002e35:	83 ec 04             	sub    $0x4,%esp
c0002e38:	68 ff 01 00 00       	push   $0x1ff
c0002e3d:	6a 00                	push   $0x0
c0002e3f:	50                   	push   %eax
c0002e40:	e8 e6 8c 00 00       	call   c000bb2b <Memset>
c0002e45:	83 c4 10             	add    $0x10,%esp
c0002e48:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e4d:	89 c2                	mov    %eax,%edx
c0002e4f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002e52:	83 c0 01             	add    $0x1,%eax
c0002e55:	83 ec 0c             	sub    $0xc,%esp
c0002e58:	6a 0a                	push   $0xa
c0002e5a:	68 00 02 00 00       	push   $0x200
c0002e5f:	52                   	push   %edx
c0002e60:	6a 20                	push   $0x20
c0002e62:	50                   	push   %eax
c0002e63:	e8 eb fc ff ff       	call   c0002b53 <rd_wt>
c0002e68:	83 c4 20             	add    $0x20,%esp
c0002e6b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002e6e:	83 e8 02             	sub    $0x2,%eax
c0002e71:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002e74:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002e7b:	eb 04                	jmp    c0002e81 <mkfs+0x254>
c0002e7d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002e81:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002e84:	83 c0 01             	add    $0x1,%eax
c0002e87:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002e8a:	7e f1                	jle    c0002e7d <mkfs+0x250>
c0002e8c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e91:	89 c2                	mov    %eax,%edx
c0002e93:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002e96:	83 c0 03             	add    $0x3,%eax
c0002e99:	83 ec 0c             	sub    $0xc,%esp
c0002e9c:	6a 0a                	push   $0xa
c0002e9e:	68 00 02 00 00       	push   $0x200
c0002ea3:	52                   	push   %edx
c0002ea4:	6a 20                	push   $0x20
c0002ea6:	50                   	push   %eax
c0002ea7:	e8 a7 fc ff ff       	call   c0002b53 <rd_wt>
c0002eac:	83 c4 20             	add    $0x20,%esp
c0002eaf:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002eb4:	89 c2                	mov    %eax,%edx
c0002eb6:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002eb9:	83 c0 03             	add    $0x3,%eax
c0002ebc:	83 ec 0c             	sub    $0xc,%esp
c0002ebf:	6a 07                	push   $0x7
c0002ec1:	68 00 02 00 00       	push   $0x200
c0002ec6:	52                   	push   %edx
c0002ec7:	6a 20                	push   $0x20
c0002ec9:	50                   	push   %eax
c0002eca:	e8 84 fc ff ff       	call   c0002b53 <rd_wt>
c0002ecf:	83 c4 20             	add    $0x20,%esp
c0002ed2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ed7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002eda:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002edd:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002ee3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ee6:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002eed:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002ef0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ef3:	89 50 08             	mov    %edx,0x8(%eax)
c0002ef6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ef9:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f00:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f03:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002f0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f0d:	8b 10                	mov    (%eax),%edx
c0002f0f:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002f15:	8b 50 04             	mov    0x4(%eax),%edx
c0002f18:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002f1e:	8b 50 08             	mov    0x8(%eax),%edx
c0002f21:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002f27:	8b 50 0c             	mov    0xc(%eax),%edx
c0002f2a:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002f30:	8b 50 10             	mov    0x10(%eax),%edx
c0002f33:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002f39:	8b 50 14             	mov    0x14(%eax),%edx
c0002f3c:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002f42:	8b 50 18             	mov    0x18(%eax),%edx
c0002f45:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002f4b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002f4e:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002f54:	8b 50 20             	mov    0x20(%eax),%edx
c0002f57:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002f5d:	8b 40 24             	mov    0x24(%eax),%eax
c0002f60:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002f65:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002f6c:	eb 4c                	jmp    c0002fba <mkfs+0x38d>
c0002f6e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f73:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002f76:	83 c2 01             	add    $0x1,%edx
c0002f79:	c1 e2 05             	shl    $0x5,%edx
c0002f7c:	01 d0                	add    %edx,%eax
c0002f7e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002f81:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f84:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002f8a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f8d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002f94:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f97:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002f9e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002fa5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002fa8:	c1 e0 08             	shl    $0x8,%eax
c0002fab:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002fae:	89 c2                	mov    %eax,%edx
c0002fb0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002fb3:	89 50 08             	mov    %edx,0x8(%eax)
c0002fb6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002fba:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002fbe:	7e ae                	jle    c0002f6e <mkfs+0x341>
c0002fc0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002fc7:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002fcd:	b8 00 00 00 00       	mov    $0x0,%eax
c0002fd2:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002fd7:	89 d7                	mov    %edx,%edi
c0002fd9:	f3 ab                	rep stos %eax,%es:(%edi)
c0002fdb:	c7 85 70 ff ff ff d0 	movl   $0xc000b1d0,-0x90(%ebp)
c0002fe2:	b1 00 c0 
c0002fe5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002fec:	eb 54                	jmp    c0003042 <mkfs+0x415>
c0002fee:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ff3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002ff6:	83 c2 04             	add    $0x4,%edx
c0002ff9:	c1 e2 05             	shl    $0x5,%edx
c0002ffc:	01 d0                	add    %edx,%eax
c0002ffe:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003001:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003004:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000300a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000300d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0003014:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003017:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000301a:	83 c2 01             	add    $0x1,%edx
c000301d:	c1 e2 0b             	shl    $0xb,%edx
c0003020:	01 c2                	add    %eax,%edx
c0003022:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003025:	89 50 08             	mov    %edx,0x8(%eax)
c0003028:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000302b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0003032:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003035:	8d 50 05             	lea    0x5(%eax),%edx
c0003038:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000303b:	89 50 10             	mov    %edx,0x10(%eax)
c000303e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003042:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003045:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0003048:	7c a4                	jl     c0002fee <mkfs+0x3c1>
c000304a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000304f:	89 c2                	mov    %eax,%edx
c0003051:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0003054:	83 c0 03             	add    $0x3,%eax
c0003057:	83 ec 0c             	sub    $0xc,%esp
c000305a:	6a 0a                	push   $0xa
c000305c:	68 00 02 00 00       	push   $0x200
c0003061:	52                   	push   %edx
c0003062:	6a 20                	push   $0x20
c0003064:	50                   	push   %eax
c0003065:	e8 e9 fa ff ff       	call   c0002b53 <rd_wt>
c000306a:	83 c4 20             	add    $0x20,%esp
c000306d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003072:	89 c2                	mov    %eax,%edx
c0003074:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003077:	83 ec 0c             	sub    $0xc,%esp
c000307a:	6a 07                	push   $0x7
c000307c:	68 00 02 00 00       	push   $0x200
c0003081:	52                   	push   %edx
c0003082:	6a 20                	push   $0x20
c0003084:	50                   	push   %eax
c0003085:	e8 c9 fa ff ff       	call   c0002b53 <rd_wt>
c000308a:	83 c4 20             	add    $0x20,%esp
c000308d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0003094:	00 00 00 
c0003097:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c000309e:	2e 00 
c00030a0:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00030a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00030a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030ab:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c00030b1:	83 ec 0c             	sub    $0xc,%esp
c00030b4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c00030ba:	50                   	push   %eax
c00030bb:	e8 a4 8a 00 00       	call   c000bb64 <Strlen>
c00030c0:	83 c4 10             	add    $0x10,%esp
c00030c3:	89 c1                	mov    %eax,%ecx
c00030c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030c8:	8d 50 04             	lea    0x4(%eax),%edx
c00030cb:	83 ec 04             	sub    $0x4,%esp
c00030ce:	51                   	push   %ecx
c00030cf:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c00030d5:	50                   	push   %eax
c00030d6:	52                   	push   %edx
c00030d7:	e8 2c 4b 00 00       	call   c0007c08 <Memcpy>
c00030dc:	83 c4 10             	add    $0x10,%esp
c00030df:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c00030e5:	b8 00 00 00 00       	mov    $0x0,%eax
c00030ea:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00030ef:	89 d7                	mov    %edx,%edi
c00030f1:	f3 ab                	rep stos %eax,%es:(%edi)
c00030f3:	c7 85 34 ff ff ff dc 	movl   $0xc000b1dc,-0xcc(%ebp)
c00030fa:	b1 00 c0 
c00030fd:	c7 85 38 ff ff ff e5 	movl   $0xc000b1e5,-0xc8(%ebp)
c0003104:	b1 00 c0 
c0003107:	c7 85 3c ff ff ff ee 	movl   $0xc000b1ee,-0xc4(%ebp)
c000310e:	b1 00 c0 
c0003111:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0003118:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000311f:	eb 49                	jmp    c000316a <mkfs+0x53d>
c0003121:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003125:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003128:	8d 50 02             	lea    0x2(%eax),%edx
c000312b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000312e:	89 10                	mov    %edx,(%eax)
c0003130:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003133:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c000313a:	83 ec 0c             	sub    $0xc,%esp
c000313d:	50                   	push   %eax
c000313e:	e8 21 8a 00 00       	call   c000bb64 <Strlen>
c0003143:	83 c4 10             	add    $0x10,%esp
c0003146:	89 c1                	mov    %eax,%ecx
c0003148:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000314b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003152:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003155:	83 c2 04             	add    $0x4,%edx
c0003158:	83 ec 04             	sub    $0x4,%esp
c000315b:	51                   	push   %ecx
c000315c:	50                   	push   %eax
c000315d:	52                   	push   %edx
c000315e:	e8 a5 4a 00 00       	call   c0007c08 <Memcpy>
c0003163:	83 c4 10             	add    $0x10,%esp
c0003166:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000316a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000316d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0003170:	7c af                	jl     c0003121 <mkfs+0x4f4>
c0003172:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003179:	eb 66                	jmp    c00031e1 <mkfs+0x5b4>
c000317b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000317e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003185:	83 ec 0c             	sub    $0xc,%esp
c0003188:	50                   	push   %eax
c0003189:	e8 d6 89 00 00       	call   c000bb64 <Strlen>
c000318e:	83 c4 10             	add    $0x10,%esp
c0003191:	85 c0                	test   %eax,%eax
c0003193:	74 47                	je     c00031dc <mkfs+0x5af>
c0003195:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003199:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000319c:	8d 50 05             	lea    0x5(%eax),%edx
c000319f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031a2:	89 10                	mov    %edx,(%eax)
c00031a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031a7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00031ae:	83 ec 0c             	sub    $0xc,%esp
c00031b1:	50                   	push   %eax
c00031b2:	e8 ad 89 00 00       	call   c000bb64 <Strlen>
c00031b7:	83 c4 10             	add    $0x10,%esp
c00031ba:	89 c1                	mov    %eax,%ecx
c00031bc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031bf:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00031c6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00031c9:	83 c2 04             	add    $0x4,%edx
c00031cc:	83 ec 04             	sub    $0x4,%esp
c00031cf:	51                   	push   %ecx
c00031d0:	50                   	push   %eax
c00031d1:	52                   	push   %edx
c00031d2:	e8 31 4a 00 00       	call   c0007c08 <Memcpy>
c00031d7:	83 c4 10             	add    $0x10,%esp
c00031da:	eb 01                	jmp    c00031dd <mkfs+0x5b0>
c00031dc:	90                   	nop
c00031dd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00031e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031e4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00031e7:	7c 92                	jl     c000317b <mkfs+0x54e>
c00031e9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00031ee:	89 c2                	mov    %eax,%edx
c00031f0:	8b 45 98             	mov    -0x68(%ebp),%eax
c00031f3:	83 ec 0c             	sub    $0xc,%esp
c00031f6:	6a 0a                	push   $0xa
c00031f8:	68 00 02 00 00       	push   $0x200
c00031fd:	52                   	push   %edx
c00031fe:	6a 20                	push   $0x20
c0003200:	50                   	push   %eax
c0003201:	e8 4d f9 ff ff       	call   c0002b53 <rd_wt>
c0003206:	83 c4 20             	add    $0x20,%esp
c0003209:	90                   	nop
c000320a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000320d:	c9                   	leave  
c000320e:	c3                   	ret    

c000320f <init_fs>:
c000320f:	55                   	push   %ebp
c0003210:	89 e5                	mov    %esp,%ebp
c0003212:	83 ec 18             	sub    $0x18,%esp
c0003215:	83 ec 0c             	sub    $0xc,%esp
c0003218:	6a 6c                	push   $0x6c
c000321a:	e8 85 f7 ff ff       	call   c00029a4 <sys_malloc>
c000321f:	83 c4 10             	add    $0x10,%esp
c0003222:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003225:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003228:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c000322f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003232:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0003239:	83 ec 04             	sub    $0x4,%esp
c000323c:	6a 03                	push   $0x3
c000323e:	ff 75 f4             	pushl  -0xc(%ebp)
c0003241:	6a 03                	push   $0x3
c0003243:	e8 ef 6c 00 00       	call   c0009f37 <send_rec>
c0003248:	83 c4 10             	add    $0x10,%esp
c000324b:	e8 dd f9 ff ff       	call   c0002c2d <mkfs>
c0003250:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003253:	83 ec 08             	sub    $0x8,%esp
c0003256:	6a 6c                	push   $0x6c
c0003258:	50                   	push   %eax
c0003259:	e8 83 44 00 00       	call   c00076e1 <sys_free>
c000325e:	83 c4 10             	add    $0x10,%esp
c0003261:	90                   	nop
c0003262:	c9                   	leave  
c0003263:	c3                   	ret    

c0003264 <do_open>:
c0003264:	55                   	push   %ebp
c0003265:	89 e5                	mov    %esp,%ebp
c0003267:	83 ec 68             	sub    $0x68,%esp
c000326a:	83 ec 04             	sub    $0x4,%esp
c000326d:	6a 0c                	push   $0xc
c000326f:	6a 00                	push   $0x0
c0003271:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003274:	50                   	push   %eax
c0003275:	e8 b1 88 00 00       	call   c000bb2b <Memset>
c000327a:	83 c4 10             	add    $0x10,%esp
c000327d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003280:	8b 40 34             	mov    0x34(%eax),%eax
c0003283:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003286:	83 ec 08             	sub    $0x8,%esp
c0003289:	6a 0c                	push   $0xc
c000328b:	ff 75 e4             	pushl  -0x1c(%ebp)
c000328e:	e8 c4 3e 00 00       	call   c0007157 <alloc_virtual_memory>
c0003293:	83 c4 10             	add    $0x10,%esp
c0003296:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003299:	8b 45 08             	mov    0x8(%ebp),%eax
c000329c:	8b 40 30             	mov    0x30(%eax),%eax
c000329f:	89 c2                	mov    %eax,%edx
c00032a1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00032a4:	83 ec 04             	sub    $0x4,%esp
c00032a7:	52                   	push   %edx
c00032a8:	50                   	push   %eax
c00032a9:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00032ac:	50                   	push   %eax
c00032ad:	e8 56 49 00 00       	call   c0007c08 <Memcpy>
c00032b2:	83 c4 10             	add    $0x10,%esp
c00032b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00032b8:	8b 40 30             	mov    0x30(%eax),%eax
c00032bb:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c00032c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00032c3:	8b 40 64             	mov    0x64(%eax),%eax
c00032c6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00032c9:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00032d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00032d7:	eb 1f                	jmp    c00032f8 <do_open+0x94>
c00032d9:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00032de:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00032e1:	83 c2 50             	add    $0x50,%edx
c00032e4:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00032e8:	85 c0                	test   %eax,%eax
c00032ea:	75 08                	jne    c00032f4 <do_open+0x90>
c00032ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00032ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00032f2:	eb 0a                	jmp    c00032fe <do_open+0x9a>
c00032f4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00032f8:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00032fc:	7e db                	jle    c00032d9 <do_open+0x75>
c00032fe:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0003302:	75 1c                	jne    c0003320 <do_open+0xbc>
c0003304:	68 ba 01 00 00       	push   $0x1ba
c0003309:	68 04 b1 00 c0       	push   $0xc000b104
c000330e:	68 04 b1 00 c0       	push   $0xc000b104
c0003313:	68 f7 b1 00 c0       	push   $0xc000b1f7
c0003318:	e8 aa 63 00 00       	call   c00096c7 <assertion_failure>
c000331d:	83 c4 10             	add    $0x10,%esp
c0003320:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0003327:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000332e:	eb 1d                	jmp    c000334d <do_open+0xe9>
c0003330:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003333:	c1 e0 04             	shl    $0x4,%eax
c0003336:	05 88 23 01 c0       	add    $0xc0012388,%eax
c000333b:	8b 00                	mov    (%eax),%eax
c000333d:	85 c0                	test   %eax,%eax
c000333f:	75 08                	jne    c0003349 <do_open+0xe5>
c0003341:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003344:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003347:	eb 0a                	jmp    c0003353 <do_open+0xef>
c0003349:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000334d:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0003351:	7e dd                	jle    c0003330 <do_open+0xcc>
c0003353:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0003357:	75 1c                	jne    c0003375 <do_open+0x111>
c0003359:	68 c6 01 00 00       	push   $0x1c6
c000335e:	68 04 b1 00 c0       	push   $0xc000b104
c0003363:	68 04 b1 00 c0       	push   $0xc000b104
c0003368:	68 ff b1 00 c0       	push   $0xc000b1ff
c000336d:	e8 55 63 00 00       	call   c00096c7 <assertion_failure>
c0003372:	83 c4 10             	add    $0x10,%esp
c0003375:	83 ec 0c             	sub    $0xc,%esp
c0003378:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000337b:	50                   	push   %eax
c000337c:	e8 b2 00 00 00       	call   c0003433 <search_file>
c0003381:	83 c4 10             	add    $0x10,%esp
c0003384:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003387:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000338b:	75 2b                	jne    c00033b8 <do_open+0x154>
c000338d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003391:	7e 10                	jle    c00033a3 <do_open+0x13f>
c0003393:	83 ec 0c             	sub    $0xc,%esp
c0003396:	68 07 b2 00 c0       	push   $0xc000b207
c000339b:	e8 09 63 00 00       	call   c00096a9 <panic>
c00033a0:	83 c4 10             	add    $0x10,%esp
c00033a3:	83 ec 08             	sub    $0x8,%esp
c00033a6:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00033a9:	50                   	push   %eax
c00033aa:	8d 45 9c             	lea    -0x64(%ebp),%eax
c00033ad:	50                   	push   %eax
c00033ae:	e8 40 04 00 00       	call   c00037f3 <create_file>
c00033b3:	83 c4 10             	add    $0x10,%esp
c00033b6:	eb 22                	jmp    c00033da <do_open+0x176>
c00033b8:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c00033bc:	75 07                	jne    c00033c5 <do_open+0x161>
c00033be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00033c3:	eb 6c                	jmp    c0003431 <do_open+0x1cd>
c00033c5:	83 ec 08             	sub    $0x8,%esp
c00033c8:	ff 75 d8             	pushl  -0x28(%ebp)
c00033cb:	8d 45 9c             	lea    -0x64(%ebp),%eax
c00033ce:	50                   	push   %eax
c00033cf:	e8 5d 02 00 00       	call   c0003631 <get_inode>
c00033d4:	83 c4 10             	add    $0x10,%esp
c00033d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00033da:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00033df:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00033e2:	c1 e2 04             	shl    $0x4,%edx
c00033e5:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c00033eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00033ee:	83 c2 50             	add    $0x50,%edx
c00033f1:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c00033f5:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00033f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00033fb:	c1 e2 04             	shl    $0x4,%edx
c00033fe:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0003404:	89 02                	mov    %eax,(%edx)
c0003406:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003409:	c1 e0 04             	shl    $0x4,%eax
c000340c:	05 84 23 01 c0       	add    $0xc0012384,%eax
c0003411:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003417:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000341a:	c1 e0 04             	shl    $0x4,%eax
c000341d:	05 80 23 01 c0       	add    $0xc0012380,%eax
c0003422:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003428:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000342b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000342e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003431:	c9                   	leave  
c0003432:	c3                   	ret    

c0003433 <search_file>:
c0003433:	55                   	push   %ebp
c0003434:	89 e5                	mov    %esp,%ebp
c0003436:	83 ec 68             	sub    $0x68,%esp
c0003439:	83 ec 04             	sub    $0x4,%esp
c000343c:	6a 0c                	push   $0xc
c000343e:	6a 00                	push   $0x0
c0003440:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003443:	50                   	push   %eax
c0003444:	e8 e2 86 00 00       	call   c000bb2b <Memset>
c0003449:	83 c4 10             	add    $0x10,%esp
c000344c:	83 ec 04             	sub    $0x4,%esp
c000344f:	6a 28                	push   $0x28
c0003451:	6a 00                	push   $0x0
c0003453:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003456:	50                   	push   %eax
c0003457:	e8 cf 86 00 00       	call   c000bb2b <Memset>
c000345c:	83 c4 10             	add    $0x10,%esp
c000345f:	83 ec 04             	sub    $0x4,%esp
c0003462:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003465:	50                   	push   %eax
c0003466:	ff 75 08             	pushl  0x8(%ebp)
c0003469:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000346c:	50                   	push   %eax
c000346d:	e8 f3 00 00 00       	call   c0003565 <strip_path>
c0003472:	83 c4 10             	add    $0x10,%esp
c0003475:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003478:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000347c:	75 0a                	jne    c0003488 <search_file+0x55>
c000347e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003483:	e9 db 00 00 00       	jmp    c0003563 <search_file+0x130>
c0003488:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000348b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000348e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003491:	05 00 02 00 00       	add    $0x200,%eax
c0003496:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000349c:	85 c0                	test   %eax,%eax
c000349e:	0f 48 c2             	cmovs  %edx,%eax
c00034a1:	c1 f8 09             	sar    $0x9,%eax
c00034a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00034a7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00034aa:	c1 e8 04             	shr    $0x4,%eax
c00034ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00034b0:	e8 63 14 00 00       	call   c0004918 <get_super_block>
c00034b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00034b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00034bb:	8b 00                	mov    (%eax),%eax
c00034bd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00034c0:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c00034c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00034ce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00034d5:	eb 7b                	jmp    c0003552 <search_file+0x11f>
c00034d7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00034dc:	89 c1                	mov    %eax,%ecx
c00034de:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00034e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034e4:	01 d0                	add    %edx,%eax
c00034e6:	83 ec 0c             	sub    $0xc,%esp
c00034e9:	6a 07                	push   $0x7
c00034eb:	68 00 02 00 00       	push   $0x200
c00034f0:	51                   	push   %ecx
c00034f1:	ff 75 cc             	pushl  -0x34(%ebp)
c00034f4:	50                   	push   %eax
c00034f5:	e8 59 f6 ff ff       	call   c0002b53 <rd_wt>
c00034fa:	83 c4 20             	add    $0x20,%esp
c00034fd:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003502:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003505:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000350c:	eb 35                	jmp    c0003543 <search_file+0x110>
c000350e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003512:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003515:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003518:	7f 33                	jg     c000354d <search_file+0x11a>
c000351a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000351d:	83 c0 04             	add    $0x4,%eax
c0003520:	83 ec 08             	sub    $0x8,%esp
c0003523:	50                   	push   %eax
c0003524:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003527:	50                   	push   %eax
c0003528:	e8 66 6d 00 00       	call   c000a293 <strcmp>
c000352d:	83 c4 10             	add    $0x10,%esp
c0003530:	85 c0                	test   %eax,%eax
c0003532:	75 07                	jne    c000353b <search_file+0x108>
c0003534:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003537:	8b 00                	mov    (%eax),%eax
c0003539:	eb 28                	jmp    c0003563 <search_file+0x130>
c000353b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000353f:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003543:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003546:	83 f8 1f             	cmp    $0x1f,%eax
c0003549:	76 c3                	jbe    c000350e <search_file+0xdb>
c000354b:	eb 01                	jmp    c000354e <search_file+0x11b>
c000354d:	90                   	nop
c000354e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003552:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003555:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003558:	0f 8c 79 ff ff ff    	jl     c00034d7 <search_file+0xa4>
c000355e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003563:	c9                   	leave  
c0003564:	c3                   	ret    

c0003565 <strip_path>:
c0003565:	55                   	push   %ebp
c0003566:	89 e5                	mov    %esp,%ebp
c0003568:	83 ec 10             	sub    $0x10,%esp
c000356b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000356f:	75 0a                	jne    c000357b <strip_path+0x16>
c0003571:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003576:	e9 b4 00 00 00       	jmp    c000362f <strip_path+0xca>
c000357b:	8b 45 08             	mov    0x8(%ebp),%eax
c000357e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003581:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003584:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003587:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000358a:	0f b6 00             	movzbl (%eax),%eax
c000358d:	3c 2f                	cmp    $0x2f,%al
c000358f:	75 2d                	jne    c00035be <strip_path+0x59>
c0003591:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003595:	eb 27                	jmp    c00035be <strip_path+0x59>
c0003597:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000359a:	0f b6 00             	movzbl (%eax),%eax
c000359d:	3c 2f                	cmp    $0x2f,%al
c000359f:	75 0a                	jne    c00035ab <strip_path+0x46>
c00035a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035a6:	e9 84 00 00 00       	jmp    c000362f <strip_path+0xca>
c00035ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035ae:	0f b6 10             	movzbl (%eax),%edx
c00035b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00035b4:	88 10                	mov    %dl,(%eax)
c00035b6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00035ba:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00035be:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035c1:	0f b6 00             	movzbl (%eax),%eax
c00035c4:	84 c0                	test   %al,%al
c00035c6:	75 cf                	jne    c0003597 <strip_path+0x32>
c00035c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00035cb:	c6 00 00             	movb   $0x0,(%eax)
c00035ce:	8b 45 10             	mov    0x10(%ebp),%eax
c00035d1:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c00035d7:	89 10                	mov    %edx,(%eax)
c00035d9:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00035df:	89 50 04             	mov    %edx,0x4(%eax)
c00035e2:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c00035e8:	89 50 08             	mov    %edx,0x8(%eax)
c00035eb:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c00035f1:	89 50 0c             	mov    %edx,0xc(%eax)
c00035f4:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c00035fa:	89 50 10             	mov    %edx,0x10(%eax)
c00035fd:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c0003603:	89 50 14             	mov    %edx,0x14(%eax)
c0003606:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c000360c:	89 50 18             	mov    %edx,0x18(%eax)
c000360f:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c0003615:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003618:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c000361e:	89 50 20             	mov    %edx,0x20(%eax)
c0003621:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003627:	89 50 24             	mov    %edx,0x24(%eax)
c000362a:	b8 00 00 00 00       	mov    $0x0,%eax
c000362f:	c9                   	leave  
c0003630:	c3                   	ret    

c0003631 <get_inode>:
c0003631:	55                   	push   %ebp
c0003632:	89 e5                	mov    %esp,%ebp
c0003634:	56                   	push   %esi
c0003635:	53                   	push   %ebx
c0003636:	83 ec 20             	sub    $0x20,%esp
c0003639:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000363d:	75 0a                	jne    c0003649 <get_inode+0x18>
c000363f:	b8 00 00 00 00       	mov    $0x0,%eax
c0003644:	e9 a3 01 00 00       	jmp    c00037ec <get_inode+0x1bb>
c0003649:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003650:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c0003657:	eb 69                	jmp    c00036c2 <get_inode+0x91>
c0003659:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000365c:	8b 40 24             	mov    0x24(%eax),%eax
c000365f:	85 c0                	test   %eax,%eax
c0003661:	7e 53                	jle    c00036b6 <get_inode+0x85>
c0003663:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003666:	8b 40 10             	mov    0x10(%eax),%eax
c0003669:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000366c:	75 50                	jne    c00036be <get_inode+0x8d>
c000366e:	8b 45 08             	mov    0x8(%ebp),%eax
c0003671:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003674:	8b 0a                	mov    (%edx),%ecx
c0003676:	89 08                	mov    %ecx,(%eax)
c0003678:	8b 4a 04             	mov    0x4(%edx),%ecx
c000367b:	89 48 04             	mov    %ecx,0x4(%eax)
c000367e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003681:	89 48 08             	mov    %ecx,0x8(%eax)
c0003684:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003687:	89 48 0c             	mov    %ecx,0xc(%eax)
c000368a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000368d:	89 48 10             	mov    %ecx,0x10(%eax)
c0003690:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003693:	89 48 14             	mov    %ecx,0x14(%eax)
c0003696:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003699:	89 48 18             	mov    %ecx,0x18(%eax)
c000369c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000369f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00036a2:	8b 4a 20             	mov    0x20(%edx),%ecx
c00036a5:	89 48 20             	mov    %ecx,0x20(%eax)
c00036a8:	8b 52 24             	mov    0x24(%edx),%edx
c00036ab:	89 50 24             	mov    %edx,0x24(%eax)
c00036ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036b1:	e9 36 01 00 00       	jmp    c00037ec <get_inode+0x1bb>
c00036b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00036bc:	eb 0d                	jmp    c00036cb <get_inode+0x9a>
c00036be:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c00036c2:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c00036c9:	76 8e                	jbe    c0003659 <get_inode+0x28>
c00036cb:	e8 48 12 00 00       	call   c0004918 <get_super_block>
c00036d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00036d3:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00036da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036dd:	8b 40 04             	mov    0x4(%eax),%eax
c00036e0:	8d 50 02             	lea    0x2(%eax),%edx
c00036e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036e6:	8b 40 08             	mov    0x8(%eax),%eax
c00036e9:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00036ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c00036ef:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00036f2:	b8 00 02 00 00       	mov    $0x200,%eax
c00036f7:	99                   	cltd   
c00036f8:	f7 7d e8             	idivl  -0x18(%ebp)
c00036fb:	89 c6                	mov    %eax,%esi
c00036fd:	89 c8                	mov    %ecx,%eax
c00036ff:	99                   	cltd   
c0003700:	f7 fe                	idiv   %esi
c0003702:	01 d8                	add    %ebx,%eax
c0003704:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003707:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000370e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003713:	83 ec 0c             	sub    $0xc,%esp
c0003716:	6a 07                	push   $0x7
c0003718:	68 00 02 00 00       	push   $0x200
c000371d:	50                   	push   %eax
c000371e:	ff 75 e0             	pushl  -0x20(%ebp)
c0003721:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003724:	e8 2a f4 ff ff       	call   c0002b53 <rd_wt>
c0003729:	83 c4 20             	add    $0x20,%esp
c000372c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000372f:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003732:	b8 00 02 00 00       	mov    $0x200,%eax
c0003737:	99                   	cltd   
c0003738:	f7 7d e8             	idivl  -0x18(%ebp)
c000373b:	89 c3                	mov    %eax,%ebx
c000373d:	89 c8                	mov    %ecx,%eax
c000373f:	99                   	cltd   
c0003740:	f7 fb                	idiv   %ebx
c0003742:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003745:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000374b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000374e:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003752:	01 d0                	add    %edx,%eax
c0003754:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003757:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000375a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000375d:	8b 0a                	mov    (%edx),%ecx
c000375f:	89 08                	mov    %ecx,(%eax)
c0003761:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003764:	89 48 04             	mov    %ecx,0x4(%eax)
c0003767:	8b 4a 08             	mov    0x8(%edx),%ecx
c000376a:	89 48 08             	mov    %ecx,0x8(%eax)
c000376d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003770:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003773:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003776:	89 48 10             	mov    %ecx,0x10(%eax)
c0003779:	8b 4a 14             	mov    0x14(%edx),%ecx
c000377c:	89 48 14             	mov    %ecx,0x14(%eax)
c000377f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003782:	89 48 18             	mov    %ecx,0x18(%eax)
c0003785:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003788:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000378b:	8b 4a 20             	mov    0x20(%edx),%ecx
c000378e:	89 48 20             	mov    %ecx,0x20(%eax)
c0003791:	8b 52 24             	mov    0x24(%edx),%edx
c0003794:	89 50 24             	mov    %edx,0x24(%eax)
c0003797:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000379a:	8b 55 0c             	mov    0xc(%ebp),%edx
c000379d:	89 50 10             	mov    %edx,0x10(%eax)
c00037a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037a3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00037a6:	89 50 20             	mov    %edx,0x20(%eax)
c00037a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00037ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00037af:	8b 0a                	mov    (%edx),%ecx
c00037b1:	89 08                	mov    %ecx,(%eax)
c00037b3:	8b 4a 04             	mov    0x4(%edx),%ecx
c00037b6:	89 48 04             	mov    %ecx,0x4(%eax)
c00037b9:	8b 4a 08             	mov    0x8(%edx),%ecx
c00037bc:	89 48 08             	mov    %ecx,0x8(%eax)
c00037bf:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00037c2:	89 48 0c             	mov    %ecx,0xc(%eax)
c00037c5:	8b 4a 10             	mov    0x10(%edx),%ecx
c00037c8:	89 48 10             	mov    %ecx,0x10(%eax)
c00037cb:	8b 4a 14             	mov    0x14(%edx),%ecx
c00037ce:	89 48 14             	mov    %ecx,0x14(%eax)
c00037d1:	8b 4a 18             	mov    0x18(%edx),%ecx
c00037d4:	89 48 18             	mov    %ecx,0x18(%eax)
c00037d7:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00037da:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00037dd:	8b 4a 20             	mov    0x20(%edx),%ecx
c00037e0:	89 48 20             	mov    %ecx,0x20(%eax)
c00037e3:	8b 52 24             	mov    0x24(%edx),%edx
c00037e6:	89 50 24             	mov    %edx,0x24(%eax)
c00037e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00037ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00037ef:	5b                   	pop    %ebx
c00037f0:	5e                   	pop    %esi
c00037f1:	5d                   	pop    %ebp
c00037f2:	c3                   	ret    

c00037f3 <create_file>:
c00037f3:	55                   	push   %ebp
c00037f4:	89 e5                	mov    %esp,%ebp
c00037f6:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00037fc:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00037ff:	50                   	push   %eax
c0003800:	ff 75 0c             	pushl  0xc(%ebp)
c0003803:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003806:	50                   	push   %eax
c0003807:	e8 59 fd ff ff       	call   c0003565 <strip_path>
c000380c:	83 c4 0c             	add    $0xc,%esp
c000380f:	83 f8 ff             	cmp    $0xffffffff,%eax
c0003812:	75 0a                	jne    c000381e <create_file+0x2b>
c0003814:	b8 00 00 00 00       	mov    $0x0,%eax
c0003819:	e9 de 00 00 00       	jmp    c00038fc <create_file+0x109>
c000381e:	e8 db 00 00 00       	call   c00038fe <alloc_imap_bit>
c0003823:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003826:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000382a:	75 0a                	jne    c0003836 <create_file+0x43>
c000382c:	b8 00 00 00 00       	mov    $0x0,%eax
c0003831:	e9 c6 00 00 00       	jmp    c00038fc <create_file+0x109>
c0003836:	e8 dd 10 00 00       	call   c0004918 <get_super_block>
c000383b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000383e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003841:	8b 40 10             	mov    0x10(%eax),%eax
c0003844:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003847:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000384a:	83 ec 08             	sub    $0x8,%esp
c000384d:	50                   	push   %eax
c000384e:	ff 75 f4             	pushl  -0xc(%ebp)
c0003851:	e8 a5 01 00 00       	call   c00039fb <alloc_smap_bit>
c0003856:	83 c4 10             	add    $0x10,%esp
c0003859:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000385c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003860:	75 0a                	jne    c000386c <create_file+0x79>
c0003862:	b8 00 00 00 00       	mov    $0x0,%eax
c0003867:	e9 90 00 00 00       	jmp    c00038fc <create_file+0x109>
c000386c:	83 ec 04             	sub    $0x4,%esp
c000386f:	ff 75 e8             	pushl  -0x18(%ebp)
c0003872:	ff 75 f4             	pushl  -0xc(%ebp)
c0003875:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003878:	50                   	push   %eax
c0003879:	e8 1e 03 00 00       	call   c0003b9c <new_inode>
c000387e:	83 c4 10             	add    $0x10,%esp
c0003881:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003884:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003888:	75 07                	jne    c0003891 <create_file+0x9e>
c000388a:	b8 00 00 00 00       	mov    $0x0,%eax
c000388f:	eb 6b                	jmp    c00038fc <create_file+0x109>
c0003891:	ff 75 f4             	pushl  -0xc(%ebp)
c0003894:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003897:	50                   	push   %eax
c0003898:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000389b:	50                   	push   %eax
c000389c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c00038a2:	50                   	push   %eax
c00038a3:	e8 12 04 00 00       	call   c0003cba <new_dir_entry>
c00038a8:	83 c4 10             	add    $0x10,%esp
c00038ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00038ae:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00038b2:	75 07                	jne    c00038bb <create_file+0xc8>
c00038b4:	b8 00 00 00 00       	mov    $0x0,%eax
c00038b9:	eb 41                	jmp    c00038fc <create_file+0x109>
c00038bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00038be:	8b 55 84             	mov    -0x7c(%ebp),%edx
c00038c1:	89 10                	mov    %edx,(%eax)
c00038c3:	8b 55 88             	mov    -0x78(%ebp),%edx
c00038c6:	89 50 04             	mov    %edx,0x4(%eax)
c00038c9:	8b 55 8c             	mov    -0x74(%ebp),%edx
c00038cc:	89 50 08             	mov    %edx,0x8(%eax)
c00038cf:	8b 55 90             	mov    -0x70(%ebp),%edx
c00038d2:	89 50 0c             	mov    %edx,0xc(%eax)
c00038d5:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00038d8:	89 50 10             	mov    %edx,0x10(%eax)
c00038db:	8b 55 98             	mov    -0x68(%ebp),%edx
c00038de:	89 50 14             	mov    %edx,0x14(%eax)
c00038e1:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00038e4:	89 50 18             	mov    %edx,0x18(%eax)
c00038e7:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00038ea:	89 50 1c             	mov    %edx,0x1c(%eax)
c00038ed:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c00038f0:	89 50 20             	mov    %edx,0x20(%eax)
c00038f3:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00038f6:	89 50 24             	mov    %edx,0x24(%eax)
c00038f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00038fc:	c9                   	leave  
c00038fd:	c3                   	ret    

c00038fe <alloc_imap_bit>:
c00038fe:	55                   	push   %ebp
c00038ff:	89 e5                	mov    %esp,%ebp
c0003901:	53                   	push   %ebx
c0003902:	83 ec 24             	sub    $0x24,%esp
c0003905:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000390c:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003913:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003918:	83 ec 0c             	sub    $0xc,%esp
c000391b:	6a 07                	push   $0x7
c000391d:	68 00 02 00 00       	push   $0x200
c0003922:	50                   	push   %eax
c0003923:	ff 75 e8             	pushl  -0x18(%ebp)
c0003926:	ff 75 ec             	pushl  -0x14(%ebp)
c0003929:	e8 25 f2 ff ff       	call   c0002b53 <rd_wt>
c000392e:	83 c4 20             	add    $0x20,%esp
c0003931:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003938:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000393f:	e9 a5 00 00 00       	jmp    c00039e9 <alloc_imap_bit+0xeb>
c0003944:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000394b:	e9 8b 00 00 00       	jmp    c00039db <alloc_imap_bit+0xdd>
c0003950:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003956:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003959:	01 d0                	add    %edx,%eax
c000395b:	0f b6 00             	movzbl (%eax),%eax
c000395e:	0f be d0             	movsbl %al,%edx
c0003961:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003964:	89 c1                	mov    %eax,%ecx
c0003966:	d3 fa                	sar    %cl,%edx
c0003968:	89 d0                	mov    %edx,%eax
c000396a:	83 e0 01             	and    $0x1,%eax
c000396d:	85 c0                	test   %eax,%eax
c000396f:	74 06                	je     c0003977 <alloc_imap_bit+0x79>
c0003971:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003975:	eb 64                	jmp    c00039db <alloc_imap_bit+0xdd>
c0003977:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000397d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003980:	01 d0                	add    %edx,%eax
c0003982:	0f b6 18             	movzbl (%eax),%ebx
c0003985:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003988:	ba 01 00 00 00       	mov    $0x1,%edx
c000398d:	89 c1                	mov    %eax,%ecx
c000398f:	d3 e2                	shl    %cl,%edx
c0003991:	89 d0                	mov    %edx,%eax
c0003993:	89 c1                	mov    %eax,%ecx
c0003995:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000399b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000399e:	01 d0                	add    %edx,%eax
c00039a0:	09 cb                	or     %ecx,%ebx
c00039a2:	89 da                	mov    %ebx,%edx
c00039a4:	88 10                	mov    %dl,(%eax)
c00039a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039a9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00039b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039b3:	01 d0                	add    %edx,%eax
c00039b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00039b8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00039bd:	83 ec 0c             	sub    $0xc,%esp
c00039c0:	6a 0a                	push   $0xa
c00039c2:	68 00 02 00 00       	push   $0x200
c00039c7:	50                   	push   %eax
c00039c8:	ff 75 e8             	pushl  -0x18(%ebp)
c00039cb:	ff 75 ec             	pushl  -0x14(%ebp)
c00039ce:	e8 80 f1 ff ff       	call   c0002b53 <rd_wt>
c00039d3:	83 c4 20             	add    $0x20,%esp
c00039d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00039d9:	eb 1b                	jmp    c00039f6 <alloc_imap_bit+0xf8>
c00039db:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c00039df:	0f 8e 6b ff ff ff    	jle    c0003950 <alloc_imap_bit+0x52>
c00039e5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00039e9:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c00039f0:	0f 8e 4e ff ff ff    	jle    c0003944 <alloc_imap_bit+0x46>
c00039f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00039f9:	c9                   	leave  
c00039fa:	c3                   	ret    

c00039fb <alloc_smap_bit>:
c00039fb:	55                   	push   %ebp
c00039fc:	89 e5                	mov    %esp,%ebp
c00039fe:	53                   	push   %ebx
c00039ff:	83 ec 34             	sub    $0x34,%esp
c0003a02:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a06:	75 1c                	jne    c0003a24 <alloc_smap_bit+0x29>
c0003a08:	68 f0 02 00 00       	push   $0x2f0
c0003a0d:	68 04 b1 00 c0       	push   $0xc000b104
c0003a12:	68 04 b1 00 c0       	push   $0xc000b104
c0003a17:	68 14 b2 00 c0       	push   $0xc000b214
c0003a1c:	e8 a6 5c 00 00       	call   c00096c7 <assertion_failure>
c0003a21:	83 c4 10             	add    $0x10,%esp
c0003a24:	e8 ef 0e 00 00       	call   c0004918 <get_super_block>
c0003a29:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003a2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a2f:	8b 40 08             	mov    0x8(%eax),%eax
c0003a32:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003a35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a38:	8b 40 04             	mov    0x4(%eax),%eax
c0003a3b:	83 c0 02             	add    $0x2,%eax
c0003a3e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003a41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003a48:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0003a4f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003a56:	e9 20 01 00 00       	jmp    c0003b7b <alloc_smap_bit+0x180>
c0003a5b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003a5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a61:	01 d0                	add    %edx,%eax
c0003a63:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003a66:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003a6b:	83 ec 0c             	sub    $0xc,%esp
c0003a6e:	6a 07                	push   $0x7
c0003a70:	68 00 02 00 00       	push   $0x200
c0003a75:	50                   	push   %eax
c0003a76:	ff 75 d8             	pushl  -0x28(%ebp)
c0003a79:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003a7c:	e8 d2 f0 ff ff       	call   c0002b53 <rd_wt>
c0003a81:	83 c4 20             	add    $0x20,%esp
c0003a84:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003a8b:	e9 b0 00 00 00       	jmp    c0003b40 <alloc_smap_bit+0x145>
c0003a90:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003a97:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a9b:	0f 85 8c 00 00 00    	jne    c0003b2d <alloc_smap_bit+0x132>
c0003aa1:	eb 45                	jmp    c0003ae8 <alloc_smap_bit+0xed>
c0003aa3:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003aa9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003aac:	01 d0                	add    %edx,%eax
c0003aae:	0f b6 00             	movzbl (%eax),%eax
c0003ab1:	0f be d0             	movsbl %al,%edx
c0003ab4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003ab7:	89 c1                	mov    %eax,%ecx
c0003ab9:	d3 fa                	sar    %cl,%edx
c0003abb:	89 d0                	mov    %edx,%eax
c0003abd:	83 e0 01             	and    $0x1,%eax
c0003ac0:	85 c0                	test   %eax,%eax
c0003ac2:	74 06                	je     c0003aca <alloc_smap_bit+0xcf>
c0003ac4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003ac8:	eb 1e                	jmp    c0003ae8 <alloc_smap_bit+0xed>
c0003aca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003acd:	c1 e0 09             	shl    $0x9,%eax
c0003ad0:	89 c2                	mov    %eax,%edx
c0003ad2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003ad5:	01 d0                	add    %edx,%eax
c0003ad7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003ade:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003ae1:	01 d0                	add    %edx,%eax
c0003ae3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003ae6:	eb 06                	jmp    c0003aee <alloc_smap_bit+0xf3>
c0003ae8:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003aec:	7e b5                	jle    c0003aa3 <alloc_smap_bit+0xa8>
c0003aee:	eb 3d                	jmp    c0003b2d <alloc_smap_bit+0x132>
c0003af0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003af4:	74 45                	je     c0003b3b <alloc_smap_bit+0x140>
c0003af6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003afc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003aff:	01 d0                	add    %edx,%eax
c0003b01:	0f b6 18             	movzbl (%eax),%ebx
c0003b04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b07:	ba 01 00 00 00       	mov    $0x1,%edx
c0003b0c:	89 c1                	mov    %eax,%ecx
c0003b0e:	d3 e2                	shl    %cl,%edx
c0003b10:	89 d0                	mov    %edx,%eax
c0003b12:	89 c1                	mov    %eax,%ecx
c0003b14:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b1d:	01 d0                	add    %edx,%eax
c0003b1f:	09 cb                	or     %ecx,%ebx
c0003b21:	89 da                	mov    %ebx,%edx
c0003b23:	88 10                	mov    %dl,(%eax)
c0003b25:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003b29:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b2d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b31:	74 09                	je     c0003b3c <alloc_smap_bit+0x141>
c0003b33:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003b37:	7e b7                	jle    c0003af0 <alloc_smap_bit+0xf5>
c0003b39:	eb 01                	jmp    c0003b3c <alloc_smap_bit+0x141>
c0003b3b:	90                   	nop
c0003b3c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003b40:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003b47:	0f 8e 43 ff ff ff    	jle    c0003a90 <alloc_smap_bit+0x95>
c0003b4d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b51:	74 1e                	je     c0003b71 <alloc_smap_bit+0x176>
c0003b53:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003b58:	83 ec 0c             	sub    $0xc,%esp
c0003b5b:	6a 0a                	push   $0xa
c0003b5d:	68 00 02 00 00       	push   $0x200
c0003b62:	50                   	push   %eax
c0003b63:	ff 75 d8             	pushl  -0x28(%ebp)
c0003b66:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003b69:	e8 e5 ef ff ff       	call   c0002b53 <rd_wt>
c0003b6e:	83 c4 20             	add    $0x20,%esp
c0003b71:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b75:	74 12                	je     c0003b89 <alloc_smap_bit+0x18e>
c0003b77:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003b7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b7e:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003b81:	0f 8c d4 fe ff ff    	jl     c0003a5b <alloc_smap_bit+0x60>
c0003b87:	eb 01                	jmp    c0003b8a <alloc_smap_bit+0x18f>
c0003b89:	90                   	nop
c0003b8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003b8d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003b90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003b93:	8b 00                	mov    (%eax),%eax
c0003b95:	01 d0                	add    %edx,%eax
c0003b97:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003b9a:	c9                   	leave  
c0003b9b:	c3                   	ret    

c0003b9c <new_inode>:
c0003b9c:	55                   	push   %ebp
c0003b9d:	89 e5                	mov    %esp,%ebp
c0003b9f:	83 ec 38             	sub    $0x38,%esp
c0003ba2:	83 ec 08             	sub    $0x8,%esp
c0003ba5:	ff 75 0c             	pushl  0xc(%ebp)
c0003ba8:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003bab:	50                   	push   %eax
c0003bac:	e8 80 fa ff ff       	call   c0003631 <get_inode>
c0003bb1:	83 c4 10             	add    $0x10,%esp
c0003bb4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003bb7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003bbb:	75 0a                	jne    c0003bc7 <new_inode+0x2b>
c0003bbd:	b8 00 00 00 00       	mov    $0x0,%eax
c0003bc2:	e9 f1 00 00 00       	jmp    c0003cb8 <new_inode+0x11c>
c0003bc7:	8b 45 10             	mov    0x10(%ebp),%eax
c0003bca:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003bcd:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003bd4:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003bdb:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003be2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003be5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003be8:	83 ec 0c             	sub    $0xc,%esp
c0003beb:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003bee:	50                   	push   %eax
c0003bef:	e8 40 0b 00 00       	call   c0004734 <sync_inode>
c0003bf4:	83 c4 10             	add    $0x10,%esp
c0003bf7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003bfe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003c05:	eb 1d                	jmp    c0003c24 <new_inode+0x88>
c0003c07:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c0a:	89 d0                	mov    %edx,%eax
c0003c0c:	c1 e0 02             	shl    $0x2,%eax
c0003c0f:	01 d0                	add    %edx,%eax
c0003c11:	c1 e0 03             	shl    $0x3,%eax
c0003c14:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003c19:	8b 00                	mov    (%eax),%eax
c0003c1b:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003c1e:	74 0c                	je     c0003c2c <new_inode+0x90>
c0003c20:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003c24:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003c28:	7e dd                	jle    c0003c07 <new_inode+0x6b>
c0003c2a:	eb 01                	jmp    c0003c2d <new_inode+0x91>
c0003c2c:	90                   	nop
c0003c2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c30:	89 d0                	mov    %edx,%eax
c0003c32:	c1 e0 02             	shl    $0x2,%eax
c0003c35:	01 d0                	add    %edx,%eax
c0003c37:	c1 e0 03             	shl    $0x3,%eax
c0003c3a:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003c3f:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003c42:	89 10                	mov    %edx,(%eax)
c0003c44:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c47:	89 50 04             	mov    %edx,0x4(%eax)
c0003c4a:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003c4d:	89 50 08             	mov    %edx,0x8(%eax)
c0003c50:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003c53:	89 50 0c             	mov    %edx,0xc(%eax)
c0003c56:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003c59:	89 50 10             	mov    %edx,0x10(%eax)
c0003c5c:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003c5f:	89 50 14             	mov    %edx,0x14(%eax)
c0003c62:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003c65:	89 50 18             	mov    %edx,0x18(%eax)
c0003c68:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003c6b:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003c6e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003c71:	89 50 20             	mov    %edx,0x20(%eax)
c0003c74:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003c77:	89 50 24             	mov    %edx,0x24(%eax)
c0003c7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c7d:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003c80:	89 10                	mov    %edx,(%eax)
c0003c82:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c85:	89 50 04             	mov    %edx,0x4(%eax)
c0003c88:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003c8b:	89 50 08             	mov    %edx,0x8(%eax)
c0003c8e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003c91:	89 50 0c             	mov    %edx,0xc(%eax)
c0003c94:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003c97:	89 50 10             	mov    %edx,0x10(%eax)
c0003c9a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003c9d:	89 50 14             	mov    %edx,0x14(%eax)
c0003ca0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003ca3:	89 50 18             	mov    %edx,0x18(%eax)
c0003ca6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003ca9:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003cac:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003caf:	89 50 20             	mov    %edx,0x20(%eax)
c0003cb2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003cb5:	89 50 24             	mov    %edx,0x24(%eax)
c0003cb8:	c9                   	leave  
c0003cb9:	c3                   	ret    

c0003cba <new_dir_entry>:
c0003cba:	55                   	push   %ebp
c0003cbb:	89 e5                	mov    %esp,%ebp
c0003cbd:	83 ec 48             	sub    $0x48,%esp
c0003cc0:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003cc7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cca:	8b 40 04             	mov    0x4(%eax),%eax
c0003ccd:	99                   	cltd   
c0003cce:	f7 7d dc             	idivl  -0x24(%ebp)
c0003cd1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cd7:	8b 40 0c             	mov    0xc(%eax),%eax
c0003cda:	99                   	cltd   
c0003cdb:	f7 7d dc             	idivl  -0x24(%ebp)
c0003cde:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003ce1:	e8 32 0c 00 00       	call   c0004918 <get_super_block>
c0003ce6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003ce9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003cec:	8b 00                	mov    (%eax),%eax
c0003cee:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003cf1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cf4:	8b 40 0c             	mov    0xc(%eax),%eax
c0003cf7:	05 00 02 00 00       	add    $0x200,%eax
c0003cfc:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d02:	85 c0                	test   %eax,%eax
c0003d04:	0f 48 c2             	cmovs  %edx,%eax
c0003d07:	c1 f8 09             	sar    $0x9,%eax
c0003d0a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003d0d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003d14:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003d1b:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003d22:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003d29:	eb 7f                	jmp    c0003daa <new_dir_entry+0xf0>
c0003d2b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d30:	89 c1                	mov    %eax,%ecx
c0003d32:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003d35:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003d38:	01 d0                	add    %edx,%eax
c0003d3a:	83 ec 0c             	sub    $0xc,%esp
c0003d3d:	6a 07                	push   $0x7
c0003d3f:	68 00 02 00 00       	push   $0x200
c0003d44:	51                   	push   %ecx
c0003d45:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003d48:	50                   	push   %eax
c0003d49:	e8 05 ee ff ff       	call   c0002b53 <rd_wt>
c0003d4e:	83 c4 20             	add    $0x20,%esp
c0003d51:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003d56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003d59:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003d60:	eb 25                	jmp    c0003d87 <new_dir_entry+0xcd>
c0003d62:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003d66:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003d69:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003d6c:	7f 29                	jg     c0003d97 <new_dir_entry+0xdd>
c0003d6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d71:	8b 00                	mov    (%eax),%eax
c0003d73:	85 c0                	test   %eax,%eax
c0003d75:	75 08                	jne    c0003d7f <new_dir_entry+0xc5>
c0003d77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003d7d:	eb 19                	jmp    c0003d98 <new_dir_entry+0xde>
c0003d7f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003d83:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003d87:	b8 00 02 00 00       	mov    $0x200,%eax
c0003d8c:	99                   	cltd   
c0003d8d:	f7 7d dc             	idivl  -0x24(%ebp)
c0003d90:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003d93:	7c cd                	jl     c0003d62 <new_dir_entry+0xa8>
c0003d95:	eb 01                	jmp    c0003d98 <new_dir_entry+0xde>
c0003d97:	90                   	nop
c0003d98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003d9b:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003d9e:	7f 16                	jg     c0003db6 <new_dir_entry+0xfc>
c0003da0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003da4:	75 10                	jne    c0003db6 <new_dir_entry+0xfc>
c0003da6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003daa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003dad:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003db0:	0f 8c 75 ff ff ff    	jl     c0003d2b <new_dir_entry+0x71>
c0003db6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003db9:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003dbc:	75 0a                	jne    c0003dc8 <new_dir_entry+0x10e>
c0003dbe:	b8 00 00 00 00       	mov    $0x0,%eax
c0003dc3:	e9 fc 00 00 00       	jmp    c0003ec4 <new_dir_entry+0x20a>
c0003dc8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003dcf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003dd3:	75 1e                	jne    c0003df3 <new_dir_entry+0x139>
c0003dd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003dd8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003ddb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003dde:	8b 50 04             	mov    0x4(%eax),%edx
c0003de1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003de4:	01 c2                	add    %eax,%edx
c0003de6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003de9:	89 50 04             	mov    %edx,0x4(%eax)
c0003dec:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003df3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003df6:	8b 55 14             	mov    0x14(%ebp),%edx
c0003df9:	89 10                	mov    %edx,(%eax)
c0003dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003dfe:	83 c0 04             	add    $0x4,%eax
c0003e01:	83 ec 08             	sub    $0x8,%esp
c0003e04:	ff 75 10             	pushl  0x10(%ebp)
c0003e07:	50                   	push   %eax
c0003e08:	e8 3d 7d 00 00       	call   c000bb4a <Strcpy>
c0003e0d:	83 c4 10             	add    $0x10,%esp
c0003e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0003e13:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003e16:	8b 0a                	mov    (%edx),%ecx
c0003e18:	89 08                	mov    %ecx,(%eax)
c0003e1a:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003e1d:	89 48 04             	mov    %ecx,0x4(%eax)
c0003e20:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003e23:	89 48 08             	mov    %ecx,0x8(%eax)
c0003e26:	8b 52 0c             	mov    0xc(%edx),%edx
c0003e29:	89 50 0c             	mov    %edx,0xc(%eax)
c0003e2c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e31:	89 c1                	mov    %eax,%ecx
c0003e33:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003e36:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003e39:	01 d0                	add    %edx,%eax
c0003e3b:	83 ec 0c             	sub    $0xc,%esp
c0003e3e:	6a 0a                	push   $0xa
c0003e40:	68 00 02 00 00       	push   $0x200
c0003e45:	51                   	push   %ecx
c0003e46:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003e49:	50                   	push   %eax
c0003e4a:	e8 04 ed ff ff       	call   c0002b53 <rd_wt>
c0003e4f:	83 c4 20             	add    $0x20,%esp
c0003e52:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003e56:	74 69                	je     c0003ec1 <new_dir_entry+0x207>
c0003e58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e5b:	8b 10                	mov    (%eax),%edx
c0003e5d:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003e63:	8b 50 04             	mov    0x4(%eax),%edx
c0003e66:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003e6c:	8b 50 08             	mov    0x8(%eax),%edx
c0003e6f:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003e75:	8b 50 0c             	mov    0xc(%eax),%edx
c0003e78:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003e7e:	8b 50 10             	mov    0x10(%eax),%edx
c0003e81:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003e87:	8b 50 14             	mov    0x14(%eax),%edx
c0003e8a:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003e90:	8b 50 18             	mov    0x18(%eax),%edx
c0003e93:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003e99:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003e9c:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003ea2:	8b 50 20             	mov    0x20(%eax),%edx
c0003ea5:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003eab:	8b 40 24             	mov    0x24(%eax),%eax
c0003eae:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003eb3:	83 ec 0c             	sub    $0xc,%esp
c0003eb6:	ff 75 0c             	pushl  0xc(%ebp)
c0003eb9:	e8 76 08 00 00       	call   c0004734 <sync_inode>
c0003ebe:	83 c4 10             	add    $0x10,%esp
c0003ec1:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ec4:	c9                   	leave  
c0003ec5:	c3                   	ret    

c0003ec6 <do_unlink>:
c0003ec6:	55                   	push   %ebp
c0003ec7:	89 e5                	mov    %esp,%ebp
c0003ec9:	53                   	push   %ebx
c0003eca:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003ed0:	83 ec 08             	sub    $0x8,%esp
c0003ed3:	ff 75 08             	pushl  0x8(%ebp)
c0003ed6:	68 29 b2 00 c0       	push   $0xc000b229
c0003edb:	e8 b3 63 00 00       	call   c000a293 <strcmp>
c0003ee0:	83 c4 10             	add    $0x10,%esp
c0003ee3:	85 c0                	test   %eax,%eax
c0003ee5:	75 10                	jne    c0003ef7 <do_unlink+0x31>
c0003ee7:	83 ec 0c             	sub    $0xc,%esp
c0003eea:	68 2b b2 00 c0       	push   $0xc000b22b
c0003eef:	e8 b5 57 00 00       	call   c00096a9 <panic>
c0003ef4:	83 c4 10             	add    $0x10,%esp
c0003ef7:	83 ec 0c             	sub    $0xc,%esp
c0003efa:	ff 75 08             	pushl  0x8(%ebp)
c0003efd:	e8 31 f5 ff ff       	call   c0003433 <search_file>
c0003f02:	83 c4 10             	add    $0x10,%esp
c0003f05:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f08:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003f0c:	75 10                	jne    c0003f1e <do_unlink+0x58>
c0003f0e:	83 ec 0c             	sub    $0xc,%esp
c0003f11:	68 47 b2 00 c0       	push   $0xc000b247
c0003f16:	e8 8e 57 00 00       	call   c00096a9 <panic>
c0003f1b:	83 c4 10             	add    $0x10,%esp
c0003f1e:	83 ec 08             	sub    $0x8,%esp
c0003f21:	ff 75 d0             	pushl  -0x30(%ebp)
c0003f24:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003f2a:	50                   	push   %eax
c0003f2b:	e8 01 f7 ff ff       	call   c0003631 <get_inode>
c0003f30:	83 c4 10             	add    $0x10,%esp
c0003f33:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003f36:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003f3a:	75 10                	jne    c0003f4c <do_unlink+0x86>
c0003f3c:	83 ec 0c             	sub    $0xc,%esp
c0003f3f:	68 47 b2 00 c0       	push   $0xc000b247
c0003f44:	e8 60 57 00 00       	call   c00096a9 <panic>
c0003f49:	83 c4 10             	add    $0x10,%esp
c0003f4c:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003f4f:	85 c0                	test   %eax,%eax
c0003f51:	7e 10                	jle    c0003f63 <do_unlink+0x9d>
c0003f53:	83 ec 0c             	sub    $0xc,%esp
c0003f56:	68 60 b2 00 c0       	push   $0xc000b260
c0003f5b:	e8 49 57 00 00       	call   c00096a9 <panic>
c0003f60:	83 c4 10             	add    $0x10,%esp
c0003f63:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003f69:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003f6c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003f6f:	8d 50 07             	lea    0x7(%eax),%edx
c0003f72:	85 c0                	test   %eax,%eax
c0003f74:	0f 48 c2             	cmovs  %edx,%eax
c0003f77:	c1 f8 03             	sar    $0x3,%eax
c0003f7a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003f7d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003f80:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003f86:	85 c0                	test   %eax,%eax
c0003f88:	0f 48 c2             	cmovs  %edx,%eax
c0003f8b:	c1 f8 09             	sar    $0x9,%eax
c0003f8e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003f91:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003f94:	99                   	cltd   
c0003f95:	c1 ea 1d             	shr    $0x1d,%edx
c0003f98:	01 d0                	add    %edx,%eax
c0003f9a:	83 e0 07             	and    $0x7,%eax
c0003f9d:	29 d0                	sub    %edx,%eax
c0003f9f:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003fa2:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003fa9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003fae:	89 c2                	mov    %eax,%edx
c0003fb0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003fb3:	83 c0 02             	add    $0x2,%eax
c0003fb6:	83 ec 0c             	sub    $0xc,%esp
c0003fb9:	6a 07                	push   $0x7
c0003fbb:	68 00 02 00 00       	push   $0x200
c0003fc0:	52                   	push   %edx
c0003fc1:	ff 75 b8             	pushl  -0x48(%ebp)
c0003fc4:	50                   	push   %eax
c0003fc5:	e8 89 eb ff ff       	call   c0002b53 <rd_wt>
c0003fca:	83 c4 20             	add    $0x20,%esp
c0003fcd:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003fd3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003fd6:	01 d0                	add    %edx,%eax
c0003fd8:	0f b6 10             	movzbl (%eax),%edx
c0003fdb:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003fde:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003fe3:	89 c1                	mov    %eax,%ecx
c0003fe5:	d3 e3                	shl    %cl,%ebx
c0003fe7:	89 d8                	mov    %ebx,%eax
c0003fe9:	f7 d0                	not    %eax
c0003feb:	89 c3                	mov    %eax,%ebx
c0003fed:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003ff3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003ff6:	01 c8                	add    %ecx,%eax
c0003ff8:	21 da                	and    %ebx,%edx
c0003ffa:	88 10                	mov    %dl,(%eax)
c0003ffc:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004001:	89 c2                	mov    %eax,%edx
c0004003:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004006:	83 c0 02             	add    $0x2,%eax
c0004009:	83 ec 0c             	sub    $0xc,%esp
c000400c:	6a 0a                	push   $0xa
c000400e:	68 00 02 00 00       	push   $0x200
c0004013:	52                   	push   %edx
c0004014:	ff 75 b8             	pushl  -0x48(%ebp)
c0004017:	50                   	push   %eax
c0004018:	e8 36 eb ff ff       	call   c0002b53 <rd_wt>
c000401d:	83 c4 20             	add    $0x20,%esp
c0004020:	e8 f3 08 00 00       	call   c0004918 <get_super_block>
c0004025:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0004028:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c000402e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004031:	8b 00                	mov    (%eax),%eax
c0004033:	29 c2                	sub    %eax,%edx
c0004035:	89 d0                	mov    %edx,%eax
c0004037:	83 c0 01             	add    $0x1,%eax
c000403a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000403d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004040:	8d 50 07             	lea    0x7(%eax),%edx
c0004043:	85 c0                	test   %eax,%eax
c0004045:	0f 48 c2             	cmovs  %edx,%eax
c0004048:	c1 f8 03             	sar    $0x3,%eax
c000404b:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000404e:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0004051:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0004057:	85 c0                	test   %eax,%eax
c0004059:	0f 48 c2             	cmovs  %edx,%eax
c000405c:	c1 f8 09             	sar    $0x9,%eax
c000405f:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004062:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004065:	99                   	cltd   
c0004066:	c1 ea 1d             	shr    $0x1d,%edx
c0004069:	01 d0                	add    %edx,%eax
c000406b:	83 e0 07             	and    $0x7,%eax
c000406e:	29 d0                	sub    %edx,%eax
c0004070:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004073:	b8 08 00 00 00       	mov    $0x8,%eax
c0004078:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c000407b:	8b 55 b0             	mov    -0x50(%ebp),%edx
c000407e:	29 c2                	sub    %eax,%edx
c0004080:	89 d0                	mov    %edx,%eax
c0004082:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004085:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004088:	8d 50 07             	lea    0x7(%eax),%edx
c000408b:	85 c0                	test   %eax,%eax
c000408d:	0f 48 c2             	cmovs  %edx,%eax
c0004090:	c1 f8 03             	sar    $0x3,%eax
c0004093:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004096:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000409b:	89 c1                	mov    %eax,%ecx
c000409d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00040a0:	8b 40 04             	mov    0x4(%eax),%eax
c00040a3:	8d 50 02             	lea    0x2(%eax),%edx
c00040a6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00040a9:	01 d0                	add    %edx,%eax
c00040ab:	83 ec 0c             	sub    $0xc,%esp
c00040ae:	6a 07                	push   $0x7
c00040b0:	68 00 02 00 00       	push   $0x200
c00040b5:	51                   	push   %ecx
c00040b6:	ff 75 b8             	pushl  -0x48(%ebp)
c00040b9:	50                   	push   %eax
c00040ba:	e8 94 ea ff ff       	call   c0002b53 <rd_wt>
c00040bf:	83 c4 20             	add    $0x20,%esp
c00040c2:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00040c8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040cb:	01 d0                	add    %edx,%eax
c00040cd:	0f b6 10             	movzbl (%eax),%edx
c00040d0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00040d3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00040d8:	89 c1                	mov    %eax,%ecx
c00040da:	d3 e3                	shl    %cl,%ebx
c00040dc:	89 d8                	mov    %ebx,%eax
c00040de:	f7 d0                	not    %eax
c00040e0:	89 c3                	mov    %eax,%ebx
c00040e2:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c00040e8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040eb:	01 c8                	add    %ecx,%eax
c00040ed:	21 da                	and    %ebx,%edx
c00040ef:	88 10                	mov    %dl,(%eax)
c00040f1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00040f8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00040fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00040fe:	eb 6b                	jmp    c000416b <do_unlink+0x2a5>
c0004100:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004107:	75 4c                	jne    c0004155 <do_unlink+0x28f>
c0004109:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004110:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004115:	83 ec 0c             	sub    $0xc,%esp
c0004118:	6a 0a                	push   $0xa
c000411a:	68 00 02 00 00       	push   $0x200
c000411f:	50                   	push   %eax
c0004120:	ff 75 b8             	pushl  -0x48(%ebp)
c0004123:	ff 75 ec             	pushl  -0x14(%ebp)
c0004126:	e8 28 ea ff ff       	call   c0002b53 <rd_wt>
c000412b:	83 c4 20             	add    $0x20,%esp
c000412e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004133:	89 c1                	mov    %eax,%ecx
c0004135:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004138:	8d 50 01             	lea    0x1(%eax),%edx
c000413b:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000413e:	83 ec 0c             	sub    $0xc,%esp
c0004141:	6a 07                	push   $0x7
c0004143:	68 00 02 00 00       	push   $0x200
c0004148:	51                   	push   %ecx
c0004149:	ff 75 b8             	pushl  -0x48(%ebp)
c000414c:	50                   	push   %eax
c000414d:	e8 01 ea ff ff       	call   c0002b53 <rd_wt>
c0004152:	83 c4 20             	add    $0x20,%esp
c0004155:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000415b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000415e:	01 d0                	add    %edx,%eax
c0004160:	c6 00 00             	movb   $0x0,(%eax)
c0004163:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004167:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c000416b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000416e:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0004171:	7c 8d                	jl     c0004100 <do_unlink+0x23a>
c0004173:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c000417a:	75 4c                	jne    c00041c8 <do_unlink+0x302>
c000417c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004183:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004188:	83 ec 0c             	sub    $0xc,%esp
c000418b:	6a 0a                	push   $0xa
c000418d:	68 00 02 00 00       	push   $0x200
c0004192:	50                   	push   %eax
c0004193:	ff 75 b8             	pushl  -0x48(%ebp)
c0004196:	ff 75 ec             	pushl  -0x14(%ebp)
c0004199:	e8 b5 e9 ff ff       	call   c0002b53 <rd_wt>
c000419e:	83 c4 20             	add    $0x20,%esp
c00041a1:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041a6:	89 c1                	mov    %eax,%ecx
c00041a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041ab:	8d 50 01             	lea    0x1(%eax),%edx
c00041ae:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00041b1:	83 ec 0c             	sub    $0xc,%esp
c00041b4:	6a 07                	push   $0x7
c00041b6:	68 00 02 00 00       	push   $0x200
c00041bb:	51                   	push   %ecx
c00041bc:	ff 75 b8             	pushl  -0x48(%ebp)
c00041bf:	50                   	push   %eax
c00041c0:	e8 8e e9 ff ff       	call   c0002b53 <rd_wt>
c00041c5:	83 c4 20             	add    $0x20,%esp
c00041c8:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00041ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041d1:	01 d0                	add    %edx,%eax
c00041d3:	0f b6 10             	movzbl (%eax),%edx
c00041d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00041d9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00041de:	89 c1                	mov    %eax,%ecx
c00041e0:	d3 e3                	shl    %cl,%ebx
c00041e2:	89 d8                	mov    %ebx,%eax
c00041e4:	89 c3                	mov    %eax,%ebx
c00041e6:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c00041ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041ef:	01 c8                	add    %ecx,%eax
c00041f1:	21 da                	and    %ebx,%edx
c00041f3:	88 10                	mov    %dl,(%eax)
c00041f5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041fa:	83 ec 0c             	sub    $0xc,%esp
c00041fd:	6a 0a                	push   $0xa
c00041ff:	68 00 02 00 00       	push   $0x200
c0004204:	50                   	push   %eax
c0004205:	ff 75 b8             	pushl  -0x48(%ebp)
c0004208:	ff 75 ec             	pushl  -0x14(%ebp)
c000420b:	e8 43 e9 ff ff       	call   c0002b53 <rd_wt>
c0004210:	83 c4 20             	add    $0x20,%esp
c0004213:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c000421a:	00 00 00 
c000421d:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0004224:	00 00 00 
c0004227:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c000422e:	00 00 00 
c0004231:	83 ec 0c             	sub    $0xc,%esp
c0004234:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000423a:	50                   	push   %eax
c000423b:	e8 f4 04 00 00       	call   c0004734 <sync_inode>
c0004240:	83 c4 10             	add    $0x10,%esp
c0004243:	83 ec 0c             	sub    $0xc,%esp
c0004246:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000424c:	50                   	push   %eax
c000424d:	e8 36 06 00 00       	call   c0004888 <put_inode>
c0004252:	83 c4 10             	add    $0x10,%esp
c0004255:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004258:	8b 00                	mov    (%eax),%eax
c000425a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000425d:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c0004264:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004267:	8b 40 04             	mov    0x4(%eax),%eax
c000426a:	89 45 94             	mov    %eax,-0x6c(%ebp)
c000426d:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004270:	8b 40 0c             	mov    0xc(%eax),%eax
c0004273:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004276:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004279:	c1 e8 04             	shr    $0x4,%eax
c000427c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c000427f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004286:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000428d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004294:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000429b:	e9 a5 00 00 00       	jmp    c0004345 <do_unlink+0x47f>
c00042a0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00042a5:	89 c1                	mov    %eax,%ecx
c00042a7:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00042aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042ad:	01 d0                	add    %edx,%eax
c00042af:	83 ec 0c             	sub    $0xc,%esp
c00042b2:	6a 07                	push   $0x7
c00042b4:	68 00 02 00 00       	push   $0x200
c00042b9:	51                   	push   %ecx
c00042ba:	ff 75 b8             	pushl  -0x48(%ebp)
c00042bd:	50                   	push   %eax
c00042be:	e8 90 e8 ff ff       	call   c0002b53 <rd_wt>
c00042c3:	83 c4 20             	add    $0x20,%esp
c00042c6:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00042cb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00042ce:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00042d5:	eb 51                	jmp    c0004328 <do_unlink+0x462>
c00042d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00042db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00042de:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00042e1:	7f 4f                	jg     c0004332 <do_unlink+0x46c>
c00042e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00042e6:	83 c0 10             	add    $0x10,%eax
c00042e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00042ec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00042ef:	83 c0 04             	add    $0x4,%eax
c00042f2:	83 ec 08             	sub    $0x8,%esp
c00042f5:	ff 75 08             	pushl  0x8(%ebp)
c00042f8:	50                   	push   %eax
c00042f9:	e8 95 5f 00 00       	call   c000a293 <strcmp>
c00042fe:	83 c4 10             	add    $0x10,%esp
c0004301:	85 c0                	test   %eax,%eax
c0004303:	75 1b                	jne    c0004320 <do_unlink+0x45a>
c0004305:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000430c:	83 ec 04             	sub    $0x4,%esp
c000430f:	6a 10                	push   $0x10
c0004311:	6a 00                	push   $0x0
c0004313:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004316:	e8 10 78 00 00       	call   c000bb2b <Memset>
c000431b:	83 c4 10             	add    $0x10,%esp
c000431e:	eb 13                	jmp    c0004333 <do_unlink+0x46d>
c0004320:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0004324:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0004328:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000432b:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000432e:	7c a7                	jl     c00042d7 <do_unlink+0x411>
c0004330:	eb 01                	jmp    c0004333 <do_unlink+0x46d>
c0004332:	90                   	nop
c0004333:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004336:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004339:	7f 16                	jg     c0004351 <do_unlink+0x48b>
c000433b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000433f:	75 10                	jne    c0004351 <do_unlink+0x48b>
c0004341:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0004345:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004348:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000434b:	0f 8c 4f ff ff ff    	jl     c00042a0 <do_unlink+0x3da>
c0004351:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004354:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004357:	75 17                	jne    c0004370 <do_unlink+0x4aa>
c0004359:	8b 45 98             	mov    -0x68(%ebp),%eax
c000435c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000435f:	89 50 04             	mov    %edx,0x4(%eax)
c0004362:	83 ec 0c             	sub    $0xc,%esp
c0004365:	ff 75 98             	pushl  -0x68(%ebp)
c0004368:	e8 c7 03 00 00       	call   c0004734 <sync_inode>
c000436d:	83 c4 10             	add    $0x10,%esp
c0004370:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004374:	74 26                	je     c000439c <do_unlink+0x4d6>
c0004376:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000437b:	89 c1                	mov    %eax,%ecx
c000437d:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004380:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004383:	01 d0                	add    %edx,%eax
c0004385:	83 ec 0c             	sub    $0xc,%esp
c0004388:	6a 0a                	push   $0xa
c000438a:	68 00 02 00 00       	push   $0x200
c000438f:	51                   	push   %ecx
c0004390:	ff 75 b8             	pushl  -0x48(%ebp)
c0004393:	50                   	push   %eax
c0004394:	e8 ba e7 ff ff       	call   c0002b53 <rd_wt>
c0004399:	83 c4 20             	add    $0x20,%esp
c000439c:	90                   	nop
c000439d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00043a0:	c9                   	leave  
c00043a1:	c3                   	ret    

c00043a2 <do_rdwt>:
c00043a2:	55                   	push   %ebp
c00043a3:	89 e5                	mov    %esp,%ebp
c00043a5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00043ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00043ae:	8b 40 68             	mov    0x68(%eax),%eax
c00043b1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00043b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00043b7:	8b 40 50             	mov    0x50(%eax),%eax
c00043ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00043bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00043c0:	8b 40 5c             	mov    0x5c(%eax),%eax
c00043c3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00043c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043c9:	8b 00                	mov    (%eax),%eax
c00043cb:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00043ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00043d1:	8b 40 10             	mov    0x10(%eax),%eax
c00043d4:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00043d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00043da:	8b 40 40             	mov    0x40(%eax),%eax
c00043dd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00043e0:	83 ec 0c             	sub    $0xc,%esp
c00043e3:	ff 75 cc             	pushl  -0x34(%ebp)
c00043e6:	e8 42 0a 00 00       	call   c0004e2d <pid2proc>
c00043eb:	83 c4 10             	add    $0x10,%esp
c00043ee:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00043f1:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00043f4:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c00043f7:	83 c2 50             	add    $0x50,%edx
c00043fa:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00043fe:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0004401:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004404:	8b 40 08             	mov    0x8(%eax),%eax
c0004407:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000440a:	8b 45 08             	mov    0x8(%ebp),%eax
c000440d:	8b 00                	mov    (%eax),%eax
c000440f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0004412:	83 ec 08             	sub    $0x8,%esp
c0004415:	ff 75 b8             	pushl  -0x48(%ebp)
c0004418:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c000441e:	50                   	push   %eax
c000441f:	e8 0d f2 ff ff       	call   c0003631 <get_inode>
c0004424:	83 c4 10             	add    $0x10,%esp
c0004427:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000442a:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c000442e:	75 10                	jne    c0004440 <do_rdwt+0x9e>
c0004430:	83 ec 0c             	sub    $0xc,%esp
c0004433:	68 98 b2 00 c0       	push   $0xc000b298
c0004438:	e8 6c 52 00 00       	call   c00096a9 <panic>
c000443d:	83 c4 10             	add    $0x10,%esp
c0004440:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004446:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004449:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000444c:	8b 40 04             	mov    0x4(%eax),%eax
c000444f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004452:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004456:	74 22                	je     c000447a <do_rdwt+0xd8>
c0004458:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000445c:	74 1c                	je     c000447a <do_rdwt+0xd8>
c000445e:	68 9b 04 00 00       	push   $0x49b
c0004463:	68 04 b1 00 c0       	push   $0xc000b104
c0004468:	68 04 b1 00 c0       	push   $0xc000b104
c000446d:	68 a8 b2 00 c0       	push   $0xc000b2a8
c0004472:	e8 50 52 00 00       	call   c00096c7 <assertion_failure>
c0004477:	83 c4 10             	add    $0x10,%esp
c000447a:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0004480:	83 f8 01             	cmp    $0x1,%eax
c0004483:	0f 85 86 00 00 00    	jne    c000450f <do_rdwt+0x16d>
c0004489:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000448d:	75 09                	jne    c0004498 <do_rdwt+0xf6>
c000448f:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c0004496:	eb 0d                	jmp    c00044a5 <do_rdwt+0x103>
c0004498:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c000449c:	75 07                	jne    c00044a5 <do_rdwt+0x103>
c000449e:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c00044a5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00044a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00044ab:	89 50 68             	mov    %edx,0x68(%eax)
c00044ae:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c00044b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00044b4:	89 50 58             	mov    %edx,0x58(%eax)
c00044b7:	83 ec 04             	sub    $0x4,%esp
c00044ba:	6a 04                	push   $0x4
c00044bc:	ff 75 08             	pushl  0x8(%ebp)
c00044bf:	6a 03                	push   $0x3
c00044c1:	e8 71 5a 00 00       	call   c0009f37 <send_rec>
c00044c6:	83 c4 10             	add    $0x10,%esp
c00044c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00044cc:	8b 40 68             	mov    0x68(%eax),%eax
c00044cf:	83 f8 66             	cmp    $0x66,%eax
c00044d2:	75 13                	jne    c00044e7 <do_rdwt+0x145>
c00044d4:	83 ec 04             	sub    $0x4,%esp
c00044d7:	ff 75 b4             	pushl  -0x4c(%ebp)
c00044da:	ff 75 08             	pushl  0x8(%ebp)
c00044dd:	6a 01                	push   $0x1
c00044df:	e8 53 5a 00 00       	call   c0009f37 <send_rec>
c00044e4:	83 c4 10             	add    $0x10,%esp
c00044e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00044ea:	8b 40 68             	mov    0x68(%eax),%eax
c00044ed:	83 f8 65             	cmp    $0x65,%eax
c00044f0:	75 13                	jne    c0004505 <do_rdwt+0x163>
c00044f2:	83 ec 04             	sub    $0x4,%esp
c00044f5:	ff 75 b4             	pushl  -0x4c(%ebp)
c00044f8:	ff 75 08             	pushl  0x8(%ebp)
c00044fb:	6a 01                	push   $0x1
c00044fd:	e8 35 5a 00 00       	call   c0009f37 <send_rec>
c0004502:	83 c4 10             	add    $0x10,%esp
c0004505:	b8 00 00 00 00       	mov    $0x0,%eax
c000450a:	e9 23 02 00 00       	jmp    c0004732 <do_rdwt+0x390>
c000450f:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004513:	75 18                	jne    c000452d <do_rdwt+0x18b>
c0004515:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000451b:	c1 e0 09             	shl    $0x9,%eax
c000451e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0004521:	75 0a                	jne    c000452d <do_rdwt+0x18b>
c0004523:	b8 00 00 00 00       	mov    $0x0,%eax
c0004528:	e9 05 02 00 00       	jmp    c0004732 <do_rdwt+0x390>
c000452d:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004531:	75 1b                	jne    c000454e <do_rdwt+0x1ac>
c0004533:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000453a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000453d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004540:	01 d0                	add    %edx,%eax
c0004542:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004545:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c0004549:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000454c:	eb 19                	jmp    c0004567 <do_rdwt+0x1c5>
c000454e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004551:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004554:	01 c2                	add    %eax,%edx
c0004556:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000455c:	c1 e0 09             	shl    $0x9,%eax
c000455f:	39 c2                	cmp    %eax,%edx
c0004561:	0f 4e c2             	cmovle %edx,%eax
c0004564:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004567:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000456a:	99                   	cltd   
c000456b:	c1 ea 17             	shr    $0x17,%edx
c000456e:	01 d0                	add    %edx,%eax
c0004570:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004575:	29 d0                	sub    %edx,%eax
c0004577:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000457a:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0004580:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004583:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004589:	85 c0                	test   %eax,%eax
c000458b:	0f 48 c1             	cmovs  %ecx,%eax
c000458e:	c1 f8 09             	sar    $0x9,%eax
c0004591:	01 d0                	add    %edx,%eax
c0004593:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004596:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000459c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000459f:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00045a5:	85 c0                	test   %eax,%eax
c00045a7:	0f 48 c1             	cmovs  %ecx,%eax
c00045aa:	c1 f8 09             	sar    $0x9,%eax
c00045ad:	01 d0                	add    %edx,%eax
c00045af:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00045b2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00045b5:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00045b8:	ba 00 00 10 00       	mov    $0x100000,%edx
c00045bd:	39 d0                	cmp    %edx,%eax
c00045bf:	7d 0b                	jge    c00045cc <do_rdwt+0x22a>
c00045c1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00045c4:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00045c7:	83 c0 01             	add    $0x1,%eax
c00045ca:	eb 05                	jmp    c00045d1 <do_rdwt+0x22f>
c00045cc:	b8 00 00 10 00       	mov    $0x100000,%eax
c00045d1:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00045d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00045da:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00045e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00045e4:	8b 00                	mov    (%eax),%eax
c00045e6:	83 ec 0c             	sub    $0xc,%esp
c00045e9:	50                   	push   %eax
c00045ea:	e8 3e 08 00 00       	call   c0004e2d <pid2proc>
c00045ef:	83 c4 10             	add    $0x10,%esp
c00045f2:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00045f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045f8:	83 ec 08             	sub    $0x8,%esp
c00045fb:	50                   	push   %eax
c00045fc:	ff 75 c8             	pushl  -0x38(%ebp)
c00045ff:	e8 53 2b 00 00       	call   c0007157 <alloc_virtual_memory>
c0004604:	83 c4 10             	add    $0x10,%esp
c0004607:	89 45 98             	mov    %eax,-0x68(%ebp)
c000460a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000460d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004610:	e9 c5 00 00 00       	jmp    c00046da <do_rdwt+0x338>
c0004615:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004618:	c1 e0 09             	shl    $0x9,%eax
c000461b:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000461e:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0004621:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c0004625:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004628:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c000462f:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004633:	75 46                	jne    c000467b <do_rdwt+0x2d9>
c0004635:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004638:	c1 e0 09             	shl    $0x9,%eax
c000463b:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004641:	83 ec 0c             	sub    $0xc,%esp
c0004644:	6a 07                	push   $0x7
c0004646:	50                   	push   %eax
c0004647:	52                   	push   %edx
c0004648:	ff 75 90             	pushl  -0x70(%ebp)
c000464b:	ff 75 dc             	pushl  -0x24(%ebp)
c000464e:	e8 00 e5 ff ff       	call   c0002b53 <rd_wt>
c0004653:	83 c4 20             	add    $0x20,%esp
c0004656:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000465c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000465f:	01 d0                	add    %edx,%eax
c0004661:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004664:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004667:	01 ca                	add    %ecx,%edx
c0004669:	83 ec 04             	sub    $0x4,%esp
c000466c:	ff 75 94             	pushl  -0x6c(%ebp)
c000466f:	50                   	push   %eax
c0004670:	52                   	push   %edx
c0004671:	e8 92 35 00 00       	call   c0007c08 <Memcpy>
c0004676:	83 c4 10             	add    $0x10,%esp
c0004679:	eb 46                	jmp    c00046c1 <do_rdwt+0x31f>
c000467b:	8b 55 98             	mov    -0x68(%ebp),%edx
c000467e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004681:	01 d0                	add    %edx,%eax
c0004683:	89 c1                	mov    %eax,%ecx
c0004685:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000468b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000468e:	01 d0                	add    %edx,%eax
c0004690:	83 ec 04             	sub    $0x4,%esp
c0004693:	ff 75 94             	pushl  -0x6c(%ebp)
c0004696:	51                   	push   %ecx
c0004697:	50                   	push   %eax
c0004698:	e8 6b 35 00 00       	call   c0007c08 <Memcpy>
c000469d:	83 c4 10             	add    $0x10,%esp
c00046a0:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046a3:	c1 e0 09             	shl    $0x9,%eax
c00046a6:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00046ac:	83 ec 0c             	sub    $0xc,%esp
c00046af:	6a 0a                	push   $0xa
c00046b1:	50                   	push   %eax
c00046b2:	52                   	push   %edx
c00046b3:	ff 75 90             	pushl  -0x70(%ebp)
c00046b6:	ff 75 dc             	pushl  -0x24(%ebp)
c00046b9:	e8 95 e4 ff ff       	call   c0002b53 <rd_wt>
c00046be:	83 c4 20             	add    $0x20,%esp
c00046c1:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00046c4:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c00046c7:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00046ca:	01 45 e0             	add    %eax,-0x20(%ebp)
c00046cd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00046d4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046d7:	01 45 dc             	add    %eax,-0x24(%ebp)
c00046da:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046dd:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c00046e0:	7f 0a                	jg     c00046ec <do_rdwt+0x34a>
c00046e2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00046e6:	0f 85 29 ff ff ff    	jne    c0004615 <do_rdwt+0x273>
c00046ec:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00046ef:	8b 50 04             	mov    0x4(%eax),%edx
c00046f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00046f5:	01 c2                	add    %eax,%edx
c00046f7:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00046fa:	89 50 04             	mov    %edx,0x4(%eax)
c00046fd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004700:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004703:	01 c2                	add    %eax,%edx
c0004705:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c000470b:	39 c2                	cmp    %eax,%edx
c000470d:	7e 20                	jle    c000472f <do_rdwt+0x38d>
c000470f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004712:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004715:	01 d0                	add    %edx,%eax
c0004717:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c000471d:	83 ec 0c             	sub    $0xc,%esp
c0004720:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004726:	50                   	push   %eax
c0004727:	e8 08 00 00 00       	call   c0004734 <sync_inode>
c000472c:	83 c4 10             	add    $0x10,%esp
c000472f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004732:	c9                   	leave  
c0004733:	c3                   	ret    

c0004734 <sync_inode>:
c0004734:	55                   	push   %ebp
c0004735:	89 e5                	mov    %esp,%ebp
c0004737:	53                   	push   %ebx
c0004738:	83 ec 34             	sub    $0x34,%esp
c000473b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004742:	eb 74                	jmp    c00047b8 <sync_inode+0x84>
c0004744:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004747:	89 d0                	mov    %edx,%eax
c0004749:	c1 e0 02             	shl    $0x2,%eax
c000474c:	01 d0                	add    %edx,%eax
c000474e:	c1 e0 03             	shl    $0x3,%eax
c0004751:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0004756:	8b 10                	mov    (%eax),%edx
c0004758:	8b 45 08             	mov    0x8(%ebp),%eax
c000475b:	8b 40 10             	mov    0x10(%eax),%eax
c000475e:	39 c2                	cmp    %eax,%edx
c0004760:	75 52                	jne    c00047b4 <sync_inode+0x80>
c0004762:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004765:	89 d0                	mov    %edx,%eax
c0004767:	c1 e0 02             	shl    $0x2,%eax
c000476a:	01 d0                	add    %edx,%eax
c000476c:	c1 e0 03             	shl    $0x3,%eax
c000476f:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c0004775:	8b 45 08             	mov    0x8(%ebp),%eax
c0004778:	8b 08                	mov    (%eax),%ecx
c000477a:	89 0a                	mov    %ecx,(%edx)
c000477c:	8b 48 04             	mov    0x4(%eax),%ecx
c000477f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004782:	8b 48 08             	mov    0x8(%eax),%ecx
c0004785:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004788:	8b 48 0c             	mov    0xc(%eax),%ecx
c000478b:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000478e:	8b 48 10             	mov    0x10(%eax),%ecx
c0004791:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004794:	8b 48 14             	mov    0x14(%eax),%ecx
c0004797:	89 4a 14             	mov    %ecx,0x14(%edx)
c000479a:	8b 48 18             	mov    0x18(%eax),%ecx
c000479d:	89 4a 18             	mov    %ecx,0x18(%edx)
c00047a0:	8b 48 1c             	mov    0x1c(%eax),%ecx
c00047a3:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c00047a6:	8b 48 20             	mov    0x20(%eax),%ecx
c00047a9:	89 4a 20             	mov    %ecx,0x20(%edx)
c00047ac:	8b 40 24             	mov    0x24(%eax),%eax
c00047af:	89 42 24             	mov    %eax,0x24(%edx)
c00047b2:	eb 0a                	jmp    c00047be <sync_inode+0x8a>
c00047b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00047b8:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00047bc:	7e 86                	jle    c0004744 <sync_inode+0x10>
c00047be:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c00047c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00047c8:	8b 40 10             	mov    0x10(%eax),%eax
c00047cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00047ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00047d1:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00047d4:	b8 00 02 00 00       	mov    $0x200,%eax
c00047d9:	99                   	cltd   
c00047da:	f7 7d f0             	idivl  -0x10(%ebp)
c00047dd:	89 c3                	mov    %eax,%ebx
c00047df:	89 c8                	mov    %ecx,%eax
c00047e1:	99                   	cltd   
c00047e2:	f7 fb                	idiv   %ebx
c00047e4:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00047e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00047ea:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00047ed:	b8 00 02 00 00       	mov    $0x200,%eax
c00047f2:	99                   	cltd   
c00047f3:	f7 7d f0             	idivl  -0x10(%ebp)
c00047f6:	89 c3                	mov    %eax,%ebx
c00047f8:	89 c8                	mov    %ecx,%eax
c00047fa:	99                   	cltd   
c00047fb:	f7 fb                	idiv   %ebx
c00047fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004800:	8b 45 08             	mov    0x8(%ebp),%eax
c0004803:	8b 40 20             	mov    0x20(%eax),%eax
c0004806:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004809:	e8 0a 01 00 00       	call   c0004918 <get_super_block>
c000480e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004811:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004814:	8b 40 04             	mov    0x4(%eax),%eax
c0004817:	8d 50 02             	lea    0x2(%eax),%edx
c000481a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000481d:	8b 40 08             	mov    0x8(%eax),%eax
c0004820:	01 c2                	add    %eax,%edx
c0004822:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004825:	01 d0                	add    %edx,%eax
c0004827:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000482a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000482f:	83 ec 0c             	sub    $0xc,%esp
c0004832:	6a 07                	push   $0x7
c0004834:	68 00 02 00 00       	push   $0x200
c0004839:	50                   	push   %eax
c000483a:	ff 75 e0             	pushl  -0x20(%ebp)
c000483d:	ff 75 d8             	pushl  -0x28(%ebp)
c0004840:	e8 0e e3 ff ff       	call   c0002b53 <rd_wt>
c0004845:	83 c4 20             	add    $0x20,%esp
c0004848:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000484d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004850:	83 ec 04             	sub    $0x4,%esp
c0004853:	ff 75 f0             	pushl  -0x10(%ebp)
c0004856:	ff 75 08             	pushl  0x8(%ebp)
c0004859:	ff 75 d4             	pushl  -0x2c(%ebp)
c000485c:	e8 a7 33 00 00       	call   c0007c08 <Memcpy>
c0004861:	83 c4 10             	add    $0x10,%esp
c0004864:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004869:	83 ec 0c             	sub    $0xc,%esp
c000486c:	6a 0a                	push   $0xa
c000486e:	68 00 02 00 00       	push   $0x200
c0004873:	50                   	push   %eax
c0004874:	ff 75 e0             	pushl  -0x20(%ebp)
c0004877:	ff 75 d8             	pushl  -0x28(%ebp)
c000487a:	e8 d4 e2 ff ff       	call   c0002b53 <rd_wt>
c000487f:	83 c4 20             	add    $0x20,%esp
c0004882:	90                   	nop
c0004883:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004886:	c9                   	leave  
c0004887:	c3                   	ret    

c0004888 <put_inode>:
c0004888:	55                   	push   %ebp
c0004889:	89 e5                	mov    %esp,%ebp
c000488b:	83 ec 08             	sub    $0x8,%esp
c000488e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004891:	8b 40 24             	mov    0x24(%eax),%eax
c0004894:	85 c0                	test   %eax,%eax
c0004896:	7f 1c                	jg     c00048b4 <put_inode+0x2c>
c0004898:	68 3f 05 00 00       	push   $0x53f
c000489d:	68 04 b1 00 c0       	push   $0xc000b104
c00048a2:	68 04 b1 00 c0       	push   $0xc000b104
c00048a7:	68 dc b2 00 c0       	push   $0xc000b2dc
c00048ac:	e8 16 4e 00 00       	call   c00096c7 <assertion_failure>
c00048b1:	83 c4 10             	add    $0x10,%esp
c00048b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00048b7:	8b 40 24             	mov    0x24(%eax),%eax
c00048ba:	8d 50 ff             	lea    -0x1(%eax),%edx
c00048bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00048c0:	89 50 24             	mov    %edx,0x24(%eax)
c00048c3:	90                   	nop
c00048c4:	c9                   	leave  
c00048c5:	c3                   	ret    

c00048c6 <do_close>:
c00048c6:	55                   	push   %ebp
c00048c7:	89 e5                	mov    %esp,%ebp
c00048c9:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00048ce:	8b 55 08             	mov    0x8(%ebp),%edx
c00048d1:	83 c2 50             	add    $0x50,%edx
c00048d4:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00048d8:	8b 50 0c             	mov    0xc(%eax),%edx
c00048db:	83 ea 01             	sub    $0x1,%edx
c00048de:	89 50 0c             	mov    %edx,0xc(%eax)
c00048e1:	8b 40 0c             	mov    0xc(%eax),%eax
c00048e4:	85 c0                	test   %eax,%eax
c00048e6:	75 16                	jne    c00048fe <do_close+0x38>
c00048e8:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00048ed:	8b 55 08             	mov    0x8(%ebp),%edx
c00048f0:	83 c2 50             	add    $0x50,%edx
c00048f3:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00048f7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00048fe:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004903:	8b 55 08             	mov    0x8(%ebp),%edx
c0004906:	83 c2 50             	add    $0x50,%edx
c0004909:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c0004910:	00 
c0004911:	b8 00 00 00 00       	mov    $0x0,%eax
c0004916:	5d                   	pop    %ebp
c0004917:	c3                   	ret    

c0004918 <get_super_block>:
c0004918:	55                   	push   %ebp
c0004919:	89 e5                	mov    %esp,%ebp
c000491b:	83 ec 08             	sub    $0x8,%esp
c000491e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004923:	83 ec 0c             	sub    $0xc,%esp
c0004926:	6a 07                	push   $0x7
c0004928:	68 00 02 00 00       	push   $0x200
c000492d:	50                   	push   %eax
c000492e:	6a 20                	push   $0x20
c0004930:	6a 01                	push   $0x1
c0004932:	e8 1c e2 ff ff       	call   c0002b53 <rd_wt>
c0004937:	83 c4 20             	add    $0x20,%esp
c000493a:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004940:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0004945:	8b 0a                	mov    (%edx),%ecx
c0004947:	89 08                	mov    %ecx,(%eax)
c0004949:	8b 4a 04             	mov    0x4(%edx),%ecx
c000494c:	89 48 04             	mov    %ecx,0x4(%eax)
c000494f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0004952:	89 48 08             	mov    %ecx,0x8(%eax)
c0004955:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004958:	89 48 0c             	mov    %ecx,0xc(%eax)
c000495b:	8b 4a 10             	mov    0x10(%edx),%ecx
c000495e:	89 48 10             	mov    %ecx,0x10(%eax)
c0004961:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004964:	89 48 14             	mov    %ecx,0x14(%eax)
c0004967:	8b 4a 18             	mov    0x18(%edx),%ecx
c000496a:	89 48 18             	mov    %ecx,0x18(%eax)
c000496d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0004970:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004973:	8b 52 20             	mov    0x20(%edx),%edx
c0004976:	89 50 20             	mov    %edx,0x20(%eax)
c0004979:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000497e:	c9                   	leave  
c000497f:	c3                   	ret    

c0004980 <check>:
c0004980:	55                   	push   %ebp
c0004981:	89 e5                	mov    %esp,%ebp
c0004983:	83 ec 10             	sub    $0x10,%esp
c0004986:	c7 45 fc 00 32 08 c0 	movl   $0xc0083200,-0x4(%ebp)
c000498d:	eb 2e                	jmp    c00049bd <check+0x3d>
c000498f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004992:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0004998:	85 c0                	test   %eax,%eax
c000499a:	74 1a                	je     c00049b6 <check+0x36>
c000499c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000499f:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00049a5:	83 f8 01             	cmp    $0x1,%eax
c00049a8:	74 0c                	je     c00049b6 <check+0x36>
c00049aa:	c7 05 a0 07 01 c0 02 	movl   $0x2802,0xc00107a0
c00049b1:	28 00 00 
c00049b4:	eb fe                	jmp    c00049b4 <check+0x34>
c00049b6:	81 45 fc b4 02 00 00 	addl   $0x2b4,-0x4(%ebp)
c00049bd:	b8 d0 3c 08 c0       	mov    $0xc0083cd0,%eax
c00049c2:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c00049c5:	72 c8                	jb     c000498f <check+0xf>
c00049c7:	90                   	nop
c00049c8:	c9                   	leave  
c00049c9:	c3                   	ret    

c00049ca <schedule_process>:
c00049ca:	55                   	push   %ebp
c00049cb:	89 e5                	mov    %esp,%ebp
c00049cd:	83 ec 38             	sub    $0x38,%esp
c00049d0:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c00049d7:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c00049de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00049e5:	e8 a6 ce ff ff       	call   c0001890 <get_running_thread_pcb>
c00049ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00049ed:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c00049f2:	85 c0                	test   %eax,%eax
c00049f4:	74 2a                	je     c0004a20 <schedule_process+0x56>
c00049f6:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c00049fb:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a02:	84 c0                	test   %al,%al
c0004a04:	75 1a                	jne    c0004a20 <schedule_process+0x56>
c0004a06:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004a0b:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004a11:	85 c0                	test   %eax,%eax
c0004a13:	74 0b                	je     c0004a20 <schedule_process+0x56>
c0004a15:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a18:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a1b:	e9 2e 03 00 00       	jmp    c0004d4e <schedule_process+0x384>
c0004a20:	83 ec 0c             	sub    $0xc,%esp
c0004a23:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a28:	e8 d6 5f 00 00       	call   c000aa03 <isListEmpty>
c0004a2d:	83 c4 10             	add    $0x10,%esp
c0004a30:	3c 01                	cmp    $0x1,%al
c0004a32:	0f 85 16 01 00 00    	jne    c0004b4e <schedule_process+0x184>
c0004a38:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a3b:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004a41:	85 c0                	test   %eax,%eax
c0004a43:	75 24                	jne    c0004a69 <schedule_process+0x9f>
c0004a45:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a48:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a4e:	05 00 01 00 00       	add    $0x100,%eax
c0004a53:	83 ec 08             	sub    $0x8,%esp
c0004a56:	50                   	push   %eax
c0004a57:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a5c:	e8 9f 60 00 00       	call   c000ab00 <appendToDoubleLinkList>
c0004a61:	83 c4 10             	add    $0x10,%esp
c0004a64:	e9 75 02 00 00       	jmp    c0004cde <schedule_process+0x314>
c0004a69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a6c:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a73:	84 c0                	test   %al,%al
c0004a75:	0f 85 63 02 00 00    	jne    c0004cde <schedule_process+0x314>
c0004a7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a7e:	05 00 01 00 00       	add    $0x100,%eax
c0004a83:	83 ec 08             	sub    $0x8,%esp
c0004a86:	50                   	push   %eax
c0004a87:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a8c:	e8 6f 60 00 00       	call   c000ab00 <appendToDoubleLinkList>
c0004a91:	83 c4 10             	add    $0x10,%esp
c0004a94:	83 ec 0c             	sub    $0xc,%esp
c0004a97:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a9c:	e8 c9 61 00 00       	call   c000ac6a <popFromDoubleLinkList>
c0004aa1:	83 c4 10             	add    $0x10,%esp
c0004aa4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004aa7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004aaa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004aaf:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004ab2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0004ab6:	0f 84 22 02 00 00    	je     c0004cde <schedule_process+0x314>
c0004abc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004abf:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004ac5:	85 c0                	test   %eax,%eax
c0004ac7:	75 70                	jne    c0004b39 <schedule_process+0x16f>
c0004ac9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004acc:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004ad3:	83 ec 0c             	sub    $0xc,%esp
c0004ad6:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004adb:	e8 23 5f 00 00       	call   c000aa03 <isListEmpty>
c0004ae0:	83 c4 10             	add    $0x10,%esp
c0004ae3:	84 c0                	test   %al,%al
c0004ae5:	75 3d                	jne    c0004b24 <schedule_process+0x15a>
c0004ae7:	83 ec 0c             	sub    $0xc,%esp
c0004aea:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004aef:	e8 76 61 00 00       	call   c000ac6a <popFromDoubleLinkList>
c0004af4:	83 c4 10             	add    $0x10,%esp
c0004af7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004afa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004afd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004b02:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004b05:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0004b09:	0f 84 cf 01 00 00    	je     c0004cde <schedule_process+0x314>
c0004b0f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b12:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b18:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b1f:	e9 ba 01 00 00       	jmp    c0004cde <schedule_process+0x314>
c0004b24:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b2d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b34:	e9 a5 01 00 00       	jmp    c0004cde <schedule_process+0x314>
c0004b39:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b42:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b49:	e9 90 01 00 00       	jmp    c0004cde <schedule_process+0x314>
c0004b4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b51:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004b58:	84 c0                	test   %al,%al
c0004b5a:	0f 85 d3 00 00 00    	jne    c0004c33 <schedule_process+0x269>
c0004b60:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b63:	05 00 01 00 00       	add    $0x100,%eax
c0004b68:	83 ec 08             	sub    $0x8,%esp
c0004b6b:	50                   	push   %eax
c0004b6c:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b71:	e8 8a 5f 00 00       	call   c000ab00 <appendToDoubleLinkList>
c0004b76:	83 c4 10             	add    $0x10,%esp
c0004b79:	83 ec 0c             	sub    $0xc,%esp
c0004b7c:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b81:	e8 e4 60 00 00       	call   c000ac6a <popFromDoubleLinkList>
c0004b86:	83 c4 10             	add    $0x10,%esp
c0004b89:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004b8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004b8f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004b94:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004b97:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0004b9b:	0f 84 3d 01 00 00    	je     c0004cde <schedule_process+0x314>
c0004ba1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004ba4:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004baa:	85 c0                	test   %eax,%eax
c0004bac:	75 70                	jne    c0004c1e <schedule_process+0x254>
c0004bae:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004bb1:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004bb8:	83 ec 0c             	sub    $0xc,%esp
c0004bbb:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004bc0:	e8 3e 5e 00 00       	call   c000aa03 <isListEmpty>
c0004bc5:	83 c4 10             	add    $0x10,%esp
c0004bc8:	84 c0                	test   %al,%al
c0004bca:	75 3d                	jne    c0004c09 <schedule_process+0x23f>
c0004bcc:	83 ec 0c             	sub    $0xc,%esp
c0004bcf:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004bd4:	e8 91 60 00 00       	call   c000ac6a <popFromDoubleLinkList>
c0004bd9:	83 c4 10             	add    $0x10,%esp
c0004bdc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004bdf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004be2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004be7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004bea:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0004bee:	0f 84 ea 00 00 00    	je     c0004cde <schedule_process+0x314>
c0004bf4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004bf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004bfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004bfd:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c04:	e9 d5 00 00 00       	jmp    c0004cde <schedule_process+0x314>
c0004c09:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c12:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c19:	e9 c0 00 00 00       	jmp    c0004cde <schedule_process+0x314>
c0004c1e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c21:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c27:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c2e:	e9 ab 00 00 00       	jmp    c0004cde <schedule_process+0x314>
c0004c33:	83 ec 0c             	sub    $0xc,%esp
c0004c36:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c3b:	e8 2a 60 00 00       	call   c000ac6a <popFromDoubleLinkList>
c0004c40:	83 c4 10             	add    $0x10,%esp
c0004c43:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004c46:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004c49:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004c4e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004c51:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004c55:	0f 84 83 00 00 00    	je     c0004cde <schedule_process+0x314>
c0004c5b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004c5e:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004c64:	85 c0                	test   %eax,%eax
c0004c66:	75 66                	jne    c0004cce <schedule_process+0x304>
c0004c68:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004c6b:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004c72:	83 ec 0c             	sub    $0xc,%esp
c0004c75:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c7a:	e8 84 5d 00 00       	call   c000aa03 <isListEmpty>
c0004c7f:	83 c4 10             	add    $0x10,%esp
c0004c82:	84 c0                	test   %al,%al
c0004c84:	75 36                	jne    c0004cbc <schedule_process+0x2f2>
c0004c86:	83 ec 0c             	sub    $0xc,%esp
c0004c89:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c8e:	e8 d7 5f 00 00       	call   c000ac6a <popFromDoubleLinkList>
c0004c93:	83 c4 10             	add    $0x10,%esp
c0004c96:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004c99:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004c9c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004ca1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004ca4:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004ca8:	74 34                	je     c0004cde <schedule_process+0x314>
c0004caa:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cb3:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004cba:	eb 22                	jmp    c0004cde <schedule_process+0x314>
c0004cbc:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cc5:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004ccc:	eb 10                	jmp    c0004cde <schedule_process+0x314>
c0004cce:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cd1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cd7:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004cde:	0f b6 05 f0 1e 01 c0 	movzbl 0xc0011ef0,%eax
c0004ce5:	84 c0                	test   %al,%al
c0004ce7:	75 1b                	jne    c0004d04 <schedule_process+0x33a>
c0004ce9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004ced:	74 15                	je     c0004d04 <schedule_process+0x33a>
c0004cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cf2:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004cf8:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0004cfb:	77 07                	ja     c0004d04 <schedule_process+0x33a>
c0004cfd:	c6 05 f0 1e 01 c0 01 	movb   $0x1,0xc0011ef0
c0004d04:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d08:	75 43                	jne    c0004d4d <schedule_process+0x383>
c0004d0a:	90                   	nop
c0004d0b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d0f:	74 28                	je     c0004d39 <schedule_process+0x36f>
c0004d11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d14:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d1a:	85 c0                	test   %eax,%eax
c0004d1c:	74 1b                	je     c0004d39 <schedule_process+0x36f>
c0004d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d21:	05 00 01 00 00       	add    $0x100,%eax
c0004d26:	83 ec 08             	sub    $0x8,%esp
c0004d29:	50                   	push   %eax
c0004d2a:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004d2f:	e8 cc 5d 00 00       	call   c000ab00 <appendToDoubleLinkList>
c0004d34:	83 c4 10             	add    $0x10,%esp
c0004d37:	eb 15                	jmp    c0004d4e <schedule_process+0x384>
c0004d39:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c0004d3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d44:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004d4b:	eb 01                	jmp    c0004d4e <schedule_process+0x384>
c0004d4d:	90                   	nop
c0004d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d51:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d57:	83 f8 06             	cmp    $0x6,%eax
c0004d5a:	75 10                	jne    c0004d6c <schedule_process+0x3a2>
c0004d5c:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%ebp)
c0004d63:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0004d66:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004d69:	66 87 db             	xchg   %bx,%bx
c0004d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d6f:	8b 40 08             	mov    0x8(%eax),%eax
c0004d72:	85 c0                	test   %eax,%eax
c0004d74:	74 28                	je     c0004d9e <schedule_process+0x3d4>
c0004d76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d79:	05 00 10 00 00       	add    $0x1000,%eax
c0004d7e:	83 ec 0c             	sub    $0xc,%esp
c0004d81:	50                   	push   %eax
c0004d82:	e8 fa ca ff ff       	call   c0001881 <update_tss>
c0004d87:	83 c4 10             	add    $0x10,%esp
c0004d8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d8d:	8b 40 08             	mov    0x8(%eax),%eax
c0004d90:	83 ec 0c             	sub    $0xc,%esp
c0004d93:	50                   	push   %eax
c0004d94:	e8 db ca ff ff       	call   c0001874 <update_cr3>
c0004d99:	83 c4 10             	add    $0x10,%esp
c0004d9c:	eb 0f                	jmp    c0004dad <schedule_process+0x3e3>
c0004d9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004da1:	83 ec 0c             	sub    $0xc,%esp
c0004da4:	50                   	push   %eax
c0004da5:	e8 ca ca ff ff       	call   c0001874 <update_cr3>
c0004daa:	83 c4 10             	add    $0x10,%esp
c0004dad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004db0:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004db5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004db8:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004dbe:	83 f8 06             	cmp    $0x6,%eax
c0004dc1:	83 ec 08             	sub    $0x8,%esp
c0004dc4:	ff 75 f4             	pushl  -0xc(%ebp)
c0004dc7:	ff 75 e8             	pushl  -0x18(%ebp)
c0004dca:	e8 f1 5b 00 00       	call   c000a9c0 <switch_to>
c0004dcf:	83 c4 10             	add    $0x10,%esp
c0004dd2:	90                   	nop
c0004dd3:	c9                   	leave  
c0004dd4:	c3                   	ret    

c0004dd5 <clock_handler>:
c0004dd5:	55                   	push   %ebp
c0004dd6:	89 e5                	mov    %esp,%ebp
c0004dd8:	83 ec 18             	sub    $0x18,%esp
c0004ddb:	e8 b0 ca ff ff       	call   c0001890 <get_running_thread_pcb>
c0004de0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004de3:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c0004de8:	85 c0                	test   %eax,%eax
c0004dea:	74 0d                	je     c0004df9 <clock_handler+0x24>
c0004dec:	83 ec 0c             	sub    $0xc,%esp
c0004def:	6a 04                	push   $0x4
c0004df1:	e8 d0 53 00 00       	call   c000a1c6 <inform_int>
c0004df6:	83 c4 10             	add    $0x10,%esp
c0004df9:	e8 cc fb ff ff       	call   c00049ca <schedule_process>
c0004dfe:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e03:	85 c0                	test   %eax,%eax
c0004e05:	74 23                	je     c0004e2a <clock_handler+0x55>
c0004e07:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e0c:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004e12:	85 c0                	test   %eax,%eax
c0004e14:	74 14                	je     c0004e2a <clock_handler+0x55>
c0004e16:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e1b:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c0004e21:	83 ea 01             	sub    $0x1,%edx
c0004e24:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c0004e2a:	90                   	nop
c0004e2b:	c9                   	leave  
c0004e2c:	c3                   	ret    

c0004e2d <pid2proc>:
c0004e2d:	55                   	push   %ebp
c0004e2e:	89 e5                	mov    %esp,%ebp
c0004e30:	83 ec 20             	sub    $0x20,%esp
c0004e33:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004e3a:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c0004e3f:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c0004e45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004e48:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004e4b:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c0004e50:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c0004e56:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004e59:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004e5c:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0004e61:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004e64:	eb 29                	jmp    c0004e8f <pid2proc+0x62>
c0004e66:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004e69:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004e6e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004e71:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004e74:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004e7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e7d:	39 c2                	cmp    %eax,%edx
c0004e7f:	75 05                	jne    c0004e86 <pid2proc+0x59>
c0004e81:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004e84:	eb 17                	jmp    c0004e9d <pid2proc+0x70>
c0004e86:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004e89:	8b 40 04             	mov    0x4(%eax),%eax
c0004e8c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004e8f:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004e96:	75 ce                	jne    c0004e66 <pid2proc+0x39>
c0004e98:	b8 00 00 00 00       	mov    $0x0,%eax
c0004e9d:	c9                   	leave  
c0004e9e:	c3                   	ret    

c0004e9f <proc2pid>:
c0004e9f:	55                   	push   %ebp
c0004ea0:	89 e5                	mov    %esp,%ebp
c0004ea2:	83 ec 10             	sub    $0x10,%esp
c0004ea5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea8:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004eae:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004eb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004eb4:	c9                   	leave  
c0004eb5:	c3                   	ret    

c0004eb6 <InitDescriptor>:
c0004eb6:	55                   	push   %ebp
c0004eb7:	89 e5                	mov    %esp,%ebp
c0004eb9:	83 ec 04             	sub    $0x4,%esp
c0004ebc:	8b 45 14             	mov    0x14(%ebp),%eax
c0004ebf:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004ec3:	8b 45 10             	mov    0x10(%ebp),%eax
c0004ec6:	89 c2                	mov    %eax,%edx
c0004ec8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ecb:	66 89 10             	mov    %dx,(%eax)
c0004ece:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ed1:	89 c2                	mov    %eax,%edx
c0004ed3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ed6:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004eda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004edd:	c1 e8 10             	shr    $0x10,%eax
c0004ee0:	89 c2                	mov    %eax,%edx
c0004ee2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ee5:	88 50 04             	mov    %dl,0x4(%eax)
c0004ee8:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004eec:	89 c2                	mov    %eax,%edx
c0004eee:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef1:	88 50 05             	mov    %dl,0x5(%eax)
c0004ef4:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ef8:	66 c1 e8 08          	shr    $0x8,%ax
c0004efc:	c1 e0 04             	shl    $0x4,%eax
c0004eff:	89 c2                	mov    %eax,%edx
c0004f01:	8b 45 10             	mov    0x10(%ebp),%eax
c0004f04:	c1 e8 10             	shr    $0x10,%eax
c0004f07:	83 e0 0f             	and    $0xf,%eax
c0004f0a:	09 c2                	or     %eax,%edx
c0004f0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f0f:	88 50 06             	mov    %dl,0x6(%eax)
c0004f12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f15:	c1 e8 18             	shr    $0x18,%eax
c0004f18:	89 c2                	mov    %eax,%edx
c0004f1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f1d:	88 50 07             	mov    %dl,0x7(%eax)
c0004f20:	90                   	nop
c0004f21:	c9                   	leave  
c0004f22:	c3                   	ret    

c0004f23 <Seg2PhyAddr>:
c0004f23:	55                   	push   %ebp
c0004f24:	89 e5                	mov    %esp,%ebp
c0004f26:	83 ec 10             	sub    $0x10,%esp
c0004f29:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f2c:	c1 e8 03             	shr    $0x3,%eax
c0004f2f:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c0004f36:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c0004f3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f40:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004f43:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004f47:	0f b7 c0             	movzwl %ax,%eax
c0004f4a:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004f4e:	0f b6 d2             	movzbl %dl,%edx
c0004f51:	c1 e2 10             	shl    $0x10,%edx
c0004f54:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004f5a:	09 d0                	or     %edx,%eax
c0004f5c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004f5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f62:	c9                   	leave  
c0004f63:	c3                   	ret    

c0004f64 <Seg2PhyAddrLDT>:
c0004f64:	55                   	push   %ebp
c0004f65:	89 e5                	mov    %esp,%ebp
c0004f67:	83 ec 10             	sub    $0x10,%esp
c0004f6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f6d:	c1 e8 03             	shr    $0x3,%eax
c0004f70:	89 c2                	mov    %eax,%edx
c0004f72:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f75:	83 c2 22             	add    $0x22,%edx
c0004f78:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004f7c:	8b 02                	mov    (%edx),%eax
c0004f7e:	8b 52 04             	mov    0x4(%edx),%edx
c0004f81:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f84:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004f87:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004f8b:	0f b7 c0             	movzwl %ax,%eax
c0004f8e:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004f92:	0f b6 d2             	movzbl %dl,%edx
c0004f95:	c1 e2 10             	shl    $0x10,%edx
c0004f98:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004f9e:	09 d0                	or     %edx,%eax
c0004fa0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004fa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004fa6:	c9                   	leave  
c0004fa7:	c3                   	ret    

c0004fa8 <VirAddr2PhyAddr>:
c0004fa8:	55                   	push   %ebp
c0004fa9:	89 e5                	mov    %esp,%ebp
c0004fab:	83 ec 10             	sub    $0x10,%esp
c0004fae:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004fb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb4:	01 d0                	add    %edx,%eax
c0004fb6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004fb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004fbc:	c9                   	leave  
c0004fbd:	c3                   	ret    

c0004fbe <v2l>:
c0004fbe:	55                   	push   %ebp
c0004fbf:	89 e5                	mov    %esp,%ebp
c0004fc1:	83 ec 18             	sub    $0x18,%esp
c0004fc4:	83 ec 0c             	sub    $0xc,%esp
c0004fc7:	ff 75 08             	pushl  0x8(%ebp)
c0004fca:	e8 5e fe ff ff       	call   c0004e2d <pid2proc>
c0004fcf:	83 c4 10             	add    $0x10,%esp
c0004fd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004fd5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004fdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004fdf:	83 ec 08             	sub    $0x8,%esp
c0004fe2:	ff 75 f4             	pushl  -0xc(%ebp)
c0004fe5:	50                   	push   %eax
c0004fe6:	e8 79 ff ff ff       	call   c0004f64 <Seg2PhyAddrLDT>
c0004feb:	83 c4 10             	add    $0x10,%esp
c0004fee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004ff1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004ff4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ff7:	01 d0                	add    %edx,%eax
c0004ff9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004ffc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004fff:	c9                   	leave  
c0005000:	c3                   	ret    

c0005001 <init_propt>:
c0005001:	55                   	push   %ebp
c0005002:	89 e5                	mov    %esp,%ebp
c0005004:	83 ec 38             	sub    $0x38,%esp
c0005007:	6a 0e                	push   $0xe
c0005009:	6a 08                	push   $0x8
c000500b:	68 6a 16 00 c0       	push   $0xc000166a
c0005010:	6a 20                	push   $0x20
c0005012:	e8 58 01 00 00       	call   c000516f <InitInterruptDesc>
c0005017:	83 c4 10             	add    $0x10,%esp
c000501a:	6a 0e                	push   $0xe
c000501c:	6a 08                	push   $0x8
c000501e:	68 97 16 00 c0       	push   $0xc0001697
c0005023:	6a 21                	push   $0x21
c0005025:	e8 45 01 00 00       	call   c000516f <InitInterruptDesc>
c000502a:	83 c4 10             	add    $0x10,%esp
c000502d:	6a 0e                	push   $0xe
c000502f:	6a 08                	push   $0x8
c0005031:	68 d9 16 00 c0       	push   $0xc00016d9
c0005036:	6a 2e                	push   $0x2e
c0005038:	e8 32 01 00 00       	call   c000516f <InitInterruptDesc>
c000503d:	83 c4 10             	add    $0x10,%esp
c0005040:	83 ec 04             	sub    $0x4,%esp
c0005043:	68 a0 15 00 00       	push   $0x15a0
c0005048:	6a 00                	push   $0x0
c000504a:	68 00 32 08 c0       	push   $0xc0083200
c000504f:	e8 d7 6a 00 00       	call   c000bb2b <Memset>
c0005054:	83 c4 10             	add    $0x10,%esp
c0005057:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c000505e:	83 ec 04             	sub    $0x4,%esp
c0005061:	ff 75 f4             	pushl  -0xc(%ebp)
c0005064:	6a 00                	push   $0x0
c0005066:	68 40 16 01 c0       	push   $0xc0011640
c000506b:	e8 bb 6a 00 00       	call   c000bb2b <Memset>
c0005070:	83 c4 10             	add    $0x10,%esp
c0005073:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005076:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c000507b:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0005082:	00 00 00 
c0005085:	83 ec 0c             	sub    $0xc,%esp
c0005088:	6a 30                	push   $0x30
c000508a:	e8 94 fe ff ff       	call   c0004f23 <Seg2PhyAddr>
c000508f:	83 c4 10             	add    $0x10,%esp
c0005092:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005095:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c000509c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c00050a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00050a6:	0f b7 d0             	movzwl %ax,%edx
c00050a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050ac:	83 e8 01             	sub    $0x1,%eax
c00050af:	89 c1                	mov    %eax,%ecx
c00050b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00050b4:	52                   	push   %edx
c00050b5:	51                   	push   %ecx
c00050b6:	50                   	push   %eax
c00050b7:	68 00 08 01 c0       	push   $0xc0010800
c00050bc:	e8 f5 fd ff ff       	call   c0004eb6 <InitDescriptor>
c00050c1:	83 c4 10             	add    $0x10,%esp
c00050c4:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c00050cb:	68 f2 00 00 00       	push   $0xf2
c00050d0:	68 ff ff 00 00       	push   $0xffff
c00050d5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00050d8:	68 f8 07 01 c0       	push   $0xc00107f8
c00050dd:	e8 d4 fd ff ff       	call   c0004eb6 <InitDescriptor>
c00050e2:	83 c4 10             	add    $0x10,%esp
c00050e5:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c00050ec:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c00050f3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c00050fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00050fd:	0f b7 c0             	movzwl %ax,%eax
c0005100:	50                   	push   %eax
c0005101:	ff 75 d8             	pushl  -0x28(%ebp)
c0005104:	6a 00                	push   $0x0
c0005106:	68 08 08 01 c0       	push   $0xc0010808
c000510b:	e8 a6 fd ff ff       	call   c0004eb6 <InitDescriptor>
c0005110:	83 c4 10             	add    $0x10,%esp
c0005113:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005116:	0f b7 c0             	movzwl %ax,%eax
c0005119:	50                   	push   %eax
c000511a:	ff 75 d8             	pushl  -0x28(%ebp)
c000511d:	6a 00                	push   $0x0
c000511f:	68 10 08 01 c0       	push   $0xc0010810
c0005124:	e8 8d fd ff ff       	call   c0004eb6 <InitDescriptor>
c0005129:	83 c4 10             	add    $0x10,%esp
c000512c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0005133:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c000513a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000513d:	0f b7 c0             	movzwl %ax,%eax
c0005140:	50                   	push   %eax
c0005141:	ff 75 d8             	pushl  -0x28(%ebp)
c0005144:	6a 00                	push   $0x0
c0005146:	68 18 08 01 c0       	push   $0xc0010818
c000514b:	e8 66 fd ff ff       	call   c0004eb6 <InitDescriptor>
c0005150:	83 c4 10             	add    $0x10,%esp
c0005153:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005156:	0f b7 c0             	movzwl %ax,%eax
c0005159:	50                   	push   %eax
c000515a:	ff 75 d8             	pushl  -0x28(%ebp)
c000515d:	6a 00                	push   $0x0
c000515f:	68 20 08 01 c0       	push   $0xc0010820
c0005164:	e8 4d fd ff ff       	call   c0004eb6 <InitDescriptor>
c0005169:	83 c4 10             	add    $0x10,%esp
c000516c:	90                   	nop
c000516d:	c9                   	leave  
c000516e:	c3                   	ret    

c000516f <InitInterruptDesc>:
c000516f:	55                   	push   %ebp
c0005170:	89 e5                	mov    %esp,%ebp
c0005172:	83 ec 10             	sub    $0x10,%esp
c0005175:	8b 45 08             	mov    0x8(%ebp),%eax
c0005178:	c1 e0 03             	shl    $0x3,%eax
c000517b:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c0005180:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005183:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005186:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c000518a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000518d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0005190:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005193:	89 c2                	mov    %eax,%edx
c0005195:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005198:	66 89 10             	mov    %dx,(%eax)
c000519b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000519e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c00051a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00051a7:	c1 f8 10             	sar    $0x10,%eax
c00051aa:	89 c2                	mov    %eax,%edx
c00051ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00051af:	66 89 50 06          	mov    %dx,0x6(%eax)
c00051b3:	8b 45 10             	mov    0x10(%ebp),%eax
c00051b6:	c1 e0 04             	shl    $0x4,%eax
c00051b9:	89 c2                	mov    %eax,%edx
c00051bb:	8b 45 14             	mov    0x14(%ebp),%eax
c00051be:	09 d0                	or     %edx,%eax
c00051c0:	89 c2                	mov    %eax,%edx
c00051c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00051c5:	88 50 05             	mov    %dl,0x5(%eax)
c00051c8:	90                   	nop
c00051c9:	c9                   	leave  
c00051ca:	c3                   	ret    

c00051cb <ReloadGDT>:
c00051cb:	55                   	push   %ebp
c00051cc:	89 e5                	mov    %esp,%ebp
c00051ce:	83 ec 28             	sub    $0x28,%esp
c00051d1:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c00051d6:	0f b7 00             	movzwl (%eax),%eax
c00051d9:	98                   	cwtl   
c00051da:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c00051df:	8b 12                	mov    (%edx),%edx
c00051e1:	83 ec 04             	sub    $0x4,%esp
c00051e4:	50                   	push   %eax
c00051e5:	52                   	push   %edx
c00051e6:	68 c0 07 01 c0       	push   $0xc00107c0
c00051eb:	e8 0d 69 00 00       	call   c000bafd <Memcpy2>
c00051f0:	83 c4 10             	add    $0x10,%esp
c00051f3:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c00051fa:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0005201:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005204:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0005209:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c000520e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005211:	89 10                	mov    %edx,(%eax)
c0005213:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c000521a:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c0005221:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005224:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0005229:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c000522e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005231:	89 10                	mov    %edx,(%eax)
c0005233:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000523a:	eb 04                	jmp    c0005240 <ReloadGDT+0x75>
c000523c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005240:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0005247:	7e f3                	jle    c000523c <ReloadGDT+0x71>
c0005249:	e8 75 31 00 00       	call   c00083c3 <init_internal_interrupt>
c000524e:	e8 ae fd ff ff       	call   c0005001 <init_propt>
c0005253:	90                   	nop
c0005254:	c9                   	leave  
c0005255:	c3                   	ret    

c0005256 <select_console>:
c0005256:	55                   	push   %ebp
c0005257:	89 e5                	mov    %esp,%ebp
c0005259:	83 ec 18             	sub    $0x18,%esp
c000525c:	8b 45 08             	mov    0x8(%ebp),%eax
c000525f:	88 45 f4             	mov    %al,-0xc(%ebp)
c0005262:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0005266:	75 27                	jne    c000528f <select_console+0x39>
c0005268:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c000526c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0005272:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0005277:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c000527c:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005281:	83 ec 0c             	sub    $0xc,%esp
c0005284:	50                   	push   %eax
c0005285:	e8 08 00 00 00       	call   c0005292 <flush>
c000528a:	83 c4 10             	add    $0x10,%esp
c000528d:	eb 01                	jmp    c0005290 <select_console+0x3a>
c000528f:	90                   	nop
c0005290:	c9                   	leave  
c0005291:	c3                   	ret    

c0005292 <flush>:
c0005292:	55                   	push   %ebp
c0005293:	89 e5                	mov    %esp,%ebp
c0005295:	83 ec 08             	sub    $0x8,%esp
c0005298:	8b 45 08             	mov    0x8(%ebp),%eax
c000529b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052a1:	8b 40 0c             	mov    0xc(%eax),%eax
c00052a4:	83 ec 0c             	sub    $0xc,%esp
c00052a7:	50                   	push   %eax
c00052a8:	e8 1e 00 00 00       	call   c00052cb <set_cursor>
c00052ad:	83 c4 10             	add    $0x10,%esp
c00052b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00052b3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052b9:	8b 40 08             	mov    0x8(%eax),%eax
c00052bc:	83 ec 0c             	sub    $0xc,%esp
c00052bf:	50                   	push   %eax
c00052c0:	e8 64 00 00 00       	call   c0005329 <set_console_start_video_addr>
c00052c5:	83 c4 10             	add    $0x10,%esp
c00052c8:	90                   	nop
c00052c9:	c9                   	leave  
c00052ca:	c3                   	ret    

c00052cb <set_cursor>:
c00052cb:	55                   	push   %ebp
c00052cc:	89 e5                	mov    %esp,%ebp
c00052ce:	83 ec 08             	sub    $0x8,%esp
c00052d1:	83 ec 08             	sub    $0x8,%esp
c00052d4:	6a 0e                	push   $0xe
c00052d6:	68 d4 03 00 00       	push   $0x3d4
c00052db:	e8 b2 c4 ff ff       	call   c0001792 <out_byte>
c00052e0:	83 c4 10             	add    $0x10,%esp
c00052e3:	8b 45 08             	mov    0x8(%ebp),%eax
c00052e6:	c1 e8 08             	shr    $0x8,%eax
c00052e9:	0f b7 c0             	movzwl %ax,%eax
c00052ec:	83 ec 08             	sub    $0x8,%esp
c00052ef:	50                   	push   %eax
c00052f0:	68 d5 03 00 00       	push   $0x3d5
c00052f5:	e8 98 c4 ff ff       	call   c0001792 <out_byte>
c00052fa:	83 c4 10             	add    $0x10,%esp
c00052fd:	83 ec 08             	sub    $0x8,%esp
c0005300:	6a 0f                	push   $0xf
c0005302:	68 d4 03 00 00       	push   $0x3d4
c0005307:	e8 86 c4 ff ff       	call   c0001792 <out_byte>
c000530c:	83 c4 10             	add    $0x10,%esp
c000530f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005312:	0f b7 c0             	movzwl %ax,%eax
c0005315:	83 ec 08             	sub    $0x8,%esp
c0005318:	50                   	push   %eax
c0005319:	68 d5 03 00 00       	push   $0x3d5
c000531e:	e8 6f c4 ff ff       	call   c0001792 <out_byte>
c0005323:	83 c4 10             	add    $0x10,%esp
c0005326:	90                   	nop
c0005327:	c9                   	leave  
c0005328:	c3                   	ret    

c0005329 <set_console_start_video_addr>:
c0005329:	55                   	push   %ebp
c000532a:	89 e5                	mov    %esp,%ebp
c000532c:	83 ec 08             	sub    $0x8,%esp
c000532f:	83 ec 08             	sub    $0x8,%esp
c0005332:	6a 0c                	push   $0xc
c0005334:	68 d4 03 00 00       	push   $0x3d4
c0005339:	e8 54 c4 ff ff       	call   c0001792 <out_byte>
c000533e:	83 c4 10             	add    $0x10,%esp
c0005341:	8b 45 08             	mov    0x8(%ebp),%eax
c0005344:	c1 e8 08             	shr    $0x8,%eax
c0005347:	0f b7 c0             	movzwl %ax,%eax
c000534a:	83 ec 08             	sub    $0x8,%esp
c000534d:	50                   	push   %eax
c000534e:	68 d5 03 00 00       	push   $0x3d5
c0005353:	e8 3a c4 ff ff       	call   c0001792 <out_byte>
c0005358:	83 c4 10             	add    $0x10,%esp
c000535b:	83 ec 08             	sub    $0x8,%esp
c000535e:	6a 0d                	push   $0xd
c0005360:	68 d4 03 00 00       	push   $0x3d4
c0005365:	e8 28 c4 ff ff       	call   c0001792 <out_byte>
c000536a:	83 c4 10             	add    $0x10,%esp
c000536d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005370:	0f b7 c0             	movzwl %ax,%eax
c0005373:	83 ec 08             	sub    $0x8,%esp
c0005376:	50                   	push   %eax
c0005377:	68 d5 03 00 00       	push   $0x3d5
c000537c:	e8 11 c4 ff ff       	call   c0001792 <out_byte>
c0005381:	83 c4 10             	add    $0x10,%esp
c0005384:	90                   	nop
c0005385:	c9                   	leave  
c0005386:	c3                   	ret    

c0005387 <put_key>:
c0005387:	55                   	push   %ebp
c0005388:	89 e5                	mov    %esp,%ebp
c000538a:	83 ec 04             	sub    $0x4,%esp
c000538d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005390:	88 45 fc             	mov    %al,-0x4(%ebp)
c0005393:	8b 45 08             	mov    0x8(%ebp),%eax
c0005396:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000539c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00053a1:	77 4d                	ja     c00053f0 <put_key+0x69>
c00053a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a6:	8b 00                	mov    (%eax),%eax
c00053a8:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c00053ac:	89 10                	mov    %edx,(%eax)
c00053ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b1:	8b 00                	mov    (%eax),%eax
c00053b3:	8d 50 04             	lea    0x4(%eax),%edx
c00053b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b9:	89 10                	mov    %edx,(%eax)
c00053bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00053be:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00053c4:	8d 50 01             	lea    0x1(%eax),%edx
c00053c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ca:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c00053d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d3:	8b 00                	mov    (%eax),%eax
c00053d5:	8b 55 08             	mov    0x8(%ebp),%edx
c00053d8:	83 c2 08             	add    $0x8,%edx
c00053db:	81 c2 00 08 00 00    	add    $0x800,%edx
c00053e1:	39 d0                	cmp    %edx,%eax
c00053e3:	75 0b                	jne    c00053f0 <put_key+0x69>
c00053e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00053e8:	8d 50 08             	lea    0x8(%eax),%edx
c00053eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ee:	89 10                	mov    %edx,(%eax)
c00053f0:	90                   	nop
c00053f1:	c9                   	leave  
c00053f2:	c3                   	ret    

c00053f3 <scroll_up>:
c00053f3:	55                   	push   %ebp
c00053f4:	89 e5                	mov    %esp,%ebp
c00053f6:	83 ec 08             	sub    $0x8,%esp
c00053f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00053fc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005402:	8b 40 08             	mov    0x8(%eax),%eax
c0005405:	8d 50 b0             	lea    -0x50(%eax),%edx
c0005408:	8b 45 08             	mov    0x8(%ebp),%eax
c000540b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005411:	8b 00                	mov    (%eax),%eax
c0005413:	39 c2                	cmp    %eax,%edx
c0005415:	76 1b                	jbe    c0005432 <scroll_up+0x3f>
c0005417:	8b 45 08             	mov    0x8(%ebp),%eax
c000541a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005420:	8b 40 08             	mov    0x8(%eax),%eax
c0005423:	83 e8 50             	sub    $0x50,%eax
c0005426:	83 ec 0c             	sub    $0xc,%esp
c0005429:	50                   	push   %eax
c000542a:	e8 fa fe ff ff       	call   c0005329 <set_console_start_video_addr>
c000542f:	83 c4 10             	add    $0x10,%esp
c0005432:	90                   	nop
c0005433:	c9                   	leave  
c0005434:	c3                   	ret    

c0005435 <scroll_down>:
c0005435:	55                   	push   %ebp
c0005436:	89 e5                	mov    %esp,%ebp
c0005438:	83 ec 08             	sub    $0x8,%esp
c000543b:	8b 45 08             	mov    0x8(%ebp),%eax
c000543e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005444:	8b 40 08             	mov    0x8(%eax),%eax
c0005447:	8d 48 50             	lea    0x50(%eax),%ecx
c000544a:	8b 45 08             	mov    0x8(%ebp),%eax
c000544d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005453:	8b 10                	mov    (%eax),%edx
c0005455:	8b 45 08             	mov    0x8(%ebp),%eax
c0005458:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000545e:	8b 40 04             	mov    0x4(%eax),%eax
c0005461:	01 d0                	add    %edx,%eax
c0005463:	39 c1                	cmp    %eax,%ecx
c0005465:	73 36                	jae    c000549d <scroll_down+0x68>
c0005467:	8b 45 08             	mov    0x8(%ebp),%eax
c000546a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005470:	8b 40 08             	mov    0x8(%eax),%eax
c0005473:	83 c0 50             	add    $0x50,%eax
c0005476:	83 ec 0c             	sub    $0xc,%esp
c0005479:	50                   	push   %eax
c000547a:	e8 aa fe ff ff       	call   c0005329 <set_console_start_video_addr>
c000547f:	83 c4 10             	add    $0x10,%esp
c0005482:	8b 45 08             	mov    0x8(%ebp),%eax
c0005485:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000548b:	8b 50 08             	mov    0x8(%eax),%edx
c000548e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005491:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005497:	83 c2 50             	add    $0x50,%edx
c000549a:	89 50 08             	mov    %edx,0x8(%eax)
c000549d:	90                   	nop
c000549e:	c9                   	leave  
c000549f:	c3                   	ret    

c00054a0 <out_char>:
c00054a0:	55                   	push   %ebp
c00054a1:	89 e5                	mov    %esp,%ebp
c00054a3:	83 ec 28             	sub    $0x28,%esp
c00054a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054a9:	88 45 e4             	mov    %al,-0x1c(%ebp)
c00054ac:	e8 f3 26 00 00       	call   c0007ba4 <intr_disable>
c00054b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00054b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054bd:	8b 40 0c             	mov    0xc(%eax),%eax
c00054c0:	05 00 c0 05 60       	add    $0x6005c000,%eax
c00054c5:	01 c0                	add    %eax,%eax
c00054c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00054ca:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c00054ce:	83 f8 08             	cmp    $0x8,%eax
c00054d1:	0f 84 8d 00 00 00    	je     c0005564 <out_char+0xc4>
c00054d7:	83 f8 0a             	cmp    $0xa,%eax
c00054da:	0f 85 c9 00 00 00    	jne    c00055a9 <out_char+0x109>
c00054e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00054e3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054e9:	8b 50 0c             	mov    0xc(%eax),%edx
c00054ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00054ef:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054f5:	8b 08                	mov    (%eax),%ecx
c00054f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00054fa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005500:	8b 40 04             	mov    0x4(%eax),%eax
c0005503:	01 c8                	add    %ecx,%eax
c0005505:	83 e8 50             	sub    $0x50,%eax
c0005508:	39 c2                	cmp    %eax,%edx
c000550a:	0f 83 f4 00 00 00    	jae    c0005604 <out_char+0x164>
c0005510:	8b 45 08             	mov    0x8(%ebp),%eax
c0005513:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005519:	8b 08                	mov    (%eax),%ecx
c000551b:	8b 45 08             	mov    0x8(%ebp),%eax
c000551e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005524:	8b 50 0c             	mov    0xc(%eax),%edx
c0005527:	8b 45 08             	mov    0x8(%ebp),%eax
c000552a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005530:	8b 00                	mov    (%eax),%eax
c0005532:	29 c2                	sub    %eax,%edx
c0005534:	89 d0                	mov    %edx,%eax
c0005536:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c000553b:	f7 e2                	mul    %edx
c000553d:	89 d0                	mov    %edx,%eax
c000553f:	c1 e8 06             	shr    $0x6,%eax
c0005542:	8d 50 01             	lea    0x1(%eax),%edx
c0005545:	89 d0                	mov    %edx,%eax
c0005547:	c1 e0 02             	shl    $0x2,%eax
c000554a:	01 d0                	add    %edx,%eax
c000554c:	c1 e0 04             	shl    $0x4,%eax
c000554f:	89 c2                	mov    %eax,%edx
c0005551:	8b 45 08             	mov    0x8(%ebp),%eax
c0005554:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000555a:	01 ca                	add    %ecx,%edx
c000555c:	89 50 0c             	mov    %edx,0xc(%eax)
c000555f:	e9 a0 00 00 00       	jmp    c0005604 <out_char+0x164>
c0005564:	8b 45 08             	mov    0x8(%ebp),%eax
c0005567:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000556d:	8b 50 0c             	mov    0xc(%eax),%edx
c0005570:	8b 45 08             	mov    0x8(%ebp),%eax
c0005573:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005579:	8b 00                	mov    (%eax),%eax
c000557b:	39 c2                	cmp    %eax,%edx
c000557d:	0f 86 84 00 00 00    	jbe    c0005607 <out_char+0x167>
c0005583:	8b 45 08             	mov    0x8(%ebp),%eax
c0005586:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000558c:	8b 50 0c             	mov    0xc(%eax),%edx
c000558f:	83 ea 01             	sub    $0x1,%edx
c0005592:	89 50 0c             	mov    %edx,0xc(%eax)
c0005595:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005598:	83 e8 02             	sub    $0x2,%eax
c000559b:	c6 00 20             	movb   $0x20,(%eax)
c000559e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055a1:	83 e8 01             	sub    $0x1,%eax
c00055a4:	c6 00 00             	movb   $0x0,(%eax)
c00055a7:	eb 5e                	jmp    c0005607 <out_char+0x167>
c00055a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00055ac:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055b2:	8b 40 0c             	mov    0xc(%eax),%eax
c00055b5:	8d 48 01             	lea    0x1(%eax),%ecx
c00055b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00055bb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055c1:	8b 10                	mov    (%eax),%edx
c00055c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055cc:	8b 40 04             	mov    0x4(%eax),%eax
c00055cf:	01 d0                	add    %edx,%eax
c00055d1:	39 c1                	cmp    %eax,%ecx
c00055d3:	73 35                	jae    c000560a <out_char+0x16a>
c00055d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055d8:	8d 50 01             	lea    0x1(%eax),%edx
c00055db:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00055de:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c00055e2:	88 10                	mov    %dl,(%eax)
c00055e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055e7:	8d 50 01             	lea    0x1(%eax),%edx
c00055ea:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00055ed:	c6 00 0a             	movb   $0xa,(%eax)
c00055f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00055f3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055f9:	8b 50 0c             	mov    0xc(%eax),%edx
c00055fc:	83 c2 01             	add    $0x1,%edx
c00055ff:	89 50 0c             	mov    %edx,0xc(%eax)
c0005602:	eb 06                	jmp    c000560a <out_char+0x16a>
c0005604:	90                   	nop
c0005605:	eb 14                	jmp    c000561b <out_char+0x17b>
c0005607:	90                   	nop
c0005608:	eb 11                	jmp    c000561b <out_char+0x17b>
c000560a:	90                   	nop
c000560b:	eb 0e                	jmp    c000561b <out_char+0x17b>
c000560d:	83 ec 0c             	sub    $0xc,%esp
c0005610:	ff 75 08             	pushl  0x8(%ebp)
c0005613:	e8 1d fe ff ff       	call   c0005435 <scroll_down>
c0005618:	83 c4 10             	add    $0x10,%esp
c000561b:	8b 45 08             	mov    0x8(%ebp),%eax
c000561e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005624:	8b 50 0c             	mov    0xc(%eax),%edx
c0005627:	8b 45 08             	mov    0x8(%ebp),%eax
c000562a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005630:	8b 40 08             	mov    0x8(%eax),%eax
c0005633:	29 c2                	sub    %eax,%edx
c0005635:	89 d0                	mov    %edx,%eax
c0005637:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c000563c:	77 cf                	ja     c000560d <out_char+0x16d>
c000563e:	83 ec 0c             	sub    $0xc,%esp
c0005641:	ff 75 08             	pushl  0x8(%ebp)
c0005644:	e8 49 fc ff ff       	call   c0005292 <flush>
c0005649:	83 c4 10             	add    $0x10,%esp
c000564c:	83 ec 0c             	sub    $0xc,%esp
c000564f:	ff 75 f4             	pushl  -0xc(%ebp)
c0005652:	e8 76 25 00 00       	call   c0007bcd <intr_set_status>
c0005657:	83 c4 10             	add    $0x10,%esp
c000565a:	90                   	nop
c000565b:	c9                   	leave  
c000565c:	c3                   	ret    

c000565d <tty_dev_read>:
c000565d:	55                   	push   %ebp
c000565e:	89 e5                	mov    %esp,%ebp
c0005660:	83 ec 08             	sub    $0x8,%esp
c0005663:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005668:	39 45 08             	cmp    %eax,0x8(%ebp)
c000566b:	75 17                	jne    c0005684 <tty_dev_read+0x27>
c000566d:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005672:	85 c0                	test   %eax,%eax
c0005674:	7e 0e                	jle    c0005684 <tty_dev_read+0x27>
c0005676:	83 ec 0c             	sub    $0xc,%esp
c0005679:	ff 75 08             	pushl  0x8(%ebp)
c000567c:	e8 79 07 00 00       	call   c0005dfa <keyboard_read>
c0005681:	83 c4 10             	add    $0x10,%esp
c0005684:	90                   	nop
c0005685:	c9                   	leave  
c0005686:	c3                   	ret    

c0005687 <tty_dev_write>:
c0005687:	55                   	push   %ebp
c0005688:	89 e5                	mov    %esp,%ebp
c000568a:	83 ec 28             	sub    $0x28,%esp
c000568d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005690:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005696:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005699:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00056a0:	e9 88 01 00 00       	jmp    c000582d <tty_dev_write+0x1a6>
c00056a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00056a8:	8b 40 04             	mov    0x4(%eax),%eax
c00056ab:	8b 00                	mov    (%eax),%eax
c00056ad:	88 45 e7             	mov    %al,-0x19(%ebp)
c00056b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00056b3:	8b 40 04             	mov    0x4(%eax),%eax
c00056b6:	8d 50 04             	lea    0x4(%eax),%edx
c00056b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00056bc:	89 50 04             	mov    %edx,0x4(%eax)
c00056bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00056c2:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00056c8:	8d 50 ff             	lea    -0x1(%eax),%edx
c00056cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00056ce:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c00056d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00056d7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00056dd:	8d 50 01             	lea    0x1(%eax),%edx
c00056e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00056e3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00056e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00056ec:	8b 40 04             	mov    0x4(%eax),%eax
c00056ef:	8b 55 08             	mov    0x8(%ebp),%edx
c00056f2:	83 c2 08             	add    $0x8,%edx
c00056f5:	81 c2 00 08 00 00    	add    $0x800,%edx
c00056fb:	39 d0                	cmp    %edx,%eax
c00056fd:	75 0c                	jne    c000570b <tty_dev_write+0x84>
c00056ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005702:	8d 50 08             	lea    0x8(%eax),%edx
c0005705:	8b 45 08             	mov    0x8(%ebp),%eax
c0005708:	89 50 04             	mov    %edx,0x4(%eax)
c000570b:	8b 45 08             	mov    0x8(%ebp),%eax
c000570e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005714:	85 c0                	test   %eax,%eax
c0005716:	0f 84 11 01 00 00    	je     c000582d <tty_dev_write+0x1a6>
c000571c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005720:	3c 20                	cmp    $0x20,%al
c0005722:	76 08                	jbe    c000572c <tty_dev_write+0xa5>
c0005724:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005728:	3c 7e                	cmp    $0x7e,%al
c000572a:	76 10                	jbe    c000573c <tty_dev_write+0xb5>
c000572c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005730:	3c 20                	cmp    $0x20,%al
c0005732:	74 08                	je     c000573c <tty_dev_write+0xb5>
c0005734:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005738:	84 c0                	test   %al,%al
c000573a:	75 58                	jne    c0005794 <tty_dev_write+0x10d>
c000573c:	8b 45 08             	mov    0x8(%ebp),%eax
c000573f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0005745:	8b 45 08             	mov    0x8(%ebp),%eax
c0005748:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000574e:	01 d0                	add    %edx,%eax
c0005750:	83 e8 01             	sub    $0x1,%eax
c0005753:	89 c2                	mov    %eax,%edx
c0005755:	83 ec 04             	sub    $0x4,%esp
c0005758:	6a 01                	push   $0x1
c000575a:	8d 45 e7             	lea    -0x19(%ebp),%eax
c000575d:	50                   	push   %eax
c000575e:	52                   	push   %edx
c000575f:	e8 a4 24 00 00       	call   c0007c08 <Memcpy>
c0005764:	83 c4 10             	add    $0x10,%esp
c0005767:	8b 45 08             	mov    0x8(%ebp),%eax
c000576a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005770:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005773:	8b 45 08             	mov    0x8(%ebp),%eax
c0005776:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000577c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005780:	0f b6 c0             	movzbl %al,%eax
c0005783:	83 ec 08             	sub    $0x8,%esp
c0005786:	50                   	push   %eax
c0005787:	ff 75 08             	pushl  0x8(%ebp)
c000578a:	e8 11 fd ff ff       	call   c00054a0 <out_char>
c000578f:	83 c4 10             	add    $0x10,%esp
c0005792:	eb 7c                	jmp    c0005810 <tty_dev_write+0x189>
c0005794:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005798:	3c 08                	cmp    $0x8,%al
c000579a:	75 42                	jne    c00057de <tty_dev_write+0x157>
c000579c:	8b 45 08             	mov    0x8(%ebp),%eax
c000579f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00057a5:	8d 50 01             	lea    0x1(%eax),%edx
c00057a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00057ab:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00057b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00057b4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00057ba:	8d 50 fe             	lea    -0x2(%eax),%edx
c00057bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00057c0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00057c6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00057ca:	0f b6 c0             	movzbl %al,%eax
c00057cd:	83 ec 08             	sub    $0x8,%esp
c00057d0:	50                   	push   %eax
c00057d1:	ff 75 08             	pushl  0x8(%ebp)
c00057d4:	e8 c7 fc ff ff       	call   c00054a0 <out_char>
c00057d9:	83 c4 10             	add    $0x10,%esp
c00057dc:	eb 32                	jmp    c0005810 <tty_dev_write+0x189>
c00057de:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00057e2:	3c 0a                	cmp    $0xa,%al
c00057e4:	75 2a                	jne    c0005810 <tty_dev_write+0x189>
c00057e6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00057ea:	0f b6 c0             	movzbl %al,%eax
c00057ed:	83 ec 08             	sub    $0x8,%esp
c00057f0:	50                   	push   %eax
c00057f1:	ff 75 08             	pushl  0x8(%ebp)
c00057f4:	e8 a7 fc ff ff       	call   c00054a0 <out_char>
c00057f9:	83 c4 10             	add    $0x10,%esp
c00057fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00057ff:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005806:	00 00 00 
c0005809:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005810:	8b 45 08             	mov    0x8(%ebp),%eax
c0005813:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005819:	8b 45 08             	mov    0x8(%ebp),%eax
c000581c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0005822:	39 c2                	cmp    %eax,%edx
c0005824:	75 07                	jne    c000582d <tty_dev_write+0x1a6>
c0005826:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000582d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005830:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005836:	85 c0                	test   %eax,%eax
c0005838:	0f 85 67 fe ff ff    	jne    c00056a5 <tty_dev_write+0x1e>
c000583e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005842:	74 5c                	je     c00058a0 <tty_dev_write+0x219>
c0005844:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c000584b:	83 ec 0c             	sub    $0xc,%esp
c000584e:	ff 75 ec             	pushl  -0x14(%ebp)
c0005851:	e8 4e d1 ff ff       	call   c00029a4 <sys_malloc>
c0005856:	83 c4 10             	add    $0x10,%esp
c0005859:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000585c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000585f:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c0005866:	8b 45 08             	mov    0x8(%ebp),%eax
c0005869:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000586f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005872:	89 50 50             	mov    %edx,0x50(%eax)
c0005875:	8b 45 08             	mov    0x8(%ebp),%eax
c0005878:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c000587e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005881:	89 50 58             	mov    %edx,0x58(%eax)
c0005884:	8b 45 08             	mov    0x8(%ebp),%eax
c0005887:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000588d:	83 ec 04             	sub    $0x4,%esp
c0005890:	50                   	push   %eax
c0005891:	ff 75 e8             	pushl  -0x18(%ebp)
c0005894:	6a 01                	push   $0x1
c0005896:	e8 9c 46 00 00       	call   c0009f37 <send_rec>
c000589b:	83 c4 10             	add    $0x10,%esp
c000589e:	eb 01                	jmp    c00058a1 <tty_dev_write+0x21a>
c00058a0:	90                   	nop
c00058a1:	c9                   	leave  
c00058a2:	c3                   	ret    

c00058a3 <tty_do_read>:
c00058a3:	55                   	push   %ebp
c00058a4:	89 e5                	mov    %esp,%ebp
c00058a6:	83 ec 08             	sub    $0x8,%esp
c00058a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00058ac:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00058b3:	00 00 00 
c00058b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058b9:	8b 50 58             	mov    0x58(%eax),%edx
c00058bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00058bf:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c00058c5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058c8:	8b 00                	mov    (%eax),%eax
c00058ca:	89 c2                	mov    %eax,%edx
c00058cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00058cf:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c00058d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058d8:	8b 50 50             	mov    0x50(%eax),%edx
c00058db:	8b 45 08             	mov    0x8(%ebp),%eax
c00058de:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00058e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058e7:	8b 50 50             	mov    0x50(%eax),%edx
c00058ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00058ed:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00058f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00058f6:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c00058fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058ff:	8b 40 10             	mov    0x10(%eax),%eax
c0005902:	83 ec 08             	sub    $0x8,%esp
c0005905:	52                   	push   %edx
c0005906:	50                   	push   %eax
c0005907:	e8 4b 18 00 00       	call   c0007157 <alloc_virtual_memory>
c000590c:	83 c4 10             	add    $0x10,%esp
c000590f:	89 c2                	mov    %eax,%edx
c0005911:	8b 45 08             	mov    0x8(%ebp),%eax
c0005914:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c000591a:	8b 45 08             	mov    0x8(%ebp),%eax
c000591d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005923:	83 f8 02             	cmp    $0x2,%eax
c0005926:	74 1c                	je     c0005944 <tty_do_read+0xa1>
c0005928:	68 39 01 00 00       	push   $0x139
c000592d:	68 eb b2 00 c0       	push   $0xc000b2eb
c0005932:	68 eb b2 00 c0       	push   $0xc000b2eb
c0005937:	68 f5 b2 00 c0       	push   $0xc000b2f5
c000593c:	e8 86 3d 00 00       	call   c00096c7 <assertion_failure>
c0005941:	83 c4 10             	add    $0x10,%esp
c0005944:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005947:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c000594e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005951:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005957:	83 ec 04             	sub    $0x4,%esp
c000595a:	50                   	push   %eax
c000595b:	ff 75 0c             	pushl  0xc(%ebp)
c000595e:	6a 01                	push   $0x1
c0005960:	e8 d2 45 00 00       	call   c0009f37 <send_rec>
c0005965:	83 c4 10             	add    $0x10,%esp
c0005968:	90                   	nop
c0005969:	c9                   	leave  
c000596a:	c3                   	ret    

c000596b <tty_do_write>:
c000596b:	55                   	push   %ebp
c000596c:	89 e5                	mov    %esp,%ebp
c000596e:	53                   	push   %ebx
c000596f:	83 ec 24             	sub    $0x24,%esp
c0005972:	89 e0                	mov    %esp,%eax
c0005974:	89 c3                	mov    %eax,%ebx
c0005976:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000597d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005980:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005983:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005986:	89 c2                	mov    %eax,%edx
c0005988:	b8 10 00 00 00       	mov    $0x10,%eax
c000598d:	83 e8 01             	sub    $0x1,%eax
c0005990:	01 d0                	add    %edx,%eax
c0005992:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005997:	ba 00 00 00 00       	mov    $0x0,%edx
c000599c:	f7 f1                	div    %ecx
c000599e:	6b c0 10             	imul   $0x10,%eax,%eax
c00059a1:	29 c4                	sub    %eax,%esp
c00059a3:	89 e0                	mov    %esp,%eax
c00059a5:	83 c0 00             	add    $0x0,%eax
c00059a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00059ab:	83 ec 04             	sub    $0x4,%esp
c00059ae:	ff 75 e8             	pushl  -0x18(%ebp)
c00059b1:	6a 00                	push   $0x0
c00059b3:	ff 75 e0             	pushl  -0x20(%ebp)
c00059b6:	e8 70 61 00 00       	call   c000bb2b <Memset>
c00059bb:	83 c4 10             	add    $0x10,%esp
c00059be:	8b 45 0c             	mov    0xc(%ebp),%eax
c00059c1:	8b 40 50             	mov    0x50(%eax),%eax
c00059c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00059c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00059ca:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00059d1:	00 00 00 
c00059d4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00059d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00059da:	8b 40 10             	mov    0x10(%eax),%eax
c00059dd:	83 ec 08             	sub    $0x8,%esp
c00059e0:	52                   	push   %edx
c00059e1:	50                   	push   %eax
c00059e2:	e8 70 17 00 00       	call   c0007157 <alloc_virtual_memory>
c00059e7:	83 c4 10             	add    $0x10,%esp
c00059ea:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00059ed:	eb 7e                	jmp    c0005a6d <tty_do_write+0x102>
c00059ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00059f2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00059f5:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c00059f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00059fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00059ff:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005a05:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005a08:	01 d0                	add    %edx,%eax
c0005a0a:	83 ec 04             	sub    $0x4,%esp
c0005a0d:	ff 75 f0             	pushl  -0x10(%ebp)
c0005a10:	50                   	push   %eax
c0005a11:	ff 75 e0             	pushl  -0x20(%ebp)
c0005a14:	e8 ef 21 00 00       	call   c0007c08 <Memcpy>
c0005a19:	83 c4 10             	add    $0x10,%esp
c0005a1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a1f:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0005a22:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a25:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005a2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a2e:	01 c2                	add    %eax,%edx
c0005a30:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a33:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005a39:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005a40:	eb 25                	jmp    c0005a67 <tty_do_write+0xfc>
c0005a42:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a48:	01 d0                	add    %edx,%eax
c0005a4a:	0f b6 00             	movzbl (%eax),%eax
c0005a4d:	0f b6 c0             	movzbl %al,%eax
c0005a50:	83 ec 08             	sub    $0x8,%esp
c0005a53:	50                   	push   %eax
c0005a54:	ff 75 08             	pushl  0x8(%ebp)
c0005a57:	e8 44 fa ff ff       	call   c00054a0 <out_char>
c0005a5c:	83 c4 10             	add    $0x10,%esp
c0005a5f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005a63:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005a67:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005a6b:	75 d5                	jne    c0005a42 <tty_do_write+0xd7>
c0005a6d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005a71:	0f 85 78 ff ff ff    	jne    c00059ef <tty_do_write+0x84>
c0005a77:	83 ec 0c             	sub    $0xc,%esp
c0005a7a:	6a 6c                	push   $0x6c
c0005a7c:	e8 23 cf ff ff       	call   c00029a4 <sys_malloc>
c0005a81:	83 c4 10             	add    $0x10,%esp
c0005a84:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005a87:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a8a:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0005a91:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a94:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005a9a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a9d:	89 50 48             	mov    %edx,0x48(%eax)
c0005aa0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005aa3:	8b 00                	mov    (%eax),%eax
c0005aa5:	83 ec 04             	sub    $0x4,%esp
c0005aa8:	50                   	push   %eax
c0005aa9:	ff 75 d8             	pushl  -0x28(%ebp)
c0005aac:	6a 01                	push   $0x1
c0005aae:	e8 84 44 00 00       	call   c0009f37 <send_rec>
c0005ab3:	83 c4 10             	add    $0x10,%esp
c0005ab6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ab9:	83 ec 08             	sub    $0x8,%esp
c0005abc:	6a 6c                	push   $0x6c
c0005abe:	50                   	push   %eax
c0005abf:	e8 1d 1c 00 00       	call   c00076e1 <sys_free>
c0005ac4:	83 c4 10             	add    $0x10,%esp
c0005ac7:	89 dc                	mov    %ebx,%esp
c0005ac9:	90                   	nop
c0005aca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005acd:	c9                   	leave  
c0005ace:	c3                   	ret    

c0005acf <init_screen>:
c0005acf:	55                   	push   %ebp
c0005ad0:	89 e5                	mov    %esp,%ebp
c0005ad2:	83 ec 10             	sub    $0x10,%esp
c0005ad5:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ad8:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005add:	c1 f8 03             	sar    $0x3,%eax
c0005ae0:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005ae6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005ae9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005aec:	c1 e0 04             	shl    $0x4,%eax
c0005aef:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c0005af5:	8b 45 08             	mov    0x8(%ebp),%eax
c0005af8:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005afe:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005b05:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b08:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b0e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0005b11:	89 50 04             	mov    %edx,0x4(%eax)
c0005b14:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b17:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b1d:	8b 50 04             	mov    0x4(%eax),%edx
c0005b20:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b23:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b29:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0005b2d:	89 10                	mov    %edx,(%eax)
c0005b2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b32:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0005b38:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b3b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005b41:	8b 12                	mov    (%edx),%edx
c0005b43:	89 50 08             	mov    %edx,0x8(%eax)
c0005b46:	8b 55 08             	mov    0x8(%ebp),%edx
c0005b49:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c0005b4f:	8b 40 08             	mov    0x8(%eax),%eax
c0005b52:	89 42 0c             	mov    %eax,0xc(%edx)
c0005b55:	90                   	nop
c0005b56:	c9                   	leave  
c0005b57:	c3                   	ret    

c0005b58 <init_tty>:
c0005b58:	55                   	push   %ebp
c0005b59:	89 e5                	mov    %esp,%ebp
c0005b5b:	83 ec 18             	sub    $0x18,%esp
c0005b5e:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005b65:	e9 92 00 00 00       	jmp    c0005bfc <init_tty+0xa4>
c0005b6a:	83 ec 04             	sub    $0x4,%esp
c0005b6d:	68 28 08 00 00       	push   $0x828
c0005b72:	6a 00                	push   $0x0
c0005b74:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b77:	e8 af 5f 00 00       	call   c000bb2b <Memset>
c0005b7c:	83 c4 10             	add    $0x10,%esp
c0005b7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b82:	8d 50 08             	lea    0x8(%eax),%edx
c0005b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b88:	89 50 04             	mov    %edx,0x4(%eax)
c0005b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b8e:	8b 50 04             	mov    0x4(%eax),%edx
c0005b91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b94:	89 10                	mov    %edx,(%eax)
c0005b96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b99:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005ba0:	00 00 00 
c0005ba3:	83 ec 0c             	sub    $0xc,%esp
c0005ba6:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ba9:	e8 21 ff ff ff       	call   c0005acf <init_screen>
c0005bae:	83 c4 10             	add    $0x10,%esp
c0005bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bb4:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005bb9:	85 c0                	test   %eax,%eax
c0005bbb:	7e 38                	jle    c0005bf5 <init_tty+0x9d>
c0005bbd:	83 ec 08             	sub    $0x8,%esp
c0005bc0:	6a 23                	push   $0x23
c0005bc2:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bc5:	e8 d6 f8 ff ff       	call   c00054a0 <out_char>
c0005bca:	83 c4 10             	add    $0x10,%esp
c0005bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bd0:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005bd5:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005bda:	c1 f8 03             	sar    $0x3,%eax
c0005bdd:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005be3:	0f b6 c0             	movzbl %al,%eax
c0005be6:	83 ec 08             	sub    $0x8,%esp
c0005be9:	50                   	push   %eax
c0005bea:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bed:	e8 ae f8 ff ff       	call   c00054a0 <out_char>
c0005bf2:	83 c4 10             	add    $0x10,%esp
c0005bf5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005bfc:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005c01:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005c04:	0f 82 60 ff ff ff    	jb     c0005b6a <init_tty+0x12>
c0005c0a:	90                   	nop
c0005c0b:	c9                   	leave  
c0005c0c:	c3                   	ret    

c0005c0d <TaskTTY>:
c0005c0d:	55                   	push   %ebp
c0005c0e:	89 e5                	mov    %esp,%ebp
c0005c10:	83 ec 28             	sub    $0x28,%esp
c0005c13:	e8 40 ff ff ff       	call   c0005b58 <init_tty>
c0005c18:	83 ec 0c             	sub    $0xc,%esp
c0005c1b:	6a 00                	push   $0x0
c0005c1d:	e8 34 f6 ff ff       	call   c0005256 <select_console>
c0005c22:	83 c4 10             	add    $0x10,%esp
c0005c25:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005c2c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005c33:	83 ec 0c             	sub    $0xc,%esp
c0005c36:	6a 6c                	push   $0x6c
c0005c38:	e8 67 cd ff ff       	call   c00029a4 <sys_malloc>
c0005c3d:	83 c4 10             	add    $0x10,%esp
c0005c40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005c43:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005c4a:	eb 30                	jmp    c0005c7c <TaskTTY+0x6f>
c0005c4c:	83 ec 0c             	sub    $0xc,%esp
c0005c4f:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c52:	e8 06 fa ff ff       	call   c000565d <tty_dev_read>
c0005c57:	83 c4 10             	add    $0x10,%esp
c0005c5a:	83 ec 0c             	sub    $0xc,%esp
c0005c5d:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c60:	e8 22 fa ff ff       	call   c0005687 <tty_dev_write>
c0005c65:	83 c4 10             	add    $0x10,%esp
c0005c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c6b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005c71:	85 c0                	test   %eax,%eax
c0005c73:	75 d7                	jne    c0005c4c <TaskTTY+0x3f>
c0005c75:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005c7c:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005c81:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005c84:	72 c6                	jb     c0005c4c <TaskTTY+0x3f>
c0005c86:	83 ec 04             	sub    $0x4,%esp
c0005c89:	6a 12                	push   $0x12
c0005c8b:	ff 75 e8             	pushl  -0x18(%ebp)
c0005c8e:	6a 02                	push   $0x2
c0005c90:	e8 a2 42 00 00       	call   c0009f37 <send_rec>
c0005c95:	83 c4 10             	add    $0x10,%esp
c0005c98:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005c9b:	8b 40 68             	mov    0x68(%eax),%eax
c0005c9e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005ca1:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005ca8:	74 28                	je     c0005cd2 <TaskTTY+0xc5>
c0005caa:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005cb1:	7f 0b                	jg     c0005cbe <TaskTTY+0xb1>
c0005cb3:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005cba:	74 4e                	je     c0005d0a <TaskTTY+0xfd>
c0005cbc:	eb 4d                	jmp    c0005d0b <TaskTTY+0xfe>
c0005cbe:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005cc5:	74 21                	je     c0005ce8 <TaskTTY+0xdb>
c0005cc7:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005cce:	74 2e                	je     c0005cfe <TaskTTY+0xf1>
c0005cd0:	eb 39                	jmp    c0005d0b <TaskTTY+0xfe>
c0005cd2:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005cd7:	83 ec 08             	sub    $0x8,%esp
c0005cda:	ff 75 e8             	pushl  -0x18(%ebp)
c0005cdd:	50                   	push   %eax
c0005cde:	e8 c0 fb ff ff       	call   c00058a3 <tty_do_read>
c0005ce3:	83 c4 10             	add    $0x10,%esp
c0005ce6:	eb 23                	jmp    c0005d0b <TaskTTY+0xfe>
c0005ce8:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005ced:	83 ec 08             	sub    $0x8,%esp
c0005cf0:	ff 75 e8             	pushl  -0x18(%ebp)
c0005cf3:	50                   	push   %eax
c0005cf4:	e8 72 fc ff ff       	call   c000596b <tty_do_write>
c0005cf9:	83 c4 10             	add    $0x10,%esp
c0005cfc:	eb 0d                	jmp    c0005d0b <TaskTTY+0xfe>
c0005cfe:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005d05:	00 00 00 
c0005d08:	eb 01                	jmp    c0005d0b <TaskTTY+0xfe>
c0005d0a:	90                   	nop
c0005d0b:	e9 33 ff ff ff       	jmp    c0005c43 <TaskTTY+0x36>

c0005d10 <keyboard_handler>:
c0005d10:	55                   	push   %ebp
c0005d11:	89 e5                	mov    %esp,%ebp
c0005d13:	83 ec 18             	sub    $0x18,%esp
c0005d16:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c0005d1d:	00 00 00 
c0005d20:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005d27:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d2c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005d31:	7f 5e                	jg     c0005d91 <keyboard_handler+0x81>
c0005d33:	e8 7c ba ff ff       	call   c00017b4 <disable_int>
c0005d38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d3b:	0f b7 c0             	movzwl %ax,%eax
c0005d3e:	83 ec 0c             	sub    $0xc,%esp
c0005d41:	50                   	push   %eax
c0005d42:	e8 3f ba ff ff       	call   c0001786 <in_byte>
c0005d47:	83 c4 10             	add    $0x10,%esp
c0005d4a:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005d4d:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d52:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005d56:	88 10                	mov    %dl,(%eax)
c0005d58:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d5d:	83 c0 01             	add    $0x1,%eax
c0005d60:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005d65:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d6a:	83 c0 01             	add    $0x1,%eax
c0005d6d:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005d72:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d77:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005d7c:	39 d0                	cmp    %edx,%eax
c0005d7e:	72 0a                	jb     c0005d8a <keyboard_handler+0x7a>
c0005d80:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005d87:	0b 01 c0 
c0005d8a:	e8 27 ba ff ff       	call   c00017b6 <enable_int>
c0005d8f:	eb 01                	jmp    c0005d92 <keyboard_handler+0x82>
c0005d91:	90                   	nop
c0005d92:	c9                   	leave  
c0005d93:	c3                   	ret    

c0005d94 <read_from_keyboard_buf>:
c0005d94:	55                   	push   %ebp
c0005d95:	89 e5                	mov    %esp,%ebp
c0005d97:	83 ec 18             	sub    $0x18,%esp
c0005d9a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005d9e:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005da3:	85 c0                	test   %eax,%eax
c0005da5:	7f 06                	jg     c0005dad <read_from_keyboard_buf+0x19>
c0005da7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005dab:	eb 4b                	jmp    c0005df8 <read_from_keyboard_buf+0x64>
c0005dad:	e8 02 ba ff ff       	call   c00017b4 <disable_int>
c0005db2:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005db7:	0f b6 00             	movzbl (%eax),%eax
c0005dba:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005dbd:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005dc2:	83 c0 01             	add    $0x1,%eax
c0005dc5:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005dca:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005dcf:	83 e8 01             	sub    $0x1,%eax
c0005dd2:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005dd7:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005ddc:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005de1:	39 d0                	cmp    %edx,%eax
c0005de3:	72 0a                	jb     c0005def <read_from_keyboard_buf+0x5b>
c0005de5:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c0005dec:	0b 01 c0 
c0005def:	e8 c2 b9 ff ff       	call   c00017b6 <enable_int>
c0005df4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005df8:	c9                   	leave  
c0005df9:	c3                   	ret    

c0005dfa <keyboard_read>:
c0005dfa:	55                   	push   %ebp
c0005dfb:	89 e5                	mov    %esp,%ebp
c0005dfd:	83 ec 28             	sub    $0x28,%esp
c0005e00:	90                   	nop
c0005e01:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005e06:	85 c0                	test   %eax,%eax
c0005e08:	7e f7                	jle    c0005e01 <keyboard_read+0x7>
c0005e0a:	e8 85 ff ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005e0f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005e12:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005e19:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005e1d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005e21:	75 5a                	jne    c0005e7d <keyboard_read+0x83>
c0005e23:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005e27:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005e2b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005e2f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005e33:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005e37:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005e3b:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005e3f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005e46:	eb 20                	jmp    c0005e68 <keyboard_read+0x6e>
c0005e48:	e8 47 ff ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005e4d:	89 c1                	mov    %eax,%ecx
c0005e4f:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005e52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e55:	01 d0                	add    %edx,%eax
c0005e57:	0f b6 00             	movzbl (%eax),%eax
c0005e5a:	38 c1                	cmp    %al,%cl
c0005e5c:	74 06                	je     c0005e64 <keyboard_read+0x6a>
c0005e5e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005e62:	eb 0a                	jmp    c0005e6e <keyboard_read+0x74>
c0005e64:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005e68:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005e6c:	7e da                	jle    c0005e48 <keyboard_read+0x4e>
c0005e6e:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005e72:	74 68                	je     c0005edc <keyboard_read+0xe2>
c0005e74:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005e7b:	eb 5f                	jmp    c0005edc <keyboard_read+0xe2>
c0005e7d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005e81:	75 59                	jne    c0005edc <keyboard_read+0xe2>
c0005e83:	e8 0c ff ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005e88:	3c 2a                	cmp    $0x2a,%al
c0005e8a:	75 1d                	jne    c0005ea9 <keyboard_read+0xaf>
c0005e8c:	e8 03 ff ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005e91:	3c e0                	cmp    $0xe0,%al
c0005e93:	75 14                	jne    c0005ea9 <keyboard_read+0xaf>
c0005e95:	e8 fa fe ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005e9a:	3c 37                	cmp    $0x37,%al
c0005e9c:	75 0b                	jne    c0005ea9 <keyboard_read+0xaf>
c0005e9e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005ea5:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005ea9:	e8 e6 fe ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005eae:	3c b7                	cmp    $0xb7,%al
c0005eb0:	75 1d                	jne    c0005ecf <keyboard_read+0xd5>
c0005eb2:	e8 dd fe ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005eb7:	3c e0                	cmp    $0xe0,%al
c0005eb9:	75 14                	jne    c0005ecf <keyboard_read+0xd5>
c0005ebb:	e8 d4 fe ff ff       	call   c0005d94 <read_from_keyboard_buf>
c0005ec0:	3c aa                	cmp    $0xaa,%al
c0005ec2:	75 0b                	jne    c0005ecf <keyboard_read+0xd5>
c0005ec4:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005ecb:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005ecf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005ed3:	75 07                	jne    c0005edc <keyboard_read+0xe2>
c0005ed5:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c0005edc:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005ee3:	0f 84 8d 00 00 00    	je     c0005f76 <keyboard_read+0x17c>
c0005ee9:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005ef0:	0f 84 80 00 00 00    	je     c0005f76 <keyboard_read+0x17c>
c0005ef6:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005efa:	0f 94 c2             	sete   %dl
c0005efd:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005f01:	0f 94 c0             	sete   %al
c0005f04:	09 d0                	or     %edx,%eax
c0005f06:	84 c0                	test   %al,%al
c0005f08:	74 07                	je     c0005f11 <keyboard_read+0x117>
c0005f0a:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005f11:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005f15:	f7 d0                	not    %eax
c0005f17:	c0 e8 07             	shr    $0x7,%al
c0005f1a:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005f1d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005f21:	74 53                	je     c0005f76 <keyboard_read+0x17c>
c0005f23:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005f27:	74 4d                	je     c0005f76 <keyboard_read+0x17c>
c0005f29:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005f2d:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005f34:	3c 01                	cmp    $0x1,%al
c0005f36:	75 04                	jne    c0005f3c <keyboard_read+0x142>
c0005f38:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005f3c:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c0005f43:	84 c0                	test   %al,%al
c0005f45:	74 04                	je     c0005f4b <keyboard_read+0x151>
c0005f47:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005f4b:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005f4f:	89 d0                	mov    %edx,%eax
c0005f51:	01 c0                	add    %eax,%eax
c0005f53:	01 c2                	add    %eax,%edx
c0005f55:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005f59:	01 d0                	add    %edx,%eax
c0005f5b:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005f62:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005f65:	83 ec 08             	sub    $0x8,%esp
c0005f68:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f6b:	ff 75 08             	pushl  0x8(%ebp)
c0005f6e:	e8 1a 00 00 00       	call   c0005f8d <in_process>
c0005f73:	83 c4 10             	add    $0x10,%esp
c0005f76:	90                   	nop
c0005f77:	c9                   	leave  
c0005f78:	c3                   	ret    

c0005f79 <init_keyboard_handler>:
c0005f79:	55                   	push   %ebp
c0005f7a:	89 e5                	mov    %esp,%ebp
c0005f7c:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005f83:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005f8a:	90                   	nop
c0005f8b:	5d                   	pop    %ebp
c0005f8c:	c3                   	ret    

c0005f8d <in_process>:
c0005f8d:	55                   	push   %ebp
c0005f8e:	89 e5                	mov    %esp,%ebp
c0005f90:	83 ec 18             	sub    $0x18,%esp
c0005f93:	83 ec 04             	sub    $0x4,%esp
c0005f96:	6a 02                	push   $0x2
c0005f98:	6a 00                	push   $0x0
c0005f9a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005f9d:	50                   	push   %eax
c0005f9e:	e8 88 5b 00 00       	call   c000bb2b <Memset>
c0005fa3:	83 c4 10             	add    $0x10,%esp
c0005fa6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005fa9:	25 00 01 00 00       	and    $0x100,%eax
c0005fae:	85 c0                	test   %eax,%eax
c0005fb0:	75 28                	jne    c0005fda <in_process+0x4d>
c0005fb2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005fb5:	0f b6 c0             	movzbl %al,%eax
c0005fb8:	83 ec 08             	sub    $0x8,%esp
c0005fbb:	50                   	push   %eax
c0005fbc:	ff 75 08             	pushl  0x8(%ebp)
c0005fbf:	e8 c3 f3 ff ff       	call   c0005387 <put_key>
c0005fc4:	83 c4 10             	add    $0x10,%esp
c0005fc7:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005fce:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005fd5:	e9 42 01 00 00       	jmp    c000611c <in_process+0x18f>
c0005fda:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005fe1:	84 c0                	test   %al,%al
c0005fe3:	0f 84 a9 00 00 00    	je     c0006092 <in_process+0x105>
c0005fe9:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005fed:	0f 84 9f 00 00 00    	je     c0006092 <in_process+0x105>
c0005ff3:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005ff7:	0f 84 95 00 00 00    	je     c0006092 <in_process+0x105>
c0005ffd:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0006004:	74 64                	je     c000606a <in_process+0xdd>
c0006006:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000600d:	77 0b                	ja     c000601a <in_process+0x8d>
c000600f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0006016:	74 64                	je     c000607c <in_process+0xef>
c0006018:	eb 73                	jmp    c000608d <in_process+0x100>
c000601a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0006021:	74 0b                	je     c000602e <in_process+0xa1>
c0006023:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c000602a:	74 20                	je     c000604c <in_process+0xbf>
c000602c:	eb 5f                	jmp    c000608d <in_process+0x100>
c000602e:	83 ec 0c             	sub    $0xc,%esp
c0006031:	ff 75 08             	pushl  0x8(%ebp)
c0006034:	e8 ba f3 ff ff       	call   c00053f3 <scroll_up>
c0006039:	83 c4 10             	add    $0x10,%esp
c000603c:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0006043:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c000604a:	eb 41                	jmp    c000608d <in_process+0x100>
c000604c:	83 ec 0c             	sub    $0xc,%esp
c000604f:	ff 75 08             	pushl  0x8(%ebp)
c0006052:	e8 de f3 ff ff       	call   c0005435 <scroll_down>
c0006057:	83 c4 10             	add    $0x10,%esp
c000605a:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0006061:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0006068:	eb 23                	jmp    c000608d <in_process+0x100>
c000606a:	83 ec 08             	sub    $0x8,%esp
c000606d:	6a 0a                	push   $0xa
c000606f:	ff 75 08             	pushl  0x8(%ebp)
c0006072:	e8 29 f4 ff ff       	call   c00054a0 <out_char>
c0006077:	83 c4 10             	add    $0x10,%esp
c000607a:	eb 11                	jmp    c000608d <in_process+0x100>
c000607c:	83 ec 08             	sub    $0x8,%esp
c000607f:	6a 08                	push   $0x8
c0006081:	ff 75 08             	pushl  0x8(%ebp)
c0006084:	e8 17 f4 ff ff       	call   c00054a0 <out_char>
c0006089:	83 c4 10             	add    $0x10,%esp
c000608c:	90                   	nop
c000608d:	e9 8a 00 00 00       	jmp    c000611c <in_process+0x18f>
c0006092:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0006099:	74 55                	je     c00060f0 <in_process+0x163>
c000609b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c00060a2:	77 14                	ja     c00060b8 <in_process+0x12b>
c00060a4:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c00060ab:	74 31                	je     c00060de <in_process+0x151>
c00060ad:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00060b4:	74 16                	je     c00060cc <in_process+0x13f>
c00060b6:	eb 64                	jmp    c000611c <in_process+0x18f>
c00060b8:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c00060bf:	74 3e                	je     c00060ff <in_process+0x172>
c00060c1:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c00060c8:	74 44                	je     c000610e <in_process+0x181>
c00060ca:	eb 50                	jmp    c000611c <in_process+0x18f>
c00060cc:	83 ec 08             	sub    $0x8,%esp
c00060cf:	6a 0a                	push   $0xa
c00060d1:	ff 75 08             	pushl  0x8(%ebp)
c00060d4:	e8 ae f2 ff ff       	call   c0005387 <put_key>
c00060d9:	83 c4 10             	add    $0x10,%esp
c00060dc:	eb 3e                	jmp    c000611c <in_process+0x18f>
c00060de:	83 ec 08             	sub    $0x8,%esp
c00060e1:	6a 08                	push   $0x8
c00060e3:	ff 75 08             	pushl  0x8(%ebp)
c00060e6:	e8 9c f2 ff ff       	call   c0005387 <put_key>
c00060eb:	83 c4 10             	add    $0x10,%esp
c00060ee:	eb 2c                	jmp    c000611c <in_process+0x18f>
c00060f0:	83 ec 0c             	sub    $0xc,%esp
c00060f3:	6a 00                	push   $0x0
c00060f5:	e8 5c f1 ff ff       	call   c0005256 <select_console>
c00060fa:	83 c4 10             	add    $0x10,%esp
c00060fd:	eb 1d                	jmp    c000611c <in_process+0x18f>
c00060ff:	83 ec 0c             	sub    $0xc,%esp
c0006102:	6a 01                	push   $0x1
c0006104:	e8 4d f1 ff ff       	call   c0005256 <select_console>
c0006109:	83 c4 10             	add    $0x10,%esp
c000610c:	eb 0e                	jmp    c000611c <in_process+0x18f>
c000610e:	83 ec 0c             	sub    $0xc,%esp
c0006111:	6a 02                	push   $0x2
c0006113:	e8 3e f1 ff ff       	call   c0005256 <select_console>
c0006118:	83 c4 10             	add    $0x10,%esp
c000611b:	90                   	nop
c000611c:	90                   	nop
c000611d:	c9                   	leave  
c000611e:	c3                   	ret    

c000611f <open>:
c000611f:	55                   	push   %ebp
c0006120:	89 e5                	mov    %esp,%ebp
c0006122:	83 ec 18             	sub    $0x18,%esp
c0006125:	83 ec 0c             	sub    $0xc,%esp
c0006128:	6a 6c                	push   $0x6c
c000612a:	e8 75 c8 ff ff       	call   c00029a4 <sys_malloc>
c000612f:	83 c4 10             	add    $0x10,%esp
c0006132:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006135:	83 ec 04             	sub    $0x4,%esp
c0006138:	6a 6c                	push   $0x6c
c000613a:	6a 00                	push   $0x0
c000613c:	ff 75 f4             	pushl  -0xc(%ebp)
c000613f:	e8 e7 59 00 00       	call   c000bb2b <Memset>
c0006144:	83 c4 10             	add    $0x10,%esp
c0006147:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000614a:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0006151:	83 ec 0c             	sub    $0xc,%esp
c0006154:	ff 75 08             	pushl  0x8(%ebp)
c0006157:	e8 c2 10 00 00       	call   c000721e <get_physical_address>
c000615c:	83 c4 10             	add    $0x10,%esp
c000615f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006162:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006165:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006168:	89 50 34             	mov    %edx,0x34(%eax)
c000616b:	8b 55 0c             	mov    0xc(%ebp),%edx
c000616e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006171:	89 50 64             	mov    %edx,0x64(%eax)
c0006174:	83 ec 0c             	sub    $0xc,%esp
c0006177:	ff 75 08             	pushl  0x8(%ebp)
c000617a:	e8 e5 59 00 00       	call   c000bb64 <Strlen>
c000617f:	83 c4 10             	add    $0x10,%esp
c0006182:	89 c2                	mov    %eax,%edx
c0006184:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006187:	89 50 30             	mov    %edx,0x30(%eax)
c000618a:	83 ec 04             	sub    $0x4,%esp
c000618d:	6a 02                	push   $0x2
c000618f:	ff 75 f4             	pushl  -0xc(%ebp)
c0006192:	6a 03                	push   $0x3
c0006194:	e8 9e 3d 00 00       	call   c0009f37 <send_rec>
c0006199:	83 c4 10             	add    $0x10,%esp
c000619c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000619f:	8b 40 40             	mov    0x40(%eax),%eax
c00061a2:	c9                   	leave  
c00061a3:	c3                   	ret    

c00061a4 <read>:
c00061a4:	55                   	push   %ebp
c00061a5:	89 e5                	mov    %esp,%ebp
c00061a7:	83 ec 18             	sub    $0x18,%esp
c00061aa:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00061b1:	83 ec 0c             	sub    $0xc,%esp
c00061b4:	ff 75 f4             	pushl  -0xc(%ebp)
c00061b7:	e8 e8 c7 ff ff       	call   c00029a4 <sys_malloc>
c00061bc:	83 c4 10             	add    $0x10,%esp
c00061bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061c2:	83 ec 0c             	sub    $0xc,%esp
c00061c5:	ff 75 0c             	pushl  0xc(%ebp)
c00061c8:	e8 51 10 00 00       	call   c000721e <get_physical_address>
c00061cd:	83 c4 10             	add    $0x10,%esp
c00061d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00061d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061d6:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c00061dd:	8b 55 08             	mov    0x8(%ebp),%edx
c00061e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061e3:	89 50 40             	mov    %edx,0x40(%eax)
c00061e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061e9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00061ec:	89 50 10             	mov    %edx,0x10(%eax)
c00061ef:	8b 55 10             	mov    0x10(%ebp),%edx
c00061f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061f5:	89 50 50             	mov    %edx,0x50(%eax)
c00061f8:	83 ec 04             	sub    $0x4,%esp
c00061fb:	6a 02                	push   $0x2
c00061fd:	ff 75 f0             	pushl  -0x10(%ebp)
c0006200:	6a 03                	push   $0x3
c0006202:	e8 30 3d 00 00       	call   c0009f37 <send_rec>
c0006207:	83 c4 10             	add    $0x10,%esp
c000620a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000620d:	8b 40 50             	mov    0x50(%eax),%eax
c0006210:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006213:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006216:	c9                   	leave  
c0006217:	c3                   	ret    

c0006218 <write>:
c0006218:	55                   	push   %ebp
c0006219:	89 e5                	mov    %esp,%ebp
c000621b:	83 ec 18             	sub    $0x18,%esp
c000621e:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0006225:	83 ec 0c             	sub    $0xc,%esp
c0006228:	ff 75 f4             	pushl  -0xc(%ebp)
c000622b:	e8 74 c7 ff ff       	call   c00029a4 <sys_malloc>
c0006230:	83 c4 10             	add    $0x10,%esp
c0006233:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006236:	83 ec 0c             	sub    $0xc,%esp
c0006239:	ff 75 0c             	pushl  0xc(%ebp)
c000623c:	e8 dd 0f 00 00       	call   c000721e <get_physical_address>
c0006241:	83 c4 10             	add    $0x10,%esp
c0006244:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006247:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000624a:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0006251:	8b 55 08             	mov    0x8(%ebp),%edx
c0006254:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006257:	89 50 40             	mov    %edx,0x40(%eax)
c000625a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000625d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006260:	89 50 10             	mov    %edx,0x10(%eax)
c0006263:	8b 55 10             	mov    0x10(%ebp),%edx
c0006266:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006269:	89 50 50             	mov    %edx,0x50(%eax)
c000626c:	83 ec 04             	sub    $0x4,%esp
c000626f:	6a 02                	push   $0x2
c0006271:	ff 75 f0             	pushl  -0x10(%ebp)
c0006274:	6a 03                	push   $0x3
c0006276:	e8 bc 3c 00 00       	call   c0009f37 <send_rec>
c000627b:	83 c4 10             	add    $0x10,%esp
c000627e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006281:	8b 40 50             	mov    0x50(%eax),%eax
c0006284:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006287:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000628a:	c9                   	leave  
c000628b:	c3                   	ret    

c000628c <close>:
c000628c:	55                   	push   %ebp
c000628d:	89 e5                	mov    %esp,%ebp
c000628f:	83 ec 78             	sub    $0x78,%esp
c0006292:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006299:	8b 45 08             	mov    0x8(%ebp),%eax
c000629c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000629f:	83 ec 04             	sub    $0x4,%esp
c00062a2:	6a 02                	push   $0x2
c00062a4:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062a7:	50                   	push   %eax
c00062a8:	6a 03                	push   $0x3
c00062aa:	e8 88 3c 00 00       	call   c0009f37 <send_rec>
c00062af:	83 c4 10             	add    $0x10,%esp
c00062b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00062b5:	83 f8 65             	cmp    $0x65,%eax
c00062b8:	74 19                	je     c00062d3 <close+0x47>
c00062ba:	6a 13                	push   $0x13
c00062bc:	68 0d b3 00 c0       	push   $0xc000b30d
c00062c1:	68 0d b3 00 c0       	push   $0xc000b30d
c00062c6:	68 19 b3 00 c0       	push   $0xc000b319
c00062cb:	e8 f7 33 00 00       	call   c00096c7 <assertion_failure>
c00062d0:	83 c4 10             	add    $0x10,%esp
c00062d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00062d6:	c9                   	leave  
c00062d7:	c3                   	ret    

c00062d8 <wait>:
c00062d8:	55                   	push   %ebp
c00062d9:	89 e5                	mov    %esp,%ebp
c00062db:	83 ec 78             	sub    $0x78,%esp
c00062de:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c00062e5:	83 ec 04             	sub    $0x4,%esp
c00062e8:	6a 01                	push   $0x1
c00062ea:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062ed:	50                   	push   %eax
c00062ee:	6a 03                	push   $0x3
c00062f0:	e8 42 3c 00 00       	call   c0009f37 <send_rec>
c00062f5:	83 c4 10             	add    $0x10,%esp
c00062f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00062fb:	89 c2                	mov    %eax,%edx
c00062fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006300:	89 10                	mov    %edx,(%eax)
c0006302:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006305:	83 f8 21             	cmp    $0x21,%eax
c0006308:	74 05                	je     c000630f <wait+0x37>
c000630a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000630d:	eb 05                	jmp    c0006314 <wait+0x3c>
c000630f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006314:	c9                   	leave  
c0006315:	c3                   	ret    

c0006316 <exit>:
c0006316:	55                   	push   %ebp
c0006317:	89 e5                	mov    %esp,%ebp
c0006319:	83 ec 78             	sub    $0x78,%esp
c000631c:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0006323:	8b 45 08             	mov    0x8(%ebp),%eax
c0006326:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006329:	83 ec 04             	sub    $0x4,%esp
c000632c:	6a 01                	push   $0x1
c000632e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006331:	50                   	push   %eax
c0006332:	6a 03                	push   $0x3
c0006334:	e8 fe 3b 00 00       	call   c0009f37 <send_rec>
c0006339:	83 c4 10             	add    $0x10,%esp
c000633c:	90                   	nop
c000633d:	c9                   	leave  
c000633e:	c3                   	ret    

c000633f <fork>:
c000633f:	55                   	push   %ebp
c0006340:	89 e5                	mov    %esp,%ebp
c0006342:	83 ec 78             	sub    $0x78,%esp
c0006345:	83 ec 04             	sub    $0x4,%esp
c0006348:	6a 6c                	push   $0x6c
c000634a:	6a 00                	push   $0x0
c000634c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000634f:	50                   	push   %eax
c0006350:	e8 d6 57 00 00       	call   c000bb2b <Memset>
c0006355:	83 c4 10             	add    $0x10,%esp
c0006358:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c000635f:	83 ec 04             	sub    $0x4,%esp
c0006362:	6a 01                	push   $0x1
c0006364:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006367:	50                   	push   %eax
c0006368:	6a 03                	push   $0x3
c000636a:	e8 c8 3b 00 00       	call   c0009f37 <send_rec>
c000636f:	83 c4 10             	add    $0x10,%esp
c0006372:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006379:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000637c:	85 c0                	test   %eax,%eax
c000637e:	74 19                	je     c0006399 <fork+0x5a>
c0006380:	6a 14                	push   $0x14
c0006382:	68 31 b3 00 c0       	push   $0xc000b331
c0006387:	68 31 b3 00 c0       	push   $0xc000b331
c000638c:	68 3c b3 00 c0       	push   $0xc000b33c
c0006391:	e8 31 33 00 00       	call   c00096c7 <assertion_failure>
c0006396:	83 c4 10             	add    $0x10,%esp
c0006399:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000639c:	c9                   	leave  
c000639d:	c3                   	ret    

c000639e <getpid>:
c000639e:	55                   	push   %ebp
c000639f:	89 e5                	mov    %esp,%ebp
c00063a1:	83 ec 78             	sub    $0x78,%esp
c00063a4:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c00063ab:	83 ec 04             	sub    $0x4,%esp
c00063ae:	6a 05                	push   $0x5
c00063b0:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00063b3:	50                   	push   %eax
c00063b4:	6a 03                	push   $0x3
c00063b6:	e8 7c 3b 00 00       	call   c0009f37 <send_rec>
c00063bb:	83 c4 10             	add    $0x10,%esp
c00063be:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00063c1:	c9                   	leave  
c00063c2:	c3                   	ret    

c00063c3 <exec>:
c00063c3:	55                   	push   %ebp
c00063c4:	89 e5                	mov    %esp,%ebp
c00063c6:	83 ec 78             	sub    $0x78,%esp
c00063c9:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c00063d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00063d3:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00063d6:	83 ec 0c             	sub    $0xc,%esp
c00063d9:	ff 75 08             	pushl  0x8(%ebp)
c00063dc:	e8 83 57 00 00       	call   c000bb64 <Strlen>
c00063e1:	83 c4 10             	add    $0x10,%esp
c00063e4:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00063e7:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c00063ee:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c00063f5:	83 ec 04             	sub    $0x4,%esp
c00063f8:	6a 01                	push   $0x1
c00063fa:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00063fd:	50                   	push   %eax
c00063fe:	6a 03                	push   $0x3
c0006400:	e8 32 3b 00 00       	call   c0009f37 <send_rec>
c0006405:	83 c4 10             	add    $0x10,%esp
c0006408:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000640b:	83 f8 65             	cmp    $0x65,%eax
c000640e:	74 19                	je     c0006429 <exec+0x66>
c0006410:	6a 19                	push   $0x19
c0006412:	68 4c b3 00 c0       	push   $0xc000b34c
c0006417:	68 4c b3 00 c0       	push   $0xc000b34c
c000641c:	68 57 b3 00 c0       	push   $0xc000b357
c0006421:	e8 a1 32 00 00       	call   c00096c7 <assertion_failure>
c0006426:	83 c4 10             	add    $0x10,%esp
c0006429:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000642c:	c9                   	leave  
c000642d:	c3                   	ret    

c000642e <execv>:
c000642e:	55                   	push   %ebp
c000642f:	89 e5                	mov    %esp,%ebp
c0006431:	57                   	push   %edi
c0006432:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0006438:	83 ec 04             	sub    $0x4,%esp
c000643b:	68 00 80 00 00       	push   $0x8000
c0006440:	6a 00                	push   $0x0
c0006442:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006448:	50                   	push   %eax
c0006449:	e8 dd 56 00 00       	call   c000bb2b <Memset>
c000644e:	83 c4 10             	add    $0x10,%esp
c0006451:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006454:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006457:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000645e:	eb 0d                	jmp    c000646d <execv+0x3f>
c0006460:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0006464:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006467:	83 c0 04             	add    $0x4,%eax
c000646a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000646d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006470:	8b 00                	mov    (%eax),%eax
c0006472:	85 c0                	test   %eax,%eax
c0006474:	75 ea                	jne    c0006460 <execv+0x32>
c0006476:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000647c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000647f:	01 d0                	add    %edx,%eax
c0006481:	c6 00 00             	movb   $0x0,(%eax)
c0006484:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006487:	83 c0 04             	add    $0x4,%eax
c000648a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000648d:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006493:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006496:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006499:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000649c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00064a3:	eb 64                	jmp    c0006509 <execv+0xdb>
c00064a5:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00064ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064ae:	01 c2                	add    %eax,%edx
c00064b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00064b3:	89 10                	mov    %edx,(%eax)
c00064b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00064b8:	8b 00                	mov    (%eax),%eax
c00064ba:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c00064c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00064c3:	01 ca                	add    %ecx,%edx
c00064c5:	83 ec 08             	sub    $0x8,%esp
c00064c8:	50                   	push   %eax
c00064c9:	52                   	push   %edx
c00064ca:	e8 7b 56 00 00       	call   c000bb4a <Strcpy>
c00064cf:	83 c4 10             	add    $0x10,%esp
c00064d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00064d5:	8b 00                	mov    (%eax),%eax
c00064d7:	83 ec 0c             	sub    $0xc,%esp
c00064da:	50                   	push   %eax
c00064db:	e8 84 56 00 00       	call   c000bb64 <Strlen>
c00064e0:	83 c4 10             	add    $0x10,%esp
c00064e3:	01 45 f0             	add    %eax,-0x10(%ebp)
c00064e6:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00064ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064ef:	01 d0                	add    %edx,%eax
c00064f1:	c6 00 00             	movb   $0x0,(%eax)
c00064f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064f7:	83 c0 01             	add    $0x1,%eax
c00064fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00064fd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0006501:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0006505:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006509:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000650c:	8b 00                	mov    (%eax),%eax
c000650e:	85 c0                	test   %eax,%eax
c0006510:	75 93                	jne    c00064a5 <execv+0x77>
c0006512:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006518:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000651b:	eb 04                	jmp    c0006521 <execv+0xf3>
c000651d:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0006521:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006524:	8b 00                	mov    (%eax),%eax
c0006526:	85 c0                	test   %eax,%eax
c0006528:	75 f3                	jne    c000651d <execv+0xef>
c000652a:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0006530:	b8 00 00 00 00       	mov    $0x0,%eax
c0006535:	b9 0a 00 00 00       	mov    $0xa,%ecx
c000653a:	89 d7                	mov    %edx,%edi
c000653c:	f3 ab                	rep stos %eax,%es:(%edi)
c000653e:	c7 85 4c 7f ff ff 6f 	movl   $0xc000b36f,-0x80b4(%ebp)
c0006545:	b3 00 c0 
c0006548:	c7 85 50 7f ff ff 76 	movl   $0xc000b376,-0x80b0(%ebp)
c000654f:	b3 00 c0 
c0006552:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0006559:	00 00 00 
c000655c:	8b 45 08             	mov    0x8(%ebp),%eax
c000655f:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0006565:	83 ec 0c             	sub    $0xc,%esp
c0006568:	ff 75 08             	pushl  0x8(%ebp)
c000656b:	e8 f4 55 00 00       	call   c000bb64 <Strlen>
c0006570:	83 c4 10             	add    $0x10,%esp
c0006573:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0006579:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000657f:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0006585:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006588:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c000658e:	83 ec 04             	sub    $0x4,%esp
c0006591:	6a 01                	push   $0x1
c0006593:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0006599:	50                   	push   %eax
c000659a:	6a 03                	push   $0x3
c000659c:	e8 96 39 00 00       	call   c0009f37 <send_rec>
c00065a1:	83 c4 10             	add    $0x10,%esp
c00065a4:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c00065aa:	83 f8 65             	cmp    $0x65,%eax
c00065ad:	74 19                	je     c00065c8 <execv+0x19a>
c00065af:	6a 72                	push   $0x72
c00065b1:	68 4c b3 00 c0       	push   $0xc000b34c
c00065b6:	68 4c b3 00 c0       	push   $0xc000b34c
c00065bb:	68 57 b3 00 c0       	push   $0xc000b357
c00065c0:	e8 02 31 00 00       	call   c00096c7 <assertion_failure>
c00065c5:	83 c4 10             	add    $0x10,%esp
c00065c8:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c00065ce:	8b 7d fc             	mov    -0x4(%ebp),%edi
c00065d1:	c9                   	leave  
c00065d2:	c3                   	ret    

c00065d3 <execl>:
c00065d3:	55                   	push   %ebp
c00065d4:	89 e5                	mov    %esp,%ebp
c00065d6:	83 ec 18             	sub    $0x18,%esp
c00065d9:	8d 45 0c             	lea    0xc(%ebp),%eax
c00065dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00065df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00065e5:	83 ec 08             	sub    $0x8,%esp
c00065e8:	ff 75 f0             	pushl  -0x10(%ebp)
c00065eb:	ff 75 08             	pushl  0x8(%ebp)
c00065ee:	e8 3b fe ff ff       	call   c000642e <execv>
c00065f3:	83 c4 10             	add    $0x10,%esp
c00065f6:	c9                   	leave  
c00065f7:	c3                   	ret    

c00065f8 <TaskMM>:
c00065f8:	55                   	push   %ebp
c00065f9:	89 e5                	mov    %esp,%ebp
c00065fb:	83 ec 28             	sub    $0x28,%esp
c00065fe:	83 ec 0c             	sub    $0xc,%esp
c0006601:	6a 6c                	push   $0x6c
c0006603:	e8 9c c3 ff ff       	call   c00029a4 <sys_malloc>
c0006608:	83 c4 10             	add    $0x10,%esp
c000660b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000660e:	83 ec 0c             	sub    $0xc,%esp
c0006611:	6a 6c                	push   $0x6c
c0006613:	e8 8c c3 ff ff       	call   c00029a4 <sys_malloc>
c0006618:	83 c4 10             	add    $0x10,%esp
c000661b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000661e:	83 ec 04             	sub    $0x4,%esp
c0006621:	6a 12                	push   $0x12
c0006623:	ff 75 f0             	pushl  -0x10(%ebp)
c0006626:	6a 02                	push   $0x2
c0006628:	e8 0a 39 00 00       	call   c0009f37 <send_rec>
c000662d:	83 c4 10             	add    $0x10,%esp
c0006630:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006633:	8b 40 68             	mov    0x68(%eax),%eax
c0006636:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006639:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000663c:	8b 00                	mov    (%eax),%eax
c000663e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006641:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006648:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000664b:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0006652:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006655:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c000665c:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006660:	74 4b                	je     c00066ad <TaskMM+0xb5>
c0006662:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006666:	7f 08                	jg     c0006670 <TaskMM+0x78>
c0006668:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c000666c:	74 28                	je     c0006696 <TaskMM+0x9e>
c000666e:	eb 6e                	jmp    c00066de <TaskMM+0xe6>
c0006670:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0006674:	74 08                	je     c000667e <TaskMM+0x86>
c0006676:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c000667a:	74 4b                	je     c00066c7 <TaskMM+0xcf>
c000667c:	eb 60                	jmp    c00066de <TaskMM+0xe6>
c000667e:	83 ec 0c             	sub    $0xc,%esp
c0006681:	ff 75 f0             	pushl  -0x10(%ebp)
c0006684:	e8 e6 03 00 00       	call   c0006a6f <do_fork>
c0006689:	83 c4 10             	add    $0x10,%esp
c000668c:	89 c2                	mov    %eax,%edx
c000668e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006691:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006694:	eb 59                	jmp    c00066ef <TaskMM+0xf7>
c0006696:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000669d:	83 ec 0c             	sub    $0xc,%esp
c00066a0:	ff 75 f0             	pushl  -0x10(%ebp)
c00066a3:	e8 96 00 00 00       	call   c000673e <do_exec>
c00066a8:	83 c4 10             	add    $0x10,%esp
c00066ab:	eb 42                	jmp    c00066ef <TaskMM+0xf7>
c00066ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00066b4:	83 ec 08             	sub    $0x8,%esp
c00066b7:	ff 75 e0             	pushl  -0x20(%ebp)
c00066ba:	ff 75 f0             	pushl  -0x10(%ebp)
c00066bd:	e8 18 04 00 00       	call   c0006ada <do_exit>
c00066c2:	83 c4 10             	add    $0x10,%esp
c00066c5:	eb 28                	jmp    c00066ef <TaskMM+0xf7>
c00066c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00066ce:	83 ec 0c             	sub    $0xc,%esp
c00066d1:	ff 75 f0             	pushl  -0x10(%ebp)
c00066d4:	e8 fd 04 00 00       	call   c0006bd6 <do_wait>
c00066d9:	83 c4 10             	add    $0x10,%esp
c00066dc:	eb 11                	jmp    c00066ef <TaskMM+0xf7>
c00066de:	83 ec 0c             	sub    $0xc,%esp
c00066e1:	68 7d b3 00 c0       	push   $0xc000b37d
c00066e6:	e8 be 2f 00 00       	call   c00096a9 <panic>
c00066eb:	83 c4 10             	add    $0x10,%esp
c00066ee:	90                   	nop
c00066ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00066f3:	0f 84 25 ff ff ff    	je     c000661e <TaskMM+0x26>
c00066f9:	83 ec 0c             	sub    $0xc,%esp
c00066fc:	6a 0a                	push   $0xa
c00066fe:	e8 33 2b 00 00       	call   c0009236 <delay>
c0006703:	83 c4 10             	add    $0x10,%esp
c0006706:	e9 13 ff ff ff       	jmp    c000661e <TaskMM+0x26>

c000670b <alloc_mem>:
c000670b:	55                   	push   %ebp
c000670c:	89 e5                	mov    %esp,%ebp
c000670e:	83 ec 10             	sub    $0x10,%esp
c0006711:	8b 45 08             	mov    0x8(%ebp),%eax
c0006714:	83 e8 08             	sub    $0x8,%eax
c0006717:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c000671d:	05 00 00 a0 00       	add    $0xa00000,%eax
c0006722:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006725:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006728:	c9                   	leave  
c0006729:	c3                   	ret    

c000672a <do_exec2>:
c000672a:	55                   	push   %ebp
c000672b:	89 e5                	mov    %esp,%ebp
c000672d:	83 ec 10             	sub    $0x10,%esp
c0006730:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006737:	b8 00 00 00 00       	mov    $0x0,%eax
c000673c:	c9                   	leave  
c000673d:	c3                   	ret    

c000673e <do_exec>:
c000673e:	55                   	push   %ebp
c000673f:	89 e5                	mov    %esp,%ebp
c0006741:	56                   	push   %esi
c0006742:	53                   	push   %ebx
c0006743:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0006749:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0006750:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0006757:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c000675d:	83 ec 08             	sub    $0x8,%esp
c0006760:	6a 00                	push   $0x0
c0006762:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c0006765:	50                   	push   %eax
c0006766:	e8 b4 f9 ff ff       	call   c000611f <open>
c000676b:	83 c4 10             	add    $0x10,%esp
c000676e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006771:	8b 45 08             	mov    0x8(%ebp),%eax
c0006774:	8b 00                	mov    (%eax),%eax
c0006776:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006779:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0006780:	83 ec 04             	sub    $0x4,%esp
c0006783:	6a 0c                	push   $0xc
c0006785:	6a 00                	push   $0x0
c0006787:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000678d:	50                   	push   %eax
c000678e:	e8 98 53 00 00       	call   c000bb2b <Memset>
c0006793:	83 c4 10             	add    $0x10,%esp
c0006796:	8b 45 08             	mov    0x8(%ebp),%eax
c0006799:	8b 40 30             	mov    0x30(%eax),%eax
c000679c:	89 c6                	mov    %eax,%esi
c000679e:	8b 45 08             	mov    0x8(%ebp),%eax
c00067a1:	8b 40 34             	mov    0x34(%eax),%eax
c00067a4:	83 ec 08             	sub    $0x8,%esp
c00067a7:	50                   	push   %eax
c00067a8:	ff 75 d8             	pushl  -0x28(%ebp)
c00067ab:	e8 0e e8 ff ff       	call   c0004fbe <v2l>
c00067b0:	83 c4 10             	add    $0x10,%esp
c00067b3:	89 c3                	mov    %eax,%ebx
c00067b5:	83 ec 08             	sub    $0x8,%esp
c00067b8:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00067be:	50                   	push   %eax
c00067bf:	6a 01                	push   $0x1
c00067c1:	e8 f8 e7 ff ff       	call   c0004fbe <v2l>
c00067c6:	83 c4 10             	add    $0x10,%esp
c00067c9:	83 ec 04             	sub    $0x4,%esp
c00067cc:	56                   	push   %esi
c00067cd:	53                   	push   %ebx
c00067ce:	50                   	push   %eax
c00067cf:	e8 34 14 00 00       	call   c0007c08 <Memcpy>
c00067d4:	83 c4 10             	add    $0x10,%esp
c00067d7:	83 ec 08             	sub    $0x8,%esp
c00067da:	6a 00                	push   $0x0
c00067dc:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00067e2:	50                   	push   %eax
c00067e3:	e8 37 f9 ff ff       	call   c000611f <open>
c00067e8:	83 c4 10             	add    $0x10,%esp
c00067eb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00067ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00067f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067f8:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00067fe:	01 d0                	add    %edx,%eax
c0006800:	83 ec 04             	sub    $0x4,%esp
c0006803:	68 00 02 00 00       	push   $0x200
c0006808:	50                   	push   %eax
c0006809:	ff 75 d0             	pushl  -0x30(%ebp)
c000680c:	e8 93 f9 ff ff       	call   c00061a4 <read>
c0006811:	83 c4 10             	add    $0x10,%esp
c0006814:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006817:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000681a:	01 45 f4             	add    %eax,-0xc(%ebp)
c000681d:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0006821:	74 02                	je     c0006825 <do_exec+0xe7>
c0006823:	eb d0                	jmp    c00067f5 <do_exec+0xb7>
c0006825:	90                   	nop
c0006826:	83 ec 0c             	sub    $0xc,%esp
c0006829:	ff 75 d0             	pushl  -0x30(%ebp)
c000682c:	e8 5b fa ff ff       	call   c000628c <close>
c0006831:	83 c4 10             	add    $0x10,%esp
c0006834:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c000683a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000683d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006844:	eb 72                	jmp    c00068b8 <do_exec+0x17a>
c0006846:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006849:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c000684d:	0f b7 d0             	movzwl %ax,%edx
c0006850:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006853:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006857:	0f b7 c0             	movzwl %ax,%eax
c000685a:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c000685e:	01 c2                	add    %eax,%edx
c0006860:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0006866:	01 d0                	add    %edx,%eax
c0006868:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000686b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000686e:	8b 40 10             	mov    0x10(%eax),%eax
c0006871:	89 c6                	mov    %eax,%esi
c0006873:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006876:	8b 40 04             	mov    0x4(%eax),%eax
c0006879:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000687f:	01 d0                	add    %edx,%eax
c0006881:	83 ec 08             	sub    $0x8,%esp
c0006884:	50                   	push   %eax
c0006885:	6a 01                	push   $0x1
c0006887:	e8 32 e7 ff ff       	call   c0004fbe <v2l>
c000688c:	83 c4 10             	add    $0x10,%esp
c000688f:	89 c3                	mov    %eax,%ebx
c0006891:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006894:	8b 40 08             	mov    0x8(%eax),%eax
c0006897:	83 ec 08             	sub    $0x8,%esp
c000689a:	50                   	push   %eax
c000689b:	ff 75 d8             	pushl  -0x28(%ebp)
c000689e:	e8 1b e7 ff ff       	call   c0004fbe <v2l>
c00068a3:	83 c4 10             	add    $0x10,%esp
c00068a6:	83 ec 04             	sub    $0x4,%esp
c00068a9:	56                   	push   %esi
c00068aa:	53                   	push   %ebx
c00068ab:	50                   	push   %eax
c00068ac:	e8 57 13 00 00       	call   c0007c08 <Memcpy>
c00068b1:	83 c4 10             	add    $0x10,%esp
c00068b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00068b8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00068bb:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00068bf:	0f b7 c0             	movzwl %ax,%eax
c00068c2:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00068c5:	0f 8c 7b ff ff ff    	jl     c0006846 <do_exec+0x108>
c00068cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00068ce:	8b 40 10             	mov    0x10(%eax),%eax
c00068d1:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00068d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00068d7:	8b 40 1c             	mov    0x1c(%eax),%eax
c00068da:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00068dd:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c00068e4:	83 ec 08             	sub    $0x8,%esp
c00068e7:	ff 75 c0             	pushl  -0x40(%ebp)
c00068ea:	ff 75 d8             	pushl  -0x28(%ebp)
c00068ed:	e8 cc e6 ff ff       	call   c0004fbe <v2l>
c00068f2:	83 c4 10             	add    $0x10,%esp
c00068f5:	89 c3                	mov    %eax,%ebx
c00068f7:	83 ec 08             	sub    $0x8,%esp
c00068fa:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006900:	50                   	push   %eax
c0006901:	6a 01                	push   $0x1
c0006903:	e8 b6 e6 ff ff       	call   c0004fbe <v2l>
c0006908:	83 c4 10             	add    $0x10,%esp
c000690b:	83 ec 04             	sub    $0x4,%esp
c000690e:	ff 75 bc             	pushl  -0x44(%ebp)
c0006911:	53                   	push   %ebx
c0006912:	50                   	push   %eax
c0006913:	e8 f0 12 00 00       	call   c0007c08 <Memcpy>
c0006918:	83 c4 10             	add    $0x10,%esp
c000691b:	83 ec 08             	sub    $0x8,%esp
c000691e:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006924:	50                   	push   %eax
c0006925:	6a 01                	push   $0x1
c0006927:	e8 92 e6 ff ff       	call   c0004fbe <v2l>
c000692c:	83 c4 10             	add    $0x10,%esp
c000692f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006932:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006935:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006938:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000693f:	eb 08                	jmp    c0006949 <do_exec+0x20b>
c0006941:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006945:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0006949:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000694c:	8b 00                	mov    (%eax),%eax
c000694e:	85 c0                	test   %eax,%eax
c0006950:	75 ef                	jne    c0006941 <do_exec+0x203>
c0006952:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006955:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006958:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000695b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006962:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006968:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000696b:	eb 17                	jmp    c0006984 <do_exec+0x246>
c000696d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006971:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006974:	8b 10                	mov    (%eax),%edx
c0006976:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006979:	01 c2                	add    %eax,%edx
c000697b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000697e:	89 10                	mov    %edx,(%eax)
c0006980:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0006984:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006987:	8b 00                	mov    (%eax),%eax
c0006989:	85 c0                	test   %eax,%eax
c000698b:	75 e0                	jne    c000696d <do_exec+0x22f>
c000698d:	83 ec 08             	sub    $0x8,%esp
c0006990:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006996:	50                   	push   %eax
c0006997:	6a 01                	push   $0x1
c0006999:	e8 20 e6 ff ff       	call   c0004fbe <v2l>
c000699e:	83 c4 10             	add    $0x10,%esp
c00069a1:	89 c3                	mov    %eax,%ebx
c00069a3:	83 ec 08             	sub    $0x8,%esp
c00069a6:	ff 75 b8             	pushl  -0x48(%ebp)
c00069a9:	ff 75 d8             	pushl  -0x28(%ebp)
c00069ac:	e8 0d e6 ff ff       	call   c0004fbe <v2l>
c00069b1:	83 c4 10             	add    $0x10,%esp
c00069b4:	83 ec 04             	sub    $0x4,%esp
c00069b7:	ff 75 bc             	pushl  -0x44(%ebp)
c00069ba:	53                   	push   %ebx
c00069bb:	50                   	push   %eax
c00069bc:	e8 47 12 00 00       	call   c0007c08 <Memcpy>
c00069c1:	83 c4 10             	add    $0x10,%esp
c00069c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00069c7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00069ca:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00069cd:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00069d0:	69 d2 b4 02 00 00    	imul   $0x2b4,%edx,%edx
c00069d6:	81 c2 98 34 08 c0    	add    $0xc0083498,%edx
c00069dc:	89 02                	mov    %eax,(%edx)
c00069de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00069e1:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00069e4:	69 d2 b4 02 00 00    	imul   $0x2b4,%edx,%edx
c00069ea:	81 c2 94 34 08 c0    	add    $0xc0083494,%edx
c00069f0:	89 02                	mov    %eax,(%edx)
c00069f2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00069f5:	8b 40 18             	mov    0x18(%eax),%eax
c00069f8:	89 c2                	mov    %eax,%edx
c00069fa:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00069fd:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a03:	05 9c 34 08 c0       	add    $0xc008349c,%eax
c0006a08:	89 10                	mov    %edx,(%eax)
c0006a0a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006a0d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006a10:	69 d2 b4 02 00 00    	imul   $0x2b4,%edx,%edx
c0006a16:	81 c2 a8 34 08 c0    	add    $0xc00834a8,%edx
c0006a1c:	89 02                	mov    %eax,(%edx)
c0006a1e:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006a21:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a27:	05 50 34 08 c0       	add    $0xc0083450,%eax
c0006a2c:	c7 00 21 00 00 00    	movl   $0x21,(%eax)
c0006a32:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c0006a39:	00 00 00 
c0006a3c:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0006a43:	00 00 00 
c0006a46:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c0006a4d:	00 00 00 
c0006a50:	83 ec 04             	sub    $0x4,%esp
c0006a53:	ff 75 d8             	pushl  -0x28(%ebp)
c0006a56:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c0006a5c:	50                   	push   %eax
c0006a5d:	6a 01                	push   $0x1
c0006a5f:	e8 d3 34 00 00       	call   c0009f37 <send_rec>
c0006a64:	83 c4 10             	add    $0x10,%esp
c0006a67:	90                   	nop
c0006a68:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0006a6b:	5b                   	pop    %ebx
c0006a6c:	5e                   	pop    %esi
c0006a6d:	5d                   	pop    %ebp
c0006a6e:	c3                   	ret    

c0006a6f <do_fork>:
c0006a6f:	55                   	push   %ebp
c0006a70:	89 e5                	mov    %esp,%ebp
c0006a72:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006a78:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a7b:	8b 00                	mov    (%eax),%eax
c0006a7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a80:	83 ec 0c             	sub    $0xc,%esp
c0006a83:	ff 75 f4             	pushl  -0xc(%ebp)
c0006a86:	e8 10 3d 00 00       	call   c000a79b <fork_process>
c0006a8b:	83 c4 10             	add    $0x10,%esp
c0006a8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a91:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a94:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0006a9a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006aa0:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006aa6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006aa9:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006aac:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006ab3:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006aba:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006ac1:	83 ec 04             	sub    $0x4,%esp
c0006ac4:	ff 75 ec             	pushl  -0x14(%ebp)
c0006ac7:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006aca:	50                   	push   %eax
c0006acb:	6a 01                	push   $0x1
c0006acd:	e8 65 34 00 00       	call   c0009f37 <send_rec>
c0006ad2:	83 c4 10             	add    $0x10,%esp
c0006ad5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ad8:	c9                   	leave  
c0006ad9:	c3                   	ret    

c0006ada <do_exit>:
c0006ada:	55                   	push   %ebp
c0006adb:	89 e5                	mov    %esp,%ebp
c0006add:	83 ec 18             	sub    $0x18,%esp
c0006ae0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ae3:	8b 00                	mov    (%eax),%eax
c0006ae5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ae8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006aeb:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006af1:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006af6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006af9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006afc:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006b02:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b05:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b08:	8b 40 44             	mov    0x44(%eax),%eax
c0006b0b:	89 c2                	mov    %eax,%edx
c0006b0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b10:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006b16:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b19:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b1f:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b24:	0f b6 00             	movzbl (%eax),%eax
c0006b27:	3c 04                	cmp    $0x4,%al
c0006b29:	75 21                	jne    c0006b4c <do_exit+0x72>
c0006b2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b2e:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b34:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b39:	c6 00 fb             	movb   $0xfb,(%eax)
c0006b3c:	83 ec 0c             	sub    $0xc,%esp
c0006b3f:	ff 75 ec             	pushl  -0x14(%ebp)
c0006b42:	e8 59 01 00 00       	call   c0006ca0 <cleanup>
c0006b47:	83 c4 10             	add    $0x10,%esp
c0006b4a:	eb 0a                	jmp    c0006b56 <do_exit+0x7c>
c0006b4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b4f:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0006b56:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006b5d:	eb 6e                	jmp    c0006bcd <do_exit+0xf3>
c0006b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b62:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b68:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b6d:	8b 00                	mov    (%eax),%eax
c0006b6f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006b72:	75 55                	jne    c0006bc9 <do_exit+0xef>
c0006b74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b77:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b7d:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b82:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0006b88:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c0006b8f:	3c 04                	cmp    $0x4,%al
c0006b91:	75 36                	jne    c0006bc9 <do_exit+0xef>
c0006b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b96:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b9c:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006ba1:	0f b6 00             	movzbl (%eax),%eax
c0006ba4:	3c 03                	cmp    $0x3,%al
c0006ba6:	75 21                	jne    c0006bc9 <do_exit+0xef>
c0006ba8:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c0006baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bb2:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006bb8:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006bbd:	83 ec 0c             	sub    $0xc,%esp
c0006bc0:	50                   	push   %eax
c0006bc1:	e8 da 00 00 00       	call   c0006ca0 <cleanup>
c0006bc6:	83 c4 10             	add    $0x10,%esp
c0006bc9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006bcd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006bd1:	7e 8c                	jle    c0006b5f <do_exit+0x85>
c0006bd3:	90                   	nop
c0006bd4:	c9                   	leave  
c0006bd5:	c3                   	ret    

c0006bd6 <do_wait>:
c0006bd6:	55                   	push   %ebp
c0006bd7:	89 e5                	mov    %esp,%ebp
c0006bd9:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006be2:	8b 00                	mov    (%eax),%eax
c0006be4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006be7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006bee:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006bf5:	eb 5f                	jmp    c0006c56 <do_wait+0x80>
c0006bf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006bfa:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c00:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006c05:	8b 00                	mov    (%eax),%eax
c0006c07:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006c0a:	75 46                	jne    c0006c52 <do_wait+0x7c>
c0006c0c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006c10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c13:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c19:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006c1e:	0f b6 00             	movzbl (%eax),%eax
c0006c21:	3c 03                	cmp    $0x3,%al
c0006c23:	75 2d                	jne    c0006c52 <do_wait+0x7c>
c0006c25:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c28:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c2e:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006c33:	c6 00 fb             	movb   $0xfb,(%eax)
c0006c36:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c39:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c3f:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006c44:	83 ec 0c             	sub    $0xc,%esp
c0006c47:	50                   	push   %eax
c0006c48:	e8 53 00 00 00       	call   c0006ca0 <cleanup>
c0006c4d:	83 c4 10             	add    $0x10,%esp
c0006c50:	eb 4c                	jmp    c0006c9e <do_wait+0xc8>
c0006c52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006c56:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006c5a:	7e 9b                	jle    c0006bf7 <do_wait+0x21>
c0006c5c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006c60:	74 13                	je     c0006c75 <do_wait+0x9f>
c0006c62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c65:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006c6b:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006c70:	c6 00 04             	movb   $0x4,(%eax)
c0006c73:	eb 29                	jmp    c0006c9e <do_wait+0xc8>
c0006c75:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006c7c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006c83:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006c8a:	83 ec 04             	sub    $0x4,%esp
c0006c8d:	ff 75 ec             	pushl  -0x14(%ebp)
c0006c90:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006c93:	50                   	push   %eax
c0006c94:	6a 01                	push   $0x1
c0006c96:	e8 9c 32 00 00       	call   c0009f37 <send_rec>
c0006c9b:	83 c4 10             	add    $0x10,%esp
c0006c9e:	c9                   	leave  
c0006c9f:	c3                   	ret    

c0006ca0 <cleanup>:
c0006ca0:	55                   	push   %ebp
c0006ca1:	89 e5                	mov    %esp,%ebp
c0006ca3:	83 ec 78             	sub    $0x78,%esp
c0006ca6:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006cad:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006cb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cb7:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006cbd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006cc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cc3:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006cc9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006ccc:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ccf:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006cd5:	83 ec 04             	sub    $0x4,%esp
c0006cd8:	50                   	push   %eax
c0006cd9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006cdc:	50                   	push   %eax
c0006cdd:	6a 01                	push   $0x1
c0006cdf:	e8 53 32 00 00       	call   c0009f37 <send_rec>
c0006ce4:	83 c4 10             	add    $0x10,%esp
c0006ce7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cea:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006cf1:	90                   	nop
c0006cf2:	c9                   	leave  
c0006cf3:	c3                   	ret    

c0006cf4 <init_bitmap>:
c0006cf4:	55                   	push   %ebp
c0006cf5:	89 e5                	mov    %esp,%ebp
c0006cf7:	83 ec 08             	sub    $0x8,%esp
c0006cfa:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cfd:	8b 50 04             	mov    0x4(%eax),%edx
c0006d00:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d03:	8b 00                	mov    (%eax),%eax
c0006d05:	83 ec 04             	sub    $0x4,%esp
c0006d08:	52                   	push   %edx
c0006d09:	6a 00                	push   $0x0
c0006d0b:	50                   	push   %eax
c0006d0c:	e8 1a 4e 00 00       	call   c000bb2b <Memset>
c0006d11:	83 c4 10             	add    $0x10,%esp
c0006d14:	90                   	nop
c0006d15:	c9                   	leave  
c0006d16:	c3                   	ret    

c0006d17 <test_bit_val>:
c0006d17:	55                   	push   %ebp
c0006d18:	89 e5                	mov    %esp,%ebp
c0006d1a:	53                   	push   %ebx
c0006d1b:	83 ec 10             	sub    $0x10,%esp
c0006d1e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d21:	8d 50 07             	lea    0x7(%eax),%edx
c0006d24:	85 c0                	test   %eax,%eax
c0006d26:	0f 48 c2             	cmovs  %edx,%eax
c0006d29:	c1 f8 03             	sar    $0x3,%eax
c0006d2c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d32:	99                   	cltd   
c0006d33:	c1 ea 1d             	shr    $0x1d,%edx
c0006d36:	01 d0                	add    %edx,%eax
c0006d38:	83 e0 07             	and    $0x7,%eax
c0006d3b:	29 d0                	sub    %edx,%eax
c0006d3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d43:	8b 10                	mov    (%eax),%edx
c0006d45:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d48:	01 d0                	add    %edx,%eax
c0006d4a:	0f b6 00             	movzbl (%eax),%eax
c0006d4d:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006d50:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d57:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006d5c:	89 c1                	mov    %eax,%ecx
c0006d5e:	d3 e3                	shl    %cl,%ebx
c0006d60:	89 d8                	mov    %ebx,%eax
c0006d62:	21 c2                	and    %eax,%edx
c0006d64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d67:	89 c1                	mov    %eax,%ecx
c0006d69:	d3 fa                	sar    %cl,%edx
c0006d6b:	89 d0                	mov    %edx,%eax
c0006d6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d70:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006d74:	0f 9f c0             	setg   %al
c0006d77:	0f b6 c0             	movzbl %al,%eax
c0006d7a:	83 c4 10             	add    $0x10,%esp
c0006d7d:	5b                   	pop    %ebx
c0006d7e:	5d                   	pop    %ebp
c0006d7f:	c3                   	ret    

c0006d80 <set_bit_val>:
c0006d80:	55                   	push   %ebp
c0006d81:	89 e5                	mov    %esp,%ebp
c0006d83:	83 ec 10             	sub    $0x10,%esp
c0006d86:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d89:	8d 50 07             	lea    0x7(%eax),%edx
c0006d8c:	85 c0                	test   %eax,%eax
c0006d8e:	0f 48 c2             	cmovs  %edx,%eax
c0006d91:	c1 f8 03             	sar    $0x3,%eax
c0006d94:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d97:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d9a:	99                   	cltd   
c0006d9b:	c1 ea 1d             	shr    $0x1d,%edx
c0006d9e:	01 d0                	add    %edx,%eax
c0006da0:	83 e0 07             	and    $0x7,%eax
c0006da3:	29 d0                	sub    %edx,%eax
c0006da5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006da8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dab:	8b 10                	mov    (%eax),%edx
c0006dad:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006db0:	01 d0                	add    %edx,%eax
c0006db2:	0f b6 00             	movzbl (%eax),%eax
c0006db5:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006db8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006dbc:	7e 13                	jle    c0006dd1 <set_bit_val+0x51>
c0006dbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006dc1:	ba 01 00 00 00       	mov    $0x1,%edx
c0006dc6:	89 c1                	mov    %eax,%ecx
c0006dc8:	d3 e2                	shl    %cl,%edx
c0006dca:	89 d0                	mov    %edx,%eax
c0006dcc:	08 45 ff             	or     %al,-0x1(%ebp)
c0006dcf:	eb 13                	jmp    c0006de4 <set_bit_val+0x64>
c0006dd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006dd4:	ba 01 00 00 00       	mov    $0x1,%edx
c0006dd9:	89 c1                	mov    %eax,%ecx
c0006ddb:	d3 e2                	shl    %cl,%edx
c0006ddd:	89 d0                	mov    %edx,%eax
c0006ddf:	f7 d0                	not    %eax
c0006de1:	20 45 ff             	and    %al,-0x1(%ebp)
c0006de4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006de7:	8b 10                	mov    (%eax),%edx
c0006de9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006dec:	01 c2                	add    %eax,%edx
c0006dee:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006df2:	88 02                	mov    %al,(%edx)
c0006df4:	b8 01 00 00 00       	mov    $0x1,%eax
c0006df9:	c9                   	leave  
c0006dfa:	c3                   	ret    

c0006dfb <set_bits>:
c0006dfb:	55                   	push   %ebp
c0006dfc:	89 e5                	mov    %esp,%ebp
c0006dfe:	83 ec 10             	sub    $0x10,%esp
c0006e01:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006e08:	eb 1c                	jmp    c0006e26 <set_bits+0x2b>
c0006e0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e0d:	8d 50 01             	lea    0x1(%eax),%edx
c0006e10:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006e13:	ff 75 10             	pushl  0x10(%ebp)
c0006e16:	50                   	push   %eax
c0006e17:	ff 75 08             	pushl  0x8(%ebp)
c0006e1a:	e8 61 ff ff ff       	call   c0006d80 <set_bit_val>
c0006e1f:	83 c4 0c             	add    $0xc,%esp
c0006e22:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006e26:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e29:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006e2c:	7c dc                	jl     c0006e0a <set_bits+0xf>
c0006e2e:	b8 01 00 00 00       	mov    $0x1,%eax
c0006e33:	c9                   	leave  
c0006e34:	c3                   	ret    

c0006e35 <get_first_free_bit>:
c0006e35:	55                   	push   %ebp
c0006e36:	89 e5                	mov    %esp,%ebp
c0006e38:	83 ec 10             	sub    $0x10,%esp
c0006e3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e3e:	8b 40 04             	mov    0x4(%eax),%eax
c0006e41:	c1 e0 03             	shl    $0x3,%eax
c0006e44:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e4d:	eb 1b                	jmp    c0006e6a <get_first_free_bit+0x35>
c0006e4f:	ff 75 fc             	pushl  -0x4(%ebp)
c0006e52:	ff 75 08             	pushl  0x8(%ebp)
c0006e55:	e8 bd fe ff ff       	call   c0006d17 <test_bit_val>
c0006e5a:	83 c4 08             	add    $0x8,%esp
c0006e5d:	85 c0                	test   %eax,%eax
c0006e5f:	75 05                	jne    c0006e66 <get_first_free_bit+0x31>
c0006e61:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e64:	eb 11                	jmp    c0006e77 <get_first_free_bit+0x42>
c0006e66:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006e6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e6d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006e70:	7c dd                	jl     c0006e4f <get_first_free_bit+0x1a>
c0006e72:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006e77:	c9                   	leave  
c0006e78:	c3                   	ret    

c0006e79 <get_bits>:
c0006e79:	55                   	push   %ebp
c0006e7a:	89 e5                	mov    %esp,%ebp
c0006e7c:	83 ec 20             	sub    $0x20,%esp
c0006e7f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006e86:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e89:	ff 75 08             	pushl  0x8(%ebp)
c0006e8c:	e8 a4 ff ff ff       	call   c0006e35 <get_first_free_bit>
c0006e91:	83 c4 08             	add    $0x8,%esp
c0006e94:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e9a:	8b 40 04             	mov    0x4(%eax),%eax
c0006e9d:	c1 e0 03             	shl    $0x3,%eax
c0006ea0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ea3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ea6:	83 e8 01             	sub    $0x1,%eax
c0006ea9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006eac:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006eb0:	75 08                	jne    c0006eba <get_bits+0x41>
c0006eb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006eb5:	e9 85 00 00 00       	jmp    c0006f3f <get_bits+0xc6>
c0006eba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ebd:	83 c0 01             	add    $0x1,%eax
c0006ec0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ec3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ec6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ec9:	eb 58                	jmp    c0006f23 <get_bits+0xaa>
c0006ecb:	ff 75 f8             	pushl  -0x8(%ebp)
c0006ece:	ff 75 08             	pushl  0x8(%ebp)
c0006ed1:	e8 41 fe ff ff       	call   c0006d17 <test_bit_val>
c0006ed6:	83 c4 08             	add    $0x8,%esp
c0006ed9:	85 c0                	test   %eax,%eax
c0006edb:	75 0a                	jne    c0006ee7 <get_bits+0x6e>
c0006edd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006ee1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006ee5:	eb 2b                	jmp    c0006f12 <get_bits+0x99>
c0006ee7:	6a 00                	push   $0x0
c0006ee9:	ff 75 08             	pushl  0x8(%ebp)
c0006eec:	e8 44 ff ff ff       	call   c0006e35 <get_first_free_bit>
c0006ef1:	83 c4 08             	add    $0x8,%esp
c0006ef4:	83 c0 01             	add    $0x1,%eax
c0006ef7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006efa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006efd:	83 c0 01             	add    $0x1,%eax
c0006f00:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f03:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f06:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f09:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006f0c:	83 e8 01             	sub    $0x1,%eax
c0006f0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f15:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006f18:	7c 09                	jl     c0006f23 <get_bits+0xaa>
c0006f1a:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006f21:	eb 0d                	jmp    c0006f30 <get_bits+0xb7>
c0006f23:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f26:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006f29:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006f2c:	85 c0                	test   %eax,%eax
c0006f2e:	7f 9b                	jg     c0006ecb <get_bits+0x52>
c0006f30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f33:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006f36:	83 c0 01             	add    $0x1,%eax
c0006f39:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f3f:	c9                   	leave  
c0006f40:	c3                   	ret    

c0006f41 <get_a_page2>:
c0006f41:	55                   	push   %ebp
c0006f42:	89 e5                	mov    %esp,%ebp
c0006f44:	83 ec 18             	sub    $0x18,%esp
c0006f47:	83 ec 0c             	sub    $0xc,%esp
c0006f4a:	ff 75 0c             	pushl  0xc(%ebp)
c0006f4d:	e8 1e 00 00 00       	call   c0006f70 <get_a_page>
c0006f52:	83 c4 10             	add    $0x10,%esp
c0006f55:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f58:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006f5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f5e:	83 ec 08             	sub    $0x8,%esp
c0006f61:	52                   	push   %edx
c0006f62:	50                   	push   %eax
c0006f63:	e8 61 01 00 00       	call   c00070c9 <add_map_entry>
c0006f68:	83 c4 10             	add    $0x10,%esp
c0006f6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f6e:	c9                   	leave  
c0006f6f:	c3                   	ret    

c0006f70 <get_a_page>:
c0006f70:	55                   	push   %ebp
c0006f71:	89 e5                	mov    %esp,%ebp
c0006f73:	83 ec 20             	sub    $0x20,%esp
c0006f76:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006f7a:	75 22                	jne    c0006f9e <get_a_page+0x2e>
c0006f7c:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006f81:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f84:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006f89:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f8c:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006f91:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f94:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006f99:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f9c:	eb 20                	jmp    c0006fbe <get_a_page+0x4e>
c0006f9e:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006fa3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fa6:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006fab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006fae:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006fb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006fb6:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006fbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fbe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006fc1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006fc4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006fc7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006fca:	6a 01                	push   $0x1
c0006fcc:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006fcf:	50                   	push   %eax
c0006fd0:	e8 a4 fe ff ff       	call   c0006e79 <get_bits>
c0006fd5:	83 c4 08             	add    $0x8,%esp
c0006fd8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006fdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fde:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006fe1:	c1 e2 0c             	shl    $0xc,%edx
c0006fe4:	01 d0                	add    %edx,%eax
c0006fe6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006fe9:	6a 01                	push   $0x1
c0006feb:	ff 75 fc             	pushl  -0x4(%ebp)
c0006fee:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006ff1:	50                   	push   %eax
c0006ff2:	e8 89 fd ff ff       	call   c0006d80 <set_bit_val>
c0006ff7:	83 c4 0c             	add    $0xc,%esp
c0006ffa:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ffd:	c9                   	leave  
c0006ffe:	c3                   	ret    

c0006fff <get_virtual_address>:
c0006fff:	55                   	push   %ebp
c0007000:	89 e5                	mov    %esp,%ebp
c0007002:	83 ec 28             	sub    $0x28,%esp
c0007005:	e8 86 a8 ff ff       	call   c0001890 <get_running_thread_pcb>
c000700a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000700d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007011:	75 1a                	jne    c000702d <get_virtual_address+0x2e>
c0007013:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007018:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000701b:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007020:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007023:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007028:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000702b:	eb 18                	jmp    c0007045 <get_virtual_address+0x46>
c000702d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007030:	8b 40 0c             	mov    0xc(%eax),%eax
c0007033:	83 ec 04             	sub    $0x4,%esp
c0007036:	6a 0c                	push   $0xc
c0007038:	50                   	push   %eax
c0007039:	8d 45 e0             	lea    -0x20(%ebp),%eax
c000703c:	50                   	push   %eax
c000703d:	e8 c6 0b 00 00       	call   c0007c08 <Memcpy>
c0007042:	83 c4 10             	add    $0x10,%esp
c0007045:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007048:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000704b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000704e:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0007051:	8b 45 08             	mov    0x8(%ebp),%eax
c0007054:	83 ec 08             	sub    $0x8,%esp
c0007057:	50                   	push   %eax
c0007058:	8d 45 d8             	lea    -0x28(%ebp),%eax
c000705b:	50                   	push   %eax
c000705c:	e8 18 fe ff ff       	call   c0006e79 <get_bits>
c0007061:	83 c4 10             	add    $0x10,%esp
c0007064:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007067:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000706a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000706d:	c1 e2 0c             	shl    $0xc,%edx
c0007070:	01 d0                	add    %edx,%eax
c0007072:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007075:	8b 45 08             	mov    0x8(%ebp),%eax
c0007078:	50                   	push   %eax
c0007079:	6a 01                	push   $0x1
c000707b:	ff 75 f0             	pushl  -0x10(%ebp)
c000707e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007081:	50                   	push   %eax
c0007082:	e8 74 fd ff ff       	call   c0006dfb <set_bits>
c0007087:	83 c4 10             	add    $0x10,%esp
c000708a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000708d:	c9                   	leave  
c000708e:	c3                   	ret    

c000708f <ptr_pde>:
c000708f:	55                   	push   %ebp
c0007090:	89 e5                	mov    %esp,%ebp
c0007092:	8b 45 08             	mov    0x8(%ebp),%eax
c0007095:	c1 e8 16             	shr    $0x16,%eax
c0007098:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c000709d:	c1 e0 02             	shl    $0x2,%eax
c00070a0:	5d                   	pop    %ebp
c00070a1:	c3                   	ret    

c00070a2 <ptr_pte>:
c00070a2:	55                   	push   %ebp
c00070a3:	89 e5                	mov    %esp,%ebp
c00070a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00070a8:	c1 e8 0a             	shr    $0xa,%eax
c00070ab:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c00070b0:	89 c2                	mov    %eax,%edx
c00070b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00070b5:	c1 e8 0c             	shr    $0xc,%eax
c00070b8:	25 ff 03 00 00       	and    $0x3ff,%eax
c00070bd:	c1 e0 02             	shl    $0x2,%eax
c00070c0:	01 d0                	add    %edx,%eax
c00070c2:	2d 00 00 40 00       	sub    $0x400000,%eax
c00070c7:	5d                   	pop    %ebp
c00070c8:	c3                   	ret    

c00070c9 <add_map_entry>:
c00070c9:	55                   	push   %ebp
c00070ca:	89 e5                	mov    %esp,%ebp
c00070cc:	83 ec 18             	sub    $0x18,%esp
c00070cf:	ff 75 08             	pushl  0x8(%ebp)
c00070d2:	e8 b8 ff ff ff       	call   c000708f <ptr_pde>
c00070d7:	83 c4 04             	add    $0x4,%esp
c00070da:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070dd:	ff 75 08             	pushl  0x8(%ebp)
c00070e0:	e8 bd ff ff ff       	call   c00070a2 <ptr_pte>
c00070e5:	83 c4 04             	add    $0x4,%esp
c00070e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070ee:	8b 00                	mov    (%eax),%eax
c00070f0:	83 e0 01             	and    $0x1,%eax
c00070f3:	85 c0                	test   %eax,%eax
c00070f5:	74 1b                	je     c0007112 <add_map_entry+0x49>
c00070f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070fa:	8b 00                	mov    (%eax),%eax
c00070fc:	83 e0 01             	and    $0x1,%eax
c00070ff:	85 c0                	test   %eax,%eax
c0007101:	75 51                	jne    c0007154 <add_map_entry+0x8b>
c0007103:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007106:	83 c8 07             	or     $0x7,%eax
c0007109:	89 c2                	mov    %eax,%edx
c000710b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000710e:	89 10                	mov    %edx,(%eax)
c0007110:	eb 42                	jmp    c0007154 <add_map_entry+0x8b>
c0007112:	6a 00                	push   $0x0
c0007114:	e8 57 fe ff ff       	call   c0006f70 <get_a_page>
c0007119:	83 c4 04             	add    $0x4,%esp
c000711c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000711f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007122:	83 c8 07             	or     $0x7,%eax
c0007125:	89 c2                	mov    %eax,%edx
c0007127:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000712a:	89 10                	mov    %edx,(%eax)
c000712c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000712f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007134:	83 ec 04             	sub    $0x4,%esp
c0007137:	68 00 10 00 00       	push   $0x1000
c000713c:	6a 00                	push   $0x0
c000713e:	50                   	push   %eax
c000713f:	e8 e7 49 00 00       	call   c000bb2b <Memset>
c0007144:	83 c4 10             	add    $0x10,%esp
c0007147:	8b 45 0c             	mov    0xc(%ebp),%eax
c000714a:	83 c8 07             	or     $0x7,%eax
c000714d:	89 c2                	mov    %eax,%edx
c000714f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007152:	89 10                	mov    %edx,(%eax)
c0007154:	90                   	nop
c0007155:	c9                   	leave  
c0007156:	c3                   	ret    

c0007157 <alloc_virtual_memory>:
c0007157:	55                   	push   %ebp
c0007158:	89 e5                	mov    %esp,%ebp
c000715a:	83 ec 28             	sub    $0x28,%esp
c000715d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007160:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007165:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007168:	8b 45 08             	mov    0x8(%ebp),%eax
c000716b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000716e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007171:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007174:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0007177:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000717a:	05 ff 0f 00 00       	add    $0xfff,%eax
c000717f:	c1 e8 0c             	shr    $0xc,%eax
c0007182:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007185:	e8 06 a7 ff ff       	call   c0001890 <get_running_thread_pcb>
c000718a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000718d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007190:	8b 40 08             	mov    0x8(%eax),%eax
c0007193:	85 c0                	test   %eax,%eax
c0007195:	75 09                	jne    c00071a0 <alloc_virtual_memory+0x49>
c0007197:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000719e:	eb 07                	jmp    c00071a7 <alloc_virtual_memory+0x50>
c00071a0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00071a7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00071ae:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00071b5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00071bc:	eb 47                	jmp    c0007205 <alloc_virtual_memory+0xae>
c00071be:	83 ec 08             	sub    $0x8,%esp
c00071c1:	ff 75 f0             	pushl  -0x10(%ebp)
c00071c4:	6a 01                	push   $0x1
c00071c6:	e8 34 fe ff ff       	call   c0006fff <get_virtual_address>
c00071cb:	83 c4 10             	add    $0x10,%esp
c00071ce:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00071d1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00071d5:	74 13                	je     c00071ea <alloc_virtual_memory+0x93>
c00071d7:	83 ec 0c             	sub    $0xc,%esp
c00071da:	ff 75 f0             	pushl  -0x10(%ebp)
c00071dd:	e8 8e fd ff ff       	call   c0006f70 <get_a_page>
c00071e2:	83 c4 10             	add    $0x10,%esp
c00071e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00071e8:	eb 06                	jmp    c00071f0 <alloc_virtual_memory+0x99>
c00071ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00071ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00071f0:	83 ec 08             	sub    $0x8,%esp
c00071f3:	ff 75 f4             	pushl  -0xc(%ebp)
c00071f6:	ff 75 d8             	pushl  -0x28(%ebp)
c00071f9:	e8 cb fe ff ff       	call   c00070c9 <add_map_entry>
c00071fe:	83 c4 10             	add    $0x10,%esp
c0007201:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007205:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007208:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000720b:	72 b1                	jb     c00071be <alloc_virtual_memory+0x67>
c000720d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007210:	25 ff 0f 00 00       	and    $0xfff,%eax
c0007215:	89 c2                	mov    %eax,%edx
c0007217:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000721a:	01 d0                	add    %edx,%eax
c000721c:	c9                   	leave  
c000721d:	c3                   	ret    

c000721e <get_physical_address>:
c000721e:	55                   	push   %ebp
c000721f:	89 e5                	mov    %esp,%ebp
c0007221:	83 ec 10             	sub    $0x10,%esp
c0007224:	ff 75 08             	pushl  0x8(%ebp)
c0007227:	e8 76 fe ff ff       	call   c00070a2 <ptr_pte>
c000722c:	83 c4 04             	add    $0x4,%esp
c000722f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007232:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007235:	8b 00                	mov    (%eax),%eax
c0007237:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000723c:	89 c2                	mov    %eax,%edx
c000723e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007241:	25 ff 0f 00 00       	and    $0xfff,%eax
c0007246:	09 d0                	or     %edx,%eax
c0007248:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000724b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000724e:	c9                   	leave  
c000724f:	c3                   	ret    

c0007250 <alloc_physical_memory>:
c0007250:	55                   	push   %ebp
c0007251:	89 e5                	mov    %esp,%ebp
c0007253:	83 ec 38             	sub    $0x38,%esp
c0007256:	8b 45 08             	mov    0x8(%ebp),%eax
c0007259:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000725e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007261:	e8 2a a6 ff ff       	call   c0001890 <get_running_thread_pcb>
c0007266:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007269:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000726d:	75 1a                	jne    c0007289 <alloc_physical_memory+0x39>
c000726f:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007274:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007277:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000727c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000727f:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007284:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007287:	eb 18                	jmp    c00072a1 <alloc_physical_memory+0x51>
c0007289:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000728c:	8b 40 0c             	mov    0xc(%eax),%eax
c000728f:	83 ec 04             	sub    $0x4,%esp
c0007292:	6a 0c                	push   $0xc
c0007294:	50                   	push   %eax
c0007295:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007298:	50                   	push   %eax
c0007299:	e8 6a 09 00 00       	call   c0007c08 <Memcpy>
c000729e:	83 c4 10             	add    $0x10,%esp
c00072a1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00072a4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00072a7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00072aa:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c00072ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00072b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00072b3:	29 c2                	sub    %eax,%edx
c00072b5:	89 d0                	mov    %edx,%eax
c00072b7:	c1 e8 0c             	shr    $0xc,%eax
c00072ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00072bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00072c0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00072c3:	c1 e2 0c             	shl    $0xc,%edx
c00072c6:	01 d0                	add    %edx,%eax
c00072c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00072cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072ce:	6a 01                	push   $0x1
c00072d0:	6a 01                	push   $0x1
c00072d2:	50                   	push   %eax
c00072d3:	8d 45 d0             	lea    -0x30(%ebp),%eax
c00072d6:	50                   	push   %eax
c00072d7:	e8 1f fb ff ff       	call   c0006dfb <set_bits>
c00072dc:	83 c4 10             	add    $0x10,%esp
c00072df:	83 ec 0c             	sub    $0xc,%esp
c00072e2:	ff 75 0c             	pushl  0xc(%ebp)
c00072e5:	e8 86 fc ff ff       	call   c0006f70 <get_a_page>
c00072ea:	83 c4 10             	add    $0x10,%esp
c00072ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00072f0:	83 ec 08             	sub    $0x8,%esp
c00072f3:	ff 75 e4             	pushl  -0x1c(%ebp)
c00072f6:	ff 75 08             	pushl  0x8(%ebp)
c00072f9:	e8 cb fd ff ff       	call   c00070c9 <add_map_entry>
c00072fe:	83 c4 10             	add    $0x10,%esp
c0007301:	8b 45 08             	mov    0x8(%ebp),%eax
c0007304:	c9                   	leave  
c0007305:	c3                   	ret    

c0007306 <alloc_memory>:
c0007306:	55                   	push   %ebp
c0007307:	89 e5                	mov    %esp,%ebp
c0007309:	83 ec 18             	sub    $0x18,%esp
c000730c:	83 ec 08             	sub    $0x8,%esp
c000730f:	ff 75 0c             	pushl  0xc(%ebp)
c0007312:	ff 75 08             	pushl  0x8(%ebp)
c0007315:	e8 e5 fc ff ff       	call   c0006fff <get_virtual_address>
c000731a:	83 c4 10             	add    $0x10,%esp
c000731d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007320:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007323:	2d 00 10 00 00       	sub    $0x1000,%eax
c0007328:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000732b:	eb 29                	jmp    c0007356 <alloc_memory+0x50>
c000732d:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0007334:	83 ec 0c             	sub    $0xc,%esp
c0007337:	ff 75 0c             	pushl  0xc(%ebp)
c000733a:	e8 31 fc ff ff       	call   c0006f70 <get_a_page>
c000733f:	83 c4 10             	add    $0x10,%esp
c0007342:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007345:	83 ec 08             	sub    $0x8,%esp
c0007348:	ff 75 ec             	pushl  -0x14(%ebp)
c000734b:	ff 75 f4             	pushl  -0xc(%ebp)
c000734e:	e8 76 fd ff ff       	call   c00070c9 <add_map_entry>
c0007353:	83 c4 10             	add    $0x10,%esp
c0007356:	8b 45 08             	mov    0x8(%ebp),%eax
c0007359:	8d 50 ff             	lea    -0x1(%eax),%edx
c000735c:	89 55 08             	mov    %edx,0x8(%ebp)
c000735f:	85 c0                	test   %eax,%eax
c0007361:	75 ca                	jne    c000732d <alloc_memory+0x27>
c0007363:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007366:	c9                   	leave  
c0007367:	c3                   	ret    

c0007368 <get_a_virtual_page>:
c0007368:	55                   	push   %ebp
c0007369:	89 e5                	mov    %esp,%ebp
c000736b:	83 ec 18             	sub    $0x18,%esp
c000736e:	ff 75 08             	pushl  0x8(%ebp)
c0007371:	e8 fa fb ff ff       	call   c0006f70 <get_a_page>
c0007376:	83 c4 04             	add    $0x4,%esp
c0007379:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000737c:	83 ec 08             	sub    $0x8,%esp
c000737f:	ff 75 f4             	pushl  -0xc(%ebp)
c0007382:	ff 75 0c             	pushl  0xc(%ebp)
c0007385:	e8 3f fd ff ff       	call   c00070c9 <add_map_entry>
c000738a:	83 c4 10             	add    $0x10,%esp
c000738d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007390:	c9                   	leave  
c0007391:	c3                   	ret    

c0007392 <block2arena>:
c0007392:	55                   	push   %ebp
c0007393:	89 e5                	mov    %esp,%ebp
c0007395:	83 ec 10             	sub    $0x10,%esp
c0007398:	8b 45 08             	mov    0x8(%ebp),%eax
c000739b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00073a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00073a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00073a6:	c9                   	leave  
c00073a7:	c3                   	ret    

c00073a8 <sys_malloc2>:
c00073a8:	55                   	push   %ebp
c00073a9:	89 e5                	mov    %esp,%ebp
c00073ab:	83 ec 58             	sub    $0x58,%esp
c00073ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00073b5:	e8 d6 a4 ff ff       	call   c0001890 <get_running_thread_pcb>
c00073ba:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00073bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00073c0:	8b 40 08             	mov    0x8(%eax),%eax
c00073c3:	85 c0                	test   %eax,%eax
c00073c5:	75 10                	jne    c00073d7 <sys_malloc2+0x2f>
c00073c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00073ce:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c00073d5:	eb 10                	jmp    c00073e7 <sys_malloc2+0x3f>
c00073d7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00073de:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00073e1:	83 c0 10             	add    $0x10,%eax
c00073e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00073e7:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c00073ee:	76 50                	jbe    c0007440 <sys_malloc2+0x98>
c00073f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00073f3:	05 0b 10 00 00       	add    $0x100b,%eax
c00073f8:	c1 e8 0c             	shr    $0xc,%eax
c00073fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00073fe:	83 ec 08             	sub    $0x8,%esp
c0007401:	ff 75 f0             	pushl  -0x10(%ebp)
c0007404:	ff 75 d8             	pushl  -0x28(%ebp)
c0007407:	e8 fa fe ff ff       	call   c0007306 <alloc_memory>
c000740c:	83 c4 10             	add    $0x10,%esp
c000740f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007412:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007415:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007418:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000741b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0007421:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007424:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c000742b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000742e:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0007432:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007435:	83 c0 0c             	add    $0xc,%eax
c0007438:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000743b:	e9 b2 01 00 00       	jmp    c00075f2 <sys_malloc2+0x24a>
c0007440:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007447:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000744e:	eb 26                	jmp    c0007476 <sys_malloc2+0xce>
c0007450:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007453:	89 d0                	mov    %edx,%eax
c0007455:	01 c0                	add    %eax,%eax
c0007457:	01 d0                	add    %edx,%eax
c0007459:	c1 e0 03             	shl    $0x3,%eax
c000745c:	89 c2                	mov    %eax,%edx
c000745e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007461:	01 d0                	add    %edx,%eax
c0007463:	8b 00                	mov    (%eax),%eax
c0007465:	39 45 08             	cmp    %eax,0x8(%ebp)
c0007468:	77 08                	ja     c0007472 <sys_malloc2+0xca>
c000746a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000746d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007470:	eb 0a                	jmp    c000747c <sys_malloc2+0xd4>
c0007472:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007476:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c000747a:	7e d4                	jle    c0007450 <sys_malloc2+0xa8>
c000747c:	83 ec 08             	sub    $0x8,%esp
c000747f:	ff 75 f0             	pushl  -0x10(%ebp)
c0007482:	6a 01                	push   $0x1
c0007484:	e8 7d fe ff ff       	call   c0007306 <alloc_memory>
c0007489:	83 c4 10             	add    $0x10,%esp
c000748c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000748f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007492:	89 d0                	mov    %edx,%eax
c0007494:	01 c0                	add    %eax,%eax
c0007496:	01 d0                	add    %edx,%eax
c0007498:	c1 e0 03             	shl    $0x3,%eax
c000749b:	89 c2                	mov    %eax,%edx
c000749d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074a0:	01 d0                	add    %edx,%eax
c00074a2:	83 ec 04             	sub    $0x4,%esp
c00074a5:	6a 18                	push   $0x18
c00074a7:	50                   	push   %eax
c00074a8:	ff 75 cc             	pushl  -0x34(%ebp)
c00074ab:	e8 58 07 00 00       	call   c0007c08 <Memcpy>
c00074b0:	83 c4 10             	add    $0x10,%esp
c00074b3:	e8 ec 06 00 00       	call   c0007ba4 <intr_disable>
c00074b8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00074bb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00074be:	89 d0                	mov    %edx,%eax
c00074c0:	01 c0                	add    %eax,%eax
c00074c2:	01 d0                	add    %edx,%eax
c00074c4:	c1 e0 03             	shl    $0x3,%eax
c00074c7:	89 c2                	mov    %eax,%edx
c00074c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074cc:	01 d0                	add    %edx,%eax
c00074ce:	83 c0 08             	add    $0x8,%eax
c00074d1:	83 ec 0c             	sub    $0xc,%esp
c00074d4:	50                   	push   %eax
c00074d5:	e8 29 35 00 00       	call   c000aa03 <isListEmpty>
c00074da:	83 c4 10             	add    $0x10,%esp
c00074dd:	3c 01                	cmp    $0x1,%al
c00074df:	0f 85 91 00 00 00    	jne    c0007576 <sys_malloc2+0x1ce>
c00074e5:	83 ec 08             	sub    $0x8,%esp
c00074e8:	ff 75 f0             	pushl  -0x10(%ebp)
c00074eb:	6a 01                	push   $0x1
c00074ed:	e8 14 fe ff ff       	call   c0007306 <alloc_memory>
c00074f2:	83 c4 10             	add    $0x10,%esp
c00074f5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00074f8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00074fb:	8b 00                	mov    (%eax),%eax
c00074fd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007500:	c7 45 bc 0c 00 00 00 	movl   $0xc,-0x44(%ebp)
c0007507:	b8 00 10 00 00       	mov    $0x1000,%eax
c000750c:	2b 45 bc             	sub    -0x44(%ebp),%eax
c000750f:	ba 00 00 00 00       	mov    $0x0,%edx
c0007514:	f7 75 c0             	divl   -0x40(%ebp)
c0007517:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000751a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c000751d:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007520:	01 d0                	add    %edx,%eax
c0007522:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0007525:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000752c:	eb 3b                	jmp    c0007569 <sys_malloc2+0x1c1>
c000752e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007531:	0f af 45 c0          	imul   -0x40(%ebp),%eax
c0007535:	89 c2                	mov    %eax,%edx
c0007537:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000753a:	01 d0                	add    %edx,%eax
c000753c:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000753f:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c0007542:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007545:	89 d0                	mov    %edx,%eax
c0007547:	01 c0                	add    %eax,%eax
c0007549:	01 d0                	add    %edx,%eax
c000754b:	c1 e0 03             	shl    $0x3,%eax
c000754e:	89 c2                	mov    %eax,%edx
c0007550:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007553:	01 d0                	add    %edx,%eax
c0007555:	83 c0 08             	add    $0x8,%eax
c0007558:	83 ec 08             	sub    $0x8,%esp
c000755b:	51                   	push   %ecx
c000755c:	50                   	push   %eax
c000755d:	e8 9e 35 00 00       	call   c000ab00 <appendToDoubleLinkList>
c0007562:	83 c4 10             	add    $0x10,%esp
c0007565:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007569:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000756c:	8d 50 ff             	lea    -0x1(%eax),%edx
c000756f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007572:	39 c2                	cmp    %eax,%edx
c0007574:	77 b8                	ja     c000752e <sys_malloc2+0x186>
c0007576:	83 ec 0c             	sub    $0xc,%esp
c0007579:	ff 75 c8             	pushl  -0x38(%ebp)
c000757c:	e8 4c 06 00 00       	call   c0007bcd <intr_set_status>
c0007581:	83 c4 10             	add    $0x10,%esp
c0007584:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007587:	89 d0                	mov    %edx,%eax
c0007589:	01 c0                	add    %eax,%eax
c000758b:	01 d0                	add    %edx,%eax
c000758d:	c1 e0 03             	shl    $0x3,%eax
c0007590:	89 c2                	mov    %eax,%edx
c0007592:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007595:	01 d0                	add    %edx,%eax
c0007597:	83 c0 08             	add    $0x8,%eax
c000759a:	83 ec 0c             	sub    $0xc,%esp
c000759d:	50                   	push   %eax
c000759e:	e8 c7 36 00 00       	call   c000ac6a <popFromDoubleLinkList>
c00075a3:	83 c4 10             	add    $0x10,%esp
c00075a6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00075a9:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00075ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00075af:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c00075b3:	75 1c                	jne    c00075d1 <sys_malloc2+0x229>
c00075b5:	68 9b 01 00 00       	push   $0x19b
c00075ba:	68 8e b3 00 c0       	push   $0xc000b38e
c00075bf:	68 8e b3 00 c0       	push   $0xc000b38e
c00075c4:	68 98 b3 00 c0       	push   $0xc000b398
c00075c9:	e8 f9 20 00 00       	call   c00096c7 <assertion_failure>
c00075ce:	83 c4 10             	add    $0x10,%esp
c00075d1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00075d4:	83 ec 0c             	sub    $0xc,%esp
c00075d7:	50                   	push   %eax
c00075d8:	e8 b5 fd ff ff       	call   c0007392 <block2arena>
c00075dd:	83 c4 10             	add    $0x10,%esp
c00075e0:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00075e3:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00075e6:	8b 40 04             	mov    0x4(%eax),%eax
c00075e9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00075ec:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00075ef:	89 50 04             	mov    %edx,0x4(%eax)
c00075f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00075f6:	75 1c                	jne    c0007614 <sys_malloc2+0x26c>
c00075f8:	68 a1 01 00 00       	push   $0x1a1
c00075fd:	68 8e b3 00 c0       	push   $0xc000b38e
c0007602:	68 8e b3 00 c0       	push   $0xc000b38e
c0007607:	68 aa b3 00 c0       	push   $0xc000b3aa
c000760c:	e8 b6 20 00 00       	call   c00096c7 <assertion_failure>
c0007611:	83 c4 10             	add    $0x10,%esp
c0007614:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007617:	c9                   	leave  
c0007618:	c3                   	ret    

c0007619 <remove_map_entry>:
c0007619:	55                   	push   %ebp
c000761a:	89 e5                	mov    %esp,%ebp
c000761c:	83 ec 10             	sub    $0x10,%esp
c000761f:	ff 75 08             	pushl  0x8(%ebp)
c0007622:	e8 7b fa ff ff       	call   c00070a2 <ptr_pte>
c0007627:	83 c4 04             	add    $0x4,%esp
c000762a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000762d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007630:	8b 10                	mov    (%eax),%edx
c0007632:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007635:	89 10                	mov    %edx,(%eax)
c0007637:	90                   	nop
c0007638:	c9                   	leave  
c0007639:	c3                   	ret    

c000763a <free_a_page>:
c000763a:	55                   	push   %ebp
c000763b:	89 e5                	mov    %esp,%ebp
c000763d:	83 ec 20             	sub    $0x20,%esp
c0007640:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007644:	75 21                	jne    c0007667 <free_a_page+0x2d>
c0007646:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000764b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000764e:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007653:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007656:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000765b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000765e:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c0007665:	eb 1f                	jmp    c0007686 <free_a_page+0x4c>
c0007667:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000766c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000766f:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007674:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007677:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000767c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000767f:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c0007686:	8b 45 08             	mov    0x8(%ebp),%eax
c0007689:	c1 e8 0c             	shr    $0xc,%eax
c000768c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000768f:	6a 00                	push   $0x0
c0007691:	ff 75 f8             	pushl  -0x8(%ebp)
c0007694:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0007697:	50                   	push   %eax
c0007698:	e8 e3 f6 ff ff       	call   c0006d80 <set_bit_val>
c000769d:	83 c4 0c             	add    $0xc,%esp
c00076a0:	ff 75 08             	pushl  0x8(%ebp)
c00076a3:	e8 76 fb ff ff       	call   c000721e <get_physical_address>
c00076a8:	83 c4 04             	add    $0x4,%esp
c00076ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00076ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00076b1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00076b7:	85 c0                	test   %eax,%eax
c00076b9:	0f 48 c2             	cmovs  %edx,%eax
c00076bc:	c1 f8 0c             	sar    $0xc,%eax
c00076bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00076c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00076c5:	6a 00                	push   $0x0
c00076c7:	ff 75 f0             	pushl  -0x10(%ebp)
c00076ca:	50                   	push   %eax
c00076cb:	e8 b0 f6 ff ff       	call   c0006d80 <set_bit_val>
c00076d0:	83 c4 0c             	add    $0xc,%esp
c00076d3:	ff 75 08             	pushl  0x8(%ebp)
c00076d6:	e8 3e ff ff ff       	call   c0007619 <remove_map_entry>
c00076db:	83 c4 04             	add    $0x4,%esp
c00076de:	90                   	nop
c00076df:	c9                   	leave  
c00076e0:	c3                   	ret    

c00076e1 <sys_free>:
c00076e1:	55                   	push   %ebp
c00076e2:	89 e5                	mov    %esp,%ebp
c00076e4:	83 ec 20             	sub    $0x20,%esp
c00076e7:	90                   	nop
c00076e8:	c9                   	leave  
c00076e9:	c3                   	ret    

c00076ea <init_memory_block_desc>:
c00076ea:	55                   	push   %ebp
c00076eb:	89 e5                	mov    %esp,%ebp
c00076ed:	83 ec 18             	sub    $0x18,%esp
c00076f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00076f7:	e9 b2 00 00 00       	jmp    c00077ae <init_memory_block_desc+0xc4>
c00076fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007700:	75 1b                	jne    c000771d <init_memory_block_desc+0x33>
c0007702:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007705:	89 d0                	mov    %edx,%eax
c0007707:	01 c0                	add    %eax,%eax
c0007709:	01 d0                	add    %edx,%eax
c000770b:	c1 e0 03             	shl    $0x3,%eax
c000770e:	89 c2                	mov    %eax,%edx
c0007710:	8b 45 08             	mov    0x8(%ebp),%eax
c0007713:	01 d0                	add    %edx,%eax
c0007715:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000771b:	eb 2e                	jmp    c000774b <init_memory_block_desc+0x61>
c000771d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007720:	89 d0                	mov    %edx,%eax
c0007722:	01 c0                	add    %eax,%eax
c0007724:	01 d0                	add    %edx,%eax
c0007726:	c1 e0 03             	shl    $0x3,%eax
c0007729:	8d 50 e8             	lea    -0x18(%eax),%edx
c000772c:	8b 45 08             	mov    0x8(%ebp),%eax
c000772f:	01 d0                	add    %edx,%eax
c0007731:	8b 08                	mov    (%eax),%ecx
c0007733:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007736:	89 d0                	mov    %edx,%eax
c0007738:	01 c0                	add    %eax,%eax
c000773a:	01 d0                	add    %edx,%eax
c000773c:	c1 e0 03             	shl    $0x3,%eax
c000773f:	89 c2                	mov    %eax,%edx
c0007741:	8b 45 08             	mov    0x8(%ebp),%eax
c0007744:	01 d0                	add    %edx,%eax
c0007746:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007749:	89 10                	mov    %edx,(%eax)
c000774b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000774e:	89 d0                	mov    %edx,%eax
c0007750:	01 c0                	add    %eax,%eax
c0007752:	01 d0                	add    %edx,%eax
c0007754:	c1 e0 03             	shl    $0x3,%eax
c0007757:	89 c2                	mov    %eax,%edx
c0007759:	8b 45 08             	mov    0x8(%ebp),%eax
c000775c:	01 d0                	add    %edx,%eax
c000775e:	8b 00                	mov    (%eax),%eax
c0007760:	89 c1                	mov    %eax,%ecx
c0007762:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007767:	ba 00 00 00 00       	mov    $0x0,%edx
c000776c:	f7 f1                	div    %ecx
c000776e:	89 c1                	mov    %eax,%ecx
c0007770:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007773:	89 d0                	mov    %edx,%eax
c0007775:	01 c0                	add    %eax,%eax
c0007777:	01 d0                	add    %edx,%eax
c0007779:	c1 e0 03             	shl    $0x3,%eax
c000777c:	89 c2                	mov    %eax,%edx
c000777e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007781:	01 d0                	add    %edx,%eax
c0007783:	89 ca                	mov    %ecx,%edx
c0007785:	89 50 04             	mov    %edx,0x4(%eax)
c0007788:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000778b:	89 d0                	mov    %edx,%eax
c000778d:	01 c0                	add    %eax,%eax
c000778f:	01 d0                	add    %edx,%eax
c0007791:	c1 e0 03             	shl    $0x3,%eax
c0007794:	89 c2                	mov    %eax,%edx
c0007796:	8b 45 08             	mov    0x8(%ebp),%eax
c0007799:	01 d0                	add    %edx,%eax
c000779b:	83 c0 08             	add    $0x8,%eax
c000779e:	83 ec 0c             	sub    $0xc,%esp
c00077a1:	50                   	push   %eax
c00077a2:	e8 2e 32 00 00       	call   c000a9d5 <initDoubleLinkList>
c00077a7:	83 c4 10             	add    $0x10,%esp
c00077aa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00077ae:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00077b2:	0f 8e 44 ff ff ff    	jle    c00076fc <init_memory_block_desc+0x12>
c00077b8:	90                   	nop
c00077b9:	c9                   	leave  
c00077ba:	c3                   	ret    

c00077bb <init_memory2>:
c00077bb:	55                   	push   %ebp
c00077bc:	89 e5                	mov    %esp,%ebp
c00077be:	83 ec 38             	sub    $0x38,%esp
c00077c1:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00077c8:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00077cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00077d2:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00077d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077da:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00077df:	29 c2                	sub    %eax,%edx
c00077e1:	89 d0                	mov    %edx,%eax
c00077e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00077e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00077e9:	89 c2                	mov    %eax,%edx
c00077eb:	c1 ea 1f             	shr    $0x1f,%edx
c00077ee:	01 d0                	add    %edx,%eax
c00077f0:	d1 f8                	sar    %eax
c00077f2:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c00077f7:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00077fc:	83 ec 0c             	sub    $0xc,%esp
c00077ff:	50                   	push   %eax
c0007800:	e8 e6 06 00 00       	call   c0007eeb <disp_int>
c0007805:	83 c4 10             	add    $0x10,%esp
c0007808:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000780d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007810:	29 c2                	sub    %eax,%edx
c0007812:	89 d0                	mov    %edx,%eax
c0007814:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007819:	83 ec 0c             	sub    $0xc,%esp
c000781c:	68 b6 b3 00 c0       	push   $0xc000b3b6
c0007821:	e8 66 9d ff ff       	call   c000158c <disp_str>
c0007826:	83 c4 10             	add    $0x10,%esp
c0007829:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c000782e:	83 ec 0c             	sub    $0xc,%esp
c0007831:	50                   	push   %eax
c0007832:	e8 b4 06 00 00       	call   c0007eeb <disp_int>
c0007837:	83 c4 10             	add    $0x10,%esp
c000783a:	83 ec 0c             	sub    $0xc,%esp
c000783d:	68 b6 b3 00 c0       	push   $0xc000b3b6
c0007842:	e8 45 9d ff ff       	call   c000158c <disp_str>
c0007847:	83 c4 10             	add    $0x10,%esp
c000784a:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000784f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007854:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000785a:	85 c0                	test   %eax,%eax
c000785c:	0f 48 c2             	cmovs  %edx,%eax
c000785f:	c1 f8 0c             	sar    $0xc,%eax
c0007862:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007865:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007868:	83 c0 07             	add    $0x7,%eax
c000786b:	8d 50 07             	lea    0x7(%eax),%edx
c000786e:	85 c0                	test   %eax,%eax
c0007870:	0f 48 c2             	cmovs  %edx,%eax
c0007873:	c1 f8 03             	sar    $0x3,%eax
c0007876:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c000787b:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007880:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007885:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c000788a:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007890:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007895:	83 ec 04             	sub    $0x4,%esp
c0007898:	52                   	push   %edx
c0007899:	6a 00                	push   $0x0
c000789b:	50                   	push   %eax
c000789c:	e8 8a 42 00 00       	call   c000bb2b <Memset>
c00078a1:	83 c4 10             	add    $0x10,%esp
c00078a4:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c00078a9:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078ae:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078b4:	85 c0                	test   %eax,%eax
c00078b6:	0f 48 c2             	cmovs  %edx,%eax
c00078b9:	c1 f8 0c             	sar    $0xc,%eax
c00078bc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00078c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00078c5:	ff 75 e8             	pushl  -0x18(%ebp)
c00078c8:	6a 01                	push   $0x1
c00078ca:	6a 00                	push   $0x0
c00078cc:	68 ac 16 01 c0       	push   $0xc00116ac
c00078d1:	e8 25 f5 ff ff       	call   c0006dfb <set_bits>
c00078d6:	83 c4 10             	add    $0x10,%esp
c00078d9:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00078de:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078e3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078e9:	85 c0                	test   %eax,%eax
c00078eb:	0f 48 c2             	cmovs  %edx,%eax
c00078ee:	c1 f8 0c             	sar    $0xc,%eax
c00078f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078f7:	83 c0 07             	add    $0x7,%eax
c00078fa:	8d 50 07             	lea    0x7(%eax),%edx
c00078fd:	85 c0                	test   %eax,%eax
c00078ff:	0f 48 c2             	cmovs  %edx,%eax
c0007902:	c1 f8 03             	sar    $0x3,%eax
c0007905:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c000790a:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000790f:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007915:	01 d0                	add    %edx,%eax
c0007917:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c000791c:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c0007922:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007927:	83 ec 04             	sub    $0x4,%esp
c000792a:	52                   	push   %edx
c000792b:	6a 00                	push   $0x0
c000792d:	50                   	push   %eax
c000792e:	e8 f8 41 00 00       	call   c000bb2b <Memset>
c0007933:	83 c4 10             	add    $0x10,%esp
c0007936:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c000793b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007940:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007946:	85 c0                	test   %eax,%eax
c0007948:	0f 48 c2             	cmovs  %edx,%eax
c000794b:	c1 f8 0c             	sar    $0xc,%eax
c000794e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007951:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007954:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007957:	ff 75 e8             	pushl  -0x18(%ebp)
c000795a:	6a 01                	push   $0x1
c000795c:	ff 75 e0             	pushl  -0x20(%ebp)
c000795f:	68 ac 16 01 c0       	push   $0xc00116ac
c0007964:	e8 92 f4 ff ff       	call   c0006dfb <set_bits>
c0007969:	83 c4 10             	add    $0x10,%esp
c000796c:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0007973:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007976:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007979:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000797c:	83 c0 07             	add    $0x7,%eax
c000797f:	8d 50 07             	lea    0x7(%eax),%edx
c0007982:	85 c0                	test   %eax,%eax
c0007984:	0f 48 c2             	cmovs  %edx,%eax
c0007987:	c1 f8 03             	sar    $0x3,%eax
c000798a:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c000798f:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007994:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c000799a:	01 c2                	add    %eax,%edx
c000799c:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00079a1:	01 d0                	add    %edx,%eax
c00079a3:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c00079a8:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c00079ae:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00079b3:	83 ec 04             	sub    $0x4,%esp
c00079b6:	52                   	push   %edx
c00079b7:	6a 00                	push   $0x0
c00079b9:	50                   	push   %eax
c00079ba:	e8 6c 41 00 00       	call   c000bb2b <Memset>
c00079bf:	83 c4 10             	add    $0x10,%esp
c00079c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00079c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00079c8:	01 d0                	add    %edx,%eax
c00079ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00079cd:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00079d2:	05 ff 0f 00 00       	add    $0xfff,%eax
c00079d7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00079dd:	85 c0                	test   %eax,%eax
c00079df:	0f 48 c2             	cmovs  %edx,%eax
c00079e2:	c1 f8 0c             	sar    $0xc,%eax
c00079e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00079e8:	ff 75 e8             	pushl  -0x18(%ebp)
c00079eb:	6a 01                	push   $0x1
c00079ed:	ff 75 e0             	pushl  -0x20(%ebp)
c00079f0:	68 ac 16 01 c0       	push   $0xc00116ac
c00079f5:	e8 01 f4 ff ff       	call   c0006dfb <set_bits>
c00079fa:	83 c4 10             	add    $0x10,%esp
c00079fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007a00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a03:	01 d0                	add    %edx,%eax
c0007a05:	c1 e0 0c             	shl    $0xc,%eax
c0007a08:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007a0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a10:	83 c0 02             	add    $0x2,%eax
c0007a13:	c1 e0 0c             	shl    $0xc,%eax
c0007a16:	89 c2                	mov    %eax,%edx
c0007a18:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007a1b:	01 d0                	add    %edx,%eax
c0007a1d:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007a22:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007a29:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a2c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007a2f:	90                   	nop
c0007a30:	c9                   	leave  
c0007a31:	c3                   	ret    

c0007a32 <init_memory>:
c0007a32:	55                   	push   %ebp
c0007a33:	89 e5                	mov    %esp,%ebp
c0007a35:	83 ec 38             	sub    $0x38,%esp
c0007a38:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007a3f:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007a46:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007a4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a50:	05 00 00 10 00       	add    $0x100000,%eax
c0007a55:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007a58:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a5b:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0007a5e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007a64:	85 c0                	test   %eax,%eax
c0007a66:	0f 48 c2             	cmovs  %edx,%eax
c0007a69:	c1 f8 0c             	sar    $0xc,%eax
c0007a6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007a6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a72:	89 c2                	mov    %eax,%edx
c0007a74:	c1 ea 1f             	shr    $0x1f,%edx
c0007a77:	01 d0                	add    %edx,%eax
c0007a79:	d1 f8                	sar    %eax
c0007a7b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007a7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a81:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007a84:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a87:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007a8a:	8d 50 07             	lea    0x7(%eax),%edx
c0007a8d:	85 c0                	test   %eax,%eax
c0007a8f:	0f 48 c2             	cmovs  %edx,%eax
c0007a92:	c1 f8 03             	sar    $0x3,%eax
c0007a95:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007a98:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a9b:	8d 50 07             	lea    0x7(%eax),%edx
c0007a9e:	85 c0                	test   %eax,%eax
c0007aa0:	0f 48 c2             	cmovs  %edx,%eax
c0007aa3:	c1 f8 03             	sar    $0x3,%eax
c0007aa6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007aa9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007aac:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007ab1:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007ab6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007ab9:	c1 e2 0c             	shl    $0xc,%edx
c0007abc:	01 d0                	add    %edx,%eax
c0007abe:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007ac3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ac6:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007acb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007ace:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007ad3:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007ad8:	83 ec 04             	sub    $0x4,%esp
c0007adb:	ff 75 d8             	pushl  -0x28(%ebp)
c0007ade:	6a 00                	push   $0x0
c0007ae0:	50                   	push   %eax
c0007ae1:	e8 45 40 00 00       	call   c000bb2b <Memset>
c0007ae6:	83 c4 10             	add    $0x10,%esp
c0007ae9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007aec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007aef:	01 d0                	add    %edx,%eax
c0007af1:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007af6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007af9:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007afe:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007b03:	83 ec 04             	sub    $0x4,%esp
c0007b06:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007b09:	6a 00                	push   $0x0
c0007b0b:	50                   	push   %eax
c0007b0c:	e8 1a 40 00 00       	call   c000bb2b <Memset>
c0007b11:	83 c4 10             	add    $0x10,%esp
c0007b14:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b17:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007b1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007b1f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b22:	01 c2                	add    %eax,%edx
c0007b24:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007b27:	01 d0                	add    %edx,%eax
c0007b29:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007b2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b31:	05 00 00 10 00       	add    $0x100000,%eax
c0007b36:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007b3b:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007b40:	83 ec 04             	sub    $0x4,%esp
c0007b43:	ff 75 d8             	pushl  -0x28(%ebp)
c0007b46:	6a 00                	push   $0x0
c0007b48:	50                   	push   %eax
c0007b49:	e8 dd 3f 00 00       	call   c000bb2b <Memset>
c0007b4e:	83 c4 10             	add    $0x10,%esp
c0007b51:	83 ec 04             	sub    $0x4,%esp
c0007b54:	68 f0 00 00 00       	push   $0xf0
c0007b59:	6a 00                	push   $0x0
c0007b5b:	68 a0 47 08 c0       	push   $0xc00847a0
c0007b60:	e8 c6 3f 00 00       	call   c000bb2b <Memset>
c0007b65:	83 c4 10             	add    $0x10,%esp
c0007b68:	83 ec 0c             	sub    $0xc,%esp
c0007b6b:	68 a0 47 08 c0       	push   $0xc00847a0
c0007b70:	e8 75 fb ff ff       	call   c00076ea <init_memory_block_desc>
c0007b75:	83 c4 10             	add    $0x10,%esp
c0007b78:	90                   	nop
c0007b79:	c9                   	leave  
c0007b7a:	c3                   	ret    

c0007b7b <intr_enable>:
c0007b7b:	55                   	push   %ebp
c0007b7c:	89 e5                	mov    %esp,%ebp
c0007b7e:	83 ec 18             	sub    $0x18,%esp
c0007b81:	e8 65 00 00 00       	call   c0007beb <intr_get_status>
c0007b86:	83 f8 01             	cmp    $0x1,%eax
c0007b89:	75 0c                	jne    c0007b97 <intr_enable+0x1c>
c0007b8b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b95:	eb 0b                	jmp    c0007ba2 <intr_enable+0x27>
c0007b97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b9e:	fb                   	sti    
c0007b9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ba2:	c9                   	leave  
c0007ba3:	c3                   	ret    

c0007ba4 <intr_disable>:
c0007ba4:	55                   	push   %ebp
c0007ba5:	89 e5                	mov    %esp,%ebp
c0007ba7:	83 ec 18             	sub    $0x18,%esp
c0007baa:	e8 3c 00 00 00       	call   c0007beb <intr_get_status>
c0007baf:	83 f8 01             	cmp    $0x1,%eax
c0007bb2:	75 0d                	jne    c0007bc1 <intr_disable+0x1d>
c0007bb4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007bbb:	fa                   	cli    
c0007bbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007bbf:	eb 0a                	jmp    c0007bcb <intr_disable+0x27>
c0007bc1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007bc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007bcb:	c9                   	leave  
c0007bcc:	c3                   	ret    

c0007bcd <intr_set_status>:
c0007bcd:	55                   	push   %ebp
c0007bce:	89 e5                	mov    %esp,%ebp
c0007bd0:	83 ec 08             	sub    $0x8,%esp
c0007bd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0007bd6:	83 e0 01             	and    $0x1,%eax
c0007bd9:	85 c0                	test   %eax,%eax
c0007bdb:	74 07                	je     c0007be4 <intr_set_status+0x17>
c0007bdd:	e8 99 ff ff ff       	call   c0007b7b <intr_enable>
c0007be2:	eb 05                	jmp    c0007be9 <intr_set_status+0x1c>
c0007be4:	e8 bb ff ff ff       	call   c0007ba4 <intr_disable>
c0007be9:	c9                   	leave  
c0007bea:	c3                   	ret    

c0007beb <intr_get_status>:
c0007beb:	55                   	push   %ebp
c0007bec:	89 e5                	mov    %esp,%ebp
c0007bee:	83 ec 10             	sub    $0x10,%esp
c0007bf1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007bf8:	9c                   	pushf  
c0007bf9:	58                   	pop    %eax
c0007bfa:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007bfd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007c00:	c1 e8 09             	shr    $0x9,%eax
c0007c03:	83 e0 01             	and    $0x1,%eax
c0007c06:	c9                   	leave  
c0007c07:	c3                   	ret    

c0007c08 <Memcpy>:
c0007c08:	55                   	push   %ebp
c0007c09:	89 e5                	mov    %esp,%ebp
c0007c0b:	83 ec 18             	sub    $0x18,%esp
c0007c0e:	e8 91 ff ff ff       	call   c0007ba4 <intr_disable>
c0007c13:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007c16:	83 ec 04             	sub    $0x4,%esp
c0007c19:	ff 75 10             	pushl  0x10(%ebp)
c0007c1c:	ff 75 0c             	pushl  0xc(%ebp)
c0007c1f:	ff 75 08             	pushl  0x8(%ebp)
c0007c22:	e8 d6 3e 00 00       	call   c000bafd <Memcpy2>
c0007c27:	83 c4 10             	add    $0x10,%esp
c0007c2a:	83 ec 0c             	sub    $0xc,%esp
c0007c2d:	ff 75 f4             	pushl  -0xc(%ebp)
c0007c30:	e8 98 ff ff ff       	call   c0007bcd <intr_set_status>
c0007c35:	83 c4 10             	add    $0x10,%esp
c0007c38:	90                   	nop
c0007c39:	c9                   	leave  
c0007c3a:	c3                   	ret    

c0007c3b <untar>:
c0007c3b:	55                   	push   %ebp
c0007c3c:	89 e5                	mov    %esp,%ebp
c0007c3e:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c0007c44:	83 ec 08             	sub    $0x8,%esp
c0007c47:	6a 00                	push   $0x0
c0007c49:	ff 75 08             	pushl  0x8(%ebp)
c0007c4c:	e8 ce e4 ff ff       	call   c000611f <open>
c0007c51:	83 c4 10             	add    $0x10,%esp
c0007c54:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007c57:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007c5e:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c0007c65:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c6c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007c73:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007c77:	7e 58                	jle    c0007cd1 <untar+0x96>
c0007c79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c7c:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007c81:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007c87:	85 c0                	test   %eax,%eax
c0007c89:	0f 48 c2             	cmovs  %edx,%eax
c0007c8c:	c1 f8 09             	sar    $0x9,%eax
c0007c8f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007c92:	83 ec 04             	sub    $0x4,%esp
c0007c95:	68 00 20 00 00       	push   $0x2000
c0007c9a:	6a 00                	push   $0x0
c0007c9c:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007ca2:	50                   	push   %eax
c0007ca3:	e8 83 3e 00 00       	call   c000bb2b <Memset>
c0007ca8:	83 c4 10             	add    $0x10,%esp
c0007cab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007cae:	c1 e0 09             	shl    $0x9,%eax
c0007cb1:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007cb4:	83 ec 04             	sub    $0x4,%esp
c0007cb7:	50                   	push   %eax
c0007cb8:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007cbe:	50                   	push   %eax
c0007cbf:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007cc2:	e8 dd e4 ff ff       	call   c00061a4 <read>
c0007cc7:	83 c4 10             	add    $0x10,%esp
c0007cca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007cd1:	83 ec 04             	sub    $0x4,%esp
c0007cd4:	68 00 20 00 00       	push   $0x2000
c0007cd9:	6a 00                	push   $0x0
c0007cdb:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007ce1:	50                   	push   %eax
c0007ce2:	e8 44 3e 00 00       	call   c000bb2b <Memset>
c0007ce7:	83 c4 10             	add    $0x10,%esp
c0007cea:	83 ec 04             	sub    $0x4,%esp
c0007ced:	68 00 02 00 00       	push   $0x200
c0007cf2:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007cf8:	50                   	push   %eax
c0007cf9:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007cfc:	e8 a3 e4 ff ff       	call   c00061a4 <read>
c0007d01:	83 c4 10             	add    $0x10,%esp
c0007d04:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007d07:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007d0b:	0f 84 1f 01 00 00    	je     c0007e30 <untar+0x1f5>
c0007d11:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007d14:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007d17:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007d1e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007d24:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007d27:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007d2a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007d2d:	83 ec 08             	sub    $0x8,%esp
c0007d30:	6a 07                	push   $0x7
c0007d32:	ff 75 cc             	pushl  -0x34(%ebp)
c0007d35:	e8 e5 e3 ff ff       	call   c000611f <open>
c0007d3a:	83 c4 10             	add    $0x10,%esp
c0007d3d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007d40:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007d47:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007d4a:	83 c0 7c             	add    $0x7c,%eax
c0007d4d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007d50:	83 ec 0c             	sub    $0xc,%esp
c0007d53:	ff 75 cc             	pushl  -0x34(%ebp)
c0007d56:	e8 09 3e 00 00       	call   c000bb64 <Strlen>
c0007d5b:	83 c4 10             	add    $0x10,%esp
c0007d5e:	85 c0                	test   %eax,%eax
c0007d60:	75 16                	jne    c0007d78 <untar+0x13d>
c0007d62:	83 ec 0c             	sub    $0xc,%esp
c0007d65:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007d68:	e8 f7 3d 00 00       	call   c000bb64 <Strlen>
c0007d6d:	83 c4 10             	add    $0x10,%esp
c0007d70:	85 c0                	test   %eax,%eax
c0007d72:	0f 84 bb 00 00 00    	je     c0007e33 <untar+0x1f8>
c0007d78:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007d7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d7e:	eb 1f                	jmp    c0007d9f <untar+0x164>
c0007d80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007d83:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007d8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d8d:	0f b6 00             	movzbl (%eax),%eax
c0007d90:	0f be c0             	movsbl %al,%eax
c0007d93:	83 e8 30             	sub    $0x30,%eax
c0007d96:	01 d0                	add    %edx,%eax
c0007d98:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007d9b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007d9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007da2:	0f b6 00             	movzbl (%eax),%eax
c0007da5:	84 c0                	test   %al,%al
c0007da7:	75 d7                	jne    c0007d80 <untar+0x145>
c0007da9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007dac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007daf:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0007db6:	eb 5f                	jmp    c0007e17 <untar+0x1dc>
c0007db8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007dbb:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0007dbe:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0007dc2:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007dc5:	83 ec 04             	sub    $0x4,%esp
c0007dc8:	68 00 02 00 00       	push   $0x200
c0007dcd:	6a 00                	push   $0x0
c0007dcf:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007dd5:	50                   	push   %eax
c0007dd6:	e8 50 3d 00 00       	call   c000bb2b <Memset>
c0007ddb:	83 c4 10             	add    $0x10,%esp
c0007dde:	83 ec 04             	sub    $0x4,%esp
c0007de1:	ff 75 bc             	pushl  -0x44(%ebp)
c0007de4:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007dea:	50                   	push   %eax
c0007deb:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007dee:	e8 b1 e3 ff ff       	call   c00061a4 <read>
c0007df3:	83 c4 10             	add    $0x10,%esp
c0007df6:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007df9:	83 ec 04             	sub    $0x4,%esp
c0007dfc:	ff 75 bc             	pushl  -0x44(%ebp)
c0007dff:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007e05:	50                   	push   %eax
c0007e06:	ff 75 c8             	pushl  -0x38(%ebp)
c0007e09:	e8 0a e4 ff ff       	call   c0006218 <write>
c0007e0e:	83 c4 10             	add    $0x10,%esp
c0007e11:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007e14:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0007e17:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007e1b:	75 9b                	jne    c0007db8 <untar+0x17d>
c0007e1d:	83 ec 0c             	sub    $0xc,%esp
c0007e20:	ff 75 c8             	pushl  -0x38(%ebp)
c0007e23:	e8 64 e4 ff ff       	call   c000628c <close>
c0007e28:	83 c4 10             	add    $0x10,%esp
c0007e2b:	e9 43 fe ff ff       	jmp    c0007c73 <untar+0x38>
c0007e30:	90                   	nop
c0007e31:	eb 01                	jmp    c0007e34 <untar+0x1f9>
c0007e33:	90                   	nop
c0007e34:	83 ec 0c             	sub    $0xc,%esp
c0007e37:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e3a:	e8 4d e4 ff ff       	call   c000628c <close>
c0007e3f:	83 c4 10             	add    $0x10,%esp
c0007e42:	90                   	nop
c0007e43:	c9                   	leave  
c0007e44:	c3                   	ret    

c0007e45 <atoi>:
c0007e45:	55                   	push   %ebp
c0007e46:	89 e5                	mov    %esp,%ebp
c0007e48:	83 ec 10             	sub    $0x10,%esp
c0007e4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0007e4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007e51:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e54:	8d 50 01             	lea    0x1(%eax),%edx
c0007e57:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e5a:	c6 00 30             	movb   $0x30,(%eax)
c0007e5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e60:	8d 50 01             	lea    0x1(%eax),%edx
c0007e63:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e66:	c6 00 78             	movb   $0x78,(%eax)
c0007e69:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007e6d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007e71:	75 0e                	jne    c0007e81 <atoi+0x3c>
c0007e73:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e76:	8d 50 01             	lea    0x1(%eax),%edx
c0007e79:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e7c:	c6 00 30             	movb   $0x30,(%eax)
c0007e7f:	eb 61                	jmp    c0007ee2 <atoi+0x9d>
c0007e81:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007e88:	eb 52                	jmp    c0007edc <atoi+0x97>
c0007e8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e8d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007e90:	89 c1                	mov    %eax,%ecx
c0007e92:	d3 fa                	sar    %cl,%edx
c0007e94:	89 d0                	mov    %edx,%eax
c0007e96:	83 e0 0f             	and    $0xf,%eax
c0007e99:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e9c:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007ea0:	75 06                	jne    c0007ea8 <atoi+0x63>
c0007ea2:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007ea6:	74 2f                	je     c0007ed7 <atoi+0x92>
c0007ea8:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007eac:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007eb0:	83 c0 30             	add    $0x30,%eax
c0007eb3:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007eb6:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007eba:	7e 0a                	jle    c0007ec6 <atoi+0x81>
c0007ebc:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007ec0:	83 c0 07             	add    $0x7,%eax
c0007ec3:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007ec6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ec9:	8d 50 01             	lea    0x1(%eax),%edx
c0007ecc:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ecf:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007ed3:	88 10                	mov    %dl,(%eax)
c0007ed5:	eb 01                	jmp    c0007ed8 <atoi+0x93>
c0007ed7:	90                   	nop
c0007ed8:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007edc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007ee0:	79 a8                	jns    c0007e8a <atoi+0x45>
c0007ee2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ee5:	c6 00 00             	movb   $0x0,(%eax)
c0007ee8:	90                   	nop
c0007ee9:	c9                   	leave  
c0007eea:	c3                   	ret    

c0007eeb <disp_int>:
c0007eeb:	55                   	push   %ebp
c0007eec:	89 e5                	mov    %esp,%ebp
c0007eee:	83 ec 18             	sub    $0x18,%esp
c0007ef1:	ff 75 08             	pushl  0x8(%ebp)
c0007ef4:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007ef7:	50                   	push   %eax
c0007ef8:	e8 48 ff ff ff       	call   c0007e45 <atoi>
c0007efd:	83 c4 08             	add    $0x8,%esp
c0007f00:	83 ec 08             	sub    $0x8,%esp
c0007f03:	6a 0b                	push   $0xb
c0007f05:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f08:	50                   	push   %eax
c0007f09:	e8 b9 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f0e:	83 c4 10             	add    $0x10,%esp
c0007f11:	90                   	nop
c0007f12:	c9                   	leave  
c0007f13:	c3                   	ret    

c0007f14 <do_page_fault>:
c0007f14:	55                   	push   %ebp
c0007f15:	89 e5                	mov    %esp,%ebp
c0007f17:	83 ec 28             	sub    $0x28,%esp
c0007f1a:	0f 20 d0             	mov    %cr2,%eax
c0007f1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007f20:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007f27:	00 00 00 
c0007f2a:	83 ec 0c             	sub    $0xc,%esp
c0007f2d:	68 c0 b3 00 c0       	push   $0xc000b3c0
c0007f32:	e8 55 96 ff ff       	call   c000158c <disp_str>
c0007f37:	83 c4 10             	add    $0x10,%esp
c0007f3a:	83 ec 0c             	sub    $0xc,%esp
c0007f3d:	68 cf b3 00 c0       	push   $0xc000b3cf
c0007f42:	e8 45 96 ff ff       	call   c000158c <disp_str>
c0007f47:	83 c4 10             	add    $0x10,%esp
c0007f4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f4d:	83 ec 0c             	sub    $0xc,%esp
c0007f50:	50                   	push   %eax
c0007f51:	e8 95 ff ff ff       	call   c0007eeb <disp_int>
c0007f56:	83 c4 10             	add    $0x10,%esp
c0007f59:	83 ec 0c             	sub    $0xc,%esp
c0007f5c:	68 d4 b3 00 c0       	push   $0xc000b3d4
c0007f61:	e8 26 96 ff ff       	call   c000158c <disp_str>
c0007f66:	83 c4 10             	add    $0x10,%esp
c0007f69:	83 ec 0c             	sub    $0xc,%esp
c0007f6c:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f6f:	e8 1b f1 ff ff       	call   c000708f <ptr_pde>
c0007f74:	83 c4 10             	add    $0x10,%esp
c0007f77:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007f7a:	83 ec 0c             	sub    $0xc,%esp
c0007f7d:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f80:	e8 1d f1 ff ff       	call   c00070a2 <ptr_pte>
c0007f85:	83 c4 10             	add    $0x10,%esp
c0007f88:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007f8b:	83 ec 0c             	sub    $0xc,%esp
c0007f8e:	68 d6 b3 00 c0       	push   $0xc000b3d6
c0007f93:	e8 f4 95 ff ff       	call   c000158c <disp_str>
c0007f98:	83 c4 10             	add    $0x10,%esp
c0007f9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007f9e:	83 ec 0c             	sub    $0xc,%esp
c0007fa1:	50                   	push   %eax
c0007fa2:	e8 44 ff ff ff       	call   c0007eeb <disp_int>
c0007fa7:	83 c4 10             	add    $0x10,%esp
c0007faa:	83 ec 0c             	sub    $0xc,%esp
c0007fad:	68 db b3 00 c0       	push   $0xc000b3db
c0007fb2:	e8 d5 95 ff ff       	call   c000158c <disp_str>
c0007fb7:	83 c4 10             	add    $0x10,%esp
c0007fba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007fbd:	8b 00                	mov    (%eax),%eax
c0007fbf:	83 ec 0c             	sub    $0xc,%esp
c0007fc2:	50                   	push   %eax
c0007fc3:	e8 23 ff ff ff       	call   c0007eeb <disp_int>
c0007fc8:	83 c4 10             	add    $0x10,%esp
c0007fcb:	83 ec 0c             	sub    $0xc,%esp
c0007fce:	68 d4 b3 00 c0       	push   $0xc000b3d4
c0007fd3:	e8 b4 95 ff ff       	call   c000158c <disp_str>
c0007fd8:	83 c4 10             	add    $0x10,%esp
c0007fdb:	83 ec 0c             	sub    $0xc,%esp
c0007fde:	68 e4 b3 00 c0       	push   $0xc000b3e4
c0007fe3:	e8 a4 95 ff ff       	call   c000158c <disp_str>
c0007fe8:	83 c4 10             	add    $0x10,%esp
c0007feb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007fee:	83 ec 0c             	sub    $0xc,%esp
c0007ff1:	50                   	push   %eax
c0007ff2:	e8 f4 fe ff ff       	call   c0007eeb <disp_int>
c0007ff7:	83 c4 10             	add    $0x10,%esp
c0007ffa:	83 ec 0c             	sub    $0xc,%esp
c0007ffd:	68 e9 b3 00 c0       	push   $0xc000b3e9
c0008002:	e8 85 95 ff ff       	call   c000158c <disp_str>
c0008007:	83 c4 10             	add    $0x10,%esp
c000800a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000800d:	8b 00                	mov    (%eax),%eax
c000800f:	83 ec 0c             	sub    $0xc,%esp
c0008012:	50                   	push   %eax
c0008013:	e8 d3 fe ff ff       	call   c0007eeb <disp_int>
c0008018:	83 c4 10             	add    $0x10,%esp
c000801b:	83 ec 0c             	sub    $0xc,%esp
c000801e:	68 d4 b3 00 c0       	push   $0xc000b3d4
c0008023:	e8 64 95 ff ff       	call   c000158c <disp_str>
c0008028:	83 c4 10             	add    $0x10,%esp
c000802b:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0008032:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008035:	8b 00                	mov    (%eax),%eax
c0008037:	83 e0 01             	and    $0x1,%eax
c000803a:	85 c0                	test   %eax,%eax
c000803c:	74 09                	je     c0008047 <do_page_fault+0x133>
c000803e:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0008045:	eb 07                	jmp    c000804e <do_page_fault+0x13a>
c0008047:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000804e:	90                   	nop
c000804f:	c9                   	leave  
c0008050:	c3                   	ret    

c0008051 <exception_handler>:
c0008051:	55                   	push   %ebp
c0008052:	89 e5                	mov    %esp,%ebp
c0008054:	57                   	push   %edi
c0008055:	56                   	push   %esi
c0008056:	53                   	push   %ebx
c0008057:	83 ec 6c             	sub    $0x6c,%esp
c000805a:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000805d:	bb 60 b6 00 c0       	mov    $0xc000b660,%ebx
c0008062:	ba 13 00 00 00       	mov    $0x13,%edx
c0008067:	89 c7                	mov    %eax,%edi
c0008069:	89 de                	mov    %ebx,%esi
c000806b:	89 d1                	mov    %edx,%ecx
c000806d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000806f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008076:	eb 04                	jmp    c000807c <exception_handler+0x2b>
c0008078:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000807c:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008083:	7e f3                	jle    c0008078 <exception_handler+0x27>
c0008085:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000808c:	00 00 00 
c000808f:	83 ec 0c             	sub    $0xc,%esp
c0008092:	68 f2 b3 00 c0       	push   $0xc000b3f2
c0008097:	e8 f0 94 ff ff       	call   c000158c <disp_str>
c000809c:	83 c4 10             	add    $0x10,%esp
c000809f:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c00080a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00080a9:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c00080ad:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00080b0:	83 ec 0c             	sub    $0xc,%esp
c00080b3:	ff 75 dc             	pushl  -0x24(%ebp)
c00080b6:	e8 d1 94 ff ff       	call   c000158c <disp_str>
c00080bb:	83 c4 10             	add    $0x10,%esp
c00080be:	83 ec 0c             	sub    $0xc,%esp
c00080c1:	68 00 b4 00 c0       	push   $0xc000b400
c00080c6:	e8 c1 94 ff ff       	call   c000158c <disp_str>
c00080cb:	83 c4 10             	add    $0x10,%esp
c00080ce:	83 ec 0c             	sub    $0xc,%esp
c00080d1:	68 03 b4 00 c0       	push   $0xc000b403
c00080d6:	e8 b1 94 ff ff       	call   c000158c <disp_str>
c00080db:	83 c4 10             	add    $0x10,%esp
c00080de:	8b 45 08             	mov    0x8(%ebp),%eax
c00080e1:	83 ec 0c             	sub    $0xc,%esp
c00080e4:	50                   	push   %eax
c00080e5:	e8 01 fe ff ff       	call   c0007eeb <disp_int>
c00080ea:	83 c4 10             	add    $0x10,%esp
c00080ed:	83 ec 0c             	sub    $0xc,%esp
c00080f0:	68 00 b4 00 c0       	push   $0xc000b400
c00080f5:	e8 92 94 ff ff       	call   c000158c <disp_str>
c00080fa:	83 c4 10             	add    $0x10,%esp
c00080fd:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008101:	74 2f                	je     c0008132 <exception_handler+0xe1>
c0008103:	83 ec 0c             	sub    $0xc,%esp
c0008106:	68 0b b4 00 c0       	push   $0xc000b40b
c000810b:	e8 7c 94 ff ff       	call   c000158c <disp_str>
c0008110:	83 c4 10             	add    $0x10,%esp
c0008113:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008116:	83 ec 0c             	sub    $0xc,%esp
c0008119:	50                   	push   %eax
c000811a:	e8 cc fd ff ff       	call   c0007eeb <disp_int>
c000811f:	83 c4 10             	add    $0x10,%esp
c0008122:	83 ec 0c             	sub    $0xc,%esp
c0008125:	68 00 b4 00 c0       	push   $0xc000b400
c000812a:	e8 5d 94 ff ff       	call   c000158c <disp_str>
c000812f:	83 c4 10             	add    $0x10,%esp
c0008132:	83 ec 0c             	sub    $0xc,%esp
c0008135:	68 15 b4 00 c0       	push   $0xc000b415
c000813a:	e8 4d 94 ff ff       	call   c000158c <disp_str>
c000813f:	83 c4 10             	add    $0x10,%esp
c0008142:	83 ec 0c             	sub    $0xc,%esp
c0008145:	ff 75 14             	pushl  0x14(%ebp)
c0008148:	e8 9e fd ff ff       	call   c0007eeb <disp_int>
c000814d:	83 c4 10             	add    $0x10,%esp
c0008150:	83 ec 0c             	sub    $0xc,%esp
c0008153:	68 00 b4 00 c0       	push   $0xc000b400
c0008158:	e8 2f 94 ff ff       	call   c000158c <disp_str>
c000815d:	83 c4 10             	add    $0x10,%esp
c0008160:	83 ec 0c             	sub    $0xc,%esp
c0008163:	68 19 b4 00 c0       	push   $0xc000b419
c0008168:	e8 1f 94 ff ff       	call   c000158c <disp_str>
c000816d:	83 c4 10             	add    $0x10,%esp
c0008170:	8b 45 10             	mov    0x10(%ebp),%eax
c0008173:	83 ec 0c             	sub    $0xc,%esp
c0008176:	50                   	push   %eax
c0008177:	e8 6f fd ff ff       	call   c0007eeb <disp_int>
c000817c:	83 c4 10             	add    $0x10,%esp
c000817f:	83 ec 0c             	sub    $0xc,%esp
c0008182:	68 00 b4 00 c0       	push   $0xc000b400
c0008187:	e8 00 94 ff ff       	call   c000158c <disp_str>
c000818c:	83 c4 10             	add    $0x10,%esp
c000818f:	83 ec 0c             	sub    $0xc,%esp
c0008192:	68 1e b4 00 c0       	push   $0xc000b41e
c0008197:	e8 f0 93 ff ff       	call   c000158c <disp_str>
c000819c:	83 c4 10             	add    $0x10,%esp
c000819f:	83 ec 0c             	sub    $0xc,%esp
c00081a2:	ff 75 18             	pushl  0x18(%ebp)
c00081a5:	e8 41 fd ff ff       	call   c0007eeb <disp_int>
c00081aa:	83 c4 10             	add    $0x10,%esp
c00081ad:	83 ec 0c             	sub    $0xc,%esp
c00081b0:	68 00 b4 00 c0       	push   $0xc000b400
c00081b5:	e8 d2 93 ff ff       	call   c000158c <disp_str>
c00081ba:	83 c4 10             	add    $0x10,%esp
c00081bd:	83 ec 0c             	sub    $0xc,%esp
c00081c0:	68 28 b4 00 c0       	push   $0xc000b428
c00081c5:	e8 c2 93 ff ff       	call   c000158c <disp_str>
c00081ca:	83 c4 10             	add    $0x10,%esp
c00081cd:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c00081d1:	75 46                	jne    c0008219 <exception_handler+0x1c8>
c00081d3:	0f 20 d0             	mov    %cr2,%eax
c00081d6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00081d9:	83 ec 0c             	sub    $0xc,%esp
c00081dc:	68 47 b4 00 c0       	push   $0xc000b447
c00081e1:	e8 a6 93 ff ff       	call   c000158c <disp_str>
c00081e6:	83 c4 10             	add    $0x10,%esp
c00081e9:	83 ec 0c             	sub    $0xc,%esp
c00081ec:	68 cf b3 00 c0       	push   $0xc000b3cf
c00081f1:	e8 96 93 ff ff       	call   c000158c <disp_str>
c00081f6:	83 c4 10             	add    $0x10,%esp
c00081f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081fc:	83 ec 0c             	sub    $0xc,%esp
c00081ff:	50                   	push   %eax
c0008200:	e8 e6 fc ff ff       	call   c0007eeb <disp_int>
c0008205:	83 c4 10             	add    $0x10,%esp
c0008208:	83 ec 0c             	sub    $0xc,%esp
c000820b:	68 d4 b3 00 c0       	push   $0xc000b3d4
c0008210:	e8 77 93 ff ff       	call   c000158c <disp_str>
c0008215:	83 c4 10             	add    $0x10,%esp
c0008218:	90                   	nop
c0008219:	90                   	nop
c000821a:	8d 65 f4             	lea    -0xc(%ebp),%esp
c000821d:	5b                   	pop    %ebx
c000821e:	5e                   	pop    %esi
c000821f:	5f                   	pop    %edi
c0008220:	5d                   	pop    %ebp
c0008221:	c3                   	ret    

c0008222 <exception_handler2>:
c0008222:	55                   	push   %ebp
c0008223:	89 e5                	mov    %esp,%ebp
c0008225:	57                   	push   %edi
c0008226:	56                   	push   %esi
c0008227:	53                   	push   %ebx
c0008228:	83 ec 6c             	sub    $0x6c,%esp
c000822b:	8d 45 90             	lea    -0x70(%ebp),%eax
c000822e:	bb 60 b6 00 c0       	mov    $0xc000b660,%ebx
c0008233:	ba 13 00 00 00       	mov    $0x13,%edx
c0008238:	89 c7                	mov    %eax,%edi
c000823a:	89 de                	mov    %ebx,%esi
c000823c:	89 d1                	mov    %edx,%ecx
c000823e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008240:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c0008247:	2e 00 00 
c000824a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008251:	eb 14                	jmp    c0008267 <exception_handler2+0x45>
c0008253:	83 ec 0c             	sub    $0xc,%esp
c0008256:	68 ac b6 00 c0       	push   $0xc000b6ac
c000825b:	e8 2c 93 ff ff       	call   c000158c <disp_str>
c0008260:	83 c4 10             	add    $0x10,%esp
c0008263:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008267:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c000826e:	7e e3                	jle    c0008253 <exception_handler2+0x31>
c0008270:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c0008277:	2e 00 00 
c000827a:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008281:	8b 45 08             	mov    0x8(%ebp),%eax
c0008284:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0008288:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000828b:	83 ec 08             	sub    $0x8,%esp
c000828e:	ff 75 e0             	pushl  -0x20(%ebp)
c0008291:	ff 75 dc             	pushl  -0x24(%ebp)
c0008294:	e8 2e 93 ff ff       	call   c00015c7 <disp_str_colour>
c0008299:	83 c4 10             	add    $0x10,%esp
c000829c:	83 ec 0c             	sub    $0xc,%esp
c000829f:	68 00 b4 00 c0       	push   $0xc000b400
c00082a4:	e8 e3 92 ff ff       	call   c000158c <disp_str>
c00082a9:	83 c4 10             	add    $0x10,%esp
c00082ac:	83 ec 08             	sub    $0x8,%esp
c00082af:	ff 75 e0             	pushl  -0x20(%ebp)
c00082b2:	68 03 b4 00 c0       	push   $0xc000b403
c00082b7:	e8 0b 93 ff ff       	call   c00015c7 <disp_str_colour>
c00082bc:	83 c4 10             	add    $0x10,%esp
c00082bf:	83 ec 0c             	sub    $0xc,%esp
c00082c2:	ff 75 08             	pushl  0x8(%ebp)
c00082c5:	e8 21 fc ff ff       	call   c0007eeb <disp_int>
c00082ca:	83 c4 10             	add    $0x10,%esp
c00082cd:	83 ec 0c             	sub    $0xc,%esp
c00082d0:	68 00 b4 00 c0       	push   $0xc000b400
c00082d5:	e8 b2 92 ff ff       	call   c000158c <disp_str>
c00082da:	83 c4 10             	add    $0x10,%esp
c00082dd:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c00082e1:	74 44                	je     c0008327 <exception_handler2+0x105>
c00082e3:	83 ec 08             	sub    $0x8,%esp
c00082e6:	ff 75 e0             	pushl  -0x20(%ebp)
c00082e9:	68 0b b4 00 c0       	push   $0xc000b40b
c00082ee:	e8 d4 92 ff ff       	call   c00015c7 <disp_str_colour>
c00082f3:	83 c4 10             	add    $0x10,%esp
c00082f6:	83 ec 08             	sub    $0x8,%esp
c00082f9:	ff 75 e0             	pushl  -0x20(%ebp)
c00082fc:	68 0b b4 00 c0       	push   $0xc000b40b
c0008301:	e8 c1 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008306:	83 c4 10             	add    $0x10,%esp
c0008309:	83 ec 0c             	sub    $0xc,%esp
c000830c:	ff 75 0c             	pushl  0xc(%ebp)
c000830f:	e8 d7 fb ff ff       	call   c0007eeb <disp_int>
c0008314:	83 c4 10             	add    $0x10,%esp
c0008317:	83 ec 0c             	sub    $0xc,%esp
c000831a:	68 00 b4 00 c0       	push   $0xc000b400
c000831f:	e8 68 92 ff ff       	call   c000158c <disp_str>
c0008324:	83 c4 10             	add    $0x10,%esp
c0008327:	83 ec 08             	sub    $0x8,%esp
c000832a:	ff 75 e0             	pushl  -0x20(%ebp)
c000832d:	68 15 b4 00 c0       	push   $0xc000b415
c0008332:	e8 90 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008337:	83 c4 10             	add    $0x10,%esp
c000833a:	83 ec 0c             	sub    $0xc,%esp
c000833d:	ff 75 14             	pushl  0x14(%ebp)
c0008340:	e8 a6 fb ff ff       	call   c0007eeb <disp_int>
c0008345:	83 c4 10             	add    $0x10,%esp
c0008348:	83 ec 0c             	sub    $0xc,%esp
c000834b:	68 00 b4 00 c0       	push   $0xc000b400
c0008350:	e8 37 92 ff ff       	call   c000158c <disp_str>
c0008355:	83 c4 10             	add    $0x10,%esp
c0008358:	83 ec 08             	sub    $0x8,%esp
c000835b:	ff 75 e0             	pushl  -0x20(%ebp)
c000835e:	68 19 b4 00 c0       	push   $0xc000b419
c0008363:	e8 5f 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008368:	83 c4 10             	add    $0x10,%esp
c000836b:	83 ec 0c             	sub    $0xc,%esp
c000836e:	ff 75 10             	pushl  0x10(%ebp)
c0008371:	e8 75 fb ff ff       	call   c0007eeb <disp_int>
c0008376:	83 c4 10             	add    $0x10,%esp
c0008379:	83 ec 0c             	sub    $0xc,%esp
c000837c:	68 00 b4 00 c0       	push   $0xc000b400
c0008381:	e8 06 92 ff ff       	call   c000158c <disp_str>
c0008386:	83 c4 10             	add    $0x10,%esp
c0008389:	83 ec 08             	sub    $0x8,%esp
c000838c:	ff 75 e0             	pushl  -0x20(%ebp)
c000838f:	68 1e b4 00 c0       	push   $0xc000b41e
c0008394:	e8 2e 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008399:	83 c4 10             	add    $0x10,%esp
c000839c:	83 ec 0c             	sub    $0xc,%esp
c000839f:	ff 75 18             	pushl  0x18(%ebp)
c00083a2:	e8 44 fb ff ff       	call   c0007eeb <disp_int>
c00083a7:	83 c4 10             	add    $0x10,%esp
c00083aa:	83 ec 0c             	sub    $0xc,%esp
c00083ad:	68 00 b4 00 c0       	push   $0xc000b400
c00083b2:	e8 d5 91 ff ff       	call   c000158c <disp_str>
c00083b7:	83 c4 10             	add    $0x10,%esp
c00083ba:	90                   	nop
c00083bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00083be:	5b                   	pop    %ebx
c00083bf:	5e                   	pop    %esi
c00083c0:	5f                   	pop    %edi
c00083c1:	5d                   	pop    %ebp
c00083c2:	c3                   	ret    

c00083c3 <init_internal_interrupt>:
c00083c3:	55                   	push   %ebp
c00083c4:	89 e5                	mov    %esp,%ebp
c00083c6:	83 ec 08             	sub    $0x8,%esp
c00083c9:	6a 0e                	push   $0xe
c00083cb:	6a 08                	push   $0x8
c00083cd:	68 03 16 00 c0       	push   $0xc0001603
c00083d2:	6a 00                	push   $0x0
c00083d4:	e8 96 cd ff ff       	call   c000516f <InitInterruptDesc>
c00083d9:	83 c4 10             	add    $0x10,%esp
c00083dc:	6a 0e                	push   $0xe
c00083de:	6a 08                	push   $0x8
c00083e0:	68 09 16 00 c0       	push   $0xc0001609
c00083e5:	6a 01                	push   $0x1
c00083e7:	e8 83 cd ff ff       	call   c000516f <InitInterruptDesc>
c00083ec:	83 c4 10             	add    $0x10,%esp
c00083ef:	6a 0e                	push   $0xe
c00083f1:	6a 08                	push   $0x8
c00083f3:	68 0f 16 00 c0       	push   $0xc000160f
c00083f8:	6a 02                	push   $0x2
c00083fa:	e8 70 cd ff ff       	call   c000516f <InitInterruptDesc>
c00083ff:	83 c4 10             	add    $0x10,%esp
c0008402:	6a 0e                	push   $0xe
c0008404:	6a 08                	push   $0x8
c0008406:	68 15 16 00 c0       	push   $0xc0001615
c000840b:	6a 03                	push   $0x3
c000840d:	e8 5d cd ff ff       	call   c000516f <InitInterruptDesc>
c0008412:	83 c4 10             	add    $0x10,%esp
c0008415:	6a 0e                	push   $0xe
c0008417:	6a 08                	push   $0x8
c0008419:	68 1b 16 00 c0       	push   $0xc000161b
c000841e:	6a 04                	push   $0x4
c0008420:	e8 4a cd ff ff       	call   c000516f <InitInterruptDesc>
c0008425:	83 c4 10             	add    $0x10,%esp
c0008428:	6a 0e                	push   $0xe
c000842a:	6a 08                	push   $0x8
c000842c:	68 21 16 00 c0       	push   $0xc0001621
c0008431:	6a 05                	push   $0x5
c0008433:	e8 37 cd ff ff       	call   c000516f <InitInterruptDesc>
c0008438:	83 c4 10             	add    $0x10,%esp
c000843b:	6a 0e                	push   $0xe
c000843d:	6a 08                	push   $0x8
c000843f:	68 27 16 00 c0       	push   $0xc0001627
c0008444:	6a 06                	push   $0x6
c0008446:	e8 24 cd ff ff       	call   c000516f <InitInterruptDesc>
c000844b:	83 c4 10             	add    $0x10,%esp
c000844e:	6a 0e                	push   $0xe
c0008450:	6a 08                	push   $0x8
c0008452:	68 2d 16 00 c0       	push   $0xc000162d
c0008457:	6a 07                	push   $0x7
c0008459:	e8 11 cd ff ff       	call   c000516f <InitInterruptDesc>
c000845e:	83 c4 10             	add    $0x10,%esp
c0008461:	6a 0e                	push   $0xe
c0008463:	6a 08                	push   $0x8
c0008465:	68 33 16 00 c0       	push   $0xc0001633
c000846a:	6a 08                	push   $0x8
c000846c:	e8 fe cc ff ff       	call   c000516f <InitInterruptDesc>
c0008471:	83 c4 10             	add    $0x10,%esp
c0008474:	6a 0e                	push   $0xe
c0008476:	6a 08                	push   $0x8
c0008478:	68 37 16 00 c0       	push   $0xc0001637
c000847d:	6a 09                	push   $0x9
c000847f:	e8 eb cc ff ff       	call   c000516f <InitInterruptDesc>
c0008484:	83 c4 10             	add    $0x10,%esp
c0008487:	6a 0e                	push   $0xe
c0008489:	6a 08                	push   $0x8
c000848b:	68 3d 16 00 c0       	push   $0xc000163d
c0008490:	6a 0a                	push   $0xa
c0008492:	e8 d8 cc ff ff       	call   c000516f <InitInterruptDesc>
c0008497:	83 c4 10             	add    $0x10,%esp
c000849a:	6a 0e                	push   $0xe
c000849c:	6a 08                	push   $0x8
c000849e:	68 41 16 00 c0       	push   $0xc0001641
c00084a3:	6a 0b                	push   $0xb
c00084a5:	e8 c5 cc ff ff       	call   c000516f <InitInterruptDesc>
c00084aa:	83 c4 10             	add    $0x10,%esp
c00084ad:	6a 0e                	push   $0xe
c00084af:	6a 08                	push   $0x8
c00084b1:	68 45 16 00 c0       	push   $0xc0001645
c00084b6:	6a 0c                	push   $0xc
c00084b8:	e8 b2 cc ff ff       	call   c000516f <InitInterruptDesc>
c00084bd:	83 c4 10             	add    $0x10,%esp
c00084c0:	6a 0e                	push   $0xe
c00084c2:	6a 08                	push   $0x8
c00084c4:	68 49 16 00 c0       	push   $0xc0001649
c00084c9:	6a 0d                	push   $0xd
c00084cb:	e8 9f cc ff ff       	call   c000516f <InitInterruptDesc>
c00084d0:	83 c4 10             	add    $0x10,%esp
c00084d3:	6a 0e                	push   $0xe
c00084d5:	6a 08                	push   $0x8
c00084d7:	68 4d 16 00 c0       	push   $0xc000164d
c00084dc:	6a 0e                	push   $0xe
c00084de:	e8 8c cc ff ff       	call   c000516f <InitInterruptDesc>
c00084e3:	83 c4 10             	add    $0x10,%esp
c00084e6:	6a 0e                	push   $0xe
c00084e8:	6a 08                	push   $0x8
c00084ea:	68 51 16 00 c0       	push   $0xc0001651
c00084ef:	6a 10                	push   $0x10
c00084f1:	e8 79 cc ff ff       	call   c000516f <InitInterruptDesc>
c00084f6:	83 c4 10             	add    $0x10,%esp
c00084f9:	6a 0e                	push   $0xe
c00084fb:	6a 08                	push   $0x8
c00084fd:	68 57 16 00 c0       	push   $0xc0001657
c0008502:	6a 11                	push   $0x11
c0008504:	e8 66 cc ff ff       	call   c000516f <InitInterruptDesc>
c0008509:	83 c4 10             	add    $0x10,%esp
c000850c:	6a 0e                	push   $0xe
c000850e:	6a 08                	push   $0x8
c0008510:	68 5b 16 00 c0       	push   $0xc000165b
c0008515:	6a 12                	push   $0x12
c0008517:	e8 53 cc ff ff       	call   c000516f <InitInterruptDesc>
c000851c:	83 c4 10             	add    $0x10,%esp
c000851f:	6a 0e                	push   $0xe
c0008521:	6a 0e                	push   $0xe
c0008523:	68 17 17 00 c0       	push   $0xc0001717
c0008528:	68 90 00 00 00       	push   $0x90
c000852d:	e8 3d cc ff ff       	call   c000516f <InitInterruptDesc>
c0008532:	83 c4 10             	add    $0x10,%esp
c0008535:	90                   	nop
c0008536:	c9                   	leave  
c0008537:	c3                   	ret    

c0008538 <test>:
c0008538:	55                   	push   %ebp
c0008539:	89 e5                	mov    %esp,%ebp
c000853b:	83 ec 08             	sub    $0x8,%esp
c000853e:	83 ec 0c             	sub    $0xc,%esp
c0008541:	68 ae b6 00 c0       	push   $0xc000b6ae
c0008546:	e8 41 90 ff ff       	call   c000158c <disp_str>
c000854b:	83 c4 10             	add    $0x10,%esp
c000854e:	83 ec 0c             	sub    $0xc,%esp
c0008551:	68 d4 b3 00 c0       	push   $0xc000b3d4
c0008556:	e8 31 90 ff ff       	call   c000158c <disp_str>
c000855b:	83 c4 10             	add    $0x10,%esp
c000855e:	90                   	nop
c000855f:	c9                   	leave  
c0008560:	c3                   	ret    

c0008561 <disp_str_colour3>:
c0008561:	55                   	push   %ebp
c0008562:	89 e5                	mov    %esp,%ebp
c0008564:	90                   	nop
c0008565:	5d                   	pop    %ebp
c0008566:	c3                   	ret    

c0008567 <spurious_irq>:
c0008567:	55                   	push   %ebp
c0008568:	89 e5                	mov    %esp,%ebp
c000856a:	83 ec 08             	sub    $0x8,%esp
c000856d:	83 ec 08             	sub    $0x8,%esp
c0008570:	6a 0b                	push   $0xb
c0008572:	68 b0 b6 00 c0       	push   $0xc000b6b0
c0008577:	e8 4b 90 ff ff       	call   c00015c7 <disp_str_colour>
c000857c:	83 c4 10             	add    $0x10,%esp
c000857f:	83 ec 0c             	sub    $0xc,%esp
c0008582:	ff 75 08             	pushl  0x8(%ebp)
c0008585:	e8 61 f9 ff ff       	call   c0007eeb <disp_int>
c000858a:	83 c4 10             	add    $0x10,%esp
c000858d:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008592:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008598:	83 c0 01             	add    $0x1,%eax
c000859b:	83 d2 00             	adc    $0x0,%edx
c000859e:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c00085a3:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c00085a9:	83 ec 0c             	sub    $0xc,%esp
c00085ac:	68 d7 b6 00 c0       	push   $0xc000b6d7
c00085b1:	e8 d6 8f ff ff       	call   c000158c <disp_str>
c00085b6:	83 c4 10             	add    $0x10,%esp
c00085b9:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00085be:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c00085c4:	83 ec 0c             	sub    $0xc,%esp
c00085c7:	50                   	push   %eax
c00085c8:	e8 1e f9 ff ff       	call   c0007eeb <disp_int>
c00085cd:	83 c4 10             	add    $0x10,%esp
c00085d0:	83 ec 0c             	sub    $0xc,%esp
c00085d3:	68 d9 b6 00 c0       	push   $0xc000b6d9
c00085d8:	e8 af 8f ff ff       	call   c000158c <disp_str>
c00085dd:	83 c4 10             	add    $0x10,%esp
c00085e0:	83 ec 08             	sub    $0x8,%esp
c00085e3:	6a 0c                	push   $0xc
c00085e5:	68 dc b6 00 c0       	push   $0xc000b6dc
c00085ea:	e8 d8 8f ff ff       	call   c00015c7 <disp_str_colour>
c00085ef:	83 c4 10             	add    $0x10,%esp
c00085f2:	90                   	nop
c00085f3:	c9                   	leave  
c00085f4:	c3                   	ret    

c00085f5 <init_keyboard>:
c00085f5:	55                   	push   %ebp
c00085f6:	89 e5                	mov    %esp,%ebp
c00085f8:	83 ec 18             	sub    $0x18,%esp
c00085fb:	83 ec 04             	sub    $0x4,%esp
c00085fe:	68 00 02 00 00       	push   $0x200
c0008603:	6a 00                	push   $0x0
c0008605:	68 ec 0b 01 c0       	push   $0xc0010bec
c000860a:	e8 1c 35 00 00       	call   c000bb2b <Memset>
c000860f:	83 c4 10             	add    $0x10,%esp
c0008612:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0008619:	0b 01 c0 
c000861c:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0008621:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0008626:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c000862d:	00 00 00 
c0008630:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008637:	00 00 00 
c000863a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008641:	eb 04                	jmp    c0008647 <init_keyboard+0x52>
c0008643:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008647:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000864e:	7e f3                	jle    c0008643 <init_keyboard+0x4e>
c0008650:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008657:	00 00 00 
c000865a:	e8 1a d9 ff ff       	call   c0005f79 <init_keyboard_handler>
c000865f:	90                   	nop
c0008660:	c9                   	leave  
c0008661:	c3                   	ret    

c0008662 <init2>:
c0008662:	55                   	push   %ebp
c0008663:	89 e5                	mov    %esp,%ebp
c0008665:	83 ec 08             	sub    $0x8,%esp
c0008668:	83 ec 0c             	sub    $0xc,%esp
c000866b:	68 01 b7 00 c0       	push   $0xc000b701
c0008670:	e8 17 8f ff ff       	call   c000158c <disp_str>
c0008675:	83 c4 10             	add    $0x10,%esp
c0008678:	e8 78 ff ff ff       	call   c00085f5 <init_keyboard>
c000867d:	83 ec 0c             	sub    $0xc,%esp
c0008680:	68 00 00 00 02       	push   $0x2000000
c0008685:	e8 a8 f3 ff ff       	call   c0007a32 <init_memory>
c000868a:	83 c4 10             	add    $0x10,%esp
c000868d:	90                   	nop
c000868e:	c9                   	leave  
c000868f:	c3                   	ret    

c0008690 <u_thread_a>:
c0008690:	55                   	push   %ebp
c0008691:	89 e5                	mov    %esp,%ebp
c0008693:	83 ec 08             	sub    $0x8,%esp
c0008696:	83 ec 0c             	sub    $0xc,%esp
c0008699:	68 07 b7 00 c0       	push   $0xc000b707
c000869e:	e8 e9 8e ff ff       	call   c000158c <disp_str>
c00086a3:	83 c4 10             	add    $0x10,%esp
c00086a6:	eb fe                	jmp    c00086a6 <u_thread_a+0x16>

c00086a8 <kernel_main2>:
c00086a8:	55                   	push   %ebp
c00086a9:	89 e5                	mov    %esp,%ebp
c00086ab:	57                   	push   %edi
c00086ac:	56                   	push   %esi
c00086ad:	53                   	push   %ebx
c00086ae:	83 ec 3c             	sub    $0x3c,%esp
c00086b1:	83 ec 0c             	sub    $0xc,%esp
c00086b4:	68 15 b7 00 c0       	push   $0xc000b715
c00086b9:	e8 ce 8e ff ff       	call   c000158c <disp_str>
c00086be:	83 c4 10             	add    $0x10,%esp
c00086c1:	e8 ad 92 ff ff       	call   c0001973 <init>
c00086c6:	c7 05 e8 1e 01 c0 00 	movl   $0x0,0xc0011ee8
c00086cd:	00 00 00 
c00086d0:	c7 05 ec 1e 01 c0 00 	movl   $0x0,0xc0011eec
c00086d7:	00 00 00 
c00086da:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c00086e1:	00 00 00 
c00086e4:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c00086eb:	00 00 00 
c00086ee:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c00086f5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00086fc:	e9 01 02 00 00       	jmp    c0008902 <kernel_main2+0x25a>
c0008701:	83 ec 08             	sub    $0x8,%esp
c0008704:	6a 00                	push   $0x0
c0008706:	6a 01                	push   $0x1
c0008708:	e8 f9 eb ff ff       	call   c0007306 <alloc_memory>
c000870d:	83 c4 10             	add    $0x10,%esp
c0008710:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008713:	83 ec 04             	sub    $0x4,%esp
c0008716:	68 b4 02 00 00       	push   $0x2b4
c000871b:	6a 00                	push   $0x0
c000871d:	ff 75 d8             	pushl  -0x28(%ebp)
c0008720:	e8 06 34 00 00       	call   c000bb2b <Memset>
c0008725:	83 c4 10             	add    $0x10,%esp
c0008728:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000872b:	05 00 10 00 00       	add    $0x1000,%eax
c0008730:	89 c2                	mov    %eax,%edx
c0008732:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008735:	89 10                	mov    %edx,(%eax)
c0008737:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000873a:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c0008741:	00 00 
c0008743:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008746:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008749:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000874f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008752:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0008759:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c000875d:	7e 0f                	jle    c000876e <kernel_main2+0xc6>
c000875f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008762:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0008769:	e9 90 01 00 00       	jmp    c00088fe <kernel_main2+0x256>
c000876e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008771:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0008778:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000877c:	7f 73                	jg     c00087f1 <kernel_main2+0x149>
c000877e:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c0008785:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c000878c:	c7 45 d0 2c 00 00 00 	movl   $0x2c,-0x30(%ebp)
c0008793:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008796:	8b 00                	mov    (%eax),%eax
c0008798:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c000879b:	89 c2                	mov    %eax,%edx
c000879d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087a0:	89 10                	mov    %edx,(%eax)
c00087a2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087a5:	8b 00                	mov    (%eax),%eax
c00087a7:	2b 45 d0             	sub    -0x30(%ebp),%eax
c00087aa:	89 c2                	mov    %eax,%edx
c00087ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087af:	89 10                	mov    %edx,(%eax)
c00087b1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087b4:	8b 00                	mov    (%eax),%eax
c00087b6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00087b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00087bc:	8b 50 14             	mov    0x14(%eax),%edx
c00087bf:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087c2:	89 50 28             	mov    %edx,0x28(%eax)
c00087c5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087c8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00087ce:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087d1:	8b 10                	mov    (%eax),%edx
c00087d3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087d6:	89 50 04             	mov    %edx,0x4(%eax)
c00087d9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087dc:	8b 50 04             	mov    0x4(%eax),%edx
c00087df:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087e2:	89 50 08             	mov    %edx,0x8(%eax)
c00087e5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087e8:	8b 50 08             	mov    0x8(%eax),%edx
c00087eb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087ee:	89 50 0c             	mov    %edx,0xc(%eax)
c00087f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00087f4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00087f7:	81 c2 34 01 00 00    	add    $0x134,%edx
c00087fd:	83 ec 08             	sub    $0x8,%esp
c0008800:	50                   	push   %eax
c0008801:	52                   	push   %edx
c0008802:	e8 43 33 00 00       	call   c000bb4a <Strcpy>
c0008807:	83 c4 10             	add    $0x10,%esp
c000880a:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c000880e:	83 c8 04             	or     $0x4,%eax
c0008811:	0f b6 c0             	movzbl %al,%eax
c0008814:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c0008818:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c000881c:	83 c8 0c             	or     $0xc,%eax
c000881f:	0f b6 c0             	movzbl %al,%eax
c0008822:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c0008826:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c000882a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000882d:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c0008833:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008837:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000883a:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c0008840:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008844:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008847:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c000884d:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008851:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008854:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c000885a:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000885e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008861:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c0008867:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000886a:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c0008871:	00 00 00 
c0008874:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008877:	8b 50 14             	mov    0x14(%eax),%edx
c000887a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000887d:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008883:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008886:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0008889:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c000888f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008892:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0008899:	00 00 00 
c000889c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000889f:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00088a6:	00 00 00 
c00088a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088ac:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00088b3:	00 00 00 
c00088b6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088b9:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c00088c0:	00 00 00 
c00088c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088c6:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00088cd:	00 00 00 
c00088d0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088d3:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00088da:	00 00 00 
c00088dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00088e0:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00088e6:	8d 90 00 32 08 c0    	lea    -0x3ff7ce00(%eax),%edx
c00088ec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088ef:	89 c3                	mov    %eax,%ebx
c00088f1:	b8 ad 00 00 00       	mov    $0xad,%eax
c00088f6:	89 d7                	mov    %edx,%edi
c00088f8:	89 de                	mov    %ebx,%esi
c00088fa:	89 c1                	mov    %eax,%ecx
c00088fc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00088fe:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008902:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0008906:	0f 8e f5 fd ff ff    	jle    c0008701 <kernel_main2+0x59>
c000890c:	c7 05 c0 0b 01 c0 00 	movl   $0xc0083200,0xc0010bc0
c0008913:	32 08 c0 
c0008916:	eb fe                	jmp    c0008916 <kernel_main2+0x26e>

c0008918 <TestTTY>:
c0008918:	55                   	push   %ebp
c0008919:	89 e5                	mov    %esp,%ebp
c000891b:	83 ec 28             	sub    $0x28,%esp
c000891e:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008925:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000892c:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008932:	83 ec 08             	sub    $0x8,%esp
c0008935:	6a 02                	push   $0x2
c0008937:	8d 45 de             	lea    -0x22(%ebp),%eax
c000893a:	50                   	push   %eax
c000893b:	e8 df d7 ff ff       	call   c000611f <open>
c0008940:	83 c4 10             	add    $0x10,%esp
c0008943:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008946:	83 ec 08             	sub    $0x8,%esp
c0008949:	6a 02                	push   $0x2
c000894b:	8d 45 de             	lea    -0x22(%ebp),%eax
c000894e:	50                   	push   %eax
c000894f:	e8 cb d7 ff ff       	call   c000611f <open>
c0008954:	83 c4 10             	add    $0x10,%esp
c0008957:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000895a:	83 ec 0c             	sub    $0xc,%esp
c000895d:	68 21 b7 00 c0       	push   $0xc000b721
c0008962:	e8 03 0a 00 00       	call   c000936a <Printf>
c0008967:	83 c4 10             	add    $0x10,%esp
c000896a:	83 ec 0c             	sub    $0xc,%esp
c000896d:	6a 0a                	push   $0xa
c000896f:	e8 30 a0 ff ff       	call   c00029a4 <sys_malloc>
c0008974:	83 c4 10             	add    $0x10,%esp
c0008977:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000897a:	83 ec 04             	sub    $0x4,%esp
c000897d:	6a 0a                	push   $0xa
c000897f:	6a 00                	push   $0x0
c0008981:	ff 75 ec             	pushl  -0x14(%ebp)
c0008984:	e8 a2 31 00 00       	call   c000bb2b <Memset>
c0008989:	83 c4 10             	add    $0x10,%esp
c000898c:	83 ec 04             	sub    $0x4,%esp
c000898f:	6a 0a                	push   $0xa
c0008991:	ff 75 ec             	pushl  -0x14(%ebp)
c0008994:	ff 75 f0             	pushl  -0x10(%ebp)
c0008997:	e8 08 d8 ff ff       	call   c00061a4 <read>
c000899c:	83 c4 10             	add    $0x10,%esp
c000899f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00089a2:	83 ec 08             	sub    $0x8,%esp
c00089a5:	ff 75 ec             	pushl  -0x14(%ebp)
c00089a8:	68 33 b7 00 c0       	push   $0xc000b733
c00089ad:	e8 b8 09 00 00       	call   c000936a <Printf>
c00089b2:	83 c4 10             	add    $0x10,%esp
c00089b5:	eb c3                	jmp    c000897a <TestTTY+0x62>

c00089b7 <TestFS>:
c00089b7:	55                   	push   %ebp
c00089b8:	89 e5                	mov    %esp,%ebp
c00089ba:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c00089c0:	83 ec 0c             	sub    $0xc,%esp
c00089c3:	68 3d b7 00 c0       	push   $0xc000b73d
c00089c8:	e8 bf 8b ff ff       	call   c000158c <disp_str>
c00089cd:	83 c4 10             	add    $0x10,%esp
c00089d0:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c00089d7:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c00089de:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c00089e4:	83 ec 08             	sub    $0x8,%esp
c00089e7:	6a 02                	push   $0x2
c00089e9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00089ec:	50                   	push   %eax
c00089ed:	e8 2d d7 ff ff       	call   c000611f <open>
c00089f2:	83 c4 10             	add    $0x10,%esp
c00089f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00089f8:	83 ec 08             	sub    $0x8,%esp
c00089fb:	6a 02                	push   $0x2
c00089fd:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008a00:	50                   	push   %eax
c0008a01:	e8 19 d7 ff ff       	call   c000611f <open>
c0008a06:	83 c4 10             	add    $0x10,%esp
c0008a09:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a0c:	83 ec 0c             	sub    $0xc,%esp
c0008a0f:	68 21 b7 00 c0       	push   $0xc000b721
c0008a14:	e8 51 09 00 00       	call   c000936a <Printf>
c0008a19:	83 c4 10             	add    $0x10,%esp
c0008a1c:	90                   	nop
c0008a1d:	c9                   	leave  
c0008a1e:	c3                   	ret    

c0008a1f <wait_exit>:
c0008a1f:	55                   	push   %ebp
c0008a20:	89 e5                	mov    %esp,%ebp
c0008a22:	83 ec 28             	sub    $0x28,%esp
c0008a25:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008a2c:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008a33:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008a39:	83 ec 08             	sub    $0x8,%esp
c0008a3c:	6a 02                	push   $0x2
c0008a3e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a41:	50                   	push   %eax
c0008a42:	e8 d8 d6 ff ff       	call   c000611f <open>
c0008a47:	83 c4 10             	add    $0x10,%esp
c0008a4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a4d:	83 ec 08             	sub    $0x8,%esp
c0008a50:	6a 02                	push   $0x2
c0008a52:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a55:	50                   	push   %eax
c0008a56:	e8 c4 d6 ff ff       	call   c000611f <open>
c0008a5b:	83 c4 10             	add    $0x10,%esp
c0008a5e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a61:	e8 d9 d8 ff ff       	call   c000633f <fork>
c0008a66:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a69:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008a6d:	7e 25                	jle    c0008a94 <wait_exit+0x75>
c0008a6f:	83 ec 0c             	sub    $0xc,%esp
c0008a72:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008a75:	50                   	push   %eax
c0008a76:	e8 5d d8 ff ff       	call   c00062d8 <wait>
c0008a7b:	83 c4 10             	add    $0x10,%esp
c0008a7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a81:	83 ec 08             	sub    $0x8,%esp
c0008a84:	50                   	push   %eax
c0008a85:	68 45 b7 00 c0       	push   $0xc000b745
c0008a8a:	e8 db 08 00 00       	call   c000936a <Printf>
c0008a8f:	83 c4 10             	add    $0x10,%esp
c0008a92:	eb fe                	jmp    c0008a92 <wait_exit+0x73>
c0008a94:	83 ec 0c             	sub    $0xc,%esp
c0008a97:	68 60 b7 00 c0       	push   $0xc000b760
c0008a9c:	e8 c9 08 00 00       	call   c000936a <Printf>
c0008aa1:	83 c4 10             	add    $0x10,%esp
c0008aa4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008aae:	8d 50 01             	lea    0x1(%eax),%edx
c0008ab1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008ab4:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008ab9:	7f 02                	jg     c0008abd <wait_exit+0x9e>
c0008abb:	eb ee                	jmp    c0008aab <wait_exit+0x8c>
c0008abd:	90                   	nop
c0008abe:	83 ec 0c             	sub    $0xc,%esp
c0008ac1:	68 6c b7 00 c0       	push   $0xc000b76c
c0008ac6:	e8 9f 08 00 00       	call   c000936a <Printf>
c0008acb:	83 c4 10             	add    $0x10,%esp
c0008ace:	83 ec 0c             	sub    $0xc,%esp
c0008ad1:	6a 09                	push   $0x9
c0008ad3:	e8 3e d8 ff ff       	call   c0006316 <exit>
c0008ad8:	83 c4 10             	add    $0x10,%esp
c0008adb:	83 ec 0c             	sub    $0xc,%esp
c0008ade:	68 7a b7 00 c0       	push   $0xc000b77a
c0008ae3:	e8 82 08 00 00       	call   c000936a <Printf>
c0008ae8:	83 c4 10             	add    $0x10,%esp
c0008aeb:	eb fe                	jmp    c0008aeb <wait_exit+0xcc>

c0008aed <INIT_fork>:
c0008aed:	55                   	push   %ebp
c0008aee:	89 e5                	mov    %esp,%ebp
c0008af0:	53                   	push   %ebx
c0008af1:	83 ec 74             	sub    $0x74,%esp
c0008af4:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008afb:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008b02:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008b08:	83 ec 08             	sub    $0x8,%esp
c0008b0b:	6a 02                	push   $0x2
c0008b0d:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008b10:	50                   	push   %eax
c0008b11:	e8 09 d6 ff ff       	call   c000611f <open>
c0008b16:	83 c4 10             	add    $0x10,%esp
c0008b19:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008b1c:	83 ec 08             	sub    $0x8,%esp
c0008b1f:	6a 02                	push   $0x2
c0008b21:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008b24:	50                   	push   %eax
c0008b25:	e8 f5 d5 ff ff       	call   c000611f <open>
c0008b2a:	83 c4 10             	add    $0x10,%esp
c0008b2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008b30:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008b37:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008b3e:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008b45:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008b4c:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008b53:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008b5a:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008b61:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008b68:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008b6f:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008b76:	83 ec 0c             	sub    $0xc,%esp
c0008b79:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b7c:	50                   	push   %eax
c0008b7d:	e8 e8 07 00 00       	call   c000936a <Printf>
c0008b82:	83 c4 10             	add    $0x10,%esp
c0008b85:	83 ec 0c             	sub    $0xc,%esp
c0008b88:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b8b:	50                   	push   %eax
c0008b8c:	e8 d3 2f 00 00       	call   c000bb64 <Strlen>
c0008b91:	83 c4 10             	add    $0x10,%esp
c0008b94:	83 ec 04             	sub    $0x4,%esp
c0008b97:	50                   	push   %eax
c0008b98:	6a 00                	push   $0x0
c0008b9a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b9d:	50                   	push   %eax
c0008b9e:	e8 88 2f 00 00       	call   c000bb2b <Memset>
c0008ba3:	83 c4 10             	add    $0x10,%esp
c0008ba6:	83 ec 04             	sub    $0x4,%esp
c0008ba9:	6a 28                	push   $0x28
c0008bab:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008bae:	50                   	push   %eax
c0008baf:	ff 75 f0             	pushl  -0x10(%ebp)
c0008bb2:	e8 ed d5 ff ff       	call   c00061a4 <read>
c0008bb7:	83 c4 10             	add    $0x10,%esp
c0008bba:	83 ec 0c             	sub    $0xc,%esp
c0008bbd:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008bc0:	50                   	push   %eax
c0008bc1:	e8 a4 07 00 00       	call   c000936a <Printf>
c0008bc6:	83 c4 10             	add    $0x10,%esp
c0008bc9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008bd0:	e8 6a d7 ff ff       	call   c000633f <fork>
c0008bd5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008bd8:	66 87 db             	xchg   %bx,%bx
c0008bdb:	83 ec 0c             	sub    $0xc,%esp
c0008bde:	6a 01                	push   $0x1
c0008be0:	e8 51 06 00 00       	call   c0009236 <delay>
c0008be5:	83 c4 10             	add    $0x10,%esp
c0008be8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008bec:	7e 7a                	jle    c0008c68 <INIT_fork+0x17b>
c0008bee:	83 ec 0c             	sub    $0xc,%esp
c0008bf1:	68 88 b7 00 c0       	push   $0xc000b788
c0008bf6:	e8 6f 07 00 00       	call   c000936a <Printf>
c0008bfb:	83 c4 10             	add    $0x10,%esp
c0008bfe:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008c02:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0008c09:	c7 45 92 6e 74 0a 00 	movl   $0xa746e,-0x6e(%ebp)
c0008c10:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008c13:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008c18:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008c1d:	89 18                	mov    %ebx,(%eax)
c0008c1f:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008c23:	8d 50 04             	lea    0x4(%eax),%edx
c0008c26:	83 e2 fc             	and    $0xfffffffc,%edx
c0008c29:	29 d0                	sub    %edx,%eax
c0008c2b:	01 c1                	add    %eax,%ecx
c0008c2d:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008c30:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008c33:	b8 00 00 00 00       	mov    $0x0,%eax
c0008c38:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008c3b:	83 c0 04             	add    $0x4,%eax
c0008c3e:	39 c8                	cmp    %ecx,%eax
c0008c40:	72 f6                	jb     c0008c38 <INIT_fork+0x14b>
c0008c42:	01 c2                	add    %eax,%edx
c0008c44:	83 ec 0c             	sub    $0xc,%esp
c0008c47:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c4a:	50                   	push   %eax
c0008c4b:	e8 14 2f 00 00       	call   c000bb64 <Strlen>
c0008c50:	83 c4 10             	add    $0x10,%esp
c0008c53:	83 ec 04             	sub    $0x4,%esp
c0008c56:	50                   	push   %eax
c0008c57:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c5a:	50                   	push   %eax
c0008c5b:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c5e:	e8 b5 d5 ff ff       	call   c0006218 <write>
c0008c63:	83 c4 10             	add    $0x10,%esp
c0008c66:	eb fe                	jmp    c0008c66 <INIT_fork+0x179>
c0008c68:	83 ec 0c             	sub    $0xc,%esp
c0008c6b:	6a 01                	push   $0x1
c0008c6d:	e8 c4 05 00 00       	call   c0009236 <delay>
c0008c72:	83 c4 10             	add    $0x10,%esp
c0008c75:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008c79:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008c7d:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0008c84:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0008c8b:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0008c92:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0008c99:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0008ca0:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0008ca7:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008cae:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008cb5:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008cbc:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008cc3:	66 87 db             	xchg   %bx,%bx
c0008cc6:	83 ec 0c             	sub    $0xc,%esp
c0008cc9:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008ccc:	50                   	push   %eax
c0008ccd:	e8 92 2e 00 00       	call   c000bb64 <Strlen>
c0008cd2:	83 c4 10             	add    $0x10,%esp
c0008cd5:	83 ec 04             	sub    $0x4,%esp
c0008cd8:	50                   	push   %eax
c0008cd9:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008cdc:	50                   	push   %eax
c0008cdd:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ce0:	e8 33 d5 ff ff       	call   c0006218 <write>
c0008ce5:	83 c4 10             	add    $0x10,%esp
c0008ce8:	eb fe                	jmp    c0008ce8 <INIT_fork+0x1fb>

c0008cea <simple_shell>:
c0008cea:	55                   	push   %ebp
c0008ceb:	89 e5                	mov    %esp,%ebp
c0008ced:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008cf3:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008cfa:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008d01:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008d07:	83 ec 08             	sub    $0x8,%esp
c0008d0a:	6a 02                	push   $0x2
c0008d0c:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008d0f:	50                   	push   %eax
c0008d10:	e8 0a d4 ff ff       	call   c000611f <open>
c0008d15:	83 c4 10             	add    $0x10,%esp
c0008d18:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008d1b:	83 ec 08             	sub    $0x8,%esp
c0008d1e:	6a 02                	push   $0x2
c0008d20:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008d23:	50                   	push   %eax
c0008d24:	e8 f6 d3 ff ff       	call   c000611f <open>
c0008d29:	83 c4 10             	add    $0x10,%esp
c0008d2c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008d2f:	83 ec 04             	sub    $0x4,%esp
c0008d32:	68 80 00 00 00       	push   $0x80
c0008d37:	6a 00                	push   $0x0
c0008d39:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d3f:	50                   	push   %eax
c0008d40:	e8 e6 2d 00 00       	call   c000bb2b <Memset>
c0008d45:	83 c4 10             	add    $0x10,%esp
c0008d48:	83 ec 04             	sub    $0x4,%esp
c0008d4b:	68 80 00 00 00       	push   $0x80
c0008d50:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d56:	50                   	push   %eax
c0008d57:	ff 75 e0             	pushl  -0x20(%ebp)
c0008d5a:	e8 45 d4 ff ff       	call   c00061a4 <read>
c0008d5f:	83 c4 10             	add    $0x10,%esp
c0008d62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d69:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008d70:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d76:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d79:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d7c:	0f b6 00             	movzbl (%eax),%eax
c0008d7f:	88 45 db             	mov    %al,-0x25(%ebp)
c0008d82:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d85:	0f b6 00             	movzbl (%eax),%eax
c0008d88:	3c 20                	cmp    $0x20,%al
c0008d8a:	74 1d                	je     c0008da9 <simple_shell+0xbf>
c0008d8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d8f:	0f b6 00             	movzbl (%eax),%eax
c0008d92:	84 c0                	test   %al,%al
c0008d94:	74 13                	je     c0008da9 <simple_shell+0xbf>
c0008d96:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008d9a:	75 0d                	jne    c0008da9 <simple_shell+0xbf>
c0008d9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d9f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008da2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008da9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dac:	0f b6 00             	movzbl (%eax),%eax
c0008daf:	3c 20                	cmp    $0x20,%al
c0008db1:	74 0a                	je     c0008dbd <simple_shell+0xd3>
c0008db3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008db6:	0f b6 00             	movzbl (%eax),%eax
c0008db9:	84 c0                	test   %al,%al
c0008dbb:	75 26                	jne    c0008de3 <simple_shell+0xf9>
c0008dbd:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008dc1:	75 20                	jne    c0008de3 <simple_shell+0xf9>
c0008dc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008dc6:	8d 50 01             	lea    0x1(%eax),%edx
c0008dc9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008dcc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008dcf:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008dd6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dd9:	c6 00 00             	movb   $0x0,(%eax)
c0008ddc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008de3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008de7:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008deb:	75 8c                	jne    c0008d79 <simple_shell+0x8f>
c0008ded:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008df0:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008df7:	00 00 00 00 
c0008dfb:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008e02:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e08:	83 ec 08             	sub    $0x8,%esp
c0008e0b:	6a 02                	push   $0x2
c0008e0d:	50                   	push   %eax
c0008e0e:	e8 0c d3 ff ff       	call   c000611f <open>
c0008e13:	83 c4 10             	add    $0x10,%esp
c0008e16:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008e19:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008e1d:	75 54                	jne    c0008e73 <simple_shell+0x189>
c0008e1f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008e26:	eb 29                	jmp    c0008e51 <simple_shell+0x167>
c0008e28:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008e2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008e31:	01 d0                	add    %edx,%eax
c0008e33:	0f b6 00             	movzbl (%eax),%eax
c0008e36:	0f be c0             	movsbl %al,%eax
c0008e39:	83 ec 04             	sub    $0x4,%esp
c0008e3c:	50                   	push   %eax
c0008e3d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008e40:	68 8e b7 00 c0       	push   $0xc000b78e
c0008e45:	e8 20 05 00 00       	call   c000936a <Printf>
c0008e4a:	83 c4 10             	add    $0x10,%esp
c0008e4d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008e51:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008e55:	7e d1                	jle    c0008e28 <simple_shell+0x13e>
c0008e57:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e5d:	83 ec 08             	sub    $0x8,%esp
c0008e60:	50                   	push   %eax
c0008e61:	68 95 b7 00 c0       	push   $0xc000b795
c0008e66:	e8 ff 04 00 00       	call   c000936a <Printf>
c0008e6b:	83 c4 10             	add    $0x10,%esp
c0008e6e:	e9 bc fe ff ff       	jmp    c0008d2f <simple_shell+0x45>
c0008e73:	e8 c7 d4 ff ff       	call   c000633f <fork>
c0008e78:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008e7b:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008e7f:	7e 17                	jle    c0008e98 <simple_shell+0x1ae>
c0008e81:	83 ec 0c             	sub    $0xc,%esp
c0008e84:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008e8a:	50                   	push   %eax
c0008e8b:	e8 48 d4 ff ff       	call   c00062d8 <wait>
c0008e90:	83 c4 10             	add    $0x10,%esp
c0008e93:	e9 97 fe ff ff       	jmp    c0008d2f <simple_shell+0x45>
c0008e98:	83 ec 0c             	sub    $0xc,%esp
c0008e9b:	ff 75 d0             	pushl  -0x30(%ebp)
c0008e9e:	e8 e9 d3 ff ff       	call   c000628c <close>
c0008ea3:	83 c4 10             	add    $0x10,%esp
c0008ea6:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008eac:	83 ec 08             	sub    $0x8,%esp
c0008eaf:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008eb5:	52                   	push   %edx
c0008eb6:	50                   	push   %eax
c0008eb7:	e8 72 d5 ff ff       	call   c000642e <execv>
c0008ebc:	83 c4 10             	add    $0x10,%esp
c0008ebf:	eb fe                	jmp    c0008ebf <simple_shell+0x1d5>

c0008ec1 <test_split_str>:
c0008ec1:	55                   	push   %ebp
c0008ec2:	89 e5                	mov    %esp,%ebp
c0008ec4:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008eca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ed1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008ed8:	c7 45 ec 9b b7 00 c0 	movl   $0xc000b79b,-0x14(%ebp)
c0008edf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008ee3:	75 1a                	jne    c0008eff <test_split_str+0x3e>
c0008ee5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ee8:	0f b6 00             	movzbl (%eax),%eax
c0008eeb:	0f be c0             	movsbl %al,%eax
c0008eee:	83 ec 08             	sub    $0x8,%esp
c0008ef1:	50                   	push   %eax
c0008ef2:	68 ac b7 00 c0       	push   $0xc000b7ac
c0008ef7:	e8 6e 04 00 00       	call   c000936a <Printf>
c0008efc:	83 c4 10             	add    $0x10,%esp
c0008eff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f02:	0f b6 00             	movzbl (%eax),%eax
c0008f05:	3c 20                	cmp    $0x20,%al
c0008f07:	75 0a                	jne    c0008f13 <test_split_str+0x52>
c0008f09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f0c:	0f b6 00             	movzbl (%eax),%eax
c0008f0f:	84 c0                	test   %al,%al
c0008f11:	74 13                	je     c0008f26 <test_split_str+0x65>
c0008f13:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008f17:	75 0d                	jne    c0008f26 <test_split_str+0x65>
c0008f19:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f1c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008f1f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008f26:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f29:	0f b6 00             	movzbl (%eax),%eax
c0008f2c:	3c 20                	cmp    $0x20,%al
c0008f2e:	74 0a                	je     c0008f3a <test_split_str+0x79>
c0008f30:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f33:	0f b6 00             	movzbl (%eax),%eax
c0008f36:	84 c0                	test   %al,%al
c0008f38:	75 26                	jne    c0008f60 <test_split_str+0x9f>
c0008f3a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008f3e:	75 20                	jne    c0008f60 <test_split_str+0x9f>
c0008f40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f43:	8d 50 01             	lea    0x1(%eax),%edx
c0008f46:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008f49:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008f4c:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008f53:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f56:	c6 00 00             	movb   $0x0,(%eax)
c0008f59:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008f60:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008f64:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f67:	0f b6 00             	movzbl (%eax),%eax
c0008f6a:	84 c0                	test   %al,%al
c0008f6c:	0f 85 6d ff ff ff    	jne    c0008edf <test_split_str+0x1e>
c0008f72:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f75:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008f78:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008f7f:	83 ec 08             	sub    $0x8,%esp
c0008f82:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f85:	68 b5 b7 00 c0       	push   $0xc000b7b5
c0008f8a:	e8 db 03 00 00       	call   c000936a <Printf>
c0008f8f:	83 c4 10             	add    $0x10,%esp
c0008f92:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008f99:	eb 22                	jmp    c0008fbd <test_split_str+0xfc>
c0008f9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f9e:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008fa5:	83 ec 04             	sub    $0x4,%esp
c0008fa8:	50                   	push   %eax
c0008fa9:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008fac:	68 cc b7 00 c0       	push   $0xc000b7cc
c0008fb1:	e8 b4 03 00 00       	call   c000936a <Printf>
c0008fb6:	83 c4 10             	add    $0x10,%esp
c0008fb9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008fbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008fc0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008fc3:	7e d6                	jle    c0008f9b <test_split_str+0xda>
c0008fc5:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008fcb:	83 ec 08             	sub    $0x8,%esp
c0008fce:	68 db b7 00 c0       	push   $0xc000b7db
c0008fd3:	50                   	push   %eax
c0008fd4:	e8 ba 12 00 00       	call   c000a293 <strcmp>
c0008fd9:	83 c4 10             	add    $0x10,%esp
c0008fdc:	85 c0                	test   %eax,%eax
c0008fde:	75 10                	jne    c0008ff0 <test_split_str+0x12f>
c0008fe0:	83 ec 0c             	sub    $0xc,%esp
c0008fe3:	68 e0 b7 00 c0       	push   $0xc000b7e0
c0008fe8:	e8 7d 03 00 00       	call   c000936a <Printf>
c0008fed:	83 c4 10             	add    $0x10,%esp
c0008ff0:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008ff6:	83 ec 08             	sub    $0x8,%esp
c0008ff9:	50                   	push   %eax
c0008ffa:	68 ec b7 00 c0       	push   $0xc000b7ec
c0008fff:	e8 66 03 00 00       	call   c000936a <Printf>
c0009004:	83 c4 10             	add    $0x10,%esp
c0009007:	83 ec 0c             	sub    $0xc,%esp
c000900a:	68 fa b7 00 c0       	push   $0xc000b7fa
c000900f:	e8 56 03 00 00       	call   c000936a <Printf>
c0009014:	83 c4 10             	add    $0x10,%esp
c0009017:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000901e:	eb 26                	jmp    c0009046 <test_split_str+0x185>
c0009020:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0009026:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009029:	01 d0                	add    %edx,%eax
c000902b:	0f b6 00             	movzbl (%eax),%eax
c000902e:	0f be c0             	movsbl %al,%eax
c0009031:	83 ec 08             	sub    $0x8,%esp
c0009034:	50                   	push   %eax
c0009035:	68 09 b8 00 c0       	push   $0xc000b809
c000903a:	e8 2b 03 00 00       	call   c000936a <Printf>
c000903f:	83 c4 10             	add    $0x10,%esp
c0009042:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0009046:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c000904a:	7e d4                	jle    c0009020 <test_split_str+0x15f>
c000904c:	c9                   	leave  
c000904d:	c3                   	ret    

c000904e <test_shell>:
c000904e:	55                   	push   %ebp
c000904f:	89 e5                	mov    %esp,%ebp
c0009051:	83 ec 48             	sub    $0x48,%esp
c0009054:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c000905b:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0009062:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0009068:	83 ec 08             	sub    $0x8,%esp
c000906b:	6a 02                	push   $0x2
c000906d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0009070:	50                   	push   %eax
c0009071:	e8 a9 d0 ff ff       	call   c000611f <open>
c0009076:	83 c4 10             	add    $0x10,%esp
c0009079:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000907c:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0009083:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c000908a:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0009091:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0009098:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c000909f:	83 ec 0c             	sub    $0xc,%esp
c00090a2:	8d 45 ce             	lea    -0x32(%ebp),%eax
c00090a5:	50                   	push   %eax
c00090a6:	e8 90 eb ff ff       	call   c0007c3b <untar>
c00090ab:	83 c4 10             	add    $0x10,%esp
c00090ae:	e8 8c d2 ff ff       	call   c000633f <fork>
c00090b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00090b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00090ba:	7e 25                	jle    c00090e1 <test_shell+0x93>
c00090bc:	83 ec 0c             	sub    $0xc,%esp
c00090bf:	8d 45 c8             	lea    -0x38(%ebp),%eax
c00090c2:	50                   	push   %eax
c00090c3:	e8 10 d2 ff ff       	call   c00062d8 <wait>
c00090c8:	83 c4 10             	add    $0x10,%esp
c00090cb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00090ce:	83 ec 08             	sub    $0x8,%esp
c00090d1:	50                   	push   %eax
c00090d2:	68 12 b8 00 c0       	push   $0xc000b812
c00090d7:	e8 8e 02 00 00       	call   c000936a <Printf>
c00090dc:	83 c4 10             	add    $0x10,%esp
c00090df:	eb 23                	jmp    c0009104 <test_shell+0xb6>
c00090e1:	83 ec 0c             	sub    $0xc,%esp
c00090e4:	68 24 b8 00 c0       	push   $0xc000b824
c00090e9:	e8 7c 02 00 00       	call   c000936a <Printf>
c00090ee:	83 c4 10             	add    $0x10,%esp
c00090f1:	83 ec 0c             	sub    $0xc,%esp
c00090f4:	ff 75 f4             	pushl  -0xc(%ebp)
c00090f7:	e8 90 d1 ff ff       	call   c000628c <close>
c00090fc:	83 c4 10             	add    $0x10,%esp
c00090ff:	e8 e6 fb ff ff       	call   c0008cea <simple_shell>
c0009104:	83 ec 0c             	sub    $0xc,%esp
c0009107:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000910a:	50                   	push   %eax
c000910b:	e8 c8 d1 ff ff       	call   c00062d8 <wait>
c0009110:	83 c4 10             	add    $0x10,%esp
c0009113:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009116:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009119:	83 ec 08             	sub    $0x8,%esp
c000911c:	50                   	push   %eax
c000911d:	68 32 b8 00 c0       	push   $0xc000b832
c0009122:	e8 43 02 00 00       	call   c000936a <Printf>
c0009127:	83 c4 10             	add    $0x10,%esp
c000912a:	eb d8                	jmp    c0009104 <test_shell+0xb6>

c000912c <test_exec>:
c000912c:	55                   	push   %ebp
c000912d:	89 e5                	mov    %esp,%ebp
c000912f:	83 ec 38             	sub    $0x38,%esp
c0009132:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0009139:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0009140:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0009146:	83 ec 08             	sub    $0x8,%esp
c0009149:	6a 02                	push   $0x2
c000914b:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c000914e:	50                   	push   %eax
c000914f:	e8 cb cf ff ff       	call   c000611f <open>
c0009154:	83 c4 10             	add    $0x10,%esp
c0009157:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000915a:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0009161:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0009168:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c000916f:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0009176:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c000917d:	83 ec 0c             	sub    $0xc,%esp
c0009180:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0009183:	50                   	push   %eax
c0009184:	e8 b2 ea ff ff       	call   c0007c3b <untar>
c0009189:	83 c4 10             	add    $0x10,%esp
c000918c:	e8 ae d1 ff ff       	call   c000633f <fork>
c0009191:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009194:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009198:	7e 25                	jle    c00091bf <test_exec+0x93>
c000919a:	83 ec 0c             	sub    $0xc,%esp
c000919d:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00091a0:	50                   	push   %eax
c00091a1:	e8 32 d1 ff ff       	call   c00062d8 <wait>
c00091a6:	83 c4 10             	add    $0x10,%esp
c00091a9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00091ac:	83 ec 08             	sub    $0x8,%esp
c00091af:	50                   	push   %eax
c00091b0:	68 12 b8 00 c0       	push   $0xc000b812
c00091b5:	e8 b0 01 00 00       	call   c000936a <Printf>
c00091ba:	83 c4 10             	add    $0x10,%esp
c00091bd:	eb 33                	jmp    c00091f2 <test_exec+0xc6>
c00091bf:	83 ec 0c             	sub    $0xc,%esp
c00091c2:	68 24 b8 00 c0       	push   $0xc000b824
c00091c7:	e8 9e 01 00 00       	call   c000936a <Printf>
c00091cc:	83 c4 10             	add    $0x10,%esp
c00091cf:	83 ec 0c             	sub    $0xc,%esp
c00091d2:	6a 00                	push   $0x0
c00091d4:	68 4d b8 00 c0       	push   $0xc000b84d
c00091d9:	68 53 b8 00 c0       	push   $0xc000b853
c00091de:	68 db b7 00 c0       	push   $0xc000b7db
c00091e3:	68 59 b8 00 c0       	push   $0xc000b859
c00091e8:	e8 e6 d3 ff ff       	call   c00065d3 <execl>
c00091ed:	83 c4 20             	add    $0x20,%esp
c00091f0:	eb fe                	jmp    c00091f0 <test_exec+0xc4>
c00091f2:	c9                   	leave  
c00091f3:	c3                   	ret    

c00091f4 <INIT>:
c00091f4:	55                   	push   %ebp
c00091f5:	89 e5                	mov    %esp,%ebp
c00091f7:	83 ec 08             	sub    $0x8,%esp
c00091fa:	e8 4f fe ff ff       	call   c000904e <test_shell>
c00091ff:	eb fe                	jmp    c00091ff <INIT+0xb>

c0009201 <TestA>:
c0009201:	55                   	push   %ebp
c0009202:	89 e5                	mov    %esp,%ebp
c0009204:	83 ec 08             	sub    $0x8,%esp
c0009207:	83 ec 0c             	sub    $0xc,%esp
c000920a:	6a 05                	push   $0x5
c000920c:	e8 da ec ff ff       	call   c0007eeb <disp_int>
c0009211:	83 c4 10             	add    $0x10,%esp
c0009214:	83 ec 0c             	sub    $0xc,%esp
c0009217:	68 d4 b3 00 c0       	push   $0xc000b3d4
c000921c:	e8 6b 83 ff ff       	call   c000158c <disp_str>
c0009221:	83 c4 10             	add    $0x10,%esp
c0009224:	83 ec 0c             	sub    $0xc,%esp
c0009227:	68 5f b8 00 c0       	push   $0xc000b85f
c000922c:	e8 5b 83 ff ff       	call   c000158c <disp_str>
c0009231:	83 c4 10             	add    $0x10,%esp
c0009234:	eb fe                	jmp    c0009234 <TestA+0x33>

c0009236 <delay>:
c0009236:	55                   	push   %ebp
c0009237:	89 e5                	mov    %esp,%ebp
c0009239:	83 ec 10             	sub    $0x10,%esp
c000923c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0009243:	eb 2a                	jmp    c000926f <delay+0x39>
c0009245:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c000924c:	eb 17                	jmp    c0009265 <delay+0x2f>
c000924e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009255:	eb 04                	jmp    c000925b <delay+0x25>
c0009257:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000925b:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000925f:	7e f6                	jle    c0009257 <delay+0x21>
c0009261:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009265:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0009269:	7e e3                	jle    c000924e <delay+0x18>
c000926b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000926f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009272:	3b 45 08             	cmp    0x8(%ebp),%eax
c0009275:	7c ce                	jl     c0009245 <delay+0xf>
c0009277:	90                   	nop
c0009278:	c9                   	leave  
c0009279:	c3                   	ret    

c000927a <TestB>:
c000927a:	55                   	push   %ebp
c000927b:	89 e5                	mov    %esp,%ebp
c000927d:	83 ec 08             	sub    $0x8,%esp
c0009280:	83 ec 0c             	sub    $0xc,%esp
c0009283:	68 66 b8 00 c0       	push   $0xc000b866
c0009288:	e8 ff 82 ff ff       	call   c000158c <disp_str>
c000928d:	83 c4 10             	add    $0x10,%esp
c0009290:	eb fe                	jmp    c0009290 <TestB+0x16>

c0009292 <TestC>:
c0009292:	55                   	push   %ebp
c0009293:	89 e5                	mov    %esp,%ebp
c0009295:	83 ec 18             	sub    $0x18,%esp
c0009298:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000929f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c00092a3:	77 1a                	ja     c00092bf <TestC+0x2d>
c00092a5:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c00092ac:	83 ec 08             	sub    $0x8,%esp
c00092af:	ff 75 f0             	pushl  -0x10(%ebp)
c00092b2:	68 69 b8 00 c0       	push   $0xc000b869
c00092b7:	e8 ae 00 00 00       	call   c000936a <Printf>
c00092bc:	83 c4 10             	add    $0x10,%esp
c00092bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00092c3:	eb da                	jmp    c000929f <TestC+0xd>

c00092c5 <sys_get_ticks>:
c00092c5:	55                   	push   %ebp
c00092c6:	89 e5                	mov    %esp,%ebp
c00092c8:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00092cd:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c00092d3:	5d                   	pop    %ebp
c00092d4:	c3                   	ret    

c00092d5 <sys_write>:
c00092d5:	55                   	push   %ebp
c00092d6:	89 e5                	mov    %esp,%ebp
c00092d8:	83 ec 18             	sub    $0x18,%esp
c00092db:	8b 45 10             	mov    0x10(%ebp),%eax
c00092de:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00092e4:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00092ea:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00092ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00092f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00092fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00092fe:	eb 20                	jmp    c0009320 <sys_write+0x4b>
c0009300:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009303:	0f b6 00             	movzbl (%eax),%eax
c0009306:	0f b6 c0             	movzbl %al,%eax
c0009309:	83 ec 08             	sub    $0x8,%esp
c000930c:	50                   	push   %eax
c000930d:	ff 75 ec             	pushl  -0x14(%ebp)
c0009310:	e8 8b c1 ff ff       	call   c00054a0 <out_char>
c0009315:	83 c4 10             	add    $0x10,%esp
c0009318:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000931c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0009320:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0009324:	7f da                	jg     c0009300 <sys_write+0x2b>
c0009326:	90                   	nop
c0009327:	c9                   	leave  
c0009328:	c3                   	ret    

c0009329 <milli_delay>:
c0009329:	55                   	push   %ebp
c000932a:	89 e5                	mov    %esp,%ebp
c000932c:	83 ec 18             	sub    $0x18,%esp
c000932f:	e8 8b 0d 00 00       	call   c000a0bf <get_ticks_ipc>
c0009334:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009337:	90                   	nop
c0009338:	e8 82 0d 00 00       	call   c000a0bf <get_ticks_ipc>
c000933d:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0009340:	89 c1                	mov    %eax,%ecx
c0009342:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0009347:	89 c8                	mov    %ecx,%eax
c0009349:	f7 ea                	imul   %edx
c000934b:	c1 fa 05             	sar    $0x5,%edx
c000934e:	89 c8                	mov    %ecx,%eax
c0009350:	c1 f8 1f             	sar    $0x1f,%eax
c0009353:	29 c2                	sub    %eax,%edx
c0009355:	89 d0                	mov    %edx,%eax
c0009357:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c000935d:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009360:	77 d6                	ja     c0009338 <milli_delay+0xf>
c0009362:	90                   	nop
c0009363:	c9                   	leave  
c0009364:	c3                   	ret    

c0009365 <TaskSys>:
c0009365:	55                   	push   %ebp
c0009366:	89 e5                	mov    %esp,%ebp
c0009368:	eb fe                	jmp    c0009368 <TaskSys+0x3>

c000936a <Printf>:
c000936a:	55                   	push   %ebp
c000936b:	89 e5                	mov    %esp,%ebp
c000936d:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009373:	83 ec 04             	sub    $0x4,%esp
c0009376:	68 00 01 00 00       	push   $0x100
c000937b:	6a 00                	push   $0x0
c000937d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009383:	50                   	push   %eax
c0009384:	e8 a2 27 00 00       	call   c000bb2b <Memset>
c0009389:	83 c4 10             	add    $0x10,%esp
c000938c:	8d 45 0c             	lea    0xc(%ebp),%eax
c000938f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009392:	8b 45 08             	mov    0x8(%ebp),%eax
c0009395:	83 ec 04             	sub    $0x4,%esp
c0009398:	ff 75 f4             	pushl  -0xc(%ebp)
c000939b:	50                   	push   %eax
c000939c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00093a2:	50                   	push   %eax
c00093a3:	e8 20 00 00 00       	call   c00093c8 <vsprintf>
c00093a8:	83 c4 10             	add    $0x10,%esp
c00093ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093ae:	83 ec 04             	sub    $0x4,%esp
c00093b1:	ff 75 f0             	pushl  -0x10(%ebp)
c00093b4:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00093ba:	50                   	push   %eax
c00093bb:	6a 00                	push   $0x0
c00093bd:	e8 56 ce ff ff       	call   c0006218 <write>
c00093c2:	83 c4 10             	add    $0x10,%esp
c00093c5:	90                   	nop
c00093c6:	c9                   	leave  
c00093c7:	c3                   	ret    

c00093c8 <vsprintf>:
c00093c8:	55                   	push   %ebp
c00093c9:	89 e5                	mov    %esp,%ebp
c00093cb:	81 ec 68 02 00 00    	sub    $0x268,%esp
c00093d1:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00093d7:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c00093dd:	83 ec 04             	sub    $0x4,%esp
c00093e0:	6a 40                	push   $0x40
c00093e2:	6a 00                	push   $0x0
c00093e4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00093ea:	50                   	push   %eax
c00093eb:	e8 3b 27 00 00       	call   c000bb2b <Memset>
c00093f0:	83 c4 10             	add    $0x10,%esp
c00093f3:	8b 45 10             	mov    0x10(%ebp),%eax
c00093f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009400:	8b 45 08             	mov    0x8(%ebp),%eax
c0009403:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009406:	e9 53 01 00 00       	jmp    c000955e <vsprintf+0x196>
c000940b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000940e:	0f b6 00             	movzbl (%eax),%eax
c0009411:	3c 25                	cmp    $0x25,%al
c0009413:	74 16                	je     c000942b <vsprintf+0x63>
c0009415:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009418:	8d 50 01             	lea    0x1(%eax),%edx
c000941b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000941e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009421:	0f b6 12             	movzbl (%edx),%edx
c0009424:	88 10                	mov    %dl,(%eax)
c0009426:	e9 2f 01 00 00       	jmp    c000955a <vsprintf+0x192>
c000942b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c000942f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009432:	0f b6 00             	movzbl (%eax),%eax
c0009435:	0f be c0             	movsbl %al,%eax
c0009438:	83 f8 64             	cmp    $0x64,%eax
c000943b:	74 26                	je     c0009463 <vsprintf+0x9b>
c000943d:	83 f8 64             	cmp    $0x64,%eax
c0009440:	7f 0e                	jg     c0009450 <vsprintf+0x88>
c0009442:	83 f8 63             	cmp    $0x63,%eax
c0009445:	0f 84 f2 00 00 00    	je     c000953d <vsprintf+0x175>
c000944b:	e9 0a 01 00 00       	jmp    c000955a <vsprintf+0x192>
c0009450:	83 f8 73             	cmp    $0x73,%eax
c0009453:	0f 84 b0 00 00 00    	je     c0009509 <vsprintf+0x141>
c0009459:	83 f8 78             	cmp    $0x78,%eax
c000945c:	74 5d                	je     c00094bb <vsprintf+0xf3>
c000945e:	e9 f7 00 00 00       	jmp    c000955a <vsprintf+0x192>
c0009463:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009466:	8b 00                	mov    (%eax),%eax
c0009468:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000946b:	83 ec 04             	sub    $0x4,%esp
c000946e:	6a 0a                	push   $0xa
c0009470:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009476:	50                   	push   %eax
c0009477:	ff 75 e8             	pushl  -0x18(%ebp)
c000947a:	e8 8b 0c 00 00       	call   c000a10a <itoa>
c000947f:	83 c4 10             	add    $0x10,%esp
c0009482:	83 ec 08             	sub    $0x8,%esp
c0009485:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000948b:	50                   	push   %eax
c000948c:	ff 75 f4             	pushl  -0xc(%ebp)
c000948f:	e8 b6 26 00 00       	call   c000bb4a <Strcpy>
c0009494:	83 c4 10             	add    $0x10,%esp
c0009497:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000949b:	83 ec 0c             	sub    $0xc,%esp
c000949e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00094a4:	50                   	push   %eax
c00094a5:	e8 ba 26 00 00       	call   c000bb64 <Strlen>
c00094aa:	83 c4 10             	add    $0x10,%esp
c00094ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094b3:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094b6:	e9 9f 00 00 00       	jmp    c000955a <vsprintf+0x192>
c00094bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094be:	8b 00                	mov    (%eax),%eax
c00094c0:	83 ec 08             	sub    $0x8,%esp
c00094c3:	50                   	push   %eax
c00094c4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094ca:	50                   	push   %eax
c00094cb:	e8 75 e9 ff ff       	call   c0007e45 <atoi>
c00094d0:	83 c4 10             	add    $0x10,%esp
c00094d3:	83 ec 08             	sub    $0x8,%esp
c00094d6:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094dc:	50                   	push   %eax
c00094dd:	ff 75 f4             	pushl  -0xc(%ebp)
c00094e0:	e8 65 26 00 00       	call   c000bb4a <Strcpy>
c00094e5:	83 c4 10             	add    $0x10,%esp
c00094e8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094ec:	83 ec 0c             	sub    $0xc,%esp
c00094ef:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094f5:	50                   	push   %eax
c00094f6:	e8 69 26 00 00       	call   c000bb64 <Strlen>
c00094fb:	83 c4 10             	add    $0x10,%esp
c00094fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009501:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009504:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009507:	eb 51                	jmp    c000955a <vsprintf+0x192>
c0009509:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000950c:	8b 00                	mov    (%eax),%eax
c000950e:	83 ec 08             	sub    $0x8,%esp
c0009511:	50                   	push   %eax
c0009512:	ff 75 f4             	pushl  -0xc(%ebp)
c0009515:	e8 30 26 00 00       	call   c000bb4a <Strcpy>
c000951a:	83 c4 10             	add    $0x10,%esp
c000951d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009520:	8b 00                	mov    (%eax),%eax
c0009522:	83 ec 0c             	sub    $0xc,%esp
c0009525:	50                   	push   %eax
c0009526:	e8 39 26 00 00       	call   c000bb64 <Strlen>
c000952b:	83 c4 10             	add    $0x10,%esp
c000952e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009531:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009535:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009538:	01 45 f4             	add    %eax,-0xc(%ebp)
c000953b:	eb 1d                	jmp    c000955a <vsprintf+0x192>
c000953d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009540:	0f b6 10             	movzbl (%eax),%edx
c0009543:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009546:	88 10                	mov    %dl,(%eax)
c0009548:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000954c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009553:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009556:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009559:	90                   	nop
c000955a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c000955e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009561:	0f b6 00             	movzbl (%eax),%eax
c0009564:	84 c0                	test   %al,%al
c0009566:	0f 85 9f fe ff ff    	jne    c000940b <vsprintf+0x43>
c000956c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000956f:	2b 45 08             	sub    0x8(%ebp),%eax
c0009572:	c9                   	leave  
c0009573:	c3                   	ret    

c0009574 <printx>:
c0009574:	55                   	push   %ebp
c0009575:	89 e5                	mov    %esp,%ebp
c0009577:	81 ec 18 01 00 00    	sub    $0x118,%esp
c000957d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009580:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009583:	8b 45 08             	mov    0x8(%ebp),%eax
c0009586:	83 ec 04             	sub    $0x4,%esp
c0009589:	ff 75 f4             	pushl  -0xc(%ebp)
c000958c:	50                   	push   %eax
c000958d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009593:	50                   	push   %eax
c0009594:	e8 2f fe ff ff       	call   c00093c8 <vsprintf>
c0009599:	83 c4 10             	add    $0x10,%esp
c000959c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000959f:	83 ec 08             	sub    $0x8,%esp
c00095a2:	ff 75 f0             	pushl  -0x10(%ebp)
c00095a5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00095ab:	50                   	push   %eax
c00095ac:	e8 97 93 ff ff       	call   c0002948 <write_debug>
c00095b1:	83 c4 10             	add    $0x10,%esp
c00095b4:	90                   	nop
c00095b5:	c9                   	leave  
c00095b6:	c3                   	ret    

c00095b7 <sys_printx>:
c00095b7:	55                   	push   %ebp
c00095b8:	89 e5                	mov    %esp,%ebp
c00095ba:	83 ec 28             	sub    $0x28,%esp
c00095bd:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c00095c2:	85 c0                	test   %eax,%eax
c00095c4:	75 15                	jne    c00095db <sys_printx+0x24>
c00095c6:	8b 45 10             	mov    0x10(%ebp),%eax
c00095c9:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00095cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00095d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00095d9:	eb 10                	jmp    c00095eb <sys_printx+0x34>
c00095db:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c00095e0:	85 c0                	test   %eax,%eax
c00095e2:	74 07                	je     c00095eb <sys_printx+0x34>
c00095e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00095eb:	8b 55 08             	mov    0x8(%ebp),%edx
c00095ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095f1:	01 d0                	add    %edx,%eax
c00095f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00095f6:	8b 45 10             	mov    0x10(%ebp),%eax
c00095f9:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00095ff:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009605:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c000960a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000960d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009610:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009613:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009616:	0f b6 00             	movzbl (%eax),%eax
c0009619:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000961c:	eb 3a                	jmp    c0009658 <sys_printx+0xa1>
c000961e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009621:	0f b6 00             	movzbl (%eax),%eax
c0009624:	3c 3b                	cmp    $0x3b,%al
c0009626:	74 0a                	je     c0009632 <sys_printx+0x7b>
c0009628:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000962b:	0f b6 00             	movzbl (%eax),%eax
c000962e:	3c 3a                	cmp    $0x3a,%al
c0009630:	75 06                	jne    c0009638 <sys_printx+0x81>
c0009632:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009636:	eb 20                	jmp    c0009658 <sys_printx+0xa1>
c0009638:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000963b:	0f b6 00             	movzbl (%eax),%eax
c000963e:	0f b6 c0             	movzbl %al,%eax
c0009641:	83 ec 08             	sub    $0x8,%esp
c0009644:	50                   	push   %eax
c0009645:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009648:	e8 53 be ff ff       	call   c00054a0 <out_char>
c000964d:	83 c4 10             	add    $0x10,%esp
c0009650:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009654:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009658:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000965c:	7f c0                	jg     c000961e <sys_printx+0x67>
c000965e:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009662:	75 10                	jne    c0009674 <sys_printx+0xbd>
c0009664:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009669:	85 c0                	test   %eax,%eax
c000966b:	74 13                	je     c0009680 <sys_printx+0xc9>
c000966d:	e8 42 81 ff ff       	call   c00017b4 <disable_int>
c0009672:	eb 0c                	jmp    c0009680 <sys_printx+0xc9>
c0009674:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009678:	75 06                	jne    c0009680 <sys_printx+0xc9>
c000967a:	e8 35 81 ff ff       	call   c00017b4 <disable_int>
c000967f:	90                   	nop
c0009680:	90                   	nop
c0009681:	c9                   	leave  
c0009682:	c3                   	ret    

c0009683 <spin>:
c0009683:	55                   	push   %ebp
c0009684:	89 e5                	mov    %esp,%ebp
c0009686:	83 ec 08             	sub    $0x8,%esp
c0009689:	83 ec 0c             	sub    $0xc,%esp
c000968c:	ff 75 08             	pushl  0x8(%ebp)
c000968f:	e8 f8 7e ff ff       	call   c000158c <disp_str>
c0009694:	83 c4 10             	add    $0x10,%esp
c0009697:	83 ec 0c             	sub    $0xc,%esp
c000969a:	68 d4 b3 00 c0       	push   $0xc000b3d4
c000969f:	e8 e8 7e ff ff       	call   c000158c <disp_str>
c00096a4:	83 c4 10             	add    $0x10,%esp
c00096a7:	eb fe                	jmp    c00096a7 <spin+0x24>

c00096a9 <panic>:
c00096a9:	55                   	push   %ebp
c00096aa:	89 e5                	mov    %esp,%ebp
c00096ac:	83 ec 08             	sub    $0x8,%esp
c00096af:	83 ec 04             	sub    $0x4,%esp
c00096b2:	ff 75 08             	pushl  0x8(%ebp)
c00096b5:	6a 3a                	push   $0x3a
c00096b7:	68 76 b8 00 c0       	push   $0xc000b876
c00096bc:	e8 b3 fe ff ff       	call   c0009574 <printx>
c00096c1:	83 c4 10             	add    $0x10,%esp
c00096c4:	90                   	nop
c00096c5:	c9                   	leave  
c00096c6:	c3                   	ret    

c00096c7 <assertion_failure>:
c00096c7:	55                   	push   %ebp
c00096c8:	89 e5                	mov    %esp,%ebp
c00096ca:	83 ec 08             	sub    $0x8,%esp
c00096cd:	83 ec 08             	sub    $0x8,%esp
c00096d0:	ff 75 14             	pushl  0x14(%ebp)
c00096d3:	ff 75 10             	pushl  0x10(%ebp)
c00096d6:	ff 75 0c             	pushl  0xc(%ebp)
c00096d9:	ff 75 08             	pushl  0x8(%ebp)
c00096dc:	6a 3b                	push   $0x3b
c00096de:	68 7c b8 00 c0       	push   $0xc000b87c
c00096e3:	e8 8c fe ff ff       	call   c0009574 <printx>
c00096e8:	83 c4 20             	add    $0x20,%esp
c00096eb:	83 ec 0c             	sub    $0xc,%esp
c00096ee:	68 af b8 00 c0       	push   $0xc000b8af
c00096f3:	e8 8b ff ff ff       	call   c0009683 <spin>
c00096f8:	83 c4 10             	add    $0x10,%esp
c00096fb:	90                   	nop
c00096fc:	c9                   	leave  
c00096fd:	c3                   	ret    

c00096fe <dead_lock>:
c00096fe:	55                   	push   %ebp
c00096ff:	89 e5                	mov    %esp,%ebp
c0009701:	b8 00 00 00 00       	mov    $0x0,%eax
c0009706:	5d                   	pop    %ebp
c0009707:	c3                   	ret    

c0009708 <sys_send_msg>:
c0009708:	55                   	push   %ebp
c0009709:	89 e5                	mov    %esp,%ebp
c000970b:	83 ec 38             	sub    $0x38,%esp
c000970e:	83 ec 0c             	sub    $0xc,%esp
c0009711:	ff 75 0c             	pushl  0xc(%ebp)
c0009714:	e8 14 b7 ff ff       	call   c0004e2d <pid2proc>
c0009719:	83 c4 10             	add    $0x10,%esp
c000971c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000971f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009723:	75 22                	jne    c0009747 <sys_send_msg+0x3f>
c0009725:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009729:	75 1c                	jne    c0009747 <sys_send_msg+0x3f>
c000972b:	68 98 05 00 00       	push   $0x598
c0009730:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009735:	68 bb b8 00 c0       	push   $0xc000b8bb
c000973a:	68 cb b8 00 c0       	push   $0xc000b8cb
c000973f:	e8 83 ff ff ff       	call   c00096c7 <assertion_failure>
c0009744:	83 c4 10             	add    $0x10,%esp
c0009747:	83 ec 0c             	sub    $0xc,%esp
c000974a:	ff 75 10             	pushl  0x10(%ebp)
c000974d:	e8 4d b7 ff ff       	call   c0004e9f <proc2pid>
c0009752:	83 c4 10             	add    $0x10,%esp
c0009755:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009758:	8b 45 10             	mov    0x10(%ebp),%eax
c000975b:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009761:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009764:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000976b:	8b 45 08             	mov    0x8(%ebp),%eax
c000976e:	83 ec 08             	sub    $0x8,%esp
c0009771:	6a 6c                	push   $0x6c
c0009773:	50                   	push   %eax
c0009774:	e8 de d9 ff ff       	call   c0007157 <alloc_virtual_memory>
c0009779:	83 c4 10             	add    $0x10,%esp
c000977c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000977f:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009786:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009789:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000978c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000978f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009792:	89 10                	mov    %edx,(%eax)
c0009794:	83 ec 08             	sub    $0x8,%esp
c0009797:	ff 75 0c             	pushl  0xc(%ebp)
c000979a:	ff 75 e8             	pushl  -0x18(%ebp)
c000979d:	e8 5c ff ff ff       	call   c00096fe <dead_lock>
c00097a2:	83 c4 10             	add    $0x10,%esp
c00097a5:	83 f8 01             	cmp    $0x1,%eax
c00097a8:	75 10                	jne    c00097ba <sys_send_msg+0xb2>
c00097aa:	83 ec 0c             	sub    $0xc,%esp
c00097ad:	68 db b8 00 c0       	push   $0xc000b8db
c00097b2:	e8 f2 fe ff ff       	call   c00096a9 <panic>
c00097b7:	83 c4 10             	add    $0x10,%esp
c00097ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097bd:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00097c4:	3c 02                	cmp    $0x2,%al
c00097c6:	0f 85 99 01 00 00    	jne    c0009965 <sys_send_msg+0x25d>
c00097cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097cf:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00097d5:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00097d8:	74 12                	je     c00097ec <sys_send_msg+0xe4>
c00097da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097dd:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00097e3:	83 f8 12             	cmp    $0x12,%eax
c00097e6:	0f 85 79 01 00 00    	jne    c0009965 <sys_send_msg+0x25d>
c00097ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097ef:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00097f5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00097f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097fb:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009801:	83 ec 08             	sub    $0x8,%esp
c0009804:	6a 6c                	push   $0x6c
c0009806:	50                   	push   %eax
c0009807:	e8 4b d9 ff ff       	call   c0007157 <alloc_virtual_memory>
c000980c:	83 c4 10             	add    $0x10,%esp
c000980f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009812:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009815:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009818:	83 ec 04             	sub    $0x4,%esp
c000981b:	ff 75 d8             	pushl  -0x28(%ebp)
c000981e:	52                   	push   %edx
c000981f:	50                   	push   %eax
c0009820:	e8 e3 e3 ff ff       	call   c0007c08 <Memcpy>
c0009825:	83 c4 10             	add    $0x10,%esp
c0009828:	8b 45 10             	mov    0x10(%ebp),%eax
c000982b:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009832:	00 00 00 
c0009835:	8b 45 10             	mov    0x10(%ebp),%eax
c0009838:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000983f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009842:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009849:	00 00 00 
c000984c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000984f:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009856:	00 00 00 
c0009859:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000985c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009863:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009866:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000986d:	00 00 00 
c0009870:	8b 45 10             	mov    0x10(%ebp),%eax
c0009873:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000987a:	00 00 00 
c000987d:	83 ec 0c             	sub    $0xc,%esp
c0009880:	ff 75 ec             	pushl  -0x14(%ebp)
c0009883:	e8 e7 07 00 00       	call   c000a06f <unblock>
c0009888:	83 c4 10             	add    $0x10,%esp
c000988b:	8b 45 10             	mov    0x10(%ebp),%eax
c000988e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009895:	84 c0                	test   %al,%al
c0009897:	74 1c                	je     c00098b5 <sys_send_msg+0x1ad>
c0009899:	68 c9 05 00 00       	push   $0x5c9
c000989e:	68 bb b8 00 c0       	push   $0xc000b8bb
c00098a3:	68 bb b8 00 c0       	push   $0xc000b8bb
c00098a8:	68 e6 b8 00 c0       	push   $0xc000b8e6
c00098ad:	e8 15 fe ff ff       	call   c00096c7 <assertion_failure>
c00098b2:	83 c4 10             	add    $0x10,%esp
c00098b5:	8b 45 10             	mov    0x10(%ebp),%eax
c00098b8:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00098be:	83 f8 21             	cmp    $0x21,%eax
c00098c1:	74 1c                	je     c00098df <sys_send_msg+0x1d7>
c00098c3:	68 ca 05 00 00       	push   $0x5ca
c00098c8:	68 bb b8 00 c0       	push   $0xc000b8bb
c00098cd:	68 bb b8 00 c0       	push   $0xc000b8bb
c00098d2:	68 fa b8 00 c0       	push   $0xc000b8fa
c00098d7:	e8 eb fd ff ff       	call   c00096c7 <assertion_failure>
c00098dc:	83 c4 10             	add    $0x10,%esp
c00098df:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098e2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00098e8:	85 c0                	test   %eax,%eax
c00098ea:	74 1c                	je     c0009908 <sys_send_msg+0x200>
c00098ec:	68 cc 05 00 00       	push   $0x5cc
c00098f1:	68 bb b8 00 c0       	push   $0xc000b8bb
c00098f6:	68 bb b8 00 c0       	push   $0xc000b8bb
c00098fb:	68 17 b9 00 c0       	push   $0xc000b917
c0009900:	e8 c2 fd ff ff       	call   c00096c7 <assertion_failure>
c0009905:	83 c4 10             	add    $0x10,%esp
c0009908:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000990b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009912:	84 c0                	test   %al,%al
c0009914:	74 1c                	je     c0009932 <sys_send_msg+0x22a>
c0009916:	68 cd 05 00 00       	push   $0x5cd
c000991b:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009920:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009925:	68 2c b9 00 c0       	push   $0xc000b92c
c000992a:	e8 98 fd ff ff       	call   c00096c7 <assertion_failure>
c000992f:	83 c4 10             	add    $0x10,%esp
c0009932:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009935:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000993b:	83 f8 21             	cmp    $0x21,%eax
c000993e:	0f 84 45 01 00 00    	je     c0009a89 <sys_send_msg+0x381>
c0009944:	68 ce 05 00 00       	push   $0x5ce
c0009949:	68 bb b8 00 c0       	push   $0xc000b8bb
c000994e:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009953:	68 44 b9 00 c0       	push   $0xc000b944
c0009958:	e8 6a fd ff ff       	call   c00096c7 <assertion_failure>
c000995d:	83 c4 10             	add    $0x10,%esp
c0009960:	e9 24 01 00 00       	jmp    c0009a89 <sys_send_msg+0x381>
c0009965:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000996c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000996f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009972:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009975:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000997b:	85 c0                	test   %eax,%eax
c000997d:	75 1b                	jne    c000999a <sys_send_msg+0x292>
c000997f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009982:	8b 55 10             	mov    0x10(%ebp),%edx
c0009985:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000998b:	8b 45 10             	mov    0x10(%ebp),%eax
c000998e:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009995:	00 00 00 
c0009998:	eb 3f                	jmp    c00099d9 <sys_send_msg+0x2d1>
c000999a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000999d:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00099a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099a6:	eb 12                	jmp    c00099ba <sys_send_msg+0x2b2>
c00099a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099b1:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00099b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099ba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00099be:	75 e8                	jne    c00099a8 <sys_send_msg+0x2a0>
c00099c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099c3:	8b 55 10             	mov    0x10(%ebp),%edx
c00099c6:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c00099cc:	8b 45 10             	mov    0x10(%ebp),%eax
c00099cf:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00099d6:	00 00 00 
c00099d9:	8b 45 10             	mov    0x10(%ebp),%eax
c00099dc:	8b 55 08             	mov    0x8(%ebp),%edx
c00099df:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c00099e5:	8b 45 10             	mov    0x10(%ebp),%eax
c00099e8:	8b 55 0c             	mov    0xc(%ebp),%edx
c00099eb:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c00099f1:	8b 45 10             	mov    0x10(%ebp),%eax
c00099f4:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c00099fb:	8b 45 10             	mov    0x10(%ebp),%eax
c00099fe:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009a05:	3c 01                	cmp    $0x1,%al
c0009a07:	74 1c                	je     c0009a25 <sys_send_msg+0x31d>
c0009a09:	68 ef 05 00 00       	push   $0x5ef
c0009a0e:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009a13:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009a18:	68 68 b9 00 c0       	push   $0xc000b968
c0009a1d:	e8 a5 fc ff ff       	call   c00096c7 <assertion_failure>
c0009a22:	83 c4 10             	add    $0x10,%esp
c0009a25:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a28:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009a2e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009a31:	74 1c                	je     c0009a4f <sys_send_msg+0x347>
c0009a33:	68 f0 05 00 00       	push   $0x5f0
c0009a38:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009a3d:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009a42:	68 84 b9 00 c0       	push   $0xc000b984
c0009a47:	e8 7b fc ff ff       	call   c00096c7 <assertion_failure>
c0009a4c:	83 c4 10             	add    $0x10,%esp
c0009a4f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a52:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009a58:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009a5b:	74 1c                	je     c0009a79 <sys_send_msg+0x371>
c0009a5d:	68 f1 05 00 00       	push   $0x5f1
c0009a62:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009a67:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009a6c:	68 a6 b9 00 c0       	push   $0xc000b9a6
c0009a71:	e8 51 fc ff ff       	call   c00096c7 <assertion_failure>
c0009a76:	83 c4 10             	add    $0x10,%esp
c0009a79:	83 ec 0c             	sub    $0xc,%esp
c0009a7c:	ff 75 10             	pushl  0x10(%ebp)
c0009a7f:	e8 af 05 00 00       	call   c000a033 <block>
c0009a84:	83 c4 10             	add    $0x10,%esp
c0009a87:	eb 01                	jmp    c0009a8a <sys_send_msg+0x382>
c0009a89:	90                   	nop
c0009a8a:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a8f:	c9                   	leave  
c0009a90:	c3                   	ret    

c0009a91 <sys_receive_msg>:
c0009a91:	55                   	push   %ebp
c0009a92:	89 e5                	mov    %esp,%ebp
c0009a94:	83 ec 48             	sub    $0x48,%esp
c0009a97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a9e:	83 ec 0c             	sub    $0xc,%esp
c0009aa1:	ff 75 0c             	pushl  0xc(%ebp)
c0009aa4:	e8 84 b3 ff ff       	call   c0004e2d <pid2proc>
c0009aa9:	83 c4 10             	add    $0x10,%esp
c0009aac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009aaf:	83 ec 0c             	sub    $0xc,%esp
c0009ab2:	ff 75 10             	pushl  0x10(%ebp)
c0009ab5:	e8 e5 b3 ff ff       	call   c0004e9f <proc2pid>
c0009aba:	83 c4 10             	add    $0x10,%esp
c0009abd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009ac0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009ac7:	8b 45 10             	mov    0x10(%ebp),%eax
c0009aca:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0009ad0:	85 c0                	test   %eax,%eax
c0009ad2:	0f 84 b5 00 00 00    	je     c0009b8d <sys_receive_msg+0xfc>
c0009ad8:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009adc:	74 0d                	je     c0009aeb <sys_receive_msg+0x5a>
c0009ade:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0009ae5:	0f 85 a2 00 00 00    	jne    c0009b8d <sys_receive_msg+0xfc>
c0009aeb:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c0009af2:	83 ec 0c             	sub    $0xc,%esp
c0009af5:	ff 75 dc             	pushl  -0x24(%ebp)
c0009af8:	e8 a7 8e ff ff       	call   c00029a4 <sys_malloc>
c0009afd:	83 c4 10             	add    $0x10,%esp
c0009b00:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009b03:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009b06:	83 ec 04             	sub    $0x4,%esp
c0009b09:	50                   	push   %eax
c0009b0a:	6a 00                	push   $0x0
c0009b0c:	ff 75 d8             	pushl  -0x28(%ebp)
c0009b0f:	e8 17 20 00 00       	call   c000bb2b <Memset>
c0009b14:	83 c4 10             	add    $0x10,%esp
c0009b17:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009b1a:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009b20:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009b23:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009b2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b2d:	83 ec 08             	sub    $0x8,%esp
c0009b30:	ff 75 dc             	pushl  -0x24(%ebp)
c0009b33:	50                   	push   %eax
c0009b34:	e8 1e d6 ff ff       	call   c0007157 <alloc_virtual_memory>
c0009b39:	83 c4 10             	add    $0x10,%esp
c0009b3c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009b3f:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009b42:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009b45:	83 ec 04             	sub    $0x4,%esp
c0009b48:	52                   	push   %edx
c0009b49:	ff 75 d8             	pushl  -0x28(%ebp)
c0009b4c:	50                   	push   %eax
c0009b4d:	e8 b6 e0 ff ff       	call   c0007c08 <Memcpy>
c0009b52:	83 c4 10             	add    $0x10,%esp
c0009b55:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b58:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009b5f:	00 00 00 
c0009b62:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b65:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009b6c:	00 00 00 
c0009b6f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b72:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009b79:	00 00 00 
c0009b7c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b7f:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009b86:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009b8d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009b91:	0f 84 96 03 00 00    	je     c0009f2d <sys_receive_msg+0x49c>
c0009b97:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009b9b:	75 26                	jne    c0009bc3 <sys_receive_msg+0x132>
c0009b9d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ba0:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009ba6:	85 c0                	test   %eax,%eax
c0009ba8:	0f 84 8a 00 00 00    	je     c0009c38 <sys_receive_msg+0x1a7>
c0009bae:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bb1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009bb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009bba:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009bc1:	eb 75                	jmp    c0009c38 <sys_receive_msg+0x1a7>
c0009bc3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009bc7:	78 6f                	js     c0009c38 <sys_receive_msg+0x1a7>
c0009bc9:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0009bcd:	7f 69                	jg     c0009c38 <sys_receive_msg+0x1a7>
c0009bcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009bd2:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009bd9:	3c 01                	cmp    $0x1,%al
c0009bdb:	75 5b                	jne    c0009c38 <sys_receive_msg+0x1a7>
c0009bdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009be0:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009be6:	83 f8 12             	cmp    $0x12,%eax
c0009be9:	74 0e                	je     c0009bf9 <sys_receive_msg+0x168>
c0009beb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009bee:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009bf4:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009bf7:	75 3f                	jne    c0009c38 <sys_receive_msg+0x1a7>
c0009bf9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bfc:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c02:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c05:	eb 2b                	jmp    c0009c32 <sys_receive_msg+0x1a1>
c0009c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009c0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c10:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009c16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009c19:	39 c2                	cmp    %eax,%edx
c0009c1b:	75 09                	jne    c0009c26 <sys_receive_msg+0x195>
c0009c1d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009c24:	eb 12                	jmp    c0009c38 <sys_receive_msg+0x1a7>
c0009c26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c29:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009c2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c32:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009c36:	75 cf                	jne    c0009c07 <sys_receive_msg+0x176>
c0009c38:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009c3c:	0f 85 21 02 00 00    	jne    c0009e63 <sys_receive_msg+0x3d2>
c0009c42:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c45:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009c48:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c4b:	83 ec 08             	sub    $0x8,%esp
c0009c4e:	6a 6c                	push   $0x6c
c0009c50:	50                   	push   %eax
c0009c51:	e8 01 d5 ff ff       	call   c0007157 <alloc_virtual_memory>
c0009c56:	83 c4 10             	add    $0x10,%esp
c0009c59:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009c5c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009c5f:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009c65:	83 ec 08             	sub    $0x8,%esp
c0009c68:	6a 6c                	push   $0x6c
c0009c6a:	50                   	push   %eax
c0009c6b:	e8 e7 d4 ff ff       	call   c0007157 <alloc_virtual_memory>
c0009c70:	83 c4 10             	add    $0x10,%esp
c0009c73:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009c76:	83 ec 04             	sub    $0x4,%esp
c0009c79:	6a 6c                	push   $0x6c
c0009c7b:	ff 75 c8             	pushl  -0x38(%ebp)
c0009c7e:	ff 75 cc             	pushl  -0x34(%ebp)
c0009c81:	e8 82 df ff ff       	call   c0007c08 <Memcpy>
c0009c86:	83 c4 10             	add    $0x10,%esp
c0009c89:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009c8c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009c8f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c92:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c98:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009c9b:	75 21                	jne    c0009cbe <sys_receive_msg+0x22d>
c0009c9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ca0:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009ca6:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ca9:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009caf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cb2:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009cb9:	00 00 00 
c0009cbc:	eb 1f                	jmp    c0009cdd <sys_receive_msg+0x24c>
c0009cbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cc1:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009cc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cca:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009cd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cd3:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009cda:	00 00 00 
c0009cdd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009ce0:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009ce7:	00 00 00 
c0009cea:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009ced:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009cf4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009cf7:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009cfe:	00 00 00 
c0009d01:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d04:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d0b:	00 00 00 
c0009d0e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d11:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009d18:	00 00 00 
c0009d1b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d1e:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d25:	00 00 00 
c0009d28:	83 ec 0c             	sub    $0xc,%esp
c0009d2b:	ff 75 d0             	pushl  -0x30(%ebp)
c0009d2e:	e8 3c 03 00 00       	call   c000a06f <unblock>
c0009d33:	83 c4 10             	add    $0x10,%esp
c0009d36:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d39:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009d3f:	85 c0                	test   %eax,%eax
c0009d41:	74 1c                	je     c0009d5f <sys_receive_msg+0x2ce>
c0009d43:	68 6c 06 00 00       	push   $0x66c
c0009d48:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009d4d:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009d52:	68 bb b9 00 c0       	push   $0xc000b9bb
c0009d57:	e8 6b f9 ff ff       	call   c00096c7 <assertion_failure>
c0009d5c:	83 c4 10             	add    $0x10,%esp
c0009d5f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d62:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d69:	84 c0                	test   %al,%al
c0009d6b:	74 1c                	je     c0009d89 <sys_receive_msg+0x2f8>
c0009d6d:	68 6d 06 00 00       	push   $0x66d
c0009d72:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009d77:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009d7c:	68 d3 b9 00 c0       	push   $0xc000b9d3
c0009d81:	e8 41 f9 ff ff       	call   c00096c7 <assertion_failure>
c0009d86:	83 c4 10             	add    $0x10,%esp
c0009d89:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d8c:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d92:	83 f8 21             	cmp    $0x21,%eax
c0009d95:	74 1c                	je     c0009db3 <sys_receive_msg+0x322>
c0009d97:	68 6e 06 00 00       	push   $0x66e
c0009d9c:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009da1:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009da6:	68 ec b9 00 c0       	push   $0xc000b9ec
c0009dab:	e8 17 f9 ff ff       	call   c00096c7 <assertion_failure>
c0009db0:	83 c4 10             	add    $0x10,%esp
c0009db3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009db6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009dbc:	85 c0                	test   %eax,%eax
c0009dbe:	74 1c                	je     c0009ddc <sys_receive_msg+0x34b>
c0009dc0:	68 70 06 00 00       	push   $0x670
c0009dc5:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009dca:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009dcf:	68 17 b9 00 c0       	push   $0xc000b917
c0009dd4:	e8 ee f8 ff ff       	call   c00096c7 <assertion_failure>
c0009dd9:	83 c4 10             	add    $0x10,%esp
c0009ddc:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ddf:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009de6:	84 c0                	test   %al,%al
c0009de8:	74 1c                	je     c0009e06 <sys_receive_msg+0x375>
c0009dea:	68 71 06 00 00       	push   $0x671
c0009def:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009df4:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009df9:	68 2c b9 00 c0       	push   $0xc000b92c
c0009dfe:	e8 c4 f8 ff ff       	call   c00096c7 <assertion_failure>
c0009e03:	83 c4 10             	add    $0x10,%esp
c0009e06:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e09:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e0f:	83 f8 21             	cmp    $0x21,%eax
c0009e12:	74 1c                	je     c0009e30 <sys_receive_msg+0x39f>
c0009e14:	68 72 06 00 00       	push   $0x672
c0009e19:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009e1e:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009e23:	68 44 b9 00 c0       	push   $0xc000b944
c0009e28:	e8 9a f8 ff ff       	call   c00096c7 <assertion_failure>
c0009e2d:	83 c4 10             	add    $0x10,%esp
c0009e30:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e33:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009e39:	83 f8 21             	cmp    $0x21,%eax
c0009e3c:	0f 84 e4 00 00 00    	je     c0009f26 <sys_receive_msg+0x495>
c0009e42:	68 73 06 00 00       	push   $0x673
c0009e47:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009e4c:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009e51:	68 10 ba 00 c0       	push   $0xc000ba10
c0009e56:	e8 6c f8 ff ff       	call   c00096c7 <assertion_failure>
c0009e5b:	83 c4 10             	add    $0x10,%esp
c0009e5e:	e9 c3 00 00 00       	jmp    c0009f26 <sys_receive_msg+0x495>
c0009e63:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e66:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009e6d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e70:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e77:	3c 02                	cmp    $0x2,%al
c0009e79:	74 1c                	je     c0009e97 <sys_receive_msg+0x406>
c0009e7b:	68 78 06 00 00       	push   $0x678
c0009e80:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009e85:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009e8a:	68 2f ba 00 c0       	push   $0xc000ba2f
c0009e8f:	e8 33 f8 ff ff       	call   c00096c7 <assertion_failure>
c0009e94:	83 c4 10             	add    $0x10,%esp
c0009e97:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e9a:	8b 55 08             	mov    0x8(%ebp),%edx
c0009e9d:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009ea3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ea6:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ead:	3c 02                	cmp    $0x2,%al
c0009eaf:	74 1c                	je     c0009ecd <sys_receive_msg+0x43c>
c0009eb1:	68 7a 06 00 00       	push   $0x67a
c0009eb6:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009ebb:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009ec0:	68 2f ba 00 c0       	push   $0xc000ba2f
c0009ec5:	e8 fd f7 ff ff       	call   c00096c7 <assertion_failure>
c0009eca:	83 c4 10             	add    $0x10,%esp
c0009ecd:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009ed1:	75 0f                	jne    c0009ee2 <sys_receive_msg+0x451>
c0009ed3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ed6:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009edd:	00 00 00 
c0009ee0:	eb 0c                	jmp    c0009eee <sys_receive_msg+0x45d>
c0009ee2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ee5:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009ee8:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009eee:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ef1:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ef8:	3c 02                	cmp    $0x2,%al
c0009efa:	74 1c                	je     c0009f18 <sys_receive_msg+0x487>
c0009efc:	68 85 06 00 00       	push   $0x685
c0009f01:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009f06:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009f0b:	68 2f ba 00 c0       	push   $0xc000ba2f
c0009f10:	e8 b2 f7 ff ff       	call   c00096c7 <assertion_failure>
c0009f15:	83 c4 10             	add    $0x10,%esp
c0009f18:	83 ec 0c             	sub    $0xc,%esp
c0009f1b:	ff 75 10             	pushl  0x10(%ebp)
c0009f1e:	e8 10 01 00 00       	call   c000a033 <block>
c0009f23:	83 c4 10             	add    $0x10,%esp
c0009f26:	b8 00 00 00 00       	mov    $0x0,%eax
c0009f2b:	eb 02                	jmp    c0009f2f <sys_receive_msg+0x49e>
c0009f2d:	90                   	nop
c0009f2e:	90                   	nop
c0009f2f:	c9                   	leave  
c0009f30:	c3                   	ret    

c0009f31 <disp_str_colour_debug>:
c0009f31:	55                   	push   %ebp
c0009f32:	89 e5                	mov    %esp,%ebp
c0009f34:	90                   	nop
c0009f35:	5d                   	pop    %ebp
c0009f36:	c3                   	ret    

c0009f37 <send_rec>:
c0009f37:	55                   	push   %ebp
c0009f38:	89 e5                	mov    %esp,%ebp
c0009f3a:	83 ec 18             	sub    $0x18,%esp
c0009f3d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009f40:	83 ec 0c             	sub    $0xc,%esp
c0009f43:	50                   	push   %eax
c0009f44:	e8 d5 d2 ff ff       	call   c000721e <get_physical_address>
c0009f49:	83 c4 10             	add    $0x10,%esp
c0009f4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009f4f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009f53:	74 28                	je     c0009f7d <send_rec+0x46>
c0009f55:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f59:	74 22                	je     c0009f7d <send_rec+0x46>
c0009f5b:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009f5f:	74 1c                	je     c0009f7d <send_rec+0x46>
c0009f61:	68 a5 06 00 00       	push   $0x6a5
c0009f66:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009f6b:	68 bb b8 00 c0       	push   $0xc000b8bb
c0009f70:	68 50 ba 00 c0       	push   $0xc000ba50
c0009f75:	e8 4d f7 ff ff       	call   c00096c7 <assertion_failure>
c0009f7a:	83 c4 10             	add    $0x10,%esp
c0009f7d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f81:	75 12                	jne    c0009f95 <send_rec+0x5e>
c0009f83:	83 ec 04             	sub    $0x4,%esp
c0009f86:	6a 6c                	push   $0x6c
c0009f88:	6a 00                	push   $0x0
c0009f8a:	ff 75 0c             	pushl  0xc(%ebp)
c0009f8d:	e8 99 1b 00 00       	call   c000bb2b <Memset>
c0009f92:	83 c4 10             	add    $0x10,%esp
c0009f95:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f99:	74 23                	je     c0009fbe <send_rec+0x87>
c0009f9b:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009f9f:	74 34                	je     c0009fd5 <send_rec+0x9e>
c0009fa1:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009fa5:	75 72                	jne    c000a019 <send_rec+0xe2>
c0009fa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009faa:	83 ec 08             	sub    $0x8,%esp
c0009fad:	ff 75 10             	pushl  0x10(%ebp)
c0009fb0:	50                   	push   %eax
c0009fb1:	e8 b2 89 ff ff       	call   c0002968 <send_msg>
c0009fb6:	83 c4 10             	add    $0x10,%esp
c0009fb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009fbc:	eb 6e                	jmp    c000a02c <send_rec+0xf5>
c0009fbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fc1:	83 ec 08             	sub    $0x8,%esp
c0009fc4:	ff 75 10             	pushl  0x10(%ebp)
c0009fc7:	50                   	push   %eax
c0009fc8:	e8 c1 89 ff ff       	call   c000298e <receive_msg>
c0009fcd:	83 c4 10             	add    $0x10,%esp
c0009fd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009fd3:	eb 57                	jmp    c000a02c <send_rec+0xf5>
c0009fd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fd8:	83 ec 08             	sub    $0x8,%esp
c0009fdb:	ff 75 10             	pushl  0x10(%ebp)
c0009fde:	50                   	push   %eax
c0009fdf:	e8 84 89 ff ff       	call   c0002968 <send_msg>
c0009fe4:	83 c4 10             	add    $0x10,%esp
c0009fe7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009fea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009fee:	75 3b                	jne    c000a02b <send_rec+0xf4>
c0009ff0:	83 ec 04             	sub    $0x4,%esp
c0009ff3:	6a 6c                	push   $0x6c
c0009ff5:	6a 00                	push   $0x0
c0009ff7:	ff 75 0c             	pushl  0xc(%ebp)
c0009ffa:	e8 2c 1b 00 00       	call   c000bb2b <Memset>
c0009fff:	83 c4 10             	add    $0x10,%esp
c000a002:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a005:	83 ec 08             	sub    $0x8,%esp
c000a008:	ff 75 10             	pushl  0x10(%ebp)
c000a00b:	50                   	push   %eax
c000a00c:	e8 7d 89 ff ff       	call   c000298e <receive_msg>
c000a011:	83 c4 10             	add    $0x10,%esp
c000a014:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a017:	eb 12                	jmp    c000a02b <send_rec+0xf4>
c000a019:	83 ec 0c             	sub    $0xc,%esp
c000a01c:	68 8c ba 00 c0       	push   $0xc000ba8c
c000a021:	e8 83 f6 ff ff       	call   c00096a9 <panic>
c000a026:	83 c4 10             	add    $0x10,%esp
c000a029:	eb 01                	jmp    c000a02c <send_rec+0xf5>
c000a02b:	90                   	nop
c000a02c:	b8 00 00 00 00       	mov    $0x0,%eax
c000a031:	c9                   	leave  
c000a032:	c3                   	ret    

c000a033 <block>:
c000a033:	55                   	push   %ebp
c000a034:	89 e5                	mov    %esp,%ebp
c000a036:	83 ec 08             	sub    $0x8,%esp
c000a039:	8b 45 08             	mov    0x8(%ebp),%eax
c000a03c:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a043:	84 c0                	test   %al,%al
c000a045:	75 1c                	jne    c000a063 <block+0x30>
c000a047:	68 d4 06 00 00       	push   $0x6d4
c000a04c:	68 bb b8 00 c0       	push   $0xc000b8bb
c000a051:	68 bb b8 00 c0       	push   $0xc000b8bb
c000a056:	68 a1 ba 00 c0       	push   $0xc000baa1
c000a05b:	e8 67 f6 ff ff       	call   c00096c7 <assertion_failure>
c000a060:	83 c4 10             	add    $0x10,%esp
c000a063:	e8 62 a9 ff ff       	call   c00049ca <schedule_process>
c000a068:	b8 00 00 00 00       	mov    $0x0,%eax
c000a06d:	c9                   	leave  
c000a06e:	c3                   	ret    

c000a06f <unblock>:
c000a06f:	55                   	push   %ebp
c000a070:	89 e5                	mov    %esp,%ebp
c000a072:	83 ec 08             	sub    $0x8,%esp
c000a075:	8b 45 08             	mov    0x8(%ebp),%eax
c000a078:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a07f:	84 c0                	test   %al,%al
c000a081:	74 1c                	je     c000a09f <unblock+0x30>
c000a083:	68 dd 06 00 00       	push   $0x6dd
c000a088:	68 bb b8 00 c0       	push   $0xc000b8bb
c000a08d:	68 bb b8 00 c0       	push   $0xc000b8bb
c000a092:	68 b9 ba 00 c0       	push   $0xc000bab9
c000a097:	e8 2b f6 ff ff       	call   c00096c7 <assertion_failure>
c000a09c:	83 c4 10             	add    $0x10,%esp
c000a09f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0a2:	05 00 01 00 00       	add    $0x100,%eax
c000a0a7:	83 ec 08             	sub    $0x8,%esp
c000a0aa:	50                   	push   %eax
c000a0ab:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a0b0:	e8 4b 0a 00 00       	call   c000ab00 <appendToDoubleLinkList>
c000a0b5:	83 c4 10             	add    $0x10,%esp
c000a0b8:	b8 00 00 00 00       	mov    $0x0,%eax
c000a0bd:	c9                   	leave  
c000a0be:	c3                   	ret    

c000a0bf <get_ticks_ipc>:
c000a0bf:	55                   	push   %ebp
c000a0c0:	89 e5                	mov    %esp,%ebp
c000a0c2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000a0c8:	83 ec 04             	sub    $0x4,%esp
c000a0cb:	6a 6c                	push   $0x6c
c000a0cd:	6a 00                	push   $0x0
c000a0cf:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a0d2:	50                   	push   %eax
c000a0d3:	e8 53 1a 00 00       	call   c000bb2b <Memset>
c000a0d8:	83 c4 10             	add    $0x10,%esp
c000a0db:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000a0e2:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a0e9:	83 ec 04             	sub    $0x4,%esp
c000a0ec:	6a 01                	push   $0x1
c000a0ee:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a0f1:	50                   	push   %eax
c000a0f2:	6a 03                	push   $0x3
c000a0f4:	e8 3e fe ff ff       	call   c0009f37 <send_rec>
c000a0f9:	83 c4 10             	add    $0x10,%esp
c000a0fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a0ff:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000a102:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a105:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a108:	c9                   	leave  
c000a109:	c3                   	ret    

c000a10a <itoa>:
c000a10a:	55                   	push   %ebp
c000a10b:	89 e5                	mov    %esp,%ebp
c000a10d:	53                   	push   %ebx
c000a10e:	83 ec 14             	sub    $0x14,%esp
c000a111:	8b 45 08             	mov    0x8(%ebp),%eax
c000a114:	99                   	cltd   
c000a115:	f7 7d 10             	idivl  0x10(%ebp)
c000a118:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a11b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a11e:	99                   	cltd   
c000a11f:	f7 7d 10             	idivl  0x10(%ebp)
c000a122:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a125:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a129:	74 14                	je     c000a13f <itoa+0x35>
c000a12b:	83 ec 04             	sub    $0x4,%esp
c000a12e:	ff 75 10             	pushl  0x10(%ebp)
c000a131:	ff 75 0c             	pushl  0xc(%ebp)
c000a134:	ff 75 f0             	pushl  -0x10(%ebp)
c000a137:	e8 ce ff ff ff       	call   c000a10a <itoa>
c000a13c:	83 c4 10             	add    $0x10,%esp
c000a13f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a142:	8d 58 30             	lea    0x30(%eax),%ebx
c000a145:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a148:	8b 00                	mov    (%eax),%eax
c000a14a:	8d 48 01             	lea    0x1(%eax),%ecx
c000a14d:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a150:	89 0a                	mov    %ecx,(%edx)
c000a152:	89 da                	mov    %ebx,%edx
c000a154:	88 10                	mov    %dl,(%eax)
c000a156:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a159:	8b 00                	mov    (%eax),%eax
c000a15b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a15e:	c9                   	leave  
c000a15f:	c3                   	ret    

c000a160 <i2a>:
c000a160:	55                   	push   %ebp
c000a161:	89 e5                	mov    %esp,%ebp
c000a163:	53                   	push   %ebx
c000a164:	83 ec 14             	sub    $0x14,%esp
c000a167:	8b 45 08             	mov    0x8(%ebp),%eax
c000a16a:	99                   	cltd   
c000a16b:	f7 7d 0c             	idivl  0xc(%ebp)
c000a16e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a171:	8b 45 08             	mov    0x8(%ebp),%eax
c000a174:	99                   	cltd   
c000a175:	f7 7d 0c             	idivl  0xc(%ebp)
c000a178:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a17b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a17f:	74 14                	je     c000a195 <i2a+0x35>
c000a181:	83 ec 04             	sub    $0x4,%esp
c000a184:	ff 75 10             	pushl  0x10(%ebp)
c000a187:	ff 75 0c             	pushl  0xc(%ebp)
c000a18a:	ff 75 f0             	pushl  -0x10(%ebp)
c000a18d:	e8 ce ff ff ff       	call   c000a160 <i2a>
c000a192:	83 c4 10             	add    $0x10,%esp
c000a195:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a199:	7f 0a                	jg     c000a1a5 <i2a+0x45>
c000a19b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a19e:	83 c0 30             	add    $0x30,%eax
c000a1a1:	89 c3                	mov    %eax,%ebx
c000a1a3:	eb 08                	jmp    c000a1ad <i2a+0x4d>
c000a1a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1a8:	83 c0 37             	add    $0x37,%eax
c000a1ab:	89 c3                	mov    %eax,%ebx
c000a1ad:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1b0:	8b 00                	mov    (%eax),%eax
c000a1b2:	8d 48 01             	lea    0x1(%eax),%ecx
c000a1b5:	8b 55 10             	mov    0x10(%ebp),%edx
c000a1b8:	89 0a                	mov    %ecx,(%edx)
c000a1ba:	88 18                	mov    %bl,(%eax)
c000a1bc:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1bf:	8b 00                	mov    (%eax),%eax
c000a1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a1c4:	c9                   	leave  
c000a1c5:	c3                   	ret    

c000a1c6 <inform_int>:
c000a1c6:	55                   	push   %ebp
c000a1c7:	89 e5                	mov    %esp,%ebp
c000a1c9:	83 ec 18             	sub    $0x18,%esp
c000a1cc:	83 ec 0c             	sub    $0xc,%esp
c000a1cf:	ff 75 08             	pushl  0x8(%ebp)
c000a1d2:	e8 56 ac ff ff       	call   c0004e2d <pid2proc>
c000a1d7:	83 c4 10             	add    $0x10,%esp
c000a1da:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a1dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1e0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a1e7:	0f be c0             	movsbl %al,%eax
c000a1ea:	83 e0 02             	and    $0x2,%eax
c000a1ed:	85 c0                	test   %eax,%eax
c000a1ef:	0f 84 8e 00 00 00    	je     c000a283 <inform_int+0xbd>
c000a1f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1f8:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a1fe:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a203:	74 0e                	je     c000a213 <inform_int+0x4d>
c000a205:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a208:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a20e:	83 f8 12             	cmp    $0x12,%eax
c000a211:	75 7d                	jne    c000a290 <inform_int+0xca>
c000a213:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c000a21a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a21d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a223:	83 ec 08             	sub    $0x8,%esp
c000a226:	ff 75 f0             	pushl  -0x10(%ebp)
c000a229:	50                   	push   %eax
c000a22a:	e8 28 cf ff ff       	call   c0007157 <alloc_virtual_memory>
c000a22f:	83 c4 10             	add    $0x10,%esp
c000a232:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a235:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a238:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a23e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a241:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a248:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a24b:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a252:	00 00 00 
c000a255:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a258:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a25f:	00 00 00 
c000a262:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a269:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a26c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a273:	83 ec 0c             	sub    $0xc,%esp
c000a276:	ff 75 f4             	pushl  -0xc(%ebp)
c000a279:	e8 f1 fd ff ff       	call   c000a06f <unblock>
c000a27e:	83 c4 10             	add    $0x10,%esp
c000a281:	eb 0d                	jmp    c000a290 <inform_int+0xca>
c000a283:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a286:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a28d:	00 00 00 
c000a290:	90                   	nop
c000a291:	c9                   	leave  
c000a292:	c3                   	ret    

c000a293 <strcmp>:
c000a293:	55                   	push   %ebp
c000a294:	89 e5                	mov    %esp,%ebp
c000a296:	83 ec 10             	sub    $0x10,%esp
c000a299:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a29d:	74 06                	je     c000a2a5 <strcmp+0x12>
c000a29f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a2a3:	75 08                	jne    c000a2ad <strcmp+0x1a>
c000a2a5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a2a8:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a2ab:	eb 53                	jmp    c000a300 <strcmp+0x6d>
c000a2ad:	8b 45 08             	mov    0x8(%ebp),%eax
c000a2b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a2b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a2b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a2b9:	eb 18                	jmp    c000a2d3 <strcmp+0x40>
c000a2bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a2be:	0f b6 10             	movzbl (%eax),%edx
c000a2c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a2c4:	0f b6 00             	movzbl (%eax),%eax
c000a2c7:	38 c2                	cmp    %al,%dl
c000a2c9:	75 1e                	jne    c000a2e9 <strcmp+0x56>
c000a2cb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a2cf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a2d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a2d6:	0f b6 00             	movzbl (%eax),%eax
c000a2d9:	84 c0                	test   %al,%al
c000a2db:	74 0d                	je     c000a2ea <strcmp+0x57>
c000a2dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a2e0:	0f b6 00             	movzbl (%eax),%eax
c000a2e3:	84 c0                	test   %al,%al
c000a2e5:	75 d4                	jne    c000a2bb <strcmp+0x28>
c000a2e7:	eb 01                	jmp    c000a2ea <strcmp+0x57>
c000a2e9:	90                   	nop
c000a2ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a2ed:	0f b6 00             	movzbl (%eax),%eax
c000a2f0:	0f be d0             	movsbl %al,%edx
c000a2f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a2f6:	0f b6 00             	movzbl (%eax),%eax
c000a2f9:	0f be c0             	movsbl %al,%eax
c000a2fc:	29 c2                	sub    %eax,%edx
c000a2fe:	89 d0                	mov    %edx,%eax
c000a300:	c9                   	leave  
c000a301:	c3                   	ret    

c000a302 <create_user_process_address_space>:
c000a302:	55                   	push   %ebp
c000a303:	89 e5                	mov    %esp,%ebp
c000a305:	83 ec 18             	sub    $0x18,%esp
c000a308:	83 ec 08             	sub    $0x8,%esp
c000a30b:	6a 00                	push   $0x0
c000a30d:	6a 01                	push   $0x1
c000a30f:	e8 f2 cf ff ff       	call   c0007306 <alloc_memory>
c000a314:	83 c4 10             	add    $0x10,%esp
c000a317:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a31a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a31d:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a324:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a32b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a32e:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a333:	c1 e8 0c             	shr    $0xc,%eax
c000a336:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a339:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a33c:	83 c0 07             	add    $0x7,%eax
c000a33f:	c1 e8 03             	shr    $0x3,%eax
c000a342:	89 c2                	mov    %eax,%edx
c000a344:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a347:	89 50 04             	mov    %edx,0x4(%eax)
c000a34a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a34d:	8b 40 04             	mov    0x4(%eax),%eax
c000a350:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a355:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a35b:	85 c0                	test   %eax,%eax
c000a35d:	0f 48 c2             	cmovs  %edx,%eax
c000a360:	c1 f8 0c             	sar    $0xc,%eax
c000a363:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a366:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a369:	83 ec 08             	sub    $0x8,%esp
c000a36c:	6a 00                	push   $0x0
c000a36e:	50                   	push   %eax
c000a36f:	e8 92 cf ff ff       	call   c0007306 <alloc_memory>
c000a374:	83 c4 10             	add    $0x10,%esp
c000a377:	89 c2                	mov    %eax,%edx
c000a379:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a37c:	89 10                	mov    %edx,(%eax)
c000a37e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a381:	83 ec 0c             	sub    $0xc,%esp
c000a384:	50                   	push   %eax
c000a385:	e8 6a c9 ff ff       	call   c0006cf4 <init_bitmap>
c000a38a:	83 c4 10             	add    $0x10,%esp
c000a38d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a390:	c9                   	leave  
c000a391:	c3                   	ret    

c000a392 <user_process>:
c000a392:	55                   	push   %ebp
c000a393:	89 e5                	mov    %esp,%ebp
c000a395:	83 ec 38             	sub    $0x38,%esp
c000a398:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a39f:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a3a6:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a3ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a3b1:	75 0e                	jne    c000a3c1 <user_process+0x2f>
c000a3b3:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a3b9:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a3bf:	eb 0c                	jmp    c000a3cd <user_process+0x3b>
c000a3c1:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a3c7:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a3cd:	e8 be 74 ff ff       	call   c0001890 <get_running_thread_pcb>
c000a3d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a3d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3d8:	05 00 10 00 00       	add    $0x1000,%eax
c000a3dd:	89 c2                	mov    %eax,%edx
c000a3df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3e2:	89 10                	mov    %edx,(%eax)
c000a3e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3e7:	8b 00                	mov    (%eax),%eax
c000a3e9:	83 e8 44             	sub    $0x44,%eax
c000a3ec:	89 c2                	mov    %eax,%edx
c000a3ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3f1:	89 10                	mov    %edx,(%eax)
c000a3f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3f6:	8b 00                	mov    (%eax),%eax
c000a3f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a3fb:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a3ff:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a405:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a409:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a40d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a411:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a415:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a419:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a41d:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a423:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a427:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a42a:	89 50 34             	mov    %edx,0x34(%eax)
c000a42d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a431:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a434:	89 50 0c             	mov    %edx,0xc(%eax)
c000a437:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a43b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a43e:	89 50 04             	mov    %edx,0x4(%eax)
c000a441:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a445:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a448:	89 50 08             	mov    %edx,0x8(%eax)
c000a44b:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a44f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a452:	89 50 40             	mov    %edx,0x40(%eax)
c000a455:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a459:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a45c:	89 10                	mov    %edx,(%eax)
c000a45e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a461:	8b 55 08             	mov    0x8(%ebp),%edx
c000a464:	89 50 30             	mov    %edx,0x30(%eax)
c000a467:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a46b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a46e:	89 50 38             	mov    %edx,0x38(%eax)
c000a471:	83 ec 08             	sub    $0x8,%esp
c000a474:	6a 01                	push   $0x1
c000a476:	68 00 f0 ff bf       	push   $0xbffff000
c000a47b:	e8 d0 cd ff ff       	call   c0007250 <alloc_physical_memory>
c000a480:	83 c4 10             	add    $0x10,%esp
c000a483:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a489:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a48c:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a48f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a492:	83 ec 0c             	sub    $0xc,%esp
c000a495:	50                   	push   %eax
c000a496:	e8 ca 72 ff ff       	call   c0001765 <restart>
c000a49b:	83 c4 10             	add    $0x10,%esp
c000a49e:	90                   	nop
c000a49f:	c9                   	leave  
c000a4a0:	c3                   	ret    

c000a4a1 <clone_pcb>:
c000a4a1:	55                   	push   %ebp
c000a4a2:	89 e5                	mov    %esp,%ebp
c000a4a4:	83 ec 18             	sub    $0x18,%esp
c000a4a7:	83 ec 08             	sub    $0x8,%esp
c000a4aa:	6a 00                	push   $0x0
c000a4ac:	6a 01                	push   $0x1
c000a4ae:	e8 53 ce ff ff       	call   c0007306 <alloc_memory>
c000a4b3:	83 c4 10             	add    $0x10,%esp
c000a4b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a4b9:	83 ec 04             	sub    $0x4,%esp
c000a4bc:	68 00 10 00 00       	push   $0x1000
c000a4c1:	6a 00                	push   $0x0
c000a4c3:	ff 75 f4             	pushl  -0xc(%ebp)
c000a4c6:	e8 60 16 00 00       	call   c000bb2b <Memset>
c000a4cb:	83 c4 10             	add    $0x10,%esp
c000a4ce:	83 ec 04             	sub    $0x4,%esp
c000a4d1:	68 00 10 00 00       	push   $0x1000
c000a4d6:	ff 75 08             	pushl  0x8(%ebp)
c000a4d9:	ff 75 f4             	pushl  -0xc(%ebp)
c000a4dc:	e8 27 d7 ff ff       	call   c0007c08 <Memcpy>
c000a4e1:	83 c4 10             	add    $0x10,%esp
c000a4e4:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000a4e9:	83 c0 01             	add    $0x1,%eax
c000a4ec:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000a4f1:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000a4f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4fa:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a500:	8b 45 08             	mov    0x8(%ebp),%eax
c000a503:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000a509:	89 c2                	mov    %eax,%edx
c000a50b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a50e:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a514:	83 ec 08             	sub    $0x8,%esp
c000a517:	6a 00                	push   $0x0
c000a519:	6a 01                	push   $0x1
c000a51b:	e8 e6 cd ff ff       	call   c0007306 <alloc_memory>
c000a520:	83 c4 10             	add    $0x10,%esp
c000a523:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a526:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a529:	05 00 0c 00 00       	add    $0xc00,%eax
c000a52e:	83 ec 04             	sub    $0x4,%esp
c000a531:	68 00 04 00 00       	push   $0x400
c000a536:	68 00 fc ff ff       	push   $0xfffffc00
c000a53b:	50                   	push   %eax
c000a53c:	e8 c7 d6 ff ff       	call   c0007c08 <Memcpy>
c000a541:	83 c4 10             	add    $0x10,%esp
c000a544:	83 ec 0c             	sub    $0xc,%esp
c000a547:	ff 75 f0             	pushl  -0x10(%ebp)
c000a54a:	e8 cf cc ff ff       	call   c000721e <get_physical_address>
c000a54f:	83 c4 10             	add    $0x10,%esp
c000a552:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a555:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a558:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a55d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a560:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a563:	83 c8 07             	or     $0x7,%eax
c000a566:	89 c2                	mov    %eax,%edx
c000a568:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a56b:	89 10                	mov    %edx,(%eax)
c000a56d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a570:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a573:	89 50 08             	mov    %edx,0x8(%eax)
c000a576:	e8 87 fd ff ff       	call   c000a302 <create_user_process_address_space>
c000a57b:	89 c2                	mov    %eax,%edx
c000a57d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a580:	89 50 0c             	mov    %edx,0xc(%eax)
c000a583:	8b 45 08             	mov    0x8(%ebp),%eax
c000a586:	8b 40 0c             	mov    0xc(%eax),%eax
c000a589:	89 c2                	mov    %eax,%edx
c000a58b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a58e:	8b 40 0c             	mov    0xc(%eax),%eax
c000a591:	83 ec 04             	sub    $0x4,%esp
c000a594:	6a 0c                	push   $0xc
c000a596:	52                   	push   %edx
c000a597:	50                   	push   %eax
c000a598:	e8 6b d6 ff ff       	call   c0007c08 <Memcpy>
c000a59d:	83 c4 10             	add    $0x10,%esp
c000a5a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5a3:	c9                   	leave  
c000a5a4:	c3                   	ret    

c000a5a5 <build_body_stack>:
c000a5a5:	55                   	push   %ebp
c000a5a6:	89 e5                	mov    %esp,%ebp
c000a5a8:	83 ec 48             	sub    $0x48,%esp
c000a5ab:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5ae:	8b 40 0c             	mov    0xc(%eax),%eax
c000a5b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a5b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a5b7:	8b 50 04             	mov    0x4(%eax),%edx
c000a5ba:	8b 00                	mov    (%eax),%eax
c000a5bc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a5bf:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000a5c2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000a5c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a5c8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a5cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a5ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a5d1:	8b 40 08             	mov    0x8(%eax),%eax
c000a5d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a5d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a5de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a5e5:	e8 ba d5 ff ff       	call   c0007ba4 <intr_disable>
c000a5ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a5ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a5f4:	e9 c2 00 00 00       	jmp    c000a6bb <build_body_stack+0x116>
c000a5f9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a5fc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a5ff:	01 d0                	add    %edx,%eax
c000a601:	0f b6 00             	movzbl (%eax),%eax
c000a604:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000a607:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a60e:	e9 9a 00 00 00       	jmp    c000a6ad <build_body_stack+0x108>
c000a613:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000a617:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a61a:	89 c1                	mov    %eax,%ecx
c000a61c:	d3 fa                	sar    %cl,%edx
c000a61e:	89 d0                	mov    %edx,%eax
c000a620:	83 e0 01             	and    $0x1,%eax
c000a623:	85 c0                	test   %eax,%eax
c000a625:	75 06                	jne    c000a62d <build_body_stack+0x88>
c000a627:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a62b:	eb 7c                	jmp    c000a6a9 <build_body_stack+0x104>
c000a62d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a630:	8b 40 08             	mov    0x8(%eax),%eax
c000a633:	83 ec 0c             	sub    $0xc,%esp
c000a636:	50                   	push   %eax
c000a637:	e8 38 72 ff ff       	call   c0001874 <update_cr3>
c000a63c:	83 c4 10             	add    $0x10,%esp
c000a63f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a642:	c1 e0 0c             	shl    $0xc,%eax
c000a645:	89 c2                	mov    %eax,%edx
c000a647:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a64a:	01 d0                	add    %edx,%eax
c000a64c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a64f:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000a652:	8b 45 10             	mov    0x10(%ebp),%eax
c000a655:	83 ec 04             	sub    $0x4,%esp
c000a658:	68 00 10 00 00       	push   $0x1000
c000a65d:	52                   	push   %edx
c000a65e:	50                   	push   %eax
c000a65f:	e8 a4 d5 ff ff       	call   c0007c08 <Memcpy>
c000a664:	83 c4 10             	add    $0x10,%esp
c000a667:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a66a:	8b 40 08             	mov    0x8(%eax),%eax
c000a66d:	83 ec 0c             	sub    $0xc,%esp
c000a670:	50                   	push   %eax
c000a671:	e8 fe 71 ff ff       	call   c0001874 <update_cr3>
c000a676:	83 c4 10             	add    $0x10,%esp
c000a679:	83 ec 08             	sub    $0x8,%esp
c000a67c:	ff 75 cc             	pushl  -0x34(%ebp)
c000a67f:	6a 01                	push   $0x1
c000a681:	e8 e2 cc ff ff       	call   c0007368 <get_a_virtual_page>
c000a686:	83 c4 10             	add    $0x10,%esp
c000a689:	8b 55 10             	mov    0x10(%ebp),%edx
c000a68c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a68f:	83 ec 04             	sub    $0x4,%esp
c000a692:	68 00 10 00 00       	push   $0x1000
c000a697:	52                   	push   %edx
c000a698:	50                   	push   %eax
c000a699:	e8 6a d5 ff ff       	call   c0007c08 <Memcpy>
c000a69e:	83 c4 10             	add    $0x10,%esp
c000a6a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a6a5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a6a9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a6ad:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a6b1:	0f 8e 5c ff ff ff    	jle    c000a613 <build_body_stack+0x6e>
c000a6b7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a6bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a6be:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a6c1:	0f 87 32 ff ff ff    	ja     c000a5f9 <build_body_stack+0x54>
c000a6c7:	83 ec 0c             	sub    $0xc,%esp
c000a6ca:	ff 75 d4             	pushl  -0x2c(%ebp)
c000a6cd:	e8 fb d4 ff ff       	call   c0007bcd <intr_set_status>
c000a6d2:	83 c4 10             	add    $0x10,%esp
c000a6d5:	90                   	nop
c000a6d6:	c9                   	leave  
c000a6d7:	c3                   	ret    

c000a6d8 <build_process_kernel_stack>:
c000a6d8:	55                   	push   %ebp
c000a6d9:	89 e5                	mov    %esp,%ebp
c000a6db:	83 ec 28             	sub    $0x28,%esp
c000a6de:	e8 c1 d4 ff ff       	call   c0007ba4 <intr_disable>
c000a6e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a6e6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6e9:	05 00 10 00 00       	add    $0x1000,%eax
c000a6ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a6f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6f4:	8b 00                	mov    (%eax),%eax
c000a6f6:	83 f8 38             	cmp    $0x38,%eax
c000a6f9:	74 06                	je     c000a701 <build_process_kernel_stack+0x29>
c000a6fb:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000a6ff:	eb f0                	jmp    c000a6f1 <build_process_kernel_stack+0x19>
c000a701:	90                   	nop
c000a702:	8b 45 08             	mov    0x8(%ebp),%eax
c000a705:	05 00 10 00 00       	add    $0x1000,%eax
c000a70a:	89 c2                	mov    %eax,%edx
c000a70c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a70f:	89 50 04             	mov    %edx,0x4(%eax)
c000a712:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a715:	83 c0 2c             	add    $0x2c,%eax
c000a718:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a71b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a71e:	83 e8 04             	sub    $0x4,%eax
c000a721:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a724:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a727:	83 e8 08             	sub    $0x8,%eax
c000a72a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a72d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a730:	83 e8 0c             	sub    $0xc,%eax
c000a733:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a736:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a739:	83 e8 10             	sub    $0x10,%eax
c000a73c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a73f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a742:	83 e8 14             	sub    $0x14,%eax
c000a745:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a748:	ba 5c 17 00 c0       	mov    $0xc000175c,%edx
c000a74d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a750:	89 10                	mov    %edx,(%eax)
c000a752:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a755:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a75b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a75e:	8b 10                	mov    (%eax),%edx
c000a760:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a763:	89 10                	mov    %edx,(%eax)
c000a765:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a768:	8b 10                	mov    (%eax),%edx
c000a76a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a76d:	89 10                	mov    %edx,(%eax)
c000a76f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a772:	8b 10                	mov    (%eax),%edx
c000a774:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a777:	89 10                	mov    %edx,(%eax)
c000a779:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a77c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a782:	8b 45 08             	mov    0x8(%ebp),%eax
c000a785:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000a788:	89 10                	mov    %edx,(%eax)
c000a78a:	83 ec 0c             	sub    $0xc,%esp
c000a78d:	ff 75 f0             	pushl  -0x10(%ebp)
c000a790:	e8 38 d4 ff ff       	call   c0007bcd <intr_set_status>
c000a795:	83 c4 10             	add    $0x10,%esp
c000a798:	90                   	nop
c000a799:	c9                   	leave  
c000a79a:	c3                   	ret    

c000a79b <fork_process>:
c000a79b:	55                   	push   %ebp
c000a79c:	89 e5                	mov    %esp,%ebp
c000a79e:	83 ec 18             	sub    $0x18,%esp
c000a7a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7a4:	83 ec 0c             	sub    $0xc,%esp
c000a7a7:	50                   	push   %eax
c000a7a8:	e8 80 a6 ff ff       	call   c0004e2d <pid2proc>
c000a7ad:	83 c4 10             	add    $0x10,%esp
c000a7b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a7b3:	83 ec 0c             	sub    $0xc,%esp
c000a7b6:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7b9:	e8 e3 fc ff ff       	call   c000a4a1 <clone_pcb>
c000a7be:	83 c4 10             	add    $0x10,%esp
c000a7c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a7c4:	83 ec 08             	sub    $0x8,%esp
c000a7c7:	6a 00                	push   $0x0
c000a7c9:	6a 01                	push   $0x1
c000a7cb:	e8 36 cb ff ff       	call   c0007306 <alloc_memory>
c000a7d0:	83 c4 10             	add    $0x10,%esp
c000a7d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a7d6:	83 ec 04             	sub    $0x4,%esp
c000a7d9:	ff 75 ec             	pushl  -0x14(%ebp)
c000a7dc:	ff 75 f0             	pushl  -0x10(%ebp)
c000a7df:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7e2:	e8 be fd ff ff       	call   c000a5a5 <build_body_stack>
c000a7e7:	83 c4 10             	add    $0x10,%esp
c000a7ea:	83 ec 0c             	sub    $0xc,%esp
c000a7ed:	ff 75 f0             	pushl  -0x10(%ebp)
c000a7f0:	e8 e3 fe ff ff       	call   c000a6d8 <build_process_kernel_stack>
c000a7f5:	83 c4 10             	add    $0x10,%esp
c000a7f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7fb:	05 00 01 00 00       	add    $0x100,%eax
c000a800:	83 ec 04             	sub    $0x4,%esp
c000a803:	6a 08                	push   $0x8
c000a805:	6a 00                	push   $0x0
c000a807:	50                   	push   %eax
c000a808:	e8 1e 13 00 00       	call   c000bb2b <Memset>
c000a80d:	83 c4 10             	add    $0x10,%esp
c000a810:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a813:	05 08 01 00 00       	add    $0x108,%eax
c000a818:	83 ec 04             	sub    $0x4,%esp
c000a81b:	6a 08                	push   $0x8
c000a81d:	6a 00                	push   $0x0
c000a81f:	50                   	push   %eax
c000a820:	e8 06 13 00 00       	call   c000bb2b <Memset>
c000a825:	83 c4 10             	add    $0x10,%esp
c000a828:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a82b:	05 08 01 00 00       	add    $0x108,%eax
c000a830:	83 ec 08             	sub    $0x8,%esp
c000a833:	50                   	push   %eax
c000a834:	68 04 1f 01 c0       	push   $0xc0011f04
c000a839:	e8 c2 02 00 00       	call   c000ab00 <appendToDoubleLinkList>
c000a83e:	83 c4 10             	add    $0x10,%esp
c000a841:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a844:	c9                   	leave  
c000a845:	c3                   	ret    

c000a846 <process_execute>:
c000a846:	55                   	push   %ebp
c000a847:	89 e5                	mov    %esp,%ebp
c000a849:	83 ec 28             	sub    $0x28,%esp
c000a84c:	e8 c5 04 00 00       	call   c000ad16 <thread_init>
c000a851:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a854:	83 ec 0c             	sub    $0xc,%esp
c000a857:	ff 75 f4             	pushl  -0xc(%ebp)
c000a85a:	e8 64 05 00 00       	call   c000adc3 <thread_create>
c000a85f:	83 c4 10             	add    $0x10,%esp
c000a862:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a865:	05 34 01 00 00       	add    $0x134,%eax
c000a86a:	83 ec 08             	sub    $0x8,%esp
c000a86d:	ff 75 10             	pushl  0x10(%ebp)
c000a870:	50                   	push   %eax
c000a871:	e8 d4 12 00 00       	call   c000bb4a <Strcpy>
c000a876:	83 c4 10             	add    $0x10,%esp
c000a879:	83 ec 08             	sub    $0x8,%esp
c000a87c:	6a 00                	push   $0x0
c000a87e:	6a 01                	push   $0x1
c000a880:	e8 81 ca ff ff       	call   c0007306 <alloc_memory>
c000a885:	83 c4 10             	add    $0x10,%esp
c000a888:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a88b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a88e:	05 00 0c 00 00       	add    $0xc00,%eax
c000a893:	83 ec 04             	sub    $0x4,%esp
c000a896:	68 00 04 00 00       	push   $0x400
c000a89b:	68 00 fc ff ff       	push   $0xfffffc00
c000a8a0:	50                   	push   %eax
c000a8a1:	e8 62 d3 ff ff       	call   c0007c08 <Memcpy>
c000a8a6:	83 c4 10             	add    $0x10,%esp
c000a8a9:	83 ec 0c             	sub    $0xc,%esp
c000a8ac:	ff 75 f0             	pushl  -0x10(%ebp)
c000a8af:	e8 6a c9 ff ff       	call   c000721e <get_physical_address>
c000a8b4:	83 c4 10             	add    $0x10,%esp
c000a8b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a8ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a8bd:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a8c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a8c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a8c8:	83 c8 07             	or     $0x7,%eax
c000a8cb:	89 c2                	mov    %eax,%edx
c000a8cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a8d0:	89 10                	mov    %edx,(%eax)
c000a8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8d5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a8d8:	89 50 08             	mov    %edx,0x8(%eax)
c000a8db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8de:	83 c0 10             	add    $0x10,%eax
c000a8e1:	83 ec 0c             	sub    $0xc,%esp
c000a8e4:	50                   	push   %eax
c000a8e5:	e8 00 ce ff ff       	call   c00076ea <init_memory_block_desc>
c000a8ea:	83 c4 10             	add    $0x10,%esp
c000a8ed:	e8 10 fa ff ff       	call   c000a302 <create_user_process_address_space>
c000a8f2:	89 c2                	mov    %eax,%edx
c000a8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8f7:	89 50 0c             	mov    %edx,0xc(%eax)
c000a8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8fd:	8b 00                	mov    (%eax),%eax
c000a8ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a902:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a905:	c7 40 10 92 a3 00 c0 	movl   $0xc000a392,0x10(%eax)
c000a90c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a90f:	8b 55 08             	mov    0x8(%ebp),%edx
c000a912:	89 50 18             	mov    %edx,0x18(%eax)
c000a915:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a918:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a91b:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a91e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a921:	8b 55 14             	mov    0x14(%ebp),%edx
c000a924:	89 50 20             	mov    %edx,0x20(%eax)
c000a927:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a92a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a92d:	89 50 24             	mov    %edx,0x24(%eax)
c000a930:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a933:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a939:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a93c:	8b 10                	mov    (%eax),%edx
c000a93e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a941:	89 50 04             	mov    %edx,0x4(%eax)
c000a944:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a947:	8b 50 04             	mov    0x4(%eax),%edx
c000a94a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a94d:	89 50 08             	mov    %edx,0x8(%eax)
c000a950:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a953:	8b 50 08             	mov    0x8(%eax),%edx
c000a956:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a959:	89 50 0c             	mov    %edx,0xc(%eax)
c000a95c:	83 ec 0c             	sub    $0xc,%esp
c000a95f:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a964:	e8 9a 00 00 00       	call   c000aa03 <isListEmpty>
c000a969:	83 c4 10             	add    $0x10,%esp
c000a96c:	e8 33 d2 ff ff       	call   c0007ba4 <intr_disable>
c000a971:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a974:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a977:	05 00 01 00 00       	add    $0x100,%eax
c000a97c:	83 ec 08             	sub    $0x8,%esp
c000a97f:	50                   	push   %eax
c000a980:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a985:	e8 76 01 00 00       	call   c000ab00 <appendToDoubleLinkList>
c000a98a:	83 c4 10             	add    $0x10,%esp
c000a98d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a990:	05 08 01 00 00       	add    $0x108,%eax
c000a995:	83 ec 08             	sub    $0x8,%esp
c000a998:	50                   	push   %eax
c000a999:	68 04 1f 01 c0       	push   $0xc0011f04
c000a99e:	e8 5d 01 00 00       	call   c000ab00 <appendToDoubleLinkList>
c000a9a3:	83 c4 10             	add    $0x10,%esp
c000a9a6:	83 ec 0c             	sub    $0xc,%esp
c000a9a9:	ff 75 e0             	pushl  -0x20(%ebp)
c000a9ac:	e8 1c d2 ff ff       	call   c0007bcd <intr_set_status>
c000a9b1:	83 c4 10             	add    $0x10,%esp
c000a9b4:	90                   	nop
c000a9b5:	c9                   	leave  
c000a9b6:	c3                   	ret    
c000a9b7:	66 90                	xchg   %ax,%ax
c000a9b9:	66 90                	xchg   %ax,%ax
c000a9bb:	66 90                	xchg   %ax,%ax
c000a9bd:	66 90                	xchg   %ax,%ax
c000a9bf:	90                   	nop

c000a9c0 <switch_to>:
c000a9c0:	56                   	push   %esi
c000a9c1:	57                   	push   %edi
c000a9c2:	53                   	push   %ebx
c000a9c3:	55                   	push   %ebp
c000a9c4:	89 e5                	mov    %esp,%ebp
c000a9c6:	8b 45 14             	mov    0x14(%ebp),%eax
c000a9c9:	89 20                	mov    %esp,(%eax)
c000a9cb:	8b 45 18             	mov    0x18(%ebp),%eax
c000a9ce:	8b 20                	mov    (%eax),%esp
c000a9d0:	5d                   	pop    %ebp
c000a9d1:	5b                   	pop    %ebx
c000a9d2:	5f                   	pop    %edi
c000a9d3:	5e                   	pop    %esi
c000a9d4:	c3                   	ret    

c000a9d5 <initDoubleLinkList>:
c000a9d5:	55                   	push   %ebp
c000a9d6:	89 e5                	mov    %esp,%ebp
c000a9d8:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a9e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9e4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a9eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9ee:	8d 50 08             	lea    0x8(%eax),%edx
c000a9f1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9f4:	89 50 04             	mov    %edx,0x4(%eax)
c000a9f7:	8b 55 08             	mov    0x8(%ebp),%edx
c000a9fa:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9fd:	89 50 08             	mov    %edx,0x8(%eax)
c000aa00:	90                   	nop
c000aa01:	5d                   	pop    %ebp
c000aa02:	c3                   	ret    

c000aa03 <isListEmpty>:
c000aa03:	55                   	push   %ebp
c000aa04:	89 e5                	mov    %esp,%ebp
c000aa06:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa09:	8b 40 04             	mov    0x4(%eax),%eax
c000aa0c:	8b 55 08             	mov    0x8(%ebp),%edx
c000aa0f:	83 c2 08             	add    $0x8,%edx
c000aa12:	39 d0                	cmp    %edx,%eax
c000aa14:	75 07                	jne    c000aa1d <isListEmpty+0x1a>
c000aa16:	b8 01 00 00 00       	mov    $0x1,%eax
c000aa1b:	eb 05                	jmp    c000aa22 <isListEmpty+0x1f>
c000aa1d:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa22:	5d                   	pop    %ebp
c000aa23:	c3                   	ret    

c000aa24 <findElementInList>:
c000aa24:	55                   	push   %ebp
c000aa25:	89 e5                	mov    %esp,%ebp
c000aa27:	83 ec 28             	sub    $0x28,%esp
c000aa2a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000aa2e:	75 19                	jne    c000aa49 <findElementInList+0x25>
c000aa30:	6a 60                	push   $0x60
c000aa32:	68 d1 ba 00 c0       	push   $0xc000bad1
c000aa37:	68 d1 ba 00 c0       	push   $0xc000bad1
c000aa3c:	68 e4 ba 00 c0       	push   $0xc000bae4
c000aa41:	e8 81 ec ff ff       	call   c00096c7 <assertion_failure>
c000aa46:	83 c4 10             	add    $0x10,%esp
c000aa49:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000aa4d:	75 19                	jne    c000aa68 <findElementInList+0x44>
c000aa4f:	6a 61                	push   $0x61
c000aa51:	68 d1 ba 00 c0       	push   $0xc000bad1
c000aa56:	68 d1 ba 00 c0       	push   $0xc000bad1
c000aa5b:	68 f0 ba 00 c0       	push   $0xc000baf0
c000aa60:	e8 62 ec ff ff       	call   c00096c7 <assertion_failure>
c000aa65:	83 c4 10             	add    $0x10,%esp
c000aa68:	e8 37 d1 ff ff       	call   c0007ba4 <intr_disable>
c000aa6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aa70:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000aa77:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa7a:	8b 40 08             	mov    0x8(%eax),%eax
c000aa7d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aa80:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa83:	8b 40 04             	mov    0x4(%eax),%eax
c000aa86:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa89:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa8d:	75 07                	jne    c000aa96 <findElementInList+0x72>
c000aa8f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa94:	eb 68                	jmp    c000aafe <findElementInList+0xda>
c000aa96:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aa99:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aa9f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000aaa2:	c1 f8 03             	sar    $0x3,%eax
c000aaa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aaa8:	eb 36                	jmp    c000aae0 <findElementInList+0xbc>
c000aaaa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aaad:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000aab0:	75 07                	jne    c000aab9 <findElementInList+0x95>
c000aab2:	b8 01 00 00 00       	mov    $0x1,%eax
c000aab7:	eb 45                	jmp    c000aafe <findElementInList+0xda>
c000aab9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aabd:	75 07                	jne    c000aac6 <findElementInList+0xa2>
c000aabf:	b8 00 00 00 00       	mov    $0x0,%eax
c000aac4:	eb 38                	jmp    c000aafe <findElementInList+0xda>
c000aac6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aac9:	8b 40 04             	mov    0x4(%eax),%eax
c000aacc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aacf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aad3:	75 07                	jne    c000aadc <findElementInList+0xb8>
c000aad5:	b8 00 00 00 00       	mov    $0x0,%eax
c000aada:	eb 22                	jmp    c000aafe <findElementInList+0xda>
c000aadc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000aae0:	8b 45 08             	mov    0x8(%ebp),%eax
c000aae3:	83 c0 08             	add    $0x8,%eax
c000aae6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000aae9:	75 bf                	jne    c000aaaa <findElementInList+0x86>
c000aaeb:	83 ec 0c             	sub    $0xc,%esp
c000aaee:	ff 75 ec             	pushl  -0x14(%ebp)
c000aaf1:	e8 d7 d0 ff ff       	call   c0007bcd <intr_set_status>
c000aaf6:	83 c4 10             	add    $0x10,%esp
c000aaf9:	b8 00 00 00 00       	mov    $0x0,%eax
c000aafe:	c9                   	leave  
c000aaff:	c3                   	ret    

c000ab00 <appendToDoubleLinkList>:
c000ab00:	55                   	push   %ebp
c000ab01:	89 e5                	mov    %esp,%ebp
c000ab03:	83 ec 18             	sub    $0x18,%esp
c000ab06:	83 ec 08             	sub    $0x8,%esp
c000ab09:	ff 75 0c             	pushl  0xc(%ebp)
c000ab0c:	ff 75 08             	pushl  0x8(%ebp)
c000ab0f:	e8 10 ff ff ff       	call   c000aa24 <findElementInList>
c000ab14:	83 c4 10             	add    $0x10,%esp
c000ab17:	3c 01                	cmp    $0x1,%al
c000ab19:	0f 84 c2 00 00 00    	je     c000abe1 <appendToDoubleLinkList+0xe1>
c000ab1f:	e8 80 d0 ff ff       	call   c0007ba4 <intr_disable>
c000ab24:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ab27:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000ab2b:	75 1c                	jne    c000ab49 <appendToDoubleLinkList+0x49>
c000ab2d:	68 9e 00 00 00       	push   $0x9e
c000ab32:	68 d1 ba 00 c0       	push   $0xc000bad1
c000ab37:	68 d1 ba 00 c0       	push   $0xc000bad1
c000ab3c:	68 e4 ba 00 c0       	push   $0xc000bae4
c000ab41:	e8 81 eb ff ff       	call   c00096c7 <assertion_failure>
c000ab46:	83 c4 10             	add    $0x10,%esp
c000ab49:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ab4d:	75 1c                	jne    c000ab6b <appendToDoubleLinkList+0x6b>
c000ab4f:	68 9f 00 00 00       	push   $0x9f
c000ab54:	68 d1 ba 00 c0       	push   $0xc000bad1
c000ab59:	68 d1 ba 00 c0       	push   $0xc000bad1
c000ab5e:	68 f0 ba 00 c0       	push   $0xc000baf0
c000ab63:	e8 5f eb ff ff       	call   c00096c7 <assertion_failure>
c000ab68:	83 c4 10             	add    $0x10,%esp
c000ab6b:	83 ec 08             	sub    $0x8,%esp
c000ab6e:	ff 75 0c             	pushl  0xc(%ebp)
c000ab71:	ff 75 08             	pushl  0x8(%ebp)
c000ab74:	e8 ab fe ff ff       	call   c000aa24 <findElementInList>
c000ab79:	83 c4 10             	add    $0x10,%esp
c000ab7c:	3c 01                	cmp    $0x1,%al
c000ab7e:	74 64                	je     c000abe4 <appendToDoubleLinkList+0xe4>
c000ab80:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ab83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ab86:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab89:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ab90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab93:	8b 50 04             	mov    0x4(%eax),%edx
c000ab96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab99:	89 10                	mov    %edx,(%eax)
c000ab9b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab9e:	8b 50 08             	mov    0x8(%eax),%edx
c000aba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aba4:	89 10                	mov    %edx,(%eax)
c000aba6:	8b 45 08             	mov    0x8(%ebp),%eax
c000aba9:	8b 40 08             	mov    0x8(%eax),%eax
c000abac:	85 c0                	test   %eax,%eax
c000abae:	74 0c                	je     c000abbc <appendToDoubleLinkList+0xbc>
c000abb0:	8b 45 08             	mov    0x8(%ebp),%eax
c000abb3:	8b 40 08             	mov    0x8(%eax),%eax
c000abb6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000abb9:	89 50 04             	mov    %edx,0x4(%eax)
c000abbc:	8b 45 08             	mov    0x8(%ebp),%eax
c000abbf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000abc2:	89 50 08             	mov    %edx,0x8(%eax)
c000abc5:	8b 45 08             	mov    0x8(%ebp),%eax
c000abc8:	8d 50 08             	lea    0x8(%eax),%edx
c000abcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abce:	89 50 04             	mov    %edx,0x4(%eax)
c000abd1:	83 ec 0c             	sub    $0xc,%esp
c000abd4:	ff 75 f4             	pushl  -0xc(%ebp)
c000abd7:	e8 f1 cf ff ff       	call   c0007bcd <intr_set_status>
c000abdc:	83 c4 10             	add    $0x10,%esp
c000abdf:	eb 04                	jmp    c000abe5 <appendToDoubleLinkList+0xe5>
c000abe1:	90                   	nop
c000abe2:	eb 01                	jmp    c000abe5 <appendToDoubleLinkList+0xe5>
c000abe4:	90                   	nop
c000abe5:	c9                   	leave  
c000abe6:	c3                   	ret    

c000abe7 <insertToDoubleLinkList>:
c000abe7:	55                   	push   %ebp
c000abe8:	89 e5                	mov    %esp,%ebp
c000abea:	83 ec 18             	sub    $0x18,%esp
c000abed:	83 ec 08             	sub    $0x8,%esp
c000abf0:	ff 75 0c             	pushl  0xc(%ebp)
c000abf3:	ff 75 08             	pushl  0x8(%ebp)
c000abf6:	e8 29 fe ff ff       	call   c000aa24 <findElementInList>
c000abfb:	83 c4 10             	add    $0x10,%esp
c000abfe:	3c 01                	cmp    $0x1,%al
c000ac00:	74 65                	je     c000ac67 <insertToDoubleLinkList+0x80>
c000ac02:	e8 9d cf ff ff       	call   c0007ba4 <intr_disable>
c000ac07:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ac0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac13:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ac1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac1d:	8b 50 04             	mov    0x4(%eax),%edx
c000ac20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac23:	89 10                	mov    %edx,(%eax)
c000ac25:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac28:	8b 50 04             	mov    0x4(%eax),%edx
c000ac2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac2e:	89 50 04             	mov    %edx,0x4(%eax)
c000ac31:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac34:	8b 40 04             	mov    0x4(%eax),%eax
c000ac37:	85 c0                	test   %eax,%eax
c000ac39:	74 0b                	je     c000ac46 <insertToDoubleLinkList+0x5f>
c000ac3b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac3e:	8b 40 04             	mov    0x4(%eax),%eax
c000ac41:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ac44:	89 10                	mov    %edx,(%eax)
c000ac46:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac49:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ac4c:	89 50 04             	mov    %edx,0x4(%eax)
c000ac4f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ac52:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac55:	89 10                	mov    %edx,(%eax)
c000ac57:	83 ec 0c             	sub    $0xc,%esp
c000ac5a:	ff 75 f4             	pushl  -0xc(%ebp)
c000ac5d:	e8 6b cf ff ff       	call   c0007bcd <intr_set_status>
c000ac62:	83 c4 10             	add    $0x10,%esp
c000ac65:	eb 01                	jmp    c000ac68 <insertToDoubleLinkList+0x81>
c000ac67:	90                   	nop
c000ac68:	c9                   	leave  
c000ac69:	c3                   	ret    

c000ac6a <popFromDoubleLinkList>:
c000ac6a:	55                   	push   %ebp
c000ac6b:	89 e5                	mov    %esp,%ebp
c000ac6d:	83 ec 18             	sub    $0x18,%esp
c000ac70:	e8 2f cf ff ff       	call   c0007ba4 <intr_disable>
c000ac75:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac78:	83 ec 0c             	sub    $0xc,%esp
c000ac7b:	ff 75 08             	pushl  0x8(%ebp)
c000ac7e:	e8 80 fd ff ff       	call   c000aa03 <isListEmpty>
c000ac83:	83 c4 10             	add    $0x10,%esp
c000ac86:	3c 01                	cmp    $0x1,%al
c000ac88:	75 07                	jne    c000ac91 <popFromDoubleLinkList+0x27>
c000ac8a:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac8f:	eb 6b                	jmp    c000acfc <popFromDoubleLinkList+0x92>
c000ac91:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac94:	8b 40 08             	mov    0x8(%eax),%eax
c000ac97:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac9a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac9d:	8b 40 08             	mov    0x8(%eax),%eax
c000aca0:	85 c0                	test   %eax,%eax
c000aca2:	75 07                	jne    c000acab <popFromDoubleLinkList+0x41>
c000aca4:	b8 00 00 00 00       	mov    $0x0,%eax
c000aca9:	eb 51                	jmp    c000acfc <popFromDoubleLinkList+0x92>
c000acab:	8b 45 08             	mov    0x8(%ebp),%eax
c000acae:	8b 40 08             	mov    0x8(%eax),%eax
c000acb1:	8b 00                	mov    (%eax),%eax
c000acb3:	85 c0                	test   %eax,%eax
c000acb5:	74 11                	je     c000acc8 <popFromDoubleLinkList+0x5e>
c000acb7:	8b 45 08             	mov    0x8(%ebp),%eax
c000acba:	8b 40 08             	mov    0x8(%eax),%eax
c000acbd:	8b 00                	mov    (%eax),%eax
c000acbf:	8b 55 08             	mov    0x8(%ebp),%edx
c000acc2:	83 c2 08             	add    $0x8,%edx
c000acc5:	89 50 04             	mov    %edx,0x4(%eax)
c000acc8:	8b 45 08             	mov    0x8(%ebp),%eax
c000accb:	8b 40 08             	mov    0x8(%eax),%eax
c000acce:	8b 10                	mov    (%eax),%edx
c000acd0:	8b 45 08             	mov    0x8(%ebp),%eax
c000acd3:	89 50 08             	mov    %edx,0x8(%eax)
c000acd6:	83 ec 0c             	sub    $0xc,%esp
c000acd9:	ff 75 f4             	pushl  -0xc(%ebp)
c000acdc:	e8 ec ce ff ff       	call   c0007bcd <intr_set_status>
c000ace1:	83 c4 10             	add    $0x10,%esp
c000ace4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ace7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000acee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acf1:	8b 50 04             	mov    0x4(%eax),%edx
c000acf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acf7:	89 10                	mov    %edx,(%eax)
c000acf9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acfc:	c9                   	leave  
c000acfd:	c3                   	ret    

c000acfe <kernel_thread>:
c000acfe:	55                   	push   %ebp
c000acff:	89 e5                	mov    %esp,%ebp
c000ad01:	83 ec 08             	sub    $0x8,%esp
c000ad04:	fb                   	sti    
c000ad05:	83 ec 0c             	sub    $0xc,%esp
c000ad08:	ff 75 0c             	pushl  0xc(%ebp)
c000ad0b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad0e:	ff d0                	call   *%eax
c000ad10:	83 c4 10             	add    $0x10,%esp
c000ad13:	90                   	nop
c000ad14:	c9                   	leave  
c000ad15:	c3                   	ret    

c000ad16 <thread_init>:
c000ad16:	55                   	push   %ebp
c000ad17:	89 e5                	mov    %esp,%ebp
c000ad19:	83 ec 18             	sub    $0x18,%esp
c000ad1c:	83 ec 08             	sub    $0x8,%esp
c000ad1f:	6a 00                	push   $0x0
c000ad21:	6a 01                	push   $0x1
c000ad23:	e8 de c5 ff ff       	call   c0007306 <alloc_memory>
c000ad28:	83 c4 10             	add    $0x10,%esp
c000ad2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad2e:	83 ec 04             	sub    $0x4,%esp
c000ad31:	68 00 10 00 00       	push   $0x1000
c000ad36:	6a 00                	push   $0x0
c000ad38:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad3b:	e8 eb 0d 00 00       	call   c000bb2b <Memset>
c000ad40:	83 c4 10             	add    $0x10,%esp
c000ad43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad46:	05 00 10 00 00       	add    $0x1000,%eax
c000ad4b:	89 c2                	mov    %eax,%edx
c000ad4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad50:	89 10                	mov    %edx,(%eax)
c000ad52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad55:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000ad5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad5f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000ad66:	ff ff ff 
c000ad69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad6c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000ad73:	00 00 00 
c000ad76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad79:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000ad7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad82:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000ad88:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000ad8d:	83 c0 01             	add    $0x1,%eax
c000ad90:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000ad95:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000ad9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad9e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000ada4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ada7:	c7 80 28 01 00 00 05 	movl   $0x5,0x128(%eax)
c000adae:	00 00 00 
c000adb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adb4:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000adbb:	cd ab 99 
c000adbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adc1:	c9                   	leave  
c000adc2:	c3                   	ret    

c000adc3 <thread_create>:
c000adc3:	55                   	push   %ebp
c000adc4:	89 e5                	mov    %esp,%ebp
c000adc6:	83 ec 10             	sub    $0x10,%esp
c000adc9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000add0:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000add7:	8b 45 08             	mov    0x8(%ebp),%eax
c000adda:	8b 00                	mov    (%eax),%eax
c000addc:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000addf:	89 c2                	mov    %eax,%edx
c000ade1:	8b 45 08             	mov    0x8(%ebp),%eax
c000ade4:	89 10                	mov    %edx,(%eax)
c000ade6:	8b 45 08             	mov    0x8(%ebp),%eax
c000ade9:	8b 00                	mov    (%eax),%eax
c000adeb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000adee:	89 c2                	mov    %eax,%edx
c000adf0:	8b 45 08             	mov    0x8(%ebp),%eax
c000adf3:	89 10                	mov    %edx,(%eax)
c000adf5:	90                   	nop
c000adf6:	c9                   	leave  
c000adf7:	c3                   	ret    

c000adf8 <thread_start>:
c000adf8:	55                   	push   %ebp
c000adf9:	89 e5                	mov    %esp,%ebp
c000adfb:	83 ec 18             	sub    $0x18,%esp
c000adfe:	e8 13 ff ff ff       	call   c000ad16 <thread_init>
c000ae03:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ae06:	83 ec 0c             	sub    $0xc,%esp
c000ae09:	ff 75 f4             	pushl  -0xc(%ebp)
c000ae0c:	e8 b2 ff ff ff       	call   c000adc3 <thread_create>
c000ae11:	83 c4 10             	add    $0x10,%esp
c000ae14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae17:	05 34 01 00 00       	add    $0x134,%eax
c000ae1c:	83 ec 08             	sub    $0x8,%esp
c000ae1f:	ff 75 10             	pushl  0x10(%ebp)
c000ae22:	50                   	push   %eax
c000ae23:	e8 22 0d 00 00       	call   c000bb4a <Strcpy>
c000ae28:	83 c4 10             	add    $0x10,%esp
c000ae2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae2e:	8b 00                	mov    (%eax),%eax
c000ae30:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ae33:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae36:	c7 40 10 fe ac 00 c0 	movl   $0xc000acfe,0x10(%eax)
c000ae3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae40:	8b 55 08             	mov    0x8(%ebp),%edx
c000ae43:	89 50 18             	mov    %edx,0x18(%eax)
c000ae46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae49:	8b 55 0c             	mov    0xc(%ebp),%edx
c000ae4c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000ae4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae52:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ae58:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae5b:	8b 10                	mov    (%eax),%edx
c000ae5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae60:	89 50 04             	mov    %edx,0x4(%eax)
c000ae63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae66:	8b 50 04             	mov    0x4(%eax),%edx
c000ae69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae6c:	89 50 08             	mov    %edx,0x8(%eax)
c000ae6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae72:	8b 50 08             	mov    0x8(%eax),%edx
c000ae75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae78:	89 50 0c             	mov    %edx,0xc(%eax)
c000ae7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae7e:	05 00 01 00 00       	add    $0x100,%eax
c000ae83:	83 ec 08             	sub    $0x8,%esp
c000ae86:	50                   	push   %eax
c000ae87:	68 ec 0d 01 c0       	push   $0xc0010dec
c000ae8c:	e8 6f fc ff ff       	call   c000ab00 <appendToDoubleLinkList>
c000ae91:	83 c4 10             	add    $0x10,%esp
c000ae94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae97:	05 08 01 00 00       	add    $0x108,%eax
c000ae9c:	83 ec 08             	sub    $0x8,%esp
c000ae9f:	50                   	push   %eax
c000aea0:	68 04 1f 01 c0       	push   $0xc0011f04
c000aea5:	e8 56 fc ff ff       	call   c000ab00 <appendToDoubleLinkList>
c000aeaa:	83 c4 10             	add    $0x10,%esp
c000aead:	90                   	nop
c000aeae:	c9                   	leave  
c000aeaf:	c3                   	ret    
