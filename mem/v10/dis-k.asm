
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
c0001525:	e8 5b 3c 00 00       	call   c0005185 <ReloadGDT>
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
c000156a:	e8 83 6f 00 00       	call   c00084f2 <test>
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
c0001661:	e8 a5 69 00 00       	call   c000800b <exception_handler>
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
c000168d:	e8 54 37 00 00       	call   c0004de6 <clock_handler>
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
c00016be:	e8 07 46 00 00       	call   c0005cca <keyboard_handler>
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
c00017f8:	e8 a8 66 00 00       	call   c0007ea5 <disp_int>
c00017fd:	83 c4 04             	add    $0x4,%esp
c0001800:	58                   	pop    %eax
c0001801:	5a                   	pop    %edx
c0001802:	52                   	push   %edx
c0001803:	50                   	push   %eax
c0001804:	e8 9c 66 00 00       	call   c0007ea5 <disp_int>
c0001809:	58                   	pop    %eax
c000180a:	5a                   	pop    %edx
c000180b:	52                   	push   %edx
c000180c:	50                   	push   %eax
c000180d:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001813:	e8 8d 66 00 00       	call   c0007ea5 <disp_int>
c0001818:	83 c4 04             	add    $0x4,%esp
c000181b:	58                   	pop    %eax
c000181c:	5a                   	pop    %edx
c000181d:	52                   	push   %edx
c000181e:	50                   	push   %eax
c000181f:	ff 72 ec             	pushl  -0x14(%edx)
c0001822:	e8 7e 66 00 00       	call   c0007ea5 <disp_int>
c0001827:	83 c4 04             	add    $0x4,%esp
c000182a:	58                   	pop    %eax
c000182b:	5a                   	pop    %edx
c000182c:	52                   	push   %edx
c000182d:	50                   	push   %eax
c000182e:	ff 70 ec             	pushl  -0x14(%eax)
c0001831:	e8 6f 66 00 00       	call   c0007ea5 <disp_int>
c0001836:	83 c4 04             	add    $0x4,%esp
c0001839:	58                   	pop    %eax
c000183a:	5a                   	pop    %edx
c000183b:	52                   	push   %edx
c000183c:	50                   	push   %eax
c000183d:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001843:	e8 5d 66 00 00       	call   c0007ea5 <disp_int>
c0001848:	83 c4 04             	add    $0x4,%esp
c000184b:	58                   	pop    %eax
c000184c:	5a                   	pop    %edx
c000184d:	52                   	push   %edx
c000184e:	50                   	push   %eax
c000184f:	68 60 07 01 c0       	push   $0xc0010760
c0001854:	e8 4c 66 00 00       	call   c0007ea5 <disp_int>
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
c00018d8:	e8 b3 91 00 00       	call   c000aa90 <appendToDoubleLinkList>
c00018dd:	83 c4 10             	add    $0x10,%esp
c00018e0:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018e5:	05 08 01 00 00       	add    $0x108,%eax
c00018ea:	83 ec 08             	sub    $0x8,%esp
c00018ed:	50                   	push   %eax
c00018ee:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018f3:	e8 98 91 00 00       	call   c000aa90 <appendToDoubleLinkList>
c00018f8:	83 c4 10             	add    $0x10,%esp
c00018fb:	83 ec 04             	sub    $0x4,%esp
c00018fe:	68 40 ae 00 c0       	push   $0xc000ae40
c0001903:	68 47 ae 00 c0       	push   $0xc000ae47
c0001908:	68 b2 65 00 c0       	push   $0xc00065b2
c000190d:	e8 c9 8e 00 00       	call   c000a7db <process_execute>
c0001912:	83 c4 10             	add    $0x10,%esp
c0001915:	83 ec 04             	sub    $0x4,%esp
c0001918:	68 50 ae 00 c0       	push   $0xc000ae50
c000191d:	68 58 ae 00 c0       	push   $0xc000ae58
c0001922:	68 c9 29 00 c0       	push   $0xc00029c9
c0001927:	e8 af 8e 00 00       	call   c000a7db <process_execute>
c000192c:	83 c4 10             	add    $0x10,%esp
c000192f:	83 ec 04             	sub    $0x4,%esp
c0001932:	68 61 ae 00 c0       	push   $0xc000ae61
c0001937:	68 68 ae 00 c0       	push   $0xc000ae68
c000193c:	68 31 1b 00 c0       	push   $0xc0001b31
c0001941:	e8 95 8e 00 00       	call   c000a7db <process_execute>
c0001946:	83 c4 10             	add    $0x10,%esp
c0001949:	83 ec 04             	sub    $0x4,%esp
c000194c:	68 71 ae 00 c0       	push   $0xc000ae71
c0001951:	68 79 ae 00 c0       	push   $0xc000ae79
c0001956:	68 c7 5b 00 c0       	push   $0xc0005bc7
c000195b:	e8 7b 8e 00 00       	call   c000a7db <process_execute>
c0001960:	83 c4 10             	add    $0x10,%esp
c0001963:	83 ec 04             	sub    $0x4,%esp
c0001966:	68 83 ae 00 c0       	push   $0xc000ae83
c000196b:	68 8d ae 00 c0       	push   $0xc000ae8d
c0001970:	68 fc 1a 00 c0       	push   $0xc0001afc
c0001975:	e8 61 8e 00 00       	call   c000a7db <process_execute>
c000197a:	83 c4 10             	add    $0x10,%esp
c000197d:	83 ec 0c             	sub    $0xc,%esp
c0001980:	68 9a ae 00 c0       	push   $0xc000ae9a
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
c00019b7:	68 a4 ae 00 c0       	push   $0xc000aea4
c00019bc:	e8 cb fb ff ff       	call   c000158c <disp_str>
c00019c1:	83 c4 10             	add    $0x10,%esp
c00019c4:	e8 e6 6b 00 00       	call   c00085af <init_keyboard>
c00019c9:	83 ec 0c             	sub    $0xc,%esp
c00019cc:	68 00 00 00 02       	push   $0x2000000
c00019d1:	e8 16 60 00 00       	call   c00079ec <init_memory>
c00019d6:	83 c4 10             	add    $0x10,%esp
c00019d9:	83 ec 0c             	sub    $0xc,%esp
c00019dc:	68 ec 0d 01 c0       	push   $0xc0010dec
c00019e1:	e8 7f 8f 00 00       	call   c000a965 <initDoubleLinkList>
c00019e6:	83 c4 10             	add    $0x10,%esp
c00019e9:	83 ec 0c             	sub    $0xc,%esp
c00019ec:	68 04 1f 01 c0       	push   $0xc0011f04
c00019f1:	e8 6f 8f 00 00       	call   c000a965 <initDoubleLinkList>
c00019f6:	83 c4 10             	add    $0x10,%esp
c00019f9:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001a00:	00 00 00 
c0001a03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a0a:	eb 14                	jmp    c0001a20 <init+0x90>
c0001a0c:	83 ec 0c             	sub    $0xc,%esp
c0001a0f:	68 aa ae 00 c0       	push   $0xc000aeaa
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
c0001a64:	68 ab ae 00 c0       	push   $0xc000aeab
c0001a69:	e8 1e fb ff ff       	call   c000158c <disp_str>
c0001a6e:	83 c4 10             	add    $0x10,%esp
c0001a71:	83 ec 0c             	sub    $0xc,%esp
c0001a74:	68 b4 ae 00 c0       	push   $0xc000aeb4
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
c0001ab1:	68 b6 ae 00 c0       	push   $0xc000aeb6
c0001ab6:	e8 d1 fa ff ff       	call   c000158c <disp_str>
c0001abb:	83 c4 10             	add    $0x10,%esp
c0001abe:	83 ec 0c             	sub    $0xc,%esp
c0001ac1:	68 b4 ae 00 c0       	push   $0xc000aeb4
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
c0001b05:	68 bf ae 00 c0       	push   $0xc000aebf
c0001b0a:	e8 7d fa ff ff       	call   c000158c <disp_str>
c0001b0f:	83 c4 10             	add    $0x10,%esp
c0001b12:	e8 90 6f 00 00       	call   c0008aa7 <INIT_fork>
c0001b17:	eb fe                	jmp    c0001b17 <user_proc_a+0x1b>

c0001b19 <user_proc_b>:
c0001b19:	55                   	push   %ebp
c0001b1a:	89 e5                	mov    %esp,%ebp
c0001b1c:	83 ec 08             	sub    $0x8,%esp
c0001b1f:	83 ec 0c             	sub    $0xc,%esp
c0001b22:	68 d1 ae 00 c0       	push   $0xc000aed1
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
c0001b5e:	e8 48 9f 00 00       	call   c000baab <Memset>
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
c0001ba0:	e8 42 83 00 00       	call   c0009ee7 <send_rec>
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
c0001c14:	68 e4 ae 00 c0       	push   $0xc000aee4
c0001c19:	68 e4 ae 00 c0       	push   $0xc000aee4
c0001c1e:	68 ec ae 00 c0       	push   $0xc000aeec
c0001c23:	e8 4f 7a 00 00       	call   c0009677 <assertion_failure>
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
c0001c7f:	68 46 af 00 c0       	push   $0xc000af46
c0001c84:	e8 aa 79 00 00       	call   c0009633 <spin>
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
c0001cb9:	68 58 af 00 c0       	push   $0xc000af58
c0001cbe:	e8 96 79 00 00       	call   c0009659 <panic>
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
c0001e1a:	e8 8c 9c 00 00       	call   c000baab <Memset>
c0001e1f:	83 c4 10             	add    $0x10,%esp
c0001e22:	83 ec 04             	sub    $0x4,%esp
c0001e25:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e28:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e2b:	68 f0 01 00 00       	push   $0x1f0
c0001e30:	e8 ca 9c 00 00       	call   c000baff <read_port>
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
c0001f98:	e8 2d 9b 00 00       	call   c000baca <Strcpy>
c0001f9d:	83 c4 10             	add    $0x10,%esp
c0001fa0:	eb 13                	jmp    c0001fb5 <print_hdinfo+0x167>
c0001fa2:	83 ec 08             	sub    $0x8,%esp
c0001fa5:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001fa8:	50                   	push   %eax
c0001fa9:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001fac:	50                   	push   %eax
c0001fad:	e8 18 9b 00 00       	call   c000baca <Strcpy>
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
c0001fec:	68 62 af 00 c0       	push   $0xc000af62
c0001ff1:	e8 24 73 00 00       	call   c000931a <Printf>
c0001ff6:	83 c4 10             	add    $0x10,%esp
c0001ff9:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ffc:	8b 40 0c             	mov    0xc(%eax),%eax
c0001fff:	83 ec 08             	sub    $0x8,%esp
c0002002:	50                   	push   %eax
c0002003:	68 6a af 00 c0       	push   $0xc000af6a
c0002008:	e8 0d 73 00 00       	call   c000931a <Printf>
c000200d:	83 c4 10             	add    $0x10,%esp
c0002010:	8b 45 08             	mov    0x8(%ebp),%eax
c0002013:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0002017:	0f b6 c0             	movzbl %al,%eax
c000201a:	83 ec 08             	sub    $0x8,%esp
c000201d:	50                   	push   %eax
c000201e:	68 7b af 00 c0       	push   $0xc000af7b
c0002023:	e8 f2 72 00 00       	call   c000931a <Printf>
c0002028:	83 c4 10             	add    $0x10,%esp
c000202b:	8b 45 08             	mov    0x8(%ebp),%eax
c000202e:	0f b6 00             	movzbl (%eax),%eax
c0002031:	0f b6 c0             	movzbl %al,%eax
c0002034:	83 ec 08             	sub    $0x8,%esp
c0002037:	50                   	push   %eax
c0002038:	68 89 af 00 c0       	push   $0xc000af89
c000203d:	e8 d8 72 00 00       	call   c000931a <Printf>
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
c00020e1:	e8 c5 99 00 00       	call   c000baab <Memset>
c00020e6:	83 c4 10             	add    $0x10,%esp
c00020e9:	83 ec 04             	sub    $0x4,%esp
c00020ec:	ff 75 f4             	pushl  -0xc(%ebp)
c00020ef:	ff 75 ec             	pushl  -0x14(%ebp)
c00020f2:	68 f0 01 00 00       	push   $0x1f0
c00020f7:	e8 03 9a 00 00       	call   c000baff <read_port>
c00020fc:	83 c4 10             	add    $0x10,%esp
c00020ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002102:	05 be 01 00 00       	add    $0x1be,%eax
c0002107:	83 ec 04             	sub    $0x4,%esp
c000210a:	6a 40                	push   $0x40
c000210c:	50                   	push   %eax
c000210d:	ff 75 10             	pushl  0x10(%ebp)
c0002110:	e8 ad 5a 00 00       	call   c0007bc2 <Memcpy>
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
c000217e:	e8 28 99 00 00       	call   c000baab <Memset>
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
c00022b0:	e8 f6 97 00 00       	call   c000baab <Memset>
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
c00023a7:	e8 ff 96 00 00       	call   c000baab <Memset>
c00023ac:	83 c4 10             	add    $0x10,%esp
c00023af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023b2:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00023b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023bc:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00023c3:	83 ec 04             	sub    $0x4,%esp
c00023c6:	6a 02                	push   $0x2
c00023c8:	ff 75 f0             	pushl  -0x10(%ebp)
c00023cb:	6a 01                	push   $0x1
c00023cd:	e8 15 7b 00 00       	call   c0009ee7 <send_rec>
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
c0002446:	e8 60 96 00 00       	call   c000baab <Memset>
c000244b:	83 c4 10             	add    $0x10,%esp
c000244e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002451:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002458:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000245b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0002462:	83 ec 04             	sub    $0x4,%esp
c0002465:	6a 02                	push   $0x2
c0002467:	ff 75 ec             	pushl  -0x14(%ebp)
c000246a:	6a 01                	push   $0x1
c000246c:	e8 76 7a 00 00       	call   c0009ee7 <send_rec>
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
c000249a:	68 94 af 00 c0       	push   $0xc000af94
c000249f:	e8 b5 71 00 00       	call   c0009659 <panic>
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
c00024ca:	e8 dc 95 00 00       	call   c000baab <Memset>
c00024cf:	83 c4 10             	add    $0x10,%esp
c00024d2:	83 ec 04             	sub    $0x4,%esp
c00024d5:	68 13 02 00 00       	push   $0x213
c00024da:	ff 75 f4             	pushl  -0xc(%ebp)
c00024dd:	6a 02                	push   $0x2
c00024df:	e8 03 7a 00 00       	call   c0009ee7 <send_rec>
c00024e4:	83 c4 10             	add    $0x10,%esp
c00024e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024ea:	83 ec 08             	sub    $0x8,%esp
c00024ed:	6a 6c                	push   $0x6c
c00024ef:	50                   	push   %eax
c00024f0:	e8 a6 51 00 00       	call   c000769b <sys_free>
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
c00025ef:	e8 1d 4b 00 00       	call   c0007111 <alloc_virtual_memory>
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
c0002614:	68 e4 ae 00 c0       	push   $0xc000aee4
c0002619:	68 e4 ae 00 c0       	push   $0xc000aee4
c000261e:	68 a6 af 00 c0       	push   $0xc000afa6
c0002623:	e8 4f 70 00 00       	call   c0009677 <assertion_failure>
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
c0002686:	68 e4 ae 00 c0       	push   $0xc000aee4
c000268b:	68 e4 ae 00 c0       	push   $0xc000aee4
c0002690:	68 c4 af 00 c0       	push   $0xc000afc4
c0002695:	e8 dd 6f 00 00       	call   c0009677 <assertion_failure>
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
c00026e1:	e8 c5 93 00 00       	call   c000baab <Memset>
c00026e6:	83 c4 10             	add    $0x10,%esp
c00026e9:	83 ec 04             	sub    $0x4,%esp
c00026ec:	68 00 02 00 00       	push   $0x200
c00026f1:	68 80 21 01 c0       	push   $0xc0012180
c00026f6:	68 f0 01 00 00       	push   $0x1f0
c00026fb:	e8 ff 93 00 00       	call   c000baff <read_port>
c0002700:	83 c4 10             	add    $0x10,%esp
c0002703:	83 ec 04             	sub    $0x4,%esp
c0002706:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002709:	68 80 21 01 c0       	push   $0xc0012180
c000270e:	ff 75 f0             	pushl  -0x10(%ebp)
c0002711:	e8 ac 54 00 00       	call   c0007bc2 <Memcpy>
c0002716:	83 c4 10             	add    $0x10,%esp
c0002719:	eb 26                	jmp    c0002741 <hd_rdwt+0x246>
c000271b:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000271f:	75 20                	jne    c0002741 <hd_rdwt+0x246>
c0002721:	e8 53 fd ff ff       	call   c0002479 <wait_for>
c0002726:	83 ec 04             	sub    $0x4,%esp
c0002729:	ff 75 c4             	pushl  -0x3c(%ebp)
c000272c:	ff 75 f0             	pushl  -0x10(%ebp)
c000272f:	68 f0 01 00 00       	push   $0x1f0
c0002734:	e8 da 93 00 00       	call   c000bb13 <write_port>
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
c0002771:	e8 35 93 00 00       	call   c000baab <Memset>
c0002776:	83 c4 10             	add    $0x10,%esp
c0002779:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000277c:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002783:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002786:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000278d:	83 ec 04             	sub    $0x4,%esp
c0002790:	6a 02                	push   $0x2
c0002792:	ff 75 c0             	pushl  -0x40(%ebp)
c0002795:	6a 01                	push   $0x1
c0002797:	e8 4b 77 00 00       	call   c0009ee7 <send_rec>
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
c00027c3:	e8 ae 79 00 00       	call   c000a176 <inform_int>
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
c000281b:	68 f8 af 00 c0       	push   $0xc000aff8
c0002820:	e8 f5 6a 00 00       	call   c000931a <Printf>
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
c0002858:	68 15 b0 00 c0       	push   $0xc000b015
c000285d:	e8 b8 6a 00 00       	call   c000931a <Printf>
c0002862:	83 c4 10             	add    $0x10,%esp
c0002865:	eb 01                	jmp    c0002868 <print_hd_info+0x56>
c0002867:	90                   	nop
c0002868:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000286c:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002870:	7e bf                	jle    c0002831 <print_hd_info+0x1f>
c0002872:	83 ec 0c             	sub    $0xc,%esp
c0002875:	68 2d b0 00 c0       	push   $0xc000b02d
c000287a:	e8 9b 6a 00 00       	call   c000931a <Printf>
c000287f:	83 c4 10             	add    $0x10,%esp
c0002882:	83 ec 0c             	sub    $0xc,%esp
c0002885:	68 48 b0 00 c0       	push   $0xc000b048
c000288a:	e8 8b 6a 00 00       	call   c000931a <Printf>
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
c00028d2:	68 15 b0 00 c0       	push   $0xc000b015
c00028d7:	e8 3e 6a 00 00       	call   c000931a <Printf>
c00028dc:	83 c4 10             	add    $0x10,%esp
c00028df:	eb 01                	jmp    c00028e2 <print_hd_info+0xd0>
c00028e1:	90                   	nop
c00028e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028e6:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00028ea:	7e b6                	jle    c00028a2 <print_hd_info+0x90>
c00028ec:	83 ec 0c             	sub    $0xc,%esp
c00028ef:	68 65 b0 00 c0       	push   $0xc000b065
c00028f4:	e8 21 6a 00 00       	call   c000931a <Printf>
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
c00029fe:	e8 a8 90 00 00       	call   c000baab <Memset>
c0002a03:	83 c4 10             	add    $0x10,%esp
c0002a06:	83 ec 04             	sub    $0x4,%esp
c0002a09:	6a 12                	push   $0x12
c0002a0b:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a0e:	6a 02                	push   $0x2
c0002a10:	e8 d2 74 00 00       	call   c0009ee7 <send_rec>
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
c0002a58:	e8 ca 23 00 00       	call   c0004e27 <pid2proc>
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
c0002a8b:	68 84 b0 00 c0       	push   $0xc000b084
c0002a90:	68 84 b0 00 c0       	push   $0xc000b084
c0002a95:	68 94 b0 00 c0       	push   $0xc000b094
c0002a9a:	e8 d8 6b 00 00       	call   c0009677 <assertion_failure>
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
c0002b05:	e8 dd 73 00 00       	call   c0009ee7 <send_rec>
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
c0002b41:	e8 a1 73 00 00       	call   c0009ee7 <send_rec>
c0002b46:	83 c4 10             	add    $0x10,%esp
c0002b49:	eb 13                	jmp    c0002b5e <task_fs+0x195>
c0002b4b:	83 ec 0c             	sub    $0xc,%esp
c0002b4e:	68 f7 b0 00 c0       	push   $0xc000b0f7
c0002b53:	e8 01 6b 00 00       	call   c0009659 <panic>
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
c0002b83:	e8 23 8f 00 00       	call   c000baab <Memset>
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
c0002bce:	68 84 b0 00 c0       	push   $0xc000b084
c0002bd3:	68 84 b0 00 c0       	push   $0xc000b084
c0002bd8:	68 0a b1 00 c0       	push   $0xc000b10a
c0002bdd:	e8 95 6a 00 00       	call   c0009677 <assertion_failure>
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
c0002c00:	68 84 b0 00 c0       	push   $0xc000b084
c0002c05:	68 84 b0 00 c0       	push   $0xc000b084
c0002c0a:	68 28 b1 00 c0       	push   $0xc000b128
c0002c0f:	e8 63 6a 00 00       	call   c0009677 <assertion_failure>
c0002c14:	83 c4 10             	add    $0x10,%esp
c0002c17:	83 ec 04             	sub    $0x4,%esp
c0002c1a:	6a 03                	push   $0x3
c0002c1c:	ff 75 f4             	pushl  -0xc(%ebp)
c0002c1f:	6a 03                	push   $0x3
c0002c21:	e8 c1 72 00 00       	call   c0009ee7 <send_rec>
c0002c26:	83 c4 10             	add    $0x10,%esp
c0002c29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c2c:	83 ec 08             	sub    $0x8,%esp
c0002c2f:	6a 6c                	push   $0x6c
c0002c31:	50                   	push   %eax
c0002c32:	e8 64 4a 00 00       	call   c000769b <sys_free>
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
c0002c77:	e8 5c 45 00 00       	call   c00071d8 <get_physical_address>
c0002c7c:	83 c4 10             	add    $0x10,%esp
c0002c7f:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002c84:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002c89:	83 ec 0c             	sub    $0xc,%esp
c0002c8c:	50                   	push   %eax
c0002c8d:	e8 46 45 00 00       	call   c00071d8 <get_physical_address>
c0002c92:	83 c4 10             	add    $0x10,%esp
c0002c95:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002c9a:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c9f:	83 ec 04             	sub    $0x4,%esp
c0002ca2:	68 00 02 00 00       	push   $0x200
c0002ca7:	6a 00                	push   $0x0
c0002ca9:	50                   	push   %eax
c0002caa:	e8 fc 8d 00 00       	call   c000baab <Memset>
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
c0002d3d:	e8 69 8d 00 00       	call   c000baab <Memset>
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
c0002dad:	e8 f9 8c 00 00       	call   c000baab <Memset>
c0002db2:	83 c4 10             	add    $0x10,%esp
c0002db5:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002dba:	83 c0 01             	add    $0x1,%eax
c0002dbd:	83 ec 04             	sub    $0x4,%esp
c0002dc0:	68 ff 01 00 00       	push   $0x1ff
c0002dc5:	6a 80                	push   $0xffffff80
c0002dc7:	50                   	push   %eax
c0002dc8:	e8 de 8c 00 00       	call   c000baab <Memset>
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
c0002e03:	e8 a3 8c 00 00       	call   c000baab <Memset>
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
c0002e35:	e8 71 8c 00 00       	call   c000baab <Memset>
c0002e3a:	83 c4 10             	add    $0x10,%esp
c0002e3d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e42:	83 c0 01             	add    $0x1,%eax
c0002e45:	83 ec 04             	sub    $0x4,%esp
c0002e48:	68 ff 01 00 00       	push   $0x1ff
c0002e4d:	6a 00                	push   $0x0
c0002e4f:	50                   	push   %eax
c0002e50:	e8 56 8c 00 00       	call   c000baab <Memset>
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
c0002feb:	c7 85 70 ff ff ff 50 	movl   $0xc000b150,-0x90(%ebp)
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
c00030cb:	e8 14 8a 00 00       	call   c000bae4 <Strlen>
c00030d0:	83 c4 10             	add    $0x10,%esp
c00030d3:	89 c1                	mov    %eax,%ecx
c00030d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030d8:	8d 50 04             	lea    0x4(%eax),%edx
c00030db:	83 ec 04             	sub    $0x4,%esp
c00030de:	51                   	push   %ecx
c00030df:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c00030e5:	50                   	push   %eax
c00030e6:	52                   	push   %edx
c00030e7:	e8 d6 4a 00 00       	call   c0007bc2 <Memcpy>
c00030ec:	83 c4 10             	add    $0x10,%esp
c00030ef:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c00030f5:	b8 00 00 00 00       	mov    $0x0,%eax
c00030fa:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00030ff:	89 d7                	mov    %edx,%edi
c0003101:	f3 ab                	rep stos %eax,%es:(%edi)
c0003103:	c7 85 34 ff ff ff 5c 	movl   $0xc000b15c,-0xcc(%ebp)
c000310a:	b1 00 c0 
c000310d:	c7 85 38 ff ff ff 65 	movl   $0xc000b165,-0xc8(%ebp)
c0003114:	b1 00 c0 
c0003117:	c7 85 3c ff ff ff 6e 	movl   $0xc000b16e,-0xc4(%ebp)
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
c000314e:	e8 91 89 00 00       	call   c000bae4 <Strlen>
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
c000316e:	e8 4f 4a 00 00       	call   c0007bc2 <Memcpy>
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
c0003199:	e8 46 89 00 00       	call   c000bae4 <Strlen>
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
c00031c2:	e8 1d 89 00 00       	call   c000bae4 <Strlen>
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
c00031e2:	e8 db 49 00 00       	call   c0007bc2 <Memcpy>
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
c0003253:	e8 8f 6c 00 00       	call   c0009ee7 <send_rec>
c0003258:	83 c4 10             	add    $0x10,%esp
c000325b:	e8 dd f9 ff ff       	call   c0002c3d <mkfs>
c0003260:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003263:	83 ec 08             	sub    $0x8,%esp
c0003266:	6a 6c                	push   $0x6c
c0003268:	50                   	push   %eax
c0003269:	e8 2d 44 00 00       	call   c000769b <sys_free>
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
c0003285:	e8 21 88 00 00       	call   c000baab <Memset>
c000328a:	83 c4 10             	add    $0x10,%esp
c000328d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003290:	8b 40 34             	mov    0x34(%eax),%eax
c0003293:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003296:	83 ec 08             	sub    $0x8,%esp
c0003299:	6a 0c                	push   $0xc
c000329b:	ff 75 e4             	pushl  -0x1c(%ebp)
c000329e:	e8 6e 3e 00 00       	call   c0007111 <alloc_virtual_memory>
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
c00032bd:	e8 00 49 00 00       	call   c0007bc2 <Memcpy>
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
c0003319:	68 84 b0 00 c0       	push   $0xc000b084
c000331e:	68 84 b0 00 c0       	push   $0xc000b084
c0003323:	68 77 b1 00 c0       	push   $0xc000b177
c0003328:	e8 4a 63 00 00       	call   c0009677 <assertion_failure>
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
c000336e:	68 84 b0 00 c0       	push   $0xc000b084
c0003373:	68 84 b0 00 c0       	push   $0xc000b084
c0003378:	68 7f b1 00 c0       	push   $0xc000b17f
c000337d:	e8 f5 62 00 00       	call   c0009677 <assertion_failure>
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
c00033a6:	68 87 b1 00 c0       	push   $0xc000b187
c00033ab:	e8 a9 62 00 00       	call   c0009659 <panic>
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
c0003454:	e8 52 86 00 00       	call   c000baab <Memset>
c0003459:	83 c4 10             	add    $0x10,%esp
c000345c:	83 ec 04             	sub    $0x4,%esp
c000345f:	6a 28                	push   $0x28
c0003461:	6a 00                	push   $0x0
c0003463:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003466:	50                   	push   %eax
c0003467:	e8 3f 86 00 00       	call   c000baab <Memset>
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
c0003538:	e8 06 6d 00 00       	call   c000a243 <strcmp>
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
c0003a1d:	68 84 b0 00 c0       	push   $0xc000b084
c0003a22:	68 84 b0 00 c0       	push   $0xc000b084
c0003a27:	68 94 b1 00 c0       	push   $0xc000b194
c0003a2c:	e8 46 5c 00 00       	call   c0009677 <assertion_failure>
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
c0003e18:	e8 ad 7c 00 00       	call   c000baca <Strcpy>
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
c0003ee6:	68 a9 b1 00 c0       	push   $0xc000b1a9
c0003eeb:	e8 53 63 00 00       	call   c000a243 <strcmp>
c0003ef0:	83 c4 10             	add    $0x10,%esp
c0003ef3:	85 c0                	test   %eax,%eax
c0003ef5:	75 10                	jne    c0003f07 <do_unlink+0x31>
c0003ef7:	83 ec 0c             	sub    $0xc,%esp
c0003efa:	68 ab b1 00 c0       	push   $0xc000b1ab
c0003eff:	e8 55 57 00 00       	call   c0009659 <panic>
c0003f04:	83 c4 10             	add    $0x10,%esp
c0003f07:	83 ec 0c             	sub    $0xc,%esp
c0003f0a:	ff 75 08             	pushl  0x8(%ebp)
c0003f0d:	e8 31 f5 ff ff       	call   c0003443 <search_file>
c0003f12:	83 c4 10             	add    $0x10,%esp
c0003f15:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f18:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003f1c:	75 10                	jne    c0003f2e <do_unlink+0x58>
c0003f1e:	83 ec 0c             	sub    $0xc,%esp
c0003f21:	68 c7 b1 00 c0       	push   $0xc000b1c7
c0003f26:	e8 2e 57 00 00       	call   c0009659 <panic>
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
c0003f4f:	68 c7 b1 00 c0       	push   $0xc000b1c7
c0003f54:	e8 00 57 00 00       	call   c0009659 <panic>
c0003f59:	83 c4 10             	add    $0x10,%esp
c0003f5c:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003f5f:	85 c0                	test   %eax,%eax
c0003f61:	7e 10                	jle    c0003f73 <do_unlink+0x9d>
c0003f63:	83 ec 0c             	sub    $0xc,%esp
c0003f66:	68 e0 b1 00 c0       	push   $0xc000b1e0
c0003f6b:	e8 e9 56 00 00       	call   c0009659 <panic>
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
c0004309:	e8 35 5f 00 00       	call   c000a243 <strcmp>
c000430e:	83 c4 10             	add    $0x10,%esp
c0004311:	85 c0                	test   %eax,%eax
c0004313:	75 1b                	jne    c0004330 <do_unlink+0x45a>
c0004315:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000431c:	83 ec 04             	sub    $0x4,%esp
c000431f:	6a 10                	push   $0x10
c0004321:	6a 00                	push   $0x0
c0004323:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004326:	e8 80 77 00 00       	call   c000baab <Memset>
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
c00043f6:	e8 2c 0a 00 00       	call   c0004e27 <pid2proc>
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
c0004443:	68 18 b2 00 c0       	push   $0xc000b218
c0004448:	e8 0c 52 00 00       	call   c0009659 <panic>
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
c0004473:	68 84 b0 00 c0       	push   $0xc000b084
c0004478:	68 84 b0 00 c0       	push   $0xc000b084
c000447d:	68 28 b2 00 c0       	push   $0xc000b228
c0004482:	e8 f0 51 00 00       	call   c0009677 <assertion_failure>
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
c00044d1:	e8 11 5a 00 00       	call   c0009ee7 <send_rec>
c00044d6:	83 c4 10             	add    $0x10,%esp
c00044d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00044dc:	8b 40 68             	mov    0x68(%eax),%eax
c00044df:	83 f8 66             	cmp    $0x66,%eax
c00044e2:	75 13                	jne    c00044f7 <do_rdwt+0x145>
c00044e4:	83 ec 04             	sub    $0x4,%esp
c00044e7:	ff 75 b4             	pushl  -0x4c(%ebp)
c00044ea:	ff 75 08             	pushl  0x8(%ebp)
c00044ed:	6a 01                	push   $0x1
c00044ef:	e8 f3 59 00 00       	call   c0009ee7 <send_rec>
c00044f4:	83 c4 10             	add    $0x10,%esp
c00044f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00044fa:	8b 40 68             	mov    0x68(%eax),%eax
c00044fd:	83 f8 65             	cmp    $0x65,%eax
c0004500:	75 13                	jne    c0004515 <do_rdwt+0x163>
c0004502:	83 ec 04             	sub    $0x4,%esp
c0004505:	ff 75 b4             	pushl  -0x4c(%ebp)
c0004508:	ff 75 08             	pushl  0x8(%ebp)
c000450b:	6a 01                	push   $0x1
c000450d:	e8 d5 59 00 00       	call   c0009ee7 <send_rec>
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
c00045fa:	e8 28 08 00 00       	call   c0004e27 <pid2proc>
c00045ff:	83 c4 10             	add    $0x10,%esp
c0004602:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004605:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004608:	83 ec 08             	sub    $0x8,%esp
c000460b:	50                   	push   %eax
c000460c:	ff 75 c8             	pushl  -0x38(%ebp)
c000460f:	e8 fd 2a 00 00       	call   c0007111 <alloc_virtual_memory>
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
c0004681:	e8 3c 35 00 00       	call   c0007bc2 <Memcpy>
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
c00046a8:	e8 15 35 00 00       	call   c0007bc2 <Memcpy>
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
c000486c:	e8 51 33 00 00       	call   c0007bc2 <Memcpy>
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
c00048ad:	68 84 b0 00 c0       	push   $0xc000b084
c00048b2:	68 84 b0 00 c0       	push   $0xc000b084
c00048b7:	68 5c b2 00 c0       	push   $0xc000b25c
c00048bc:	e8 b6 4d 00 00       	call   c0009677 <assertion_failure>
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
c00049dd:	83 ec 38             	sub    $0x38,%esp
c00049e0:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c00049e7:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c00049ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00049f5:	e8 ae ce ff ff       	call   c00018a8 <get_running_thread_pcb>
c00049fa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00049fd:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004a02:	85 c0                	test   %eax,%eax
c0004a04:	74 23                	je     c0004a29 <schedule_process+0x4f>
c0004a06:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004a0b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a12:	84 c0                	test   %al,%al
c0004a14:	75 13                	jne    c0004a29 <schedule_process+0x4f>
c0004a16:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004a1b:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004a21:	85 c0                	test   %eax,%eax
c0004a23:	0f 85 2b 03 00 00    	jne    c0004d54 <schedule_process+0x37a>
c0004a29:	83 ec 0c             	sub    $0xc,%esp
c0004a2c:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a31:	e8 5d 5f 00 00       	call   c000a993 <isListEmpty>
c0004a36:	83 c4 10             	add    $0x10,%esp
c0004a39:	3c 01                	cmp    $0x1,%al
c0004a3b:	0f 85 16 01 00 00    	jne    c0004b57 <schedule_process+0x17d>
c0004a41:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a44:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004a4a:	85 c0                	test   %eax,%eax
c0004a4c:	75 24                	jne    c0004a72 <schedule_process+0x98>
c0004a4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a51:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a54:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a57:	05 00 01 00 00       	add    $0x100,%eax
c0004a5c:	83 ec 08             	sub    $0x8,%esp
c0004a5f:	50                   	push   %eax
c0004a60:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a65:	e8 26 60 00 00       	call   c000aa90 <appendToDoubleLinkList>
c0004a6a:	83 c4 10             	add    $0x10,%esp
c0004a6d:	e9 75 02 00 00       	jmp    c0004ce7 <schedule_process+0x30d>
c0004a72:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a75:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a7c:	84 c0                	test   %al,%al
c0004a7e:	0f 85 63 02 00 00    	jne    c0004ce7 <schedule_process+0x30d>
c0004a84:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a87:	05 00 01 00 00       	add    $0x100,%eax
c0004a8c:	83 ec 08             	sub    $0x8,%esp
c0004a8f:	50                   	push   %eax
c0004a90:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a95:	e8 f6 5f 00 00       	call   c000aa90 <appendToDoubleLinkList>
c0004a9a:	83 c4 10             	add    $0x10,%esp
c0004a9d:	83 ec 0c             	sub    $0xc,%esp
c0004aa0:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004aa5:	e8 50 61 00 00       	call   c000abfa <popFromDoubleLinkList>
c0004aaa:	83 c4 10             	add    $0x10,%esp
c0004aad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004ab0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004ab3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004ab8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004abb:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0004abf:	0f 84 22 02 00 00    	je     c0004ce7 <schedule_process+0x30d>
c0004ac5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004ac8:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004ace:	85 c0                	test   %eax,%eax
c0004ad0:	75 70                	jne    c0004b42 <schedule_process+0x168>
c0004ad2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004ad5:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004adc:	83 ec 0c             	sub    $0xc,%esp
c0004adf:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004ae4:	e8 aa 5e 00 00       	call   c000a993 <isListEmpty>
c0004ae9:	83 c4 10             	add    $0x10,%esp
c0004aec:	84 c0                	test   %al,%al
c0004aee:	75 3d                	jne    c0004b2d <schedule_process+0x153>
c0004af0:	83 ec 0c             	sub    $0xc,%esp
c0004af3:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004af8:	e8 fd 60 00 00       	call   c000abfa <popFromDoubleLinkList>
c0004afd:	83 c4 10             	add    $0x10,%esp
c0004b00:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004b03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004b06:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004b0b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004b0e:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0004b12:	0f 84 cf 01 00 00    	je     c0004ce7 <schedule_process+0x30d>
c0004b18:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b21:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b28:	e9 ba 01 00 00       	jmp    c0004ce7 <schedule_process+0x30d>
c0004b2d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b30:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b36:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b3d:	e9 a5 01 00 00       	jmp    c0004ce7 <schedule_process+0x30d>
c0004b42:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b4b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004b52:	e9 90 01 00 00       	jmp    c0004ce7 <schedule_process+0x30d>
c0004b57:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b5a:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004b61:	84 c0                	test   %al,%al
c0004b63:	0f 85 d3 00 00 00    	jne    c0004c3c <schedule_process+0x262>
c0004b69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b6c:	05 00 01 00 00       	add    $0x100,%eax
c0004b71:	83 ec 08             	sub    $0x8,%esp
c0004b74:	50                   	push   %eax
c0004b75:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b7a:	e8 11 5f 00 00       	call   c000aa90 <appendToDoubleLinkList>
c0004b7f:	83 c4 10             	add    $0x10,%esp
c0004b82:	83 ec 0c             	sub    $0xc,%esp
c0004b85:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004b8a:	e8 6b 60 00 00       	call   c000abfa <popFromDoubleLinkList>
c0004b8f:	83 c4 10             	add    $0x10,%esp
c0004b92:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004b95:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004b98:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004b9d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004ba0:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0004ba4:	0f 84 3d 01 00 00    	je     c0004ce7 <schedule_process+0x30d>
c0004baa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004bad:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004bb3:	85 c0                	test   %eax,%eax
c0004bb5:	75 70                	jne    c0004c27 <schedule_process+0x24d>
c0004bb7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004bba:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004bc1:	83 ec 0c             	sub    $0xc,%esp
c0004bc4:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004bc9:	e8 c5 5d 00 00       	call   c000a993 <isListEmpty>
c0004bce:	83 c4 10             	add    $0x10,%esp
c0004bd1:	84 c0                	test   %al,%al
c0004bd3:	75 3d                	jne    c0004c12 <schedule_process+0x238>
c0004bd5:	83 ec 0c             	sub    $0xc,%esp
c0004bd8:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004bdd:	e8 18 60 00 00       	call   c000abfa <popFromDoubleLinkList>
c0004be2:	83 c4 10             	add    $0x10,%esp
c0004be5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004be8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004beb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004bf0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004bf3:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0004bf7:	0f 84 ea 00 00 00    	je     c0004ce7 <schedule_process+0x30d>
c0004bfd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c00:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c06:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c0d:	e9 d5 00 00 00       	jmp    c0004ce7 <schedule_process+0x30d>
c0004c12:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c15:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c1b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c22:	e9 c0 00 00 00       	jmp    c0004ce7 <schedule_process+0x30d>
c0004c27:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c30:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004c37:	e9 ab 00 00 00       	jmp    c0004ce7 <schedule_process+0x30d>
c0004c3c:	83 ec 0c             	sub    $0xc,%esp
c0004c3f:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c44:	e8 b1 5f 00 00       	call   c000abfa <popFromDoubleLinkList>
c0004c49:	83 c4 10             	add    $0x10,%esp
c0004c4c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004c4f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004c52:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004c57:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004c5a:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004c5e:	0f 84 83 00 00 00    	je     c0004ce7 <schedule_process+0x30d>
c0004c64:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004c67:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004c6d:	85 c0                	test   %eax,%eax
c0004c6f:	75 66                	jne    c0004cd7 <schedule_process+0x2fd>
c0004c71:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004c74:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004c7b:	83 ec 0c             	sub    $0xc,%esp
c0004c7e:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c83:	e8 0b 5d 00 00       	call   c000a993 <isListEmpty>
c0004c88:	83 c4 10             	add    $0x10,%esp
c0004c8b:	84 c0                	test   %al,%al
c0004c8d:	75 36                	jne    c0004cc5 <schedule_process+0x2eb>
c0004c8f:	83 ec 0c             	sub    $0xc,%esp
c0004c92:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004c97:	e8 5e 5f 00 00       	call   c000abfa <popFromDoubleLinkList>
c0004c9c:	83 c4 10             	add    $0x10,%esp
c0004c9f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004ca2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004ca5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004caa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004cad:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c0004cb1:	74 34                	je     c0004ce7 <schedule_process+0x30d>
c0004cb3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cbc:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004cc3:	eb 22                	jmp    c0004ce7 <schedule_process+0x30d>
c0004cc5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004ccb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cce:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004cd5:	eb 10                	jmp    c0004ce7 <schedule_process+0x30d>
c0004cd7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004cda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004ce0:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004ce7:	0f b6 05 f0 1e 01 c0 	movzbl 0xc0011ef0,%eax
c0004cee:	84 c0                	test   %al,%al
c0004cf0:	75 1b                	jne    c0004d0d <schedule_process+0x333>
c0004cf2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004cf6:	74 15                	je     c0004d0d <schedule_process+0x333>
c0004cf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cfb:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d01:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0004d04:	77 07                	ja     c0004d0d <schedule_process+0x333>
c0004d06:	c6 05 f0 1e 01 c0 01 	movb   $0x1,0xc0011ef0
c0004d0d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d11:	75 44                	jne    c0004d57 <schedule_process+0x37d>
c0004d13:	90                   	nop
c0004d14:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004d18:	74 26                	je     c0004d40 <schedule_process+0x366>
c0004d1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d1d:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004d23:	85 c0                	test   %eax,%eax
c0004d25:	74 19                	je     c0004d40 <schedule_process+0x366>
c0004d27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d2a:	05 00 01 00 00       	add    $0x100,%eax
c0004d2f:	83 ec 08             	sub    $0x8,%esp
c0004d32:	50                   	push   %eax
c0004d33:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004d38:	e8 53 5d 00 00       	call   c000aa90 <appendToDoubleLinkList>
c0004d3d:	83 c4 10             	add    $0x10,%esp
c0004d40:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c0004d45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d4b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004d52:	eb 04                	jmp    c0004d58 <schedule_process+0x37e>
c0004d54:	90                   	nop
c0004d55:	eb 01                	jmp    c0004d58 <schedule_process+0x37e>
c0004d57:	90                   	nop
c0004d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d5b:	8b 40 08             	mov    0x8(%eax),%eax
c0004d5e:	85 c0                	test   %eax,%eax
c0004d60:	74 23                	je     c0004d85 <schedule_process+0x3ab>
c0004d62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d65:	83 ec 0c             	sub    $0xc,%esp
c0004d68:	50                   	push   %eax
c0004d69:	e8 29 cb ff ff       	call   c0001897 <update_tss>
c0004d6e:	83 c4 10             	add    $0x10,%esp
c0004d71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d74:	8b 40 08             	mov    0x8(%eax),%eax
c0004d77:	83 ec 0c             	sub    $0xc,%esp
c0004d7a:	50                   	push   %eax
c0004d7b:	e8 0a cb ff ff       	call   c000188a <update_cr3>
c0004d80:	83 c4 10             	add    $0x10,%esp
c0004d83:	eb 0f                	jmp    c0004d94 <schedule_process+0x3ba>
c0004d85:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004d88:	83 ec 0c             	sub    $0xc,%esp
c0004d8b:	50                   	push   %eax
c0004d8c:	e8 f9 ca ff ff       	call   c000188a <update_cr3>
c0004d91:	83 c4 10             	add    $0x10,%esp
c0004d94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d97:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004d9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d9f:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004da5:	85 c0                	test   %eax,%eax
c0004da7:	74 29                	je     c0004dd2 <schedule_process+0x3f8>
c0004da9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004dac:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0004db2:	83 f8 ff             	cmp    $0xffffffff,%eax
c0004db5:	74 1b                	je     c0004dd2 <schedule_process+0x3f8>
c0004db7:	66 87 db             	xchg   %bx,%bx
c0004dba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004dbd:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0004dc3:	83 ec 0c             	sub    $0xc,%esp
c0004dc6:	50                   	push   %eax
c0004dc7:	e8 5b 00 00 00       	call   c0004e27 <pid2proc>
c0004dcc:	83 c4 10             	add    $0x10,%esp
c0004dcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004dd2:	83 ec 08             	sub    $0x8,%esp
c0004dd5:	ff 75 f4             	pushl  -0xc(%ebp)
c0004dd8:	ff 75 e8             	pushl  -0x18(%ebp)
c0004ddb:	e8 70 5b 00 00       	call   c000a950 <switch_to>
c0004de0:	83 c4 10             	add    $0x10,%esp
c0004de3:	90                   	nop
c0004de4:	c9                   	leave  
c0004de5:	c3                   	ret    

c0004de6 <clock_handler>:
c0004de6:	55                   	push   %ebp
c0004de7:	89 e5                	mov    %esp,%ebp
c0004de9:	83 ec 08             	sub    $0x8,%esp
c0004dec:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c0004df1:	85 c0                	test   %eax,%eax
c0004df3:	74 0d                	je     c0004e02 <clock_handler+0x1c>
c0004df5:	83 ec 0c             	sub    $0xc,%esp
c0004df8:	6a 04                	push   $0x4
c0004dfa:	e8 77 53 00 00       	call   c000a176 <inform_int>
c0004dff:	83 c4 10             	add    $0x10,%esp
c0004e02:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e07:	85 c0                	test   %eax,%eax
c0004e09:	74 14                	je     c0004e1f <clock_handler+0x39>
c0004e0b:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004e10:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c0004e16:	83 ea 01             	sub    $0x1,%edx
c0004e19:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c0004e1f:	e8 b6 fb ff ff       	call   c00049da <schedule_process>
c0004e24:	90                   	nop
c0004e25:	c9                   	leave  
c0004e26:	c3                   	ret    

c0004e27 <pid2proc>:
c0004e27:	55                   	push   %ebp
c0004e28:	89 e5                	mov    %esp,%ebp
c0004e2a:	83 ec 20             	sub    $0x20,%esp
c0004e2d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004e34:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c0004e39:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c0004e3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004e42:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004e45:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c0004e4a:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c0004e50:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004e53:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004e56:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0004e5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004e5e:	eb 29                	jmp    c0004e89 <pid2proc+0x62>
c0004e60:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004e63:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004e68:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004e6b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004e6e:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004e74:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e77:	39 c2                	cmp    %eax,%edx
c0004e79:	75 05                	jne    c0004e80 <pid2proc+0x59>
c0004e7b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004e7e:	eb 17                	jmp    c0004e97 <pid2proc+0x70>
c0004e80:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004e83:	8b 40 04             	mov    0x4(%eax),%eax
c0004e86:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004e89:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004e90:	75 ce                	jne    c0004e60 <pid2proc+0x39>
c0004e92:	b8 00 00 00 00       	mov    $0x0,%eax
c0004e97:	c9                   	leave  
c0004e98:	c3                   	ret    

c0004e99 <proc2pid>:
c0004e99:	55                   	push   %ebp
c0004e9a:	89 e5                	mov    %esp,%ebp
c0004e9c:	83 ec 10             	sub    $0x10,%esp
c0004e9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea2:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004ea8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004eab:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004eae:	c9                   	leave  
c0004eaf:	c3                   	ret    

c0004eb0 <InitDescriptor>:
c0004eb0:	55                   	push   %ebp
c0004eb1:	89 e5                	mov    %esp,%ebp
c0004eb3:	83 ec 04             	sub    $0x4,%esp
c0004eb6:	8b 45 14             	mov    0x14(%ebp),%eax
c0004eb9:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004ebd:	8b 45 10             	mov    0x10(%ebp),%eax
c0004ec0:	89 c2                	mov    %eax,%edx
c0004ec2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec5:	66 89 10             	mov    %dx,(%eax)
c0004ec8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ecb:	89 c2                	mov    %eax,%edx
c0004ecd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ed0:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004ed4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ed7:	c1 e8 10             	shr    $0x10,%eax
c0004eda:	89 c2                	mov    %eax,%edx
c0004edc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004edf:	88 50 04             	mov    %dl,0x4(%eax)
c0004ee2:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ee6:	89 c2                	mov    %eax,%edx
c0004ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eeb:	88 50 05             	mov    %dl,0x5(%eax)
c0004eee:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ef2:	66 c1 e8 08          	shr    $0x8,%ax
c0004ef6:	c1 e0 04             	shl    $0x4,%eax
c0004ef9:	89 c2                	mov    %eax,%edx
c0004efb:	8b 45 10             	mov    0x10(%ebp),%eax
c0004efe:	c1 e8 10             	shr    $0x10,%eax
c0004f01:	83 e0 0f             	and    $0xf,%eax
c0004f04:	09 c2                	or     %eax,%edx
c0004f06:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f09:	88 50 06             	mov    %dl,0x6(%eax)
c0004f0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f0f:	c1 e8 18             	shr    $0x18,%eax
c0004f12:	89 c2                	mov    %eax,%edx
c0004f14:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f17:	88 50 07             	mov    %dl,0x7(%eax)
c0004f1a:	90                   	nop
c0004f1b:	c9                   	leave  
c0004f1c:	c3                   	ret    

c0004f1d <Seg2PhyAddr>:
c0004f1d:	55                   	push   %ebp
c0004f1e:	89 e5                	mov    %esp,%ebp
c0004f20:	83 ec 10             	sub    $0x10,%esp
c0004f23:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f26:	c1 e8 03             	shr    $0x3,%eax
c0004f29:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c0004f30:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c0004f37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f3a:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004f3d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004f41:	0f b7 c0             	movzwl %ax,%eax
c0004f44:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004f48:	0f b6 d2             	movzbl %dl,%edx
c0004f4b:	c1 e2 10             	shl    $0x10,%edx
c0004f4e:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004f54:	09 d0                	or     %edx,%eax
c0004f56:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004f59:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f5c:	c9                   	leave  
c0004f5d:	c3                   	ret    

c0004f5e <Seg2PhyAddrLDT>:
c0004f5e:	55                   	push   %ebp
c0004f5f:	89 e5                	mov    %esp,%ebp
c0004f61:	83 ec 10             	sub    $0x10,%esp
c0004f64:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f67:	c1 e8 03             	shr    $0x3,%eax
c0004f6a:	89 c2                	mov    %eax,%edx
c0004f6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f6f:	83 c2 22             	add    $0x22,%edx
c0004f72:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004f76:	8b 02                	mov    (%edx),%eax
c0004f78:	8b 52 04             	mov    0x4(%edx),%edx
c0004f7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f7e:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004f81:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004f85:	0f b7 c0             	movzwl %ax,%eax
c0004f88:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004f8c:	0f b6 d2             	movzbl %dl,%edx
c0004f8f:	c1 e2 10             	shl    $0x10,%edx
c0004f92:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004f98:	09 d0                	or     %edx,%eax
c0004f9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004f9d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004fa0:	c9                   	leave  
c0004fa1:	c3                   	ret    

c0004fa2 <VirAddr2PhyAddr>:
c0004fa2:	55                   	push   %ebp
c0004fa3:	89 e5                	mov    %esp,%ebp
c0004fa5:	83 ec 10             	sub    $0x10,%esp
c0004fa8:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004fab:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fae:	01 d0                	add    %edx,%eax
c0004fb0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004fb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004fb6:	c9                   	leave  
c0004fb7:	c3                   	ret    

c0004fb8 <v2l>:
c0004fb8:	55                   	push   %ebp
c0004fb9:	89 e5                	mov    %esp,%ebp
c0004fbb:	83 ec 18             	sub    $0x18,%esp
c0004fbe:	83 ec 0c             	sub    $0xc,%esp
c0004fc1:	ff 75 08             	pushl  0x8(%ebp)
c0004fc4:	e8 5e fe ff ff       	call   c0004e27 <pid2proc>
c0004fc9:	83 c4 10             	add    $0x10,%esp
c0004fcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004fcf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004fd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004fd9:	83 ec 08             	sub    $0x8,%esp
c0004fdc:	ff 75 f4             	pushl  -0xc(%ebp)
c0004fdf:	50                   	push   %eax
c0004fe0:	e8 79 ff ff ff       	call   c0004f5e <Seg2PhyAddrLDT>
c0004fe5:	83 c4 10             	add    $0x10,%esp
c0004fe8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004feb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004fee:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ff1:	01 d0                	add    %edx,%eax
c0004ff3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004ff6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ff9:	c9                   	leave  
c0004ffa:	c3                   	ret    

c0004ffb <init_propt>:
c0004ffb:	55                   	push   %ebp
c0004ffc:	89 e5                	mov    %esp,%ebp
c0004ffe:	83 ec 28             	sub    $0x28,%esp
c0005001:	6a 0e                	push   $0xe
c0005003:	6a 08                	push   $0x8
c0005005:	68 6a 16 00 c0       	push   $0xc000166a
c000500a:	6a 20                	push   $0x20
c000500c:	e8 18 01 00 00       	call   c0005129 <InitInterruptDesc>
c0005011:	83 c4 10             	add    $0x10,%esp
c0005014:	6a 0e                	push   $0xe
c0005016:	6a 08                	push   $0x8
c0005018:	68 97 16 00 c0       	push   $0xc0001697
c000501d:	6a 21                	push   $0x21
c000501f:	e8 05 01 00 00       	call   c0005129 <InitInterruptDesc>
c0005024:	83 c4 10             	add    $0x10,%esp
c0005027:	6a 0e                	push   $0xe
c0005029:	6a 08                	push   $0x8
c000502b:	68 d9 16 00 c0       	push   $0xc00016d9
c0005030:	6a 2e                	push   $0x2e
c0005032:	e8 f2 00 00 00       	call   c0005129 <InitInterruptDesc>
c0005037:	83 c4 10             	add    $0x10,%esp
c000503a:	83 ec 04             	sub    $0x4,%esp
c000503d:	68 80 15 00 00       	push   $0x1580
c0005042:	6a 00                	push   $0x0
c0005044:	68 00 32 08 c0       	push   $0xc0083200
c0005049:	e8 5d 6a 00 00       	call   c000baab <Memset>
c000504e:	83 c4 10             	add    $0x10,%esp
c0005051:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005058:	83 ec 04             	sub    $0x4,%esp
c000505b:	ff 75 f4             	pushl  -0xc(%ebp)
c000505e:	6a 00                	push   $0x0
c0005060:	68 40 16 01 c0       	push   $0xc0011640
c0005065:	e8 41 6a 00 00       	call   c000baab <Memset>
c000506a:	83 c4 10             	add    $0x10,%esp
c000506d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005070:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c0005075:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c000507c:	00 00 00 
c000507f:	83 ec 0c             	sub    $0xc,%esp
c0005082:	6a 30                	push   $0x30
c0005084:	e8 94 fe ff ff       	call   c0004f1d <Seg2PhyAddr>
c0005089:	83 c4 10             	add    $0x10,%esp
c000508c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000508f:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c0005096:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c000509d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00050a0:	0f b7 d0             	movzwl %ax,%edx
c00050a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050a6:	83 e8 01             	sub    $0x1,%eax
c00050a9:	89 c1                	mov    %eax,%ecx
c00050ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00050ae:	52                   	push   %edx
c00050af:	51                   	push   %ecx
c00050b0:	50                   	push   %eax
c00050b1:	68 00 08 01 c0       	push   $0xc0010800
c00050b6:	e8 f5 fd ff ff       	call   c0004eb0 <InitDescriptor>
c00050bb:	83 c4 10             	add    $0x10,%esp
c00050be:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c00050c5:	68 f2 00 00 00       	push   $0xf2
c00050ca:	68 ff ff 00 00       	push   $0xffff
c00050cf:	ff 75 e4             	pushl  -0x1c(%ebp)
c00050d2:	68 f8 07 01 c0       	push   $0xc00107f8
c00050d7:	e8 d4 fd ff ff       	call   c0004eb0 <InitDescriptor>
c00050dc:	83 c4 10             	add    $0x10,%esp
c00050df:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c00050e6:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c00050ed:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c00050f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00050f7:	0f b7 c0             	movzwl %ax,%eax
c00050fa:	50                   	push   %eax
c00050fb:	ff 75 d8             	pushl  -0x28(%ebp)
c00050fe:	6a 00                	push   $0x0
c0005100:	68 08 08 01 c0       	push   $0xc0010808
c0005105:	e8 a6 fd ff ff       	call   c0004eb0 <InitDescriptor>
c000510a:	83 c4 10             	add    $0x10,%esp
c000510d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005110:	0f b7 c0             	movzwl %ax,%eax
c0005113:	50                   	push   %eax
c0005114:	ff 75 d8             	pushl  -0x28(%ebp)
c0005117:	6a 00                	push   $0x0
c0005119:	68 10 08 01 c0       	push   $0xc0010810
c000511e:	e8 8d fd ff ff       	call   c0004eb0 <InitDescriptor>
c0005123:	83 c4 10             	add    $0x10,%esp
c0005126:	90                   	nop
c0005127:	c9                   	leave  
c0005128:	c3                   	ret    

c0005129 <InitInterruptDesc>:
c0005129:	55                   	push   %ebp
c000512a:	89 e5                	mov    %esp,%ebp
c000512c:	83 ec 10             	sub    $0x10,%esp
c000512f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005132:	c1 e0 03             	shl    $0x3,%eax
c0005135:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c000513a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000513d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005140:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0005144:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005147:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000514a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000514d:	89 c2                	mov    %eax,%edx
c000514f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005152:	66 89 10             	mov    %dx,(%eax)
c0005155:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005158:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c000515e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005161:	c1 f8 10             	sar    $0x10,%eax
c0005164:	89 c2                	mov    %eax,%edx
c0005166:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005169:	66 89 50 06          	mov    %dx,0x6(%eax)
c000516d:	8b 45 10             	mov    0x10(%ebp),%eax
c0005170:	c1 e0 04             	shl    $0x4,%eax
c0005173:	89 c2                	mov    %eax,%edx
c0005175:	8b 45 14             	mov    0x14(%ebp),%eax
c0005178:	09 d0                	or     %edx,%eax
c000517a:	89 c2                	mov    %eax,%edx
c000517c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000517f:	88 50 05             	mov    %dl,0x5(%eax)
c0005182:	90                   	nop
c0005183:	c9                   	leave  
c0005184:	c3                   	ret    

c0005185 <ReloadGDT>:
c0005185:	55                   	push   %ebp
c0005186:	89 e5                	mov    %esp,%ebp
c0005188:	83 ec 28             	sub    $0x28,%esp
c000518b:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c0005190:	0f b7 00             	movzwl (%eax),%eax
c0005193:	98                   	cwtl   
c0005194:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0005199:	8b 12                	mov    (%edx),%edx
c000519b:	83 ec 04             	sub    $0x4,%esp
c000519e:	50                   	push   %eax
c000519f:	52                   	push   %edx
c00051a0:	68 c0 07 01 c0       	push   $0xc00107c0
c00051a5:	e8 d3 68 00 00       	call   c000ba7d <Memcpy2>
c00051aa:	83 c4 10             	add    $0x10,%esp
c00051ad:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c00051b4:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c00051bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00051be:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c00051c3:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c00051c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00051cb:	89 10                	mov    %edx,(%eax)
c00051cd:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c00051d4:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c00051db:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00051de:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c00051e3:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c00051e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00051eb:	89 10                	mov    %edx,(%eax)
c00051ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00051f4:	eb 04                	jmp    c00051fa <ReloadGDT+0x75>
c00051f6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00051fa:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0005201:	7e f3                	jle    c00051f6 <ReloadGDT+0x71>
c0005203:	e8 75 31 00 00       	call   c000837d <init_internal_interrupt>
c0005208:	e8 ee fd ff ff       	call   c0004ffb <init_propt>
c000520d:	90                   	nop
c000520e:	c9                   	leave  
c000520f:	c3                   	ret    

c0005210 <select_console>:
c0005210:	55                   	push   %ebp
c0005211:	89 e5                	mov    %esp,%ebp
c0005213:	83 ec 18             	sub    $0x18,%esp
c0005216:	8b 45 08             	mov    0x8(%ebp),%eax
c0005219:	88 45 f4             	mov    %al,-0xc(%ebp)
c000521c:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0005220:	75 27                	jne    c0005249 <select_console+0x39>
c0005222:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0005226:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c000522c:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0005231:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c0005236:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c000523b:	83 ec 0c             	sub    $0xc,%esp
c000523e:	50                   	push   %eax
c000523f:	e8 08 00 00 00       	call   c000524c <flush>
c0005244:	83 c4 10             	add    $0x10,%esp
c0005247:	eb 01                	jmp    c000524a <select_console+0x3a>
c0005249:	90                   	nop
c000524a:	c9                   	leave  
c000524b:	c3                   	ret    

c000524c <flush>:
c000524c:	55                   	push   %ebp
c000524d:	89 e5                	mov    %esp,%ebp
c000524f:	83 ec 08             	sub    $0x8,%esp
c0005252:	8b 45 08             	mov    0x8(%ebp),%eax
c0005255:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000525b:	8b 40 0c             	mov    0xc(%eax),%eax
c000525e:	83 ec 0c             	sub    $0xc,%esp
c0005261:	50                   	push   %eax
c0005262:	e8 1e 00 00 00       	call   c0005285 <set_cursor>
c0005267:	83 c4 10             	add    $0x10,%esp
c000526a:	8b 45 08             	mov    0x8(%ebp),%eax
c000526d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005273:	8b 40 08             	mov    0x8(%eax),%eax
c0005276:	83 ec 0c             	sub    $0xc,%esp
c0005279:	50                   	push   %eax
c000527a:	e8 64 00 00 00       	call   c00052e3 <set_console_start_video_addr>
c000527f:	83 c4 10             	add    $0x10,%esp
c0005282:	90                   	nop
c0005283:	c9                   	leave  
c0005284:	c3                   	ret    

c0005285 <set_cursor>:
c0005285:	55                   	push   %ebp
c0005286:	89 e5                	mov    %esp,%ebp
c0005288:	83 ec 08             	sub    $0x8,%esp
c000528b:	83 ec 08             	sub    $0x8,%esp
c000528e:	6a 0e                	push   $0xe
c0005290:	68 d4 03 00 00       	push   $0x3d4
c0005295:	e8 0e c5 ff ff       	call   c00017a8 <out_byte>
c000529a:	83 c4 10             	add    $0x10,%esp
c000529d:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a0:	c1 e8 08             	shr    $0x8,%eax
c00052a3:	0f b7 c0             	movzwl %ax,%eax
c00052a6:	83 ec 08             	sub    $0x8,%esp
c00052a9:	50                   	push   %eax
c00052aa:	68 d5 03 00 00       	push   $0x3d5
c00052af:	e8 f4 c4 ff ff       	call   c00017a8 <out_byte>
c00052b4:	83 c4 10             	add    $0x10,%esp
c00052b7:	83 ec 08             	sub    $0x8,%esp
c00052ba:	6a 0f                	push   $0xf
c00052bc:	68 d4 03 00 00       	push   $0x3d4
c00052c1:	e8 e2 c4 ff ff       	call   c00017a8 <out_byte>
c00052c6:	83 c4 10             	add    $0x10,%esp
c00052c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00052cc:	0f b7 c0             	movzwl %ax,%eax
c00052cf:	83 ec 08             	sub    $0x8,%esp
c00052d2:	50                   	push   %eax
c00052d3:	68 d5 03 00 00       	push   $0x3d5
c00052d8:	e8 cb c4 ff ff       	call   c00017a8 <out_byte>
c00052dd:	83 c4 10             	add    $0x10,%esp
c00052e0:	90                   	nop
c00052e1:	c9                   	leave  
c00052e2:	c3                   	ret    

c00052e3 <set_console_start_video_addr>:
c00052e3:	55                   	push   %ebp
c00052e4:	89 e5                	mov    %esp,%ebp
c00052e6:	83 ec 08             	sub    $0x8,%esp
c00052e9:	83 ec 08             	sub    $0x8,%esp
c00052ec:	6a 0c                	push   $0xc
c00052ee:	68 d4 03 00 00       	push   $0x3d4
c00052f3:	e8 b0 c4 ff ff       	call   c00017a8 <out_byte>
c00052f8:	83 c4 10             	add    $0x10,%esp
c00052fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00052fe:	c1 e8 08             	shr    $0x8,%eax
c0005301:	0f b7 c0             	movzwl %ax,%eax
c0005304:	83 ec 08             	sub    $0x8,%esp
c0005307:	50                   	push   %eax
c0005308:	68 d5 03 00 00       	push   $0x3d5
c000530d:	e8 96 c4 ff ff       	call   c00017a8 <out_byte>
c0005312:	83 c4 10             	add    $0x10,%esp
c0005315:	83 ec 08             	sub    $0x8,%esp
c0005318:	6a 0d                	push   $0xd
c000531a:	68 d4 03 00 00       	push   $0x3d4
c000531f:	e8 84 c4 ff ff       	call   c00017a8 <out_byte>
c0005324:	83 c4 10             	add    $0x10,%esp
c0005327:	8b 45 08             	mov    0x8(%ebp),%eax
c000532a:	0f b7 c0             	movzwl %ax,%eax
c000532d:	83 ec 08             	sub    $0x8,%esp
c0005330:	50                   	push   %eax
c0005331:	68 d5 03 00 00       	push   $0x3d5
c0005336:	e8 6d c4 ff ff       	call   c00017a8 <out_byte>
c000533b:	83 c4 10             	add    $0x10,%esp
c000533e:	90                   	nop
c000533f:	c9                   	leave  
c0005340:	c3                   	ret    

c0005341 <put_key>:
c0005341:	55                   	push   %ebp
c0005342:	89 e5                	mov    %esp,%ebp
c0005344:	83 ec 04             	sub    $0x4,%esp
c0005347:	8b 45 0c             	mov    0xc(%ebp),%eax
c000534a:	88 45 fc             	mov    %al,-0x4(%ebp)
c000534d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005350:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005356:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c000535b:	77 4d                	ja     c00053aa <put_key+0x69>
c000535d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005360:	8b 00                	mov    (%eax),%eax
c0005362:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0005366:	89 10                	mov    %edx,(%eax)
c0005368:	8b 45 08             	mov    0x8(%ebp),%eax
c000536b:	8b 00                	mov    (%eax),%eax
c000536d:	8d 50 04             	lea    0x4(%eax),%edx
c0005370:	8b 45 08             	mov    0x8(%ebp),%eax
c0005373:	89 10                	mov    %edx,(%eax)
c0005375:	8b 45 08             	mov    0x8(%ebp),%eax
c0005378:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000537e:	8d 50 01             	lea    0x1(%eax),%edx
c0005381:	8b 45 08             	mov    0x8(%ebp),%eax
c0005384:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000538a:	8b 45 08             	mov    0x8(%ebp),%eax
c000538d:	8b 00                	mov    (%eax),%eax
c000538f:	8b 55 08             	mov    0x8(%ebp),%edx
c0005392:	83 c2 08             	add    $0x8,%edx
c0005395:	81 c2 00 08 00 00    	add    $0x800,%edx
c000539b:	39 d0                	cmp    %edx,%eax
c000539d:	75 0b                	jne    c00053aa <put_key+0x69>
c000539f:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a2:	8d 50 08             	lea    0x8(%eax),%edx
c00053a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a8:	89 10                	mov    %edx,(%eax)
c00053aa:	90                   	nop
c00053ab:	c9                   	leave  
c00053ac:	c3                   	ret    

c00053ad <scroll_up>:
c00053ad:	55                   	push   %ebp
c00053ae:	89 e5                	mov    %esp,%ebp
c00053b0:	83 ec 08             	sub    $0x8,%esp
c00053b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053bc:	8b 40 08             	mov    0x8(%eax),%eax
c00053bf:	8d 50 b0             	lea    -0x50(%eax),%edx
c00053c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00053c5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053cb:	8b 00                	mov    (%eax),%eax
c00053cd:	39 c2                	cmp    %eax,%edx
c00053cf:	76 1b                	jbe    c00053ec <scroll_up+0x3f>
c00053d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053da:	8b 40 08             	mov    0x8(%eax),%eax
c00053dd:	83 e8 50             	sub    $0x50,%eax
c00053e0:	83 ec 0c             	sub    $0xc,%esp
c00053e3:	50                   	push   %eax
c00053e4:	e8 fa fe ff ff       	call   c00052e3 <set_console_start_video_addr>
c00053e9:	83 c4 10             	add    $0x10,%esp
c00053ec:	90                   	nop
c00053ed:	c9                   	leave  
c00053ee:	c3                   	ret    

c00053ef <scroll_down>:
c00053ef:	55                   	push   %ebp
c00053f0:	89 e5                	mov    %esp,%ebp
c00053f2:	83 ec 08             	sub    $0x8,%esp
c00053f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00053f8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053fe:	8b 40 08             	mov    0x8(%eax),%eax
c0005401:	8d 48 50             	lea    0x50(%eax),%ecx
c0005404:	8b 45 08             	mov    0x8(%ebp),%eax
c0005407:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000540d:	8b 10                	mov    (%eax),%edx
c000540f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005412:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005418:	8b 40 04             	mov    0x4(%eax),%eax
c000541b:	01 d0                	add    %edx,%eax
c000541d:	39 c1                	cmp    %eax,%ecx
c000541f:	73 36                	jae    c0005457 <scroll_down+0x68>
c0005421:	8b 45 08             	mov    0x8(%ebp),%eax
c0005424:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000542a:	8b 40 08             	mov    0x8(%eax),%eax
c000542d:	83 c0 50             	add    $0x50,%eax
c0005430:	83 ec 0c             	sub    $0xc,%esp
c0005433:	50                   	push   %eax
c0005434:	e8 aa fe ff ff       	call   c00052e3 <set_console_start_video_addr>
c0005439:	83 c4 10             	add    $0x10,%esp
c000543c:	8b 45 08             	mov    0x8(%ebp),%eax
c000543f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005445:	8b 50 08             	mov    0x8(%eax),%edx
c0005448:	8b 45 08             	mov    0x8(%ebp),%eax
c000544b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005451:	83 c2 50             	add    $0x50,%edx
c0005454:	89 50 08             	mov    %edx,0x8(%eax)
c0005457:	90                   	nop
c0005458:	c9                   	leave  
c0005459:	c3                   	ret    

c000545a <out_char>:
c000545a:	55                   	push   %ebp
c000545b:	89 e5                	mov    %esp,%ebp
c000545d:	83 ec 28             	sub    $0x28,%esp
c0005460:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005463:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0005466:	e8 f3 26 00 00       	call   c0007b5e <intr_disable>
c000546b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000546e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005471:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005477:	8b 40 0c             	mov    0xc(%eax),%eax
c000547a:	05 00 c0 05 60       	add    $0x6005c000,%eax
c000547f:	01 c0                	add    %eax,%eax
c0005481:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005484:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0005488:	83 f8 08             	cmp    $0x8,%eax
c000548b:	0f 84 8d 00 00 00    	je     c000551e <out_char+0xc4>
c0005491:	83 f8 0a             	cmp    $0xa,%eax
c0005494:	0f 85 c9 00 00 00    	jne    c0005563 <out_char+0x109>
c000549a:	8b 45 08             	mov    0x8(%ebp),%eax
c000549d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054a3:	8b 50 0c             	mov    0xc(%eax),%edx
c00054a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00054a9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054af:	8b 08                	mov    (%eax),%ecx
c00054b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054ba:	8b 40 04             	mov    0x4(%eax),%eax
c00054bd:	01 c8                	add    %ecx,%eax
c00054bf:	83 e8 50             	sub    $0x50,%eax
c00054c2:	39 c2                	cmp    %eax,%edx
c00054c4:	0f 83 f4 00 00 00    	jae    c00055be <out_char+0x164>
c00054ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00054cd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054d3:	8b 08                	mov    (%eax),%ecx
c00054d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00054d8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054de:	8b 50 0c             	mov    0xc(%eax),%edx
c00054e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00054e4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054ea:	8b 00                	mov    (%eax),%eax
c00054ec:	29 c2                	sub    %eax,%edx
c00054ee:	89 d0                	mov    %edx,%eax
c00054f0:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00054f5:	f7 e2                	mul    %edx
c00054f7:	89 d0                	mov    %edx,%eax
c00054f9:	c1 e8 06             	shr    $0x6,%eax
c00054fc:	8d 50 01             	lea    0x1(%eax),%edx
c00054ff:	89 d0                	mov    %edx,%eax
c0005501:	c1 e0 02             	shl    $0x2,%eax
c0005504:	01 d0                	add    %edx,%eax
c0005506:	c1 e0 04             	shl    $0x4,%eax
c0005509:	89 c2                	mov    %eax,%edx
c000550b:	8b 45 08             	mov    0x8(%ebp),%eax
c000550e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005514:	01 ca                	add    %ecx,%edx
c0005516:	89 50 0c             	mov    %edx,0xc(%eax)
c0005519:	e9 a0 00 00 00       	jmp    c00055be <out_char+0x164>
c000551e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005521:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005527:	8b 50 0c             	mov    0xc(%eax),%edx
c000552a:	8b 45 08             	mov    0x8(%ebp),%eax
c000552d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005533:	8b 00                	mov    (%eax),%eax
c0005535:	39 c2                	cmp    %eax,%edx
c0005537:	0f 86 84 00 00 00    	jbe    c00055c1 <out_char+0x167>
c000553d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005540:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005546:	8b 50 0c             	mov    0xc(%eax),%edx
c0005549:	83 ea 01             	sub    $0x1,%edx
c000554c:	89 50 0c             	mov    %edx,0xc(%eax)
c000554f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005552:	83 e8 02             	sub    $0x2,%eax
c0005555:	c6 00 20             	movb   $0x20,(%eax)
c0005558:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000555b:	83 e8 01             	sub    $0x1,%eax
c000555e:	c6 00 00             	movb   $0x0,(%eax)
c0005561:	eb 5e                	jmp    c00055c1 <out_char+0x167>
c0005563:	8b 45 08             	mov    0x8(%ebp),%eax
c0005566:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000556c:	8b 40 0c             	mov    0xc(%eax),%eax
c000556f:	8d 48 01             	lea    0x1(%eax),%ecx
c0005572:	8b 45 08             	mov    0x8(%ebp),%eax
c0005575:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000557b:	8b 10                	mov    (%eax),%edx
c000557d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005580:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005586:	8b 40 04             	mov    0x4(%eax),%eax
c0005589:	01 d0                	add    %edx,%eax
c000558b:	39 c1                	cmp    %eax,%ecx
c000558d:	73 35                	jae    c00055c4 <out_char+0x16a>
c000558f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005592:	8d 50 01             	lea    0x1(%eax),%edx
c0005595:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005598:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c000559c:	88 10                	mov    %dl,(%eax)
c000559e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055a1:	8d 50 01             	lea    0x1(%eax),%edx
c00055a4:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00055a7:	c6 00 0a             	movb   $0xa,(%eax)
c00055aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00055ad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055b3:	8b 50 0c             	mov    0xc(%eax),%edx
c00055b6:	83 c2 01             	add    $0x1,%edx
c00055b9:	89 50 0c             	mov    %edx,0xc(%eax)
c00055bc:	eb 06                	jmp    c00055c4 <out_char+0x16a>
c00055be:	90                   	nop
c00055bf:	eb 14                	jmp    c00055d5 <out_char+0x17b>
c00055c1:	90                   	nop
c00055c2:	eb 11                	jmp    c00055d5 <out_char+0x17b>
c00055c4:	90                   	nop
c00055c5:	eb 0e                	jmp    c00055d5 <out_char+0x17b>
c00055c7:	83 ec 0c             	sub    $0xc,%esp
c00055ca:	ff 75 08             	pushl  0x8(%ebp)
c00055cd:	e8 1d fe ff ff       	call   c00053ef <scroll_down>
c00055d2:	83 c4 10             	add    $0x10,%esp
c00055d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00055d8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055de:	8b 50 0c             	mov    0xc(%eax),%edx
c00055e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00055e4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055ea:	8b 40 08             	mov    0x8(%eax),%eax
c00055ed:	29 c2                	sub    %eax,%edx
c00055ef:	89 d0                	mov    %edx,%eax
c00055f1:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00055f6:	77 cf                	ja     c00055c7 <out_char+0x16d>
c00055f8:	83 ec 0c             	sub    $0xc,%esp
c00055fb:	ff 75 08             	pushl  0x8(%ebp)
c00055fe:	e8 49 fc ff ff       	call   c000524c <flush>
c0005603:	83 c4 10             	add    $0x10,%esp
c0005606:	83 ec 0c             	sub    $0xc,%esp
c0005609:	ff 75 f4             	pushl  -0xc(%ebp)
c000560c:	e8 76 25 00 00       	call   c0007b87 <intr_set_status>
c0005611:	83 c4 10             	add    $0x10,%esp
c0005614:	90                   	nop
c0005615:	c9                   	leave  
c0005616:	c3                   	ret    

c0005617 <tty_dev_read>:
c0005617:	55                   	push   %ebp
c0005618:	89 e5                	mov    %esp,%ebp
c000561a:	83 ec 08             	sub    $0x8,%esp
c000561d:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005622:	39 45 08             	cmp    %eax,0x8(%ebp)
c0005625:	75 17                	jne    c000563e <tty_dev_read+0x27>
c0005627:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c000562c:	85 c0                	test   %eax,%eax
c000562e:	7e 0e                	jle    c000563e <tty_dev_read+0x27>
c0005630:	83 ec 0c             	sub    $0xc,%esp
c0005633:	ff 75 08             	pushl  0x8(%ebp)
c0005636:	e8 79 07 00 00       	call   c0005db4 <keyboard_read>
c000563b:	83 c4 10             	add    $0x10,%esp
c000563e:	90                   	nop
c000563f:	c9                   	leave  
c0005640:	c3                   	ret    

c0005641 <tty_dev_write>:
c0005641:	55                   	push   %ebp
c0005642:	89 e5                	mov    %esp,%ebp
c0005644:	83 ec 28             	sub    $0x28,%esp
c0005647:	8b 45 08             	mov    0x8(%ebp),%eax
c000564a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005650:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005653:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000565a:	e9 88 01 00 00       	jmp    c00057e7 <tty_dev_write+0x1a6>
c000565f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005662:	8b 40 04             	mov    0x4(%eax),%eax
c0005665:	8b 00                	mov    (%eax),%eax
c0005667:	88 45 e7             	mov    %al,-0x19(%ebp)
c000566a:	8b 45 08             	mov    0x8(%ebp),%eax
c000566d:	8b 40 04             	mov    0x4(%eax),%eax
c0005670:	8d 50 04             	lea    0x4(%eax),%edx
c0005673:	8b 45 08             	mov    0x8(%ebp),%eax
c0005676:	89 50 04             	mov    %edx,0x4(%eax)
c0005679:	8b 45 08             	mov    0x8(%ebp),%eax
c000567c:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005682:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005685:	8b 45 08             	mov    0x8(%ebp),%eax
c0005688:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000568e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005691:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005697:	8d 50 01             	lea    0x1(%eax),%edx
c000569a:	8b 45 08             	mov    0x8(%ebp),%eax
c000569d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00056a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00056a6:	8b 40 04             	mov    0x4(%eax),%eax
c00056a9:	8b 55 08             	mov    0x8(%ebp),%edx
c00056ac:	83 c2 08             	add    $0x8,%edx
c00056af:	81 c2 00 08 00 00    	add    $0x800,%edx
c00056b5:	39 d0                	cmp    %edx,%eax
c00056b7:	75 0c                	jne    c00056c5 <tty_dev_write+0x84>
c00056b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00056bc:	8d 50 08             	lea    0x8(%eax),%edx
c00056bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00056c2:	89 50 04             	mov    %edx,0x4(%eax)
c00056c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00056c8:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00056ce:	85 c0                	test   %eax,%eax
c00056d0:	0f 84 11 01 00 00    	je     c00057e7 <tty_dev_write+0x1a6>
c00056d6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056da:	3c 20                	cmp    $0x20,%al
c00056dc:	76 08                	jbe    c00056e6 <tty_dev_write+0xa5>
c00056de:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056e2:	3c 7e                	cmp    $0x7e,%al
c00056e4:	76 10                	jbe    c00056f6 <tty_dev_write+0xb5>
c00056e6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056ea:	3c 20                	cmp    $0x20,%al
c00056ec:	74 08                	je     c00056f6 <tty_dev_write+0xb5>
c00056ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00056f2:	84 c0                	test   %al,%al
c00056f4:	75 58                	jne    c000574e <tty_dev_write+0x10d>
c00056f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00056f9:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00056ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005702:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005708:	01 d0                	add    %edx,%eax
c000570a:	83 e8 01             	sub    $0x1,%eax
c000570d:	89 c2                	mov    %eax,%edx
c000570f:	83 ec 04             	sub    $0x4,%esp
c0005712:	6a 01                	push   $0x1
c0005714:	8d 45 e7             	lea    -0x19(%ebp),%eax
c0005717:	50                   	push   %eax
c0005718:	52                   	push   %edx
c0005719:	e8 a4 24 00 00       	call   c0007bc2 <Memcpy>
c000571e:	83 c4 10             	add    $0x10,%esp
c0005721:	8b 45 08             	mov    0x8(%ebp),%eax
c0005724:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000572a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000572d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005730:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005736:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000573a:	0f b6 c0             	movzbl %al,%eax
c000573d:	83 ec 08             	sub    $0x8,%esp
c0005740:	50                   	push   %eax
c0005741:	ff 75 08             	pushl  0x8(%ebp)
c0005744:	e8 11 fd ff ff       	call   c000545a <out_char>
c0005749:	83 c4 10             	add    $0x10,%esp
c000574c:	eb 7c                	jmp    c00057ca <tty_dev_write+0x189>
c000574e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005752:	3c 08                	cmp    $0x8,%al
c0005754:	75 42                	jne    c0005798 <tty_dev_write+0x157>
c0005756:	8b 45 08             	mov    0x8(%ebp),%eax
c0005759:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000575f:	8d 50 01             	lea    0x1(%eax),%edx
c0005762:	8b 45 08             	mov    0x8(%ebp),%eax
c0005765:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000576b:	8b 45 08             	mov    0x8(%ebp),%eax
c000576e:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005774:	8d 50 fe             	lea    -0x2(%eax),%edx
c0005777:	8b 45 08             	mov    0x8(%ebp),%eax
c000577a:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005780:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005784:	0f b6 c0             	movzbl %al,%eax
c0005787:	83 ec 08             	sub    $0x8,%esp
c000578a:	50                   	push   %eax
c000578b:	ff 75 08             	pushl  0x8(%ebp)
c000578e:	e8 c7 fc ff ff       	call   c000545a <out_char>
c0005793:	83 c4 10             	add    $0x10,%esp
c0005796:	eb 32                	jmp    c00057ca <tty_dev_write+0x189>
c0005798:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000579c:	3c 0a                	cmp    $0xa,%al
c000579e:	75 2a                	jne    c00057ca <tty_dev_write+0x189>
c00057a0:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00057a4:	0f b6 c0             	movzbl %al,%eax
c00057a7:	83 ec 08             	sub    $0x8,%esp
c00057aa:	50                   	push   %eax
c00057ab:	ff 75 08             	pushl  0x8(%ebp)
c00057ae:	e8 a7 fc ff ff       	call   c000545a <out_char>
c00057b3:	83 c4 10             	add    $0x10,%esp
c00057b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00057b9:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c00057c0:	00 00 00 
c00057c3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00057ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00057cd:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00057d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00057d6:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00057dc:	39 c2                	cmp    %eax,%edx
c00057de:	75 07                	jne    c00057e7 <tty_dev_write+0x1a6>
c00057e0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00057e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00057ea:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00057f0:	85 c0                	test   %eax,%eax
c00057f2:	0f 85 67 fe ff ff    	jne    c000565f <tty_dev_write+0x1e>
c00057f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00057fc:	74 5c                	je     c000585a <tty_dev_write+0x219>
c00057fe:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c0005805:	83 ec 0c             	sub    $0xc,%esp
c0005808:	ff 75 ec             	pushl  -0x14(%ebp)
c000580b:	e8 a4 d1 ff ff       	call   c00029b4 <sys_malloc>
c0005810:	83 c4 10             	add    $0x10,%esp
c0005813:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005816:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005819:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c0005820:	8b 45 08             	mov    0x8(%ebp),%eax
c0005823:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005829:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000582c:	89 50 50             	mov    %edx,0x50(%eax)
c000582f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005832:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0005838:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000583b:	89 50 58             	mov    %edx,0x58(%eax)
c000583e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005841:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005847:	83 ec 04             	sub    $0x4,%esp
c000584a:	50                   	push   %eax
c000584b:	ff 75 e8             	pushl  -0x18(%ebp)
c000584e:	6a 01                	push   $0x1
c0005850:	e8 92 46 00 00       	call   c0009ee7 <send_rec>
c0005855:	83 c4 10             	add    $0x10,%esp
c0005858:	eb 01                	jmp    c000585b <tty_dev_write+0x21a>
c000585a:	90                   	nop
c000585b:	c9                   	leave  
c000585c:	c3                   	ret    

c000585d <tty_do_read>:
c000585d:	55                   	push   %ebp
c000585e:	89 e5                	mov    %esp,%ebp
c0005860:	83 ec 08             	sub    $0x8,%esp
c0005863:	8b 45 08             	mov    0x8(%ebp),%eax
c0005866:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000586d:	00 00 00 
c0005870:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005873:	8b 50 58             	mov    0x58(%eax),%edx
c0005876:	8b 45 08             	mov    0x8(%ebp),%eax
c0005879:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c000587f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005882:	8b 00                	mov    (%eax),%eax
c0005884:	89 c2                	mov    %eax,%edx
c0005886:	8b 45 08             	mov    0x8(%ebp),%eax
c0005889:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000588f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005892:	8b 50 50             	mov    0x50(%eax),%edx
c0005895:	8b 45 08             	mov    0x8(%ebp),%eax
c0005898:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000589e:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058a1:	8b 50 50             	mov    0x50(%eax),%edx
c00058a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00058a7:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00058ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00058b0:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c00058b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058b9:	8b 40 10             	mov    0x10(%eax),%eax
c00058bc:	83 ec 08             	sub    $0x8,%esp
c00058bf:	52                   	push   %edx
c00058c0:	50                   	push   %eax
c00058c1:	e8 4b 18 00 00       	call   c0007111 <alloc_virtual_memory>
c00058c6:	83 c4 10             	add    $0x10,%esp
c00058c9:	89 c2                	mov    %eax,%edx
c00058cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00058ce:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00058d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00058d7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00058dd:	83 f8 02             	cmp    $0x2,%eax
c00058e0:	74 1c                	je     c00058fe <tty_do_read+0xa1>
c00058e2:	68 39 01 00 00       	push   $0x139
c00058e7:	68 6b b2 00 c0       	push   $0xc000b26b
c00058ec:	68 6b b2 00 c0       	push   $0xc000b26b
c00058f1:	68 75 b2 00 c0       	push   $0xc000b275
c00058f6:	e8 7c 3d 00 00       	call   c0009677 <assertion_failure>
c00058fb:	83 c4 10             	add    $0x10,%esp
c00058fe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005901:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c0005908:	8b 45 08             	mov    0x8(%ebp),%eax
c000590b:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005911:	83 ec 04             	sub    $0x4,%esp
c0005914:	50                   	push   %eax
c0005915:	ff 75 0c             	pushl  0xc(%ebp)
c0005918:	6a 01                	push   $0x1
c000591a:	e8 c8 45 00 00       	call   c0009ee7 <send_rec>
c000591f:	83 c4 10             	add    $0x10,%esp
c0005922:	90                   	nop
c0005923:	c9                   	leave  
c0005924:	c3                   	ret    

c0005925 <tty_do_write>:
c0005925:	55                   	push   %ebp
c0005926:	89 e5                	mov    %esp,%ebp
c0005928:	53                   	push   %ebx
c0005929:	83 ec 24             	sub    $0x24,%esp
c000592c:	89 e0                	mov    %esp,%eax
c000592e:	89 c3                	mov    %eax,%ebx
c0005930:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0005937:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000593a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000593d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005940:	89 c2                	mov    %eax,%edx
c0005942:	b8 10 00 00 00       	mov    $0x10,%eax
c0005947:	83 e8 01             	sub    $0x1,%eax
c000594a:	01 d0                	add    %edx,%eax
c000594c:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005951:	ba 00 00 00 00       	mov    $0x0,%edx
c0005956:	f7 f1                	div    %ecx
c0005958:	6b c0 10             	imul   $0x10,%eax,%eax
c000595b:	29 c4                	sub    %eax,%esp
c000595d:	89 e0                	mov    %esp,%eax
c000595f:	83 c0 00             	add    $0x0,%eax
c0005962:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005965:	83 ec 04             	sub    $0x4,%esp
c0005968:	ff 75 e8             	pushl  -0x18(%ebp)
c000596b:	6a 00                	push   $0x0
c000596d:	ff 75 e0             	pushl  -0x20(%ebp)
c0005970:	e8 36 61 00 00       	call   c000baab <Memset>
c0005975:	83 c4 10             	add    $0x10,%esp
c0005978:	8b 45 0c             	mov    0xc(%ebp),%eax
c000597b:	8b 40 50             	mov    0x50(%eax),%eax
c000597e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005981:	8b 45 08             	mov    0x8(%ebp),%eax
c0005984:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000598b:	00 00 00 
c000598e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005991:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005994:	8b 40 10             	mov    0x10(%eax),%eax
c0005997:	83 ec 08             	sub    $0x8,%esp
c000599a:	52                   	push   %edx
c000599b:	50                   	push   %eax
c000599c:	e8 70 17 00 00       	call   c0007111 <alloc_virtual_memory>
c00059a1:	83 c4 10             	add    $0x10,%esp
c00059a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00059a7:	eb 7e                	jmp    c0005a27 <tty_do_write+0x102>
c00059a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00059ac:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00059af:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c00059b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00059b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00059b9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00059bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00059c2:	01 d0                	add    %edx,%eax
c00059c4:	83 ec 04             	sub    $0x4,%esp
c00059c7:	ff 75 f0             	pushl  -0x10(%ebp)
c00059ca:	50                   	push   %eax
c00059cb:	ff 75 e0             	pushl  -0x20(%ebp)
c00059ce:	e8 ef 21 00 00       	call   c0007bc2 <Memcpy>
c00059d3:	83 c4 10             	add    $0x10,%esp
c00059d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059d9:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00059dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00059df:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00059e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059e8:	01 c2                	add    %eax,%edx
c00059ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00059ed:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00059f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00059fa:	eb 25                	jmp    c0005a21 <tty_do_write+0xfc>
c00059fc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00059ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a02:	01 d0                	add    %edx,%eax
c0005a04:	0f b6 00             	movzbl (%eax),%eax
c0005a07:	0f b6 c0             	movzbl %al,%eax
c0005a0a:	83 ec 08             	sub    $0x8,%esp
c0005a0d:	50                   	push   %eax
c0005a0e:	ff 75 08             	pushl  0x8(%ebp)
c0005a11:	e8 44 fa ff ff       	call   c000545a <out_char>
c0005a16:	83 c4 10             	add    $0x10,%esp
c0005a19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005a1d:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005a21:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005a25:	75 d5                	jne    c00059fc <tty_do_write+0xd7>
c0005a27:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005a2b:	0f 85 78 ff ff ff    	jne    c00059a9 <tty_do_write+0x84>
c0005a31:	83 ec 0c             	sub    $0xc,%esp
c0005a34:	6a 6c                	push   $0x6c
c0005a36:	e8 79 cf ff ff       	call   c00029b4 <sys_malloc>
c0005a3b:	83 c4 10             	add    $0x10,%esp
c0005a3e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005a41:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a44:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0005a4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a4e:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005a54:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a57:	89 50 48             	mov    %edx,0x48(%eax)
c0005a5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a5d:	8b 00                	mov    (%eax),%eax
c0005a5f:	83 ec 04             	sub    $0x4,%esp
c0005a62:	50                   	push   %eax
c0005a63:	ff 75 d8             	pushl  -0x28(%ebp)
c0005a66:	6a 01                	push   $0x1
c0005a68:	e8 7a 44 00 00       	call   c0009ee7 <send_rec>
c0005a6d:	83 c4 10             	add    $0x10,%esp
c0005a70:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a73:	83 ec 08             	sub    $0x8,%esp
c0005a76:	6a 6c                	push   $0x6c
c0005a78:	50                   	push   %eax
c0005a79:	e8 1d 1c 00 00       	call   c000769b <sys_free>
c0005a7e:	83 c4 10             	add    $0x10,%esp
c0005a81:	89 dc                	mov    %ebx,%esp
c0005a83:	90                   	nop
c0005a84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005a87:	c9                   	leave  
c0005a88:	c3                   	ret    

c0005a89 <init_screen>:
c0005a89:	55                   	push   %ebp
c0005a8a:	89 e5                	mov    %esp,%ebp
c0005a8c:	83 ec 10             	sub    $0x10,%esp
c0005a8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a92:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005a97:	c1 f8 03             	sar    $0x3,%eax
c0005a9a:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005aa0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005aa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005aa6:	c1 e0 04             	shl    $0x4,%eax
c0005aa9:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c0005aaf:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ab2:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005ab8:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005abf:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ac2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005ac8:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0005acb:	89 50 04             	mov    %edx,0x4(%eax)
c0005ace:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ad1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005ad7:	8b 50 04             	mov    0x4(%eax),%edx
c0005ada:	8b 45 08             	mov    0x8(%ebp),%eax
c0005add:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005ae3:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0005ae7:	89 10                	mov    %edx,(%eax)
c0005ae9:	8b 45 08             	mov    0x8(%ebp),%eax
c0005aec:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0005af2:	8b 45 08             	mov    0x8(%ebp),%eax
c0005af5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005afb:	8b 12                	mov    (%edx),%edx
c0005afd:	89 50 08             	mov    %edx,0x8(%eax)
c0005b00:	8b 55 08             	mov    0x8(%ebp),%edx
c0005b03:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c0005b09:	8b 40 08             	mov    0x8(%eax),%eax
c0005b0c:	89 42 0c             	mov    %eax,0xc(%edx)
c0005b0f:	90                   	nop
c0005b10:	c9                   	leave  
c0005b11:	c3                   	ret    

c0005b12 <init_tty>:
c0005b12:	55                   	push   %ebp
c0005b13:	89 e5                	mov    %esp,%ebp
c0005b15:	83 ec 18             	sub    $0x18,%esp
c0005b18:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005b1f:	e9 92 00 00 00       	jmp    c0005bb6 <init_tty+0xa4>
c0005b24:	83 ec 04             	sub    $0x4,%esp
c0005b27:	68 28 08 00 00       	push   $0x828
c0005b2c:	6a 00                	push   $0x0
c0005b2e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b31:	e8 75 5f 00 00       	call   c000baab <Memset>
c0005b36:	83 c4 10             	add    $0x10,%esp
c0005b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b3c:	8d 50 08             	lea    0x8(%eax),%edx
c0005b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b42:	89 50 04             	mov    %edx,0x4(%eax)
c0005b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b48:	8b 50 04             	mov    0x4(%eax),%edx
c0005b4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b4e:	89 10                	mov    %edx,(%eax)
c0005b50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b53:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005b5a:	00 00 00 
c0005b5d:	83 ec 0c             	sub    $0xc,%esp
c0005b60:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b63:	e8 21 ff ff ff       	call   c0005a89 <init_screen>
c0005b68:	83 c4 10             	add    $0x10,%esp
c0005b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b6e:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005b73:	85 c0                	test   %eax,%eax
c0005b75:	7e 38                	jle    c0005baf <init_tty+0x9d>
c0005b77:	83 ec 08             	sub    $0x8,%esp
c0005b7a:	6a 23                	push   $0x23
c0005b7c:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b7f:	e8 d6 f8 ff ff       	call   c000545a <out_char>
c0005b84:	83 c4 10             	add    $0x10,%esp
c0005b87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b8a:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005b8f:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005b94:	c1 f8 03             	sar    $0x3,%eax
c0005b97:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005b9d:	0f b6 c0             	movzbl %al,%eax
c0005ba0:	83 ec 08             	sub    $0x8,%esp
c0005ba3:	50                   	push   %eax
c0005ba4:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ba7:	e8 ae f8 ff ff       	call   c000545a <out_char>
c0005bac:	83 c4 10             	add    $0x10,%esp
c0005baf:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005bb6:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005bbb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005bbe:	0f 82 60 ff ff ff    	jb     c0005b24 <init_tty+0x12>
c0005bc4:	90                   	nop
c0005bc5:	c9                   	leave  
c0005bc6:	c3                   	ret    

c0005bc7 <TaskTTY>:
c0005bc7:	55                   	push   %ebp
c0005bc8:	89 e5                	mov    %esp,%ebp
c0005bca:	83 ec 28             	sub    $0x28,%esp
c0005bcd:	e8 40 ff ff ff       	call   c0005b12 <init_tty>
c0005bd2:	83 ec 0c             	sub    $0xc,%esp
c0005bd5:	6a 00                	push   $0x0
c0005bd7:	e8 34 f6 ff ff       	call   c0005210 <select_console>
c0005bdc:	83 c4 10             	add    $0x10,%esp
c0005bdf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005be6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005bed:	83 ec 0c             	sub    $0xc,%esp
c0005bf0:	6a 6c                	push   $0x6c
c0005bf2:	e8 bd cd ff ff       	call   c00029b4 <sys_malloc>
c0005bf7:	83 c4 10             	add    $0x10,%esp
c0005bfa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005bfd:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005c04:	eb 30                	jmp    c0005c36 <TaskTTY+0x6f>
c0005c06:	83 ec 0c             	sub    $0xc,%esp
c0005c09:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c0c:	e8 06 fa ff ff       	call   c0005617 <tty_dev_read>
c0005c11:	83 c4 10             	add    $0x10,%esp
c0005c14:	83 ec 0c             	sub    $0xc,%esp
c0005c17:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c1a:	e8 22 fa ff ff       	call   c0005641 <tty_dev_write>
c0005c1f:	83 c4 10             	add    $0x10,%esp
c0005c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c25:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005c2b:	85 c0                	test   %eax,%eax
c0005c2d:	75 d7                	jne    c0005c06 <TaskTTY+0x3f>
c0005c2f:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005c36:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005c3b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005c3e:	72 c6                	jb     c0005c06 <TaskTTY+0x3f>
c0005c40:	83 ec 04             	sub    $0x4,%esp
c0005c43:	6a 12                	push   $0x12
c0005c45:	ff 75 e8             	pushl  -0x18(%ebp)
c0005c48:	6a 02                	push   $0x2
c0005c4a:	e8 98 42 00 00       	call   c0009ee7 <send_rec>
c0005c4f:	83 c4 10             	add    $0x10,%esp
c0005c52:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005c55:	8b 40 68             	mov    0x68(%eax),%eax
c0005c58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005c5b:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005c62:	74 28                	je     c0005c8c <TaskTTY+0xc5>
c0005c64:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005c6b:	7f 0b                	jg     c0005c78 <TaskTTY+0xb1>
c0005c6d:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005c74:	74 4e                	je     c0005cc4 <TaskTTY+0xfd>
c0005c76:	eb 4d                	jmp    c0005cc5 <TaskTTY+0xfe>
c0005c78:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005c7f:	74 21                	je     c0005ca2 <TaskTTY+0xdb>
c0005c81:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005c88:	74 2e                	je     c0005cb8 <TaskTTY+0xf1>
c0005c8a:	eb 39                	jmp    c0005cc5 <TaskTTY+0xfe>
c0005c8c:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005c91:	83 ec 08             	sub    $0x8,%esp
c0005c94:	ff 75 e8             	pushl  -0x18(%ebp)
c0005c97:	50                   	push   %eax
c0005c98:	e8 c0 fb ff ff       	call   c000585d <tty_do_read>
c0005c9d:	83 c4 10             	add    $0x10,%esp
c0005ca0:	eb 23                	jmp    c0005cc5 <TaskTTY+0xfe>
c0005ca2:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005ca7:	83 ec 08             	sub    $0x8,%esp
c0005caa:	ff 75 e8             	pushl  -0x18(%ebp)
c0005cad:	50                   	push   %eax
c0005cae:	e8 72 fc ff ff       	call   c0005925 <tty_do_write>
c0005cb3:	83 c4 10             	add    $0x10,%esp
c0005cb6:	eb 0d                	jmp    c0005cc5 <TaskTTY+0xfe>
c0005cb8:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005cbf:	00 00 00 
c0005cc2:	eb 01                	jmp    c0005cc5 <TaskTTY+0xfe>
c0005cc4:	90                   	nop
c0005cc5:	e9 33 ff ff ff       	jmp    c0005bfd <TaskTTY+0x36>

c0005cca <keyboard_handler>:
c0005cca:	55                   	push   %ebp
c0005ccb:	89 e5                	mov    %esp,%ebp
c0005ccd:	83 ec 18             	sub    $0x18,%esp
c0005cd0:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c0005cd7:	00 00 00 
c0005cda:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005ce1:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005ce6:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005ceb:	7f 5e                	jg     c0005d4b <keyboard_handler+0x81>
c0005ced:	e8 d8 ba ff ff       	call   c00017ca <disable_int>
c0005cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cf5:	0f b7 c0             	movzwl %ax,%eax
c0005cf8:	83 ec 0c             	sub    $0xc,%esp
c0005cfb:	50                   	push   %eax
c0005cfc:	e8 9b ba ff ff       	call   c000179c <in_byte>
c0005d01:	83 c4 10             	add    $0x10,%esp
c0005d04:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005d07:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d0c:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005d10:	88 10                	mov    %dl,(%eax)
c0005d12:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d17:	83 c0 01             	add    $0x1,%eax
c0005d1a:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005d1f:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d24:	83 c0 01             	add    $0x1,%eax
c0005d27:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005d2c:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005d31:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005d36:	39 d0                	cmp    %edx,%eax
c0005d38:	72 0a                	jb     c0005d44 <keyboard_handler+0x7a>
c0005d3a:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005d41:	0b 01 c0 
c0005d44:	e8 83 ba ff ff       	call   c00017cc <enable_int>
c0005d49:	eb 01                	jmp    c0005d4c <keyboard_handler+0x82>
c0005d4b:	90                   	nop
c0005d4c:	c9                   	leave  
c0005d4d:	c3                   	ret    

c0005d4e <read_from_keyboard_buf>:
c0005d4e:	55                   	push   %ebp
c0005d4f:	89 e5                	mov    %esp,%ebp
c0005d51:	83 ec 18             	sub    $0x18,%esp
c0005d54:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005d58:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d5d:	85 c0                	test   %eax,%eax
c0005d5f:	7f 06                	jg     c0005d67 <read_from_keyboard_buf+0x19>
c0005d61:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005d65:	eb 4b                	jmp    c0005db2 <read_from_keyboard_buf+0x64>
c0005d67:	e8 5e ba ff ff       	call   c00017ca <disable_int>
c0005d6c:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005d71:	0f b6 00             	movzbl (%eax),%eax
c0005d74:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005d77:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005d7c:	83 c0 01             	add    $0x1,%eax
c0005d7f:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005d84:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005d89:	83 e8 01             	sub    $0x1,%eax
c0005d8c:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005d91:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005d96:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005d9b:	39 d0                	cmp    %edx,%eax
c0005d9d:	72 0a                	jb     c0005da9 <read_from_keyboard_buf+0x5b>
c0005d9f:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c0005da6:	0b 01 c0 
c0005da9:	e8 1e ba ff ff       	call   c00017cc <enable_int>
c0005dae:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005db2:	c9                   	leave  
c0005db3:	c3                   	ret    

c0005db4 <keyboard_read>:
c0005db4:	55                   	push   %ebp
c0005db5:	89 e5                	mov    %esp,%ebp
c0005db7:	83 ec 28             	sub    $0x28,%esp
c0005dba:	90                   	nop
c0005dbb:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005dc0:	85 c0                	test   %eax,%eax
c0005dc2:	7e f7                	jle    c0005dbb <keyboard_read+0x7>
c0005dc4:	e8 85 ff ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005dc9:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005dcc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005dd3:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005dd7:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005ddb:	75 5a                	jne    c0005e37 <keyboard_read+0x83>
c0005ddd:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005de1:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005de5:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005de9:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005ded:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005df1:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005df5:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005df9:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005e00:	eb 20                	jmp    c0005e22 <keyboard_read+0x6e>
c0005e02:	e8 47 ff ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005e07:	89 c1                	mov    %eax,%ecx
c0005e09:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005e0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e0f:	01 d0                	add    %edx,%eax
c0005e11:	0f b6 00             	movzbl (%eax),%eax
c0005e14:	38 c1                	cmp    %al,%cl
c0005e16:	74 06                	je     c0005e1e <keyboard_read+0x6a>
c0005e18:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005e1c:	eb 0a                	jmp    c0005e28 <keyboard_read+0x74>
c0005e1e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005e22:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005e26:	7e da                	jle    c0005e02 <keyboard_read+0x4e>
c0005e28:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005e2c:	74 68                	je     c0005e96 <keyboard_read+0xe2>
c0005e2e:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005e35:	eb 5f                	jmp    c0005e96 <keyboard_read+0xe2>
c0005e37:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005e3b:	75 59                	jne    c0005e96 <keyboard_read+0xe2>
c0005e3d:	e8 0c ff ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005e42:	3c 2a                	cmp    $0x2a,%al
c0005e44:	75 1d                	jne    c0005e63 <keyboard_read+0xaf>
c0005e46:	e8 03 ff ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005e4b:	3c e0                	cmp    $0xe0,%al
c0005e4d:	75 14                	jne    c0005e63 <keyboard_read+0xaf>
c0005e4f:	e8 fa fe ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005e54:	3c 37                	cmp    $0x37,%al
c0005e56:	75 0b                	jne    c0005e63 <keyboard_read+0xaf>
c0005e58:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005e5f:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005e63:	e8 e6 fe ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005e68:	3c b7                	cmp    $0xb7,%al
c0005e6a:	75 1d                	jne    c0005e89 <keyboard_read+0xd5>
c0005e6c:	e8 dd fe ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005e71:	3c e0                	cmp    $0xe0,%al
c0005e73:	75 14                	jne    c0005e89 <keyboard_read+0xd5>
c0005e75:	e8 d4 fe ff ff       	call   c0005d4e <read_from_keyboard_buf>
c0005e7a:	3c aa                	cmp    $0xaa,%al
c0005e7c:	75 0b                	jne    c0005e89 <keyboard_read+0xd5>
c0005e7e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005e85:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005e89:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005e8d:	75 07                	jne    c0005e96 <keyboard_read+0xe2>
c0005e8f:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c0005e96:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005e9d:	0f 84 8d 00 00 00    	je     c0005f30 <keyboard_read+0x17c>
c0005ea3:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005eaa:	0f 84 80 00 00 00    	je     c0005f30 <keyboard_read+0x17c>
c0005eb0:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005eb4:	0f 94 c2             	sete   %dl
c0005eb7:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005ebb:	0f 94 c0             	sete   %al
c0005ebe:	09 d0                	or     %edx,%eax
c0005ec0:	84 c0                	test   %al,%al
c0005ec2:	74 07                	je     c0005ecb <keyboard_read+0x117>
c0005ec4:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005ecb:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005ecf:	f7 d0                	not    %eax
c0005ed1:	c0 e8 07             	shr    $0x7,%al
c0005ed4:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005ed7:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005edb:	74 53                	je     c0005f30 <keyboard_read+0x17c>
c0005edd:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005ee1:	74 4d                	je     c0005f30 <keyboard_read+0x17c>
c0005ee3:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005ee7:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005eee:	3c 01                	cmp    $0x1,%al
c0005ef0:	75 04                	jne    c0005ef6 <keyboard_read+0x142>
c0005ef2:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005ef6:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c0005efd:	84 c0                	test   %al,%al
c0005eff:	74 04                	je     c0005f05 <keyboard_read+0x151>
c0005f01:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005f05:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005f09:	89 d0                	mov    %edx,%eax
c0005f0b:	01 c0                	add    %eax,%eax
c0005f0d:	01 c2                	add    %eax,%edx
c0005f0f:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005f13:	01 d0                	add    %edx,%eax
c0005f15:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005f1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005f1f:	83 ec 08             	sub    $0x8,%esp
c0005f22:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f25:	ff 75 08             	pushl  0x8(%ebp)
c0005f28:	e8 1a 00 00 00       	call   c0005f47 <in_process>
c0005f2d:	83 c4 10             	add    $0x10,%esp
c0005f30:	90                   	nop
c0005f31:	c9                   	leave  
c0005f32:	c3                   	ret    

c0005f33 <init_keyboard_handler>:
c0005f33:	55                   	push   %ebp
c0005f34:	89 e5                	mov    %esp,%ebp
c0005f36:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005f3d:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005f44:	90                   	nop
c0005f45:	5d                   	pop    %ebp
c0005f46:	c3                   	ret    

c0005f47 <in_process>:
c0005f47:	55                   	push   %ebp
c0005f48:	89 e5                	mov    %esp,%ebp
c0005f4a:	83 ec 18             	sub    $0x18,%esp
c0005f4d:	83 ec 04             	sub    $0x4,%esp
c0005f50:	6a 02                	push   $0x2
c0005f52:	6a 00                	push   $0x0
c0005f54:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005f57:	50                   	push   %eax
c0005f58:	e8 4e 5b 00 00       	call   c000baab <Memset>
c0005f5d:	83 c4 10             	add    $0x10,%esp
c0005f60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f63:	25 00 01 00 00       	and    $0x100,%eax
c0005f68:	85 c0                	test   %eax,%eax
c0005f6a:	75 28                	jne    c0005f94 <in_process+0x4d>
c0005f6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f6f:	0f b6 c0             	movzbl %al,%eax
c0005f72:	83 ec 08             	sub    $0x8,%esp
c0005f75:	50                   	push   %eax
c0005f76:	ff 75 08             	pushl  0x8(%ebp)
c0005f79:	e8 c3 f3 ff ff       	call   c0005341 <put_key>
c0005f7e:	83 c4 10             	add    $0x10,%esp
c0005f81:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005f88:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005f8f:	e9 42 01 00 00       	jmp    c00060d6 <in_process+0x18f>
c0005f94:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005f9b:	84 c0                	test   %al,%al
c0005f9d:	0f 84 a9 00 00 00    	je     c000604c <in_process+0x105>
c0005fa3:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005fa7:	0f 84 9f 00 00 00    	je     c000604c <in_process+0x105>
c0005fad:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005fb1:	0f 84 95 00 00 00    	je     c000604c <in_process+0x105>
c0005fb7:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005fbe:	74 64                	je     c0006024 <in_process+0xdd>
c0005fc0:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005fc7:	77 0b                	ja     c0005fd4 <in_process+0x8d>
c0005fc9:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005fd0:	74 64                	je     c0006036 <in_process+0xef>
c0005fd2:	eb 73                	jmp    c0006047 <in_process+0x100>
c0005fd4:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005fdb:	74 0b                	je     c0005fe8 <in_process+0xa1>
c0005fdd:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005fe4:	74 20                	je     c0006006 <in_process+0xbf>
c0005fe6:	eb 5f                	jmp    c0006047 <in_process+0x100>
c0005fe8:	83 ec 0c             	sub    $0xc,%esp
c0005feb:	ff 75 08             	pushl  0x8(%ebp)
c0005fee:	e8 ba f3 ff ff       	call   c00053ad <scroll_up>
c0005ff3:	83 c4 10             	add    $0x10,%esp
c0005ff6:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005ffd:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0006004:	eb 41                	jmp    c0006047 <in_process+0x100>
c0006006:	83 ec 0c             	sub    $0xc,%esp
c0006009:	ff 75 08             	pushl  0x8(%ebp)
c000600c:	e8 de f3 ff ff       	call   c00053ef <scroll_down>
c0006011:	83 c4 10             	add    $0x10,%esp
c0006014:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c000601b:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0006022:	eb 23                	jmp    c0006047 <in_process+0x100>
c0006024:	83 ec 08             	sub    $0x8,%esp
c0006027:	6a 0a                	push   $0xa
c0006029:	ff 75 08             	pushl  0x8(%ebp)
c000602c:	e8 29 f4 ff ff       	call   c000545a <out_char>
c0006031:	83 c4 10             	add    $0x10,%esp
c0006034:	eb 11                	jmp    c0006047 <in_process+0x100>
c0006036:	83 ec 08             	sub    $0x8,%esp
c0006039:	6a 08                	push   $0x8
c000603b:	ff 75 08             	pushl  0x8(%ebp)
c000603e:	e8 17 f4 ff ff       	call   c000545a <out_char>
c0006043:	83 c4 10             	add    $0x10,%esp
c0006046:	90                   	nop
c0006047:	e9 8a 00 00 00       	jmp    c00060d6 <in_process+0x18f>
c000604c:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0006053:	74 55                	je     c00060aa <in_process+0x163>
c0006055:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c000605c:	77 14                	ja     c0006072 <in_process+0x12b>
c000605e:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0006065:	74 31                	je     c0006098 <in_process+0x151>
c0006067:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000606e:	74 16                	je     c0006086 <in_process+0x13f>
c0006070:	eb 64                	jmp    c00060d6 <in_process+0x18f>
c0006072:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0006079:	74 3e                	je     c00060b9 <in_process+0x172>
c000607b:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0006082:	74 44                	je     c00060c8 <in_process+0x181>
c0006084:	eb 50                	jmp    c00060d6 <in_process+0x18f>
c0006086:	83 ec 08             	sub    $0x8,%esp
c0006089:	6a 0a                	push   $0xa
c000608b:	ff 75 08             	pushl  0x8(%ebp)
c000608e:	e8 ae f2 ff ff       	call   c0005341 <put_key>
c0006093:	83 c4 10             	add    $0x10,%esp
c0006096:	eb 3e                	jmp    c00060d6 <in_process+0x18f>
c0006098:	83 ec 08             	sub    $0x8,%esp
c000609b:	6a 08                	push   $0x8
c000609d:	ff 75 08             	pushl  0x8(%ebp)
c00060a0:	e8 9c f2 ff ff       	call   c0005341 <put_key>
c00060a5:	83 c4 10             	add    $0x10,%esp
c00060a8:	eb 2c                	jmp    c00060d6 <in_process+0x18f>
c00060aa:	83 ec 0c             	sub    $0xc,%esp
c00060ad:	6a 00                	push   $0x0
c00060af:	e8 5c f1 ff ff       	call   c0005210 <select_console>
c00060b4:	83 c4 10             	add    $0x10,%esp
c00060b7:	eb 1d                	jmp    c00060d6 <in_process+0x18f>
c00060b9:	83 ec 0c             	sub    $0xc,%esp
c00060bc:	6a 01                	push   $0x1
c00060be:	e8 4d f1 ff ff       	call   c0005210 <select_console>
c00060c3:	83 c4 10             	add    $0x10,%esp
c00060c6:	eb 0e                	jmp    c00060d6 <in_process+0x18f>
c00060c8:	83 ec 0c             	sub    $0xc,%esp
c00060cb:	6a 02                	push   $0x2
c00060cd:	e8 3e f1 ff ff       	call   c0005210 <select_console>
c00060d2:	83 c4 10             	add    $0x10,%esp
c00060d5:	90                   	nop
c00060d6:	90                   	nop
c00060d7:	c9                   	leave  
c00060d8:	c3                   	ret    

c00060d9 <open>:
c00060d9:	55                   	push   %ebp
c00060da:	89 e5                	mov    %esp,%ebp
c00060dc:	83 ec 18             	sub    $0x18,%esp
c00060df:	83 ec 0c             	sub    $0xc,%esp
c00060e2:	6a 6c                	push   $0x6c
c00060e4:	e8 cb c8 ff ff       	call   c00029b4 <sys_malloc>
c00060e9:	83 c4 10             	add    $0x10,%esp
c00060ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00060ef:	83 ec 04             	sub    $0x4,%esp
c00060f2:	6a 6c                	push   $0x6c
c00060f4:	6a 00                	push   $0x0
c00060f6:	ff 75 f4             	pushl  -0xc(%ebp)
c00060f9:	e8 ad 59 00 00       	call   c000baab <Memset>
c00060fe:	83 c4 10             	add    $0x10,%esp
c0006101:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006104:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c000610b:	83 ec 0c             	sub    $0xc,%esp
c000610e:	ff 75 08             	pushl  0x8(%ebp)
c0006111:	e8 c2 10 00 00       	call   c00071d8 <get_physical_address>
c0006116:	83 c4 10             	add    $0x10,%esp
c0006119:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000611c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000611f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006122:	89 50 34             	mov    %edx,0x34(%eax)
c0006125:	8b 55 0c             	mov    0xc(%ebp),%edx
c0006128:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000612b:	89 50 64             	mov    %edx,0x64(%eax)
c000612e:	83 ec 0c             	sub    $0xc,%esp
c0006131:	ff 75 08             	pushl  0x8(%ebp)
c0006134:	e8 ab 59 00 00       	call   c000bae4 <Strlen>
c0006139:	83 c4 10             	add    $0x10,%esp
c000613c:	89 c2                	mov    %eax,%edx
c000613e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006141:	89 50 30             	mov    %edx,0x30(%eax)
c0006144:	83 ec 04             	sub    $0x4,%esp
c0006147:	6a 02                	push   $0x2
c0006149:	ff 75 f4             	pushl  -0xc(%ebp)
c000614c:	6a 03                	push   $0x3
c000614e:	e8 94 3d 00 00       	call   c0009ee7 <send_rec>
c0006153:	83 c4 10             	add    $0x10,%esp
c0006156:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006159:	8b 40 40             	mov    0x40(%eax),%eax
c000615c:	c9                   	leave  
c000615d:	c3                   	ret    

c000615e <read>:
c000615e:	55                   	push   %ebp
c000615f:	89 e5                	mov    %esp,%ebp
c0006161:	83 ec 18             	sub    $0x18,%esp
c0006164:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c000616b:	83 ec 0c             	sub    $0xc,%esp
c000616e:	ff 75 f4             	pushl  -0xc(%ebp)
c0006171:	e8 3e c8 ff ff       	call   c00029b4 <sys_malloc>
c0006176:	83 c4 10             	add    $0x10,%esp
c0006179:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000617c:	83 ec 0c             	sub    $0xc,%esp
c000617f:	ff 75 0c             	pushl  0xc(%ebp)
c0006182:	e8 51 10 00 00       	call   c00071d8 <get_physical_address>
c0006187:	83 c4 10             	add    $0x10,%esp
c000618a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000618d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006190:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0006197:	8b 55 08             	mov    0x8(%ebp),%edx
c000619a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000619d:	89 50 40             	mov    %edx,0x40(%eax)
c00061a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00061a6:	89 50 10             	mov    %edx,0x10(%eax)
c00061a9:	8b 55 10             	mov    0x10(%ebp),%edx
c00061ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061af:	89 50 50             	mov    %edx,0x50(%eax)
c00061b2:	83 ec 04             	sub    $0x4,%esp
c00061b5:	6a 02                	push   $0x2
c00061b7:	ff 75 f0             	pushl  -0x10(%ebp)
c00061ba:	6a 03                	push   $0x3
c00061bc:	e8 26 3d 00 00       	call   c0009ee7 <send_rec>
c00061c1:	83 c4 10             	add    $0x10,%esp
c00061c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061c7:	8b 40 50             	mov    0x50(%eax),%eax
c00061ca:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00061cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00061d0:	c9                   	leave  
c00061d1:	c3                   	ret    

c00061d2 <write>:
c00061d2:	55                   	push   %ebp
c00061d3:	89 e5                	mov    %esp,%ebp
c00061d5:	83 ec 18             	sub    $0x18,%esp
c00061d8:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00061df:	83 ec 0c             	sub    $0xc,%esp
c00061e2:	ff 75 f4             	pushl  -0xc(%ebp)
c00061e5:	e8 ca c7 ff ff       	call   c00029b4 <sys_malloc>
c00061ea:	83 c4 10             	add    $0x10,%esp
c00061ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061f0:	83 ec 0c             	sub    $0xc,%esp
c00061f3:	ff 75 0c             	pushl  0xc(%ebp)
c00061f6:	e8 dd 0f 00 00       	call   c00071d8 <get_physical_address>
c00061fb:	83 c4 10             	add    $0x10,%esp
c00061fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006201:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006204:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c000620b:	8b 55 08             	mov    0x8(%ebp),%edx
c000620e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006211:	89 50 40             	mov    %edx,0x40(%eax)
c0006214:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006217:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000621a:	89 50 10             	mov    %edx,0x10(%eax)
c000621d:	8b 55 10             	mov    0x10(%ebp),%edx
c0006220:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006223:	89 50 50             	mov    %edx,0x50(%eax)
c0006226:	83 ec 04             	sub    $0x4,%esp
c0006229:	6a 02                	push   $0x2
c000622b:	ff 75 f0             	pushl  -0x10(%ebp)
c000622e:	6a 03                	push   $0x3
c0006230:	e8 b2 3c 00 00       	call   c0009ee7 <send_rec>
c0006235:	83 c4 10             	add    $0x10,%esp
c0006238:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000623b:	8b 40 50             	mov    0x50(%eax),%eax
c000623e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006241:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006244:	c9                   	leave  
c0006245:	c3                   	ret    

c0006246 <close>:
c0006246:	55                   	push   %ebp
c0006247:	89 e5                	mov    %esp,%ebp
c0006249:	83 ec 78             	sub    $0x78,%esp
c000624c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006253:	8b 45 08             	mov    0x8(%ebp),%eax
c0006256:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006259:	83 ec 04             	sub    $0x4,%esp
c000625c:	6a 02                	push   $0x2
c000625e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006261:	50                   	push   %eax
c0006262:	6a 03                	push   $0x3
c0006264:	e8 7e 3c 00 00       	call   c0009ee7 <send_rec>
c0006269:	83 c4 10             	add    $0x10,%esp
c000626c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000626f:	83 f8 65             	cmp    $0x65,%eax
c0006272:	74 19                	je     c000628d <close+0x47>
c0006274:	6a 13                	push   $0x13
c0006276:	68 8d b2 00 c0       	push   $0xc000b28d
c000627b:	68 8d b2 00 c0       	push   $0xc000b28d
c0006280:	68 99 b2 00 c0       	push   $0xc000b299
c0006285:	e8 ed 33 00 00       	call   c0009677 <assertion_failure>
c000628a:	83 c4 10             	add    $0x10,%esp
c000628d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006290:	c9                   	leave  
c0006291:	c3                   	ret    

c0006292 <wait>:
c0006292:	55                   	push   %ebp
c0006293:	89 e5                	mov    %esp,%ebp
c0006295:	83 ec 78             	sub    $0x78,%esp
c0006298:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c000629f:	83 ec 04             	sub    $0x4,%esp
c00062a2:	6a 01                	push   $0x1
c00062a4:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062a7:	50                   	push   %eax
c00062a8:	6a 03                	push   $0x3
c00062aa:	e8 38 3c 00 00       	call   c0009ee7 <send_rec>
c00062af:	83 c4 10             	add    $0x10,%esp
c00062b2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00062b5:	89 c2                	mov    %eax,%edx
c00062b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00062ba:	89 10                	mov    %edx,(%eax)
c00062bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00062bf:	83 f8 21             	cmp    $0x21,%eax
c00062c2:	74 05                	je     c00062c9 <wait+0x37>
c00062c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00062c7:	eb 05                	jmp    c00062ce <wait+0x3c>
c00062c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00062ce:	c9                   	leave  
c00062cf:	c3                   	ret    

c00062d0 <exit>:
c00062d0:	55                   	push   %ebp
c00062d1:	89 e5                	mov    %esp,%ebp
c00062d3:	83 ec 78             	sub    $0x78,%esp
c00062d6:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c00062dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00062e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00062e3:	83 ec 04             	sub    $0x4,%esp
c00062e6:	6a 01                	push   $0x1
c00062e8:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00062eb:	50                   	push   %eax
c00062ec:	6a 03                	push   $0x3
c00062ee:	e8 f4 3b 00 00       	call   c0009ee7 <send_rec>
c00062f3:	83 c4 10             	add    $0x10,%esp
c00062f6:	90                   	nop
c00062f7:	c9                   	leave  
c00062f8:	c3                   	ret    

c00062f9 <fork>:
c00062f9:	55                   	push   %ebp
c00062fa:	89 e5                	mov    %esp,%ebp
c00062fc:	83 ec 78             	sub    $0x78,%esp
c00062ff:	83 ec 04             	sub    $0x4,%esp
c0006302:	6a 6c                	push   $0x6c
c0006304:	6a 00                	push   $0x0
c0006306:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006309:	50                   	push   %eax
c000630a:	e8 9c 57 00 00       	call   c000baab <Memset>
c000630f:	83 c4 10             	add    $0x10,%esp
c0006312:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0006319:	83 ec 04             	sub    $0x4,%esp
c000631c:	6a 01                	push   $0x1
c000631e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006321:	50                   	push   %eax
c0006322:	6a 03                	push   $0x3
c0006324:	e8 be 3b 00 00       	call   c0009ee7 <send_rec>
c0006329:	83 c4 10             	add    $0x10,%esp
c000632c:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006333:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006336:	85 c0                	test   %eax,%eax
c0006338:	74 19                	je     c0006353 <fork+0x5a>
c000633a:	6a 14                	push   $0x14
c000633c:	68 b1 b2 00 c0       	push   $0xc000b2b1
c0006341:	68 b1 b2 00 c0       	push   $0xc000b2b1
c0006346:	68 bc b2 00 c0       	push   $0xc000b2bc
c000634b:	e8 27 33 00 00       	call   c0009677 <assertion_failure>
c0006350:	83 c4 10             	add    $0x10,%esp
c0006353:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006356:	c9                   	leave  
c0006357:	c3                   	ret    

c0006358 <getpid>:
c0006358:	55                   	push   %ebp
c0006359:	89 e5                	mov    %esp,%ebp
c000635b:	83 ec 78             	sub    $0x78,%esp
c000635e:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0006365:	83 ec 04             	sub    $0x4,%esp
c0006368:	6a 05                	push   $0x5
c000636a:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000636d:	50                   	push   %eax
c000636e:	6a 03                	push   $0x3
c0006370:	e8 72 3b 00 00       	call   c0009ee7 <send_rec>
c0006375:	83 c4 10             	add    $0x10,%esp
c0006378:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000637b:	c9                   	leave  
c000637c:	c3                   	ret    

c000637d <exec>:
c000637d:	55                   	push   %ebp
c000637e:	89 e5                	mov    %esp,%ebp
c0006380:	83 ec 78             	sub    $0x78,%esp
c0006383:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c000638a:	8b 45 08             	mov    0x8(%ebp),%eax
c000638d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006390:	83 ec 0c             	sub    $0xc,%esp
c0006393:	ff 75 08             	pushl  0x8(%ebp)
c0006396:	e8 49 57 00 00       	call   c000bae4 <Strlen>
c000639b:	83 c4 10             	add    $0x10,%esp
c000639e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00063a1:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c00063a8:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c00063af:	83 ec 04             	sub    $0x4,%esp
c00063b2:	6a 01                	push   $0x1
c00063b4:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00063b7:	50                   	push   %eax
c00063b8:	6a 03                	push   $0x3
c00063ba:	e8 28 3b 00 00       	call   c0009ee7 <send_rec>
c00063bf:	83 c4 10             	add    $0x10,%esp
c00063c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00063c5:	83 f8 65             	cmp    $0x65,%eax
c00063c8:	74 19                	je     c00063e3 <exec+0x66>
c00063ca:	6a 19                	push   $0x19
c00063cc:	68 cc b2 00 c0       	push   $0xc000b2cc
c00063d1:	68 cc b2 00 c0       	push   $0xc000b2cc
c00063d6:	68 d7 b2 00 c0       	push   $0xc000b2d7
c00063db:	e8 97 32 00 00       	call   c0009677 <assertion_failure>
c00063e0:	83 c4 10             	add    $0x10,%esp
c00063e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00063e6:	c9                   	leave  
c00063e7:	c3                   	ret    

c00063e8 <execv>:
c00063e8:	55                   	push   %ebp
c00063e9:	89 e5                	mov    %esp,%ebp
c00063eb:	57                   	push   %edi
c00063ec:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c00063f2:	83 ec 04             	sub    $0x4,%esp
c00063f5:	68 00 80 00 00       	push   $0x8000
c00063fa:	6a 00                	push   $0x0
c00063fc:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006402:	50                   	push   %eax
c0006403:	e8 a3 56 00 00       	call   c000baab <Memset>
c0006408:	83 c4 10             	add    $0x10,%esp
c000640b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000640e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006411:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006418:	eb 0d                	jmp    c0006427 <execv+0x3f>
c000641a:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c000641e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006421:	83 c0 04             	add    $0x4,%eax
c0006424:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006427:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000642a:	8b 00                	mov    (%eax),%eax
c000642c:	85 c0                	test   %eax,%eax
c000642e:	75 ea                	jne    c000641a <execv+0x32>
c0006430:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006436:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006439:	01 d0                	add    %edx,%eax
c000643b:	c6 00 00             	movb   $0x0,(%eax)
c000643e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006441:	83 c0 04             	add    $0x4,%eax
c0006444:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006447:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000644d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006450:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006453:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006456:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000645d:	eb 64                	jmp    c00064c3 <execv+0xdb>
c000645f:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006465:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006468:	01 c2                	add    %eax,%edx
c000646a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000646d:	89 10                	mov    %edx,(%eax)
c000646f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006472:	8b 00                	mov    (%eax),%eax
c0006474:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c000647a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000647d:	01 ca                	add    %ecx,%edx
c000647f:	83 ec 08             	sub    $0x8,%esp
c0006482:	50                   	push   %eax
c0006483:	52                   	push   %edx
c0006484:	e8 41 56 00 00       	call   c000baca <Strcpy>
c0006489:	83 c4 10             	add    $0x10,%esp
c000648c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000648f:	8b 00                	mov    (%eax),%eax
c0006491:	83 ec 0c             	sub    $0xc,%esp
c0006494:	50                   	push   %eax
c0006495:	e8 4a 56 00 00       	call   c000bae4 <Strlen>
c000649a:	83 c4 10             	add    $0x10,%esp
c000649d:	01 45 f0             	add    %eax,-0x10(%ebp)
c00064a0:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00064a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064a9:	01 d0                	add    %edx,%eax
c00064ab:	c6 00 00             	movb   $0x0,(%eax)
c00064ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064b1:	83 c0 01             	add    $0x1,%eax
c00064b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00064b7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c00064bb:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00064bf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00064c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00064c6:	8b 00                	mov    (%eax),%eax
c00064c8:	85 c0                	test   %eax,%eax
c00064ca:	75 93                	jne    c000645f <execv+0x77>
c00064cc:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00064d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00064d5:	eb 04                	jmp    c00064db <execv+0xf3>
c00064d7:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00064db:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00064de:	8b 00                	mov    (%eax),%eax
c00064e0:	85 c0                	test   %eax,%eax
c00064e2:	75 f3                	jne    c00064d7 <execv+0xef>
c00064e4:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c00064ea:	b8 00 00 00 00       	mov    $0x0,%eax
c00064ef:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00064f4:	89 d7                	mov    %edx,%edi
c00064f6:	f3 ab                	rep stos %eax,%es:(%edi)
c00064f8:	c7 85 4c 7f ff ff ef 	movl   $0xc000b2ef,-0x80b4(%ebp)
c00064ff:	b2 00 c0 
c0006502:	c7 85 50 7f ff ff f6 	movl   $0xc000b2f6,-0x80b0(%ebp)
c0006509:	b2 00 c0 
c000650c:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0006513:	00 00 00 
c0006516:	8b 45 08             	mov    0x8(%ebp),%eax
c0006519:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c000651f:	83 ec 0c             	sub    $0xc,%esp
c0006522:	ff 75 08             	pushl  0x8(%ebp)
c0006525:	e8 ba 55 00 00       	call   c000bae4 <Strlen>
c000652a:	83 c4 10             	add    $0x10,%esp
c000652d:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0006533:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006539:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c000653f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006542:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0006548:	83 ec 04             	sub    $0x4,%esp
c000654b:	6a 01                	push   $0x1
c000654d:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0006553:	50                   	push   %eax
c0006554:	6a 03                	push   $0x3
c0006556:	e8 8c 39 00 00       	call   c0009ee7 <send_rec>
c000655b:	83 c4 10             	add    $0x10,%esp
c000655e:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0006564:	83 f8 65             	cmp    $0x65,%eax
c0006567:	74 19                	je     c0006582 <execv+0x19a>
c0006569:	6a 72                	push   $0x72
c000656b:	68 cc b2 00 c0       	push   $0xc000b2cc
c0006570:	68 cc b2 00 c0       	push   $0xc000b2cc
c0006575:	68 d7 b2 00 c0       	push   $0xc000b2d7
c000657a:	e8 f8 30 00 00       	call   c0009677 <assertion_failure>
c000657f:	83 c4 10             	add    $0x10,%esp
c0006582:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0006588:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000658b:	c9                   	leave  
c000658c:	c3                   	ret    

c000658d <execl>:
c000658d:	55                   	push   %ebp
c000658e:	89 e5                	mov    %esp,%ebp
c0006590:	83 ec 18             	sub    $0x18,%esp
c0006593:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006596:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006599:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000659c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000659f:	83 ec 08             	sub    $0x8,%esp
c00065a2:	ff 75 f0             	pushl  -0x10(%ebp)
c00065a5:	ff 75 08             	pushl  0x8(%ebp)
c00065a8:	e8 3b fe ff ff       	call   c00063e8 <execv>
c00065ad:	83 c4 10             	add    $0x10,%esp
c00065b0:	c9                   	leave  
c00065b1:	c3                   	ret    

c00065b2 <TaskMM>:
c00065b2:	55                   	push   %ebp
c00065b3:	89 e5                	mov    %esp,%ebp
c00065b5:	83 ec 28             	sub    $0x28,%esp
c00065b8:	83 ec 0c             	sub    $0xc,%esp
c00065bb:	6a 6c                	push   $0x6c
c00065bd:	e8 f2 c3 ff ff       	call   c00029b4 <sys_malloc>
c00065c2:	83 c4 10             	add    $0x10,%esp
c00065c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00065c8:	83 ec 0c             	sub    $0xc,%esp
c00065cb:	6a 6c                	push   $0x6c
c00065cd:	e8 e2 c3 ff ff       	call   c00029b4 <sys_malloc>
c00065d2:	83 c4 10             	add    $0x10,%esp
c00065d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00065d8:	83 ec 04             	sub    $0x4,%esp
c00065db:	6a 12                	push   $0x12
c00065dd:	ff 75 f0             	pushl  -0x10(%ebp)
c00065e0:	6a 02                	push   $0x2
c00065e2:	e8 00 39 00 00       	call   c0009ee7 <send_rec>
c00065e7:	83 c4 10             	add    $0x10,%esp
c00065ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065ed:	8b 40 68             	mov    0x68(%eax),%eax
c00065f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00065f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065f6:	8b 00                	mov    (%eax),%eax
c00065f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00065fb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006602:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006605:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000660c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000660f:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0006616:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c000661a:	74 4b                	je     c0006667 <TaskMM+0xb5>
c000661c:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006620:	7f 08                	jg     c000662a <TaskMM+0x78>
c0006622:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0006626:	74 28                	je     c0006650 <TaskMM+0x9e>
c0006628:	eb 6e                	jmp    c0006698 <TaskMM+0xe6>
c000662a:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c000662e:	74 08                	je     c0006638 <TaskMM+0x86>
c0006630:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0006634:	74 4b                	je     c0006681 <TaskMM+0xcf>
c0006636:	eb 60                	jmp    c0006698 <TaskMM+0xe6>
c0006638:	83 ec 0c             	sub    $0xc,%esp
c000663b:	ff 75 f0             	pushl  -0x10(%ebp)
c000663e:	e8 e6 03 00 00       	call   c0006a29 <do_fork>
c0006643:	83 c4 10             	add    $0x10,%esp
c0006646:	89 c2                	mov    %eax,%edx
c0006648:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000664b:	89 50 4c             	mov    %edx,0x4c(%eax)
c000664e:	eb 59                	jmp    c00066a9 <TaskMM+0xf7>
c0006650:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006657:	83 ec 0c             	sub    $0xc,%esp
c000665a:	ff 75 f0             	pushl  -0x10(%ebp)
c000665d:	e8 96 00 00 00       	call   c00066f8 <do_exec>
c0006662:	83 c4 10             	add    $0x10,%esp
c0006665:	eb 42                	jmp    c00066a9 <TaskMM+0xf7>
c0006667:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000666e:	83 ec 08             	sub    $0x8,%esp
c0006671:	ff 75 e0             	pushl  -0x20(%ebp)
c0006674:	ff 75 f0             	pushl  -0x10(%ebp)
c0006677:	e8 18 04 00 00       	call   c0006a94 <do_exit>
c000667c:	83 c4 10             	add    $0x10,%esp
c000667f:	eb 28                	jmp    c00066a9 <TaskMM+0xf7>
c0006681:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006688:	83 ec 0c             	sub    $0xc,%esp
c000668b:	ff 75 f0             	pushl  -0x10(%ebp)
c000668e:	e8 fd 04 00 00       	call   c0006b90 <do_wait>
c0006693:	83 c4 10             	add    $0x10,%esp
c0006696:	eb 11                	jmp    c00066a9 <TaskMM+0xf7>
c0006698:	83 ec 0c             	sub    $0xc,%esp
c000669b:	68 fd b2 00 c0       	push   $0xc000b2fd
c00066a0:	e8 b4 2f 00 00       	call   c0009659 <panic>
c00066a5:	83 c4 10             	add    $0x10,%esp
c00066a8:	90                   	nop
c00066a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00066ad:	0f 84 25 ff ff ff    	je     c00065d8 <TaskMM+0x26>
c00066b3:	83 ec 0c             	sub    $0xc,%esp
c00066b6:	6a 0a                	push   $0xa
c00066b8:	e8 29 2b 00 00       	call   c00091e6 <delay>
c00066bd:	83 c4 10             	add    $0x10,%esp
c00066c0:	e9 13 ff ff ff       	jmp    c00065d8 <TaskMM+0x26>

c00066c5 <alloc_mem>:
c00066c5:	55                   	push   %ebp
c00066c6:	89 e5                	mov    %esp,%ebp
c00066c8:	83 ec 10             	sub    $0x10,%esp
c00066cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00066ce:	83 e8 08             	sub    $0x8,%eax
c00066d1:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c00066d7:	05 00 00 a0 00       	add    $0xa00000,%eax
c00066dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00066df:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00066e2:	c9                   	leave  
c00066e3:	c3                   	ret    

c00066e4 <do_exec2>:
c00066e4:	55                   	push   %ebp
c00066e5:	89 e5                	mov    %esp,%ebp
c00066e7:	83 ec 10             	sub    $0x10,%esp
c00066ea:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c00066f1:	b8 00 00 00 00       	mov    $0x0,%eax
c00066f6:	c9                   	leave  
c00066f7:	c3                   	ret    

c00066f8 <do_exec>:
c00066f8:	55                   	push   %ebp
c00066f9:	89 e5                	mov    %esp,%ebp
c00066fb:	56                   	push   %esi
c00066fc:	53                   	push   %ebx
c00066fd:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0006703:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c000670a:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0006711:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c0006717:	83 ec 08             	sub    $0x8,%esp
c000671a:	6a 00                	push   $0x0
c000671c:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c000671f:	50                   	push   %eax
c0006720:	e8 b4 f9 ff ff       	call   c00060d9 <open>
c0006725:	83 c4 10             	add    $0x10,%esp
c0006728:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000672b:	8b 45 08             	mov    0x8(%ebp),%eax
c000672e:	8b 00                	mov    (%eax),%eax
c0006730:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006733:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c000673a:	83 ec 04             	sub    $0x4,%esp
c000673d:	6a 0c                	push   $0xc
c000673f:	6a 00                	push   $0x0
c0006741:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006747:	50                   	push   %eax
c0006748:	e8 5e 53 00 00       	call   c000baab <Memset>
c000674d:	83 c4 10             	add    $0x10,%esp
c0006750:	8b 45 08             	mov    0x8(%ebp),%eax
c0006753:	8b 40 30             	mov    0x30(%eax),%eax
c0006756:	89 c6                	mov    %eax,%esi
c0006758:	8b 45 08             	mov    0x8(%ebp),%eax
c000675b:	8b 40 34             	mov    0x34(%eax),%eax
c000675e:	83 ec 08             	sub    $0x8,%esp
c0006761:	50                   	push   %eax
c0006762:	ff 75 d8             	pushl  -0x28(%ebp)
c0006765:	e8 4e e8 ff ff       	call   c0004fb8 <v2l>
c000676a:	83 c4 10             	add    $0x10,%esp
c000676d:	89 c3                	mov    %eax,%ebx
c000676f:	83 ec 08             	sub    $0x8,%esp
c0006772:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006778:	50                   	push   %eax
c0006779:	6a 01                	push   $0x1
c000677b:	e8 38 e8 ff ff       	call   c0004fb8 <v2l>
c0006780:	83 c4 10             	add    $0x10,%esp
c0006783:	83 ec 04             	sub    $0x4,%esp
c0006786:	56                   	push   %esi
c0006787:	53                   	push   %ebx
c0006788:	50                   	push   %eax
c0006789:	e8 34 14 00 00       	call   c0007bc2 <Memcpy>
c000678e:	83 c4 10             	add    $0x10,%esp
c0006791:	83 ec 08             	sub    $0x8,%esp
c0006794:	6a 00                	push   $0x0
c0006796:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000679c:	50                   	push   %eax
c000679d:	e8 37 f9 ff ff       	call   c00060d9 <open>
c00067a2:	83 c4 10             	add    $0x10,%esp
c00067a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00067a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00067af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067b2:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00067b8:	01 d0                	add    %edx,%eax
c00067ba:	83 ec 04             	sub    $0x4,%esp
c00067bd:	68 00 02 00 00       	push   $0x200
c00067c2:	50                   	push   %eax
c00067c3:	ff 75 d0             	pushl  -0x30(%ebp)
c00067c6:	e8 93 f9 ff ff       	call   c000615e <read>
c00067cb:	83 c4 10             	add    $0x10,%esp
c00067ce:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00067d1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00067d4:	01 45 f4             	add    %eax,-0xc(%ebp)
c00067d7:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00067db:	74 02                	je     c00067df <do_exec+0xe7>
c00067dd:	eb d0                	jmp    c00067af <do_exec+0xb7>
c00067df:	90                   	nop
c00067e0:	83 ec 0c             	sub    $0xc,%esp
c00067e3:	ff 75 d0             	pushl  -0x30(%ebp)
c00067e6:	e8 5b fa ff ff       	call   c0006246 <close>
c00067eb:	83 c4 10             	add    $0x10,%esp
c00067ee:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00067f4:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00067f7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00067fe:	eb 72                	jmp    c0006872 <do_exec+0x17a>
c0006800:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006803:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0006807:	0f b7 d0             	movzwl %ax,%edx
c000680a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000680d:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006811:	0f b7 c0             	movzwl %ax,%eax
c0006814:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0006818:	01 c2                	add    %eax,%edx
c000681a:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0006820:	01 d0                	add    %edx,%eax
c0006822:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006825:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006828:	8b 40 10             	mov    0x10(%eax),%eax
c000682b:	89 c6                	mov    %eax,%esi
c000682d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006830:	8b 40 04             	mov    0x4(%eax),%eax
c0006833:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0006839:	01 d0                	add    %edx,%eax
c000683b:	83 ec 08             	sub    $0x8,%esp
c000683e:	50                   	push   %eax
c000683f:	6a 01                	push   $0x1
c0006841:	e8 72 e7 ff ff       	call   c0004fb8 <v2l>
c0006846:	83 c4 10             	add    $0x10,%esp
c0006849:	89 c3                	mov    %eax,%ebx
c000684b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000684e:	8b 40 08             	mov    0x8(%eax),%eax
c0006851:	83 ec 08             	sub    $0x8,%esp
c0006854:	50                   	push   %eax
c0006855:	ff 75 d8             	pushl  -0x28(%ebp)
c0006858:	e8 5b e7 ff ff       	call   c0004fb8 <v2l>
c000685d:	83 c4 10             	add    $0x10,%esp
c0006860:	83 ec 04             	sub    $0x4,%esp
c0006863:	56                   	push   %esi
c0006864:	53                   	push   %ebx
c0006865:	50                   	push   %eax
c0006866:	e8 57 13 00 00       	call   c0007bc2 <Memcpy>
c000686b:	83 c4 10             	add    $0x10,%esp
c000686e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006872:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006875:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0006879:	0f b7 c0             	movzwl %ax,%eax
c000687c:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000687f:	0f 8c 7b ff ff ff    	jl     c0006800 <do_exec+0x108>
c0006885:	8b 45 08             	mov    0x8(%ebp),%eax
c0006888:	8b 40 10             	mov    0x10(%eax),%eax
c000688b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000688e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006891:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006894:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006897:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c000689e:	83 ec 08             	sub    $0x8,%esp
c00068a1:	ff 75 c0             	pushl  -0x40(%ebp)
c00068a4:	ff 75 d8             	pushl  -0x28(%ebp)
c00068a7:	e8 0c e7 ff ff       	call   c0004fb8 <v2l>
c00068ac:	83 c4 10             	add    $0x10,%esp
c00068af:	89 c3                	mov    %eax,%ebx
c00068b1:	83 ec 08             	sub    $0x8,%esp
c00068b4:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00068ba:	50                   	push   %eax
c00068bb:	6a 01                	push   $0x1
c00068bd:	e8 f6 e6 ff ff       	call   c0004fb8 <v2l>
c00068c2:	83 c4 10             	add    $0x10,%esp
c00068c5:	83 ec 04             	sub    $0x4,%esp
c00068c8:	ff 75 bc             	pushl  -0x44(%ebp)
c00068cb:	53                   	push   %ebx
c00068cc:	50                   	push   %eax
c00068cd:	e8 f0 12 00 00       	call   c0007bc2 <Memcpy>
c00068d2:	83 c4 10             	add    $0x10,%esp
c00068d5:	83 ec 08             	sub    $0x8,%esp
c00068d8:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00068de:	50                   	push   %eax
c00068df:	6a 01                	push   $0x1
c00068e1:	e8 d2 e6 ff ff       	call   c0004fb8 <v2l>
c00068e6:	83 c4 10             	add    $0x10,%esp
c00068e9:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00068ec:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00068ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068f2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00068f9:	eb 08                	jmp    c0006903 <do_exec+0x20b>
c00068fb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00068ff:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0006903:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006906:	8b 00                	mov    (%eax),%eax
c0006908:	85 c0                	test   %eax,%eax
c000690a:	75 ef                	jne    c00068fb <do_exec+0x203>
c000690c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000690f:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006912:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006915:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000691c:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006922:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006925:	eb 17                	jmp    c000693e <do_exec+0x246>
c0006927:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000692b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000692e:	8b 10                	mov    (%eax),%edx
c0006930:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006933:	01 c2                	add    %eax,%edx
c0006935:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006938:	89 10                	mov    %edx,(%eax)
c000693a:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c000693e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006941:	8b 00                	mov    (%eax),%eax
c0006943:	85 c0                	test   %eax,%eax
c0006945:	75 e0                	jne    c0006927 <do_exec+0x22f>
c0006947:	83 ec 08             	sub    $0x8,%esp
c000694a:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006950:	50                   	push   %eax
c0006951:	6a 01                	push   $0x1
c0006953:	e8 60 e6 ff ff       	call   c0004fb8 <v2l>
c0006958:	83 c4 10             	add    $0x10,%esp
c000695b:	89 c3                	mov    %eax,%ebx
c000695d:	83 ec 08             	sub    $0x8,%esp
c0006960:	ff 75 b8             	pushl  -0x48(%ebp)
c0006963:	ff 75 d8             	pushl  -0x28(%ebp)
c0006966:	e8 4d e6 ff ff       	call   c0004fb8 <v2l>
c000696b:	83 c4 10             	add    $0x10,%esp
c000696e:	83 ec 04             	sub    $0x4,%esp
c0006971:	ff 75 bc             	pushl  -0x44(%ebp)
c0006974:	53                   	push   %ebx
c0006975:	50                   	push   %eax
c0006976:	e8 47 12 00 00       	call   c0007bc2 <Memcpy>
c000697b:	83 c4 10             	add    $0x10,%esp
c000697e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006981:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006984:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006987:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000698a:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c0006990:	81 c2 98 34 08 c0    	add    $0xc0083498,%edx
c0006996:	89 02                	mov    %eax,(%edx)
c0006998:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000699b:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000699e:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c00069a4:	81 c2 94 34 08 c0    	add    $0xc0083494,%edx
c00069aa:	89 02                	mov    %eax,(%edx)
c00069ac:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00069af:	8b 40 18             	mov    0x18(%eax),%eax
c00069b2:	89 c2                	mov    %eax,%edx
c00069b4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00069b7:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00069bd:	05 9c 34 08 c0       	add    $0xc008349c,%eax
c00069c2:	89 10                	mov    %edx,(%eax)
c00069c4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00069c7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00069ca:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c00069d0:	81 c2 a8 34 08 c0    	add    $0xc00834a8,%edx
c00069d6:	89 02                	mov    %eax,(%edx)
c00069d8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00069db:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00069e1:	05 50 34 08 c0       	add    $0xc0083450,%eax
c00069e6:	c7 00 21 00 00 00    	movl   $0x21,(%eax)
c00069ec:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c00069f3:	00 00 00 
c00069f6:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c00069fd:	00 00 00 
c0006a00:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c0006a07:	00 00 00 
c0006a0a:	83 ec 04             	sub    $0x4,%esp
c0006a0d:	ff 75 d8             	pushl  -0x28(%ebp)
c0006a10:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c0006a16:	50                   	push   %eax
c0006a17:	6a 01                	push   $0x1
c0006a19:	e8 c9 34 00 00       	call   c0009ee7 <send_rec>
c0006a1e:	83 c4 10             	add    $0x10,%esp
c0006a21:	90                   	nop
c0006a22:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0006a25:	5b                   	pop    %ebx
c0006a26:	5e                   	pop    %esi
c0006a27:	5d                   	pop    %ebp
c0006a28:	c3                   	ret    

c0006a29 <do_fork>:
c0006a29:	55                   	push   %ebp
c0006a2a:	89 e5                	mov    %esp,%ebp
c0006a2c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006a32:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a35:	8b 00                	mov    (%eax),%eax
c0006a37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a3a:	83 ec 0c             	sub    $0xc,%esp
c0006a3d:	ff 75 f4             	pushl  -0xc(%ebp)
c0006a40:	e8 eb 3c 00 00       	call   c000a730 <fork_process>
c0006a45:	83 c4 10             	add    $0x10,%esp
c0006a48:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a4e:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0006a54:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a57:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a5a:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006a60:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a63:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006a66:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006a6d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006a74:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006a7b:	83 ec 04             	sub    $0x4,%esp
c0006a7e:	ff 75 ec             	pushl  -0x14(%ebp)
c0006a81:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006a84:	50                   	push   %eax
c0006a85:	6a 01                	push   $0x1
c0006a87:	e8 5b 34 00 00       	call   c0009ee7 <send_rec>
c0006a8c:	83 c4 10             	add    $0x10,%esp
c0006a8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a92:	c9                   	leave  
c0006a93:	c3                   	ret    

c0006a94 <do_exit>:
c0006a94:	55                   	push   %ebp
c0006a95:	89 e5                	mov    %esp,%ebp
c0006a97:	83 ec 18             	sub    $0x18,%esp
c0006a9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a9d:	8b 00                	mov    (%eax),%eax
c0006a9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006aa2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006aa5:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006aab:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006ab0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ab3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ab6:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006abc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006abf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ac2:	8b 40 44             	mov    0x44(%eax),%eax
c0006ac5:	89 c2                	mov    %eax,%edx
c0006ac7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006aca:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006ad0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ad3:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006ad9:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006ade:	0f b6 00             	movzbl (%eax),%eax
c0006ae1:	3c 04                	cmp    $0x4,%al
c0006ae3:	75 21                	jne    c0006b06 <do_exit+0x72>
c0006ae5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ae8:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006aee:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006af3:	c6 00 fb             	movb   $0xfb,(%eax)
c0006af6:	83 ec 0c             	sub    $0xc,%esp
c0006af9:	ff 75 ec             	pushl  -0x14(%ebp)
c0006afc:	e8 59 01 00 00       	call   c0006c5a <cleanup>
c0006b01:	83 c4 10             	add    $0x10,%esp
c0006b04:	eb 0a                	jmp    c0006b10 <do_exit+0x7c>
c0006b06:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b09:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0006b10:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006b17:	eb 6e                	jmp    c0006b87 <do_exit+0xf3>
c0006b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b1c:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b22:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b27:	8b 00                	mov    (%eax),%eax
c0006b29:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006b2c:	75 55                	jne    c0006b83 <do_exit+0xef>
c0006b2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b31:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b37:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b3c:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0006b42:	0f b6 05 69 44 08 c0 	movzbl 0xc0084469,%eax
c0006b49:	3c 04                	cmp    $0x4,%al
c0006b4b:	75 36                	jne    c0006b83 <do_exit+0xef>
c0006b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b50:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b56:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b5b:	0f b6 00             	movzbl (%eax),%eax
c0006b5e:	3c 03                	cmp    $0x3,%al
c0006b60:	75 21                	jne    c0006b83 <do_exit+0xef>
c0006b62:	c6 05 69 44 08 c0 fb 	movb   $0xfb,0xc0084469
c0006b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b6c:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006b72:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006b77:	83 ec 0c             	sub    $0xc,%esp
c0006b7a:	50                   	push   %eax
c0006b7b:	e8 da 00 00 00       	call   c0006c5a <cleanup>
c0006b80:	83 c4 10             	add    $0x10,%esp
c0006b83:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b87:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006b8b:	7e 8c                	jle    c0006b19 <do_exit+0x85>
c0006b8d:	90                   	nop
c0006b8e:	c9                   	leave  
c0006b8f:	c3                   	ret    

c0006b90 <do_wait>:
c0006b90:	55                   	push   %ebp
c0006b91:	89 e5                	mov    %esp,%ebp
c0006b93:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b9c:	8b 00                	mov    (%eax),%eax
c0006b9e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ba1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006ba8:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006baf:	eb 5f                	jmp    c0006c10 <do_wait+0x80>
c0006bb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006bb4:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006bba:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006bbf:	8b 00                	mov    (%eax),%eax
c0006bc1:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006bc4:	75 46                	jne    c0006c0c <do_wait+0x7c>
c0006bc6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006bcd:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006bd3:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006bd8:	0f b6 00             	movzbl (%eax),%eax
c0006bdb:	3c 03                	cmp    $0x3,%al
c0006bdd:	75 2d                	jne    c0006c0c <do_wait+0x7c>
c0006bdf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006be2:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006be8:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006bed:	c6 00 fb             	movb   $0xfb,(%eax)
c0006bf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006bf3:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006bf9:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006bfe:	83 ec 0c             	sub    $0xc,%esp
c0006c01:	50                   	push   %eax
c0006c02:	e8 53 00 00 00       	call   c0006c5a <cleanup>
c0006c07:	83 c4 10             	add    $0x10,%esp
c0006c0a:	eb 4c                	jmp    c0006c58 <do_wait+0xc8>
c0006c0c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006c10:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006c14:	7e 9b                	jle    c0006bb1 <do_wait+0x21>
c0006c16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006c1a:	74 13                	je     c0006c2f <do_wait+0x9f>
c0006c1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c1f:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006c25:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006c2a:	c6 00 04             	movb   $0x4,(%eax)
c0006c2d:	eb 29                	jmp    c0006c58 <do_wait+0xc8>
c0006c2f:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006c36:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006c3d:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006c44:	83 ec 04             	sub    $0x4,%esp
c0006c47:	ff 75 ec             	pushl  -0x14(%ebp)
c0006c4a:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006c4d:	50                   	push   %eax
c0006c4e:	6a 01                	push   $0x1
c0006c50:	e8 92 32 00 00       	call   c0009ee7 <send_rec>
c0006c55:	83 c4 10             	add    $0x10,%esp
c0006c58:	c9                   	leave  
c0006c59:	c3                   	ret    

c0006c5a <cleanup>:
c0006c5a:	55                   	push   %ebp
c0006c5b:	89 e5                	mov    %esp,%ebp
c0006c5d:	83 ec 78             	sub    $0x78,%esp
c0006c60:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006c67:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006c6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c71:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006c77:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c7d:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006c83:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006c86:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c89:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006c8f:	83 ec 04             	sub    $0x4,%esp
c0006c92:	50                   	push   %eax
c0006c93:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006c96:	50                   	push   %eax
c0006c97:	6a 01                	push   $0x1
c0006c99:	e8 49 32 00 00       	call   c0009ee7 <send_rec>
c0006c9e:	83 c4 10             	add    $0x10,%esp
c0006ca1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ca4:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006cab:	90                   	nop
c0006cac:	c9                   	leave  
c0006cad:	c3                   	ret    

c0006cae <init_bitmap>:
c0006cae:	55                   	push   %ebp
c0006caf:	89 e5                	mov    %esp,%ebp
c0006cb1:	83 ec 08             	sub    $0x8,%esp
c0006cb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cb7:	8b 50 04             	mov    0x4(%eax),%edx
c0006cba:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cbd:	8b 00                	mov    (%eax),%eax
c0006cbf:	83 ec 04             	sub    $0x4,%esp
c0006cc2:	52                   	push   %edx
c0006cc3:	6a 00                	push   $0x0
c0006cc5:	50                   	push   %eax
c0006cc6:	e8 e0 4d 00 00       	call   c000baab <Memset>
c0006ccb:	83 c4 10             	add    $0x10,%esp
c0006cce:	90                   	nop
c0006ccf:	c9                   	leave  
c0006cd0:	c3                   	ret    

c0006cd1 <test_bit_val>:
c0006cd1:	55                   	push   %ebp
c0006cd2:	89 e5                	mov    %esp,%ebp
c0006cd4:	53                   	push   %ebx
c0006cd5:	83 ec 10             	sub    $0x10,%esp
c0006cd8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cdb:	8d 50 07             	lea    0x7(%eax),%edx
c0006cde:	85 c0                	test   %eax,%eax
c0006ce0:	0f 48 c2             	cmovs  %edx,%eax
c0006ce3:	c1 f8 03             	sar    $0x3,%eax
c0006ce6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ce9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cec:	99                   	cltd   
c0006ced:	c1 ea 1d             	shr    $0x1d,%edx
c0006cf0:	01 d0                	add    %edx,%eax
c0006cf2:	83 e0 07             	and    $0x7,%eax
c0006cf5:	29 d0                	sub    %edx,%eax
c0006cf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cfa:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cfd:	8b 10                	mov    (%eax),%edx
c0006cff:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d02:	01 d0                	add    %edx,%eax
c0006d04:	0f b6 00             	movzbl (%eax),%eax
c0006d07:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006d0a:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006d0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d11:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006d16:	89 c1                	mov    %eax,%ecx
c0006d18:	d3 e3                	shl    %cl,%ebx
c0006d1a:	89 d8                	mov    %ebx,%eax
c0006d1c:	21 c2                	and    %eax,%edx
c0006d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d21:	89 c1                	mov    %eax,%ecx
c0006d23:	d3 fa                	sar    %cl,%edx
c0006d25:	89 d0                	mov    %edx,%eax
c0006d27:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d2a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006d2e:	0f 9f c0             	setg   %al
c0006d31:	0f b6 c0             	movzbl %al,%eax
c0006d34:	83 c4 10             	add    $0x10,%esp
c0006d37:	5b                   	pop    %ebx
c0006d38:	5d                   	pop    %ebp
c0006d39:	c3                   	ret    

c0006d3a <set_bit_val>:
c0006d3a:	55                   	push   %ebp
c0006d3b:	89 e5                	mov    %esp,%ebp
c0006d3d:	83 ec 10             	sub    $0x10,%esp
c0006d40:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d43:	8d 50 07             	lea    0x7(%eax),%edx
c0006d46:	85 c0                	test   %eax,%eax
c0006d48:	0f 48 c2             	cmovs  %edx,%eax
c0006d4b:	c1 f8 03             	sar    $0x3,%eax
c0006d4e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d54:	99                   	cltd   
c0006d55:	c1 ea 1d             	shr    $0x1d,%edx
c0006d58:	01 d0                	add    %edx,%eax
c0006d5a:	83 e0 07             	and    $0x7,%eax
c0006d5d:	29 d0                	sub    %edx,%eax
c0006d5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d62:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d65:	8b 10                	mov    (%eax),%edx
c0006d67:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d6a:	01 d0                	add    %edx,%eax
c0006d6c:	0f b6 00             	movzbl (%eax),%eax
c0006d6f:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006d72:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006d76:	7e 13                	jle    c0006d8b <set_bit_val+0x51>
c0006d78:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d7b:	ba 01 00 00 00       	mov    $0x1,%edx
c0006d80:	89 c1                	mov    %eax,%ecx
c0006d82:	d3 e2                	shl    %cl,%edx
c0006d84:	89 d0                	mov    %edx,%eax
c0006d86:	08 45 ff             	or     %al,-0x1(%ebp)
c0006d89:	eb 13                	jmp    c0006d9e <set_bit_val+0x64>
c0006d8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d8e:	ba 01 00 00 00       	mov    $0x1,%edx
c0006d93:	89 c1                	mov    %eax,%ecx
c0006d95:	d3 e2                	shl    %cl,%edx
c0006d97:	89 d0                	mov    %edx,%eax
c0006d99:	f7 d0                	not    %eax
c0006d9b:	20 45 ff             	and    %al,-0x1(%ebp)
c0006d9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006da1:	8b 10                	mov    (%eax),%edx
c0006da3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006da6:	01 c2                	add    %eax,%edx
c0006da8:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006dac:	88 02                	mov    %al,(%edx)
c0006dae:	b8 01 00 00 00       	mov    $0x1,%eax
c0006db3:	c9                   	leave  
c0006db4:	c3                   	ret    

c0006db5 <set_bits>:
c0006db5:	55                   	push   %ebp
c0006db6:	89 e5                	mov    %esp,%ebp
c0006db8:	83 ec 10             	sub    $0x10,%esp
c0006dbb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006dc2:	eb 1c                	jmp    c0006de0 <set_bits+0x2b>
c0006dc4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006dc7:	8d 50 01             	lea    0x1(%eax),%edx
c0006dca:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006dcd:	ff 75 10             	pushl  0x10(%ebp)
c0006dd0:	50                   	push   %eax
c0006dd1:	ff 75 08             	pushl  0x8(%ebp)
c0006dd4:	e8 61 ff ff ff       	call   c0006d3a <set_bit_val>
c0006dd9:	83 c4 0c             	add    $0xc,%esp
c0006ddc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006de0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006de3:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006de6:	7c dc                	jl     c0006dc4 <set_bits+0xf>
c0006de8:	b8 01 00 00 00       	mov    $0x1,%eax
c0006ded:	c9                   	leave  
c0006dee:	c3                   	ret    

c0006def <get_first_free_bit>:
c0006def:	55                   	push   %ebp
c0006df0:	89 e5                	mov    %esp,%ebp
c0006df2:	83 ec 10             	sub    $0x10,%esp
c0006df5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006df8:	8b 40 04             	mov    0x4(%eax),%eax
c0006dfb:	c1 e0 03             	shl    $0x3,%eax
c0006dfe:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e01:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e04:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e07:	eb 1b                	jmp    c0006e24 <get_first_free_bit+0x35>
c0006e09:	ff 75 fc             	pushl  -0x4(%ebp)
c0006e0c:	ff 75 08             	pushl  0x8(%ebp)
c0006e0f:	e8 bd fe ff ff       	call   c0006cd1 <test_bit_val>
c0006e14:	83 c4 08             	add    $0x8,%esp
c0006e17:	85 c0                	test   %eax,%eax
c0006e19:	75 05                	jne    c0006e20 <get_first_free_bit+0x31>
c0006e1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e1e:	eb 11                	jmp    c0006e31 <get_first_free_bit+0x42>
c0006e20:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006e24:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e27:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006e2a:	7c dd                	jl     c0006e09 <get_first_free_bit+0x1a>
c0006e2c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006e31:	c9                   	leave  
c0006e32:	c3                   	ret    

c0006e33 <get_bits>:
c0006e33:	55                   	push   %ebp
c0006e34:	89 e5                	mov    %esp,%ebp
c0006e36:	83 ec 20             	sub    $0x20,%esp
c0006e39:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006e40:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e43:	ff 75 08             	pushl  0x8(%ebp)
c0006e46:	e8 a4 ff ff ff       	call   c0006def <get_first_free_bit>
c0006e4b:	83 c4 08             	add    $0x8,%esp
c0006e4e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e51:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e54:	8b 40 04             	mov    0x4(%eax),%eax
c0006e57:	c1 e0 03             	shl    $0x3,%eax
c0006e5a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e5d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e60:	83 e8 01             	sub    $0x1,%eax
c0006e63:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e66:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006e6a:	75 08                	jne    c0006e74 <get_bits+0x41>
c0006e6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e6f:	e9 85 00 00 00       	jmp    c0006ef9 <get_bits+0xc6>
c0006e74:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e77:	83 c0 01             	add    $0x1,%eax
c0006e7a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e80:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e83:	eb 58                	jmp    c0006edd <get_bits+0xaa>
c0006e85:	ff 75 f8             	pushl  -0x8(%ebp)
c0006e88:	ff 75 08             	pushl  0x8(%ebp)
c0006e8b:	e8 41 fe ff ff       	call   c0006cd1 <test_bit_val>
c0006e90:	83 c4 08             	add    $0x8,%esp
c0006e93:	85 c0                	test   %eax,%eax
c0006e95:	75 0a                	jne    c0006ea1 <get_bits+0x6e>
c0006e97:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006e9b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006e9f:	eb 2b                	jmp    c0006ecc <get_bits+0x99>
c0006ea1:	6a 00                	push   $0x0
c0006ea3:	ff 75 08             	pushl  0x8(%ebp)
c0006ea6:	e8 44 ff ff ff       	call   c0006def <get_first_free_bit>
c0006eab:	83 c4 08             	add    $0x8,%esp
c0006eae:	83 c0 01             	add    $0x1,%eax
c0006eb1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006eb4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006eb7:	83 c0 01             	add    $0x1,%eax
c0006eba:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ebd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ec0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ec6:	83 e8 01             	sub    $0x1,%eax
c0006ec9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ecc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ecf:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006ed2:	7c 09                	jl     c0006edd <get_bits+0xaa>
c0006ed4:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006edb:	eb 0d                	jmp    c0006eea <get_bits+0xb7>
c0006edd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ee0:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006ee3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006ee6:	85 c0                	test   %eax,%eax
c0006ee8:	7f 9b                	jg     c0006e85 <get_bits+0x52>
c0006eea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006eed:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006ef0:	83 c0 01             	add    $0x1,%eax
c0006ef3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ef6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ef9:	c9                   	leave  
c0006efa:	c3                   	ret    

c0006efb <get_a_page2>:
c0006efb:	55                   	push   %ebp
c0006efc:	89 e5                	mov    %esp,%ebp
c0006efe:	83 ec 18             	sub    $0x18,%esp
c0006f01:	83 ec 0c             	sub    $0xc,%esp
c0006f04:	ff 75 0c             	pushl  0xc(%ebp)
c0006f07:	e8 1e 00 00 00       	call   c0006f2a <get_a_page>
c0006f0c:	83 c4 10             	add    $0x10,%esp
c0006f0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f12:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006f15:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f18:	83 ec 08             	sub    $0x8,%esp
c0006f1b:	52                   	push   %edx
c0006f1c:	50                   	push   %eax
c0006f1d:	e8 61 01 00 00       	call   c0007083 <add_map_entry>
c0006f22:	83 c4 10             	add    $0x10,%esp
c0006f25:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f28:	c9                   	leave  
c0006f29:	c3                   	ret    

c0006f2a <get_a_page>:
c0006f2a:	55                   	push   %ebp
c0006f2b:	89 e5                	mov    %esp,%ebp
c0006f2d:	83 ec 20             	sub    $0x20,%esp
c0006f30:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006f34:	75 22                	jne    c0006f58 <get_a_page+0x2e>
c0006f36:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006f3b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f3e:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006f43:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f46:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006f4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f4e:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006f53:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f56:	eb 20                	jmp    c0006f78 <get_a_page+0x4e>
c0006f58:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006f5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f60:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006f65:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f68:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006f6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f70:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006f75:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f78:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006f7b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006f7e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006f81:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006f84:	6a 01                	push   $0x1
c0006f86:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006f89:	50                   	push   %eax
c0006f8a:	e8 a4 fe ff ff       	call   c0006e33 <get_bits>
c0006f8f:	83 c4 08             	add    $0x8,%esp
c0006f92:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006f98:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006f9b:	c1 e2 0c             	shl    $0xc,%edx
c0006f9e:	01 d0                	add    %edx,%eax
c0006fa0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006fa3:	6a 01                	push   $0x1
c0006fa5:	ff 75 fc             	pushl  -0x4(%ebp)
c0006fa8:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006fab:	50                   	push   %eax
c0006fac:	e8 89 fd ff ff       	call   c0006d3a <set_bit_val>
c0006fb1:	83 c4 0c             	add    $0xc,%esp
c0006fb4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006fb7:	c9                   	leave  
c0006fb8:	c3                   	ret    

c0006fb9 <get_virtual_address>:
c0006fb9:	55                   	push   %ebp
c0006fba:	89 e5                	mov    %esp,%ebp
c0006fbc:	83 ec 28             	sub    $0x28,%esp
c0006fbf:	e8 e4 a8 ff ff       	call   c00018a8 <get_running_thread_pcb>
c0006fc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fc7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006fcb:	75 1a                	jne    c0006fe7 <get_virtual_address+0x2e>
c0006fcd:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006fd2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006fd5:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006fda:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006fdd:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006fe2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fe5:	eb 18                	jmp    c0006fff <get_virtual_address+0x46>
c0006fe7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006fea:	8b 40 0c             	mov    0xc(%eax),%eax
c0006fed:	83 ec 04             	sub    $0x4,%esp
c0006ff0:	6a 0c                	push   $0xc
c0006ff2:	50                   	push   %eax
c0006ff3:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006ff6:	50                   	push   %eax
c0006ff7:	e8 c6 0b 00 00       	call   c0007bc2 <Memcpy>
c0006ffc:	83 c4 10             	add    $0x10,%esp
c0006fff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007002:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007005:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007008:	89 55 dc             	mov    %edx,-0x24(%ebp)
c000700b:	8b 45 08             	mov    0x8(%ebp),%eax
c000700e:	83 ec 08             	sub    $0x8,%esp
c0007011:	50                   	push   %eax
c0007012:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007015:	50                   	push   %eax
c0007016:	e8 18 fe ff ff       	call   c0006e33 <get_bits>
c000701b:	83 c4 10             	add    $0x10,%esp
c000701e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007021:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007024:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0007027:	c1 e2 0c             	shl    $0xc,%edx
c000702a:	01 d0                	add    %edx,%eax
c000702c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000702f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007032:	50                   	push   %eax
c0007033:	6a 01                	push   $0x1
c0007035:	ff 75 f0             	pushl  -0x10(%ebp)
c0007038:	8d 45 d8             	lea    -0x28(%ebp),%eax
c000703b:	50                   	push   %eax
c000703c:	e8 74 fd ff ff       	call   c0006db5 <set_bits>
c0007041:	83 c4 10             	add    $0x10,%esp
c0007044:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007047:	c9                   	leave  
c0007048:	c3                   	ret    

c0007049 <ptr_pde>:
c0007049:	55                   	push   %ebp
c000704a:	89 e5                	mov    %esp,%ebp
c000704c:	8b 45 08             	mov    0x8(%ebp),%eax
c000704f:	c1 e8 16             	shr    $0x16,%eax
c0007052:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0007057:	c1 e0 02             	shl    $0x2,%eax
c000705a:	5d                   	pop    %ebp
c000705b:	c3                   	ret    

c000705c <ptr_pte>:
c000705c:	55                   	push   %ebp
c000705d:	89 e5                	mov    %esp,%ebp
c000705f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007062:	c1 e8 0a             	shr    $0xa,%eax
c0007065:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c000706a:	89 c2                	mov    %eax,%edx
c000706c:	8b 45 08             	mov    0x8(%ebp),%eax
c000706f:	c1 e8 0c             	shr    $0xc,%eax
c0007072:	25 ff 03 00 00       	and    $0x3ff,%eax
c0007077:	c1 e0 02             	shl    $0x2,%eax
c000707a:	01 d0                	add    %edx,%eax
c000707c:	2d 00 00 40 00       	sub    $0x400000,%eax
c0007081:	5d                   	pop    %ebp
c0007082:	c3                   	ret    

c0007083 <add_map_entry>:
c0007083:	55                   	push   %ebp
c0007084:	89 e5                	mov    %esp,%ebp
c0007086:	83 ec 18             	sub    $0x18,%esp
c0007089:	ff 75 08             	pushl  0x8(%ebp)
c000708c:	e8 b8 ff ff ff       	call   c0007049 <ptr_pde>
c0007091:	83 c4 04             	add    $0x4,%esp
c0007094:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007097:	ff 75 08             	pushl  0x8(%ebp)
c000709a:	e8 bd ff ff ff       	call   c000705c <ptr_pte>
c000709f:	83 c4 04             	add    $0x4,%esp
c00070a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070a8:	8b 00                	mov    (%eax),%eax
c00070aa:	83 e0 01             	and    $0x1,%eax
c00070ad:	85 c0                	test   %eax,%eax
c00070af:	74 1b                	je     c00070cc <add_map_entry+0x49>
c00070b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070b4:	8b 00                	mov    (%eax),%eax
c00070b6:	83 e0 01             	and    $0x1,%eax
c00070b9:	85 c0                	test   %eax,%eax
c00070bb:	75 51                	jne    c000710e <add_map_entry+0x8b>
c00070bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070c0:	83 c8 07             	or     $0x7,%eax
c00070c3:	89 c2                	mov    %eax,%edx
c00070c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070c8:	89 10                	mov    %edx,(%eax)
c00070ca:	eb 42                	jmp    c000710e <add_map_entry+0x8b>
c00070cc:	6a 00                	push   $0x0
c00070ce:	e8 57 fe ff ff       	call   c0006f2a <get_a_page>
c00070d3:	83 c4 04             	add    $0x4,%esp
c00070d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00070d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070dc:	83 c8 07             	or     $0x7,%eax
c00070df:	89 c2                	mov    %eax,%edx
c00070e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070e4:	89 10                	mov    %edx,(%eax)
c00070e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070e9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070ee:	83 ec 04             	sub    $0x4,%esp
c00070f1:	68 00 10 00 00       	push   $0x1000
c00070f6:	6a 00                	push   $0x0
c00070f8:	50                   	push   %eax
c00070f9:	e8 ad 49 00 00       	call   c000baab <Memset>
c00070fe:	83 c4 10             	add    $0x10,%esp
c0007101:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007104:	83 c8 07             	or     $0x7,%eax
c0007107:	89 c2                	mov    %eax,%edx
c0007109:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000710c:	89 10                	mov    %edx,(%eax)
c000710e:	90                   	nop
c000710f:	c9                   	leave  
c0007110:	c3                   	ret    

c0007111 <alloc_virtual_memory>:
c0007111:	55                   	push   %ebp
c0007112:	89 e5                	mov    %esp,%ebp
c0007114:	83 ec 28             	sub    $0x28,%esp
c0007117:	8b 45 08             	mov    0x8(%ebp),%eax
c000711a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000711f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007122:	8b 45 08             	mov    0x8(%ebp),%eax
c0007125:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007128:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000712b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000712e:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0007131:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007134:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007139:	c1 e8 0c             	shr    $0xc,%eax
c000713c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000713f:	e8 64 a7 ff ff       	call   c00018a8 <get_running_thread_pcb>
c0007144:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007147:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000714a:	8b 40 08             	mov    0x8(%eax),%eax
c000714d:	85 c0                	test   %eax,%eax
c000714f:	75 09                	jne    c000715a <alloc_virtual_memory+0x49>
c0007151:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007158:	eb 07                	jmp    c0007161 <alloc_virtual_memory+0x50>
c000715a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007161:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007168:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000716f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007176:	eb 47                	jmp    c00071bf <alloc_virtual_memory+0xae>
c0007178:	83 ec 08             	sub    $0x8,%esp
c000717b:	ff 75 f0             	pushl  -0x10(%ebp)
c000717e:	6a 01                	push   $0x1
c0007180:	e8 34 fe ff ff       	call   c0006fb9 <get_virtual_address>
c0007185:	83 c4 10             	add    $0x10,%esp
c0007188:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000718b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000718f:	74 13                	je     c00071a4 <alloc_virtual_memory+0x93>
c0007191:	83 ec 0c             	sub    $0xc,%esp
c0007194:	ff 75 f0             	pushl  -0x10(%ebp)
c0007197:	e8 8e fd ff ff       	call   c0006f2a <get_a_page>
c000719c:	83 c4 10             	add    $0x10,%esp
c000719f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00071a2:	eb 06                	jmp    c00071aa <alloc_virtual_memory+0x99>
c00071a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00071a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00071aa:	83 ec 08             	sub    $0x8,%esp
c00071ad:	ff 75 f4             	pushl  -0xc(%ebp)
c00071b0:	ff 75 d8             	pushl  -0x28(%ebp)
c00071b3:	e8 cb fe ff ff       	call   c0007083 <add_map_entry>
c00071b8:	83 c4 10             	add    $0x10,%esp
c00071bb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00071bf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00071c2:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00071c5:	72 b1                	jb     c0007178 <alloc_virtual_memory+0x67>
c00071c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00071ca:	25 ff 0f 00 00       	and    $0xfff,%eax
c00071cf:	89 c2                	mov    %eax,%edx
c00071d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071d4:	01 d0                	add    %edx,%eax
c00071d6:	c9                   	leave  
c00071d7:	c3                   	ret    

c00071d8 <get_physical_address>:
c00071d8:	55                   	push   %ebp
c00071d9:	89 e5                	mov    %esp,%ebp
c00071db:	83 ec 10             	sub    $0x10,%esp
c00071de:	ff 75 08             	pushl  0x8(%ebp)
c00071e1:	e8 76 fe ff ff       	call   c000705c <ptr_pte>
c00071e6:	83 c4 04             	add    $0x4,%esp
c00071e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00071ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00071ef:	8b 00                	mov    (%eax),%eax
c00071f1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00071f6:	89 c2                	mov    %eax,%edx
c00071f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00071fb:	25 ff 0f 00 00       	and    $0xfff,%eax
c0007200:	09 d0                	or     %edx,%eax
c0007202:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007205:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007208:	c9                   	leave  
c0007209:	c3                   	ret    

c000720a <alloc_physical_memory>:
c000720a:	55                   	push   %ebp
c000720b:	89 e5                	mov    %esp,%ebp
c000720d:	83 ec 38             	sub    $0x38,%esp
c0007210:	8b 45 08             	mov    0x8(%ebp),%eax
c0007213:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007218:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000721b:	e8 88 a6 ff ff       	call   c00018a8 <get_running_thread_pcb>
c0007220:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007223:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007227:	75 1a                	jne    c0007243 <alloc_physical_memory+0x39>
c0007229:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000722e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007231:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007236:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007239:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000723e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007241:	eb 18                	jmp    c000725b <alloc_physical_memory+0x51>
c0007243:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007246:	8b 40 0c             	mov    0xc(%eax),%eax
c0007249:	83 ec 04             	sub    $0x4,%esp
c000724c:	6a 0c                	push   $0xc
c000724e:	50                   	push   %eax
c000724f:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007252:	50                   	push   %eax
c0007253:	e8 6a 09 00 00       	call   c0007bc2 <Memcpy>
c0007258:	83 c4 10             	add    $0x10,%esp
c000725b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000725e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0007261:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007264:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0007267:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000726a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000726d:	29 c2                	sub    %eax,%edx
c000726f:	89 d0                	mov    %edx,%eax
c0007271:	c1 e8 0c             	shr    $0xc,%eax
c0007274:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007277:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000727a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000727d:	c1 e2 0c             	shl    $0xc,%edx
c0007280:	01 d0                	add    %edx,%eax
c0007282:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007285:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007288:	6a 01                	push   $0x1
c000728a:	6a 01                	push   $0x1
c000728c:	50                   	push   %eax
c000728d:	8d 45 d0             	lea    -0x30(%ebp),%eax
c0007290:	50                   	push   %eax
c0007291:	e8 1f fb ff ff       	call   c0006db5 <set_bits>
c0007296:	83 c4 10             	add    $0x10,%esp
c0007299:	83 ec 0c             	sub    $0xc,%esp
c000729c:	ff 75 0c             	pushl  0xc(%ebp)
c000729f:	e8 86 fc ff ff       	call   c0006f2a <get_a_page>
c00072a4:	83 c4 10             	add    $0x10,%esp
c00072a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00072aa:	83 ec 08             	sub    $0x8,%esp
c00072ad:	ff 75 e4             	pushl  -0x1c(%ebp)
c00072b0:	ff 75 08             	pushl  0x8(%ebp)
c00072b3:	e8 cb fd ff ff       	call   c0007083 <add_map_entry>
c00072b8:	83 c4 10             	add    $0x10,%esp
c00072bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00072be:	c9                   	leave  
c00072bf:	c3                   	ret    

c00072c0 <alloc_memory>:
c00072c0:	55                   	push   %ebp
c00072c1:	89 e5                	mov    %esp,%ebp
c00072c3:	83 ec 18             	sub    $0x18,%esp
c00072c6:	83 ec 08             	sub    $0x8,%esp
c00072c9:	ff 75 0c             	pushl  0xc(%ebp)
c00072cc:	ff 75 08             	pushl  0x8(%ebp)
c00072cf:	e8 e5 fc ff ff       	call   c0006fb9 <get_virtual_address>
c00072d4:	83 c4 10             	add    $0x10,%esp
c00072d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00072da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072dd:	2d 00 10 00 00       	sub    $0x1000,%eax
c00072e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00072e5:	eb 29                	jmp    c0007310 <alloc_memory+0x50>
c00072e7:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c00072ee:	83 ec 0c             	sub    $0xc,%esp
c00072f1:	ff 75 0c             	pushl  0xc(%ebp)
c00072f4:	e8 31 fc ff ff       	call   c0006f2a <get_a_page>
c00072f9:	83 c4 10             	add    $0x10,%esp
c00072fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00072ff:	83 ec 08             	sub    $0x8,%esp
c0007302:	ff 75 ec             	pushl  -0x14(%ebp)
c0007305:	ff 75 f4             	pushl  -0xc(%ebp)
c0007308:	e8 76 fd ff ff       	call   c0007083 <add_map_entry>
c000730d:	83 c4 10             	add    $0x10,%esp
c0007310:	8b 45 08             	mov    0x8(%ebp),%eax
c0007313:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007316:	89 55 08             	mov    %edx,0x8(%ebp)
c0007319:	85 c0                	test   %eax,%eax
c000731b:	75 ca                	jne    c00072e7 <alloc_memory+0x27>
c000731d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007320:	c9                   	leave  
c0007321:	c3                   	ret    

c0007322 <get_a_virtual_page>:
c0007322:	55                   	push   %ebp
c0007323:	89 e5                	mov    %esp,%ebp
c0007325:	83 ec 18             	sub    $0x18,%esp
c0007328:	ff 75 08             	pushl  0x8(%ebp)
c000732b:	e8 fa fb ff ff       	call   c0006f2a <get_a_page>
c0007330:	83 c4 04             	add    $0x4,%esp
c0007333:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007336:	83 ec 08             	sub    $0x8,%esp
c0007339:	ff 75 f4             	pushl  -0xc(%ebp)
c000733c:	ff 75 0c             	pushl  0xc(%ebp)
c000733f:	e8 3f fd ff ff       	call   c0007083 <add_map_entry>
c0007344:	83 c4 10             	add    $0x10,%esp
c0007347:	8b 45 0c             	mov    0xc(%ebp),%eax
c000734a:	c9                   	leave  
c000734b:	c3                   	ret    

c000734c <block2arena>:
c000734c:	55                   	push   %ebp
c000734d:	89 e5                	mov    %esp,%ebp
c000734f:	83 ec 10             	sub    $0x10,%esp
c0007352:	8b 45 08             	mov    0x8(%ebp),%eax
c0007355:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000735a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000735d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007360:	c9                   	leave  
c0007361:	c3                   	ret    

c0007362 <sys_malloc2>:
c0007362:	55                   	push   %ebp
c0007363:	89 e5                	mov    %esp,%ebp
c0007365:	83 ec 58             	sub    $0x58,%esp
c0007368:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000736f:	e8 34 a5 ff ff       	call   c00018a8 <get_running_thread_pcb>
c0007374:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007377:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000737a:	8b 40 08             	mov    0x8(%eax),%eax
c000737d:	85 c0                	test   %eax,%eax
c000737f:	75 10                	jne    c0007391 <sys_malloc2+0x2f>
c0007381:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007388:	c7 45 ec 80 47 08 c0 	movl   $0xc0084780,-0x14(%ebp)
c000738f:	eb 10                	jmp    c00073a1 <sys_malloc2+0x3f>
c0007391:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007398:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000739b:	83 c0 10             	add    $0x10,%eax
c000739e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00073a1:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c00073a8:	76 50                	jbe    c00073fa <sys_malloc2+0x98>
c00073aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00073ad:	05 0b 10 00 00       	add    $0x100b,%eax
c00073b2:	c1 e8 0c             	shr    $0xc,%eax
c00073b5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00073b8:	83 ec 08             	sub    $0x8,%esp
c00073bb:	ff 75 f0             	pushl  -0x10(%ebp)
c00073be:	ff 75 d8             	pushl  -0x28(%ebp)
c00073c1:	e8 fa fe ff ff       	call   c00072c0 <alloc_memory>
c00073c6:	83 c4 10             	add    $0x10,%esp
c00073c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00073cc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00073cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00073d2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00073db:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073de:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00073e5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073e8:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c00073ec:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073ef:	83 c0 0c             	add    $0xc,%eax
c00073f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00073f5:	e9 b2 01 00 00       	jmp    c00075ac <sys_malloc2+0x24a>
c00073fa:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007401:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007408:	eb 26                	jmp    c0007430 <sys_malloc2+0xce>
c000740a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000740d:	89 d0                	mov    %edx,%eax
c000740f:	01 c0                	add    %eax,%eax
c0007411:	01 d0                	add    %edx,%eax
c0007413:	c1 e0 03             	shl    $0x3,%eax
c0007416:	89 c2                	mov    %eax,%edx
c0007418:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000741b:	01 d0                	add    %edx,%eax
c000741d:	8b 00                	mov    (%eax),%eax
c000741f:	39 45 08             	cmp    %eax,0x8(%ebp)
c0007422:	77 08                	ja     c000742c <sys_malloc2+0xca>
c0007424:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007427:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000742a:	eb 0a                	jmp    c0007436 <sys_malloc2+0xd4>
c000742c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007430:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007434:	7e d4                	jle    c000740a <sys_malloc2+0xa8>
c0007436:	83 ec 08             	sub    $0x8,%esp
c0007439:	ff 75 f0             	pushl  -0x10(%ebp)
c000743c:	6a 01                	push   $0x1
c000743e:	e8 7d fe ff ff       	call   c00072c0 <alloc_memory>
c0007443:	83 c4 10             	add    $0x10,%esp
c0007446:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007449:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000744c:	89 d0                	mov    %edx,%eax
c000744e:	01 c0                	add    %eax,%eax
c0007450:	01 d0                	add    %edx,%eax
c0007452:	c1 e0 03             	shl    $0x3,%eax
c0007455:	89 c2                	mov    %eax,%edx
c0007457:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000745a:	01 d0                	add    %edx,%eax
c000745c:	83 ec 04             	sub    $0x4,%esp
c000745f:	6a 18                	push   $0x18
c0007461:	50                   	push   %eax
c0007462:	ff 75 cc             	pushl  -0x34(%ebp)
c0007465:	e8 58 07 00 00       	call   c0007bc2 <Memcpy>
c000746a:	83 c4 10             	add    $0x10,%esp
c000746d:	e8 ec 06 00 00       	call   c0007b5e <intr_disable>
c0007472:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007475:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007478:	89 d0                	mov    %edx,%eax
c000747a:	01 c0                	add    %eax,%eax
c000747c:	01 d0                	add    %edx,%eax
c000747e:	c1 e0 03             	shl    $0x3,%eax
c0007481:	89 c2                	mov    %eax,%edx
c0007483:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007486:	01 d0                	add    %edx,%eax
c0007488:	83 c0 08             	add    $0x8,%eax
c000748b:	83 ec 0c             	sub    $0xc,%esp
c000748e:	50                   	push   %eax
c000748f:	e8 ff 34 00 00       	call   c000a993 <isListEmpty>
c0007494:	83 c4 10             	add    $0x10,%esp
c0007497:	3c 01                	cmp    $0x1,%al
c0007499:	0f 85 91 00 00 00    	jne    c0007530 <sys_malloc2+0x1ce>
c000749f:	83 ec 08             	sub    $0x8,%esp
c00074a2:	ff 75 f0             	pushl  -0x10(%ebp)
c00074a5:	6a 01                	push   $0x1
c00074a7:	e8 14 fe ff ff       	call   c00072c0 <alloc_memory>
c00074ac:	83 c4 10             	add    $0x10,%esp
c00074af:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00074b2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00074b5:	8b 00                	mov    (%eax),%eax
c00074b7:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00074ba:	c7 45 bc 0c 00 00 00 	movl   $0xc,-0x44(%ebp)
c00074c1:	b8 00 10 00 00       	mov    $0x1000,%eax
c00074c6:	2b 45 bc             	sub    -0x44(%ebp),%eax
c00074c9:	ba 00 00 00 00       	mov    $0x0,%edx
c00074ce:	f7 75 c0             	divl   -0x40(%ebp)
c00074d1:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00074d4:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c00074d7:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00074da:	01 d0                	add    %edx,%eax
c00074dc:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00074df:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00074e6:	eb 3b                	jmp    c0007523 <sys_malloc2+0x1c1>
c00074e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00074eb:	0f af 45 c0          	imul   -0x40(%ebp),%eax
c00074ef:	89 c2                	mov    %eax,%edx
c00074f1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00074f4:	01 d0                	add    %edx,%eax
c00074f6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00074f9:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c00074fc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00074ff:	89 d0                	mov    %edx,%eax
c0007501:	01 c0                	add    %eax,%eax
c0007503:	01 d0                	add    %edx,%eax
c0007505:	c1 e0 03             	shl    $0x3,%eax
c0007508:	89 c2                	mov    %eax,%edx
c000750a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000750d:	01 d0                	add    %edx,%eax
c000750f:	83 c0 08             	add    $0x8,%eax
c0007512:	83 ec 08             	sub    $0x8,%esp
c0007515:	51                   	push   %ecx
c0007516:	50                   	push   %eax
c0007517:	e8 74 35 00 00       	call   c000aa90 <appendToDoubleLinkList>
c000751c:	83 c4 10             	add    $0x10,%esp
c000751f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007523:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007526:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007529:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000752c:	39 c2                	cmp    %eax,%edx
c000752e:	77 b8                	ja     c00074e8 <sys_malloc2+0x186>
c0007530:	83 ec 0c             	sub    $0xc,%esp
c0007533:	ff 75 c8             	pushl  -0x38(%ebp)
c0007536:	e8 4c 06 00 00       	call   c0007b87 <intr_set_status>
c000753b:	83 c4 10             	add    $0x10,%esp
c000753e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007541:	89 d0                	mov    %edx,%eax
c0007543:	01 c0                	add    %eax,%eax
c0007545:	01 d0                	add    %edx,%eax
c0007547:	c1 e0 03             	shl    $0x3,%eax
c000754a:	89 c2                	mov    %eax,%edx
c000754c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000754f:	01 d0                	add    %edx,%eax
c0007551:	83 c0 08             	add    $0x8,%eax
c0007554:	83 ec 0c             	sub    $0xc,%esp
c0007557:	50                   	push   %eax
c0007558:	e8 9d 36 00 00       	call   c000abfa <popFromDoubleLinkList>
c000755d:	83 c4 10             	add    $0x10,%esp
c0007560:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0007563:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0007566:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007569:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c000756d:	75 1c                	jne    c000758b <sys_malloc2+0x229>
c000756f:	68 9b 01 00 00       	push   $0x19b
c0007574:	68 0e b3 00 c0       	push   $0xc000b30e
c0007579:	68 0e b3 00 c0       	push   $0xc000b30e
c000757e:	68 18 b3 00 c0       	push   $0xc000b318
c0007583:	e8 ef 20 00 00       	call   c0009677 <assertion_failure>
c0007588:	83 c4 10             	add    $0x10,%esp
c000758b:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000758e:	83 ec 0c             	sub    $0xc,%esp
c0007591:	50                   	push   %eax
c0007592:	e8 b5 fd ff ff       	call   c000734c <block2arena>
c0007597:	83 c4 10             	add    $0x10,%esp
c000759a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000759d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00075a0:	8b 40 04             	mov    0x4(%eax),%eax
c00075a3:	8d 50 ff             	lea    -0x1(%eax),%edx
c00075a6:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00075a9:	89 50 04             	mov    %edx,0x4(%eax)
c00075ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00075b0:	75 1c                	jne    c00075ce <sys_malloc2+0x26c>
c00075b2:	68 a1 01 00 00       	push   $0x1a1
c00075b7:	68 0e b3 00 c0       	push   $0xc000b30e
c00075bc:	68 0e b3 00 c0       	push   $0xc000b30e
c00075c1:	68 2a b3 00 c0       	push   $0xc000b32a
c00075c6:	e8 ac 20 00 00       	call   c0009677 <assertion_failure>
c00075cb:	83 c4 10             	add    $0x10,%esp
c00075ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00075d1:	c9                   	leave  
c00075d2:	c3                   	ret    

c00075d3 <remove_map_entry>:
c00075d3:	55                   	push   %ebp
c00075d4:	89 e5                	mov    %esp,%ebp
c00075d6:	83 ec 10             	sub    $0x10,%esp
c00075d9:	ff 75 08             	pushl  0x8(%ebp)
c00075dc:	e8 7b fa ff ff       	call   c000705c <ptr_pte>
c00075e1:	83 c4 04             	add    $0x4,%esp
c00075e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00075e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00075ea:	8b 10                	mov    (%eax),%edx
c00075ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00075ef:	89 10                	mov    %edx,(%eax)
c00075f1:	90                   	nop
c00075f2:	c9                   	leave  
c00075f3:	c3                   	ret    

c00075f4 <free_a_page>:
c00075f4:	55                   	push   %ebp
c00075f5:	89 e5                	mov    %esp,%ebp
c00075f7:	83 ec 20             	sub    $0x20,%esp
c00075fa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00075fe:	75 21                	jne    c0007621 <free_a_page+0x2d>
c0007600:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007605:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007608:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000760d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007610:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007615:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007618:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c000761f:	eb 1f                	jmp    c0007640 <free_a_page+0x4c>
c0007621:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007626:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007629:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000762e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007631:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007636:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007639:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c0007640:	8b 45 08             	mov    0x8(%ebp),%eax
c0007643:	c1 e8 0c             	shr    $0xc,%eax
c0007646:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007649:	6a 00                	push   $0x0
c000764b:	ff 75 f8             	pushl  -0x8(%ebp)
c000764e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0007651:	50                   	push   %eax
c0007652:	e8 e3 f6 ff ff       	call   c0006d3a <set_bit_val>
c0007657:	83 c4 0c             	add    $0xc,%esp
c000765a:	ff 75 08             	pushl  0x8(%ebp)
c000765d:	e8 76 fb ff ff       	call   c00071d8 <get_physical_address>
c0007662:	83 c4 04             	add    $0x4,%esp
c0007665:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007668:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000766b:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007671:	85 c0                	test   %eax,%eax
c0007673:	0f 48 c2             	cmovs  %edx,%eax
c0007676:	c1 f8 0c             	sar    $0xc,%eax
c0007679:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000767c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000767f:	6a 00                	push   $0x0
c0007681:	ff 75 f0             	pushl  -0x10(%ebp)
c0007684:	50                   	push   %eax
c0007685:	e8 b0 f6 ff ff       	call   c0006d3a <set_bit_val>
c000768a:	83 c4 0c             	add    $0xc,%esp
c000768d:	ff 75 08             	pushl  0x8(%ebp)
c0007690:	e8 3e ff ff ff       	call   c00075d3 <remove_map_entry>
c0007695:	83 c4 04             	add    $0x4,%esp
c0007698:	90                   	nop
c0007699:	c9                   	leave  
c000769a:	c3                   	ret    

c000769b <sys_free>:
c000769b:	55                   	push   %ebp
c000769c:	89 e5                	mov    %esp,%ebp
c000769e:	83 ec 20             	sub    $0x20,%esp
c00076a1:	90                   	nop
c00076a2:	c9                   	leave  
c00076a3:	c3                   	ret    

c00076a4 <init_memory_block_desc>:
c00076a4:	55                   	push   %ebp
c00076a5:	89 e5                	mov    %esp,%ebp
c00076a7:	83 ec 18             	sub    $0x18,%esp
c00076aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00076b1:	e9 b2 00 00 00       	jmp    c0007768 <init_memory_block_desc+0xc4>
c00076b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00076ba:	75 1b                	jne    c00076d7 <init_memory_block_desc+0x33>
c00076bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076bf:	89 d0                	mov    %edx,%eax
c00076c1:	01 c0                	add    %eax,%eax
c00076c3:	01 d0                	add    %edx,%eax
c00076c5:	c1 e0 03             	shl    $0x3,%eax
c00076c8:	89 c2                	mov    %eax,%edx
c00076ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00076cd:	01 d0                	add    %edx,%eax
c00076cf:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c00076d5:	eb 2e                	jmp    c0007705 <init_memory_block_desc+0x61>
c00076d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076da:	89 d0                	mov    %edx,%eax
c00076dc:	01 c0                	add    %eax,%eax
c00076de:	01 d0                	add    %edx,%eax
c00076e0:	c1 e0 03             	shl    $0x3,%eax
c00076e3:	8d 50 e8             	lea    -0x18(%eax),%edx
c00076e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00076e9:	01 d0                	add    %edx,%eax
c00076eb:	8b 08                	mov    (%eax),%ecx
c00076ed:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076f0:	89 d0                	mov    %edx,%eax
c00076f2:	01 c0                	add    %eax,%eax
c00076f4:	01 d0                	add    %edx,%eax
c00076f6:	c1 e0 03             	shl    $0x3,%eax
c00076f9:	89 c2                	mov    %eax,%edx
c00076fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00076fe:	01 d0                	add    %edx,%eax
c0007700:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007703:	89 10                	mov    %edx,(%eax)
c0007705:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007708:	89 d0                	mov    %edx,%eax
c000770a:	01 c0                	add    %eax,%eax
c000770c:	01 d0                	add    %edx,%eax
c000770e:	c1 e0 03             	shl    $0x3,%eax
c0007711:	89 c2                	mov    %eax,%edx
c0007713:	8b 45 08             	mov    0x8(%ebp),%eax
c0007716:	01 d0                	add    %edx,%eax
c0007718:	8b 00                	mov    (%eax),%eax
c000771a:	89 c1                	mov    %eax,%ecx
c000771c:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007721:	ba 00 00 00 00       	mov    $0x0,%edx
c0007726:	f7 f1                	div    %ecx
c0007728:	89 c1                	mov    %eax,%ecx
c000772a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000772d:	89 d0                	mov    %edx,%eax
c000772f:	01 c0                	add    %eax,%eax
c0007731:	01 d0                	add    %edx,%eax
c0007733:	c1 e0 03             	shl    $0x3,%eax
c0007736:	89 c2                	mov    %eax,%edx
c0007738:	8b 45 08             	mov    0x8(%ebp),%eax
c000773b:	01 d0                	add    %edx,%eax
c000773d:	89 ca                	mov    %ecx,%edx
c000773f:	89 50 04             	mov    %edx,0x4(%eax)
c0007742:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007745:	89 d0                	mov    %edx,%eax
c0007747:	01 c0                	add    %eax,%eax
c0007749:	01 d0                	add    %edx,%eax
c000774b:	c1 e0 03             	shl    $0x3,%eax
c000774e:	89 c2                	mov    %eax,%edx
c0007750:	8b 45 08             	mov    0x8(%ebp),%eax
c0007753:	01 d0                	add    %edx,%eax
c0007755:	83 c0 08             	add    $0x8,%eax
c0007758:	83 ec 0c             	sub    $0xc,%esp
c000775b:	50                   	push   %eax
c000775c:	e8 04 32 00 00       	call   c000a965 <initDoubleLinkList>
c0007761:	83 c4 10             	add    $0x10,%esp
c0007764:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007768:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000776c:	0f 8e 44 ff ff ff    	jle    c00076b6 <init_memory_block_desc+0x12>
c0007772:	90                   	nop
c0007773:	c9                   	leave  
c0007774:	c3                   	ret    

c0007775 <init_memory2>:
c0007775:	55                   	push   %ebp
c0007776:	89 e5                	mov    %esp,%ebp
c0007778:	83 ec 38             	sub    $0x38,%esp
c000777b:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007782:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0007789:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000778c:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007791:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007794:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007799:	29 c2                	sub    %eax,%edx
c000779b:	89 d0                	mov    %edx,%eax
c000779d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00077a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00077a3:	89 c2                	mov    %eax,%edx
c00077a5:	c1 ea 1f             	shr    $0x1f,%edx
c00077a8:	01 d0                	add    %edx,%eax
c00077aa:	d1 f8                	sar    %eax
c00077ac:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c00077b1:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00077b6:	83 ec 0c             	sub    $0xc,%esp
c00077b9:	50                   	push   %eax
c00077ba:	e8 e6 06 00 00       	call   c0007ea5 <disp_int>
c00077bf:	83 c4 10             	add    $0x10,%esp
c00077c2:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00077c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077ca:	29 c2                	sub    %eax,%edx
c00077cc:	89 d0                	mov    %edx,%eax
c00077ce:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c00077d3:	83 ec 0c             	sub    $0xc,%esp
c00077d6:	68 36 b3 00 c0       	push   $0xc000b336
c00077db:	e8 ac 9d ff ff       	call   c000158c <disp_str>
c00077e0:	83 c4 10             	add    $0x10,%esp
c00077e3:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00077e8:	83 ec 0c             	sub    $0xc,%esp
c00077eb:	50                   	push   %eax
c00077ec:	e8 b4 06 00 00       	call   c0007ea5 <disp_int>
c00077f1:	83 c4 10             	add    $0x10,%esp
c00077f4:	83 ec 0c             	sub    $0xc,%esp
c00077f7:	68 36 b3 00 c0       	push   $0xc000b336
c00077fc:	e8 8b 9d ff ff       	call   c000158c <disp_str>
c0007801:	83 c4 10             	add    $0x10,%esp
c0007804:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007809:	05 ff 0f 00 00       	add    $0xfff,%eax
c000780e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007814:	85 c0                	test   %eax,%eax
c0007816:	0f 48 c2             	cmovs  %edx,%eax
c0007819:	c1 f8 0c             	sar    $0xc,%eax
c000781c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000781f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007822:	83 c0 07             	add    $0x7,%eax
c0007825:	8d 50 07             	lea    0x7(%eax),%edx
c0007828:	85 c0                	test   %eax,%eax
c000782a:	0f 48 c2             	cmovs  %edx,%eax
c000782d:	c1 f8 03             	sar    $0x3,%eax
c0007830:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007835:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000783a:	2d 00 00 00 40       	sub    $0x40000000,%eax
c000783f:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007844:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c000784a:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c000784f:	83 ec 04             	sub    $0x4,%esp
c0007852:	52                   	push   %edx
c0007853:	6a 00                	push   $0x0
c0007855:	50                   	push   %eax
c0007856:	e8 50 42 00 00       	call   c000baab <Memset>
c000785b:	83 c4 10             	add    $0x10,%esp
c000785e:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0007863:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007868:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000786e:	85 c0                	test   %eax,%eax
c0007870:	0f 48 c2             	cmovs  %edx,%eax
c0007873:	c1 f8 0c             	sar    $0xc,%eax
c0007876:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007879:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000787c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000787f:	ff 75 e8             	pushl  -0x18(%ebp)
c0007882:	6a 01                	push   $0x1
c0007884:	6a 00                	push   $0x0
c0007886:	68 ac 16 01 c0       	push   $0xc00116ac
c000788b:	e8 25 f5 ff ff       	call   c0006db5 <set_bits>
c0007890:	83 c4 10             	add    $0x10,%esp
c0007893:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007898:	05 ff 0f 00 00       	add    $0xfff,%eax
c000789d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078a3:	85 c0                	test   %eax,%eax
c00078a5:	0f 48 c2             	cmovs  %edx,%eax
c00078a8:	c1 f8 0c             	sar    $0xc,%eax
c00078ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078b1:	83 c0 07             	add    $0x7,%eax
c00078b4:	8d 50 07             	lea    0x7(%eax),%edx
c00078b7:	85 c0                	test   %eax,%eax
c00078b9:	0f 48 c2             	cmovs  %edx,%eax
c00078bc:	c1 f8 03             	sar    $0x3,%eax
c00078bf:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c00078c4:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00078c9:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00078cf:	01 d0                	add    %edx,%eax
c00078d1:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c00078d6:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c00078dc:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c00078e1:	83 ec 04             	sub    $0x4,%esp
c00078e4:	52                   	push   %edx
c00078e5:	6a 00                	push   $0x0
c00078e7:	50                   	push   %eax
c00078e8:	e8 be 41 00 00       	call   c000baab <Memset>
c00078ed:	83 c4 10             	add    $0x10,%esp
c00078f0:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00078f5:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078fa:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007900:	85 c0                	test   %eax,%eax
c0007902:	0f 48 c2             	cmovs  %edx,%eax
c0007905:	c1 f8 0c             	sar    $0xc,%eax
c0007908:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000790b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000790e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007911:	ff 75 e8             	pushl  -0x18(%ebp)
c0007914:	6a 01                	push   $0x1
c0007916:	ff 75 e0             	pushl  -0x20(%ebp)
c0007919:	68 ac 16 01 c0       	push   $0xc00116ac
c000791e:	e8 92 f4 ff ff       	call   c0006db5 <set_bits>
c0007923:	83 c4 10             	add    $0x10,%esp
c0007926:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c000792d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007930:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007933:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007936:	83 c0 07             	add    $0x7,%eax
c0007939:	8d 50 07             	lea    0x7(%eax),%edx
c000793c:	85 c0                	test   %eax,%eax
c000793e:	0f 48 c2             	cmovs  %edx,%eax
c0007941:	c1 f8 03             	sar    $0x3,%eax
c0007944:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007949:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000794e:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007954:	01 c2                	add    %eax,%edx
c0007956:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c000795b:	01 d0                	add    %edx,%eax
c000795d:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007962:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c0007968:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000796d:	83 ec 04             	sub    $0x4,%esp
c0007970:	52                   	push   %edx
c0007971:	6a 00                	push   $0x0
c0007973:	50                   	push   %eax
c0007974:	e8 32 41 00 00       	call   c000baab <Memset>
c0007979:	83 c4 10             	add    $0x10,%esp
c000797c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000797f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007982:	01 d0                	add    %edx,%eax
c0007984:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007987:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000798c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007991:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007997:	85 c0                	test   %eax,%eax
c0007999:	0f 48 c2             	cmovs  %edx,%eax
c000799c:	c1 f8 0c             	sar    $0xc,%eax
c000799f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00079a2:	ff 75 e8             	pushl  -0x18(%ebp)
c00079a5:	6a 01                	push   $0x1
c00079a7:	ff 75 e0             	pushl  -0x20(%ebp)
c00079aa:	68 ac 16 01 c0       	push   $0xc00116ac
c00079af:	e8 01 f4 ff ff       	call   c0006db5 <set_bits>
c00079b4:	83 c4 10             	add    $0x10,%esp
c00079b7:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00079ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00079bd:	01 d0                	add    %edx,%eax
c00079bf:	c1 e0 0c             	shl    $0xc,%eax
c00079c2:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c00079c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00079ca:	83 c0 02             	add    $0x2,%eax
c00079cd:	c1 e0 0c             	shl    $0xc,%eax
c00079d0:	89 c2                	mov    %eax,%edx
c00079d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00079d5:	01 d0                	add    %edx,%eax
c00079d7:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c00079dc:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00079e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00079e9:	90                   	nop
c00079ea:	c9                   	leave  
c00079eb:	c3                   	ret    

c00079ec <init_memory>:
c00079ec:	55                   	push   %ebp
c00079ed:	89 e5                	mov    %esp,%ebp
c00079ef:	83 ec 38             	sub    $0x38,%esp
c00079f2:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c00079f9:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007a00:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007a07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a0a:	05 00 00 10 00       	add    $0x100000,%eax
c0007a0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007a12:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a15:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0007a18:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007a1e:	85 c0                	test   %eax,%eax
c0007a20:	0f 48 c2             	cmovs  %edx,%eax
c0007a23:	c1 f8 0c             	sar    $0xc,%eax
c0007a26:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007a29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a2c:	89 c2                	mov    %eax,%edx
c0007a2e:	c1 ea 1f             	shr    $0x1f,%edx
c0007a31:	01 d0                	add    %edx,%eax
c0007a33:	d1 f8                	sar    %eax
c0007a35:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007a38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a3b:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007a3e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007a44:	8d 50 07             	lea    0x7(%eax),%edx
c0007a47:	85 c0                	test   %eax,%eax
c0007a49:	0f 48 c2             	cmovs  %edx,%eax
c0007a4c:	c1 f8 03             	sar    $0x3,%eax
c0007a4f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007a52:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a55:	8d 50 07             	lea    0x7(%eax),%edx
c0007a58:	85 c0                	test   %eax,%eax
c0007a5a:	0f 48 c2             	cmovs  %edx,%eax
c0007a5d:	c1 f8 03             	sar    $0x3,%eax
c0007a60:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007a63:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a66:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007a6b:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007a70:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007a73:	c1 e2 0c             	shl    $0xc,%edx
c0007a76:	01 d0                	add    %edx,%eax
c0007a78:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007a7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a80:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007a85:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a88:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007a8d:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007a92:	83 ec 04             	sub    $0x4,%esp
c0007a95:	ff 75 d8             	pushl  -0x28(%ebp)
c0007a98:	6a 00                	push   $0x0
c0007a9a:	50                   	push   %eax
c0007a9b:	e8 0b 40 00 00       	call   c000baab <Memset>
c0007aa0:	83 c4 10             	add    $0x10,%esp
c0007aa3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007aa6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007aa9:	01 d0                	add    %edx,%eax
c0007aab:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007ab0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007ab3:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007ab8:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007abd:	83 ec 04             	sub    $0x4,%esp
c0007ac0:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007ac3:	6a 00                	push   $0x0
c0007ac5:	50                   	push   %eax
c0007ac6:	e8 e0 3f 00 00       	call   c000baab <Memset>
c0007acb:	83 c4 10             	add    $0x10,%esp
c0007ace:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007ad1:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007ad6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007ad9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007adc:	01 c2                	add    %eax,%edx
c0007ade:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007ae1:	01 d0                	add    %edx,%eax
c0007ae3:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007ae8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007aeb:	05 00 00 10 00       	add    $0x100000,%eax
c0007af0:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007af5:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007afa:	83 ec 04             	sub    $0x4,%esp
c0007afd:	ff 75 d8             	pushl  -0x28(%ebp)
c0007b00:	6a 00                	push   $0x0
c0007b02:	50                   	push   %eax
c0007b03:	e8 a3 3f 00 00       	call   c000baab <Memset>
c0007b08:	83 c4 10             	add    $0x10,%esp
c0007b0b:	83 ec 04             	sub    $0x4,%esp
c0007b0e:	68 f0 00 00 00       	push   $0xf0
c0007b13:	6a 00                	push   $0x0
c0007b15:	68 80 47 08 c0       	push   $0xc0084780
c0007b1a:	e8 8c 3f 00 00       	call   c000baab <Memset>
c0007b1f:	83 c4 10             	add    $0x10,%esp
c0007b22:	83 ec 0c             	sub    $0xc,%esp
c0007b25:	68 80 47 08 c0       	push   $0xc0084780
c0007b2a:	e8 75 fb ff ff       	call   c00076a4 <init_memory_block_desc>
c0007b2f:	83 c4 10             	add    $0x10,%esp
c0007b32:	90                   	nop
c0007b33:	c9                   	leave  
c0007b34:	c3                   	ret    

c0007b35 <intr_enable>:
c0007b35:	55                   	push   %ebp
c0007b36:	89 e5                	mov    %esp,%ebp
c0007b38:	83 ec 18             	sub    $0x18,%esp
c0007b3b:	e8 65 00 00 00       	call   c0007ba5 <intr_get_status>
c0007b40:	83 f8 01             	cmp    $0x1,%eax
c0007b43:	75 0c                	jne    c0007b51 <intr_enable+0x1c>
c0007b45:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b4f:	eb 0b                	jmp    c0007b5c <intr_enable+0x27>
c0007b51:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b58:	fb                   	sti    
c0007b59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b5c:	c9                   	leave  
c0007b5d:	c3                   	ret    

c0007b5e <intr_disable>:
c0007b5e:	55                   	push   %ebp
c0007b5f:	89 e5                	mov    %esp,%ebp
c0007b61:	83 ec 18             	sub    $0x18,%esp
c0007b64:	e8 3c 00 00 00       	call   c0007ba5 <intr_get_status>
c0007b69:	83 f8 01             	cmp    $0x1,%eax
c0007b6c:	75 0d                	jne    c0007b7b <intr_disable+0x1d>
c0007b6e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b75:	fa                   	cli    
c0007b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b79:	eb 0a                	jmp    c0007b85 <intr_disable+0x27>
c0007b7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b85:	c9                   	leave  
c0007b86:	c3                   	ret    

c0007b87 <intr_set_status>:
c0007b87:	55                   	push   %ebp
c0007b88:	89 e5                	mov    %esp,%ebp
c0007b8a:	83 ec 08             	sub    $0x8,%esp
c0007b8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b90:	83 e0 01             	and    $0x1,%eax
c0007b93:	85 c0                	test   %eax,%eax
c0007b95:	74 07                	je     c0007b9e <intr_set_status+0x17>
c0007b97:	e8 99 ff ff ff       	call   c0007b35 <intr_enable>
c0007b9c:	eb 05                	jmp    c0007ba3 <intr_set_status+0x1c>
c0007b9e:	e8 bb ff ff ff       	call   c0007b5e <intr_disable>
c0007ba3:	c9                   	leave  
c0007ba4:	c3                   	ret    

c0007ba5 <intr_get_status>:
c0007ba5:	55                   	push   %ebp
c0007ba6:	89 e5                	mov    %esp,%ebp
c0007ba8:	83 ec 10             	sub    $0x10,%esp
c0007bab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007bb2:	9c                   	pushf  
c0007bb3:	58                   	pop    %eax
c0007bb4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007bb7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007bba:	c1 e8 09             	shr    $0x9,%eax
c0007bbd:	83 e0 01             	and    $0x1,%eax
c0007bc0:	c9                   	leave  
c0007bc1:	c3                   	ret    

c0007bc2 <Memcpy>:
c0007bc2:	55                   	push   %ebp
c0007bc3:	89 e5                	mov    %esp,%ebp
c0007bc5:	83 ec 18             	sub    $0x18,%esp
c0007bc8:	e8 91 ff ff ff       	call   c0007b5e <intr_disable>
c0007bcd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007bd0:	83 ec 04             	sub    $0x4,%esp
c0007bd3:	ff 75 10             	pushl  0x10(%ebp)
c0007bd6:	ff 75 0c             	pushl  0xc(%ebp)
c0007bd9:	ff 75 08             	pushl  0x8(%ebp)
c0007bdc:	e8 9c 3e 00 00       	call   c000ba7d <Memcpy2>
c0007be1:	83 c4 10             	add    $0x10,%esp
c0007be4:	83 ec 0c             	sub    $0xc,%esp
c0007be7:	ff 75 f4             	pushl  -0xc(%ebp)
c0007bea:	e8 98 ff ff ff       	call   c0007b87 <intr_set_status>
c0007bef:	83 c4 10             	add    $0x10,%esp
c0007bf2:	90                   	nop
c0007bf3:	c9                   	leave  
c0007bf4:	c3                   	ret    

c0007bf5 <untar>:
c0007bf5:	55                   	push   %ebp
c0007bf6:	89 e5                	mov    %esp,%ebp
c0007bf8:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c0007bfe:	83 ec 08             	sub    $0x8,%esp
c0007c01:	6a 00                	push   $0x0
c0007c03:	ff 75 08             	pushl  0x8(%ebp)
c0007c06:	e8 ce e4 ff ff       	call   c00060d9 <open>
c0007c0b:	83 c4 10             	add    $0x10,%esp
c0007c0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007c11:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007c18:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c0007c1f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c26:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007c2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007c31:	7e 58                	jle    c0007c8b <untar+0x96>
c0007c33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c36:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007c3b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007c41:	85 c0                	test   %eax,%eax
c0007c43:	0f 48 c2             	cmovs  %edx,%eax
c0007c46:	c1 f8 09             	sar    $0x9,%eax
c0007c49:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007c4c:	83 ec 04             	sub    $0x4,%esp
c0007c4f:	68 00 20 00 00       	push   $0x2000
c0007c54:	6a 00                	push   $0x0
c0007c56:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007c5c:	50                   	push   %eax
c0007c5d:	e8 49 3e 00 00       	call   c000baab <Memset>
c0007c62:	83 c4 10             	add    $0x10,%esp
c0007c65:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007c68:	c1 e0 09             	shl    $0x9,%eax
c0007c6b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007c6e:	83 ec 04             	sub    $0x4,%esp
c0007c71:	50                   	push   %eax
c0007c72:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007c78:	50                   	push   %eax
c0007c79:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c7c:	e8 dd e4 ff ff       	call   c000615e <read>
c0007c81:	83 c4 10             	add    $0x10,%esp
c0007c84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c8b:	83 ec 04             	sub    $0x4,%esp
c0007c8e:	68 00 20 00 00       	push   $0x2000
c0007c93:	6a 00                	push   $0x0
c0007c95:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007c9b:	50                   	push   %eax
c0007c9c:	e8 0a 3e 00 00       	call   c000baab <Memset>
c0007ca1:	83 c4 10             	add    $0x10,%esp
c0007ca4:	83 ec 04             	sub    $0x4,%esp
c0007ca7:	68 00 02 00 00       	push   $0x200
c0007cac:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007cb2:	50                   	push   %eax
c0007cb3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007cb6:	e8 a3 e4 ff ff       	call   c000615e <read>
c0007cbb:	83 c4 10             	add    $0x10,%esp
c0007cbe:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007cc1:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007cc5:	0f 84 1f 01 00 00    	je     c0007dea <untar+0x1f5>
c0007ccb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007cce:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007cd1:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007cd8:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007cde:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007ce1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007ce4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007ce7:	83 ec 08             	sub    $0x8,%esp
c0007cea:	6a 07                	push   $0x7
c0007cec:	ff 75 cc             	pushl  -0x34(%ebp)
c0007cef:	e8 e5 e3 ff ff       	call   c00060d9 <open>
c0007cf4:	83 c4 10             	add    $0x10,%esp
c0007cf7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007cfa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007d01:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007d04:	83 c0 7c             	add    $0x7c,%eax
c0007d07:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007d0a:	83 ec 0c             	sub    $0xc,%esp
c0007d0d:	ff 75 cc             	pushl  -0x34(%ebp)
c0007d10:	e8 cf 3d 00 00       	call   c000bae4 <Strlen>
c0007d15:	83 c4 10             	add    $0x10,%esp
c0007d18:	85 c0                	test   %eax,%eax
c0007d1a:	75 16                	jne    c0007d32 <untar+0x13d>
c0007d1c:	83 ec 0c             	sub    $0xc,%esp
c0007d1f:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007d22:	e8 bd 3d 00 00       	call   c000bae4 <Strlen>
c0007d27:	83 c4 10             	add    $0x10,%esp
c0007d2a:	85 c0                	test   %eax,%eax
c0007d2c:	0f 84 bb 00 00 00    	je     c0007ded <untar+0x1f8>
c0007d32:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007d35:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d38:	eb 1f                	jmp    c0007d59 <untar+0x164>
c0007d3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007d3d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007d44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d47:	0f b6 00             	movzbl (%eax),%eax
c0007d4a:	0f be c0             	movsbl %al,%eax
c0007d4d:	83 e8 30             	sub    $0x30,%eax
c0007d50:	01 d0                	add    %edx,%eax
c0007d52:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007d55:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007d59:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d5c:	0f b6 00             	movzbl (%eax),%eax
c0007d5f:	84 c0                	test   %al,%al
c0007d61:	75 d7                	jne    c0007d3a <untar+0x145>
c0007d63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007d66:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007d69:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0007d70:	eb 5f                	jmp    c0007dd1 <untar+0x1dc>
c0007d72:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d75:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0007d78:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0007d7c:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007d7f:	83 ec 04             	sub    $0x4,%esp
c0007d82:	68 00 02 00 00       	push   $0x200
c0007d87:	6a 00                	push   $0x0
c0007d89:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007d8f:	50                   	push   %eax
c0007d90:	e8 16 3d 00 00       	call   c000baab <Memset>
c0007d95:	83 c4 10             	add    $0x10,%esp
c0007d98:	83 ec 04             	sub    $0x4,%esp
c0007d9b:	ff 75 bc             	pushl  -0x44(%ebp)
c0007d9e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007da4:	50                   	push   %eax
c0007da5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007da8:	e8 b1 e3 ff ff       	call   c000615e <read>
c0007dad:	83 c4 10             	add    $0x10,%esp
c0007db0:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007db3:	83 ec 04             	sub    $0x4,%esp
c0007db6:	ff 75 bc             	pushl  -0x44(%ebp)
c0007db9:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007dbf:	50                   	push   %eax
c0007dc0:	ff 75 c8             	pushl  -0x38(%ebp)
c0007dc3:	e8 0a e4 ff ff       	call   c00061d2 <write>
c0007dc8:	83 c4 10             	add    $0x10,%esp
c0007dcb:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007dce:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0007dd1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007dd5:	75 9b                	jne    c0007d72 <untar+0x17d>
c0007dd7:	83 ec 0c             	sub    $0xc,%esp
c0007dda:	ff 75 c8             	pushl  -0x38(%ebp)
c0007ddd:	e8 64 e4 ff ff       	call   c0006246 <close>
c0007de2:	83 c4 10             	add    $0x10,%esp
c0007de5:	e9 43 fe ff ff       	jmp    c0007c2d <untar+0x38>
c0007dea:	90                   	nop
c0007deb:	eb 01                	jmp    c0007dee <untar+0x1f9>
c0007ded:	90                   	nop
c0007dee:	83 ec 0c             	sub    $0xc,%esp
c0007df1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007df4:	e8 4d e4 ff ff       	call   c0006246 <close>
c0007df9:	83 c4 10             	add    $0x10,%esp
c0007dfc:	90                   	nop
c0007dfd:	c9                   	leave  
c0007dfe:	c3                   	ret    

c0007dff <atoi>:
c0007dff:	55                   	push   %ebp
c0007e00:	89 e5                	mov    %esp,%ebp
c0007e02:	83 ec 10             	sub    $0x10,%esp
c0007e05:	8b 45 08             	mov    0x8(%ebp),%eax
c0007e08:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007e0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e0e:	8d 50 01             	lea    0x1(%eax),%edx
c0007e11:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e14:	c6 00 30             	movb   $0x30,(%eax)
c0007e17:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e1a:	8d 50 01             	lea    0x1(%eax),%edx
c0007e1d:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e20:	c6 00 78             	movb   $0x78,(%eax)
c0007e23:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007e27:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007e2b:	75 0e                	jne    c0007e3b <atoi+0x3c>
c0007e2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e30:	8d 50 01             	lea    0x1(%eax),%edx
c0007e33:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e36:	c6 00 30             	movb   $0x30,(%eax)
c0007e39:	eb 61                	jmp    c0007e9c <atoi+0x9d>
c0007e3b:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007e42:	eb 52                	jmp    c0007e96 <atoi+0x97>
c0007e44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e47:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007e4a:	89 c1                	mov    %eax,%ecx
c0007e4c:	d3 fa                	sar    %cl,%edx
c0007e4e:	89 d0                	mov    %edx,%eax
c0007e50:	83 e0 0f             	and    $0xf,%eax
c0007e53:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e56:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007e5a:	75 06                	jne    c0007e62 <atoi+0x63>
c0007e5c:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007e60:	74 2f                	je     c0007e91 <atoi+0x92>
c0007e62:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007e66:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007e6a:	83 c0 30             	add    $0x30,%eax
c0007e6d:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e70:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007e74:	7e 0a                	jle    c0007e80 <atoi+0x81>
c0007e76:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007e7a:	83 c0 07             	add    $0x7,%eax
c0007e7d:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e80:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e83:	8d 50 01             	lea    0x1(%eax),%edx
c0007e86:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e89:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007e8d:	88 10                	mov    %dl,(%eax)
c0007e8f:	eb 01                	jmp    c0007e92 <atoi+0x93>
c0007e91:	90                   	nop
c0007e92:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007e96:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007e9a:	79 a8                	jns    c0007e44 <atoi+0x45>
c0007e9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e9f:	c6 00 00             	movb   $0x0,(%eax)
c0007ea2:	90                   	nop
c0007ea3:	c9                   	leave  
c0007ea4:	c3                   	ret    

c0007ea5 <disp_int>:
c0007ea5:	55                   	push   %ebp
c0007ea6:	89 e5                	mov    %esp,%ebp
c0007ea8:	83 ec 18             	sub    $0x18,%esp
c0007eab:	ff 75 08             	pushl  0x8(%ebp)
c0007eae:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007eb1:	50                   	push   %eax
c0007eb2:	e8 48 ff ff ff       	call   c0007dff <atoi>
c0007eb7:	83 c4 08             	add    $0x8,%esp
c0007eba:	83 ec 08             	sub    $0x8,%esp
c0007ebd:	6a 0b                	push   $0xb
c0007ebf:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007ec2:	50                   	push   %eax
c0007ec3:	e8 ff 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007ec8:	83 c4 10             	add    $0x10,%esp
c0007ecb:	90                   	nop
c0007ecc:	c9                   	leave  
c0007ecd:	c3                   	ret    

c0007ece <do_page_fault>:
c0007ece:	55                   	push   %ebp
c0007ecf:	89 e5                	mov    %esp,%ebp
c0007ed1:	83 ec 28             	sub    $0x28,%esp
c0007ed4:	0f 20 d0             	mov    %cr2,%eax
c0007ed7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007eda:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007ee1:	00 00 00 
c0007ee4:	83 ec 0c             	sub    $0xc,%esp
c0007ee7:	68 40 b3 00 c0       	push   $0xc000b340
c0007eec:	e8 9b 96 ff ff       	call   c000158c <disp_str>
c0007ef1:	83 c4 10             	add    $0x10,%esp
c0007ef4:	83 ec 0c             	sub    $0xc,%esp
c0007ef7:	68 4f b3 00 c0       	push   $0xc000b34f
c0007efc:	e8 8b 96 ff ff       	call   c000158c <disp_str>
c0007f01:	83 c4 10             	add    $0x10,%esp
c0007f04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f07:	83 ec 0c             	sub    $0xc,%esp
c0007f0a:	50                   	push   %eax
c0007f0b:	e8 95 ff ff ff       	call   c0007ea5 <disp_int>
c0007f10:	83 c4 10             	add    $0x10,%esp
c0007f13:	83 ec 0c             	sub    $0xc,%esp
c0007f16:	68 54 b3 00 c0       	push   $0xc000b354
c0007f1b:	e8 6c 96 ff ff       	call   c000158c <disp_str>
c0007f20:	83 c4 10             	add    $0x10,%esp
c0007f23:	83 ec 0c             	sub    $0xc,%esp
c0007f26:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f29:	e8 1b f1 ff ff       	call   c0007049 <ptr_pde>
c0007f2e:	83 c4 10             	add    $0x10,%esp
c0007f31:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007f34:	83 ec 0c             	sub    $0xc,%esp
c0007f37:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f3a:	e8 1d f1 ff ff       	call   c000705c <ptr_pte>
c0007f3f:	83 c4 10             	add    $0x10,%esp
c0007f42:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007f45:	83 ec 0c             	sub    $0xc,%esp
c0007f48:	68 56 b3 00 c0       	push   $0xc000b356
c0007f4d:	e8 3a 96 ff ff       	call   c000158c <disp_str>
c0007f52:	83 c4 10             	add    $0x10,%esp
c0007f55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007f58:	83 ec 0c             	sub    $0xc,%esp
c0007f5b:	50                   	push   %eax
c0007f5c:	e8 44 ff ff ff       	call   c0007ea5 <disp_int>
c0007f61:	83 c4 10             	add    $0x10,%esp
c0007f64:	83 ec 0c             	sub    $0xc,%esp
c0007f67:	68 5b b3 00 c0       	push   $0xc000b35b
c0007f6c:	e8 1b 96 ff ff       	call   c000158c <disp_str>
c0007f71:	83 c4 10             	add    $0x10,%esp
c0007f74:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007f77:	8b 00                	mov    (%eax),%eax
c0007f79:	83 ec 0c             	sub    $0xc,%esp
c0007f7c:	50                   	push   %eax
c0007f7d:	e8 23 ff ff ff       	call   c0007ea5 <disp_int>
c0007f82:	83 c4 10             	add    $0x10,%esp
c0007f85:	83 ec 0c             	sub    $0xc,%esp
c0007f88:	68 54 b3 00 c0       	push   $0xc000b354
c0007f8d:	e8 fa 95 ff ff       	call   c000158c <disp_str>
c0007f92:	83 c4 10             	add    $0x10,%esp
c0007f95:	83 ec 0c             	sub    $0xc,%esp
c0007f98:	68 64 b3 00 c0       	push   $0xc000b364
c0007f9d:	e8 ea 95 ff ff       	call   c000158c <disp_str>
c0007fa2:	83 c4 10             	add    $0x10,%esp
c0007fa5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007fa8:	83 ec 0c             	sub    $0xc,%esp
c0007fab:	50                   	push   %eax
c0007fac:	e8 f4 fe ff ff       	call   c0007ea5 <disp_int>
c0007fb1:	83 c4 10             	add    $0x10,%esp
c0007fb4:	83 ec 0c             	sub    $0xc,%esp
c0007fb7:	68 69 b3 00 c0       	push   $0xc000b369
c0007fbc:	e8 cb 95 ff ff       	call   c000158c <disp_str>
c0007fc1:	83 c4 10             	add    $0x10,%esp
c0007fc4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007fc7:	8b 00                	mov    (%eax),%eax
c0007fc9:	83 ec 0c             	sub    $0xc,%esp
c0007fcc:	50                   	push   %eax
c0007fcd:	e8 d3 fe ff ff       	call   c0007ea5 <disp_int>
c0007fd2:	83 c4 10             	add    $0x10,%esp
c0007fd5:	83 ec 0c             	sub    $0xc,%esp
c0007fd8:	68 54 b3 00 c0       	push   $0xc000b354
c0007fdd:	e8 aa 95 ff ff       	call   c000158c <disp_str>
c0007fe2:	83 c4 10             	add    $0x10,%esp
c0007fe5:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007fec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007fef:	8b 00                	mov    (%eax),%eax
c0007ff1:	83 e0 01             	and    $0x1,%eax
c0007ff4:	85 c0                	test   %eax,%eax
c0007ff6:	74 09                	je     c0008001 <do_page_fault+0x133>
c0007ff8:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007fff:	eb 07                	jmp    c0008008 <do_page_fault+0x13a>
c0008001:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008008:	90                   	nop
c0008009:	c9                   	leave  
c000800a:	c3                   	ret    

c000800b <exception_handler>:
c000800b:	55                   	push   %ebp
c000800c:	89 e5                	mov    %esp,%ebp
c000800e:	57                   	push   %edi
c000800f:	56                   	push   %esi
c0008010:	53                   	push   %ebx
c0008011:	83 ec 6c             	sub    $0x6c,%esp
c0008014:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008017:	bb e0 b5 00 c0       	mov    $0xc000b5e0,%ebx
c000801c:	ba 13 00 00 00       	mov    $0x13,%edx
c0008021:	89 c7                	mov    %eax,%edi
c0008023:	89 de                	mov    %ebx,%esi
c0008025:	89 d1                	mov    %edx,%ecx
c0008027:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008029:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008030:	eb 04                	jmp    c0008036 <exception_handler+0x2b>
c0008032:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008036:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c000803d:	7e f3                	jle    c0008032 <exception_handler+0x27>
c000803f:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008046:	00 00 00 
c0008049:	83 ec 0c             	sub    $0xc,%esp
c000804c:	68 72 b3 00 c0       	push   $0xc000b372
c0008051:	e8 36 95 ff ff       	call   c000158c <disp_str>
c0008056:	83 c4 10             	add    $0x10,%esp
c0008059:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008060:	8b 45 08             	mov    0x8(%ebp),%eax
c0008063:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0008067:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000806a:	83 ec 0c             	sub    $0xc,%esp
c000806d:	ff 75 dc             	pushl  -0x24(%ebp)
c0008070:	e8 17 95 ff ff       	call   c000158c <disp_str>
c0008075:	83 c4 10             	add    $0x10,%esp
c0008078:	83 ec 0c             	sub    $0xc,%esp
c000807b:	68 80 b3 00 c0       	push   $0xc000b380
c0008080:	e8 07 95 ff ff       	call   c000158c <disp_str>
c0008085:	83 c4 10             	add    $0x10,%esp
c0008088:	83 ec 0c             	sub    $0xc,%esp
c000808b:	68 83 b3 00 c0       	push   $0xc000b383
c0008090:	e8 f7 94 ff ff       	call   c000158c <disp_str>
c0008095:	83 c4 10             	add    $0x10,%esp
c0008098:	8b 45 08             	mov    0x8(%ebp),%eax
c000809b:	83 ec 0c             	sub    $0xc,%esp
c000809e:	50                   	push   %eax
c000809f:	e8 01 fe ff ff       	call   c0007ea5 <disp_int>
c00080a4:	83 c4 10             	add    $0x10,%esp
c00080a7:	83 ec 0c             	sub    $0xc,%esp
c00080aa:	68 80 b3 00 c0       	push   $0xc000b380
c00080af:	e8 d8 94 ff ff       	call   c000158c <disp_str>
c00080b4:	83 c4 10             	add    $0x10,%esp
c00080b7:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c00080bb:	74 2f                	je     c00080ec <exception_handler+0xe1>
c00080bd:	83 ec 0c             	sub    $0xc,%esp
c00080c0:	68 8b b3 00 c0       	push   $0xc000b38b
c00080c5:	e8 c2 94 ff ff       	call   c000158c <disp_str>
c00080ca:	83 c4 10             	add    $0x10,%esp
c00080cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00080d0:	83 ec 0c             	sub    $0xc,%esp
c00080d3:	50                   	push   %eax
c00080d4:	e8 cc fd ff ff       	call   c0007ea5 <disp_int>
c00080d9:	83 c4 10             	add    $0x10,%esp
c00080dc:	83 ec 0c             	sub    $0xc,%esp
c00080df:	68 80 b3 00 c0       	push   $0xc000b380
c00080e4:	e8 a3 94 ff ff       	call   c000158c <disp_str>
c00080e9:	83 c4 10             	add    $0x10,%esp
c00080ec:	83 ec 0c             	sub    $0xc,%esp
c00080ef:	68 95 b3 00 c0       	push   $0xc000b395
c00080f4:	e8 93 94 ff ff       	call   c000158c <disp_str>
c00080f9:	83 c4 10             	add    $0x10,%esp
c00080fc:	83 ec 0c             	sub    $0xc,%esp
c00080ff:	ff 75 14             	pushl  0x14(%ebp)
c0008102:	e8 9e fd ff ff       	call   c0007ea5 <disp_int>
c0008107:	83 c4 10             	add    $0x10,%esp
c000810a:	83 ec 0c             	sub    $0xc,%esp
c000810d:	68 80 b3 00 c0       	push   $0xc000b380
c0008112:	e8 75 94 ff ff       	call   c000158c <disp_str>
c0008117:	83 c4 10             	add    $0x10,%esp
c000811a:	83 ec 0c             	sub    $0xc,%esp
c000811d:	68 99 b3 00 c0       	push   $0xc000b399
c0008122:	e8 65 94 ff ff       	call   c000158c <disp_str>
c0008127:	83 c4 10             	add    $0x10,%esp
c000812a:	8b 45 10             	mov    0x10(%ebp),%eax
c000812d:	83 ec 0c             	sub    $0xc,%esp
c0008130:	50                   	push   %eax
c0008131:	e8 6f fd ff ff       	call   c0007ea5 <disp_int>
c0008136:	83 c4 10             	add    $0x10,%esp
c0008139:	83 ec 0c             	sub    $0xc,%esp
c000813c:	68 80 b3 00 c0       	push   $0xc000b380
c0008141:	e8 46 94 ff ff       	call   c000158c <disp_str>
c0008146:	83 c4 10             	add    $0x10,%esp
c0008149:	83 ec 0c             	sub    $0xc,%esp
c000814c:	68 9e b3 00 c0       	push   $0xc000b39e
c0008151:	e8 36 94 ff ff       	call   c000158c <disp_str>
c0008156:	83 c4 10             	add    $0x10,%esp
c0008159:	83 ec 0c             	sub    $0xc,%esp
c000815c:	ff 75 18             	pushl  0x18(%ebp)
c000815f:	e8 41 fd ff ff       	call   c0007ea5 <disp_int>
c0008164:	83 c4 10             	add    $0x10,%esp
c0008167:	83 ec 0c             	sub    $0xc,%esp
c000816a:	68 80 b3 00 c0       	push   $0xc000b380
c000816f:	e8 18 94 ff ff       	call   c000158c <disp_str>
c0008174:	83 c4 10             	add    $0x10,%esp
c0008177:	83 ec 0c             	sub    $0xc,%esp
c000817a:	68 a8 b3 00 c0       	push   $0xc000b3a8
c000817f:	e8 08 94 ff ff       	call   c000158c <disp_str>
c0008184:	83 c4 10             	add    $0x10,%esp
c0008187:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c000818b:	75 46                	jne    c00081d3 <exception_handler+0x1c8>
c000818d:	0f 20 d0             	mov    %cr2,%eax
c0008190:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008193:	83 ec 0c             	sub    $0xc,%esp
c0008196:	68 c7 b3 00 c0       	push   $0xc000b3c7
c000819b:	e8 ec 93 ff ff       	call   c000158c <disp_str>
c00081a0:	83 c4 10             	add    $0x10,%esp
c00081a3:	83 ec 0c             	sub    $0xc,%esp
c00081a6:	68 4f b3 00 c0       	push   $0xc000b34f
c00081ab:	e8 dc 93 ff ff       	call   c000158c <disp_str>
c00081b0:	83 c4 10             	add    $0x10,%esp
c00081b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081b6:	83 ec 0c             	sub    $0xc,%esp
c00081b9:	50                   	push   %eax
c00081ba:	e8 e6 fc ff ff       	call   c0007ea5 <disp_int>
c00081bf:	83 c4 10             	add    $0x10,%esp
c00081c2:	83 ec 0c             	sub    $0xc,%esp
c00081c5:	68 54 b3 00 c0       	push   $0xc000b354
c00081ca:	e8 bd 93 ff ff       	call   c000158c <disp_str>
c00081cf:	83 c4 10             	add    $0x10,%esp
c00081d2:	90                   	nop
c00081d3:	90                   	nop
c00081d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00081d7:	5b                   	pop    %ebx
c00081d8:	5e                   	pop    %esi
c00081d9:	5f                   	pop    %edi
c00081da:	5d                   	pop    %ebp
c00081db:	c3                   	ret    

c00081dc <exception_handler2>:
c00081dc:	55                   	push   %ebp
c00081dd:	89 e5                	mov    %esp,%ebp
c00081df:	57                   	push   %edi
c00081e0:	56                   	push   %esi
c00081e1:	53                   	push   %ebx
c00081e2:	83 ec 6c             	sub    $0x6c,%esp
c00081e5:	8d 45 90             	lea    -0x70(%ebp),%eax
c00081e8:	bb e0 b5 00 c0       	mov    $0xc000b5e0,%ebx
c00081ed:	ba 13 00 00 00       	mov    $0x13,%edx
c00081f2:	89 c7                	mov    %eax,%edi
c00081f4:	89 de                	mov    %ebx,%esi
c00081f6:	89 d1                	mov    %edx,%ecx
c00081f8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00081fa:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c0008201:	2e 00 00 
c0008204:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000820b:	eb 14                	jmp    c0008221 <exception_handler2+0x45>
c000820d:	83 ec 0c             	sub    $0xc,%esp
c0008210:	68 2c b6 00 c0       	push   $0xc000b62c
c0008215:	e8 72 93 ff ff       	call   c000158c <disp_str>
c000821a:	83 c4 10             	add    $0x10,%esp
c000821d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008221:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008228:	7e e3                	jle    c000820d <exception_handler2+0x31>
c000822a:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c0008231:	2e 00 00 
c0008234:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000823b:	8b 45 08             	mov    0x8(%ebp),%eax
c000823e:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0008242:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008245:	83 ec 08             	sub    $0x8,%esp
c0008248:	ff 75 e0             	pushl  -0x20(%ebp)
c000824b:	ff 75 dc             	pushl  -0x24(%ebp)
c000824e:	e8 74 93 ff ff       	call   c00015c7 <disp_str_colour>
c0008253:	83 c4 10             	add    $0x10,%esp
c0008256:	83 ec 0c             	sub    $0xc,%esp
c0008259:	68 80 b3 00 c0       	push   $0xc000b380
c000825e:	e8 29 93 ff ff       	call   c000158c <disp_str>
c0008263:	83 c4 10             	add    $0x10,%esp
c0008266:	83 ec 08             	sub    $0x8,%esp
c0008269:	ff 75 e0             	pushl  -0x20(%ebp)
c000826c:	68 83 b3 00 c0       	push   $0xc000b383
c0008271:	e8 51 93 ff ff       	call   c00015c7 <disp_str_colour>
c0008276:	83 c4 10             	add    $0x10,%esp
c0008279:	83 ec 0c             	sub    $0xc,%esp
c000827c:	ff 75 08             	pushl  0x8(%ebp)
c000827f:	e8 21 fc ff ff       	call   c0007ea5 <disp_int>
c0008284:	83 c4 10             	add    $0x10,%esp
c0008287:	83 ec 0c             	sub    $0xc,%esp
c000828a:	68 80 b3 00 c0       	push   $0xc000b380
c000828f:	e8 f8 92 ff ff       	call   c000158c <disp_str>
c0008294:	83 c4 10             	add    $0x10,%esp
c0008297:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c000829b:	74 44                	je     c00082e1 <exception_handler2+0x105>
c000829d:	83 ec 08             	sub    $0x8,%esp
c00082a0:	ff 75 e0             	pushl  -0x20(%ebp)
c00082a3:	68 8b b3 00 c0       	push   $0xc000b38b
c00082a8:	e8 1a 93 ff ff       	call   c00015c7 <disp_str_colour>
c00082ad:	83 c4 10             	add    $0x10,%esp
c00082b0:	83 ec 08             	sub    $0x8,%esp
c00082b3:	ff 75 e0             	pushl  -0x20(%ebp)
c00082b6:	68 8b b3 00 c0       	push   $0xc000b38b
c00082bb:	e8 07 93 ff ff       	call   c00015c7 <disp_str_colour>
c00082c0:	83 c4 10             	add    $0x10,%esp
c00082c3:	83 ec 0c             	sub    $0xc,%esp
c00082c6:	ff 75 0c             	pushl  0xc(%ebp)
c00082c9:	e8 d7 fb ff ff       	call   c0007ea5 <disp_int>
c00082ce:	83 c4 10             	add    $0x10,%esp
c00082d1:	83 ec 0c             	sub    $0xc,%esp
c00082d4:	68 80 b3 00 c0       	push   $0xc000b380
c00082d9:	e8 ae 92 ff ff       	call   c000158c <disp_str>
c00082de:	83 c4 10             	add    $0x10,%esp
c00082e1:	83 ec 08             	sub    $0x8,%esp
c00082e4:	ff 75 e0             	pushl  -0x20(%ebp)
c00082e7:	68 95 b3 00 c0       	push   $0xc000b395
c00082ec:	e8 d6 92 ff ff       	call   c00015c7 <disp_str_colour>
c00082f1:	83 c4 10             	add    $0x10,%esp
c00082f4:	83 ec 0c             	sub    $0xc,%esp
c00082f7:	ff 75 14             	pushl  0x14(%ebp)
c00082fa:	e8 a6 fb ff ff       	call   c0007ea5 <disp_int>
c00082ff:	83 c4 10             	add    $0x10,%esp
c0008302:	83 ec 0c             	sub    $0xc,%esp
c0008305:	68 80 b3 00 c0       	push   $0xc000b380
c000830a:	e8 7d 92 ff ff       	call   c000158c <disp_str>
c000830f:	83 c4 10             	add    $0x10,%esp
c0008312:	83 ec 08             	sub    $0x8,%esp
c0008315:	ff 75 e0             	pushl  -0x20(%ebp)
c0008318:	68 99 b3 00 c0       	push   $0xc000b399
c000831d:	e8 a5 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008322:	83 c4 10             	add    $0x10,%esp
c0008325:	83 ec 0c             	sub    $0xc,%esp
c0008328:	ff 75 10             	pushl  0x10(%ebp)
c000832b:	e8 75 fb ff ff       	call   c0007ea5 <disp_int>
c0008330:	83 c4 10             	add    $0x10,%esp
c0008333:	83 ec 0c             	sub    $0xc,%esp
c0008336:	68 80 b3 00 c0       	push   $0xc000b380
c000833b:	e8 4c 92 ff ff       	call   c000158c <disp_str>
c0008340:	83 c4 10             	add    $0x10,%esp
c0008343:	83 ec 08             	sub    $0x8,%esp
c0008346:	ff 75 e0             	pushl  -0x20(%ebp)
c0008349:	68 9e b3 00 c0       	push   $0xc000b39e
c000834e:	e8 74 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008353:	83 c4 10             	add    $0x10,%esp
c0008356:	83 ec 0c             	sub    $0xc,%esp
c0008359:	ff 75 18             	pushl  0x18(%ebp)
c000835c:	e8 44 fb ff ff       	call   c0007ea5 <disp_int>
c0008361:	83 c4 10             	add    $0x10,%esp
c0008364:	83 ec 0c             	sub    $0xc,%esp
c0008367:	68 80 b3 00 c0       	push   $0xc000b380
c000836c:	e8 1b 92 ff ff       	call   c000158c <disp_str>
c0008371:	83 c4 10             	add    $0x10,%esp
c0008374:	90                   	nop
c0008375:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008378:	5b                   	pop    %ebx
c0008379:	5e                   	pop    %esi
c000837a:	5f                   	pop    %edi
c000837b:	5d                   	pop    %ebp
c000837c:	c3                   	ret    

c000837d <init_internal_interrupt>:
c000837d:	55                   	push   %ebp
c000837e:	89 e5                	mov    %esp,%ebp
c0008380:	83 ec 08             	sub    $0x8,%esp
c0008383:	6a 0e                	push   $0xe
c0008385:	6a 08                	push   $0x8
c0008387:	68 03 16 00 c0       	push   $0xc0001603
c000838c:	6a 00                	push   $0x0
c000838e:	e8 96 cd ff ff       	call   c0005129 <InitInterruptDesc>
c0008393:	83 c4 10             	add    $0x10,%esp
c0008396:	6a 0e                	push   $0xe
c0008398:	6a 08                	push   $0x8
c000839a:	68 09 16 00 c0       	push   $0xc0001609
c000839f:	6a 01                	push   $0x1
c00083a1:	e8 83 cd ff ff       	call   c0005129 <InitInterruptDesc>
c00083a6:	83 c4 10             	add    $0x10,%esp
c00083a9:	6a 0e                	push   $0xe
c00083ab:	6a 08                	push   $0x8
c00083ad:	68 0f 16 00 c0       	push   $0xc000160f
c00083b2:	6a 02                	push   $0x2
c00083b4:	e8 70 cd ff ff       	call   c0005129 <InitInterruptDesc>
c00083b9:	83 c4 10             	add    $0x10,%esp
c00083bc:	6a 0e                	push   $0xe
c00083be:	6a 08                	push   $0x8
c00083c0:	68 15 16 00 c0       	push   $0xc0001615
c00083c5:	6a 03                	push   $0x3
c00083c7:	e8 5d cd ff ff       	call   c0005129 <InitInterruptDesc>
c00083cc:	83 c4 10             	add    $0x10,%esp
c00083cf:	6a 0e                	push   $0xe
c00083d1:	6a 08                	push   $0x8
c00083d3:	68 1b 16 00 c0       	push   $0xc000161b
c00083d8:	6a 04                	push   $0x4
c00083da:	e8 4a cd ff ff       	call   c0005129 <InitInterruptDesc>
c00083df:	83 c4 10             	add    $0x10,%esp
c00083e2:	6a 0e                	push   $0xe
c00083e4:	6a 08                	push   $0x8
c00083e6:	68 21 16 00 c0       	push   $0xc0001621
c00083eb:	6a 05                	push   $0x5
c00083ed:	e8 37 cd ff ff       	call   c0005129 <InitInterruptDesc>
c00083f2:	83 c4 10             	add    $0x10,%esp
c00083f5:	6a 0e                	push   $0xe
c00083f7:	6a 08                	push   $0x8
c00083f9:	68 27 16 00 c0       	push   $0xc0001627
c00083fe:	6a 06                	push   $0x6
c0008400:	e8 24 cd ff ff       	call   c0005129 <InitInterruptDesc>
c0008405:	83 c4 10             	add    $0x10,%esp
c0008408:	6a 0e                	push   $0xe
c000840a:	6a 08                	push   $0x8
c000840c:	68 2d 16 00 c0       	push   $0xc000162d
c0008411:	6a 07                	push   $0x7
c0008413:	e8 11 cd ff ff       	call   c0005129 <InitInterruptDesc>
c0008418:	83 c4 10             	add    $0x10,%esp
c000841b:	6a 0e                	push   $0xe
c000841d:	6a 08                	push   $0x8
c000841f:	68 33 16 00 c0       	push   $0xc0001633
c0008424:	6a 08                	push   $0x8
c0008426:	e8 fe cc ff ff       	call   c0005129 <InitInterruptDesc>
c000842b:	83 c4 10             	add    $0x10,%esp
c000842e:	6a 0e                	push   $0xe
c0008430:	6a 08                	push   $0x8
c0008432:	68 37 16 00 c0       	push   $0xc0001637
c0008437:	6a 09                	push   $0x9
c0008439:	e8 eb cc ff ff       	call   c0005129 <InitInterruptDesc>
c000843e:	83 c4 10             	add    $0x10,%esp
c0008441:	6a 0e                	push   $0xe
c0008443:	6a 08                	push   $0x8
c0008445:	68 3d 16 00 c0       	push   $0xc000163d
c000844a:	6a 0a                	push   $0xa
c000844c:	e8 d8 cc ff ff       	call   c0005129 <InitInterruptDesc>
c0008451:	83 c4 10             	add    $0x10,%esp
c0008454:	6a 0e                	push   $0xe
c0008456:	6a 08                	push   $0x8
c0008458:	68 41 16 00 c0       	push   $0xc0001641
c000845d:	6a 0b                	push   $0xb
c000845f:	e8 c5 cc ff ff       	call   c0005129 <InitInterruptDesc>
c0008464:	83 c4 10             	add    $0x10,%esp
c0008467:	6a 0e                	push   $0xe
c0008469:	6a 08                	push   $0x8
c000846b:	68 45 16 00 c0       	push   $0xc0001645
c0008470:	6a 0c                	push   $0xc
c0008472:	e8 b2 cc ff ff       	call   c0005129 <InitInterruptDesc>
c0008477:	83 c4 10             	add    $0x10,%esp
c000847a:	6a 0e                	push   $0xe
c000847c:	6a 08                	push   $0x8
c000847e:	68 49 16 00 c0       	push   $0xc0001649
c0008483:	6a 0d                	push   $0xd
c0008485:	e8 9f cc ff ff       	call   c0005129 <InitInterruptDesc>
c000848a:	83 c4 10             	add    $0x10,%esp
c000848d:	6a 0e                	push   $0xe
c000848f:	6a 08                	push   $0x8
c0008491:	68 4d 16 00 c0       	push   $0xc000164d
c0008496:	6a 0e                	push   $0xe
c0008498:	e8 8c cc ff ff       	call   c0005129 <InitInterruptDesc>
c000849d:	83 c4 10             	add    $0x10,%esp
c00084a0:	6a 0e                	push   $0xe
c00084a2:	6a 08                	push   $0x8
c00084a4:	68 51 16 00 c0       	push   $0xc0001651
c00084a9:	6a 10                	push   $0x10
c00084ab:	e8 79 cc ff ff       	call   c0005129 <InitInterruptDesc>
c00084b0:	83 c4 10             	add    $0x10,%esp
c00084b3:	6a 0e                	push   $0xe
c00084b5:	6a 08                	push   $0x8
c00084b7:	68 57 16 00 c0       	push   $0xc0001657
c00084bc:	6a 11                	push   $0x11
c00084be:	e8 66 cc ff ff       	call   c0005129 <InitInterruptDesc>
c00084c3:	83 c4 10             	add    $0x10,%esp
c00084c6:	6a 0e                	push   $0xe
c00084c8:	6a 08                	push   $0x8
c00084ca:	68 5b 16 00 c0       	push   $0xc000165b
c00084cf:	6a 12                	push   $0x12
c00084d1:	e8 53 cc ff ff       	call   c0005129 <InitInterruptDesc>
c00084d6:	83 c4 10             	add    $0x10,%esp
c00084d9:	6a 0e                	push   $0xe
c00084db:	6a 0e                	push   $0xe
c00084dd:	68 17 17 00 c0       	push   $0xc0001717
c00084e2:	68 90 00 00 00       	push   $0x90
c00084e7:	e8 3d cc ff ff       	call   c0005129 <InitInterruptDesc>
c00084ec:	83 c4 10             	add    $0x10,%esp
c00084ef:	90                   	nop
c00084f0:	c9                   	leave  
c00084f1:	c3                   	ret    

c00084f2 <test>:
c00084f2:	55                   	push   %ebp
c00084f3:	89 e5                	mov    %esp,%ebp
c00084f5:	83 ec 08             	sub    $0x8,%esp
c00084f8:	83 ec 0c             	sub    $0xc,%esp
c00084fb:	68 2e b6 00 c0       	push   $0xc000b62e
c0008500:	e8 87 90 ff ff       	call   c000158c <disp_str>
c0008505:	83 c4 10             	add    $0x10,%esp
c0008508:	83 ec 0c             	sub    $0xc,%esp
c000850b:	68 54 b3 00 c0       	push   $0xc000b354
c0008510:	e8 77 90 ff ff       	call   c000158c <disp_str>
c0008515:	83 c4 10             	add    $0x10,%esp
c0008518:	90                   	nop
c0008519:	c9                   	leave  
c000851a:	c3                   	ret    

c000851b <disp_str_colour3>:
c000851b:	55                   	push   %ebp
c000851c:	89 e5                	mov    %esp,%ebp
c000851e:	90                   	nop
c000851f:	5d                   	pop    %ebp
c0008520:	c3                   	ret    

c0008521 <spurious_irq>:
c0008521:	55                   	push   %ebp
c0008522:	89 e5                	mov    %esp,%ebp
c0008524:	83 ec 08             	sub    $0x8,%esp
c0008527:	83 ec 08             	sub    $0x8,%esp
c000852a:	6a 0b                	push   $0xb
c000852c:	68 30 b6 00 c0       	push   $0xc000b630
c0008531:	e8 91 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008536:	83 c4 10             	add    $0x10,%esp
c0008539:	83 ec 0c             	sub    $0xc,%esp
c000853c:	ff 75 08             	pushl  0x8(%ebp)
c000853f:	e8 61 f9 ff ff       	call   c0007ea5 <disp_int>
c0008544:	83 c4 10             	add    $0x10,%esp
c0008547:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000854c:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008552:	83 c0 01             	add    $0x1,%eax
c0008555:	83 d2 00             	adc    $0x0,%edx
c0008558:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c000855d:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c0008563:	83 ec 0c             	sub    $0xc,%esp
c0008566:	68 57 b6 00 c0       	push   $0xc000b657
c000856b:	e8 1c 90 ff ff       	call   c000158c <disp_str>
c0008570:	83 c4 10             	add    $0x10,%esp
c0008573:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008578:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000857e:	83 ec 0c             	sub    $0xc,%esp
c0008581:	50                   	push   %eax
c0008582:	e8 1e f9 ff ff       	call   c0007ea5 <disp_int>
c0008587:	83 c4 10             	add    $0x10,%esp
c000858a:	83 ec 0c             	sub    $0xc,%esp
c000858d:	68 59 b6 00 c0       	push   $0xc000b659
c0008592:	e8 f5 8f ff ff       	call   c000158c <disp_str>
c0008597:	83 c4 10             	add    $0x10,%esp
c000859a:	83 ec 08             	sub    $0x8,%esp
c000859d:	6a 0c                	push   $0xc
c000859f:	68 5c b6 00 c0       	push   $0xc000b65c
c00085a4:	e8 1e 90 ff ff       	call   c00015c7 <disp_str_colour>
c00085a9:	83 c4 10             	add    $0x10,%esp
c00085ac:	90                   	nop
c00085ad:	c9                   	leave  
c00085ae:	c3                   	ret    

c00085af <init_keyboard>:
c00085af:	55                   	push   %ebp
c00085b0:	89 e5                	mov    %esp,%ebp
c00085b2:	83 ec 18             	sub    $0x18,%esp
c00085b5:	83 ec 04             	sub    $0x4,%esp
c00085b8:	68 00 02 00 00       	push   $0x200
c00085bd:	6a 00                	push   $0x0
c00085bf:	68 ec 0b 01 c0       	push   $0xc0010bec
c00085c4:	e8 e2 34 00 00       	call   c000baab <Memset>
c00085c9:	83 c4 10             	add    $0x10,%esp
c00085cc:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c00085d3:	0b 01 c0 
c00085d6:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00085db:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c00085e0:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c00085e7:	00 00 00 
c00085ea:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00085f1:	00 00 00 
c00085f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00085fb:	eb 04                	jmp    c0008601 <init_keyboard+0x52>
c00085fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008601:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0008608:	7e f3                	jle    c00085fd <init_keyboard+0x4e>
c000860a:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008611:	00 00 00 
c0008614:	e8 1a d9 ff ff       	call   c0005f33 <init_keyboard_handler>
c0008619:	90                   	nop
c000861a:	c9                   	leave  
c000861b:	c3                   	ret    

c000861c <init2>:
c000861c:	55                   	push   %ebp
c000861d:	89 e5                	mov    %esp,%ebp
c000861f:	83 ec 08             	sub    $0x8,%esp
c0008622:	83 ec 0c             	sub    $0xc,%esp
c0008625:	68 81 b6 00 c0       	push   $0xc000b681
c000862a:	e8 5d 8f ff ff       	call   c000158c <disp_str>
c000862f:	83 c4 10             	add    $0x10,%esp
c0008632:	e8 78 ff ff ff       	call   c00085af <init_keyboard>
c0008637:	83 ec 0c             	sub    $0xc,%esp
c000863a:	68 00 00 00 02       	push   $0x2000000
c000863f:	e8 a8 f3 ff ff       	call   c00079ec <init_memory>
c0008644:	83 c4 10             	add    $0x10,%esp
c0008647:	90                   	nop
c0008648:	c9                   	leave  
c0008649:	c3                   	ret    

c000864a <u_thread_a>:
c000864a:	55                   	push   %ebp
c000864b:	89 e5                	mov    %esp,%ebp
c000864d:	83 ec 08             	sub    $0x8,%esp
c0008650:	83 ec 0c             	sub    $0xc,%esp
c0008653:	68 87 b6 00 c0       	push   $0xc000b687
c0008658:	e8 2f 8f ff ff       	call   c000158c <disp_str>
c000865d:	83 c4 10             	add    $0x10,%esp
c0008660:	eb fe                	jmp    c0008660 <u_thread_a+0x16>

c0008662 <kernel_main2>:
c0008662:	55                   	push   %ebp
c0008663:	89 e5                	mov    %esp,%ebp
c0008665:	57                   	push   %edi
c0008666:	56                   	push   %esi
c0008667:	53                   	push   %ebx
c0008668:	83 ec 3c             	sub    $0x3c,%esp
c000866b:	83 ec 0c             	sub    $0xc,%esp
c000866e:	68 95 b6 00 c0       	push   $0xc000b695
c0008673:	e8 14 8f ff ff       	call   c000158c <disp_str>
c0008678:	83 c4 10             	add    $0x10,%esp
c000867b:	e8 10 93 ff ff       	call   c0001990 <init>
c0008680:	c7 05 e8 1e 01 c0 00 	movl   $0x0,0xc0011ee8
c0008687:	00 00 00 
c000868a:	c7 05 ec 1e 01 c0 00 	movl   $0x0,0xc0011eec
c0008691:	00 00 00 
c0008694:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c000869b:	00 00 00 
c000869e:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c00086a5:	00 00 00 
c00086a8:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c00086af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00086b6:	e9 01 02 00 00       	jmp    c00088bc <kernel_main2+0x25a>
c00086bb:	83 ec 08             	sub    $0x8,%esp
c00086be:	6a 00                	push   $0x0
c00086c0:	6a 01                	push   $0x1
c00086c2:	e8 f9 eb ff ff       	call   c00072c0 <alloc_memory>
c00086c7:	83 c4 10             	add    $0x10,%esp
c00086ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00086cd:	83 ec 04             	sub    $0x4,%esp
c00086d0:	68 b0 02 00 00       	push   $0x2b0
c00086d5:	6a 00                	push   $0x0
c00086d7:	ff 75 d8             	pushl  -0x28(%ebp)
c00086da:	e8 cc 33 00 00       	call   c000baab <Memset>
c00086df:	83 c4 10             	add    $0x10,%esp
c00086e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086e5:	05 00 10 00 00       	add    $0x1000,%eax
c00086ea:	89 c2                	mov    %eax,%edx
c00086ec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086ef:	89 10                	mov    %edx,(%eax)
c00086f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00086f4:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c00086fb:	00 00 
c00086fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008700:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008703:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c0008709:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000870c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0008713:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0008717:	7e 0f                	jle    c0008728 <kernel_main2+0xc6>
c0008719:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000871c:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0008723:	e9 90 01 00 00       	jmp    c00088b8 <kernel_main2+0x256>
c0008728:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000872b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0008732:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0008736:	7f 73                	jg     c00087ab <kernel_main2+0x149>
c0008738:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c000873f:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0008746:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c000874d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008750:	8b 00                	mov    (%eax),%eax
c0008752:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0008755:	89 c2                	mov    %eax,%edx
c0008757:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000875a:	89 10                	mov    %edx,(%eax)
c000875c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000875f:	8b 00                	mov    (%eax),%eax
c0008761:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0008764:	89 c2                	mov    %eax,%edx
c0008766:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008769:	89 10                	mov    %edx,(%eax)
c000876b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000876e:	8b 00                	mov    (%eax),%eax
c0008770:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008776:	8b 50 14             	mov    0x14(%eax),%edx
c0008779:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000877c:	89 50 24             	mov    %edx,0x24(%eax)
c000877f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008782:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008788:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000878b:	8b 10                	mov    (%eax),%edx
c000878d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008790:	89 50 04             	mov    %edx,0x4(%eax)
c0008793:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008796:	8b 50 04             	mov    0x4(%eax),%edx
c0008799:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000879c:	89 50 08             	mov    %edx,0x8(%eax)
c000879f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087a2:	8b 50 08             	mov    0x8(%eax),%edx
c00087a5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00087a8:	89 50 0c             	mov    %edx,0xc(%eax)
c00087ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00087ae:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00087b1:	81 c2 34 01 00 00    	add    $0x134,%edx
c00087b7:	83 ec 08             	sub    $0x8,%esp
c00087ba:	50                   	push   %eax
c00087bb:	52                   	push   %edx
c00087bc:	e8 09 33 00 00       	call   c000baca <Strcpy>
c00087c1:	83 c4 10             	add    $0x10,%esp
c00087c4:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00087c8:	83 c8 04             	or     $0x4,%eax
c00087cb:	0f b6 c0             	movzbl %al,%eax
c00087ce:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c00087d2:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00087d6:	83 c8 0c             	or     $0xc,%eax
c00087d9:	0f b6 c0             	movzbl %al,%eax
c00087dc:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c00087e0:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c00087e4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087e7:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00087ed:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00087f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087f4:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c00087fa:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00087fe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008801:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c0008807:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000880b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000880e:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c0008814:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008818:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000881b:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c0008821:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008824:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c000882b:	00 00 00 
c000882e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008831:	8b 50 14             	mov    0x14(%eax),%edx
c0008834:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008837:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c000883d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008840:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0008843:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c0008849:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000884c:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0008853:	00 00 00 
c0008856:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008859:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0008860:	00 00 00 
c0008863:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008866:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000886d:	00 00 00 
c0008870:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008873:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000887a:	00 00 00 
c000887d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008880:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0008887:	00 00 00 
c000888a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000888d:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0008894:	00 00 00 
c0008897:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000889a:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00088a0:	8d 90 00 32 08 c0    	lea    -0x3ff7ce00(%eax),%edx
c00088a6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088a9:	89 c3                	mov    %eax,%ebx
c00088ab:	b8 ac 00 00 00       	mov    $0xac,%eax
c00088b0:	89 d7                	mov    %edx,%edi
c00088b2:	89 de                	mov    %ebx,%esi
c00088b4:	89 c1                	mov    %eax,%ecx
c00088b6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00088b8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00088bc:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00088c0:	0f 8e f5 fd ff ff    	jle    c00086bb <kernel_main2+0x59>
c00088c6:	c7 05 c0 0b 01 c0 00 	movl   $0xc0083200,0xc0010bc0
c00088cd:	32 08 c0 
c00088d0:	eb fe                	jmp    c00088d0 <kernel_main2+0x26e>

c00088d2 <TestTTY>:
c00088d2:	55                   	push   %ebp
c00088d3:	89 e5                	mov    %esp,%ebp
c00088d5:	83 ec 28             	sub    $0x28,%esp
c00088d8:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00088df:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00088e6:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00088ec:	83 ec 08             	sub    $0x8,%esp
c00088ef:	6a 02                	push   $0x2
c00088f1:	8d 45 de             	lea    -0x22(%ebp),%eax
c00088f4:	50                   	push   %eax
c00088f5:	e8 df d7 ff ff       	call   c00060d9 <open>
c00088fa:	83 c4 10             	add    $0x10,%esp
c00088fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008900:	83 ec 08             	sub    $0x8,%esp
c0008903:	6a 02                	push   $0x2
c0008905:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008908:	50                   	push   %eax
c0008909:	e8 cb d7 ff ff       	call   c00060d9 <open>
c000890e:	83 c4 10             	add    $0x10,%esp
c0008911:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008914:	83 ec 0c             	sub    $0xc,%esp
c0008917:	68 a1 b6 00 c0       	push   $0xc000b6a1
c000891c:	e8 f9 09 00 00       	call   c000931a <Printf>
c0008921:	83 c4 10             	add    $0x10,%esp
c0008924:	83 ec 0c             	sub    $0xc,%esp
c0008927:	6a 0a                	push   $0xa
c0008929:	e8 86 a0 ff ff       	call   c00029b4 <sys_malloc>
c000892e:	83 c4 10             	add    $0x10,%esp
c0008931:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008934:	83 ec 04             	sub    $0x4,%esp
c0008937:	6a 0a                	push   $0xa
c0008939:	6a 00                	push   $0x0
c000893b:	ff 75 ec             	pushl  -0x14(%ebp)
c000893e:	e8 68 31 00 00       	call   c000baab <Memset>
c0008943:	83 c4 10             	add    $0x10,%esp
c0008946:	83 ec 04             	sub    $0x4,%esp
c0008949:	6a 0a                	push   $0xa
c000894b:	ff 75 ec             	pushl  -0x14(%ebp)
c000894e:	ff 75 f0             	pushl  -0x10(%ebp)
c0008951:	e8 08 d8 ff ff       	call   c000615e <read>
c0008956:	83 c4 10             	add    $0x10,%esp
c0008959:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000895c:	83 ec 08             	sub    $0x8,%esp
c000895f:	ff 75 ec             	pushl  -0x14(%ebp)
c0008962:	68 b3 b6 00 c0       	push   $0xc000b6b3
c0008967:	e8 ae 09 00 00       	call   c000931a <Printf>
c000896c:	83 c4 10             	add    $0x10,%esp
c000896f:	eb c3                	jmp    c0008934 <TestTTY+0x62>

c0008971 <TestFS>:
c0008971:	55                   	push   %ebp
c0008972:	89 e5                	mov    %esp,%ebp
c0008974:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c000897a:	83 ec 0c             	sub    $0xc,%esp
c000897d:	68 bd b6 00 c0       	push   $0xc000b6bd
c0008982:	e8 05 8c ff ff       	call   c000158c <disp_str>
c0008987:	83 c4 10             	add    $0x10,%esp
c000898a:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008991:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008998:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c000899e:	83 ec 08             	sub    $0x8,%esp
c00089a1:	6a 02                	push   $0x2
c00089a3:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00089a6:	50                   	push   %eax
c00089a7:	e8 2d d7 ff ff       	call   c00060d9 <open>
c00089ac:	83 c4 10             	add    $0x10,%esp
c00089af:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00089b2:	83 ec 08             	sub    $0x8,%esp
c00089b5:	6a 02                	push   $0x2
c00089b7:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00089ba:	50                   	push   %eax
c00089bb:	e8 19 d7 ff ff       	call   c00060d9 <open>
c00089c0:	83 c4 10             	add    $0x10,%esp
c00089c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089c6:	83 ec 0c             	sub    $0xc,%esp
c00089c9:	68 a1 b6 00 c0       	push   $0xc000b6a1
c00089ce:	e8 47 09 00 00       	call   c000931a <Printf>
c00089d3:	83 c4 10             	add    $0x10,%esp
c00089d6:	90                   	nop
c00089d7:	c9                   	leave  
c00089d8:	c3                   	ret    

c00089d9 <wait_exit>:
c00089d9:	55                   	push   %ebp
c00089da:	89 e5                	mov    %esp,%ebp
c00089dc:	83 ec 28             	sub    $0x28,%esp
c00089df:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00089e6:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00089ed:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00089f3:	83 ec 08             	sub    $0x8,%esp
c00089f6:	6a 02                	push   $0x2
c00089f8:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089fb:	50                   	push   %eax
c00089fc:	e8 d8 d6 ff ff       	call   c00060d9 <open>
c0008a01:	83 c4 10             	add    $0x10,%esp
c0008a04:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a07:	83 ec 08             	sub    $0x8,%esp
c0008a0a:	6a 02                	push   $0x2
c0008a0c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a0f:	50                   	push   %eax
c0008a10:	e8 c4 d6 ff ff       	call   c00060d9 <open>
c0008a15:	83 c4 10             	add    $0x10,%esp
c0008a18:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a1b:	e8 d9 d8 ff ff       	call   c00062f9 <fork>
c0008a20:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a23:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008a27:	7e 25                	jle    c0008a4e <wait_exit+0x75>
c0008a29:	83 ec 0c             	sub    $0xc,%esp
c0008a2c:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008a2f:	50                   	push   %eax
c0008a30:	e8 5d d8 ff ff       	call   c0006292 <wait>
c0008a35:	83 c4 10             	add    $0x10,%esp
c0008a38:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a3b:	83 ec 08             	sub    $0x8,%esp
c0008a3e:	50                   	push   %eax
c0008a3f:	68 c5 b6 00 c0       	push   $0xc000b6c5
c0008a44:	e8 d1 08 00 00       	call   c000931a <Printf>
c0008a49:	83 c4 10             	add    $0x10,%esp
c0008a4c:	eb fe                	jmp    c0008a4c <wait_exit+0x73>
c0008a4e:	83 ec 0c             	sub    $0xc,%esp
c0008a51:	68 e0 b6 00 c0       	push   $0xc000b6e0
c0008a56:	e8 bf 08 00 00       	call   c000931a <Printf>
c0008a5b:	83 c4 10             	add    $0x10,%esp
c0008a5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008a65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a68:	8d 50 01             	lea    0x1(%eax),%edx
c0008a6b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008a6e:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008a73:	7f 02                	jg     c0008a77 <wait_exit+0x9e>
c0008a75:	eb ee                	jmp    c0008a65 <wait_exit+0x8c>
c0008a77:	90                   	nop
c0008a78:	83 ec 0c             	sub    $0xc,%esp
c0008a7b:	68 ec b6 00 c0       	push   $0xc000b6ec
c0008a80:	e8 95 08 00 00       	call   c000931a <Printf>
c0008a85:	83 c4 10             	add    $0x10,%esp
c0008a88:	83 ec 0c             	sub    $0xc,%esp
c0008a8b:	6a 09                	push   $0x9
c0008a8d:	e8 3e d8 ff ff       	call   c00062d0 <exit>
c0008a92:	83 c4 10             	add    $0x10,%esp
c0008a95:	83 ec 0c             	sub    $0xc,%esp
c0008a98:	68 fa b6 00 c0       	push   $0xc000b6fa
c0008a9d:	e8 78 08 00 00       	call   c000931a <Printf>
c0008aa2:	83 c4 10             	add    $0x10,%esp
c0008aa5:	eb fe                	jmp    c0008aa5 <wait_exit+0xcc>

c0008aa7 <INIT_fork>:
c0008aa7:	55                   	push   %ebp
c0008aa8:	89 e5                	mov    %esp,%ebp
c0008aaa:	53                   	push   %ebx
c0008aab:	83 ec 74             	sub    $0x74,%esp
c0008aae:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008ab5:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008abc:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008ac2:	83 ec 08             	sub    $0x8,%esp
c0008ac5:	6a 02                	push   $0x2
c0008ac7:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008aca:	50                   	push   %eax
c0008acb:	e8 09 d6 ff ff       	call   c00060d9 <open>
c0008ad0:	83 c4 10             	add    $0x10,%esp
c0008ad3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ad6:	83 ec 08             	sub    $0x8,%esp
c0008ad9:	6a 02                	push   $0x2
c0008adb:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008ade:	50                   	push   %eax
c0008adf:	e8 f5 d5 ff ff       	call   c00060d9 <open>
c0008ae4:	83 c4 10             	add    $0x10,%esp
c0008ae7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008aea:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008af1:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008af8:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008aff:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008b06:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008b0d:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008b14:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008b1b:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008b22:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008b29:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008b30:	83 ec 0c             	sub    $0xc,%esp
c0008b33:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b36:	50                   	push   %eax
c0008b37:	e8 de 07 00 00       	call   c000931a <Printf>
c0008b3c:	83 c4 10             	add    $0x10,%esp
c0008b3f:	83 ec 0c             	sub    $0xc,%esp
c0008b42:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b45:	50                   	push   %eax
c0008b46:	e8 99 2f 00 00       	call   c000bae4 <Strlen>
c0008b4b:	83 c4 10             	add    $0x10,%esp
c0008b4e:	83 ec 04             	sub    $0x4,%esp
c0008b51:	50                   	push   %eax
c0008b52:	6a 00                	push   $0x0
c0008b54:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b57:	50                   	push   %eax
c0008b58:	e8 4e 2f 00 00       	call   c000baab <Memset>
c0008b5d:	83 c4 10             	add    $0x10,%esp
c0008b60:	83 ec 04             	sub    $0x4,%esp
c0008b63:	6a 28                	push   $0x28
c0008b65:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b68:	50                   	push   %eax
c0008b69:	ff 75 f0             	pushl  -0x10(%ebp)
c0008b6c:	e8 ed d5 ff ff       	call   c000615e <read>
c0008b71:	83 c4 10             	add    $0x10,%esp
c0008b74:	83 ec 0c             	sub    $0xc,%esp
c0008b77:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b7a:	50                   	push   %eax
c0008b7b:	e8 9a 07 00 00       	call   c000931a <Printf>
c0008b80:	83 c4 10             	add    $0x10,%esp
c0008b83:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008b8a:	e8 6a d7 ff ff       	call   c00062f9 <fork>
c0008b8f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008b92:	83 ec 0c             	sub    $0xc,%esp
c0008b95:	6a 01                	push   $0x1
c0008b97:	e8 4a 06 00 00       	call   c00091e6 <delay>
c0008b9c:	83 c4 10             	add    $0x10,%esp
c0008b9f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008ba3:	7e 7a                	jle    c0008c1f <INIT_fork+0x178>
c0008ba5:	83 ec 0c             	sub    $0xc,%esp
c0008ba8:	68 08 b7 00 c0       	push   $0xc000b708
c0008bad:	e8 68 07 00 00       	call   c000931a <Printf>
c0008bb2:	83 c4 10             	add    $0x10,%esp
c0008bb5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008bb9:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0008bc0:	c7 45 92 6e 74 0a 00 	movl   $0xa746e,-0x6e(%ebp)
c0008bc7:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008bca:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008bcf:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008bd4:	89 18                	mov    %ebx,(%eax)
c0008bd6:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008bda:	8d 50 04             	lea    0x4(%eax),%edx
c0008bdd:	83 e2 fc             	and    $0xfffffffc,%edx
c0008be0:	29 d0                	sub    %edx,%eax
c0008be2:	01 c1                	add    %eax,%ecx
c0008be4:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008be7:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008bea:	b8 00 00 00 00       	mov    $0x0,%eax
c0008bef:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008bf2:	83 c0 04             	add    $0x4,%eax
c0008bf5:	39 c8                	cmp    %ecx,%eax
c0008bf7:	72 f6                	jb     c0008bef <INIT_fork+0x148>
c0008bf9:	01 c2                	add    %eax,%edx
c0008bfb:	83 ec 0c             	sub    $0xc,%esp
c0008bfe:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c01:	50                   	push   %eax
c0008c02:	e8 dd 2e 00 00       	call   c000bae4 <Strlen>
c0008c07:	83 c4 10             	add    $0x10,%esp
c0008c0a:	83 ec 04             	sub    $0x4,%esp
c0008c0d:	50                   	push   %eax
c0008c0e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c11:	50                   	push   %eax
c0008c12:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c15:	e8 b8 d5 ff ff       	call   c00061d2 <write>
c0008c1a:	83 c4 10             	add    $0x10,%esp
c0008c1d:	eb fe                	jmp    c0008c1d <INIT_fork+0x176>
c0008c1f:	83 ec 0c             	sub    $0xc,%esp
c0008c22:	6a 01                	push   $0x1
c0008c24:	e8 bd 05 00 00       	call   c00091e6 <delay>
c0008c29:	83 c4 10             	add    $0x10,%esp
c0008c2c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008c30:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008c34:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0008c3b:	c7 45 92 64 0a 00 00 	movl   $0xa64,-0x6e(%ebp)
c0008c42:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008c45:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008c4a:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008c4f:	89 18                	mov    %ebx,(%eax)
c0008c51:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008c55:	8d 50 04             	lea    0x4(%eax),%edx
c0008c58:	83 e2 fc             	and    $0xfffffffc,%edx
c0008c5b:	29 d0                	sub    %edx,%eax
c0008c5d:	01 c1                	add    %eax,%ecx
c0008c5f:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008c62:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008c65:	b8 00 00 00 00       	mov    $0x0,%eax
c0008c6a:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008c6d:	83 c0 04             	add    $0x4,%eax
c0008c70:	39 c8                	cmp    %ecx,%eax
c0008c72:	72 f6                	jb     c0008c6a <INIT_fork+0x1c3>
c0008c74:	01 c2                	add    %eax,%edx
c0008c76:	83 ec 0c             	sub    $0xc,%esp
c0008c79:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c7c:	50                   	push   %eax
c0008c7d:	e8 62 2e 00 00       	call   c000bae4 <Strlen>
c0008c82:	83 c4 10             	add    $0x10,%esp
c0008c85:	83 ec 04             	sub    $0x4,%esp
c0008c88:	50                   	push   %eax
c0008c89:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c8c:	50                   	push   %eax
c0008c8d:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c90:	e8 3d d5 ff ff       	call   c00061d2 <write>
c0008c95:	83 c4 10             	add    $0x10,%esp
c0008c98:	eb fe                	jmp    c0008c98 <INIT_fork+0x1f1>

c0008c9a <simple_shell>:
c0008c9a:	55                   	push   %ebp
c0008c9b:	89 e5                	mov    %esp,%ebp
c0008c9d:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008ca3:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008caa:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008cb1:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008cb7:	83 ec 08             	sub    $0x8,%esp
c0008cba:	6a 02                	push   $0x2
c0008cbc:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008cbf:	50                   	push   %eax
c0008cc0:	e8 14 d4 ff ff       	call   c00060d9 <open>
c0008cc5:	83 c4 10             	add    $0x10,%esp
c0008cc8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008ccb:	83 ec 08             	sub    $0x8,%esp
c0008cce:	6a 02                	push   $0x2
c0008cd0:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008cd3:	50                   	push   %eax
c0008cd4:	e8 00 d4 ff ff       	call   c00060d9 <open>
c0008cd9:	83 c4 10             	add    $0x10,%esp
c0008cdc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008cdf:	83 ec 04             	sub    $0x4,%esp
c0008ce2:	68 80 00 00 00       	push   $0x80
c0008ce7:	6a 00                	push   $0x0
c0008ce9:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008cef:	50                   	push   %eax
c0008cf0:	e8 b6 2d 00 00       	call   c000baab <Memset>
c0008cf5:	83 c4 10             	add    $0x10,%esp
c0008cf8:	83 ec 04             	sub    $0x4,%esp
c0008cfb:	68 80 00 00 00       	push   $0x80
c0008d00:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d06:	50                   	push   %eax
c0008d07:	ff 75 e0             	pushl  -0x20(%ebp)
c0008d0a:	e8 4f d4 ff ff       	call   c000615e <read>
c0008d0f:	83 c4 10             	add    $0x10,%esp
c0008d12:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d19:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008d20:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d26:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d29:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d2c:	0f b6 00             	movzbl (%eax),%eax
c0008d2f:	88 45 db             	mov    %al,-0x25(%ebp)
c0008d32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d35:	0f b6 00             	movzbl (%eax),%eax
c0008d38:	3c 20                	cmp    $0x20,%al
c0008d3a:	74 1d                	je     c0008d59 <simple_shell+0xbf>
c0008d3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d3f:	0f b6 00             	movzbl (%eax),%eax
c0008d42:	84 c0                	test   %al,%al
c0008d44:	74 13                	je     c0008d59 <simple_shell+0xbf>
c0008d46:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008d4a:	75 0d                	jne    c0008d59 <simple_shell+0xbf>
c0008d4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008d52:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008d59:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d5c:	0f b6 00             	movzbl (%eax),%eax
c0008d5f:	3c 20                	cmp    $0x20,%al
c0008d61:	74 0a                	je     c0008d6d <simple_shell+0xd3>
c0008d63:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d66:	0f b6 00             	movzbl (%eax),%eax
c0008d69:	84 c0                	test   %al,%al
c0008d6b:	75 26                	jne    c0008d93 <simple_shell+0xf9>
c0008d6d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008d71:	75 20                	jne    c0008d93 <simple_shell+0xf9>
c0008d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d76:	8d 50 01             	lea    0x1(%eax),%edx
c0008d79:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008d7c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008d7f:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008d86:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d89:	c6 00 00             	movb   $0x0,(%eax)
c0008d8c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008d93:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008d97:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008d9b:	75 8c                	jne    c0008d29 <simple_shell+0x8f>
c0008d9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008da0:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008da7:	00 00 00 00 
c0008dab:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008db2:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008db8:	83 ec 08             	sub    $0x8,%esp
c0008dbb:	6a 02                	push   $0x2
c0008dbd:	50                   	push   %eax
c0008dbe:	e8 16 d3 ff ff       	call   c00060d9 <open>
c0008dc3:	83 c4 10             	add    $0x10,%esp
c0008dc6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008dc9:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008dcd:	75 54                	jne    c0008e23 <simple_shell+0x189>
c0008dcf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008dd6:	eb 29                	jmp    c0008e01 <simple_shell+0x167>
c0008dd8:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008dde:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008de1:	01 d0                	add    %edx,%eax
c0008de3:	0f b6 00             	movzbl (%eax),%eax
c0008de6:	0f be c0             	movsbl %al,%eax
c0008de9:	83 ec 04             	sub    $0x4,%esp
c0008dec:	50                   	push   %eax
c0008ded:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008df0:	68 0e b7 00 c0       	push   $0xc000b70e
c0008df5:	e8 20 05 00 00       	call   c000931a <Printf>
c0008dfa:	83 c4 10             	add    $0x10,%esp
c0008dfd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008e01:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008e05:	7e d1                	jle    c0008dd8 <simple_shell+0x13e>
c0008e07:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e0d:	83 ec 08             	sub    $0x8,%esp
c0008e10:	50                   	push   %eax
c0008e11:	68 15 b7 00 c0       	push   $0xc000b715
c0008e16:	e8 ff 04 00 00       	call   c000931a <Printf>
c0008e1b:	83 c4 10             	add    $0x10,%esp
c0008e1e:	e9 bc fe ff ff       	jmp    c0008cdf <simple_shell+0x45>
c0008e23:	e8 d1 d4 ff ff       	call   c00062f9 <fork>
c0008e28:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008e2b:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008e2f:	7e 17                	jle    c0008e48 <simple_shell+0x1ae>
c0008e31:	83 ec 0c             	sub    $0xc,%esp
c0008e34:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008e3a:	50                   	push   %eax
c0008e3b:	e8 52 d4 ff ff       	call   c0006292 <wait>
c0008e40:	83 c4 10             	add    $0x10,%esp
c0008e43:	e9 97 fe ff ff       	jmp    c0008cdf <simple_shell+0x45>
c0008e48:	83 ec 0c             	sub    $0xc,%esp
c0008e4b:	ff 75 d0             	pushl  -0x30(%ebp)
c0008e4e:	e8 f3 d3 ff ff       	call   c0006246 <close>
c0008e53:	83 c4 10             	add    $0x10,%esp
c0008e56:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e5c:	83 ec 08             	sub    $0x8,%esp
c0008e5f:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008e65:	52                   	push   %edx
c0008e66:	50                   	push   %eax
c0008e67:	e8 7c d5 ff ff       	call   c00063e8 <execv>
c0008e6c:	83 c4 10             	add    $0x10,%esp
c0008e6f:	eb fe                	jmp    c0008e6f <simple_shell+0x1d5>

c0008e71 <test_split_str>:
c0008e71:	55                   	push   %ebp
c0008e72:	89 e5                	mov    %esp,%ebp
c0008e74:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008e7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008e81:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008e88:	c7 45 ec 1b b7 00 c0 	movl   $0xc000b71b,-0x14(%ebp)
c0008e8f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008e93:	75 1a                	jne    c0008eaf <test_split_str+0x3e>
c0008e95:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e98:	0f b6 00             	movzbl (%eax),%eax
c0008e9b:	0f be c0             	movsbl %al,%eax
c0008e9e:	83 ec 08             	sub    $0x8,%esp
c0008ea1:	50                   	push   %eax
c0008ea2:	68 2c b7 00 c0       	push   $0xc000b72c
c0008ea7:	e8 6e 04 00 00       	call   c000931a <Printf>
c0008eac:	83 c4 10             	add    $0x10,%esp
c0008eaf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008eb2:	0f b6 00             	movzbl (%eax),%eax
c0008eb5:	3c 20                	cmp    $0x20,%al
c0008eb7:	75 0a                	jne    c0008ec3 <test_split_str+0x52>
c0008eb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ebc:	0f b6 00             	movzbl (%eax),%eax
c0008ebf:	84 c0                	test   %al,%al
c0008ec1:	74 13                	je     c0008ed6 <test_split_str+0x65>
c0008ec3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008ec7:	75 0d                	jne    c0008ed6 <test_split_str+0x65>
c0008ec9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ecc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ecf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008ed6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ed9:	0f b6 00             	movzbl (%eax),%eax
c0008edc:	3c 20                	cmp    $0x20,%al
c0008ede:	74 0a                	je     c0008eea <test_split_str+0x79>
c0008ee0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ee3:	0f b6 00             	movzbl (%eax),%eax
c0008ee6:	84 c0                	test   %al,%al
c0008ee8:	75 26                	jne    c0008f10 <test_split_str+0x9f>
c0008eea:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008eee:	75 20                	jne    c0008f10 <test_split_str+0x9f>
c0008ef0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ef3:	8d 50 01             	lea    0x1(%eax),%edx
c0008ef6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008ef9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008efc:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008f03:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f06:	c6 00 00             	movb   $0x0,(%eax)
c0008f09:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008f10:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008f14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f17:	0f b6 00             	movzbl (%eax),%eax
c0008f1a:	84 c0                	test   %al,%al
c0008f1c:	0f 85 6d ff ff ff    	jne    c0008e8f <test_split_str+0x1e>
c0008f22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f25:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008f28:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008f2f:	83 ec 08             	sub    $0x8,%esp
c0008f32:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f35:	68 35 b7 00 c0       	push   $0xc000b735
c0008f3a:	e8 db 03 00 00       	call   c000931a <Printf>
c0008f3f:	83 c4 10             	add    $0x10,%esp
c0008f42:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008f49:	eb 22                	jmp    c0008f6d <test_split_str+0xfc>
c0008f4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f4e:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008f55:	83 ec 04             	sub    $0x4,%esp
c0008f58:	50                   	push   %eax
c0008f59:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008f5c:	68 4c b7 00 c0       	push   $0xc000b74c
c0008f61:	e8 b4 03 00 00       	call   c000931a <Printf>
c0008f66:	83 c4 10             	add    $0x10,%esp
c0008f69:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008f6d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f70:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008f73:	7e d6                	jle    c0008f4b <test_split_str+0xda>
c0008f75:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008f7b:	83 ec 08             	sub    $0x8,%esp
c0008f7e:	68 5b b7 00 c0       	push   $0xc000b75b
c0008f83:	50                   	push   %eax
c0008f84:	e8 ba 12 00 00       	call   c000a243 <strcmp>
c0008f89:	83 c4 10             	add    $0x10,%esp
c0008f8c:	85 c0                	test   %eax,%eax
c0008f8e:	75 10                	jne    c0008fa0 <test_split_str+0x12f>
c0008f90:	83 ec 0c             	sub    $0xc,%esp
c0008f93:	68 60 b7 00 c0       	push   $0xc000b760
c0008f98:	e8 7d 03 00 00       	call   c000931a <Printf>
c0008f9d:	83 c4 10             	add    $0x10,%esp
c0008fa0:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008fa6:	83 ec 08             	sub    $0x8,%esp
c0008fa9:	50                   	push   %eax
c0008faa:	68 6c b7 00 c0       	push   $0xc000b76c
c0008faf:	e8 66 03 00 00       	call   c000931a <Printf>
c0008fb4:	83 c4 10             	add    $0x10,%esp
c0008fb7:	83 ec 0c             	sub    $0xc,%esp
c0008fba:	68 7a b7 00 c0       	push   $0xc000b77a
c0008fbf:	e8 56 03 00 00       	call   c000931a <Printf>
c0008fc4:	83 c4 10             	add    $0x10,%esp
c0008fc7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008fce:	eb 26                	jmp    c0008ff6 <test_split_str+0x185>
c0008fd0:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008fd6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008fd9:	01 d0                	add    %edx,%eax
c0008fdb:	0f b6 00             	movzbl (%eax),%eax
c0008fde:	0f be c0             	movsbl %al,%eax
c0008fe1:	83 ec 08             	sub    $0x8,%esp
c0008fe4:	50                   	push   %eax
c0008fe5:	68 89 b7 00 c0       	push   $0xc000b789
c0008fea:	e8 2b 03 00 00       	call   c000931a <Printf>
c0008fef:	83 c4 10             	add    $0x10,%esp
c0008ff2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008ff6:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008ffa:	7e d4                	jle    c0008fd0 <test_split_str+0x15f>
c0008ffc:	c9                   	leave  
c0008ffd:	c3                   	ret    

c0008ffe <test_shell>:
c0008ffe:	55                   	push   %ebp
c0008fff:	89 e5                	mov    %esp,%ebp
c0009001:	83 ec 48             	sub    $0x48,%esp
c0009004:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c000900b:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0009012:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0009018:	83 ec 08             	sub    $0x8,%esp
c000901b:	6a 02                	push   $0x2
c000901d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0009020:	50                   	push   %eax
c0009021:	e8 b3 d0 ff ff       	call   c00060d9 <open>
c0009026:	83 c4 10             	add    $0x10,%esp
c0009029:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000902c:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0009033:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c000903a:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0009041:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0009048:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c000904f:	83 ec 0c             	sub    $0xc,%esp
c0009052:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0009055:	50                   	push   %eax
c0009056:	e8 9a eb ff ff       	call   c0007bf5 <untar>
c000905b:	83 c4 10             	add    $0x10,%esp
c000905e:	e8 96 d2 ff ff       	call   c00062f9 <fork>
c0009063:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009066:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000906a:	7e 25                	jle    c0009091 <test_shell+0x93>
c000906c:	83 ec 0c             	sub    $0xc,%esp
c000906f:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0009072:	50                   	push   %eax
c0009073:	e8 1a d2 ff ff       	call   c0006292 <wait>
c0009078:	83 c4 10             	add    $0x10,%esp
c000907b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000907e:	83 ec 08             	sub    $0x8,%esp
c0009081:	50                   	push   %eax
c0009082:	68 92 b7 00 c0       	push   $0xc000b792
c0009087:	e8 8e 02 00 00       	call   c000931a <Printf>
c000908c:	83 c4 10             	add    $0x10,%esp
c000908f:	eb 23                	jmp    c00090b4 <test_shell+0xb6>
c0009091:	83 ec 0c             	sub    $0xc,%esp
c0009094:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0009099:	e8 7c 02 00 00       	call   c000931a <Printf>
c000909e:	83 c4 10             	add    $0x10,%esp
c00090a1:	83 ec 0c             	sub    $0xc,%esp
c00090a4:	ff 75 f4             	pushl  -0xc(%ebp)
c00090a7:	e8 9a d1 ff ff       	call   c0006246 <close>
c00090ac:	83 c4 10             	add    $0x10,%esp
c00090af:	e8 e6 fb ff ff       	call   c0008c9a <simple_shell>
c00090b4:	83 ec 0c             	sub    $0xc,%esp
c00090b7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00090ba:	50                   	push   %eax
c00090bb:	e8 d2 d1 ff ff       	call   c0006292 <wait>
c00090c0:	83 c4 10             	add    $0x10,%esp
c00090c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00090c6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00090c9:	83 ec 08             	sub    $0x8,%esp
c00090cc:	50                   	push   %eax
c00090cd:	68 b2 b7 00 c0       	push   $0xc000b7b2
c00090d2:	e8 43 02 00 00       	call   c000931a <Printf>
c00090d7:	83 c4 10             	add    $0x10,%esp
c00090da:	eb d8                	jmp    c00090b4 <test_shell+0xb6>

c00090dc <test_exec>:
c00090dc:	55                   	push   %ebp
c00090dd:	89 e5                	mov    %esp,%ebp
c00090df:	83 ec 38             	sub    $0x38,%esp
c00090e2:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c00090e9:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c00090f0:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c00090f6:	83 ec 08             	sub    $0x8,%esp
c00090f9:	6a 02                	push   $0x2
c00090fb:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00090fe:	50                   	push   %eax
c00090ff:	e8 d5 cf ff ff       	call   c00060d9 <open>
c0009104:	83 c4 10             	add    $0x10,%esp
c0009107:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000910a:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0009111:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0009118:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c000911f:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0009126:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c000912d:	83 ec 0c             	sub    $0xc,%esp
c0009130:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0009133:	50                   	push   %eax
c0009134:	e8 bc ea ff ff       	call   c0007bf5 <untar>
c0009139:	83 c4 10             	add    $0x10,%esp
c000913c:	e8 b8 d1 ff ff       	call   c00062f9 <fork>
c0009141:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009144:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009148:	7e 25                	jle    c000916f <test_exec+0x93>
c000914a:	83 ec 0c             	sub    $0xc,%esp
c000914d:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0009150:	50                   	push   %eax
c0009151:	e8 3c d1 ff ff       	call   c0006292 <wait>
c0009156:	83 c4 10             	add    $0x10,%esp
c0009159:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000915c:	83 ec 08             	sub    $0x8,%esp
c000915f:	50                   	push   %eax
c0009160:	68 92 b7 00 c0       	push   $0xc000b792
c0009165:	e8 b0 01 00 00       	call   c000931a <Printf>
c000916a:	83 c4 10             	add    $0x10,%esp
c000916d:	eb 33                	jmp    c00091a2 <test_exec+0xc6>
c000916f:	83 ec 0c             	sub    $0xc,%esp
c0009172:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0009177:	e8 9e 01 00 00       	call   c000931a <Printf>
c000917c:	83 c4 10             	add    $0x10,%esp
c000917f:	83 ec 0c             	sub    $0xc,%esp
c0009182:	6a 00                	push   $0x0
c0009184:	68 cd b7 00 c0       	push   $0xc000b7cd
c0009189:	68 d3 b7 00 c0       	push   $0xc000b7d3
c000918e:	68 5b b7 00 c0       	push   $0xc000b75b
c0009193:	68 d9 b7 00 c0       	push   $0xc000b7d9
c0009198:	e8 f0 d3 ff ff       	call   c000658d <execl>
c000919d:	83 c4 20             	add    $0x20,%esp
c00091a0:	eb fe                	jmp    c00091a0 <test_exec+0xc4>
c00091a2:	c9                   	leave  
c00091a3:	c3                   	ret    

c00091a4 <INIT>:
c00091a4:	55                   	push   %ebp
c00091a5:	89 e5                	mov    %esp,%ebp
c00091a7:	83 ec 08             	sub    $0x8,%esp
c00091aa:	e8 4f fe ff ff       	call   c0008ffe <test_shell>
c00091af:	eb fe                	jmp    c00091af <INIT+0xb>

c00091b1 <TestA>:
c00091b1:	55                   	push   %ebp
c00091b2:	89 e5                	mov    %esp,%ebp
c00091b4:	83 ec 08             	sub    $0x8,%esp
c00091b7:	83 ec 0c             	sub    $0xc,%esp
c00091ba:	6a 05                	push   $0x5
c00091bc:	e8 e4 ec ff ff       	call   c0007ea5 <disp_int>
c00091c1:	83 c4 10             	add    $0x10,%esp
c00091c4:	83 ec 0c             	sub    $0xc,%esp
c00091c7:	68 54 b3 00 c0       	push   $0xc000b354
c00091cc:	e8 bb 83 ff ff       	call   c000158c <disp_str>
c00091d1:	83 c4 10             	add    $0x10,%esp
c00091d4:	83 ec 0c             	sub    $0xc,%esp
c00091d7:	68 df b7 00 c0       	push   $0xc000b7df
c00091dc:	e8 ab 83 ff ff       	call   c000158c <disp_str>
c00091e1:	83 c4 10             	add    $0x10,%esp
c00091e4:	eb fe                	jmp    c00091e4 <TestA+0x33>

c00091e6 <delay>:
c00091e6:	55                   	push   %ebp
c00091e7:	89 e5                	mov    %esp,%ebp
c00091e9:	83 ec 10             	sub    $0x10,%esp
c00091ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00091f3:	eb 2a                	jmp    c000921f <delay+0x39>
c00091f5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00091fc:	eb 17                	jmp    c0009215 <delay+0x2f>
c00091fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009205:	eb 04                	jmp    c000920b <delay+0x25>
c0009207:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000920b:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000920f:	7e f6                	jle    c0009207 <delay+0x21>
c0009211:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009215:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0009219:	7e e3                	jle    c00091fe <delay+0x18>
c000921b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000921f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009222:	3b 45 08             	cmp    0x8(%ebp),%eax
c0009225:	7c ce                	jl     c00091f5 <delay+0xf>
c0009227:	90                   	nop
c0009228:	c9                   	leave  
c0009229:	c3                   	ret    

c000922a <TestB>:
c000922a:	55                   	push   %ebp
c000922b:	89 e5                	mov    %esp,%ebp
c000922d:	83 ec 08             	sub    $0x8,%esp
c0009230:	83 ec 0c             	sub    $0xc,%esp
c0009233:	68 e6 b7 00 c0       	push   $0xc000b7e6
c0009238:	e8 4f 83 ff ff       	call   c000158c <disp_str>
c000923d:	83 c4 10             	add    $0x10,%esp
c0009240:	eb fe                	jmp    c0009240 <TestB+0x16>

c0009242 <TestC>:
c0009242:	55                   	push   %ebp
c0009243:	89 e5                	mov    %esp,%ebp
c0009245:	83 ec 18             	sub    $0x18,%esp
c0009248:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000924f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0009253:	77 1a                	ja     c000926f <TestC+0x2d>
c0009255:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c000925c:	83 ec 08             	sub    $0x8,%esp
c000925f:	ff 75 f0             	pushl  -0x10(%ebp)
c0009262:	68 e9 b7 00 c0       	push   $0xc000b7e9
c0009267:	e8 ae 00 00 00       	call   c000931a <Printf>
c000926c:	83 c4 10             	add    $0x10,%esp
c000926f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009273:	eb da                	jmp    c000924f <TestC+0xd>

c0009275 <sys_get_ticks>:
c0009275:	55                   	push   %ebp
c0009276:	89 e5                	mov    %esp,%ebp
c0009278:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000927d:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0009283:	5d                   	pop    %ebp
c0009284:	c3                   	ret    

c0009285 <sys_write>:
c0009285:	55                   	push   %ebp
c0009286:	89 e5                	mov    %esp,%ebp
c0009288:	83 ec 18             	sub    $0x18,%esp
c000928b:	8b 45 10             	mov    0x10(%ebp),%eax
c000928e:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009294:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c000929a:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c000929f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092a2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00092a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00092ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00092ae:	eb 20                	jmp    c00092d0 <sys_write+0x4b>
c00092b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092b3:	0f b6 00             	movzbl (%eax),%eax
c00092b6:	0f b6 c0             	movzbl %al,%eax
c00092b9:	83 ec 08             	sub    $0x8,%esp
c00092bc:	50                   	push   %eax
c00092bd:	ff 75 ec             	pushl  -0x14(%ebp)
c00092c0:	e8 95 c1 ff ff       	call   c000545a <out_char>
c00092c5:	83 c4 10             	add    $0x10,%esp
c00092c8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00092cc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00092d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00092d4:	7f da                	jg     c00092b0 <sys_write+0x2b>
c00092d6:	90                   	nop
c00092d7:	c9                   	leave  
c00092d8:	c3                   	ret    

c00092d9 <milli_delay>:
c00092d9:	55                   	push   %ebp
c00092da:	89 e5                	mov    %esp,%ebp
c00092dc:	83 ec 18             	sub    $0x18,%esp
c00092df:	e8 8b 0d 00 00       	call   c000a06f <get_ticks_ipc>
c00092e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092e7:	90                   	nop
c00092e8:	e8 82 0d 00 00       	call   c000a06f <get_ticks_ipc>
c00092ed:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00092f0:	89 c1                	mov    %eax,%ecx
c00092f2:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00092f7:	89 c8                	mov    %ecx,%eax
c00092f9:	f7 ea                	imul   %edx
c00092fb:	c1 fa 05             	sar    $0x5,%edx
c00092fe:	89 c8                	mov    %ecx,%eax
c0009300:	c1 f8 1f             	sar    $0x1f,%eax
c0009303:	29 c2                	sub    %eax,%edx
c0009305:	89 d0                	mov    %edx,%eax
c0009307:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c000930d:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009310:	77 d6                	ja     c00092e8 <milli_delay+0xf>
c0009312:	90                   	nop
c0009313:	c9                   	leave  
c0009314:	c3                   	ret    

c0009315 <TaskSys>:
c0009315:	55                   	push   %ebp
c0009316:	89 e5                	mov    %esp,%ebp
c0009318:	eb fe                	jmp    c0009318 <TaskSys+0x3>

c000931a <Printf>:
c000931a:	55                   	push   %ebp
c000931b:	89 e5                	mov    %esp,%ebp
c000931d:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009323:	83 ec 04             	sub    $0x4,%esp
c0009326:	68 00 01 00 00       	push   $0x100
c000932b:	6a 00                	push   $0x0
c000932d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009333:	50                   	push   %eax
c0009334:	e8 72 27 00 00       	call   c000baab <Memset>
c0009339:	83 c4 10             	add    $0x10,%esp
c000933c:	8d 45 0c             	lea    0xc(%ebp),%eax
c000933f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009342:	8b 45 08             	mov    0x8(%ebp),%eax
c0009345:	83 ec 04             	sub    $0x4,%esp
c0009348:	ff 75 f4             	pushl  -0xc(%ebp)
c000934b:	50                   	push   %eax
c000934c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009352:	50                   	push   %eax
c0009353:	e8 20 00 00 00       	call   c0009378 <vsprintf>
c0009358:	83 c4 10             	add    $0x10,%esp
c000935b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000935e:	83 ec 04             	sub    $0x4,%esp
c0009361:	ff 75 f0             	pushl  -0x10(%ebp)
c0009364:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000936a:	50                   	push   %eax
c000936b:	6a 00                	push   $0x0
c000936d:	e8 60 ce ff ff       	call   c00061d2 <write>
c0009372:	83 c4 10             	add    $0x10,%esp
c0009375:	90                   	nop
c0009376:	c9                   	leave  
c0009377:	c3                   	ret    

c0009378 <vsprintf>:
c0009378:	55                   	push   %ebp
c0009379:	89 e5                	mov    %esp,%ebp
c000937b:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009381:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009387:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c000938d:	83 ec 04             	sub    $0x4,%esp
c0009390:	6a 40                	push   $0x40
c0009392:	6a 00                	push   $0x0
c0009394:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000939a:	50                   	push   %eax
c000939b:	e8 0b 27 00 00       	call   c000baab <Memset>
c00093a0:	83 c4 10             	add    $0x10,%esp
c00093a3:	8b 45 10             	mov    0x10(%ebp),%eax
c00093a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00093b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00093b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00093b6:	e9 53 01 00 00       	jmp    c000950e <vsprintf+0x196>
c00093bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00093be:	0f b6 00             	movzbl (%eax),%eax
c00093c1:	3c 25                	cmp    $0x25,%al
c00093c3:	74 16                	je     c00093db <vsprintf+0x63>
c00093c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00093c8:	8d 50 01             	lea    0x1(%eax),%edx
c00093cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00093ce:	8b 55 0c             	mov    0xc(%ebp),%edx
c00093d1:	0f b6 12             	movzbl (%edx),%edx
c00093d4:	88 10                	mov    %dl,(%eax)
c00093d6:	e9 2f 01 00 00       	jmp    c000950a <vsprintf+0x192>
c00093db:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00093df:	8b 45 0c             	mov    0xc(%ebp),%eax
c00093e2:	0f b6 00             	movzbl (%eax),%eax
c00093e5:	0f be c0             	movsbl %al,%eax
c00093e8:	83 f8 64             	cmp    $0x64,%eax
c00093eb:	74 26                	je     c0009413 <vsprintf+0x9b>
c00093ed:	83 f8 64             	cmp    $0x64,%eax
c00093f0:	7f 0e                	jg     c0009400 <vsprintf+0x88>
c00093f2:	83 f8 63             	cmp    $0x63,%eax
c00093f5:	0f 84 f2 00 00 00    	je     c00094ed <vsprintf+0x175>
c00093fb:	e9 0a 01 00 00       	jmp    c000950a <vsprintf+0x192>
c0009400:	83 f8 73             	cmp    $0x73,%eax
c0009403:	0f 84 b0 00 00 00    	je     c00094b9 <vsprintf+0x141>
c0009409:	83 f8 78             	cmp    $0x78,%eax
c000940c:	74 5d                	je     c000946b <vsprintf+0xf3>
c000940e:	e9 f7 00 00 00       	jmp    c000950a <vsprintf+0x192>
c0009413:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009416:	8b 00                	mov    (%eax),%eax
c0009418:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000941b:	83 ec 04             	sub    $0x4,%esp
c000941e:	6a 0a                	push   $0xa
c0009420:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009426:	50                   	push   %eax
c0009427:	ff 75 e8             	pushl  -0x18(%ebp)
c000942a:	e8 8b 0c 00 00       	call   c000a0ba <itoa>
c000942f:	83 c4 10             	add    $0x10,%esp
c0009432:	83 ec 08             	sub    $0x8,%esp
c0009435:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000943b:	50                   	push   %eax
c000943c:	ff 75 f4             	pushl  -0xc(%ebp)
c000943f:	e8 86 26 00 00       	call   c000baca <Strcpy>
c0009444:	83 c4 10             	add    $0x10,%esp
c0009447:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000944b:	83 ec 0c             	sub    $0xc,%esp
c000944e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009454:	50                   	push   %eax
c0009455:	e8 8a 26 00 00       	call   c000bae4 <Strlen>
c000945a:	83 c4 10             	add    $0x10,%esp
c000945d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009460:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009463:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009466:	e9 9f 00 00 00       	jmp    c000950a <vsprintf+0x192>
c000946b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000946e:	8b 00                	mov    (%eax),%eax
c0009470:	83 ec 08             	sub    $0x8,%esp
c0009473:	50                   	push   %eax
c0009474:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000947a:	50                   	push   %eax
c000947b:	e8 7f e9 ff ff       	call   c0007dff <atoi>
c0009480:	83 c4 10             	add    $0x10,%esp
c0009483:	83 ec 08             	sub    $0x8,%esp
c0009486:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000948c:	50                   	push   %eax
c000948d:	ff 75 f4             	pushl  -0xc(%ebp)
c0009490:	e8 35 26 00 00       	call   c000baca <Strcpy>
c0009495:	83 c4 10             	add    $0x10,%esp
c0009498:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000949c:	83 ec 0c             	sub    $0xc,%esp
c000949f:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094a5:	50                   	push   %eax
c00094a6:	e8 39 26 00 00       	call   c000bae4 <Strlen>
c00094ab:	83 c4 10             	add    $0x10,%esp
c00094ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094b4:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094b7:	eb 51                	jmp    c000950a <vsprintf+0x192>
c00094b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094bc:	8b 00                	mov    (%eax),%eax
c00094be:	83 ec 08             	sub    $0x8,%esp
c00094c1:	50                   	push   %eax
c00094c2:	ff 75 f4             	pushl  -0xc(%ebp)
c00094c5:	e8 00 26 00 00       	call   c000baca <Strcpy>
c00094ca:	83 c4 10             	add    $0x10,%esp
c00094cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094d0:	8b 00                	mov    (%eax),%eax
c00094d2:	83 ec 0c             	sub    $0xc,%esp
c00094d5:	50                   	push   %eax
c00094d6:	e8 09 26 00 00       	call   c000bae4 <Strlen>
c00094db:	83 c4 10             	add    $0x10,%esp
c00094de:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094e1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094e8:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094eb:	eb 1d                	jmp    c000950a <vsprintf+0x192>
c00094ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094f0:	0f b6 10             	movzbl (%eax),%edx
c00094f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094f6:	88 10                	mov    %dl,(%eax)
c00094f8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094fc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009503:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009506:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009509:	90                   	nop
c000950a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c000950e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009511:	0f b6 00             	movzbl (%eax),%eax
c0009514:	84 c0                	test   %al,%al
c0009516:	0f 85 9f fe ff ff    	jne    c00093bb <vsprintf+0x43>
c000951c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000951f:	2b 45 08             	sub    0x8(%ebp),%eax
c0009522:	c9                   	leave  
c0009523:	c3                   	ret    

c0009524 <printx>:
c0009524:	55                   	push   %ebp
c0009525:	89 e5                	mov    %esp,%ebp
c0009527:	81 ec 18 01 00 00    	sub    $0x118,%esp
c000952d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009530:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009533:	8b 45 08             	mov    0x8(%ebp),%eax
c0009536:	83 ec 04             	sub    $0x4,%esp
c0009539:	ff 75 f4             	pushl  -0xc(%ebp)
c000953c:	50                   	push   %eax
c000953d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009543:	50                   	push   %eax
c0009544:	e8 2f fe ff ff       	call   c0009378 <vsprintf>
c0009549:	83 c4 10             	add    $0x10,%esp
c000954c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000954f:	83 ec 08             	sub    $0x8,%esp
c0009552:	ff 75 f0             	pushl  -0x10(%ebp)
c0009555:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000955b:	50                   	push   %eax
c000955c:	e8 f7 93 ff ff       	call   c0002958 <write_debug>
c0009561:	83 c4 10             	add    $0x10,%esp
c0009564:	90                   	nop
c0009565:	c9                   	leave  
c0009566:	c3                   	ret    

c0009567 <sys_printx>:
c0009567:	55                   	push   %ebp
c0009568:	89 e5                	mov    %esp,%ebp
c000956a:	83 ec 28             	sub    $0x28,%esp
c000956d:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009572:	85 c0                	test   %eax,%eax
c0009574:	75 15                	jne    c000958b <sys_printx+0x24>
c0009576:	8b 45 10             	mov    0x10(%ebp),%eax
c0009579:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c000957f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009582:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009589:	eb 10                	jmp    c000959b <sys_printx+0x34>
c000958b:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009590:	85 c0                	test   %eax,%eax
c0009592:	74 07                	je     c000959b <sys_printx+0x34>
c0009594:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000959b:	8b 55 08             	mov    0x8(%ebp),%edx
c000959e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095a1:	01 d0                	add    %edx,%eax
c00095a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00095a6:	8b 45 10             	mov    0x10(%ebp),%eax
c00095a9:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00095af:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00095b5:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00095ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00095bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00095c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095c6:	0f b6 00             	movzbl (%eax),%eax
c00095c9:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00095cc:	eb 3a                	jmp    c0009608 <sys_printx+0xa1>
c00095ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095d1:	0f b6 00             	movzbl (%eax),%eax
c00095d4:	3c 3b                	cmp    $0x3b,%al
c00095d6:	74 0a                	je     c00095e2 <sys_printx+0x7b>
c00095d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095db:	0f b6 00             	movzbl (%eax),%eax
c00095de:	3c 3a                	cmp    $0x3a,%al
c00095e0:	75 06                	jne    c00095e8 <sys_printx+0x81>
c00095e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00095e6:	eb 20                	jmp    c0009608 <sys_printx+0xa1>
c00095e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095eb:	0f b6 00             	movzbl (%eax),%eax
c00095ee:	0f b6 c0             	movzbl %al,%eax
c00095f1:	83 ec 08             	sub    $0x8,%esp
c00095f4:	50                   	push   %eax
c00095f5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00095f8:	e8 5d be ff ff       	call   c000545a <out_char>
c00095fd:	83 c4 10             	add    $0x10,%esp
c0009600:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009604:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009608:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000960c:	7f c0                	jg     c00095ce <sys_printx+0x67>
c000960e:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009612:	75 10                	jne    c0009624 <sys_printx+0xbd>
c0009614:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009619:	85 c0                	test   %eax,%eax
c000961b:	74 13                	je     c0009630 <sys_printx+0xc9>
c000961d:	e8 a8 81 ff ff       	call   c00017ca <disable_int>
c0009622:	eb 0c                	jmp    c0009630 <sys_printx+0xc9>
c0009624:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009628:	75 06                	jne    c0009630 <sys_printx+0xc9>
c000962a:	e8 9b 81 ff ff       	call   c00017ca <disable_int>
c000962f:	90                   	nop
c0009630:	90                   	nop
c0009631:	c9                   	leave  
c0009632:	c3                   	ret    

c0009633 <spin>:
c0009633:	55                   	push   %ebp
c0009634:	89 e5                	mov    %esp,%ebp
c0009636:	83 ec 08             	sub    $0x8,%esp
c0009639:	83 ec 0c             	sub    $0xc,%esp
c000963c:	ff 75 08             	pushl  0x8(%ebp)
c000963f:	e8 48 7f ff ff       	call   c000158c <disp_str>
c0009644:	83 c4 10             	add    $0x10,%esp
c0009647:	83 ec 0c             	sub    $0xc,%esp
c000964a:	68 54 b3 00 c0       	push   $0xc000b354
c000964f:	e8 38 7f ff ff       	call   c000158c <disp_str>
c0009654:	83 c4 10             	add    $0x10,%esp
c0009657:	eb fe                	jmp    c0009657 <spin+0x24>

c0009659 <panic>:
c0009659:	55                   	push   %ebp
c000965a:	89 e5                	mov    %esp,%ebp
c000965c:	83 ec 08             	sub    $0x8,%esp
c000965f:	83 ec 04             	sub    $0x4,%esp
c0009662:	ff 75 08             	pushl  0x8(%ebp)
c0009665:	6a 3a                	push   $0x3a
c0009667:	68 f6 b7 00 c0       	push   $0xc000b7f6
c000966c:	e8 b3 fe ff ff       	call   c0009524 <printx>
c0009671:	83 c4 10             	add    $0x10,%esp
c0009674:	90                   	nop
c0009675:	c9                   	leave  
c0009676:	c3                   	ret    

c0009677 <assertion_failure>:
c0009677:	55                   	push   %ebp
c0009678:	89 e5                	mov    %esp,%ebp
c000967a:	83 ec 08             	sub    $0x8,%esp
c000967d:	83 ec 08             	sub    $0x8,%esp
c0009680:	ff 75 14             	pushl  0x14(%ebp)
c0009683:	ff 75 10             	pushl  0x10(%ebp)
c0009686:	ff 75 0c             	pushl  0xc(%ebp)
c0009689:	ff 75 08             	pushl  0x8(%ebp)
c000968c:	6a 3b                	push   $0x3b
c000968e:	68 fc b7 00 c0       	push   $0xc000b7fc
c0009693:	e8 8c fe ff ff       	call   c0009524 <printx>
c0009698:	83 c4 20             	add    $0x20,%esp
c000969b:	83 ec 0c             	sub    $0xc,%esp
c000969e:	68 2f b8 00 c0       	push   $0xc000b82f
c00096a3:	e8 8b ff ff ff       	call   c0009633 <spin>
c00096a8:	83 c4 10             	add    $0x10,%esp
c00096ab:	90                   	nop
c00096ac:	c9                   	leave  
c00096ad:	c3                   	ret    

c00096ae <dead_lock>:
c00096ae:	55                   	push   %ebp
c00096af:	89 e5                	mov    %esp,%ebp
c00096b1:	b8 00 00 00 00       	mov    $0x0,%eax
c00096b6:	5d                   	pop    %ebp
c00096b7:	c3                   	ret    

c00096b8 <sys_send_msg>:
c00096b8:	55                   	push   %ebp
c00096b9:	89 e5                	mov    %esp,%ebp
c00096bb:	83 ec 38             	sub    $0x38,%esp
c00096be:	83 ec 0c             	sub    $0xc,%esp
c00096c1:	ff 75 0c             	pushl  0xc(%ebp)
c00096c4:	e8 5e b7 ff ff       	call   c0004e27 <pid2proc>
c00096c9:	83 c4 10             	add    $0x10,%esp
c00096cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00096cf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00096d3:	75 22                	jne    c00096f7 <sys_send_msg+0x3f>
c00096d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00096d9:	75 1c                	jne    c00096f7 <sys_send_msg+0x3f>
c00096db:	68 97 05 00 00       	push   $0x597
c00096e0:	68 3b b8 00 c0       	push   $0xc000b83b
c00096e5:	68 3b b8 00 c0       	push   $0xc000b83b
c00096ea:	68 4b b8 00 c0       	push   $0xc000b84b
c00096ef:	e8 83 ff ff ff       	call   c0009677 <assertion_failure>
c00096f4:	83 c4 10             	add    $0x10,%esp
c00096f7:	83 ec 0c             	sub    $0xc,%esp
c00096fa:	ff 75 10             	pushl  0x10(%ebp)
c00096fd:	e8 97 b7 ff ff       	call   c0004e99 <proc2pid>
c0009702:	83 c4 10             	add    $0x10,%esp
c0009705:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009708:	8b 45 10             	mov    0x10(%ebp),%eax
c000970b:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009711:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009714:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000971b:	8b 45 08             	mov    0x8(%ebp),%eax
c000971e:	83 ec 08             	sub    $0x8,%esp
c0009721:	6a 6c                	push   $0x6c
c0009723:	50                   	push   %eax
c0009724:	e8 e8 d9 ff ff       	call   c0007111 <alloc_virtual_memory>
c0009729:	83 c4 10             	add    $0x10,%esp
c000972c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000972f:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009736:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009739:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000973c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000973f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009742:	89 10                	mov    %edx,(%eax)
c0009744:	83 ec 08             	sub    $0x8,%esp
c0009747:	ff 75 0c             	pushl  0xc(%ebp)
c000974a:	ff 75 e8             	pushl  -0x18(%ebp)
c000974d:	e8 5c ff ff ff       	call   c00096ae <dead_lock>
c0009752:	83 c4 10             	add    $0x10,%esp
c0009755:	83 f8 01             	cmp    $0x1,%eax
c0009758:	75 10                	jne    c000976a <sys_send_msg+0xb2>
c000975a:	83 ec 0c             	sub    $0xc,%esp
c000975d:	68 5b b8 00 c0       	push   $0xc000b85b
c0009762:	e8 f2 fe ff ff       	call   c0009659 <panic>
c0009767:	83 c4 10             	add    $0x10,%esp
c000976a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000976d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009774:	3c 02                	cmp    $0x2,%al
c0009776:	0f 85 99 01 00 00    	jne    c0009915 <sys_send_msg+0x25d>
c000977c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000977f:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009785:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009788:	74 12                	je     c000979c <sys_send_msg+0xe4>
c000978a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000978d:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009793:	83 f8 12             	cmp    $0x12,%eax
c0009796:	0f 85 79 01 00 00    	jne    c0009915 <sys_send_msg+0x25d>
c000979c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000979f:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00097a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00097a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097ab:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00097b1:	83 ec 08             	sub    $0x8,%esp
c00097b4:	6a 6c                	push   $0x6c
c00097b6:	50                   	push   %eax
c00097b7:	e8 55 d9 ff ff       	call   c0007111 <alloc_virtual_memory>
c00097bc:	83 c4 10             	add    $0x10,%esp
c00097bf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00097c2:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00097c5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00097c8:	83 ec 04             	sub    $0x4,%esp
c00097cb:	ff 75 d8             	pushl  -0x28(%ebp)
c00097ce:	52                   	push   %edx
c00097cf:	50                   	push   %eax
c00097d0:	e8 ed e3 ff ff       	call   c0007bc2 <Memcpy>
c00097d5:	83 c4 10             	add    $0x10,%esp
c00097d8:	8b 45 10             	mov    0x10(%ebp),%eax
c00097db:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00097e2:	00 00 00 
c00097e5:	8b 45 10             	mov    0x10(%ebp),%eax
c00097e8:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00097ef:	8b 45 10             	mov    0x10(%ebp),%eax
c00097f2:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00097f9:	00 00 00 
c00097fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097ff:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009806:	00 00 00 
c0009809:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000980c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009813:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009816:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000981d:	00 00 00 
c0009820:	8b 45 10             	mov    0x10(%ebp),%eax
c0009823:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000982a:	00 00 00 
c000982d:	83 ec 0c             	sub    $0xc,%esp
c0009830:	ff 75 ec             	pushl  -0x14(%ebp)
c0009833:	e8 e7 07 00 00       	call   c000a01f <unblock>
c0009838:	83 c4 10             	add    $0x10,%esp
c000983b:	8b 45 10             	mov    0x10(%ebp),%eax
c000983e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009845:	84 c0                	test   %al,%al
c0009847:	74 1c                	je     c0009865 <sys_send_msg+0x1ad>
c0009849:	68 c8 05 00 00       	push   $0x5c8
c000984e:	68 3b b8 00 c0       	push   $0xc000b83b
c0009853:	68 3b b8 00 c0       	push   $0xc000b83b
c0009858:	68 66 b8 00 c0       	push   $0xc000b866
c000985d:	e8 15 fe ff ff       	call   c0009677 <assertion_failure>
c0009862:	83 c4 10             	add    $0x10,%esp
c0009865:	8b 45 10             	mov    0x10(%ebp),%eax
c0009868:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000986e:	83 f8 21             	cmp    $0x21,%eax
c0009871:	74 1c                	je     c000988f <sys_send_msg+0x1d7>
c0009873:	68 c9 05 00 00       	push   $0x5c9
c0009878:	68 3b b8 00 c0       	push   $0xc000b83b
c000987d:	68 3b b8 00 c0       	push   $0xc000b83b
c0009882:	68 7a b8 00 c0       	push   $0xc000b87a
c0009887:	e8 eb fd ff ff       	call   c0009677 <assertion_failure>
c000988c:	83 c4 10             	add    $0x10,%esp
c000988f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009892:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009898:	85 c0                	test   %eax,%eax
c000989a:	74 1c                	je     c00098b8 <sys_send_msg+0x200>
c000989c:	68 cb 05 00 00       	push   $0x5cb
c00098a1:	68 3b b8 00 c0       	push   $0xc000b83b
c00098a6:	68 3b b8 00 c0       	push   $0xc000b83b
c00098ab:	68 97 b8 00 c0       	push   $0xc000b897
c00098b0:	e8 c2 fd ff ff       	call   c0009677 <assertion_failure>
c00098b5:	83 c4 10             	add    $0x10,%esp
c00098b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098bb:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00098c2:	84 c0                	test   %al,%al
c00098c4:	74 1c                	je     c00098e2 <sys_send_msg+0x22a>
c00098c6:	68 cc 05 00 00       	push   $0x5cc
c00098cb:	68 3b b8 00 c0       	push   $0xc000b83b
c00098d0:	68 3b b8 00 c0       	push   $0xc000b83b
c00098d5:	68 ac b8 00 c0       	push   $0xc000b8ac
c00098da:	e8 98 fd ff ff       	call   c0009677 <assertion_failure>
c00098df:	83 c4 10             	add    $0x10,%esp
c00098e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098e5:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00098eb:	83 f8 21             	cmp    $0x21,%eax
c00098ee:	0f 84 45 01 00 00    	je     c0009a39 <sys_send_msg+0x381>
c00098f4:	68 cd 05 00 00       	push   $0x5cd
c00098f9:	68 3b b8 00 c0       	push   $0xc000b83b
c00098fe:	68 3b b8 00 c0       	push   $0xc000b83b
c0009903:	68 c4 b8 00 c0       	push   $0xc000b8c4
c0009908:	e8 6a fd ff ff       	call   c0009677 <assertion_failure>
c000990d:	83 c4 10             	add    $0x10,%esp
c0009910:	e9 24 01 00 00       	jmp    c0009a39 <sys_send_msg+0x381>
c0009915:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000991c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000991f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009922:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009925:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000992b:	85 c0                	test   %eax,%eax
c000992d:	75 1b                	jne    c000994a <sys_send_msg+0x292>
c000992f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009932:	8b 55 10             	mov    0x10(%ebp),%edx
c0009935:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000993b:	8b 45 10             	mov    0x10(%ebp),%eax
c000993e:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009945:	00 00 00 
c0009948:	eb 3f                	jmp    c0009989 <sys_send_msg+0x2d1>
c000994a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000994d:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009953:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009956:	eb 12                	jmp    c000996a <sys_send_msg+0x2b2>
c0009958:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000995b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000995e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009961:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009967:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000996a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000996e:	75 e8                	jne    c0009958 <sys_send_msg+0x2a0>
c0009970:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009973:	8b 55 10             	mov    0x10(%ebp),%edx
c0009976:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000997c:	8b 45 10             	mov    0x10(%ebp),%eax
c000997f:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009986:	00 00 00 
c0009989:	8b 45 10             	mov    0x10(%ebp),%eax
c000998c:	8b 55 08             	mov    0x8(%ebp),%edx
c000998f:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009995:	8b 45 10             	mov    0x10(%ebp),%eax
c0009998:	8b 55 0c             	mov    0xc(%ebp),%edx
c000999b:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c00099a1:	8b 45 10             	mov    0x10(%ebp),%eax
c00099a4:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c00099ab:	8b 45 10             	mov    0x10(%ebp),%eax
c00099ae:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00099b5:	3c 01                	cmp    $0x1,%al
c00099b7:	74 1c                	je     c00099d5 <sys_send_msg+0x31d>
c00099b9:	68 ee 05 00 00       	push   $0x5ee
c00099be:	68 3b b8 00 c0       	push   $0xc000b83b
c00099c3:	68 3b b8 00 c0       	push   $0xc000b83b
c00099c8:	68 e8 b8 00 c0       	push   $0xc000b8e8
c00099cd:	e8 a5 fc ff ff       	call   c0009677 <assertion_failure>
c00099d2:	83 c4 10             	add    $0x10,%esp
c00099d5:	8b 45 10             	mov    0x10(%ebp),%eax
c00099d8:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00099de:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00099e1:	74 1c                	je     c00099ff <sys_send_msg+0x347>
c00099e3:	68 ef 05 00 00       	push   $0x5ef
c00099e8:	68 3b b8 00 c0       	push   $0xc000b83b
c00099ed:	68 3b b8 00 c0       	push   $0xc000b83b
c00099f2:	68 04 b9 00 c0       	push   $0xc000b904
c00099f7:	e8 7b fc ff ff       	call   c0009677 <assertion_failure>
c00099fc:	83 c4 10             	add    $0x10,%esp
c00099ff:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a02:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009a08:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009a0b:	74 1c                	je     c0009a29 <sys_send_msg+0x371>
c0009a0d:	68 f0 05 00 00       	push   $0x5f0
c0009a12:	68 3b b8 00 c0       	push   $0xc000b83b
c0009a17:	68 3b b8 00 c0       	push   $0xc000b83b
c0009a1c:	68 26 b9 00 c0       	push   $0xc000b926
c0009a21:	e8 51 fc ff ff       	call   c0009677 <assertion_failure>
c0009a26:	83 c4 10             	add    $0x10,%esp
c0009a29:	83 ec 0c             	sub    $0xc,%esp
c0009a2c:	ff 75 10             	pushl  0x10(%ebp)
c0009a2f:	e8 af 05 00 00       	call   c0009fe3 <block>
c0009a34:	83 c4 10             	add    $0x10,%esp
c0009a37:	eb 01                	jmp    c0009a3a <sys_send_msg+0x382>
c0009a39:	90                   	nop
c0009a3a:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a3f:	c9                   	leave  
c0009a40:	c3                   	ret    

c0009a41 <sys_receive_msg>:
c0009a41:	55                   	push   %ebp
c0009a42:	89 e5                	mov    %esp,%ebp
c0009a44:	83 ec 48             	sub    $0x48,%esp
c0009a47:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a4e:	83 ec 0c             	sub    $0xc,%esp
c0009a51:	ff 75 0c             	pushl  0xc(%ebp)
c0009a54:	e8 ce b3 ff ff       	call   c0004e27 <pid2proc>
c0009a59:	83 c4 10             	add    $0x10,%esp
c0009a5c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009a5f:	83 ec 0c             	sub    $0xc,%esp
c0009a62:	ff 75 10             	pushl  0x10(%ebp)
c0009a65:	e8 2f b4 ff ff       	call   c0004e99 <proc2pid>
c0009a6a:	83 c4 10             	add    $0x10,%esp
c0009a6d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009a70:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009a77:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a7a:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0009a80:	85 c0                	test   %eax,%eax
c0009a82:	0f 84 b5 00 00 00    	je     c0009b3d <sys_receive_msg+0xfc>
c0009a88:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009a8c:	74 0d                	je     c0009a9b <sys_receive_msg+0x5a>
c0009a8e:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0009a95:	0f 85 a2 00 00 00    	jne    c0009b3d <sys_receive_msg+0xfc>
c0009a9b:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c0009aa2:	83 ec 0c             	sub    $0xc,%esp
c0009aa5:	ff 75 dc             	pushl  -0x24(%ebp)
c0009aa8:	e8 07 8f ff ff       	call   c00029b4 <sys_malloc>
c0009aad:	83 c4 10             	add    $0x10,%esp
c0009ab0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009ab3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009ab6:	83 ec 04             	sub    $0x4,%esp
c0009ab9:	50                   	push   %eax
c0009aba:	6a 00                	push   $0x0
c0009abc:	ff 75 d8             	pushl  -0x28(%ebp)
c0009abf:	e8 e7 1f 00 00       	call   c000baab <Memset>
c0009ac4:	83 c4 10             	add    $0x10,%esp
c0009ac7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009aca:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009ad0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009ad3:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009ada:	8b 45 08             	mov    0x8(%ebp),%eax
c0009add:	83 ec 08             	sub    $0x8,%esp
c0009ae0:	ff 75 dc             	pushl  -0x24(%ebp)
c0009ae3:	50                   	push   %eax
c0009ae4:	e8 28 d6 ff ff       	call   c0007111 <alloc_virtual_memory>
c0009ae9:	83 c4 10             	add    $0x10,%esp
c0009aec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009aef:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009af2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009af5:	83 ec 04             	sub    $0x4,%esp
c0009af8:	52                   	push   %edx
c0009af9:	ff 75 d8             	pushl  -0x28(%ebp)
c0009afc:	50                   	push   %eax
c0009afd:	e8 c0 e0 ff ff       	call   c0007bc2 <Memcpy>
c0009b02:	83 c4 10             	add    $0x10,%esp
c0009b05:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b08:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009b0f:	00 00 00 
c0009b12:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b15:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009b1c:	00 00 00 
c0009b1f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b22:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009b29:	00 00 00 
c0009b2c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b2f:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009b36:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009b3d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009b41:	0f 84 96 03 00 00    	je     c0009edd <sys_receive_msg+0x49c>
c0009b47:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009b4b:	75 26                	jne    c0009b73 <sys_receive_msg+0x132>
c0009b4d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b50:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009b56:	85 c0                	test   %eax,%eax
c0009b58:	0f 84 8a 00 00 00    	je     c0009be8 <sys_receive_msg+0x1a7>
c0009b5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b61:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009b67:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b6a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009b71:	eb 75                	jmp    c0009be8 <sys_receive_msg+0x1a7>
c0009b73:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009b77:	78 6f                	js     c0009be8 <sys_receive_msg+0x1a7>
c0009b79:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0009b7d:	7f 69                	jg     c0009be8 <sys_receive_msg+0x1a7>
c0009b7f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009b82:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009b89:	3c 01                	cmp    $0x1,%al
c0009b8b:	75 5b                	jne    c0009be8 <sys_receive_msg+0x1a7>
c0009b8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009b90:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009b96:	83 f8 12             	cmp    $0x12,%eax
c0009b99:	74 0e                	je     c0009ba9 <sys_receive_msg+0x168>
c0009b9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009b9e:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009ba4:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009ba7:	75 3f                	jne    c0009be8 <sys_receive_msg+0x1a7>
c0009ba9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bac:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009bb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009bb5:	eb 2b                	jmp    c0009be2 <sys_receive_msg+0x1a1>
c0009bb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009bbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bc0:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009bc6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009bc9:	39 c2                	cmp    %eax,%edx
c0009bcb:	75 09                	jne    c0009bd6 <sys_receive_msg+0x195>
c0009bcd:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009bd4:	eb 12                	jmp    c0009be8 <sys_receive_msg+0x1a7>
c0009bd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bd9:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009bdf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009be2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009be6:	75 cf                	jne    c0009bb7 <sys_receive_msg+0x176>
c0009be8:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009bec:	0f 85 21 02 00 00    	jne    c0009e13 <sys_receive_msg+0x3d2>
c0009bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bf5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009bf8:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bfb:	83 ec 08             	sub    $0x8,%esp
c0009bfe:	6a 6c                	push   $0x6c
c0009c00:	50                   	push   %eax
c0009c01:	e8 0b d5 ff ff       	call   c0007111 <alloc_virtual_memory>
c0009c06:	83 c4 10             	add    $0x10,%esp
c0009c09:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009c0c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009c0f:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009c15:	83 ec 08             	sub    $0x8,%esp
c0009c18:	6a 6c                	push   $0x6c
c0009c1a:	50                   	push   %eax
c0009c1b:	e8 f1 d4 ff ff       	call   c0007111 <alloc_virtual_memory>
c0009c20:	83 c4 10             	add    $0x10,%esp
c0009c23:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009c26:	83 ec 04             	sub    $0x4,%esp
c0009c29:	6a 6c                	push   $0x6c
c0009c2b:	ff 75 c8             	pushl  -0x38(%ebp)
c0009c2e:	ff 75 cc             	pushl  -0x34(%ebp)
c0009c31:	e8 8c df ff ff       	call   c0007bc2 <Memcpy>
c0009c36:	83 c4 10             	add    $0x10,%esp
c0009c39:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009c3c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009c3f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c42:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c48:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009c4b:	75 21                	jne    c0009c6e <sys_receive_msg+0x22d>
c0009c4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c50:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009c56:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c59:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009c5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c62:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009c69:	00 00 00 
c0009c6c:	eb 1f                	jmp    c0009c8d <sys_receive_msg+0x24c>
c0009c6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c71:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009c77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009c7a:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009c80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c83:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009c8a:	00 00 00 
c0009c8d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009c90:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009c97:	00 00 00 
c0009c9a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009c9d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009ca4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009ca7:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009cae:	00 00 00 
c0009cb1:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cb4:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009cbb:	00 00 00 
c0009cbe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cc1:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009cc8:	00 00 00 
c0009ccb:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cce:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009cd5:	00 00 00 
c0009cd8:	83 ec 0c             	sub    $0xc,%esp
c0009cdb:	ff 75 d0             	pushl  -0x30(%ebp)
c0009cde:	e8 3c 03 00 00       	call   c000a01f <unblock>
c0009ce3:	83 c4 10             	add    $0x10,%esp
c0009ce6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009ce9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009cef:	85 c0                	test   %eax,%eax
c0009cf1:	74 1c                	je     c0009d0f <sys_receive_msg+0x2ce>
c0009cf3:	68 6b 06 00 00       	push   $0x66b
c0009cf8:	68 3b b8 00 c0       	push   $0xc000b83b
c0009cfd:	68 3b b8 00 c0       	push   $0xc000b83b
c0009d02:	68 3b b9 00 c0       	push   $0xc000b93b
c0009d07:	e8 6b f9 ff ff       	call   c0009677 <assertion_failure>
c0009d0c:	83 c4 10             	add    $0x10,%esp
c0009d0f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d12:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d19:	84 c0                	test   %al,%al
c0009d1b:	74 1c                	je     c0009d39 <sys_receive_msg+0x2f8>
c0009d1d:	68 6c 06 00 00       	push   $0x66c
c0009d22:	68 3b b8 00 c0       	push   $0xc000b83b
c0009d27:	68 3b b8 00 c0       	push   $0xc000b83b
c0009d2c:	68 53 b9 00 c0       	push   $0xc000b953
c0009d31:	e8 41 f9 ff ff       	call   c0009677 <assertion_failure>
c0009d36:	83 c4 10             	add    $0x10,%esp
c0009d39:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d3c:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d42:	83 f8 21             	cmp    $0x21,%eax
c0009d45:	74 1c                	je     c0009d63 <sys_receive_msg+0x322>
c0009d47:	68 6d 06 00 00       	push   $0x66d
c0009d4c:	68 3b b8 00 c0       	push   $0xc000b83b
c0009d51:	68 3b b8 00 c0       	push   $0xc000b83b
c0009d56:	68 6c b9 00 c0       	push   $0xc000b96c
c0009d5b:	e8 17 f9 ff ff       	call   c0009677 <assertion_failure>
c0009d60:	83 c4 10             	add    $0x10,%esp
c0009d63:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d66:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009d6c:	85 c0                	test   %eax,%eax
c0009d6e:	74 1c                	je     c0009d8c <sys_receive_msg+0x34b>
c0009d70:	68 6f 06 00 00       	push   $0x66f
c0009d75:	68 3b b8 00 c0       	push   $0xc000b83b
c0009d7a:	68 3b b8 00 c0       	push   $0xc000b83b
c0009d7f:	68 97 b8 00 c0       	push   $0xc000b897
c0009d84:	e8 ee f8 ff ff       	call   c0009677 <assertion_failure>
c0009d89:	83 c4 10             	add    $0x10,%esp
c0009d8c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d8f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d96:	84 c0                	test   %al,%al
c0009d98:	74 1c                	je     c0009db6 <sys_receive_msg+0x375>
c0009d9a:	68 70 06 00 00       	push   $0x670
c0009d9f:	68 3b b8 00 c0       	push   $0xc000b83b
c0009da4:	68 3b b8 00 c0       	push   $0xc000b83b
c0009da9:	68 ac b8 00 c0       	push   $0xc000b8ac
c0009dae:	e8 c4 f8 ff ff       	call   c0009677 <assertion_failure>
c0009db3:	83 c4 10             	add    $0x10,%esp
c0009db6:	8b 45 10             	mov    0x10(%ebp),%eax
c0009db9:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009dbf:	83 f8 21             	cmp    $0x21,%eax
c0009dc2:	74 1c                	je     c0009de0 <sys_receive_msg+0x39f>
c0009dc4:	68 71 06 00 00       	push   $0x671
c0009dc9:	68 3b b8 00 c0       	push   $0xc000b83b
c0009dce:	68 3b b8 00 c0       	push   $0xc000b83b
c0009dd3:	68 c4 b8 00 c0       	push   $0xc000b8c4
c0009dd8:	e8 9a f8 ff ff       	call   c0009677 <assertion_failure>
c0009ddd:	83 c4 10             	add    $0x10,%esp
c0009de0:	8b 45 10             	mov    0x10(%ebp),%eax
c0009de3:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009de9:	83 f8 21             	cmp    $0x21,%eax
c0009dec:	0f 84 e4 00 00 00    	je     c0009ed6 <sys_receive_msg+0x495>
c0009df2:	68 72 06 00 00       	push   $0x672
c0009df7:	68 3b b8 00 c0       	push   $0xc000b83b
c0009dfc:	68 3b b8 00 c0       	push   $0xc000b83b
c0009e01:	68 90 b9 00 c0       	push   $0xc000b990
c0009e06:	e8 6c f8 ff ff       	call   c0009677 <assertion_failure>
c0009e0b:	83 c4 10             	add    $0x10,%esp
c0009e0e:	e9 c3 00 00 00       	jmp    c0009ed6 <sys_receive_msg+0x495>
c0009e13:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e16:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009e1d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e20:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e27:	3c 02                	cmp    $0x2,%al
c0009e29:	74 1c                	je     c0009e47 <sys_receive_msg+0x406>
c0009e2b:	68 77 06 00 00       	push   $0x677
c0009e30:	68 3b b8 00 c0       	push   $0xc000b83b
c0009e35:	68 3b b8 00 c0       	push   $0xc000b83b
c0009e3a:	68 af b9 00 c0       	push   $0xc000b9af
c0009e3f:	e8 33 f8 ff ff       	call   c0009677 <assertion_failure>
c0009e44:	83 c4 10             	add    $0x10,%esp
c0009e47:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e4a:	8b 55 08             	mov    0x8(%ebp),%edx
c0009e4d:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009e53:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e56:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e5d:	3c 02                	cmp    $0x2,%al
c0009e5f:	74 1c                	je     c0009e7d <sys_receive_msg+0x43c>
c0009e61:	68 79 06 00 00       	push   $0x679
c0009e66:	68 3b b8 00 c0       	push   $0xc000b83b
c0009e6b:	68 3b b8 00 c0       	push   $0xc000b83b
c0009e70:	68 af b9 00 c0       	push   $0xc000b9af
c0009e75:	e8 fd f7 ff ff       	call   c0009677 <assertion_failure>
c0009e7a:	83 c4 10             	add    $0x10,%esp
c0009e7d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009e81:	75 0f                	jne    c0009e92 <sys_receive_msg+0x451>
c0009e83:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e86:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009e8d:	00 00 00 
c0009e90:	eb 0c                	jmp    c0009e9e <sys_receive_msg+0x45d>
c0009e92:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e95:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009e98:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009e9e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ea1:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ea8:	3c 02                	cmp    $0x2,%al
c0009eaa:	74 1c                	je     c0009ec8 <sys_receive_msg+0x487>
c0009eac:	68 84 06 00 00       	push   $0x684
c0009eb1:	68 3b b8 00 c0       	push   $0xc000b83b
c0009eb6:	68 3b b8 00 c0       	push   $0xc000b83b
c0009ebb:	68 af b9 00 c0       	push   $0xc000b9af
c0009ec0:	e8 b2 f7 ff ff       	call   c0009677 <assertion_failure>
c0009ec5:	83 c4 10             	add    $0x10,%esp
c0009ec8:	83 ec 0c             	sub    $0xc,%esp
c0009ecb:	ff 75 10             	pushl  0x10(%ebp)
c0009ece:	e8 10 01 00 00       	call   c0009fe3 <block>
c0009ed3:	83 c4 10             	add    $0x10,%esp
c0009ed6:	b8 00 00 00 00       	mov    $0x0,%eax
c0009edb:	eb 02                	jmp    c0009edf <sys_receive_msg+0x49e>
c0009edd:	90                   	nop
c0009ede:	90                   	nop
c0009edf:	c9                   	leave  
c0009ee0:	c3                   	ret    

c0009ee1 <disp_str_colour_debug>:
c0009ee1:	55                   	push   %ebp
c0009ee2:	89 e5                	mov    %esp,%ebp
c0009ee4:	90                   	nop
c0009ee5:	5d                   	pop    %ebp
c0009ee6:	c3                   	ret    

c0009ee7 <send_rec>:
c0009ee7:	55                   	push   %ebp
c0009ee8:	89 e5                	mov    %esp,%ebp
c0009eea:	83 ec 18             	sub    $0x18,%esp
c0009eed:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009ef0:	83 ec 0c             	sub    $0xc,%esp
c0009ef3:	50                   	push   %eax
c0009ef4:	e8 df d2 ff ff       	call   c00071d8 <get_physical_address>
c0009ef9:	83 c4 10             	add    $0x10,%esp
c0009efc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009eff:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009f03:	74 28                	je     c0009f2d <send_rec+0x46>
c0009f05:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f09:	74 22                	je     c0009f2d <send_rec+0x46>
c0009f0b:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009f0f:	74 1c                	je     c0009f2d <send_rec+0x46>
c0009f11:	68 a4 06 00 00       	push   $0x6a4
c0009f16:	68 3b b8 00 c0       	push   $0xc000b83b
c0009f1b:	68 3b b8 00 c0       	push   $0xc000b83b
c0009f20:	68 d0 b9 00 c0       	push   $0xc000b9d0
c0009f25:	e8 4d f7 ff ff       	call   c0009677 <assertion_failure>
c0009f2a:	83 c4 10             	add    $0x10,%esp
c0009f2d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f31:	75 12                	jne    c0009f45 <send_rec+0x5e>
c0009f33:	83 ec 04             	sub    $0x4,%esp
c0009f36:	6a 6c                	push   $0x6c
c0009f38:	6a 00                	push   $0x0
c0009f3a:	ff 75 0c             	pushl  0xc(%ebp)
c0009f3d:	e8 69 1b 00 00       	call   c000baab <Memset>
c0009f42:	83 c4 10             	add    $0x10,%esp
c0009f45:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009f49:	74 23                	je     c0009f6e <send_rec+0x87>
c0009f4b:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009f4f:	74 34                	je     c0009f85 <send_rec+0x9e>
c0009f51:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009f55:	75 72                	jne    c0009fc9 <send_rec+0xe2>
c0009f57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f5a:	83 ec 08             	sub    $0x8,%esp
c0009f5d:	ff 75 10             	pushl  0x10(%ebp)
c0009f60:	50                   	push   %eax
c0009f61:	e8 12 8a ff ff       	call   c0002978 <send_msg>
c0009f66:	83 c4 10             	add    $0x10,%esp
c0009f69:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f6c:	eb 6e                	jmp    c0009fdc <send_rec+0xf5>
c0009f6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f71:	83 ec 08             	sub    $0x8,%esp
c0009f74:	ff 75 10             	pushl  0x10(%ebp)
c0009f77:	50                   	push   %eax
c0009f78:	e8 21 8a ff ff       	call   c000299e <receive_msg>
c0009f7d:	83 c4 10             	add    $0x10,%esp
c0009f80:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f83:	eb 57                	jmp    c0009fdc <send_rec+0xf5>
c0009f85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f88:	83 ec 08             	sub    $0x8,%esp
c0009f8b:	ff 75 10             	pushl  0x10(%ebp)
c0009f8e:	50                   	push   %eax
c0009f8f:	e8 e4 89 ff ff       	call   c0002978 <send_msg>
c0009f94:	83 c4 10             	add    $0x10,%esp
c0009f97:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f9a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009f9e:	75 3b                	jne    c0009fdb <send_rec+0xf4>
c0009fa0:	83 ec 04             	sub    $0x4,%esp
c0009fa3:	6a 6c                	push   $0x6c
c0009fa5:	6a 00                	push   $0x0
c0009fa7:	ff 75 0c             	pushl  0xc(%ebp)
c0009faa:	e8 fc 1a 00 00       	call   c000baab <Memset>
c0009faf:	83 c4 10             	add    $0x10,%esp
c0009fb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fb5:	83 ec 08             	sub    $0x8,%esp
c0009fb8:	ff 75 10             	pushl  0x10(%ebp)
c0009fbb:	50                   	push   %eax
c0009fbc:	e8 dd 89 ff ff       	call   c000299e <receive_msg>
c0009fc1:	83 c4 10             	add    $0x10,%esp
c0009fc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009fc7:	eb 12                	jmp    c0009fdb <send_rec+0xf4>
c0009fc9:	83 ec 0c             	sub    $0xc,%esp
c0009fcc:	68 0c ba 00 c0       	push   $0xc000ba0c
c0009fd1:	e8 83 f6 ff ff       	call   c0009659 <panic>
c0009fd6:	83 c4 10             	add    $0x10,%esp
c0009fd9:	eb 01                	jmp    c0009fdc <send_rec+0xf5>
c0009fdb:	90                   	nop
c0009fdc:	b8 00 00 00 00       	mov    $0x0,%eax
c0009fe1:	c9                   	leave  
c0009fe2:	c3                   	ret    

c0009fe3 <block>:
c0009fe3:	55                   	push   %ebp
c0009fe4:	89 e5                	mov    %esp,%ebp
c0009fe6:	83 ec 08             	sub    $0x8,%esp
c0009fe9:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fec:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ff3:	84 c0                	test   %al,%al
c0009ff5:	75 1c                	jne    c000a013 <block+0x30>
c0009ff7:	68 d3 06 00 00       	push   $0x6d3
c0009ffc:	68 3b b8 00 c0       	push   $0xc000b83b
c000a001:	68 3b b8 00 c0       	push   $0xc000b83b
c000a006:	68 21 ba 00 c0       	push   $0xc000ba21
c000a00b:	e8 67 f6 ff ff       	call   c0009677 <assertion_failure>
c000a010:	83 c4 10             	add    $0x10,%esp
c000a013:	e8 c2 a9 ff ff       	call   c00049da <schedule_process>
c000a018:	b8 00 00 00 00       	mov    $0x0,%eax
c000a01d:	c9                   	leave  
c000a01e:	c3                   	ret    

c000a01f <unblock>:
c000a01f:	55                   	push   %ebp
c000a020:	89 e5                	mov    %esp,%ebp
c000a022:	83 ec 08             	sub    $0x8,%esp
c000a025:	8b 45 08             	mov    0x8(%ebp),%eax
c000a028:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a02f:	84 c0                	test   %al,%al
c000a031:	74 1c                	je     c000a04f <unblock+0x30>
c000a033:	68 dc 06 00 00       	push   $0x6dc
c000a038:	68 3b b8 00 c0       	push   $0xc000b83b
c000a03d:	68 3b b8 00 c0       	push   $0xc000b83b
c000a042:	68 39 ba 00 c0       	push   $0xc000ba39
c000a047:	e8 2b f6 ff ff       	call   c0009677 <assertion_failure>
c000a04c:	83 c4 10             	add    $0x10,%esp
c000a04f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a052:	05 00 01 00 00       	add    $0x100,%eax
c000a057:	83 ec 08             	sub    $0x8,%esp
c000a05a:	50                   	push   %eax
c000a05b:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a060:	e8 2b 0a 00 00       	call   c000aa90 <appendToDoubleLinkList>
c000a065:	83 c4 10             	add    $0x10,%esp
c000a068:	b8 00 00 00 00       	mov    $0x0,%eax
c000a06d:	c9                   	leave  
c000a06e:	c3                   	ret    

c000a06f <get_ticks_ipc>:
c000a06f:	55                   	push   %ebp
c000a070:	89 e5                	mov    %esp,%ebp
c000a072:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000a078:	83 ec 04             	sub    $0x4,%esp
c000a07b:	6a 6c                	push   $0x6c
c000a07d:	6a 00                	push   $0x0
c000a07f:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a082:	50                   	push   %eax
c000a083:	e8 23 1a 00 00       	call   c000baab <Memset>
c000a088:	83 c4 10             	add    $0x10,%esp
c000a08b:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000a092:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a099:	83 ec 04             	sub    $0x4,%esp
c000a09c:	6a 01                	push   $0x1
c000a09e:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a0a1:	50                   	push   %eax
c000a0a2:	6a 03                	push   $0x3
c000a0a4:	e8 3e fe ff ff       	call   c0009ee7 <send_rec>
c000a0a9:	83 c4 10             	add    $0x10,%esp
c000a0ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a0af:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000a0b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0b8:	c9                   	leave  
c000a0b9:	c3                   	ret    

c000a0ba <itoa>:
c000a0ba:	55                   	push   %ebp
c000a0bb:	89 e5                	mov    %esp,%ebp
c000a0bd:	53                   	push   %ebx
c000a0be:	83 ec 14             	sub    $0x14,%esp
c000a0c1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0c4:	99                   	cltd   
c000a0c5:	f7 7d 10             	idivl  0x10(%ebp)
c000a0c8:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a0cb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0ce:	99                   	cltd   
c000a0cf:	f7 7d 10             	idivl  0x10(%ebp)
c000a0d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a0d9:	74 14                	je     c000a0ef <itoa+0x35>
c000a0db:	83 ec 04             	sub    $0x4,%esp
c000a0de:	ff 75 10             	pushl  0x10(%ebp)
c000a0e1:	ff 75 0c             	pushl  0xc(%ebp)
c000a0e4:	ff 75 f0             	pushl  -0x10(%ebp)
c000a0e7:	e8 ce ff ff ff       	call   c000a0ba <itoa>
c000a0ec:	83 c4 10             	add    $0x10,%esp
c000a0ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0f2:	8d 58 30             	lea    0x30(%eax),%ebx
c000a0f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a0f8:	8b 00                	mov    (%eax),%eax
c000a0fa:	8d 48 01             	lea    0x1(%eax),%ecx
c000a0fd:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a100:	89 0a                	mov    %ecx,(%edx)
c000a102:	89 da                	mov    %ebx,%edx
c000a104:	88 10                	mov    %dl,(%eax)
c000a106:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a109:	8b 00                	mov    (%eax),%eax
c000a10b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a10e:	c9                   	leave  
c000a10f:	c3                   	ret    

c000a110 <i2a>:
c000a110:	55                   	push   %ebp
c000a111:	89 e5                	mov    %esp,%ebp
c000a113:	53                   	push   %ebx
c000a114:	83 ec 14             	sub    $0x14,%esp
c000a117:	8b 45 08             	mov    0x8(%ebp),%eax
c000a11a:	99                   	cltd   
c000a11b:	f7 7d 0c             	idivl  0xc(%ebp)
c000a11e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a121:	8b 45 08             	mov    0x8(%ebp),%eax
c000a124:	99                   	cltd   
c000a125:	f7 7d 0c             	idivl  0xc(%ebp)
c000a128:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a12b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a12f:	74 14                	je     c000a145 <i2a+0x35>
c000a131:	83 ec 04             	sub    $0x4,%esp
c000a134:	ff 75 10             	pushl  0x10(%ebp)
c000a137:	ff 75 0c             	pushl  0xc(%ebp)
c000a13a:	ff 75 f0             	pushl  -0x10(%ebp)
c000a13d:	e8 ce ff ff ff       	call   c000a110 <i2a>
c000a142:	83 c4 10             	add    $0x10,%esp
c000a145:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a149:	7f 0a                	jg     c000a155 <i2a+0x45>
c000a14b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a14e:	83 c0 30             	add    $0x30,%eax
c000a151:	89 c3                	mov    %eax,%ebx
c000a153:	eb 08                	jmp    c000a15d <i2a+0x4d>
c000a155:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a158:	83 c0 37             	add    $0x37,%eax
c000a15b:	89 c3                	mov    %eax,%ebx
c000a15d:	8b 45 10             	mov    0x10(%ebp),%eax
c000a160:	8b 00                	mov    (%eax),%eax
c000a162:	8d 48 01             	lea    0x1(%eax),%ecx
c000a165:	8b 55 10             	mov    0x10(%ebp),%edx
c000a168:	89 0a                	mov    %ecx,(%edx)
c000a16a:	88 18                	mov    %bl,(%eax)
c000a16c:	8b 45 10             	mov    0x10(%ebp),%eax
c000a16f:	8b 00                	mov    (%eax),%eax
c000a171:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a174:	c9                   	leave  
c000a175:	c3                   	ret    

c000a176 <inform_int>:
c000a176:	55                   	push   %ebp
c000a177:	89 e5                	mov    %esp,%ebp
c000a179:	83 ec 18             	sub    $0x18,%esp
c000a17c:	83 ec 0c             	sub    $0xc,%esp
c000a17f:	ff 75 08             	pushl  0x8(%ebp)
c000a182:	e8 a0 ac ff ff       	call   c0004e27 <pid2proc>
c000a187:	83 c4 10             	add    $0x10,%esp
c000a18a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a18d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a190:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a197:	0f be c0             	movsbl %al,%eax
c000a19a:	83 e0 02             	and    $0x2,%eax
c000a19d:	85 c0                	test   %eax,%eax
c000a19f:	0f 84 8e 00 00 00    	je     c000a233 <inform_int+0xbd>
c000a1a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1a8:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a1ae:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a1b3:	74 0e                	je     c000a1c3 <inform_int+0x4d>
c000a1b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1b8:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a1be:	83 f8 12             	cmp    $0x12,%eax
c000a1c1:	75 7d                	jne    c000a240 <inform_int+0xca>
c000a1c3:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c000a1ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1cd:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a1d3:	83 ec 08             	sub    $0x8,%esp
c000a1d6:	ff 75 f0             	pushl  -0x10(%ebp)
c000a1d9:	50                   	push   %eax
c000a1da:	e8 32 cf ff ff       	call   c0007111 <alloc_virtual_memory>
c000a1df:	83 c4 10             	add    $0x10,%esp
c000a1e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a1e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a1e8:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a1ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a1f1:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a1f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1fb:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a202:	00 00 00 
c000a205:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a208:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a20f:	00 00 00 
c000a212:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a219:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a21c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a223:	83 ec 0c             	sub    $0xc,%esp
c000a226:	ff 75 f4             	pushl  -0xc(%ebp)
c000a229:	e8 f1 fd ff ff       	call   c000a01f <unblock>
c000a22e:	83 c4 10             	add    $0x10,%esp
c000a231:	eb 0d                	jmp    c000a240 <inform_int+0xca>
c000a233:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a236:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a23d:	00 00 00 
c000a240:	90                   	nop
c000a241:	c9                   	leave  
c000a242:	c3                   	ret    

c000a243 <strcmp>:
c000a243:	55                   	push   %ebp
c000a244:	89 e5                	mov    %esp,%ebp
c000a246:	83 ec 10             	sub    $0x10,%esp
c000a249:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a24d:	74 06                	je     c000a255 <strcmp+0x12>
c000a24f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a253:	75 08                	jne    c000a25d <strcmp+0x1a>
c000a255:	8b 45 08             	mov    0x8(%ebp),%eax
c000a258:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a25b:	eb 53                	jmp    c000a2b0 <strcmp+0x6d>
c000a25d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a260:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a263:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a266:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a269:	eb 18                	jmp    c000a283 <strcmp+0x40>
c000a26b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a26e:	0f b6 10             	movzbl (%eax),%edx
c000a271:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a274:	0f b6 00             	movzbl (%eax),%eax
c000a277:	38 c2                	cmp    %al,%dl
c000a279:	75 1e                	jne    c000a299 <strcmp+0x56>
c000a27b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a27f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a283:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a286:	0f b6 00             	movzbl (%eax),%eax
c000a289:	84 c0                	test   %al,%al
c000a28b:	74 0d                	je     c000a29a <strcmp+0x57>
c000a28d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a290:	0f b6 00             	movzbl (%eax),%eax
c000a293:	84 c0                	test   %al,%al
c000a295:	75 d4                	jne    c000a26b <strcmp+0x28>
c000a297:	eb 01                	jmp    c000a29a <strcmp+0x57>
c000a299:	90                   	nop
c000a29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a29d:	0f b6 00             	movzbl (%eax),%eax
c000a2a0:	0f be d0             	movsbl %al,%edx
c000a2a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a2a6:	0f b6 00             	movzbl (%eax),%eax
c000a2a9:	0f be c0             	movsbl %al,%eax
c000a2ac:	29 c2                	sub    %eax,%edx
c000a2ae:	89 d0                	mov    %edx,%eax
c000a2b0:	c9                   	leave  
c000a2b1:	c3                   	ret    

c000a2b2 <create_user_process_address_space>:
c000a2b2:	55                   	push   %ebp
c000a2b3:	89 e5                	mov    %esp,%ebp
c000a2b5:	83 ec 18             	sub    $0x18,%esp
c000a2b8:	83 ec 08             	sub    $0x8,%esp
c000a2bb:	6a 00                	push   $0x0
c000a2bd:	6a 01                	push   $0x1
c000a2bf:	e8 fc cf ff ff       	call   c00072c0 <alloc_memory>
c000a2c4:	83 c4 10             	add    $0x10,%esp
c000a2c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a2ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2cd:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a2d4:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a2db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2de:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a2e3:	c1 e8 0c             	shr    $0xc,%eax
c000a2e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a2e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2ec:	83 c0 07             	add    $0x7,%eax
c000a2ef:	c1 e8 03             	shr    $0x3,%eax
c000a2f2:	89 c2                	mov    %eax,%edx
c000a2f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2f7:	89 50 04             	mov    %edx,0x4(%eax)
c000a2fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2fd:	8b 40 04             	mov    0x4(%eax),%eax
c000a300:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a305:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a30b:	85 c0                	test   %eax,%eax
c000a30d:	0f 48 c2             	cmovs  %edx,%eax
c000a310:	c1 f8 0c             	sar    $0xc,%eax
c000a313:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a316:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a319:	83 ec 08             	sub    $0x8,%esp
c000a31c:	6a 00                	push   $0x0
c000a31e:	50                   	push   %eax
c000a31f:	e8 9c cf ff ff       	call   c00072c0 <alloc_memory>
c000a324:	83 c4 10             	add    $0x10,%esp
c000a327:	89 c2                	mov    %eax,%edx
c000a329:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a32c:	89 10                	mov    %edx,(%eax)
c000a32e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a331:	83 ec 0c             	sub    $0xc,%esp
c000a334:	50                   	push   %eax
c000a335:	e8 74 c9 ff ff       	call   c0006cae <init_bitmap>
c000a33a:	83 c4 10             	add    $0x10,%esp
c000a33d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a340:	c9                   	leave  
c000a341:	c3                   	ret    

c000a342 <user_process>:
c000a342:	55                   	push   %ebp
c000a343:	89 e5                	mov    %esp,%ebp
c000a345:	83 ec 38             	sub    $0x38,%esp
c000a348:	c7 45 f4 b2 0c 00 00 	movl   $0xcb2,-0xc(%ebp)
c000a34f:	c7 45 f0 ba 0c 00 00 	movl   $0xcba,-0x10(%ebp)
c000a356:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c000a35d:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c000a363:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c000a369:	e8 3a 75 ff ff       	call   c00018a8 <get_running_thread_pcb>
c000a36e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a371:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a374:	05 00 10 00 00       	add    $0x1000,%eax
c000a379:	89 c2                	mov    %eax,%edx
c000a37b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a37e:	89 10                	mov    %edx,(%eax)
c000a380:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a383:	8b 00                	mov    (%eax),%eax
c000a385:	83 e8 44             	sub    $0x44,%eax
c000a388:	89 c2                	mov    %eax,%edx
c000a38a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a38d:	89 10                	mov    %edx,(%eax)
c000a38f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a392:	8b 00                	mov    (%eax),%eax
c000a394:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a397:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a39b:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a3a1:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a3a5:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a3a9:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a3ad:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a3b1:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a3b5:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a3b9:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a3bf:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c000a3c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3c6:	89 50 34             	mov    %edx,0x34(%eax)
c000a3c9:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3d0:	89 50 0c             	mov    %edx,0xc(%eax)
c000a3d3:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3d7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3da:	89 50 04             	mov    %edx,0x4(%eax)
c000a3dd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3e4:	89 50 08             	mov    %edx,0x8(%eax)
c000a3e7:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a3eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3ee:	89 50 40             	mov    %edx,0x40(%eax)
c000a3f1:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a3f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3f8:	89 10                	mov    %edx,(%eax)
c000a3fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3fd:	8b 55 08             	mov    0x8(%ebp),%edx
c000a400:	89 50 30             	mov    %edx,0x30(%eax)
c000a403:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a407:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a40a:	89 50 38             	mov    %edx,0x38(%eax)
c000a40d:	83 ec 08             	sub    $0x8,%esp
c000a410:	6a 01                	push   $0x1
c000a412:	68 00 f0 ff bf       	push   $0xbffff000
c000a417:	e8 ee cd ff ff       	call   c000720a <alloc_physical_memory>
c000a41c:	83 c4 10             	add    $0x10,%esp
c000a41f:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a425:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a428:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a42b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a42e:	83 ec 0c             	sub    $0xc,%esp
c000a431:	50                   	push   %eax
c000a432:	e8 44 73 ff ff       	call   c000177b <restart>
c000a437:	83 c4 10             	add    $0x10,%esp
c000a43a:	90                   	nop
c000a43b:	c9                   	leave  
c000a43c:	c3                   	ret    

c000a43d <clone_pcb>:
c000a43d:	55                   	push   %ebp
c000a43e:	89 e5                	mov    %esp,%ebp
c000a440:	83 ec 18             	sub    $0x18,%esp
c000a443:	83 ec 08             	sub    $0x8,%esp
c000a446:	6a 00                	push   $0x0
c000a448:	6a 01                	push   $0x1
c000a44a:	e8 71 ce ff ff       	call   c00072c0 <alloc_memory>
c000a44f:	83 c4 10             	add    $0x10,%esp
c000a452:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a455:	83 ec 04             	sub    $0x4,%esp
c000a458:	68 00 10 00 00       	push   $0x1000
c000a45d:	6a 00                	push   $0x0
c000a45f:	ff 75 f4             	pushl  -0xc(%ebp)
c000a462:	e8 44 16 00 00       	call   c000baab <Memset>
c000a467:	83 c4 10             	add    $0x10,%esp
c000a46a:	83 ec 04             	sub    $0x4,%esp
c000a46d:	68 00 10 00 00       	push   $0x1000
c000a472:	ff 75 08             	pushl  0x8(%ebp)
c000a475:	ff 75 f4             	pushl  -0xc(%ebp)
c000a478:	e8 45 d7 ff ff       	call   c0007bc2 <Memcpy>
c000a47d:	83 c4 10             	add    $0x10,%esp
c000a480:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000a485:	83 c0 01             	add    $0x1,%eax
c000a488:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000a48d:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000a493:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a496:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a49c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a49f:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000a4a5:	89 c2                	mov    %eax,%edx
c000a4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4aa:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a4b0:	83 ec 08             	sub    $0x8,%esp
c000a4b3:	6a 00                	push   $0x0
c000a4b5:	6a 01                	push   $0x1
c000a4b7:	e8 04 ce ff ff       	call   c00072c0 <alloc_memory>
c000a4bc:	83 c4 10             	add    $0x10,%esp
c000a4bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a4c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a4c5:	05 00 0c 00 00       	add    $0xc00,%eax
c000a4ca:	83 ec 04             	sub    $0x4,%esp
c000a4cd:	68 00 04 00 00       	push   $0x400
c000a4d2:	68 00 fc ff ff       	push   $0xfffffc00
c000a4d7:	50                   	push   %eax
c000a4d8:	e8 e5 d6 ff ff       	call   c0007bc2 <Memcpy>
c000a4dd:	83 c4 10             	add    $0x10,%esp
c000a4e0:	83 ec 0c             	sub    $0xc,%esp
c000a4e3:	ff 75 f0             	pushl  -0x10(%ebp)
c000a4e6:	e8 ed cc ff ff       	call   c00071d8 <get_physical_address>
c000a4eb:	83 c4 10             	add    $0x10,%esp
c000a4ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a4f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a4f4:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a4f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a4fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a4ff:	83 c8 07             	or     $0x7,%eax
c000a502:	89 c2                	mov    %eax,%edx
c000a504:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a507:	89 10                	mov    %edx,(%eax)
c000a509:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a50c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a50f:	89 50 08             	mov    %edx,0x8(%eax)
c000a512:	e8 9b fd ff ff       	call   c000a2b2 <create_user_process_address_space>
c000a517:	89 c2                	mov    %eax,%edx
c000a519:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a51c:	89 50 0c             	mov    %edx,0xc(%eax)
c000a51f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a522:	8b 40 0c             	mov    0xc(%eax),%eax
c000a525:	89 c2                	mov    %eax,%edx
c000a527:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a52a:	8b 40 0c             	mov    0xc(%eax),%eax
c000a52d:	83 ec 04             	sub    $0x4,%esp
c000a530:	6a 0c                	push   $0xc
c000a532:	52                   	push   %edx
c000a533:	50                   	push   %eax
c000a534:	e8 89 d6 ff ff       	call   c0007bc2 <Memcpy>
c000a539:	83 c4 10             	add    $0x10,%esp
c000a53c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a53f:	c9                   	leave  
c000a540:	c3                   	ret    

c000a541 <build_body_stack>:
c000a541:	55                   	push   %ebp
c000a542:	89 e5                	mov    %esp,%ebp
c000a544:	83 ec 48             	sub    $0x48,%esp
c000a547:	8b 45 08             	mov    0x8(%ebp),%eax
c000a54a:	8b 40 0c             	mov    0xc(%eax),%eax
c000a54d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a550:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a553:	8b 50 04             	mov    0x4(%eax),%edx
c000a556:	8b 00                	mov    (%eax),%eax
c000a558:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a55b:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000a55e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000a561:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a564:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a567:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a56a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a56d:	8b 40 08             	mov    0x8(%eax),%eax
c000a570:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a573:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a57a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a581:	e8 d8 d5 ff ff       	call   c0007b5e <intr_disable>
c000a586:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a589:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a590:	e9 c2 00 00 00       	jmp    c000a657 <build_body_stack+0x116>
c000a595:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a598:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a59b:	01 d0                	add    %edx,%eax
c000a59d:	0f b6 00             	movzbl (%eax),%eax
c000a5a0:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000a5a3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a5aa:	e9 9a 00 00 00       	jmp    c000a649 <build_body_stack+0x108>
c000a5af:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000a5b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a5b6:	89 c1                	mov    %eax,%ecx
c000a5b8:	d3 fa                	sar    %cl,%edx
c000a5ba:	89 d0                	mov    %edx,%eax
c000a5bc:	83 e0 01             	and    $0x1,%eax
c000a5bf:	85 c0                	test   %eax,%eax
c000a5c1:	75 06                	jne    c000a5c9 <build_body_stack+0x88>
c000a5c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a5c7:	eb 7c                	jmp    c000a645 <build_body_stack+0x104>
c000a5c9:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5cc:	8b 40 08             	mov    0x8(%eax),%eax
c000a5cf:	83 ec 0c             	sub    $0xc,%esp
c000a5d2:	50                   	push   %eax
c000a5d3:	e8 b2 72 ff ff       	call   c000188a <update_cr3>
c000a5d8:	83 c4 10             	add    $0x10,%esp
c000a5db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5de:	c1 e0 0c             	shl    $0xc,%eax
c000a5e1:	89 c2                	mov    %eax,%edx
c000a5e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a5e6:	01 d0                	add    %edx,%eax
c000a5e8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a5eb:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000a5ee:	8b 45 10             	mov    0x10(%ebp),%eax
c000a5f1:	83 ec 04             	sub    $0x4,%esp
c000a5f4:	68 00 10 00 00       	push   $0x1000
c000a5f9:	52                   	push   %edx
c000a5fa:	50                   	push   %eax
c000a5fb:	e8 c2 d5 ff ff       	call   c0007bc2 <Memcpy>
c000a600:	83 c4 10             	add    $0x10,%esp
c000a603:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a606:	8b 40 08             	mov    0x8(%eax),%eax
c000a609:	83 ec 0c             	sub    $0xc,%esp
c000a60c:	50                   	push   %eax
c000a60d:	e8 78 72 ff ff       	call   c000188a <update_cr3>
c000a612:	83 c4 10             	add    $0x10,%esp
c000a615:	83 ec 08             	sub    $0x8,%esp
c000a618:	ff 75 cc             	pushl  -0x34(%ebp)
c000a61b:	6a 01                	push   $0x1
c000a61d:	e8 00 cd ff ff       	call   c0007322 <get_a_virtual_page>
c000a622:	83 c4 10             	add    $0x10,%esp
c000a625:	8b 55 10             	mov    0x10(%ebp),%edx
c000a628:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a62b:	83 ec 04             	sub    $0x4,%esp
c000a62e:	68 00 10 00 00       	push   $0x1000
c000a633:	52                   	push   %edx
c000a634:	50                   	push   %eax
c000a635:	e8 88 d5 ff ff       	call   c0007bc2 <Memcpy>
c000a63a:	83 c4 10             	add    $0x10,%esp
c000a63d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a641:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a645:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a649:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a64d:	0f 8e 5c ff ff ff    	jle    c000a5af <build_body_stack+0x6e>
c000a653:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a657:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a65a:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a65d:	0f 87 32 ff ff ff    	ja     c000a595 <build_body_stack+0x54>
c000a663:	83 ec 0c             	sub    $0xc,%esp
c000a666:	ff 75 d4             	pushl  -0x2c(%ebp)
c000a669:	e8 19 d5 ff ff       	call   c0007b87 <intr_set_status>
c000a66e:	83 c4 10             	add    $0x10,%esp
c000a671:	90                   	nop
c000a672:	c9                   	leave  
c000a673:	c3                   	ret    

c000a674 <build_process_kernel_stack>:
c000a674:	55                   	push   %ebp
c000a675:	89 e5                	mov    %esp,%ebp
c000a677:	83 ec 28             	sub    $0x28,%esp
c000a67a:	e8 df d4 ff ff       	call   c0007b5e <intr_disable>
c000a67f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a682:	8b 45 08             	mov    0x8(%ebp),%eax
c000a685:	05 00 10 00 00       	add    $0x1000,%eax
c000a68a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a68d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a690:	8b 00                	mov    (%eax),%eax
c000a692:	83 f8 38             	cmp    $0x38,%eax
c000a695:	74 06                	je     c000a69d <build_process_kernel_stack+0x29>
c000a697:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000a69b:	eb f0                	jmp    c000a68d <build_process_kernel_stack+0x19>
c000a69d:	90                   	nop
c000a69e:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a6a4:	89 50 04             	mov    %edx,0x4(%eax)
c000a6a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6aa:	83 c0 2c             	add    $0x2c,%eax
c000a6ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a6b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b3:	83 e8 04             	sub    $0x4,%eax
c000a6b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a6b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6bc:	83 e8 08             	sub    $0x8,%eax
c000a6bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a6c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6c5:	83 e8 0c             	sub    $0xc,%eax
c000a6c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a6cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6ce:	83 e8 10             	sub    $0x10,%eax
c000a6d1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6d7:	83 e8 14             	sub    $0x14,%eax
c000a6da:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a6dd:	ba 5c 17 00 c0       	mov    $0xc000175c,%edx
c000a6e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a6e5:	89 10                	mov    %edx,(%eax)
c000a6e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a6ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a6f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a6f3:	8b 10                	mov    (%eax),%edx
c000a6f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a6f8:	89 10                	mov    %edx,(%eax)
c000a6fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a6fd:	8b 10                	mov    (%eax),%edx
c000a6ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a702:	89 10                	mov    %edx,(%eax)
c000a704:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a707:	8b 10                	mov    (%eax),%edx
c000a709:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a70c:	89 10                	mov    %edx,(%eax)
c000a70e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a711:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a717:	8b 45 08             	mov    0x8(%ebp),%eax
c000a71a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000a71d:	89 10                	mov    %edx,(%eax)
c000a71f:	83 ec 0c             	sub    $0xc,%esp
c000a722:	ff 75 f0             	pushl  -0x10(%ebp)
c000a725:	e8 5d d4 ff ff       	call   c0007b87 <intr_set_status>
c000a72a:	83 c4 10             	add    $0x10,%esp
c000a72d:	90                   	nop
c000a72e:	c9                   	leave  
c000a72f:	c3                   	ret    

c000a730 <fork_process>:
c000a730:	55                   	push   %ebp
c000a731:	89 e5                	mov    %esp,%ebp
c000a733:	83 ec 18             	sub    $0x18,%esp
c000a736:	8b 45 08             	mov    0x8(%ebp),%eax
c000a739:	83 ec 0c             	sub    $0xc,%esp
c000a73c:	50                   	push   %eax
c000a73d:	e8 e5 a6 ff ff       	call   c0004e27 <pid2proc>
c000a742:	83 c4 10             	add    $0x10,%esp
c000a745:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a748:	83 ec 0c             	sub    $0xc,%esp
c000a74b:	ff 75 f4             	pushl  -0xc(%ebp)
c000a74e:	e8 ea fc ff ff       	call   c000a43d <clone_pcb>
c000a753:	83 c4 10             	add    $0x10,%esp
c000a756:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a759:	83 ec 08             	sub    $0x8,%esp
c000a75c:	6a 00                	push   $0x0
c000a75e:	6a 01                	push   $0x1
c000a760:	e8 5b cb ff ff       	call   c00072c0 <alloc_memory>
c000a765:	83 c4 10             	add    $0x10,%esp
c000a768:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a76b:	83 ec 04             	sub    $0x4,%esp
c000a76e:	ff 75 ec             	pushl  -0x14(%ebp)
c000a771:	ff 75 f0             	pushl  -0x10(%ebp)
c000a774:	ff 75 f4             	pushl  -0xc(%ebp)
c000a777:	e8 c5 fd ff ff       	call   c000a541 <build_body_stack>
c000a77c:	83 c4 10             	add    $0x10,%esp
c000a77f:	83 ec 0c             	sub    $0xc,%esp
c000a782:	ff 75 f0             	pushl  -0x10(%ebp)
c000a785:	e8 ea fe ff ff       	call   c000a674 <build_process_kernel_stack>
c000a78a:	83 c4 10             	add    $0x10,%esp
c000a78d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a790:	05 00 01 00 00       	add    $0x100,%eax
c000a795:	83 ec 04             	sub    $0x4,%esp
c000a798:	6a 08                	push   $0x8
c000a79a:	6a 00                	push   $0x0
c000a79c:	50                   	push   %eax
c000a79d:	e8 09 13 00 00       	call   c000baab <Memset>
c000a7a2:	83 c4 10             	add    $0x10,%esp
c000a7a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7a8:	05 08 01 00 00       	add    $0x108,%eax
c000a7ad:	83 ec 04             	sub    $0x4,%esp
c000a7b0:	6a 08                	push   $0x8
c000a7b2:	6a 00                	push   $0x0
c000a7b4:	50                   	push   %eax
c000a7b5:	e8 f1 12 00 00       	call   c000baab <Memset>
c000a7ba:	83 c4 10             	add    $0x10,%esp
c000a7bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7c0:	05 08 01 00 00       	add    $0x108,%eax
c000a7c5:	83 ec 08             	sub    $0x8,%esp
c000a7c8:	50                   	push   %eax
c000a7c9:	68 04 1f 01 c0       	push   $0xc0011f04
c000a7ce:	e8 bd 02 00 00       	call   c000aa90 <appendToDoubleLinkList>
c000a7d3:	83 c4 10             	add    $0x10,%esp
c000a7d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7d9:	c9                   	leave  
c000a7da:	c3                   	ret    

c000a7db <process_execute>:
c000a7db:	55                   	push   %ebp
c000a7dc:	89 e5                	mov    %esp,%ebp
c000a7de:	83 ec 28             	sub    $0x28,%esp
c000a7e1:	e8 c0 04 00 00       	call   c000aca6 <thread_init>
c000a7e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a7e9:	83 ec 0c             	sub    $0xc,%esp
c000a7ec:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7ef:	e8 52 05 00 00       	call   c000ad46 <thread_create>
c000a7f4:	83 c4 10             	add    $0x10,%esp
c000a7f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7fa:	05 34 01 00 00       	add    $0x134,%eax
c000a7ff:	83 ec 08             	sub    $0x8,%esp
c000a802:	ff 75 10             	pushl  0x10(%ebp)
c000a805:	50                   	push   %eax
c000a806:	e8 bf 12 00 00       	call   c000baca <Strcpy>
c000a80b:	83 c4 10             	add    $0x10,%esp
c000a80e:	83 ec 08             	sub    $0x8,%esp
c000a811:	6a 00                	push   $0x0
c000a813:	6a 01                	push   $0x1
c000a815:	e8 a6 ca ff ff       	call   c00072c0 <alloc_memory>
c000a81a:	83 c4 10             	add    $0x10,%esp
c000a81d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a820:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a823:	05 00 0c 00 00       	add    $0xc00,%eax
c000a828:	83 ec 04             	sub    $0x4,%esp
c000a82b:	68 00 04 00 00       	push   $0x400
c000a830:	68 00 fc ff ff       	push   $0xfffffc00
c000a835:	50                   	push   %eax
c000a836:	e8 87 d3 ff ff       	call   c0007bc2 <Memcpy>
c000a83b:	83 c4 10             	add    $0x10,%esp
c000a83e:	83 ec 0c             	sub    $0xc,%esp
c000a841:	ff 75 f0             	pushl  -0x10(%ebp)
c000a844:	e8 8f c9 ff ff       	call   c00071d8 <get_physical_address>
c000a849:	83 c4 10             	add    $0x10,%esp
c000a84c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a84f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a852:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a857:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a85a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a85d:	83 c8 07             	or     $0x7,%eax
c000a860:	89 c2                	mov    %eax,%edx
c000a862:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a865:	89 10                	mov    %edx,(%eax)
c000a867:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a86a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a86d:	89 50 08             	mov    %edx,0x8(%eax)
c000a870:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a873:	83 c0 10             	add    $0x10,%eax
c000a876:	83 ec 0c             	sub    $0xc,%esp
c000a879:	50                   	push   %eax
c000a87a:	e8 25 ce ff ff       	call   c00076a4 <init_memory_block_desc>
c000a87f:	83 c4 10             	add    $0x10,%esp
c000a882:	e8 2b fa ff ff       	call   c000a2b2 <create_user_process_address_space>
c000a887:	89 c2                	mov    %eax,%edx
c000a889:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a88c:	89 50 0c             	mov    %edx,0xc(%eax)
c000a88f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a892:	8b 00                	mov    (%eax),%eax
c000a894:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a897:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a89a:	c7 40 10 42 a3 00 c0 	movl   $0xc000a342,0x10(%eax)
c000a8a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8a4:	8b 55 08             	mov    0x8(%ebp),%edx
c000a8a7:	89 50 18             	mov    %edx,0x18(%eax)
c000a8aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8ad:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a8b0:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a8b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a8b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8b9:	89 50 20             	mov    %edx,0x20(%eax)
c000a8bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8bf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a8c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8c8:	8b 10                	mov    (%eax),%edx
c000a8ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8cd:	89 50 04             	mov    %edx,0x4(%eax)
c000a8d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8d3:	8b 50 04             	mov    0x4(%eax),%edx
c000a8d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8d9:	89 50 08             	mov    %edx,0x8(%eax)
c000a8dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8df:	8b 50 08             	mov    0x8(%eax),%edx
c000a8e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8e5:	89 50 0c             	mov    %edx,0xc(%eax)
c000a8e8:	83 ec 0c             	sub    $0xc,%esp
c000a8eb:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a8f0:	e8 9e 00 00 00       	call   c000a993 <isListEmpty>
c000a8f5:	83 c4 10             	add    $0x10,%esp
c000a8f8:	e8 61 d2 ff ff       	call   c0007b5e <intr_disable>
c000a8fd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a900:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a903:	05 00 01 00 00       	add    $0x100,%eax
c000a908:	83 ec 08             	sub    $0x8,%esp
c000a90b:	50                   	push   %eax
c000a90c:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a911:	e8 7a 01 00 00       	call   c000aa90 <appendToDoubleLinkList>
c000a916:	83 c4 10             	add    $0x10,%esp
c000a919:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a91c:	05 08 01 00 00       	add    $0x108,%eax
c000a921:	83 ec 08             	sub    $0x8,%esp
c000a924:	50                   	push   %eax
c000a925:	68 04 1f 01 c0       	push   $0xc0011f04
c000a92a:	e8 61 01 00 00       	call   c000aa90 <appendToDoubleLinkList>
c000a92f:	83 c4 10             	add    $0x10,%esp
c000a932:	83 ec 0c             	sub    $0xc,%esp
c000a935:	ff 75 e0             	pushl  -0x20(%ebp)
c000a938:	e8 4a d2 ff ff       	call   c0007b87 <intr_set_status>
c000a93d:	83 c4 10             	add    $0x10,%esp
c000a940:	90                   	nop
c000a941:	c9                   	leave  
c000a942:	c3                   	ret    
c000a943:	66 90                	xchg   %ax,%ax
c000a945:	66 90                	xchg   %ax,%ax
c000a947:	66 90                	xchg   %ax,%ax
c000a949:	66 90                	xchg   %ax,%ax
c000a94b:	66 90                	xchg   %ax,%ax
c000a94d:	66 90                	xchg   %ax,%ax
c000a94f:	90                   	nop

c000a950 <switch_to>:
c000a950:	56                   	push   %esi
c000a951:	57                   	push   %edi
c000a952:	53                   	push   %ebx
c000a953:	55                   	push   %ebp
c000a954:	89 e5                	mov    %esp,%ebp
c000a956:	8b 45 14             	mov    0x14(%ebp),%eax
c000a959:	89 20                	mov    %esp,(%eax)
c000a95b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a95e:	8b 20                	mov    (%eax),%esp
c000a960:	5d                   	pop    %ebp
c000a961:	5b                   	pop    %ebx
c000a962:	5f                   	pop    %edi
c000a963:	5e                   	pop    %esi
c000a964:	c3                   	ret    

c000a965 <initDoubleLinkList>:
c000a965:	55                   	push   %ebp
c000a966:	89 e5                	mov    %esp,%ebp
c000a968:	8b 45 08             	mov    0x8(%ebp),%eax
c000a96b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a971:	8b 45 08             	mov    0x8(%ebp),%eax
c000a974:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a97b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a97e:	8d 50 08             	lea    0x8(%eax),%edx
c000a981:	8b 45 08             	mov    0x8(%ebp),%eax
c000a984:	89 50 04             	mov    %edx,0x4(%eax)
c000a987:	8b 55 08             	mov    0x8(%ebp),%edx
c000a98a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a98d:	89 50 08             	mov    %edx,0x8(%eax)
c000a990:	90                   	nop
c000a991:	5d                   	pop    %ebp
c000a992:	c3                   	ret    

c000a993 <isListEmpty>:
c000a993:	55                   	push   %ebp
c000a994:	89 e5                	mov    %esp,%ebp
c000a996:	8b 45 08             	mov    0x8(%ebp),%eax
c000a999:	8b 40 04             	mov    0x4(%eax),%eax
c000a99c:	8b 55 08             	mov    0x8(%ebp),%edx
c000a99f:	83 c2 08             	add    $0x8,%edx
c000a9a2:	39 d0                	cmp    %edx,%eax
c000a9a4:	75 07                	jne    c000a9ad <isListEmpty+0x1a>
c000a9a6:	b8 01 00 00 00       	mov    $0x1,%eax
c000a9ab:	eb 05                	jmp    c000a9b2 <isListEmpty+0x1f>
c000a9ad:	b8 00 00 00 00       	mov    $0x0,%eax
c000a9b2:	5d                   	pop    %ebp
c000a9b3:	c3                   	ret    

c000a9b4 <findElementInList>:
c000a9b4:	55                   	push   %ebp
c000a9b5:	89 e5                	mov    %esp,%ebp
c000a9b7:	83 ec 28             	sub    $0x28,%esp
c000a9ba:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a9be:	75 19                	jne    c000a9d9 <findElementInList+0x25>
c000a9c0:	6a 60                	push   $0x60
c000a9c2:	68 51 ba 00 c0       	push   $0xc000ba51
c000a9c7:	68 51 ba 00 c0       	push   $0xc000ba51
c000a9cc:	68 64 ba 00 c0       	push   $0xc000ba64
c000a9d1:	e8 a1 ec ff ff       	call   c0009677 <assertion_failure>
c000a9d6:	83 c4 10             	add    $0x10,%esp
c000a9d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a9dd:	75 19                	jne    c000a9f8 <findElementInList+0x44>
c000a9df:	6a 61                	push   $0x61
c000a9e1:	68 51 ba 00 c0       	push   $0xc000ba51
c000a9e6:	68 51 ba 00 c0       	push   $0xc000ba51
c000a9eb:	68 70 ba 00 c0       	push   $0xc000ba70
c000a9f0:	e8 82 ec ff ff       	call   c0009677 <assertion_failure>
c000a9f5:	83 c4 10             	add    $0x10,%esp
c000a9f8:	e8 61 d1 ff ff       	call   c0007b5e <intr_disable>
c000a9fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aa00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000aa07:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa0a:	8b 40 08             	mov    0x8(%eax),%eax
c000aa0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aa10:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa13:	8b 40 04             	mov    0x4(%eax),%eax
c000aa16:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa19:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa1d:	75 07                	jne    c000aa26 <findElementInList+0x72>
c000aa1f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa24:	eb 68                	jmp    c000aa8e <findElementInList+0xda>
c000aa26:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aa29:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aa2f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000aa32:	c1 f8 03             	sar    $0x3,%eax
c000aa35:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aa38:	eb 36                	jmp    c000aa70 <findElementInList+0xbc>
c000aa3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa3d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000aa40:	75 07                	jne    c000aa49 <findElementInList+0x95>
c000aa42:	b8 01 00 00 00       	mov    $0x1,%eax
c000aa47:	eb 45                	jmp    c000aa8e <findElementInList+0xda>
c000aa49:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa4d:	75 07                	jne    c000aa56 <findElementInList+0xa2>
c000aa4f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa54:	eb 38                	jmp    c000aa8e <findElementInList+0xda>
c000aa56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aa59:	8b 40 04             	mov    0x4(%eax),%eax
c000aa5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa5f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa63:	75 07                	jne    c000aa6c <findElementInList+0xb8>
c000aa65:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa6a:	eb 22                	jmp    c000aa8e <findElementInList+0xda>
c000aa6c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000aa70:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa73:	83 c0 08             	add    $0x8,%eax
c000aa76:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000aa79:	75 bf                	jne    c000aa3a <findElementInList+0x86>
c000aa7b:	83 ec 0c             	sub    $0xc,%esp
c000aa7e:	ff 75 ec             	pushl  -0x14(%ebp)
c000aa81:	e8 01 d1 ff ff       	call   c0007b87 <intr_set_status>
c000aa86:	83 c4 10             	add    $0x10,%esp
c000aa89:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa8e:	c9                   	leave  
c000aa8f:	c3                   	ret    

c000aa90 <appendToDoubleLinkList>:
c000aa90:	55                   	push   %ebp
c000aa91:	89 e5                	mov    %esp,%ebp
c000aa93:	83 ec 18             	sub    $0x18,%esp
c000aa96:	83 ec 08             	sub    $0x8,%esp
c000aa99:	ff 75 0c             	pushl  0xc(%ebp)
c000aa9c:	ff 75 08             	pushl  0x8(%ebp)
c000aa9f:	e8 10 ff ff ff       	call   c000a9b4 <findElementInList>
c000aaa4:	83 c4 10             	add    $0x10,%esp
c000aaa7:	3c 01                	cmp    $0x1,%al
c000aaa9:	0f 84 c2 00 00 00    	je     c000ab71 <appendToDoubleLinkList+0xe1>
c000aaaf:	e8 aa d0 ff ff       	call   c0007b5e <intr_disable>
c000aab4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000aab7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000aabb:	75 1c                	jne    c000aad9 <appendToDoubleLinkList+0x49>
c000aabd:	68 9e 00 00 00       	push   $0x9e
c000aac2:	68 51 ba 00 c0       	push   $0xc000ba51
c000aac7:	68 51 ba 00 c0       	push   $0xc000ba51
c000aacc:	68 64 ba 00 c0       	push   $0xc000ba64
c000aad1:	e8 a1 eb ff ff       	call   c0009677 <assertion_failure>
c000aad6:	83 c4 10             	add    $0x10,%esp
c000aad9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000aadd:	75 1c                	jne    c000aafb <appendToDoubleLinkList+0x6b>
c000aadf:	68 9f 00 00 00       	push   $0x9f
c000aae4:	68 51 ba 00 c0       	push   $0xc000ba51
c000aae9:	68 51 ba 00 c0       	push   $0xc000ba51
c000aaee:	68 70 ba 00 c0       	push   $0xc000ba70
c000aaf3:	e8 7f eb ff ff       	call   c0009677 <assertion_failure>
c000aaf8:	83 c4 10             	add    $0x10,%esp
c000aafb:	83 ec 08             	sub    $0x8,%esp
c000aafe:	ff 75 0c             	pushl  0xc(%ebp)
c000ab01:	ff 75 08             	pushl  0x8(%ebp)
c000ab04:	e8 ab fe ff ff       	call   c000a9b4 <findElementInList>
c000ab09:	83 c4 10             	add    $0x10,%esp
c000ab0c:	3c 01                	cmp    $0x1,%al
c000ab0e:	74 64                	je     c000ab74 <appendToDoubleLinkList+0xe4>
c000ab10:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ab13:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ab16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab19:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ab20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab23:	8b 50 04             	mov    0x4(%eax),%edx
c000ab26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab29:	89 10                	mov    %edx,(%eax)
c000ab2b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab2e:	8b 50 08             	mov    0x8(%eax),%edx
c000ab31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab34:	89 10                	mov    %edx,(%eax)
c000ab36:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab39:	8b 40 08             	mov    0x8(%eax),%eax
c000ab3c:	85 c0                	test   %eax,%eax
c000ab3e:	74 0c                	je     c000ab4c <appendToDoubleLinkList+0xbc>
c000ab40:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab43:	8b 40 08             	mov    0x8(%eax),%eax
c000ab46:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ab49:	89 50 04             	mov    %edx,0x4(%eax)
c000ab4c:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab4f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ab52:	89 50 08             	mov    %edx,0x8(%eax)
c000ab55:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab58:	8d 50 08             	lea    0x8(%eax),%edx
c000ab5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab5e:	89 50 04             	mov    %edx,0x4(%eax)
c000ab61:	83 ec 0c             	sub    $0xc,%esp
c000ab64:	ff 75 f4             	pushl  -0xc(%ebp)
c000ab67:	e8 1b d0 ff ff       	call   c0007b87 <intr_set_status>
c000ab6c:	83 c4 10             	add    $0x10,%esp
c000ab6f:	eb 04                	jmp    c000ab75 <appendToDoubleLinkList+0xe5>
c000ab71:	90                   	nop
c000ab72:	eb 01                	jmp    c000ab75 <appendToDoubleLinkList+0xe5>
c000ab74:	90                   	nop
c000ab75:	c9                   	leave  
c000ab76:	c3                   	ret    

c000ab77 <insertToDoubleLinkList>:
c000ab77:	55                   	push   %ebp
c000ab78:	89 e5                	mov    %esp,%ebp
c000ab7a:	83 ec 18             	sub    $0x18,%esp
c000ab7d:	83 ec 08             	sub    $0x8,%esp
c000ab80:	ff 75 0c             	pushl  0xc(%ebp)
c000ab83:	ff 75 08             	pushl  0x8(%ebp)
c000ab86:	e8 29 fe ff ff       	call   c000a9b4 <findElementInList>
c000ab8b:	83 c4 10             	add    $0x10,%esp
c000ab8e:	3c 01                	cmp    $0x1,%al
c000ab90:	74 65                	je     c000abf7 <insertToDoubleLinkList+0x80>
c000ab92:	e8 c7 cf ff ff       	call   c0007b5e <intr_disable>
c000ab97:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ab9a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ab9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aba0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aba3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000abaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abad:	8b 50 04             	mov    0x4(%eax),%edx
c000abb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abb3:	89 10                	mov    %edx,(%eax)
c000abb5:	8b 45 08             	mov    0x8(%ebp),%eax
c000abb8:	8b 50 04             	mov    0x4(%eax),%edx
c000abbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abbe:	89 50 04             	mov    %edx,0x4(%eax)
c000abc1:	8b 45 08             	mov    0x8(%ebp),%eax
c000abc4:	8b 40 04             	mov    0x4(%eax),%eax
c000abc7:	85 c0                	test   %eax,%eax
c000abc9:	74 0b                	je     c000abd6 <insertToDoubleLinkList+0x5f>
c000abcb:	8b 45 08             	mov    0x8(%ebp),%eax
c000abce:	8b 40 04             	mov    0x4(%eax),%eax
c000abd1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000abd4:	89 10                	mov    %edx,(%eax)
c000abd6:	8b 45 08             	mov    0x8(%ebp),%eax
c000abd9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000abdc:	89 50 04             	mov    %edx,0x4(%eax)
c000abdf:	8b 55 08             	mov    0x8(%ebp),%edx
c000abe2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abe5:	89 10                	mov    %edx,(%eax)
c000abe7:	83 ec 0c             	sub    $0xc,%esp
c000abea:	ff 75 f4             	pushl  -0xc(%ebp)
c000abed:	e8 95 cf ff ff       	call   c0007b87 <intr_set_status>
c000abf2:	83 c4 10             	add    $0x10,%esp
c000abf5:	eb 01                	jmp    c000abf8 <insertToDoubleLinkList+0x81>
c000abf7:	90                   	nop
c000abf8:	c9                   	leave  
c000abf9:	c3                   	ret    

c000abfa <popFromDoubleLinkList>:
c000abfa:	55                   	push   %ebp
c000abfb:	89 e5                	mov    %esp,%ebp
c000abfd:	83 ec 18             	sub    $0x18,%esp
c000ac00:	e8 59 cf ff ff       	call   c0007b5e <intr_disable>
c000ac05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac08:	83 ec 0c             	sub    $0xc,%esp
c000ac0b:	ff 75 08             	pushl  0x8(%ebp)
c000ac0e:	e8 80 fd ff ff       	call   c000a993 <isListEmpty>
c000ac13:	83 c4 10             	add    $0x10,%esp
c000ac16:	3c 01                	cmp    $0x1,%al
c000ac18:	75 07                	jne    c000ac21 <popFromDoubleLinkList+0x27>
c000ac1a:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac1f:	eb 6b                	jmp    c000ac8c <popFromDoubleLinkList+0x92>
c000ac21:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac24:	8b 40 08             	mov    0x8(%eax),%eax
c000ac27:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac2a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac2d:	8b 40 08             	mov    0x8(%eax),%eax
c000ac30:	85 c0                	test   %eax,%eax
c000ac32:	75 07                	jne    c000ac3b <popFromDoubleLinkList+0x41>
c000ac34:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac39:	eb 51                	jmp    c000ac8c <popFromDoubleLinkList+0x92>
c000ac3b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac3e:	8b 40 08             	mov    0x8(%eax),%eax
c000ac41:	8b 00                	mov    (%eax),%eax
c000ac43:	85 c0                	test   %eax,%eax
c000ac45:	74 11                	je     c000ac58 <popFromDoubleLinkList+0x5e>
c000ac47:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac4a:	8b 40 08             	mov    0x8(%eax),%eax
c000ac4d:	8b 00                	mov    (%eax),%eax
c000ac4f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ac52:	83 c2 08             	add    $0x8,%edx
c000ac55:	89 50 04             	mov    %edx,0x4(%eax)
c000ac58:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac5b:	8b 40 08             	mov    0x8(%eax),%eax
c000ac5e:	8b 10                	mov    (%eax),%edx
c000ac60:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac63:	89 50 08             	mov    %edx,0x8(%eax)
c000ac66:	83 ec 0c             	sub    $0xc,%esp
c000ac69:	ff 75 f4             	pushl  -0xc(%ebp)
c000ac6c:	e8 16 cf ff ff       	call   c0007b87 <intr_set_status>
c000ac71:	83 c4 10             	add    $0x10,%esp
c000ac74:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac77:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ac7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac81:	8b 50 04             	mov    0x4(%eax),%edx
c000ac84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac87:	89 10                	mov    %edx,(%eax)
c000ac89:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac8c:	c9                   	leave  
c000ac8d:	c3                   	ret    

c000ac8e <kernel_thread>:
c000ac8e:	55                   	push   %ebp
c000ac8f:	89 e5                	mov    %esp,%ebp
c000ac91:	83 ec 08             	sub    $0x8,%esp
c000ac94:	fb                   	sti    
c000ac95:	83 ec 0c             	sub    $0xc,%esp
c000ac98:	ff 75 0c             	pushl  0xc(%ebp)
c000ac9b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac9e:	ff d0                	call   *%eax
c000aca0:	83 c4 10             	add    $0x10,%esp
c000aca3:	90                   	nop
c000aca4:	c9                   	leave  
c000aca5:	c3                   	ret    

c000aca6 <thread_init>:
c000aca6:	55                   	push   %ebp
c000aca7:	89 e5                	mov    %esp,%ebp
c000aca9:	83 ec 18             	sub    $0x18,%esp
c000acac:	83 ec 08             	sub    $0x8,%esp
c000acaf:	6a 00                	push   $0x0
c000acb1:	6a 01                	push   $0x1
c000acb3:	e8 08 c6 ff ff       	call   c00072c0 <alloc_memory>
c000acb8:	83 c4 10             	add    $0x10,%esp
c000acbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000acbe:	83 ec 04             	sub    $0x4,%esp
c000acc1:	68 00 10 00 00       	push   $0x1000
c000acc6:	6a 00                	push   $0x0
c000acc8:	ff 75 f4             	pushl  -0xc(%ebp)
c000accb:	e8 db 0d 00 00       	call   c000baab <Memset>
c000acd0:	83 c4 10             	add    $0x10,%esp
c000acd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acd6:	05 00 10 00 00       	add    $0x1000,%eax
c000acdb:	89 c2                	mov    %eax,%edx
c000acdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ace0:	89 10                	mov    %edx,(%eax)
c000ace2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ace5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000acec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acef:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000acf6:	ff ff ff 
c000acf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acfc:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000ad03:	00 00 00 
c000ad06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad09:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000ad0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad12:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000ad18:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000ad1d:	83 c0 01             	add    $0x1,%eax
c000ad20:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000ad25:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000ad2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad2e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000ad34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad37:	c7 80 28 01 00 00 05 	movl   $0x5,0x128(%eax)
c000ad3e:	00 00 00 
c000ad41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad44:	c9                   	leave  
c000ad45:	c3                   	ret    

c000ad46 <thread_create>:
c000ad46:	55                   	push   %ebp
c000ad47:	89 e5                	mov    %esp,%ebp
c000ad49:	83 ec 10             	sub    $0x10,%esp
c000ad4c:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000ad53:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000ad5a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad5d:	8b 00                	mov    (%eax),%eax
c000ad5f:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000ad62:	89 c2                	mov    %eax,%edx
c000ad64:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad67:	89 10                	mov    %edx,(%eax)
c000ad69:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad6c:	8b 00                	mov    (%eax),%eax
c000ad6e:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000ad71:	89 c2                	mov    %eax,%edx
c000ad73:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad76:	89 10                	mov    %edx,(%eax)
c000ad78:	90                   	nop
c000ad79:	c9                   	leave  
c000ad7a:	c3                   	ret    

c000ad7b <thread_start>:
c000ad7b:	55                   	push   %ebp
c000ad7c:	89 e5                	mov    %esp,%ebp
c000ad7e:	83 ec 18             	sub    $0x18,%esp
c000ad81:	e8 20 ff ff ff       	call   c000aca6 <thread_init>
c000ad86:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad89:	83 ec 0c             	sub    $0xc,%esp
c000ad8c:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad8f:	e8 b2 ff ff ff       	call   c000ad46 <thread_create>
c000ad94:	83 c4 10             	add    $0x10,%esp
c000ad97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad9a:	05 34 01 00 00       	add    $0x134,%eax
c000ad9f:	83 ec 08             	sub    $0x8,%esp
c000ada2:	ff 75 10             	pushl  0x10(%ebp)
c000ada5:	50                   	push   %eax
c000ada6:	e8 1f 0d 00 00       	call   c000baca <Strcpy>
c000adab:	83 c4 10             	add    $0x10,%esp
c000adae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adb1:	8b 00                	mov    (%eax),%eax
c000adb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000adb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adb9:	c7 40 10 8e ac 00 c0 	movl   $0xc000ac8e,0x10(%eax)
c000adc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adc3:	8b 55 08             	mov    0x8(%ebp),%edx
c000adc6:	89 50 18             	mov    %edx,0x18(%eax)
c000adc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adcc:	8b 55 0c             	mov    0xc(%ebp),%edx
c000adcf:	89 50 1c             	mov    %edx,0x1c(%eax)
c000add2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000add5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000addb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adde:	8b 10                	mov    (%eax),%edx
c000ade0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ade3:	89 50 04             	mov    %edx,0x4(%eax)
c000ade6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ade9:	8b 50 04             	mov    0x4(%eax),%edx
c000adec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adef:	89 50 08             	mov    %edx,0x8(%eax)
c000adf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adf5:	8b 50 08             	mov    0x8(%eax),%edx
c000adf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adfb:	89 50 0c             	mov    %edx,0xc(%eax)
c000adfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae01:	05 00 01 00 00       	add    $0x100,%eax
c000ae06:	83 ec 08             	sub    $0x8,%esp
c000ae09:	50                   	push   %eax
c000ae0a:	68 ec 0d 01 c0       	push   $0xc0010dec
c000ae0f:	e8 7c fc ff ff       	call   c000aa90 <appendToDoubleLinkList>
c000ae14:	83 c4 10             	add    $0x10,%esp
c000ae17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae1a:	05 08 01 00 00       	add    $0x108,%eax
c000ae1f:	83 ec 08             	sub    $0x8,%esp
c000ae22:	50                   	push   %eax
c000ae23:	68 04 1f 01 c0       	push   $0xc0011f04
c000ae28:	e8 63 fc ff ff       	call   c000aa90 <appendToDoubleLinkList>
c000ae2d:	83 c4 10             	add    $0x10,%esp
c000ae30:	90                   	nop
c000ae31:	c9                   	leave  
c000ae32:	c3                   	ret    
