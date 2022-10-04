
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
c0001525:	e8 37 3c 00 00       	call   c0005161 <ReloadGDT>
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
c000154e:	e9 5d 03 00 00       	jmp    c00018b0 <kernel_main>
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
c000156a:	e8 5f 6f 00 00       	call   c00084ce <test>
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
c0001661:	e8 81 69 00 00       	call   c0007fe7 <exception_handler>
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
c000168d:	e8 4d 37 00 00       	call   c0004ddf <clock_handler>
c0001692:	e9 f7 00 00 00       	jmp    c000178e <reenter_restore>

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
c00016be:	e8 e3 45 00 00       	call   c0005ca6 <keyboard_handler>
c00016c3:	b0 f8                	mov    $0xf8,%al
c00016c5:	e6 21                	out    %al,$0x21
c00016c7:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00016ce:	0f 85 ba 00 00 00    	jne    c000178e <reenter_restore>
c00016d4:	e9 b5 00 00 00       	jmp    c000178e <reenter_restore>

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
c0001703:	e8 9a 10 00 00       	call   c00027a2 <hd_handler>
c0001708:	b0 bf                	mov    $0xbf,%al
c000170a:	e6 a1                	out    %al,$0xa1
c000170c:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001713:	75 79                	jne    c000178e <reenter_restore>
c0001715:	eb 77                	jmp    c000178e <reenter_restore>

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
c0001758:	75 34                	jne    c000178e <reenter_restore>
c000175a:	eb 32                	jmp    c000178e <reenter_restore>

c000175c <fork_restart>:
c000175c:	fa                   	cli    
c000175d:	89 e0                	mov    %esp,%eax
c000175f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0001764:	83 ec 14             	sub    $0x14,%esp
c0001767:	83 c0 04             	add    $0x4,%eax
c000176a:	50                   	push   %eax
c000176b:	e8 27 01 00 00       	call   c0001897 <update_tss>
c0001770:	83 c4 18             	add    $0x18,%esp
c0001773:	0f a9                	pop    %gs
c0001775:	0f a1                	pop    %fs
c0001777:	07                   	pop    %es
c0001778:	1f                   	pop    %ds
c0001779:	61                   	popa   
c000177a:	cf                   	iret   

c000177b <restart>:
c000177b:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c0001781:	89 e5                	mov    %esp,%ebp
c0001783:	8b 65 04             	mov    0x4(%ebp),%esp
c0001786:	0f a9                	pop    %gs
c0001788:	0f a1                	pop    %fs
c000178a:	07                   	pop    %es
c000178b:	1f                   	pop    %ds
c000178c:	61                   	popa   
c000178d:	cf                   	iret   

c000178e <reenter_restore>:
c000178e:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c0001794:	0f a9                	pop    %gs
c0001796:	0f a1                	pop    %fs
c0001798:	07                   	pop    %es
c0001799:	1f                   	pop    %ds
c000179a:	61                   	popa   
c000179b:	cf                   	iret   

c000179c <in_byte>:
c000179c:	31 d2                	xor    %edx,%edx
c000179e:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017a2:	31 c0                	xor    %eax,%eax
c00017a4:	ec                   	in     (%dx),%al
c00017a5:	90                   	nop
c00017a6:	90                   	nop
c00017a7:	c3                   	ret    

c00017a8 <out_byte>:
c00017a8:	31 d2                	xor    %edx,%edx
c00017aa:	31 c0                	xor    %eax,%eax
c00017ac:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017b0:	8a 44 24 08          	mov    0x8(%esp),%al
c00017b4:	ee                   	out    %al,(%dx)
c00017b5:	90                   	nop
c00017b6:	90                   	nop
c00017b7:	c3                   	ret    

c00017b8 <in_byte2>:
c00017b8:	55                   	push   %ebp
c00017b9:	89 e5                	mov    %esp,%ebp
c00017bb:	52                   	push   %edx
c00017bc:	31 d2                	xor    %edx,%edx
c00017be:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017c2:	31 c0                	xor    %eax,%eax
c00017c4:	ec                   	in     (%dx),%al
c00017c5:	90                   	nop
c00017c6:	90                   	nop
c00017c7:	5b                   	pop    %ebx
c00017c8:	5d                   	pop    %ebp
c00017c9:	c3                   	ret    

c00017ca <disable_int>:
c00017ca:	fa                   	cli    
c00017cb:	c3                   	ret    

c00017cc <enable_int>:
c00017cc:	fb                   	sti    
c00017cd:	c3                   	ret    

c00017ce <check_tss_esp0>:
c00017ce:	55                   	push   %ebp
c00017cf:	89 e5                	mov    %esp,%ebp
c00017d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00017d4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017d7:	83 c0 44             	add    $0x44,%eax
c00017da:	8b 15 44 16 01 c0    	mov    0xc0011644,%edx
c00017e0:	39 d0                	cmp    %edx,%eax
c00017e2:	74 7c                	je     c0001860 <check_tss_esp0.2>

c00017e4 <check_tss_esp0.1>:
c00017e4:	50                   	push   %eax
c00017e5:	52                   	push   %edx
c00017e6:	68 10 f0 00 c0       	push   $0xc000f010
c00017eb:	e8 9c fd ff ff       	call   c000158c <disp_str>
c00017f0:	83 c4 04             	add    $0x4,%esp
c00017f3:	5a                   	pop    %edx
c00017f4:	58                   	pop    %eax
c00017f5:	52                   	push   %edx
c00017f6:	50                   	push   %eax
c00017f7:	53                   	push   %ebx
c00017f8:	e8 84 66 00 00       	call   c0007e81 <disp_int>
c00017fd:	83 c4 04             	add    $0x4,%esp
c0001800:	58                   	pop    %eax
c0001801:	5a                   	pop    %edx
c0001802:	52                   	push   %edx
c0001803:	50                   	push   %eax
c0001804:	e8 78 66 00 00       	call   c0007e81 <disp_int>
c0001809:	58                   	pop    %eax
c000180a:	5a                   	pop    %edx
c000180b:	52                   	push   %edx
c000180c:	50                   	push   %eax
c000180d:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001813:	e8 69 66 00 00       	call   c0007e81 <disp_int>
c0001818:	83 c4 04             	add    $0x4,%esp
c000181b:	58                   	pop    %eax
c000181c:	5a                   	pop    %edx
c000181d:	52                   	push   %edx
c000181e:	50                   	push   %eax
c000181f:	ff 72 ec             	pushl  -0x14(%edx)
c0001822:	e8 5a 66 00 00       	call   c0007e81 <disp_int>
c0001827:	83 c4 04             	add    $0x4,%esp
c000182a:	58                   	pop    %eax
c000182b:	5a                   	pop    %edx
c000182c:	52                   	push   %edx
c000182d:	50                   	push   %eax
c000182e:	ff 70 ec             	pushl  -0x14(%eax)
c0001831:	e8 4b 66 00 00       	call   c0007e81 <disp_int>
c0001836:	83 c4 04             	add    $0x4,%esp
c0001839:	58                   	pop    %eax
c000183a:	5a                   	pop    %edx
c000183b:	52                   	push   %edx
c000183c:	50                   	push   %eax
c000183d:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001843:	e8 39 66 00 00       	call   c0007e81 <disp_int>
c0001848:	83 c4 04             	add    $0x4,%esp
c000184b:	58                   	pop    %eax
c000184c:	5a                   	pop    %edx
c000184d:	52                   	push   %edx
c000184e:	50                   	push   %eax
c000184f:	68 60 07 01 c0       	push   $0xc0010760
c0001854:	e8 28 66 00 00       	call   c0007e81 <disp_int>
c0001859:	83 c4 04             	add    $0x4,%esp
c000185c:	58                   	pop    %eax
c000185d:	5a                   	pop    %edx
c000185e:	5d                   	pop    %ebp
c000185f:	c3                   	ret    

c0001860 <check_tss_esp0.2>:
c0001860:	5d                   	pop    %ebp
c0001861:	c3                   	ret    

c0001862 <enable_8259A_casecade_irq>:
c0001862:	9c                   	pushf  
c0001863:	fa                   	cli    
c0001864:	e4 21                	in     $0x21,%al
c0001866:	24 fb                	and    $0xfb,%al
c0001868:	e6 21                	out    %al,$0x21
c000186a:	9d                   	popf   
c000186b:	c3                   	ret    

c000186c <disable_8259A_casecade_irq>:
c000186c:	9c                   	pushf  
c000186d:	fa                   	cli    
c000186e:	e4 21                	in     $0x21,%al
c0001870:	0c 04                	or     $0x4,%al
c0001872:	e6 21                	out    %al,$0x21
c0001874:	9c                   	pushf  
c0001875:	c3                   	ret    

c0001876 <enable_8259A_slave_winchester_irq>:
c0001876:	9c                   	pushf  
c0001877:	fa                   	cli    
c0001878:	e4 a1                	in     $0xa1,%al
c000187a:	24 bf                	and    $0xbf,%al
c000187c:	e6 a1                	out    %al,$0xa1
c000187e:	9d                   	popf   
c000187f:	c3                   	ret    

c0001880 <disable_8259A_slave_winchester_irq>:
c0001880:	9c                   	pushf  
c0001881:	fa                   	cli    
c0001882:	e4 a1                	in     $0xa1,%al
c0001884:	0c 40                	or     $0x40,%al
c0001886:	e6 a1                	out    %al,$0xa1
c0001888:	9d                   	popf   
c0001889:	c3                   	ret    

c000188a <update_cr3>:
c000188a:	55                   	push   %ebp
c000188b:	89 e5                	mov    %esp,%ebp
c000188d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001890:	0f 22 d8             	mov    %eax,%cr3
c0001893:	89 ec                	mov    %ebp,%esp
c0001895:	5d                   	pop    %ebp
c0001896:	c3                   	ret    

c0001897 <update_tss>:
c0001897:	55                   	push   %ebp
c0001898:	89 e5                	mov    %esp,%ebp
c000189a:	8b 45 08             	mov    0x8(%ebp),%eax
c000189d:	8b 00                	mov    (%eax),%eax
c000189f:	a3 44 16 01 c0       	mov    %eax,0xc0011644
c00018a4:	89 ec                	mov    %ebp,%esp
c00018a6:	5d                   	pop    %ebp
c00018a7:	c3                   	ret    

c00018a8 <get_running_thread_pcb>:
c00018a8:	89 e0                	mov    %esp,%eax
c00018aa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00018af:	c3                   	ret    

c00018b0 <kernel_main>:
c00018b0:	55                   	push   %ebp
c00018b1:	89 e5                	mov    %esp,%ebp
c00018b3:	83 ec 08             	sub    $0x8,%esp
c00018b6:	e8 d5 00 00 00       	call   c0001990 <init>
c00018bb:	e8 e8 ff ff ff       	call   c00018a8 <get_running_thread_pcb>
c00018c0:	a3 e0 1e 01 c0       	mov    %eax,0xc0011ee0
c00018c5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018ca:	05 00 01 00 00       	add    $0x100,%eax
c00018cf:	83 ec 08             	sub    $0x8,%esp
c00018d2:	50                   	push   %eax
c00018d3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018d8:	e8 a3 91 00 00       	call   c000aa80 <appendToDoubleLinkList>
c00018dd:	83 c4 10             	add    $0x10,%esp
c00018e0:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018e5:	05 08 01 00 00       	add    $0x108,%eax
c00018ea:	83 ec 08             	sub    $0x8,%esp
c00018ed:	50                   	push   %eax
c00018ee:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018f3:	e8 88 91 00 00       	call   c000aa80 <appendToDoubleLinkList>
c00018f8:	83 c4 10             	add    $0x10,%esp
c00018fb:	83 ec 04             	sub    $0x4,%esp
c00018fe:	68 20 ae 00 c0       	push   $0xc000ae20
c0001903:	68 27 ae 00 c0       	push   $0xc000ae27
c0001908:	68 8e 65 00 c0       	push   $0xc000658e
c000190d:	e8 c6 8e 00 00       	call   c000a7d8 <process_execute>
c0001912:	83 c4 10             	add    $0x10,%esp
c0001915:	83 ec 04             	sub    $0x4,%esp
c0001918:	68 30 ae 00 c0       	push   $0xc000ae30
c000191d:	68 38 ae 00 c0       	push   $0xc000ae38
c0001922:	68 c9 29 00 c0       	push   $0xc00029c9
c0001927:	e8 ac 8e 00 00       	call   c000a7d8 <process_execute>
c000192c:	83 c4 10             	add    $0x10,%esp
c000192f:	83 ec 04             	sub    $0x4,%esp
c0001932:	68 41 ae 00 c0       	push   $0xc000ae41
c0001937:	68 48 ae 00 c0       	push   $0xc000ae48
c000193c:	68 31 1b 00 c0       	push   $0xc0001b31
c0001941:	e8 92 8e 00 00       	call   c000a7d8 <process_execute>
c0001946:	83 c4 10             	add    $0x10,%esp
c0001949:	83 ec 04             	sub    $0x4,%esp
c000194c:	68 51 ae 00 c0       	push   $0xc000ae51
c0001951:	68 59 ae 00 c0       	push   $0xc000ae59
c0001956:	68 a3 5b 00 c0       	push   $0xc0005ba3
c000195b:	e8 78 8e 00 00       	call   c000a7d8 <process_execute>
c0001960:	83 c4 10             	add    $0x10,%esp
c0001963:	83 ec 04             	sub    $0x4,%esp
c0001966:	68 63 ae 00 c0       	push   $0xc000ae63
c000196b:	68 6d ae 00 c0       	push   $0xc000ae6d
c0001970:	68 fc 1a 00 c0       	push   $0xc0001afc
c0001975:	e8 5e 8e 00 00       	call   c000a7d8 <process_execute>
c000197a:	83 c4 10             	add    $0x10,%esp
c000197d:	83 ec 0c             	sub    $0xc,%esp
c0001980:	68 7a ae 00 c0       	push   $0xc000ae7a
c0001985:	e8 02 fc ff ff       	call   c000158c <disp_str>
c000198a:	83 c4 10             	add    $0x10,%esp
c000198d:	fb                   	sti    
c000198e:	eb fe                	jmp    c000198e <kernel_main+0xde>

c0001990 <init>:
c0001990:	55                   	push   %ebp
c0001991:	89 e5                	mov    %esp,%ebp
c0001993:	83 ec 18             	sub    $0x18,%esp
c0001996:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000199d:	00 00 00 
c00019a0:	c7 05 90 07 01 c0 00 	movl   $0x0,0xc0010790
c00019a7:	00 00 00 
c00019aa:	c7 05 fc 0d 01 c0 09 	movl   $0x9,0xc0010dfc
c00019b1:	00 00 00 
c00019b4:	83 ec 0c             	sub    $0xc,%esp
c00019b7:	68 84 ae 00 c0       	push   $0xc000ae84
c00019bc:	e8 cb fb ff ff       	call   c000158c <disp_str>
c00019c1:	83 c4 10             	add    $0x10,%esp
c00019c4:	e8 c2 6b 00 00       	call   c000858b <init_keyboard>
c00019c9:	83 ec 0c             	sub    $0xc,%esp
c00019cc:	68 00 00 00 02       	push   $0x2000000
c00019d1:	e8 f2 5f 00 00       	call   c00079c8 <init_memory>
c00019d6:	83 c4 10             	add    $0x10,%esp
c00019d9:	83 ec 0c             	sub    $0xc,%esp
c00019dc:	68 ec 0d 01 c0       	push   $0xc0010dec
c00019e1:	e8 6f 8f 00 00       	call   c000a955 <initDoubleLinkList>
c00019e6:	83 c4 10             	add    $0x10,%esp
c00019e9:	83 ec 0c             	sub    $0xc,%esp
c00019ec:	68 04 1f 01 c0       	push   $0xc0011f04
c00019f1:	e8 5f 8f 00 00       	call   c000a955 <initDoubleLinkList>
c00019f6:	83 c4 10             	add    $0x10,%esp
c00019f9:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001a00:	00 00 00 
c0001a03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a0a:	eb 14                	jmp    c0001a20 <init+0x90>
c0001a0c:	83 ec 0c             	sub    $0xc,%esp
c0001a0f:	68 8a ae 00 c0       	push   $0xc000ae8a
c0001a14:	e8 73 fb ff ff       	call   c000158c <disp_str>
c0001a19:	83 c4 10             	add    $0x10,%esp
c0001a1c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001a20:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001a27:	7e e3                	jle    c0001a0c <init+0x7c>
c0001a29:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001a30:	00 00 00 
c0001a33:	90                   	nop
c0001a34:	c9                   	leave  
c0001a35:	c3                   	ret    

c0001a36 <kernel_thread_a>:
c0001a36:	55                   	push   %ebp
c0001a37:	89 e5                	mov    %esp,%ebp
c0001a39:	83 ec 18             	sub    $0x18,%esp
c0001a3c:	83 ec 0c             	sub    $0xc,%esp
c0001a3f:	ff 75 08             	pushl  0x8(%ebp)
c0001a42:	e8 45 fb ff ff       	call   c000158c <disp_str>
c0001a47:	83 c4 10             	add    $0x10,%esp
c0001a4a:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001a4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001a52:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a5c:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c0001a61:	83 ec 0c             	sub    $0xc,%esp
c0001a64:	68 8b ae 00 c0       	push   $0xc000ae8b
c0001a69:	e8 1e fb ff ff       	call   c000158c <disp_str>
c0001a6e:	83 c4 10             	add    $0x10,%esp
c0001a71:	83 ec 0c             	sub    $0xc,%esp
c0001a74:	68 94 ae 00 c0       	push   $0xc000ae94
c0001a79:	e8 0e fb ff ff       	call   c000158c <disp_str>
c0001a7e:	83 c4 10             	add    $0x10,%esp
c0001a81:	eb d6                	jmp    c0001a59 <kernel_thread_a+0x23>

c0001a83 <kernel_thread_b>:
c0001a83:	55                   	push   %ebp
c0001a84:	89 e5                	mov    %esp,%ebp
c0001a86:	83 ec 18             	sub    $0x18,%esp
c0001a89:	83 ec 0c             	sub    $0xc,%esp
c0001a8c:	ff 75 08             	pushl  0x8(%ebp)
c0001a8f:	e8 f8 fa ff ff       	call   c000158c <disp_str>
c0001a94:	83 c4 10             	add    $0x10,%esp
c0001a97:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001a9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001a9f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001aa9:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c0001aae:	83 ec 0c             	sub    $0xc,%esp
c0001ab1:	68 96 ae 00 c0       	push   $0xc000ae96
c0001ab6:	e8 d1 fa ff ff       	call   c000158c <disp_str>
c0001abb:	83 c4 10             	add    $0x10,%esp
c0001abe:	83 ec 0c             	sub    $0xc,%esp
c0001ac1:	68 94 ae 00 c0       	push   $0xc000ae94
c0001ac6:	e8 c1 fa ff ff       	call   c000158c <disp_str>
c0001acb:	83 c4 10             	add    $0x10,%esp
c0001ace:	eb d6                	jmp    c0001aa6 <kernel_thread_b+0x23>

c0001ad0 <kernel_thread_c>:
c0001ad0:	55                   	push   %ebp
c0001ad1:	89 e5                	mov    %esp,%ebp
c0001ad3:	83 ec 08             	sub    $0x8,%esp
c0001ad6:	83 ec 0c             	sub    $0xc,%esp
c0001ad9:	ff 75 08             	pushl  0x8(%ebp)
c0001adc:	e8 ab fa ff ff       	call   c000158c <disp_str>
c0001ae1:	83 c4 10             	add    $0x10,%esp
c0001ae4:	eb fe                	jmp    c0001ae4 <kernel_thread_c+0x14>

c0001ae6 <kernel_thread_d>:
c0001ae6:	55                   	push   %ebp
c0001ae7:	89 e5                	mov    %esp,%ebp
c0001ae9:	83 ec 08             	sub    $0x8,%esp
c0001aec:	83 ec 0c             	sub    $0xc,%esp
c0001aef:	ff 75 08             	pushl  0x8(%ebp)
c0001af2:	e8 95 fa ff ff       	call   c000158c <disp_str>
c0001af7:	83 c4 10             	add    $0x10,%esp
c0001afa:	eb fe                	jmp    c0001afa <kernel_thread_d+0x14>

c0001afc <user_proc_a>:
c0001afc:	55                   	push   %ebp
c0001afd:	89 e5                	mov    %esp,%ebp
c0001aff:	83 ec 08             	sub    $0x8,%esp
c0001b02:	83 ec 0c             	sub    $0xc,%esp
c0001b05:	68 9f ae 00 c0       	push   $0xc000ae9f
c0001b0a:	e8 7d fa ff ff       	call   c000158c <disp_str>
c0001b0f:	83 c4 10             	add    $0x10,%esp
c0001b12:	e8 6c 6f 00 00       	call   c0008a83 <INIT_fork>
c0001b17:	eb fe                	jmp    c0001b17 <user_proc_a+0x1b>

c0001b19 <user_proc_b>:
c0001b19:	55                   	push   %ebp
c0001b1a:	89 e5                	mov    %esp,%ebp
c0001b1c:	83 ec 08             	sub    $0x8,%esp
c0001b1f:	83 ec 0c             	sub    $0xc,%esp
c0001b22:	68 b1 ae 00 c0       	push   $0xc000aeb1
c0001b27:	e8 60 fa ff ff       	call   c000158c <disp_str>
c0001b2c:	83 c4 10             	add    $0x10,%esp
c0001b2f:	eb fe                	jmp    c0001b2f <user_proc_b+0x16>

c0001b31 <TaskHD>:
c0001b31:	55                   	push   %ebp
c0001b32:	89 e5                	mov    %esp,%ebp
c0001b34:	83 ec 18             	sub    $0x18,%esp
c0001b37:	e8 6c fd ff ff       	call   c00018a8 <get_running_thread_pcb>
c0001b3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b3f:	e8 32 00 00 00       	call   c0001b76 <init_hd>
c0001b44:	83 ec 0c             	sub    $0xc,%esp
c0001b47:	6a 6c                	push   $0x6c
c0001b49:	e8 66 0e 00 00       	call   c00029b4 <sys_malloc>
c0001b4e:	83 c4 10             	add    $0x10,%esp
c0001b51:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b54:	83 ec 04             	sub    $0x4,%esp
c0001b57:	6a 6c                	push   $0x6c
c0001b59:	6a 00                	push   $0x0
c0001b5b:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b5e:	e8 3c 9f 00 00       	call   c000ba9f <Memset>
c0001b63:	83 c4 10             	add    $0x10,%esp
c0001b66:	83 ec 0c             	sub    $0xc,%esp
c0001b69:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b6c:	e8 1f 00 00 00       	call   c0001b90 <hd_handle>
c0001b71:	83 c4 10             	add    $0x10,%esp
c0001b74:	eb de                	jmp    c0001b54 <TaskHD+0x23>

c0001b76 <init_hd>:
c0001b76:	55                   	push   %ebp
c0001b77:	89 e5                	mov    %esp,%ebp
c0001b79:	83 ec 18             	sub    $0x18,%esp
c0001b7c:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001b83:	e8 da fc ff ff       	call   c0001862 <enable_8259A_casecade_irq>
c0001b88:	e8 e9 fc ff ff       	call   c0001876 <enable_8259A_slave_winchester_irq>
c0001b8d:	90                   	nop
c0001b8e:	c9                   	leave  
c0001b8f:	c3                   	ret    

c0001b90 <hd_handle>:
c0001b90:	55                   	push   %ebp
c0001b91:	89 e5                	mov    %esp,%ebp
c0001b93:	83 ec 18             	sub    $0x18,%esp
c0001b96:	83 ec 04             	sub    $0x4,%esp
c0001b99:	6a 12                	push   $0x12
c0001b9b:	ff 75 08             	pushl  0x8(%ebp)
c0001b9e:	6a 02                	push   $0x2
c0001ba0:	e8 41 83 00 00       	call   c0009ee6 <send_rec>
c0001ba5:	83 c4 10             	add    $0x10,%esp
c0001ba8:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bab:	8b 40 68             	mov    0x68(%eax),%eax
c0001bae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001bb1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001bb5:	0f 84 d4 00 00 00    	je     c0001c8f <hd_handle+0xff>
c0001bbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bbe:	8b 00                	mov    (%eax),%eax
c0001bc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001bc3:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001bc7:	74 28                	je     c0001bf1 <hd_handle+0x61>
c0001bc9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001bcd:	74 22                	je     c0001bf1 <hd_handle+0x61>
c0001bcf:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001bd3:	74 1c                	je     c0001bf1 <hd_handle+0x61>
c0001bd5:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001bd9:	74 16                	je     c0001bf1 <hd_handle+0x61>
c0001bdb:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001be2:	74 0d                	je     c0001bf1 <hd_handle+0x61>
c0001be4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0001beb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001bee:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001bf1:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001bf5:	74 34                	je     c0001c2b <hd_handle+0x9b>
c0001bf7:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001bfb:	74 2e                	je     c0001c2b <hd_handle+0x9b>
c0001bfd:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001c01:	74 28                	je     c0001c2b <hd_handle+0x9b>
c0001c03:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001c07:	74 22                	je     c0001c2b <hd_handle+0x9b>
c0001c09:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001c10:	74 19                	je     c0001c2b <hd_handle+0x9b>
c0001c12:	6a 6d                	push   $0x6d
c0001c14:	68 c4 ae 00 c0       	push   $0xc000aec4
c0001c19:	68 c4 ae 00 c0       	push   $0xc000aec4
c0001c1e:	68 cc ae 00 c0       	push   $0xc000aecc
c0001c23:	e8 4e 7a 00 00       	call   c0009676 <assertion_failure>
c0001c28:	83 c4 10             	add    $0x10,%esp
c0001c2b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001c2f:	74 2c                	je     c0001c5d <hd_handle+0xcd>
c0001c31:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001c35:	77 0e                	ja     c0001c45 <hd_handle+0xb5>
c0001c37:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001c3b:	74 19                	je     c0001c56 <hd_handle+0xc6>
c0001c3d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001c41:	74 1a                	je     c0001c5d <hd_handle+0xcd>
c0001c43:	eb 37                	jmp    c0001c7c <hd_handle+0xec>
c0001c45:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001c49:	74 22                	je     c0001c6d <hd_handle+0xdd>
c0001c4b:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001c52:	74 3e                	je     c0001c92 <hd_handle+0x102>
c0001c54:	eb 26                	jmp    c0001c7c <hd_handle+0xec>
c0001c56:	e8 e6 06 00 00       	call   c0002341 <hd_open>
c0001c5b:	eb 36                	jmp    c0001c93 <hd_handle+0x103>
c0001c5d:	83 ec 0c             	sub    $0xc,%esp
c0001c60:	ff 75 08             	pushl  0x8(%ebp)
c0001c63:	e8 93 08 00 00       	call   c00024fb <hd_rdwt>
c0001c68:	83 c4 10             	add    $0x10,%esp
c0001c6b:	eb 26                	jmp    c0001c93 <hd_handle+0x103>
c0001c6d:	83 ec 0c             	sub    $0xc,%esp
c0001c70:	6a 00                	push   $0x0
c0001c72:	e8 61 07 00 00       	call   c00023d8 <get_hd_ioctl>
c0001c77:	83 c4 10             	add    $0x10,%esp
c0001c7a:	eb 17                	jmp    c0001c93 <hd_handle+0x103>
c0001c7c:	83 ec 0c             	sub    $0xc,%esp
c0001c7f:	68 26 af 00 c0       	push   $0xc000af26
c0001c84:	e8 a9 79 00 00       	call   c0009632 <spin>
c0001c89:	83 c4 10             	add    $0x10,%esp
c0001c8c:	90                   	nop
c0001c8d:	eb 04                	jmp    c0001c93 <hd_handle+0x103>
c0001c8f:	90                   	nop
c0001c90:	eb 01                	jmp    c0001c93 <hd_handle+0x103>
c0001c92:	90                   	nop
c0001c93:	c9                   	leave  
c0001c94:	c3                   	ret    

c0001c95 <hd_cmd_out>:
c0001c95:	55                   	push   %ebp
c0001c96:	89 e5                	mov    %esp,%ebp
c0001c98:	83 ec 08             	sub    $0x8,%esp
c0001c9b:	83 ec 04             	sub    $0x4,%esp
c0001c9e:	68 18 73 01 00       	push   $0x17318
c0001ca3:	6a 00                	push   $0x0
c0001ca5:	68 80 00 00 00       	push   $0x80
c0001caa:	e8 1f 0b 00 00       	call   c00027ce <waitfor>
c0001caf:	83 c4 10             	add    $0x10,%esp
c0001cb2:	85 c0                	test   %eax,%eax
c0001cb4:	75 10                	jne    c0001cc6 <hd_cmd_out+0x31>
c0001cb6:	83 ec 0c             	sub    $0xc,%esp
c0001cb9:	68 38 af 00 c0       	push   $0xc000af38
c0001cbe:	e8 95 79 00 00       	call   c0009658 <panic>
c0001cc3:	83 c4 10             	add    $0x10,%esp
c0001cc6:	83 ec 08             	sub    $0x8,%esp
c0001cc9:	6a 00                	push   $0x0
c0001ccb:	68 f6 03 00 00       	push   $0x3f6
c0001cd0:	e8 d3 fa ff ff       	call   c00017a8 <out_byte>
c0001cd5:	83 c4 10             	add    $0x10,%esp
c0001cd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cdb:	0f b6 00             	movzbl (%eax),%eax
c0001cde:	0f b6 c0             	movzbl %al,%eax
c0001ce1:	83 ec 08             	sub    $0x8,%esp
c0001ce4:	50                   	push   %eax
c0001ce5:	68 f1 01 00 00       	push   $0x1f1
c0001cea:	e8 b9 fa ff ff       	call   c00017a8 <out_byte>
c0001cef:	83 c4 10             	add    $0x10,%esp
c0001cf2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cf5:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001cf9:	0f b6 c0             	movzbl %al,%eax
c0001cfc:	83 ec 08             	sub    $0x8,%esp
c0001cff:	50                   	push   %eax
c0001d00:	68 f2 01 00 00       	push   $0x1f2
c0001d05:	e8 9e fa ff ff       	call   c00017a8 <out_byte>
c0001d0a:	83 c4 10             	add    $0x10,%esp
c0001d0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d10:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001d14:	0f b6 c0             	movzbl %al,%eax
c0001d17:	83 ec 08             	sub    $0x8,%esp
c0001d1a:	50                   	push   %eax
c0001d1b:	68 f3 01 00 00       	push   $0x1f3
c0001d20:	e8 83 fa ff ff       	call   c00017a8 <out_byte>
c0001d25:	83 c4 10             	add    $0x10,%esp
c0001d28:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d2b:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001d2f:	0f b6 c0             	movzbl %al,%eax
c0001d32:	83 ec 08             	sub    $0x8,%esp
c0001d35:	50                   	push   %eax
c0001d36:	68 f4 01 00 00       	push   $0x1f4
c0001d3b:	e8 68 fa ff ff       	call   c00017a8 <out_byte>
c0001d40:	83 c4 10             	add    $0x10,%esp
c0001d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d46:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001d4a:	0f b6 c0             	movzbl %al,%eax
c0001d4d:	83 ec 08             	sub    $0x8,%esp
c0001d50:	50                   	push   %eax
c0001d51:	68 f5 01 00 00       	push   $0x1f5
c0001d56:	e8 4d fa ff ff       	call   c00017a8 <out_byte>
c0001d5b:	83 c4 10             	add    $0x10,%esp
c0001d5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d61:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001d65:	0f b6 c0             	movzbl %al,%eax
c0001d68:	83 ec 08             	sub    $0x8,%esp
c0001d6b:	50                   	push   %eax
c0001d6c:	68 f6 01 00 00       	push   $0x1f6
c0001d71:	e8 32 fa ff ff       	call   c00017a8 <out_byte>
c0001d76:	83 c4 10             	add    $0x10,%esp
c0001d79:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d7c:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001d80:	0f b6 c0             	movzbl %al,%eax
c0001d83:	83 ec 08             	sub    $0x8,%esp
c0001d86:	50                   	push   %eax
c0001d87:	68 f7 01 00 00       	push   $0x1f7
c0001d8c:	e8 17 fa ff ff       	call   c00017a8 <out_byte>
c0001d91:	83 c4 10             	add    $0x10,%esp
c0001d94:	90                   	nop
c0001d95:	c9                   	leave  
c0001d96:	c3                   	ret    

c0001d97 <hd_identify>:
c0001d97:	55                   	push   %ebp
c0001d98:	89 e5                	mov    %esp,%ebp
c0001d9a:	53                   	push   %ebx
c0001d9b:	83 ec 24             	sub    $0x24,%esp
c0001d9e:	89 e0                	mov    %esp,%eax
c0001da0:	89 c3                	mov    %eax,%ebx
c0001da2:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001da6:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001daa:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001dae:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001db2:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001db6:	8b 45 08             	mov    0x8(%ebp),%eax
c0001db9:	c1 e0 04             	shl    $0x4,%eax
c0001dbc:	83 c8 e0             	or     $0xffffffe0,%eax
c0001dbf:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001dc2:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001dc6:	83 ec 0c             	sub    $0xc,%esp
c0001dc9:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001dcc:	50                   	push   %eax
c0001dcd:	e8 c3 fe ff ff       	call   c0001c95 <hd_cmd_out>
c0001dd2:	83 c4 10             	add    $0x10,%esp
c0001dd5:	e8 d0 06 00 00       	call   c00024aa <interrupt_wait>
c0001dda:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001de1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001de4:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001de7:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001dea:	89 c2                	mov    %eax,%edx
c0001dec:	b8 10 00 00 00       	mov    $0x10,%eax
c0001df1:	83 e8 01             	sub    $0x1,%eax
c0001df4:	01 d0                	add    %edx,%eax
c0001df6:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001dfb:	ba 00 00 00 00       	mov    $0x0,%edx
c0001e00:	f7 f1                	div    %ecx
c0001e02:	6b c0 10             	imul   $0x10,%eax,%eax
c0001e05:	29 c4                	sub    %eax,%esp
c0001e07:	89 e0                	mov    %esp,%eax
c0001e09:	83 c0 00             	add    $0x0,%eax
c0001e0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e0f:	83 ec 04             	sub    $0x4,%esp
c0001e12:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e15:	6a 00                	push   $0x0
c0001e17:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e1a:	e8 80 9c 00 00       	call   c000ba9f <Memset>
c0001e1f:	83 c4 10             	add    $0x10,%esp
c0001e22:	83 ec 04             	sub    $0x4,%esp
c0001e25:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e28:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e2b:	68 f0 01 00 00       	push   $0x1f0
c0001e30:	e8 be 9c 00 00       	call   c000baf3 <read_port>
c0001e35:	83 c4 10             	add    $0x10,%esp
c0001e38:	83 ec 0c             	sub    $0xc,%esp
c0001e3b:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e3e:	e8 0b 00 00 00       	call   c0001e4e <print_hdinfo>
c0001e43:	83 c4 10             	add    $0x10,%esp
c0001e46:	89 dc                	mov    %ebx,%esp
c0001e48:	90                   	nop
c0001e49:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001e4c:	c9                   	leave  
c0001e4d:	c3                   	ret    

c0001e4e <print_hdinfo>:
c0001e4e:	55                   	push   %ebp
c0001e4f:	89 e5                	mov    %esp,%ebp
c0001e51:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001e57:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001e5d:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001e63:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001e6a:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001e71:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001e78:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001e7f:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001e86:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001e8c:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001e92:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001e99:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001ea0:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001ea7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001eae:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001eb5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001ebc:	e9 8f 00 00 00       	jmp    c0001f50 <print_hdinfo+0x102>
c0001ec1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001ec8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001ecb:	89 d0                	mov    %edx,%eax
c0001ecd:	01 c0                	add    %eax,%eax
c0001ecf:	01 d0                	add    %edx,%eax
c0001ed1:	c1 e0 03             	shl    $0x3,%eax
c0001ed4:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ed7:	01 c8                	add    %ecx,%eax
c0001ed9:	83 e8 44             	sub    $0x44,%eax
c0001edc:	0f b7 00             	movzwl (%eax),%eax
c0001edf:	0f b7 c0             	movzwl %ax,%eax
c0001ee2:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001ee5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ee8:	01 d0                	add    %edx,%eax
c0001eea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001eed:	eb 30                	jmp    c0001f1f <print_hdinfo+0xd1>
c0001eef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001ef2:	8d 50 01             	lea    0x1(%eax),%edx
c0001ef5:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001ef8:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001efb:	83 c2 01             	add    $0x1,%edx
c0001efe:	0f b6 00             	movzbl (%eax),%eax
c0001f01:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001f05:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001f08:	8d 50 01             	lea    0x1(%eax),%edx
c0001f0b:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001f0e:	0f b6 00             	movzbl (%eax),%eax
c0001f11:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001f14:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001f17:	01 ca                	add    %ecx,%edx
c0001f19:	88 02                	mov    %al,(%edx)
c0001f1b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001f1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001f22:	89 d0                	mov    %edx,%eax
c0001f24:	01 c0                	add    %eax,%eax
c0001f26:	01 d0                	add    %edx,%eax
c0001f28:	c1 e0 03             	shl    $0x3,%eax
c0001f2b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001f2e:	01 c8                	add    %ecx,%eax
c0001f30:	83 e8 42             	sub    $0x42,%eax
c0001f33:	0f b7 00             	movzwl (%eax),%eax
c0001f36:	66 d1 e8             	shr    %ax
c0001f39:	0f b7 c0             	movzwl %ax,%eax
c0001f3c:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001f3f:	7c ae                	jl     c0001eef <print_hdinfo+0xa1>
c0001f41:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001f44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001f47:	01 d0                	add    %edx,%eax
c0001f49:	c6 00 00             	movb   $0x0,(%eax)
c0001f4c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001f50:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001f54:	0f 8e 67 ff ff ff    	jle    c0001ec1 <print_hdinfo+0x73>
c0001f5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f5d:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001f61:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001f65:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001f69:	66 c1 e8 08          	shr    $0x8,%ax
c0001f6d:	66 85 c0             	test   %ax,%ax
c0001f70:	0f 95 c0             	setne  %al
c0001f73:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001f76:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001f7d:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001f83:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001f87:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001f8b:	75 15                	jne    c0001fa2 <print_hdinfo+0x154>
c0001f8d:	83 ec 08             	sub    $0x8,%esp
c0001f90:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001f93:	50                   	push   %eax
c0001f94:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f97:	50                   	push   %eax
c0001f98:	e8 21 9b 00 00       	call   c000babe <Strcpy>
c0001f9d:	83 c4 10             	add    $0x10,%esp
c0001fa0:	eb 13                	jmp    c0001fb5 <print_hdinfo+0x167>
c0001fa2:	83 ec 08             	sub    $0x8,%esp
c0001fa5:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001fa8:	50                   	push   %eax
c0001fa9:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001fac:	50                   	push   %eax
c0001fad:	e8 0c 9b 00 00       	call   c000babe <Strcpy>
c0001fb2:	83 c4 10             	add    $0x10,%esp
c0001fb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fb8:	83 c0 7a             	add    $0x7a,%eax
c0001fbb:	0f b7 00             	movzwl (%eax),%eax
c0001fbe:	0f b7 d0             	movzwl %ax,%edx
c0001fc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fc4:	83 c0 78             	add    $0x78,%eax
c0001fc7:	0f b7 00             	movzwl (%eax),%eax
c0001fca:	0f b7 c0             	movzwl %ax,%eax
c0001fcd:	83 c0 10             	add    $0x10,%eax
c0001fd0:	89 c1                	mov    %eax,%ecx
c0001fd2:	d3 e2                	shl    %cl,%edx
c0001fd4:	89 d0                	mov    %edx,%eax
c0001fd6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001fd9:	90                   	nop
c0001fda:	c9                   	leave  
c0001fdb:	c3                   	ret    

c0001fdc <print_dpt_entry>:
c0001fdc:	55                   	push   %ebp
c0001fdd:	89 e5                	mov    %esp,%ebp
c0001fdf:	83 ec 08             	sub    $0x8,%esp
c0001fe2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fe5:	8b 40 08             	mov    0x8(%eax),%eax
c0001fe8:	83 ec 08             	sub    $0x8,%esp
c0001feb:	50                   	push   %eax
c0001fec:	68 42 af 00 c0       	push   $0xc000af42
c0001ff1:	e8 23 73 00 00       	call   c0009319 <Printf>
c0001ff6:	83 c4 10             	add    $0x10,%esp
c0001ff9:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ffc:	8b 40 0c             	mov    0xc(%eax),%eax
c0001fff:	83 ec 08             	sub    $0x8,%esp
c0002002:	50                   	push   %eax
c0002003:	68 4a af 00 c0       	push   $0xc000af4a
c0002008:	e8 0c 73 00 00       	call   c0009319 <Printf>
c000200d:	83 c4 10             	add    $0x10,%esp
c0002010:	8b 45 08             	mov    0x8(%ebp),%eax
c0002013:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0002017:	0f b6 c0             	movzbl %al,%eax
c000201a:	83 ec 08             	sub    $0x8,%esp
c000201d:	50                   	push   %eax
c000201e:	68 5b af 00 c0       	push   $0xc000af5b
c0002023:	e8 f1 72 00 00       	call   c0009319 <Printf>
c0002028:	83 c4 10             	add    $0x10,%esp
c000202b:	8b 45 08             	mov    0x8(%ebp),%eax
c000202e:	0f b6 00             	movzbl (%eax),%eax
c0002031:	0f b6 c0             	movzbl %al,%eax
c0002034:	83 ec 08             	sub    $0x8,%esp
c0002037:	50                   	push   %eax
c0002038:	68 69 af 00 c0       	push   $0xc000af69
c000203d:	e8 d7 72 00 00       	call   c0009319 <Printf>
c0002042:	83 c4 10             	add    $0x10,%esp
c0002045:	90                   	nop
c0002046:	c9                   	leave  
c0002047:	c3                   	ret    

c0002048 <get_partition_table>:
c0002048:	55                   	push   %ebp
c0002049:	89 e5                	mov    %esp,%ebp
c000204b:	53                   	push   %ebx
c000204c:	83 ec 24             	sub    $0x24,%esp
c000204f:	89 e0                	mov    %esp,%eax
c0002051:	89 c3                	mov    %eax,%ebx
c0002053:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0002057:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c000205b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000205e:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0002061:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002064:	c1 f8 08             	sar    $0x8,%eax
c0002067:	88 45 e4             	mov    %al,-0x1c(%ebp)
c000206a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000206d:	c1 f8 10             	sar    $0x10,%eax
c0002070:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0002073:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002076:	c1 f8 18             	sar    $0x18,%eax
c0002079:	89 c2                	mov    %eax,%edx
c000207b:	8b 45 08             	mov    0x8(%ebp),%eax
c000207e:	c1 e0 04             	shl    $0x4,%eax
c0002081:	09 d0                	or     %edx,%eax
c0002083:	83 c8 e0             	or     $0xffffffe0,%eax
c0002086:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0002089:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c000208d:	83 ec 0c             	sub    $0xc,%esp
c0002090:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0002093:	50                   	push   %eax
c0002094:	e8 fc fb ff ff       	call   c0001c95 <hd_cmd_out>
c0002099:	83 c4 10             	add    $0x10,%esp
c000209c:	e8 09 04 00 00       	call   c00024aa <interrupt_wait>
c00020a1:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c00020a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00020ab:	8d 50 ff             	lea    -0x1(%eax),%edx
c00020ae:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00020b1:	89 c2                	mov    %eax,%edx
c00020b3:	b8 10 00 00 00       	mov    $0x10,%eax
c00020b8:	83 e8 01             	sub    $0x1,%eax
c00020bb:	01 d0                	add    %edx,%eax
c00020bd:	b9 10 00 00 00       	mov    $0x10,%ecx
c00020c2:	ba 00 00 00 00       	mov    $0x0,%edx
c00020c7:	f7 f1                	div    %ecx
c00020c9:	6b c0 10             	imul   $0x10,%eax,%eax
c00020cc:	29 c4                	sub    %eax,%esp
c00020ce:	89 e0                	mov    %esp,%eax
c00020d0:	83 c0 00             	add    $0x0,%eax
c00020d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00020d6:	83 ec 04             	sub    $0x4,%esp
c00020d9:	ff 75 f4             	pushl  -0xc(%ebp)
c00020dc:	6a 00                	push   $0x0
c00020de:	ff 75 ec             	pushl  -0x14(%ebp)
c00020e1:	e8 b9 99 00 00       	call   c000ba9f <Memset>
c00020e6:	83 c4 10             	add    $0x10,%esp
c00020e9:	83 ec 04             	sub    $0x4,%esp
c00020ec:	ff 75 f4             	pushl  -0xc(%ebp)
c00020ef:	ff 75 ec             	pushl  -0x14(%ebp)
c00020f2:	68 f0 01 00 00       	push   $0x1f0
c00020f7:	e8 f7 99 00 00       	call   c000baf3 <read_port>
c00020fc:	83 c4 10             	add    $0x10,%esp
c00020ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002102:	05 be 01 00 00       	add    $0x1be,%eax
c0002107:	83 ec 04             	sub    $0x4,%esp
c000210a:	6a 40                	push   $0x40
c000210c:	50                   	push   %eax
c000210d:	ff 75 10             	pushl  0x10(%ebp)
c0002110:	e8 89 5a 00 00       	call   c0007b9e <Memcpy>
c0002115:	83 c4 10             	add    $0x10,%esp
c0002118:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c000211f:	89 dc                	mov    %ebx,%esp
c0002121:	90                   	nop
c0002122:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0002125:	c9                   	leave  
c0002126:	c3                   	ret    

c0002127 <partition>:
c0002127:	55                   	push   %ebp
c0002128:	89 e5                	mov    %esp,%ebp
c000212a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0002130:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002133:	88 45 84             	mov    %al,-0x7c(%ebp)
c0002136:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c000213a:	7f 19                	jg     c0002155 <partition+0x2e>
c000213c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000213f:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002144:	89 c8                	mov    %ecx,%eax
c0002146:	f7 ea                	imul   %edx
c0002148:	d1 fa                	sar    %edx
c000214a:	89 c8                	mov    %ecx,%eax
c000214c:	c1 f8 1f             	sar    $0x1f,%eax
c000214f:	29 c2                	sub    %eax,%edx
c0002151:	89 d0                	mov    %edx,%eax
c0002153:	eb 11                	jmp    c0002166 <partition+0x3f>
c0002155:	8b 45 08             	mov    0x8(%ebp),%eax
c0002158:	83 e8 10             	sub    $0x10,%eax
c000215b:	8d 50 3f             	lea    0x3f(%eax),%edx
c000215e:	85 c0                	test   %eax,%eax
c0002160:	0f 48 c2             	cmovs  %edx,%eax
c0002163:	c1 f8 06             	sar    $0x6,%eax
c0002166:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002169:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c000216d:	0f 85 cc 00 00 00    	jne    c000223f <partition+0x118>
c0002173:	83 ec 04             	sub    $0x4,%esp
c0002176:	6a 40                	push   $0x40
c0002178:	6a 00                	push   $0x0
c000217a:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000217d:	50                   	push   %eax
c000217e:	e8 1c 99 00 00       	call   c000ba9f <Memset>
c0002183:	83 c4 10             	add    $0x10,%esp
c0002186:	83 ec 04             	sub    $0x4,%esp
c0002189:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000218c:	50                   	push   %eax
c000218d:	6a 00                	push   $0x0
c000218f:	ff 75 e8             	pushl  -0x18(%ebp)
c0002192:	e8 b1 fe ff ff       	call   c0002048 <get_partition_table>
c0002197:	83 c4 10             	add    $0x10,%esp
c000219a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00021a1:	e9 8a 00 00 00       	jmp    c0002230 <partition+0x109>
c00021a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021a9:	83 c0 01             	add    $0x1,%eax
c00021ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00021af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021b2:	c1 e0 04             	shl    $0x4,%eax
c00021b5:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00021b8:	01 c8                	add    %ecx,%eax
c00021ba:	83 e8 5c             	sub    $0x5c,%eax
c00021bd:	8b 00                	mov    (%eax),%eax
c00021bf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00021c2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021c5:	c1 e1 03             	shl    $0x3,%ecx
c00021c8:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021ce:	01 ca                	add    %ecx,%edx
c00021d0:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c00021d6:	89 02                	mov    %eax,(%edx)
c00021d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021db:	c1 e0 04             	shl    $0x4,%eax
c00021de:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00021e1:	01 c8                	add    %ecx,%eax
c00021e3:	83 e8 58             	sub    $0x58,%eax
c00021e6:	8b 00                	mov    (%eax),%eax
c00021e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00021eb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021ee:	c1 e1 03             	shl    $0x3,%ecx
c00021f1:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021f7:	01 ca                	add    %ecx,%edx
c00021f9:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c00021ff:	89 02                	mov    %eax,(%edx)
c0002201:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002204:	c1 e0 04             	shl    $0x4,%eax
c0002207:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000220a:	01 c8                	add    %ecx,%eax
c000220c:	83 e8 60             	sub    $0x60,%eax
c000220f:	0f b6 00             	movzbl (%eax),%eax
c0002212:	3c 05                	cmp    $0x5,%al
c0002214:	75 16                	jne    c000222c <partition+0x105>
c0002216:	8b 55 08             	mov    0x8(%ebp),%edx
c0002219:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000221c:	01 d0                	add    %edx,%eax
c000221e:	83 ec 08             	sub    $0x8,%esp
c0002221:	6a 01                	push   $0x1
c0002223:	50                   	push   %eax
c0002224:	e8 fe fe ff ff       	call   c0002127 <partition>
c0002229:	83 c4 10             	add    $0x10,%esp
c000222c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002230:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002234:	0f 8e 6c ff ff ff    	jle    c00021a6 <partition+0x7f>
c000223a:	e9 ff 00 00 00       	jmp    c000233e <partition+0x217>
c000223f:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0002243:	0f 85 f5 00 00 00    	jne    c000233e <partition+0x217>
c0002249:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000224c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002251:	89 c8                	mov    %ecx,%eax
c0002253:	f7 ea                	imul   %edx
c0002255:	d1 fa                	sar    %edx
c0002257:	89 c8                	mov    %ecx,%eax
c0002259:	c1 f8 1f             	sar    $0x1f,%eax
c000225c:	29 c2                	sub    %eax,%edx
c000225e:	89 d0                	mov    %edx,%eax
c0002260:	c1 e0 02             	shl    $0x2,%eax
c0002263:	01 d0                	add    %edx,%eax
c0002265:	29 c1                	sub    %eax,%ecx
c0002267:	89 c8                	mov    %ecx,%eax
c0002269:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000226c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000226f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002272:	c1 e2 03             	shl    $0x3,%edx
c0002275:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000227b:	01 d0                	add    %edx,%eax
c000227d:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002282:	8b 00                	mov    (%eax),%eax
c0002284:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002287:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000228a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000228d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002290:	83 e8 01             	sub    $0x1,%eax
c0002293:	c1 e0 04             	shl    $0x4,%eax
c0002296:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002299:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00022a0:	e9 8c 00 00 00       	jmp    c0002331 <partition+0x20a>
c00022a5:	83 ec 04             	sub    $0x4,%esp
c00022a8:	6a 40                	push   $0x40
c00022aa:	6a 00                	push   $0x0
c00022ac:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00022af:	50                   	push   %eax
c00022b0:	e8 ea 97 00 00       	call   c000ba9f <Memset>
c00022b5:	83 c4 10             	add    $0x10,%esp
c00022b8:	83 ec 04             	sub    $0x4,%esp
c00022bb:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00022be:	50                   	push   %eax
c00022bf:	ff 75 f0             	pushl  -0x10(%ebp)
c00022c2:	ff 75 e8             	pushl  -0x18(%ebp)
c00022c5:	e8 7e fd ff ff       	call   c0002048 <get_partition_table>
c00022ca:	83 c4 10             	add    $0x10,%esp
c00022cd:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00022d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00022d3:	01 d0                	add    %edx,%eax
c00022d5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00022d8:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00022db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00022de:	01 c2                	add    %eax,%edx
c00022e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00022e3:	8d 48 04             	lea    0x4(%eax),%ecx
c00022e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00022e9:	c1 e1 03             	shl    $0x3,%ecx
c00022ec:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022f2:	01 c8                	add    %ecx,%eax
c00022f4:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00022f9:	89 10                	mov    %edx,(%eax)
c00022fb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00022fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0002301:	8d 4a 04             	lea    0x4(%edx),%ecx
c0002304:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002307:	c1 e1 03             	shl    $0x3,%ecx
c000230a:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002310:	01 ca                	add    %ecx,%edx
c0002312:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002318:	89 02                	mov    %eax,(%edx)
c000231a:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c000231e:	84 c0                	test   %al,%al
c0002320:	74 1b                	je     c000233d <partition+0x216>
c0002322:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0002325:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002328:	01 d0                	add    %edx,%eax
c000232a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000232d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002331:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0002335:	0f 8e 6a ff ff ff    	jle    c00022a5 <partition+0x17e>
c000233b:	eb 01                	jmp    c000233e <partition+0x217>
c000233d:	90                   	nop
c000233e:	90                   	nop
c000233f:	c9                   	leave  
c0002340:	c3                   	ret    

c0002341 <hd_open>:
c0002341:	55                   	push   %ebp
c0002342:	89 e5                	mov    %esp,%ebp
c0002344:	83 ec 18             	sub    $0x18,%esp
c0002347:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000234e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002351:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002357:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c000235c:	8b 00                	mov    (%eax),%eax
c000235e:	8d 50 01             	lea    0x1(%eax),%edx
c0002361:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002364:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000236a:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c000236f:	89 10                	mov    %edx,(%eax)
c0002371:	83 ec 0c             	sub    $0xc,%esp
c0002374:	6a 00                	push   $0x0
c0002376:	e8 1c fa ff ff       	call   c0001d97 <hd_identify>
c000237b:	83 c4 10             	add    $0x10,%esp
c000237e:	83 ec 08             	sub    $0x8,%esp
c0002381:	6a 00                	push   $0x0
c0002383:	6a 00                	push   $0x0
c0002385:	e8 9d fd ff ff       	call   c0002127 <partition>
c000238a:	83 c4 10             	add    $0x10,%esp
c000238d:	83 ec 0c             	sub    $0xc,%esp
c0002390:	6a 6c                	push   $0x6c
c0002392:	e8 1d 06 00 00       	call   c00029b4 <sys_malloc>
c0002397:	83 c4 10             	add    $0x10,%esp
c000239a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000239d:	83 ec 04             	sub    $0x4,%esp
c00023a0:	6a 6c                	push   $0x6c
c00023a2:	6a 00                	push   $0x0
c00023a4:	ff 75 f0             	pushl  -0x10(%ebp)
c00023a7:	e8 f3 96 00 00       	call   c000ba9f <Memset>
c00023ac:	83 c4 10             	add    $0x10,%esp
c00023af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023b2:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00023b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023bc:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00023c3:	83 ec 04             	sub    $0x4,%esp
c00023c6:	6a 02                	push   $0x2
c00023c8:	ff 75 f0             	pushl  -0x10(%ebp)
c00023cb:	6a 01                	push   $0x1
c00023cd:	e8 14 7b 00 00       	call   c0009ee6 <send_rec>
c00023d2:	83 c4 10             	add    $0x10,%esp
c00023d5:	90                   	nop
c00023d6:	c9                   	leave  
c00023d7:	c3                   	ret    

c00023d8 <get_hd_ioctl>:
c00023d8:	55                   	push   %ebp
c00023d9:	89 e5                	mov    %esp,%ebp
c00023db:	83 ec 18             	sub    $0x18,%esp
c00023de:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00023e2:	7f 19                	jg     c00023fd <get_hd_ioctl+0x25>
c00023e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00023e7:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00023ec:	89 c8                	mov    %ecx,%eax
c00023ee:	f7 ea                	imul   %edx
c00023f0:	d1 fa                	sar    %edx
c00023f2:	89 c8                	mov    %ecx,%eax
c00023f4:	c1 f8 1f             	sar    $0x1f,%eax
c00023f7:	29 c2                	sub    %eax,%edx
c00023f9:	89 d0                	mov    %edx,%eax
c00023fb:	eb 11                	jmp    c000240e <get_hd_ioctl+0x36>
c00023fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0002400:	83 e8 10             	sub    $0x10,%eax
c0002403:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002406:	85 c0                	test   %eax,%eax
c0002408:	0f 48 c2             	cmovs  %edx,%eax
c000240b:	c1 f8 06             	sar    $0x6,%eax
c000240e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002411:	8b 55 08             	mov    0x8(%ebp),%edx
c0002414:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002417:	c1 e2 03             	shl    $0x3,%edx
c000241a:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002420:	01 d0                	add    %edx,%eax
c0002422:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0002427:	8b 00                	mov    (%eax),%eax
c0002429:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000242c:	83 ec 0c             	sub    $0xc,%esp
c000242f:	6a 6c                	push   $0x6c
c0002431:	e8 7e 05 00 00       	call   c00029b4 <sys_malloc>
c0002436:	83 c4 10             	add    $0x10,%esp
c0002439:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000243c:	83 ec 04             	sub    $0x4,%esp
c000243f:	6a 6c                	push   $0x6c
c0002441:	6a 00                	push   $0x0
c0002443:	ff 75 ec             	pushl  -0x14(%ebp)
c0002446:	e8 54 96 00 00       	call   c000ba9f <Memset>
c000244b:	83 c4 10             	add    $0x10,%esp
c000244e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002451:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002458:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000245b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0002462:	83 ec 04             	sub    $0x4,%esp
c0002465:	6a 02                	push   $0x2
c0002467:	ff 75 ec             	pushl  -0x14(%ebp)
c000246a:	6a 01                	push   $0x1
c000246c:	e8 75 7a 00 00       	call   c0009ee6 <send_rec>
c0002471:	83 c4 10             	add    $0x10,%esp
c0002474:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002477:	c9                   	leave  
c0002478:	c3                   	ret    

c0002479 <wait_for>:
c0002479:	55                   	push   %ebp
c000247a:	89 e5                	mov    %esp,%ebp
c000247c:	83 ec 08             	sub    $0x8,%esp
c000247f:	83 ec 04             	sub    $0x4,%esp
c0002482:	68 20 4e 00 00       	push   $0x4e20
c0002487:	6a 08                	push   $0x8
c0002489:	6a 08                	push   $0x8
c000248b:	e8 3e 03 00 00       	call   c00027ce <waitfor>
c0002490:	83 c4 10             	add    $0x10,%esp
c0002493:	85 c0                	test   %eax,%eax
c0002495:	75 10                	jne    c00024a7 <wait_for+0x2e>
c0002497:	83 ec 0c             	sub    $0xc,%esp
c000249a:	68 74 af 00 c0       	push   $0xc000af74
c000249f:	e8 b4 71 00 00       	call   c0009658 <panic>
c00024a4:	83 c4 10             	add    $0x10,%esp
c00024a7:	90                   	nop
c00024a8:	c9                   	leave  
c00024a9:	c3                   	ret    

c00024aa <interrupt_wait>:
c00024aa:	55                   	push   %ebp
c00024ab:	89 e5                	mov    %esp,%ebp
c00024ad:	83 ec 18             	sub    $0x18,%esp
c00024b0:	83 ec 0c             	sub    $0xc,%esp
c00024b3:	6a 6c                	push   $0x6c
c00024b5:	e8 fa 04 00 00       	call   c00029b4 <sys_malloc>
c00024ba:	83 c4 10             	add    $0x10,%esp
c00024bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024c0:	83 ec 04             	sub    $0x4,%esp
c00024c3:	6a 6c                	push   $0x6c
c00024c5:	6a 00                	push   $0x0
c00024c7:	ff 75 f4             	pushl  -0xc(%ebp)
c00024ca:	e8 d0 95 00 00       	call   c000ba9f <Memset>
c00024cf:	83 c4 10             	add    $0x10,%esp
c00024d2:	83 ec 04             	sub    $0x4,%esp
c00024d5:	68 13 02 00 00       	push   $0x213
c00024da:	ff 75 f4             	pushl  -0xc(%ebp)
c00024dd:	6a 02                	push   $0x2
c00024df:	e8 02 7a 00 00       	call   c0009ee6 <send_rec>
c00024e4:	83 c4 10             	add    $0x10,%esp
c00024e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024ea:	83 ec 08             	sub    $0x8,%esp
c00024ed:	6a 6c                	push   $0x6c
c00024ef:	50                   	push   %eax
c00024f0:	e8 82 51 00 00       	call   c0007677 <sys_free>
c00024f5:	83 c4 10             	add    $0x10,%esp
c00024f8:	90                   	nop
c00024f9:	c9                   	leave  
c00024fa:	c3                   	ret    

c00024fb <hd_rdwt>:
c00024fb:	55                   	push   %ebp
c00024fc:	89 e5                	mov    %esp,%ebp
c00024fe:	83 ec 48             	sub    $0x48,%esp
c0002501:	8b 45 08             	mov    0x8(%ebp),%eax
c0002504:	8b 40 18             	mov    0x18(%eax),%eax
c0002507:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000250a:	8b 45 08             	mov    0x8(%ebp),%eax
c000250d:	8b 40 14             	mov    0x14(%eax),%eax
c0002510:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002513:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002517:	7f 19                	jg     c0002532 <hd_rdwt+0x37>
c0002519:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c000251c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002521:	89 c8                	mov    %ecx,%eax
c0002523:	f7 ea                	imul   %edx
c0002525:	d1 fa                	sar    %edx
c0002527:	89 c8                	mov    %ecx,%eax
c0002529:	c1 f8 1f             	sar    $0x1f,%eax
c000252c:	29 c2                	sub    %eax,%edx
c000252e:	89 d0                	mov    %edx,%eax
c0002530:	eb 11                	jmp    c0002543 <hd_rdwt+0x48>
c0002532:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002535:	83 e8 10             	sub    $0x10,%eax
c0002538:	8d 50 3f             	lea    0x3f(%eax),%edx
c000253b:	85 c0                	test   %eax,%eax
c000253d:	0f 48 c2             	cmovs  %edx,%eax
c0002540:	c1 f8 06             	sar    $0x6,%eax
c0002543:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002546:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002549:	8d 50 f0             	lea    -0x10(%eax),%edx
c000254c:	89 d0                	mov    %edx,%eax
c000254e:	c1 f8 1f             	sar    $0x1f,%eax
c0002551:	c1 e8 1a             	shr    $0x1a,%eax
c0002554:	01 c2                	add    %eax,%edx
c0002556:	83 e2 3f             	and    $0x3f,%edx
c0002559:	29 c2                	sub    %eax,%edx
c000255b:	89 d0                	mov    %edx,%eax
c000255d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002560:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002563:	c1 e8 09             	shr    $0x9,%eax
c0002566:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002569:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c000256d:	7f 1a                	jg     c0002589 <hd_rdwt+0x8e>
c000256f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002572:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002575:	c1 e2 03             	shl    $0x3,%edx
c0002578:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000257e:	01 d0                	add    %edx,%eax
c0002580:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002585:	8b 00                	mov    (%eax),%eax
c0002587:	eb 1b                	jmp    c00025a4 <hd_rdwt+0xa9>
c0002589:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000258c:	8d 50 04             	lea    0x4(%eax),%edx
c000258f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002592:	c1 e2 03             	shl    $0x3,%edx
c0002595:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000259b:	01 d0                	add    %edx,%eax
c000259d:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00025a2:	8b 00                	mov    (%eax),%eax
c00025a4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00025a7:	01 d0                	add    %edx,%eax
c00025a9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00025ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00025af:	8b 40 0c             	mov    0xc(%eax),%eax
c00025b2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00025b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025b8:	05 ff 01 00 00       	add    $0x1ff,%eax
c00025bd:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00025c3:	85 c0                	test   %eax,%eax
c00025c5:	0f 48 c2             	cmovs  %edx,%eax
c00025c8:	c1 f8 09             	sar    $0x9,%eax
c00025cb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00025ce:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00025d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00025d7:	8b 40 10             	mov    0x10(%eax),%eax
c00025da:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00025dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00025e0:	8b 00                	mov    (%eax),%eax
c00025e2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00025e5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025e8:	83 ec 08             	sub    $0x8,%esp
c00025eb:	50                   	push   %eax
c00025ec:	ff 75 d0             	pushl  -0x30(%ebp)
c00025ef:	e8 f9 4a 00 00       	call   c00070ed <alloc_virtual_memory>
c00025f4:	83 c4 10             	add    $0x10,%esp
c00025f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00025fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00025fd:	8b 40 68             	mov    0x68(%eax),%eax
c0002600:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002603:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002607:	74 22                	je     c000262b <hd_rdwt+0x130>
c0002609:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000260d:	74 1c                	je     c000262b <hd_rdwt+0x130>
c000260f:	68 af 01 00 00       	push   $0x1af
c0002614:	68 c4 ae 00 c0       	push   $0xc000aec4
c0002619:	68 c4 ae 00 c0       	push   $0xc000aec4
c000261e:	68 86 af 00 c0       	push   $0xc000af86
c0002623:	e8 4e 70 00 00       	call   c0009676 <assertion_failure>
c0002628:	83 c4 10             	add    $0x10,%esp
c000262b:	c6 45 b9 00          	movb   $0x0,-0x47(%ebp)
c000262f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002632:	88 45 ba             	mov    %al,-0x46(%ebp)
c0002635:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002638:	88 45 bb             	mov    %al,-0x45(%ebp)
c000263b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000263e:	c1 f8 08             	sar    $0x8,%eax
c0002641:	88 45 bc             	mov    %al,-0x44(%ebp)
c0002644:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002647:	c1 f8 10             	sar    $0x10,%eax
c000264a:	88 45 bd             	mov    %al,-0x43(%ebp)
c000264d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002650:	c1 f8 18             	sar    $0x18,%eax
c0002653:	83 e0 0f             	and    $0xf,%eax
c0002656:	83 c8 e0             	or     $0xffffffe0,%eax
c0002659:	88 45 be             	mov    %al,-0x42(%ebp)
c000265c:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002660:	75 07                	jne    c0002669 <hd_rdwt+0x16e>
c0002662:	b8 20 00 00 00       	mov    $0x20,%eax
c0002667:	eb 05                	jmp    c000266e <hd_rdwt+0x173>
c0002669:	b8 30 00 00 00       	mov    $0x30,%eax
c000266e:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002671:	0f b6 45 bf          	movzbl -0x41(%ebp),%eax
c0002675:	3c 20                	cmp    $0x20,%al
c0002677:	74 24                	je     c000269d <hd_rdwt+0x1a2>
c0002679:	0f b6 45 bf          	movzbl -0x41(%ebp),%eax
c000267d:	3c 30                	cmp    $0x30,%al
c000267f:	74 1c                	je     c000269d <hd_rdwt+0x1a2>
c0002681:	68 bd 01 00 00       	push   $0x1bd
c0002686:	68 c4 ae 00 c0       	push   $0xc000aec4
c000268b:	68 c4 ae 00 c0       	push   $0xc000aec4
c0002690:	68 a4 af 00 c0       	push   $0xc000afa4
c0002695:	e8 dc 6f 00 00       	call   c0009676 <assertion_failure>
c000269a:	83 c4 10             	add    $0x10,%esp
c000269d:	83 ec 0c             	sub    $0xc,%esp
c00026a0:	8d 45 b9             	lea    -0x47(%ebp),%eax
c00026a3:	50                   	push   %eax
c00026a4:	e8 ec f5 ff ff       	call   c0001c95 <hd_cmd_out>
c00026a9:	83 c4 10             	add    $0x10,%esp
c00026ac:	e9 9c 00 00 00       	jmp    c000274d <hd_rdwt+0x252>
c00026b1:	b8 00 02 00 00       	mov    $0x200,%eax
c00026b6:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00026bd:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00026c1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00026c4:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00026c8:	75 51                	jne    c000271b <hd_rdwt+0x220>
c00026ca:	e8 aa fd ff ff       	call   c0002479 <wait_for>
c00026cf:	e8 d6 fd ff ff       	call   c00024aa <interrupt_wait>
c00026d4:	83 ec 04             	sub    $0x4,%esp
c00026d7:	ff 75 c4             	pushl  -0x3c(%ebp)
c00026da:	6a 00                	push   $0x0
c00026dc:	68 80 21 01 c0       	push   $0xc0012180
c00026e1:	e8 b9 93 00 00       	call   c000ba9f <Memset>
c00026e6:	83 c4 10             	add    $0x10,%esp
c00026e9:	83 ec 04             	sub    $0x4,%esp
c00026ec:	68 00 02 00 00       	push   $0x200
c00026f1:	68 80 21 01 c0       	push   $0xc0012180
c00026f6:	68 f0 01 00 00       	push   $0x1f0
c00026fb:	e8 f3 93 00 00       	call   c000baf3 <read_port>
c0002700:	83 c4 10             	add    $0x10,%esp
c0002703:	83 ec 04             	sub    $0x4,%esp
c0002706:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002709:	68 80 21 01 c0       	push   $0xc0012180
c000270e:	ff 75 f0             	pushl  -0x10(%ebp)
c0002711:	e8 88 54 00 00       	call   c0007b9e <Memcpy>
c0002716:	83 c4 10             	add    $0x10,%esp
c0002719:	eb 26                	jmp    c0002741 <hd_rdwt+0x246>
c000271b:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000271f:	75 20                	jne    c0002741 <hd_rdwt+0x246>
c0002721:	e8 53 fd ff ff       	call   c0002479 <wait_for>
c0002726:	83 ec 04             	sub    $0x4,%esp
c0002729:	ff 75 c4             	pushl  -0x3c(%ebp)
c000272c:	ff 75 f0             	pushl  -0x10(%ebp)
c000272f:	68 f0 01 00 00       	push   $0x1f0
c0002734:	e8 ce 93 00 00       	call   c000bb07 <write_port>
c0002739:	83 c4 10             	add    $0x10,%esp
c000273c:	e8 69 fd ff ff       	call   c00024aa <interrupt_wait>
c0002741:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002744:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002747:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000274a:	01 45 f0             	add    %eax,-0x10(%ebp)
c000274d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002751:	0f 85 5a ff ff ff    	jne    c00026b1 <hd_rdwt+0x1b6>
c0002757:	83 ec 0c             	sub    $0xc,%esp
c000275a:	6a 6c                	push   $0x6c
c000275c:	e8 53 02 00 00       	call   c00029b4 <sys_malloc>
c0002761:	83 c4 10             	add    $0x10,%esp
c0002764:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0002767:	83 ec 04             	sub    $0x4,%esp
c000276a:	6a 6c                	push   $0x6c
c000276c:	6a 00                	push   $0x0
c000276e:	ff 75 c0             	pushl  -0x40(%ebp)
c0002771:	e8 29 93 00 00       	call   c000ba9f <Memset>
c0002776:	83 c4 10             	add    $0x10,%esp
c0002779:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000277c:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002783:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002786:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000278d:	83 ec 04             	sub    $0x4,%esp
c0002790:	6a 02                	push   $0x2
c0002792:	ff 75 c0             	pushl  -0x40(%ebp)
c0002795:	6a 01                	push   $0x1
c0002797:	e8 4a 77 00 00       	call   c0009ee6 <send_rec>
c000279c:	83 c4 10             	add    $0x10,%esp
c000279f:	90                   	nop
c00027a0:	c9                   	leave  
c00027a1:	c3                   	ret    

c00027a2 <hd_handler>:
c00027a2:	55                   	push   %ebp
c00027a3:	89 e5                	mov    %esp,%ebp
c00027a5:	83 ec 18             	sub    $0x18,%esp
c00027a8:	83 ec 0c             	sub    $0xc,%esp
c00027ab:	68 f7 01 00 00       	push   $0x1f7
c00027b0:	e8 e7 ef ff ff       	call   c000179c <in_byte>
c00027b5:	83 c4 10             	add    $0x10,%esp
c00027b8:	0f b6 c0             	movzbl %al,%eax
c00027bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00027be:	83 ec 0c             	sub    $0xc,%esp
c00027c1:	6a 03                	push   $0x3
c00027c3:	e8 ad 79 00 00       	call   c000a175 <inform_int>
c00027c8:	83 c4 10             	add    $0x10,%esp
c00027cb:	90                   	nop
c00027cc:	c9                   	leave  
c00027cd:	c3                   	ret    

c00027ce <waitfor>:
c00027ce:	55                   	push   %ebp
c00027cf:	89 e5                	mov    %esp,%ebp
c00027d1:	83 ec 18             	sub    $0x18,%esp
c00027d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027db:	eb 26                	jmp    c0002803 <waitfor+0x35>
c00027dd:	83 ec 0c             	sub    $0xc,%esp
c00027e0:	68 f7 01 00 00       	push   $0x1f7
c00027e5:	e8 b2 ef ff ff       	call   c000179c <in_byte>
c00027ea:	83 c4 10             	add    $0x10,%esp
c00027ed:	0f b6 c0             	movzbl %al,%eax
c00027f0:	23 45 08             	and    0x8(%ebp),%eax
c00027f3:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00027f6:	75 07                	jne    c00027ff <waitfor+0x31>
c00027f8:	b8 01 00 00 00       	mov    $0x1,%eax
c00027fd:	eb 11                	jmp    c0002810 <waitfor+0x42>
c00027ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002803:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002806:	3b 45 10             	cmp    0x10(%ebp),%eax
c0002809:	7c d2                	jl     c00027dd <waitfor+0xf>
c000280b:	b8 00 00 00 00       	mov    $0x0,%eax
c0002810:	c9                   	leave  
c0002811:	c3                   	ret    

c0002812 <print_hd_info>:
c0002812:	55                   	push   %ebp
c0002813:	89 e5                	mov    %esp,%ebp
c0002815:	83 ec 18             	sub    $0x18,%esp
c0002818:	83 ec 0c             	sub    $0xc,%esp
c000281b:	68 d8 af 00 c0       	push   $0xc000afd8
c0002820:	e8 f4 6a 00 00       	call   c0009319 <Printf>
c0002825:	83 c4 10             	add    $0x10,%esp
c0002828:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000282f:	eb 3b                	jmp    c000286c <print_hd_info+0x5a>
c0002831:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002834:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000283b:	85 c0                	test   %eax,%eax
c000283d:	74 28                	je     c0002867 <print_hd_info+0x55>
c000283f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002842:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c0002849:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000284c:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c0002853:	ff 75 f4             	pushl  -0xc(%ebp)
c0002856:	52                   	push   %edx
c0002857:	50                   	push   %eax
c0002858:	68 f5 af 00 c0       	push   $0xc000aff5
c000285d:	e8 b7 6a 00 00       	call   c0009319 <Printf>
c0002862:	83 c4 10             	add    $0x10,%esp
c0002865:	eb 01                	jmp    c0002868 <print_hd_info+0x56>
c0002867:	90                   	nop
c0002868:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000286c:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002870:	7e bf                	jle    c0002831 <print_hd_info+0x1f>
c0002872:	83 ec 0c             	sub    $0xc,%esp
c0002875:	68 0d b0 00 c0       	push   $0xc000b00d
c000287a:	e8 9a 6a 00 00       	call   c0009319 <Printf>
c000287f:	83 c4 10             	add    $0x10,%esp
c0002882:	83 ec 0c             	sub    $0xc,%esp
c0002885:	68 28 b0 00 c0       	push   $0xc000b028
c000288a:	e8 8a 6a 00 00       	call   c0009319 <Printf>
c000288f:	83 c4 10             	add    $0x10,%esp
c0002892:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0002899:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00028a0:	eb 44                	jmp    c00028e6 <print_hd_info+0xd4>
c00028a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028a5:	83 c0 04             	add    $0x4,%eax
c00028a8:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00028af:	85 c0                	test   %eax,%eax
c00028b1:	74 2e                	je     c00028e1 <print_hd_info+0xcf>
c00028b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028b6:	83 c0 04             	add    $0x4,%eax
c00028b9:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00028c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028c3:	83 c0 04             	add    $0x4,%eax
c00028c6:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00028cd:	ff 75 f0             	pushl  -0x10(%ebp)
c00028d0:	52                   	push   %edx
c00028d1:	50                   	push   %eax
c00028d2:	68 f5 af 00 c0       	push   $0xc000aff5
c00028d7:	e8 3d 6a 00 00       	call   c0009319 <Printf>
c00028dc:	83 c4 10             	add    $0x10,%esp
c00028df:	eb 01                	jmp    c00028e2 <print_hd_info+0xd0>
c00028e1:	90                   	nop
c00028e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028e6:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00028ea:	7e b6                	jle    c00028a2 <print_hd_info+0x90>
c00028ec:	83 ec 0c             	sub    $0xc,%esp
c00028ef:	68 45 b0 00 c0       	push   $0xc000b045
c00028f4:	e8 20 6a 00 00       	call   c0009319 <Printf>
c00028f9:	83 c4 10             	add    $0x10,%esp
c00028fc:	90                   	nop
c00028fd:	c9                   	leave  
c00028fe:	c3                   	ret    

c00028ff <is_empty>:
c00028ff:	55                   	push   %ebp
c0002900:	89 e5                	mov    %esp,%ebp
c0002902:	83 ec 10             	sub    $0x10,%esp
c0002905:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000290c:	eb 1a                	jmp    c0002928 <is_empty+0x29>
c000290e:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0002911:	8b 45 08             	mov    0x8(%ebp),%eax
c0002914:	01 d0                	add    %edx,%eax
c0002916:	0f b6 00             	movzbl (%eax),%eax
c0002919:	84 c0                	test   %al,%al
c000291b:	74 07                	je     c0002924 <is_empty+0x25>
c000291d:	b8 00 00 00 00       	mov    $0x0,%eax
c0002922:	eb 11                	jmp    c0002935 <is_empty+0x36>
c0002924:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002928:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000292b:	3b 45 0c             	cmp    0xc(%ebp),%eax
c000292e:	7c de                	jl     c000290e <is_empty+0xf>
c0002930:	b8 01 00 00 00       	mov    $0x1,%eax
c0002935:	c9                   	leave  
c0002936:	c3                   	ret    
c0002937:	66 90                	xchg   %ax,%ax
c0002939:	66 90                	xchg   %ax,%ax
c000293b:	66 90                	xchg   %ax,%ax
c000293d:	66 90                	xchg   %ax,%ax
c000293f:	90                   	nop

c0002940 <get_ticks>:
c0002940:	b8 00 00 00 00       	mov    $0x0,%eax
c0002945:	cd 90                	int    $0x90
c0002947:	c3                   	ret    

c0002948 <write2>:
c0002948:	b8 01 00 00 00       	mov    $0x1,%eax
c000294d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002951:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002955:	cd 90                	int    $0x90
c0002957:	c3                   	ret    

c0002958 <write_debug>:
c0002958:	b8 02 00 00 00       	mov    $0x2,%eax
c000295d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002961:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002965:	cd 90                	int    $0x90
c0002967:	c3                   	ret    

c0002968 <send_msg2>:
c0002968:	b8 03 00 00 00       	mov    $0x3,%eax
c000296d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002971:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002975:	cd 90                	int    $0x90
c0002977:	c3                   	ret    

c0002978 <send_msg>:
c0002978:	55                   	push   %ebp
c0002979:	89 e5                	mov    %esp,%ebp
c000297b:	53                   	push   %ebx
c000297c:	51                   	push   %ecx
c000297d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002982:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002985:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002988:	cd 90                	int    $0x90
c000298a:	59                   	pop    %ecx
c000298b:	5b                   	pop    %ebx
c000298c:	5d                   	pop    %ebp
c000298d:	c3                   	ret    

c000298e <receive_msg2>:
c000298e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002993:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002997:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000299b:	cd 90                	int    $0x90
c000299d:	c3                   	ret    

c000299e <receive_msg>:
c000299e:	55                   	push   %ebp
c000299f:	89 e5                	mov    %esp,%ebp
c00029a1:	53                   	push   %ebx
c00029a2:	51                   	push   %ecx
c00029a3:	b8 04 00 00 00       	mov    $0x4,%eax
c00029a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00029ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00029ae:	cd 90                	int    $0x90
c00029b0:	59                   	pop    %ecx
c00029b1:	5b                   	pop    %ebx
c00029b2:	5d                   	pop    %ebp
c00029b3:	c3                   	ret    

c00029b4 <sys_malloc>:
c00029b4:	56                   	push   %esi
c00029b5:	57                   	push   %edi
c00029b6:	53                   	push   %ebx
c00029b7:	55                   	push   %ebp
c00029b8:	89 e5                	mov    %esp,%ebp
c00029ba:	b8 05 00 00 00       	mov    $0x5,%eax
c00029bf:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00029c2:	cd 90                	int    $0x90
c00029c4:	5d                   	pop    %ebp
c00029c5:	5b                   	pop    %ebx
c00029c6:	5f                   	pop    %edi
c00029c7:	5e                   	pop    %esi
c00029c8:	c3                   	ret    

c00029c9 <task_fs>:
c00029c9:	55                   	push   %ebp
c00029ca:	89 e5                	mov    %esp,%ebp
c00029cc:	83 ec 28             	sub    $0x28,%esp
c00029cf:	e8 4b 08 00 00       	call   c000321f <init_fs>
c00029d4:	83 ec 0c             	sub    $0xc,%esp
c00029d7:	6a 6c                	push   $0x6c
c00029d9:	e8 d6 ff ff ff       	call   c00029b4 <sys_malloc>
c00029de:	83 c4 10             	add    $0x10,%esp
c00029e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00029e4:	83 ec 0c             	sub    $0xc,%esp
c00029e7:	6a 6c                	push   $0x6c
c00029e9:	e8 c6 ff ff ff       	call   c00029b4 <sys_malloc>
c00029ee:	83 c4 10             	add    $0x10,%esp
c00029f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00029f4:	83 ec 04             	sub    $0x4,%esp
c00029f7:	6a 6c                	push   $0x6c
c00029f9:	6a 00                	push   $0x0
c00029fb:	ff 75 f4             	pushl  -0xc(%ebp)
c00029fe:	e8 9c 90 00 00       	call   c000ba9f <Memset>
c0002a03:	83 c4 10             	add    $0x10,%esp
c0002a06:	83 ec 04             	sub    $0x4,%esp
c0002a09:	6a 12                	push   $0x12
c0002a0b:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a0e:	6a 02                	push   $0x2
c0002a10:	e8 d1 74 00 00       	call   c0009ee6 <send_rec>
c0002a15:	83 c4 10             	add    $0x10,%esp
c0002a18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a1b:	8b 40 68             	mov    0x68(%eax),%eax
c0002a1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a24:	8b 00                	mov    (%eax),%eax
c0002a26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a2c:	8b 40 40             	mov    0x40(%eax),%eax
c0002a2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a35:	8b 40 58             	mov    0x58(%eax),%eax
c0002a38:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002a3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a3e:	8b 00                	mov    (%eax),%eax
c0002a40:	85 c0                	test   %eax,%eax
c0002a42:	75 07                	jne    c0002a4b <task_fs+0x82>
c0002a44:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0002a4b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0002a52:	83 ec 0c             	sub    $0xc,%esp
c0002a55:	ff 75 e8             	pushl  -0x18(%ebp)
c0002a58:	e8 a6 23 00 00       	call   c0004e03 <pid2proc>
c0002a5d:	83 c4 10             	add    $0x10,%esp
c0002a60:	a3 c8 0b 01 c0       	mov    %eax,0xc0010bc8
c0002a65:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002a69:	74 37                	je     c0002aa2 <task_fs+0xd9>
c0002a6b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002a6f:	74 31                	je     c0002aa2 <task_fs+0xd9>
c0002a71:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a75:	74 2b                	je     c0002aa2 <task_fs+0xd9>
c0002a77:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002a7b:	74 25                	je     c0002aa2 <task_fs+0xd9>
c0002a7d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002a81:	74 1f                	je     c0002aa2 <task_fs+0xd9>
c0002a83:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002a87:	74 19                	je     c0002aa2 <task_fs+0xd9>
c0002a89:	6a 7a                	push   $0x7a
c0002a8b:	68 64 b0 00 c0       	push   $0xc000b064
c0002a90:	68 64 b0 00 c0       	push   $0xc000b064
c0002a95:	68 74 b0 00 c0       	push   $0xc000b074
c0002a9a:	e8 d7 6b 00 00       	call   c0009676 <assertion_failure>
c0002a9f:	83 c4 10             	add    $0x10,%esp
c0002aa2:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002aa6:	74 2f                	je     c0002ad7 <task_fs+0x10e>
c0002aa8:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002aac:	7f 15                	jg     c0002ac3 <task_fs+0xfa>
c0002aae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002ab2:	0f 84 a5 00 00 00    	je     c0002b5d <task_fs+0x194>
c0002ab8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002abc:	74 64                	je     c0002b22 <task_fs+0x159>
c0002abe:	e9 88 00 00 00       	jmp    c0002b4b <task_fs+0x182>
c0002ac3:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002ac7:	74 46                	je     c0002b0f <task_fs+0x146>
c0002ac9:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002acd:	74 63                	je     c0002b32 <task_fs+0x169>
c0002acf:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002ad3:	74 3a                	je     c0002b0f <task_fs+0x146>
c0002ad5:	eb 74                	jmp    c0002b4b <task_fs+0x182>
c0002ad7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ada:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002ae1:	83 ec 0c             	sub    $0xc,%esp
c0002ae4:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ae7:	e8 88 07 00 00       	call   c0003274 <do_open>
c0002aec:	83 c4 10             	add    $0x10,%esp
c0002aef:	89 c2                	mov    %eax,%edx
c0002af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002af4:	89 50 40             	mov    %edx,0x40(%eax)
c0002af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002afa:	8b 00                	mov    (%eax),%eax
c0002afc:	83 ec 04             	sub    $0x4,%esp
c0002aff:	50                   	push   %eax
c0002b00:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b03:	6a 01                	push   $0x1
c0002b05:	e8 dc 73 00 00       	call   c0009ee6 <send_rec>
c0002b0a:	83 c4 10             	add    $0x10,%esp
c0002b0d:	eb 4f                	jmp    c0002b5e <task_fs+0x195>
c0002b0f:	83 ec 0c             	sub    $0xc,%esp
c0002b12:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b15:	e8 98 18 00 00       	call   c00043b2 <do_rdwt>
c0002b1a:	83 c4 10             	add    $0x10,%esp
c0002b1d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002b20:	eb 3c                	jmp    c0002b5e <task_fs+0x195>
c0002b22:	83 ec 0c             	sub    $0xc,%esp
c0002b25:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002b28:	e8 a9 1d 00 00       	call   c00048d6 <do_close>
c0002b2d:	83 c4 10             	add    $0x10,%esp
c0002b30:	eb 2c                	jmp    c0002b5e <task_fs+0x195>
c0002b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b35:	8b 40 58             	mov    0x58(%eax),%eax
c0002b38:	83 ec 04             	sub    $0x4,%esp
c0002b3b:	50                   	push   %eax
c0002b3c:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b3f:	6a 01                	push   $0x1
c0002b41:	e8 a0 73 00 00       	call   c0009ee6 <send_rec>
c0002b46:	83 c4 10             	add    $0x10,%esp
c0002b49:	eb 13                	jmp    c0002b5e <task_fs+0x195>
c0002b4b:	83 ec 0c             	sub    $0xc,%esp
c0002b4e:	68 d7 b0 00 c0       	push   $0xc000b0d7
c0002b53:	e8 00 6b 00 00       	call   c0009658 <panic>
c0002b58:	83 c4 10             	add    $0x10,%esp
c0002b5b:	eb 01                	jmp    c0002b5e <task_fs+0x195>
c0002b5d:	90                   	nop
c0002b5e:	e9 91 fe ff ff       	jmp    c00029f4 <task_fs+0x2b>

c0002b63 <rd_wt>:
c0002b63:	55                   	push   %ebp
c0002b64:	89 e5                	mov    %esp,%ebp
c0002b66:	83 ec 18             	sub    $0x18,%esp
c0002b69:	83 ec 0c             	sub    $0xc,%esp
c0002b6c:	6a 6c                	push   $0x6c
c0002b6e:	e8 41 fe ff ff       	call   c00029b4 <sys_malloc>
c0002b73:	83 c4 10             	add    $0x10,%esp
c0002b76:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002b79:	83 ec 04             	sub    $0x4,%esp
c0002b7c:	6a 6c                	push   $0x6c
c0002b7e:	6a 00                	push   $0x0
c0002b80:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b83:	e8 17 8f 00 00       	call   c000ba9f <Memset>
c0002b88:	83 c4 10             	add    $0x10,%esp
c0002b8b:	8b 55 18             	mov    0x18(%ebp),%edx
c0002b8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b91:	89 50 68             	mov    %edx,0x68(%eax)
c0002b94:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002b97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b9a:	89 50 14             	mov    %edx,0x14(%eax)
c0002b9d:	8b 55 10             	mov    0x10(%ebp),%edx
c0002ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ba3:	89 50 10             	mov    %edx,0x10(%eax)
c0002ba6:	8b 55 14             	mov    0x14(%ebp),%edx
c0002ba9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bac:	89 50 0c             	mov    %edx,0xc(%eax)
c0002baf:	8b 45 08             	mov    0x8(%ebp),%eax
c0002bb2:	c1 e0 09             	shl    $0x9,%eax
c0002bb5:	89 c2                	mov    %eax,%edx
c0002bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bba:	89 50 18             	mov    %edx,0x18(%eax)
c0002bbd:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002bc1:	74 22                	je     c0002be5 <rd_wt+0x82>
c0002bc3:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002bc7:	74 1c                	je     c0002be5 <rd_wt+0x82>
c0002bc9:	68 a5 00 00 00       	push   $0xa5
c0002bce:	68 64 b0 00 c0       	push   $0xc000b064
c0002bd3:	68 64 b0 00 c0       	push   $0xc000b064
c0002bd8:	68 ea b0 00 c0       	push   $0xc000b0ea
c0002bdd:	e8 94 6a 00 00       	call   c0009676 <assertion_failure>
c0002be2:	83 c4 10             	add    $0x10,%esp
c0002be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002be8:	8b 40 68             	mov    0x68(%eax),%eax
c0002beb:	83 f8 07             	cmp    $0x7,%eax
c0002bee:	74 27                	je     c0002c17 <rd_wt+0xb4>
c0002bf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bf3:	8b 40 68             	mov    0x68(%eax),%eax
c0002bf6:	83 f8 0a             	cmp    $0xa,%eax
c0002bf9:	74 1c                	je     c0002c17 <rd_wt+0xb4>
c0002bfb:	68 a6 00 00 00       	push   $0xa6
c0002c00:	68 64 b0 00 c0       	push   $0xc000b064
c0002c05:	68 64 b0 00 c0       	push   $0xc000b064
c0002c0a:	68 08 b1 00 c0       	push   $0xc000b108
c0002c0f:	e8 62 6a 00 00       	call   c0009676 <assertion_failure>
c0002c14:	83 c4 10             	add    $0x10,%esp
c0002c17:	83 ec 04             	sub    $0x4,%esp
c0002c1a:	6a 03                	push   $0x3
c0002c1c:	ff 75 f4             	pushl  -0xc(%ebp)
c0002c1f:	6a 03                	push   $0x3
c0002c21:	e8 c0 72 00 00       	call   c0009ee6 <send_rec>
c0002c26:	83 c4 10             	add    $0x10,%esp
c0002c29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c2c:	83 ec 08             	sub    $0x8,%esp
c0002c2f:	6a 6c                	push   $0x6c
c0002c31:	50                   	push   %eax
c0002c32:	e8 40 4a 00 00       	call   c0007677 <sys_free>
c0002c37:	83 c4 10             	add    $0x10,%esp
c0002c3a:	90                   	nop
c0002c3b:	c9                   	leave  
c0002c3c:	c3                   	ret    

c0002c3d <mkfs>:
c0002c3d:	55                   	push   %ebp
c0002c3e:	89 e5                	mov    %esp,%ebp
c0002c40:	57                   	push   %edi
c0002c41:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002c47:	83 ec 0c             	sub    $0xc,%esp
c0002c4a:	68 00 80 00 00       	push   $0x8000
c0002c4f:	e8 60 fd ff ff       	call   c00029b4 <sys_malloc>
c0002c54:	83 c4 10             	add    $0x10,%esp
c0002c57:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002c5c:	83 ec 0c             	sub    $0xc,%esp
c0002c5f:	6a 24                	push   $0x24
c0002c61:	e8 4e fd ff ff       	call   c00029b4 <sys_malloc>
c0002c66:	83 c4 10             	add    $0x10,%esp
c0002c69:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002c6e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c73:	83 ec 0c             	sub    $0xc,%esp
c0002c76:	50                   	push   %eax
c0002c77:	e8 38 45 00 00       	call   c00071b4 <get_physical_address>
c0002c7c:	83 c4 10             	add    $0x10,%esp
c0002c7f:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002c84:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002c89:	83 ec 0c             	sub    $0xc,%esp
c0002c8c:	50                   	push   %eax
c0002c8d:	e8 22 45 00 00       	call   c00071b4 <get_physical_address>
c0002c92:	83 c4 10             	add    $0x10,%esp
c0002c95:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002c9a:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c9f:	83 ec 04             	sub    $0x4,%esp
c0002ca2:	68 00 02 00 00       	push   $0x200
c0002ca7:	6a 00                	push   $0x0
c0002ca9:	50                   	push   %eax
c0002caa:	e8 f0 8d 00 00       	call   c000ba9f <Memset>
c0002caf:	83 c4 10             	add    $0x10,%esp
c0002cb2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002cb7:	83 ec 0c             	sub    $0xc,%esp
c0002cba:	6a 0a                	push   $0xa
c0002cbc:	68 00 02 00 00       	push   $0x200
c0002cc1:	50                   	push   %eax
c0002cc2:	6a 20                	push   $0x20
c0002cc4:	6a 00                	push   $0x0
c0002cc6:	e8 98 fe ff ff       	call   c0002b63 <rd_wt>
c0002ccb:	83 c4 20             	add    $0x20,%esp
c0002cce:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cd3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002cd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002cd9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002ce0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002ce3:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002cea:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002ced:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002cf4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002cf7:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002cfe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d01:	8b 40 04             	mov    0x4(%eax),%eax
c0002d04:	8d 50 02             	lea    0x2(%eax),%edx
c0002d07:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d0a:	8b 40 08             	mov    0x8(%eax),%eax
c0002d0d:	01 c2                	add    %eax,%edx
c0002d0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d12:	8b 40 0c             	mov    0xc(%eax),%eax
c0002d15:	01 c2                	add    %eax,%edx
c0002d17:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d1a:	89 10                	mov    %edx,(%eax)
c0002d1c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002d23:	b8 00 02 00 00       	mov    $0x200,%eax
c0002d28:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002d2b:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002d31:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002d34:	01 ca                	add    %ecx,%edx
c0002d36:	83 ec 04             	sub    $0x4,%esp
c0002d39:	50                   	push   %eax
c0002d3a:	6a 80                	push   $0xffffff80
c0002d3c:	52                   	push   %edx
c0002d3d:	e8 5d 8d 00 00       	call   c000ba9f <Memset>
c0002d42:	83 c4 10             	add    $0x10,%esp
c0002d45:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d4a:	83 ec 0c             	sub    $0xc,%esp
c0002d4d:	6a 0a                	push   $0xa
c0002d4f:	68 00 02 00 00       	push   $0x200
c0002d54:	50                   	push   %eax
c0002d55:	6a 20                	push   $0x20
c0002d57:	6a 01                	push   $0x1
c0002d59:	e8 05 fe ff ff       	call   c0002b63 <rd_wt>
c0002d5e:	83 c4 20             	add    $0x20,%esp
c0002d61:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d64:	8b 10                	mov    (%eax),%edx
c0002d66:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002d69:	8b 50 04             	mov    0x4(%eax),%edx
c0002d6c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002d6f:	8b 50 08             	mov    0x8(%eax),%edx
c0002d72:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002d75:	8b 50 0c             	mov    0xc(%eax),%edx
c0002d78:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002d7b:	8b 50 10             	mov    0x10(%eax),%edx
c0002d7e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002d81:	8b 50 14             	mov    0x14(%eax),%edx
c0002d84:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002d87:	8b 50 18             	mov    0x18(%eax),%edx
c0002d8a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002d8d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002d90:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002d93:	8b 40 20             	mov    0x20(%eax),%eax
c0002d96:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002d99:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002d9d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002da1:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002da6:	83 ec 04             	sub    $0x4,%esp
c0002da9:	6a 01                	push   $0x1
c0002dab:	52                   	push   %edx
c0002dac:	50                   	push   %eax
c0002dad:	e8 ed 8c 00 00       	call   c000ba9f <Memset>
c0002db2:	83 c4 10             	add    $0x10,%esp
c0002db5:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002dba:	83 c0 01             	add    $0x1,%eax
c0002dbd:	83 ec 04             	sub    $0x4,%esp
c0002dc0:	68 ff 01 00 00       	push   $0x1ff
c0002dc5:	6a 80                	push   $0xffffff80
c0002dc7:	50                   	push   %eax
c0002dc8:	e8 d2 8c 00 00       	call   c000ba9f <Memset>
c0002dcd:	83 c4 10             	add    $0x10,%esp
c0002dd0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002dd5:	83 ec 0c             	sub    $0xc,%esp
c0002dd8:	6a 0a                	push   $0xa
c0002dda:	68 00 02 00 00       	push   $0x200
c0002ddf:	50                   	push   %eax
c0002de0:	6a 20                	push   $0x20
c0002de2:	6a 02                	push   $0x2
c0002de4:	e8 7a fd ff ff       	call   c0002b63 <rd_wt>
c0002de9:	83 c4 20             	add    $0x20,%esp
c0002dec:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002df3:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002df8:	83 ec 04             	sub    $0x4,%esp
c0002dfb:	68 00 02 00 00       	push   $0x200
c0002e00:	6a ff                	push   $0xffffffff
c0002e02:	50                   	push   %eax
c0002e03:	e8 97 8c 00 00       	call   c000ba9f <Memset>
c0002e08:	83 c4 10             	add    $0x10,%esp
c0002e0b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e10:	83 ec 0c             	sub    $0xc,%esp
c0002e13:	6a 0a                	push   $0xa
c0002e15:	68 00 02 00 00       	push   $0x200
c0002e1a:	50                   	push   %eax
c0002e1b:	6a 20                	push   $0x20
c0002e1d:	ff 75 d0             	pushl  -0x30(%ebp)
c0002e20:	e8 3e fd ff ff       	call   c0002b63 <rd_wt>
c0002e25:	83 c4 20             	add    $0x20,%esp
c0002e28:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e2d:	83 ec 04             	sub    $0x4,%esp
c0002e30:	6a 01                	push   $0x1
c0002e32:	6a 01                	push   $0x1
c0002e34:	50                   	push   %eax
c0002e35:	e8 65 8c 00 00       	call   c000ba9f <Memset>
c0002e3a:	83 c4 10             	add    $0x10,%esp
c0002e3d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e42:	83 c0 01             	add    $0x1,%eax
c0002e45:	83 ec 04             	sub    $0x4,%esp
c0002e48:	68 ff 01 00 00       	push   $0x1ff
c0002e4d:	6a 00                	push   $0x0
c0002e4f:	50                   	push   %eax
c0002e50:	e8 4a 8c 00 00       	call   c000ba9f <Memset>
c0002e55:	83 c4 10             	add    $0x10,%esp
c0002e58:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e5d:	89 c2                	mov    %eax,%edx
c0002e5f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002e62:	83 c0 01             	add    $0x1,%eax
c0002e65:	83 ec 0c             	sub    $0xc,%esp
c0002e68:	6a 0a                	push   $0xa
c0002e6a:	68 00 02 00 00       	push   $0x200
c0002e6f:	52                   	push   %edx
c0002e70:	6a 20                	push   $0x20
c0002e72:	50                   	push   %eax
c0002e73:	e8 eb fc ff ff       	call   c0002b63 <rd_wt>
c0002e78:	83 c4 20             	add    $0x20,%esp
c0002e7b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002e7e:	83 e8 02             	sub    $0x2,%eax
c0002e81:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002e84:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002e8b:	eb 04                	jmp    c0002e91 <mkfs+0x254>
c0002e8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002e91:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002e94:	83 c0 01             	add    $0x1,%eax
c0002e97:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002e9a:	7e f1                	jle    c0002e8d <mkfs+0x250>
c0002e9c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ea1:	89 c2                	mov    %eax,%edx
c0002ea3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002ea6:	83 c0 03             	add    $0x3,%eax
c0002ea9:	83 ec 0c             	sub    $0xc,%esp
c0002eac:	6a 0a                	push   $0xa
c0002eae:	68 00 02 00 00       	push   $0x200
c0002eb3:	52                   	push   %edx
c0002eb4:	6a 20                	push   $0x20
c0002eb6:	50                   	push   %eax
c0002eb7:	e8 a7 fc ff ff       	call   c0002b63 <rd_wt>
c0002ebc:	83 c4 20             	add    $0x20,%esp
c0002ebf:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ec4:	89 c2                	mov    %eax,%edx
c0002ec6:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002ec9:	83 c0 03             	add    $0x3,%eax
c0002ecc:	83 ec 0c             	sub    $0xc,%esp
c0002ecf:	6a 07                	push   $0x7
c0002ed1:	68 00 02 00 00       	push   $0x200
c0002ed6:	52                   	push   %edx
c0002ed7:	6a 20                	push   $0x20
c0002ed9:	50                   	push   %eax
c0002eda:	e8 84 fc ff ff       	call   c0002b63 <rd_wt>
c0002edf:	83 c4 20             	add    $0x20,%esp
c0002ee2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ee7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002eea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002eed:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002ef3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ef6:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002efd:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002f00:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f03:	89 50 08             	mov    %edx,0x8(%eax)
c0002f06:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f09:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f13:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002f1a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f1d:	8b 10                	mov    (%eax),%edx
c0002f1f:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002f25:	8b 50 04             	mov    0x4(%eax),%edx
c0002f28:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002f2e:	8b 50 08             	mov    0x8(%eax),%edx
c0002f31:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002f37:	8b 50 0c             	mov    0xc(%eax),%edx
c0002f3a:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002f40:	8b 50 10             	mov    0x10(%eax),%edx
c0002f43:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002f49:	8b 50 14             	mov    0x14(%eax),%edx
c0002f4c:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002f52:	8b 50 18             	mov    0x18(%eax),%edx
c0002f55:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002f5b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002f5e:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002f64:	8b 50 20             	mov    0x20(%eax),%edx
c0002f67:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002f6d:	8b 40 24             	mov    0x24(%eax),%eax
c0002f70:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002f75:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002f7c:	eb 4c                	jmp    c0002fca <mkfs+0x38d>
c0002f7e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f83:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002f86:	83 c2 01             	add    $0x1,%edx
c0002f89:	c1 e2 05             	shl    $0x5,%edx
c0002f8c:	01 d0                	add    %edx,%eax
c0002f8e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002f91:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f94:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002f9a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f9d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002fa4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002fa7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002fae:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002fb5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002fb8:	c1 e0 08             	shl    $0x8,%eax
c0002fbb:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002fbe:	89 c2                	mov    %eax,%edx
c0002fc0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002fc3:	89 50 08             	mov    %edx,0x8(%eax)
c0002fc6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002fca:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002fce:	7e ae                	jle    c0002f7e <mkfs+0x341>
c0002fd0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002fd7:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002fdd:	b8 00 00 00 00       	mov    $0x0,%eax
c0002fe2:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002fe7:	89 d7                	mov    %edx,%edi
c0002fe9:	f3 ab                	rep stos %eax,%es:(%edi)
c0002feb:	c7 85 70 ff ff ff 30 	movl   $0xc000b130,-0x90(%ebp)
c0002ff2:	b1 00 c0 
c0002ff5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002ffc:	eb 54                	jmp    c0003052 <mkfs+0x415>
c0002ffe:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003003:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003006:	83 c2 04             	add    $0x4,%edx
c0003009:	c1 e2 05             	shl    $0x5,%edx
c000300c:	01 d0                	add    %edx,%eax
c000300e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003011:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003014:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000301a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000301d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0003024:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003027:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000302a:	83 c2 01             	add    $0x1,%edx
c000302d:	c1 e2 0b             	shl    $0xb,%edx
c0003030:	01 c2                	add    %eax,%edx
c0003032:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003035:	89 50 08             	mov    %edx,0x8(%eax)
c0003038:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000303b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0003042:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003045:	8d 50 05             	lea    0x5(%eax),%edx
c0003048:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000304b:	89 50 10             	mov    %edx,0x10(%eax)
c000304e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003052:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003055:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0003058:	7c a4                	jl     c0002ffe <mkfs+0x3c1>
c000305a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000305f:	89 c2                	mov    %eax,%edx
c0003061:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0003064:	83 c0 03             	add    $0x3,%eax
c0003067:	83 ec 0c             	sub    $0xc,%esp
c000306a:	6a 0a                	push   $0xa
c000306c:	68 00 02 00 00       	push   $0x200
c0003071:	52                   	push   %edx
c0003072:	6a 20                	push   $0x20
c0003074:	50                   	push   %eax
c0003075:	e8 e9 fa ff ff       	call   c0002b63 <rd_wt>
c000307a:	83 c4 20             	add    $0x20,%esp
c000307d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003082:	89 c2                	mov    %eax,%edx
c0003084:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003087:	83 ec 0c             	sub    $0xc,%esp
c000308a:	6a 07                	push   $0x7
c000308c:	68 00 02 00 00       	push   $0x200
c0003091:	52                   	push   %edx
c0003092:	6a 20                	push   $0x20
c0003094:	50                   	push   %eax
c0003095:	e8 c9 fa ff ff       	call   c0002b63 <rd_wt>
c000309a:	83 c4 20             	add    $0x20,%esp
c000309d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c00030a4:	00 00 00 
c00030a7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c00030ae:	2e 00 
c00030b0:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00030b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00030b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030bb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c00030c1:	83 ec 0c             	sub    $0xc,%esp
c00030c4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c00030ca:	50                   	push   %eax
c00030cb:	e8 08 8a 00 00       	call   c000bad8 <Strlen>
c00030d0:	83 c4 10             	add    $0x10,%esp
c00030d3:	89 c1                	mov    %eax,%ecx
c00030d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030d8:	8d 50 04             	lea    0x4(%eax),%edx
c00030db:	83 ec 04             	sub    $0x4,%esp
c00030de:	51                   	push   %ecx
c00030df:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c00030e5:	50                   	push   %eax
c00030e6:	52                   	push   %edx
c00030e7:	e8 b2 4a 00 00       	call   c0007b9e <Memcpy>
c00030ec:	83 c4 10             	add    $0x10,%esp
c00030ef:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c00030f5:	b8 00 00 00 00       	mov    $0x0,%eax
c00030fa:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00030ff:	89 d7                	mov    %edx,%edi
c0003101:	f3 ab                	rep stos %eax,%es:(%edi)
c0003103:	c7 85 34 ff ff ff 3c 	movl   $0xc000b13c,-0xcc(%ebp)
c000310a:	b1 00 c0 
c000310d:	c7 85 38 ff ff ff 45 	movl   $0xc000b145,-0xc8(%ebp)
c0003114:	b1 00 c0 
c0003117:	c7 85 3c ff ff ff 4e 	movl   $0xc000b14e,-0xc4(%ebp)
c000311e:	b1 00 c0 
c0003121:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0003128:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000312f:	eb 49                	jmp    c000317a <mkfs+0x53d>
c0003131:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003135:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003138:	8d 50 02             	lea    0x2(%eax),%edx
c000313b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000313e:	89 10                	mov    %edx,(%eax)
c0003140:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003143:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c000314a:	83 ec 0c             	sub    $0xc,%esp
c000314d:	50                   	push   %eax
c000314e:	e8 85 89 00 00       	call   c000bad8 <Strlen>
c0003153:	83 c4 10             	add    $0x10,%esp
c0003156:	89 c1                	mov    %eax,%ecx
c0003158:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000315b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003162:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003165:	83 c2 04             	add    $0x4,%edx
c0003168:	83 ec 04             	sub    $0x4,%esp
c000316b:	51                   	push   %ecx
c000316c:	50                   	push   %eax
c000316d:	52                   	push   %edx
c000316e:	e8 2b 4a 00 00       	call   c0007b9e <Memcpy>
c0003173:	83 c4 10             	add    $0x10,%esp
c0003176:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000317a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000317d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0003180:	7c af                	jl     c0003131 <mkfs+0x4f4>
c0003182:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003189:	eb 66                	jmp    c00031f1 <mkfs+0x5b4>
c000318b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000318e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003195:	83 ec 0c             	sub    $0xc,%esp
c0003198:	50                   	push   %eax
c0003199:	e8 3a 89 00 00       	call   c000bad8 <Strlen>
c000319e:	83 c4 10             	add    $0x10,%esp
c00031a1:	85 c0                	test   %eax,%eax
c00031a3:	74 47                	je     c00031ec <mkfs+0x5af>
c00031a5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c00031a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031ac:	8d 50 05             	lea    0x5(%eax),%edx
c00031af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031b2:	89 10                	mov    %edx,(%eax)
c00031b4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031b7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00031be:	83 ec 0c             	sub    $0xc,%esp
c00031c1:	50                   	push   %eax
c00031c2:	e8 11 89 00 00       	call   c000bad8 <Strlen>
c00031c7:	83 c4 10             	add    $0x10,%esp
c00031ca:	89 c1                	mov    %eax,%ecx
c00031cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031cf:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00031d6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00031d9:	83 c2 04             	add    $0x4,%edx
c00031dc:	83 ec 04             	sub    $0x4,%esp
c00031df:	51                   	push   %ecx
c00031e0:	50                   	push   %eax
c00031e1:	52                   	push   %edx
c00031e2:	e8 b7 49 00 00       	call   c0007b9e <Memcpy>
c00031e7:	83 c4 10             	add    $0x10,%esp
c00031ea:	eb 01                	jmp    c00031ed <mkfs+0x5b0>
c00031ec:	90                   	nop
c00031ed:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00031f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031f4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00031f7:	7c 92                	jl     c000318b <mkfs+0x54e>
c00031f9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00031fe:	89 c2                	mov    %eax,%edx
c0003200:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003203:	83 ec 0c             	sub    $0xc,%esp
c0003206:	6a 0a                	push   $0xa
c0003208:	68 00 02 00 00       	push   $0x200
c000320d:	52                   	push   %edx
c000320e:	6a 20                	push   $0x20
c0003210:	50                   	push   %eax
c0003211:	e8 4d f9 ff ff       	call   c0002b63 <rd_wt>
c0003216:	83 c4 20             	add    $0x20,%esp
c0003219:	90                   	nop
c000321a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000321d:	c9                   	leave  
c000321e:	c3                   	ret    

c000321f <init_fs>:
c000321f:	55                   	push   %ebp
c0003220:	89 e5                	mov    %esp,%ebp
c0003222:	83 ec 18             	sub    $0x18,%esp
c0003225:	83 ec 0c             	sub    $0xc,%esp
c0003228:	6a 6c                	push   $0x6c
c000322a:	e8 85 f7 ff ff       	call   c00029b4 <sys_malloc>
c000322f:	83 c4 10             	add    $0x10,%esp
c0003232:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003235:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003238:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c000323f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003242:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0003249:	83 ec 04             	sub    $0x4,%esp
c000324c:	6a 03                	push   $0x3
c000324e:	ff 75 f4             	pushl  -0xc(%ebp)
c0003251:	6a 03                	push   $0x3
c0003253:	e8 8e 6c 00 00       	call   c0009ee6 <send_rec>
c0003258:	83 c4 10             	add    $0x10,%esp
c000325b:	e8 dd f9 ff ff       	call   c0002c3d <mkfs>
c0003260:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003263:	83 ec 08             	sub    $0x8,%esp
c0003266:	6a 6c                	push   $0x6c
c0003268:	50                   	push   %eax
c0003269:	e8 09 44 00 00       	call   c0007677 <sys_free>
c000326e:	83 c4 10             	add    $0x10,%esp
c0003271:	90                   	nop
c0003272:	c9                   	leave  
c0003273:	c3                   	ret    

c0003274 <do_open>:
c0003274:	55                   	push   %ebp
c0003275:	89 e5                	mov    %esp,%ebp
c0003277:	83 ec 68             	sub    $0x68,%esp
c000327a:	83 ec 04             	sub    $0x4,%esp
c000327d:	6a 0c                	push   $0xc
c000327f:	6a 00                	push   $0x0
c0003281:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003284:	50                   	push   %eax
c0003285:	e8 15 88 00 00       	call   c000ba9f <Memset>
c000328a:	83 c4 10             	add    $0x10,%esp
c000328d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003290:	8b 40 34             	mov    0x34(%eax),%eax
c0003293:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003296:	83 ec 08             	sub    $0x8,%esp
c0003299:	6a 0c                	push   $0xc
c000329b:	ff 75 e4             	pushl  -0x1c(%ebp)
c000329e:	e8 4a 3e 00 00       	call   c00070ed <alloc_virtual_memory>
c00032a3:	83 c4 10             	add    $0x10,%esp
c00032a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00032a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00032ac:	8b 40 30             	mov    0x30(%eax),%eax
c00032af:	89 c2                	mov    %eax,%edx
c00032b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00032b4:	83 ec 04             	sub    $0x4,%esp
c00032b7:	52                   	push   %edx
c00032b8:	50                   	push   %eax
c00032b9:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00032bc:	50                   	push   %eax
c00032bd:	e8 dc 48 00 00       	call   c0007b9e <Memcpy>
c00032c2:	83 c4 10             	add    $0x10,%esp
c00032c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00032c8:	8b 40 30             	mov    0x30(%eax),%eax
c00032cb:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c00032d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00032d3:	8b 40 64             	mov    0x64(%eax),%eax
c00032d6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00032d9:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00032e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00032e7:	eb 1f                	jmp    c0003308 <do_open+0x94>
c00032e9:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00032ee:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00032f1:	83 c2 50             	add    $0x50,%edx
c00032f4:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00032f8:	85 c0                	test   %eax,%eax
c00032fa:	75 08                	jne    c0003304 <do_open+0x90>
c00032fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00032ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003302:	eb 0a                	jmp    c000330e <do_open+0x9a>
c0003304:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003308:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000330c:	7e db                	jle    c00032e9 <do_open+0x75>
c000330e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0003312:	75 1c                	jne    c0003330 <do_open+0xbc>
c0003314:	68 ba 01 00 00       	push   $0x1ba
c0003319:	68 64 b0 00 c0       	push   $0xc000b064
c000331e:	68 64 b0 00 c0       	push   $0xc000b064
c0003323:	68 57 b1 00 c0       	push   $0xc000b157
c0003328:	e8 49 63 00 00       	call   c0009676 <assertion_failure>
c000332d:	83 c4 10             	add    $0x10,%esp
c0003330:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0003337:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000333e:	eb 1d                	jmp    c000335d <do_open+0xe9>
c0003340:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003343:	c1 e0 04             	shl    $0x4,%eax
c0003346:	05 88 23 01 c0       	add    $0xc0012388,%eax
c000334b:	8b 00                	mov    (%eax),%eax
c000334d:	85 c0                	test   %eax,%eax
c000334f:	75 08                	jne    c0003359 <do_open+0xe5>
c0003351:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003354:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003357:	eb 0a                	jmp    c0003363 <do_open+0xef>
c0003359:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000335d:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0003361:	7e dd                	jle    c0003340 <do_open+0xcc>
c0003363:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0003367:	75 1c                	jne    c0003385 <do_open+0x111>
c0003369:	68 c6 01 00 00       	push   $0x1c6
c000336e:	68 64 b0 00 c0       	push   $0xc000b064
c0003373:	68 64 b0 00 c0       	push   $0xc000b064
c0003378:	68 5f b1 00 c0       	push   $0xc000b15f
c000337d:	e8 f4 62 00 00       	call   c0009676 <assertion_failure>
c0003382:	83 c4 10             	add    $0x10,%esp
c0003385:	83 ec 0c             	sub    $0xc,%esp
c0003388:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000338b:	50                   	push   %eax
c000338c:	e8 b2 00 00 00       	call   c0003443 <search_file>
c0003391:	83 c4 10             	add    $0x10,%esp
c0003394:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003397:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000339b:	75 2b                	jne    c00033c8 <do_open+0x154>
c000339d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c00033a1:	7e 10                	jle    c00033b3 <do_open+0x13f>
c00033a3:	83 ec 0c             	sub    $0xc,%esp
c00033a6:	68 67 b1 00 c0       	push   $0xc000b167
c00033ab:	e8 a8 62 00 00       	call   c0009658 <panic>
c00033b0:	83 c4 10             	add    $0x10,%esp
c00033b3:	83 ec 08             	sub    $0x8,%esp
c00033b6:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00033b9:	50                   	push   %eax
c00033ba:	8d 45 9c             	lea    -0x64(%ebp),%eax
c00033bd:	50                   	push   %eax
c00033be:	e8 40 04 00 00       	call   c0003803 <create_file>
c00033c3:	83 c4 10             	add    $0x10,%esp
c00033c6:	eb 22                	jmp    c00033ea <do_open+0x176>
c00033c8:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c00033cc:	75 07                	jne    c00033d5 <do_open+0x161>
c00033ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00033d3:	eb 6c                	jmp    c0003441 <do_open+0x1cd>
c00033d5:	83 ec 08             	sub    $0x8,%esp
c00033d8:	ff 75 d8             	pushl  -0x28(%ebp)
c00033db:	8d 45 9c             	lea    -0x64(%ebp),%eax
c00033de:	50                   	push   %eax
c00033df:	e8 5d 02 00 00       	call   c0003641 <get_inode>
c00033e4:	83 c4 10             	add    $0x10,%esp
c00033e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00033ea:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00033ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00033f2:	c1 e2 04             	shl    $0x4,%edx
c00033f5:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c00033fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00033fe:	83 c2 50             	add    $0x50,%edx
c0003401:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c0003405:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003408:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000340b:	c1 e2 04             	shl    $0x4,%edx
c000340e:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0003414:	89 02                	mov    %eax,(%edx)
c0003416:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003419:	c1 e0 04             	shl    $0x4,%eax
c000341c:	05 84 23 01 c0       	add    $0xc0012384,%eax
c0003421:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003427:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000342a:	c1 e0 04             	shl    $0x4,%eax
c000342d:	05 80 23 01 c0       	add    $0xc0012380,%eax
c0003432:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003438:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000343b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000343e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003441:	c9                   	leave  
c0003442:	c3                   	ret    

c0003443 <search_file>:
c0003443:	55                   	push   %ebp
c0003444:	89 e5                	mov    %esp,%ebp
c0003446:	83 ec 68             	sub    $0x68,%esp
c0003449:	83 ec 04             	sub    $0x4,%esp
c000344c:	6a 0c                	push   $0xc
c000344e:	6a 00                	push   $0x0
c0003450:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003453:	50                   	push   %eax
c0003454:	e8 46 86 00 00       	call   c000ba9f <Memset>
c0003459:	83 c4 10             	add    $0x10,%esp
c000345c:	83 ec 04             	sub    $0x4,%esp
c000345f:	6a 28                	push   $0x28
c0003461:	6a 00                	push   $0x0
c0003463:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003466:	50                   	push   %eax
c0003467:	e8 33 86 00 00       	call   c000ba9f <Memset>
c000346c:	83 c4 10             	add    $0x10,%esp
c000346f:	83 ec 04             	sub    $0x4,%esp
c0003472:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003475:	50                   	push   %eax
c0003476:	ff 75 08             	pushl  0x8(%ebp)
c0003479:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000347c:	50                   	push   %eax
c000347d:	e8 f3 00 00 00       	call   c0003575 <strip_path>
c0003482:	83 c4 10             	add    $0x10,%esp
c0003485:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003488:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000348c:	75 0a                	jne    c0003498 <search_file+0x55>
c000348e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003493:	e9 db 00 00 00       	jmp    c0003573 <search_file+0x130>
c0003498:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000349b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000349e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00034a1:	05 00 02 00 00       	add    $0x200,%eax
c00034a6:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00034ac:	85 c0                	test   %eax,%eax
c00034ae:	0f 48 c2             	cmovs  %edx,%eax
c00034b1:	c1 f8 09             	sar    $0x9,%eax
c00034b4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00034b7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00034ba:	c1 e8 04             	shr    $0x4,%eax
c00034bd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00034c0:	e8 63 14 00 00       	call   c0004928 <get_super_block>
c00034c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00034c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00034cb:	8b 00                	mov    (%eax),%eax
c00034cd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00034d0:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c00034d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00034de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00034e5:	eb 7b                	jmp    c0003562 <search_file+0x11f>
c00034e7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00034ec:	89 c1                	mov    %eax,%ecx
c00034ee:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00034f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034f4:	01 d0                	add    %edx,%eax
c00034f6:	83 ec 0c             	sub    $0xc,%esp
c00034f9:	6a 07                	push   $0x7
c00034fb:	68 00 02 00 00       	push   $0x200
c0003500:	51                   	push   %ecx
c0003501:	ff 75 cc             	pushl  -0x34(%ebp)
c0003504:	50                   	push   %eax
c0003505:	e8 59 f6 ff ff       	call   c0002b63 <rd_wt>
c000350a:	83 c4 20             	add    $0x20,%esp
c000350d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003512:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003515:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000351c:	eb 35                	jmp    c0003553 <search_file+0x110>
c000351e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003522:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003525:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003528:	7f 33                	jg     c000355d <search_file+0x11a>
c000352a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000352d:	83 c0 04             	add    $0x4,%eax
c0003530:	83 ec 08             	sub    $0x8,%esp
c0003533:	50                   	push   %eax
c0003534:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003537:	50                   	push   %eax
c0003538:	e8 05 6d 00 00       	call   c000a242 <strcmp>
c000353d:	83 c4 10             	add    $0x10,%esp
c0003540:	85 c0                	test   %eax,%eax
c0003542:	75 07                	jne    c000354b <search_file+0x108>
c0003544:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003547:	8b 00                	mov    (%eax),%eax
c0003549:	eb 28                	jmp    c0003573 <search_file+0x130>
c000354b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000354f:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003553:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003556:	83 f8 1f             	cmp    $0x1f,%eax
c0003559:	76 c3                	jbe    c000351e <search_file+0xdb>
c000355b:	eb 01                	jmp    c000355e <search_file+0x11b>
c000355d:	90                   	nop
c000355e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003562:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003565:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003568:	0f 8c 79 ff ff ff    	jl     c00034e7 <search_file+0xa4>
c000356e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003573:	c9                   	leave  
c0003574:	c3                   	ret    

c0003575 <strip_path>:
c0003575:	55                   	push   %ebp
c0003576:	89 e5                	mov    %esp,%ebp
c0003578:	83 ec 10             	sub    $0x10,%esp
c000357b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000357f:	75 0a                	jne    c000358b <strip_path+0x16>
c0003581:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003586:	e9 b4 00 00 00       	jmp    c000363f <strip_path+0xca>
c000358b:	8b 45 08             	mov    0x8(%ebp),%eax
c000358e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003591:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003594:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003597:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000359a:	0f b6 00             	movzbl (%eax),%eax
c000359d:	3c 2f                	cmp    $0x2f,%al
c000359f:	75 2d                	jne    c00035ce <strip_path+0x59>
c00035a1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00035a5:	eb 27                	jmp    c00035ce <strip_path+0x59>
c00035a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035aa:	0f b6 00             	movzbl (%eax),%eax
c00035ad:	3c 2f                	cmp    $0x2f,%al
c00035af:	75 0a                	jne    c00035bb <strip_path+0x46>
c00035b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035b6:	e9 84 00 00 00       	jmp    c000363f <strip_path+0xca>
c00035bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035be:	0f b6 10             	movzbl (%eax),%edx
c00035c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00035c4:	88 10                	mov    %dl,(%eax)
c00035c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00035ca:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00035ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035d1:	0f b6 00             	movzbl (%eax),%eax
c00035d4:	84 c0                	test   %al,%al
c00035d6:	75 cf                	jne    c00035a7 <strip_path+0x32>
c00035d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00035db:	c6 00 00             	movb   $0x0,(%eax)
c00035de:	8b 45 10             	mov    0x10(%ebp),%eax
c00035e1:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c00035e7:	89 10                	mov    %edx,(%eax)
c00035e9:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00035ef:	89 50 04             	mov    %edx,0x4(%eax)
c00035f2:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c00035f8:	89 50 08             	mov    %edx,0x8(%eax)
c00035fb:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c0003601:	89 50 0c             	mov    %edx,0xc(%eax)
c0003604:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c000360a:	89 50 10             	mov    %edx,0x10(%eax)
c000360d:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c0003613:	89 50 14             	mov    %edx,0x14(%eax)
c0003616:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c000361c:	89 50 18             	mov    %edx,0x18(%eax)
c000361f:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c0003625:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003628:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c000362e:	89 50 20             	mov    %edx,0x20(%eax)
c0003631:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003637:	89 50 24             	mov    %edx,0x24(%eax)
c000363a:	b8 00 00 00 00       	mov    $0x0,%eax
c000363f:	c9                   	leave  
c0003640:	c3                   	ret    

c0003641 <get_inode>:
c0003641:	55                   	push   %ebp
c0003642:	89 e5                	mov    %esp,%ebp
c0003644:	56                   	push   %esi
c0003645:	53                   	push   %ebx
c0003646:	83 ec 20             	sub    $0x20,%esp
c0003649:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000364d:	75 0a                	jne    c0003659 <get_inode+0x18>
c000364f:	b8 00 00 00 00       	mov    $0x0,%eax
c0003654:	e9 a3 01 00 00       	jmp    c00037fc <get_inode+0x1bb>
c0003659:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003660:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c0003667:	eb 69                	jmp    c00036d2 <get_inode+0x91>
c0003669:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000366c:	8b 40 24             	mov    0x24(%eax),%eax
c000366f:	85 c0                	test   %eax,%eax
c0003671:	7e 53                	jle    c00036c6 <get_inode+0x85>
c0003673:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003676:	8b 40 10             	mov    0x10(%eax),%eax
c0003679:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000367c:	75 50                	jne    c00036ce <get_inode+0x8d>
c000367e:	8b 45 08             	mov    0x8(%ebp),%eax
c0003681:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003684:	8b 0a                	mov    (%edx),%ecx
c0003686:	89 08                	mov    %ecx,(%eax)
c0003688:	8b 4a 04             	mov    0x4(%edx),%ecx
c000368b:	89 48 04             	mov    %ecx,0x4(%eax)
c000368e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003691:	89 48 08             	mov    %ecx,0x8(%eax)
c0003694:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003697:	89 48 0c             	mov    %ecx,0xc(%eax)
c000369a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000369d:	89 48 10             	mov    %ecx,0x10(%eax)
c00036a0:	8b 4a 14             	mov    0x14(%edx),%ecx
c00036a3:	89 48 14             	mov    %ecx,0x14(%eax)
c00036a6:	8b 4a 18             	mov    0x18(%edx),%ecx
c00036a9:	89 48 18             	mov    %ecx,0x18(%eax)
c00036ac:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00036af:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00036b2:	8b 4a 20             	mov    0x20(%edx),%ecx
c00036b5:	89 48 20             	mov    %ecx,0x20(%eax)
c00036b8:	8b 52 24             	mov    0x24(%edx),%edx
c00036bb:	89 50 24             	mov    %edx,0x24(%eax)
c00036be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036c1:	e9 36 01 00 00       	jmp    c00037fc <get_inode+0x1bb>
c00036c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00036cc:	eb 0d                	jmp    c00036db <get_inode+0x9a>
c00036ce:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c00036d2:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c00036d9:	76 8e                	jbe    c0003669 <get_inode+0x28>
c00036db:	e8 48 12 00 00       	call   c0004928 <get_super_block>
c00036e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00036e3:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00036ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036ed:	8b 40 04             	mov    0x4(%eax),%eax
c00036f0:	8d 50 02             	lea    0x2(%eax),%edx
c00036f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036f6:	8b 40 08             	mov    0x8(%eax),%eax
c00036f9:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00036fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00036ff:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003702:	b8 00 02 00 00       	mov    $0x200,%eax
c0003707:	99                   	cltd   
c0003708:	f7 7d e8             	idivl  -0x18(%ebp)
c000370b:	89 c6                	mov    %eax,%esi
c000370d:	89 c8                	mov    %ecx,%eax
c000370f:	99                   	cltd   
c0003710:	f7 fe                	idiv   %esi
c0003712:	01 d8                	add    %ebx,%eax
c0003714:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003717:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000371e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003723:	83 ec 0c             	sub    $0xc,%esp
c0003726:	6a 07                	push   $0x7
c0003728:	68 00 02 00 00       	push   $0x200
c000372d:	50                   	push   %eax
c000372e:	ff 75 e0             	pushl  -0x20(%ebp)
c0003731:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003734:	e8 2a f4 ff ff       	call   c0002b63 <rd_wt>
c0003739:	83 c4 20             	add    $0x20,%esp
c000373c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000373f:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003742:	b8 00 02 00 00       	mov    $0x200,%eax
c0003747:	99                   	cltd   
c0003748:	f7 7d e8             	idivl  -0x18(%ebp)
c000374b:	89 c3                	mov    %eax,%ebx
c000374d:	89 c8                	mov    %ecx,%eax
c000374f:	99                   	cltd   
c0003750:	f7 fb                	idiv   %ebx
c0003752:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003755:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000375b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000375e:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003762:	01 d0                	add    %edx,%eax
c0003764:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003767:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000376a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000376d:	8b 0a                	mov    (%edx),%ecx
c000376f:	89 08                	mov    %ecx,(%eax)
c0003771:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003774:	89 48 04             	mov    %ecx,0x4(%eax)
c0003777:	8b 4a 08             	mov    0x8(%edx),%ecx
c000377a:	89 48 08             	mov    %ecx,0x8(%eax)
c000377d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003780:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003783:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003786:	89 48 10             	mov    %ecx,0x10(%eax)
c0003789:	8b 4a 14             	mov    0x14(%edx),%ecx
c000378c:	89 48 14             	mov    %ecx,0x14(%eax)
c000378f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003792:	89 48 18             	mov    %ecx,0x18(%eax)
c0003795:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003798:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000379b:	8b 4a 20             	mov    0x20(%edx),%ecx
c000379e:	89 48 20             	mov    %ecx,0x20(%eax)
c00037a1:	8b 52 24             	mov    0x24(%edx),%edx
c00037a4:	89 50 24             	mov    %edx,0x24(%eax)
c00037a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037aa:	8b 55 0c             	mov    0xc(%ebp),%edx
c00037ad:	89 50 10             	mov    %edx,0x10(%eax)
c00037b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037b3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00037b6:	89 50 20             	mov    %edx,0x20(%eax)
c00037b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00037bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00037bf:	8b 0a                	mov    (%edx),%ecx
c00037c1:	89 08                	mov    %ecx,(%eax)
c00037c3:	8b 4a 04             	mov    0x4(%edx),%ecx
c00037c6:	89 48 04             	mov    %ecx,0x4(%eax)
c00037c9:	8b 4a 08             	mov    0x8(%edx),%ecx
c00037cc:	89 48 08             	mov    %ecx,0x8(%eax)
c00037cf:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00037d2:	89 48 0c             	mov    %ecx,0xc(%eax)
c00037d5:	8b 4a 10             	mov    0x10(%edx),%ecx
c00037d8:	89 48 10             	mov    %ecx,0x10(%eax)
c00037db:	8b 4a 14             	mov    0x14(%edx),%ecx
c00037de:	89 48 14             	mov    %ecx,0x14(%eax)
c00037e1:	8b 4a 18             	mov    0x18(%edx),%ecx
c00037e4:	89 48 18             	mov    %ecx,0x18(%eax)
c00037e7:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00037ea:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00037ed:	8b 4a 20             	mov    0x20(%edx),%ecx
c00037f0:	89 48 20             	mov    %ecx,0x20(%eax)
c00037f3:	8b 52 24             	mov    0x24(%edx),%edx
c00037f6:	89 50 24             	mov    %edx,0x24(%eax)
c00037f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00037fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00037ff:	5b                   	pop    %ebx
c0003800:	5e                   	pop    %esi
c0003801:	5d                   	pop    %ebp
c0003802:	c3                   	ret    

c0003803 <create_file>:
c0003803:	55                   	push   %ebp
c0003804:	89 e5                	mov    %esp,%ebp
c0003806:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000380c:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000380f:	50                   	push   %eax
c0003810:	ff 75 0c             	pushl  0xc(%ebp)
c0003813:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003816:	50                   	push   %eax
c0003817:	e8 59 fd ff ff       	call   c0003575 <strip_path>
c000381c:	83 c4 0c             	add    $0xc,%esp
c000381f:	83 f8 ff             	cmp    $0xffffffff,%eax
c0003822:	75 0a                	jne    c000382e <create_file+0x2b>
c0003824:	b8 00 00 00 00       	mov    $0x0,%eax
c0003829:	e9 de 00 00 00       	jmp    c000390c <create_file+0x109>
c000382e:	e8 db 00 00 00       	call   c000390e <alloc_imap_bit>
c0003833:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003836:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000383a:	75 0a                	jne    c0003846 <create_file+0x43>
c000383c:	b8 00 00 00 00       	mov    $0x0,%eax
c0003841:	e9 c6 00 00 00       	jmp    c000390c <create_file+0x109>
c0003846:	e8 dd 10 00 00       	call   c0004928 <get_super_block>
c000384b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000384e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003851:	8b 40 10             	mov    0x10(%eax),%eax
c0003854:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003857:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000385a:	83 ec 08             	sub    $0x8,%esp
c000385d:	50                   	push   %eax
c000385e:	ff 75 f4             	pushl  -0xc(%ebp)
c0003861:	e8 a5 01 00 00       	call   c0003a0b <alloc_smap_bit>
c0003866:	83 c4 10             	add    $0x10,%esp
c0003869:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000386c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003870:	75 0a                	jne    c000387c <create_file+0x79>
c0003872:	b8 00 00 00 00       	mov    $0x0,%eax
c0003877:	e9 90 00 00 00       	jmp    c000390c <create_file+0x109>
c000387c:	83 ec 04             	sub    $0x4,%esp
c000387f:	ff 75 e8             	pushl  -0x18(%ebp)
c0003882:	ff 75 f4             	pushl  -0xc(%ebp)
c0003885:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003888:	50                   	push   %eax
c0003889:	e8 1e 03 00 00       	call   c0003bac <new_inode>
c000388e:	83 c4 10             	add    $0x10,%esp
c0003891:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003894:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003898:	75 07                	jne    c00038a1 <create_file+0x9e>
c000389a:	b8 00 00 00 00       	mov    $0x0,%eax
c000389f:	eb 6b                	jmp    c000390c <create_file+0x109>
c00038a1:	ff 75 f4             	pushl  -0xc(%ebp)
c00038a4:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00038a7:	50                   	push   %eax
c00038a8:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00038ab:	50                   	push   %eax
c00038ac:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c00038b2:	50                   	push   %eax
c00038b3:	e8 12 04 00 00       	call   c0003cca <new_dir_entry>
c00038b8:	83 c4 10             	add    $0x10,%esp
c00038bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00038be:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00038c2:	75 07                	jne    c00038cb <create_file+0xc8>
c00038c4:	b8 00 00 00 00       	mov    $0x0,%eax
c00038c9:	eb 41                	jmp    c000390c <create_file+0x109>
c00038cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00038ce:	8b 55 84             	mov    -0x7c(%ebp),%edx
c00038d1:	89 10                	mov    %edx,(%eax)
c00038d3:	8b 55 88             	mov    -0x78(%ebp),%edx
c00038d6:	89 50 04             	mov    %edx,0x4(%eax)
c00038d9:	8b 55 8c             	mov    -0x74(%ebp),%edx
c00038dc:	89 50 08             	mov    %edx,0x8(%eax)
c00038df:	8b 55 90             	mov    -0x70(%ebp),%edx
c00038e2:	89 50 0c             	mov    %edx,0xc(%eax)
c00038e5:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00038e8:	89 50 10             	mov    %edx,0x10(%eax)
c00038eb:	8b 55 98             	mov    -0x68(%ebp),%edx
c00038ee:	89 50 14             	mov    %edx,0x14(%eax)
c00038f1:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00038f4:	89 50 18             	mov    %edx,0x18(%eax)
c00038f7:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00038fa:	89 50 1c             	mov    %edx,0x1c(%eax)
c00038fd:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0003900:	89 50 20             	mov    %edx,0x20(%eax)
c0003903:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003906:	89 50 24             	mov    %edx,0x24(%eax)
c0003909:	8b 45 08             	mov    0x8(%ebp),%eax
c000390c:	c9                   	leave  
c000390d:	c3                   	ret    

c000390e <alloc_imap_bit>:
c000390e:	55                   	push   %ebp
c000390f:	89 e5                	mov    %esp,%ebp
c0003911:	53                   	push   %ebx
c0003912:	83 ec 24             	sub    $0x24,%esp
c0003915:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000391c:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003923:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003928:	83 ec 0c             	sub    $0xc,%esp
c000392b:	6a 07                	push   $0x7
c000392d:	68 00 02 00 00       	push   $0x200
c0003932:	50                   	push   %eax
c0003933:	ff 75 e8             	pushl  -0x18(%ebp)
c0003936:	ff 75 ec             	pushl  -0x14(%ebp)
c0003939:	e8 25 f2 ff ff       	call   c0002b63 <rd_wt>
c000393e:	83 c4 20             	add    $0x20,%esp
c0003941:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003948:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000394f:	e9 a5 00 00 00       	jmp    c00039f9 <alloc_imap_bit+0xeb>
c0003954:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000395b:	e9 8b 00 00 00       	jmp    c00039eb <alloc_imap_bit+0xdd>
c0003960:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003966:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003969:	01 d0                	add    %edx,%eax
c000396b:	0f b6 00             	movzbl (%eax),%eax
c000396e:	0f be d0             	movsbl %al,%edx
c0003971:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003974:	89 c1                	mov    %eax,%ecx
c0003976:	d3 fa                	sar    %cl,%edx
c0003978:	89 d0                	mov    %edx,%eax
c000397a:	83 e0 01             	and    $0x1,%eax
c000397d:	85 c0                	test   %eax,%eax
c000397f:	74 06                	je     c0003987 <alloc_imap_bit+0x79>
c0003981:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003985:	eb 64                	jmp    c00039eb <alloc_imap_bit+0xdd>
c0003987:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000398d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003990:	01 d0                	add    %edx,%eax
c0003992:	0f b6 18             	movzbl (%eax),%ebx
c0003995:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003998:	ba 01 00 00 00       	mov    $0x1,%edx
c000399d:	89 c1                	mov    %eax,%ecx
c000399f:	d3 e2                	shl    %cl,%edx
c00039a1:	89 d0                	mov    %edx,%eax
c00039a3:	89 c1                	mov    %eax,%ecx
c00039a5:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039ae:	01 d0                	add    %edx,%eax
c00039b0:	09 cb                	or     %ecx,%ebx
c00039b2:	89 da                	mov    %ebx,%edx
c00039b4:	88 10                	mov    %dl,(%eax)
c00039b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039b9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00039c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039c3:	01 d0                	add    %edx,%eax
c00039c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00039c8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00039cd:	83 ec 0c             	sub    $0xc,%esp
c00039d0:	6a 0a                	push   $0xa
c00039d2:	68 00 02 00 00       	push   $0x200
c00039d7:	50                   	push   %eax
c00039d8:	ff 75 e8             	pushl  -0x18(%ebp)
c00039db:	ff 75 ec             	pushl  -0x14(%ebp)
c00039de:	e8 80 f1 ff ff       	call   c0002b63 <rd_wt>
c00039e3:	83 c4 20             	add    $0x20,%esp
c00039e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00039e9:	eb 1b                	jmp    c0003a06 <alloc_imap_bit+0xf8>
c00039eb:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c00039ef:	0f 8e 6b ff ff ff    	jle    c0003960 <alloc_imap_bit+0x52>
c00039f5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00039f9:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0003a00:	0f 8e 4e ff ff ff    	jle    c0003954 <alloc_imap_bit+0x46>
c0003a06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a09:	c9                   	leave  
c0003a0a:	c3                   	ret    

c0003a0b <alloc_smap_bit>:
c0003a0b:	55                   	push   %ebp
c0003a0c:	89 e5                	mov    %esp,%ebp
c0003a0e:	53                   	push   %ebx
c0003a0f:	83 ec 34             	sub    $0x34,%esp
c0003a12:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a16:	75 1c                	jne    c0003a34 <alloc_smap_bit+0x29>
c0003a18:	68 f0 02 00 00       	push   $0x2f0
c0003a1d:	68 64 b0 00 c0       	push   $0xc000b064
c0003a22:	68 64 b0 00 c0       	push   $0xc000b064
c0003a27:	68 74 b1 00 c0       	push   $0xc000b174
c0003a2c:	e8 45 5c 00 00       	call   c0009676 <assertion_failure>
c0003a31:	83 c4 10             	add    $0x10,%esp
c0003a34:	e8 ef 0e 00 00       	call   c0004928 <get_super_block>
c0003a39:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003a3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a3f:	8b 40 08             	mov    0x8(%eax),%eax
c0003a42:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003a45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a48:	8b 40 04             	mov    0x4(%eax),%eax
c0003a4b:	83 c0 02             	add    $0x2,%eax
c0003a4e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003a51:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003a58:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0003a5f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003a66:	e9 20 01 00 00       	jmp    c0003b8b <alloc_smap_bit+0x180>
c0003a6b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003a6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a71:	01 d0                	add    %edx,%eax
c0003a73:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003a76:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003a7b:	83 ec 0c             	sub    $0xc,%esp
c0003a7e:	6a 07                	push   $0x7
c0003a80:	68 00 02 00 00       	push   $0x200
c0003a85:	50                   	push   %eax
c0003a86:	ff 75 d8             	pushl  -0x28(%ebp)
c0003a89:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003a8c:	e8 d2 f0 ff ff       	call   c0002b63 <rd_wt>
c0003a91:	83 c4 20             	add    $0x20,%esp
c0003a94:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003a9b:	e9 b0 00 00 00       	jmp    c0003b50 <alloc_smap_bit+0x145>
c0003aa0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003aa7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003aab:	0f 85 8c 00 00 00    	jne    c0003b3d <alloc_smap_bit+0x132>
c0003ab1:	eb 45                	jmp    c0003af8 <alloc_smap_bit+0xed>
c0003ab3:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003ab9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003abc:	01 d0                	add    %edx,%eax
c0003abe:	0f b6 00             	movzbl (%eax),%eax
c0003ac1:	0f be d0             	movsbl %al,%edx
c0003ac4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003ac7:	89 c1                	mov    %eax,%ecx
c0003ac9:	d3 fa                	sar    %cl,%edx
c0003acb:	89 d0                	mov    %edx,%eax
c0003acd:	83 e0 01             	and    $0x1,%eax
c0003ad0:	85 c0                	test   %eax,%eax
c0003ad2:	74 06                	je     c0003ada <alloc_smap_bit+0xcf>
c0003ad4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003ad8:	eb 1e                	jmp    c0003af8 <alloc_smap_bit+0xed>
c0003ada:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003add:	c1 e0 09             	shl    $0x9,%eax
c0003ae0:	89 c2                	mov    %eax,%edx
c0003ae2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003ae5:	01 d0                	add    %edx,%eax
c0003ae7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003aee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003af1:	01 d0                	add    %edx,%eax
c0003af3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003af6:	eb 06                	jmp    c0003afe <alloc_smap_bit+0xf3>
c0003af8:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003afc:	7e b5                	jle    c0003ab3 <alloc_smap_bit+0xa8>
c0003afe:	eb 3d                	jmp    c0003b3d <alloc_smap_bit+0x132>
c0003b00:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b04:	74 45                	je     c0003b4b <alloc_smap_bit+0x140>
c0003b06:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b0f:	01 d0                	add    %edx,%eax
c0003b11:	0f b6 18             	movzbl (%eax),%ebx
c0003b14:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b17:	ba 01 00 00 00       	mov    $0x1,%edx
c0003b1c:	89 c1                	mov    %eax,%ecx
c0003b1e:	d3 e2                	shl    %cl,%edx
c0003b20:	89 d0                	mov    %edx,%eax
c0003b22:	89 c1                	mov    %eax,%ecx
c0003b24:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b2d:	01 d0                	add    %edx,%eax
c0003b2f:	09 cb                	or     %ecx,%ebx
c0003b31:	89 da                	mov    %ebx,%edx
c0003b33:	88 10                	mov    %dl,(%eax)
c0003b35:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003b39:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b3d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b41:	74 09                	je     c0003b4c <alloc_smap_bit+0x141>
c0003b43:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003b47:	7e b7                	jle    c0003b00 <alloc_smap_bit+0xf5>
c0003b49:	eb 01                	jmp    c0003b4c <alloc_smap_bit+0x141>
c0003b4b:	90                   	nop
c0003b4c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003b50:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003b57:	0f 8e 43 ff ff ff    	jle    c0003aa0 <alloc_smap_bit+0x95>
c0003b5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b61:	74 1e                	je     c0003b81 <alloc_smap_bit+0x176>
c0003b63:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003b68:	83 ec 0c             	sub    $0xc,%esp
c0003b6b:	6a 0a                	push   $0xa
c0003b6d:	68 00 02 00 00       	push   $0x200
c0003b72:	50                   	push   %eax
c0003b73:	ff 75 d8             	pushl  -0x28(%ebp)
c0003b76:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003b79:	e8 e5 ef ff ff       	call   c0002b63 <rd_wt>
c0003b7e:	83 c4 20             	add    $0x20,%esp
c0003b81:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b85:	74 12                	je     c0003b99 <alloc_smap_bit+0x18e>
c0003b87:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003b8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b8e:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003b91:	0f 8c d4 fe ff ff    	jl     c0003a6b <alloc_smap_bit+0x60>
c0003b97:	eb 01                	jmp    c0003b9a <alloc_smap_bit+0x18f>
c0003b99:	90                   	nop
c0003b9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003b9d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003ba0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003ba3:	8b 00                	mov    (%eax),%eax
c0003ba5:	01 d0                	add    %edx,%eax
c0003ba7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003baa:	c9                   	leave  
c0003bab:	c3                   	ret    

c0003bac <new_inode>:
c0003bac:	55                   	push   %ebp
c0003bad:	89 e5                	mov    %esp,%ebp
c0003baf:	83 ec 38             	sub    $0x38,%esp
c0003bb2:	83 ec 08             	sub    $0x8,%esp
c0003bb5:	ff 75 0c             	pushl  0xc(%ebp)
c0003bb8:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003bbb:	50                   	push   %eax
c0003bbc:	e8 80 fa ff ff       	call   c0003641 <get_inode>
c0003bc1:	83 c4 10             	add    $0x10,%esp
c0003bc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003bc7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003bcb:	75 0a                	jne    c0003bd7 <new_inode+0x2b>
c0003bcd:	b8 00 00 00 00       	mov    $0x0,%eax
c0003bd2:	e9 f1 00 00 00       	jmp    c0003cc8 <new_inode+0x11c>
c0003bd7:	8b 45 10             	mov    0x10(%ebp),%eax
c0003bda:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003bdd:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003be4:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003beb:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003bf2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003bf5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003bf8:	83 ec 0c             	sub    $0xc,%esp
c0003bfb:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003bfe:	50                   	push   %eax
c0003bff:	e8 40 0b 00 00       	call   c0004744 <sync_inode>
c0003c04:	83 c4 10             	add    $0x10,%esp
c0003c07:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003c0e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003c15:	eb 1d                	jmp    c0003c34 <new_inode+0x88>
c0003c17:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c1a:	89 d0                	mov    %edx,%eax
c0003c1c:	c1 e0 02             	shl    $0x2,%eax
c0003c1f:	01 d0                	add    %edx,%eax
c0003c21:	c1 e0 03             	shl    $0x3,%eax
c0003c24:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003c29:	8b 00                	mov    (%eax),%eax
c0003c2b:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003c2e:	74 0c                	je     c0003c3c <new_inode+0x90>
c0003c30:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003c34:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003c38:	7e dd                	jle    c0003c17 <new_inode+0x6b>
c0003c3a:	eb 01                	jmp    c0003c3d <new_inode+0x91>
c0003c3c:	90                   	nop
c0003c3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c40:	89 d0                	mov    %edx,%eax
c0003c42:	c1 e0 02             	shl    $0x2,%eax
c0003c45:	01 d0                	add    %edx,%eax
c0003c47:	c1 e0 03             	shl    $0x3,%eax
c0003c4a:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003c4f:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003c52:	89 10                	mov    %edx,(%eax)
c0003c54:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c57:	89 50 04             	mov    %edx,0x4(%eax)
c0003c5a:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003c5d:	89 50 08             	mov    %edx,0x8(%eax)
c0003c60:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003c63:	89 50 0c             	mov    %edx,0xc(%eax)
c0003c66:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003c69:	89 50 10             	mov    %edx,0x10(%eax)
c0003c6c:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003c6f:	89 50 14             	mov    %edx,0x14(%eax)
c0003c72:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003c75:	89 50 18             	mov    %edx,0x18(%eax)
c0003c78:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003c7b:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003c7e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003c81:	89 50 20             	mov    %edx,0x20(%eax)
c0003c84:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003c87:	89 50 24             	mov    %edx,0x24(%eax)
c0003c8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c8d:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003c90:	89 10                	mov    %edx,(%eax)
c0003c92:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c95:	89 50 04             	mov    %edx,0x4(%eax)
c0003c98:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003c9b:	89 50 08             	mov    %edx,0x8(%eax)
c0003c9e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003ca1:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ca4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003ca7:	89 50 10             	mov    %edx,0x10(%eax)
c0003caa:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003cad:	89 50 14             	mov    %edx,0x14(%eax)
c0003cb0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003cb3:	89 50 18             	mov    %edx,0x18(%eax)
c0003cb6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003cb9:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003cbc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003cbf:	89 50 20             	mov    %edx,0x20(%eax)
c0003cc2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003cc5:	89 50 24             	mov    %edx,0x24(%eax)
c0003cc8:	c9                   	leave  
c0003cc9:	c3                   	ret    

c0003cca <new_dir_entry>:
c0003cca:	55                   	push   %ebp
c0003ccb:	89 e5                	mov    %esp,%ebp
c0003ccd:	83 ec 48             	sub    $0x48,%esp
c0003cd0:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003cd7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cda:	8b 40 04             	mov    0x4(%eax),%eax
c0003cdd:	99                   	cltd   
c0003cde:	f7 7d dc             	idivl  -0x24(%ebp)
c0003ce1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003ce4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ce7:	8b 40 0c             	mov    0xc(%eax),%eax
c0003cea:	99                   	cltd   
c0003ceb:	f7 7d dc             	idivl  -0x24(%ebp)
c0003cee:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003cf1:	e8 32 0c 00 00       	call   c0004928 <get_super_block>
c0003cf6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003cf9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003cfc:	8b 00                	mov    (%eax),%eax
c0003cfe:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003d01:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d04:	8b 40 0c             	mov    0xc(%eax),%eax
c0003d07:	05 00 02 00 00       	add    $0x200,%eax
c0003d0c:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d12:	85 c0                	test   %eax,%eax
c0003d14:	0f 48 c2             	cmovs  %edx,%eax
c0003d17:	c1 f8 09             	sar    $0x9,%eax
c0003d1a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003d1d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003d24:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003d2b:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003d32:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003d39:	eb 7f                	jmp    c0003dba <new_dir_entry+0xf0>
c0003d3b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d40:	89 c1                	mov    %eax,%ecx
c0003d42:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003d45:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003d48:	01 d0                	add    %edx,%eax
c0003d4a:	83 ec 0c             	sub    $0xc,%esp
c0003d4d:	6a 07                	push   $0x7
c0003d4f:	68 00 02 00 00       	push   $0x200
c0003d54:	51                   	push   %ecx
c0003d55:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003d58:	50                   	push   %eax
c0003d59:	e8 05 ee ff ff       	call   c0002b63 <rd_wt>
c0003d5e:	83 c4 20             	add    $0x20,%esp
c0003d61:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003d66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003d69:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003d70:	eb 25                	jmp    c0003d97 <new_dir_entry+0xcd>
c0003d72:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003d76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003d79:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003d7c:	7f 29                	jg     c0003da7 <new_dir_entry+0xdd>
c0003d7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d81:	8b 00                	mov    (%eax),%eax
c0003d83:	85 c0                	test   %eax,%eax
c0003d85:	75 08                	jne    c0003d8f <new_dir_entry+0xc5>
c0003d87:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003d8d:	eb 19                	jmp    c0003da8 <new_dir_entry+0xde>
c0003d8f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003d93:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003d97:	b8 00 02 00 00       	mov    $0x200,%eax
c0003d9c:	99                   	cltd   
c0003d9d:	f7 7d dc             	idivl  -0x24(%ebp)
c0003da0:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003da3:	7c cd                	jl     c0003d72 <new_dir_entry+0xa8>
c0003da5:	eb 01                	jmp    c0003da8 <new_dir_entry+0xde>
c0003da7:	90                   	nop
c0003da8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003dab:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003dae:	7f 16                	jg     c0003dc6 <new_dir_entry+0xfc>
c0003db0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003db4:	75 10                	jne    c0003dc6 <new_dir_entry+0xfc>
c0003db6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003dba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003dbd:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003dc0:	0f 8c 75 ff ff ff    	jl     c0003d3b <new_dir_entry+0x71>
c0003dc6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003dc9:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003dcc:	75 0a                	jne    c0003dd8 <new_dir_entry+0x10e>
c0003dce:	b8 00 00 00 00       	mov    $0x0,%eax
c0003dd3:	e9 fc 00 00 00       	jmp    c0003ed4 <new_dir_entry+0x20a>
c0003dd8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003ddf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003de3:	75 1e                	jne    c0003e03 <new_dir_entry+0x139>
c0003de5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003de8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003deb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003dee:	8b 50 04             	mov    0x4(%eax),%edx
c0003df1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003df4:	01 c2                	add    %eax,%edx
c0003df6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003df9:	89 50 04             	mov    %edx,0x4(%eax)
c0003dfc:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003e03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e06:	8b 55 14             	mov    0x14(%ebp),%edx
c0003e09:	89 10                	mov    %edx,(%eax)
c0003e0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e0e:	83 c0 04             	add    $0x4,%eax
c0003e11:	83 ec 08             	sub    $0x8,%esp
c0003e14:	ff 75 10             	pushl  0x10(%ebp)
c0003e17:	50                   	push   %eax
c0003e18:	e8 a1 7c 00 00       	call   c000babe <Strcpy>
c0003e1d:	83 c4 10             	add    $0x10,%esp
c0003e20:	8b 45 08             	mov    0x8(%ebp),%eax
c0003e23:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003e26:	8b 0a                	mov    (%edx),%ecx
c0003e28:	89 08                	mov    %ecx,(%eax)
c0003e2a:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003e2d:	89 48 04             	mov    %ecx,0x4(%eax)
c0003e30:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003e33:	89 48 08             	mov    %ecx,0x8(%eax)
c0003e36:	8b 52 0c             	mov    0xc(%edx),%edx
c0003e39:	89 50 0c             	mov    %edx,0xc(%eax)
c0003e3c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e41:	89 c1                	mov    %eax,%ecx
c0003e43:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003e46:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003e49:	01 d0                	add    %edx,%eax
c0003e4b:	83 ec 0c             	sub    $0xc,%esp
c0003e4e:	6a 0a                	push   $0xa
c0003e50:	68 00 02 00 00       	push   $0x200
c0003e55:	51                   	push   %ecx
c0003e56:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003e59:	50                   	push   %eax
c0003e5a:	e8 04 ed ff ff       	call   c0002b63 <rd_wt>
c0003e5f:	83 c4 20             	add    $0x20,%esp
c0003e62:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003e66:	74 69                	je     c0003ed1 <new_dir_entry+0x207>
c0003e68:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e6b:	8b 10                	mov    (%eax),%edx
c0003e6d:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003e73:	8b 50 04             	mov    0x4(%eax),%edx
c0003e76:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003e7c:	8b 50 08             	mov    0x8(%eax),%edx
c0003e7f:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003e85:	8b 50 0c             	mov    0xc(%eax),%edx
c0003e88:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003e8e:	8b 50 10             	mov    0x10(%eax),%edx
c0003e91:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003e97:	8b 50 14             	mov    0x14(%eax),%edx
c0003e9a:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003ea0:	8b 50 18             	mov    0x18(%eax),%edx
c0003ea3:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003ea9:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003eac:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003eb2:	8b 50 20             	mov    0x20(%eax),%edx
c0003eb5:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003ebb:	8b 40 24             	mov    0x24(%eax),%eax
c0003ebe:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003ec3:	83 ec 0c             	sub    $0xc,%esp
c0003ec6:	ff 75 0c             	pushl  0xc(%ebp)
c0003ec9:	e8 76 08 00 00       	call   c0004744 <sync_inode>
c0003ece:	83 c4 10             	add    $0x10,%esp
c0003ed1:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ed4:	c9                   	leave  
c0003ed5:	c3                   	ret    

c0003ed6 <do_unlink>:
c0003ed6:	55                   	push   %ebp
c0003ed7:	89 e5                	mov    %esp,%ebp
c0003ed9:	53                   	push   %ebx
c0003eda:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003ee0:	83 ec 08             	sub    $0x8,%esp
c0003ee3:	ff 75 08             	pushl  0x8(%ebp)
c0003ee6:	68 89 b1 00 c0       	push   $0xc000b189
c0003eeb:	e8 52 63 00 00       	call   c000a242 <strcmp>
c0003ef0:	83 c4 10             	add    $0x10,%esp
c0003ef3:	85 c0                	test   %eax,%eax
c0003ef5:	75 10                	jne    c0003f07 <do_unlink+0x31>
c0003ef7:	83 ec 0c             	sub    $0xc,%esp
c0003efa:	68 8b b1 00 c0       	push   $0xc000b18b
c0003eff:	e8 54 57 00 00       	call   c0009658 <panic>
c0003f04:	83 c4 10             	add    $0x10,%esp
c0003f07:	83 ec 0c             	sub    $0xc,%esp
c0003f0a:	ff 75 08             	pushl  0x8(%ebp)
c0003f0d:	e8 31 f5 ff ff       	call   c0003443 <search_file>
c0003f12:	83 c4 10             	add    $0x10,%esp
c0003f15:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f18:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003f1c:	75 10                	jne    c0003f2e <do_unlink+0x58>
c0003f1e:	83 ec 0c             	sub    $0xc,%esp
c0003f21:	68 a7 b1 00 c0       	push   $0xc000b1a7
c0003f26:	e8 2d 57 00 00       	call   c0009658 <panic>
c0003f2b:	83 c4 10             	add    $0x10,%esp
c0003f2e:	83 ec 08             	sub    $0x8,%esp
c0003f31:	ff 75 d0             	pushl  -0x30(%ebp)
c0003f34:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003f3a:	50                   	push   %eax
c0003f3b:	e8 01 f7 ff ff       	call   c0003641 <get_inode>
c0003f40:	83 c4 10             	add    $0x10,%esp
c0003f43:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003f46:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003f4a:	75 10                	jne    c0003f5c <do_unlink+0x86>
c0003f4c:	83 ec 0c             	sub    $0xc,%esp
c0003f4f:	68 a7 b1 00 c0       	push   $0xc000b1a7
c0003f54:	e8 ff 56 00 00       	call   c0009658 <panic>
c0003f59:	83 c4 10             	add    $0x10,%esp
c0003f5c:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003f5f:	85 c0                	test   %eax,%eax
c0003f61:	7e 10                	jle    c0003f73 <do_unlink+0x9d>
c0003f63:	83 ec 0c             	sub    $0xc,%esp
c0003f66:	68 c0 b1 00 c0       	push   $0xc000b1c0
c0003f6b:	e8 e8 56 00 00       	call   c0009658 <panic>
c0003f70:	83 c4 10             	add    $0x10,%esp
c0003f73:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003f79:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003f7c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003f7f:	8d 50 07             	lea    0x7(%eax),%edx
c0003f82:	85 c0                	test   %eax,%eax
c0003f84:	0f 48 c2             	cmovs  %edx,%eax
c0003f87:	c1 f8 03             	sar    $0x3,%eax
c0003f8a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003f8d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003f90:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003f96:	85 c0                	test   %eax,%eax
c0003f98:	0f 48 c2             	cmovs  %edx,%eax
c0003f9b:	c1 f8 09             	sar    $0x9,%eax
c0003f9e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003fa1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003fa4:	99                   	cltd   
c0003fa5:	c1 ea 1d             	shr    $0x1d,%edx
c0003fa8:	01 d0                	add    %edx,%eax
c0003faa:	83 e0 07             	and    $0x7,%eax
c0003fad:	29 d0                	sub    %edx,%eax
c0003faf:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003fb2:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003fb9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003fbe:	89 c2                	mov    %eax,%edx
c0003fc0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003fc3:	83 c0 02             	add    $0x2,%eax
c0003fc6:	83 ec 0c             	sub    $0xc,%esp
c0003fc9:	6a 07                	push   $0x7
c0003fcb:	68 00 02 00 00       	push   $0x200
c0003fd0:	52                   	push   %edx
c0003fd1:	ff 75 b8             	pushl  -0x48(%ebp)
c0003fd4:	50                   	push   %eax
c0003fd5:	e8 89 eb ff ff       	call   c0002b63 <rd_wt>
c0003fda:	83 c4 20             	add    $0x20,%esp
c0003fdd:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003fe3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003fe6:	01 d0                	add    %edx,%eax
c0003fe8:	0f b6 10             	movzbl (%eax),%edx
c0003feb:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003fee:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003ff3:	89 c1                	mov    %eax,%ecx
c0003ff5:	d3 e3                	shl    %cl,%ebx
c0003ff7:	89 d8                	mov    %ebx,%eax
c0003ff9:	f7 d0                	not    %eax
c0003ffb:	89 c3                	mov    %eax,%ebx
c0003ffd:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0004003:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004006:	01 c8                	add    %ecx,%eax
c0004008:	21 da                	and    %ebx,%edx
c000400a:	88 10                	mov    %dl,(%eax)
c000400c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004011:	89 c2                	mov    %eax,%edx
c0004013:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004016:	83 c0 02             	add    $0x2,%eax
c0004019:	83 ec 0c             	sub    $0xc,%esp
c000401c:	6a 0a                	push   $0xa
c000401e:	68 00 02 00 00       	push   $0x200
c0004023:	52                   	push   %edx
c0004024:	ff 75 b8             	pushl  -0x48(%ebp)
c0004027:	50                   	push   %eax
c0004028:	e8 36 eb ff ff       	call   c0002b63 <rd_wt>
c000402d:	83 c4 20             	add    $0x20,%esp
c0004030:	e8 f3 08 00 00       	call   c0004928 <get_super_block>
c0004035:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0004038:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c000403e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004041:	8b 00                	mov    (%eax),%eax
c0004043:	29 c2                	sub    %eax,%edx
c0004045:	89 d0                	mov    %edx,%eax
c0004047:	83 c0 01             	add    $0x1,%eax
c000404a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000404d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004050:	8d 50 07             	lea    0x7(%eax),%edx
c0004053:	85 c0                	test   %eax,%eax
c0004055:	0f 48 c2             	cmovs  %edx,%eax
c0004058:	c1 f8 03             	sar    $0x3,%eax
c000405b:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000405e:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0004061:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0004067:	85 c0                	test   %eax,%eax
c0004069:	0f 48 c2             	cmovs  %edx,%eax
c000406c:	c1 f8 09             	sar    $0x9,%eax
c000406f:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004072:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004075:	99                   	cltd   
c0004076:	c1 ea 1d             	shr    $0x1d,%edx
c0004079:	01 d0                	add    %edx,%eax
c000407b:	83 e0 07             	and    $0x7,%eax
c000407e:	29 d0                	sub    %edx,%eax
c0004080:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004083:	b8 08 00 00 00       	mov    $0x8,%eax
c0004088:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c000408b:	8b 55 b0             	mov    -0x50(%ebp),%edx
c000408e:	29 c2                	sub    %eax,%edx
c0004090:	89 d0                	mov    %edx,%eax
c0004092:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004095:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004098:	8d 50 07             	lea    0x7(%eax),%edx
c000409b:	85 c0                	test   %eax,%eax
c000409d:	0f 48 c2             	cmovs  %edx,%eax
c00040a0:	c1 f8 03             	sar    $0x3,%eax
c00040a3:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00040a6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00040ab:	89 c1                	mov    %eax,%ecx
c00040ad:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00040b0:	8b 40 04             	mov    0x4(%eax),%eax
c00040b3:	8d 50 02             	lea    0x2(%eax),%edx
c00040b6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00040b9:	01 d0                	add    %edx,%eax
c00040bb:	83 ec 0c             	sub    $0xc,%esp
c00040be:	6a 07                	push   $0x7
c00040c0:	68 00 02 00 00       	push   $0x200
c00040c5:	51                   	push   %ecx
c00040c6:	ff 75 b8             	pushl  -0x48(%ebp)
c00040c9:	50                   	push   %eax
c00040ca:	e8 94 ea ff ff       	call   c0002b63 <rd_wt>
c00040cf:	83 c4 20             	add    $0x20,%esp
c00040d2:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00040d8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040db:	01 d0                	add    %edx,%eax
c00040dd:	0f b6 10             	movzbl (%eax),%edx
c00040e0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00040e3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00040e8:	89 c1                	mov    %eax,%ecx
c00040ea:	d3 e3                	shl    %cl,%ebx
c00040ec:	89 d8                	mov    %ebx,%eax
c00040ee:	f7 d0                	not    %eax
c00040f0:	89 c3                	mov    %eax,%ebx
c00040f2:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c00040f8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040fb:	01 c8                	add    %ecx,%eax
c00040fd:	21 da                	and    %ebx,%edx
c00040ff:	88 10                	mov    %dl,(%eax)
c0004101:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004108:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000410b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000410e:	eb 6b                	jmp    c000417b <do_unlink+0x2a5>
c0004110:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004117:	75 4c                	jne    c0004165 <do_unlink+0x28f>
c0004119:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004120:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004125:	83 ec 0c             	sub    $0xc,%esp
c0004128:	6a 0a                	push   $0xa
c000412a:	68 00 02 00 00       	push   $0x200
c000412f:	50                   	push   %eax
c0004130:	ff 75 b8             	pushl  -0x48(%ebp)
c0004133:	ff 75 ec             	pushl  -0x14(%ebp)
c0004136:	e8 28 ea ff ff       	call   c0002b63 <rd_wt>
c000413b:	83 c4 20             	add    $0x20,%esp
c000413e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004143:	89 c1                	mov    %eax,%ecx
c0004145:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004148:	8d 50 01             	lea    0x1(%eax),%edx
c000414b:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000414e:	83 ec 0c             	sub    $0xc,%esp
c0004151:	6a 07                	push   $0x7
c0004153:	68 00 02 00 00       	push   $0x200
c0004158:	51                   	push   %ecx
c0004159:	ff 75 b8             	pushl  -0x48(%ebp)
c000415c:	50                   	push   %eax
c000415d:	e8 01 ea ff ff       	call   c0002b63 <rd_wt>
c0004162:	83 c4 20             	add    $0x20,%esp
c0004165:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000416b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000416e:	01 d0                	add    %edx,%eax
c0004170:	c6 00 00             	movb   $0x0,(%eax)
c0004173:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004177:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c000417b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000417e:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0004181:	7c 8d                	jl     c0004110 <do_unlink+0x23a>
c0004183:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c000418a:	75 4c                	jne    c00041d8 <do_unlink+0x302>
c000418c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004193:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004198:	83 ec 0c             	sub    $0xc,%esp
c000419b:	6a 0a                	push   $0xa
c000419d:	68 00 02 00 00       	push   $0x200
c00041a2:	50                   	push   %eax
c00041a3:	ff 75 b8             	pushl  -0x48(%ebp)
c00041a6:	ff 75 ec             	pushl  -0x14(%ebp)
c00041a9:	e8 b5 e9 ff ff       	call   c0002b63 <rd_wt>
c00041ae:	83 c4 20             	add    $0x20,%esp
c00041b1:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041b6:	89 c1                	mov    %eax,%ecx
c00041b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041bb:	8d 50 01             	lea    0x1(%eax),%edx
c00041be:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00041c1:	83 ec 0c             	sub    $0xc,%esp
c00041c4:	6a 07                	push   $0x7
c00041c6:	68 00 02 00 00       	push   $0x200
c00041cb:	51                   	push   %ecx
c00041cc:	ff 75 b8             	pushl  -0x48(%ebp)
c00041cf:	50                   	push   %eax
c00041d0:	e8 8e e9 ff ff       	call   c0002b63 <rd_wt>
c00041d5:	83 c4 20             	add    $0x20,%esp
c00041d8:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00041de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041e1:	01 d0                	add    %edx,%eax
c00041e3:	0f b6 10             	movzbl (%eax),%edx
c00041e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00041e9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00041ee:	89 c1                	mov    %eax,%ecx
c00041f0:	d3 e3                	shl    %cl,%ebx
c00041f2:	89 d8                	mov    %ebx,%eax
c00041f4:	89 c3                	mov    %eax,%ebx
c00041f6:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c00041fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041ff:	01 c8                	add    %ecx,%eax
c0004201:	21 da                	and    %ebx,%edx
c0004203:	88 10                	mov    %dl,(%eax)
c0004205:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000420a:	83 ec 0c             	sub    $0xc,%esp
c000420d:	6a 0a                	push   $0xa
c000420f:	68 00 02 00 00       	push   $0x200
c0004214:	50                   	push   %eax
c0004215:	ff 75 b8             	pushl  -0x48(%ebp)
c0004218:	ff 75 ec             	pushl  -0x14(%ebp)
c000421b:	e8 43 e9 ff ff       	call   c0002b63 <rd_wt>
c0004220:	83 c4 20             	add    $0x20,%esp
c0004223:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c000422a:	00 00 00 
c000422d:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0004234:	00 00 00 
c0004237:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c000423e:	00 00 00 
c0004241:	83 ec 0c             	sub    $0xc,%esp
c0004244:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000424a:	50                   	push   %eax
c000424b:	e8 f4 04 00 00       	call   c0004744 <sync_inode>
c0004250:	83 c4 10             	add    $0x10,%esp
c0004253:	83 ec 0c             	sub    $0xc,%esp
c0004256:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000425c:	50                   	push   %eax
c000425d:	e8 36 06 00 00       	call   c0004898 <put_inode>
c0004262:	83 c4 10             	add    $0x10,%esp
c0004265:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004268:	8b 00                	mov    (%eax),%eax
c000426a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000426d:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c0004274:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004277:	8b 40 04             	mov    0x4(%eax),%eax
c000427a:	89 45 94             	mov    %eax,-0x6c(%ebp)
c000427d:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004280:	8b 40 0c             	mov    0xc(%eax),%eax
c0004283:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004286:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004289:	c1 e8 04             	shr    $0x4,%eax
c000428c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c000428f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004296:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000429d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00042a4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00042ab:	e9 a5 00 00 00       	jmp    c0004355 <do_unlink+0x47f>
c00042b0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00042b5:	89 c1                	mov    %eax,%ecx
c00042b7:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00042ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042bd:	01 d0                	add    %edx,%eax
c00042bf:	83 ec 0c             	sub    $0xc,%esp
c00042c2:	6a 07                	push   $0x7
c00042c4:	68 00 02 00 00       	push   $0x200
c00042c9:	51                   	push   %ecx
c00042ca:	ff 75 b8             	pushl  -0x48(%ebp)
c00042cd:	50                   	push   %eax
c00042ce:	e8 90 e8 ff ff       	call   c0002b63 <rd_wt>
c00042d3:	83 c4 20             	add    $0x20,%esp
c00042d6:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00042db:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00042de:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00042e5:	eb 51                	jmp    c0004338 <do_unlink+0x462>
c00042e7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00042eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00042ee:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00042f1:	7f 4f                	jg     c0004342 <do_unlink+0x46c>
c00042f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00042f6:	83 c0 10             	add    $0x10,%eax
c00042f9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00042fc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00042ff:	83 c0 04             	add    $0x4,%eax
c0004302:	83 ec 08             	sub    $0x8,%esp
c0004305:	ff 75 08             	pushl  0x8(%ebp)
c0004308:	50                   	push   %eax
c0004309:	e8 34 5f 00 00       	call   c000a242 <strcmp>
c000430e:	83 c4 10             	add    $0x10,%esp
c0004311:	85 c0                	test   %eax,%eax
c0004313:	75 1b                	jne    c0004330 <do_unlink+0x45a>
c0004315:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000431c:	83 ec 04             	sub    $0x4,%esp
c000431f:	6a 10                	push   $0x10
c0004321:	6a 00                	push   $0x0
c0004323:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004326:	e8 74 77 00 00       	call   c000ba9f <Memset>
c000432b:	83 c4 10             	add    $0x10,%esp
c000432e:	eb 13                	jmp    c0004343 <do_unlink+0x46d>
c0004330:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0004334:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0004338:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000433b:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000433e:	7c a7                	jl     c00042e7 <do_unlink+0x411>
c0004340:	eb 01                	jmp    c0004343 <do_unlink+0x46d>
c0004342:	90                   	nop
c0004343:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004346:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004349:	7f 16                	jg     c0004361 <do_unlink+0x48b>
c000434b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000434f:	75 10                	jne    c0004361 <do_unlink+0x48b>
c0004351:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0004355:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004358:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000435b:	0f 8c 4f ff ff ff    	jl     c00042b0 <do_unlink+0x3da>
c0004361:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004364:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004367:	75 17                	jne    c0004380 <do_unlink+0x4aa>
c0004369:	8b 45 98             	mov    -0x68(%ebp),%eax
c000436c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000436f:	89 50 04             	mov    %edx,0x4(%eax)
c0004372:	83 ec 0c             	sub    $0xc,%esp
c0004375:	ff 75 98             	pushl  -0x68(%ebp)
c0004378:	e8 c7 03 00 00       	call   c0004744 <sync_inode>
c000437d:	83 c4 10             	add    $0x10,%esp
c0004380:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004384:	74 26                	je     c00043ac <do_unlink+0x4d6>
c0004386:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000438b:	89 c1                	mov    %eax,%ecx
c000438d:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004390:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004393:	01 d0                	add    %edx,%eax
c0004395:	83 ec 0c             	sub    $0xc,%esp
c0004398:	6a 0a                	push   $0xa
c000439a:	68 00 02 00 00       	push   $0x200
c000439f:	51                   	push   %ecx
c00043a0:	ff 75 b8             	pushl  -0x48(%ebp)
c00043a3:	50                   	push   %eax
c00043a4:	e8 ba e7 ff ff       	call   c0002b63 <rd_wt>
c00043a9:	83 c4 20             	add    $0x20,%esp
c00043ac:	90                   	nop
c00043ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00043b0:	c9                   	leave  
c00043b1:	c3                   	ret    

c00043b2 <do_rdwt>:
c00043b2:	55                   	push   %ebp
c00043b3:	89 e5                	mov    %esp,%ebp
c00043b5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00043bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00043be:	8b 40 68             	mov    0x68(%eax),%eax
c00043c1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00043c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00043c7:	8b 40 50             	mov    0x50(%eax),%eax
c00043ca:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00043cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00043d0:	8b 40 5c             	mov    0x5c(%eax),%eax
c00043d3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00043d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043d9:	8b 00                	mov    (%eax),%eax
c00043db:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00043de:	8b 45 08             	mov    0x8(%ebp),%eax
c00043e1:	8b 40 10             	mov    0x10(%eax),%eax
c00043e4:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00043e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00043ea:	8b 40 40             	mov    0x40(%eax),%eax
c00043ed:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00043f0:	83 ec 0c             	sub    $0xc,%esp
c00043f3:	ff 75 cc             	pushl  -0x34(%ebp)
c00043f6:	e8 08 0a 00 00       	call   c0004e03 <pid2proc>
c00043fb:	83 c4 10             	add    $0x10,%esp
c00043fe:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004401:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004404:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0004407:	83 c2 50             	add    $0x50,%edx
c000440a:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c000440e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0004411:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004414:	8b 40 08             	mov    0x8(%eax),%eax
c0004417:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000441a:	8b 45 08             	mov    0x8(%ebp),%eax
c000441d:	8b 00                	mov    (%eax),%eax
c000441f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0004422:	83 ec 08             	sub    $0x8,%esp
c0004425:	ff 75 b8             	pushl  -0x48(%ebp)
c0004428:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c000442e:	50                   	push   %eax
c000442f:	e8 0d f2 ff ff       	call   c0003641 <get_inode>
c0004434:	83 c4 10             	add    $0x10,%esp
c0004437:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000443a:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c000443e:	75 10                	jne    c0004450 <do_rdwt+0x9e>
c0004440:	83 ec 0c             	sub    $0xc,%esp
c0004443:	68 f8 b1 00 c0       	push   $0xc000b1f8
c0004448:	e8 0b 52 00 00       	call   c0009658 <panic>
c000444d:	83 c4 10             	add    $0x10,%esp
c0004450:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004456:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004459:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000445c:	8b 40 04             	mov    0x4(%eax),%eax
c000445f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004462:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004466:	74 22                	je     c000448a <do_rdwt+0xd8>
c0004468:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000446c:	74 1c                	je     c000448a <do_rdwt+0xd8>
c000446e:	68 9b 04 00 00       	push   $0x49b
c0004473:	68 64 b0 00 c0       	push   $0xc000b064
c0004478:	68 64 b0 00 c0       	push   $0xc000b064
c000447d:	68 08 b2 00 c0       	push   $0xc000b208
c0004482:	e8 ef 51 00 00       	call   c0009676 <assertion_failure>
c0004487:	83 c4 10             	add    $0x10,%esp
c000448a:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0004490:	83 f8 01             	cmp    $0x1,%eax
c0004493:	0f 85 86 00 00 00    	jne    c000451f <do_rdwt+0x16d>
c0004499:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000449d:	75 09                	jne    c00044a8 <do_rdwt+0xf6>
c000449f:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c00044a6:	eb 0d                	jmp    c00044b5 <do_rdwt+0x103>
c00044a8:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c00044ac:	75 07                	jne    c00044b5 <do_rdwt+0x103>
c00044ae:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c00044b5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00044b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00044bb:	89 50 68             	mov    %edx,0x68(%eax)
c00044be:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c00044c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00044c4:	89 50 58             	mov    %edx,0x58(%eax)
c00044c7:	83 ec 04             	sub    $0x4,%esp
c00044ca:	6a 04                	push   $0x4
c00044cc:	ff 75 08             	pushl  0x8(%ebp)
c00044cf:	6a 03                	push   $0x3
c00044d1:	e8 10 5a 00 00       	call   c0009ee6 <send_rec>
c00044d6:	83 c4 10             	add    $0x10,%esp
c00044d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00044dc:	8b 40 68             	mov    0x68(%eax),%eax
c00044df:	83 f8 66             	cmp    $0x66,%eax
c00044e2:	75 13                	jne    c00044f7 <do_rdwt+0x145>
c00044e4:	83 ec 04             	sub    $0x4,%esp
c00044e7:	ff 75 b4             	pushl  -0x4c(%ebp)
c00044ea:	ff 75 08             	pushl  0x8(%ebp)
c00044ed:	6a 01                	push   $0x1
c00044ef:	e8 f2 59 00 00       	call   c0009ee6 <send_rec>
c00044f4:	83 c4 10             	add    $0x10,%esp
c00044f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00044fa:	8b 40 68             	mov    0x68(%eax),%eax
c00044fd:	83 f8 65             	cmp    $0x65,%eax
c0004500:	75 13                	jne    c0004515 <do_rdwt+0x163>
c0004502:	83 ec 04             	sub    $0x4,%esp
c0004505:	ff 75 b4             	pushl  -0x4c(%ebp)
c0004508:	ff 75 08             	pushl  0x8(%ebp)
c000450b:	6a 01                	push   $0x1
c000450d:	e8 d4 59 00 00       	call   c0009ee6 <send_rec>
c0004512:	83 c4 10             	add    $0x10,%esp
c0004515:	b8 00 00 00 00       	mov    $0x0,%eax
c000451a:	e9 23 02 00 00       	jmp    c0004742 <do_rdwt+0x390>
c000451f:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004523:	75 18                	jne    c000453d <do_rdwt+0x18b>
c0004525:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000452b:	c1 e0 09             	shl    $0x9,%eax
c000452e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0004531:	75 0a                	jne    c000453d <do_rdwt+0x18b>
c0004533:	b8 00 00 00 00       	mov    $0x0,%eax
c0004538:	e9 05 02 00 00       	jmp    c0004742 <do_rdwt+0x390>
c000453d:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004541:	75 1b                	jne    c000455e <do_rdwt+0x1ac>
c0004543:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000454a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000454d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004550:	01 d0                	add    %edx,%eax
c0004552:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004555:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c0004559:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000455c:	eb 19                	jmp    c0004577 <do_rdwt+0x1c5>
c000455e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004561:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004564:	01 c2                	add    %eax,%edx
c0004566:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000456c:	c1 e0 09             	shl    $0x9,%eax
c000456f:	39 c2                	cmp    %eax,%edx
c0004571:	0f 4e c2             	cmovle %edx,%eax
c0004574:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004577:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000457a:	99                   	cltd   
c000457b:	c1 ea 17             	shr    $0x17,%edx
c000457e:	01 d0                	add    %edx,%eax
c0004580:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004585:	29 d0                	sub    %edx,%eax
c0004587:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000458a:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0004590:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004593:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004599:	85 c0                	test   %eax,%eax
c000459b:	0f 48 c1             	cmovs  %ecx,%eax
c000459e:	c1 f8 09             	sar    $0x9,%eax
c00045a1:	01 d0                	add    %edx,%eax
c00045a3:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00045a6:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00045ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00045af:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00045b5:	85 c0                	test   %eax,%eax
c00045b7:	0f 48 c1             	cmovs  %ecx,%eax
c00045ba:	c1 f8 09             	sar    $0x9,%eax
c00045bd:	01 d0                	add    %edx,%eax
c00045bf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00045c2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00045c5:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00045c8:	ba 00 00 10 00       	mov    $0x100000,%edx
c00045cd:	39 d0                	cmp    %edx,%eax
c00045cf:	7d 0b                	jge    c00045dc <do_rdwt+0x22a>
c00045d1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00045d4:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00045d7:	83 c0 01             	add    $0x1,%eax
c00045da:	eb 05                	jmp    c00045e1 <do_rdwt+0x22f>
c00045dc:	b8 00 00 10 00       	mov    $0x100000,%eax
c00045e1:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00045e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00045ea:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00045f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00045f4:	8b 00                	mov    (%eax),%eax
c00045f6:	83 ec 0c             	sub    $0xc,%esp
c00045f9:	50                   	push   %eax
c00045fa:	e8 04 08 00 00       	call   c0004e03 <pid2proc>
c00045ff:	83 c4 10             	add    $0x10,%esp
c0004602:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004605:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004608:	83 ec 08             	sub    $0x8,%esp
c000460b:	50                   	push   %eax
c000460c:	ff 75 c8             	pushl  -0x38(%ebp)
c000460f:	e8 d9 2a 00 00       	call   c00070ed <alloc_virtual_memory>
c0004614:	83 c4 10             	add    $0x10,%esp
c0004617:	89 45 98             	mov    %eax,-0x68(%ebp)
c000461a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000461d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004620:	e9 c5 00 00 00       	jmp    c00046ea <do_rdwt+0x338>
c0004625:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004628:	c1 e0 09             	shl    $0x9,%eax
c000462b:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000462e:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0004631:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c0004635:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004638:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c000463f:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004643:	75 46                	jne    c000468b <do_rdwt+0x2d9>
c0004645:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004648:	c1 e0 09             	shl    $0x9,%eax
c000464b:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004651:	83 ec 0c             	sub    $0xc,%esp
c0004654:	6a 07                	push   $0x7
c0004656:	50                   	push   %eax
c0004657:	52                   	push   %edx
c0004658:	ff 75 90             	pushl  -0x70(%ebp)
c000465b:	ff 75 dc             	pushl  -0x24(%ebp)
c000465e:	e8 00 e5 ff ff       	call   c0002b63 <rd_wt>
c0004663:	83 c4 20             	add    $0x20,%esp
c0004666:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000466c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000466f:	01 d0                	add    %edx,%eax
c0004671:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004674:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004677:	01 ca                	add    %ecx,%edx
c0004679:	83 ec 04             	sub    $0x4,%esp
c000467c:	ff 75 94             	pushl  -0x6c(%ebp)
c000467f:	50                   	push   %eax
c0004680:	52                   	push   %edx
c0004681:	e8 18 35 00 00       	call   c0007b9e <Memcpy>
c0004686:	83 c4 10             	add    $0x10,%esp
c0004689:	eb 46                	jmp    c00046d1 <do_rdwt+0x31f>
c000468b:	8b 55 98             	mov    -0x68(%ebp),%edx
c000468e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004691:	01 d0                	add    %edx,%eax
c0004693:	89 c1                	mov    %eax,%ecx
c0004695:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000469b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000469e:	01 d0                	add    %edx,%eax
c00046a0:	83 ec 04             	sub    $0x4,%esp
c00046a3:	ff 75 94             	pushl  -0x6c(%ebp)
c00046a6:	51                   	push   %ecx
c00046a7:	50                   	push   %eax
c00046a8:	e8 f1 34 00 00       	call   c0007b9e <Memcpy>
c00046ad:	83 c4 10             	add    $0x10,%esp
c00046b0:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046b3:	c1 e0 09             	shl    $0x9,%eax
c00046b6:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00046bc:	83 ec 0c             	sub    $0xc,%esp
c00046bf:	6a 0a                	push   $0xa
c00046c1:	50                   	push   %eax
c00046c2:	52                   	push   %edx
c00046c3:	ff 75 90             	pushl  -0x70(%ebp)
c00046c6:	ff 75 dc             	pushl  -0x24(%ebp)
c00046c9:	e8 95 e4 ff ff       	call   c0002b63 <rd_wt>
c00046ce:	83 c4 20             	add    $0x20,%esp
c00046d1:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00046d4:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c00046d7:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00046da:	01 45 e0             	add    %eax,-0x20(%ebp)
c00046dd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00046e4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046e7:	01 45 dc             	add    %eax,-0x24(%ebp)
c00046ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046ed:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c00046f0:	7f 0a                	jg     c00046fc <do_rdwt+0x34a>
c00046f2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00046f6:	0f 85 29 ff ff ff    	jne    c0004625 <do_rdwt+0x273>
c00046fc:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00046ff:	8b 50 04             	mov    0x4(%eax),%edx
c0004702:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004705:	01 c2                	add    %eax,%edx
c0004707:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000470a:	89 50 04             	mov    %edx,0x4(%eax)
c000470d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004710:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004713:	01 c2                	add    %eax,%edx
c0004715:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c000471b:	39 c2                	cmp    %eax,%edx
c000471d:	7e 20                	jle    c000473f <do_rdwt+0x38d>
c000471f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004722:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004725:	01 d0                	add    %edx,%eax
c0004727:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c000472d:	83 ec 0c             	sub    $0xc,%esp
c0004730:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004736:	50                   	push   %eax
c0004737:	e8 08 00 00 00       	call   c0004744 <sync_inode>
c000473c:	83 c4 10             	add    $0x10,%esp
c000473f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004742:	c9                   	leave  
c0004743:	c3                   	ret    

c0004744 <sync_inode>:
c0004744:	55                   	push   %ebp
c0004745:	89 e5                	mov    %esp,%ebp
c0004747:	53                   	push   %ebx
c0004748:	83 ec 34             	sub    $0x34,%esp
c000474b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004752:	eb 74                	jmp    c00047c8 <sync_inode+0x84>
c0004754:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004757:	89 d0                	mov    %edx,%eax
c0004759:	c1 e0 02             	shl    $0x2,%eax
c000475c:	01 d0                	add    %edx,%eax
c000475e:	c1 e0 03             	shl    $0x3,%eax
c0004761:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0004766:	8b 10                	mov    (%eax),%edx
c0004768:	8b 45 08             	mov    0x8(%ebp),%eax
c000476b:	8b 40 10             	mov    0x10(%eax),%eax
c000476e:	39 c2                	cmp    %eax,%edx
c0004770:	75 52                	jne    c00047c4 <sync_inode+0x80>
c0004772:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004775:	89 d0                	mov    %edx,%eax
c0004777:	c1 e0 02             	shl    $0x2,%eax
c000477a:	01 d0                	add    %edx,%eax
c000477c:	c1 e0 03             	shl    $0x3,%eax
c000477f:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c0004785:	8b 45 08             	mov    0x8(%ebp),%eax
c0004788:	8b 08                	mov    (%eax),%ecx
c000478a:	89 0a                	mov    %ecx,(%edx)
c000478c:	8b 48 04             	mov    0x4(%eax),%ecx
c000478f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004792:	8b 48 08             	mov    0x8(%eax),%ecx
c0004795:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004798:	8b 48 0c             	mov    0xc(%eax),%ecx
c000479b:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000479e:	8b 48 10             	mov    0x10(%eax),%ecx
c00047a1:	89 4a 10             	mov    %ecx,0x10(%edx)
c00047a4:	8b 48 14             	mov    0x14(%eax),%ecx
c00047a7:	89 4a 14             	mov    %ecx,0x14(%edx)
c00047aa:	8b 48 18             	mov    0x18(%eax),%ecx
c00047ad:	89 4a 18             	mov    %ecx,0x18(%edx)
c00047b0:	8b 48 1c             	mov    0x1c(%eax),%ecx
c00047b3:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c00047b6:	8b 48 20             	mov    0x20(%eax),%ecx
c00047b9:	89 4a 20             	mov    %ecx,0x20(%edx)
c00047bc:	8b 40 24             	mov    0x24(%eax),%eax
c00047bf:	89 42 24             	mov    %eax,0x24(%edx)
c00047c2:	eb 0a                	jmp    c00047ce <sync_inode+0x8a>
c00047c4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00047c8:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00047cc:	7e 86                	jle    c0004754 <sync_inode+0x10>
c00047ce:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c00047d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00047d8:	8b 40 10             	mov    0x10(%eax),%eax
c00047db:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00047de:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00047e1:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00047e4:	b8 00 02 00 00       	mov    $0x200,%eax
c00047e9:	99                   	cltd   
c00047ea:	f7 7d f0             	idivl  -0x10(%ebp)
c00047ed:	89 c3                	mov    %eax,%ebx
c00047ef:	89 c8                	mov    %ecx,%eax
c00047f1:	99                   	cltd   
c00047f2:	f7 fb                	idiv   %ebx
c00047f4:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00047f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00047fa:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00047fd:	b8 00 02 00 00       	mov    $0x200,%eax
c0004802:	99                   	cltd   
c0004803:	f7 7d f0             	idivl  -0x10(%ebp)
c0004806:	89 c3                	mov    %eax,%ebx
c0004808:	89 c8                	mov    %ecx,%eax
c000480a:	99                   	cltd   
c000480b:	f7 fb                	idiv   %ebx
c000480d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004810:	8b 45 08             	mov    0x8(%ebp),%eax
c0004813:	8b 40 20             	mov    0x20(%eax),%eax
c0004816:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004819:	e8 0a 01 00 00       	call   c0004928 <get_super_block>
c000481e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004821:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004824:	8b 40 04             	mov    0x4(%eax),%eax
c0004827:	8d 50 02             	lea    0x2(%eax),%edx
c000482a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000482d:	8b 40 08             	mov    0x8(%eax),%eax
c0004830:	01 c2                	add    %eax,%edx
c0004832:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004835:	01 d0                	add    %edx,%eax
c0004837:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000483a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000483f:	83 ec 0c             	sub    $0xc,%esp
c0004842:	6a 07                	push   $0x7
c0004844:	68 00 02 00 00       	push   $0x200
c0004849:	50                   	push   %eax
c000484a:	ff 75 e0             	pushl  -0x20(%ebp)
c000484d:	ff 75 d8             	pushl  -0x28(%ebp)
c0004850:	e8 0e e3 ff ff       	call   c0002b63 <rd_wt>
c0004855:	83 c4 20             	add    $0x20,%esp
c0004858:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000485d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004860:	83 ec 04             	sub    $0x4,%esp
c0004863:	ff 75 f0             	pushl  -0x10(%ebp)
c0004866:	ff 75 08             	pushl  0x8(%ebp)
c0004869:	ff 75 d4             	pushl  -0x2c(%ebp)
c000486c:	e8 2d 33 00 00       	call   c0007b9e <Memcpy>
c0004871:	83 c4 10             	add    $0x10,%esp
c0004874:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004879:	83 ec 0c             	sub    $0xc,%esp
c000487c:	6a 0a                	push   $0xa
c000487e:	68 00 02 00 00       	push   $0x200
c0004883:	50                   	push   %eax
c0004884:	ff 75 e0             	pushl  -0x20(%ebp)
c0004887:	ff 75 d8             	pushl  -0x28(%ebp)
c000488a:	e8 d4 e2 ff ff       	call   c0002b63 <rd_wt>
c000488f:	83 c4 20             	add    $0x20,%esp
c0004892:	90                   	nop
c0004893:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004896:	c9                   	leave  
c0004897:	c3                   	ret    

c0004898 <put_inode>:
c0004898:	55                   	push   %ebp
c0004899:	89 e5                	mov    %esp,%ebp
c000489b:	83 ec 08             	sub    $0x8,%esp
c000489e:	8b 45 08             	mov    0x8(%ebp),%eax
c00048a1:	8b 40 24             	mov    0x24(%eax),%eax
c00048a4:	85 c0                	test   %eax,%eax
c00048a6:	7f 1c                	jg     c00048c4 <put_inode+0x2c>
c00048a8:	68 3f 05 00 00       	push   $0x53f
c00048ad:	68 64 b0 00 c0       	push   $0xc000b064
c00048b2:	68 64 b0 00 c0       	push   $0xc000b064
c00048b7:	68 3c b2 00 c0       	push   $0xc000b23c
c00048bc:	e8 b5 4d 00 00       	call   c0009676 <assertion_failure>
c00048c1:	83 c4 10             	add    $0x10,%esp
c00048c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00048c7:	8b 40 24             	mov    0x24(%eax),%eax
c00048ca:	8d 50 ff             	lea    -0x1(%eax),%edx
c00048cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00048d0:	89 50 24             	mov    %edx,0x24(%eax)
c00048d3:	90                   	nop
c00048d4:	c9                   	leave  
c00048d5:	c3                   	ret    

c00048d6 <do_close>:
c00048d6:	55                   	push   %ebp
c00048d7:	89 e5                	mov    %esp,%ebp
c00048d9:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00048de:	8b 55 08             	mov    0x8(%ebp),%edx
c00048e1:	83 c2 50             	add    $0x50,%edx
c00048e4:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00048e8:	8b 50 0c             	mov    0xc(%eax),%edx
c00048eb:	83 ea 01             	sub    $0x1,%edx
c00048ee:	89 50 0c             	mov    %edx,0xc(%eax)
c00048f1:	8b 40 0c             	mov    0xc(%eax),%eax
c00048f4:	85 c0                	test   %eax,%eax
c00048f6:	75 16                	jne    c000490e <do_close+0x38>
c00048f8:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00048fd:	8b 55 08             	mov    0x8(%ebp),%edx
c0004900:	83 c2 50             	add    $0x50,%edx
c0004903:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004907:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000490e:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004913:	8b 55 08             	mov    0x8(%ebp),%edx
c0004916:	83 c2 50             	add    $0x50,%edx
c0004919:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c0004920:	00 
c0004921:	b8 00 00 00 00       	mov    $0x0,%eax
c0004926:	5d                   	pop    %ebp
c0004927:	c3                   	ret    

c0004928 <get_super_block>:
c0004928:	55                   	push   %ebp
c0004929:	89 e5                	mov    %esp,%ebp
c000492b:	83 ec 08             	sub    $0x8,%esp
c000492e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004933:	83 ec 0c             	sub    $0xc,%esp
c0004936:	6a 07                	push   $0x7
c0004938:	68 00 02 00 00       	push   $0x200
c000493d:	50                   	push   %eax
c000493e:	6a 20                	push   $0x20
c0004940:	6a 01                	push   $0x1
c0004942:	e8 1c e2 ff ff       	call   c0002b63 <rd_wt>
c0004947:	83 c4 20             	add    $0x20,%esp
c000494a:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004950:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0004955:	8b 0a                	mov    (%edx),%ecx
c0004957:	89 08                	mov    %ecx,(%eax)
c0004959:	8b 4a 04             	mov    0x4(%edx),%ecx
c000495c:	89 48 04             	mov    %ecx,0x4(%eax)
c000495f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0004962:	89 48 08             	mov    %ecx,0x8(%eax)
c0004965:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004968:	89 48 0c             	mov    %ecx,0xc(%eax)
c000496b:	8b 4a 10             	mov    0x10(%edx),%ecx
c000496e:	89 48 10             	mov    %ecx,0x10(%eax)
c0004971:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004974:	89 48 14             	mov    %ecx,0x14(%eax)
c0004977:	8b 4a 18             	mov    0x18(%edx),%ecx
c000497a:	89 48 18             	mov    %ecx,0x18(%eax)
c000497d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0004980:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004983:	8b 52 20             	mov    0x20(%edx),%edx
c0004986:	89 50 20             	mov    %edx,0x20(%eax)
c0004989:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000498e:	c9                   	leave  
c000498f:	c3                   	ret    

c0004990 <check>:
c0004990:	55                   	push   %ebp
c0004991:	89 e5                	mov    %esp,%ebp
c0004993:	83 ec 10             	sub    $0x10,%esp
c0004996:	c7 45 fc 00 32 08 c0 	movl   $0xc0083200,-0x4(%ebp)
c000499d:	eb 2e                	jmp    c00049cd <check+0x3d>
c000499f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049a2:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00049a8:	85 c0                	test   %eax,%eax
c00049aa:	74 1a                	je     c00049c6 <check+0x36>
c00049ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049af:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00049b5:	83 f8 01             	cmp    $0x1,%eax
c00049b8:	74 0c                	je     c00049c6 <check+0x36>
c00049ba:	c7 05 a0 07 01 c0 02 	movl   $0x2802,0xc00107a0
c00049c1:	28 00 00 
c00049c4:	eb fe                	jmp    c00049c4 <check+0x34>
c00049c6:	81 45 fc b0 02 00 00 	addl   $0x2b0,-0x4(%ebp)
c00049cd:	b8 c0 3c 08 c0       	mov    $0xc0083cc0,%eax
c00049d2:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c00049d5:	72 c8                	jb     c000499f <check+0xf>
c00049d7:	90                   	nop
c00049d8:	c9                   	leave  
c00049d9:	c3                   	ret    

c00049da <schedule_process>:
c00049da:	55                   	push   %ebp
c00049db:	89 e5                	mov    %esp,%ebp
c00049dd:	83 ec 48             	sub    $0x48,%esp
c00049e0:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c00049e7:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c00049ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00049f5:	e8 ae ce ff ff       	call   c00018a8 <get_running_thread_pcb>
c00049fa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00049fd:	81 7d e8 00 40 23 c0 	cmpl   $0xc0234000,-0x18(%ebp)
c0004a04:	75 1b                	jne    c0004a21 <schedule_process+0x47>
c0004a06:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a09:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0004a0f:	83 f8 ff             	cmp    $0xffffffff,%eax
c0004a12:	74 0d                	je     c0004a21 <schedule_process+0x47>
c0004a14:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
c0004a1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004a1e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004a21:	81 7d e8 00 40 23 c0 	cmpl   $0xc0234000,-0x18(%ebp)
c0004a28:	75 0d                	jne    c0004a37 <schedule_process+0x5d>
c0004a2a:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%ebp)
c0004a31:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a34:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004a37:	83 ec 0c             	sub    $0xc,%esp
c0004a3a:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a3f:	e8 3f 5f 00 00       	call   c000a983 <isListEmpty>
c0004a44:	83 c4 10             	add    $0x10,%esp
c0004a47:	3c 01                	cmp    $0x1,%al
c0004a49:	0f 85 16 01 00 00    	jne    c0004b65 <schedule_process+0x18b>
c0004a4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a52:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004a58:	85 c0                	test   %eax,%eax
c0004a5a:	75 24                	jne    c0004a80 <schedule_process+0xa6>
c0004a5c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a62:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a65:	05 00 01 00 00       	add    $0x100,%eax
c0004a6a:	83 ec 08             	sub    $0x8,%esp
c0004a6d:	50                   	push   %eax
c0004a6e:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a73:	e8 08 60 00 00       	call   c000aa80 <appendToDoubleLinkList>
c0004a78:	83 c4 10             	add    $0x10,%esp
c0004a7b:	e9 75 02 00 00       	jmp    c0004cf5 <schedule_process+0x31b>
c0004a80:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a83:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a8a:	84 c0                	test   %al,%al
c0004a8c:	0f 85 63 02 00 00    	jne    c0004cf5 <schedule_process+0x31b>
c0004a92:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a95:	05 00 01 00 00       	add    $0x100,%eax
c0004a9a:	83 ec 08             	sub    $0x8,%esp
c0004a9d:	50                   	push   %eax
c0004a9e:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004aa3:	e8 d8 5f 00 00       	call   c000aa80 <appendToDoubleLinkList>
c0004aa8:	83 c4 10             	add    $0x10,%esp
c0004aab:	83 ec 0c             	sub    $0xc,%esp
c0004aae:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004ab3:	e8 32 61 00 00       	call   c000abea <popFromDoubleLinkList>
c0004ab8:	83 c4 10             	add    $0x10,%esp
c0004abb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004abe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004ac1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004ac6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004ac9:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004acd:	0f 84 22 02 00 00    	je     c0004cf5 <schedule_process+0x31b>
c0004ad3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004ad6:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004adc:	85 c0                	test   %eax,%eax
c0004ade:	75 70                	jne    c0004b50 <schedule_process+0x176>
c0004ae0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004ae3:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004aea:	83 ec 0c             	sub    $0xc,%esp
c0004aed:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004af2:	e8 8c 5e 00 00       	call   c000a983 <isListEmpty>
c0004af7:	83 c4 10             	add    $0x10,%esp
c0004afa:	84 c0                	test   %al,%al
c0004afc:	75 3d                	jne    c0004b3b <schedule_process+0x161>
c0004afe:	83 ec 0c             	sub    $0xc,%esp
c0004b01:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b06:	e8 df 60 00 00       	call   c000abea <popFromDoubleLinkList>
c0004b0b:	83 c4 10             	add    $0x10,%esp
c0004b0e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004b11:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004b14:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004b19:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004b1c:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004b20:	0f 84 cf 01 00 00    	je     c0004cf5 <schedule_process+0x31b>
c0004b26:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004b29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b2f:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b36:	e9 ba 01 00 00       	jmp    c0004cf5 <schedule_process+0x31b>
c0004b3b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004b3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b44:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b4b:	e9 a5 01 00 00       	jmp    c0004cf5 <schedule_process+0x31b>
c0004b50:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004b53:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b59:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b60:	e9 90 01 00 00       	jmp    c0004cf5 <schedule_process+0x31b>
c0004b65:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b68:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004b6f:	84 c0                	test   %al,%al
c0004b71:	0f 85 d3 00 00 00    	jne    c0004c4a <schedule_process+0x270>
c0004b77:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b7a:	05 00 01 00 00       	add    $0x100,%eax
c0004b7f:	83 ec 08             	sub    $0x8,%esp
c0004b82:	50                   	push   %eax
c0004b83:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b88:	e8 f3 5e 00 00       	call   c000aa80 <appendToDoubleLinkList>
c0004b8d:	83 c4 10             	add    $0x10,%esp
c0004b90:	83 ec 0c             	sub    $0xc,%esp
c0004b93:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b98:	e8 4d 60 00 00       	call   c000abea <popFromDoubleLinkList>
c0004b9d:	83 c4 10             	add    $0x10,%esp
c0004ba0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004ba3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0004ba6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004bab:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004bae:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
c0004bb2:	0f 84 3d 01 00 00    	je     c0004cf5 <schedule_process+0x31b>
c0004bb8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004bbb:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004bc1:	85 c0                	test   %eax,%eax
c0004bc3:	75 70                	jne    c0004c35 <schedule_process+0x25b>
c0004bc5:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004bc8:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004bcf:	83 ec 0c             	sub    $0xc,%esp
c0004bd2:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004bd7:	e8 a7 5d 00 00       	call   c000a983 <isListEmpty>
c0004bdc:	83 c4 10             	add    $0x10,%esp
c0004bdf:	84 c0                	test   %al,%al
c0004be1:	75 3d                	jne    c0004c20 <schedule_process+0x246>
c0004be3:	83 ec 0c             	sub    $0xc,%esp
c0004be6:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004beb:	e8 fa 5f 00 00       	call   c000abea <popFromDoubleLinkList>
c0004bf0:	83 c4 10             	add    $0x10,%esp
c0004bf3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004bf6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0004bf9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004bfe:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004c01:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
c0004c05:	0f 84 ea 00 00 00    	je     c0004cf5 <schedule_process+0x31b>
c0004c0b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c14:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c1b:	e9 d5 00 00 00       	jmp    c0004cf5 <schedule_process+0x31b>
c0004c20:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c23:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c29:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c30:	e9 c0 00 00 00       	jmp    c0004cf5 <schedule_process+0x31b>
c0004c35:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c3e:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c45:	e9 ab 00 00 00       	jmp    c0004cf5 <schedule_process+0x31b>
c0004c4a:	83 ec 0c             	sub    $0xc,%esp
c0004c4d:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c52:	e8 93 5f 00 00       	call   c000abea <popFromDoubleLinkList>
c0004c57:	83 c4 10             	add    $0x10,%esp
c0004c5a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004c5d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004c60:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004c65:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004c68:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
c0004c6c:	0f 84 83 00 00 00    	je     c0004cf5 <schedule_process+0x31b>
c0004c72:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004c75:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004c7b:	85 c0                	test   %eax,%eax
c0004c7d:	75 66                	jne    c0004ce5 <schedule_process+0x30b>
c0004c7f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004c82:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004c89:	83 ec 0c             	sub    $0xc,%esp
c0004c8c:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c91:	e8 ed 5c 00 00       	call   c000a983 <isListEmpty>
c0004c96:	83 c4 10             	add    $0x10,%esp
c0004c99:	84 c0                	test   %al,%al
c0004c9b:	75 36                	jne    c0004cd3 <schedule_process+0x2f9>
c0004c9d:	83 ec 0c             	sub    $0xc,%esp
c0004ca0:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004ca5:	e8 40 5f 00 00       	call   c000abea <popFromDoubleLinkList>
c0004caa:	83 c4 10             	add    $0x10,%esp
c0004cad:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004cb0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004cb3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004cb8:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004cbb:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
c0004cbf:	74 34                	je     c0004cf5 <schedule_process+0x31b>
c0004cc1:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004cc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cca:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004cd1:	eb 22                	jmp    c0004cf5 <schedule_process+0x31b>
c0004cd3:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004cd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cdc:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004ce3:	eb 10                	jmp    c0004cf5 <schedule_process+0x31b>
c0004ce5:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004ce8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004ceb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cee:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004cf5:	0f b6 05 f0 1e 01 c0 	movzbl 0xc0011ef0,%eax
c0004cfc:	84 c0                	test   %al,%al
c0004cfe:	75 1b                	jne    c0004d1b <schedule_process+0x341>
c0004d00:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d04:	74 15                	je     c0004d1b <schedule_process+0x341>
c0004d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d09:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d0f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0004d12:	77 07                	ja     c0004d1b <schedule_process+0x341>
c0004d14:	c6 05 f0 1e 01 c0 01 	movb   $0x1,0xc0011ef0
c0004d1b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d1f:	75 41                	jne    c0004d62 <schedule_process+0x388>
c0004d21:	90                   	nop
c0004d22:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d26:	74 26                	je     c0004d4e <schedule_process+0x374>
c0004d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d2b:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d31:	85 c0                	test   %eax,%eax
c0004d33:	74 19                	je     c0004d4e <schedule_process+0x374>
c0004d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d38:	05 00 01 00 00       	add    $0x100,%eax
c0004d3d:	83 ec 08             	sub    $0x8,%esp
c0004d40:	50                   	push   %eax
c0004d41:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004d46:	e8 35 5d 00 00       	call   c000aa80 <appendToDoubleLinkList>
c0004d4b:	83 c4 10             	add    $0x10,%esp
c0004d4e:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c0004d53:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d59:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004d60:	eb 01                	jmp    c0004d63 <schedule_process+0x389>
c0004d62:	90                   	nop
c0004d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d66:	8b 40 08             	mov    0x8(%eax),%eax
c0004d69:	85 c0                	test   %eax,%eax
c0004d6b:	74 23                	je     c0004d90 <schedule_process+0x3b6>
c0004d6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d70:	83 ec 0c             	sub    $0xc,%esp
c0004d73:	50                   	push   %eax
c0004d74:	e8 1e cb ff ff       	call   c0001897 <update_tss>
c0004d79:	83 c4 10             	add    $0x10,%esp
c0004d7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d7f:	8b 40 08             	mov    0x8(%eax),%eax
c0004d82:	83 ec 0c             	sub    $0xc,%esp
c0004d85:	50                   	push   %eax
c0004d86:	e8 ff ca ff ff       	call   c000188a <update_cr3>
c0004d8b:	83 c4 10             	add    $0x10,%esp
c0004d8e:	eb 0f                	jmp    c0004d9f <schedule_process+0x3c5>
c0004d90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004d93:	83 ec 0c             	sub    $0xc,%esp
c0004d96:	50                   	push   %eax
c0004d97:	e8 ee ca ff ff       	call   c000188a <update_cr3>
c0004d9c:	83 c4 10             	add    $0x10,%esp
c0004d9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004da2:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004da7:	81 7d f4 00 40 23 c0 	cmpl   $0xc0234000,-0xc(%ebp)
c0004dae:	75 1b                	jne    c0004dcb <schedule_process+0x3f1>
c0004db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004db3:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0004db9:	83 f8 ff             	cmp    $0xffffffff,%eax
c0004dbc:	74 0d                	je     c0004dcb <schedule_process+0x3f1>
c0004dbe:	c7 45 bc 04 00 00 00 	movl   $0x4,-0x44(%ebp)
c0004dc5:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004dc8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0004dcb:	83 ec 08             	sub    $0x8,%esp
c0004dce:	ff 75 f4             	pushl  -0xc(%ebp)
c0004dd1:	ff 75 e8             	pushl  -0x18(%ebp)
c0004dd4:	e8 67 5b 00 00       	call   c000a940 <switch_to>
c0004dd9:	83 c4 10             	add    $0x10,%esp
c0004ddc:	90                   	nop
c0004ddd:	c9                   	leave  
c0004dde:	c3                   	ret    

c0004ddf <clock_handler>:
c0004ddf:	55                   	push   %ebp
c0004de0:	89 e5                	mov    %esp,%ebp
c0004de2:	83 ec 08             	sub    $0x8,%esp
c0004de5:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c0004dea:	85 c0                	test   %eax,%eax
c0004dec:	74 0d                	je     c0004dfb <clock_handler+0x1c>
c0004dee:	83 ec 0c             	sub    $0xc,%esp
c0004df1:	6a 04                	push   $0x4
c0004df3:	e8 7d 53 00 00       	call   c000a175 <inform_int>
c0004df8:	83 c4 10             	add    $0x10,%esp
c0004dfb:	e8 da fb ff ff       	call   c00049da <schedule_process>
c0004e00:	90                   	nop
c0004e01:	c9                   	leave  
c0004e02:	c3                   	ret    

c0004e03 <pid2proc>:
c0004e03:	55                   	push   %ebp
c0004e04:	89 e5                	mov    %esp,%ebp
c0004e06:	83 ec 20             	sub    $0x20,%esp
c0004e09:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004e10:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c0004e15:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c0004e1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004e1e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004e21:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c0004e26:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c0004e2c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004e2f:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004e32:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0004e37:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004e3a:	eb 29                	jmp    c0004e65 <pid2proc+0x62>
c0004e3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004e3f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004e44:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004e47:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004e4a:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004e50:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e53:	39 c2                	cmp    %eax,%edx
c0004e55:	75 05                	jne    c0004e5c <pid2proc+0x59>
c0004e57:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004e5a:	eb 17                	jmp    c0004e73 <pid2proc+0x70>
c0004e5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004e5f:	8b 40 04             	mov    0x4(%eax),%eax
c0004e62:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004e65:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004e6c:	75 ce                	jne    c0004e3c <pid2proc+0x39>
c0004e6e:	b8 00 00 00 00       	mov    $0x0,%eax
c0004e73:	c9                   	leave  
c0004e74:	c3                   	ret    

c0004e75 <proc2pid>:
c0004e75:	55                   	push   %ebp
c0004e76:	89 e5                	mov    %esp,%ebp
c0004e78:	83 ec 10             	sub    $0x10,%esp
c0004e7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e7e:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004e84:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004e87:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004e8a:	c9                   	leave  
c0004e8b:	c3                   	ret    

c0004e8c <InitDescriptor>:
c0004e8c:	55                   	push   %ebp
c0004e8d:	89 e5                	mov    %esp,%ebp
c0004e8f:	83 ec 04             	sub    $0x4,%esp
c0004e92:	8b 45 14             	mov    0x14(%ebp),%eax
c0004e95:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004e99:	8b 45 10             	mov    0x10(%ebp),%eax
c0004e9c:	89 c2                	mov    %eax,%edx
c0004e9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea1:	66 89 10             	mov    %dx,(%eax)
c0004ea4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ea7:	89 c2                	mov    %eax,%edx
c0004ea9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eac:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004eb0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004eb3:	c1 e8 10             	shr    $0x10,%eax
c0004eb6:	89 c2                	mov    %eax,%edx
c0004eb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ebb:	88 50 04             	mov    %dl,0x4(%eax)
c0004ebe:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ec2:	89 c2                	mov    %eax,%edx
c0004ec4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec7:	88 50 05             	mov    %dl,0x5(%eax)
c0004eca:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ece:	66 c1 e8 08          	shr    $0x8,%ax
c0004ed2:	c1 e0 04             	shl    $0x4,%eax
c0004ed5:	89 c2                	mov    %eax,%edx
c0004ed7:	8b 45 10             	mov    0x10(%ebp),%eax
c0004eda:	c1 e8 10             	shr    $0x10,%eax
c0004edd:	83 e0 0f             	and    $0xf,%eax
c0004ee0:	09 c2                	or     %eax,%edx
c0004ee2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ee5:	88 50 06             	mov    %dl,0x6(%eax)
c0004ee8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004eeb:	c1 e8 18             	shr    $0x18,%eax
c0004eee:	89 c2                	mov    %eax,%edx
c0004ef0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef3:	88 50 07             	mov    %dl,0x7(%eax)
c0004ef6:	90                   	nop
c0004ef7:	c9                   	leave  
c0004ef8:	c3                   	ret    

c0004ef9 <Seg2PhyAddr>:
c0004ef9:	55                   	push   %ebp
c0004efa:	89 e5                	mov    %esp,%ebp
c0004efc:	83 ec 10             	sub    $0x10,%esp
c0004eff:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f02:	c1 e8 03             	shr    $0x3,%eax
c0004f05:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c0004f0c:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c0004f13:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f16:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004f19:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004f1d:	0f b7 c0             	movzwl %ax,%eax
c0004f20:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004f24:	0f b6 d2             	movzbl %dl,%edx
c0004f27:	c1 e2 10             	shl    $0x10,%edx
c0004f2a:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004f30:	09 d0                	or     %edx,%eax
c0004f32:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004f35:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f38:	c9                   	leave  
c0004f39:	c3                   	ret    

c0004f3a <Seg2PhyAddrLDT>:
c0004f3a:	55                   	push   %ebp
c0004f3b:	89 e5                	mov    %esp,%ebp
c0004f3d:	83 ec 10             	sub    $0x10,%esp
c0004f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f43:	c1 e8 03             	shr    $0x3,%eax
c0004f46:	89 c2                	mov    %eax,%edx
c0004f48:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f4b:	83 c2 22             	add    $0x22,%edx
c0004f4e:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004f52:	8b 02                	mov    (%edx),%eax
c0004f54:	8b 52 04             	mov    0x4(%edx),%edx
c0004f57:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f5a:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004f5d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004f61:	0f b7 c0             	movzwl %ax,%eax
c0004f64:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004f68:	0f b6 d2             	movzbl %dl,%edx
c0004f6b:	c1 e2 10             	shl    $0x10,%edx
c0004f6e:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004f74:	09 d0                	or     %edx,%eax
c0004f76:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004f79:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f7c:	c9                   	leave  
c0004f7d:	c3                   	ret    

c0004f7e <VirAddr2PhyAddr>:
c0004f7e:	55                   	push   %ebp
c0004f7f:	89 e5                	mov    %esp,%ebp
c0004f81:	83 ec 10             	sub    $0x10,%esp
c0004f84:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004f87:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f8a:	01 d0                	add    %edx,%eax
c0004f8c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004f8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f92:	c9                   	leave  
c0004f93:	c3                   	ret    

c0004f94 <v2l>:
c0004f94:	55                   	push   %ebp
c0004f95:	89 e5                	mov    %esp,%ebp
c0004f97:	83 ec 18             	sub    $0x18,%esp
c0004f9a:	83 ec 0c             	sub    $0xc,%esp
c0004f9d:	ff 75 08             	pushl  0x8(%ebp)
c0004fa0:	e8 5e fe ff ff       	call   c0004e03 <pid2proc>
c0004fa5:	83 c4 10             	add    $0x10,%esp
c0004fa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004fab:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004fb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004fb5:	83 ec 08             	sub    $0x8,%esp
c0004fb8:	ff 75 f4             	pushl  -0xc(%ebp)
c0004fbb:	50                   	push   %eax
c0004fbc:	e8 79 ff ff ff       	call   c0004f3a <Seg2PhyAddrLDT>
c0004fc1:	83 c4 10             	add    $0x10,%esp
c0004fc4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004fc7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004fca:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004fcd:	01 d0                	add    %edx,%eax
c0004fcf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004fd2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004fd5:	c9                   	leave  
c0004fd6:	c3                   	ret    

c0004fd7 <init_propt>:
c0004fd7:	55                   	push   %ebp
c0004fd8:	89 e5                	mov    %esp,%ebp
c0004fda:	83 ec 28             	sub    $0x28,%esp
c0004fdd:	6a 0e                	push   $0xe
c0004fdf:	6a 08                	push   $0x8
c0004fe1:	68 6a 16 00 c0       	push   $0xc000166a
c0004fe6:	6a 20                	push   $0x20
c0004fe8:	e8 18 01 00 00       	call   c0005105 <InitInterruptDesc>
c0004fed:	83 c4 10             	add    $0x10,%esp
c0004ff0:	6a 0e                	push   $0xe
c0004ff2:	6a 08                	push   $0x8
c0004ff4:	68 97 16 00 c0       	push   $0xc0001697
c0004ff9:	6a 21                	push   $0x21
c0004ffb:	e8 05 01 00 00       	call   c0005105 <InitInterruptDesc>
c0005000:	83 c4 10             	add    $0x10,%esp
c0005003:	6a 0e                	push   $0xe
c0005005:	6a 08                	push   $0x8
c0005007:	68 d9 16 00 c0       	push   $0xc00016d9
c000500c:	6a 2e                	push   $0x2e
c000500e:	e8 f2 00 00 00       	call   c0005105 <InitInterruptDesc>
c0005013:	83 c4 10             	add    $0x10,%esp
c0005016:	83 ec 04             	sub    $0x4,%esp
c0005019:	68 80 15 00 00       	push   $0x1580
c000501e:	6a 00                	push   $0x0
c0005020:	68 00 32 08 c0       	push   $0xc0083200
c0005025:	e8 75 6a 00 00       	call   c000ba9f <Memset>
c000502a:	83 c4 10             	add    $0x10,%esp
c000502d:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005034:	83 ec 04             	sub    $0x4,%esp
c0005037:	ff 75 f4             	pushl  -0xc(%ebp)
c000503a:	6a 00                	push   $0x0
c000503c:	68 40 16 01 c0       	push   $0xc0011640
c0005041:	e8 59 6a 00 00       	call   c000ba9f <Memset>
c0005046:	83 c4 10             	add    $0x10,%esp
c0005049:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000504c:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c0005051:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0005058:	00 00 00 
c000505b:	83 ec 0c             	sub    $0xc,%esp
c000505e:	6a 30                	push   $0x30
c0005060:	e8 94 fe ff ff       	call   c0004ef9 <Seg2PhyAddr>
c0005065:	83 c4 10             	add    $0x10,%esp
c0005068:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000506b:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c0005072:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0005079:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000507c:	0f b7 d0             	movzwl %ax,%edx
c000507f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005082:	83 e8 01             	sub    $0x1,%eax
c0005085:	89 c1                	mov    %eax,%ecx
c0005087:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000508a:	52                   	push   %edx
c000508b:	51                   	push   %ecx
c000508c:	50                   	push   %eax
c000508d:	68 00 08 01 c0       	push   $0xc0010800
c0005092:	e8 f5 fd ff ff       	call   c0004e8c <InitDescriptor>
c0005097:	83 c4 10             	add    $0x10,%esp
c000509a:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c00050a1:	68 f2 00 00 00       	push   $0xf2
c00050a6:	68 ff ff 00 00       	push   $0xffff
c00050ab:	ff 75 e4             	pushl  -0x1c(%ebp)
c00050ae:	68 f8 07 01 c0       	push   $0xc00107f8
c00050b3:	e8 d4 fd ff ff       	call   c0004e8c <InitDescriptor>
c00050b8:	83 c4 10             	add    $0x10,%esp
c00050bb:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c00050c2:	c7 45 dc ba 0c 00 00 	movl   $0xcba,-0x24(%ebp)
c00050c9:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c00050d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00050d3:	0f b7 c0             	movzwl %ax,%eax
c00050d6:	50                   	push   %eax
c00050d7:	ff 75 d8             	pushl  -0x28(%ebp)
c00050da:	6a 00                	push   $0x0
c00050dc:	68 08 08 01 c0       	push   $0xc0010808
c00050e1:	e8 a6 fd ff ff       	call   c0004e8c <InitDescriptor>
c00050e6:	83 c4 10             	add    $0x10,%esp
c00050e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00050ec:	0f b7 c0             	movzwl %ax,%eax
c00050ef:	50                   	push   %eax
c00050f0:	ff 75 d8             	pushl  -0x28(%ebp)
c00050f3:	6a 00                	push   $0x0
c00050f5:	68 10 08 01 c0       	push   $0xc0010810
c00050fa:	e8 8d fd ff ff       	call   c0004e8c <InitDescriptor>
c00050ff:	83 c4 10             	add    $0x10,%esp
c0005102:	90                   	nop
c0005103:	c9                   	leave  
c0005104:	c3                   	ret    

c0005105 <InitInterruptDesc>:
c0005105:	55                   	push   %ebp
c0005106:	89 e5                	mov    %esp,%ebp
c0005108:	83 ec 10             	sub    $0x10,%esp
c000510b:	8b 45 08             	mov    0x8(%ebp),%eax
c000510e:	c1 e0 03             	shl    $0x3,%eax
c0005111:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c0005116:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005119:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000511c:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0005120:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005123:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0005126:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005129:	89 c2                	mov    %eax,%edx
c000512b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000512e:	66 89 10             	mov    %dx,(%eax)
c0005131:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005134:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c000513a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000513d:	c1 f8 10             	sar    $0x10,%eax
c0005140:	89 c2                	mov    %eax,%edx
c0005142:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005145:	66 89 50 06          	mov    %dx,0x6(%eax)
c0005149:	8b 45 10             	mov    0x10(%ebp),%eax
c000514c:	c1 e0 04             	shl    $0x4,%eax
c000514f:	89 c2                	mov    %eax,%edx
c0005151:	8b 45 14             	mov    0x14(%ebp),%eax
c0005154:	09 d0                	or     %edx,%eax
c0005156:	89 c2                	mov    %eax,%edx
c0005158:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000515b:	88 50 05             	mov    %dl,0x5(%eax)
c000515e:	90                   	nop
c000515f:	c9                   	leave  
c0005160:	c3                   	ret    

c0005161 <ReloadGDT>:
c0005161:	55                   	push   %ebp
c0005162:	89 e5                	mov    %esp,%ebp
c0005164:	83 ec 28             	sub    $0x28,%esp
c0005167:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c000516c:	0f b7 00             	movzwl (%eax),%eax
c000516f:	98                   	cwtl   
c0005170:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0005175:	8b 12                	mov    (%edx),%edx
c0005177:	83 ec 04             	sub    $0x4,%esp
c000517a:	50                   	push   %eax
c000517b:	52                   	push   %edx
c000517c:	68 c0 07 01 c0       	push   $0xc00107c0
c0005181:	e8 eb 68 00 00       	call   c000ba71 <Memcpy2>
c0005186:	83 c4 10             	add    $0x10,%esp
c0005189:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c0005190:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0005197:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000519a:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c000519f:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c00051a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00051a7:	89 10                	mov    %edx,(%eax)
c00051a9:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c00051b0:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c00051b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00051ba:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c00051bf:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c00051c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00051c7:	89 10                	mov    %edx,(%eax)
c00051c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00051d0:	eb 04                	jmp    c00051d6 <ReloadGDT+0x75>
c00051d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00051d6:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00051dd:	7e f3                	jle    c00051d2 <ReloadGDT+0x71>
c00051df:	e8 75 31 00 00       	call   c0008359 <init_internal_interrupt>
c00051e4:	e8 ee fd ff ff       	call   c0004fd7 <init_propt>
c00051e9:	90                   	nop
c00051ea:	c9                   	leave  
c00051eb:	c3                   	ret    

c00051ec <select_console>:
c00051ec:	55                   	push   %ebp
c00051ed:	89 e5                	mov    %esp,%ebp
c00051ef:	83 ec 18             	sub    $0x18,%esp
c00051f2:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f5:	88 45 f4             	mov    %al,-0xc(%ebp)
c00051f8:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c00051fc:	75 27                	jne    c0005225 <select_console+0x39>
c00051fe:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0005202:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0005208:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c000520d:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c0005212:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005217:	83 ec 0c             	sub    $0xc,%esp
c000521a:	50                   	push   %eax
c000521b:	e8 08 00 00 00       	call   c0005228 <flush>
c0005220:	83 c4 10             	add    $0x10,%esp
c0005223:	eb 01                	jmp    c0005226 <select_console+0x3a>
c0005225:	90                   	nop
c0005226:	c9                   	leave  
c0005227:	c3                   	ret    

c0005228 <flush>:
c0005228:	55                   	push   %ebp
c0005229:	89 e5                	mov    %esp,%ebp
c000522b:	83 ec 08             	sub    $0x8,%esp
c000522e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005231:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005237:	8b 40 0c             	mov    0xc(%eax),%eax
c000523a:	83 ec 0c             	sub    $0xc,%esp
c000523d:	50                   	push   %eax
c000523e:	e8 1e 00 00 00       	call   c0005261 <set_cursor>
c0005243:	83 c4 10             	add    $0x10,%esp
c0005246:	8b 45 08             	mov    0x8(%ebp),%eax
c0005249:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000524f:	8b 40 08             	mov    0x8(%eax),%eax
c0005252:	83 ec 0c             	sub    $0xc,%esp
c0005255:	50                   	push   %eax
c0005256:	e8 64 00 00 00       	call   c00052bf <set_console_start_video_addr>
c000525b:	83 c4 10             	add    $0x10,%esp
c000525e:	90                   	nop
c000525f:	c9                   	leave  
c0005260:	c3                   	ret    

c0005261 <set_cursor>:
c0005261:	55                   	push   %ebp
c0005262:	89 e5                	mov    %esp,%ebp
c0005264:	83 ec 08             	sub    $0x8,%esp
c0005267:	83 ec 08             	sub    $0x8,%esp
c000526a:	6a 0e                	push   $0xe
c000526c:	68 d4 03 00 00       	push   $0x3d4
c0005271:	e8 32 c5 ff ff       	call   c00017a8 <out_byte>
c0005276:	83 c4 10             	add    $0x10,%esp
c0005279:	8b 45 08             	mov    0x8(%ebp),%eax
c000527c:	c1 e8 08             	shr    $0x8,%eax
c000527f:	0f b7 c0             	movzwl %ax,%eax
c0005282:	83 ec 08             	sub    $0x8,%esp
c0005285:	50                   	push   %eax
c0005286:	68 d5 03 00 00       	push   $0x3d5
c000528b:	e8 18 c5 ff ff       	call   c00017a8 <out_byte>
c0005290:	83 c4 10             	add    $0x10,%esp
c0005293:	83 ec 08             	sub    $0x8,%esp
c0005296:	6a 0f                	push   $0xf
c0005298:	68 d4 03 00 00       	push   $0x3d4
c000529d:	e8 06 c5 ff ff       	call   c00017a8 <out_byte>
c00052a2:	83 c4 10             	add    $0x10,%esp
c00052a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a8:	0f b7 c0             	movzwl %ax,%eax
c00052ab:	83 ec 08             	sub    $0x8,%esp
c00052ae:	50                   	push   %eax
c00052af:	68 d5 03 00 00       	push   $0x3d5
c00052b4:	e8 ef c4 ff ff       	call   c00017a8 <out_byte>
c00052b9:	83 c4 10             	add    $0x10,%esp
c00052bc:	90                   	nop
c00052bd:	c9                   	leave  
c00052be:	c3                   	ret    

c00052bf <set_console_start_video_addr>:
c00052bf:	55                   	push   %ebp
c00052c0:	89 e5                	mov    %esp,%ebp
c00052c2:	83 ec 08             	sub    $0x8,%esp
c00052c5:	83 ec 08             	sub    $0x8,%esp
c00052c8:	6a 0c                	push   $0xc
c00052ca:	68 d4 03 00 00       	push   $0x3d4
c00052cf:	e8 d4 c4 ff ff       	call   c00017a8 <out_byte>
c00052d4:	83 c4 10             	add    $0x10,%esp
c00052d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052da:	c1 e8 08             	shr    $0x8,%eax
c00052dd:	0f b7 c0             	movzwl %ax,%eax
c00052e0:	83 ec 08             	sub    $0x8,%esp
c00052e3:	50                   	push   %eax
c00052e4:	68 d5 03 00 00       	push   $0x3d5
c00052e9:	e8 ba c4 ff ff       	call   c00017a8 <out_byte>
c00052ee:	83 c4 10             	add    $0x10,%esp
c00052f1:	83 ec 08             	sub    $0x8,%esp
c00052f4:	6a 0d                	push   $0xd
c00052f6:	68 d4 03 00 00       	push   $0x3d4
c00052fb:	e8 a8 c4 ff ff       	call   c00017a8 <out_byte>
c0005300:	83 c4 10             	add    $0x10,%esp
c0005303:	8b 45 08             	mov    0x8(%ebp),%eax
c0005306:	0f b7 c0             	movzwl %ax,%eax
c0005309:	83 ec 08             	sub    $0x8,%esp
c000530c:	50                   	push   %eax
c000530d:	68 d5 03 00 00       	push   $0x3d5
c0005312:	e8 91 c4 ff ff       	call   c00017a8 <out_byte>
c0005317:	83 c4 10             	add    $0x10,%esp
c000531a:	90                   	nop
c000531b:	c9                   	leave  
c000531c:	c3                   	ret    

c000531d <put_key>:
c000531d:	55                   	push   %ebp
c000531e:	89 e5                	mov    %esp,%ebp
c0005320:	83 ec 04             	sub    $0x4,%esp
c0005323:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005326:	88 45 fc             	mov    %al,-0x4(%ebp)
c0005329:	8b 45 08             	mov    0x8(%ebp),%eax
c000532c:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005332:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005337:	77 4d                	ja     c0005386 <put_key+0x69>
c0005339:	8b 45 08             	mov    0x8(%ebp),%eax
c000533c:	8b 00                	mov    (%eax),%eax
c000533e:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0005342:	89 10                	mov    %edx,(%eax)
c0005344:	8b 45 08             	mov    0x8(%ebp),%eax
c0005347:	8b 00                	mov    (%eax),%eax
c0005349:	8d 50 04             	lea    0x4(%eax),%edx
c000534c:	8b 45 08             	mov    0x8(%ebp),%eax
c000534f:	89 10                	mov    %edx,(%eax)
c0005351:	8b 45 08             	mov    0x8(%ebp),%eax
c0005354:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000535a:	8d 50 01             	lea    0x1(%eax),%edx
c000535d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005360:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005366:	8b 45 08             	mov    0x8(%ebp),%eax
c0005369:	8b 00                	mov    (%eax),%eax
c000536b:	8b 55 08             	mov    0x8(%ebp),%edx
c000536e:	83 c2 08             	add    $0x8,%edx
c0005371:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005377:	39 d0                	cmp    %edx,%eax
c0005379:	75 0b                	jne    c0005386 <put_key+0x69>
c000537b:	8b 45 08             	mov    0x8(%ebp),%eax
c000537e:	8d 50 08             	lea    0x8(%eax),%edx
c0005381:	8b 45 08             	mov    0x8(%ebp),%eax
c0005384:	89 10                	mov    %edx,(%eax)
c0005386:	90                   	nop
c0005387:	c9                   	leave  
c0005388:	c3                   	ret    

c0005389 <scroll_up>:
c0005389:	55                   	push   %ebp
c000538a:	89 e5                	mov    %esp,%ebp
c000538c:	83 ec 08             	sub    $0x8,%esp
c000538f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005392:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005398:	8b 40 08             	mov    0x8(%eax),%eax
c000539b:	8d 50 b0             	lea    -0x50(%eax),%edx
c000539e:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053a7:	8b 00                	mov    (%eax),%eax
c00053a9:	39 c2                	cmp    %eax,%edx
c00053ab:	76 1b                	jbe    c00053c8 <scroll_up+0x3f>
c00053ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053b6:	8b 40 08             	mov    0x8(%eax),%eax
c00053b9:	83 e8 50             	sub    $0x50,%eax
c00053bc:	83 ec 0c             	sub    $0xc,%esp
c00053bf:	50                   	push   %eax
c00053c0:	e8 fa fe ff ff       	call   c00052bf <set_console_start_video_addr>
c00053c5:	83 c4 10             	add    $0x10,%esp
c00053c8:	90                   	nop
c00053c9:	c9                   	leave  
c00053ca:	c3                   	ret    

c00053cb <scroll_down>:
c00053cb:	55                   	push   %ebp
c00053cc:	89 e5                	mov    %esp,%ebp
c00053ce:	83 ec 08             	sub    $0x8,%esp
c00053d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053da:	8b 40 08             	mov    0x8(%eax),%eax
c00053dd:	8d 48 50             	lea    0x50(%eax),%ecx
c00053e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00053e3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053e9:	8b 10                	mov    (%eax),%edx
c00053eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ee:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053f4:	8b 40 04             	mov    0x4(%eax),%eax
c00053f7:	01 d0                	add    %edx,%eax
c00053f9:	39 c1                	cmp    %eax,%ecx
c00053fb:	73 36                	jae    c0005433 <scroll_down+0x68>
c00053fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005400:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005406:	8b 40 08             	mov    0x8(%eax),%eax
c0005409:	83 c0 50             	add    $0x50,%eax
c000540c:	83 ec 0c             	sub    $0xc,%esp
c000540f:	50                   	push   %eax
c0005410:	e8 aa fe ff ff       	call   c00052bf <set_console_start_video_addr>
c0005415:	83 c4 10             	add    $0x10,%esp
c0005418:	8b 45 08             	mov    0x8(%ebp),%eax
c000541b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005421:	8b 50 08             	mov    0x8(%eax),%edx
c0005424:	8b 45 08             	mov    0x8(%ebp),%eax
c0005427:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000542d:	83 c2 50             	add    $0x50,%edx
c0005430:	89 50 08             	mov    %edx,0x8(%eax)
c0005433:	90                   	nop
c0005434:	c9                   	leave  
c0005435:	c3                   	ret    

c0005436 <out_char>:
c0005436:	55                   	push   %ebp
c0005437:	89 e5                	mov    %esp,%ebp
c0005439:	83 ec 28             	sub    $0x28,%esp
c000543c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000543f:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0005442:	e8 f3 26 00 00       	call   c0007b3a <intr_disable>
c0005447:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000544a:	8b 45 08             	mov    0x8(%ebp),%eax
c000544d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005453:	8b 40 0c             	mov    0xc(%eax),%eax
c0005456:	05 00 c0 05 60       	add    $0x6005c000,%eax
c000545b:	01 c0                	add    %eax,%eax
c000545d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005460:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0005464:	83 f8 08             	cmp    $0x8,%eax
c0005467:	0f 84 8d 00 00 00    	je     c00054fa <out_char+0xc4>
c000546d:	83 f8 0a             	cmp    $0xa,%eax
c0005470:	0f 85 c9 00 00 00    	jne    c000553f <out_char+0x109>
c0005476:	8b 45 08             	mov    0x8(%ebp),%eax
c0005479:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000547f:	8b 50 0c             	mov    0xc(%eax),%edx
c0005482:	8b 45 08             	mov    0x8(%ebp),%eax
c0005485:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000548b:	8b 08                	mov    (%eax),%ecx
c000548d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005490:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005496:	8b 40 04             	mov    0x4(%eax),%eax
c0005499:	01 c8                	add    %ecx,%eax
c000549b:	83 e8 50             	sub    $0x50,%eax
c000549e:	39 c2                	cmp    %eax,%edx
c00054a0:	0f 83 f4 00 00 00    	jae    c000559a <out_char+0x164>
c00054a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00054a9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054af:	8b 08                	mov    (%eax),%ecx
c00054b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054ba:	8b 50 0c             	mov    0xc(%eax),%edx
c00054bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00054c0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054c6:	8b 00                	mov    (%eax),%eax
c00054c8:	29 c2                	sub    %eax,%edx
c00054ca:	89 d0                	mov    %edx,%eax
c00054cc:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00054d1:	f7 e2                	mul    %edx
c00054d3:	89 d0                	mov    %edx,%eax
c00054d5:	c1 e8 06             	shr    $0x6,%eax
c00054d8:	8d 50 01             	lea    0x1(%eax),%edx
c00054db:	89 d0                	mov    %edx,%eax
c00054dd:	c1 e0 02             	shl    $0x2,%eax
c00054e0:	01 d0                	add    %edx,%eax
c00054e2:	c1 e0 04             	shl    $0x4,%eax
c00054e5:	89 c2                	mov    %eax,%edx
c00054e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00054ea:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054f0:	01 ca                	add    %ecx,%edx
c00054f2:	89 50 0c             	mov    %edx,0xc(%eax)
c00054f5:	e9 a0 00 00 00       	jmp    c000559a <out_char+0x164>
c00054fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00054fd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005503:	8b 50 0c             	mov    0xc(%eax),%edx
c0005506:	8b 45 08             	mov    0x8(%ebp),%eax
c0005509:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000550f:	8b 00                	mov    (%eax),%eax
c0005511:	39 c2                	cmp    %eax,%edx
c0005513:	0f 86 84 00 00 00    	jbe    c000559d <out_char+0x167>
c0005519:	8b 45 08             	mov    0x8(%ebp),%eax
c000551c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005522:	8b 50 0c             	mov    0xc(%eax),%edx
c0005525:	83 ea 01             	sub    $0x1,%edx
c0005528:	89 50 0c             	mov    %edx,0xc(%eax)
c000552b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000552e:	83 e8 02             	sub    $0x2,%eax
c0005531:	c6 00 20             	movb   $0x20,(%eax)
c0005534:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005537:	83 e8 01             	sub    $0x1,%eax
c000553a:	c6 00 00             	movb   $0x0,(%eax)
c000553d:	eb 5e                	jmp    c000559d <out_char+0x167>
c000553f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005542:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005548:	8b 40 0c             	mov    0xc(%eax),%eax
c000554b:	8d 48 01             	lea    0x1(%eax),%ecx
c000554e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005551:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005557:	8b 10                	mov    (%eax),%edx
c0005559:	8b 45 08             	mov    0x8(%ebp),%eax
c000555c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005562:	8b 40 04             	mov    0x4(%eax),%eax
c0005565:	01 d0                	add    %edx,%eax
c0005567:	39 c1                	cmp    %eax,%ecx
c0005569:	73 35                	jae    c00055a0 <out_char+0x16a>
c000556b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000556e:	8d 50 01             	lea    0x1(%eax),%edx
c0005571:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005574:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0005578:	88 10                	mov    %dl,(%eax)
c000557a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000557d:	8d 50 01             	lea    0x1(%eax),%edx
c0005580:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005583:	c6 00 0a             	movb   $0xa,(%eax)
c0005586:	8b 45 08             	mov    0x8(%ebp),%eax
c0005589:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000558f:	8b 50 0c             	mov    0xc(%eax),%edx
c0005592:	83 c2 01             	add    $0x1,%edx
c0005595:	89 50 0c             	mov    %edx,0xc(%eax)
c0005598:	eb 06                	jmp    c00055a0 <out_char+0x16a>
c000559a:	90                   	nop
c000559b:	eb 14                	jmp    c00055b1 <out_char+0x17b>
c000559d:	90                   	nop
c000559e:	eb 11                	jmp    c00055b1 <out_char+0x17b>
c00055a0:	90                   	nop
c00055a1:	eb 0e                	jmp    c00055b1 <out_char+0x17b>
c00055a3:	83 ec 0c             	sub    $0xc,%esp
c00055a6:	ff 75 08             	pushl  0x8(%ebp)
c00055a9:	e8 1d fe ff ff       	call   c00053cb <scroll_down>
c00055ae:	83 c4 10             	add    $0x10,%esp
c00055b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00055b4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055ba:	8b 50 0c             	mov    0xc(%eax),%edx
c00055bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055c6:	8b 40 08             	mov    0x8(%eax),%eax
c00055c9:	29 c2                	sub    %eax,%edx
c00055cb:	89 d0                	mov    %edx,%eax
c00055cd:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00055d2:	77 cf                	ja     c00055a3 <out_char+0x16d>
c00055d4:	83 ec 0c             	sub    $0xc,%esp
c00055d7:	ff 75 08             	pushl  0x8(%ebp)
c00055da:	e8 49 fc ff ff       	call   c0005228 <flush>
c00055df:	83 c4 10             	add    $0x10,%esp
c00055e2:	83 ec 0c             	sub    $0xc,%esp
c00055e5:	ff 75 f4             	pushl  -0xc(%ebp)
c00055e8:	e8 76 25 00 00       	call   c0007b63 <intr_set_status>
c00055ed:	83 c4 10             	add    $0x10,%esp
c00055f0:	90                   	nop
c00055f1:	c9                   	leave  
c00055f2:	c3                   	ret    

c00055f3 <tty_dev_read>:
c00055f3:	55                   	push   %ebp
c00055f4:	89 e5                	mov    %esp,%ebp
c00055f6:	83 ec 08             	sub    $0x8,%esp
c00055f9:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00055fe:	39 45 08             	cmp    %eax,0x8(%ebp)
c0005601:	75 17                	jne    c000561a <tty_dev_read+0x27>
c0005603:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005608:	85 c0                	test   %eax,%eax
c000560a:	7e 0e                	jle    c000561a <tty_dev_read+0x27>
c000560c:	83 ec 0c             	sub    $0xc,%esp
c000560f:	ff 75 08             	pushl  0x8(%ebp)
c0005612:	e8 79 07 00 00       	call   c0005d90 <keyboard_read>
c0005617:	83 c4 10             	add    $0x10,%esp
c000561a:	90                   	nop
c000561b:	c9                   	leave  
c000561c:	c3                   	ret    

c000561d <tty_dev_write>:
c000561d:	55                   	push   %ebp
c000561e:	89 e5                	mov    %esp,%ebp
c0005620:	83 ec 28             	sub    $0x28,%esp
c0005623:	8b 45 08             	mov    0x8(%ebp),%eax
c0005626:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000562c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000562f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005636:	e9 88 01 00 00       	jmp    c00057c3 <tty_dev_write+0x1a6>
c000563b:	8b 45 08             	mov    0x8(%ebp),%eax
c000563e:	8b 40 04             	mov    0x4(%eax),%eax
c0005641:	8b 00                	mov    (%eax),%eax
c0005643:	88 45 e7             	mov    %al,-0x19(%ebp)
c0005646:	8b 45 08             	mov    0x8(%ebp),%eax
c0005649:	8b 40 04             	mov    0x4(%eax),%eax
c000564c:	8d 50 04             	lea    0x4(%eax),%edx
c000564f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005652:	89 50 04             	mov    %edx,0x4(%eax)
c0005655:	8b 45 08             	mov    0x8(%ebp),%eax
c0005658:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000565e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005661:	8b 45 08             	mov    0x8(%ebp),%eax
c0005664:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000566a:	8b 45 08             	mov    0x8(%ebp),%eax
c000566d:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005673:	8d 50 01             	lea    0x1(%eax),%edx
c0005676:	8b 45 08             	mov    0x8(%ebp),%eax
c0005679:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000567f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005682:	8b 40 04             	mov    0x4(%eax),%eax
c0005685:	8b 55 08             	mov    0x8(%ebp),%edx
c0005688:	83 c2 08             	add    $0x8,%edx
c000568b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005691:	39 d0                	cmp    %edx,%eax
c0005693:	75 0c                	jne    c00056a1 <tty_dev_write+0x84>
c0005695:	8b 45 08             	mov    0x8(%ebp),%eax
c0005698:	8d 50 08             	lea    0x8(%eax),%edx
c000569b:	8b 45 08             	mov    0x8(%ebp),%eax
c000569e:	89 50 04             	mov    %edx,0x4(%eax)
c00056a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00056a4:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00056aa:	85 c0                	test   %eax,%eax
c00056ac:	0f 84 11 01 00 00    	je     c00057c3 <tty_dev_write+0x1a6>
c00056b2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056b6:	3c 20                	cmp    $0x20,%al
c00056b8:	76 08                	jbe    c00056c2 <tty_dev_write+0xa5>
c00056ba:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056be:	3c 7e                	cmp    $0x7e,%al
c00056c0:	76 10                	jbe    c00056d2 <tty_dev_write+0xb5>
c00056c2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056c6:	3c 20                	cmp    $0x20,%al
c00056c8:	74 08                	je     c00056d2 <tty_dev_write+0xb5>
c00056ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056ce:	84 c0                	test   %al,%al
c00056d0:	75 58                	jne    c000572a <tty_dev_write+0x10d>
c00056d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00056d5:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00056db:	8b 45 08             	mov    0x8(%ebp),%eax
c00056de:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00056e4:	01 d0                	add    %edx,%eax
c00056e6:	83 e8 01             	sub    $0x1,%eax
c00056e9:	89 c2                	mov    %eax,%edx
c00056eb:	83 ec 04             	sub    $0x4,%esp
c00056ee:	6a 01                	push   $0x1
c00056f0:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00056f3:	50                   	push   %eax
c00056f4:	52                   	push   %edx
c00056f5:	e8 a4 24 00 00       	call   c0007b9e <Memcpy>
c00056fa:	83 c4 10             	add    $0x10,%esp
c00056fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005700:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005706:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005709:	8b 45 08             	mov    0x8(%ebp),%eax
c000570c:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005712:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005716:	0f b6 c0             	movzbl %al,%eax
c0005719:	83 ec 08             	sub    $0x8,%esp
c000571c:	50                   	push   %eax
c000571d:	ff 75 08             	pushl  0x8(%ebp)
c0005720:	e8 11 fd ff ff       	call   c0005436 <out_char>
c0005725:	83 c4 10             	add    $0x10,%esp
c0005728:	eb 7c                	jmp    c00057a6 <tty_dev_write+0x189>
c000572a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000572e:	3c 08                	cmp    $0x8,%al
c0005730:	75 42                	jne    c0005774 <tty_dev_write+0x157>
c0005732:	8b 45 08             	mov    0x8(%ebp),%eax
c0005735:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000573b:	8d 50 01             	lea    0x1(%eax),%edx
c000573e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005741:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005747:	8b 45 08             	mov    0x8(%ebp),%eax
c000574a:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005750:	8d 50 fe             	lea    -0x2(%eax),%edx
c0005753:	8b 45 08             	mov    0x8(%ebp),%eax
c0005756:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000575c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005760:	0f b6 c0             	movzbl %al,%eax
c0005763:	83 ec 08             	sub    $0x8,%esp
c0005766:	50                   	push   %eax
c0005767:	ff 75 08             	pushl  0x8(%ebp)
c000576a:	e8 c7 fc ff ff       	call   c0005436 <out_char>
c000576f:	83 c4 10             	add    $0x10,%esp
c0005772:	eb 32                	jmp    c00057a6 <tty_dev_write+0x189>
c0005774:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005778:	3c 0a                	cmp    $0xa,%al
c000577a:	75 2a                	jne    c00057a6 <tty_dev_write+0x189>
c000577c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005780:	0f b6 c0             	movzbl %al,%eax
c0005783:	83 ec 08             	sub    $0x8,%esp
c0005786:	50                   	push   %eax
c0005787:	ff 75 08             	pushl  0x8(%ebp)
c000578a:	e8 a7 fc ff ff       	call   c0005436 <out_char>
c000578f:	83 c4 10             	add    $0x10,%esp
c0005792:	8b 45 08             	mov    0x8(%ebp),%eax
c0005795:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c000579c:	00 00 00 
c000579f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00057a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00057a9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00057af:	8b 45 08             	mov    0x8(%ebp),%eax
c00057b2:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00057b8:	39 c2                	cmp    %eax,%edx
c00057ba:	75 07                	jne    c00057c3 <tty_dev_write+0x1a6>
c00057bc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00057c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00057c6:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00057cc:	85 c0                	test   %eax,%eax
c00057ce:	0f 85 67 fe ff ff    	jne    c000563b <tty_dev_write+0x1e>
c00057d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00057d8:	74 5c                	je     c0005836 <tty_dev_write+0x219>
c00057da:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c00057e1:	83 ec 0c             	sub    $0xc,%esp
c00057e4:	ff 75 ec             	pushl  -0x14(%ebp)
c00057e7:	e8 c8 d1 ff ff       	call   c00029b4 <sys_malloc>
c00057ec:	83 c4 10             	add    $0x10,%esp
c00057ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00057f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00057f5:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c00057fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00057ff:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005805:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005808:	89 50 50             	mov    %edx,0x50(%eax)
c000580b:	8b 45 08             	mov    0x8(%ebp),%eax
c000580e:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0005814:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005817:	89 50 58             	mov    %edx,0x58(%eax)
c000581a:	8b 45 08             	mov    0x8(%ebp),%eax
c000581d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005823:	83 ec 04             	sub    $0x4,%esp
c0005826:	50                   	push   %eax
c0005827:	ff 75 e8             	pushl  -0x18(%ebp)
c000582a:	6a 01                	push   $0x1
c000582c:	e8 b5 46 00 00       	call   c0009ee6 <send_rec>
c0005831:	83 c4 10             	add    $0x10,%esp
c0005834:	eb 01                	jmp    c0005837 <tty_dev_write+0x21a>
c0005836:	90                   	nop
c0005837:	c9                   	leave  
c0005838:	c3                   	ret    

c0005839 <tty_do_read>:
c0005839:	55                   	push   %ebp
c000583a:	89 e5                	mov    %esp,%ebp
c000583c:	83 ec 08             	sub    $0x8,%esp
c000583f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005842:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005849:	00 00 00 
c000584c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000584f:	8b 50 58             	mov    0x58(%eax),%edx
c0005852:	8b 45 08             	mov    0x8(%ebp),%eax
c0005855:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c000585b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000585e:	8b 00                	mov    (%eax),%eax
c0005860:	89 c2                	mov    %eax,%edx
c0005862:	8b 45 08             	mov    0x8(%ebp),%eax
c0005865:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000586b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000586e:	8b 50 50             	mov    0x50(%eax),%edx
c0005871:	8b 45 08             	mov    0x8(%ebp),%eax
c0005874:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000587a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000587d:	8b 50 50             	mov    0x50(%eax),%edx
c0005880:	8b 45 08             	mov    0x8(%ebp),%eax
c0005883:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005889:	8b 45 08             	mov    0x8(%ebp),%eax
c000588c:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c0005892:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005895:	8b 40 10             	mov    0x10(%eax),%eax
c0005898:	83 ec 08             	sub    $0x8,%esp
c000589b:	52                   	push   %edx
c000589c:	50                   	push   %eax
c000589d:	e8 4b 18 00 00       	call   c00070ed <alloc_virtual_memory>
c00058a2:	83 c4 10             	add    $0x10,%esp
c00058a5:	89 c2                	mov    %eax,%edx
c00058a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00058aa:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00058b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00058b3:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00058b9:	83 f8 02             	cmp    $0x2,%eax
c00058bc:	74 1c                	je     c00058da <tty_do_read+0xa1>
c00058be:	68 39 01 00 00       	push   $0x139
c00058c3:	68 4b b2 00 c0       	push   $0xc000b24b
c00058c8:	68 4b b2 00 c0       	push   $0xc000b24b
c00058cd:	68 55 b2 00 c0       	push   $0xc000b255
c00058d2:	e8 9f 3d 00 00       	call   c0009676 <assertion_failure>
c00058d7:	83 c4 10             	add    $0x10,%esp
c00058da:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058dd:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00058e4:	8b 45 08             	mov    0x8(%ebp),%eax
c00058e7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00058ed:	83 ec 04             	sub    $0x4,%esp
c00058f0:	50                   	push   %eax
c00058f1:	ff 75 0c             	pushl  0xc(%ebp)
c00058f4:	6a 01                	push   $0x1
c00058f6:	e8 eb 45 00 00       	call   c0009ee6 <send_rec>
c00058fb:	83 c4 10             	add    $0x10,%esp
c00058fe:	90                   	nop
c00058ff:	c9                   	leave  
c0005900:	c3                   	ret    

c0005901 <tty_do_write>:
c0005901:	55                   	push   %ebp
c0005902:	89 e5                	mov    %esp,%ebp
c0005904:	53                   	push   %ebx
c0005905:	83 ec 24             	sub    $0x24,%esp
c0005908:	89 e0                	mov    %esp,%eax
c000590a:	89 c3                	mov    %eax,%ebx
c000590c:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0005913:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005916:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005919:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c000591c:	89 c2                	mov    %eax,%edx
c000591e:	b8 10 00 00 00       	mov    $0x10,%eax
c0005923:	83 e8 01             	sub    $0x1,%eax
c0005926:	01 d0                	add    %edx,%eax
c0005928:	b9 10 00 00 00       	mov    $0x10,%ecx
c000592d:	ba 00 00 00 00       	mov    $0x0,%edx
c0005932:	f7 f1                	div    %ecx
c0005934:	6b c0 10             	imul   $0x10,%eax,%eax
c0005937:	29 c4                	sub    %eax,%esp
c0005939:	89 e0                	mov    %esp,%eax
c000593b:	83 c0 00             	add    $0x0,%eax
c000593e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005941:	83 ec 04             	sub    $0x4,%esp
c0005944:	ff 75 e8             	pushl  -0x18(%ebp)
c0005947:	6a 00                	push   $0x0
c0005949:	ff 75 e0             	pushl  -0x20(%ebp)
c000594c:	e8 4e 61 00 00       	call   c000ba9f <Memset>
c0005951:	83 c4 10             	add    $0x10,%esp
c0005954:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005957:	8b 40 50             	mov    0x50(%eax),%eax
c000595a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000595d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005960:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005967:	00 00 00 
c000596a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000596d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005970:	8b 40 10             	mov    0x10(%eax),%eax
c0005973:	83 ec 08             	sub    $0x8,%esp
c0005976:	52                   	push   %edx
c0005977:	50                   	push   %eax
c0005978:	e8 70 17 00 00       	call   c00070ed <alloc_virtual_memory>
c000597d:	83 c4 10             	add    $0x10,%esp
c0005980:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005983:	eb 7e                	jmp    c0005a03 <tty_do_write+0x102>
c0005985:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005988:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000598b:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c000598f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005992:	8b 45 08             	mov    0x8(%ebp),%eax
c0005995:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000599b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000599e:	01 d0                	add    %edx,%eax
c00059a0:	83 ec 04             	sub    $0x4,%esp
c00059a3:	ff 75 f0             	pushl  -0x10(%ebp)
c00059a6:	50                   	push   %eax
c00059a7:	ff 75 e0             	pushl  -0x20(%ebp)
c00059aa:	e8 ef 21 00 00       	call   c0007b9e <Memcpy>
c00059af:	83 c4 10             	add    $0x10,%esp
c00059b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059b5:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00059b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00059bb:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00059c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059c4:	01 c2                	add    %eax,%edx
c00059c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00059c9:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00059cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00059d6:	eb 25                	jmp    c00059fd <tty_do_write+0xfc>
c00059d8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00059db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00059de:	01 d0                	add    %edx,%eax
c00059e0:	0f b6 00             	movzbl (%eax),%eax
c00059e3:	0f b6 c0             	movzbl %al,%eax
c00059e6:	83 ec 08             	sub    $0x8,%esp
c00059e9:	50                   	push   %eax
c00059ea:	ff 75 08             	pushl  0x8(%ebp)
c00059ed:	e8 44 fa ff ff       	call   c0005436 <out_char>
c00059f2:	83 c4 10             	add    $0x10,%esp
c00059f5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00059f9:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c00059fd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005a01:	75 d5                	jne    c00059d8 <tty_do_write+0xd7>
c0005a03:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005a07:	0f 85 78 ff ff ff    	jne    c0005985 <tty_do_write+0x84>
c0005a0d:	83 ec 0c             	sub    $0xc,%esp
c0005a10:	6a 6c                	push   $0x6c
c0005a12:	e8 9d cf ff ff       	call   c00029b4 <sys_malloc>
c0005a17:	83 c4 10             	add    $0x10,%esp
c0005a1a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005a1d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a20:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0005a27:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a2a:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005a30:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a33:	89 50 48             	mov    %edx,0x48(%eax)
c0005a36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a39:	8b 00                	mov    (%eax),%eax
c0005a3b:	83 ec 04             	sub    $0x4,%esp
c0005a3e:	50                   	push   %eax
c0005a3f:	ff 75 d8             	pushl  -0x28(%ebp)
c0005a42:	6a 01                	push   $0x1
c0005a44:	e8 9d 44 00 00       	call   c0009ee6 <send_rec>
c0005a49:	83 c4 10             	add    $0x10,%esp
c0005a4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a4f:	83 ec 08             	sub    $0x8,%esp
c0005a52:	6a 6c                	push   $0x6c
c0005a54:	50                   	push   %eax
c0005a55:	e8 1d 1c 00 00       	call   c0007677 <sys_free>
c0005a5a:	83 c4 10             	add    $0x10,%esp
c0005a5d:	89 dc                	mov    %ebx,%esp
c0005a5f:	90                   	nop
c0005a60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005a63:	c9                   	leave  
c0005a64:	c3                   	ret    

c0005a65 <init_screen>:
c0005a65:	55                   	push   %ebp
c0005a66:	89 e5                	mov    %esp,%ebp
c0005a68:	83 ec 10             	sub    $0x10,%esp
c0005a6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a6e:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005a73:	c1 f8 03             	sar    $0x3,%eax
c0005a76:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005a7c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005a7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005a82:	c1 e0 04             	shl    $0x4,%eax
c0005a85:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c0005a8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a8e:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005a94:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005a9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a9e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005aa4:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0005aa7:	89 50 04             	mov    %edx,0x4(%eax)
c0005aaa:	8b 45 08             	mov    0x8(%ebp),%eax
c0005aad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005ab3:	8b 50 04             	mov    0x4(%eax),%edx
c0005ab6:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ab9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005abf:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0005ac3:	89 10                	mov    %edx,(%eax)
c0005ac5:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ac8:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0005ace:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ad1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005ad7:	8b 12                	mov    (%edx),%edx
c0005ad9:	89 50 08             	mov    %edx,0x8(%eax)
c0005adc:	8b 55 08             	mov    0x8(%ebp),%edx
c0005adf:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c0005ae5:	8b 40 08             	mov    0x8(%eax),%eax
c0005ae8:	89 42 0c             	mov    %eax,0xc(%edx)
c0005aeb:	90                   	nop
c0005aec:	c9                   	leave  
c0005aed:	c3                   	ret    

c0005aee <init_tty>:
c0005aee:	55                   	push   %ebp
c0005aef:	89 e5                	mov    %esp,%ebp
c0005af1:	83 ec 18             	sub    $0x18,%esp
c0005af4:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005afb:	e9 92 00 00 00       	jmp    c0005b92 <init_tty+0xa4>
c0005b00:	83 ec 04             	sub    $0x4,%esp
c0005b03:	68 28 08 00 00       	push   $0x828
c0005b08:	6a 00                	push   $0x0
c0005b0a:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b0d:	e8 8d 5f 00 00       	call   c000ba9f <Memset>
c0005b12:	83 c4 10             	add    $0x10,%esp
c0005b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b18:	8d 50 08             	lea    0x8(%eax),%edx
c0005b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b1e:	89 50 04             	mov    %edx,0x4(%eax)
c0005b21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b24:	8b 50 04             	mov    0x4(%eax),%edx
c0005b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b2a:	89 10                	mov    %edx,(%eax)
c0005b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b2f:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005b36:	00 00 00 
c0005b39:	83 ec 0c             	sub    $0xc,%esp
c0005b3c:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b3f:	e8 21 ff ff ff       	call   c0005a65 <init_screen>
c0005b44:	83 c4 10             	add    $0x10,%esp
c0005b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b4a:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005b4f:	85 c0                	test   %eax,%eax
c0005b51:	7e 38                	jle    c0005b8b <init_tty+0x9d>
c0005b53:	83 ec 08             	sub    $0x8,%esp
c0005b56:	6a 23                	push   $0x23
c0005b58:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b5b:	e8 d6 f8 ff ff       	call   c0005436 <out_char>
c0005b60:	83 c4 10             	add    $0x10,%esp
c0005b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b66:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005b6b:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005b70:	c1 f8 03             	sar    $0x3,%eax
c0005b73:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005b79:	0f b6 c0             	movzbl %al,%eax
c0005b7c:	83 ec 08             	sub    $0x8,%esp
c0005b7f:	50                   	push   %eax
c0005b80:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b83:	e8 ae f8 ff ff       	call   c0005436 <out_char>
c0005b88:	83 c4 10             	add    $0x10,%esp
c0005b8b:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005b92:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005b97:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005b9a:	0f 82 60 ff ff ff    	jb     c0005b00 <init_tty+0x12>
c0005ba0:	90                   	nop
c0005ba1:	c9                   	leave  
c0005ba2:	c3                   	ret    

c0005ba3 <TaskTTY>:
c0005ba3:	55                   	push   %ebp
c0005ba4:	89 e5                	mov    %esp,%ebp
c0005ba6:	83 ec 28             	sub    $0x28,%esp
c0005ba9:	e8 40 ff ff ff       	call   c0005aee <init_tty>
c0005bae:	83 ec 0c             	sub    $0xc,%esp
c0005bb1:	6a 00                	push   $0x0
c0005bb3:	e8 34 f6 ff ff       	call   c00051ec <select_console>
c0005bb8:	83 c4 10             	add    $0x10,%esp
c0005bbb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005bc2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005bc9:	83 ec 0c             	sub    $0xc,%esp
c0005bcc:	6a 6c                	push   $0x6c
c0005bce:	e8 e1 cd ff ff       	call   c00029b4 <sys_malloc>
c0005bd3:	83 c4 10             	add    $0x10,%esp
c0005bd6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005bd9:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005be0:	eb 30                	jmp    c0005c12 <TaskTTY+0x6f>
c0005be2:	83 ec 0c             	sub    $0xc,%esp
c0005be5:	ff 75 f4             	pushl  -0xc(%ebp)
c0005be8:	e8 06 fa ff ff       	call   c00055f3 <tty_dev_read>
c0005bed:	83 c4 10             	add    $0x10,%esp
c0005bf0:	83 ec 0c             	sub    $0xc,%esp
c0005bf3:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bf6:	e8 22 fa ff ff       	call   c000561d <tty_dev_write>
c0005bfb:	83 c4 10             	add    $0x10,%esp
c0005bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c01:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005c07:	85 c0                	test   %eax,%eax
c0005c09:	75 d7                	jne    c0005be2 <TaskTTY+0x3f>
c0005c0b:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005c12:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005c17:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005c1a:	72 c6                	jb     c0005be2 <TaskTTY+0x3f>
c0005c1c:	83 ec 04             	sub    $0x4,%esp
c0005c1f:	6a 12                	push   $0x12
c0005c21:	ff 75 e8             	pushl  -0x18(%ebp)
c0005c24:	6a 02                	push   $0x2
c0005c26:	e8 bb 42 00 00       	call   c0009ee6 <send_rec>
c0005c2b:	83 c4 10             	add    $0x10,%esp
c0005c2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005c31:	8b 40 68             	mov    0x68(%eax),%eax
c0005c34:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005c37:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005c3e:	74 28                	je     c0005c68 <TaskTTY+0xc5>
c0005c40:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005c47:	7f 0b                	jg     c0005c54 <TaskTTY+0xb1>
c0005c49:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005c50:	74 4e                	je     c0005ca0 <TaskTTY+0xfd>
c0005c52:	eb 4d                	jmp    c0005ca1 <TaskTTY+0xfe>
c0005c54:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005c5b:	74 21                	je     c0005c7e <TaskTTY+0xdb>
c0005c5d:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005c64:	74 2e                	je     c0005c94 <TaskTTY+0xf1>
c0005c66:	eb 39                	jmp    c0005ca1 <TaskTTY+0xfe>
c0005c68:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005c6d:	83 ec 08             	sub    $0x8,%esp
c0005c70:	ff 75 e8             	pushl  -0x18(%ebp)
c0005c73:	50                   	push   %eax
c0005c74:	e8 c0 fb ff ff       	call   c0005839 <tty_do_read>
c0005c79:	83 c4 10             	add    $0x10,%esp
c0005c7c:	eb 23                	jmp    c0005ca1 <TaskTTY+0xfe>
c0005c7e:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005c83:	83 ec 08             	sub    $0x8,%esp
c0005c86:	ff 75 e8             	pushl  -0x18(%ebp)
c0005c89:	50                   	push   %eax
c0005c8a:	e8 72 fc ff ff       	call   c0005901 <tty_do_write>
c0005c8f:	83 c4 10             	add    $0x10,%esp
c0005c92:	eb 0d                	jmp    c0005ca1 <TaskTTY+0xfe>
c0005c94:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005c9b:	00 00 00 
c0005c9e:	eb 01                	jmp    c0005ca1 <TaskTTY+0xfe>
c0005ca0:	90                   	nop
c0005ca1:	e9 33 ff ff ff       	jmp    c0005bd9 <TaskTTY+0x36>

c0005ca6 <keyboard_handler>:
c0005ca6:	55                   	push   %ebp
c0005ca7:	89 e5                	mov    %esp,%ebp
c0005ca9:	83 ec 18             	sub    $0x18,%esp
c0005cac:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c0005cb3:	00 00 00 
c0005cb6:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005cbd:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005cc2:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005cc7:	7f 5e                	jg     c0005d27 <keyboard_handler+0x81>
c0005cc9:	e8 fc ba ff ff       	call   c00017ca <disable_int>
c0005cce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cd1:	0f b7 c0             	movzwl %ax,%eax
c0005cd4:	83 ec 0c             	sub    $0xc,%esp
c0005cd7:	50                   	push   %eax
c0005cd8:	e8 bf ba ff ff       	call   c000179c <in_byte>
c0005cdd:	83 c4 10             	add    $0x10,%esp
c0005ce0:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005ce3:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005ce8:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005cec:	88 10                	mov    %dl,(%eax)
c0005cee:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005cf3:	83 c0 01             	add    $0x1,%eax
c0005cf6:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005cfb:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d00:	83 c0 01             	add    $0x1,%eax
c0005d03:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005d08:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d0d:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005d12:	39 d0                	cmp    %edx,%eax
c0005d14:	72 0a                	jb     c0005d20 <keyboard_handler+0x7a>
c0005d16:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005d1d:	0b 01 c0 
c0005d20:	e8 a7 ba ff ff       	call   c00017cc <enable_int>
c0005d25:	eb 01                	jmp    c0005d28 <keyboard_handler+0x82>
c0005d27:	90                   	nop
c0005d28:	c9                   	leave  
c0005d29:	c3                   	ret    

c0005d2a <read_from_keyboard_buf>:
c0005d2a:	55                   	push   %ebp
c0005d2b:	89 e5                	mov    %esp,%ebp
c0005d2d:	83 ec 18             	sub    $0x18,%esp
c0005d30:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005d34:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d39:	85 c0                	test   %eax,%eax
c0005d3b:	7f 06                	jg     c0005d43 <read_from_keyboard_buf+0x19>
c0005d3d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005d41:	eb 4b                	jmp    c0005d8e <read_from_keyboard_buf+0x64>
c0005d43:	e8 82 ba ff ff       	call   c00017ca <disable_int>
c0005d48:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005d4d:	0f b6 00             	movzbl (%eax),%eax
c0005d50:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005d53:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005d58:	83 c0 01             	add    $0x1,%eax
c0005d5b:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005d60:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d65:	83 e8 01             	sub    $0x1,%eax
c0005d68:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005d6d:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005d72:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005d77:	39 d0                	cmp    %edx,%eax
c0005d79:	72 0a                	jb     c0005d85 <read_from_keyboard_buf+0x5b>
c0005d7b:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c0005d82:	0b 01 c0 
c0005d85:	e8 42 ba ff ff       	call   c00017cc <enable_int>
c0005d8a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005d8e:	c9                   	leave  
c0005d8f:	c3                   	ret    

c0005d90 <keyboard_read>:
c0005d90:	55                   	push   %ebp
c0005d91:	89 e5                	mov    %esp,%ebp
c0005d93:	83 ec 28             	sub    $0x28,%esp
c0005d96:	90                   	nop
c0005d97:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d9c:	85 c0                	test   %eax,%eax
c0005d9e:	7e f7                	jle    c0005d97 <keyboard_read+0x7>
c0005da0:	e8 85 ff ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005da5:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005da8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005daf:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005db3:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005db7:	75 5a                	jne    c0005e13 <keyboard_read+0x83>
c0005db9:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005dbd:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005dc1:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005dc5:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005dc9:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005dcd:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005dd1:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005dd5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005ddc:	eb 20                	jmp    c0005dfe <keyboard_read+0x6e>
c0005dde:	e8 47 ff ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005de3:	89 c1                	mov    %eax,%ecx
c0005de5:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005de8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005deb:	01 d0                	add    %edx,%eax
c0005ded:	0f b6 00             	movzbl (%eax),%eax
c0005df0:	38 c1                	cmp    %al,%cl
c0005df2:	74 06                	je     c0005dfa <keyboard_read+0x6a>
c0005df4:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005df8:	eb 0a                	jmp    c0005e04 <keyboard_read+0x74>
c0005dfa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005dfe:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005e02:	7e da                	jle    c0005dde <keyboard_read+0x4e>
c0005e04:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005e08:	74 68                	je     c0005e72 <keyboard_read+0xe2>
c0005e0a:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005e11:	eb 5f                	jmp    c0005e72 <keyboard_read+0xe2>
c0005e13:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005e17:	75 59                	jne    c0005e72 <keyboard_read+0xe2>
c0005e19:	e8 0c ff ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005e1e:	3c 2a                	cmp    $0x2a,%al
c0005e20:	75 1d                	jne    c0005e3f <keyboard_read+0xaf>
c0005e22:	e8 03 ff ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005e27:	3c e0                	cmp    $0xe0,%al
c0005e29:	75 14                	jne    c0005e3f <keyboard_read+0xaf>
c0005e2b:	e8 fa fe ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005e30:	3c 37                	cmp    $0x37,%al
c0005e32:	75 0b                	jne    c0005e3f <keyboard_read+0xaf>
c0005e34:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005e3b:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005e3f:	e8 e6 fe ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005e44:	3c b7                	cmp    $0xb7,%al
c0005e46:	75 1d                	jne    c0005e65 <keyboard_read+0xd5>
c0005e48:	e8 dd fe ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005e4d:	3c e0                	cmp    $0xe0,%al
c0005e4f:	75 14                	jne    c0005e65 <keyboard_read+0xd5>
c0005e51:	e8 d4 fe ff ff       	call   c0005d2a <read_from_keyboard_buf>
c0005e56:	3c aa                	cmp    $0xaa,%al
c0005e58:	75 0b                	jne    c0005e65 <keyboard_read+0xd5>
c0005e5a:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005e61:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005e65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005e69:	75 07                	jne    c0005e72 <keyboard_read+0xe2>
c0005e6b:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c0005e72:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005e79:	0f 84 8d 00 00 00    	je     c0005f0c <keyboard_read+0x17c>
c0005e7f:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005e86:	0f 84 80 00 00 00    	je     c0005f0c <keyboard_read+0x17c>
c0005e8c:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005e90:	0f 94 c2             	sete   %dl
c0005e93:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005e97:	0f 94 c0             	sete   %al
c0005e9a:	09 d0                	or     %edx,%eax
c0005e9c:	84 c0                	test   %al,%al
c0005e9e:	74 07                	je     c0005ea7 <keyboard_read+0x117>
c0005ea0:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005ea7:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005eab:	f7 d0                	not    %eax
c0005ead:	c0 e8 07             	shr    $0x7,%al
c0005eb0:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005eb3:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005eb7:	74 53                	je     c0005f0c <keyboard_read+0x17c>
c0005eb9:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005ebd:	74 4d                	je     c0005f0c <keyboard_read+0x17c>
c0005ebf:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005ec3:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005eca:	3c 01                	cmp    $0x1,%al
c0005ecc:	75 04                	jne    c0005ed2 <keyboard_read+0x142>
c0005ece:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005ed2:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c0005ed9:	84 c0                	test   %al,%al
c0005edb:	74 04                	je     c0005ee1 <keyboard_read+0x151>
c0005edd:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005ee1:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005ee5:	89 d0                	mov    %edx,%eax
c0005ee7:	01 c0                	add    %eax,%eax
c0005ee9:	01 c2                	add    %eax,%edx
c0005eeb:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005eef:	01 d0                	add    %edx,%eax
c0005ef1:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005ef8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005efb:	83 ec 08             	sub    $0x8,%esp
c0005efe:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f01:	ff 75 08             	pushl  0x8(%ebp)
c0005f04:	e8 1a 00 00 00       	call   c0005f23 <in_process>
c0005f09:	83 c4 10             	add    $0x10,%esp
c0005f0c:	90                   	nop
c0005f0d:	c9                   	leave  
c0005f0e:	c3                   	ret    

c0005f0f <init_keyboard_handler>:
c0005f0f:	55                   	push   %ebp
c0005f10:	89 e5                	mov    %esp,%ebp
c0005f12:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005f19:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005f20:	90                   	nop
c0005f21:	5d                   	pop    %ebp
c0005f22:	c3                   	ret    

c0005f23 <in_process>:
c0005f23:	55                   	push   %ebp
c0005f24:	89 e5                	mov    %esp,%ebp
c0005f26:	83 ec 18             	sub    $0x18,%esp
c0005f29:	83 ec 04             	sub    $0x4,%esp
c0005f2c:	6a 02                	push   $0x2
c0005f2e:	6a 00                	push   $0x0
c0005f30:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005f33:	50                   	push   %eax
c0005f34:	e8 66 5b 00 00       	call   c000ba9f <Memset>
c0005f39:	83 c4 10             	add    $0x10,%esp
c0005f3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f3f:	25 00 01 00 00       	and    $0x100,%eax
c0005f44:	85 c0                	test   %eax,%eax
c0005f46:	75 28                	jne    c0005f70 <in_process+0x4d>
c0005f48:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f4b:	0f b6 c0             	movzbl %al,%eax
c0005f4e:	83 ec 08             	sub    $0x8,%esp
c0005f51:	50                   	push   %eax
c0005f52:	ff 75 08             	pushl  0x8(%ebp)
c0005f55:	e8 c3 f3 ff ff       	call   c000531d <put_key>
c0005f5a:	83 c4 10             	add    $0x10,%esp
c0005f5d:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005f64:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005f6b:	e9 42 01 00 00       	jmp    c00060b2 <in_process+0x18f>
c0005f70:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005f77:	84 c0                	test   %al,%al
c0005f79:	0f 84 a9 00 00 00    	je     c0006028 <in_process+0x105>
c0005f7f:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005f83:	0f 84 9f 00 00 00    	je     c0006028 <in_process+0x105>
c0005f89:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005f8d:	0f 84 95 00 00 00    	je     c0006028 <in_process+0x105>
c0005f93:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005f9a:	74 64                	je     c0006000 <in_process+0xdd>
c0005f9c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005fa3:	77 0b                	ja     c0005fb0 <in_process+0x8d>
c0005fa5:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005fac:	74 64                	je     c0006012 <in_process+0xef>
c0005fae:	eb 73                	jmp    c0006023 <in_process+0x100>
c0005fb0:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005fb7:	74 0b                	je     c0005fc4 <in_process+0xa1>
c0005fb9:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005fc0:	74 20                	je     c0005fe2 <in_process+0xbf>
c0005fc2:	eb 5f                	jmp    c0006023 <in_process+0x100>
c0005fc4:	83 ec 0c             	sub    $0xc,%esp
c0005fc7:	ff 75 08             	pushl  0x8(%ebp)
c0005fca:	e8 ba f3 ff ff       	call   c0005389 <scroll_up>
c0005fcf:	83 c4 10             	add    $0x10,%esp
c0005fd2:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005fd9:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005fe0:	eb 41                	jmp    c0006023 <in_process+0x100>
c0005fe2:	83 ec 0c             	sub    $0xc,%esp
c0005fe5:	ff 75 08             	pushl  0x8(%ebp)
c0005fe8:	e8 de f3 ff ff       	call   c00053cb <scroll_down>
c0005fed:	83 c4 10             	add    $0x10,%esp
c0005ff0:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005ff7:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005ffe:	eb 23                	jmp    c0006023 <in_process+0x100>
c0006000:	83 ec 08             	sub    $0x8,%esp
c0006003:	6a 0a                	push   $0xa
c0006005:	ff 75 08             	pushl  0x8(%ebp)
c0006008:	e8 29 f4 ff ff       	call   c0005436 <out_char>
c000600d:	83 c4 10             	add    $0x10,%esp
c0006010:	eb 11                	jmp    c0006023 <in_process+0x100>
c0006012:	83 ec 08             	sub    $0x8,%esp
c0006015:	6a 08                	push   $0x8
c0006017:	ff 75 08             	pushl  0x8(%ebp)
c000601a:	e8 17 f4 ff ff       	call   c0005436 <out_char>
c000601f:	83 c4 10             	add    $0x10,%esp
c0006022:	90                   	nop
c0006023:	e9 8a 00 00 00       	jmp    c00060b2 <in_process+0x18f>
c0006028:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c000602f:	74 55                	je     c0006086 <in_process+0x163>
c0006031:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0006038:	77 14                	ja     c000604e <in_process+0x12b>
c000603a:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0006041:	74 31                	je     c0006074 <in_process+0x151>
c0006043:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000604a:	74 16                	je     c0006062 <in_process+0x13f>
c000604c:	eb 64                	jmp    c00060b2 <in_process+0x18f>
c000604e:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0006055:	74 3e                	je     c0006095 <in_process+0x172>
c0006057:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c000605e:	74 44                	je     c00060a4 <in_process+0x181>
c0006060:	eb 50                	jmp    c00060b2 <in_process+0x18f>
c0006062:	83 ec 08             	sub    $0x8,%esp
c0006065:	6a 0a                	push   $0xa
c0006067:	ff 75 08             	pushl  0x8(%ebp)
c000606a:	e8 ae f2 ff ff       	call   c000531d <put_key>
c000606f:	83 c4 10             	add    $0x10,%esp
c0006072:	eb 3e                	jmp    c00060b2 <in_process+0x18f>
c0006074:	83 ec 08             	sub    $0x8,%esp
c0006077:	6a 08                	push   $0x8
c0006079:	ff 75 08             	pushl  0x8(%ebp)
c000607c:	e8 9c f2 ff ff       	call   c000531d <put_key>
c0006081:	83 c4 10             	add    $0x10,%esp
c0006084:	eb 2c                	jmp    c00060b2 <in_process+0x18f>
c0006086:	83 ec 0c             	sub    $0xc,%esp
c0006089:	6a 00                	push   $0x0
c000608b:	e8 5c f1 ff ff       	call   c00051ec <select_console>
c0006090:	83 c4 10             	add    $0x10,%esp
c0006093:	eb 1d                	jmp    c00060b2 <in_process+0x18f>
c0006095:	83 ec 0c             	sub    $0xc,%esp
c0006098:	6a 01                	push   $0x1
c000609a:	e8 4d f1 ff ff       	call   c00051ec <select_console>
c000609f:	83 c4 10             	add    $0x10,%esp
c00060a2:	eb 0e                	jmp    c00060b2 <in_process+0x18f>
c00060a4:	83 ec 0c             	sub    $0xc,%esp
c00060a7:	6a 02                	push   $0x2
c00060a9:	e8 3e f1 ff ff       	call   c00051ec <select_console>
c00060ae:	83 c4 10             	add    $0x10,%esp
c00060b1:	90                   	nop
c00060b2:	90                   	nop
c00060b3:	c9                   	leave  
c00060b4:	c3                   	ret    

c00060b5 <open>:
c00060b5:	55                   	push   %ebp
c00060b6:	89 e5                	mov    %esp,%ebp
c00060b8:	83 ec 18             	sub    $0x18,%esp
c00060bb:	83 ec 0c             	sub    $0xc,%esp
c00060be:	6a 6c                	push   $0x6c
c00060c0:	e8 ef c8 ff ff       	call   c00029b4 <sys_malloc>
c00060c5:	83 c4 10             	add    $0x10,%esp
c00060c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00060cb:	83 ec 04             	sub    $0x4,%esp
c00060ce:	6a 6c                	push   $0x6c
c00060d0:	6a 00                	push   $0x0
c00060d2:	ff 75 f4             	pushl  -0xc(%ebp)
c00060d5:	e8 c5 59 00 00       	call   c000ba9f <Memset>
c00060da:	83 c4 10             	add    $0x10,%esp
c00060dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00060e0:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c00060e7:	83 ec 0c             	sub    $0xc,%esp
c00060ea:	ff 75 08             	pushl  0x8(%ebp)
c00060ed:	e8 c2 10 00 00       	call   c00071b4 <get_physical_address>
c00060f2:	83 c4 10             	add    $0x10,%esp
c00060f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00060f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00060fb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00060fe:	89 50 34             	mov    %edx,0x34(%eax)
c0006101:	8b 55 0c             	mov    0xc(%ebp),%edx
c0006104:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006107:	89 50 64             	mov    %edx,0x64(%eax)
c000610a:	83 ec 0c             	sub    $0xc,%esp
c000610d:	ff 75 08             	pushl  0x8(%ebp)
c0006110:	e8 c3 59 00 00       	call   c000bad8 <Strlen>
c0006115:	83 c4 10             	add    $0x10,%esp
c0006118:	89 c2                	mov    %eax,%edx
c000611a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000611d:	89 50 30             	mov    %edx,0x30(%eax)
c0006120:	83 ec 04             	sub    $0x4,%esp
c0006123:	6a 02                	push   $0x2
c0006125:	ff 75 f4             	pushl  -0xc(%ebp)
c0006128:	6a 03                	push   $0x3
c000612a:	e8 b7 3d 00 00       	call   c0009ee6 <send_rec>
c000612f:	83 c4 10             	add    $0x10,%esp
c0006132:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006135:	8b 40 40             	mov    0x40(%eax),%eax
c0006138:	c9                   	leave  
c0006139:	c3                   	ret    

c000613a <read>:
c000613a:	55                   	push   %ebp
c000613b:	89 e5                	mov    %esp,%ebp
c000613d:	83 ec 18             	sub    $0x18,%esp
c0006140:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0006147:	83 ec 0c             	sub    $0xc,%esp
c000614a:	ff 75 f4             	pushl  -0xc(%ebp)
c000614d:	e8 62 c8 ff ff       	call   c00029b4 <sys_malloc>
c0006152:	83 c4 10             	add    $0x10,%esp
c0006155:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006158:	83 ec 0c             	sub    $0xc,%esp
c000615b:	ff 75 0c             	pushl  0xc(%ebp)
c000615e:	e8 51 10 00 00       	call   c00071b4 <get_physical_address>
c0006163:	83 c4 10             	add    $0x10,%esp
c0006166:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006169:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000616c:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0006173:	8b 55 08             	mov    0x8(%ebp),%edx
c0006176:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006179:	89 50 40             	mov    %edx,0x40(%eax)
c000617c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000617f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006182:	89 50 10             	mov    %edx,0x10(%eax)
c0006185:	8b 55 10             	mov    0x10(%ebp),%edx
c0006188:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000618b:	89 50 50             	mov    %edx,0x50(%eax)
c000618e:	83 ec 04             	sub    $0x4,%esp
c0006191:	6a 02                	push   $0x2
c0006193:	ff 75 f0             	pushl  -0x10(%ebp)
c0006196:	6a 03                	push   $0x3
c0006198:	e8 49 3d 00 00       	call   c0009ee6 <send_rec>
c000619d:	83 c4 10             	add    $0x10,%esp
c00061a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061a3:	8b 40 50             	mov    0x50(%eax),%eax
c00061a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00061a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00061ac:	c9                   	leave  
c00061ad:	c3                   	ret    

c00061ae <write>:
c00061ae:	55                   	push   %ebp
c00061af:	89 e5                	mov    %esp,%ebp
c00061b1:	83 ec 18             	sub    $0x18,%esp
c00061b4:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00061bb:	83 ec 0c             	sub    $0xc,%esp
c00061be:	ff 75 f4             	pushl  -0xc(%ebp)
c00061c1:	e8 ee c7 ff ff       	call   c00029b4 <sys_malloc>
c00061c6:	83 c4 10             	add    $0x10,%esp
c00061c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061cc:	83 ec 0c             	sub    $0xc,%esp
c00061cf:	ff 75 0c             	pushl  0xc(%ebp)
c00061d2:	e8 dd 0f 00 00       	call   c00071b4 <get_physical_address>
c00061d7:	83 c4 10             	add    $0x10,%esp
c00061da:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00061dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061e0:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c00061e7:	8b 55 08             	mov    0x8(%ebp),%edx
c00061ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061ed:	89 50 40             	mov    %edx,0x40(%eax)
c00061f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00061f6:	89 50 10             	mov    %edx,0x10(%eax)
c00061f9:	8b 55 10             	mov    0x10(%ebp),%edx
c00061fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061ff:	89 50 50             	mov    %edx,0x50(%eax)
c0006202:	83 ec 04             	sub    $0x4,%esp
c0006205:	6a 02                	push   $0x2
c0006207:	ff 75 f0             	pushl  -0x10(%ebp)
c000620a:	6a 03                	push   $0x3
c000620c:	e8 d5 3c 00 00       	call   c0009ee6 <send_rec>
c0006211:	83 c4 10             	add    $0x10,%esp
c0006214:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006217:	8b 40 50             	mov    0x50(%eax),%eax
c000621a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000621d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006220:	c9                   	leave  
c0006221:	c3                   	ret    

c0006222 <close>:
c0006222:	55                   	push   %ebp
c0006223:	89 e5                	mov    %esp,%ebp
c0006225:	83 ec 78             	sub    $0x78,%esp
c0006228:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000622f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006232:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006235:	83 ec 04             	sub    $0x4,%esp
c0006238:	6a 02                	push   $0x2
c000623a:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000623d:	50                   	push   %eax
c000623e:	6a 03                	push   $0x3
c0006240:	e8 a1 3c 00 00       	call   c0009ee6 <send_rec>
c0006245:	83 c4 10             	add    $0x10,%esp
c0006248:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000624b:	83 f8 65             	cmp    $0x65,%eax
c000624e:	74 19                	je     c0006269 <close+0x47>
c0006250:	6a 13                	push   $0x13
c0006252:	68 6d b2 00 c0       	push   $0xc000b26d
c0006257:	68 6d b2 00 c0       	push   $0xc000b26d
c000625c:	68 79 b2 00 c0       	push   $0xc000b279
c0006261:	e8 10 34 00 00       	call   c0009676 <assertion_failure>
c0006266:	83 c4 10             	add    $0x10,%esp
c0006269:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000626c:	c9                   	leave  
c000626d:	c3                   	ret    

c000626e <wait>:
c000626e:	55                   	push   %ebp
c000626f:	89 e5                	mov    %esp,%ebp
c0006271:	83 ec 78             	sub    $0x78,%esp
c0006274:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c000627b:	83 ec 04             	sub    $0x4,%esp
c000627e:	6a 01                	push   $0x1
c0006280:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006283:	50                   	push   %eax
c0006284:	6a 03                	push   $0x3
c0006286:	e8 5b 3c 00 00       	call   c0009ee6 <send_rec>
c000628b:	83 c4 10             	add    $0x10,%esp
c000628e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006291:	89 c2                	mov    %eax,%edx
c0006293:	8b 45 08             	mov    0x8(%ebp),%eax
c0006296:	89 10                	mov    %edx,(%eax)
c0006298:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000629b:	83 f8 21             	cmp    $0x21,%eax
c000629e:	74 05                	je     c00062a5 <wait+0x37>
c00062a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00062a3:	eb 05                	jmp    c00062aa <wait+0x3c>
c00062a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00062aa:	c9                   	leave  
c00062ab:	c3                   	ret    

c00062ac <exit>:
c00062ac:	55                   	push   %ebp
c00062ad:	89 e5                	mov    %esp,%ebp
c00062af:	83 ec 78             	sub    $0x78,%esp
c00062b2:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c00062b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00062bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00062bf:	83 ec 04             	sub    $0x4,%esp
c00062c2:	6a 01                	push   $0x1
c00062c4:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062c7:	50                   	push   %eax
c00062c8:	6a 03                	push   $0x3
c00062ca:	e8 17 3c 00 00       	call   c0009ee6 <send_rec>
c00062cf:	83 c4 10             	add    $0x10,%esp
c00062d2:	90                   	nop
c00062d3:	c9                   	leave  
c00062d4:	c3                   	ret    

c00062d5 <fork>:
c00062d5:	55                   	push   %ebp
c00062d6:	89 e5                	mov    %esp,%ebp
c00062d8:	83 ec 78             	sub    $0x78,%esp
c00062db:	83 ec 04             	sub    $0x4,%esp
c00062de:	6a 6c                	push   $0x6c
c00062e0:	6a 00                	push   $0x0
c00062e2:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062e5:	50                   	push   %eax
c00062e6:	e8 b4 57 00 00       	call   c000ba9f <Memset>
c00062eb:	83 c4 10             	add    $0x10,%esp
c00062ee:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00062f5:	83 ec 04             	sub    $0x4,%esp
c00062f8:	6a 01                	push   $0x1
c00062fa:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062fd:	50                   	push   %eax
c00062fe:	6a 03                	push   $0x3
c0006300:	e8 e1 3b 00 00       	call   c0009ee6 <send_rec>
c0006305:	83 c4 10             	add    $0x10,%esp
c0006308:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c000630f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006312:	85 c0                	test   %eax,%eax
c0006314:	74 19                	je     c000632f <fork+0x5a>
c0006316:	6a 14                	push   $0x14
c0006318:	68 91 b2 00 c0       	push   $0xc000b291
c000631d:	68 91 b2 00 c0       	push   $0xc000b291
c0006322:	68 9c b2 00 c0       	push   $0xc000b29c
c0006327:	e8 4a 33 00 00       	call   c0009676 <assertion_failure>
c000632c:	83 c4 10             	add    $0x10,%esp
c000632f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006332:	c9                   	leave  
c0006333:	c3                   	ret    

c0006334 <getpid>:
c0006334:	55                   	push   %ebp
c0006335:	89 e5                	mov    %esp,%ebp
c0006337:	83 ec 78             	sub    $0x78,%esp
c000633a:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0006341:	83 ec 04             	sub    $0x4,%esp
c0006344:	6a 05                	push   $0x5
c0006346:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006349:	50                   	push   %eax
c000634a:	6a 03                	push   $0x3
c000634c:	e8 95 3b 00 00       	call   c0009ee6 <send_rec>
c0006351:	83 c4 10             	add    $0x10,%esp
c0006354:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006357:	c9                   	leave  
c0006358:	c3                   	ret    

c0006359 <exec>:
c0006359:	55                   	push   %ebp
c000635a:	89 e5                	mov    %esp,%ebp
c000635c:	83 ec 78             	sub    $0x78,%esp
c000635f:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0006366:	8b 45 08             	mov    0x8(%ebp),%eax
c0006369:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000636c:	83 ec 0c             	sub    $0xc,%esp
c000636f:	ff 75 08             	pushl  0x8(%ebp)
c0006372:	e8 61 57 00 00       	call   c000bad8 <Strlen>
c0006377:	83 c4 10             	add    $0x10,%esp
c000637a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000637d:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0006384:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c000638b:	83 ec 04             	sub    $0x4,%esp
c000638e:	6a 01                	push   $0x1
c0006390:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006393:	50                   	push   %eax
c0006394:	6a 03                	push   $0x3
c0006396:	e8 4b 3b 00 00       	call   c0009ee6 <send_rec>
c000639b:	83 c4 10             	add    $0x10,%esp
c000639e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00063a1:	83 f8 65             	cmp    $0x65,%eax
c00063a4:	74 19                	je     c00063bf <exec+0x66>
c00063a6:	6a 19                	push   $0x19
c00063a8:	68 ac b2 00 c0       	push   $0xc000b2ac
c00063ad:	68 ac b2 00 c0       	push   $0xc000b2ac
c00063b2:	68 b7 b2 00 c0       	push   $0xc000b2b7
c00063b7:	e8 ba 32 00 00       	call   c0009676 <assertion_failure>
c00063bc:	83 c4 10             	add    $0x10,%esp
c00063bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00063c2:	c9                   	leave  
c00063c3:	c3                   	ret    

c00063c4 <execv>:
c00063c4:	55                   	push   %ebp
c00063c5:	89 e5                	mov    %esp,%ebp
c00063c7:	57                   	push   %edi
c00063c8:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c00063ce:	83 ec 04             	sub    $0x4,%esp
c00063d1:	68 00 80 00 00       	push   $0x8000
c00063d6:	6a 00                	push   $0x0
c00063d8:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00063de:	50                   	push   %eax
c00063df:	e8 bb 56 00 00       	call   c000ba9f <Memset>
c00063e4:	83 c4 10             	add    $0x10,%esp
c00063e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00063ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00063ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00063f4:	eb 0d                	jmp    c0006403 <execv+0x3f>
c00063f6:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00063fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00063fd:	83 c0 04             	add    $0x4,%eax
c0006400:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006403:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006406:	8b 00                	mov    (%eax),%eax
c0006408:	85 c0                	test   %eax,%eax
c000640a:	75 ea                	jne    c00063f6 <execv+0x32>
c000640c:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006412:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006415:	01 d0                	add    %edx,%eax
c0006417:	c6 00 00             	movb   $0x0,(%eax)
c000641a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000641d:	83 c0 04             	add    $0x4,%eax
c0006420:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006423:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006429:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000642c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000642f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006432:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006439:	eb 64                	jmp    c000649f <execv+0xdb>
c000643b:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006441:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006444:	01 c2                	add    %eax,%edx
c0006446:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006449:	89 10                	mov    %edx,(%eax)
c000644b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000644e:	8b 00                	mov    (%eax),%eax
c0006450:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0006456:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006459:	01 ca                	add    %ecx,%edx
c000645b:	83 ec 08             	sub    $0x8,%esp
c000645e:	50                   	push   %eax
c000645f:	52                   	push   %edx
c0006460:	e8 59 56 00 00       	call   c000babe <Strcpy>
c0006465:	83 c4 10             	add    $0x10,%esp
c0006468:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000646b:	8b 00                	mov    (%eax),%eax
c000646d:	83 ec 0c             	sub    $0xc,%esp
c0006470:	50                   	push   %eax
c0006471:	e8 62 56 00 00       	call   c000bad8 <Strlen>
c0006476:	83 c4 10             	add    $0x10,%esp
c0006479:	01 45 f0             	add    %eax,-0x10(%ebp)
c000647c:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006482:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006485:	01 d0                	add    %edx,%eax
c0006487:	c6 00 00             	movb   $0x0,(%eax)
c000648a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000648d:	83 c0 01             	add    $0x1,%eax
c0006490:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006493:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0006497:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000649b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000649f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00064a2:	8b 00                	mov    (%eax),%eax
c00064a4:	85 c0                	test   %eax,%eax
c00064a6:	75 93                	jne    c000643b <execv+0x77>
c00064a8:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00064ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00064b1:	eb 04                	jmp    c00064b7 <execv+0xf3>
c00064b3:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00064b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00064ba:	8b 00                	mov    (%eax),%eax
c00064bc:	85 c0                	test   %eax,%eax
c00064be:	75 f3                	jne    c00064b3 <execv+0xef>
c00064c0:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c00064c6:	b8 00 00 00 00       	mov    $0x0,%eax
c00064cb:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00064d0:	89 d7                	mov    %edx,%edi
c00064d2:	f3 ab                	rep stos %eax,%es:(%edi)
c00064d4:	c7 85 4c 7f ff ff cf 	movl   $0xc000b2cf,-0x80b4(%ebp)
c00064db:	b2 00 c0 
c00064de:	c7 85 50 7f ff ff d6 	movl   $0xc000b2d6,-0x80b0(%ebp)
c00064e5:	b2 00 c0 
c00064e8:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c00064ef:	00 00 00 
c00064f2:	8b 45 08             	mov    0x8(%ebp),%eax
c00064f5:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c00064fb:	83 ec 0c             	sub    $0xc,%esp
c00064fe:	ff 75 08             	pushl  0x8(%ebp)
c0006501:	e8 d2 55 00 00       	call   c000bad8 <Strlen>
c0006506:	83 c4 10             	add    $0x10,%esp
c0006509:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c000650f:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006515:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c000651b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000651e:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0006524:	83 ec 04             	sub    $0x4,%esp
c0006527:	6a 01                	push   $0x1
c0006529:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c000652f:	50                   	push   %eax
c0006530:	6a 03                	push   $0x3
c0006532:	e8 af 39 00 00       	call   c0009ee6 <send_rec>
c0006537:	83 c4 10             	add    $0x10,%esp
c000653a:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0006540:	83 f8 65             	cmp    $0x65,%eax
c0006543:	74 19                	je     c000655e <execv+0x19a>
c0006545:	6a 72                	push   $0x72
c0006547:	68 ac b2 00 c0       	push   $0xc000b2ac
c000654c:	68 ac b2 00 c0       	push   $0xc000b2ac
c0006551:	68 b7 b2 00 c0       	push   $0xc000b2b7
c0006556:	e8 1b 31 00 00       	call   c0009676 <assertion_failure>
c000655b:	83 c4 10             	add    $0x10,%esp
c000655e:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0006564:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0006567:	c9                   	leave  
c0006568:	c3                   	ret    

c0006569 <execl>:
c0006569:	55                   	push   %ebp
c000656a:	89 e5                	mov    %esp,%ebp
c000656c:	83 ec 18             	sub    $0x18,%esp
c000656f:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006572:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006575:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006578:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000657b:	83 ec 08             	sub    $0x8,%esp
c000657e:	ff 75 f0             	pushl  -0x10(%ebp)
c0006581:	ff 75 08             	pushl  0x8(%ebp)
c0006584:	e8 3b fe ff ff       	call   c00063c4 <execv>
c0006589:	83 c4 10             	add    $0x10,%esp
c000658c:	c9                   	leave  
c000658d:	c3                   	ret    

c000658e <TaskMM>:
c000658e:	55                   	push   %ebp
c000658f:	89 e5                	mov    %esp,%ebp
c0006591:	83 ec 28             	sub    $0x28,%esp
c0006594:	83 ec 0c             	sub    $0xc,%esp
c0006597:	6a 6c                	push   $0x6c
c0006599:	e8 16 c4 ff ff       	call   c00029b4 <sys_malloc>
c000659e:	83 c4 10             	add    $0x10,%esp
c00065a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00065a4:	83 ec 0c             	sub    $0xc,%esp
c00065a7:	6a 6c                	push   $0x6c
c00065a9:	e8 06 c4 ff ff       	call   c00029b4 <sys_malloc>
c00065ae:	83 c4 10             	add    $0x10,%esp
c00065b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00065b4:	83 ec 04             	sub    $0x4,%esp
c00065b7:	6a 12                	push   $0x12
c00065b9:	ff 75 f0             	pushl  -0x10(%ebp)
c00065bc:	6a 02                	push   $0x2
c00065be:	e8 23 39 00 00       	call   c0009ee6 <send_rec>
c00065c3:	83 c4 10             	add    $0x10,%esp
c00065c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065c9:	8b 40 68             	mov    0x68(%eax),%eax
c00065cc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00065cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065d2:	8b 00                	mov    (%eax),%eax
c00065d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00065d7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00065de:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00065e1:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00065e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00065eb:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c00065f2:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c00065f6:	74 4b                	je     c0006643 <TaskMM+0xb5>
c00065f8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c00065fc:	7f 08                	jg     c0006606 <TaskMM+0x78>
c00065fe:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0006602:	74 28                	je     c000662c <TaskMM+0x9e>
c0006604:	eb 6e                	jmp    c0006674 <TaskMM+0xe6>
c0006606:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c000660a:	74 08                	je     c0006614 <TaskMM+0x86>
c000660c:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0006610:	74 4b                	je     c000665d <TaskMM+0xcf>
c0006612:	eb 60                	jmp    c0006674 <TaskMM+0xe6>
c0006614:	83 ec 0c             	sub    $0xc,%esp
c0006617:	ff 75 f0             	pushl  -0x10(%ebp)
c000661a:	e8 e6 03 00 00       	call   c0006a05 <do_fork>
c000661f:	83 c4 10             	add    $0x10,%esp
c0006622:	89 c2                	mov    %eax,%edx
c0006624:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006627:	89 50 4c             	mov    %edx,0x4c(%eax)
c000662a:	eb 59                	jmp    c0006685 <TaskMM+0xf7>
c000662c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006633:	83 ec 0c             	sub    $0xc,%esp
c0006636:	ff 75 f0             	pushl  -0x10(%ebp)
c0006639:	e8 96 00 00 00       	call   c00066d4 <do_exec>
c000663e:	83 c4 10             	add    $0x10,%esp
c0006641:	eb 42                	jmp    c0006685 <TaskMM+0xf7>
c0006643:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000664a:	83 ec 08             	sub    $0x8,%esp
c000664d:	ff 75 e0             	pushl  -0x20(%ebp)
c0006650:	ff 75 f0             	pushl  -0x10(%ebp)
c0006653:	e8 18 04 00 00       	call   c0006a70 <do_exit>
c0006658:	83 c4 10             	add    $0x10,%esp
c000665b:	eb 28                	jmp    c0006685 <TaskMM+0xf7>
c000665d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006664:	83 ec 0c             	sub    $0xc,%esp
c0006667:	ff 75 f0             	pushl  -0x10(%ebp)
c000666a:	e8 fd 04 00 00       	call   c0006b6c <do_wait>
c000666f:	83 c4 10             	add    $0x10,%esp
c0006672:	eb 11                	jmp    c0006685 <TaskMM+0xf7>
c0006674:	83 ec 0c             	sub    $0xc,%esp
c0006677:	68 dd b2 00 c0       	push   $0xc000b2dd
c000667c:	e8 d7 2f 00 00       	call   c0009658 <panic>
c0006681:	83 c4 10             	add    $0x10,%esp
c0006684:	90                   	nop
c0006685:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006689:	0f 84 25 ff ff ff    	je     c00065b4 <TaskMM+0x26>
c000668f:	83 ec 0c             	sub    $0xc,%esp
c0006692:	6a 0a                	push   $0xa
c0006694:	e8 4c 2b 00 00       	call   c00091e5 <delay>
c0006699:	83 c4 10             	add    $0x10,%esp
c000669c:	e9 13 ff ff ff       	jmp    c00065b4 <TaskMM+0x26>

c00066a1 <alloc_mem>:
c00066a1:	55                   	push   %ebp
c00066a2:	89 e5                	mov    %esp,%ebp
c00066a4:	83 ec 10             	sub    $0x10,%esp
c00066a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00066aa:	83 e8 08             	sub    $0x8,%eax
c00066ad:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c00066b3:	05 00 00 a0 00       	add    $0xa00000,%eax
c00066b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00066bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00066be:	c9                   	leave  
c00066bf:	c3                   	ret    

c00066c0 <do_exec2>:
c00066c0:	55                   	push   %ebp
c00066c1:	89 e5                	mov    %esp,%ebp
c00066c3:	83 ec 10             	sub    $0x10,%esp
c00066c6:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c00066cd:	b8 00 00 00 00       	mov    $0x0,%eax
c00066d2:	c9                   	leave  
c00066d3:	c3                   	ret    

c00066d4 <do_exec>:
c00066d4:	55                   	push   %ebp
c00066d5:	89 e5                	mov    %esp,%ebp
c00066d7:	56                   	push   %esi
c00066d8:	53                   	push   %ebx
c00066d9:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c00066df:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c00066e6:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c00066ed:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c00066f3:	83 ec 08             	sub    $0x8,%esp
c00066f6:	6a 00                	push   $0x0
c00066f8:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00066fb:	50                   	push   %eax
c00066fc:	e8 b4 f9 ff ff       	call   c00060b5 <open>
c0006701:	83 c4 10             	add    $0x10,%esp
c0006704:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006707:	8b 45 08             	mov    0x8(%ebp),%eax
c000670a:	8b 00                	mov    (%eax),%eax
c000670c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000670f:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0006716:	83 ec 04             	sub    $0x4,%esp
c0006719:	6a 0c                	push   $0xc
c000671b:	6a 00                	push   $0x0
c000671d:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006723:	50                   	push   %eax
c0006724:	e8 76 53 00 00       	call   c000ba9f <Memset>
c0006729:	83 c4 10             	add    $0x10,%esp
c000672c:	8b 45 08             	mov    0x8(%ebp),%eax
c000672f:	8b 40 30             	mov    0x30(%eax),%eax
c0006732:	89 c6                	mov    %eax,%esi
c0006734:	8b 45 08             	mov    0x8(%ebp),%eax
c0006737:	8b 40 34             	mov    0x34(%eax),%eax
c000673a:	83 ec 08             	sub    $0x8,%esp
c000673d:	50                   	push   %eax
c000673e:	ff 75 d8             	pushl  -0x28(%ebp)
c0006741:	e8 4e e8 ff ff       	call   c0004f94 <v2l>
c0006746:	83 c4 10             	add    $0x10,%esp
c0006749:	89 c3                	mov    %eax,%ebx
c000674b:	83 ec 08             	sub    $0x8,%esp
c000674e:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006754:	50                   	push   %eax
c0006755:	6a 01                	push   $0x1
c0006757:	e8 38 e8 ff ff       	call   c0004f94 <v2l>
c000675c:	83 c4 10             	add    $0x10,%esp
c000675f:	83 ec 04             	sub    $0x4,%esp
c0006762:	56                   	push   %esi
c0006763:	53                   	push   %ebx
c0006764:	50                   	push   %eax
c0006765:	e8 34 14 00 00       	call   c0007b9e <Memcpy>
c000676a:	83 c4 10             	add    $0x10,%esp
c000676d:	83 ec 08             	sub    $0x8,%esp
c0006770:	6a 00                	push   $0x0
c0006772:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006778:	50                   	push   %eax
c0006779:	e8 37 f9 ff ff       	call   c00060b5 <open>
c000677e:	83 c4 10             	add    $0x10,%esp
c0006781:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006784:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000678b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000678e:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0006794:	01 d0                	add    %edx,%eax
c0006796:	83 ec 04             	sub    $0x4,%esp
c0006799:	68 00 02 00 00       	push   $0x200
c000679e:	50                   	push   %eax
c000679f:	ff 75 d0             	pushl  -0x30(%ebp)
c00067a2:	e8 93 f9 ff ff       	call   c000613a <read>
c00067a7:	83 c4 10             	add    $0x10,%esp
c00067aa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00067ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00067b0:	01 45 f4             	add    %eax,-0xc(%ebp)
c00067b3:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00067b7:	74 02                	je     c00067bb <do_exec+0xe7>
c00067b9:	eb d0                	jmp    c000678b <do_exec+0xb7>
c00067bb:	90                   	nop
c00067bc:	83 ec 0c             	sub    $0xc,%esp
c00067bf:	ff 75 d0             	pushl  -0x30(%ebp)
c00067c2:	e8 5b fa ff ff       	call   c0006222 <close>
c00067c7:	83 c4 10             	add    $0x10,%esp
c00067ca:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00067d0:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00067d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00067da:	eb 72                	jmp    c000684e <do_exec+0x17a>
c00067dc:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00067df:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00067e3:	0f b7 d0             	movzwl %ax,%edx
c00067e6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00067e9:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00067ed:	0f b7 c0             	movzwl %ax,%eax
c00067f0:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00067f4:	01 c2                	add    %eax,%edx
c00067f6:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00067fc:	01 d0                	add    %edx,%eax
c00067fe:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006801:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006804:	8b 40 10             	mov    0x10(%eax),%eax
c0006807:	89 c6                	mov    %eax,%esi
c0006809:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000680c:	8b 40 04             	mov    0x4(%eax),%eax
c000680f:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0006815:	01 d0                	add    %edx,%eax
c0006817:	83 ec 08             	sub    $0x8,%esp
c000681a:	50                   	push   %eax
c000681b:	6a 01                	push   $0x1
c000681d:	e8 72 e7 ff ff       	call   c0004f94 <v2l>
c0006822:	83 c4 10             	add    $0x10,%esp
c0006825:	89 c3                	mov    %eax,%ebx
c0006827:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000682a:	8b 40 08             	mov    0x8(%eax),%eax
c000682d:	83 ec 08             	sub    $0x8,%esp
c0006830:	50                   	push   %eax
c0006831:	ff 75 d8             	pushl  -0x28(%ebp)
c0006834:	e8 5b e7 ff ff       	call   c0004f94 <v2l>
c0006839:	83 c4 10             	add    $0x10,%esp
c000683c:	83 ec 04             	sub    $0x4,%esp
c000683f:	56                   	push   %esi
c0006840:	53                   	push   %ebx
c0006841:	50                   	push   %eax
c0006842:	e8 57 13 00 00       	call   c0007b9e <Memcpy>
c0006847:	83 c4 10             	add    $0x10,%esp
c000684a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000684e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006851:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0006855:	0f b7 c0             	movzwl %ax,%eax
c0006858:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000685b:	0f 8c 7b ff ff ff    	jl     c00067dc <do_exec+0x108>
c0006861:	8b 45 08             	mov    0x8(%ebp),%eax
c0006864:	8b 40 10             	mov    0x10(%eax),%eax
c0006867:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000686a:	8b 45 08             	mov    0x8(%ebp),%eax
c000686d:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006870:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006873:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c000687a:	83 ec 08             	sub    $0x8,%esp
c000687d:	ff 75 c0             	pushl  -0x40(%ebp)
c0006880:	ff 75 d8             	pushl  -0x28(%ebp)
c0006883:	e8 0c e7 ff ff       	call   c0004f94 <v2l>
c0006888:	83 c4 10             	add    $0x10,%esp
c000688b:	89 c3                	mov    %eax,%ebx
c000688d:	83 ec 08             	sub    $0x8,%esp
c0006890:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006896:	50                   	push   %eax
c0006897:	6a 01                	push   $0x1
c0006899:	e8 f6 e6 ff ff       	call   c0004f94 <v2l>
c000689e:	83 c4 10             	add    $0x10,%esp
c00068a1:	83 ec 04             	sub    $0x4,%esp
c00068a4:	ff 75 bc             	pushl  -0x44(%ebp)
c00068a7:	53                   	push   %ebx
c00068a8:	50                   	push   %eax
c00068a9:	e8 f0 12 00 00       	call   c0007b9e <Memcpy>
c00068ae:	83 c4 10             	add    $0x10,%esp
c00068b1:	83 ec 08             	sub    $0x8,%esp
c00068b4:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00068ba:	50                   	push   %eax
c00068bb:	6a 01                	push   $0x1
c00068bd:	e8 d2 e6 ff ff       	call   c0004f94 <v2l>
c00068c2:	83 c4 10             	add    $0x10,%esp
c00068c5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00068c8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00068cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068ce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00068d5:	eb 08                	jmp    c00068df <do_exec+0x20b>
c00068d7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00068db:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00068df:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068e2:	8b 00                	mov    (%eax),%eax
c00068e4:	85 c0                	test   %eax,%eax
c00068e6:	75 ef                	jne    c00068d7 <do_exec+0x203>
c00068e8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00068eb:	2b 45 c0             	sub    -0x40(%ebp),%eax
c00068ee:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00068f1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00068f8:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00068fe:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006901:	eb 17                	jmp    c000691a <do_exec+0x246>
c0006903:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006907:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000690a:	8b 10                	mov    (%eax),%edx
c000690c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000690f:	01 c2                	add    %eax,%edx
c0006911:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006914:	89 10                	mov    %edx,(%eax)
c0006916:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c000691a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000691d:	8b 00                	mov    (%eax),%eax
c000691f:	85 c0                	test   %eax,%eax
c0006921:	75 e0                	jne    c0006903 <do_exec+0x22f>
c0006923:	83 ec 08             	sub    $0x8,%esp
c0006926:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c000692c:	50                   	push   %eax
c000692d:	6a 01                	push   $0x1
c000692f:	e8 60 e6 ff ff       	call   c0004f94 <v2l>
c0006934:	83 c4 10             	add    $0x10,%esp
c0006937:	89 c3                	mov    %eax,%ebx
c0006939:	83 ec 08             	sub    $0x8,%esp
c000693c:	ff 75 b8             	pushl  -0x48(%ebp)
c000693f:	ff 75 d8             	pushl  -0x28(%ebp)
c0006942:	e8 4d e6 ff ff       	call   c0004f94 <v2l>
c0006947:	83 c4 10             	add    $0x10,%esp
c000694a:	83 ec 04             	sub    $0x4,%esp
c000694d:	ff 75 bc             	pushl  -0x44(%ebp)
c0006950:	53                   	push   %ebx
c0006951:	50                   	push   %eax
c0006952:	e8 47 12 00 00       	call   c0007b9e <Memcpy>
c0006957:	83 c4 10             	add    $0x10,%esp
c000695a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000695d:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006960:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006963:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006966:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c000696c:	81 c2 98 34 08 c0    	add    $0xc0083498,%edx
c0006972:	89 02                	mov    %eax,(%edx)
c0006974:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006977:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000697a:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c0006980:	81 c2 94 34 08 c0    	add    $0xc0083494,%edx
c0006986:	89 02                	mov    %eax,(%edx)
c0006988:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000698b:	8b 40 18             	mov    0x18(%eax),%eax
c000698e:	89 c2                	mov    %eax,%edx
c0006990:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006993:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006999:	05 9c 34 08 c0       	add    $0xc008349c,%eax
c000699e:	89 10                	mov    %edx,(%eax)
c00069a0:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00069a3:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00069a6:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c00069ac:	81 c2 a8 34 08 c0    	add    $0xc00834a8,%edx
c00069b2:	89 02                	mov    %eax,(%edx)
c00069b4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00069b7:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00069bd:	05 50 34 08 c0       	add    $0xc0083450,%eax
c00069c2:	c7 00 21 00 00 00    	movl   $0x21,(%eax)
c00069c8:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c00069cf:	00 00 00 
c00069d2:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c00069d9:	00 00 00 
c00069dc:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c00069e3:	00 00 00 
c00069e6:	83 ec 04             	sub    $0x4,%esp
c00069e9:	ff 75 d8             	pushl  -0x28(%ebp)
c00069ec:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c00069f2:	50                   	push   %eax
c00069f3:	6a 01                	push   $0x1
c00069f5:	e8 ec 34 00 00       	call   c0009ee6 <send_rec>
c00069fa:	83 c4 10             	add    $0x10,%esp
c00069fd:	90                   	nop
c00069fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0006a01:	5b                   	pop    %ebx
c0006a02:	5e                   	pop    %esi
c0006a03:	5d                   	pop    %ebp
c0006a04:	c3                   	ret    

c0006a05 <do_fork>:
c0006a05:	55                   	push   %ebp
c0006a06:	89 e5                	mov    %esp,%ebp
c0006a08:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006a0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a11:	8b 00                	mov    (%eax),%eax
c0006a13:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a16:	83 ec 0c             	sub    $0xc,%esp
c0006a19:	ff 75 f4             	pushl  -0xc(%ebp)
c0006a1c:	e8 0c 3d 00 00       	call   c000a72d <fork_process>
c0006a21:	83 c4 10             	add    $0x10,%esp
c0006a24:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a2a:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0006a30:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a33:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a36:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006a3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a3f:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006a42:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006a49:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006a50:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006a57:	83 ec 04             	sub    $0x4,%esp
c0006a5a:	ff 75 ec             	pushl  -0x14(%ebp)
c0006a5d:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006a60:	50                   	push   %eax
c0006a61:	6a 01                	push   $0x1
c0006a63:	e8 7e 34 00 00       	call   c0009ee6 <send_rec>
c0006a68:	83 c4 10             	add    $0x10,%esp
c0006a6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a6e:	c9                   	leave  
c0006a6f:	c3                   	ret    

c0006a70 <do_exit>:
c0006a70:	55                   	push   %ebp
c0006a71:	89 e5                	mov    %esp,%ebp
c0006a73:	83 ec 18             	sub    $0x18,%esp
c0006a76:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a79:	8b 00                	mov    (%eax),%eax
c0006a7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a81:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006a87:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006a8c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a92:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006a98:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006a9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a9e:	8b 40 44             	mov    0x44(%eax),%eax
c0006aa1:	89 c2                	mov    %eax,%edx
c0006aa3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006aa6:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006aac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006aaf:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006ab5:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006aba:	0f b6 00             	movzbl (%eax),%eax
c0006abd:	3c 04                	cmp    $0x4,%al
c0006abf:	75 21                	jne    c0006ae2 <do_exit+0x72>
c0006ac1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ac4:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006aca:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006acf:	c6 00 fb             	movb   $0xfb,(%eax)
c0006ad2:	83 ec 0c             	sub    $0xc,%esp
c0006ad5:	ff 75 ec             	pushl  -0x14(%ebp)
c0006ad8:	e8 59 01 00 00       	call   c0006c36 <cleanup>
c0006add:	83 c4 10             	add    $0x10,%esp
c0006ae0:	eb 0a                	jmp    c0006aec <do_exit+0x7c>
c0006ae2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ae5:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0006aec:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006af3:	eb 6e                	jmp    c0006b63 <do_exit+0xf3>
c0006af5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006af8:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006afe:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b03:	8b 00                	mov    (%eax),%eax
c0006b05:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006b08:	75 55                	jne    c0006b5f <do_exit+0xef>
c0006b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b0d:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b13:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b18:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0006b1e:	0f b6 05 69 44 08 c0 	movzbl 0xc0084469,%eax
c0006b25:	3c 04                	cmp    $0x4,%al
c0006b27:	75 36                	jne    c0006b5f <do_exit+0xef>
c0006b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b2c:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b32:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b37:	0f b6 00             	movzbl (%eax),%eax
c0006b3a:	3c 03                	cmp    $0x3,%al
c0006b3c:	75 21                	jne    c0006b5f <do_exit+0xef>
c0006b3e:	c6 05 69 44 08 c0 fb 	movb   $0xfb,0xc0084469
c0006b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b48:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b4e:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006b53:	83 ec 0c             	sub    $0xc,%esp
c0006b56:	50                   	push   %eax
c0006b57:	e8 da 00 00 00       	call   c0006c36 <cleanup>
c0006b5c:	83 c4 10             	add    $0x10,%esp
c0006b5f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b63:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006b67:	7e 8c                	jle    c0006af5 <do_exit+0x85>
c0006b69:	90                   	nop
c0006b6a:	c9                   	leave  
c0006b6b:	c3                   	ret    

c0006b6c <do_wait>:
c0006b6c:	55                   	push   %ebp
c0006b6d:	89 e5                	mov    %esp,%ebp
c0006b6f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006b75:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b78:	8b 00                	mov    (%eax),%eax
c0006b7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b7d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006b84:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006b8b:	eb 5f                	jmp    c0006bec <do_wait+0x80>
c0006b8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b90:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b96:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b9b:	8b 00                	mov    (%eax),%eax
c0006b9d:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006ba0:	75 46                	jne    c0006be8 <do_wait+0x7c>
c0006ba2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006ba6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006ba9:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006baf:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006bb4:	0f b6 00             	movzbl (%eax),%eax
c0006bb7:	3c 03                	cmp    $0x3,%al
c0006bb9:	75 2d                	jne    c0006be8 <do_wait+0x7c>
c0006bbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bbe:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006bc4:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006bc9:	c6 00 fb             	movb   $0xfb,(%eax)
c0006bcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006bcf:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006bd5:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006bda:	83 ec 0c             	sub    $0xc,%esp
c0006bdd:	50                   	push   %eax
c0006bde:	e8 53 00 00 00       	call   c0006c36 <cleanup>
c0006be3:	83 c4 10             	add    $0x10,%esp
c0006be6:	eb 4c                	jmp    c0006c34 <do_wait+0xc8>
c0006be8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006bec:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006bf0:	7e 9b                	jle    c0006b8d <do_wait+0x21>
c0006bf2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006bf6:	74 13                	je     c0006c0b <do_wait+0x9f>
c0006bf8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bfb:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006c01:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006c06:	c6 00 04             	movb   $0x4,(%eax)
c0006c09:	eb 29                	jmp    c0006c34 <do_wait+0xc8>
c0006c0b:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006c12:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006c19:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006c20:	83 ec 04             	sub    $0x4,%esp
c0006c23:	ff 75 ec             	pushl  -0x14(%ebp)
c0006c26:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006c29:	50                   	push   %eax
c0006c2a:	6a 01                	push   $0x1
c0006c2c:	e8 b5 32 00 00       	call   c0009ee6 <send_rec>
c0006c31:	83 c4 10             	add    $0x10,%esp
c0006c34:	c9                   	leave  
c0006c35:	c3                   	ret    

c0006c36 <cleanup>:
c0006c36:	55                   	push   %ebp
c0006c37:	89 e5                	mov    %esp,%ebp
c0006c39:	83 ec 78             	sub    $0x78,%esp
c0006c3c:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006c43:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006c4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c4d:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006c53:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c56:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c59:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006c5f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006c62:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c65:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006c6b:	83 ec 04             	sub    $0x4,%esp
c0006c6e:	50                   	push   %eax
c0006c6f:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006c72:	50                   	push   %eax
c0006c73:	6a 01                	push   $0x1
c0006c75:	e8 6c 32 00 00       	call   c0009ee6 <send_rec>
c0006c7a:	83 c4 10             	add    $0x10,%esp
c0006c7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c80:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006c87:	90                   	nop
c0006c88:	c9                   	leave  
c0006c89:	c3                   	ret    

c0006c8a <init_bitmap>:
c0006c8a:	55                   	push   %ebp
c0006c8b:	89 e5                	mov    %esp,%ebp
c0006c8d:	83 ec 08             	sub    $0x8,%esp
c0006c90:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c93:	8b 50 04             	mov    0x4(%eax),%edx
c0006c96:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c99:	8b 00                	mov    (%eax),%eax
c0006c9b:	83 ec 04             	sub    $0x4,%esp
c0006c9e:	52                   	push   %edx
c0006c9f:	6a 00                	push   $0x0
c0006ca1:	50                   	push   %eax
c0006ca2:	e8 f8 4d 00 00       	call   c000ba9f <Memset>
c0006ca7:	83 c4 10             	add    $0x10,%esp
c0006caa:	90                   	nop
c0006cab:	c9                   	leave  
c0006cac:	c3                   	ret    

c0006cad <test_bit_val>:
c0006cad:	55                   	push   %ebp
c0006cae:	89 e5                	mov    %esp,%ebp
c0006cb0:	53                   	push   %ebx
c0006cb1:	83 ec 10             	sub    $0x10,%esp
c0006cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cb7:	8d 50 07             	lea    0x7(%eax),%edx
c0006cba:	85 c0                	test   %eax,%eax
c0006cbc:	0f 48 c2             	cmovs  %edx,%eax
c0006cbf:	c1 f8 03             	sar    $0x3,%eax
c0006cc2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cc8:	99                   	cltd   
c0006cc9:	c1 ea 1d             	shr    $0x1d,%edx
c0006ccc:	01 d0                	add    %edx,%eax
c0006cce:	83 e0 07             	and    $0x7,%eax
c0006cd1:	29 d0                	sub    %edx,%eax
c0006cd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cd9:	8b 10                	mov    (%eax),%edx
c0006cdb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006cde:	01 d0                	add    %edx,%eax
c0006ce0:	0f b6 00             	movzbl (%eax),%eax
c0006ce3:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006ce6:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006cea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ced:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006cf2:	89 c1                	mov    %eax,%ecx
c0006cf4:	d3 e3                	shl    %cl,%ebx
c0006cf6:	89 d8                	mov    %ebx,%eax
c0006cf8:	21 c2                	and    %eax,%edx
c0006cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cfd:	89 c1                	mov    %eax,%ecx
c0006cff:	d3 fa                	sar    %cl,%edx
c0006d01:	89 d0                	mov    %edx,%eax
c0006d03:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d06:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006d0a:	0f 9f c0             	setg   %al
c0006d0d:	0f b6 c0             	movzbl %al,%eax
c0006d10:	83 c4 10             	add    $0x10,%esp
c0006d13:	5b                   	pop    %ebx
c0006d14:	5d                   	pop    %ebp
c0006d15:	c3                   	ret    

c0006d16 <set_bit_val>:
c0006d16:	55                   	push   %ebp
c0006d17:	89 e5                	mov    %esp,%ebp
c0006d19:	83 ec 10             	sub    $0x10,%esp
c0006d1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d1f:	8d 50 07             	lea    0x7(%eax),%edx
c0006d22:	85 c0                	test   %eax,%eax
c0006d24:	0f 48 c2             	cmovs  %edx,%eax
c0006d27:	c1 f8 03             	sar    $0x3,%eax
c0006d2a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d2d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d30:	99                   	cltd   
c0006d31:	c1 ea 1d             	shr    $0x1d,%edx
c0006d34:	01 d0                	add    %edx,%eax
c0006d36:	83 e0 07             	and    $0x7,%eax
c0006d39:	29 d0                	sub    %edx,%eax
c0006d3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d41:	8b 10                	mov    (%eax),%edx
c0006d43:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d46:	01 d0                	add    %edx,%eax
c0006d48:	0f b6 00             	movzbl (%eax),%eax
c0006d4b:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006d4e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006d52:	7e 13                	jle    c0006d67 <set_bit_val+0x51>
c0006d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d57:	ba 01 00 00 00       	mov    $0x1,%edx
c0006d5c:	89 c1                	mov    %eax,%ecx
c0006d5e:	d3 e2                	shl    %cl,%edx
c0006d60:	89 d0                	mov    %edx,%eax
c0006d62:	08 45 ff             	or     %al,-0x1(%ebp)
c0006d65:	eb 13                	jmp    c0006d7a <set_bit_val+0x64>
c0006d67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d6a:	ba 01 00 00 00       	mov    $0x1,%edx
c0006d6f:	89 c1                	mov    %eax,%ecx
c0006d71:	d3 e2                	shl    %cl,%edx
c0006d73:	89 d0                	mov    %edx,%eax
c0006d75:	f7 d0                	not    %eax
c0006d77:	20 45 ff             	and    %al,-0x1(%ebp)
c0006d7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d7d:	8b 10                	mov    (%eax),%edx
c0006d7f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d82:	01 c2                	add    %eax,%edx
c0006d84:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006d88:	88 02                	mov    %al,(%edx)
c0006d8a:	b8 01 00 00 00       	mov    $0x1,%eax
c0006d8f:	c9                   	leave  
c0006d90:	c3                   	ret    

c0006d91 <set_bits>:
c0006d91:	55                   	push   %ebp
c0006d92:	89 e5                	mov    %esp,%ebp
c0006d94:	83 ec 10             	sub    $0x10,%esp
c0006d97:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006d9e:	eb 1c                	jmp    c0006dbc <set_bits+0x2b>
c0006da0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006da3:	8d 50 01             	lea    0x1(%eax),%edx
c0006da6:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006da9:	ff 75 10             	pushl  0x10(%ebp)
c0006dac:	50                   	push   %eax
c0006dad:	ff 75 08             	pushl  0x8(%ebp)
c0006db0:	e8 61 ff ff ff       	call   c0006d16 <set_bit_val>
c0006db5:	83 c4 0c             	add    $0xc,%esp
c0006db8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006dbc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006dbf:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006dc2:	7c dc                	jl     c0006da0 <set_bits+0xf>
c0006dc4:	b8 01 00 00 00       	mov    $0x1,%eax
c0006dc9:	c9                   	leave  
c0006dca:	c3                   	ret    

c0006dcb <get_first_free_bit>:
c0006dcb:	55                   	push   %ebp
c0006dcc:	89 e5                	mov    %esp,%ebp
c0006dce:	83 ec 10             	sub    $0x10,%esp
c0006dd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dd4:	8b 40 04             	mov    0x4(%eax),%eax
c0006dd7:	c1 e0 03             	shl    $0x3,%eax
c0006dda:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ddd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006de0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006de3:	eb 1b                	jmp    c0006e00 <get_first_free_bit+0x35>
c0006de5:	ff 75 fc             	pushl  -0x4(%ebp)
c0006de8:	ff 75 08             	pushl  0x8(%ebp)
c0006deb:	e8 bd fe ff ff       	call   c0006cad <test_bit_val>
c0006df0:	83 c4 08             	add    $0x8,%esp
c0006df3:	85 c0                	test   %eax,%eax
c0006df5:	75 05                	jne    c0006dfc <get_first_free_bit+0x31>
c0006df7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006dfa:	eb 11                	jmp    c0006e0d <get_first_free_bit+0x42>
c0006dfc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006e00:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e03:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006e06:	7c dd                	jl     c0006de5 <get_first_free_bit+0x1a>
c0006e08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006e0d:	c9                   	leave  
c0006e0e:	c3                   	ret    

c0006e0f <get_bits>:
c0006e0f:	55                   	push   %ebp
c0006e10:	89 e5                	mov    %esp,%ebp
c0006e12:	83 ec 20             	sub    $0x20,%esp
c0006e15:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006e1c:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e1f:	ff 75 08             	pushl  0x8(%ebp)
c0006e22:	e8 a4 ff ff ff       	call   c0006dcb <get_first_free_bit>
c0006e27:	83 c4 08             	add    $0x8,%esp
c0006e2a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e30:	8b 40 04             	mov    0x4(%eax),%eax
c0006e33:	c1 e0 03             	shl    $0x3,%eax
c0006e36:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e3c:	83 e8 01             	sub    $0x1,%eax
c0006e3f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e42:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006e46:	75 08                	jne    c0006e50 <get_bits+0x41>
c0006e48:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e4b:	e9 85 00 00 00       	jmp    c0006ed5 <get_bits+0xc6>
c0006e50:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e53:	83 c0 01             	add    $0x1,%eax
c0006e56:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e59:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e5f:	eb 58                	jmp    c0006eb9 <get_bits+0xaa>
c0006e61:	ff 75 f8             	pushl  -0x8(%ebp)
c0006e64:	ff 75 08             	pushl  0x8(%ebp)
c0006e67:	e8 41 fe ff ff       	call   c0006cad <test_bit_val>
c0006e6c:	83 c4 08             	add    $0x8,%esp
c0006e6f:	85 c0                	test   %eax,%eax
c0006e71:	75 0a                	jne    c0006e7d <get_bits+0x6e>
c0006e73:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006e77:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006e7b:	eb 2b                	jmp    c0006ea8 <get_bits+0x99>
c0006e7d:	6a 00                	push   $0x0
c0006e7f:	ff 75 08             	pushl  0x8(%ebp)
c0006e82:	e8 44 ff ff ff       	call   c0006dcb <get_first_free_bit>
c0006e87:	83 c4 08             	add    $0x8,%esp
c0006e8a:	83 c0 01             	add    $0x1,%eax
c0006e8d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e93:	83 c0 01             	add    $0x1,%eax
c0006e96:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e99:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ea2:	83 e8 01             	sub    $0x1,%eax
c0006ea5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ea8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006eab:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006eae:	7c 09                	jl     c0006eb9 <get_bits+0xaa>
c0006eb0:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006eb7:	eb 0d                	jmp    c0006ec6 <get_bits+0xb7>
c0006eb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ebc:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006ebf:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006ec2:	85 c0                	test   %eax,%eax
c0006ec4:	7f 9b                	jg     c0006e61 <get_bits+0x52>
c0006ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ec9:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006ecc:	83 c0 01             	add    $0x1,%eax
c0006ecf:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ed2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ed5:	c9                   	leave  
c0006ed6:	c3                   	ret    

c0006ed7 <get_a_page2>:
c0006ed7:	55                   	push   %ebp
c0006ed8:	89 e5                	mov    %esp,%ebp
c0006eda:	83 ec 18             	sub    $0x18,%esp
c0006edd:	83 ec 0c             	sub    $0xc,%esp
c0006ee0:	ff 75 0c             	pushl  0xc(%ebp)
c0006ee3:	e8 1e 00 00 00       	call   c0006f06 <get_a_page>
c0006ee8:	83 c4 10             	add    $0x10,%esp
c0006eeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006eee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006ef1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ef4:	83 ec 08             	sub    $0x8,%esp
c0006ef7:	52                   	push   %edx
c0006ef8:	50                   	push   %eax
c0006ef9:	e8 61 01 00 00       	call   c000705f <add_map_entry>
c0006efe:	83 c4 10             	add    $0x10,%esp
c0006f01:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f04:	c9                   	leave  
c0006f05:	c3                   	ret    

c0006f06 <get_a_page>:
c0006f06:	55                   	push   %ebp
c0006f07:	89 e5                	mov    %esp,%ebp
c0006f09:	83 ec 20             	sub    $0x20,%esp
c0006f0c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006f10:	75 22                	jne    c0006f34 <get_a_page+0x2e>
c0006f12:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006f17:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f1a:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006f1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f22:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006f27:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f2a:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006f2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f32:	eb 20                	jmp    c0006f54 <get_a_page+0x4e>
c0006f34:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006f39:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f3c:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006f41:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f44:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006f49:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f4c:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006f51:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f54:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006f57:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006f5a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006f5d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006f60:	6a 01                	push   $0x1
c0006f62:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006f65:	50                   	push   %eax
c0006f66:	e8 a4 fe ff ff       	call   c0006e0f <get_bits>
c0006f6b:	83 c4 08             	add    $0x8,%esp
c0006f6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006f74:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006f77:	c1 e2 0c             	shl    $0xc,%edx
c0006f7a:	01 d0                	add    %edx,%eax
c0006f7c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f7f:	6a 01                	push   $0x1
c0006f81:	ff 75 fc             	pushl  -0x4(%ebp)
c0006f84:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006f87:	50                   	push   %eax
c0006f88:	e8 89 fd ff ff       	call   c0006d16 <set_bit_val>
c0006f8d:	83 c4 0c             	add    $0xc,%esp
c0006f90:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f93:	c9                   	leave  
c0006f94:	c3                   	ret    

c0006f95 <get_virtual_address>:
c0006f95:	55                   	push   %ebp
c0006f96:	89 e5                	mov    %esp,%ebp
c0006f98:	83 ec 28             	sub    $0x28,%esp
c0006f9b:	e8 08 a9 ff ff       	call   c00018a8 <get_running_thread_pcb>
c0006fa0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fa3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006fa7:	75 1a                	jne    c0006fc3 <get_virtual_address+0x2e>
c0006fa9:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006fae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006fb1:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006fb6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006fb9:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006fbe:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fc1:	eb 18                	jmp    c0006fdb <get_virtual_address+0x46>
c0006fc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006fc6:	8b 40 0c             	mov    0xc(%eax),%eax
c0006fc9:	83 ec 04             	sub    $0x4,%esp
c0006fcc:	6a 0c                	push   $0xc
c0006fce:	50                   	push   %eax
c0006fcf:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006fd2:	50                   	push   %eax
c0006fd3:	e8 c6 0b 00 00       	call   c0007b9e <Memcpy>
c0006fd8:	83 c4 10             	add    $0x10,%esp
c0006fdb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006fde:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006fe1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006fe4:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006fe7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fea:	83 ec 08             	sub    $0x8,%esp
c0006fed:	50                   	push   %eax
c0006fee:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ff1:	50                   	push   %eax
c0006ff2:	e8 18 fe ff ff       	call   c0006e0f <get_bits>
c0006ff7:	83 c4 10             	add    $0x10,%esp
c0006ffa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ffd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007000:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0007003:	c1 e2 0c             	shl    $0xc,%edx
c0007006:	01 d0                	add    %edx,%eax
c0007008:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000700b:	8b 45 08             	mov    0x8(%ebp),%eax
c000700e:	50                   	push   %eax
c000700f:	6a 01                	push   $0x1
c0007011:	ff 75 f0             	pushl  -0x10(%ebp)
c0007014:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007017:	50                   	push   %eax
c0007018:	e8 74 fd ff ff       	call   c0006d91 <set_bits>
c000701d:	83 c4 10             	add    $0x10,%esp
c0007020:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007023:	c9                   	leave  
c0007024:	c3                   	ret    

c0007025 <ptr_pde>:
c0007025:	55                   	push   %ebp
c0007026:	89 e5                	mov    %esp,%ebp
c0007028:	8b 45 08             	mov    0x8(%ebp),%eax
c000702b:	c1 e8 16             	shr    $0x16,%eax
c000702e:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0007033:	c1 e0 02             	shl    $0x2,%eax
c0007036:	5d                   	pop    %ebp
c0007037:	c3                   	ret    

c0007038 <ptr_pte>:
c0007038:	55                   	push   %ebp
c0007039:	89 e5                	mov    %esp,%ebp
c000703b:	8b 45 08             	mov    0x8(%ebp),%eax
c000703e:	c1 e8 0a             	shr    $0xa,%eax
c0007041:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0007046:	89 c2                	mov    %eax,%edx
c0007048:	8b 45 08             	mov    0x8(%ebp),%eax
c000704b:	c1 e8 0c             	shr    $0xc,%eax
c000704e:	25 ff 03 00 00       	and    $0x3ff,%eax
c0007053:	c1 e0 02             	shl    $0x2,%eax
c0007056:	01 d0                	add    %edx,%eax
c0007058:	2d 00 00 40 00       	sub    $0x400000,%eax
c000705d:	5d                   	pop    %ebp
c000705e:	c3                   	ret    

c000705f <add_map_entry>:
c000705f:	55                   	push   %ebp
c0007060:	89 e5                	mov    %esp,%ebp
c0007062:	83 ec 18             	sub    $0x18,%esp
c0007065:	ff 75 08             	pushl  0x8(%ebp)
c0007068:	e8 b8 ff ff ff       	call   c0007025 <ptr_pde>
c000706d:	83 c4 04             	add    $0x4,%esp
c0007070:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007073:	ff 75 08             	pushl  0x8(%ebp)
c0007076:	e8 bd ff ff ff       	call   c0007038 <ptr_pte>
c000707b:	83 c4 04             	add    $0x4,%esp
c000707e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007081:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007084:	8b 00                	mov    (%eax),%eax
c0007086:	83 e0 01             	and    $0x1,%eax
c0007089:	85 c0                	test   %eax,%eax
c000708b:	74 1b                	je     c00070a8 <add_map_entry+0x49>
c000708d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007090:	8b 00                	mov    (%eax),%eax
c0007092:	83 e0 01             	and    $0x1,%eax
c0007095:	85 c0                	test   %eax,%eax
c0007097:	75 51                	jne    c00070ea <add_map_entry+0x8b>
c0007099:	8b 45 0c             	mov    0xc(%ebp),%eax
c000709c:	83 c8 07             	or     $0x7,%eax
c000709f:	89 c2                	mov    %eax,%edx
c00070a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070a4:	89 10                	mov    %edx,(%eax)
c00070a6:	eb 42                	jmp    c00070ea <add_map_entry+0x8b>
c00070a8:	6a 00                	push   $0x0
c00070aa:	e8 57 fe ff ff       	call   c0006f06 <get_a_page>
c00070af:	83 c4 04             	add    $0x4,%esp
c00070b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00070b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070b8:	83 c8 07             	or     $0x7,%eax
c00070bb:	89 c2                	mov    %eax,%edx
c00070bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070c0:	89 10                	mov    %edx,(%eax)
c00070c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070c5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070ca:	83 ec 04             	sub    $0x4,%esp
c00070cd:	68 00 10 00 00       	push   $0x1000
c00070d2:	6a 00                	push   $0x0
c00070d4:	50                   	push   %eax
c00070d5:	e8 c5 49 00 00       	call   c000ba9f <Memset>
c00070da:	83 c4 10             	add    $0x10,%esp
c00070dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070e0:	83 c8 07             	or     $0x7,%eax
c00070e3:	89 c2                	mov    %eax,%edx
c00070e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070e8:	89 10                	mov    %edx,(%eax)
c00070ea:	90                   	nop
c00070eb:	c9                   	leave  
c00070ec:	c3                   	ret    

c00070ed <alloc_virtual_memory>:
c00070ed:	55                   	push   %ebp
c00070ee:	89 e5                	mov    %esp,%ebp
c00070f0:	83 ec 28             	sub    $0x28,%esp
c00070f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00070f6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0007101:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007104:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007107:	8b 45 0c             	mov    0xc(%ebp),%eax
c000710a:	01 45 e4             	add    %eax,-0x1c(%ebp)
c000710d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007110:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007115:	c1 e8 0c             	shr    $0xc,%eax
c0007118:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000711b:	e8 88 a7 ff ff       	call   c00018a8 <get_running_thread_pcb>
c0007120:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007123:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007126:	8b 40 08             	mov    0x8(%eax),%eax
c0007129:	85 c0                	test   %eax,%eax
c000712b:	75 09                	jne    c0007136 <alloc_virtual_memory+0x49>
c000712d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007134:	eb 07                	jmp    c000713d <alloc_virtual_memory+0x50>
c0007136:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000713d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007144:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000714b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007152:	eb 47                	jmp    c000719b <alloc_virtual_memory+0xae>
c0007154:	83 ec 08             	sub    $0x8,%esp
c0007157:	ff 75 f0             	pushl  -0x10(%ebp)
c000715a:	6a 01                	push   $0x1
c000715c:	e8 34 fe ff ff       	call   c0006f95 <get_virtual_address>
c0007161:	83 c4 10             	add    $0x10,%esp
c0007164:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007167:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000716b:	74 13                	je     c0007180 <alloc_virtual_memory+0x93>
c000716d:	83 ec 0c             	sub    $0xc,%esp
c0007170:	ff 75 f0             	pushl  -0x10(%ebp)
c0007173:	e8 8e fd ff ff       	call   c0006f06 <get_a_page>
c0007178:	83 c4 10             	add    $0x10,%esp
c000717b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000717e:	eb 06                	jmp    c0007186 <alloc_virtual_memory+0x99>
c0007180:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007183:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007186:	83 ec 08             	sub    $0x8,%esp
c0007189:	ff 75 f4             	pushl  -0xc(%ebp)
c000718c:	ff 75 d8             	pushl  -0x28(%ebp)
c000718f:	e8 cb fe ff ff       	call   c000705f <add_map_entry>
c0007194:	83 c4 10             	add    $0x10,%esp
c0007197:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000719b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000719e:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00071a1:	72 b1                	jb     c0007154 <alloc_virtual_memory+0x67>
c00071a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00071a6:	25 ff 0f 00 00       	and    $0xfff,%eax
c00071ab:	89 c2                	mov    %eax,%edx
c00071ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071b0:	01 d0                	add    %edx,%eax
c00071b2:	c9                   	leave  
c00071b3:	c3                   	ret    

c00071b4 <get_physical_address>:
c00071b4:	55                   	push   %ebp
c00071b5:	89 e5                	mov    %esp,%ebp
c00071b7:	83 ec 10             	sub    $0x10,%esp
c00071ba:	ff 75 08             	pushl  0x8(%ebp)
c00071bd:	e8 76 fe ff ff       	call   c0007038 <ptr_pte>
c00071c2:	83 c4 04             	add    $0x4,%esp
c00071c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00071c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00071cb:	8b 00                	mov    (%eax),%eax
c00071cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00071d2:	89 c2                	mov    %eax,%edx
c00071d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00071d7:	25 ff 0f 00 00       	and    $0xfff,%eax
c00071dc:	09 d0                	or     %edx,%eax
c00071de:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00071e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00071e4:	c9                   	leave  
c00071e5:	c3                   	ret    

c00071e6 <alloc_physical_memory>:
c00071e6:	55                   	push   %ebp
c00071e7:	89 e5                	mov    %esp,%ebp
c00071e9:	83 ec 38             	sub    $0x38,%esp
c00071ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00071ef:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00071f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00071f7:	e8 ac a6 ff ff       	call   c00018a8 <get_running_thread_pcb>
c00071fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00071ff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007203:	75 1a                	jne    c000721f <alloc_physical_memory+0x39>
c0007205:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000720a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000720d:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007212:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007215:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000721a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000721d:	eb 18                	jmp    c0007237 <alloc_physical_memory+0x51>
c000721f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007222:	8b 40 0c             	mov    0xc(%eax),%eax
c0007225:	83 ec 04             	sub    $0x4,%esp
c0007228:	6a 0c                	push   $0xc
c000722a:	50                   	push   %eax
c000722b:	8d 45 d8             	lea    -0x28(%ebp),%eax
c000722e:	50                   	push   %eax
c000722f:	e8 6a 09 00 00       	call   c0007b9e <Memcpy>
c0007234:	83 c4 10             	add    $0x10,%esp
c0007237:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000723a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000723d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007240:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0007243:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007246:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007249:	29 c2                	sub    %eax,%edx
c000724b:	89 d0                	mov    %edx,%eax
c000724d:	c1 e8 0c             	shr    $0xc,%eax
c0007250:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007253:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007256:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0007259:	c1 e2 0c             	shl    $0xc,%edx
c000725c:	01 d0                	add    %edx,%eax
c000725e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007261:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007264:	6a 01                	push   $0x1
c0007266:	6a 01                	push   $0x1
c0007268:	50                   	push   %eax
c0007269:	8d 45 d0             	lea    -0x30(%ebp),%eax
c000726c:	50                   	push   %eax
c000726d:	e8 1f fb ff ff       	call   c0006d91 <set_bits>
c0007272:	83 c4 10             	add    $0x10,%esp
c0007275:	83 ec 0c             	sub    $0xc,%esp
c0007278:	ff 75 0c             	pushl  0xc(%ebp)
c000727b:	e8 86 fc ff ff       	call   c0006f06 <get_a_page>
c0007280:	83 c4 10             	add    $0x10,%esp
c0007283:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007286:	83 ec 08             	sub    $0x8,%esp
c0007289:	ff 75 e4             	pushl  -0x1c(%ebp)
c000728c:	ff 75 08             	pushl  0x8(%ebp)
c000728f:	e8 cb fd ff ff       	call   c000705f <add_map_entry>
c0007294:	83 c4 10             	add    $0x10,%esp
c0007297:	8b 45 08             	mov    0x8(%ebp),%eax
c000729a:	c9                   	leave  
c000729b:	c3                   	ret    

c000729c <alloc_memory>:
c000729c:	55                   	push   %ebp
c000729d:	89 e5                	mov    %esp,%ebp
c000729f:	83 ec 18             	sub    $0x18,%esp
c00072a2:	83 ec 08             	sub    $0x8,%esp
c00072a5:	ff 75 0c             	pushl  0xc(%ebp)
c00072a8:	ff 75 08             	pushl  0x8(%ebp)
c00072ab:	e8 e5 fc ff ff       	call   c0006f95 <get_virtual_address>
c00072b0:	83 c4 10             	add    $0x10,%esp
c00072b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00072b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072b9:	2d 00 10 00 00       	sub    $0x1000,%eax
c00072be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00072c1:	eb 29                	jmp    c00072ec <alloc_memory+0x50>
c00072c3:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c00072ca:	83 ec 0c             	sub    $0xc,%esp
c00072cd:	ff 75 0c             	pushl  0xc(%ebp)
c00072d0:	e8 31 fc ff ff       	call   c0006f06 <get_a_page>
c00072d5:	83 c4 10             	add    $0x10,%esp
c00072d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00072db:	83 ec 08             	sub    $0x8,%esp
c00072de:	ff 75 ec             	pushl  -0x14(%ebp)
c00072e1:	ff 75 f4             	pushl  -0xc(%ebp)
c00072e4:	e8 76 fd ff ff       	call   c000705f <add_map_entry>
c00072e9:	83 c4 10             	add    $0x10,%esp
c00072ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00072ef:	8d 50 ff             	lea    -0x1(%eax),%edx
c00072f2:	89 55 08             	mov    %edx,0x8(%ebp)
c00072f5:	85 c0                	test   %eax,%eax
c00072f7:	75 ca                	jne    c00072c3 <alloc_memory+0x27>
c00072f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072fc:	c9                   	leave  
c00072fd:	c3                   	ret    

c00072fe <get_a_virtual_page>:
c00072fe:	55                   	push   %ebp
c00072ff:	89 e5                	mov    %esp,%ebp
c0007301:	83 ec 18             	sub    $0x18,%esp
c0007304:	ff 75 08             	pushl  0x8(%ebp)
c0007307:	e8 fa fb ff ff       	call   c0006f06 <get_a_page>
c000730c:	83 c4 04             	add    $0x4,%esp
c000730f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007312:	83 ec 08             	sub    $0x8,%esp
c0007315:	ff 75 f4             	pushl  -0xc(%ebp)
c0007318:	ff 75 0c             	pushl  0xc(%ebp)
c000731b:	e8 3f fd ff ff       	call   c000705f <add_map_entry>
c0007320:	83 c4 10             	add    $0x10,%esp
c0007323:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007326:	c9                   	leave  
c0007327:	c3                   	ret    

c0007328 <block2arena>:
c0007328:	55                   	push   %ebp
c0007329:	89 e5                	mov    %esp,%ebp
c000732b:	83 ec 10             	sub    $0x10,%esp
c000732e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007331:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007336:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007339:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000733c:	c9                   	leave  
c000733d:	c3                   	ret    

c000733e <sys_malloc2>:
c000733e:	55                   	push   %ebp
c000733f:	89 e5                	mov    %esp,%ebp
c0007341:	83 ec 58             	sub    $0x58,%esp
c0007344:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000734b:	e8 58 a5 ff ff       	call   c00018a8 <get_running_thread_pcb>
c0007350:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007353:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007356:	8b 40 08             	mov    0x8(%eax),%eax
c0007359:	85 c0                	test   %eax,%eax
c000735b:	75 10                	jne    c000736d <sys_malloc2+0x2f>
c000735d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007364:	c7 45 ec 80 47 08 c0 	movl   $0xc0084780,-0x14(%ebp)
c000736b:	eb 10                	jmp    c000737d <sys_malloc2+0x3f>
c000736d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007374:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007377:	83 c0 10             	add    $0x10,%eax
c000737a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000737d:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0007384:	76 50                	jbe    c00073d6 <sys_malloc2+0x98>
c0007386:	8b 45 08             	mov    0x8(%ebp),%eax
c0007389:	05 0b 10 00 00       	add    $0x100b,%eax
c000738e:	c1 e8 0c             	shr    $0xc,%eax
c0007391:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007394:	83 ec 08             	sub    $0x8,%esp
c0007397:	ff 75 f0             	pushl  -0x10(%ebp)
c000739a:	ff 75 d8             	pushl  -0x28(%ebp)
c000739d:	e8 fa fe ff ff       	call   c000729c <alloc_memory>
c00073a2:	83 c4 10             	add    $0x10,%esp
c00073a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00073a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00073ab:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00073ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073b1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00073b7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073ba:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00073c1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073c4:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c00073c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073cb:	83 c0 0c             	add    $0xc,%eax
c00073ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00073d1:	e9 b2 01 00 00       	jmp    c0007588 <sys_malloc2+0x24a>
c00073d6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00073dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00073e4:	eb 26                	jmp    c000740c <sys_malloc2+0xce>
c00073e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00073e9:	89 d0                	mov    %edx,%eax
c00073eb:	01 c0                	add    %eax,%eax
c00073ed:	01 d0                	add    %edx,%eax
c00073ef:	c1 e0 03             	shl    $0x3,%eax
c00073f2:	89 c2                	mov    %eax,%edx
c00073f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00073f7:	01 d0                	add    %edx,%eax
c00073f9:	8b 00                	mov    (%eax),%eax
c00073fb:	39 45 08             	cmp    %eax,0x8(%ebp)
c00073fe:	77 08                	ja     c0007408 <sys_malloc2+0xca>
c0007400:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007403:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007406:	eb 0a                	jmp    c0007412 <sys_malloc2+0xd4>
c0007408:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000740c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007410:	7e d4                	jle    c00073e6 <sys_malloc2+0xa8>
c0007412:	83 ec 08             	sub    $0x8,%esp
c0007415:	ff 75 f0             	pushl  -0x10(%ebp)
c0007418:	6a 01                	push   $0x1
c000741a:	e8 7d fe ff ff       	call   c000729c <alloc_memory>
c000741f:	83 c4 10             	add    $0x10,%esp
c0007422:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007425:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007428:	89 d0                	mov    %edx,%eax
c000742a:	01 c0                	add    %eax,%eax
c000742c:	01 d0                	add    %edx,%eax
c000742e:	c1 e0 03             	shl    $0x3,%eax
c0007431:	89 c2                	mov    %eax,%edx
c0007433:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007436:	01 d0                	add    %edx,%eax
c0007438:	83 ec 04             	sub    $0x4,%esp
c000743b:	6a 18                	push   $0x18
c000743d:	50                   	push   %eax
c000743e:	ff 75 cc             	pushl  -0x34(%ebp)
c0007441:	e8 58 07 00 00       	call   c0007b9e <Memcpy>
c0007446:	83 c4 10             	add    $0x10,%esp
c0007449:	e8 ec 06 00 00       	call   c0007b3a <intr_disable>
c000744e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007451:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007454:	89 d0                	mov    %edx,%eax
c0007456:	01 c0                	add    %eax,%eax
c0007458:	01 d0                	add    %edx,%eax
c000745a:	c1 e0 03             	shl    $0x3,%eax
c000745d:	89 c2                	mov    %eax,%edx
c000745f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007462:	01 d0                	add    %edx,%eax
c0007464:	83 c0 08             	add    $0x8,%eax
c0007467:	83 ec 0c             	sub    $0xc,%esp
c000746a:	50                   	push   %eax
c000746b:	e8 13 35 00 00       	call   c000a983 <isListEmpty>
c0007470:	83 c4 10             	add    $0x10,%esp
c0007473:	3c 01                	cmp    $0x1,%al
c0007475:	0f 85 91 00 00 00    	jne    c000750c <sys_malloc2+0x1ce>
c000747b:	83 ec 08             	sub    $0x8,%esp
c000747e:	ff 75 f0             	pushl  -0x10(%ebp)
c0007481:	6a 01                	push   $0x1
c0007483:	e8 14 fe ff ff       	call   c000729c <alloc_memory>
c0007488:	83 c4 10             	add    $0x10,%esp
c000748b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000748e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007491:	8b 00                	mov    (%eax),%eax
c0007493:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007496:	c7 45 bc 0c 00 00 00 	movl   $0xc,-0x44(%ebp)
c000749d:	b8 00 10 00 00       	mov    $0x1000,%eax
c00074a2:	2b 45 bc             	sub    -0x44(%ebp),%eax
c00074a5:	ba 00 00 00 00       	mov    $0x0,%edx
c00074aa:	f7 75 c0             	divl   -0x40(%ebp)
c00074ad:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00074b0:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c00074b3:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00074b6:	01 d0                	add    %edx,%eax
c00074b8:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00074bb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00074c2:	eb 3b                	jmp    c00074ff <sys_malloc2+0x1c1>
c00074c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00074c7:	0f af 45 c0          	imul   -0x40(%ebp),%eax
c00074cb:	89 c2                	mov    %eax,%edx
c00074cd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00074d0:	01 d0                	add    %edx,%eax
c00074d2:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00074d5:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c00074d8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00074db:	89 d0                	mov    %edx,%eax
c00074dd:	01 c0                	add    %eax,%eax
c00074df:	01 d0                	add    %edx,%eax
c00074e1:	c1 e0 03             	shl    $0x3,%eax
c00074e4:	89 c2                	mov    %eax,%edx
c00074e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074e9:	01 d0                	add    %edx,%eax
c00074eb:	83 c0 08             	add    $0x8,%eax
c00074ee:	83 ec 08             	sub    $0x8,%esp
c00074f1:	51                   	push   %ecx
c00074f2:	50                   	push   %eax
c00074f3:	e8 88 35 00 00       	call   c000aa80 <appendToDoubleLinkList>
c00074f8:	83 c4 10             	add    $0x10,%esp
c00074fb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00074ff:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007502:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007505:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007508:	39 c2                	cmp    %eax,%edx
c000750a:	77 b8                	ja     c00074c4 <sys_malloc2+0x186>
c000750c:	83 ec 0c             	sub    $0xc,%esp
c000750f:	ff 75 c8             	pushl  -0x38(%ebp)
c0007512:	e8 4c 06 00 00       	call   c0007b63 <intr_set_status>
c0007517:	83 c4 10             	add    $0x10,%esp
c000751a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000751d:	89 d0                	mov    %edx,%eax
c000751f:	01 c0                	add    %eax,%eax
c0007521:	01 d0                	add    %edx,%eax
c0007523:	c1 e0 03             	shl    $0x3,%eax
c0007526:	89 c2                	mov    %eax,%edx
c0007528:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000752b:	01 d0                	add    %edx,%eax
c000752d:	83 c0 08             	add    $0x8,%eax
c0007530:	83 ec 0c             	sub    $0xc,%esp
c0007533:	50                   	push   %eax
c0007534:	e8 b1 36 00 00       	call   c000abea <popFromDoubleLinkList>
c0007539:	83 c4 10             	add    $0x10,%esp
c000753c:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000753f:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0007542:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007545:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c0007549:	75 1c                	jne    c0007567 <sys_malloc2+0x229>
c000754b:	68 9b 01 00 00       	push   $0x19b
c0007550:	68 ee b2 00 c0       	push   $0xc000b2ee
c0007555:	68 ee b2 00 c0       	push   $0xc000b2ee
c000755a:	68 f8 b2 00 c0       	push   $0xc000b2f8
c000755f:	e8 12 21 00 00       	call   c0009676 <assertion_failure>
c0007564:	83 c4 10             	add    $0x10,%esp
c0007567:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000756a:	83 ec 0c             	sub    $0xc,%esp
c000756d:	50                   	push   %eax
c000756e:	e8 b5 fd ff ff       	call   c0007328 <block2arena>
c0007573:	83 c4 10             	add    $0x10,%esp
c0007576:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0007579:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000757c:	8b 40 04             	mov    0x4(%eax),%eax
c000757f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007582:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0007585:	89 50 04             	mov    %edx,0x4(%eax)
c0007588:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000758c:	75 1c                	jne    c00075aa <sys_malloc2+0x26c>
c000758e:	68 a1 01 00 00       	push   $0x1a1
c0007593:	68 ee b2 00 c0       	push   $0xc000b2ee
c0007598:	68 ee b2 00 c0       	push   $0xc000b2ee
c000759d:	68 0a b3 00 c0       	push   $0xc000b30a
c00075a2:	e8 cf 20 00 00       	call   c0009676 <assertion_failure>
c00075a7:	83 c4 10             	add    $0x10,%esp
c00075aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00075ad:	c9                   	leave  
c00075ae:	c3                   	ret    

c00075af <remove_map_entry>:
c00075af:	55                   	push   %ebp
c00075b0:	89 e5                	mov    %esp,%ebp
c00075b2:	83 ec 10             	sub    $0x10,%esp
c00075b5:	ff 75 08             	pushl  0x8(%ebp)
c00075b8:	e8 7b fa ff ff       	call   c0007038 <ptr_pte>
c00075bd:	83 c4 04             	add    $0x4,%esp
c00075c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00075c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00075c6:	8b 10                	mov    (%eax),%edx
c00075c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00075cb:	89 10                	mov    %edx,(%eax)
c00075cd:	90                   	nop
c00075ce:	c9                   	leave  
c00075cf:	c3                   	ret    

c00075d0 <free_a_page>:
c00075d0:	55                   	push   %ebp
c00075d1:	89 e5                	mov    %esp,%ebp
c00075d3:	83 ec 20             	sub    $0x20,%esp
c00075d6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00075da:	75 21                	jne    c00075fd <free_a_page+0x2d>
c00075dc:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00075e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00075e4:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00075e9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00075ec:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00075f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00075f4:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c00075fb:	eb 1f                	jmp    c000761c <free_a_page+0x4c>
c00075fd:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007602:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007605:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000760a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000760d:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007612:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007615:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c000761c:	8b 45 08             	mov    0x8(%ebp),%eax
c000761f:	c1 e8 0c             	shr    $0xc,%eax
c0007622:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007625:	6a 00                	push   $0x0
c0007627:	ff 75 f8             	pushl  -0x8(%ebp)
c000762a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000762d:	50                   	push   %eax
c000762e:	e8 e3 f6 ff ff       	call   c0006d16 <set_bit_val>
c0007633:	83 c4 0c             	add    $0xc,%esp
c0007636:	ff 75 08             	pushl  0x8(%ebp)
c0007639:	e8 76 fb ff ff       	call   c00071b4 <get_physical_address>
c000763e:	83 c4 04             	add    $0x4,%esp
c0007641:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007644:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007647:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000764d:	85 c0                	test   %eax,%eax
c000764f:	0f 48 c2             	cmovs  %edx,%eax
c0007652:	c1 f8 0c             	sar    $0xc,%eax
c0007655:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007658:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000765b:	6a 00                	push   $0x0
c000765d:	ff 75 f0             	pushl  -0x10(%ebp)
c0007660:	50                   	push   %eax
c0007661:	e8 b0 f6 ff ff       	call   c0006d16 <set_bit_val>
c0007666:	83 c4 0c             	add    $0xc,%esp
c0007669:	ff 75 08             	pushl  0x8(%ebp)
c000766c:	e8 3e ff ff ff       	call   c00075af <remove_map_entry>
c0007671:	83 c4 04             	add    $0x4,%esp
c0007674:	90                   	nop
c0007675:	c9                   	leave  
c0007676:	c3                   	ret    

c0007677 <sys_free>:
c0007677:	55                   	push   %ebp
c0007678:	89 e5                	mov    %esp,%ebp
c000767a:	83 ec 20             	sub    $0x20,%esp
c000767d:	90                   	nop
c000767e:	c9                   	leave  
c000767f:	c3                   	ret    

c0007680 <init_memory_block_desc>:
c0007680:	55                   	push   %ebp
c0007681:	89 e5                	mov    %esp,%ebp
c0007683:	83 ec 18             	sub    $0x18,%esp
c0007686:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000768d:	e9 b2 00 00 00       	jmp    c0007744 <init_memory_block_desc+0xc4>
c0007692:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007696:	75 1b                	jne    c00076b3 <init_memory_block_desc+0x33>
c0007698:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000769b:	89 d0                	mov    %edx,%eax
c000769d:	01 c0                	add    %eax,%eax
c000769f:	01 d0                	add    %edx,%eax
c00076a1:	c1 e0 03             	shl    $0x3,%eax
c00076a4:	89 c2                	mov    %eax,%edx
c00076a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00076a9:	01 d0                	add    %edx,%eax
c00076ab:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c00076b1:	eb 2e                	jmp    c00076e1 <init_memory_block_desc+0x61>
c00076b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076b6:	89 d0                	mov    %edx,%eax
c00076b8:	01 c0                	add    %eax,%eax
c00076ba:	01 d0                	add    %edx,%eax
c00076bc:	c1 e0 03             	shl    $0x3,%eax
c00076bf:	8d 50 e8             	lea    -0x18(%eax),%edx
c00076c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00076c5:	01 d0                	add    %edx,%eax
c00076c7:	8b 08                	mov    (%eax),%ecx
c00076c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076cc:	89 d0                	mov    %edx,%eax
c00076ce:	01 c0                	add    %eax,%eax
c00076d0:	01 d0                	add    %edx,%eax
c00076d2:	c1 e0 03             	shl    $0x3,%eax
c00076d5:	89 c2                	mov    %eax,%edx
c00076d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00076da:	01 d0                	add    %edx,%eax
c00076dc:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c00076df:	89 10                	mov    %edx,(%eax)
c00076e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076e4:	89 d0                	mov    %edx,%eax
c00076e6:	01 c0                	add    %eax,%eax
c00076e8:	01 d0                	add    %edx,%eax
c00076ea:	c1 e0 03             	shl    $0x3,%eax
c00076ed:	89 c2                	mov    %eax,%edx
c00076ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00076f2:	01 d0                	add    %edx,%eax
c00076f4:	8b 00                	mov    (%eax),%eax
c00076f6:	89 c1                	mov    %eax,%ecx
c00076f8:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00076fd:	ba 00 00 00 00       	mov    $0x0,%edx
c0007702:	f7 f1                	div    %ecx
c0007704:	89 c1                	mov    %eax,%ecx
c0007706:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007709:	89 d0                	mov    %edx,%eax
c000770b:	01 c0                	add    %eax,%eax
c000770d:	01 d0                	add    %edx,%eax
c000770f:	c1 e0 03             	shl    $0x3,%eax
c0007712:	89 c2                	mov    %eax,%edx
c0007714:	8b 45 08             	mov    0x8(%ebp),%eax
c0007717:	01 d0                	add    %edx,%eax
c0007719:	89 ca                	mov    %ecx,%edx
c000771b:	89 50 04             	mov    %edx,0x4(%eax)
c000771e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007721:	89 d0                	mov    %edx,%eax
c0007723:	01 c0                	add    %eax,%eax
c0007725:	01 d0                	add    %edx,%eax
c0007727:	c1 e0 03             	shl    $0x3,%eax
c000772a:	89 c2                	mov    %eax,%edx
c000772c:	8b 45 08             	mov    0x8(%ebp),%eax
c000772f:	01 d0                	add    %edx,%eax
c0007731:	83 c0 08             	add    $0x8,%eax
c0007734:	83 ec 0c             	sub    $0xc,%esp
c0007737:	50                   	push   %eax
c0007738:	e8 18 32 00 00       	call   c000a955 <initDoubleLinkList>
c000773d:	83 c4 10             	add    $0x10,%esp
c0007740:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007744:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0007748:	0f 8e 44 ff ff ff    	jle    c0007692 <init_memory_block_desc+0x12>
c000774e:	90                   	nop
c000774f:	c9                   	leave  
c0007750:	c3                   	ret    

c0007751 <init_memory2>:
c0007751:	55                   	push   %ebp
c0007752:	89 e5                	mov    %esp,%ebp
c0007754:	83 ec 38             	sub    $0x38,%esp
c0007757:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c000775e:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0007765:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007768:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c000776d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007770:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007775:	29 c2                	sub    %eax,%edx
c0007777:	89 d0                	mov    %edx,%eax
c0007779:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000777c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000777f:	89 c2                	mov    %eax,%edx
c0007781:	c1 ea 1f             	shr    $0x1f,%edx
c0007784:	01 d0                	add    %edx,%eax
c0007786:	d1 f8                	sar    %eax
c0007788:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c000778d:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007792:	83 ec 0c             	sub    $0xc,%esp
c0007795:	50                   	push   %eax
c0007796:	e8 e6 06 00 00       	call   c0007e81 <disp_int>
c000779b:	83 c4 10             	add    $0x10,%esp
c000779e:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00077a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077a6:	29 c2                	sub    %eax,%edx
c00077a8:	89 d0                	mov    %edx,%eax
c00077aa:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c00077af:	83 ec 0c             	sub    $0xc,%esp
c00077b2:	68 16 b3 00 c0       	push   $0xc000b316
c00077b7:	e8 d0 9d ff ff       	call   c000158c <disp_str>
c00077bc:	83 c4 10             	add    $0x10,%esp
c00077bf:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00077c4:	83 ec 0c             	sub    $0xc,%esp
c00077c7:	50                   	push   %eax
c00077c8:	e8 b4 06 00 00       	call   c0007e81 <disp_int>
c00077cd:	83 c4 10             	add    $0x10,%esp
c00077d0:	83 ec 0c             	sub    $0xc,%esp
c00077d3:	68 16 b3 00 c0       	push   $0xc000b316
c00077d8:	e8 af 9d ff ff       	call   c000158c <disp_str>
c00077dd:	83 c4 10             	add    $0x10,%esp
c00077e0:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00077e5:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077ea:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077f0:	85 c0                	test   %eax,%eax
c00077f2:	0f 48 c2             	cmovs  %edx,%eax
c00077f5:	c1 f8 0c             	sar    $0xc,%eax
c00077f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077fe:	83 c0 07             	add    $0x7,%eax
c0007801:	8d 50 07             	lea    0x7(%eax),%edx
c0007804:	85 c0                	test   %eax,%eax
c0007806:	0f 48 c2             	cmovs  %edx,%eax
c0007809:	c1 f8 03             	sar    $0x3,%eax
c000780c:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007811:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007816:	2d 00 00 00 40       	sub    $0x40000000,%eax
c000781b:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007820:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007826:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c000782b:	83 ec 04             	sub    $0x4,%esp
c000782e:	52                   	push   %edx
c000782f:	6a 00                	push   $0x0
c0007831:	50                   	push   %eax
c0007832:	e8 68 42 00 00       	call   c000ba9f <Memset>
c0007837:	83 c4 10             	add    $0x10,%esp
c000783a:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c000783f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007844:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000784a:	85 c0                	test   %eax,%eax
c000784c:	0f 48 c2             	cmovs  %edx,%eax
c000784f:	c1 f8 0c             	sar    $0xc,%eax
c0007852:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007855:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007858:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000785b:	ff 75 e8             	pushl  -0x18(%ebp)
c000785e:	6a 01                	push   $0x1
c0007860:	6a 00                	push   $0x0
c0007862:	68 ac 16 01 c0       	push   $0xc00116ac
c0007867:	e8 25 f5 ff ff       	call   c0006d91 <set_bits>
c000786c:	83 c4 10             	add    $0x10,%esp
c000786f:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007874:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007879:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000787f:	85 c0                	test   %eax,%eax
c0007881:	0f 48 c2             	cmovs  %edx,%eax
c0007884:	c1 f8 0c             	sar    $0xc,%eax
c0007887:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000788a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000788d:	83 c0 07             	add    $0x7,%eax
c0007890:	8d 50 07             	lea    0x7(%eax),%edx
c0007893:	85 c0                	test   %eax,%eax
c0007895:	0f 48 c2             	cmovs  %edx,%eax
c0007898:	c1 f8 03             	sar    $0x3,%eax
c000789b:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c00078a0:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00078a5:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00078ab:	01 d0                	add    %edx,%eax
c00078ad:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c00078b2:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c00078b8:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c00078bd:	83 ec 04             	sub    $0x4,%esp
c00078c0:	52                   	push   %edx
c00078c1:	6a 00                	push   $0x0
c00078c3:	50                   	push   %eax
c00078c4:	e8 d6 41 00 00       	call   c000ba9f <Memset>
c00078c9:	83 c4 10             	add    $0x10,%esp
c00078cc:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00078d1:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078d6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078dc:	85 c0                	test   %eax,%eax
c00078de:	0f 48 c2             	cmovs  %edx,%eax
c00078e1:	c1 f8 0c             	sar    $0xc,%eax
c00078e4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00078ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00078ed:	ff 75 e8             	pushl  -0x18(%ebp)
c00078f0:	6a 01                	push   $0x1
c00078f2:	ff 75 e0             	pushl  -0x20(%ebp)
c00078f5:	68 ac 16 01 c0       	push   $0xc00116ac
c00078fa:	e8 92 f4 ff ff       	call   c0006d91 <set_bits>
c00078ff:	83 c4 10             	add    $0x10,%esp
c0007902:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0007909:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000790c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000790f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007912:	83 c0 07             	add    $0x7,%eax
c0007915:	8d 50 07             	lea    0x7(%eax),%edx
c0007918:	85 c0                	test   %eax,%eax
c000791a:	0f 48 c2             	cmovs  %edx,%eax
c000791d:	c1 f8 03             	sar    $0x3,%eax
c0007920:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007925:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000792a:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007930:	01 c2                	add    %eax,%edx
c0007932:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007937:	01 d0                	add    %edx,%eax
c0007939:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c000793e:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c0007944:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007949:	83 ec 04             	sub    $0x4,%esp
c000794c:	52                   	push   %edx
c000794d:	6a 00                	push   $0x0
c000794f:	50                   	push   %eax
c0007950:	e8 4a 41 00 00       	call   c000ba9f <Memset>
c0007955:	83 c4 10             	add    $0x10,%esp
c0007958:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000795b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000795e:	01 d0                	add    %edx,%eax
c0007960:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007963:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007968:	05 ff 0f 00 00       	add    $0xfff,%eax
c000796d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007973:	85 c0                	test   %eax,%eax
c0007975:	0f 48 c2             	cmovs  %edx,%eax
c0007978:	c1 f8 0c             	sar    $0xc,%eax
c000797b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000797e:	ff 75 e8             	pushl  -0x18(%ebp)
c0007981:	6a 01                	push   $0x1
c0007983:	ff 75 e0             	pushl  -0x20(%ebp)
c0007986:	68 ac 16 01 c0       	push   $0xc00116ac
c000798b:	e8 01 f4 ff ff       	call   c0006d91 <set_bits>
c0007990:	83 c4 10             	add    $0x10,%esp
c0007993:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007996:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007999:	01 d0                	add    %edx,%eax
c000799b:	c1 e0 0c             	shl    $0xc,%eax
c000799e:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c00079a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00079a6:	83 c0 02             	add    $0x2,%eax
c00079a9:	c1 e0 0c             	shl    $0xc,%eax
c00079ac:	89 c2                	mov    %eax,%edx
c00079ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00079b1:	01 d0                	add    %edx,%eax
c00079b3:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c00079b8:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00079bf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00079c5:	90                   	nop
c00079c6:	c9                   	leave  
c00079c7:	c3                   	ret    

c00079c8 <init_memory>:
c00079c8:	55                   	push   %ebp
c00079c9:	89 e5                	mov    %esp,%ebp
c00079cb:	83 ec 38             	sub    $0x38,%esp
c00079ce:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c00079d5:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c00079dc:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c00079e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00079e6:	05 00 00 10 00       	add    $0x100000,%eax
c00079eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00079ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00079f1:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00079f4:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00079fa:	85 c0                	test   %eax,%eax
c00079fc:	0f 48 c2             	cmovs  %edx,%eax
c00079ff:	c1 f8 0c             	sar    $0xc,%eax
c0007a02:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007a05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a08:	89 c2                	mov    %eax,%edx
c0007a0a:	c1 ea 1f             	shr    $0x1f,%edx
c0007a0d:	01 d0                	add    %edx,%eax
c0007a0f:	d1 f8                	sar    %eax
c0007a11:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007a14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a17:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007a1a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a1d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007a20:	8d 50 07             	lea    0x7(%eax),%edx
c0007a23:	85 c0                	test   %eax,%eax
c0007a25:	0f 48 c2             	cmovs  %edx,%eax
c0007a28:	c1 f8 03             	sar    $0x3,%eax
c0007a2b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007a2e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a31:	8d 50 07             	lea    0x7(%eax),%edx
c0007a34:	85 c0                	test   %eax,%eax
c0007a36:	0f 48 c2             	cmovs  %edx,%eax
c0007a39:	c1 f8 03             	sar    $0x3,%eax
c0007a3c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007a3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a42:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007a47:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007a4c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007a4f:	c1 e2 0c             	shl    $0xc,%edx
c0007a52:	01 d0                	add    %edx,%eax
c0007a54:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a5c:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007a61:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a64:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007a69:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007a6e:	83 ec 04             	sub    $0x4,%esp
c0007a71:	ff 75 d8             	pushl  -0x28(%ebp)
c0007a74:	6a 00                	push   $0x0
c0007a76:	50                   	push   %eax
c0007a77:	e8 23 40 00 00       	call   c000ba9f <Memset>
c0007a7c:	83 c4 10             	add    $0x10,%esp
c0007a7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a82:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a85:	01 d0                	add    %edx,%eax
c0007a87:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007a8c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a8f:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007a94:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007a99:	83 ec 04             	sub    $0x4,%esp
c0007a9c:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007a9f:	6a 00                	push   $0x0
c0007aa1:	50                   	push   %eax
c0007aa2:	e8 f8 3f 00 00       	call   c000ba9f <Memset>
c0007aa7:	83 c4 10             	add    $0x10,%esp
c0007aaa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007aad:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007ab2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007ab5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007ab8:	01 c2                	add    %eax,%edx
c0007aba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007abd:	01 d0                	add    %edx,%eax
c0007abf:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007ac4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007ac7:	05 00 00 10 00       	add    $0x100000,%eax
c0007acc:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007ad1:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007ad6:	83 ec 04             	sub    $0x4,%esp
c0007ad9:	ff 75 d8             	pushl  -0x28(%ebp)
c0007adc:	6a 00                	push   $0x0
c0007ade:	50                   	push   %eax
c0007adf:	e8 bb 3f 00 00       	call   c000ba9f <Memset>
c0007ae4:	83 c4 10             	add    $0x10,%esp
c0007ae7:	83 ec 04             	sub    $0x4,%esp
c0007aea:	68 f0 00 00 00       	push   $0xf0
c0007aef:	6a 00                	push   $0x0
c0007af1:	68 80 47 08 c0       	push   $0xc0084780
c0007af6:	e8 a4 3f 00 00       	call   c000ba9f <Memset>
c0007afb:	83 c4 10             	add    $0x10,%esp
c0007afe:	83 ec 0c             	sub    $0xc,%esp
c0007b01:	68 80 47 08 c0       	push   $0xc0084780
c0007b06:	e8 75 fb ff ff       	call   c0007680 <init_memory_block_desc>
c0007b0b:	83 c4 10             	add    $0x10,%esp
c0007b0e:	90                   	nop
c0007b0f:	c9                   	leave  
c0007b10:	c3                   	ret    

c0007b11 <intr_enable>:
c0007b11:	55                   	push   %ebp
c0007b12:	89 e5                	mov    %esp,%ebp
c0007b14:	83 ec 18             	sub    $0x18,%esp
c0007b17:	e8 65 00 00 00       	call   c0007b81 <intr_get_status>
c0007b1c:	83 f8 01             	cmp    $0x1,%eax
c0007b1f:	75 0c                	jne    c0007b2d <intr_enable+0x1c>
c0007b21:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b28:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b2b:	eb 0b                	jmp    c0007b38 <intr_enable+0x27>
c0007b2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b34:	fb                   	sti    
c0007b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b38:	c9                   	leave  
c0007b39:	c3                   	ret    

c0007b3a <intr_disable>:
c0007b3a:	55                   	push   %ebp
c0007b3b:	89 e5                	mov    %esp,%ebp
c0007b3d:	83 ec 18             	sub    $0x18,%esp
c0007b40:	e8 3c 00 00 00       	call   c0007b81 <intr_get_status>
c0007b45:	83 f8 01             	cmp    $0x1,%eax
c0007b48:	75 0d                	jne    c0007b57 <intr_disable+0x1d>
c0007b4a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b51:	fa                   	cli    
c0007b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b55:	eb 0a                	jmp    c0007b61 <intr_disable+0x27>
c0007b57:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b61:	c9                   	leave  
c0007b62:	c3                   	ret    

c0007b63 <intr_set_status>:
c0007b63:	55                   	push   %ebp
c0007b64:	89 e5                	mov    %esp,%ebp
c0007b66:	83 ec 08             	sub    $0x8,%esp
c0007b69:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b6c:	83 e0 01             	and    $0x1,%eax
c0007b6f:	85 c0                	test   %eax,%eax
c0007b71:	74 07                	je     c0007b7a <intr_set_status+0x17>
c0007b73:	e8 99 ff ff ff       	call   c0007b11 <intr_enable>
c0007b78:	eb 05                	jmp    c0007b7f <intr_set_status+0x1c>
c0007b7a:	e8 bb ff ff ff       	call   c0007b3a <intr_disable>
c0007b7f:	c9                   	leave  
c0007b80:	c3                   	ret    

c0007b81 <intr_get_status>:
c0007b81:	55                   	push   %ebp
c0007b82:	89 e5                	mov    %esp,%ebp
c0007b84:	83 ec 10             	sub    $0x10,%esp
c0007b87:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007b8e:	9c                   	pushf  
c0007b8f:	58                   	pop    %eax
c0007b90:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007b93:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007b96:	c1 e8 09             	shr    $0x9,%eax
c0007b99:	83 e0 01             	and    $0x1,%eax
c0007b9c:	c9                   	leave  
c0007b9d:	c3                   	ret    

c0007b9e <Memcpy>:
c0007b9e:	55                   	push   %ebp
c0007b9f:	89 e5                	mov    %esp,%ebp
c0007ba1:	83 ec 18             	sub    $0x18,%esp
c0007ba4:	e8 91 ff ff ff       	call   c0007b3a <intr_disable>
c0007ba9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007bac:	83 ec 04             	sub    $0x4,%esp
c0007baf:	ff 75 10             	pushl  0x10(%ebp)
c0007bb2:	ff 75 0c             	pushl  0xc(%ebp)
c0007bb5:	ff 75 08             	pushl  0x8(%ebp)
c0007bb8:	e8 b4 3e 00 00       	call   c000ba71 <Memcpy2>
c0007bbd:	83 c4 10             	add    $0x10,%esp
c0007bc0:	83 ec 0c             	sub    $0xc,%esp
c0007bc3:	ff 75 f4             	pushl  -0xc(%ebp)
c0007bc6:	e8 98 ff ff ff       	call   c0007b63 <intr_set_status>
c0007bcb:	83 c4 10             	add    $0x10,%esp
c0007bce:	90                   	nop
c0007bcf:	c9                   	leave  
c0007bd0:	c3                   	ret    

c0007bd1 <untar>:
c0007bd1:	55                   	push   %ebp
c0007bd2:	89 e5                	mov    %esp,%ebp
c0007bd4:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c0007bda:	83 ec 08             	sub    $0x8,%esp
c0007bdd:	6a 00                	push   $0x0
c0007bdf:	ff 75 08             	pushl  0x8(%ebp)
c0007be2:	e8 ce e4 ff ff       	call   c00060b5 <open>
c0007be7:	83 c4 10             	add    $0x10,%esp
c0007bea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007bed:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007bf4:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c0007bfb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c02:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007c09:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007c0d:	7e 58                	jle    c0007c67 <untar+0x96>
c0007c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c12:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007c17:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007c1d:	85 c0                	test   %eax,%eax
c0007c1f:	0f 48 c2             	cmovs  %edx,%eax
c0007c22:	c1 f8 09             	sar    $0x9,%eax
c0007c25:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007c28:	83 ec 04             	sub    $0x4,%esp
c0007c2b:	68 00 20 00 00       	push   $0x2000
c0007c30:	6a 00                	push   $0x0
c0007c32:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007c38:	50                   	push   %eax
c0007c39:	e8 61 3e 00 00       	call   c000ba9f <Memset>
c0007c3e:	83 c4 10             	add    $0x10,%esp
c0007c41:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007c44:	c1 e0 09             	shl    $0x9,%eax
c0007c47:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007c4a:	83 ec 04             	sub    $0x4,%esp
c0007c4d:	50                   	push   %eax
c0007c4e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007c54:	50                   	push   %eax
c0007c55:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c58:	e8 dd e4 ff ff       	call   c000613a <read>
c0007c5d:	83 c4 10             	add    $0x10,%esp
c0007c60:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c67:	83 ec 04             	sub    $0x4,%esp
c0007c6a:	68 00 20 00 00       	push   $0x2000
c0007c6f:	6a 00                	push   $0x0
c0007c71:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007c77:	50                   	push   %eax
c0007c78:	e8 22 3e 00 00       	call   c000ba9f <Memset>
c0007c7d:	83 c4 10             	add    $0x10,%esp
c0007c80:	83 ec 04             	sub    $0x4,%esp
c0007c83:	68 00 02 00 00       	push   $0x200
c0007c88:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007c8e:	50                   	push   %eax
c0007c8f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c92:	e8 a3 e4 ff ff       	call   c000613a <read>
c0007c97:	83 c4 10             	add    $0x10,%esp
c0007c9a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007c9d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007ca1:	0f 84 1f 01 00 00    	je     c0007dc6 <untar+0x1f5>
c0007ca7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007caa:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007cad:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007cb4:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007cba:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007cbd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007cc0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007cc3:	83 ec 08             	sub    $0x8,%esp
c0007cc6:	6a 07                	push   $0x7
c0007cc8:	ff 75 cc             	pushl  -0x34(%ebp)
c0007ccb:	e8 e5 e3 ff ff       	call   c00060b5 <open>
c0007cd0:	83 c4 10             	add    $0x10,%esp
c0007cd3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007cd6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007cdd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007ce0:	83 c0 7c             	add    $0x7c,%eax
c0007ce3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007ce6:	83 ec 0c             	sub    $0xc,%esp
c0007ce9:	ff 75 cc             	pushl  -0x34(%ebp)
c0007cec:	e8 e7 3d 00 00       	call   c000bad8 <Strlen>
c0007cf1:	83 c4 10             	add    $0x10,%esp
c0007cf4:	85 c0                	test   %eax,%eax
c0007cf6:	75 16                	jne    c0007d0e <untar+0x13d>
c0007cf8:	83 ec 0c             	sub    $0xc,%esp
c0007cfb:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007cfe:	e8 d5 3d 00 00       	call   c000bad8 <Strlen>
c0007d03:	83 c4 10             	add    $0x10,%esp
c0007d06:	85 c0                	test   %eax,%eax
c0007d08:	0f 84 bb 00 00 00    	je     c0007dc9 <untar+0x1f8>
c0007d0e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007d11:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d14:	eb 1f                	jmp    c0007d35 <untar+0x164>
c0007d16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007d19:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007d20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d23:	0f b6 00             	movzbl (%eax),%eax
c0007d26:	0f be c0             	movsbl %al,%eax
c0007d29:	83 e8 30             	sub    $0x30,%eax
c0007d2c:	01 d0                	add    %edx,%eax
c0007d2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007d31:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007d35:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d38:	0f b6 00             	movzbl (%eax),%eax
c0007d3b:	84 c0                	test   %al,%al
c0007d3d:	75 d7                	jne    c0007d16 <untar+0x145>
c0007d3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007d42:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007d45:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0007d4c:	eb 5f                	jmp    c0007dad <untar+0x1dc>
c0007d4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d51:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0007d54:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0007d58:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007d5b:	83 ec 04             	sub    $0x4,%esp
c0007d5e:	68 00 02 00 00       	push   $0x200
c0007d63:	6a 00                	push   $0x0
c0007d65:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007d6b:	50                   	push   %eax
c0007d6c:	e8 2e 3d 00 00       	call   c000ba9f <Memset>
c0007d71:	83 c4 10             	add    $0x10,%esp
c0007d74:	83 ec 04             	sub    $0x4,%esp
c0007d77:	ff 75 bc             	pushl  -0x44(%ebp)
c0007d7a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007d80:	50                   	push   %eax
c0007d81:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007d84:	e8 b1 e3 ff ff       	call   c000613a <read>
c0007d89:	83 c4 10             	add    $0x10,%esp
c0007d8c:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007d8f:	83 ec 04             	sub    $0x4,%esp
c0007d92:	ff 75 bc             	pushl  -0x44(%ebp)
c0007d95:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007d9b:	50                   	push   %eax
c0007d9c:	ff 75 c8             	pushl  -0x38(%ebp)
c0007d9f:	e8 0a e4 ff ff       	call   c00061ae <write>
c0007da4:	83 c4 10             	add    $0x10,%esp
c0007da7:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007daa:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0007dad:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007db1:	75 9b                	jne    c0007d4e <untar+0x17d>
c0007db3:	83 ec 0c             	sub    $0xc,%esp
c0007db6:	ff 75 c8             	pushl  -0x38(%ebp)
c0007db9:	e8 64 e4 ff ff       	call   c0006222 <close>
c0007dbe:	83 c4 10             	add    $0x10,%esp
c0007dc1:	e9 43 fe ff ff       	jmp    c0007c09 <untar+0x38>
c0007dc6:	90                   	nop
c0007dc7:	eb 01                	jmp    c0007dca <untar+0x1f9>
c0007dc9:	90                   	nop
c0007dca:	83 ec 0c             	sub    $0xc,%esp
c0007dcd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007dd0:	e8 4d e4 ff ff       	call   c0006222 <close>
c0007dd5:	83 c4 10             	add    $0x10,%esp
c0007dd8:	90                   	nop
c0007dd9:	c9                   	leave  
c0007dda:	c3                   	ret    

c0007ddb <atoi>:
c0007ddb:	55                   	push   %ebp
c0007ddc:	89 e5                	mov    %esp,%ebp
c0007dde:	83 ec 10             	sub    $0x10,%esp
c0007de1:	8b 45 08             	mov    0x8(%ebp),%eax
c0007de4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007de7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007dea:	8d 50 01             	lea    0x1(%eax),%edx
c0007ded:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007df0:	c6 00 30             	movb   $0x30,(%eax)
c0007df3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007df6:	8d 50 01             	lea    0x1(%eax),%edx
c0007df9:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007dfc:	c6 00 78             	movb   $0x78,(%eax)
c0007dff:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007e03:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007e07:	75 0e                	jne    c0007e17 <atoi+0x3c>
c0007e09:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e0c:	8d 50 01             	lea    0x1(%eax),%edx
c0007e0f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e12:	c6 00 30             	movb   $0x30,(%eax)
c0007e15:	eb 61                	jmp    c0007e78 <atoi+0x9d>
c0007e17:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007e1e:	eb 52                	jmp    c0007e72 <atoi+0x97>
c0007e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e23:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007e26:	89 c1                	mov    %eax,%ecx
c0007e28:	d3 fa                	sar    %cl,%edx
c0007e2a:	89 d0                	mov    %edx,%eax
c0007e2c:	83 e0 0f             	and    $0xf,%eax
c0007e2f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e32:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007e36:	75 06                	jne    c0007e3e <atoi+0x63>
c0007e38:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007e3c:	74 2f                	je     c0007e6d <atoi+0x92>
c0007e3e:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007e42:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007e46:	83 c0 30             	add    $0x30,%eax
c0007e49:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e4c:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007e50:	7e 0a                	jle    c0007e5c <atoi+0x81>
c0007e52:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007e56:	83 c0 07             	add    $0x7,%eax
c0007e59:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e5f:	8d 50 01             	lea    0x1(%eax),%edx
c0007e62:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e65:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007e69:	88 10                	mov    %dl,(%eax)
c0007e6b:	eb 01                	jmp    c0007e6e <atoi+0x93>
c0007e6d:	90                   	nop
c0007e6e:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007e72:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007e76:	79 a8                	jns    c0007e20 <atoi+0x45>
c0007e78:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e7b:	c6 00 00             	movb   $0x0,(%eax)
c0007e7e:	90                   	nop
c0007e7f:	c9                   	leave  
c0007e80:	c3                   	ret    

c0007e81 <disp_int>:
c0007e81:	55                   	push   %ebp
c0007e82:	89 e5                	mov    %esp,%ebp
c0007e84:	83 ec 18             	sub    $0x18,%esp
c0007e87:	ff 75 08             	pushl  0x8(%ebp)
c0007e8a:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007e8d:	50                   	push   %eax
c0007e8e:	e8 48 ff ff ff       	call   c0007ddb <atoi>
c0007e93:	83 c4 08             	add    $0x8,%esp
c0007e96:	83 ec 08             	sub    $0x8,%esp
c0007e99:	6a 0b                	push   $0xb
c0007e9b:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007e9e:	50                   	push   %eax
c0007e9f:	e8 23 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007ea4:	83 c4 10             	add    $0x10,%esp
c0007ea7:	90                   	nop
c0007ea8:	c9                   	leave  
c0007ea9:	c3                   	ret    

c0007eaa <do_page_fault>:
c0007eaa:	55                   	push   %ebp
c0007eab:	89 e5                	mov    %esp,%ebp
c0007ead:	83 ec 28             	sub    $0x28,%esp
c0007eb0:	0f 20 d0             	mov    %cr2,%eax
c0007eb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007eb6:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007ebd:	00 00 00 
c0007ec0:	83 ec 0c             	sub    $0xc,%esp
c0007ec3:	68 20 b3 00 c0       	push   $0xc000b320
c0007ec8:	e8 bf 96 ff ff       	call   c000158c <disp_str>
c0007ecd:	83 c4 10             	add    $0x10,%esp
c0007ed0:	83 ec 0c             	sub    $0xc,%esp
c0007ed3:	68 2f b3 00 c0       	push   $0xc000b32f
c0007ed8:	e8 af 96 ff ff       	call   c000158c <disp_str>
c0007edd:	83 c4 10             	add    $0x10,%esp
c0007ee0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ee3:	83 ec 0c             	sub    $0xc,%esp
c0007ee6:	50                   	push   %eax
c0007ee7:	e8 95 ff ff ff       	call   c0007e81 <disp_int>
c0007eec:	83 c4 10             	add    $0x10,%esp
c0007eef:	83 ec 0c             	sub    $0xc,%esp
c0007ef2:	68 34 b3 00 c0       	push   $0xc000b334
c0007ef7:	e8 90 96 ff ff       	call   c000158c <disp_str>
c0007efc:	83 c4 10             	add    $0x10,%esp
c0007eff:	83 ec 0c             	sub    $0xc,%esp
c0007f02:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f05:	e8 1b f1 ff ff       	call   c0007025 <ptr_pde>
c0007f0a:	83 c4 10             	add    $0x10,%esp
c0007f0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007f10:	83 ec 0c             	sub    $0xc,%esp
c0007f13:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f16:	e8 1d f1 ff ff       	call   c0007038 <ptr_pte>
c0007f1b:	83 c4 10             	add    $0x10,%esp
c0007f1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007f21:	83 ec 0c             	sub    $0xc,%esp
c0007f24:	68 36 b3 00 c0       	push   $0xc000b336
c0007f29:	e8 5e 96 ff ff       	call   c000158c <disp_str>
c0007f2e:	83 c4 10             	add    $0x10,%esp
c0007f31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007f34:	83 ec 0c             	sub    $0xc,%esp
c0007f37:	50                   	push   %eax
c0007f38:	e8 44 ff ff ff       	call   c0007e81 <disp_int>
c0007f3d:	83 c4 10             	add    $0x10,%esp
c0007f40:	83 ec 0c             	sub    $0xc,%esp
c0007f43:	68 3b b3 00 c0       	push   $0xc000b33b
c0007f48:	e8 3f 96 ff ff       	call   c000158c <disp_str>
c0007f4d:	83 c4 10             	add    $0x10,%esp
c0007f50:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007f53:	8b 00                	mov    (%eax),%eax
c0007f55:	83 ec 0c             	sub    $0xc,%esp
c0007f58:	50                   	push   %eax
c0007f59:	e8 23 ff ff ff       	call   c0007e81 <disp_int>
c0007f5e:	83 c4 10             	add    $0x10,%esp
c0007f61:	83 ec 0c             	sub    $0xc,%esp
c0007f64:	68 34 b3 00 c0       	push   $0xc000b334
c0007f69:	e8 1e 96 ff ff       	call   c000158c <disp_str>
c0007f6e:	83 c4 10             	add    $0x10,%esp
c0007f71:	83 ec 0c             	sub    $0xc,%esp
c0007f74:	68 44 b3 00 c0       	push   $0xc000b344
c0007f79:	e8 0e 96 ff ff       	call   c000158c <disp_str>
c0007f7e:	83 c4 10             	add    $0x10,%esp
c0007f81:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007f84:	83 ec 0c             	sub    $0xc,%esp
c0007f87:	50                   	push   %eax
c0007f88:	e8 f4 fe ff ff       	call   c0007e81 <disp_int>
c0007f8d:	83 c4 10             	add    $0x10,%esp
c0007f90:	83 ec 0c             	sub    $0xc,%esp
c0007f93:	68 49 b3 00 c0       	push   $0xc000b349
c0007f98:	e8 ef 95 ff ff       	call   c000158c <disp_str>
c0007f9d:	83 c4 10             	add    $0x10,%esp
c0007fa0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007fa3:	8b 00                	mov    (%eax),%eax
c0007fa5:	83 ec 0c             	sub    $0xc,%esp
c0007fa8:	50                   	push   %eax
c0007fa9:	e8 d3 fe ff ff       	call   c0007e81 <disp_int>
c0007fae:	83 c4 10             	add    $0x10,%esp
c0007fb1:	83 ec 0c             	sub    $0xc,%esp
c0007fb4:	68 34 b3 00 c0       	push   $0xc000b334
c0007fb9:	e8 ce 95 ff ff       	call   c000158c <disp_str>
c0007fbe:	83 c4 10             	add    $0x10,%esp
c0007fc1:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007fc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007fcb:	8b 00                	mov    (%eax),%eax
c0007fcd:	83 e0 01             	and    $0x1,%eax
c0007fd0:	85 c0                	test   %eax,%eax
c0007fd2:	74 09                	je     c0007fdd <do_page_fault+0x133>
c0007fd4:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007fdb:	eb 07                	jmp    c0007fe4 <do_page_fault+0x13a>
c0007fdd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007fe4:	90                   	nop
c0007fe5:	c9                   	leave  
c0007fe6:	c3                   	ret    

c0007fe7 <exception_handler>:
c0007fe7:	55                   	push   %ebp
c0007fe8:	89 e5                	mov    %esp,%ebp
c0007fea:	57                   	push   %edi
c0007feb:	56                   	push   %esi
c0007fec:	53                   	push   %ebx
c0007fed:	83 ec 6c             	sub    $0x6c,%esp
c0007ff0:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007ff3:	bb c0 b5 00 c0       	mov    $0xc000b5c0,%ebx
c0007ff8:	ba 13 00 00 00       	mov    $0x13,%edx
c0007ffd:	89 c7                	mov    %eax,%edi
c0007fff:	89 de                	mov    %ebx,%esi
c0008001:	89 d1                	mov    %edx,%ecx
c0008003:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008005:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000800c:	eb 04                	jmp    c0008012 <exception_handler+0x2b>
c000800e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008012:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008019:	7e f3                	jle    c000800e <exception_handler+0x27>
c000801b:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008022:	00 00 00 
c0008025:	83 ec 0c             	sub    $0xc,%esp
c0008028:	68 52 b3 00 c0       	push   $0xc000b352
c000802d:	e8 5a 95 ff ff       	call   c000158c <disp_str>
c0008032:	83 c4 10             	add    $0x10,%esp
c0008035:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000803c:	8b 45 08             	mov    0x8(%ebp),%eax
c000803f:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0008043:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008046:	83 ec 0c             	sub    $0xc,%esp
c0008049:	ff 75 dc             	pushl  -0x24(%ebp)
c000804c:	e8 3b 95 ff ff       	call   c000158c <disp_str>
c0008051:	83 c4 10             	add    $0x10,%esp
c0008054:	83 ec 0c             	sub    $0xc,%esp
c0008057:	68 60 b3 00 c0       	push   $0xc000b360
c000805c:	e8 2b 95 ff ff       	call   c000158c <disp_str>
c0008061:	83 c4 10             	add    $0x10,%esp
c0008064:	83 ec 0c             	sub    $0xc,%esp
c0008067:	68 63 b3 00 c0       	push   $0xc000b363
c000806c:	e8 1b 95 ff ff       	call   c000158c <disp_str>
c0008071:	83 c4 10             	add    $0x10,%esp
c0008074:	8b 45 08             	mov    0x8(%ebp),%eax
c0008077:	83 ec 0c             	sub    $0xc,%esp
c000807a:	50                   	push   %eax
c000807b:	e8 01 fe ff ff       	call   c0007e81 <disp_int>
c0008080:	83 c4 10             	add    $0x10,%esp
c0008083:	83 ec 0c             	sub    $0xc,%esp
c0008086:	68 60 b3 00 c0       	push   $0xc000b360
c000808b:	e8 fc 94 ff ff       	call   c000158c <disp_str>
c0008090:	83 c4 10             	add    $0x10,%esp
c0008093:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008097:	74 2f                	je     c00080c8 <exception_handler+0xe1>
c0008099:	83 ec 0c             	sub    $0xc,%esp
c000809c:	68 6b b3 00 c0       	push   $0xc000b36b
c00080a1:	e8 e6 94 ff ff       	call   c000158c <disp_str>
c00080a6:	83 c4 10             	add    $0x10,%esp
c00080a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00080ac:	83 ec 0c             	sub    $0xc,%esp
c00080af:	50                   	push   %eax
c00080b0:	e8 cc fd ff ff       	call   c0007e81 <disp_int>
c00080b5:	83 c4 10             	add    $0x10,%esp
c00080b8:	83 ec 0c             	sub    $0xc,%esp
c00080bb:	68 60 b3 00 c0       	push   $0xc000b360
c00080c0:	e8 c7 94 ff ff       	call   c000158c <disp_str>
c00080c5:	83 c4 10             	add    $0x10,%esp
c00080c8:	83 ec 0c             	sub    $0xc,%esp
c00080cb:	68 75 b3 00 c0       	push   $0xc000b375
c00080d0:	e8 b7 94 ff ff       	call   c000158c <disp_str>
c00080d5:	83 c4 10             	add    $0x10,%esp
c00080d8:	83 ec 0c             	sub    $0xc,%esp
c00080db:	ff 75 14             	pushl  0x14(%ebp)
c00080de:	e8 9e fd ff ff       	call   c0007e81 <disp_int>
c00080e3:	83 c4 10             	add    $0x10,%esp
c00080e6:	83 ec 0c             	sub    $0xc,%esp
c00080e9:	68 60 b3 00 c0       	push   $0xc000b360
c00080ee:	e8 99 94 ff ff       	call   c000158c <disp_str>
c00080f3:	83 c4 10             	add    $0x10,%esp
c00080f6:	83 ec 0c             	sub    $0xc,%esp
c00080f9:	68 79 b3 00 c0       	push   $0xc000b379
c00080fe:	e8 89 94 ff ff       	call   c000158c <disp_str>
c0008103:	83 c4 10             	add    $0x10,%esp
c0008106:	8b 45 10             	mov    0x10(%ebp),%eax
c0008109:	83 ec 0c             	sub    $0xc,%esp
c000810c:	50                   	push   %eax
c000810d:	e8 6f fd ff ff       	call   c0007e81 <disp_int>
c0008112:	83 c4 10             	add    $0x10,%esp
c0008115:	83 ec 0c             	sub    $0xc,%esp
c0008118:	68 60 b3 00 c0       	push   $0xc000b360
c000811d:	e8 6a 94 ff ff       	call   c000158c <disp_str>
c0008122:	83 c4 10             	add    $0x10,%esp
c0008125:	83 ec 0c             	sub    $0xc,%esp
c0008128:	68 7e b3 00 c0       	push   $0xc000b37e
c000812d:	e8 5a 94 ff ff       	call   c000158c <disp_str>
c0008132:	83 c4 10             	add    $0x10,%esp
c0008135:	83 ec 0c             	sub    $0xc,%esp
c0008138:	ff 75 18             	pushl  0x18(%ebp)
c000813b:	e8 41 fd ff ff       	call   c0007e81 <disp_int>
c0008140:	83 c4 10             	add    $0x10,%esp
c0008143:	83 ec 0c             	sub    $0xc,%esp
c0008146:	68 60 b3 00 c0       	push   $0xc000b360
c000814b:	e8 3c 94 ff ff       	call   c000158c <disp_str>
c0008150:	83 c4 10             	add    $0x10,%esp
c0008153:	83 ec 0c             	sub    $0xc,%esp
c0008156:	68 88 b3 00 c0       	push   $0xc000b388
c000815b:	e8 2c 94 ff ff       	call   c000158c <disp_str>
c0008160:	83 c4 10             	add    $0x10,%esp
c0008163:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0008167:	75 46                	jne    c00081af <exception_handler+0x1c8>
c0008169:	0f 20 d0             	mov    %cr2,%eax
c000816c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000816f:	83 ec 0c             	sub    $0xc,%esp
c0008172:	68 a7 b3 00 c0       	push   $0xc000b3a7
c0008177:	e8 10 94 ff ff       	call   c000158c <disp_str>
c000817c:	83 c4 10             	add    $0x10,%esp
c000817f:	83 ec 0c             	sub    $0xc,%esp
c0008182:	68 2f b3 00 c0       	push   $0xc000b32f
c0008187:	e8 00 94 ff ff       	call   c000158c <disp_str>
c000818c:	83 c4 10             	add    $0x10,%esp
c000818f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008192:	83 ec 0c             	sub    $0xc,%esp
c0008195:	50                   	push   %eax
c0008196:	e8 e6 fc ff ff       	call   c0007e81 <disp_int>
c000819b:	83 c4 10             	add    $0x10,%esp
c000819e:	83 ec 0c             	sub    $0xc,%esp
c00081a1:	68 34 b3 00 c0       	push   $0xc000b334
c00081a6:	e8 e1 93 ff ff       	call   c000158c <disp_str>
c00081ab:	83 c4 10             	add    $0x10,%esp
c00081ae:	90                   	nop
c00081af:	90                   	nop
c00081b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00081b3:	5b                   	pop    %ebx
c00081b4:	5e                   	pop    %esi
c00081b5:	5f                   	pop    %edi
c00081b6:	5d                   	pop    %ebp
c00081b7:	c3                   	ret    

c00081b8 <exception_handler2>:
c00081b8:	55                   	push   %ebp
c00081b9:	89 e5                	mov    %esp,%ebp
c00081bb:	57                   	push   %edi
c00081bc:	56                   	push   %esi
c00081bd:	53                   	push   %ebx
c00081be:	83 ec 6c             	sub    $0x6c,%esp
c00081c1:	8d 45 90             	lea    -0x70(%ebp),%eax
c00081c4:	bb c0 b5 00 c0       	mov    $0xc000b5c0,%ebx
c00081c9:	ba 13 00 00 00       	mov    $0x13,%edx
c00081ce:	89 c7                	mov    %eax,%edi
c00081d0:	89 de                	mov    %ebx,%esi
c00081d2:	89 d1                	mov    %edx,%ecx
c00081d4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00081d6:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c00081dd:	2e 00 00 
c00081e0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00081e7:	eb 14                	jmp    c00081fd <exception_handler2+0x45>
c00081e9:	83 ec 0c             	sub    $0xc,%esp
c00081ec:	68 0c b6 00 c0       	push   $0xc000b60c
c00081f1:	e8 96 93 ff ff       	call   c000158c <disp_str>
c00081f6:	83 c4 10             	add    $0x10,%esp
c00081f9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00081fd:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008204:	7e e3                	jle    c00081e9 <exception_handler2+0x31>
c0008206:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c000820d:	2e 00 00 
c0008210:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008217:	8b 45 08             	mov    0x8(%ebp),%eax
c000821a:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c000821e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008221:	83 ec 08             	sub    $0x8,%esp
c0008224:	ff 75 e0             	pushl  -0x20(%ebp)
c0008227:	ff 75 dc             	pushl  -0x24(%ebp)
c000822a:	e8 98 93 ff ff       	call   c00015c7 <disp_str_colour>
c000822f:	83 c4 10             	add    $0x10,%esp
c0008232:	83 ec 0c             	sub    $0xc,%esp
c0008235:	68 60 b3 00 c0       	push   $0xc000b360
c000823a:	e8 4d 93 ff ff       	call   c000158c <disp_str>
c000823f:	83 c4 10             	add    $0x10,%esp
c0008242:	83 ec 08             	sub    $0x8,%esp
c0008245:	ff 75 e0             	pushl  -0x20(%ebp)
c0008248:	68 63 b3 00 c0       	push   $0xc000b363
c000824d:	e8 75 93 ff ff       	call   c00015c7 <disp_str_colour>
c0008252:	83 c4 10             	add    $0x10,%esp
c0008255:	83 ec 0c             	sub    $0xc,%esp
c0008258:	ff 75 08             	pushl  0x8(%ebp)
c000825b:	e8 21 fc ff ff       	call   c0007e81 <disp_int>
c0008260:	83 c4 10             	add    $0x10,%esp
c0008263:	83 ec 0c             	sub    $0xc,%esp
c0008266:	68 60 b3 00 c0       	push   $0xc000b360
c000826b:	e8 1c 93 ff ff       	call   c000158c <disp_str>
c0008270:	83 c4 10             	add    $0x10,%esp
c0008273:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008277:	74 44                	je     c00082bd <exception_handler2+0x105>
c0008279:	83 ec 08             	sub    $0x8,%esp
c000827c:	ff 75 e0             	pushl  -0x20(%ebp)
c000827f:	68 6b b3 00 c0       	push   $0xc000b36b
c0008284:	e8 3e 93 ff ff       	call   c00015c7 <disp_str_colour>
c0008289:	83 c4 10             	add    $0x10,%esp
c000828c:	83 ec 08             	sub    $0x8,%esp
c000828f:	ff 75 e0             	pushl  -0x20(%ebp)
c0008292:	68 6b b3 00 c0       	push   $0xc000b36b
c0008297:	e8 2b 93 ff ff       	call   c00015c7 <disp_str_colour>
c000829c:	83 c4 10             	add    $0x10,%esp
c000829f:	83 ec 0c             	sub    $0xc,%esp
c00082a2:	ff 75 0c             	pushl  0xc(%ebp)
c00082a5:	e8 d7 fb ff ff       	call   c0007e81 <disp_int>
c00082aa:	83 c4 10             	add    $0x10,%esp
c00082ad:	83 ec 0c             	sub    $0xc,%esp
c00082b0:	68 60 b3 00 c0       	push   $0xc000b360
c00082b5:	e8 d2 92 ff ff       	call   c000158c <disp_str>
c00082ba:	83 c4 10             	add    $0x10,%esp
c00082bd:	83 ec 08             	sub    $0x8,%esp
c00082c0:	ff 75 e0             	pushl  -0x20(%ebp)
c00082c3:	68 75 b3 00 c0       	push   $0xc000b375
c00082c8:	e8 fa 92 ff ff       	call   c00015c7 <disp_str_colour>
c00082cd:	83 c4 10             	add    $0x10,%esp
c00082d0:	83 ec 0c             	sub    $0xc,%esp
c00082d3:	ff 75 14             	pushl  0x14(%ebp)
c00082d6:	e8 a6 fb ff ff       	call   c0007e81 <disp_int>
c00082db:	83 c4 10             	add    $0x10,%esp
c00082de:	83 ec 0c             	sub    $0xc,%esp
c00082e1:	68 60 b3 00 c0       	push   $0xc000b360
c00082e6:	e8 a1 92 ff ff       	call   c000158c <disp_str>
c00082eb:	83 c4 10             	add    $0x10,%esp
c00082ee:	83 ec 08             	sub    $0x8,%esp
c00082f1:	ff 75 e0             	pushl  -0x20(%ebp)
c00082f4:	68 79 b3 00 c0       	push   $0xc000b379
c00082f9:	e8 c9 92 ff ff       	call   c00015c7 <disp_str_colour>
c00082fe:	83 c4 10             	add    $0x10,%esp
c0008301:	83 ec 0c             	sub    $0xc,%esp
c0008304:	ff 75 10             	pushl  0x10(%ebp)
c0008307:	e8 75 fb ff ff       	call   c0007e81 <disp_int>
c000830c:	83 c4 10             	add    $0x10,%esp
c000830f:	83 ec 0c             	sub    $0xc,%esp
c0008312:	68 60 b3 00 c0       	push   $0xc000b360
c0008317:	e8 70 92 ff ff       	call   c000158c <disp_str>
c000831c:	83 c4 10             	add    $0x10,%esp
c000831f:	83 ec 08             	sub    $0x8,%esp
c0008322:	ff 75 e0             	pushl  -0x20(%ebp)
c0008325:	68 7e b3 00 c0       	push   $0xc000b37e
c000832a:	e8 98 92 ff ff       	call   c00015c7 <disp_str_colour>
c000832f:	83 c4 10             	add    $0x10,%esp
c0008332:	83 ec 0c             	sub    $0xc,%esp
c0008335:	ff 75 18             	pushl  0x18(%ebp)
c0008338:	e8 44 fb ff ff       	call   c0007e81 <disp_int>
c000833d:	83 c4 10             	add    $0x10,%esp
c0008340:	83 ec 0c             	sub    $0xc,%esp
c0008343:	68 60 b3 00 c0       	push   $0xc000b360
c0008348:	e8 3f 92 ff ff       	call   c000158c <disp_str>
c000834d:	83 c4 10             	add    $0x10,%esp
c0008350:	90                   	nop
c0008351:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008354:	5b                   	pop    %ebx
c0008355:	5e                   	pop    %esi
c0008356:	5f                   	pop    %edi
c0008357:	5d                   	pop    %ebp
c0008358:	c3                   	ret    

c0008359 <init_internal_interrupt>:
c0008359:	55                   	push   %ebp
c000835a:	89 e5                	mov    %esp,%ebp
c000835c:	83 ec 08             	sub    $0x8,%esp
c000835f:	6a 0e                	push   $0xe
c0008361:	6a 08                	push   $0x8
c0008363:	68 03 16 00 c0       	push   $0xc0001603
c0008368:	6a 00                	push   $0x0
c000836a:	e8 96 cd ff ff       	call   c0005105 <InitInterruptDesc>
c000836f:	83 c4 10             	add    $0x10,%esp
c0008372:	6a 0e                	push   $0xe
c0008374:	6a 08                	push   $0x8
c0008376:	68 09 16 00 c0       	push   $0xc0001609
c000837b:	6a 01                	push   $0x1
c000837d:	e8 83 cd ff ff       	call   c0005105 <InitInterruptDesc>
c0008382:	83 c4 10             	add    $0x10,%esp
c0008385:	6a 0e                	push   $0xe
c0008387:	6a 08                	push   $0x8
c0008389:	68 0f 16 00 c0       	push   $0xc000160f
c000838e:	6a 02                	push   $0x2
c0008390:	e8 70 cd ff ff       	call   c0005105 <InitInterruptDesc>
c0008395:	83 c4 10             	add    $0x10,%esp
c0008398:	6a 0e                	push   $0xe
c000839a:	6a 08                	push   $0x8
c000839c:	68 15 16 00 c0       	push   $0xc0001615
c00083a1:	6a 03                	push   $0x3
c00083a3:	e8 5d cd ff ff       	call   c0005105 <InitInterruptDesc>
c00083a8:	83 c4 10             	add    $0x10,%esp
c00083ab:	6a 0e                	push   $0xe
c00083ad:	6a 08                	push   $0x8
c00083af:	68 1b 16 00 c0       	push   $0xc000161b
c00083b4:	6a 04                	push   $0x4
c00083b6:	e8 4a cd ff ff       	call   c0005105 <InitInterruptDesc>
c00083bb:	83 c4 10             	add    $0x10,%esp
c00083be:	6a 0e                	push   $0xe
c00083c0:	6a 08                	push   $0x8
c00083c2:	68 21 16 00 c0       	push   $0xc0001621
c00083c7:	6a 05                	push   $0x5
c00083c9:	e8 37 cd ff ff       	call   c0005105 <InitInterruptDesc>
c00083ce:	83 c4 10             	add    $0x10,%esp
c00083d1:	6a 0e                	push   $0xe
c00083d3:	6a 08                	push   $0x8
c00083d5:	68 27 16 00 c0       	push   $0xc0001627
c00083da:	6a 06                	push   $0x6
c00083dc:	e8 24 cd ff ff       	call   c0005105 <InitInterruptDesc>
c00083e1:	83 c4 10             	add    $0x10,%esp
c00083e4:	6a 0e                	push   $0xe
c00083e6:	6a 08                	push   $0x8
c00083e8:	68 2d 16 00 c0       	push   $0xc000162d
c00083ed:	6a 07                	push   $0x7
c00083ef:	e8 11 cd ff ff       	call   c0005105 <InitInterruptDesc>
c00083f4:	83 c4 10             	add    $0x10,%esp
c00083f7:	6a 0e                	push   $0xe
c00083f9:	6a 08                	push   $0x8
c00083fb:	68 33 16 00 c0       	push   $0xc0001633
c0008400:	6a 08                	push   $0x8
c0008402:	e8 fe cc ff ff       	call   c0005105 <InitInterruptDesc>
c0008407:	83 c4 10             	add    $0x10,%esp
c000840a:	6a 0e                	push   $0xe
c000840c:	6a 08                	push   $0x8
c000840e:	68 37 16 00 c0       	push   $0xc0001637
c0008413:	6a 09                	push   $0x9
c0008415:	e8 eb cc ff ff       	call   c0005105 <InitInterruptDesc>
c000841a:	83 c4 10             	add    $0x10,%esp
c000841d:	6a 0e                	push   $0xe
c000841f:	6a 08                	push   $0x8
c0008421:	68 3d 16 00 c0       	push   $0xc000163d
c0008426:	6a 0a                	push   $0xa
c0008428:	e8 d8 cc ff ff       	call   c0005105 <InitInterruptDesc>
c000842d:	83 c4 10             	add    $0x10,%esp
c0008430:	6a 0e                	push   $0xe
c0008432:	6a 08                	push   $0x8
c0008434:	68 41 16 00 c0       	push   $0xc0001641
c0008439:	6a 0b                	push   $0xb
c000843b:	e8 c5 cc ff ff       	call   c0005105 <InitInterruptDesc>
c0008440:	83 c4 10             	add    $0x10,%esp
c0008443:	6a 0e                	push   $0xe
c0008445:	6a 08                	push   $0x8
c0008447:	68 45 16 00 c0       	push   $0xc0001645
c000844c:	6a 0c                	push   $0xc
c000844e:	e8 b2 cc ff ff       	call   c0005105 <InitInterruptDesc>
c0008453:	83 c4 10             	add    $0x10,%esp
c0008456:	6a 0e                	push   $0xe
c0008458:	6a 08                	push   $0x8
c000845a:	68 49 16 00 c0       	push   $0xc0001649
c000845f:	6a 0d                	push   $0xd
c0008461:	e8 9f cc ff ff       	call   c0005105 <InitInterruptDesc>
c0008466:	83 c4 10             	add    $0x10,%esp
c0008469:	6a 0e                	push   $0xe
c000846b:	6a 08                	push   $0x8
c000846d:	68 4d 16 00 c0       	push   $0xc000164d
c0008472:	6a 0e                	push   $0xe
c0008474:	e8 8c cc ff ff       	call   c0005105 <InitInterruptDesc>
c0008479:	83 c4 10             	add    $0x10,%esp
c000847c:	6a 0e                	push   $0xe
c000847e:	6a 08                	push   $0x8
c0008480:	68 51 16 00 c0       	push   $0xc0001651
c0008485:	6a 10                	push   $0x10
c0008487:	e8 79 cc ff ff       	call   c0005105 <InitInterruptDesc>
c000848c:	83 c4 10             	add    $0x10,%esp
c000848f:	6a 0e                	push   $0xe
c0008491:	6a 08                	push   $0x8
c0008493:	68 57 16 00 c0       	push   $0xc0001657
c0008498:	6a 11                	push   $0x11
c000849a:	e8 66 cc ff ff       	call   c0005105 <InitInterruptDesc>
c000849f:	83 c4 10             	add    $0x10,%esp
c00084a2:	6a 0e                	push   $0xe
c00084a4:	6a 08                	push   $0x8
c00084a6:	68 5b 16 00 c0       	push   $0xc000165b
c00084ab:	6a 12                	push   $0x12
c00084ad:	e8 53 cc ff ff       	call   c0005105 <InitInterruptDesc>
c00084b2:	83 c4 10             	add    $0x10,%esp
c00084b5:	6a 0e                	push   $0xe
c00084b7:	6a 0e                	push   $0xe
c00084b9:	68 17 17 00 c0       	push   $0xc0001717
c00084be:	68 90 00 00 00       	push   $0x90
c00084c3:	e8 3d cc ff ff       	call   c0005105 <InitInterruptDesc>
c00084c8:	83 c4 10             	add    $0x10,%esp
c00084cb:	90                   	nop
c00084cc:	c9                   	leave  
c00084cd:	c3                   	ret    

c00084ce <test>:
c00084ce:	55                   	push   %ebp
c00084cf:	89 e5                	mov    %esp,%ebp
c00084d1:	83 ec 08             	sub    $0x8,%esp
c00084d4:	83 ec 0c             	sub    $0xc,%esp
c00084d7:	68 0e b6 00 c0       	push   $0xc000b60e
c00084dc:	e8 ab 90 ff ff       	call   c000158c <disp_str>
c00084e1:	83 c4 10             	add    $0x10,%esp
c00084e4:	83 ec 0c             	sub    $0xc,%esp
c00084e7:	68 34 b3 00 c0       	push   $0xc000b334
c00084ec:	e8 9b 90 ff ff       	call   c000158c <disp_str>
c00084f1:	83 c4 10             	add    $0x10,%esp
c00084f4:	90                   	nop
c00084f5:	c9                   	leave  
c00084f6:	c3                   	ret    

c00084f7 <disp_str_colour3>:
c00084f7:	55                   	push   %ebp
c00084f8:	89 e5                	mov    %esp,%ebp
c00084fa:	90                   	nop
c00084fb:	5d                   	pop    %ebp
c00084fc:	c3                   	ret    

c00084fd <spurious_irq>:
c00084fd:	55                   	push   %ebp
c00084fe:	89 e5                	mov    %esp,%ebp
c0008500:	83 ec 08             	sub    $0x8,%esp
c0008503:	83 ec 08             	sub    $0x8,%esp
c0008506:	6a 0b                	push   $0xb
c0008508:	68 10 b6 00 c0       	push   $0xc000b610
c000850d:	e8 b5 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008512:	83 c4 10             	add    $0x10,%esp
c0008515:	83 ec 0c             	sub    $0xc,%esp
c0008518:	ff 75 08             	pushl  0x8(%ebp)
c000851b:	e8 61 f9 ff ff       	call   c0007e81 <disp_int>
c0008520:	83 c4 10             	add    $0x10,%esp
c0008523:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008528:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000852e:	83 c0 01             	add    $0x1,%eax
c0008531:	83 d2 00             	adc    $0x0,%edx
c0008534:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c0008539:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c000853f:	83 ec 0c             	sub    $0xc,%esp
c0008542:	68 37 b6 00 c0       	push   $0xc000b637
c0008547:	e8 40 90 ff ff       	call   c000158c <disp_str>
c000854c:	83 c4 10             	add    $0x10,%esp
c000854f:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008554:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000855a:	83 ec 0c             	sub    $0xc,%esp
c000855d:	50                   	push   %eax
c000855e:	e8 1e f9 ff ff       	call   c0007e81 <disp_int>
c0008563:	83 c4 10             	add    $0x10,%esp
c0008566:	83 ec 0c             	sub    $0xc,%esp
c0008569:	68 39 b6 00 c0       	push   $0xc000b639
c000856e:	e8 19 90 ff ff       	call   c000158c <disp_str>
c0008573:	83 c4 10             	add    $0x10,%esp
c0008576:	83 ec 08             	sub    $0x8,%esp
c0008579:	6a 0c                	push   $0xc
c000857b:	68 3c b6 00 c0       	push   $0xc000b63c
c0008580:	e8 42 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008585:	83 c4 10             	add    $0x10,%esp
c0008588:	90                   	nop
c0008589:	c9                   	leave  
c000858a:	c3                   	ret    

c000858b <init_keyboard>:
c000858b:	55                   	push   %ebp
c000858c:	89 e5                	mov    %esp,%ebp
c000858e:	83 ec 18             	sub    $0x18,%esp
c0008591:	83 ec 04             	sub    $0x4,%esp
c0008594:	68 00 02 00 00       	push   $0x200
c0008599:	6a 00                	push   $0x0
c000859b:	68 ec 0b 01 c0       	push   $0xc0010bec
c00085a0:	e8 fa 34 00 00       	call   c000ba9f <Memset>
c00085a5:	83 c4 10             	add    $0x10,%esp
c00085a8:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c00085af:	0b 01 c0 
c00085b2:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00085b7:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c00085bc:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c00085c3:	00 00 00 
c00085c6:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00085cd:	00 00 00 
c00085d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00085d7:	eb 04                	jmp    c00085dd <init_keyboard+0x52>
c00085d9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00085dd:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00085e4:	7e f3                	jle    c00085d9 <init_keyboard+0x4e>
c00085e6:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00085ed:	00 00 00 
c00085f0:	e8 1a d9 ff ff       	call   c0005f0f <init_keyboard_handler>
c00085f5:	90                   	nop
c00085f6:	c9                   	leave  
c00085f7:	c3                   	ret    

c00085f8 <init2>:
c00085f8:	55                   	push   %ebp
c00085f9:	89 e5                	mov    %esp,%ebp
c00085fb:	83 ec 08             	sub    $0x8,%esp
c00085fe:	83 ec 0c             	sub    $0xc,%esp
c0008601:	68 61 b6 00 c0       	push   $0xc000b661
c0008606:	e8 81 8f ff ff       	call   c000158c <disp_str>
c000860b:	83 c4 10             	add    $0x10,%esp
c000860e:	e8 78 ff ff ff       	call   c000858b <init_keyboard>
c0008613:	83 ec 0c             	sub    $0xc,%esp
c0008616:	68 00 00 00 02       	push   $0x2000000
c000861b:	e8 a8 f3 ff ff       	call   c00079c8 <init_memory>
c0008620:	83 c4 10             	add    $0x10,%esp
c0008623:	90                   	nop
c0008624:	c9                   	leave  
c0008625:	c3                   	ret    

c0008626 <u_thread_a>:
c0008626:	55                   	push   %ebp
c0008627:	89 e5                	mov    %esp,%ebp
c0008629:	83 ec 08             	sub    $0x8,%esp
c000862c:	83 ec 0c             	sub    $0xc,%esp
c000862f:	68 67 b6 00 c0       	push   $0xc000b667
c0008634:	e8 53 8f ff ff       	call   c000158c <disp_str>
c0008639:	83 c4 10             	add    $0x10,%esp
c000863c:	eb fe                	jmp    c000863c <u_thread_a+0x16>

c000863e <kernel_main2>:
c000863e:	55                   	push   %ebp
c000863f:	89 e5                	mov    %esp,%ebp
c0008641:	57                   	push   %edi
c0008642:	56                   	push   %esi
c0008643:	53                   	push   %ebx
c0008644:	83 ec 3c             	sub    $0x3c,%esp
c0008647:	83 ec 0c             	sub    $0xc,%esp
c000864a:	68 75 b6 00 c0       	push   $0xc000b675
c000864f:	e8 38 8f ff ff       	call   c000158c <disp_str>
c0008654:	83 c4 10             	add    $0x10,%esp
c0008657:	e8 34 93 ff ff       	call   c0001990 <init>
c000865c:	c7 05 e8 1e 01 c0 00 	movl   $0x0,0xc0011ee8
c0008663:	00 00 00 
c0008666:	c7 05 ec 1e 01 c0 00 	movl   $0x0,0xc0011eec
c000866d:	00 00 00 
c0008670:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c0008677:	00 00 00 
c000867a:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c0008681:	00 00 00 
c0008684:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c000868b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008692:	e9 01 02 00 00       	jmp    c0008898 <kernel_main2+0x25a>
c0008697:	83 ec 08             	sub    $0x8,%esp
c000869a:	6a 00                	push   $0x0
c000869c:	6a 01                	push   $0x1
c000869e:	e8 f9 eb ff ff       	call   c000729c <alloc_memory>
c00086a3:	83 c4 10             	add    $0x10,%esp
c00086a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00086a9:	83 ec 04             	sub    $0x4,%esp
c00086ac:	68 b0 02 00 00       	push   $0x2b0
c00086b1:	6a 00                	push   $0x0
c00086b3:	ff 75 d8             	pushl  -0x28(%ebp)
c00086b6:	e8 e4 33 00 00       	call   c000ba9f <Memset>
c00086bb:	83 c4 10             	add    $0x10,%esp
c00086be:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086c1:	05 00 10 00 00       	add    $0x1000,%eax
c00086c6:	89 c2                	mov    %eax,%edx
c00086c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086cb:	89 10                	mov    %edx,(%eax)
c00086cd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086d0:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c00086d7:	00 00 
c00086d9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00086dc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086df:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c00086e5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086e8:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00086ef:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00086f3:	7e 0f                	jle    c0008704 <kernel_main2+0xc6>
c00086f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086f8:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c00086ff:	e9 90 01 00 00       	jmp    c0008894 <kernel_main2+0x256>
c0008704:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008707:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000870e:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0008712:	7f 73                	jg     c0008787 <kernel_main2+0x149>
c0008714:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c000871b:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0008722:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c0008729:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000872c:	8b 00                	mov    (%eax),%eax
c000872e:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0008731:	89 c2                	mov    %eax,%edx
c0008733:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008736:	89 10                	mov    %edx,(%eax)
c0008738:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000873b:	8b 00                	mov    (%eax),%eax
c000873d:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0008740:	89 c2                	mov    %eax,%edx
c0008742:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008745:	89 10                	mov    %edx,(%eax)
c0008747:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000874a:	8b 00                	mov    (%eax),%eax
c000874c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000874f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008752:	8b 50 14             	mov    0x14(%eax),%edx
c0008755:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008758:	89 50 24             	mov    %edx,0x24(%eax)
c000875b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000875e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008764:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008767:	8b 10                	mov    (%eax),%edx
c0008769:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000876c:	89 50 04             	mov    %edx,0x4(%eax)
c000876f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008772:	8b 50 04             	mov    0x4(%eax),%edx
c0008775:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008778:	89 50 08             	mov    %edx,0x8(%eax)
c000877b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000877e:	8b 50 08             	mov    0x8(%eax),%edx
c0008781:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008784:	89 50 0c             	mov    %edx,0xc(%eax)
c0008787:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000878a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000878d:	81 c2 34 01 00 00    	add    $0x134,%edx
c0008793:	83 ec 08             	sub    $0x8,%esp
c0008796:	50                   	push   %eax
c0008797:	52                   	push   %edx
c0008798:	e8 21 33 00 00       	call   c000babe <Strcpy>
c000879d:	83 c4 10             	add    $0x10,%esp
c00087a0:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00087a4:	83 c8 04             	or     $0x4,%eax
c00087a7:	0f b6 c0             	movzbl %al,%eax
c00087aa:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c00087ae:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00087b2:	83 c8 0c             	or     $0xc,%eax
c00087b5:	0f b6 c0             	movzbl %al,%eax
c00087b8:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c00087bc:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c00087c0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087c3:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00087c9:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00087cd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087d0:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c00087d6:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00087da:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087dd:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c00087e3:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00087e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087ea:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c00087f0:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00087f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087f7:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c00087fd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008800:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c0008807:	00 00 00 
c000880a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000880d:	8b 50 14             	mov    0x14(%eax),%edx
c0008810:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008813:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008819:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000881c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c000881f:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c0008825:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008828:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000882f:	00 00 00 
c0008832:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008835:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000883c:	00 00 00 
c000883f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008842:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0008849:	00 00 00 
c000884c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000884f:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0008856:	00 00 00 
c0008859:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000885c:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0008863:	00 00 00 
c0008866:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008869:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0008870:	00 00 00 
c0008873:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008876:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c000887c:	8d 90 00 32 08 c0    	lea    -0x3ff7ce00(%eax),%edx
c0008882:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008885:	89 c3                	mov    %eax,%ebx
c0008887:	b8 ac 00 00 00       	mov    $0xac,%eax
c000888c:	89 d7                	mov    %edx,%edi
c000888e:	89 de                	mov    %ebx,%esi
c0008890:	89 c1                	mov    %eax,%ecx
c0008892:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008894:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008898:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c000889c:	0f 8e f5 fd ff ff    	jle    c0008697 <kernel_main2+0x59>
c00088a2:	c7 05 c0 0b 01 c0 00 	movl   $0xc0083200,0xc0010bc0
c00088a9:	32 08 c0 
c00088ac:	eb fe                	jmp    c00088ac <kernel_main2+0x26e>

c00088ae <TestTTY>:
c00088ae:	55                   	push   %ebp
c00088af:	89 e5                	mov    %esp,%ebp
c00088b1:	83 ec 28             	sub    $0x28,%esp
c00088b4:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00088bb:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00088c2:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00088c8:	83 ec 08             	sub    $0x8,%esp
c00088cb:	6a 02                	push   $0x2
c00088cd:	8d 45 de             	lea    -0x22(%ebp),%eax
c00088d0:	50                   	push   %eax
c00088d1:	e8 df d7 ff ff       	call   c00060b5 <open>
c00088d6:	83 c4 10             	add    $0x10,%esp
c00088d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00088dc:	83 ec 08             	sub    $0x8,%esp
c00088df:	6a 02                	push   $0x2
c00088e1:	8d 45 de             	lea    -0x22(%ebp),%eax
c00088e4:	50                   	push   %eax
c00088e5:	e8 cb d7 ff ff       	call   c00060b5 <open>
c00088ea:	83 c4 10             	add    $0x10,%esp
c00088ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00088f0:	83 ec 0c             	sub    $0xc,%esp
c00088f3:	68 81 b6 00 c0       	push   $0xc000b681
c00088f8:	e8 1c 0a 00 00       	call   c0009319 <Printf>
c00088fd:	83 c4 10             	add    $0x10,%esp
c0008900:	83 ec 0c             	sub    $0xc,%esp
c0008903:	6a 0a                	push   $0xa
c0008905:	e8 aa a0 ff ff       	call   c00029b4 <sys_malloc>
c000890a:	83 c4 10             	add    $0x10,%esp
c000890d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008910:	83 ec 04             	sub    $0x4,%esp
c0008913:	6a 0a                	push   $0xa
c0008915:	6a 00                	push   $0x0
c0008917:	ff 75 ec             	pushl  -0x14(%ebp)
c000891a:	e8 80 31 00 00       	call   c000ba9f <Memset>
c000891f:	83 c4 10             	add    $0x10,%esp
c0008922:	83 ec 04             	sub    $0x4,%esp
c0008925:	6a 0a                	push   $0xa
c0008927:	ff 75 ec             	pushl  -0x14(%ebp)
c000892a:	ff 75 f0             	pushl  -0x10(%ebp)
c000892d:	e8 08 d8 ff ff       	call   c000613a <read>
c0008932:	83 c4 10             	add    $0x10,%esp
c0008935:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008938:	83 ec 08             	sub    $0x8,%esp
c000893b:	ff 75 ec             	pushl  -0x14(%ebp)
c000893e:	68 93 b6 00 c0       	push   $0xc000b693
c0008943:	e8 d1 09 00 00       	call   c0009319 <Printf>
c0008948:	83 c4 10             	add    $0x10,%esp
c000894b:	eb c3                	jmp    c0008910 <TestTTY+0x62>

c000894d <TestFS>:
c000894d:	55                   	push   %ebp
c000894e:	89 e5                	mov    %esp,%ebp
c0008950:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c0008956:	83 ec 0c             	sub    $0xc,%esp
c0008959:	68 9d b6 00 c0       	push   $0xc000b69d
c000895e:	e8 29 8c ff ff       	call   c000158c <disp_str>
c0008963:	83 c4 10             	add    $0x10,%esp
c0008966:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c000896d:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008974:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c000897a:	83 ec 08             	sub    $0x8,%esp
c000897d:	6a 02                	push   $0x2
c000897f:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008982:	50                   	push   %eax
c0008983:	e8 2d d7 ff ff       	call   c00060b5 <open>
c0008988:	83 c4 10             	add    $0x10,%esp
c000898b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000898e:	83 ec 08             	sub    $0x8,%esp
c0008991:	6a 02                	push   $0x2
c0008993:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008996:	50                   	push   %eax
c0008997:	e8 19 d7 ff ff       	call   c00060b5 <open>
c000899c:	83 c4 10             	add    $0x10,%esp
c000899f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089a2:	83 ec 0c             	sub    $0xc,%esp
c00089a5:	68 81 b6 00 c0       	push   $0xc000b681
c00089aa:	e8 6a 09 00 00       	call   c0009319 <Printf>
c00089af:	83 c4 10             	add    $0x10,%esp
c00089b2:	90                   	nop
c00089b3:	c9                   	leave  
c00089b4:	c3                   	ret    

c00089b5 <wait_exit>:
c00089b5:	55                   	push   %ebp
c00089b6:	89 e5                	mov    %esp,%ebp
c00089b8:	83 ec 28             	sub    $0x28,%esp
c00089bb:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00089c2:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00089c9:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00089cf:	83 ec 08             	sub    $0x8,%esp
c00089d2:	6a 02                	push   $0x2
c00089d4:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089d7:	50                   	push   %eax
c00089d8:	e8 d8 d6 ff ff       	call   c00060b5 <open>
c00089dd:	83 c4 10             	add    $0x10,%esp
c00089e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089e3:	83 ec 08             	sub    $0x8,%esp
c00089e6:	6a 02                	push   $0x2
c00089e8:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089eb:	50                   	push   %eax
c00089ec:	e8 c4 d6 ff ff       	call   c00060b5 <open>
c00089f1:	83 c4 10             	add    $0x10,%esp
c00089f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00089f7:	e8 d9 d8 ff ff       	call   c00062d5 <fork>
c00089fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00089ff:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008a03:	7e 25                	jle    c0008a2a <wait_exit+0x75>
c0008a05:	83 ec 0c             	sub    $0xc,%esp
c0008a08:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008a0b:	50                   	push   %eax
c0008a0c:	e8 5d d8 ff ff       	call   c000626e <wait>
c0008a11:	83 c4 10             	add    $0x10,%esp
c0008a14:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a17:	83 ec 08             	sub    $0x8,%esp
c0008a1a:	50                   	push   %eax
c0008a1b:	68 a5 b6 00 c0       	push   $0xc000b6a5
c0008a20:	e8 f4 08 00 00       	call   c0009319 <Printf>
c0008a25:	83 c4 10             	add    $0x10,%esp
c0008a28:	eb fe                	jmp    c0008a28 <wait_exit+0x73>
c0008a2a:	83 ec 0c             	sub    $0xc,%esp
c0008a2d:	68 c0 b6 00 c0       	push   $0xc000b6c0
c0008a32:	e8 e2 08 00 00       	call   c0009319 <Printf>
c0008a37:	83 c4 10             	add    $0x10,%esp
c0008a3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008a41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a44:	8d 50 01             	lea    0x1(%eax),%edx
c0008a47:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008a4a:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008a4f:	7f 02                	jg     c0008a53 <wait_exit+0x9e>
c0008a51:	eb ee                	jmp    c0008a41 <wait_exit+0x8c>
c0008a53:	90                   	nop
c0008a54:	83 ec 0c             	sub    $0xc,%esp
c0008a57:	68 cc b6 00 c0       	push   $0xc000b6cc
c0008a5c:	e8 b8 08 00 00       	call   c0009319 <Printf>
c0008a61:	83 c4 10             	add    $0x10,%esp
c0008a64:	83 ec 0c             	sub    $0xc,%esp
c0008a67:	6a 09                	push   $0x9
c0008a69:	e8 3e d8 ff ff       	call   c00062ac <exit>
c0008a6e:	83 c4 10             	add    $0x10,%esp
c0008a71:	83 ec 0c             	sub    $0xc,%esp
c0008a74:	68 da b6 00 c0       	push   $0xc000b6da
c0008a79:	e8 9b 08 00 00       	call   c0009319 <Printf>
c0008a7e:	83 c4 10             	add    $0x10,%esp
c0008a81:	eb fe                	jmp    c0008a81 <wait_exit+0xcc>

c0008a83 <INIT_fork>:
c0008a83:	55                   	push   %ebp
c0008a84:	89 e5                	mov    %esp,%ebp
c0008a86:	53                   	push   %ebx
c0008a87:	83 ec 74             	sub    $0x74,%esp
c0008a8a:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008a91:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008a98:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008a9e:	83 ec 08             	sub    $0x8,%esp
c0008aa1:	6a 02                	push   $0x2
c0008aa3:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008aa6:	50                   	push   %eax
c0008aa7:	e8 09 d6 ff ff       	call   c00060b5 <open>
c0008aac:	83 c4 10             	add    $0x10,%esp
c0008aaf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ab2:	83 ec 08             	sub    $0x8,%esp
c0008ab5:	6a 02                	push   $0x2
c0008ab7:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008aba:	50                   	push   %eax
c0008abb:	e8 f5 d5 ff ff       	call   c00060b5 <open>
c0008ac0:	83 c4 10             	add    $0x10,%esp
c0008ac3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ac6:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008acd:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008ad4:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008adb:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008ae2:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008ae9:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008af0:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008af7:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008afe:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008b05:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008b0c:	83 ec 0c             	sub    $0xc,%esp
c0008b0f:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b12:	50                   	push   %eax
c0008b13:	e8 01 08 00 00       	call   c0009319 <Printf>
c0008b18:	83 c4 10             	add    $0x10,%esp
c0008b1b:	83 ec 0c             	sub    $0xc,%esp
c0008b1e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b21:	50                   	push   %eax
c0008b22:	e8 b1 2f 00 00       	call   c000bad8 <Strlen>
c0008b27:	83 c4 10             	add    $0x10,%esp
c0008b2a:	83 ec 04             	sub    $0x4,%esp
c0008b2d:	50                   	push   %eax
c0008b2e:	6a 00                	push   $0x0
c0008b30:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b33:	50                   	push   %eax
c0008b34:	e8 66 2f 00 00       	call   c000ba9f <Memset>
c0008b39:	83 c4 10             	add    $0x10,%esp
c0008b3c:	83 ec 04             	sub    $0x4,%esp
c0008b3f:	6a 28                	push   $0x28
c0008b41:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b44:	50                   	push   %eax
c0008b45:	ff 75 f0             	pushl  -0x10(%ebp)
c0008b48:	e8 ed d5 ff ff       	call   c000613a <read>
c0008b4d:	83 c4 10             	add    $0x10,%esp
c0008b50:	83 ec 0c             	sub    $0xc,%esp
c0008b53:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b56:	50                   	push   %eax
c0008b57:	e8 bd 07 00 00       	call   c0009319 <Printf>
c0008b5c:	83 c4 10             	add    $0x10,%esp
c0008b5f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008b66:	e8 6a d7 ff ff       	call   c00062d5 <fork>
c0008b6b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008b6e:	83 ec 0c             	sub    $0xc,%esp
c0008b71:	6a 01                	push   $0x1
c0008b73:	e8 6d 06 00 00       	call   c00091e5 <delay>
c0008b78:	83 c4 10             	add    $0x10,%esp
c0008b7b:	83 ec 08             	sub    $0x8,%esp
c0008b7e:	ff 75 e8             	pushl  -0x18(%ebp)
c0008b81:	68 e8 b6 00 c0       	push   $0xc000b6e8
c0008b86:	e8 8e 07 00 00       	call   c0009319 <Printf>
c0008b8b:	83 c4 10             	add    $0x10,%esp
c0008b8e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008b92:	7e 7a                	jle    c0008c0e <INIT_fork+0x18b>
c0008b94:	83 ec 0c             	sub    $0xc,%esp
c0008b97:	68 f2 b6 00 c0       	push   $0xc000b6f2
c0008b9c:	e8 78 07 00 00       	call   c0009319 <Printf>
c0008ba1:	83 c4 10             	add    $0x10,%esp
c0008ba4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008ba8:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0008baf:	c7 45 92 6e 74 0a 00 	movl   $0xa746e,-0x6e(%ebp)
c0008bb6:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008bb9:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008bbe:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008bc3:	89 18                	mov    %ebx,(%eax)
c0008bc5:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008bc9:	8d 50 04             	lea    0x4(%eax),%edx
c0008bcc:	83 e2 fc             	and    $0xfffffffc,%edx
c0008bcf:	29 d0                	sub    %edx,%eax
c0008bd1:	01 c1                	add    %eax,%ecx
c0008bd3:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008bd6:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008bd9:	b8 00 00 00 00       	mov    $0x0,%eax
c0008bde:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008be1:	83 c0 04             	add    $0x4,%eax
c0008be4:	39 c8                	cmp    %ecx,%eax
c0008be6:	72 f6                	jb     c0008bde <INIT_fork+0x15b>
c0008be8:	01 c2                	add    %eax,%edx
c0008bea:	83 ec 0c             	sub    $0xc,%esp
c0008bed:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bf0:	50                   	push   %eax
c0008bf1:	e8 e2 2e 00 00       	call   c000bad8 <Strlen>
c0008bf6:	83 c4 10             	add    $0x10,%esp
c0008bf9:	83 ec 04             	sub    $0x4,%esp
c0008bfc:	50                   	push   %eax
c0008bfd:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c00:	50                   	push   %eax
c0008c01:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c04:	e8 a5 d5 ff ff       	call   c00061ae <write>
c0008c09:	83 c4 10             	add    $0x10,%esp
c0008c0c:	eb fe                	jmp    c0008c0c <INIT_fork+0x189>
c0008c0e:	83 ec 0c             	sub    $0xc,%esp
c0008c11:	68 f8 b6 00 c0       	push   $0xc000b6f8
c0008c16:	e8 71 89 ff ff       	call   c000158c <disp_str>
c0008c1b:	83 c4 10             	add    $0x10,%esp
c0008c1e:	83 ec 0c             	sub    $0xc,%esp
c0008c21:	6a 01                	push   $0x1
c0008c23:	e8 bd 05 00 00       	call   c00091e5 <delay>
c0008c28:	83 c4 10             	add    $0x10,%esp
c0008c2b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008c2f:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008c33:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0008c3a:	c7 45 92 64 0a 00 00 	movl   $0xa64,-0x6e(%ebp)
c0008c41:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008c44:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008c49:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008c4e:	89 18                	mov    %ebx,(%eax)
c0008c50:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008c54:	8d 50 04             	lea    0x4(%eax),%edx
c0008c57:	83 e2 fc             	and    $0xfffffffc,%edx
c0008c5a:	29 d0                	sub    %edx,%eax
c0008c5c:	01 c1                	add    %eax,%ecx
c0008c5e:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008c61:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008c64:	b8 00 00 00 00       	mov    $0x0,%eax
c0008c69:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008c6c:	83 c0 04             	add    $0x4,%eax
c0008c6f:	39 c8                	cmp    %ecx,%eax
c0008c71:	72 f6                	jb     c0008c69 <INIT_fork+0x1e6>
c0008c73:	01 c2                	add    %eax,%edx
c0008c75:	83 ec 0c             	sub    $0xc,%esp
c0008c78:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c7b:	50                   	push   %eax
c0008c7c:	e8 57 2e 00 00       	call   c000bad8 <Strlen>
c0008c81:	83 c4 10             	add    $0x10,%esp
c0008c84:	83 ec 04             	sub    $0x4,%esp
c0008c87:	50                   	push   %eax
c0008c88:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c8b:	50                   	push   %eax
c0008c8c:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c8f:	e8 1a d5 ff ff       	call   c00061ae <write>
c0008c94:	83 c4 10             	add    $0x10,%esp
c0008c97:	eb fe                	jmp    c0008c97 <INIT_fork+0x214>

c0008c99 <simple_shell>:
c0008c99:	55                   	push   %ebp
c0008c9a:	89 e5                	mov    %esp,%ebp
c0008c9c:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008ca2:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008ca9:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008cb0:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008cb6:	83 ec 08             	sub    $0x8,%esp
c0008cb9:	6a 02                	push   $0x2
c0008cbb:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008cbe:	50                   	push   %eax
c0008cbf:	e8 f1 d3 ff ff       	call   c00060b5 <open>
c0008cc4:	83 c4 10             	add    $0x10,%esp
c0008cc7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008cca:	83 ec 08             	sub    $0x8,%esp
c0008ccd:	6a 02                	push   $0x2
c0008ccf:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008cd2:	50                   	push   %eax
c0008cd3:	e8 dd d3 ff ff       	call   c00060b5 <open>
c0008cd8:	83 c4 10             	add    $0x10,%esp
c0008cdb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008cde:	83 ec 04             	sub    $0x4,%esp
c0008ce1:	68 80 00 00 00       	push   $0x80
c0008ce6:	6a 00                	push   $0x0
c0008ce8:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008cee:	50                   	push   %eax
c0008cef:	e8 ab 2d 00 00       	call   c000ba9f <Memset>
c0008cf4:	83 c4 10             	add    $0x10,%esp
c0008cf7:	83 ec 04             	sub    $0x4,%esp
c0008cfa:	68 80 00 00 00       	push   $0x80
c0008cff:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d05:	50                   	push   %eax
c0008d06:	ff 75 e0             	pushl  -0x20(%ebp)
c0008d09:	e8 2c d4 ff ff       	call   c000613a <read>
c0008d0e:	83 c4 10             	add    $0x10,%esp
c0008d11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d18:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008d1f:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d25:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d28:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d2b:	0f b6 00             	movzbl (%eax),%eax
c0008d2e:	88 45 db             	mov    %al,-0x25(%ebp)
c0008d31:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d34:	0f b6 00             	movzbl (%eax),%eax
c0008d37:	3c 20                	cmp    $0x20,%al
c0008d39:	74 1d                	je     c0008d58 <simple_shell+0xbf>
c0008d3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d3e:	0f b6 00             	movzbl (%eax),%eax
c0008d41:	84 c0                	test   %al,%al
c0008d43:	74 13                	je     c0008d58 <simple_shell+0xbf>
c0008d45:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008d49:	75 0d                	jne    c0008d58 <simple_shell+0xbf>
c0008d4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d4e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008d51:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008d58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d5b:	0f b6 00             	movzbl (%eax),%eax
c0008d5e:	3c 20                	cmp    $0x20,%al
c0008d60:	74 0a                	je     c0008d6c <simple_shell+0xd3>
c0008d62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d65:	0f b6 00             	movzbl (%eax),%eax
c0008d68:	84 c0                	test   %al,%al
c0008d6a:	75 26                	jne    c0008d92 <simple_shell+0xf9>
c0008d6c:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008d70:	75 20                	jne    c0008d92 <simple_shell+0xf9>
c0008d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d75:	8d 50 01             	lea    0x1(%eax),%edx
c0008d78:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008d7b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008d7e:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008d85:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d88:	c6 00 00             	movb   $0x0,(%eax)
c0008d8b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008d92:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008d96:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008d9a:	75 8c                	jne    c0008d28 <simple_shell+0x8f>
c0008d9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d9f:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008da6:	00 00 00 00 
c0008daa:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008db1:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008db7:	83 ec 08             	sub    $0x8,%esp
c0008dba:	6a 02                	push   $0x2
c0008dbc:	50                   	push   %eax
c0008dbd:	e8 f3 d2 ff ff       	call   c00060b5 <open>
c0008dc2:	83 c4 10             	add    $0x10,%esp
c0008dc5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008dc8:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008dcc:	75 54                	jne    c0008e22 <simple_shell+0x189>
c0008dce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008dd5:	eb 29                	jmp    c0008e00 <simple_shell+0x167>
c0008dd7:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008ddd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008de0:	01 d0                	add    %edx,%eax
c0008de2:	0f b6 00             	movzbl (%eax),%eax
c0008de5:	0f be c0             	movsbl %al,%eax
c0008de8:	83 ec 04             	sub    $0x4,%esp
c0008deb:	50                   	push   %eax
c0008dec:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008def:	68 ff b6 00 c0       	push   $0xc000b6ff
c0008df4:	e8 20 05 00 00       	call   c0009319 <Printf>
c0008df9:	83 c4 10             	add    $0x10,%esp
c0008dfc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008e00:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008e04:	7e d1                	jle    c0008dd7 <simple_shell+0x13e>
c0008e06:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e0c:	83 ec 08             	sub    $0x8,%esp
c0008e0f:	50                   	push   %eax
c0008e10:	68 06 b7 00 c0       	push   $0xc000b706
c0008e15:	e8 ff 04 00 00       	call   c0009319 <Printf>
c0008e1a:	83 c4 10             	add    $0x10,%esp
c0008e1d:	e9 bc fe ff ff       	jmp    c0008cde <simple_shell+0x45>
c0008e22:	e8 ae d4 ff ff       	call   c00062d5 <fork>
c0008e27:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008e2a:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008e2e:	7e 17                	jle    c0008e47 <simple_shell+0x1ae>
c0008e30:	83 ec 0c             	sub    $0xc,%esp
c0008e33:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008e39:	50                   	push   %eax
c0008e3a:	e8 2f d4 ff ff       	call   c000626e <wait>
c0008e3f:	83 c4 10             	add    $0x10,%esp
c0008e42:	e9 97 fe ff ff       	jmp    c0008cde <simple_shell+0x45>
c0008e47:	83 ec 0c             	sub    $0xc,%esp
c0008e4a:	ff 75 d0             	pushl  -0x30(%ebp)
c0008e4d:	e8 d0 d3 ff ff       	call   c0006222 <close>
c0008e52:	83 c4 10             	add    $0x10,%esp
c0008e55:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e5b:	83 ec 08             	sub    $0x8,%esp
c0008e5e:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008e64:	52                   	push   %edx
c0008e65:	50                   	push   %eax
c0008e66:	e8 59 d5 ff ff       	call   c00063c4 <execv>
c0008e6b:	83 c4 10             	add    $0x10,%esp
c0008e6e:	eb fe                	jmp    c0008e6e <simple_shell+0x1d5>

c0008e70 <test_split_str>:
c0008e70:	55                   	push   %ebp
c0008e71:	89 e5                	mov    %esp,%ebp
c0008e73:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008e79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008e80:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008e87:	c7 45 ec 0c b7 00 c0 	movl   $0xc000b70c,-0x14(%ebp)
c0008e8e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008e92:	75 1a                	jne    c0008eae <test_split_str+0x3e>
c0008e94:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e97:	0f b6 00             	movzbl (%eax),%eax
c0008e9a:	0f be c0             	movsbl %al,%eax
c0008e9d:	83 ec 08             	sub    $0x8,%esp
c0008ea0:	50                   	push   %eax
c0008ea1:	68 1d b7 00 c0       	push   $0xc000b71d
c0008ea6:	e8 6e 04 00 00       	call   c0009319 <Printf>
c0008eab:	83 c4 10             	add    $0x10,%esp
c0008eae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008eb1:	0f b6 00             	movzbl (%eax),%eax
c0008eb4:	3c 20                	cmp    $0x20,%al
c0008eb6:	75 0a                	jne    c0008ec2 <test_split_str+0x52>
c0008eb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ebb:	0f b6 00             	movzbl (%eax),%eax
c0008ebe:	84 c0                	test   %al,%al
c0008ec0:	74 13                	je     c0008ed5 <test_split_str+0x65>
c0008ec2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008ec6:	75 0d                	jne    c0008ed5 <test_split_str+0x65>
c0008ec8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ecb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ece:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008ed5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ed8:	0f b6 00             	movzbl (%eax),%eax
c0008edb:	3c 20                	cmp    $0x20,%al
c0008edd:	74 0a                	je     c0008ee9 <test_split_str+0x79>
c0008edf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ee2:	0f b6 00             	movzbl (%eax),%eax
c0008ee5:	84 c0                	test   %al,%al
c0008ee7:	75 26                	jne    c0008f0f <test_split_str+0x9f>
c0008ee9:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008eed:	75 20                	jne    c0008f0f <test_split_str+0x9f>
c0008eef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ef2:	8d 50 01             	lea    0x1(%eax),%edx
c0008ef5:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008ef8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008efb:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008f02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f05:	c6 00 00             	movb   $0x0,(%eax)
c0008f08:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008f0f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008f13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f16:	0f b6 00             	movzbl (%eax),%eax
c0008f19:	84 c0                	test   %al,%al
c0008f1b:	0f 85 6d ff ff ff    	jne    c0008e8e <test_split_str+0x1e>
c0008f21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f24:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008f27:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008f2e:	83 ec 08             	sub    $0x8,%esp
c0008f31:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f34:	68 26 b7 00 c0       	push   $0xc000b726
c0008f39:	e8 db 03 00 00       	call   c0009319 <Printf>
c0008f3e:	83 c4 10             	add    $0x10,%esp
c0008f41:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008f48:	eb 22                	jmp    c0008f6c <test_split_str+0xfc>
c0008f4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f4d:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008f54:	83 ec 04             	sub    $0x4,%esp
c0008f57:	50                   	push   %eax
c0008f58:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008f5b:	68 3d b7 00 c0       	push   $0xc000b73d
c0008f60:	e8 b4 03 00 00       	call   c0009319 <Printf>
c0008f65:	83 c4 10             	add    $0x10,%esp
c0008f68:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008f6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f6f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008f72:	7e d6                	jle    c0008f4a <test_split_str+0xda>
c0008f74:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008f7a:	83 ec 08             	sub    $0x8,%esp
c0008f7d:	68 4c b7 00 c0       	push   $0xc000b74c
c0008f82:	50                   	push   %eax
c0008f83:	e8 ba 12 00 00       	call   c000a242 <strcmp>
c0008f88:	83 c4 10             	add    $0x10,%esp
c0008f8b:	85 c0                	test   %eax,%eax
c0008f8d:	75 10                	jne    c0008f9f <test_split_str+0x12f>
c0008f8f:	83 ec 0c             	sub    $0xc,%esp
c0008f92:	68 51 b7 00 c0       	push   $0xc000b751
c0008f97:	e8 7d 03 00 00       	call   c0009319 <Printf>
c0008f9c:	83 c4 10             	add    $0x10,%esp
c0008f9f:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008fa5:	83 ec 08             	sub    $0x8,%esp
c0008fa8:	50                   	push   %eax
c0008fa9:	68 5d b7 00 c0       	push   $0xc000b75d
c0008fae:	e8 66 03 00 00       	call   c0009319 <Printf>
c0008fb3:	83 c4 10             	add    $0x10,%esp
c0008fb6:	83 ec 0c             	sub    $0xc,%esp
c0008fb9:	68 6b b7 00 c0       	push   $0xc000b76b
c0008fbe:	e8 56 03 00 00       	call   c0009319 <Printf>
c0008fc3:	83 c4 10             	add    $0x10,%esp
c0008fc6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008fcd:	eb 26                	jmp    c0008ff5 <test_split_str+0x185>
c0008fcf:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008fd5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008fd8:	01 d0                	add    %edx,%eax
c0008fda:	0f b6 00             	movzbl (%eax),%eax
c0008fdd:	0f be c0             	movsbl %al,%eax
c0008fe0:	83 ec 08             	sub    $0x8,%esp
c0008fe3:	50                   	push   %eax
c0008fe4:	68 7a b7 00 c0       	push   $0xc000b77a
c0008fe9:	e8 2b 03 00 00       	call   c0009319 <Printf>
c0008fee:	83 c4 10             	add    $0x10,%esp
c0008ff1:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008ff5:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008ff9:	7e d4                	jle    c0008fcf <test_split_str+0x15f>
c0008ffb:	c9                   	leave  
c0008ffc:	c3                   	ret    

c0008ffd <test_shell>:
c0008ffd:	55                   	push   %ebp
c0008ffe:	89 e5                	mov    %esp,%ebp
c0009000:	83 ec 48             	sub    $0x48,%esp
c0009003:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c000900a:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0009011:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0009017:	83 ec 08             	sub    $0x8,%esp
c000901a:	6a 02                	push   $0x2
c000901c:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c000901f:	50                   	push   %eax
c0009020:	e8 90 d0 ff ff       	call   c00060b5 <open>
c0009025:	83 c4 10             	add    $0x10,%esp
c0009028:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000902b:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0009032:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0009039:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0009040:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0009047:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c000904e:	83 ec 0c             	sub    $0xc,%esp
c0009051:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0009054:	50                   	push   %eax
c0009055:	e8 77 eb ff ff       	call   c0007bd1 <untar>
c000905a:	83 c4 10             	add    $0x10,%esp
c000905d:	e8 73 d2 ff ff       	call   c00062d5 <fork>
c0009062:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009065:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009069:	7e 25                	jle    c0009090 <test_shell+0x93>
c000906b:	83 ec 0c             	sub    $0xc,%esp
c000906e:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0009071:	50                   	push   %eax
c0009072:	e8 f7 d1 ff ff       	call   c000626e <wait>
c0009077:	83 c4 10             	add    $0x10,%esp
c000907a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000907d:	83 ec 08             	sub    $0x8,%esp
c0009080:	50                   	push   %eax
c0009081:	68 83 b7 00 c0       	push   $0xc000b783
c0009086:	e8 8e 02 00 00       	call   c0009319 <Printf>
c000908b:	83 c4 10             	add    $0x10,%esp
c000908e:	eb 23                	jmp    c00090b3 <test_shell+0xb6>
c0009090:	83 ec 0c             	sub    $0xc,%esp
c0009093:	68 95 b7 00 c0       	push   $0xc000b795
c0009098:	e8 7c 02 00 00       	call   c0009319 <Printf>
c000909d:	83 c4 10             	add    $0x10,%esp
c00090a0:	83 ec 0c             	sub    $0xc,%esp
c00090a3:	ff 75 f4             	pushl  -0xc(%ebp)
c00090a6:	e8 77 d1 ff ff       	call   c0006222 <close>
c00090ab:	83 c4 10             	add    $0x10,%esp
c00090ae:	e8 e6 fb ff ff       	call   c0008c99 <simple_shell>
c00090b3:	83 ec 0c             	sub    $0xc,%esp
c00090b6:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00090b9:	50                   	push   %eax
c00090ba:	e8 af d1 ff ff       	call   c000626e <wait>
c00090bf:	83 c4 10             	add    $0x10,%esp
c00090c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00090c5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00090c8:	83 ec 08             	sub    $0x8,%esp
c00090cb:	50                   	push   %eax
c00090cc:	68 a3 b7 00 c0       	push   $0xc000b7a3
c00090d1:	e8 43 02 00 00       	call   c0009319 <Printf>
c00090d6:	83 c4 10             	add    $0x10,%esp
c00090d9:	eb d8                	jmp    c00090b3 <test_shell+0xb6>

c00090db <test_exec>:
c00090db:	55                   	push   %ebp
c00090dc:	89 e5                	mov    %esp,%ebp
c00090de:	83 ec 38             	sub    $0x38,%esp
c00090e1:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c00090e8:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c00090ef:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c00090f5:	83 ec 08             	sub    $0x8,%esp
c00090f8:	6a 02                	push   $0x2
c00090fa:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00090fd:	50                   	push   %eax
c00090fe:	e8 b2 cf ff ff       	call   c00060b5 <open>
c0009103:	83 c4 10             	add    $0x10,%esp
c0009106:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009109:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0009110:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0009117:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c000911e:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0009125:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c000912c:	83 ec 0c             	sub    $0xc,%esp
c000912f:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0009132:	50                   	push   %eax
c0009133:	e8 99 ea ff ff       	call   c0007bd1 <untar>
c0009138:	83 c4 10             	add    $0x10,%esp
c000913b:	e8 95 d1 ff ff       	call   c00062d5 <fork>
c0009140:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009143:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009147:	7e 25                	jle    c000916e <test_exec+0x93>
c0009149:	83 ec 0c             	sub    $0xc,%esp
c000914c:	8d 45 cc             	lea    -0x34(%ebp),%eax
c000914f:	50                   	push   %eax
c0009150:	e8 19 d1 ff ff       	call   c000626e <wait>
c0009155:	83 c4 10             	add    $0x10,%esp
c0009158:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000915b:	83 ec 08             	sub    $0x8,%esp
c000915e:	50                   	push   %eax
c000915f:	68 83 b7 00 c0       	push   $0xc000b783
c0009164:	e8 b0 01 00 00       	call   c0009319 <Printf>
c0009169:	83 c4 10             	add    $0x10,%esp
c000916c:	eb 33                	jmp    c00091a1 <test_exec+0xc6>
c000916e:	83 ec 0c             	sub    $0xc,%esp
c0009171:	68 95 b7 00 c0       	push   $0xc000b795
c0009176:	e8 9e 01 00 00       	call   c0009319 <Printf>
c000917b:	83 c4 10             	add    $0x10,%esp
c000917e:	83 ec 0c             	sub    $0xc,%esp
c0009181:	6a 00                	push   $0x0
c0009183:	68 be b7 00 c0       	push   $0xc000b7be
c0009188:	68 c4 b7 00 c0       	push   $0xc000b7c4
c000918d:	68 4c b7 00 c0       	push   $0xc000b74c
c0009192:	68 ca b7 00 c0       	push   $0xc000b7ca
c0009197:	e8 cd d3 ff ff       	call   c0006569 <execl>
c000919c:	83 c4 20             	add    $0x20,%esp
c000919f:	eb fe                	jmp    c000919f <test_exec+0xc4>
c00091a1:	c9                   	leave  
c00091a2:	c3                   	ret    

c00091a3 <INIT>:
c00091a3:	55                   	push   %ebp
c00091a4:	89 e5                	mov    %esp,%ebp
c00091a6:	83 ec 08             	sub    $0x8,%esp
c00091a9:	e8 4f fe ff ff       	call   c0008ffd <test_shell>
c00091ae:	eb fe                	jmp    c00091ae <INIT+0xb>

c00091b0 <TestA>:
c00091b0:	55                   	push   %ebp
c00091b1:	89 e5                	mov    %esp,%ebp
c00091b3:	83 ec 08             	sub    $0x8,%esp
c00091b6:	83 ec 0c             	sub    $0xc,%esp
c00091b9:	6a 05                	push   $0x5
c00091bb:	e8 c1 ec ff ff       	call   c0007e81 <disp_int>
c00091c0:	83 c4 10             	add    $0x10,%esp
c00091c3:	83 ec 0c             	sub    $0xc,%esp
c00091c6:	68 34 b3 00 c0       	push   $0xc000b334
c00091cb:	e8 bc 83 ff ff       	call   c000158c <disp_str>
c00091d0:	83 c4 10             	add    $0x10,%esp
c00091d3:	83 ec 0c             	sub    $0xc,%esp
c00091d6:	68 d0 b7 00 c0       	push   $0xc000b7d0
c00091db:	e8 ac 83 ff ff       	call   c000158c <disp_str>
c00091e0:	83 c4 10             	add    $0x10,%esp
c00091e3:	eb fe                	jmp    c00091e3 <TestA+0x33>

c00091e5 <delay>:
c00091e5:	55                   	push   %ebp
c00091e6:	89 e5                	mov    %esp,%ebp
c00091e8:	83 ec 10             	sub    $0x10,%esp
c00091eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00091f2:	eb 2a                	jmp    c000921e <delay+0x39>
c00091f4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00091fb:	eb 17                	jmp    c0009214 <delay+0x2f>
c00091fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009204:	eb 04                	jmp    c000920a <delay+0x25>
c0009206:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000920a:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000920e:	7e f6                	jle    c0009206 <delay+0x21>
c0009210:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009214:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0009218:	7e e3                	jle    c00091fd <delay+0x18>
c000921a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000921e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009221:	3b 45 08             	cmp    0x8(%ebp),%eax
c0009224:	7c ce                	jl     c00091f4 <delay+0xf>
c0009226:	90                   	nop
c0009227:	c9                   	leave  
c0009228:	c3                   	ret    

c0009229 <TestB>:
c0009229:	55                   	push   %ebp
c000922a:	89 e5                	mov    %esp,%ebp
c000922c:	83 ec 08             	sub    $0x8,%esp
c000922f:	83 ec 0c             	sub    $0xc,%esp
c0009232:	68 d7 b7 00 c0       	push   $0xc000b7d7
c0009237:	e8 50 83 ff ff       	call   c000158c <disp_str>
c000923c:	83 c4 10             	add    $0x10,%esp
c000923f:	eb fe                	jmp    c000923f <TestB+0x16>

c0009241 <TestC>:
c0009241:	55                   	push   %ebp
c0009242:	89 e5                	mov    %esp,%ebp
c0009244:	83 ec 18             	sub    $0x18,%esp
c0009247:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000924e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0009252:	77 1a                	ja     c000926e <TestC+0x2d>
c0009254:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c000925b:	83 ec 08             	sub    $0x8,%esp
c000925e:	ff 75 f0             	pushl  -0x10(%ebp)
c0009261:	68 da b7 00 c0       	push   $0xc000b7da
c0009266:	e8 ae 00 00 00       	call   c0009319 <Printf>
c000926b:	83 c4 10             	add    $0x10,%esp
c000926e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009272:	eb da                	jmp    c000924e <TestC+0xd>

c0009274 <sys_get_ticks>:
c0009274:	55                   	push   %ebp
c0009275:	89 e5                	mov    %esp,%ebp
c0009277:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000927c:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0009282:	5d                   	pop    %ebp
c0009283:	c3                   	ret    

c0009284 <sys_write>:
c0009284:	55                   	push   %ebp
c0009285:	89 e5                	mov    %esp,%ebp
c0009287:	83 ec 18             	sub    $0x18,%esp
c000928a:	8b 45 10             	mov    0x10(%ebp),%eax
c000928d:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009293:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009299:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c000929e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00092a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00092aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00092ad:	eb 20                	jmp    c00092cf <sys_write+0x4b>
c00092af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092b2:	0f b6 00             	movzbl (%eax),%eax
c00092b5:	0f b6 c0             	movzbl %al,%eax
c00092b8:	83 ec 08             	sub    $0x8,%esp
c00092bb:	50                   	push   %eax
c00092bc:	ff 75 ec             	pushl  -0x14(%ebp)
c00092bf:	e8 72 c1 ff ff       	call   c0005436 <out_char>
c00092c4:	83 c4 10             	add    $0x10,%esp
c00092c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00092cb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00092cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00092d3:	7f da                	jg     c00092af <sys_write+0x2b>
c00092d5:	90                   	nop
c00092d6:	c9                   	leave  
c00092d7:	c3                   	ret    

c00092d8 <milli_delay>:
c00092d8:	55                   	push   %ebp
c00092d9:	89 e5                	mov    %esp,%ebp
c00092db:	83 ec 18             	sub    $0x18,%esp
c00092de:	e8 8b 0d 00 00       	call   c000a06e <get_ticks_ipc>
c00092e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092e6:	90                   	nop
c00092e7:	e8 82 0d 00 00       	call   c000a06e <get_ticks_ipc>
c00092ec:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00092ef:	89 c1                	mov    %eax,%ecx
c00092f1:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00092f6:	89 c8                	mov    %ecx,%eax
c00092f8:	f7 ea                	imul   %edx
c00092fa:	c1 fa 05             	sar    $0x5,%edx
c00092fd:	89 c8                	mov    %ecx,%eax
c00092ff:	c1 f8 1f             	sar    $0x1f,%eax
c0009302:	29 c2                	sub    %eax,%edx
c0009304:	89 d0                	mov    %edx,%eax
c0009306:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c000930c:	39 45 08             	cmp    %eax,0x8(%ebp)
c000930f:	77 d6                	ja     c00092e7 <milli_delay+0xf>
c0009311:	90                   	nop
c0009312:	c9                   	leave  
c0009313:	c3                   	ret    

c0009314 <TaskSys>:
c0009314:	55                   	push   %ebp
c0009315:	89 e5                	mov    %esp,%ebp
c0009317:	eb fe                	jmp    c0009317 <TaskSys+0x3>

c0009319 <Printf>:
c0009319:	55                   	push   %ebp
c000931a:	89 e5                	mov    %esp,%ebp
c000931c:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009322:	83 ec 04             	sub    $0x4,%esp
c0009325:	68 00 01 00 00       	push   $0x100
c000932a:	6a 00                	push   $0x0
c000932c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009332:	50                   	push   %eax
c0009333:	e8 67 27 00 00       	call   c000ba9f <Memset>
c0009338:	83 c4 10             	add    $0x10,%esp
c000933b:	8d 45 0c             	lea    0xc(%ebp),%eax
c000933e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009341:	8b 45 08             	mov    0x8(%ebp),%eax
c0009344:	83 ec 04             	sub    $0x4,%esp
c0009347:	ff 75 f4             	pushl  -0xc(%ebp)
c000934a:	50                   	push   %eax
c000934b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009351:	50                   	push   %eax
c0009352:	e8 20 00 00 00       	call   c0009377 <vsprintf>
c0009357:	83 c4 10             	add    $0x10,%esp
c000935a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000935d:	83 ec 04             	sub    $0x4,%esp
c0009360:	ff 75 f0             	pushl  -0x10(%ebp)
c0009363:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009369:	50                   	push   %eax
c000936a:	6a 00                	push   $0x0
c000936c:	e8 3d ce ff ff       	call   c00061ae <write>
c0009371:	83 c4 10             	add    $0x10,%esp
c0009374:	90                   	nop
c0009375:	c9                   	leave  
c0009376:	c3                   	ret    

c0009377 <vsprintf>:
c0009377:	55                   	push   %ebp
c0009378:	89 e5                	mov    %esp,%ebp
c000937a:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009380:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009386:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c000938c:	83 ec 04             	sub    $0x4,%esp
c000938f:	6a 40                	push   $0x40
c0009391:	6a 00                	push   $0x0
c0009393:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009399:	50                   	push   %eax
c000939a:	e8 00 27 00 00       	call   c000ba9f <Memset>
c000939f:	83 c4 10             	add    $0x10,%esp
c00093a2:	8b 45 10             	mov    0x10(%ebp),%eax
c00093a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00093af:	8b 45 08             	mov    0x8(%ebp),%eax
c00093b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00093b5:	e9 53 01 00 00       	jmp    c000950d <vsprintf+0x196>
c00093ba:	8b 45 0c             	mov    0xc(%ebp),%eax
c00093bd:	0f b6 00             	movzbl (%eax),%eax
c00093c0:	3c 25                	cmp    $0x25,%al
c00093c2:	74 16                	je     c00093da <vsprintf+0x63>
c00093c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00093c7:	8d 50 01             	lea    0x1(%eax),%edx
c00093ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00093cd:	8b 55 0c             	mov    0xc(%ebp),%edx
c00093d0:	0f b6 12             	movzbl (%edx),%edx
c00093d3:	88 10                	mov    %dl,(%eax)
c00093d5:	e9 2f 01 00 00       	jmp    c0009509 <vsprintf+0x192>
c00093da:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00093de:	8b 45 0c             	mov    0xc(%ebp),%eax
c00093e1:	0f b6 00             	movzbl (%eax),%eax
c00093e4:	0f be c0             	movsbl %al,%eax
c00093e7:	83 f8 64             	cmp    $0x64,%eax
c00093ea:	74 26                	je     c0009412 <vsprintf+0x9b>
c00093ec:	83 f8 64             	cmp    $0x64,%eax
c00093ef:	7f 0e                	jg     c00093ff <vsprintf+0x88>
c00093f1:	83 f8 63             	cmp    $0x63,%eax
c00093f4:	0f 84 f2 00 00 00    	je     c00094ec <vsprintf+0x175>
c00093fa:	e9 0a 01 00 00       	jmp    c0009509 <vsprintf+0x192>
c00093ff:	83 f8 73             	cmp    $0x73,%eax
c0009402:	0f 84 b0 00 00 00    	je     c00094b8 <vsprintf+0x141>
c0009408:	83 f8 78             	cmp    $0x78,%eax
c000940b:	74 5d                	je     c000946a <vsprintf+0xf3>
c000940d:	e9 f7 00 00 00       	jmp    c0009509 <vsprintf+0x192>
c0009412:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009415:	8b 00                	mov    (%eax),%eax
c0009417:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000941a:	83 ec 04             	sub    $0x4,%esp
c000941d:	6a 0a                	push   $0xa
c000941f:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009425:	50                   	push   %eax
c0009426:	ff 75 e8             	pushl  -0x18(%ebp)
c0009429:	e8 8b 0c 00 00       	call   c000a0b9 <itoa>
c000942e:	83 c4 10             	add    $0x10,%esp
c0009431:	83 ec 08             	sub    $0x8,%esp
c0009434:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000943a:	50                   	push   %eax
c000943b:	ff 75 f4             	pushl  -0xc(%ebp)
c000943e:	e8 7b 26 00 00       	call   c000babe <Strcpy>
c0009443:	83 c4 10             	add    $0x10,%esp
c0009446:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000944a:	83 ec 0c             	sub    $0xc,%esp
c000944d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009453:	50                   	push   %eax
c0009454:	e8 7f 26 00 00       	call   c000bad8 <Strlen>
c0009459:	83 c4 10             	add    $0x10,%esp
c000945c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000945f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009462:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009465:	e9 9f 00 00 00       	jmp    c0009509 <vsprintf+0x192>
c000946a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000946d:	8b 00                	mov    (%eax),%eax
c000946f:	83 ec 08             	sub    $0x8,%esp
c0009472:	50                   	push   %eax
c0009473:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009479:	50                   	push   %eax
c000947a:	e8 5c e9 ff ff       	call   c0007ddb <atoi>
c000947f:	83 c4 10             	add    $0x10,%esp
c0009482:	83 ec 08             	sub    $0x8,%esp
c0009485:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000948b:	50                   	push   %eax
c000948c:	ff 75 f4             	pushl  -0xc(%ebp)
c000948f:	e8 2a 26 00 00       	call   c000babe <Strcpy>
c0009494:	83 c4 10             	add    $0x10,%esp
c0009497:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000949b:	83 ec 0c             	sub    $0xc,%esp
c000949e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094a4:	50                   	push   %eax
c00094a5:	e8 2e 26 00 00       	call   c000bad8 <Strlen>
c00094aa:	83 c4 10             	add    $0x10,%esp
c00094ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094b3:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094b6:	eb 51                	jmp    c0009509 <vsprintf+0x192>
c00094b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094bb:	8b 00                	mov    (%eax),%eax
c00094bd:	83 ec 08             	sub    $0x8,%esp
c00094c0:	50                   	push   %eax
c00094c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00094c4:	e8 f5 25 00 00       	call   c000babe <Strcpy>
c00094c9:	83 c4 10             	add    $0x10,%esp
c00094cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094cf:	8b 00                	mov    (%eax),%eax
c00094d1:	83 ec 0c             	sub    $0xc,%esp
c00094d4:	50                   	push   %eax
c00094d5:	e8 fe 25 00 00       	call   c000bad8 <Strlen>
c00094da:	83 c4 10             	add    $0x10,%esp
c00094dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094e0:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094e7:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094ea:	eb 1d                	jmp    c0009509 <vsprintf+0x192>
c00094ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094ef:	0f b6 10             	movzbl (%eax),%edx
c00094f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094f5:	88 10                	mov    %dl,(%eax)
c00094f7:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094fb:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009502:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009505:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009508:	90                   	nop
c0009509:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c000950d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009510:	0f b6 00             	movzbl (%eax),%eax
c0009513:	84 c0                	test   %al,%al
c0009515:	0f 85 9f fe ff ff    	jne    c00093ba <vsprintf+0x43>
c000951b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000951e:	2b 45 08             	sub    0x8(%ebp),%eax
c0009521:	c9                   	leave  
c0009522:	c3                   	ret    

c0009523 <printx>:
c0009523:	55                   	push   %ebp
c0009524:	89 e5                	mov    %esp,%ebp
c0009526:	81 ec 18 01 00 00    	sub    $0x118,%esp
c000952c:	8d 45 0c             	lea    0xc(%ebp),%eax
c000952f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009532:	8b 45 08             	mov    0x8(%ebp),%eax
c0009535:	83 ec 04             	sub    $0x4,%esp
c0009538:	ff 75 f4             	pushl  -0xc(%ebp)
c000953b:	50                   	push   %eax
c000953c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009542:	50                   	push   %eax
c0009543:	e8 2f fe ff ff       	call   c0009377 <vsprintf>
c0009548:	83 c4 10             	add    $0x10,%esp
c000954b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000954e:	83 ec 08             	sub    $0x8,%esp
c0009551:	ff 75 f0             	pushl  -0x10(%ebp)
c0009554:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000955a:	50                   	push   %eax
c000955b:	e8 f8 93 ff ff       	call   c0002958 <write_debug>
c0009560:	83 c4 10             	add    $0x10,%esp
c0009563:	90                   	nop
c0009564:	c9                   	leave  
c0009565:	c3                   	ret    

c0009566 <sys_printx>:
c0009566:	55                   	push   %ebp
c0009567:	89 e5                	mov    %esp,%ebp
c0009569:	83 ec 28             	sub    $0x28,%esp
c000956c:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009571:	85 c0                	test   %eax,%eax
c0009573:	75 15                	jne    c000958a <sys_printx+0x24>
c0009575:	8b 45 10             	mov    0x10(%ebp),%eax
c0009578:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c000957e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009581:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009588:	eb 10                	jmp    c000959a <sys_printx+0x34>
c000958a:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c000958f:	85 c0                	test   %eax,%eax
c0009591:	74 07                	je     c000959a <sys_printx+0x34>
c0009593:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000959a:	8b 55 08             	mov    0x8(%ebp),%edx
c000959d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095a0:	01 d0                	add    %edx,%eax
c00095a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00095a5:	8b 45 10             	mov    0x10(%ebp),%eax
c00095a8:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00095ae:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00095b4:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00095b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00095bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00095bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095c5:	0f b6 00             	movzbl (%eax),%eax
c00095c8:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00095cb:	eb 3a                	jmp    c0009607 <sys_printx+0xa1>
c00095cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095d0:	0f b6 00             	movzbl (%eax),%eax
c00095d3:	3c 3b                	cmp    $0x3b,%al
c00095d5:	74 0a                	je     c00095e1 <sys_printx+0x7b>
c00095d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095da:	0f b6 00             	movzbl (%eax),%eax
c00095dd:	3c 3a                	cmp    $0x3a,%al
c00095df:	75 06                	jne    c00095e7 <sys_printx+0x81>
c00095e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00095e5:	eb 20                	jmp    c0009607 <sys_printx+0xa1>
c00095e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095ea:	0f b6 00             	movzbl (%eax),%eax
c00095ed:	0f b6 c0             	movzbl %al,%eax
c00095f0:	83 ec 08             	sub    $0x8,%esp
c00095f3:	50                   	push   %eax
c00095f4:	ff 75 e4             	pushl  -0x1c(%ebp)
c00095f7:	e8 3a be ff ff       	call   c0005436 <out_char>
c00095fc:	83 c4 10             	add    $0x10,%esp
c00095ff:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009603:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009607:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000960b:	7f c0                	jg     c00095cd <sys_printx+0x67>
c000960d:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009611:	75 10                	jne    c0009623 <sys_printx+0xbd>
c0009613:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009618:	85 c0                	test   %eax,%eax
c000961a:	74 13                	je     c000962f <sys_printx+0xc9>
c000961c:	e8 a9 81 ff ff       	call   c00017ca <disable_int>
c0009621:	eb 0c                	jmp    c000962f <sys_printx+0xc9>
c0009623:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009627:	75 06                	jne    c000962f <sys_printx+0xc9>
c0009629:	e8 9c 81 ff ff       	call   c00017ca <disable_int>
c000962e:	90                   	nop
c000962f:	90                   	nop
c0009630:	c9                   	leave  
c0009631:	c3                   	ret    

c0009632 <spin>:
c0009632:	55                   	push   %ebp
c0009633:	89 e5                	mov    %esp,%ebp
c0009635:	83 ec 08             	sub    $0x8,%esp
c0009638:	83 ec 0c             	sub    $0xc,%esp
c000963b:	ff 75 08             	pushl  0x8(%ebp)
c000963e:	e8 49 7f ff ff       	call   c000158c <disp_str>
c0009643:	83 c4 10             	add    $0x10,%esp
c0009646:	83 ec 0c             	sub    $0xc,%esp
c0009649:	68 34 b3 00 c0       	push   $0xc000b334
c000964e:	e8 39 7f ff ff       	call   c000158c <disp_str>
c0009653:	83 c4 10             	add    $0x10,%esp
c0009656:	eb fe                	jmp    c0009656 <spin+0x24>

c0009658 <panic>:
c0009658:	55                   	push   %ebp
c0009659:	89 e5                	mov    %esp,%ebp
c000965b:	83 ec 08             	sub    $0x8,%esp
c000965e:	83 ec 04             	sub    $0x4,%esp
c0009661:	ff 75 08             	pushl  0x8(%ebp)
c0009664:	6a 3a                	push   $0x3a
c0009666:	68 e7 b7 00 c0       	push   $0xc000b7e7
c000966b:	e8 b3 fe ff ff       	call   c0009523 <printx>
c0009670:	83 c4 10             	add    $0x10,%esp
c0009673:	90                   	nop
c0009674:	c9                   	leave  
c0009675:	c3                   	ret    

c0009676 <assertion_failure>:
c0009676:	55                   	push   %ebp
c0009677:	89 e5                	mov    %esp,%ebp
c0009679:	83 ec 08             	sub    $0x8,%esp
c000967c:	83 ec 08             	sub    $0x8,%esp
c000967f:	ff 75 14             	pushl  0x14(%ebp)
c0009682:	ff 75 10             	pushl  0x10(%ebp)
c0009685:	ff 75 0c             	pushl  0xc(%ebp)
c0009688:	ff 75 08             	pushl  0x8(%ebp)
c000968b:	6a 3b                	push   $0x3b
c000968d:	68 f0 b7 00 c0       	push   $0xc000b7f0
c0009692:	e8 8c fe ff ff       	call   c0009523 <printx>
c0009697:	83 c4 20             	add    $0x20,%esp
c000969a:	83 ec 0c             	sub    $0xc,%esp
c000969d:	68 23 b8 00 c0       	push   $0xc000b823
c00096a2:	e8 8b ff ff ff       	call   c0009632 <spin>
c00096a7:	83 c4 10             	add    $0x10,%esp
c00096aa:	90                   	nop
c00096ab:	c9                   	leave  
c00096ac:	c3                   	ret    

c00096ad <dead_lock>:
c00096ad:	55                   	push   %ebp
c00096ae:	89 e5                	mov    %esp,%ebp
c00096b0:	b8 00 00 00 00       	mov    $0x0,%eax
c00096b5:	5d                   	pop    %ebp
c00096b6:	c3                   	ret    

c00096b7 <sys_send_msg>:
c00096b7:	55                   	push   %ebp
c00096b8:	89 e5                	mov    %esp,%ebp
c00096ba:	83 ec 38             	sub    $0x38,%esp
c00096bd:	83 ec 0c             	sub    $0xc,%esp
c00096c0:	ff 75 0c             	pushl  0xc(%ebp)
c00096c3:	e8 3b b7 ff ff       	call   c0004e03 <pid2proc>
c00096c8:	83 c4 10             	add    $0x10,%esp
c00096cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00096ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00096d2:	75 22                	jne    c00096f6 <sys_send_msg+0x3f>
c00096d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00096d8:	75 1c                	jne    c00096f6 <sys_send_msg+0x3f>
c00096da:	68 99 05 00 00       	push   $0x599
c00096df:	68 2f b8 00 c0       	push   $0xc000b82f
c00096e4:	68 2f b8 00 c0       	push   $0xc000b82f
c00096e9:	68 3f b8 00 c0       	push   $0xc000b83f
c00096ee:	e8 83 ff ff ff       	call   c0009676 <assertion_failure>
c00096f3:	83 c4 10             	add    $0x10,%esp
c00096f6:	83 ec 0c             	sub    $0xc,%esp
c00096f9:	ff 75 10             	pushl  0x10(%ebp)
c00096fc:	e8 74 b7 ff ff       	call   c0004e75 <proc2pid>
c0009701:	83 c4 10             	add    $0x10,%esp
c0009704:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009707:	8b 45 10             	mov    0x10(%ebp),%eax
c000970a:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009710:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009713:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000971a:	8b 45 08             	mov    0x8(%ebp),%eax
c000971d:	83 ec 08             	sub    $0x8,%esp
c0009720:	6a 6c                	push   $0x6c
c0009722:	50                   	push   %eax
c0009723:	e8 c5 d9 ff ff       	call   c00070ed <alloc_virtual_memory>
c0009728:	83 c4 10             	add    $0x10,%esp
c000972b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000972e:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009735:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009738:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000973b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000973e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009741:	89 10                	mov    %edx,(%eax)
c0009743:	83 ec 08             	sub    $0x8,%esp
c0009746:	ff 75 0c             	pushl  0xc(%ebp)
c0009749:	ff 75 e8             	pushl  -0x18(%ebp)
c000974c:	e8 5c ff ff ff       	call   c00096ad <dead_lock>
c0009751:	83 c4 10             	add    $0x10,%esp
c0009754:	83 f8 01             	cmp    $0x1,%eax
c0009757:	75 10                	jne    c0009769 <sys_send_msg+0xb2>
c0009759:	83 ec 0c             	sub    $0xc,%esp
c000975c:	68 4f b8 00 c0       	push   $0xc000b84f
c0009761:	e8 f2 fe ff ff       	call   c0009658 <panic>
c0009766:	83 c4 10             	add    $0x10,%esp
c0009769:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000976c:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009773:	3c 02                	cmp    $0x2,%al
c0009775:	0f 85 99 01 00 00    	jne    c0009914 <sys_send_msg+0x25d>
c000977b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000977e:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009784:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009787:	74 12                	je     c000979b <sys_send_msg+0xe4>
c0009789:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000978c:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009792:	83 f8 12             	cmp    $0x12,%eax
c0009795:	0f 85 79 01 00 00    	jne    c0009914 <sys_send_msg+0x25d>
c000979b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000979e:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00097a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00097a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097aa:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00097b0:	83 ec 08             	sub    $0x8,%esp
c00097b3:	6a 6c                	push   $0x6c
c00097b5:	50                   	push   %eax
c00097b6:	e8 32 d9 ff ff       	call   c00070ed <alloc_virtual_memory>
c00097bb:	83 c4 10             	add    $0x10,%esp
c00097be:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00097c1:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00097c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00097c7:	83 ec 04             	sub    $0x4,%esp
c00097ca:	ff 75 d8             	pushl  -0x28(%ebp)
c00097cd:	52                   	push   %edx
c00097ce:	50                   	push   %eax
c00097cf:	e8 ca e3 ff ff       	call   c0007b9e <Memcpy>
c00097d4:	83 c4 10             	add    $0x10,%esp
c00097d7:	8b 45 10             	mov    0x10(%ebp),%eax
c00097da:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00097e1:	00 00 00 
c00097e4:	8b 45 10             	mov    0x10(%ebp),%eax
c00097e7:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00097ee:	8b 45 10             	mov    0x10(%ebp),%eax
c00097f1:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00097f8:	00 00 00 
c00097fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097fe:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009805:	00 00 00 
c0009808:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000980b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009812:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009815:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000981c:	00 00 00 
c000981f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009822:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009829:	00 00 00 
c000982c:	83 ec 0c             	sub    $0xc,%esp
c000982f:	ff 75 ec             	pushl  -0x14(%ebp)
c0009832:	e8 e7 07 00 00       	call   c000a01e <unblock>
c0009837:	83 c4 10             	add    $0x10,%esp
c000983a:	8b 45 10             	mov    0x10(%ebp),%eax
c000983d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009844:	84 c0                	test   %al,%al
c0009846:	74 1c                	je     c0009864 <sys_send_msg+0x1ad>
c0009848:	68 ca 05 00 00       	push   $0x5ca
c000984d:	68 2f b8 00 c0       	push   $0xc000b82f
c0009852:	68 2f b8 00 c0       	push   $0xc000b82f
c0009857:	68 5a b8 00 c0       	push   $0xc000b85a
c000985c:	e8 15 fe ff ff       	call   c0009676 <assertion_failure>
c0009861:	83 c4 10             	add    $0x10,%esp
c0009864:	8b 45 10             	mov    0x10(%ebp),%eax
c0009867:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000986d:	83 f8 21             	cmp    $0x21,%eax
c0009870:	74 1c                	je     c000988e <sys_send_msg+0x1d7>
c0009872:	68 cb 05 00 00       	push   $0x5cb
c0009877:	68 2f b8 00 c0       	push   $0xc000b82f
c000987c:	68 2f b8 00 c0       	push   $0xc000b82f
c0009881:	68 6e b8 00 c0       	push   $0xc000b86e
c0009886:	e8 eb fd ff ff       	call   c0009676 <assertion_failure>
c000988b:	83 c4 10             	add    $0x10,%esp
c000988e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009891:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009897:	85 c0                	test   %eax,%eax
c0009899:	74 1c                	je     c00098b7 <sys_send_msg+0x200>
c000989b:	68 cd 05 00 00       	push   $0x5cd
c00098a0:	68 2f b8 00 c0       	push   $0xc000b82f
c00098a5:	68 2f b8 00 c0       	push   $0xc000b82f
c00098aa:	68 8b b8 00 c0       	push   $0xc000b88b
c00098af:	e8 c2 fd ff ff       	call   c0009676 <assertion_failure>
c00098b4:	83 c4 10             	add    $0x10,%esp
c00098b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098ba:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00098c1:	84 c0                	test   %al,%al
c00098c3:	74 1c                	je     c00098e1 <sys_send_msg+0x22a>
c00098c5:	68 ce 05 00 00       	push   $0x5ce
c00098ca:	68 2f b8 00 c0       	push   $0xc000b82f
c00098cf:	68 2f b8 00 c0       	push   $0xc000b82f
c00098d4:	68 a0 b8 00 c0       	push   $0xc000b8a0
c00098d9:	e8 98 fd ff ff       	call   c0009676 <assertion_failure>
c00098de:	83 c4 10             	add    $0x10,%esp
c00098e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098e4:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00098ea:	83 f8 21             	cmp    $0x21,%eax
c00098ed:	0f 84 45 01 00 00    	je     c0009a38 <sys_send_msg+0x381>
c00098f3:	68 cf 05 00 00       	push   $0x5cf
c00098f8:	68 2f b8 00 c0       	push   $0xc000b82f
c00098fd:	68 2f b8 00 c0       	push   $0xc000b82f
c0009902:	68 b8 b8 00 c0       	push   $0xc000b8b8
c0009907:	e8 6a fd ff ff       	call   c0009676 <assertion_failure>
c000990c:	83 c4 10             	add    $0x10,%esp
c000990f:	e9 24 01 00 00       	jmp    c0009a38 <sys_send_msg+0x381>
c0009914:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000991b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000991e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009921:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009924:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000992a:	85 c0                	test   %eax,%eax
c000992c:	75 1b                	jne    c0009949 <sys_send_msg+0x292>
c000992e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009931:	8b 55 10             	mov    0x10(%ebp),%edx
c0009934:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000993a:	8b 45 10             	mov    0x10(%ebp),%eax
c000993d:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009944:	00 00 00 
c0009947:	eb 3f                	jmp    c0009988 <sys_send_msg+0x2d1>
c0009949:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000994c:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009952:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009955:	eb 12                	jmp    c0009969 <sys_send_msg+0x2b2>
c0009957:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000995a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000995d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009960:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009966:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009969:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000996d:	75 e8                	jne    c0009957 <sys_send_msg+0x2a0>
c000996f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009972:	8b 55 10             	mov    0x10(%ebp),%edx
c0009975:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000997b:	8b 45 10             	mov    0x10(%ebp),%eax
c000997e:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009985:	00 00 00 
c0009988:	8b 45 10             	mov    0x10(%ebp),%eax
c000998b:	8b 55 08             	mov    0x8(%ebp),%edx
c000998e:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009994:	8b 45 10             	mov    0x10(%ebp),%eax
c0009997:	8b 55 0c             	mov    0xc(%ebp),%edx
c000999a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c00099a0:	8b 45 10             	mov    0x10(%ebp),%eax
c00099a3:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c00099aa:	8b 45 10             	mov    0x10(%ebp),%eax
c00099ad:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00099b4:	3c 01                	cmp    $0x1,%al
c00099b6:	74 1c                	je     c00099d4 <sys_send_msg+0x31d>
c00099b8:	68 f0 05 00 00       	push   $0x5f0
c00099bd:	68 2f b8 00 c0       	push   $0xc000b82f
c00099c2:	68 2f b8 00 c0       	push   $0xc000b82f
c00099c7:	68 dc b8 00 c0       	push   $0xc000b8dc
c00099cc:	e8 a5 fc ff ff       	call   c0009676 <assertion_failure>
c00099d1:	83 c4 10             	add    $0x10,%esp
c00099d4:	8b 45 10             	mov    0x10(%ebp),%eax
c00099d7:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00099dd:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00099e0:	74 1c                	je     c00099fe <sys_send_msg+0x347>
c00099e2:	68 f1 05 00 00       	push   $0x5f1
c00099e7:	68 2f b8 00 c0       	push   $0xc000b82f
c00099ec:	68 2f b8 00 c0       	push   $0xc000b82f
c00099f1:	68 f8 b8 00 c0       	push   $0xc000b8f8
c00099f6:	e8 7b fc ff ff       	call   c0009676 <assertion_failure>
c00099fb:	83 c4 10             	add    $0x10,%esp
c00099fe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a01:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009a07:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009a0a:	74 1c                	je     c0009a28 <sys_send_msg+0x371>
c0009a0c:	68 f2 05 00 00       	push   $0x5f2
c0009a11:	68 2f b8 00 c0       	push   $0xc000b82f
c0009a16:	68 2f b8 00 c0       	push   $0xc000b82f
c0009a1b:	68 1a b9 00 c0       	push   $0xc000b91a
c0009a20:	e8 51 fc ff ff       	call   c0009676 <assertion_failure>
c0009a25:	83 c4 10             	add    $0x10,%esp
c0009a28:	83 ec 0c             	sub    $0xc,%esp
c0009a2b:	ff 75 10             	pushl  0x10(%ebp)
c0009a2e:	e8 af 05 00 00       	call   c0009fe2 <block>
c0009a33:	83 c4 10             	add    $0x10,%esp
c0009a36:	eb 01                	jmp    c0009a39 <sys_send_msg+0x382>
c0009a38:	90                   	nop
c0009a39:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a3e:	c9                   	leave  
c0009a3f:	c3                   	ret    

c0009a40 <sys_receive_msg>:
c0009a40:	55                   	push   %ebp
c0009a41:	89 e5                	mov    %esp,%ebp
c0009a43:	83 ec 48             	sub    $0x48,%esp
c0009a46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a4d:	83 ec 0c             	sub    $0xc,%esp
c0009a50:	ff 75 0c             	pushl  0xc(%ebp)
c0009a53:	e8 ab b3 ff ff       	call   c0004e03 <pid2proc>
c0009a58:	83 c4 10             	add    $0x10,%esp
c0009a5b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009a5e:	83 ec 0c             	sub    $0xc,%esp
c0009a61:	ff 75 10             	pushl  0x10(%ebp)
c0009a64:	e8 0c b4 ff ff       	call   c0004e75 <proc2pid>
c0009a69:	83 c4 10             	add    $0x10,%esp
c0009a6c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009a6f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009a76:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a79:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0009a7f:	85 c0                	test   %eax,%eax
c0009a81:	0f 84 b5 00 00 00    	je     c0009b3c <sys_receive_msg+0xfc>
c0009a87:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009a8b:	74 0d                	je     c0009a9a <sys_receive_msg+0x5a>
c0009a8d:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0009a94:	0f 85 a2 00 00 00    	jne    c0009b3c <sys_receive_msg+0xfc>
c0009a9a:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c0009aa1:	83 ec 0c             	sub    $0xc,%esp
c0009aa4:	ff 75 dc             	pushl  -0x24(%ebp)
c0009aa7:	e8 08 8f ff ff       	call   c00029b4 <sys_malloc>
c0009aac:	83 c4 10             	add    $0x10,%esp
c0009aaf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009ab2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009ab5:	83 ec 04             	sub    $0x4,%esp
c0009ab8:	50                   	push   %eax
c0009ab9:	6a 00                	push   $0x0
c0009abb:	ff 75 d8             	pushl  -0x28(%ebp)
c0009abe:	e8 dc 1f 00 00       	call   c000ba9f <Memset>
c0009ac3:	83 c4 10             	add    $0x10,%esp
c0009ac6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009ac9:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009acf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009ad2:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009ad9:	8b 45 08             	mov    0x8(%ebp),%eax
c0009adc:	83 ec 08             	sub    $0x8,%esp
c0009adf:	ff 75 dc             	pushl  -0x24(%ebp)
c0009ae2:	50                   	push   %eax
c0009ae3:	e8 05 d6 ff ff       	call   c00070ed <alloc_virtual_memory>
c0009ae8:	83 c4 10             	add    $0x10,%esp
c0009aeb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009aee:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009af1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009af4:	83 ec 04             	sub    $0x4,%esp
c0009af7:	52                   	push   %edx
c0009af8:	ff 75 d8             	pushl  -0x28(%ebp)
c0009afb:	50                   	push   %eax
c0009afc:	e8 9d e0 ff ff       	call   c0007b9e <Memcpy>
c0009b01:	83 c4 10             	add    $0x10,%esp
c0009b04:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b07:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009b0e:	00 00 00 
c0009b11:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b14:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009b1b:	00 00 00 
c0009b1e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b21:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009b28:	00 00 00 
c0009b2b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b2e:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009b35:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009b3c:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009b40:	0f 84 96 03 00 00    	je     c0009edc <sys_receive_msg+0x49c>
c0009b46:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009b4a:	75 26                	jne    c0009b72 <sys_receive_msg+0x132>
c0009b4c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b4f:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009b55:	85 c0                	test   %eax,%eax
c0009b57:	0f 84 8a 00 00 00    	je     c0009be7 <sys_receive_msg+0x1a7>
c0009b5d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b60:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009b66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b69:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009b70:	eb 75                	jmp    c0009be7 <sys_receive_msg+0x1a7>
c0009b72:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009b76:	78 6f                	js     c0009be7 <sys_receive_msg+0x1a7>
c0009b78:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0009b7c:	7f 69                	jg     c0009be7 <sys_receive_msg+0x1a7>
c0009b7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009b81:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009b88:	3c 01                	cmp    $0x1,%al
c0009b8a:	75 5b                	jne    c0009be7 <sys_receive_msg+0x1a7>
c0009b8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009b8f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009b95:	83 f8 12             	cmp    $0x12,%eax
c0009b98:	74 0e                	je     c0009ba8 <sys_receive_msg+0x168>
c0009b9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009b9d:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009ba3:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009ba6:	75 3f                	jne    c0009be7 <sys_receive_msg+0x1a7>
c0009ba8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bab:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009bb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009bb4:	eb 2b                	jmp    c0009be1 <sys_receive_msg+0x1a1>
c0009bb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bb9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009bbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bbf:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009bc5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009bc8:	39 c2                	cmp    %eax,%edx
c0009bca:	75 09                	jne    c0009bd5 <sys_receive_msg+0x195>
c0009bcc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009bd3:	eb 12                	jmp    c0009be7 <sys_receive_msg+0x1a7>
c0009bd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bd8:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009bde:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009be1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009be5:	75 cf                	jne    c0009bb6 <sys_receive_msg+0x176>
c0009be7:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009beb:	0f 85 21 02 00 00    	jne    c0009e12 <sys_receive_msg+0x3d2>
c0009bf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bf4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009bf7:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bfa:	83 ec 08             	sub    $0x8,%esp
c0009bfd:	6a 6c                	push   $0x6c
c0009bff:	50                   	push   %eax
c0009c00:	e8 e8 d4 ff ff       	call   c00070ed <alloc_virtual_memory>
c0009c05:	83 c4 10             	add    $0x10,%esp
c0009c08:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009c0b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009c0e:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009c14:	83 ec 08             	sub    $0x8,%esp
c0009c17:	6a 6c                	push   $0x6c
c0009c19:	50                   	push   %eax
c0009c1a:	e8 ce d4 ff ff       	call   c00070ed <alloc_virtual_memory>
c0009c1f:	83 c4 10             	add    $0x10,%esp
c0009c22:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009c25:	83 ec 04             	sub    $0x4,%esp
c0009c28:	6a 6c                	push   $0x6c
c0009c2a:	ff 75 c8             	pushl  -0x38(%ebp)
c0009c2d:	ff 75 cc             	pushl  -0x34(%ebp)
c0009c30:	e8 69 df ff ff       	call   c0007b9e <Memcpy>
c0009c35:	83 c4 10             	add    $0x10,%esp
c0009c38:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009c3b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009c3e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c41:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c47:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009c4a:	75 21                	jne    c0009c6d <sys_receive_msg+0x22d>
c0009c4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c4f:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009c55:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c58:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009c5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c61:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009c68:	00 00 00 
c0009c6b:	eb 1f                	jmp    c0009c8c <sys_receive_msg+0x24c>
c0009c6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c70:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009c76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009c79:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009c7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c82:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009c89:	00 00 00 
c0009c8c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009c8f:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009c96:	00 00 00 
c0009c99:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009c9c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009ca3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009ca6:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009cad:	00 00 00 
c0009cb0:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cb3:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009cba:	00 00 00 
c0009cbd:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cc0:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009cc7:	00 00 00 
c0009cca:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ccd:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009cd4:	00 00 00 
c0009cd7:	83 ec 0c             	sub    $0xc,%esp
c0009cda:	ff 75 d0             	pushl  -0x30(%ebp)
c0009cdd:	e8 3c 03 00 00       	call   c000a01e <unblock>
c0009ce2:	83 c4 10             	add    $0x10,%esp
c0009ce5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009ce8:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009cee:	85 c0                	test   %eax,%eax
c0009cf0:	74 1c                	je     c0009d0e <sys_receive_msg+0x2ce>
c0009cf2:	68 6d 06 00 00       	push   $0x66d
c0009cf7:	68 2f b8 00 c0       	push   $0xc000b82f
c0009cfc:	68 2f b8 00 c0       	push   $0xc000b82f
c0009d01:	68 2f b9 00 c0       	push   $0xc000b92f
c0009d06:	e8 6b f9 ff ff       	call   c0009676 <assertion_failure>
c0009d0b:	83 c4 10             	add    $0x10,%esp
c0009d0e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d11:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d18:	84 c0                	test   %al,%al
c0009d1a:	74 1c                	je     c0009d38 <sys_receive_msg+0x2f8>
c0009d1c:	68 6e 06 00 00       	push   $0x66e
c0009d21:	68 2f b8 00 c0       	push   $0xc000b82f
c0009d26:	68 2f b8 00 c0       	push   $0xc000b82f
c0009d2b:	68 47 b9 00 c0       	push   $0xc000b947
c0009d30:	e8 41 f9 ff ff       	call   c0009676 <assertion_failure>
c0009d35:	83 c4 10             	add    $0x10,%esp
c0009d38:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d3b:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d41:	83 f8 21             	cmp    $0x21,%eax
c0009d44:	74 1c                	je     c0009d62 <sys_receive_msg+0x322>
c0009d46:	68 6f 06 00 00       	push   $0x66f
c0009d4b:	68 2f b8 00 c0       	push   $0xc000b82f
c0009d50:	68 2f b8 00 c0       	push   $0xc000b82f
c0009d55:	68 60 b9 00 c0       	push   $0xc000b960
c0009d5a:	e8 17 f9 ff ff       	call   c0009676 <assertion_failure>
c0009d5f:	83 c4 10             	add    $0x10,%esp
c0009d62:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d65:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009d6b:	85 c0                	test   %eax,%eax
c0009d6d:	74 1c                	je     c0009d8b <sys_receive_msg+0x34b>
c0009d6f:	68 71 06 00 00       	push   $0x671
c0009d74:	68 2f b8 00 c0       	push   $0xc000b82f
c0009d79:	68 2f b8 00 c0       	push   $0xc000b82f
c0009d7e:	68 8b b8 00 c0       	push   $0xc000b88b
c0009d83:	e8 ee f8 ff ff       	call   c0009676 <assertion_failure>
c0009d88:	83 c4 10             	add    $0x10,%esp
c0009d8b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d8e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d95:	84 c0                	test   %al,%al
c0009d97:	74 1c                	je     c0009db5 <sys_receive_msg+0x375>
c0009d99:	68 72 06 00 00       	push   $0x672
c0009d9e:	68 2f b8 00 c0       	push   $0xc000b82f
c0009da3:	68 2f b8 00 c0       	push   $0xc000b82f
c0009da8:	68 a0 b8 00 c0       	push   $0xc000b8a0
c0009dad:	e8 c4 f8 ff ff       	call   c0009676 <assertion_failure>
c0009db2:	83 c4 10             	add    $0x10,%esp
c0009db5:	8b 45 10             	mov    0x10(%ebp),%eax
c0009db8:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009dbe:	83 f8 21             	cmp    $0x21,%eax
c0009dc1:	74 1c                	je     c0009ddf <sys_receive_msg+0x39f>
c0009dc3:	68 73 06 00 00       	push   $0x673
c0009dc8:	68 2f b8 00 c0       	push   $0xc000b82f
c0009dcd:	68 2f b8 00 c0       	push   $0xc000b82f
c0009dd2:	68 b8 b8 00 c0       	push   $0xc000b8b8
c0009dd7:	e8 9a f8 ff ff       	call   c0009676 <assertion_failure>
c0009ddc:	83 c4 10             	add    $0x10,%esp
c0009ddf:	8b 45 10             	mov    0x10(%ebp),%eax
c0009de2:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009de8:	83 f8 21             	cmp    $0x21,%eax
c0009deb:	0f 84 e4 00 00 00    	je     c0009ed5 <sys_receive_msg+0x495>
c0009df1:	68 74 06 00 00       	push   $0x674
c0009df6:	68 2f b8 00 c0       	push   $0xc000b82f
c0009dfb:	68 2f b8 00 c0       	push   $0xc000b82f
c0009e00:	68 84 b9 00 c0       	push   $0xc000b984
c0009e05:	e8 6c f8 ff ff       	call   c0009676 <assertion_failure>
c0009e0a:	83 c4 10             	add    $0x10,%esp
c0009e0d:	e9 c3 00 00 00       	jmp    c0009ed5 <sys_receive_msg+0x495>
c0009e12:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e15:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009e1c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e1f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e26:	3c 02                	cmp    $0x2,%al
c0009e28:	74 1c                	je     c0009e46 <sys_receive_msg+0x406>
c0009e2a:	68 79 06 00 00       	push   $0x679
c0009e2f:	68 2f b8 00 c0       	push   $0xc000b82f
c0009e34:	68 2f b8 00 c0       	push   $0xc000b82f
c0009e39:	68 a3 b9 00 c0       	push   $0xc000b9a3
c0009e3e:	e8 33 f8 ff ff       	call   c0009676 <assertion_failure>
c0009e43:	83 c4 10             	add    $0x10,%esp
c0009e46:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e49:	8b 55 08             	mov    0x8(%ebp),%edx
c0009e4c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009e52:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e55:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e5c:	3c 02                	cmp    $0x2,%al
c0009e5e:	74 1c                	je     c0009e7c <sys_receive_msg+0x43c>
c0009e60:	68 7b 06 00 00       	push   $0x67b
c0009e65:	68 2f b8 00 c0       	push   $0xc000b82f
c0009e6a:	68 2f b8 00 c0       	push   $0xc000b82f
c0009e6f:	68 a3 b9 00 c0       	push   $0xc000b9a3
c0009e74:	e8 fd f7 ff ff       	call   c0009676 <assertion_failure>
c0009e79:	83 c4 10             	add    $0x10,%esp
c0009e7c:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009e80:	75 0f                	jne    c0009e91 <sys_receive_msg+0x451>
c0009e82:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e85:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009e8c:	00 00 00 
c0009e8f:	eb 0c                	jmp    c0009e9d <sys_receive_msg+0x45d>
c0009e91:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e94:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009e97:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009e9d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ea0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ea7:	3c 02                	cmp    $0x2,%al
c0009ea9:	74 1c                	je     c0009ec7 <sys_receive_msg+0x487>
c0009eab:	68 86 06 00 00       	push   $0x686
c0009eb0:	68 2f b8 00 c0       	push   $0xc000b82f
c0009eb5:	68 2f b8 00 c0       	push   $0xc000b82f
c0009eba:	68 a3 b9 00 c0       	push   $0xc000b9a3
c0009ebf:	e8 b2 f7 ff ff       	call   c0009676 <assertion_failure>
c0009ec4:	83 c4 10             	add    $0x10,%esp
c0009ec7:	83 ec 0c             	sub    $0xc,%esp
c0009eca:	ff 75 10             	pushl  0x10(%ebp)
c0009ecd:	e8 10 01 00 00       	call   c0009fe2 <block>
c0009ed2:	83 c4 10             	add    $0x10,%esp
c0009ed5:	b8 00 00 00 00       	mov    $0x0,%eax
c0009eda:	eb 02                	jmp    c0009ede <sys_receive_msg+0x49e>
c0009edc:	90                   	nop
c0009edd:	90                   	nop
c0009ede:	c9                   	leave  
c0009edf:	c3                   	ret    

c0009ee0 <disp_str_colour_debug>:
c0009ee0:	55                   	push   %ebp
c0009ee1:	89 e5                	mov    %esp,%ebp
c0009ee3:	90                   	nop
c0009ee4:	5d                   	pop    %ebp
c0009ee5:	c3                   	ret    

c0009ee6 <send_rec>:
c0009ee6:	55                   	push   %ebp
c0009ee7:	89 e5                	mov    %esp,%ebp
c0009ee9:	83 ec 18             	sub    $0x18,%esp
c0009eec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009eef:	83 ec 0c             	sub    $0xc,%esp
c0009ef2:	50                   	push   %eax
c0009ef3:	e8 bc d2 ff ff       	call   c00071b4 <get_physical_address>
c0009ef8:	83 c4 10             	add    $0x10,%esp
c0009efb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009efe:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009f02:	74 28                	je     c0009f2c <send_rec+0x46>
c0009f04:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f08:	74 22                	je     c0009f2c <send_rec+0x46>
c0009f0a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009f0e:	74 1c                	je     c0009f2c <send_rec+0x46>
c0009f10:	68 a6 06 00 00       	push   $0x6a6
c0009f15:	68 2f b8 00 c0       	push   $0xc000b82f
c0009f1a:	68 2f b8 00 c0       	push   $0xc000b82f
c0009f1f:	68 c4 b9 00 c0       	push   $0xc000b9c4
c0009f24:	e8 4d f7 ff ff       	call   c0009676 <assertion_failure>
c0009f29:	83 c4 10             	add    $0x10,%esp
c0009f2c:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f30:	75 12                	jne    c0009f44 <send_rec+0x5e>
c0009f32:	83 ec 04             	sub    $0x4,%esp
c0009f35:	6a 6c                	push   $0x6c
c0009f37:	6a 00                	push   $0x0
c0009f39:	ff 75 0c             	pushl  0xc(%ebp)
c0009f3c:	e8 5e 1b 00 00       	call   c000ba9f <Memset>
c0009f41:	83 c4 10             	add    $0x10,%esp
c0009f44:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f48:	74 23                	je     c0009f6d <send_rec+0x87>
c0009f4a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009f4e:	74 34                	je     c0009f84 <send_rec+0x9e>
c0009f50:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009f54:	75 72                	jne    c0009fc8 <send_rec+0xe2>
c0009f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f59:	83 ec 08             	sub    $0x8,%esp
c0009f5c:	ff 75 10             	pushl  0x10(%ebp)
c0009f5f:	50                   	push   %eax
c0009f60:	e8 13 8a ff ff       	call   c0002978 <send_msg>
c0009f65:	83 c4 10             	add    $0x10,%esp
c0009f68:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f6b:	eb 6e                	jmp    c0009fdb <send_rec+0xf5>
c0009f6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f70:	83 ec 08             	sub    $0x8,%esp
c0009f73:	ff 75 10             	pushl  0x10(%ebp)
c0009f76:	50                   	push   %eax
c0009f77:	e8 22 8a ff ff       	call   c000299e <receive_msg>
c0009f7c:	83 c4 10             	add    $0x10,%esp
c0009f7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f82:	eb 57                	jmp    c0009fdb <send_rec+0xf5>
c0009f84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f87:	83 ec 08             	sub    $0x8,%esp
c0009f8a:	ff 75 10             	pushl  0x10(%ebp)
c0009f8d:	50                   	push   %eax
c0009f8e:	e8 e5 89 ff ff       	call   c0002978 <send_msg>
c0009f93:	83 c4 10             	add    $0x10,%esp
c0009f96:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f99:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009f9d:	75 3b                	jne    c0009fda <send_rec+0xf4>
c0009f9f:	83 ec 04             	sub    $0x4,%esp
c0009fa2:	6a 6c                	push   $0x6c
c0009fa4:	6a 00                	push   $0x0
c0009fa6:	ff 75 0c             	pushl  0xc(%ebp)
c0009fa9:	e8 f1 1a 00 00       	call   c000ba9f <Memset>
c0009fae:	83 c4 10             	add    $0x10,%esp
c0009fb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fb4:	83 ec 08             	sub    $0x8,%esp
c0009fb7:	ff 75 10             	pushl  0x10(%ebp)
c0009fba:	50                   	push   %eax
c0009fbb:	e8 de 89 ff ff       	call   c000299e <receive_msg>
c0009fc0:	83 c4 10             	add    $0x10,%esp
c0009fc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009fc6:	eb 12                	jmp    c0009fda <send_rec+0xf4>
c0009fc8:	83 ec 0c             	sub    $0xc,%esp
c0009fcb:	68 00 ba 00 c0       	push   $0xc000ba00
c0009fd0:	e8 83 f6 ff ff       	call   c0009658 <panic>
c0009fd5:	83 c4 10             	add    $0x10,%esp
c0009fd8:	eb 01                	jmp    c0009fdb <send_rec+0xf5>
c0009fda:	90                   	nop
c0009fdb:	b8 00 00 00 00       	mov    $0x0,%eax
c0009fe0:	c9                   	leave  
c0009fe1:	c3                   	ret    

c0009fe2 <block>:
c0009fe2:	55                   	push   %ebp
c0009fe3:	89 e5                	mov    %esp,%ebp
c0009fe5:	83 ec 08             	sub    $0x8,%esp
c0009fe8:	8b 45 08             	mov    0x8(%ebp),%eax
c0009feb:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ff2:	84 c0                	test   %al,%al
c0009ff4:	75 1c                	jne    c000a012 <block+0x30>
c0009ff6:	68 d5 06 00 00       	push   $0x6d5
c0009ffb:	68 2f b8 00 c0       	push   $0xc000b82f
c000a000:	68 2f b8 00 c0       	push   $0xc000b82f
c000a005:	68 15 ba 00 c0       	push   $0xc000ba15
c000a00a:	e8 67 f6 ff ff       	call   c0009676 <assertion_failure>
c000a00f:	83 c4 10             	add    $0x10,%esp
c000a012:	e8 c3 a9 ff ff       	call   c00049da <schedule_process>
c000a017:	b8 00 00 00 00       	mov    $0x0,%eax
c000a01c:	c9                   	leave  
c000a01d:	c3                   	ret    

c000a01e <unblock>:
c000a01e:	55                   	push   %ebp
c000a01f:	89 e5                	mov    %esp,%ebp
c000a021:	83 ec 08             	sub    $0x8,%esp
c000a024:	8b 45 08             	mov    0x8(%ebp),%eax
c000a027:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a02e:	84 c0                	test   %al,%al
c000a030:	74 1c                	je     c000a04e <unblock+0x30>
c000a032:	68 de 06 00 00       	push   $0x6de
c000a037:	68 2f b8 00 c0       	push   $0xc000b82f
c000a03c:	68 2f b8 00 c0       	push   $0xc000b82f
c000a041:	68 2d ba 00 c0       	push   $0xc000ba2d
c000a046:	e8 2b f6 ff ff       	call   c0009676 <assertion_failure>
c000a04b:	83 c4 10             	add    $0x10,%esp
c000a04e:	8b 45 08             	mov    0x8(%ebp),%eax
c000a051:	05 00 01 00 00       	add    $0x100,%eax
c000a056:	83 ec 08             	sub    $0x8,%esp
c000a059:	50                   	push   %eax
c000a05a:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a05f:	e8 1c 0a 00 00       	call   c000aa80 <appendToDoubleLinkList>
c000a064:	83 c4 10             	add    $0x10,%esp
c000a067:	b8 00 00 00 00       	mov    $0x0,%eax
c000a06c:	c9                   	leave  
c000a06d:	c3                   	ret    

c000a06e <get_ticks_ipc>:
c000a06e:	55                   	push   %ebp
c000a06f:	89 e5                	mov    %esp,%ebp
c000a071:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000a077:	83 ec 04             	sub    $0x4,%esp
c000a07a:	6a 6c                	push   $0x6c
c000a07c:	6a 00                	push   $0x0
c000a07e:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a081:	50                   	push   %eax
c000a082:	e8 18 1a 00 00       	call   c000ba9f <Memset>
c000a087:	83 c4 10             	add    $0x10,%esp
c000a08a:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000a091:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a098:	83 ec 04             	sub    $0x4,%esp
c000a09b:	6a 01                	push   $0x1
c000a09d:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a0a0:	50                   	push   %eax
c000a0a1:	6a 03                	push   $0x3
c000a0a3:	e8 3e fe ff ff       	call   c0009ee6 <send_rec>
c000a0a8:	83 c4 10             	add    $0x10,%esp
c000a0ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a0ae:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000a0b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0b7:	c9                   	leave  
c000a0b8:	c3                   	ret    

c000a0b9 <itoa>:
c000a0b9:	55                   	push   %ebp
c000a0ba:	89 e5                	mov    %esp,%ebp
c000a0bc:	53                   	push   %ebx
c000a0bd:	83 ec 14             	sub    $0x14,%esp
c000a0c0:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0c3:	99                   	cltd   
c000a0c4:	f7 7d 10             	idivl  0x10(%ebp)
c000a0c7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a0ca:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0cd:	99                   	cltd   
c000a0ce:	f7 7d 10             	idivl  0x10(%ebp)
c000a0d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a0d8:	74 14                	je     c000a0ee <itoa+0x35>
c000a0da:	83 ec 04             	sub    $0x4,%esp
c000a0dd:	ff 75 10             	pushl  0x10(%ebp)
c000a0e0:	ff 75 0c             	pushl  0xc(%ebp)
c000a0e3:	ff 75 f0             	pushl  -0x10(%ebp)
c000a0e6:	e8 ce ff ff ff       	call   c000a0b9 <itoa>
c000a0eb:	83 c4 10             	add    $0x10,%esp
c000a0ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0f1:	8d 58 30             	lea    0x30(%eax),%ebx
c000a0f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a0f7:	8b 00                	mov    (%eax),%eax
c000a0f9:	8d 48 01             	lea    0x1(%eax),%ecx
c000a0fc:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a0ff:	89 0a                	mov    %ecx,(%edx)
c000a101:	89 da                	mov    %ebx,%edx
c000a103:	88 10                	mov    %dl,(%eax)
c000a105:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a108:	8b 00                	mov    (%eax),%eax
c000a10a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a10d:	c9                   	leave  
c000a10e:	c3                   	ret    

c000a10f <i2a>:
c000a10f:	55                   	push   %ebp
c000a110:	89 e5                	mov    %esp,%ebp
c000a112:	53                   	push   %ebx
c000a113:	83 ec 14             	sub    $0x14,%esp
c000a116:	8b 45 08             	mov    0x8(%ebp),%eax
c000a119:	99                   	cltd   
c000a11a:	f7 7d 0c             	idivl  0xc(%ebp)
c000a11d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a120:	8b 45 08             	mov    0x8(%ebp),%eax
c000a123:	99                   	cltd   
c000a124:	f7 7d 0c             	idivl  0xc(%ebp)
c000a127:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a12a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a12e:	74 14                	je     c000a144 <i2a+0x35>
c000a130:	83 ec 04             	sub    $0x4,%esp
c000a133:	ff 75 10             	pushl  0x10(%ebp)
c000a136:	ff 75 0c             	pushl  0xc(%ebp)
c000a139:	ff 75 f0             	pushl  -0x10(%ebp)
c000a13c:	e8 ce ff ff ff       	call   c000a10f <i2a>
c000a141:	83 c4 10             	add    $0x10,%esp
c000a144:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a148:	7f 0a                	jg     c000a154 <i2a+0x45>
c000a14a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a14d:	83 c0 30             	add    $0x30,%eax
c000a150:	89 c3                	mov    %eax,%ebx
c000a152:	eb 08                	jmp    c000a15c <i2a+0x4d>
c000a154:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a157:	83 c0 37             	add    $0x37,%eax
c000a15a:	89 c3                	mov    %eax,%ebx
c000a15c:	8b 45 10             	mov    0x10(%ebp),%eax
c000a15f:	8b 00                	mov    (%eax),%eax
c000a161:	8d 48 01             	lea    0x1(%eax),%ecx
c000a164:	8b 55 10             	mov    0x10(%ebp),%edx
c000a167:	89 0a                	mov    %ecx,(%edx)
c000a169:	88 18                	mov    %bl,(%eax)
c000a16b:	8b 45 10             	mov    0x10(%ebp),%eax
c000a16e:	8b 00                	mov    (%eax),%eax
c000a170:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a173:	c9                   	leave  
c000a174:	c3                   	ret    

c000a175 <inform_int>:
c000a175:	55                   	push   %ebp
c000a176:	89 e5                	mov    %esp,%ebp
c000a178:	83 ec 18             	sub    $0x18,%esp
c000a17b:	83 ec 0c             	sub    $0xc,%esp
c000a17e:	ff 75 08             	pushl  0x8(%ebp)
c000a181:	e8 7d ac ff ff       	call   c0004e03 <pid2proc>
c000a186:	83 c4 10             	add    $0x10,%esp
c000a189:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a18c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a18f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a196:	0f be c0             	movsbl %al,%eax
c000a199:	83 e0 02             	and    $0x2,%eax
c000a19c:	85 c0                	test   %eax,%eax
c000a19e:	0f 84 8e 00 00 00    	je     c000a232 <inform_int+0xbd>
c000a1a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1a7:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a1ad:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a1b2:	74 0e                	je     c000a1c2 <inform_int+0x4d>
c000a1b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1b7:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a1bd:	83 f8 12             	cmp    $0x12,%eax
c000a1c0:	75 7d                	jne    c000a23f <inform_int+0xca>
c000a1c2:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c000a1c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1cc:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a1d2:	83 ec 08             	sub    $0x8,%esp
c000a1d5:	ff 75 f0             	pushl  -0x10(%ebp)
c000a1d8:	50                   	push   %eax
c000a1d9:	e8 0f cf ff ff       	call   c00070ed <alloc_virtual_memory>
c000a1de:	83 c4 10             	add    $0x10,%esp
c000a1e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a1e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a1e7:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a1ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a1f0:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a1f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1fa:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a201:	00 00 00 
c000a204:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a207:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a20e:	00 00 00 
c000a211:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a218:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a21b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a222:	83 ec 0c             	sub    $0xc,%esp
c000a225:	ff 75 f4             	pushl  -0xc(%ebp)
c000a228:	e8 f1 fd ff ff       	call   c000a01e <unblock>
c000a22d:	83 c4 10             	add    $0x10,%esp
c000a230:	eb 0d                	jmp    c000a23f <inform_int+0xca>
c000a232:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a235:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a23c:	00 00 00 
c000a23f:	90                   	nop
c000a240:	c9                   	leave  
c000a241:	c3                   	ret    

c000a242 <strcmp>:
c000a242:	55                   	push   %ebp
c000a243:	89 e5                	mov    %esp,%ebp
c000a245:	83 ec 10             	sub    $0x10,%esp
c000a248:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a24c:	74 06                	je     c000a254 <strcmp+0x12>
c000a24e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a252:	75 08                	jne    c000a25c <strcmp+0x1a>
c000a254:	8b 45 08             	mov    0x8(%ebp),%eax
c000a257:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a25a:	eb 53                	jmp    c000a2af <strcmp+0x6d>
c000a25c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a25f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a262:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a265:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a268:	eb 18                	jmp    c000a282 <strcmp+0x40>
c000a26a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a26d:	0f b6 10             	movzbl (%eax),%edx
c000a270:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a273:	0f b6 00             	movzbl (%eax),%eax
c000a276:	38 c2                	cmp    %al,%dl
c000a278:	75 1e                	jne    c000a298 <strcmp+0x56>
c000a27a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a27e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a282:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a285:	0f b6 00             	movzbl (%eax),%eax
c000a288:	84 c0                	test   %al,%al
c000a28a:	74 0d                	je     c000a299 <strcmp+0x57>
c000a28c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a28f:	0f b6 00             	movzbl (%eax),%eax
c000a292:	84 c0                	test   %al,%al
c000a294:	75 d4                	jne    c000a26a <strcmp+0x28>
c000a296:	eb 01                	jmp    c000a299 <strcmp+0x57>
c000a298:	90                   	nop
c000a299:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a29c:	0f b6 00             	movzbl (%eax),%eax
c000a29f:	0f be d0             	movsbl %al,%edx
c000a2a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a2a5:	0f b6 00             	movzbl (%eax),%eax
c000a2a8:	0f be c0             	movsbl %al,%eax
c000a2ab:	29 c2                	sub    %eax,%edx
c000a2ad:	89 d0                	mov    %edx,%eax
c000a2af:	c9                   	leave  
c000a2b0:	c3                   	ret    

c000a2b1 <create_user_process_address_space>:
c000a2b1:	55                   	push   %ebp
c000a2b2:	89 e5                	mov    %esp,%ebp
c000a2b4:	83 ec 18             	sub    $0x18,%esp
c000a2b7:	83 ec 08             	sub    $0x8,%esp
c000a2ba:	6a 00                	push   $0x0
c000a2bc:	6a 01                	push   $0x1
c000a2be:	e8 d9 cf ff ff       	call   c000729c <alloc_memory>
c000a2c3:	83 c4 10             	add    $0x10,%esp
c000a2c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a2c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2cc:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a2d3:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a2da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2dd:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a2e2:	c1 e8 0c             	shr    $0xc,%eax
c000a2e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a2e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2eb:	83 c0 07             	add    $0x7,%eax
c000a2ee:	c1 e8 03             	shr    $0x3,%eax
c000a2f1:	89 c2                	mov    %eax,%edx
c000a2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2f6:	89 50 04             	mov    %edx,0x4(%eax)
c000a2f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2fc:	8b 40 04             	mov    0x4(%eax),%eax
c000a2ff:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a304:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a30a:	85 c0                	test   %eax,%eax
c000a30c:	0f 48 c2             	cmovs  %edx,%eax
c000a30f:	c1 f8 0c             	sar    $0xc,%eax
c000a312:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a315:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a318:	83 ec 08             	sub    $0x8,%esp
c000a31b:	6a 00                	push   $0x0
c000a31d:	50                   	push   %eax
c000a31e:	e8 79 cf ff ff       	call   c000729c <alloc_memory>
c000a323:	83 c4 10             	add    $0x10,%esp
c000a326:	89 c2                	mov    %eax,%edx
c000a328:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a32b:	89 10                	mov    %edx,(%eax)
c000a32d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a330:	83 ec 0c             	sub    $0xc,%esp
c000a333:	50                   	push   %eax
c000a334:	e8 51 c9 ff ff       	call   c0006c8a <init_bitmap>
c000a339:	83 c4 10             	add    $0x10,%esp
c000a33c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a33f:	c9                   	leave  
c000a340:	c3                   	ret    

c000a341 <user_process>:
c000a341:	55                   	push   %ebp
c000a342:	89 e5                	mov    %esp,%ebp
c000a344:	83 ec 38             	sub    $0x38,%esp
c000a347:	c7 45 f4 b2 0c 00 00 	movl   $0xcb2,-0xc(%ebp)
c000a34e:	c7 45 f0 ba 0c 00 00 	movl   $0xcba,-0x10(%ebp)
c000a355:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c000a35c:	66 c7 45 ea 49 00    	movw   $0x49,-0x16(%ebp)
c000a362:	66 c7 45 e8 51 00    	movw   $0x51,-0x18(%ebp)
c000a368:	e8 3b 75 ff ff       	call   c00018a8 <get_running_thread_pcb>
c000a36d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a370:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a373:	05 00 10 00 00       	add    $0x1000,%eax
c000a378:	89 c2                	mov    %eax,%edx
c000a37a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a37d:	89 10                	mov    %edx,(%eax)
c000a37f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a382:	8b 00                	mov    (%eax),%eax
c000a384:	83 e8 44             	sub    $0x44,%eax
c000a387:	89 c2                	mov    %eax,%edx
c000a389:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a38c:	89 10                	mov    %edx,(%eax)
c000a38e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a391:	8b 00                	mov    (%eax),%eax
c000a393:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a396:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a39a:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a3a0:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a3a4:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a3a8:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a3ac:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a3b0:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a3b4:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a3b8:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a3be:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c000a3c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3c5:	89 50 34             	mov    %edx,0x34(%eax)
c000a3c8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3cf:	89 50 0c             	mov    %edx,0xc(%eax)
c000a3d2:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3d9:	89 50 04             	mov    %edx,0x4(%eax)
c000a3dc:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3e3:	89 50 08             	mov    %edx,0x8(%eax)
c000a3e6:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3ed:	89 50 40             	mov    %edx,0x40(%eax)
c000a3f0:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a3f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3f7:	89 10                	mov    %edx,(%eax)
c000a3f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3fc:	8b 55 08             	mov    0x8(%ebp),%edx
c000a3ff:	89 50 30             	mov    %edx,0x30(%eax)
c000a402:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a406:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a409:	89 50 38             	mov    %edx,0x38(%eax)
c000a40c:	83 ec 08             	sub    $0x8,%esp
c000a40f:	6a 01                	push   $0x1
c000a411:	68 00 f0 ff bf       	push   $0xbffff000
c000a416:	e8 cb cd ff ff       	call   c00071e6 <alloc_physical_memory>
c000a41b:	83 c4 10             	add    $0x10,%esp
c000a41e:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a424:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a427:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a42a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a42d:	83 ec 0c             	sub    $0xc,%esp
c000a430:	50                   	push   %eax
c000a431:	e8 45 73 ff ff       	call   c000177b <restart>
c000a436:	83 c4 10             	add    $0x10,%esp
c000a439:	90                   	nop
c000a43a:	c9                   	leave  
c000a43b:	c3                   	ret    

c000a43c <clone_pcb>:
c000a43c:	55                   	push   %ebp
c000a43d:	89 e5                	mov    %esp,%ebp
c000a43f:	83 ec 18             	sub    $0x18,%esp
c000a442:	83 ec 08             	sub    $0x8,%esp
c000a445:	6a 00                	push   $0x0
c000a447:	6a 01                	push   $0x1
c000a449:	e8 4e ce ff ff       	call   c000729c <alloc_memory>
c000a44e:	83 c4 10             	add    $0x10,%esp
c000a451:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a454:	83 ec 04             	sub    $0x4,%esp
c000a457:	68 00 10 00 00       	push   $0x1000
c000a45c:	6a 00                	push   $0x0
c000a45e:	ff 75 f4             	pushl  -0xc(%ebp)
c000a461:	e8 39 16 00 00       	call   c000ba9f <Memset>
c000a466:	83 c4 10             	add    $0x10,%esp
c000a469:	83 ec 04             	sub    $0x4,%esp
c000a46c:	68 00 10 00 00       	push   $0x1000
c000a471:	ff 75 08             	pushl  0x8(%ebp)
c000a474:	ff 75 f4             	pushl  -0xc(%ebp)
c000a477:	e8 22 d7 ff ff       	call   c0007b9e <Memcpy>
c000a47c:	83 c4 10             	add    $0x10,%esp
c000a47f:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000a484:	83 c0 01             	add    $0x1,%eax
c000a487:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000a48c:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000a492:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a495:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a49b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a49e:	8b 90 64 02 00 00    	mov    0x264(%eax),%edx
c000a4a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4a7:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a4ad:	83 ec 08             	sub    $0x8,%esp
c000a4b0:	6a 00                	push   $0x0
c000a4b2:	6a 01                	push   $0x1
c000a4b4:	e8 e3 cd ff ff       	call   c000729c <alloc_memory>
c000a4b9:	83 c4 10             	add    $0x10,%esp
c000a4bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a4bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a4c2:	05 00 0c 00 00       	add    $0xc00,%eax
c000a4c7:	83 ec 04             	sub    $0x4,%esp
c000a4ca:	68 00 04 00 00       	push   $0x400
c000a4cf:	68 00 fc ff ff       	push   $0xfffffc00
c000a4d4:	50                   	push   %eax
c000a4d5:	e8 c4 d6 ff ff       	call   c0007b9e <Memcpy>
c000a4da:	83 c4 10             	add    $0x10,%esp
c000a4dd:	83 ec 0c             	sub    $0xc,%esp
c000a4e0:	ff 75 f0             	pushl  -0x10(%ebp)
c000a4e3:	e8 cc cc ff ff       	call   c00071b4 <get_physical_address>
c000a4e8:	83 c4 10             	add    $0x10,%esp
c000a4eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a4ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a4f1:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a4f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a4f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a4fc:	83 c8 07             	or     $0x7,%eax
c000a4ff:	89 c2                	mov    %eax,%edx
c000a501:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a504:	89 10                	mov    %edx,(%eax)
c000a506:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a509:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a50c:	89 50 08             	mov    %edx,0x8(%eax)
c000a50f:	e8 9d fd ff ff       	call   c000a2b1 <create_user_process_address_space>
c000a514:	89 c2                	mov    %eax,%edx
c000a516:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a519:	89 50 0c             	mov    %edx,0xc(%eax)
c000a51c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a51f:	8b 40 0c             	mov    0xc(%eax),%eax
c000a522:	89 c2                	mov    %eax,%edx
c000a524:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a527:	8b 40 0c             	mov    0xc(%eax),%eax
c000a52a:	83 ec 04             	sub    $0x4,%esp
c000a52d:	6a 0c                	push   $0xc
c000a52f:	52                   	push   %edx
c000a530:	50                   	push   %eax
c000a531:	e8 68 d6 ff ff       	call   c0007b9e <Memcpy>
c000a536:	83 c4 10             	add    $0x10,%esp
c000a539:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a53c:	c9                   	leave  
c000a53d:	c3                   	ret    

c000a53e <build_body_stack>:
c000a53e:	55                   	push   %ebp
c000a53f:	89 e5                	mov    %esp,%ebp
c000a541:	83 ec 48             	sub    $0x48,%esp
c000a544:	8b 45 08             	mov    0x8(%ebp),%eax
c000a547:	8b 40 0c             	mov    0xc(%eax),%eax
c000a54a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a54d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a550:	8b 50 04             	mov    0x4(%eax),%edx
c000a553:	8b 00                	mov    (%eax),%eax
c000a555:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a558:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000a55b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000a55e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a561:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a564:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a567:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a56a:	8b 40 08             	mov    0x8(%eax),%eax
c000a56d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a570:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a577:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a57e:	e8 b7 d5 ff ff       	call   c0007b3a <intr_disable>
c000a583:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a586:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a58d:	e9 c2 00 00 00       	jmp    c000a654 <build_body_stack+0x116>
c000a592:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a595:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a598:	01 d0                	add    %edx,%eax
c000a59a:	0f b6 00             	movzbl (%eax),%eax
c000a59d:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000a5a0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a5a7:	e9 9a 00 00 00       	jmp    c000a646 <build_body_stack+0x108>
c000a5ac:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000a5b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a5b3:	89 c1                	mov    %eax,%ecx
c000a5b5:	d3 fa                	sar    %cl,%edx
c000a5b7:	89 d0                	mov    %edx,%eax
c000a5b9:	83 e0 01             	and    $0x1,%eax
c000a5bc:	85 c0                	test   %eax,%eax
c000a5be:	75 06                	jne    c000a5c6 <build_body_stack+0x88>
c000a5c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a5c4:	eb 7c                	jmp    c000a642 <build_body_stack+0x104>
c000a5c6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5c9:	8b 40 08             	mov    0x8(%eax),%eax
c000a5cc:	83 ec 0c             	sub    $0xc,%esp
c000a5cf:	50                   	push   %eax
c000a5d0:	e8 b5 72 ff ff       	call   c000188a <update_cr3>
c000a5d5:	83 c4 10             	add    $0x10,%esp
c000a5d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5db:	c1 e0 0c             	shl    $0xc,%eax
c000a5de:	89 c2                	mov    %eax,%edx
c000a5e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a5e3:	01 d0                	add    %edx,%eax
c000a5e5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a5e8:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000a5eb:	8b 45 10             	mov    0x10(%ebp),%eax
c000a5ee:	83 ec 04             	sub    $0x4,%esp
c000a5f1:	68 00 10 00 00       	push   $0x1000
c000a5f6:	52                   	push   %edx
c000a5f7:	50                   	push   %eax
c000a5f8:	e8 a1 d5 ff ff       	call   c0007b9e <Memcpy>
c000a5fd:	83 c4 10             	add    $0x10,%esp
c000a600:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a603:	8b 40 08             	mov    0x8(%eax),%eax
c000a606:	83 ec 0c             	sub    $0xc,%esp
c000a609:	50                   	push   %eax
c000a60a:	e8 7b 72 ff ff       	call   c000188a <update_cr3>
c000a60f:	83 c4 10             	add    $0x10,%esp
c000a612:	83 ec 08             	sub    $0x8,%esp
c000a615:	ff 75 cc             	pushl  -0x34(%ebp)
c000a618:	6a 01                	push   $0x1
c000a61a:	e8 df cc ff ff       	call   c00072fe <get_a_virtual_page>
c000a61f:	83 c4 10             	add    $0x10,%esp
c000a622:	8b 55 10             	mov    0x10(%ebp),%edx
c000a625:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a628:	83 ec 04             	sub    $0x4,%esp
c000a62b:	68 00 10 00 00       	push   $0x1000
c000a630:	52                   	push   %edx
c000a631:	50                   	push   %eax
c000a632:	e8 67 d5 ff ff       	call   c0007b9e <Memcpy>
c000a637:	83 c4 10             	add    $0x10,%esp
c000a63a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a63e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a642:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a646:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a64a:	0f 8e 5c ff ff ff    	jle    c000a5ac <build_body_stack+0x6e>
c000a650:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a654:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a657:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a65a:	0f 87 32 ff ff ff    	ja     c000a592 <build_body_stack+0x54>
c000a660:	83 ec 0c             	sub    $0xc,%esp
c000a663:	ff 75 d4             	pushl  -0x2c(%ebp)
c000a666:	e8 f8 d4 ff ff       	call   c0007b63 <intr_set_status>
c000a66b:	83 c4 10             	add    $0x10,%esp
c000a66e:	90                   	nop
c000a66f:	c9                   	leave  
c000a670:	c3                   	ret    

c000a671 <build_process_kernel_stack>:
c000a671:	55                   	push   %ebp
c000a672:	89 e5                	mov    %esp,%ebp
c000a674:	83 ec 28             	sub    $0x28,%esp
c000a677:	e8 be d4 ff ff       	call   c0007b3a <intr_disable>
c000a67c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a67f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a682:	05 00 10 00 00       	add    $0x1000,%eax
c000a687:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a68a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a68d:	8b 00                	mov    (%eax),%eax
c000a68f:	83 f8 38             	cmp    $0x38,%eax
c000a692:	74 06                	je     c000a69a <build_process_kernel_stack+0x29>
c000a694:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000a698:	eb f0                	jmp    c000a68a <build_process_kernel_stack+0x19>
c000a69a:	90                   	nop
c000a69b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a69e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a6a1:	89 50 04             	mov    %edx,0x4(%eax)
c000a6a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6a7:	83 c0 2c             	add    $0x2c,%eax
c000a6aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a6ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b0:	83 e8 04             	sub    $0x4,%eax
c000a6b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a6b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b9:	83 e8 08             	sub    $0x8,%eax
c000a6bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a6bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6c2:	83 e8 0c             	sub    $0xc,%eax
c000a6c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6cb:	83 e8 10             	sub    $0x10,%eax
c000a6ce:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a6d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6d4:	83 e8 14             	sub    $0x14,%eax
c000a6d7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a6da:	ba 5c 17 00 c0       	mov    $0xc000175c,%edx
c000a6df:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a6e2:	89 10                	mov    %edx,(%eax)
c000a6e4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a6e7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a6ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a6f0:	8b 10                	mov    (%eax),%edx
c000a6f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a6f5:	89 10                	mov    %edx,(%eax)
c000a6f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a6fa:	8b 10                	mov    (%eax),%edx
c000a6fc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a6ff:	89 10                	mov    %edx,(%eax)
c000a701:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a704:	8b 10                	mov    (%eax),%edx
c000a706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a709:	89 10                	mov    %edx,(%eax)
c000a70b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a70e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a714:	8b 45 08             	mov    0x8(%ebp),%eax
c000a717:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000a71a:	89 10                	mov    %edx,(%eax)
c000a71c:	83 ec 0c             	sub    $0xc,%esp
c000a71f:	ff 75 f0             	pushl  -0x10(%ebp)
c000a722:	e8 3c d4 ff ff       	call   c0007b63 <intr_set_status>
c000a727:	83 c4 10             	add    $0x10,%esp
c000a72a:	90                   	nop
c000a72b:	c9                   	leave  
c000a72c:	c3                   	ret    

c000a72d <fork_process>:
c000a72d:	55                   	push   %ebp
c000a72e:	89 e5                	mov    %esp,%ebp
c000a730:	83 ec 18             	sub    $0x18,%esp
c000a733:	8b 45 08             	mov    0x8(%ebp),%eax
c000a736:	83 ec 0c             	sub    $0xc,%esp
c000a739:	50                   	push   %eax
c000a73a:	e8 c4 a6 ff ff       	call   c0004e03 <pid2proc>
c000a73f:	83 c4 10             	add    $0x10,%esp
c000a742:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a745:	83 ec 0c             	sub    $0xc,%esp
c000a748:	ff 75 f4             	pushl  -0xc(%ebp)
c000a74b:	e8 ec fc ff ff       	call   c000a43c <clone_pcb>
c000a750:	83 c4 10             	add    $0x10,%esp
c000a753:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a756:	83 ec 08             	sub    $0x8,%esp
c000a759:	6a 00                	push   $0x0
c000a75b:	6a 01                	push   $0x1
c000a75d:	e8 3a cb ff ff       	call   c000729c <alloc_memory>
c000a762:	83 c4 10             	add    $0x10,%esp
c000a765:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a768:	83 ec 04             	sub    $0x4,%esp
c000a76b:	ff 75 ec             	pushl  -0x14(%ebp)
c000a76e:	ff 75 f0             	pushl  -0x10(%ebp)
c000a771:	ff 75 f4             	pushl  -0xc(%ebp)
c000a774:	e8 c5 fd ff ff       	call   c000a53e <build_body_stack>
c000a779:	83 c4 10             	add    $0x10,%esp
c000a77c:	83 ec 0c             	sub    $0xc,%esp
c000a77f:	ff 75 f0             	pushl  -0x10(%ebp)
c000a782:	e8 ea fe ff ff       	call   c000a671 <build_process_kernel_stack>
c000a787:	83 c4 10             	add    $0x10,%esp
c000a78a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a78d:	05 00 01 00 00       	add    $0x100,%eax
c000a792:	83 ec 04             	sub    $0x4,%esp
c000a795:	6a 08                	push   $0x8
c000a797:	6a 00                	push   $0x0
c000a799:	50                   	push   %eax
c000a79a:	e8 00 13 00 00       	call   c000ba9f <Memset>
c000a79f:	83 c4 10             	add    $0x10,%esp
c000a7a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7a5:	05 08 01 00 00       	add    $0x108,%eax
c000a7aa:	83 ec 04             	sub    $0x4,%esp
c000a7ad:	6a 08                	push   $0x8
c000a7af:	6a 00                	push   $0x0
c000a7b1:	50                   	push   %eax
c000a7b2:	e8 e8 12 00 00       	call   c000ba9f <Memset>
c000a7b7:	83 c4 10             	add    $0x10,%esp
c000a7ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7bd:	05 08 01 00 00       	add    $0x108,%eax
c000a7c2:	83 ec 08             	sub    $0x8,%esp
c000a7c5:	50                   	push   %eax
c000a7c6:	68 04 1f 01 c0       	push   $0xc0011f04
c000a7cb:	e8 b0 02 00 00       	call   c000aa80 <appendToDoubleLinkList>
c000a7d0:	83 c4 10             	add    $0x10,%esp
c000a7d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7d6:	c9                   	leave  
c000a7d7:	c3                   	ret    

c000a7d8 <process_execute>:
c000a7d8:	55                   	push   %ebp
c000a7d9:	89 e5                	mov    %esp,%ebp
c000a7db:	83 ec 28             	sub    $0x28,%esp
c000a7de:	e8 b3 04 00 00       	call   c000ac96 <thread_init>
c000a7e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a7e6:	83 ec 0c             	sub    $0xc,%esp
c000a7e9:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7ec:	e8 38 05 00 00       	call   c000ad29 <thread_create>
c000a7f1:	83 c4 10             	add    $0x10,%esp
c000a7f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7f7:	05 34 01 00 00       	add    $0x134,%eax
c000a7fc:	83 ec 08             	sub    $0x8,%esp
c000a7ff:	ff 75 10             	pushl  0x10(%ebp)
c000a802:	50                   	push   %eax
c000a803:	e8 b6 12 00 00       	call   c000babe <Strcpy>
c000a808:	83 c4 10             	add    $0x10,%esp
c000a80b:	83 ec 08             	sub    $0x8,%esp
c000a80e:	6a 00                	push   $0x0
c000a810:	6a 01                	push   $0x1
c000a812:	e8 85 ca ff ff       	call   c000729c <alloc_memory>
c000a817:	83 c4 10             	add    $0x10,%esp
c000a81a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a81d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a820:	05 00 0c 00 00       	add    $0xc00,%eax
c000a825:	83 ec 04             	sub    $0x4,%esp
c000a828:	68 00 04 00 00       	push   $0x400
c000a82d:	68 00 fc ff ff       	push   $0xfffffc00
c000a832:	50                   	push   %eax
c000a833:	e8 66 d3 ff ff       	call   c0007b9e <Memcpy>
c000a838:	83 c4 10             	add    $0x10,%esp
c000a83b:	83 ec 0c             	sub    $0xc,%esp
c000a83e:	ff 75 f0             	pushl  -0x10(%ebp)
c000a841:	e8 6e c9 ff ff       	call   c00071b4 <get_physical_address>
c000a846:	83 c4 10             	add    $0x10,%esp
c000a849:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a84c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a84f:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a854:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a857:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a85a:	83 c8 07             	or     $0x7,%eax
c000a85d:	89 c2                	mov    %eax,%edx
c000a85f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a862:	89 10                	mov    %edx,(%eax)
c000a864:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a867:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a86a:	89 50 08             	mov    %edx,0x8(%eax)
c000a86d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a870:	83 c0 10             	add    $0x10,%eax
c000a873:	83 ec 0c             	sub    $0xc,%esp
c000a876:	50                   	push   %eax
c000a877:	e8 04 ce ff ff       	call   c0007680 <init_memory_block_desc>
c000a87c:	83 c4 10             	add    $0x10,%esp
c000a87f:	e8 2d fa ff ff       	call   c000a2b1 <create_user_process_address_space>
c000a884:	89 c2                	mov    %eax,%edx
c000a886:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a889:	89 50 0c             	mov    %edx,0xc(%eax)
c000a88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a88f:	8b 00                	mov    (%eax),%eax
c000a891:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a894:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a897:	c7 40 10 41 a3 00 c0 	movl   $0xc000a341,0x10(%eax)
c000a89e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8a1:	8b 55 08             	mov    0x8(%ebp),%edx
c000a8a4:	89 50 18             	mov    %edx,0x18(%eax)
c000a8a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8aa:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a8ad:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a8b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a8b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8b6:	89 50 20             	mov    %edx,0x20(%eax)
c000a8b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8bc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a8c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8c5:	8b 10                	mov    (%eax),%edx
c000a8c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8ca:	89 50 04             	mov    %edx,0x4(%eax)
c000a8cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8d0:	8b 50 04             	mov    0x4(%eax),%edx
c000a8d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8d6:	89 50 08             	mov    %edx,0x8(%eax)
c000a8d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8dc:	8b 50 08             	mov    0x8(%eax),%edx
c000a8df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8e2:	89 50 0c             	mov    %edx,0xc(%eax)
c000a8e5:	83 ec 0c             	sub    $0xc,%esp
c000a8e8:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a8ed:	e8 91 00 00 00       	call   c000a983 <isListEmpty>
c000a8f2:	83 c4 10             	add    $0x10,%esp
c000a8f5:	e8 40 d2 ff ff       	call   c0007b3a <intr_disable>
c000a8fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a8fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a900:	05 00 01 00 00       	add    $0x100,%eax
c000a905:	83 ec 08             	sub    $0x8,%esp
c000a908:	50                   	push   %eax
c000a909:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a90e:	e8 6d 01 00 00       	call   c000aa80 <appendToDoubleLinkList>
c000a913:	83 c4 10             	add    $0x10,%esp
c000a916:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a919:	05 08 01 00 00       	add    $0x108,%eax
c000a91e:	83 ec 08             	sub    $0x8,%esp
c000a921:	50                   	push   %eax
c000a922:	68 04 1f 01 c0       	push   $0xc0011f04
c000a927:	e8 54 01 00 00       	call   c000aa80 <appendToDoubleLinkList>
c000a92c:	83 c4 10             	add    $0x10,%esp
c000a92f:	83 ec 0c             	sub    $0xc,%esp
c000a932:	ff 75 e0             	pushl  -0x20(%ebp)
c000a935:	e8 29 d2 ff ff       	call   c0007b63 <intr_set_status>
c000a93a:	83 c4 10             	add    $0x10,%esp
c000a93d:	90                   	nop
c000a93e:	c9                   	leave  
c000a93f:	c3                   	ret    

c000a940 <switch_to>:
c000a940:	56                   	push   %esi
c000a941:	57                   	push   %edi
c000a942:	53                   	push   %ebx
c000a943:	55                   	push   %ebp
c000a944:	89 e5                	mov    %esp,%ebp
c000a946:	8b 45 14             	mov    0x14(%ebp),%eax
c000a949:	89 20                	mov    %esp,(%eax)
c000a94b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a94e:	8b 20                	mov    (%eax),%esp
c000a950:	5d                   	pop    %ebp
c000a951:	5b                   	pop    %ebx
c000a952:	5f                   	pop    %edi
c000a953:	5e                   	pop    %esi
c000a954:	c3                   	ret    

c000a955 <initDoubleLinkList>:
c000a955:	55                   	push   %ebp
c000a956:	89 e5                	mov    %esp,%ebp
c000a958:	8b 45 08             	mov    0x8(%ebp),%eax
c000a95b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a961:	8b 45 08             	mov    0x8(%ebp),%eax
c000a964:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a96b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a96e:	8d 50 08             	lea    0x8(%eax),%edx
c000a971:	8b 45 08             	mov    0x8(%ebp),%eax
c000a974:	89 50 04             	mov    %edx,0x4(%eax)
c000a977:	8b 55 08             	mov    0x8(%ebp),%edx
c000a97a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a97d:	89 50 08             	mov    %edx,0x8(%eax)
c000a980:	90                   	nop
c000a981:	5d                   	pop    %ebp
c000a982:	c3                   	ret    

c000a983 <isListEmpty>:
c000a983:	55                   	push   %ebp
c000a984:	89 e5                	mov    %esp,%ebp
c000a986:	8b 45 08             	mov    0x8(%ebp),%eax
c000a989:	8b 40 04             	mov    0x4(%eax),%eax
c000a98c:	8b 55 08             	mov    0x8(%ebp),%edx
c000a98f:	83 c2 08             	add    $0x8,%edx
c000a992:	39 d0                	cmp    %edx,%eax
c000a994:	75 07                	jne    c000a99d <isListEmpty+0x1a>
c000a996:	b8 01 00 00 00       	mov    $0x1,%eax
c000a99b:	eb 05                	jmp    c000a9a2 <isListEmpty+0x1f>
c000a99d:	b8 00 00 00 00       	mov    $0x0,%eax
c000a9a2:	5d                   	pop    %ebp
c000a9a3:	c3                   	ret    

c000a9a4 <findElementInList>:
c000a9a4:	55                   	push   %ebp
c000a9a5:	89 e5                	mov    %esp,%ebp
c000a9a7:	83 ec 28             	sub    $0x28,%esp
c000a9aa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a9ae:	75 19                	jne    c000a9c9 <findElementInList+0x25>
c000a9b0:	6a 60                	push   $0x60
c000a9b2:	68 45 ba 00 c0       	push   $0xc000ba45
c000a9b7:	68 45 ba 00 c0       	push   $0xc000ba45
c000a9bc:	68 58 ba 00 c0       	push   $0xc000ba58
c000a9c1:	e8 b0 ec ff ff       	call   c0009676 <assertion_failure>
c000a9c6:	83 c4 10             	add    $0x10,%esp
c000a9c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a9cd:	75 19                	jne    c000a9e8 <findElementInList+0x44>
c000a9cf:	6a 61                	push   $0x61
c000a9d1:	68 45 ba 00 c0       	push   $0xc000ba45
c000a9d6:	68 45 ba 00 c0       	push   $0xc000ba45
c000a9db:	68 64 ba 00 c0       	push   $0xc000ba64
c000a9e0:	e8 91 ec ff ff       	call   c0009676 <assertion_failure>
c000a9e5:	83 c4 10             	add    $0x10,%esp
c000a9e8:	e8 4d d1 ff ff       	call   c0007b3a <intr_disable>
c000a9ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a9f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a9f7:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9fa:	8b 40 08             	mov    0x8(%eax),%eax
c000a9fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aa00:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa03:	8b 40 04             	mov    0x4(%eax),%eax
c000aa06:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa09:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa0d:	75 07                	jne    c000aa16 <findElementInList+0x72>
c000aa0f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa14:	eb 68                	jmp    c000aa7e <findElementInList+0xda>
c000aa16:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aa19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aa1f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000aa22:	c1 f8 03             	sar    $0x3,%eax
c000aa25:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aa28:	eb 36                	jmp    c000aa60 <findElementInList+0xbc>
c000aa2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa2d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000aa30:	75 07                	jne    c000aa39 <findElementInList+0x95>
c000aa32:	b8 01 00 00 00       	mov    $0x1,%eax
c000aa37:	eb 45                	jmp    c000aa7e <findElementInList+0xda>
c000aa39:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa3d:	75 07                	jne    c000aa46 <findElementInList+0xa2>
c000aa3f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa44:	eb 38                	jmp    c000aa7e <findElementInList+0xda>
c000aa46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aa49:	8b 40 04             	mov    0x4(%eax),%eax
c000aa4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa4f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa53:	75 07                	jne    c000aa5c <findElementInList+0xb8>
c000aa55:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa5a:	eb 22                	jmp    c000aa7e <findElementInList+0xda>
c000aa5c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000aa60:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa63:	83 c0 08             	add    $0x8,%eax
c000aa66:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000aa69:	75 bf                	jne    c000aa2a <findElementInList+0x86>
c000aa6b:	83 ec 0c             	sub    $0xc,%esp
c000aa6e:	ff 75 ec             	pushl  -0x14(%ebp)
c000aa71:	e8 ed d0 ff ff       	call   c0007b63 <intr_set_status>
c000aa76:	83 c4 10             	add    $0x10,%esp
c000aa79:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa7e:	c9                   	leave  
c000aa7f:	c3                   	ret    

c000aa80 <appendToDoubleLinkList>:
c000aa80:	55                   	push   %ebp
c000aa81:	89 e5                	mov    %esp,%ebp
c000aa83:	83 ec 18             	sub    $0x18,%esp
c000aa86:	83 ec 08             	sub    $0x8,%esp
c000aa89:	ff 75 0c             	pushl  0xc(%ebp)
c000aa8c:	ff 75 08             	pushl  0x8(%ebp)
c000aa8f:	e8 10 ff ff ff       	call   c000a9a4 <findElementInList>
c000aa94:	83 c4 10             	add    $0x10,%esp
c000aa97:	3c 01                	cmp    $0x1,%al
c000aa99:	0f 84 c2 00 00 00    	je     c000ab61 <appendToDoubleLinkList+0xe1>
c000aa9f:	e8 96 d0 ff ff       	call   c0007b3a <intr_disable>
c000aaa4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000aaa7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000aaab:	75 1c                	jne    c000aac9 <appendToDoubleLinkList+0x49>
c000aaad:	68 9e 00 00 00       	push   $0x9e
c000aab2:	68 45 ba 00 c0       	push   $0xc000ba45
c000aab7:	68 45 ba 00 c0       	push   $0xc000ba45
c000aabc:	68 58 ba 00 c0       	push   $0xc000ba58
c000aac1:	e8 b0 eb ff ff       	call   c0009676 <assertion_failure>
c000aac6:	83 c4 10             	add    $0x10,%esp
c000aac9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000aacd:	75 1c                	jne    c000aaeb <appendToDoubleLinkList+0x6b>
c000aacf:	68 9f 00 00 00       	push   $0x9f
c000aad4:	68 45 ba 00 c0       	push   $0xc000ba45
c000aad9:	68 45 ba 00 c0       	push   $0xc000ba45
c000aade:	68 64 ba 00 c0       	push   $0xc000ba64
c000aae3:	e8 8e eb ff ff       	call   c0009676 <assertion_failure>
c000aae8:	83 c4 10             	add    $0x10,%esp
c000aaeb:	83 ec 08             	sub    $0x8,%esp
c000aaee:	ff 75 0c             	pushl  0xc(%ebp)
c000aaf1:	ff 75 08             	pushl  0x8(%ebp)
c000aaf4:	e8 ab fe ff ff       	call   c000a9a4 <findElementInList>
c000aaf9:	83 c4 10             	add    $0x10,%esp
c000aafc:	3c 01                	cmp    $0x1,%al
c000aafe:	74 64                	je     c000ab64 <appendToDoubleLinkList+0xe4>
c000ab00:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ab03:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ab06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab09:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ab10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab13:	8b 50 04             	mov    0x4(%eax),%edx
c000ab16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab19:	89 10                	mov    %edx,(%eax)
c000ab1b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab1e:	8b 50 08             	mov    0x8(%eax),%edx
c000ab21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab24:	89 10                	mov    %edx,(%eax)
c000ab26:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab29:	8b 40 08             	mov    0x8(%eax),%eax
c000ab2c:	85 c0                	test   %eax,%eax
c000ab2e:	74 0c                	je     c000ab3c <appendToDoubleLinkList+0xbc>
c000ab30:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab33:	8b 40 08             	mov    0x8(%eax),%eax
c000ab36:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ab39:	89 50 04             	mov    %edx,0x4(%eax)
c000ab3c:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab3f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ab42:	89 50 08             	mov    %edx,0x8(%eax)
c000ab45:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab48:	8d 50 08             	lea    0x8(%eax),%edx
c000ab4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab4e:	89 50 04             	mov    %edx,0x4(%eax)
c000ab51:	83 ec 0c             	sub    $0xc,%esp
c000ab54:	ff 75 f4             	pushl  -0xc(%ebp)
c000ab57:	e8 07 d0 ff ff       	call   c0007b63 <intr_set_status>
c000ab5c:	83 c4 10             	add    $0x10,%esp
c000ab5f:	eb 04                	jmp    c000ab65 <appendToDoubleLinkList+0xe5>
c000ab61:	90                   	nop
c000ab62:	eb 01                	jmp    c000ab65 <appendToDoubleLinkList+0xe5>
c000ab64:	90                   	nop
c000ab65:	c9                   	leave  
c000ab66:	c3                   	ret    

c000ab67 <insertToDoubleLinkList>:
c000ab67:	55                   	push   %ebp
c000ab68:	89 e5                	mov    %esp,%ebp
c000ab6a:	83 ec 18             	sub    $0x18,%esp
c000ab6d:	83 ec 08             	sub    $0x8,%esp
c000ab70:	ff 75 0c             	pushl  0xc(%ebp)
c000ab73:	ff 75 08             	pushl  0x8(%ebp)
c000ab76:	e8 29 fe ff ff       	call   c000a9a4 <findElementInList>
c000ab7b:	83 c4 10             	add    $0x10,%esp
c000ab7e:	3c 01                	cmp    $0x1,%al
c000ab80:	74 65                	je     c000abe7 <insertToDoubleLinkList+0x80>
c000ab82:	e8 b3 cf ff ff       	call   c0007b3a <intr_disable>
c000ab87:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ab8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ab8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ab90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab93:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ab9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab9d:	8b 50 04             	mov    0x4(%eax),%edx
c000aba0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aba3:	89 10                	mov    %edx,(%eax)
c000aba5:	8b 45 08             	mov    0x8(%ebp),%eax
c000aba8:	8b 50 04             	mov    0x4(%eax),%edx
c000abab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abae:	89 50 04             	mov    %edx,0x4(%eax)
c000abb1:	8b 45 08             	mov    0x8(%ebp),%eax
c000abb4:	8b 40 04             	mov    0x4(%eax),%eax
c000abb7:	85 c0                	test   %eax,%eax
c000abb9:	74 0b                	je     c000abc6 <insertToDoubleLinkList+0x5f>
c000abbb:	8b 45 08             	mov    0x8(%ebp),%eax
c000abbe:	8b 40 04             	mov    0x4(%eax),%eax
c000abc1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000abc4:	89 10                	mov    %edx,(%eax)
c000abc6:	8b 45 08             	mov    0x8(%ebp),%eax
c000abc9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000abcc:	89 50 04             	mov    %edx,0x4(%eax)
c000abcf:	8b 55 08             	mov    0x8(%ebp),%edx
c000abd2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abd5:	89 10                	mov    %edx,(%eax)
c000abd7:	83 ec 0c             	sub    $0xc,%esp
c000abda:	ff 75 f4             	pushl  -0xc(%ebp)
c000abdd:	e8 81 cf ff ff       	call   c0007b63 <intr_set_status>
c000abe2:	83 c4 10             	add    $0x10,%esp
c000abe5:	eb 01                	jmp    c000abe8 <insertToDoubleLinkList+0x81>
c000abe7:	90                   	nop
c000abe8:	c9                   	leave  
c000abe9:	c3                   	ret    

c000abea <popFromDoubleLinkList>:
c000abea:	55                   	push   %ebp
c000abeb:	89 e5                	mov    %esp,%ebp
c000abed:	83 ec 18             	sub    $0x18,%esp
c000abf0:	e8 45 cf ff ff       	call   c0007b3a <intr_disable>
c000abf5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000abf8:	83 ec 0c             	sub    $0xc,%esp
c000abfb:	ff 75 08             	pushl  0x8(%ebp)
c000abfe:	e8 80 fd ff ff       	call   c000a983 <isListEmpty>
c000ac03:	83 c4 10             	add    $0x10,%esp
c000ac06:	3c 01                	cmp    $0x1,%al
c000ac08:	75 07                	jne    c000ac11 <popFromDoubleLinkList+0x27>
c000ac0a:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac0f:	eb 6b                	jmp    c000ac7c <popFromDoubleLinkList+0x92>
c000ac11:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac14:	8b 40 08             	mov    0x8(%eax),%eax
c000ac17:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac1a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac1d:	8b 40 08             	mov    0x8(%eax),%eax
c000ac20:	85 c0                	test   %eax,%eax
c000ac22:	75 07                	jne    c000ac2b <popFromDoubleLinkList+0x41>
c000ac24:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac29:	eb 51                	jmp    c000ac7c <popFromDoubleLinkList+0x92>
c000ac2b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac2e:	8b 40 08             	mov    0x8(%eax),%eax
c000ac31:	8b 00                	mov    (%eax),%eax
c000ac33:	85 c0                	test   %eax,%eax
c000ac35:	74 11                	je     c000ac48 <popFromDoubleLinkList+0x5e>
c000ac37:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac3a:	8b 40 08             	mov    0x8(%eax),%eax
c000ac3d:	8b 00                	mov    (%eax),%eax
c000ac3f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ac42:	83 c2 08             	add    $0x8,%edx
c000ac45:	89 50 04             	mov    %edx,0x4(%eax)
c000ac48:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac4b:	8b 40 08             	mov    0x8(%eax),%eax
c000ac4e:	8b 10                	mov    (%eax),%edx
c000ac50:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac53:	89 50 08             	mov    %edx,0x8(%eax)
c000ac56:	83 ec 0c             	sub    $0xc,%esp
c000ac59:	ff 75 f4             	pushl  -0xc(%ebp)
c000ac5c:	e8 02 cf ff ff       	call   c0007b63 <intr_set_status>
c000ac61:	83 c4 10             	add    $0x10,%esp
c000ac64:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac67:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ac6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac71:	8b 50 04             	mov    0x4(%eax),%edx
c000ac74:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac77:	89 10                	mov    %edx,(%eax)
c000ac79:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac7c:	c9                   	leave  
c000ac7d:	c3                   	ret    

c000ac7e <kernel_thread>:
c000ac7e:	55                   	push   %ebp
c000ac7f:	89 e5                	mov    %esp,%ebp
c000ac81:	83 ec 08             	sub    $0x8,%esp
c000ac84:	fb                   	sti    
c000ac85:	83 ec 0c             	sub    $0xc,%esp
c000ac88:	ff 75 0c             	pushl  0xc(%ebp)
c000ac8b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac8e:	ff d0                	call   *%eax
c000ac90:	83 c4 10             	add    $0x10,%esp
c000ac93:	90                   	nop
c000ac94:	c9                   	leave  
c000ac95:	c3                   	ret    

c000ac96 <thread_init>:
c000ac96:	55                   	push   %ebp
c000ac97:	89 e5                	mov    %esp,%ebp
c000ac99:	83 ec 18             	sub    $0x18,%esp
c000ac9c:	83 ec 08             	sub    $0x8,%esp
c000ac9f:	6a 00                	push   $0x0
c000aca1:	6a 01                	push   $0x1
c000aca3:	e8 f4 c5 ff ff       	call   c000729c <alloc_memory>
c000aca8:	83 c4 10             	add    $0x10,%esp
c000acab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000acae:	83 ec 04             	sub    $0x4,%esp
c000acb1:	68 00 10 00 00       	push   $0x1000
c000acb6:	6a 00                	push   $0x0
c000acb8:	ff 75 f4             	pushl  -0xc(%ebp)
c000acbb:	e8 df 0d 00 00       	call   c000ba9f <Memset>
c000acc0:	83 c4 10             	add    $0x10,%esp
c000acc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acc6:	05 00 10 00 00       	add    $0x1000,%eax
c000accb:	89 c2                	mov    %eax,%edx
c000accd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acd0:	89 10                	mov    %edx,(%eax)
c000acd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acd5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000acdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acdf:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000ace6:	ff ff ff 
c000ace9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acec:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000acf3:	00 00 00 
c000acf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acf9:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000acff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad02:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000ad08:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000ad0d:	83 c0 01             	add    $0x1,%eax
c000ad10:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000ad15:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000ad1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad1e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000ad24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad27:	c9                   	leave  
c000ad28:	c3                   	ret    

c000ad29 <thread_create>:
c000ad29:	55                   	push   %ebp
c000ad2a:	89 e5                	mov    %esp,%ebp
c000ad2c:	83 ec 10             	sub    $0x10,%esp
c000ad2f:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000ad36:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000ad3d:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad40:	8b 00                	mov    (%eax),%eax
c000ad42:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000ad45:	89 c2                	mov    %eax,%edx
c000ad47:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad4a:	89 10                	mov    %edx,(%eax)
c000ad4c:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad4f:	8b 00                	mov    (%eax),%eax
c000ad51:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000ad54:	89 c2                	mov    %eax,%edx
c000ad56:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad59:	89 10                	mov    %edx,(%eax)
c000ad5b:	90                   	nop
c000ad5c:	c9                   	leave  
c000ad5d:	c3                   	ret    

c000ad5e <thread_start>:
c000ad5e:	55                   	push   %ebp
c000ad5f:	89 e5                	mov    %esp,%ebp
c000ad61:	83 ec 18             	sub    $0x18,%esp
c000ad64:	e8 2d ff ff ff       	call   c000ac96 <thread_init>
c000ad69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad6c:	83 ec 0c             	sub    $0xc,%esp
c000ad6f:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad72:	e8 b2 ff ff ff       	call   c000ad29 <thread_create>
c000ad77:	83 c4 10             	add    $0x10,%esp
c000ad7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad7d:	05 34 01 00 00       	add    $0x134,%eax
c000ad82:	83 ec 08             	sub    $0x8,%esp
c000ad85:	ff 75 10             	pushl  0x10(%ebp)
c000ad88:	50                   	push   %eax
c000ad89:	e8 30 0d 00 00       	call   c000babe <Strcpy>
c000ad8e:	83 c4 10             	add    $0x10,%esp
c000ad91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad94:	8b 00                	mov    (%eax),%eax
c000ad96:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad9c:	c7 40 10 7e ac 00 c0 	movl   $0xc000ac7e,0x10(%eax)
c000ada3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ada6:	8b 55 08             	mov    0x8(%ebp),%edx
c000ada9:	89 50 18             	mov    %edx,0x18(%eax)
c000adac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adaf:	8b 55 0c             	mov    0xc(%ebp),%edx
c000adb2:	89 50 1c             	mov    %edx,0x1c(%eax)
c000adb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adb8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000adbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adc1:	8b 10                	mov    (%eax),%edx
c000adc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adc6:	89 50 04             	mov    %edx,0x4(%eax)
c000adc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adcc:	8b 50 04             	mov    0x4(%eax),%edx
c000adcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000add2:	89 50 08             	mov    %edx,0x8(%eax)
c000add5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000add8:	8b 50 08             	mov    0x8(%eax),%edx
c000addb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adde:	89 50 0c             	mov    %edx,0xc(%eax)
c000ade1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ade4:	05 00 01 00 00       	add    $0x100,%eax
c000ade9:	83 ec 08             	sub    $0x8,%esp
c000adec:	50                   	push   %eax
c000aded:	68 ec 0d 01 c0       	push   $0xc0010dec
c000adf2:	e8 89 fc ff ff       	call   c000aa80 <appendToDoubleLinkList>
c000adf7:	83 c4 10             	add    $0x10,%esp
c000adfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adfd:	05 08 01 00 00       	add    $0x108,%eax
c000ae02:	83 ec 08             	sub    $0x8,%esp
c000ae05:	50                   	push   %eax
c000ae06:	68 04 1f 01 c0       	push   $0xc0011f04
c000ae0b:	e8 70 fc ff ff       	call   c000aa80 <appendToDoubleLinkList>
c000ae10:	83 c4 10             	add    $0x10,%esp
c000ae13:	90                   	nop
c000ae14:	c9                   	leave  
c000ae15:	c3                   	ret    
