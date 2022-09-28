
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	66 c7 05 80 f7 00 c0 	movw   $0x0,0xc000f780
c000151c:	00 00 
c000151e:	0f 01 05 e8 16 01 c0 	sgdtl  0xc00116e8
c0001525:	e8 6f 38 00 00       	call   c0004d99 <ReloadGDT>
c000152a:	0f 01 15 e8 16 01 c0 	lgdtl  0xc00116e8
c0001531:	0f 01 1d 68 f7 00 c0 	lidtl  0xc000f768
c0001538:	0f a8                	push   %gs
c000153a:	0f a9                	pop    %gs
c000153c:	ea 43 15 00 c0 08 00 	ljmp   $0x8,$0xc0001543

c0001543 <csinit>:
c0001543:	31 c0                	xor    %eax,%eax
c0001545:	66 b8 40 00          	mov    $0x40,%ax
c0001549:	0f 00 d8             	ltr    %ax
c000154c:	31 c0                	xor    %eax,%eax
c000154e:	e9 5b 03 00 00       	jmp    c00018ae <kernel_main>
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
c000156a:	e8 b0 6b 00 00       	call   c000811f <test>
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
c0001594:	8b 3d 80 f7 00 c0    	mov    0xc000f780,%edi

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
c00015bd:	89 3d 80 f7 00 c0    	mov    %edi,0xc000f780
c00015c3:	89 ec                	mov    %ebp,%esp
c00015c5:	5d                   	pop    %ebp
c00015c6:	c3                   	ret    

c00015c7 <disp_str_colour>:
c00015c7:	55                   	push   %ebp
c00015c8:	89 e5                	mov    %esp,%ebp
c00015ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00015cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00015d0:	8b 3d 80 f7 00 c0    	mov    0xc000f780,%edi

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
c00015f9:	89 3d 80 f7 00 c0    	mov    %edi,0xc000f780
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
c0001661:	e8 d2 65 00 00       	call   c0007c38 <exception_handler>
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
c000167e:	ff 05 84 f7 00 c0    	incl   0xc000f784
c0001684:	83 3d 84 f7 00 c0 00 	cmpl   $0x0,0xc000f784
c000168b:	75 00                	jne    c000168d <hwint0.1>

c000168d <hwint0.1>:
c000168d:	e8 85 33 00 00       	call   c0004a17 <clock_handler>
c0001692:	e9 f5 00 00 00       	jmp    c000178c <reenter_restore>

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
c00016af:	ff 05 84 f7 00 c0    	incl   0xc000f784
c00016b5:	83 3d 84 f7 00 c0 00 	cmpl   $0x0,0xc000f784
c00016bc:	75 00                	jne    c00016be <hwint1.1>

c00016be <hwint1.1>:
c00016be:	e8 10 42 00 00       	call   c00058d3 <keyboard_handler>
c00016c3:	b0 f8                	mov    $0xf8,%al
c00016c5:	e6 21                	out    %al,$0x21
c00016c7:	83 3d 84 f7 00 c0 00 	cmpl   $0x0,0xc000f784
c00016ce:	0f 85 b8 00 00 00    	jne    c000178c <reenter_restore>
c00016d4:	e9 b3 00 00 00       	jmp    c000178c <reenter_restore>

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
c00016f4:	ff 05 84 f7 00 c0    	incl   0xc000f784
c00016fa:	83 3d 84 f7 00 c0 00 	cmpl   $0x0,0xc000f784
c0001701:	75 00                	jne    c0001703 <hwint14.1>

c0001703 <hwint14.1>:
c0001703:	e8 49 0f 00 00       	call   c0002651 <hd_handler>
c0001708:	b0 bf                	mov    $0xbf,%al
c000170a:	e6 a1                	out    %al,$0xa1
c000170c:	83 3d 84 f7 00 c0 00 	cmpl   $0x0,0xc000f784
c0001713:	75 77                	jne    c000178c <reenter_restore>
c0001715:	eb 75                	jmp    c000178c <reenter_restore>

c0001717 <sys_call>:
c0001717:	60                   	pusha  
c0001718:	1e                   	push   %ds
c0001719:	06                   	push   %es
c000171a:	0f a0                	push   %fs
c000171c:	0f a8                	push   %gs
c000171e:	89 e6                	mov    %esp,%esi
c0001720:	66 8c d2             	mov    %ss,%dx
c0001723:	8e da                	mov    %edx,%ds
c0001725:	8e c2                	mov    %edx,%es
c0001727:	8e e2                	mov    %edx,%fs
c0001729:	ff 05 84 f7 00 c0    	incl   0xc000f784
c000172f:	83 3d 84 f7 00 c0 00 	cmpl   $0x0,0xc000f784
c0001736:	75 00                	jne    c0001738 <sys_call.1>

c0001738 <sys_call.1>:
c0001738:	56                   	push   %esi
c0001739:	ff 35 a0 fb 00 c0    	pushl  0xc000fba0
c000173f:	53                   	push   %ebx
c0001740:	51                   	push   %ecx
c0001741:	ff 14 85 2c e1 00 c0 	call   *-0x3fff1ed4(,%eax,4)
c0001748:	83 c4 0c             	add    $0xc,%esp
c000174b:	5e                   	pop    %esi
c000174c:	89 46 2c             	mov    %eax,0x2c(%esi)
c000174f:	83 3d 84 f7 00 c0 00 	cmpl   $0x0,0xc000f784
c0001756:	75 34                	jne    c000178c <reenter_restore>
c0001758:	eb 32                	jmp    c000178c <reenter_restore>

c000175a <fork_restart>:
c000175a:	fa                   	cli    
c000175b:	89 e0                	mov    %esp,%eax
c000175d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0001762:	83 ec 14             	sub    $0x14,%esp
c0001765:	83 c0 04             	add    $0x4,%eax
c0001768:	50                   	push   %eax
c0001769:	e8 27 01 00 00       	call   c0001895 <update_tss>
c000176e:	83 c4 18             	add    $0x18,%esp
c0001771:	0f a9                	pop    %gs
c0001773:	0f a1                	pop    %fs
c0001775:	07                   	pop    %es
c0001776:	1f                   	pop    %ds
c0001777:	61                   	popa   
c0001778:	cf                   	iret   

c0001779 <restart>:
c0001779:	ff 0d 84 f7 00 c0    	decl   0xc000f784
c000177f:	89 e5                	mov    %esp,%ebp
c0001781:	8b 65 04             	mov    0x4(%ebp),%esp
c0001784:	0f a9                	pop    %gs
c0001786:	0f a1                	pop    %fs
c0001788:	07                   	pop    %es
c0001789:	1f                   	pop    %ds
c000178a:	61                   	popa   
c000178b:	cf                   	iret   

c000178c <reenter_restore>:
c000178c:	ff 0d 84 f7 00 c0    	decl   0xc000f784
c0001792:	0f a9                	pop    %gs
c0001794:	0f a1                	pop    %fs
c0001796:	07                   	pop    %es
c0001797:	1f                   	pop    %ds
c0001798:	61                   	popa   
c0001799:	cf                   	iret   

c000179a <in_byte>:
c000179a:	31 d2                	xor    %edx,%edx
c000179c:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017a0:	31 c0                	xor    %eax,%eax
c00017a2:	ec                   	in     (%dx),%al
c00017a3:	90                   	nop
c00017a4:	90                   	nop
c00017a5:	c3                   	ret    

c00017a6 <out_byte>:
c00017a6:	31 d2                	xor    %edx,%edx
c00017a8:	31 c0                	xor    %eax,%eax
c00017aa:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017ae:	8a 44 24 08          	mov    0x8(%esp),%al
c00017b2:	ee                   	out    %al,(%dx)
c00017b3:	90                   	nop
c00017b4:	90                   	nop
c00017b5:	c3                   	ret    

c00017b6 <in_byte2>:
c00017b6:	55                   	push   %ebp
c00017b7:	89 e5                	mov    %esp,%ebp
c00017b9:	52                   	push   %edx
c00017ba:	31 d2                	xor    %edx,%edx
c00017bc:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017c0:	31 c0                	xor    %eax,%eax
c00017c2:	ec                   	in     (%dx),%al
c00017c3:	90                   	nop
c00017c4:	90                   	nop
c00017c5:	5b                   	pop    %ebx
c00017c6:	5d                   	pop    %ebp
c00017c7:	c3                   	ret    

c00017c8 <disable_int>:
c00017c8:	fa                   	cli    
c00017c9:	c3                   	ret    

c00017ca <enable_int>:
c00017ca:	fb                   	sti    
c00017cb:	c3                   	ret    

c00017cc <check_tss_esp0>:
c00017cc:	55                   	push   %ebp
c00017cd:	89 e5                	mov    %esp,%ebp
c00017cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00017d2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017d5:	83 c0 44             	add    $0x44,%eax
c00017d8:	8b 15 64 16 01 c0    	mov    0xc0011664,%edx
c00017de:	39 d0                	cmp    %edx,%eax
c00017e0:	74 7c                	je     c000185e <check_tss_esp0.2>

c00017e2 <check_tss_esp0.1>:
c00017e2:	50                   	push   %eax
c00017e3:	52                   	push   %edx
c00017e4:	68 10 e0 00 c0       	push   $0xc000e010
c00017e9:	e8 9e fd ff ff       	call   c000158c <disp_str>
c00017ee:	83 c4 04             	add    $0x4,%esp
c00017f1:	5a                   	pop    %edx
c00017f2:	58                   	pop    %eax
c00017f3:	52                   	push   %edx
c00017f4:	50                   	push   %eax
c00017f5:	53                   	push   %ebx
c00017f6:	e8 d7 62 00 00       	call   c0007ad2 <disp_int>
c00017fb:	83 c4 04             	add    $0x4,%esp
c00017fe:	58                   	pop    %eax
c00017ff:	5a                   	pop    %edx
c0001800:	52                   	push   %edx
c0001801:	50                   	push   %eax
c0001802:	e8 cb 62 00 00       	call   c0007ad2 <disp_int>
c0001807:	58                   	pop    %eax
c0001808:	5a                   	pop    %edx
c0001809:	52                   	push   %edx
c000180a:	50                   	push   %eax
c000180b:	ff 35 84 f7 00 c0    	pushl  0xc000f784
c0001811:	e8 bc 62 00 00       	call   c0007ad2 <disp_int>
c0001816:	83 c4 04             	add    $0x4,%esp
c0001819:	58                   	pop    %eax
c000181a:	5a                   	pop    %edx
c000181b:	52                   	push   %edx
c000181c:	50                   	push   %eax
c000181d:	ff 72 ec             	pushl  -0x14(%edx)
c0001820:	e8 ad 62 00 00       	call   c0007ad2 <disp_int>
c0001825:	83 c4 04             	add    $0x4,%esp
c0001828:	58                   	pop    %eax
c0001829:	5a                   	pop    %edx
c000182a:	52                   	push   %edx
c000182b:	50                   	push   %eax
c000182c:	ff 70 ec             	pushl  -0x14(%eax)
c000182f:	e8 9e 62 00 00       	call   c0007ad2 <disp_int>
c0001834:	83 c4 04             	add    $0x4,%esp
c0001837:	58                   	pop    %eax
c0001838:	5a                   	pop    %edx
c0001839:	52                   	push   %edx
c000183a:	50                   	push   %eax
c000183b:	ff 35 a0 fb 00 c0    	pushl  0xc000fba0
c0001841:	e8 8c 62 00 00       	call   c0007ad2 <disp_int>
c0001846:	83 c4 04             	add    $0x4,%esp
c0001849:	58                   	pop    %eax
c000184a:	5a                   	pop    %edx
c000184b:	52                   	push   %edx
c000184c:	50                   	push   %eax
c000184d:	68 40 f7 00 c0       	push   $0xc000f740
c0001852:	e8 7b 62 00 00       	call   c0007ad2 <disp_int>
c0001857:	83 c4 04             	add    $0x4,%esp
c000185a:	58                   	pop    %eax
c000185b:	5a                   	pop    %edx
c000185c:	5d                   	pop    %ebp
c000185d:	c3                   	ret    

c000185e <check_tss_esp0.2>:
c000185e:	5d                   	pop    %ebp
c000185f:	c3                   	ret    

c0001860 <enable_8259A_casecade_irq>:
c0001860:	9c                   	pushf  
c0001861:	fa                   	cli    
c0001862:	e4 21                	in     $0x21,%al
c0001864:	24 fb                	and    $0xfb,%al
c0001866:	e6 21                	out    %al,$0x21
c0001868:	9d                   	popf   
c0001869:	c3                   	ret    

c000186a <disable_8259A_casecade_irq>:
c000186a:	9c                   	pushf  
c000186b:	fa                   	cli    
c000186c:	e4 21                	in     $0x21,%al
c000186e:	0c 04                	or     $0x4,%al
c0001870:	e6 21                	out    %al,$0x21
c0001872:	9c                   	pushf  
c0001873:	c3                   	ret    

c0001874 <enable_8259A_slave_winchester_irq>:
c0001874:	9c                   	pushf  
c0001875:	fa                   	cli    
c0001876:	e4 a1                	in     $0xa1,%al
c0001878:	24 bf                	and    $0xbf,%al
c000187a:	e6 a1                	out    %al,$0xa1
c000187c:	9d                   	popf   
c000187d:	c3                   	ret    

c000187e <disable_8259A_slave_winchester_irq>:
c000187e:	9c                   	pushf  
c000187f:	fa                   	cli    
c0001880:	e4 a1                	in     $0xa1,%al
c0001882:	0c 40                	or     $0x40,%al
c0001884:	e6 a1                	out    %al,$0xa1
c0001886:	9d                   	popf   
c0001887:	c3                   	ret    

c0001888 <update_cr3>:
c0001888:	55                   	push   %ebp
c0001889:	89 e5                	mov    %esp,%ebp
c000188b:	8b 45 08             	mov    0x8(%ebp),%eax
c000188e:	0f 22 d8             	mov    %eax,%cr3
c0001891:	89 ec                	mov    %ebp,%esp
c0001893:	5d                   	pop    %ebp
c0001894:	c3                   	ret    

c0001895 <update_tss>:
c0001895:	55                   	push   %ebp
c0001896:	89 e5                	mov    %esp,%ebp
c0001898:	8b 45 08             	mov    0x8(%ebp),%eax
c000189b:	8b 00                	mov    (%eax),%eax
c000189d:	a3 64 16 01 c0       	mov    %eax,0xc0011664
c00018a2:	89 ec                	mov    %ebp,%esp
c00018a4:	5d                   	pop    %ebp
c00018a5:	c3                   	ret    

c00018a6 <get_running_thread_pcb>:
c00018a6:	89 e0                	mov    %esp,%eax
c00018a8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00018ad:	c3                   	ret    

c00018ae <kernel_main>:
c00018ae:	55                   	push   %ebp
c00018af:	89 e5                	mov    %esp,%ebp
c00018b1:	83 ec 08             	sub    $0x8,%esp
c00018b4:	e8 95 00 00 00       	call   c000194e <init>
c00018b9:	83 ec 04             	sub    $0x4,%esp
c00018bc:	68 00 a9 00 c0       	push   $0xc000a900
c00018c1:	68 0a a9 00 c0       	push   $0xc000a90a
c00018c6:	68 a0 1a 00 c0       	push   $0xc0001aa0
c00018cb:	e8 82 8b 00 00       	call   c000a452 <process_execute>
c00018d0:	83 c4 10             	add    $0x10,%esp
c00018d3:	83 ec 04             	sub    $0x4,%esp
c00018d6:	68 17 a9 00 c0       	push   $0xc000a917
c00018db:	68 1f a9 00 c0       	push   $0xc000a91f
c00018e0:	68 d0 57 00 c0       	push   $0xc00057d0
c00018e5:	e8 68 8b 00 00       	call   c000a452 <process_execute>
c00018ea:	83 c4 10             	add    $0x10,%esp
c00018ed:	83 ec 04             	sub    $0x4,%esp
c00018f0:	68 29 a9 00 c0       	push   $0xc000a929
c00018f5:	68 30 a9 00 c0       	push   $0xc000a930
c00018fa:	68 d5 1a 00 c0       	push   $0xc0001ad5
c00018ff:	e8 4e 8b 00 00       	call   c000a452 <process_execute>
c0001904:	83 c4 10             	add    $0x10,%esp
c0001907:	83 ec 04             	sub    $0x4,%esp
c000190a:	68 39 a9 00 c0       	push   $0xc000a939
c000190f:	68 41 a9 00 c0       	push   $0xc000a941
c0001914:	68 64 28 00 c0       	push   $0xc0002864
c0001919:	e8 34 8b 00 00       	call   c000a452 <process_execute>
c000191e:	83 c4 10             	add    $0x10,%esp
c0001921:	83 ec 04             	sub    $0x4,%esp
c0001924:	68 4a a9 00 c0       	push   $0xc000a94a
c0001929:	68 51 a9 00 c0       	push   $0xc000a951
c000192e:	68 ca 61 00 c0       	push   $0xc00061ca
c0001933:	e8 1a 8b 00 00       	call   c000a452 <process_execute>
c0001938:	83 c4 10             	add    $0x10,%esp
c000193b:	83 ec 0c             	sub    $0xc,%esp
c000193e:	68 5a a9 00 c0       	push   $0xc000a95a
c0001943:	e8 44 fc ff ff       	call   c000158c <disp_str>
c0001948:	83 c4 10             	add    $0x10,%esp
c000194b:	fb                   	sti    
c000194c:	eb fe                	jmp    c000194c <kernel_main+0x9e>

c000194e <init>:
c000194e:	55                   	push   %ebp
c000194f:	89 e5                	mov    %esp,%ebp
c0001951:	83 ec 08             	sub    $0x8,%esp
c0001954:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c000195b:	00 00 00 
c000195e:	c7 05 70 f7 00 c0 00 	movl   $0x0,0xc000f770
c0001965:	00 00 00 
c0001968:	83 ec 0c             	sub    $0xc,%esp
c000196b:	68 64 a9 00 c0       	push   $0xc000a964
c0001970:	e8 17 fc ff ff       	call   c000158c <disp_str>
c0001975:	83 c4 10             	add    $0x10,%esp
c0001978:	e8 6c 68 00 00       	call   c00081e9 <init_keyboard>
c000197d:	83 ec 0c             	sub    $0xc,%esp
c0001980:	68 00 00 00 02       	push   $0x2000000
c0001985:	e8 66 5d 00 00       	call   c00076f0 <init_memory>
c000198a:	83 c4 10             	add    $0x10,%esp
c000198d:	83 ec 0c             	sub    $0xc,%esp
c0001990:	68 cc fd 00 c0       	push   $0xc000fdcc
c0001995:	e8 2b 8c 00 00       	call   c000a5c5 <initDoubleLinkList>
c000199a:	83 c4 10             	add    $0x10,%esp
c000199d:	83 ec 0c             	sub    $0xc,%esp
c00019a0:	68 18 1f 01 c0       	push   $0xc0011f18
c00019a5:	e8 1b 8c 00 00       	call   c000a5c5 <initDoubleLinkList>
c00019aa:	83 c4 10             	add    $0x10,%esp
c00019ad:	90                   	nop
c00019ae:	c9                   	leave  
c00019af:	c3                   	ret    

c00019b0 <kernel_thread_a>:
c00019b0:	55                   	push   %ebp
c00019b1:	89 e5                	mov    %esp,%ebp
c00019b3:	83 ec 18             	sub    $0x18,%esp
c00019b6:	83 ec 0c             	sub    $0xc,%esp
c00019b9:	ff 75 08             	pushl  0x8(%ebp)
c00019bc:	e8 cb fb ff ff       	call   c000158c <disp_str>
c00019c1:	83 c4 10             	add    $0x10,%esp
c00019c4:	a1 80 f7 00 c0       	mov    0xc000f780,%eax
c00019c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00019d6:	a3 80 f7 00 c0       	mov    %eax,0xc000f780
c00019db:	83 ec 0c             	sub    $0xc,%esp
c00019de:	68 6a a9 00 c0       	push   $0xc000a96a
c00019e3:	e8 a4 fb ff ff       	call   c000158c <disp_str>
c00019e8:	83 c4 10             	add    $0x10,%esp
c00019eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019ee:	8d 50 01             	lea    0x1(%eax),%edx
c00019f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019f4:	83 ec 0c             	sub    $0xc,%esp
c00019f7:	50                   	push   %eax
c00019f8:	e8 d5 60 00 00       	call   c0007ad2 <disp_int>
c00019fd:	83 c4 10             	add    $0x10,%esp
c0001a00:	83 ec 0c             	sub    $0xc,%esp
c0001a03:	68 73 a9 00 c0       	push   $0xc000a973
c0001a08:	e8 7f fb ff ff       	call   c000158c <disp_str>
c0001a0d:	83 c4 10             	add    $0x10,%esp
c0001a10:	eb c1                	jmp    c00019d3 <kernel_thread_a+0x23>

c0001a12 <kernel_thread_b>:
c0001a12:	55                   	push   %ebp
c0001a13:	89 e5                	mov    %esp,%ebp
c0001a15:	83 ec 18             	sub    $0x18,%esp
c0001a18:	83 ec 0c             	sub    $0xc,%esp
c0001a1b:	ff 75 08             	pushl  0x8(%ebp)
c0001a1e:	e8 69 fb ff ff       	call   c000158c <disp_str>
c0001a23:	83 c4 10             	add    $0x10,%esp
c0001a26:	a1 80 f7 00 c0       	mov    0xc000f780,%eax
c0001a2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001a2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a38:	a3 80 f7 00 c0       	mov    %eax,0xc000f780
c0001a3d:	83 ec 0c             	sub    $0xc,%esp
c0001a40:	68 75 a9 00 c0       	push   $0xc000a975
c0001a45:	e8 42 fb ff ff       	call   c000158c <disp_str>
c0001a4a:	83 c4 10             	add    $0x10,%esp
c0001a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a50:	8d 50 01             	lea    0x1(%eax),%edx
c0001a53:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0001a56:	83 ec 0c             	sub    $0xc,%esp
c0001a59:	50                   	push   %eax
c0001a5a:	e8 73 60 00 00       	call   c0007ad2 <disp_int>
c0001a5f:	83 c4 10             	add    $0x10,%esp
c0001a62:	83 ec 0c             	sub    $0xc,%esp
c0001a65:	68 73 a9 00 c0       	push   $0xc000a973
c0001a6a:	e8 1d fb ff ff       	call   c000158c <disp_str>
c0001a6f:	83 c4 10             	add    $0x10,%esp
c0001a72:	eb c1                	jmp    c0001a35 <kernel_thread_b+0x23>

c0001a74 <kernel_thread_c>:
c0001a74:	55                   	push   %ebp
c0001a75:	89 e5                	mov    %esp,%ebp
c0001a77:	83 ec 08             	sub    $0x8,%esp
c0001a7a:	83 ec 0c             	sub    $0xc,%esp
c0001a7d:	ff 75 08             	pushl  0x8(%ebp)
c0001a80:	e8 07 fb ff ff       	call   c000158c <disp_str>
c0001a85:	83 c4 10             	add    $0x10,%esp
c0001a88:	eb fe                	jmp    c0001a88 <kernel_thread_c+0x14>

c0001a8a <kernel_thread_d>:
c0001a8a:	55                   	push   %ebp
c0001a8b:	89 e5                	mov    %esp,%ebp
c0001a8d:	83 ec 08             	sub    $0x8,%esp
c0001a90:	83 ec 0c             	sub    $0xc,%esp
c0001a93:	ff 75 08             	pushl  0x8(%ebp)
c0001a96:	e8 f1 fa ff ff       	call   c000158c <disp_str>
c0001a9b:	83 c4 10             	add    $0x10,%esp
c0001a9e:	eb fe                	jmp    c0001a9e <kernel_thread_d+0x14>

c0001aa0 <user_proc_a>:
c0001aa0:	55                   	push   %ebp
c0001aa1:	89 e5                	mov    %esp,%ebp
c0001aa3:	83 ec 08             	sub    $0x8,%esp
c0001aa6:	83 ec 0c             	sub    $0xc,%esp
c0001aa9:	68 7e a9 00 c0       	push   $0xc000a97e
c0001aae:	e8 d9 fa ff ff       	call   c000158c <disp_str>
c0001ab3:	83 c4 10             	add    $0x10,%esp
c0001ab6:	e8 26 6c 00 00       	call   c00086e1 <INIT_fork>
c0001abb:	eb fe                	jmp    c0001abb <user_proc_a+0x1b>

c0001abd <user_proc_b>:
c0001abd:	55                   	push   %ebp
c0001abe:	89 e5                	mov    %esp,%ebp
c0001ac0:	83 ec 08             	sub    $0x8,%esp
c0001ac3:	83 ec 0c             	sub    $0xc,%esp
c0001ac6:	68 90 a9 00 c0       	push   $0xc000a990
c0001acb:	e8 bc fa ff ff       	call   c000158c <disp_str>
c0001ad0:	83 c4 10             	add    $0x10,%esp
c0001ad3:	eb fe                	jmp    c0001ad3 <user_proc_b+0x16>

c0001ad5 <TaskHD>:
c0001ad5:	55                   	push   %ebp
c0001ad6:	89 e5                	mov    %esp,%ebp
c0001ad8:	83 ec 18             	sub    $0x18,%esp
c0001adb:	e8 c6 fd ff ff       	call   c00018a6 <get_running_thread_pcb>
c0001ae0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001ae3:	e8 20 00 00 00       	call   c0001b08 <init_hd>
c0001ae8:	83 ec 0c             	sub    $0xc,%esp
c0001aeb:	6a 6c                	push   $0x6c
c0001aed:	e8 08 54 00 00       	call   c0006efa <sys_malloc>
c0001af2:	83 c4 10             	add    $0x10,%esp
c0001af5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001af8:	83 ec 0c             	sub    $0xc,%esp
c0001afb:	ff 75 f0             	pushl  -0x10(%ebp)
c0001afe:	e8 1f 00 00 00       	call   c0001b22 <hd_handle>
c0001b03:	83 c4 10             	add    $0x10,%esp
c0001b06:	eb f0                	jmp    c0001af8 <TaskHD+0x23>

c0001b08 <init_hd>:
c0001b08:	55                   	push   %ebp
c0001b09:	89 e5                	mov    %esp,%ebp
c0001b0b:	83 ec 18             	sub    $0x18,%esp
c0001b0e:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001b15:	e8 46 fd ff ff       	call   c0001860 <enable_8259A_casecade_irq>
c0001b1a:	e8 55 fd ff ff       	call   c0001874 <enable_8259A_slave_winchester_irq>
c0001b1f:	90                   	nop
c0001b20:	c9                   	leave  
c0001b21:	c3                   	ret    

c0001b22 <hd_handle>:
c0001b22:	55                   	push   %ebp
c0001b23:	89 e5                	mov    %esp,%ebp
c0001b25:	83 ec 18             	sub    $0x18,%esp
c0001b28:	83 ec 04             	sub    $0x4,%esp
c0001b2b:	6a 12                	push   $0x12
c0001b2d:	ff 75 08             	pushl  0x8(%ebp)
c0001b30:	6a 02                	push   $0x2
c0001b32:	e8 10 80 00 00       	call   c0009b47 <send_rec>
c0001b37:	83 c4 10             	add    $0x10,%esp
c0001b3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b3d:	8b 40 68             	mov    0x68(%eax),%eax
c0001b40:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b43:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001b47:	0f 84 cc 00 00 00    	je     c0001c19 <hd_handle+0xf7>
c0001b4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b50:	8b 00                	mov    (%eax),%eax
c0001b52:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b55:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b59:	74 2b                	je     c0001b86 <hd_handle+0x64>
c0001b5b:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b5f:	74 25                	je     c0001b86 <hd_handle+0x64>
c0001b61:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b65:	74 1f                	je     c0001b86 <hd_handle+0x64>
c0001b67:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b6b:	74 19                	je     c0001b86 <hd_handle+0x64>
c0001b6d:	6a 69                	push   $0x69
c0001b6f:	68 a4 a9 00 c0       	push   $0xc000a9a4
c0001b74:	68 a4 a9 00 c0       	push   $0xc000a9a4
c0001b79:	68 ac a9 00 c0       	push   $0xc000a9ac
c0001b7e:	e8 65 77 00 00       	call   c00092e8 <assertion_failure>
c0001b83:	83 c4 10             	add    $0x10,%esp
c0001b86:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b8a:	74 23                	je     c0001baf <hd_handle+0x8d>
c0001b8c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b90:	77 08                	ja     c0001b9a <hd_handle+0x78>
c0001b92:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b96:	74 10                	je     c0001ba8 <hd_handle+0x86>
c0001b98:	eb 34                	jmp    c0001bce <hd_handle+0xac>
c0001b9a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b9e:	74 0f                	je     c0001baf <hd_handle+0x8d>
c0001ba0:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001ba4:	74 19                	je     c0001bbf <hd_handle+0x9d>
c0001ba6:	eb 26                	jmp    c0001bce <hd_handle+0xac>
c0001ba8:	e8 1b 07 00 00       	call   c00022c8 <hd_open>
c0001bad:	eb 30                	jmp    c0001bdf <hd_handle+0xbd>
c0001baf:	83 ec 0c             	sub    $0xc,%esp
c0001bb2:	ff 75 08             	pushl  0x8(%ebp)
c0001bb5:	e8 38 08 00 00       	call   c00023f2 <hd_rdwt>
c0001bba:	83 c4 10             	add    $0x10,%esp
c0001bbd:	eb 20                	jmp    c0001bdf <hd_handle+0xbd>
c0001bbf:	83 ec 0c             	sub    $0xc,%esp
c0001bc2:	6a 00                	push   $0x0
c0001bc4:	e8 4e 07 00 00       	call   c0002317 <get_hd_ioctl>
c0001bc9:	83 c4 10             	add    $0x10,%esp
c0001bcc:	eb 11                	jmp    c0001bdf <hd_handle+0xbd>
c0001bce:	83 ec 0c             	sub    $0xc,%esp
c0001bd1:	68 f2 a9 00 c0       	push   $0xc000a9f2
c0001bd6:	e8 c9 76 00 00       	call   c00092a4 <spin>
c0001bdb:	83 c4 10             	add    $0x10,%esp
c0001bde:	90                   	nop
c0001bdf:	83 ec 04             	sub    $0x4,%esp
c0001be2:	6a 6c                	push   $0x6c
c0001be4:	6a 00                	push   $0x0
c0001be6:	ff 75 08             	pushl  0x8(%ebp)
c0001be9:	e8 70 99 00 00       	call   c000b55e <Memset>
c0001bee:	83 c4 10             	add    $0x10,%esp
c0001bf1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bf4:	c7 40 68 64 00 00 00 	movl   $0x64,0x68(%eax)
c0001bfb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bfe:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001c05:	83 ec 04             	sub    $0x4,%esp
c0001c08:	6a 04                	push   $0x4
c0001c0a:	ff 75 08             	pushl  0x8(%ebp)
c0001c0d:	6a 01                	push   $0x1
c0001c0f:	e8 33 7f 00 00       	call   c0009b47 <send_rec>
c0001c14:	83 c4 10             	add    $0x10,%esp
c0001c17:	eb 01                	jmp    c0001c1a <hd_handle+0xf8>
c0001c19:	90                   	nop
c0001c1a:	c9                   	leave  
c0001c1b:	c3                   	ret    

c0001c1c <hd_cmd_out>:
c0001c1c:	55                   	push   %ebp
c0001c1d:	89 e5                	mov    %esp,%ebp
c0001c1f:	83 ec 08             	sub    $0x8,%esp
c0001c22:	83 ec 04             	sub    $0x4,%esp
c0001c25:	68 18 73 01 00       	push   $0x17318
c0001c2a:	6a 00                	push   $0x0
c0001c2c:	68 80 00 00 00       	push   $0x80
c0001c31:	e8 47 0a 00 00       	call   c000267d <waitfor>
c0001c36:	83 c4 10             	add    $0x10,%esp
c0001c39:	85 c0                	test   %eax,%eax
c0001c3b:	75 10                	jne    c0001c4d <hd_cmd_out+0x31>
c0001c3d:	83 ec 0c             	sub    $0xc,%esp
c0001c40:	68 04 aa 00 c0       	push   $0xc000aa04
c0001c45:	e8 80 76 00 00       	call   c00092ca <panic>
c0001c4a:	83 c4 10             	add    $0x10,%esp
c0001c4d:	83 ec 08             	sub    $0x8,%esp
c0001c50:	6a 00                	push   $0x0
c0001c52:	68 f6 03 00 00       	push   $0x3f6
c0001c57:	e8 4a fb ff ff       	call   c00017a6 <out_byte>
c0001c5c:	83 c4 10             	add    $0x10,%esp
c0001c5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c62:	0f b6 00             	movzbl (%eax),%eax
c0001c65:	0f b6 c0             	movzbl %al,%eax
c0001c68:	83 ec 08             	sub    $0x8,%esp
c0001c6b:	50                   	push   %eax
c0001c6c:	68 f1 01 00 00       	push   $0x1f1
c0001c71:	e8 30 fb ff ff       	call   c00017a6 <out_byte>
c0001c76:	83 c4 10             	add    $0x10,%esp
c0001c79:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c7c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001c80:	0f b6 c0             	movzbl %al,%eax
c0001c83:	83 ec 08             	sub    $0x8,%esp
c0001c86:	50                   	push   %eax
c0001c87:	68 f2 01 00 00       	push   $0x1f2
c0001c8c:	e8 15 fb ff ff       	call   c00017a6 <out_byte>
c0001c91:	83 c4 10             	add    $0x10,%esp
c0001c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c97:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001c9b:	0f b6 c0             	movzbl %al,%eax
c0001c9e:	83 ec 08             	sub    $0x8,%esp
c0001ca1:	50                   	push   %eax
c0001ca2:	68 f3 01 00 00       	push   $0x1f3
c0001ca7:	e8 fa fa ff ff       	call   c00017a6 <out_byte>
c0001cac:	83 c4 10             	add    $0x10,%esp
c0001caf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cb2:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001cb6:	0f b6 c0             	movzbl %al,%eax
c0001cb9:	83 ec 08             	sub    $0x8,%esp
c0001cbc:	50                   	push   %eax
c0001cbd:	68 f4 01 00 00       	push   $0x1f4
c0001cc2:	e8 df fa ff ff       	call   c00017a6 <out_byte>
c0001cc7:	83 c4 10             	add    $0x10,%esp
c0001cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ccd:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001cd1:	0f b6 c0             	movzbl %al,%eax
c0001cd4:	83 ec 08             	sub    $0x8,%esp
c0001cd7:	50                   	push   %eax
c0001cd8:	68 f5 01 00 00       	push   $0x1f5
c0001cdd:	e8 c4 fa ff ff       	call   c00017a6 <out_byte>
c0001ce2:	83 c4 10             	add    $0x10,%esp
c0001ce5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ce8:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001cec:	0f b6 c0             	movzbl %al,%eax
c0001cef:	83 ec 08             	sub    $0x8,%esp
c0001cf2:	50                   	push   %eax
c0001cf3:	68 f6 01 00 00       	push   $0x1f6
c0001cf8:	e8 a9 fa ff ff       	call   c00017a6 <out_byte>
c0001cfd:	83 c4 10             	add    $0x10,%esp
c0001d00:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d03:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001d07:	0f b6 c0             	movzbl %al,%eax
c0001d0a:	83 ec 08             	sub    $0x8,%esp
c0001d0d:	50                   	push   %eax
c0001d0e:	68 f7 01 00 00       	push   $0x1f7
c0001d13:	e8 8e fa ff ff       	call   c00017a6 <out_byte>
c0001d18:	83 c4 10             	add    $0x10,%esp
c0001d1b:	90                   	nop
c0001d1c:	c9                   	leave  
c0001d1d:	c3                   	ret    

c0001d1e <hd_identify>:
c0001d1e:	55                   	push   %ebp
c0001d1f:	89 e5                	mov    %esp,%ebp
c0001d21:	53                   	push   %ebx
c0001d22:	83 ec 24             	sub    $0x24,%esp
c0001d25:	89 e0                	mov    %esp,%eax
c0001d27:	89 c3                	mov    %eax,%ebx
c0001d29:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001d2d:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001d31:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001d35:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001d39:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001d3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d40:	c1 e0 04             	shl    $0x4,%eax
c0001d43:	83 c8 e0             	or     $0xffffffe0,%eax
c0001d46:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001d49:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001d4d:	83 ec 0c             	sub    $0xc,%esp
c0001d50:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001d53:	50                   	push   %eax
c0001d54:	e8 c3 fe ff ff       	call   c0001c1c <hd_cmd_out>
c0001d59:	83 c4 10             	add    $0x10,%esp
c0001d5c:	e8 40 06 00 00       	call   c00023a1 <interrupt_wait>
c0001d61:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001d68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d6b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001d6e:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001d71:	89 c2                	mov    %eax,%edx
c0001d73:	b8 10 00 00 00       	mov    $0x10,%eax
c0001d78:	83 e8 01             	sub    $0x1,%eax
c0001d7b:	01 d0                	add    %edx,%eax
c0001d7d:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001d82:	ba 00 00 00 00       	mov    $0x0,%edx
c0001d87:	f7 f1                	div    %ecx
c0001d89:	6b c0 10             	imul   $0x10,%eax,%eax
c0001d8c:	29 c4                	sub    %eax,%esp
c0001d8e:	89 e0                	mov    %esp,%eax
c0001d90:	83 c0 00             	add    $0x0,%eax
c0001d93:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001d96:	83 ec 04             	sub    $0x4,%esp
c0001d99:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d9c:	6a 00                	push   $0x0
c0001d9e:	ff 75 ec             	pushl  -0x14(%ebp)
c0001da1:	e8 b8 97 00 00       	call   c000b55e <Memset>
c0001da6:	83 c4 10             	add    $0x10,%esp
c0001da9:	83 ec 04             	sub    $0x4,%esp
c0001dac:	ff 75 f4             	pushl  -0xc(%ebp)
c0001daf:	ff 75 ec             	pushl  -0x14(%ebp)
c0001db2:	68 f0 01 00 00       	push   $0x1f0
c0001db7:	e8 f6 97 00 00       	call   c000b5b2 <read_port>
c0001dbc:	83 c4 10             	add    $0x10,%esp
c0001dbf:	83 ec 0c             	sub    $0xc,%esp
c0001dc2:	ff 75 ec             	pushl  -0x14(%ebp)
c0001dc5:	e8 0b 00 00 00       	call   c0001dd5 <print_hdinfo>
c0001dca:	83 c4 10             	add    $0x10,%esp
c0001dcd:	89 dc                	mov    %ebx,%esp
c0001dcf:	90                   	nop
c0001dd0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001dd3:	c9                   	leave  
c0001dd4:	c3                   	ret    

c0001dd5 <print_hdinfo>:
c0001dd5:	55                   	push   %ebp
c0001dd6:	89 e5                	mov    %esp,%ebp
c0001dd8:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001dde:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001de4:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001dea:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001df1:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001df8:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001dff:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001e06:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001e0d:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001e13:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001e19:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001e20:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001e27:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001e2e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001e35:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001e3c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e43:	e9 8f 00 00 00       	jmp    c0001ed7 <print_hdinfo+0x102>
c0001e48:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001e4f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e52:	89 d0                	mov    %edx,%eax
c0001e54:	01 c0                	add    %eax,%eax
c0001e56:	01 d0                	add    %edx,%eax
c0001e58:	c1 e0 03             	shl    $0x3,%eax
c0001e5b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e5e:	01 c8                	add    %ecx,%eax
c0001e60:	83 e8 44             	sub    $0x44,%eax
c0001e63:	0f b7 00             	movzwl (%eax),%eax
c0001e66:	0f b7 c0             	movzwl %ax,%eax
c0001e69:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001e6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e6f:	01 d0                	add    %edx,%eax
c0001e71:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e74:	eb 30                	jmp    c0001ea6 <print_hdinfo+0xd1>
c0001e76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e79:	8d 50 01             	lea    0x1(%eax),%edx
c0001e7c:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e7f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e82:	83 c2 01             	add    $0x1,%edx
c0001e85:	0f b6 00             	movzbl (%eax),%eax
c0001e88:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001e8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e8f:	8d 50 01             	lea    0x1(%eax),%edx
c0001e92:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e95:	0f b6 00             	movzbl (%eax),%eax
c0001e98:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001e9b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e9e:	01 ca                	add    %ecx,%edx
c0001ea0:	88 02                	mov    %al,(%edx)
c0001ea2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001ea6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001ea9:	89 d0                	mov    %edx,%eax
c0001eab:	01 c0                	add    %eax,%eax
c0001ead:	01 d0                	add    %edx,%eax
c0001eaf:	c1 e0 03             	shl    $0x3,%eax
c0001eb2:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001eb5:	01 c8                	add    %ecx,%eax
c0001eb7:	83 e8 42             	sub    $0x42,%eax
c0001eba:	0f b7 00             	movzwl (%eax),%eax
c0001ebd:	66 d1 e8             	shr    %ax
c0001ec0:	0f b7 c0             	movzwl %ax,%eax
c0001ec3:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001ec6:	7c ae                	jl     c0001e76 <print_hdinfo+0xa1>
c0001ec8:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001ecb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001ece:	01 d0                	add    %edx,%eax
c0001ed0:	c6 00 00             	movb   $0x0,(%eax)
c0001ed3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001ed7:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001edb:	0f 8e 67 ff ff ff    	jle    c0001e48 <print_hdinfo+0x73>
c0001ee1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ee4:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001ee8:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001eec:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001ef0:	66 c1 e8 08          	shr    $0x8,%ax
c0001ef4:	66 85 c0             	test   %ax,%ax
c0001ef7:	0f 95 c0             	setne  %al
c0001efa:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001efd:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001f04:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001f0a:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001f0e:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001f12:	75 15                	jne    c0001f29 <print_hdinfo+0x154>
c0001f14:	83 ec 08             	sub    $0x8,%esp
c0001f17:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001f1a:	50                   	push   %eax
c0001f1b:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f1e:	50                   	push   %eax
c0001f1f:	e8 59 96 00 00       	call   c000b57d <Strcpy>
c0001f24:	83 c4 10             	add    $0x10,%esp
c0001f27:	eb 13                	jmp    c0001f3c <print_hdinfo+0x167>
c0001f29:	83 ec 08             	sub    $0x8,%esp
c0001f2c:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001f2f:	50                   	push   %eax
c0001f30:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f33:	50                   	push   %eax
c0001f34:	e8 44 96 00 00       	call   c000b57d <Strcpy>
c0001f39:	83 c4 10             	add    $0x10,%esp
c0001f3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f3f:	83 c0 7a             	add    $0x7a,%eax
c0001f42:	0f b7 00             	movzwl (%eax),%eax
c0001f45:	0f b7 d0             	movzwl %ax,%edx
c0001f48:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f4b:	83 c0 78             	add    $0x78,%eax
c0001f4e:	0f b7 00             	movzwl (%eax),%eax
c0001f51:	0f b7 c0             	movzwl %ax,%eax
c0001f54:	83 c0 10             	add    $0x10,%eax
c0001f57:	89 c1                	mov    %eax,%ecx
c0001f59:	d3 e2                	shl    %cl,%edx
c0001f5b:	89 d0                	mov    %edx,%eax
c0001f5d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001f60:	90                   	nop
c0001f61:	c9                   	leave  
c0001f62:	c3                   	ret    

c0001f63 <print_dpt_entry>:
c0001f63:	55                   	push   %ebp
c0001f64:	89 e5                	mov    %esp,%ebp
c0001f66:	83 ec 08             	sub    $0x8,%esp
c0001f69:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f6c:	8b 40 08             	mov    0x8(%eax),%eax
c0001f6f:	83 ec 08             	sub    $0x8,%esp
c0001f72:	50                   	push   %eax
c0001f73:	68 0e aa 00 c0       	push   $0xc000aa0e
c0001f78:	e8 f7 6f 00 00       	call   c0008f74 <Printf>
c0001f7d:	83 c4 10             	add    $0x10,%esp
c0001f80:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f83:	8b 40 0c             	mov    0xc(%eax),%eax
c0001f86:	83 ec 08             	sub    $0x8,%esp
c0001f89:	50                   	push   %eax
c0001f8a:	68 16 aa 00 c0       	push   $0xc000aa16
c0001f8f:	e8 e0 6f 00 00       	call   c0008f74 <Printf>
c0001f94:	83 c4 10             	add    $0x10,%esp
c0001f97:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f9a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001f9e:	0f b6 c0             	movzbl %al,%eax
c0001fa1:	83 ec 08             	sub    $0x8,%esp
c0001fa4:	50                   	push   %eax
c0001fa5:	68 27 aa 00 c0       	push   $0xc000aa27
c0001faa:	e8 c5 6f 00 00       	call   c0008f74 <Printf>
c0001faf:	83 c4 10             	add    $0x10,%esp
c0001fb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fb5:	0f b6 00             	movzbl (%eax),%eax
c0001fb8:	0f b6 c0             	movzbl %al,%eax
c0001fbb:	83 ec 08             	sub    $0x8,%esp
c0001fbe:	50                   	push   %eax
c0001fbf:	68 35 aa 00 c0       	push   $0xc000aa35
c0001fc4:	e8 ab 6f 00 00       	call   c0008f74 <Printf>
c0001fc9:	83 c4 10             	add    $0x10,%esp
c0001fcc:	90                   	nop
c0001fcd:	c9                   	leave  
c0001fce:	c3                   	ret    

c0001fcf <get_partition_table>:
c0001fcf:	55                   	push   %ebp
c0001fd0:	89 e5                	mov    %esp,%ebp
c0001fd2:	53                   	push   %ebx
c0001fd3:	83 ec 24             	sub    $0x24,%esp
c0001fd6:	89 e0                	mov    %esp,%eax
c0001fd8:	89 c3                	mov    %eax,%ebx
c0001fda:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001fde:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001fe2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fe5:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001fe8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001feb:	c1 f8 08             	sar    $0x8,%eax
c0001fee:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001ff1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001ff4:	c1 f8 10             	sar    $0x10,%eax
c0001ff7:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001ffa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001ffd:	c1 f8 18             	sar    $0x18,%eax
c0002000:	89 c2                	mov    %eax,%edx
c0002002:	8b 45 08             	mov    0x8(%ebp),%eax
c0002005:	c1 e0 04             	shl    $0x4,%eax
c0002008:	09 d0                	or     %edx,%eax
c000200a:	83 c8 e0             	or     $0xffffffe0,%eax
c000200d:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0002010:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0002014:	83 ec 0c             	sub    $0xc,%esp
c0002017:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c000201a:	50                   	push   %eax
c000201b:	e8 fc fb ff ff       	call   c0001c1c <hd_cmd_out>
c0002020:	83 c4 10             	add    $0x10,%esp
c0002023:	e8 79 03 00 00       	call   c00023a1 <interrupt_wait>
c0002028:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c000202f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002032:	8d 50 ff             	lea    -0x1(%eax),%edx
c0002035:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0002038:	89 c2                	mov    %eax,%edx
c000203a:	b8 10 00 00 00       	mov    $0x10,%eax
c000203f:	83 e8 01             	sub    $0x1,%eax
c0002042:	01 d0                	add    %edx,%eax
c0002044:	b9 10 00 00 00       	mov    $0x10,%ecx
c0002049:	ba 00 00 00 00       	mov    $0x0,%edx
c000204e:	f7 f1                	div    %ecx
c0002050:	6b c0 10             	imul   $0x10,%eax,%eax
c0002053:	29 c4                	sub    %eax,%esp
c0002055:	89 e0                	mov    %esp,%eax
c0002057:	83 c0 00             	add    $0x0,%eax
c000205a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000205d:	83 ec 04             	sub    $0x4,%esp
c0002060:	ff 75 f4             	pushl  -0xc(%ebp)
c0002063:	6a 00                	push   $0x0
c0002065:	ff 75 ec             	pushl  -0x14(%ebp)
c0002068:	e8 f1 94 00 00       	call   c000b55e <Memset>
c000206d:	83 c4 10             	add    $0x10,%esp
c0002070:	83 ec 04             	sub    $0x4,%esp
c0002073:	ff 75 f4             	pushl  -0xc(%ebp)
c0002076:	ff 75 ec             	pushl  -0x14(%ebp)
c0002079:	68 f0 01 00 00       	push   $0x1f0
c000207e:	e8 2f 95 00 00       	call   c000b5b2 <read_port>
c0002083:	83 c4 10             	add    $0x10,%esp
c0002086:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002089:	05 be 01 00 00       	add    $0x1be,%eax
c000208e:	83 ec 04             	sub    $0x4,%esp
c0002091:	6a 40                	push   $0x40
c0002093:	50                   	push   %eax
c0002094:	ff 75 10             	pushl  0x10(%ebp)
c0002097:	e8 94 94 00 00       	call   c000b530 <Memcpy>
c000209c:	83 c4 10             	add    $0x10,%esp
c000209f:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c00020a6:	89 dc                	mov    %ebx,%esp
c00020a8:	90                   	nop
c00020a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00020ac:	c9                   	leave  
c00020ad:	c3                   	ret    

c00020ae <partition>:
c00020ae:	55                   	push   %ebp
c00020af:	89 e5                	mov    %esp,%ebp
c00020b1:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00020b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00020ba:	88 45 84             	mov    %al,-0x7c(%ebp)
c00020bd:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00020c1:	7f 19                	jg     c00020dc <partition+0x2e>
c00020c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00020c6:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00020cb:	89 c8                	mov    %ecx,%eax
c00020cd:	f7 ea                	imul   %edx
c00020cf:	d1 fa                	sar    %edx
c00020d1:	89 c8                	mov    %ecx,%eax
c00020d3:	c1 f8 1f             	sar    $0x1f,%eax
c00020d6:	29 c2                	sub    %eax,%edx
c00020d8:	89 d0                	mov    %edx,%eax
c00020da:	eb 11                	jmp    c00020ed <partition+0x3f>
c00020dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00020df:	83 e8 10             	sub    $0x10,%eax
c00020e2:	8d 50 3f             	lea    0x3f(%eax),%edx
c00020e5:	85 c0                	test   %eax,%eax
c00020e7:	0f 48 c2             	cmovs  %edx,%eax
c00020ea:	c1 f8 06             	sar    $0x6,%eax
c00020ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00020f0:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c00020f4:	0f 85 cc 00 00 00    	jne    c00021c6 <partition+0x118>
c00020fa:	83 ec 04             	sub    $0x4,%esp
c00020fd:	6a 40                	push   $0x40
c00020ff:	6a 00                	push   $0x0
c0002101:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002104:	50                   	push   %eax
c0002105:	e8 54 94 00 00       	call   c000b55e <Memset>
c000210a:	83 c4 10             	add    $0x10,%esp
c000210d:	83 ec 04             	sub    $0x4,%esp
c0002110:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002113:	50                   	push   %eax
c0002114:	6a 00                	push   $0x0
c0002116:	ff 75 e8             	pushl  -0x18(%ebp)
c0002119:	e8 b1 fe ff ff       	call   c0001fcf <get_partition_table>
c000211e:	83 c4 10             	add    $0x10,%esp
c0002121:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002128:	e9 8a 00 00 00       	jmp    c00021b7 <partition+0x109>
c000212d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002130:	83 c0 01             	add    $0x1,%eax
c0002133:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002136:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002139:	c1 e0 04             	shl    $0x4,%eax
c000213c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000213f:	01 c8                	add    %ecx,%eax
c0002141:	83 e8 5c             	sub    $0x5c,%eax
c0002144:	8b 00                	mov    (%eax),%eax
c0002146:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002149:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000214c:	c1 e1 03             	shl    $0x3,%ecx
c000214f:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002155:	01 ca                	add    %ecx,%edx
c0002157:	81 c2 84 1f 01 c0    	add    $0xc0011f84,%edx
c000215d:	89 02                	mov    %eax,(%edx)
c000215f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002162:	c1 e0 04             	shl    $0x4,%eax
c0002165:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002168:	01 c8                	add    %ecx,%eax
c000216a:	83 e8 58             	sub    $0x58,%eax
c000216d:	8b 00                	mov    (%eax),%eax
c000216f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002172:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002175:	c1 e1 03             	shl    $0x3,%ecx
c0002178:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000217e:	01 ca                	add    %ecx,%edx
c0002180:	81 c2 88 1f 01 c0    	add    $0xc0011f88,%edx
c0002186:	89 02                	mov    %eax,(%edx)
c0002188:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000218b:	c1 e0 04             	shl    $0x4,%eax
c000218e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002191:	01 c8                	add    %ecx,%eax
c0002193:	83 e8 60             	sub    $0x60,%eax
c0002196:	0f b6 00             	movzbl (%eax),%eax
c0002199:	3c 05                	cmp    $0x5,%al
c000219b:	75 16                	jne    c00021b3 <partition+0x105>
c000219d:	8b 55 08             	mov    0x8(%ebp),%edx
c00021a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00021a3:	01 d0                	add    %edx,%eax
c00021a5:	83 ec 08             	sub    $0x8,%esp
c00021a8:	6a 01                	push   $0x1
c00021aa:	50                   	push   %eax
c00021ab:	e8 fe fe ff ff       	call   c00020ae <partition>
c00021b0:	83 c4 10             	add    $0x10,%esp
c00021b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00021b7:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00021bb:	0f 8e 6c ff ff ff    	jle    c000212d <partition+0x7f>
c00021c1:	e9 ff 00 00 00       	jmp    c00022c5 <partition+0x217>
c00021c6:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c00021ca:	0f 85 f5 00 00 00    	jne    c00022c5 <partition+0x217>
c00021d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00021d3:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00021d8:	89 c8                	mov    %ecx,%eax
c00021da:	f7 ea                	imul   %edx
c00021dc:	d1 fa                	sar    %edx
c00021de:	89 c8                	mov    %ecx,%eax
c00021e0:	c1 f8 1f             	sar    $0x1f,%eax
c00021e3:	29 c2                	sub    %eax,%edx
c00021e5:	89 d0                	mov    %edx,%eax
c00021e7:	c1 e0 02             	shl    $0x2,%eax
c00021ea:	01 d0                	add    %edx,%eax
c00021ec:	29 c1                	sub    %eax,%ecx
c00021ee:	89 c8                	mov    %ecx,%eax
c00021f0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00021f3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00021f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00021f9:	c1 e2 03             	shl    $0x3,%edx
c00021fc:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002202:	01 d0                	add    %edx,%eax
c0002204:	05 84 1f 01 c0       	add    $0xc0011f84,%eax
c0002209:	8b 00                	mov    (%eax),%eax
c000220b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000220e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002211:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002214:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002217:	83 e8 01             	sub    $0x1,%eax
c000221a:	c1 e0 04             	shl    $0x4,%eax
c000221d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002220:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002227:	e9 8c 00 00 00       	jmp    c00022b8 <partition+0x20a>
c000222c:	83 ec 04             	sub    $0x4,%esp
c000222f:	6a 40                	push   $0x40
c0002231:	6a 00                	push   $0x0
c0002233:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002236:	50                   	push   %eax
c0002237:	e8 22 93 00 00       	call   c000b55e <Memset>
c000223c:	83 c4 10             	add    $0x10,%esp
c000223f:	83 ec 04             	sub    $0x4,%esp
c0002242:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002245:	50                   	push   %eax
c0002246:	ff 75 f0             	pushl  -0x10(%ebp)
c0002249:	ff 75 e8             	pushl  -0x18(%ebp)
c000224c:	e8 7e fd ff ff       	call   c0001fcf <get_partition_table>
c0002251:	83 c4 10             	add    $0x10,%esp
c0002254:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002257:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000225a:	01 d0                	add    %edx,%eax
c000225c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000225f:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0002262:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002265:	01 c2                	add    %eax,%edx
c0002267:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000226a:	8d 48 04             	lea    0x4(%eax),%ecx
c000226d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002270:	c1 e1 03             	shl    $0x3,%ecx
c0002273:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002279:	01 c8                	add    %ecx,%eax
c000227b:	05 84 1f 01 c0       	add    $0xc0011f84,%eax
c0002280:	89 10                	mov    %edx,(%eax)
c0002282:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002285:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0002288:	8d 4a 04             	lea    0x4(%edx),%ecx
c000228b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000228e:	c1 e1 03             	shl    $0x3,%ecx
c0002291:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002297:	01 ca                	add    %ecx,%edx
c0002299:	81 c2 88 1f 01 c0    	add    $0xc0011f88,%edx
c000229f:	89 02                	mov    %eax,(%edx)
c00022a1:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c00022a5:	84 c0                	test   %al,%al
c00022a7:	74 1b                	je     c00022c4 <partition+0x216>
c00022a9:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00022ac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00022af:	01 d0                	add    %edx,%eax
c00022b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00022b4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00022b8:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c00022bc:	0f 8e 6a ff ff ff    	jle    c000222c <partition+0x17e>
c00022c2:	eb 01                	jmp    c00022c5 <partition+0x217>
c00022c4:	90                   	nop
c00022c5:	90                   	nop
c00022c6:	c9                   	leave  
c00022c7:	c3                   	ret    

c00022c8 <hd_open>:
c00022c8:	55                   	push   %ebp
c00022c9:	89 e5                	mov    %esp,%ebp
c00022cb:	83 ec 18             	sub    $0x18,%esp
c00022ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022d8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022de:	05 80 1f 01 c0       	add    $0xc0011f80,%eax
c00022e3:	8b 00                	mov    (%eax),%eax
c00022e5:	8d 50 01             	lea    0x1(%eax),%edx
c00022e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022eb:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022f1:	05 80 1f 01 c0       	add    $0xc0011f80,%eax
c00022f6:	89 10                	mov    %edx,(%eax)
c00022f8:	83 ec 0c             	sub    $0xc,%esp
c00022fb:	6a 00                	push   $0x0
c00022fd:	e8 1c fa ff ff       	call   c0001d1e <hd_identify>
c0002302:	83 c4 10             	add    $0x10,%esp
c0002305:	83 ec 08             	sub    $0x8,%esp
c0002308:	6a 00                	push   $0x0
c000230a:	6a 00                	push   $0x0
c000230c:	e8 9d fd ff ff       	call   c00020ae <partition>
c0002311:	83 c4 10             	add    $0x10,%esp
c0002314:	90                   	nop
c0002315:	c9                   	leave  
c0002316:	c3                   	ret    

c0002317 <get_hd_ioctl>:
c0002317:	55                   	push   %ebp
c0002318:	89 e5                	mov    %esp,%ebp
c000231a:	83 ec 10             	sub    $0x10,%esp
c000231d:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002321:	7f 19                	jg     c000233c <get_hd_ioctl+0x25>
c0002323:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002326:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000232b:	89 c8                	mov    %ecx,%eax
c000232d:	f7 ea                	imul   %edx
c000232f:	d1 fa                	sar    %edx
c0002331:	89 c8                	mov    %ecx,%eax
c0002333:	c1 f8 1f             	sar    $0x1f,%eax
c0002336:	29 c2                	sub    %eax,%edx
c0002338:	89 d0                	mov    %edx,%eax
c000233a:	eb 11                	jmp    c000234d <get_hd_ioctl+0x36>
c000233c:	8b 45 08             	mov    0x8(%ebp),%eax
c000233f:	83 e8 10             	sub    $0x10,%eax
c0002342:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002345:	85 c0                	test   %eax,%eax
c0002347:	0f 48 c2             	cmovs  %edx,%eax
c000234a:	c1 f8 06             	sar    $0x6,%eax
c000234d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0002350:	8b 55 08             	mov    0x8(%ebp),%edx
c0002353:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002356:	c1 e2 03             	shl    $0x3,%edx
c0002359:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000235f:	01 d0                	add    %edx,%eax
c0002361:	05 88 1f 01 c0       	add    $0xc0011f88,%eax
c0002366:	8b 00                	mov    (%eax),%eax
c0002368:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000236b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000236e:	c9                   	leave  
c000236f:	c3                   	ret    

c0002370 <wait_for>:
c0002370:	55                   	push   %ebp
c0002371:	89 e5                	mov    %esp,%ebp
c0002373:	83 ec 08             	sub    $0x8,%esp
c0002376:	83 ec 04             	sub    $0x4,%esp
c0002379:	68 20 4e 00 00       	push   $0x4e20
c000237e:	6a 08                	push   $0x8
c0002380:	6a 08                	push   $0x8
c0002382:	e8 f6 02 00 00       	call   c000267d <waitfor>
c0002387:	83 c4 10             	add    $0x10,%esp
c000238a:	85 c0                	test   %eax,%eax
c000238c:	75 10                	jne    c000239e <wait_for+0x2e>
c000238e:	83 ec 0c             	sub    $0xc,%esp
c0002391:	68 40 aa 00 c0       	push   $0xc000aa40
c0002396:	e8 2f 6f 00 00       	call   c00092ca <panic>
c000239b:	83 c4 10             	add    $0x10,%esp
c000239e:	90                   	nop
c000239f:	c9                   	leave  
c00023a0:	c3                   	ret    

c00023a1 <interrupt_wait>:
c00023a1:	55                   	push   %ebp
c00023a2:	89 e5                	mov    %esp,%ebp
c00023a4:	83 ec 18             	sub    $0x18,%esp
c00023a7:	83 ec 0c             	sub    $0xc,%esp
c00023aa:	6a 6c                	push   $0x6c
c00023ac:	e8 49 4b 00 00       	call   c0006efa <sys_malloc>
c00023b1:	83 c4 10             	add    $0x10,%esp
c00023b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00023b7:	83 ec 04             	sub    $0x4,%esp
c00023ba:	6a 6c                	push   $0x6c
c00023bc:	6a 00                	push   $0x0
c00023be:	ff 75 f4             	pushl  -0xc(%ebp)
c00023c1:	e8 98 91 00 00       	call   c000b55e <Memset>
c00023c6:	83 c4 10             	add    $0x10,%esp
c00023c9:	83 ec 04             	sub    $0x4,%esp
c00023cc:	68 13 02 00 00       	push   $0x213
c00023d1:	ff 75 f4             	pushl  -0xc(%ebp)
c00023d4:	6a 02                	push   $0x2
c00023d6:	e8 6c 77 00 00       	call   c0009b47 <send_rec>
c00023db:	83 c4 10             	add    $0x10,%esp
c00023de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023e1:	83 ec 08             	sub    $0x8,%esp
c00023e4:	6a 6c                	push   $0x6c
c00023e6:	50                   	push   %eax
c00023e7:	e8 4c 4e 00 00       	call   c0007238 <sys_free>
c00023ec:	83 c4 10             	add    $0x10,%esp
c00023ef:	90                   	nop
c00023f0:	c9                   	leave  
c00023f1:	c3                   	ret    

c00023f2 <hd_rdwt>:
c00023f2:	55                   	push   %ebp
c00023f3:	89 e5                	mov    %esp,%ebp
c00023f5:	83 ec 48             	sub    $0x48,%esp
c00023f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00023fb:	8b 40 18             	mov    0x18(%eax),%eax
c00023fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002401:	8b 45 08             	mov    0x8(%ebp),%eax
c0002404:	8b 40 14             	mov    0x14(%eax),%eax
c0002407:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000240a:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c000240e:	7f 19                	jg     c0002429 <hd_rdwt+0x37>
c0002410:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002413:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002418:	89 c8                	mov    %ecx,%eax
c000241a:	f7 ea                	imul   %edx
c000241c:	d1 fa                	sar    %edx
c000241e:	89 c8                	mov    %ecx,%eax
c0002420:	c1 f8 1f             	sar    $0x1f,%eax
c0002423:	29 c2                	sub    %eax,%edx
c0002425:	89 d0                	mov    %edx,%eax
c0002427:	eb 11                	jmp    c000243a <hd_rdwt+0x48>
c0002429:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000242c:	83 e8 10             	sub    $0x10,%eax
c000242f:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002432:	85 c0                	test   %eax,%eax
c0002434:	0f 48 c2             	cmovs  %edx,%eax
c0002437:	c1 f8 06             	sar    $0x6,%eax
c000243a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000243d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002440:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002443:	89 d0                	mov    %edx,%eax
c0002445:	c1 f8 1f             	sar    $0x1f,%eax
c0002448:	c1 e8 1a             	shr    $0x1a,%eax
c000244b:	01 c2                	add    %eax,%edx
c000244d:	83 e2 3f             	and    $0x3f,%edx
c0002450:	29 c2                	sub    %eax,%edx
c0002452:	89 d0                	mov    %edx,%eax
c0002454:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002457:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000245a:	c1 e8 09             	shr    $0x9,%eax
c000245d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002460:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002464:	7f 1a                	jg     c0002480 <hd_rdwt+0x8e>
c0002466:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002469:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000246c:	c1 e2 03             	shl    $0x3,%edx
c000246f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002475:	01 d0                	add    %edx,%eax
c0002477:	05 84 1f 01 c0       	add    $0xc0011f84,%eax
c000247c:	8b 00                	mov    (%eax),%eax
c000247e:	eb 1b                	jmp    c000249b <hd_rdwt+0xa9>
c0002480:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002483:	8d 50 04             	lea    0x4(%eax),%edx
c0002486:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002489:	c1 e2 03             	shl    $0x3,%edx
c000248c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002492:	01 d0                	add    %edx,%eax
c0002494:	05 84 1f 01 c0       	add    $0xc0011f84,%eax
c0002499:	8b 00                	mov    (%eax),%eax
c000249b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000249e:	01 d0                	add    %edx,%eax
c00024a0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00024a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00024a6:	8b 40 0c             	mov    0xc(%eax),%eax
c00024a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00024ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024af:	05 ff 01 00 00       	add    $0x1ff,%eax
c00024b4:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00024ba:	85 c0                	test   %eax,%eax
c00024bc:	0f 48 c2             	cmovs  %edx,%eax
c00024bf:	c1 f8 09             	sar    $0x9,%eax
c00024c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00024c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00024ce:	8b 40 10             	mov    0x10(%eax),%eax
c00024d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00024d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00024d7:	8b 00                	mov    (%eax),%eax
c00024d9:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00024dc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024df:	83 ec 08             	sub    $0x8,%esp
c00024e2:	50                   	push   %eax
c00024e3:	ff 75 d0             	pushl  -0x30(%ebp)
c00024e6:	e8 ce 48 00 00       	call   c0006db9 <alloc_virtual_memory>
c00024eb:	83 c4 10             	add    $0x10,%esp
c00024ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00024f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00024f4:	8b 40 68             	mov    0x68(%eax),%eax
c00024f7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00024fa:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00024fe:	74 22                	je     c0002522 <hd_rdwt+0x130>
c0002500:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002504:	74 1c                	je     c0002522 <hd_rdwt+0x130>
c0002506:	68 a3 01 00 00       	push   $0x1a3
c000250b:	68 a4 a9 00 c0       	push   $0xc000a9a4
c0002510:	68 a4 a9 00 c0       	push   $0xc000a9a4
c0002515:	68 52 aa 00 c0       	push   $0xc000aa52
c000251a:	e8 c9 6d 00 00       	call   c00092e8 <assertion_failure>
c000251f:	83 c4 10             	add    $0x10,%esp
c0002522:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0002526:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002529:	88 45 be             	mov    %al,-0x42(%ebp)
c000252c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000252f:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002532:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002535:	c1 f8 08             	sar    $0x8,%eax
c0002538:	88 45 c0             	mov    %al,-0x40(%ebp)
c000253b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000253e:	c1 f8 10             	sar    $0x10,%eax
c0002541:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002544:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002547:	c1 f8 18             	sar    $0x18,%eax
c000254a:	83 e0 0f             	and    $0xf,%eax
c000254d:	83 c8 e0             	or     $0xffffffe0,%eax
c0002550:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002553:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002557:	75 07                	jne    c0002560 <hd_rdwt+0x16e>
c0002559:	b8 20 00 00 00       	mov    $0x20,%eax
c000255e:	eb 05                	jmp    c0002565 <hd_rdwt+0x173>
c0002560:	b8 30 00 00 00       	mov    $0x30,%eax
c0002565:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0002568:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c000256c:	3c 20                	cmp    $0x20,%al
c000256e:	74 24                	je     c0002594 <hd_rdwt+0x1a2>
c0002570:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002574:	3c 30                	cmp    $0x30,%al
c0002576:	74 1c                	je     c0002594 <hd_rdwt+0x1a2>
c0002578:	68 b1 01 00 00       	push   $0x1b1
c000257d:	68 a4 a9 00 c0       	push   $0xc000a9a4
c0002582:	68 a4 a9 00 c0       	push   $0xc000a9a4
c0002587:	68 70 aa 00 c0       	push   $0xc000aa70
c000258c:	e8 57 6d 00 00       	call   c00092e8 <assertion_failure>
c0002591:	83 c4 10             	add    $0x10,%esp
c0002594:	83 ec 0c             	sub    $0xc,%esp
c0002597:	8d 45 bd             	lea    -0x43(%ebp),%eax
c000259a:	50                   	push   %eax
c000259b:	e8 7c f6 ff ff       	call   c0001c1c <hd_cmd_out>
c00025a0:	83 c4 10             	add    $0x10,%esp
c00025a3:	e9 9c 00 00 00       	jmp    c0002644 <hd_rdwt+0x252>
c00025a8:	b8 00 02 00 00       	mov    $0x200,%eax
c00025ad:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00025b4:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00025b8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00025bb:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00025bf:	75 51                	jne    c0002612 <hd_rdwt+0x220>
c00025c1:	e8 aa fd ff ff       	call   c0002370 <wait_for>
c00025c6:	e8 d6 fd ff ff       	call   c00023a1 <interrupt_wait>
c00025cb:	83 ec 04             	sub    $0x4,%esp
c00025ce:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025d1:	6a 00                	push   $0x0
c00025d3:	68 c0 21 01 c0       	push   $0xc00121c0
c00025d8:	e8 81 8f 00 00       	call   c000b55e <Memset>
c00025dd:	83 c4 10             	add    $0x10,%esp
c00025e0:	83 ec 04             	sub    $0x4,%esp
c00025e3:	68 00 02 00 00       	push   $0x200
c00025e8:	68 c0 21 01 c0       	push   $0xc00121c0
c00025ed:	68 f0 01 00 00       	push   $0x1f0
c00025f2:	e8 bb 8f 00 00       	call   c000b5b2 <read_port>
c00025f7:	83 c4 10             	add    $0x10,%esp
c00025fa:	83 ec 04             	sub    $0x4,%esp
c00025fd:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002600:	68 c0 21 01 c0       	push   $0xc00121c0
c0002605:	ff 75 f0             	pushl  -0x10(%ebp)
c0002608:	e8 23 8f 00 00       	call   c000b530 <Memcpy>
c000260d:	83 c4 10             	add    $0x10,%esp
c0002610:	eb 26                	jmp    c0002638 <hd_rdwt+0x246>
c0002612:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002616:	75 20                	jne    c0002638 <hd_rdwt+0x246>
c0002618:	e8 53 fd ff ff       	call   c0002370 <wait_for>
c000261d:	83 ec 04             	sub    $0x4,%esp
c0002620:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002623:	ff 75 f0             	pushl  -0x10(%ebp)
c0002626:	68 f0 01 00 00       	push   $0x1f0
c000262b:	e8 96 8f 00 00       	call   c000b5c6 <write_port>
c0002630:	83 c4 10             	add    $0x10,%esp
c0002633:	e8 69 fd ff ff       	call   c00023a1 <interrupt_wait>
c0002638:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000263b:	29 45 f4             	sub    %eax,-0xc(%ebp)
c000263e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002641:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002644:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002648:	0f 85 5a ff ff ff    	jne    c00025a8 <hd_rdwt+0x1b6>
c000264e:	90                   	nop
c000264f:	c9                   	leave  
c0002650:	c3                   	ret    

c0002651 <hd_handler>:
c0002651:	55                   	push   %ebp
c0002652:	89 e5                	mov    %esp,%ebp
c0002654:	83 ec 18             	sub    $0x18,%esp
c0002657:	83 ec 0c             	sub    $0xc,%esp
c000265a:	68 f7 01 00 00       	push   $0x1f7
c000265f:	e8 36 f1 ff ff       	call   c000179a <in_byte>
c0002664:	83 c4 10             	add    $0x10,%esp
c0002667:	0f b6 c0             	movzbl %al,%eax
c000266a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000266d:	83 ec 0c             	sub    $0xc,%esp
c0002670:	6a 03                	push   $0x3
c0002672:	e8 7a 77 00 00       	call   c0009df1 <inform_int>
c0002677:	83 c4 10             	add    $0x10,%esp
c000267a:	90                   	nop
c000267b:	c9                   	leave  
c000267c:	c3                   	ret    

c000267d <waitfor>:
c000267d:	55                   	push   %ebp
c000267e:	89 e5                	mov    %esp,%ebp
c0002680:	83 ec 18             	sub    $0x18,%esp
c0002683:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000268a:	eb 26                	jmp    c00026b2 <waitfor+0x35>
c000268c:	83 ec 0c             	sub    $0xc,%esp
c000268f:	68 f7 01 00 00       	push   $0x1f7
c0002694:	e8 01 f1 ff ff       	call   c000179a <in_byte>
c0002699:	83 c4 10             	add    $0x10,%esp
c000269c:	0f b6 c0             	movzbl %al,%eax
c000269f:	23 45 08             	and    0x8(%ebp),%eax
c00026a2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00026a5:	75 07                	jne    c00026ae <waitfor+0x31>
c00026a7:	b8 01 00 00 00       	mov    $0x1,%eax
c00026ac:	eb 11                	jmp    c00026bf <waitfor+0x42>
c00026ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00026b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026b5:	3b 45 10             	cmp    0x10(%ebp),%eax
c00026b8:	7c d2                	jl     c000268c <waitfor+0xf>
c00026ba:	b8 00 00 00 00       	mov    $0x0,%eax
c00026bf:	c9                   	leave  
c00026c0:	c3                   	ret    

c00026c1 <print_hd_info>:
c00026c1:	55                   	push   %ebp
c00026c2:	89 e5                	mov    %esp,%ebp
c00026c4:	83 ec 18             	sub    $0x18,%esp
c00026c7:	83 ec 0c             	sub    $0xc,%esp
c00026ca:	68 a4 aa 00 c0       	push   $0xc000aaa4
c00026cf:	e8 a0 68 00 00       	call   c0008f74 <Printf>
c00026d4:	83 c4 10             	add    $0x10,%esp
c00026d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00026de:	eb 3b                	jmp    c000271b <print_hd_info+0x5a>
c00026e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026e3:	8b 04 c5 88 1f 01 c0 	mov    -0x3ffee078(,%eax,8),%eax
c00026ea:	85 c0                	test   %eax,%eax
c00026ec:	74 28                	je     c0002716 <print_hd_info+0x55>
c00026ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026f1:	8b 14 c5 88 1f 01 c0 	mov    -0x3ffee078(,%eax,8),%edx
c00026f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026fb:	8b 04 c5 84 1f 01 c0 	mov    -0x3ffee07c(,%eax,8),%eax
c0002702:	ff 75 f4             	pushl  -0xc(%ebp)
c0002705:	52                   	push   %edx
c0002706:	50                   	push   %eax
c0002707:	68 c1 aa 00 c0       	push   $0xc000aac1
c000270c:	e8 63 68 00 00       	call   c0008f74 <Printf>
c0002711:	83 c4 10             	add    $0x10,%esp
c0002714:	eb 01                	jmp    c0002717 <print_hd_info+0x56>
c0002716:	90                   	nop
c0002717:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000271b:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000271f:	7e bf                	jle    c00026e0 <print_hd_info+0x1f>
c0002721:	83 ec 0c             	sub    $0xc,%esp
c0002724:	68 d9 aa 00 c0       	push   $0xc000aad9
c0002729:	e8 46 68 00 00       	call   c0008f74 <Printf>
c000272e:	83 c4 10             	add    $0x10,%esp
c0002731:	83 ec 0c             	sub    $0xc,%esp
c0002734:	68 f4 aa 00 c0       	push   $0xc000aaf4
c0002739:	e8 36 68 00 00       	call   c0008f74 <Printf>
c000273e:	83 c4 10             	add    $0x10,%esp
c0002741:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0002748:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000274f:	eb 44                	jmp    c0002795 <print_hd_info+0xd4>
c0002751:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002754:	83 c0 04             	add    $0x4,%eax
c0002757:	8b 04 c5 88 1f 01 c0 	mov    -0x3ffee078(,%eax,8),%eax
c000275e:	85 c0                	test   %eax,%eax
c0002760:	74 2e                	je     c0002790 <print_hd_info+0xcf>
c0002762:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002765:	83 c0 04             	add    $0x4,%eax
c0002768:	8b 14 c5 88 1f 01 c0 	mov    -0x3ffee078(,%eax,8),%edx
c000276f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002772:	83 c0 04             	add    $0x4,%eax
c0002775:	8b 04 c5 84 1f 01 c0 	mov    -0x3ffee07c(,%eax,8),%eax
c000277c:	ff 75 f0             	pushl  -0x10(%ebp)
c000277f:	52                   	push   %edx
c0002780:	50                   	push   %eax
c0002781:	68 c1 aa 00 c0       	push   $0xc000aac1
c0002786:	e8 e9 67 00 00       	call   c0008f74 <Printf>
c000278b:	83 c4 10             	add    $0x10,%esp
c000278e:	eb 01                	jmp    c0002791 <print_hd_info+0xd0>
c0002790:	90                   	nop
c0002791:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002795:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002799:	7e b6                	jle    c0002751 <print_hd_info+0x90>
c000279b:	83 ec 0c             	sub    $0xc,%esp
c000279e:	68 11 ab 00 c0       	push   $0xc000ab11
c00027a3:	e8 cc 67 00 00       	call   c0008f74 <Printf>
c00027a8:	83 c4 10             	add    $0x10,%esp
c00027ab:	90                   	nop
c00027ac:	c9                   	leave  
c00027ad:	c3                   	ret    

c00027ae <is_empty>:
c00027ae:	55                   	push   %ebp
c00027af:	89 e5                	mov    %esp,%ebp
c00027b1:	83 ec 10             	sub    $0x10,%esp
c00027b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00027bb:	eb 1a                	jmp    c00027d7 <is_empty+0x29>
c00027bd:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00027c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00027c3:	01 d0                	add    %edx,%eax
c00027c5:	0f b6 00             	movzbl (%eax),%eax
c00027c8:	84 c0                	test   %al,%al
c00027ca:	74 07                	je     c00027d3 <is_empty+0x25>
c00027cc:	b8 00 00 00 00       	mov    $0x0,%eax
c00027d1:	eb 11                	jmp    c00027e4 <is_empty+0x36>
c00027d3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00027d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00027da:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00027dd:	7c de                	jl     c00027bd <is_empty+0xf>
c00027df:	b8 01 00 00 00       	mov    $0x1,%eax
c00027e4:	c9                   	leave  
c00027e5:	c3                   	ret    
c00027e6:	66 90                	xchg   %ax,%ax
c00027e8:	66 90                	xchg   %ax,%ax
c00027ea:	66 90                	xchg   %ax,%ax
c00027ec:	66 90                	xchg   %ax,%ax
c00027ee:	66 90                	xchg   %ax,%ax

c00027f0 <get_ticks>:
c00027f0:	b8 00 00 00 00       	mov    $0x0,%eax
c00027f5:	cd 90                	int    $0x90
c00027f7:	c3                   	ret    

c00027f8 <write2>:
c00027f8:	b8 01 00 00 00       	mov    $0x1,%eax
c00027fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002801:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002805:	cd 90                	int    $0x90
c0002807:	c3                   	ret    

c0002808 <write_debug>:
c0002808:	b8 02 00 00 00       	mov    $0x2,%eax
c000280d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002811:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002815:	cd 90                	int    $0x90
c0002817:	c3                   	ret    

c0002818 <send_msg2>:
c0002818:	b8 03 00 00 00       	mov    $0x3,%eax
c000281d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002821:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002825:	cd 90                	int    $0x90
c0002827:	c3                   	ret    

c0002828 <send_msg>:
c0002828:	55                   	push   %ebp
c0002829:	89 e5                	mov    %esp,%ebp
c000282b:	53                   	push   %ebx
c000282c:	51                   	push   %ecx
c000282d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002832:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002835:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002838:	cd 90                	int    $0x90
c000283a:	59                   	pop    %ecx
c000283b:	5b                   	pop    %ebx
c000283c:	5d                   	pop    %ebp
c000283d:	c3                   	ret    

c000283e <receive_msg2>:
c000283e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002843:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002847:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000284b:	cd 90                	int    $0x90
c000284d:	c3                   	ret    

c000284e <receive_msg>:
c000284e:	55                   	push   %ebp
c000284f:	89 e5                	mov    %esp,%ebp
c0002851:	53                   	push   %ebx
c0002852:	51                   	push   %ecx
c0002853:	b8 04 00 00 00       	mov    $0x4,%eax
c0002858:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000285b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000285e:	cd 90                	int    $0x90
c0002860:	59                   	pop    %ecx
c0002861:	5b                   	pop    %ebx
c0002862:	5d                   	pop    %ebp
c0002863:	c3                   	ret    

c0002864 <task_fs>:
c0002864:	55                   	push   %ebp
c0002865:	89 e5                	mov    %esp,%ebp
c0002867:	83 ec 38             	sub    $0x38,%esp
c000286a:	e8 37 f0 ff ff       	call   c00018a6 <get_running_thread_pcb>
c000286f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002872:	e8 87 08 00 00       	call   c00030fe <init_fs>
c0002877:	83 ec 0c             	sub    $0xc,%esp
c000287a:	6a 6c                	push   $0x6c
c000287c:	e8 79 46 00 00       	call   c0006efa <sys_malloc>
c0002881:	83 c4 10             	add    $0x10,%esp
c0002884:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002887:	83 ec 0c             	sub    $0xc,%esp
c000288a:	6a 6c                	push   $0x6c
c000288c:	e8 69 46 00 00       	call   c0006efa <sys_malloc>
c0002891:	83 c4 10             	add    $0x10,%esp
c0002894:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002897:	83 ec 04             	sub    $0x4,%esp
c000289a:	6a 6c                	push   $0x6c
c000289c:	6a 00                	push   $0x0
c000289e:	ff 75 f0             	pushl  -0x10(%ebp)
c00028a1:	e8 b8 8c 00 00       	call   c000b55e <Memset>
c00028a6:	83 c4 10             	add    $0x10,%esp
c00028a9:	83 ec 04             	sub    $0x4,%esp
c00028ac:	6a 12                	push   $0x12
c00028ae:	ff 75 f0             	pushl  -0x10(%ebp)
c00028b1:	6a 02                	push   $0x2
c00028b3:	e8 8f 72 00 00       	call   c0009b47 <send_rec>
c00028b8:	83 c4 10             	add    $0x10,%esp
c00028bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028be:	8b 40 68             	mov    0x68(%eax),%eax
c00028c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00028c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028c7:	8b 00                	mov    (%eax),%eax
c00028c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00028cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028cf:	8b 40 40             	mov    0x40(%eax),%eax
c00028d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00028d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028d8:	8b 40 58             	mov    0x58(%eax),%eax
c00028db:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00028de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028e1:	8b 00                	mov    (%eax),%eax
c00028e3:	85 c0                	test   %eax,%eax
c00028e5:	75 07                	jne    c00028ee <task_fs+0x8a>
c00028e7:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00028ee:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00028f5:	83 ec 0c             	sub    $0xc,%esp
c00028f8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00028fb:	e8 3b 21 00 00       	call   c0004a3b <pid2proc>
c0002900:	83 c4 10             	add    $0x10,%esp
c0002903:	a3 a8 fb 00 c0       	mov    %eax,0xc000fba8
c0002908:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000290c:	74 36                	je     c0002944 <task_fs+0xe0>
c000290e:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c0002912:	74 30                	je     c0002944 <task_fs+0xe0>
c0002914:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002918:	74 2a                	je     c0002944 <task_fs+0xe0>
c000291a:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000291e:	74 24                	je     c0002944 <task_fs+0xe0>
c0002920:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002924:	74 1e                	je     c0002944 <task_fs+0xe0>
c0002926:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000292a:	74 18                	je     c0002944 <task_fs+0xe0>
c000292c:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c0002933:	00 00 00 
c0002936:	83 ec 0c             	sub    $0xc,%esp
c0002939:	ff 75 e8             	pushl  -0x18(%ebp)
c000293c:	e8 91 51 00 00       	call   c0007ad2 <disp_int>
c0002941:	83 c4 10             	add    $0x10,%esp
c0002944:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002948:	74 37                	je     c0002981 <task_fs+0x11d>
c000294a:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c000294e:	74 31                	je     c0002981 <task_fs+0x11d>
c0002950:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002954:	74 2b                	je     c0002981 <task_fs+0x11d>
c0002956:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000295a:	74 25                	je     c0002981 <task_fs+0x11d>
c000295c:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002960:	74 1f                	je     c0002981 <task_fs+0x11d>
c0002962:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0002966:	74 19                	je     c0002981 <task_fs+0x11d>
c0002968:	6a 7c                	push   $0x7c
c000296a:	68 30 ab 00 c0       	push   $0xc000ab30
c000296f:	68 30 ab 00 c0       	push   $0xc000ab30
c0002974:	68 40 ab 00 c0       	push   $0xc000ab40
c0002979:	e8 6a 69 00 00       	call   c00092e8 <assertion_failure>
c000297e:	83 c4 10             	add    $0x10,%esp
c0002981:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002985:	74 2f                	je     c00029b6 <task_fs+0x152>
c0002987:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c000298b:	7f 15                	jg     c00029a2 <task_fs+0x13e>
c000298d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002991:	0f 84 a5 00 00 00    	je     c0002a3c <task_fs+0x1d8>
c0002997:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000299b:	74 64                	je     c0002a01 <task_fs+0x19d>
c000299d:	e9 88 00 00 00       	jmp    c0002a2a <task_fs+0x1c6>
c00029a2:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c00029a6:	74 46                	je     c00029ee <task_fs+0x18a>
c00029a8:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c00029ac:	74 63                	je     c0002a11 <task_fs+0x1ad>
c00029ae:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00029b2:	74 3a                	je     c00029ee <task_fs+0x18a>
c00029b4:	eb 74                	jmp    c0002a2a <task_fs+0x1c6>
c00029b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029b9:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00029c0:	83 ec 0c             	sub    $0xc,%esp
c00029c3:	ff 75 f0             	pushl  -0x10(%ebp)
c00029c6:	e8 88 07 00 00       	call   c0003153 <do_open>
c00029cb:	83 c4 10             	add    $0x10,%esp
c00029ce:	89 c2                	mov    %eax,%edx
c00029d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029d3:	89 50 40             	mov    %edx,0x40(%eax)
c00029d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029d9:	8b 00                	mov    (%eax),%eax
c00029db:	83 ec 04             	sub    $0x4,%esp
c00029de:	50                   	push   %eax
c00029df:	ff 75 f0             	pushl  -0x10(%ebp)
c00029e2:	6a 01                	push   $0x1
c00029e4:	e8 5e 71 00 00       	call   c0009b47 <send_rec>
c00029e9:	83 c4 10             	add    $0x10,%esp
c00029ec:	eb 4f                	jmp    c0002a3d <task_fs+0x1d9>
c00029ee:	83 ec 0c             	sub    $0xc,%esp
c00029f1:	ff 75 f0             	pushl  -0x10(%ebp)
c00029f4:	e8 98 18 00 00       	call   c0004291 <do_rdwt>
c00029f9:	83 c4 10             	add    $0x10,%esp
c00029fc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00029ff:	eb 3c                	jmp    c0002a3d <task_fs+0x1d9>
c0002a01:	83 ec 0c             	sub    $0xc,%esp
c0002a04:	ff 75 e0             	pushl  -0x20(%ebp)
c0002a07:	e8 a9 1d 00 00       	call   c00047b5 <do_close>
c0002a0c:	83 c4 10             	add    $0x10,%esp
c0002a0f:	eb 2c                	jmp    c0002a3d <task_fs+0x1d9>
c0002a11:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002a14:	8b 40 58             	mov    0x58(%eax),%eax
c0002a17:	83 ec 04             	sub    $0x4,%esp
c0002a1a:	50                   	push   %eax
c0002a1b:	ff 75 f0             	pushl  -0x10(%ebp)
c0002a1e:	6a 01                	push   $0x1
c0002a20:	e8 22 71 00 00       	call   c0009b47 <send_rec>
c0002a25:	83 c4 10             	add    $0x10,%esp
c0002a28:	eb 13                	jmp    c0002a3d <task_fs+0x1d9>
c0002a2a:	83 ec 0c             	sub    $0xc,%esp
c0002a2d:	68 a3 ab 00 c0       	push   $0xc000aba3
c0002a32:	e8 93 68 00 00       	call   c00092ca <panic>
c0002a37:	83 c4 10             	add    $0x10,%esp
c0002a3a:	eb 01                	jmp    c0002a3d <task_fs+0x1d9>
c0002a3c:	90                   	nop
c0002a3d:	e9 55 fe ff ff       	jmp    c0002897 <task_fs+0x33>

c0002a42 <rd_wt>:
c0002a42:	55                   	push   %ebp
c0002a43:	89 e5                	mov    %esp,%ebp
c0002a45:	83 ec 18             	sub    $0x18,%esp
c0002a48:	83 ec 0c             	sub    $0xc,%esp
c0002a4b:	6a 6c                	push   $0x6c
c0002a4d:	e8 a8 44 00 00       	call   c0006efa <sys_malloc>
c0002a52:	83 c4 10             	add    $0x10,%esp
c0002a55:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002a58:	83 ec 04             	sub    $0x4,%esp
c0002a5b:	6a 6c                	push   $0x6c
c0002a5d:	6a 00                	push   $0x0
c0002a5f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a62:	e8 f7 8a 00 00       	call   c000b55e <Memset>
c0002a67:	83 c4 10             	add    $0x10,%esp
c0002a6a:	8b 55 18             	mov    0x18(%ebp),%edx
c0002a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a70:	89 50 68             	mov    %edx,0x68(%eax)
c0002a73:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a79:	89 50 14             	mov    %edx,0x14(%eax)
c0002a7c:	8b 55 10             	mov    0x10(%ebp),%edx
c0002a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a82:	89 50 10             	mov    %edx,0x10(%eax)
c0002a85:	8b 55 14             	mov    0x14(%ebp),%edx
c0002a88:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a8b:	89 50 0c             	mov    %edx,0xc(%eax)
c0002a8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0002a91:	c1 e0 09             	shl    $0x9,%eax
c0002a94:	89 c2                	mov    %eax,%edx
c0002a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a99:	89 50 18             	mov    %edx,0x18(%eax)
c0002a9c:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002aa0:	74 22                	je     c0002ac4 <rd_wt+0x82>
c0002aa2:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002aa6:	74 1c                	je     c0002ac4 <rd_wt+0x82>
c0002aa8:	68 a7 00 00 00       	push   $0xa7
c0002aad:	68 30 ab 00 c0       	push   $0xc000ab30
c0002ab2:	68 30 ab 00 c0       	push   $0xc000ab30
c0002ab7:	68 b6 ab 00 c0       	push   $0xc000abb6
c0002abc:	e8 27 68 00 00       	call   c00092e8 <assertion_failure>
c0002ac1:	83 c4 10             	add    $0x10,%esp
c0002ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ac7:	8b 40 68             	mov    0x68(%eax),%eax
c0002aca:	83 f8 07             	cmp    $0x7,%eax
c0002acd:	74 27                	je     c0002af6 <rd_wt+0xb4>
c0002acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ad2:	8b 40 68             	mov    0x68(%eax),%eax
c0002ad5:	83 f8 0a             	cmp    $0xa,%eax
c0002ad8:	74 1c                	je     c0002af6 <rd_wt+0xb4>
c0002ada:	68 a8 00 00 00       	push   $0xa8
c0002adf:	68 30 ab 00 c0       	push   $0xc000ab30
c0002ae4:	68 30 ab 00 c0       	push   $0xc000ab30
c0002ae9:	68 d4 ab 00 c0       	push   $0xc000abd4
c0002aee:	e8 f5 67 00 00       	call   c00092e8 <assertion_failure>
c0002af3:	83 c4 10             	add    $0x10,%esp
c0002af6:	83 ec 04             	sub    $0x4,%esp
c0002af9:	6a 03                	push   $0x3
c0002afb:	ff 75 f4             	pushl  -0xc(%ebp)
c0002afe:	6a 03                	push   $0x3
c0002b00:	e8 42 70 00 00       	call   c0009b47 <send_rec>
c0002b05:	83 c4 10             	add    $0x10,%esp
c0002b08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b0b:	83 ec 08             	sub    $0x8,%esp
c0002b0e:	6a 6c                	push   $0x6c
c0002b10:	50                   	push   %eax
c0002b11:	e8 22 47 00 00       	call   c0007238 <sys_free>
c0002b16:	83 c4 10             	add    $0x10,%esp
c0002b19:	90                   	nop
c0002b1a:	c9                   	leave  
c0002b1b:	c3                   	ret    

c0002b1c <mkfs>:
c0002b1c:	55                   	push   %ebp
c0002b1d:	89 e5                	mov    %esp,%ebp
c0002b1f:	57                   	push   %edi
c0002b20:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002b26:	83 ec 0c             	sub    $0xc,%esp
c0002b29:	68 00 80 00 00       	push   $0x8000
c0002b2e:	e8 c7 43 00 00       	call   c0006efa <sys_malloc>
c0002b33:	83 c4 10             	add    $0x10,%esp
c0002b36:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002b3b:	83 ec 0c             	sub    $0xc,%esp
c0002b3e:	6a 24                	push   $0x24
c0002b40:	e8 b5 43 00 00       	call   c0006efa <sys_malloc>
c0002b45:	83 c4 10             	add    $0x10,%esp
c0002b48:	a3 e0 31 01 c0       	mov    %eax,0xc00131e0
c0002b4d:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002b52:	83 ec 0c             	sub    $0xc,%esp
c0002b55:	50                   	push   %eax
c0002b56:	e8 cb 42 00 00       	call   c0006e26 <get_physical_address>
c0002b5b:	83 c4 10             	add    $0x10,%esp
c0002b5e:	a3 c4 27 01 c0       	mov    %eax,0xc00127c4
c0002b63:	a1 e0 31 01 c0       	mov    0xc00131e0,%eax
c0002b68:	83 ec 0c             	sub    $0xc,%esp
c0002b6b:	50                   	push   %eax
c0002b6c:	e8 b5 42 00 00       	call   c0006e26 <get_physical_address>
c0002b71:	83 c4 10             	add    $0x10,%esp
c0002b74:	a3 c0 27 01 c0       	mov    %eax,0xc00127c0
c0002b79:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002b7e:	83 ec 04             	sub    $0x4,%esp
c0002b81:	68 00 02 00 00       	push   $0x200
c0002b86:	6a 00                	push   $0x0
c0002b88:	50                   	push   %eax
c0002b89:	e8 d0 89 00 00       	call   c000b55e <Memset>
c0002b8e:	83 c4 10             	add    $0x10,%esp
c0002b91:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002b96:	83 ec 0c             	sub    $0xc,%esp
c0002b99:	6a 0a                	push   $0xa
c0002b9b:	68 00 02 00 00       	push   $0x200
c0002ba0:	50                   	push   %eax
c0002ba1:	6a 20                	push   $0x20
c0002ba3:	6a 00                	push   $0x0
c0002ba5:	e8 98 fe ff ff       	call   c0002a42 <rd_wt>
c0002baa:	83 c4 20             	add    $0x20,%esp
c0002bad:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002bb2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002bb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bb8:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002bbf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bc2:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002bc9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bcc:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002bd3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bd6:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002bdd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002be0:	8b 40 04             	mov    0x4(%eax),%eax
c0002be3:	8d 50 02             	lea    0x2(%eax),%edx
c0002be6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002be9:	8b 40 08             	mov    0x8(%eax),%eax
c0002bec:	01 c2                	add    %eax,%edx
c0002bee:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bf1:	8b 40 0c             	mov    0xc(%eax),%eax
c0002bf4:	01 c2                	add    %eax,%edx
c0002bf6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bf9:	89 10                	mov    %edx,(%eax)
c0002bfb:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002c02:	b8 00 02 00 00       	mov    $0x200,%eax
c0002c07:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002c0a:	8b 0d e4 31 01 c0    	mov    0xc00131e4,%ecx
c0002c10:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002c13:	01 ca                	add    %ecx,%edx
c0002c15:	83 ec 04             	sub    $0x4,%esp
c0002c18:	50                   	push   %eax
c0002c19:	6a 80                	push   $0xffffff80
c0002c1b:	52                   	push   %edx
c0002c1c:	e8 3d 89 00 00       	call   c000b55e <Memset>
c0002c21:	83 c4 10             	add    $0x10,%esp
c0002c24:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002c29:	83 ec 0c             	sub    $0xc,%esp
c0002c2c:	6a 0a                	push   $0xa
c0002c2e:	68 00 02 00 00       	push   $0x200
c0002c33:	50                   	push   %eax
c0002c34:	6a 20                	push   $0x20
c0002c36:	6a 01                	push   $0x1
c0002c38:	e8 05 fe ff ff       	call   c0002a42 <rd_wt>
c0002c3d:	83 c4 20             	add    $0x20,%esp
c0002c40:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002c43:	8b 10                	mov    (%eax),%edx
c0002c45:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002c48:	8b 50 04             	mov    0x4(%eax),%edx
c0002c4b:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002c4e:	8b 50 08             	mov    0x8(%eax),%edx
c0002c51:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002c54:	8b 50 0c             	mov    0xc(%eax),%edx
c0002c57:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002c5a:	8b 50 10             	mov    0x10(%eax),%edx
c0002c5d:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002c60:	8b 50 14             	mov    0x14(%eax),%edx
c0002c63:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002c66:	8b 50 18             	mov    0x18(%eax),%edx
c0002c69:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002c6c:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002c6f:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002c72:	8b 40 20             	mov    0x20(%eax),%eax
c0002c75:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002c78:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002c7c:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002c80:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002c85:	83 ec 04             	sub    $0x4,%esp
c0002c88:	6a 01                	push   $0x1
c0002c8a:	52                   	push   %edx
c0002c8b:	50                   	push   %eax
c0002c8c:	e8 cd 88 00 00       	call   c000b55e <Memset>
c0002c91:	83 c4 10             	add    $0x10,%esp
c0002c94:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002c99:	83 c0 01             	add    $0x1,%eax
c0002c9c:	83 ec 04             	sub    $0x4,%esp
c0002c9f:	68 ff 01 00 00       	push   $0x1ff
c0002ca4:	6a 80                	push   $0xffffff80
c0002ca6:	50                   	push   %eax
c0002ca7:	e8 b2 88 00 00       	call   c000b55e <Memset>
c0002cac:	83 c4 10             	add    $0x10,%esp
c0002caf:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002cb4:	83 ec 0c             	sub    $0xc,%esp
c0002cb7:	6a 0a                	push   $0xa
c0002cb9:	68 00 02 00 00       	push   $0x200
c0002cbe:	50                   	push   %eax
c0002cbf:	6a 20                	push   $0x20
c0002cc1:	6a 02                	push   $0x2
c0002cc3:	e8 7a fd ff ff       	call   c0002a42 <rd_wt>
c0002cc8:	83 c4 20             	add    $0x20,%esp
c0002ccb:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002cd2:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002cd7:	83 ec 04             	sub    $0x4,%esp
c0002cda:	68 00 02 00 00       	push   $0x200
c0002cdf:	6a ff                	push   $0xffffffff
c0002ce1:	50                   	push   %eax
c0002ce2:	e8 77 88 00 00       	call   c000b55e <Memset>
c0002ce7:	83 c4 10             	add    $0x10,%esp
c0002cea:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002cef:	83 ec 0c             	sub    $0xc,%esp
c0002cf2:	6a 0a                	push   $0xa
c0002cf4:	68 00 02 00 00       	push   $0x200
c0002cf9:	50                   	push   %eax
c0002cfa:	6a 20                	push   $0x20
c0002cfc:	ff 75 d0             	pushl  -0x30(%ebp)
c0002cff:	e8 3e fd ff ff       	call   c0002a42 <rd_wt>
c0002d04:	83 c4 20             	add    $0x20,%esp
c0002d07:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002d0c:	83 ec 04             	sub    $0x4,%esp
c0002d0f:	6a 01                	push   $0x1
c0002d11:	6a 01                	push   $0x1
c0002d13:	50                   	push   %eax
c0002d14:	e8 45 88 00 00       	call   c000b55e <Memset>
c0002d19:	83 c4 10             	add    $0x10,%esp
c0002d1c:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002d21:	83 c0 01             	add    $0x1,%eax
c0002d24:	83 ec 04             	sub    $0x4,%esp
c0002d27:	68 ff 01 00 00       	push   $0x1ff
c0002d2c:	6a 00                	push   $0x0
c0002d2e:	50                   	push   %eax
c0002d2f:	e8 2a 88 00 00       	call   c000b55e <Memset>
c0002d34:	83 c4 10             	add    $0x10,%esp
c0002d37:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002d3c:	89 c2                	mov    %eax,%edx
c0002d3e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002d41:	83 c0 01             	add    $0x1,%eax
c0002d44:	83 ec 0c             	sub    $0xc,%esp
c0002d47:	6a 0a                	push   $0xa
c0002d49:	68 00 02 00 00       	push   $0x200
c0002d4e:	52                   	push   %edx
c0002d4f:	6a 20                	push   $0x20
c0002d51:	50                   	push   %eax
c0002d52:	e8 eb fc ff ff       	call   c0002a42 <rd_wt>
c0002d57:	83 c4 20             	add    $0x20,%esp
c0002d5a:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d5d:	83 e8 02             	sub    $0x2,%eax
c0002d60:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002d63:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002d6a:	eb 04                	jmp    c0002d70 <mkfs+0x254>
c0002d6c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002d70:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002d73:	83 c0 01             	add    $0x1,%eax
c0002d76:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002d79:	7e f1                	jle    c0002d6c <mkfs+0x250>
c0002d7b:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002d80:	89 c2                	mov    %eax,%edx
c0002d82:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d85:	83 c0 03             	add    $0x3,%eax
c0002d88:	83 ec 0c             	sub    $0xc,%esp
c0002d8b:	6a 0a                	push   $0xa
c0002d8d:	68 00 02 00 00       	push   $0x200
c0002d92:	52                   	push   %edx
c0002d93:	6a 20                	push   $0x20
c0002d95:	50                   	push   %eax
c0002d96:	e8 a7 fc ff ff       	call   c0002a42 <rd_wt>
c0002d9b:	83 c4 20             	add    $0x20,%esp
c0002d9e:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002da3:	89 c2                	mov    %eax,%edx
c0002da5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002da8:	83 c0 03             	add    $0x3,%eax
c0002dab:	83 ec 0c             	sub    $0xc,%esp
c0002dae:	6a 07                	push   $0x7
c0002db0:	68 00 02 00 00       	push   $0x200
c0002db5:	52                   	push   %edx
c0002db6:	6a 20                	push   $0x20
c0002db8:	50                   	push   %eax
c0002db9:	e8 84 fc ff ff       	call   c0002a42 <rd_wt>
c0002dbe:	83 c4 20             	add    $0x20,%esp
c0002dc1:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002dc6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002dc9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dcc:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002dd2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dd5:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002ddc:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002ddf:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002de2:	89 50 08             	mov    %edx,0x8(%eax)
c0002de5:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002de8:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002def:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002df2:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002df9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dfc:	8b 10                	mov    (%eax),%edx
c0002dfe:	89 15 00 32 01 c0    	mov    %edx,0xc0013200
c0002e04:	8b 50 04             	mov    0x4(%eax),%edx
c0002e07:	89 15 04 32 01 c0    	mov    %edx,0xc0013204
c0002e0d:	8b 50 08             	mov    0x8(%eax),%edx
c0002e10:	89 15 08 32 01 c0    	mov    %edx,0xc0013208
c0002e16:	8b 50 0c             	mov    0xc(%eax),%edx
c0002e19:	89 15 0c 32 01 c0    	mov    %edx,0xc001320c
c0002e1f:	8b 50 10             	mov    0x10(%eax),%edx
c0002e22:	89 15 10 32 01 c0    	mov    %edx,0xc0013210
c0002e28:	8b 50 14             	mov    0x14(%eax),%edx
c0002e2b:	89 15 14 32 01 c0    	mov    %edx,0xc0013214
c0002e31:	8b 50 18             	mov    0x18(%eax),%edx
c0002e34:	89 15 18 32 01 c0    	mov    %edx,0xc0013218
c0002e3a:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002e3d:	89 15 1c 32 01 c0    	mov    %edx,0xc001321c
c0002e43:	8b 50 20             	mov    0x20(%eax),%edx
c0002e46:	89 15 20 32 01 c0    	mov    %edx,0xc0013220
c0002e4c:	8b 40 24             	mov    0x24(%eax),%eax
c0002e4f:	a3 24 32 01 c0       	mov    %eax,0xc0013224
c0002e54:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002e5b:	eb 4c                	jmp    c0002ea9 <mkfs+0x38d>
c0002e5d:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002e62:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002e65:	83 c2 01             	add    $0x1,%edx
c0002e68:	c1 e2 05             	shl    $0x5,%edx
c0002e6b:	01 d0                	add    %edx,%eax
c0002e6d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002e70:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e73:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002e79:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e7c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002e83:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e86:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002e8d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002e94:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002e97:	c1 e0 08             	shl    $0x8,%eax
c0002e9a:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002e9d:	89 c2                	mov    %eax,%edx
c0002e9f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ea2:	89 50 08             	mov    %edx,0x8(%eax)
c0002ea5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002ea9:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002ead:	7e ae                	jle    c0002e5d <mkfs+0x341>
c0002eaf:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002eb6:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002ebc:	b8 00 00 00 00       	mov    $0x0,%eax
c0002ec1:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002ec6:	89 d7                	mov    %edx,%edi
c0002ec8:	f3 ab                	rep stos %eax,%es:(%edi)
c0002eca:	c7 85 70 ff ff ff fc 	movl   $0xc000abfc,-0x90(%ebp)
c0002ed1:	ab 00 c0 
c0002ed4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002edb:	eb 54                	jmp    c0002f31 <mkfs+0x415>
c0002edd:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002ee2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002ee5:	83 c2 04             	add    $0x4,%edx
c0002ee8:	c1 e2 05             	shl    $0x5,%edx
c0002eeb:	01 d0                	add    %edx,%eax
c0002eed:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ef0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ef3:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002ef9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002efc:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002f03:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002f06:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002f09:	83 c2 01             	add    $0x1,%edx
c0002f0c:	c1 e2 0b             	shl    $0xb,%edx
c0002f0f:	01 c2                	add    %eax,%edx
c0002f11:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f14:	89 50 08             	mov    %edx,0x8(%eax)
c0002f17:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f1a:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f21:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f24:	8d 50 05             	lea    0x5(%eax),%edx
c0002f27:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f2a:	89 50 10             	mov    %edx,0x10(%eax)
c0002f2d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002f31:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f34:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002f37:	7c a4                	jl     c0002edd <mkfs+0x3c1>
c0002f39:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002f3e:	89 c2                	mov    %eax,%edx
c0002f40:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002f43:	83 c0 03             	add    $0x3,%eax
c0002f46:	83 ec 0c             	sub    $0xc,%esp
c0002f49:	6a 0a                	push   $0xa
c0002f4b:	68 00 02 00 00       	push   $0x200
c0002f50:	52                   	push   %edx
c0002f51:	6a 20                	push   $0x20
c0002f53:	50                   	push   %eax
c0002f54:	e8 e9 fa ff ff       	call   c0002a42 <rd_wt>
c0002f59:	83 c4 20             	add    $0x20,%esp
c0002f5c:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0002f61:	89 c2                	mov    %eax,%edx
c0002f63:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002f66:	83 ec 0c             	sub    $0xc,%esp
c0002f69:	6a 07                	push   $0x7
c0002f6b:	68 00 02 00 00       	push   $0x200
c0002f70:	52                   	push   %edx
c0002f71:	6a 20                	push   $0x20
c0002f73:	50                   	push   %eax
c0002f74:	e8 c9 fa ff ff       	call   c0002a42 <rd_wt>
c0002f79:	83 c4 20             	add    $0x20,%esp
c0002f7c:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002f83:	00 00 00 
c0002f86:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002f8d:	2e 00 
c0002f8f:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0002f94:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002f97:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f9a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002fa0:	83 ec 0c             	sub    $0xc,%esp
c0002fa3:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002fa9:	50                   	push   %eax
c0002faa:	e8 e8 85 00 00       	call   c000b597 <Strlen>
c0002faf:	83 c4 10             	add    $0x10,%esp
c0002fb2:	89 c1                	mov    %eax,%ecx
c0002fb4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002fb7:	8d 50 04             	lea    0x4(%eax),%edx
c0002fba:	83 ec 04             	sub    $0x4,%esp
c0002fbd:	51                   	push   %ecx
c0002fbe:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002fc4:	50                   	push   %eax
c0002fc5:	52                   	push   %edx
c0002fc6:	e8 65 85 00 00       	call   c000b530 <Memcpy>
c0002fcb:	83 c4 10             	add    $0x10,%esp
c0002fce:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002fd4:	b8 00 00 00 00       	mov    $0x0,%eax
c0002fd9:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002fde:	89 d7                	mov    %edx,%edi
c0002fe0:	f3 ab                	rep stos %eax,%es:(%edi)
c0002fe2:	c7 85 34 ff ff ff 08 	movl   $0xc000ac08,-0xcc(%ebp)
c0002fe9:	ac 00 c0 
c0002fec:	c7 85 38 ff ff ff 11 	movl   $0xc000ac11,-0xc8(%ebp)
c0002ff3:	ac 00 c0 
c0002ff6:	c7 85 3c ff ff ff 1a 	movl   $0xc000ac1a,-0xc4(%ebp)
c0002ffd:	ac 00 c0 
c0003000:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0003007:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000300e:	eb 49                	jmp    c0003059 <mkfs+0x53d>
c0003010:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003014:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003017:	8d 50 02             	lea    0x2(%eax),%edx
c000301a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000301d:	89 10                	mov    %edx,(%eax)
c000301f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003022:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003029:	83 ec 0c             	sub    $0xc,%esp
c000302c:	50                   	push   %eax
c000302d:	e8 65 85 00 00       	call   c000b597 <Strlen>
c0003032:	83 c4 10             	add    $0x10,%esp
c0003035:	89 c1                	mov    %eax,%ecx
c0003037:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000303a:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003041:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003044:	83 c2 04             	add    $0x4,%edx
c0003047:	83 ec 04             	sub    $0x4,%esp
c000304a:	51                   	push   %ecx
c000304b:	50                   	push   %eax
c000304c:	52                   	push   %edx
c000304d:	e8 de 84 00 00       	call   c000b530 <Memcpy>
c0003052:	83 c4 10             	add    $0x10,%esp
c0003055:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003059:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000305c:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c000305f:	7c af                	jl     c0003010 <mkfs+0x4f4>
c0003061:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003068:	eb 66                	jmp    c00030d0 <mkfs+0x5b4>
c000306a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000306d:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003074:	83 ec 0c             	sub    $0xc,%esp
c0003077:	50                   	push   %eax
c0003078:	e8 1a 85 00 00       	call   c000b597 <Strlen>
c000307d:	83 c4 10             	add    $0x10,%esp
c0003080:	85 c0                	test   %eax,%eax
c0003082:	74 47                	je     c00030cb <mkfs+0x5af>
c0003084:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003088:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000308b:	8d 50 05             	lea    0x5(%eax),%edx
c000308e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003091:	89 10                	mov    %edx,(%eax)
c0003093:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003096:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000309d:	83 ec 0c             	sub    $0xc,%esp
c00030a0:	50                   	push   %eax
c00030a1:	e8 f1 84 00 00       	call   c000b597 <Strlen>
c00030a6:	83 c4 10             	add    $0x10,%esp
c00030a9:	89 c1                	mov    %eax,%ecx
c00030ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00030ae:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00030b5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00030b8:	83 c2 04             	add    $0x4,%edx
c00030bb:	83 ec 04             	sub    $0x4,%esp
c00030be:	51                   	push   %ecx
c00030bf:	50                   	push   %eax
c00030c0:	52                   	push   %edx
c00030c1:	e8 6a 84 00 00       	call   c000b530 <Memcpy>
c00030c6:	83 c4 10             	add    $0x10,%esp
c00030c9:	eb 01                	jmp    c00030cc <mkfs+0x5b0>
c00030cb:	90                   	nop
c00030cc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00030d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00030d3:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00030d6:	7c 92                	jl     c000306a <mkfs+0x54e>
c00030d8:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c00030dd:	89 c2                	mov    %eax,%edx
c00030df:	8b 45 98             	mov    -0x68(%ebp),%eax
c00030e2:	83 ec 0c             	sub    $0xc,%esp
c00030e5:	6a 0a                	push   $0xa
c00030e7:	68 00 02 00 00       	push   $0x200
c00030ec:	52                   	push   %edx
c00030ed:	6a 20                	push   $0x20
c00030ef:	50                   	push   %eax
c00030f0:	e8 4d f9 ff ff       	call   c0002a42 <rd_wt>
c00030f5:	83 c4 20             	add    $0x20,%esp
c00030f8:	90                   	nop
c00030f9:	8b 7d fc             	mov    -0x4(%ebp),%edi
c00030fc:	c9                   	leave  
c00030fd:	c3                   	ret    

c00030fe <init_fs>:
c00030fe:	55                   	push   %ebp
c00030ff:	89 e5                	mov    %esp,%ebp
c0003101:	83 ec 18             	sub    $0x18,%esp
c0003104:	83 ec 0c             	sub    $0xc,%esp
c0003107:	6a 6c                	push   $0x6c
c0003109:	e8 ec 3d 00 00       	call   c0006efa <sys_malloc>
c000310e:	83 c4 10             	add    $0x10,%esp
c0003111:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003114:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003117:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c000311e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003121:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0003128:	83 ec 04             	sub    $0x4,%esp
c000312b:	6a 03                	push   $0x3
c000312d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003130:	6a 03                	push   $0x3
c0003132:	e8 10 6a 00 00       	call   c0009b47 <send_rec>
c0003137:	83 c4 10             	add    $0x10,%esp
c000313a:	e8 dd f9 ff ff       	call   c0002b1c <mkfs>
c000313f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003142:	83 ec 08             	sub    $0x8,%esp
c0003145:	6a 6c                	push   $0x6c
c0003147:	50                   	push   %eax
c0003148:	e8 eb 40 00 00       	call   c0007238 <sys_free>
c000314d:	83 c4 10             	add    $0x10,%esp
c0003150:	90                   	nop
c0003151:	c9                   	leave  
c0003152:	c3                   	ret    

c0003153 <do_open>:
c0003153:	55                   	push   %ebp
c0003154:	89 e5                	mov    %esp,%ebp
c0003156:	83 ec 68             	sub    $0x68,%esp
c0003159:	83 ec 04             	sub    $0x4,%esp
c000315c:	6a 0c                	push   $0xc
c000315e:	6a 00                	push   $0x0
c0003160:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003163:	50                   	push   %eax
c0003164:	e8 f5 83 00 00       	call   c000b55e <Memset>
c0003169:	83 c4 10             	add    $0x10,%esp
c000316c:	8b 45 08             	mov    0x8(%ebp),%eax
c000316f:	8b 40 34             	mov    0x34(%eax),%eax
c0003172:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003175:	83 ec 08             	sub    $0x8,%esp
c0003178:	6a 0c                	push   $0xc
c000317a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000317d:	e8 37 3c 00 00       	call   c0006db9 <alloc_virtual_memory>
c0003182:	83 c4 10             	add    $0x10,%esp
c0003185:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003188:	8b 45 08             	mov    0x8(%ebp),%eax
c000318b:	8b 40 30             	mov    0x30(%eax),%eax
c000318e:	89 c2                	mov    %eax,%edx
c0003190:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003193:	83 ec 04             	sub    $0x4,%esp
c0003196:	52                   	push   %edx
c0003197:	50                   	push   %eax
c0003198:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000319b:	50                   	push   %eax
c000319c:	e8 8f 83 00 00       	call   c000b530 <Memcpy>
c00031a1:	83 c4 10             	add    $0x10,%esp
c00031a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00031a7:	8b 40 30             	mov    0x30(%eax),%eax
c00031aa:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c00031af:	8b 45 08             	mov    0x8(%ebp),%eax
c00031b2:	8b 40 64             	mov    0x64(%eax),%eax
c00031b5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00031b8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00031bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00031c6:	eb 1f                	jmp    c00031e7 <do_open+0x94>
c00031c8:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c00031cd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00031d0:	83 c2 50             	add    $0x50,%edx
c00031d3:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00031d7:	85 c0                	test   %eax,%eax
c00031d9:	75 08                	jne    c00031e3 <do_open+0x90>
c00031db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00031de:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00031e1:	eb 0a                	jmp    c00031ed <do_open+0x9a>
c00031e3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00031e7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00031eb:	7e db                	jle    c00031c8 <do_open+0x75>
c00031ed:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c00031f1:	75 1c                	jne    c000320f <do_open+0xbc>
c00031f3:	68 bd 01 00 00       	push   $0x1bd
c00031f8:	68 30 ab 00 c0       	push   $0xc000ab30
c00031fd:	68 30 ab 00 c0       	push   $0xc000ab30
c0003202:	68 23 ac 00 c0       	push   $0xc000ac23
c0003207:	e8 dc 60 00 00       	call   c00092e8 <assertion_failure>
c000320c:	83 c4 10             	add    $0x10,%esp
c000320f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0003216:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000321d:	eb 1d                	jmp    c000323c <do_open+0xe9>
c000321f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003222:	c1 e0 04             	shl    $0x4,%eax
c0003225:	05 c8 23 01 c0       	add    $0xc00123c8,%eax
c000322a:	8b 00                	mov    (%eax),%eax
c000322c:	85 c0                	test   %eax,%eax
c000322e:	75 08                	jne    c0003238 <do_open+0xe5>
c0003230:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003233:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003236:	eb 0a                	jmp    c0003242 <do_open+0xef>
c0003238:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000323c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0003240:	7e dd                	jle    c000321f <do_open+0xcc>
c0003242:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0003246:	75 1c                	jne    c0003264 <do_open+0x111>
c0003248:	68 c9 01 00 00       	push   $0x1c9
c000324d:	68 30 ab 00 c0       	push   $0xc000ab30
c0003252:	68 30 ab 00 c0       	push   $0xc000ab30
c0003257:	68 2b ac 00 c0       	push   $0xc000ac2b
c000325c:	e8 87 60 00 00       	call   c00092e8 <assertion_failure>
c0003261:	83 c4 10             	add    $0x10,%esp
c0003264:	83 ec 0c             	sub    $0xc,%esp
c0003267:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000326a:	50                   	push   %eax
c000326b:	e8 b2 00 00 00       	call   c0003322 <search_file>
c0003270:	83 c4 10             	add    $0x10,%esp
c0003273:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003276:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000327a:	75 2b                	jne    c00032a7 <do_open+0x154>
c000327c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003280:	7e 10                	jle    c0003292 <do_open+0x13f>
c0003282:	83 ec 0c             	sub    $0xc,%esp
c0003285:	68 33 ac 00 c0       	push   $0xc000ac33
c000328a:	e8 3b 60 00 00       	call   c00092ca <panic>
c000328f:	83 c4 10             	add    $0x10,%esp
c0003292:	83 ec 08             	sub    $0x8,%esp
c0003295:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003298:	50                   	push   %eax
c0003299:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000329c:	50                   	push   %eax
c000329d:	e8 40 04 00 00       	call   c00036e2 <create_file>
c00032a2:	83 c4 10             	add    $0x10,%esp
c00032a5:	eb 22                	jmp    c00032c9 <do_open+0x176>
c00032a7:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c00032ab:	75 07                	jne    c00032b4 <do_open+0x161>
c00032ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00032b2:	eb 6c                	jmp    c0003320 <do_open+0x1cd>
c00032b4:	83 ec 08             	sub    $0x8,%esp
c00032b7:	ff 75 d8             	pushl  -0x28(%ebp)
c00032ba:	8d 45 9c             	lea    -0x64(%ebp),%eax
c00032bd:	50                   	push   %eax
c00032be:	e8 5d 02 00 00       	call   c0003520 <get_inode>
c00032c3:	83 c4 10             	add    $0x10,%esp
c00032c6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00032c9:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c00032ce:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00032d1:	c1 e2 04             	shl    $0x4,%edx
c00032d4:	8d 8a c0 23 01 c0    	lea    -0x3ffedc40(%edx),%ecx
c00032da:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00032dd:	83 c2 50             	add    $0x50,%edx
c00032e0:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c00032e4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00032e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00032ea:	c1 e2 04             	shl    $0x4,%edx
c00032ed:	81 c2 c8 23 01 c0    	add    $0xc00123c8,%edx
c00032f3:	89 02                	mov    %eax,(%edx)
c00032f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032f8:	c1 e0 04             	shl    $0x4,%eax
c00032fb:	05 c4 23 01 c0       	add    $0xc00123c4,%eax
c0003300:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003306:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003309:	c1 e0 04             	shl    $0x4,%eax
c000330c:	05 c0 23 01 c0       	add    $0xc00123c0,%eax
c0003311:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003317:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000331a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000331d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003320:	c9                   	leave  
c0003321:	c3                   	ret    

c0003322 <search_file>:
c0003322:	55                   	push   %ebp
c0003323:	89 e5                	mov    %esp,%ebp
c0003325:	83 ec 68             	sub    $0x68,%esp
c0003328:	83 ec 04             	sub    $0x4,%esp
c000332b:	6a 0c                	push   $0xc
c000332d:	6a 00                	push   $0x0
c000332f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003332:	50                   	push   %eax
c0003333:	e8 26 82 00 00       	call   c000b55e <Memset>
c0003338:	83 c4 10             	add    $0x10,%esp
c000333b:	83 ec 04             	sub    $0x4,%esp
c000333e:	6a 28                	push   $0x28
c0003340:	6a 00                	push   $0x0
c0003342:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003345:	50                   	push   %eax
c0003346:	e8 13 82 00 00       	call   c000b55e <Memset>
c000334b:	83 c4 10             	add    $0x10,%esp
c000334e:	83 ec 04             	sub    $0x4,%esp
c0003351:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003354:	50                   	push   %eax
c0003355:	ff 75 08             	pushl  0x8(%ebp)
c0003358:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000335b:	50                   	push   %eax
c000335c:	e8 f3 00 00 00       	call   c0003454 <strip_path>
c0003361:	83 c4 10             	add    $0x10,%esp
c0003364:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003367:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000336b:	75 0a                	jne    c0003377 <search_file+0x55>
c000336d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003372:	e9 db 00 00 00       	jmp    c0003452 <search_file+0x130>
c0003377:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000337a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000337d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003380:	05 00 02 00 00       	add    $0x200,%eax
c0003385:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000338b:	85 c0                	test   %eax,%eax
c000338d:	0f 48 c2             	cmovs  %edx,%eax
c0003390:	c1 f8 09             	sar    $0x9,%eax
c0003393:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003396:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003399:	c1 e8 04             	shr    $0x4,%eax
c000339c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000339f:	e8 63 14 00 00       	call   c0004807 <get_super_block>
c00033a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00033a7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00033aa:	8b 00                	mov    (%eax),%eax
c00033ac:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00033af:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c00033b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00033bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00033c4:	eb 7b                	jmp    c0003441 <search_file+0x11f>
c00033c6:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c00033cb:	89 c1                	mov    %eax,%ecx
c00033cd:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00033d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00033d3:	01 d0                	add    %edx,%eax
c00033d5:	83 ec 0c             	sub    $0xc,%esp
c00033d8:	6a 07                	push   $0x7
c00033da:	68 00 02 00 00       	push   $0x200
c00033df:	51                   	push   %ecx
c00033e0:	ff 75 cc             	pushl  -0x34(%ebp)
c00033e3:	50                   	push   %eax
c00033e4:	e8 59 f6 ff ff       	call   c0002a42 <rd_wt>
c00033e9:	83 c4 20             	add    $0x20,%esp
c00033ec:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c00033f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00033f4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00033fb:	eb 35                	jmp    c0003432 <search_file+0x110>
c00033fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003401:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003404:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003407:	7f 33                	jg     c000343c <search_file+0x11a>
c0003409:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000340c:	83 c0 04             	add    $0x4,%eax
c000340f:	83 ec 08             	sub    $0x8,%esp
c0003412:	50                   	push   %eax
c0003413:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003416:	50                   	push   %eax
c0003417:	e8 a2 6a 00 00       	call   c0009ebe <strcmp>
c000341c:	83 c4 10             	add    $0x10,%esp
c000341f:	85 c0                	test   %eax,%eax
c0003421:	75 07                	jne    c000342a <search_file+0x108>
c0003423:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003426:	8b 00                	mov    (%eax),%eax
c0003428:	eb 28                	jmp    c0003452 <search_file+0x130>
c000342a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000342e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003432:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003435:	83 f8 1f             	cmp    $0x1f,%eax
c0003438:	76 c3                	jbe    c00033fd <search_file+0xdb>
c000343a:	eb 01                	jmp    c000343d <search_file+0x11b>
c000343c:	90                   	nop
c000343d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003441:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003444:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003447:	0f 8c 79 ff ff ff    	jl     c00033c6 <search_file+0xa4>
c000344d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003452:	c9                   	leave  
c0003453:	c3                   	ret    

c0003454 <strip_path>:
c0003454:	55                   	push   %ebp
c0003455:	89 e5                	mov    %esp,%ebp
c0003457:	83 ec 10             	sub    $0x10,%esp
c000345a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000345e:	75 0a                	jne    c000346a <strip_path+0x16>
c0003460:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003465:	e9 b4 00 00 00       	jmp    c000351e <strip_path+0xca>
c000346a:	8b 45 08             	mov    0x8(%ebp),%eax
c000346d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003470:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003473:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003476:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003479:	0f b6 00             	movzbl (%eax),%eax
c000347c:	3c 2f                	cmp    $0x2f,%al
c000347e:	75 2d                	jne    c00034ad <strip_path+0x59>
c0003480:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003484:	eb 27                	jmp    c00034ad <strip_path+0x59>
c0003486:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003489:	0f b6 00             	movzbl (%eax),%eax
c000348c:	3c 2f                	cmp    $0x2f,%al
c000348e:	75 0a                	jne    c000349a <strip_path+0x46>
c0003490:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003495:	e9 84 00 00 00       	jmp    c000351e <strip_path+0xca>
c000349a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000349d:	0f b6 10             	movzbl (%eax),%edx
c00034a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00034a3:	88 10                	mov    %dl,(%eax)
c00034a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00034a9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00034ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00034b0:	0f b6 00             	movzbl (%eax),%eax
c00034b3:	84 c0                	test   %al,%al
c00034b5:	75 cf                	jne    c0003486 <strip_path+0x32>
c00034b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00034ba:	c6 00 00             	movb   $0x0,(%eax)
c00034bd:	8b 45 10             	mov    0x10(%ebp),%eax
c00034c0:	8b 15 00 32 01 c0    	mov    0xc0013200,%edx
c00034c6:	89 10                	mov    %edx,(%eax)
c00034c8:	8b 15 04 32 01 c0    	mov    0xc0013204,%edx
c00034ce:	89 50 04             	mov    %edx,0x4(%eax)
c00034d1:	8b 15 08 32 01 c0    	mov    0xc0013208,%edx
c00034d7:	89 50 08             	mov    %edx,0x8(%eax)
c00034da:	8b 15 0c 32 01 c0    	mov    0xc001320c,%edx
c00034e0:	89 50 0c             	mov    %edx,0xc(%eax)
c00034e3:	8b 15 10 32 01 c0    	mov    0xc0013210,%edx
c00034e9:	89 50 10             	mov    %edx,0x10(%eax)
c00034ec:	8b 15 14 32 01 c0    	mov    0xc0013214,%edx
c00034f2:	89 50 14             	mov    %edx,0x14(%eax)
c00034f5:	8b 15 18 32 01 c0    	mov    0xc0013218,%edx
c00034fb:	89 50 18             	mov    %edx,0x18(%eax)
c00034fe:	8b 15 1c 32 01 c0    	mov    0xc001321c,%edx
c0003504:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003507:	8b 15 20 32 01 c0    	mov    0xc0013220,%edx
c000350d:	89 50 20             	mov    %edx,0x20(%eax)
c0003510:	8b 15 24 32 01 c0    	mov    0xc0013224,%edx
c0003516:	89 50 24             	mov    %edx,0x24(%eax)
c0003519:	b8 00 00 00 00       	mov    $0x0,%eax
c000351e:	c9                   	leave  
c000351f:	c3                   	ret    

c0003520 <get_inode>:
c0003520:	55                   	push   %ebp
c0003521:	89 e5                	mov    %esp,%ebp
c0003523:	56                   	push   %esi
c0003524:	53                   	push   %ebx
c0003525:	83 ec 20             	sub    $0x20,%esp
c0003528:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000352c:	75 0a                	jne    c0003538 <get_inode+0x18>
c000352e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003533:	e9 a3 01 00 00       	jmp    c00036db <get_inode+0x1bb>
c0003538:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000353f:	c7 45 f0 e0 27 01 c0 	movl   $0xc00127e0,-0x10(%ebp)
c0003546:	eb 69                	jmp    c00035b1 <get_inode+0x91>
c0003548:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000354b:	8b 40 24             	mov    0x24(%eax),%eax
c000354e:	85 c0                	test   %eax,%eax
c0003550:	7e 53                	jle    c00035a5 <get_inode+0x85>
c0003552:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003555:	8b 40 10             	mov    0x10(%eax),%eax
c0003558:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000355b:	75 50                	jne    c00035ad <get_inode+0x8d>
c000355d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003560:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003563:	8b 0a                	mov    (%edx),%ecx
c0003565:	89 08                	mov    %ecx,(%eax)
c0003567:	8b 4a 04             	mov    0x4(%edx),%ecx
c000356a:	89 48 04             	mov    %ecx,0x4(%eax)
c000356d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003570:	89 48 08             	mov    %ecx,0x8(%eax)
c0003573:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003576:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003579:	8b 4a 10             	mov    0x10(%edx),%ecx
c000357c:	89 48 10             	mov    %ecx,0x10(%eax)
c000357f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003582:	89 48 14             	mov    %ecx,0x14(%eax)
c0003585:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003588:	89 48 18             	mov    %ecx,0x18(%eax)
c000358b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000358e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003591:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003594:	89 48 20             	mov    %ecx,0x20(%eax)
c0003597:	8b 52 24             	mov    0x24(%edx),%edx
c000359a:	89 50 24             	mov    %edx,0x24(%eax)
c000359d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035a0:	e9 36 01 00 00       	jmp    c00036db <get_inode+0x1bb>
c00035a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00035ab:	eb 0d                	jmp    c00035ba <get_inode+0x9a>
c00035ad:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c00035b1:	81 7d f0 e0 31 01 c0 	cmpl   $0xc00131e0,-0x10(%ebp)
c00035b8:	76 8e                	jbe    c0003548 <get_inode+0x28>
c00035ba:	e8 48 12 00 00       	call   c0004807 <get_super_block>
c00035bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00035c2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00035c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035cc:	8b 40 04             	mov    0x4(%eax),%eax
c00035cf:	8d 50 02             	lea    0x2(%eax),%edx
c00035d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035d5:	8b 40 08             	mov    0x8(%eax),%eax
c00035d8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00035db:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035de:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00035e1:	b8 00 02 00 00       	mov    $0x200,%eax
c00035e6:	99                   	cltd   
c00035e7:	f7 7d e8             	idivl  -0x18(%ebp)
c00035ea:	89 c6                	mov    %eax,%esi
c00035ec:	89 c8                	mov    %ecx,%eax
c00035ee:	99                   	cltd   
c00035ef:	f7 fe                	idiv   %esi
c00035f1:	01 d8                	add    %ebx,%eax
c00035f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00035f6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00035fd:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003602:	83 ec 0c             	sub    $0xc,%esp
c0003605:	6a 07                	push   $0x7
c0003607:	68 00 02 00 00       	push   $0x200
c000360c:	50                   	push   %eax
c000360d:	ff 75 e0             	pushl  -0x20(%ebp)
c0003610:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003613:	e8 2a f4 ff ff       	call   c0002a42 <rd_wt>
c0003618:	83 c4 20             	add    $0x20,%esp
c000361b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000361e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003621:	b8 00 02 00 00       	mov    $0x200,%eax
c0003626:	99                   	cltd   
c0003627:	f7 7d e8             	idivl  -0x18(%ebp)
c000362a:	89 c3                	mov    %eax,%ebx
c000362c:	89 c8                	mov    %ecx,%eax
c000362e:	99                   	cltd   
c000362f:	f7 fb                	idiv   %ebx
c0003631:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003634:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000363a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000363d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003641:	01 d0                	add    %edx,%eax
c0003643:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003646:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003649:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000364c:	8b 0a                	mov    (%edx),%ecx
c000364e:	89 08                	mov    %ecx,(%eax)
c0003650:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003653:	89 48 04             	mov    %ecx,0x4(%eax)
c0003656:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003659:	89 48 08             	mov    %ecx,0x8(%eax)
c000365c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000365f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003662:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003665:	89 48 10             	mov    %ecx,0x10(%eax)
c0003668:	8b 4a 14             	mov    0x14(%edx),%ecx
c000366b:	89 48 14             	mov    %ecx,0x14(%eax)
c000366e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003671:	89 48 18             	mov    %ecx,0x18(%eax)
c0003674:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003677:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000367a:	8b 4a 20             	mov    0x20(%edx),%ecx
c000367d:	89 48 20             	mov    %ecx,0x20(%eax)
c0003680:	8b 52 24             	mov    0x24(%edx),%edx
c0003683:	89 50 24             	mov    %edx,0x24(%eax)
c0003686:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003689:	8b 55 0c             	mov    0xc(%ebp),%edx
c000368c:	89 50 10             	mov    %edx,0x10(%eax)
c000368f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003692:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003695:	89 50 20             	mov    %edx,0x20(%eax)
c0003698:	8b 45 08             	mov    0x8(%ebp),%eax
c000369b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000369e:	8b 0a                	mov    (%edx),%ecx
c00036a0:	89 08                	mov    %ecx,(%eax)
c00036a2:	8b 4a 04             	mov    0x4(%edx),%ecx
c00036a5:	89 48 04             	mov    %ecx,0x4(%eax)
c00036a8:	8b 4a 08             	mov    0x8(%edx),%ecx
c00036ab:	89 48 08             	mov    %ecx,0x8(%eax)
c00036ae:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00036b1:	89 48 0c             	mov    %ecx,0xc(%eax)
c00036b4:	8b 4a 10             	mov    0x10(%edx),%ecx
c00036b7:	89 48 10             	mov    %ecx,0x10(%eax)
c00036ba:	8b 4a 14             	mov    0x14(%edx),%ecx
c00036bd:	89 48 14             	mov    %ecx,0x14(%eax)
c00036c0:	8b 4a 18             	mov    0x18(%edx),%ecx
c00036c3:	89 48 18             	mov    %ecx,0x18(%eax)
c00036c6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00036c9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00036cc:	8b 4a 20             	mov    0x20(%edx),%ecx
c00036cf:	89 48 20             	mov    %ecx,0x20(%eax)
c00036d2:	8b 52 24             	mov    0x24(%edx),%edx
c00036d5:	89 50 24             	mov    %edx,0x24(%eax)
c00036d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00036db:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00036de:	5b                   	pop    %ebx
c00036df:	5e                   	pop    %esi
c00036e0:	5d                   	pop    %ebp
c00036e1:	c3                   	ret    

c00036e2 <create_file>:
c00036e2:	55                   	push   %ebp
c00036e3:	89 e5                	mov    %esp,%ebp
c00036e5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00036eb:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00036ee:	50                   	push   %eax
c00036ef:	ff 75 0c             	pushl  0xc(%ebp)
c00036f2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00036f5:	50                   	push   %eax
c00036f6:	e8 59 fd ff ff       	call   c0003454 <strip_path>
c00036fb:	83 c4 0c             	add    $0xc,%esp
c00036fe:	83 f8 ff             	cmp    $0xffffffff,%eax
c0003701:	75 0a                	jne    c000370d <create_file+0x2b>
c0003703:	b8 00 00 00 00       	mov    $0x0,%eax
c0003708:	e9 de 00 00 00       	jmp    c00037eb <create_file+0x109>
c000370d:	e8 db 00 00 00       	call   c00037ed <alloc_imap_bit>
c0003712:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003715:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003719:	75 0a                	jne    c0003725 <create_file+0x43>
c000371b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003720:	e9 c6 00 00 00       	jmp    c00037eb <create_file+0x109>
c0003725:	e8 dd 10 00 00       	call   c0004807 <get_super_block>
c000372a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000372d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003730:	8b 40 10             	mov    0x10(%eax),%eax
c0003733:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003736:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003739:	83 ec 08             	sub    $0x8,%esp
c000373c:	50                   	push   %eax
c000373d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003740:	e8 a5 01 00 00       	call   c00038ea <alloc_smap_bit>
c0003745:	83 c4 10             	add    $0x10,%esp
c0003748:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000374b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000374f:	75 0a                	jne    c000375b <create_file+0x79>
c0003751:	b8 00 00 00 00       	mov    $0x0,%eax
c0003756:	e9 90 00 00 00       	jmp    c00037eb <create_file+0x109>
c000375b:	83 ec 04             	sub    $0x4,%esp
c000375e:	ff 75 e8             	pushl  -0x18(%ebp)
c0003761:	ff 75 f4             	pushl  -0xc(%ebp)
c0003764:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003767:	50                   	push   %eax
c0003768:	e8 1e 03 00 00       	call   c0003a8b <new_inode>
c000376d:	83 c4 10             	add    $0x10,%esp
c0003770:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003773:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003777:	75 07                	jne    c0003780 <create_file+0x9e>
c0003779:	b8 00 00 00 00       	mov    $0x0,%eax
c000377e:	eb 6b                	jmp    c00037eb <create_file+0x109>
c0003780:	ff 75 f4             	pushl  -0xc(%ebp)
c0003783:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003786:	50                   	push   %eax
c0003787:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000378a:	50                   	push   %eax
c000378b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003791:	50                   	push   %eax
c0003792:	e8 12 04 00 00       	call   c0003ba9 <new_dir_entry>
c0003797:	83 c4 10             	add    $0x10,%esp
c000379a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000379d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00037a1:	75 07                	jne    c00037aa <create_file+0xc8>
c00037a3:	b8 00 00 00 00       	mov    $0x0,%eax
c00037a8:	eb 41                	jmp    c00037eb <create_file+0x109>
c00037aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00037ad:	8b 55 84             	mov    -0x7c(%ebp),%edx
c00037b0:	89 10                	mov    %edx,(%eax)
c00037b2:	8b 55 88             	mov    -0x78(%ebp),%edx
c00037b5:	89 50 04             	mov    %edx,0x4(%eax)
c00037b8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c00037bb:	89 50 08             	mov    %edx,0x8(%eax)
c00037be:	8b 55 90             	mov    -0x70(%ebp),%edx
c00037c1:	89 50 0c             	mov    %edx,0xc(%eax)
c00037c4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00037c7:	89 50 10             	mov    %edx,0x10(%eax)
c00037ca:	8b 55 98             	mov    -0x68(%ebp),%edx
c00037cd:	89 50 14             	mov    %edx,0x14(%eax)
c00037d0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00037d3:	89 50 18             	mov    %edx,0x18(%eax)
c00037d6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00037d9:	89 50 1c             	mov    %edx,0x1c(%eax)
c00037dc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c00037df:	89 50 20             	mov    %edx,0x20(%eax)
c00037e2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00037e5:	89 50 24             	mov    %edx,0x24(%eax)
c00037e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00037eb:	c9                   	leave  
c00037ec:	c3                   	ret    

c00037ed <alloc_imap_bit>:
c00037ed:	55                   	push   %ebp
c00037ee:	89 e5                	mov    %esp,%ebp
c00037f0:	53                   	push   %ebx
c00037f1:	83 ec 24             	sub    $0x24,%esp
c00037f4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00037fb:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003802:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003807:	83 ec 0c             	sub    $0xc,%esp
c000380a:	6a 07                	push   $0x7
c000380c:	68 00 02 00 00       	push   $0x200
c0003811:	50                   	push   %eax
c0003812:	ff 75 e8             	pushl  -0x18(%ebp)
c0003815:	ff 75 ec             	pushl  -0x14(%ebp)
c0003818:	e8 25 f2 ff ff       	call   c0002a42 <rd_wt>
c000381d:	83 c4 20             	add    $0x20,%esp
c0003820:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003827:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000382e:	e9 a5 00 00 00       	jmp    c00038d8 <alloc_imap_bit+0xeb>
c0003833:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000383a:	e9 8b 00 00 00       	jmp    c00038ca <alloc_imap_bit+0xdd>
c000383f:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003845:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003848:	01 d0                	add    %edx,%eax
c000384a:	0f b6 00             	movzbl (%eax),%eax
c000384d:	0f be d0             	movsbl %al,%edx
c0003850:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003853:	89 c1                	mov    %eax,%ecx
c0003855:	d3 fa                	sar    %cl,%edx
c0003857:	89 d0                	mov    %edx,%eax
c0003859:	83 e0 01             	and    $0x1,%eax
c000385c:	85 c0                	test   %eax,%eax
c000385e:	74 06                	je     c0003866 <alloc_imap_bit+0x79>
c0003860:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003864:	eb 64                	jmp    c00038ca <alloc_imap_bit+0xdd>
c0003866:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000386c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000386f:	01 d0                	add    %edx,%eax
c0003871:	0f b6 18             	movzbl (%eax),%ebx
c0003874:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003877:	ba 01 00 00 00       	mov    $0x1,%edx
c000387c:	89 c1                	mov    %eax,%ecx
c000387e:	d3 e2                	shl    %cl,%edx
c0003880:	89 d0                	mov    %edx,%eax
c0003882:	89 c1                	mov    %eax,%ecx
c0003884:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000388a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000388d:	01 d0                	add    %edx,%eax
c000388f:	09 cb                	or     %ecx,%ebx
c0003891:	89 da                	mov    %ebx,%edx
c0003893:	88 10                	mov    %dl,(%eax)
c0003895:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003898:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000389f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00038a2:	01 d0                	add    %edx,%eax
c00038a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00038a7:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c00038ac:	83 ec 0c             	sub    $0xc,%esp
c00038af:	6a 0a                	push   $0xa
c00038b1:	68 00 02 00 00       	push   $0x200
c00038b6:	50                   	push   %eax
c00038b7:	ff 75 e8             	pushl  -0x18(%ebp)
c00038ba:	ff 75 ec             	pushl  -0x14(%ebp)
c00038bd:	e8 80 f1 ff ff       	call   c0002a42 <rd_wt>
c00038c2:	83 c4 20             	add    $0x20,%esp
c00038c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038c8:	eb 1b                	jmp    c00038e5 <alloc_imap_bit+0xf8>
c00038ca:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c00038ce:	0f 8e 6b ff ff ff    	jle    c000383f <alloc_imap_bit+0x52>
c00038d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00038d8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c00038df:	0f 8e 4e ff ff ff    	jle    c0003833 <alloc_imap_bit+0x46>
c00038e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00038e8:	c9                   	leave  
c00038e9:	c3                   	ret    

c00038ea <alloc_smap_bit>:
c00038ea:	55                   	push   %ebp
c00038eb:	89 e5                	mov    %esp,%ebp
c00038ed:	53                   	push   %ebx
c00038ee:	83 ec 34             	sub    $0x34,%esp
c00038f1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00038f5:	75 1c                	jne    c0003913 <alloc_smap_bit+0x29>
c00038f7:	68 f3 02 00 00       	push   $0x2f3
c00038fc:	68 30 ab 00 c0       	push   $0xc000ab30
c0003901:	68 30 ab 00 c0       	push   $0xc000ab30
c0003906:	68 40 ac 00 c0       	push   $0xc000ac40
c000390b:	e8 d8 59 00 00       	call   c00092e8 <assertion_failure>
c0003910:	83 c4 10             	add    $0x10,%esp
c0003913:	e8 ef 0e 00 00       	call   c0004807 <get_super_block>
c0003918:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000391b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000391e:	8b 40 08             	mov    0x8(%eax),%eax
c0003921:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003924:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003927:	8b 40 04             	mov    0x4(%eax),%eax
c000392a:	83 c0 02             	add    $0x2,%eax
c000392d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003930:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003937:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c000393e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003945:	e9 20 01 00 00       	jmp    c0003a6a <alloc_smap_bit+0x180>
c000394a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000394d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003950:	01 d0                	add    %edx,%eax
c0003952:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003955:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c000395a:	83 ec 0c             	sub    $0xc,%esp
c000395d:	6a 07                	push   $0x7
c000395f:	68 00 02 00 00       	push   $0x200
c0003964:	50                   	push   %eax
c0003965:	ff 75 d8             	pushl  -0x28(%ebp)
c0003968:	ff 75 d4             	pushl  -0x2c(%ebp)
c000396b:	e8 d2 f0 ff ff       	call   c0002a42 <rd_wt>
c0003970:	83 c4 20             	add    $0x20,%esp
c0003973:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000397a:	e9 b0 00 00 00       	jmp    c0003a2f <alloc_smap_bit+0x145>
c000397f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003986:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000398a:	0f 85 8c 00 00 00    	jne    c0003a1c <alloc_smap_bit+0x132>
c0003990:	eb 45                	jmp    c00039d7 <alloc_smap_bit+0xed>
c0003992:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003998:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000399b:	01 d0                	add    %edx,%eax
c000399d:	0f b6 00             	movzbl (%eax),%eax
c00039a0:	0f be d0             	movsbl %al,%edx
c00039a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039a6:	89 c1                	mov    %eax,%ecx
c00039a8:	d3 fa                	sar    %cl,%edx
c00039aa:	89 d0                	mov    %edx,%eax
c00039ac:	83 e0 01             	and    $0x1,%eax
c00039af:	85 c0                	test   %eax,%eax
c00039b1:	74 06                	je     c00039b9 <alloc_smap_bit+0xcf>
c00039b3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00039b7:	eb 1e                	jmp    c00039d7 <alloc_smap_bit+0xed>
c00039b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039bc:	c1 e0 09             	shl    $0x9,%eax
c00039bf:	89 c2                	mov    %eax,%edx
c00039c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039c4:	01 d0                	add    %edx,%eax
c00039c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00039cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039d0:	01 d0                	add    %edx,%eax
c00039d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00039d5:	eb 06                	jmp    c00039dd <alloc_smap_bit+0xf3>
c00039d7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00039db:	7e b5                	jle    c0003992 <alloc_smap_bit+0xa8>
c00039dd:	eb 3d                	jmp    c0003a1c <alloc_smap_bit+0x132>
c00039df:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00039e3:	74 45                	je     c0003a2a <alloc_smap_bit+0x140>
c00039e5:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00039eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039ee:	01 d0                	add    %edx,%eax
c00039f0:	0f b6 18             	movzbl (%eax),%ebx
c00039f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039f6:	ba 01 00 00 00       	mov    $0x1,%edx
c00039fb:	89 c1                	mov    %eax,%ecx
c00039fd:	d3 e2                	shl    %cl,%edx
c00039ff:	89 d0                	mov    %edx,%eax
c0003a01:	89 c1                	mov    %eax,%ecx
c0003a03:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003a09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003a0c:	01 d0                	add    %edx,%eax
c0003a0e:	09 cb                	or     %ecx,%ebx
c0003a10:	89 da                	mov    %ebx,%edx
c0003a12:	88 10                	mov    %dl,(%eax)
c0003a14:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003a18:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003a1c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a20:	74 09                	je     c0003a2b <alloc_smap_bit+0x141>
c0003a22:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003a26:	7e b7                	jle    c00039df <alloc_smap_bit+0xf5>
c0003a28:	eb 01                	jmp    c0003a2b <alloc_smap_bit+0x141>
c0003a2a:	90                   	nop
c0003a2b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003a2f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003a36:	0f 8e 43 ff ff ff    	jle    c000397f <alloc_smap_bit+0x95>
c0003a3c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a40:	74 1e                	je     c0003a60 <alloc_smap_bit+0x176>
c0003a42:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003a47:	83 ec 0c             	sub    $0xc,%esp
c0003a4a:	6a 0a                	push   $0xa
c0003a4c:	68 00 02 00 00       	push   $0x200
c0003a51:	50                   	push   %eax
c0003a52:	ff 75 d8             	pushl  -0x28(%ebp)
c0003a55:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003a58:	e8 e5 ef ff ff       	call   c0002a42 <rd_wt>
c0003a5d:	83 c4 20             	add    $0x20,%esp
c0003a60:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a64:	74 12                	je     c0003a78 <alloc_smap_bit+0x18e>
c0003a66:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003a6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a6d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003a70:	0f 8c d4 fe ff ff    	jl     c000394a <alloc_smap_bit+0x60>
c0003a76:	eb 01                	jmp    c0003a79 <alloc_smap_bit+0x18f>
c0003a78:	90                   	nop
c0003a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a7c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003a7f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a82:	8b 00                	mov    (%eax),%eax
c0003a84:	01 d0                	add    %edx,%eax
c0003a86:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a89:	c9                   	leave  
c0003a8a:	c3                   	ret    

c0003a8b <new_inode>:
c0003a8b:	55                   	push   %ebp
c0003a8c:	89 e5                	mov    %esp,%ebp
c0003a8e:	83 ec 38             	sub    $0x38,%esp
c0003a91:	83 ec 08             	sub    $0x8,%esp
c0003a94:	ff 75 0c             	pushl  0xc(%ebp)
c0003a97:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003a9a:	50                   	push   %eax
c0003a9b:	e8 80 fa ff ff       	call   c0003520 <get_inode>
c0003aa0:	83 c4 10             	add    $0x10,%esp
c0003aa3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003aa6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003aaa:	75 0a                	jne    c0003ab6 <new_inode+0x2b>
c0003aac:	b8 00 00 00 00       	mov    $0x0,%eax
c0003ab1:	e9 f1 00 00 00       	jmp    c0003ba7 <new_inode+0x11c>
c0003ab6:	8b 45 10             	mov    0x10(%ebp),%eax
c0003ab9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003abc:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003ac3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003aca:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003ad1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ad4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003ad7:	83 ec 0c             	sub    $0xc,%esp
c0003ada:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003add:	50                   	push   %eax
c0003ade:	e8 40 0b 00 00       	call   c0004623 <sync_inode>
c0003ae3:	83 c4 10             	add    $0x10,%esp
c0003ae6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003aed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003af4:	eb 1d                	jmp    c0003b13 <new_inode+0x88>
c0003af6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003af9:	89 d0                	mov    %edx,%eax
c0003afb:	c1 e0 02             	shl    $0x2,%eax
c0003afe:	01 d0                	add    %edx,%eax
c0003b00:	c1 e0 03             	shl    $0x3,%eax
c0003b03:	05 f0 27 01 c0       	add    $0xc00127f0,%eax
c0003b08:	8b 00                	mov    (%eax),%eax
c0003b0a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003b0d:	74 0c                	je     c0003b1b <new_inode+0x90>
c0003b0f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003b13:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003b17:	7e dd                	jle    c0003af6 <new_inode+0x6b>
c0003b19:	eb 01                	jmp    c0003b1c <new_inode+0x91>
c0003b1b:	90                   	nop
c0003b1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003b1f:	89 d0                	mov    %edx,%eax
c0003b21:	c1 e0 02             	shl    $0x2,%eax
c0003b24:	01 d0                	add    %edx,%eax
c0003b26:	c1 e0 03             	shl    $0x3,%eax
c0003b29:	05 e0 27 01 c0       	add    $0xc00127e0,%eax
c0003b2e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003b31:	89 10                	mov    %edx,(%eax)
c0003b33:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b36:	89 50 04             	mov    %edx,0x4(%eax)
c0003b39:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b3c:	89 50 08             	mov    %edx,0x8(%eax)
c0003b3f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b42:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b45:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b48:	89 50 10             	mov    %edx,0x10(%eax)
c0003b4b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b4e:	89 50 14             	mov    %edx,0x14(%eax)
c0003b51:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b54:	89 50 18             	mov    %edx,0x18(%eax)
c0003b57:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b5a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b5d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b60:	89 50 20             	mov    %edx,0x20(%eax)
c0003b63:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b66:	89 50 24             	mov    %edx,0x24(%eax)
c0003b69:	8b 45 08             	mov    0x8(%ebp),%eax
c0003b6c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003b6f:	89 10                	mov    %edx,(%eax)
c0003b71:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b74:	89 50 04             	mov    %edx,0x4(%eax)
c0003b77:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b7a:	89 50 08             	mov    %edx,0x8(%eax)
c0003b7d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b80:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b83:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b86:	89 50 10             	mov    %edx,0x10(%eax)
c0003b89:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b8c:	89 50 14             	mov    %edx,0x14(%eax)
c0003b8f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b92:	89 50 18             	mov    %edx,0x18(%eax)
c0003b95:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b98:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b9b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b9e:	89 50 20             	mov    %edx,0x20(%eax)
c0003ba1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003ba4:	89 50 24             	mov    %edx,0x24(%eax)
c0003ba7:	c9                   	leave  
c0003ba8:	c3                   	ret    

c0003ba9 <new_dir_entry>:
c0003ba9:	55                   	push   %ebp
c0003baa:	89 e5                	mov    %esp,%ebp
c0003bac:	83 ec 48             	sub    $0x48,%esp
c0003baf:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003bb9:	8b 40 04             	mov    0x4(%eax),%eax
c0003bbc:	99                   	cltd   
c0003bbd:	f7 7d dc             	idivl  -0x24(%ebp)
c0003bc0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003bc3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003bc6:	8b 40 0c             	mov    0xc(%eax),%eax
c0003bc9:	99                   	cltd   
c0003bca:	f7 7d dc             	idivl  -0x24(%ebp)
c0003bcd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003bd0:	e8 32 0c 00 00       	call   c0004807 <get_super_block>
c0003bd5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003bd8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003bdb:	8b 00                	mov    (%eax),%eax
c0003bdd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003be0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003be3:	8b 40 0c             	mov    0xc(%eax),%eax
c0003be6:	05 00 02 00 00       	add    $0x200,%eax
c0003beb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003bf1:	85 c0                	test   %eax,%eax
c0003bf3:	0f 48 c2             	cmovs  %edx,%eax
c0003bf6:	c1 f8 09             	sar    $0x9,%eax
c0003bf9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003bfc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003c03:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003c0a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003c11:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003c18:	eb 7f                	jmp    c0003c99 <new_dir_entry+0xf0>
c0003c1a:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003c1f:	89 c1                	mov    %eax,%ecx
c0003c21:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c24:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c27:	01 d0                	add    %edx,%eax
c0003c29:	83 ec 0c             	sub    $0xc,%esp
c0003c2c:	6a 07                	push   $0x7
c0003c2e:	68 00 02 00 00       	push   $0x200
c0003c33:	51                   	push   %ecx
c0003c34:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003c37:	50                   	push   %eax
c0003c38:	e8 05 ee ff ff       	call   c0002a42 <rd_wt>
c0003c3d:	83 c4 20             	add    $0x20,%esp
c0003c40:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c0003c45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c48:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003c4f:	eb 25                	jmp    c0003c76 <new_dir_entry+0xcd>
c0003c51:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003c55:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c58:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c5b:	7f 29                	jg     c0003c86 <new_dir_entry+0xdd>
c0003c5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c60:	8b 00                	mov    (%eax),%eax
c0003c62:	85 c0                	test   %eax,%eax
c0003c64:	75 08                	jne    c0003c6e <new_dir_entry+0xc5>
c0003c66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c6c:	eb 19                	jmp    c0003c87 <new_dir_entry+0xde>
c0003c6e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003c72:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003c76:	b8 00 02 00 00       	mov    $0x200,%eax
c0003c7b:	99                   	cltd   
c0003c7c:	f7 7d dc             	idivl  -0x24(%ebp)
c0003c7f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003c82:	7c cd                	jl     c0003c51 <new_dir_entry+0xa8>
c0003c84:	eb 01                	jmp    c0003c87 <new_dir_entry+0xde>
c0003c86:	90                   	nop
c0003c87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c8a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c8d:	7f 16                	jg     c0003ca5 <new_dir_entry+0xfc>
c0003c8f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003c93:	75 10                	jne    c0003ca5 <new_dir_entry+0xfc>
c0003c95:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003c99:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c9c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003c9f:	0f 8c 75 ff ff ff    	jl     c0003c1a <new_dir_entry+0x71>
c0003ca5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003ca8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003cab:	75 0a                	jne    c0003cb7 <new_dir_entry+0x10e>
c0003cad:	b8 00 00 00 00       	mov    $0x0,%eax
c0003cb2:	e9 fc 00 00 00       	jmp    c0003db3 <new_dir_entry+0x20a>
c0003cb7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003cbe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003cc2:	75 1e                	jne    c0003ce2 <new_dir_entry+0x139>
c0003cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003cc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003cca:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ccd:	8b 50 04             	mov    0x4(%eax),%edx
c0003cd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003cd3:	01 c2                	add    %eax,%edx
c0003cd5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cd8:	89 50 04             	mov    %edx,0x4(%eax)
c0003cdb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003ce5:	8b 55 14             	mov    0x14(%ebp),%edx
c0003ce8:	89 10                	mov    %edx,(%eax)
c0003cea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003ced:	83 c0 04             	add    $0x4,%eax
c0003cf0:	83 ec 08             	sub    $0x8,%esp
c0003cf3:	ff 75 10             	pushl  0x10(%ebp)
c0003cf6:	50                   	push   %eax
c0003cf7:	e8 81 78 00 00       	call   c000b57d <Strcpy>
c0003cfc:	83 c4 10             	add    $0x10,%esp
c0003cff:	8b 45 08             	mov    0x8(%ebp),%eax
c0003d02:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003d05:	8b 0a                	mov    (%edx),%ecx
c0003d07:	89 08                	mov    %ecx,(%eax)
c0003d09:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003d0c:	89 48 04             	mov    %ecx,0x4(%eax)
c0003d0f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003d12:	89 48 08             	mov    %ecx,0x8(%eax)
c0003d15:	8b 52 0c             	mov    0xc(%edx),%edx
c0003d18:	89 50 0c             	mov    %edx,0xc(%eax)
c0003d1b:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003d20:	89 c1                	mov    %eax,%ecx
c0003d22:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003d25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003d28:	01 d0                	add    %edx,%eax
c0003d2a:	83 ec 0c             	sub    $0xc,%esp
c0003d2d:	6a 0a                	push   $0xa
c0003d2f:	68 00 02 00 00       	push   $0x200
c0003d34:	51                   	push   %ecx
c0003d35:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003d38:	50                   	push   %eax
c0003d39:	e8 04 ed ff ff       	call   c0002a42 <rd_wt>
c0003d3e:	83 c4 20             	add    $0x20,%esp
c0003d41:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003d45:	74 69                	je     c0003db0 <new_dir_entry+0x207>
c0003d47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d4a:	8b 10                	mov    (%eax),%edx
c0003d4c:	89 15 00 32 01 c0    	mov    %edx,0xc0013200
c0003d52:	8b 50 04             	mov    0x4(%eax),%edx
c0003d55:	89 15 04 32 01 c0    	mov    %edx,0xc0013204
c0003d5b:	8b 50 08             	mov    0x8(%eax),%edx
c0003d5e:	89 15 08 32 01 c0    	mov    %edx,0xc0013208
c0003d64:	8b 50 0c             	mov    0xc(%eax),%edx
c0003d67:	89 15 0c 32 01 c0    	mov    %edx,0xc001320c
c0003d6d:	8b 50 10             	mov    0x10(%eax),%edx
c0003d70:	89 15 10 32 01 c0    	mov    %edx,0xc0013210
c0003d76:	8b 50 14             	mov    0x14(%eax),%edx
c0003d79:	89 15 14 32 01 c0    	mov    %edx,0xc0013214
c0003d7f:	8b 50 18             	mov    0x18(%eax),%edx
c0003d82:	89 15 18 32 01 c0    	mov    %edx,0xc0013218
c0003d88:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003d8b:	89 15 1c 32 01 c0    	mov    %edx,0xc001321c
c0003d91:	8b 50 20             	mov    0x20(%eax),%edx
c0003d94:	89 15 20 32 01 c0    	mov    %edx,0xc0013220
c0003d9a:	8b 40 24             	mov    0x24(%eax),%eax
c0003d9d:	a3 24 32 01 c0       	mov    %eax,0xc0013224
c0003da2:	83 ec 0c             	sub    $0xc,%esp
c0003da5:	ff 75 0c             	pushl  0xc(%ebp)
c0003da8:	e8 76 08 00 00       	call   c0004623 <sync_inode>
c0003dad:	83 c4 10             	add    $0x10,%esp
c0003db0:	8b 45 08             	mov    0x8(%ebp),%eax
c0003db3:	c9                   	leave  
c0003db4:	c3                   	ret    

c0003db5 <do_unlink>:
c0003db5:	55                   	push   %ebp
c0003db6:	89 e5                	mov    %esp,%ebp
c0003db8:	53                   	push   %ebx
c0003db9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003dbf:	83 ec 08             	sub    $0x8,%esp
c0003dc2:	ff 75 08             	pushl  0x8(%ebp)
c0003dc5:	68 55 ac 00 c0       	push   $0xc000ac55
c0003dca:	e8 ef 60 00 00       	call   c0009ebe <strcmp>
c0003dcf:	83 c4 10             	add    $0x10,%esp
c0003dd2:	85 c0                	test   %eax,%eax
c0003dd4:	75 10                	jne    c0003de6 <do_unlink+0x31>
c0003dd6:	83 ec 0c             	sub    $0xc,%esp
c0003dd9:	68 57 ac 00 c0       	push   $0xc000ac57
c0003dde:	e8 e7 54 00 00       	call   c00092ca <panic>
c0003de3:	83 c4 10             	add    $0x10,%esp
c0003de6:	83 ec 0c             	sub    $0xc,%esp
c0003de9:	ff 75 08             	pushl  0x8(%ebp)
c0003dec:	e8 31 f5 ff ff       	call   c0003322 <search_file>
c0003df1:	83 c4 10             	add    $0x10,%esp
c0003df4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003df7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003dfb:	75 10                	jne    c0003e0d <do_unlink+0x58>
c0003dfd:	83 ec 0c             	sub    $0xc,%esp
c0003e00:	68 73 ac 00 c0       	push   $0xc000ac73
c0003e05:	e8 c0 54 00 00       	call   c00092ca <panic>
c0003e0a:	83 c4 10             	add    $0x10,%esp
c0003e0d:	83 ec 08             	sub    $0x8,%esp
c0003e10:	ff 75 d0             	pushl  -0x30(%ebp)
c0003e13:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003e19:	50                   	push   %eax
c0003e1a:	e8 01 f7 ff ff       	call   c0003520 <get_inode>
c0003e1f:	83 c4 10             	add    $0x10,%esp
c0003e22:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003e25:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003e29:	75 10                	jne    c0003e3b <do_unlink+0x86>
c0003e2b:	83 ec 0c             	sub    $0xc,%esp
c0003e2e:	68 73 ac 00 c0       	push   $0xc000ac73
c0003e33:	e8 92 54 00 00       	call   c00092ca <panic>
c0003e38:	83 c4 10             	add    $0x10,%esp
c0003e3b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003e3e:	85 c0                	test   %eax,%eax
c0003e40:	7e 10                	jle    c0003e52 <do_unlink+0x9d>
c0003e42:	83 ec 0c             	sub    $0xc,%esp
c0003e45:	68 8c ac 00 c0       	push   $0xc000ac8c
c0003e4a:	e8 7b 54 00 00       	call   c00092ca <panic>
c0003e4f:	83 c4 10             	add    $0x10,%esp
c0003e52:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003e58:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003e5b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e5e:	8d 50 07             	lea    0x7(%eax),%edx
c0003e61:	85 c0                	test   %eax,%eax
c0003e63:	0f 48 c2             	cmovs  %edx,%eax
c0003e66:	c1 f8 03             	sar    $0x3,%eax
c0003e69:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003e6c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e6f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003e75:	85 c0                	test   %eax,%eax
c0003e77:	0f 48 c2             	cmovs  %edx,%eax
c0003e7a:	c1 f8 09             	sar    $0x9,%eax
c0003e7d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003e80:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e83:	99                   	cltd   
c0003e84:	c1 ea 1d             	shr    $0x1d,%edx
c0003e87:	01 d0                	add    %edx,%eax
c0003e89:	83 e0 07             	and    $0x7,%eax
c0003e8c:	29 d0                	sub    %edx,%eax
c0003e8e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003e91:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003e98:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003e9d:	89 c2                	mov    %eax,%edx
c0003e9f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003ea2:	83 c0 02             	add    $0x2,%eax
c0003ea5:	83 ec 0c             	sub    $0xc,%esp
c0003ea8:	6a 07                	push   $0x7
c0003eaa:	68 00 02 00 00       	push   $0x200
c0003eaf:	52                   	push   %edx
c0003eb0:	ff 75 b8             	pushl  -0x48(%ebp)
c0003eb3:	50                   	push   %eax
c0003eb4:	e8 89 eb ff ff       	call   c0002a42 <rd_wt>
c0003eb9:	83 c4 20             	add    $0x20,%esp
c0003ebc:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003ec2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003ec5:	01 d0                	add    %edx,%eax
c0003ec7:	0f b6 10             	movzbl (%eax),%edx
c0003eca:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003ecd:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003ed2:	89 c1                	mov    %eax,%ecx
c0003ed4:	d3 e3                	shl    %cl,%ebx
c0003ed6:	89 d8                	mov    %ebx,%eax
c0003ed8:	f7 d0                	not    %eax
c0003eda:	89 c3                	mov    %eax,%ebx
c0003edc:	8b 0d e4 31 01 c0    	mov    0xc00131e4,%ecx
c0003ee2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003ee5:	01 c8                	add    %ecx,%eax
c0003ee7:	21 da                	and    %ebx,%edx
c0003ee9:	88 10                	mov    %dl,(%eax)
c0003eeb:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003ef0:	89 c2                	mov    %eax,%edx
c0003ef2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003ef5:	83 c0 02             	add    $0x2,%eax
c0003ef8:	83 ec 0c             	sub    $0xc,%esp
c0003efb:	6a 0a                	push   $0xa
c0003efd:	68 00 02 00 00       	push   $0x200
c0003f02:	52                   	push   %edx
c0003f03:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f06:	50                   	push   %eax
c0003f07:	e8 36 eb ff ff       	call   c0002a42 <rd_wt>
c0003f0c:	83 c4 20             	add    $0x20,%esp
c0003f0f:	e8 f3 08 00 00       	call   c0004807 <get_super_block>
c0003f14:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003f17:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003f1d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f20:	8b 00                	mov    (%eax),%eax
c0003f22:	29 c2                	sub    %eax,%edx
c0003f24:	89 d0                	mov    %edx,%eax
c0003f26:	83 c0 01             	add    $0x1,%eax
c0003f29:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003f2c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003f2f:	8d 50 07             	lea    0x7(%eax),%edx
c0003f32:	85 c0                	test   %eax,%eax
c0003f34:	0f 48 c2             	cmovs  %edx,%eax
c0003f37:	c1 f8 03             	sar    $0x3,%eax
c0003f3a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003f3d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f40:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003f46:	85 c0                	test   %eax,%eax
c0003f48:	0f 48 c2             	cmovs  %edx,%eax
c0003f4b:	c1 f8 09             	sar    $0x9,%eax
c0003f4e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003f51:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003f54:	99                   	cltd   
c0003f55:	c1 ea 1d             	shr    $0x1d,%edx
c0003f58:	01 d0                	add    %edx,%eax
c0003f5a:	83 e0 07             	and    $0x7,%eax
c0003f5d:	29 d0                	sub    %edx,%eax
c0003f5f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003f62:	b8 08 00 00 00       	mov    $0x8,%eax
c0003f67:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003f6a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003f6d:	29 c2                	sub    %eax,%edx
c0003f6f:	89 d0                	mov    %edx,%eax
c0003f71:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003f74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f77:	8d 50 07             	lea    0x7(%eax),%edx
c0003f7a:	85 c0                	test   %eax,%eax
c0003f7c:	0f 48 c2             	cmovs  %edx,%eax
c0003f7f:	c1 f8 03             	sar    $0x3,%eax
c0003f82:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003f85:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0003f8a:	89 c1                	mov    %eax,%ecx
c0003f8c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f8f:	8b 40 04             	mov    0x4(%eax),%eax
c0003f92:	8d 50 02             	lea    0x2(%eax),%edx
c0003f95:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003f98:	01 d0                	add    %edx,%eax
c0003f9a:	83 ec 0c             	sub    $0xc,%esp
c0003f9d:	6a 07                	push   $0x7
c0003f9f:	68 00 02 00 00       	push   $0x200
c0003fa4:	51                   	push   %ecx
c0003fa5:	ff 75 b8             	pushl  -0x48(%ebp)
c0003fa8:	50                   	push   %eax
c0003fa9:	e8 94 ea ff ff       	call   c0002a42 <rd_wt>
c0003fae:	83 c4 20             	add    $0x20,%esp
c0003fb1:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003fb7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003fba:	01 d0                	add    %edx,%eax
c0003fbc:	0f b6 10             	movzbl (%eax),%edx
c0003fbf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003fc2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003fc7:	89 c1                	mov    %eax,%ecx
c0003fc9:	d3 e3                	shl    %cl,%ebx
c0003fcb:	89 d8                	mov    %ebx,%eax
c0003fcd:	f7 d0                	not    %eax
c0003fcf:	89 c3                	mov    %eax,%ebx
c0003fd1:	8b 0d e4 31 01 c0    	mov    0xc00131e4,%ecx
c0003fd7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003fda:	01 c8                	add    %ecx,%eax
c0003fdc:	21 da                	and    %ebx,%edx
c0003fde:	88 10                	mov    %dl,(%eax)
c0003fe0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003fe7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003fea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003fed:	eb 6b                	jmp    c000405a <do_unlink+0x2a5>
c0003fef:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003ff6:	75 4c                	jne    c0004044 <do_unlink+0x28f>
c0003ff8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003fff:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0004004:	83 ec 0c             	sub    $0xc,%esp
c0004007:	6a 0a                	push   $0xa
c0004009:	68 00 02 00 00       	push   $0x200
c000400e:	50                   	push   %eax
c000400f:	ff 75 b8             	pushl  -0x48(%ebp)
c0004012:	ff 75 ec             	pushl  -0x14(%ebp)
c0004015:	e8 28 ea ff ff       	call   c0002a42 <rd_wt>
c000401a:	83 c4 20             	add    $0x20,%esp
c000401d:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
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
c000403c:	e8 01 ea ff ff       	call   c0002a42 <rd_wt>
c0004041:	83 c4 20             	add    $0x20,%esp
c0004044:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000404a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000404d:	01 d0                	add    %edx,%eax
c000404f:	c6 00 00             	movb   $0x0,(%eax)
c0004052:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004056:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c000405a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000405d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0004060:	7c 8d                	jl     c0003fef <do_unlink+0x23a>
c0004062:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004069:	75 4c                	jne    c00040b7 <do_unlink+0x302>
c000406b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004072:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0004077:	83 ec 0c             	sub    $0xc,%esp
c000407a:	6a 0a                	push   $0xa
c000407c:	68 00 02 00 00       	push   $0x200
c0004081:	50                   	push   %eax
c0004082:	ff 75 b8             	pushl  -0x48(%ebp)
c0004085:	ff 75 ec             	pushl  -0x14(%ebp)
c0004088:	e8 b5 e9 ff ff       	call   c0002a42 <rd_wt>
c000408d:	83 c4 20             	add    $0x20,%esp
c0004090:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0004095:	89 c1                	mov    %eax,%ecx
c0004097:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000409a:	8d 50 01             	lea    0x1(%eax),%edx
c000409d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00040a0:	83 ec 0c             	sub    $0xc,%esp
c00040a3:	6a 07                	push   $0x7
c00040a5:	68 00 02 00 00       	push   $0x200
c00040aa:	51                   	push   %ecx
c00040ab:	ff 75 b8             	pushl  -0x48(%ebp)
c00040ae:	50                   	push   %eax
c00040af:	e8 8e e9 ff ff       	call   c0002a42 <rd_wt>
c00040b4:	83 c4 20             	add    $0x20,%esp
c00040b7:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00040bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00040c0:	01 d0                	add    %edx,%eax
c00040c2:	0f b6 10             	movzbl (%eax),%edx
c00040c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00040c8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00040cd:	89 c1                	mov    %eax,%ecx
c00040cf:	d3 e3                	shl    %cl,%ebx
c00040d1:	89 d8                	mov    %ebx,%eax
c00040d3:	89 c3                	mov    %eax,%ebx
c00040d5:	8b 0d e4 31 01 c0    	mov    0xc00131e4,%ecx
c00040db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00040de:	01 c8                	add    %ecx,%eax
c00040e0:	21 da                	and    %ebx,%edx
c00040e2:	88 10                	mov    %dl,(%eax)
c00040e4:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c00040e9:	83 ec 0c             	sub    $0xc,%esp
c00040ec:	6a 0a                	push   $0xa
c00040ee:	68 00 02 00 00       	push   $0x200
c00040f3:	50                   	push   %eax
c00040f4:	ff 75 b8             	pushl  -0x48(%ebp)
c00040f7:	ff 75 ec             	pushl  -0x14(%ebp)
c00040fa:	e8 43 e9 ff ff       	call   c0002a42 <rd_wt>
c00040ff:	83 c4 20             	add    $0x20,%esp
c0004102:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0004109:	00 00 00 
c000410c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0004113:	00 00 00 
c0004116:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c000411d:	00 00 00 
c0004120:	83 ec 0c             	sub    $0xc,%esp
c0004123:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0004129:	50                   	push   %eax
c000412a:	e8 f4 04 00 00       	call   c0004623 <sync_inode>
c000412f:	83 c4 10             	add    $0x10,%esp
c0004132:	83 ec 0c             	sub    $0xc,%esp
c0004135:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000413b:	50                   	push   %eax
c000413c:	e8 36 06 00 00       	call   c0004777 <put_inode>
c0004141:	83 c4 10             	add    $0x10,%esp
c0004144:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004147:	8b 00                	mov    (%eax),%eax
c0004149:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000414c:	c7 45 98 00 32 01 c0 	movl   $0xc0013200,-0x68(%ebp)
c0004153:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004156:	8b 40 04             	mov    0x4(%eax),%eax
c0004159:	89 45 94             	mov    %eax,-0x6c(%ebp)
c000415c:	8b 45 98             	mov    -0x68(%ebp),%eax
c000415f:	8b 40 0c             	mov    0xc(%eax),%eax
c0004162:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004165:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004168:	c1 e8 04             	shr    $0x4,%eax
c000416b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c000416e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004175:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000417c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004183:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000418a:	e9 a5 00 00 00       	jmp    c0004234 <do_unlink+0x47f>
c000418f:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0004194:	89 c1                	mov    %eax,%ecx
c0004196:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004199:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000419c:	01 d0                	add    %edx,%eax
c000419e:	83 ec 0c             	sub    $0xc,%esp
c00041a1:	6a 07                	push   $0x7
c00041a3:	68 00 02 00 00       	push   $0x200
c00041a8:	51                   	push   %ecx
c00041a9:	ff 75 b8             	pushl  -0x48(%ebp)
c00041ac:	50                   	push   %eax
c00041ad:	e8 90 e8 ff ff       	call   c0002a42 <rd_wt>
c00041b2:	83 c4 20             	add    $0x20,%esp
c00041b5:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c00041ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00041bd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00041c4:	eb 51                	jmp    c0004217 <do_unlink+0x462>
c00041c6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00041ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041cd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00041d0:	7f 4f                	jg     c0004221 <do_unlink+0x46c>
c00041d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00041d5:	83 c0 10             	add    $0x10,%eax
c00041d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00041db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00041de:	83 c0 04             	add    $0x4,%eax
c00041e1:	83 ec 08             	sub    $0x8,%esp
c00041e4:	ff 75 08             	pushl  0x8(%ebp)
c00041e7:	50                   	push   %eax
c00041e8:	e8 d1 5c 00 00       	call   c0009ebe <strcmp>
c00041ed:	83 c4 10             	add    $0x10,%esp
c00041f0:	85 c0                	test   %eax,%eax
c00041f2:	75 1b                	jne    c000420f <do_unlink+0x45a>
c00041f4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00041fb:	83 ec 04             	sub    $0x4,%esp
c00041fe:	6a 10                	push   $0x10
c0004200:	6a 00                	push   $0x0
c0004202:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004205:	e8 54 73 00 00       	call   c000b55e <Memset>
c000420a:	83 c4 10             	add    $0x10,%esp
c000420d:	eb 13                	jmp    c0004222 <do_unlink+0x46d>
c000420f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0004213:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0004217:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000421a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000421d:	7c a7                	jl     c00041c6 <do_unlink+0x411>
c000421f:	eb 01                	jmp    c0004222 <do_unlink+0x46d>
c0004221:	90                   	nop
c0004222:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004225:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004228:	7f 16                	jg     c0004240 <do_unlink+0x48b>
c000422a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000422e:	75 10                	jne    c0004240 <do_unlink+0x48b>
c0004230:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0004234:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004237:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000423a:	0f 8c 4f ff ff ff    	jl     c000418f <do_unlink+0x3da>
c0004240:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004243:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004246:	75 17                	jne    c000425f <do_unlink+0x4aa>
c0004248:	8b 45 98             	mov    -0x68(%ebp),%eax
c000424b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000424e:	89 50 04             	mov    %edx,0x4(%eax)
c0004251:	83 ec 0c             	sub    $0xc,%esp
c0004254:	ff 75 98             	pushl  -0x68(%ebp)
c0004257:	e8 c7 03 00 00       	call   c0004623 <sync_inode>
c000425c:	83 c4 10             	add    $0x10,%esp
c000425f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004263:	74 26                	je     c000428b <do_unlink+0x4d6>
c0004265:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c000426a:	89 c1                	mov    %eax,%ecx
c000426c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000426f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004272:	01 d0                	add    %edx,%eax
c0004274:	83 ec 0c             	sub    $0xc,%esp
c0004277:	6a 0a                	push   $0xa
c0004279:	68 00 02 00 00       	push   $0x200
c000427e:	51                   	push   %ecx
c000427f:	ff 75 b8             	pushl  -0x48(%ebp)
c0004282:	50                   	push   %eax
c0004283:	e8 ba e7 ff ff       	call   c0002a42 <rd_wt>
c0004288:	83 c4 20             	add    $0x20,%esp
c000428b:	90                   	nop
c000428c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000428f:	c9                   	leave  
c0004290:	c3                   	ret    

c0004291 <do_rdwt>:
c0004291:	55                   	push   %ebp
c0004292:	89 e5                	mov    %esp,%ebp
c0004294:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000429a:	8b 45 08             	mov    0x8(%ebp),%eax
c000429d:	8b 40 68             	mov    0x68(%eax),%eax
c00042a0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00042a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a6:	8b 40 50             	mov    0x50(%eax),%eax
c00042a9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00042ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00042af:	8b 40 5c             	mov    0x5c(%eax),%eax
c00042b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00042b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00042b8:	8b 00                	mov    (%eax),%eax
c00042ba:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00042bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00042c0:	8b 40 10             	mov    0x10(%eax),%eax
c00042c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00042c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00042c9:	8b 40 40             	mov    0x40(%eax),%eax
c00042cc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00042cf:	83 ec 0c             	sub    $0xc,%esp
c00042d2:	ff 75 cc             	pushl  -0x34(%ebp)
c00042d5:	e8 61 07 00 00       	call   c0004a3b <pid2proc>
c00042da:	83 c4 10             	add    $0x10,%esp
c00042dd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00042e0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00042e3:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c00042e6:	83 c2 50             	add    $0x50,%edx
c00042e9:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00042ed:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00042f0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00042f3:	8b 40 08             	mov    0x8(%eax),%eax
c00042f6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00042f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00042fc:	8b 00                	mov    (%eax),%eax
c00042fe:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0004301:	83 ec 08             	sub    $0x8,%esp
c0004304:	ff 75 b8             	pushl  -0x48(%ebp)
c0004307:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c000430d:	50                   	push   %eax
c000430e:	e8 0d f2 ff ff       	call   c0003520 <get_inode>
c0004313:	83 c4 10             	add    $0x10,%esp
c0004316:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0004319:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c000431d:	75 10                	jne    c000432f <do_rdwt+0x9e>
c000431f:	83 ec 0c             	sub    $0xc,%esp
c0004322:	68 c4 ac 00 c0       	push   $0xc000acc4
c0004327:	e8 9e 4f 00 00       	call   c00092ca <panic>
c000432c:	83 c4 10             	add    $0x10,%esp
c000432f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004335:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004338:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000433b:	8b 40 04             	mov    0x4(%eax),%eax
c000433e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004341:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004345:	74 22                	je     c0004369 <do_rdwt+0xd8>
c0004347:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000434b:	74 1c                	je     c0004369 <do_rdwt+0xd8>
c000434d:	68 9e 04 00 00       	push   $0x49e
c0004352:	68 30 ab 00 c0       	push   $0xc000ab30
c0004357:	68 30 ab 00 c0       	push   $0xc000ab30
c000435c:	68 d4 ac 00 c0       	push   $0xc000acd4
c0004361:	e8 82 4f 00 00       	call   c00092e8 <assertion_failure>
c0004366:	83 c4 10             	add    $0x10,%esp
c0004369:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000436f:	83 f8 01             	cmp    $0x1,%eax
c0004372:	0f 85 86 00 00 00    	jne    c00043fe <do_rdwt+0x16d>
c0004378:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000437c:	75 09                	jne    c0004387 <do_rdwt+0xf6>
c000437e:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c0004385:	eb 0d                	jmp    c0004394 <do_rdwt+0x103>
c0004387:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c000438b:	75 07                	jne    c0004394 <do_rdwt+0x103>
c000438d:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c0004394:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004397:	8b 45 08             	mov    0x8(%ebp),%eax
c000439a:	89 50 68             	mov    %edx,0x68(%eax)
c000439d:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c00043a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00043a3:	89 50 58             	mov    %edx,0x58(%eax)
c00043a6:	83 ec 04             	sub    $0x4,%esp
c00043a9:	6a 02                	push   $0x2
c00043ab:	ff 75 08             	pushl  0x8(%ebp)
c00043ae:	6a 03                	push   $0x3
c00043b0:	e8 92 57 00 00       	call   c0009b47 <send_rec>
c00043b5:	83 c4 10             	add    $0x10,%esp
c00043b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00043bb:	8b 40 68             	mov    0x68(%eax),%eax
c00043be:	83 f8 66             	cmp    $0x66,%eax
c00043c1:	75 13                	jne    c00043d6 <do_rdwt+0x145>
c00043c3:	83 ec 04             	sub    $0x4,%esp
c00043c6:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043c9:	ff 75 08             	pushl  0x8(%ebp)
c00043cc:	6a 01                	push   $0x1
c00043ce:	e8 74 57 00 00       	call   c0009b47 <send_rec>
c00043d3:	83 c4 10             	add    $0x10,%esp
c00043d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043d9:	8b 40 68             	mov    0x68(%eax),%eax
c00043dc:	83 f8 65             	cmp    $0x65,%eax
c00043df:	75 13                	jne    c00043f4 <do_rdwt+0x163>
c00043e1:	83 ec 04             	sub    $0x4,%esp
c00043e4:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043e7:	ff 75 08             	pushl  0x8(%ebp)
c00043ea:	6a 01                	push   $0x1
c00043ec:	e8 56 57 00 00       	call   c0009b47 <send_rec>
c00043f1:	83 c4 10             	add    $0x10,%esp
c00043f4:	b8 00 00 00 00       	mov    $0x0,%eax
c00043f9:	e9 23 02 00 00       	jmp    c0004621 <do_rdwt+0x390>
c00043fe:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004402:	75 18                	jne    c000441c <do_rdwt+0x18b>
c0004404:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000440a:	c1 e0 09             	shl    $0x9,%eax
c000440d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0004410:	75 0a                	jne    c000441c <do_rdwt+0x18b>
c0004412:	b8 00 00 00 00       	mov    $0x0,%eax
c0004417:	e9 05 02 00 00       	jmp    c0004621 <do_rdwt+0x390>
c000441c:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004420:	75 1b                	jne    c000443d <do_rdwt+0x1ac>
c0004422:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004429:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000442c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000442f:	01 d0                	add    %edx,%eax
c0004431:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004434:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c0004438:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000443b:	eb 19                	jmp    c0004456 <do_rdwt+0x1c5>
c000443d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004440:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004443:	01 c2                	add    %eax,%edx
c0004445:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000444b:	c1 e0 09             	shl    $0x9,%eax
c000444e:	39 c2                	cmp    %eax,%edx
c0004450:	0f 4e c2             	cmovle %edx,%eax
c0004453:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004456:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004459:	99                   	cltd   
c000445a:	c1 ea 17             	shr    $0x17,%edx
c000445d:	01 d0                	add    %edx,%eax
c000445f:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004464:	29 d0                	sub    %edx,%eax
c0004466:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004469:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000446f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004472:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004478:	85 c0                	test   %eax,%eax
c000447a:	0f 48 c1             	cmovs  %ecx,%eax
c000447d:	c1 f8 09             	sar    $0x9,%eax
c0004480:	01 d0                	add    %edx,%eax
c0004482:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004485:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000448b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000448e:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004494:	85 c0                	test   %eax,%eax
c0004496:	0f 48 c1             	cmovs  %ecx,%eax
c0004499:	c1 f8 09             	sar    $0x9,%eax
c000449c:	01 d0                	add    %edx,%eax
c000449e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00044a1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00044a4:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00044a7:	ba 00 00 10 00       	mov    $0x100000,%edx
c00044ac:	39 d0                	cmp    %edx,%eax
c00044ae:	7d 0b                	jge    c00044bb <do_rdwt+0x22a>
c00044b0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00044b3:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00044b6:	83 c0 01             	add    $0x1,%eax
c00044b9:	eb 05                	jmp    c00044c0 <do_rdwt+0x22f>
c00044bb:	b8 00 00 10 00       	mov    $0x100000,%eax
c00044c0:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00044c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00044c9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00044d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00044d3:	8b 00                	mov    (%eax),%eax
c00044d5:	83 ec 0c             	sub    $0xc,%esp
c00044d8:	50                   	push   %eax
c00044d9:	e8 5d 05 00 00       	call   c0004a3b <pid2proc>
c00044de:	83 c4 10             	add    $0x10,%esp
c00044e1:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00044e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044e7:	83 ec 08             	sub    $0x8,%esp
c00044ea:	50                   	push   %eax
c00044eb:	ff 75 c8             	pushl  -0x38(%ebp)
c00044ee:	e8 c6 28 00 00       	call   c0006db9 <alloc_virtual_memory>
c00044f3:	83 c4 10             	add    $0x10,%esp
c00044f6:	89 45 98             	mov    %eax,-0x68(%ebp)
c00044f9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00044fc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00044ff:	e9 c5 00 00 00       	jmp    c00045c9 <do_rdwt+0x338>
c0004504:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004507:	c1 e0 09             	shl    $0x9,%eax
c000450a:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000450d:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0004510:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c0004514:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004517:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c000451e:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004522:	75 46                	jne    c000456a <do_rdwt+0x2d9>
c0004524:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004527:	c1 e0 09             	shl    $0x9,%eax
c000452a:	8b 15 c4 27 01 c0    	mov    0xc00127c4,%edx
c0004530:	83 ec 0c             	sub    $0xc,%esp
c0004533:	6a 07                	push   $0x7
c0004535:	50                   	push   %eax
c0004536:	52                   	push   %edx
c0004537:	ff 75 90             	pushl  -0x70(%ebp)
c000453a:	ff 75 dc             	pushl  -0x24(%ebp)
c000453d:	e8 00 e5 ff ff       	call   c0002a42 <rd_wt>
c0004542:	83 c4 20             	add    $0x20,%esp
c0004545:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000454b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000454e:	01 d0                	add    %edx,%eax
c0004550:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004553:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004556:	01 ca                	add    %ecx,%edx
c0004558:	83 ec 04             	sub    $0x4,%esp
c000455b:	ff 75 94             	pushl  -0x6c(%ebp)
c000455e:	50                   	push   %eax
c000455f:	52                   	push   %edx
c0004560:	e8 cb 6f 00 00       	call   c000b530 <Memcpy>
c0004565:	83 c4 10             	add    $0x10,%esp
c0004568:	eb 46                	jmp    c00045b0 <do_rdwt+0x31f>
c000456a:	8b 55 98             	mov    -0x68(%ebp),%edx
c000456d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004570:	01 d0                	add    %edx,%eax
c0004572:	89 c1                	mov    %eax,%ecx
c0004574:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000457a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000457d:	01 d0                	add    %edx,%eax
c000457f:	83 ec 04             	sub    $0x4,%esp
c0004582:	ff 75 94             	pushl  -0x6c(%ebp)
c0004585:	51                   	push   %ecx
c0004586:	50                   	push   %eax
c0004587:	e8 a4 6f 00 00       	call   c000b530 <Memcpy>
c000458c:	83 c4 10             	add    $0x10,%esp
c000458f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004592:	c1 e0 09             	shl    $0x9,%eax
c0004595:	8b 15 c4 27 01 c0    	mov    0xc00127c4,%edx
c000459b:	83 ec 0c             	sub    $0xc,%esp
c000459e:	6a 0a                	push   $0xa
c00045a0:	50                   	push   %eax
c00045a1:	52                   	push   %edx
c00045a2:	ff 75 90             	pushl  -0x70(%ebp)
c00045a5:	ff 75 dc             	pushl  -0x24(%ebp)
c00045a8:	e8 95 e4 ff ff       	call   c0002a42 <rd_wt>
c00045ad:	83 c4 20             	add    $0x20,%esp
c00045b0:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00045b3:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c00045b6:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00045b9:	01 45 e0             	add    %eax,-0x20(%ebp)
c00045bc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00045c3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00045c6:	01 45 dc             	add    %eax,-0x24(%ebp)
c00045c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045cc:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c00045cf:	7f 0a                	jg     c00045db <do_rdwt+0x34a>
c00045d1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00045d5:	0f 85 29 ff ff ff    	jne    c0004504 <do_rdwt+0x273>
c00045db:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045de:	8b 50 04             	mov    0x4(%eax),%edx
c00045e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045e4:	01 c2                	add    %eax,%edx
c00045e6:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045e9:	89 50 04             	mov    %edx,0x4(%eax)
c00045ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045ef:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045f2:	01 c2                	add    %eax,%edx
c00045f4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00045fa:	39 c2                	cmp    %eax,%edx
c00045fc:	7e 20                	jle    c000461e <do_rdwt+0x38d>
c00045fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004601:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004604:	01 d0                	add    %edx,%eax
c0004606:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c000460c:	83 ec 0c             	sub    $0xc,%esp
c000460f:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004615:	50                   	push   %eax
c0004616:	e8 08 00 00 00       	call   c0004623 <sync_inode>
c000461b:	83 c4 10             	add    $0x10,%esp
c000461e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004621:	c9                   	leave  
c0004622:	c3                   	ret    

c0004623 <sync_inode>:
c0004623:	55                   	push   %ebp
c0004624:	89 e5                	mov    %esp,%ebp
c0004626:	53                   	push   %ebx
c0004627:	83 ec 34             	sub    $0x34,%esp
c000462a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004631:	eb 74                	jmp    c00046a7 <sync_inode+0x84>
c0004633:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004636:	89 d0                	mov    %edx,%eax
c0004638:	c1 e0 02             	shl    $0x2,%eax
c000463b:	01 d0                	add    %edx,%eax
c000463d:	c1 e0 03             	shl    $0x3,%eax
c0004640:	05 f0 27 01 c0       	add    $0xc00127f0,%eax
c0004645:	8b 10                	mov    (%eax),%edx
c0004647:	8b 45 08             	mov    0x8(%ebp),%eax
c000464a:	8b 40 10             	mov    0x10(%eax),%eax
c000464d:	39 c2                	cmp    %eax,%edx
c000464f:	75 52                	jne    c00046a3 <sync_inode+0x80>
c0004651:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004654:	89 d0                	mov    %edx,%eax
c0004656:	c1 e0 02             	shl    $0x2,%eax
c0004659:	01 d0                	add    %edx,%eax
c000465b:	c1 e0 03             	shl    $0x3,%eax
c000465e:	8d 90 e0 27 01 c0    	lea    -0x3ffed820(%eax),%edx
c0004664:	8b 45 08             	mov    0x8(%ebp),%eax
c0004667:	8b 08                	mov    (%eax),%ecx
c0004669:	89 0a                	mov    %ecx,(%edx)
c000466b:	8b 48 04             	mov    0x4(%eax),%ecx
c000466e:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004671:	8b 48 08             	mov    0x8(%eax),%ecx
c0004674:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004677:	8b 48 0c             	mov    0xc(%eax),%ecx
c000467a:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000467d:	8b 48 10             	mov    0x10(%eax),%ecx
c0004680:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004683:	8b 48 14             	mov    0x14(%eax),%ecx
c0004686:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004689:	8b 48 18             	mov    0x18(%eax),%ecx
c000468c:	89 4a 18             	mov    %ecx,0x18(%edx)
c000468f:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004692:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004695:	8b 48 20             	mov    0x20(%eax),%ecx
c0004698:	89 4a 20             	mov    %ecx,0x20(%edx)
c000469b:	8b 40 24             	mov    0x24(%eax),%eax
c000469e:	89 42 24             	mov    %eax,0x24(%edx)
c00046a1:	eb 0a                	jmp    c00046ad <sync_inode+0x8a>
c00046a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00046a7:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00046ab:	7e 86                	jle    c0004633 <sync_inode+0x10>
c00046ad:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c00046b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00046b7:	8b 40 10             	mov    0x10(%eax),%eax
c00046ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00046bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046c0:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00046c3:	b8 00 02 00 00       	mov    $0x200,%eax
c00046c8:	99                   	cltd   
c00046c9:	f7 7d f0             	idivl  -0x10(%ebp)
c00046cc:	89 c3                	mov    %eax,%ebx
c00046ce:	89 c8                	mov    %ecx,%eax
c00046d0:	99                   	cltd   
c00046d1:	f7 fb                	idiv   %ebx
c00046d3:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00046d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046d9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00046dc:	b8 00 02 00 00       	mov    $0x200,%eax
c00046e1:	99                   	cltd   
c00046e2:	f7 7d f0             	idivl  -0x10(%ebp)
c00046e5:	89 c3                	mov    %eax,%ebx
c00046e7:	89 c8                	mov    %ecx,%eax
c00046e9:	99                   	cltd   
c00046ea:	f7 fb                	idiv   %ebx
c00046ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00046ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00046f2:	8b 40 20             	mov    0x20(%eax),%eax
c00046f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00046f8:	e8 0a 01 00 00       	call   c0004807 <get_super_block>
c00046fd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004700:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004703:	8b 40 04             	mov    0x4(%eax),%eax
c0004706:	8d 50 02             	lea    0x2(%eax),%edx
c0004709:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000470c:	8b 40 08             	mov    0x8(%eax),%eax
c000470f:	01 c2                	add    %eax,%edx
c0004711:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004714:	01 d0                	add    %edx,%eax
c0004716:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004719:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c000471e:	83 ec 0c             	sub    $0xc,%esp
c0004721:	6a 07                	push   $0x7
c0004723:	68 00 02 00 00       	push   $0x200
c0004728:	50                   	push   %eax
c0004729:	ff 75 e0             	pushl  -0x20(%ebp)
c000472c:	ff 75 d8             	pushl  -0x28(%ebp)
c000472f:	e8 0e e3 ff ff       	call   c0002a42 <rd_wt>
c0004734:	83 c4 20             	add    $0x20,%esp
c0004737:	a1 e4 31 01 c0       	mov    0xc00131e4,%eax
c000473c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000473f:	83 ec 04             	sub    $0x4,%esp
c0004742:	ff 75 f0             	pushl  -0x10(%ebp)
c0004745:	ff 75 08             	pushl  0x8(%ebp)
c0004748:	ff 75 d4             	pushl  -0x2c(%ebp)
c000474b:	e8 e0 6d 00 00       	call   c000b530 <Memcpy>
c0004750:	83 c4 10             	add    $0x10,%esp
c0004753:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0004758:	83 ec 0c             	sub    $0xc,%esp
c000475b:	6a 0a                	push   $0xa
c000475d:	68 00 02 00 00       	push   $0x200
c0004762:	50                   	push   %eax
c0004763:	ff 75 e0             	pushl  -0x20(%ebp)
c0004766:	ff 75 d8             	pushl  -0x28(%ebp)
c0004769:	e8 d4 e2 ff ff       	call   c0002a42 <rd_wt>
c000476e:	83 c4 20             	add    $0x20,%esp
c0004771:	90                   	nop
c0004772:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004775:	c9                   	leave  
c0004776:	c3                   	ret    

c0004777 <put_inode>:
c0004777:	55                   	push   %ebp
c0004778:	89 e5                	mov    %esp,%ebp
c000477a:	83 ec 08             	sub    $0x8,%esp
c000477d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004780:	8b 40 24             	mov    0x24(%eax),%eax
c0004783:	85 c0                	test   %eax,%eax
c0004785:	7f 1c                	jg     c00047a3 <put_inode+0x2c>
c0004787:	68 42 05 00 00       	push   $0x542
c000478c:	68 30 ab 00 c0       	push   $0xc000ab30
c0004791:	68 30 ab 00 c0       	push   $0xc000ab30
c0004796:	68 08 ad 00 c0       	push   $0xc000ad08
c000479b:	e8 48 4b 00 00       	call   c00092e8 <assertion_failure>
c00047a0:	83 c4 10             	add    $0x10,%esp
c00047a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00047a6:	8b 40 24             	mov    0x24(%eax),%eax
c00047a9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00047ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00047af:	89 50 24             	mov    %edx,0x24(%eax)
c00047b2:	90                   	nop
c00047b3:	c9                   	leave  
c00047b4:	c3                   	ret    

c00047b5 <do_close>:
c00047b5:	55                   	push   %ebp
c00047b6:	89 e5                	mov    %esp,%ebp
c00047b8:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c00047bd:	8b 55 08             	mov    0x8(%ebp),%edx
c00047c0:	83 c2 50             	add    $0x50,%edx
c00047c3:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00047c7:	8b 50 0c             	mov    0xc(%eax),%edx
c00047ca:	83 ea 01             	sub    $0x1,%edx
c00047cd:	89 50 0c             	mov    %edx,0xc(%eax)
c00047d0:	8b 40 0c             	mov    0xc(%eax),%eax
c00047d3:	85 c0                	test   %eax,%eax
c00047d5:	75 16                	jne    c00047ed <do_close+0x38>
c00047d7:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c00047dc:	8b 55 08             	mov    0x8(%ebp),%edx
c00047df:	83 c2 50             	add    $0x50,%edx
c00047e2:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00047e6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00047ed:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c00047f2:	8b 55 08             	mov    0x8(%ebp),%edx
c00047f5:	83 c2 50             	add    $0x50,%edx
c00047f8:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c00047ff:	00 
c0004800:	b8 00 00 00 00       	mov    $0x0,%eax
c0004805:	5d                   	pop    %ebp
c0004806:	c3                   	ret    

c0004807 <get_super_block>:
c0004807:	55                   	push   %ebp
c0004808:	89 e5                	mov    %esp,%ebp
c000480a:	83 ec 08             	sub    $0x8,%esp
c000480d:	a1 c4 27 01 c0       	mov    0xc00127c4,%eax
c0004812:	83 ec 0c             	sub    $0xc,%esp
c0004815:	6a 07                	push   $0x7
c0004817:	68 00 02 00 00       	push   $0x200
c000481c:	50                   	push   %eax
c000481d:	6a 20                	push   $0x20
c000481f:	6a 01                	push   $0x1
c0004821:	e8 1c e2 ff ff       	call   c0002a42 <rd_wt>
c0004826:	83 c4 20             	add    $0x20,%esp
c0004829:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c000482f:	a1 e0 31 01 c0       	mov    0xc00131e0,%eax
c0004834:	8b 0a                	mov    (%edx),%ecx
c0004836:	89 08                	mov    %ecx,(%eax)
c0004838:	8b 4a 04             	mov    0x4(%edx),%ecx
c000483b:	89 48 04             	mov    %ecx,0x4(%eax)
c000483e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0004841:	89 48 08             	mov    %ecx,0x8(%eax)
c0004844:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004847:	89 48 0c             	mov    %ecx,0xc(%eax)
c000484a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000484d:	89 48 10             	mov    %ecx,0x10(%eax)
c0004850:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004853:	89 48 14             	mov    %ecx,0x14(%eax)
c0004856:	8b 4a 18             	mov    0x18(%edx),%ecx
c0004859:	89 48 18             	mov    %ecx,0x18(%eax)
c000485c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000485f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004862:	8b 52 20             	mov    0x20(%edx),%edx
c0004865:	89 50 20             	mov    %edx,0x20(%eax)
c0004868:	a1 e0 31 01 c0       	mov    0xc00131e0,%eax
c000486d:	c9                   	leave  
c000486e:	c3                   	ret    

c000486f <check>:
c000486f:	55                   	push   %ebp
c0004870:	89 e5                	mov    %esp,%ebp
c0004872:	83 ec 18             	sub    $0x18,%esp
c0004875:	c7 45 f4 40 33 08 c0 	movl   $0xc0083340,-0xc(%ebp)
c000487c:	eb 59                	jmp    c00048d7 <check+0x68>
c000487e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004881:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0004887:	85 c0                	test   %eax,%eax
c0004889:	74 45                	je     c00048d0 <check+0x61>
c000488b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000488e:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0004894:	83 f8 01             	cmp    $0x1,%eax
c0004897:	74 37                	je     c00048d0 <check+0x61>
c0004899:	c7 05 80 f7 00 c0 02 	movl   $0x2802,0xc000f780
c00048a0:	28 00 00 
c00048a3:	83 ec 08             	sub    $0x8,%esp
c00048a6:	6a 0a                	push   $0xa
c00048a8:	68 17 ad 00 c0       	push   $0xc000ad17
c00048ad:	e8 15 cd ff ff       	call   c00015c7 <disp_str_colour>
c00048b2:	83 c4 10             	add    $0x10,%esp
c00048b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048b8:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00048bf:	0f be c0             	movsbl %al,%eax
c00048c2:	83 ec 0c             	sub    $0xc,%esp
c00048c5:	50                   	push   %eax
c00048c6:	e8 07 32 00 00       	call   c0007ad2 <disp_int>
c00048cb:	83 c4 10             	add    $0x10,%esp
c00048ce:	eb fe                	jmp    c00048ce <check+0x5f>
c00048d0:	81 45 f4 b0 02 00 00 	addl   $0x2b0,-0xc(%ebp)
c00048d7:	b8 00 3e 08 c0       	mov    $0xc0083e00,%eax
c00048dc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00048df:	72 9d                	jb     c000487e <check+0xf>
c00048e1:	90                   	nop
c00048e2:	c9                   	leave  
c00048e3:	c3                   	ret    

c00048e4 <schedule_process>:
c00048e4:	55                   	push   %ebp
c00048e5:	89 e5                	mov    %esp,%ebp
c00048e7:	83 ec 28             	sub    $0x28,%esp
c00048ea:	e8 b7 cf ff ff       	call   c00018a6 <get_running_thread_pcb>
c00048ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048f2:	83 ec 0c             	sub    $0xc,%esp
c00048f5:	68 cc fd 00 c0       	push   $0xc000fdcc
c00048fa:	e8 f4 5c 00 00       	call   c000a5f3 <isListEmpty>
c00048ff:	83 c4 10             	add    $0x10,%esp
c0004902:	3c 01                	cmp    $0x1,%al
c0004904:	75 08                	jne    c000490e <schedule_process+0x2a>
c0004906:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004909:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000490c:	eb 56                	jmp    c0004964 <schedule_process+0x80>
c000490e:	83 ec 0c             	sub    $0xc,%esp
c0004911:	68 cc fd 00 c0       	push   $0xc000fdcc
c0004916:	e8 f7 5d 00 00       	call   c000a712 <popFromDoubleLinkList>
c000491b:	83 c4 10             	add    $0x10,%esp
c000491e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004921:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004924:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004929:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000492c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004930:	74 32                	je     c0004964 <schedule_process+0x80>
c0004932:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004935:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004938:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000493b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004942:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004945:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000494b:	83 f8 06             	cmp    $0x6,%eax
c000494e:	75 14                	jne    c0004964 <schedule_process+0x80>
c0004950:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004953:	05 34 01 00 00       	add    $0x134,%eax
c0004958:	83 ec 0c             	sub    $0xc,%esp
c000495b:	50                   	push   %eax
c000495c:	e8 2b cc ff ff       	call   c000158c <disp_str>
c0004961:	83 c4 10             	add    $0x10,%esp
c0004964:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004967:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000496e:	84 c0                	test   %al,%al
c0004970:	75 19                	jne    c000498b <schedule_process+0xa7>
c0004972:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004975:	05 00 01 00 00       	add    $0x100,%eax
c000497a:	83 ec 08             	sub    $0x8,%esp
c000497d:	50                   	push   %eax
c000497e:	68 cc fd 00 c0       	push   $0xc000fdcc
c0004983:	e8 35 5d 00 00       	call   c000a6bd <insertToDoubleLinkList>
c0004988:	83 c4 10             	add    $0x10,%esp
c000498b:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c0004992:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004995:	8b 40 08             	mov    0x8(%eax),%eax
c0004998:	85 c0                	test   %eax,%eax
c000499a:	74 23                	je     c00049bf <schedule_process+0xdb>
c000499c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000499f:	83 ec 0c             	sub    $0xc,%esp
c00049a2:	50                   	push   %eax
c00049a3:	e8 ed ce ff ff       	call   c0001895 <update_tss>
c00049a8:	83 c4 10             	add    $0x10,%esp
c00049ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049ae:	8b 40 08             	mov    0x8(%eax),%eax
c00049b1:	83 ec 0c             	sub    $0xc,%esp
c00049b4:	50                   	push   %eax
c00049b5:	e8 ce ce ff ff       	call   c0001888 <update_cr3>
c00049ba:	83 c4 10             	add    $0x10,%esp
c00049bd:	eb 0f                	jmp    c00049ce <schedule_process+0xea>
c00049bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00049c2:	83 ec 0c             	sub    $0xc,%esp
c00049c5:	50                   	push   %eax
c00049c6:	e8 bd ce ff ff       	call   c0001888 <update_cr3>
c00049cb:	83 c4 10             	add    $0x10,%esp
c00049ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049d1:	a3 a0 fb 00 c0       	mov    %eax,0xc000fba0
c00049d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049d9:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c00049df:	83 f8 06             	cmp    $0x6,%eax
c00049e2:	75 1f                	jne    c0004a03 <schedule_process+0x11f>
c00049e4:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c00049eb:	00 00 00 
c00049ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049f1:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c00049f7:	83 ec 0c             	sub    $0xc,%esp
c00049fa:	50                   	push   %eax
c00049fb:	e8 d2 30 00 00       	call   c0007ad2 <disp_int>
c0004a00:	83 c4 10             	add    $0x10,%esp
c0004a03:	83 ec 08             	sub    $0x8,%esp
c0004a06:	ff 75 f4             	pushl  -0xc(%ebp)
c0004a09:	ff 75 f0             	pushl  -0x10(%ebp)
c0004a0c:	e8 9f 5b 00 00       	call   c000a5b0 <switch_to>
c0004a11:	83 c4 10             	add    $0x10,%esp
c0004a14:	90                   	nop
c0004a15:	c9                   	leave  
c0004a16:	c3                   	ret    

c0004a17 <clock_handler>:
c0004a17:	55                   	push   %ebp
c0004a18:	89 e5                	mov    %esp,%ebp
c0004a1a:	83 ec 08             	sub    $0x8,%esp
c0004a1d:	a1 e0 16 01 c0       	mov    0xc00116e0,%eax
c0004a22:	85 c0                	test   %eax,%eax
c0004a24:	74 0d                	je     c0004a33 <clock_handler+0x1c>
c0004a26:	83 ec 0c             	sub    $0xc,%esp
c0004a29:	6a 02                	push   $0x2
c0004a2b:	e8 c1 53 00 00       	call   c0009df1 <inform_int>
c0004a30:	83 c4 10             	add    $0x10,%esp
c0004a33:	e8 ac fe ff ff       	call   c00048e4 <schedule_process>
c0004a38:	90                   	nop
c0004a39:	c9                   	leave  
c0004a3a:	c3                   	ret    

c0004a3b <pid2proc>:
c0004a3b:	55                   	push   %ebp
c0004a3c:	89 e5                	mov    %esp,%ebp
c0004a3e:	83 ec 20             	sub    $0x20,%esp
c0004a41:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004a48:	a1 18 1f 01 c0       	mov    0xc0011f18,%eax
c0004a4d:	8b 15 1c 1f 01 c0    	mov    0xc0011f1c,%edx
c0004a53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a56:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004a59:	a1 20 1f 01 c0       	mov    0xc0011f20,%eax
c0004a5e:	8b 15 24 1f 01 c0    	mov    0xc0011f24,%edx
c0004a64:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004a67:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004a6a:	a1 1c 1f 01 c0       	mov    0xc0011f1c,%eax
c0004a6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a72:	eb 29                	jmp    c0004a9d <pid2proc+0x62>
c0004a74:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a77:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004a7c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a7f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a82:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004a88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a8b:	39 c2                	cmp    %eax,%edx
c0004a8d:	75 05                	jne    c0004a94 <pid2proc+0x59>
c0004a8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a92:	eb 17                	jmp    c0004aab <pid2proc+0x70>
c0004a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a97:	8b 40 04             	mov    0x4(%eax),%eax
c0004a9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a9d:	81 7d fc 20 1f 01 c0 	cmpl   $0xc0011f20,-0x4(%ebp)
c0004aa4:	75 ce                	jne    c0004a74 <pid2proc+0x39>
c0004aa6:	b8 00 00 00 00       	mov    $0x0,%eax
c0004aab:	c9                   	leave  
c0004aac:	c3                   	ret    

c0004aad <proc2pid>:
c0004aad:	55                   	push   %ebp
c0004aae:	89 e5                	mov    %esp,%ebp
c0004ab0:	83 ec 10             	sub    $0x10,%esp
c0004ab3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ab6:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004abc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004abf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ac2:	c9                   	leave  
c0004ac3:	c3                   	ret    

c0004ac4 <InitDescriptor>:
c0004ac4:	55                   	push   %ebp
c0004ac5:	89 e5                	mov    %esp,%ebp
c0004ac7:	83 ec 04             	sub    $0x4,%esp
c0004aca:	8b 45 14             	mov    0x14(%ebp),%eax
c0004acd:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004ad1:	8b 45 10             	mov    0x10(%ebp),%eax
c0004ad4:	89 c2                	mov    %eax,%edx
c0004ad6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ad9:	66 89 10             	mov    %dx,(%eax)
c0004adc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004adf:	89 c2                	mov    %eax,%edx
c0004ae1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ae4:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004ae8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004aeb:	c1 e8 10             	shr    $0x10,%eax
c0004aee:	89 c2                	mov    %eax,%edx
c0004af0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004af3:	88 50 04             	mov    %dl,0x4(%eax)
c0004af6:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004afa:	89 c2                	mov    %eax,%edx
c0004afc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004aff:	88 50 05             	mov    %dl,0x5(%eax)
c0004b02:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004b06:	66 c1 e8 08          	shr    $0x8,%ax
c0004b0a:	c1 e0 04             	shl    $0x4,%eax
c0004b0d:	89 c2                	mov    %eax,%edx
c0004b0f:	8b 45 10             	mov    0x10(%ebp),%eax
c0004b12:	c1 e8 10             	shr    $0x10,%eax
c0004b15:	83 e0 0f             	and    $0xf,%eax
c0004b18:	09 c2                	or     %eax,%edx
c0004b1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b1d:	88 50 06             	mov    %dl,0x6(%eax)
c0004b20:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b23:	c1 e8 18             	shr    $0x18,%eax
c0004b26:	89 c2                	mov    %eax,%edx
c0004b28:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b2b:	88 50 07             	mov    %dl,0x7(%eax)
c0004b2e:	90                   	nop
c0004b2f:	c9                   	leave  
c0004b30:	c3                   	ret    

c0004b31 <Seg2PhyAddr>:
c0004b31:	55                   	push   %ebp
c0004b32:	89 e5                	mov    %esp,%ebp
c0004b34:	83 ec 10             	sub    $0x10,%esp
c0004b37:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b3a:	c1 e8 03             	shr    $0x3,%eax
c0004b3d:	8b 14 c5 a4 f7 00 c0 	mov    -0x3fff085c(,%eax,8),%edx
c0004b44:	8b 04 c5 a0 f7 00 c0 	mov    -0x3fff0860(,%eax,8),%eax
c0004b4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b4e:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b51:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b55:	0f b7 c0             	movzwl %ax,%eax
c0004b58:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004b5c:	0f b6 d2             	movzbl %dl,%edx
c0004b5f:	c1 e2 10             	shl    $0x10,%edx
c0004b62:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004b68:	09 d0                	or     %edx,%eax
c0004b6a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b70:	c9                   	leave  
c0004b71:	c3                   	ret    

c0004b72 <Seg2PhyAddrLDT>:
c0004b72:	55                   	push   %ebp
c0004b73:	89 e5                	mov    %esp,%ebp
c0004b75:	83 ec 10             	sub    $0x10,%esp
c0004b78:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b7b:	c1 e8 03             	shr    $0x3,%eax
c0004b7e:	89 c2                	mov    %eax,%edx
c0004b80:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b83:	83 c2 22             	add    $0x22,%edx
c0004b86:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004b8a:	8b 02                	mov    (%edx),%eax
c0004b8c:	8b 52 04             	mov    0x4(%edx),%edx
c0004b8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b92:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b95:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b99:	0f b7 c0             	movzwl %ax,%eax
c0004b9c:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004ba0:	0f b6 d2             	movzbl %dl,%edx
c0004ba3:	c1 e2 10             	shl    $0x10,%edx
c0004ba6:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004bac:	09 d0                	or     %edx,%eax
c0004bae:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004bb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bb4:	c9                   	leave  
c0004bb5:	c3                   	ret    

c0004bb6 <VirAddr2PhyAddr>:
c0004bb6:	55                   	push   %ebp
c0004bb7:	89 e5                	mov    %esp,%ebp
c0004bb9:	83 ec 10             	sub    $0x10,%esp
c0004bbc:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004bbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bc2:	01 d0                	add    %edx,%eax
c0004bc4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004bc7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bca:	c9                   	leave  
c0004bcb:	c3                   	ret    

c0004bcc <v2l>:
c0004bcc:	55                   	push   %ebp
c0004bcd:	89 e5                	mov    %esp,%ebp
c0004bcf:	83 ec 18             	sub    $0x18,%esp
c0004bd2:	83 ec 0c             	sub    $0xc,%esp
c0004bd5:	ff 75 08             	pushl  0x8(%ebp)
c0004bd8:	e8 5e fe ff ff       	call   c0004a3b <pid2proc>
c0004bdd:	83 c4 10             	add    $0x10,%esp
c0004be0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004be3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004bea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004bed:	83 ec 08             	sub    $0x8,%esp
c0004bf0:	ff 75 f4             	pushl  -0xc(%ebp)
c0004bf3:	50                   	push   %eax
c0004bf4:	e8 79 ff ff ff       	call   c0004b72 <Seg2PhyAddrLDT>
c0004bf9:	83 c4 10             	add    $0x10,%esp
c0004bfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004bff:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004c02:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c05:	01 d0                	add    %edx,%eax
c0004c07:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004c0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004c0d:	c9                   	leave  
c0004c0e:	c3                   	ret    

c0004c0f <init_propt>:
c0004c0f:	55                   	push   %ebp
c0004c10:	89 e5                	mov    %esp,%ebp
c0004c12:	83 ec 28             	sub    $0x28,%esp
c0004c15:	6a 0e                	push   $0xe
c0004c17:	6a 08                	push   $0x8
c0004c19:	68 6a 16 00 c0       	push   $0xc000166a
c0004c1e:	6a 20                	push   $0x20
c0004c20:	e8 18 01 00 00       	call   c0004d3d <InitInterruptDesc>
c0004c25:	83 c4 10             	add    $0x10,%esp
c0004c28:	6a 0e                	push   $0xe
c0004c2a:	6a 08                	push   $0x8
c0004c2c:	68 97 16 00 c0       	push   $0xc0001697
c0004c31:	6a 21                	push   $0x21
c0004c33:	e8 05 01 00 00       	call   c0004d3d <InitInterruptDesc>
c0004c38:	83 c4 10             	add    $0x10,%esp
c0004c3b:	6a 0e                	push   $0xe
c0004c3d:	6a 08                	push   $0x8
c0004c3f:	68 d9 16 00 c0       	push   $0xc00016d9
c0004c44:	6a 2e                	push   $0x2e
c0004c46:	e8 f2 00 00 00       	call   c0004d3d <InitInterruptDesc>
c0004c4b:	83 c4 10             	add    $0x10,%esp
c0004c4e:	83 ec 04             	sub    $0x4,%esp
c0004c51:	68 80 15 00 00       	push   $0x1580
c0004c56:	6a 00                	push   $0x0
c0004c58:	68 40 33 08 c0       	push   $0xc0083340
c0004c5d:	e8 fc 68 00 00       	call   c000b55e <Memset>
c0004c62:	83 c4 10             	add    $0x10,%esp
c0004c65:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004c6c:	83 ec 04             	sub    $0x4,%esp
c0004c6f:	ff 75 f4             	pushl  -0xc(%ebp)
c0004c72:	6a 00                	push   $0x0
c0004c74:	68 60 16 01 c0       	push   $0xc0011660
c0004c79:	e8 e0 68 00 00       	call   c000b55e <Memset>
c0004c7e:	83 c4 10             	add    $0x10,%esp
c0004c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c84:	a3 c8 16 01 c0       	mov    %eax,0xc00116c8
c0004c89:	c7 05 68 16 01 c0 30 	movl   $0x30,0xc0011668
c0004c90:	00 00 00 
c0004c93:	83 ec 0c             	sub    $0xc,%esp
c0004c96:	6a 30                	push   $0x30
c0004c98:	e8 94 fe ff ff       	call   c0004b31 <Seg2PhyAddr>
c0004c9d:	83 c4 10             	add    $0x10,%esp
c0004ca0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004ca3:	c7 45 ec 60 16 01 c0 	movl   $0xc0011660,-0x14(%ebp)
c0004caa:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004cb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004cb4:	0f b7 d0             	movzwl %ax,%edx
c0004cb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004cba:	83 e8 01             	sub    $0x1,%eax
c0004cbd:	89 c1                	mov    %eax,%ecx
c0004cbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004cc2:	52                   	push   %edx
c0004cc3:	51                   	push   %ecx
c0004cc4:	50                   	push   %eax
c0004cc5:	68 e0 f7 00 c0       	push   $0xc000f7e0
c0004cca:	e8 f5 fd ff ff       	call   c0004ac4 <InitDescriptor>
c0004ccf:	83 c4 10             	add    $0x10,%esp
c0004cd2:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004cd9:	68 f2 00 00 00       	push   $0xf2
c0004cde:	68 ff ff 00 00       	push   $0xffff
c0004ce3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004ce6:	68 d8 f7 00 c0       	push   $0xc000f7d8
c0004ceb:	e8 d4 fd ff ff       	call   c0004ac4 <InitDescriptor>
c0004cf0:	83 c4 10             	add    $0x10,%esp
c0004cf3:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004cfa:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004d01:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004d08:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004d0b:	0f b7 c0             	movzwl %ax,%eax
c0004d0e:	50                   	push   %eax
c0004d0f:	ff 75 d8             	pushl  -0x28(%ebp)
c0004d12:	6a 00                	push   $0x0
c0004d14:	68 e8 f7 00 c0       	push   $0xc000f7e8
c0004d19:	e8 a6 fd ff ff       	call   c0004ac4 <InitDescriptor>
c0004d1e:	83 c4 10             	add    $0x10,%esp
c0004d21:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004d24:	0f b7 c0             	movzwl %ax,%eax
c0004d27:	50                   	push   %eax
c0004d28:	ff 75 d8             	pushl  -0x28(%ebp)
c0004d2b:	6a 00                	push   $0x0
c0004d2d:	68 f0 f7 00 c0       	push   $0xc000f7f0
c0004d32:	e8 8d fd ff ff       	call   c0004ac4 <InitDescriptor>
c0004d37:	83 c4 10             	add    $0x10,%esp
c0004d3a:	90                   	nop
c0004d3b:	c9                   	leave  
c0004d3c:	c3                   	ret    

c0004d3d <InitInterruptDesc>:
c0004d3d:	55                   	push   %ebp
c0004d3e:	89 e5                	mov    %esp,%ebp
c0004d40:	83 ec 10             	sub    $0x10,%esp
c0004d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d46:	c1 e0 03             	shl    $0x3,%eax
c0004d49:	05 00 17 01 c0       	add    $0xc0011700,%eax
c0004d4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004d51:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d54:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004d58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d5b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004d5e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d61:	89 c2                	mov    %eax,%edx
c0004d63:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d66:	66 89 10             	mov    %dx,(%eax)
c0004d69:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d6c:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004d72:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d75:	c1 f8 10             	sar    $0x10,%eax
c0004d78:	89 c2                	mov    %eax,%edx
c0004d7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d7d:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004d81:	8b 45 10             	mov    0x10(%ebp),%eax
c0004d84:	c1 e0 04             	shl    $0x4,%eax
c0004d87:	89 c2                	mov    %eax,%edx
c0004d89:	8b 45 14             	mov    0x14(%ebp),%eax
c0004d8c:	09 d0                	or     %edx,%eax
c0004d8e:	89 c2                	mov    %eax,%edx
c0004d90:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d93:	88 50 05             	mov    %dl,0x5(%eax)
c0004d96:	90                   	nop
c0004d97:	c9                   	leave  
c0004d98:	c3                   	ret    

c0004d99 <ReloadGDT>:
c0004d99:	55                   	push   %ebp
c0004d9a:	89 e5                	mov    %esp,%ebp
c0004d9c:	83 ec 28             	sub    $0x28,%esp
c0004d9f:	b8 e8 16 01 c0       	mov    $0xc00116e8,%eax
c0004da4:	0f b7 00             	movzwl (%eax),%eax
c0004da7:	98                   	cwtl   
c0004da8:	ba ea 16 01 c0       	mov    $0xc00116ea,%edx
c0004dad:	8b 12                	mov    (%edx),%edx
c0004daf:	83 ec 04             	sub    $0x4,%esp
c0004db2:	50                   	push   %eax
c0004db3:	52                   	push   %edx
c0004db4:	68 a0 f7 00 c0       	push   $0xc000f7a0
c0004db9:	e8 72 67 00 00       	call   c000b530 <Memcpy>
c0004dbe:	83 c4 10             	add    $0x10,%esp
c0004dc1:	c7 45 f0 e8 16 01 c0 	movl   $0xc00116e8,-0x10(%ebp)
c0004dc8:	c7 45 ec ea 16 01 c0 	movl   $0xc00116ea,-0x14(%ebp)
c0004dcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004dd2:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004dd7:	ba a0 f7 00 c0       	mov    $0xc000f7a0,%edx
c0004ddc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004ddf:	89 10                	mov    %edx,(%eax)
c0004de1:	c7 45 e8 68 f7 00 c0 	movl   $0xc000f768,-0x18(%ebp)
c0004de8:	c7 45 e4 6a f7 00 c0 	movl   $0xc000f76a,-0x1c(%ebp)
c0004def:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004df2:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004df7:	ba 00 17 01 c0       	mov    $0xc0011700,%edx
c0004dfc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004dff:	89 10                	mov    %edx,(%eax)
c0004e01:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004e08:	eb 04                	jmp    c0004e0e <ReloadGDT+0x75>
c0004e0a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004e0e:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004e15:	7e f3                	jle    c0004e0a <ReloadGDT+0x71>
c0004e17:	e8 8e 31 00 00       	call   c0007faa <init_internal_interrupt>
c0004e1c:	e8 ee fd ff ff       	call   c0004c0f <init_propt>
c0004e21:	90                   	nop
c0004e22:	c9                   	leave  
c0004e23:	c3                   	ret    

c0004e24 <select_console>:
c0004e24:	55                   	push   %ebp
c0004e25:	89 e5                	mov    %esp,%ebp
c0004e27:	83 ec 18             	sub    $0x18,%esp
c0004e2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e2d:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004e30:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004e34:	77 27                	ja     c0004e5d <select_console+0x39>
c0004e36:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004e3a:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004e40:	05 e0 fd 00 c0       	add    $0xc000fde0,%eax
c0004e45:	a3 60 f7 00 c0       	mov    %eax,0xc000f760
c0004e4a:	a1 60 f7 00 c0       	mov    0xc000f760,%eax
c0004e4f:	83 ec 0c             	sub    $0xc,%esp
c0004e52:	50                   	push   %eax
c0004e53:	e8 08 00 00 00       	call   c0004e60 <flush>
c0004e58:	83 c4 10             	add    $0x10,%esp
c0004e5b:	eb 01                	jmp    c0004e5e <select_console+0x3a>
c0004e5d:	90                   	nop
c0004e5e:	c9                   	leave  
c0004e5f:	c3                   	ret    

c0004e60 <flush>:
c0004e60:	55                   	push   %ebp
c0004e61:	89 e5                	mov    %esp,%ebp
c0004e63:	83 ec 08             	sub    $0x8,%esp
c0004e66:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e69:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e6f:	8b 40 0c             	mov    0xc(%eax),%eax
c0004e72:	83 ec 0c             	sub    $0xc,%esp
c0004e75:	50                   	push   %eax
c0004e76:	e8 1e 00 00 00       	call   c0004e99 <set_cursor>
c0004e7b:	83 c4 10             	add    $0x10,%esp
c0004e7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e81:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e87:	8b 40 08             	mov    0x8(%eax),%eax
c0004e8a:	83 ec 0c             	sub    $0xc,%esp
c0004e8d:	50                   	push   %eax
c0004e8e:	e8 64 00 00 00       	call   c0004ef7 <set_console_start_video_addr>
c0004e93:	83 c4 10             	add    $0x10,%esp
c0004e96:	90                   	nop
c0004e97:	c9                   	leave  
c0004e98:	c3                   	ret    

c0004e99 <set_cursor>:
c0004e99:	55                   	push   %ebp
c0004e9a:	89 e5                	mov    %esp,%ebp
c0004e9c:	83 ec 08             	sub    $0x8,%esp
c0004e9f:	83 ec 08             	sub    $0x8,%esp
c0004ea2:	6a 0e                	push   $0xe
c0004ea4:	68 d4 03 00 00       	push   $0x3d4
c0004ea9:	e8 f8 c8 ff ff       	call   c00017a6 <out_byte>
c0004eae:	83 c4 10             	add    $0x10,%esp
c0004eb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eb4:	c1 e8 08             	shr    $0x8,%eax
c0004eb7:	0f b7 c0             	movzwl %ax,%eax
c0004eba:	83 ec 08             	sub    $0x8,%esp
c0004ebd:	50                   	push   %eax
c0004ebe:	68 d5 03 00 00       	push   $0x3d5
c0004ec3:	e8 de c8 ff ff       	call   c00017a6 <out_byte>
c0004ec8:	83 c4 10             	add    $0x10,%esp
c0004ecb:	83 ec 08             	sub    $0x8,%esp
c0004ece:	6a 0f                	push   $0xf
c0004ed0:	68 d4 03 00 00       	push   $0x3d4
c0004ed5:	e8 cc c8 ff ff       	call   c00017a6 <out_byte>
c0004eda:	83 c4 10             	add    $0x10,%esp
c0004edd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ee0:	0f b7 c0             	movzwl %ax,%eax
c0004ee3:	83 ec 08             	sub    $0x8,%esp
c0004ee6:	50                   	push   %eax
c0004ee7:	68 d5 03 00 00       	push   $0x3d5
c0004eec:	e8 b5 c8 ff ff       	call   c00017a6 <out_byte>
c0004ef1:	83 c4 10             	add    $0x10,%esp
c0004ef4:	90                   	nop
c0004ef5:	c9                   	leave  
c0004ef6:	c3                   	ret    

c0004ef7 <set_console_start_video_addr>:
c0004ef7:	55                   	push   %ebp
c0004ef8:	89 e5                	mov    %esp,%ebp
c0004efa:	83 ec 08             	sub    $0x8,%esp
c0004efd:	83 ec 08             	sub    $0x8,%esp
c0004f00:	6a 0c                	push   $0xc
c0004f02:	68 d4 03 00 00       	push   $0x3d4
c0004f07:	e8 9a c8 ff ff       	call   c00017a6 <out_byte>
c0004f0c:	83 c4 10             	add    $0x10,%esp
c0004f0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f12:	c1 e8 08             	shr    $0x8,%eax
c0004f15:	0f b7 c0             	movzwl %ax,%eax
c0004f18:	83 ec 08             	sub    $0x8,%esp
c0004f1b:	50                   	push   %eax
c0004f1c:	68 d5 03 00 00       	push   $0x3d5
c0004f21:	e8 80 c8 ff ff       	call   c00017a6 <out_byte>
c0004f26:	83 c4 10             	add    $0x10,%esp
c0004f29:	83 ec 08             	sub    $0x8,%esp
c0004f2c:	6a 0d                	push   $0xd
c0004f2e:	68 d4 03 00 00       	push   $0x3d4
c0004f33:	e8 6e c8 ff ff       	call   c00017a6 <out_byte>
c0004f38:	83 c4 10             	add    $0x10,%esp
c0004f3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f3e:	0f b7 c0             	movzwl %ax,%eax
c0004f41:	83 ec 08             	sub    $0x8,%esp
c0004f44:	50                   	push   %eax
c0004f45:	68 d5 03 00 00       	push   $0x3d5
c0004f4a:	e8 57 c8 ff ff       	call   c00017a6 <out_byte>
c0004f4f:	83 c4 10             	add    $0x10,%esp
c0004f52:	90                   	nop
c0004f53:	c9                   	leave  
c0004f54:	c3                   	ret    

c0004f55 <put_key>:
c0004f55:	55                   	push   %ebp
c0004f56:	89 e5                	mov    %esp,%ebp
c0004f58:	83 ec 04             	sub    $0x4,%esp
c0004f5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f5e:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004f61:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f64:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f6a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004f6f:	77 4d                	ja     c0004fbe <put_key+0x69>
c0004f71:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f74:	8b 00                	mov    (%eax),%eax
c0004f76:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004f7a:	89 10                	mov    %edx,(%eax)
c0004f7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f7f:	8b 00                	mov    (%eax),%eax
c0004f81:	8d 50 04             	lea    0x4(%eax),%edx
c0004f84:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f87:	89 10                	mov    %edx,(%eax)
c0004f89:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f8c:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f92:	8d 50 01             	lea    0x1(%eax),%edx
c0004f95:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f98:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004f9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa1:	8b 00                	mov    (%eax),%eax
c0004fa3:	8b 55 08             	mov    0x8(%ebp),%edx
c0004fa6:	83 c2 08             	add    $0x8,%edx
c0004fa9:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004faf:	39 d0                	cmp    %edx,%eax
c0004fb1:	75 0b                	jne    c0004fbe <put_key+0x69>
c0004fb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb6:	8d 50 08             	lea    0x8(%eax),%edx
c0004fb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fbc:	89 10                	mov    %edx,(%eax)
c0004fbe:	90                   	nop
c0004fbf:	c9                   	leave  
c0004fc0:	c3                   	ret    

c0004fc1 <scroll_up>:
c0004fc1:	55                   	push   %ebp
c0004fc2:	89 e5                	mov    %esp,%ebp
c0004fc4:	83 ec 08             	sub    $0x8,%esp
c0004fc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fd0:	8b 40 08             	mov    0x8(%eax),%eax
c0004fd3:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004fd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fdf:	8b 00                	mov    (%eax),%eax
c0004fe1:	39 c2                	cmp    %eax,%edx
c0004fe3:	76 1b                	jbe    c0005000 <scroll_up+0x3f>
c0004fe5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fee:	8b 40 08             	mov    0x8(%eax),%eax
c0004ff1:	83 e8 50             	sub    $0x50,%eax
c0004ff4:	83 ec 0c             	sub    $0xc,%esp
c0004ff7:	50                   	push   %eax
c0004ff8:	e8 fa fe ff ff       	call   c0004ef7 <set_console_start_video_addr>
c0004ffd:	83 c4 10             	add    $0x10,%esp
c0005000:	90                   	nop
c0005001:	c9                   	leave  
c0005002:	c3                   	ret    

c0005003 <scroll_down>:
c0005003:	55                   	push   %ebp
c0005004:	89 e5                	mov    %esp,%ebp
c0005006:	83 ec 08             	sub    $0x8,%esp
c0005009:	8b 45 08             	mov    0x8(%ebp),%eax
c000500c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005012:	8b 40 08             	mov    0x8(%eax),%eax
c0005015:	8d 48 50             	lea    0x50(%eax),%ecx
c0005018:	8b 45 08             	mov    0x8(%ebp),%eax
c000501b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005021:	8b 10                	mov    (%eax),%edx
c0005023:	8b 45 08             	mov    0x8(%ebp),%eax
c0005026:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000502c:	8b 40 04             	mov    0x4(%eax),%eax
c000502f:	01 d0                	add    %edx,%eax
c0005031:	39 c1                	cmp    %eax,%ecx
c0005033:	73 36                	jae    c000506b <scroll_down+0x68>
c0005035:	8b 45 08             	mov    0x8(%ebp),%eax
c0005038:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000503e:	8b 40 08             	mov    0x8(%eax),%eax
c0005041:	83 c0 50             	add    $0x50,%eax
c0005044:	83 ec 0c             	sub    $0xc,%esp
c0005047:	50                   	push   %eax
c0005048:	e8 aa fe ff ff       	call   c0004ef7 <set_console_start_video_addr>
c000504d:	83 c4 10             	add    $0x10,%esp
c0005050:	8b 45 08             	mov    0x8(%ebp),%eax
c0005053:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005059:	8b 50 08             	mov    0x8(%eax),%edx
c000505c:	8b 45 08             	mov    0x8(%ebp),%eax
c000505f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005065:	83 c2 50             	add    $0x50,%edx
c0005068:	89 50 08             	mov    %edx,0x8(%eax)
c000506b:	90                   	nop
c000506c:	c9                   	leave  
c000506d:	c3                   	ret    

c000506e <out_char>:
c000506e:	55                   	push   %ebp
c000506f:	89 e5                	mov    %esp,%ebp
c0005071:	83 ec 28             	sub    $0x28,%esp
c0005074:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005077:	88 45 e4             	mov    %al,-0x1c(%ebp)
c000507a:	8b 45 08             	mov    0x8(%ebp),%eax
c000507d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005083:	8b 40 0c             	mov    0xc(%eax),%eax
c0005086:	05 00 c0 05 60       	add    $0x6005c000,%eax
c000508b:	01 c0                	add    %eax,%eax
c000508d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005090:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0005094:	83 f8 08             	cmp    $0x8,%eax
c0005097:	0f 84 8d 00 00 00    	je     c000512a <out_char+0xbc>
c000509d:	83 f8 0a             	cmp    $0xa,%eax
c00050a0:	0f 85 c9 00 00 00    	jne    c000516f <out_char+0x101>
c00050a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00050a9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050af:	8b 50 0c             	mov    0xc(%eax),%edx
c00050b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00050b5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050bb:	8b 08                	mov    (%eax),%ecx
c00050bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00050c0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050c6:	8b 40 04             	mov    0x4(%eax),%eax
c00050c9:	01 c8                	add    %ecx,%eax
c00050cb:	83 e8 50             	sub    $0x50,%eax
c00050ce:	39 c2                	cmp    %eax,%edx
c00050d0:	0f 83 f4 00 00 00    	jae    c00051ca <out_char+0x15c>
c00050d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00050d9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050df:	8b 08                	mov    (%eax),%ecx
c00050e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00050e4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050ea:	8b 50 0c             	mov    0xc(%eax),%edx
c00050ed:	8b 45 08             	mov    0x8(%ebp),%eax
c00050f0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050f6:	8b 00                	mov    (%eax),%eax
c00050f8:	29 c2                	sub    %eax,%edx
c00050fa:	89 d0                	mov    %edx,%eax
c00050fc:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0005101:	f7 e2                	mul    %edx
c0005103:	89 d0                	mov    %edx,%eax
c0005105:	c1 e8 06             	shr    $0x6,%eax
c0005108:	8d 50 01             	lea    0x1(%eax),%edx
c000510b:	89 d0                	mov    %edx,%eax
c000510d:	c1 e0 02             	shl    $0x2,%eax
c0005110:	01 d0                	add    %edx,%eax
c0005112:	c1 e0 04             	shl    $0x4,%eax
c0005115:	89 c2                	mov    %eax,%edx
c0005117:	8b 45 08             	mov    0x8(%ebp),%eax
c000511a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005120:	01 ca                	add    %ecx,%edx
c0005122:	89 50 0c             	mov    %edx,0xc(%eax)
c0005125:	e9 a0 00 00 00       	jmp    c00051ca <out_char+0x15c>
c000512a:	8b 45 08             	mov    0x8(%ebp),%eax
c000512d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005133:	8b 50 0c             	mov    0xc(%eax),%edx
c0005136:	8b 45 08             	mov    0x8(%ebp),%eax
c0005139:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000513f:	8b 00                	mov    (%eax),%eax
c0005141:	39 c2                	cmp    %eax,%edx
c0005143:	0f 86 84 00 00 00    	jbe    c00051cd <out_char+0x15f>
c0005149:	8b 45 08             	mov    0x8(%ebp),%eax
c000514c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005152:	8b 50 0c             	mov    0xc(%eax),%edx
c0005155:	83 ea 01             	sub    $0x1,%edx
c0005158:	89 50 0c             	mov    %edx,0xc(%eax)
c000515b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000515e:	83 e8 02             	sub    $0x2,%eax
c0005161:	c6 00 20             	movb   $0x20,(%eax)
c0005164:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005167:	83 e8 01             	sub    $0x1,%eax
c000516a:	c6 00 00             	movb   $0x0,(%eax)
c000516d:	eb 5e                	jmp    c00051cd <out_char+0x15f>
c000516f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005172:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005178:	8b 40 0c             	mov    0xc(%eax),%eax
c000517b:	8d 48 01             	lea    0x1(%eax),%ecx
c000517e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005181:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005187:	8b 10                	mov    (%eax),%edx
c0005189:	8b 45 08             	mov    0x8(%ebp),%eax
c000518c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005192:	8b 40 04             	mov    0x4(%eax),%eax
c0005195:	01 d0                	add    %edx,%eax
c0005197:	39 c1                	cmp    %eax,%ecx
c0005199:	73 35                	jae    c00051d0 <out_char+0x162>
c000519b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000519e:	8d 50 01             	lea    0x1(%eax),%edx
c00051a1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00051a4:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c00051a8:	88 10                	mov    %dl,(%eax)
c00051aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00051ad:	8d 50 01             	lea    0x1(%eax),%edx
c00051b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00051b3:	c6 00 0a             	movb   $0xa,(%eax)
c00051b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00051b9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051bf:	8b 50 0c             	mov    0xc(%eax),%edx
c00051c2:	83 c2 01             	add    $0x1,%edx
c00051c5:	89 50 0c             	mov    %edx,0xc(%eax)
c00051c8:	eb 06                	jmp    c00051d0 <out_char+0x162>
c00051ca:	90                   	nop
c00051cb:	eb 14                	jmp    c00051e1 <out_char+0x173>
c00051cd:	90                   	nop
c00051ce:	eb 11                	jmp    c00051e1 <out_char+0x173>
c00051d0:	90                   	nop
c00051d1:	eb 0e                	jmp    c00051e1 <out_char+0x173>
c00051d3:	83 ec 0c             	sub    $0xc,%esp
c00051d6:	ff 75 08             	pushl  0x8(%ebp)
c00051d9:	e8 25 fe ff ff       	call   c0005003 <scroll_down>
c00051de:	83 c4 10             	add    $0x10,%esp
c00051e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00051e4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051ea:	8b 50 0c             	mov    0xc(%eax),%edx
c00051ed:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051f6:	8b 40 08             	mov    0x8(%eax),%eax
c00051f9:	29 c2                	sub    %eax,%edx
c00051fb:	89 d0                	mov    %edx,%eax
c00051fd:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0005202:	77 cf                	ja     c00051d3 <out_char+0x165>
c0005204:	83 ec 0c             	sub    $0xc,%esp
c0005207:	ff 75 08             	pushl  0x8(%ebp)
c000520a:	e8 51 fc ff ff       	call   c0004e60 <flush>
c000520f:	83 c4 10             	add    $0x10,%esp
c0005212:	90                   	nop
c0005213:	c9                   	leave  
c0005214:	c3                   	ret    

c0005215 <tty_dev_read>:
c0005215:	55                   	push   %ebp
c0005216:	89 e5                	mov    %esp,%ebp
c0005218:	83 ec 08             	sub    $0x8,%esp
c000521b:	a1 60 f7 00 c0       	mov    0xc000f760,%eax
c0005220:	39 45 08             	cmp    %eax,0x8(%ebp)
c0005223:	75 17                	jne    c000523c <tty_dev_read+0x27>
c0005225:	a1 c8 fb 00 c0       	mov    0xc000fbc8,%eax
c000522a:	85 c0                	test   %eax,%eax
c000522c:	7e 0e                	jle    c000523c <tty_dev_read+0x27>
c000522e:	83 ec 0c             	sub    $0xc,%esp
c0005231:	ff 75 08             	pushl  0x8(%ebp)
c0005234:	e8 84 07 00 00       	call   c00059bd <keyboard_read>
c0005239:	83 c4 10             	add    $0x10,%esp
c000523c:	90                   	nop
c000523d:	c9                   	leave  
c000523e:	c3                   	ret    

c000523f <tty_dev_write>:
c000523f:	55                   	push   %ebp
c0005240:	89 e5                	mov    %esp,%ebp
c0005242:	83 ec 28             	sub    $0x28,%esp
c0005245:	8b 45 08             	mov    0x8(%ebp),%eax
c0005248:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000524e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005251:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005258:	e9 88 01 00 00       	jmp    c00053e5 <tty_dev_write+0x1a6>
c000525d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005260:	8b 40 04             	mov    0x4(%eax),%eax
c0005263:	8b 00                	mov    (%eax),%eax
c0005265:	88 45 e7             	mov    %al,-0x19(%ebp)
c0005268:	8b 45 08             	mov    0x8(%ebp),%eax
c000526b:	8b 40 04             	mov    0x4(%eax),%eax
c000526e:	8d 50 04             	lea    0x4(%eax),%edx
c0005271:	8b 45 08             	mov    0x8(%ebp),%eax
c0005274:	89 50 04             	mov    %edx,0x4(%eax)
c0005277:	8b 45 08             	mov    0x8(%ebp),%eax
c000527a:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005280:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005283:	8b 45 08             	mov    0x8(%ebp),%eax
c0005286:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000528c:	8b 45 08             	mov    0x8(%ebp),%eax
c000528f:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005295:	8d 50 01             	lea    0x1(%eax),%edx
c0005298:	8b 45 08             	mov    0x8(%ebp),%eax
c000529b:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00052a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a4:	8b 40 04             	mov    0x4(%eax),%eax
c00052a7:	8b 55 08             	mov    0x8(%ebp),%edx
c00052aa:	83 c2 08             	add    $0x8,%edx
c00052ad:	81 c2 00 08 00 00    	add    $0x800,%edx
c00052b3:	39 d0                	cmp    %edx,%eax
c00052b5:	75 0c                	jne    c00052c3 <tty_dev_write+0x84>
c00052b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ba:	8d 50 08             	lea    0x8(%eax),%edx
c00052bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00052c0:	89 50 04             	mov    %edx,0x4(%eax)
c00052c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00052c6:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00052cc:	85 c0                	test   %eax,%eax
c00052ce:	0f 84 11 01 00 00    	je     c00053e5 <tty_dev_write+0x1a6>
c00052d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052d8:	3c 20                	cmp    $0x20,%al
c00052da:	76 08                	jbe    c00052e4 <tty_dev_write+0xa5>
c00052dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052e0:	3c 7e                	cmp    $0x7e,%al
c00052e2:	76 10                	jbe    c00052f4 <tty_dev_write+0xb5>
c00052e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052e8:	3c 20                	cmp    $0x20,%al
c00052ea:	74 08                	je     c00052f4 <tty_dev_write+0xb5>
c00052ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052f0:	84 c0                	test   %al,%al
c00052f2:	75 58                	jne    c000534c <tty_dev_write+0x10d>
c00052f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00052f7:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00052fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005300:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005306:	01 d0                	add    %edx,%eax
c0005308:	83 e8 01             	sub    $0x1,%eax
c000530b:	89 c2                	mov    %eax,%edx
c000530d:	83 ec 04             	sub    $0x4,%esp
c0005310:	6a 01                	push   $0x1
c0005312:	8d 45 e7             	lea    -0x19(%ebp),%eax
c0005315:	50                   	push   %eax
c0005316:	52                   	push   %edx
c0005317:	e8 14 62 00 00       	call   c000b530 <Memcpy>
c000531c:	83 c4 10             	add    $0x10,%esp
c000531f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005322:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005328:	8d 50 ff             	lea    -0x1(%eax),%edx
c000532b:	8b 45 08             	mov    0x8(%ebp),%eax
c000532e:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005334:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005338:	0f b6 c0             	movzbl %al,%eax
c000533b:	83 ec 08             	sub    $0x8,%esp
c000533e:	50                   	push   %eax
c000533f:	ff 75 08             	pushl  0x8(%ebp)
c0005342:	e8 27 fd ff ff       	call   c000506e <out_char>
c0005347:	83 c4 10             	add    $0x10,%esp
c000534a:	eb 7c                	jmp    c00053c8 <tty_dev_write+0x189>
c000534c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005350:	3c 08                	cmp    $0x8,%al
c0005352:	75 42                	jne    c0005396 <tty_dev_write+0x157>
c0005354:	8b 45 08             	mov    0x8(%ebp),%eax
c0005357:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000535d:	8d 50 01             	lea    0x1(%eax),%edx
c0005360:	8b 45 08             	mov    0x8(%ebp),%eax
c0005363:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005369:	8b 45 08             	mov    0x8(%ebp),%eax
c000536c:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005372:	8d 50 fe             	lea    -0x2(%eax),%edx
c0005375:	8b 45 08             	mov    0x8(%ebp),%eax
c0005378:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000537e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005382:	0f b6 c0             	movzbl %al,%eax
c0005385:	83 ec 08             	sub    $0x8,%esp
c0005388:	50                   	push   %eax
c0005389:	ff 75 08             	pushl  0x8(%ebp)
c000538c:	e8 dd fc ff ff       	call   c000506e <out_char>
c0005391:	83 c4 10             	add    $0x10,%esp
c0005394:	eb 32                	jmp    c00053c8 <tty_dev_write+0x189>
c0005396:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000539a:	3c 0a                	cmp    $0xa,%al
c000539c:	75 2a                	jne    c00053c8 <tty_dev_write+0x189>
c000539e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00053a2:	0f b6 c0             	movzbl %al,%eax
c00053a5:	83 ec 08             	sub    $0x8,%esp
c00053a8:	50                   	push   %eax
c00053a9:	ff 75 08             	pushl  0x8(%ebp)
c00053ac:	e8 bd fc ff ff       	call   c000506e <out_char>
c00053b1:	83 c4 10             	add    $0x10,%esp
c00053b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b7:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c00053be:	00 00 00 
c00053c1:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00053cb:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00053d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d4:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00053da:	39 c2                	cmp    %eax,%edx
c00053dc:	75 07                	jne    c00053e5 <tty_dev_write+0x1a6>
c00053de:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00053e8:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00053ee:	85 c0                	test   %eax,%eax
c00053f0:	0f 85 67 fe ff ff    	jne    c000525d <tty_dev_write+0x1e>
c00053f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00053fa:	74 5c                	je     c0005458 <tty_dev_write+0x219>
c00053fc:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c0005403:	83 ec 0c             	sub    $0xc,%esp
c0005406:	ff 75 ec             	pushl  -0x14(%ebp)
c0005409:	e8 ec 1a 00 00       	call   c0006efa <sys_malloc>
c000540e:	83 c4 10             	add    $0x10,%esp
c0005411:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005414:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005417:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c000541e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005421:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005427:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000542a:	89 50 50             	mov    %edx,0x50(%eax)
c000542d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005430:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0005436:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005439:	89 50 58             	mov    %edx,0x58(%eax)
c000543c:	8b 45 08             	mov    0x8(%ebp),%eax
c000543f:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005445:	83 ec 04             	sub    $0x4,%esp
c0005448:	50                   	push   %eax
c0005449:	ff 75 e8             	pushl  -0x18(%ebp)
c000544c:	6a 01                	push   $0x1
c000544e:	e8 f4 46 00 00       	call   c0009b47 <send_rec>
c0005453:	83 c4 10             	add    $0x10,%esp
c0005456:	eb 01                	jmp    c0005459 <tty_dev_write+0x21a>
c0005458:	90                   	nop
c0005459:	c9                   	leave  
c000545a:	c3                   	ret    

c000545b <tty_do_read>:
c000545b:	55                   	push   %ebp
c000545c:	89 e5                	mov    %esp,%ebp
c000545e:	83 ec 08             	sub    $0x8,%esp
c0005461:	8b 45 08             	mov    0x8(%ebp),%eax
c0005464:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000546b:	00 00 00 
c000546e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005471:	8b 50 58             	mov    0x58(%eax),%edx
c0005474:	8b 45 08             	mov    0x8(%ebp),%eax
c0005477:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c000547d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005480:	8b 00                	mov    (%eax),%eax
c0005482:	89 c2                	mov    %eax,%edx
c0005484:	8b 45 08             	mov    0x8(%ebp),%eax
c0005487:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000548d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005490:	8b 50 50             	mov    0x50(%eax),%edx
c0005493:	8b 45 08             	mov    0x8(%ebp),%eax
c0005496:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000549c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000549f:	8b 50 50             	mov    0x50(%eax),%edx
c00054a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00054a5:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00054ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00054ae:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c00054b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054b7:	8b 40 10             	mov    0x10(%eax),%eax
c00054ba:	83 ec 08             	sub    $0x8,%esp
c00054bd:	52                   	push   %edx
c00054be:	50                   	push   %eax
c00054bf:	e8 f5 18 00 00       	call   c0006db9 <alloc_virtual_memory>
c00054c4:	83 c4 10             	add    $0x10,%esp
c00054c7:	89 c2                	mov    %eax,%edx
c00054c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00054cc:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00054d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00054d5:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00054db:	83 f8 04             	cmp    $0x4,%eax
c00054de:	74 1c                	je     c00054fc <tty_do_read+0xa1>
c00054e0:	68 27 01 00 00       	push   $0x127
c00054e5:	68 1d ad 00 c0       	push   $0xc000ad1d
c00054ea:	68 1d ad 00 c0       	push   $0xc000ad1d
c00054ef:	68 27 ad 00 c0       	push   $0xc000ad27
c00054f4:	e8 ef 3d 00 00       	call   c00092e8 <assertion_failure>
c00054f9:	83 c4 10             	add    $0x10,%esp
c00054fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054ff:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c0005506:	8b 45 08             	mov    0x8(%ebp),%eax
c0005509:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000550f:	83 ec 04             	sub    $0x4,%esp
c0005512:	50                   	push   %eax
c0005513:	ff 75 0c             	pushl  0xc(%ebp)
c0005516:	6a 01                	push   $0x1
c0005518:	e8 2a 46 00 00       	call   c0009b47 <send_rec>
c000551d:	83 c4 10             	add    $0x10,%esp
c0005520:	90                   	nop
c0005521:	c9                   	leave  
c0005522:	c3                   	ret    

c0005523 <tty_do_write>:
c0005523:	55                   	push   %ebp
c0005524:	89 e5                	mov    %esp,%ebp
c0005526:	53                   	push   %ebx
c0005527:	83 ec 24             	sub    $0x24,%esp
c000552a:	89 e0                	mov    %esp,%eax
c000552c:	89 c3                	mov    %eax,%ebx
c000552e:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0005535:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005538:	8d 50 ff             	lea    -0x1(%eax),%edx
c000553b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c000553e:	89 c2                	mov    %eax,%edx
c0005540:	b8 10 00 00 00       	mov    $0x10,%eax
c0005545:	83 e8 01             	sub    $0x1,%eax
c0005548:	01 d0                	add    %edx,%eax
c000554a:	b9 10 00 00 00       	mov    $0x10,%ecx
c000554f:	ba 00 00 00 00       	mov    $0x0,%edx
c0005554:	f7 f1                	div    %ecx
c0005556:	6b c0 10             	imul   $0x10,%eax,%eax
c0005559:	29 c4                	sub    %eax,%esp
c000555b:	89 e0                	mov    %esp,%eax
c000555d:	83 c0 00             	add    $0x0,%eax
c0005560:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005563:	83 ec 04             	sub    $0x4,%esp
c0005566:	ff 75 e8             	pushl  -0x18(%ebp)
c0005569:	6a 00                	push   $0x0
c000556b:	ff 75 e0             	pushl  -0x20(%ebp)
c000556e:	e8 eb 5f 00 00       	call   c000b55e <Memset>
c0005573:	83 c4 10             	add    $0x10,%esp
c0005576:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005579:	8b 40 50             	mov    0x50(%eax),%eax
c000557c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000557f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005582:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005589:	00 00 00 
c000558c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000558f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005592:	8b 40 10             	mov    0x10(%eax),%eax
c0005595:	83 ec 08             	sub    $0x8,%esp
c0005598:	52                   	push   %edx
c0005599:	50                   	push   %eax
c000559a:	e8 1a 18 00 00       	call   c0006db9 <alloc_virtual_memory>
c000559f:	83 c4 10             	add    $0x10,%esp
c00055a2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00055a5:	eb 7e                	jmp    c0005625 <tty_do_write+0x102>
c00055a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055aa:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00055ad:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c00055b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00055b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00055b7:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00055c0:	01 d0                	add    %edx,%eax
c00055c2:	83 ec 04             	sub    $0x4,%esp
c00055c5:	ff 75 f0             	pushl  -0x10(%ebp)
c00055c8:	50                   	push   %eax
c00055c9:	ff 75 e0             	pushl  -0x20(%ebp)
c00055cc:	e8 5f 5f 00 00       	call   c000b530 <Memcpy>
c00055d1:	83 c4 10             	add    $0x10,%esp
c00055d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055d7:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00055da:	8b 45 08             	mov    0x8(%ebp),%eax
c00055dd:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055e6:	01 c2                	add    %eax,%edx
c00055e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00055eb:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00055f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00055f8:	eb 25                	jmp    c000561f <tty_do_write+0xfc>
c00055fa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00055fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005600:	01 d0                	add    %edx,%eax
c0005602:	0f b6 00             	movzbl (%eax),%eax
c0005605:	0f b6 c0             	movzbl %al,%eax
c0005608:	83 ec 08             	sub    $0x8,%esp
c000560b:	50                   	push   %eax
c000560c:	ff 75 08             	pushl  0x8(%ebp)
c000560f:	e8 5a fa ff ff       	call   c000506e <out_char>
c0005614:	83 c4 10             	add    $0x10,%esp
c0005617:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000561b:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c000561f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005623:	75 d5                	jne    c00055fa <tty_do_write+0xd7>
c0005625:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005629:	0f 85 78 ff ff ff    	jne    c00055a7 <tty_do_write+0x84>
c000562f:	83 ec 0c             	sub    $0xc,%esp
c0005632:	6a 6c                	push   $0x6c
c0005634:	e8 c1 18 00 00       	call   c0006efa <sys_malloc>
c0005639:	83 c4 10             	add    $0x10,%esp
c000563c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000563f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005642:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0005649:	8b 45 08             	mov    0x8(%ebp),%eax
c000564c:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005652:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005655:	89 50 48             	mov    %edx,0x48(%eax)
c0005658:	8b 45 0c             	mov    0xc(%ebp),%eax
c000565b:	8b 00                	mov    (%eax),%eax
c000565d:	83 ec 04             	sub    $0x4,%esp
c0005660:	50                   	push   %eax
c0005661:	ff 75 d8             	pushl  -0x28(%ebp)
c0005664:	6a 01                	push   $0x1
c0005666:	e8 dc 44 00 00       	call   c0009b47 <send_rec>
c000566b:	83 c4 10             	add    $0x10,%esp
c000566e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005671:	83 ec 08             	sub    $0x8,%esp
c0005674:	6a 6c                	push   $0x6c
c0005676:	50                   	push   %eax
c0005677:	e8 bc 1b 00 00       	call   c0007238 <sys_free>
c000567c:	83 c4 10             	add    $0x10,%esp
c000567f:	89 dc                	mov    %ebx,%esp
c0005681:	90                   	nop
c0005682:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005685:	c9                   	leave  
c0005686:	c3                   	ret    

c0005687 <init_screen>:
c0005687:	55                   	push   %ebp
c0005688:	89 e5                	mov    %esp,%ebp
c000568a:	83 ec 10             	sub    $0x10,%esp
c000568d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005690:	2d e0 fd 00 c0       	sub    $0xc000fde0,%eax
c0005695:	c1 f8 03             	sar    $0x3,%eax
c0005698:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c000569e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00056a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00056a4:	c1 e0 04             	shl    $0x4,%eax
c00056a7:	8d 90 40 1f 01 c0    	lea    -0x3ffee0c0(%eax),%edx
c00056ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00056b0:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c00056b6:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c00056bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00056c0:	8b 88 24 08 00 00    	mov    0x824(%eax),%ecx
c00056c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00056c9:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c00056ce:	f7 e2                	mul    %edx
c00056d0:	89 d0                	mov    %edx,%eax
c00056d2:	d1 e8                	shr    %eax
c00056d4:	89 41 04             	mov    %eax,0x4(%ecx)
c00056d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00056da:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056e0:	8b 50 04             	mov    0x4(%eax),%edx
c00056e3:	8b 45 08             	mov    0x8(%ebp),%eax
c00056e6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056ec:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00056f0:	89 10                	mov    %edx,(%eax)
c00056f2:	8b 45 08             	mov    0x8(%ebp),%eax
c00056f5:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00056fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00056fe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005704:	8b 12                	mov    (%edx),%edx
c0005706:	89 50 08             	mov    %edx,0x8(%eax)
c0005709:	8b 55 08             	mov    0x8(%ebp),%edx
c000570c:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c0005712:	8b 40 08             	mov    0x8(%eax),%eax
c0005715:	89 42 0c             	mov    %eax,0xc(%edx)
c0005718:	90                   	nop
c0005719:	c9                   	leave  
c000571a:	c3                   	ret    

c000571b <init_tty>:
c000571b:	55                   	push   %ebp
c000571c:	89 e5                	mov    %esp,%ebp
c000571e:	83 ec 18             	sub    $0x18,%esp
c0005721:	c7 45 f4 e0 fd 00 c0 	movl   $0xc000fde0,-0xc(%ebp)
c0005728:	e9 92 00 00 00       	jmp    c00057bf <init_tty+0xa4>
c000572d:	83 ec 04             	sub    $0x4,%esp
c0005730:	68 28 08 00 00       	push   $0x828
c0005735:	6a 00                	push   $0x0
c0005737:	ff 75 f4             	pushl  -0xc(%ebp)
c000573a:	e8 1f 5e 00 00       	call   c000b55e <Memset>
c000573f:	83 c4 10             	add    $0x10,%esp
c0005742:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005745:	8d 50 08             	lea    0x8(%eax),%edx
c0005748:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000574b:	89 50 04             	mov    %edx,0x4(%eax)
c000574e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005751:	8b 50 04             	mov    0x4(%eax),%edx
c0005754:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005757:	89 10                	mov    %edx,(%eax)
c0005759:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000575c:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005763:	00 00 00 
c0005766:	83 ec 0c             	sub    $0xc,%esp
c0005769:	ff 75 f4             	pushl  -0xc(%ebp)
c000576c:	e8 16 ff ff ff       	call   c0005687 <init_screen>
c0005771:	83 c4 10             	add    $0x10,%esp
c0005774:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005777:	2d e0 fd 00 c0       	sub    $0xc000fde0,%eax
c000577c:	85 c0                	test   %eax,%eax
c000577e:	7e 38                	jle    c00057b8 <init_tty+0x9d>
c0005780:	83 ec 08             	sub    $0x8,%esp
c0005783:	6a 23                	push   $0x23
c0005785:	ff 75 f4             	pushl  -0xc(%ebp)
c0005788:	e8 e1 f8 ff ff       	call   c000506e <out_char>
c000578d:	83 c4 10             	add    $0x10,%esp
c0005790:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005793:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005798:	2d e0 fd 00 c0       	sub    $0xc000fde0,%eax
c000579d:	c1 f8 03             	sar    $0x3,%eax
c00057a0:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c00057a6:	0f b6 c0             	movzbl %al,%eax
c00057a9:	83 ec 08             	sub    $0x8,%esp
c00057ac:	50                   	push   %eax
c00057ad:	ff 75 f4             	pushl  -0xc(%ebp)
c00057b0:	e8 b9 f8 ff ff       	call   c000506e <out_char>
c00057b5:	83 c4 10             	add    $0x10,%esp
c00057b8:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c00057bf:	b8 58 16 01 c0       	mov    $0xc0011658,%eax
c00057c4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00057c7:	0f 82 60 ff ff ff    	jb     c000572d <init_tty+0x12>
c00057cd:	90                   	nop
c00057ce:	c9                   	leave  
c00057cf:	c3                   	ret    

c00057d0 <TaskTTY>:
c00057d0:	55                   	push   %ebp
c00057d1:	89 e5                	mov    %esp,%ebp
c00057d3:	83 ec 28             	sub    $0x28,%esp
c00057d6:	e8 40 ff ff ff       	call   c000571b <init_tty>
c00057db:	83 ec 0c             	sub    $0xc,%esp
c00057de:	6a 00                	push   $0x0
c00057e0:	e8 3f f6 ff ff       	call   c0004e24 <select_console>
c00057e5:	83 c4 10             	add    $0x10,%esp
c00057e8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00057ef:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00057f6:	83 ec 0c             	sub    $0xc,%esp
c00057f9:	6a 6c                	push   $0x6c
c00057fb:	e8 fa 16 00 00       	call   c0006efa <sys_malloc>
c0005800:	83 c4 10             	add    $0x10,%esp
c0005803:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005806:	c7 45 f4 e0 fd 00 c0 	movl   $0xc000fde0,-0xc(%ebp)
c000580d:	eb 30                	jmp    c000583f <TaskTTY+0x6f>
c000580f:	83 ec 0c             	sub    $0xc,%esp
c0005812:	ff 75 f4             	pushl  -0xc(%ebp)
c0005815:	e8 fb f9 ff ff       	call   c0005215 <tty_dev_read>
c000581a:	83 c4 10             	add    $0x10,%esp
c000581d:	83 ec 0c             	sub    $0xc,%esp
c0005820:	ff 75 f4             	pushl  -0xc(%ebp)
c0005823:	e8 17 fa ff ff       	call   c000523f <tty_dev_write>
c0005828:	83 c4 10             	add    $0x10,%esp
c000582b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000582e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005834:	85 c0                	test   %eax,%eax
c0005836:	75 d7                	jne    c000580f <TaskTTY+0x3f>
c0005838:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000583f:	b8 58 16 01 c0       	mov    $0xc0011658,%eax
c0005844:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005847:	72 c6                	jb     c000580f <TaskTTY+0x3f>
c0005849:	83 ec 04             	sub    $0x4,%esp
c000584c:	6a 12                	push   $0x12
c000584e:	ff 75 e8             	pushl  -0x18(%ebp)
c0005851:	6a 02                	push   $0x2
c0005853:	e8 ef 42 00 00       	call   c0009b47 <send_rec>
c0005858:	83 c4 10             	add    $0x10,%esp
c000585b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000585e:	8b 40 68             	mov    0x68(%eax),%eax
c0005861:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005864:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c000586b:	74 28                	je     c0005895 <TaskTTY+0xc5>
c000586d:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005874:	7f 0b                	jg     c0005881 <TaskTTY+0xb1>
c0005876:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c000587d:	74 4e                	je     c00058cd <TaskTTY+0xfd>
c000587f:	eb 4d                	jmp    c00058ce <TaskTTY+0xfe>
c0005881:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005888:	74 21                	je     c00058ab <TaskTTY+0xdb>
c000588a:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005891:	74 2e                	je     c00058c1 <TaskTTY+0xf1>
c0005893:	eb 39                	jmp    c00058ce <TaskTTY+0xfe>
c0005895:	a1 60 f7 00 c0       	mov    0xc000f760,%eax
c000589a:	83 ec 08             	sub    $0x8,%esp
c000589d:	ff 75 e8             	pushl  -0x18(%ebp)
c00058a0:	50                   	push   %eax
c00058a1:	e8 b5 fb ff ff       	call   c000545b <tty_do_read>
c00058a6:	83 c4 10             	add    $0x10,%esp
c00058a9:	eb 23                	jmp    c00058ce <TaskTTY+0xfe>
c00058ab:	a1 60 f7 00 c0       	mov    0xc000f760,%eax
c00058b0:	83 ec 08             	sub    $0x8,%esp
c00058b3:	ff 75 e8             	pushl  -0x18(%ebp)
c00058b6:	50                   	push   %eax
c00058b7:	e8 67 fc ff ff       	call   c0005523 <tty_do_write>
c00058bc:	83 c4 10             	add    $0x10,%esp
c00058bf:	eb 0d                	jmp    c00058ce <TaskTTY+0xfe>
c00058c1:	c7 05 e0 16 01 c0 00 	movl   $0x0,0xc00116e0
c00058c8:	00 00 00 
c00058cb:	eb 01                	jmp    c00058ce <TaskTTY+0xfe>
c00058cd:	90                   	nop
c00058ce:	e9 33 ff ff ff       	jmp    c0005806 <TaskTTY+0x36>

c00058d3 <keyboard_handler>:
c00058d3:	55                   	push   %ebp
c00058d4:	89 e5                	mov    %esp,%ebp
c00058d6:	83 ec 18             	sub    $0x18,%esp
c00058d9:	c7 05 e0 16 01 c0 01 	movl   $0x1,0xc00116e0
c00058e0:	00 00 00 
c00058e3:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00058ea:	a1 c8 fb 00 c0       	mov    0xc000fbc8,%eax
c00058ef:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00058f4:	7f 5e                	jg     c0005954 <keyboard_handler+0x81>
c00058f6:	e8 cd be ff ff       	call   c00017c8 <disable_int>
c00058fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058fe:	0f b7 c0             	movzwl %ax,%eax
c0005901:	83 ec 0c             	sub    $0xc,%esp
c0005904:	50                   	push   %eax
c0005905:	e8 90 be ff ff       	call   c000179a <in_byte>
c000590a:	83 c4 10             	add    $0x10,%esp
c000590d:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005910:	a1 c0 fb 00 c0       	mov    0xc000fbc0,%eax
c0005915:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005919:	88 10                	mov    %dl,(%eax)
c000591b:	a1 c0 fb 00 c0       	mov    0xc000fbc0,%eax
c0005920:	83 c0 01             	add    $0x1,%eax
c0005923:	a3 c0 fb 00 c0       	mov    %eax,0xc000fbc0
c0005928:	a1 c8 fb 00 c0       	mov    0xc000fbc8,%eax
c000592d:	83 c0 01             	add    $0x1,%eax
c0005930:	a3 c8 fb 00 c0       	mov    %eax,0xc000fbc8
c0005935:	a1 c0 fb 00 c0       	mov    0xc000fbc0,%eax
c000593a:	ba cc fd 00 c0       	mov    $0xc000fdcc,%edx
c000593f:	39 d0                	cmp    %edx,%eax
c0005941:	72 0a                	jb     c000594d <keyboard_handler+0x7a>
c0005943:	c7 05 c0 fb 00 c0 cc 	movl   $0xc000fbcc,0xc000fbc0
c000594a:	fb 00 c0 
c000594d:	e8 78 be ff ff       	call   c00017ca <enable_int>
c0005952:	eb 01                	jmp    c0005955 <keyboard_handler+0x82>
c0005954:	90                   	nop
c0005955:	c9                   	leave  
c0005956:	c3                   	ret    

c0005957 <read_from_keyboard_buf>:
c0005957:	55                   	push   %ebp
c0005958:	89 e5                	mov    %esp,%ebp
c000595a:	83 ec 18             	sub    $0x18,%esp
c000595d:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005961:	a1 c8 fb 00 c0       	mov    0xc000fbc8,%eax
c0005966:	85 c0                	test   %eax,%eax
c0005968:	7f 06                	jg     c0005970 <read_from_keyboard_buf+0x19>
c000596a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c000596e:	eb 4b                	jmp    c00059bb <read_from_keyboard_buf+0x64>
c0005970:	e8 53 be ff ff       	call   c00017c8 <disable_int>
c0005975:	a1 c4 fb 00 c0       	mov    0xc000fbc4,%eax
c000597a:	0f b6 00             	movzbl (%eax),%eax
c000597d:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005980:	a1 c4 fb 00 c0       	mov    0xc000fbc4,%eax
c0005985:	83 c0 01             	add    $0x1,%eax
c0005988:	a3 c4 fb 00 c0       	mov    %eax,0xc000fbc4
c000598d:	a1 c8 fb 00 c0       	mov    0xc000fbc8,%eax
c0005992:	83 e8 01             	sub    $0x1,%eax
c0005995:	a3 c8 fb 00 c0       	mov    %eax,0xc000fbc8
c000599a:	a1 c4 fb 00 c0       	mov    0xc000fbc4,%eax
c000599f:	ba cc fd 00 c0       	mov    $0xc000fdcc,%edx
c00059a4:	39 d0                	cmp    %edx,%eax
c00059a6:	72 0a                	jb     c00059b2 <read_from_keyboard_buf+0x5b>
c00059a8:	c7 05 c4 fb 00 c0 cc 	movl   $0xc000fbcc,0xc000fbc4
c00059af:	fb 00 c0 
c00059b2:	e8 13 be ff ff       	call   c00017ca <enable_int>
c00059b7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00059bb:	c9                   	leave  
c00059bc:	c3                   	ret    

c00059bd <keyboard_read>:
c00059bd:	55                   	push   %ebp
c00059be:	89 e5                	mov    %esp,%ebp
c00059c0:	83 ec 28             	sub    $0x28,%esp
c00059c3:	90                   	nop
c00059c4:	a1 c8 fb 00 c0       	mov    0xc000fbc8,%eax
c00059c9:	85 c0                	test   %eax,%eax
c00059cb:	7e f7                	jle    c00059c4 <keyboard_read+0x7>
c00059cd:	e8 85 ff ff ff       	call   c0005957 <read_from_keyboard_buf>
c00059d2:	88 45 ea             	mov    %al,-0x16(%ebp)
c00059d5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00059dc:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00059e0:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00059e4:	75 5a                	jne    c0005a40 <keyboard_read+0x83>
c00059e6:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00059ea:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00059ee:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00059f2:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00059f6:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00059fa:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00059fe:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005a02:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005a09:	eb 20                	jmp    c0005a2b <keyboard_read+0x6e>
c0005a0b:	e8 47 ff ff ff       	call   c0005957 <read_from_keyboard_buf>
c0005a10:	89 c1                	mov    %eax,%ecx
c0005a12:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005a15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a18:	01 d0                	add    %edx,%eax
c0005a1a:	0f b6 00             	movzbl (%eax),%eax
c0005a1d:	38 c1                	cmp    %al,%cl
c0005a1f:	74 06                	je     c0005a27 <keyboard_read+0x6a>
c0005a21:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005a25:	eb 0a                	jmp    c0005a31 <keyboard_read+0x74>
c0005a27:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005a2b:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005a2f:	7e da                	jle    c0005a0b <keyboard_read+0x4e>
c0005a31:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005a35:	74 68                	je     c0005a9f <keyboard_read+0xe2>
c0005a37:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005a3e:	eb 5f                	jmp    c0005a9f <keyboard_read+0xe2>
c0005a40:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005a44:	75 59                	jne    c0005a9f <keyboard_read+0xe2>
c0005a46:	e8 0c ff ff ff       	call   c0005957 <read_from_keyboard_buf>
c0005a4b:	3c 2a                	cmp    $0x2a,%al
c0005a4d:	75 1d                	jne    c0005a6c <keyboard_read+0xaf>
c0005a4f:	e8 03 ff ff ff       	call   c0005957 <read_from_keyboard_buf>
c0005a54:	3c e0                	cmp    $0xe0,%al
c0005a56:	75 14                	jne    c0005a6c <keyboard_read+0xaf>
c0005a58:	e8 fa fe ff ff       	call   c0005957 <read_from_keyboard_buf>
c0005a5d:	3c 37                	cmp    $0x37,%al
c0005a5f:	75 0b                	jne    c0005a6c <keyboard_read+0xaf>
c0005a61:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a68:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005a6c:	e8 e6 fe ff ff       	call   c0005957 <read_from_keyboard_buf>
c0005a71:	3c b7                	cmp    $0xb7,%al
c0005a73:	75 1d                	jne    c0005a92 <keyboard_read+0xd5>
c0005a75:	e8 dd fe ff ff       	call   c0005957 <read_from_keyboard_buf>
c0005a7a:	3c e0                	cmp    $0xe0,%al
c0005a7c:	75 14                	jne    c0005a92 <keyboard_read+0xd5>
c0005a7e:	e8 d4 fe ff ff       	call   c0005957 <read_from_keyboard_buf>
c0005a83:	3c aa                	cmp    $0xaa,%al
c0005a85:	75 0b                	jne    c0005a92 <keyboard_read+0xd5>
c0005a87:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a8e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005a92:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005a96:	75 07                	jne    c0005a9f <keyboard_read+0xe2>
c0005a98:	c6 05 64 f7 00 c0 01 	movb   $0x1,0xc000f764
c0005a9f:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005aa6:	0f 84 8d 00 00 00    	je     c0005b39 <keyboard_read+0x17c>
c0005aac:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005ab3:	0f 84 80 00 00 00    	je     c0005b39 <keyboard_read+0x17c>
c0005ab9:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005abd:	0f 94 c2             	sete   %dl
c0005ac0:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005ac4:	0f 94 c0             	sete   %al
c0005ac7:	09 d0                	or     %edx,%eax
c0005ac9:	84 c0                	test   %al,%al
c0005acb:	74 07                	je     c0005ad4 <keyboard_read+0x117>
c0005acd:	c6 05 e4 16 01 c0 01 	movb   $0x1,0xc00116e4
c0005ad4:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005ad8:	f7 d0                	not    %eax
c0005ada:	c0 e8 07             	shr    $0x7,%al
c0005add:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005ae0:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005ae4:	74 53                	je     c0005b39 <keyboard_read+0x17c>
c0005ae6:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005aea:	74 4d                	je     c0005b39 <keyboard_read+0x17c>
c0005aec:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005af0:	0f b6 05 e4 16 01 c0 	movzbl 0xc00116e4,%eax
c0005af7:	3c 01                	cmp    $0x1,%al
c0005af9:	75 04                	jne    c0005aff <keyboard_read+0x142>
c0005afb:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005aff:	0f b6 05 64 f7 00 c0 	movzbl 0xc000f764,%eax
c0005b06:	84 c0                	test   %al,%al
c0005b08:	74 04                	je     c0005b0e <keyboard_read+0x151>
c0005b0a:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005b0e:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005b12:	89 d0                	mov    %edx,%eax
c0005b14:	01 c0                	add    %eax,%eax
c0005b16:	01 c2                	add    %eax,%edx
c0005b18:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005b1c:	01 d0                	add    %edx,%eax
c0005b1e:	8b 04 85 40 e1 00 c0 	mov    -0x3fff1ec0(,%eax,4),%eax
c0005b25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b28:	83 ec 08             	sub    $0x8,%esp
c0005b2b:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b2e:	ff 75 08             	pushl  0x8(%ebp)
c0005b31:	e8 1a 00 00 00       	call   c0005b50 <in_process>
c0005b36:	83 c4 10             	add    $0x10,%esp
c0005b39:	90                   	nop
c0005b3a:	c9                   	leave  
c0005b3b:	c3                   	ret    

c0005b3c <init_keyboard_handler>:
c0005b3c:	55                   	push   %ebp
c0005b3d:	89 e5                	mov    %esp,%ebp
c0005b3f:	c6 05 64 f7 00 c0 00 	movb   $0x0,0xc000f764
c0005b46:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c0005b4d:	90                   	nop
c0005b4e:	5d                   	pop    %ebp
c0005b4f:	c3                   	ret    

c0005b50 <in_process>:
c0005b50:	55                   	push   %ebp
c0005b51:	89 e5                	mov    %esp,%ebp
c0005b53:	83 ec 18             	sub    $0x18,%esp
c0005b56:	83 ec 04             	sub    $0x4,%esp
c0005b59:	6a 02                	push   $0x2
c0005b5b:	6a 00                	push   $0x0
c0005b5d:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005b60:	50                   	push   %eax
c0005b61:	e8 f8 59 00 00       	call   c000b55e <Memset>
c0005b66:	83 c4 10             	add    $0x10,%esp
c0005b69:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b6c:	25 00 01 00 00       	and    $0x100,%eax
c0005b71:	85 c0                	test   %eax,%eax
c0005b73:	75 28                	jne    c0005b9d <in_process+0x4d>
c0005b75:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b78:	0f b6 c0             	movzbl %al,%eax
c0005b7b:	83 ec 08             	sub    $0x8,%esp
c0005b7e:	50                   	push   %eax
c0005b7f:	ff 75 08             	pushl  0x8(%ebp)
c0005b82:	e8 ce f3 ff ff       	call   c0004f55 <put_key>
c0005b87:	83 c4 10             	add    $0x10,%esp
c0005b8a:	c6 05 64 f7 00 c0 00 	movb   $0x0,0xc000f764
c0005b91:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c0005b98:	e9 42 01 00 00       	jmp    c0005cdf <in_process+0x18f>
c0005b9d:	0f b6 05 e4 16 01 c0 	movzbl 0xc00116e4,%eax
c0005ba4:	84 c0                	test   %al,%al
c0005ba6:	0f 84 a9 00 00 00    	je     c0005c55 <in_process+0x105>
c0005bac:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005bb0:	0f 84 9f 00 00 00    	je     c0005c55 <in_process+0x105>
c0005bb6:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005bba:	0f 84 95 00 00 00    	je     c0005c55 <in_process+0x105>
c0005bc0:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005bc7:	74 64                	je     c0005c2d <in_process+0xdd>
c0005bc9:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005bd0:	77 0b                	ja     c0005bdd <in_process+0x8d>
c0005bd2:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005bd9:	74 64                	je     c0005c3f <in_process+0xef>
c0005bdb:	eb 73                	jmp    c0005c50 <in_process+0x100>
c0005bdd:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005be4:	74 0b                	je     c0005bf1 <in_process+0xa1>
c0005be6:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005bed:	74 20                	je     c0005c0f <in_process+0xbf>
c0005bef:	eb 5f                	jmp    c0005c50 <in_process+0x100>
c0005bf1:	83 ec 0c             	sub    $0xc,%esp
c0005bf4:	ff 75 08             	pushl  0x8(%ebp)
c0005bf7:	e8 c5 f3 ff ff       	call   c0004fc1 <scroll_up>
c0005bfc:	83 c4 10             	add    $0x10,%esp
c0005bff:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c0005c06:	c6 05 64 f7 00 c0 00 	movb   $0x0,0xc000f764
c0005c0d:	eb 41                	jmp    c0005c50 <in_process+0x100>
c0005c0f:	83 ec 0c             	sub    $0xc,%esp
c0005c12:	ff 75 08             	pushl  0x8(%ebp)
c0005c15:	e8 e9 f3 ff ff       	call   c0005003 <scroll_down>
c0005c1a:	83 c4 10             	add    $0x10,%esp
c0005c1d:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c0005c24:	c6 05 64 f7 00 c0 00 	movb   $0x0,0xc000f764
c0005c2b:	eb 23                	jmp    c0005c50 <in_process+0x100>
c0005c2d:	83 ec 08             	sub    $0x8,%esp
c0005c30:	6a 0a                	push   $0xa
c0005c32:	ff 75 08             	pushl  0x8(%ebp)
c0005c35:	e8 34 f4 ff ff       	call   c000506e <out_char>
c0005c3a:	83 c4 10             	add    $0x10,%esp
c0005c3d:	eb 11                	jmp    c0005c50 <in_process+0x100>
c0005c3f:	83 ec 08             	sub    $0x8,%esp
c0005c42:	6a 08                	push   $0x8
c0005c44:	ff 75 08             	pushl  0x8(%ebp)
c0005c47:	e8 22 f4 ff ff       	call   c000506e <out_char>
c0005c4c:	83 c4 10             	add    $0x10,%esp
c0005c4f:	90                   	nop
c0005c50:	e9 8a 00 00 00       	jmp    c0005cdf <in_process+0x18f>
c0005c55:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c5c:	74 55                	je     c0005cb3 <in_process+0x163>
c0005c5e:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c65:	77 14                	ja     c0005c7b <in_process+0x12b>
c0005c67:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005c6e:	74 31                	je     c0005ca1 <in_process+0x151>
c0005c70:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005c77:	74 16                	je     c0005c8f <in_process+0x13f>
c0005c79:	eb 64                	jmp    c0005cdf <in_process+0x18f>
c0005c7b:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005c82:	74 3e                	je     c0005cc2 <in_process+0x172>
c0005c84:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005c8b:	74 44                	je     c0005cd1 <in_process+0x181>
c0005c8d:	eb 50                	jmp    c0005cdf <in_process+0x18f>
c0005c8f:	83 ec 08             	sub    $0x8,%esp
c0005c92:	6a 0a                	push   $0xa
c0005c94:	ff 75 08             	pushl  0x8(%ebp)
c0005c97:	e8 b9 f2 ff ff       	call   c0004f55 <put_key>
c0005c9c:	83 c4 10             	add    $0x10,%esp
c0005c9f:	eb 3e                	jmp    c0005cdf <in_process+0x18f>
c0005ca1:	83 ec 08             	sub    $0x8,%esp
c0005ca4:	6a 08                	push   $0x8
c0005ca6:	ff 75 08             	pushl  0x8(%ebp)
c0005ca9:	e8 a7 f2 ff ff       	call   c0004f55 <put_key>
c0005cae:	83 c4 10             	add    $0x10,%esp
c0005cb1:	eb 2c                	jmp    c0005cdf <in_process+0x18f>
c0005cb3:	83 ec 0c             	sub    $0xc,%esp
c0005cb6:	6a 00                	push   $0x0
c0005cb8:	e8 67 f1 ff ff       	call   c0004e24 <select_console>
c0005cbd:	83 c4 10             	add    $0x10,%esp
c0005cc0:	eb 1d                	jmp    c0005cdf <in_process+0x18f>
c0005cc2:	83 ec 0c             	sub    $0xc,%esp
c0005cc5:	6a 01                	push   $0x1
c0005cc7:	e8 58 f1 ff ff       	call   c0004e24 <select_console>
c0005ccc:	83 c4 10             	add    $0x10,%esp
c0005ccf:	eb 0e                	jmp    c0005cdf <in_process+0x18f>
c0005cd1:	83 ec 0c             	sub    $0xc,%esp
c0005cd4:	6a 02                	push   $0x2
c0005cd6:	e8 49 f1 ff ff       	call   c0004e24 <select_console>
c0005cdb:	83 c4 10             	add    $0x10,%esp
c0005cde:	90                   	nop
c0005cdf:	90                   	nop
c0005ce0:	c9                   	leave  
c0005ce1:	c3                   	ret    

c0005ce2 <open>:
c0005ce2:	55                   	push   %ebp
c0005ce3:	89 e5                	mov    %esp,%ebp
c0005ce5:	83 ec 18             	sub    $0x18,%esp
c0005ce8:	83 ec 0c             	sub    $0xc,%esp
c0005ceb:	6a 6c                	push   $0x6c
c0005ced:	e8 08 12 00 00       	call   c0006efa <sys_malloc>
c0005cf2:	83 c4 10             	add    $0x10,%esp
c0005cf5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005cf8:	83 ec 04             	sub    $0x4,%esp
c0005cfb:	6a 6c                	push   $0x6c
c0005cfd:	6a 00                	push   $0x0
c0005cff:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d02:	e8 57 58 00 00       	call   c000b55e <Memset>
c0005d07:	83 c4 10             	add    $0x10,%esp
c0005d0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d0d:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005d14:	83 ec 0c             	sub    $0xc,%esp
c0005d17:	ff 75 08             	pushl  0x8(%ebp)
c0005d1a:	e8 07 11 00 00       	call   c0006e26 <get_physical_address>
c0005d1f:	83 c4 10             	add    $0x10,%esp
c0005d22:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d28:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005d2b:	89 50 34             	mov    %edx,0x34(%eax)
c0005d2e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d34:	89 50 64             	mov    %edx,0x64(%eax)
c0005d37:	83 ec 0c             	sub    $0xc,%esp
c0005d3a:	ff 75 08             	pushl  0x8(%ebp)
c0005d3d:	e8 55 58 00 00       	call   c000b597 <Strlen>
c0005d42:	83 c4 10             	add    $0x10,%esp
c0005d45:	89 c2                	mov    %eax,%edx
c0005d47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d4a:	89 50 30             	mov    %edx,0x30(%eax)
c0005d4d:	83 ec 04             	sub    $0x4,%esp
c0005d50:	6a 04                	push   $0x4
c0005d52:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d55:	6a 03                	push   $0x3
c0005d57:	e8 eb 3d 00 00       	call   c0009b47 <send_rec>
c0005d5c:	83 c4 10             	add    $0x10,%esp
c0005d5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d62:	8b 40 40             	mov    0x40(%eax),%eax
c0005d65:	c9                   	leave  
c0005d66:	c3                   	ret    

c0005d67 <read>:
c0005d67:	55                   	push   %ebp
c0005d68:	89 e5                	mov    %esp,%ebp
c0005d6a:	83 ec 18             	sub    $0x18,%esp
c0005d6d:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005d74:	83 ec 0c             	sub    $0xc,%esp
c0005d77:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d7a:	e8 7b 11 00 00       	call   c0006efa <sys_malloc>
c0005d7f:	83 c4 10             	add    $0x10,%esp
c0005d82:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d85:	83 ec 0c             	sub    $0xc,%esp
c0005d88:	ff 75 0c             	pushl  0xc(%ebp)
c0005d8b:	e8 96 10 00 00       	call   c0006e26 <get_physical_address>
c0005d90:	83 c4 10             	add    $0x10,%esp
c0005d93:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005d96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d99:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005da0:	8b 55 08             	mov    0x8(%ebp),%edx
c0005da3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005da6:	89 50 40             	mov    %edx,0x40(%eax)
c0005da9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dac:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005daf:	89 50 10             	mov    %edx,0x10(%eax)
c0005db2:	8b 55 10             	mov    0x10(%ebp),%edx
c0005db5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005db8:	89 50 50             	mov    %edx,0x50(%eax)
c0005dbb:	83 ec 04             	sub    $0x4,%esp
c0005dbe:	6a 04                	push   $0x4
c0005dc0:	ff 75 f0             	pushl  -0x10(%ebp)
c0005dc3:	6a 03                	push   $0x3
c0005dc5:	e8 7d 3d 00 00       	call   c0009b47 <send_rec>
c0005dca:	83 c4 10             	add    $0x10,%esp
c0005dcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dd0:	8b 40 50             	mov    0x50(%eax),%eax
c0005dd3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005dd6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005dd9:	c9                   	leave  
c0005dda:	c3                   	ret    

c0005ddb <write>:
c0005ddb:	55                   	push   %ebp
c0005ddc:	89 e5                	mov    %esp,%ebp
c0005dde:	83 ec 18             	sub    $0x18,%esp
c0005de1:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005de8:	66 87 db             	xchg   %bx,%bx
c0005deb:	83 ec 0c             	sub    $0xc,%esp
c0005dee:	ff 75 f4             	pushl  -0xc(%ebp)
c0005df1:	e8 04 11 00 00       	call   c0006efa <sys_malloc>
c0005df6:	83 c4 10             	add    $0x10,%esp
c0005df9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005dfc:	66 87 db             	xchg   %bx,%bx
c0005dff:	83 ec 0c             	sub    $0xc,%esp
c0005e02:	ff 75 0c             	pushl  0xc(%ebp)
c0005e05:	e8 1c 10 00 00       	call   c0006e26 <get_physical_address>
c0005e0a:	83 c4 10             	add    $0x10,%esp
c0005e0d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005e10:	66 87 db             	xchg   %bx,%bx
c0005e13:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e16:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005e1d:	8b 55 08             	mov    0x8(%ebp),%edx
c0005e20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e23:	89 50 40             	mov    %edx,0x40(%eax)
c0005e26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e29:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005e2c:	89 50 10             	mov    %edx,0x10(%eax)
c0005e2f:	8b 55 10             	mov    0x10(%ebp),%edx
c0005e32:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e35:	89 50 50             	mov    %edx,0x50(%eax)
c0005e38:	66 87 db             	xchg   %bx,%bx
c0005e3b:	83 ec 04             	sub    $0x4,%esp
c0005e3e:	6a 04                	push   $0x4
c0005e40:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e43:	6a 03                	push   $0x3
c0005e45:	e8 fd 3c 00 00       	call   c0009b47 <send_rec>
c0005e4a:	83 c4 10             	add    $0x10,%esp
c0005e4d:	66 87 db             	xchg   %bx,%bx
c0005e50:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e53:	8b 40 50             	mov    0x50(%eax),%eax
c0005e56:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005e59:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e5c:	c9                   	leave  
c0005e5d:	c3                   	ret    

c0005e5e <close>:
c0005e5e:	55                   	push   %ebp
c0005e5f:	89 e5                	mov    %esp,%ebp
c0005e61:	83 ec 78             	sub    $0x78,%esp
c0005e64:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005e6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e6e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005e71:	83 ec 04             	sub    $0x4,%esp
c0005e74:	6a 04                	push   $0x4
c0005e76:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e79:	50                   	push   %eax
c0005e7a:	6a 03                	push   $0x3
c0005e7c:	e8 c6 3c 00 00       	call   c0009b47 <send_rec>
c0005e81:	83 c4 10             	add    $0x10,%esp
c0005e84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e87:	83 f8 65             	cmp    $0x65,%eax
c0005e8a:	74 19                	je     c0005ea5 <close+0x47>
c0005e8c:	6a 13                	push   $0x13
c0005e8e:	68 3f ad 00 c0       	push   $0xc000ad3f
c0005e93:	68 3f ad 00 c0       	push   $0xc000ad3f
c0005e98:	68 4b ad 00 c0       	push   $0xc000ad4b
c0005e9d:	e8 46 34 00 00       	call   c00092e8 <assertion_failure>
c0005ea2:	83 c4 10             	add    $0x10,%esp
c0005ea5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005ea8:	c9                   	leave  
c0005ea9:	c3                   	ret    

c0005eaa <wait>:
c0005eaa:	55                   	push   %ebp
c0005eab:	89 e5                	mov    %esp,%ebp
c0005ead:	83 ec 78             	sub    $0x78,%esp
c0005eb0:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005eb7:	83 ec 04             	sub    $0x4,%esp
c0005eba:	6a 05                	push   $0x5
c0005ebc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005ebf:	50                   	push   %eax
c0005ec0:	6a 03                	push   $0x3
c0005ec2:	e8 80 3c 00 00       	call   c0009b47 <send_rec>
c0005ec7:	83 c4 10             	add    $0x10,%esp
c0005eca:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005ecd:	89 c2                	mov    %eax,%edx
c0005ecf:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ed2:	89 10                	mov    %edx,(%eax)
c0005ed4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ed7:	83 f8 21             	cmp    $0x21,%eax
c0005eda:	74 05                	je     c0005ee1 <wait+0x37>
c0005edc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005edf:	eb 05                	jmp    c0005ee6 <wait+0x3c>
c0005ee1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005ee6:	c9                   	leave  
c0005ee7:	c3                   	ret    

c0005ee8 <exit>:
c0005ee8:	55                   	push   %ebp
c0005ee9:	89 e5                	mov    %esp,%ebp
c0005eeb:	83 ec 78             	sub    $0x78,%esp
c0005eee:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005ef5:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ef8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005efb:	83 ec 04             	sub    $0x4,%esp
c0005efe:	6a 05                	push   $0x5
c0005f00:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f03:	50                   	push   %eax
c0005f04:	6a 03                	push   $0x3
c0005f06:	e8 3c 3c 00 00       	call   c0009b47 <send_rec>
c0005f0b:	83 c4 10             	add    $0x10,%esp
c0005f0e:	90                   	nop
c0005f0f:	c9                   	leave  
c0005f10:	c3                   	ret    

c0005f11 <fork>:
c0005f11:	55                   	push   %ebp
c0005f12:	89 e5                	mov    %esp,%ebp
c0005f14:	83 ec 78             	sub    $0x78,%esp
c0005f17:	83 ec 04             	sub    $0x4,%esp
c0005f1a:	6a 6c                	push   $0x6c
c0005f1c:	6a 00                	push   $0x0
c0005f1e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f21:	50                   	push   %eax
c0005f22:	e8 37 56 00 00       	call   c000b55e <Memset>
c0005f27:	83 c4 10             	add    $0x10,%esp
c0005f2a:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005f31:	83 ec 04             	sub    $0x4,%esp
c0005f34:	6a 05                	push   $0x5
c0005f36:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f39:	50                   	push   %eax
c0005f3a:	6a 03                	push   $0x3
c0005f3c:	e8 06 3c 00 00       	call   c0009b47 <send_rec>
c0005f41:	83 c4 10             	add    $0x10,%esp
c0005f44:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005f4b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f4e:	85 c0                	test   %eax,%eax
c0005f50:	74 19                	je     c0005f6b <fork+0x5a>
c0005f52:	6a 14                	push   $0x14
c0005f54:	68 63 ad 00 c0       	push   $0xc000ad63
c0005f59:	68 63 ad 00 c0       	push   $0xc000ad63
c0005f5e:	68 6e ad 00 c0       	push   $0xc000ad6e
c0005f63:	e8 80 33 00 00       	call   c00092e8 <assertion_failure>
c0005f68:	83 c4 10             	add    $0x10,%esp
c0005f6b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f6e:	c9                   	leave  
c0005f6f:	c3                   	ret    

c0005f70 <getpid>:
c0005f70:	55                   	push   %ebp
c0005f71:	89 e5                	mov    %esp,%ebp
c0005f73:	83 ec 78             	sub    $0x78,%esp
c0005f76:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005f7d:	83 ec 04             	sub    $0x4,%esp
c0005f80:	6a 03                	push   $0x3
c0005f82:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f85:	50                   	push   %eax
c0005f86:	6a 03                	push   $0x3
c0005f88:	e8 ba 3b 00 00       	call   c0009b47 <send_rec>
c0005f8d:	83 c4 10             	add    $0x10,%esp
c0005f90:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f93:	c9                   	leave  
c0005f94:	c3                   	ret    

c0005f95 <exec>:
c0005f95:	55                   	push   %ebp
c0005f96:	89 e5                	mov    %esp,%ebp
c0005f98:	83 ec 78             	sub    $0x78,%esp
c0005f9b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005fa2:	8b 45 08             	mov    0x8(%ebp),%eax
c0005fa5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005fa8:	83 ec 0c             	sub    $0xc,%esp
c0005fab:	ff 75 08             	pushl  0x8(%ebp)
c0005fae:	e8 e4 55 00 00       	call   c000b597 <Strlen>
c0005fb3:	83 c4 10             	add    $0x10,%esp
c0005fb6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005fb9:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005fc0:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005fc7:	83 ec 04             	sub    $0x4,%esp
c0005fca:	6a 05                	push   $0x5
c0005fcc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005fcf:	50                   	push   %eax
c0005fd0:	6a 03                	push   $0x3
c0005fd2:	e8 70 3b 00 00       	call   c0009b47 <send_rec>
c0005fd7:	83 c4 10             	add    $0x10,%esp
c0005fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005fdd:	83 f8 65             	cmp    $0x65,%eax
c0005fe0:	74 19                	je     c0005ffb <exec+0x66>
c0005fe2:	6a 19                	push   $0x19
c0005fe4:	68 7e ad 00 c0       	push   $0xc000ad7e
c0005fe9:	68 7e ad 00 c0       	push   $0xc000ad7e
c0005fee:	68 89 ad 00 c0       	push   $0xc000ad89
c0005ff3:	e8 f0 32 00 00       	call   c00092e8 <assertion_failure>
c0005ff8:	83 c4 10             	add    $0x10,%esp
c0005ffb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005ffe:	c9                   	leave  
c0005fff:	c3                   	ret    

c0006000 <execv>:
c0006000:	55                   	push   %ebp
c0006001:	89 e5                	mov    %esp,%ebp
c0006003:	57                   	push   %edi
c0006004:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c000600a:	83 ec 04             	sub    $0x4,%esp
c000600d:	68 00 80 00 00       	push   $0x8000
c0006012:	6a 00                	push   $0x0
c0006014:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000601a:	50                   	push   %eax
c000601b:	e8 3e 55 00 00       	call   c000b55e <Memset>
c0006020:	83 c4 10             	add    $0x10,%esp
c0006023:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006026:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006029:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006030:	eb 0d                	jmp    c000603f <execv+0x3f>
c0006032:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0006036:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006039:	83 c0 04             	add    $0x4,%eax
c000603c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000603f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006042:	8b 00                	mov    (%eax),%eax
c0006044:	85 c0                	test   %eax,%eax
c0006046:	75 ea                	jne    c0006032 <execv+0x32>
c0006048:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000604e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006051:	01 d0                	add    %edx,%eax
c0006053:	c6 00 00             	movb   $0x0,(%eax)
c0006056:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006059:	83 c0 04             	add    $0x4,%eax
c000605c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000605f:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006065:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006068:	8b 45 0c             	mov    0xc(%ebp),%eax
c000606b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000606e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006075:	eb 64                	jmp    c00060db <execv+0xdb>
c0006077:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000607d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006080:	01 c2                	add    %eax,%edx
c0006082:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006085:	89 10                	mov    %edx,(%eax)
c0006087:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000608a:	8b 00                	mov    (%eax),%eax
c000608c:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0006092:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006095:	01 ca                	add    %ecx,%edx
c0006097:	83 ec 08             	sub    $0x8,%esp
c000609a:	50                   	push   %eax
c000609b:	52                   	push   %edx
c000609c:	e8 dc 54 00 00       	call   c000b57d <Strcpy>
c00060a1:	83 c4 10             	add    $0x10,%esp
c00060a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060a7:	8b 00                	mov    (%eax),%eax
c00060a9:	83 ec 0c             	sub    $0xc,%esp
c00060ac:	50                   	push   %eax
c00060ad:	e8 e5 54 00 00       	call   c000b597 <Strlen>
c00060b2:	83 c4 10             	add    $0x10,%esp
c00060b5:	01 45 f0             	add    %eax,-0x10(%ebp)
c00060b8:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00060be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060c1:	01 d0                	add    %edx,%eax
c00060c3:	c6 00 00             	movb   $0x0,(%eax)
c00060c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060c9:	83 c0 01             	add    $0x1,%eax
c00060cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00060cf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c00060d3:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00060d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00060db:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060de:	8b 00                	mov    (%eax),%eax
c00060e0:	85 c0                	test   %eax,%eax
c00060e2:	75 93                	jne    c0006077 <execv+0x77>
c00060e4:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00060ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00060ed:	eb 04                	jmp    c00060f3 <execv+0xf3>
c00060ef:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00060f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00060f6:	8b 00                	mov    (%eax),%eax
c00060f8:	85 c0                	test   %eax,%eax
c00060fa:	75 f3                	jne    c00060ef <execv+0xef>
c00060fc:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0006102:	b8 00 00 00 00       	mov    $0x0,%eax
c0006107:	b9 0a 00 00 00       	mov    $0xa,%ecx
c000610c:	89 d7                	mov    %edx,%edi
c000610e:	f3 ab                	rep stos %eax,%es:(%edi)
c0006110:	c7 85 4c 7f ff ff a1 	movl   $0xc000ada1,-0x80b4(%ebp)
c0006117:	ad 00 c0 
c000611a:	c7 85 50 7f ff ff a8 	movl   $0xc000ada8,-0x80b0(%ebp)
c0006121:	ad 00 c0 
c0006124:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c000612b:	00 00 00 
c000612e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006131:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0006137:	83 ec 0c             	sub    $0xc,%esp
c000613a:	ff 75 08             	pushl  0x8(%ebp)
c000613d:	e8 55 54 00 00       	call   c000b597 <Strlen>
c0006142:	83 c4 10             	add    $0x10,%esp
c0006145:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c000614b:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006151:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0006157:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000615a:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0006160:	83 ec 04             	sub    $0x4,%esp
c0006163:	6a 05                	push   $0x5
c0006165:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c000616b:	50                   	push   %eax
c000616c:	6a 03                	push   $0x3
c000616e:	e8 d4 39 00 00       	call   c0009b47 <send_rec>
c0006173:	83 c4 10             	add    $0x10,%esp
c0006176:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c000617c:	83 f8 65             	cmp    $0x65,%eax
c000617f:	74 19                	je     c000619a <execv+0x19a>
c0006181:	6a 72                	push   $0x72
c0006183:	68 7e ad 00 c0       	push   $0xc000ad7e
c0006188:	68 7e ad 00 c0       	push   $0xc000ad7e
c000618d:	68 89 ad 00 c0       	push   $0xc000ad89
c0006192:	e8 51 31 00 00       	call   c00092e8 <assertion_failure>
c0006197:	83 c4 10             	add    $0x10,%esp
c000619a:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c00061a0:	8b 7d fc             	mov    -0x4(%ebp),%edi
c00061a3:	c9                   	leave  
c00061a4:	c3                   	ret    

c00061a5 <execl>:
c00061a5:	55                   	push   %ebp
c00061a6:	89 e5                	mov    %esp,%ebp
c00061a8:	83 ec 18             	sub    $0x18,%esp
c00061ab:	8d 45 0c             	lea    0xc(%ebp),%eax
c00061ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00061b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061b7:	83 ec 08             	sub    $0x8,%esp
c00061ba:	ff 75 f0             	pushl  -0x10(%ebp)
c00061bd:	ff 75 08             	pushl  0x8(%ebp)
c00061c0:	e8 3b fe ff ff       	call   c0006000 <execv>
c00061c5:	83 c4 10             	add    $0x10,%esp
c00061c8:	c9                   	leave  
c00061c9:	c3                   	ret    

c00061ca <TaskMM>:
c00061ca:	55                   	push   %ebp
c00061cb:	89 e5                	mov    %esp,%ebp
c00061cd:	83 ec 28             	sub    $0x28,%esp
c00061d0:	83 ec 0c             	sub    $0xc,%esp
c00061d3:	68 af ad 00 c0       	push   $0xc000adaf
c00061d8:	e8 af b3 ff ff       	call   c000158c <disp_str>
c00061dd:	83 c4 10             	add    $0x10,%esp
c00061e0:	e8 c1 b6 ff ff       	call   c00018a6 <get_running_thread_pcb>
c00061e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061e8:	83 ec 0c             	sub    $0xc,%esp
c00061eb:	68 b3 ad 00 c0       	push   $0xc000adb3
c00061f0:	e8 97 b3 ff ff       	call   c000158c <disp_str>
c00061f5:	83 c4 10             	add    $0x10,%esp
c00061f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061fb:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0006201:	83 ec 0c             	sub    $0xc,%esp
c0006204:	50                   	push   %eax
c0006205:	e8 c8 18 00 00       	call   c0007ad2 <disp_int>
c000620a:	83 c4 10             	add    $0x10,%esp
c000620d:	83 ec 0c             	sub    $0xc,%esp
c0006210:	68 b5 ad 00 c0       	push   $0xc000adb5
c0006215:	e8 72 b3 ff ff       	call   c000158c <disp_str>
c000621a:	83 c4 10             	add    $0x10,%esp
c000621d:	83 ec 0c             	sub    $0xc,%esp
c0006220:	68 b7 ad 00 c0       	push   $0xc000adb7
c0006225:	e8 62 b3 ff ff       	call   c000158c <disp_str>
c000622a:	83 c4 10             	add    $0x10,%esp
c000622d:	83 ec 0c             	sub    $0xc,%esp
c0006230:	6a 6c                	push   $0x6c
c0006232:	e8 c3 0c 00 00       	call   c0006efa <sys_malloc>
c0006237:	83 c4 10             	add    $0x10,%esp
c000623a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000623d:	83 ec 0c             	sub    $0xc,%esp
c0006240:	6a 6c                	push   $0x6c
c0006242:	e8 b3 0c 00 00       	call   c0006efa <sys_malloc>
c0006247:	83 c4 10             	add    $0x10,%esp
c000624a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000624d:	83 ec 0c             	sub    $0xc,%esp
c0006250:	68 b9 ad 00 c0       	push   $0xc000adb9
c0006255:	e8 32 b3 ff ff       	call   c000158c <disp_str>
c000625a:	83 c4 10             	add    $0x10,%esp
c000625d:	83 ec 04             	sub    $0x4,%esp
c0006260:	6a 12                	push   $0x12
c0006262:	ff 75 ec             	pushl  -0x14(%ebp)
c0006265:	6a 02                	push   $0x2
c0006267:	e8 db 38 00 00       	call   c0009b47 <send_rec>
c000626c:	83 c4 10             	add    $0x10,%esp
c000626f:	83 ec 0c             	sub    $0xc,%esp
c0006272:	68 c8 ad 00 c0       	push   $0xc000adc8
c0006277:	e8 10 b3 ff ff       	call   c000158c <disp_str>
c000627c:	83 c4 10             	add    $0x10,%esp
c000627f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006282:	8b 40 68             	mov    0x68(%eax),%eax
c0006285:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006288:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000628b:	8b 00                	mov    (%eax),%eax
c000628d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006290:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006297:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000629a:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00062a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062a4:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c00062ab:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c00062af:	74 4b                	je     c00062fc <TaskMM+0x132>
c00062b1:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c00062b5:	7f 08                	jg     c00062bf <TaskMM+0xf5>
c00062b7:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
c00062bb:	74 28                	je     c00062e5 <TaskMM+0x11b>
c00062bd:	eb 6e                	jmp    c000632d <TaskMM+0x163>
c00062bf:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
c00062c3:	74 08                	je     c00062cd <TaskMM+0x103>
c00062c5:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00062c9:	74 4b                	je     c0006316 <TaskMM+0x14c>
c00062cb:	eb 60                	jmp    c000632d <TaskMM+0x163>
c00062cd:	83 ec 0c             	sub    $0xc,%esp
c00062d0:	ff 75 ec             	pushl  -0x14(%ebp)
c00062d3:	e8 f9 03 00 00       	call   c00066d1 <do_fork>
c00062d8:	83 c4 10             	add    $0x10,%esp
c00062db:	89 c2                	mov    %eax,%edx
c00062dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062e0:	89 50 4c             	mov    %edx,0x4c(%eax)
c00062e3:	eb 59                	jmp    c000633e <TaskMM+0x174>
c00062e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062ec:	83 ec 0c             	sub    $0xc,%esp
c00062ef:	ff 75 ec             	pushl  -0x14(%ebp)
c00062f2:	e8 a9 00 00 00       	call   c00063a0 <do_exec>
c00062f7:	83 c4 10             	add    $0x10,%esp
c00062fa:	eb 42                	jmp    c000633e <TaskMM+0x174>
c00062fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006303:	83 ec 08             	sub    $0x8,%esp
c0006306:	ff 75 dc             	pushl  -0x24(%ebp)
c0006309:	ff 75 ec             	pushl  -0x14(%ebp)
c000630c:	e8 2b 04 00 00       	call   c000673c <do_exit>
c0006311:	83 c4 10             	add    $0x10,%esp
c0006314:	eb 28                	jmp    c000633e <TaskMM+0x174>
c0006316:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000631d:	83 ec 0c             	sub    $0xc,%esp
c0006320:	ff 75 ec             	pushl  -0x14(%ebp)
c0006323:	e8 10 05 00 00       	call   c0006838 <do_wait>
c0006328:	83 c4 10             	add    $0x10,%esp
c000632b:	eb 11                	jmp    c000633e <TaskMM+0x174>
c000632d:	83 ec 0c             	sub    $0xc,%esp
c0006330:	68 dd ad 00 c0       	push   $0xc000addd
c0006335:	e8 90 2f 00 00       	call   c00092ca <panic>
c000633a:	83 c4 10             	add    $0x10,%esp
c000633d:	90                   	nop
c000633e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006342:	0f 84 05 ff ff ff    	je     c000624d <TaskMM+0x83>
c0006348:	83 ec 0c             	sub    $0xc,%esp
c000634b:	6a 0a                	push   $0xa
c000634d:	e8 eb 2a 00 00       	call   c0008e3d <delay>
c0006352:	83 c4 10             	add    $0x10,%esp
c0006355:	83 ec 04             	sub    $0x4,%esp
c0006358:	ff 75 e0             	pushl  -0x20(%ebp)
c000635b:	ff 75 e8             	pushl  -0x18(%ebp)
c000635e:	6a 01                	push   $0x1
c0006360:	e8 e2 37 00 00       	call   c0009b47 <send_rec>
c0006365:	83 c4 10             	add    $0x10,%esp
c0006368:	e9 e0 fe ff ff       	jmp    c000624d <TaskMM+0x83>

c000636d <alloc_mem>:
c000636d:	55                   	push   %ebp
c000636e:	89 e5                	mov    %esp,%ebp
c0006370:	83 ec 10             	sub    $0x10,%esp
c0006373:	8b 45 08             	mov    0x8(%ebp),%eax
c0006376:	83 e8 08             	sub    $0x8,%eax
c0006379:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c000637f:	05 00 00 a0 00       	add    $0xa00000,%eax
c0006384:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006387:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000638a:	c9                   	leave  
c000638b:	c3                   	ret    

c000638c <do_exec2>:
c000638c:	55                   	push   %ebp
c000638d:	89 e5                	mov    %esp,%ebp
c000638f:	83 ec 10             	sub    $0x10,%esp
c0006392:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006399:	b8 00 00 00 00       	mov    $0x0,%eax
c000639e:	c9                   	leave  
c000639f:	c3                   	ret    

c00063a0 <do_exec>:
c00063a0:	55                   	push   %ebp
c00063a1:	89 e5                	mov    %esp,%ebp
c00063a3:	56                   	push   %esi
c00063a4:	53                   	push   %ebx
c00063a5:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c00063ab:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c00063b2:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c00063b9:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c00063bf:	83 ec 08             	sub    $0x8,%esp
c00063c2:	6a 00                	push   $0x0
c00063c4:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00063c7:	50                   	push   %eax
c00063c8:	e8 15 f9 ff ff       	call   c0005ce2 <open>
c00063cd:	83 c4 10             	add    $0x10,%esp
c00063d0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00063d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00063d6:	8b 00                	mov    (%eax),%eax
c00063d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00063db:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c00063e2:	83 ec 04             	sub    $0x4,%esp
c00063e5:	6a 0c                	push   $0xc
c00063e7:	6a 00                	push   $0x0
c00063e9:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00063ef:	50                   	push   %eax
c00063f0:	e8 69 51 00 00       	call   c000b55e <Memset>
c00063f5:	83 c4 10             	add    $0x10,%esp
c00063f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00063fb:	8b 40 30             	mov    0x30(%eax),%eax
c00063fe:	89 c6                	mov    %eax,%esi
c0006400:	8b 45 08             	mov    0x8(%ebp),%eax
c0006403:	8b 40 34             	mov    0x34(%eax),%eax
c0006406:	83 ec 08             	sub    $0x8,%esp
c0006409:	50                   	push   %eax
c000640a:	ff 75 d8             	pushl  -0x28(%ebp)
c000640d:	e8 ba e7 ff ff       	call   c0004bcc <v2l>
c0006412:	83 c4 10             	add    $0x10,%esp
c0006415:	89 c3                	mov    %eax,%ebx
c0006417:	83 ec 08             	sub    $0x8,%esp
c000641a:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006420:	50                   	push   %eax
c0006421:	6a 05                	push   $0x5
c0006423:	e8 a4 e7 ff ff       	call   c0004bcc <v2l>
c0006428:	83 c4 10             	add    $0x10,%esp
c000642b:	83 ec 04             	sub    $0x4,%esp
c000642e:	56                   	push   %esi
c000642f:	53                   	push   %ebx
c0006430:	50                   	push   %eax
c0006431:	e8 fa 50 00 00       	call   c000b530 <Memcpy>
c0006436:	83 c4 10             	add    $0x10,%esp
c0006439:	83 ec 08             	sub    $0x8,%esp
c000643c:	6a 00                	push   $0x0
c000643e:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006444:	50                   	push   %eax
c0006445:	e8 98 f8 ff ff       	call   c0005ce2 <open>
c000644a:	83 c4 10             	add    $0x10,%esp
c000644d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006450:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006457:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000645a:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0006460:	01 d0                	add    %edx,%eax
c0006462:	83 ec 04             	sub    $0x4,%esp
c0006465:	68 00 02 00 00       	push   $0x200
c000646a:	50                   	push   %eax
c000646b:	ff 75 d0             	pushl  -0x30(%ebp)
c000646e:	e8 f4 f8 ff ff       	call   c0005d67 <read>
c0006473:	83 c4 10             	add    $0x10,%esp
c0006476:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006479:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000647c:	01 45 f4             	add    %eax,-0xc(%ebp)
c000647f:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0006483:	74 02                	je     c0006487 <do_exec+0xe7>
c0006485:	eb d0                	jmp    c0006457 <do_exec+0xb7>
c0006487:	90                   	nop
c0006488:	83 ec 0c             	sub    $0xc,%esp
c000648b:	ff 75 d0             	pushl  -0x30(%ebp)
c000648e:	e8 cb f9 ff ff       	call   c0005e5e <close>
c0006493:	83 c4 10             	add    $0x10,%esp
c0006496:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c000649c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000649f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00064a6:	eb 72                	jmp    c000651a <do_exec+0x17a>
c00064a8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00064ab:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00064af:	0f b7 d0             	movzwl %ax,%edx
c00064b2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00064b5:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00064b9:	0f b7 c0             	movzwl %ax,%eax
c00064bc:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00064c0:	01 c2                	add    %eax,%edx
c00064c2:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00064c8:	01 d0                	add    %edx,%eax
c00064ca:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00064cd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064d0:	8b 40 10             	mov    0x10(%eax),%eax
c00064d3:	89 c6                	mov    %eax,%esi
c00064d5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064d8:	8b 40 04             	mov    0x4(%eax),%eax
c00064db:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00064e1:	01 d0                	add    %edx,%eax
c00064e3:	83 ec 08             	sub    $0x8,%esp
c00064e6:	50                   	push   %eax
c00064e7:	6a 05                	push   $0x5
c00064e9:	e8 de e6 ff ff       	call   c0004bcc <v2l>
c00064ee:	83 c4 10             	add    $0x10,%esp
c00064f1:	89 c3                	mov    %eax,%ebx
c00064f3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064f6:	8b 40 08             	mov    0x8(%eax),%eax
c00064f9:	83 ec 08             	sub    $0x8,%esp
c00064fc:	50                   	push   %eax
c00064fd:	ff 75 d8             	pushl  -0x28(%ebp)
c0006500:	e8 c7 e6 ff ff       	call   c0004bcc <v2l>
c0006505:	83 c4 10             	add    $0x10,%esp
c0006508:	83 ec 04             	sub    $0x4,%esp
c000650b:	56                   	push   %esi
c000650c:	53                   	push   %ebx
c000650d:	50                   	push   %eax
c000650e:	e8 1d 50 00 00       	call   c000b530 <Memcpy>
c0006513:	83 c4 10             	add    $0x10,%esp
c0006516:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000651a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000651d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0006521:	0f b7 c0             	movzwl %ax,%eax
c0006524:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006527:	0f 8c 7b ff ff ff    	jl     c00064a8 <do_exec+0x108>
c000652d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006530:	8b 40 10             	mov    0x10(%eax),%eax
c0006533:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006536:	8b 45 08             	mov    0x8(%ebp),%eax
c0006539:	8b 40 1c             	mov    0x1c(%eax),%eax
c000653c:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000653f:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0006546:	83 ec 08             	sub    $0x8,%esp
c0006549:	ff 75 c0             	pushl  -0x40(%ebp)
c000654c:	ff 75 d8             	pushl  -0x28(%ebp)
c000654f:	e8 78 e6 ff ff       	call   c0004bcc <v2l>
c0006554:	83 c4 10             	add    $0x10,%esp
c0006557:	89 c3                	mov    %eax,%ebx
c0006559:	83 ec 08             	sub    $0x8,%esp
c000655c:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006562:	50                   	push   %eax
c0006563:	6a 05                	push   $0x5
c0006565:	e8 62 e6 ff ff       	call   c0004bcc <v2l>
c000656a:	83 c4 10             	add    $0x10,%esp
c000656d:	83 ec 04             	sub    $0x4,%esp
c0006570:	ff 75 bc             	pushl  -0x44(%ebp)
c0006573:	53                   	push   %ebx
c0006574:	50                   	push   %eax
c0006575:	e8 b6 4f 00 00       	call   c000b530 <Memcpy>
c000657a:	83 c4 10             	add    $0x10,%esp
c000657d:	83 ec 08             	sub    $0x8,%esp
c0006580:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006586:	50                   	push   %eax
c0006587:	6a 05                	push   $0x5
c0006589:	e8 3e e6 ff ff       	call   c0004bcc <v2l>
c000658e:	83 c4 10             	add    $0x10,%esp
c0006591:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006594:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006597:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000659a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00065a1:	eb 08                	jmp    c00065ab <do_exec+0x20b>
c00065a3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00065a7:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00065ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00065ae:	8b 00                	mov    (%eax),%eax
c00065b0:	85 c0                	test   %eax,%eax
c00065b2:	75 ef                	jne    c00065a3 <do_exec+0x203>
c00065b4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00065b7:	2b 45 c0             	sub    -0x40(%ebp),%eax
c00065ba:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00065bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00065c4:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00065ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00065cd:	eb 17                	jmp    c00065e6 <do_exec+0x246>
c00065cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00065d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065d6:	8b 10                	mov    (%eax),%edx
c00065d8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00065db:	01 c2                	add    %eax,%edx
c00065dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065e0:	89 10                	mov    %edx,(%eax)
c00065e2:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00065e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065e9:	8b 00                	mov    (%eax),%eax
c00065eb:	85 c0                	test   %eax,%eax
c00065ed:	75 e0                	jne    c00065cf <do_exec+0x22f>
c00065ef:	83 ec 08             	sub    $0x8,%esp
c00065f2:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00065f8:	50                   	push   %eax
c00065f9:	6a 05                	push   $0x5
c00065fb:	e8 cc e5 ff ff       	call   c0004bcc <v2l>
c0006600:	83 c4 10             	add    $0x10,%esp
c0006603:	89 c3                	mov    %eax,%ebx
c0006605:	83 ec 08             	sub    $0x8,%esp
c0006608:	ff 75 b8             	pushl  -0x48(%ebp)
c000660b:	ff 75 d8             	pushl  -0x28(%ebp)
c000660e:	e8 b9 e5 ff ff       	call   c0004bcc <v2l>
c0006613:	83 c4 10             	add    $0x10,%esp
c0006616:	83 ec 04             	sub    $0x4,%esp
c0006619:	ff 75 bc             	pushl  -0x44(%ebp)
c000661c:	53                   	push   %ebx
c000661d:	50                   	push   %eax
c000661e:	e8 0d 4f 00 00       	call   c000b530 <Memcpy>
c0006623:	83 c4 10             	add    $0x10,%esp
c0006626:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006629:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000662c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000662f:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006632:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c0006638:	81 c2 d8 35 08 c0    	add    $0xc00835d8,%edx
c000663e:	89 02                	mov    %eax,(%edx)
c0006640:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006643:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006646:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c000664c:	81 c2 d4 35 08 c0    	add    $0xc00835d4,%edx
c0006652:	89 02                	mov    %eax,(%edx)
c0006654:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006657:	8b 40 18             	mov    0x18(%eax),%eax
c000665a:	89 c2                	mov    %eax,%edx
c000665c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000665f:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006665:	05 dc 35 08 c0       	add    $0xc00835dc,%eax
c000666a:	89 10                	mov    %edx,(%eax)
c000666c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000666f:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006672:	69 d2 b0 02 00 00    	imul   $0x2b0,%edx,%edx
c0006678:	81 c2 e8 35 08 c0    	add    $0xc00835e8,%edx
c000667e:	89 02                	mov    %eax,(%edx)
c0006680:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006683:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006689:	05 90 35 08 c0       	add    $0xc0083590,%eax
c000668e:	c7 00 21 00 00 00    	movl   $0x21,(%eax)
c0006694:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c000669b:	00 00 00 
c000669e:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c00066a5:	00 00 00 
c00066a8:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c00066af:	00 00 00 
c00066b2:	83 ec 04             	sub    $0x4,%esp
c00066b5:	ff 75 d8             	pushl  -0x28(%ebp)
c00066b8:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c00066be:	50                   	push   %eax
c00066bf:	6a 01                	push   $0x1
c00066c1:	e8 81 34 00 00       	call   c0009b47 <send_rec>
c00066c6:	83 c4 10             	add    $0x10,%esp
c00066c9:	90                   	nop
c00066ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00066cd:	5b                   	pop    %ebx
c00066ce:	5e                   	pop    %esi
c00066cf:	5d                   	pop    %ebp
c00066d0:	c3                   	ret    

c00066d1 <do_fork>:
c00066d1:	55                   	push   %ebp
c00066d2:	89 e5                	mov    %esp,%ebp
c00066d4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00066da:	8b 45 08             	mov    0x8(%ebp),%eax
c00066dd:	8b 00                	mov    (%eax),%eax
c00066df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00066e2:	83 ec 0c             	sub    $0xc,%esp
c00066e5:	ff 75 f4             	pushl  -0xc(%ebp)
c00066e8:	e8 ba 3c 00 00       	call   c000a3a7 <fork_process>
c00066ed:	83 c4 10             	add    $0x10,%esp
c00066f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00066f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066f6:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c00066fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006702:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006708:	8b 45 08             	mov    0x8(%ebp),%eax
c000670b:	89 50 4c             	mov    %edx,0x4c(%eax)
c000670e:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006715:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000671c:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006723:	83 ec 04             	sub    $0x4,%esp
c0006726:	ff 75 ec             	pushl  -0x14(%ebp)
c0006729:	8d 45 80             	lea    -0x80(%ebp),%eax
c000672c:	50                   	push   %eax
c000672d:	6a 01                	push   $0x1
c000672f:	e8 13 34 00 00       	call   c0009b47 <send_rec>
c0006734:	83 c4 10             	add    $0x10,%esp
c0006737:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000673a:	c9                   	leave  
c000673b:	c3                   	ret    

c000673c <do_exit>:
c000673c:	55                   	push   %ebp
c000673d:	89 e5                	mov    %esp,%ebp
c000673f:	83 ec 18             	sub    $0x18,%esp
c0006742:	8b 45 08             	mov    0x8(%ebp),%eax
c0006745:	8b 00                	mov    (%eax),%eax
c0006747:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000674a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000674d:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006753:	05 40 33 08 c0       	add    $0xc0083340,%eax
c0006758:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000675b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000675e:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006764:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006767:	8b 45 08             	mov    0x8(%ebp),%eax
c000676a:	8b 40 44             	mov    0x44(%eax),%eax
c000676d:	89 c2                	mov    %eax,%edx
c000676f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006772:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006778:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000677b:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006781:	05 89 35 08 c0       	add    $0xc0083589,%eax
c0006786:	0f b6 00             	movzbl (%eax),%eax
c0006789:	3c 04                	cmp    $0x4,%al
c000678b:	75 21                	jne    c00067ae <do_exit+0x72>
c000678d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006790:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006796:	05 89 35 08 c0       	add    $0xc0083589,%eax
c000679b:	c6 00 fb             	movb   $0xfb,(%eax)
c000679e:	83 ec 0c             	sub    $0xc,%esp
c00067a1:	ff 75 ec             	pushl  -0x14(%ebp)
c00067a4:	e8 59 01 00 00       	call   c0006902 <cleanup>
c00067a9:	83 c4 10             	add    $0x10,%esp
c00067ac:	eb 0a                	jmp    c00067b8 <do_exit+0x7c>
c00067ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00067b1:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c00067b8:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c00067bf:	eb 6e                	jmp    c000682f <do_exit+0xf3>
c00067c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067c4:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00067ca:	05 a4 35 08 c0       	add    $0xc00835a4,%eax
c00067cf:	8b 00                	mov    (%eax),%eax
c00067d1:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00067d4:	75 55                	jne    c000682b <do_exit+0xef>
c00067d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067d9:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00067df:	05 a4 35 08 c0       	add    $0xc00835a4,%eax
c00067e4:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00067ea:	0f b6 05 a9 45 08 c0 	movzbl 0xc00845a9,%eax
c00067f1:	3c 04                	cmp    $0x4,%al
c00067f3:	75 36                	jne    c000682b <do_exit+0xef>
c00067f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067f8:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00067fe:	05 89 35 08 c0       	add    $0xc0083589,%eax
c0006803:	0f b6 00             	movzbl (%eax),%eax
c0006806:	3c 03                	cmp    $0x3,%al
c0006808:	75 21                	jne    c000682b <do_exit+0xef>
c000680a:	c6 05 a9 45 08 c0 fb 	movb   $0xfb,0xc00845a9
c0006811:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006814:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c000681a:	05 40 33 08 c0       	add    $0xc0083340,%eax
c000681f:	83 ec 0c             	sub    $0xc,%esp
c0006822:	50                   	push   %eax
c0006823:	e8 da 00 00 00       	call   c0006902 <cleanup>
c0006828:	83 c4 10             	add    $0x10,%esp
c000682b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000682f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006833:	7e 8c                	jle    c00067c1 <do_exit+0x85>
c0006835:	90                   	nop
c0006836:	c9                   	leave  
c0006837:	c3                   	ret    

c0006838 <do_wait>:
c0006838:	55                   	push   %ebp
c0006839:	89 e5                	mov    %esp,%ebp
c000683b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006841:	8b 45 08             	mov    0x8(%ebp),%eax
c0006844:	8b 00                	mov    (%eax),%eax
c0006846:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006849:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006850:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006857:	eb 5f                	jmp    c00068b8 <do_wait+0x80>
c0006859:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000685c:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006862:	05 a4 35 08 c0       	add    $0xc00835a4,%eax
c0006867:	8b 00                	mov    (%eax),%eax
c0006869:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000686c:	75 46                	jne    c00068b4 <do_wait+0x7c>
c000686e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006872:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006875:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c000687b:	05 89 35 08 c0       	add    $0xc0083589,%eax
c0006880:	0f b6 00             	movzbl (%eax),%eax
c0006883:	3c 03                	cmp    $0x3,%al
c0006885:	75 2d                	jne    c00068b4 <do_wait+0x7c>
c0006887:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000688a:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c0006890:	05 89 35 08 c0       	add    $0xc0083589,%eax
c0006895:	c6 00 fb             	movb   $0xfb,(%eax)
c0006898:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000689b:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00068a1:	05 40 33 08 c0       	add    $0xc0083340,%eax
c00068a6:	83 ec 0c             	sub    $0xc,%esp
c00068a9:	50                   	push   %eax
c00068aa:	e8 53 00 00 00       	call   c0006902 <cleanup>
c00068af:	83 c4 10             	add    $0x10,%esp
c00068b2:	eb 4c                	jmp    c0006900 <do_wait+0xc8>
c00068b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00068b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00068bc:	7e 9b                	jle    c0006859 <do_wait+0x21>
c00068be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00068c2:	74 13                	je     c00068d7 <do_wait+0x9f>
c00068c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068c7:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00068cd:	05 89 35 08 c0       	add    $0xc0083589,%eax
c00068d2:	c6 00 04             	movb   $0x4,(%eax)
c00068d5:	eb 29                	jmp    c0006900 <do_wait+0xc8>
c00068d7:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00068de:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00068e5:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00068ec:	83 ec 04             	sub    $0x4,%esp
c00068ef:	ff 75 ec             	pushl  -0x14(%ebp)
c00068f2:	8d 45 80             	lea    -0x80(%ebp),%eax
c00068f5:	50                   	push   %eax
c00068f6:	6a 01                	push   $0x1
c00068f8:	e8 4a 32 00 00       	call   c0009b47 <send_rec>
c00068fd:	83 c4 10             	add    $0x10,%esp
c0006900:	c9                   	leave  
c0006901:	c3                   	ret    

c0006902 <cleanup>:
c0006902:	55                   	push   %ebp
c0006903:	89 e5                	mov    %esp,%ebp
c0006905:	83 ec 78             	sub    $0x78,%esp
c0006908:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c000690f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006916:	8b 45 08             	mov    0x8(%ebp),%eax
c0006919:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c000691f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006922:	8b 45 08             	mov    0x8(%ebp),%eax
c0006925:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c000692b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000692e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006931:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006937:	83 ec 04             	sub    $0x4,%esp
c000693a:	50                   	push   %eax
c000693b:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000693e:	50                   	push   %eax
c000693f:	6a 01                	push   $0x1
c0006941:	e8 01 32 00 00       	call   c0009b47 <send_rec>
c0006946:	83 c4 10             	add    $0x10,%esp
c0006949:	8b 45 08             	mov    0x8(%ebp),%eax
c000694c:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006953:	90                   	nop
c0006954:	c9                   	leave  
c0006955:	c3                   	ret    

c0006956 <init_bitmap>:
c0006956:	55                   	push   %ebp
c0006957:	89 e5                	mov    %esp,%ebp
c0006959:	83 ec 08             	sub    $0x8,%esp
c000695c:	8b 45 08             	mov    0x8(%ebp),%eax
c000695f:	8b 50 04             	mov    0x4(%eax),%edx
c0006962:	8b 45 08             	mov    0x8(%ebp),%eax
c0006965:	8b 00                	mov    (%eax),%eax
c0006967:	83 ec 04             	sub    $0x4,%esp
c000696a:	52                   	push   %edx
c000696b:	6a 00                	push   $0x0
c000696d:	50                   	push   %eax
c000696e:	e8 eb 4b 00 00       	call   c000b55e <Memset>
c0006973:	83 c4 10             	add    $0x10,%esp
c0006976:	90                   	nop
c0006977:	c9                   	leave  
c0006978:	c3                   	ret    

c0006979 <test_bit_val>:
c0006979:	55                   	push   %ebp
c000697a:	89 e5                	mov    %esp,%ebp
c000697c:	53                   	push   %ebx
c000697d:	83 ec 10             	sub    $0x10,%esp
c0006980:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006983:	8d 50 07             	lea    0x7(%eax),%edx
c0006986:	85 c0                	test   %eax,%eax
c0006988:	0f 48 c2             	cmovs  %edx,%eax
c000698b:	c1 f8 03             	sar    $0x3,%eax
c000698e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006991:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006994:	99                   	cltd   
c0006995:	c1 ea 1d             	shr    $0x1d,%edx
c0006998:	01 d0                	add    %edx,%eax
c000699a:	83 e0 07             	and    $0x7,%eax
c000699d:	29 d0                	sub    %edx,%eax
c000699f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00069a5:	8b 10                	mov    (%eax),%edx
c00069a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00069aa:	01 d0                	add    %edx,%eax
c00069ac:	0f b6 00             	movzbl (%eax),%eax
c00069af:	88 45 f3             	mov    %al,-0xd(%ebp)
c00069b2:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c00069b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069b9:	bb 01 00 00 00       	mov    $0x1,%ebx
c00069be:	89 c1                	mov    %eax,%ecx
c00069c0:	d3 e3                	shl    %cl,%ebx
c00069c2:	89 d8                	mov    %ebx,%eax
c00069c4:	21 c2                	and    %eax,%edx
c00069c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069c9:	89 c1                	mov    %eax,%ecx
c00069cb:	d3 fa                	sar    %cl,%edx
c00069cd:	89 d0                	mov    %edx,%eax
c00069cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069d2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00069d6:	0f 9f c0             	setg   %al
c00069d9:	0f b6 c0             	movzbl %al,%eax
c00069dc:	83 c4 10             	add    $0x10,%esp
c00069df:	5b                   	pop    %ebx
c00069e0:	5d                   	pop    %ebp
c00069e1:	c3                   	ret    

c00069e2 <set_bit_val>:
c00069e2:	55                   	push   %ebp
c00069e3:	89 e5                	mov    %esp,%ebp
c00069e5:	83 ec 10             	sub    $0x10,%esp
c00069e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069eb:	8d 50 07             	lea    0x7(%eax),%edx
c00069ee:	85 c0                	test   %eax,%eax
c00069f0:	0f 48 c2             	cmovs  %edx,%eax
c00069f3:	c1 f8 03             	sar    $0x3,%eax
c00069f6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069fc:	99                   	cltd   
c00069fd:	c1 ea 1d             	shr    $0x1d,%edx
c0006a00:	01 d0                	add    %edx,%eax
c0006a02:	83 e0 07             	and    $0x7,%eax
c0006a05:	29 d0                	sub    %edx,%eax
c0006a07:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a0d:	8b 10                	mov    (%eax),%edx
c0006a0f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a12:	01 d0                	add    %edx,%eax
c0006a14:	0f b6 00             	movzbl (%eax),%eax
c0006a17:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006a1a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006a1e:	7e 13                	jle    c0006a33 <set_bit_val+0x51>
c0006a20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a23:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a28:	89 c1                	mov    %eax,%ecx
c0006a2a:	d3 e2                	shl    %cl,%edx
c0006a2c:	89 d0                	mov    %edx,%eax
c0006a2e:	08 45 ff             	or     %al,-0x1(%ebp)
c0006a31:	eb 13                	jmp    c0006a46 <set_bit_val+0x64>
c0006a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a36:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a3b:	89 c1                	mov    %eax,%ecx
c0006a3d:	d3 e2                	shl    %cl,%edx
c0006a3f:	89 d0                	mov    %edx,%eax
c0006a41:	f7 d0                	not    %eax
c0006a43:	20 45 ff             	and    %al,-0x1(%ebp)
c0006a46:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a49:	8b 10                	mov    (%eax),%edx
c0006a4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a4e:	01 c2                	add    %eax,%edx
c0006a50:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006a54:	88 02                	mov    %al,(%edx)
c0006a56:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a5b:	c9                   	leave  
c0006a5c:	c3                   	ret    

c0006a5d <set_bits>:
c0006a5d:	55                   	push   %ebp
c0006a5e:	89 e5                	mov    %esp,%ebp
c0006a60:	83 ec 10             	sub    $0x10,%esp
c0006a63:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006a6a:	eb 1c                	jmp    c0006a88 <set_bits+0x2b>
c0006a6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a6f:	8d 50 01             	lea    0x1(%eax),%edx
c0006a72:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006a75:	ff 75 10             	pushl  0x10(%ebp)
c0006a78:	50                   	push   %eax
c0006a79:	ff 75 08             	pushl  0x8(%ebp)
c0006a7c:	e8 61 ff ff ff       	call   c00069e2 <set_bit_val>
c0006a81:	83 c4 0c             	add    $0xc,%esp
c0006a84:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006a88:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a8b:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006a8e:	7c dc                	jl     c0006a6c <set_bits+0xf>
c0006a90:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a95:	c9                   	leave  
c0006a96:	c3                   	ret    

c0006a97 <get_first_free_bit>:
c0006a97:	55                   	push   %ebp
c0006a98:	89 e5                	mov    %esp,%ebp
c0006a9a:	83 ec 10             	sub    $0x10,%esp
c0006a9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006aa0:	8b 40 04             	mov    0x4(%eax),%eax
c0006aa3:	c1 e0 03             	shl    $0x3,%eax
c0006aa6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006aa9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006aac:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006aaf:	eb 1b                	jmp    c0006acc <get_first_free_bit+0x35>
c0006ab1:	ff 75 fc             	pushl  -0x4(%ebp)
c0006ab4:	ff 75 08             	pushl  0x8(%ebp)
c0006ab7:	e8 bd fe ff ff       	call   c0006979 <test_bit_val>
c0006abc:	83 c4 08             	add    $0x8,%esp
c0006abf:	85 c0                	test   %eax,%eax
c0006ac1:	75 05                	jne    c0006ac8 <get_first_free_bit+0x31>
c0006ac3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ac6:	eb 11                	jmp    c0006ad9 <get_first_free_bit+0x42>
c0006ac8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006acc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006acf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006ad2:	7c dd                	jl     c0006ab1 <get_first_free_bit+0x1a>
c0006ad4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006ad9:	c9                   	leave  
c0006ada:	c3                   	ret    

c0006adb <get_bits>:
c0006adb:	55                   	push   %ebp
c0006adc:	89 e5                	mov    %esp,%ebp
c0006ade:	83 ec 20             	sub    $0x20,%esp
c0006ae1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006ae8:	ff 75 f0             	pushl  -0x10(%ebp)
c0006aeb:	ff 75 08             	pushl  0x8(%ebp)
c0006aee:	e8 a4 ff ff ff       	call   c0006a97 <get_first_free_bit>
c0006af3:	83 c4 08             	add    $0x8,%esp
c0006af6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006af9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006afc:	8b 40 04             	mov    0x4(%eax),%eax
c0006aff:	c1 e0 03             	shl    $0x3,%eax
c0006b02:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b05:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b08:	83 e8 01             	sub    $0x1,%eax
c0006b0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b0e:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006b12:	75 08                	jne    c0006b1c <get_bits+0x41>
c0006b14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b17:	e9 85 00 00 00       	jmp    c0006ba1 <get_bits+0xc6>
c0006b1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b1f:	83 c0 01             	add    $0x1,%eax
c0006b22:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b25:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b28:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b2b:	eb 58                	jmp    c0006b85 <get_bits+0xaa>
c0006b2d:	ff 75 f8             	pushl  -0x8(%ebp)
c0006b30:	ff 75 08             	pushl  0x8(%ebp)
c0006b33:	e8 41 fe ff ff       	call   c0006979 <test_bit_val>
c0006b38:	83 c4 08             	add    $0x8,%esp
c0006b3b:	85 c0                	test   %eax,%eax
c0006b3d:	75 0a                	jne    c0006b49 <get_bits+0x6e>
c0006b3f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006b43:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b47:	eb 2b                	jmp    c0006b74 <get_bits+0x99>
c0006b49:	6a 00                	push   $0x0
c0006b4b:	ff 75 08             	pushl  0x8(%ebp)
c0006b4e:	e8 44 ff ff ff       	call   c0006a97 <get_first_free_bit>
c0006b53:	83 c4 08             	add    $0x8,%esp
c0006b56:	83 c0 01             	add    $0x1,%eax
c0006b59:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b5f:	83 c0 01             	add    $0x1,%eax
c0006b62:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b65:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b68:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b6b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b6e:	83 e8 01             	sub    $0x1,%eax
c0006b71:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b77:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006b7a:	7c 09                	jl     c0006b85 <get_bits+0xaa>
c0006b7c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006b83:	eb 0d                	jmp    c0006b92 <get_bits+0xb7>
c0006b85:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b88:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006b8b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006b8e:	85 c0                	test   %eax,%eax
c0006b90:	7f 9b                	jg     c0006b2d <get_bits+0x52>
c0006b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b95:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006b98:	83 c0 01             	add    $0x1,%eax
c0006b9b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b9e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ba1:	c9                   	leave  
c0006ba2:	c3                   	ret    

c0006ba3 <get_a_page2>:
c0006ba3:	55                   	push   %ebp
c0006ba4:	89 e5                	mov    %esp,%ebp
c0006ba6:	83 ec 18             	sub    $0x18,%esp
c0006ba9:	83 ec 0c             	sub    $0xc,%esp
c0006bac:	ff 75 0c             	pushl  0xc(%ebp)
c0006baf:	e8 1e 00 00 00       	call   c0006bd2 <get_a_page>
c0006bb4:	83 c4 10             	add    $0x10,%esp
c0006bb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006bbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bc0:	83 ec 08             	sub    $0x8,%esp
c0006bc3:	52                   	push   %edx
c0006bc4:	50                   	push   %eax
c0006bc5:	e8 61 01 00 00       	call   c0006d2b <add_map_entry>
c0006bca:	83 c4 10             	add    $0x10,%esp
c0006bcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bd0:	c9                   	leave  
c0006bd1:	c3                   	ret    

c0006bd2 <get_a_page>:
c0006bd2:	55                   	push   %ebp
c0006bd3:	89 e5                	mov    %esp,%ebp
c0006bd5:	83 ec 20             	sub    $0x20,%esp
c0006bd8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006bdc:	75 22                	jne    c0006c00 <get_a_page+0x2e>
c0006bde:	a1 cc 16 01 c0       	mov    0xc00116cc,%eax
c0006be3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006be6:	a1 d0 16 01 c0       	mov    0xc00116d0,%eax
c0006beb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bee:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c0006bf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006bf6:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c0006bfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bfe:	eb 20                	jmp    c0006c20 <get_a_page+0x4e>
c0006c00:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0006c05:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c08:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c0006c0d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c10:	a1 10 1f 01 c0       	mov    0xc0011f10,%eax
c0006c15:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c18:	a1 14 1f 01 c0       	mov    0xc0011f14,%eax
c0006c1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c23:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006c26:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c29:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006c2c:	6a 01                	push   $0x1
c0006c2e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c31:	50                   	push   %eax
c0006c32:	e8 a4 fe ff ff       	call   c0006adb <get_bits>
c0006c37:	83 c4 08             	add    $0x8,%esp
c0006c3a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006c3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c40:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006c43:	c1 e2 0c             	shl    $0xc,%edx
c0006c46:	01 d0                	add    %edx,%eax
c0006c48:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c4b:	6a 01                	push   $0x1
c0006c4d:	ff 75 fc             	pushl  -0x4(%ebp)
c0006c50:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c53:	50                   	push   %eax
c0006c54:	e8 89 fd ff ff       	call   c00069e2 <set_bit_val>
c0006c59:	83 c4 0c             	add    $0xc,%esp
c0006c5c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c5f:	c9                   	leave  
c0006c60:	c3                   	ret    

c0006c61 <get_virtual_address>:
c0006c61:	55                   	push   %ebp
c0006c62:	89 e5                	mov    %esp,%ebp
c0006c64:	83 ec 28             	sub    $0x28,%esp
c0006c67:	e8 3a ac ff ff       	call   c00018a6 <get_running_thread_pcb>
c0006c6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c6f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006c73:	75 1a                	jne    c0006c8f <get_virtual_address+0x2e>
c0006c75:	a1 74 f7 00 c0       	mov    0xc000f774,%eax
c0006c7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c7d:	a1 78 f7 00 c0       	mov    0xc000f778,%eax
c0006c82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c85:	a1 7c f7 00 c0       	mov    0xc000f77c,%eax
c0006c8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c8d:	eb 18                	jmp    c0006ca7 <get_virtual_address+0x46>
c0006c8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c92:	8b 40 0c             	mov    0xc(%eax),%eax
c0006c95:	83 ec 04             	sub    $0x4,%esp
c0006c98:	6a 0c                	push   $0xc
c0006c9a:	50                   	push   %eax
c0006c9b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c9e:	50                   	push   %eax
c0006c9f:	e8 8c 48 00 00       	call   c000b530 <Memcpy>
c0006ca4:	83 c4 10             	add    $0x10,%esp
c0006ca7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006caa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006cad:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006cb0:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006cb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cb6:	83 ec 08             	sub    $0x8,%esp
c0006cb9:	50                   	push   %eax
c0006cba:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006cbd:	50                   	push   %eax
c0006cbe:	e8 18 fe ff ff       	call   c0006adb <get_bits>
c0006cc3:	83 c4 10             	add    $0x10,%esp
c0006cc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006cc9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ccc:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006ccf:	c1 e2 0c             	shl    $0xc,%edx
c0006cd2:	01 d0                	add    %edx,%eax
c0006cd4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006cd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cda:	50                   	push   %eax
c0006cdb:	6a 01                	push   $0x1
c0006cdd:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ce0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ce3:	50                   	push   %eax
c0006ce4:	e8 74 fd ff ff       	call   c0006a5d <set_bits>
c0006ce9:	83 c4 10             	add    $0x10,%esp
c0006cec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006cef:	c9                   	leave  
c0006cf0:	c3                   	ret    

c0006cf1 <ptr_pde>:
c0006cf1:	55                   	push   %ebp
c0006cf2:	89 e5                	mov    %esp,%ebp
c0006cf4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cf7:	c1 e8 16             	shr    $0x16,%eax
c0006cfa:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006cff:	c1 e0 02             	shl    $0x2,%eax
c0006d02:	5d                   	pop    %ebp
c0006d03:	c3                   	ret    

c0006d04 <ptr_pte>:
c0006d04:	55                   	push   %ebp
c0006d05:	89 e5                	mov    %esp,%ebp
c0006d07:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d0a:	c1 e8 0a             	shr    $0xa,%eax
c0006d0d:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006d12:	89 c2                	mov    %eax,%edx
c0006d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d17:	c1 e8 0c             	shr    $0xc,%eax
c0006d1a:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006d1f:	c1 e0 02             	shl    $0x2,%eax
c0006d22:	01 d0                	add    %edx,%eax
c0006d24:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006d29:	5d                   	pop    %ebp
c0006d2a:	c3                   	ret    

c0006d2b <add_map_entry>:
c0006d2b:	55                   	push   %ebp
c0006d2c:	89 e5                	mov    %esp,%ebp
c0006d2e:	83 ec 18             	sub    $0x18,%esp
c0006d31:	ff 75 08             	pushl  0x8(%ebp)
c0006d34:	e8 b8 ff ff ff       	call   c0006cf1 <ptr_pde>
c0006d39:	83 c4 04             	add    $0x4,%esp
c0006d3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d3f:	ff 75 08             	pushl  0x8(%ebp)
c0006d42:	e8 bd ff ff ff       	call   c0006d04 <ptr_pte>
c0006d47:	83 c4 04             	add    $0x4,%esp
c0006d4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d50:	8b 00                	mov    (%eax),%eax
c0006d52:	83 e0 01             	and    $0x1,%eax
c0006d55:	85 c0                	test   %eax,%eax
c0006d57:	74 1b                	je     c0006d74 <add_map_entry+0x49>
c0006d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d5c:	8b 00                	mov    (%eax),%eax
c0006d5e:	83 e0 01             	and    $0x1,%eax
c0006d61:	85 c0                	test   %eax,%eax
c0006d63:	75 51                	jne    c0006db6 <add_map_entry+0x8b>
c0006d65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d68:	83 c8 07             	or     $0x7,%eax
c0006d6b:	89 c2                	mov    %eax,%edx
c0006d6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d70:	89 10                	mov    %edx,(%eax)
c0006d72:	eb 42                	jmp    c0006db6 <add_map_entry+0x8b>
c0006d74:	6a 00                	push   $0x0
c0006d76:	e8 57 fe ff ff       	call   c0006bd2 <get_a_page>
c0006d7b:	83 c4 04             	add    $0x4,%esp
c0006d7e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d81:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d84:	83 c8 07             	or     $0x7,%eax
c0006d87:	89 c2                	mov    %eax,%edx
c0006d89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d8c:	89 10                	mov    %edx,(%eax)
c0006d8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d91:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d96:	83 ec 04             	sub    $0x4,%esp
c0006d99:	68 00 10 00 00       	push   $0x1000
c0006d9e:	6a 00                	push   $0x0
c0006da0:	50                   	push   %eax
c0006da1:	e8 b8 47 00 00       	call   c000b55e <Memset>
c0006da6:	83 c4 10             	add    $0x10,%esp
c0006da9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006dac:	83 c8 07             	or     $0x7,%eax
c0006daf:	89 c2                	mov    %eax,%edx
c0006db1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006db4:	89 10                	mov    %edx,(%eax)
c0006db6:	90                   	nop
c0006db7:	c9                   	leave  
c0006db8:	c3                   	ret    

c0006db9 <alloc_virtual_memory>:
c0006db9:	55                   	push   %ebp
c0006dba:	89 e5                	mov    %esp,%ebp
c0006dbc:	83 ec 18             	sub    $0x18,%esp
c0006dbf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006dc2:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006dc7:	c1 e8 0c             	shr    $0xc,%eax
c0006dca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006dcd:	e8 d4 aa ff ff       	call   c00018a6 <get_running_thread_pcb>
c0006dd2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006dd5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dd8:	8b 40 08             	mov    0x8(%eax),%eax
c0006ddb:	85 c0                	test   %eax,%eax
c0006ddd:	75 09                	jne    c0006de8 <alloc_virtual_memory+0x2f>
c0006ddf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006de6:	eb 07                	jmp    c0006def <alloc_virtual_memory+0x36>
c0006de8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006def:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006df2:	83 ec 08             	sub    $0x8,%esp
c0006df5:	ff 75 f4             	pushl  -0xc(%ebp)
c0006df8:	50                   	push   %eax
c0006df9:	e8 63 fe ff ff       	call   c0006c61 <get_virtual_address>
c0006dfe:	83 c4 10             	add    $0x10,%esp
c0006e01:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e04:	83 ec 08             	sub    $0x8,%esp
c0006e07:	ff 75 08             	pushl  0x8(%ebp)
c0006e0a:	ff 75 e8             	pushl  -0x18(%ebp)
c0006e0d:	e8 19 ff ff ff       	call   c0006d2b <add_map_entry>
c0006e12:	83 c4 10             	add    $0x10,%esp
c0006e15:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e18:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e1d:	89 c2                	mov    %eax,%edx
c0006e1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006e22:	01 d0                	add    %edx,%eax
c0006e24:	c9                   	leave  
c0006e25:	c3                   	ret    

c0006e26 <get_physical_address>:
c0006e26:	55                   	push   %ebp
c0006e27:	89 e5                	mov    %esp,%ebp
c0006e29:	83 ec 10             	sub    $0x10,%esp
c0006e2c:	ff 75 08             	pushl  0x8(%ebp)
c0006e2f:	e8 d0 fe ff ff       	call   c0006d04 <ptr_pte>
c0006e34:	83 c4 04             	add    $0x4,%esp
c0006e37:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e3a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e3d:	8b 00                	mov    (%eax),%eax
c0006e3f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e44:	89 c2                	mov    %eax,%edx
c0006e46:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e49:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e4e:	09 d0                	or     %edx,%eax
c0006e50:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e53:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e56:	c9                   	leave  
c0006e57:	c3                   	ret    

c0006e58 <alloc_memory>:
c0006e58:	55                   	push   %ebp
c0006e59:	89 e5                	mov    %esp,%ebp
c0006e5b:	83 ec 18             	sub    $0x18,%esp
c0006e5e:	83 ec 08             	sub    $0x8,%esp
c0006e61:	ff 75 0c             	pushl  0xc(%ebp)
c0006e64:	ff 75 08             	pushl  0x8(%ebp)
c0006e67:	e8 f5 fd ff ff       	call   c0006c61 <get_virtual_address>
c0006e6c:	83 c4 10             	add    $0x10,%esp
c0006e6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e72:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e75:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006e7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e7d:	eb 29                	jmp    c0006ea8 <alloc_memory+0x50>
c0006e7f:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006e86:	83 ec 0c             	sub    $0xc,%esp
c0006e89:	ff 75 0c             	pushl  0xc(%ebp)
c0006e8c:	e8 41 fd ff ff       	call   c0006bd2 <get_a_page>
c0006e91:	83 c4 10             	add    $0x10,%esp
c0006e94:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e97:	83 ec 08             	sub    $0x8,%esp
c0006e9a:	ff 75 ec             	pushl  -0x14(%ebp)
c0006e9d:	ff 75 f4             	pushl  -0xc(%ebp)
c0006ea0:	e8 86 fe ff ff       	call   c0006d2b <add_map_entry>
c0006ea5:	83 c4 10             	add    $0x10,%esp
c0006ea8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006eab:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006eae:	89 55 08             	mov    %edx,0x8(%ebp)
c0006eb1:	85 c0                	test   %eax,%eax
c0006eb3:	75 ca                	jne    c0006e7f <alloc_memory+0x27>
c0006eb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006eb8:	c9                   	leave  
c0006eb9:	c3                   	ret    

c0006eba <get_a_virtual_page>:
c0006eba:	55                   	push   %ebp
c0006ebb:	89 e5                	mov    %esp,%ebp
c0006ebd:	83 ec 18             	sub    $0x18,%esp
c0006ec0:	ff 75 08             	pushl  0x8(%ebp)
c0006ec3:	e8 0a fd ff ff       	call   c0006bd2 <get_a_page>
c0006ec8:	83 c4 04             	add    $0x4,%esp
c0006ecb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ece:	83 ec 08             	sub    $0x8,%esp
c0006ed1:	ff 75 f4             	pushl  -0xc(%ebp)
c0006ed4:	ff 75 0c             	pushl  0xc(%ebp)
c0006ed7:	e8 4f fe ff ff       	call   c0006d2b <add_map_entry>
c0006edc:	83 c4 10             	add    $0x10,%esp
c0006edf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ee2:	c9                   	leave  
c0006ee3:	c3                   	ret    

c0006ee4 <block2arena>:
c0006ee4:	55                   	push   %ebp
c0006ee5:	89 e5                	mov    %esp,%ebp
c0006ee7:	83 ec 10             	sub    $0x10,%esp
c0006eea:	8b 45 08             	mov    0x8(%ebp),%eax
c0006eed:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ef2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ef5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ef8:	c9                   	leave  
c0006ef9:	c3                   	ret    

c0006efa <sys_malloc>:
c0006efa:	55                   	push   %ebp
c0006efb:	89 e5                	mov    %esp,%ebp
c0006efd:	83 ec 58             	sub    $0x58,%esp
c0006f00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006f07:	e8 9a a9 ff ff       	call   c00018a6 <get_running_thread_pcb>
c0006f0c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006f0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f12:	8b 40 08             	mov    0x8(%eax),%eax
c0006f15:	85 c0                	test   %eax,%eax
c0006f17:	75 10                	jne    c0006f29 <sys_malloc+0x2f>
c0006f19:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006f20:	c7 45 ec 40 32 08 c0 	movl   $0xc0083240,-0x14(%ebp)
c0006f27:	eb 10                	jmp    c0006f39 <sys_malloc+0x3f>
c0006f29:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006f30:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f33:	83 c0 10             	add    $0x10,%eax
c0006f36:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f39:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0006f40:	76 50                	jbe    c0006f92 <sys_malloc+0x98>
c0006f42:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f45:	05 0b 10 00 00       	add    $0x100b,%eax
c0006f4a:	c1 e8 0c             	shr    $0xc,%eax
c0006f4d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f50:	83 ec 08             	sub    $0x8,%esp
c0006f53:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f56:	ff 75 d8             	pushl  -0x28(%ebp)
c0006f59:	e8 fa fe ff ff       	call   c0006e58 <alloc_memory>
c0006f5e:	83 c4 10             	add    $0x10,%esp
c0006f61:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006f64:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006f67:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006f6a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f6d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0006f73:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f76:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0006f7d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f80:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0006f84:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f87:	83 c0 0c             	add    $0xc,%eax
c0006f8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f8d:	e9 d9 01 00 00       	jmp    c000716b <sys_malloc+0x271>
c0006f92:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006f99:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006fa0:	eb 26                	jmp    c0006fc8 <sys_malloc+0xce>
c0006fa2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006fa5:	89 d0                	mov    %edx,%eax
c0006fa7:	01 c0                	add    %eax,%eax
c0006fa9:	01 d0                	add    %edx,%eax
c0006fab:	c1 e0 03             	shl    $0x3,%eax
c0006fae:	89 c2                	mov    %eax,%edx
c0006fb0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fb3:	01 d0                	add    %edx,%eax
c0006fb5:	8b 00                	mov    (%eax),%eax
c0006fb7:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006fba:	77 08                	ja     c0006fc4 <sys_malloc+0xca>
c0006fbc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006fbf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fc2:	eb 0a                	jmp    c0006fce <sys_malloc+0xd4>
c0006fc4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006fc8:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0006fcc:	7e d4                	jle    c0006fa2 <sys_malloc+0xa8>
c0006fce:	83 ec 08             	sub    $0x8,%esp
c0006fd1:	ff 75 f0             	pushl  -0x10(%ebp)
c0006fd4:	6a 01                	push   $0x1
c0006fd6:	e8 7d fe ff ff       	call   c0006e58 <alloc_memory>
c0006fdb:	83 c4 10             	add    $0x10,%esp
c0006fde:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006fe1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fe4:	89 d0                	mov    %edx,%eax
c0006fe6:	01 c0                	add    %eax,%eax
c0006fe8:	01 d0                	add    %edx,%eax
c0006fea:	c1 e0 03             	shl    $0x3,%eax
c0006fed:	89 c2                	mov    %eax,%edx
c0006fef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ff2:	01 d0                	add    %edx,%eax
c0006ff4:	83 ec 04             	sub    $0x4,%esp
c0006ff7:	6a 18                	push   $0x18
c0006ff9:	50                   	push   %eax
c0006ffa:	ff 75 cc             	pushl  -0x34(%ebp)
c0006ffd:	e8 2e 45 00 00       	call   c000b530 <Memcpy>
c0007002:	83 c4 10             	add    $0x10,%esp
c0007005:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007008:	89 d0                	mov    %edx,%eax
c000700a:	01 c0                	add    %eax,%eax
c000700c:	01 d0                	add    %edx,%eax
c000700e:	c1 e0 03             	shl    $0x3,%eax
c0007011:	89 c2                	mov    %eax,%edx
c0007013:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007016:	01 d0                	add    %edx,%eax
c0007018:	83 c0 08             	add    $0x8,%eax
c000701b:	83 f8 08             	cmp    $0x8,%eax
c000701e:	75 22                	jne    c0007042 <sys_malloc+0x148>
c0007020:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007023:	89 d0                	mov    %edx,%eax
c0007025:	01 c0                	add    %eax,%eax
c0007027:	01 d0                	add    %edx,%eax
c0007029:	c1 e0 03             	shl    $0x3,%eax
c000702c:	89 c2                	mov    %eax,%edx
c000702e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007031:	01 d0                	add    %edx,%eax
c0007033:	83 c0 08             	add    $0x8,%eax
c0007036:	83 ec 0c             	sub    $0xc,%esp
c0007039:	50                   	push   %eax
c000703a:	e8 93 0a 00 00       	call   c0007ad2 <disp_int>
c000703f:	83 c4 10             	add    $0x10,%esp
c0007042:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007045:	89 d0                	mov    %edx,%eax
c0007047:	01 c0                	add    %eax,%eax
c0007049:	01 d0                	add    %edx,%eax
c000704b:	c1 e0 03             	shl    $0x3,%eax
c000704e:	89 c2                	mov    %eax,%edx
c0007050:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007053:	01 d0                	add    %edx,%eax
c0007055:	83 c0 08             	add    $0x8,%eax
c0007058:	83 ec 0c             	sub    $0xc,%esp
c000705b:	50                   	push   %eax
c000705c:	e8 92 35 00 00       	call   c000a5f3 <isListEmpty>
c0007061:	83 c4 10             	add    $0x10,%esp
c0007064:	3c 01                	cmp    $0x1,%al
c0007066:	0f 85 91 00 00 00    	jne    c00070fd <sys_malloc+0x203>
c000706c:	83 ec 08             	sub    $0x8,%esp
c000706f:	ff 75 f0             	pushl  -0x10(%ebp)
c0007072:	6a 01                	push   $0x1
c0007074:	e8 df fd ff ff       	call   c0006e58 <alloc_memory>
c0007079:	83 c4 10             	add    $0x10,%esp
c000707c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000707f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007082:	8b 00                	mov    (%eax),%eax
c0007084:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007087:	c7 45 c0 0c 00 00 00 	movl   $0xc,-0x40(%ebp)
c000708e:	b8 00 10 00 00       	mov    $0x1000,%eax
c0007093:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0007096:	ba 00 00 00 00       	mov    $0x0,%edx
c000709b:	f7 75 c4             	divl   -0x3c(%ebp)
c000709e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00070a1:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00070a4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00070a7:	01 d0                	add    %edx,%eax
c00070a9:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00070ac:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00070b3:	eb 3b                	jmp    c00070f0 <sys_malloc+0x1f6>
c00070b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00070b8:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
c00070bc:	89 c2                	mov    %eax,%edx
c00070be:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00070c1:	01 d0                	add    %edx,%eax
c00070c3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00070c6:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c00070c9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00070cc:	89 d0                	mov    %edx,%eax
c00070ce:	01 c0                	add    %eax,%eax
c00070d0:	01 d0                	add    %edx,%eax
c00070d2:	c1 e0 03             	shl    $0x3,%eax
c00070d5:	89 c2                	mov    %eax,%edx
c00070d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070da:	01 d0                	add    %edx,%eax
c00070dc:	83 c0 08             	add    $0x8,%eax
c00070df:	83 ec 08             	sub    $0x8,%esp
c00070e2:	51                   	push   %ecx
c00070e3:	50                   	push   %eax
c00070e4:	e8 8f 35 00 00       	call   c000a678 <appendToDoubleLinkList>
c00070e9:	83 c4 10             	add    $0x10,%esp
c00070ec:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00070f0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00070f3:	8d 50 ff             	lea    -0x1(%eax),%edx
c00070f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00070f9:	39 c2                	cmp    %eax,%edx
c00070fb:	77 b8                	ja     c00070b5 <sys_malloc+0x1bb>
c00070fd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007100:	89 d0                	mov    %edx,%eax
c0007102:	01 c0                	add    %eax,%eax
c0007104:	01 d0                	add    %edx,%eax
c0007106:	c1 e0 03             	shl    $0x3,%eax
c0007109:	89 c2                	mov    %eax,%edx
c000710b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000710e:	01 d0                	add    %edx,%eax
c0007110:	83 c0 08             	add    $0x8,%eax
c0007113:	83 ec 0c             	sub    $0xc,%esp
c0007116:	50                   	push   %eax
c0007117:	e8 f6 35 00 00       	call   c000a712 <popFromDoubleLinkList>
c000711c:	83 c4 10             	add    $0x10,%esp
c000711f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0007122:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0007125:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007128:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c000712c:	75 1c                	jne    c000714a <sys_malloc+0x250>
c000712e:	68 72 01 00 00       	push   $0x172
c0007133:	68 ee ad 00 c0       	push   $0xc000adee
c0007138:	68 ee ad 00 c0       	push   $0xc000adee
c000713d:	68 f8 ad 00 c0       	push   $0xc000adf8
c0007142:	e8 a1 21 00 00       	call   c00092e8 <assertion_failure>
c0007147:	83 c4 10             	add    $0x10,%esp
c000714a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000714d:	83 ec 0c             	sub    $0xc,%esp
c0007150:	50                   	push   %eax
c0007151:	e8 8e fd ff ff       	call   c0006ee4 <block2arena>
c0007156:	83 c4 10             	add    $0x10,%esp
c0007159:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000715c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000715f:	8b 40 04             	mov    0x4(%eax),%eax
c0007162:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007165:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0007168:	89 50 04             	mov    %edx,0x4(%eax)
c000716b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000716e:	c9                   	leave  
c000716f:	c3                   	ret    

c0007170 <remove_map_entry>:
c0007170:	55                   	push   %ebp
c0007171:	89 e5                	mov    %esp,%ebp
c0007173:	83 ec 10             	sub    $0x10,%esp
c0007176:	ff 75 08             	pushl  0x8(%ebp)
c0007179:	e8 86 fb ff ff       	call   c0006d04 <ptr_pte>
c000717e:	83 c4 04             	add    $0x4,%esp
c0007181:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007184:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007187:	8b 10                	mov    (%eax),%edx
c0007189:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000718c:	89 10                	mov    %edx,(%eax)
c000718e:	90                   	nop
c000718f:	c9                   	leave  
c0007190:	c3                   	ret    

c0007191 <free_a_page>:
c0007191:	55                   	push   %ebp
c0007192:	89 e5                	mov    %esp,%ebp
c0007194:	83 ec 20             	sub    $0x20,%esp
c0007197:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000719b:	75 21                	jne    c00071be <free_a_page+0x2d>
c000719d:	a1 74 f7 00 c0       	mov    0xc000f774,%eax
c00071a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00071a5:	a1 78 f7 00 c0       	mov    0xc000f778,%eax
c00071aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00071ad:	a1 7c f7 00 c0       	mov    0xc000f77c,%eax
c00071b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00071b5:	c7 45 fc cc 16 01 c0 	movl   $0xc00116cc,-0x4(%ebp)
c00071bc:	eb 1f                	jmp    c00071dd <free_a_page+0x4c>
c00071be:	a1 74 f7 00 c0       	mov    0xc000f774,%eax
c00071c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00071c6:	a1 78 f7 00 c0       	mov    0xc000f778,%eax
c00071cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00071ce:	a1 7c f7 00 c0       	mov    0xc000f77c,%eax
c00071d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00071d6:	c7 45 fc 08 1f 01 c0 	movl   $0xc0011f08,-0x4(%ebp)
c00071dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00071e0:	c1 e8 0c             	shr    $0xc,%eax
c00071e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00071e6:	6a 00                	push   $0x0
c00071e8:	ff 75 f8             	pushl  -0x8(%ebp)
c00071eb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c00071ee:	50                   	push   %eax
c00071ef:	e8 ee f7 ff ff       	call   c00069e2 <set_bit_val>
c00071f4:	83 c4 0c             	add    $0xc,%esp
c00071f7:	ff 75 08             	pushl  0x8(%ebp)
c00071fa:	e8 27 fc ff ff       	call   c0006e26 <get_physical_address>
c00071ff:	83 c4 04             	add    $0x4,%esp
c0007202:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007205:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007208:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000720e:	85 c0                	test   %eax,%eax
c0007210:	0f 48 c2             	cmovs  %edx,%eax
c0007213:	c1 f8 0c             	sar    $0xc,%eax
c0007216:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007219:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000721c:	6a 00                	push   $0x0
c000721e:	ff 75 f0             	pushl  -0x10(%ebp)
c0007221:	50                   	push   %eax
c0007222:	e8 bb f7 ff ff       	call   c00069e2 <set_bit_val>
c0007227:	83 c4 0c             	add    $0xc,%esp
c000722a:	ff 75 08             	pushl  0x8(%ebp)
c000722d:	e8 3e ff ff ff       	call   c0007170 <remove_map_entry>
c0007232:	83 c4 04             	add    $0x4,%esp
c0007235:	90                   	nop
c0007236:	c9                   	leave  
c0007237:	c3                   	ret    

c0007238 <sys_free>:
c0007238:	55                   	push   %ebp
c0007239:	89 e5                	mov    %esp,%ebp
c000723b:	83 ec 48             	sub    $0x48,%esp
c000723e:	e8 63 a6 ff ff       	call   c00018a6 <get_running_thread_pcb>
c0007243:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007246:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007249:	8b 40 08             	mov    0x8(%eax),%eax
c000724c:	85 c0                	test   %eax,%eax
c000724e:	75 09                	jne    c0007259 <sys_free+0x21>
c0007250:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007257:	eb 07                	jmp    c0007260 <sys_free+0x28>
c0007259:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007260:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0007267:	76 4d                	jbe    c00072b6 <sys_free+0x7e>
c0007269:	8b 45 08             	mov    0x8(%ebp),%eax
c000726c:	83 e8 0c             	sub    $0xc,%eax
c000726f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007272:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0007276:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007279:	05 ff 0f 00 00       	add    $0xfff,%eax
c000727e:	c1 e8 0c             	shr    $0xc,%eax
c0007281:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007284:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000728b:	eb 1c                	jmp    c00072a9 <sys_free+0x71>
c000728d:	83 ec 08             	sub    $0x8,%esp
c0007290:	ff 75 f4             	pushl  -0xc(%ebp)
c0007293:	ff 75 f0             	pushl  -0x10(%ebp)
c0007296:	e8 f6 fe ff ff       	call   c0007191 <free_a_page>
c000729b:	83 c4 10             	add    $0x10,%esp
c000729e:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
c00072a5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00072a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072ac:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c00072af:	77 dc                	ja     c000728d <sys_free+0x55>
c00072b1:	e9 ef 00 00 00       	jmp    c00073a5 <sys_free+0x16d>
c00072b6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00072bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00072c4:	eb 24                	jmp    c00072ea <sys_free+0xb2>
c00072c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00072c9:	89 d0                	mov    %edx,%eax
c00072cb:	01 c0                	add    %eax,%eax
c00072cd:	01 d0                	add    %edx,%eax
c00072cf:	c1 e0 03             	shl    $0x3,%eax
c00072d2:	05 40 32 08 c0       	add    $0xc0083240,%eax
c00072d7:	8b 00                	mov    (%eax),%eax
c00072d9:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00072dc:	77 08                	ja     c00072e6 <sys_free+0xae>
c00072de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00072e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00072e4:	eb 0a                	jmp    c00072f0 <sys_free+0xb8>
c00072e6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00072ea:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00072ee:	7e d6                	jle    c00072c6 <sys_free+0x8e>
c00072f0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00072f3:	89 d0                	mov    %edx,%eax
c00072f5:	01 c0                	add    %eax,%eax
c00072f7:	01 d0                	add    %edx,%eax
c00072f9:	c1 e0 03             	shl    $0x3,%eax
c00072fc:	05 40 32 08 c0       	add    $0xc0083240,%eax
c0007301:	8b 10                	mov    (%eax),%edx
c0007303:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007306:	8b 50 04             	mov    0x4(%eax),%edx
c0007309:	89 55 bc             	mov    %edx,-0x44(%ebp)
c000730c:	8b 50 08             	mov    0x8(%eax),%edx
c000730f:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007312:	8b 50 0c             	mov    0xc(%eax),%edx
c0007315:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0007318:	8b 50 10             	mov    0x10(%eax),%edx
c000731b:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000731e:	8b 40 14             	mov    0x14(%eax),%eax
c0007321:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007324:	8b 45 08             	mov    0x8(%ebp),%eax
c0007327:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000732a:	83 ec 0c             	sub    $0xc,%esp
c000732d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007330:	e8 af fb ff ff       	call   c0006ee4 <block2arena>
c0007335:	83 c4 10             	add    $0x10,%esp
c0007338:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000733b:	83 ec 08             	sub    $0x8,%esp
c000733e:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007341:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0007344:	83 c0 08             	add    $0x8,%eax
c0007347:	50                   	push   %eax
c0007348:	e8 2b 33 00 00       	call   c000a678 <appendToDoubleLinkList>
c000734d:	83 c4 10             	add    $0x10,%esp
c0007350:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007353:	8b 40 04             	mov    0x4(%eax),%eax
c0007356:	8d 50 01             	lea    0x1(%eax),%edx
c0007359:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000735c:	89 50 04             	mov    %edx,0x4(%eax)
c000735f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007362:	8b 50 04             	mov    0x4(%eax),%edx
c0007365:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007368:	39 c2                	cmp    %eax,%edx
c000736a:	75 39                	jne    c00073a5 <sys_free+0x16d>
c000736c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007373:	eb 16                	jmp    c000738b <sys_free+0x153>
c0007375:	83 ec 0c             	sub    $0xc,%esp
c0007378:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000737b:	83 c0 08             	add    $0x8,%eax
c000737e:	50                   	push   %eax
c000737f:	e8 8e 33 00 00       	call   c000a712 <popFromDoubleLinkList>
c0007384:	83 c4 10             	add    $0x10,%esp
c0007387:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000738b:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000738e:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0007391:	7c e2                	jl     c0007375 <sys_free+0x13d>
c0007393:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007396:	83 ec 08             	sub    $0x8,%esp
c0007399:	ff 75 f4             	pushl  -0xc(%ebp)
c000739c:	50                   	push   %eax
c000739d:	e8 ef fd ff ff       	call   c0007191 <free_a_page>
c00073a2:	83 c4 10             	add    $0x10,%esp
c00073a5:	90                   	nop
c00073a6:	c9                   	leave  
c00073a7:	c3                   	ret    

c00073a8 <init_memory_block_desc>:
c00073a8:	55                   	push   %ebp
c00073a9:	89 e5                	mov    %esp,%ebp
c00073ab:	83 ec 18             	sub    $0x18,%esp
c00073ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00073b5:	e9 b2 00 00 00       	jmp    c000746c <init_memory_block_desc+0xc4>
c00073ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00073be:	75 1b                	jne    c00073db <init_memory_block_desc+0x33>
c00073c0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073c3:	89 d0                	mov    %edx,%eax
c00073c5:	01 c0                	add    %eax,%eax
c00073c7:	01 d0                	add    %edx,%eax
c00073c9:	c1 e0 03             	shl    $0x3,%eax
c00073cc:	89 c2                	mov    %eax,%edx
c00073ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00073d1:	01 d0                	add    %edx,%eax
c00073d3:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c00073d9:	eb 2e                	jmp    c0007409 <init_memory_block_desc+0x61>
c00073db:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073de:	89 d0                	mov    %edx,%eax
c00073e0:	01 c0                	add    %eax,%eax
c00073e2:	01 d0                	add    %edx,%eax
c00073e4:	c1 e0 03             	shl    $0x3,%eax
c00073e7:	8d 50 e8             	lea    -0x18(%eax),%edx
c00073ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00073ed:	01 d0                	add    %edx,%eax
c00073ef:	8b 08                	mov    (%eax),%ecx
c00073f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073f4:	89 d0                	mov    %edx,%eax
c00073f6:	01 c0                	add    %eax,%eax
c00073f8:	01 d0                	add    %edx,%eax
c00073fa:	c1 e0 03             	shl    $0x3,%eax
c00073fd:	89 c2                	mov    %eax,%edx
c00073ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0007402:	01 d0                	add    %edx,%eax
c0007404:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007407:	89 10                	mov    %edx,(%eax)
c0007409:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000740c:	89 d0                	mov    %edx,%eax
c000740e:	01 c0                	add    %eax,%eax
c0007410:	01 d0                	add    %edx,%eax
c0007412:	c1 e0 03             	shl    $0x3,%eax
c0007415:	89 c2                	mov    %eax,%edx
c0007417:	8b 45 08             	mov    0x8(%ebp),%eax
c000741a:	01 d0                	add    %edx,%eax
c000741c:	8b 00                	mov    (%eax),%eax
c000741e:	89 c1                	mov    %eax,%ecx
c0007420:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007425:	ba 00 00 00 00       	mov    $0x0,%edx
c000742a:	f7 f1                	div    %ecx
c000742c:	89 c1                	mov    %eax,%ecx
c000742e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007431:	89 d0                	mov    %edx,%eax
c0007433:	01 c0                	add    %eax,%eax
c0007435:	01 d0                	add    %edx,%eax
c0007437:	c1 e0 03             	shl    $0x3,%eax
c000743a:	89 c2                	mov    %eax,%edx
c000743c:	8b 45 08             	mov    0x8(%ebp),%eax
c000743f:	01 d0                	add    %edx,%eax
c0007441:	89 ca                	mov    %ecx,%edx
c0007443:	89 50 04             	mov    %edx,0x4(%eax)
c0007446:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007449:	89 d0                	mov    %edx,%eax
c000744b:	01 c0                	add    %eax,%eax
c000744d:	01 d0                	add    %edx,%eax
c000744f:	c1 e0 03             	shl    $0x3,%eax
c0007452:	89 c2                	mov    %eax,%edx
c0007454:	8b 45 08             	mov    0x8(%ebp),%eax
c0007457:	01 d0                	add    %edx,%eax
c0007459:	83 c0 08             	add    $0x8,%eax
c000745c:	83 ec 0c             	sub    $0xc,%esp
c000745f:	50                   	push   %eax
c0007460:	e8 60 31 00 00       	call   c000a5c5 <initDoubleLinkList>
c0007465:	83 c4 10             	add    $0x10,%esp
c0007468:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000746c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0007470:	0f 8e 44 ff ff ff    	jle    c00073ba <init_memory_block_desc+0x12>
c0007476:	90                   	nop
c0007477:	c9                   	leave  
c0007478:	c3                   	ret    

c0007479 <init_memory2>:
c0007479:	55                   	push   %ebp
c000747a:	89 e5                	mov    %esp,%ebp
c000747c:	83 ec 38             	sub    $0x38,%esp
c000747f:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007486:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c000748d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007490:	a3 d4 16 01 c0       	mov    %eax,0xc00116d4
c0007495:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007498:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c000749d:	29 c2                	sub    %eax,%edx
c000749f:	89 d0                	mov    %edx,%eax
c00074a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00074a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00074a7:	89 c2                	mov    %eax,%edx
c00074a9:	c1 ea 1f             	shr    $0x1f,%edx
c00074ac:	01 d0                	add    %edx,%eax
c00074ae:	d1 f8                	sar    %eax
c00074b0:	a3 d8 16 01 c0       	mov    %eax,0xc00116d8
c00074b5:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c00074ba:	83 ec 0c             	sub    $0xc,%esp
c00074bd:	50                   	push   %eax
c00074be:	e8 0f 06 00 00       	call   c0007ad2 <disp_int>
c00074c3:	83 c4 10             	add    $0x10,%esp
c00074c6:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c00074cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00074ce:	29 c2                	sub    %eax,%edx
c00074d0:	89 d0                	mov    %edx,%eax
c00074d2:	a3 14 1f 01 c0       	mov    %eax,0xc0011f14
c00074d7:	83 ec 0c             	sub    $0xc,%esp
c00074da:	68 0a ae 00 c0       	push   $0xc000ae0a
c00074df:	e8 a8 a0 ff ff       	call   c000158c <disp_str>
c00074e4:	83 c4 10             	add    $0x10,%esp
c00074e7:	a1 14 1f 01 c0       	mov    0xc0011f14,%eax
c00074ec:	83 ec 0c             	sub    $0xc,%esp
c00074ef:	50                   	push   %eax
c00074f0:	e8 dd 05 00 00       	call   c0007ad2 <disp_int>
c00074f5:	83 c4 10             	add    $0x10,%esp
c00074f8:	83 ec 0c             	sub    $0xc,%esp
c00074fb:	68 0a ae 00 c0       	push   $0xc000ae0a
c0007500:	e8 87 a0 ff ff       	call   c000158c <disp_str>
c0007505:	83 c4 10             	add    $0x10,%esp
c0007508:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c000750d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007512:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007518:	85 c0                	test   %eax,%eax
c000751a:	0f 48 c2             	cmovs  %edx,%eax
c000751d:	c1 f8 0c             	sar    $0xc,%eax
c0007520:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007523:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007526:	83 c0 07             	add    $0x7,%eax
c0007529:	8d 50 07             	lea    0x7(%eax),%edx
c000752c:	85 c0                	test   %eax,%eax
c000752e:	0f 48 c2             	cmovs  %edx,%eax
c0007531:	c1 f8 03             	sar    $0x3,%eax
c0007534:	a3 d0 16 01 c0       	mov    %eax,0xc00116d0
c0007539:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c000753e:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007543:	a3 cc 16 01 c0       	mov    %eax,0xc00116cc
c0007548:	8b 15 d0 16 01 c0    	mov    0xc00116d0,%edx
c000754e:	a1 cc 16 01 c0       	mov    0xc00116cc,%eax
c0007553:	83 ec 04             	sub    $0x4,%esp
c0007556:	52                   	push   %edx
c0007557:	6a 00                	push   $0x0
c0007559:	50                   	push   %eax
c000755a:	e8 ff 3f 00 00       	call   c000b55e <Memset>
c000755f:	83 c4 10             	add    $0x10,%esp
c0007562:	a1 d0 16 01 c0       	mov    0xc00116d0,%eax
c0007567:	05 ff 0f 00 00       	add    $0xfff,%eax
c000756c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007572:	85 c0                	test   %eax,%eax
c0007574:	0f 48 c2             	cmovs  %edx,%eax
c0007577:	c1 f8 0c             	sar    $0xc,%eax
c000757a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000757d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007580:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007583:	ff 75 e8             	pushl  -0x18(%ebp)
c0007586:	6a 01                	push   $0x1
c0007588:	6a 00                	push   $0x0
c000758a:	68 cc 16 01 c0       	push   $0xc00116cc
c000758f:	e8 c9 f4 ff ff       	call   c0006a5d <set_bits>
c0007594:	83 c4 10             	add    $0x10,%esp
c0007597:	a1 14 1f 01 c0       	mov    0xc0011f14,%eax
c000759c:	05 ff 0f 00 00       	add    $0xfff,%eax
c00075a1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00075a7:	85 c0                	test   %eax,%eax
c00075a9:	0f 48 c2             	cmovs  %edx,%eax
c00075ac:	c1 f8 0c             	sar    $0xc,%eax
c00075af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00075b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00075b5:	83 c0 07             	add    $0x7,%eax
c00075b8:	8d 50 07             	lea    0x7(%eax),%edx
c00075bb:	85 c0                	test   %eax,%eax
c00075bd:	0f 48 c2             	cmovs  %edx,%eax
c00075c0:	c1 f8 03             	sar    $0x3,%eax
c00075c3:	a3 0c 1f 01 c0       	mov    %eax,0xc0011f0c
c00075c8:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c00075cd:	8b 15 d0 16 01 c0    	mov    0xc00116d0,%edx
c00075d3:	01 d0                	add    %edx,%eax
c00075d5:	a3 08 1f 01 c0       	mov    %eax,0xc0011f08
c00075da:	8b 15 0c 1f 01 c0    	mov    0xc0011f0c,%edx
c00075e0:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c00075e5:	83 ec 04             	sub    $0x4,%esp
c00075e8:	52                   	push   %edx
c00075e9:	6a 00                	push   $0x0
c00075eb:	50                   	push   %eax
c00075ec:	e8 6d 3f 00 00       	call   c000b55e <Memset>
c00075f1:	83 c4 10             	add    $0x10,%esp
c00075f4:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c00075f9:	05 ff 0f 00 00       	add    $0xfff,%eax
c00075fe:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007604:	85 c0                	test   %eax,%eax
c0007606:	0f 48 c2             	cmovs  %edx,%eax
c0007609:	c1 f8 0c             	sar    $0xc,%eax
c000760c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000760f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007612:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007615:	ff 75 e8             	pushl  -0x18(%ebp)
c0007618:	6a 01                	push   $0x1
c000761a:	ff 75 e0             	pushl  -0x20(%ebp)
c000761d:	68 cc 16 01 c0       	push   $0xc00116cc
c0007622:	e8 36 f4 ff ff       	call   c0006a5d <set_bits>
c0007627:	83 c4 10             	add    $0x10,%esp
c000762a:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0007631:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007634:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007637:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000763a:	83 c0 07             	add    $0x7,%eax
c000763d:	8d 50 07             	lea    0x7(%eax),%edx
c0007640:	85 c0                	test   %eax,%eax
c0007642:	0f 48 c2             	cmovs  %edx,%eax
c0007645:	c1 f8 03             	sar    $0x3,%eax
c0007648:	a3 78 f7 00 c0       	mov    %eax,0xc000f778
c000764d:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c0007652:	8b 15 d0 16 01 c0    	mov    0xc00116d0,%edx
c0007658:	01 c2                	add    %eax,%edx
c000765a:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c000765f:	01 d0                	add    %edx,%eax
c0007661:	a3 74 f7 00 c0       	mov    %eax,0xc000f774
c0007666:	8b 15 78 f7 00 c0    	mov    0xc000f778,%edx
c000766c:	a1 74 f7 00 c0       	mov    0xc000f774,%eax
c0007671:	83 ec 04             	sub    $0x4,%esp
c0007674:	52                   	push   %edx
c0007675:	6a 00                	push   $0x0
c0007677:	50                   	push   %eax
c0007678:	e8 e1 3e 00 00       	call   c000b55e <Memset>
c000767d:	83 c4 10             	add    $0x10,%esp
c0007680:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007683:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007686:	01 d0                	add    %edx,%eax
c0007688:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000768b:	a1 78 f7 00 c0       	mov    0xc000f778,%eax
c0007690:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007695:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000769b:	85 c0                	test   %eax,%eax
c000769d:	0f 48 c2             	cmovs  %edx,%eax
c00076a0:	c1 f8 0c             	sar    $0xc,%eax
c00076a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00076a6:	ff 75 e8             	pushl  -0x18(%ebp)
c00076a9:	6a 01                	push   $0x1
c00076ab:	ff 75 e0             	pushl  -0x20(%ebp)
c00076ae:	68 cc 16 01 c0       	push   $0xc00116cc
c00076b3:	e8 a5 f3 ff ff       	call   c0006a5d <set_bits>
c00076b8:	83 c4 10             	add    $0x10,%esp
c00076bb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00076be:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00076c1:	01 d0                	add    %edx,%eax
c00076c3:	c1 e0 0c             	shl    $0xc,%eax
c00076c6:	a3 7c f7 00 c0       	mov    %eax,0xc000f77c
c00076cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00076ce:	83 c0 02             	add    $0x2,%eax
c00076d1:	c1 e0 0c             	shl    $0xc,%eax
c00076d4:	89 c2                	mov    %eax,%edx
c00076d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00076d9:	01 d0                	add    %edx,%eax
c00076db:	a3 7c f7 00 c0       	mov    %eax,0xc000f77c
c00076e0:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00076e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00076ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00076ed:	90                   	nop
c00076ee:	c9                   	leave  
c00076ef:	c3                   	ret    

c00076f0 <init_memory>:
c00076f0:	55                   	push   %ebp
c00076f1:	89 e5                	mov    %esp,%ebp
c00076f3:	83 ec 38             	sub    $0x38,%esp
c00076f6:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c00076fd:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007704:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c000770b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000770e:	05 00 00 10 00       	add    $0x100000,%eax
c0007713:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007716:	8b 45 08             	mov    0x8(%ebp),%eax
c0007719:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000771c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007722:	85 c0                	test   %eax,%eax
c0007724:	0f 48 c2             	cmovs  %edx,%eax
c0007727:	c1 f8 0c             	sar    $0xc,%eax
c000772a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000772d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007730:	89 c2                	mov    %eax,%edx
c0007732:	c1 ea 1f             	shr    $0x1f,%edx
c0007735:	01 d0                	add    %edx,%eax
c0007737:	d1 f8                	sar    %eax
c0007739:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000773c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000773f:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007742:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007745:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007748:	8d 50 07             	lea    0x7(%eax),%edx
c000774b:	85 c0                	test   %eax,%eax
c000774d:	0f 48 c2             	cmovs  %edx,%eax
c0007750:	c1 f8 03             	sar    $0x3,%eax
c0007753:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007756:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007759:	8d 50 07             	lea    0x7(%eax),%edx
c000775c:	85 c0                	test   %eax,%eax
c000775e:	0f 48 c2             	cmovs  %edx,%eax
c0007761:	c1 f8 03             	sar    $0x3,%eax
c0007764:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007767:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000776a:	a3 d4 16 01 c0       	mov    %eax,0xc00116d4
c000776f:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c0007774:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007777:	c1 e2 0c             	shl    $0xc,%edx
c000777a:	01 d0                	add    %edx,%eax
c000777c:	a3 10 1f 01 c0       	mov    %eax,0xc0011f10
c0007781:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007784:	a3 cc 16 01 c0       	mov    %eax,0xc00116cc
c0007789:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000778c:	a3 d0 16 01 c0       	mov    %eax,0xc00116d0
c0007791:	a1 cc 16 01 c0       	mov    0xc00116cc,%eax
c0007796:	83 ec 04             	sub    $0x4,%esp
c0007799:	ff 75 d8             	pushl  -0x28(%ebp)
c000779c:	6a 00                	push   $0x0
c000779e:	50                   	push   %eax
c000779f:	e8 ba 3d 00 00       	call   c000b55e <Memset>
c00077a4:	83 c4 10             	add    $0x10,%esp
c00077a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00077ad:	01 d0                	add    %edx,%eax
c00077af:	a3 08 1f 01 c0       	mov    %eax,0xc0011f08
c00077b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00077b7:	a3 0c 1f 01 c0       	mov    %eax,0xc0011f0c
c00077bc:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c00077c1:	83 ec 04             	sub    $0x4,%esp
c00077c4:	ff 75 d4             	pushl  -0x2c(%ebp)
c00077c7:	6a 00                	push   $0x0
c00077c9:	50                   	push   %eax
c00077ca:	e8 8f 3d 00 00       	call   c000b55e <Memset>
c00077cf:	83 c4 10             	add    $0x10,%esp
c00077d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00077d5:	a3 78 f7 00 c0       	mov    %eax,0xc000f778
c00077da:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00077e0:	01 c2                	add    %eax,%edx
c00077e2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00077e5:	01 d0                	add    %edx,%eax
c00077e7:	a3 74 f7 00 c0       	mov    %eax,0xc000f774
c00077ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00077ef:	05 00 00 10 00       	add    $0x100000,%eax
c00077f4:	a3 7c f7 00 c0       	mov    %eax,0xc000f77c
c00077f9:	a1 74 f7 00 c0       	mov    0xc000f774,%eax
c00077fe:	83 ec 04             	sub    $0x4,%esp
c0007801:	ff 75 d8             	pushl  -0x28(%ebp)
c0007804:	6a 00                	push   $0x0
c0007806:	50                   	push   %eax
c0007807:	e8 52 3d 00 00       	call   c000b55e <Memset>
c000780c:	83 c4 10             	add    $0x10,%esp
c000780f:	83 ec 0c             	sub    $0xc,%esp
c0007812:	68 40 32 08 c0       	push   $0xc0083240
c0007817:	e8 8c fb ff ff       	call   c00073a8 <init_memory_block_desc>
c000781c:	83 c4 10             	add    $0x10,%esp
c000781f:	90                   	nop
c0007820:	c9                   	leave  
c0007821:	c3                   	ret    

c0007822 <untar>:
c0007822:	55                   	push   %ebp
c0007823:	89 e5                	mov    %esp,%ebp
c0007825:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c000782b:	83 ec 08             	sub    $0x8,%esp
c000782e:	6a 00                	push   $0x0
c0007830:	ff 75 08             	pushl  0x8(%ebp)
c0007833:	e8 aa e4 ff ff       	call   c0005ce2 <open>
c0007838:	83 c4 10             	add    $0x10,%esp
c000783b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000783e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007845:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c000784c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007853:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000785a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000785e:	7e 58                	jle    c00078b8 <untar+0x96>
c0007860:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007863:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007868:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000786e:	85 c0                	test   %eax,%eax
c0007870:	0f 48 c2             	cmovs  %edx,%eax
c0007873:	c1 f8 09             	sar    $0x9,%eax
c0007876:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007879:	83 ec 04             	sub    $0x4,%esp
c000787c:	68 00 20 00 00       	push   $0x2000
c0007881:	6a 00                	push   $0x0
c0007883:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007889:	50                   	push   %eax
c000788a:	e8 cf 3c 00 00       	call   c000b55e <Memset>
c000788f:	83 c4 10             	add    $0x10,%esp
c0007892:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007895:	c1 e0 09             	shl    $0x9,%eax
c0007898:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000789b:	83 ec 04             	sub    $0x4,%esp
c000789e:	50                   	push   %eax
c000789f:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00078a5:	50                   	push   %eax
c00078a6:	ff 75 e4             	pushl  -0x1c(%ebp)
c00078a9:	e8 b9 e4 ff ff       	call   c0005d67 <read>
c00078ae:	83 c4 10             	add    $0x10,%esp
c00078b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00078b8:	83 ec 04             	sub    $0x4,%esp
c00078bb:	68 00 20 00 00       	push   $0x2000
c00078c0:	6a 00                	push   $0x0
c00078c2:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00078c8:	50                   	push   %eax
c00078c9:	e8 90 3c 00 00       	call   c000b55e <Memset>
c00078ce:	83 c4 10             	add    $0x10,%esp
c00078d1:	83 ec 04             	sub    $0x4,%esp
c00078d4:	68 00 02 00 00       	push   $0x200
c00078d9:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00078df:	50                   	push   %eax
c00078e0:	ff 75 e4             	pushl  -0x1c(%ebp)
c00078e3:	e8 7f e4 ff ff       	call   c0005d67 <read>
c00078e8:	83 c4 10             	add    $0x10,%esp
c00078eb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00078ee:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c00078f2:	0f 84 1f 01 00 00    	je     c0007a17 <untar+0x1f5>
c00078f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00078fb:	01 45 f4             	add    %eax,-0xc(%ebp)
c00078fe:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007905:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000790b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000790e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007911:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007914:	83 ec 08             	sub    $0x8,%esp
c0007917:	6a 07                	push   $0x7
c0007919:	ff 75 cc             	pushl  -0x34(%ebp)
c000791c:	e8 c1 e3 ff ff       	call   c0005ce2 <open>
c0007921:	83 c4 10             	add    $0x10,%esp
c0007924:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007927:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000792e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007931:	83 c0 7c             	add    $0x7c,%eax
c0007934:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007937:	83 ec 0c             	sub    $0xc,%esp
c000793a:	ff 75 cc             	pushl  -0x34(%ebp)
c000793d:	e8 55 3c 00 00       	call   c000b597 <Strlen>
c0007942:	83 c4 10             	add    $0x10,%esp
c0007945:	85 c0                	test   %eax,%eax
c0007947:	75 16                	jne    c000795f <untar+0x13d>
c0007949:	83 ec 0c             	sub    $0xc,%esp
c000794c:	ff 75 c4             	pushl  -0x3c(%ebp)
c000794f:	e8 43 3c 00 00       	call   c000b597 <Strlen>
c0007954:	83 c4 10             	add    $0x10,%esp
c0007957:	85 c0                	test   %eax,%eax
c0007959:	0f 84 bb 00 00 00    	je     c0007a1a <untar+0x1f8>
c000795f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007962:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007965:	eb 1f                	jmp    c0007986 <untar+0x164>
c0007967:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000796a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007971:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007974:	0f b6 00             	movzbl (%eax),%eax
c0007977:	0f be c0             	movsbl %al,%eax
c000797a:	83 e8 30             	sub    $0x30,%eax
c000797d:	01 d0                	add    %edx,%eax
c000797f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007982:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007986:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007989:	0f b6 00             	movzbl (%eax),%eax
c000798c:	84 c0                	test   %al,%al
c000798e:	75 d7                	jne    c0007967 <untar+0x145>
c0007990:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007993:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007996:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c000799d:	eb 5f                	jmp    c00079fe <untar+0x1dc>
c000799f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00079a2:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c00079a5:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c00079a9:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00079ac:	83 ec 04             	sub    $0x4,%esp
c00079af:	68 00 02 00 00       	push   $0x200
c00079b4:	6a 00                	push   $0x0
c00079b6:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00079bc:	50                   	push   %eax
c00079bd:	e8 9c 3b 00 00       	call   c000b55e <Memset>
c00079c2:	83 c4 10             	add    $0x10,%esp
c00079c5:	83 ec 04             	sub    $0x4,%esp
c00079c8:	ff 75 bc             	pushl  -0x44(%ebp)
c00079cb:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00079d1:	50                   	push   %eax
c00079d2:	ff 75 e4             	pushl  -0x1c(%ebp)
c00079d5:	e8 8d e3 ff ff       	call   c0005d67 <read>
c00079da:	83 c4 10             	add    $0x10,%esp
c00079dd:	01 45 f4             	add    %eax,-0xc(%ebp)
c00079e0:	83 ec 04             	sub    $0x4,%esp
c00079e3:	ff 75 bc             	pushl  -0x44(%ebp)
c00079e6:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00079ec:	50                   	push   %eax
c00079ed:	ff 75 c8             	pushl  -0x38(%ebp)
c00079f0:	e8 e6 e3 ff ff       	call   c0005ddb <write>
c00079f5:	83 c4 10             	add    $0x10,%esp
c00079f8:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00079fb:	29 45 e8             	sub    %eax,-0x18(%ebp)
c00079fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007a02:	75 9b                	jne    c000799f <untar+0x17d>
c0007a04:	83 ec 0c             	sub    $0xc,%esp
c0007a07:	ff 75 c8             	pushl  -0x38(%ebp)
c0007a0a:	e8 4f e4 ff ff       	call   c0005e5e <close>
c0007a0f:	83 c4 10             	add    $0x10,%esp
c0007a12:	e9 43 fe ff ff       	jmp    c000785a <untar+0x38>
c0007a17:	90                   	nop
c0007a18:	eb 01                	jmp    c0007a1b <untar+0x1f9>
c0007a1a:	90                   	nop
c0007a1b:	83 ec 0c             	sub    $0xc,%esp
c0007a1e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007a21:	e8 38 e4 ff ff       	call   c0005e5e <close>
c0007a26:	83 c4 10             	add    $0x10,%esp
c0007a29:	90                   	nop
c0007a2a:	c9                   	leave  
c0007a2b:	c3                   	ret    

c0007a2c <atoi>:
c0007a2c:	55                   	push   %ebp
c0007a2d:	89 e5                	mov    %esp,%ebp
c0007a2f:	83 ec 10             	sub    $0x10,%esp
c0007a32:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a35:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007a38:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a3b:	8d 50 01             	lea    0x1(%eax),%edx
c0007a3e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007a41:	c6 00 30             	movb   $0x30,(%eax)
c0007a44:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a47:	8d 50 01             	lea    0x1(%eax),%edx
c0007a4a:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007a4d:	c6 00 78             	movb   $0x78,(%eax)
c0007a50:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007a54:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007a58:	75 0e                	jne    c0007a68 <atoi+0x3c>
c0007a5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a5d:	8d 50 01             	lea    0x1(%eax),%edx
c0007a60:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007a63:	c6 00 30             	movb   $0x30,(%eax)
c0007a66:	eb 61                	jmp    c0007ac9 <atoi+0x9d>
c0007a68:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007a6f:	eb 52                	jmp    c0007ac3 <atoi+0x97>
c0007a71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a74:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007a77:	89 c1                	mov    %eax,%ecx
c0007a79:	d3 fa                	sar    %cl,%edx
c0007a7b:	89 d0                	mov    %edx,%eax
c0007a7d:	83 e0 0f             	and    $0xf,%eax
c0007a80:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a83:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007a87:	75 06                	jne    c0007a8f <atoi+0x63>
c0007a89:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007a8d:	74 2f                	je     c0007abe <atoi+0x92>
c0007a8f:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007a93:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007a97:	83 c0 30             	add    $0x30,%eax
c0007a9a:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a9d:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007aa1:	7e 0a                	jle    c0007aad <atoi+0x81>
c0007aa3:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007aa7:	83 c0 07             	add    $0x7,%eax
c0007aaa:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007aad:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ab0:	8d 50 01             	lea    0x1(%eax),%edx
c0007ab3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ab6:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007aba:	88 10                	mov    %dl,(%eax)
c0007abc:	eb 01                	jmp    c0007abf <atoi+0x93>
c0007abe:	90                   	nop
c0007abf:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007ac3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007ac7:	79 a8                	jns    c0007a71 <atoi+0x45>
c0007ac9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007acc:	c6 00 00             	movb   $0x0,(%eax)
c0007acf:	90                   	nop
c0007ad0:	c9                   	leave  
c0007ad1:	c3                   	ret    

c0007ad2 <disp_int>:
c0007ad2:	55                   	push   %ebp
c0007ad3:	89 e5                	mov    %esp,%ebp
c0007ad5:	83 ec 18             	sub    $0x18,%esp
c0007ad8:	ff 75 08             	pushl  0x8(%ebp)
c0007adb:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007ade:	50                   	push   %eax
c0007adf:	e8 48 ff ff ff       	call   c0007a2c <atoi>
c0007ae4:	83 c4 08             	add    $0x8,%esp
c0007ae7:	83 ec 08             	sub    $0x8,%esp
c0007aea:	6a 0b                	push   $0xb
c0007aec:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007aef:	50                   	push   %eax
c0007af0:	e8 d2 9a ff ff       	call   c00015c7 <disp_str_colour>
c0007af5:	83 c4 10             	add    $0x10,%esp
c0007af8:	90                   	nop
c0007af9:	c9                   	leave  
c0007afa:	c3                   	ret    

c0007afb <do_page_fault>:
c0007afb:	55                   	push   %ebp
c0007afc:	89 e5                	mov    %esp,%ebp
c0007afe:	83 ec 28             	sub    $0x28,%esp
c0007b01:	0f 20 d0             	mov    %cr2,%eax
c0007b04:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007b07:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c0007b0e:	00 00 00 
c0007b11:	83 ec 0c             	sub    $0xc,%esp
c0007b14:	68 20 ae 00 c0       	push   $0xc000ae20
c0007b19:	e8 6e 9a ff ff       	call   c000158c <disp_str>
c0007b1e:	83 c4 10             	add    $0x10,%esp
c0007b21:	83 ec 0c             	sub    $0xc,%esp
c0007b24:	68 2f ae 00 c0       	push   $0xc000ae2f
c0007b29:	e8 5e 9a ff ff       	call   c000158c <disp_str>
c0007b2e:	83 c4 10             	add    $0x10,%esp
c0007b31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b34:	83 ec 0c             	sub    $0xc,%esp
c0007b37:	50                   	push   %eax
c0007b38:	e8 95 ff ff ff       	call   c0007ad2 <disp_int>
c0007b3d:	83 c4 10             	add    $0x10,%esp
c0007b40:	83 ec 0c             	sub    $0xc,%esp
c0007b43:	68 34 ae 00 c0       	push   $0xc000ae34
c0007b48:	e8 3f 9a ff ff       	call   c000158c <disp_str>
c0007b4d:	83 c4 10             	add    $0x10,%esp
c0007b50:	83 ec 0c             	sub    $0xc,%esp
c0007b53:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b56:	e8 96 f1 ff ff       	call   c0006cf1 <ptr_pde>
c0007b5b:	83 c4 10             	add    $0x10,%esp
c0007b5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007b61:	83 ec 0c             	sub    $0xc,%esp
c0007b64:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b67:	e8 98 f1 ff ff       	call   c0006d04 <ptr_pte>
c0007b6c:	83 c4 10             	add    $0x10,%esp
c0007b6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007b72:	83 ec 0c             	sub    $0xc,%esp
c0007b75:	68 36 ae 00 c0       	push   $0xc000ae36
c0007b7a:	e8 0d 9a ff ff       	call   c000158c <disp_str>
c0007b7f:	83 c4 10             	add    $0x10,%esp
c0007b82:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b85:	83 ec 0c             	sub    $0xc,%esp
c0007b88:	50                   	push   %eax
c0007b89:	e8 44 ff ff ff       	call   c0007ad2 <disp_int>
c0007b8e:	83 c4 10             	add    $0x10,%esp
c0007b91:	83 ec 0c             	sub    $0xc,%esp
c0007b94:	68 3b ae 00 c0       	push   $0xc000ae3b
c0007b99:	e8 ee 99 ff ff       	call   c000158c <disp_str>
c0007b9e:	83 c4 10             	add    $0x10,%esp
c0007ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007ba4:	8b 00                	mov    (%eax),%eax
c0007ba6:	83 ec 0c             	sub    $0xc,%esp
c0007ba9:	50                   	push   %eax
c0007baa:	e8 23 ff ff ff       	call   c0007ad2 <disp_int>
c0007baf:	83 c4 10             	add    $0x10,%esp
c0007bb2:	83 ec 0c             	sub    $0xc,%esp
c0007bb5:	68 34 ae 00 c0       	push   $0xc000ae34
c0007bba:	e8 cd 99 ff ff       	call   c000158c <disp_str>
c0007bbf:	83 c4 10             	add    $0x10,%esp
c0007bc2:	83 ec 0c             	sub    $0xc,%esp
c0007bc5:	68 44 ae 00 c0       	push   $0xc000ae44
c0007bca:	e8 bd 99 ff ff       	call   c000158c <disp_str>
c0007bcf:	83 c4 10             	add    $0x10,%esp
c0007bd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007bd5:	83 ec 0c             	sub    $0xc,%esp
c0007bd8:	50                   	push   %eax
c0007bd9:	e8 f4 fe ff ff       	call   c0007ad2 <disp_int>
c0007bde:	83 c4 10             	add    $0x10,%esp
c0007be1:	83 ec 0c             	sub    $0xc,%esp
c0007be4:	68 49 ae 00 c0       	push   $0xc000ae49
c0007be9:	e8 9e 99 ff ff       	call   c000158c <disp_str>
c0007bee:	83 c4 10             	add    $0x10,%esp
c0007bf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007bf4:	8b 00                	mov    (%eax),%eax
c0007bf6:	83 ec 0c             	sub    $0xc,%esp
c0007bf9:	50                   	push   %eax
c0007bfa:	e8 d3 fe ff ff       	call   c0007ad2 <disp_int>
c0007bff:	83 c4 10             	add    $0x10,%esp
c0007c02:	83 ec 0c             	sub    $0xc,%esp
c0007c05:	68 34 ae 00 c0       	push   $0xc000ae34
c0007c0a:	e8 7d 99 ff ff       	call   c000158c <disp_str>
c0007c0f:	83 c4 10             	add    $0x10,%esp
c0007c12:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007c19:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007c1c:	8b 00                	mov    (%eax),%eax
c0007c1e:	83 e0 01             	and    $0x1,%eax
c0007c21:	85 c0                	test   %eax,%eax
c0007c23:	74 09                	je     c0007c2e <do_page_fault+0x133>
c0007c25:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007c2c:	eb 07                	jmp    c0007c35 <do_page_fault+0x13a>
c0007c2e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007c35:	90                   	nop
c0007c36:	c9                   	leave  
c0007c37:	c3                   	ret    

c0007c38 <exception_handler>:
c0007c38:	55                   	push   %ebp
c0007c39:	89 e5                	mov    %esp,%ebp
c0007c3b:	57                   	push   %edi
c0007c3c:	56                   	push   %esi
c0007c3d:	53                   	push   %ebx
c0007c3e:	83 ec 6c             	sub    $0x6c,%esp
c0007c41:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007c44:	bb c0 b0 00 c0       	mov    $0xc000b0c0,%ebx
c0007c49:	ba 13 00 00 00       	mov    $0x13,%edx
c0007c4e:	89 c7                	mov    %eax,%edi
c0007c50:	89 de                	mov    %ebx,%esi
c0007c52:	89 d1                	mov    %edx,%ecx
c0007c54:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007c56:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007c5d:	eb 04                	jmp    c0007c63 <exception_handler+0x2b>
c0007c5f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007c63:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007c6a:	7e f3                	jle    c0007c5f <exception_handler+0x27>
c0007c6c:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c0007c73:	00 00 00 
c0007c76:	83 ec 0c             	sub    $0xc,%esp
c0007c79:	68 52 ae 00 c0       	push   $0xc000ae52
c0007c7e:	e8 09 99 ff ff       	call   c000158c <disp_str>
c0007c83:	83 c4 10             	add    $0x10,%esp
c0007c86:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007c8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c90:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0007c94:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007c97:	83 ec 0c             	sub    $0xc,%esp
c0007c9a:	ff 75 dc             	pushl  -0x24(%ebp)
c0007c9d:	e8 ea 98 ff ff       	call   c000158c <disp_str>
c0007ca2:	83 c4 10             	add    $0x10,%esp
c0007ca5:	83 ec 0c             	sub    $0xc,%esp
c0007ca8:	68 60 ae 00 c0       	push   $0xc000ae60
c0007cad:	e8 da 98 ff ff       	call   c000158c <disp_str>
c0007cb2:	83 c4 10             	add    $0x10,%esp
c0007cb5:	83 ec 0c             	sub    $0xc,%esp
c0007cb8:	68 63 ae 00 c0       	push   $0xc000ae63
c0007cbd:	e8 ca 98 ff ff       	call   c000158c <disp_str>
c0007cc2:	83 c4 10             	add    $0x10,%esp
c0007cc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0007cc8:	83 ec 0c             	sub    $0xc,%esp
c0007ccb:	50                   	push   %eax
c0007ccc:	e8 01 fe ff ff       	call   c0007ad2 <disp_int>
c0007cd1:	83 c4 10             	add    $0x10,%esp
c0007cd4:	83 ec 0c             	sub    $0xc,%esp
c0007cd7:	68 60 ae 00 c0       	push   $0xc000ae60
c0007cdc:	e8 ab 98 ff ff       	call   c000158c <disp_str>
c0007ce1:	83 c4 10             	add    $0x10,%esp
c0007ce4:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007ce8:	74 2f                	je     c0007d19 <exception_handler+0xe1>
c0007cea:	83 ec 0c             	sub    $0xc,%esp
c0007ced:	68 6b ae 00 c0       	push   $0xc000ae6b
c0007cf2:	e8 95 98 ff ff       	call   c000158c <disp_str>
c0007cf7:	83 c4 10             	add    $0x10,%esp
c0007cfa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007cfd:	83 ec 0c             	sub    $0xc,%esp
c0007d00:	50                   	push   %eax
c0007d01:	e8 cc fd ff ff       	call   c0007ad2 <disp_int>
c0007d06:	83 c4 10             	add    $0x10,%esp
c0007d09:	83 ec 0c             	sub    $0xc,%esp
c0007d0c:	68 60 ae 00 c0       	push   $0xc000ae60
c0007d11:	e8 76 98 ff ff       	call   c000158c <disp_str>
c0007d16:	83 c4 10             	add    $0x10,%esp
c0007d19:	83 ec 0c             	sub    $0xc,%esp
c0007d1c:	68 75 ae 00 c0       	push   $0xc000ae75
c0007d21:	e8 66 98 ff ff       	call   c000158c <disp_str>
c0007d26:	83 c4 10             	add    $0x10,%esp
c0007d29:	83 ec 0c             	sub    $0xc,%esp
c0007d2c:	ff 75 14             	pushl  0x14(%ebp)
c0007d2f:	e8 9e fd ff ff       	call   c0007ad2 <disp_int>
c0007d34:	83 c4 10             	add    $0x10,%esp
c0007d37:	83 ec 0c             	sub    $0xc,%esp
c0007d3a:	68 60 ae 00 c0       	push   $0xc000ae60
c0007d3f:	e8 48 98 ff ff       	call   c000158c <disp_str>
c0007d44:	83 c4 10             	add    $0x10,%esp
c0007d47:	83 ec 0c             	sub    $0xc,%esp
c0007d4a:	68 79 ae 00 c0       	push   $0xc000ae79
c0007d4f:	e8 38 98 ff ff       	call   c000158c <disp_str>
c0007d54:	83 c4 10             	add    $0x10,%esp
c0007d57:	8b 45 10             	mov    0x10(%ebp),%eax
c0007d5a:	83 ec 0c             	sub    $0xc,%esp
c0007d5d:	50                   	push   %eax
c0007d5e:	e8 6f fd ff ff       	call   c0007ad2 <disp_int>
c0007d63:	83 c4 10             	add    $0x10,%esp
c0007d66:	83 ec 0c             	sub    $0xc,%esp
c0007d69:	68 60 ae 00 c0       	push   $0xc000ae60
c0007d6e:	e8 19 98 ff ff       	call   c000158c <disp_str>
c0007d73:	83 c4 10             	add    $0x10,%esp
c0007d76:	83 ec 0c             	sub    $0xc,%esp
c0007d79:	68 7e ae 00 c0       	push   $0xc000ae7e
c0007d7e:	e8 09 98 ff ff       	call   c000158c <disp_str>
c0007d83:	83 c4 10             	add    $0x10,%esp
c0007d86:	83 ec 0c             	sub    $0xc,%esp
c0007d89:	ff 75 18             	pushl  0x18(%ebp)
c0007d8c:	e8 41 fd ff ff       	call   c0007ad2 <disp_int>
c0007d91:	83 c4 10             	add    $0x10,%esp
c0007d94:	83 ec 0c             	sub    $0xc,%esp
c0007d97:	68 60 ae 00 c0       	push   $0xc000ae60
c0007d9c:	e8 eb 97 ff ff       	call   c000158c <disp_str>
c0007da1:	83 c4 10             	add    $0x10,%esp
c0007da4:	83 ec 0c             	sub    $0xc,%esp
c0007da7:	68 88 ae 00 c0       	push   $0xc000ae88
c0007dac:	e8 db 97 ff ff       	call   c000158c <disp_str>
c0007db1:	83 c4 10             	add    $0x10,%esp
c0007db4:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0007db8:	75 46                	jne    c0007e00 <exception_handler+0x1c8>
c0007dba:	0f 20 d0             	mov    %cr2,%eax
c0007dbd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007dc0:	83 ec 0c             	sub    $0xc,%esp
c0007dc3:	68 a7 ae 00 c0       	push   $0xc000aea7
c0007dc8:	e8 bf 97 ff ff       	call   c000158c <disp_str>
c0007dcd:	83 c4 10             	add    $0x10,%esp
c0007dd0:	83 ec 0c             	sub    $0xc,%esp
c0007dd3:	68 2f ae 00 c0       	push   $0xc000ae2f
c0007dd8:	e8 af 97 ff ff       	call   c000158c <disp_str>
c0007ddd:	83 c4 10             	add    $0x10,%esp
c0007de0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007de3:	83 ec 0c             	sub    $0xc,%esp
c0007de6:	50                   	push   %eax
c0007de7:	e8 e6 fc ff ff       	call   c0007ad2 <disp_int>
c0007dec:	83 c4 10             	add    $0x10,%esp
c0007def:	83 ec 0c             	sub    $0xc,%esp
c0007df2:	68 34 ae 00 c0       	push   $0xc000ae34
c0007df7:	e8 90 97 ff ff       	call   c000158c <disp_str>
c0007dfc:	83 c4 10             	add    $0x10,%esp
c0007dff:	90                   	nop
c0007e00:	90                   	nop
c0007e01:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007e04:	5b                   	pop    %ebx
c0007e05:	5e                   	pop    %esi
c0007e06:	5f                   	pop    %edi
c0007e07:	5d                   	pop    %ebp
c0007e08:	c3                   	ret    

c0007e09 <exception_handler2>:
c0007e09:	55                   	push   %ebp
c0007e0a:	89 e5                	mov    %esp,%ebp
c0007e0c:	57                   	push   %edi
c0007e0d:	56                   	push   %esi
c0007e0e:	53                   	push   %ebx
c0007e0f:	83 ec 6c             	sub    $0x6c,%esp
c0007e12:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007e15:	bb c0 b0 00 c0       	mov    $0xc000b0c0,%ebx
c0007e1a:	ba 13 00 00 00       	mov    $0x13,%edx
c0007e1f:	89 c7                	mov    %eax,%edi
c0007e21:	89 de                	mov    %ebx,%esi
c0007e23:	89 d1                	mov    %edx,%ecx
c0007e25:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007e27:	c7 05 80 f7 00 c0 6a 	movl   $0x2e6a,0xc000f780
c0007e2e:	2e 00 00 
c0007e31:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007e38:	eb 14                	jmp    c0007e4e <exception_handler2+0x45>
c0007e3a:	83 ec 0c             	sub    $0xc,%esp
c0007e3d:	68 0c b1 00 c0       	push   $0xc000b10c
c0007e42:	e8 45 97 ff ff       	call   c000158c <disp_str>
c0007e47:	83 c4 10             	add    $0x10,%esp
c0007e4a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007e4e:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007e55:	7e e3                	jle    c0007e3a <exception_handler2+0x31>
c0007e57:	c7 05 80 f7 00 c0 6a 	movl   $0x2e6a,0xc000f780
c0007e5e:	2e 00 00 
c0007e61:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007e68:	8b 45 08             	mov    0x8(%ebp),%eax
c0007e6b:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007e6f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007e72:	83 ec 08             	sub    $0x8,%esp
c0007e75:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e78:	ff 75 dc             	pushl  -0x24(%ebp)
c0007e7b:	e8 47 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e80:	83 c4 10             	add    $0x10,%esp
c0007e83:	83 ec 0c             	sub    $0xc,%esp
c0007e86:	68 60 ae 00 c0       	push   $0xc000ae60
c0007e8b:	e8 fc 96 ff ff       	call   c000158c <disp_str>
c0007e90:	83 c4 10             	add    $0x10,%esp
c0007e93:	83 ec 08             	sub    $0x8,%esp
c0007e96:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e99:	68 63 ae 00 c0       	push   $0xc000ae63
c0007e9e:	e8 24 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007ea3:	83 c4 10             	add    $0x10,%esp
c0007ea6:	83 ec 0c             	sub    $0xc,%esp
c0007ea9:	ff 75 08             	pushl  0x8(%ebp)
c0007eac:	e8 21 fc ff ff       	call   c0007ad2 <disp_int>
c0007eb1:	83 c4 10             	add    $0x10,%esp
c0007eb4:	83 ec 0c             	sub    $0xc,%esp
c0007eb7:	68 60 ae 00 c0       	push   $0xc000ae60
c0007ebc:	e8 cb 96 ff ff       	call   c000158c <disp_str>
c0007ec1:	83 c4 10             	add    $0x10,%esp
c0007ec4:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007ec8:	74 44                	je     c0007f0e <exception_handler2+0x105>
c0007eca:	83 ec 08             	sub    $0x8,%esp
c0007ecd:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ed0:	68 6b ae 00 c0       	push   $0xc000ae6b
c0007ed5:	e8 ed 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007eda:	83 c4 10             	add    $0x10,%esp
c0007edd:	83 ec 08             	sub    $0x8,%esp
c0007ee0:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ee3:	68 6b ae 00 c0       	push   $0xc000ae6b
c0007ee8:	e8 da 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007eed:	83 c4 10             	add    $0x10,%esp
c0007ef0:	83 ec 0c             	sub    $0xc,%esp
c0007ef3:	ff 75 0c             	pushl  0xc(%ebp)
c0007ef6:	e8 d7 fb ff ff       	call   c0007ad2 <disp_int>
c0007efb:	83 c4 10             	add    $0x10,%esp
c0007efe:	83 ec 0c             	sub    $0xc,%esp
c0007f01:	68 60 ae 00 c0       	push   $0xc000ae60
c0007f06:	e8 81 96 ff ff       	call   c000158c <disp_str>
c0007f0b:	83 c4 10             	add    $0x10,%esp
c0007f0e:	83 ec 08             	sub    $0x8,%esp
c0007f11:	ff 75 e0             	pushl  -0x20(%ebp)
c0007f14:	68 75 ae 00 c0       	push   $0xc000ae75
c0007f19:	e8 a9 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f1e:	83 c4 10             	add    $0x10,%esp
c0007f21:	83 ec 0c             	sub    $0xc,%esp
c0007f24:	ff 75 14             	pushl  0x14(%ebp)
c0007f27:	e8 a6 fb ff ff       	call   c0007ad2 <disp_int>
c0007f2c:	83 c4 10             	add    $0x10,%esp
c0007f2f:	83 ec 0c             	sub    $0xc,%esp
c0007f32:	68 60 ae 00 c0       	push   $0xc000ae60
c0007f37:	e8 50 96 ff ff       	call   c000158c <disp_str>
c0007f3c:	83 c4 10             	add    $0x10,%esp
c0007f3f:	83 ec 08             	sub    $0x8,%esp
c0007f42:	ff 75 e0             	pushl  -0x20(%ebp)
c0007f45:	68 79 ae 00 c0       	push   $0xc000ae79
c0007f4a:	e8 78 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f4f:	83 c4 10             	add    $0x10,%esp
c0007f52:	83 ec 0c             	sub    $0xc,%esp
c0007f55:	ff 75 10             	pushl  0x10(%ebp)
c0007f58:	e8 75 fb ff ff       	call   c0007ad2 <disp_int>
c0007f5d:	83 c4 10             	add    $0x10,%esp
c0007f60:	83 ec 0c             	sub    $0xc,%esp
c0007f63:	68 60 ae 00 c0       	push   $0xc000ae60
c0007f68:	e8 1f 96 ff ff       	call   c000158c <disp_str>
c0007f6d:	83 c4 10             	add    $0x10,%esp
c0007f70:	83 ec 08             	sub    $0x8,%esp
c0007f73:	ff 75 e0             	pushl  -0x20(%ebp)
c0007f76:	68 7e ae 00 c0       	push   $0xc000ae7e
c0007f7b:	e8 47 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f80:	83 c4 10             	add    $0x10,%esp
c0007f83:	83 ec 0c             	sub    $0xc,%esp
c0007f86:	ff 75 18             	pushl  0x18(%ebp)
c0007f89:	e8 44 fb ff ff       	call   c0007ad2 <disp_int>
c0007f8e:	83 c4 10             	add    $0x10,%esp
c0007f91:	83 ec 0c             	sub    $0xc,%esp
c0007f94:	68 60 ae 00 c0       	push   $0xc000ae60
c0007f99:	e8 ee 95 ff ff       	call   c000158c <disp_str>
c0007f9e:	83 c4 10             	add    $0x10,%esp
c0007fa1:	90                   	nop
c0007fa2:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007fa5:	5b                   	pop    %ebx
c0007fa6:	5e                   	pop    %esi
c0007fa7:	5f                   	pop    %edi
c0007fa8:	5d                   	pop    %ebp
c0007fa9:	c3                   	ret    

c0007faa <init_internal_interrupt>:
c0007faa:	55                   	push   %ebp
c0007fab:	89 e5                	mov    %esp,%ebp
c0007fad:	83 ec 08             	sub    $0x8,%esp
c0007fb0:	6a 0e                	push   $0xe
c0007fb2:	6a 08                	push   $0x8
c0007fb4:	68 03 16 00 c0       	push   $0xc0001603
c0007fb9:	6a 00                	push   $0x0
c0007fbb:	e8 7d cd ff ff       	call   c0004d3d <InitInterruptDesc>
c0007fc0:	83 c4 10             	add    $0x10,%esp
c0007fc3:	6a 0e                	push   $0xe
c0007fc5:	6a 08                	push   $0x8
c0007fc7:	68 09 16 00 c0       	push   $0xc0001609
c0007fcc:	6a 01                	push   $0x1
c0007fce:	e8 6a cd ff ff       	call   c0004d3d <InitInterruptDesc>
c0007fd3:	83 c4 10             	add    $0x10,%esp
c0007fd6:	6a 0e                	push   $0xe
c0007fd8:	6a 08                	push   $0x8
c0007fda:	68 0f 16 00 c0       	push   $0xc000160f
c0007fdf:	6a 02                	push   $0x2
c0007fe1:	e8 57 cd ff ff       	call   c0004d3d <InitInterruptDesc>
c0007fe6:	83 c4 10             	add    $0x10,%esp
c0007fe9:	6a 0e                	push   $0xe
c0007feb:	6a 08                	push   $0x8
c0007fed:	68 15 16 00 c0       	push   $0xc0001615
c0007ff2:	6a 03                	push   $0x3
c0007ff4:	e8 44 cd ff ff       	call   c0004d3d <InitInterruptDesc>
c0007ff9:	83 c4 10             	add    $0x10,%esp
c0007ffc:	6a 0e                	push   $0xe
c0007ffe:	6a 08                	push   $0x8
c0008000:	68 1b 16 00 c0       	push   $0xc000161b
c0008005:	6a 04                	push   $0x4
c0008007:	e8 31 cd ff ff       	call   c0004d3d <InitInterruptDesc>
c000800c:	83 c4 10             	add    $0x10,%esp
c000800f:	6a 0e                	push   $0xe
c0008011:	6a 08                	push   $0x8
c0008013:	68 21 16 00 c0       	push   $0xc0001621
c0008018:	6a 05                	push   $0x5
c000801a:	e8 1e cd ff ff       	call   c0004d3d <InitInterruptDesc>
c000801f:	83 c4 10             	add    $0x10,%esp
c0008022:	6a 0e                	push   $0xe
c0008024:	6a 08                	push   $0x8
c0008026:	68 27 16 00 c0       	push   $0xc0001627
c000802b:	6a 06                	push   $0x6
c000802d:	e8 0b cd ff ff       	call   c0004d3d <InitInterruptDesc>
c0008032:	83 c4 10             	add    $0x10,%esp
c0008035:	6a 0e                	push   $0xe
c0008037:	6a 08                	push   $0x8
c0008039:	68 2d 16 00 c0       	push   $0xc000162d
c000803e:	6a 07                	push   $0x7
c0008040:	e8 f8 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c0008045:	83 c4 10             	add    $0x10,%esp
c0008048:	6a 0e                	push   $0xe
c000804a:	6a 08                	push   $0x8
c000804c:	68 33 16 00 c0       	push   $0xc0001633
c0008051:	6a 08                	push   $0x8
c0008053:	e8 e5 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c0008058:	83 c4 10             	add    $0x10,%esp
c000805b:	6a 0e                	push   $0xe
c000805d:	6a 08                	push   $0x8
c000805f:	68 37 16 00 c0       	push   $0xc0001637
c0008064:	6a 09                	push   $0x9
c0008066:	e8 d2 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c000806b:	83 c4 10             	add    $0x10,%esp
c000806e:	6a 0e                	push   $0xe
c0008070:	6a 08                	push   $0x8
c0008072:	68 3d 16 00 c0       	push   $0xc000163d
c0008077:	6a 0a                	push   $0xa
c0008079:	e8 bf cc ff ff       	call   c0004d3d <InitInterruptDesc>
c000807e:	83 c4 10             	add    $0x10,%esp
c0008081:	6a 0e                	push   $0xe
c0008083:	6a 08                	push   $0x8
c0008085:	68 41 16 00 c0       	push   $0xc0001641
c000808a:	6a 0b                	push   $0xb
c000808c:	e8 ac cc ff ff       	call   c0004d3d <InitInterruptDesc>
c0008091:	83 c4 10             	add    $0x10,%esp
c0008094:	6a 0e                	push   $0xe
c0008096:	6a 08                	push   $0x8
c0008098:	68 45 16 00 c0       	push   $0xc0001645
c000809d:	6a 0c                	push   $0xc
c000809f:	e8 99 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c00080a4:	83 c4 10             	add    $0x10,%esp
c00080a7:	6a 0e                	push   $0xe
c00080a9:	6a 08                	push   $0x8
c00080ab:	68 49 16 00 c0       	push   $0xc0001649
c00080b0:	6a 0d                	push   $0xd
c00080b2:	e8 86 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c00080b7:	83 c4 10             	add    $0x10,%esp
c00080ba:	6a 0e                	push   $0xe
c00080bc:	6a 08                	push   $0x8
c00080be:	68 4d 16 00 c0       	push   $0xc000164d
c00080c3:	6a 0e                	push   $0xe
c00080c5:	e8 73 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c00080ca:	83 c4 10             	add    $0x10,%esp
c00080cd:	6a 0e                	push   $0xe
c00080cf:	6a 08                	push   $0x8
c00080d1:	68 51 16 00 c0       	push   $0xc0001651
c00080d6:	6a 10                	push   $0x10
c00080d8:	e8 60 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c00080dd:	83 c4 10             	add    $0x10,%esp
c00080e0:	6a 0e                	push   $0xe
c00080e2:	6a 08                	push   $0x8
c00080e4:	68 57 16 00 c0       	push   $0xc0001657
c00080e9:	6a 11                	push   $0x11
c00080eb:	e8 4d cc ff ff       	call   c0004d3d <InitInterruptDesc>
c00080f0:	83 c4 10             	add    $0x10,%esp
c00080f3:	6a 0e                	push   $0xe
c00080f5:	6a 08                	push   $0x8
c00080f7:	68 5b 16 00 c0       	push   $0xc000165b
c00080fc:	6a 12                	push   $0x12
c00080fe:	e8 3a cc ff ff       	call   c0004d3d <InitInterruptDesc>
c0008103:	83 c4 10             	add    $0x10,%esp
c0008106:	6a 0e                	push   $0xe
c0008108:	6a 0e                	push   $0xe
c000810a:	68 17 17 00 c0       	push   $0xc0001717
c000810f:	68 90 00 00 00       	push   $0x90
c0008114:	e8 24 cc ff ff       	call   c0004d3d <InitInterruptDesc>
c0008119:	83 c4 10             	add    $0x10,%esp
c000811c:	90                   	nop
c000811d:	c9                   	leave  
c000811e:	c3                   	ret    

c000811f <test>:
c000811f:	55                   	push   %ebp
c0008120:	89 e5                	mov    %esp,%ebp
c0008122:	83 ec 08             	sub    $0x8,%esp
c0008125:	83 ec 0c             	sub    $0xc,%esp
c0008128:	68 0e b1 00 c0       	push   $0xc000b10e
c000812d:	e8 5a 94 ff ff       	call   c000158c <disp_str>
c0008132:	83 c4 10             	add    $0x10,%esp
c0008135:	83 ec 0c             	sub    $0xc,%esp
c0008138:	6a 06                	push   $0x6
c000813a:	e8 93 f9 ff ff       	call   c0007ad2 <disp_int>
c000813f:	83 c4 10             	add    $0x10,%esp
c0008142:	83 ec 0c             	sub    $0xc,%esp
c0008145:	68 34 ae 00 c0       	push   $0xc000ae34
c000814a:	e8 3d 94 ff ff       	call   c000158c <disp_str>
c000814f:	83 c4 10             	add    $0x10,%esp
c0008152:	90                   	nop
c0008153:	c9                   	leave  
c0008154:	c3                   	ret    

c0008155 <disp_str_colour3>:
c0008155:	55                   	push   %ebp
c0008156:	89 e5                	mov    %esp,%ebp
c0008158:	90                   	nop
c0008159:	5d                   	pop    %ebp
c000815a:	c3                   	ret    

c000815b <spurious_irq>:
c000815b:	55                   	push   %ebp
c000815c:	89 e5                	mov    %esp,%ebp
c000815e:	83 ec 08             	sub    $0x8,%esp
c0008161:	83 ec 08             	sub    $0x8,%esp
c0008164:	6a 0b                	push   $0xb
c0008166:	68 10 b1 00 c0       	push   $0xc000b110
c000816b:	e8 57 94 ff ff       	call   c00015c7 <disp_str_colour>
c0008170:	83 c4 10             	add    $0x10,%esp
c0008173:	83 ec 0c             	sub    $0xc,%esp
c0008176:	ff 75 08             	pushl  0x8(%ebp)
c0008179:	e8 54 f9 ff ff       	call   c0007ad2 <disp_int>
c000817e:	83 c4 10             	add    $0x10,%esp
c0008181:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0008186:	8b 15 04 1f 01 c0    	mov    0xc0011f04,%edx
c000818c:	83 c0 01             	add    $0x1,%eax
c000818f:	83 d2 00             	adc    $0x0,%edx
c0008192:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0008197:	89 15 04 1f 01 c0    	mov    %edx,0xc0011f04
c000819d:	83 ec 0c             	sub    $0xc,%esp
c00081a0:	68 37 b1 00 c0       	push   $0xc000b137
c00081a5:	e8 e2 93 ff ff       	call   c000158c <disp_str>
c00081aa:	83 c4 10             	add    $0x10,%esp
c00081ad:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00081b2:	8b 15 04 1f 01 c0    	mov    0xc0011f04,%edx
c00081b8:	83 ec 0c             	sub    $0xc,%esp
c00081bb:	50                   	push   %eax
c00081bc:	e8 11 f9 ff ff       	call   c0007ad2 <disp_int>
c00081c1:	83 c4 10             	add    $0x10,%esp
c00081c4:	83 ec 0c             	sub    $0xc,%esp
c00081c7:	68 39 b1 00 c0       	push   $0xc000b139
c00081cc:	e8 bb 93 ff ff       	call   c000158c <disp_str>
c00081d1:	83 c4 10             	add    $0x10,%esp
c00081d4:	83 ec 08             	sub    $0x8,%esp
c00081d7:	6a 0c                	push   $0xc
c00081d9:	68 3c b1 00 c0       	push   $0xc000b13c
c00081de:	e8 e4 93 ff ff       	call   c00015c7 <disp_str_colour>
c00081e3:	83 c4 10             	add    $0x10,%esp
c00081e6:	90                   	nop
c00081e7:	c9                   	leave  
c00081e8:	c3                   	ret    

c00081e9 <init_keyboard>:
c00081e9:	55                   	push   %ebp
c00081ea:	89 e5                	mov    %esp,%ebp
c00081ec:	83 ec 18             	sub    $0x18,%esp
c00081ef:	83 ec 04             	sub    $0x4,%esp
c00081f2:	68 00 02 00 00       	push   $0x200
c00081f7:	6a 00                	push   $0x0
c00081f9:	68 cc fb 00 c0       	push   $0xc000fbcc
c00081fe:	e8 5b 33 00 00       	call   c000b55e <Memset>
c0008203:	83 c4 10             	add    $0x10,%esp
c0008206:	c7 05 c0 fb 00 c0 cc 	movl   $0xc000fbcc,0xc000fbc0
c000820d:	fb 00 c0 
c0008210:	a1 c0 fb 00 c0       	mov    0xc000fbc0,%eax
c0008215:	a3 c4 fb 00 c0       	mov    %eax,0xc000fbc4
c000821a:	c7 05 c8 fb 00 c0 00 	movl   $0x0,0xc000fbc8
c0008221:	00 00 00 
c0008224:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c000822b:	00 00 00 
c000822e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008235:	eb 04                	jmp    c000823b <init_keyboard+0x52>
c0008237:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000823b:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0008242:	7e f3                	jle    c0008237 <init_keyboard+0x4e>
c0008244:	c7 05 80 f7 00 c0 00 	movl   $0x0,0xc000f780
c000824b:	00 00 00 
c000824e:	e8 e9 d8 ff ff       	call   c0005b3c <init_keyboard_handler>
c0008253:	90                   	nop
c0008254:	c9                   	leave  
c0008255:	c3                   	ret    

c0008256 <init2>:
c0008256:	55                   	push   %ebp
c0008257:	89 e5                	mov    %esp,%ebp
c0008259:	83 ec 08             	sub    $0x8,%esp
c000825c:	83 ec 0c             	sub    $0xc,%esp
c000825f:	68 61 b1 00 c0       	push   $0xc000b161
c0008264:	e8 23 93 ff ff       	call   c000158c <disp_str>
c0008269:	83 c4 10             	add    $0x10,%esp
c000826c:	e8 78 ff ff ff       	call   c00081e9 <init_keyboard>
c0008271:	83 ec 0c             	sub    $0xc,%esp
c0008274:	68 00 00 00 02       	push   $0x2000000
c0008279:	e8 72 f4 ff ff       	call   c00076f0 <init_memory>
c000827e:	83 c4 10             	add    $0x10,%esp
c0008281:	90                   	nop
c0008282:	c9                   	leave  
c0008283:	c3                   	ret    

c0008284 <u_thread_a>:
c0008284:	55                   	push   %ebp
c0008285:	89 e5                	mov    %esp,%ebp
c0008287:	83 ec 08             	sub    $0x8,%esp
c000828a:	83 ec 0c             	sub    $0xc,%esp
c000828d:	68 67 b1 00 c0       	push   $0xc000b167
c0008292:	e8 f5 92 ff ff       	call   c000158c <disp_str>
c0008297:	83 c4 10             	add    $0x10,%esp
c000829a:	eb fe                	jmp    c000829a <u_thread_a+0x16>

c000829c <kernel_main2>:
c000829c:	55                   	push   %ebp
c000829d:	89 e5                	mov    %esp,%ebp
c000829f:	57                   	push   %edi
c00082a0:	56                   	push   %esi
c00082a1:	53                   	push   %ebx
c00082a2:	83 ec 3c             	sub    $0x3c,%esp
c00082a5:	83 ec 0c             	sub    $0xc,%esp
c00082a8:	68 75 b1 00 c0       	push   $0xc000b175
c00082ad:	e8 da 92 ff ff       	call   c000158c <disp_str>
c00082b2:	83 c4 10             	add    $0x10,%esp
c00082b5:	e8 94 96 ff ff       	call   c000194e <init>
c00082ba:	c7 05 00 1f 01 c0 00 	movl   $0x0,0xc0011f00
c00082c1:	00 00 00 
c00082c4:	c7 05 04 1f 01 c0 00 	movl   $0x0,0xc0011f04
c00082cb:	00 00 00 
c00082ce:	c7 05 dc 16 01 c0 00 	movl   $0x0,0xc00116dc
c00082d5:	00 00 00 
c00082d8:	c7 05 84 f7 00 c0 00 	movl   $0x0,0xc000f784
c00082df:	00 00 00 
c00082e2:	c7 45 dc 40 32 08 c0 	movl   $0xc0083240,-0x24(%ebp)
c00082e9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00082f0:	e9 01 02 00 00       	jmp    c00084f6 <kernel_main2+0x25a>
c00082f5:	83 ec 08             	sub    $0x8,%esp
c00082f8:	6a 00                	push   $0x0
c00082fa:	6a 01                	push   $0x1
c00082fc:	e8 57 eb ff ff       	call   c0006e58 <alloc_memory>
c0008301:	83 c4 10             	add    $0x10,%esp
c0008304:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008307:	83 ec 04             	sub    $0x4,%esp
c000830a:	68 b0 02 00 00       	push   $0x2b0
c000830f:	6a 00                	push   $0x0
c0008311:	ff 75 d8             	pushl  -0x28(%ebp)
c0008314:	e8 45 32 00 00       	call   c000b55e <Memset>
c0008319:	83 c4 10             	add    $0x10,%esp
c000831c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000831f:	05 00 10 00 00       	add    $0x1000,%eax
c0008324:	89 c2                	mov    %eax,%edx
c0008326:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008329:	89 10                	mov    %edx,(%eax)
c000832b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000832e:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c0008335:	00 00 
c0008337:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000833a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000833d:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c0008343:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008346:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000834d:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0008351:	7e 0f                	jle    c0008362 <kernel_main2+0xc6>
c0008353:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008356:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c000835d:	e9 90 01 00 00       	jmp    c00084f2 <kernel_main2+0x256>
c0008362:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008365:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000836c:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0008370:	7f 73                	jg     c00083e5 <kernel_main2+0x149>
c0008372:	c7 45 e4 20 e0 00 c0 	movl   $0xc000e020,-0x1c(%ebp)
c0008379:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0008380:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c0008387:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000838a:	8b 00                	mov    (%eax),%eax
c000838c:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c000838f:	89 c2                	mov    %eax,%edx
c0008391:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008394:	89 10                	mov    %edx,(%eax)
c0008396:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008399:	8b 00                	mov    (%eax),%eax
c000839b:	2b 45 d0             	sub    -0x30(%ebp),%eax
c000839e:	89 c2                	mov    %eax,%edx
c00083a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083a3:	89 10                	mov    %edx,(%eax)
c00083a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083a8:	8b 00                	mov    (%eax),%eax
c00083aa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00083ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00083b0:	8b 50 14             	mov    0x14(%eax),%edx
c00083b3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083b6:	89 50 24             	mov    %edx,0x24(%eax)
c00083b9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083bc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00083c2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083c5:	8b 10                	mov    (%eax),%edx
c00083c7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083ca:	89 50 04             	mov    %edx,0x4(%eax)
c00083cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083d0:	8b 50 04             	mov    0x4(%eax),%edx
c00083d3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083d6:	89 50 08             	mov    %edx,0x8(%eax)
c00083d9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083dc:	8b 50 08             	mov    0x8(%eax),%edx
c00083df:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00083e2:	89 50 0c             	mov    %edx,0xc(%eax)
c00083e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00083e8:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00083eb:	81 c2 34 01 00 00    	add    $0x134,%edx
c00083f1:	83 ec 08             	sub    $0x8,%esp
c00083f4:	50                   	push   %eax
c00083f5:	52                   	push   %edx
c00083f6:	e8 82 31 00 00       	call   c000b57d <Strcpy>
c00083fb:	83 c4 10             	add    $0x10,%esp
c00083fe:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008402:	83 c8 04             	or     $0x4,%eax
c0008405:	0f b6 c0             	movzbl %al,%eax
c0008408:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c000840c:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008410:	83 c8 0c             	or     $0xc,%eax
c0008413:	0f b6 c0             	movzbl %al,%eax
c0008416:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c000841a:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c000841e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008421:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c0008427:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000842b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000842e:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c0008434:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008438:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000843b:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c0008441:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008445:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008448:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c000844e:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008452:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008455:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c000845b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000845e:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c0008465:	00 00 00 
c0008468:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000846b:	8b 50 14             	mov    0x14(%eax),%edx
c000846e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008471:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008477:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000847a:	8b 55 c0             	mov    -0x40(%ebp),%edx
c000847d:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c0008483:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008486:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000848d:	00 00 00 
c0008490:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008493:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000849a:	00 00 00 
c000849d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00084a0:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00084a7:	00 00 00 
c00084aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00084ad:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c00084b4:	00 00 00 
c00084b7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00084ba:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00084c1:	00 00 00 
c00084c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00084c7:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00084ce:	00 00 00 
c00084d1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00084d4:	69 c0 b0 02 00 00    	imul   $0x2b0,%eax,%eax
c00084da:	8d 90 40 33 08 c0    	lea    -0x3ff7ccc0(%eax),%edx
c00084e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00084e3:	89 c3                	mov    %eax,%ebx
c00084e5:	b8 ac 00 00 00       	mov    $0xac,%eax
c00084ea:	89 d7                	mov    %edx,%edi
c00084ec:	89 de                	mov    %ebx,%esi
c00084ee:	89 c1                	mov    %eax,%ecx
c00084f0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00084f2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00084f6:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00084fa:	0f 8e f5 fd ff ff    	jle    c00082f5 <kernel_main2+0x59>
c0008500:	c7 05 a0 fb 00 c0 40 	movl   $0xc0083340,0xc000fba0
c0008507:	33 08 c0 
c000850a:	eb fe                	jmp    c000850a <kernel_main2+0x26e>

c000850c <TestTTY>:
c000850c:	55                   	push   %ebp
c000850d:	89 e5                	mov    %esp,%ebp
c000850f:	83 ec 28             	sub    $0x28,%esp
c0008512:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008519:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008520:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008526:	83 ec 08             	sub    $0x8,%esp
c0008529:	6a 02                	push   $0x2
c000852b:	8d 45 de             	lea    -0x22(%ebp),%eax
c000852e:	50                   	push   %eax
c000852f:	e8 ae d7 ff ff       	call   c0005ce2 <open>
c0008534:	83 c4 10             	add    $0x10,%esp
c0008537:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000853a:	83 ec 08             	sub    $0x8,%esp
c000853d:	6a 02                	push   $0x2
c000853f:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008542:	50                   	push   %eax
c0008543:	e8 9a d7 ff ff       	call   c0005ce2 <open>
c0008548:	83 c4 10             	add    $0x10,%esp
c000854b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000854e:	83 ec 0c             	sub    $0xc,%esp
c0008551:	68 81 b1 00 c0       	push   $0xc000b181
c0008556:	e8 19 0a 00 00       	call   c0008f74 <Printf>
c000855b:	83 c4 10             	add    $0x10,%esp
c000855e:	83 ec 0c             	sub    $0xc,%esp
c0008561:	6a 0a                	push   $0xa
c0008563:	e8 92 e9 ff ff       	call   c0006efa <sys_malloc>
c0008568:	83 c4 10             	add    $0x10,%esp
c000856b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000856e:	83 ec 04             	sub    $0x4,%esp
c0008571:	6a 0a                	push   $0xa
c0008573:	6a 00                	push   $0x0
c0008575:	ff 75 ec             	pushl  -0x14(%ebp)
c0008578:	e8 e1 2f 00 00       	call   c000b55e <Memset>
c000857d:	83 c4 10             	add    $0x10,%esp
c0008580:	83 ec 04             	sub    $0x4,%esp
c0008583:	6a 0a                	push   $0xa
c0008585:	ff 75 ec             	pushl  -0x14(%ebp)
c0008588:	ff 75 f0             	pushl  -0x10(%ebp)
c000858b:	e8 d7 d7 ff ff       	call   c0005d67 <read>
c0008590:	83 c4 10             	add    $0x10,%esp
c0008593:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008596:	83 ec 08             	sub    $0x8,%esp
c0008599:	ff 75 ec             	pushl  -0x14(%ebp)
c000859c:	68 93 b1 00 c0       	push   $0xc000b193
c00085a1:	e8 ce 09 00 00       	call   c0008f74 <Printf>
c00085a6:	83 c4 10             	add    $0x10,%esp
c00085a9:	eb c3                	jmp    c000856e <TestTTY+0x62>

c00085ab <TestFS>:
c00085ab:	55                   	push   %ebp
c00085ac:	89 e5                	mov    %esp,%ebp
c00085ae:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c00085b4:	83 ec 0c             	sub    $0xc,%esp
c00085b7:	68 9d b1 00 c0       	push   $0xc000b19d
c00085bc:	e8 cb 8f ff ff       	call   c000158c <disp_str>
c00085c1:	83 c4 10             	add    $0x10,%esp
c00085c4:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c00085cb:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c00085d2:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c00085d8:	83 ec 08             	sub    $0x8,%esp
c00085db:	6a 02                	push   $0x2
c00085dd:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00085e0:	50                   	push   %eax
c00085e1:	e8 fc d6 ff ff       	call   c0005ce2 <open>
c00085e6:	83 c4 10             	add    $0x10,%esp
c00085e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00085ec:	83 ec 08             	sub    $0x8,%esp
c00085ef:	6a 02                	push   $0x2
c00085f1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00085f4:	50                   	push   %eax
c00085f5:	e8 e8 d6 ff ff       	call   c0005ce2 <open>
c00085fa:	83 c4 10             	add    $0x10,%esp
c00085fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008600:	83 ec 0c             	sub    $0xc,%esp
c0008603:	68 81 b1 00 c0       	push   $0xc000b181
c0008608:	e8 67 09 00 00       	call   c0008f74 <Printf>
c000860d:	83 c4 10             	add    $0x10,%esp
c0008610:	90                   	nop
c0008611:	c9                   	leave  
c0008612:	c3                   	ret    

c0008613 <wait_exit>:
c0008613:	55                   	push   %ebp
c0008614:	89 e5                	mov    %esp,%ebp
c0008616:	83 ec 28             	sub    $0x28,%esp
c0008619:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008620:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008627:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000862d:	83 ec 08             	sub    $0x8,%esp
c0008630:	6a 02                	push   $0x2
c0008632:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008635:	50                   	push   %eax
c0008636:	e8 a7 d6 ff ff       	call   c0005ce2 <open>
c000863b:	83 c4 10             	add    $0x10,%esp
c000863e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008641:	83 ec 08             	sub    $0x8,%esp
c0008644:	6a 02                	push   $0x2
c0008646:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008649:	50                   	push   %eax
c000864a:	e8 93 d6 ff ff       	call   c0005ce2 <open>
c000864f:	83 c4 10             	add    $0x10,%esp
c0008652:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008655:	e8 b7 d8 ff ff       	call   c0005f11 <fork>
c000865a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000865d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008661:	7e 25                	jle    c0008688 <wait_exit+0x75>
c0008663:	83 ec 0c             	sub    $0xc,%esp
c0008666:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008669:	50                   	push   %eax
c000866a:	e8 3b d8 ff ff       	call   c0005eaa <wait>
c000866f:	83 c4 10             	add    $0x10,%esp
c0008672:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008675:	83 ec 08             	sub    $0x8,%esp
c0008678:	50                   	push   %eax
c0008679:	68 a5 b1 00 c0       	push   $0xc000b1a5
c000867e:	e8 f1 08 00 00       	call   c0008f74 <Printf>
c0008683:	83 c4 10             	add    $0x10,%esp
c0008686:	eb fe                	jmp    c0008686 <wait_exit+0x73>
c0008688:	83 ec 0c             	sub    $0xc,%esp
c000868b:	68 c0 b1 00 c0       	push   $0xc000b1c0
c0008690:	e8 df 08 00 00       	call   c0008f74 <Printf>
c0008695:	83 c4 10             	add    $0x10,%esp
c0008698:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000869f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00086a2:	8d 50 01             	lea    0x1(%eax),%edx
c00086a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00086a8:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c00086ad:	7f 02                	jg     c00086b1 <wait_exit+0x9e>
c00086af:	eb ee                	jmp    c000869f <wait_exit+0x8c>
c00086b1:	90                   	nop
c00086b2:	83 ec 0c             	sub    $0xc,%esp
c00086b5:	68 cc b1 00 c0       	push   $0xc000b1cc
c00086ba:	e8 b5 08 00 00       	call   c0008f74 <Printf>
c00086bf:	83 c4 10             	add    $0x10,%esp
c00086c2:	83 ec 0c             	sub    $0xc,%esp
c00086c5:	6a 09                	push   $0x9
c00086c7:	e8 1c d8 ff ff       	call   c0005ee8 <exit>
c00086cc:	83 c4 10             	add    $0x10,%esp
c00086cf:	83 ec 0c             	sub    $0xc,%esp
c00086d2:	68 da b1 00 c0       	push   $0xc000b1da
c00086d7:	e8 98 08 00 00       	call   c0008f74 <Printf>
c00086dc:	83 c4 10             	add    $0x10,%esp
c00086df:	eb fe                	jmp    c00086df <wait_exit+0xcc>

c00086e1 <INIT_fork>:
c00086e1:	55                   	push   %ebp
c00086e2:	89 e5                	mov    %esp,%ebp
c00086e4:	53                   	push   %ebx
c00086e5:	83 ec 74             	sub    $0x74,%esp
c00086e8:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00086ef:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00086f6:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00086fc:	83 ec 08             	sub    $0x8,%esp
c00086ff:	6a 02                	push   $0x2
c0008701:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008704:	50                   	push   %eax
c0008705:	e8 d8 d5 ff ff       	call   c0005ce2 <open>
c000870a:	83 c4 10             	add    $0x10,%esp
c000870d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008710:	83 ec 08             	sub    $0x8,%esp
c0008713:	6a 02                	push   $0x2
c0008715:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008718:	50                   	push   %eax
c0008719:	e8 c4 d5 ff ff       	call   c0005ce2 <open>
c000871e:	83 c4 10             	add    $0x10,%esp
c0008721:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008724:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c000872b:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008732:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008739:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008740:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008747:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c000874e:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008755:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c000875c:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008763:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c000876a:	83 ec 0c             	sub    $0xc,%esp
c000876d:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008770:	50                   	push   %eax
c0008771:	e8 fe 07 00 00       	call   c0008f74 <Printf>
c0008776:	83 c4 10             	add    $0x10,%esp
c0008779:	83 ec 0c             	sub    $0xc,%esp
c000877c:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c000877f:	50                   	push   %eax
c0008780:	e8 12 2e 00 00       	call   c000b597 <Strlen>
c0008785:	83 c4 10             	add    $0x10,%esp
c0008788:	83 ec 04             	sub    $0x4,%esp
c000878b:	50                   	push   %eax
c000878c:	6a 00                	push   $0x0
c000878e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008791:	50                   	push   %eax
c0008792:	e8 c7 2d 00 00       	call   c000b55e <Memset>
c0008797:	83 c4 10             	add    $0x10,%esp
c000879a:	83 ec 04             	sub    $0x4,%esp
c000879d:	6a 28                	push   $0x28
c000879f:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00087a2:	50                   	push   %eax
c00087a3:	ff 75 f0             	pushl  -0x10(%ebp)
c00087a6:	e8 bc d5 ff ff       	call   c0005d67 <read>
c00087ab:	83 c4 10             	add    $0x10,%esp
c00087ae:	83 ec 0c             	sub    $0xc,%esp
c00087b1:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00087b4:	50                   	push   %eax
c00087b5:	e8 ba 07 00 00       	call   c0008f74 <Printf>
c00087ba:	83 c4 10             	add    $0x10,%esp
c00087bd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00087c4:	e8 48 d7 ff ff       	call   c0005f11 <fork>
c00087c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00087cc:	83 ec 0c             	sub    $0xc,%esp
c00087cf:	6a 01                	push   $0x1
c00087d1:	e8 67 06 00 00       	call   c0008e3d <delay>
c00087d6:	83 c4 10             	add    $0x10,%esp
c00087d9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00087dd:	0f 8e 8a 00 00 00    	jle    c000886d <INIT_fork+0x18c>
c00087e3:	83 ec 0c             	sub    $0xc,%esp
c00087e6:	68 e8 b1 00 c0       	push   $0xc000b1e8
c00087eb:	e8 84 07 00 00       	call   c0008f74 <Printf>
c00087f0:	83 c4 10             	add    $0x10,%esp
c00087f3:	66 87 db             	xchg   %bx,%bx
c00087f6:	83 ec 0c             	sub    $0xc,%esp
c00087f9:	6a 0a                	push   $0xa
c00087fb:	e8 3d 06 00 00       	call   c0008e3d <delay>
c0008800:	83 c4 10             	add    $0x10,%esp
c0008803:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008807:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c000880e:	c7 45 92 6e 74 0a 00 	movl   $0xa746e,-0x6e(%ebp)
c0008815:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008818:	b9 20 00 00 00       	mov    $0x20,%ecx
c000881d:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008822:	89 18                	mov    %ebx,(%eax)
c0008824:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008828:	8d 50 04             	lea    0x4(%eax),%edx
c000882b:	83 e2 fc             	and    $0xfffffffc,%edx
c000882e:	29 d0                	sub    %edx,%eax
c0008830:	01 c1                	add    %eax,%ecx
c0008832:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008835:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008838:	b8 00 00 00 00       	mov    $0x0,%eax
c000883d:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008840:	83 c0 04             	add    $0x4,%eax
c0008843:	39 c8                	cmp    %ecx,%eax
c0008845:	72 f6                	jb     c000883d <INIT_fork+0x15c>
c0008847:	01 c2                	add    %eax,%edx
c0008849:	83 ec 0c             	sub    $0xc,%esp
c000884c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000884f:	50                   	push   %eax
c0008850:	e8 42 2d 00 00       	call   c000b597 <Strlen>
c0008855:	83 c4 10             	add    $0x10,%esp
c0008858:	83 ec 04             	sub    $0x4,%esp
c000885b:	50                   	push   %eax
c000885c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000885f:	50                   	push   %eax
c0008860:	ff 75 f4             	pushl  -0xc(%ebp)
c0008863:	e8 73 d5 ff ff       	call   c0005ddb <write>
c0008868:	83 c4 10             	add    $0x10,%esp
c000886b:	eb fe                	jmp    c000886b <INIT_fork+0x18a>
c000886d:	66 87 db             	xchg   %bx,%bx
c0008870:	83 ec 0c             	sub    $0xc,%esp
c0008873:	68 ee b1 00 c0       	push   $0xc000b1ee
c0008878:	e8 0f 8d ff ff       	call   c000158c <disp_str>
c000887d:	83 c4 10             	add    $0x10,%esp
c0008880:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008884:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008888:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c000888f:	c7 45 92 64 0a 00 00 	movl   $0xa64,-0x6e(%ebp)
c0008896:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008899:	b9 20 00 00 00       	mov    $0x20,%ecx
c000889e:	bb 00 00 00 00       	mov    $0x0,%ebx
c00088a3:	89 18                	mov    %ebx,(%eax)
c00088a5:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c00088a9:	8d 50 04             	lea    0x4(%eax),%edx
c00088ac:	83 e2 fc             	and    $0xfffffffc,%edx
c00088af:	29 d0                	sub    %edx,%eax
c00088b1:	01 c1                	add    %eax,%ecx
c00088b3:	83 e1 fc             	and    $0xfffffffc,%ecx
c00088b6:	83 e1 fc             	and    $0xfffffffc,%ecx
c00088b9:	b8 00 00 00 00       	mov    $0x0,%eax
c00088be:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c00088c1:	83 c0 04             	add    $0x4,%eax
c00088c4:	39 c8                	cmp    %ecx,%eax
c00088c6:	72 f6                	jb     c00088be <INIT_fork+0x1dd>
c00088c8:	01 c2                	add    %eax,%edx
c00088ca:	66 87 db             	xchg   %bx,%bx
c00088cd:	83 ec 0c             	sub    $0xc,%esp
c00088d0:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00088d3:	50                   	push   %eax
c00088d4:	e8 be 2c 00 00       	call   c000b597 <Strlen>
c00088d9:	83 c4 10             	add    $0x10,%esp
c00088dc:	83 ec 04             	sub    $0x4,%esp
c00088df:	50                   	push   %eax
c00088e0:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00088e3:	50                   	push   %eax
c00088e4:	ff 75 f4             	pushl  -0xc(%ebp)
c00088e7:	e8 ef d4 ff ff       	call   c0005ddb <write>
c00088ec:	83 c4 10             	add    $0x10,%esp
c00088ef:	eb fe                	jmp    c00088ef <INIT_fork+0x20e>

c00088f1 <simple_shell>:
c00088f1:	55                   	push   %ebp
c00088f2:	89 e5                	mov    %esp,%ebp
c00088f4:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c00088fa:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008901:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008908:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c000890e:	83 ec 08             	sub    $0x8,%esp
c0008911:	6a 02                	push   $0x2
c0008913:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008916:	50                   	push   %eax
c0008917:	e8 c6 d3 ff ff       	call   c0005ce2 <open>
c000891c:	83 c4 10             	add    $0x10,%esp
c000891f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008922:	83 ec 08             	sub    $0x8,%esp
c0008925:	6a 02                	push   $0x2
c0008927:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000892a:	50                   	push   %eax
c000892b:	e8 b2 d3 ff ff       	call   c0005ce2 <open>
c0008930:	83 c4 10             	add    $0x10,%esp
c0008933:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008936:	83 ec 04             	sub    $0x4,%esp
c0008939:	68 80 00 00 00       	push   $0x80
c000893e:	6a 00                	push   $0x0
c0008940:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008946:	50                   	push   %eax
c0008947:	e8 12 2c 00 00       	call   c000b55e <Memset>
c000894c:	83 c4 10             	add    $0x10,%esp
c000894f:	83 ec 04             	sub    $0x4,%esp
c0008952:	68 80 00 00 00       	push   $0x80
c0008957:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000895d:	50                   	push   %eax
c000895e:	ff 75 e0             	pushl  -0x20(%ebp)
c0008961:	e8 01 d4 ff ff       	call   c0005d67 <read>
c0008966:	83 c4 10             	add    $0x10,%esp
c0008969:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008970:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008977:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000897d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008980:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008983:	0f b6 00             	movzbl (%eax),%eax
c0008986:	88 45 db             	mov    %al,-0x25(%ebp)
c0008989:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000898c:	0f b6 00             	movzbl (%eax),%eax
c000898f:	3c 20                	cmp    $0x20,%al
c0008991:	74 1d                	je     c00089b0 <simple_shell+0xbf>
c0008993:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008996:	0f b6 00             	movzbl (%eax),%eax
c0008999:	84 c0                	test   %al,%al
c000899b:	74 13                	je     c00089b0 <simple_shell+0xbf>
c000899d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00089a1:	75 0d                	jne    c00089b0 <simple_shell+0xbf>
c00089a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00089a9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00089b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089b3:	0f b6 00             	movzbl (%eax),%eax
c00089b6:	3c 20                	cmp    $0x20,%al
c00089b8:	74 0a                	je     c00089c4 <simple_shell+0xd3>
c00089ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089bd:	0f b6 00             	movzbl (%eax),%eax
c00089c0:	84 c0                	test   %al,%al
c00089c2:	75 26                	jne    c00089ea <simple_shell+0xf9>
c00089c4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00089c8:	75 20                	jne    c00089ea <simple_shell+0xf9>
c00089ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00089cd:	8d 50 01             	lea    0x1(%eax),%edx
c00089d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00089d3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00089d6:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c00089dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089e0:	c6 00 00             	movb   $0x0,(%eax)
c00089e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00089ea:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00089ee:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c00089f2:	75 8c                	jne    c0008980 <simple_shell+0x8f>
c00089f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00089f7:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c00089fe:	00 00 00 00 
c0008a02:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008a09:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008a0f:	83 ec 08             	sub    $0x8,%esp
c0008a12:	6a 02                	push   $0x2
c0008a14:	50                   	push   %eax
c0008a15:	e8 c8 d2 ff ff       	call   c0005ce2 <open>
c0008a1a:	83 c4 10             	add    $0x10,%esp
c0008a1d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008a20:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008a24:	75 54                	jne    c0008a7a <simple_shell+0x189>
c0008a26:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008a2d:	eb 29                	jmp    c0008a58 <simple_shell+0x167>
c0008a2f:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008a35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008a38:	01 d0                	add    %edx,%eax
c0008a3a:	0f b6 00             	movzbl (%eax),%eax
c0008a3d:	0f be c0             	movsbl %al,%eax
c0008a40:	83 ec 04             	sub    $0x4,%esp
c0008a43:	50                   	push   %eax
c0008a44:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008a47:	68 f5 b1 00 c0       	push   $0xc000b1f5
c0008a4c:	e8 23 05 00 00       	call   c0008f74 <Printf>
c0008a51:	83 c4 10             	add    $0x10,%esp
c0008a54:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008a58:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008a5c:	7e d1                	jle    c0008a2f <simple_shell+0x13e>
c0008a5e:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008a64:	83 ec 08             	sub    $0x8,%esp
c0008a67:	50                   	push   %eax
c0008a68:	68 fc b1 00 c0       	push   $0xc000b1fc
c0008a6d:	e8 02 05 00 00       	call   c0008f74 <Printf>
c0008a72:	83 c4 10             	add    $0x10,%esp
c0008a75:	e9 bc fe ff ff       	jmp    c0008936 <simple_shell+0x45>
c0008a7a:	e8 92 d4 ff ff       	call   c0005f11 <fork>
c0008a7f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008a82:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008a86:	7e 17                	jle    c0008a9f <simple_shell+0x1ae>
c0008a88:	83 ec 0c             	sub    $0xc,%esp
c0008a8b:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008a91:	50                   	push   %eax
c0008a92:	e8 13 d4 ff ff       	call   c0005eaa <wait>
c0008a97:	83 c4 10             	add    $0x10,%esp
c0008a9a:	e9 97 fe ff ff       	jmp    c0008936 <simple_shell+0x45>
c0008a9f:	83 ec 0c             	sub    $0xc,%esp
c0008aa2:	ff 75 d0             	pushl  -0x30(%ebp)
c0008aa5:	e8 b4 d3 ff ff       	call   c0005e5e <close>
c0008aaa:	83 c4 10             	add    $0x10,%esp
c0008aad:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008ab3:	83 ec 08             	sub    $0x8,%esp
c0008ab6:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008abc:	52                   	push   %edx
c0008abd:	50                   	push   %eax
c0008abe:	e8 3d d5 ff ff       	call   c0006000 <execv>
c0008ac3:	83 c4 10             	add    $0x10,%esp
c0008ac6:	eb fe                	jmp    c0008ac6 <simple_shell+0x1d5>

c0008ac8 <test_split_str>:
c0008ac8:	55                   	push   %ebp
c0008ac9:	89 e5                	mov    %esp,%ebp
c0008acb:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008ad1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ad8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008adf:	c7 45 ec 02 b2 00 c0 	movl   $0xc000b202,-0x14(%ebp)
c0008ae6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008aea:	75 1a                	jne    c0008b06 <test_split_str+0x3e>
c0008aec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008aef:	0f b6 00             	movzbl (%eax),%eax
c0008af2:	0f be c0             	movsbl %al,%eax
c0008af5:	83 ec 08             	sub    $0x8,%esp
c0008af8:	50                   	push   %eax
c0008af9:	68 13 b2 00 c0       	push   $0xc000b213
c0008afe:	e8 71 04 00 00       	call   c0008f74 <Printf>
c0008b03:	83 c4 10             	add    $0x10,%esp
c0008b06:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b09:	0f b6 00             	movzbl (%eax),%eax
c0008b0c:	3c 20                	cmp    $0x20,%al
c0008b0e:	75 0a                	jne    c0008b1a <test_split_str+0x52>
c0008b10:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b13:	0f b6 00             	movzbl (%eax),%eax
c0008b16:	84 c0                	test   %al,%al
c0008b18:	74 13                	je     c0008b2d <test_split_str+0x65>
c0008b1a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008b1e:	75 0d                	jne    c0008b2d <test_split_str+0x65>
c0008b20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b23:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008b26:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008b2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b30:	0f b6 00             	movzbl (%eax),%eax
c0008b33:	3c 20                	cmp    $0x20,%al
c0008b35:	74 0a                	je     c0008b41 <test_split_str+0x79>
c0008b37:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b3a:	0f b6 00             	movzbl (%eax),%eax
c0008b3d:	84 c0                	test   %al,%al
c0008b3f:	75 26                	jne    c0008b67 <test_split_str+0x9f>
c0008b41:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008b45:	75 20                	jne    c0008b67 <test_split_str+0x9f>
c0008b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008b4a:	8d 50 01             	lea    0x1(%eax),%edx
c0008b4d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008b50:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008b53:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008b5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b5d:	c6 00 00             	movb   $0x0,(%eax)
c0008b60:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008b67:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008b6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b6e:	0f b6 00             	movzbl (%eax),%eax
c0008b71:	84 c0                	test   %al,%al
c0008b73:	0f 85 6d ff ff ff    	jne    c0008ae6 <test_split_str+0x1e>
c0008b79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008b7c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008b7f:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008b86:	83 ec 08             	sub    $0x8,%esp
c0008b89:	ff 75 f4             	pushl  -0xc(%ebp)
c0008b8c:	68 1c b2 00 c0       	push   $0xc000b21c
c0008b91:	e8 de 03 00 00       	call   c0008f74 <Printf>
c0008b96:	83 c4 10             	add    $0x10,%esp
c0008b99:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008ba0:	eb 22                	jmp    c0008bc4 <test_split_str+0xfc>
c0008ba2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008ba5:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008bac:	83 ec 04             	sub    $0x4,%esp
c0008baf:	50                   	push   %eax
c0008bb0:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008bb3:	68 33 b2 00 c0       	push   $0xc000b233
c0008bb8:	e8 b7 03 00 00       	call   c0008f74 <Printf>
c0008bbd:	83 c4 10             	add    $0x10,%esp
c0008bc0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008bc4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008bc7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008bca:	7e d6                	jle    c0008ba2 <test_split_str+0xda>
c0008bcc:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008bd2:	83 ec 08             	sub    $0x8,%esp
c0008bd5:	68 42 b2 00 c0       	push   $0xc000b242
c0008bda:	50                   	push   %eax
c0008bdb:	e8 de 12 00 00       	call   c0009ebe <strcmp>
c0008be0:	83 c4 10             	add    $0x10,%esp
c0008be3:	85 c0                	test   %eax,%eax
c0008be5:	75 10                	jne    c0008bf7 <test_split_str+0x12f>
c0008be7:	83 ec 0c             	sub    $0xc,%esp
c0008bea:	68 47 b2 00 c0       	push   $0xc000b247
c0008bef:	e8 80 03 00 00       	call   c0008f74 <Printf>
c0008bf4:	83 c4 10             	add    $0x10,%esp
c0008bf7:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008bfd:	83 ec 08             	sub    $0x8,%esp
c0008c00:	50                   	push   %eax
c0008c01:	68 53 b2 00 c0       	push   $0xc000b253
c0008c06:	e8 69 03 00 00       	call   c0008f74 <Printf>
c0008c0b:	83 c4 10             	add    $0x10,%esp
c0008c0e:	83 ec 0c             	sub    $0xc,%esp
c0008c11:	68 61 b2 00 c0       	push   $0xc000b261
c0008c16:	e8 59 03 00 00       	call   c0008f74 <Printf>
c0008c1b:	83 c4 10             	add    $0x10,%esp
c0008c1e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008c25:	eb 26                	jmp    c0008c4d <test_split_str+0x185>
c0008c27:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008c2d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008c30:	01 d0                	add    %edx,%eax
c0008c32:	0f b6 00             	movzbl (%eax),%eax
c0008c35:	0f be c0             	movsbl %al,%eax
c0008c38:	83 ec 08             	sub    $0x8,%esp
c0008c3b:	50                   	push   %eax
c0008c3c:	68 70 b2 00 c0       	push   $0xc000b270
c0008c41:	e8 2e 03 00 00       	call   c0008f74 <Printf>
c0008c46:	83 c4 10             	add    $0x10,%esp
c0008c49:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008c4d:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008c51:	7e d4                	jle    c0008c27 <test_split_str+0x15f>
c0008c53:	c9                   	leave  
c0008c54:	c3                   	ret    

c0008c55 <test_shell>:
c0008c55:	55                   	push   %ebp
c0008c56:	89 e5                	mov    %esp,%ebp
c0008c58:	83 ec 48             	sub    $0x48,%esp
c0008c5b:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0008c62:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0008c69:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0008c6f:	83 ec 08             	sub    $0x8,%esp
c0008c72:	6a 02                	push   $0x2
c0008c74:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0008c77:	50                   	push   %eax
c0008c78:	e8 65 d0 ff ff       	call   c0005ce2 <open>
c0008c7d:	83 c4 10             	add    $0x10,%esp
c0008c80:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008c83:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0008c8a:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0008c91:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0008c98:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008c9f:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008ca6:	83 ec 0c             	sub    $0xc,%esp
c0008ca9:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008cac:	50                   	push   %eax
c0008cad:	e8 70 eb ff ff       	call   c0007822 <untar>
c0008cb2:	83 c4 10             	add    $0x10,%esp
c0008cb5:	e8 57 d2 ff ff       	call   c0005f11 <fork>
c0008cba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008cbd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008cc1:	7e 25                	jle    c0008ce8 <test_shell+0x93>
c0008cc3:	83 ec 0c             	sub    $0xc,%esp
c0008cc6:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0008cc9:	50                   	push   %eax
c0008cca:	e8 db d1 ff ff       	call   c0005eaa <wait>
c0008ccf:	83 c4 10             	add    $0x10,%esp
c0008cd2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008cd5:	83 ec 08             	sub    $0x8,%esp
c0008cd8:	50                   	push   %eax
c0008cd9:	68 79 b2 00 c0       	push   $0xc000b279
c0008cde:	e8 91 02 00 00       	call   c0008f74 <Printf>
c0008ce3:	83 c4 10             	add    $0x10,%esp
c0008ce6:	eb 23                	jmp    c0008d0b <test_shell+0xb6>
c0008ce8:	83 ec 0c             	sub    $0xc,%esp
c0008ceb:	68 8b b2 00 c0       	push   $0xc000b28b
c0008cf0:	e8 7f 02 00 00       	call   c0008f74 <Printf>
c0008cf5:	83 c4 10             	add    $0x10,%esp
c0008cf8:	83 ec 0c             	sub    $0xc,%esp
c0008cfb:	ff 75 f4             	pushl  -0xc(%ebp)
c0008cfe:	e8 5b d1 ff ff       	call   c0005e5e <close>
c0008d03:	83 c4 10             	add    $0x10,%esp
c0008d06:	e8 e6 fb ff ff       	call   c00088f1 <simple_shell>
c0008d0b:	83 ec 0c             	sub    $0xc,%esp
c0008d0e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008d11:	50                   	push   %eax
c0008d12:	e8 93 d1 ff ff       	call   c0005eaa <wait>
c0008d17:	83 c4 10             	add    $0x10,%esp
c0008d1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d1d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008d20:	83 ec 08             	sub    $0x8,%esp
c0008d23:	50                   	push   %eax
c0008d24:	68 99 b2 00 c0       	push   $0xc000b299
c0008d29:	e8 46 02 00 00       	call   c0008f74 <Printf>
c0008d2e:	83 c4 10             	add    $0x10,%esp
c0008d31:	eb d8                	jmp    c0008d0b <test_shell+0xb6>

c0008d33 <test_exec>:
c0008d33:	55                   	push   %ebp
c0008d34:	89 e5                	mov    %esp,%ebp
c0008d36:	83 ec 38             	sub    $0x38,%esp
c0008d39:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008d40:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008d47:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008d4d:	83 ec 08             	sub    $0x8,%esp
c0008d50:	6a 02                	push   $0x2
c0008d52:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008d55:	50                   	push   %eax
c0008d56:	e8 87 cf ff ff       	call   c0005ce2 <open>
c0008d5b:	83 c4 10             	add    $0x10,%esp
c0008d5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d61:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0008d68:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0008d6f:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0008d76:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008d7d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008d84:	83 ec 0c             	sub    $0xc,%esp
c0008d87:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0008d8a:	50                   	push   %eax
c0008d8b:	e8 92 ea ff ff       	call   c0007822 <untar>
c0008d90:	83 c4 10             	add    $0x10,%esp
c0008d93:	e8 79 d1 ff ff       	call   c0005f11 <fork>
c0008d98:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d9b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008d9f:	7e 25                	jle    c0008dc6 <test_exec+0x93>
c0008da1:	83 ec 0c             	sub    $0xc,%esp
c0008da4:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008da7:	50                   	push   %eax
c0008da8:	e8 fd d0 ff ff       	call   c0005eaa <wait>
c0008dad:	83 c4 10             	add    $0x10,%esp
c0008db0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008db3:	83 ec 08             	sub    $0x8,%esp
c0008db6:	50                   	push   %eax
c0008db7:	68 79 b2 00 c0       	push   $0xc000b279
c0008dbc:	e8 b3 01 00 00       	call   c0008f74 <Printf>
c0008dc1:	83 c4 10             	add    $0x10,%esp
c0008dc4:	eb 33                	jmp    c0008df9 <test_exec+0xc6>
c0008dc6:	83 ec 0c             	sub    $0xc,%esp
c0008dc9:	68 8b b2 00 c0       	push   $0xc000b28b
c0008dce:	e8 a1 01 00 00       	call   c0008f74 <Printf>
c0008dd3:	83 c4 10             	add    $0x10,%esp
c0008dd6:	83 ec 0c             	sub    $0xc,%esp
c0008dd9:	6a 00                	push   $0x0
c0008ddb:	68 b4 b2 00 c0       	push   $0xc000b2b4
c0008de0:	68 ba b2 00 c0       	push   $0xc000b2ba
c0008de5:	68 42 b2 00 c0       	push   $0xc000b242
c0008dea:	68 c0 b2 00 c0       	push   $0xc000b2c0
c0008def:	e8 b1 d3 ff ff       	call   c00061a5 <execl>
c0008df4:	83 c4 20             	add    $0x20,%esp
c0008df7:	eb fe                	jmp    c0008df7 <test_exec+0xc4>
c0008df9:	c9                   	leave  
c0008dfa:	c3                   	ret    

c0008dfb <INIT>:
c0008dfb:	55                   	push   %ebp
c0008dfc:	89 e5                	mov    %esp,%ebp
c0008dfe:	83 ec 08             	sub    $0x8,%esp
c0008e01:	e8 4f fe ff ff       	call   c0008c55 <test_shell>
c0008e06:	eb fe                	jmp    c0008e06 <INIT+0xb>

c0008e08 <TestA>:
c0008e08:	55                   	push   %ebp
c0008e09:	89 e5                	mov    %esp,%ebp
c0008e0b:	83 ec 08             	sub    $0x8,%esp
c0008e0e:	83 ec 0c             	sub    $0xc,%esp
c0008e11:	6a 05                	push   $0x5
c0008e13:	e8 ba ec ff ff       	call   c0007ad2 <disp_int>
c0008e18:	83 c4 10             	add    $0x10,%esp
c0008e1b:	83 ec 0c             	sub    $0xc,%esp
c0008e1e:	68 34 ae 00 c0       	push   $0xc000ae34
c0008e23:	e8 64 87 ff ff       	call   c000158c <disp_str>
c0008e28:	83 c4 10             	add    $0x10,%esp
c0008e2b:	83 ec 0c             	sub    $0xc,%esp
c0008e2e:	68 c6 b2 00 c0       	push   $0xc000b2c6
c0008e33:	e8 54 87 ff ff       	call   c000158c <disp_str>
c0008e38:	83 c4 10             	add    $0x10,%esp
c0008e3b:	eb fe                	jmp    c0008e3b <TestA+0x33>

c0008e3d <delay>:
c0008e3d:	55                   	push   %ebp
c0008e3e:	89 e5                	mov    %esp,%ebp
c0008e40:	83 ec 10             	sub    $0x10,%esp
c0008e43:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008e4a:	eb 2d                	jmp    c0008e79 <delay+0x3c>
c0008e4c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008e53:	eb 1a                	jmp    c0008e6f <delay+0x32>
c0008e55:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008e5c:	eb 04                	jmp    c0008e62 <delay+0x25>
c0008e5e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008e62:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0008e69:	7e f3                	jle    c0008e5e <delay+0x21>
c0008e6b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008e6f:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008e73:	7e e0                	jle    c0008e55 <delay+0x18>
c0008e75:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008e79:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008e7c:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008e7f:	7c cb                	jl     c0008e4c <delay+0xf>
c0008e81:	90                   	nop
c0008e82:	c9                   	leave  
c0008e83:	c3                   	ret    

c0008e84 <TestB>:
c0008e84:	55                   	push   %ebp
c0008e85:	89 e5                	mov    %esp,%ebp
c0008e87:	83 ec 08             	sub    $0x8,%esp
c0008e8a:	83 ec 0c             	sub    $0xc,%esp
c0008e8d:	68 cd b2 00 c0       	push   $0xc000b2cd
c0008e92:	e8 f5 86 ff ff       	call   c000158c <disp_str>
c0008e97:	83 c4 10             	add    $0x10,%esp
c0008e9a:	eb fe                	jmp    c0008e9a <TestB+0x16>

c0008e9c <TestC>:
c0008e9c:	55                   	push   %ebp
c0008e9d:	89 e5                	mov    %esp,%ebp
c0008e9f:	83 ec 18             	sub    $0x18,%esp
c0008ea2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ea9:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008ead:	77 1a                	ja     c0008ec9 <TestC+0x2d>
c0008eaf:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008eb6:	83 ec 08             	sub    $0x8,%esp
c0008eb9:	ff 75 f0             	pushl  -0x10(%ebp)
c0008ebc:	68 d0 b2 00 c0       	push   $0xc000b2d0
c0008ec1:	e8 ae 00 00 00       	call   c0008f74 <Printf>
c0008ec6:	83 c4 10             	add    $0x10,%esp
c0008ec9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008ecd:	eb da                	jmp    c0008ea9 <TestC+0xd>

c0008ecf <sys_get_ticks>:
c0008ecf:	55                   	push   %ebp
c0008ed0:	89 e5                	mov    %esp,%ebp
c0008ed2:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0008ed7:	8b 15 04 1f 01 c0    	mov    0xc0011f04,%edx
c0008edd:	5d                   	pop    %ebp
c0008ede:	c3                   	ret    

c0008edf <sys_write>:
c0008edf:	55                   	push   %ebp
c0008ee0:	89 e5                	mov    %esp,%ebp
c0008ee2:	83 ec 18             	sub    $0x18,%esp
c0008ee5:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ee8:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0008eee:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0008ef4:	05 e0 fd 00 c0       	add    $0xc000fde0,%eax
c0008ef9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008efc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008eff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f02:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f05:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f08:	eb 20                	jmp    c0008f2a <sys_write+0x4b>
c0008f0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f0d:	0f b6 00             	movzbl (%eax),%eax
c0008f10:	0f b6 c0             	movzbl %al,%eax
c0008f13:	83 ec 08             	sub    $0x8,%esp
c0008f16:	50                   	push   %eax
c0008f17:	ff 75 ec             	pushl  -0x14(%ebp)
c0008f1a:	e8 4f c1 ff ff       	call   c000506e <out_char>
c0008f1f:	83 c4 10             	add    $0x10,%esp
c0008f22:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008f26:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008f2a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008f2e:	7f da                	jg     c0008f0a <sys_write+0x2b>
c0008f30:	90                   	nop
c0008f31:	c9                   	leave  
c0008f32:	c3                   	ret    

c0008f33 <milli_delay>:
c0008f33:	55                   	push   %ebp
c0008f34:	89 e5                	mov    %esp,%ebp
c0008f36:	83 ec 18             	sub    $0x18,%esp
c0008f39:	e8 ac 0d 00 00       	call   c0009cea <get_ticks_ipc>
c0008f3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f41:	90                   	nop
c0008f42:	e8 a3 0d 00 00       	call   c0009cea <get_ticks_ipc>
c0008f47:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0008f4a:	89 c1                	mov    %eax,%ecx
c0008f4c:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0008f51:	89 c8                	mov    %ecx,%eax
c0008f53:	f7 ea                	imul   %edx
c0008f55:	c1 fa 05             	sar    $0x5,%edx
c0008f58:	89 c8                	mov    %ecx,%eax
c0008f5a:	c1 f8 1f             	sar    $0x1f,%eax
c0008f5d:	29 c2                	sub    %eax,%edx
c0008f5f:	89 d0                	mov    %edx,%eax
c0008f61:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0008f67:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008f6a:	77 d6                	ja     c0008f42 <milli_delay+0xf>
c0008f6c:	90                   	nop
c0008f6d:	c9                   	leave  
c0008f6e:	c3                   	ret    

c0008f6f <TaskSys>:
c0008f6f:	55                   	push   %ebp
c0008f70:	89 e5                	mov    %esp,%ebp
c0008f72:	eb fe                	jmp    c0008f72 <TaskSys+0x3>

c0008f74 <Printf>:
c0008f74:	55                   	push   %ebp
c0008f75:	89 e5                	mov    %esp,%ebp
c0008f77:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008f7d:	83 ec 04             	sub    $0x4,%esp
c0008f80:	68 00 01 00 00       	push   $0x100
c0008f85:	6a 00                	push   $0x0
c0008f87:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008f8d:	50                   	push   %eax
c0008f8e:	e8 cb 25 00 00       	call   c000b55e <Memset>
c0008f93:	83 c4 10             	add    $0x10,%esp
c0008f96:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008f99:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f9f:	83 ec 04             	sub    $0x4,%esp
c0008fa2:	ff 75 f4             	pushl  -0xc(%ebp)
c0008fa5:	50                   	push   %eax
c0008fa6:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008fac:	50                   	push   %eax
c0008fad:	e8 20 00 00 00       	call   c0008fd2 <vsprintf>
c0008fb2:	83 c4 10             	add    $0x10,%esp
c0008fb5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008fb8:	83 ec 04             	sub    $0x4,%esp
c0008fbb:	ff 75 f0             	pushl  -0x10(%ebp)
c0008fbe:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008fc4:	50                   	push   %eax
c0008fc5:	6a 00                	push   $0x0
c0008fc7:	e8 0f ce ff ff       	call   c0005ddb <write>
c0008fcc:	83 c4 10             	add    $0x10,%esp
c0008fcf:	90                   	nop
c0008fd0:	c9                   	leave  
c0008fd1:	c3                   	ret    

c0008fd2 <vsprintf>:
c0008fd2:	55                   	push   %ebp
c0008fd3:	89 e5                	mov    %esp,%ebp
c0008fd5:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008fdb:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008fe1:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008fe7:	83 ec 04             	sub    $0x4,%esp
c0008fea:	6a 40                	push   $0x40
c0008fec:	6a 00                	push   $0x0
c0008fee:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008ff4:	50                   	push   %eax
c0008ff5:	e8 64 25 00 00       	call   c000b55e <Memset>
c0008ffa:	83 c4 10             	add    $0x10,%esp
c0008ffd:	8b 45 10             	mov    0x10(%ebp),%eax
c0009000:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009003:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000900a:	8b 45 08             	mov    0x8(%ebp),%eax
c000900d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009010:	e9 53 01 00 00       	jmp    c0009168 <vsprintf+0x196>
c0009015:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009018:	0f b6 00             	movzbl (%eax),%eax
c000901b:	3c 25                	cmp    $0x25,%al
c000901d:	74 16                	je     c0009035 <vsprintf+0x63>
c000901f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009022:	8d 50 01             	lea    0x1(%eax),%edx
c0009025:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009028:	8b 55 0c             	mov    0xc(%ebp),%edx
c000902b:	0f b6 12             	movzbl (%edx),%edx
c000902e:	88 10                	mov    %dl,(%eax)
c0009030:	e9 2f 01 00 00       	jmp    c0009164 <vsprintf+0x192>
c0009035:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009039:	8b 45 0c             	mov    0xc(%ebp),%eax
c000903c:	0f b6 00             	movzbl (%eax),%eax
c000903f:	0f be c0             	movsbl %al,%eax
c0009042:	83 f8 64             	cmp    $0x64,%eax
c0009045:	74 26                	je     c000906d <vsprintf+0x9b>
c0009047:	83 f8 64             	cmp    $0x64,%eax
c000904a:	7f 0e                	jg     c000905a <vsprintf+0x88>
c000904c:	83 f8 63             	cmp    $0x63,%eax
c000904f:	0f 84 f2 00 00 00    	je     c0009147 <vsprintf+0x175>
c0009055:	e9 0a 01 00 00       	jmp    c0009164 <vsprintf+0x192>
c000905a:	83 f8 73             	cmp    $0x73,%eax
c000905d:	0f 84 b0 00 00 00    	je     c0009113 <vsprintf+0x141>
c0009063:	83 f8 78             	cmp    $0x78,%eax
c0009066:	74 5d                	je     c00090c5 <vsprintf+0xf3>
c0009068:	e9 f7 00 00 00       	jmp    c0009164 <vsprintf+0x192>
c000906d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009070:	8b 00                	mov    (%eax),%eax
c0009072:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009075:	83 ec 04             	sub    $0x4,%esp
c0009078:	6a 0a                	push   $0xa
c000907a:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009080:	50                   	push   %eax
c0009081:	ff 75 e8             	pushl  -0x18(%ebp)
c0009084:	e8 ac 0c 00 00       	call   c0009d35 <itoa>
c0009089:	83 c4 10             	add    $0x10,%esp
c000908c:	83 ec 08             	sub    $0x8,%esp
c000908f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009095:	50                   	push   %eax
c0009096:	ff 75 f4             	pushl  -0xc(%ebp)
c0009099:	e8 df 24 00 00       	call   c000b57d <Strcpy>
c000909e:	83 c4 10             	add    $0x10,%esp
c00090a1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00090a5:	83 ec 0c             	sub    $0xc,%esp
c00090a8:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00090ae:	50                   	push   %eax
c00090af:	e8 e3 24 00 00       	call   c000b597 <Strlen>
c00090b4:	83 c4 10             	add    $0x10,%esp
c00090b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00090ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090bd:	01 45 f4             	add    %eax,-0xc(%ebp)
c00090c0:	e9 9f 00 00 00       	jmp    c0009164 <vsprintf+0x192>
c00090c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090c8:	8b 00                	mov    (%eax),%eax
c00090ca:	83 ec 08             	sub    $0x8,%esp
c00090cd:	50                   	push   %eax
c00090ce:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00090d4:	50                   	push   %eax
c00090d5:	e8 52 e9 ff ff       	call   c0007a2c <atoi>
c00090da:	83 c4 10             	add    $0x10,%esp
c00090dd:	83 ec 08             	sub    $0x8,%esp
c00090e0:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00090e6:	50                   	push   %eax
c00090e7:	ff 75 f4             	pushl  -0xc(%ebp)
c00090ea:	e8 8e 24 00 00       	call   c000b57d <Strcpy>
c00090ef:	83 c4 10             	add    $0x10,%esp
c00090f2:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00090f6:	83 ec 0c             	sub    $0xc,%esp
c00090f9:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00090ff:	50                   	push   %eax
c0009100:	e8 92 24 00 00       	call   c000b597 <Strlen>
c0009105:	83 c4 10             	add    $0x10,%esp
c0009108:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000910b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000910e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009111:	eb 51                	jmp    c0009164 <vsprintf+0x192>
c0009113:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009116:	8b 00                	mov    (%eax),%eax
c0009118:	83 ec 08             	sub    $0x8,%esp
c000911b:	50                   	push   %eax
c000911c:	ff 75 f4             	pushl  -0xc(%ebp)
c000911f:	e8 59 24 00 00       	call   c000b57d <Strcpy>
c0009124:	83 c4 10             	add    $0x10,%esp
c0009127:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000912a:	8b 00                	mov    (%eax),%eax
c000912c:	83 ec 0c             	sub    $0xc,%esp
c000912f:	50                   	push   %eax
c0009130:	e8 62 24 00 00       	call   c000b597 <Strlen>
c0009135:	83 c4 10             	add    $0x10,%esp
c0009138:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000913b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000913f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009142:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009145:	eb 1d                	jmp    c0009164 <vsprintf+0x192>
c0009147:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000914a:	0f b6 10             	movzbl (%eax),%edx
c000914d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009150:	88 10                	mov    %dl,(%eax)
c0009152:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009156:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000915d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009160:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009163:	90                   	nop
c0009164:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009168:	8b 45 0c             	mov    0xc(%ebp),%eax
c000916b:	0f b6 00             	movzbl (%eax),%eax
c000916e:	84 c0                	test   %al,%al
c0009170:	0f 85 9f fe ff ff    	jne    c0009015 <vsprintf+0x43>
c0009176:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009179:	2b 45 08             	sub    0x8(%ebp),%eax
c000917c:	c9                   	leave  
c000917d:	c3                   	ret    

c000917e <printx>:
c000917e:	55                   	push   %ebp
c000917f:	89 e5                	mov    %esp,%ebp
c0009181:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009187:	8d 45 0c             	lea    0xc(%ebp),%eax
c000918a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000918d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009190:	83 ec 04             	sub    $0x4,%esp
c0009193:	ff 75 f4             	pushl  -0xc(%ebp)
c0009196:	50                   	push   %eax
c0009197:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000919d:	50                   	push   %eax
c000919e:	e8 2f fe ff ff       	call   c0008fd2 <vsprintf>
c00091a3:	83 c4 10             	add    $0x10,%esp
c00091a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00091a9:	83 ec 08             	sub    $0x8,%esp
c00091ac:	ff 75 f0             	pushl  -0x10(%ebp)
c00091af:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00091b5:	50                   	push   %eax
c00091b6:	e8 4d 96 ff ff       	call   c0002808 <write_debug>
c00091bb:	83 c4 10             	add    $0x10,%esp
c00091be:	90                   	nop
c00091bf:	c9                   	leave  
c00091c0:	c3                   	ret    

c00091c1 <sys_printx>:
c00091c1:	55                   	push   %ebp
c00091c2:	89 e5                	mov    %esp,%ebp
c00091c4:	83 ec 28             	sub    $0x28,%esp
c00091c7:	a1 84 f7 00 c0       	mov    0xc000f784,%eax
c00091cc:	85 c0                	test   %eax,%eax
c00091ce:	75 23                	jne    c00091f3 <sys_printx+0x32>
c00091d0:	8b 45 10             	mov    0x10(%ebp),%eax
c00091d3:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00091d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00091dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00091df:	83 ec 08             	sub    $0x8,%esp
c00091e2:	ff 75 10             	pushl  0x10(%ebp)
c00091e5:	50                   	push   %eax
c00091e6:	e8 87 b9 ff ff       	call   c0004b72 <Seg2PhyAddrLDT>
c00091eb:	83 c4 10             	add    $0x10,%esp
c00091ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00091f1:	eb 19                	jmp    c000920c <sys_printx+0x4b>
c00091f3:	a1 84 f7 00 c0       	mov    0xc000f784,%eax
c00091f8:	85 c0                	test   %eax,%eax
c00091fa:	74 10                	je     c000920c <sys_printx+0x4b>
c00091fc:	83 ec 0c             	sub    $0xc,%esp
c00091ff:	6a 30                	push   $0x30
c0009201:	e8 2b b9 ff ff       	call   c0004b31 <Seg2PhyAddr>
c0009206:	83 c4 10             	add    $0x10,%esp
c0009209:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000920c:	8b 55 08             	mov    0x8(%ebp),%edx
c000920f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009212:	01 d0                	add    %edx,%eax
c0009214:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009217:	8b 45 10             	mov    0x10(%ebp),%eax
c000921a:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009220:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009226:	05 e0 fd 00 c0       	add    $0xc000fde0,%eax
c000922b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000922e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009231:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009234:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009237:	0f b6 00             	movzbl (%eax),%eax
c000923a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000923d:	eb 3a                	jmp    c0009279 <sys_printx+0xb8>
c000923f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009242:	0f b6 00             	movzbl (%eax),%eax
c0009245:	3c 3b                	cmp    $0x3b,%al
c0009247:	74 0a                	je     c0009253 <sys_printx+0x92>
c0009249:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000924c:	0f b6 00             	movzbl (%eax),%eax
c000924f:	3c 3a                	cmp    $0x3a,%al
c0009251:	75 06                	jne    c0009259 <sys_printx+0x98>
c0009253:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009257:	eb 20                	jmp    c0009279 <sys_printx+0xb8>
c0009259:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000925c:	0f b6 00             	movzbl (%eax),%eax
c000925f:	0f b6 c0             	movzbl %al,%eax
c0009262:	83 ec 08             	sub    $0x8,%esp
c0009265:	50                   	push   %eax
c0009266:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009269:	e8 00 be ff ff       	call   c000506e <out_char>
c000926e:	83 c4 10             	add    $0x10,%esp
c0009271:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009275:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009279:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000927d:	7f c0                	jg     c000923f <sys_printx+0x7e>
c000927f:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009283:	75 10                	jne    c0009295 <sys_printx+0xd4>
c0009285:	a1 84 f7 00 c0       	mov    0xc000f784,%eax
c000928a:	85 c0                	test   %eax,%eax
c000928c:	74 13                	je     c00092a1 <sys_printx+0xe0>
c000928e:	e8 35 85 ff ff       	call   c00017c8 <disable_int>
c0009293:	eb 0c                	jmp    c00092a1 <sys_printx+0xe0>
c0009295:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009299:	75 06                	jne    c00092a1 <sys_printx+0xe0>
c000929b:	e8 28 85 ff ff       	call   c00017c8 <disable_int>
c00092a0:	90                   	nop
c00092a1:	90                   	nop
c00092a2:	c9                   	leave  
c00092a3:	c3                   	ret    

c00092a4 <spin>:
c00092a4:	55                   	push   %ebp
c00092a5:	89 e5                	mov    %esp,%ebp
c00092a7:	83 ec 08             	sub    $0x8,%esp
c00092aa:	83 ec 0c             	sub    $0xc,%esp
c00092ad:	ff 75 08             	pushl  0x8(%ebp)
c00092b0:	e8 d7 82 ff ff       	call   c000158c <disp_str>
c00092b5:	83 c4 10             	add    $0x10,%esp
c00092b8:	83 ec 0c             	sub    $0xc,%esp
c00092bb:	68 34 ae 00 c0       	push   $0xc000ae34
c00092c0:	e8 c7 82 ff ff       	call   c000158c <disp_str>
c00092c5:	83 c4 10             	add    $0x10,%esp
c00092c8:	eb fe                	jmp    c00092c8 <spin+0x24>

c00092ca <panic>:
c00092ca:	55                   	push   %ebp
c00092cb:	89 e5                	mov    %esp,%ebp
c00092cd:	83 ec 08             	sub    $0x8,%esp
c00092d0:	83 ec 04             	sub    $0x4,%esp
c00092d3:	ff 75 08             	pushl  0x8(%ebp)
c00092d6:	6a 3a                	push   $0x3a
c00092d8:	68 dd b2 00 c0       	push   $0xc000b2dd
c00092dd:	e8 9c fe ff ff       	call   c000917e <printx>
c00092e2:	83 c4 10             	add    $0x10,%esp
c00092e5:	90                   	nop
c00092e6:	c9                   	leave  
c00092e7:	c3                   	ret    

c00092e8 <assertion_failure>:
c00092e8:	55                   	push   %ebp
c00092e9:	89 e5                	mov    %esp,%ebp
c00092eb:	83 ec 08             	sub    $0x8,%esp
c00092ee:	83 ec 08             	sub    $0x8,%esp
c00092f1:	ff 75 14             	pushl  0x14(%ebp)
c00092f4:	ff 75 10             	pushl  0x10(%ebp)
c00092f7:	ff 75 0c             	pushl  0xc(%ebp)
c00092fa:	ff 75 08             	pushl  0x8(%ebp)
c00092fd:	6a 3b                	push   $0x3b
c00092ff:	68 e4 b2 00 c0       	push   $0xc000b2e4
c0009304:	e8 75 fe ff ff       	call   c000917e <printx>
c0009309:	83 c4 20             	add    $0x20,%esp
c000930c:	83 ec 0c             	sub    $0xc,%esp
c000930f:	68 17 b3 00 c0       	push   $0xc000b317
c0009314:	e8 8b ff ff ff       	call   c00092a4 <spin>
c0009319:	83 c4 10             	add    $0x10,%esp
c000931c:	90                   	nop
c000931d:	c9                   	leave  
c000931e:	c3                   	ret    

c000931f <dead_lock>:
c000931f:	55                   	push   %ebp
c0009320:	89 e5                	mov    %esp,%ebp
c0009322:	b8 00 00 00 00       	mov    $0x0,%eax
c0009327:	5d                   	pop    %ebp
c0009328:	c3                   	ret    

c0009329 <sys_send_msg>:
c0009329:	55                   	push   %ebp
c000932a:	89 e5                	mov    %esp,%ebp
c000932c:	83 ec 48             	sub    $0x48,%esp
c000932f:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
c0009333:	75 0e                	jne    c0009343 <sys_send_msg+0x1a>
c0009335:	83 ec 0c             	sub    $0xc,%esp
c0009338:	ff 75 0c             	pushl  0xc(%ebp)
c000933b:	e8 92 e7 ff ff       	call   c0007ad2 <disp_int>
c0009340:	83 c4 10             	add    $0x10,%esp
c0009343:	83 ec 0c             	sub    $0xc,%esp
c0009346:	ff 75 0c             	pushl  0xc(%ebp)
c0009349:	e8 ed b6 ff ff       	call   c0004a3b <pid2proc>
c000934e:	83 c4 10             	add    $0x10,%esp
c0009351:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009354:	83 ec 0c             	sub    $0xc,%esp
c0009357:	ff 75 10             	pushl  0x10(%ebp)
c000935a:	e8 4e b7 ff ff       	call   c0004aad <proc2pid>
c000935f:	83 c4 10             	add    $0x10,%esp
c0009362:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009365:	8b 45 10             	mov    0x10(%ebp),%eax
c0009368:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c000936e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009371:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009378:	8b 45 08             	mov    0x8(%ebp),%eax
c000937b:	83 ec 08             	sub    $0x8,%esp
c000937e:	6a 6c                	push   $0x6c
c0009380:	50                   	push   %eax
c0009381:	e8 33 da ff ff       	call   c0006db9 <alloc_virtual_memory>
c0009386:	83 c4 10             	add    $0x10,%esp
c0009389:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000938c:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009393:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009396:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009399:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000939c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000939f:	89 10                	mov    %edx,(%eax)
c00093a1:	83 ec 08             	sub    $0x8,%esp
c00093a4:	ff 75 0c             	pushl  0xc(%ebp)
c00093a7:	ff 75 e8             	pushl  -0x18(%ebp)
c00093aa:	e8 70 ff ff ff       	call   c000931f <dead_lock>
c00093af:	83 c4 10             	add    $0x10,%esp
c00093b2:	83 f8 01             	cmp    $0x1,%eax
c00093b5:	75 10                	jne    c00093c7 <sys_send_msg+0x9e>
c00093b7:	83 ec 0c             	sub    $0xc,%esp
c00093ba:	68 23 b3 00 c0       	push   $0xc000b323
c00093bf:	e8 06 ff ff ff       	call   c00092ca <panic>
c00093c4:	83 c4 10             	add    $0x10,%esp
c00093c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093ca:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00093d1:	3c 02                	cmp    $0x2,%al
c00093d3:	0f 85 8a 01 00 00    	jne    c0009563 <sys_send_msg+0x23a>
c00093d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093dc:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00093e2:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00093e5:	74 12                	je     c00093f9 <sys_send_msg+0xd0>
c00093e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093ea:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00093f0:	83 f8 12             	cmp    $0x12,%eax
c00093f3:	0f 85 6a 01 00 00    	jne    c0009563 <sys_send_msg+0x23a>
c00093f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093fc:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009402:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009405:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009408:	83 ec 08             	sub    $0x8,%esp
c000940b:	ff 75 ec             	pushl  -0x14(%ebp)
c000940e:	50                   	push   %eax
c000940f:	e8 5e b7 ff ff       	call   c0004b72 <Seg2PhyAddrLDT>
c0009414:	83 c4 10             	add    $0x10,%esp
c0009417:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000941a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000941d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009423:	83 ec 08             	sub    $0x8,%esp
c0009426:	6a 6c                	push   $0x6c
c0009428:	50                   	push   %eax
c0009429:	e8 8b d9 ff ff       	call   c0006db9 <alloc_virtual_memory>
c000942e:	83 c4 10             	add    $0x10,%esp
c0009431:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009434:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009437:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000943a:	83 ec 04             	sub    $0x4,%esp
c000943d:	ff 75 d8             	pushl  -0x28(%ebp)
c0009440:	52                   	push   %edx
c0009441:	50                   	push   %eax
c0009442:	e8 e9 20 00 00       	call   c000b530 <Memcpy>
c0009447:	83 c4 10             	add    $0x10,%esp
c000944a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000944d:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009454:	00 00 00 
c0009457:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000945a:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009461:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009464:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000946b:	00 00 00 
c000946e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009471:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009478:	00 00 00 
c000947b:	83 ec 0c             	sub    $0xc,%esp
c000947e:	ff 75 ec             	pushl  -0x14(%ebp)
c0009481:	e8 f9 07 00 00       	call   c0009c7f <unblock>
c0009486:	83 c4 10             	add    $0x10,%esp
c0009489:	8b 45 10             	mov    0x10(%ebp),%eax
c000948c:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009493:	84 c0                	test   %al,%al
c0009495:	74 1c                	je     c00094b3 <sys_send_msg+0x18a>
c0009497:	68 99 05 00 00       	push   $0x599
c000949c:	68 2e b3 00 c0       	push   $0xc000b32e
c00094a1:	68 2e b3 00 c0       	push   $0xc000b32e
c00094a6:	68 3e b3 00 c0       	push   $0xc000b33e
c00094ab:	e8 38 fe ff ff       	call   c00092e8 <assertion_failure>
c00094b0:	83 c4 10             	add    $0x10,%esp
c00094b3:	8b 45 10             	mov    0x10(%ebp),%eax
c00094b6:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00094bc:	83 f8 21             	cmp    $0x21,%eax
c00094bf:	74 1c                	je     c00094dd <sys_send_msg+0x1b4>
c00094c1:	68 9a 05 00 00       	push   $0x59a
c00094c6:	68 2e b3 00 c0       	push   $0xc000b32e
c00094cb:	68 2e b3 00 c0       	push   $0xc000b32e
c00094d0:	68 52 b3 00 c0       	push   $0xc000b352
c00094d5:	e8 0e fe ff ff       	call   c00092e8 <assertion_failure>
c00094da:	83 c4 10             	add    $0x10,%esp
c00094dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094e0:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00094e6:	85 c0                	test   %eax,%eax
c00094e8:	74 1c                	je     c0009506 <sys_send_msg+0x1dd>
c00094ea:	68 9c 05 00 00       	push   $0x59c
c00094ef:	68 2e b3 00 c0       	push   $0xc000b32e
c00094f4:	68 2e b3 00 c0       	push   $0xc000b32e
c00094f9:	68 6f b3 00 c0       	push   $0xc000b36f
c00094fe:	e8 e5 fd ff ff       	call   c00092e8 <assertion_failure>
c0009503:	83 c4 10             	add    $0x10,%esp
c0009506:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009509:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009510:	84 c0                	test   %al,%al
c0009512:	74 1c                	je     c0009530 <sys_send_msg+0x207>
c0009514:	68 9d 05 00 00       	push   $0x59d
c0009519:	68 2e b3 00 c0       	push   $0xc000b32e
c000951e:	68 2e b3 00 c0       	push   $0xc000b32e
c0009523:	68 84 b3 00 c0       	push   $0xc000b384
c0009528:	e8 bb fd ff ff       	call   c00092e8 <assertion_failure>
c000952d:	83 c4 10             	add    $0x10,%esp
c0009530:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009533:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009539:	83 f8 21             	cmp    $0x21,%eax
c000953c:	0f 84 45 01 00 00    	je     c0009687 <sys_send_msg+0x35e>
c0009542:	68 9e 05 00 00       	push   $0x59e
c0009547:	68 2e b3 00 c0       	push   $0xc000b32e
c000954c:	68 2e b3 00 c0       	push   $0xc000b32e
c0009551:	68 9c b3 00 c0       	push   $0xc000b39c
c0009556:	e8 8d fd ff ff       	call   c00092e8 <assertion_failure>
c000955b:	83 c4 10             	add    $0x10,%esp
c000955e:	e9 24 01 00 00       	jmp    c0009687 <sys_send_msg+0x35e>
c0009563:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000956a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000956d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009570:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009573:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009579:	85 c0                	test   %eax,%eax
c000957b:	75 1b                	jne    c0009598 <sys_send_msg+0x26f>
c000957d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009580:	8b 55 10             	mov    0x10(%ebp),%edx
c0009583:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009589:	8b 45 10             	mov    0x10(%ebp),%eax
c000958c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009593:	00 00 00 
c0009596:	eb 3f                	jmp    c00095d7 <sys_send_msg+0x2ae>
c0009598:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000959b:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00095a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095a4:	eb 12                	jmp    c00095b8 <sys_send_msg+0x28f>
c00095a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00095ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095af:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00095b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00095bc:	75 e8                	jne    c00095a6 <sys_send_msg+0x27d>
c00095be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095c1:	8b 55 10             	mov    0x10(%ebp),%edx
c00095c4:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c00095ca:	8b 45 10             	mov    0x10(%ebp),%eax
c00095cd:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00095d4:	00 00 00 
c00095d7:	8b 45 10             	mov    0x10(%ebp),%eax
c00095da:	8b 55 08             	mov    0x8(%ebp),%edx
c00095dd:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c00095e3:	8b 45 10             	mov    0x10(%ebp),%eax
c00095e6:	8b 55 0c             	mov    0xc(%ebp),%edx
c00095e9:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c00095ef:	8b 45 10             	mov    0x10(%ebp),%eax
c00095f2:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c00095f9:	8b 45 10             	mov    0x10(%ebp),%eax
c00095fc:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009603:	3c 01                	cmp    $0x1,%al
c0009605:	74 1c                	je     c0009623 <sys_send_msg+0x2fa>
c0009607:	68 bf 05 00 00       	push   $0x5bf
c000960c:	68 2e b3 00 c0       	push   $0xc000b32e
c0009611:	68 2e b3 00 c0       	push   $0xc000b32e
c0009616:	68 c0 b3 00 c0       	push   $0xc000b3c0
c000961b:	e8 c8 fc ff ff       	call   c00092e8 <assertion_failure>
c0009620:	83 c4 10             	add    $0x10,%esp
c0009623:	8b 45 10             	mov    0x10(%ebp),%eax
c0009626:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000962c:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000962f:	74 1c                	je     c000964d <sys_send_msg+0x324>
c0009631:	68 c0 05 00 00       	push   $0x5c0
c0009636:	68 2e b3 00 c0       	push   $0xc000b32e
c000963b:	68 2e b3 00 c0       	push   $0xc000b32e
c0009640:	68 dc b3 00 c0       	push   $0xc000b3dc
c0009645:	e8 9e fc ff ff       	call   c00092e8 <assertion_failure>
c000964a:	83 c4 10             	add    $0x10,%esp
c000964d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009650:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009656:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009659:	74 1c                	je     c0009677 <sys_send_msg+0x34e>
c000965b:	68 c1 05 00 00       	push   $0x5c1
c0009660:	68 2e b3 00 c0       	push   $0xc000b32e
c0009665:	68 2e b3 00 c0       	push   $0xc000b32e
c000966a:	68 fe b3 00 c0       	push   $0xc000b3fe
c000966f:	e8 74 fc ff ff       	call   c00092e8 <assertion_failure>
c0009674:	83 c4 10             	add    $0x10,%esp
c0009677:	83 ec 0c             	sub    $0xc,%esp
c000967a:	ff 75 10             	pushl  0x10(%ebp)
c000967d:	e8 c1 05 00 00       	call   c0009c43 <block>
c0009682:	83 c4 10             	add    $0x10,%esp
c0009685:	eb 01                	jmp    c0009688 <sys_send_msg+0x35f>
c0009687:	90                   	nop
c0009688:	b8 00 00 00 00       	mov    $0x0,%eax
c000968d:	c9                   	leave  
c000968e:	c3                   	ret    

c000968f <sys_receive_msg>:
c000968f:	55                   	push   %ebp
c0009690:	89 e5                	mov    %esp,%ebp
c0009692:	83 ec 48             	sub    $0x48,%esp
c0009695:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000969c:	83 ec 0c             	sub    $0xc,%esp
c000969f:	ff 75 0c             	pushl  0xc(%ebp)
c00096a2:	e8 94 b3 ff ff       	call   c0004a3b <pid2proc>
c00096a7:	83 c4 10             	add    $0x10,%esp
c00096aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00096ad:	83 ec 0c             	sub    $0xc,%esp
c00096b0:	ff 75 10             	pushl  0x10(%ebp)
c00096b3:	e8 f5 b3 ff ff       	call   c0004aad <proc2pid>
c00096b8:	83 c4 10             	add    $0x10,%esp
c00096bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00096be:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00096c5:	8b 45 10             	mov    0x10(%ebp),%eax
c00096c8:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00096ce:	85 c0                	test   %eax,%eax
c00096d0:	0f 84 c7 00 00 00    	je     c000979d <sys_receive_msg+0x10e>
c00096d6:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c00096da:	74 0d                	je     c00096e9 <sys_receive_msg+0x5a>
c00096dc:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c00096e3:	0f 85 b4 00 00 00    	jne    c000979d <sys_receive_msg+0x10e>
c00096e9:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c00096f0:	83 ec 0c             	sub    $0xc,%esp
c00096f3:	ff 75 dc             	pushl  -0x24(%ebp)
c00096f6:	e8 ff d7 ff ff       	call   c0006efa <sys_malloc>
c00096fb:	83 c4 10             	add    $0x10,%esp
c00096fe:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009701:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009704:	83 ec 04             	sub    $0x4,%esp
c0009707:	50                   	push   %eax
c0009708:	6a 00                	push   $0x0
c000970a:	ff 75 d8             	pushl  -0x28(%ebp)
c000970d:	e8 4c 1e 00 00       	call   c000b55e <Memset>
c0009712:	83 c4 10             	add    $0x10,%esp
c0009715:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009718:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000971e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009721:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009728:	8b 45 08             	mov    0x8(%ebp),%eax
c000972b:	83 ec 08             	sub    $0x8,%esp
c000972e:	ff 75 dc             	pushl  -0x24(%ebp)
c0009731:	50                   	push   %eax
c0009732:	e8 82 d6 ff ff       	call   c0006db9 <alloc_virtual_memory>
c0009737:	83 c4 10             	add    $0x10,%esp
c000973a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000973d:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009740:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009743:	83 ec 04             	sub    $0x4,%esp
c0009746:	52                   	push   %edx
c0009747:	ff 75 d8             	pushl  -0x28(%ebp)
c000974a:	50                   	push   %eax
c000974b:	e8 e0 1d 00 00       	call   c000b530 <Memcpy>
c0009750:	83 c4 10             	add    $0x10,%esp
c0009753:	8b 45 10             	mov    0x10(%ebp),%eax
c0009756:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000975d:	00 00 00 
c0009760:	8b 45 10             	mov    0x10(%ebp),%eax
c0009763:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000976a:	00 00 00 
c000976d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009770:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009777:	00 00 00 
c000977a:	8b 45 10             	mov    0x10(%ebp),%eax
c000977d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009784:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000978b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000978e:	83 ec 08             	sub    $0x8,%esp
c0009791:	ff 75 dc             	pushl  -0x24(%ebp)
c0009794:	50                   	push   %eax
c0009795:	e8 9e da ff ff       	call   c0007238 <sys_free>
c000979a:	83 c4 10             	add    $0x10,%esp
c000979d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c00097a1:	0f 84 96 03 00 00    	je     c0009b3d <sys_receive_msg+0x4ae>
c00097a7:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c00097ab:	75 26                	jne    c00097d3 <sys_receive_msg+0x144>
c00097ad:	8b 45 10             	mov    0x10(%ebp),%eax
c00097b0:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00097b6:	85 c0                	test   %eax,%eax
c00097b8:	0f 84 8a 00 00 00    	je     c0009848 <sys_receive_msg+0x1b9>
c00097be:	8b 45 10             	mov    0x10(%ebp),%eax
c00097c1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00097c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00097ca:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00097d1:	eb 75                	jmp    c0009848 <sys_receive_msg+0x1b9>
c00097d3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00097d7:	78 6f                	js     c0009848 <sys_receive_msg+0x1b9>
c00097d9:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c00097dd:	7f 69                	jg     c0009848 <sys_receive_msg+0x1b9>
c00097df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00097e2:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00097e9:	3c 01                	cmp    $0x1,%al
c00097eb:	75 5b                	jne    c0009848 <sys_receive_msg+0x1b9>
c00097ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00097f0:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00097f6:	83 f8 12             	cmp    $0x12,%eax
c00097f9:	74 0e                	je     c0009809 <sys_receive_msg+0x17a>
c00097fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00097fe:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009804:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009807:	75 3f                	jne    c0009848 <sys_receive_msg+0x1b9>
c0009809:	8b 45 10             	mov    0x10(%ebp),%eax
c000980c:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009812:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009815:	eb 2b                	jmp    c0009842 <sys_receive_msg+0x1b3>
c0009817:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000981a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000981d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009820:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009826:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009829:	39 c2                	cmp    %eax,%edx
c000982b:	75 09                	jne    c0009836 <sys_receive_msg+0x1a7>
c000982d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009834:	eb 12                	jmp    c0009848 <sys_receive_msg+0x1b9>
c0009836:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009839:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000983f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009842:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009846:	75 cf                	jne    c0009817 <sys_receive_msg+0x188>
c0009848:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000984c:	0f 85 21 02 00 00    	jne    c0009a73 <sys_receive_msg+0x3e4>
c0009852:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009855:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009858:	8b 45 08             	mov    0x8(%ebp),%eax
c000985b:	83 ec 08             	sub    $0x8,%esp
c000985e:	6a 6c                	push   $0x6c
c0009860:	50                   	push   %eax
c0009861:	e8 53 d5 ff ff       	call   c0006db9 <alloc_virtual_memory>
c0009866:	83 c4 10             	add    $0x10,%esp
c0009869:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000986c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000986f:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009875:	83 ec 08             	sub    $0x8,%esp
c0009878:	6a 6c                	push   $0x6c
c000987a:	50                   	push   %eax
c000987b:	e8 39 d5 ff ff       	call   c0006db9 <alloc_virtual_memory>
c0009880:	83 c4 10             	add    $0x10,%esp
c0009883:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009886:	83 ec 04             	sub    $0x4,%esp
c0009889:	6a 6c                	push   $0x6c
c000988b:	ff 75 c8             	pushl  -0x38(%ebp)
c000988e:	ff 75 cc             	pushl  -0x34(%ebp)
c0009891:	e8 9a 1c 00 00       	call   c000b530 <Memcpy>
c0009896:	83 c4 10             	add    $0x10,%esp
c0009899:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000989c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000989f:	8b 45 10             	mov    0x10(%ebp),%eax
c00098a2:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00098a8:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00098ab:	75 21                	jne    c00098ce <sys_receive_msg+0x23f>
c00098ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00098b0:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c00098b6:	8b 45 10             	mov    0x10(%ebp),%eax
c00098b9:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00098bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00098c2:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00098c9:	00 00 00 
c00098cc:	eb 1f                	jmp    c00098ed <sys_receive_msg+0x25e>
c00098ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00098d1:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c00098d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098da:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c00098e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00098e3:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00098ea:	00 00 00 
c00098ed:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00098f0:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00098f7:	00 00 00 
c00098fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00098fd:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009904:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009907:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000990e:	00 00 00 
c0009911:	8b 45 10             	mov    0x10(%ebp),%eax
c0009914:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000991b:	00 00 00 
c000991e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009921:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009928:	00 00 00 
c000992b:	8b 45 10             	mov    0x10(%ebp),%eax
c000992e:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009935:	00 00 00 
c0009938:	83 ec 0c             	sub    $0xc,%esp
c000993b:	ff 75 d0             	pushl  -0x30(%ebp)
c000993e:	e8 3c 03 00 00       	call   c0009c7f <unblock>
c0009943:	83 c4 10             	add    $0x10,%esp
c0009946:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009949:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000994f:	85 c0                	test   %eax,%eax
c0009951:	74 1c                	je     c000996f <sys_receive_msg+0x2e0>
c0009953:	68 38 06 00 00       	push   $0x638
c0009958:	68 2e b3 00 c0       	push   $0xc000b32e
c000995d:	68 2e b3 00 c0       	push   $0xc000b32e
c0009962:	68 13 b4 00 c0       	push   $0xc000b413
c0009967:	e8 7c f9 ff ff       	call   c00092e8 <assertion_failure>
c000996c:	83 c4 10             	add    $0x10,%esp
c000996f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009972:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009979:	84 c0                	test   %al,%al
c000997b:	74 1c                	je     c0009999 <sys_receive_msg+0x30a>
c000997d:	68 39 06 00 00       	push   $0x639
c0009982:	68 2e b3 00 c0       	push   $0xc000b32e
c0009987:	68 2e b3 00 c0       	push   $0xc000b32e
c000998c:	68 2b b4 00 c0       	push   $0xc000b42b
c0009991:	e8 52 f9 ff ff       	call   c00092e8 <assertion_failure>
c0009996:	83 c4 10             	add    $0x10,%esp
c0009999:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000999c:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00099a2:	83 f8 21             	cmp    $0x21,%eax
c00099a5:	74 1c                	je     c00099c3 <sys_receive_msg+0x334>
c00099a7:	68 3a 06 00 00       	push   $0x63a
c00099ac:	68 2e b3 00 c0       	push   $0xc000b32e
c00099b1:	68 2e b3 00 c0       	push   $0xc000b32e
c00099b6:	68 44 b4 00 c0       	push   $0xc000b444
c00099bb:	e8 28 f9 ff ff       	call   c00092e8 <assertion_failure>
c00099c0:	83 c4 10             	add    $0x10,%esp
c00099c3:	8b 45 10             	mov    0x10(%ebp),%eax
c00099c6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00099cc:	85 c0                	test   %eax,%eax
c00099ce:	74 1c                	je     c00099ec <sys_receive_msg+0x35d>
c00099d0:	68 3c 06 00 00       	push   $0x63c
c00099d5:	68 2e b3 00 c0       	push   $0xc000b32e
c00099da:	68 2e b3 00 c0       	push   $0xc000b32e
c00099df:	68 6f b3 00 c0       	push   $0xc000b36f
c00099e4:	e8 ff f8 ff ff       	call   c00092e8 <assertion_failure>
c00099e9:	83 c4 10             	add    $0x10,%esp
c00099ec:	8b 45 10             	mov    0x10(%ebp),%eax
c00099ef:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00099f6:	84 c0                	test   %al,%al
c00099f8:	74 1c                	je     c0009a16 <sys_receive_msg+0x387>
c00099fa:	68 3d 06 00 00       	push   $0x63d
c00099ff:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a04:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a09:	68 84 b3 00 c0       	push   $0xc000b384
c0009a0e:	e8 d5 f8 ff ff       	call   c00092e8 <assertion_failure>
c0009a13:	83 c4 10             	add    $0x10,%esp
c0009a16:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a19:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009a1f:	83 f8 21             	cmp    $0x21,%eax
c0009a22:	74 1c                	je     c0009a40 <sys_receive_msg+0x3b1>
c0009a24:	68 3e 06 00 00       	push   $0x63e
c0009a29:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a2e:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a33:	68 9c b3 00 c0       	push   $0xc000b39c
c0009a38:	e8 ab f8 ff ff       	call   c00092e8 <assertion_failure>
c0009a3d:	83 c4 10             	add    $0x10,%esp
c0009a40:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a43:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009a49:	83 f8 21             	cmp    $0x21,%eax
c0009a4c:	0f 84 e4 00 00 00    	je     c0009b36 <sys_receive_msg+0x4a7>
c0009a52:	68 3f 06 00 00       	push   $0x63f
c0009a57:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a5c:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a61:	68 68 b4 00 c0       	push   $0xc000b468
c0009a66:	e8 7d f8 ff ff       	call   c00092e8 <assertion_failure>
c0009a6b:	83 c4 10             	add    $0x10,%esp
c0009a6e:	e9 c3 00 00 00       	jmp    c0009b36 <sys_receive_msg+0x4a7>
c0009a73:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a76:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009a7d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a80:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009a87:	3c 02                	cmp    $0x2,%al
c0009a89:	74 1c                	je     c0009aa7 <sys_receive_msg+0x418>
c0009a8b:	68 44 06 00 00       	push   $0x644
c0009a90:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a95:	68 2e b3 00 c0       	push   $0xc000b32e
c0009a9a:	68 87 b4 00 c0       	push   $0xc000b487
c0009a9f:	e8 44 f8 ff ff       	call   c00092e8 <assertion_failure>
c0009aa4:	83 c4 10             	add    $0x10,%esp
c0009aa7:	8b 45 10             	mov    0x10(%ebp),%eax
c0009aaa:	8b 55 08             	mov    0x8(%ebp),%edx
c0009aad:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009ab3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ab6:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009abd:	3c 02                	cmp    $0x2,%al
c0009abf:	74 1c                	je     c0009add <sys_receive_msg+0x44e>
c0009ac1:	68 46 06 00 00       	push   $0x646
c0009ac6:	68 2e b3 00 c0       	push   $0xc000b32e
c0009acb:	68 2e b3 00 c0       	push   $0xc000b32e
c0009ad0:	68 87 b4 00 c0       	push   $0xc000b487
c0009ad5:	e8 0e f8 ff ff       	call   c00092e8 <assertion_failure>
c0009ada:	83 c4 10             	add    $0x10,%esp
c0009add:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009ae1:	75 0f                	jne    c0009af2 <sys_receive_msg+0x463>
c0009ae3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ae6:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009aed:	00 00 00 
c0009af0:	eb 0c                	jmp    c0009afe <sys_receive_msg+0x46f>
c0009af2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009af5:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009af8:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009afe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b01:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009b08:	3c 02                	cmp    $0x2,%al
c0009b0a:	74 1c                	je     c0009b28 <sys_receive_msg+0x499>
c0009b0c:	68 51 06 00 00       	push   $0x651
c0009b11:	68 2e b3 00 c0       	push   $0xc000b32e
c0009b16:	68 2e b3 00 c0       	push   $0xc000b32e
c0009b1b:	68 87 b4 00 c0       	push   $0xc000b487
c0009b20:	e8 c3 f7 ff ff       	call   c00092e8 <assertion_failure>
c0009b25:	83 c4 10             	add    $0x10,%esp
c0009b28:	83 ec 0c             	sub    $0xc,%esp
c0009b2b:	ff 75 10             	pushl  0x10(%ebp)
c0009b2e:	e8 10 01 00 00       	call   c0009c43 <block>
c0009b33:	83 c4 10             	add    $0x10,%esp
c0009b36:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b3b:	eb 02                	jmp    c0009b3f <sys_receive_msg+0x4b0>
c0009b3d:	90                   	nop
c0009b3e:	90                   	nop
c0009b3f:	c9                   	leave  
c0009b40:	c3                   	ret    

c0009b41 <disp_str_colour_debug>:
c0009b41:	55                   	push   %ebp
c0009b42:	89 e5                	mov    %esp,%ebp
c0009b44:	90                   	nop
c0009b45:	5d                   	pop    %ebp
c0009b46:	c3                   	ret    

c0009b47 <send_rec>:
c0009b47:	55                   	push   %ebp
c0009b48:	89 e5                	mov    %esp,%ebp
c0009b4a:	83 ec 18             	sub    $0x18,%esp
c0009b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009b50:	83 ec 0c             	sub    $0xc,%esp
c0009b53:	50                   	push   %eax
c0009b54:	e8 cd d2 ff ff       	call   c0006e26 <get_physical_address>
c0009b59:	83 c4 10             	add    $0x10,%esp
c0009b5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009b5f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009b63:	74 28                	je     c0009b8d <send_rec+0x46>
c0009b65:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009b69:	74 22                	je     c0009b8d <send_rec+0x46>
c0009b6b:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009b6f:	74 1c                	je     c0009b8d <send_rec+0x46>
c0009b71:	68 6f 06 00 00       	push   $0x66f
c0009b76:	68 2e b3 00 c0       	push   $0xc000b32e
c0009b7b:	68 2e b3 00 c0       	push   $0xc000b32e
c0009b80:	68 a8 b4 00 c0       	push   $0xc000b4a8
c0009b85:	e8 5e f7 ff ff       	call   c00092e8 <assertion_failure>
c0009b8a:	83 c4 10             	add    $0x10,%esp
c0009b8d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009b91:	75 12                	jne    c0009ba5 <send_rec+0x5e>
c0009b93:	83 ec 04             	sub    $0x4,%esp
c0009b96:	6a 6c                	push   $0x6c
c0009b98:	6a 00                	push   $0x0
c0009b9a:	ff 75 0c             	pushl  0xc(%ebp)
c0009b9d:	e8 bc 19 00 00       	call   c000b55e <Memset>
c0009ba2:	83 c4 10             	add    $0x10,%esp
c0009ba5:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009ba9:	74 23                	je     c0009bce <send_rec+0x87>
c0009bab:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009baf:	74 34                	je     c0009be5 <send_rec+0x9e>
c0009bb1:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009bb5:	75 72                	jne    c0009c29 <send_rec+0xe2>
c0009bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bba:	83 ec 08             	sub    $0x8,%esp
c0009bbd:	ff 75 10             	pushl  0x10(%ebp)
c0009bc0:	50                   	push   %eax
c0009bc1:	e8 62 8c ff ff       	call   c0002828 <send_msg>
c0009bc6:	83 c4 10             	add    $0x10,%esp
c0009bc9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009bcc:	eb 6e                	jmp    c0009c3c <send_rec+0xf5>
c0009bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bd1:	83 ec 08             	sub    $0x8,%esp
c0009bd4:	ff 75 10             	pushl  0x10(%ebp)
c0009bd7:	50                   	push   %eax
c0009bd8:	e8 71 8c ff ff       	call   c000284e <receive_msg>
c0009bdd:	83 c4 10             	add    $0x10,%esp
c0009be0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009be3:	eb 57                	jmp    c0009c3c <send_rec+0xf5>
c0009be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009be8:	83 ec 08             	sub    $0x8,%esp
c0009beb:	ff 75 10             	pushl  0x10(%ebp)
c0009bee:	50                   	push   %eax
c0009bef:	e8 34 8c ff ff       	call   c0002828 <send_msg>
c0009bf4:	83 c4 10             	add    $0x10,%esp
c0009bf7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009bfa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009bfe:	75 3b                	jne    c0009c3b <send_rec+0xf4>
c0009c00:	83 ec 04             	sub    $0x4,%esp
c0009c03:	6a 6c                	push   $0x6c
c0009c05:	6a 00                	push   $0x0
c0009c07:	ff 75 0c             	pushl  0xc(%ebp)
c0009c0a:	e8 4f 19 00 00       	call   c000b55e <Memset>
c0009c0f:	83 c4 10             	add    $0x10,%esp
c0009c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c15:	83 ec 08             	sub    $0x8,%esp
c0009c18:	ff 75 10             	pushl  0x10(%ebp)
c0009c1b:	50                   	push   %eax
c0009c1c:	e8 2d 8c ff ff       	call   c000284e <receive_msg>
c0009c21:	83 c4 10             	add    $0x10,%esp
c0009c24:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c27:	eb 12                	jmp    c0009c3b <send_rec+0xf4>
c0009c29:	83 ec 0c             	sub    $0xc,%esp
c0009c2c:	68 e4 b4 00 c0       	push   $0xc000b4e4
c0009c31:	e8 94 f6 ff ff       	call   c00092ca <panic>
c0009c36:	83 c4 10             	add    $0x10,%esp
c0009c39:	eb 01                	jmp    c0009c3c <send_rec+0xf5>
c0009c3b:	90                   	nop
c0009c3c:	b8 00 00 00 00       	mov    $0x0,%eax
c0009c41:	c9                   	leave  
c0009c42:	c3                   	ret    

c0009c43 <block>:
c0009c43:	55                   	push   %ebp
c0009c44:	89 e5                	mov    %esp,%ebp
c0009c46:	83 ec 08             	sub    $0x8,%esp
c0009c49:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c4c:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009c53:	84 c0                	test   %al,%al
c0009c55:	75 1c                	jne    c0009c73 <block+0x30>
c0009c57:	68 9e 06 00 00       	push   $0x69e
c0009c5c:	68 2e b3 00 c0       	push   $0xc000b32e
c0009c61:	68 2e b3 00 c0       	push   $0xc000b32e
c0009c66:	68 f9 b4 00 c0       	push   $0xc000b4f9
c0009c6b:	e8 78 f6 ff ff       	call   c00092e8 <assertion_failure>
c0009c70:	83 c4 10             	add    $0x10,%esp
c0009c73:	e8 6c ac ff ff       	call   c00048e4 <schedule_process>
c0009c78:	b8 00 00 00 00       	mov    $0x0,%eax
c0009c7d:	c9                   	leave  
c0009c7e:	c3                   	ret    

c0009c7f <unblock>:
c0009c7f:	55                   	push   %ebp
c0009c80:	89 e5                	mov    %esp,%ebp
c0009c82:	83 ec 08             	sub    $0x8,%esp
c0009c85:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c88:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0009c8e:	83 f8 06             	cmp    $0x6,%eax
c0009c91:	75 0d                	jne    c0009ca0 <unblock+0x21>
c0009c93:	83 ec 0c             	sub    $0xc,%esp
c0009c96:	6a 06                	push   $0x6
c0009c98:	e8 35 de ff ff       	call   c0007ad2 <disp_int>
c0009c9d:	83 c4 10             	add    $0x10,%esp
c0009ca0:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ca3:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009caa:	84 c0                	test   %al,%al
c0009cac:	74 1c                	je     c0009cca <unblock+0x4b>
c0009cae:	68 aa 06 00 00       	push   $0x6aa
c0009cb3:	68 2e b3 00 c0       	push   $0xc000b32e
c0009cb8:	68 2e b3 00 c0       	push   $0xc000b32e
c0009cbd:	68 11 b5 00 c0       	push   $0xc000b511
c0009cc2:	e8 21 f6 ff ff       	call   c00092e8 <assertion_failure>
c0009cc7:	83 c4 10             	add    $0x10,%esp
c0009cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ccd:	05 00 01 00 00       	add    $0x100,%eax
c0009cd2:	83 ec 08             	sub    $0x8,%esp
c0009cd5:	50                   	push   %eax
c0009cd6:	68 cc fd 00 c0       	push   $0xc000fdcc
c0009cdb:	e8 dd 09 00 00       	call   c000a6bd <insertToDoubleLinkList>
c0009ce0:	83 c4 10             	add    $0x10,%esp
c0009ce3:	b8 00 00 00 00       	mov    $0x0,%eax
c0009ce8:	c9                   	leave  
c0009ce9:	c3                   	ret    

c0009cea <get_ticks_ipc>:
c0009cea:	55                   	push   %ebp
c0009ceb:	89 e5                	mov    %esp,%ebp
c0009ced:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009cf3:	83 ec 04             	sub    $0x4,%esp
c0009cf6:	6a 6c                	push   $0x6c
c0009cf8:	6a 00                	push   $0x0
c0009cfa:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009cfd:	50                   	push   %eax
c0009cfe:	e8 5b 18 00 00       	call   c000b55e <Memset>
c0009d03:	83 c4 10             	add    $0x10,%esp
c0009d06:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c0009d0d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009d14:	83 ec 04             	sub    $0x4,%esp
c0009d17:	6a 01                	push   $0x1
c0009d19:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009d1c:	50                   	push   %eax
c0009d1d:	6a 03                	push   $0x3
c0009d1f:	e8 23 fe ff ff       	call   c0009b47 <send_rec>
c0009d24:	83 c4 10             	add    $0x10,%esp
c0009d27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009d2a:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0009d2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009d30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d33:	c9                   	leave  
c0009d34:	c3                   	ret    

c0009d35 <itoa>:
c0009d35:	55                   	push   %ebp
c0009d36:	89 e5                	mov    %esp,%ebp
c0009d38:	53                   	push   %ebx
c0009d39:	83 ec 14             	sub    $0x14,%esp
c0009d3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d3f:	99                   	cltd   
c0009d40:	f7 7d 10             	idivl  0x10(%ebp)
c0009d43:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009d46:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d49:	99                   	cltd   
c0009d4a:	f7 7d 10             	idivl  0x10(%ebp)
c0009d4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009d50:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009d54:	74 14                	je     c0009d6a <itoa+0x35>
c0009d56:	83 ec 04             	sub    $0x4,%esp
c0009d59:	ff 75 10             	pushl  0x10(%ebp)
c0009d5c:	ff 75 0c             	pushl  0xc(%ebp)
c0009d5f:	ff 75 f0             	pushl  -0x10(%ebp)
c0009d62:	e8 ce ff ff ff       	call   c0009d35 <itoa>
c0009d67:	83 c4 10             	add    $0x10,%esp
c0009d6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d6d:	8d 58 30             	lea    0x30(%eax),%ebx
c0009d70:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009d73:	8b 00                	mov    (%eax),%eax
c0009d75:	8d 48 01             	lea    0x1(%eax),%ecx
c0009d78:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009d7b:	89 0a                	mov    %ecx,(%edx)
c0009d7d:	89 da                	mov    %ebx,%edx
c0009d7f:	88 10                	mov    %dl,(%eax)
c0009d81:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009d84:	8b 00                	mov    (%eax),%eax
c0009d86:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009d89:	c9                   	leave  
c0009d8a:	c3                   	ret    

c0009d8b <i2a>:
c0009d8b:	55                   	push   %ebp
c0009d8c:	89 e5                	mov    %esp,%ebp
c0009d8e:	53                   	push   %ebx
c0009d8f:	83 ec 14             	sub    $0x14,%esp
c0009d92:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d95:	99                   	cltd   
c0009d96:	f7 7d 0c             	idivl  0xc(%ebp)
c0009d99:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009d9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d9f:	99                   	cltd   
c0009da0:	f7 7d 0c             	idivl  0xc(%ebp)
c0009da3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009da6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009daa:	74 14                	je     c0009dc0 <i2a+0x35>
c0009dac:	83 ec 04             	sub    $0x4,%esp
c0009daf:	ff 75 10             	pushl  0x10(%ebp)
c0009db2:	ff 75 0c             	pushl  0xc(%ebp)
c0009db5:	ff 75 f0             	pushl  -0x10(%ebp)
c0009db8:	e8 ce ff ff ff       	call   c0009d8b <i2a>
c0009dbd:	83 c4 10             	add    $0x10,%esp
c0009dc0:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009dc4:	7f 0a                	jg     c0009dd0 <i2a+0x45>
c0009dc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dc9:	83 c0 30             	add    $0x30,%eax
c0009dcc:	89 c3                	mov    %eax,%ebx
c0009dce:	eb 08                	jmp    c0009dd8 <i2a+0x4d>
c0009dd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dd3:	83 c0 37             	add    $0x37,%eax
c0009dd6:	89 c3                	mov    %eax,%ebx
c0009dd8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ddb:	8b 00                	mov    (%eax),%eax
c0009ddd:	8d 48 01             	lea    0x1(%eax),%ecx
c0009de0:	8b 55 10             	mov    0x10(%ebp),%edx
c0009de3:	89 0a                	mov    %ecx,(%edx)
c0009de5:	88 18                	mov    %bl,(%eax)
c0009de7:	8b 45 10             	mov    0x10(%ebp),%eax
c0009dea:	8b 00                	mov    (%eax),%eax
c0009dec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009def:	c9                   	leave  
c0009df0:	c3                   	ret    

c0009df1 <inform_int>:
c0009df1:	55                   	push   %ebp
c0009df2:	89 e5                	mov    %esp,%ebp
c0009df4:	83 ec 18             	sub    $0x18,%esp
c0009df7:	83 ec 0c             	sub    $0xc,%esp
c0009dfa:	ff 75 08             	pushl  0x8(%ebp)
c0009dfd:	e8 39 ac ff ff       	call   c0004a3b <pid2proc>
c0009e02:	83 c4 10             	add    $0x10,%esp
c0009e05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009e08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e0b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e12:	0f be c0             	movsbl %al,%eax
c0009e15:	83 e0 02             	and    $0x2,%eax
c0009e18:	85 c0                	test   %eax,%eax
c0009e1a:	0f 84 8e 00 00 00    	je     c0009eae <inform_int+0xbd>
c0009e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e23:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e29:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009e2e:	74 0e                	je     c0009e3e <inform_int+0x4d>
c0009e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e33:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e39:	83 f8 12             	cmp    $0x12,%eax
c0009e3c:	75 7d                	jne    c0009ebb <inform_int+0xca>
c0009e3e:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c0009e45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e48:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009e4e:	83 ec 08             	sub    $0x8,%esp
c0009e51:	ff 75 f0             	pushl  -0x10(%ebp)
c0009e54:	50                   	push   %eax
c0009e55:	e8 5f cf ff ff       	call   c0006db9 <alloc_virtual_memory>
c0009e5a:	83 c4 10             	add    $0x10,%esp
c0009e5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009e60:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e63:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009e69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e6c:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009e73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e76:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009e7d:	00 00 00 
c0009e80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e83:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009e8a:	00 00 00 
c0009e8d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009e94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e97:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009e9e:	83 ec 0c             	sub    $0xc,%esp
c0009ea1:	ff 75 f4             	pushl  -0xc(%ebp)
c0009ea4:	e8 d6 fd ff ff       	call   c0009c7f <unblock>
c0009ea9:	83 c4 10             	add    $0x10,%esp
c0009eac:	eb 0d                	jmp    c0009ebb <inform_int+0xca>
c0009eae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009eb1:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c0009eb8:	00 00 00 
c0009ebb:	90                   	nop
c0009ebc:	c9                   	leave  
c0009ebd:	c3                   	ret    

c0009ebe <strcmp>:
c0009ebe:	55                   	push   %ebp
c0009ebf:	89 e5                	mov    %esp,%ebp
c0009ec1:	83 ec 10             	sub    $0x10,%esp
c0009ec4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009ec8:	74 06                	je     c0009ed0 <strcmp+0x12>
c0009eca:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009ece:	75 08                	jne    c0009ed8 <strcmp+0x1a>
c0009ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ed3:	2b 45 0c             	sub    0xc(%ebp),%eax
c0009ed6:	eb 53                	jmp    c0009f2b <strcmp+0x6d>
c0009ed8:	8b 45 08             	mov    0x8(%ebp),%eax
c0009edb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009ede:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009ee1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009ee4:	eb 18                	jmp    c0009efe <strcmp+0x40>
c0009ee6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009ee9:	0f b6 10             	movzbl (%eax),%edx
c0009eec:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009eef:	0f b6 00             	movzbl (%eax),%eax
c0009ef2:	38 c2                	cmp    %al,%dl
c0009ef4:	75 1e                	jne    c0009f14 <strcmp+0x56>
c0009ef6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009efa:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009efe:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009f01:	0f b6 00             	movzbl (%eax),%eax
c0009f04:	84 c0                	test   %al,%al
c0009f06:	74 0d                	je     c0009f15 <strcmp+0x57>
c0009f08:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009f0b:	0f b6 00             	movzbl (%eax),%eax
c0009f0e:	84 c0                	test   %al,%al
c0009f10:	75 d4                	jne    c0009ee6 <strcmp+0x28>
c0009f12:	eb 01                	jmp    c0009f15 <strcmp+0x57>
c0009f14:	90                   	nop
c0009f15:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009f18:	0f b6 00             	movzbl (%eax),%eax
c0009f1b:	0f be d0             	movsbl %al,%edx
c0009f1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009f21:	0f b6 00             	movzbl (%eax),%eax
c0009f24:	0f be c0             	movsbl %al,%eax
c0009f27:	29 c2                	sub    %eax,%edx
c0009f29:	89 d0                	mov    %edx,%eax
c0009f2b:	c9                   	leave  
c0009f2c:	c3                   	ret    

c0009f2d <create_user_process_address_space>:
c0009f2d:	55                   	push   %ebp
c0009f2e:	89 e5                	mov    %esp,%ebp
c0009f30:	83 ec 18             	sub    $0x18,%esp
c0009f33:	83 ec 08             	sub    $0x8,%esp
c0009f36:	6a 00                	push   $0x0
c0009f38:	6a 01                	push   $0x1
c0009f3a:	e8 19 cf ff ff       	call   c0006e58 <alloc_memory>
c0009f3f:	83 c4 10             	add    $0x10,%esp
c0009f42:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009f45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f48:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0009f4f:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009f56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f59:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009f5e:	c1 e8 0c             	shr    $0xc,%eax
c0009f61:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009f64:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f67:	83 c0 07             	add    $0x7,%eax
c0009f6a:	c1 e8 03             	shr    $0x3,%eax
c0009f6d:	89 c2                	mov    %eax,%edx
c0009f6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f72:	89 50 04             	mov    %edx,0x4(%eax)
c0009f75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f78:	8b 40 04             	mov    0x4(%eax),%eax
c0009f7b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009f80:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009f86:	85 c0                	test   %eax,%eax
c0009f88:	0f 48 c2             	cmovs  %edx,%eax
c0009f8b:	c1 f8 0c             	sar    $0xc,%eax
c0009f8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009f91:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009f94:	83 ec 08             	sub    $0x8,%esp
c0009f97:	6a 00                	push   $0x0
c0009f99:	50                   	push   %eax
c0009f9a:	e8 b9 ce ff ff       	call   c0006e58 <alloc_memory>
c0009f9f:	83 c4 10             	add    $0x10,%esp
c0009fa2:	89 c2                	mov    %eax,%edx
c0009fa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fa7:	89 10                	mov    %edx,(%eax)
c0009fa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fac:	83 ec 0c             	sub    $0xc,%esp
c0009faf:	50                   	push   %eax
c0009fb0:	e8 a1 c9 ff ff       	call   c0006956 <init_bitmap>
c0009fb5:	83 c4 10             	add    $0x10,%esp
c0009fb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fbb:	c9                   	leave  
c0009fbc:	c3                   	ret    

c0009fbd <user_process>:
c0009fbd:	55                   	push   %ebp
c0009fbe:	89 e5                	mov    %esp,%ebp
c0009fc0:	83 ec 28             	sub    $0x28,%esp
c0009fc3:	e8 de 78 ff ff       	call   c00018a6 <get_running_thread_pcb>
c0009fc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009fcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fce:	05 00 10 00 00       	add    $0x1000,%eax
c0009fd3:	89 c2                	mov    %eax,%edx
c0009fd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fd8:	89 10                	mov    %edx,(%eax)
c0009fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fdd:	8b 00                	mov    (%eax),%eax
c0009fdf:	83 e8 44             	sub    $0x44,%eax
c0009fe2:	89 c2                	mov    %eax,%edx
c0009fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fe7:	89 10                	mov    %edx,(%eax)
c0009fe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fec:	8b 00                	mov    (%eax),%eax
c0009fee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ff1:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009ff5:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c0009ffb:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c000a001:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c000a007:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a00b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c000a00f:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a013:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c000a017:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000a01b:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c000a01f:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c000a025:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c000a029:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a02c:	89 50 34             	mov    %edx,0x34(%eax)
c000a02f:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c000a033:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a036:	89 50 0c             	mov    %edx,0xc(%eax)
c000a039:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c000a03d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a040:	89 50 04             	mov    %edx,0x4(%eax)
c000a043:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c000a047:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a04a:	89 50 08             	mov    %edx,0x8(%eax)
c000a04d:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c000a051:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a054:	89 50 40             	mov    %edx,0x40(%eax)
c000a057:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c000a05b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a05e:	89 10                	mov    %edx,(%eax)
c000a060:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a063:	8b 55 08             	mov    0x8(%ebp),%edx
c000a066:	89 50 30             	mov    %edx,0x30(%eax)
c000a069:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c000a06d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a070:	89 50 38             	mov    %edx,0x38(%eax)
c000a073:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a076:	c7 40 3c 00 00 f0 bf 	movl   $0xbff00000,0x3c(%eax)
c000a07d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a080:	83 ec 0c             	sub    $0xc,%esp
c000a083:	50                   	push   %eax
c000a084:	e8 f0 76 ff ff       	call   c0001779 <restart>
c000a089:	83 c4 10             	add    $0x10,%esp
c000a08c:	90                   	nop
c000a08d:	c9                   	leave  
c000a08e:	c3                   	ret    

c000a08f <clone_pcb>:
c000a08f:	55                   	push   %ebp
c000a090:	89 e5                	mov    %esp,%ebp
c000a092:	83 ec 18             	sub    $0x18,%esp
c000a095:	83 ec 08             	sub    $0x8,%esp
c000a098:	6a 00                	push   $0x0
c000a09a:	6a 01                	push   $0x1
c000a09c:	e8 b7 cd ff ff       	call   c0006e58 <alloc_memory>
c000a0a1:	83 c4 10             	add    $0x10,%esp
c000a0a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a0a7:	83 ec 04             	sub    $0x4,%esp
c000a0aa:	68 00 10 00 00       	push   $0x1000
c000a0af:	6a 00                	push   $0x0
c000a0b1:	ff 75 f4             	pushl  -0xc(%ebp)
c000a0b4:	e8 a5 14 00 00       	call   c000b55e <Memset>
c000a0b9:	83 c4 10             	add    $0x10,%esp
c000a0bc:	83 ec 04             	sub    $0x4,%esp
c000a0bf:	68 00 10 00 00       	push   $0x1000
c000a0c4:	ff 75 08             	pushl  0x8(%ebp)
c000a0c7:	ff 75 f4             	pushl  -0xc(%ebp)
c000a0ca:	e8 61 14 00 00       	call   c000b530 <Memcpy>
c000a0cf:	83 c4 10             	add    $0x10,%esp
c000a0d2:	a1 70 f7 00 c0       	mov    0xc000f770,%eax
c000a0d7:	83 c0 01             	add    $0x1,%eax
c000a0da:	a3 70 f7 00 c0       	mov    %eax,0xc000f770
c000a0df:	8b 15 70 f7 00 c0    	mov    0xc000f770,%edx
c000a0e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0e8:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a0ee:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0f1:	8b 90 64 02 00 00    	mov    0x264(%eax),%edx
c000a0f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0fa:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a100:	83 ec 08             	sub    $0x8,%esp
c000a103:	6a 00                	push   $0x0
c000a105:	6a 01                	push   $0x1
c000a107:	e8 4c cd ff ff       	call   c0006e58 <alloc_memory>
c000a10c:	83 c4 10             	add    $0x10,%esp
c000a10f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a112:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a115:	05 00 0c 00 00       	add    $0xc00,%eax
c000a11a:	83 ec 04             	sub    $0x4,%esp
c000a11d:	68 00 04 00 00       	push   $0x400
c000a122:	68 00 fc ff ff       	push   $0xfffffc00
c000a127:	50                   	push   %eax
c000a128:	e8 03 14 00 00       	call   c000b530 <Memcpy>
c000a12d:	83 c4 10             	add    $0x10,%esp
c000a130:	83 ec 0c             	sub    $0xc,%esp
c000a133:	ff 75 f0             	pushl  -0x10(%ebp)
c000a136:	e8 eb cc ff ff       	call   c0006e26 <get_physical_address>
c000a13b:	83 c4 10             	add    $0x10,%esp
c000a13e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a141:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a144:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a149:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a14c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a14f:	83 c8 07             	or     $0x7,%eax
c000a152:	89 c2                	mov    %eax,%edx
c000a154:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a157:	89 10                	mov    %edx,(%eax)
c000a159:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a15c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a15f:	89 50 08             	mov    %edx,0x8(%eax)
c000a162:	e8 c6 fd ff ff       	call   c0009f2d <create_user_process_address_space>
c000a167:	89 c2                	mov    %eax,%edx
c000a169:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a16c:	89 50 0c             	mov    %edx,0xc(%eax)
c000a16f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a172:	8b 40 0c             	mov    0xc(%eax),%eax
c000a175:	89 c2                	mov    %eax,%edx
c000a177:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a17a:	8b 40 0c             	mov    0xc(%eax),%eax
c000a17d:	83 ec 04             	sub    $0x4,%esp
c000a180:	6a 0c                	push   $0xc
c000a182:	52                   	push   %edx
c000a183:	50                   	push   %eax
c000a184:	e8 a7 13 00 00       	call   c000b530 <Memcpy>
c000a189:	83 c4 10             	add    $0x10,%esp
c000a18c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a18f:	c9                   	leave  
c000a190:	c3                   	ret    

c000a191 <build_body_stack>:
c000a191:	55                   	push   %ebp
c000a192:	89 e5                	mov    %esp,%ebp
c000a194:	83 ec 38             	sub    $0x38,%esp
c000a197:	8b 45 08             	mov    0x8(%ebp),%eax
c000a19a:	8b 40 0c             	mov    0xc(%eax),%eax
c000a19d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a1a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a1a3:	8b 50 04             	mov    0x4(%eax),%edx
c000a1a6:	8b 00                	mov    (%eax),%eax
c000a1a8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a1ab:	89 55 cc             	mov    %edx,-0x34(%ebp)
c000a1ae:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a1b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a1b4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a1b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a1ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a1bd:	8b 40 08             	mov    0x8(%eax),%eax
c000a1c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a1c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a1ca:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a1d1:	e8 f2 75 ff ff       	call   c00017c8 <disable_int>
c000a1d6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a1dd:	e9 dd 00 00 00       	jmp    c000a2bf <build_body_stack+0x12e>
c000a1e2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a1e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a1e8:	01 d0                	add    %edx,%eax
c000a1ea:	0f b6 00             	movzbl (%eax),%eax
c000a1ed:	88 45 d7             	mov    %al,-0x29(%ebp)
c000a1f0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a1f7:	e9 b5 00 00 00       	jmp    c000a2b1 <build_body_stack+0x120>
c000a1fc:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c000a200:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a203:	89 c1                	mov    %eax,%ecx
c000a205:	d3 fa                	sar    %cl,%edx
c000a207:	89 d0                	mov    %edx,%eax
c000a209:	83 e0 01             	and    $0x1,%eax
c000a20c:	85 c0                	test   %eax,%eax
c000a20e:	75 09                	jne    c000a219 <build_body_stack+0x88>
c000a210:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a214:	e9 94 00 00 00       	jmp    c000a2ad <build_body_stack+0x11c>
c000a219:	8b 45 08             	mov    0x8(%ebp),%eax
c000a21c:	8b 40 08             	mov    0x8(%eax),%eax
c000a21f:	83 ec 0c             	sub    $0xc,%esp
c000a222:	50                   	push   %eax
c000a223:	e8 60 76 ff ff       	call   c0001888 <update_cr3>
c000a228:	83 c4 10             	add    $0x10,%esp
c000a22b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a22e:	c1 e0 0c             	shl    $0xc,%eax
c000a231:	89 c2                	mov    %eax,%edx
c000a233:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a236:	01 d0                	add    %edx,%eax
c000a238:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a23b:	81 7d d0 00 60 05 08 	cmpl   $0x8056000,-0x30(%ebp)
c000a242:	75 0f                	jne    c000a253 <build_body_stack+0xc2>
c000a244:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a247:	83 ec 0c             	sub    $0xc,%esp
c000a24a:	50                   	push   %eax
c000a24b:	e8 82 d8 ff ff       	call   c0007ad2 <disp_int>
c000a250:	83 c4 10             	add    $0x10,%esp
c000a253:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000a256:	8b 45 10             	mov    0x10(%ebp),%eax
c000a259:	83 ec 04             	sub    $0x4,%esp
c000a25c:	68 00 10 00 00       	push   $0x1000
c000a261:	52                   	push   %edx
c000a262:	50                   	push   %eax
c000a263:	e8 c8 12 00 00       	call   c000b530 <Memcpy>
c000a268:	83 c4 10             	add    $0x10,%esp
c000a26b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a26e:	8b 40 08             	mov    0x8(%eax),%eax
c000a271:	83 ec 0c             	sub    $0xc,%esp
c000a274:	50                   	push   %eax
c000a275:	e8 0e 76 ff ff       	call   c0001888 <update_cr3>
c000a27a:	83 c4 10             	add    $0x10,%esp
c000a27d:	83 ec 08             	sub    $0x8,%esp
c000a280:	ff 75 d0             	pushl  -0x30(%ebp)
c000a283:	6a 01                	push   $0x1
c000a285:	e8 30 cc ff ff       	call   c0006eba <get_a_virtual_page>
c000a28a:	83 c4 10             	add    $0x10,%esp
c000a28d:	8b 55 10             	mov    0x10(%ebp),%edx
c000a290:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a293:	83 ec 04             	sub    $0x4,%esp
c000a296:	68 00 10 00 00       	push   $0x1000
c000a29b:	52                   	push   %edx
c000a29c:	50                   	push   %eax
c000a29d:	e8 8e 12 00 00       	call   c000b530 <Memcpy>
c000a2a2:	83 c4 10             	add    $0x10,%esp
c000a2a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a2a9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a2ad:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a2b1:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a2b5:	0f 8e 41 ff ff ff    	jle    c000a1fc <build_body_stack+0x6b>
c000a2bb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a2bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2c2:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a2c5:	0f 87 17 ff ff ff    	ja     c000a1e2 <build_body_stack+0x51>
c000a2cb:	83 ec 0c             	sub    $0xc,%esp
c000a2ce:	68 29 b5 00 c0       	push   $0xc000b529
c000a2d3:	e8 b4 72 ff ff       	call   c000158c <disp_str>
c000a2d8:	83 c4 10             	add    $0x10,%esp
c000a2db:	83 ec 0c             	sub    $0xc,%esp
c000a2de:	ff 75 f0             	pushl  -0x10(%ebp)
c000a2e1:	e8 ec d7 ff ff       	call   c0007ad2 <disp_int>
c000a2e6:	83 c4 10             	add    $0x10,%esp
c000a2e9:	83 ec 0c             	sub    $0xc,%esp
c000a2ec:	68 2e b5 00 c0       	push   $0xc000b52e
c000a2f1:	e8 96 72 ff ff       	call   c000158c <disp_str>
c000a2f6:	83 c4 10             	add    $0x10,%esp
c000a2f9:	e8 cc 74 ff ff       	call   c00017ca <enable_int>
c000a2fe:	90                   	nop
c000a2ff:	c9                   	leave  
c000a300:	c3                   	ret    

c000a301 <build_process_kernel_stack>:
c000a301:	55                   	push   %ebp
c000a302:	89 e5                	mov    %esp,%ebp
c000a304:	83 ec 20             	sub    $0x20,%esp
c000a307:	8b 45 08             	mov    0x8(%ebp),%eax
c000a30a:	05 00 10 00 00       	add    $0x1000,%eax
c000a30f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a312:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a315:	8b 00                	mov    (%eax),%eax
c000a317:	83 f8 38             	cmp    $0x38,%eax
c000a31a:	74 06                	je     c000a322 <build_process_kernel_stack+0x21>
c000a31c:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
c000a320:	eb f0                	jmp    c000a312 <build_process_kernel_stack+0x11>
c000a322:	90                   	nop
c000a323:	8b 45 08             	mov    0x8(%ebp),%eax
c000a326:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a329:	89 50 04             	mov    %edx,0x4(%eax)
c000a32c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a32f:	83 c0 2c             	add    $0x2c,%eax
c000a332:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a335:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a338:	83 e8 04             	sub    $0x4,%eax
c000a33b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a33e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a341:	83 e8 08             	sub    $0x8,%eax
c000a344:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a347:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a34a:	83 e8 0c             	sub    $0xc,%eax
c000a34d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a350:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a353:	83 e8 10             	sub    $0x10,%eax
c000a356:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a359:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a35c:	83 e8 14             	sub    $0x14,%eax
c000a35f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a362:	ba 5a 17 00 c0       	mov    $0xc000175a,%edx
c000a367:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a36a:	89 10                	mov    %edx,(%eax)
c000a36c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a36f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a375:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a378:	8b 10                	mov    (%eax),%edx
c000a37a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a37d:	89 10                	mov    %edx,(%eax)
c000a37f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a382:	8b 10                	mov    (%eax),%edx
c000a384:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a387:	89 10                	mov    %edx,(%eax)
c000a389:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a38c:	8b 10                	mov    (%eax),%edx
c000a38e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a391:	89 10                	mov    %edx,(%eax)
c000a393:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a396:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a39c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a39f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000a3a2:	89 10                	mov    %edx,(%eax)
c000a3a4:	90                   	nop
c000a3a5:	c9                   	leave  
c000a3a6:	c3                   	ret    

c000a3a7 <fork_process>:
c000a3a7:	55                   	push   %ebp
c000a3a8:	89 e5                	mov    %esp,%ebp
c000a3aa:	83 ec 18             	sub    $0x18,%esp
c000a3ad:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3b0:	83 ec 0c             	sub    $0xc,%esp
c000a3b3:	50                   	push   %eax
c000a3b4:	e8 82 a6 ff ff       	call   c0004a3b <pid2proc>
c000a3b9:	83 c4 10             	add    $0x10,%esp
c000a3bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a3bf:	83 ec 0c             	sub    $0xc,%esp
c000a3c2:	ff 75 f4             	pushl  -0xc(%ebp)
c000a3c5:	e8 c5 fc ff ff       	call   c000a08f <clone_pcb>
c000a3ca:	83 c4 10             	add    $0x10,%esp
c000a3cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a3d0:	83 ec 08             	sub    $0x8,%esp
c000a3d3:	6a 00                	push   $0x0
c000a3d5:	6a 01                	push   $0x1
c000a3d7:	e8 7c ca ff ff       	call   c0006e58 <alloc_memory>
c000a3dc:	83 c4 10             	add    $0x10,%esp
c000a3df:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a3e2:	83 ec 04             	sub    $0x4,%esp
c000a3e5:	ff 75 ec             	pushl  -0x14(%ebp)
c000a3e8:	ff 75 f0             	pushl  -0x10(%ebp)
c000a3eb:	ff 75 f4             	pushl  -0xc(%ebp)
c000a3ee:	e8 9e fd ff ff       	call   c000a191 <build_body_stack>
c000a3f3:	83 c4 10             	add    $0x10,%esp
c000a3f6:	83 ec 0c             	sub    $0xc,%esp
c000a3f9:	ff 75 f0             	pushl  -0x10(%ebp)
c000a3fc:	e8 00 ff ff ff       	call   c000a301 <build_process_kernel_stack>
c000a401:	83 c4 10             	add    $0x10,%esp
c000a404:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a407:	05 00 01 00 00       	add    $0x100,%eax
c000a40c:	83 ec 04             	sub    $0x4,%esp
c000a40f:	6a 08                	push   $0x8
c000a411:	6a 00                	push   $0x0
c000a413:	50                   	push   %eax
c000a414:	e8 45 11 00 00       	call   c000b55e <Memset>
c000a419:	83 c4 10             	add    $0x10,%esp
c000a41c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a41f:	05 08 01 00 00       	add    $0x108,%eax
c000a424:	83 ec 04             	sub    $0x4,%esp
c000a427:	6a 08                	push   $0x8
c000a429:	6a 00                	push   $0x0
c000a42b:	50                   	push   %eax
c000a42c:	e8 2d 11 00 00       	call   c000b55e <Memset>
c000a431:	83 c4 10             	add    $0x10,%esp
c000a434:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a437:	05 08 01 00 00       	add    $0x108,%eax
c000a43c:	83 ec 08             	sub    $0x8,%esp
c000a43f:	50                   	push   %eax
c000a440:	68 18 1f 01 c0       	push   $0xc0011f18
c000a445:	e8 2e 02 00 00       	call   c000a678 <appendToDoubleLinkList>
c000a44a:	83 c4 10             	add    $0x10,%esp
c000a44d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a450:	c9                   	leave  
c000a451:	c3                   	ret    

c000a452 <process_execute>:
c000a452:	55                   	push   %ebp
c000a453:	89 e5                	mov    %esp,%ebp
c000a455:	83 ec 28             	sub    $0x28,%esp
c000a458:	e8 36 03 00 00       	call   c000a793 <thread_init>
c000a45d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a460:	83 ec 0c             	sub    $0xc,%esp
c000a463:	ff 75 f4             	pushl  -0xc(%ebp)
c000a466:	e8 8f 03 00 00       	call   c000a7fa <thread_create>
c000a46b:	83 c4 10             	add    $0x10,%esp
c000a46e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a471:	05 34 01 00 00       	add    $0x134,%eax
c000a476:	83 ec 08             	sub    $0x8,%esp
c000a479:	ff 75 10             	pushl  0x10(%ebp)
c000a47c:	50                   	push   %eax
c000a47d:	e8 fb 10 00 00       	call   c000b57d <Strcpy>
c000a482:	83 c4 10             	add    $0x10,%esp
c000a485:	83 ec 08             	sub    $0x8,%esp
c000a488:	6a 00                	push   $0x0
c000a48a:	6a 01                	push   $0x1
c000a48c:	e8 c7 c9 ff ff       	call   c0006e58 <alloc_memory>
c000a491:	83 c4 10             	add    $0x10,%esp
c000a494:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a497:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a49a:	05 00 0c 00 00       	add    $0xc00,%eax
c000a49f:	83 ec 04             	sub    $0x4,%esp
c000a4a2:	68 00 04 00 00       	push   $0x400
c000a4a7:	68 00 fc ff ff       	push   $0xfffffc00
c000a4ac:	50                   	push   %eax
c000a4ad:	e8 7e 10 00 00       	call   c000b530 <Memcpy>
c000a4b2:	83 c4 10             	add    $0x10,%esp
c000a4b5:	83 ec 0c             	sub    $0xc,%esp
c000a4b8:	ff 75 f0             	pushl  -0x10(%ebp)
c000a4bb:	e8 66 c9 ff ff       	call   c0006e26 <get_physical_address>
c000a4c0:	83 c4 10             	add    $0x10,%esp
c000a4c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a4c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a4c9:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a4ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a4d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a4d4:	83 c8 07             	or     $0x7,%eax
c000a4d7:	89 c2                	mov    %eax,%edx
c000a4d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a4dc:	89 10                	mov    %edx,(%eax)
c000a4de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4e1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a4e4:	89 50 08             	mov    %edx,0x8(%eax)
c000a4e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4ea:	83 c0 10             	add    $0x10,%eax
c000a4ed:	83 ec 0c             	sub    $0xc,%esp
c000a4f0:	50                   	push   %eax
c000a4f1:	e8 b2 ce ff ff       	call   c00073a8 <init_memory_block_desc>
c000a4f6:	83 c4 10             	add    $0x10,%esp
c000a4f9:	e8 2f fa ff ff       	call   c0009f2d <create_user_process_address_space>
c000a4fe:	89 c2                	mov    %eax,%edx
c000a500:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a503:	89 50 0c             	mov    %edx,0xc(%eax)
c000a506:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a509:	8b 00                	mov    (%eax),%eax
c000a50b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a50e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a511:	c7 40 10 bd 9f 00 c0 	movl   $0xc0009fbd,0x10(%eax)
c000a518:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a51b:	8b 55 08             	mov    0x8(%ebp),%edx
c000a51e:	89 50 18             	mov    %edx,0x18(%eax)
c000a521:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a524:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a527:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a52a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a52d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a530:	89 50 20             	mov    %edx,0x20(%eax)
c000a533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a536:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a53c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a53f:	8b 10                	mov    (%eax),%edx
c000a541:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a544:	89 50 04             	mov    %edx,0x4(%eax)
c000a547:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a54a:	8b 50 04             	mov    0x4(%eax),%edx
c000a54d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a550:	89 50 08             	mov    %edx,0x8(%eax)
c000a553:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a556:	8b 50 08             	mov    0x8(%eax),%edx
c000a559:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a55c:	89 50 0c             	mov    %edx,0xc(%eax)
c000a55f:	83 ec 0c             	sub    $0xc,%esp
c000a562:	68 cc fd 00 c0       	push   $0xc000fdcc
c000a567:	e8 87 00 00 00       	call   c000a5f3 <isListEmpty>
c000a56c:	83 c4 10             	add    $0x10,%esp
c000a56f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a572:	05 00 01 00 00       	add    $0x100,%eax
c000a577:	83 ec 08             	sub    $0x8,%esp
c000a57a:	50                   	push   %eax
c000a57b:	68 cc fd 00 c0       	push   $0xc000fdcc
c000a580:	e8 f3 00 00 00       	call   c000a678 <appendToDoubleLinkList>
c000a585:	83 c4 10             	add    $0x10,%esp
c000a588:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a58b:	05 08 01 00 00       	add    $0x108,%eax
c000a590:	83 ec 08             	sub    $0x8,%esp
c000a593:	50                   	push   %eax
c000a594:	68 18 1f 01 c0       	push   $0xc0011f18
c000a599:	e8 da 00 00 00       	call   c000a678 <appendToDoubleLinkList>
c000a59e:	83 c4 10             	add    $0x10,%esp
c000a5a1:	90                   	nop
c000a5a2:	c9                   	leave  
c000a5a3:	c3                   	ret    
c000a5a4:	66 90                	xchg   %ax,%ax
c000a5a6:	66 90                	xchg   %ax,%ax
c000a5a8:	66 90                	xchg   %ax,%ax
c000a5aa:	66 90                	xchg   %ax,%ax
c000a5ac:	66 90                	xchg   %ax,%ax
c000a5ae:	66 90                	xchg   %ax,%ax

c000a5b0 <switch_to>:
c000a5b0:	56                   	push   %esi
c000a5b1:	57                   	push   %edi
c000a5b2:	53                   	push   %ebx
c000a5b3:	55                   	push   %ebp
c000a5b4:	89 e5                	mov    %esp,%ebp
c000a5b6:	8b 45 14             	mov    0x14(%ebp),%eax
c000a5b9:	89 20                	mov    %esp,(%eax)
c000a5bb:	8b 45 18             	mov    0x18(%ebp),%eax
c000a5be:	8b 20                	mov    (%eax),%esp
c000a5c0:	5d                   	pop    %ebp
c000a5c1:	5b                   	pop    %ebx
c000a5c2:	5f                   	pop    %edi
c000a5c3:	5e                   	pop    %esi
c000a5c4:	c3                   	ret    

c000a5c5 <initDoubleLinkList>:
c000a5c5:	55                   	push   %ebp
c000a5c6:	89 e5                	mov    %esp,%ebp
c000a5c8:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a5d1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5d4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a5db:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5de:	8d 50 08             	lea    0x8(%eax),%edx
c000a5e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5e4:	89 50 04             	mov    %edx,0x4(%eax)
c000a5e7:	8b 55 08             	mov    0x8(%ebp),%edx
c000a5ea:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5ed:	89 50 08             	mov    %edx,0x8(%eax)
c000a5f0:	90                   	nop
c000a5f1:	5d                   	pop    %ebp
c000a5f2:	c3                   	ret    

c000a5f3 <isListEmpty>:
c000a5f3:	55                   	push   %ebp
c000a5f4:	89 e5                	mov    %esp,%ebp
c000a5f6:	83 ec 18             	sub    $0x18,%esp
c000a5f9:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5fc:	83 c0 04             	add    $0x4,%eax
c000a5ff:	83 ec 04             	sub    $0x4,%esp
c000a602:	6a 04                	push   $0x4
c000a604:	50                   	push   %eax
c000a605:	8d 45 f4             	lea    -0xc(%ebp),%eax
c000a608:	50                   	push   %eax
c000a609:	e8 22 0f 00 00       	call   c000b530 <Memcpy>
c000a60e:	83 c4 10             	add    $0x10,%esp
c000a611:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a614:	83 f8 0c             	cmp    $0xc,%eax
c000a617:	75 03                	jne    c000a61c <isListEmpty+0x29>
c000a619:	66 87 db             	xchg   %bx,%bx
c000a61c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a61f:	8b 40 04             	mov    0x4(%eax),%eax
c000a622:	8b 55 08             	mov    0x8(%ebp),%edx
c000a625:	83 c2 08             	add    $0x8,%edx
c000a628:	39 d0                	cmp    %edx,%eax
c000a62a:	75 07                	jne    c000a633 <isListEmpty+0x40>
c000a62c:	b8 01 00 00 00       	mov    $0x1,%eax
c000a631:	eb 05                	jmp    c000a638 <isListEmpty+0x45>
c000a633:	b8 00 00 00 00       	mov    $0x0,%eax
c000a638:	c9                   	leave  
c000a639:	c3                   	ret    

c000a63a <findElementInList>:
c000a63a:	55                   	push   %ebp
c000a63b:	89 e5                	mov    %esp,%ebp
c000a63d:	83 ec 10             	sub    $0x10,%esp
c000a640:	8b 45 08             	mov    0x8(%ebp),%eax
c000a643:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a646:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a649:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a64c:	eb 18                	jmp    c000a666 <findElementInList+0x2c>
c000a64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a651:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c000a654:	75 07                	jne    c000a65d <findElementInList+0x23>
c000a656:	b8 01 00 00 00       	mov    $0x1,%eax
c000a65b:	eb 19                	jmp    c000a676 <findElementInList+0x3c>
c000a65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a660:	8b 40 04             	mov    0x4(%eax),%eax
c000a663:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a666:	8b 45 08             	mov    0x8(%ebp),%eax
c000a669:	83 c0 08             	add    $0x8,%eax
c000a66c:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c000a66f:	75 dd                	jne    c000a64e <findElementInList+0x14>
c000a671:	b8 00 00 00 00       	mov    $0x0,%eax
c000a676:	c9                   	leave  
c000a677:	c3                   	ret    

c000a678 <appendToDoubleLinkList>:
c000a678:	55                   	push   %ebp
c000a679:	89 e5                	mov    %esp,%ebp
c000a67b:	83 ec 10             	sub    $0x10,%esp
c000a67e:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a681:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a684:	8b 45 08             	mov    0x8(%ebp),%eax
c000a687:	8b 50 08             	mov    0x8(%eax),%edx
c000a68a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a68d:	89 10                	mov    %edx,(%eax)
c000a68f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a692:	8b 40 08             	mov    0x8(%eax),%eax
c000a695:	85 c0                	test   %eax,%eax
c000a697:	74 0c                	je     c000a6a5 <appendToDoubleLinkList+0x2d>
c000a699:	8b 45 08             	mov    0x8(%ebp),%eax
c000a69c:	8b 40 08             	mov    0x8(%eax),%eax
c000a69f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a6a2:	89 50 04             	mov    %edx,0x4(%eax)
c000a6a5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6a8:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a6ab:	89 50 08             	mov    %edx,0x8(%eax)
c000a6ae:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6b1:	8d 50 08             	lea    0x8(%eax),%edx
c000a6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a6b7:	89 50 04             	mov    %edx,0x4(%eax)
c000a6ba:	90                   	nop
c000a6bb:	c9                   	leave  
c000a6bc:	c3                   	ret    

c000a6bd <insertToDoubleLinkList>:
c000a6bd:	55                   	push   %ebp
c000a6be:	89 e5                	mov    %esp,%ebp
c000a6c0:	83 ec 10             	sub    $0x10,%esp
c000a6c3:	ff 75 0c             	pushl  0xc(%ebp)
c000a6c6:	ff 75 08             	pushl  0x8(%ebp)
c000a6c9:	e8 6c ff ff ff       	call   c000a63a <findElementInList>
c000a6ce:	83 c4 08             	add    $0x8,%esp
c000a6d1:	3c 01                	cmp    $0x1,%al
c000a6d3:	74 3a                	je     c000a70f <insertToDoubleLinkList+0x52>
c000a6d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a6d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a6db:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6de:	8b 50 04             	mov    0x4(%eax),%edx
c000a6e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a6e4:	89 50 04             	mov    %edx,0x4(%eax)
c000a6e7:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6ea:	8b 40 04             	mov    0x4(%eax),%eax
c000a6ed:	85 c0                	test   %eax,%eax
c000a6ef:	74 0b                	je     c000a6fc <insertToDoubleLinkList+0x3f>
c000a6f1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6f4:	8b 40 04             	mov    0x4(%eax),%eax
c000a6f7:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a6fa:	89 10                	mov    %edx,(%eax)
c000a6fc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6ff:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a702:	89 50 04             	mov    %edx,0x4(%eax)
c000a705:	8b 55 08             	mov    0x8(%ebp),%edx
c000a708:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a70b:	89 10                	mov    %edx,(%eax)
c000a70d:	eb 01                	jmp    c000a710 <insertToDoubleLinkList+0x53>
c000a70f:	90                   	nop
c000a710:	c9                   	leave  
c000a711:	c3                   	ret    

c000a712 <popFromDoubleLinkList>:
c000a712:	55                   	push   %ebp
c000a713:	89 e5                	mov    %esp,%ebp
c000a715:	83 ec 18             	sub    $0x18,%esp
c000a718:	83 ec 0c             	sub    $0xc,%esp
c000a71b:	ff 75 08             	pushl  0x8(%ebp)
c000a71e:	e8 d0 fe ff ff       	call   c000a5f3 <isListEmpty>
c000a723:	83 c4 10             	add    $0x10,%esp
c000a726:	3c 01                	cmp    $0x1,%al
c000a728:	75 07                	jne    c000a731 <popFromDoubleLinkList+0x1f>
c000a72a:	b8 00 00 00 00       	mov    $0x0,%eax
c000a72f:	eb 48                	jmp    c000a779 <popFromDoubleLinkList+0x67>
c000a731:	8b 45 08             	mov    0x8(%ebp),%eax
c000a734:	8b 40 08             	mov    0x8(%eax),%eax
c000a737:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a73a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a73d:	8b 40 08             	mov    0x8(%eax),%eax
c000a740:	85 c0                	test   %eax,%eax
c000a742:	75 07                	jne    c000a74b <popFromDoubleLinkList+0x39>
c000a744:	b8 00 00 00 00       	mov    $0x0,%eax
c000a749:	eb 2e                	jmp    c000a779 <popFromDoubleLinkList+0x67>
c000a74b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a74e:	8b 40 08             	mov    0x8(%eax),%eax
c000a751:	8b 00                	mov    (%eax),%eax
c000a753:	85 c0                	test   %eax,%eax
c000a755:	74 11                	je     c000a768 <popFromDoubleLinkList+0x56>
c000a757:	8b 45 08             	mov    0x8(%ebp),%eax
c000a75a:	8b 40 08             	mov    0x8(%eax),%eax
c000a75d:	8b 00                	mov    (%eax),%eax
c000a75f:	8b 55 08             	mov    0x8(%ebp),%edx
c000a762:	83 c2 08             	add    $0x8,%edx
c000a765:	89 50 04             	mov    %edx,0x4(%eax)
c000a768:	8b 45 08             	mov    0x8(%ebp),%eax
c000a76b:	8b 40 08             	mov    0x8(%eax),%eax
c000a76e:	8b 10                	mov    (%eax),%edx
c000a770:	8b 45 08             	mov    0x8(%ebp),%eax
c000a773:	89 50 08             	mov    %edx,0x8(%eax)
c000a776:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a779:	c9                   	leave  
c000a77a:	c3                   	ret    

c000a77b <kernel_thread>:
c000a77b:	55                   	push   %ebp
c000a77c:	89 e5                	mov    %esp,%ebp
c000a77e:	83 ec 08             	sub    $0x8,%esp
c000a781:	fb                   	sti    
c000a782:	83 ec 0c             	sub    $0xc,%esp
c000a785:	ff 75 0c             	pushl  0xc(%ebp)
c000a788:	8b 45 08             	mov    0x8(%ebp),%eax
c000a78b:	ff d0                	call   *%eax
c000a78d:	83 c4 10             	add    $0x10,%esp
c000a790:	90                   	nop
c000a791:	c9                   	leave  
c000a792:	c3                   	ret    

c000a793 <thread_init>:
c000a793:	55                   	push   %ebp
c000a794:	89 e5                	mov    %esp,%ebp
c000a796:	83 ec 18             	sub    $0x18,%esp
c000a799:	83 ec 08             	sub    $0x8,%esp
c000a79c:	6a 00                	push   $0x0
c000a79e:	6a 01                	push   $0x1
c000a7a0:	e8 b3 c6 ff ff       	call   c0006e58 <alloc_memory>
c000a7a5:	83 c4 10             	add    $0x10,%esp
c000a7a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a7ab:	83 ec 04             	sub    $0x4,%esp
c000a7ae:	68 00 10 00 00       	push   $0x1000
c000a7b3:	6a 00                	push   $0x0
c000a7b5:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7b8:	e8 a1 0d 00 00       	call   c000b55e <Memset>
c000a7bd:	83 c4 10             	add    $0x10,%esp
c000a7c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7c3:	05 00 10 00 00       	add    $0x1000,%eax
c000a7c8:	89 c2                	mov    %eax,%edx
c000a7ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7cd:	89 10                	mov    %edx,(%eax)
c000a7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7d2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000a7d9:	a1 70 f7 00 c0       	mov    0xc000f770,%eax
c000a7de:	83 c0 01             	add    $0x1,%eax
c000a7e1:	a3 70 f7 00 c0       	mov    %eax,0xc000f770
c000a7e6:	8b 15 70 f7 00 c0    	mov    0xc000f770,%edx
c000a7ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7ef:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7f8:	c9                   	leave  
c000a7f9:	c3                   	ret    

c000a7fa <thread_create>:
c000a7fa:	55                   	push   %ebp
c000a7fb:	89 e5                	mov    %esp,%ebp
c000a7fd:	83 ec 10             	sub    $0x10,%esp
c000a800:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000a807:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000a80e:	8b 45 08             	mov    0x8(%ebp),%eax
c000a811:	8b 00                	mov    (%eax),%eax
c000a813:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000a816:	89 c2                	mov    %eax,%edx
c000a818:	8b 45 08             	mov    0x8(%ebp),%eax
c000a81b:	89 10                	mov    %edx,(%eax)
c000a81d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a820:	8b 00                	mov    (%eax),%eax
c000a822:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000a825:	89 c2                	mov    %eax,%edx
c000a827:	8b 45 08             	mov    0x8(%ebp),%eax
c000a82a:	89 10                	mov    %edx,(%eax)
c000a82c:	90                   	nop
c000a82d:	c9                   	leave  
c000a82e:	c3                   	ret    

c000a82f <thread_start>:
c000a82f:	55                   	push   %ebp
c000a830:	89 e5                	mov    %esp,%ebp
c000a832:	83 ec 18             	sub    $0x18,%esp
c000a835:	e8 59 ff ff ff       	call   c000a793 <thread_init>
c000a83a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a83d:	83 ec 0c             	sub    $0xc,%esp
c000a840:	ff 75 f4             	pushl  -0xc(%ebp)
c000a843:	e8 b2 ff ff ff       	call   c000a7fa <thread_create>
c000a848:	83 c4 10             	add    $0x10,%esp
c000a84b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a84e:	05 34 01 00 00       	add    $0x134,%eax
c000a853:	83 ec 08             	sub    $0x8,%esp
c000a856:	ff 75 10             	pushl  0x10(%ebp)
c000a859:	50                   	push   %eax
c000a85a:	e8 1e 0d 00 00       	call   c000b57d <Strcpy>
c000a85f:	83 c4 10             	add    $0x10,%esp
c000a862:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a865:	8b 00                	mov    (%eax),%eax
c000a867:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a86a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a86d:	c7 40 10 7b a7 00 c0 	movl   $0xc000a77b,0x10(%eax)
c000a874:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a877:	8b 55 08             	mov    0x8(%ebp),%edx
c000a87a:	89 50 18             	mov    %edx,0x18(%eax)
c000a87d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a880:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a883:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a886:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a889:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a892:	8b 10                	mov    (%eax),%edx
c000a894:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a897:	89 50 04             	mov    %edx,0x4(%eax)
c000a89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a89d:	8b 50 04             	mov    0x4(%eax),%edx
c000a8a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a8a3:	89 50 08             	mov    %edx,0x8(%eax)
c000a8a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a8a9:	8b 50 08             	mov    0x8(%eax),%edx
c000a8ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a8af:	89 50 0c             	mov    %edx,0xc(%eax)
c000a8b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8b5:	05 00 01 00 00       	add    $0x100,%eax
c000a8ba:	83 ec 08             	sub    $0x8,%esp
c000a8bd:	50                   	push   %eax
c000a8be:	68 cc fd 00 c0       	push   $0xc000fdcc
c000a8c3:	e8 b0 fd ff ff       	call   c000a678 <appendToDoubleLinkList>
c000a8c8:	83 c4 10             	add    $0x10,%esp
c000a8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8ce:	05 08 01 00 00       	add    $0x108,%eax
c000a8d3:	83 ec 08             	sub    $0x8,%esp
c000a8d6:	50                   	push   %eax
c000a8d7:	68 18 1f 01 c0       	push   $0xc0011f18
c000a8dc:	e8 97 fd ff ff       	call   c000a678 <appendToDoubleLinkList>
c000a8e1:	83 c4 10             	add    $0x10,%esp
c000a8e4:	90                   	nop
c000a8e5:	c9                   	leave  
c000a8e6:	c3                   	ret    
