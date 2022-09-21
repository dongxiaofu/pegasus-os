
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 60 f7 00 c0 00 	movl   $0x0,0xc000f760
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	66 c7 05 60 f7 00 c0 	movw   $0x0,0xc000f760
c000151c:	00 00 
c000151e:	0f 01 05 c8 16 01 c0 	sgdtl  0xc00116c8
c0001525:	e8 d0 36 00 00       	call   c0004bfa <ReloadGDT>
c000152a:	0f 01 15 c8 16 01 c0 	lgdtl  0xc00116c8
c0001531:	0f 01 1d 48 f7 00 c0 	lidtl  0xc000f748
c0001538:	0f a8                	push   %gs
c000153a:	0f a9                	pop    %gs
c000153c:	ea 43 15 00 c0 08 00 	ljmp   $0x8,$0xc0001543

c0001543 <csinit>:
c0001543:	31 c0                	xor    %eax,%eax
c0001545:	66 b8 40 00          	mov    $0x40,%ax
c0001549:	0f 00 d8             	ltr    %ax
c000154c:	31 c0                	xor    %eax,%eax
c000154e:	e9 46 03 00 00       	jmp    c0001899 <kernel_main>
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
c000156a:	e8 f1 68 00 00       	call   c0007e60 <test>
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
c0001594:	8b 3d 60 f7 00 c0    	mov    0xc000f760,%edi

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
c00015bd:	89 3d 60 f7 00 c0    	mov    %edi,0xc000f760
c00015c3:	89 ec                	mov    %ebp,%esp
c00015c5:	5d                   	pop    %ebp
c00015c6:	c3                   	ret    

c00015c7 <disp_str_colour>:
c00015c7:	55                   	push   %ebp
c00015c8:	89 e5                	mov    %esp,%ebp
c00015ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00015cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00015d0:	8b 3d 60 f7 00 c0    	mov    0xc000f760,%edi

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
c00015f9:	89 3d 60 f7 00 c0    	mov    %edi,0xc000f760
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
c0001661:	e8 1d 63 00 00       	call   c0007983 <exception_handler>
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
c000167e:	ff 05 64 f7 00 c0    	incl   0xc000f764
c0001684:	83 3d 64 f7 00 c0 00 	cmpl   $0x0,0xc000f764
c000168b:	75 00                	jne    c000168d <hwint0.1>

c000168d <hwint0.1>:
c000168d:	e8 fe 31 00 00       	call   c0004890 <clock_handler>
c0001692:	fa                   	cli    
c0001693:	e9 e1 00 00 00       	jmp    c0001779 <reenter_restore>

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
c00016b0:	ff 05 64 f7 00 c0    	incl   0xc000f764
c00016b6:	83 3d 64 f7 00 c0 00 	cmpl   $0x0,0xc000f764
c00016bd:	75 00                	jne    c00016bf <hwint1.1>

c00016bf <hwint1.1>:
c00016bf:	fb                   	sti    
c00016c0:	e8 49 40 00 00       	call   c000570e <keyboard_handler>
c00016c5:	b0 f8                	mov    $0xf8,%al
c00016c7:	e6 21                	out    %al,$0x21
c00016c9:	fa                   	cli    
c00016ca:	83 3d 64 f7 00 c0 00 	cmpl   $0x0,0xc000f764
c00016d1:	0f 85 a2 00 00 00    	jne    c0001779 <reenter_restore>
c00016d7:	e9 9d 00 00 00       	jmp    c0001779 <reenter_restore>

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
c00016f7:	ff 05 64 f7 00 c0    	incl   0xc000f764
c00016fd:	83 3d 64 f7 00 c0 00 	cmpl   $0x0,0xc000f764
c0001704:	75 05                	jne    c000170b <hwint14.2>

c0001706 <hwint14.1>:
c0001706:	bc 20 f7 00 c0       	mov    $0xc000f720,%esp

c000170b <hwint14.2>:
c000170b:	fb                   	sti    
c000170c:	e8 39 0e 00 00       	call   c000254a <hd_handler>
c0001711:	b0 bf                	mov    $0xbf,%al
c0001713:	e6 a1                	out    %al,$0xa1
c0001715:	fa                   	cli    
c0001716:	83 3d 64 f7 00 c0 00 	cmpl   $0x0,0xc000f764
c000171d:	75 5a                	jne    c0001779 <reenter_restore>
c000171f:	eb 58                	jmp    c0001779 <reenter_restore>

c0001721 <sys_call>:
c0001721:	60                   	pusha  
c0001722:	1e                   	push   %ds
c0001723:	06                   	push   %es
c0001724:	0f a0                	push   %fs
c0001726:	0f a8                	push   %gs
c0001728:	89 e6                	mov    %esp,%esi
c000172a:	66 8c d2             	mov    %ss,%dx
c000172d:	8e da                	mov    %edx,%ds
c000172f:	8e c2                	mov    %edx,%es
c0001731:	8e e2                	mov    %edx,%fs
c0001733:	ff 05 64 f7 00 c0    	incl   0xc000f764
c0001739:	83 3d 64 f7 00 c0 00 	cmpl   $0x0,0xc000f764
c0001740:	75 00                	jne    c0001742 <sys_call.1>

c0001742 <sys_call.1>:
c0001742:	fb                   	sti    
c0001743:	56                   	push   %esi
c0001744:	ff 35 80 fb 00 c0    	pushl  0xc000fb80
c000174a:	53                   	push   %ebx
c000174b:	51                   	push   %ecx
c000174c:	ff 14 85 0c e1 00 c0 	call   *-0x3fff1ef4(,%eax,4)
c0001753:	83 c4 0c             	add    $0xc,%esp
c0001756:	5e                   	pop    %esi
c0001757:	89 46 2c             	mov    %eax,0x2c(%esi)
c000175a:	fa                   	cli    
c000175b:	83 3d 64 f7 00 c0 00 	cmpl   $0x0,0xc000f764
c0001762:	75 15                	jne    c0001779 <reenter_restore>
c0001764:	eb 13                	jmp    c0001779 <reenter_restore>

c0001766 <restart>:
c0001766:	ff 0d 64 f7 00 c0    	decl   0xc000f764
c000176c:	89 e5                	mov    %esp,%ebp
c000176e:	8b 65 04             	mov    0x4(%ebp),%esp
c0001771:	0f a9                	pop    %gs
c0001773:	0f a1                	pop    %fs
c0001775:	07                   	pop    %es
c0001776:	1f                   	pop    %ds
c0001777:	61                   	popa   
c0001778:	cf                   	iret   

c0001779 <reenter_restore>:
c0001779:	ff 0d 64 f7 00 c0    	decl   0xc000f764
c000177f:	0f a9                	pop    %gs
c0001781:	0f a1                	pop    %fs
c0001783:	07                   	pop    %es
c0001784:	1f                   	pop    %ds
c0001785:	61                   	popa   
c0001786:	cf                   	iret   

c0001787 <in_byte>:
c0001787:	31 d2                	xor    %edx,%edx
c0001789:	8b 54 24 04          	mov    0x4(%esp),%edx
c000178d:	31 c0                	xor    %eax,%eax
c000178f:	ec                   	in     (%dx),%al
c0001790:	90                   	nop
c0001791:	90                   	nop
c0001792:	c3                   	ret    

c0001793 <out_byte>:
c0001793:	31 d2                	xor    %edx,%edx
c0001795:	31 c0                	xor    %eax,%eax
c0001797:	8b 54 24 04          	mov    0x4(%esp),%edx
c000179b:	8a 44 24 08          	mov    0x8(%esp),%al
c000179f:	ee                   	out    %al,(%dx)
c00017a0:	90                   	nop
c00017a1:	90                   	nop
c00017a2:	c3                   	ret    

c00017a3 <in_byte2>:
c00017a3:	55                   	push   %ebp
c00017a4:	89 e5                	mov    %esp,%ebp
c00017a6:	52                   	push   %edx
c00017a7:	31 d2                	xor    %edx,%edx
c00017a9:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017ad:	31 c0                	xor    %eax,%eax
c00017af:	ec                   	in     (%dx),%al
c00017b0:	90                   	nop
c00017b1:	90                   	nop
c00017b2:	5b                   	pop    %ebx
c00017b3:	5d                   	pop    %ebp
c00017b4:	c3                   	ret    

c00017b5 <disable_int>:
c00017b5:	fa                   	cli    
c00017b6:	c3                   	ret    

c00017b7 <enable_int>:
c00017b7:	fb                   	sti    
c00017b8:	c3                   	ret    

c00017b9 <check_tss_esp0>:
c00017b9:	55                   	push   %ebp
c00017ba:	89 e5                	mov    %esp,%ebp
c00017bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00017bf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017c2:	83 c0 44             	add    $0x44,%eax
c00017c5:	8b 15 44 16 01 c0    	mov    0xc0011644,%edx
c00017cb:	39 d0                	cmp    %edx,%eax
c00017cd:	74 7c                	je     c000184b <check_tss_esp0.2>

c00017cf <check_tss_esp0.1>:
c00017cf:	50                   	push   %eax
c00017d0:	52                   	push   %edx
c00017d1:	68 10 e0 00 c0       	push   $0xc000e010
c00017d6:	e8 b1 fd ff ff       	call   c000158c <disp_str>
c00017db:	83 c4 04             	add    $0x4,%esp
c00017de:	5a                   	pop    %edx
c00017df:	58                   	pop    %eax
c00017e0:	52                   	push   %edx
c00017e1:	50                   	push   %eax
c00017e2:	53                   	push   %ebx
c00017e3:	e8 3f 60 00 00       	call   c0007827 <disp_int>
c00017e8:	83 c4 04             	add    $0x4,%esp
c00017eb:	58                   	pop    %eax
c00017ec:	5a                   	pop    %edx
c00017ed:	52                   	push   %edx
c00017ee:	50                   	push   %eax
c00017ef:	e8 33 60 00 00       	call   c0007827 <disp_int>
c00017f4:	58                   	pop    %eax
c00017f5:	5a                   	pop    %edx
c00017f6:	52                   	push   %edx
c00017f7:	50                   	push   %eax
c00017f8:	ff 35 64 f7 00 c0    	pushl  0xc000f764
c00017fe:	e8 24 60 00 00       	call   c0007827 <disp_int>
c0001803:	83 c4 04             	add    $0x4,%esp
c0001806:	58                   	pop    %eax
c0001807:	5a                   	pop    %edx
c0001808:	52                   	push   %edx
c0001809:	50                   	push   %eax
c000180a:	ff 72 ec             	pushl  -0x14(%edx)
c000180d:	e8 15 60 00 00       	call   c0007827 <disp_int>
c0001812:	83 c4 04             	add    $0x4,%esp
c0001815:	58                   	pop    %eax
c0001816:	5a                   	pop    %edx
c0001817:	52                   	push   %edx
c0001818:	50                   	push   %eax
c0001819:	ff 70 ec             	pushl  -0x14(%eax)
c000181c:	e8 06 60 00 00       	call   c0007827 <disp_int>
c0001821:	83 c4 04             	add    $0x4,%esp
c0001824:	58                   	pop    %eax
c0001825:	5a                   	pop    %edx
c0001826:	52                   	push   %edx
c0001827:	50                   	push   %eax
c0001828:	ff 35 80 fb 00 c0    	pushl  0xc000fb80
c000182e:	e8 f4 5f 00 00       	call   c0007827 <disp_int>
c0001833:	83 c4 04             	add    $0x4,%esp
c0001836:	58                   	pop    %eax
c0001837:	5a                   	pop    %edx
c0001838:	52                   	push   %edx
c0001839:	50                   	push   %eax
c000183a:	68 20 f7 00 c0       	push   $0xc000f720
c000183f:	e8 e3 5f 00 00       	call   c0007827 <disp_int>
c0001844:	83 c4 04             	add    $0x4,%esp
c0001847:	58                   	pop    %eax
c0001848:	5a                   	pop    %edx
c0001849:	5d                   	pop    %ebp
c000184a:	c3                   	ret    

c000184b <check_tss_esp0.2>:
c000184b:	5d                   	pop    %ebp
c000184c:	c3                   	ret    

c000184d <enable_8259A_casecade_irq>:
c000184d:	9c                   	pushf  
c000184e:	fa                   	cli    
c000184f:	e4 21                	in     $0x21,%al
c0001851:	24 fb                	and    $0xfb,%al
c0001853:	e6 21                	out    %al,$0x21
c0001855:	9d                   	popf   
c0001856:	c3                   	ret    

c0001857 <disable_8259A_casecade_irq>:
c0001857:	9c                   	pushf  
c0001858:	fa                   	cli    
c0001859:	e4 21                	in     $0x21,%al
c000185b:	0c 04                	or     $0x4,%al
c000185d:	e6 21                	out    %al,$0x21
c000185f:	9c                   	pushf  
c0001860:	c3                   	ret    

c0001861 <enable_8259A_slave_winchester_irq>:
c0001861:	9c                   	pushf  
c0001862:	fa                   	cli    
c0001863:	e4 a1                	in     $0xa1,%al
c0001865:	24 bf                	and    $0xbf,%al
c0001867:	e6 a1                	out    %al,$0xa1
c0001869:	9d                   	popf   
c000186a:	c3                   	ret    

c000186b <disable_8259A_slave_winchester_irq>:
c000186b:	9c                   	pushf  
c000186c:	fa                   	cli    
c000186d:	e4 a1                	in     $0xa1,%al
c000186f:	0c 40                	or     $0x40,%al
c0001871:	e6 a1                	out    %al,$0xa1
c0001873:	9d                   	popf   
c0001874:	c3                   	ret    

c0001875 <update_cr3>:
c0001875:	55                   	push   %ebp
c0001876:	89 e5                	mov    %esp,%ebp
c0001878:	8b 45 08             	mov    0x8(%ebp),%eax
c000187b:	0f 22 d8             	mov    %eax,%cr3
c000187e:	89 ec                	mov    %ebp,%esp
c0001880:	5d                   	pop    %ebp
c0001881:	c3                   	ret    

c0001882 <update_tss>:
c0001882:	55                   	push   %ebp
c0001883:	89 e5                	mov    %esp,%ebp
c0001885:	8b 45 08             	mov    0x8(%ebp),%eax
c0001888:	a3 44 16 01 c0       	mov    %eax,0xc0011644
c000188d:	89 ec                	mov    %ebp,%esp
c000188f:	5d                   	pop    %ebp
c0001890:	c3                   	ret    

c0001891 <get_running_thread_pcb>:
c0001891:	89 e0                	mov    %esp,%eax
c0001893:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0001898:	c3                   	ret    

c0001899 <kernel_main>:
c0001899:	55                   	push   %ebp
c000189a:	89 e5                	mov    %esp,%ebp
c000189c:	83 ec 08             	sub    $0x8,%esp
c000189f:	e8 61 00 00 00       	call   c0001905 <init>
c00018a4:	83 ec 04             	sub    $0x4,%esp
c00018a7:	68 40 a1 00 c0       	push   $0xc000a140
c00018ac:	68 4a a1 00 c0       	push   $0xc000a14a
c00018b1:	68 57 1a 00 c0       	push   $0xc0001a57
c00018b6:	e8 84 84 00 00       	call   c0009d3f <process_execute>
c00018bb:	83 c4 10             	add    $0x10,%esp
c00018be:	83 ec 04             	sub    $0x4,%esp
c00018c1:	68 57 a1 00 c0       	push   $0xc000a157
c00018c6:	68 5f a1 00 c0       	push   $0xc000a15f
c00018cb:	68 ae 55 00 c0       	push   $0xc00055ae
c00018d0:	e8 6a 84 00 00       	call   c0009d3f <process_execute>
c00018d5:	83 c4 10             	add    $0x10,%esp
c00018d8:	83 ec 04             	sub    $0x4,%esp
c00018db:	68 69 a1 00 c0       	push   $0xc000a169
c00018e0:	68 71 a1 00 c0       	push   $0xc000a171
c00018e5:	68 64 27 00 c0       	push   $0xc0002764
c00018ea:	e8 50 84 00 00       	call   c0009d3f <process_execute>
c00018ef:	83 c4 10             	add    $0x10,%esp
c00018f2:	83 ec 0c             	sub    $0xc,%esp
c00018f5:	68 7a a1 00 c0       	push   $0xc000a17a
c00018fa:	e8 8d fc ff ff       	call   c000158c <disp_str>
c00018ff:	83 c4 10             	add    $0x10,%esp
c0001902:	fb                   	sti    
c0001903:	eb fe                	jmp    c0001903 <kernel_main+0x6a>

c0001905 <init>:
c0001905:	55                   	push   %ebp
c0001906:	89 e5                	mov    %esp,%ebp
c0001908:	83 ec 08             	sub    $0x8,%esp
c000190b:	c7 05 60 f7 00 c0 00 	movl   $0x0,0xc000f760
c0001912:	00 00 00 
c0001915:	c7 05 50 f7 00 c0 00 	movl   $0x0,0xc000f750
c000191c:	00 00 00 
c000191f:	83 ec 0c             	sub    $0xc,%esp
c0001922:	68 84 a1 00 c0       	push   $0xc000a184
c0001927:	e8 60 fc ff ff       	call   c000158c <disp_str>
c000192c:	83 c4 10             	add    $0x10,%esp
c000192f:	e8 e1 65 00 00       	call   c0007f15 <init_keyboard>
c0001934:	83 ec 0c             	sub    $0xc,%esp
c0001937:	68 00 00 00 02       	push   $0x2000000
c000193c:	e8 04 5b 00 00       	call   c0007445 <init_memory>
c0001941:	83 c4 10             	add    $0x10,%esp
c0001944:	83 ec 0c             	sub    $0xc,%esp
c0001947:	68 ac fd 00 c0       	push   $0xc000fdac
c000194c:	e8 54 85 00 00       	call   c0009ea5 <initDoubleLinkList>
c0001951:	83 c4 10             	add    $0x10,%esp
c0001954:	83 ec 0c             	sub    $0xc,%esp
c0001957:	68 f4 1e 01 c0       	push   $0xc0011ef4
c000195c:	e8 44 85 00 00       	call   c0009ea5 <initDoubleLinkList>
c0001961:	83 c4 10             	add    $0x10,%esp
c0001964:	90                   	nop
c0001965:	c9                   	leave  
c0001966:	c3                   	ret    

c0001967 <kernel_thread_a>:
c0001967:	55                   	push   %ebp
c0001968:	89 e5                	mov    %esp,%ebp
c000196a:	83 ec 18             	sub    $0x18,%esp
c000196d:	83 ec 0c             	sub    $0xc,%esp
c0001970:	ff 75 08             	pushl  0x8(%ebp)
c0001973:	e8 14 fc ff ff       	call   c000158c <disp_str>
c0001978:	83 c4 10             	add    $0x10,%esp
c000197b:	a1 60 f7 00 c0       	mov    0xc000f760,%eax
c0001980:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001983:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000198a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000198d:	a3 60 f7 00 c0       	mov    %eax,0xc000f760
c0001992:	83 ec 0c             	sub    $0xc,%esp
c0001995:	68 8a a1 00 c0       	push   $0xc000a18a
c000199a:	e8 ed fb ff ff       	call   c000158c <disp_str>
c000199f:	83 c4 10             	add    $0x10,%esp
c00019a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019a5:	8d 50 01             	lea    0x1(%eax),%edx
c00019a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019ab:	83 ec 0c             	sub    $0xc,%esp
c00019ae:	50                   	push   %eax
c00019af:	e8 73 5e 00 00       	call   c0007827 <disp_int>
c00019b4:	83 c4 10             	add    $0x10,%esp
c00019b7:	83 ec 0c             	sub    $0xc,%esp
c00019ba:	68 93 a1 00 c0       	push   $0xc000a193
c00019bf:	e8 c8 fb ff ff       	call   c000158c <disp_str>
c00019c4:	83 c4 10             	add    $0x10,%esp
c00019c7:	eb c1                	jmp    c000198a <kernel_thread_a+0x23>

c00019c9 <kernel_thread_b>:
c00019c9:	55                   	push   %ebp
c00019ca:	89 e5                	mov    %esp,%ebp
c00019cc:	83 ec 18             	sub    $0x18,%esp
c00019cf:	83 ec 0c             	sub    $0xc,%esp
c00019d2:	ff 75 08             	pushl  0x8(%ebp)
c00019d5:	e8 b2 fb ff ff       	call   c000158c <disp_str>
c00019da:	83 c4 10             	add    $0x10,%esp
c00019dd:	a1 60 f7 00 c0       	mov    0xc000f760,%eax
c00019e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00019ef:	a3 60 f7 00 c0       	mov    %eax,0xc000f760
c00019f4:	83 ec 0c             	sub    $0xc,%esp
c00019f7:	68 95 a1 00 c0       	push   $0xc000a195
c00019fc:	e8 8b fb ff ff       	call   c000158c <disp_str>
c0001a01:	83 c4 10             	add    $0x10,%esp
c0001a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a07:	8d 50 01             	lea    0x1(%eax),%edx
c0001a0a:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0001a0d:	83 ec 0c             	sub    $0xc,%esp
c0001a10:	50                   	push   %eax
c0001a11:	e8 11 5e 00 00       	call   c0007827 <disp_int>
c0001a16:	83 c4 10             	add    $0x10,%esp
c0001a19:	83 ec 0c             	sub    $0xc,%esp
c0001a1c:	68 93 a1 00 c0       	push   $0xc000a193
c0001a21:	e8 66 fb ff ff       	call   c000158c <disp_str>
c0001a26:	83 c4 10             	add    $0x10,%esp
c0001a29:	eb c1                	jmp    c00019ec <kernel_thread_b+0x23>

c0001a2b <kernel_thread_c>:
c0001a2b:	55                   	push   %ebp
c0001a2c:	89 e5                	mov    %esp,%ebp
c0001a2e:	83 ec 08             	sub    $0x8,%esp
c0001a31:	83 ec 0c             	sub    $0xc,%esp
c0001a34:	ff 75 08             	pushl  0x8(%ebp)
c0001a37:	e8 50 fb ff ff       	call   c000158c <disp_str>
c0001a3c:	83 c4 10             	add    $0x10,%esp
c0001a3f:	eb fe                	jmp    c0001a3f <kernel_thread_c+0x14>

c0001a41 <kernel_thread_d>:
c0001a41:	55                   	push   %ebp
c0001a42:	89 e5                	mov    %esp,%ebp
c0001a44:	83 ec 08             	sub    $0x8,%esp
c0001a47:	83 ec 0c             	sub    $0xc,%esp
c0001a4a:	ff 75 08             	pushl  0x8(%ebp)
c0001a4d:	e8 3a fb ff ff       	call   c000158c <disp_str>
c0001a52:	83 c4 10             	add    $0x10,%esp
c0001a55:	eb fe                	jmp    c0001a55 <kernel_thread_d+0x14>

c0001a57 <user_proc_a>:
c0001a57:	55                   	push   %ebp
c0001a58:	89 e5                	mov    %esp,%ebp
c0001a5a:	83 ec 08             	sub    $0x8,%esp
c0001a5d:	83 ec 0c             	sub    $0xc,%esp
c0001a60:	68 9e a1 00 c0       	push   $0xc000a19e
c0001a65:	e8 22 fb ff ff       	call   c000158c <disp_str>
c0001a6a:	83 c4 10             	add    $0x10,%esp
c0001a6d:	e8 bc 67 00 00       	call   c000822e <TestFS>
c0001a72:	eb fe                	jmp    c0001a72 <user_proc_a+0x1b>

c0001a74 <user_proc_b>:
c0001a74:	55                   	push   %ebp
c0001a75:	89 e5                	mov    %esp,%ebp
c0001a77:	83 ec 08             	sub    $0x8,%esp
c0001a7a:	83 ec 0c             	sub    $0xc,%esp
c0001a7d:	68 b0 a1 00 c0       	push   $0xc000a1b0
c0001a82:	e8 05 fb ff ff       	call   c000158c <disp_str>
c0001a87:	83 c4 10             	add    $0x10,%esp
c0001a8a:	eb fe                	jmp    c0001a8a <user_proc_b+0x16>

c0001a8c <TaskHD>:
c0001a8c:	55                   	push   %ebp
c0001a8d:	89 e5                	mov    %esp,%ebp
c0001a8f:	eb fe                	jmp    c0001a8f <TaskHD+0x3>

c0001a91 <init_hd>:
c0001a91:	55                   	push   %ebp
c0001a92:	89 e5                	mov    %esp,%ebp
c0001a94:	83 ec 18             	sub    $0x18,%esp
c0001a97:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001a9e:	e8 aa fd ff ff       	call   c000184d <enable_8259A_casecade_irq>
c0001aa3:	e8 b9 fd ff ff       	call   c0001861 <enable_8259A_slave_winchester_irq>
c0001aa8:	90                   	nop
c0001aa9:	c9                   	leave  
c0001aaa:	c3                   	ret    

c0001aab <hd_handle>:
c0001aab:	55                   	push   %ebp
c0001aac:	89 e5                	mov    %esp,%ebp
c0001aae:	83 ec 18             	sub    $0x18,%esp
c0001ab1:	83 ec 04             	sub    $0x4,%esp
c0001ab4:	6a 0e                	push   $0xe
c0001ab6:	ff 75 08             	pushl  0x8(%ebp)
c0001ab9:	6a 02                	push   $0x2
c0001abb:	e8 6f 7d 00 00       	call   c000982f <send_rec>
c0001ac0:	83 c4 10             	add    $0x10,%esp
c0001ac3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ac6:	8b 40 68             	mov    0x68(%eax),%eax
c0001ac9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001acc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001ad0:	0f 84 9b 00 00 00    	je     c0001b71 <hd_handle+0xc6>
c0001ad6:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ad9:	8b 00                	mov    (%eax),%eax
c0001adb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001ade:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001ae2:	74 23                	je     c0001b07 <hd_handle+0x5c>
c0001ae4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001ae8:	77 08                	ja     c0001af2 <hd_handle+0x47>
c0001aea:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001aee:	74 10                	je     c0001b00 <hd_handle+0x55>
c0001af0:	eb 34                	jmp    c0001b26 <hd_handle+0x7b>
c0001af2:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001af6:	74 0f                	je     c0001b07 <hd_handle+0x5c>
c0001af8:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001afc:	74 19                	je     c0001b17 <hd_handle+0x6c>
c0001afe:	eb 26                	jmp    c0001b26 <hd_handle+0x7b>
c0001b00:	e8 1b 07 00 00       	call   c0002220 <hd_open>
c0001b05:	eb 30                	jmp    c0001b37 <hd_handle+0x8c>
c0001b07:	83 ec 0c             	sub    $0xc,%esp
c0001b0a:	ff 75 08             	pushl  0x8(%ebp)
c0001b0d:	e8 06 08 00 00       	call   c0002318 <hd_rdwt>
c0001b12:	83 c4 10             	add    $0x10,%esp
c0001b15:	eb 20                	jmp    c0001b37 <hd_handle+0x8c>
c0001b17:	83 ec 0c             	sub    $0xc,%esp
c0001b1a:	6a 00                	push   $0x0
c0001b1c:	e8 4e 07 00 00       	call   c000226f <get_hd_ioctl>
c0001b21:	83 c4 10             	add    $0x10,%esp
c0001b24:	eb 11                	jmp    c0001b37 <hd_handle+0x8c>
c0001b26:	83 ec 0c             	sub    $0xc,%esp
c0001b29:	68 c2 a1 00 c0       	push   $0xc000a1c2
c0001b2e:	e8 ce 74 00 00       	call   c0009001 <spin>
c0001b33:	83 c4 10             	add    $0x10,%esp
c0001b36:	90                   	nop
c0001b37:	83 ec 04             	sub    $0x4,%esp
c0001b3a:	6a 6c                	push   $0x6c
c0001b3c:	6a 00                	push   $0x0
c0001b3e:	ff 75 08             	pushl  0x8(%ebp)
c0001b41:	e8 91 91 00 00       	call   c000acd7 <Memset>
c0001b46:	83 c4 10             	add    $0x10,%esp
c0001b49:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b4c:	c7 40 68 64 00 00 00 	movl   $0x64,0x68(%eax)
c0001b53:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b56:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001b5d:	83 ec 04             	sub    $0x4,%esp
c0001b60:	6a 03                	push   $0x3
c0001b62:	ff 75 08             	pushl  0x8(%ebp)
c0001b65:	6a 01                	push   $0x1
c0001b67:	e8 c3 7c 00 00       	call   c000982f <send_rec>
c0001b6c:	83 c4 10             	add    $0x10,%esp
c0001b6f:	eb 01                	jmp    c0001b72 <hd_handle+0xc7>
c0001b71:	90                   	nop
c0001b72:	c9                   	leave  
c0001b73:	c3                   	ret    

c0001b74 <hd_cmd_out>:
c0001b74:	55                   	push   %ebp
c0001b75:	89 e5                	mov    %esp,%ebp
c0001b77:	83 ec 08             	sub    $0x8,%esp
c0001b7a:	83 ec 04             	sub    $0x4,%esp
c0001b7d:	68 98 3a 00 00       	push   $0x3a98
c0001b82:	6a 00                	push   $0x0
c0001b84:	68 80 00 00 00       	push   $0x80
c0001b89:	e8 e8 09 00 00       	call   c0002576 <waitfor>
c0001b8e:	83 c4 10             	add    $0x10,%esp
c0001b91:	85 c0                	test   %eax,%eax
c0001b93:	75 10                	jne    c0001ba5 <hd_cmd_out+0x31>
c0001b95:	83 ec 0c             	sub    $0xc,%esp
c0001b98:	68 d4 a1 00 c0       	push   $0xc000a1d4
c0001b9d:	e8 64 74 00 00       	call   c0009006 <panic>
c0001ba2:	83 c4 10             	add    $0x10,%esp
c0001ba5:	83 ec 08             	sub    $0x8,%esp
c0001ba8:	6a 00                	push   $0x0
c0001baa:	68 f6 03 00 00       	push   $0x3f6
c0001baf:	e8 df fb ff ff       	call   c0001793 <out_byte>
c0001bb4:	83 c4 10             	add    $0x10,%esp
c0001bb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bba:	0f b6 00             	movzbl (%eax),%eax
c0001bbd:	0f b6 c0             	movzbl %al,%eax
c0001bc0:	83 ec 08             	sub    $0x8,%esp
c0001bc3:	50                   	push   %eax
c0001bc4:	68 f1 01 00 00       	push   $0x1f1
c0001bc9:	e8 c5 fb ff ff       	call   c0001793 <out_byte>
c0001bce:	83 c4 10             	add    $0x10,%esp
c0001bd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bd4:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001bd8:	0f b6 c0             	movzbl %al,%eax
c0001bdb:	83 ec 08             	sub    $0x8,%esp
c0001bde:	50                   	push   %eax
c0001bdf:	68 f2 01 00 00       	push   $0x1f2
c0001be4:	e8 aa fb ff ff       	call   c0001793 <out_byte>
c0001be9:	83 c4 10             	add    $0x10,%esp
c0001bec:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bef:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001bf3:	0f b6 c0             	movzbl %al,%eax
c0001bf6:	83 ec 08             	sub    $0x8,%esp
c0001bf9:	50                   	push   %eax
c0001bfa:	68 f3 01 00 00       	push   $0x1f3
c0001bff:	e8 8f fb ff ff       	call   c0001793 <out_byte>
c0001c04:	83 c4 10             	add    $0x10,%esp
c0001c07:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c0a:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001c0e:	0f b6 c0             	movzbl %al,%eax
c0001c11:	83 ec 08             	sub    $0x8,%esp
c0001c14:	50                   	push   %eax
c0001c15:	68 f4 01 00 00       	push   $0x1f4
c0001c1a:	e8 74 fb ff ff       	call   c0001793 <out_byte>
c0001c1f:	83 c4 10             	add    $0x10,%esp
c0001c22:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c25:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001c29:	0f b6 c0             	movzbl %al,%eax
c0001c2c:	83 ec 08             	sub    $0x8,%esp
c0001c2f:	50                   	push   %eax
c0001c30:	68 f5 01 00 00       	push   $0x1f5
c0001c35:	e8 59 fb ff ff       	call   c0001793 <out_byte>
c0001c3a:	83 c4 10             	add    $0x10,%esp
c0001c3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c40:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001c44:	0f b6 c0             	movzbl %al,%eax
c0001c47:	83 ec 08             	sub    $0x8,%esp
c0001c4a:	50                   	push   %eax
c0001c4b:	68 f6 01 00 00       	push   $0x1f6
c0001c50:	e8 3e fb ff ff       	call   c0001793 <out_byte>
c0001c55:	83 c4 10             	add    $0x10,%esp
c0001c58:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c5b:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001c5f:	0f b6 c0             	movzbl %al,%eax
c0001c62:	83 ec 08             	sub    $0x8,%esp
c0001c65:	50                   	push   %eax
c0001c66:	68 f7 01 00 00       	push   $0x1f7
c0001c6b:	e8 23 fb ff ff       	call   c0001793 <out_byte>
c0001c70:	83 c4 10             	add    $0x10,%esp
c0001c73:	90                   	nop
c0001c74:	c9                   	leave  
c0001c75:	c3                   	ret    

c0001c76 <hd_identify>:
c0001c76:	55                   	push   %ebp
c0001c77:	89 e5                	mov    %esp,%ebp
c0001c79:	53                   	push   %ebx
c0001c7a:	83 ec 24             	sub    $0x24,%esp
c0001c7d:	89 e0                	mov    %esp,%eax
c0001c7f:	89 c3                	mov    %eax,%ebx
c0001c81:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001c85:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001c89:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001c8d:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001c91:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001c95:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c98:	c1 e0 04             	shl    $0x4,%eax
c0001c9b:	83 c8 e0             	or     $0xffffffe0,%eax
c0001c9e:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001ca1:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001ca5:	83 ec 0c             	sub    $0xc,%esp
c0001ca8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001cab:	50                   	push   %eax
c0001cac:	e8 c3 fe ff ff       	call   c0001b74 <hd_cmd_out>
c0001cb1:	83 c4 10             	add    $0x10,%esp
c0001cb4:	e8 40 06 00 00       	call   c00022f9 <interrupt_wait>
c0001cb9:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001cc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cc3:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001cc6:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001cc9:	89 c2                	mov    %eax,%edx
c0001ccb:	b8 10 00 00 00       	mov    $0x10,%eax
c0001cd0:	83 e8 01             	sub    $0x1,%eax
c0001cd3:	01 d0                	add    %edx,%eax
c0001cd5:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001cda:	ba 00 00 00 00       	mov    $0x0,%edx
c0001cdf:	f7 f1                	div    %ecx
c0001ce1:	6b c0 10             	imul   $0x10,%eax,%eax
c0001ce4:	29 c4                	sub    %eax,%esp
c0001ce6:	89 e0                	mov    %esp,%eax
c0001ce8:	83 c0 00             	add    $0x0,%eax
c0001ceb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001cee:	83 ec 04             	sub    $0x4,%esp
c0001cf1:	ff 75 f4             	pushl  -0xc(%ebp)
c0001cf4:	6a 00                	push   $0x0
c0001cf6:	ff 75 ec             	pushl  -0x14(%ebp)
c0001cf9:	e8 d9 8f 00 00       	call   c000acd7 <Memset>
c0001cfe:	83 c4 10             	add    $0x10,%esp
c0001d01:	83 ec 04             	sub    $0x4,%esp
c0001d04:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d07:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d0a:	68 f0 01 00 00       	push   $0x1f0
c0001d0f:	e8 17 90 00 00       	call   c000ad2b <read_port>
c0001d14:	83 c4 10             	add    $0x10,%esp
c0001d17:	83 ec 0c             	sub    $0xc,%esp
c0001d1a:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d1d:	e8 0b 00 00 00       	call   c0001d2d <print_hdinfo>
c0001d22:	83 c4 10             	add    $0x10,%esp
c0001d25:	89 dc                	mov    %ebx,%esp
c0001d27:	90                   	nop
c0001d28:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001d2b:	c9                   	leave  
c0001d2c:	c3                   	ret    

c0001d2d <print_hdinfo>:
c0001d2d:	55                   	push   %ebp
c0001d2e:	89 e5                	mov    %esp,%ebp
c0001d30:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001d36:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001d3c:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001d42:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001d49:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001d50:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001d57:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001d5e:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001d65:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001d6b:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001d71:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001d78:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001d7f:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001d86:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001d8d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001d94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001d9b:	e9 8f 00 00 00       	jmp    c0001e2f <print_hdinfo+0x102>
c0001da0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001da7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001daa:	89 d0                	mov    %edx,%eax
c0001dac:	01 c0                	add    %eax,%eax
c0001dae:	01 d0                	add    %edx,%eax
c0001db0:	c1 e0 03             	shl    $0x3,%eax
c0001db3:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001db6:	01 c8                	add    %ecx,%eax
c0001db8:	83 e8 44             	sub    $0x44,%eax
c0001dbb:	0f b7 00             	movzwl (%eax),%eax
c0001dbe:	0f b7 c0             	movzwl %ax,%eax
c0001dc1:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001dc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0001dc7:	01 d0                	add    %edx,%eax
c0001dc9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001dcc:	eb 30                	jmp    c0001dfe <print_hdinfo+0xd1>
c0001dce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001dd1:	8d 50 01             	lea    0x1(%eax),%edx
c0001dd4:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001dd7:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001dda:	83 c2 01             	add    $0x1,%edx
c0001ddd:	0f b6 00             	movzbl (%eax),%eax
c0001de0:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001de4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001de7:	8d 50 01             	lea    0x1(%eax),%edx
c0001dea:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001ded:	0f b6 00             	movzbl (%eax),%eax
c0001df0:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001df3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001df6:	01 ca                	add    %ecx,%edx
c0001df8:	88 02                	mov    %al,(%edx)
c0001dfa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001dfe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e01:	89 d0                	mov    %edx,%eax
c0001e03:	01 c0                	add    %eax,%eax
c0001e05:	01 d0                	add    %edx,%eax
c0001e07:	c1 e0 03             	shl    $0x3,%eax
c0001e0a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e0d:	01 c8                	add    %ecx,%eax
c0001e0f:	83 e8 42             	sub    $0x42,%eax
c0001e12:	0f b7 00             	movzwl (%eax),%eax
c0001e15:	66 d1 e8             	shr    %ax
c0001e18:	0f b7 c0             	movzwl %ax,%eax
c0001e1b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001e1e:	7c ae                	jl     c0001dce <print_hdinfo+0xa1>
c0001e20:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001e23:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001e26:	01 d0                	add    %edx,%eax
c0001e28:	c6 00 00             	movb   $0x0,(%eax)
c0001e2b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001e2f:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001e33:	0f 8e 67 ff ff ff    	jle    c0001da0 <print_hdinfo+0x73>
c0001e39:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e3c:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001e40:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001e44:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001e48:	66 c1 e8 08          	shr    $0x8,%ax
c0001e4c:	66 85 c0             	test   %ax,%ax
c0001e4f:	0f 95 c0             	setne  %al
c0001e52:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001e55:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001e5c:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001e62:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001e66:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001e6a:	75 15                	jne    c0001e81 <print_hdinfo+0x154>
c0001e6c:	83 ec 08             	sub    $0x8,%esp
c0001e6f:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001e72:	50                   	push   %eax
c0001e73:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001e76:	50                   	push   %eax
c0001e77:	e8 7a 8e 00 00       	call   c000acf6 <Strcpy>
c0001e7c:	83 c4 10             	add    $0x10,%esp
c0001e7f:	eb 13                	jmp    c0001e94 <print_hdinfo+0x167>
c0001e81:	83 ec 08             	sub    $0x8,%esp
c0001e84:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001e87:	50                   	push   %eax
c0001e88:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001e8b:	50                   	push   %eax
c0001e8c:	e8 65 8e 00 00       	call   c000acf6 <Strcpy>
c0001e91:	83 c4 10             	add    $0x10,%esp
c0001e94:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e97:	83 c0 7a             	add    $0x7a,%eax
c0001e9a:	0f b7 00             	movzwl (%eax),%eax
c0001e9d:	0f b7 d0             	movzwl %ax,%edx
c0001ea0:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ea3:	83 c0 78             	add    $0x78,%eax
c0001ea6:	0f b7 00             	movzwl (%eax),%eax
c0001ea9:	0f b7 c0             	movzwl %ax,%eax
c0001eac:	83 c0 10             	add    $0x10,%eax
c0001eaf:	89 c1                	mov    %eax,%ecx
c0001eb1:	d3 e2                	shl    %cl,%edx
c0001eb3:	89 d0                	mov    %edx,%eax
c0001eb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001eb8:	90                   	nop
c0001eb9:	c9                   	leave  
c0001eba:	c3                   	ret    

c0001ebb <print_dpt_entry>:
c0001ebb:	55                   	push   %ebp
c0001ebc:	89 e5                	mov    %esp,%ebp
c0001ebe:	83 ec 08             	sub    $0x8,%esp
c0001ec1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ec4:	8b 40 08             	mov    0x8(%eax),%eax
c0001ec7:	83 ec 08             	sub    $0x8,%esp
c0001eca:	50                   	push   %eax
c0001ecb:	68 de a1 00 c0       	push   $0xc000a1de
c0001ed0:	e8 fc 6d 00 00       	call   c0008cd1 <Printf>
c0001ed5:	83 c4 10             	add    $0x10,%esp
c0001ed8:	8b 45 08             	mov    0x8(%ebp),%eax
c0001edb:	8b 40 0c             	mov    0xc(%eax),%eax
c0001ede:	83 ec 08             	sub    $0x8,%esp
c0001ee1:	50                   	push   %eax
c0001ee2:	68 e6 a1 00 c0       	push   $0xc000a1e6
c0001ee7:	e8 e5 6d 00 00       	call   c0008cd1 <Printf>
c0001eec:	83 c4 10             	add    $0x10,%esp
c0001eef:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ef2:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001ef6:	0f b6 c0             	movzbl %al,%eax
c0001ef9:	83 ec 08             	sub    $0x8,%esp
c0001efc:	50                   	push   %eax
c0001efd:	68 f7 a1 00 c0       	push   $0xc000a1f7
c0001f02:	e8 ca 6d 00 00       	call   c0008cd1 <Printf>
c0001f07:	83 c4 10             	add    $0x10,%esp
c0001f0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f0d:	0f b6 00             	movzbl (%eax),%eax
c0001f10:	0f b6 c0             	movzbl %al,%eax
c0001f13:	83 ec 08             	sub    $0x8,%esp
c0001f16:	50                   	push   %eax
c0001f17:	68 05 a2 00 c0       	push   $0xc000a205
c0001f1c:	e8 b0 6d 00 00       	call   c0008cd1 <Printf>
c0001f21:	83 c4 10             	add    $0x10,%esp
c0001f24:	90                   	nop
c0001f25:	c9                   	leave  
c0001f26:	c3                   	ret    

c0001f27 <get_partition_table>:
c0001f27:	55                   	push   %ebp
c0001f28:	89 e5                	mov    %esp,%ebp
c0001f2a:	53                   	push   %ebx
c0001f2b:	83 ec 24             	sub    $0x24,%esp
c0001f2e:	89 e0                	mov    %esp,%eax
c0001f30:	89 c3                	mov    %eax,%ebx
c0001f32:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001f36:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f3d:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001f40:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f43:	c1 f8 08             	sar    $0x8,%eax
c0001f46:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001f49:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f4c:	c1 f8 10             	sar    $0x10,%eax
c0001f4f:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001f52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f55:	c1 f8 18             	sar    $0x18,%eax
c0001f58:	89 c2                	mov    %eax,%edx
c0001f5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f5d:	c1 e0 04             	shl    $0x4,%eax
c0001f60:	09 d0                	or     %edx,%eax
c0001f62:	83 c8 e0             	or     $0xffffffe0,%eax
c0001f65:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001f68:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001f6c:	83 ec 0c             	sub    $0xc,%esp
c0001f6f:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001f72:	50                   	push   %eax
c0001f73:	e8 fc fb ff ff       	call   c0001b74 <hd_cmd_out>
c0001f78:	83 c4 10             	add    $0x10,%esp
c0001f7b:	e8 79 03 00 00       	call   c00022f9 <interrupt_wait>
c0001f80:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001f87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f8a:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001f8d:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001f90:	89 c2                	mov    %eax,%edx
c0001f92:	b8 10 00 00 00       	mov    $0x10,%eax
c0001f97:	83 e8 01             	sub    $0x1,%eax
c0001f9a:	01 d0                	add    %edx,%eax
c0001f9c:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001fa1:	ba 00 00 00 00       	mov    $0x0,%edx
c0001fa6:	f7 f1                	div    %ecx
c0001fa8:	6b c0 10             	imul   $0x10,%eax,%eax
c0001fab:	29 c4                	sub    %eax,%esp
c0001fad:	89 e0                	mov    %esp,%eax
c0001faf:	83 c0 00             	add    $0x0,%eax
c0001fb2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001fb5:	83 ec 04             	sub    $0x4,%esp
c0001fb8:	ff 75 f4             	pushl  -0xc(%ebp)
c0001fbb:	6a 00                	push   $0x0
c0001fbd:	ff 75 ec             	pushl  -0x14(%ebp)
c0001fc0:	e8 12 8d 00 00       	call   c000acd7 <Memset>
c0001fc5:	83 c4 10             	add    $0x10,%esp
c0001fc8:	83 ec 04             	sub    $0x4,%esp
c0001fcb:	ff 75 f4             	pushl  -0xc(%ebp)
c0001fce:	ff 75 ec             	pushl  -0x14(%ebp)
c0001fd1:	68 f0 01 00 00       	push   $0x1f0
c0001fd6:	e8 50 8d 00 00       	call   c000ad2b <read_port>
c0001fdb:	83 c4 10             	add    $0x10,%esp
c0001fde:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001fe1:	05 be 01 00 00       	add    $0x1be,%eax
c0001fe6:	83 ec 04             	sub    $0x4,%esp
c0001fe9:	6a 40                	push   $0x40
c0001feb:	50                   	push   %eax
c0001fec:	ff 75 10             	pushl  0x10(%ebp)
c0001fef:	e8 b5 8c 00 00       	call   c000aca9 <Memcpy>
c0001ff4:	83 c4 10             	add    $0x10,%esp
c0001ff7:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001ffe:	89 dc                	mov    %ebx,%esp
c0002000:	90                   	nop
c0002001:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0002004:	c9                   	leave  
c0002005:	c3                   	ret    

c0002006 <partition>:
c0002006:	55                   	push   %ebp
c0002007:	89 e5                	mov    %esp,%ebp
c0002009:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000200f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002012:	88 45 84             	mov    %al,-0x7c(%ebp)
c0002015:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002019:	7f 19                	jg     c0002034 <partition+0x2e>
c000201b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000201e:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002023:	89 c8                	mov    %ecx,%eax
c0002025:	f7 ea                	imul   %edx
c0002027:	d1 fa                	sar    %edx
c0002029:	89 c8                	mov    %ecx,%eax
c000202b:	c1 f8 1f             	sar    $0x1f,%eax
c000202e:	29 c2                	sub    %eax,%edx
c0002030:	89 d0                	mov    %edx,%eax
c0002032:	eb 11                	jmp    c0002045 <partition+0x3f>
c0002034:	8b 45 08             	mov    0x8(%ebp),%eax
c0002037:	83 e8 10             	sub    $0x10,%eax
c000203a:	8d 50 3f             	lea    0x3f(%eax),%edx
c000203d:	85 c0                	test   %eax,%eax
c000203f:	0f 48 c2             	cmovs  %edx,%eax
c0002042:	c1 f8 06             	sar    $0x6,%eax
c0002045:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002048:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c000204c:	0f 85 cc 00 00 00    	jne    c000211e <partition+0x118>
c0002052:	83 ec 04             	sub    $0x4,%esp
c0002055:	6a 40                	push   $0x40
c0002057:	6a 00                	push   $0x0
c0002059:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000205c:	50                   	push   %eax
c000205d:	e8 75 8c 00 00       	call   c000acd7 <Memset>
c0002062:	83 c4 10             	add    $0x10,%esp
c0002065:	83 ec 04             	sub    $0x4,%esp
c0002068:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000206b:	50                   	push   %eax
c000206c:	6a 00                	push   $0x0
c000206e:	ff 75 e8             	pushl  -0x18(%ebp)
c0002071:	e8 b1 fe ff ff       	call   c0001f27 <get_partition_table>
c0002076:	83 c4 10             	add    $0x10,%esp
c0002079:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002080:	e9 8a 00 00 00       	jmp    c000210f <partition+0x109>
c0002085:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002088:	83 c0 01             	add    $0x1,%eax
c000208b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000208e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002091:	c1 e0 04             	shl    $0x4,%eax
c0002094:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002097:	01 c8                	add    %ecx,%eax
c0002099:	83 e8 5c             	sub    $0x5c,%eax
c000209c:	8b 00                	mov    (%eax),%eax
c000209e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00020a1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00020a4:	c1 e1 03             	shl    $0x3,%ecx
c00020a7:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00020ad:	01 ca                	add    %ecx,%edx
c00020af:	81 c2 64 1f 01 c0    	add    $0xc0011f64,%edx
c00020b5:	89 02                	mov    %eax,(%edx)
c00020b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00020ba:	c1 e0 04             	shl    $0x4,%eax
c00020bd:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00020c0:	01 c8                	add    %ecx,%eax
c00020c2:	83 e8 58             	sub    $0x58,%eax
c00020c5:	8b 00                	mov    (%eax),%eax
c00020c7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00020ca:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00020cd:	c1 e1 03             	shl    $0x3,%ecx
c00020d0:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00020d6:	01 ca                	add    %ecx,%edx
c00020d8:	81 c2 68 1f 01 c0    	add    $0xc0011f68,%edx
c00020de:	89 02                	mov    %eax,(%edx)
c00020e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00020e3:	c1 e0 04             	shl    $0x4,%eax
c00020e6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00020e9:	01 c8                	add    %ecx,%eax
c00020eb:	83 e8 60             	sub    $0x60,%eax
c00020ee:	0f b6 00             	movzbl (%eax),%eax
c00020f1:	3c 05                	cmp    $0x5,%al
c00020f3:	75 16                	jne    c000210b <partition+0x105>
c00020f5:	8b 55 08             	mov    0x8(%ebp),%edx
c00020f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00020fb:	01 d0                	add    %edx,%eax
c00020fd:	83 ec 08             	sub    $0x8,%esp
c0002100:	6a 01                	push   $0x1
c0002102:	50                   	push   %eax
c0002103:	e8 fe fe ff ff       	call   c0002006 <partition>
c0002108:	83 c4 10             	add    $0x10,%esp
c000210b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000210f:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002113:	0f 8e 6c ff ff ff    	jle    c0002085 <partition+0x7f>
c0002119:	e9 ff 00 00 00       	jmp    c000221d <partition+0x217>
c000211e:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0002122:	0f 85 f5 00 00 00    	jne    c000221d <partition+0x217>
c0002128:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000212b:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002130:	89 c8                	mov    %ecx,%eax
c0002132:	f7 ea                	imul   %edx
c0002134:	d1 fa                	sar    %edx
c0002136:	89 c8                	mov    %ecx,%eax
c0002138:	c1 f8 1f             	sar    $0x1f,%eax
c000213b:	29 c2                	sub    %eax,%edx
c000213d:	89 d0                	mov    %edx,%eax
c000213f:	c1 e0 02             	shl    $0x2,%eax
c0002142:	01 d0                	add    %edx,%eax
c0002144:	29 c1                	sub    %eax,%ecx
c0002146:	89 c8                	mov    %ecx,%eax
c0002148:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000214b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000214e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002151:	c1 e2 03             	shl    $0x3,%edx
c0002154:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000215a:	01 d0                	add    %edx,%eax
c000215c:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c0002161:	8b 00                	mov    (%eax),%eax
c0002163:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002166:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002169:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000216c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000216f:	83 e8 01             	sub    $0x1,%eax
c0002172:	c1 e0 04             	shl    $0x4,%eax
c0002175:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002178:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000217f:	e9 8c 00 00 00       	jmp    c0002210 <partition+0x20a>
c0002184:	83 ec 04             	sub    $0x4,%esp
c0002187:	6a 40                	push   $0x40
c0002189:	6a 00                	push   $0x0
c000218b:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000218e:	50                   	push   %eax
c000218f:	e8 43 8b 00 00       	call   c000acd7 <Memset>
c0002194:	83 c4 10             	add    $0x10,%esp
c0002197:	83 ec 04             	sub    $0x4,%esp
c000219a:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000219d:	50                   	push   %eax
c000219e:	ff 75 f0             	pushl  -0x10(%ebp)
c00021a1:	ff 75 e8             	pushl  -0x18(%ebp)
c00021a4:	e8 7e fd ff ff       	call   c0001f27 <get_partition_table>
c00021a9:	83 c4 10             	add    $0x10,%esp
c00021ac:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00021af:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00021b2:	01 d0                	add    %edx,%eax
c00021b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00021b7:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00021ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00021bd:	01 c2                	add    %eax,%edx
c00021bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00021c2:	8d 48 04             	lea    0x4(%eax),%ecx
c00021c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00021c8:	c1 e1 03             	shl    $0x3,%ecx
c00021cb:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021d1:	01 c8                	add    %ecx,%eax
c00021d3:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c00021d8:	89 10                	mov    %edx,(%eax)
c00021da:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00021dd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00021e0:	8d 4a 04             	lea    0x4(%edx),%ecx
c00021e3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021e6:	c1 e1 03             	shl    $0x3,%ecx
c00021e9:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021ef:	01 ca                	add    %ecx,%edx
c00021f1:	81 c2 68 1f 01 c0    	add    $0xc0011f68,%edx
c00021f7:	89 02                	mov    %eax,(%edx)
c00021f9:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c00021fd:	84 c0                	test   %al,%al
c00021ff:	74 1b                	je     c000221c <partition+0x216>
c0002201:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0002204:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002207:	01 d0                	add    %edx,%eax
c0002209:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000220c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002210:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0002214:	0f 8e 6a ff ff ff    	jle    c0002184 <partition+0x17e>
c000221a:	eb 01                	jmp    c000221d <partition+0x217>
c000221c:	90                   	nop
c000221d:	90                   	nop
c000221e:	c9                   	leave  
c000221f:	c3                   	ret    

c0002220 <hd_open>:
c0002220:	55                   	push   %ebp
c0002221:	89 e5                	mov    %esp,%ebp
c0002223:	83 ec 18             	sub    $0x18,%esp
c0002226:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000222d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002230:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002236:	05 60 1f 01 c0       	add    $0xc0011f60,%eax
c000223b:	8b 00                	mov    (%eax),%eax
c000223d:	8d 50 01             	lea    0x1(%eax),%edx
c0002240:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002243:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002249:	05 60 1f 01 c0       	add    $0xc0011f60,%eax
c000224e:	89 10                	mov    %edx,(%eax)
c0002250:	83 ec 0c             	sub    $0xc,%esp
c0002253:	6a 00                	push   $0x0
c0002255:	e8 1c fa ff ff       	call   c0001c76 <hd_identify>
c000225a:	83 c4 10             	add    $0x10,%esp
c000225d:	83 ec 08             	sub    $0x8,%esp
c0002260:	6a 00                	push   $0x0
c0002262:	6a 00                	push   $0x0
c0002264:	e8 9d fd ff ff       	call   c0002006 <partition>
c0002269:	83 c4 10             	add    $0x10,%esp
c000226c:	90                   	nop
c000226d:	c9                   	leave  
c000226e:	c3                   	ret    

c000226f <get_hd_ioctl>:
c000226f:	55                   	push   %ebp
c0002270:	89 e5                	mov    %esp,%ebp
c0002272:	83 ec 10             	sub    $0x10,%esp
c0002275:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002279:	7f 19                	jg     c0002294 <get_hd_ioctl+0x25>
c000227b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000227e:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002283:	89 c8                	mov    %ecx,%eax
c0002285:	f7 ea                	imul   %edx
c0002287:	d1 fa                	sar    %edx
c0002289:	89 c8                	mov    %ecx,%eax
c000228b:	c1 f8 1f             	sar    $0x1f,%eax
c000228e:	29 c2                	sub    %eax,%edx
c0002290:	89 d0                	mov    %edx,%eax
c0002292:	eb 11                	jmp    c00022a5 <get_hd_ioctl+0x36>
c0002294:	8b 45 08             	mov    0x8(%ebp),%eax
c0002297:	83 e8 10             	sub    $0x10,%eax
c000229a:	8d 50 3f             	lea    0x3f(%eax),%edx
c000229d:	85 c0                	test   %eax,%eax
c000229f:	0f 48 c2             	cmovs  %edx,%eax
c00022a2:	c1 f8 06             	sar    $0x6,%eax
c00022a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00022a8:	8b 55 08             	mov    0x8(%ebp),%edx
c00022ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00022ae:	c1 e2 03             	shl    $0x3,%edx
c00022b1:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022b7:	01 d0                	add    %edx,%eax
c00022b9:	05 68 1f 01 c0       	add    $0xc0011f68,%eax
c00022be:	8b 00                	mov    (%eax),%eax
c00022c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00022c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00022c6:	c9                   	leave  
c00022c7:	c3                   	ret    

c00022c8 <wait_for>:
c00022c8:	55                   	push   %ebp
c00022c9:	89 e5                	mov    %esp,%ebp
c00022cb:	83 ec 08             	sub    $0x8,%esp
c00022ce:	83 ec 04             	sub    $0x4,%esp
c00022d1:	68 40 42 0f 00       	push   $0xf4240
c00022d6:	6a 08                	push   $0x8
c00022d8:	6a 08                	push   $0x8
c00022da:	e8 97 02 00 00       	call   c0002576 <waitfor>
c00022df:	83 c4 10             	add    $0x10,%esp
c00022e2:	85 c0                	test   %eax,%eax
c00022e4:	75 10                	jne    c00022f6 <wait_for+0x2e>
c00022e6:	83 ec 0c             	sub    $0xc,%esp
c00022e9:	68 10 a2 00 c0       	push   $0xc000a210
c00022ee:	e8 13 6d 00 00       	call   c0009006 <panic>
c00022f3:	83 c4 10             	add    $0x10,%esp
c00022f6:	90                   	nop
c00022f7:	c9                   	leave  
c00022f8:	c3                   	ret    

c00022f9 <interrupt_wait>:
c00022f9:	55                   	push   %ebp
c00022fa:	89 e5                	mov    %esp,%ebp
c00022fc:	83 ec 78             	sub    $0x78,%esp
c00022ff:	83 ec 04             	sub    $0x4,%esp
c0002302:	68 13 02 00 00       	push   $0x213
c0002307:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000230a:	50                   	push   %eax
c000230b:	6a 02                	push   $0x2
c000230d:	e8 1d 75 00 00       	call   c000982f <send_rec>
c0002312:	83 c4 10             	add    $0x10,%esp
c0002315:	90                   	nop
c0002316:	c9                   	leave  
c0002317:	c3                   	ret    

c0002318 <hd_rdwt>:
c0002318:	55                   	push   %ebp
c0002319:	89 e5                	mov    %esp,%ebp
c000231b:	83 ec 48             	sub    $0x48,%esp
c000231e:	8b 45 08             	mov    0x8(%ebp),%eax
c0002321:	8b 40 18             	mov    0x18(%eax),%eax
c0002324:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002327:	8b 45 08             	mov    0x8(%ebp),%eax
c000232a:	8b 40 14             	mov    0x14(%eax),%eax
c000232d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002330:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002334:	7f 19                	jg     c000234f <hd_rdwt+0x37>
c0002336:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002339:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000233e:	89 c8                	mov    %ecx,%eax
c0002340:	f7 ea                	imul   %edx
c0002342:	d1 fa                	sar    %edx
c0002344:	89 c8                	mov    %ecx,%eax
c0002346:	c1 f8 1f             	sar    $0x1f,%eax
c0002349:	29 c2                	sub    %eax,%edx
c000234b:	89 d0                	mov    %edx,%eax
c000234d:	eb 11                	jmp    c0002360 <hd_rdwt+0x48>
c000234f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002352:	83 e8 10             	sub    $0x10,%eax
c0002355:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002358:	85 c0                	test   %eax,%eax
c000235a:	0f 48 c2             	cmovs  %edx,%eax
c000235d:	c1 f8 06             	sar    $0x6,%eax
c0002360:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002363:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002366:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002369:	89 d0                	mov    %edx,%eax
c000236b:	c1 f8 1f             	sar    $0x1f,%eax
c000236e:	c1 e8 1a             	shr    $0x1a,%eax
c0002371:	01 c2                	add    %eax,%edx
c0002373:	83 e2 3f             	and    $0x3f,%edx
c0002376:	29 c2                	sub    %eax,%edx
c0002378:	89 d0                	mov    %edx,%eax
c000237a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000237d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002380:	c1 e8 09             	shr    $0x9,%eax
c0002383:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002386:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c000238a:	7f 1a                	jg     c00023a6 <hd_rdwt+0x8e>
c000238c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000238f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002392:	c1 e2 03             	shl    $0x3,%edx
c0002395:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000239b:	01 d0                	add    %edx,%eax
c000239d:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c00023a2:	8b 00                	mov    (%eax),%eax
c00023a4:	eb 1b                	jmp    c00023c1 <hd_rdwt+0xa9>
c00023a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00023a9:	8d 50 04             	lea    0x4(%eax),%edx
c00023ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00023af:	c1 e2 03             	shl    $0x3,%edx
c00023b2:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00023b8:	01 d0                	add    %edx,%eax
c00023ba:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c00023bf:	8b 00                	mov    (%eax),%eax
c00023c1:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00023c4:	01 d0                	add    %edx,%eax
c00023c6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00023c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00023cc:	8b 40 0c             	mov    0xc(%eax),%eax
c00023cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00023d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00023d5:	05 ff 01 00 00       	add    $0x1ff,%eax
c00023da:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00023e0:	85 c0                	test   %eax,%eax
c00023e2:	0f 48 c2             	cmovs  %edx,%eax
c00023e5:	c1 f8 09             	sar    $0x9,%eax
c00023e8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00023eb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00023ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00023f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00023f4:	8b 40 10             	mov    0x10(%eax),%eax
c00023f7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00023fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00023fd:	8b 00                	mov    (%eax),%eax
c00023ff:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002402:	83 ec 08             	sub    $0x8,%esp
c0002405:	ff 75 d0             	pushl  -0x30(%ebp)
c0002408:	ff 75 cc             	pushl  -0x34(%ebp)
c000240b:	e8 1d 26 00 00       	call   c0004a2d <v2l>
c0002410:	83 c4 10             	add    $0x10,%esp
c0002413:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002416:	8b 45 08             	mov    0x8(%ebp),%eax
c0002419:	8b 40 68             	mov    0x68(%eax),%eax
c000241c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000241f:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002423:	74 22                	je     c0002447 <hd_rdwt+0x12f>
c0002425:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002429:	74 1c                	je     c0002447 <hd_rdwt+0x12f>
c000242b:	68 9c 01 00 00       	push   $0x19c
c0002430:	68 22 a2 00 c0       	push   $0xc000a222
c0002435:	68 22 a2 00 c0       	push   $0xc000a222
c000243a:	68 2a a2 00 c0       	push   $0xc000a22a
c000243f:	e8 e0 6b 00 00       	call   c0009024 <assertion_failure>
c0002444:	83 c4 10             	add    $0x10,%esp
c0002447:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c000244b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000244e:	88 45 be             	mov    %al,-0x42(%ebp)
c0002451:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002454:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002457:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000245a:	c1 f8 08             	sar    $0x8,%eax
c000245d:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002460:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002463:	c1 f8 10             	sar    $0x10,%eax
c0002466:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002469:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000246c:	c1 f8 18             	sar    $0x18,%eax
c000246f:	83 e0 0f             	and    $0xf,%eax
c0002472:	83 c8 e0             	or     $0xffffffe0,%eax
c0002475:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002478:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000247c:	75 07                	jne    c0002485 <hd_rdwt+0x16d>
c000247e:	b8 20 00 00 00       	mov    $0x20,%eax
c0002483:	eb 05                	jmp    c000248a <hd_rdwt+0x172>
c0002485:	b8 30 00 00 00       	mov    $0x30,%eax
c000248a:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000248d:	83 ec 0c             	sub    $0xc,%esp
c0002490:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0002493:	50                   	push   %eax
c0002494:	e8 db f6 ff ff       	call   c0001b74 <hd_cmd_out>
c0002499:	83 c4 10             	add    $0x10,%esp
c000249c:	e9 9c 00 00 00       	jmp    c000253d <hd_rdwt+0x225>
c00024a1:	b8 00 02 00 00       	mov    $0x200,%eax
c00024a6:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00024ad:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00024b1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00024b4:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00024b8:	75 51                	jne    c000250b <hd_rdwt+0x1f3>
c00024ba:	e8 09 fe ff ff       	call   c00022c8 <wait_for>
c00024bf:	e8 35 fe ff ff       	call   c00022f9 <interrupt_wait>
c00024c4:	83 ec 04             	sub    $0x4,%esp
c00024c7:	ff 75 c4             	pushl  -0x3c(%ebp)
c00024ca:	6a 00                	push   $0x0
c00024cc:	68 a0 21 01 c0       	push   $0xc00121a0
c00024d1:	e8 01 88 00 00       	call   c000acd7 <Memset>
c00024d6:	83 c4 10             	add    $0x10,%esp
c00024d9:	83 ec 04             	sub    $0x4,%esp
c00024dc:	68 00 02 00 00       	push   $0x200
c00024e1:	68 a0 21 01 c0       	push   $0xc00121a0
c00024e6:	68 f0 01 00 00       	push   $0x1f0
c00024eb:	e8 3b 88 00 00       	call   c000ad2b <read_port>
c00024f0:	83 c4 10             	add    $0x10,%esp
c00024f3:	83 ec 04             	sub    $0x4,%esp
c00024f6:	ff 75 c4             	pushl  -0x3c(%ebp)
c00024f9:	68 a0 21 01 c0       	push   $0xc00121a0
c00024fe:	ff 75 f0             	pushl  -0x10(%ebp)
c0002501:	e8 a3 87 00 00       	call   c000aca9 <Memcpy>
c0002506:	83 c4 10             	add    $0x10,%esp
c0002509:	eb 26                	jmp    c0002531 <hd_rdwt+0x219>
c000250b:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000250f:	75 20                	jne    c0002531 <hd_rdwt+0x219>
c0002511:	e8 b2 fd ff ff       	call   c00022c8 <wait_for>
c0002516:	83 ec 04             	sub    $0x4,%esp
c0002519:	ff 75 c4             	pushl  -0x3c(%ebp)
c000251c:	ff 75 f0             	pushl  -0x10(%ebp)
c000251f:	68 f0 01 00 00       	push   $0x1f0
c0002524:	e8 16 88 00 00       	call   c000ad3f <write_port>
c0002529:	83 c4 10             	add    $0x10,%esp
c000252c:	e8 c8 fd ff ff       	call   c00022f9 <interrupt_wait>
c0002531:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002534:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002537:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000253a:	01 45 f0             	add    %eax,-0x10(%ebp)
c000253d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002541:	0f 85 5a ff ff ff    	jne    c00024a1 <hd_rdwt+0x189>
c0002547:	90                   	nop
c0002548:	c9                   	leave  
c0002549:	c3                   	ret    

c000254a <hd_handler>:
c000254a:	55                   	push   %ebp
c000254b:	89 e5                	mov    %esp,%ebp
c000254d:	83 ec 18             	sub    $0x18,%esp
c0002550:	83 ec 0c             	sub    $0xc,%esp
c0002553:	68 f7 01 00 00       	push   $0x1f7
c0002558:	e8 2a f2 ff ff       	call   c0001787 <in_byte>
c000255d:	83 c4 10             	add    $0x10,%esp
c0002560:	0f b6 c0             	movzbl %al,%eax
c0002563:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002566:	83 ec 0c             	sub    $0xc,%esp
c0002569:	6a 02                	push   $0x2
c000256b:	e8 4e 75 00 00       	call   c0009abe <inform_int>
c0002570:	83 c4 10             	add    $0x10,%esp
c0002573:	90                   	nop
c0002574:	c9                   	leave  
c0002575:	c3                   	ret    

c0002576 <waitfor>:
c0002576:	55                   	push   %ebp
c0002577:	89 e5                	mov    %esp,%ebp
c0002579:	83 ec 18             	sub    $0x18,%esp
c000257c:	e8 36 74 00 00       	call   c00099b7 <get_ticks_ipc>
c0002581:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002584:	eb 22                	jmp    c00025a8 <waitfor+0x32>
c0002586:	83 ec 0c             	sub    $0xc,%esp
c0002589:	68 f7 01 00 00       	push   $0x1f7
c000258e:	e8 f4 f1 ff ff       	call   c0001787 <in_byte>
c0002593:	83 c4 10             	add    $0x10,%esp
c0002596:	0f b6 c0             	movzbl %al,%eax
c0002599:	23 45 08             	and    0x8(%ebp),%eax
c000259c:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000259f:	75 07                	jne    c00025a8 <waitfor+0x32>
c00025a1:	b8 01 00 00 00       	mov    $0x1,%eax
c00025a6:	eb 1d                	jmp    c00025c5 <waitfor+0x4f>
c00025a8:	e8 0a 74 00 00       	call   c00099b7 <get_ticks_ipc>
c00025ad:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00025b0:	89 c2                	mov    %eax,%edx
c00025b2:	89 d0                	mov    %edx,%eax
c00025b4:	c1 e0 02             	shl    $0x2,%eax
c00025b7:	01 d0                	add    %edx,%eax
c00025b9:	01 c0                	add    %eax,%eax
c00025bb:	39 45 10             	cmp    %eax,0x10(%ebp)
c00025be:	7f c6                	jg     c0002586 <waitfor+0x10>
c00025c0:	b8 00 00 00 00       	mov    $0x0,%eax
c00025c5:	c9                   	leave  
c00025c6:	c3                   	ret    

c00025c7 <print_hd_info>:
c00025c7:	55                   	push   %ebp
c00025c8:	89 e5                	mov    %esp,%ebp
c00025ca:	83 ec 18             	sub    $0x18,%esp
c00025cd:	83 ec 0c             	sub    $0xc,%esp
c00025d0:	68 48 a2 00 c0       	push   $0xc000a248
c00025d5:	e8 f7 66 00 00       	call   c0008cd1 <Printf>
c00025da:	83 c4 10             	add    $0x10,%esp
c00025dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00025e4:	eb 3b                	jmp    c0002621 <print_hd_info+0x5a>
c00025e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025e9:	8b 04 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%eax
c00025f0:	85 c0                	test   %eax,%eax
c00025f2:	74 28                	je     c000261c <print_hd_info+0x55>
c00025f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025f7:	8b 14 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%edx
c00025fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002601:	8b 04 c5 64 1f 01 c0 	mov    -0x3ffee09c(,%eax,8),%eax
c0002608:	ff 75 f4             	pushl  -0xc(%ebp)
c000260b:	52                   	push   %edx
c000260c:	50                   	push   %eax
c000260d:	68 65 a2 00 c0       	push   $0xc000a265
c0002612:	e8 ba 66 00 00       	call   c0008cd1 <Printf>
c0002617:	83 c4 10             	add    $0x10,%esp
c000261a:	eb 01                	jmp    c000261d <print_hd_info+0x56>
c000261c:	90                   	nop
c000261d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002621:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002625:	7e bf                	jle    c00025e6 <print_hd_info+0x1f>
c0002627:	83 ec 0c             	sub    $0xc,%esp
c000262a:	68 7d a2 00 c0       	push   $0xc000a27d
c000262f:	e8 9d 66 00 00       	call   c0008cd1 <Printf>
c0002634:	83 c4 10             	add    $0x10,%esp
c0002637:	83 ec 0c             	sub    $0xc,%esp
c000263a:	68 98 a2 00 c0       	push   $0xc000a298
c000263f:	e8 8d 66 00 00       	call   c0008cd1 <Printf>
c0002644:	83 c4 10             	add    $0x10,%esp
c0002647:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c000264e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002655:	eb 44                	jmp    c000269b <print_hd_info+0xd4>
c0002657:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000265a:	83 c0 04             	add    $0x4,%eax
c000265d:	8b 04 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%eax
c0002664:	85 c0                	test   %eax,%eax
c0002666:	74 2e                	je     c0002696 <print_hd_info+0xcf>
c0002668:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000266b:	83 c0 04             	add    $0x4,%eax
c000266e:	8b 14 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%edx
c0002675:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002678:	83 c0 04             	add    $0x4,%eax
c000267b:	8b 04 c5 64 1f 01 c0 	mov    -0x3ffee09c(,%eax,8),%eax
c0002682:	ff 75 f0             	pushl  -0x10(%ebp)
c0002685:	52                   	push   %edx
c0002686:	50                   	push   %eax
c0002687:	68 65 a2 00 c0       	push   $0xc000a265
c000268c:	e8 40 66 00 00       	call   c0008cd1 <Printf>
c0002691:	83 c4 10             	add    $0x10,%esp
c0002694:	eb 01                	jmp    c0002697 <print_hd_info+0xd0>
c0002696:	90                   	nop
c0002697:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000269b:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000269f:	7e b6                	jle    c0002657 <print_hd_info+0x90>
c00026a1:	83 ec 0c             	sub    $0xc,%esp
c00026a4:	68 b5 a2 00 c0       	push   $0xc000a2b5
c00026a9:	e8 23 66 00 00       	call   c0008cd1 <Printf>
c00026ae:	83 c4 10             	add    $0x10,%esp
c00026b1:	90                   	nop
c00026b2:	c9                   	leave  
c00026b3:	c3                   	ret    

c00026b4 <is_empty>:
c00026b4:	55                   	push   %ebp
c00026b5:	89 e5                	mov    %esp,%ebp
c00026b7:	83 ec 10             	sub    $0x10,%esp
c00026ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00026c1:	eb 1a                	jmp    c00026dd <is_empty+0x29>
c00026c3:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00026c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00026c9:	01 d0                	add    %edx,%eax
c00026cb:	0f b6 00             	movzbl (%eax),%eax
c00026ce:	84 c0                	test   %al,%al
c00026d0:	74 07                	je     c00026d9 <is_empty+0x25>
c00026d2:	b8 00 00 00 00       	mov    $0x0,%eax
c00026d7:	eb 11                	jmp    c00026ea <is_empty+0x36>
c00026d9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00026dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00026e0:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00026e3:	7c de                	jl     c00026c3 <is_empty+0xf>
c00026e5:	b8 01 00 00 00       	mov    $0x1,%eax
c00026ea:	c9                   	leave  
c00026eb:	c3                   	ret    
c00026ec:	66 90                	xchg   %ax,%ax
c00026ee:	66 90                	xchg   %ax,%ax

c00026f0 <get_ticks>:
c00026f0:	b8 00 00 00 00       	mov    $0x0,%eax
c00026f5:	cd 90                	int    $0x90
c00026f7:	c3                   	ret    

c00026f8 <write2>:
c00026f8:	b8 01 00 00 00       	mov    $0x1,%eax
c00026fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002701:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002705:	cd 90                	int    $0x90
c0002707:	c3                   	ret    

c0002708 <write_debug>:
c0002708:	b8 02 00 00 00       	mov    $0x2,%eax
c000270d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002711:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002715:	cd 90                	int    $0x90
c0002717:	c3                   	ret    

c0002718 <send_msg2>:
c0002718:	b8 03 00 00 00       	mov    $0x3,%eax
c000271d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002721:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002725:	cd 90                	int    $0x90
c0002727:	c3                   	ret    

c0002728 <send_msg>:
c0002728:	55                   	push   %ebp
c0002729:	89 e5                	mov    %esp,%ebp
c000272b:	53                   	push   %ebx
c000272c:	51                   	push   %ecx
c000272d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002732:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002735:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002738:	cd 90                	int    $0x90
c000273a:	59                   	pop    %ecx
c000273b:	5b                   	pop    %ebx
c000273c:	5d                   	pop    %ebp
c000273d:	c3                   	ret    

c000273e <receive_msg2>:
c000273e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002743:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002747:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000274b:	cd 90                	int    $0x90
c000274d:	c3                   	ret    

c000274e <receive_msg>:
c000274e:	55                   	push   %ebp
c000274f:	89 e5                	mov    %esp,%ebp
c0002751:	53                   	push   %ebx
c0002752:	51                   	push   %ecx
c0002753:	b8 04 00 00 00       	mov    $0x4,%eax
c0002758:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000275b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000275e:	cd 90                	int    $0x90
c0002760:	59                   	pop    %ecx
c0002761:	5b                   	pop    %ebx
c0002762:	5d                   	pop    %ebp
c0002763:	c3                   	ret    

c0002764 <task_fs>:
c0002764:	55                   	push   %ebp
c0002765:	89 e5                	mov    %esp,%ebp
c0002767:	83 ec 38             	sub    $0x38,%esp
c000276a:	83 ec 0c             	sub    $0xc,%esp
c000276d:	68 d4 a2 00 c0       	push   $0xc000a2d4
c0002772:	e8 15 ee ff ff       	call   c000158c <disp_str>
c0002777:	83 c4 10             	add    $0x10,%esp
c000277a:	e8 12 f1 ff ff       	call   c0001891 <get_running_thread_pcb>
c000277f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002782:	83 ec 0c             	sub    $0xc,%esp
c0002785:	68 dd a2 00 c0       	push   $0xc000a2dd
c000278a:	e8 fd ed ff ff       	call   c000158c <disp_str>
c000278f:	83 c4 10             	add    $0x10,%esp
c0002792:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002795:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c000279b:	83 ec 0c             	sub    $0xc,%esp
c000279e:	50                   	push   %eax
c000279f:	e8 83 50 00 00       	call   c0007827 <disp_int>
c00027a4:	83 c4 10             	add    $0x10,%esp
c00027a7:	83 ec 0c             	sub    $0xc,%esp
c00027aa:	68 df a2 00 c0       	push   $0xc000a2df
c00027af:	e8 d8 ed ff ff       	call   c000158c <disp_str>
c00027b4:	83 c4 10             	add    $0x10,%esp
c00027b7:	83 ec 0c             	sub    $0xc,%esp
c00027ba:	68 e1 a2 00 c0       	push   $0xc000a2e1
c00027bf:	e8 c8 ed ff ff       	call   c000158c <disp_str>
c00027c4:	83 c4 10             	add    $0x10,%esp
c00027c7:	83 ec 0c             	sub    $0xc,%esp
c00027ca:	6a 6c                	push   $0x6c
c00027cc:	e8 e2 44 00 00       	call   c0006cb3 <sys_malloc>
c00027d1:	83 c4 10             	add    $0x10,%esp
c00027d4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00027d7:	83 ec 0c             	sub    $0xc,%esp
c00027da:	6a 6c                	push   $0x6c
c00027dc:	e8 d2 44 00 00       	call   c0006cb3 <sys_malloc>
c00027e1:	83 c4 10             	add    $0x10,%esp
c00027e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00027e7:	83 ec 04             	sub    $0x4,%esp
c00027ea:	6a 6c                	push   $0x6c
c00027ec:	6a 00                	push   $0x0
c00027ee:	ff 75 e8             	pushl  -0x18(%ebp)
c00027f1:	e8 e1 84 00 00       	call   c000acd7 <Memset>
c00027f6:	83 c4 10             	add    $0x10,%esp
c00027f9:	83 ec 04             	sub    $0x4,%esp
c00027fc:	6a 0e                	push   $0xe
c00027fe:	ff 75 e8             	pushl  -0x18(%ebp)
c0002801:	6a 02                	push   $0x2
c0002803:	e8 27 70 00 00       	call   c000982f <send_rec>
c0002808:	83 c4 10             	add    $0x10,%esp
c000280b:	83 ec 0c             	sub    $0xc,%esp
c000280e:	68 e3 a2 00 c0       	push   $0xc000a2e3
c0002813:	e8 74 ed ff ff       	call   c000158c <disp_str>
c0002818:	83 c4 10             	add    $0x10,%esp
c000281b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000281e:	8b 40 68             	mov    0x68(%eax),%eax
c0002821:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002824:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002827:	8b 00                	mov    (%eax),%eax
c0002829:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000282c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000282f:	8b 40 40             	mov    0x40(%eax),%eax
c0002832:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002835:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002838:	8b 40 58             	mov    0x58(%eax),%eax
c000283b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000283e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002841:	8b 00                	mov    (%eax),%eax
c0002843:	85 c0                	test   %eax,%eax
c0002845:	75 07                	jne    c000284e <task_fs+0xea>
c0002847:	c7 45 d0 05 00 00 00 	movl   $0x5,-0x30(%ebp)
c000284e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002851:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0002857:	05 e0 32 08 c0       	add    $0xc00832e0,%eax
c000285c:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0002861:	83 ec 0c             	sub    $0xc,%esp
c0002864:	68 fd a2 00 c0       	push   $0xc000a2fd
c0002869:	e8 1e ed ff ff       	call   c000158c <disp_str>
c000286e:	83 c4 10             	add    $0x10,%esp
c0002871:	83 ec 0c             	sub    $0xc,%esp
c0002874:	68 18 a3 00 c0       	push   $0xc000a318
c0002879:	e8 0e ed ff ff       	call   c000158c <disp_str>
c000287e:	83 c4 10             	add    $0x10,%esp
c0002881:	83 ec 0c             	sub    $0xc,%esp
c0002884:	68 dd a2 00 c0       	push   $0xc000a2dd
c0002889:	e8 fe ec ff ff       	call   c000158c <disp_str>
c000288e:	83 c4 10             	add    $0x10,%esp
c0002891:	83 ec 0c             	sub    $0xc,%esp
c0002894:	ff 75 e0             	pushl  -0x20(%ebp)
c0002897:	e8 8b 4f 00 00       	call   c0007827 <disp_int>
c000289c:	83 c4 10             	add    $0x10,%esp
c000289f:	83 ec 0c             	sub    $0xc,%esp
c00028a2:	68 df a2 00 c0       	push   $0xc000a2df
c00028a7:	e8 e0 ec ff ff       	call   c000158c <disp_str>
c00028ac:	83 c4 10             	add    $0x10,%esp
c00028af:	83 ec 0c             	sub    $0xc,%esp
c00028b2:	68 e1 a2 00 c0       	push   $0xc000a2e1
c00028b7:	e8 d0 ec ff ff       	call   c000158c <disp_str>
c00028bc:	83 c4 10             	add    $0x10,%esp
c00028bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00028c6:	83 7d e0 06          	cmpl   $0x6,-0x20(%ebp)
c00028ca:	74 1c                	je     c00028e8 <task_fs+0x184>
c00028cc:	83 7d e0 06          	cmpl   $0x6,-0x20(%ebp)
c00028d0:	7f 08                	jg     c00028da <task_fs+0x176>
c00028d2:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c00028d6:	74 3b                	je     c0002913 <task_fs+0x1af>
c00028d8:	eb 49                	jmp    c0002923 <task_fs+0x1bf>
c00028da:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00028de:	74 20                	je     c0002900 <task_fs+0x19c>
c00028e0:	83 7d e0 0a          	cmpl   $0xa,-0x20(%ebp)
c00028e4:	74 1a                	je     c0002900 <task_fs+0x19c>
c00028e6:	eb 3b                	jmp    c0002923 <task_fs+0x1bf>
c00028e8:	83 ec 0c             	sub    $0xc,%esp
c00028eb:	ff 75 e8             	pushl  -0x18(%ebp)
c00028ee:	e8 29 07 00 00       	call   c000301c <do_open>
c00028f3:	83 c4 10             	add    $0x10,%esp
c00028f6:	89 c2                	mov    %eax,%edx
c00028f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00028fb:	89 50 40             	mov    %edx,0x40(%eax)
c00028fe:	eb 34                	jmp    c0002934 <task_fs+0x1d0>
c0002900:	83 ec 0c             	sub    $0xc,%esp
c0002903:	ff 75 e8             	pushl  -0x18(%ebp)
c0002906:	e8 4f 18 00 00       	call   c000415a <do_rdwt>
c000290b:	83 c4 10             	add    $0x10,%esp
c000290e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002911:	eb 21                	jmp    c0002934 <task_fs+0x1d0>
c0002913:	83 ec 0c             	sub    $0xc,%esp
c0002916:	ff 75 d8             	pushl  -0x28(%ebp)
c0002919:	e8 41 1d 00 00       	call   c000465f <do_close>
c000291e:	83 c4 10             	add    $0x10,%esp
c0002921:	eb 11                	jmp    c0002934 <task_fs+0x1d0>
c0002923:	83 ec 0c             	sub    $0xc,%esp
c0002926:	68 20 a3 00 c0       	push   $0xc000a320
c000292b:	e8 d6 66 00 00       	call   c0009006 <panic>
c0002930:	83 c4 10             	add    $0x10,%esp
c0002933:	90                   	nop
c0002934:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002937:	8b 40 68             	mov    0x68(%eax),%eax
c000293a:	83 f8 67             	cmp    $0x67,%eax
c000293d:	74 38                	je     c0002977 <task_fs+0x213>
c000293f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002942:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002945:	83 7d e0 66          	cmpl   $0x66,-0x20(%ebp)
c0002949:	75 06                	jne    c0002951 <task_fs+0x1ed>
c000294b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000294e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002951:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002954:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000295b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000295e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002961:	89 50 50             	mov    %edx,0x50(%eax)
c0002964:	83 ec 04             	sub    $0x4,%esp
c0002967:	ff 75 f0             	pushl  -0x10(%ebp)
c000296a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000296d:	6a 01                	push   $0x1
c000296f:	e8 bb 6e 00 00       	call   c000982f <send_rec>
c0002974:	83 c4 10             	add    $0x10,%esp
c0002977:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c000297c:	83 c0 01             	add    $0x1,%eax
c000297f:	a3 20 f7 00 c0       	mov    %eax,0xc000f720
c0002984:	e9 5e fe ff ff       	jmp    c00027e7 <task_fs+0x83>

c0002989 <rd_wt>:
c0002989:	55                   	push   %ebp
c000298a:	89 e5                	mov    %esp,%ebp
c000298c:	83 ec 78             	sub    $0x78,%esp
c000298f:	83 ec 04             	sub    $0x4,%esp
c0002992:	6a 6c                	push   $0x6c
c0002994:	6a 00                	push   $0x0
c0002996:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0002999:	50                   	push   %eax
c000299a:	e8 38 83 00 00       	call   c000acd7 <Memset>
c000299f:	83 c4 10             	add    $0x10,%esp
c00029a2:	8b 45 18             	mov    0x18(%ebp),%eax
c00029a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00029a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00029ab:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00029ae:	8b 45 10             	mov    0x10(%ebp),%eax
c00029b1:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00029b4:	8b 45 14             	mov    0x14(%ebp),%eax
c00029b7:	89 45 98             	mov    %eax,-0x68(%ebp)
c00029ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00029bd:	c1 e0 09             	shl    $0x9,%eax
c00029c0:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00029c3:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c00029c7:	74 22                	je     c00029eb <rd_wt+0x62>
c00029c9:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c00029cd:	74 1c                	je     c00029eb <rd_wt+0x62>
c00029cf:	68 e0 00 00 00       	push   $0xe0
c00029d4:	68 33 a3 00 c0       	push   $0xc000a333
c00029d9:	68 33 a3 00 c0       	push   $0xc000a333
c00029de:	68 40 a3 00 c0       	push   $0xc000a340
c00029e3:	e8 3c 66 00 00       	call   c0009024 <assertion_failure>
c00029e8:	83 c4 10             	add    $0x10,%esp
c00029eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00029ee:	83 f8 07             	cmp    $0x7,%eax
c00029f1:	74 24                	je     c0002a17 <rd_wt+0x8e>
c00029f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00029f6:	83 f8 0a             	cmp    $0xa,%eax
c00029f9:	74 1c                	je     c0002a17 <rd_wt+0x8e>
c00029fb:	68 e1 00 00 00       	push   $0xe1
c0002a00:	68 33 a3 00 c0       	push   $0xc000a333
c0002a05:	68 33 a3 00 c0       	push   $0xc000a333
c0002a0a:	68 60 a3 00 c0       	push   $0xc000a360
c0002a0f:	e8 10 66 00 00       	call   c0009024 <assertion_failure>
c0002a14:	83 c4 10             	add    $0x10,%esp
c0002a17:	83 ec 04             	sub    $0x4,%esp
c0002a1a:	6a 04                	push   $0x4
c0002a1c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0002a1f:	50                   	push   %eax
c0002a20:	6a 03                	push   $0x3
c0002a22:	e8 08 6e 00 00       	call   c000982f <send_rec>
c0002a27:	83 c4 10             	add    $0x10,%esp
c0002a2a:	90                   	nop
c0002a2b:	c9                   	leave  
c0002a2c:	c3                   	ret    

c0002a2d <mkfs>:
c0002a2d:	55                   	push   %ebp
c0002a2e:	89 e5                	mov    %esp,%ebp
c0002a30:	57                   	push   %edi
c0002a31:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002a37:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002a3c:	83 ec 04             	sub    $0x4,%esp
c0002a3f:	68 00 02 00 00       	push   $0x200
c0002a44:	6a 00                	push   $0x0
c0002a46:	50                   	push   %eax
c0002a47:	e8 8b 82 00 00       	call   c000acd7 <Memset>
c0002a4c:	83 c4 10             	add    $0x10,%esp
c0002a4f:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002a54:	83 ec 0c             	sub    $0xc,%esp
c0002a57:	6a 0a                	push   $0xa
c0002a59:	68 00 02 00 00       	push   $0x200
c0002a5e:	50                   	push   %eax
c0002a5f:	6a 20                	push   $0x20
c0002a61:	6a 00                	push   $0x0
c0002a63:	e8 21 ff ff ff       	call   c0002989 <rd_wt>
c0002a68:	83 c4 20             	add    $0x20,%esp
c0002a6b:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002a70:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002a73:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a76:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002a7d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a80:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002a87:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a8a:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002a91:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a94:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002a9b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a9e:	8b 40 04             	mov    0x4(%eax),%eax
c0002aa1:	8d 50 02             	lea    0x2(%eax),%edx
c0002aa4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002aa7:	8b 40 08             	mov    0x8(%eax),%eax
c0002aaa:	01 c2                	add    %eax,%edx
c0002aac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002aaf:	8b 40 0c             	mov    0xc(%eax),%eax
c0002ab2:	01 c2                	add    %eax,%edx
c0002ab4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002ab7:	89 10                	mov    %edx,(%eax)
c0002ab9:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002ac0:	b8 00 02 00 00       	mov    $0x200,%eax
c0002ac5:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002ac8:	8b 0d 20 e0 00 c0    	mov    0xc000e020,%ecx
c0002ace:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002ad1:	01 ca                	add    %ecx,%edx
c0002ad3:	83 ec 04             	sub    $0x4,%esp
c0002ad6:	50                   	push   %eax
c0002ad7:	6a 80                	push   $0xffffff80
c0002ad9:	52                   	push   %edx
c0002ada:	e8 f8 81 00 00       	call   c000acd7 <Memset>
c0002adf:	83 c4 10             	add    $0x10,%esp
c0002ae2:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002ae7:	83 ec 0c             	sub    $0xc,%esp
c0002aea:	6a 0a                	push   $0xa
c0002aec:	68 00 02 00 00       	push   $0x200
c0002af1:	50                   	push   %eax
c0002af2:	6a 20                	push   $0x20
c0002af4:	6a 01                	push   $0x1
c0002af6:	e8 8e fe ff ff       	call   c0002989 <rd_wt>
c0002afb:	83 c4 20             	add    $0x20,%esp
c0002afe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b01:	8b 10                	mov    (%eax),%edx
c0002b03:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002b06:	8b 50 04             	mov    0x4(%eax),%edx
c0002b09:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002b0c:	8b 50 08             	mov    0x8(%eax),%edx
c0002b0f:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002b12:	8b 50 0c             	mov    0xc(%eax),%edx
c0002b15:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002b18:	8b 50 10             	mov    0x10(%eax),%edx
c0002b1b:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002b1e:	8b 50 14             	mov    0x14(%eax),%edx
c0002b21:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002b24:	8b 50 18             	mov    0x18(%eax),%edx
c0002b27:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002b2a:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002b2d:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002b30:	8b 40 20             	mov    0x20(%eax),%eax
c0002b33:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002b36:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002b3a:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002b3e:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002b43:	83 ec 04             	sub    $0x4,%esp
c0002b46:	6a 01                	push   $0x1
c0002b48:	52                   	push   %edx
c0002b49:	50                   	push   %eax
c0002b4a:	e8 88 81 00 00       	call   c000acd7 <Memset>
c0002b4f:	83 c4 10             	add    $0x10,%esp
c0002b52:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002b57:	83 c0 01             	add    $0x1,%eax
c0002b5a:	83 ec 04             	sub    $0x4,%esp
c0002b5d:	68 ff 01 00 00       	push   $0x1ff
c0002b62:	6a 80                	push   $0xffffff80
c0002b64:	50                   	push   %eax
c0002b65:	e8 6d 81 00 00       	call   c000acd7 <Memset>
c0002b6a:	83 c4 10             	add    $0x10,%esp
c0002b6d:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002b72:	83 ec 0c             	sub    $0xc,%esp
c0002b75:	6a 0a                	push   $0xa
c0002b77:	68 00 02 00 00       	push   $0x200
c0002b7c:	50                   	push   %eax
c0002b7d:	6a 20                	push   $0x20
c0002b7f:	6a 02                	push   $0x2
c0002b81:	e8 03 fe ff ff       	call   c0002989 <rd_wt>
c0002b86:	83 c4 20             	add    $0x20,%esp
c0002b89:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002b90:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002b95:	83 ec 04             	sub    $0x4,%esp
c0002b98:	68 00 02 00 00       	push   $0x200
c0002b9d:	6a ff                	push   $0xffffffff
c0002b9f:	50                   	push   %eax
c0002ba0:	e8 32 81 00 00       	call   c000acd7 <Memset>
c0002ba5:	83 c4 10             	add    $0x10,%esp
c0002ba8:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002bad:	83 ec 0c             	sub    $0xc,%esp
c0002bb0:	6a 0a                	push   $0xa
c0002bb2:	68 00 02 00 00       	push   $0x200
c0002bb7:	50                   	push   %eax
c0002bb8:	6a 20                	push   $0x20
c0002bba:	ff 75 d0             	pushl  -0x30(%ebp)
c0002bbd:	e8 c7 fd ff ff       	call   c0002989 <rd_wt>
c0002bc2:	83 c4 20             	add    $0x20,%esp
c0002bc5:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002bca:	83 ec 04             	sub    $0x4,%esp
c0002bcd:	6a 01                	push   $0x1
c0002bcf:	6a 01                	push   $0x1
c0002bd1:	50                   	push   %eax
c0002bd2:	e8 00 81 00 00       	call   c000acd7 <Memset>
c0002bd7:	83 c4 10             	add    $0x10,%esp
c0002bda:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002bdf:	83 c0 01             	add    $0x1,%eax
c0002be2:	83 ec 04             	sub    $0x4,%esp
c0002be5:	68 ff 01 00 00       	push   $0x1ff
c0002bea:	6a 00                	push   $0x0
c0002bec:	50                   	push   %eax
c0002bed:	e8 e5 80 00 00       	call   c000acd7 <Memset>
c0002bf2:	83 c4 10             	add    $0x10,%esp
c0002bf5:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002bfa:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0002bfd:	83 c2 01             	add    $0x1,%edx
c0002c00:	83 ec 0c             	sub    $0xc,%esp
c0002c03:	6a 0a                	push   $0xa
c0002c05:	68 00 02 00 00       	push   $0x200
c0002c0a:	50                   	push   %eax
c0002c0b:	6a 20                	push   $0x20
c0002c0d:	52                   	push   %edx
c0002c0e:	e8 76 fd ff ff       	call   c0002989 <rd_wt>
c0002c13:	83 c4 20             	add    $0x20,%esp
c0002c16:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002c19:	83 e8 02             	sub    $0x2,%eax
c0002c1c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002c1f:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002c26:	eb 3f                	jmp    c0002c67 <mkfs+0x23a>
c0002c28:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002c2d:	83 ec 04             	sub    $0x4,%esp
c0002c30:	68 00 02 00 00       	push   $0x200
c0002c35:	6a 00                	push   $0x0
c0002c37:	50                   	push   %eax
c0002c38:	e8 9a 80 00 00       	call   c000acd7 <Memset>
c0002c3d:	83 c4 10             	add    $0x10,%esp
c0002c40:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002c45:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0002c48:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0002c4b:	01 ca                	add    %ecx,%edx
c0002c4d:	83 ec 0c             	sub    $0xc,%esp
c0002c50:	6a 0a                	push   $0xa
c0002c52:	68 00 02 00 00       	push   $0x200
c0002c57:	50                   	push   %eax
c0002c58:	6a 20                	push   $0x20
c0002c5a:	52                   	push   %edx
c0002c5b:	e8 29 fd ff ff       	call   c0002989 <rd_wt>
c0002c60:	83 c4 20             	add    $0x20,%esp
c0002c63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002c67:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002c6a:	83 c0 01             	add    $0x1,%eax
c0002c6d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002c70:	7e b6                	jle    c0002c28 <mkfs+0x1fb>
c0002c72:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002c77:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002c7a:	83 c2 03             	add    $0x3,%edx
c0002c7d:	83 ec 0c             	sub    $0xc,%esp
c0002c80:	6a 0a                	push   $0xa
c0002c82:	68 00 02 00 00       	push   $0x200
c0002c87:	50                   	push   %eax
c0002c88:	6a 20                	push   $0x20
c0002c8a:	52                   	push   %edx
c0002c8b:	e8 f9 fc ff ff       	call   c0002989 <rd_wt>
c0002c90:	83 c4 20             	add    $0x20,%esp
c0002c93:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002c98:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002c9b:	83 c2 03             	add    $0x3,%edx
c0002c9e:	83 ec 0c             	sub    $0xc,%esp
c0002ca1:	6a 07                	push   $0x7
c0002ca3:	68 00 02 00 00       	push   $0x200
c0002ca8:	50                   	push   %eax
c0002ca9:	6a 20                	push   $0x20
c0002cab:	52                   	push   %edx
c0002cac:	e8 d8 fc ff ff       	call   c0002989 <rd_wt>
c0002cb1:	83 c4 20             	add    $0x20,%esp
c0002cb4:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002cb9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002cbc:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cbf:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002cc5:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cc8:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002ccf:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002cd2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cd5:	89 50 08             	mov    %edx,0x8(%eax)
c0002cd8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cdb:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002ce2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ce5:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002cec:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cef:	8b 10                	mov    (%eax),%edx
c0002cf1:	89 15 a0 31 01 c0    	mov    %edx,0xc00131a0
c0002cf7:	8b 50 04             	mov    0x4(%eax),%edx
c0002cfa:	89 15 a4 31 01 c0    	mov    %edx,0xc00131a4
c0002d00:	8b 50 08             	mov    0x8(%eax),%edx
c0002d03:	89 15 a8 31 01 c0    	mov    %edx,0xc00131a8
c0002d09:	8b 50 0c             	mov    0xc(%eax),%edx
c0002d0c:	89 15 ac 31 01 c0    	mov    %edx,0xc00131ac
c0002d12:	8b 50 10             	mov    0x10(%eax),%edx
c0002d15:	89 15 b0 31 01 c0    	mov    %edx,0xc00131b0
c0002d1b:	8b 50 14             	mov    0x14(%eax),%edx
c0002d1e:	89 15 b4 31 01 c0    	mov    %edx,0xc00131b4
c0002d24:	8b 50 18             	mov    0x18(%eax),%edx
c0002d27:	89 15 b8 31 01 c0    	mov    %edx,0xc00131b8
c0002d2d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002d30:	89 15 bc 31 01 c0    	mov    %edx,0xc00131bc
c0002d36:	8b 50 20             	mov    0x20(%eax),%edx
c0002d39:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002d3f:	8b 40 24             	mov    0x24(%eax),%eax
c0002d42:	a3 c4 31 01 c0       	mov    %eax,0xc00131c4
c0002d47:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002d4e:	eb 4c                	jmp    c0002d9c <mkfs+0x36f>
c0002d50:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002d55:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002d58:	83 c2 01             	add    $0x1,%edx
c0002d5b:	c1 e2 05             	shl    $0x5,%edx
c0002d5e:	01 d0                	add    %edx,%eax
c0002d60:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002d63:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d66:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002d6c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d6f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002d76:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d79:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002d80:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002d87:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002d8a:	c1 e0 08             	shl    $0x8,%eax
c0002d8d:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002d90:	89 c2                	mov    %eax,%edx
c0002d92:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d95:	89 50 08             	mov    %edx,0x8(%eax)
c0002d98:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002d9c:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002da0:	7e ae                	jle    c0002d50 <mkfs+0x323>
c0002da2:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002da9:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002daf:	b8 00 00 00 00       	mov    $0x0,%eax
c0002db4:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002db9:	89 d7                	mov    %edx,%edi
c0002dbb:	f3 ab                	rep stos %eax,%es:(%edi)
c0002dbd:	c7 85 70 ff ff ff 86 	movl   $0xc000a386,-0x90(%ebp)
c0002dc4:	a3 00 c0 
c0002dc7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002dce:	eb 54                	jmp    c0002e24 <mkfs+0x3f7>
c0002dd0:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002dd5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002dd8:	83 c2 04             	add    $0x4,%edx
c0002ddb:	c1 e2 05             	shl    $0x5,%edx
c0002dde:	01 d0                	add    %edx,%eax
c0002de0:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002de3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002de6:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002dec:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002def:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002df6:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002df9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002dfc:	83 c2 01             	add    $0x1,%edx
c0002dff:	c1 e2 0b             	shl    $0xb,%edx
c0002e02:	01 c2                	add    %eax,%edx
c0002e04:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e07:	89 50 08             	mov    %edx,0x8(%eax)
c0002e0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e0d:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002e14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002e17:	8d 50 05             	lea    0x5(%eax),%edx
c0002e1a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e1d:	89 50 10             	mov    %edx,0x10(%eax)
c0002e20:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002e24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002e27:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002e2a:	7c a4                	jl     c0002dd0 <mkfs+0x3a3>
c0002e2c:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002e31:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002e34:	83 c2 03             	add    $0x3,%edx
c0002e37:	83 ec 0c             	sub    $0xc,%esp
c0002e3a:	6a 0a                	push   $0xa
c0002e3c:	68 00 02 00 00       	push   $0x200
c0002e41:	50                   	push   %eax
c0002e42:	6a 20                	push   $0x20
c0002e44:	52                   	push   %edx
c0002e45:	e8 3f fb ff ff       	call   c0002989 <rd_wt>
c0002e4a:	83 c4 20             	add    $0x20,%esp
c0002e4d:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0002e53:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002e56:	83 ec 0c             	sub    $0xc,%esp
c0002e59:	6a 07                	push   $0x7
c0002e5b:	68 00 02 00 00       	push   $0x200
c0002e60:	52                   	push   %edx
c0002e61:	6a 20                	push   $0x20
c0002e63:	50                   	push   %eax
c0002e64:	e8 20 fb ff ff       	call   c0002989 <rd_wt>
c0002e69:	83 c4 20             	add    $0x20,%esp
c0002e6c:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002e73:	00 00 00 
c0002e76:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002e7d:	2e 00 
c0002e7f:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0002e84:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002e87:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e8a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002e90:	83 ec 0c             	sub    $0xc,%esp
c0002e93:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002e99:	50                   	push   %eax
c0002e9a:	e8 71 7e 00 00       	call   c000ad10 <Strlen>
c0002e9f:	83 c4 10             	add    $0x10,%esp
c0002ea2:	89 c1                	mov    %eax,%ecx
c0002ea4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002ea7:	8d 50 04             	lea    0x4(%eax),%edx
c0002eaa:	83 ec 04             	sub    $0x4,%esp
c0002ead:	51                   	push   %ecx
c0002eae:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002eb4:	50                   	push   %eax
c0002eb5:	52                   	push   %edx
c0002eb6:	e8 ee 7d 00 00       	call   c000aca9 <Memcpy>
c0002ebb:	83 c4 10             	add    $0x10,%esp
c0002ebe:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002ec4:	b8 00 00 00 00       	mov    $0x0,%eax
c0002ec9:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002ece:	89 d7                	mov    %edx,%edi
c0002ed0:	f3 ab                	rep stos %eax,%es:(%edi)
c0002ed2:	c7 85 34 ff ff ff 92 	movl   $0xc000a392,-0xcc(%ebp)
c0002ed9:	a3 00 c0 
c0002edc:	c7 85 38 ff ff ff 9b 	movl   $0xc000a39b,-0xc8(%ebp)
c0002ee3:	a3 00 c0 
c0002ee6:	c7 85 3c ff ff ff a4 	movl   $0xc000a3a4,-0xc4(%ebp)
c0002eed:	a3 00 c0 
c0002ef0:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002ef7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002efe:	eb 49                	jmp    c0002f49 <mkfs+0x51c>
c0002f00:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002f04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002f07:	8d 50 02             	lea    0x2(%eax),%edx
c0002f0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f0d:	89 10                	mov    %edx,(%eax)
c0002f0f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002f12:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002f19:	83 ec 0c             	sub    $0xc,%esp
c0002f1c:	50                   	push   %eax
c0002f1d:	e8 ee 7d 00 00       	call   c000ad10 <Strlen>
c0002f22:	83 c4 10             	add    $0x10,%esp
c0002f25:	89 c1                	mov    %eax,%ecx
c0002f27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002f2a:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002f31:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002f34:	83 c2 04             	add    $0x4,%edx
c0002f37:	83 ec 04             	sub    $0x4,%esp
c0002f3a:	51                   	push   %ecx
c0002f3b:	50                   	push   %eax
c0002f3c:	52                   	push   %edx
c0002f3d:	e8 67 7d 00 00       	call   c000aca9 <Memcpy>
c0002f42:	83 c4 10             	add    $0x10,%esp
c0002f45:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002f49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002f4c:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002f4f:	7c af                	jl     c0002f00 <mkfs+0x4d3>
c0002f51:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002f58:	eb 66                	jmp    c0002fc0 <mkfs+0x593>
c0002f5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f5d:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002f64:	83 ec 0c             	sub    $0xc,%esp
c0002f67:	50                   	push   %eax
c0002f68:	e8 a3 7d 00 00       	call   c000ad10 <Strlen>
c0002f6d:	83 c4 10             	add    $0x10,%esp
c0002f70:	85 c0                	test   %eax,%eax
c0002f72:	74 47                	je     c0002fbb <mkfs+0x58e>
c0002f74:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002f78:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f7b:	8d 50 05             	lea    0x5(%eax),%edx
c0002f7e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f81:	89 10                	mov    %edx,(%eax)
c0002f83:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f86:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002f8d:	83 ec 0c             	sub    $0xc,%esp
c0002f90:	50                   	push   %eax
c0002f91:	e8 7a 7d 00 00       	call   c000ad10 <Strlen>
c0002f96:	83 c4 10             	add    $0x10,%esp
c0002f99:	89 c1                	mov    %eax,%ecx
c0002f9b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f9e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002fa5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002fa8:	83 c2 04             	add    $0x4,%edx
c0002fab:	83 ec 04             	sub    $0x4,%esp
c0002fae:	51                   	push   %ecx
c0002faf:	50                   	push   %eax
c0002fb0:	52                   	push   %edx
c0002fb1:	e8 f3 7c 00 00       	call   c000aca9 <Memcpy>
c0002fb6:	83 c4 10             	add    $0x10,%esp
c0002fb9:	eb 01                	jmp    c0002fbc <mkfs+0x58f>
c0002fbb:	90                   	nop
c0002fbc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002fc0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002fc3:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002fc6:	7c 92                	jl     c0002f5a <mkfs+0x52d>
c0002fc8:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0002fce:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002fd1:	83 ec 0c             	sub    $0xc,%esp
c0002fd4:	6a 0a                	push   $0xa
c0002fd6:	68 00 02 00 00       	push   $0x200
c0002fdb:	52                   	push   %edx
c0002fdc:	6a 20                	push   $0x20
c0002fde:	50                   	push   %eax
c0002fdf:	e8 a5 f9 ff ff       	call   c0002989 <rd_wt>
c0002fe4:	83 c4 20             	add    $0x20,%esp
c0002fe7:	90                   	nop
c0002fe8:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0002feb:	c9                   	leave  
c0002fec:	c3                   	ret    

c0002fed <init_fs>:
c0002fed:	55                   	push   %ebp
c0002fee:	89 e5                	mov    %esp,%ebp
c0002ff0:	83 ec 78             	sub    $0x78,%esp
c0002ff3:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0002ffa:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
c0003001:	83 ec 04             	sub    $0x4,%esp
c0003004:	6a 04                	push   $0x4
c0003006:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0003009:	50                   	push   %eax
c000300a:	6a 03                	push   $0x3
c000300c:	e8 1e 68 00 00       	call   c000982f <send_rec>
c0003011:	83 c4 10             	add    $0x10,%esp
c0003014:	e8 14 fa ff ff       	call   c0002a2d <mkfs>
c0003019:	90                   	nop
c000301a:	c9                   	leave  
c000301b:	c3                   	ret    

c000301c <do_open>:
c000301c:	55                   	push   %ebp
c000301d:	89 e5                	mov    %esp,%ebp
c000301f:	56                   	push   %esi
c0003020:	53                   	push   %ebx
c0003021:	83 ec 60             	sub    $0x60,%esp
c0003024:	83 ec 04             	sub    $0x4,%esp
c0003027:	6a 0c                	push   $0xc
c0003029:	6a 00                	push   $0x0
c000302b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c000302e:	50                   	push   %eax
c000302f:	e8 a3 7c 00 00       	call   c000acd7 <Memset>
c0003034:	83 c4 10             	add    $0x10,%esp
c0003037:	8b 45 08             	mov    0x8(%ebp),%eax
c000303a:	8b 40 30             	mov    0x30(%eax),%eax
c000303d:	89 c6                	mov    %eax,%esi
c000303f:	8b 45 08             	mov    0x8(%ebp),%eax
c0003042:	8b 40 34             	mov    0x34(%eax),%eax
c0003045:	89 c2                	mov    %eax,%edx
c0003047:	8b 45 08             	mov    0x8(%ebp),%eax
c000304a:	8b 00                	mov    (%eax),%eax
c000304c:	83 ec 08             	sub    $0x8,%esp
c000304f:	52                   	push   %edx
c0003050:	50                   	push   %eax
c0003051:	e8 d7 19 00 00       	call   c0004a2d <v2l>
c0003056:	83 c4 10             	add    $0x10,%esp
c0003059:	89 c3                	mov    %eax,%ebx
c000305b:	83 ec 08             	sub    $0x8,%esp
c000305e:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0003061:	50                   	push   %eax
c0003062:	6a 03                	push   $0x3
c0003064:	e8 c4 19 00 00       	call   c0004a2d <v2l>
c0003069:	83 c4 10             	add    $0x10,%esp
c000306c:	83 ec 04             	sub    $0x4,%esp
c000306f:	56                   	push   %esi
c0003070:	53                   	push   %ebx
c0003071:	50                   	push   %eax
c0003072:	e8 32 7c 00 00       	call   c000aca9 <Memcpy>
c0003077:	83 c4 10             	add    $0x10,%esp
c000307a:	8b 45 08             	mov    0x8(%ebp),%eax
c000307d:	8b 40 30             	mov    0x30(%eax),%eax
c0003080:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
c0003085:	8b 45 08             	mov    0x8(%ebp),%eax
c0003088:	8b 40 64             	mov    0x64(%eax),%eax
c000308b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000308e:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0003095:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000309c:	eb 1f                	jmp    c00030bd <do_open+0xa1>
c000309e:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c00030a3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00030a6:	83 c2 50             	add    $0x50,%edx
c00030a9:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00030ad:	85 c0                	test   %eax,%eax
c00030af:	75 08                	jne    c00030b9 <do_open+0x9d>
c00030b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00030b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00030b7:	eb 0a                	jmp    c00030c3 <do_open+0xa7>
c00030b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00030bd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00030c1:	7e db                	jle    c000309e <do_open+0x82>
c00030c3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c00030c7:	75 1c                	jne    c00030e5 <do_open+0xc9>
c00030c9:	68 e7 01 00 00       	push   $0x1e7
c00030ce:	68 33 a3 00 c0       	push   $0xc000a333
c00030d3:	68 33 a3 00 c0       	push   $0xc000a333
c00030d8:	68 ad a3 00 c0       	push   $0xc000a3ad
c00030dd:	e8 42 5f 00 00       	call   c0009024 <assertion_failure>
c00030e2:	83 c4 10             	add    $0x10,%esp
c00030e5:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c00030ec:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00030f3:	eb 1d                	jmp    c0003112 <do_open+0xf6>
c00030f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030f8:	c1 e0 04             	shl    $0x4,%eax
c00030fb:	05 a8 23 01 c0       	add    $0xc00123a8,%eax
c0003100:	8b 00                	mov    (%eax),%eax
c0003102:	85 c0                	test   %eax,%eax
c0003104:	75 08                	jne    c000310e <do_open+0xf2>
c0003106:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003109:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000310c:	eb 0a                	jmp    c0003118 <do_open+0xfc>
c000310e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003112:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0003116:	7e dd                	jle    c00030f5 <do_open+0xd9>
c0003118:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c000311c:	75 1c                	jne    c000313a <do_open+0x11e>
c000311e:	68 f3 01 00 00       	push   $0x1f3
c0003123:	68 33 a3 00 c0       	push   $0xc000a333
c0003128:	68 33 a3 00 c0       	push   $0xc000a333
c000312d:	68 b5 a3 00 c0       	push   $0xc000a3b5
c0003132:	e8 ed 5e 00 00       	call   c0009024 <assertion_failure>
c0003137:	83 c4 10             	add    $0x10,%esp
c000313a:	83 ec 0c             	sub    $0xc,%esp
c000313d:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0003140:	50                   	push   %eax
c0003141:	e8 b7 00 00 00       	call   c00031fd <search_file>
c0003146:	83 c4 10             	add    $0x10,%esp
c0003149:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000314c:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
c0003150:	75 2b                	jne    c000317d <do_open+0x161>
c0003152:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003156:	7e 10                	jle    c0003168 <do_open+0x14c>
c0003158:	83 ec 0c             	sub    $0xc,%esp
c000315b:	68 bd a3 00 c0       	push   $0xc000a3bd
c0003160:	e8 a1 5e 00 00       	call   c0009006 <panic>
c0003165:	83 c4 10             	add    $0x10,%esp
c0003168:	83 ec 08             	sub    $0x8,%esp
c000316b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c000316e:	50                   	push   %eax
c000316f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0003172:	50                   	push   %eax
c0003173:	e8 43 04 00 00       	call   c00035bb <create_file>
c0003178:	83 c4 10             	add    $0x10,%esp
c000317b:	eb 22                	jmp    c000319f <do_open+0x183>
c000317d:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0003181:	75 07                	jne    c000318a <do_open+0x16e>
c0003183:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003188:	eb 6c                	jmp    c00031f6 <do_open+0x1da>
c000318a:	83 ec 08             	sub    $0x8,%esp
c000318d:	ff 75 e0             	pushl  -0x20(%ebp)
c0003190:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0003193:	50                   	push   %eax
c0003194:	e8 60 02 00 00       	call   c00033f9 <get_inode>
c0003199:	83 c4 10             	add    $0x10,%esp
c000319c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000319f:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c00031a4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00031a7:	c1 e2 04             	shl    $0x4,%edx
c00031aa:	8d 8a a0 23 01 c0    	lea    -0x3ffedc60(%edx),%ecx
c00031b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00031b3:	83 c2 50             	add    $0x50,%edx
c00031b6:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
c00031ba:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00031bd:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00031c0:	c1 e2 04             	shl    $0x4,%edx
c00031c3:	81 c2 a8 23 01 c0    	add    $0xc00123a8,%edx
c00031c9:	89 02                	mov    %eax,(%edx)
c00031cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031ce:	c1 e0 04             	shl    $0x4,%eax
c00031d1:	05 a4 23 01 c0       	add    $0xc00123a4,%eax
c00031d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00031dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031df:	c1 e0 04             	shl    $0x4,%eax
c00031e2:	05 a0 23 01 c0       	add    $0xc00123a0,%eax
c00031e7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00031ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00031f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00031f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00031f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00031f9:	5b                   	pop    %ebx
c00031fa:	5e                   	pop    %esi
c00031fb:	5d                   	pop    %ebp
c00031fc:	c3                   	ret    

c00031fd <search_file>:
c00031fd:	55                   	push   %ebp
c00031fe:	89 e5                	mov    %esp,%ebp
c0003200:	83 ec 68             	sub    $0x68,%esp
c0003203:	83 ec 04             	sub    $0x4,%esp
c0003206:	6a 0c                	push   $0xc
c0003208:	6a 00                	push   $0x0
c000320a:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000320d:	50                   	push   %eax
c000320e:	e8 c4 7a 00 00       	call   c000acd7 <Memset>
c0003213:	83 c4 10             	add    $0x10,%esp
c0003216:	83 ec 04             	sub    $0x4,%esp
c0003219:	6a 28                	push   $0x28
c000321b:	6a 00                	push   $0x0
c000321d:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003220:	50                   	push   %eax
c0003221:	e8 b1 7a 00 00       	call   c000acd7 <Memset>
c0003226:	83 c4 10             	add    $0x10,%esp
c0003229:	83 ec 04             	sub    $0x4,%esp
c000322c:	8d 45 98             	lea    -0x68(%ebp),%eax
c000322f:	50                   	push   %eax
c0003230:	ff 75 08             	pushl  0x8(%ebp)
c0003233:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003236:	50                   	push   %eax
c0003237:	e8 f1 00 00 00       	call   c000332d <strip_path>
c000323c:	83 c4 10             	add    $0x10,%esp
c000323f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003242:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c0003246:	75 0a                	jne    c0003252 <search_file+0x55>
c0003248:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000324d:	e9 d9 00 00 00       	jmp    c000332b <search_file+0x12e>
c0003252:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003255:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003258:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000325b:	05 00 02 00 00       	add    $0x200,%eax
c0003260:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003266:	85 c0                	test   %eax,%eax
c0003268:	0f 48 c2             	cmovs  %edx,%eax
c000326b:	c1 f8 09             	sar    $0x9,%eax
c000326e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003271:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003274:	c1 e8 04             	shr    $0x4,%eax
c0003277:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000327a:	e8 32 14 00 00       	call   c00046b1 <get_super_block>
c000327f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003282:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003285:	8b 00                	mov    (%eax),%eax
c0003287:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000328a:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003291:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003298:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000329f:	eb 79                	jmp    c000331a <search_file+0x11d>
c00032a1:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00032a6:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c00032a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00032ac:	01 ca                	add    %ecx,%edx
c00032ae:	83 ec 0c             	sub    $0xc,%esp
c00032b1:	6a 07                	push   $0x7
c00032b3:	68 00 02 00 00       	push   $0x200
c00032b8:	50                   	push   %eax
c00032b9:	ff 75 cc             	pushl  -0x34(%ebp)
c00032bc:	52                   	push   %edx
c00032bd:	e8 c7 f6 ff ff       	call   c0002989 <rd_wt>
c00032c2:	83 c4 20             	add    $0x20,%esp
c00032c5:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00032ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00032cd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00032d4:	eb 35                	jmp    c000330b <search_file+0x10e>
c00032d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00032da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032dd:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00032e0:	7f 33                	jg     c0003315 <search_file+0x118>
c00032e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032e5:	83 c0 04             	add    $0x4,%eax
c00032e8:	83 ec 08             	sub    $0x8,%esp
c00032eb:	50                   	push   %eax
c00032ec:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00032ef:	50                   	push   %eax
c00032f0:	e8 82 68 00 00       	call   c0009b77 <strcmp>
c00032f5:	83 c4 10             	add    $0x10,%esp
c00032f8:	85 c0                	test   %eax,%eax
c00032fa:	75 07                	jne    c0003303 <search_file+0x106>
c00032fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032ff:	8b 00                	mov    (%eax),%eax
c0003301:	eb 28                	jmp    c000332b <search_file+0x12e>
c0003303:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003307:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c000330b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000330e:	83 f8 1f             	cmp    $0x1f,%eax
c0003311:	76 c3                	jbe    c00032d6 <search_file+0xd9>
c0003313:	eb 01                	jmp    c0003316 <search_file+0x119>
c0003315:	90                   	nop
c0003316:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000331a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000331d:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003320:	0f 8c 7b ff ff ff    	jl     c00032a1 <search_file+0xa4>
c0003326:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000332b:	c9                   	leave  
c000332c:	c3                   	ret    

c000332d <strip_path>:
c000332d:	55                   	push   %ebp
c000332e:	89 e5                	mov    %esp,%ebp
c0003330:	83 ec 10             	sub    $0x10,%esp
c0003333:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003337:	75 0a                	jne    c0003343 <strip_path+0x16>
c0003339:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000333e:	e9 b4 00 00 00       	jmp    c00033f7 <strip_path+0xca>
c0003343:	8b 45 08             	mov    0x8(%ebp),%eax
c0003346:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003349:	8b 45 0c             	mov    0xc(%ebp),%eax
c000334c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000334f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003352:	0f b6 00             	movzbl (%eax),%eax
c0003355:	3c 2f                	cmp    $0x2f,%al
c0003357:	75 2d                	jne    c0003386 <strip_path+0x59>
c0003359:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000335d:	eb 27                	jmp    c0003386 <strip_path+0x59>
c000335f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003362:	0f b6 00             	movzbl (%eax),%eax
c0003365:	3c 2f                	cmp    $0x2f,%al
c0003367:	75 0a                	jne    c0003373 <strip_path+0x46>
c0003369:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000336e:	e9 84 00 00 00       	jmp    c00033f7 <strip_path+0xca>
c0003373:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003376:	0f b6 10             	movzbl (%eax),%edx
c0003379:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000337c:	88 10                	mov    %dl,(%eax)
c000337e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003382:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003386:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003389:	0f b6 00             	movzbl (%eax),%eax
c000338c:	84 c0                	test   %al,%al
c000338e:	75 cf                	jne    c000335f <strip_path+0x32>
c0003390:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003393:	c6 00 00             	movb   $0x0,(%eax)
c0003396:	8b 45 10             	mov    0x10(%ebp),%eax
c0003399:	8b 15 a0 31 01 c0    	mov    0xc00131a0,%edx
c000339f:	89 10                	mov    %edx,(%eax)
c00033a1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00033a7:	89 50 04             	mov    %edx,0x4(%eax)
c00033aa:	8b 15 a8 31 01 c0    	mov    0xc00131a8,%edx
c00033b0:	89 50 08             	mov    %edx,0x8(%eax)
c00033b3:	8b 15 ac 31 01 c0    	mov    0xc00131ac,%edx
c00033b9:	89 50 0c             	mov    %edx,0xc(%eax)
c00033bc:	8b 15 b0 31 01 c0    	mov    0xc00131b0,%edx
c00033c2:	89 50 10             	mov    %edx,0x10(%eax)
c00033c5:	8b 15 b4 31 01 c0    	mov    0xc00131b4,%edx
c00033cb:	89 50 14             	mov    %edx,0x14(%eax)
c00033ce:	8b 15 b8 31 01 c0    	mov    0xc00131b8,%edx
c00033d4:	89 50 18             	mov    %edx,0x18(%eax)
c00033d7:	8b 15 bc 31 01 c0    	mov    0xc00131bc,%edx
c00033dd:	89 50 1c             	mov    %edx,0x1c(%eax)
c00033e0:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c00033e6:	89 50 20             	mov    %edx,0x20(%eax)
c00033e9:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00033ef:	89 50 24             	mov    %edx,0x24(%eax)
c00033f2:	b8 00 00 00 00       	mov    $0x0,%eax
c00033f7:	c9                   	leave  
c00033f8:	c3                   	ret    

c00033f9 <get_inode>:
c00033f9:	55                   	push   %ebp
c00033fa:	89 e5                	mov    %esp,%ebp
c00033fc:	56                   	push   %esi
c00033fd:	53                   	push   %ebx
c00033fe:	83 ec 20             	sub    $0x20,%esp
c0003401:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003405:	75 0a                	jne    c0003411 <get_inode+0x18>
c0003407:	b8 00 00 00 00       	mov    $0x0,%eax
c000340c:	e9 a3 01 00 00       	jmp    c00035b4 <get_inode+0x1bb>
c0003411:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003418:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c000341f:	eb 69                	jmp    c000348a <get_inode+0x91>
c0003421:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003424:	8b 40 24             	mov    0x24(%eax),%eax
c0003427:	85 c0                	test   %eax,%eax
c0003429:	7e 53                	jle    c000347e <get_inode+0x85>
c000342b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000342e:	8b 40 10             	mov    0x10(%eax),%eax
c0003431:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003434:	75 50                	jne    c0003486 <get_inode+0x8d>
c0003436:	8b 45 08             	mov    0x8(%ebp),%eax
c0003439:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000343c:	8b 0a                	mov    (%edx),%ecx
c000343e:	89 08                	mov    %ecx,(%eax)
c0003440:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003443:	89 48 04             	mov    %ecx,0x4(%eax)
c0003446:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003449:	89 48 08             	mov    %ecx,0x8(%eax)
c000344c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000344f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003452:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003455:	89 48 10             	mov    %ecx,0x10(%eax)
c0003458:	8b 4a 14             	mov    0x14(%edx),%ecx
c000345b:	89 48 14             	mov    %ecx,0x14(%eax)
c000345e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003461:	89 48 18             	mov    %ecx,0x18(%eax)
c0003464:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003467:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000346a:	8b 4a 20             	mov    0x20(%edx),%ecx
c000346d:	89 48 20             	mov    %ecx,0x20(%eax)
c0003470:	8b 52 24             	mov    0x24(%edx),%edx
c0003473:	89 50 24             	mov    %edx,0x24(%eax)
c0003476:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003479:	e9 36 01 00 00       	jmp    c00035b4 <get_inode+0x1bb>
c000347e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003481:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003484:	eb 0d                	jmp    c0003493 <get_inode+0x9a>
c0003486:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c000348a:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c0003491:	76 8e                	jbe    c0003421 <get_inode+0x28>
c0003493:	e8 19 12 00 00       	call   c00046b1 <get_super_block>
c0003498:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000349b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00034a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00034a5:	8b 40 04             	mov    0x4(%eax),%eax
c00034a8:	8d 50 02             	lea    0x2(%eax),%edx
c00034ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00034ae:	8b 40 08             	mov    0x8(%eax),%eax
c00034b1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00034b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00034b7:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00034ba:	b8 00 02 00 00       	mov    $0x200,%eax
c00034bf:	99                   	cltd   
c00034c0:	f7 7d e8             	idivl  -0x18(%ebp)
c00034c3:	89 c6                	mov    %eax,%esi
c00034c5:	89 c8                	mov    %ecx,%eax
c00034c7:	99                   	cltd   
c00034c8:	f7 fe                	idiv   %esi
c00034ca:	01 d8                	add    %ebx,%eax
c00034cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00034cf:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00034d6:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00034db:	83 ec 0c             	sub    $0xc,%esp
c00034de:	6a 07                	push   $0x7
c00034e0:	68 00 02 00 00       	push   $0x200
c00034e5:	50                   	push   %eax
c00034e6:	ff 75 e0             	pushl  -0x20(%ebp)
c00034e9:	ff 75 e4             	pushl  -0x1c(%ebp)
c00034ec:	e8 98 f4 ff ff       	call   c0002989 <rd_wt>
c00034f1:	83 c4 20             	add    $0x20,%esp
c00034f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00034f7:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00034fa:	b8 00 02 00 00       	mov    $0x200,%eax
c00034ff:	99                   	cltd   
c0003500:	f7 7d e8             	idivl  -0x18(%ebp)
c0003503:	89 c3                	mov    %eax,%ebx
c0003505:	89 c8                	mov    %ecx,%eax
c0003507:	99                   	cltd   
c0003508:	f7 fb                	idiv   %ebx
c000350a:	89 55 dc             	mov    %edx,-0x24(%ebp)
c000350d:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003513:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003516:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c000351a:	01 d0                	add    %edx,%eax
c000351c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000351f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003522:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003525:	8b 0a                	mov    (%edx),%ecx
c0003527:	89 08                	mov    %ecx,(%eax)
c0003529:	8b 4a 04             	mov    0x4(%edx),%ecx
c000352c:	89 48 04             	mov    %ecx,0x4(%eax)
c000352f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003532:	89 48 08             	mov    %ecx,0x8(%eax)
c0003535:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003538:	89 48 0c             	mov    %ecx,0xc(%eax)
c000353b:	8b 4a 10             	mov    0x10(%edx),%ecx
c000353e:	89 48 10             	mov    %ecx,0x10(%eax)
c0003541:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003544:	89 48 14             	mov    %ecx,0x14(%eax)
c0003547:	8b 4a 18             	mov    0x18(%edx),%ecx
c000354a:	89 48 18             	mov    %ecx,0x18(%eax)
c000354d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003550:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003553:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003556:	89 48 20             	mov    %ecx,0x20(%eax)
c0003559:	8b 52 24             	mov    0x24(%edx),%edx
c000355c:	89 50 24             	mov    %edx,0x24(%eax)
c000355f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003562:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003565:	89 50 10             	mov    %edx,0x10(%eax)
c0003568:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000356b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000356e:	89 50 20             	mov    %edx,0x20(%eax)
c0003571:	8b 45 08             	mov    0x8(%ebp),%eax
c0003574:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003577:	8b 0a                	mov    (%edx),%ecx
c0003579:	89 08                	mov    %ecx,(%eax)
c000357b:	8b 4a 04             	mov    0x4(%edx),%ecx
c000357e:	89 48 04             	mov    %ecx,0x4(%eax)
c0003581:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003584:	89 48 08             	mov    %ecx,0x8(%eax)
c0003587:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000358a:	89 48 0c             	mov    %ecx,0xc(%eax)
c000358d:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003590:	89 48 10             	mov    %ecx,0x10(%eax)
c0003593:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003596:	89 48 14             	mov    %ecx,0x14(%eax)
c0003599:	8b 4a 18             	mov    0x18(%edx),%ecx
c000359c:	89 48 18             	mov    %ecx,0x18(%eax)
c000359f:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00035a2:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00035a5:	8b 4a 20             	mov    0x20(%edx),%ecx
c00035a8:	89 48 20             	mov    %ecx,0x20(%eax)
c00035ab:	8b 52 24             	mov    0x24(%edx),%edx
c00035ae:	89 50 24             	mov    %edx,0x24(%eax)
c00035b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00035b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00035b7:	5b                   	pop    %ebx
c00035b8:	5e                   	pop    %esi
c00035b9:	5d                   	pop    %ebp
c00035ba:	c3                   	ret    

c00035bb <create_file>:
c00035bb:	55                   	push   %ebp
c00035bc:	89 e5                	mov    %esp,%ebp
c00035be:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00035c4:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00035c7:	50                   	push   %eax
c00035c8:	ff 75 0c             	pushl  0xc(%ebp)
c00035cb:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00035ce:	50                   	push   %eax
c00035cf:	e8 59 fd ff ff       	call   c000332d <strip_path>
c00035d4:	83 c4 0c             	add    $0xc,%esp
c00035d7:	83 f8 ff             	cmp    $0xffffffff,%eax
c00035da:	75 0a                	jne    c00035e6 <create_file+0x2b>
c00035dc:	b8 00 00 00 00       	mov    $0x0,%eax
c00035e1:	e9 de 00 00 00       	jmp    c00036c4 <create_file+0x109>
c00035e6:	e8 db 00 00 00       	call   c00036c6 <alloc_imap_bit>
c00035eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00035ee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00035f2:	75 0a                	jne    c00035fe <create_file+0x43>
c00035f4:	b8 00 00 00 00       	mov    $0x0,%eax
c00035f9:	e9 c6 00 00 00       	jmp    c00036c4 <create_file+0x109>
c00035fe:	e8 ae 10 00 00       	call   c00046b1 <get_super_block>
c0003603:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003606:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003609:	8b 40 10             	mov    0x10(%eax),%eax
c000360c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000360f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003612:	83 ec 08             	sub    $0x8,%esp
c0003615:	50                   	push   %eax
c0003616:	ff 75 f4             	pushl  -0xc(%ebp)
c0003619:	e8 a5 01 00 00       	call   c00037c3 <alloc_smap_bit>
c000361e:	83 c4 10             	add    $0x10,%esp
c0003621:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003624:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003628:	75 0a                	jne    c0003634 <create_file+0x79>
c000362a:	b8 00 00 00 00       	mov    $0x0,%eax
c000362f:	e9 90 00 00 00       	jmp    c00036c4 <create_file+0x109>
c0003634:	83 ec 04             	sub    $0x4,%esp
c0003637:	ff 75 e8             	pushl  -0x18(%ebp)
c000363a:	ff 75 f4             	pushl  -0xc(%ebp)
c000363d:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003640:	50                   	push   %eax
c0003641:	e8 1e 03 00 00       	call   c0003964 <new_inode>
c0003646:	83 c4 10             	add    $0x10,%esp
c0003649:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000364c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003650:	75 07                	jne    c0003659 <create_file+0x9e>
c0003652:	b8 00 00 00 00       	mov    $0x0,%eax
c0003657:	eb 6b                	jmp    c00036c4 <create_file+0x109>
c0003659:	ff 75 f4             	pushl  -0xc(%ebp)
c000365c:	8d 45 ac             	lea    -0x54(%ebp),%eax
c000365f:	50                   	push   %eax
c0003660:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003663:	50                   	push   %eax
c0003664:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000366a:	50                   	push   %eax
c000366b:	e8 12 04 00 00       	call   c0003a82 <new_dir_entry>
c0003670:	83 c4 10             	add    $0x10,%esp
c0003673:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003676:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c000367a:	75 07                	jne    c0003683 <create_file+0xc8>
c000367c:	b8 00 00 00 00       	mov    $0x0,%eax
c0003681:	eb 41                	jmp    c00036c4 <create_file+0x109>
c0003683:	8b 45 08             	mov    0x8(%ebp),%eax
c0003686:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003689:	89 10                	mov    %edx,(%eax)
c000368b:	8b 55 88             	mov    -0x78(%ebp),%edx
c000368e:	89 50 04             	mov    %edx,0x4(%eax)
c0003691:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0003694:	89 50 08             	mov    %edx,0x8(%eax)
c0003697:	8b 55 90             	mov    -0x70(%ebp),%edx
c000369a:	89 50 0c             	mov    %edx,0xc(%eax)
c000369d:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00036a0:	89 50 10             	mov    %edx,0x10(%eax)
c00036a3:	8b 55 98             	mov    -0x68(%ebp),%edx
c00036a6:	89 50 14             	mov    %edx,0x14(%eax)
c00036a9:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00036ac:	89 50 18             	mov    %edx,0x18(%eax)
c00036af:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00036b2:	89 50 1c             	mov    %edx,0x1c(%eax)
c00036b5:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c00036b8:	89 50 20             	mov    %edx,0x20(%eax)
c00036bb:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00036be:	89 50 24             	mov    %edx,0x24(%eax)
c00036c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00036c4:	c9                   	leave  
c00036c5:	c3                   	ret    

c00036c6 <alloc_imap_bit>:
c00036c6:	55                   	push   %ebp
c00036c7:	89 e5                	mov    %esp,%ebp
c00036c9:	53                   	push   %ebx
c00036ca:	83 ec 24             	sub    $0x24,%esp
c00036cd:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00036d4:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00036db:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00036e0:	83 ec 0c             	sub    $0xc,%esp
c00036e3:	6a 07                	push   $0x7
c00036e5:	68 00 02 00 00       	push   $0x200
c00036ea:	50                   	push   %eax
c00036eb:	ff 75 e8             	pushl  -0x18(%ebp)
c00036ee:	ff 75 ec             	pushl  -0x14(%ebp)
c00036f1:	e8 93 f2 ff ff       	call   c0002989 <rd_wt>
c00036f6:	83 c4 20             	add    $0x20,%esp
c00036f9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003700:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003707:	e9 a5 00 00 00       	jmp    c00037b1 <alloc_imap_bit+0xeb>
c000370c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003713:	e9 8b 00 00 00       	jmp    c00037a3 <alloc_imap_bit+0xdd>
c0003718:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c000371e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003721:	01 d0                	add    %edx,%eax
c0003723:	0f b6 00             	movzbl (%eax),%eax
c0003726:	0f be d0             	movsbl %al,%edx
c0003729:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000372c:	89 c1                	mov    %eax,%ecx
c000372e:	d3 fa                	sar    %cl,%edx
c0003730:	89 d0                	mov    %edx,%eax
c0003732:	83 e0 01             	and    $0x1,%eax
c0003735:	85 c0                	test   %eax,%eax
c0003737:	74 06                	je     c000373f <alloc_imap_bit+0x79>
c0003739:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000373d:	eb 64                	jmp    c00037a3 <alloc_imap_bit+0xdd>
c000373f:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003745:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003748:	01 d0                	add    %edx,%eax
c000374a:	0f b6 18             	movzbl (%eax),%ebx
c000374d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003750:	ba 01 00 00 00       	mov    $0x1,%edx
c0003755:	89 c1                	mov    %eax,%ecx
c0003757:	d3 e2                	shl    %cl,%edx
c0003759:	89 d0                	mov    %edx,%eax
c000375b:	89 c1                	mov    %eax,%ecx
c000375d:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003763:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003766:	01 d0                	add    %edx,%eax
c0003768:	09 cb                	or     %ecx,%ebx
c000376a:	89 da                	mov    %ebx,%edx
c000376c:	88 10                	mov    %dl,(%eax)
c000376e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003771:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003778:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000377b:	01 d0                	add    %edx,%eax
c000377d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003780:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003785:	83 ec 0c             	sub    $0xc,%esp
c0003788:	6a 0a                	push   $0xa
c000378a:	68 00 02 00 00       	push   $0x200
c000378f:	50                   	push   %eax
c0003790:	ff 75 e8             	pushl  -0x18(%ebp)
c0003793:	ff 75 ec             	pushl  -0x14(%ebp)
c0003796:	e8 ee f1 ff ff       	call   c0002989 <rd_wt>
c000379b:	83 c4 20             	add    $0x20,%esp
c000379e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00037a1:	eb 1b                	jmp    c00037be <alloc_imap_bit+0xf8>
c00037a3:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c00037a7:	0f 8e 6b ff ff ff    	jle    c0003718 <alloc_imap_bit+0x52>
c00037ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00037b1:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c00037b8:	0f 8e 4e ff ff ff    	jle    c000370c <alloc_imap_bit+0x46>
c00037be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00037c1:	c9                   	leave  
c00037c2:	c3                   	ret    

c00037c3 <alloc_smap_bit>:
c00037c3:	55                   	push   %ebp
c00037c4:	89 e5                	mov    %esp,%ebp
c00037c6:	53                   	push   %ebx
c00037c7:	83 ec 34             	sub    $0x34,%esp
c00037ca:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00037ce:	75 1c                	jne    c00037ec <alloc_smap_bit+0x29>
c00037d0:	68 1d 03 00 00       	push   $0x31d
c00037d5:	68 33 a3 00 c0       	push   $0xc000a333
c00037da:	68 33 a3 00 c0       	push   $0xc000a333
c00037df:	68 ca a3 00 c0       	push   $0xc000a3ca
c00037e4:	e8 3b 58 00 00       	call   c0009024 <assertion_failure>
c00037e9:	83 c4 10             	add    $0x10,%esp
c00037ec:	e8 c0 0e 00 00       	call   c00046b1 <get_super_block>
c00037f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00037f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00037f7:	8b 40 08             	mov    0x8(%eax),%eax
c00037fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00037fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003800:	8b 40 04             	mov    0x4(%eax),%eax
c0003803:	83 c0 02             	add    $0x2,%eax
c0003806:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003809:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003810:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0003817:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000381e:	e9 20 01 00 00       	jmp    c0003943 <alloc_smap_bit+0x180>
c0003823:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003826:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003829:	01 d0                	add    %edx,%eax
c000382b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000382e:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003833:	83 ec 0c             	sub    $0xc,%esp
c0003836:	6a 07                	push   $0x7
c0003838:	68 00 02 00 00       	push   $0x200
c000383d:	50                   	push   %eax
c000383e:	ff 75 d8             	pushl  -0x28(%ebp)
c0003841:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003844:	e8 40 f1 ff ff       	call   c0002989 <rd_wt>
c0003849:	83 c4 20             	add    $0x20,%esp
c000384c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003853:	e9 b0 00 00 00       	jmp    c0003908 <alloc_smap_bit+0x145>
c0003858:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000385f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003863:	0f 85 8c 00 00 00    	jne    c00038f5 <alloc_smap_bit+0x132>
c0003869:	eb 45                	jmp    c00038b0 <alloc_smap_bit+0xed>
c000386b:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003871:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003874:	01 d0                	add    %edx,%eax
c0003876:	0f b6 00             	movzbl (%eax),%eax
c0003879:	0f be d0             	movsbl %al,%edx
c000387c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000387f:	89 c1                	mov    %eax,%ecx
c0003881:	d3 fa                	sar    %cl,%edx
c0003883:	89 d0                	mov    %edx,%eax
c0003885:	83 e0 01             	and    $0x1,%eax
c0003888:	85 c0                	test   %eax,%eax
c000388a:	74 06                	je     c0003892 <alloc_smap_bit+0xcf>
c000388c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003890:	eb 1e                	jmp    c00038b0 <alloc_smap_bit+0xed>
c0003892:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003895:	c1 e0 09             	shl    $0x9,%eax
c0003898:	89 c2                	mov    %eax,%edx
c000389a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000389d:	01 d0                	add    %edx,%eax
c000389f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00038a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00038a9:	01 d0                	add    %edx,%eax
c00038ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00038ae:	eb 06                	jmp    c00038b6 <alloc_smap_bit+0xf3>
c00038b0:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00038b4:	7e b5                	jle    c000386b <alloc_smap_bit+0xa8>
c00038b6:	eb 3d                	jmp    c00038f5 <alloc_smap_bit+0x132>
c00038b8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00038bc:	74 45                	je     c0003903 <alloc_smap_bit+0x140>
c00038be:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c00038c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038c7:	01 d0                	add    %edx,%eax
c00038c9:	0f b6 18             	movzbl (%eax),%ebx
c00038cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00038cf:	ba 01 00 00 00       	mov    $0x1,%edx
c00038d4:	89 c1                	mov    %eax,%ecx
c00038d6:	d3 e2                	shl    %cl,%edx
c00038d8:	89 d0                	mov    %edx,%eax
c00038da:	89 c1                	mov    %eax,%ecx
c00038dc:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c00038e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038e5:	01 d0                	add    %edx,%eax
c00038e7:	09 cb                	or     %ecx,%ebx
c00038e9:	89 da                	mov    %ebx,%edx
c00038eb:	88 10                	mov    %dl,(%eax)
c00038ed:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00038f1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00038f5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00038f9:	74 09                	je     c0003904 <alloc_smap_bit+0x141>
c00038fb:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00038ff:	7e b7                	jle    c00038b8 <alloc_smap_bit+0xf5>
c0003901:	eb 01                	jmp    c0003904 <alloc_smap_bit+0x141>
c0003903:	90                   	nop
c0003904:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003908:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c000390f:	0f 8e 43 ff ff ff    	jle    c0003858 <alloc_smap_bit+0x95>
c0003915:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003919:	74 1e                	je     c0003939 <alloc_smap_bit+0x176>
c000391b:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003920:	83 ec 0c             	sub    $0xc,%esp
c0003923:	6a 0a                	push   $0xa
c0003925:	68 00 02 00 00       	push   $0x200
c000392a:	50                   	push   %eax
c000392b:	ff 75 d8             	pushl  -0x28(%ebp)
c000392e:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003931:	e8 53 f0 ff ff       	call   c0002989 <rd_wt>
c0003936:	83 c4 20             	add    $0x20,%esp
c0003939:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000393d:	74 12                	je     c0003951 <alloc_smap_bit+0x18e>
c000393f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003943:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003946:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003949:	0f 8c d4 fe ff ff    	jl     c0003823 <alloc_smap_bit+0x60>
c000394f:	eb 01                	jmp    c0003952 <alloc_smap_bit+0x18f>
c0003951:	90                   	nop
c0003952:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003955:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003958:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000395b:	8b 00                	mov    (%eax),%eax
c000395d:	01 d0                	add    %edx,%eax
c000395f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003962:	c9                   	leave  
c0003963:	c3                   	ret    

c0003964 <new_inode>:
c0003964:	55                   	push   %ebp
c0003965:	89 e5                	mov    %esp,%ebp
c0003967:	83 ec 38             	sub    $0x38,%esp
c000396a:	83 ec 08             	sub    $0x8,%esp
c000396d:	ff 75 0c             	pushl  0xc(%ebp)
c0003970:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003973:	50                   	push   %eax
c0003974:	e8 80 fa ff ff       	call   c00033f9 <get_inode>
c0003979:	83 c4 10             	add    $0x10,%esp
c000397c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000397f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003983:	75 0a                	jne    c000398f <new_inode+0x2b>
c0003985:	b8 00 00 00 00       	mov    $0x0,%eax
c000398a:	e9 f1 00 00 00       	jmp    c0003a80 <new_inode+0x11c>
c000398f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003992:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003995:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c000399c:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00039a3:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c00039aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c00039ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00039b0:	83 ec 0c             	sub    $0xc,%esp
c00039b3:	8d 45 c8             	lea    -0x38(%ebp),%eax
c00039b6:	50                   	push   %eax
c00039b7:	e8 11 0b 00 00       	call   c00044cd <sync_inode>
c00039bc:	83 c4 10             	add    $0x10,%esp
c00039bf:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00039c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00039cd:	eb 1d                	jmp    c00039ec <new_inode+0x88>
c00039cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00039d2:	89 d0                	mov    %edx,%eax
c00039d4:	c1 e0 02             	shl    $0x2,%eax
c00039d7:	01 d0                	add    %edx,%eax
c00039d9:	c1 e0 03             	shl    $0x3,%eax
c00039dc:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00039e1:	8b 00                	mov    (%eax),%eax
c00039e3:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00039e6:	74 0c                	je     c00039f4 <new_inode+0x90>
c00039e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00039ec:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00039f0:	7e dd                	jle    c00039cf <new_inode+0x6b>
c00039f2:	eb 01                	jmp    c00039f5 <new_inode+0x91>
c00039f4:	90                   	nop
c00039f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00039f8:	89 d0                	mov    %edx,%eax
c00039fa:	c1 e0 02             	shl    $0x2,%eax
c00039fd:	01 d0                	add    %edx,%eax
c00039ff:	c1 e0 03             	shl    $0x3,%eax
c0003a02:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003a07:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003a0a:	89 10                	mov    %edx,(%eax)
c0003a0c:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003a0f:	89 50 04             	mov    %edx,0x4(%eax)
c0003a12:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003a15:	89 50 08             	mov    %edx,0x8(%eax)
c0003a18:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003a1b:	89 50 0c             	mov    %edx,0xc(%eax)
c0003a1e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003a21:	89 50 10             	mov    %edx,0x10(%eax)
c0003a24:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003a27:	89 50 14             	mov    %edx,0x14(%eax)
c0003a2a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003a2d:	89 50 18             	mov    %edx,0x18(%eax)
c0003a30:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003a33:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003a36:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003a39:	89 50 20             	mov    %edx,0x20(%eax)
c0003a3c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003a3f:	89 50 24             	mov    %edx,0x24(%eax)
c0003a42:	8b 45 08             	mov    0x8(%ebp),%eax
c0003a45:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003a48:	89 10                	mov    %edx,(%eax)
c0003a4a:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003a4d:	89 50 04             	mov    %edx,0x4(%eax)
c0003a50:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003a53:	89 50 08             	mov    %edx,0x8(%eax)
c0003a56:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003a59:	89 50 0c             	mov    %edx,0xc(%eax)
c0003a5c:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003a5f:	89 50 10             	mov    %edx,0x10(%eax)
c0003a62:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003a65:	89 50 14             	mov    %edx,0x14(%eax)
c0003a68:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003a6b:	89 50 18             	mov    %edx,0x18(%eax)
c0003a6e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003a71:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003a74:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003a77:	89 50 20             	mov    %edx,0x20(%eax)
c0003a7a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003a7d:	89 50 24             	mov    %edx,0x24(%eax)
c0003a80:	c9                   	leave  
c0003a81:	c3                   	ret    

c0003a82 <new_dir_entry>:
c0003a82:	55                   	push   %ebp
c0003a83:	89 e5                	mov    %esp,%ebp
c0003a85:	83 ec 48             	sub    $0x48,%esp
c0003a88:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003a8f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a92:	8b 40 04             	mov    0x4(%eax),%eax
c0003a95:	99                   	cltd   
c0003a96:	f7 7d dc             	idivl  -0x24(%ebp)
c0003a99:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a9f:	8b 40 0c             	mov    0xc(%eax),%eax
c0003aa2:	99                   	cltd   
c0003aa3:	f7 7d dc             	idivl  -0x24(%ebp)
c0003aa6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003aa9:	e8 03 0c 00 00       	call   c00046b1 <get_super_block>
c0003aae:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003ab1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003ab4:	8b 00                	mov    (%eax),%eax
c0003ab6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003ab9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003abc:	8b 40 0c             	mov    0xc(%eax),%eax
c0003abf:	05 00 02 00 00       	add    $0x200,%eax
c0003ac4:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003aca:	85 c0                	test   %eax,%eax
c0003acc:	0f 48 c2             	cmovs  %edx,%eax
c0003acf:	c1 f8 09             	sar    $0x9,%eax
c0003ad2:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003ad5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003adc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003ae3:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003aea:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003af1:	eb 7d                	jmp    c0003b70 <new_dir_entry+0xee>
c0003af3:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003af8:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0003afb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003afe:	01 ca                	add    %ecx,%edx
c0003b00:	83 ec 0c             	sub    $0xc,%esp
c0003b03:	6a 07                	push   $0x7
c0003b05:	68 00 02 00 00       	push   $0x200
c0003b0a:	50                   	push   %eax
c0003b0b:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003b0e:	52                   	push   %edx
c0003b0f:	e8 75 ee ff ff       	call   c0002989 <rd_wt>
c0003b14:	83 c4 20             	add    $0x20,%esp
c0003b17:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003b1c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003b1f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003b26:	eb 25                	jmp    c0003b4d <new_dir_entry+0xcb>
c0003b28:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003b2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b2f:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003b32:	7f 29                	jg     c0003b5d <new_dir_entry+0xdb>
c0003b34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b37:	8b 00                	mov    (%eax),%eax
c0003b39:	85 c0                	test   %eax,%eax
c0003b3b:	75 08                	jne    c0003b45 <new_dir_entry+0xc3>
c0003b3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b40:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003b43:	eb 19                	jmp    c0003b5e <new_dir_entry+0xdc>
c0003b45:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003b49:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003b4d:	b8 00 02 00 00       	mov    $0x200,%eax
c0003b52:	99                   	cltd   
c0003b53:	f7 7d dc             	idivl  -0x24(%ebp)
c0003b56:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003b59:	7c cd                	jl     c0003b28 <new_dir_entry+0xa6>
c0003b5b:	eb 01                	jmp    c0003b5e <new_dir_entry+0xdc>
c0003b5d:	90                   	nop
c0003b5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b61:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003b64:	7f 16                	jg     c0003b7c <new_dir_entry+0xfa>
c0003b66:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b6a:	75 10                	jne    c0003b7c <new_dir_entry+0xfa>
c0003b6c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b73:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003b76:	0f 8c 77 ff ff ff    	jl     c0003af3 <new_dir_entry+0x71>
c0003b7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003b7f:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003b82:	75 0a                	jne    c0003b8e <new_dir_entry+0x10c>
c0003b84:	b8 00 00 00 00       	mov    $0x0,%eax
c0003b89:	e9 fa 00 00 00       	jmp    c0003c88 <new_dir_entry+0x206>
c0003b8e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003b95:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b99:	75 1e                	jne    c0003bb9 <new_dir_entry+0x137>
c0003b9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003ba1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ba4:	8b 50 04             	mov    0x4(%eax),%edx
c0003ba7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003baa:	01 c2                	add    %eax,%edx
c0003bac:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003baf:	89 50 04             	mov    %edx,0x4(%eax)
c0003bb2:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003bb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003bbc:	8b 55 14             	mov    0x14(%ebp),%edx
c0003bbf:	89 10                	mov    %edx,(%eax)
c0003bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003bc4:	83 c0 04             	add    $0x4,%eax
c0003bc7:	83 ec 08             	sub    $0x8,%esp
c0003bca:	ff 75 10             	pushl  0x10(%ebp)
c0003bcd:	50                   	push   %eax
c0003bce:	e8 23 71 00 00       	call   c000acf6 <Strcpy>
c0003bd3:	83 c4 10             	add    $0x10,%esp
c0003bd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0003bd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003bdc:	8b 0a                	mov    (%edx),%ecx
c0003bde:	89 08                	mov    %ecx,(%eax)
c0003be0:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003be3:	89 48 04             	mov    %ecx,0x4(%eax)
c0003be6:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003be9:	89 48 08             	mov    %ecx,0x8(%eax)
c0003bec:	8b 52 0c             	mov    0xc(%edx),%edx
c0003bef:	89 50 0c             	mov    %edx,0xc(%eax)
c0003bf2:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003bf7:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0003bfa:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003bfd:	01 ca                	add    %ecx,%edx
c0003bff:	83 ec 0c             	sub    $0xc,%esp
c0003c02:	6a 0a                	push   $0xa
c0003c04:	68 00 02 00 00       	push   $0x200
c0003c09:	50                   	push   %eax
c0003c0a:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003c0d:	52                   	push   %edx
c0003c0e:	e8 76 ed ff ff       	call   c0002989 <rd_wt>
c0003c13:	83 c4 20             	add    $0x20,%esp
c0003c16:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003c1a:	74 69                	je     c0003c85 <new_dir_entry+0x203>
c0003c1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c1f:	8b 10                	mov    (%eax),%edx
c0003c21:	89 15 a0 31 01 c0    	mov    %edx,0xc00131a0
c0003c27:	8b 50 04             	mov    0x4(%eax),%edx
c0003c2a:	89 15 a4 31 01 c0    	mov    %edx,0xc00131a4
c0003c30:	8b 50 08             	mov    0x8(%eax),%edx
c0003c33:	89 15 a8 31 01 c0    	mov    %edx,0xc00131a8
c0003c39:	8b 50 0c             	mov    0xc(%eax),%edx
c0003c3c:	89 15 ac 31 01 c0    	mov    %edx,0xc00131ac
c0003c42:	8b 50 10             	mov    0x10(%eax),%edx
c0003c45:	89 15 b0 31 01 c0    	mov    %edx,0xc00131b0
c0003c4b:	8b 50 14             	mov    0x14(%eax),%edx
c0003c4e:	89 15 b4 31 01 c0    	mov    %edx,0xc00131b4
c0003c54:	8b 50 18             	mov    0x18(%eax),%edx
c0003c57:	89 15 b8 31 01 c0    	mov    %edx,0xc00131b8
c0003c5d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003c60:	89 15 bc 31 01 c0    	mov    %edx,0xc00131bc
c0003c66:	8b 50 20             	mov    0x20(%eax),%edx
c0003c69:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003c6f:	8b 40 24             	mov    0x24(%eax),%eax
c0003c72:	a3 c4 31 01 c0       	mov    %eax,0xc00131c4
c0003c77:	83 ec 0c             	sub    $0xc,%esp
c0003c7a:	ff 75 0c             	pushl  0xc(%ebp)
c0003c7d:	e8 4b 08 00 00       	call   c00044cd <sync_inode>
c0003c82:	83 c4 10             	add    $0x10,%esp
c0003c85:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c88:	c9                   	leave  
c0003c89:	c3                   	ret    

c0003c8a <do_unlink>:
c0003c8a:	55                   	push   %ebp
c0003c8b:	89 e5                	mov    %esp,%ebp
c0003c8d:	53                   	push   %ebx
c0003c8e:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003c94:	83 ec 08             	sub    $0x8,%esp
c0003c97:	ff 75 08             	pushl  0x8(%ebp)
c0003c9a:	68 df a3 00 c0       	push   $0xc000a3df
c0003c9f:	e8 d3 5e 00 00       	call   c0009b77 <strcmp>
c0003ca4:	83 c4 10             	add    $0x10,%esp
c0003ca7:	85 c0                	test   %eax,%eax
c0003ca9:	75 10                	jne    c0003cbb <do_unlink+0x31>
c0003cab:	83 ec 0c             	sub    $0xc,%esp
c0003cae:	68 e1 a3 00 c0       	push   $0xc000a3e1
c0003cb3:	e8 4e 53 00 00       	call   c0009006 <panic>
c0003cb8:	83 c4 10             	add    $0x10,%esp
c0003cbb:	83 ec 0c             	sub    $0xc,%esp
c0003cbe:	ff 75 08             	pushl  0x8(%ebp)
c0003cc1:	e8 37 f5 ff ff       	call   c00031fd <search_file>
c0003cc6:	83 c4 10             	add    $0x10,%esp
c0003cc9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003ccc:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003cd0:	75 10                	jne    c0003ce2 <do_unlink+0x58>
c0003cd2:	83 ec 0c             	sub    $0xc,%esp
c0003cd5:	68 fd a3 00 c0       	push   $0xc000a3fd
c0003cda:	e8 27 53 00 00       	call   c0009006 <panic>
c0003cdf:	83 c4 10             	add    $0x10,%esp
c0003ce2:	83 ec 08             	sub    $0x8,%esp
c0003ce5:	ff 75 d0             	pushl  -0x30(%ebp)
c0003ce8:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003cee:	50                   	push   %eax
c0003cef:	e8 05 f7 ff ff       	call   c00033f9 <get_inode>
c0003cf4:	83 c4 10             	add    $0x10,%esp
c0003cf7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003cfa:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003cfe:	75 10                	jne    c0003d10 <do_unlink+0x86>
c0003d00:	83 ec 0c             	sub    $0xc,%esp
c0003d03:	68 fd a3 00 c0       	push   $0xc000a3fd
c0003d08:	e8 f9 52 00 00       	call   c0009006 <panic>
c0003d0d:	83 c4 10             	add    $0x10,%esp
c0003d10:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003d13:	85 c0                	test   %eax,%eax
c0003d15:	7e 10                	jle    c0003d27 <do_unlink+0x9d>
c0003d17:	83 ec 0c             	sub    $0xc,%esp
c0003d1a:	68 18 a4 00 c0       	push   $0xc000a418
c0003d1f:	e8 e2 52 00 00       	call   c0009006 <panic>
c0003d24:	83 c4 10             	add    $0x10,%esp
c0003d27:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003d2d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003d30:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003d33:	8d 50 07             	lea    0x7(%eax),%edx
c0003d36:	85 c0                	test   %eax,%eax
c0003d38:	0f 48 c2             	cmovs  %edx,%eax
c0003d3b:	c1 f8 03             	sar    $0x3,%eax
c0003d3e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003d41:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003d44:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d4a:	85 c0                	test   %eax,%eax
c0003d4c:	0f 48 c2             	cmovs  %edx,%eax
c0003d4f:	c1 f8 09             	sar    $0x9,%eax
c0003d52:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003d55:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003d58:	99                   	cltd   
c0003d59:	c1 ea 1d             	shr    $0x1d,%edx
c0003d5c:	01 d0                	add    %edx,%eax
c0003d5e:	83 e0 07             	and    $0x7,%eax
c0003d61:	29 d0                	sub    %edx,%eax
c0003d63:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003d66:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003d6d:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003d72:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0003d75:	83 c2 02             	add    $0x2,%edx
c0003d78:	83 ec 0c             	sub    $0xc,%esp
c0003d7b:	6a 07                	push   $0x7
c0003d7d:	68 00 02 00 00       	push   $0x200
c0003d82:	50                   	push   %eax
c0003d83:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d86:	52                   	push   %edx
c0003d87:	e8 fd eb ff ff       	call   c0002989 <rd_wt>
c0003d8c:	83 c4 20             	add    $0x20,%esp
c0003d8f:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003d95:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003d98:	01 d0                	add    %edx,%eax
c0003d9a:	0f b6 10             	movzbl (%eax),%edx
c0003d9d:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003da0:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003da5:	89 c1                	mov    %eax,%ecx
c0003da7:	d3 e3                	shl    %cl,%ebx
c0003da9:	89 d8                	mov    %ebx,%eax
c0003dab:	f7 d0                	not    %eax
c0003dad:	89 c3                	mov    %eax,%ebx
c0003daf:	8b 0d 20 e0 00 c0    	mov    0xc000e020,%ecx
c0003db5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003db8:	01 c8                	add    %ecx,%eax
c0003dba:	21 da                	and    %ebx,%edx
c0003dbc:	88 10                	mov    %dl,(%eax)
c0003dbe:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003dc3:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0003dc6:	83 c2 02             	add    $0x2,%edx
c0003dc9:	83 ec 0c             	sub    $0xc,%esp
c0003dcc:	6a 0a                	push   $0xa
c0003dce:	68 00 02 00 00       	push   $0x200
c0003dd3:	50                   	push   %eax
c0003dd4:	ff 75 b8             	pushl  -0x48(%ebp)
c0003dd7:	52                   	push   %edx
c0003dd8:	e8 ac eb ff ff       	call   c0002989 <rd_wt>
c0003ddd:	83 c4 20             	add    $0x20,%esp
c0003de0:	e8 cc 08 00 00       	call   c00046b1 <get_super_block>
c0003de5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003de8:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003dee:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003df1:	8b 00                	mov    (%eax),%eax
c0003df3:	29 c2                	sub    %eax,%edx
c0003df5:	89 d0                	mov    %edx,%eax
c0003df7:	83 c0 01             	add    $0x1,%eax
c0003dfa:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003dfd:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003e00:	8d 50 07             	lea    0x7(%eax),%edx
c0003e03:	85 c0                	test   %eax,%eax
c0003e05:	0f 48 c2             	cmovs  %edx,%eax
c0003e08:	c1 f8 03             	sar    $0x3,%eax
c0003e0b:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003e0e:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003e11:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003e17:	85 c0                	test   %eax,%eax
c0003e19:	0f 48 c2             	cmovs  %edx,%eax
c0003e1c:	c1 f8 09             	sar    $0x9,%eax
c0003e1f:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003e22:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003e25:	99                   	cltd   
c0003e26:	c1 ea 1d             	shr    $0x1d,%edx
c0003e29:	01 d0                	add    %edx,%eax
c0003e2b:	83 e0 07             	and    $0x7,%eax
c0003e2e:	29 d0                	sub    %edx,%eax
c0003e30:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003e33:	b8 08 00 00 00       	mov    $0x8,%eax
c0003e38:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003e3b:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003e3e:	29 c2                	sub    %eax,%edx
c0003e40:	89 d0                	mov    %edx,%eax
c0003e42:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e48:	8d 50 07             	lea    0x7(%eax),%edx
c0003e4b:	85 c0                	test   %eax,%eax
c0003e4d:	0f 48 c2             	cmovs  %edx,%eax
c0003e50:	c1 f8 03             	sar    $0x3,%eax
c0003e53:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003e56:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003e5b:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0003e5e:	8b 52 04             	mov    0x4(%edx),%edx
c0003e61:	8d 4a 02             	lea    0x2(%edx),%ecx
c0003e64:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003e67:	01 ca                	add    %ecx,%edx
c0003e69:	83 ec 0c             	sub    $0xc,%esp
c0003e6c:	6a 07                	push   $0x7
c0003e6e:	68 00 02 00 00       	push   $0x200
c0003e73:	50                   	push   %eax
c0003e74:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e77:	52                   	push   %edx
c0003e78:	e8 0c eb ff ff       	call   c0002989 <rd_wt>
c0003e7d:	83 c4 20             	add    $0x20,%esp
c0003e80:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003e86:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003e89:	01 d0                	add    %edx,%eax
c0003e8b:	0f b6 10             	movzbl (%eax),%edx
c0003e8e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003e91:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003e96:	89 c1                	mov    %eax,%ecx
c0003e98:	d3 e3                	shl    %cl,%ebx
c0003e9a:	89 d8                	mov    %ebx,%eax
c0003e9c:	f7 d0                	not    %eax
c0003e9e:	89 c3                	mov    %eax,%ebx
c0003ea0:	8b 0d 20 e0 00 c0    	mov    0xc000e020,%ecx
c0003ea6:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003ea9:	01 c8                	add    %ecx,%eax
c0003eab:	21 da                	and    %ebx,%edx
c0003ead:	88 10                	mov    %dl,(%eax)
c0003eaf:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003eb6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003eb9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003ebc:	eb 6a                	jmp    c0003f28 <do_unlink+0x29e>
c0003ebe:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003ec5:	75 4b                	jne    c0003f12 <do_unlink+0x288>
c0003ec7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003ece:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003ed3:	83 ec 0c             	sub    $0xc,%esp
c0003ed6:	6a 0a                	push   $0xa
c0003ed8:	68 00 02 00 00       	push   $0x200
c0003edd:	50                   	push   %eax
c0003ede:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ee1:	ff 75 ec             	pushl  -0x14(%ebp)
c0003ee4:	e8 a0 ea ff ff       	call   c0002989 <rd_wt>
c0003ee9:	83 c4 20             	add    $0x20,%esp
c0003eec:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003ef2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003ef5:	8d 48 01             	lea    0x1(%eax),%ecx
c0003ef8:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0003efb:	83 ec 0c             	sub    $0xc,%esp
c0003efe:	6a 07                	push   $0x7
c0003f00:	68 00 02 00 00       	push   $0x200
c0003f05:	52                   	push   %edx
c0003f06:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f09:	50                   	push   %eax
c0003f0a:	e8 7a ea ff ff       	call   c0002989 <rd_wt>
c0003f0f:	83 c4 20             	add    $0x20,%esp
c0003f12:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003f18:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f1b:	01 d0                	add    %edx,%eax
c0003f1d:	c6 00 00             	movb   $0x0,(%eax)
c0003f20:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003f24:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003f28:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f2b:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003f2e:	7c 8e                	jl     c0003ebe <do_unlink+0x234>
c0003f30:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003f37:	75 4b                	jne    c0003f84 <do_unlink+0x2fa>
c0003f39:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003f40:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003f45:	83 ec 0c             	sub    $0xc,%esp
c0003f48:	6a 0a                	push   $0xa
c0003f4a:	68 00 02 00 00       	push   $0x200
c0003f4f:	50                   	push   %eax
c0003f50:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f53:	ff 75 ec             	pushl  -0x14(%ebp)
c0003f56:	e8 2e ea ff ff       	call   c0002989 <rd_wt>
c0003f5b:	83 c4 20             	add    $0x20,%esp
c0003f5e:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003f64:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003f67:	8d 48 01             	lea    0x1(%eax),%ecx
c0003f6a:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0003f6d:	83 ec 0c             	sub    $0xc,%esp
c0003f70:	6a 07                	push   $0x7
c0003f72:	68 00 02 00 00       	push   $0x200
c0003f77:	52                   	push   %edx
c0003f78:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f7b:	50                   	push   %eax
c0003f7c:	e8 08 ea ff ff       	call   c0002989 <rd_wt>
c0003f81:	83 c4 20             	add    $0x20,%esp
c0003f84:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0003f8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f8d:	01 d0                	add    %edx,%eax
c0003f8f:	0f b6 10             	movzbl (%eax),%edx
c0003f92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f95:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003f9a:	89 c1                	mov    %eax,%ecx
c0003f9c:	d3 e3                	shl    %cl,%ebx
c0003f9e:	89 d8                	mov    %ebx,%eax
c0003fa0:	89 c3                	mov    %eax,%ebx
c0003fa2:	8b 0d 20 e0 00 c0    	mov    0xc000e020,%ecx
c0003fa8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003fab:	01 c8                	add    %ecx,%eax
c0003fad:	21 da                	and    %ebx,%edx
c0003faf:	88 10                	mov    %dl,(%eax)
c0003fb1:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0003fb6:	83 ec 0c             	sub    $0xc,%esp
c0003fb9:	6a 0a                	push   $0xa
c0003fbb:	68 00 02 00 00       	push   $0x200
c0003fc0:	50                   	push   %eax
c0003fc1:	ff 75 b8             	pushl  -0x48(%ebp)
c0003fc4:	ff 75 ec             	pushl  -0x14(%ebp)
c0003fc7:	e8 bd e9 ff ff       	call   c0002989 <rd_wt>
c0003fcc:	83 c4 20             	add    $0x20,%esp
c0003fcf:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0003fd6:	00 00 00 
c0003fd9:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0003fe0:	00 00 00 
c0003fe3:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0003fea:	00 00 00 
c0003fed:	83 ec 0c             	sub    $0xc,%esp
c0003ff0:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003ff6:	50                   	push   %eax
c0003ff7:	e8 d1 04 00 00       	call   c00044cd <sync_inode>
c0003ffc:	83 c4 10             	add    $0x10,%esp
c0003fff:	83 ec 0c             	sub    $0xc,%esp
c0004002:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0004008:	50                   	push   %eax
c0004009:	e8 13 06 00 00       	call   c0004621 <put_inode>
c000400e:	83 c4 10             	add    $0x10,%esp
c0004011:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004014:	8b 00                	mov    (%eax),%eax
c0004016:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004019:	c7 45 98 a0 31 01 c0 	movl   $0xc00131a0,-0x68(%ebp)
c0004020:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004023:	8b 40 04             	mov    0x4(%eax),%eax
c0004026:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004029:	8b 45 98             	mov    -0x68(%ebp),%eax
c000402c:	8b 40 0c             	mov    0xc(%eax),%eax
c000402f:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004032:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004035:	c1 e8 04             	shr    $0x4,%eax
c0004038:	89 45 8c             	mov    %eax,-0x74(%ebp)
c000403b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004042:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004049:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004050:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0004057:	e9 a3 00 00 00       	jmp    c00040ff <do_unlink+0x475>
c000405c:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0004061:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c0004064:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0004067:	01 ca                	add    %ecx,%edx
c0004069:	83 ec 0c             	sub    $0xc,%esp
c000406c:	6a 07                	push   $0x7
c000406e:	68 00 02 00 00       	push   $0x200
c0004073:	50                   	push   %eax
c0004074:	ff 75 b8             	pushl  -0x48(%ebp)
c0004077:	52                   	push   %edx
c0004078:	e8 0c e9 ff ff       	call   c0002989 <rd_wt>
c000407d:	83 c4 20             	add    $0x20,%esp
c0004080:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0004085:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004088:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c000408f:	eb 51                	jmp    c00040e2 <do_unlink+0x458>
c0004091:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0004095:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004098:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c000409b:	7f 4f                	jg     c00040ec <do_unlink+0x462>
c000409d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00040a0:	83 c0 10             	add    $0x10,%eax
c00040a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00040a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00040a9:	83 c0 04             	add    $0x4,%eax
c00040ac:	83 ec 08             	sub    $0x8,%esp
c00040af:	ff 75 08             	pushl  0x8(%ebp)
c00040b2:	50                   	push   %eax
c00040b3:	e8 bf 5a 00 00       	call   c0009b77 <strcmp>
c00040b8:	83 c4 10             	add    $0x10,%esp
c00040bb:	85 c0                	test   %eax,%eax
c00040bd:	75 1b                	jne    c00040da <do_unlink+0x450>
c00040bf:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00040c6:	83 ec 04             	sub    $0x4,%esp
c00040c9:	6a 10                	push   $0x10
c00040cb:	6a 00                	push   $0x0
c00040cd:	ff 75 d4             	pushl  -0x2c(%ebp)
c00040d0:	e8 02 6c 00 00       	call   c000acd7 <Memset>
c00040d5:	83 c4 10             	add    $0x10,%esp
c00040d8:	eb 13                	jmp    c00040ed <do_unlink+0x463>
c00040da:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c00040de:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c00040e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00040e5:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00040e8:	7c a7                	jl     c0004091 <do_unlink+0x407>
c00040ea:	eb 01                	jmp    c00040ed <do_unlink+0x463>
c00040ec:	90                   	nop
c00040ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00040f0:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00040f3:	7f 16                	jg     c000410b <do_unlink+0x481>
c00040f5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00040f9:	75 10                	jne    c000410b <do_unlink+0x481>
c00040fb:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00040ff:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004102:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0004105:	0f 8c 51 ff ff ff    	jl     c000405c <do_unlink+0x3d2>
c000410b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000410e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004111:	75 17                	jne    c000412a <do_unlink+0x4a0>
c0004113:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004116:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004119:	89 50 04             	mov    %edx,0x4(%eax)
c000411c:	83 ec 0c             	sub    $0xc,%esp
c000411f:	ff 75 98             	pushl  -0x68(%ebp)
c0004122:	e8 a6 03 00 00       	call   c00044cd <sync_inode>
c0004127:	83 c4 10             	add    $0x10,%esp
c000412a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000412e:	74 24                	je     c0004154 <do_unlink+0x4ca>
c0004130:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0004135:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c0004138:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000413b:	01 ca                	add    %ecx,%edx
c000413d:	83 ec 0c             	sub    $0xc,%esp
c0004140:	6a 0a                	push   $0xa
c0004142:	68 00 02 00 00       	push   $0x200
c0004147:	50                   	push   %eax
c0004148:	ff 75 b8             	pushl  -0x48(%ebp)
c000414b:	52                   	push   %edx
c000414c:	e8 38 e8 ff ff       	call   c0002989 <rd_wt>
c0004151:	83 c4 20             	add    $0x20,%esp
c0004154:	90                   	nop
c0004155:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004158:	c9                   	leave  
c0004159:	c3                   	ret    

c000415a <do_rdwt>:
c000415a:	55                   	push   %ebp
c000415b:	89 e5                	mov    %esp,%ebp
c000415d:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0004163:	8b 45 08             	mov    0x8(%ebp),%eax
c0004166:	8b 40 68             	mov    0x68(%eax),%eax
c0004169:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000416c:	8b 45 08             	mov    0x8(%ebp),%eax
c000416f:	8b 40 50             	mov    0x50(%eax),%eax
c0004172:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004175:	8b 45 08             	mov    0x8(%ebp),%eax
c0004178:	8b 40 5c             	mov    0x5c(%eax),%eax
c000417b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000417e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004181:	8b 00                	mov    (%eax),%eax
c0004183:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004186:	8b 45 08             	mov    0x8(%ebp),%eax
c0004189:	8b 40 10             	mov    0x10(%eax),%eax
c000418c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000418f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004192:	8b 40 40             	mov    0x40(%eax),%eax
c0004195:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004198:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000419b:	6b d0 6c             	imul   $0x6c,%eax,%edx
c000419e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00041a1:	01 d0                	add    %edx,%eax
c00041a3:	83 c0 50             	add    $0x50,%eax
c00041a6:	8b 04 85 e4 32 08 c0 	mov    -0x3ff7cd1c(,%eax,4),%eax
c00041ad:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00041b0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00041b3:	8b 40 08             	mov    0x8(%eax),%eax
c00041b6:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00041b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00041bc:	8b 00                	mov    (%eax),%eax
c00041be:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00041c1:	83 ec 08             	sub    $0x8,%esp
c00041c4:	ff 75 c0             	pushl  -0x40(%ebp)
c00041c7:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00041cd:	50                   	push   %eax
c00041ce:	e8 26 f2 ff ff       	call   c00033f9 <get_inode>
c00041d3:	83 c4 10             	add    $0x10,%esp
c00041d6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00041d9:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c00041dd:	75 10                	jne    c00041ef <do_rdwt+0x95>
c00041df:	83 ec 0c             	sub    $0xc,%esp
c00041e2:	68 50 a4 00 c0       	push   $0xc000a450
c00041e7:	e8 1a 4e 00 00       	call   c0009006 <panic>
c00041ec:	83 c4 10             	add    $0x10,%esp
c00041ef:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00041f5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00041f8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00041fb:	8b 40 04             	mov    0x4(%eax),%eax
c00041fe:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0004201:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004205:	74 22                	je     c0004229 <do_rdwt+0xcf>
c0004207:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000420b:	74 1c                	je     c0004229 <do_rdwt+0xcf>
c000420d:	68 c9 04 00 00       	push   $0x4c9
c0004212:	68 33 a3 00 c0       	push   $0xc000a333
c0004217:	68 33 a3 00 c0       	push   $0xc000a333
c000421c:	68 60 a4 00 c0       	push   $0xc000a460
c0004221:	e8 fe 4d 00 00       	call   c0009024 <assertion_failure>
c0004226:	83 c4 10             	add    $0x10,%esp
c0004229:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c000422f:	83 f8 01             	cmp    $0x1,%eax
c0004232:	75 4a                	jne    c000427e <do_rdwt+0x124>
c0004234:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004238:	75 09                	jne    c0004243 <do_rdwt+0xe9>
c000423a:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0004241:	eb 0d                	jmp    c0004250 <do_rdwt+0xf6>
c0004243:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004247:	75 07                	jne    c0004250 <do_rdwt+0xf6>
c0004249:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0004250:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004253:	8b 45 08             	mov    0x8(%ebp),%eax
c0004256:	89 50 68             	mov    %edx,0x68(%eax)
c0004259:	8b 55 bc             	mov    -0x44(%ebp),%edx
c000425c:	8b 45 08             	mov    0x8(%ebp),%eax
c000425f:	89 50 58             	mov    %edx,0x58(%eax)
c0004262:	83 ec 04             	sub    $0x4,%esp
c0004265:	6a 02                	push   $0x2
c0004267:	ff 75 08             	pushl  0x8(%ebp)
c000426a:	6a 03                	push   $0x3
c000426c:	e8 be 55 00 00       	call   c000982f <send_rec>
c0004271:	83 c4 10             	add    $0x10,%esp
c0004274:	b8 00 00 00 00       	mov    $0x0,%eax
c0004279:	e9 4d 02 00 00       	jmp    c00044cb <do_rdwt+0x371>
c000427e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004282:	75 12                	jne    c0004296 <do_rdwt+0x13c>
c0004284:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004287:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
c000428a:	75 0a                	jne    c0004296 <do_rdwt+0x13c>
c000428c:	b8 00 00 00 00       	mov    $0x0,%eax
c0004291:	e9 35 02 00 00       	jmp    c00044cb <do_rdwt+0x371>
c0004296:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c000429a:	75 18                	jne    c00042b4 <do_rdwt+0x15a>
c000429c:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00042a2:	c1 e0 09             	shl    $0x9,%eax
c00042a5:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00042a8:	75 0a                	jne    c00042b4 <do_rdwt+0x15a>
c00042aa:	b8 00 00 00 00       	mov    $0x0,%eax
c00042af:	e9 17 02 00 00       	jmp    c00044cb <do_rdwt+0x371>
c00042b4:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00042b8:	75 14                	jne    c00042ce <do_rdwt+0x174>
c00042ba:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00042bd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042c0:	01 d0                	add    %edx,%eax
c00042c2:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c00042c5:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
c00042c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00042cc:	eb 19                	jmp    c00042e7 <do_rdwt+0x18d>
c00042ce:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00042d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042d4:	01 c2                	add    %eax,%edx
c00042d6:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00042dc:	c1 e0 09             	shl    $0x9,%eax
c00042df:	39 c2                	cmp    %eax,%edx
c00042e1:	0f 4e c2             	cmovle %edx,%eax
c00042e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00042e7:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00042ea:	99                   	cltd   
c00042eb:	c1 ea 17             	shr    $0x17,%edx
c00042ee:	01 d0                	add    %edx,%eax
c00042f0:	25 ff 01 00 00       	and    $0x1ff,%eax
c00042f5:	29 d0                	sub    %edx,%eax
c00042f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00042fa:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0004300:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004303:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004309:	85 c0                	test   %eax,%eax
c000430b:	0f 48 c1             	cmovs  %ecx,%eax
c000430e:	c1 f8 09             	sar    $0x9,%eax
c0004311:	01 d0                	add    %edx,%eax
c0004313:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004316:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c000431c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000431f:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004325:	85 c0                	test   %eax,%eax
c0004327:	0f 48 c1             	cmovs  %ecx,%eax
c000432a:	c1 f8 09             	sar    $0x9,%eax
c000432d:	01 d0                	add    %edx,%eax
c000432f:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004332:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0004335:	2b 45 ac             	sub    -0x54(%ebp),%eax
c0004338:	ba 00 00 10 00       	mov    $0x100000,%edx
c000433d:	39 d0                	cmp    %edx,%eax
c000433f:	7d 0b                	jge    c000434c <do_rdwt+0x1f2>
c0004341:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0004344:	2b 45 ac             	sub    -0x54(%ebp),%eax
c0004347:	83 c0 01             	add    $0x1,%eax
c000434a:	eb 05                	jmp    c0004351 <do_rdwt+0x1f7>
c000434c:	b8 00 00 10 00       	mov    $0x100000,%eax
c0004351:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004354:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004357:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000435a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004361:	8b 45 08             	mov    0x8(%ebp),%eax
c0004364:	8b 00                	mov    (%eax),%eax
c0004366:	83 ec 0c             	sub    $0xc,%esp
c0004369:	50                   	push   %eax
c000436a:	e8 2f 05 00 00       	call   c000489e <pid2proc>
c000436f:	83 c4 10             	add    $0x10,%esp
c0004372:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004375:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004378:	8b 80 78 01 00 00    	mov    0x178(%eax),%eax
c000437e:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004381:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0004384:	83 ec 08             	sub    $0x8,%esp
c0004387:	ff 75 a0             	pushl  -0x60(%ebp)
c000438a:	50                   	push   %eax
c000438b:	e8 43 06 00 00       	call   c00049d3 <Seg2PhyAddrLDT>
c0004390:	83 c4 10             	add    $0x10,%esp
c0004393:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004396:	8b 55 98             	mov    -0x68(%ebp),%edx
c0004399:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000439c:	01 d0                	add    %edx,%eax
c000439e:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00043a1:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00043a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00043a7:	e9 c7 00 00 00       	jmp    c0004473 <do_rdwt+0x319>
c00043ac:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00043af:	c1 e0 09             	shl    $0x9,%eax
c00043b2:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00043b5:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00043b8:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c00043bc:	89 45 90             	mov    %eax,-0x70(%ebp)
c00043bf:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
c00043c6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00043c9:	c1 e0 09             	shl    $0x9,%eax
c00043cc:	89 c2                	mov    %eax,%edx
c00043ce:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00043d3:	83 ec 0c             	sub    $0xc,%esp
c00043d6:	6a 07                	push   $0x7
c00043d8:	52                   	push   %edx
c00043d9:	50                   	push   %eax
c00043da:	ff 75 8c             	pushl  -0x74(%ebp)
c00043dd:	ff 75 e0             	pushl  -0x20(%ebp)
c00043e0:	e8 a4 e5 ff ff       	call   c0002989 <rd_wt>
c00043e5:	83 c4 20             	add    $0x20,%esp
c00043e8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00043ec:	75 25                	jne    c0004413 <do_rdwt+0x2b9>
c00043ee:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c00043f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00043f7:	01 d0                	add    %edx,%eax
c00043f9:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c00043fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00043ff:	01 ca                	add    %ecx,%edx
c0004401:	83 ec 04             	sub    $0x4,%esp
c0004404:	ff 75 90             	pushl  -0x70(%ebp)
c0004407:	50                   	push   %eax
c0004408:	52                   	push   %edx
c0004409:	e8 9b 68 00 00       	call   c000aca9 <Memcpy>
c000440e:	83 c4 10             	add    $0x10,%esp
c0004411:	eb 47                	jmp    c000445a <do_rdwt+0x300>
c0004413:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0004416:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004419:	01 d0                	add    %edx,%eax
c000441b:	89 c1                	mov    %eax,%ecx
c000441d:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c0004423:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004426:	01 d0                	add    %edx,%eax
c0004428:	83 ec 04             	sub    $0x4,%esp
c000442b:	ff 75 90             	pushl  -0x70(%ebp)
c000442e:	51                   	push   %ecx
c000442f:	50                   	push   %eax
c0004430:	e8 74 68 00 00       	call   c000aca9 <Memcpy>
c0004435:	83 c4 10             	add    $0x10,%esp
c0004438:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000443b:	c1 e0 09             	shl    $0x9,%eax
c000443e:	89 c2                	mov    %eax,%edx
c0004440:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0004445:	83 ec 0c             	sub    $0xc,%esp
c0004448:	6a 0a                	push   $0xa
c000444a:	52                   	push   %edx
c000444b:	50                   	push   %eax
c000444c:	ff 75 8c             	pushl  -0x74(%ebp)
c000444f:	ff 75 e0             	pushl  -0x20(%ebp)
c0004452:	e8 32 e5 ff ff       	call   c0002989 <rd_wt>
c0004457:	83 c4 20             	add    $0x20,%esp
c000445a:	8b 45 90             	mov    -0x70(%ebp),%eax
c000445d:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004460:	8b 45 90             	mov    -0x70(%ebp),%eax
c0004463:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0004466:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000446d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004470:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004473:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004476:	3b 45 a8             	cmp    -0x58(%ebp),%eax
c0004479:	7f 0a                	jg     c0004485 <do_rdwt+0x32b>
c000447b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000447f:	0f 85 27 ff ff ff    	jne    c00043ac <do_rdwt+0x252>
c0004485:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004488:	8b 50 04             	mov    0x4(%eax),%edx
c000448b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000448e:	01 c2                	add    %eax,%edx
c0004490:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004493:	89 50 04             	mov    %edx,0x4(%eax)
c0004496:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0004499:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000449c:	01 c2                	add    %eax,%edx
c000449e:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00044a4:	39 c2                	cmp    %eax,%edx
c00044a6:	7e 20                	jle    c00044c8 <do_rdwt+0x36e>
c00044a8:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00044ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00044ae:	01 d0                	add    %edx,%eax
c00044b0:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c00044b6:	83 ec 0c             	sub    $0xc,%esp
c00044b9:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00044bf:	50                   	push   %eax
c00044c0:	e8 08 00 00 00       	call   c00044cd <sync_inode>
c00044c5:	83 c4 10             	add    $0x10,%esp
c00044c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00044cb:	c9                   	leave  
c00044cc:	c3                   	ret    

c00044cd <sync_inode>:
c00044cd:	55                   	push   %ebp
c00044ce:	89 e5                	mov    %esp,%ebp
c00044d0:	53                   	push   %ebx
c00044d1:	83 ec 34             	sub    $0x34,%esp
c00044d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00044db:	eb 74                	jmp    c0004551 <sync_inode+0x84>
c00044dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00044e0:	89 d0                	mov    %edx,%eax
c00044e2:	c1 e0 02             	shl    $0x2,%eax
c00044e5:	01 d0                	add    %edx,%eax
c00044e7:	c1 e0 03             	shl    $0x3,%eax
c00044ea:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00044ef:	8b 10                	mov    (%eax),%edx
c00044f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00044f4:	8b 40 10             	mov    0x10(%eax),%eax
c00044f7:	39 c2                	cmp    %eax,%edx
c00044f9:	75 52                	jne    c000454d <sync_inode+0x80>
c00044fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00044fe:	89 d0                	mov    %edx,%eax
c0004500:	c1 e0 02             	shl    $0x2,%eax
c0004503:	01 d0                	add    %edx,%eax
c0004505:	c1 e0 03             	shl    $0x3,%eax
c0004508:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c000450e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004511:	8b 08                	mov    (%eax),%ecx
c0004513:	89 0a                	mov    %ecx,(%edx)
c0004515:	8b 48 04             	mov    0x4(%eax),%ecx
c0004518:	89 4a 04             	mov    %ecx,0x4(%edx)
c000451b:	8b 48 08             	mov    0x8(%eax),%ecx
c000451e:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004521:	8b 48 0c             	mov    0xc(%eax),%ecx
c0004524:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0004527:	8b 48 10             	mov    0x10(%eax),%ecx
c000452a:	89 4a 10             	mov    %ecx,0x10(%edx)
c000452d:	8b 48 14             	mov    0x14(%eax),%ecx
c0004530:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004533:	8b 48 18             	mov    0x18(%eax),%ecx
c0004536:	89 4a 18             	mov    %ecx,0x18(%edx)
c0004539:	8b 48 1c             	mov    0x1c(%eax),%ecx
c000453c:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c000453f:	8b 48 20             	mov    0x20(%eax),%ecx
c0004542:	89 4a 20             	mov    %ecx,0x20(%edx)
c0004545:	8b 40 24             	mov    0x24(%eax),%eax
c0004548:	89 42 24             	mov    %eax,0x24(%edx)
c000454b:	eb 0a                	jmp    c0004557 <sync_inode+0x8a>
c000454d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004551:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0004555:	7e 86                	jle    c00044dd <sync_inode+0x10>
c0004557:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c000455e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004561:	8b 40 10             	mov    0x10(%eax),%eax
c0004564:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004567:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000456a:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000456d:	b8 00 02 00 00       	mov    $0x200,%eax
c0004572:	99                   	cltd   
c0004573:	f7 7d f0             	idivl  -0x10(%ebp)
c0004576:	89 c3                	mov    %eax,%ebx
c0004578:	89 c8                	mov    %ecx,%eax
c000457a:	99                   	cltd   
c000457b:	f7 fb                	idiv   %ebx
c000457d:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004580:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004583:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004586:	b8 00 02 00 00       	mov    $0x200,%eax
c000458b:	99                   	cltd   
c000458c:	f7 7d f0             	idivl  -0x10(%ebp)
c000458f:	89 c3                	mov    %eax,%ebx
c0004591:	89 c8                	mov    %ecx,%eax
c0004593:	99                   	cltd   
c0004594:	f7 fb                	idiv   %ebx
c0004596:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004599:	8b 45 08             	mov    0x8(%ebp),%eax
c000459c:	8b 40 20             	mov    0x20(%eax),%eax
c000459f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00045a2:	e8 0a 01 00 00       	call   c00046b1 <get_super_block>
c00045a7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00045aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045ad:	8b 40 04             	mov    0x4(%eax),%eax
c00045b0:	8d 50 02             	lea    0x2(%eax),%edx
c00045b3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045b6:	8b 40 08             	mov    0x8(%eax),%eax
c00045b9:	01 c2                	add    %eax,%edx
c00045bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00045be:	01 d0                	add    %edx,%eax
c00045c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00045c3:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00045c8:	83 ec 0c             	sub    $0xc,%esp
c00045cb:	6a 07                	push   $0x7
c00045cd:	68 00 02 00 00       	push   $0x200
c00045d2:	50                   	push   %eax
c00045d3:	ff 75 e0             	pushl  -0x20(%ebp)
c00045d6:	ff 75 d8             	pushl  -0x28(%ebp)
c00045d9:	e8 ab e3 ff ff       	call   c0002989 <rd_wt>
c00045de:	83 c4 20             	add    $0x20,%esp
c00045e1:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00045e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00045e9:	83 ec 04             	sub    $0x4,%esp
c00045ec:	ff 75 f0             	pushl  -0x10(%ebp)
c00045ef:	ff 75 08             	pushl  0x8(%ebp)
c00045f2:	ff 75 d4             	pushl  -0x2c(%ebp)
c00045f5:	e8 af 66 00 00       	call   c000aca9 <Memcpy>
c00045fa:	83 c4 10             	add    $0x10,%esp
c00045fd:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c0004602:	83 ec 0c             	sub    $0xc,%esp
c0004605:	6a 0a                	push   $0xa
c0004607:	68 00 02 00 00       	push   $0x200
c000460c:	50                   	push   %eax
c000460d:	ff 75 e0             	pushl  -0x20(%ebp)
c0004610:	ff 75 d8             	pushl  -0x28(%ebp)
c0004613:	e8 71 e3 ff ff       	call   c0002989 <rd_wt>
c0004618:	83 c4 20             	add    $0x20,%esp
c000461b:	90                   	nop
c000461c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000461f:	c9                   	leave  
c0004620:	c3                   	ret    

c0004621 <put_inode>:
c0004621:	55                   	push   %ebp
c0004622:	89 e5                	mov    %esp,%ebp
c0004624:	83 ec 08             	sub    $0x8,%esp
c0004627:	8b 45 08             	mov    0x8(%ebp),%eax
c000462a:	8b 40 24             	mov    0x24(%eax),%eax
c000462d:	85 c0                	test   %eax,%eax
c000462f:	7f 1c                	jg     c000464d <put_inode+0x2c>
c0004631:	68 63 05 00 00       	push   $0x563
c0004636:	68 33 a3 00 c0       	push   $0xc000a333
c000463b:	68 33 a3 00 c0       	push   $0xc000a333
c0004640:	68 94 a4 00 c0       	push   $0xc000a494
c0004645:	e8 da 49 00 00       	call   c0009024 <assertion_failure>
c000464a:	83 c4 10             	add    $0x10,%esp
c000464d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004650:	8b 40 24             	mov    0x24(%eax),%eax
c0004653:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004656:	8b 45 08             	mov    0x8(%ebp),%eax
c0004659:	89 50 24             	mov    %edx,0x24(%eax)
c000465c:	90                   	nop
c000465d:	c9                   	leave  
c000465e:	c3                   	ret    

c000465f <do_close>:
c000465f:	55                   	push   %ebp
c0004660:	89 e5                	mov    %esp,%ebp
c0004662:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0004667:	8b 55 08             	mov    0x8(%ebp),%edx
c000466a:	83 c2 50             	add    $0x50,%edx
c000466d:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004671:	8b 50 0c             	mov    0xc(%eax),%edx
c0004674:	83 ea 01             	sub    $0x1,%edx
c0004677:	89 50 0c             	mov    %edx,0xc(%eax)
c000467a:	8b 40 0c             	mov    0xc(%eax),%eax
c000467d:	85 c0                	test   %eax,%eax
c000467f:	75 16                	jne    c0004697 <do_close+0x38>
c0004681:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0004686:	8b 55 08             	mov    0x8(%ebp),%edx
c0004689:	83 c2 50             	add    $0x50,%edx
c000468c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004690:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0004697:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c000469c:	8b 55 08             	mov    0x8(%ebp),%edx
c000469f:	83 c2 50             	add    $0x50,%edx
c00046a2:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
c00046a9:	00 
c00046aa:	b8 00 00 00 00       	mov    $0x0,%eax
c00046af:	5d                   	pop    %ebp
c00046b0:	c3                   	ret    

c00046b1 <get_super_block>:
c00046b1:	55                   	push   %ebp
c00046b2:	89 e5                	mov    %esp,%ebp
c00046b4:	83 ec 08             	sub    $0x8,%esp
c00046b7:	a1 20 e0 00 c0       	mov    0xc000e020,%eax
c00046bc:	83 ec 0c             	sub    $0xc,%esp
c00046bf:	6a 07                	push   $0x7
c00046c1:	68 00 02 00 00       	push   $0x200
c00046c6:	50                   	push   %eax
c00046c7:	6a 20                	push   $0x20
c00046c9:	6a 01                	push   $0x1
c00046cb:	e8 b9 e2 ff ff       	call   c0002989 <rd_wt>
c00046d0:	83 c4 20             	add    $0x20,%esp
c00046d3:	8b 15 20 e0 00 c0    	mov    0xc000e020,%edx
c00046d9:	a1 24 e0 00 c0       	mov    0xc000e024,%eax
c00046de:	8b 0a                	mov    (%edx),%ecx
c00046e0:	89 08                	mov    %ecx,(%eax)
c00046e2:	8b 4a 04             	mov    0x4(%edx),%ecx
c00046e5:	89 48 04             	mov    %ecx,0x4(%eax)
c00046e8:	8b 4a 08             	mov    0x8(%edx),%ecx
c00046eb:	89 48 08             	mov    %ecx,0x8(%eax)
c00046ee:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00046f1:	89 48 0c             	mov    %ecx,0xc(%eax)
c00046f4:	8b 4a 10             	mov    0x10(%edx),%ecx
c00046f7:	89 48 10             	mov    %ecx,0x10(%eax)
c00046fa:	8b 4a 14             	mov    0x14(%edx),%ecx
c00046fd:	89 48 14             	mov    %ecx,0x14(%eax)
c0004700:	8b 4a 18             	mov    0x18(%edx),%ecx
c0004703:	89 48 18             	mov    %ecx,0x18(%eax)
c0004706:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0004709:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000470c:	8b 52 20             	mov    0x20(%edx),%edx
c000470f:	89 50 20             	mov    %edx,0x20(%eax)
c0004712:	a1 24 e0 00 c0       	mov    0xc000e024,%eax
c0004717:	c9                   	leave  
c0004718:	c3                   	ret    

c0004719 <check>:
c0004719:	55                   	push   %ebp
c000471a:	89 e5                	mov    %esp,%ebp
c000471c:	83 ec 18             	sub    $0x18,%esp
c000471f:	c7 45 f4 e0 32 08 c0 	movl   $0xc00832e0,-0xc(%ebp)
c0004726:	eb 59                	jmp    c0004781 <check+0x68>
c0004728:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000472b:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c0004731:	85 c0                	test   %eax,%eax
c0004733:	74 45                	je     c000477a <check+0x61>
c0004735:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004738:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c000473e:	83 f8 01             	cmp    $0x1,%eax
c0004741:	74 37                	je     c000477a <check+0x61>
c0004743:	c7 05 60 f7 00 c0 02 	movl   $0x2802,0xc000f760
c000474a:	28 00 00 
c000474d:	83 ec 08             	sub    $0x8,%esp
c0004750:	6a 0a                	push   $0xa
c0004752:	68 a3 a4 00 c0       	push   $0xc000a4a3
c0004757:	e8 6b ce ff ff       	call   c00015c7 <disp_str_colour>
c000475c:	83 c4 10             	add    $0x10,%esp
c000475f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004762:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c0004769:	0f be c0             	movsbl %al,%eax
c000476c:	83 ec 0c             	sub    $0xc,%esp
c000476f:	50                   	push   %eax
c0004770:	e8 b2 30 00 00       	call   c0007827 <disp_int>
c0004775:	83 c4 10             	add    $0x10,%esp
c0004778:	eb fe                	jmp    c0004778 <check+0x5f>
c000477a:	81 45 f4 b0 01 00 00 	addl   $0x1b0,-0xc(%ebp)
c0004781:	b8 40 36 08 c0       	mov    $0xc0083640,%eax
c0004786:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0004789:	72 9d                	jb     c0004728 <check+0xf>
c000478b:	90                   	nop
c000478c:	c9                   	leave  
c000478d:	c3                   	ret    

c000478e <schedule_process>:
c000478e:	55                   	push   %ebp
c000478f:	89 e5                	mov    %esp,%ebp
c0004791:	83 ec 28             	sub    $0x28,%esp
c0004794:	e8 f8 d0 ff ff       	call   c0001891 <get_running_thread_pcb>
c0004799:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000479c:	83 ec 0c             	sub    $0xc,%esp
c000479f:	68 ac fd 00 c0       	push   $0xc000fdac
c00047a4:	e8 2a 57 00 00       	call   c0009ed3 <isListEmpty>
c00047a9:	83 c4 10             	add    $0x10,%esp
c00047ac:	3c 01                	cmp    $0x1,%al
c00047ae:	75 08                	jne    c00047b8 <schedule_process+0x2a>
c00047b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00047b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00047b6:	eb 4d                	jmp    c0004805 <schedule_process+0x77>
c00047b8:	83 ec 0c             	sub    $0xc,%esp
c00047bb:	68 ac fd 00 c0       	push   $0xc000fdac
c00047c0:	e8 b5 57 00 00       	call   c0009f7a <popFromDoubleLinkList>
c00047c5:	83 c4 10             	add    $0x10,%esp
c00047c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00047cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00047ce:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00047d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00047d6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00047da:	74 29                	je     c0004805 <schedule_process+0x77>
c00047dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00047df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00047e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00047e5:	c6 80 48 01 00 00 00 	movb   $0x0,0x148(%eax)
c00047ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00047ef:	05 30 01 00 00       	add    $0x130,%eax
c00047f4:	83 ec 08             	sub    $0x8,%esp
c00047f7:	68 a9 a4 00 c0       	push   $0xc000a4a9
c00047fc:	50                   	push   %eax
c00047fd:	e8 75 53 00 00       	call   c0009b77 <strcmp>
c0004802:	83 c4 10             	add    $0x10,%esp
c0004805:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004808:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c000480f:	84 c0                	test   %al,%al
c0004811:	75 19                	jne    c000482c <schedule_process+0x9e>
c0004813:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004816:	05 fc 00 00 00       	add    $0xfc,%eax
c000481b:	83 ec 08             	sub    $0x8,%esp
c000481e:	50                   	push   %eax
c000481f:	68 ac fd 00 c0       	push   $0xc000fdac
c0004824:	e8 10 57 00 00       	call   c0009f39 <insertToDoubleLinkList>
c0004829:	83 c4 10             	add    $0x10,%esp
c000482c:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c0004833:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004836:	8b 40 04             	mov    0x4(%eax),%eax
c0004839:	85 c0                	test   %eax,%eax
c000483b:	74 28                	je     c0004865 <schedule_process+0xd7>
c000483d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004840:	05 00 10 00 00       	add    $0x1000,%eax
c0004845:	83 ec 0c             	sub    $0xc,%esp
c0004848:	50                   	push   %eax
c0004849:	e8 34 d0 ff ff       	call   c0001882 <update_tss>
c000484e:	83 c4 10             	add    $0x10,%esp
c0004851:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004854:	8b 40 04             	mov    0x4(%eax),%eax
c0004857:	83 ec 0c             	sub    $0xc,%esp
c000485a:	50                   	push   %eax
c000485b:	e8 15 d0 ff ff       	call   c0001875 <update_cr3>
c0004860:	83 c4 10             	add    $0x10,%esp
c0004863:	eb 0f                	jmp    c0004874 <schedule_process+0xe6>
c0004865:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004868:	83 ec 0c             	sub    $0xc,%esp
c000486b:	50                   	push   %eax
c000486c:	e8 04 d0 ff ff       	call   c0001875 <update_cr3>
c0004871:	83 c4 10             	add    $0x10,%esp
c0004874:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004877:	a3 80 fb 00 c0       	mov    %eax,0xc000fb80
c000487c:	83 ec 08             	sub    $0x8,%esp
c000487f:	ff 75 f4             	pushl  -0xc(%ebp)
c0004882:	ff 75 f0             	pushl  -0x10(%ebp)
c0004885:	e8 06 56 00 00       	call   c0009e90 <switch_to>
c000488a:	83 c4 10             	add    $0x10,%esp
c000488d:	90                   	nop
c000488e:	c9                   	leave  
c000488f:	c3                   	ret    

c0004890 <clock_handler>:
c0004890:	55                   	push   %ebp
c0004891:	89 e5                	mov    %esp,%ebp
c0004893:	83 ec 08             	sub    $0x8,%esp
c0004896:	e8 f3 fe ff ff       	call   c000478e <schedule_process>
c000489b:	90                   	nop
c000489c:	c9                   	leave  
c000489d:	c3                   	ret    

c000489e <pid2proc>:
c000489e:	55                   	push   %ebp
c000489f:	89 e5                	mov    %esp,%ebp
c00048a1:	83 ec 20             	sub    $0x20,%esp
c00048a4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00048ab:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c00048b0:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c00048b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00048bc:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c00048c1:	8b 15 00 1f 01 c0    	mov    0xc0011f00,%edx
c00048c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00048ca:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00048cd:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00048d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00048d5:	eb 29                	jmp    c0004900 <pid2proc+0x62>
c00048d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00048da:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00048df:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00048e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00048e5:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c00048eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00048ee:	39 c2                	cmp    %eax,%edx
c00048f0:	75 05                	jne    c00048f7 <pid2proc+0x59>
c00048f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00048f5:	eb 15                	jmp    c000490c <pid2proc+0x6e>
c00048f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00048fa:	8b 40 04             	mov    0x4(%eax),%eax
c00048fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004900:	81 7d f8 fc 1e 01 c0 	cmpl   $0xc0011efc,-0x8(%ebp)
c0004907:	75 ce                	jne    c00048d7 <pid2proc+0x39>
c0004909:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000490c:	c9                   	leave  
c000490d:	c3                   	ret    

c000490e <proc2pid>:
c000490e:	55                   	push   %ebp
c000490f:	89 e5                	mov    %esp,%ebp
c0004911:	83 ec 10             	sub    $0x10,%esp
c0004914:	8b 45 08             	mov    0x8(%ebp),%eax
c0004917:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c000491d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004920:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004923:	c9                   	leave  
c0004924:	c3                   	ret    

c0004925 <InitDescriptor>:
c0004925:	55                   	push   %ebp
c0004926:	89 e5                	mov    %esp,%ebp
c0004928:	83 ec 04             	sub    $0x4,%esp
c000492b:	8b 45 14             	mov    0x14(%ebp),%eax
c000492e:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004932:	8b 45 10             	mov    0x10(%ebp),%eax
c0004935:	89 c2                	mov    %eax,%edx
c0004937:	8b 45 08             	mov    0x8(%ebp),%eax
c000493a:	66 89 10             	mov    %dx,(%eax)
c000493d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004940:	89 c2                	mov    %eax,%edx
c0004942:	8b 45 08             	mov    0x8(%ebp),%eax
c0004945:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004949:	8b 45 0c             	mov    0xc(%ebp),%eax
c000494c:	c1 e8 10             	shr    $0x10,%eax
c000494f:	89 c2                	mov    %eax,%edx
c0004951:	8b 45 08             	mov    0x8(%ebp),%eax
c0004954:	88 50 04             	mov    %dl,0x4(%eax)
c0004957:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c000495b:	89 c2                	mov    %eax,%edx
c000495d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004960:	88 50 05             	mov    %dl,0x5(%eax)
c0004963:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004967:	66 c1 e8 08          	shr    $0x8,%ax
c000496b:	c1 e0 04             	shl    $0x4,%eax
c000496e:	89 c2                	mov    %eax,%edx
c0004970:	8b 45 10             	mov    0x10(%ebp),%eax
c0004973:	c1 e8 10             	shr    $0x10,%eax
c0004976:	83 e0 0f             	and    $0xf,%eax
c0004979:	09 c2                	or     %eax,%edx
c000497b:	8b 45 08             	mov    0x8(%ebp),%eax
c000497e:	88 50 06             	mov    %dl,0x6(%eax)
c0004981:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004984:	c1 e8 18             	shr    $0x18,%eax
c0004987:	89 c2                	mov    %eax,%edx
c0004989:	8b 45 08             	mov    0x8(%ebp),%eax
c000498c:	88 50 07             	mov    %dl,0x7(%eax)
c000498f:	90                   	nop
c0004990:	c9                   	leave  
c0004991:	c3                   	ret    

c0004992 <Seg2PhyAddr>:
c0004992:	55                   	push   %ebp
c0004993:	89 e5                	mov    %esp,%ebp
c0004995:	83 ec 10             	sub    $0x10,%esp
c0004998:	8b 45 08             	mov    0x8(%ebp),%eax
c000499b:	c1 e8 03             	shr    $0x3,%eax
c000499e:	8b 14 c5 84 f7 00 c0 	mov    -0x3fff087c(,%eax,8),%edx
c00049a5:	8b 04 c5 80 f7 00 c0 	mov    -0x3fff0880(,%eax,8),%eax
c00049ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00049af:	89 55 f8             	mov    %edx,-0x8(%ebp)
c00049b2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00049b6:	0f b7 c0             	movzwl %ax,%eax
c00049b9:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c00049bd:	0f b6 d2             	movzbl %dl,%edx
c00049c0:	c1 e2 10             	shl    $0x10,%edx
c00049c3:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c00049c9:	09 d0                	or     %edx,%eax
c00049cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00049ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049d1:	c9                   	leave  
c00049d2:	c3                   	ret    

c00049d3 <Seg2PhyAddrLDT>:
c00049d3:	55                   	push   %ebp
c00049d4:	89 e5                	mov    %esp,%ebp
c00049d6:	83 ec 10             	sub    $0x10,%esp
c00049d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00049dc:	c1 e8 03             	shr    $0x3,%eax
c00049df:	89 c2                	mov    %eax,%edx
c00049e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00049e4:	83 c2 20             	add    $0x20,%edx
c00049e7:	8d 54 d0 0e          	lea    0xe(%eax,%edx,8),%edx
c00049eb:	8b 02                	mov    (%edx),%eax
c00049ed:	8b 52 04             	mov    0x4(%edx),%edx
c00049f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00049f3:	89 55 f8             	mov    %edx,-0x8(%ebp)
c00049f6:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00049fa:	0f b7 c0             	movzwl %ax,%eax
c00049fd:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004a01:	0f b6 d2             	movzbl %dl,%edx
c0004a04:	c1 e2 10             	shl    $0x10,%edx
c0004a07:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004a0d:	09 d0                	or     %edx,%eax
c0004a0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a12:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a15:	c9                   	leave  
c0004a16:	c3                   	ret    

c0004a17 <VirAddr2PhyAddr>:
c0004a17:	55                   	push   %ebp
c0004a18:	89 e5                	mov    %esp,%ebp
c0004a1a:	83 ec 10             	sub    $0x10,%esp
c0004a1d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004a20:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a23:	01 d0                	add    %edx,%eax
c0004a25:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a28:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a2b:	c9                   	leave  
c0004a2c:	c3                   	ret    

c0004a2d <v2l>:
c0004a2d:	55                   	push   %ebp
c0004a2e:	89 e5                	mov    %esp,%ebp
c0004a30:	83 ec 18             	sub    $0x18,%esp
c0004a33:	83 ec 0c             	sub    $0xc,%esp
c0004a36:	ff 75 08             	pushl  0x8(%ebp)
c0004a39:	e8 60 fe ff ff       	call   c000489e <pid2proc>
c0004a3e:	83 c4 10             	add    $0x10,%esp
c0004a41:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a44:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004a4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a4e:	83 ec 08             	sub    $0x8,%esp
c0004a51:	ff 75 f4             	pushl  -0xc(%ebp)
c0004a54:	50                   	push   %eax
c0004a55:	e8 79 ff ff ff       	call   c00049d3 <Seg2PhyAddrLDT>
c0004a5a:	83 c4 10             	add    $0x10,%esp
c0004a5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004a60:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004a63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a66:	01 d0                	add    %edx,%eax
c0004a68:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004a6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a6e:	c9                   	leave  
c0004a6f:	c3                   	ret    

c0004a70 <init_propt>:
c0004a70:	55                   	push   %ebp
c0004a71:	89 e5                	mov    %esp,%ebp
c0004a73:	83 ec 28             	sub    $0x28,%esp
c0004a76:	6a 0e                	push   $0xe
c0004a78:	6a 08                	push   $0x8
c0004a7a:	68 6a 16 00 c0       	push   $0xc000166a
c0004a7f:	6a 20                	push   $0x20
c0004a81:	e8 18 01 00 00       	call   c0004b9e <InitInterruptDesc>
c0004a86:	83 c4 10             	add    $0x10,%esp
c0004a89:	6a 0e                	push   $0xe
c0004a8b:	6a 08                	push   $0x8
c0004a8d:	68 98 16 00 c0       	push   $0xc0001698
c0004a92:	6a 21                	push   $0x21
c0004a94:	e8 05 01 00 00       	call   c0004b9e <InitInterruptDesc>
c0004a99:	83 c4 10             	add    $0x10,%esp
c0004a9c:	6a 0e                	push   $0xe
c0004a9e:	6a 08                	push   $0x8
c0004aa0:	68 dc 16 00 c0       	push   $0xc00016dc
c0004aa5:	6a 2e                	push   $0x2e
c0004aa7:	e8 f2 00 00 00       	call   c0004b9e <InitInterruptDesc>
c0004aac:	83 c4 10             	add    $0x10,%esp
c0004aaf:	83 ec 04             	sub    $0x4,%esp
c0004ab2:	68 c0 06 00 00       	push   $0x6c0
c0004ab7:	6a 00                	push   $0x0
c0004ab9:	68 e0 32 08 c0       	push   $0xc00832e0
c0004abe:	e8 14 62 00 00       	call   c000acd7 <Memset>
c0004ac3:	83 c4 10             	add    $0x10,%esp
c0004ac6:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004acd:	83 ec 04             	sub    $0x4,%esp
c0004ad0:	ff 75 f4             	pushl  -0xc(%ebp)
c0004ad3:	6a 00                	push   $0x0
c0004ad5:	68 40 16 01 c0       	push   $0xc0011640
c0004ada:	e8 f8 61 00 00       	call   c000acd7 <Memset>
c0004adf:	83 c4 10             	add    $0x10,%esp
c0004ae2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004ae5:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c0004aea:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0004af1:	00 00 00 
c0004af4:	83 ec 0c             	sub    $0xc,%esp
c0004af7:	6a 30                	push   $0x30
c0004af9:	e8 94 fe ff ff       	call   c0004992 <Seg2PhyAddr>
c0004afe:	83 c4 10             	add    $0x10,%esp
c0004b01:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004b04:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c0004b0b:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004b12:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b15:	0f b7 d0             	movzwl %ax,%edx
c0004b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b1b:	83 e8 01             	sub    $0x1,%eax
c0004b1e:	89 c1                	mov    %eax,%ecx
c0004b20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004b23:	52                   	push   %edx
c0004b24:	51                   	push   %ecx
c0004b25:	50                   	push   %eax
c0004b26:	68 c0 f7 00 c0       	push   $0xc000f7c0
c0004b2b:	e8 f5 fd ff ff       	call   c0004925 <InitDescriptor>
c0004b30:	83 c4 10             	add    $0x10,%esp
c0004b33:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004b3a:	68 f2 00 00 00       	push   $0xf2
c0004b3f:	68 ff ff 00 00       	push   $0xffff
c0004b44:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004b47:	68 b8 f7 00 c0       	push   $0xc000f7b8
c0004b4c:	e8 d4 fd ff ff       	call   c0004925 <InitDescriptor>
c0004b51:	83 c4 10             	add    $0x10,%esp
c0004b54:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004b5b:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004b62:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004b69:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b6c:	0f b7 c0             	movzwl %ax,%eax
c0004b6f:	50                   	push   %eax
c0004b70:	ff 75 d8             	pushl  -0x28(%ebp)
c0004b73:	6a 00                	push   $0x0
c0004b75:	68 c8 f7 00 c0       	push   $0xc000f7c8
c0004b7a:	e8 a6 fd ff ff       	call   c0004925 <InitDescriptor>
c0004b7f:	83 c4 10             	add    $0x10,%esp
c0004b82:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004b85:	0f b7 c0             	movzwl %ax,%eax
c0004b88:	50                   	push   %eax
c0004b89:	ff 75 d8             	pushl  -0x28(%ebp)
c0004b8c:	6a 00                	push   $0x0
c0004b8e:	68 d0 f7 00 c0       	push   $0xc000f7d0
c0004b93:	e8 8d fd ff ff       	call   c0004925 <InitDescriptor>
c0004b98:	83 c4 10             	add    $0x10,%esp
c0004b9b:	90                   	nop
c0004b9c:	c9                   	leave  
c0004b9d:	c3                   	ret    

c0004b9e <InitInterruptDesc>:
c0004b9e:	55                   	push   %ebp
c0004b9f:	89 e5                	mov    %esp,%ebp
c0004ba1:	83 ec 10             	sub    $0x10,%esp
c0004ba4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ba7:	c1 e0 03             	shl    $0x3,%eax
c0004baa:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c0004baf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004bb2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bb5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004bb9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004bbc:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004bbf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004bc2:	89 c2                	mov    %eax,%edx
c0004bc4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bc7:	66 89 10             	mov    %dx,(%eax)
c0004bca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bcd:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004bd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004bd6:	c1 f8 10             	sar    $0x10,%eax
c0004bd9:	89 c2                	mov    %eax,%edx
c0004bdb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bde:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004be2:	8b 45 10             	mov    0x10(%ebp),%eax
c0004be5:	c1 e0 04             	shl    $0x4,%eax
c0004be8:	89 c2                	mov    %eax,%edx
c0004bea:	8b 45 14             	mov    0x14(%ebp),%eax
c0004bed:	09 d0                	or     %edx,%eax
c0004bef:	89 c2                	mov    %eax,%edx
c0004bf1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bf4:	88 50 05             	mov    %dl,0x5(%eax)
c0004bf7:	90                   	nop
c0004bf8:	c9                   	leave  
c0004bf9:	c3                   	ret    

c0004bfa <ReloadGDT>:
c0004bfa:	55                   	push   %ebp
c0004bfb:	89 e5                	mov    %esp,%ebp
c0004bfd:	83 ec 28             	sub    $0x28,%esp
c0004c00:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c0004c05:	0f b7 00             	movzwl (%eax),%eax
c0004c08:	98                   	cwtl   
c0004c09:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0004c0e:	8b 12                	mov    (%edx),%edx
c0004c10:	83 ec 04             	sub    $0x4,%esp
c0004c13:	50                   	push   %eax
c0004c14:	52                   	push   %edx
c0004c15:	68 80 f7 00 c0       	push   $0xc000f780
c0004c1a:	e8 8a 60 00 00       	call   c000aca9 <Memcpy>
c0004c1f:	83 c4 10             	add    $0x10,%esp
c0004c22:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c0004c29:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0004c30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004c33:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004c38:	ba 80 f7 00 c0       	mov    $0xc000f780,%edx
c0004c3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004c40:	89 10                	mov    %edx,(%eax)
c0004c42:	c7 45 e8 48 f7 00 c0 	movl   $0xc000f748,-0x18(%ebp)
c0004c49:	c7 45 e4 4a f7 00 c0 	movl   $0xc000f74a,-0x1c(%ebp)
c0004c50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004c53:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004c58:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c0004c5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004c60:	89 10                	mov    %edx,(%eax)
c0004c62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004c69:	eb 04                	jmp    c0004c6f <ReloadGDT+0x75>
c0004c6b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004c6f:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004c76:	7e f3                	jle    c0004c6b <ReloadGDT+0x71>
c0004c78:	e8 6e 30 00 00       	call   c0007ceb <init_internal_interrupt>
c0004c7d:	e8 ee fd ff ff       	call   c0004a70 <init_propt>
c0004c82:	90                   	nop
c0004c83:	c9                   	leave  
c0004c84:	c3                   	ret    

c0004c85 <select_console>:
c0004c85:	55                   	push   %ebp
c0004c86:	89 e5                	mov    %esp,%ebp
c0004c88:	83 ec 18             	sub    $0x18,%esp
c0004c8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c8e:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004c91:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004c95:	77 27                	ja     c0004cbe <select_console+0x39>
c0004c97:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004c9b:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0004ca1:	05 c0 fd 00 c0       	add    $0xc000fdc0,%eax
c0004ca6:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c0004cab:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c0004cb0:	83 ec 0c             	sub    $0xc,%esp
c0004cb3:	50                   	push   %eax
c0004cb4:	e8 08 00 00 00       	call   c0004cc1 <flush>
c0004cb9:	83 c4 10             	add    $0x10,%esp
c0004cbc:	eb 01                	jmp    c0004cbf <select_console+0x3a>
c0004cbe:	90                   	nop
c0004cbf:	c9                   	leave  
c0004cc0:	c3                   	ret    

c0004cc1 <flush>:
c0004cc1:	55                   	push   %ebp
c0004cc2:	89 e5                	mov    %esp,%ebp
c0004cc4:	83 ec 08             	sub    $0x8,%esp
c0004cc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cca:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cd0:	8b 40 0c             	mov    0xc(%eax),%eax
c0004cd3:	83 ec 0c             	sub    $0xc,%esp
c0004cd6:	50                   	push   %eax
c0004cd7:	e8 1e 00 00 00       	call   c0004cfa <set_cursor>
c0004cdc:	83 c4 10             	add    $0x10,%esp
c0004cdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ce2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ce8:	8b 40 08             	mov    0x8(%eax),%eax
c0004ceb:	83 ec 0c             	sub    $0xc,%esp
c0004cee:	50                   	push   %eax
c0004cef:	e8 64 00 00 00       	call   c0004d58 <set_console_start_video_addr>
c0004cf4:	83 c4 10             	add    $0x10,%esp
c0004cf7:	90                   	nop
c0004cf8:	c9                   	leave  
c0004cf9:	c3                   	ret    

c0004cfa <set_cursor>:
c0004cfa:	55                   	push   %ebp
c0004cfb:	89 e5                	mov    %esp,%ebp
c0004cfd:	83 ec 08             	sub    $0x8,%esp
c0004d00:	83 ec 08             	sub    $0x8,%esp
c0004d03:	6a 0e                	push   $0xe
c0004d05:	68 d4 03 00 00       	push   $0x3d4
c0004d0a:	e8 84 ca ff ff       	call   c0001793 <out_byte>
c0004d0f:	83 c4 10             	add    $0x10,%esp
c0004d12:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d15:	c1 e8 08             	shr    $0x8,%eax
c0004d18:	0f b7 c0             	movzwl %ax,%eax
c0004d1b:	83 ec 08             	sub    $0x8,%esp
c0004d1e:	50                   	push   %eax
c0004d1f:	68 d5 03 00 00       	push   $0x3d5
c0004d24:	e8 6a ca ff ff       	call   c0001793 <out_byte>
c0004d29:	83 c4 10             	add    $0x10,%esp
c0004d2c:	83 ec 08             	sub    $0x8,%esp
c0004d2f:	6a 0f                	push   $0xf
c0004d31:	68 d4 03 00 00       	push   $0x3d4
c0004d36:	e8 58 ca ff ff       	call   c0001793 <out_byte>
c0004d3b:	83 c4 10             	add    $0x10,%esp
c0004d3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d41:	0f b7 c0             	movzwl %ax,%eax
c0004d44:	83 ec 08             	sub    $0x8,%esp
c0004d47:	50                   	push   %eax
c0004d48:	68 d5 03 00 00       	push   $0x3d5
c0004d4d:	e8 41 ca ff ff       	call   c0001793 <out_byte>
c0004d52:	83 c4 10             	add    $0x10,%esp
c0004d55:	90                   	nop
c0004d56:	c9                   	leave  
c0004d57:	c3                   	ret    

c0004d58 <set_console_start_video_addr>:
c0004d58:	55                   	push   %ebp
c0004d59:	89 e5                	mov    %esp,%ebp
c0004d5b:	83 ec 08             	sub    $0x8,%esp
c0004d5e:	83 ec 08             	sub    $0x8,%esp
c0004d61:	6a 0c                	push   $0xc
c0004d63:	68 d4 03 00 00       	push   $0x3d4
c0004d68:	e8 26 ca ff ff       	call   c0001793 <out_byte>
c0004d6d:	83 c4 10             	add    $0x10,%esp
c0004d70:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d73:	c1 e8 08             	shr    $0x8,%eax
c0004d76:	0f b7 c0             	movzwl %ax,%eax
c0004d79:	83 ec 08             	sub    $0x8,%esp
c0004d7c:	50                   	push   %eax
c0004d7d:	68 d5 03 00 00       	push   $0x3d5
c0004d82:	e8 0c ca ff ff       	call   c0001793 <out_byte>
c0004d87:	83 c4 10             	add    $0x10,%esp
c0004d8a:	83 ec 08             	sub    $0x8,%esp
c0004d8d:	6a 0d                	push   $0xd
c0004d8f:	68 d4 03 00 00       	push   $0x3d4
c0004d94:	e8 fa c9 ff ff       	call   c0001793 <out_byte>
c0004d99:	83 c4 10             	add    $0x10,%esp
c0004d9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d9f:	0f b7 c0             	movzwl %ax,%eax
c0004da2:	83 ec 08             	sub    $0x8,%esp
c0004da5:	50                   	push   %eax
c0004da6:	68 d5 03 00 00       	push   $0x3d5
c0004dab:	e8 e3 c9 ff ff       	call   c0001793 <out_byte>
c0004db0:	83 c4 10             	add    $0x10,%esp
c0004db3:	90                   	nop
c0004db4:	c9                   	leave  
c0004db5:	c3                   	ret    

c0004db6 <put_key>:
c0004db6:	55                   	push   %ebp
c0004db7:	89 e5                	mov    %esp,%ebp
c0004db9:	83 ec 04             	sub    $0x4,%esp
c0004dbc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004dbf:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004dc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dc5:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004dcb:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004dd0:	77 4d                	ja     c0004e1f <put_key+0x69>
c0004dd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dd5:	8b 00                	mov    (%eax),%eax
c0004dd7:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004ddb:	89 10                	mov    %edx,(%eax)
c0004ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004de0:	8b 00                	mov    (%eax),%eax
c0004de2:	8d 50 04             	lea    0x4(%eax),%edx
c0004de5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004de8:	89 10                	mov    %edx,(%eax)
c0004dea:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ded:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004df3:	8d 50 01             	lea    0x1(%eax),%edx
c0004df6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004df9:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004dff:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e02:	8b 00                	mov    (%eax),%eax
c0004e04:	8b 55 08             	mov    0x8(%ebp),%edx
c0004e07:	83 c2 08             	add    $0x8,%edx
c0004e0a:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004e10:	39 d0                	cmp    %edx,%eax
c0004e12:	75 0b                	jne    c0004e1f <put_key+0x69>
c0004e14:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e17:	8d 50 08             	lea    0x8(%eax),%edx
c0004e1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e1d:	89 10                	mov    %edx,(%eax)
c0004e1f:	90                   	nop
c0004e20:	c9                   	leave  
c0004e21:	c3                   	ret    

c0004e22 <scroll_up>:
c0004e22:	55                   	push   %ebp
c0004e23:	89 e5                	mov    %esp,%ebp
c0004e25:	83 ec 08             	sub    $0x8,%esp
c0004e28:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e2b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e31:	8b 40 08             	mov    0x8(%eax),%eax
c0004e34:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004e37:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e3a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e40:	8b 00                	mov    (%eax),%eax
c0004e42:	39 c2                	cmp    %eax,%edx
c0004e44:	76 1b                	jbe    c0004e61 <scroll_up+0x3f>
c0004e46:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e49:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e4f:	8b 40 08             	mov    0x8(%eax),%eax
c0004e52:	83 e8 50             	sub    $0x50,%eax
c0004e55:	83 ec 0c             	sub    $0xc,%esp
c0004e58:	50                   	push   %eax
c0004e59:	e8 fa fe ff ff       	call   c0004d58 <set_console_start_video_addr>
c0004e5e:	83 c4 10             	add    $0x10,%esp
c0004e61:	90                   	nop
c0004e62:	c9                   	leave  
c0004e63:	c3                   	ret    

c0004e64 <scroll_down>:
c0004e64:	55                   	push   %ebp
c0004e65:	89 e5                	mov    %esp,%ebp
c0004e67:	83 ec 08             	sub    $0x8,%esp
c0004e6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e6d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e73:	8b 40 08             	mov    0x8(%eax),%eax
c0004e76:	8d 48 50             	lea    0x50(%eax),%ecx
c0004e79:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e7c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e82:	8b 10                	mov    (%eax),%edx
c0004e84:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e87:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e8d:	8b 40 04             	mov    0x4(%eax),%eax
c0004e90:	01 d0                	add    %edx,%eax
c0004e92:	39 c1                	cmp    %eax,%ecx
c0004e94:	73 36                	jae    c0004ecc <scroll_down+0x68>
c0004e96:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e99:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e9f:	8b 40 08             	mov    0x8(%eax),%eax
c0004ea2:	83 c0 50             	add    $0x50,%eax
c0004ea5:	83 ec 0c             	sub    $0xc,%esp
c0004ea8:	50                   	push   %eax
c0004ea9:	e8 aa fe ff ff       	call   c0004d58 <set_console_start_video_addr>
c0004eae:	83 c4 10             	add    $0x10,%esp
c0004eb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eb4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004eba:	8b 50 08             	mov    0x8(%eax),%edx
c0004ebd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec0:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ec6:	83 c2 50             	add    $0x50,%edx
c0004ec9:	89 50 08             	mov    %edx,0x8(%eax)
c0004ecc:	90                   	nop
c0004ecd:	c9                   	leave  
c0004ece:	c3                   	ret    

c0004ecf <out_char>:
c0004ecf:	55                   	push   %ebp
c0004ed0:	89 e5                	mov    %esp,%ebp
c0004ed2:	83 ec 28             	sub    $0x28,%esp
c0004ed5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ed8:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004edb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ede:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ee4:	8b 40 0c             	mov    0xc(%eax),%eax
c0004ee7:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0004eec:	01 c0                	add    %eax,%eax
c0004eee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004ef1:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004ef5:	83 f8 08             	cmp    $0x8,%eax
c0004ef8:	0f 84 8d 00 00 00    	je     c0004f8b <out_char+0xbc>
c0004efe:	83 f8 0a             	cmp    $0xa,%eax
c0004f01:	0f 85 c9 00 00 00    	jne    c0004fd0 <out_char+0x101>
c0004f07:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f0a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f10:	8b 50 0c             	mov    0xc(%eax),%edx
c0004f13:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f16:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f1c:	8b 08                	mov    (%eax),%ecx
c0004f1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f21:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f27:	8b 40 04             	mov    0x4(%eax),%eax
c0004f2a:	01 c8                	add    %ecx,%eax
c0004f2c:	83 e8 50             	sub    $0x50,%eax
c0004f2f:	39 c2                	cmp    %eax,%edx
c0004f31:	0f 83 f4 00 00 00    	jae    c000502b <out_char+0x15c>
c0004f37:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f3a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f40:	8b 08                	mov    (%eax),%ecx
c0004f42:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f45:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f4b:	8b 50 0c             	mov    0xc(%eax),%edx
c0004f4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f51:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f57:	8b 00                	mov    (%eax),%eax
c0004f59:	29 c2                	sub    %eax,%edx
c0004f5b:	89 d0                	mov    %edx,%eax
c0004f5d:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0004f62:	f7 e2                	mul    %edx
c0004f64:	89 d0                	mov    %edx,%eax
c0004f66:	c1 e8 06             	shr    $0x6,%eax
c0004f69:	8d 50 01             	lea    0x1(%eax),%edx
c0004f6c:	89 d0                	mov    %edx,%eax
c0004f6e:	c1 e0 02             	shl    $0x2,%eax
c0004f71:	01 d0                	add    %edx,%eax
c0004f73:	c1 e0 04             	shl    $0x4,%eax
c0004f76:	89 c2                	mov    %eax,%edx
c0004f78:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f7b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f81:	01 ca                	add    %ecx,%edx
c0004f83:	89 50 0c             	mov    %edx,0xc(%eax)
c0004f86:	e9 a0 00 00 00       	jmp    c000502b <out_char+0x15c>
c0004f8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f8e:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f94:	8b 50 0c             	mov    0xc(%eax),%edx
c0004f97:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f9a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004fa0:	8b 00                	mov    (%eax),%eax
c0004fa2:	39 c2                	cmp    %eax,%edx
c0004fa4:	0f 86 84 00 00 00    	jbe    c000502e <out_char+0x15f>
c0004faa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fad:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004fb3:	8b 50 0c             	mov    0xc(%eax),%edx
c0004fb6:	83 ea 01             	sub    $0x1,%edx
c0004fb9:	89 50 0c             	mov    %edx,0xc(%eax)
c0004fbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004fbf:	83 e8 02             	sub    $0x2,%eax
c0004fc2:	c6 00 20             	movb   $0x20,(%eax)
c0004fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004fc8:	83 e8 01             	sub    $0x1,%eax
c0004fcb:	c6 00 00             	movb   $0x0,(%eax)
c0004fce:	eb 5e                	jmp    c000502e <out_char+0x15f>
c0004fd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004fd9:	8b 40 0c             	mov    0xc(%eax),%eax
c0004fdc:	8d 48 01             	lea    0x1(%eax),%ecx
c0004fdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004fe8:	8b 10                	mov    (%eax),%edx
c0004fea:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fed:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ff3:	8b 40 04             	mov    0x4(%eax),%eax
c0004ff6:	01 d0                	add    %edx,%eax
c0004ff8:	39 c1                	cmp    %eax,%ecx
c0004ffa:	73 35                	jae    c0005031 <out_char+0x162>
c0004ffc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004fff:	8d 50 01             	lea    0x1(%eax),%edx
c0005002:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0005005:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0005009:	88 10                	mov    %dl,(%eax)
c000500b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000500e:	8d 50 01             	lea    0x1(%eax),%edx
c0005011:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0005014:	c6 00 0a             	movb   $0xa,(%eax)
c0005017:	8b 45 08             	mov    0x8(%ebp),%eax
c000501a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005020:	8b 50 0c             	mov    0xc(%eax),%edx
c0005023:	83 c2 01             	add    $0x1,%edx
c0005026:	89 50 0c             	mov    %edx,0xc(%eax)
c0005029:	eb 06                	jmp    c0005031 <out_char+0x162>
c000502b:	90                   	nop
c000502c:	eb 14                	jmp    c0005042 <out_char+0x173>
c000502e:	90                   	nop
c000502f:	eb 11                	jmp    c0005042 <out_char+0x173>
c0005031:	90                   	nop
c0005032:	eb 0e                	jmp    c0005042 <out_char+0x173>
c0005034:	83 ec 0c             	sub    $0xc,%esp
c0005037:	ff 75 08             	pushl  0x8(%ebp)
c000503a:	e8 25 fe ff ff       	call   c0004e64 <scroll_down>
c000503f:	83 c4 10             	add    $0x10,%esp
c0005042:	8b 45 08             	mov    0x8(%ebp),%eax
c0005045:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000504b:	8b 50 0c             	mov    0xc(%eax),%edx
c000504e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005051:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005057:	8b 40 08             	mov    0x8(%eax),%eax
c000505a:	29 c2                	sub    %eax,%edx
c000505c:	89 d0                	mov    %edx,%eax
c000505e:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0005063:	77 cf                	ja     c0005034 <out_char+0x165>
c0005065:	83 ec 0c             	sub    $0xc,%esp
c0005068:	ff 75 08             	pushl  0x8(%ebp)
c000506b:	e8 51 fc ff ff       	call   c0004cc1 <flush>
c0005070:	83 c4 10             	add    $0x10,%esp
c0005073:	90                   	nop
c0005074:	c9                   	leave  
c0005075:	c3                   	ret    

c0005076 <tty_dev_read>:
c0005076:	55                   	push   %ebp
c0005077:	89 e5                	mov    %esp,%ebp
c0005079:	83 ec 08             	sub    $0x8,%esp
c000507c:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c0005081:	39 45 08             	cmp    %eax,0x8(%ebp)
c0005084:	75 17                	jne    c000509d <tty_dev_read+0x27>
c0005086:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c000508b:	85 c0                	test   %eax,%eax
c000508d:	7e 0e                	jle    c000509d <tty_dev_read+0x27>
c000508f:	83 ec 0c             	sub    $0xc,%esp
c0005092:	ff 75 08             	pushl  0x8(%ebp)
c0005095:	e8 56 07 00 00       	call   c00057f0 <keyboard_read>
c000509a:	83 c4 10             	add    $0x10,%esp
c000509d:	90                   	nop
c000509e:	c9                   	leave  
c000509f:	c3                   	ret    

c00050a0 <tty_dev_write>:
c00050a0:	55                   	push   %ebp
c00050a1:	89 e5                	mov    %esp,%ebp
c00050a3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00050a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ac:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00050b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00050b5:	e9 da 01 00 00       	jmp    c0005294 <tty_dev_write+0x1f4>
c00050ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00050bd:	8b 40 04             	mov    0x4(%eax),%eax
c00050c0:	8b 00                	mov    (%eax),%eax
c00050c2:	88 45 f3             	mov    %al,-0xd(%ebp)
c00050c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00050c8:	8b 40 04             	mov    0x4(%eax),%eax
c00050cb:	8d 50 04             	lea    0x4(%eax),%edx
c00050ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00050d1:	89 50 04             	mov    %edx,0x4(%eax)
c00050d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00050d7:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00050dd:	8d 50 ff             	lea    -0x1(%eax),%edx
c00050e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00050e3:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c00050e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ec:	8b 40 04             	mov    0x4(%eax),%eax
c00050ef:	8b 55 08             	mov    0x8(%ebp),%edx
c00050f2:	83 c2 08             	add    $0x8,%edx
c00050f5:	81 c2 00 08 00 00    	add    $0x800,%edx
c00050fb:	39 d0                	cmp    %edx,%eax
c00050fd:	75 0c                	jne    c000510b <tty_dev_write+0x6b>
c00050ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005102:	8d 50 08             	lea    0x8(%eax),%edx
c0005105:	8b 45 08             	mov    0x8(%ebp),%eax
c0005108:	89 50 04             	mov    %edx,0x4(%eax)
c000510b:	8b 45 08             	mov    0x8(%ebp),%eax
c000510e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005114:	85 c0                	test   %eax,%eax
c0005116:	0f 84 78 01 00 00    	je     c0005294 <tty_dev_write+0x1f4>
c000511c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005120:	3c 20                	cmp    $0x20,%al
c0005122:	76 08                	jbe    c000512c <tty_dev_write+0x8c>
c0005124:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005128:	3c 7e                	cmp    $0x7e,%al
c000512a:	76 10                	jbe    c000513c <tty_dev_write+0x9c>
c000512c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005130:	3c 20                	cmp    $0x20,%al
c0005132:	74 08                	je     c000513c <tty_dev_write+0x9c>
c0005134:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005138:	84 c0                	test   %al,%al
c000513a:	75 7b                	jne    c00051b7 <tty_dev_write+0x117>
c000513c:	83 ec 08             	sub    $0x8,%esp
c000513f:	8d 45 f3             	lea    -0xd(%ebp),%eax
c0005142:	50                   	push   %eax
c0005143:	6a 02                	push   $0x2
c0005145:	e8 e3 f8 ff ff       	call   c0004a2d <v2l>
c000514a:	83 c4 10             	add    $0x10,%esp
c000514d:	89 c1                	mov    %eax,%ecx
c000514f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005152:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c0005158:	8b 45 08             	mov    0x8(%ebp),%eax
c000515b:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005161:	01 d0                	add    %edx,%eax
c0005163:	83 ec 04             	sub    $0x4,%esp
c0005166:	6a 01                	push   $0x1
c0005168:	51                   	push   %ecx
c0005169:	50                   	push   %eax
c000516a:	e8 3a 5b 00 00       	call   c000aca9 <Memcpy>
c000516f:	83 c4 10             	add    $0x10,%esp
c0005172:	8b 45 08             	mov    0x8(%ebp),%eax
c0005175:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000517b:	8d 50 ff             	lea    -0x1(%eax),%edx
c000517e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005181:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005187:	8b 45 08             	mov    0x8(%ebp),%eax
c000518a:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005190:	8d 50 01             	lea    0x1(%eax),%edx
c0005193:	8b 45 08             	mov    0x8(%ebp),%eax
c0005196:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000519c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00051a0:	0f b6 c0             	movzbl %al,%eax
c00051a3:	83 ec 08             	sub    $0x8,%esp
c00051a6:	50                   	push   %eax
c00051a7:	ff 75 08             	pushl  0x8(%ebp)
c00051aa:	e8 20 fd ff ff       	call   c0004ecf <out_char>
c00051af:	83 c4 10             	add    $0x10,%esp
c00051b2:	e9 dd 00 00 00       	jmp    c0005294 <tty_dev_write+0x1f4>
c00051b7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00051bb:	3c 08                	cmp    $0x8,%al
c00051bd:	75 45                	jne    c0005204 <tty_dev_write+0x164>
c00051bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00051c2:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00051c8:	8d 50 01             	lea    0x1(%eax),%edx
c00051cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ce:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00051d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00051d7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00051dd:	8d 50 ff             	lea    -0x1(%eax),%edx
c00051e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00051e3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00051e9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00051ed:	0f b6 c0             	movzbl %al,%eax
c00051f0:	83 ec 08             	sub    $0x8,%esp
c00051f3:	50                   	push   %eax
c00051f4:	ff 75 08             	pushl  0x8(%ebp)
c00051f7:	e8 d3 fc ff ff       	call   c0004ecf <out_char>
c00051fc:	83 c4 10             	add    $0x10,%esp
c00051ff:	e9 90 00 00 00       	jmp    c0005294 <tty_dev_write+0x1f4>
c0005204:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005208:	3c 0a                	cmp    $0xa,%al
c000520a:	74 10                	je     c000521c <tty_dev_write+0x17c>
c000520c:	8b 45 08             	mov    0x8(%ebp),%eax
c000520f:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005215:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005218:	39 c2                	cmp    %eax,%edx
c000521a:	75 78                	jne    c0005294 <tty_dev_write+0x1f4>
c000521c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005220:	0f b6 c0             	movzbl %al,%eax
c0005223:	83 ec 08             	sub    $0x8,%esp
c0005226:	50                   	push   %eax
c0005227:	ff 75 08             	pushl  0x8(%ebp)
c000522a:	e8 a0 fc ff ff       	call   c0004ecf <out_char>
c000522f:	83 c4 10             	add    $0x10,%esp
c0005232:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
c0005239:	8b 45 08             	mov    0x8(%ebp),%eax
c000523c:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005242:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005245:	8b 45 08             	mov    0x8(%ebp),%eax
c0005248:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000524e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005251:	8b 45 08             	mov    0x8(%ebp),%eax
c0005254:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c000525a:	89 45 94             	mov    %eax,-0x6c(%ebp)
c000525d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005260:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005267:	00 00 00 
c000526a:	8b 45 08             	mov    0x8(%ebp),%eax
c000526d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005274:	00 00 00 
c0005277:	8b 45 08             	mov    0x8(%ebp),%eax
c000527a:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c0005280:	83 ec 04             	sub    $0x4,%esp
c0005283:	50                   	push   %eax
c0005284:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0005287:	50                   	push   %eax
c0005288:	6a 01                	push   $0x1
c000528a:	e8 a0 45 00 00       	call   c000982f <send_rec>
c000528f:	83 c4 10             	add    $0x10,%esp
c0005292:	eb 11                	jmp    c00052a5 <tty_dev_write+0x205>
c0005294:	8b 45 08             	mov    0x8(%ebp),%eax
c0005297:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000529d:	85 c0                	test   %eax,%eax
c000529f:	0f 85 15 fe ff ff    	jne    c00050ba <tty_dev_write+0x1a>
c00052a5:	c9                   	leave  
c00052a6:	c3                   	ret    

c00052a7 <tty_do_read>:
c00052a7:	55                   	push   %ebp
c00052a8:	89 e5                	mov    %esp,%ebp
c00052aa:	83 ec 08             	sub    $0x8,%esp
c00052ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00052b0:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00052b7:	00 00 00 
c00052ba:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052bd:	8b 50 58             	mov    0x58(%eax),%edx
c00052c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00052c3:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c00052c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052cc:	8b 00                	mov    (%eax),%eax
c00052ce:	89 c2                	mov    %eax,%edx
c00052d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00052d3:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00052d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052dc:	8b 50 50             	mov    0x50(%eax),%edx
c00052df:	8b 45 08             	mov    0x8(%ebp),%eax
c00052e2:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00052e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052eb:	8b 40 10             	mov    0x10(%eax),%eax
c00052ee:	89 c2                	mov    %eax,%edx
c00052f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00052f3:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00052f9:	83 ec 08             	sub    $0x8,%esp
c00052fc:	52                   	push   %edx
c00052fd:	50                   	push   %eax
c00052fe:	e8 2a f7 ff ff       	call   c0004a2d <v2l>
c0005303:	83 c4 10             	add    $0x10,%esp
c0005306:	89 c2                	mov    %eax,%edx
c0005308:	8b 45 08             	mov    0x8(%ebp),%eax
c000530b:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005311:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005314:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c000531b:	8b 45 08             	mov    0x8(%ebp),%eax
c000531e:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c0005324:	83 ec 04             	sub    $0x4,%esp
c0005327:	50                   	push   %eax
c0005328:	ff 75 0c             	pushl  0xc(%ebp)
c000532b:	6a 01                	push   $0x1
c000532d:	e8 fd 44 00 00       	call   c000982f <send_rec>
c0005332:	83 c4 10             	add    $0x10,%esp
c0005335:	90                   	nop
c0005336:	c9                   	leave  
c0005337:	c3                   	ret    

c0005338 <tty_do_write>:
c0005338:	55                   	push   %ebp
c0005339:	89 e5                	mov    %esp,%ebp
c000533b:	53                   	push   %ebx
c000533c:	81 ec 94 00 00 00    	sub    $0x94,%esp
c0005342:	89 e0                	mov    %esp,%eax
c0005344:	89 c3                	mov    %eax,%ebx
c0005346:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000534d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005350:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005353:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005356:	89 c2                	mov    %eax,%edx
c0005358:	b8 10 00 00 00       	mov    $0x10,%eax
c000535d:	83 e8 01             	sub    $0x1,%eax
c0005360:	01 d0                	add    %edx,%eax
c0005362:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005367:	ba 00 00 00 00       	mov    $0x0,%edx
c000536c:	f7 f1                	div    %ecx
c000536e:	6b c0 10             	imul   $0x10,%eax,%eax
c0005371:	29 c4                	sub    %eax,%esp
c0005373:	89 e0                	mov    %esp,%eax
c0005375:	83 c0 00             	add    $0x0,%eax
c0005378:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000537b:	83 ec 04             	sub    $0x4,%esp
c000537e:	ff 75 e8             	pushl  -0x18(%ebp)
c0005381:	6a 00                	push   $0x0
c0005383:	ff 75 e0             	pushl  -0x20(%ebp)
c0005386:	e8 4c 59 00 00       	call   c000acd7 <Memset>
c000538b:	83 c4 10             	add    $0x10,%esp
c000538e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005391:	8b 40 50             	mov    0x50(%eax),%eax
c0005394:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005397:	8b 45 08             	mov    0x8(%ebp),%eax
c000539a:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00053a1:	00 00 00 
c00053a4:	e9 98 00 00 00       	jmp    c0005441 <tty_do_write+0x109>
c00053a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00053ac:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00053af:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c00053b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00053b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053b9:	8b 40 10             	mov    0x10(%eax),%eax
c00053bc:	89 c2                	mov    %eax,%edx
c00053be:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053c1:	8b 40 58             	mov    0x58(%eax),%eax
c00053c4:	83 ec 08             	sub    $0x8,%esp
c00053c7:	52                   	push   %edx
c00053c8:	50                   	push   %eax
c00053c9:	e8 5f f6 ff ff       	call   c0004a2d <v2l>
c00053ce:	83 c4 10             	add    $0x10,%esp
c00053d1:	89 c2                	mov    %eax,%edx
c00053d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d6:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00053dc:	01 d0                	add    %edx,%eax
c00053de:	83 ec 04             	sub    $0x4,%esp
c00053e1:	ff 75 f0             	pushl  -0x10(%ebp)
c00053e4:	50                   	push   %eax
c00053e5:	ff 75 e0             	pushl  -0x20(%ebp)
c00053e8:	e8 bc 58 00 00       	call   c000aca9 <Memcpy>
c00053ed:	83 c4 10             	add    $0x10,%esp
c00053f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00053f3:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00053f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00053f9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00053ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005402:	01 c2                	add    %eax,%edx
c0005404:	8b 45 08             	mov    0x8(%ebp),%eax
c0005407:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000540d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005414:	eb 25                	jmp    c000543b <tty_do_write+0x103>
c0005416:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005419:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000541c:	01 d0                	add    %edx,%eax
c000541e:	0f b6 00             	movzbl (%eax),%eax
c0005421:	0f b6 c0             	movzbl %al,%eax
c0005424:	83 ec 08             	sub    $0x8,%esp
c0005427:	50                   	push   %eax
c0005428:	ff 75 08             	pushl  0x8(%ebp)
c000542b:	e8 9f fa ff ff       	call   c0004ecf <out_char>
c0005430:	83 c4 10             	add    $0x10,%esp
c0005433:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005437:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c000543b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000543f:	75 d5                	jne    c0005416 <tty_do_write+0xde>
c0005441:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005445:	0f 85 5e ff ff ff    	jne    c00053a9 <tty_do_write+0x71>
c000544b:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
c0005452:	8b 45 08             	mov    0x8(%ebp),%eax
c0005455:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000545b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000545e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005461:	8b 00                	mov    (%eax),%eax
c0005463:	83 ec 04             	sub    $0x4,%esp
c0005466:	50                   	push   %eax
c0005467:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000546d:	50                   	push   %eax
c000546e:	6a 01                	push   $0x1
c0005470:	e8 ba 43 00 00       	call   c000982f <send_rec>
c0005475:	83 c4 10             	add    $0x10,%esp
c0005478:	89 dc                	mov    %ebx,%esp
c000547a:	90                   	nop
c000547b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000547e:	c9                   	leave  
c000547f:	c3                   	ret    

c0005480 <init_screen>:
c0005480:	55                   	push   %ebp
c0005481:	89 e5                	mov    %esp,%ebp
c0005483:	83 ec 10             	sub    $0x10,%esp
c0005486:	8b 45 08             	mov    0x8(%ebp),%eax
c0005489:	2d c0 fd 00 c0       	sub    $0xc000fdc0,%eax
c000548e:	c1 f8 02             	sar    $0x2,%eax
c0005491:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c0005497:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000549a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000549d:	c1 e0 04             	shl    $0x4,%eax
c00054a0:	8d 90 20 1f 01 c0    	lea    -0x3ffee0e0(%eax),%edx
c00054a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00054a9:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c00054af:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c00054b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b9:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
c00054bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00054c2:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c00054c7:	f7 e2                	mul    %edx
c00054c9:	89 d0                	mov    %edx,%eax
c00054cb:	d1 e8                	shr    %eax
c00054cd:	89 41 04             	mov    %eax,0x4(%ecx)
c00054d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00054d3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00054d9:	8b 50 04             	mov    0x4(%eax),%edx
c00054dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00054df:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00054e5:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00054e9:	89 10                	mov    %edx,(%eax)
c00054eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00054ee:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c00054f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00054f7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00054fd:	8b 12                	mov    (%edx),%edx
c00054ff:	89 50 08             	mov    %edx,0x8(%eax)
c0005502:	8b 55 08             	mov    0x8(%ebp),%edx
c0005505:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
c000550b:	8b 40 08             	mov    0x8(%eax),%eax
c000550e:	89 42 0c             	mov    %eax,0xc(%edx)
c0005511:	90                   	nop
c0005512:	c9                   	leave  
c0005513:	c3                   	ret    

c0005514 <init_tty>:
c0005514:	55                   	push   %ebp
c0005515:	89 e5                	mov    %esp,%ebp
c0005517:	83 ec 18             	sub    $0x18,%esp
c000551a:	c7 45 f4 c0 fd 00 c0 	movl   $0xc000fdc0,-0xc(%ebp)
c0005521:	eb 7a                	jmp    c000559d <init_tty+0x89>
c0005523:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005526:	8d 50 08             	lea    0x8(%eax),%edx
c0005529:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000552c:	89 50 04             	mov    %edx,0x4(%eax)
c000552f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005532:	8b 50 04             	mov    0x4(%eax),%edx
c0005535:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005538:	89 10                	mov    %edx,(%eax)
c000553a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000553d:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005544:	00 00 00 
c0005547:	ff 75 f4             	pushl  -0xc(%ebp)
c000554a:	e8 31 ff ff ff       	call   c0005480 <init_screen>
c000554f:	83 c4 04             	add    $0x4,%esp
c0005552:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005555:	2d c0 fd 00 c0       	sub    $0xc000fdc0,%eax
c000555a:	85 c0                	test   %eax,%eax
c000555c:	7e 38                	jle    c0005596 <init_tty+0x82>
c000555e:	83 ec 08             	sub    $0x8,%esp
c0005561:	6a 23                	push   $0x23
c0005563:	ff 75 f4             	pushl  -0xc(%ebp)
c0005566:	e8 64 f9 ff ff       	call   c0004ecf <out_char>
c000556b:	83 c4 10             	add    $0x10,%esp
c000556e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005571:	05 e4 8e 01 00       	add    $0x18ee4,%eax
c0005576:	2d c0 fd 00 c0       	sub    $0xc000fdc0,%eax
c000557b:	c1 f8 02             	sar    $0x2,%eax
c000557e:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c0005584:	0f b6 c0             	movzbl %al,%eax
c0005587:	83 ec 08             	sub    $0x8,%esp
c000558a:	50                   	push   %eax
c000558b:	ff 75 f4             	pushl  -0xc(%ebp)
c000558e:	e8 3c f9 ff ff       	call   c0004ecf <out_char>
c0005593:	83 c4 10             	add    $0x10,%esp
c0005596:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c000559d:	b8 2c 16 01 c0       	mov    $0xc001162c,%eax
c00055a2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00055a5:	0f 82 78 ff ff ff    	jb     c0005523 <init_tty+0xf>
c00055ab:	90                   	nop
c00055ac:	c9                   	leave  
c00055ad:	c3                   	ret    

c00055ae <TaskTTY>:
c00055ae:	55                   	push   %ebp
c00055af:	89 e5                	mov    %esp,%ebp
c00055b1:	83 ec 28             	sub    $0x28,%esp
c00055b4:	83 ec 0c             	sub    $0xc,%esp
c00055b7:	68 b1 a4 00 c0       	push   $0xc000a4b1
c00055bc:	e8 cb bf ff ff       	call   c000158c <disp_str>
c00055c1:	83 c4 10             	add    $0x10,%esp
c00055c4:	e8 c8 c2 ff ff       	call   c0001891 <get_running_thread_pcb>
c00055c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00055cc:	83 ec 0c             	sub    $0xc,%esp
c00055cf:	68 bb a4 00 c0       	push   $0xc000a4bb
c00055d4:	e8 b3 bf ff ff       	call   c000158c <disp_str>
c00055d9:	83 c4 10             	add    $0x10,%esp
c00055dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055df:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00055e5:	83 ec 0c             	sub    $0xc,%esp
c00055e8:	50                   	push   %eax
c00055e9:	e8 39 22 00 00       	call   c0007827 <disp_int>
c00055ee:	83 c4 10             	add    $0x10,%esp
c00055f1:	83 ec 0c             	sub    $0xc,%esp
c00055f4:	68 bd a4 00 c0       	push   $0xc000a4bd
c00055f9:	e8 8e bf ff ff       	call   c000158c <disp_str>
c00055fe:	83 c4 10             	add    $0x10,%esp
c0005601:	83 ec 0c             	sub    $0xc,%esp
c0005604:	68 bf a4 00 c0       	push   $0xc000a4bf
c0005609:	e8 7e bf ff ff       	call   c000158c <disp_str>
c000560e:	83 c4 10             	add    $0x10,%esp
c0005611:	e8 fe fe ff ff       	call   c0005514 <init_tty>
c0005616:	83 ec 0c             	sub    $0xc,%esp
c0005619:	6a 00                	push   $0x0
c000561b:	e8 65 f6 ff ff       	call   c0004c85 <select_console>
c0005620:	83 c4 10             	add    $0x10,%esp
c0005623:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000562a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005631:	83 ec 0c             	sub    $0xc,%esp
c0005634:	6a 6c                	push   $0x6c
c0005636:	e8 78 16 00 00       	call   c0006cb3 <sys_malloc>
c000563b:	83 c4 10             	add    $0x10,%esp
c000563e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005641:	c7 45 f4 c0 fd 00 c0 	movl   $0xc000fdc0,-0xc(%ebp)
c0005648:	eb 30                	jmp    c000567a <TaskTTY+0xcc>
c000564a:	83 ec 0c             	sub    $0xc,%esp
c000564d:	ff 75 f4             	pushl  -0xc(%ebp)
c0005650:	e8 21 fa ff ff       	call   c0005076 <tty_dev_read>
c0005655:	83 c4 10             	add    $0x10,%esp
c0005658:	83 ec 0c             	sub    $0xc,%esp
c000565b:	ff 75 f4             	pushl  -0xc(%ebp)
c000565e:	e8 3d fa ff ff       	call   c00050a0 <tty_dev_write>
c0005663:	83 c4 10             	add    $0x10,%esp
c0005666:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005669:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000566f:	85 c0                	test   %eax,%eax
c0005671:	75 d7                	jne    c000564a <TaskTTY+0x9c>
c0005673:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c000567a:	b8 2c 16 01 c0       	mov    $0xc001162c,%eax
c000567f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005682:	72 c6                	jb     c000564a <TaskTTY+0x9c>
c0005684:	83 ec 04             	sub    $0x4,%esp
c0005687:	6a 0e                	push   $0xe
c0005689:	ff 75 e4             	pushl  -0x1c(%ebp)
c000568c:	6a 02                	push   $0x2
c000568e:	e8 9c 41 00 00       	call   c000982f <send_rec>
c0005693:	83 c4 10             	add    $0x10,%esp
c0005696:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005699:	8b 40 68             	mov    0x68(%eax),%eax
c000569c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000569f:	81 7d e0 d2 07 00 00 	cmpl   $0x7d2,-0x20(%ebp)
c00056a6:	74 28                	je     c00056d0 <TaskTTY+0x122>
c00056a8:	81 7d e0 d2 07 00 00 	cmpl   $0x7d2,-0x20(%ebp)
c00056af:	7f 0b                	jg     c00056bc <TaskTTY+0x10e>
c00056b1:	81 7d e0 d1 07 00 00 	cmpl   $0x7d1,-0x20(%ebp)
c00056b8:	74 4e                	je     c0005708 <TaskTTY+0x15a>
c00056ba:	eb 4d                	jmp    c0005709 <TaskTTY+0x15b>
c00056bc:	81 7d e0 d3 07 00 00 	cmpl   $0x7d3,-0x20(%ebp)
c00056c3:	74 21                	je     c00056e6 <TaskTTY+0x138>
c00056c5:	81 7d e0 d5 07 00 00 	cmpl   $0x7d5,-0x20(%ebp)
c00056cc:	74 2e                	je     c00056fc <TaskTTY+0x14e>
c00056ce:	eb 39                	jmp    c0005709 <TaskTTY+0x15b>
c00056d0:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c00056d5:	83 ec 08             	sub    $0x8,%esp
c00056d8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00056db:	50                   	push   %eax
c00056dc:	e8 c6 fb ff ff       	call   c00052a7 <tty_do_read>
c00056e1:	83 c4 10             	add    $0x10,%esp
c00056e4:	eb 23                	jmp    c0005709 <TaskTTY+0x15b>
c00056e6:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c00056eb:	83 ec 08             	sub    $0x8,%esp
c00056ee:	ff 75 e4             	pushl  -0x1c(%ebp)
c00056f1:	50                   	push   %eax
c00056f2:	e8 41 fc ff ff       	call   c0005338 <tty_do_write>
c00056f7:	83 c4 10             	add    $0x10,%esp
c00056fa:	eb 0d                	jmp    c0005709 <TaskTTY+0x15b>
c00056fc:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005703:	00 00 00 
c0005706:	eb 01                	jmp    c0005709 <TaskTTY+0x15b>
c0005708:	90                   	nop
c0005709:	e9 33 ff ff ff       	jmp    c0005641 <TaskTTY+0x93>

c000570e <keyboard_handler>:
c000570e:	55                   	push   %ebp
c000570f:	89 e5                	mov    %esp,%ebp
c0005711:	83 ec 18             	sub    $0x18,%esp
c0005714:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c000571b:	00 00 00 
c000571e:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005725:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c000572a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c000572f:	7f 5c                	jg     c000578d <keyboard_handler+0x7f>
c0005731:	e8 7f c0 ff ff       	call   c00017b5 <disable_int>
c0005736:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005739:	0f b7 c0             	movzwl %ax,%eax
c000573c:	83 ec 0c             	sub    $0xc,%esp
c000573f:	50                   	push   %eax
c0005740:	e8 42 c0 ff ff       	call   c0001787 <in_byte>
c0005745:	83 c4 10             	add    $0x10,%esp
c0005748:	88 45 f3             	mov    %al,-0xd(%ebp)
c000574b:	a1 a0 fb 00 c0       	mov    0xc000fba0,%eax
c0005750:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005754:	88 10                	mov    %dl,(%eax)
c0005756:	a1 a0 fb 00 c0       	mov    0xc000fba0,%eax
c000575b:	83 c0 01             	add    $0x1,%eax
c000575e:	a3 a0 fb 00 c0       	mov    %eax,0xc000fba0
c0005763:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c0005768:	83 c0 01             	add    $0x1,%eax
c000576b:	a3 a8 fb 00 c0       	mov    %eax,0xc000fba8
c0005770:	a1 a0 fb 00 c0       	mov    0xc000fba0,%eax
c0005775:	ba ac fd 00 c0       	mov    $0xc000fdac,%edx
c000577a:	39 d0                	cmp    %edx,%eax
c000577c:	72 0a                	jb     c0005788 <keyboard_handler+0x7a>
c000577e:	c7 05 a0 fb 00 c0 ac 	movl   $0xc000fbac,0xc000fba0
c0005785:	fb 00 c0 
c0005788:	e8 2a c0 ff ff       	call   c00017b7 <enable_int>
c000578d:	90                   	nop
c000578e:	c9                   	leave  
c000578f:	c3                   	ret    

c0005790 <read_from_keyboard_buf>:
c0005790:	55                   	push   %ebp
c0005791:	89 e5                	mov    %esp,%ebp
c0005793:	83 ec 18             	sub    $0x18,%esp
c0005796:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000579a:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c000579f:	85 c0                	test   %eax,%eax
c00057a1:	7e 47                	jle    c00057ea <read_from_keyboard_buf+0x5a>
c00057a3:	e8 0d c0 ff ff       	call   c00017b5 <disable_int>
c00057a8:	a1 a4 fb 00 c0       	mov    0xc000fba4,%eax
c00057ad:	0f b6 00             	movzbl (%eax),%eax
c00057b0:	88 45 f7             	mov    %al,-0x9(%ebp)
c00057b3:	a1 a4 fb 00 c0       	mov    0xc000fba4,%eax
c00057b8:	83 c0 01             	add    $0x1,%eax
c00057bb:	a3 a4 fb 00 c0       	mov    %eax,0xc000fba4
c00057c0:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c00057c5:	83 e8 01             	sub    $0x1,%eax
c00057c8:	a3 a8 fb 00 c0       	mov    %eax,0xc000fba8
c00057cd:	a1 a4 fb 00 c0       	mov    0xc000fba4,%eax
c00057d2:	ba ac fd 00 c0       	mov    $0xc000fdac,%edx
c00057d7:	39 d0                	cmp    %edx,%eax
c00057d9:	72 0a                	jb     c00057e5 <read_from_keyboard_buf+0x55>
c00057db:	c7 05 a4 fb 00 c0 ac 	movl   $0xc000fbac,0xc000fba4
c00057e2:	fb 00 c0 
c00057e5:	e8 cd bf ff ff       	call   c00017b7 <enable_int>
c00057ea:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00057ee:	c9                   	leave  
c00057ef:	c3                   	ret    

c00057f0 <keyboard_read>:
c00057f0:	55                   	push   %ebp
c00057f1:	89 e5                	mov    %esp,%ebp
c00057f3:	83 ec 28             	sub    $0x28,%esp
c00057f6:	90                   	nop
c00057f7:	a1 a8 fb 00 c0       	mov    0xc000fba8,%eax
c00057fc:	85 c0                	test   %eax,%eax
c00057fe:	7e f7                	jle    c00057f7 <keyboard_read+0x7>
c0005800:	e8 8b ff ff ff       	call   c0005790 <read_from_keyboard_buf>
c0005805:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005808:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000580f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005813:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005817:	75 5a                	jne    c0005873 <keyboard_read+0x83>
c0005819:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c000581d:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005821:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005825:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005829:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c000582d:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005831:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005835:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000583c:	eb 20                	jmp    c000585e <keyboard_read+0x6e>
c000583e:	e8 4d ff ff ff       	call   c0005790 <read_from_keyboard_buf>
c0005843:	89 c1                	mov    %eax,%ecx
c0005845:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005848:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000584b:	01 d0                	add    %edx,%eax
c000584d:	0f b6 00             	movzbl (%eax),%eax
c0005850:	38 c1                	cmp    %al,%cl
c0005852:	74 06                	je     c000585a <keyboard_read+0x6a>
c0005854:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005858:	eb 0a                	jmp    c0005864 <keyboard_read+0x74>
c000585a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000585e:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005862:	7e da                	jle    c000583e <keyboard_read+0x4e>
c0005864:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005868:	74 68                	je     c00058d2 <keyboard_read+0xe2>
c000586a:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005871:	eb 5f                	jmp    c00058d2 <keyboard_read+0xe2>
c0005873:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005877:	75 59                	jne    c00058d2 <keyboard_read+0xe2>
c0005879:	e8 12 ff ff ff       	call   c0005790 <read_from_keyboard_buf>
c000587e:	3c 2a                	cmp    $0x2a,%al
c0005880:	75 1d                	jne    c000589f <keyboard_read+0xaf>
c0005882:	e8 09 ff ff ff       	call   c0005790 <read_from_keyboard_buf>
c0005887:	3c e0                	cmp    $0xe0,%al
c0005889:	75 14                	jne    c000589f <keyboard_read+0xaf>
c000588b:	e8 00 ff ff ff       	call   c0005790 <read_from_keyboard_buf>
c0005890:	3c 37                	cmp    $0x37,%al
c0005892:	75 0b                	jne    c000589f <keyboard_read+0xaf>
c0005894:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c000589b:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c000589f:	e8 ec fe ff ff       	call   c0005790 <read_from_keyboard_buf>
c00058a4:	3c b7                	cmp    $0xb7,%al
c00058a6:	75 1d                	jne    c00058c5 <keyboard_read+0xd5>
c00058a8:	e8 e3 fe ff ff       	call   c0005790 <read_from_keyboard_buf>
c00058ad:	3c e0                	cmp    $0xe0,%al
c00058af:	75 14                	jne    c00058c5 <keyboard_read+0xd5>
c00058b1:	e8 da fe ff ff       	call   c0005790 <read_from_keyboard_buf>
c00058b6:	3c aa                	cmp    $0xaa,%al
c00058b8:	75 0b                	jne    c00058c5 <keyboard_read+0xd5>
c00058ba:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00058c1:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00058c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00058c9:	75 07                	jne    c00058d2 <keyboard_read+0xe2>
c00058cb:	c6 05 44 f7 00 c0 01 	movb   $0x1,0xc000f744
c00058d2:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c00058d9:	0f 84 8d 00 00 00    	je     c000596c <keyboard_read+0x17c>
c00058df:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c00058e6:	0f 84 80 00 00 00    	je     c000596c <keyboard_read+0x17c>
c00058ec:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c00058f0:	0f 94 c2             	sete   %dl
c00058f3:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c00058f7:	0f 94 c0             	sete   %al
c00058fa:	09 d0                	or     %edx,%eax
c00058fc:	84 c0                	test   %al,%al
c00058fe:	74 07                	je     c0005907 <keyboard_read+0x117>
c0005900:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005907:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c000590b:	f7 d0                	not    %eax
c000590d:	c0 e8 07             	shr    $0x7,%al
c0005910:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005913:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005917:	74 53                	je     c000596c <keyboard_read+0x17c>
c0005919:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c000591d:	74 4d                	je     c000596c <keyboard_read+0x17c>
c000591f:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005923:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c000592a:	3c 01                	cmp    $0x1,%al
c000592c:	75 04                	jne    c0005932 <keyboard_read+0x142>
c000592e:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005932:	0f b6 05 44 f7 00 c0 	movzbl 0xc000f744,%eax
c0005939:	84 c0                	test   %al,%al
c000593b:	74 04                	je     c0005941 <keyboard_read+0x151>
c000593d:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005941:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005945:	89 d0                	mov    %edx,%eax
c0005947:	01 c0                	add    %eax,%eax
c0005949:	01 c2                	add    %eax,%edx
c000594b:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c000594f:	01 d0                	add    %edx,%eax
c0005951:	8b 04 85 20 e1 00 c0 	mov    -0x3fff1ee0(,%eax,4),%eax
c0005958:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000595b:	83 ec 08             	sub    $0x8,%esp
c000595e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005961:	ff 75 08             	pushl  0x8(%ebp)
c0005964:	e8 1a 00 00 00       	call   c0005983 <in_process>
c0005969:	83 c4 10             	add    $0x10,%esp
c000596c:	90                   	nop
c000596d:	c9                   	leave  
c000596e:	c3                   	ret    

c000596f <init_keyboard_handler>:
c000596f:	55                   	push   %ebp
c0005970:	89 e5                	mov    %esp,%ebp
c0005972:	c6 05 44 f7 00 c0 00 	movb   $0x0,0xc000f744
c0005979:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005980:	90                   	nop
c0005981:	5d                   	pop    %ebp
c0005982:	c3                   	ret    

c0005983 <in_process>:
c0005983:	55                   	push   %ebp
c0005984:	89 e5                	mov    %esp,%ebp
c0005986:	83 ec 18             	sub    $0x18,%esp
c0005989:	83 ec 04             	sub    $0x4,%esp
c000598c:	6a 02                	push   $0x2
c000598e:	6a 00                	push   $0x0
c0005990:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005993:	50                   	push   %eax
c0005994:	e8 3e 53 00 00       	call   c000acd7 <Memset>
c0005999:	83 c4 10             	add    $0x10,%esp
c000599c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000599f:	25 00 01 00 00       	and    $0x100,%eax
c00059a4:	85 c0                	test   %eax,%eax
c00059a6:	75 28                	jne    c00059d0 <in_process+0x4d>
c00059a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00059ab:	0f b6 c0             	movzbl %al,%eax
c00059ae:	83 ec 08             	sub    $0x8,%esp
c00059b1:	50                   	push   %eax
c00059b2:	ff 75 08             	pushl  0x8(%ebp)
c00059b5:	e8 fc f3 ff ff       	call   c0004db6 <put_key>
c00059ba:	83 c4 10             	add    $0x10,%esp
c00059bd:	c6 05 44 f7 00 c0 00 	movb   $0x0,0xc000f744
c00059c4:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c00059cb:	e9 42 01 00 00       	jmp    c0005b12 <in_process+0x18f>
c00059d0:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c00059d7:	84 c0                	test   %al,%al
c00059d9:	0f 84 a9 00 00 00    	je     c0005a88 <in_process+0x105>
c00059df:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c00059e3:	0f 84 9f 00 00 00    	je     c0005a88 <in_process+0x105>
c00059e9:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c00059ed:	0f 84 95 00 00 00    	je     c0005a88 <in_process+0x105>
c00059f3:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00059fa:	74 64                	je     c0005a60 <in_process+0xdd>
c00059fc:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005a03:	77 0b                	ja     c0005a10 <in_process+0x8d>
c0005a05:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005a0c:	74 64                	je     c0005a72 <in_process+0xef>
c0005a0e:	eb 73                	jmp    c0005a83 <in_process+0x100>
c0005a10:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005a17:	74 0b                	je     c0005a24 <in_process+0xa1>
c0005a19:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005a20:	74 20                	je     c0005a42 <in_process+0xbf>
c0005a22:	eb 5f                	jmp    c0005a83 <in_process+0x100>
c0005a24:	83 ec 0c             	sub    $0xc,%esp
c0005a27:	ff 75 08             	pushl  0x8(%ebp)
c0005a2a:	e8 f3 f3 ff ff       	call   c0004e22 <scroll_up>
c0005a2f:	83 c4 10             	add    $0x10,%esp
c0005a32:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005a39:	c6 05 44 f7 00 c0 00 	movb   $0x0,0xc000f744
c0005a40:	eb 41                	jmp    c0005a83 <in_process+0x100>
c0005a42:	83 ec 0c             	sub    $0xc,%esp
c0005a45:	ff 75 08             	pushl  0x8(%ebp)
c0005a48:	e8 17 f4 ff ff       	call   c0004e64 <scroll_down>
c0005a4d:	83 c4 10             	add    $0x10,%esp
c0005a50:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005a57:	c6 05 44 f7 00 c0 00 	movb   $0x0,0xc000f744
c0005a5e:	eb 23                	jmp    c0005a83 <in_process+0x100>
c0005a60:	83 ec 08             	sub    $0x8,%esp
c0005a63:	6a 0a                	push   $0xa
c0005a65:	ff 75 08             	pushl  0x8(%ebp)
c0005a68:	e8 62 f4 ff ff       	call   c0004ecf <out_char>
c0005a6d:	83 c4 10             	add    $0x10,%esp
c0005a70:	eb 11                	jmp    c0005a83 <in_process+0x100>
c0005a72:	83 ec 08             	sub    $0x8,%esp
c0005a75:	6a 08                	push   $0x8
c0005a77:	ff 75 08             	pushl  0x8(%ebp)
c0005a7a:	e8 50 f4 ff ff       	call   c0004ecf <out_char>
c0005a7f:	83 c4 10             	add    $0x10,%esp
c0005a82:	90                   	nop
c0005a83:	e9 8a 00 00 00       	jmp    c0005b12 <in_process+0x18f>
c0005a88:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005a8f:	74 55                	je     c0005ae6 <in_process+0x163>
c0005a91:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005a98:	77 14                	ja     c0005aae <in_process+0x12b>
c0005a9a:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005aa1:	74 31                	je     c0005ad4 <in_process+0x151>
c0005aa3:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005aaa:	74 16                	je     c0005ac2 <in_process+0x13f>
c0005aac:	eb 64                	jmp    c0005b12 <in_process+0x18f>
c0005aae:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005ab5:	74 3e                	je     c0005af5 <in_process+0x172>
c0005ab7:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005abe:	74 44                	je     c0005b04 <in_process+0x181>
c0005ac0:	eb 50                	jmp    c0005b12 <in_process+0x18f>
c0005ac2:	83 ec 08             	sub    $0x8,%esp
c0005ac5:	6a 0a                	push   $0xa
c0005ac7:	ff 75 08             	pushl  0x8(%ebp)
c0005aca:	e8 e7 f2 ff ff       	call   c0004db6 <put_key>
c0005acf:	83 c4 10             	add    $0x10,%esp
c0005ad2:	eb 3e                	jmp    c0005b12 <in_process+0x18f>
c0005ad4:	83 ec 08             	sub    $0x8,%esp
c0005ad7:	6a 08                	push   $0x8
c0005ad9:	ff 75 08             	pushl  0x8(%ebp)
c0005adc:	e8 d5 f2 ff ff       	call   c0004db6 <put_key>
c0005ae1:	83 c4 10             	add    $0x10,%esp
c0005ae4:	eb 2c                	jmp    c0005b12 <in_process+0x18f>
c0005ae6:	83 ec 0c             	sub    $0xc,%esp
c0005ae9:	6a 00                	push   $0x0
c0005aeb:	e8 95 f1 ff ff       	call   c0004c85 <select_console>
c0005af0:	83 c4 10             	add    $0x10,%esp
c0005af3:	eb 1d                	jmp    c0005b12 <in_process+0x18f>
c0005af5:	83 ec 0c             	sub    $0xc,%esp
c0005af8:	6a 01                	push   $0x1
c0005afa:	e8 86 f1 ff ff       	call   c0004c85 <select_console>
c0005aff:	83 c4 10             	add    $0x10,%esp
c0005b02:	eb 0e                	jmp    c0005b12 <in_process+0x18f>
c0005b04:	83 ec 0c             	sub    $0xc,%esp
c0005b07:	6a 02                	push   $0x2
c0005b09:	e8 77 f1 ff ff       	call   c0004c85 <select_console>
c0005b0e:	83 c4 10             	add    $0x10,%esp
c0005b11:	90                   	nop
c0005b12:	90                   	nop
c0005b13:	c9                   	leave  
c0005b14:	c3                   	ret    

c0005b15 <open>:
c0005b15:	55                   	push   %ebp
c0005b16:	89 e5                	mov    %esp,%ebp
c0005b18:	83 ec 18             	sub    $0x18,%esp
c0005b1b:	83 ec 0c             	sub    $0xc,%esp
c0005b1e:	6a 6c                	push   $0x6c
c0005b20:	e8 8e 11 00 00       	call   c0006cb3 <sys_malloc>
c0005b25:	83 c4 10             	add    $0x10,%esp
c0005b28:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b2b:	83 ec 04             	sub    $0x4,%esp
c0005b2e:	6a 6c                	push   $0x6c
c0005b30:	6a 00                	push   $0x0
c0005b32:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b35:	e8 9d 51 00 00       	call   c000acd7 <Memset>
c0005b3a:	83 c4 10             	add    $0x10,%esp
c0005b3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b40:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005b47:	8b 55 08             	mov    0x8(%ebp),%edx
c0005b4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b4d:	89 50 34             	mov    %edx,0x34(%eax)
c0005b50:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b56:	89 50 64             	mov    %edx,0x64(%eax)
c0005b59:	83 ec 0c             	sub    $0xc,%esp
c0005b5c:	ff 75 08             	pushl  0x8(%ebp)
c0005b5f:	e8 ac 51 00 00       	call   c000ad10 <Strlen>
c0005b64:	83 c4 10             	add    $0x10,%esp
c0005b67:	89 c2                	mov    %eax,%edx
c0005b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b6c:	89 50 30             	mov    %edx,0x30(%eax)
c0005b6f:	83 ec 04             	sub    $0x4,%esp
c0005b72:	6a 03                	push   $0x3
c0005b74:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b77:	6a 03                	push   $0x3
c0005b79:	e8 b1 3c 00 00       	call   c000982f <send_rec>
c0005b7e:	83 c4 10             	add    $0x10,%esp
c0005b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b84:	8b 40 40             	mov    0x40(%eax),%eax
c0005b87:	c9                   	leave  
c0005b88:	c3                   	ret    

c0005b89 <read>:
c0005b89:	55                   	push   %ebp
c0005b8a:	89 e5                	mov    %esp,%ebp
c0005b8c:	83 ec 78             	sub    $0x78,%esp
c0005b8f:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
c0005b96:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b99:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005b9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b9f:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0005ba2:	8b 45 10             	mov    0x10(%ebp),%eax
c0005ba5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005ba8:	83 ec 04             	sub    $0x4,%esp
c0005bab:	6a 03                	push   $0x3
c0005bad:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005bb0:	50                   	push   %eax
c0005bb1:	6a 03                	push   $0x3
c0005bb3:	e8 77 3c 00 00       	call   c000982f <send_rec>
c0005bb8:	83 c4 10             	add    $0x10,%esp
c0005bbb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005bbe:	c9                   	leave  
c0005bbf:	c3                   	ret    

c0005bc0 <write>:
c0005bc0:	55                   	push   %ebp
c0005bc1:	89 e5                	mov    %esp,%ebp
c0005bc3:	83 ec 18             	sub    $0x18,%esp
c0005bc6:	83 ec 0c             	sub    $0xc,%esp
c0005bc9:	6a 6c                	push   $0x6c
c0005bcb:	e8 e3 10 00 00       	call   c0006cb3 <sys_malloc>
c0005bd0:	83 c4 10             	add    $0x10,%esp
c0005bd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bd9:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005be0:	8b 55 08             	mov    0x8(%ebp),%edx
c0005be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005be6:	89 50 40             	mov    %edx,0x40(%eax)
c0005be9:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005bec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bef:	89 50 10             	mov    %edx,0x10(%eax)
c0005bf2:	8b 55 10             	mov    0x10(%ebp),%edx
c0005bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005bf8:	89 50 50             	mov    %edx,0x50(%eax)
c0005bfb:	83 ec 04             	sub    $0x4,%esp
c0005bfe:	6a 03                	push   $0x3
c0005c00:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c03:	6a 03                	push   $0x3
c0005c05:	e8 25 3c 00 00       	call   c000982f <send_rec>
c0005c0a:	83 c4 10             	add    $0x10,%esp
c0005c0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c10:	8b 40 50             	mov    0x50(%eax),%eax
c0005c13:	c9                   	leave  
c0005c14:	c3                   	ret    

c0005c15 <close>:
c0005c15:	55                   	push   %ebp
c0005c16:	89 e5                	mov    %esp,%ebp
c0005c18:	83 ec 78             	sub    $0x78,%esp
c0005c1b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005c22:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c25:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005c28:	83 ec 04             	sub    $0x4,%esp
c0005c2b:	6a 03                	push   $0x3
c0005c2d:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005c30:	50                   	push   %eax
c0005c31:	6a 03                	push   $0x3
c0005c33:	e8 f7 3b 00 00       	call   c000982f <send_rec>
c0005c38:	83 c4 10             	add    $0x10,%esp
c0005c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c3e:	83 f8 65             	cmp    $0x65,%eax
c0005c41:	74 19                	je     c0005c5c <close+0x47>
c0005c43:	6a 13                	push   $0x13
c0005c45:	68 c1 a4 00 c0       	push   $0xc000a4c1
c0005c4a:	68 c1 a4 00 c0       	push   $0xc000a4c1
c0005c4f:	68 cd a4 00 c0       	push   $0xc000a4cd
c0005c54:	e8 cb 33 00 00       	call   c0009024 <assertion_failure>
c0005c59:	83 c4 10             	add    $0x10,%esp
c0005c5c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005c5f:	c9                   	leave  
c0005c60:	c3                   	ret    

c0005c61 <wait>:
c0005c61:	55                   	push   %ebp
c0005c62:	89 e5                	mov    %esp,%ebp
c0005c64:	83 ec 78             	sub    $0x78,%esp
c0005c67:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005c6e:	83 ec 04             	sub    $0x4,%esp
c0005c71:	6a 04                	push   $0x4
c0005c73:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005c76:	50                   	push   %eax
c0005c77:	6a 03                	push   $0x3
c0005c79:	e8 b1 3b 00 00       	call   c000982f <send_rec>
c0005c7e:	83 c4 10             	add    $0x10,%esp
c0005c81:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005c84:	89 c2                	mov    %eax,%edx
c0005c86:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c89:	89 10                	mov    %edx,(%eax)
c0005c8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c8e:	83 f8 1d             	cmp    $0x1d,%eax
c0005c91:	74 05                	je     c0005c98 <wait+0x37>
c0005c93:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c96:	eb 05                	jmp    c0005c9d <wait+0x3c>
c0005c98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005c9d:	c9                   	leave  
c0005c9e:	c3                   	ret    

c0005c9f <exit>:
c0005c9f:	55                   	push   %ebp
c0005ca0:	89 e5                	mov    %esp,%ebp
c0005ca2:	83 ec 78             	sub    $0x78,%esp
c0005ca5:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005cac:	8b 45 08             	mov    0x8(%ebp),%eax
c0005caf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005cb2:	83 ec 04             	sub    $0x4,%esp
c0005cb5:	6a 04                	push   $0x4
c0005cb7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005cba:	50                   	push   %eax
c0005cbb:	6a 03                	push   $0x3
c0005cbd:	e8 6d 3b 00 00       	call   c000982f <send_rec>
c0005cc2:	83 c4 10             	add    $0x10,%esp
c0005cc5:	90                   	nop
c0005cc6:	c9                   	leave  
c0005cc7:	c3                   	ret    

c0005cc8 <fork>:
c0005cc8:	55                   	push   %ebp
c0005cc9:	89 e5                	mov    %esp,%ebp
c0005ccb:	83 ec 78             	sub    $0x78,%esp
c0005cce:	83 ec 04             	sub    $0x4,%esp
c0005cd1:	6a 6c                	push   $0x6c
c0005cd3:	6a 00                	push   $0x0
c0005cd5:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005cd8:	50                   	push   %eax
c0005cd9:	e8 f9 4f 00 00       	call   c000acd7 <Memset>
c0005cde:	83 c4 10             	add    $0x10,%esp
c0005ce1:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005ce8:	83 ec 04             	sub    $0x4,%esp
c0005ceb:	6a 04                	push   $0x4
c0005ced:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005cf0:	50                   	push   %eax
c0005cf1:	6a 03                	push   $0x3
c0005cf3:	e8 37 3b 00 00       	call   c000982f <send_rec>
c0005cf8:	83 c4 10             	add    $0x10,%esp
c0005cfb:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005d02:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005d05:	85 c0                	test   %eax,%eax
c0005d07:	74 19                	je     c0005d22 <fork+0x5a>
c0005d09:	6a 14                	push   $0x14
c0005d0b:	68 e5 a4 00 c0       	push   $0xc000a4e5
c0005d10:	68 e5 a4 00 c0       	push   $0xc000a4e5
c0005d15:	68 f0 a4 00 c0       	push   $0xc000a4f0
c0005d1a:	e8 05 33 00 00       	call   c0009024 <assertion_failure>
c0005d1f:	83 c4 10             	add    $0x10,%esp
c0005d22:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d25:	c9                   	leave  
c0005d26:	c3                   	ret    

c0005d27 <getpid>:
c0005d27:	55                   	push   %ebp
c0005d28:	89 e5                	mov    %esp,%ebp
c0005d2a:	83 ec 78             	sub    $0x78,%esp
c0005d2d:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005d34:	83 ec 04             	sub    $0x4,%esp
c0005d37:	6a 03                	push   $0x3
c0005d39:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005d3c:	50                   	push   %eax
c0005d3d:	6a 03                	push   $0x3
c0005d3f:	e8 eb 3a 00 00       	call   c000982f <send_rec>
c0005d44:	83 c4 10             	add    $0x10,%esp
c0005d47:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d4a:	c9                   	leave  
c0005d4b:	c3                   	ret    

c0005d4c <exec>:
c0005d4c:	55                   	push   %ebp
c0005d4d:	89 e5                	mov    %esp,%ebp
c0005d4f:	83 ec 78             	sub    $0x78,%esp
c0005d52:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005d59:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d5c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005d5f:	83 ec 0c             	sub    $0xc,%esp
c0005d62:	ff 75 08             	pushl  0x8(%ebp)
c0005d65:	e8 a6 4f 00 00       	call   c000ad10 <Strlen>
c0005d6a:	83 c4 10             	add    $0x10,%esp
c0005d6d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005d70:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005d77:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005d7e:	83 ec 04             	sub    $0x4,%esp
c0005d81:	6a 04                	push   $0x4
c0005d83:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005d86:	50                   	push   %eax
c0005d87:	6a 03                	push   $0x3
c0005d89:	e8 a1 3a 00 00       	call   c000982f <send_rec>
c0005d8e:	83 c4 10             	add    $0x10,%esp
c0005d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d94:	83 f8 65             	cmp    $0x65,%eax
c0005d97:	74 19                	je     c0005db2 <exec+0x66>
c0005d99:	6a 19                	push   $0x19
c0005d9b:	68 00 a5 00 c0       	push   $0xc000a500
c0005da0:	68 00 a5 00 c0       	push   $0xc000a500
c0005da5:	68 0b a5 00 c0       	push   $0xc000a50b
c0005daa:	e8 75 32 00 00       	call   c0009024 <assertion_failure>
c0005daf:	83 c4 10             	add    $0x10,%esp
c0005db2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005db5:	c9                   	leave  
c0005db6:	c3                   	ret    

c0005db7 <execv>:
c0005db7:	55                   	push   %ebp
c0005db8:	89 e5                	mov    %esp,%ebp
c0005dba:	57                   	push   %edi
c0005dbb:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0005dc1:	83 ec 04             	sub    $0x4,%esp
c0005dc4:	68 00 80 00 00       	push   $0x8000
c0005dc9:	6a 00                	push   $0x0
c0005dcb:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005dd1:	50                   	push   %eax
c0005dd2:	e8 00 4f 00 00       	call   c000acd7 <Memset>
c0005dd7:	83 c4 10             	add    $0x10,%esp
c0005dda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005ddd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005de0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005de7:	eb 0d                	jmp    c0005df6 <execv+0x3f>
c0005de9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0005ded:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005df0:	83 c0 04             	add    $0x4,%eax
c0005df3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005df6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005df9:	8b 00                	mov    (%eax),%eax
c0005dfb:	85 c0                	test   %eax,%eax
c0005dfd:	75 ea                	jne    c0005de9 <execv+0x32>
c0005dff:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005e05:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e08:	01 d0                	add    %edx,%eax
c0005e0a:	c6 00 00             	movb   $0x0,(%eax)
c0005e0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e10:	83 c0 04             	add    $0x4,%eax
c0005e13:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005e16:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005e1c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005e1f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005e22:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005e25:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005e2c:	eb 64                	jmp    c0005e92 <execv+0xdb>
c0005e2e:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005e34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e37:	01 c2                	add    %eax,%edx
c0005e39:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e3c:	89 10                	mov    %edx,(%eax)
c0005e3e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e41:	8b 00                	mov    (%eax),%eax
c0005e43:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0005e49:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005e4c:	01 ca                	add    %ecx,%edx
c0005e4e:	83 ec 08             	sub    $0x8,%esp
c0005e51:	50                   	push   %eax
c0005e52:	52                   	push   %edx
c0005e53:	e8 9e 4e 00 00       	call   c000acf6 <Strcpy>
c0005e58:	83 c4 10             	add    $0x10,%esp
c0005e5b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e5e:	8b 00                	mov    (%eax),%eax
c0005e60:	83 ec 0c             	sub    $0xc,%esp
c0005e63:	50                   	push   %eax
c0005e64:	e8 a7 4e 00 00       	call   c000ad10 <Strlen>
c0005e69:	83 c4 10             	add    $0x10,%esp
c0005e6c:	01 45 f0             	add    %eax,-0x10(%ebp)
c0005e6f:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005e75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e78:	01 d0                	add    %edx,%eax
c0005e7a:	c6 00 00             	movb   $0x0,(%eax)
c0005e7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e80:	83 c0 01             	add    $0x1,%eax
c0005e83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005e86:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0005e8a:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005e8e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005e92:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e95:	8b 00                	mov    (%eax),%eax
c0005e97:	85 c0                	test   %eax,%eax
c0005e99:	75 93                	jne    c0005e2e <execv+0x77>
c0005e9b:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005ea1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005ea4:	eb 04                	jmp    c0005eaa <execv+0xf3>
c0005ea6:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0005eaa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005ead:	8b 00                	mov    (%eax),%eax
c0005eaf:	85 c0                	test   %eax,%eax
c0005eb1:	75 f3                	jne    c0005ea6 <execv+0xef>
c0005eb3:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0005eb9:	b8 00 00 00 00       	mov    $0x0,%eax
c0005ebe:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0005ec3:	89 d7                	mov    %edx,%edi
c0005ec5:	f3 ab                	rep stos %eax,%es:(%edi)
c0005ec7:	c7 85 4c 7f ff ff 23 	movl   $0xc000a523,-0x80b4(%ebp)
c0005ece:	a5 00 c0 
c0005ed1:	c7 85 50 7f ff ff 2a 	movl   $0xc000a52a,-0x80b0(%ebp)
c0005ed8:	a5 00 c0 
c0005edb:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0005ee2:	00 00 00 
c0005ee5:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ee8:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0005eee:	83 ec 0c             	sub    $0xc,%esp
c0005ef1:	ff 75 08             	pushl  0x8(%ebp)
c0005ef4:	e8 17 4e 00 00       	call   c000ad10 <Strlen>
c0005ef9:	83 c4 10             	add    $0x10,%esp
c0005efc:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0005f02:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005f08:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0005f0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f11:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0005f17:	83 ec 04             	sub    $0x4,%esp
c0005f1a:	6a 04                	push   $0x4
c0005f1c:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0005f22:	50                   	push   %eax
c0005f23:	6a 03                	push   $0x3
c0005f25:	e8 05 39 00 00       	call   c000982f <send_rec>
c0005f2a:	83 c4 10             	add    $0x10,%esp
c0005f2d:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0005f33:	83 f8 65             	cmp    $0x65,%eax
c0005f36:	74 19                	je     c0005f51 <execv+0x19a>
c0005f38:	6a 72                	push   $0x72
c0005f3a:	68 00 a5 00 c0       	push   $0xc000a500
c0005f3f:	68 00 a5 00 c0       	push   $0xc000a500
c0005f44:	68 0b a5 00 c0       	push   $0xc000a50b
c0005f49:	e8 d6 30 00 00       	call   c0009024 <assertion_failure>
c0005f4e:	83 c4 10             	add    $0x10,%esp
c0005f51:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0005f57:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0005f5a:	c9                   	leave  
c0005f5b:	c3                   	ret    

c0005f5c <execl>:
c0005f5c:	55                   	push   %ebp
c0005f5d:	89 e5                	mov    %esp,%ebp
c0005f5f:	83 ec 18             	sub    $0x18,%esp
c0005f62:	8d 45 0c             	lea    0xc(%ebp),%eax
c0005f65:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005f68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f6e:	83 ec 08             	sub    $0x8,%esp
c0005f71:	ff 75 f0             	pushl  -0x10(%ebp)
c0005f74:	ff 75 08             	pushl  0x8(%ebp)
c0005f77:	e8 3b fe ff ff       	call   c0005db7 <execv>
c0005f7c:	83 c4 10             	add    $0x10,%esp
c0005f7f:	c9                   	leave  
c0005f80:	c3                   	ret    

c0005f81 <TaskMM>:
c0005f81:	55                   	push   %ebp
c0005f82:	89 e5                	mov    %esp,%ebp
c0005f84:	eb fe                	jmp    c0005f84 <TaskMM+0x3>

c0005f86 <alloc_mem>:
c0005f86:	55                   	push   %ebp
c0005f87:	89 e5                	mov    %esp,%ebp
c0005f89:	83 ec 10             	sub    $0x10,%esp
c0005f8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0005f8f:	83 e8 04             	sub    $0x4,%eax
c0005f92:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0005f98:	05 00 00 a0 00       	add    $0xa00000,%eax
c0005f9d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005fa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005fa3:	c9                   	leave  
c0005fa4:	c3                   	ret    

c0005fa5 <do_exec2>:
c0005fa5:	55                   	push   %ebp
c0005fa6:	89 e5                	mov    %esp,%ebp
c0005fa8:	83 ec 10             	sub    $0x10,%esp
c0005fab:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0005fb2:	b8 00 00 00 00       	mov    $0x0,%eax
c0005fb7:	c9                   	leave  
c0005fb8:	c3                   	ret    

c0005fb9 <do_exec>:
c0005fb9:	55                   	push   %ebp
c0005fba:	89 e5                	mov    %esp,%ebp
c0005fbc:	56                   	push   %esi
c0005fbd:	53                   	push   %ebx
c0005fbe:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0005fc4:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0005fcb:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0005fd2:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c0005fd8:	83 ec 08             	sub    $0x8,%esp
c0005fdb:	6a 00                	push   $0x0
c0005fdd:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c0005fe0:	50                   	push   %eax
c0005fe1:	e8 2f fb ff ff       	call   c0005b15 <open>
c0005fe6:	83 c4 10             	add    $0x10,%esp
c0005fe9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005fec:	8b 45 08             	mov    0x8(%ebp),%eax
c0005fef:	8b 00                	mov    (%eax),%eax
c0005ff1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005ff4:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0005ffb:	83 ec 04             	sub    $0x4,%esp
c0005ffe:	6a 0c                	push   $0xc
c0006000:	6a 00                	push   $0x0
c0006002:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006008:	50                   	push   %eax
c0006009:	e8 c9 4c 00 00       	call   c000acd7 <Memset>
c000600e:	83 c4 10             	add    $0x10,%esp
c0006011:	8b 45 08             	mov    0x8(%ebp),%eax
c0006014:	8b 40 30             	mov    0x30(%eax),%eax
c0006017:	89 c6                	mov    %eax,%esi
c0006019:	8b 45 08             	mov    0x8(%ebp),%eax
c000601c:	8b 40 34             	mov    0x34(%eax),%eax
c000601f:	83 ec 08             	sub    $0x8,%esp
c0006022:	50                   	push   %eax
c0006023:	ff 75 d8             	pushl  -0x28(%ebp)
c0006026:	e8 02 ea ff ff       	call   c0004a2d <v2l>
c000602b:	83 c4 10             	add    $0x10,%esp
c000602e:	89 c3                	mov    %eax,%ebx
c0006030:	83 ec 08             	sub    $0x8,%esp
c0006033:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006039:	50                   	push   %eax
c000603a:	6a 04                	push   $0x4
c000603c:	e8 ec e9 ff ff       	call   c0004a2d <v2l>
c0006041:	83 c4 10             	add    $0x10,%esp
c0006044:	83 ec 04             	sub    $0x4,%esp
c0006047:	56                   	push   %esi
c0006048:	53                   	push   %ebx
c0006049:	50                   	push   %eax
c000604a:	e8 5a 4c 00 00       	call   c000aca9 <Memcpy>
c000604f:	83 c4 10             	add    $0x10,%esp
c0006052:	83 ec 08             	sub    $0x8,%esp
c0006055:	6a 00                	push   $0x0
c0006057:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000605d:	50                   	push   %eax
c000605e:	e8 b2 fa ff ff       	call   c0005b15 <open>
c0006063:	83 c4 10             	add    $0x10,%esp
c0006066:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006069:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006070:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006073:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0006079:	01 d0                	add    %edx,%eax
c000607b:	83 ec 04             	sub    $0x4,%esp
c000607e:	68 00 02 00 00       	push   $0x200
c0006083:	50                   	push   %eax
c0006084:	ff 75 d0             	pushl  -0x30(%ebp)
c0006087:	e8 fd fa ff ff       	call   c0005b89 <read>
c000608c:	83 c4 10             	add    $0x10,%esp
c000608f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006092:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006095:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006098:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c000609c:	74 02                	je     c00060a0 <do_exec+0xe7>
c000609e:	eb d0                	jmp    c0006070 <do_exec+0xb7>
c00060a0:	90                   	nop
c00060a1:	83 ec 0c             	sub    $0xc,%esp
c00060a4:	ff 75 d0             	pushl  -0x30(%ebp)
c00060a7:	e8 69 fb ff ff       	call   c0005c15 <close>
c00060ac:	83 c4 10             	add    $0x10,%esp
c00060af:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00060b5:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00060b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00060bf:	eb 72                	jmp    c0006133 <do_exec+0x17a>
c00060c1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00060c4:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00060c8:	0f b7 d0             	movzwl %ax,%edx
c00060cb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00060ce:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00060d2:	0f b7 c0             	movzwl %ax,%eax
c00060d5:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00060d9:	01 c2                	add    %eax,%edx
c00060db:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00060e1:	01 d0                	add    %edx,%eax
c00060e3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00060e6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00060e9:	8b 40 10             	mov    0x10(%eax),%eax
c00060ec:	89 c6                	mov    %eax,%esi
c00060ee:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00060f1:	8b 40 04             	mov    0x4(%eax),%eax
c00060f4:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00060fa:	01 d0                	add    %edx,%eax
c00060fc:	83 ec 08             	sub    $0x8,%esp
c00060ff:	50                   	push   %eax
c0006100:	6a 04                	push   $0x4
c0006102:	e8 26 e9 ff ff       	call   c0004a2d <v2l>
c0006107:	83 c4 10             	add    $0x10,%esp
c000610a:	89 c3                	mov    %eax,%ebx
c000610c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000610f:	8b 40 08             	mov    0x8(%eax),%eax
c0006112:	83 ec 08             	sub    $0x8,%esp
c0006115:	50                   	push   %eax
c0006116:	ff 75 d8             	pushl  -0x28(%ebp)
c0006119:	e8 0f e9 ff ff       	call   c0004a2d <v2l>
c000611e:	83 c4 10             	add    $0x10,%esp
c0006121:	83 ec 04             	sub    $0x4,%esp
c0006124:	56                   	push   %esi
c0006125:	53                   	push   %ebx
c0006126:	50                   	push   %eax
c0006127:	e8 7d 4b 00 00       	call   c000aca9 <Memcpy>
c000612c:	83 c4 10             	add    $0x10,%esp
c000612f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006133:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006136:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c000613a:	0f b7 c0             	movzwl %ax,%eax
c000613d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006140:	0f 8c 7b ff ff ff    	jl     c00060c1 <do_exec+0x108>
c0006146:	8b 45 08             	mov    0x8(%ebp),%eax
c0006149:	8b 40 10             	mov    0x10(%eax),%eax
c000614c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000614f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006152:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006155:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006158:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c000615f:	83 ec 08             	sub    $0x8,%esp
c0006162:	ff 75 c0             	pushl  -0x40(%ebp)
c0006165:	ff 75 d8             	pushl  -0x28(%ebp)
c0006168:	e8 c0 e8 ff ff       	call   c0004a2d <v2l>
c000616d:	83 c4 10             	add    $0x10,%esp
c0006170:	89 c3                	mov    %eax,%ebx
c0006172:	83 ec 08             	sub    $0x8,%esp
c0006175:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c000617b:	50                   	push   %eax
c000617c:	6a 04                	push   $0x4
c000617e:	e8 aa e8 ff ff       	call   c0004a2d <v2l>
c0006183:	83 c4 10             	add    $0x10,%esp
c0006186:	83 ec 04             	sub    $0x4,%esp
c0006189:	ff 75 bc             	pushl  -0x44(%ebp)
c000618c:	53                   	push   %ebx
c000618d:	50                   	push   %eax
c000618e:	e8 16 4b 00 00       	call   c000aca9 <Memcpy>
c0006193:	83 c4 10             	add    $0x10,%esp
c0006196:	83 ec 08             	sub    $0x8,%esp
c0006199:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c000619f:	50                   	push   %eax
c00061a0:	6a 04                	push   $0x4
c00061a2:	e8 86 e8 ff ff       	call   c0004a2d <v2l>
c00061a7:	83 c4 10             	add    $0x10,%esp
c00061aa:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00061ad:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00061b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00061b3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00061ba:	eb 08                	jmp    c00061c4 <do_exec+0x20b>
c00061bc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00061c0:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00061c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00061c7:	8b 00                	mov    (%eax),%eax
c00061c9:	85 c0                	test   %eax,%eax
c00061cb:	75 ef                	jne    c00061bc <do_exec+0x203>
c00061cd:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00061d0:	2b 45 c0             	sub    -0x40(%ebp),%eax
c00061d3:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00061d6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00061dd:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00061e3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00061e6:	eb 17                	jmp    c00061ff <do_exec+0x246>
c00061e8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00061ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00061ef:	8b 10                	mov    (%eax),%edx
c00061f1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00061f4:	01 c2                	add    %eax,%edx
c00061f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00061f9:	89 10                	mov    %edx,(%eax)
c00061fb:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00061ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006202:	8b 00                	mov    (%eax),%eax
c0006204:	85 c0                	test   %eax,%eax
c0006206:	75 e0                	jne    c00061e8 <do_exec+0x22f>
c0006208:	83 ec 08             	sub    $0x8,%esp
c000620b:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006211:	50                   	push   %eax
c0006212:	6a 04                	push   $0x4
c0006214:	e8 14 e8 ff ff       	call   c0004a2d <v2l>
c0006219:	83 c4 10             	add    $0x10,%esp
c000621c:	89 c3                	mov    %eax,%ebx
c000621e:	83 ec 08             	sub    $0x8,%esp
c0006221:	ff 75 b8             	pushl  -0x48(%ebp)
c0006224:	ff 75 d8             	pushl  -0x28(%ebp)
c0006227:	e8 01 e8 ff ff       	call   c0004a2d <v2l>
c000622c:	83 c4 10             	add    $0x10,%esp
c000622f:	83 ec 04             	sub    $0x4,%esp
c0006232:	ff 75 bc             	pushl  -0x44(%ebp)
c0006235:	53                   	push   %ebx
c0006236:	50                   	push   %eax
c0006237:	e8 6d 4a 00 00       	call   c000aca9 <Memcpy>
c000623c:	83 c4 10             	add    $0x10,%esp
c000623f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006242:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006245:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006248:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000624b:	69 d2 b0 01 00 00    	imul   $0x1b0,%edx,%edx
c0006251:	81 c2 78 34 08 c0    	add    $0xc0083478,%edx
c0006257:	89 02                	mov    %eax,(%edx)
c0006259:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000625c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000625f:	69 d2 b0 01 00 00    	imul   $0x1b0,%edx,%edx
c0006265:	81 c2 74 34 08 c0    	add    $0xc0083474,%edx
c000626b:	89 02                	mov    %eax,(%edx)
c000626d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006270:	8b 40 18             	mov    0x18(%eax),%eax
c0006273:	89 c2                	mov    %eax,%edx
c0006275:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006278:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c000627e:	05 7c 34 08 c0       	add    $0xc008347c,%eax
c0006283:	89 10                	mov    %edx,(%eax)
c0006285:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006288:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000628b:	69 d2 b0 01 00 00    	imul   $0x1b0,%edx,%edx
c0006291:	81 c2 88 34 08 c0    	add    $0xc0083488,%edx
c0006297:	89 02                	mov    %eax,(%edx)
c0006299:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000629c:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c00062a2:	05 30 34 08 c0       	add    $0xc0083430,%eax
c00062a7:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c00062ad:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c00062b4:	00 00 00 
c00062b7:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c00062be:	00 00 00 
c00062c1:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c00062c8:	00 00 00 
c00062cb:	83 ec 04             	sub    $0x4,%esp
c00062ce:	ff 75 d8             	pushl  -0x28(%ebp)
c00062d1:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c00062d7:	50                   	push   %eax
c00062d8:	6a 01                	push   $0x1
c00062da:	e8 50 35 00 00       	call   c000982f <send_rec>
c00062df:	83 c4 10             	add    $0x10,%esp
c00062e2:	90                   	nop
c00062e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00062e6:	5b                   	pop    %ebx
c00062e7:	5e                   	pop    %esi
c00062e8:	5d                   	pop    %ebp
c00062e9:	c3                   	ret    

c00062ea <do_fork>:
c00062ea:	55                   	push   %ebp
c00062eb:	89 e5                	mov    %esp,%ebp
c00062ed:	57                   	push   %edi
c00062ee:	56                   	push   %esi
c00062ef:	53                   	push   %ebx
c00062f0:	81 ec ac 00 00 00    	sub    $0xac,%esp
c00062f6:	c7 45 e4 a0 39 08 c0 	movl   $0xc00839a0,-0x1c(%ebp)
c00062fd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006304:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%ebp)
c000630b:	eb 21                	jmp    c000632e <do_fork+0x44>
c000630d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006310:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c0006317:	3c ff                	cmp    $0xff,%al
c0006319:	75 08                	jne    c0006323 <do_fork+0x39>
c000631b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000631e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006321:	eb 11                	jmp    c0006334 <do_fork+0x4a>
c0006323:	81 45 e4 b0 01 00 00 	addl   $0x1b0,-0x1c(%ebp)
c000632a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c000632e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0006332:	7e d9                	jle    c000630d <do_fork+0x23>
c0006334:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0006338:	7f 19                	jg     c0006353 <do_fork+0x69>
c000633a:	6a 25                	push   $0x25
c000633c:	68 34 a5 00 c0       	push   $0xc000a534
c0006341:	68 34 a5 00 c0       	push   $0xc000a534
c0006346:	68 44 a5 00 c0       	push   $0xc000a544
c000634b:	e8 d4 2c 00 00       	call   c0009024 <assertion_failure>
c0006350:	83 c4 10             	add    $0x10,%esp
c0006353:	8b 45 08             	mov    0x8(%ebp),%eax
c0006356:	8b 00                	mov    (%eax),%eax
c0006358:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000635b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000635e:	0f b7 80 0c 01 00 00 	movzwl 0x10c(%eax),%eax
c0006365:	0f b7 c0             	movzwl %ax,%eax
c0006368:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000636b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000636e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006371:	69 d2 b0 01 00 00    	imul   $0x1b0,%edx,%edx
c0006377:	8d 8a e0 32 08 c0    	lea    -0x3ff7cd20(%edx),%ecx
c000637d:	89 c2                	mov    %eax,%edx
c000637f:	89 cb                	mov    %ecx,%ebx
c0006381:	b8 6c 00 00 00       	mov    $0x6c,%eax
c0006386:	89 d7                	mov    %edx,%edi
c0006388:	89 de                	mov    %ebx,%esi
c000638a:	89 c1                	mov    %eax,%ecx
c000638c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000638e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006391:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006394:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000639a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000639d:	89 c2                	mov    %eax,%edx
c000639f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00063a2:	66 89 90 0c 01 00 00 	mov    %dx,0x10c(%eax)
c00063a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00063ac:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00063af:	89 90 64 01 00 00    	mov    %edx,0x164(%eax)
c00063b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00063b8:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c00063be:	05 00 01 00 00       	add    $0x100,%eax
c00063c3:	05 e0 32 08 c0       	add    $0xc00832e0,%eax
c00063c8:	83 c0 0e             	add    $0xe,%eax
c00063cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00063ce:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00063d1:	0f b6 40 07          	movzbl 0x7(%eax),%eax
c00063d5:	0f b6 c0             	movzbl %al,%eax
c00063d8:	c1 e0 18             	shl    $0x18,%eax
c00063db:	89 c2                	mov    %eax,%edx
c00063dd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00063e0:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c00063e4:	0f b6 c0             	movzbl %al,%eax
c00063e7:	c1 e0 10             	shl    $0x10,%eax
c00063ea:	01 c2                	add    %eax,%edx
c00063ec:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00063ef:	0f b7 40 02          	movzwl 0x2(%eax),%eax
c00063f3:	0f b7 c0             	movzwl %ax,%eax
c00063f6:	01 d0                	add    %edx,%eax
c00063f8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00063fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00063fe:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0006402:	0f b6 c0             	movzbl %al,%eax
c0006405:	25 00 00 0f 00       	and    $0xf0000,%eax
c000640a:	89 c2                	mov    %eax,%edx
c000640c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000640f:	0f b7 00             	movzwl (%eax),%eax
c0006412:	0f b7 c0             	movzwl %ax,%eax
c0006415:	01 d0                	add    %edx,%eax
c0006417:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000641a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000641d:	83 c0 01             	add    $0x1,%eax
c0006420:	c1 e0 0c             	shl    $0xc,%eax
c0006423:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006426:	83 ec 08             	sub    $0x8,%esp
c0006429:	ff 75 c4             	pushl  -0x3c(%ebp)
c000642c:	ff 75 e0             	pushl  -0x20(%ebp)
c000642f:	e8 52 fb ff ff       	call   c0005f86 <alloc_mem>
c0006434:	83 c4 10             	add    $0x10,%esp
c0006437:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000643a:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000643d:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006440:	83 ec 04             	sub    $0x4,%esp
c0006443:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006446:	52                   	push   %edx
c0006447:	50                   	push   %eax
c0006448:	e8 5c 48 00 00       	call   c000aca9 <Memcpy>
c000644d:	83 c4 10             	add    $0x10,%esp
c0006450:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0006457:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
c000645e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006461:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0006467:	05 00 01 00 00       	add    $0x100,%eax
c000646c:	05 e0 32 08 c0       	add    $0xc00832e0,%eax
c0006471:	83 c0 0e             	add    $0xe,%eax
c0006474:	ff 75 b8             	pushl  -0x48(%ebp)
c0006477:	ff 75 c8             	pushl  -0x38(%ebp)
c000647a:	ff 75 c0             	pushl  -0x40(%ebp)
c000647d:	50                   	push   %eax
c000647e:	e8 a2 e4 ff ff       	call   c0004925 <InitDescriptor>
c0006483:	83 c4 10             	add    $0x10,%esp
c0006486:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
c000648d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006490:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0006496:	05 08 01 00 00       	add    $0x108,%eax
c000649b:	05 e0 32 08 c0       	add    $0xc00832e0,%eax
c00064a0:	83 c0 0e             	add    $0xe,%eax
c00064a3:	ff 75 b4             	pushl  -0x4c(%ebp)
c00064a6:	ff 75 c8             	pushl  -0x38(%ebp)
c00064a9:	ff 75 c0             	pushl  -0x40(%ebp)
c00064ac:	50                   	push   %eax
c00064ad:	e8 73 e4 ff ff       	call   c0004925 <InitDescriptor>
c00064b2:	83 c4 10             	add    $0x10,%esp
c00064b5:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00064b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00064bb:	89 50 4c             	mov    %edx,0x4c(%eax)
c00064be:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
c00064c5:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c00064cc:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c00064d3:	83 ec 04             	sub    $0x4,%esp
c00064d6:	ff 75 e0             	pushl  -0x20(%ebp)
c00064d9:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
c00064df:	50                   	push   %eax
c00064e0:	6a 01                	push   $0x1
c00064e2:	e8 48 33 00 00       	call   c000982f <send_rec>
c00064e7:	83 c4 10             	add    $0x10,%esp
c00064ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00064ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00064f0:	5b                   	pop    %ebx
c00064f1:	5e                   	pop    %esi
c00064f2:	5f                   	pop    %edi
c00064f3:	5d                   	pop    %ebp
c00064f4:	c3                   	ret    

c00064f5 <do_exit>:
c00064f5:	55                   	push   %ebp
c00064f6:	89 e5                	mov    %esp,%ebp
c00064f8:	83 ec 18             	sub    $0x18,%esp
c00064fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00064fe:	8b 00                	mov    (%eax),%eax
c0006500:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006503:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006506:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c000650c:	05 e0 32 08 c0       	add    $0xc00832e0,%eax
c0006511:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006514:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006517:	8b 80 64 01 00 00    	mov    0x164(%eax),%eax
c000651d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006520:	8b 45 08             	mov    0x8(%ebp),%eax
c0006523:	8b 40 44             	mov    0x44(%eax),%eax
c0006526:	89 c2                	mov    %eax,%edx
c0006528:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000652b:	89 90 68 01 00 00    	mov    %edx,0x168(%eax)
c0006531:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006534:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c000653a:	05 29 34 08 c0       	add    $0xc0083429,%eax
c000653f:	0f b6 00             	movzbl (%eax),%eax
c0006542:	3c 04                	cmp    $0x4,%al
c0006544:	75 21                	jne    c0006567 <do_exit+0x72>
c0006546:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006549:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c000654f:	05 29 34 08 c0       	add    $0xc0083429,%eax
c0006554:	c6 00 fb             	movb   $0xfb,(%eax)
c0006557:	83 ec 0c             	sub    $0xc,%esp
c000655a:	ff 75 ec             	pushl  -0x14(%ebp)
c000655d:	e8 59 01 00 00       	call   c00066bb <cleanup>
c0006562:	83 c4 10             	add    $0x10,%esp
c0006565:	eb 0a                	jmp    c0006571 <do_exit+0x7c>
c0006567:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000656a:	c6 80 48 01 00 00 03 	movb   $0x3,0x148(%eax)
c0006571:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0006578:	eb 6e                	jmp    c00065e8 <do_exit+0xf3>
c000657a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000657d:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0006583:	05 44 34 08 c0       	add    $0xc0083444,%eax
c0006588:	8b 00                	mov    (%eax),%eax
c000658a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000658d:	75 55                	jne    c00065e4 <do_exit+0xef>
c000658f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006592:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0006598:	05 44 34 08 c0       	add    $0xc0083444,%eax
c000659d:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00065a3:	0f b6 05 49 3e 08 c0 	movzbl 0xc0083e49,%eax
c00065aa:	3c 04                	cmp    $0x4,%al
c00065ac:	75 36                	jne    c00065e4 <do_exit+0xef>
c00065ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065b1:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c00065b7:	05 29 34 08 c0       	add    $0xc0083429,%eax
c00065bc:	0f b6 00             	movzbl (%eax),%eax
c00065bf:	3c 03                	cmp    $0x3,%al
c00065c1:	75 21                	jne    c00065e4 <do_exit+0xef>
c00065c3:	c6 05 49 3e 08 c0 fb 	movb   $0xfb,0xc0083e49
c00065ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065cd:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c00065d3:	05 e0 32 08 c0       	add    $0xc00832e0,%eax
c00065d8:	83 ec 0c             	sub    $0xc,%esp
c00065db:	50                   	push   %eax
c00065dc:	e8 da 00 00 00       	call   c00066bb <cleanup>
c00065e1:	83 c4 10             	add    $0x10,%esp
c00065e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00065e8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00065ec:	7e 8c                	jle    c000657a <do_exit+0x85>
c00065ee:	90                   	nop
c00065ef:	c9                   	leave  
c00065f0:	c3                   	ret    

c00065f1 <do_wait>:
c00065f1:	55                   	push   %ebp
c00065f2:	89 e5                	mov    %esp,%ebp
c00065f4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00065fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00065fd:	8b 00                	mov    (%eax),%eax
c00065ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006602:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006609:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c0006610:	eb 5f                	jmp    c0006671 <do_wait+0x80>
c0006612:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006615:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c000661b:	05 44 34 08 c0       	add    $0xc0083444,%eax
c0006620:	8b 00                	mov    (%eax),%eax
c0006622:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006625:	75 46                	jne    c000666d <do_wait+0x7c>
c0006627:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000662b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000662e:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0006634:	05 29 34 08 c0       	add    $0xc0083429,%eax
c0006639:	0f b6 00             	movzbl (%eax),%eax
c000663c:	3c 03                	cmp    $0x3,%al
c000663e:	75 2d                	jne    c000666d <do_wait+0x7c>
c0006640:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006643:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0006649:	05 29 34 08 c0       	add    $0xc0083429,%eax
c000664e:	c6 00 fb             	movb   $0xfb,(%eax)
c0006651:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006654:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c000665a:	05 e0 32 08 c0       	add    $0xc00832e0,%eax
c000665f:	83 ec 0c             	sub    $0xc,%esp
c0006662:	50                   	push   %eax
c0006663:	e8 53 00 00 00       	call   c00066bb <cleanup>
c0006668:	83 c4 10             	add    $0x10,%esp
c000666b:	eb 4c                	jmp    c00066b9 <do_wait+0xc8>
c000666d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006671:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006675:	7e 9b                	jle    c0006612 <do_wait+0x21>
c0006677:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000667b:	74 13                	je     c0006690 <do_wait+0x9f>
c000667d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006680:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c0006686:	05 29 34 08 c0       	add    $0xc0083429,%eax
c000668b:	c6 00 04             	movb   $0x4,(%eax)
c000668e:	eb 29                	jmp    c00066b9 <do_wait+0xc8>
c0006690:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006697:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000669e:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00066a5:	83 ec 04             	sub    $0x4,%esp
c00066a8:	ff 75 ec             	pushl  -0x14(%ebp)
c00066ab:	8d 45 80             	lea    -0x80(%ebp),%eax
c00066ae:	50                   	push   %eax
c00066af:	6a 01                	push   $0x1
c00066b1:	e8 79 31 00 00       	call   c000982f <send_rec>
c00066b6:	83 c4 10             	add    $0x10,%esp
c00066b9:	c9                   	leave  
c00066ba:	c3                   	ret    

c00066bb <cleanup>:
c00066bb:	55                   	push   %ebp
c00066bc:	89 e5                	mov    %esp,%ebp
c00066be:	83 ec 78             	sub    $0x78,%esp
c00066c1:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00066c8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00066cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00066d2:	8b 80 64 01 00 00    	mov    0x164(%eax),%eax
c00066d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00066db:	8b 45 08             	mov    0x8(%ebp),%eax
c00066de:	8b 80 68 01 00 00    	mov    0x168(%eax),%eax
c00066e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00066e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00066ea:	8b 80 64 01 00 00    	mov    0x164(%eax),%eax
c00066f0:	83 ec 04             	sub    $0x4,%esp
c00066f3:	50                   	push   %eax
c00066f4:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00066f7:	50                   	push   %eax
c00066f8:	6a 01                	push   $0x1
c00066fa:	e8 30 31 00 00       	call   c000982f <send_rec>
c00066ff:	83 c4 10             	add    $0x10,%esp
c0006702:	8b 45 08             	mov    0x8(%ebp),%eax
c0006705:	c6 80 48 01 00 00 ff 	movb   $0xff,0x148(%eax)
c000670c:	90                   	nop
c000670d:	c9                   	leave  
c000670e:	c3                   	ret    

c000670f <init_bitmap>:
c000670f:	55                   	push   %ebp
c0006710:	89 e5                	mov    %esp,%ebp
c0006712:	83 ec 08             	sub    $0x8,%esp
c0006715:	8b 45 08             	mov    0x8(%ebp),%eax
c0006718:	8b 50 04             	mov    0x4(%eax),%edx
c000671b:	8b 45 08             	mov    0x8(%ebp),%eax
c000671e:	8b 00                	mov    (%eax),%eax
c0006720:	83 ec 04             	sub    $0x4,%esp
c0006723:	52                   	push   %edx
c0006724:	6a 00                	push   $0x0
c0006726:	50                   	push   %eax
c0006727:	e8 ab 45 00 00       	call   c000acd7 <Memset>
c000672c:	83 c4 10             	add    $0x10,%esp
c000672f:	90                   	nop
c0006730:	c9                   	leave  
c0006731:	c3                   	ret    

c0006732 <test_bit_val>:
c0006732:	55                   	push   %ebp
c0006733:	89 e5                	mov    %esp,%ebp
c0006735:	53                   	push   %ebx
c0006736:	83 ec 10             	sub    $0x10,%esp
c0006739:	8b 45 0c             	mov    0xc(%ebp),%eax
c000673c:	8d 50 07             	lea    0x7(%eax),%edx
c000673f:	85 c0                	test   %eax,%eax
c0006741:	0f 48 c2             	cmovs  %edx,%eax
c0006744:	c1 f8 03             	sar    $0x3,%eax
c0006747:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000674a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000674d:	99                   	cltd   
c000674e:	c1 ea 1d             	shr    $0x1d,%edx
c0006751:	01 d0                	add    %edx,%eax
c0006753:	83 e0 07             	and    $0x7,%eax
c0006756:	29 d0                	sub    %edx,%eax
c0006758:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000675b:	8b 45 08             	mov    0x8(%ebp),%eax
c000675e:	8b 10                	mov    (%eax),%edx
c0006760:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006763:	01 d0                	add    %edx,%eax
c0006765:	0f b6 00             	movzbl (%eax),%eax
c0006768:	88 45 f3             	mov    %al,-0xd(%ebp)
c000676b:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c000676f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006772:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006777:	89 c1                	mov    %eax,%ecx
c0006779:	d3 e3                	shl    %cl,%ebx
c000677b:	89 d8                	mov    %ebx,%eax
c000677d:	21 c2                	and    %eax,%edx
c000677f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006782:	89 c1                	mov    %eax,%ecx
c0006784:	d3 fa                	sar    %cl,%edx
c0006786:	89 d0                	mov    %edx,%eax
c0006788:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000678b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000678f:	0f 9f c0             	setg   %al
c0006792:	0f b6 c0             	movzbl %al,%eax
c0006795:	83 c4 10             	add    $0x10,%esp
c0006798:	5b                   	pop    %ebx
c0006799:	5d                   	pop    %ebp
c000679a:	c3                   	ret    

c000679b <set_bit_val>:
c000679b:	55                   	push   %ebp
c000679c:	89 e5                	mov    %esp,%ebp
c000679e:	83 ec 10             	sub    $0x10,%esp
c00067a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00067a4:	8d 50 07             	lea    0x7(%eax),%edx
c00067a7:	85 c0                	test   %eax,%eax
c00067a9:	0f 48 c2             	cmovs  %edx,%eax
c00067ac:	c1 f8 03             	sar    $0x3,%eax
c00067af:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00067b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00067b5:	99                   	cltd   
c00067b6:	c1 ea 1d             	shr    $0x1d,%edx
c00067b9:	01 d0                	add    %edx,%eax
c00067bb:	83 e0 07             	and    $0x7,%eax
c00067be:	29 d0                	sub    %edx,%eax
c00067c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00067c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00067c6:	8b 10                	mov    (%eax),%edx
c00067c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00067cb:	01 d0                	add    %edx,%eax
c00067cd:	0f b6 00             	movzbl (%eax),%eax
c00067d0:	88 45 ff             	mov    %al,-0x1(%ebp)
c00067d3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00067d7:	7e 13                	jle    c00067ec <set_bit_val+0x51>
c00067d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067dc:	ba 01 00 00 00       	mov    $0x1,%edx
c00067e1:	89 c1                	mov    %eax,%ecx
c00067e3:	d3 e2                	shl    %cl,%edx
c00067e5:	89 d0                	mov    %edx,%eax
c00067e7:	08 45 ff             	or     %al,-0x1(%ebp)
c00067ea:	eb 13                	jmp    c00067ff <set_bit_val+0x64>
c00067ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067ef:	ba 01 00 00 00       	mov    $0x1,%edx
c00067f4:	89 c1                	mov    %eax,%ecx
c00067f6:	d3 e2                	shl    %cl,%edx
c00067f8:	89 d0                	mov    %edx,%eax
c00067fa:	f7 d0                	not    %eax
c00067fc:	20 45 ff             	and    %al,-0x1(%ebp)
c00067ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0006802:	8b 10                	mov    (%eax),%edx
c0006804:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006807:	01 c2                	add    %eax,%edx
c0006809:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c000680d:	88 02                	mov    %al,(%edx)
c000680f:	b8 01 00 00 00       	mov    $0x1,%eax
c0006814:	c9                   	leave  
c0006815:	c3                   	ret    

c0006816 <set_bits>:
c0006816:	55                   	push   %ebp
c0006817:	89 e5                	mov    %esp,%ebp
c0006819:	83 ec 10             	sub    $0x10,%esp
c000681c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006823:	eb 1c                	jmp    c0006841 <set_bits+0x2b>
c0006825:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006828:	8d 50 01             	lea    0x1(%eax),%edx
c000682b:	89 55 0c             	mov    %edx,0xc(%ebp)
c000682e:	ff 75 10             	pushl  0x10(%ebp)
c0006831:	50                   	push   %eax
c0006832:	ff 75 08             	pushl  0x8(%ebp)
c0006835:	e8 61 ff ff ff       	call   c000679b <set_bit_val>
c000683a:	83 c4 0c             	add    $0xc,%esp
c000683d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006841:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006844:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006847:	7c dc                	jl     c0006825 <set_bits+0xf>
c0006849:	b8 01 00 00 00       	mov    $0x1,%eax
c000684e:	c9                   	leave  
c000684f:	c3                   	ret    

c0006850 <get_first_free_bit>:
c0006850:	55                   	push   %ebp
c0006851:	89 e5                	mov    %esp,%ebp
c0006853:	83 ec 10             	sub    $0x10,%esp
c0006856:	8b 45 08             	mov    0x8(%ebp),%eax
c0006859:	8b 40 04             	mov    0x4(%eax),%eax
c000685c:	c1 e0 03             	shl    $0x3,%eax
c000685f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006862:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006865:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006868:	eb 1b                	jmp    c0006885 <get_first_free_bit+0x35>
c000686a:	ff 75 fc             	pushl  -0x4(%ebp)
c000686d:	ff 75 08             	pushl  0x8(%ebp)
c0006870:	e8 bd fe ff ff       	call   c0006732 <test_bit_val>
c0006875:	83 c4 08             	add    $0x8,%esp
c0006878:	85 c0                	test   %eax,%eax
c000687a:	75 05                	jne    c0006881 <get_first_free_bit+0x31>
c000687c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000687f:	eb 11                	jmp    c0006892 <get_first_free_bit+0x42>
c0006881:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006885:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006888:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c000688b:	7c dd                	jl     c000686a <get_first_free_bit+0x1a>
c000688d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006892:	c9                   	leave  
c0006893:	c3                   	ret    

c0006894 <get_bits>:
c0006894:	55                   	push   %ebp
c0006895:	89 e5                	mov    %esp,%ebp
c0006897:	83 ec 20             	sub    $0x20,%esp
c000689a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00068a1:	ff 75 f0             	pushl  -0x10(%ebp)
c00068a4:	ff 75 08             	pushl  0x8(%ebp)
c00068a7:	e8 a4 ff ff ff       	call   c0006850 <get_first_free_bit>
c00068ac:	83 c4 08             	add    $0x8,%esp
c00068af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00068b5:	8b 40 04             	mov    0x4(%eax),%eax
c00068b8:	c1 e0 03             	shl    $0x3,%eax
c00068bb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00068be:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068c1:	83 e8 01             	sub    $0x1,%eax
c00068c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00068c7:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c00068cb:	75 08                	jne    c00068d5 <get_bits+0x41>
c00068cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068d0:	e9 85 00 00 00       	jmp    c000695a <get_bits+0xc6>
c00068d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068d8:	83 c0 01             	add    $0x1,%eax
c00068db:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00068de:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068e4:	eb 58                	jmp    c000693e <get_bits+0xaa>
c00068e6:	ff 75 f8             	pushl  -0x8(%ebp)
c00068e9:	ff 75 08             	pushl  0x8(%ebp)
c00068ec:	e8 41 fe ff ff       	call   c0006732 <test_bit_val>
c00068f1:	83 c4 08             	add    $0x8,%esp
c00068f4:	85 c0                	test   %eax,%eax
c00068f6:	75 0a                	jne    c0006902 <get_bits+0x6e>
c00068f8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00068fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006900:	eb 2b                	jmp    c000692d <get_bits+0x99>
c0006902:	6a 00                	push   $0x0
c0006904:	ff 75 08             	pushl  0x8(%ebp)
c0006907:	e8 44 ff ff ff       	call   c0006850 <get_first_free_bit>
c000690c:	83 c4 08             	add    $0x8,%esp
c000690f:	83 c0 01             	add    $0x1,%eax
c0006912:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006915:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006918:	83 c0 01             	add    $0x1,%eax
c000691b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000691e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006921:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006924:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006927:	83 e8 01             	sub    $0x1,%eax
c000692a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000692d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006930:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006933:	7c 09                	jl     c000693e <get_bits+0xaa>
c0006935:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c000693c:	eb 0d                	jmp    c000694b <get_bits+0xb7>
c000693e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006941:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006944:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006947:	85 c0                	test   %eax,%eax
c0006949:	7f 9b                	jg     c00068e6 <get_bits+0x52>
c000694b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000694e:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006951:	83 c0 01             	add    $0x1,%eax
c0006954:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006957:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000695a:	c9                   	leave  
c000695b:	c3                   	ret    

c000695c <get_a_page2>:
c000695c:	55                   	push   %ebp
c000695d:	89 e5                	mov    %esp,%ebp
c000695f:	83 ec 18             	sub    $0x18,%esp
c0006962:	83 ec 0c             	sub    $0xc,%esp
c0006965:	ff 75 0c             	pushl  0xc(%ebp)
c0006968:	e8 1e 00 00 00       	call   c000698b <get_a_page>
c000696d:	83 c4 10             	add    $0x10,%esp
c0006970:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006973:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006976:	8b 45 08             	mov    0x8(%ebp),%eax
c0006979:	83 ec 08             	sub    $0x8,%esp
c000697c:	52                   	push   %edx
c000697d:	50                   	push   %eax
c000697e:	e8 61 01 00 00       	call   c0006ae4 <add_map_entry>
c0006983:	83 c4 10             	add    $0x10,%esp
c0006986:	8b 45 08             	mov    0x8(%ebp),%eax
c0006989:	c9                   	leave  
c000698a:	c3                   	ret    

c000698b <get_a_page>:
c000698b:	55                   	push   %ebp
c000698c:	89 e5                	mov    %esp,%ebp
c000698e:	83 ec 20             	sub    $0x20,%esp
c0006991:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006995:	75 22                	jne    c00069b9 <get_a_page+0x2e>
c0006997:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c000699c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000699f:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c00069a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069a7:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00069ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00069af:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00069b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069b7:	eb 20                	jmp    c00069d9 <get_a_page+0x4e>
c00069b9:	a1 e4 1e 01 c0       	mov    0xc0011ee4,%eax
c00069be:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00069c1:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00069c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069c9:	a1 ec 1e 01 c0       	mov    0xc0011eec,%eax
c00069ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00069d1:	a1 f0 1e 01 c0       	mov    0xc0011ef0,%eax
c00069d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00069dc:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00069df:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00069e2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00069e5:	6a 01                	push   $0x1
c00069e7:	8d 45 e0             	lea    -0x20(%ebp),%eax
c00069ea:	50                   	push   %eax
c00069eb:	e8 a4 fe ff ff       	call   c0006894 <get_bits>
c00069f0:	83 c4 08             	add    $0x8,%esp
c00069f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00069f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00069f9:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00069fc:	c1 e2 0c             	shl    $0xc,%edx
c00069ff:	01 d0                	add    %edx,%eax
c0006a01:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a04:	6a 01                	push   $0x1
c0006a06:	ff 75 fc             	pushl  -0x4(%ebp)
c0006a09:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006a0c:	50                   	push   %eax
c0006a0d:	e8 89 fd ff ff       	call   c000679b <set_bit_val>
c0006a12:	83 c4 0c             	add    $0xc,%esp
c0006a15:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a18:	c9                   	leave  
c0006a19:	c3                   	ret    

c0006a1a <get_virtual_address>:
c0006a1a:	55                   	push   %ebp
c0006a1b:	89 e5                	mov    %esp,%ebp
c0006a1d:	83 ec 28             	sub    $0x28,%esp
c0006a20:	e8 6c ae ff ff       	call   c0001891 <get_running_thread_pcb>
c0006a25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a28:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006a2c:	75 1a                	jne    c0006a48 <get_virtual_address+0x2e>
c0006a2e:	a1 54 f7 00 c0       	mov    0xc000f754,%eax
c0006a33:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006a36:	a1 58 f7 00 c0       	mov    0xc000f758,%eax
c0006a3b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006a3e:	a1 5c f7 00 c0       	mov    0xc000f75c,%eax
c0006a43:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006a46:	eb 18                	jmp    c0006a60 <get_virtual_address+0x46>
c0006a48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a4b:	8b 40 08             	mov    0x8(%eax),%eax
c0006a4e:	83 ec 04             	sub    $0x4,%esp
c0006a51:	6a 0c                	push   $0xc
c0006a53:	50                   	push   %eax
c0006a54:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006a57:	50                   	push   %eax
c0006a58:	e8 4c 42 00 00       	call   c000aca9 <Memcpy>
c0006a5d:	83 c4 10             	add    $0x10,%esp
c0006a60:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006a63:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006a66:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006a69:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006a6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a6f:	83 ec 08             	sub    $0x8,%esp
c0006a72:	50                   	push   %eax
c0006a73:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006a76:	50                   	push   %eax
c0006a77:	e8 18 fe ff ff       	call   c0006894 <get_bits>
c0006a7c:	83 c4 10             	add    $0x10,%esp
c0006a7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a82:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006a85:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006a88:	c1 e2 0c             	shl    $0xc,%edx
c0006a8b:	01 d0                	add    %edx,%eax
c0006a8d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a90:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a93:	50                   	push   %eax
c0006a94:	6a 01                	push   $0x1
c0006a96:	ff 75 f0             	pushl  -0x10(%ebp)
c0006a99:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006a9c:	50                   	push   %eax
c0006a9d:	e8 74 fd ff ff       	call   c0006816 <set_bits>
c0006aa2:	83 c4 10             	add    $0x10,%esp
c0006aa5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006aa8:	c9                   	leave  
c0006aa9:	c3                   	ret    

c0006aaa <ptr_pde>:
c0006aaa:	55                   	push   %ebp
c0006aab:	89 e5                	mov    %esp,%ebp
c0006aad:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ab0:	c1 e8 16             	shr    $0x16,%eax
c0006ab3:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006ab8:	c1 e0 02             	shl    $0x2,%eax
c0006abb:	5d                   	pop    %ebp
c0006abc:	c3                   	ret    

c0006abd <ptr_pte>:
c0006abd:	55                   	push   %ebp
c0006abe:	89 e5                	mov    %esp,%ebp
c0006ac0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ac3:	c1 e8 0a             	shr    $0xa,%eax
c0006ac6:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006acb:	89 c2                	mov    %eax,%edx
c0006acd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ad0:	c1 e8 0c             	shr    $0xc,%eax
c0006ad3:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006ad8:	c1 e0 02             	shl    $0x2,%eax
c0006adb:	01 d0                	add    %edx,%eax
c0006add:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006ae2:	5d                   	pop    %ebp
c0006ae3:	c3                   	ret    

c0006ae4 <add_map_entry>:
c0006ae4:	55                   	push   %ebp
c0006ae5:	89 e5                	mov    %esp,%ebp
c0006ae7:	83 ec 18             	sub    $0x18,%esp
c0006aea:	ff 75 08             	pushl  0x8(%ebp)
c0006aed:	e8 b8 ff ff ff       	call   c0006aaa <ptr_pde>
c0006af2:	83 c4 04             	add    $0x4,%esp
c0006af5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006af8:	ff 75 08             	pushl  0x8(%ebp)
c0006afb:	e8 bd ff ff ff       	call   c0006abd <ptr_pte>
c0006b00:	83 c4 04             	add    $0x4,%esp
c0006b03:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b09:	8b 00                	mov    (%eax),%eax
c0006b0b:	83 e0 01             	and    $0x1,%eax
c0006b0e:	85 c0                	test   %eax,%eax
c0006b10:	74 1b                	je     c0006b2d <add_map_entry+0x49>
c0006b12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b15:	8b 00                	mov    (%eax),%eax
c0006b17:	83 e0 01             	and    $0x1,%eax
c0006b1a:	85 c0                	test   %eax,%eax
c0006b1c:	75 51                	jne    c0006b6f <add_map_entry+0x8b>
c0006b1e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b21:	83 c8 07             	or     $0x7,%eax
c0006b24:	89 c2                	mov    %eax,%edx
c0006b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b29:	89 10                	mov    %edx,(%eax)
c0006b2b:	eb 42                	jmp    c0006b6f <add_map_entry+0x8b>
c0006b2d:	6a 00                	push   $0x0
c0006b2f:	e8 57 fe ff ff       	call   c000698b <get_a_page>
c0006b34:	83 c4 04             	add    $0x4,%esp
c0006b37:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b3d:	83 c8 07             	or     $0x7,%eax
c0006b40:	89 c2                	mov    %eax,%edx
c0006b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b45:	89 10                	mov    %edx,(%eax)
c0006b47:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b4a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006b4f:	83 ec 04             	sub    $0x4,%esp
c0006b52:	68 00 10 00 00       	push   $0x1000
c0006b57:	6a 00                	push   $0x0
c0006b59:	50                   	push   %eax
c0006b5a:	e8 78 41 00 00       	call   c000acd7 <Memset>
c0006b5f:	83 c4 10             	add    $0x10,%esp
c0006b62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b65:	83 c8 07             	or     $0x7,%eax
c0006b68:	89 c2                	mov    %eax,%edx
c0006b6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b6d:	89 10                	mov    %edx,(%eax)
c0006b6f:	90                   	nop
c0006b70:	c9                   	leave  
c0006b71:	c3                   	ret    

c0006b72 <alloc_virtual_memory>:
c0006b72:	55                   	push   %ebp
c0006b73:	89 e5                	mov    %esp,%ebp
c0006b75:	83 ec 18             	sub    $0x18,%esp
c0006b78:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b7b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006b80:	c1 e8 0c             	shr    $0xc,%eax
c0006b83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b86:	e8 06 ad ff ff       	call   c0001891 <get_running_thread_pcb>
c0006b8b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b91:	8b 40 04             	mov    0x4(%eax),%eax
c0006b94:	85 c0                	test   %eax,%eax
c0006b96:	75 09                	jne    c0006ba1 <alloc_virtual_memory+0x2f>
c0006b98:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006b9f:	eb 07                	jmp    c0006ba8 <alloc_virtual_memory+0x36>
c0006ba1:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006ba8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006bab:	83 ec 08             	sub    $0x8,%esp
c0006bae:	ff 75 f4             	pushl  -0xc(%ebp)
c0006bb1:	50                   	push   %eax
c0006bb2:	e8 63 fe ff ff       	call   c0006a1a <get_virtual_address>
c0006bb7:	83 c4 10             	add    $0x10,%esp
c0006bba:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bbd:	83 ec 08             	sub    $0x8,%esp
c0006bc0:	ff 75 08             	pushl  0x8(%ebp)
c0006bc3:	ff 75 e8             	pushl  -0x18(%ebp)
c0006bc6:	e8 19 ff ff ff       	call   c0006ae4 <add_map_entry>
c0006bcb:	83 c4 10             	add    $0x10,%esp
c0006bce:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bd1:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006bd6:	89 c2                	mov    %eax,%edx
c0006bd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006bdb:	01 d0                	add    %edx,%eax
c0006bdd:	c9                   	leave  
c0006bde:	c3                   	ret    

c0006bdf <get_physical_address>:
c0006bdf:	55                   	push   %ebp
c0006be0:	89 e5                	mov    %esp,%ebp
c0006be2:	83 ec 10             	sub    $0x10,%esp
c0006be5:	ff 75 08             	pushl  0x8(%ebp)
c0006be8:	e8 d0 fe ff ff       	call   c0006abd <ptr_pte>
c0006bed:	83 c4 04             	add    $0x4,%esp
c0006bf0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006bf3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006bf6:	8b 00                	mov    (%eax),%eax
c0006bf8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006bfd:	89 c2                	mov    %eax,%edx
c0006bff:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c02:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006c07:	09 d0                	or     %edx,%eax
c0006c09:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c0c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c0f:	c9                   	leave  
c0006c10:	c3                   	ret    

c0006c11 <alloc_memory>:
c0006c11:	55                   	push   %ebp
c0006c12:	89 e5                	mov    %esp,%ebp
c0006c14:	83 ec 18             	sub    $0x18,%esp
c0006c17:	83 ec 08             	sub    $0x8,%esp
c0006c1a:	ff 75 0c             	pushl  0xc(%ebp)
c0006c1d:	ff 75 08             	pushl  0x8(%ebp)
c0006c20:	e8 f5 fd ff ff       	call   c0006a1a <get_virtual_address>
c0006c25:	83 c4 10             	add    $0x10,%esp
c0006c28:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c2e:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006c33:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c36:	eb 29                	jmp    c0006c61 <alloc_memory+0x50>
c0006c38:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006c3f:	83 ec 0c             	sub    $0xc,%esp
c0006c42:	ff 75 0c             	pushl  0xc(%ebp)
c0006c45:	e8 41 fd ff ff       	call   c000698b <get_a_page>
c0006c4a:	83 c4 10             	add    $0x10,%esp
c0006c4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c50:	83 ec 08             	sub    $0x8,%esp
c0006c53:	ff 75 ec             	pushl  -0x14(%ebp)
c0006c56:	ff 75 f4             	pushl  -0xc(%ebp)
c0006c59:	e8 86 fe ff ff       	call   c0006ae4 <add_map_entry>
c0006c5e:	83 c4 10             	add    $0x10,%esp
c0006c61:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c64:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006c67:	89 55 08             	mov    %edx,0x8(%ebp)
c0006c6a:	85 c0                	test   %eax,%eax
c0006c6c:	75 ca                	jne    c0006c38 <alloc_memory+0x27>
c0006c6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c71:	c9                   	leave  
c0006c72:	c3                   	ret    

c0006c73 <get_a_virtual_page>:
c0006c73:	55                   	push   %ebp
c0006c74:	89 e5                	mov    %esp,%ebp
c0006c76:	83 ec 18             	sub    $0x18,%esp
c0006c79:	ff 75 08             	pushl  0x8(%ebp)
c0006c7c:	e8 0a fd ff ff       	call   c000698b <get_a_page>
c0006c81:	83 c4 04             	add    $0x4,%esp
c0006c84:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c87:	83 ec 08             	sub    $0x8,%esp
c0006c8a:	ff 75 f4             	pushl  -0xc(%ebp)
c0006c8d:	ff 75 0c             	pushl  0xc(%ebp)
c0006c90:	e8 4f fe ff ff       	call   c0006ae4 <add_map_entry>
c0006c95:	83 c4 10             	add    $0x10,%esp
c0006c98:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c9b:	c9                   	leave  
c0006c9c:	c3                   	ret    

c0006c9d <block2arena>:
c0006c9d:	55                   	push   %ebp
c0006c9e:	89 e5                	mov    %esp,%ebp
c0006ca0:	83 ec 10             	sub    $0x10,%esp
c0006ca3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ca6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006cab:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006cae:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006cb1:	c9                   	leave  
c0006cb2:	c3                   	ret    

c0006cb3 <sys_malloc>:
c0006cb3:	55                   	push   %ebp
c0006cb4:	89 e5                	mov    %esp,%ebp
c0006cb6:	83 ec 58             	sub    $0x58,%esp
c0006cb9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006cc0:	e8 cc ab ff ff       	call   c0001891 <get_running_thread_pcb>
c0006cc5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006cc8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006ccb:	8b 40 04             	mov    0x4(%eax),%eax
c0006cce:	85 c0                	test   %eax,%eax
c0006cd0:	75 10                	jne    c0006ce2 <sys_malloc+0x2f>
c0006cd2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006cd9:	c7 45 ec e0 31 08 c0 	movl   $0xc00831e0,-0x14(%ebp)
c0006ce0:	eb 10                	jmp    c0006cf2 <sys_malloc+0x3f>
c0006ce2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006ce9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006cec:	83 c0 0c             	add    $0xc,%eax
c0006cef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006cf2:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0006cf9:	76 50                	jbe    c0006d4b <sys_malloc+0x98>
c0006cfb:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cfe:	05 0b 10 00 00       	add    $0x100b,%eax
c0006d03:	c1 e8 0c             	shr    $0xc,%eax
c0006d06:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006d09:	83 ec 08             	sub    $0x8,%esp
c0006d0c:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d0f:	ff 75 d8             	pushl  -0x28(%ebp)
c0006d12:	e8 fa fe ff ff       	call   c0006c11 <alloc_memory>
c0006d17:	83 c4 10             	add    $0x10,%esp
c0006d1a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006d1d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006d20:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006d23:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006d26:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0006d2c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006d2f:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0006d36:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006d39:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0006d3d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006d40:	83 c0 0c             	add    $0xc,%eax
c0006d43:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d46:	e9 75 01 00 00       	jmp    c0006ec0 <sys_malloc+0x20d>
c0006d4b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006d52:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006d59:	eb 26                	jmp    c0006d81 <sys_malloc+0xce>
c0006d5b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006d5e:	89 d0                	mov    %edx,%eax
c0006d60:	01 c0                	add    %eax,%eax
c0006d62:	01 d0                	add    %edx,%eax
c0006d64:	c1 e0 03             	shl    $0x3,%eax
c0006d67:	89 c2                	mov    %eax,%edx
c0006d69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d6c:	01 d0                	add    %edx,%eax
c0006d6e:	8b 00                	mov    (%eax),%eax
c0006d70:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006d73:	77 08                	ja     c0006d7d <sys_malloc+0xca>
c0006d75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006d78:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d7b:	eb 0a                	jmp    c0006d87 <sys_malloc+0xd4>
c0006d7d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006d81:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0006d85:	7e d4                	jle    c0006d5b <sys_malloc+0xa8>
c0006d87:	83 ec 08             	sub    $0x8,%esp
c0006d8a:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d8d:	6a 01                	push   $0x1
c0006d8f:	e8 7d fe ff ff       	call   c0006c11 <alloc_memory>
c0006d94:	83 c4 10             	add    $0x10,%esp
c0006d97:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006d9a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006d9d:	89 d0                	mov    %edx,%eax
c0006d9f:	01 c0                	add    %eax,%eax
c0006da1:	01 d0                	add    %edx,%eax
c0006da3:	c1 e0 03             	shl    $0x3,%eax
c0006da6:	89 c2                	mov    %eax,%edx
c0006da8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dab:	01 d0                	add    %edx,%eax
c0006dad:	83 ec 04             	sub    $0x4,%esp
c0006db0:	6a 18                	push   $0x18
c0006db2:	50                   	push   %eax
c0006db3:	ff 75 cc             	pushl  -0x34(%ebp)
c0006db6:	e8 ee 3e 00 00       	call   c000aca9 <Memcpy>
c0006dbb:	83 c4 10             	add    $0x10,%esp
c0006dbe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006dc1:	89 d0                	mov    %edx,%eax
c0006dc3:	01 c0                	add    %eax,%eax
c0006dc5:	01 d0                	add    %edx,%eax
c0006dc7:	c1 e0 03             	shl    $0x3,%eax
c0006dca:	89 c2                	mov    %eax,%edx
c0006dcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dcf:	01 d0                	add    %edx,%eax
c0006dd1:	83 c0 08             	add    $0x8,%eax
c0006dd4:	83 ec 0c             	sub    $0xc,%esp
c0006dd7:	50                   	push   %eax
c0006dd8:	e8 f6 30 00 00       	call   c0009ed3 <isListEmpty>
c0006ddd:	83 c4 10             	add    $0x10,%esp
c0006de0:	3c 01                	cmp    $0x1,%al
c0006de2:	0f 85 8c 00 00 00    	jne    c0006e74 <sys_malloc+0x1c1>
c0006de8:	83 ec 08             	sub    $0x8,%esp
c0006deb:	ff 75 f0             	pushl  -0x10(%ebp)
c0006dee:	6a 01                	push   $0x1
c0006df0:	e8 1c fe ff ff       	call   c0006c11 <alloc_memory>
c0006df5:	83 c4 10             	add    $0x10,%esp
c0006df8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006dfb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006dfe:	8b 00                	mov    (%eax),%eax
c0006e00:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006e03:	c7 45 c0 0c 00 00 00 	movl   $0xc,-0x40(%ebp)
c0006e0a:	b8 00 10 00 00       	mov    $0x1000,%eax
c0006e0f:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006e12:	ba 00 00 00 00       	mov    $0x0,%edx
c0006e17:	f7 75 c4             	divl   -0x3c(%ebp)
c0006e1a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006e1d:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0006e20:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006e23:	01 d0                	add    %edx,%eax
c0006e25:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0006e28:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006e2f:	eb 3b                	jmp    c0006e6c <sys_malloc+0x1b9>
c0006e31:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006e34:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
c0006e38:	89 c2                	mov    %eax,%edx
c0006e3a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006e3d:	01 d0                	add    %edx,%eax
c0006e3f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006e42:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0006e45:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006e48:	89 d0                	mov    %edx,%eax
c0006e4a:	01 c0                	add    %eax,%eax
c0006e4c:	01 d0                	add    %edx,%eax
c0006e4e:	c1 e0 03             	shl    $0x3,%eax
c0006e51:	89 c2                	mov    %eax,%edx
c0006e53:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e56:	01 d0                	add    %edx,%eax
c0006e58:	83 c0 08             	add    $0x8,%eax
c0006e5b:	83 ec 08             	sub    $0x8,%esp
c0006e5e:	51                   	push   %ecx
c0006e5f:	50                   	push   %eax
c0006e60:	e8 8f 30 00 00       	call   c0009ef4 <appendToDoubleLinkList>
c0006e65:	83 c4 10             	add    $0x10,%esp
c0006e68:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0006e6c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006e6f:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0006e72:	77 bd                	ja     c0006e31 <sys_malloc+0x17e>
c0006e74:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006e77:	89 d0                	mov    %edx,%eax
c0006e79:	01 c0                	add    %eax,%eax
c0006e7b:	01 d0                	add    %edx,%eax
c0006e7d:	c1 e0 03             	shl    $0x3,%eax
c0006e80:	89 c2                	mov    %eax,%edx
c0006e82:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e85:	01 d0                	add    %edx,%eax
c0006e87:	83 c0 08             	add    $0x8,%eax
c0006e8a:	83 ec 0c             	sub    $0xc,%esp
c0006e8d:	50                   	push   %eax
c0006e8e:	e8 e7 30 00 00       	call   c0009f7a <popFromDoubleLinkList>
c0006e93:	83 c4 10             	add    $0x10,%esp
c0006e96:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006e99:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006e9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e9f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006ea2:	83 ec 0c             	sub    $0xc,%esp
c0006ea5:	50                   	push   %eax
c0006ea6:	e8 f2 fd ff ff       	call   c0006c9d <block2arena>
c0006eab:	83 c4 10             	add    $0x10,%esp
c0006eae:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006eb1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006eb4:	8b 40 04             	mov    0x4(%eax),%eax
c0006eb7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006eba:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006ebd:	89 50 04             	mov    %edx,0x4(%eax)
c0006ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ec3:	c9                   	leave  
c0006ec4:	c3                   	ret    

c0006ec5 <remove_map_entry>:
c0006ec5:	55                   	push   %ebp
c0006ec6:	89 e5                	mov    %esp,%ebp
c0006ec8:	83 ec 10             	sub    $0x10,%esp
c0006ecb:	ff 75 08             	pushl  0x8(%ebp)
c0006ece:	e8 ea fb ff ff       	call   c0006abd <ptr_pte>
c0006ed3:	83 c4 04             	add    $0x4,%esp
c0006ed6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ed9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006edc:	8b 10                	mov    (%eax),%edx
c0006ede:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ee1:	89 10                	mov    %edx,(%eax)
c0006ee3:	90                   	nop
c0006ee4:	c9                   	leave  
c0006ee5:	c3                   	ret    

c0006ee6 <free_a_page>:
c0006ee6:	55                   	push   %ebp
c0006ee7:	89 e5                	mov    %esp,%ebp
c0006ee9:	83 ec 20             	sub    $0x20,%esp
c0006eec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006ef0:	75 21                	jne    c0006f13 <free_a_page+0x2d>
c0006ef2:	a1 54 f7 00 c0       	mov    0xc000f754,%eax
c0006ef7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006efa:	a1 58 f7 00 c0       	mov    0xc000f758,%eax
c0006eff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f02:	a1 5c f7 00 c0       	mov    0xc000f75c,%eax
c0006f07:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f0a:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c0006f11:	eb 1f                	jmp    c0006f32 <free_a_page+0x4c>
c0006f13:	a1 54 f7 00 c0       	mov    0xc000f754,%eax
c0006f18:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006f1b:	a1 58 f7 00 c0       	mov    0xc000f758,%eax
c0006f20:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f23:	a1 5c f7 00 c0       	mov    0xc000f75c,%eax
c0006f28:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f2b:	c7 45 fc e4 1e 01 c0 	movl   $0xc0011ee4,-0x4(%ebp)
c0006f32:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f35:	c1 e8 0c             	shr    $0xc,%eax
c0006f38:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f3b:	6a 00                	push   $0x0
c0006f3d:	ff 75 f8             	pushl  -0x8(%ebp)
c0006f40:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0006f43:	50                   	push   %eax
c0006f44:	e8 52 f8 ff ff       	call   c000679b <set_bit_val>
c0006f49:	83 c4 0c             	add    $0xc,%esp
c0006f4c:	ff 75 08             	pushl  0x8(%ebp)
c0006f4f:	e8 8b fc ff ff       	call   c0006bdf <get_physical_address>
c0006f54:	83 c4 04             	add    $0x4,%esp
c0006f57:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f5d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006f63:	85 c0                	test   %eax,%eax
c0006f65:	0f 48 c2             	cmovs  %edx,%eax
c0006f68:	c1 f8 0c             	sar    $0xc,%eax
c0006f6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f71:	6a 00                	push   $0x0
c0006f73:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f76:	50                   	push   %eax
c0006f77:	e8 1f f8 ff ff       	call   c000679b <set_bit_val>
c0006f7c:	83 c4 0c             	add    $0xc,%esp
c0006f7f:	ff 75 08             	pushl  0x8(%ebp)
c0006f82:	e8 3e ff ff ff       	call   c0006ec5 <remove_map_entry>
c0006f87:	83 c4 04             	add    $0x4,%esp
c0006f8a:	90                   	nop
c0006f8b:	c9                   	leave  
c0006f8c:	c3                   	ret    

c0006f8d <sys_free>:
c0006f8d:	55                   	push   %ebp
c0006f8e:	89 e5                	mov    %esp,%ebp
c0006f90:	83 ec 48             	sub    $0x48,%esp
c0006f93:	e8 f9 a8 ff ff       	call   c0001891 <get_running_thread_pcb>
c0006f98:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006f9b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f9e:	8b 40 04             	mov    0x4(%eax),%eax
c0006fa1:	85 c0                	test   %eax,%eax
c0006fa3:	75 09                	jne    c0006fae <sys_free+0x21>
c0006fa5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006fac:	eb 07                	jmp    c0006fb5 <sys_free+0x28>
c0006fae:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006fb5:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0006fbc:	76 4d                	jbe    c000700b <sys_free+0x7e>
c0006fbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fc1:	83 e8 0c             	sub    $0xc,%eax
c0006fc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006fc7:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0006fcb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006fce:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006fd3:	c1 e8 0c             	shr    $0xc,%eax
c0006fd6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006fd9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006fe0:	eb 1c                	jmp    c0006ffe <sys_free+0x71>
c0006fe2:	83 ec 08             	sub    $0x8,%esp
c0006fe5:	ff 75 f4             	pushl  -0xc(%ebp)
c0006fe8:	ff 75 f0             	pushl  -0x10(%ebp)
c0006feb:	e8 f6 fe ff ff       	call   c0006ee6 <free_a_page>
c0006ff0:	83 c4 10             	add    $0x10,%esp
c0006ff3:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
c0006ffa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0006ffe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007001:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c0007004:	77 dc                	ja     c0006fe2 <sys_free+0x55>
c0007006:	e9 ef 00 00 00       	jmp    c00070fa <sys_free+0x16d>
c000700b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007012:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007019:	eb 24                	jmp    c000703f <sys_free+0xb2>
c000701b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000701e:	89 d0                	mov    %edx,%eax
c0007020:	01 c0                	add    %eax,%eax
c0007022:	01 d0                	add    %edx,%eax
c0007024:	c1 e0 03             	shl    $0x3,%eax
c0007027:	05 e0 31 08 c0       	add    $0xc00831e0,%eax
c000702c:	8b 00                	mov    (%eax),%eax
c000702e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0007031:	77 08                	ja     c000703b <sys_free+0xae>
c0007033:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007036:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007039:	eb 0a                	jmp    c0007045 <sys_free+0xb8>
c000703b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000703f:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007043:	7e d6                	jle    c000701b <sys_free+0x8e>
c0007045:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007048:	89 d0                	mov    %edx,%eax
c000704a:	01 c0                	add    %eax,%eax
c000704c:	01 d0                	add    %edx,%eax
c000704e:	c1 e0 03             	shl    $0x3,%eax
c0007051:	05 e0 31 08 c0       	add    $0xc00831e0,%eax
c0007056:	8b 10                	mov    (%eax),%edx
c0007058:	89 55 b8             	mov    %edx,-0x48(%ebp)
c000705b:	8b 50 04             	mov    0x4(%eax),%edx
c000705e:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0007061:	8b 50 08             	mov    0x8(%eax),%edx
c0007064:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007067:	8b 50 0c             	mov    0xc(%eax),%edx
c000706a:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c000706d:	8b 50 10             	mov    0x10(%eax),%edx
c0007070:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0007073:	8b 40 14             	mov    0x14(%eax),%eax
c0007076:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007079:	8b 45 08             	mov    0x8(%ebp),%eax
c000707c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000707f:	83 ec 0c             	sub    $0xc,%esp
c0007082:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007085:	e8 13 fc ff ff       	call   c0006c9d <block2arena>
c000708a:	83 c4 10             	add    $0x10,%esp
c000708d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007090:	83 ec 08             	sub    $0x8,%esp
c0007093:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007096:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0007099:	83 c0 08             	add    $0x8,%eax
c000709c:	50                   	push   %eax
c000709d:	e8 52 2e 00 00       	call   c0009ef4 <appendToDoubleLinkList>
c00070a2:	83 c4 10             	add    $0x10,%esp
c00070a5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070a8:	8b 40 04             	mov    0x4(%eax),%eax
c00070ab:	8d 50 01             	lea    0x1(%eax),%edx
c00070ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070b1:	89 50 04             	mov    %edx,0x4(%eax)
c00070b4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070b7:	8b 50 04             	mov    0x4(%eax),%edx
c00070ba:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00070bd:	39 c2                	cmp    %eax,%edx
c00070bf:	75 39                	jne    c00070fa <sys_free+0x16d>
c00070c1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00070c8:	eb 16                	jmp    c00070e0 <sys_free+0x153>
c00070ca:	83 ec 0c             	sub    $0xc,%esp
c00070cd:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00070d0:	83 c0 08             	add    $0x8,%eax
c00070d3:	50                   	push   %eax
c00070d4:	e8 a1 2e 00 00       	call   c0009f7a <popFromDoubleLinkList>
c00070d9:	83 c4 10             	add    $0x10,%esp
c00070dc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00070e0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00070e3:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c00070e6:	7c e2                	jl     c00070ca <sys_free+0x13d>
c00070e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070eb:	83 ec 08             	sub    $0x8,%esp
c00070ee:	ff 75 f4             	pushl  -0xc(%ebp)
c00070f1:	50                   	push   %eax
c00070f2:	e8 ef fd ff ff       	call   c0006ee6 <free_a_page>
c00070f7:	83 c4 10             	add    $0x10,%esp
c00070fa:	90                   	nop
c00070fb:	c9                   	leave  
c00070fc:	c3                   	ret    

c00070fd <init_memory_block_desc>:
c00070fd:	55                   	push   %ebp
c00070fe:	89 e5                	mov    %esp,%ebp
c0007100:	83 ec 18             	sub    $0x18,%esp
c0007103:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000710a:	e9 b2 00 00 00       	jmp    c00071c1 <init_memory_block_desc+0xc4>
c000710f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007113:	75 1b                	jne    c0007130 <init_memory_block_desc+0x33>
c0007115:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007118:	89 d0                	mov    %edx,%eax
c000711a:	01 c0                	add    %eax,%eax
c000711c:	01 d0                	add    %edx,%eax
c000711e:	c1 e0 03             	shl    $0x3,%eax
c0007121:	89 c2                	mov    %eax,%edx
c0007123:	8b 45 08             	mov    0x8(%ebp),%eax
c0007126:	01 d0                	add    %edx,%eax
c0007128:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000712e:	eb 2e                	jmp    c000715e <init_memory_block_desc+0x61>
c0007130:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007133:	89 d0                	mov    %edx,%eax
c0007135:	01 c0                	add    %eax,%eax
c0007137:	01 d0                	add    %edx,%eax
c0007139:	c1 e0 03             	shl    $0x3,%eax
c000713c:	8d 50 e8             	lea    -0x18(%eax),%edx
c000713f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007142:	01 d0                	add    %edx,%eax
c0007144:	8b 08                	mov    (%eax),%ecx
c0007146:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007149:	89 d0                	mov    %edx,%eax
c000714b:	01 c0                	add    %eax,%eax
c000714d:	01 d0                	add    %edx,%eax
c000714f:	c1 e0 03             	shl    $0x3,%eax
c0007152:	89 c2                	mov    %eax,%edx
c0007154:	8b 45 08             	mov    0x8(%ebp),%eax
c0007157:	01 d0                	add    %edx,%eax
c0007159:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c000715c:	89 10                	mov    %edx,(%eax)
c000715e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007161:	89 d0                	mov    %edx,%eax
c0007163:	01 c0                	add    %eax,%eax
c0007165:	01 d0                	add    %edx,%eax
c0007167:	c1 e0 03             	shl    $0x3,%eax
c000716a:	89 c2                	mov    %eax,%edx
c000716c:	8b 45 08             	mov    0x8(%ebp),%eax
c000716f:	01 d0                	add    %edx,%eax
c0007171:	8b 00                	mov    (%eax),%eax
c0007173:	89 c1                	mov    %eax,%ecx
c0007175:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c000717a:	ba 00 00 00 00       	mov    $0x0,%edx
c000717f:	f7 f1                	div    %ecx
c0007181:	89 c1                	mov    %eax,%ecx
c0007183:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007186:	89 d0                	mov    %edx,%eax
c0007188:	01 c0                	add    %eax,%eax
c000718a:	01 d0                	add    %edx,%eax
c000718c:	c1 e0 03             	shl    $0x3,%eax
c000718f:	89 c2                	mov    %eax,%edx
c0007191:	8b 45 08             	mov    0x8(%ebp),%eax
c0007194:	01 d0                	add    %edx,%eax
c0007196:	89 ca                	mov    %ecx,%edx
c0007198:	89 50 04             	mov    %edx,0x4(%eax)
c000719b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000719e:	89 d0                	mov    %edx,%eax
c00071a0:	01 c0                	add    %eax,%eax
c00071a2:	01 d0                	add    %edx,%eax
c00071a4:	c1 e0 03             	shl    $0x3,%eax
c00071a7:	89 c2                	mov    %eax,%edx
c00071a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00071ac:	01 d0                	add    %edx,%eax
c00071ae:	83 c0 08             	add    $0x8,%eax
c00071b1:	83 ec 0c             	sub    $0xc,%esp
c00071b4:	50                   	push   %eax
c00071b5:	e8 eb 2c 00 00       	call   c0009ea5 <initDoubleLinkList>
c00071ba:	83 c4 10             	add    $0x10,%esp
c00071bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00071c1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00071c5:	0f 8e 44 ff ff ff    	jle    c000710f <init_memory_block_desc+0x12>
c00071cb:	90                   	nop
c00071cc:	c9                   	leave  
c00071cd:	c3                   	ret    

c00071ce <init_memory2>:
c00071ce:	55                   	push   %ebp
c00071cf:	89 e5                	mov    %esp,%ebp
c00071d1:	83 ec 38             	sub    $0x38,%esp
c00071d4:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00071db:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00071e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00071e5:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00071ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00071ed:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00071f2:	29 c2                	sub    %eax,%edx
c00071f4:	89 d0                	mov    %edx,%eax
c00071f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00071f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00071fc:	89 c2                	mov    %eax,%edx
c00071fe:	c1 ea 1f             	shr    $0x1f,%edx
c0007201:	01 d0                	add    %edx,%eax
c0007203:	d1 f8                	sar    %eax
c0007205:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c000720a:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000720f:	83 ec 0c             	sub    $0xc,%esp
c0007212:	50                   	push   %eax
c0007213:	e8 0f 06 00 00       	call   c0007827 <disp_int>
c0007218:	83 c4 10             	add    $0x10,%esp
c000721b:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007220:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007223:	29 c2                	sub    %eax,%edx
c0007225:	89 d0                	mov    %edx,%eax
c0007227:	a3 f0 1e 01 c0       	mov    %eax,0xc0011ef0
c000722c:	83 ec 0c             	sub    $0xc,%esp
c000722f:	68 6b a5 00 c0       	push   $0xc000a56b
c0007234:	e8 53 a3 ff ff       	call   c000158c <disp_str>
c0007239:	83 c4 10             	add    $0x10,%esp
c000723c:	a1 f0 1e 01 c0       	mov    0xc0011ef0,%eax
c0007241:	83 ec 0c             	sub    $0xc,%esp
c0007244:	50                   	push   %eax
c0007245:	e8 dd 05 00 00       	call   c0007827 <disp_int>
c000724a:	83 c4 10             	add    $0x10,%esp
c000724d:	83 ec 0c             	sub    $0xc,%esp
c0007250:	68 6b a5 00 c0       	push   $0xc000a56b
c0007255:	e8 32 a3 ff ff       	call   c000158c <disp_str>
c000725a:	83 c4 10             	add    $0x10,%esp
c000725d:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007262:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007267:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000726d:	85 c0                	test   %eax,%eax
c000726f:	0f 48 c2             	cmovs  %edx,%eax
c0007272:	c1 f8 0c             	sar    $0xc,%eax
c0007275:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007278:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000727b:	83 c0 07             	add    $0x7,%eax
c000727e:	8d 50 07             	lea    0x7(%eax),%edx
c0007281:	85 c0                	test   %eax,%eax
c0007283:	0f 48 c2             	cmovs  %edx,%eax
c0007286:	c1 f8 03             	sar    $0x3,%eax
c0007289:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c000728e:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007293:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007298:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c000729d:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00072a3:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00072a8:	83 ec 04             	sub    $0x4,%esp
c00072ab:	52                   	push   %edx
c00072ac:	6a 00                	push   $0x0
c00072ae:	50                   	push   %eax
c00072af:	e8 23 3a 00 00       	call   c000acd7 <Memset>
c00072b4:	83 c4 10             	add    $0x10,%esp
c00072b7:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c00072bc:	05 ff 0f 00 00       	add    $0xfff,%eax
c00072c1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00072c7:	85 c0                	test   %eax,%eax
c00072c9:	0f 48 c2             	cmovs  %edx,%eax
c00072cc:	c1 f8 0c             	sar    $0xc,%eax
c00072cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00072d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00072d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00072d8:	ff 75 e8             	pushl  -0x18(%ebp)
c00072db:	6a 01                	push   $0x1
c00072dd:	6a 00                	push   $0x0
c00072df:	68 ac 16 01 c0       	push   $0xc00116ac
c00072e4:	e8 2d f5 ff ff       	call   c0006816 <set_bits>
c00072e9:	83 c4 10             	add    $0x10,%esp
c00072ec:	a1 f0 1e 01 c0       	mov    0xc0011ef0,%eax
c00072f1:	05 ff 0f 00 00       	add    $0xfff,%eax
c00072f6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00072fc:	85 c0                	test   %eax,%eax
c00072fe:	0f 48 c2             	cmovs  %edx,%eax
c0007301:	c1 f8 0c             	sar    $0xc,%eax
c0007304:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007307:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000730a:	83 c0 07             	add    $0x7,%eax
c000730d:	8d 50 07             	lea    0x7(%eax),%edx
c0007310:	85 c0                	test   %eax,%eax
c0007312:	0f 48 c2             	cmovs  %edx,%eax
c0007315:	c1 f8 03             	sar    $0x3,%eax
c0007318:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c000731d:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007322:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007328:	01 d0                	add    %edx,%eax
c000732a:	a3 e4 1e 01 c0       	mov    %eax,0xc0011ee4
c000732f:	8b 15 e8 1e 01 c0    	mov    0xc0011ee8,%edx
c0007335:	a1 e4 1e 01 c0       	mov    0xc0011ee4,%eax
c000733a:	83 ec 04             	sub    $0x4,%esp
c000733d:	52                   	push   %edx
c000733e:	6a 00                	push   $0x0
c0007340:	50                   	push   %eax
c0007341:	e8 91 39 00 00       	call   c000acd7 <Memset>
c0007346:	83 c4 10             	add    $0x10,%esp
c0007349:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000734e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007353:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007359:	85 c0                	test   %eax,%eax
c000735b:	0f 48 c2             	cmovs  %edx,%eax
c000735e:	c1 f8 0c             	sar    $0xc,%eax
c0007361:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007364:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007367:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000736a:	ff 75 e8             	pushl  -0x18(%ebp)
c000736d:	6a 01                	push   $0x1
c000736f:	ff 75 e0             	pushl  -0x20(%ebp)
c0007372:	68 ac 16 01 c0       	push   $0xc00116ac
c0007377:	e8 9a f4 ff ff       	call   c0006816 <set_bits>
c000737c:	83 c4 10             	add    $0x10,%esp
c000737f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0007386:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007389:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000738c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000738f:	83 c0 07             	add    $0x7,%eax
c0007392:	8d 50 07             	lea    0x7(%eax),%edx
c0007395:	85 c0                	test   %eax,%eax
c0007397:	0f 48 c2             	cmovs  %edx,%eax
c000739a:	c1 f8 03             	sar    $0x3,%eax
c000739d:	a3 58 f7 00 c0       	mov    %eax,0xc000f758
c00073a2:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00073a7:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00073ad:	01 c2                	add    %eax,%edx
c00073af:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00073b4:	01 d0                	add    %edx,%eax
c00073b6:	a3 54 f7 00 c0       	mov    %eax,0xc000f754
c00073bb:	8b 15 58 f7 00 c0    	mov    0xc000f758,%edx
c00073c1:	a1 54 f7 00 c0       	mov    0xc000f754,%eax
c00073c6:	83 ec 04             	sub    $0x4,%esp
c00073c9:	52                   	push   %edx
c00073ca:	6a 00                	push   $0x0
c00073cc:	50                   	push   %eax
c00073cd:	e8 05 39 00 00       	call   c000acd7 <Memset>
c00073d2:	83 c4 10             	add    $0x10,%esp
c00073d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00073d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00073db:	01 d0                	add    %edx,%eax
c00073dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00073e0:	a1 58 f7 00 c0       	mov    0xc000f758,%eax
c00073e5:	05 ff 0f 00 00       	add    $0xfff,%eax
c00073ea:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00073f0:	85 c0                	test   %eax,%eax
c00073f2:	0f 48 c2             	cmovs  %edx,%eax
c00073f5:	c1 f8 0c             	sar    $0xc,%eax
c00073f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00073fb:	ff 75 e8             	pushl  -0x18(%ebp)
c00073fe:	6a 01                	push   $0x1
c0007400:	ff 75 e0             	pushl  -0x20(%ebp)
c0007403:	68 ac 16 01 c0       	push   $0xc00116ac
c0007408:	e8 09 f4 ff ff       	call   c0006816 <set_bits>
c000740d:	83 c4 10             	add    $0x10,%esp
c0007410:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007413:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007416:	01 d0                	add    %edx,%eax
c0007418:	c1 e0 0c             	shl    $0xc,%eax
c000741b:	a3 5c f7 00 c0       	mov    %eax,0xc000f75c
c0007420:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007423:	83 c0 02             	add    $0x2,%eax
c0007426:	c1 e0 0c             	shl    $0xc,%eax
c0007429:	89 c2                	mov    %eax,%edx
c000742b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000742e:	01 d0                	add    %edx,%eax
c0007430:	a3 5c f7 00 c0       	mov    %eax,0xc000f75c
c0007435:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c000743c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000743f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007442:	90                   	nop
c0007443:	c9                   	leave  
c0007444:	c3                   	ret    

c0007445 <init_memory>:
c0007445:	55                   	push   %ebp
c0007446:	89 e5                	mov    %esp,%ebp
c0007448:	83 ec 38             	sub    $0x38,%esp
c000744b:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007452:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007459:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007460:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007463:	05 00 00 10 00       	add    $0x100000,%eax
c0007468:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000746b:	8b 45 08             	mov    0x8(%ebp),%eax
c000746e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0007471:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007477:	85 c0                	test   %eax,%eax
c0007479:	0f 48 c2             	cmovs  %edx,%eax
c000747c:	c1 f8 0c             	sar    $0xc,%eax
c000747f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007482:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007485:	89 c2                	mov    %eax,%edx
c0007487:	c1 ea 1f             	shr    $0x1f,%edx
c000748a:	01 d0                	add    %edx,%eax
c000748c:	d1 f8                	sar    %eax
c000748e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007491:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007494:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007497:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000749a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000749d:	8d 50 07             	lea    0x7(%eax),%edx
c00074a0:	85 c0                	test   %eax,%eax
c00074a2:	0f 48 c2             	cmovs  %edx,%eax
c00074a5:	c1 f8 03             	sar    $0x3,%eax
c00074a8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00074ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00074ae:	8d 50 07             	lea    0x7(%eax),%edx
c00074b1:	85 c0                	test   %eax,%eax
c00074b3:	0f 48 c2             	cmovs  %edx,%eax
c00074b6:	c1 f8 03             	sar    $0x3,%eax
c00074b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00074bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00074bf:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00074c4:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00074c9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00074cc:	c1 e2 0c             	shl    $0xc,%edx
c00074cf:	01 d0                	add    %edx,%eax
c00074d1:	a3 ec 1e 01 c0       	mov    %eax,0xc0011eec
c00074d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00074d9:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c00074de:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00074e1:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00074e6:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00074eb:	83 ec 04             	sub    $0x4,%esp
c00074ee:	ff 75 d8             	pushl  -0x28(%ebp)
c00074f1:	6a 00                	push   $0x0
c00074f3:	50                   	push   %eax
c00074f4:	e8 de 37 00 00       	call   c000acd7 <Memset>
c00074f9:	83 c4 10             	add    $0x10,%esp
c00074fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00074ff:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007502:	01 d0                	add    %edx,%eax
c0007504:	a3 e4 1e 01 c0       	mov    %eax,0xc0011ee4
c0007509:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000750c:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c0007511:	a1 e4 1e 01 c0       	mov    0xc0011ee4,%eax
c0007516:	83 ec 04             	sub    $0x4,%esp
c0007519:	ff 75 d4             	pushl  -0x2c(%ebp)
c000751c:	6a 00                	push   $0x0
c000751e:	50                   	push   %eax
c000751f:	e8 b3 37 00 00       	call   c000acd7 <Memset>
c0007524:	83 c4 10             	add    $0x10,%esp
c0007527:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000752a:	a3 58 f7 00 c0       	mov    %eax,0xc000f758
c000752f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007532:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007535:	01 c2                	add    %eax,%edx
c0007537:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000753a:	01 d0                	add    %edx,%eax
c000753c:	a3 54 f7 00 c0       	mov    %eax,0xc000f754
c0007541:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007544:	05 00 00 10 00       	add    $0x100000,%eax
c0007549:	a3 5c f7 00 c0       	mov    %eax,0xc000f75c
c000754e:	a1 54 f7 00 c0       	mov    0xc000f754,%eax
c0007553:	83 ec 04             	sub    $0x4,%esp
c0007556:	ff 75 d8             	pushl  -0x28(%ebp)
c0007559:	6a 00                	push   $0x0
c000755b:	50                   	push   %eax
c000755c:	e8 76 37 00 00       	call   c000acd7 <Memset>
c0007561:	83 c4 10             	add    $0x10,%esp
c0007564:	83 ec 0c             	sub    $0xc,%esp
c0007567:	68 e0 31 08 c0       	push   $0xc00831e0
c000756c:	e8 8c fb ff ff       	call   c00070fd <init_memory_block_desc>
c0007571:	83 c4 10             	add    $0x10,%esp
c0007574:	90                   	nop
c0007575:	c9                   	leave  
c0007576:	c3                   	ret    

c0007577 <untar>:
c0007577:	55                   	push   %ebp
c0007578:	89 e5                	mov    %esp,%ebp
c000757a:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c0007580:	83 ec 08             	sub    $0x8,%esp
c0007583:	6a 00                	push   $0x0
c0007585:	ff 75 08             	pushl  0x8(%ebp)
c0007588:	e8 88 e5 ff ff       	call   c0005b15 <open>
c000758d:	83 c4 10             	add    $0x10,%esp
c0007590:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007593:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000759a:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00075a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00075a8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00075af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00075b3:	7e 58                	jle    c000760d <untar+0x96>
c00075b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00075b8:	05 ff 01 00 00       	add    $0x1ff,%eax
c00075bd:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00075c3:	85 c0                	test   %eax,%eax
c00075c5:	0f 48 c2             	cmovs  %edx,%eax
c00075c8:	c1 f8 09             	sar    $0x9,%eax
c00075cb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00075ce:	83 ec 04             	sub    $0x4,%esp
c00075d1:	68 00 20 00 00       	push   $0x2000
c00075d6:	6a 00                	push   $0x0
c00075d8:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00075de:	50                   	push   %eax
c00075df:	e8 f3 36 00 00       	call   c000acd7 <Memset>
c00075e4:	83 c4 10             	add    $0x10,%esp
c00075e7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00075ea:	c1 e0 09             	shl    $0x9,%eax
c00075ed:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00075f0:	83 ec 04             	sub    $0x4,%esp
c00075f3:	50                   	push   %eax
c00075f4:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00075fa:	50                   	push   %eax
c00075fb:	ff 75 e4             	pushl  -0x1c(%ebp)
c00075fe:	e8 86 e5 ff ff       	call   c0005b89 <read>
c0007603:	83 c4 10             	add    $0x10,%esp
c0007606:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000760d:	83 ec 04             	sub    $0x4,%esp
c0007610:	68 00 20 00 00       	push   $0x2000
c0007615:	6a 00                	push   $0x0
c0007617:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000761d:	50                   	push   %eax
c000761e:	e8 b4 36 00 00       	call   c000acd7 <Memset>
c0007623:	83 c4 10             	add    $0x10,%esp
c0007626:	83 ec 04             	sub    $0x4,%esp
c0007629:	68 00 02 00 00       	push   $0x200
c000762e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007634:	50                   	push   %eax
c0007635:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007638:	e8 4c e5 ff ff       	call   c0005b89 <read>
c000763d:	83 c4 10             	add    $0x10,%esp
c0007640:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007643:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007647:	0f 84 1f 01 00 00    	je     c000776c <untar+0x1f5>
c000764d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007650:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007653:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000765a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007660:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007663:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007666:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007669:	83 ec 08             	sub    $0x8,%esp
c000766c:	6a 07                	push   $0x7
c000766e:	ff 75 cc             	pushl  -0x34(%ebp)
c0007671:	e8 9f e4 ff ff       	call   c0005b15 <open>
c0007676:	83 c4 10             	add    $0x10,%esp
c0007679:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000767c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007683:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007686:	83 c0 7c             	add    $0x7c,%eax
c0007689:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000768c:	83 ec 0c             	sub    $0xc,%esp
c000768f:	ff 75 cc             	pushl  -0x34(%ebp)
c0007692:	e8 79 36 00 00       	call   c000ad10 <Strlen>
c0007697:	83 c4 10             	add    $0x10,%esp
c000769a:	85 c0                	test   %eax,%eax
c000769c:	75 16                	jne    c00076b4 <untar+0x13d>
c000769e:	83 ec 0c             	sub    $0xc,%esp
c00076a1:	ff 75 c4             	pushl  -0x3c(%ebp)
c00076a4:	e8 67 36 00 00       	call   c000ad10 <Strlen>
c00076a9:	83 c4 10             	add    $0x10,%esp
c00076ac:	85 c0                	test   %eax,%eax
c00076ae:	0f 84 bb 00 00 00    	je     c000776f <untar+0x1f8>
c00076b4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00076b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00076ba:	eb 1f                	jmp    c00076db <untar+0x164>
c00076bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00076bf:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00076c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00076c9:	0f b6 00             	movzbl (%eax),%eax
c00076cc:	0f be c0             	movsbl %al,%eax
c00076cf:	83 e8 30             	sub    $0x30,%eax
c00076d2:	01 d0                	add    %edx,%eax
c00076d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00076d7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00076db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00076de:	0f b6 00             	movzbl (%eax),%eax
c00076e1:	84 c0                	test   %al,%al
c00076e3:	75 d7                	jne    c00076bc <untar+0x145>
c00076e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00076e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00076eb:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c00076f2:	eb 5f                	jmp    c0007753 <untar+0x1dc>
c00076f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00076f7:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c00076fa:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c00076fe:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007701:	83 ec 04             	sub    $0x4,%esp
c0007704:	68 00 02 00 00       	push   $0x200
c0007709:	6a 00                	push   $0x0
c000770b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007711:	50                   	push   %eax
c0007712:	e8 c0 35 00 00       	call   c000acd7 <Memset>
c0007717:	83 c4 10             	add    $0x10,%esp
c000771a:	83 ec 04             	sub    $0x4,%esp
c000771d:	ff 75 bc             	pushl  -0x44(%ebp)
c0007720:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007726:	50                   	push   %eax
c0007727:	ff 75 e4             	pushl  -0x1c(%ebp)
c000772a:	e8 5a e4 ff ff       	call   c0005b89 <read>
c000772f:	83 c4 10             	add    $0x10,%esp
c0007732:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007735:	83 ec 04             	sub    $0x4,%esp
c0007738:	ff 75 bc             	pushl  -0x44(%ebp)
c000773b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007741:	50                   	push   %eax
c0007742:	ff 75 c8             	pushl  -0x38(%ebp)
c0007745:	e8 76 e4 ff ff       	call   c0005bc0 <write>
c000774a:	83 c4 10             	add    $0x10,%esp
c000774d:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007750:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0007753:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007757:	75 9b                	jne    c00076f4 <untar+0x17d>
c0007759:	83 ec 0c             	sub    $0xc,%esp
c000775c:	ff 75 c8             	pushl  -0x38(%ebp)
c000775f:	e8 b1 e4 ff ff       	call   c0005c15 <close>
c0007764:	83 c4 10             	add    $0x10,%esp
c0007767:	e9 43 fe ff ff       	jmp    c00075af <untar+0x38>
c000776c:	90                   	nop
c000776d:	eb 01                	jmp    c0007770 <untar+0x1f9>
c000776f:	90                   	nop
c0007770:	83 ec 0c             	sub    $0xc,%esp
c0007773:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007776:	e8 9a e4 ff ff       	call   c0005c15 <close>
c000777b:	83 c4 10             	add    $0x10,%esp
c000777e:	90                   	nop
c000777f:	c9                   	leave  
c0007780:	c3                   	ret    

c0007781 <atoi>:
c0007781:	55                   	push   %ebp
c0007782:	89 e5                	mov    %esp,%ebp
c0007784:	83 ec 10             	sub    $0x10,%esp
c0007787:	8b 45 08             	mov    0x8(%ebp),%eax
c000778a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000778d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007790:	8d 50 01             	lea    0x1(%eax),%edx
c0007793:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007796:	c6 00 30             	movb   $0x30,(%eax)
c0007799:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000779c:	8d 50 01             	lea    0x1(%eax),%edx
c000779f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00077a2:	c6 00 78             	movb   $0x78,(%eax)
c00077a5:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00077a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00077ad:	75 0e                	jne    c00077bd <atoi+0x3c>
c00077af:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00077b2:	8d 50 01             	lea    0x1(%eax),%edx
c00077b5:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00077b8:	c6 00 30             	movb   $0x30,(%eax)
c00077bb:	eb 61                	jmp    c000781e <atoi+0x9d>
c00077bd:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00077c4:	eb 52                	jmp    c0007818 <atoi+0x97>
c00077c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00077c9:	8b 55 0c             	mov    0xc(%ebp),%edx
c00077cc:	89 c1                	mov    %eax,%ecx
c00077ce:	d3 fa                	sar    %cl,%edx
c00077d0:	89 d0                	mov    %edx,%eax
c00077d2:	83 e0 0f             	and    $0xf,%eax
c00077d5:	88 45 fb             	mov    %al,-0x5(%ebp)
c00077d8:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c00077dc:	75 06                	jne    c00077e4 <atoi+0x63>
c00077de:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c00077e2:	74 2f                	je     c0007813 <atoi+0x92>
c00077e4:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c00077e8:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c00077ec:	83 c0 30             	add    $0x30,%eax
c00077ef:	88 45 fb             	mov    %al,-0x5(%ebp)
c00077f2:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c00077f6:	7e 0a                	jle    c0007802 <atoi+0x81>
c00077f8:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c00077fc:	83 c0 07             	add    $0x7,%eax
c00077ff:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007802:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007805:	8d 50 01             	lea    0x1(%eax),%edx
c0007808:	89 55 fc             	mov    %edx,-0x4(%ebp)
c000780b:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c000780f:	88 10                	mov    %dl,(%eax)
c0007811:	eb 01                	jmp    c0007814 <atoi+0x93>
c0007813:	90                   	nop
c0007814:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007818:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000781c:	79 a8                	jns    c00077c6 <atoi+0x45>
c000781e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007821:	c6 00 00             	movb   $0x0,(%eax)
c0007824:	90                   	nop
c0007825:	c9                   	leave  
c0007826:	c3                   	ret    

c0007827 <disp_int>:
c0007827:	55                   	push   %ebp
c0007828:	89 e5                	mov    %esp,%ebp
c000782a:	83 ec 18             	sub    $0x18,%esp
c000782d:	ff 75 08             	pushl  0x8(%ebp)
c0007830:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007833:	50                   	push   %eax
c0007834:	e8 48 ff ff ff       	call   c0007781 <atoi>
c0007839:	83 c4 08             	add    $0x8,%esp
c000783c:	83 ec 08             	sub    $0x8,%esp
c000783f:	6a 0b                	push   $0xb
c0007841:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007844:	50                   	push   %eax
c0007845:	e8 7d 9d ff ff       	call   c00015c7 <disp_str_colour>
c000784a:	83 c4 10             	add    $0x10,%esp
c000784d:	90                   	nop
c000784e:	c9                   	leave  
c000784f:	c3                   	ret    

c0007850 <do_page_fault>:
c0007850:	55                   	push   %ebp
c0007851:	89 e5                	mov    %esp,%ebp
c0007853:	83 ec 28             	sub    $0x28,%esp
c0007856:	0f 20 d0             	mov    %cr2,%eax
c0007859:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000785c:	83 ec 0c             	sub    $0xc,%esp
c000785f:	68 80 a5 00 c0       	push   $0xc000a580
c0007864:	e8 23 9d ff ff       	call   c000158c <disp_str>
c0007869:	83 c4 10             	add    $0x10,%esp
c000786c:	83 ec 0c             	sub    $0xc,%esp
c000786f:	68 8f a5 00 c0       	push   $0xc000a58f
c0007874:	e8 13 9d ff ff       	call   c000158c <disp_str>
c0007879:	83 c4 10             	add    $0x10,%esp
c000787c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000787f:	83 ec 0c             	sub    $0xc,%esp
c0007882:	50                   	push   %eax
c0007883:	e8 9f ff ff ff       	call   c0007827 <disp_int>
c0007888:	83 c4 10             	add    $0x10,%esp
c000788b:	83 ec 0c             	sub    $0xc,%esp
c000788e:	68 94 a5 00 c0       	push   $0xc000a594
c0007893:	e8 f4 9c ff ff       	call   c000158c <disp_str>
c0007898:	83 c4 10             	add    $0x10,%esp
c000789b:	83 ec 0c             	sub    $0xc,%esp
c000789e:	ff 75 f4             	pushl  -0xc(%ebp)
c00078a1:	e8 04 f2 ff ff       	call   c0006aaa <ptr_pde>
c00078a6:	83 c4 10             	add    $0x10,%esp
c00078a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00078ac:	83 ec 0c             	sub    $0xc,%esp
c00078af:	ff 75 f4             	pushl  -0xc(%ebp)
c00078b2:	e8 06 f2 ff ff       	call   c0006abd <ptr_pte>
c00078b7:	83 c4 10             	add    $0x10,%esp
c00078ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078bd:	83 ec 0c             	sub    $0xc,%esp
c00078c0:	68 96 a5 00 c0       	push   $0xc000a596
c00078c5:	e8 c2 9c ff ff       	call   c000158c <disp_str>
c00078ca:	83 c4 10             	add    $0x10,%esp
c00078cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00078d0:	83 ec 0c             	sub    $0xc,%esp
c00078d3:	50                   	push   %eax
c00078d4:	e8 4e ff ff ff       	call   c0007827 <disp_int>
c00078d9:	83 c4 10             	add    $0x10,%esp
c00078dc:	83 ec 0c             	sub    $0xc,%esp
c00078df:	68 9b a5 00 c0       	push   $0xc000a59b
c00078e4:	e8 a3 9c ff ff       	call   c000158c <disp_str>
c00078e9:	83 c4 10             	add    $0x10,%esp
c00078ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00078ef:	8b 00                	mov    (%eax),%eax
c00078f1:	83 ec 0c             	sub    $0xc,%esp
c00078f4:	50                   	push   %eax
c00078f5:	e8 2d ff ff ff       	call   c0007827 <disp_int>
c00078fa:	83 c4 10             	add    $0x10,%esp
c00078fd:	83 ec 0c             	sub    $0xc,%esp
c0007900:	68 94 a5 00 c0       	push   $0xc000a594
c0007905:	e8 82 9c ff ff       	call   c000158c <disp_str>
c000790a:	83 c4 10             	add    $0x10,%esp
c000790d:	83 ec 0c             	sub    $0xc,%esp
c0007910:	68 a4 a5 00 c0       	push   $0xc000a5a4
c0007915:	e8 72 9c ff ff       	call   c000158c <disp_str>
c000791a:	83 c4 10             	add    $0x10,%esp
c000791d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007920:	83 ec 0c             	sub    $0xc,%esp
c0007923:	50                   	push   %eax
c0007924:	e8 fe fe ff ff       	call   c0007827 <disp_int>
c0007929:	83 c4 10             	add    $0x10,%esp
c000792c:	83 ec 0c             	sub    $0xc,%esp
c000792f:	68 a9 a5 00 c0       	push   $0xc000a5a9
c0007934:	e8 53 9c ff ff       	call   c000158c <disp_str>
c0007939:	83 c4 10             	add    $0x10,%esp
c000793c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000793f:	8b 00                	mov    (%eax),%eax
c0007941:	83 ec 0c             	sub    $0xc,%esp
c0007944:	50                   	push   %eax
c0007945:	e8 dd fe ff ff       	call   c0007827 <disp_int>
c000794a:	83 c4 10             	add    $0x10,%esp
c000794d:	83 ec 0c             	sub    $0xc,%esp
c0007950:	68 94 a5 00 c0       	push   $0xc000a594
c0007955:	e8 32 9c ff ff       	call   c000158c <disp_str>
c000795a:	83 c4 10             	add    $0x10,%esp
c000795d:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007964:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007967:	8b 00                	mov    (%eax),%eax
c0007969:	83 e0 01             	and    $0x1,%eax
c000796c:	85 c0                	test   %eax,%eax
c000796e:	74 09                	je     c0007979 <do_page_fault+0x129>
c0007970:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007977:	eb 07                	jmp    c0007980 <do_page_fault+0x130>
c0007979:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007980:	90                   	nop
c0007981:	c9                   	leave  
c0007982:	c3                   	ret    

c0007983 <exception_handler>:
c0007983:	55                   	push   %ebp
c0007984:	89 e5                	mov    %esp,%ebp
c0007986:	57                   	push   %edi
c0007987:	56                   	push   %esi
c0007988:	53                   	push   %ebx
c0007989:	83 ec 6c             	sub    $0x6c,%esp
c000798c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000798f:	bb 20 a8 00 c0       	mov    $0xc000a820,%ebx
c0007994:	ba 13 00 00 00       	mov    $0x13,%edx
c0007999:	89 c7                	mov    %eax,%edi
c000799b:	89 de                	mov    %ebx,%esi
c000799d:	89 d1                	mov    %edx,%ecx
c000799f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00079a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00079a8:	eb 04                	jmp    c00079ae <exception_handler+0x2b>
c00079aa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00079ae:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c00079b5:	7e f3                	jle    c00079aa <exception_handler+0x27>
c00079b7:	83 ec 0c             	sub    $0xc,%esp
c00079ba:	68 b2 a5 00 c0       	push   $0xc000a5b2
c00079bf:	e8 c8 9b ff ff       	call   c000158c <disp_str>
c00079c4:	83 c4 10             	add    $0x10,%esp
c00079c7:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c00079ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00079d1:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c00079d5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00079d8:	83 ec 0c             	sub    $0xc,%esp
c00079db:	ff 75 dc             	pushl  -0x24(%ebp)
c00079de:	e8 a9 9b ff ff       	call   c000158c <disp_str>
c00079e3:	83 c4 10             	add    $0x10,%esp
c00079e6:	83 ec 0c             	sub    $0xc,%esp
c00079e9:	68 c0 a5 00 c0       	push   $0xc000a5c0
c00079ee:	e8 99 9b ff ff       	call   c000158c <disp_str>
c00079f3:	83 c4 10             	add    $0x10,%esp
c00079f6:	83 ec 0c             	sub    $0xc,%esp
c00079f9:	68 c3 a5 00 c0       	push   $0xc000a5c3
c00079fe:	e8 89 9b ff ff       	call   c000158c <disp_str>
c0007a03:	83 c4 10             	add    $0x10,%esp
c0007a06:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a09:	83 ec 0c             	sub    $0xc,%esp
c0007a0c:	50                   	push   %eax
c0007a0d:	e8 15 fe ff ff       	call   c0007827 <disp_int>
c0007a12:	83 c4 10             	add    $0x10,%esp
c0007a15:	83 ec 0c             	sub    $0xc,%esp
c0007a18:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007a1d:	e8 6a 9b ff ff       	call   c000158c <disp_str>
c0007a22:	83 c4 10             	add    $0x10,%esp
c0007a25:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007a29:	74 2f                	je     c0007a5a <exception_handler+0xd7>
c0007a2b:	83 ec 0c             	sub    $0xc,%esp
c0007a2e:	68 cb a5 00 c0       	push   $0xc000a5cb
c0007a33:	e8 54 9b ff ff       	call   c000158c <disp_str>
c0007a38:	83 c4 10             	add    $0x10,%esp
c0007a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a3e:	83 ec 0c             	sub    $0xc,%esp
c0007a41:	50                   	push   %eax
c0007a42:	e8 e0 fd ff ff       	call   c0007827 <disp_int>
c0007a47:	83 c4 10             	add    $0x10,%esp
c0007a4a:	83 ec 0c             	sub    $0xc,%esp
c0007a4d:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007a52:	e8 35 9b ff ff       	call   c000158c <disp_str>
c0007a57:	83 c4 10             	add    $0x10,%esp
c0007a5a:	83 ec 0c             	sub    $0xc,%esp
c0007a5d:	68 d5 a5 00 c0       	push   $0xc000a5d5
c0007a62:	e8 25 9b ff ff       	call   c000158c <disp_str>
c0007a67:	83 c4 10             	add    $0x10,%esp
c0007a6a:	83 ec 0c             	sub    $0xc,%esp
c0007a6d:	ff 75 14             	pushl  0x14(%ebp)
c0007a70:	e8 b2 fd ff ff       	call   c0007827 <disp_int>
c0007a75:	83 c4 10             	add    $0x10,%esp
c0007a78:	83 ec 0c             	sub    $0xc,%esp
c0007a7b:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007a80:	e8 07 9b ff ff       	call   c000158c <disp_str>
c0007a85:	83 c4 10             	add    $0x10,%esp
c0007a88:	83 ec 0c             	sub    $0xc,%esp
c0007a8b:	68 d9 a5 00 c0       	push   $0xc000a5d9
c0007a90:	e8 f7 9a ff ff       	call   c000158c <disp_str>
c0007a95:	83 c4 10             	add    $0x10,%esp
c0007a98:	8b 45 10             	mov    0x10(%ebp),%eax
c0007a9b:	83 ec 0c             	sub    $0xc,%esp
c0007a9e:	50                   	push   %eax
c0007a9f:	e8 83 fd ff ff       	call   c0007827 <disp_int>
c0007aa4:	83 c4 10             	add    $0x10,%esp
c0007aa7:	83 ec 0c             	sub    $0xc,%esp
c0007aaa:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007aaf:	e8 d8 9a ff ff       	call   c000158c <disp_str>
c0007ab4:	83 c4 10             	add    $0x10,%esp
c0007ab7:	83 ec 0c             	sub    $0xc,%esp
c0007aba:	68 de a5 00 c0       	push   $0xc000a5de
c0007abf:	e8 c8 9a ff ff       	call   c000158c <disp_str>
c0007ac4:	83 c4 10             	add    $0x10,%esp
c0007ac7:	83 ec 0c             	sub    $0xc,%esp
c0007aca:	ff 75 18             	pushl  0x18(%ebp)
c0007acd:	e8 55 fd ff ff       	call   c0007827 <disp_int>
c0007ad2:	83 c4 10             	add    $0x10,%esp
c0007ad5:	83 ec 0c             	sub    $0xc,%esp
c0007ad8:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007add:	e8 aa 9a ff ff       	call   c000158c <disp_str>
c0007ae2:	83 c4 10             	add    $0x10,%esp
c0007ae5:	83 ec 0c             	sub    $0xc,%esp
c0007ae8:	68 e8 a5 00 c0       	push   $0xc000a5e8
c0007aed:	e8 9a 9a ff ff       	call   c000158c <disp_str>
c0007af2:	83 c4 10             	add    $0x10,%esp
c0007af5:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0007af9:	75 46                	jne    c0007b41 <exception_handler+0x1be>
c0007afb:	0f 20 d0             	mov    %cr2,%eax
c0007afe:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007b01:	83 ec 0c             	sub    $0xc,%esp
c0007b04:	68 07 a6 00 c0       	push   $0xc000a607
c0007b09:	e8 7e 9a ff ff       	call   c000158c <disp_str>
c0007b0e:	83 c4 10             	add    $0x10,%esp
c0007b11:	83 ec 0c             	sub    $0xc,%esp
c0007b14:	68 8f a5 00 c0       	push   $0xc000a58f
c0007b19:	e8 6e 9a ff ff       	call   c000158c <disp_str>
c0007b1e:	83 c4 10             	add    $0x10,%esp
c0007b21:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b24:	83 ec 0c             	sub    $0xc,%esp
c0007b27:	50                   	push   %eax
c0007b28:	e8 fa fc ff ff       	call   c0007827 <disp_int>
c0007b2d:	83 c4 10             	add    $0x10,%esp
c0007b30:	83 ec 0c             	sub    $0xc,%esp
c0007b33:	68 94 a5 00 c0       	push   $0xc000a594
c0007b38:	e8 4f 9a ff ff       	call   c000158c <disp_str>
c0007b3d:	83 c4 10             	add    $0x10,%esp
c0007b40:	90                   	nop
c0007b41:	90                   	nop
c0007b42:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007b45:	5b                   	pop    %ebx
c0007b46:	5e                   	pop    %esi
c0007b47:	5f                   	pop    %edi
c0007b48:	5d                   	pop    %ebp
c0007b49:	c3                   	ret    

c0007b4a <exception_handler2>:
c0007b4a:	55                   	push   %ebp
c0007b4b:	89 e5                	mov    %esp,%ebp
c0007b4d:	57                   	push   %edi
c0007b4e:	56                   	push   %esi
c0007b4f:	53                   	push   %ebx
c0007b50:	83 ec 6c             	sub    $0x6c,%esp
c0007b53:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007b56:	bb 20 a8 00 c0       	mov    $0xc000a820,%ebx
c0007b5b:	ba 13 00 00 00       	mov    $0x13,%edx
c0007b60:	89 c7                	mov    %eax,%edi
c0007b62:	89 de                	mov    %ebx,%esi
c0007b64:	89 d1                	mov    %edx,%ecx
c0007b66:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007b68:	c7 05 60 f7 00 c0 6a 	movl   $0x2e6a,0xc000f760
c0007b6f:	2e 00 00 
c0007b72:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007b79:	eb 14                	jmp    c0007b8f <exception_handler2+0x45>
c0007b7b:	83 ec 0c             	sub    $0xc,%esp
c0007b7e:	68 6c a8 00 c0       	push   $0xc000a86c
c0007b83:	e8 04 9a ff ff       	call   c000158c <disp_str>
c0007b88:	83 c4 10             	add    $0x10,%esp
c0007b8b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007b8f:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007b96:	7e e3                	jle    c0007b7b <exception_handler2+0x31>
c0007b98:	c7 05 60 f7 00 c0 6a 	movl   $0x2e6a,0xc000f760
c0007b9f:	2e 00 00 
c0007ba2:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007ba9:	8b 45 08             	mov    0x8(%ebp),%eax
c0007bac:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007bb0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007bb3:	83 ec 08             	sub    $0x8,%esp
c0007bb6:	ff 75 e0             	pushl  -0x20(%ebp)
c0007bb9:	ff 75 dc             	pushl  -0x24(%ebp)
c0007bbc:	e8 06 9a ff ff       	call   c00015c7 <disp_str_colour>
c0007bc1:	83 c4 10             	add    $0x10,%esp
c0007bc4:	83 ec 0c             	sub    $0xc,%esp
c0007bc7:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007bcc:	e8 bb 99 ff ff       	call   c000158c <disp_str>
c0007bd1:	83 c4 10             	add    $0x10,%esp
c0007bd4:	83 ec 08             	sub    $0x8,%esp
c0007bd7:	ff 75 e0             	pushl  -0x20(%ebp)
c0007bda:	68 c3 a5 00 c0       	push   $0xc000a5c3
c0007bdf:	e8 e3 99 ff ff       	call   c00015c7 <disp_str_colour>
c0007be4:	83 c4 10             	add    $0x10,%esp
c0007be7:	83 ec 0c             	sub    $0xc,%esp
c0007bea:	ff 75 08             	pushl  0x8(%ebp)
c0007bed:	e8 35 fc ff ff       	call   c0007827 <disp_int>
c0007bf2:	83 c4 10             	add    $0x10,%esp
c0007bf5:	83 ec 0c             	sub    $0xc,%esp
c0007bf8:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007bfd:	e8 8a 99 ff ff       	call   c000158c <disp_str>
c0007c02:	83 c4 10             	add    $0x10,%esp
c0007c05:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007c09:	74 44                	je     c0007c4f <exception_handler2+0x105>
c0007c0b:	83 ec 08             	sub    $0x8,%esp
c0007c0e:	ff 75 e0             	pushl  -0x20(%ebp)
c0007c11:	68 cb a5 00 c0       	push   $0xc000a5cb
c0007c16:	e8 ac 99 ff ff       	call   c00015c7 <disp_str_colour>
c0007c1b:	83 c4 10             	add    $0x10,%esp
c0007c1e:	83 ec 08             	sub    $0x8,%esp
c0007c21:	ff 75 e0             	pushl  -0x20(%ebp)
c0007c24:	68 cb a5 00 c0       	push   $0xc000a5cb
c0007c29:	e8 99 99 ff ff       	call   c00015c7 <disp_str_colour>
c0007c2e:	83 c4 10             	add    $0x10,%esp
c0007c31:	83 ec 0c             	sub    $0xc,%esp
c0007c34:	ff 75 0c             	pushl  0xc(%ebp)
c0007c37:	e8 eb fb ff ff       	call   c0007827 <disp_int>
c0007c3c:	83 c4 10             	add    $0x10,%esp
c0007c3f:	83 ec 0c             	sub    $0xc,%esp
c0007c42:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007c47:	e8 40 99 ff ff       	call   c000158c <disp_str>
c0007c4c:	83 c4 10             	add    $0x10,%esp
c0007c4f:	83 ec 08             	sub    $0x8,%esp
c0007c52:	ff 75 e0             	pushl  -0x20(%ebp)
c0007c55:	68 d5 a5 00 c0       	push   $0xc000a5d5
c0007c5a:	e8 68 99 ff ff       	call   c00015c7 <disp_str_colour>
c0007c5f:	83 c4 10             	add    $0x10,%esp
c0007c62:	83 ec 0c             	sub    $0xc,%esp
c0007c65:	ff 75 14             	pushl  0x14(%ebp)
c0007c68:	e8 ba fb ff ff       	call   c0007827 <disp_int>
c0007c6d:	83 c4 10             	add    $0x10,%esp
c0007c70:	83 ec 0c             	sub    $0xc,%esp
c0007c73:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007c78:	e8 0f 99 ff ff       	call   c000158c <disp_str>
c0007c7d:	83 c4 10             	add    $0x10,%esp
c0007c80:	83 ec 08             	sub    $0x8,%esp
c0007c83:	ff 75 e0             	pushl  -0x20(%ebp)
c0007c86:	68 d9 a5 00 c0       	push   $0xc000a5d9
c0007c8b:	e8 37 99 ff ff       	call   c00015c7 <disp_str_colour>
c0007c90:	83 c4 10             	add    $0x10,%esp
c0007c93:	83 ec 0c             	sub    $0xc,%esp
c0007c96:	ff 75 10             	pushl  0x10(%ebp)
c0007c99:	e8 89 fb ff ff       	call   c0007827 <disp_int>
c0007c9e:	83 c4 10             	add    $0x10,%esp
c0007ca1:	83 ec 0c             	sub    $0xc,%esp
c0007ca4:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007ca9:	e8 de 98 ff ff       	call   c000158c <disp_str>
c0007cae:	83 c4 10             	add    $0x10,%esp
c0007cb1:	83 ec 08             	sub    $0x8,%esp
c0007cb4:	ff 75 e0             	pushl  -0x20(%ebp)
c0007cb7:	68 de a5 00 c0       	push   $0xc000a5de
c0007cbc:	e8 06 99 ff ff       	call   c00015c7 <disp_str_colour>
c0007cc1:	83 c4 10             	add    $0x10,%esp
c0007cc4:	83 ec 0c             	sub    $0xc,%esp
c0007cc7:	ff 75 18             	pushl  0x18(%ebp)
c0007cca:	e8 58 fb ff ff       	call   c0007827 <disp_int>
c0007ccf:	83 c4 10             	add    $0x10,%esp
c0007cd2:	83 ec 0c             	sub    $0xc,%esp
c0007cd5:	68 c0 a5 00 c0       	push   $0xc000a5c0
c0007cda:	e8 ad 98 ff ff       	call   c000158c <disp_str>
c0007cdf:	83 c4 10             	add    $0x10,%esp
c0007ce2:	90                   	nop
c0007ce3:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007ce6:	5b                   	pop    %ebx
c0007ce7:	5e                   	pop    %esi
c0007ce8:	5f                   	pop    %edi
c0007ce9:	5d                   	pop    %ebp
c0007cea:	c3                   	ret    

c0007ceb <init_internal_interrupt>:
c0007ceb:	55                   	push   %ebp
c0007cec:	89 e5                	mov    %esp,%ebp
c0007cee:	83 ec 08             	sub    $0x8,%esp
c0007cf1:	6a 0e                	push   $0xe
c0007cf3:	6a 08                	push   $0x8
c0007cf5:	68 03 16 00 c0       	push   $0xc0001603
c0007cfa:	6a 00                	push   $0x0
c0007cfc:	e8 9d ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d01:	83 c4 10             	add    $0x10,%esp
c0007d04:	6a 0e                	push   $0xe
c0007d06:	6a 08                	push   $0x8
c0007d08:	68 09 16 00 c0       	push   $0xc0001609
c0007d0d:	6a 01                	push   $0x1
c0007d0f:	e8 8a ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d14:	83 c4 10             	add    $0x10,%esp
c0007d17:	6a 0e                	push   $0xe
c0007d19:	6a 08                	push   $0x8
c0007d1b:	68 0f 16 00 c0       	push   $0xc000160f
c0007d20:	6a 02                	push   $0x2
c0007d22:	e8 77 ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d27:	83 c4 10             	add    $0x10,%esp
c0007d2a:	6a 0e                	push   $0xe
c0007d2c:	6a 08                	push   $0x8
c0007d2e:	68 15 16 00 c0       	push   $0xc0001615
c0007d33:	6a 03                	push   $0x3
c0007d35:	e8 64 ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d3a:	83 c4 10             	add    $0x10,%esp
c0007d3d:	6a 0e                	push   $0xe
c0007d3f:	6a 08                	push   $0x8
c0007d41:	68 1b 16 00 c0       	push   $0xc000161b
c0007d46:	6a 04                	push   $0x4
c0007d48:	e8 51 ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d4d:	83 c4 10             	add    $0x10,%esp
c0007d50:	6a 0e                	push   $0xe
c0007d52:	6a 08                	push   $0x8
c0007d54:	68 21 16 00 c0       	push   $0xc0001621
c0007d59:	6a 05                	push   $0x5
c0007d5b:	e8 3e ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d60:	83 c4 10             	add    $0x10,%esp
c0007d63:	6a 0e                	push   $0xe
c0007d65:	6a 08                	push   $0x8
c0007d67:	68 27 16 00 c0       	push   $0xc0001627
c0007d6c:	6a 06                	push   $0x6
c0007d6e:	e8 2b ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d73:	83 c4 10             	add    $0x10,%esp
c0007d76:	6a 0e                	push   $0xe
c0007d78:	6a 08                	push   $0x8
c0007d7a:	68 2d 16 00 c0       	push   $0xc000162d
c0007d7f:	6a 07                	push   $0x7
c0007d81:	e8 18 ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d86:	83 c4 10             	add    $0x10,%esp
c0007d89:	6a 0e                	push   $0xe
c0007d8b:	6a 08                	push   $0x8
c0007d8d:	68 33 16 00 c0       	push   $0xc0001633
c0007d92:	6a 08                	push   $0x8
c0007d94:	e8 05 ce ff ff       	call   c0004b9e <InitInterruptDesc>
c0007d99:	83 c4 10             	add    $0x10,%esp
c0007d9c:	6a 0e                	push   $0xe
c0007d9e:	6a 08                	push   $0x8
c0007da0:	68 37 16 00 c0       	push   $0xc0001637
c0007da5:	6a 09                	push   $0x9
c0007da7:	e8 f2 cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007dac:	83 c4 10             	add    $0x10,%esp
c0007daf:	6a 0e                	push   $0xe
c0007db1:	6a 08                	push   $0x8
c0007db3:	68 3d 16 00 c0       	push   $0xc000163d
c0007db8:	6a 0a                	push   $0xa
c0007dba:	e8 df cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007dbf:	83 c4 10             	add    $0x10,%esp
c0007dc2:	6a 0e                	push   $0xe
c0007dc4:	6a 08                	push   $0x8
c0007dc6:	68 41 16 00 c0       	push   $0xc0001641
c0007dcb:	6a 0b                	push   $0xb
c0007dcd:	e8 cc cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007dd2:	83 c4 10             	add    $0x10,%esp
c0007dd5:	6a 0e                	push   $0xe
c0007dd7:	6a 08                	push   $0x8
c0007dd9:	68 45 16 00 c0       	push   $0xc0001645
c0007dde:	6a 0c                	push   $0xc
c0007de0:	e8 b9 cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007de5:	83 c4 10             	add    $0x10,%esp
c0007de8:	6a 0e                	push   $0xe
c0007dea:	6a 08                	push   $0x8
c0007dec:	68 49 16 00 c0       	push   $0xc0001649
c0007df1:	6a 0d                	push   $0xd
c0007df3:	e8 a6 cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007df8:	83 c4 10             	add    $0x10,%esp
c0007dfb:	6a 0e                	push   $0xe
c0007dfd:	6a 08                	push   $0x8
c0007dff:	68 4d 16 00 c0       	push   $0xc000164d
c0007e04:	6a 0e                	push   $0xe
c0007e06:	e8 93 cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007e0b:	83 c4 10             	add    $0x10,%esp
c0007e0e:	6a 0e                	push   $0xe
c0007e10:	6a 08                	push   $0x8
c0007e12:	68 51 16 00 c0       	push   $0xc0001651
c0007e17:	6a 10                	push   $0x10
c0007e19:	e8 80 cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007e1e:	83 c4 10             	add    $0x10,%esp
c0007e21:	6a 0e                	push   $0xe
c0007e23:	6a 08                	push   $0x8
c0007e25:	68 57 16 00 c0       	push   $0xc0001657
c0007e2a:	6a 11                	push   $0x11
c0007e2c:	e8 6d cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007e31:	83 c4 10             	add    $0x10,%esp
c0007e34:	6a 0e                	push   $0xe
c0007e36:	6a 08                	push   $0x8
c0007e38:	68 5b 16 00 c0       	push   $0xc000165b
c0007e3d:	6a 12                	push   $0x12
c0007e3f:	e8 5a cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007e44:	83 c4 10             	add    $0x10,%esp
c0007e47:	6a 0e                	push   $0xe
c0007e49:	6a 0e                	push   $0xe
c0007e4b:	68 21 17 00 c0       	push   $0xc0001721
c0007e50:	68 90 00 00 00       	push   $0x90
c0007e55:	e8 44 cd ff ff       	call   c0004b9e <InitInterruptDesc>
c0007e5a:	83 c4 10             	add    $0x10,%esp
c0007e5d:	90                   	nop
c0007e5e:	c9                   	leave  
c0007e5f:	c3                   	ret    

c0007e60 <test>:
c0007e60:	55                   	push   %ebp
c0007e61:	89 e5                	mov    %esp,%ebp
c0007e63:	83 ec 08             	sub    $0x8,%esp
c0007e66:	83 ec 0c             	sub    $0xc,%esp
c0007e69:	68 6e a8 00 c0       	push   $0xc000a86e
c0007e6e:	e8 19 97 ff ff       	call   c000158c <disp_str>
c0007e73:	83 c4 10             	add    $0x10,%esp
c0007e76:	83 ec 0c             	sub    $0xc,%esp
c0007e79:	6a 06                	push   $0x6
c0007e7b:	e8 a7 f9 ff ff       	call   c0007827 <disp_int>
c0007e80:	83 c4 10             	add    $0x10,%esp
c0007e83:	83 ec 0c             	sub    $0xc,%esp
c0007e86:	68 94 a5 00 c0       	push   $0xc000a594
c0007e8b:	e8 fc 96 ff ff       	call   c000158c <disp_str>
c0007e90:	83 c4 10             	add    $0x10,%esp
c0007e93:	90                   	nop
c0007e94:	c9                   	leave  
c0007e95:	c3                   	ret    

c0007e96 <disp_str_colour3>:
c0007e96:	55                   	push   %ebp
c0007e97:	89 e5                	mov    %esp,%ebp
c0007e99:	90                   	nop
c0007e9a:	5d                   	pop    %ebp
c0007e9b:	c3                   	ret    

c0007e9c <spurious_irq>:
c0007e9c:	55                   	push   %ebp
c0007e9d:	89 e5                	mov    %esp,%ebp
c0007e9f:	83 ec 08             	sub    $0x8,%esp
c0007ea2:	83 ec 08             	sub    $0x8,%esp
c0007ea5:	6a 0b                	push   $0xb
c0007ea7:	68 70 a8 00 c0       	push   $0xc000a870
c0007eac:	e8 16 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007eb1:	83 c4 10             	add    $0x10,%esp
c0007eb4:	83 ec 0c             	sub    $0xc,%esp
c0007eb7:	ff 75 08             	pushl  0x8(%ebp)
c0007eba:	e8 68 f9 ff ff       	call   c0007827 <disp_int>
c0007ebf:	83 c4 10             	add    $0x10,%esp
c0007ec2:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c0007ec7:	83 c0 01             	add    $0x1,%eax
c0007eca:	a3 e0 1e 01 c0       	mov    %eax,0xc0011ee0
c0007ecf:	83 ec 0c             	sub    $0xc,%esp
c0007ed2:	68 97 a8 00 c0       	push   $0xc000a897
c0007ed7:	e8 b0 96 ff ff       	call   c000158c <disp_str>
c0007edc:	83 c4 10             	add    $0x10,%esp
c0007edf:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c0007ee4:	83 ec 0c             	sub    $0xc,%esp
c0007ee7:	50                   	push   %eax
c0007ee8:	e8 3a f9 ff ff       	call   c0007827 <disp_int>
c0007eed:	83 c4 10             	add    $0x10,%esp
c0007ef0:	83 ec 0c             	sub    $0xc,%esp
c0007ef3:	68 99 a8 00 c0       	push   $0xc000a899
c0007ef8:	e8 8f 96 ff ff       	call   c000158c <disp_str>
c0007efd:	83 c4 10             	add    $0x10,%esp
c0007f00:	83 ec 08             	sub    $0x8,%esp
c0007f03:	6a 0c                	push   $0xc
c0007f05:	68 9c a8 00 c0       	push   $0xc000a89c
c0007f0a:	e8 b8 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f0f:	83 c4 10             	add    $0x10,%esp
c0007f12:	90                   	nop
c0007f13:	c9                   	leave  
c0007f14:	c3                   	ret    

c0007f15 <init_keyboard>:
c0007f15:	55                   	push   %ebp
c0007f16:	89 e5                	mov    %esp,%ebp
c0007f18:	83 ec 18             	sub    $0x18,%esp
c0007f1b:	83 ec 04             	sub    $0x4,%esp
c0007f1e:	68 00 02 00 00       	push   $0x200
c0007f23:	6a 00                	push   $0x0
c0007f25:	68 ac fb 00 c0       	push   $0xc000fbac
c0007f2a:	e8 a8 2d 00 00       	call   c000acd7 <Memset>
c0007f2f:	83 c4 10             	add    $0x10,%esp
c0007f32:	c7 05 a0 fb 00 c0 ac 	movl   $0xc000fbac,0xc000fba0
c0007f39:	fb 00 c0 
c0007f3c:	a1 a0 fb 00 c0       	mov    0xc000fba0,%eax
c0007f41:	a3 a4 fb 00 c0       	mov    %eax,0xc000fba4
c0007f46:	c7 05 a8 fb 00 c0 00 	movl   $0x0,0xc000fba8
c0007f4d:	00 00 00 
c0007f50:	c7 05 60 f7 00 c0 00 	movl   $0x0,0xc000f760
c0007f57:	00 00 00 
c0007f5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007f61:	eb 04                	jmp    c0007f67 <init_keyboard+0x52>
c0007f63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007f67:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0007f6e:	7e f3                	jle    c0007f63 <init_keyboard+0x4e>
c0007f70:	c7 05 60 f7 00 c0 00 	movl   $0x0,0xc000f760
c0007f77:	00 00 00 
c0007f7a:	e8 f0 d9 ff ff       	call   c000596f <init_keyboard_handler>
c0007f7f:	90                   	nop
c0007f80:	c9                   	leave  
c0007f81:	c3                   	ret    

c0007f82 <init2>:
c0007f82:	55                   	push   %ebp
c0007f83:	89 e5                	mov    %esp,%ebp
c0007f85:	83 ec 08             	sub    $0x8,%esp
c0007f88:	83 ec 0c             	sub    $0xc,%esp
c0007f8b:	68 c1 a8 00 c0       	push   $0xc000a8c1
c0007f90:	e8 f7 95 ff ff       	call   c000158c <disp_str>
c0007f95:	83 c4 10             	add    $0x10,%esp
c0007f98:	e8 78 ff ff ff       	call   c0007f15 <init_keyboard>
c0007f9d:	83 ec 0c             	sub    $0xc,%esp
c0007fa0:	68 00 00 00 02       	push   $0x2000000
c0007fa5:	e8 9b f4 ff ff       	call   c0007445 <init_memory>
c0007faa:	83 c4 10             	add    $0x10,%esp
c0007fad:	90                   	nop
c0007fae:	c9                   	leave  
c0007faf:	c3                   	ret    

c0007fb0 <u_thread_a>:
c0007fb0:	55                   	push   %ebp
c0007fb1:	89 e5                	mov    %esp,%ebp
c0007fb3:	83 ec 08             	sub    $0x8,%esp
c0007fb6:	83 ec 0c             	sub    $0xc,%esp
c0007fb9:	68 c7 a8 00 c0       	push   $0xc000a8c7
c0007fbe:	e8 c9 95 ff ff       	call   c000158c <disp_str>
c0007fc3:	83 c4 10             	add    $0x10,%esp
c0007fc6:	eb fe                	jmp    c0007fc6 <u_thread_a+0x16>

c0007fc8 <kernel_main2>:
c0007fc8:	55                   	push   %ebp
c0007fc9:	89 e5                	mov    %esp,%ebp
c0007fcb:	57                   	push   %edi
c0007fcc:	56                   	push   %esi
c0007fcd:	53                   	push   %ebx
c0007fce:	83 ec 3c             	sub    $0x3c,%esp
c0007fd1:	83 ec 0c             	sub    $0xc,%esp
c0007fd4:	68 d5 a8 00 c0       	push   $0xc000a8d5
c0007fd9:	e8 ae 95 ff ff       	call   c000158c <disp_str>
c0007fde:	83 c4 10             	add    $0x10,%esp
c0007fe1:	e8 1f 99 ff ff       	call   c0001905 <init>
c0007fe6:	c7 05 e0 1e 01 c0 00 	movl   $0x0,0xc0011ee0
c0007fed:	00 00 00 
c0007ff0:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c0007ff7:	00 00 00 
c0007ffa:	c7 05 64 f7 00 c0 00 	movl   $0x0,0xc000f764
c0008001:	00 00 00 
c0008004:	c7 45 dc e0 31 08 c0 	movl   $0xc00831e0,-0x24(%ebp)
c000800b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008012:	e9 01 02 00 00       	jmp    c0008218 <kernel_main2+0x250>
c0008017:	83 ec 08             	sub    $0x8,%esp
c000801a:	6a 00                	push   $0x0
c000801c:	6a 01                	push   $0x1
c000801e:	e8 ee eb ff ff       	call   c0006c11 <alloc_memory>
c0008023:	83 c4 10             	add    $0x10,%esp
c0008026:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008029:	83 ec 04             	sub    $0x4,%esp
c000802c:	68 b0 01 00 00       	push   $0x1b0
c0008031:	6a 00                	push   $0x0
c0008033:	ff 75 d8             	pushl  -0x28(%ebp)
c0008036:	e8 9c 2c 00 00       	call   c000acd7 <Memset>
c000803b:	83 c4 10             	add    $0x10,%esp
c000803e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008041:	05 00 10 00 00       	add    $0x1000,%eax
c0008046:	89 c2                	mov    %eax,%edx
c0008048:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000804b:	89 10                	mov    %edx,(%eax)
c000804d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008050:	66 c7 80 0c 01 00 00 	movw   $0x0,0x10c(%eax)
c0008057:	00 00 
c0008059:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000805c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000805f:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c0008065:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008068:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000806f:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0008073:	7e 0f                	jle    c0008084 <kernel_main2+0xbc>
c0008075:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008078:	c6 80 48 01 00 00 ff 	movb   $0xff,0x148(%eax)
c000807f:	e9 90 01 00 00       	jmp    c0008214 <kernel_main2+0x24c>
c0008084:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008087:	c6 80 48 01 00 00 00 	movb   $0x0,0x148(%eax)
c000808e:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c0008092:	7f 73                	jg     c0008107 <kernel_main2+0x13f>
c0008094:	c7 45 e4 40 e0 00 c0 	movl   $0xc000e040,-0x1c(%ebp)
c000809b:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c00080a2:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c00080a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00080ac:	8b 00                	mov    (%eax),%eax
c00080ae:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c00080b1:	89 c2                	mov    %eax,%edx
c00080b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00080b6:	89 10                	mov    %edx,(%eax)
c00080b8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00080bb:	8b 00                	mov    (%eax),%eax
c00080bd:	2b 45 d0             	sub    -0x30(%ebp),%eax
c00080c0:	89 c2                	mov    %eax,%edx
c00080c2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00080c5:	89 10                	mov    %edx,(%eax)
c00080c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00080ca:	8b 00                	mov    (%eax),%eax
c00080cc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00080cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00080d2:	8b 50 14             	mov    0x14(%eax),%edx
c00080d5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00080d8:	89 50 24             	mov    %edx,0x24(%eax)
c00080db:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00080de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00080e4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00080e7:	8b 10                	mov    (%eax),%edx
c00080e9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00080ec:	89 50 04             	mov    %edx,0x4(%eax)
c00080ef:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00080f2:	8b 50 04             	mov    0x4(%eax),%edx
c00080f5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00080f8:	89 50 08             	mov    %edx,0x8(%eax)
c00080fb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00080fe:	8b 50 08             	mov    0x8(%eax),%edx
c0008101:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008104:	89 50 0c             	mov    %edx,0xc(%eax)
c0008107:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000810a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000810d:	81 c2 30 01 00 00    	add    $0x130,%edx
c0008113:	83 ec 08             	sub    $0x8,%esp
c0008116:	50                   	push   %eax
c0008117:	52                   	push   %edx
c0008118:	e8 d9 2b 00 00       	call   c000acf6 <Strcpy>
c000811d:	83 c4 10             	add    $0x10,%esp
c0008120:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008124:	83 c8 04             	or     $0x4,%eax
c0008127:	0f b6 c0             	movzbl %al,%eax
c000812a:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c000812e:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008132:	83 c8 0c             	or     $0xc,%eax
c0008135:	0f b6 c0             	movzbl %al,%eax
c0008138:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c000813c:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c0008140:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008143:	89 90 a0 01 00 00    	mov    %edx,0x1a0(%eax)
c0008149:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000814d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008150:	89 90 78 01 00 00    	mov    %edx,0x178(%eax)
c0008156:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000815a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000815d:	89 90 70 01 00 00    	mov    %edx,0x170(%eax)
c0008163:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008167:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000816a:	89 90 74 01 00 00    	mov    %edx,0x174(%eax)
c0008170:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008174:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008177:	89 90 ac 01 00 00    	mov    %edx,0x1ac(%eax)
c000817d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008180:	c7 80 6c 01 00 00 39 	movl   $0x39,0x16c(%eax)
c0008187:	00 00 00 
c000818a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000818d:	8b 50 14             	mov    0x14(%eax),%edx
c0008190:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008193:	89 90 9c 01 00 00    	mov    %edx,0x19c(%eax)
c0008199:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000819c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c000819f:	89 90 a4 01 00 00    	mov    %edx,0x1a4(%eax)
c00081a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081a8:	c7 80 60 01 00 00 00 	movl   $0x0,0x160(%eax)
c00081af:	00 00 00 
c00081b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081b5:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c00081bc:	00 00 00 
c00081bf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081c2:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c00081c9:	00 00 00 
c00081cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081cf:	c7 80 54 01 00 00 1d 	movl   $0x1d,0x154(%eax)
c00081d6:	00 00 00 
c00081d9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081dc:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c00081e3:	00 00 00 
c00081e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081e9:	c7 80 4c 01 00 00 00 	movl   $0x0,0x14c(%eax)
c00081f0:	00 00 00 
c00081f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00081f6:	69 c0 b0 01 00 00    	imul   $0x1b0,%eax,%eax
c00081fc:	8d 90 e0 32 08 c0    	lea    -0x3ff7cd20(%eax),%edx
c0008202:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008205:	89 c3                	mov    %eax,%ebx
c0008207:	b8 6c 00 00 00       	mov    $0x6c,%eax
c000820c:	89 d7                	mov    %edx,%edi
c000820e:	89 de                	mov    %ebx,%esi
c0008210:	89 c1                	mov    %eax,%ecx
c0008212:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008214:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008218:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000821c:	0f 8e f5 fd ff ff    	jle    c0008017 <kernel_main2+0x4f>
c0008222:	c7 05 80 fb 00 c0 e0 	movl   $0xc00832e0,0xc000fb80
c0008229:	32 08 c0 
c000822c:	eb fe                	jmp    c000822c <kernel_main2+0x264>

c000822e <TestFS>:
c000822e:	55                   	push   %ebp
c000822f:	89 e5                	mov    %esp,%ebp
c0008231:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c0008237:	83 ec 0c             	sub    $0xc,%esp
c000823a:	68 e1 a8 00 c0       	push   $0xc000a8e1
c000823f:	e8 48 93 ff ff       	call   c000158c <disp_str>
c0008244:	83 c4 10             	add    $0x10,%esp
c0008247:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c000824e:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008255:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c000825b:	83 ec 08             	sub    $0x8,%esp
c000825e:	6a 02                	push   $0x2
c0008260:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008263:	50                   	push   %eax
c0008264:	e8 ac d8 ff ff       	call   c0005b15 <open>
c0008269:	83 c4 10             	add    $0x10,%esp
c000826c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000826f:	83 ec 08             	sub    $0x8,%esp
c0008272:	6a 02                	push   $0x2
c0008274:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008277:	50                   	push   %eax
c0008278:	e8 98 d8 ff ff       	call   c0005b15 <open>
c000827d:	83 c4 10             	add    $0x10,%esp
c0008280:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008283:	83 ec 0c             	sub    $0xc,%esp
c0008286:	68 e9 a8 00 c0       	push   $0xc000a8e9
c000828b:	e8 41 0a 00 00       	call   c0008cd1 <Printf>
c0008290:	83 c4 10             	add    $0x10,%esp
c0008293:	90                   	nop
c0008294:	c9                   	leave  
c0008295:	c3                   	ret    

c0008296 <wait_exit>:
c0008296:	55                   	push   %ebp
c0008297:	89 e5                	mov    %esp,%ebp
c0008299:	83 ec 28             	sub    $0x28,%esp
c000829c:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00082a3:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00082aa:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00082b0:	83 ec 08             	sub    $0x8,%esp
c00082b3:	6a 02                	push   $0x2
c00082b5:	8d 45 de             	lea    -0x22(%ebp),%eax
c00082b8:	50                   	push   %eax
c00082b9:	e8 57 d8 ff ff       	call   c0005b15 <open>
c00082be:	83 c4 10             	add    $0x10,%esp
c00082c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00082c4:	83 ec 08             	sub    $0x8,%esp
c00082c7:	6a 02                	push   $0x2
c00082c9:	8d 45 de             	lea    -0x22(%ebp),%eax
c00082cc:	50                   	push   %eax
c00082cd:	e8 43 d8 ff ff       	call   c0005b15 <open>
c00082d2:	83 c4 10             	add    $0x10,%esp
c00082d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00082d8:	e8 eb d9 ff ff       	call   c0005cc8 <fork>
c00082dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00082e0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00082e4:	7e 25                	jle    c000830b <wait_exit+0x75>
c00082e6:	83 ec 0c             	sub    $0xc,%esp
c00082e9:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00082ec:	50                   	push   %eax
c00082ed:	e8 6f d9 ff ff       	call   c0005c61 <wait>
c00082f2:	83 c4 10             	add    $0x10,%esp
c00082f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082f8:	83 ec 08             	sub    $0x8,%esp
c00082fb:	50                   	push   %eax
c00082fc:	68 fb a8 00 c0       	push   $0xc000a8fb
c0008301:	e8 cb 09 00 00       	call   c0008cd1 <Printf>
c0008306:	83 c4 10             	add    $0x10,%esp
c0008309:	eb fe                	jmp    c0008309 <wait_exit+0x73>
c000830b:	83 ec 0c             	sub    $0xc,%esp
c000830e:	68 16 a9 00 c0       	push   $0xc000a916
c0008313:	e8 b9 09 00 00       	call   c0008cd1 <Printf>
c0008318:	83 c4 10             	add    $0x10,%esp
c000831b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008322:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008325:	8d 50 01             	lea    0x1(%eax),%edx
c0008328:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000832b:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008330:	7f 02                	jg     c0008334 <wait_exit+0x9e>
c0008332:	eb ee                	jmp    c0008322 <wait_exit+0x8c>
c0008334:	90                   	nop
c0008335:	83 ec 0c             	sub    $0xc,%esp
c0008338:	68 22 a9 00 c0       	push   $0xc000a922
c000833d:	e8 8f 09 00 00       	call   c0008cd1 <Printf>
c0008342:	83 c4 10             	add    $0x10,%esp
c0008345:	83 ec 0c             	sub    $0xc,%esp
c0008348:	6a 09                	push   $0x9
c000834a:	e8 50 d9 ff ff       	call   c0005c9f <exit>
c000834f:	83 c4 10             	add    $0x10,%esp
c0008352:	83 ec 0c             	sub    $0xc,%esp
c0008355:	68 30 a9 00 c0       	push   $0xc000a930
c000835a:	e8 72 09 00 00       	call   c0008cd1 <Printf>
c000835f:	83 c4 10             	add    $0x10,%esp
c0008362:	eb fe                	jmp    c0008362 <wait_exit+0xcc>

c0008364 <INIT_fork>:
c0008364:	55                   	push   %ebp
c0008365:	89 e5                	mov    %esp,%ebp
c0008367:	53                   	push   %ebx
c0008368:	81 ec 84 00 00 00    	sub    $0x84,%esp
c000836e:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c0008375:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c000837c:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0008382:	83 ec 08             	sub    $0x8,%esp
c0008385:	6a 02                	push   $0x2
c0008387:	8d 45 da             	lea    -0x26(%ebp),%eax
c000838a:	50                   	push   %eax
c000838b:	e8 85 d7 ff ff       	call   c0005b15 <open>
c0008390:	83 c4 10             	add    $0x10,%esp
c0008393:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008396:	83 ec 08             	sub    $0x8,%esp
c0008399:	6a 02                	push   $0x2
c000839b:	8d 45 da             	lea    -0x26(%ebp),%eax
c000839e:	50                   	push   %eax
c000839f:	e8 71 d7 ff ff       	call   c0005b15 <open>
c00083a4:	83 c4 10             	add    $0x10,%esp
c00083a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00083aa:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c00083b1:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c00083b8:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c00083bf:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c00083c6:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c00083cd:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c00083d4:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c00083db:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c00083e2:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c00083e9:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c00083f0:	83 ec 0c             	sub    $0xc,%esp
c00083f3:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00083f6:	50                   	push   %eax
c00083f7:	e8 14 29 00 00       	call   c000ad10 <Strlen>
c00083fc:	83 c4 10             	add    $0x10,%esp
c00083ff:	83 ec 04             	sub    $0x4,%esp
c0008402:	50                   	push   %eax
c0008403:	6a 00                	push   $0x0
c0008405:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008408:	50                   	push   %eax
c0008409:	e8 c9 28 00 00       	call   c000acd7 <Memset>
c000840e:	83 c4 10             	add    $0x10,%esp
c0008411:	83 ec 04             	sub    $0x4,%esp
c0008414:	6a 28                	push   $0x28
c0008416:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008419:	50                   	push   %eax
c000841a:	ff 75 e8             	pushl  -0x18(%ebp)
c000841d:	e8 67 d7 ff ff       	call   c0005b89 <read>
c0008422:	83 c4 10             	add    $0x10,%esp
c0008425:	83 ec 04             	sub    $0x4,%esp
c0008428:	6a 28                	push   $0x28
c000842a:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c000842d:	50                   	push   %eax
c000842e:	ff 75 ec             	pushl  -0x14(%ebp)
c0008431:	e8 8a d7 ff ff       	call   c0005bc0 <write>
c0008436:	83 c4 10             	add    $0x10,%esp
c0008439:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008440:	e8 83 d8 ff ff       	call   c0005cc8 <fork>
c0008445:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008448:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000844c:	0f 8e dd 00 00 00    	jle    c000852f <INIT_fork+0x1cb>
c0008452:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008456:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
c000845d:	61 72 65 
c0008460:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
c0008467:	8d 45 87             	lea    -0x79(%ebp),%eax
c000846a:	b9 20 00 00 00       	mov    $0x20,%ecx
c000846f:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008474:	89 18                	mov    %ebx,(%eax)
c0008476:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c000847a:	8d 50 04             	lea    0x4(%eax),%edx
c000847d:	83 e2 fc             	and    $0xfffffffc,%edx
c0008480:	29 d0                	sub    %edx,%eax
c0008482:	01 c1                	add    %eax,%ecx
c0008484:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008487:	83 e1 fc             	and    $0xfffffffc,%ecx
c000848a:	b8 00 00 00 00       	mov    $0x0,%eax
c000848f:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008492:	83 c0 04             	add    $0x4,%eax
c0008495:	39 c8                	cmp    %ecx,%eax
c0008497:	72 f6                	jb     c000848f <INIT_fork+0x12b>
c0008499:	01 c2                	add    %eax,%edx
c000849b:	83 ec 0c             	sub    $0xc,%esp
c000849e:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00084a4:	50                   	push   %eax
c00084a5:	e8 66 28 00 00       	call   c000ad10 <Strlen>
c00084aa:	83 c4 10             	add    $0x10,%esp
c00084ad:	83 ec 04             	sub    $0x4,%esp
c00084b0:	50                   	push   %eax
c00084b1:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00084b7:	50                   	push   %eax
c00084b8:	ff 75 ec             	pushl  -0x14(%ebp)
c00084bb:	e8 00 d7 ff ff       	call   c0005bc0 <write>
c00084c0:	83 c4 10             	add    $0x10,%esp
c00084c3:	83 ec 0c             	sub    $0xc,%esp
c00084c6:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00084cc:	50                   	push   %eax
c00084cd:	e8 3e 28 00 00       	call   c000ad10 <Strlen>
c00084d2:	83 c4 10             	add    $0x10,%esp
c00084d5:	83 ec 04             	sub    $0x4,%esp
c00084d8:	50                   	push   %eax
c00084d9:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00084df:	50                   	push   %eax
c00084e0:	ff 75 ec             	pushl  -0x14(%ebp)
c00084e3:	e8 d8 d6 ff ff       	call   c0005bc0 <write>
c00084e8:	83 c4 10             	add    $0x10,%esp
c00084eb:	83 ec 0c             	sub    $0xc,%esp
c00084ee:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00084f4:	50                   	push   %eax
c00084f5:	e8 16 28 00 00       	call   c000ad10 <Strlen>
c00084fa:	83 c4 10             	add    $0x10,%esp
c00084fd:	83 ec 04             	sub    $0x4,%esp
c0008500:	50                   	push   %eax
c0008501:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008507:	50                   	push   %eax
c0008508:	ff 75 ec             	pushl  -0x14(%ebp)
c000850b:	e8 b0 d6 ff ff       	call   c0005bc0 <write>
c0008510:	83 c4 10             	add    $0x10,%esp
c0008513:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000851a:	eb 08                	jmp    c0008524 <INIT_fork+0x1c0>
c000851c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008520:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008524:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0008528:	7e f2                	jle    c000851c <INIT_fork+0x1b8>
c000852a:	e9 0f 01 00 00       	jmp    c000863e <INIT_fork+0x2da>
c000852f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008533:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0008537:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
c000853e:	68 69 6c 
c0008541:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
c0008548:	8d 45 87             	lea    -0x79(%ebp),%eax
c000854b:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008550:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008555:	89 18                	mov    %ebx,(%eax)
c0008557:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c000855b:	8d 50 04             	lea    0x4(%eax),%edx
c000855e:	83 e2 fc             	and    $0xfffffffc,%edx
c0008561:	29 d0                	sub    %edx,%eax
c0008563:	01 c1                	add    %eax,%ecx
c0008565:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008568:	83 e1 fc             	and    $0xfffffffc,%ecx
c000856b:	b8 00 00 00 00       	mov    $0x0,%eax
c0008570:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008573:	83 c0 04             	add    $0x4,%eax
c0008576:	39 c8                	cmp    %ecx,%eax
c0008578:	72 f6                	jb     c0008570 <INIT_fork+0x20c>
c000857a:	01 c2                	add    %eax,%edx
c000857c:	83 ec 0c             	sub    $0xc,%esp
c000857f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008585:	50                   	push   %eax
c0008586:	e8 85 27 00 00       	call   c000ad10 <Strlen>
c000858b:	83 c4 10             	add    $0x10,%esp
c000858e:	83 ec 04             	sub    $0x4,%esp
c0008591:	50                   	push   %eax
c0008592:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008598:	50                   	push   %eax
c0008599:	ff 75 ec             	pushl  -0x14(%ebp)
c000859c:	e8 1f d6 ff ff       	call   c0005bc0 <write>
c00085a1:	83 c4 10             	add    $0x10,%esp
c00085a4:	83 ec 0c             	sub    $0xc,%esp
c00085a7:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00085ad:	50                   	push   %eax
c00085ae:	e8 5d 27 00 00       	call   c000ad10 <Strlen>
c00085b3:	83 c4 10             	add    $0x10,%esp
c00085b6:	83 ec 04             	sub    $0x4,%esp
c00085b9:	50                   	push   %eax
c00085ba:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00085c0:	50                   	push   %eax
c00085c1:	ff 75 ec             	pushl  -0x14(%ebp)
c00085c4:	e8 f7 d5 ff ff       	call   c0005bc0 <write>
c00085c9:	83 c4 10             	add    $0x10,%esp
c00085cc:	83 ec 0c             	sub    $0xc,%esp
c00085cf:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00085d5:	50                   	push   %eax
c00085d6:	e8 35 27 00 00       	call   c000ad10 <Strlen>
c00085db:	83 c4 10             	add    $0x10,%esp
c00085de:	83 ec 04             	sub    $0x4,%esp
c00085e1:	50                   	push   %eax
c00085e2:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00085e8:	50                   	push   %eax
c00085e9:	ff 75 ec             	pushl  -0x14(%ebp)
c00085ec:	e8 cf d5 ff ff       	call   c0005bc0 <write>
c00085f1:	83 c4 10             	add    $0x10,%esp
c00085f4:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
c00085fb:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
c0008602:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
c0008608:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
c000860c:	83 ec 0c             	sub    $0xc,%esp
c000860f:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008612:	50                   	push   %eax
c0008613:	e8 f8 26 00 00       	call   c000ad10 <Strlen>
c0008618:	83 c4 10             	add    $0x10,%esp
c000861b:	83 ec 04             	sub    $0x4,%esp
c000861e:	50                   	push   %eax
c000861f:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008622:	50                   	push   %eax
c0008623:	ff 75 ec             	pushl  -0x14(%ebp)
c0008626:	e8 95 d5 ff ff       	call   c0005bc0 <write>
c000862b:	83 c4 10             	add    $0x10,%esp
c000862e:	83 ec 0c             	sub    $0xc,%esp
c0008631:	68 3e a9 00 c0       	push   $0xc000a93e
c0008636:	e8 c6 09 00 00       	call   c0009001 <spin>
c000863b:	83 c4 10             	add    $0x10,%esp
c000863e:	83 ec 0c             	sub    $0xc,%esp
c0008641:	68 45 a9 00 c0       	push   $0xc000a945
c0008646:	e8 b6 09 00 00       	call   c0009001 <spin>
c000864b:	83 c4 10             	add    $0x10,%esp
c000864e:	90                   	nop
c000864f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0008652:	c9                   	leave  
c0008653:	c3                   	ret    

c0008654 <simple_shell>:
c0008654:	55                   	push   %ebp
c0008655:	89 e5                	mov    %esp,%ebp
c0008657:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c000865d:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008664:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c000866b:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008671:	83 ec 08             	sub    $0x8,%esp
c0008674:	6a 02                	push   $0x2
c0008676:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008679:	50                   	push   %eax
c000867a:	e8 96 d4 ff ff       	call   c0005b15 <open>
c000867f:	83 c4 10             	add    $0x10,%esp
c0008682:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008685:	83 ec 08             	sub    $0x8,%esp
c0008688:	6a 02                	push   $0x2
c000868a:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000868d:	50                   	push   %eax
c000868e:	e8 82 d4 ff ff       	call   c0005b15 <open>
c0008693:	83 c4 10             	add    $0x10,%esp
c0008696:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008699:	83 ec 04             	sub    $0x4,%esp
c000869c:	68 80 00 00 00       	push   $0x80
c00086a1:	6a 00                	push   $0x0
c00086a3:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00086a9:	50                   	push   %eax
c00086aa:	e8 28 26 00 00       	call   c000acd7 <Memset>
c00086af:	83 c4 10             	add    $0x10,%esp
c00086b2:	83 ec 04             	sub    $0x4,%esp
c00086b5:	68 80 00 00 00       	push   $0x80
c00086ba:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00086c0:	50                   	push   %eax
c00086c1:	ff 75 e0             	pushl  -0x20(%ebp)
c00086c4:	e8 c0 d4 ff ff       	call   c0005b89 <read>
c00086c9:	83 c4 10             	add    $0x10,%esp
c00086cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00086d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00086da:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00086e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00086e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00086e6:	0f b6 00             	movzbl (%eax),%eax
c00086e9:	88 45 db             	mov    %al,-0x25(%ebp)
c00086ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00086ef:	0f b6 00             	movzbl (%eax),%eax
c00086f2:	3c 20                	cmp    $0x20,%al
c00086f4:	74 1d                	je     c0008713 <simple_shell+0xbf>
c00086f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00086f9:	0f b6 00             	movzbl (%eax),%eax
c00086fc:	84 c0                	test   %al,%al
c00086fe:	74 13                	je     c0008713 <simple_shell+0xbf>
c0008700:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008704:	75 0d                	jne    c0008713 <simple_shell+0xbf>
c0008706:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008709:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000870c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008713:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008716:	0f b6 00             	movzbl (%eax),%eax
c0008719:	3c 20                	cmp    $0x20,%al
c000871b:	74 0a                	je     c0008727 <simple_shell+0xd3>
c000871d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008720:	0f b6 00             	movzbl (%eax),%eax
c0008723:	84 c0                	test   %al,%al
c0008725:	75 26                	jne    c000874d <simple_shell+0xf9>
c0008727:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c000872b:	75 20                	jne    c000874d <simple_shell+0xf9>
c000872d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008730:	8d 50 01             	lea    0x1(%eax),%edx
c0008733:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008736:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008739:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008740:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008743:	c6 00 00             	movb   $0x0,(%eax)
c0008746:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000874d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008751:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008755:	75 8c                	jne    c00086e3 <simple_shell+0x8f>
c0008757:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000875a:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008761:	00 00 00 00 
c0008765:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000876c:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008772:	83 ec 08             	sub    $0x8,%esp
c0008775:	6a 02                	push   $0x2
c0008777:	50                   	push   %eax
c0008778:	e8 98 d3 ff ff       	call   c0005b15 <open>
c000877d:	83 c4 10             	add    $0x10,%esp
c0008780:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008783:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008787:	75 54                	jne    c00087dd <simple_shell+0x189>
c0008789:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008790:	eb 29                	jmp    c00087bb <simple_shell+0x167>
c0008792:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008798:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000879b:	01 d0                	add    %edx,%eax
c000879d:	0f b6 00             	movzbl (%eax),%eax
c00087a0:	0f be c0             	movsbl %al,%eax
c00087a3:	83 ec 04             	sub    $0x4,%esp
c00087a6:	50                   	push   %eax
c00087a7:	ff 75 e4             	pushl  -0x1c(%ebp)
c00087aa:	68 4d a9 00 c0       	push   $0xc000a94d
c00087af:	e8 1d 05 00 00       	call   c0008cd1 <Printf>
c00087b4:	83 c4 10             	add    $0x10,%esp
c00087b7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00087bb:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c00087bf:	7e d1                	jle    c0008792 <simple_shell+0x13e>
c00087c1:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00087c7:	83 ec 08             	sub    $0x8,%esp
c00087ca:	50                   	push   %eax
c00087cb:	68 54 a9 00 c0       	push   $0xc000a954
c00087d0:	e8 fc 04 00 00       	call   c0008cd1 <Printf>
c00087d5:	83 c4 10             	add    $0x10,%esp
c00087d8:	e9 bc fe ff ff       	jmp    c0008699 <simple_shell+0x45>
c00087dd:	e8 e6 d4 ff ff       	call   c0005cc8 <fork>
c00087e2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00087e5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00087e9:	7e 17                	jle    c0008802 <simple_shell+0x1ae>
c00087eb:	83 ec 0c             	sub    $0xc,%esp
c00087ee:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00087f4:	50                   	push   %eax
c00087f5:	e8 67 d4 ff ff       	call   c0005c61 <wait>
c00087fa:	83 c4 10             	add    $0x10,%esp
c00087fd:	e9 97 fe ff ff       	jmp    c0008699 <simple_shell+0x45>
c0008802:	83 ec 0c             	sub    $0xc,%esp
c0008805:	ff 75 d0             	pushl  -0x30(%ebp)
c0008808:	e8 08 d4 ff ff       	call   c0005c15 <close>
c000880d:	83 c4 10             	add    $0x10,%esp
c0008810:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008816:	83 ec 08             	sub    $0x8,%esp
c0008819:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c000881f:	52                   	push   %edx
c0008820:	50                   	push   %eax
c0008821:	e8 91 d5 ff ff       	call   c0005db7 <execv>
c0008826:	83 c4 10             	add    $0x10,%esp
c0008829:	eb fe                	jmp    c0008829 <simple_shell+0x1d5>

c000882b <test_split_str>:
c000882b:	55                   	push   %ebp
c000882c:	89 e5                	mov    %esp,%ebp
c000882e:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008834:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000883b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008842:	c7 45 ec 5a a9 00 c0 	movl   $0xc000a95a,-0x14(%ebp)
c0008849:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000884d:	75 1a                	jne    c0008869 <test_split_str+0x3e>
c000884f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008852:	0f b6 00             	movzbl (%eax),%eax
c0008855:	0f be c0             	movsbl %al,%eax
c0008858:	83 ec 08             	sub    $0x8,%esp
c000885b:	50                   	push   %eax
c000885c:	68 6b a9 00 c0       	push   $0xc000a96b
c0008861:	e8 6b 04 00 00       	call   c0008cd1 <Printf>
c0008866:	83 c4 10             	add    $0x10,%esp
c0008869:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000886c:	0f b6 00             	movzbl (%eax),%eax
c000886f:	3c 20                	cmp    $0x20,%al
c0008871:	75 0a                	jne    c000887d <test_split_str+0x52>
c0008873:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008876:	0f b6 00             	movzbl (%eax),%eax
c0008879:	84 c0                	test   %al,%al
c000887b:	74 13                	je     c0008890 <test_split_str+0x65>
c000887d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008881:	75 0d                	jne    c0008890 <test_split_str+0x65>
c0008883:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008886:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008889:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008890:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008893:	0f b6 00             	movzbl (%eax),%eax
c0008896:	3c 20                	cmp    $0x20,%al
c0008898:	74 0a                	je     c00088a4 <test_split_str+0x79>
c000889a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000889d:	0f b6 00             	movzbl (%eax),%eax
c00088a0:	84 c0                	test   %al,%al
c00088a2:	75 26                	jne    c00088ca <test_split_str+0x9f>
c00088a4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00088a8:	75 20                	jne    c00088ca <test_split_str+0x9f>
c00088aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00088ad:	8d 50 01             	lea    0x1(%eax),%edx
c00088b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00088b3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00088b6:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00088bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088c0:	c6 00 00             	movb   $0x0,(%eax)
c00088c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00088ca:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00088ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088d1:	0f b6 00             	movzbl (%eax),%eax
c00088d4:	84 c0                	test   %al,%al
c00088d6:	0f 85 6d ff ff ff    	jne    c0008849 <test_split_str+0x1e>
c00088dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00088df:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00088e2:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00088e9:	83 ec 08             	sub    $0x8,%esp
c00088ec:	ff 75 f4             	pushl  -0xc(%ebp)
c00088ef:	68 74 a9 00 c0       	push   $0xc000a974
c00088f4:	e8 d8 03 00 00       	call   c0008cd1 <Printf>
c00088f9:	83 c4 10             	add    $0x10,%esp
c00088fc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008903:	eb 22                	jmp    c0008927 <test_split_str+0xfc>
c0008905:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008908:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c000890f:	83 ec 04             	sub    $0x4,%esp
c0008912:	50                   	push   %eax
c0008913:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008916:	68 8b a9 00 c0       	push   $0xc000a98b
c000891b:	e8 b1 03 00 00       	call   c0008cd1 <Printf>
c0008920:	83 c4 10             	add    $0x10,%esp
c0008923:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008927:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000892a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c000892d:	7e d6                	jle    c0008905 <test_split_str+0xda>
c000892f:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008935:	83 ec 08             	sub    $0x8,%esp
c0008938:	68 9a a9 00 c0       	push   $0xc000a99a
c000893d:	50                   	push   %eax
c000893e:	e8 34 12 00 00       	call   c0009b77 <strcmp>
c0008943:	83 c4 10             	add    $0x10,%esp
c0008946:	85 c0                	test   %eax,%eax
c0008948:	75 10                	jne    c000895a <test_split_str+0x12f>
c000894a:	83 ec 0c             	sub    $0xc,%esp
c000894d:	68 9f a9 00 c0       	push   $0xc000a99f
c0008952:	e8 7a 03 00 00       	call   c0008cd1 <Printf>
c0008957:	83 c4 10             	add    $0x10,%esp
c000895a:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008960:	83 ec 08             	sub    $0x8,%esp
c0008963:	50                   	push   %eax
c0008964:	68 ab a9 00 c0       	push   $0xc000a9ab
c0008969:	e8 63 03 00 00       	call   c0008cd1 <Printf>
c000896e:	83 c4 10             	add    $0x10,%esp
c0008971:	83 ec 0c             	sub    $0xc,%esp
c0008974:	68 b9 a9 00 c0       	push   $0xc000a9b9
c0008979:	e8 53 03 00 00       	call   c0008cd1 <Printf>
c000897e:	83 c4 10             	add    $0x10,%esp
c0008981:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008988:	eb 26                	jmp    c00089b0 <test_split_str+0x185>
c000898a:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008990:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008993:	01 d0                	add    %edx,%eax
c0008995:	0f b6 00             	movzbl (%eax),%eax
c0008998:	0f be c0             	movsbl %al,%eax
c000899b:	83 ec 08             	sub    $0x8,%esp
c000899e:	50                   	push   %eax
c000899f:	68 c8 a9 00 c0       	push   $0xc000a9c8
c00089a4:	e8 28 03 00 00       	call   c0008cd1 <Printf>
c00089a9:	83 c4 10             	add    $0x10,%esp
c00089ac:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00089b0:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c00089b4:	7e d4                	jle    c000898a <test_split_str+0x15f>
c00089b6:	c9                   	leave  
c00089b7:	c3                   	ret    

c00089b8 <test_shell>:
c00089b8:	55                   	push   %ebp
c00089b9:	89 e5                	mov    %esp,%ebp
c00089bb:	83 ec 48             	sub    $0x48,%esp
c00089be:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c00089c5:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c00089cc:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c00089d2:	83 ec 08             	sub    $0x8,%esp
c00089d5:	6a 02                	push   $0x2
c00089d7:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c00089da:	50                   	push   %eax
c00089db:	e8 35 d1 ff ff       	call   c0005b15 <open>
c00089e0:	83 c4 10             	add    $0x10,%esp
c00089e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00089e6:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c00089ed:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c00089f4:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c00089fb:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008a02:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008a09:	83 ec 0c             	sub    $0xc,%esp
c0008a0c:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008a0f:	50                   	push   %eax
c0008a10:	e8 62 eb ff ff       	call   c0007577 <untar>
c0008a15:	83 c4 10             	add    $0x10,%esp
c0008a18:	e8 ab d2 ff ff       	call   c0005cc8 <fork>
c0008a1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a20:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008a24:	7e 25                	jle    c0008a4b <test_shell+0x93>
c0008a26:	83 ec 0c             	sub    $0xc,%esp
c0008a29:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0008a2c:	50                   	push   %eax
c0008a2d:	e8 2f d2 ff ff       	call   c0005c61 <wait>
c0008a32:	83 c4 10             	add    $0x10,%esp
c0008a35:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008a38:	83 ec 08             	sub    $0x8,%esp
c0008a3b:	50                   	push   %eax
c0008a3c:	68 d1 a9 00 c0       	push   $0xc000a9d1
c0008a41:	e8 8b 02 00 00       	call   c0008cd1 <Printf>
c0008a46:	83 c4 10             	add    $0x10,%esp
c0008a49:	eb 23                	jmp    c0008a6e <test_shell+0xb6>
c0008a4b:	83 ec 0c             	sub    $0xc,%esp
c0008a4e:	68 e3 a9 00 c0       	push   $0xc000a9e3
c0008a53:	e8 79 02 00 00       	call   c0008cd1 <Printf>
c0008a58:	83 c4 10             	add    $0x10,%esp
c0008a5b:	83 ec 0c             	sub    $0xc,%esp
c0008a5e:	ff 75 f4             	pushl  -0xc(%ebp)
c0008a61:	e8 af d1 ff ff       	call   c0005c15 <close>
c0008a66:	83 c4 10             	add    $0x10,%esp
c0008a69:	e8 e6 fb ff ff       	call   c0008654 <simple_shell>
c0008a6e:	83 ec 0c             	sub    $0xc,%esp
c0008a71:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008a74:	50                   	push   %eax
c0008a75:	e8 e7 d1 ff ff       	call   c0005c61 <wait>
c0008a7a:	83 c4 10             	add    $0x10,%esp
c0008a7d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a80:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008a83:	83 ec 08             	sub    $0x8,%esp
c0008a86:	50                   	push   %eax
c0008a87:	68 f1 a9 00 c0       	push   $0xc000a9f1
c0008a8c:	e8 40 02 00 00       	call   c0008cd1 <Printf>
c0008a91:	83 c4 10             	add    $0x10,%esp
c0008a94:	eb d8                	jmp    c0008a6e <test_shell+0xb6>

c0008a96 <test_exec>:
c0008a96:	55                   	push   %ebp
c0008a97:	89 e5                	mov    %esp,%ebp
c0008a99:	83 ec 38             	sub    $0x38,%esp
c0008a9c:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008aa3:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008aaa:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008ab0:	83 ec 08             	sub    $0x8,%esp
c0008ab3:	6a 02                	push   $0x2
c0008ab5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008ab8:	50                   	push   %eax
c0008ab9:	e8 57 d0 ff ff       	call   c0005b15 <open>
c0008abe:	83 c4 10             	add    $0x10,%esp
c0008ac1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ac4:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0008acb:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0008ad2:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0008ad9:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008ae0:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008ae7:	83 ec 0c             	sub    $0xc,%esp
c0008aea:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0008aed:	50                   	push   %eax
c0008aee:	e8 84 ea ff ff       	call   c0007577 <untar>
c0008af3:	83 c4 10             	add    $0x10,%esp
c0008af6:	e8 cd d1 ff ff       	call   c0005cc8 <fork>
c0008afb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008afe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008b02:	7e 25                	jle    c0008b29 <test_exec+0x93>
c0008b04:	83 ec 0c             	sub    $0xc,%esp
c0008b07:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008b0a:	50                   	push   %eax
c0008b0b:	e8 51 d1 ff ff       	call   c0005c61 <wait>
c0008b10:	83 c4 10             	add    $0x10,%esp
c0008b13:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008b16:	83 ec 08             	sub    $0x8,%esp
c0008b19:	50                   	push   %eax
c0008b1a:	68 d1 a9 00 c0       	push   $0xc000a9d1
c0008b1f:	e8 ad 01 00 00       	call   c0008cd1 <Printf>
c0008b24:	83 c4 10             	add    $0x10,%esp
c0008b27:	eb 33                	jmp    c0008b5c <test_exec+0xc6>
c0008b29:	83 ec 0c             	sub    $0xc,%esp
c0008b2c:	68 e3 a9 00 c0       	push   $0xc000a9e3
c0008b31:	e8 9b 01 00 00       	call   c0008cd1 <Printf>
c0008b36:	83 c4 10             	add    $0x10,%esp
c0008b39:	83 ec 0c             	sub    $0xc,%esp
c0008b3c:	6a 00                	push   $0x0
c0008b3e:	68 0c aa 00 c0       	push   $0xc000aa0c
c0008b43:	68 12 aa 00 c0       	push   $0xc000aa12
c0008b48:	68 9a a9 00 c0       	push   $0xc000a99a
c0008b4d:	68 18 aa 00 c0       	push   $0xc000aa18
c0008b52:	e8 05 d4 ff ff       	call   c0005f5c <execl>
c0008b57:	83 c4 20             	add    $0x20,%esp
c0008b5a:	eb fe                	jmp    c0008b5a <test_exec+0xc4>
c0008b5c:	c9                   	leave  
c0008b5d:	c3                   	ret    

c0008b5e <INIT>:
c0008b5e:	55                   	push   %ebp
c0008b5f:	89 e5                	mov    %esp,%ebp
c0008b61:	83 ec 08             	sub    $0x8,%esp
c0008b64:	e8 4f fe ff ff       	call   c00089b8 <test_shell>
c0008b69:	eb fe                	jmp    c0008b69 <INIT+0xb>

c0008b6b <TestA>:
c0008b6b:	55                   	push   %ebp
c0008b6c:	89 e5                	mov    %esp,%ebp
c0008b6e:	83 ec 08             	sub    $0x8,%esp
c0008b71:	83 ec 0c             	sub    $0xc,%esp
c0008b74:	6a 05                	push   $0x5
c0008b76:	e8 ac ec ff ff       	call   c0007827 <disp_int>
c0008b7b:	83 c4 10             	add    $0x10,%esp
c0008b7e:	83 ec 0c             	sub    $0xc,%esp
c0008b81:	68 94 a5 00 c0       	push   $0xc000a594
c0008b86:	e8 01 8a ff ff       	call   c000158c <disp_str>
c0008b8b:	83 c4 10             	add    $0x10,%esp
c0008b8e:	83 ec 0c             	sub    $0xc,%esp
c0008b91:	68 1e aa 00 c0       	push   $0xc000aa1e
c0008b96:	e8 f1 89 ff ff       	call   c000158c <disp_str>
c0008b9b:	83 c4 10             	add    $0x10,%esp
c0008b9e:	eb fe                	jmp    c0008b9e <TestA+0x33>

c0008ba0 <delay>:
c0008ba0:	55                   	push   %ebp
c0008ba1:	89 e5                	mov    %esp,%ebp
c0008ba3:	83 ec 10             	sub    $0x10,%esp
c0008ba6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008bad:	eb 2d                	jmp    c0008bdc <delay+0x3c>
c0008baf:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008bb6:	eb 1a                	jmp    c0008bd2 <delay+0x32>
c0008bb8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008bbf:	eb 04                	jmp    c0008bc5 <delay+0x25>
c0008bc1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008bc5:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0008bcc:	7e f3                	jle    c0008bc1 <delay+0x21>
c0008bce:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008bd2:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008bd6:	7e e0                	jle    c0008bb8 <delay+0x18>
c0008bd8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008bdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008bdf:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008be2:	7c cb                	jl     c0008baf <delay+0xf>
c0008be4:	90                   	nop
c0008be5:	c9                   	leave  
c0008be6:	c3                   	ret    

c0008be7 <TestB>:
c0008be7:	55                   	push   %ebp
c0008be8:	89 e5                	mov    %esp,%ebp
c0008bea:	83 ec 08             	sub    $0x8,%esp
c0008bed:	83 ec 0c             	sub    $0xc,%esp
c0008bf0:	68 25 aa 00 c0       	push   $0xc000aa25
c0008bf5:	e8 92 89 ff ff       	call   c000158c <disp_str>
c0008bfa:	83 c4 10             	add    $0x10,%esp
c0008bfd:	eb fe                	jmp    c0008bfd <TestB+0x16>

c0008bff <TestC>:
c0008bff:	55                   	push   %ebp
c0008c00:	89 e5                	mov    %esp,%ebp
c0008c02:	83 ec 18             	sub    $0x18,%esp
c0008c05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008c0c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008c10:	77 1a                	ja     c0008c2c <TestC+0x2d>
c0008c12:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008c19:	83 ec 08             	sub    $0x8,%esp
c0008c1c:	ff 75 f0             	pushl  -0x10(%ebp)
c0008c1f:	68 28 aa 00 c0       	push   $0xc000aa28
c0008c24:	e8 a8 00 00 00       	call   c0008cd1 <Printf>
c0008c29:	83 c4 10             	add    $0x10,%esp
c0008c2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008c30:	eb da                	jmp    c0008c0c <TestC+0xd>

c0008c32 <sys_get_ticks>:
c0008c32:	55                   	push   %ebp
c0008c33:	89 e5                	mov    %esp,%ebp
c0008c35:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c0008c3a:	5d                   	pop    %ebp
c0008c3b:	c3                   	ret    

c0008c3c <sys_write>:
c0008c3c:	55                   	push   %ebp
c0008c3d:	89 e5                	mov    %esp,%ebp
c0008c3f:	83 ec 18             	sub    $0x18,%esp
c0008c42:	8b 45 10             	mov    0x10(%ebp),%eax
c0008c45:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0008c4b:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0008c51:	05 c0 fd 00 c0       	add    $0xc000fdc0,%eax
c0008c56:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008c59:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008c5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008c5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0008c62:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008c65:	eb 20                	jmp    c0008c87 <sys_write+0x4b>
c0008c67:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008c6a:	0f b6 00             	movzbl (%eax),%eax
c0008c6d:	0f b6 c0             	movzbl %al,%eax
c0008c70:	83 ec 08             	sub    $0x8,%esp
c0008c73:	50                   	push   %eax
c0008c74:	ff 75 ec             	pushl  -0x14(%ebp)
c0008c77:	e8 53 c2 ff ff       	call   c0004ecf <out_char>
c0008c7c:	83 c4 10             	add    $0x10,%esp
c0008c7f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008c83:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008c87:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008c8b:	7f da                	jg     c0008c67 <sys_write+0x2b>
c0008c8d:	90                   	nop
c0008c8e:	c9                   	leave  
c0008c8f:	c3                   	ret    

c0008c90 <milli_delay>:
c0008c90:	55                   	push   %ebp
c0008c91:	89 e5                	mov    %esp,%ebp
c0008c93:	83 ec 18             	sub    $0x18,%esp
c0008c96:	e8 1c 0d 00 00       	call   c00099b7 <get_ticks_ipc>
c0008c9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008c9e:	90                   	nop
c0008c9f:	e8 13 0d 00 00       	call   c00099b7 <get_ticks_ipc>
c0008ca4:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0008ca7:	89 c1                	mov    %eax,%ecx
c0008ca9:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0008cae:	89 c8                	mov    %ecx,%eax
c0008cb0:	f7 ea                	imul   %edx
c0008cb2:	c1 fa 05             	sar    $0x5,%edx
c0008cb5:	89 c8                	mov    %ecx,%eax
c0008cb7:	c1 f8 1f             	sar    $0x1f,%eax
c0008cba:	29 c2                	sub    %eax,%edx
c0008cbc:	89 d0                	mov    %edx,%eax
c0008cbe:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0008cc4:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008cc7:	77 d6                	ja     c0008c9f <milli_delay+0xf>
c0008cc9:	90                   	nop
c0008cca:	c9                   	leave  
c0008ccb:	c3                   	ret    

c0008ccc <TaskSys>:
c0008ccc:	55                   	push   %ebp
c0008ccd:	89 e5                	mov    %esp,%ebp
c0008ccf:	eb fe                	jmp    c0008ccf <TaskSys+0x3>

c0008cd1 <Printf>:
c0008cd1:	55                   	push   %ebp
c0008cd2:	89 e5                	mov    %esp,%ebp
c0008cd4:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008cda:	83 ec 04             	sub    $0x4,%esp
c0008cdd:	68 00 01 00 00       	push   $0x100
c0008ce2:	6a 00                	push   $0x0
c0008ce4:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008cea:	50                   	push   %eax
c0008ceb:	e8 e7 1f 00 00       	call   c000acd7 <Memset>
c0008cf0:	83 c4 10             	add    $0x10,%esp
c0008cf3:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008cf6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008cf9:	8b 45 08             	mov    0x8(%ebp),%eax
c0008cfc:	83 ec 04             	sub    $0x4,%esp
c0008cff:	ff 75 f4             	pushl  -0xc(%ebp)
c0008d02:	50                   	push   %eax
c0008d03:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008d09:	50                   	push   %eax
c0008d0a:	e8 20 00 00 00       	call   c0008d2f <vsprintf>
c0008d0f:	83 c4 10             	add    $0x10,%esp
c0008d12:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d15:	83 ec 04             	sub    $0x4,%esp
c0008d18:	ff 75 f0             	pushl  -0x10(%ebp)
c0008d1b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008d21:	50                   	push   %eax
c0008d22:	6a 00                	push   $0x0
c0008d24:	e8 97 ce ff ff       	call   c0005bc0 <write>
c0008d29:	83 c4 10             	add    $0x10,%esp
c0008d2c:	90                   	nop
c0008d2d:	c9                   	leave  
c0008d2e:	c3                   	ret    

c0008d2f <vsprintf>:
c0008d2f:	55                   	push   %ebp
c0008d30:	89 e5                	mov    %esp,%ebp
c0008d32:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008d38:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008d3e:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008d44:	83 ec 04             	sub    $0x4,%esp
c0008d47:	6a 40                	push   $0x40
c0008d49:	6a 00                	push   $0x0
c0008d4b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008d51:	50                   	push   %eax
c0008d52:	e8 80 1f 00 00       	call   c000acd7 <Memset>
c0008d57:	83 c4 10             	add    $0x10,%esp
c0008d5a:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d5d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d60:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008d67:	8b 45 08             	mov    0x8(%ebp),%eax
c0008d6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d6d:	e9 53 01 00 00       	jmp    c0008ec5 <vsprintf+0x196>
c0008d72:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d75:	0f b6 00             	movzbl (%eax),%eax
c0008d78:	3c 25                	cmp    $0x25,%al
c0008d7a:	74 16                	je     c0008d92 <vsprintf+0x63>
c0008d7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d7f:	8d 50 01             	lea    0x1(%eax),%edx
c0008d82:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008d85:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008d88:	0f b6 12             	movzbl (%edx),%edx
c0008d8b:	88 10                	mov    %dl,(%eax)
c0008d8d:	e9 2f 01 00 00       	jmp    c0008ec1 <vsprintf+0x192>
c0008d92:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008d96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d99:	0f b6 00             	movzbl (%eax),%eax
c0008d9c:	0f be c0             	movsbl %al,%eax
c0008d9f:	83 f8 64             	cmp    $0x64,%eax
c0008da2:	74 26                	je     c0008dca <vsprintf+0x9b>
c0008da4:	83 f8 64             	cmp    $0x64,%eax
c0008da7:	7f 0e                	jg     c0008db7 <vsprintf+0x88>
c0008da9:	83 f8 63             	cmp    $0x63,%eax
c0008dac:	0f 84 f2 00 00 00    	je     c0008ea4 <vsprintf+0x175>
c0008db2:	e9 0a 01 00 00       	jmp    c0008ec1 <vsprintf+0x192>
c0008db7:	83 f8 73             	cmp    $0x73,%eax
c0008dba:	0f 84 b0 00 00 00    	je     c0008e70 <vsprintf+0x141>
c0008dc0:	83 f8 78             	cmp    $0x78,%eax
c0008dc3:	74 5d                	je     c0008e22 <vsprintf+0xf3>
c0008dc5:	e9 f7 00 00 00       	jmp    c0008ec1 <vsprintf+0x192>
c0008dca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008dcd:	8b 00                	mov    (%eax),%eax
c0008dcf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008dd2:	83 ec 04             	sub    $0x4,%esp
c0008dd5:	6a 0a                	push   $0xa
c0008dd7:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0008ddd:	50                   	push   %eax
c0008dde:	ff 75 e8             	pushl  -0x18(%ebp)
c0008de1:	e8 1c 0c 00 00       	call   c0009a02 <itoa>
c0008de6:	83 c4 10             	add    $0x10,%esp
c0008de9:	83 ec 08             	sub    $0x8,%esp
c0008dec:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008df2:	50                   	push   %eax
c0008df3:	ff 75 f4             	pushl  -0xc(%ebp)
c0008df6:	e8 fb 1e 00 00       	call   c000acf6 <Strcpy>
c0008dfb:	83 c4 10             	add    $0x10,%esp
c0008dfe:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008e02:	83 ec 0c             	sub    $0xc,%esp
c0008e05:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008e0b:	50                   	push   %eax
c0008e0c:	e8 ff 1e 00 00       	call   c000ad10 <Strlen>
c0008e11:	83 c4 10             	add    $0x10,%esp
c0008e14:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e1a:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008e1d:	e9 9f 00 00 00       	jmp    c0008ec1 <vsprintf+0x192>
c0008e22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e25:	8b 00                	mov    (%eax),%eax
c0008e27:	83 ec 08             	sub    $0x8,%esp
c0008e2a:	50                   	push   %eax
c0008e2b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008e31:	50                   	push   %eax
c0008e32:	e8 4a e9 ff ff       	call   c0007781 <atoi>
c0008e37:	83 c4 10             	add    $0x10,%esp
c0008e3a:	83 ec 08             	sub    $0x8,%esp
c0008e3d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008e43:	50                   	push   %eax
c0008e44:	ff 75 f4             	pushl  -0xc(%ebp)
c0008e47:	e8 aa 1e 00 00       	call   c000acf6 <Strcpy>
c0008e4c:	83 c4 10             	add    $0x10,%esp
c0008e4f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008e53:	83 ec 0c             	sub    $0xc,%esp
c0008e56:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008e5c:	50                   	push   %eax
c0008e5d:	e8 ae 1e 00 00       	call   c000ad10 <Strlen>
c0008e62:	83 c4 10             	add    $0x10,%esp
c0008e65:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e6b:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008e6e:	eb 51                	jmp    c0008ec1 <vsprintf+0x192>
c0008e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e73:	8b 00                	mov    (%eax),%eax
c0008e75:	83 ec 08             	sub    $0x8,%esp
c0008e78:	50                   	push   %eax
c0008e79:	ff 75 f4             	pushl  -0xc(%ebp)
c0008e7c:	e8 75 1e 00 00       	call   c000acf6 <Strcpy>
c0008e81:	83 c4 10             	add    $0x10,%esp
c0008e84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e87:	8b 00                	mov    (%eax),%eax
c0008e89:	83 ec 0c             	sub    $0xc,%esp
c0008e8c:	50                   	push   %eax
c0008e8d:	e8 7e 1e 00 00       	call   c000ad10 <Strlen>
c0008e92:	83 c4 10             	add    $0x10,%esp
c0008e95:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e98:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008e9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e9f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008ea2:	eb 1d                	jmp    c0008ec1 <vsprintf+0x192>
c0008ea4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ea7:	0f b6 10             	movzbl (%eax),%edx
c0008eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ead:	88 10                	mov    %dl,(%eax)
c0008eaf:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008eb3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0008eba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ebd:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008ec0:	90                   	nop
c0008ec1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008ec5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ec8:	0f b6 00             	movzbl (%eax),%eax
c0008ecb:	84 c0                	test   %al,%al
c0008ecd:	0f 85 9f fe ff ff    	jne    c0008d72 <vsprintf+0x43>
c0008ed3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ed6:	2b 45 08             	sub    0x8(%ebp),%eax
c0008ed9:	c9                   	leave  
c0008eda:	c3                   	ret    

c0008edb <printx>:
c0008edb:	55                   	push   %ebp
c0008edc:	89 e5                	mov    %esp,%ebp
c0008ede:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008ee4:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008ee7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008eea:	8b 45 08             	mov    0x8(%ebp),%eax
c0008eed:	83 ec 04             	sub    $0x4,%esp
c0008ef0:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ef3:	50                   	push   %eax
c0008ef4:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008efa:	50                   	push   %eax
c0008efb:	e8 2f fe ff ff       	call   c0008d2f <vsprintf>
c0008f00:	83 c4 10             	add    $0x10,%esp
c0008f03:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f06:	83 ec 08             	sub    $0x8,%esp
c0008f09:	ff 75 f0             	pushl  -0x10(%ebp)
c0008f0c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008f12:	50                   	push   %eax
c0008f13:	e8 f0 97 ff ff       	call   c0002708 <write_debug>
c0008f18:	83 c4 10             	add    $0x10,%esp
c0008f1b:	90                   	nop
c0008f1c:	c9                   	leave  
c0008f1d:	c3                   	ret    

c0008f1e <sys_printx>:
c0008f1e:	55                   	push   %ebp
c0008f1f:	89 e5                	mov    %esp,%ebp
c0008f21:	83 ec 28             	sub    $0x28,%esp
c0008f24:	a1 64 f7 00 c0       	mov    0xc000f764,%eax
c0008f29:	85 c0                	test   %eax,%eax
c0008f2b:	75 23                	jne    c0008f50 <sys_printx+0x32>
c0008f2d:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f30:	8b 80 78 01 00 00    	mov    0x178(%eax),%eax
c0008f36:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f39:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f3c:	83 ec 08             	sub    $0x8,%esp
c0008f3f:	ff 75 10             	pushl  0x10(%ebp)
c0008f42:	50                   	push   %eax
c0008f43:	e8 8b ba ff ff       	call   c00049d3 <Seg2PhyAddrLDT>
c0008f48:	83 c4 10             	add    $0x10,%esp
c0008f4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f4e:	eb 19                	jmp    c0008f69 <sys_printx+0x4b>
c0008f50:	a1 64 f7 00 c0       	mov    0xc000f764,%eax
c0008f55:	85 c0                	test   %eax,%eax
c0008f57:	74 10                	je     c0008f69 <sys_printx+0x4b>
c0008f59:	83 ec 0c             	sub    $0xc,%esp
c0008f5c:	6a 30                	push   $0x30
c0008f5e:	e8 2f ba ff ff       	call   c0004992 <Seg2PhyAddr>
c0008f63:	83 c4 10             	add    $0x10,%esp
c0008f66:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f69:	8b 55 08             	mov    0x8(%ebp),%edx
c0008f6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f6f:	01 d0                	add    %edx,%eax
c0008f71:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008f74:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f77:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0008f7d:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0008f83:	05 c0 fd 00 c0       	add    $0xc000fdc0,%eax
c0008f88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008f8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008f8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f91:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f94:	0f b6 00             	movzbl (%eax),%eax
c0008f97:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0008f9a:	eb 3a                	jmp    c0008fd6 <sys_printx+0xb8>
c0008f9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f9f:	0f b6 00             	movzbl (%eax),%eax
c0008fa2:	3c 3b                	cmp    $0x3b,%al
c0008fa4:	74 0a                	je     c0008fb0 <sys_printx+0x92>
c0008fa6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fa9:	0f b6 00             	movzbl (%eax),%eax
c0008fac:	3c 3a                	cmp    $0x3a,%al
c0008fae:	75 06                	jne    c0008fb6 <sys_printx+0x98>
c0008fb0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008fb4:	eb 20                	jmp    c0008fd6 <sys_printx+0xb8>
c0008fb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fb9:	0f b6 00             	movzbl (%eax),%eax
c0008fbc:	0f b6 c0             	movzbl %al,%eax
c0008fbf:	83 ec 08             	sub    $0x8,%esp
c0008fc2:	50                   	push   %eax
c0008fc3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008fc6:	e8 04 bf ff ff       	call   c0004ecf <out_char>
c0008fcb:	83 c4 10             	add    $0x10,%esp
c0008fce:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008fd2:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0008fd6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0008fda:	7f c0                	jg     c0008f9c <sys_printx+0x7e>
c0008fdc:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0008fe0:	75 10                	jne    c0008ff2 <sys_printx+0xd4>
c0008fe2:	a1 64 f7 00 c0       	mov    0xc000f764,%eax
c0008fe7:	85 c0                	test   %eax,%eax
c0008fe9:	74 13                	je     c0008ffe <sys_printx+0xe0>
c0008feb:	e8 c5 87 ff ff       	call   c00017b5 <disable_int>
c0008ff0:	eb 0c                	jmp    c0008ffe <sys_printx+0xe0>
c0008ff2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0008ff6:	75 06                	jne    c0008ffe <sys_printx+0xe0>
c0008ff8:	e8 b8 87 ff ff       	call   c00017b5 <disable_int>
c0008ffd:	90                   	nop
c0008ffe:	90                   	nop
c0008fff:	c9                   	leave  
c0009000:	c3                   	ret    

c0009001 <spin>:
c0009001:	55                   	push   %ebp
c0009002:	89 e5                	mov    %esp,%ebp
c0009004:	eb fe                	jmp    c0009004 <spin+0x3>

c0009006 <panic>:
c0009006:	55                   	push   %ebp
c0009007:	89 e5                	mov    %esp,%ebp
c0009009:	83 ec 08             	sub    $0x8,%esp
c000900c:	83 ec 04             	sub    $0x4,%esp
c000900f:	ff 75 08             	pushl  0x8(%ebp)
c0009012:	6a 3a                	push   $0x3a
c0009014:	68 35 aa 00 c0       	push   $0xc000aa35
c0009019:	e8 bd fe ff ff       	call   c0008edb <printx>
c000901e:	83 c4 10             	add    $0x10,%esp
c0009021:	90                   	nop
c0009022:	c9                   	leave  
c0009023:	c3                   	ret    

c0009024 <assertion_failure>:
c0009024:	55                   	push   %ebp
c0009025:	89 e5                	mov    %esp,%ebp
c0009027:	83 ec 08             	sub    $0x8,%esp
c000902a:	83 ec 08             	sub    $0x8,%esp
c000902d:	ff 75 14             	pushl  0x14(%ebp)
c0009030:	ff 75 10             	pushl  0x10(%ebp)
c0009033:	ff 75 0c             	pushl  0xc(%ebp)
c0009036:	ff 75 08             	pushl  0x8(%ebp)
c0009039:	6a 3b                	push   $0x3b
c000903b:	68 3c aa 00 c0       	push   $0xc000aa3c
c0009040:	e8 96 fe ff ff       	call   c0008edb <printx>
c0009045:	83 c4 20             	add    $0x20,%esp
c0009048:	83 ec 0c             	sub    $0xc,%esp
c000904b:	68 6f aa 00 c0       	push   $0xc000aa6f
c0009050:	e8 ac ff ff ff       	call   c0009001 <spin>
c0009055:	83 c4 10             	add    $0x10,%esp
c0009058:	90                   	nop
c0009059:	c9                   	leave  
c000905a:	c3                   	ret    

c000905b <dead_lock>:
c000905b:	55                   	push   %ebp
c000905c:	89 e5                	mov    %esp,%ebp
c000905e:	b8 00 00 00 00       	mov    $0x0,%eax
c0009063:	5d                   	pop    %ebp
c0009064:	c3                   	ret    

c0009065 <sys_send_msg>:
c0009065:	55                   	push   %ebp
c0009066:	89 e5                	mov    %esp,%ebp
c0009068:	83 ec 48             	sub    $0x48,%esp
c000906b:	83 ec 0c             	sub    $0xc,%esp
c000906e:	ff 75 0c             	pushl  0xc(%ebp)
c0009071:	e8 28 b8 ff ff       	call   c000489e <pid2proc>
c0009076:	83 c4 10             	add    $0x10,%esp
c0009079:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000907c:	83 ec 0c             	sub    $0xc,%esp
c000907f:	ff 75 10             	pushl  0x10(%ebp)
c0009082:	e8 87 b8 ff ff       	call   c000490e <proc2pid>
c0009087:	83 c4 10             	add    $0x10,%esp
c000908a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000908d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009090:	8b 80 78 01 00 00    	mov    0x178(%eax),%eax
c0009096:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009099:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00090a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00090a3:	83 ec 08             	sub    $0x8,%esp
c00090a6:	6a 6c                	push   $0x6c
c00090a8:	50                   	push   %eax
c00090a9:	e8 c4 da ff ff       	call   c0006b72 <alloc_virtual_memory>
c00090ae:	83 c4 10             	add    $0x10,%esp
c00090b1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00090b4:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c00090bb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00090be:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00090c1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00090c4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00090c7:	89 10                	mov    %edx,(%eax)
c00090c9:	83 ec 08             	sub    $0x8,%esp
c00090cc:	ff 75 0c             	pushl  0xc(%ebp)
c00090cf:	ff 75 e8             	pushl  -0x18(%ebp)
c00090d2:	e8 84 ff ff ff       	call   c000905b <dead_lock>
c00090d7:	83 c4 10             	add    $0x10,%esp
c00090da:	83 f8 01             	cmp    $0x1,%eax
c00090dd:	75 10                	jne    c00090ef <sys_send_msg+0x8a>
c00090df:	83 ec 0c             	sub    $0xc,%esp
c00090e2:	68 7b aa 00 c0       	push   $0xc000aa7b
c00090e7:	e8 1a ff ff ff       	call   c0009006 <panic>
c00090ec:	83 c4 10             	add    $0x10,%esp
c00090ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090f2:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c00090f9:	3c 02                	cmp    $0x2,%al
c00090fb:	0f 85 b3 01 00 00    	jne    c00092b4 <sys_send_msg+0x24f>
c0009101:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009104:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c000910a:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000910d:	74 12                	je     c0009121 <sys_send_msg+0xbc>
c000910f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009112:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0009118:	83 f8 0e             	cmp    $0xe,%eax
c000911b:	0f 85 93 01 00 00    	jne    c00092b4 <sys_send_msg+0x24f>
c0009121:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009124:	8b 80 78 01 00 00    	mov    0x178(%eax),%eax
c000912a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000912d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009130:	83 ec 08             	sub    $0x8,%esp
c0009133:	ff 75 ec             	pushl  -0x14(%ebp)
c0009136:	50                   	push   %eax
c0009137:	e8 97 b8 ff ff       	call   c00049d3 <Seg2PhyAddrLDT>
c000913c:	83 c4 10             	add    $0x10,%esp
c000913f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009142:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009145:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c000914b:	83 ec 08             	sub    $0x8,%esp
c000914e:	6a 6c                	push   $0x6c
c0009150:	50                   	push   %eax
c0009151:	e8 1c da ff ff       	call   c0006b72 <alloc_virtual_memory>
c0009156:	83 c4 10             	add    $0x10,%esp
c0009159:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000915c:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000915f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0009162:	83 ec 04             	sub    $0x4,%esp
c0009165:	ff 75 d8             	pushl  -0x28(%ebp)
c0009168:	52                   	push   %edx
c0009169:	50                   	push   %eax
c000916a:	e8 3a 1b 00 00       	call   c000aca9 <Memcpy>
c000916f:	83 c4 10             	add    $0x10,%esp
c0009172:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009175:	c7 80 4c 01 00 00 00 	movl   $0x0,0x14c(%eax)
c000917c:	00 00 00 
c000917f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009182:	c6 80 48 01 00 00 00 	movb   $0x0,0x148(%eax)
c0009189:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000918c:	c7 80 54 01 00 00 1d 	movl   $0x1d,0x154(%eax)
c0009193:	00 00 00 
c0009196:	8b 45 10             	mov    0x10(%ebp),%eax
c0009199:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c00091a0:	00 00 00 
c00091a3:	83 ec 0c             	sub    $0xc,%esp
c00091a6:	ff 75 ec             	pushl  -0x14(%ebp)
c00091a9:	e8 b9 07 00 00       	call   c0009967 <unblock>
c00091ae:	83 c4 10             	add    $0x10,%esp
c00091b1:	8b 45 10             	mov    0x10(%ebp),%eax
c00091b4:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c00091ba:	85 c0                	test   %eax,%eax
c00091bc:	74 1c                	je     c00091da <sys_send_msg+0x175>
c00091be:	68 81 05 00 00       	push   $0x581
c00091c3:	68 86 aa 00 c0       	push   $0xc000aa86
c00091c8:	68 86 aa 00 c0       	push   $0xc000aa86
c00091cd:	68 96 aa 00 c0       	push   $0xc000aa96
c00091d2:	e8 4d fe ff ff       	call   c0009024 <assertion_failure>
c00091d7:	83 c4 10             	add    $0x10,%esp
c00091da:	8b 45 10             	mov    0x10(%ebp),%eax
c00091dd:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c00091e4:	84 c0                	test   %al,%al
c00091e6:	74 1c                	je     c0009204 <sys_send_msg+0x19f>
c00091e8:	68 82 05 00 00       	push   $0x582
c00091ed:	68 86 aa 00 c0       	push   $0xc000aa86
c00091f2:	68 86 aa 00 c0       	push   $0xc000aa86
c00091f7:	68 a9 aa 00 c0       	push   $0xc000aaa9
c00091fc:	e8 23 fe ff ff       	call   c0009024 <assertion_failure>
c0009201:	83 c4 10             	add    $0x10,%esp
c0009204:	8b 45 10             	mov    0x10(%ebp),%eax
c0009207:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c000920d:	83 f8 1d             	cmp    $0x1d,%eax
c0009210:	74 1c                	je     c000922e <sys_send_msg+0x1c9>
c0009212:	68 83 05 00 00       	push   $0x583
c0009217:	68 86 aa 00 c0       	push   $0xc000aa86
c000921c:	68 86 aa 00 c0       	push   $0xc000aa86
c0009221:	68 bd aa 00 c0       	push   $0xc000aabd
c0009226:	e8 f9 fd ff ff       	call   c0009024 <assertion_failure>
c000922b:	83 c4 10             	add    $0x10,%esp
c000922e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009231:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0009237:	85 c0                	test   %eax,%eax
c0009239:	74 1c                	je     c0009257 <sys_send_msg+0x1f2>
c000923b:	68 85 05 00 00       	push   $0x585
c0009240:	68 86 aa 00 c0       	push   $0xc000aa86
c0009245:	68 86 aa 00 c0       	push   $0xc000aa86
c000924a:	68 da aa 00 c0       	push   $0xc000aada
c000924f:	e8 d0 fd ff ff       	call   c0009024 <assertion_failure>
c0009254:	83 c4 10             	add    $0x10,%esp
c0009257:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000925a:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c0009261:	84 c0                	test   %al,%al
c0009263:	74 1c                	je     c0009281 <sys_send_msg+0x21c>
c0009265:	68 86 05 00 00       	push   $0x586
c000926a:	68 86 aa 00 c0       	push   $0xc000aa86
c000926f:	68 86 aa 00 c0       	push   $0xc000aa86
c0009274:	68 ef aa 00 c0       	push   $0xc000aaef
c0009279:	e8 a6 fd ff ff       	call   c0009024 <assertion_failure>
c000927e:	83 c4 10             	add    $0x10,%esp
c0009281:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009284:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c000928a:	83 f8 1d             	cmp    $0x1d,%eax
c000928d:	0f 84 45 01 00 00    	je     c00093d8 <sys_send_msg+0x373>
c0009293:	68 87 05 00 00       	push   $0x587
c0009298:	68 86 aa 00 c0       	push   $0xc000aa86
c000929d:	68 86 aa 00 c0       	push   $0xc000aa86
c00092a2:	68 08 ab 00 c0       	push   $0xc000ab08
c00092a7:	e8 78 fd ff ff       	call   c0009024 <assertion_failure>
c00092ac:	83 c4 10             	add    $0x10,%esp
c00092af:	e9 24 01 00 00       	jmp    c00093d8 <sys_send_msg+0x373>
c00092b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00092bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092be:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00092c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092c4:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c00092ca:	85 c0                	test   %eax,%eax
c00092cc:	75 1b                	jne    c00092e9 <sys_send_msg+0x284>
c00092ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092d1:	8b 55 10             	mov    0x10(%ebp),%edx
c00092d4:	89 90 58 01 00 00    	mov    %edx,0x158(%eax)
c00092da:	8b 45 10             	mov    0x10(%ebp),%eax
c00092dd:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c00092e4:	00 00 00 
c00092e7:	eb 3f                	jmp    c0009328 <sys_send_msg+0x2c3>
c00092e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092ec:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c00092f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00092f5:	eb 12                	jmp    c0009309 <sys_send_msg+0x2a4>
c00092f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009300:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0009306:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009309:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000930d:	75 e8                	jne    c00092f7 <sys_send_msg+0x292>
c000930f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009312:	8b 55 10             	mov    0x10(%ebp),%edx
c0009315:	89 90 5c 01 00 00    	mov    %edx,0x15c(%eax)
c000931b:	8b 45 10             	mov    0x10(%ebp),%eax
c000931e:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0009325:	00 00 00 
c0009328:	8b 45 10             	mov    0x10(%ebp),%eax
c000932b:	8b 55 08             	mov    0x8(%ebp),%edx
c000932e:	89 90 4c 01 00 00    	mov    %edx,0x14c(%eax)
c0009334:	8b 45 10             	mov    0x10(%ebp),%eax
c0009337:	8b 55 0c             	mov    0xc(%ebp),%edx
c000933a:	89 90 50 01 00 00    	mov    %edx,0x150(%eax)
c0009340:	8b 45 10             	mov    0x10(%ebp),%eax
c0009343:	c6 80 48 01 00 00 01 	movb   $0x1,0x148(%eax)
c000934a:	8b 45 10             	mov    0x10(%ebp),%eax
c000934d:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c0009354:	3c 01                	cmp    $0x1,%al
c0009356:	74 1c                	je     c0009374 <sys_send_msg+0x30f>
c0009358:	68 a8 05 00 00       	push   $0x5a8
c000935d:	68 86 aa 00 c0       	push   $0xc000aa86
c0009362:	68 86 aa 00 c0       	push   $0xc000aa86
c0009367:	68 2c ab 00 c0       	push   $0xc000ab2c
c000936c:	e8 b3 fc ff ff       	call   c0009024 <assertion_failure>
c0009371:	83 c4 10             	add    $0x10,%esp
c0009374:	8b 45 10             	mov    0x10(%ebp),%eax
c0009377:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c000937d:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009380:	74 1c                	je     c000939e <sys_send_msg+0x339>
c0009382:	68 a9 05 00 00       	push   $0x5a9
c0009387:	68 86 aa 00 c0       	push   $0xc000aa86
c000938c:	68 86 aa 00 c0       	push   $0xc000aa86
c0009391:	68 48 ab 00 c0       	push   $0xc000ab48
c0009396:	e8 89 fc ff ff       	call   c0009024 <assertion_failure>
c000939b:	83 c4 10             	add    $0x10,%esp
c000939e:	8b 45 10             	mov    0x10(%ebp),%eax
c00093a1:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c00093a7:	39 45 08             	cmp    %eax,0x8(%ebp)
c00093aa:	74 1c                	je     c00093c8 <sys_send_msg+0x363>
c00093ac:	68 aa 05 00 00       	push   $0x5aa
c00093b1:	68 86 aa 00 c0       	push   $0xc000aa86
c00093b6:	68 86 aa 00 c0       	push   $0xc000aa86
c00093bb:	68 6a ab 00 c0       	push   $0xc000ab6a
c00093c0:	e8 5f fc ff ff       	call   c0009024 <assertion_failure>
c00093c5:	83 c4 10             	add    $0x10,%esp
c00093c8:	83 ec 0c             	sub    $0xc,%esp
c00093cb:	ff 75 10             	pushl  0x10(%ebp)
c00093ce:	e8 58 05 00 00       	call   c000992b <block>
c00093d3:	83 c4 10             	add    $0x10,%esp
c00093d6:	eb 01                	jmp    c00093d9 <sys_send_msg+0x374>
c00093d8:	90                   	nop
c00093d9:	b8 00 00 00 00       	mov    $0x0,%eax
c00093de:	c9                   	leave  
c00093df:	c3                   	ret    

c00093e0 <sys_receive_msg>:
c00093e0:	55                   	push   %ebp
c00093e1:	89 e5                	mov    %esp,%ebp
c00093e3:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c00093e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00093f0:	83 ec 0c             	sub    $0xc,%esp
c00093f3:	ff 75 0c             	pushl  0xc(%ebp)
c00093f6:	e8 a3 b4 ff ff       	call   c000489e <pid2proc>
c00093fb:	83 c4 10             	add    $0x10,%esp
c00093fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009401:	83 ec 0c             	sub    $0xc,%esp
c0009404:	ff 75 10             	pushl  0x10(%ebp)
c0009407:	e8 02 b5 ff ff       	call   c000490e <proc2pid>
c000940c:	83 c4 10             	add    $0x10,%esp
c000940f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009412:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009419:	8b 45 10             	mov    0x10(%ebp),%eax
c000941c:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c0009422:	85 c0                	test   %eax,%eax
c0009424:	0f 84 85 00 00 00    	je     c00094af <sys_receive_msg+0xcf>
c000942a:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c000942e:	74 09                	je     c0009439 <sys_receive_msg+0x59>
c0009430:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0009437:	75 76                	jne    c00094af <sys_receive_msg+0xcf>
c0009439:	83 ec 04             	sub    $0x4,%esp
c000943c:	6a 6c                	push   $0x6c
c000943e:	6a 00                	push   $0x0
c0009440:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0009446:	50                   	push   %eax
c0009447:	e8 8b 18 00 00       	call   c000acd7 <Memset>
c000944c:	83 c4 10             	add    $0x10,%esp
c000944f:	c7 85 64 ff ff ff 13 	movl   $0x213,-0x9c(%ebp)
c0009456:	02 00 00 
c0009459:	c7 45 cc d5 07 00 00 	movl   $0x7d5,-0x34(%ebp)
c0009460:	83 ec 04             	sub    $0x4,%esp
c0009463:	6a 6c                	push   $0x6c
c0009465:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000946b:	50                   	push   %eax
c000946c:	ff 75 08             	pushl  0x8(%ebp)
c000946f:	e8 35 18 00 00       	call   c000aca9 <Memcpy>
c0009474:	83 c4 10             	add    $0x10,%esp
c0009477:	8b 45 10             	mov    0x10(%ebp),%eax
c000947a:	c7 80 60 01 00 00 00 	movl   $0x0,0x160(%eax)
c0009481:	00 00 00 
c0009484:	8b 45 10             	mov    0x10(%ebp),%eax
c0009487:	c7 80 54 01 00 00 1d 	movl   $0x1d,0x154(%eax)
c000948e:	00 00 00 
c0009491:	8b 45 10             	mov    0x10(%ebp),%eax
c0009494:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c000949b:	00 00 00 
c000949e:	8b 45 10             	mov    0x10(%ebp),%eax
c00094a1:	c6 80 48 01 00 00 00 	movb   $0x0,0x148(%eax)
c00094a8:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00094af:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c00094b3:	0f 84 6c 03 00 00    	je     c0009825 <sys_receive_msg+0x445>
c00094b9:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c00094bd:	75 26                	jne    c00094e5 <sys_receive_msg+0x105>
c00094bf:	8b 45 10             	mov    0x10(%ebp),%eax
c00094c2:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c00094c8:	85 c0                	test   %eax,%eax
c00094ca:	0f 84 8a 00 00 00    	je     c000955a <sys_receive_msg+0x17a>
c00094d0:	8b 45 10             	mov    0x10(%ebp),%eax
c00094d3:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c00094d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00094dc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00094e3:	eb 75                	jmp    c000955a <sys_receive_msg+0x17a>
c00094e5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00094e9:	78 6f                	js     c000955a <sys_receive_msg+0x17a>
c00094eb:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c00094ef:	7f 69                	jg     c000955a <sys_receive_msg+0x17a>
c00094f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094f4:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c00094fb:	3c 01                	cmp    $0x1,%al
c00094fd:	75 5b                	jne    c000955a <sys_receive_msg+0x17a>
c00094ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009502:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0009508:	83 f8 0e             	cmp    $0xe,%eax
c000950b:	74 0e                	je     c000951b <sys_receive_msg+0x13b>
c000950d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009510:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0009516:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009519:	75 3f                	jne    c000955a <sys_receive_msg+0x17a>
c000951b:	8b 45 10             	mov    0x10(%ebp),%eax
c000951e:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c0009524:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009527:	eb 2b                	jmp    c0009554 <sys_receive_msg+0x174>
c0009529:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000952c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000952f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009532:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c0009538:	8b 45 0c             	mov    0xc(%ebp),%eax
c000953b:	39 c2                	cmp    %eax,%edx
c000953d:	75 09                	jne    c0009548 <sys_receive_msg+0x168>
c000953f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009546:	eb 12                	jmp    c000955a <sys_receive_msg+0x17a>
c0009548:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000954b:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0009551:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009554:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009558:	75 cf                	jne    c0009529 <sys_receive_msg+0x149>
c000955a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000955e:	0f 85 4b 02 00 00    	jne    c00097af <sys_receive_msg+0x3cf>
c0009564:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009567:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000956a:	8b 45 08             	mov    0x8(%ebp),%eax
c000956d:	83 ec 08             	sub    $0x8,%esp
c0009570:	6a 6c                	push   $0x6c
c0009572:	50                   	push   %eax
c0009573:	e8 fa d5 ff ff       	call   c0006b72 <alloc_virtual_memory>
c0009578:	83 c4 10             	add    $0x10,%esp
c000957b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000957e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009581:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0009587:	83 ec 08             	sub    $0x8,%esp
c000958a:	6a 6c                	push   $0x6c
c000958c:	50                   	push   %eax
c000958d:	e8 e0 d5 ff ff       	call   c0006b72 <alloc_virtual_memory>
c0009592:	83 c4 10             	add    $0x10,%esp
c0009595:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009598:	83 ec 04             	sub    $0x4,%esp
c000959b:	6a 6c                	push   $0x6c
c000959d:	ff 75 d4             	pushl  -0x2c(%ebp)
c00095a0:	ff 75 d8             	pushl  -0x28(%ebp)
c00095a3:	e8 01 17 00 00       	call   c000aca9 <Memcpy>
c00095a8:	83 c4 10             	add    $0x10,%esp
c00095ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00095ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00095b1:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
c00095b5:	75 27                	jne    c00095de <sys_receive_msg+0x1fe>
c00095b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00095ba:	8b 40 68             	mov    0x68(%eax),%eax
c00095bd:	83 f8 06             	cmp    $0x6,%eax
c00095c0:	74 1c                	je     c00095de <sys_receive_msg+0x1fe>
c00095c2:	68 05 06 00 00       	push   $0x605
c00095c7:	68 86 aa 00 c0       	push   $0xc000aa86
c00095cc:	68 86 aa 00 c0       	push   $0xc000aa86
c00095d1:	68 7f ab 00 c0       	push   $0xc000ab7f
c00095d6:	e8 49 fa ff ff       	call   c0009024 <assertion_failure>
c00095db:	83 c4 10             	add    $0x10,%esp
c00095de:	8b 45 10             	mov    0x10(%ebp),%eax
c00095e1:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c00095e7:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00095ea:	75 21                	jne    c000960d <sys_receive_msg+0x22d>
c00095ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095ef:	8b 90 5c 01 00 00    	mov    0x15c(%eax),%edx
c00095f5:	8b 45 10             	mov    0x10(%ebp),%eax
c00095f8:	89 90 58 01 00 00    	mov    %edx,0x158(%eax)
c00095fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009601:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0009608:	00 00 00 
c000960b:	eb 1f                	jmp    c000962c <sys_receive_msg+0x24c>
c000960d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009610:	8b 90 5c 01 00 00    	mov    0x15c(%eax),%edx
c0009616:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009619:	89 90 5c 01 00 00    	mov    %edx,0x15c(%eax)
c000961f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009622:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0009629:	00 00 00 
c000962c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000962f:	c7 80 4c 01 00 00 00 	movl   $0x0,0x14c(%eax)
c0009636:	00 00 00 
c0009639:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000963c:	c6 80 48 01 00 00 00 	movb   $0x0,0x148(%eax)
c0009643:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009646:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c000964d:	00 00 00 
c0009650:	8b 45 10             	mov    0x10(%ebp),%eax
c0009653:	c7 80 4c 01 00 00 00 	movl   $0x0,0x14c(%eax)
c000965a:	00 00 00 
c000965d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009660:	c7 80 54 01 00 00 1d 	movl   $0x1d,0x154(%eax)
c0009667:	00 00 00 
c000966a:	8b 45 10             	mov    0x10(%ebp),%eax
c000966d:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c0009674:	00 00 00 
c0009677:	83 ec 0c             	sub    $0xc,%esp
c000967a:	ff 75 dc             	pushl  -0x24(%ebp)
c000967d:	e8 e5 02 00 00       	call   c0009967 <unblock>
c0009682:	83 c4 10             	add    $0x10,%esp
c0009685:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009688:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c000968e:	85 c0                	test   %eax,%eax
c0009690:	74 1c                	je     c00096ae <sys_receive_msg+0x2ce>
c0009692:	68 22 06 00 00       	push   $0x622
c0009697:	68 86 aa 00 c0       	push   $0xc000aa86
c000969c:	68 86 aa 00 c0       	push   $0xc000aa86
c00096a1:	68 91 ab 00 c0       	push   $0xc000ab91
c00096a6:	e8 79 f9 ff ff       	call   c0009024 <assertion_failure>
c00096ab:	83 c4 10             	add    $0x10,%esp
c00096ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00096b1:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c00096b8:	84 c0                	test   %al,%al
c00096ba:	74 1c                	je     c00096d8 <sys_receive_msg+0x2f8>
c00096bc:	68 23 06 00 00       	push   $0x623
c00096c1:	68 86 aa 00 c0       	push   $0xc000aa86
c00096c6:	68 86 aa 00 c0       	push   $0xc000aa86
c00096cb:	68 a9 ab 00 c0       	push   $0xc000aba9
c00096d0:	e8 4f f9 ff ff       	call   c0009024 <assertion_failure>
c00096d5:	83 c4 10             	add    $0x10,%esp
c00096d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00096db:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c00096e1:	83 f8 1d             	cmp    $0x1d,%eax
c00096e4:	74 1c                	je     c0009702 <sys_receive_msg+0x322>
c00096e6:	68 24 06 00 00       	push   $0x624
c00096eb:	68 86 aa 00 c0       	push   $0xc000aa86
c00096f0:	68 86 aa 00 c0       	push   $0xc000aa86
c00096f5:	68 c4 ab 00 c0       	push   $0xc000abc4
c00096fa:	e8 25 f9 ff ff       	call   c0009024 <assertion_failure>
c00096ff:	83 c4 10             	add    $0x10,%esp
c0009702:	8b 45 10             	mov    0x10(%ebp),%eax
c0009705:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c000970b:	85 c0                	test   %eax,%eax
c000970d:	74 1c                	je     c000972b <sys_receive_msg+0x34b>
c000970f:	68 26 06 00 00       	push   $0x626
c0009714:	68 86 aa 00 c0       	push   $0xc000aa86
c0009719:	68 86 aa 00 c0       	push   $0xc000aa86
c000971e:	68 da aa 00 c0       	push   $0xc000aada
c0009723:	e8 fc f8 ff ff       	call   c0009024 <assertion_failure>
c0009728:	83 c4 10             	add    $0x10,%esp
c000972b:	8b 45 10             	mov    0x10(%ebp),%eax
c000972e:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c0009735:	84 c0                	test   %al,%al
c0009737:	74 1c                	je     c0009755 <sys_receive_msg+0x375>
c0009739:	68 27 06 00 00       	push   $0x627
c000973e:	68 86 aa 00 c0       	push   $0xc000aa86
c0009743:	68 86 aa 00 c0       	push   $0xc000aa86
c0009748:	68 ef aa 00 c0       	push   $0xc000aaef
c000974d:	e8 d2 f8 ff ff       	call   c0009024 <assertion_failure>
c0009752:	83 c4 10             	add    $0x10,%esp
c0009755:	8b 45 10             	mov    0x10(%ebp),%eax
c0009758:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c000975e:	83 f8 1d             	cmp    $0x1d,%eax
c0009761:	74 1c                	je     c000977f <sys_receive_msg+0x39f>
c0009763:	68 28 06 00 00       	push   $0x628
c0009768:	68 86 aa 00 c0       	push   $0xc000aa86
c000976d:	68 86 aa 00 c0       	push   $0xc000aa86
c0009772:	68 08 ab 00 c0       	push   $0xc000ab08
c0009777:	e8 a8 f8 ff ff       	call   c0009024 <assertion_failure>
c000977c:	83 c4 10             	add    $0x10,%esp
c000977f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009782:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0009788:	83 f8 1d             	cmp    $0x1d,%eax
c000978b:	0f 84 8d 00 00 00    	je     c000981e <sys_receive_msg+0x43e>
c0009791:	68 29 06 00 00       	push   $0x629
c0009796:	68 86 aa 00 c0       	push   $0xc000aa86
c000979b:	68 86 aa 00 c0       	push   $0xc000aa86
c00097a0:	68 e8 ab 00 c0       	push   $0xc000abe8
c00097a5:	e8 7a f8 ff ff       	call   c0009024 <assertion_failure>
c00097aa:	83 c4 10             	add    $0x10,%esp
c00097ad:	eb 6f                	jmp    c000981e <sys_receive_msg+0x43e>
c00097af:	8b 45 10             	mov    0x10(%ebp),%eax
c00097b2:	c6 80 48 01 00 00 02 	movb   $0x2,0x148(%eax)
c00097b9:	8b 45 10             	mov    0x10(%ebp),%eax
c00097bc:	8b 55 08             	mov    0x8(%ebp),%edx
c00097bf:	89 90 4c 01 00 00    	mov    %edx,0x14c(%eax)
c00097c5:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c00097c9:	75 0f                	jne    c00097da <sys_receive_msg+0x3fa>
c00097cb:	8b 45 10             	mov    0x10(%ebp),%eax
c00097ce:	c7 80 54 01 00 00 0e 	movl   $0xe,0x154(%eax)
c00097d5:	00 00 00 
c00097d8:	eb 0c                	jmp    c00097e6 <sys_receive_msg+0x406>
c00097da:	8b 45 10             	mov    0x10(%ebp),%eax
c00097dd:	8b 55 0c             	mov    0xc(%ebp),%edx
c00097e0:	89 90 54 01 00 00    	mov    %edx,0x154(%eax)
c00097e6:	8b 45 10             	mov    0x10(%ebp),%eax
c00097e9:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c00097f0:	3c 02                	cmp    $0x2,%al
c00097f2:	74 1c                	je     c0009810 <sys_receive_msg+0x430>
c00097f4:	68 39 06 00 00       	push   $0x639
c00097f9:	68 86 aa 00 c0       	push   $0xc000aa86
c00097fe:	68 86 aa 00 c0       	push   $0xc000aa86
c0009803:	68 07 ac 00 c0       	push   $0xc000ac07
c0009808:	e8 17 f8 ff ff       	call   c0009024 <assertion_failure>
c000980d:	83 c4 10             	add    $0x10,%esp
c0009810:	83 ec 0c             	sub    $0xc,%esp
c0009813:	ff 75 10             	pushl  0x10(%ebp)
c0009816:	e8 10 01 00 00       	call   c000992b <block>
c000981b:	83 c4 10             	add    $0x10,%esp
c000981e:	b8 00 00 00 00       	mov    $0x0,%eax
c0009823:	eb 02                	jmp    c0009827 <sys_receive_msg+0x447>
c0009825:	90                   	nop
c0009826:	90                   	nop
c0009827:	c9                   	leave  
c0009828:	c3                   	ret    

c0009829 <disp_str_colour_debug>:
c0009829:	55                   	push   %ebp
c000982a:	89 e5                	mov    %esp,%ebp
c000982c:	90                   	nop
c000982d:	5d                   	pop    %ebp
c000982e:	c3                   	ret    

c000982f <send_rec>:
c000982f:	55                   	push   %ebp
c0009830:	89 e5                	mov    %esp,%ebp
c0009832:	83 ec 18             	sub    $0x18,%esp
c0009835:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009838:	83 ec 0c             	sub    $0xc,%esp
c000983b:	50                   	push   %eax
c000983c:	e8 9e d3 ff ff       	call   c0006bdf <get_physical_address>
c0009841:	83 c4 10             	add    $0x10,%esp
c0009844:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009847:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000984b:	74 28                	je     c0009875 <send_rec+0x46>
c000984d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009851:	74 22                	je     c0009875 <send_rec+0x46>
c0009853:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009857:	74 1c                	je     c0009875 <send_rec+0x46>
c0009859:	68 57 06 00 00       	push   $0x657
c000985e:	68 86 aa 00 c0       	push   $0xc000aa86
c0009863:	68 86 aa 00 c0       	push   $0xc000aa86
c0009868:	68 28 ac 00 c0       	push   $0xc000ac28
c000986d:	e8 b2 f7 ff ff       	call   c0009024 <assertion_failure>
c0009872:	83 c4 10             	add    $0x10,%esp
c0009875:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009879:	75 12                	jne    c000988d <send_rec+0x5e>
c000987b:	83 ec 04             	sub    $0x4,%esp
c000987e:	6a 6c                	push   $0x6c
c0009880:	6a 00                	push   $0x0
c0009882:	ff 75 0c             	pushl  0xc(%ebp)
c0009885:	e8 4d 14 00 00       	call   c000acd7 <Memset>
c000988a:	83 c4 10             	add    $0x10,%esp
c000988d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009891:	74 23                	je     c00098b6 <send_rec+0x87>
c0009893:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009897:	74 34                	je     c00098cd <send_rec+0x9e>
c0009899:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000989d:	75 72                	jne    c0009911 <send_rec+0xe2>
c000989f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098a2:	83 ec 08             	sub    $0x8,%esp
c00098a5:	ff 75 10             	pushl  0x10(%ebp)
c00098a8:	50                   	push   %eax
c00098a9:	e8 7a 8e ff ff       	call   c0002728 <send_msg>
c00098ae:	83 c4 10             	add    $0x10,%esp
c00098b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00098b4:	eb 6e                	jmp    c0009924 <send_rec+0xf5>
c00098b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098b9:	83 ec 08             	sub    $0x8,%esp
c00098bc:	ff 75 10             	pushl  0x10(%ebp)
c00098bf:	50                   	push   %eax
c00098c0:	e8 89 8e ff ff       	call   c000274e <receive_msg>
c00098c5:	83 c4 10             	add    $0x10,%esp
c00098c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00098cb:	eb 57                	jmp    c0009924 <send_rec+0xf5>
c00098cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098d0:	83 ec 08             	sub    $0x8,%esp
c00098d3:	ff 75 10             	pushl  0x10(%ebp)
c00098d6:	50                   	push   %eax
c00098d7:	e8 4c 8e ff ff       	call   c0002728 <send_msg>
c00098dc:	83 c4 10             	add    $0x10,%esp
c00098df:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00098e2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00098e6:	75 3b                	jne    c0009923 <send_rec+0xf4>
c00098e8:	83 ec 04             	sub    $0x4,%esp
c00098eb:	6a 6c                	push   $0x6c
c00098ed:	6a 00                	push   $0x0
c00098ef:	ff 75 0c             	pushl  0xc(%ebp)
c00098f2:	e8 e0 13 00 00       	call   c000acd7 <Memset>
c00098f7:	83 c4 10             	add    $0x10,%esp
c00098fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098fd:	83 ec 08             	sub    $0x8,%esp
c0009900:	ff 75 10             	pushl  0x10(%ebp)
c0009903:	50                   	push   %eax
c0009904:	e8 45 8e ff ff       	call   c000274e <receive_msg>
c0009909:	83 c4 10             	add    $0x10,%esp
c000990c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000990f:	eb 12                	jmp    c0009923 <send_rec+0xf4>
c0009911:	83 ec 0c             	sub    $0xc,%esp
c0009914:	68 64 ac 00 c0       	push   $0xc000ac64
c0009919:	e8 e8 f6 ff ff       	call   c0009006 <panic>
c000991e:	83 c4 10             	add    $0x10,%esp
c0009921:	eb 01                	jmp    c0009924 <send_rec+0xf5>
c0009923:	90                   	nop
c0009924:	b8 00 00 00 00       	mov    $0x0,%eax
c0009929:	c9                   	leave  
c000992a:	c3                   	ret    

c000992b <block>:
c000992b:	55                   	push   %ebp
c000992c:	89 e5                	mov    %esp,%ebp
c000992e:	83 ec 08             	sub    $0x8,%esp
c0009931:	8b 45 08             	mov    0x8(%ebp),%eax
c0009934:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c000993b:	84 c0                	test   %al,%al
c000993d:	75 1c                	jne    c000995b <block+0x30>
c000993f:	68 86 06 00 00       	push   $0x686
c0009944:	68 86 aa 00 c0       	push   $0xc000aa86
c0009949:	68 86 aa 00 c0       	push   $0xc000aa86
c000994e:	68 79 ac 00 c0       	push   $0xc000ac79
c0009953:	e8 cc f6 ff ff       	call   c0009024 <assertion_failure>
c0009958:	83 c4 10             	add    $0x10,%esp
c000995b:	e8 2e ae ff ff       	call   c000478e <schedule_process>
c0009960:	b8 00 00 00 00       	mov    $0x0,%eax
c0009965:	c9                   	leave  
c0009966:	c3                   	ret    

c0009967 <unblock>:
c0009967:	55                   	push   %ebp
c0009968:	89 e5                	mov    %esp,%ebp
c000996a:	83 ec 08             	sub    $0x8,%esp
c000996d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009970:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c0009977:	84 c0                	test   %al,%al
c0009979:	74 1c                	je     c0009997 <unblock+0x30>
c000997b:	68 8f 06 00 00       	push   $0x68f
c0009980:	68 86 aa 00 c0       	push   $0xc000aa86
c0009985:	68 86 aa 00 c0       	push   $0xc000aa86
c000998a:	68 91 ac 00 c0       	push   $0xc000ac91
c000998f:	e8 90 f6 ff ff       	call   c0009024 <assertion_failure>
c0009994:	83 c4 10             	add    $0x10,%esp
c0009997:	8b 45 08             	mov    0x8(%ebp),%eax
c000999a:	05 fc 00 00 00       	add    $0xfc,%eax
c000999f:	83 ec 08             	sub    $0x8,%esp
c00099a2:	50                   	push   %eax
c00099a3:	68 ac fd 00 c0       	push   $0xc000fdac
c00099a8:	e8 8c 05 00 00       	call   c0009f39 <insertToDoubleLinkList>
c00099ad:	83 c4 10             	add    $0x10,%esp
c00099b0:	b8 00 00 00 00       	mov    $0x0,%eax
c00099b5:	c9                   	leave  
c00099b6:	c3                   	ret    

c00099b7 <get_ticks_ipc>:
c00099b7:	55                   	push   %ebp
c00099b8:	89 e5                	mov    %esp,%ebp
c00099ba:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00099c0:	83 ec 04             	sub    $0x4,%esp
c00099c3:	6a 6c                	push   $0x6c
c00099c5:	6a 00                	push   $0x0
c00099c7:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00099ca:	50                   	push   %eax
c00099cb:	e8 07 13 00 00       	call   c000acd7 <Memset>
c00099d0:	83 c4 10             	add    $0x10,%esp
c00099d3:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c00099da:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00099e1:	83 ec 04             	sub    $0x4,%esp
c00099e4:	6a 01                	push   $0x1
c00099e6:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00099e9:	50                   	push   %eax
c00099ea:	6a 03                	push   $0x3
c00099ec:	e8 3e fe ff ff       	call   c000982f <send_rec>
c00099f1:	83 c4 10             	add    $0x10,%esp
c00099f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099f7:	8b 45 8c             	mov    -0x74(%ebp),%eax
c00099fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009a00:	c9                   	leave  
c0009a01:	c3                   	ret    

c0009a02 <itoa>:
c0009a02:	55                   	push   %ebp
c0009a03:	89 e5                	mov    %esp,%ebp
c0009a05:	53                   	push   %ebx
c0009a06:	83 ec 14             	sub    $0x14,%esp
c0009a09:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a0c:	99                   	cltd   
c0009a0d:	f7 7d 10             	idivl  0x10(%ebp)
c0009a10:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009a13:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a16:	99                   	cltd   
c0009a17:	f7 7d 10             	idivl  0x10(%ebp)
c0009a1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a1d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009a21:	74 14                	je     c0009a37 <itoa+0x35>
c0009a23:	83 ec 04             	sub    $0x4,%esp
c0009a26:	ff 75 10             	pushl  0x10(%ebp)
c0009a29:	ff 75 0c             	pushl  0xc(%ebp)
c0009a2c:	ff 75 f0             	pushl  -0x10(%ebp)
c0009a2f:	e8 ce ff ff ff       	call   c0009a02 <itoa>
c0009a34:	83 c4 10             	add    $0x10,%esp
c0009a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a3a:	8d 58 30             	lea    0x30(%eax),%ebx
c0009a3d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a40:	8b 00                	mov    (%eax),%eax
c0009a42:	8d 48 01             	lea    0x1(%eax),%ecx
c0009a45:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a48:	89 0a                	mov    %ecx,(%edx)
c0009a4a:	89 da                	mov    %ebx,%edx
c0009a4c:	88 10                	mov    %dl,(%eax)
c0009a4e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a51:	8b 00                	mov    (%eax),%eax
c0009a53:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009a56:	c9                   	leave  
c0009a57:	c3                   	ret    

c0009a58 <i2a>:
c0009a58:	55                   	push   %ebp
c0009a59:	89 e5                	mov    %esp,%ebp
c0009a5b:	53                   	push   %ebx
c0009a5c:	83 ec 14             	sub    $0x14,%esp
c0009a5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a62:	99                   	cltd   
c0009a63:	f7 7d 0c             	idivl  0xc(%ebp)
c0009a66:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009a69:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a6c:	99                   	cltd   
c0009a6d:	f7 7d 0c             	idivl  0xc(%ebp)
c0009a70:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a73:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009a77:	74 14                	je     c0009a8d <i2a+0x35>
c0009a79:	83 ec 04             	sub    $0x4,%esp
c0009a7c:	ff 75 10             	pushl  0x10(%ebp)
c0009a7f:	ff 75 0c             	pushl  0xc(%ebp)
c0009a82:	ff 75 f0             	pushl  -0x10(%ebp)
c0009a85:	e8 ce ff ff ff       	call   c0009a58 <i2a>
c0009a8a:	83 c4 10             	add    $0x10,%esp
c0009a8d:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009a91:	7f 0a                	jg     c0009a9d <i2a+0x45>
c0009a93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a96:	83 c0 30             	add    $0x30,%eax
c0009a99:	89 c3                	mov    %eax,%ebx
c0009a9b:	eb 08                	jmp    c0009aa5 <i2a+0x4d>
c0009a9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009aa0:	83 c0 37             	add    $0x37,%eax
c0009aa3:	89 c3                	mov    %eax,%ebx
c0009aa5:	8b 45 10             	mov    0x10(%ebp),%eax
c0009aa8:	8b 00                	mov    (%eax),%eax
c0009aaa:	8d 48 01             	lea    0x1(%eax),%ecx
c0009aad:	8b 55 10             	mov    0x10(%ebp),%edx
c0009ab0:	89 0a                	mov    %ecx,(%edx)
c0009ab2:	88 18                	mov    %bl,(%eax)
c0009ab4:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ab7:	8b 00                	mov    (%eax),%eax
c0009ab9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009abc:	c9                   	leave  
c0009abd:	c3                   	ret    

c0009abe <inform_int>:
c0009abe:	55                   	push   %ebp
c0009abf:	89 e5                	mov    %esp,%ebp
c0009ac1:	83 ec 18             	sub    $0x18,%esp
c0009ac4:	83 ec 0c             	sub    $0xc,%esp
c0009ac7:	ff 75 08             	pushl  0x8(%ebp)
c0009aca:	e8 cf ad ff ff       	call   c000489e <pid2proc>
c0009acf:	83 c4 10             	add    $0x10,%esp
c0009ad2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ad5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ad8:	0f b6 80 48 01 00 00 	movzbl 0x148(%eax),%eax
c0009adf:	0f be c0             	movsbl %al,%eax
c0009ae2:	83 e0 02             	and    $0x2,%eax
c0009ae5:	85 c0                	test   %eax,%eax
c0009ae7:	74 7e                	je     c0009b67 <inform_int+0xa9>
c0009ae9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009aec:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0009af2:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009af7:	74 0e                	je     c0009b07 <inform_int+0x49>
c0009af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009afc:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0009b02:	83 f8 0e             	cmp    $0xe,%eax
c0009b05:	75 6d                	jne    c0009b74 <inform_int+0xb6>
c0009b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b0a:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0009b10:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b19:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0009b1f:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b29:	c7 80 60 01 00 00 00 	movl   $0x0,0x160(%eax)
c0009b30:	00 00 00 
c0009b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b36:	c7 80 54 01 00 00 1d 	movl   $0x1d,0x154(%eax)
c0009b3d:	00 00 00 
c0009b40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b43:	c7 80 4c 01 00 00 00 	movl   $0x0,0x14c(%eax)
c0009b4a:	00 00 00 
c0009b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b50:	c6 80 48 01 00 00 00 	movb   $0x0,0x148(%eax)
c0009b57:	83 ec 0c             	sub    $0xc,%esp
c0009b5a:	ff 75 f4             	pushl  -0xc(%ebp)
c0009b5d:	e8 05 fe ff ff       	call   c0009967 <unblock>
c0009b62:	83 c4 10             	add    $0x10,%esp
c0009b65:	eb 0d                	jmp    c0009b74 <inform_int+0xb6>
c0009b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b6a:	c7 80 60 01 00 00 01 	movl   $0x1,0x160(%eax)
c0009b71:	00 00 00 
c0009b74:	90                   	nop
c0009b75:	c9                   	leave  
c0009b76:	c3                   	ret    

c0009b77 <strcmp>:
c0009b77:	55                   	push   %ebp
c0009b78:	89 e5                	mov    %esp,%ebp
c0009b7a:	83 ec 10             	sub    $0x10,%esp
c0009b7d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009b81:	74 06                	je     c0009b89 <strcmp+0x12>
c0009b83:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009b87:	75 08                	jne    c0009b91 <strcmp+0x1a>
c0009b89:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b8c:	2b 45 0c             	sub    0xc(%ebp),%eax
c0009b8f:	eb 53                	jmp    c0009be4 <strcmp+0x6d>
c0009b91:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b94:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009b97:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009b9a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009b9d:	eb 18                	jmp    c0009bb7 <strcmp+0x40>
c0009b9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009ba2:	0f b6 10             	movzbl (%eax),%edx
c0009ba5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009ba8:	0f b6 00             	movzbl (%eax),%eax
c0009bab:	38 c2                	cmp    %al,%dl
c0009bad:	75 1e                	jne    c0009bcd <strcmp+0x56>
c0009baf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009bb3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009bb7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009bba:	0f b6 00             	movzbl (%eax),%eax
c0009bbd:	84 c0                	test   %al,%al
c0009bbf:	74 0d                	je     c0009bce <strcmp+0x57>
c0009bc1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009bc4:	0f b6 00             	movzbl (%eax),%eax
c0009bc7:	84 c0                	test   %al,%al
c0009bc9:	75 d4                	jne    c0009b9f <strcmp+0x28>
c0009bcb:	eb 01                	jmp    c0009bce <strcmp+0x57>
c0009bcd:	90                   	nop
c0009bce:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009bd1:	0f b6 00             	movzbl (%eax),%eax
c0009bd4:	0f be d0             	movsbl %al,%edx
c0009bd7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009bda:	0f b6 00             	movzbl (%eax),%eax
c0009bdd:	0f be c0             	movsbl %al,%eax
c0009be0:	29 c2                	sub    %eax,%edx
c0009be2:	89 d0                	mov    %edx,%eax
c0009be4:	c9                   	leave  
c0009be5:	c3                   	ret    

c0009be6 <create_user_process_address_space>:
c0009be6:	55                   	push   %ebp
c0009be7:	89 e5                	mov    %esp,%ebp
c0009be9:	83 ec 18             	sub    $0x18,%esp
c0009bec:	83 ec 08             	sub    $0x8,%esp
c0009bef:	6a 00                	push   $0x0
c0009bf1:	6a 01                	push   $0x1
c0009bf3:	e8 19 d0 ff ff       	call   c0006c11 <alloc_memory>
c0009bf8:	83 c4 10             	add    $0x10,%esp
c0009bfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c01:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0009c08:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009c0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c12:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009c17:	c1 e8 0c             	shr    $0xc,%eax
c0009c1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009c1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009c20:	83 c0 07             	add    $0x7,%eax
c0009c23:	c1 e8 03             	shr    $0x3,%eax
c0009c26:	89 c2                	mov    %eax,%edx
c0009c28:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c2b:	89 50 04             	mov    %edx,0x4(%eax)
c0009c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c31:	8b 40 04             	mov    0x4(%eax),%eax
c0009c34:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009c39:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009c3f:	85 c0                	test   %eax,%eax
c0009c41:	0f 48 c2             	cmovs  %edx,%eax
c0009c44:	c1 f8 0c             	sar    $0xc,%eax
c0009c47:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009c4a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009c4d:	83 ec 08             	sub    $0x8,%esp
c0009c50:	6a 00                	push   $0x0
c0009c52:	50                   	push   %eax
c0009c53:	e8 b9 cf ff ff       	call   c0006c11 <alloc_memory>
c0009c58:	83 c4 10             	add    $0x10,%esp
c0009c5b:	89 c2                	mov    %eax,%edx
c0009c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c60:	89 10                	mov    %edx,(%eax)
c0009c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c65:	83 ec 0c             	sub    $0xc,%esp
c0009c68:	50                   	push   %eax
c0009c69:	e8 a1 ca ff ff       	call   c000670f <init_bitmap>
c0009c6e:	83 c4 10             	add    $0x10,%esp
c0009c71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c74:	c9                   	leave  
c0009c75:	c3                   	ret    

c0009c76 <user_process>:
c0009c76:	55                   	push   %ebp
c0009c77:	89 e5                	mov    %esp,%ebp
c0009c79:	83 ec 28             	sub    $0x28,%esp
c0009c7c:	e8 10 7c ff ff       	call   c0001891 <get_running_thread_pcb>
c0009c81:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009c84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c87:	05 00 10 00 00       	add    $0x1000,%eax
c0009c8c:	89 c2                	mov    %eax,%edx
c0009c8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c91:	89 10                	mov    %edx,(%eax)
c0009c93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c96:	8b 00                	mov    (%eax),%eax
c0009c98:	8d 90 f0 fe ff ff    	lea    -0x110(%eax),%edx
c0009c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ca1:	89 10                	mov    %edx,(%eax)
c0009ca3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ca6:	8b 00                	mov    (%eax),%eax
c0009ca8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009cab:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009caf:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c0009cb5:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c0009cbb:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c0009cc1:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009cc5:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c0009cc9:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009ccd:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c0009cd1:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009cd5:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c0009cd9:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c0009cdf:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c0009ce3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ce6:	89 50 34             	mov    %edx,0x34(%eax)
c0009ce9:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009ced:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cf0:	89 50 0c             	mov    %edx,0xc(%eax)
c0009cf3:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009cf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cfa:	89 50 04             	mov    %edx,0x4(%eax)
c0009cfd:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009d01:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d04:	89 50 08             	mov    %edx,0x8(%eax)
c0009d07:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009d0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d0e:	89 50 40             	mov    %edx,0x40(%eax)
c0009d11:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c0009d15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d18:	89 10                	mov    %edx,(%eax)
c0009d1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d1d:	8b 55 08             	mov    0x8(%ebp),%edx
c0009d20:	89 50 30             	mov    %edx,0x30(%eax)
c0009d23:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c0009d27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d2a:	89 50 38             	mov    %edx,0x38(%eax)
c0009d2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d30:	83 ec 0c             	sub    $0xc,%esp
c0009d33:	50                   	push   %eax
c0009d34:	e8 2d 7a ff ff       	call   c0001766 <restart>
c0009d39:	83 c4 10             	add    $0x10,%esp
c0009d3c:	90                   	nop
c0009d3d:	c9                   	leave  
c0009d3e:	c3                   	ret    

c0009d3f <process_execute>:
c0009d3f:	55                   	push   %ebp
c0009d40:	89 e5                	mov    %esp,%ebp
c0009d42:	83 ec 28             	sub    $0x28,%esp
c0009d45:	e8 9d 02 00 00       	call   c0009fe7 <thread_init>
c0009d4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009d4d:	83 ec 0c             	sub    $0xc,%esp
c0009d50:	ff 75 f4             	pushl  -0xc(%ebp)
c0009d53:	e8 f6 02 00 00       	call   c000a04e <thread_create>
c0009d58:	83 c4 10             	add    $0x10,%esp
c0009d5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d5e:	05 30 01 00 00       	add    $0x130,%eax
c0009d63:	83 ec 08             	sub    $0x8,%esp
c0009d66:	ff 75 10             	pushl  0x10(%ebp)
c0009d69:	50                   	push   %eax
c0009d6a:	e8 87 0f 00 00       	call   c000acf6 <Strcpy>
c0009d6f:	83 c4 10             	add    $0x10,%esp
c0009d72:	83 ec 08             	sub    $0x8,%esp
c0009d75:	6a 00                	push   $0x0
c0009d77:	6a 01                	push   $0x1
c0009d79:	e8 93 ce ff ff       	call   c0006c11 <alloc_memory>
c0009d7e:	83 c4 10             	add    $0x10,%esp
c0009d81:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009d84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d87:	05 00 0c 00 00       	add    $0xc00,%eax
c0009d8c:	83 ec 04             	sub    $0x4,%esp
c0009d8f:	68 00 04 00 00       	push   $0x400
c0009d94:	68 00 fc ff ff       	push   $0xfffffc00
c0009d99:	50                   	push   %eax
c0009d9a:	e8 0a 0f 00 00       	call   c000aca9 <Memcpy>
c0009d9f:	83 c4 10             	add    $0x10,%esp
c0009da2:	83 ec 0c             	sub    $0xc,%esp
c0009da5:	ff 75 f0             	pushl  -0x10(%ebp)
c0009da8:	e8 32 ce ff ff       	call   c0006bdf <get_physical_address>
c0009dad:	83 c4 10             	add    $0x10,%esp
c0009db0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009db3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009db6:	05 fc 0f 00 00       	add    $0xffc,%eax
c0009dbb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009dbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009dc1:	83 c8 07             	or     $0x7,%eax
c0009dc4:	89 c2                	mov    %eax,%edx
c0009dc6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009dc9:	89 10                	mov    %edx,(%eax)
c0009dcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dce:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0009dd1:	89 50 04             	mov    %edx,0x4(%eax)
c0009dd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dd7:	83 c0 0c             	add    $0xc,%eax
c0009dda:	83 ec 0c             	sub    $0xc,%esp
c0009ddd:	50                   	push   %eax
c0009dde:	e8 1a d3 ff ff       	call   c00070fd <init_memory_block_desc>
c0009de3:	83 c4 10             	add    $0x10,%esp
c0009de6:	e8 fb fd ff ff       	call   c0009be6 <create_user_process_address_space>
c0009deb:	89 c2                	mov    %eax,%edx
c0009ded:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009df0:	89 50 08             	mov    %edx,0x8(%eax)
c0009df3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009df6:	8b 00                	mov    (%eax),%eax
c0009df8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009dfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009dfe:	c7 40 10 76 9c 00 c0 	movl   $0xc0009c76,0x10(%eax)
c0009e05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e08:	8b 55 08             	mov    0x8(%ebp),%edx
c0009e0b:	89 50 18             	mov    %edx,0x18(%eax)
c0009e0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e11:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009e14:	89 50 1c             	mov    %edx,0x1c(%eax)
c0009e17:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0009e1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e1d:	89 50 20             	mov    %edx,0x20(%eax)
c0009e20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e23:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0009e29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e2c:	8b 10                	mov    (%eax),%edx
c0009e2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e31:	89 50 04             	mov    %edx,0x4(%eax)
c0009e34:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e37:	8b 50 04             	mov    0x4(%eax),%edx
c0009e3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e3d:	89 50 08             	mov    %edx,0x8(%eax)
c0009e40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e43:	8b 50 08             	mov    0x8(%eax),%edx
c0009e46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009e49:	89 50 0c             	mov    %edx,0xc(%eax)
c0009e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e4f:	05 fc 00 00 00       	add    $0xfc,%eax
c0009e54:	83 ec 08             	sub    $0x8,%esp
c0009e57:	50                   	push   %eax
c0009e58:	68 ac fd 00 c0       	push   $0xc000fdac
c0009e5d:	e8 92 00 00 00       	call   c0009ef4 <appendToDoubleLinkList>
c0009e62:	83 c4 10             	add    $0x10,%esp
c0009e65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e68:	05 04 01 00 00       	add    $0x104,%eax
c0009e6d:	83 ec 08             	sub    $0x8,%esp
c0009e70:	50                   	push   %eax
c0009e71:	68 f4 1e 01 c0       	push   $0xc0011ef4
c0009e76:	e8 79 00 00 00       	call   c0009ef4 <appendToDoubleLinkList>
c0009e7b:	83 c4 10             	add    $0x10,%esp
c0009e7e:	90                   	nop
c0009e7f:	c9                   	leave  
c0009e80:	c3                   	ret    
c0009e81:	66 90                	xchg   %ax,%ax
c0009e83:	66 90                	xchg   %ax,%ax
c0009e85:	66 90                	xchg   %ax,%ax
c0009e87:	66 90                	xchg   %ax,%ax
c0009e89:	66 90                	xchg   %ax,%ax
c0009e8b:	66 90                	xchg   %ax,%ax
c0009e8d:	66 90                	xchg   %ax,%ax
c0009e8f:	90                   	nop

c0009e90 <switch_to>:
c0009e90:	56                   	push   %esi
c0009e91:	57                   	push   %edi
c0009e92:	53                   	push   %ebx
c0009e93:	55                   	push   %ebp
c0009e94:	89 e5                	mov    %esp,%ebp
c0009e96:	8b 45 14             	mov    0x14(%ebp),%eax
c0009e99:	89 20                	mov    %esp,(%eax)
c0009e9b:	8b 45 18             	mov    0x18(%ebp),%eax
c0009e9e:	8b 20                	mov    (%eax),%esp
c0009ea0:	5d                   	pop    %ebp
c0009ea1:	5b                   	pop    %ebx
c0009ea2:	5f                   	pop    %edi
c0009ea3:	5e                   	pop    %esi
c0009ea4:	c3                   	ret    

c0009ea5 <initDoubleLinkList>:
c0009ea5:	55                   	push   %ebp
c0009ea6:	89 e5                	mov    %esp,%ebp
c0009ea8:	8b 45 08             	mov    0x8(%ebp),%eax
c0009eab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0009eb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009eb4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0009ebb:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ebe:	8d 50 08             	lea    0x8(%eax),%edx
c0009ec1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ec4:	89 50 04             	mov    %edx,0x4(%eax)
c0009ec7:	8b 55 08             	mov    0x8(%ebp),%edx
c0009eca:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ecd:	89 50 08             	mov    %edx,0x8(%eax)
c0009ed0:	90                   	nop
c0009ed1:	5d                   	pop    %ebp
c0009ed2:	c3                   	ret    

c0009ed3 <isListEmpty>:
c0009ed3:	55                   	push   %ebp
c0009ed4:	89 e5                	mov    %esp,%ebp
c0009ed6:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ed9:	8b 40 04             	mov    0x4(%eax),%eax
c0009edc:	8b 55 08             	mov    0x8(%ebp),%edx
c0009edf:	83 c2 08             	add    $0x8,%edx
c0009ee2:	39 d0                	cmp    %edx,%eax
c0009ee4:	75 07                	jne    c0009eed <isListEmpty+0x1a>
c0009ee6:	b8 01 00 00 00       	mov    $0x1,%eax
c0009eeb:	eb 05                	jmp    c0009ef2 <isListEmpty+0x1f>
c0009eed:	b8 00 00 00 00       	mov    $0x0,%eax
c0009ef2:	5d                   	pop    %ebp
c0009ef3:	c3                   	ret    

c0009ef4 <appendToDoubleLinkList>:
c0009ef4:	55                   	push   %ebp
c0009ef5:	89 e5                	mov    %esp,%ebp
c0009ef7:	83 ec 10             	sub    $0x10,%esp
c0009efa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009efd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009f00:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f03:	8b 50 08             	mov    0x8(%eax),%edx
c0009f06:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009f09:	89 10                	mov    %edx,(%eax)
c0009f0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f0e:	8b 40 08             	mov    0x8(%eax),%eax
c0009f11:	85 c0                	test   %eax,%eax
c0009f13:	74 0c                	je     c0009f21 <appendToDoubleLinkList+0x2d>
c0009f15:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f18:	8b 40 08             	mov    0x8(%eax),%eax
c0009f1b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0009f1e:	89 50 04             	mov    %edx,0x4(%eax)
c0009f21:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f24:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0009f27:	89 50 08             	mov    %edx,0x8(%eax)
c0009f2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f2d:	8d 50 08             	lea    0x8(%eax),%edx
c0009f30:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009f33:	89 50 04             	mov    %edx,0x4(%eax)
c0009f36:	90                   	nop
c0009f37:	c9                   	leave  
c0009f38:	c3                   	ret    

c0009f39 <insertToDoubleLinkList>:
c0009f39:	55                   	push   %ebp
c0009f3a:	89 e5                	mov    %esp,%ebp
c0009f3c:	83 ec 10             	sub    $0x10,%esp
c0009f3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009f42:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009f45:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f48:	8b 50 04             	mov    0x4(%eax),%edx
c0009f4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009f4e:	89 50 04             	mov    %edx,0x4(%eax)
c0009f51:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f54:	8b 40 04             	mov    0x4(%eax),%eax
c0009f57:	85 c0                	test   %eax,%eax
c0009f59:	74 0b                	je     c0009f66 <insertToDoubleLinkList+0x2d>
c0009f5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f5e:	8b 40 04             	mov    0x4(%eax),%eax
c0009f61:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0009f64:	89 10                	mov    %edx,(%eax)
c0009f66:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f69:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0009f6c:	89 50 04             	mov    %edx,0x4(%eax)
c0009f6f:	8b 55 08             	mov    0x8(%ebp),%edx
c0009f72:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009f75:	89 10                	mov    %edx,(%eax)
c0009f77:	90                   	nop
c0009f78:	c9                   	leave  
c0009f79:	c3                   	ret    

c0009f7a <popFromDoubleLinkList>:
c0009f7a:	55                   	push   %ebp
c0009f7b:	89 e5                	mov    %esp,%ebp
c0009f7d:	83 ec 10             	sub    $0x10,%esp
c0009f80:	ff 75 08             	pushl  0x8(%ebp)
c0009f83:	e8 4b ff ff ff       	call   c0009ed3 <isListEmpty>
c0009f88:	83 c4 04             	add    $0x4,%esp
c0009f8b:	3c 01                	cmp    $0x1,%al
c0009f8d:	75 07                	jne    c0009f96 <popFromDoubleLinkList+0x1c>
c0009f8f:	b8 00 00 00 00       	mov    $0x0,%eax
c0009f94:	eb 37                	jmp    c0009fcd <popFromDoubleLinkList+0x53>
c0009f96:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f99:	8b 40 08             	mov    0x8(%eax),%eax
c0009f9c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009f9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fa2:	8b 40 08             	mov    0x8(%eax),%eax
c0009fa5:	8b 00                	mov    (%eax),%eax
c0009fa7:	85 c0                	test   %eax,%eax
c0009fa9:	74 11                	je     c0009fbc <popFromDoubleLinkList+0x42>
c0009fab:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fae:	8b 40 08             	mov    0x8(%eax),%eax
c0009fb1:	8b 00                	mov    (%eax),%eax
c0009fb3:	8b 55 08             	mov    0x8(%ebp),%edx
c0009fb6:	83 c2 08             	add    $0x8,%edx
c0009fb9:	89 50 04             	mov    %edx,0x4(%eax)
c0009fbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fbf:	8b 40 08             	mov    0x8(%eax),%eax
c0009fc2:	8b 10                	mov    (%eax),%edx
c0009fc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fc7:	89 50 08             	mov    %edx,0x8(%eax)
c0009fca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009fcd:	c9                   	leave  
c0009fce:	c3                   	ret    

c0009fcf <kernel_thread>:
c0009fcf:	55                   	push   %ebp
c0009fd0:	89 e5                	mov    %esp,%ebp
c0009fd2:	83 ec 08             	sub    $0x8,%esp
c0009fd5:	fb                   	sti    
c0009fd6:	83 ec 0c             	sub    $0xc,%esp
c0009fd9:	ff 75 0c             	pushl  0xc(%ebp)
c0009fdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fdf:	ff d0                	call   *%eax
c0009fe1:	83 c4 10             	add    $0x10,%esp
c0009fe4:	90                   	nop
c0009fe5:	c9                   	leave  
c0009fe6:	c3                   	ret    

c0009fe7 <thread_init>:
c0009fe7:	55                   	push   %ebp
c0009fe8:	89 e5                	mov    %esp,%ebp
c0009fea:	83 ec 18             	sub    $0x18,%esp
c0009fed:	83 ec 08             	sub    $0x8,%esp
c0009ff0:	6a 00                	push   $0x0
c0009ff2:	6a 01                	push   $0x1
c0009ff4:	e8 18 cc ff ff       	call   c0006c11 <alloc_memory>
c0009ff9:	83 c4 10             	add    $0x10,%esp
c0009ffc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009fff:	83 ec 04             	sub    $0x4,%esp
c000a002:	68 00 10 00 00       	push   $0x1000
c000a007:	6a 00                	push   $0x0
c000a009:	ff 75 f4             	pushl  -0xc(%ebp)
c000a00c:	e8 c6 0c 00 00       	call   c000acd7 <Memset>
c000a011:	83 c4 10             	add    $0x10,%esp
c000a014:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a017:	05 00 10 00 00       	add    $0x1000,%eax
c000a01c:	89 c2                	mov    %eax,%edx
c000a01e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a021:	89 10                	mov    %edx,(%eax)
c000a023:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a026:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000a02d:	a1 50 f7 00 c0       	mov    0xc000f750,%eax
c000a032:	83 c0 01             	add    $0x1,%eax
c000a035:	a3 50 f7 00 c0       	mov    %eax,0xc000f750
c000a03a:	8b 15 50 f7 00 c0    	mov    0xc000f750,%edx
c000a040:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a043:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000a049:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a04c:	c9                   	leave  
c000a04d:	c3                   	ret    

c000a04e <thread_create>:
c000a04e:	55                   	push   %ebp
c000a04f:	89 e5                	mov    %esp,%ebp
c000a051:	83 ec 10             	sub    $0x10,%esp
c000a054:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000a05b:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000a062:	8b 45 08             	mov    0x8(%ebp),%eax
c000a065:	8b 00                	mov    (%eax),%eax
c000a067:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000a06a:	89 c2                	mov    %eax,%edx
c000a06c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a06f:	89 10                	mov    %edx,(%eax)
c000a071:	8b 45 08             	mov    0x8(%ebp),%eax
c000a074:	8b 00                	mov    (%eax),%eax
c000a076:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000a079:	89 c2                	mov    %eax,%edx
c000a07b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a07e:	89 10                	mov    %edx,(%eax)
c000a080:	90                   	nop
c000a081:	c9                   	leave  
c000a082:	c3                   	ret    

c000a083 <thread_start>:
c000a083:	55                   	push   %ebp
c000a084:	89 e5                	mov    %esp,%ebp
c000a086:	83 ec 18             	sub    $0x18,%esp
c000a089:	e8 59 ff ff ff       	call   c0009fe7 <thread_init>
c000a08e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a091:	83 ec 0c             	sub    $0xc,%esp
c000a094:	ff 75 f4             	pushl  -0xc(%ebp)
c000a097:	e8 b2 ff ff ff       	call   c000a04e <thread_create>
c000a09c:	83 c4 10             	add    $0x10,%esp
c000a09f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0a2:	05 30 01 00 00       	add    $0x130,%eax
c000a0a7:	83 ec 08             	sub    $0x8,%esp
c000a0aa:	ff 75 10             	pushl  0x10(%ebp)
c000a0ad:	50                   	push   %eax
c000a0ae:	e8 43 0c 00 00       	call   c000acf6 <Strcpy>
c000a0b3:	83 c4 10             	add    $0x10,%esp
c000a0b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0b9:	8b 00                	mov    (%eax),%eax
c000a0bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0c1:	c7 40 10 cf 9f 00 c0 	movl   $0xc0009fcf,0x10(%eax)
c000a0c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0cb:	8b 55 08             	mov    0x8(%ebp),%edx
c000a0ce:	89 50 18             	mov    %edx,0x18(%eax)
c000a0d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0d4:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a0d7:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a0da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0dd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a0e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0e6:	8b 10                	mov    (%eax),%edx
c000a0e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0eb:	89 50 04             	mov    %edx,0x4(%eax)
c000a0ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0f1:	8b 50 04             	mov    0x4(%eax),%edx
c000a0f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0f7:	89 50 08             	mov    %edx,0x8(%eax)
c000a0fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0fd:	8b 50 08             	mov    0x8(%eax),%edx
c000a100:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a103:	89 50 0c             	mov    %edx,0xc(%eax)
c000a106:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a109:	05 fc 00 00 00       	add    $0xfc,%eax
c000a10e:	83 ec 08             	sub    $0x8,%esp
c000a111:	50                   	push   %eax
c000a112:	68 ac fd 00 c0       	push   $0xc000fdac
c000a117:	e8 d8 fd ff ff       	call   c0009ef4 <appendToDoubleLinkList>
c000a11c:	83 c4 10             	add    $0x10,%esp
c000a11f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a122:	05 04 01 00 00       	add    $0x104,%eax
c000a127:	83 ec 08             	sub    $0x8,%esp
c000a12a:	50                   	push   %eax
c000a12b:	68 f4 1e 01 c0       	push   $0xc0011ef4
c000a130:	e8 bf fd ff ff       	call   c0009ef4 <appendToDoubleLinkList>
c000a135:	83 c4 10             	add    $0x10,%esp
c000a138:	90                   	nop
c000a139:	c9                   	leave  
c000a13a:	c3                   	ret    
