
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 9c e6 00 c0 00 	movl   $0x0,0xc000e69c
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	bc 60 de 00 c0       	mov    $0xc000de60,%esp
c000151a:	66 c7 05 9c e6 00 c0 	movw   $0x0,0xc000e69c
c0001521:	00 00 
c0001523:	0f 01 05 08 06 01 c0 	sgdtl  0xc0010608
c000152a:	e8 2a 5e 00 00       	call   c0007359 <ReloadGDT>
c000152f:	0f 01 15 08 06 01 c0 	lgdtl  0xc0010608
c0001536:	0f 01 1d 88 e6 00 c0 	lidtl  0xc000e688
c000153d:	ea 44 15 00 c0 08 00 	ljmp   $0x8,$0xc0001544

c0001544 <csinit>:
c0001544:	31 c0                	xor    %eax,%eax
c0001546:	66 b8 40 00          	mov    $0x40,%ax
c000154a:	0f 00 d8             	ltr    %ax
c000154d:	66 87 db             	xchg   %bx,%bx
c0001550:	e9 b0 0d 00 00       	jmp    c0002305 <kernel_main>
c0001555:	f4                   	hlt    
c0001556:	eb fe                	jmp    c0001556 <csinit+0x12>
c0001558:	fb                   	sti    
c0001559:	b4 0b                	mov    $0xb,%ah
c000155b:	b0 4d                	mov    $0x4d,%al
c000155d:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001564:	eb fe                	jmp    c0001564 <csinit+0x20>
c0001566:	f4                   	hlt    
c0001567:	6a 00                	push   $0x0
c0001569:	9d                   	popf   
c000156a:	eb fe                	jmp    c000156a <csinit+0x26>
c000156c:	e8 31 0c 00 00       	call   c00021a2 <test>
c0001571:	6a 01                	push   $0x1
c0001573:	6a 02                	push   $0x2
c0001575:	6a 03                	push   $0x3
c0001577:	f4                   	hlt    
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
c0001594:	8b 3d 9c e6 00 c0    	mov    0xc000e69c,%edi

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
c00015bd:	89 3d 9c e6 00 c0    	mov    %edi,0xc000e69c
c00015c3:	89 ec                	mov    %ebp,%esp
c00015c5:	5d                   	pop    %ebp
c00015c6:	c3                   	ret    

c00015c7 <disp_str_colour>:
c00015c7:	55                   	push   %ebp
c00015c8:	89 e5                	mov    %esp,%ebp
c00015ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00015cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00015d0:	8b 3d 9c e6 00 c0    	mov    0xc000e69c,%edi

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
c00015f9:	89 3d 9c e6 00 c0    	mov    %edi,0xc000e69c
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
c0001661:	e8 99 06 00 00       	call   c0001cff <exception_handler>
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
c000167a:	b0 f9                	mov    $0xf9,%al
c000167c:	e6 21                	out    %al,$0x21
c000167e:	b0 20                	mov    $0x20,%al
c0001680:	e6 20                	out    %al,$0x20
c0001682:	ff 05 a0 e6 00 c0    	incl   0xc000e6a0
c0001688:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c000168f:	75 05                	jne    c0001696 <hwint0.2>

c0001691 <hwint0.1>:
c0001691:	bc 60 e6 00 c0       	mov    $0xc000e660,%esp

c0001696 <hwint0.2>:
c0001696:	fb                   	sti    
c0001697:	e8 6e 59 00 00       	call   c000700a <clock_handler>
c000169c:	b0 f8                	mov    $0xf8,%al
c000169e:	e6 21                	out    %al,$0x21
c00016a0:	fa                   	cli    
c00016a1:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c00016a8:	0f 85 17 01 00 00    	jne    c00017c5 <reenter_restore>
c00016ae:	e9 fe 00 00 00       	jmp    c00017b1 <restore>

c00016b3 <hwint1>:
c00016b3:	60                   	pusha  
c00016b4:	1e                   	push   %ds
c00016b5:	06                   	push   %es
c00016b6:	0f a0                	push   %fs
c00016b8:	0f a8                	push   %gs
c00016ba:	66 8c d2             	mov    %ss,%dx
c00016bd:	8e da                	mov    %edx,%ds
c00016bf:	8e c2                	mov    %edx,%es
c00016c1:	8e e2                	mov    %edx,%fs
c00016c3:	b0 fa                	mov    $0xfa,%al
c00016c5:	e6 21                	out    %al,$0x21
c00016c7:	b0 20                	mov    $0x20,%al
c00016c9:	e6 20                	out    %al,$0x20
c00016cb:	ff 05 a0 e6 00 c0    	incl   0xc000e6a0
c00016d1:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c00016d8:	75 05                	jne    c00016df <hwint1.2>

c00016da <hwint1.1>:
c00016da:	bc 60 e6 00 c0       	mov    $0xc000e660,%esp

c00016df <hwint1.2>:
c00016df:	fb                   	sti    
c00016e0:	e8 27 67 00 00       	call   c0007e0c <keyboard_handler>
c00016e5:	b0 f8                	mov    $0xf8,%al
c00016e7:	e6 21                	out    %al,$0x21
c00016e9:	fa                   	cli    
c00016ea:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c00016f1:	0f 85 ce 00 00 00    	jne    c00017c5 <reenter_restore>
c00016f7:	e9 b5 00 00 00       	jmp    c00017b1 <restore>

c00016fc <hwint14>:
c00016fc:	60                   	pusha  
c00016fd:	1e                   	push   %ds
c00016fe:	06                   	push   %es
c00016ff:	0f a0                	push   %fs
c0001701:	0f a8                	push   %gs
c0001703:	66 8c d2             	mov    %ss,%dx
c0001706:	8e da                	mov    %edx,%ds
c0001708:	8e c2                	mov    %edx,%es
c000170a:	8e e2                	mov    %edx,%fs
c000170c:	b0 ff                	mov    $0xff,%al
c000170e:	e6 a1                	out    %al,$0xa1
c0001710:	b0 20                	mov    $0x20,%al
c0001712:	e6 20                	out    %al,$0x20
c0001714:	90                   	nop
c0001715:	e6 a0                	out    %al,$0xa0
c0001717:	ff 05 a0 e6 00 c0    	incl   0xc000e6a0
c000171d:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c0001724:	75 05                	jne    c000172b <hwint14.2>

c0001726 <hwint14.1>:
c0001726:	bc 60 e6 00 c0       	mov    $0xc000e660,%esp

c000172b <hwint14.2>:
c000172b:	fb                   	sti    
c000172c:	e8 bc 36 00 00       	call   c0004ded <hd_handler>
c0001731:	b0 bf                	mov    $0xbf,%al
c0001733:	e6 a1                	out    %al,$0xa1
c0001735:	fa                   	cli    
c0001736:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c000173d:	0f 85 82 00 00 00    	jne    c00017c5 <reenter_restore>
c0001743:	eb 6c                	jmp    c00017b1 <restore>

c0001745 <sys_call>:
c0001745:	60                   	pusha  
c0001746:	1e                   	push   %ds
c0001747:	06                   	push   %es
c0001748:	0f a0                	push   %fs
c000174a:	0f a8                	push   %gs
c000174c:	89 e6                	mov    %esp,%esi
c000174e:	66 8c d2             	mov    %ss,%dx
c0001751:	8e da                	mov    %edx,%ds
c0001753:	8e c2                	mov    %edx,%es
c0001755:	8e e2                	mov    %edx,%fs
c0001757:	ff 05 a0 e6 00 c0    	incl   0xc000e6a0
c000175d:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c0001764:	75 05                	jne    c000176b <sys_call.2>

c0001766 <sys_call.1>:
c0001766:	bc 60 e6 00 c0       	mov    $0xc000e660,%esp

c000176b <sys_call.2>:
c000176b:	fb                   	sti    
c000176c:	56                   	push   %esi
c000176d:	ff 35 c0 ea 00 c0    	pushl  0xc000eac0
c0001773:	53                   	push   %ebx
c0001774:	51                   	push   %ecx
c0001775:	ff 14 85 44 d0 00 c0 	call   *-0x3fff2fbc(,%eax,4)
c000177c:	83 c4 0c             	add    $0xc,%esp
c000177f:	5e                   	pop    %esi
c0001780:	89 46 2c             	mov    %eax,0x2c(%esi)
c0001783:	fa                   	cli    
c0001784:	83 3d a0 e6 00 c0 00 	cmpl   $0x0,0xc000e6a0
c000178b:	75 38                	jne    c00017c5 <reenter_restore>
c000178d:	eb 22                	jmp    c00017b1 <restore>

c000178f <restart>:
c000178f:	ff 0d a0 e6 00 c0    	decl   0xc000e6a0
c0001795:	8b 25 c0 ea 00 c0    	mov    0xc000eac0,%esp
c000179b:	0f 00 54 24 44       	lldt   0x44(%esp)
c00017a0:	8d 44 24 44          	lea    0x44(%esp),%eax
c00017a4:	a3 84 05 01 c0       	mov    %eax,0xc0010584
c00017a9:	0f a9                	pop    %gs
c00017ab:	0f a1                	pop    %fs
c00017ad:	07                   	pop    %es
c00017ae:	1f                   	pop    %ds
c00017af:	61                   	popa   
c00017b0:	cf                   	iret   

c00017b1 <restore>:
c00017b1:	8b 25 c0 ea 00 c0    	mov    0xc000eac0,%esp
c00017b7:	0f 00 54 24 44       	lldt   0x44(%esp)
c00017bc:	8d 44 24 44          	lea    0x44(%esp),%eax
c00017c0:	a3 84 05 01 c0       	mov    %eax,0xc0010584

c00017c5 <reenter_restore>:
c00017c5:	ff 0d a0 e6 00 c0    	decl   0xc000e6a0
c00017cb:	0f a9                	pop    %gs
c00017cd:	0f a1                	pop    %fs
c00017cf:	07                   	pop    %es
c00017d0:	1f                   	pop    %ds
c00017d1:	61                   	popa   
c00017d2:	cf                   	iret   

c00017d3 <in_byte>:
c00017d3:	31 d2                	xor    %edx,%edx
c00017d5:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017d9:	31 c0                	xor    %eax,%eax
c00017db:	ec                   	in     (%dx),%al
c00017dc:	90                   	nop
c00017dd:	90                   	nop
c00017de:	c3                   	ret    

c00017df <out_byte>:
c00017df:	31 d2                	xor    %edx,%edx
c00017e1:	31 c0                	xor    %eax,%eax
c00017e3:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017e7:	8a 44 24 08          	mov    0x8(%esp),%al
c00017eb:	ee                   	out    %al,(%dx)
c00017ec:	90                   	nop
c00017ed:	90                   	nop
c00017ee:	c3                   	ret    

c00017ef <in_byte2>:
c00017ef:	55                   	push   %ebp
c00017f0:	89 e5                	mov    %esp,%ebp
c00017f2:	52                   	push   %edx
c00017f3:	31 d2                	xor    %edx,%edx
c00017f5:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017f9:	31 c0                	xor    %eax,%eax
c00017fb:	ec                   	in     (%dx),%al
c00017fc:	90                   	nop
c00017fd:	90                   	nop
c00017fe:	5b                   	pop    %ebx
c00017ff:	5d                   	pop    %ebp
c0001800:	c3                   	ret    

c0001801 <disable_int>:
c0001801:	fa                   	cli    
c0001802:	c3                   	ret    

c0001803 <enable_int>:
c0001803:	fb                   	sti    
c0001804:	c3                   	ret    

c0001805 <check_tss_esp0>:
c0001805:	55                   	push   %ebp
c0001806:	89 e5                	mov    %esp,%ebp
c0001808:	8b 45 08             	mov    0x8(%ebp),%eax
c000180b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000180e:	83 c0 44             	add    $0x44,%eax
c0001811:	8b 15 84 05 01 c0    	mov    0xc0010584,%edx
c0001817:	39 d0                	cmp    %edx,%eax
c0001819:	74 7c                	je     c0001897 <check_tss_esp0.2>

c000181b <check_tss_esp0.1>:
c000181b:	50                   	push   %eax
c000181c:	52                   	push   %edx
c000181d:	68 10 d0 00 c0       	push   $0xc000d010
c0001822:	e8 65 fd ff ff       	call   c000158c <disp_str>
c0001827:	83 c4 04             	add    $0x4,%esp
c000182a:	5a                   	pop    %edx
c000182b:	58                   	pop    %eax
c000182c:	52                   	push   %edx
c000182d:	50                   	push   %eax
c000182e:	53                   	push   %ebx
c000182f:	e8 3d 03 00 00       	call   c0001b71 <disp_int>
c0001834:	83 c4 04             	add    $0x4,%esp
c0001837:	58                   	pop    %eax
c0001838:	5a                   	pop    %edx
c0001839:	52                   	push   %edx
c000183a:	50                   	push   %eax
c000183b:	e8 31 03 00 00       	call   c0001b71 <disp_int>
c0001840:	58                   	pop    %eax
c0001841:	5a                   	pop    %edx
c0001842:	52                   	push   %edx
c0001843:	50                   	push   %eax
c0001844:	ff 35 a0 e6 00 c0    	pushl  0xc000e6a0
c000184a:	e8 22 03 00 00       	call   c0001b71 <disp_int>
c000184f:	83 c4 04             	add    $0x4,%esp
c0001852:	58                   	pop    %eax
c0001853:	5a                   	pop    %edx
c0001854:	52                   	push   %edx
c0001855:	50                   	push   %eax
c0001856:	ff 72 ec             	pushl  -0x14(%edx)
c0001859:	e8 13 03 00 00       	call   c0001b71 <disp_int>
c000185e:	83 c4 04             	add    $0x4,%esp
c0001861:	58                   	pop    %eax
c0001862:	5a                   	pop    %edx
c0001863:	52                   	push   %edx
c0001864:	50                   	push   %eax
c0001865:	ff 70 ec             	pushl  -0x14(%eax)
c0001868:	e8 04 03 00 00       	call   c0001b71 <disp_int>
c000186d:	83 c4 04             	add    $0x4,%esp
c0001870:	58                   	pop    %eax
c0001871:	5a                   	pop    %edx
c0001872:	52                   	push   %edx
c0001873:	50                   	push   %eax
c0001874:	ff 35 c0 ea 00 c0    	pushl  0xc000eac0
c000187a:	e8 f2 02 00 00       	call   c0001b71 <disp_int>
c000187f:	83 c4 04             	add    $0x4,%esp
c0001882:	58                   	pop    %eax
c0001883:	5a                   	pop    %edx
c0001884:	52                   	push   %edx
c0001885:	50                   	push   %eax
c0001886:	68 60 e6 00 c0       	push   $0xc000e660
c000188b:	e8 e1 02 00 00       	call   c0001b71 <disp_int>
c0001890:	83 c4 04             	add    $0x4,%esp
c0001893:	58                   	pop    %eax
c0001894:	5a                   	pop    %edx
c0001895:	5d                   	pop    %ebp
c0001896:	c3                   	ret    

c0001897 <check_tss_esp0.2>:
c0001897:	5d                   	pop    %ebp
c0001898:	c3                   	ret    

c0001899 <enable_8259A_casecade_irq>:
c0001899:	9c                   	pushf  
c000189a:	fa                   	cli    
c000189b:	e4 21                	in     $0x21,%al
c000189d:	24 fb                	and    $0xfb,%al
c000189f:	e6 21                	out    %al,$0x21
c00018a1:	9d                   	popf   
c00018a2:	c3                   	ret    

c00018a3 <disable_8259A_casecade_irq>:
c00018a3:	9c                   	pushf  
c00018a4:	fa                   	cli    
c00018a5:	e4 21                	in     $0x21,%al
c00018a7:	0c 04                	or     $0x4,%al
c00018a9:	e6 21                	out    %al,$0x21
c00018ab:	9c                   	pushf  
c00018ac:	c3                   	ret    

c00018ad <enable_8259A_slave_winchester_irq>:
c00018ad:	9c                   	pushf  
c00018ae:	fa                   	cli    
c00018af:	e4 a1                	in     $0xa1,%al
c00018b1:	24 bf                	and    $0xbf,%al
c00018b3:	e6 a1                	out    %al,$0xa1
c00018b5:	9d                   	popf   
c00018b6:	c3                   	ret    

c00018b7 <disable_8259A_slave_winchester_irq>:
c00018b7:	9c                   	pushf  
c00018b8:	fa                   	cli    
c00018b9:	e4 a1                	in     $0xa1,%al
c00018bb:	0c 40                	or     $0x40,%al
c00018bd:	e6 a1                	out    %al,$0xa1
c00018bf:	9d                   	popf   
c00018c0:	c3                   	ret    

c00018c1 <untar>:
c00018c1:	55                   	push   %ebp
c00018c2:	89 e5                	mov    %esp,%ebp
c00018c4:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c00018ca:	83 ec 08             	sub    $0x8,%esp
c00018cd:	6a 00                	push   $0x0
c00018cf:	ff 75 08             	pushl  0x8(%ebp)
c00018d2:	e8 3c 69 00 00       	call   c0008213 <open>
c00018d7:	83 c4 10             	add    $0x10,%esp
c00018da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00018dd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00018e4:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00018eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00018f2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00018f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00018fd:	7e 58                	jle    c0001957 <untar+0x96>
c00018ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001902:	05 ff 01 00 00       	add    $0x1ff,%eax
c0001907:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000190d:	85 c0                	test   %eax,%eax
c000190f:	0f 48 c2             	cmovs  %edx,%eax
c0001912:	c1 f8 09             	sar    $0x9,%eax
c0001915:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0001918:	83 ec 04             	sub    $0x4,%esp
c000191b:	68 00 20 00 00       	push   $0x2000
c0001920:	6a 00                	push   $0x0
c0001922:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001928:	50                   	push   %eax
c0001929:	e8 81 88 00 00       	call   c000a1af <Memset>
c000192e:	83 c4 10             	add    $0x10,%esp
c0001931:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0001934:	c1 e0 09             	shl    $0x9,%eax
c0001937:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000193a:	83 ec 04             	sub    $0x4,%esp
c000193d:	50                   	push   %eax
c000193e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001944:	50                   	push   %eax
c0001945:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001948:	e8 1b 69 00 00       	call   c0008268 <read>
c000194d:	83 c4 10             	add    $0x10,%esp
c0001950:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001957:	83 ec 04             	sub    $0x4,%esp
c000195a:	68 00 20 00 00       	push   $0x2000
c000195f:	6a 00                	push   $0x0
c0001961:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001967:	50                   	push   %eax
c0001968:	e8 42 88 00 00       	call   c000a1af <Memset>
c000196d:	83 c4 10             	add    $0x10,%esp
c0001970:	83 ec 04             	sub    $0x4,%esp
c0001973:	68 00 02 00 00       	push   $0x200
c0001978:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000197e:	50                   	push   %eax
c000197f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001982:	e8 e1 68 00 00       	call   c0008268 <read>
c0001987:	83 c4 10             	add    $0x10,%esp
c000198a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000198d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0001991:	0f 84 1f 01 00 00    	je     c0001ab6 <untar+0x1f5>
c0001997:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000199a:	01 45 f4             	add    %eax,-0xc(%ebp)
c000199d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00019a4:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00019aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00019ad:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00019b0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00019b3:	83 ec 08             	sub    $0x8,%esp
c00019b6:	6a 07                	push   $0x7
c00019b8:	ff 75 cc             	pushl  -0x34(%ebp)
c00019bb:	e8 53 68 00 00       	call   c0008213 <open>
c00019c0:	83 c4 10             	add    $0x10,%esp
c00019c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00019c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00019cd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00019d0:	83 c0 7c             	add    $0x7c,%eax
c00019d3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00019d6:	83 ec 0c             	sub    $0xc,%esp
c00019d9:	ff 75 cc             	pushl  -0x34(%ebp)
c00019dc:	e8 07 88 00 00       	call   c000a1e8 <Strlen>
c00019e1:	83 c4 10             	add    $0x10,%esp
c00019e4:	85 c0                	test   %eax,%eax
c00019e6:	75 16                	jne    c00019fe <untar+0x13d>
c00019e8:	83 ec 0c             	sub    $0xc,%esp
c00019eb:	ff 75 c4             	pushl  -0x3c(%ebp)
c00019ee:	e8 f5 87 00 00       	call   c000a1e8 <Strlen>
c00019f3:	83 c4 10             	add    $0x10,%esp
c00019f6:	85 c0                	test   %eax,%eax
c00019f8:	0f 84 bb 00 00 00    	je     c0001ab9 <untar+0x1f8>
c00019fe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0001a01:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001a04:	eb 1f                	jmp    c0001a25 <untar+0x164>
c0001a06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a09:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0001a10:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001a13:	0f b6 00             	movzbl (%eax),%eax
c0001a16:	0f be c0             	movsbl %al,%eax
c0001a19:	83 e8 30             	sub    $0x30,%eax
c0001a1c:	01 d0                	add    %edx,%eax
c0001a1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001a21:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0001a25:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001a28:	0f b6 00             	movzbl (%eax),%eax
c0001a2b:	84 c0                	test   %al,%al
c0001a2d:	75 d7                	jne    c0001a06 <untar+0x145>
c0001a2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a32:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001a35:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0001a3c:	eb 5f                	jmp    c0001a9d <untar+0x1dc>
c0001a3e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001a41:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0001a44:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0001a48:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0001a4b:	83 ec 04             	sub    $0x4,%esp
c0001a4e:	68 00 02 00 00       	push   $0x200
c0001a53:	6a 00                	push   $0x0
c0001a55:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001a5b:	50                   	push   %eax
c0001a5c:	e8 4e 87 00 00       	call   c000a1af <Memset>
c0001a61:	83 c4 10             	add    $0x10,%esp
c0001a64:	83 ec 04             	sub    $0x4,%esp
c0001a67:	ff 75 bc             	pushl  -0x44(%ebp)
c0001a6a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001a70:	50                   	push   %eax
c0001a71:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001a74:	e8 ef 67 00 00       	call   c0008268 <read>
c0001a79:	83 c4 10             	add    $0x10,%esp
c0001a7c:	01 45 f4             	add    %eax,-0xc(%ebp)
c0001a7f:	83 ec 04             	sub    $0x4,%esp
c0001a82:	ff 75 bc             	pushl  -0x44(%ebp)
c0001a85:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001a8b:	50                   	push   %eax
c0001a8c:	ff 75 c8             	pushl  -0x38(%ebp)
c0001a8f:	e8 0b 68 00 00       	call   c000829f <write>
c0001a94:	83 c4 10             	add    $0x10,%esp
c0001a97:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0001a9a:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0001a9d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0001aa1:	75 9b                	jne    c0001a3e <untar+0x17d>
c0001aa3:	83 ec 0c             	sub    $0xc,%esp
c0001aa6:	ff 75 c8             	pushl  -0x38(%ebp)
c0001aa9:	e8 28 68 00 00       	call   c00082d6 <close>
c0001aae:	83 c4 10             	add    $0x10,%esp
c0001ab1:	e9 43 fe ff ff       	jmp    c00018f9 <untar+0x38>
c0001ab6:	90                   	nop
c0001ab7:	eb 01                	jmp    c0001aba <untar+0x1f9>
c0001ab9:	90                   	nop
c0001aba:	83 ec 0c             	sub    $0xc,%esp
c0001abd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001ac0:	e8 11 68 00 00       	call   c00082d6 <close>
c0001ac5:	83 c4 10             	add    $0x10,%esp
c0001ac8:	90                   	nop
c0001ac9:	c9                   	leave  
c0001aca:	c3                   	ret    

c0001acb <atoi>:
c0001acb:	55                   	push   %ebp
c0001acc:	89 e5                	mov    %esp,%ebp
c0001ace:	83 ec 10             	sub    $0x10,%esp
c0001ad1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ad4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0001ad7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0001ada:	8d 50 01             	lea    0x1(%eax),%edx
c0001add:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0001ae0:	c6 00 30             	movb   $0x30,(%eax)
c0001ae3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0001ae6:	8d 50 01             	lea    0x1(%eax),%edx
c0001ae9:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0001aec:	c6 00 78             	movb   $0x78,(%eax)
c0001aef:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0001af3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0001af7:	75 0e                	jne    c0001b07 <atoi+0x3c>
c0001af9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0001afc:	8d 50 01             	lea    0x1(%eax),%edx
c0001aff:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0001b02:	c6 00 30             	movb   $0x30,(%eax)
c0001b05:	eb 61                	jmp    c0001b68 <atoi+0x9d>
c0001b07:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0001b0e:	eb 52                	jmp    c0001b62 <atoi+0x97>
c0001b10:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001b13:	8b 55 0c             	mov    0xc(%ebp),%edx
c0001b16:	89 c1                	mov    %eax,%ecx
c0001b18:	d3 fa                	sar    %cl,%edx
c0001b1a:	89 d0                	mov    %edx,%eax
c0001b1c:	83 e0 0f             	and    $0xf,%eax
c0001b1f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0001b22:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0001b26:	75 06                	jne    c0001b2e <atoi+0x63>
c0001b28:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0001b2c:	74 2f                	je     c0001b5d <atoi+0x92>
c0001b2e:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0001b32:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0001b36:	83 c0 30             	add    $0x30,%eax
c0001b39:	88 45 fb             	mov    %al,-0x5(%ebp)
c0001b3c:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0001b40:	7e 0a                	jle    c0001b4c <atoi+0x81>
c0001b42:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0001b46:	83 c0 07             	add    $0x7,%eax
c0001b49:	88 45 fb             	mov    %al,-0x5(%ebp)
c0001b4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0001b4f:	8d 50 01             	lea    0x1(%eax),%edx
c0001b52:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0001b55:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0001b59:	88 10                	mov    %dl,(%eax)
c0001b5b:	eb 01                	jmp    c0001b5e <atoi+0x93>
c0001b5d:	90                   	nop
c0001b5e:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0001b62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001b66:	79 a8                	jns    c0001b10 <atoi+0x45>
c0001b68:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0001b6b:	c6 00 00             	movb   $0x0,(%eax)
c0001b6e:	90                   	nop
c0001b6f:	c9                   	leave  
c0001b70:	c3                   	ret    

c0001b71 <disp_int>:
c0001b71:	55                   	push   %ebp
c0001b72:	89 e5                	mov    %esp,%ebp
c0001b74:	83 ec 18             	sub    $0x18,%esp
c0001b77:	ff 75 08             	pushl  0x8(%ebp)
c0001b7a:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0001b7d:	50                   	push   %eax
c0001b7e:	e8 48 ff ff ff       	call   c0001acb <atoi>
c0001b83:	83 c4 08             	add    $0x8,%esp
c0001b86:	83 ec 08             	sub    $0x8,%esp
c0001b89:	6a 0b                	push   $0xb
c0001b8b:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0001b8e:	50                   	push   %eax
c0001b8f:	e8 33 fa ff ff       	call   c00015c7 <disp_str_colour>
c0001b94:	83 c4 10             	add    $0x10,%esp
c0001b97:	90                   	nop
c0001b98:	c9                   	leave  
c0001b99:	c3                   	ret    

c0001b9a <do_page_fault>:
c0001b9a:	55                   	push   %ebp
c0001b9b:	89 e5                	mov    %esp,%ebp
c0001b9d:	83 ec 28             	sub    $0x28,%esp
c0001ba0:	0f 20 d0             	mov    %cr2,%eax
c0001ba3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001ba6:	83 ec 0c             	sub    $0xc,%esp
c0001ba9:	68 20 97 00 c0       	push   $0xc0009720
c0001bae:	e8 d9 f9 ff ff       	call   c000158c <disp_str>
c0001bb3:	83 c4 10             	add    $0x10,%esp
c0001bb6:	83 ec 0c             	sub    $0xc,%esp
c0001bb9:	68 2f 97 00 c0       	push   $0xc000972f
c0001bbe:	e8 c9 f9 ff ff       	call   c000158c <disp_str>
c0001bc3:	83 c4 10             	add    $0x10,%esp
c0001bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001bc9:	83 ec 0c             	sub    $0xc,%esp
c0001bcc:	50                   	push   %eax
c0001bcd:	e8 9f ff ff ff       	call   c0001b71 <disp_int>
c0001bd2:	83 c4 10             	add    $0x10,%esp
c0001bd5:	83 ec 0c             	sub    $0xc,%esp
c0001bd8:	68 34 97 00 c0       	push   $0xc0009734
c0001bdd:	e8 aa f9 ff ff       	call   c000158c <disp_str>
c0001be2:	83 c4 10             	add    $0x10,%esp
c0001be5:	83 ec 0c             	sub    $0xc,%esp
c0001be8:	ff 75 f4             	pushl  -0xc(%ebp)
c0001beb:	e8 2f 76 00 00       	call   c000921f <ptr_pde>
c0001bf0:	83 c4 10             	add    $0x10,%esp
c0001bf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001bf6:	83 ec 0c             	sub    $0xc,%esp
c0001bf9:	ff 75 f4             	pushl  -0xc(%ebp)
c0001bfc:	e8 31 76 00 00       	call   c0009232 <ptr_pte>
c0001c01:	83 c4 10             	add    $0x10,%esp
c0001c04:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001c07:	83 ec 0c             	sub    $0xc,%esp
c0001c0a:	68 36 97 00 c0       	push   $0xc0009736
c0001c0f:	e8 78 f9 ff ff       	call   c000158c <disp_str>
c0001c14:	83 c4 10             	add    $0x10,%esp
c0001c17:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001c1a:	83 ec 0c             	sub    $0xc,%esp
c0001c1d:	50                   	push   %eax
c0001c1e:	e8 4e ff ff ff       	call   c0001b71 <disp_int>
c0001c23:	83 c4 10             	add    $0x10,%esp
c0001c26:	83 ec 0c             	sub    $0xc,%esp
c0001c29:	68 3b 97 00 c0       	push   $0xc000973b
c0001c2e:	e8 59 f9 ff ff       	call   c000158c <disp_str>
c0001c33:	83 c4 10             	add    $0x10,%esp
c0001c36:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001c39:	8b 00                	mov    (%eax),%eax
c0001c3b:	83 ec 0c             	sub    $0xc,%esp
c0001c3e:	50                   	push   %eax
c0001c3f:	e8 2d ff ff ff       	call   c0001b71 <disp_int>
c0001c44:	83 c4 10             	add    $0x10,%esp
c0001c47:	83 ec 0c             	sub    $0xc,%esp
c0001c4a:	68 34 97 00 c0       	push   $0xc0009734
c0001c4f:	e8 38 f9 ff ff       	call   c000158c <disp_str>
c0001c54:	83 c4 10             	add    $0x10,%esp
c0001c57:	83 ec 0c             	sub    $0xc,%esp
c0001c5a:	68 44 97 00 c0       	push   $0xc0009744
c0001c5f:	e8 28 f9 ff ff       	call   c000158c <disp_str>
c0001c64:	83 c4 10             	add    $0x10,%esp
c0001c67:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001c6a:	83 ec 0c             	sub    $0xc,%esp
c0001c6d:	50                   	push   %eax
c0001c6e:	e8 fe fe ff ff       	call   c0001b71 <disp_int>
c0001c73:	83 c4 10             	add    $0x10,%esp
c0001c76:	83 ec 0c             	sub    $0xc,%esp
c0001c79:	68 49 97 00 c0       	push   $0xc0009749
c0001c7e:	e8 09 f9 ff ff       	call   c000158c <disp_str>
c0001c83:	83 c4 10             	add    $0x10,%esp
c0001c86:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001c89:	8b 00                	mov    (%eax),%eax
c0001c8b:	83 ec 0c             	sub    $0xc,%esp
c0001c8e:	50                   	push   %eax
c0001c8f:	e8 dd fe ff ff       	call   c0001b71 <disp_int>
c0001c94:	83 c4 10             	add    $0x10,%esp
c0001c97:	83 ec 0c             	sub    $0xc,%esp
c0001c9a:	68 34 97 00 c0       	push   $0xc0009734
c0001c9f:	e8 e8 f8 ff ff       	call   c000158c <disp_str>
c0001ca4:	83 c4 10             	add    $0x10,%esp
c0001ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001caa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0001caf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001cb2:	83 ec 0c             	sub    $0xc,%esp
c0001cb5:	6a 00                	push   $0x0
c0001cb7:	e8 63 74 00 00       	call   c000911f <get_a_page>
c0001cbc:	83 c4 10             	add    $0x10,%esp
c0001cbf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001cc2:	83 ec 08             	sub    $0x8,%esp
c0001cc5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001cc8:	ff 75 e8             	pushl  -0x18(%ebp)
c0001ccb:	e8 89 75 00 00       	call   c0009259 <add_map_entry>
c0001cd0:	83 c4 10             	add    $0x10,%esp
c0001cd3:	c7 45 e0 00 00 10 00 	movl   $0x100000,-0x20(%ebp)
c0001cda:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0001cdd:	0f 22 d8             	mov    %eax,%cr3
c0001ce0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001ce3:	8b 00                	mov    (%eax),%eax
c0001ce5:	83 e0 01             	and    $0x1,%eax
c0001ce8:	85 c0                	test   %eax,%eax
c0001cea:	74 09                	je     c0001cf5 <do_page_fault+0x15b>
c0001cec:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
c0001cf3:	eb 07                	jmp    c0001cfc <do_page_fault+0x162>
c0001cf5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001cfc:	90                   	nop
c0001cfd:	c9                   	leave  
c0001cfe:	c3                   	ret    

c0001cff <exception_handler>:
c0001cff:	55                   	push   %ebp
c0001d00:	89 e5                	mov    %esp,%ebp
c0001d02:	57                   	push   %edi
c0001d03:	56                   	push   %esi
c0001d04:	53                   	push   %ebx
c0001d05:	83 ec 6c             	sub    $0x6c,%esp
c0001d08:	8d 45 90             	lea    -0x70(%ebp),%eax
c0001d0b:	bb a0 99 00 c0       	mov    $0xc00099a0,%ebx
c0001d10:	ba 13 00 00 00       	mov    $0x13,%edx
c0001d15:	89 c7                	mov    %eax,%edi
c0001d17:	89 de                	mov    %ebx,%esi
c0001d19:	89 d1                	mov    %edx,%ecx
c0001d1b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0001d1d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0001d24:	eb 04                	jmp    c0001d2a <exception_handler+0x2b>
c0001d26:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0001d2a:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0001d31:	7e f3                	jle    c0001d26 <exception_handler+0x27>
c0001d33:	83 ec 0c             	sub    $0xc,%esp
c0001d36:	68 52 97 00 c0       	push   $0xc0009752
c0001d3b:	e8 4c f8 ff ff       	call   c000158c <disp_str>
c0001d40:	83 c4 10             	add    $0x10,%esp
c0001d43:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0001d4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d4d:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0001d51:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001d54:	83 ec 0c             	sub    $0xc,%esp
c0001d57:	ff 75 dc             	pushl  -0x24(%ebp)
c0001d5a:	e8 2d f8 ff ff       	call   c000158c <disp_str>
c0001d5f:	83 c4 10             	add    $0x10,%esp
c0001d62:	83 ec 0c             	sub    $0xc,%esp
c0001d65:	68 60 97 00 c0       	push   $0xc0009760
c0001d6a:	e8 1d f8 ff ff       	call   c000158c <disp_str>
c0001d6f:	83 c4 10             	add    $0x10,%esp
c0001d72:	83 ec 0c             	sub    $0xc,%esp
c0001d75:	68 63 97 00 c0       	push   $0xc0009763
c0001d7a:	e8 0d f8 ff ff       	call   c000158c <disp_str>
c0001d7f:	83 c4 10             	add    $0x10,%esp
c0001d82:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d85:	83 ec 0c             	sub    $0xc,%esp
c0001d88:	50                   	push   %eax
c0001d89:	e8 e3 fd ff ff       	call   c0001b71 <disp_int>
c0001d8e:	83 c4 10             	add    $0x10,%esp
c0001d91:	83 ec 0c             	sub    $0xc,%esp
c0001d94:	68 60 97 00 c0       	push   $0xc0009760
c0001d99:	e8 ee f7 ff ff       	call   c000158c <disp_str>
c0001d9e:	83 c4 10             	add    $0x10,%esp
c0001da1:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0001da5:	74 2f                	je     c0001dd6 <exception_handler+0xd7>
c0001da7:	83 ec 0c             	sub    $0xc,%esp
c0001daa:	68 6b 97 00 c0       	push   $0xc000976b
c0001daf:	e8 d8 f7 ff ff       	call   c000158c <disp_str>
c0001db4:	83 c4 10             	add    $0x10,%esp
c0001db7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001dba:	83 ec 0c             	sub    $0xc,%esp
c0001dbd:	50                   	push   %eax
c0001dbe:	e8 ae fd ff ff       	call   c0001b71 <disp_int>
c0001dc3:	83 c4 10             	add    $0x10,%esp
c0001dc6:	83 ec 0c             	sub    $0xc,%esp
c0001dc9:	68 60 97 00 c0       	push   $0xc0009760
c0001dce:	e8 b9 f7 ff ff       	call   c000158c <disp_str>
c0001dd3:	83 c4 10             	add    $0x10,%esp
c0001dd6:	83 ec 0c             	sub    $0xc,%esp
c0001dd9:	68 75 97 00 c0       	push   $0xc0009775
c0001dde:	e8 a9 f7 ff ff       	call   c000158c <disp_str>
c0001de3:	83 c4 10             	add    $0x10,%esp
c0001de6:	83 ec 0c             	sub    $0xc,%esp
c0001de9:	ff 75 14             	pushl  0x14(%ebp)
c0001dec:	e8 80 fd ff ff       	call   c0001b71 <disp_int>
c0001df1:	83 c4 10             	add    $0x10,%esp
c0001df4:	83 ec 0c             	sub    $0xc,%esp
c0001df7:	68 60 97 00 c0       	push   $0xc0009760
c0001dfc:	e8 8b f7 ff ff       	call   c000158c <disp_str>
c0001e01:	83 c4 10             	add    $0x10,%esp
c0001e04:	83 ec 0c             	sub    $0xc,%esp
c0001e07:	68 79 97 00 c0       	push   $0xc0009779
c0001e0c:	e8 7b f7 ff ff       	call   c000158c <disp_str>
c0001e11:	83 c4 10             	add    $0x10,%esp
c0001e14:	8b 45 10             	mov    0x10(%ebp),%eax
c0001e17:	83 ec 0c             	sub    $0xc,%esp
c0001e1a:	50                   	push   %eax
c0001e1b:	e8 51 fd ff ff       	call   c0001b71 <disp_int>
c0001e20:	83 c4 10             	add    $0x10,%esp
c0001e23:	83 ec 0c             	sub    $0xc,%esp
c0001e26:	68 60 97 00 c0       	push   $0xc0009760
c0001e2b:	e8 5c f7 ff ff       	call   c000158c <disp_str>
c0001e30:	83 c4 10             	add    $0x10,%esp
c0001e33:	83 ec 0c             	sub    $0xc,%esp
c0001e36:	68 7e 97 00 c0       	push   $0xc000977e
c0001e3b:	e8 4c f7 ff ff       	call   c000158c <disp_str>
c0001e40:	83 c4 10             	add    $0x10,%esp
c0001e43:	83 ec 0c             	sub    $0xc,%esp
c0001e46:	ff 75 18             	pushl  0x18(%ebp)
c0001e49:	e8 23 fd ff ff       	call   c0001b71 <disp_int>
c0001e4e:	83 c4 10             	add    $0x10,%esp
c0001e51:	83 ec 0c             	sub    $0xc,%esp
c0001e54:	68 60 97 00 c0       	push   $0xc0009760
c0001e59:	e8 2e f7 ff ff       	call   c000158c <disp_str>
c0001e5e:	83 c4 10             	add    $0x10,%esp
c0001e61:	83 ec 0c             	sub    $0xc,%esp
c0001e64:	68 88 97 00 c0       	push   $0xc0009788
c0001e69:	e8 1e f7 ff ff       	call   c000158c <disp_str>
c0001e6e:	83 c4 10             	add    $0x10,%esp
c0001e71:	e8 24 fd ff ff       	call   c0001b9a <do_page_fault>
c0001e76:	90                   	nop
c0001e77:	90                   	nop
c0001e78:	90                   	nop
c0001e79:	8b 45 10             	mov    0x10(%ebp),%eax
c0001e7c:	89 45 04             	mov    %eax,0x4(%ebp)
c0001e7f:	fb                   	sti    
c0001e80:	66 87 db             	xchg   %bx,%bx
c0001e83:	90                   	nop
c0001e84:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0001e87:	5b                   	pop    %ebx
c0001e88:	5e                   	pop    %esi
c0001e89:	5f                   	pop    %edi
c0001e8a:	5d                   	pop    %ebp
c0001e8b:	c3                   	ret    

c0001e8c <exception_handler2>:
c0001e8c:	55                   	push   %ebp
c0001e8d:	89 e5                	mov    %esp,%ebp
c0001e8f:	57                   	push   %edi
c0001e90:	56                   	push   %esi
c0001e91:	53                   	push   %ebx
c0001e92:	83 ec 6c             	sub    $0x6c,%esp
c0001e95:	8d 45 90             	lea    -0x70(%ebp),%eax
c0001e98:	bb a0 99 00 c0       	mov    $0xc00099a0,%ebx
c0001e9d:	ba 13 00 00 00       	mov    $0x13,%edx
c0001ea2:	89 c7                	mov    %eax,%edi
c0001ea4:	89 de                	mov    %ebx,%esi
c0001ea6:	89 d1                	mov    %edx,%ecx
c0001ea8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0001eaa:	c7 05 9c e6 00 c0 6a 	movl   $0x2e6a,0xc000e69c
c0001eb1:	2e 00 00 
c0001eb4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0001ebb:	eb 14                	jmp    c0001ed1 <exception_handler2+0x45>
c0001ebd:	83 ec 0c             	sub    $0xc,%esp
c0001ec0:	68 ec 99 00 c0       	push   $0xc00099ec
c0001ec5:	e8 c2 f6 ff ff       	call   c000158c <disp_str>
c0001eca:	83 c4 10             	add    $0x10,%esp
c0001ecd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0001ed1:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0001ed8:	7e e3                	jle    c0001ebd <exception_handler2+0x31>
c0001eda:	c7 05 9c e6 00 c0 6a 	movl   $0x2e6a,0xc000e69c
c0001ee1:	2e 00 00 
c0001ee4:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0001eeb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001eee:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0001ef2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001ef5:	83 ec 08             	sub    $0x8,%esp
c0001ef8:	ff 75 e0             	pushl  -0x20(%ebp)
c0001efb:	ff 75 dc             	pushl  -0x24(%ebp)
c0001efe:	e8 c4 f6 ff ff       	call   c00015c7 <disp_str_colour>
c0001f03:	83 c4 10             	add    $0x10,%esp
c0001f06:	83 ec 0c             	sub    $0xc,%esp
c0001f09:	68 60 97 00 c0       	push   $0xc0009760
c0001f0e:	e8 79 f6 ff ff       	call   c000158c <disp_str>
c0001f13:	83 c4 10             	add    $0x10,%esp
c0001f16:	83 ec 08             	sub    $0x8,%esp
c0001f19:	ff 75 e0             	pushl  -0x20(%ebp)
c0001f1c:	68 63 97 00 c0       	push   $0xc0009763
c0001f21:	e8 a1 f6 ff ff       	call   c00015c7 <disp_str_colour>
c0001f26:	83 c4 10             	add    $0x10,%esp
c0001f29:	83 ec 0c             	sub    $0xc,%esp
c0001f2c:	ff 75 08             	pushl  0x8(%ebp)
c0001f2f:	e8 3d fc ff ff       	call   c0001b71 <disp_int>
c0001f34:	83 c4 10             	add    $0x10,%esp
c0001f37:	83 ec 0c             	sub    $0xc,%esp
c0001f3a:	68 60 97 00 c0       	push   $0xc0009760
c0001f3f:	e8 48 f6 ff ff       	call   c000158c <disp_str>
c0001f44:	83 c4 10             	add    $0x10,%esp
c0001f47:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0001f4b:	74 44                	je     c0001f91 <exception_handler2+0x105>
c0001f4d:	83 ec 08             	sub    $0x8,%esp
c0001f50:	ff 75 e0             	pushl  -0x20(%ebp)
c0001f53:	68 6b 97 00 c0       	push   $0xc000976b
c0001f58:	e8 6a f6 ff ff       	call   c00015c7 <disp_str_colour>
c0001f5d:	83 c4 10             	add    $0x10,%esp
c0001f60:	83 ec 08             	sub    $0x8,%esp
c0001f63:	ff 75 e0             	pushl  -0x20(%ebp)
c0001f66:	68 6b 97 00 c0       	push   $0xc000976b
c0001f6b:	e8 57 f6 ff ff       	call   c00015c7 <disp_str_colour>
c0001f70:	83 c4 10             	add    $0x10,%esp
c0001f73:	83 ec 0c             	sub    $0xc,%esp
c0001f76:	ff 75 0c             	pushl  0xc(%ebp)
c0001f79:	e8 f3 fb ff ff       	call   c0001b71 <disp_int>
c0001f7e:	83 c4 10             	add    $0x10,%esp
c0001f81:	83 ec 0c             	sub    $0xc,%esp
c0001f84:	68 60 97 00 c0       	push   $0xc0009760
c0001f89:	e8 fe f5 ff ff       	call   c000158c <disp_str>
c0001f8e:	83 c4 10             	add    $0x10,%esp
c0001f91:	83 ec 08             	sub    $0x8,%esp
c0001f94:	ff 75 e0             	pushl  -0x20(%ebp)
c0001f97:	68 75 97 00 c0       	push   $0xc0009775
c0001f9c:	e8 26 f6 ff ff       	call   c00015c7 <disp_str_colour>
c0001fa1:	83 c4 10             	add    $0x10,%esp
c0001fa4:	83 ec 0c             	sub    $0xc,%esp
c0001fa7:	ff 75 14             	pushl  0x14(%ebp)
c0001faa:	e8 c2 fb ff ff       	call   c0001b71 <disp_int>
c0001faf:	83 c4 10             	add    $0x10,%esp
c0001fb2:	83 ec 0c             	sub    $0xc,%esp
c0001fb5:	68 60 97 00 c0       	push   $0xc0009760
c0001fba:	e8 cd f5 ff ff       	call   c000158c <disp_str>
c0001fbf:	83 c4 10             	add    $0x10,%esp
c0001fc2:	83 ec 08             	sub    $0x8,%esp
c0001fc5:	ff 75 e0             	pushl  -0x20(%ebp)
c0001fc8:	68 79 97 00 c0       	push   $0xc0009779
c0001fcd:	e8 f5 f5 ff ff       	call   c00015c7 <disp_str_colour>
c0001fd2:	83 c4 10             	add    $0x10,%esp
c0001fd5:	83 ec 0c             	sub    $0xc,%esp
c0001fd8:	ff 75 10             	pushl  0x10(%ebp)
c0001fdb:	e8 91 fb ff ff       	call   c0001b71 <disp_int>
c0001fe0:	83 c4 10             	add    $0x10,%esp
c0001fe3:	83 ec 0c             	sub    $0xc,%esp
c0001fe6:	68 60 97 00 c0       	push   $0xc0009760
c0001feb:	e8 9c f5 ff ff       	call   c000158c <disp_str>
c0001ff0:	83 c4 10             	add    $0x10,%esp
c0001ff3:	83 ec 08             	sub    $0x8,%esp
c0001ff6:	ff 75 e0             	pushl  -0x20(%ebp)
c0001ff9:	68 7e 97 00 c0       	push   $0xc000977e
c0001ffe:	e8 c4 f5 ff ff       	call   c00015c7 <disp_str_colour>
c0002003:	83 c4 10             	add    $0x10,%esp
c0002006:	83 ec 0c             	sub    $0xc,%esp
c0002009:	ff 75 18             	pushl  0x18(%ebp)
c000200c:	e8 60 fb ff ff       	call   c0001b71 <disp_int>
c0002011:	83 c4 10             	add    $0x10,%esp
c0002014:	83 ec 0c             	sub    $0xc,%esp
c0002017:	68 60 97 00 c0       	push   $0xc0009760
c000201c:	e8 6b f5 ff ff       	call   c000158c <disp_str>
c0002021:	83 c4 10             	add    $0x10,%esp
c0002024:	90                   	nop
c0002025:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0002028:	5b                   	pop    %ebx
c0002029:	5e                   	pop    %esi
c000202a:	5f                   	pop    %edi
c000202b:	5d                   	pop    %ebp
c000202c:	c3                   	ret    

c000202d <init_internal_interrupt>:
c000202d:	55                   	push   %ebp
c000202e:	89 e5                	mov    %esp,%ebp
c0002030:	83 ec 08             	sub    $0x8,%esp
c0002033:	6a 0e                	push   $0xe
c0002035:	6a 08                	push   $0x8
c0002037:	68 03 16 00 c0       	push   $0xc0001603
c000203c:	6a 00                	push   $0x0
c000203e:	e8 ba 52 00 00       	call   c00072fd <InitInterruptDesc>
c0002043:	83 c4 10             	add    $0x10,%esp
c0002046:	6a 0e                	push   $0xe
c0002048:	6a 08                	push   $0x8
c000204a:	68 09 16 00 c0       	push   $0xc0001609
c000204f:	6a 01                	push   $0x1
c0002051:	e8 a7 52 00 00       	call   c00072fd <InitInterruptDesc>
c0002056:	83 c4 10             	add    $0x10,%esp
c0002059:	6a 0e                	push   $0xe
c000205b:	6a 08                	push   $0x8
c000205d:	68 0f 16 00 c0       	push   $0xc000160f
c0002062:	6a 02                	push   $0x2
c0002064:	e8 94 52 00 00       	call   c00072fd <InitInterruptDesc>
c0002069:	83 c4 10             	add    $0x10,%esp
c000206c:	6a 0e                	push   $0xe
c000206e:	6a 08                	push   $0x8
c0002070:	68 15 16 00 c0       	push   $0xc0001615
c0002075:	6a 03                	push   $0x3
c0002077:	e8 81 52 00 00       	call   c00072fd <InitInterruptDesc>
c000207c:	83 c4 10             	add    $0x10,%esp
c000207f:	6a 0e                	push   $0xe
c0002081:	6a 08                	push   $0x8
c0002083:	68 1b 16 00 c0       	push   $0xc000161b
c0002088:	6a 04                	push   $0x4
c000208a:	e8 6e 52 00 00       	call   c00072fd <InitInterruptDesc>
c000208f:	83 c4 10             	add    $0x10,%esp
c0002092:	6a 0e                	push   $0xe
c0002094:	6a 08                	push   $0x8
c0002096:	68 21 16 00 c0       	push   $0xc0001621
c000209b:	6a 05                	push   $0x5
c000209d:	e8 5b 52 00 00       	call   c00072fd <InitInterruptDesc>
c00020a2:	83 c4 10             	add    $0x10,%esp
c00020a5:	6a 0e                	push   $0xe
c00020a7:	6a 08                	push   $0x8
c00020a9:	68 27 16 00 c0       	push   $0xc0001627
c00020ae:	6a 06                	push   $0x6
c00020b0:	e8 48 52 00 00       	call   c00072fd <InitInterruptDesc>
c00020b5:	83 c4 10             	add    $0x10,%esp
c00020b8:	6a 0e                	push   $0xe
c00020ba:	6a 08                	push   $0x8
c00020bc:	68 2d 16 00 c0       	push   $0xc000162d
c00020c1:	6a 07                	push   $0x7
c00020c3:	e8 35 52 00 00       	call   c00072fd <InitInterruptDesc>
c00020c8:	83 c4 10             	add    $0x10,%esp
c00020cb:	6a 0e                	push   $0xe
c00020cd:	6a 08                	push   $0x8
c00020cf:	68 33 16 00 c0       	push   $0xc0001633
c00020d4:	6a 08                	push   $0x8
c00020d6:	e8 22 52 00 00       	call   c00072fd <InitInterruptDesc>
c00020db:	83 c4 10             	add    $0x10,%esp
c00020de:	6a 0e                	push   $0xe
c00020e0:	6a 08                	push   $0x8
c00020e2:	68 37 16 00 c0       	push   $0xc0001637
c00020e7:	6a 09                	push   $0x9
c00020e9:	e8 0f 52 00 00       	call   c00072fd <InitInterruptDesc>
c00020ee:	83 c4 10             	add    $0x10,%esp
c00020f1:	6a 0e                	push   $0xe
c00020f3:	6a 08                	push   $0x8
c00020f5:	68 3d 16 00 c0       	push   $0xc000163d
c00020fa:	6a 0a                	push   $0xa
c00020fc:	e8 fc 51 00 00       	call   c00072fd <InitInterruptDesc>
c0002101:	83 c4 10             	add    $0x10,%esp
c0002104:	6a 0e                	push   $0xe
c0002106:	6a 08                	push   $0x8
c0002108:	68 41 16 00 c0       	push   $0xc0001641
c000210d:	6a 0b                	push   $0xb
c000210f:	e8 e9 51 00 00       	call   c00072fd <InitInterruptDesc>
c0002114:	83 c4 10             	add    $0x10,%esp
c0002117:	6a 0e                	push   $0xe
c0002119:	6a 08                	push   $0x8
c000211b:	68 45 16 00 c0       	push   $0xc0001645
c0002120:	6a 0c                	push   $0xc
c0002122:	e8 d6 51 00 00       	call   c00072fd <InitInterruptDesc>
c0002127:	83 c4 10             	add    $0x10,%esp
c000212a:	6a 0e                	push   $0xe
c000212c:	6a 08                	push   $0x8
c000212e:	68 49 16 00 c0       	push   $0xc0001649
c0002133:	6a 0d                	push   $0xd
c0002135:	e8 c3 51 00 00       	call   c00072fd <InitInterruptDesc>
c000213a:	83 c4 10             	add    $0x10,%esp
c000213d:	6a 0e                	push   $0xe
c000213f:	6a 08                	push   $0x8
c0002141:	68 4d 16 00 c0       	push   $0xc000164d
c0002146:	6a 0e                	push   $0xe
c0002148:	e8 b0 51 00 00       	call   c00072fd <InitInterruptDesc>
c000214d:	83 c4 10             	add    $0x10,%esp
c0002150:	6a 0e                	push   $0xe
c0002152:	6a 08                	push   $0x8
c0002154:	68 51 16 00 c0       	push   $0xc0001651
c0002159:	6a 10                	push   $0x10
c000215b:	e8 9d 51 00 00       	call   c00072fd <InitInterruptDesc>
c0002160:	83 c4 10             	add    $0x10,%esp
c0002163:	6a 0e                	push   $0xe
c0002165:	6a 08                	push   $0x8
c0002167:	68 57 16 00 c0       	push   $0xc0001657
c000216c:	6a 11                	push   $0x11
c000216e:	e8 8a 51 00 00       	call   c00072fd <InitInterruptDesc>
c0002173:	83 c4 10             	add    $0x10,%esp
c0002176:	6a 0e                	push   $0xe
c0002178:	6a 08                	push   $0x8
c000217a:	68 5b 16 00 c0       	push   $0xc000165b
c000217f:	6a 12                	push   $0x12
c0002181:	e8 77 51 00 00       	call   c00072fd <InitInterruptDesc>
c0002186:	83 c4 10             	add    $0x10,%esp
c0002189:	6a 0e                	push   $0xe
c000218b:	6a 0e                	push   $0xe
c000218d:	68 45 17 00 c0       	push   $0xc0001745
c0002192:	68 90 00 00 00       	push   $0x90
c0002197:	e8 61 51 00 00       	call   c00072fd <InitInterruptDesc>
c000219c:	83 c4 10             	add    $0x10,%esp
c000219f:	90                   	nop
c00021a0:	c9                   	leave  
c00021a1:	c3                   	ret    

c00021a2 <test>:
c00021a2:	55                   	push   %ebp
c00021a3:	89 e5                	mov    %esp,%ebp
c00021a5:	83 ec 08             	sub    $0x8,%esp
c00021a8:	83 ec 0c             	sub    $0xc,%esp
c00021ab:	68 ee 99 00 c0       	push   $0xc00099ee
c00021b0:	e8 d7 f3 ff ff       	call   c000158c <disp_str>
c00021b5:	83 c4 10             	add    $0x10,%esp
c00021b8:	83 ec 0c             	sub    $0xc,%esp
c00021bb:	6a 06                	push   $0x6
c00021bd:	e8 af f9 ff ff       	call   c0001b71 <disp_int>
c00021c2:	83 c4 10             	add    $0x10,%esp
c00021c5:	83 ec 0c             	sub    $0xc,%esp
c00021c8:	68 34 97 00 c0       	push   $0xc0009734
c00021cd:	e8 ba f3 ff ff       	call   c000158c <disp_str>
c00021d2:	83 c4 10             	add    $0x10,%esp
c00021d5:	90                   	nop
c00021d6:	c9                   	leave  
c00021d7:	c3                   	ret    

c00021d8 <disp_str_colour3>:
c00021d8:	55                   	push   %ebp
c00021d9:	89 e5                	mov    %esp,%ebp
c00021db:	90                   	nop
c00021dc:	5d                   	pop    %ebp
c00021dd:	c3                   	ret    

c00021de <spurious_irq>:
c00021de:	55                   	push   %ebp
c00021df:	89 e5                	mov    %esp,%ebp
c00021e1:	83 ec 08             	sub    $0x8,%esp
c00021e4:	83 ec 08             	sub    $0x8,%esp
c00021e7:	6a 0b                	push   $0xb
c00021e9:	68 f0 99 00 c0       	push   $0xc00099f0
c00021ee:	e8 d4 f3 ff ff       	call   c00015c7 <disp_str_colour>
c00021f3:	83 c4 10             	add    $0x10,%esp
c00021f6:	83 ec 0c             	sub    $0xc,%esp
c00021f9:	ff 75 08             	pushl  0x8(%ebp)
c00021fc:	e8 70 f9 ff ff       	call   c0001b71 <disp_int>
c0002201:	83 c4 10             	add    $0x10,%esp
c0002204:	a1 20 0e 01 c0       	mov    0xc0010e20,%eax
c0002209:	83 c0 01             	add    $0x1,%eax
c000220c:	a3 20 0e 01 c0       	mov    %eax,0xc0010e20
c0002211:	83 ec 0c             	sub    $0xc,%esp
c0002214:	68 17 9a 00 c0       	push   $0xc0009a17
c0002219:	e8 6e f3 ff ff       	call   c000158c <disp_str>
c000221e:	83 c4 10             	add    $0x10,%esp
c0002221:	a1 20 0e 01 c0       	mov    0xc0010e20,%eax
c0002226:	83 ec 0c             	sub    $0xc,%esp
c0002229:	50                   	push   %eax
c000222a:	e8 42 f9 ff ff       	call   c0001b71 <disp_int>
c000222f:	83 c4 10             	add    $0x10,%esp
c0002232:	83 ec 0c             	sub    $0xc,%esp
c0002235:	68 19 9a 00 c0       	push   $0xc0009a19
c000223a:	e8 4d f3 ff ff       	call   c000158c <disp_str>
c000223f:	83 c4 10             	add    $0x10,%esp
c0002242:	83 ec 08             	sub    $0x8,%esp
c0002245:	6a 0c                	push   $0xc
c0002247:	68 1c 9a 00 c0       	push   $0xc0009a1c
c000224c:	e8 76 f3 ff ff       	call   c00015c7 <disp_str_colour>
c0002251:	83 c4 10             	add    $0x10,%esp
c0002254:	90                   	nop
c0002255:	c9                   	leave  
c0002256:	c3                   	ret    

c0002257 <init_keyboard>:
c0002257:	55                   	push   %ebp
c0002258:	89 e5                	mov    %esp,%ebp
c000225a:	83 ec 18             	sub    $0x18,%esp
c000225d:	83 ec 04             	sub    $0x4,%esp
c0002260:	68 00 02 00 00       	push   $0x200
c0002265:	6a 00                	push   $0x0
c0002267:	68 ec ea 00 c0       	push   $0xc000eaec
c000226c:	e8 3e 7f 00 00       	call   c000a1af <Memset>
c0002271:	83 c4 10             	add    $0x10,%esp
c0002274:	c7 05 e0 ea 00 c0 ec 	movl   $0xc000eaec,0xc000eae0
c000227b:	ea 00 c0 
c000227e:	a1 e0 ea 00 c0       	mov    0xc000eae0,%eax
c0002283:	a3 e4 ea 00 c0       	mov    %eax,0xc000eae4
c0002288:	c7 05 e8 ea 00 c0 00 	movl   $0x0,0xc000eae8
c000228f:	00 00 00 
c0002292:	c7 05 9c e6 00 c0 00 	movl   $0x0,0xc000e69c
c0002299:	00 00 00 
c000229c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022a3:	eb 14                	jmp    c00022b9 <init_keyboard+0x62>
c00022a5:	83 ec 0c             	sub    $0xc,%esp
c00022a8:	68 ec 99 00 c0       	push   $0xc00099ec
c00022ad:	e8 da f2 ff ff       	call   c000158c <disp_str>
c00022b2:	83 c4 10             	add    $0x10,%esp
c00022b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00022b9:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00022c0:	7e e3                	jle    c00022a5 <init_keyboard+0x4e>
c00022c2:	c7 05 9c e6 00 c0 00 	movl   $0x0,0xc000e69c
c00022c9:	00 00 00 
c00022cc:	e8 9c 5d 00 00       	call   c000806d <init_keyboard_handler>
c00022d1:	90                   	nop
c00022d2:	c9                   	leave  
c00022d3:	c3                   	ret    

c00022d4 <init>:
c00022d4:	55                   	push   %ebp
c00022d5:	89 e5                	mov    %esp,%ebp
c00022d7:	83 ec 08             	sub    $0x8,%esp
c00022da:	66 87 db             	xchg   %bx,%bx
c00022dd:	83 ec 0c             	sub    $0xc,%esp
c00022e0:	68 41 9a 00 c0       	push   $0xc0009a41
c00022e5:	e8 a2 f2 ff ff       	call   c000158c <disp_str>
c00022ea:	83 c4 10             	add    $0x10,%esp
c00022ed:	e8 65 ff ff ff       	call   c0002257 <init_keyboard>
c00022f2:	83 ec 0c             	sub    $0xc,%esp
c00022f5:	68 00 00 00 02       	push   $0x2000000
c00022fa:	e8 f3 72 00 00       	call   c00095f2 <init_memory>
c00022ff:	83 c4 10             	add    $0x10,%esp
c0002302:	90                   	nop
c0002303:	c9                   	leave  
c0002304:	c3                   	ret    

c0002305 <kernel_main>:
c0002305:	55                   	push   %ebp
c0002306:	89 e5                	mov    %esp,%ebp
c0002308:	83 ec 28             	sub    $0x28,%esp
c000230b:	83 ec 0c             	sub    $0xc,%esp
c000230e:	68 47 9a 00 c0       	push   $0xc0009a47
c0002313:	e8 74 f2 ff ff       	call   c000158c <disp_str>
c0002318:	83 c4 10             	add    $0x10,%esp
c000231b:	e8 b4 ff ff ff       	call   c00022d4 <init>
c0002320:	c7 05 20 0e 01 c0 00 	movl   $0x0,0xc0010e20
c0002327:	00 00 00 
c000232a:	c7 05 fc 05 01 c0 00 	movl   $0x0,0xc00105fc
c0002331:	00 00 00 
c0002334:	c7 05 a0 e6 00 c0 00 	movl   $0x0,0xc000e6a0
c000233b:	00 00 00 
c000233e:	c7 45 e8 00 21 08 c0 	movl   $0xc0082100,-0x18(%ebp)
c0002345:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000234c:	e9 2a 02 00 00       	jmp    c000257b <kernel_main+0x276>
c0002351:	83 ec 08             	sub    $0x8,%esp
c0002354:	6a 00                	push   $0x0
c0002356:	6a 02                	push   $0x2
c0002358:	e8 c2 6f 00 00       	call   c000931f <alloc_memory>
c000235d:	83 c4 10             	add    $0x10,%esp
c0002360:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002363:	83 ec 04             	sub    $0x4,%esp
c0002366:	68 ac 01 00 00       	push   $0x1ac
c000236b:	6a 00                	push   $0x0
c000236d:	ff 75 f4             	pushl  -0xc(%ebp)
c0002370:	e8 3a 7e 00 00       	call   c000a1af <Memset>
c0002375:	83 c4 10             	add    $0x10,%esp
c0002378:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000237b:	05 00 10 00 00       	add    $0x1000,%eax
c0002380:	89 c2                	mov    %eax,%edx
c0002382:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002385:	89 10                	mov    %edx,(%eax)
c0002387:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000238a:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
c0002390:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002393:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002396:	89 50 18             	mov    %edx,0x18(%eax)
c0002399:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000239c:	c7 80 3c 01 00 00 00 	movl   $0x0,0x13c(%eax)
c00023a3:	00 00 00 
c00023a6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00023aa:	7e 0f                	jle    c00023bb <kernel_main+0xb6>
c00023ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023af:	c6 80 44 01 00 00 ff 	movb   $0xff,0x144(%eax)
c00023b6:	e9 bc 01 00 00       	jmp    c0002577 <kernel_main+0x272>
c00023bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023be:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c00023c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00023c9:	7f 6b                	jg     c0002436 <kernel_main+0x131>
c00023cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00023ce:	6b c0 1c             	imul   $0x1c,%eax,%eax
c00023d1:	05 28 d0 00 c0       	add    $0xc000d028,%eax
c00023d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00023d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023dc:	8b 00                	mov    (%eax),%eax
c00023de:	83 e8 44             	sub    $0x44,%eax
c00023e1:	89 c2                	mov    %eax,%edx
c00023e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023e6:	89 10                	mov    %edx,(%eax)
c00023e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023eb:	8b 00                	mov    (%eax),%eax
c00023ed:	83 e8 14             	sub    $0x14,%eax
c00023f0:	89 c2                	mov    %eax,%edx
c00023f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023f5:	89 10                	mov    %edx,(%eax)
c00023f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023fa:	8b 00                	mov    (%eax),%eax
c00023fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00023ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002402:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
c0002408:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000240b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002412:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002415:	8b 50 04             	mov    0x4(%eax),%edx
c0002418:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000241b:	89 50 08             	mov    %edx,0x8(%eax)
c000241e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002421:	8b 50 08             	mov    0x8(%eax),%edx
c0002424:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002427:	89 50 0c             	mov    %edx,0xc(%eax)
c000242a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000242d:	8b 50 0c             	mov    0xc(%eax),%edx
c0002430:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002433:	89 50 10             	mov    %edx,0x10(%eax)
c0002436:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002439:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000243c:	83 c2 28             	add    $0x28,%edx
c000243f:	83 ec 08             	sub    $0x8,%esp
c0002442:	50                   	push   %eax
c0002443:	52                   	push   %edx
c0002444:	e8 85 7d 00 00       	call   c000a1ce <Strcpy>
c0002449:	83 c4 10             	add    $0x10,%esp
c000244c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000244f:	83 c0 06             	add    $0x6,%eax
c0002452:	83 ec 04             	sub    $0x4,%esp
c0002455:	6a 08                	push   $0x8
c0002457:	68 c8 e6 00 c0       	push   $0xc000e6c8
c000245c:	50                   	push   %eax
c000245d:	e8 1f 7d 00 00       	call   c000a181 <Memcpy>
c0002462:	83 c4 10             	add    $0x10,%esp
c0002465:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0002469:	c1 e0 05             	shl    $0x5,%eax
c000246c:	83 c8 9a             	or     $0xffffff9a,%eax
c000246f:	89 c2                	mov    %eax,%edx
c0002471:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002474:	88 50 0b             	mov    %dl,0xb(%eax)
c0002477:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000247a:	83 c0 0e             	add    $0xe,%eax
c000247d:	83 ec 04             	sub    $0x4,%esp
c0002480:	6a 08                	push   $0x8
c0002482:	68 f0 e6 00 c0       	push   $0xc000e6f0
c0002487:	50                   	push   %eax
c0002488:	e8 f4 7c 00 00       	call   c000a181 <Memcpy>
c000248d:	83 c4 10             	add    $0x10,%esp
c0002490:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c0002494:	c1 e0 05             	shl    $0x5,%eax
c0002497:	83 c8 92             	or     $0xffffff92,%eax
c000249a:	89 c2                	mov    %eax,%edx
c000249c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000249f:	88 50 13             	mov    %dl,0x13(%eax)
c00024a2:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
c00024a6:	83 c8 04             	or     $0x4,%eax
c00024a9:	0f b6 c0             	movzbl %al,%eax
c00024ac:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
c00024b0:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
c00024b4:	83 c8 0c             	or     $0xc,%eax
c00024b7:	0f b6 c0             	movzbl %al,%eax
c00024ba:	66 89 45 de          	mov    %ax,-0x22(%ebp)
c00024be:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c00024c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024c5:	89 90 9c 01 00 00    	mov    %edx,0x19c(%eax)
c00024cb:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c00024cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024d2:	89 90 74 01 00 00    	mov    %edx,0x174(%eax)
c00024d8:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c00024dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024df:	89 90 6c 01 00 00    	mov    %edx,0x16c(%eax)
c00024e5:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c00024e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024ec:	89 90 70 01 00 00    	mov    %edx,0x170(%eax)
c00024f2:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c00024f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024f9:	89 90 a8 01 00 00    	mov    %edx,0x1a8(%eax)
c00024ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002502:	c7 80 68 01 00 00 39 	movl   $0x39,0x168(%eax)
c0002509:	00 00 00 
c000250c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000250f:	8b 40 14             	mov    0x14(%eax),%eax
c0002512:	89 c2                	mov    %eax,%edx
c0002514:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002517:	89 90 98 01 00 00    	mov    %edx,0x198(%eax)
c000251d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002520:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002523:	89 90 a0 01 00 00    	mov    %edx,0x1a0(%eax)
c0002529:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000252c:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0002533:	00 00 00 
c0002536:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002539:	c7 80 54 01 00 00 00 	movl   $0x0,0x154(%eax)
c0002540:	00 00 00 
c0002543:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002546:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c000254d:	00 00 00 
c0002550:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002553:	c7 80 50 01 00 00 1a 	movl   $0x1a,0x150(%eax)
c000255a:	00 00 00 
c000255d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002560:	c7 80 4c 01 00 00 1a 	movl   $0x1a,0x14c(%eax)
c0002567:	00 00 00 
c000256a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000256d:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c0002574:	00 00 00 
c0002577:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000257b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000257f:	0f 8e cc fd ff ff    	jle    c0002351 <kernel_main+0x4c>
c0002585:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002588:	a3 c0 ea 00 c0       	mov    %eax,0xc000eac0
c000258d:	fb                   	sti    
c000258e:	eb fe                	jmp    c000258e <kernel_main+0x289>

c0002590 <TestFS>:
c0002590:	55                   	push   %ebp
c0002591:	89 e5                	mov    %esp,%ebp
c0002593:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
c0002599:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c00025a0:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c00025a7:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c00025ad:	83 ec 08             	sub    $0x8,%esp
c00025b0:	6a 02                	push   $0x2
c00025b2:	8d 45 be             	lea    -0x42(%ebp),%eax
c00025b5:	50                   	push   %eax
c00025b6:	e8 58 5c 00 00       	call   c0008213 <open>
c00025bb:	83 c4 10             	add    $0x10,%esp
c00025be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00025c1:	83 ec 08             	sub    $0x8,%esp
c00025c4:	6a 02                	push   $0x2
c00025c6:	8d 45 be             	lea    -0x42(%ebp),%eax
c00025c9:	50                   	push   %eax
c00025ca:	e8 44 5c 00 00       	call   c0008213 <open>
c00025cf:	83 c4 10             	add    $0x10,%esp
c00025d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00025d5:	83 ec 0c             	sub    $0xc,%esp
c00025d8:	68 53 9a 00 c0       	push   $0xc0009a53
c00025dd:	e8 1c 0e 00 00       	call   c00033fe <Printf>
c00025e2:	83 c4 10             	add    $0x10,%esp
c00025e5:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c00025ec:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c00025f0:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c00025f7:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c00025fb:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0002602:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0002609:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c000260f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0002616:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000261a:	75 fa                	jne    c0002616 <TestFS+0x86>
c000261c:	83 ec 08             	sub    $0x8,%esp
c000261f:	6a 07                	push   $0x7
c0002621:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0002624:	50                   	push   %eax
c0002625:	e8 e9 5b 00 00       	call   c0008213 <open>
c000262a:	83 c4 10             	add    $0x10,%esp
c000262d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002630:	83 ec 08             	sub    $0x8,%esp
c0002633:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002636:	68 65 9a 00 c0       	push   $0xc0009a65
c000263b:	e8 be 0d 00 00       	call   c00033fe <Printf>
c0002640:	83 c4 10             	add    $0x10,%esp
c0002643:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000264a:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0002651:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0002658:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c000265f:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0002666:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c000266d:	83 ec 0c             	sub    $0xc,%esp
c0002670:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0002673:	50                   	push   %eax
c0002674:	e8 6f 7b 00 00       	call   c000a1e8 <Strlen>
c0002679:	83 c4 10             	add    $0x10,%esp
c000267c:	83 ec 04             	sub    $0x4,%esp
c000267f:	50                   	push   %eax
c0002680:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0002683:	50                   	push   %eax
c0002684:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002687:	e8 13 5c 00 00       	call   c000829f <write>
c000268c:	83 c4 10             	add    $0x10,%esp
c000268f:	83 ec 04             	sub    $0x4,%esp
c0002692:	6a 14                	push   $0x14
c0002694:	6a 00                	push   $0x0
c0002696:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0002699:	50                   	push   %eax
c000269a:	e8 10 7b 00 00       	call   c000a1af <Memset>
c000269f:	83 c4 10             	add    $0x10,%esp
c00026a2:	83 ec 04             	sub    $0x4,%esp
c00026a5:	6a 12                	push   $0x12
c00026a7:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00026aa:	50                   	push   %eax
c00026ab:	ff 75 e4             	pushl  -0x1c(%ebp)
c00026ae:	e8 b5 5b 00 00       	call   c0008268 <read>
c00026b3:	83 c4 10             	add    $0x10,%esp
c00026b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00026b9:	83 ec 08             	sub    $0x8,%esp
c00026bc:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00026bf:	50                   	push   %eax
c00026c0:	68 6e 9a 00 c0       	push   $0xc0009a6e
c00026c5:	e8 34 0d 00 00       	call   c00033fe <Printf>
c00026ca:	83 c4 10             	add    $0x10,%esp
c00026cd:	83 ec 0c             	sub    $0xc,%esp
c00026d0:	6a 0a                	push   $0xa
c00026d2:	e8 6a 0b 00 00       	call   c0003241 <delay>
c00026d7:	83 c4 10             	add    $0x10,%esp
c00026da:	83 ec 08             	sub    $0x8,%esp
c00026dd:	6a 07                	push   $0x7
c00026df:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c00026e2:	50                   	push   %eax
c00026e3:	e8 2b 5b 00 00       	call   c0008213 <open>
c00026e8:	83 c4 10             	add    $0x10,%esp
c00026eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00026ee:	83 ec 08             	sub    $0x8,%esp
c00026f1:	ff 75 dc             	pushl  -0x24(%ebp)
c00026f4:	68 79 9a 00 c0       	push   $0xc0009a79
c00026f9:	e8 00 0d 00 00       	call   c00033fe <Printf>
c00026fe:	83 c4 10             	add    $0x10,%esp
c0002701:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002708:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c000270f:	67 3a 68 
c0002712:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0002719:	77 20 61 
c000271c:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0002723:	65 20 79 
c0002726:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c000272d:	75 3f 00 
c0002730:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0002737:	00 00 00 
c000273a:	83 ec 0c             	sub    $0xc,%esp
c000273d:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0002743:	50                   	push   %eax
c0002744:	e8 9f 7a 00 00       	call   c000a1e8 <Strlen>
c0002749:	83 c4 10             	add    $0x10,%esp
c000274c:	83 ec 04             	sub    $0x4,%esp
c000274f:	50                   	push   %eax
c0002750:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0002756:	50                   	push   %eax
c0002757:	ff 75 dc             	pushl  -0x24(%ebp)
c000275a:	e8 40 5b 00 00       	call   c000829f <write>
c000275f:	83 c4 10             	add    $0x10,%esp
c0002762:	83 ec 04             	sub    $0x4,%esp
c0002765:	6a 14                	push   $0x14
c0002767:	6a 00                	push   $0x0
c0002769:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c000276f:	50                   	push   %eax
c0002770:	e8 3a 7a 00 00       	call   c000a1af <Memset>
c0002775:	83 c4 10             	add    $0x10,%esp
c0002778:	83 ec 04             	sub    $0x4,%esp
c000277b:	6a 12                	push   $0x12
c000277d:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0002783:	50                   	push   %eax
c0002784:	ff 75 dc             	pushl  -0x24(%ebp)
c0002787:	e8 dc 5a 00 00       	call   c0008268 <read>
c000278c:	83 c4 10             	add    $0x10,%esp
c000278f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002792:	83 ec 08             	sub    $0x8,%esp
c0002795:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c000279b:	50                   	push   %eax
c000279c:	68 83 9a 00 c0       	push   $0xc0009a83
c00027a1:	e8 58 0c 00 00       	call   c00033fe <Printf>
c00027a6:	83 c4 10             	add    $0x10,%esp
c00027a9:	83 ec 08             	sub    $0x8,%esp
c00027ac:	6a 07                	push   $0x7
c00027ae:	8d 45 aa             	lea    -0x56(%ebp),%eax
c00027b1:	50                   	push   %eax
c00027b2:	e8 5c 5a 00 00       	call   c0008213 <open>
c00027b7:	83 c4 10             	add    $0x10,%esp
c00027ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00027bd:	83 ec 08             	sub    $0x8,%esp
c00027c0:	ff 75 dc             	pushl  -0x24(%ebp)
c00027c3:	68 79 9a 00 c0       	push   $0xc0009a79
c00027c8:	e8 31 0c 00 00       	call   c00033fe <Printf>
c00027cd:	83 c4 10             	add    $0x10,%esp
c00027d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027d7:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c00027de:	20 77 69 
c00027e1:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c00027e8:	6c 20 73 
c00027eb:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c00027f2:	63 63 65 
c00027f5:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c00027fc:	73 20 61 
c00027ff:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0002806:	20 6c 61 
c0002809:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0002810:	74 2e 00 
c0002813:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c000281a:	00 00 00 
c000281d:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0002824:	00 00 
c0002826:	83 ec 0c             	sub    $0xc,%esp
c0002829:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000282f:	50                   	push   %eax
c0002830:	e8 b3 79 00 00       	call   c000a1e8 <Strlen>
c0002835:	83 c4 10             	add    $0x10,%esp
c0002838:	83 ec 04             	sub    $0x4,%esp
c000283b:	50                   	push   %eax
c000283c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0002842:	50                   	push   %eax
c0002843:	ff 75 d4             	pushl  -0x2c(%ebp)
c0002846:	e8 54 5a 00 00       	call   c000829f <write>
c000284b:	83 c4 10             	add    $0x10,%esp
c000284e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002855:	eb 5c                	jmp    c00028b3 <TestFS+0x323>
c0002857:	83 ec 04             	sub    $0x4,%esp
c000285a:	6a 1e                	push   $0x1e
c000285c:	6a 00                	push   $0x0
c000285e:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0002864:	50                   	push   %eax
c0002865:	e8 45 79 00 00       	call   c000a1af <Memset>
c000286a:	83 c4 10             	add    $0x10,%esp
c000286d:	83 ec 0c             	sub    $0xc,%esp
c0002870:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0002876:	50                   	push   %eax
c0002877:	e8 6c 79 00 00       	call   c000a1e8 <Strlen>
c000287c:	83 c4 10             	add    $0x10,%esp
c000287f:	83 ec 04             	sub    $0x4,%esp
c0002882:	50                   	push   %eax
c0002883:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0002889:	50                   	push   %eax
c000288a:	ff 75 d4             	pushl  -0x2c(%ebp)
c000288d:	e8 d6 59 00 00       	call   c0008268 <read>
c0002892:	83 c4 10             	add    $0x10,%esp
c0002895:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002898:	83 ec 08             	sub    $0x8,%esp
c000289b:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00028a1:	50                   	push   %eax
c00028a2:	68 8e 9a 00 c0       	push   $0xc0009a8e
c00028a7:	e8 52 0b 00 00       	call   c00033fe <Printf>
c00028ac:	83 c4 10             	add    $0x10,%esp
c00028af:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028b3:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
c00028b7:	7e 9e                	jle    c0002857 <TestFS+0x2c7>
c00028b9:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c00028c0:	6e 73 74 
c00028c3:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c00028ca:	6c 6c 2e 
c00028cd:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c00028d4:	61 72 00 
c00028d7:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c00028de:	00 00 00 
c00028e1:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c00028e8:	00 00 00 
c00028eb:	83 ec 08             	sub    $0x8,%esp
c00028ee:	6a 00                	push   $0x0
c00028f0:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c00028f6:	50                   	push   %eax
c00028f7:	e8 17 59 00 00       	call   c0008213 <open>
c00028fc:	83 c4 10             	add    $0x10,%esp
c00028ff:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002902:	83 ec 08             	sub    $0x8,%esp
c0002905:	ff 75 cc             	pushl  -0x34(%ebp)
c0002908:	68 99 9a 00 c0       	push   $0xc0009a99
c000290d:	e8 ec 0a 00 00       	call   c00033fe <Printf>
c0002912:	83 c4 10             	add    $0x10,%esp
c0002915:	83 ec 04             	sub    $0x4,%esp
c0002918:	6a 14                	push   $0x14
c000291a:	6a 00                	push   $0x0
c000291c:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0002922:	50                   	push   %eax
c0002923:	e8 87 78 00 00       	call   c000a1af <Memset>
c0002928:	83 c4 10             	add    $0x10,%esp
c000292b:	83 ec 04             	sub    $0x4,%esp
c000292e:	68 00 02 00 00       	push   $0x200
c0002933:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0002939:	50                   	push   %eax
c000293a:	ff 75 cc             	pushl  -0x34(%ebp)
c000293d:	e8 26 59 00 00       	call   c0008268 <read>
c0002942:	83 c4 10             	add    $0x10,%esp
c0002945:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002948:	83 ec 08             	sub    $0x8,%esp
c000294b:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0002951:	50                   	push   %eax
c0002952:	68 a3 9a 00 c0       	push   $0xc0009aa3
c0002957:	e8 a2 0a 00 00       	call   c00033fe <Printf>
c000295c:	83 c4 10             	add    $0x10,%esp
c000295f:	e9 b2 fc ff ff       	jmp    c0002616 <TestFS+0x86>

c0002964 <wait_exit>:
c0002964:	55                   	push   %ebp
c0002965:	89 e5                	mov    %esp,%ebp
c0002967:	83 ec 28             	sub    $0x28,%esp
c000296a:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0002971:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0002978:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000297e:	83 ec 08             	sub    $0x8,%esp
c0002981:	6a 02                	push   $0x2
c0002983:	8d 45 de             	lea    -0x22(%ebp),%eax
c0002986:	50                   	push   %eax
c0002987:	e8 87 58 00 00       	call   c0008213 <open>
c000298c:	83 c4 10             	add    $0x10,%esp
c000298f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002992:	83 ec 08             	sub    $0x8,%esp
c0002995:	6a 02                	push   $0x2
c0002997:	8d 45 de             	lea    -0x22(%ebp),%eax
c000299a:	50                   	push   %eax
c000299b:	e8 73 58 00 00       	call   c0008213 <open>
c00029a0:	83 c4 10             	add    $0x10,%esp
c00029a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00029a6:	e8 de 59 00 00       	call   c0008389 <fork>
c00029ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00029ae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00029b2:	7e 25                	jle    c00029d9 <wait_exit+0x75>
c00029b4:	83 ec 0c             	sub    $0xc,%esp
c00029b7:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00029ba:	50                   	push   %eax
c00029bb:	e8 62 59 00 00       	call   c0008322 <wait>
c00029c0:	83 c4 10             	add    $0x10,%esp
c00029c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00029c6:	83 ec 08             	sub    $0x8,%esp
c00029c9:	50                   	push   %eax
c00029ca:	68 ae 9a 00 c0       	push   $0xc0009aae
c00029cf:	e8 2a 0a 00 00       	call   c00033fe <Printf>
c00029d4:	83 c4 10             	add    $0x10,%esp
c00029d7:	eb fe                	jmp    c00029d7 <wait_exit+0x73>
c00029d9:	83 ec 0c             	sub    $0xc,%esp
c00029dc:	68 c9 9a 00 c0       	push   $0xc0009ac9
c00029e1:	e8 18 0a 00 00       	call   c00033fe <Printf>
c00029e6:	83 c4 10             	add    $0x10,%esp
c00029e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00029f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00029f3:	8d 50 01             	lea    0x1(%eax),%edx
c00029f6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00029f9:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c00029fe:	7f 02                	jg     c0002a02 <wait_exit+0x9e>
c0002a00:	eb ee                	jmp    c00029f0 <wait_exit+0x8c>
c0002a02:	90                   	nop
c0002a03:	83 ec 0c             	sub    $0xc,%esp
c0002a06:	68 d5 9a 00 c0       	push   $0xc0009ad5
c0002a0b:	e8 ee 09 00 00       	call   c00033fe <Printf>
c0002a10:	83 c4 10             	add    $0x10,%esp
c0002a13:	83 ec 0c             	sub    $0xc,%esp
c0002a16:	6a 09                	push   $0x9
c0002a18:	e8 43 59 00 00       	call   c0008360 <exit>
c0002a1d:	83 c4 10             	add    $0x10,%esp
c0002a20:	83 ec 0c             	sub    $0xc,%esp
c0002a23:	68 e3 9a 00 c0       	push   $0xc0009ae3
c0002a28:	e8 d1 09 00 00       	call   c00033fe <Printf>
c0002a2d:	83 c4 10             	add    $0x10,%esp
c0002a30:	eb fe                	jmp    c0002a30 <wait_exit+0xcc>

c0002a32 <INIT_fork>:
c0002a32:	55                   	push   %ebp
c0002a33:	89 e5                	mov    %esp,%ebp
c0002a35:	53                   	push   %ebx
c0002a36:	81 ec 84 00 00 00    	sub    $0x84,%esp
c0002a3c:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c0002a43:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0002a4a:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0002a50:	83 ec 08             	sub    $0x8,%esp
c0002a53:	6a 02                	push   $0x2
c0002a55:	8d 45 da             	lea    -0x26(%ebp),%eax
c0002a58:	50                   	push   %eax
c0002a59:	e8 b5 57 00 00       	call   c0008213 <open>
c0002a5e:	83 c4 10             	add    $0x10,%esp
c0002a61:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002a64:	83 ec 08             	sub    $0x8,%esp
c0002a67:	6a 02                	push   $0x2
c0002a69:	8d 45 da             	lea    -0x26(%ebp),%eax
c0002a6c:	50                   	push   %eax
c0002a6d:	e8 a1 57 00 00       	call   c0008213 <open>
c0002a72:	83 c4 10             	add    $0x10,%esp
c0002a75:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002a78:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c0002a7f:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c0002a86:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c0002a8d:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c0002a94:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c0002a9b:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0002aa2:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0002aa9:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0002ab0:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0002ab7:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0002abe:	83 ec 0c             	sub    $0xc,%esp
c0002ac1:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0002ac4:	50                   	push   %eax
c0002ac5:	e8 1e 77 00 00       	call   c000a1e8 <Strlen>
c0002aca:	83 c4 10             	add    $0x10,%esp
c0002acd:	83 ec 04             	sub    $0x4,%esp
c0002ad0:	50                   	push   %eax
c0002ad1:	6a 00                	push   $0x0
c0002ad3:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0002ad6:	50                   	push   %eax
c0002ad7:	e8 d3 76 00 00       	call   c000a1af <Memset>
c0002adc:	83 c4 10             	add    $0x10,%esp
c0002adf:	83 ec 04             	sub    $0x4,%esp
c0002ae2:	6a 28                	push   $0x28
c0002ae4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0002ae7:	50                   	push   %eax
c0002ae8:	ff 75 e8             	pushl  -0x18(%ebp)
c0002aeb:	e8 78 57 00 00       	call   c0008268 <read>
c0002af0:	83 c4 10             	add    $0x10,%esp
c0002af3:	83 ec 04             	sub    $0x4,%esp
c0002af6:	6a 28                	push   $0x28
c0002af8:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0002afb:	50                   	push   %eax
c0002afc:	ff 75 ec             	pushl  -0x14(%ebp)
c0002aff:	e8 9b 57 00 00       	call   c000829f <write>
c0002b04:	83 c4 10             	add    $0x10,%esp
c0002b07:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002b0e:	e8 76 58 00 00       	call   c0008389 <fork>
c0002b13:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002b16:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0002b1a:	0f 8e dd 00 00 00    	jle    c0002bfd <INIT_fork+0x1cb>
c0002b20:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002b24:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
c0002b2b:	61 72 65 
c0002b2e:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
c0002b35:	8d 45 87             	lea    -0x79(%ebp),%eax
c0002b38:	b9 20 00 00 00       	mov    $0x20,%ecx
c0002b3d:	bb 00 00 00 00       	mov    $0x0,%ebx
c0002b42:	89 18                	mov    %ebx,(%eax)
c0002b44:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0002b48:	8d 50 04             	lea    0x4(%eax),%edx
c0002b4b:	83 e2 fc             	and    $0xfffffffc,%edx
c0002b4e:	29 d0                	sub    %edx,%eax
c0002b50:	01 c1                	add    %eax,%ecx
c0002b52:	83 e1 fc             	and    $0xfffffffc,%ecx
c0002b55:	83 e1 fc             	and    $0xfffffffc,%ecx
c0002b58:	b8 00 00 00 00       	mov    $0x0,%eax
c0002b5d:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0002b60:	83 c0 04             	add    $0x4,%eax
c0002b63:	39 c8                	cmp    %ecx,%eax
c0002b65:	72 f6                	jb     c0002b5d <INIT_fork+0x12b>
c0002b67:	01 c2                	add    %eax,%edx
c0002b69:	83 ec 0c             	sub    $0xc,%esp
c0002b6c:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002b72:	50                   	push   %eax
c0002b73:	e8 70 76 00 00       	call   c000a1e8 <Strlen>
c0002b78:	83 c4 10             	add    $0x10,%esp
c0002b7b:	83 ec 04             	sub    $0x4,%esp
c0002b7e:	50                   	push   %eax
c0002b7f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002b85:	50                   	push   %eax
c0002b86:	ff 75 ec             	pushl  -0x14(%ebp)
c0002b89:	e8 11 57 00 00       	call   c000829f <write>
c0002b8e:	83 c4 10             	add    $0x10,%esp
c0002b91:	83 ec 0c             	sub    $0xc,%esp
c0002b94:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002b9a:	50                   	push   %eax
c0002b9b:	e8 48 76 00 00       	call   c000a1e8 <Strlen>
c0002ba0:	83 c4 10             	add    $0x10,%esp
c0002ba3:	83 ec 04             	sub    $0x4,%esp
c0002ba6:	50                   	push   %eax
c0002ba7:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002bad:	50                   	push   %eax
c0002bae:	ff 75 ec             	pushl  -0x14(%ebp)
c0002bb1:	e8 e9 56 00 00       	call   c000829f <write>
c0002bb6:	83 c4 10             	add    $0x10,%esp
c0002bb9:	83 ec 0c             	sub    $0xc,%esp
c0002bbc:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002bc2:	50                   	push   %eax
c0002bc3:	e8 20 76 00 00       	call   c000a1e8 <Strlen>
c0002bc8:	83 c4 10             	add    $0x10,%esp
c0002bcb:	83 ec 04             	sub    $0x4,%esp
c0002bce:	50                   	push   %eax
c0002bcf:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002bd5:	50                   	push   %eax
c0002bd6:	ff 75 ec             	pushl  -0x14(%ebp)
c0002bd9:	e8 c1 56 00 00       	call   c000829f <write>
c0002bde:	83 c4 10             	add    $0x10,%esp
c0002be1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002be8:	eb 08                	jmp    c0002bf2 <INIT_fork+0x1c0>
c0002bea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002bee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002bf2:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0002bf6:	7e f2                	jle    c0002bea <INIT_fork+0x1b8>
c0002bf8:	e9 0f 01 00 00       	jmp    c0002d0c <INIT_fork+0x2da>
c0002bfd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002c01:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0002c05:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
c0002c0c:	68 69 6c 
c0002c0f:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
c0002c16:	8d 45 87             	lea    -0x79(%ebp),%eax
c0002c19:	b9 20 00 00 00       	mov    $0x20,%ecx
c0002c1e:	bb 00 00 00 00       	mov    $0x0,%ebx
c0002c23:	89 18                	mov    %ebx,(%eax)
c0002c25:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0002c29:	8d 50 04             	lea    0x4(%eax),%edx
c0002c2c:	83 e2 fc             	and    $0xfffffffc,%edx
c0002c2f:	29 d0                	sub    %edx,%eax
c0002c31:	01 c1                	add    %eax,%ecx
c0002c33:	83 e1 fc             	and    $0xfffffffc,%ecx
c0002c36:	83 e1 fc             	and    $0xfffffffc,%ecx
c0002c39:	b8 00 00 00 00       	mov    $0x0,%eax
c0002c3e:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0002c41:	83 c0 04             	add    $0x4,%eax
c0002c44:	39 c8                	cmp    %ecx,%eax
c0002c46:	72 f6                	jb     c0002c3e <INIT_fork+0x20c>
c0002c48:	01 c2                	add    %eax,%edx
c0002c4a:	83 ec 0c             	sub    $0xc,%esp
c0002c4d:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002c53:	50                   	push   %eax
c0002c54:	e8 8f 75 00 00       	call   c000a1e8 <Strlen>
c0002c59:	83 c4 10             	add    $0x10,%esp
c0002c5c:	83 ec 04             	sub    $0x4,%esp
c0002c5f:	50                   	push   %eax
c0002c60:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002c66:	50                   	push   %eax
c0002c67:	ff 75 ec             	pushl  -0x14(%ebp)
c0002c6a:	e8 30 56 00 00       	call   c000829f <write>
c0002c6f:	83 c4 10             	add    $0x10,%esp
c0002c72:	83 ec 0c             	sub    $0xc,%esp
c0002c75:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002c7b:	50                   	push   %eax
c0002c7c:	e8 67 75 00 00       	call   c000a1e8 <Strlen>
c0002c81:	83 c4 10             	add    $0x10,%esp
c0002c84:	83 ec 04             	sub    $0x4,%esp
c0002c87:	50                   	push   %eax
c0002c88:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002c8e:	50                   	push   %eax
c0002c8f:	ff 75 ec             	pushl  -0x14(%ebp)
c0002c92:	e8 08 56 00 00       	call   c000829f <write>
c0002c97:	83 c4 10             	add    $0x10,%esp
c0002c9a:	83 ec 0c             	sub    $0xc,%esp
c0002c9d:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002ca3:	50                   	push   %eax
c0002ca4:	e8 3f 75 00 00       	call   c000a1e8 <Strlen>
c0002ca9:	83 c4 10             	add    $0x10,%esp
c0002cac:	83 ec 04             	sub    $0x4,%esp
c0002caf:	50                   	push   %eax
c0002cb0:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002cb6:	50                   	push   %eax
c0002cb7:	ff 75 ec             	pushl  -0x14(%ebp)
c0002cba:	e8 e0 55 00 00       	call   c000829f <write>
c0002cbf:	83 c4 10             	add    $0x10,%esp
c0002cc2:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
c0002cc9:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
c0002cd0:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
c0002cd6:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
c0002cda:	83 ec 0c             	sub    $0xc,%esp
c0002cdd:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0002ce0:	50                   	push   %eax
c0002ce1:	e8 02 75 00 00       	call   c000a1e8 <Strlen>
c0002ce6:	83 c4 10             	add    $0x10,%esp
c0002ce9:	83 ec 04             	sub    $0x4,%esp
c0002cec:	50                   	push   %eax
c0002ced:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0002cf0:	50                   	push   %eax
c0002cf1:	ff 75 ec             	pushl  -0x14(%ebp)
c0002cf4:	e8 a6 55 00 00       	call   c000829f <write>
c0002cf9:	83 c4 10             	add    $0x10,%esp
c0002cfc:	83 ec 0c             	sub    $0xc,%esp
c0002cff:	68 f1 9a 00 c0       	push   $0xc0009af1
c0002d04:	e8 24 0a 00 00       	call   c000372d <spin>
c0002d09:	83 c4 10             	add    $0x10,%esp
c0002d0c:	83 ec 0c             	sub    $0xc,%esp
c0002d0f:	68 f8 9a 00 c0       	push   $0xc0009af8
c0002d14:	e8 14 0a 00 00       	call   c000372d <spin>
c0002d19:	83 c4 10             	add    $0x10,%esp
c0002d1c:	90                   	nop
c0002d1d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0002d20:	c9                   	leave  
c0002d21:	c3                   	ret    

c0002d22 <simple_shell>:
c0002d22:	55                   	push   %ebp
c0002d23:	89 e5                	mov    %esp,%ebp
c0002d25:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0002d2b:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0002d32:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0002d39:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0002d3f:	83 ec 08             	sub    $0x8,%esp
c0002d42:	6a 02                	push   $0x2
c0002d44:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0002d47:	50                   	push   %eax
c0002d48:	e8 c6 54 00 00       	call   c0008213 <open>
c0002d4d:	83 c4 10             	add    $0x10,%esp
c0002d50:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002d53:	83 ec 08             	sub    $0x8,%esp
c0002d56:	6a 02                	push   $0x2
c0002d58:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0002d5b:	50                   	push   %eax
c0002d5c:	e8 b2 54 00 00       	call   c0008213 <open>
c0002d61:	83 c4 10             	add    $0x10,%esp
c0002d64:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002d67:	83 ec 04             	sub    $0x4,%esp
c0002d6a:	68 80 00 00 00       	push   $0x80
c0002d6f:	6a 00                	push   $0x0
c0002d71:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002d77:	50                   	push   %eax
c0002d78:	e8 32 74 00 00       	call   c000a1af <Memset>
c0002d7d:	83 c4 10             	add    $0x10,%esp
c0002d80:	83 ec 04             	sub    $0x4,%esp
c0002d83:	68 80 00 00 00       	push   $0x80
c0002d88:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002d8e:	50                   	push   %eax
c0002d8f:	ff 75 e0             	pushl  -0x20(%ebp)
c0002d92:	e8 d1 54 00 00       	call   c0008268 <read>
c0002d97:	83 c4 10             	add    $0x10,%esp
c0002d9a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002da1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002da8:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002dae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002db1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002db4:	0f b6 00             	movzbl (%eax),%eax
c0002db7:	88 45 db             	mov    %al,-0x25(%ebp)
c0002dba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002dbd:	0f b6 00             	movzbl (%eax),%eax
c0002dc0:	3c 20                	cmp    $0x20,%al
c0002dc2:	74 1d                	je     c0002de1 <simple_shell+0xbf>
c0002dc4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002dc7:	0f b6 00             	movzbl (%eax),%eax
c0002dca:	84 c0                	test   %al,%al
c0002dcc:	74 13                	je     c0002de1 <simple_shell+0xbf>
c0002dce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002dd2:	75 0d                	jne    c0002de1 <simple_shell+0xbf>
c0002dd4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002dd7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002dda:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0002de1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002de4:	0f b6 00             	movzbl (%eax),%eax
c0002de7:	3c 20                	cmp    $0x20,%al
c0002de9:	74 0a                	je     c0002df5 <simple_shell+0xd3>
c0002deb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002dee:	0f b6 00             	movzbl (%eax),%eax
c0002df1:	84 c0                	test   %al,%al
c0002df3:	75 26                	jne    c0002e1b <simple_shell+0xf9>
c0002df5:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0002df9:	75 20                	jne    c0002e1b <simple_shell+0xf9>
c0002dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002dfe:	8d 50 01             	lea    0x1(%eax),%edx
c0002e01:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0002e04:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002e07:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0002e0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002e11:	c6 00 00             	movb   $0x0,(%eax)
c0002e14:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002e1b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002e1f:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0002e23:	75 8c                	jne    c0002db1 <simple_shell+0x8f>
c0002e25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002e28:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0002e2f:	00 00 00 00 
c0002e33:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0002e3a:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0002e40:	83 ec 08             	sub    $0x8,%esp
c0002e43:	6a 02                	push   $0x2
c0002e45:	50                   	push   %eax
c0002e46:	e8 c8 53 00 00       	call   c0008213 <open>
c0002e4b:	83 c4 10             	add    $0x10,%esp
c0002e4e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002e51:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0002e55:	75 54                	jne    c0002eab <simple_shell+0x189>
c0002e57:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002e5e:	eb 29                	jmp    c0002e89 <simple_shell+0x167>
c0002e60:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0002e66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002e69:	01 d0                	add    %edx,%eax
c0002e6b:	0f b6 00             	movzbl (%eax),%eax
c0002e6e:	0f be c0             	movsbl %al,%eax
c0002e71:	83 ec 04             	sub    $0x4,%esp
c0002e74:	50                   	push   %eax
c0002e75:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002e78:	68 00 9b 00 c0       	push   $0xc0009b00
c0002e7d:	e8 7c 05 00 00       	call   c00033fe <Printf>
c0002e82:	83 c4 10             	add    $0x10,%esp
c0002e85:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002e89:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0002e8d:	7e d1                	jle    c0002e60 <simple_shell+0x13e>
c0002e8f:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0002e95:	83 ec 08             	sub    $0x8,%esp
c0002e98:	50                   	push   %eax
c0002e99:	68 07 9b 00 c0       	push   $0xc0009b07
c0002e9e:	e8 5b 05 00 00       	call   c00033fe <Printf>
c0002ea3:	83 c4 10             	add    $0x10,%esp
c0002ea6:	e9 bc fe ff ff       	jmp    c0002d67 <simple_shell+0x45>
c0002eab:	e8 d9 54 00 00       	call   c0008389 <fork>
c0002eb0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002eb3:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0002eb7:	7e 17                	jle    c0002ed0 <simple_shell+0x1ae>
c0002eb9:	83 ec 0c             	sub    $0xc,%esp
c0002ebc:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0002ec2:	50                   	push   %eax
c0002ec3:	e8 5a 54 00 00       	call   c0008322 <wait>
c0002ec8:	83 c4 10             	add    $0x10,%esp
c0002ecb:	e9 97 fe ff ff       	jmp    c0002d67 <simple_shell+0x45>
c0002ed0:	83 ec 0c             	sub    $0xc,%esp
c0002ed3:	ff 75 d0             	pushl  -0x30(%ebp)
c0002ed6:	e8 fb 53 00 00       	call   c00082d6 <close>
c0002edb:	83 c4 10             	add    $0x10,%esp
c0002ede:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0002ee4:	83 ec 08             	sub    $0x8,%esp
c0002ee7:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0002eed:	52                   	push   %edx
c0002eee:	50                   	push   %eax
c0002eef:	e8 84 55 00 00       	call   c0008478 <execv>
c0002ef4:	83 c4 10             	add    $0x10,%esp
c0002ef7:	eb fe                	jmp    c0002ef7 <simple_shell+0x1d5>

c0002ef9 <test_split_str>:
c0002ef9:	55                   	push   %ebp
c0002efa:	89 e5                	mov    %esp,%ebp
c0002efc:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0002f02:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002f09:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002f10:	c7 45 ec 0d 9b 00 c0 	movl   $0xc0009b0d,-0x14(%ebp)
c0002f17:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002f1b:	75 1a                	jne    c0002f37 <test_split_str+0x3e>
c0002f1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f20:	0f b6 00             	movzbl (%eax),%eax
c0002f23:	0f be c0             	movsbl %al,%eax
c0002f26:	83 ec 08             	sub    $0x8,%esp
c0002f29:	50                   	push   %eax
c0002f2a:	68 1e 9b 00 c0       	push   $0xc0009b1e
c0002f2f:	e8 ca 04 00 00       	call   c00033fe <Printf>
c0002f34:	83 c4 10             	add    $0x10,%esp
c0002f37:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f3a:	0f b6 00             	movzbl (%eax),%eax
c0002f3d:	3c 20                	cmp    $0x20,%al
c0002f3f:	75 0a                	jne    c0002f4b <test_split_str+0x52>
c0002f41:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f44:	0f b6 00             	movzbl (%eax),%eax
c0002f47:	84 c0                	test   %al,%al
c0002f49:	74 13                	je     c0002f5e <test_split_str+0x65>
c0002f4b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002f4f:	75 0d                	jne    c0002f5e <test_split_str+0x65>
c0002f51:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f54:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002f57:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0002f5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f61:	0f b6 00             	movzbl (%eax),%eax
c0002f64:	3c 20                	cmp    $0x20,%al
c0002f66:	74 0a                	je     c0002f72 <test_split_str+0x79>
c0002f68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f6b:	0f b6 00             	movzbl (%eax),%eax
c0002f6e:	84 c0                	test   %al,%al
c0002f70:	75 26                	jne    c0002f98 <test_split_str+0x9f>
c0002f72:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0002f76:	75 20                	jne    c0002f98 <test_split_str+0x9f>
c0002f78:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002f7b:	8d 50 01             	lea    0x1(%eax),%edx
c0002f7e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0002f81:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002f84:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0002f8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f8e:	c6 00 00             	movb   $0x0,(%eax)
c0002f91:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002f98:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002f9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f9f:	0f b6 00             	movzbl (%eax),%eax
c0002fa2:	84 c0                	test   %al,%al
c0002fa4:	0f 85 6d ff ff ff    	jne    c0002f17 <test_split_str+0x1e>
c0002faa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002fad:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002fb0:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0002fb7:	83 ec 08             	sub    $0x8,%esp
c0002fba:	ff 75 f4             	pushl  -0xc(%ebp)
c0002fbd:	68 27 9b 00 c0       	push   $0xc0009b27
c0002fc2:	e8 37 04 00 00       	call   c00033fe <Printf>
c0002fc7:	83 c4 10             	add    $0x10,%esp
c0002fca:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002fd1:	eb 22                	jmp    c0002ff5 <test_split_str+0xfc>
c0002fd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002fd6:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0002fdd:	83 ec 04             	sub    $0x4,%esp
c0002fe0:	50                   	push   %eax
c0002fe1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002fe4:	68 3e 9b 00 c0       	push   $0xc0009b3e
c0002fe9:	e8 10 04 00 00       	call   c00033fe <Printf>
c0002fee:	83 c4 10             	add    $0x10,%esp
c0002ff1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002ff5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002ff8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0002ffb:	7e d6                	jle    c0002fd3 <test_split_str+0xda>
c0002ffd:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0003003:	83 ec 08             	sub    $0x8,%esp
c0003006:	68 4d 9b 00 c0       	push   $0xc0009b4d
c000300b:	50                   	push   %eax
c000300c:	e8 a6 12 00 00       	call   c00042b7 <strcmp>
c0003011:	83 c4 10             	add    $0x10,%esp
c0003014:	85 c0                	test   %eax,%eax
c0003016:	75 10                	jne    c0003028 <test_split_str+0x12f>
c0003018:	83 ec 0c             	sub    $0xc,%esp
c000301b:	68 52 9b 00 c0       	push   $0xc0009b52
c0003020:	e8 d9 03 00 00       	call   c00033fe <Printf>
c0003025:	83 c4 10             	add    $0x10,%esp
c0003028:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c000302e:	83 ec 08             	sub    $0x8,%esp
c0003031:	50                   	push   %eax
c0003032:	68 5e 9b 00 c0       	push   $0xc0009b5e
c0003037:	e8 c2 03 00 00       	call   c00033fe <Printf>
c000303c:	83 c4 10             	add    $0x10,%esp
c000303f:	83 ec 0c             	sub    $0xc,%esp
c0003042:	68 6c 9b 00 c0       	push   $0xc0009b6c
c0003047:	e8 b2 03 00 00       	call   c00033fe <Printf>
c000304c:	83 c4 10             	add    $0x10,%esp
c000304f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003056:	eb 26                	jmp    c000307e <test_split_str+0x185>
c0003058:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c000305e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003061:	01 d0                	add    %edx,%eax
c0003063:	0f b6 00             	movzbl (%eax),%eax
c0003066:	0f be c0             	movsbl %al,%eax
c0003069:	83 ec 08             	sub    $0x8,%esp
c000306c:	50                   	push   %eax
c000306d:	68 7b 9b 00 c0       	push   $0xc0009b7b
c0003072:	e8 87 03 00 00       	call   c00033fe <Printf>
c0003077:	83 c4 10             	add    $0x10,%esp
c000307a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000307e:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0003082:	7e d4                	jle    c0003058 <test_split_str+0x15f>
c0003084:	c9                   	leave  
c0003085:	c3                   	ret    

c0003086 <test_shell>:
c0003086:	55                   	push   %ebp
c0003087:	89 e5                	mov    %esp,%ebp
c0003089:	83 ec 48             	sub    $0x48,%esp
c000308c:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0003093:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c000309a:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c00030a0:	83 ec 08             	sub    $0x8,%esp
c00030a3:	6a 02                	push   $0x2
c00030a5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c00030a8:	50                   	push   %eax
c00030a9:	e8 65 51 00 00       	call   c0008213 <open>
c00030ae:	83 c4 10             	add    $0x10,%esp
c00030b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00030b4:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c00030bb:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c00030c2:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c00030c9:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c00030d0:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c00030d7:	83 ec 0c             	sub    $0xc,%esp
c00030da:	8d 45 ce             	lea    -0x32(%ebp),%eax
c00030dd:	50                   	push   %eax
c00030de:	e8 de e7 ff ff       	call   c00018c1 <untar>
c00030e3:	83 c4 10             	add    $0x10,%esp
c00030e6:	e8 9e 52 00 00       	call   c0008389 <fork>
c00030eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00030ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00030f2:	7e 25                	jle    c0003119 <test_shell+0x93>
c00030f4:	83 ec 0c             	sub    $0xc,%esp
c00030f7:	8d 45 c8             	lea    -0x38(%ebp),%eax
c00030fa:	50                   	push   %eax
c00030fb:	e8 22 52 00 00       	call   c0008322 <wait>
c0003100:	83 c4 10             	add    $0x10,%esp
c0003103:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003106:	83 ec 08             	sub    $0x8,%esp
c0003109:	50                   	push   %eax
c000310a:	68 84 9b 00 c0       	push   $0xc0009b84
c000310f:	e8 ea 02 00 00       	call   c00033fe <Printf>
c0003114:	83 c4 10             	add    $0x10,%esp
c0003117:	eb 23                	jmp    c000313c <test_shell+0xb6>
c0003119:	83 ec 0c             	sub    $0xc,%esp
c000311c:	68 96 9b 00 c0       	push   $0xc0009b96
c0003121:	e8 d8 02 00 00       	call   c00033fe <Printf>
c0003126:	83 c4 10             	add    $0x10,%esp
c0003129:	83 ec 0c             	sub    $0xc,%esp
c000312c:	ff 75 f4             	pushl  -0xc(%ebp)
c000312f:	e8 a2 51 00 00       	call   c00082d6 <close>
c0003134:	83 c4 10             	add    $0x10,%esp
c0003137:	e8 e6 fb ff ff       	call   c0002d22 <simple_shell>
c000313c:	83 ec 0c             	sub    $0xc,%esp
c000313f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003142:	50                   	push   %eax
c0003143:	e8 da 51 00 00       	call   c0008322 <wait>
c0003148:	83 c4 10             	add    $0x10,%esp
c000314b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000314e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003151:	83 ec 08             	sub    $0x8,%esp
c0003154:	50                   	push   %eax
c0003155:	68 a4 9b 00 c0       	push   $0xc0009ba4
c000315a:	e8 9f 02 00 00       	call   c00033fe <Printf>
c000315f:	83 c4 10             	add    $0x10,%esp
c0003162:	eb d8                	jmp    c000313c <test_shell+0xb6>

c0003164 <test_exec>:
c0003164:	55                   	push   %ebp
c0003165:	89 e5                	mov    %esp,%ebp
c0003167:	83 ec 38             	sub    $0x38,%esp
c000316a:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0003171:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0003178:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c000317e:	83 ec 08             	sub    $0x8,%esp
c0003181:	6a 02                	push   $0x2
c0003183:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0003186:	50                   	push   %eax
c0003187:	e8 87 50 00 00       	call   c0008213 <open>
c000318c:	83 c4 10             	add    $0x10,%esp
c000318f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003192:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0003199:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c00031a0:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c00031a7:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c00031ae:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00031b5:	83 ec 0c             	sub    $0xc,%esp
c00031b8:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c00031bb:	50                   	push   %eax
c00031bc:	e8 00 e7 ff ff       	call   c00018c1 <untar>
c00031c1:	83 c4 10             	add    $0x10,%esp
c00031c4:	e8 c0 51 00 00       	call   c0008389 <fork>
c00031c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00031cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00031d0:	7e 25                	jle    c00031f7 <test_exec+0x93>
c00031d2:	83 ec 0c             	sub    $0xc,%esp
c00031d5:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00031d8:	50                   	push   %eax
c00031d9:	e8 44 51 00 00       	call   c0008322 <wait>
c00031de:	83 c4 10             	add    $0x10,%esp
c00031e1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00031e4:	83 ec 08             	sub    $0x8,%esp
c00031e7:	50                   	push   %eax
c00031e8:	68 84 9b 00 c0       	push   $0xc0009b84
c00031ed:	e8 0c 02 00 00       	call   c00033fe <Printf>
c00031f2:	83 c4 10             	add    $0x10,%esp
c00031f5:	eb 33                	jmp    c000322a <test_exec+0xc6>
c00031f7:	83 ec 0c             	sub    $0xc,%esp
c00031fa:	68 96 9b 00 c0       	push   $0xc0009b96
c00031ff:	e8 fa 01 00 00       	call   c00033fe <Printf>
c0003204:	83 c4 10             	add    $0x10,%esp
c0003207:	83 ec 0c             	sub    $0xc,%esp
c000320a:	6a 00                	push   $0x0
c000320c:	68 bf 9b 00 c0       	push   $0xc0009bbf
c0003211:	68 c5 9b 00 c0       	push   $0xc0009bc5
c0003216:	68 4d 9b 00 c0       	push   $0xc0009b4d
c000321b:	68 cb 9b 00 c0       	push   $0xc0009bcb
c0003220:	e8 f8 53 00 00       	call   c000861d <execl>
c0003225:	83 c4 20             	add    $0x20,%esp
c0003228:	eb fe                	jmp    c0003228 <test_exec+0xc4>
c000322a:	c9                   	leave  
c000322b:	c3                   	ret    

c000322c <INIT>:
c000322c:	55                   	push   %ebp
c000322d:	89 e5                	mov    %esp,%ebp
c000322f:	83 ec 08             	sub    $0x8,%esp
c0003232:	e8 4f fe ff ff       	call   c0003086 <test_shell>
c0003237:	eb fe                	jmp    c0003237 <INIT+0xb>

c0003239 <TestA>:
c0003239:	55                   	push   %ebp
c000323a:	89 e5                	mov    %esp,%ebp
c000323c:	66 87 db             	xchg   %bx,%bx
c000323f:	eb fe                	jmp    c000323f <TestA+0x6>

c0003241 <delay>:
c0003241:	55                   	push   %ebp
c0003242:	89 e5                	mov    %esp,%ebp
c0003244:	83 ec 10             	sub    $0x10,%esp
c0003247:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000324e:	eb 2d                	jmp    c000327d <delay+0x3c>
c0003250:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0003257:	eb 1a                	jmp    c0003273 <delay+0x32>
c0003259:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003260:	eb 04                	jmp    c0003266 <delay+0x25>
c0003262:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003266:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c000326d:	7e f3                	jle    c0003262 <delay+0x21>
c000326f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003273:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0003277:	7e e0                	jle    c0003259 <delay+0x18>
c0003279:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000327d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003280:	3b 45 08             	cmp    0x8(%ebp),%eax
c0003283:	7c cb                	jl     c0003250 <delay+0xf>
c0003285:	90                   	nop
c0003286:	c9                   	leave  
c0003287:	c3                   	ret    

c0003288 <TestB>:
c0003288:	55                   	push   %ebp
c0003289:	89 e5                	mov    %esp,%ebp
c000328b:	83 ec 18             	sub    $0x18,%esp
c000328e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003295:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0003299:	77 16                	ja     c00032b1 <TestB+0x29>
c000329b:	e8 57 0e 00 00       	call   c00040f7 <get_ticks_ipc>
c00032a0:	83 ec 08             	sub    $0x8,%esp
c00032a3:	50                   	push   %eax
c00032a4:	68 d1 9b 00 c0       	push   $0xc0009bd1
c00032a9:	e8 50 01 00 00       	call   c00033fe <Printf>
c00032ae:	83 c4 10             	add    $0x10,%esp
c00032b1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00032b5:	eb de                	jmp    c0003295 <TestB+0xd>

c00032b7 <TestC>:
c00032b7:	55                   	push   %ebp
c00032b8:	89 e5                	mov    %esp,%ebp
c00032ba:	83 ec 18             	sub    $0x18,%esp
c00032bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00032c4:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c00032c8:	77 1a                	ja     c00032e4 <TestC+0x2d>
c00032ca:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c00032d1:	83 ec 08             	sub    $0x8,%esp
c00032d4:	ff 75 f0             	pushl  -0x10(%ebp)
c00032d7:	68 d8 9b 00 c0       	push   $0xc0009bd8
c00032dc:	e8 1d 01 00 00       	call   c00033fe <Printf>
c00032e1:	83 c4 10             	add    $0x10,%esp
c00032e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00032e8:	eb da                	jmp    c00032c4 <TestC+0xd>

c00032ea <sys_get_ticks>:
c00032ea:	55                   	push   %ebp
c00032eb:	89 e5                	mov    %esp,%ebp
c00032ed:	a1 20 0e 01 c0       	mov    0xc0010e20,%eax
c00032f2:	5d                   	pop    %ebp
c00032f3:	c3                   	ret    

c00032f4 <sys_write>:
c00032f4:	55                   	push   %ebp
c00032f5:	89 e5                	mov    %esp,%ebp
c00032f7:	83 ec 18             	sub    $0x18,%esp
c00032fa:	8b 45 10             	mov    0x10(%ebp),%eax
c00032fd:	8b 40 24             	mov    0x24(%eax),%eax
c0003300:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0003306:	05 00 ed 00 c0       	add    $0xc000ed00,%eax
c000330b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000330e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003311:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003314:	8b 45 08             	mov    0x8(%ebp),%eax
c0003317:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000331a:	eb 20                	jmp    c000333c <sys_write+0x48>
c000331c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000331f:	0f b6 00             	movzbl (%eax),%eax
c0003322:	0f b6 c0             	movzbl %al,%eax
c0003325:	83 ec 08             	sub    $0x8,%esp
c0003328:	50                   	push   %eax
c0003329:	ff 75 ec             	pushl  -0x14(%ebp)
c000332c:	e8 fd 42 00 00       	call   c000762e <out_char>
c0003331:	83 c4 10             	add    $0x10,%esp
c0003334:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003338:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c000333c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003340:	7f da                	jg     c000331c <sys_write+0x28>
c0003342:	90                   	nop
c0003343:	c9                   	leave  
c0003344:	c3                   	ret    

c0003345 <milli_delay>:
c0003345:	55                   	push   %ebp
c0003346:	89 e5                	mov    %esp,%ebp
c0003348:	83 ec 18             	sub    $0x18,%esp
c000334b:	e8 a7 0d 00 00       	call   c00040f7 <get_ticks_ipc>
c0003350:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003353:	90                   	nop
c0003354:	e8 9e 0d 00 00       	call   c00040f7 <get_ticks_ipc>
c0003359:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000335c:	89 c1                	mov    %eax,%ecx
c000335e:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0003363:	89 c8                	mov    %ecx,%eax
c0003365:	f7 ea                	imul   %edx
c0003367:	c1 fa 05             	sar    $0x5,%edx
c000336a:	89 c8                	mov    %ecx,%eax
c000336c:	c1 f8 1f             	sar    $0x1f,%eax
c000336f:	29 c2                	sub    %eax,%edx
c0003371:	89 d0                	mov    %edx,%eax
c0003373:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0003379:	39 45 08             	cmp    %eax,0x8(%ebp)
c000337c:	77 d6                	ja     c0003354 <milli_delay+0xf>
c000337e:	90                   	nop
c000337f:	c9                   	leave  
c0003380:	c3                   	ret    

c0003381 <TaskSys>:
c0003381:	55                   	push   %ebp
c0003382:	89 e5                	mov    %esp,%ebp
c0003384:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000338a:	83 ec 0c             	sub    $0xc,%esp
c000338d:	68 e5 9b 00 c0       	push   $0xc0009be5
c0003392:	e8 f5 e1 ff ff       	call   c000158c <disp_str>
c0003397:	83 c4 10             	add    $0x10,%esp
c000339a:	83 ec 04             	sub    $0x4,%esp
c000339d:	6a 6c                	push   $0x6c
c000339f:	6a 00                	push   $0x0
c00033a1:	8d 45 80             	lea    -0x80(%ebp),%eax
c00033a4:	50                   	push   %eax
c00033a5:	e8 05 6e 00 00       	call   c000a1af <Memset>
c00033aa:	83 c4 10             	add    $0x10,%esp
c00033ad:	83 ec 08             	sub    $0x8,%esp
c00033b0:	6a 0b                	push   $0xb
c00033b2:	8d 45 80             	lea    -0x80(%ebp),%eax
c00033b5:	50                   	push   %eax
c00033b6:	e8 33 1c 00 00       	call   c0004fee <receive_msg>
c00033bb:	83 c4 10             	add    $0x10,%esp
c00033be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00033c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00033c5:	75 34                	jne    c00033fb <TaskSys+0x7a>
c00033c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00033cd:	8b 45 80             	mov    -0x80(%ebp),%eax
c00033d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00033d3:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00033d7:	75 1f                	jne    c00033f8 <TaskSys+0x77>
c00033d9:	a1 20 0e 01 c0       	mov    0xc0010e20,%eax
c00033de:	89 45 88             	mov    %eax,-0x78(%ebp)
c00033e1:	83 ec 08             	sub    $0x8,%esp
c00033e4:	ff 75 ec             	pushl  -0x14(%ebp)
c00033e7:	8d 45 80             	lea    -0x80(%ebp),%eax
c00033ea:	50                   	push   %eax
c00033eb:	e8 d8 1b 00 00       	call   c0004fc8 <send_msg>
c00033f0:	83 c4 10             	add    $0x10,%esp
c00033f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00033f6:	eb 01                	jmp    c00033f9 <TaskSys+0x78>
c00033f8:	90                   	nop
c00033f9:	eb 9f                	jmp    c000339a <TaskSys+0x19>
c00033fb:	90                   	nop
c00033fc:	c9                   	leave  
c00033fd:	c3                   	ret    

c00033fe <Printf>:
c00033fe:	55                   	push   %ebp
c00033ff:	89 e5                	mov    %esp,%ebp
c0003401:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0003407:	83 ec 04             	sub    $0x4,%esp
c000340a:	68 00 01 00 00       	push   $0x100
c000340f:	6a 00                	push   $0x0
c0003411:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0003417:	50                   	push   %eax
c0003418:	e8 92 6d 00 00       	call   c000a1af <Memset>
c000341d:	83 c4 10             	add    $0x10,%esp
c0003420:	8d 45 0c             	lea    0xc(%ebp),%eax
c0003423:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003426:	8b 45 08             	mov    0x8(%ebp),%eax
c0003429:	83 ec 04             	sub    $0x4,%esp
c000342c:	ff 75 f4             	pushl  -0xc(%ebp)
c000342f:	50                   	push   %eax
c0003430:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0003436:	50                   	push   %eax
c0003437:	e8 20 00 00 00       	call   c000345c <vsprintf>
c000343c:	83 c4 10             	add    $0x10,%esp
c000343f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003442:	83 ec 04             	sub    $0x4,%esp
c0003445:	ff 75 f0             	pushl  -0x10(%ebp)
c0003448:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000344e:	50                   	push   %eax
c000344f:	6a 00                	push   $0x0
c0003451:	e8 49 4e 00 00       	call   c000829f <write>
c0003456:	83 c4 10             	add    $0x10,%esp
c0003459:	90                   	nop
c000345a:	c9                   	leave  
c000345b:	c3                   	ret    

c000345c <vsprintf>:
c000345c:	55                   	push   %ebp
c000345d:	89 e5                	mov    %esp,%ebp
c000345f:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0003465:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000346b:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0003471:	83 ec 04             	sub    $0x4,%esp
c0003474:	6a 40                	push   $0x40
c0003476:	6a 00                	push   $0x0
c0003478:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000347e:	50                   	push   %eax
c000347f:	e8 2b 6d 00 00       	call   c000a1af <Memset>
c0003484:	83 c4 10             	add    $0x10,%esp
c0003487:	8b 45 10             	mov    0x10(%ebp),%eax
c000348a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000348d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003494:	8b 45 08             	mov    0x8(%ebp),%eax
c0003497:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000349a:	e9 53 01 00 00       	jmp    c00035f2 <vsprintf+0x196>
c000349f:	8b 45 0c             	mov    0xc(%ebp),%eax
c00034a2:	0f b6 00             	movzbl (%eax),%eax
c00034a5:	3c 25                	cmp    $0x25,%al
c00034a7:	74 16                	je     c00034bf <vsprintf+0x63>
c00034a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00034ac:	8d 50 01             	lea    0x1(%eax),%edx
c00034af:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00034b2:	8b 55 0c             	mov    0xc(%ebp),%edx
c00034b5:	0f b6 12             	movzbl (%edx),%edx
c00034b8:	88 10                	mov    %dl,(%eax)
c00034ba:	e9 2f 01 00 00       	jmp    c00035ee <vsprintf+0x192>
c00034bf:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00034c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00034c6:	0f b6 00             	movzbl (%eax),%eax
c00034c9:	0f be c0             	movsbl %al,%eax
c00034cc:	83 f8 64             	cmp    $0x64,%eax
c00034cf:	74 26                	je     c00034f7 <vsprintf+0x9b>
c00034d1:	83 f8 64             	cmp    $0x64,%eax
c00034d4:	7f 0e                	jg     c00034e4 <vsprintf+0x88>
c00034d6:	83 f8 63             	cmp    $0x63,%eax
c00034d9:	0f 84 f2 00 00 00    	je     c00035d1 <vsprintf+0x175>
c00034df:	e9 0a 01 00 00       	jmp    c00035ee <vsprintf+0x192>
c00034e4:	83 f8 73             	cmp    $0x73,%eax
c00034e7:	0f 84 b0 00 00 00    	je     c000359d <vsprintf+0x141>
c00034ed:	83 f8 78             	cmp    $0x78,%eax
c00034f0:	74 5d                	je     c000354f <vsprintf+0xf3>
c00034f2:	e9 f7 00 00 00       	jmp    c00035ee <vsprintf+0x192>
c00034f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034fa:	8b 00                	mov    (%eax),%eax
c00034fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00034ff:	83 ec 04             	sub    $0x4,%esp
c0003502:	6a 0a                	push   $0xa
c0003504:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c000350a:	50                   	push   %eax
c000350b:	ff 75 e8             	pushl  -0x18(%ebp)
c000350e:	e8 2f 0c 00 00       	call   c0004142 <itoa>
c0003513:	83 c4 10             	add    $0x10,%esp
c0003516:	83 ec 08             	sub    $0x8,%esp
c0003519:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000351f:	50                   	push   %eax
c0003520:	ff 75 f4             	pushl  -0xc(%ebp)
c0003523:	e8 a6 6c 00 00       	call   c000a1ce <Strcpy>
c0003528:	83 c4 10             	add    $0x10,%esp
c000352b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000352f:	83 ec 0c             	sub    $0xc,%esp
c0003532:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0003538:	50                   	push   %eax
c0003539:	e8 aa 6c 00 00       	call   c000a1e8 <Strlen>
c000353e:	83 c4 10             	add    $0x10,%esp
c0003541:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003544:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003547:	01 45 f4             	add    %eax,-0xc(%ebp)
c000354a:	e9 9f 00 00 00       	jmp    c00035ee <vsprintf+0x192>
c000354f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003552:	8b 00                	mov    (%eax),%eax
c0003554:	83 ec 08             	sub    $0x8,%esp
c0003557:	50                   	push   %eax
c0003558:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000355e:	50                   	push   %eax
c000355f:	e8 67 e5 ff ff       	call   c0001acb <atoi>
c0003564:	83 c4 10             	add    $0x10,%esp
c0003567:	83 ec 08             	sub    $0x8,%esp
c000356a:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0003570:	50                   	push   %eax
c0003571:	ff 75 f4             	pushl  -0xc(%ebp)
c0003574:	e8 55 6c 00 00       	call   c000a1ce <Strcpy>
c0003579:	83 c4 10             	add    $0x10,%esp
c000357c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0003580:	83 ec 0c             	sub    $0xc,%esp
c0003583:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0003589:	50                   	push   %eax
c000358a:	e8 59 6c 00 00       	call   c000a1e8 <Strlen>
c000358f:	83 c4 10             	add    $0x10,%esp
c0003592:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003595:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003598:	01 45 f4             	add    %eax,-0xc(%ebp)
c000359b:	eb 51                	jmp    c00035ee <vsprintf+0x192>
c000359d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035a0:	8b 00                	mov    (%eax),%eax
c00035a2:	83 ec 08             	sub    $0x8,%esp
c00035a5:	50                   	push   %eax
c00035a6:	ff 75 f4             	pushl  -0xc(%ebp)
c00035a9:	e8 20 6c 00 00       	call   c000a1ce <Strcpy>
c00035ae:	83 c4 10             	add    $0x10,%esp
c00035b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035b4:	8b 00                	mov    (%eax),%eax
c00035b6:	83 ec 0c             	sub    $0xc,%esp
c00035b9:	50                   	push   %eax
c00035ba:	e8 29 6c 00 00       	call   c000a1e8 <Strlen>
c00035bf:	83 c4 10             	add    $0x10,%esp
c00035c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00035c5:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00035c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035cc:	01 45 f4             	add    %eax,-0xc(%ebp)
c00035cf:	eb 1d                	jmp    c00035ee <vsprintf+0x192>
c00035d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035d4:	0f b6 10             	movzbl (%eax),%edx
c00035d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00035da:	88 10                	mov    %dl,(%eax)
c00035dc:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00035e0:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00035e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035ea:	01 45 f4             	add    %eax,-0xc(%ebp)
c00035ed:	90                   	nop
c00035ee:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00035f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035f5:	0f b6 00             	movzbl (%eax),%eax
c00035f8:	84 c0                	test   %al,%al
c00035fa:	0f 85 9f fe ff ff    	jne    c000349f <vsprintf+0x43>
c0003600:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003603:	2b 45 08             	sub    0x8(%ebp),%eax
c0003606:	c9                   	leave  
c0003607:	c3                   	ret    

c0003608 <printx>:
c0003608:	55                   	push   %ebp
c0003609:	89 e5                	mov    %esp,%ebp
c000360b:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0003611:	8d 45 0c             	lea    0xc(%ebp),%eax
c0003614:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003617:	8b 45 08             	mov    0x8(%ebp),%eax
c000361a:	83 ec 04             	sub    $0x4,%esp
c000361d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003620:	50                   	push   %eax
c0003621:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0003627:	50                   	push   %eax
c0003628:	e8 2f fe ff ff       	call   c000345c <vsprintf>
c000362d:	83 c4 10             	add    $0x10,%esp
c0003630:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003633:	83 ec 08             	sub    $0x8,%esp
c0003636:	ff 75 f0             	pushl  -0x10(%ebp)
c0003639:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000363f:	50                   	push   %eax
c0003640:	e8 63 19 00 00       	call   c0004fa8 <write_debug>
c0003645:	83 c4 10             	add    $0x10,%esp
c0003648:	90                   	nop
c0003649:	c9                   	leave  
c000364a:	c3                   	ret    

c000364b <sys_printx>:
c000364b:	55                   	push   %ebp
c000364c:	89 e5                	mov    %esp,%ebp
c000364e:	83 ec 28             	sub    $0x28,%esp
c0003651:	a1 a0 e6 00 c0       	mov    0xc000e6a0,%eax
c0003656:	85 c0                	test   %eax,%eax
c0003658:	75 23                	jne    c000367d <sys_printx+0x32>
c000365a:	8b 45 10             	mov    0x10(%ebp),%eax
c000365d:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0003663:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003666:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003669:	83 ec 08             	sub    $0x8,%esp
c000366c:	ff 75 10             	pushl  0x10(%ebp)
c000366f:	50                   	push   %eax
c0003670:	e8 07 3b 00 00       	call   c000717c <Seg2PhyAddrLDT>
c0003675:	83 c4 10             	add    $0x10,%esp
c0003678:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000367b:	eb 19                	jmp    c0003696 <sys_printx+0x4b>
c000367d:	a1 a0 e6 00 c0       	mov    0xc000e6a0,%eax
c0003682:	85 c0                	test   %eax,%eax
c0003684:	74 10                	je     c0003696 <sys_printx+0x4b>
c0003686:	83 ec 0c             	sub    $0xc,%esp
c0003689:	6a 30                	push   $0x30
c000368b:	e8 ab 3a 00 00       	call   c000713b <Seg2PhyAddr>
c0003690:	83 c4 10             	add    $0x10,%esp
c0003693:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003696:	8b 55 08             	mov    0x8(%ebp),%edx
c0003699:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000369c:	01 d0                	add    %edx,%eax
c000369e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00036a1:	8b 45 10             	mov    0x10(%ebp),%eax
c00036a4:	8b 40 24             	mov    0x24(%eax),%eax
c00036a7:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c00036ad:	05 00 ed 00 c0       	add    $0xc000ed00,%eax
c00036b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00036b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00036b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00036bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036be:	0f b6 00             	movzbl (%eax),%eax
c00036c1:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00036c4:	eb 3a                	jmp    c0003700 <sys_printx+0xb5>
c00036c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036c9:	0f b6 00             	movzbl (%eax),%eax
c00036cc:	3c 3b                	cmp    $0x3b,%al
c00036ce:	74 0a                	je     c00036da <sys_printx+0x8f>
c00036d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036d3:	0f b6 00             	movzbl (%eax),%eax
c00036d6:	3c 3a                	cmp    $0x3a,%al
c00036d8:	75 06                	jne    c00036e0 <sys_printx+0x95>
c00036da:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00036de:	eb 20                	jmp    c0003700 <sys_printx+0xb5>
c00036e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036e3:	0f b6 00             	movzbl (%eax),%eax
c00036e6:	0f b6 c0             	movzbl %al,%eax
c00036e9:	83 ec 08             	sub    $0x8,%esp
c00036ec:	50                   	push   %eax
c00036ed:	ff 75 e4             	pushl  -0x1c(%ebp)
c00036f0:	e8 39 3f 00 00       	call   c000762e <out_char>
c00036f5:	83 c4 10             	add    $0x10,%esp
c00036f8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00036fc:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003700:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003704:	7f c0                	jg     c00036c6 <sys_printx+0x7b>
c0003706:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c000370a:	75 11                	jne    c000371d <sys_printx+0xd2>
c000370c:	a1 a0 e6 00 c0       	mov    0xc000e6a0,%eax
c0003711:	85 c0                	test   %eax,%eax
c0003713:	74 15                	je     c000372a <sys_printx+0xdf>
c0003715:	e8 e7 e0 ff ff       	call   c0001801 <disable_int>
c000371a:	f4                   	hlt    
c000371b:	eb 0d                	jmp    c000372a <sys_printx+0xdf>
c000371d:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0003721:	75 07                	jne    c000372a <sys_printx+0xdf>
c0003723:	e8 d9 e0 ff ff       	call   c0001801 <disable_int>
c0003728:	f4                   	hlt    
c0003729:	90                   	nop
c000372a:	90                   	nop
c000372b:	c9                   	leave  
c000372c:	c3                   	ret    

c000372d <spin>:
c000372d:	55                   	push   %ebp
c000372e:	89 e5                	mov    %esp,%ebp
c0003730:	eb fe                	jmp    c0003730 <spin+0x3>

c0003732 <panic>:
c0003732:	55                   	push   %ebp
c0003733:	89 e5                	mov    %esp,%ebp
c0003735:	83 ec 08             	sub    $0x8,%esp
c0003738:	83 ec 04             	sub    $0x4,%esp
c000373b:	ff 75 08             	pushl  0x8(%ebp)
c000373e:	6a 3a                	push   $0x3a
c0003740:	68 ee 9b 00 c0       	push   $0xc0009bee
c0003745:	e8 be fe ff ff       	call   c0003608 <printx>
c000374a:	83 c4 10             	add    $0x10,%esp
c000374d:	90                   	nop
c000374e:	c9                   	leave  
c000374f:	c3                   	ret    

c0003750 <assertion_failure>:
c0003750:	55                   	push   %ebp
c0003751:	89 e5                	mov    %esp,%ebp
c0003753:	83 ec 08             	sub    $0x8,%esp
c0003756:	83 ec 08             	sub    $0x8,%esp
c0003759:	ff 75 14             	pushl  0x14(%ebp)
c000375c:	ff 75 10             	pushl  0x10(%ebp)
c000375f:	ff 75 0c             	pushl  0xc(%ebp)
c0003762:	ff 75 08             	pushl  0x8(%ebp)
c0003765:	6a 3b                	push   $0x3b
c0003767:	68 f4 9b 00 c0       	push   $0xc0009bf4
c000376c:	e8 97 fe ff ff       	call   c0003608 <printx>
c0003771:	83 c4 20             	add    $0x20,%esp
c0003774:	83 ec 0c             	sub    $0xc,%esp
c0003777:	68 27 9c 00 c0       	push   $0xc0009c27
c000377c:	e8 ac ff ff ff       	call   c000372d <spin>
c0003781:	83 c4 10             	add    $0x10,%esp
c0003784:	90                   	nop
c0003785:	c9                   	leave  
c0003786:	c3                   	ret    

c0003787 <dead_lock>:
c0003787:	55                   	push   %ebp
c0003788:	89 e5                	mov    %esp,%ebp
c000378a:	b8 00 00 00 00       	mov    $0x0,%eax
c000378f:	5d                   	pop    %ebp
c0003790:	c3                   	ret    

c0003791 <sys_send_msg>:
c0003791:	55                   	push   %ebp
c0003792:	89 e5                	mov    %esp,%ebp
c0003794:	83 ec 48             	sub    $0x48,%esp
c0003797:	83 ec 0c             	sub    $0xc,%esp
c000379a:	ff 75 0c             	pushl  0xc(%ebp)
c000379d:	e8 f1 38 00 00       	call   c0007093 <pid2proc>
c00037a2:	83 c4 10             	add    $0x10,%esp
c00037a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00037a8:	83 ec 0c             	sub    $0xc,%esp
c00037ab:	ff 75 10             	pushl  0x10(%ebp)
c00037ae:	e8 fc 38 00 00       	call   c00070af <proc2pid>
c00037b3:	83 c4 10             	add    $0x10,%esp
c00037b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00037b9:	8b 45 10             	mov    0x10(%ebp),%eax
c00037bc:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c00037c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00037c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00037c8:	83 ec 08             	sub    $0x8,%esp
c00037cb:	ff 75 10             	pushl  0x10(%ebp)
c00037ce:	50                   	push   %eax
c00037cf:	e8 a8 39 00 00       	call   c000717c <Seg2PhyAddrLDT>
c00037d4:	83 c4 10             	add    $0x10,%esp
c00037d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00037da:	8b 55 08             	mov    0x8(%ebp),%edx
c00037dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00037e0:	01 d0                	add    %edx,%eax
c00037e2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00037e5:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c00037ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00037ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00037f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00037f5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00037f8:	89 10                	mov    %edx,(%eax)
c00037fa:	83 ec 08             	sub    $0x8,%esp
c00037fd:	ff 75 0c             	pushl  0xc(%ebp)
c0003800:	ff 75 e8             	pushl  -0x18(%ebp)
c0003803:	e8 7f ff ff ff       	call   c0003787 <dead_lock>
c0003808:	83 c4 10             	add    $0x10,%esp
c000380b:	83 f8 01             	cmp    $0x1,%eax
c000380e:	75 10                	jne    c0003820 <sys_send_msg+0x8f>
c0003810:	83 ec 0c             	sub    $0xc,%esp
c0003813:	68 33 9c 00 c0       	push   $0xc0009c33
c0003818:	e8 15 ff ff ff       	call   c0003732 <panic>
c000381d:	83 c4 10             	add    $0x10,%esp
c0003820:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003823:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c000382a:	3c 02                	cmp    $0x2,%al
c000382c:	0f 85 9f 01 00 00    	jne    c00039d1 <sys_send_msg+0x240>
c0003832:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003835:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c000383b:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000383e:	74 12                	je     c0003852 <sys_send_msg+0xc1>
c0003840:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003843:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0003849:	83 f8 0b             	cmp    $0xb,%eax
c000384c:	0f 85 7f 01 00 00    	jne    c00039d1 <sys_send_msg+0x240>
c0003852:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003855:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c000385b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000385e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003861:	83 ec 08             	sub    $0x8,%esp
c0003864:	ff 75 ec             	pushl  -0x14(%ebp)
c0003867:	50                   	push   %eax
c0003868:	e8 0f 39 00 00       	call   c000717c <Seg2PhyAddrLDT>
c000386d:	83 c4 10             	add    $0x10,%esp
c0003870:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003873:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003876:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c000387c:	89 c2                	mov    %eax,%edx
c000387e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0003881:	01 d0                	add    %edx,%eax
c0003883:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003886:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003889:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000388c:	83 ec 04             	sub    $0x4,%esp
c000388f:	ff 75 d8             	pushl  -0x28(%ebp)
c0003892:	52                   	push   %edx
c0003893:	50                   	push   %eax
c0003894:	e8 e8 68 00 00       	call   c000a181 <Memcpy>
c0003899:	83 c4 10             	add    $0x10,%esp
c000389c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000389f:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c00038a6:	00 00 00 
c00038a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038ac:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c00038b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038b6:	c7 80 50 01 00 00 1a 	movl   $0x1a,0x150(%eax)
c00038bd:	00 00 00 
c00038c0:	83 ec 0c             	sub    $0xc,%esp
c00038c3:	ff 75 ec             	pushl  -0x14(%ebp)
c00038c6:	e8 f5 07 00 00       	call   c00040c0 <unblock>
c00038cb:	83 c4 10             	add    $0x10,%esp
c00038ce:	8b 45 10             	mov    0x10(%ebp),%eax
c00038d1:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c00038d7:	85 c0                	test   %eax,%eax
c00038d9:	74 1c                	je     c00038f7 <sys_send_msg+0x166>
c00038db:	68 5c 05 00 00       	push   $0x55c
c00038e0:	68 3e 9c 00 c0       	push   $0xc0009c3e
c00038e5:	68 3e 9c 00 c0       	push   $0xc0009c3e
c00038ea:	68 45 9c 00 c0       	push   $0xc0009c45
c00038ef:	e8 5c fe ff ff       	call   c0003750 <assertion_failure>
c00038f4:	83 c4 10             	add    $0x10,%esp
c00038f7:	8b 45 10             	mov    0x10(%ebp),%eax
c00038fa:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0003901:	84 c0                	test   %al,%al
c0003903:	74 1c                	je     c0003921 <sys_send_msg+0x190>
c0003905:	68 5d 05 00 00       	push   $0x55d
c000390a:	68 3e 9c 00 c0       	push   $0xc0009c3e
c000390f:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003914:	68 58 9c 00 c0       	push   $0xc0009c58
c0003919:	e8 32 fe ff ff       	call   c0003750 <assertion_failure>
c000391e:	83 c4 10             	add    $0x10,%esp
c0003921:	8b 45 10             	mov    0x10(%ebp),%eax
c0003924:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c000392a:	83 f8 1a             	cmp    $0x1a,%eax
c000392d:	74 1c                	je     c000394b <sys_send_msg+0x1ba>
c000392f:	68 5e 05 00 00       	push   $0x55e
c0003934:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003939:	68 3e 9c 00 c0       	push   $0xc0009c3e
c000393e:	68 6c 9c 00 c0       	push   $0xc0009c6c
c0003943:	e8 08 fe ff ff       	call   c0003750 <assertion_failure>
c0003948:	83 c4 10             	add    $0x10,%esp
c000394b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000394e:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0003954:	85 c0                	test   %eax,%eax
c0003956:	74 1c                	je     c0003974 <sys_send_msg+0x1e3>
c0003958:	68 60 05 00 00       	push   $0x560
c000395d:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003962:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003967:	68 89 9c 00 c0       	push   $0xc0009c89
c000396c:	e8 df fd ff ff       	call   c0003750 <assertion_failure>
c0003971:	83 c4 10             	add    $0x10,%esp
c0003974:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003977:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c000397e:	84 c0                	test   %al,%al
c0003980:	74 1c                	je     c000399e <sys_send_msg+0x20d>
c0003982:	68 61 05 00 00       	push   $0x561
c0003987:	68 3e 9c 00 c0       	push   $0xc0009c3e
c000398c:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003991:	68 9e 9c 00 c0       	push   $0xc0009c9e
c0003996:	e8 b5 fd ff ff       	call   c0003750 <assertion_failure>
c000399b:	83 c4 10             	add    $0x10,%esp
c000399e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039a1:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c00039a7:	83 f8 1a             	cmp    $0x1a,%eax
c00039aa:	0f 84 45 01 00 00    	je     c0003af5 <sys_send_msg+0x364>
c00039b0:	68 62 05 00 00       	push   $0x562
c00039b5:	68 3e 9c 00 c0       	push   $0xc0009c3e
c00039ba:	68 3e 9c 00 c0       	push   $0xc0009c3e
c00039bf:	68 b4 9c 00 c0       	push   $0xc0009cb4
c00039c4:	e8 87 fd ff ff       	call   c0003750 <assertion_failure>
c00039c9:	83 c4 10             	add    $0x10,%esp
c00039cc:	e9 24 01 00 00       	jmp    c0003af5 <sys_send_msg+0x364>
c00039d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00039d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039db:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00039de:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039e1:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c00039e7:	85 c0                	test   %eax,%eax
c00039e9:	75 1b                	jne    c0003a06 <sys_send_msg+0x275>
c00039eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039ee:	8b 55 10             	mov    0x10(%ebp),%edx
c00039f1:	89 90 54 01 00 00    	mov    %edx,0x154(%eax)
c00039f7:	8b 45 10             	mov    0x10(%ebp),%eax
c00039fa:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0003a01:	00 00 00 
c0003a04:	eb 3f                	jmp    c0003a45 <sys_send_msg+0x2b4>
c0003a06:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003a09:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0003a0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a12:	eb 12                	jmp    c0003a26 <sys_send_msg+0x295>
c0003a14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a17:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003a1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a1d:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c0003a23:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a26:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003a2a:	75 e8                	jne    c0003a14 <sys_send_msg+0x283>
c0003a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a2f:	8b 55 10             	mov    0x10(%ebp),%edx
c0003a32:	89 90 58 01 00 00    	mov    %edx,0x158(%eax)
c0003a38:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a3b:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0003a42:	00 00 00 
c0003a45:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a48:	8b 55 08             	mov    0x8(%ebp),%edx
c0003a4b:	89 90 48 01 00 00    	mov    %edx,0x148(%eax)
c0003a51:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a54:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003a57:	89 90 4c 01 00 00    	mov    %edx,0x14c(%eax)
c0003a5d:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a60:	c6 80 44 01 00 00 01 	movb   $0x1,0x144(%eax)
c0003a67:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a6a:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0003a71:	3c 01                	cmp    $0x1,%al
c0003a73:	74 1c                	je     c0003a91 <sys_send_msg+0x300>
c0003a75:	68 83 05 00 00       	push   $0x583
c0003a7a:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003a7f:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003a84:	68 d8 9c 00 c0       	push   $0xc0009cd8
c0003a89:	e8 c2 fc ff ff       	call   c0003750 <assertion_failure>
c0003a8e:	83 c4 10             	add    $0x10,%esp
c0003a91:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a94:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0003a9a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003a9d:	74 1c                	je     c0003abb <sys_send_msg+0x32a>
c0003a9f:	68 84 05 00 00       	push   $0x584
c0003aa4:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003aa9:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003aae:	68 f4 9c 00 c0       	push   $0xc0009cf4
c0003ab3:	e8 98 fc ff ff       	call   c0003750 <assertion_failure>
c0003ab8:	83 c4 10             	add    $0x10,%esp
c0003abb:	8b 45 10             	mov    0x10(%ebp),%eax
c0003abe:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0003ac4:	39 45 08             	cmp    %eax,0x8(%ebp)
c0003ac7:	74 1c                	je     c0003ae5 <sys_send_msg+0x354>
c0003ac9:	68 85 05 00 00       	push   $0x585
c0003ace:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003ad3:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003ad8:	68 16 9d 00 c0       	push   $0xc0009d16
c0003add:	e8 6e fc ff ff       	call   c0003750 <assertion_failure>
c0003ae2:	83 c4 10             	add    $0x10,%esp
c0003ae5:	83 ec 0c             	sub    $0xc,%esp
c0003ae8:	ff 75 10             	pushl  0x10(%ebp)
c0003aeb:	e8 be 05 00 00       	call   c00040ae <block>
c0003af0:	83 c4 10             	add    $0x10,%esp
c0003af3:	eb 01                	jmp    c0003af6 <sys_send_msg+0x365>
c0003af5:	90                   	nop
c0003af6:	b8 00 00 00 00       	mov    $0x0,%eax
c0003afb:	c9                   	leave  
c0003afc:	c3                   	ret    

c0003afd <sys_receive_msg>:
c0003afd:	55                   	push   %ebp
c0003afe:	89 e5                	mov    %esp,%ebp
c0003b00:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0003b06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003b0d:	83 ec 0c             	sub    $0xc,%esp
c0003b10:	ff 75 0c             	pushl  0xc(%ebp)
c0003b13:	e8 7b 35 00 00       	call   c0007093 <pid2proc>
c0003b18:	83 c4 10             	add    $0x10,%esp
c0003b1b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003b1e:	83 ec 0c             	sub    $0xc,%esp
c0003b21:	ff 75 10             	pushl  0x10(%ebp)
c0003b24:	e8 86 35 00 00       	call   c00070af <proc2pid>
c0003b29:	83 c4 10             	add    $0x10,%esp
c0003b2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003b2f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003b36:	8b 45 10             	mov    0x10(%ebp),%eax
c0003b39:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0003b3f:	85 c0                	test   %eax,%eax
c0003b41:	0f 84 9a 00 00 00    	je     c0003be1 <sys_receive_msg+0xe4>
c0003b47:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
c0003b4b:	74 0d                	je     c0003b5a <sys_receive_msg+0x5d>
c0003b4d:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0003b54:	0f 85 87 00 00 00    	jne    c0003be1 <sys_receive_msg+0xe4>
c0003b5a:	83 ec 04             	sub    $0x4,%esp
c0003b5d:	6a 6c                	push   $0x6c
c0003b5f:	6a 00                	push   $0x0
c0003b61:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0003b67:	50                   	push   %eax
c0003b68:	e8 42 66 00 00       	call   c000a1af <Memset>
c0003b6d:	83 c4 10             	add    $0x10,%esp
c0003b70:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
c0003b77:	02 00 00 
c0003b7a:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
c0003b81:	83 ec 08             	sub    $0x8,%esp
c0003b84:	ff 75 08             	pushl  0x8(%ebp)
c0003b87:	ff 75 e0             	pushl  -0x20(%ebp)
c0003b8a:	e8 44 36 00 00       	call   c00071d3 <v2l>
c0003b8f:	83 c4 10             	add    $0x10,%esp
c0003b92:	89 c2                	mov    %eax,%edx
c0003b94:	83 ec 04             	sub    $0x4,%esp
c0003b97:	6a 6c                	push   $0x6c
c0003b99:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0003b9f:	50                   	push   %eax
c0003ba0:	52                   	push   %edx
c0003ba1:	e8 db 65 00 00       	call   c000a181 <Memcpy>
c0003ba6:	83 c4 10             	add    $0x10,%esp
c0003ba9:	8b 45 10             	mov    0x10(%ebp),%eax
c0003bac:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0003bb3:	00 00 00 
c0003bb6:	8b 45 10             	mov    0x10(%ebp),%eax
c0003bb9:	c7 80 50 01 00 00 1a 	movl   $0x1a,0x150(%eax)
c0003bc0:	00 00 00 
c0003bc3:	8b 45 10             	mov    0x10(%ebp),%eax
c0003bc6:	c7 80 4c 01 00 00 1a 	movl   $0x1a,0x14c(%eax)
c0003bcd:	00 00 00 
c0003bd0:	8b 45 10             	mov    0x10(%ebp),%eax
c0003bd3:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c0003bda:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003be1:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0003be5:	0f 84 d3 03 00 00    	je     c0003fbe <sys_receive_msg+0x4c1>
c0003beb:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
c0003bef:	75 26                	jne    c0003c17 <sys_receive_msg+0x11a>
c0003bf1:	8b 45 10             	mov    0x10(%ebp),%eax
c0003bf4:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0003bfa:	85 c0                	test   %eax,%eax
c0003bfc:	0f 84 87 00 00 00    	je     c0003c89 <sys_receive_msg+0x18c>
c0003c02:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c05:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0003c0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c0e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0003c15:	eb 72                	jmp    c0003c89 <sys_receive_msg+0x18c>
c0003c17:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003c1b:	78 6c                	js     c0003c89 <sys_receive_msg+0x18c>
c0003c1d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003c21:	7f 66                	jg     c0003c89 <sys_receive_msg+0x18c>
c0003c23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003c26:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0003c2d:	3c 01                	cmp    $0x1,%al
c0003c2f:	75 58                	jne    c0003c89 <sys_receive_msg+0x18c>
c0003c31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003c34:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0003c3a:	83 f8 0b             	cmp    $0xb,%eax
c0003c3d:	74 0e                	je     c0003c4d <sys_receive_msg+0x150>
c0003c3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003c42:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0003c48:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0003c4b:	75 3c                	jne    c0003c89 <sys_receive_msg+0x18c>
c0003c4d:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c50:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0003c56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c59:	eb 28                	jmp    c0003c83 <sys_receive_msg+0x186>
c0003c5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c5e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003c61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c64:	8b 50 18             	mov    0x18(%eax),%edx
c0003c67:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c6a:	39 c2                	cmp    %eax,%edx
c0003c6c:	75 09                	jne    c0003c77 <sys_receive_msg+0x17a>
c0003c6e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0003c75:	eb 12                	jmp    c0003c89 <sys_receive_msg+0x18c>
c0003c77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c7a:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c0003c80:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c83:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003c87:	75 d2                	jne    c0003c5b <sys_receive_msg+0x15e>
c0003c89:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0003c8d:	0f 85 88 02 00 00    	jne    c0003f1b <sys_receive_msg+0x41e>
c0003c93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c96:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003c99:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c9c:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0003ca2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003ca5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003ca8:	83 ec 08             	sub    $0x8,%esp
c0003cab:	ff 75 10             	pushl  0x10(%ebp)
c0003cae:	50                   	push   %eax
c0003caf:	e8 c8 34 00 00       	call   c000717c <Seg2PhyAddrLDT>
c0003cb4:	83 c4 10             	add    $0x10,%esp
c0003cb7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003cba:	8b 55 08             	mov    0x8(%ebp),%edx
c0003cbd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003cc0:	01 d0                	add    %edx,%eax
c0003cc2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003cc5:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
c0003ccc:	8b 45 10             	mov    0x10(%ebp),%eax
c0003ccf:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0003cd5:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003cd8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003cdb:	83 ec 08             	sub    $0x8,%esp
c0003cde:	ff 75 dc             	pushl  -0x24(%ebp)
c0003ce1:	50                   	push   %eax
c0003ce2:	e8 95 34 00 00       	call   c000717c <Seg2PhyAddrLDT>
c0003ce7:	83 c4 10             	add    $0x10,%esp
c0003cea:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003ced:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003cf0:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0003cf6:	89 c2                	mov    %eax,%edx
c0003cf8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003cfb:	01 d0                	add    %edx,%eax
c0003cfd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003d00:	83 ec 04             	sub    $0x4,%esp
c0003d03:	ff 75 cc             	pushl  -0x34(%ebp)
c0003d06:	ff 75 c0             	pushl  -0x40(%ebp)
c0003d09:	ff 75 d0             	pushl  -0x30(%ebp)
c0003d0c:	e8 70 64 00 00       	call   c000a181 <Memcpy>
c0003d11:	83 c4 10             	add    $0x10,%esp
c0003d14:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003d17:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003d1a:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
c0003d1e:	75 27                	jne    c0003d47 <sys_receive_msg+0x24a>
c0003d20:	8b 45 08             	mov    0x8(%ebp),%eax
c0003d23:	8b 40 68             	mov    0x68(%eax),%eax
c0003d26:	83 f8 06             	cmp    $0x6,%eax
c0003d29:	74 1c                	je     c0003d47 <sys_receive_msg+0x24a>
c0003d2b:	68 12 06 00 00       	push   $0x612
c0003d30:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003d35:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003d3a:	68 2b 9d 00 c0       	push   $0xc0009d2b
c0003d3f:	e8 0c fa ff ff       	call   c0003750 <assertion_failure>
c0003d44:	83 c4 10             	add    $0x10,%esp
c0003d47:	8b 45 10             	mov    0x10(%ebp),%eax
c0003d4a:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0003d50:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0003d53:	75 21                	jne    c0003d76 <sys_receive_msg+0x279>
c0003d55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d58:	8b 90 58 01 00 00    	mov    0x158(%eax),%edx
c0003d5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0003d61:	89 90 54 01 00 00    	mov    %edx,0x154(%eax)
c0003d67:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d6a:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0003d71:	00 00 00 
c0003d74:	eb 1f                	jmp    c0003d95 <sys_receive_msg+0x298>
c0003d76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d79:	8b 90 58 01 00 00    	mov    0x158(%eax),%edx
c0003d7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003d82:	89 90 58 01 00 00    	mov    %edx,0x158(%eax)
c0003d88:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d8b:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0003d92:	00 00 00 
c0003d95:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003d98:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c0003d9f:	00 00 00 
c0003da2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003da5:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c0003dac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003daf:	c7 80 4c 01 00 00 1a 	movl   $0x1a,0x14c(%eax)
c0003db6:	00 00 00 
c0003db9:	8b 45 10             	mov    0x10(%ebp),%eax
c0003dbc:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c0003dc3:	00 00 00 
c0003dc6:	8b 45 10             	mov    0x10(%ebp),%eax
c0003dc9:	c7 80 50 01 00 00 1a 	movl   $0x1a,0x150(%eax)
c0003dd0:	00 00 00 
c0003dd3:	8b 45 10             	mov    0x10(%ebp),%eax
c0003dd6:	c7 80 4c 01 00 00 1a 	movl   $0x1a,0x14c(%eax)
c0003ddd:	00 00 00 
c0003de0:	83 ec 0c             	sub    $0xc,%esp
c0003de3:	ff 75 dc             	pushl  -0x24(%ebp)
c0003de6:	e8 d5 02 00 00       	call   c00040c0 <unblock>
c0003deb:	83 c4 10             	add    $0x10,%esp
c0003dee:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003df1:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0003df7:	85 c0                	test   %eax,%eax
c0003df9:	74 1c                	je     c0003e17 <sys_receive_msg+0x31a>
c0003dfb:	68 33 06 00 00       	push   $0x633
c0003e00:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e05:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e0a:	68 3d 9d 00 c0       	push   $0xc0009d3d
c0003e0f:	e8 3c f9 ff ff       	call   c0003750 <assertion_failure>
c0003e14:	83 c4 10             	add    $0x10,%esp
c0003e17:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003e1a:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0003e21:	84 c0                	test   %al,%al
c0003e23:	74 1c                	je     c0003e41 <sys_receive_msg+0x344>
c0003e25:	68 34 06 00 00       	push   $0x634
c0003e2a:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e2f:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e34:	68 55 9d 00 c0       	push   $0xc0009d55
c0003e39:	e8 12 f9 ff ff       	call   c0003750 <assertion_failure>
c0003e3e:	83 c4 10             	add    $0x10,%esp
c0003e41:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003e44:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0003e4a:	83 f8 1a             	cmp    $0x1a,%eax
c0003e4d:	74 1c                	je     c0003e6b <sys_receive_msg+0x36e>
c0003e4f:	68 35 06 00 00       	push   $0x635
c0003e54:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e59:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e5e:	68 70 9d 00 c0       	push   $0xc0009d70
c0003e63:	e8 e8 f8 ff ff       	call   c0003750 <assertion_failure>
c0003e68:	83 c4 10             	add    $0x10,%esp
c0003e6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0003e6e:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0003e74:	85 c0                	test   %eax,%eax
c0003e76:	74 1c                	je     c0003e94 <sys_receive_msg+0x397>
c0003e78:	68 37 06 00 00       	push   $0x637
c0003e7d:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e82:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003e87:	68 89 9c 00 c0       	push   $0xc0009c89
c0003e8c:	e8 bf f8 ff ff       	call   c0003750 <assertion_failure>
c0003e91:	83 c4 10             	add    $0x10,%esp
c0003e94:	8b 45 10             	mov    0x10(%ebp),%eax
c0003e97:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0003e9e:	84 c0                	test   %al,%al
c0003ea0:	74 1c                	je     c0003ebe <sys_receive_msg+0x3c1>
c0003ea2:	68 38 06 00 00       	push   $0x638
c0003ea7:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003eac:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003eb1:	68 9e 9c 00 c0       	push   $0xc0009c9e
c0003eb6:	e8 95 f8 ff ff       	call   c0003750 <assertion_failure>
c0003ebb:	83 c4 10             	add    $0x10,%esp
c0003ebe:	8b 45 10             	mov    0x10(%ebp),%eax
c0003ec1:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0003ec7:	83 f8 1a             	cmp    $0x1a,%eax
c0003eca:	74 1c                	je     c0003ee8 <sys_receive_msg+0x3eb>
c0003ecc:	68 39 06 00 00       	push   $0x639
c0003ed1:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003ed6:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003edb:	68 b4 9c 00 c0       	push   $0xc0009cb4
c0003ee0:	e8 6b f8 ff ff       	call   c0003750 <assertion_failure>
c0003ee5:	83 c4 10             	add    $0x10,%esp
c0003ee8:	8b 45 10             	mov    0x10(%ebp),%eax
c0003eeb:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0003ef1:	83 f8 1a             	cmp    $0x1a,%eax
c0003ef4:	0f 84 bd 00 00 00    	je     c0003fb7 <sys_receive_msg+0x4ba>
c0003efa:	68 3a 06 00 00       	push   $0x63a
c0003eff:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003f04:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003f09:	68 94 9d 00 c0       	push   $0xc0009d94
c0003f0e:	e8 3d f8 ff ff       	call   c0003750 <assertion_failure>
c0003f13:	83 c4 10             	add    $0x10,%esp
c0003f16:	e9 9c 00 00 00       	jmp    c0003fb7 <sys_receive_msg+0x4ba>
c0003f1b:	8b 45 10             	mov    0x10(%ebp),%eax
c0003f1e:	c6 80 44 01 00 00 02 	movb   $0x2,0x144(%eax)
c0003f25:	8b 45 10             	mov    0x10(%ebp),%eax
c0003f28:	8b 55 08             	mov    0x8(%ebp),%edx
c0003f2b:	89 90 48 01 00 00    	mov    %edx,0x148(%eax)
c0003f31:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
c0003f35:	75 0f                	jne    c0003f46 <sys_receive_msg+0x449>
c0003f37:	8b 45 10             	mov    0x10(%ebp),%eax
c0003f3a:	c7 80 50 01 00 00 0b 	movl   $0xb,0x150(%eax)
c0003f41:	00 00 00 
c0003f44:	eb 0c                	jmp    c0003f52 <sys_receive_msg+0x455>
c0003f46:	8b 45 10             	mov    0x10(%ebp),%eax
c0003f49:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003f4c:	89 90 50 01 00 00    	mov    %edx,0x150(%eax)
c0003f52:	8b 0d 9c e6 00 c0    	mov    0xc000e69c,%ecx
c0003f58:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0003f5d:	89 c8                	mov    %ecx,%eax
c0003f5f:	f7 ea                	imul   %edx
c0003f61:	c1 fa 06             	sar    $0x6,%edx
c0003f64:	89 c8                	mov    %ecx,%eax
c0003f66:	c1 f8 1f             	sar    $0x1f,%eax
c0003f69:	29 c2                	sub    %eax,%edx
c0003f6b:	89 d0                	mov    %edx,%eax
c0003f6d:	8d 50 01             	lea    0x1(%eax),%edx
c0003f70:	89 d0                	mov    %edx,%eax
c0003f72:	c1 e0 02             	shl    $0x2,%eax
c0003f75:	01 d0                	add    %edx,%eax
c0003f77:	c1 e0 05             	shl    $0x5,%eax
c0003f7a:	a3 9c e6 00 c0       	mov    %eax,0xc000e69c
c0003f7f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003f82:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0003f89:	3c 02                	cmp    $0x2,%al
c0003f8b:	74 1c                	je     c0003fa9 <sys_receive_msg+0x4ac>
c0003f8d:	68 6f 06 00 00       	push   $0x66f
c0003f92:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003f97:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003f9c:	68 b3 9d 00 c0       	push   $0xc0009db3
c0003fa1:	e8 aa f7 ff ff       	call   c0003750 <assertion_failure>
c0003fa6:	83 c4 10             	add    $0x10,%esp
c0003fa9:	83 ec 0c             	sub    $0xc,%esp
c0003fac:	ff 75 10             	pushl  0x10(%ebp)
c0003faf:	e8 fa 00 00 00       	call   c00040ae <block>
c0003fb4:	83 c4 10             	add    $0x10,%esp
c0003fb7:	b8 00 00 00 00       	mov    $0x0,%eax
c0003fbc:	eb 02                	jmp    c0003fc0 <sys_receive_msg+0x4c3>
c0003fbe:	90                   	nop
c0003fbf:	90                   	nop
c0003fc0:	c9                   	leave  
c0003fc1:	c3                   	ret    

c0003fc2 <disp_str_colour_debug>:
c0003fc2:	55                   	push   %ebp
c0003fc3:	89 e5                	mov    %esp,%ebp
c0003fc5:	90                   	nop
c0003fc6:	5d                   	pop    %ebp
c0003fc7:	c3                   	ret    

c0003fc8 <send_rec>:
c0003fc8:	55                   	push   %ebp
c0003fc9:	89 e5                	mov    %esp,%ebp
c0003fcb:	83 ec 18             	sub    $0x18,%esp
c0003fce:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0003fd2:	74 28                	je     c0003ffc <send_rec+0x34>
c0003fd4:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0003fd8:	74 22                	je     c0003ffc <send_rec+0x34>
c0003fda:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0003fde:	74 1c                	je     c0003ffc <send_rec+0x34>
c0003fe0:	68 98 06 00 00       	push   $0x698
c0003fe5:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003fea:	68 3e 9c 00 c0       	push   $0xc0009c3e
c0003fef:	68 d4 9d 00 c0       	push   $0xc0009dd4
c0003ff4:	e8 57 f7 ff ff       	call   c0003750 <assertion_failure>
c0003ff9:	83 c4 10             	add    $0x10,%esp
c0003ffc:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0004000:	75 12                	jne    c0004014 <send_rec+0x4c>
c0004002:	83 ec 04             	sub    $0x4,%esp
c0004005:	6a 6c                	push   $0x6c
c0004007:	6a 00                	push   $0x0
c0004009:	ff 75 0c             	pushl  0xc(%ebp)
c000400c:	e8 9e 61 00 00       	call   c000a1af <Memset>
c0004011:	83 c4 10             	add    $0x10,%esp
c0004014:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0004018:	74 22                	je     c000403c <send_rec+0x74>
c000401a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000401e:	74 32                	je     c0004052 <send_rec+0x8a>
c0004020:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0004024:	75 6e                	jne    c0004094 <send_rec+0xcc>
c0004026:	83 ec 08             	sub    $0x8,%esp
c0004029:	ff 75 10             	pushl  0x10(%ebp)
c000402c:	ff 75 0c             	pushl  0xc(%ebp)
c000402f:	e8 94 0f 00 00       	call   c0004fc8 <send_msg>
c0004034:	83 c4 10             	add    $0x10,%esp
c0004037:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000403a:	eb 6b                	jmp    c00040a7 <send_rec+0xdf>
c000403c:	83 ec 08             	sub    $0x8,%esp
c000403f:	ff 75 10             	pushl  0x10(%ebp)
c0004042:	ff 75 0c             	pushl  0xc(%ebp)
c0004045:	e8 a4 0f 00 00       	call   c0004fee <receive_msg>
c000404a:	83 c4 10             	add    $0x10,%esp
c000404d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004050:	eb 55                	jmp    c00040a7 <send_rec+0xdf>
c0004052:	83 ec 08             	sub    $0x8,%esp
c0004055:	ff 75 10             	pushl  0x10(%ebp)
c0004058:	ff 75 0c             	pushl  0xc(%ebp)
c000405b:	e8 68 0f 00 00       	call   c0004fc8 <send_msg>
c0004060:	83 c4 10             	add    $0x10,%esp
c0004063:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004066:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000406a:	75 3a                	jne    c00040a6 <send_rec+0xde>
c000406c:	83 ec 04             	sub    $0x4,%esp
c000406f:	6a 6c                	push   $0x6c
c0004071:	6a 00                	push   $0x0
c0004073:	ff 75 0c             	pushl  0xc(%ebp)
c0004076:	e8 34 61 00 00       	call   c000a1af <Memset>
c000407b:	83 c4 10             	add    $0x10,%esp
c000407e:	83 ec 08             	sub    $0x8,%esp
c0004081:	ff 75 10             	pushl  0x10(%ebp)
c0004084:	ff 75 0c             	pushl  0xc(%ebp)
c0004087:	e8 62 0f 00 00       	call   c0004fee <receive_msg>
c000408c:	83 c4 10             	add    $0x10,%esp
c000408f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004092:	eb 12                	jmp    c00040a6 <send_rec+0xde>
c0004094:	83 ec 0c             	sub    $0xc,%esp
c0004097:	68 10 9e 00 c0       	push   $0xc0009e10
c000409c:	e8 91 f6 ff ff       	call   c0003732 <panic>
c00040a1:	83 c4 10             	add    $0x10,%esp
c00040a4:	eb 01                	jmp    c00040a7 <send_rec+0xdf>
c00040a6:	90                   	nop
c00040a7:	b8 00 00 00 00       	mov    $0x0,%eax
c00040ac:	c9                   	leave  
c00040ad:	c3                   	ret    

c00040ae <block>:
c00040ae:	55                   	push   %ebp
c00040af:	89 e5                	mov    %esp,%ebp
c00040b1:	83 ec 08             	sub    $0x8,%esp
c00040b4:	e8 8b 2e 00 00       	call   c0006f44 <schedule_process>
c00040b9:	b8 00 00 00 00       	mov    $0x0,%eax
c00040be:	c9                   	leave  
c00040bf:	c3                   	ret    

c00040c0 <unblock>:
c00040c0:	55                   	push   %ebp
c00040c1:	89 e5                	mov    %esp,%ebp
c00040c3:	83 ec 08             	sub    $0x8,%esp
c00040c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00040c9:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c00040d0:	84 c0                	test   %al,%al
c00040d2:	74 1c                	je     c00040f0 <unblock+0x30>
c00040d4:	68 d0 06 00 00       	push   $0x6d0
c00040d9:	68 3e 9c 00 c0       	push   $0xc0009c3e
c00040de:	68 3e 9c 00 c0       	push   $0xc0009c3e
c00040e3:	68 25 9e 00 c0       	push   $0xc0009e25
c00040e8:	e8 63 f6 ff ff       	call   c0003750 <assertion_failure>
c00040ed:	83 c4 10             	add    $0x10,%esp
c00040f0:	b8 00 00 00 00       	mov    $0x0,%eax
c00040f5:	c9                   	leave  
c00040f6:	c3                   	ret    

c00040f7 <get_ticks_ipc>:
c00040f7:	55                   	push   %ebp
c00040f8:	89 e5                	mov    %esp,%ebp
c00040fa:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0004100:	83 ec 04             	sub    $0x4,%esp
c0004103:	6a 6c                	push   $0x6c
c0004105:	6a 00                	push   $0x0
c0004107:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000410a:	50                   	push   %eax
c000410b:	e8 9f 60 00 00       	call   c000a1af <Memset>
c0004110:	83 c4 10             	add    $0x10,%esp
c0004113:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000411a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0004121:	83 ec 04             	sub    $0x4,%esp
c0004124:	6a 01                	push   $0x1
c0004126:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0004129:	50                   	push   %eax
c000412a:	6a 03                	push   $0x3
c000412c:	e8 97 fe ff ff       	call   c0003fc8 <send_rec>
c0004131:	83 c4 10             	add    $0x10,%esp
c0004134:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004137:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000413a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000413d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004140:	c9                   	leave  
c0004141:	c3                   	ret    

c0004142 <itoa>:
c0004142:	55                   	push   %ebp
c0004143:	89 e5                	mov    %esp,%ebp
c0004145:	53                   	push   %ebx
c0004146:	83 ec 14             	sub    $0x14,%esp
c0004149:	8b 45 08             	mov    0x8(%ebp),%eax
c000414c:	99                   	cltd   
c000414d:	f7 7d 10             	idivl  0x10(%ebp)
c0004150:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004153:	8b 45 08             	mov    0x8(%ebp),%eax
c0004156:	99                   	cltd   
c0004157:	f7 7d 10             	idivl  0x10(%ebp)
c000415a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000415d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0004161:	74 14                	je     c0004177 <itoa+0x35>
c0004163:	83 ec 04             	sub    $0x4,%esp
c0004166:	ff 75 10             	pushl  0x10(%ebp)
c0004169:	ff 75 0c             	pushl  0xc(%ebp)
c000416c:	ff 75 f0             	pushl  -0x10(%ebp)
c000416f:	e8 ce ff ff ff       	call   c0004142 <itoa>
c0004174:	83 c4 10             	add    $0x10,%esp
c0004177:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000417a:	8d 58 30             	lea    0x30(%eax),%ebx
c000417d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004180:	8b 00                	mov    (%eax),%eax
c0004182:	8d 48 01             	lea    0x1(%eax),%ecx
c0004185:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004188:	89 0a                	mov    %ecx,(%edx)
c000418a:	89 da                	mov    %ebx,%edx
c000418c:	88 10                	mov    %dl,(%eax)
c000418e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004191:	8b 00                	mov    (%eax),%eax
c0004193:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004196:	c9                   	leave  
c0004197:	c3                   	ret    

c0004198 <i2a>:
c0004198:	55                   	push   %ebp
c0004199:	89 e5                	mov    %esp,%ebp
c000419b:	53                   	push   %ebx
c000419c:	83 ec 14             	sub    $0x14,%esp
c000419f:	8b 45 08             	mov    0x8(%ebp),%eax
c00041a2:	99                   	cltd   
c00041a3:	f7 7d 0c             	idivl  0xc(%ebp)
c00041a6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00041a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00041ac:	99                   	cltd   
c00041ad:	f7 7d 0c             	idivl  0xc(%ebp)
c00041b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00041b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00041b7:	74 14                	je     c00041cd <i2a+0x35>
c00041b9:	83 ec 04             	sub    $0x4,%esp
c00041bc:	ff 75 10             	pushl  0x10(%ebp)
c00041bf:	ff 75 0c             	pushl  0xc(%ebp)
c00041c2:	ff 75 f0             	pushl  -0x10(%ebp)
c00041c5:	e8 ce ff ff ff       	call   c0004198 <i2a>
c00041ca:	83 c4 10             	add    $0x10,%esp
c00041cd:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00041d1:	7f 0a                	jg     c00041dd <i2a+0x45>
c00041d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00041d6:	83 c0 30             	add    $0x30,%eax
c00041d9:	89 c3                	mov    %eax,%ebx
c00041db:	eb 08                	jmp    c00041e5 <i2a+0x4d>
c00041dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00041e0:	83 c0 37             	add    $0x37,%eax
c00041e3:	89 c3                	mov    %eax,%ebx
c00041e5:	8b 45 10             	mov    0x10(%ebp),%eax
c00041e8:	8b 00                	mov    (%eax),%eax
c00041ea:	8d 48 01             	lea    0x1(%eax),%ecx
c00041ed:	8b 55 10             	mov    0x10(%ebp),%edx
c00041f0:	89 0a                	mov    %ecx,(%edx)
c00041f2:	88 18                	mov    %bl,(%eax)
c00041f4:	8b 45 10             	mov    0x10(%ebp),%eax
c00041f7:	8b 00                	mov    (%eax),%eax
c00041f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00041fc:	c9                   	leave  
c00041fd:	c3                   	ret    

c00041fe <inform_int>:
c00041fe:	55                   	push   %ebp
c00041ff:	89 e5                	mov    %esp,%ebp
c0004201:	83 ec 18             	sub    $0x18,%esp
c0004204:	83 ec 0c             	sub    $0xc,%esp
c0004207:	ff 75 08             	pushl  0x8(%ebp)
c000420a:	e8 84 2e 00 00       	call   c0007093 <pid2proc>
c000420f:	83 c4 10             	add    $0x10,%esp
c0004212:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004215:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004218:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c000421f:	0f be c0             	movsbl %al,%eax
c0004222:	83 e0 02             	and    $0x2,%eax
c0004225:	85 c0                	test   %eax,%eax
c0004227:	74 7e                	je     c00042a7 <inform_int+0xa9>
c0004229:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000422c:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0004232:	3d 13 02 00 00       	cmp    $0x213,%eax
c0004237:	74 0e                	je     c0004247 <inform_int+0x49>
c0004239:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000423c:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0004242:	83 f8 0b             	cmp    $0xb,%eax
c0004245:	75 6d                	jne    c00042b4 <inform_int+0xb6>
c0004247:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000424a:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0004250:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0004256:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004259:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c000425f:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0004266:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004269:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0004270:	00 00 00 
c0004273:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004276:	c7 80 50 01 00 00 1a 	movl   $0x1a,0x150(%eax)
c000427d:	00 00 00 
c0004280:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004283:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c000428a:	00 00 00 
c000428d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004290:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c0004297:	83 ec 0c             	sub    $0xc,%esp
c000429a:	ff 75 f4             	pushl  -0xc(%ebp)
c000429d:	e8 1e fe ff ff       	call   c00040c0 <unblock>
c00042a2:	83 c4 10             	add    $0x10,%esp
c00042a5:	eb 0d                	jmp    c00042b4 <inform_int+0xb6>
c00042a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00042aa:	c7 80 5c 01 00 00 01 	movl   $0x1,0x15c(%eax)
c00042b1:	00 00 00 
c00042b4:	90                   	nop
c00042b5:	c9                   	leave  
c00042b6:	c3                   	ret    

c00042b7 <strcmp>:
c00042b7:	55                   	push   %ebp
c00042b8:	89 e5                	mov    %esp,%ebp
c00042ba:	83 ec 10             	sub    $0x10,%esp
c00042bd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c00042c1:	74 06                	je     c00042c9 <strcmp+0x12>
c00042c3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00042c7:	75 08                	jne    c00042d1 <strcmp+0x1a>
c00042c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00042cc:	2b 45 0c             	sub    0xc(%ebp),%eax
c00042cf:	eb 53                	jmp    c0004324 <strcmp+0x6d>
c00042d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00042d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00042d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00042da:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00042dd:	eb 18                	jmp    c00042f7 <strcmp+0x40>
c00042df:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00042e2:	0f b6 10             	movzbl (%eax),%edx
c00042e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00042e8:	0f b6 00             	movzbl (%eax),%eax
c00042eb:	38 c2                	cmp    %al,%dl
c00042ed:	75 1e                	jne    c000430d <strcmp+0x56>
c00042ef:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00042f3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00042f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00042fa:	0f b6 00             	movzbl (%eax),%eax
c00042fd:	84 c0                	test   %al,%al
c00042ff:	74 0d                	je     c000430e <strcmp+0x57>
c0004301:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004304:	0f b6 00             	movzbl (%eax),%eax
c0004307:	84 c0                	test   %al,%al
c0004309:	75 d4                	jne    c00042df <strcmp+0x28>
c000430b:	eb 01                	jmp    c000430e <strcmp+0x57>
c000430d:	90                   	nop
c000430e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004311:	0f b6 00             	movzbl (%eax),%eax
c0004314:	0f be d0             	movsbl %al,%edx
c0004317:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000431a:	0f b6 00             	movzbl (%eax),%eax
c000431d:	0f be c0             	movsbl %al,%eax
c0004320:	29 c2                	sub    %eax,%edx
c0004322:	89 d0                	mov    %edx,%eax
c0004324:	c9                   	leave  
c0004325:	c3                   	ret    

c0004326 <TaskHD>:
c0004326:	55                   	push   %ebp
c0004327:	89 e5                	mov    %esp,%ebp
c0004329:	83 ec 08             	sub    $0x8,%esp
c000432c:	e8 07 00 00 00       	call   c0004338 <init_hd>
c0004331:	e8 1c 00 00 00       	call   c0004352 <hd_handle>
c0004336:	eb f9                	jmp    c0004331 <TaskHD+0xb>

c0004338 <init_hd>:
c0004338:	55                   	push   %ebp
c0004339:	89 e5                	mov    %esp,%ebp
c000433b:	83 ec 18             	sub    $0x18,%esp
c000433e:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0004345:	e8 4f d5 ff ff       	call   c0001899 <enable_8259A_casecade_irq>
c000434a:	e8 5e d5 ff ff       	call   c00018ad <enable_8259A_slave_winchester_irq>
c000434f:	90                   	nop
c0004350:	c9                   	leave  
c0004351:	c3                   	ret    

c0004352 <hd_handle>:
c0004352:	55                   	push   %ebp
c0004353:	89 e5                	mov    %esp,%ebp
c0004355:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000435b:	83 ec 04             	sub    $0x4,%esp
c000435e:	6a 0b                	push   $0xb
c0004360:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0004363:	50                   	push   %eax
c0004364:	6a 02                	push   $0x2
c0004366:	e8 5d fc ff ff       	call   c0003fc8 <send_rec>
c000436b:	83 c4 10             	add    $0x10,%esp
c000436e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004371:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004374:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004378:	0f 84 96 00 00 00    	je     c0004414 <hd_handle+0xc2>
c000437e:	8b 45 84             	mov    -0x7c(%ebp),%eax
c0004381:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004384:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0004388:	74 23                	je     c00043ad <hd_handle+0x5b>
c000438a:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c000438e:	77 08                	ja     c0004398 <hd_handle+0x46>
c0004390:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0004394:	74 10                	je     c00043a6 <hd_handle+0x54>
c0004396:	eb 35                	jmp    c00043cd <hd_handle+0x7b>
c0004398:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c000439c:	74 0f                	je     c00043ad <hd_handle+0x5b>
c000439e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c00043a2:	74 1a                	je     c00043be <hd_handle+0x6c>
c00043a4:	eb 27                	jmp    c00043cd <hd_handle+0x7b>
c00043a6:	e8 18 07 00 00       	call   c0004ac3 <hd_open>
c00043ab:	eb 31                	jmp    c00043de <hd_handle+0x8c>
c00043ad:	83 ec 0c             	sub    $0xc,%esp
c00043b0:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00043b3:	50                   	push   %eax
c00043b4:	e8 02 08 00 00       	call   c0004bbb <hd_rdwt>
c00043b9:	83 c4 10             	add    $0x10,%esp
c00043bc:	eb 20                	jmp    c00043de <hd_handle+0x8c>
c00043be:	83 ec 0c             	sub    $0xc,%esp
c00043c1:	6a 00                	push   $0x0
c00043c3:	e8 4a 07 00 00       	call   c0004b12 <get_hd_ioctl>
c00043c8:	83 c4 10             	add    $0x10,%esp
c00043cb:	eb 11                	jmp    c00043de <hd_handle+0x8c>
c00043cd:	83 ec 0c             	sub    $0xc,%esp
c00043d0:	68 3d 9e 00 c0       	push   $0xc0009e3d
c00043d5:	e8 53 f3 ff ff       	call   c000372d <spin>
c00043da:	83 c4 10             	add    $0x10,%esp
c00043dd:	90                   	nop
c00043de:	83 ec 04             	sub    $0x4,%esp
c00043e1:	6a 6c                	push   $0x6c
c00043e3:	6a 00                	push   $0x0
c00043e5:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00043e8:	50                   	push   %eax
c00043e9:	e8 c1 5d 00 00       	call   c000a1af <Memset>
c00043ee:	83 c4 10             	add    $0x10,%esp
c00043f1:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
c00043f8:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c00043ff:	83 ec 04             	sub    $0x4,%esp
c0004402:	6a 03                	push   $0x3
c0004404:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0004407:	50                   	push   %eax
c0004408:	6a 01                	push   $0x1
c000440a:	e8 b9 fb ff ff       	call   c0003fc8 <send_rec>
c000440f:	83 c4 10             	add    $0x10,%esp
c0004412:	eb 01                	jmp    c0004415 <hd_handle+0xc3>
c0004414:	90                   	nop
c0004415:	c9                   	leave  
c0004416:	c3                   	ret    

c0004417 <hd_cmd_out>:
c0004417:	55                   	push   %ebp
c0004418:	89 e5                	mov    %esp,%ebp
c000441a:	83 ec 08             	sub    $0x8,%esp
c000441d:	83 ec 04             	sub    $0x4,%esp
c0004420:	68 98 3a 00 00       	push   $0x3a98
c0004425:	6a 00                	push   $0x0
c0004427:	68 80 00 00 00       	push   $0x80
c000442c:	e8 e8 09 00 00       	call   c0004e19 <waitfor>
c0004431:	83 c4 10             	add    $0x10,%esp
c0004434:	85 c0                	test   %eax,%eax
c0004436:	75 10                	jne    c0004448 <hd_cmd_out+0x31>
c0004438:	83 ec 0c             	sub    $0xc,%esp
c000443b:	68 4f 9e 00 c0       	push   $0xc0009e4f
c0004440:	e8 ed f2 ff ff       	call   c0003732 <panic>
c0004445:	83 c4 10             	add    $0x10,%esp
c0004448:	83 ec 08             	sub    $0x8,%esp
c000444b:	6a 00                	push   $0x0
c000444d:	68 f6 03 00 00       	push   $0x3f6
c0004452:	e8 88 d3 ff ff       	call   c00017df <out_byte>
c0004457:	83 c4 10             	add    $0x10,%esp
c000445a:	8b 45 08             	mov    0x8(%ebp),%eax
c000445d:	0f b6 00             	movzbl (%eax),%eax
c0004460:	0f b6 c0             	movzbl %al,%eax
c0004463:	83 ec 08             	sub    $0x8,%esp
c0004466:	50                   	push   %eax
c0004467:	68 f1 01 00 00       	push   $0x1f1
c000446c:	e8 6e d3 ff ff       	call   c00017df <out_byte>
c0004471:	83 c4 10             	add    $0x10,%esp
c0004474:	8b 45 08             	mov    0x8(%ebp),%eax
c0004477:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c000447b:	0f b6 c0             	movzbl %al,%eax
c000447e:	83 ec 08             	sub    $0x8,%esp
c0004481:	50                   	push   %eax
c0004482:	68 f2 01 00 00       	push   $0x1f2
c0004487:	e8 53 d3 ff ff       	call   c00017df <out_byte>
c000448c:	83 c4 10             	add    $0x10,%esp
c000448f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004492:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0004496:	0f b6 c0             	movzbl %al,%eax
c0004499:	83 ec 08             	sub    $0x8,%esp
c000449c:	50                   	push   %eax
c000449d:	68 f3 01 00 00       	push   $0x1f3
c00044a2:	e8 38 d3 ff ff       	call   c00017df <out_byte>
c00044a7:	83 c4 10             	add    $0x10,%esp
c00044aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00044ad:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c00044b1:	0f b6 c0             	movzbl %al,%eax
c00044b4:	83 ec 08             	sub    $0x8,%esp
c00044b7:	50                   	push   %eax
c00044b8:	68 f4 01 00 00       	push   $0x1f4
c00044bd:	e8 1d d3 ff ff       	call   c00017df <out_byte>
c00044c2:	83 c4 10             	add    $0x10,%esp
c00044c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00044c8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c00044cc:	0f b6 c0             	movzbl %al,%eax
c00044cf:	83 ec 08             	sub    $0x8,%esp
c00044d2:	50                   	push   %eax
c00044d3:	68 f5 01 00 00       	push   $0x1f5
c00044d8:	e8 02 d3 ff ff       	call   c00017df <out_byte>
c00044dd:	83 c4 10             	add    $0x10,%esp
c00044e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00044e3:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c00044e7:	0f b6 c0             	movzbl %al,%eax
c00044ea:	83 ec 08             	sub    $0x8,%esp
c00044ed:	50                   	push   %eax
c00044ee:	68 f6 01 00 00       	push   $0x1f6
c00044f3:	e8 e7 d2 ff ff       	call   c00017df <out_byte>
c00044f8:	83 c4 10             	add    $0x10,%esp
c00044fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00044fe:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0004502:	0f b6 c0             	movzbl %al,%eax
c0004505:	83 ec 08             	sub    $0x8,%esp
c0004508:	50                   	push   %eax
c0004509:	68 f7 01 00 00       	push   $0x1f7
c000450e:	e8 cc d2 ff ff       	call   c00017df <out_byte>
c0004513:	83 c4 10             	add    $0x10,%esp
c0004516:	90                   	nop
c0004517:	c9                   	leave  
c0004518:	c3                   	ret    

c0004519 <hd_identify>:
c0004519:	55                   	push   %ebp
c000451a:	89 e5                	mov    %esp,%ebp
c000451c:	53                   	push   %ebx
c000451d:	83 ec 24             	sub    $0x24,%esp
c0004520:	89 e0                	mov    %esp,%eax
c0004522:	89 c3                	mov    %eax,%ebx
c0004524:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0004528:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c000452c:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0004530:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0004534:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0004538:	8b 45 08             	mov    0x8(%ebp),%eax
c000453b:	c1 e0 04             	shl    $0x4,%eax
c000453e:	83 c8 e0             	or     $0xffffffe0,%eax
c0004541:	88 45 ea             	mov    %al,-0x16(%ebp)
c0004544:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0004548:	83 ec 0c             	sub    $0xc,%esp
c000454b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c000454e:	50                   	push   %eax
c000454f:	e8 c3 fe ff ff       	call   c0004417 <hd_cmd_out>
c0004554:	83 c4 10             	add    $0x10,%esp
c0004557:	e8 40 06 00 00       	call   c0004b9c <interrupt_wait>
c000455c:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0004563:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004566:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004569:	89 55 f0             	mov    %edx,-0x10(%ebp)
c000456c:	89 c2                	mov    %eax,%edx
c000456e:	b8 10 00 00 00       	mov    $0x10,%eax
c0004573:	83 e8 01             	sub    $0x1,%eax
c0004576:	01 d0                	add    %edx,%eax
c0004578:	b9 10 00 00 00       	mov    $0x10,%ecx
c000457d:	ba 00 00 00 00       	mov    $0x0,%edx
c0004582:	f7 f1                	div    %ecx
c0004584:	6b c0 10             	imul   $0x10,%eax,%eax
c0004587:	29 c4                	sub    %eax,%esp
c0004589:	89 e0                	mov    %esp,%eax
c000458b:	83 c0 00             	add    $0x0,%eax
c000458e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004591:	83 ec 04             	sub    $0x4,%esp
c0004594:	ff 75 f4             	pushl  -0xc(%ebp)
c0004597:	6a 00                	push   $0x0
c0004599:	ff 75 ec             	pushl  -0x14(%ebp)
c000459c:	e8 0e 5c 00 00       	call   c000a1af <Memset>
c00045a1:	83 c4 10             	add    $0x10,%esp
c00045a4:	83 ec 04             	sub    $0x4,%esp
c00045a7:	ff 75 f4             	pushl  -0xc(%ebp)
c00045aa:	ff 75 ec             	pushl  -0x14(%ebp)
c00045ad:	68 f0 01 00 00       	push   $0x1f0
c00045b2:	e8 4c 5c 00 00       	call   c000a203 <read_port>
c00045b7:	83 c4 10             	add    $0x10,%esp
c00045ba:	83 ec 0c             	sub    $0xc,%esp
c00045bd:	ff 75 ec             	pushl  -0x14(%ebp)
c00045c0:	e8 0b 00 00 00       	call   c00045d0 <print_hdinfo>
c00045c5:	83 c4 10             	add    $0x10,%esp
c00045c8:	89 dc                	mov    %ebx,%esp
c00045ca:	90                   	nop
c00045cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00045ce:	c9                   	leave  
c00045cf:	c3                   	ret    

c00045d0 <print_hdinfo>:
c00045d0:	55                   	push   %ebp
c00045d1:	89 e5                	mov    %esp,%ebp
c00045d3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00045d9:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c00045df:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c00045e5:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c00045ec:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c00045f3:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c00045fa:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0004601:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0004608:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c000460e:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0004614:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c000461b:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0004622:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0004629:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0004630:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004637:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000463e:	e9 8f 00 00 00       	jmp    c00046d2 <print_hdinfo+0x102>
c0004643:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000464a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000464d:	89 d0                	mov    %edx,%eax
c000464f:	01 c0                	add    %eax,%eax
c0004651:	01 d0                	add    %edx,%eax
c0004653:	c1 e0 03             	shl    $0x3,%eax
c0004656:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0004659:	01 c8                	add    %ecx,%eax
c000465b:	83 e8 44             	sub    $0x44,%eax
c000465e:	0f b7 00             	movzwl (%eax),%eax
c0004661:	0f b7 c0             	movzwl %ax,%eax
c0004664:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0004667:	8b 45 08             	mov    0x8(%ebp),%eax
c000466a:	01 d0                	add    %edx,%eax
c000466c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000466f:	eb 30                	jmp    c00046a1 <print_hdinfo+0xd1>
c0004671:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004674:	8d 50 01             	lea    0x1(%eax),%edx
c0004677:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000467a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000467d:	83 c2 01             	add    $0x1,%edx
c0004680:	0f b6 00             	movzbl (%eax),%eax
c0004683:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0004687:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000468a:	8d 50 01             	lea    0x1(%eax),%edx
c000468d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004690:	0f b6 00             	movzbl (%eax),%eax
c0004693:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0004696:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004699:	01 ca                	add    %ecx,%edx
c000469b:	88 02                	mov    %al,(%edx)
c000469d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00046a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00046a4:	89 d0                	mov    %edx,%eax
c00046a6:	01 c0                	add    %eax,%eax
c00046a8:	01 d0                	add    %edx,%eax
c00046aa:	c1 e0 03             	shl    $0x3,%eax
c00046ad:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00046b0:	01 c8                	add    %ecx,%eax
c00046b2:	83 e8 42             	sub    $0x42,%eax
c00046b5:	0f b7 00             	movzwl (%eax),%eax
c00046b8:	66 d1 e8             	shr    %ax
c00046bb:	0f b7 c0             	movzwl %ax,%eax
c00046be:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00046c1:	7c ae                	jl     c0004671 <print_hdinfo+0xa1>
c00046c3:	8d 55 81             	lea    -0x7f(%ebp),%edx
c00046c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00046c9:	01 d0                	add    %edx,%eax
c00046cb:	c6 00 00             	movb   $0x0,(%eax)
c00046ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00046d2:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c00046d6:	0f 8e 67 ff ff ff    	jle    c0004643 <print_hdinfo+0x73>
c00046dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00046df:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c00046e3:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c00046e7:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c00046eb:	66 c1 e8 08          	shr    $0x8,%ax
c00046ef:	66 85 c0             	test   %ax,%ax
c00046f2:	0f 95 c0             	setne  %al
c00046f5:	88 45 e9             	mov    %al,-0x17(%ebp)
c00046f8:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c00046ff:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0004705:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0004709:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c000470d:	75 15                	jne    c0004724 <print_hdinfo+0x154>
c000470f:	83 ec 08             	sub    $0x8,%esp
c0004712:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0004715:	50                   	push   %eax
c0004716:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0004719:	50                   	push   %eax
c000471a:	e8 af 5a 00 00       	call   c000a1ce <Strcpy>
c000471f:	83 c4 10             	add    $0x10,%esp
c0004722:	eb 13                	jmp    c0004737 <print_hdinfo+0x167>
c0004724:	83 ec 08             	sub    $0x8,%esp
c0004727:	8d 45 a9             	lea    -0x57(%ebp),%eax
c000472a:	50                   	push   %eax
c000472b:	8d 45 b0             	lea    -0x50(%ebp),%eax
c000472e:	50                   	push   %eax
c000472f:	e8 9a 5a 00 00       	call   c000a1ce <Strcpy>
c0004734:	83 c4 10             	add    $0x10,%esp
c0004737:	8b 45 08             	mov    0x8(%ebp),%eax
c000473a:	83 c0 7a             	add    $0x7a,%eax
c000473d:	0f b7 00             	movzwl (%eax),%eax
c0004740:	0f b7 d0             	movzwl %ax,%edx
c0004743:	8b 45 08             	mov    0x8(%ebp),%eax
c0004746:	83 c0 78             	add    $0x78,%eax
c0004749:	0f b7 00             	movzwl (%eax),%eax
c000474c:	0f b7 c0             	movzwl %ax,%eax
c000474f:	83 c0 10             	add    $0x10,%eax
c0004752:	89 c1                	mov    %eax,%ecx
c0004754:	d3 e2                	shl    %cl,%edx
c0004756:	89 d0                	mov    %edx,%eax
c0004758:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000475b:	90                   	nop
c000475c:	c9                   	leave  
c000475d:	c3                   	ret    

c000475e <print_dpt_entry>:
c000475e:	55                   	push   %ebp
c000475f:	89 e5                	mov    %esp,%ebp
c0004761:	83 ec 08             	sub    $0x8,%esp
c0004764:	8b 45 08             	mov    0x8(%ebp),%eax
c0004767:	8b 40 08             	mov    0x8(%eax),%eax
c000476a:	83 ec 08             	sub    $0x8,%esp
c000476d:	50                   	push   %eax
c000476e:	68 59 9e 00 c0       	push   $0xc0009e59
c0004773:	e8 86 ec ff ff       	call   c00033fe <Printf>
c0004778:	83 c4 10             	add    $0x10,%esp
c000477b:	8b 45 08             	mov    0x8(%ebp),%eax
c000477e:	8b 40 0c             	mov    0xc(%eax),%eax
c0004781:	83 ec 08             	sub    $0x8,%esp
c0004784:	50                   	push   %eax
c0004785:	68 61 9e 00 c0       	push   $0xc0009e61
c000478a:	e8 6f ec ff ff       	call   c00033fe <Printf>
c000478f:	83 c4 10             	add    $0x10,%esp
c0004792:	8b 45 08             	mov    0x8(%ebp),%eax
c0004795:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0004799:	0f b6 c0             	movzbl %al,%eax
c000479c:	83 ec 08             	sub    $0x8,%esp
c000479f:	50                   	push   %eax
c00047a0:	68 72 9e 00 c0       	push   $0xc0009e72
c00047a5:	e8 54 ec ff ff       	call   c00033fe <Printf>
c00047aa:	83 c4 10             	add    $0x10,%esp
c00047ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00047b0:	0f b6 00             	movzbl (%eax),%eax
c00047b3:	0f b6 c0             	movzbl %al,%eax
c00047b6:	83 ec 08             	sub    $0x8,%esp
c00047b9:	50                   	push   %eax
c00047ba:	68 80 9e 00 c0       	push   $0xc0009e80
c00047bf:	e8 3a ec ff ff       	call   c00033fe <Printf>
c00047c4:	83 c4 10             	add    $0x10,%esp
c00047c7:	90                   	nop
c00047c8:	c9                   	leave  
c00047c9:	c3                   	ret    

c00047ca <get_partition_table>:
c00047ca:	55                   	push   %ebp
c00047cb:	89 e5                	mov    %esp,%ebp
c00047cd:	53                   	push   %ebx
c00047ce:	83 ec 24             	sub    $0x24,%esp
c00047d1:	89 e0                	mov    %esp,%eax
c00047d3:	89 c3                	mov    %eax,%ebx
c00047d5:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c00047d9:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c00047dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00047e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047e6:	c1 f8 08             	sar    $0x8,%eax
c00047e9:	88 45 e4             	mov    %al,-0x1c(%ebp)
c00047ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047ef:	c1 f8 10             	sar    $0x10,%eax
c00047f2:	88 45 e5             	mov    %al,-0x1b(%ebp)
c00047f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047f8:	c1 f8 18             	sar    $0x18,%eax
c00047fb:	89 c2                	mov    %eax,%edx
c00047fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004800:	c1 e0 04             	shl    $0x4,%eax
c0004803:	09 d0                	or     %edx,%eax
c0004805:	83 c8 e0             	or     $0xffffffe0,%eax
c0004808:	88 45 e6             	mov    %al,-0x1a(%ebp)
c000480b:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c000480f:	83 ec 0c             	sub    $0xc,%esp
c0004812:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0004815:	50                   	push   %eax
c0004816:	e8 fc fb ff ff       	call   c0004417 <hd_cmd_out>
c000481b:	83 c4 10             	add    $0x10,%esp
c000481e:	e8 79 03 00 00       	call   c0004b9c <interrupt_wait>
c0004823:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c000482a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000482d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004830:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004833:	89 c2                	mov    %eax,%edx
c0004835:	b8 10 00 00 00       	mov    $0x10,%eax
c000483a:	83 e8 01             	sub    $0x1,%eax
c000483d:	01 d0                	add    %edx,%eax
c000483f:	b9 10 00 00 00       	mov    $0x10,%ecx
c0004844:	ba 00 00 00 00       	mov    $0x0,%edx
c0004849:	f7 f1                	div    %ecx
c000484b:	6b c0 10             	imul   $0x10,%eax,%eax
c000484e:	29 c4                	sub    %eax,%esp
c0004850:	89 e0                	mov    %esp,%eax
c0004852:	83 c0 00             	add    $0x0,%eax
c0004855:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004858:	83 ec 04             	sub    $0x4,%esp
c000485b:	ff 75 f4             	pushl  -0xc(%ebp)
c000485e:	6a 00                	push   $0x0
c0004860:	ff 75 ec             	pushl  -0x14(%ebp)
c0004863:	e8 47 59 00 00       	call   c000a1af <Memset>
c0004868:	83 c4 10             	add    $0x10,%esp
c000486b:	83 ec 04             	sub    $0x4,%esp
c000486e:	ff 75 f4             	pushl  -0xc(%ebp)
c0004871:	ff 75 ec             	pushl  -0x14(%ebp)
c0004874:	68 f0 01 00 00       	push   $0x1f0
c0004879:	e8 85 59 00 00       	call   c000a203 <read_port>
c000487e:	83 c4 10             	add    $0x10,%esp
c0004881:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004884:	05 be 01 00 00       	add    $0x1be,%eax
c0004889:	83 ec 04             	sub    $0x4,%esp
c000488c:	6a 40                	push   $0x40
c000488e:	50                   	push   %eax
c000488f:	ff 75 10             	pushl  0x10(%ebp)
c0004892:	e8 ea 58 00 00       	call   c000a181 <Memcpy>
c0004897:	83 c4 10             	add    $0x10,%esp
c000489a:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c00048a1:	89 dc                	mov    %ebx,%esp
c00048a3:	90                   	nop
c00048a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00048a7:	c9                   	leave  
c00048a8:	c3                   	ret    

c00048a9 <partition>:
c00048a9:	55                   	push   %ebp
c00048aa:	89 e5                	mov    %esp,%ebp
c00048ac:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00048b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00048b5:	88 45 84             	mov    %al,-0x7c(%ebp)
c00048b8:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00048bc:	7f 19                	jg     c00048d7 <partition+0x2e>
c00048be:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00048c1:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00048c6:	89 c8                	mov    %ecx,%eax
c00048c8:	f7 ea                	imul   %edx
c00048ca:	d1 fa                	sar    %edx
c00048cc:	89 c8                	mov    %ecx,%eax
c00048ce:	c1 f8 1f             	sar    $0x1f,%eax
c00048d1:	29 c2                	sub    %eax,%edx
c00048d3:	89 d0                	mov    %edx,%eax
c00048d5:	eb 11                	jmp    c00048e8 <partition+0x3f>
c00048d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00048da:	83 e8 10             	sub    $0x10,%eax
c00048dd:	8d 50 3f             	lea    0x3f(%eax),%edx
c00048e0:	85 c0                	test   %eax,%eax
c00048e2:	0f 48 c2             	cmovs  %edx,%eax
c00048e5:	c1 f8 06             	sar    $0x6,%eax
c00048e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00048eb:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c00048ef:	0f 85 cc 00 00 00    	jne    c00049c1 <partition+0x118>
c00048f5:	83 ec 04             	sub    $0x4,%esp
c00048f8:	6a 40                	push   $0x40
c00048fa:	6a 00                	push   $0x0
c00048fc:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00048ff:	50                   	push   %eax
c0004900:	e8 aa 58 00 00       	call   c000a1af <Memset>
c0004905:	83 c4 10             	add    $0x10,%esp
c0004908:	83 ec 04             	sub    $0x4,%esp
c000490b:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000490e:	50                   	push   %eax
c000490f:	6a 00                	push   $0x0
c0004911:	ff 75 e8             	pushl  -0x18(%ebp)
c0004914:	e8 b1 fe ff ff       	call   c00047ca <get_partition_table>
c0004919:	83 c4 10             	add    $0x10,%esp
c000491c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004923:	e9 8a 00 00 00       	jmp    c00049b2 <partition+0x109>
c0004928:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000492b:	83 c0 01             	add    $0x1,%eax
c000492e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004931:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004934:	c1 e0 04             	shl    $0x4,%eax
c0004937:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000493a:	01 c8                	add    %ecx,%eax
c000493c:	83 e8 5c             	sub    $0x5c,%eax
c000493f:	8b 00                	mov    (%eax),%eax
c0004941:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0004944:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004947:	c1 e1 03             	shl    $0x3,%ecx
c000494a:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0004950:	01 ca                	add    %ecx,%edx
c0004952:	81 c2 84 0e 01 c0    	add    $0xc0010e84,%edx
c0004958:	89 02                	mov    %eax,(%edx)
c000495a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000495d:	c1 e0 04             	shl    $0x4,%eax
c0004960:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0004963:	01 c8                	add    %ecx,%eax
c0004965:	83 e8 58             	sub    $0x58,%eax
c0004968:	8b 00                	mov    (%eax),%eax
c000496a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c000496d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004970:	c1 e1 03             	shl    $0x3,%ecx
c0004973:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0004979:	01 ca                	add    %ecx,%edx
c000497b:	81 c2 88 0e 01 c0    	add    $0xc0010e88,%edx
c0004981:	89 02                	mov    %eax,(%edx)
c0004983:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004986:	c1 e0 04             	shl    $0x4,%eax
c0004989:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000498c:	01 c8                	add    %ecx,%eax
c000498e:	83 e8 60             	sub    $0x60,%eax
c0004991:	0f b6 00             	movzbl (%eax),%eax
c0004994:	3c 05                	cmp    $0x5,%al
c0004996:	75 16                	jne    c00049ae <partition+0x105>
c0004998:	8b 55 08             	mov    0x8(%ebp),%edx
c000499b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000499e:	01 d0                	add    %edx,%eax
c00049a0:	83 ec 08             	sub    $0x8,%esp
c00049a3:	6a 01                	push   $0x1
c00049a5:	50                   	push   %eax
c00049a6:	e8 fe fe ff ff       	call   c00048a9 <partition>
c00049ab:	83 c4 10             	add    $0x10,%esp
c00049ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00049b2:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00049b6:	0f 8e 6c ff ff ff    	jle    c0004928 <partition+0x7f>
c00049bc:	e9 ff 00 00 00       	jmp    c0004ac0 <partition+0x217>
c00049c1:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c00049c5:	0f 85 f5 00 00 00    	jne    c0004ac0 <partition+0x217>
c00049cb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00049ce:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00049d3:	89 c8                	mov    %ecx,%eax
c00049d5:	f7 ea                	imul   %edx
c00049d7:	d1 fa                	sar    %edx
c00049d9:	89 c8                	mov    %ecx,%eax
c00049db:	c1 f8 1f             	sar    $0x1f,%eax
c00049de:	29 c2                	sub    %eax,%edx
c00049e0:	89 d0                	mov    %edx,%eax
c00049e2:	c1 e0 02             	shl    $0x2,%eax
c00049e5:	01 d0                	add    %edx,%eax
c00049e7:	29 c1                	sub    %eax,%ecx
c00049e9:	89 c8                	mov    %ecx,%eax
c00049eb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00049ee:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00049f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00049f4:	c1 e2 03             	shl    $0x3,%edx
c00049f7:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00049fd:	01 d0                	add    %edx,%eax
c00049ff:	05 84 0e 01 c0       	add    $0xc0010e84,%eax
c0004a04:	8b 00                	mov    (%eax),%eax
c0004a06:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004a09:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a0f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004a12:	83 e8 01             	sub    $0x1,%eax
c0004a15:	c1 e0 04             	shl    $0x4,%eax
c0004a18:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004a1b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004a22:	e9 8c 00 00 00       	jmp    c0004ab3 <partition+0x20a>
c0004a27:	83 ec 04             	sub    $0x4,%esp
c0004a2a:	6a 40                	push   $0x40
c0004a2c:	6a 00                	push   $0x0
c0004a2e:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0004a31:	50                   	push   %eax
c0004a32:	e8 78 57 00 00       	call   c000a1af <Memset>
c0004a37:	83 c4 10             	add    $0x10,%esp
c0004a3a:	83 ec 04             	sub    $0x4,%esp
c0004a3d:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0004a40:	50                   	push   %eax
c0004a41:	ff 75 f0             	pushl  -0x10(%ebp)
c0004a44:	ff 75 e8             	pushl  -0x18(%ebp)
c0004a47:	e8 7e fd ff ff       	call   c00047ca <get_partition_table>
c0004a4c:	83 c4 10             	add    $0x10,%esp
c0004a4f:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0004a52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004a55:	01 d0                	add    %edx,%eax
c0004a57:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004a5a:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004a5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a60:	01 c2                	add    %eax,%edx
c0004a62:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004a65:	8d 48 04             	lea    0x4(%eax),%ecx
c0004a68:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a6b:	c1 e1 03             	shl    $0x3,%ecx
c0004a6e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004a74:	01 c8                	add    %ecx,%eax
c0004a76:	05 84 0e 01 c0       	add    $0xc0010e84,%eax
c0004a7b:	89 10                	mov    %edx,(%eax)
c0004a7d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004a80:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0004a83:	8d 4a 04             	lea    0x4(%edx),%ecx
c0004a86:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004a89:	c1 e1 03             	shl    $0x3,%ecx
c0004a8c:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0004a92:	01 ca                	add    %ecx,%edx
c0004a94:	81 c2 88 0e 01 c0    	add    $0xc0010e88,%edx
c0004a9a:	89 02                	mov    %eax,(%edx)
c0004a9c:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0004aa0:	84 c0                	test   %al,%al
c0004aa2:	74 1b                	je     c0004abf <partition+0x216>
c0004aa4:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0004aa7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004aaa:	01 d0                	add    %edx,%eax
c0004aac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004aaf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0004ab3:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0004ab7:	0f 8e 6a ff ff ff    	jle    c0004a27 <partition+0x17e>
c0004abd:	eb 01                	jmp    c0004ac0 <partition+0x217>
c0004abf:	90                   	nop
c0004ac0:	90                   	nop
c0004ac1:	c9                   	leave  
c0004ac2:	c3                   	ret    

c0004ac3 <hd_open>:
c0004ac3:	55                   	push   %ebp
c0004ac4:	89 e5                	mov    %esp,%ebp
c0004ac6:	83 ec 18             	sub    $0x18,%esp
c0004ac9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004ad0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004ad3:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004ad9:	05 80 0e 01 c0       	add    $0xc0010e80,%eax
c0004ade:	8b 00                	mov    (%eax),%eax
c0004ae0:	8d 50 01             	lea    0x1(%eax),%edx
c0004ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004ae6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004aec:	05 80 0e 01 c0       	add    $0xc0010e80,%eax
c0004af1:	89 10                	mov    %edx,(%eax)
c0004af3:	83 ec 0c             	sub    $0xc,%esp
c0004af6:	6a 00                	push   $0x0
c0004af8:	e8 1c fa ff ff       	call   c0004519 <hd_identify>
c0004afd:	83 c4 10             	add    $0x10,%esp
c0004b00:	83 ec 08             	sub    $0x8,%esp
c0004b03:	6a 00                	push   $0x0
c0004b05:	6a 00                	push   $0x0
c0004b07:	e8 9d fd ff ff       	call   c00048a9 <partition>
c0004b0c:	83 c4 10             	add    $0x10,%esp
c0004b0f:	90                   	nop
c0004b10:	c9                   	leave  
c0004b11:	c3                   	ret    

c0004b12 <get_hd_ioctl>:
c0004b12:	55                   	push   %ebp
c0004b13:	89 e5                	mov    %esp,%ebp
c0004b15:	83 ec 10             	sub    $0x10,%esp
c0004b18:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0004b1c:	7f 19                	jg     c0004b37 <get_hd_ioctl+0x25>
c0004b1e:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0004b21:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0004b26:	89 c8                	mov    %ecx,%eax
c0004b28:	f7 ea                	imul   %edx
c0004b2a:	d1 fa                	sar    %edx
c0004b2c:	89 c8                	mov    %ecx,%eax
c0004b2e:	c1 f8 1f             	sar    $0x1f,%eax
c0004b31:	29 c2                	sub    %eax,%edx
c0004b33:	89 d0                	mov    %edx,%eax
c0004b35:	eb 11                	jmp    c0004b48 <get_hd_ioctl+0x36>
c0004b37:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b3a:	83 e8 10             	sub    $0x10,%eax
c0004b3d:	8d 50 3f             	lea    0x3f(%eax),%edx
c0004b40:	85 c0                	test   %eax,%eax
c0004b42:	0f 48 c2             	cmovs  %edx,%eax
c0004b45:	c1 f8 06             	sar    $0x6,%eax
c0004b48:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b4b:	8b 55 08             	mov    0x8(%ebp),%edx
c0004b4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b51:	c1 e2 03             	shl    $0x3,%edx
c0004b54:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004b5a:	01 d0                	add    %edx,%eax
c0004b5c:	05 88 0e 01 c0       	add    $0xc0010e88,%eax
c0004b61:	8b 00                	mov    (%eax),%eax
c0004b63:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004b66:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004b69:	c9                   	leave  
c0004b6a:	c3                   	ret    

c0004b6b <wait_for>:
c0004b6b:	55                   	push   %ebp
c0004b6c:	89 e5                	mov    %esp,%ebp
c0004b6e:	83 ec 08             	sub    $0x8,%esp
c0004b71:	83 ec 04             	sub    $0x4,%esp
c0004b74:	68 40 42 0f 00       	push   $0xf4240
c0004b79:	6a 08                	push   $0x8
c0004b7b:	6a 08                	push   $0x8
c0004b7d:	e8 97 02 00 00       	call   c0004e19 <waitfor>
c0004b82:	83 c4 10             	add    $0x10,%esp
c0004b85:	85 c0                	test   %eax,%eax
c0004b87:	75 10                	jne    c0004b99 <wait_for+0x2e>
c0004b89:	83 ec 0c             	sub    $0xc,%esp
c0004b8c:	68 8b 9e 00 c0       	push   $0xc0009e8b
c0004b91:	e8 9c eb ff ff       	call   c0003732 <panic>
c0004b96:	83 c4 10             	add    $0x10,%esp
c0004b99:	90                   	nop
c0004b9a:	c9                   	leave  
c0004b9b:	c3                   	ret    

c0004b9c <interrupt_wait>:
c0004b9c:	55                   	push   %ebp
c0004b9d:	89 e5                	mov    %esp,%ebp
c0004b9f:	83 ec 78             	sub    $0x78,%esp
c0004ba2:	83 ec 04             	sub    $0x4,%esp
c0004ba5:	68 13 02 00 00       	push   $0x213
c0004baa:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0004bad:	50                   	push   %eax
c0004bae:	6a 02                	push   $0x2
c0004bb0:	e8 13 f4 ff ff       	call   c0003fc8 <send_rec>
c0004bb5:	83 c4 10             	add    $0x10,%esp
c0004bb8:	90                   	nop
c0004bb9:	c9                   	leave  
c0004bba:	c3                   	ret    

c0004bbb <hd_rdwt>:
c0004bbb:	55                   	push   %ebp
c0004bbc:	89 e5                	mov    %esp,%ebp
c0004bbe:	83 ec 48             	sub    $0x48,%esp
c0004bc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bc4:	8b 40 18             	mov    0x18(%eax),%eax
c0004bc7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004bca:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bcd:	8b 40 14             	mov    0x14(%eax),%eax
c0004bd0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004bd3:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0004bd7:	7f 19                	jg     c0004bf2 <hd_rdwt+0x37>
c0004bd9:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0004bdc:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0004be1:	89 c8                	mov    %ecx,%eax
c0004be3:	f7 ea                	imul   %edx
c0004be5:	d1 fa                	sar    %edx
c0004be7:	89 c8                	mov    %ecx,%eax
c0004be9:	c1 f8 1f             	sar    $0x1f,%eax
c0004bec:	29 c2                	sub    %eax,%edx
c0004bee:	89 d0                	mov    %edx,%eax
c0004bf0:	eb 11                	jmp    c0004c03 <hd_rdwt+0x48>
c0004bf2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004bf5:	83 e8 10             	sub    $0x10,%eax
c0004bf8:	8d 50 3f             	lea    0x3f(%eax),%edx
c0004bfb:	85 c0                	test   %eax,%eax
c0004bfd:	0f 48 c2             	cmovs  %edx,%eax
c0004c00:	c1 f8 06             	sar    $0x6,%eax
c0004c03:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004c06:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004c09:	8d 50 f0             	lea    -0x10(%eax),%edx
c0004c0c:	89 d0                	mov    %edx,%eax
c0004c0e:	c1 f8 1f             	sar    $0x1f,%eax
c0004c11:	c1 e8 1a             	shr    $0x1a,%eax
c0004c14:	01 c2                	add    %eax,%edx
c0004c16:	83 e2 3f             	and    $0x3f,%edx
c0004c19:	29 c2                	sub    %eax,%edx
c0004c1b:	89 d0                	mov    %edx,%eax
c0004c1d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004c20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004c23:	c1 e8 09             	shr    $0x9,%eax
c0004c26:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004c29:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0004c2d:	7f 1a                	jg     c0004c49 <hd_rdwt+0x8e>
c0004c2f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004c32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004c35:	c1 e2 03             	shl    $0x3,%edx
c0004c38:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004c3e:	01 d0                	add    %edx,%eax
c0004c40:	05 84 0e 01 c0       	add    $0xc0010e84,%eax
c0004c45:	8b 00                	mov    (%eax),%eax
c0004c47:	eb 1b                	jmp    c0004c64 <hd_rdwt+0xa9>
c0004c49:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004c4c:	8d 50 04             	lea    0x4(%eax),%edx
c0004c4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004c52:	c1 e2 03             	shl    $0x3,%edx
c0004c55:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004c5b:	01 d0                	add    %edx,%eax
c0004c5d:	05 84 0e 01 c0       	add    $0xc0010e84,%eax
c0004c62:	8b 00                	mov    (%eax),%eax
c0004c64:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0004c67:	01 d0                	add    %edx,%eax
c0004c69:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004c6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c6f:	8b 40 0c             	mov    0xc(%eax),%eax
c0004c72:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004c75:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c78:	05 ff 01 00 00       	add    $0x1ff,%eax
c0004c7d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0004c83:	85 c0                	test   %eax,%eax
c0004c85:	0f 48 c2             	cmovs  %edx,%eax
c0004c88:	c1 f8 09             	sar    $0x9,%eax
c0004c8b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004c8e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004c91:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c97:	8b 40 10             	mov    0x10(%eax),%eax
c0004c9a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004c9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ca0:	8b 00                	mov    (%eax),%eax
c0004ca2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004ca5:	83 ec 08             	sub    $0x8,%esp
c0004ca8:	ff 75 d0             	pushl  -0x30(%ebp)
c0004cab:	ff 75 cc             	pushl  -0x34(%ebp)
c0004cae:	e8 20 25 00 00       	call   c00071d3 <v2l>
c0004cb3:	83 c4 10             	add    $0x10,%esp
c0004cb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004cb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cbc:	8b 40 68             	mov    0x68(%eax),%eax
c0004cbf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004cc2:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0004cc6:	74 22                	je     c0004cea <hd_rdwt+0x12f>
c0004cc8:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0004ccc:	74 1c                	je     c0004cea <hd_rdwt+0x12f>
c0004cce:	68 9f 01 00 00       	push   $0x19f
c0004cd3:	68 9d 9e 00 c0       	push   $0xc0009e9d
c0004cd8:	68 9d 9e 00 c0       	push   $0xc0009e9d
c0004cdd:	68 a5 9e 00 c0       	push   $0xc0009ea5
c0004ce2:	e8 69 ea ff ff       	call   c0003750 <assertion_failure>
c0004ce7:	83 c4 10             	add    $0x10,%esp
c0004cea:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0004cee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004cf1:	88 45 be             	mov    %al,-0x42(%ebp)
c0004cf4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004cf7:	88 45 bf             	mov    %al,-0x41(%ebp)
c0004cfa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004cfd:	c1 f8 08             	sar    $0x8,%eax
c0004d00:	88 45 c0             	mov    %al,-0x40(%ebp)
c0004d03:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004d06:	c1 f8 10             	sar    $0x10,%eax
c0004d09:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0004d0c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004d0f:	c1 f8 18             	sar    $0x18,%eax
c0004d12:	83 e0 0f             	and    $0xf,%eax
c0004d15:	83 c8 e0             	or     $0xffffffe0,%eax
c0004d18:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0004d1b:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0004d1f:	75 07                	jne    c0004d28 <hd_rdwt+0x16d>
c0004d21:	b8 20 00 00 00       	mov    $0x20,%eax
c0004d26:	eb 05                	jmp    c0004d2d <hd_rdwt+0x172>
c0004d28:	b8 30 00 00 00       	mov    $0x30,%eax
c0004d2d:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0004d30:	83 ec 0c             	sub    $0xc,%esp
c0004d33:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0004d36:	50                   	push   %eax
c0004d37:	e8 db f6 ff ff       	call   c0004417 <hd_cmd_out>
c0004d3c:	83 c4 10             	add    $0x10,%esp
c0004d3f:	e9 9c 00 00 00       	jmp    c0004de0 <hd_rdwt+0x225>
c0004d44:	b8 00 02 00 00       	mov    $0x200,%eax
c0004d49:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0004d50:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c0004d54:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004d57:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0004d5b:	75 51                	jne    c0004dae <hd_rdwt+0x1f3>
c0004d5d:	e8 09 fe ff ff       	call   c0004b6b <wait_for>
c0004d62:	e8 35 fe ff ff       	call   c0004b9c <interrupt_wait>
c0004d67:	83 ec 04             	sub    $0x4,%esp
c0004d6a:	ff 75 c4             	pushl  -0x3c(%ebp)
c0004d6d:	6a 00                	push   $0x0
c0004d6f:	68 c0 10 01 c0       	push   $0xc00110c0
c0004d74:	e8 36 54 00 00       	call   c000a1af <Memset>
c0004d79:	83 c4 10             	add    $0x10,%esp
c0004d7c:	83 ec 04             	sub    $0x4,%esp
c0004d7f:	68 00 02 00 00       	push   $0x200
c0004d84:	68 c0 10 01 c0       	push   $0xc00110c0
c0004d89:	68 f0 01 00 00       	push   $0x1f0
c0004d8e:	e8 70 54 00 00       	call   c000a203 <read_port>
c0004d93:	83 c4 10             	add    $0x10,%esp
c0004d96:	83 ec 04             	sub    $0x4,%esp
c0004d99:	ff 75 c4             	pushl  -0x3c(%ebp)
c0004d9c:	68 c0 10 01 c0       	push   $0xc00110c0
c0004da1:	ff 75 f0             	pushl  -0x10(%ebp)
c0004da4:	e8 d8 53 00 00       	call   c000a181 <Memcpy>
c0004da9:	83 c4 10             	add    $0x10,%esp
c0004dac:	eb 26                	jmp    c0004dd4 <hd_rdwt+0x219>
c0004dae:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0004db2:	75 20                	jne    c0004dd4 <hd_rdwt+0x219>
c0004db4:	e8 b2 fd ff ff       	call   c0004b6b <wait_for>
c0004db9:	83 ec 04             	sub    $0x4,%esp
c0004dbc:	ff 75 c4             	pushl  -0x3c(%ebp)
c0004dbf:	ff 75 f0             	pushl  -0x10(%ebp)
c0004dc2:	68 f0 01 00 00       	push   $0x1f0
c0004dc7:	e8 4b 54 00 00       	call   c000a217 <write_port>
c0004dcc:	83 c4 10             	add    $0x10,%esp
c0004dcf:	e8 c8 fd ff ff       	call   c0004b9c <interrupt_wait>
c0004dd4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004dd7:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0004dda:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004ddd:	01 45 f0             	add    %eax,-0x10(%ebp)
c0004de0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004de4:	0f 85 5a ff ff ff    	jne    c0004d44 <hd_rdwt+0x189>
c0004dea:	90                   	nop
c0004deb:	c9                   	leave  
c0004dec:	c3                   	ret    

c0004ded <hd_handler>:
c0004ded:	55                   	push   %ebp
c0004dee:	89 e5                	mov    %esp,%ebp
c0004df0:	83 ec 18             	sub    $0x18,%esp
c0004df3:	83 ec 0c             	sub    $0xc,%esp
c0004df6:	68 f7 01 00 00       	push   $0x1f7
c0004dfb:	e8 d3 c9 ff ff       	call   c00017d3 <in_byte>
c0004e00:	83 c4 10             	add    $0x10,%esp
c0004e03:	0f b6 c0             	movzbl %al,%eax
c0004e06:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004e09:	83 ec 0c             	sub    $0xc,%esp
c0004e0c:	6a 02                	push   $0x2
c0004e0e:	e8 eb f3 ff ff       	call   c00041fe <inform_int>
c0004e13:	83 c4 10             	add    $0x10,%esp
c0004e16:	90                   	nop
c0004e17:	c9                   	leave  
c0004e18:	c3                   	ret    

c0004e19 <waitfor>:
c0004e19:	55                   	push   %ebp
c0004e1a:	89 e5                	mov    %esp,%ebp
c0004e1c:	83 ec 18             	sub    $0x18,%esp
c0004e1f:	e8 d3 f2 ff ff       	call   c00040f7 <get_ticks_ipc>
c0004e24:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004e27:	eb 22                	jmp    c0004e4b <waitfor+0x32>
c0004e29:	83 ec 0c             	sub    $0xc,%esp
c0004e2c:	68 f7 01 00 00       	push   $0x1f7
c0004e31:	e8 9d c9 ff ff       	call   c00017d3 <in_byte>
c0004e36:	83 c4 10             	add    $0x10,%esp
c0004e39:	0f b6 c0             	movzbl %al,%eax
c0004e3c:	23 45 08             	and    0x8(%ebp),%eax
c0004e3f:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0004e42:	75 07                	jne    c0004e4b <waitfor+0x32>
c0004e44:	b8 01 00 00 00       	mov    $0x1,%eax
c0004e49:	eb 1d                	jmp    c0004e68 <waitfor+0x4f>
c0004e4b:	e8 a7 f2 ff ff       	call   c00040f7 <get_ticks_ipc>
c0004e50:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0004e53:	89 c2                	mov    %eax,%edx
c0004e55:	89 d0                	mov    %edx,%eax
c0004e57:	c1 e0 02             	shl    $0x2,%eax
c0004e5a:	01 d0                	add    %edx,%eax
c0004e5c:	01 c0                	add    %eax,%eax
c0004e5e:	39 45 10             	cmp    %eax,0x10(%ebp)
c0004e61:	7f c6                	jg     c0004e29 <waitfor+0x10>
c0004e63:	b8 00 00 00 00       	mov    $0x0,%eax
c0004e68:	c9                   	leave  
c0004e69:	c3                   	ret    

c0004e6a <print_hd_info>:
c0004e6a:	55                   	push   %ebp
c0004e6b:	89 e5                	mov    %esp,%ebp
c0004e6d:	83 ec 18             	sub    $0x18,%esp
c0004e70:	83 ec 0c             	sub    $0xc,%esp
c0004e73:	68 c3 9e 00 c0       	push   $0xc0009ec3
c0004e78:	e8 81 e5 ff ff       	call   c00033fe <Printf>
c0004e7d:	83 c4 10             	add    $0x10,%esp
c0004e80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004e87:	eb 3b                	jmp    c0004ec4 <print_hd_info+0x5a>
c0004e89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e8c:	8b 04 c5 88 0e 01 c0 	mov    -0x3ffef178(,%eax,8),%eax
c0004e93:	85 c0                	test   %eax,%eax
c0004e95:	74 28                	je     c0004ebf <print_hd_info+0x55>
c0004e97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e9a:	8b 14 c5 88 0e 01 c0 	mov    -0x3ffef178(,%eax,8),%edx
c0004ea1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004ea4:	8b 04 c5 84 0e 01 c0 	mov    -0x3ffef17c(,%eax,8),%eax
c0004eab:	ff 75 f4             	pushl  -0xc(%ebp)
c0004eae:	52                   	push   %edx
c0004eaf:	50                   	push   %eax
c0004eb0:	68 e0 9e 00 c0       	push   $0xc0009ee0
c0004eb5:	e8 44 e5 ff ff       	call   c00033fe <Printf>
c0004eba:	83 c4 10             	add    $0x10,%esp
c0004ebd:	eb 01                	jmp    c0004ec0 <print_hd_info+0x56>
c0004ebf:	90                   	nop
c0004ec0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004ec4:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0004ec8:	7e bf                	jle    c0004e89 <print_hd_info+0x1f>
c0004eca:	83 ec 0c             	sub    $0xc,%esp
c0004ecd:	68 f8 9e 00 c0       	push   $0xc0009ef8
c0004ed2:	e8 27 e5 ff ff       	call   c00033fe <Printf>
c0004ed7:	83 c4 10             	add    $0x10,%esp
c0004eda:	83 ec 0c             	sub    $0xc,%esp
c0004edd:	68 13 9f 00 c0       	push   $0xc0009f13
c0004ee2:	e8 17 e5 ff ff       	call   c00033fe <Printf>
c0004ee7:	83 c4 10             	add    $0x10,%esp
c0004eea:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0004ef1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004ef8:	eb 44                	jmp    c0004f3e <print_hd_info+0xd4>
c0004efa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004efd:	83 c0 04             	add    $0x4,%eax
c0004f00:	8b 04 c5 88 0e 01 c0 	mov    -0x3ffef178(,%eax,8),%eax
c0004f07:	85 c0                	test   %eax,%eax
c0004f09:	74 2e                	je     c0004f39 <print_hd_info+0xcf>
c0004f0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f0e:	83 c0 04             	add    $0x4,%eax
c0004f11:	8b 14 c5 88 0e 01 c0 	mov    -0x3ffef178(,%eax,8),%edx
c0004f18:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f1b:	83 c0 04             	add    $0x4,%eax
c0004f1e:	8b 04 c5 84 0e 01 c0 	mov    -0x3ffef17c(,%eax,8),%eax
c0004f25:	ff 75 f0             	pushl  -0x10(%ebp)
c0004f28:	52                   	push   %edx
c0004f29:	50                   	push   %eax
c0004f2a:	68 e0 9e 00 c0       	push   $0xc0009ee0
c0004f2f:	e8 ca e4 ff ff       	call   c00033fe <Printf>
c0004f34:	83 c4 10             	add    $0x10,%esp
c0004f37:	eb 01                	jmp    c0004f3a <print_hd_info+0xd0>
c0004f39:	90                   	nop
c0004f3a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004f3e:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0004f42:	7e b6                	jle    c0004efa <print_hd_info+0x90>
c0004f44:	83 ec 0c             	sub    $0xc,%esp
c0004f47:	68 30 9f 00 c0       	push   $0xc0009f30
c0004f4c:	e8 ad e4 ff ff       	call   c00033fe <Printf>
c0004f51:	83 c4 10             	add    $0x10,%esp
c0004f54:	90                   	nop
c0004f55:	c9                   	leave  
c0004f56:	c3                   	ret    

c0004f57 <is_empty>:
c0004f57:	55                   	push   %ebp
c0004f58:	89 e5                	mov    %esp,%ebp
c0004f5a:	83 ec 10             	sub    $0x10,%esp
c0004f5d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0004f64:	eb 1a                	jmp    c0004f80 <is_empty+0x29>
c0004f66:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0004f69:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f6c:	01 d0                	add    %edx,%eax
c0004f6e:	0f b6 00             	movzbl (%eax),%eax
c0004f71:	84 c0                	test   %al,%al
c0004f73:	74 07                	je     c0004f7c <is_empty+0x25>
c0004f75:	b8 00 00 00 00       	mov    $0x0,%eax
c0004f7a:	eb 11                	jmp    c0004f8d <is_empty+0x36>
c0004f7c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0004f80:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f83:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0004f86:	7c de                	jl     c0004f66 <is_empty+0xf>
c0004f88:	b8 01 00 00 00       	mov    $0x1,%eax
c0004f8d:	c9                   	leave  
c0004f8e:	c3                   	ret    
c0004f8f:	90                   	nop

c0004f90 <get_ticks>:
c0004f90:	b8 00 00 00 00       	mov    $0x0,%eax
c0004f95:	cd 90                	int    $0x90
c0004f97:	c3                   	ret    

c0004f98 <write2>:
c0004f98:	b8 01 00 00 00       	mov    $0x1,%eax
c0004f9d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004fa1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004fa5:	cd 90                	int    $0x90
c0004fa7:	c3                   	ret    

c0004fa8 <write_debug>:
c0004fa8:	b8 02 00 00 00       	mov    $0x2,%eax
c0004fad:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004fb1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004fb5:	cd 90                	int    $0x90
c0004fb7:	c3                   	ret    

c0004fb8 <send_msg2>:
c0004fb8:	b8 03 00 00 00       	mov    $0x3,%eax
c0004fbd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004fc1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004fc5:	cd 90                	int    $0x90
c0004fc7:	c3                   	ret    

c0004fc8 <send_msg>:
c0004fc8:	55                   	push   %ebp
c0004fc9:	89 e5                	mov    %esp,%ebp
c0004fcb:	53                   	push   %ebx
c0004fcc:	51                   	push   %ecx
c0004fcd:	b8 03 00 00 00       	mov    $0x3,%eax
c0004fd2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0004fd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0004fd8:	cd 90                	int    $0x90
c0004fda:	59                   	pop    %ecx
c0004fdb:	5b                   	pop    %ebx
c0004fdc:	5d                   	pop    %ebp
c0004fdd:	c3                   	ret    

c0004fde <receive_msg2>:
c0004fde:	b8 04 00 00 00       	mov    $0x4,%eax
c0004fe3:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004fe7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004feb:	cd 90                	int    $0x90
c0004fed:	c3                   	ret    

c0004fee <receive_msg>:
c0004fee:	55                   	push   %ebp
c0004fef:	89 e5                	mov    %esp,%ebp
c0004ff1:	53                   	push   %ebx
c0004ff2:	51                   	push   %ecx
c0004ff3:	b8 04 00 00 00       	mov    $0x4,%eax
c0004ff8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0004ffb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0004ffe:	cd 90                	int    $0x90
c0005000:	59                   	pop    %ecx
c0005001:	5b                   	pop    %ebx
c0005002:	5d                   	pop    %ebp
c0005003:	c3                   	ret    

c0005004 <task_fs>:
c0005004:	55                   	push   %ebp
c0005005:	89 e5                	mov    %esp,%ebp
c0005007:	81 ec 08 01 00 00    	sub    $0x108,%esp
c000500d:	e8 91 07 00 00       	call   c00057a3 <init_fs>
c0005012:	83 ec 04             	sub    $0x4,%esp
c0005015:	6a 6c                	push   $0x6c
c0005017:	6a 00                	push   $0x0
c0005019:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c000501f:	50                   	push   %eax
c0005020:	e8 8a 51 00 00       	call   c000a1af <Memset>
c0005025:	83 c4 10             	add    $0x10,%esp
c0005028:	83 ec 04             	sub    $0x4,%esp
c000502b:	6a 0b                	push   $0xb
c000502d:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0005033:	50                   	push   %eax
c0005034:	6a 02                	push   $0x2
c0005036:	e8 8d ef ff ff       	call   c0003fc8 <send_rec>
c000503b:	83 c4 10             	add    $0x10,%esp
c000503e:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0005044:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005047:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c000504d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005050:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0005056:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005059:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c000505f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005062:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c0005068:	85 c0                	test   %eax,%eax
c000506a:	75 07                	jne    c0005073 <task_fs+0x6f>
c000506c:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0005073:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005076:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c000507c:	05 00 21 08 c0       	add    $0xc0082100,%eax
c0005081:	a3 c4 ea 00 c0       	mov    %eax,0xc000eac4
c0005086:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000508d:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0005091:	74 1c                	je     c00050af <task_fs+0xab>
c0005093:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0005097:	7f 08                	jg     c00050a1 <task_fs+0x9d>
c0005099:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c000509d:	74 3e                	je     c00050dd <task_fs+0xd9>
c000509f:	eb 4b                	jmp    c00050ec <task_fs+0xe8>
c00050a1:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c00050a5:	74 1f                	je     c00050c6 <task_fs+0xc2>
c00050a7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00050ab:	74 19                	je     c00050c6 <task_fs+0xc2>
c00050ad:	eb 3d                	jmp    c00050ec <task_fs+0xe8>
c00050af:	83 ec 0c             	sub    $0xc,%esp
c00050b2:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c00050b8:	50                   	push   %eax
c00050b9:	e8 14 07 00 00       	call   c00057d2 <do_open>
c00050be:	83 c4 10             	add    $0x10,%esp
c00050c1:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00050c4:	eb 26                	jmp    c00050ec <task_fs+0xe8>
c00050c6:	83 ec 0c             	sub    $0xc,%esp
c00050c9:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c00050cf:	50                   	push   %eax
c00050d0:	e8 3b 18 00 00       	call   c0006910 <do_rdwt>
c00050d5:	83 c4 10             	add    $0x10,%esp
c00050d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00050db:	eb 0f                	jmp    c00050ec <task_fs+0xe8>
c00050dd:	83 ec 0c             	sub    $0xc,%esp
c00050e0:	ff 75 e4             	pushl  -0x1c(%ebp)
c00050e3:	e8 2d 1d 00 00       	call   c0006e15 <do_close>
c00050e8:	83 c4 10             	add    $0x10,%esp
c00050eb:	90                   	nop
c00050ec:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00050f2:	83 f8 67             	cmp    $0x67,%eax
c00050f5:	74 36                	je     c000512d <task_fs+0x129>
c00050f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00050fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00050fd:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0005101:	75 06                	jne    c0005109 <task_fs+0x105>
c0005103:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005106:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005109:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
c0005110:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005113:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005116:	83 ec 04             	sub    $0x4,%esp
c0005119:	ff 75 f0             	pushl  -0x10(%ebp)
c000511c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0005122:	50                   	push   %eax
c0005123:	6a 01                	push   $0x1
c0005125:	e8 9e ee ff ff       	call   c0003fc8 <send_rec>
c000512a:	83 c4 10             	add    $0x10,%esp
c000512d:	a1 60 e6 00 c0       	mov    0xc000e660,%eax
c0005132:	83 c0 01             	add    $0x1,%eax
c0005135:	a3 60 e6 00 c0       	mov    %eax,0xc000e660
c000513a:	e9 d3 fe ff ff       	jmp    c0005012 <task_fs+0xe>

c000513f <rd_wt>:
c000513f:	55                   	push   %ebp
c0005140:	89 e5                	mov    %esp,%ebp
c0005142:	83 ec 78             	sub    $0x78,%esp
c0005145:	83 ec 04             	sub    $0x4,%esp
c0005148:	6a 6c                	push   $0x6c
c000514a:	6a 00                	push   $0x0
c000514c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000514f:	50                   	push   %eax
c0005150:	e8 5a 50 00 00       	call   c000a1af <Memset>
c0005155:	83 c4 10             	add    $0x10,%esp
c0005158:	8b 45 18             	mov    0x18(%ebp),%eax
c000515b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000515e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005161:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0005164:	8b 45 10             	mov    0x10(%ebp),%eax
c0005167:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000516a:	8b 45 14             	mov    0x14(%ebp),%eax
c000516d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0005170:	8b 45 08             	mov    0x8(%ebp),%eax
c0005173:	c1 e0 09             	shl    $0x9,%eax
c0005176:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0005179:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c000517d:	74 22                	je     c00051a1 <rd_wt+0x62>
c000517f:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0005183:	74 1c                	je     c00051a1 <rd_wt+0x62>
c0005185:	68 d1 00 00 00       	push   $0xd1
c000518a:	68 50 9f 00 c0       	push   $0xc0009f50
c000518f:	68 50 9f 00 c0       	push   $0xc0009f50
c0005194:	68 5d 9f 00 c0       	push   $0xc0009f5d
c0005199:	e8 b2 e5 ff ff       	call   c0003750 <assertion_failure>
c000519e:	83 c4 10             	add    $0x10,%esp
c00051a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00051a4:	83 f8 07             	cmp    $0x7,%eax
c00051a7:	74 24                	je     c00051cd <rd_wt+0x8e>
c00051a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00051ac:	83 f8 0a             	cmp    $0xa,%eax
c00051af:	74 1c                	je     c00051cd <rd_wt+0x8e>
c00051b1:	68 d2 00 00 00       	push   $0xd2
c00051b6:	68 50 9f 00 c0       	push   $0xc0009f50
c00051bb:	68 50 9f 00 c0       	push   $0xc0009f50
c00051c0:	68 7c 9f 00 c0       	push   $0xc0009f7c
c00051c5:	e8 86 e5 ff ff       	call   c0003750 <assertion_failure>
c00051ca:	83 c4 10             	add    $0x10,%esp
c00051cd:	83 ec 04             	sub    $0x4,%esp
c00051d0:	6a 02                	push   $0x2
c00051d2:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00051d5:	50                   	push   %eax
c00051d6:	6a 03                	push   $0x3
c00051d8:	e8 eb ed ff ff       	call   c0003fc8 <send_rec>
c00051dd:	83 c4 10             	add    $0x10,%esp
c00051e0:	90                   	nop
c00051e1:	c9                   	leave  
c00051e2:	c3                   	ret    

c00051e3 <mkfs>:
c00051e3:	55                   	push   %ebp
c00051e4:	89 e5                	mov    %esp,%ebp
c00051e6:	57                   	push   %edi
c00051e7:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c00051ed:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00051f2:	83 ec 04             	sub    $0x4,%esp
c00051f5:	68 00 02 00 00       	push   $0x200
c00051fa:	6a 00                	push   $0x0
c00051fc:	50                   	push   %eax
c00051fd:	e8 ad 4f 00 00       	call   c000a1af <Memset>
c0005202:	83 c4 10             	add    $0x10,%esp
c0005205:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000520a:	83 ec 0c             	sub    $0xc,%esp
c000520d:	6a 0a                	push   $0xa
c000520f:	68 00 02 00 00       	push   $0x200
c0005214:	50                   	push   %eax
c0005215:	6a 20                	push   $0x20
c0005217:	6a 00                	push   $0x0
c0005219:	e8 21 ff ff ff       	call   c000513f <rd_wt>
c000521e:	83 c4 20             	add    $0x20,%esp
c0005221:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005226:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005229:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000522c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0005233:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005236:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c000523d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005240:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0005247:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000524a:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0005251:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005254:	8b 40 04             	mov    0x4(%eax),%eax
c0005257:	8d 50 02             	lea    0x2(%eax),%edx
c000525a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000525d:	8b 40 08             	mov    0x8(%eax),%eax
c0005260:	01 c2                	add    %eax,%edx
c0005262:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005265:	8b 40 0c             	mov    0xc(%eax),%eax
c0005268:	01 c2                	add    %eax,%edx
c000526a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000526d:	89 10                	mov    %edx,(%eax)
c000526f:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0005276:	b8 00 02 00 00       	mov    $0x200,%eax
c000527b:	2b 45 d8             	sub    -0x28(%ebp),%eax
c000527e:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0005284:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0005287:	01 ca                	add    %ecx,%edx
c0005289:	83 ec 04             	sub    $0x4,%esp
c000528c:	50                   	push   %eax
c000528d:	6a 80                	push   $0xffffff80
c000528f:	52                   	push   %edx
c0005290:	e8 1a 4f 00 00       	call   c000a1af <Memset>
c0005295:	83 c4 10             	add    $0x10,%esp
c0005298:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000529d:	83 ec 0c             	sub    $0xc,%esp
c00052a0:	6a 0a                	push   $0xa
c00052a2:	68 00 02 00 00       	push   $0x200
c00052a7:	50                   	push   %eax
c00052a8:	6a 20                	push   $0x20
c00052aa:	6a 01                	push   $0x1
c00052ac:	e8 8e fe ff ff       	call   c000513f <rd_wt>
c00052b1:	83 c4 20             	add    $0x20,%esp
c00052b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00052b7:	8b 10                	mov    (%eax),%edx
c00052b9:	89 55 98             	mov    %edx,-0x68(%ebp)
c00052bc:	8b 50 04             	mov    0x4(%eax),%edx
c00052bf:	89 55 9c             	mov    %edx,-0x64(%ebp)
c00052c2:	8b 50 08             	mov    0x8(%eax),%edx
c00052c5:	89 55 a0             	mov    %edx,-0x60(%ebp)
c00052c8:	8b 50 0c             	mov    0xc(%eax),%edx
c00052cb:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c00052ce:	8b 50 10             	mov    0x10(%eax),%edx
c00052d1:	89 55 a8             	mov    %edx,-0x58(%ebp)
c00052d4:	8b 50 14             	mov    0x14(%eax),%edx
c00052d7:	89 55 ac             	mov    %edx,-0x54(%ebp)
c00052da:	8b 50 18             	mov    0x18(%eax),%edx
c00052dd:	89 55 b0             	mov    %edx,-0x50(%ebp)
c00052e0:	8b 50 1c             	mov    0x1c(%eax),%edx
c00052e3:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c00052e6:	8b 40 20             	mov    0x20(%eax),%eax
c00052e9:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00052ec:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c00052f0:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c00052f4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00052f9:	83 ec 04             	sub    $0x4,%esp
c00052fc:	6a 01                	push   $0x1
c00052fe:	52                   	push   %edx
c00052ff:	50                   	push   %eax
c0005300:	e8 aa 4e 00 00       	call   c000a1af <Memset>
c0005305:	83 c4 10             	add    $0x10,%esp
c0005308:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000530d:	83 c0 01             	add    $0x1,%eax
c0005310:	83 ec 04             	sub    $0x4,%esp
c0005313:	68 ff 01 00 00       	push   $0x1ff
c0005318:	6a 80                	push   $0xffffff80
c000531a:	50                   	push   %eax
c000531b:	e8 8f 4e 00 00       	call   c000a1af <Memset>
c0005320:	83 c4 10             	add    $0x10,%esp
c0005323:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005328:	83 ec 0c             	sub    $0xc,%esp
c000532b:	6a 0a                	push   $0xa
c000532d:	68 00 02 00 00       	push   $0x200
c0005332:	50                   	push   %eax
c0005333:	6a 20                	push   $0x20
c0005335:	6a 02                	push   $0x2
c0005337:	e8 03 fe ff ff       	call   c000513f <rd_wt>
c000533c:	83 c4 20             	add    $0x20,%esp
c000533f:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0005346:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000534b:	83 ec 04             	sub    $0x4,%esp
c000534e:	68 00 02 00 00       	push   $0x200
c0005353:	6a ff                	push   $0xffffffff
c0005355:	50                   	push   %eax
c0005356:	e8 54 4e 00 00       	call   c000a1af <Memset>
c000535b:	83 c4 10             	add    $0x10,%esp
c000535e:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005363:	83 ec 0c             	sub    $0xc,%esp
c0005366:	6a 0a                	push   $0xa
c0005368:	68 00 02 00 00       	push   $0x200
c000536d:	50                   	push   %eax
c000536e:	6a 20                	push   $0x20
c0005370:	ff 75 d0             	pushl  -0x30(%ebp)
c0005373:	e8 c7 fd ff ff       	call   c000513f <rd_wt>
c0005378:	83 c4 20             	add    $0x20,%esp
c000537b:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005380:	83 ec 04             	sub    $0x4,%esp
c0005383:	6a 01                	push   $0x1
c0005385:	6a 01                	push   $0x1
c0005387:	50                   	push   %eax
c0005388:	e8 22 4e 00 00       	call   c000a1af <Memset>
c000538d:	83 c4 10             	add    $0x10,%esp
c0005390:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005395:	83 c0 01             	add    $0x1,%eax
c0005398:	83 ec 04             	sub    $0x4,%esp
c000539b:	68 ff 01 00 00       	push   $0x1ff
c00053a0:	6a 00                	push   $0x0
c00053a2:	50                   	push   %eax
c00053a3:	e8 07 4e 00 00       	call   c000a1af <Memset>
c00053a8:	83 c4 10             	add    $0x10,%esp
c00053ab:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00053b0:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00053b3:	83 c2 01             	add    $0x1,%edx
c00053b6:	83 ec 0c             	sub    $0xc,%esp
c00053b9:	6a 0a                	push   $0xa
c00053bb:	68 00 02 00 00       	push   $0x200
c00053c0:	50                   	push   %eax
c00053c1:	6a 20                	push   $0x20
c00053c3:	52                   	push   %edx
c00053c4:	e8 76 fd ff ff       	call   c000513f <rd_wt>
c00053c9:	83 c4 20             	add    $0x20,%esp
c00053cc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00053cf:	83 e8 02             	sub    $0x2,%eax
c00053d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00053d5:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c00053dc:	eb 3f                	jmp    c000541d <mkfs+0x23a>
c00053de:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00053e3:	83 ec 04             	sub    $0x4,%esp
c00053e6:	68 00 02 00 00       	push   $0x200
c00053eb:	6a 00                	push   $0x0
c00053ed:	50                   	push   %eax
c00053ee:	e8 bc 4d 00 00       	call   c000a1af <Memset>
c00053f3:	83 c4 10             	add    $0x10,%esp
c00053f6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00053fb:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c00053fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005401:	01 ca                	add    %ecx,%edx
c0005403:	83 ec 0c             	sub    $0xc,%esp
c0005406:	6a 0a                	push   $0xa
c0005408:	68 00 02 00 00       	push   $0x200
c000540d:	50                   	push   %eax
c000540e:	6a 20                	push   $0x20
c0005410:	52                   	push   %edx
c0005411:	e8 29 fd ff ff       	call   c000513f <rd_wt>
c0005416:	83 c4 20             	add    $0x20,%esp
c0005419:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000541d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0005420:	83 c0 01             	add    $0x1,%eax
c0005423:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005426:	7e b6                	jle    c00053de <mkfs+0x1fb>
c0005428:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000542d:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0005430:	83 c2 03             	add    $0x3,%edx
c0005433:	83 ec 0c             	sub    $0xc,%esp
c0005436:	6a 0a                	push   $0xa
c0005438:	68 00 02 00 00       	push   $0x200
c000543d:	50                   	push   %eax
c000543e:	6a 20                	push   $0x20
c0005440:	52                   	push   %edx
c0005441:	e8 f9 fc ff ff       	call   c000513f <rd_wt>
c0005446:	83 c4 20             	add    $0x20,%esp
c0005449:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000544e:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0005451:	83 c2 03             	add    $0x3,%edx
c0005454:	83 ec 0c             	sub    $0xc,%esp
c0005457:	6a 07                	push   $0x7
c0005459:	68 00 02 00 00       	push   $0x200
c000545e:	50                   	push   %eax
c000545f:	6a 20                	push   $0x20
c0005461:	52                   	push   %edx
c0005462:	e8 d8 fc ff ff       	call   c000513f <rd_wt>
c0005467:	83 c4 20             	add    $0x20,%esp
c000546a:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000546f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005472:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005475:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000547b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000547e:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0005485:	8b 55 98             	mov    -0x68(%ebp),%edx
c0005488:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000548b:	89 50 08             	mov    %edx,0x8(%eax)
c000548e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005491:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0005498:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000549b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c00054a2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00054a5:	8b 10                	mov    (%eax),%edx
c00054a7:	89 15 c0 20 01 c0    	mov    %edx,0xc00120c0
c00054ad:	8b 50 04             	mov    0x4(%eax),%edx
c00054b0:	89 15 c4 20 01 c0    	mov    %edx,0xc00120c4
c00054b6:	8b 50 08             	mov    0x8(%eax),%edx
c00054b9:	89 15 c8 20 01 c0    	mov    %edx,0xc00120c8
c00054bf:	8b 50 0c             	mov    0xc(%eax),%edx
c00054c2:	89 15 cc 20 01 c0    	mov    %edx,0xc00120cc
c00054c8:	8b 50 10             	mov    0x10(%eax),%edx
c00054cb:	89 15 d0 20 01 c0    	mov    %edx,0xc00120d0
c00054d1:	8b 50 14             	mov    0x14(%eax),%edx
c00054d4:	89 15 d4 20 01 c0    	mov    %edx,0xc00120d4
c00054da:	8b 50 18             	mov    0x18(%eax),%edx
c00054dd:	89 15 d8 20 01 c0    	mov    %edx,0xc00120d8
c00054e3:	8b 50 1c             	mov    0x1c(%eax),%edx
c00054e6:	89 15 dc 20 01 c0    	mov    %edx,0xc00120dc
c00054ec:	8b 50 20             	mov    0x20(%eax),%edx
c00054ef:	89 15 e0 20 01 c0    	mov    %edx,0xc00120e0
c00054f5:	8b 40 24             	mov    0x24(%eax),%eax
c00054f8:	a3 e4 20 01 c0       	mov    %eax,0xc00120e4
c00054fd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005504:	eb 4c                	jmp    c0005552 <mkfs+0x36f>
c0005506:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000550b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000550e:	83 c2 01             	add    $0x1,%edx
c0005511:	c1 e2 05             	shl    $0x5,%edx
c0005514:	01 d0                	add    %edx,%eax
c0005516:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005519:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000551c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0005522:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005525:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000552c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000552f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0005536:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c000553d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005540:	c1 e0 08             	shl    $0x8,%eax
c0005543:	0b 45 f0             	or     -0x10(%ebp),%eax
c0005546:	89 c2                	mov    %eax,%edx
c0005548:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000554b:	89 50 08             	mov    %edx,0x8(%eax)
c000554e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005552:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0005556:	7e ae                	jle    c0005506 <mkfs+0x323>
c0005558:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c000555f:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0005565:	b8 00 00 00 00       	mov    $0x0,%eax
c000556a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c000556f:	89 d7                	mov    %edx,%edi
c0005571:	f3 ab                	rep stos %eax,%es:(%edi)
c0005573:	c7 85 70 ff ff ff a2 	movl   $0xc0009fa2,-0x90(%ebp)
c000557a:	9f 00 c0 
c000557d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005584:	eb 54                	jmp    c00055da <mkfs+0x3f7>
c0005586:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000558b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000558e:	83 c2 04             	add    $0x4,%edx
c0005591:	c1 e2 05             	shl    $0x5,%edx
c0005594:	01 d0                	add    %edx,%eax
c0005596:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005599:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000559c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c00055a2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00055a5:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c00055ac:	8b 45 98             	mov    -0x68(%ebp),%eax
c00055af:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00055b2:	83 c2 01             	add    $0x1,%edx
c00055b5:	c1 e2 0b             	shl    $0xb,%edx
c00055b8:	01 c2                	add    %eax,%edx
c00055ba:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00055bd:	89 50 08             	mov    %edx,0x8(%eax)
c00055c0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00055c3:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c00055ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00055cd:	8d 50 05             	lea    0x5(%eax),%edx
c00055d0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00055d3:	89 50 10             	mov    %edx,0x10(%eax)
c00055d6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00055da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00055dd:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00055e0:	7c a4                	jl     c0005586 <mkfs+0x3a3>
c00055e2:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00055e7:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00055ea:	83 c2 03             	add    $0x3,%edx
c00055ed:	83 ec 0c             	sub    $0xc,%esp
c00055f0:	6a 0a                	push   $0xa
c00055f2:	68 00 02 00 00       	push   $0x200
c00055f7:	50                   	push   %eax
c00055f8:	6a 20                	push   $0x20
c00055fa:	52                   	push   %edx
c00055fb:	e8 3f fb ff ff       	call   c000513f <rd_wt>
c0005600:	83 c4 20             	add    $0x20,%esp
c0005603:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005609:	8b 45 98             	mov    -0x68(%ebp),%eax
c000560c:	83 ec 0c             	sub    $0xc,%esp
c000560f:	6a 07                	push   $0x7
c0005611:	68 00 02 00 00       	push   $0x200
c0005616:	52                   	push   %edx
c0005617:	6a 20                	push   $0x20
c0005619:	50                   	push   %eax
c000561a:	e8 20 fb ff ff       	call   c000513f <rd_wt>
c000561f:	83 c4 20             	add    $0x20,%esp
c0005622:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0005629:	00 00 00 
c000562c:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0005633:	2e 00 
c0005635:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000563a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000563d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005640:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0005646:	83 ec 0c             	sub    $0xc,%esp
c0005649:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c000564f:	50                   	push   %eax
c0005650:	e8 93 4b 00 00       	call   c000a1e8 <Strlen>
c0005655:	83 c4 10             	add    $0x10,%esp
c0005658:	89 c1                	mov    %eax,%ecx
c000565a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000565d:	8d 50 04             	lea    0x4(%eax),%edx
c0005660:	83 ec 04             	sub    $0x4,%esp
c0005663:	51                   	push   %ecx
c0005664:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c000566a:	50                   	push   %eax
c000566b:	52                   	push   %edx
c000566c:	e8 10 4b 00 00       	call   c000a181 <Memcpy>
c0005671:	83 c4 10             	add    $0x10,%esp
c0005674:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c000567a:	b8 00 00 00 00       	mov    $0x0,%eax
c000567f:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0005684:	89 d7                	mov    %edx,%edi
c0005686:	f3 ab                	rep stos %eax,%es:(%edi)
c0005688:	c7 85 34 ff ff ff ae 	movl   $0xc0009fae,-0xcc(%ebp)
c000568f:	9f 00 c0 
c0005692:	c7 85 38 ff ff ff b7 	movl   $0xc0009fb7,-0xc8(%ebp)
c0005699:	9f 00 c0 
c000569c:	c7 85 3c ff ff ff c0 	movl   $0xc0009fc0,-0xc4(%ebp)
c00056a3:	9f 00 c0 
c00056a6:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c00056ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00056b4:	eb 49                	jmp    c00056ff <mkfs+0x51c>
c00056b6:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c00056ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00056bd:	8d 50 02             	lea    0x2(%eax),%edx
c00056c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00056c3:	89 10                	mov    %edx,(%eax)
c00056c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00056c8:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c00056cf:	83 ec 0c             	sub    $0xc,%esp
c00056d2:	50                   	push   %eax
c00056d3:	e8 10 4b 00 00       	call   c000a1e8 <Strlen>
c00056d8:	83 c4 10             	add    $0x10,%esp
c00056db:	89 c1                	mov    %eax,%ecx
c00056dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00056e0:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c00056e7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00056ea:	83 c2 04             	add    $0x4,%edx
c00056ed:	83 ec 04             	sub    $0x4,%esp
c00056f0:	51                   	push   %ecx
c00056f1:	50                   	push   %eax
c00056f2:	52                   	push   %edx
c00056f3:	e8 89 4a 00 00       	call   c000a181 <Memcpy>
c00056f8:	83 c4 10             	add    $0x10,%esp
c00056fb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00056ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005702:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0005705:	7c af                	jl     c00056b6 <mkfs+0x4d3>
c0005707:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000570e:	eb 66                	jmp    c0005776 <mkfs+0x593>
c0005710:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005713:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000571a:	83 ec 0c             	sub    $0xc,%esp
c000571d:	50                   	push   %eax
c000571e:	e8 c5 4a 00 00       	call   c000a1e8 <Strlen>
c0005723:	83 c4 10             	add    $0x10,%esp
c0005726:	85 c0                	test   %eax,%eax
c0005728:	74 47                	je     c0005771 <mkfs+0x58e>
c000572a:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c000572e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005731:	8d 50 05             	lea    0x5(%eax),%edx
c0005734:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005737:	89 10                	mov    %edx,(%eax)
c0005739:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000573c:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0005743:	83 ec 0c             	sub    $0xc,%esp
c0005746:	50                   	push   %eax
c0005747:	e8 9c 4a 00 00       	call   c000a1e8 <Strlen>
c000574c:	83 c4 10             	add    $0x10,%esp
c000574f:	89 c1                	mov    %eax,%ecx
c0005751:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005754:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000575b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000575e:	83 c2 04             	add    $0x4,%edx
c0005761:	83 ec 04             	sub    $0x4,%esp
c0005764:	51                   	push   %ecx
c0005765:	50                   	push   %eax
c0005766:	52                   	push   %edx
c0005767:	e8 15 4a 00 00       	call   c000a181 <Memcpy>
c000576c:	83 c4 10             	add    $0x10,%esp
c000576f:	eb 01                	jmp    c0005772 <mkfs+0x58f>
c0005771:	90                   	nop
c0005772:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0005776:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005779:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c000577c:	7c 92                	jl     c0005710 <mkfs+0x52d>
c000577e:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005784:	8b 45 98             	mov    -0x68(%ebp),%eax
c0005787:	83 ec 0c             	sub    $0xc,%esp
c000578a:	6a 0a                	push   $0xa
c000578c:	68 00 02 00 00       	push   $0x200
c0005791:	52                   	push   %edx
c0005792:	6a 20                	push   $0x20
c0005794:	50                   	push   %eax
c0005795:	e8 a5 f9 ff ff       	call   c000513f <rd_wt>
c000579a:	83 c4 20             	add    $0x20,%esp
c000579d:	90                   	nop
c000579e:	8b 7d fc             	mov    -0x4(%ebp),%edi
c00057a1:	c9                   	leave  
c00057a2:	c3                   	ret    

c00057a3 <init_fs>:
c00057a3:	55                   	push   %ebp
c00057a4:	89 e5                	mov    %esp,%ebp
c00057a6:	83 ec 78             	sub    $0x78,%esp
c00057a9:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c00057b0:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
c00057b7:	83 ec 04             	sub    $0x4,%esp
c00057ba:	6a 02                	push   $0x2
c00057bc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00057bf:	50                   	push   %eax
c00057c0:	6a 03                	push   $0x3
c00057c2:	e8 01 e8 ff ff       	call   c0003fc8 <send_rec>
c00057c7:	83 c4 10             	add    $0x10,%esp
c00057ca:	e8 14 fa ff ff       	call   c00051e3 <mkfs>
c00057cf:	90                   	nop
c00057d0:	c9                   	leave  
c00057d1:	c3                   	ret    

c00057d2 <do_open>:
c00057d2:	55                   	push   %ebp
c00057d3:	89 e5                	mov    %esp,%ebp
c00057d5:	56                   	push   %esi
c00057d6:	53                   	push   %ebx
c00057d7:	83 ec 60             	sub    $0x60,%esp
c00057da:	83 ec 04             	sub    $0x4,%esp
c00057dd:	6a 0c                	push   $0xc
c00057df:	6a 00                	push   $0x0
c00057e1:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00057e4:	50                   	push   %eax
c00057e5:	e8 c5 49 00 00       	call   c000a1af <Memset>
c00057ea:	83 c4 10             	add    $0x10,%esp
c00057ed:	8b 45 08             	mov    0x8(%ebp),%eax
c00057f0:	8b 40 30             	mov    0x30(%eax),%eax
c00057f3:	89 c6                	mov    %eax,%esi
c00057f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00057f8:	8b 40 34             	mov    0x34(%eax),%eax
c00057fb:	89 c2                	mov    %eax,%edx
c00057fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005800:	8b 00                	mov    (%eax),%eax
c0005802:	83 ec 08             	sub    $0x8,%esp
c0005805:	52                   	push   %edx
c0005806:	50                   	push   %eax
c0005807:	e8 c7 19 00 00       	call   c00071d3 <v2l>
c000580c:	83 c4 10             	add    $0x10,%esp
c000580f:	89 c3                	mov    %eax,%ebx
c0005811:	83 ec 08             	sub    $0x8,%esp
c0005814:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0005817:	50                   	push   %eax
c0005818:	6a 03                	push   $0x3
c000581a:	e8 b4 19 00 00       	call   c00071d3 <v2l>
c000581f:	83 c4 10             	add    $0x10,%esp
c0005822:	83 ec 04             	sub    $0x4,%esp
c0005825:	56                   	push   %esi
c0005826:	53                   	push   %ebx
c0005827:	50                   	push   %eax
c0005828:	e8 54 49 00 00       	call   c000a181 <Memcpy>
c000582d:	83 c4 10             	add    $0x10,%esp
c0005830:	8b 45 08             	mov    0x8(%ebp),%eax
c0005833:	8b 40 30             	mov    0x30(%eax),%eax
c0005836:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
c000583b:	8b 45 08             	mov    0x8(%ebp),%eax
c000583e:	8b 40 64             	mov    0x64(%eax),%eax
c0005841:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005844:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c000584b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005852:	eb 1f                	jmp    c0005873 <do_open+0xa1>
c0005854:	a1 c4 ea 00 c0       	mov    0xc000eac4,%eax
c0005859:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000585c:	83 c2 0c             	add    $0xc,%edx
c000585f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0005863:	85 c0                	test   %eax,%eax
c0005865:	75 08                	jne    c000586f <do_open+0x9d>
c0005867:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000586a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000586d:	eb 0a                	jmp    c0005879 <do_open+0xa7>
c000586f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005873:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0005877:	7e db                	jle    c0005854 <do_open+0x82>
c0005879:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c000587d:	75 1c                	jne    c000589b <do_open+0xc9>
c000587f:	68 d8 01 00 00       	push   $0x1d8
c0005884:	68 50 9f 00 c0       	push   $0xc0009f50
c0005889:	68 50 9f 00 c0       	push   $0xc0009f50
c000588e:	68 c9 9f 00 c0       	push   $0xc0009fc9
c0005893:	e8 b8 de ff ff       	call   c0003750 <assertion_failure>
c0005898:	83 c4 10             	add    $0x10,%esp
c000589b:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c00058a2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00058a9:	eb 1d                	jmp    c00058c8 <do_open+0xf6>
c00058ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00058ae:	c1 e0 04             	shl    $0x4,%eax
c00058b1:	05 c8 12 01 c0       	add    $0xc00112c8,%eax
c00058b6:	8b 00                	mov    (%eax),%eax
c00058b8:	85 c0                	test   %eax,%eax
c00058ba:	75 08                	jne    c00058c4 <do_open+0xf2>
c00058bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00058bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00058c2:	eb 0a                	jmp    c00058ce <do_open+0xfc>
c00058c4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00058c8:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c00058cc:	7e dd                	jle    c00058ab <do_open+0xd9>
c00058ce:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c00058d2:	75 1c                	jne    c00058f0 <do_open+0x11e>
c00058d4:	68 e4 01 00 00       	push   $0x1e4
c00058d9:	68 50 9f 00 c0       	push   $0xc0009f50
c00058de:	68 50 9f 00 c0       	push   $0xc0009f50
c00058e3:	68 d1 9f 00 c0       	push   $0xc0009fd1
c00058e8:	e8 63 de ff ff       	call   c0003750 <assertion_failure>
c00058ed:	83 c4 10             	add    $0x10,%esp
c00058f0:	83 ec 0c             	sub    $0xc,%esp
c00058f3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00058f6:	50                   	push   %eax
c00058f7:	e8 b7 00 00 00       	call   c00059b3 <search_file>
c00058fc:	83 c4 10             	add    $0x10,%esp
c00058ff:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005902:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
c0005906:	75 2b                	jne    c0005933 <do_open+0x161>
c0005908:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c000590c:	7e 10                	jle    c000591e <do_open+0x14c>
c000590e:	83 ec 0c             	sub    $0xc,%esp
c0005911:	68 d9 9f 00 c0       	push   $0xc0009fd9
c0005916:	e8 17 de ff ff       	call   c0003732 <panic>
c000591b:	83 c4 10             	add    $0x10,%esp
c000591e:	83 ec 08             	sub    $0x8,%esp
c0005921:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0005924:	50                   	push   %eax
c0005925:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0005928:	50                   	push   %eax
c0005929:	e8 43 04 00 00       	call   c0005d71 <create_file>
c000592e:	83 c4 10             	add    $0x10,%esp
c0005931:	eb 22                	jmp    c0005955 <do_open+0x183>
c0005933:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0005937:	75 07                	jne    c0005940 <do_open+0x16e>
c0005939:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000593e:	eb 6c                	jmp    c00059ac <do_open+0x1da>
c0005940:	83 ec 08             	sub    $0x8,%esp
c0005943:	ff 75 e0             	pushl  -0x20(%ebp)
c0005946:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0005949:	50                   	push   %eax
c000594a:	e8 60 02 00 00       	call   c0005baf <get_inode>
c000594f:	83 c4 10             	add    $0x10,%esp
c0005952:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005955:	a1 c4 ea 00 c0       	mov    0xc000eac4,%eax
c000595a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000595d:	c1 e2 04             	shl    $0x4,%edx
c0005960:	8d 8a c0 12 01 c0    	lea    -0x3ffeed40(%edx),%ecx
c0005966:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005969:	83 c2 0c             	add    $0xc,%edx
c000596c:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0005970:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0005973:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005976:	c1 e2 04             	shl    $0x4,%edx
c0005979:	81 c2 c8 12 01 c0    	add    $0xc00112c8,%edx
c000597f:	89 02                	mov    %eax,(%edx)
c0005981:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005984:	c1 e0 04             	shl    $0x4,%eax
c0005987:	05 c4 12 01 c0       	add    $0xc00112c4,%eax
c000598c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0005992:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005995:	c1 e0 04             	shl    $0x4,%eax
c0005998:	05 c0 12 01 c0       	add    $0xc00112c0,%eax
c000599d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00059a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00059a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00059a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00059ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00059af:	5b                   	pop    %ebx
c00059b0:	5e                   	pop    %esi
c00059b1:	5d                   	pop    %ebp
c00059b2:	c3                   	ret    

c00059b3 <search_file>:
c00059b3:	55                   	push   %ebp
c00059b4:	89 e5                	mov    %esp,%ebp
c00059b6:	83 ec 68             	sub    $0x68,%esp
c00059b9:	83 ec 04             	sub    $0x4,%esp
c00059bc:	6a 0c                	push   $0xc
c00059be:	6a 00                	push   $0x0
c00059c0:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00059c3:	50                   	push   %eax
c00059c4:	e8 e6 47 00 00       	call   c000a1af <Memset>
c00059c9:	83 c4 10             	add    $0x10,%esp
c00059cc:	83 ec 04             	sub    $0x4,%esp
c00059cf:	6a 28                	push   $0x28
c00059d1:	6a 00                	push   $0x0
c00059d3:	8d 45 98             	lea    -0x68(%ebp),%eax
c00059d6:	50                   	push   %eax
c00059d7:	e8 d3 47 00 00       	call   c000a1af <Memset>
c00059dc:	83 c4 10             	add    $0x10,%esp
c00059df:	83 ec 04             	sub    $0x4,%esp
c00059e2:	8d 45 98             	lea    -0x68(%ebp),%eax
c00059e5:	50                   	push   %eax
c00059e6:	ff 75 08             	pushl  0x8(%ebp)
c00059e9:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00059ec:	50                   	push   %eax
c00059ed:	e8 f1 00 00 00       	call   c0005ae3 <strip_path>
c00059f2:	83 c4 10             	add    $0x10,%esp
c00059f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00059f8:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c00059fc:	75 0a                	jne    c0005a08 <search_file+0x55>
c00059fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005a03:	e9 d9 00 00 00       	jmp    c0005ae1 <search_file+0x12e>
c0005a08:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0005a0b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005a0e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005a11:	05 00 02 00 00       	add    $0x200,%eax
c0005a16:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0005a1c:	85 c0                	test   %eax,%eax
c0005a1e:	0f 48 c2             	cmovs  %edx,%eax
c0005a21:	c1 f8 09             	sar    $0x9,%eax
c0005a24:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005a27:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0005a2a:	c1 e8 04             	shr    $0x4,%eax
c0005a2d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005a30:	e8 32 14 00 00       	call   c0006e67 <get_super_block>
c0005a35:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005a38:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005a3b:	8b 00                	mov    (%eax),%eax
c0005a3d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005a40:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0005a47:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005a4e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005a55:	eb 79                	jmp    c0005ad0 <search_file+0x11d>
c0005a57:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005a5c:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0005a5f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005a62:	01 ca                	add    %ecx,%edx
c0005a64:	83 ec 0c             	sub    $0xc,%esp
c0005a67:	6a 07                	push   $0x7
c0005a69:	68 00 02 00 00       	push   $0x200
c0005a6e:	50                   	push   %eax
c0005a6f:	ff 75 cc             	pushl  -0x34(%ebp)
c0005a72:	52                   	push   %edx
c0005a73:	e8 c7 f6 ff ff       	call   c000513f <rd_wt>
c0005a78:	83 c4 20             	add    $0x20,%esp
c0005a7b:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005a80:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005a83:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005a8a:	eb 35                	jmp    c0005ac1 <search_file+0x10e>
c0005a8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a93:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0005a96:	7f 33                	jg     c0005acb <search_file+0x118>
c0005a98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a9b:	83 c0 04             	add    $0x4,%eax
c0005a9e:	83 ec 08             	sub    $0x8,%esp
c0005aa1:	50                   	push   %eax
c0005aa2:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0005aa5:	50                   	push   %eax
c0005aa6:	e8 0c e8 ff ff       	call   c00042b7 <strcmp>
c0005aab:	83 c4 10             	add    $0x10,%esp
c0005aae:	85 c0                	test   %eax,%eax
c0005ab0:	75 07                	jne    c0005ab9 <search_file+0x106>
c0005ab2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005ab5:	8b 00                	mov    (%eax),%eax
c0005ab7:	eb 28                	jmp    c0005ae1 <search_file+0x12e>
c0005ab9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005abd:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0005ac1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005ac4:	83 f8 1f             	cmp    $0x1f,%eax
c0005ac7:	76 c3                	jbe    c0005a8c <search_file+0xd9>
c0005ac9:	eb 01                	jmp    c0005acc <search_file+0x119>
c0005acb:	90                   	nop
c0005acc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005ad0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ad3:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0005ad6:	0f 8c 7b ff ff ff    	jl     c0005a57 <search_file+0xa4>
c0005adc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005ae1:	c9                   	leave  
c0005ae2:	c3                   	ret    

c0005ae3 <strip_path>:
c0005ae3:	55                   	push   %ebp
c0005ae4:	89 e5                	mov    %esp,%ebp
c0005ae6:	83 ec 10             	sub    $0x10,%esp
c0005ae9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005aed:	75 0a                	jne    c0005af9 <strip_path+0x16>
c0005aef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005af4:	e9 b4 00 00 00       	jmp    c0005bad <strip_path+0xca>
c0005af9:	8b 45 08             	mov    0x8(%ebp),%eax
c0005afc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005aff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b02:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0005b05:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005b08:	0f b6 00             	movzbl (%eax),%eax
c0005b0b:	3c 2f                	cmp    $0x2f,%al
c0005b0d:	75 2d                	jne    c0005b3c <strip_path+0x59>
c0005b0f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0005b13:	eb 27                	jmp    c0005b3c <strip_path+0x59>
c0005b15:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005b18:	0f b6 00             	movzbl (%eax),%eax
c0005b1b:	3c 2f                	cmp    $0x2f,%al
c0005b1d:	75 0a                	jne    c0005b29 <strip_path+0x46>
c0005b1f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005b24:	e9 84 00 00 00       	jmp    c0005bad <strip_path+0xca>
c0005b29:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005b2c:	0f b6 10             	movzbl (%eax),%edx
c0005b2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005b32:	88 10                	mov    %dl,(%eax)
c0005b34:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0005b38:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0005b3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005b3f:	0f b6 00             	movzbl (%eax),%eax
c0005b42:	84 c0                	test   %al,%al
c0005b44:	75 cf                	jne    c0005b15 <strip_path+0x32>
c0005b46:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005b49:	c6 00 00             	movb   $0x0,(%eax)
c0005b4c:	8b 45 10             	mov    0x10(%ebp),%eax
c0005b4f:	8b 15 c0 20 01 c0    	mov    0xc00120c0,%edx
c0005b55:	89 10                	mov    %edx,(%eax)
c0005b57:	8b 15 c4 20 01 c0    	mov    0xc00120c4,%edx
c0005b5d:	89 50 04             	mov    %edx,0x4(%eax)
c0005b60:	8b 15 c8 20 01 c0    	mov    0xc00120c8,%edx
c0005b66:	89 50 08             	mov    %edx,0x8(%eax)
c0005b69:	8b 15 cc 20 01 c0    	mov    0xc00120cc,%edx
c0005b6f:	89 50 0c             	mov    %edx,0xc(%eax)
c0005b72:	8b 15 d0 20 01 c0    	mov    0xc00120d0,%edx
c0005b78:	89 50 10             	mov    %edx,0x10(%eax)
c0005b7b:	8b 15 d4 20 01 c0    	mov    0xc00120d4,%edx
c0005b81:	89 50 14             	mov    %edx,0x14(%eax)
c0005b84:	8b 15 d8 20 01 c0    	mov    0xc00120d8,%edx
c0005b8a:	89 50 18             	mov    %edx,0x18(%eax)
c0005b8d:	8b 15 dc 20 01 c0    	mov    0xc00120dc,%edx
c0005b93:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005b96:	8b 15 e0 20 01 c0    	mov    0xc00120e0,%edx
c0005b9c:	89 50 20             	mov    %edx,0x20(%eax)
c0005b9f:	8b 15 e4 20 01 c0    	mov    0xc00120e4,%edx
c0005ba5:	89 50 24             	mov    %edx,0x24(%eax)
c0005ba8:	b8 00 00 00 00       	mov    $0x0,%eax
c0005bad:	c9                   	leave  
c0005bae:	c3                   	ret    

c0005baf <get_inode>:
c0005baf:	55                   	push   %ebp
c0005bb0:	89 e5                	mov    %esp,%ebp
c0005bb2:	56                   	push   %esi
c0005bb3:	53                   	push   %ebx
c0005bb4:	83 ec 20             	sub    $0x20,%esp
c0005bb7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005bbb:	75 0a                	jne    c0005bc7 <get_inode+0x18>
c0005bbd:	b8 00 00 00 00       	mov    $0x0,%eax
c0005bc2:	e9 a3 01 00 00       	jmp    c0005d6a <get_inode+0x1bb>
c0005bc7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005bce:	c7 45 f0 c0 16 01 c0 	movl   $0xc00116c0,-0x10(%ebp)
c0005bd5:	eb 69                	jmp    c0005c40 <get_inode+0x91>
c0005bd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005bda:	8b 40 24             	mov    0x24(%eax),%eax
c0005bdd:	85 c0                	test   %eax,%eax
c0005bdf:	7e 53                	jle    c0005c34 <get_inode+0x85>
c0005be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005be4:	8b 40 10             	mov    0x10(%eax),%eax
c0005be7:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0005bea:	75 50                	jne    c0005c3c <get_inode+0x8d>
c0005bec:	8b 45 08             	mov    0x8(%ebp),%eax
c0005bef:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005bf2:	8b 0a                	mov    (%edx),%ecx
c0005bf4:	89 08                	mov    %ecx,(%eax)
c0005bf6:	8b 4a 04             	mov    0x4(%edx),%ecx
c0005bf9:	89 48 04             	mov    %ecx,0x4(%eax)
c0005bfc:	8b 4a 08             	mov    0x8(%edx),%ecx
c0005bff:	89 48 08             	mov    %ecx,0x8(%eax)
c0005c02:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0005c05:	89 48 0c             	mov    %ecx,0xc(%eax)
c0005c08:	8b 4a 10             	mov    0x10(%edx),%ecx
c0005c0b:	89 48 10             	mov    %ecx,0x10(%eax)
c0005c0e:	8b 4a 14             	mov    0x14(%edx),%ecx
c0005c11:	89 48 14             	mov    %ecx,0x14(%eax)
c0005c14:	8b 4a 18             	mov    0x18(%edx),%ecx
c0005c17:	89 48 18             	mov    %ecx,0x18(%eax)
c0005c1a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0005c1d:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0005c20:	8b 4a 20             	mov    0x20(%edx),%ecx
c0005c23:	89 48 20             	mov    %ecx,0x20(%eax)
c0005c26:	8b 52 24             	mov    0x24(%edx),%edx
c0005c29:	89 50 24             	mov    %edx,0x24(%eax)
c0005c2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c2f:	e9 36 01 00 00       	jmp    c0005d6a <get_inode+0x1bb>
c0005c34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005c3a:	eb 0d                	jmp    c0005c49 <get_inode+0x9a>
c0005c3c:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0005c40:	81 7d f0 c0 20 01 c0 	cmpl   $0xc00120c0,-0x10(%ebp)
c0005c47:	76 8e                	jbe    c0005bd7 <get_inode+0x28>
c0005c49:	e8 19 12 00 00       	call   c0006e67 <get_super_block>
c0005c4e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005c51:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0005c58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005c5b:	8b 40 04             	mov    0x4(%eax),%eax
c0005c5e:	8d 50 02             	lea    0x2(%eax),%edx
c0005c61:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005c64:	8b 40 08             	mov    0x8(%eax),%eax
c0005c67:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0005c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005c6d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0005c70:	b8 00 02 00 00       	mov    $0x200,%eax
c0005c75:	99                   	cltd   
c0005c76:	f7 7d e8             	idivl  -0x18(%ebp)
c0005c79:	89 c6                	mov    %eax,%esi
c0005c7b:	89 c8                	mov    %ecx,%eax
c0005c7d:	99                   	cltd   
c0005c7e:	f7 fe                	idiv   %esi
c0005c80:	01 d8                	add    %ebx,%eax
c0005c82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005c85:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c0005c8c:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005c91:	83 ec 0c             	sub    $0xc,%esp
c0005c94:	6a 07                	push   $0x7
c0005c96:	68 00 02 00 00       	push   $0x200
c0005c9b:	50                   	push   %eax
c0005c9c:	ff 75 e0             	pushl  -0x20(%ebp)
c0005c9f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0005ca2:	e8 98 f4 ff ff       	call   c000513f <rd_wt>
c0005ca7:	83 c4 20             	add    $0x20,%esp
c0005caa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005cad:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0005cb0:	b8 00 02 00 00       	mov    $0x200,%eax
c0005cb5:	99                   	cltd   
c0005cb6:	f7 7d e8             	idivl  -0x18(%ebp)
c0005cb9:	89 c3                	mov    %eax,%ebx
c0005cbb:	89 c8                	mov    %ecx,%eax
c0005cbd:	99                   	cltd   
c0005cbe:	f7 fb                	idiv   %ebx
c0005cc0:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0005cc3:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005cc9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005ccc:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0005cd0:	01 d0                	add    %edx,%eax
c0005cd2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cd8:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0005cdb:	8b 0a                	mov    (%edx),%ecx
c0005cdd:	89 08                	mov    %ecx,(%eax)
c0005cdf:	8b 4a 04             	mov    0x4(%edx),%ecx
c0005ce2:	89 48 04             	mov    %ecx,0x4(%eax)
c0005ce5:	8b 4a 08             	mov    0x8(%edx),%ecx
c0005ce8:	89 48 08             	mov    %ecx,0x8(%eax)
c0005ceb:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0005cee:	89 48 0c             	mov    %ecx,0xc(%eax)
c0005cf1:	8b 4a 10             	mov    0x10(%edx),%ecx
c0005cf4:	89 48 10             	mov    %ecx,0x10(%eax)
c0005cf7:	8b 4a 14             	mov    0x14(%edx),%ecx
c0005cfa:	89 48 14             	mov    %ecx,0x14(%eax)
c0005cfd:	8b 4a 18             	mov    0x18(%edx),%ecx
c0005d00:	89 48 18             	mov    %ecx,0x18(%eax)
c0005d03:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0005d06:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0005d09:	8b 4a 20             	mov    0x20(%edx),%ecx
c0005d0c:	89 48 20             	mov    %ecx,0x20(%eax)
c0005d0f:	8b 52 24             	mov    0x24(%edx),%edx
c0005d12:	89 50 24             	mov    %edx,0x24(%eax)
c0005d15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d18:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005d1b:	89 50 10             	mov    %edx,0x10(%eax)
c0005d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d21:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005d24:	89 50 20             	mov    %edx,0x20(%eax)
c0005d27:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d2a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005d2d:	8b 0a                	mov    (%edx),%ecx
c0005d2f:	89 08                	mov    %ecx,(%eax)
c0005d31:	8b 4a 04             	mov    0x4(%edx),%ecx
c0005d34:	89 48 04             	mov    %ecx,0x4(%eax)
c0005d37:	8b 4a 08             	mov    0x8(%edx),%ecx
c0005d3a:	89 48 08             	mov    %ecx,0x8(%eax)
c0005d3d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0005d40:	89 48 0c             	mov    %ecx,0xc(%eax)
c0005d43:	8b 4a 10             	mov    0x10(%edx),%ecx
c0005d46:	89 48 10             	mov    %ecx,0x10(%eax)
c0005d49:	8b 4a 14             	mov    0x14(%edx),%ecx
c0005d4c:	89 48 14             	mov    %ecx,0x14(%eax)
c0005d4f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0005d52:	89 48 18             	mov    %ecx,0x18(%eax)
c0005d55:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0005d58:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0005d5b:	8b 4a 20             	mov    0x20(%edx),%ecx
c0005d5e:	89 48 20             	mov    %ecx,0x20(%eax)
c0005d61:	8b 52 24             	mov    0x24(%edx),%edx
c0005d64:	89 50 24             	mov    %edx,0x24(%eax)
c0005d67:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0005d6d:	5b                   	pop    %ebx
c0005d6e:	5e                   	pop    %esi
c0005d6f:	5d                   	pop    %ebp
c0005d70:	c3                   	ret    

c0005d71 <create_file>:
c0005d71:	55                   	push   %ebp
c0005d72:	89 e5                	mov    %esp,%ebp
c0005d74:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0005d7a:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0005d7d:	50                   	push   %eax
c0005d7e:	ff 75 0c             	pushl  0xc(%ebp)
c0005d81:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0005d84:	50                   	push   %eax
c0005d85:	e8 59 fd ff ff       	call   c0005ae3 <strip_path>
c0005d8a:	83 c4 0c             	add    $0xc,%esp
c0005d8d:	83 f8 ff             	cmp    $0xffffffff,%eax
c0005d90:	75 0a                	jne    c0005d9c <create_file+0x2b>
c0005d92:	b8 00 00 00 00       	mov    $0x0,%eax
c0005d97:	e9 de 00 00 00       	jmp    c0005e7a <create_file+0x109>
c0005d9c:	e8 db 00 00 00       	call   c0005e7c <alloc_imap_bit>
c0005da1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005da4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005da8:	75 0a                	jne    c0005db4 <create_file+0x43>
c0005daa:	b8 00 00 00 00       	mov    $0x0,%eax
c0005daf:	e9 c6 00 00 00       	jmp    c0005e7a <create_file+0x109>
c0005db4:	e8 ae 10 00 00       	call   c0006e67 <get_super_block>
c0005db9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005dbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dbf:	8b 40 10             	mov    0x10(%eax),%eax
c0005dc2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005dc5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005dc8:	83 ec 08             	sub    $0x8,%esp
c0005dcb:	50                   	push   %eax
c0005dcc:	ff 75 f4             	pushl  -0xc(%ebp)
c0005dcf:	e8 a5 01 00 00       	call   c0005f79 <alloc_smap_bit>
c0005dd4:	83 c4 10             	add    $0x10,%esp
c0005dd7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005dda:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0005dde:	75 0a                	jne    c0005dea <create_file+0x79>
c0005de0:	b8 00 00 00 00       	mov    $0x0,%eax
c0005de5:	e9 90 00 00 00       	jmp    c0005e7a <create_file+0x109>
c0005dea:	83 ec 04             	sub    $0x4,%esp
c0005ded:	ff 75 e8             	pushl  -0x18(%ebp)
c0005df0:	ff 75 f4             	pushl  -0xc(%ebp)
c0005df3:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0005df6:	50                   	push   %eax
c0005df7:	e8 1e 03 00 00       	call   c000611a <new_inode>
c0005dfc:	83 c4 10             	add    $0x10,%esp
c0005dff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005e02:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0005e06:	75 07                	jne    c0005e0f <create_file+0x9e>
c0005e08:	b8 00 00 00 00       	mov    $0x0,%eax
c0005e0d:	eb 6b                	jmp    c0005e7a <create_file+0x109>
c0005e0f:	ff 75 f4             	pushl  -0xc(%ebp)
c0005e12:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0005e15:	50                   	push   %eax
c0005e16:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0005e19:	50                   	push   %eax
c0005e1a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0005e20:	50                   	push   %eax
c0005e21:	e8 12 04 00 00       	call   c0006238 <new_dir_entry>
c0005e26:	83 c4 10             	add    $0x10,%esp
c0005e29:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005e2c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0005e30:	75 07                	jne    c0005e39 <create_file+0xc8>
c0005e32:	b8 00 00 00 00       	mov    $0x0,%eax
c0005e37:	eb 41                	jmp    c0005e7a <create_file+0x109>
c0005e39:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e3c:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0005e3f:	89 10                	mov    %edx,(%eax)
c0005e41:	8b 55 88             	mov    -0x78(%ebp),%edx
c0005e44:	89 50 04             	mov    %edx,0x4(%eax)
c0005e47:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0005e4a:	89 50 08             	mov    %edx,0x8(%eax)
c0005e4d:	8b 55 90             	mov    -0x70(%ebp),%edx
c0005e50:	89 50 0c             	mov    %edx,0xc(%eax)
c0005e53:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0005e56:	89 50 10             	mov    %edx,0x10(%eax)
c0005e59:	8b 55 98             	mov    -0x68(%ebp),%edx
c0005e5c:	89 50 14             	mov    %edx,0x14(%eax)
c0005e5f:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0005e62:	89 50 18             	mov    %edx,0x18(%eax)
c0005e65:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0005e68:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005e6b:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0005e6e:	89 50 20             	mov    %edx,0x20(%eax)
c0005e71:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0005e74:	89 50 24             	mov    %edx,0x24(%eax)
c0005e77:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e7a:	c9                   	leave  
c0005e7b:	c3                   	ret    

c0005e7c <alloc_imap_bit>:
c0005e7c:	55                   	push   %ebp
c0005e7d:	89 e5                	mov    %esp,%ebp
c0005e7f:	53                   	push   %ebx
c0005e80:	83 ec 24             	sub    $0x24,%esp
c0005e83:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0005e8a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0005e91:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005e96:	83 ec 0c             	sub    $0xc,%esp
c0005e99:	6a 07                	push   $0x7
c0005e9b:	68 00 02 00 00       	push   $0x200
c0005ea0:	50                   	push   %eax
c0005ea1:	ff 75 e8             	pushl  -0x18(%ebp)
c0005ea4:	ff 75 ec             	pushl  -0x14(%ebp)
c0005ea7:	e8 93 f2 ff ff       	call   c000513f <rd_wt>
c0005eac:	83 c4 20             	add    $0x20,%esp
c0005eaf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005eb6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005ebd:	e9 a5 00 00 00       	jmp    c0005f67 <alloc_imap_bit+0xeb>
c0005ec2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005ec9:	e9 8b 00 00 00       	jmp    c0005f59 <alloc_imap_bit+0xdd>
c0005ece:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005ed4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ed7:	01 d0                	add    %edx,%eax
c0005ed9:	0f b6 00             	movzbl (%eax),%eax
c0005edc:	0f be d0             	movsbl %al,%edx
c0005edf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ee2:	89 c1                	mov    %eax,%ecx
c0005ee4:	d3 fa                	sar    %cl,%edx
c0005ee6:	89 d0                	mov    %edx,%eax
c0005ee8:	83 e0 01             	and    $0x1,%eax
c0005eeb:	85 c0                	test   %eax,%eax
c0005eed:	74 06                	je     c0005ef5 <alloc_imap_bit+0x79>
c0005eef:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005ef3:	eb 64                	jmp    c0005f59 <alloc_imap_bit+0xdd>
c0005ef5:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005efb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005efe:	01 d0                	add    %edx,%eax
c0005f00:	0f b6 18             	movzbl (%eax),%ebx
c0005f03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f06:	ba 01 00 00 00       	mov    $0x1,%edx
c0005f0b:	89 c1                	mov    %eax,%ecx
c0005f0d:	d3 e2                	shl    %cl,%edx
c0005f0f:	89 d0                	mov    %edx,%eax
c0005f11:	89 c1                	mov    %eax,%ecx
c0005f13:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005f19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f1c:	01 d0                	add    %edx,%eax
c0005f1e:	09 cb                	or     %ecx,%ebx
c0005f20:	89 da                	mov    %ebx,%edx
c0005f22:	88 10                	mov    %dl,(%eax)
c0005f24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f27:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0005f2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f31:	01 d0                	add    %edx,%eax
c0005f33:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005f36:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005f3b:	83 ec 0c             	sub    $0xc,%esp
c0005f3e:	6a 0a                	push   $0xa
c0005f40:	68 00 02 00 00       	push   $0x200
c0005f45:	50                   	push   %eax
c0005f46:	ff 75 e8             	pushl  -0x18(%ebp)
c0005f49:	ff 75 ec             	pushl  -0x14(%ebp)
c0005f4c:	e8 ee f1 ff ff       	call   c000513f <rd_wt>
c0005f51:	83 c4 20             	add    $0x20,%esp
c0005f54:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005f57:	eb 1b                	jmp    c0005f74 <alloc_imap_bit+0xf8>
c0005f59:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0005f5d:	0f 8e 6b ff ff ff    	jle    c0005ece <alloc_imap_bit+0x52>
c0005f63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005f67:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0005f6e:	0f 8e 4e ff ff ff    	jle    c0005ec2 <alloc_imap_bit+0x46>
c0005f74:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005f77:	c9                   	leave  
c0005f78:	c3                   	ret    

c0005f79 <alloc_smap_bit>:
c0005f79:	55                   	push   %ebp
c0005f7a:	89 e5                	mov    %esp,%ebp
c0005f7c:	53                   	push   %ebx
c0005f7d:	83 ec 34             	sub    $0x34,%esp
c0005f80:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005f84:	75 1c                	jne    c0005fa2 <alloc_smap_bit+0x29>
c0005f86:	68 0e 03 00 00       	push   $0x30e
c0005f8b:	68 50 9f 00 c0       	push   $0xc0009f50
c0005f90:	68 50 9f 00 c0       	push   $0xc0009f50
c0005f95:	68 e6 9f 00 c0       	push   $0xc0009fe6
c0005f9a:	e8 b1 d7 ff ff       	call   c0003750 <assertion_failure>
c0005f9f:	83 c4 10             	add    $0x10,%esp
c0005fa2:	e8 c0 0e 00 00       	call   c0006e67 <get_super_block>
c0005fa7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005faa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005fad:	8b 40 08             	mov    0x8(%eax),%eax
c0005fb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005fb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005fb6:	8b 40 04             	mov    0x4(%eax),%eax
c0005fb9:	83 c0 02             	add    $0x2,%eax
c0005fbc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005fbf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005fc6:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0005fcd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005fd4:	e9 20 01 00 00       	jmp    c00060f9 <alloc_smap_bit+0x180>
c0005fd9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0005fdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fdf:	01 d0                	add    %edx,%eax
c0005fe1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005fe4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005fe9:	83 ec 0c             	sub    $0xc,%esp
c0005fec:	6a 07                	push   $0x7
c0005fee:	68 00 02 00 00       	push   $0x200
c0005ff3:	50                   	push   %eax
c0005ff4:	ff 75 d8             	pushl  -0x28(%ebp)
c0005ff7:	ff 75 d4             	pushl  -0x2c(%ebp)
c0005ffa:	e8 40 f1 ff ff       	call   c000513f <rd_wt>
c0005fff:	83 c4 20             	add    $0x20,%esp
c0006002:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006009:	e9 b0 00 00 00       	jmp    c00060be <alloc_smap_bit+0x145>
c000600e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006015:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006019:	0f 85 8c 00 00 00    	jne    c00060ab <alloc_smap_bit+0x132>
c000601f:	eb 45                	jmp    c0006066 <alloc_smap_bit+0xed>
c0006021:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006027:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000602a:	01 d0                	add    %edx,%eax
c000602c:	0f b6 00             	movzbl (%eax),%eax
c000602f:	0f be d0             	movsbl %al,%edx
c0006032:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006035:	89 c1                	mov    %eax,%ecx
c0006037:	d3 fa                	sar    %cl,%edx
c0006039:	89 d0                	mov    %edx,%eax
c000603b:	83 e0 01             	and    $0x1,%eax
c000603e:	85 c0                	test   %eax,%eax
c0006040:	74 06                	je     c0006048 <alloc_smap_bit+0xcf>
c0006042:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006046:	eb 1e                	jmp    c0006066 <alloc_smap_bit+0xed>
c0006048:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000604b:	c1 e0 09             	shl    $0x9,%eax
c000604e:	89 c2                	mov    %eax,%edx
c0006050:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006053:	01 d0                	add    %edx,%eax
c0006055:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000605c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000605f:	01 d0                	add    %edx,%eax
c0006061:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006064:	eb 06                	jmp    c000606c <alloc_smap_bit+0xf3>
c0006066:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000606a:	7e b5                	jle    c0006021 <alloc_smap_bit+0xa8>
c000606c:	eb 3d                	jmp    c00060ab <alloc_smap_bit+0x132>
c000606e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006072:	74 45                	je     c00060b9 <alloc_smap_bit+0x140>
c0006074:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000607a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000607d:	01 d0                	add    %edx,%eax
c000607f:	0f b6 18             	movzbl (%eax),%ebx
c0006082:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006085:	ba 01 00 00 00       	mov    $0x1,%edx
c000608a:	89 c1                	mov    %eax,%ecx
c000608c:	d3 e2                	shl    %cl,%edx
c000608e:	89 d0                	mov    %edx,%eax
c0006090:	89 c1                	mov    %eax,%ecx
c0006092:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006098:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000609b:	01 d0                	add    %edx,%eax
c000609d:	09 cb                	or     %ecx,%ebx
c000609f:	89 da                	mov    %ebx,%edx
c00060a1:	88 10                	mov    %dl,(%eax)
c00060a3:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00060a7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00060ab:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00060af:	74 09                	je     c00060ba <alloc_smap_bit+0x141>
c00060b1:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00060b5:	7e b7                	jle    c000606e <alloc_smap_bit+0xf5>
c00060b7:	eb 01                	jmp    c00060ba <alloc_smap_bit+0x141>
c00060b9:	90                   	nop
c00060ba:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00060be:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c00060c5:	0f 8e 43 ff ff ff    	jle    c000600e <alloc_smap_bit+0x95>
c00060cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00060cf:	74 1e                	je     c00060ef <alloc_smap_bit+0x176>
c00060d1:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00060d6:	83 ec 0c             	sub    $0xc,%esp
c00060d9:	6a 0a                	push   $0xa
c00060db:	68 00 02 00 00       	push   $0x200
c00060e0:	50                   	push   %eax
c00060e1:	ff 75 d8             	pushl  -0x28(%ebp)
c00060e4:	ff 75 d4             	pushl  -0x2c(%ebp)
c00060e7:	e8 53 f0 ff ff       	call   c000513f <rd_wt>
c00060ec:	83 c4 20             	add    $0x20,%esp
c00060ef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00060f3:	74 12                	je     c0006107 <alloc_smap_bit+0x18e>
c00060f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00060f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060fc:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c00060ff:	0f 8c d4 fe ff ff    	jl     c0005fd9 <alloc_smap_bit+0x60>
c0006105:	eb 01                	jmp    c0006108 <alloc_smap_bit+0x18f>
c0006107:	90                   	nop
c0006108:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000610b:	8d 50 ff             	lea    -0x1(%eax),%edx
c000610e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006111:	8b 00                	mov    (%eax),%eax
c0006113:	01 d0                	add    %edx,%eax
c0006115:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0006118:	c9                   	leave  
c0006119:	c3                   	ret    

c000611a <new_inode>:
c000611a:	55                   	push   %ebp
c000611b:	89 e5                	mov    %esp,%ebp
c000611d:	83 ec 38             	sub    $0x38,%esp
c0006120:	83 ec 08             	sub    $0x8,%esp
c0006123:	ff 75 0c             	pushl  0xc(%ebp)
c0006126:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0006129:	50                   	push   %eax
c000612a:	e8 80 fa ff ff       	call   c0005baf <get_inode>
c000612f:	83 c4 10             	add    $0x10,%esp
c0006132:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006135:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006139:	75 0a                	jne    c0006145 <new_inode+0x2b>
c000613b:	b8 00 00 00 00       	mov    $0x0,%eax
c0006140:	e9 f1 00 00 00       	jmp    c0006236 <new_inode+0x11c>
c0006145:	8b 45 10             	mov    0x10(%ebp),%eax
c0006148:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000614b:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0006152:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006159:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0006160:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006163:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006166:	83 ec 0c             	sub    $0xc,%esp
c0006169:	8d 45 c8             	lea    -0x38(%ebp),%eax
c000616c:	50                   	push   %eax
c000616d:	e8 11 0b 00 00       	call   c0006c83 <sync_inode>
c0006172:	83 c4 10             	add    $0x10,%esp
c0006175:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000617c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006183:	eb 1d                	jmp    c00061a2 <new_inode+0x88>
c0006185:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006188:	89 d0                	mov    %edx,%eax
c000618a:	c1 e0 02             	shl    $0x2,%eax
c000618d:	01 d0                	add    %edx,%eax
c000618f:	c1 e0 03             	shl    $0x3,%eax
c0006192:	05 d0 16 01 c0       	add    $0xc00116d0,%eax
c0006197:	8b 00                	mov    (%eax),%eax
c0006199:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000619c:	74 0c                	je     c00061aa <new_inode+0x90>
c000619e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00061a2:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00061a6:	7e dd                	jle    c0006185 <new_inode+0x6b>
c00061a8:	eb 01                	jmp    c00061ab <new_inode+0x91>
c00061aa:	90                   	nop
c00061ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00061ae:	89 d0                	mov    %edx,%eax
c00061b0:	c1 e0 02             	shl    $0x2,%eax
c00061b3:	01 d0                	add    %edx,%eax
c00061b5:	c1 e0 03             	shl    $0x3,%eax
c00061b8:	05 c0 16 01 c0       	add    $0xc00116c0,%eax
c00061bd:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00061c0:	89 10                	mov    %edx,(%eax)
c00061c2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00061c5:	89 50 04             	mov    %edx,0x4(%eax)
c00061c8:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00061cb:	89 50 08             	mov    %edx,0x8(%eax)
c00061ce:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00061d1:	89 50 0c             	mov    %edx,0xc(%eax)
c00061d4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00061d7:	89 50 10             	mov    %edx,0x10(%eax)
c00061da:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00061dd:	89 50 14             	mov    %edx,0x14(%eax)
c00061e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00061e3:	89 50 18             	mov    %edx,0x18(%eax)
c00061e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00061e9:	89 50 1c             	mov    %edx,0x1c(%eax)
c00061ec:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00061ef:	89 50 20             	mov    %edx,0x20(%eax)
c00061f2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00061f5:	89 50 24             	mov    %edx,0x24(%eax)
c00061f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00061fb:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00061fe:	89 10                	mov    %edx,(%eax)
c0006200:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0006203:	89 50 04             	mov    %edx,0x4(%eax)
c0006206:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0006209:	89 50 08             	mov    %edx,0x8(%eax)
c000620c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c000620f:	89 50 0c             	mov    %edx,0xc(%eax)
c0006212:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006215:	89 50 10             	mov    %edx,0x10(%eax)
c0006218:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000621b:	89 50 14             	mov    %edx,0x14(%eax)
c000621e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006221:	89 50 18             	mov    %edx,0x18(%eax)
c0006224:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006227:	89 50 1c             	mov    %edx,0x1c(%eax)
c000622a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000622d:	89 50 20             	mov    %edx,0x20(%eax)
c0006230:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006233:	89 50 24             	mov    %edx,0x24(%eax)
c0006236:	c9                   	leave  
c0006237:	c3                   	ret    

c0006238 <new_dir_entry>:
c0006238:	55                   	push   %ebp
c0006239:	89 e5                	mov    %esp,%ebp
c000623b:	83 ec 48             	sub    $0x48,%esp
c000623e:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0006245:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006248:	8b 40 04             	mov    0x4(%eax),%eax
c000624b:	99                   	cltd   
c000624c:	f7 7d dc             	idivl  -0x24(%ebp)
c000624f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006252:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006255:	8b 40 0c             	mov    0xc(%eax),%eax
c0006258:	99                   	cltd   
c0006259:	f7 7d dc             	idivl  -0x24(%ebp)
c000625c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000625f:	e8 03 0c 00 00       	call   c0006e67 <get_super_block>
c0006264:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006267:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000626a:	8b 00                	mov    (%eax),%eax
c000626c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000626f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006272:	8b 40 0c             	mov    0xc(%eax),%eax
c0006275:	05 00 02 00 00       	add    $0x200,%eax
c000627a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0006280:	85 c0                	test   %eax,%eax
c0006282:	0f 48 c2             	cmovs  %edx,%eax
c0006285:	c1 f8 09             	sar    $0x9,%eax
c0006288:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000628b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006292:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006299:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c00062a0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00062a7:	eb 7d                	jmp    c0006326 <new_dir_entry+0xee>
c00062a9:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00062ae:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c00062b1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00062b4:	01 ca                	add    %ecx,%edx
c00062b6:	83 ec 0c             	sub    $0xc,%esp
c00062b9:	6a 07                	push   $0x7
c00062bb:	68 00 02 00 00       	push   $0x200
c00062c0:	50                   	push   %eax
c00062c1:	ff 75 c4             	pushl  -0x3c(%ebp)
c00062c4:	52                   	push   %edx
c00062c5:	e8 75 ee ff ff       	call   c000513f <rd_wt>
c00062ca:	83 c4 20             	add    $0x20,%esp
c00062cd:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00062d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00062d5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00062dc:	eb 25                	jmp    c0006303 <new_dir_entry+0xcb>
c00062de:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00062e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00062e5:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00062e8:	7f 29                	jg     c0006313 <new_dir_entry+0xdb>
c00062ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062ed:	8b 00                	mov    (%eax),%eax
c00062ef:	85 c0                	test   %eax,%eax
c00062f1:	75 08                	jne    c00062fb <new_dir_entry+0xc3>
c00062f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00062f9:	eb 19                	jmp    c0006314 <new_dir_entry+0xdc>
c00062fb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00062ff:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0006303:	b8 00 02 00 00       	mov    $0x200,%eax
c0006308:	99                   	cltd   
c0006309:	f7 7d dc             	idivl  -0x24(%ebp)
c000630c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c000630f:	7c cd                	jl     c00062de <new_dir_entry+0xa6>
c0006311:	eb 01                	jmp    c0006314 <new_dir_entry+0xdc>
c0006313:	90                   	nop
c0006314:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006317:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c000631a:	7f 16                	jg     c0006332 <new_dir_entry+0xfa>
c000631c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006320:	75 10                	jne    c0006332 <new_dir_entry+0xfa>
c0006322:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006326:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006329:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c000632c:	0f 8c 77 ff ff ff    	jl     c00062a9 <new_dir_entry+0x71>
c0006332:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006335:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0006338:	75 0a                	jne    c0006344 <new_dir_entry+0x10c>
c000633a:	b8 00 00 00 00       	mov    $0x0,%eax
c000633f:	e9 fa 00 00 00       	jmp    c000643e <new_dir_entry+0x206>
c0006344:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000634b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000634f:	75 1e                	jne    c000636f <new_dir_entry+0x137>
c0006351:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006354:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006357:	8b 45 0c             	mov    0xc(%ebp),%eax
c000635a:	8b 50 04             	mov    0x4(%eax),%edx
c000635d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006360:	01 c2                	add    %eax,%edx
c0006362:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006365:	89 50 04             	mov    %edx,0x4(%eax)
c0006368:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c000636f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006372:	8b 55 14             	mov    0x14(%ebp),%edx
c0006375:	89 10                	mov    %edx,(%eax)
c0006377:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000637a:	83 c0 04             	add    $0x4,%eax
c000637d:	83 ec 08             	sub    $0x8,%esp
c0006380:	ff 75 10             	pushl  0x10(%ebp)
c0006383:	50                   	push   %eax
c0006384:	e8 45 3e 00 00       	call   c000a1ce <Strcpy>
c0006389:	83 c4 10             	add    $0x10,%esp
c000638c:	8b 45 08             	mov    0x8(%ebp),%eax
c000638f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006392:	8b 0a                	mov    (%edx),%ecx
c0006394:	89 08                	mov    %ecx,(%eax)
c0006396:	8b 4a 04             	mov    0x4(%edx),%ecx
c0006399:	89 48 04             	mov    %ecx,0x4(%eax)
c000639c:	8b 4a 08             	mov    0x8(%edx),%ecx
c000639f:	89 48 08             	mov    %ecx,0x8(%eax)
c00063a2:	8b 52 0c             	mov    0xc(%edx),%edx
c00063a5:	89 50 0c             	mov    %edx,0xc(%eax)
c00063a8:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00063ad:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c00063b0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00063b3:	01 ca                	add    %ecx,%edx
c00063b5:	83 ec 0c             	sub    $0xc,%esp
c00063b8:	6a 0a                	push   $0xa
c00063ba:	68 00 02 00 00       	push   $0x200
c00063bf:	50                   	push   %eax
c00063c0:	ff 75 c4             	pushl  -0x3c(%ebp)
c00063c3:	52                   	push   %edx
c00063c4:	e8 76 ed ff ff       	call   c000513f <rd_wt>
c00063c9:	83 c4 20             	add    $0x20,%esp
c00063cc:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00063d0:	74 69                	je     c000643b <new_dir_entry+0x203>
c00063d2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00063d5:	8b 10                	mov    (%eax),%edx
c00063d7:	89 15 c0 20 01 c0    	mov    %edx,0xc00120c0
c00063dd:	8b 50 04             	mov    0x4(%eax),%edx
c00063e0:	89 15 c4 20 01 c0    	mov    %edx,0xc00120c4
c00063e6:	8b 50 08             	mov    0x8(%eax),%edx
c00063e9:	89 15 c8 20 01 c0    	mov    %edx,0xc00120c8
c00063ef:	8b 50 0c             	mov    0xc(%eax),%edx
c00063f2:	89 15 cc 20 01 c0    	mov    %edx,0xc00120cc
c00063f8:	8b 50 10             	mov    0x10(%eax),%edx
c00063fb:	89 15 d0 20 01 c0    	mov    %edx,0xc00120d0
c0006401:	8b 50 14             	mov    0x14(%eax),%edx
c0006404:	89 15 d4 20 01 c0    	mov    %edx,0xc00120d4
c000640a:	8b 50 18             	mov    0x18(%eax),%edx
c000640d:	89 15 d8 20 01 c0    	mov    %edx,0xc00120d8
c0006413:	8b 50 1c             	mov    0x1c(%eax),%edx
c0006416:	89 15 dc 20 01 c0    	mov    %edx,0xc00120dc
c000641c:	8b 50 20             	mov    0x20(%eax),%edx
c000641f:	89 15 e0 20 01 c0    	mov    %edx,0xc00120e0
c0006425:	8b 40 24             	mov    0x24(%eax),%eax
c0006428:	a3 e4 20 01 c0       	mov    %eax,0xc00120e4
c000642d:	83 ec 0c             	sub    $0xc,%esp
c0006430:	ff 75 0c             	pushl  0xc(%ebp)
c0006433:	e8 4b 08 00 00       	call   c0006c83 <sync_inode>
c0006438:	83 c4 10             	add    $0x10,%esp
c000643b:	8b 45 08             	mov    0x8(%ebp),%eax
c000643e:	c9                   	leave  
c000643f:	c3                   	ret    

c0006440 <do_unlink>:
c0006440:	55                   	push   %ebp
c0006441:	89 e5                	mov    %esp,%ebp
c0006443:	53                   	push   %ebx
c0006444:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c000644a:	83 ec 08             	sub    $0x8,%esp
c000644d:	ff 75 08             	pushl  0x8(%ebp)
c0006450:	68 fb 9f 00 c0       	push   $0xc0009ffb
c0006455:	e8 5d de ff ff       	call   c00042b7 <strcmp>
c000645a:	83 c4 10             	add    $0x10,%esp
c000645d:	85 c0                	test   %eax,%eax
c000645f:	75 10                	jne    c0006471 <do_unlink+0x31>
c0006461:	83 ec 0c             	sub    $0xc,%esp
c0006464:	68 fd 9f 00 c0       	push   $0xc0009ffd
c0006469:	e8 c4 d2 ff ff       	call   c0003732 <panic>
c000646e:	83 c4 10             	add    $0x10,%esp
c0006471:	83 ec 0c             	sub    $0xc,%esp
c0006474:	ff 75 08             	pushl  0x8(%ebp)
c0006477:	e8 37 f5 ff ff       	call   c00059b3 <search_file>
c000647c:	83 c4 10             	add    $0x10,%esp
c000647f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006482:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0006486:	75 10                	jne    c0006498 <do_unlink+0x58>
c0006488:	83 ec 0c             	sub    $0xc,%esp
c000648b:	68 19 a0 00 c0       	push   $0xc000a019
c0006490:	e8 9d d2 ff ff       	call   c0003732 <panic>
c0006495:	83 c4 10             	add    $0x10,%esp
c0006498:	83 ec 08             	sub    $0x8,%esp
c000649b:	ff 75 d0             	pushl  -0x30(%ebp)
c000649e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00064a4:	50                   	push   %eax
c00064a5:	e8 05 f7 ff ff       	call   c0005baf <get_inode>
c00064aa:	83 c4 10             	add    $0x10,%esp
c00064ad:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00064b0:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00064b4:	75 10                	jne    c00064c6 <do_unlink+0x86>
c00064b6:	83 ec 0c             	sub    $0xc,%esp
c00064b9:	68 19 a0 00 c0       	push   $0xc000a019
c00064be:	e8 6f d2 ff ff       	call   c0003732 <panic>
c00064c3:	83 c4 10             	add    $0x10,%esp
c00064c6:	8b 45 88             	mov    -0x78(%ebp),%eax
c00064c9:	85 c0                	test   %eax,%eax
c00064cb:	7e 10                	jle    c00064dd <do_unlink+0x9d>
c00064cd:	83 ec 0c             	sub    $0xc,%esp
c00064d0:	68 34 a0 00 c0       	push   $0xc000a034
c00064d5:	e8 58 d2 ff ff       	call   c0003732 <panic>
c00064da:	83 c4 10             	add    $0x10,%esp
c00064dd:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00064e3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00064e6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00064e9:	8d 50 07             	lea    0x7(%eax),%edx
c00064ec:	85 c0                	test   %eax,%eax
c00064ee:	0f 48 c2             	cmovs  %edx,%eax
c00064f1:	c1 f8 03             	sar    $0x3,%eax
c00064f4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00064f7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064fa:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0006500:	85 c0                	test   %eax,%eax
c0006502:	0f 48 c2             	cmovs  %edx,%eax
c0006505:	c1 f8 09             	sar    $0x9,%eax
c0006508:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000650b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000650e:	99                   	cltd   
c000650f:	c1 ea 1d             	shr    $0x1d,%edx
c0006512:	01 d0                	add    %edx,%eax
c0006514:	83 e0 07             	and    $0x7,%eax
c0006517:	29 d0                	sub    %edx,%eax
c0006519:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000651c:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0006523:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006528:	8b 55 c0             	mov    -0x40(%ebp),%edx
c000652b:	83 c2 02             	add    $0x2,%edx
c000652e:	83 ec 0c             	sub    $0xc,%esp
c0006531:	6a 07                	push   $0x7
c0006533:	68 00 02 00 00       	push   $0x200
c0006538:	50                   	push   %eax
c0006539:	ff 75 b8             	pushl  -0x48(%ebp)
c000653c:	52                   	push   %edx
c000653d:	e8 fd eb ff ff       	call   c000513f <rd_wt>
c0006542:	83 c4 20             	add    $0x20,%esp
c0006545:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000654b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000654e:	01 d0                	add    %edx,%eax
c0006550:	0f b6 10             	movzbl (%eax),%edx
c0006553:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006556:	bb 01 00 00 00       	mov    $0x1,%ebx
c000655b:	89 c1                	mov    %eax,%ecx
c000655d:	d3 e3                	shl    %cl,%ebx
c000655f:	89 d8                	mov    %ebx,%eax
c0006561:	f7 d0                	not    %eax
c0006563:	89 c3                	mov    %eax,%ebx
c0006565:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c000656b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000656e:	01 c8                	add    %ecx,%eax
c0006570:	21 da                	and    %ebx,%edx
c0006572:	88 10                	mov    %dl,(%eax)
c0006574:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006579:	8b 55 c0             	mov    -0x40(%ebp),%edx
c000657c:	83 c2 02             	add    $0x2,%edx
c000657f:	83 ec 0c             	sub    $0xc,%esp
c0006582:	6a 0a                	push   $0xa
c0006584:	68 00 02 00 00       	push   $0x200
c0006589:	50                   	push   %eax
c000658a:	ff 75 b8             	pushl  -0x48(%ebp)
c000658d:	52                   	push   %edx
c000658e:	e8 ac eb ff ff       	call   c000513f <rd_wt>
c0006593:	83 c4 20             	add    $0x20,%esp
c0006596:	e8 cc 08 00 00       	call   c0006e67 <get_super_block>
c000659b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000659e:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c00065a4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00065a7:	8b 00                	mov    (%eax),%eax
c00065a9:	29 c2                	sub    %eax,%edx
c00065ab:	89 d0                	mov    %edx,%eax
c00065ad:	83 c0 01             	add    $0x1,%eax
c00065b0:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00065b3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00065b6:	8d 50 07             	lea    0x7(%eax),%edx
c00065b9:	85 c0                	test   %eax,%eax
c00065bb:	0f 48 c2             	cmovs  %edx,%eax
c00065be:	c1 f8 03             	sar    $0x3,%eax
c00065c1:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00065c4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00065c7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00065cd:	85 c0                	test   %eax,%eax
c00065cf:	0f 48 c2             	cmovs  %edx,%eax
c00065d2:	c1 f8 09             	sar    $0x9,%eax
c00065d5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00065d8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00065db:	99                   	cltd   
c00065dc:	c1 ea 1d             	shr    $0x1d,%edx
c00065df:	01 d0                	add    %edx,%eax
c00065e1:	83 e0 07             	and    $0x7,%eax
c00065e4:	29 d0                	sub    %edx,%eax
c00065e6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00065e9:	b8 08 00 00 00       	mov    $0x8,%eax
c00065ee:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c00065f1:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00065f4:	29 c2                	sub    %eax,%edx
c00065f6:	89 d0                	mov    %edx,%eax
c00065f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00065fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065fe:	8d 50 07             	lea    0x7(%eax),%edx
c0006601:	85 c0                	test   %eax,%eax
c0006603:	0f 48 c2             	cmovs  %edx,%eax
c0006606:	c1 f8 03             	sar    $0x3,%eax
c0006609:	89 45 a0             	mov    %eax,-0x60(%ebp)
c000660c:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006611:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0006614:	8b 52 04             	mov    0x4(%edx),%edx
c0006617:	8d 4a 02             	lea    0x2(%edx),%ecx
c000661a:	8b 55 a8             	mov    -0x58(%ebp),%edx
c000661d:	01 ca                	add    %ecx,%edx
c000661f:	83 ec 0c             	sub    $0xc,%esp
c0006622:	6a 07                	push   $0x7
c0006624:	68 00 02 00 00       	push   $0x200
c0006629:	50                   	push   %eax
c000662a:	ff 75 b8             	pushl  -0x48(%ebp)
c000662d:	52                   	push   %edx
c000662e:	e8 0c eb ff ff       	call   c000513f <rd_wt>
c0006633:	83 c4 20             	add    $0x20,%esp
c0006636:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000663c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000663f:	01 d0                	add    %edx,%eax
c0006641:	0f b6 10             	movzbl (%eax),%edx
c0006644:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006647:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c000664c:	89 c1                	mov    %eax,%ecx
c000664e:	d3 e3                	shl    %cl,%ebx
c0006650:	89 d8                	mov    %ebx,%eax
c0006652:	f7 d0                	not    %eax
c0006654:	89 c3                	mov    %eax,%ebx
c0006656:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c000665c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000665f:	01 c8                	add    %ecx,%eax
c0006661:	21 da                	and    %ebx,%edx
c0006663:	88 10                	mov    %dl,(%eax)
c0006665:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000666c:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000666f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006672:	eb 6a                	jmp    c00066de <do_unlink+0x29e>
c0006674:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c000667b:	75 4b                	jne    c00066c8 <do_unlink+0x288>
c000667d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006684:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006689:	83 ec 0c             	sub    $0xc,%esp
c000668c:	6a 0a                	push   $0xa
c000668e:	68 00 02 00 00       	push   $0x200
c0006693:	50                   	push   %eax
c0006694:	ff 75 b8             	pushl  -0x48(%ebp)
c0006697:	ff 75 ec             	pushl  -0x14(%ebp)
c000669a:	e8 a0 ea ff ff       	call   c000513f <rd_wt>
c000669f:	83 c4 20             	add    $0x20,%esp
c00066a2:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00066a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00066ab:	8d 48 01             	lea    0x1(%eax),%ecx
c00066ae:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c00066b1:	83 ec 0c             	sub    $0xc,%esp
c00066b4:	6a 07                	push   $0x7
c00066b6:	68 00 02 00 00       	push   $0x200
c00066bb:	52                   	push   %edx
c00066bc:	ff 75 b8             	pushl  -0x48(%ebp)
c00066bf:	50                   	push   %eax
c00066c0:	e8 7a ea ff ff       	call   c000513f <rd_wt>
c00066c5:	83 c4 20             	add    $0x20,%esp
c00066c8:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00066ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066d1:	01 d0                	add    %edx,%eax
c00066d3:	c6 00 00             	movb   $0x0,(%eax)
c00066d6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00066da:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c00066de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066e1:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c00066e4:	7c 8e                	jl     c0006674 <do_unlink+0x234>
c00066e6:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c00066ed:	75 4b                	jne    c000673a <do_unlink+0x2fa>
c00066ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00066f6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00066fb:	83 ec 0c             	sub    $0xc,%esp
c00066fe:	6a 0a                	push   $0xa
c0006700:	68 00 02 00 00       	push   $0x200
c0006705:	50                   	push   %eax
c0006706:	ff 75 b8             	pushl  -0x48(%ebp)
c0006709:	ff 75 ec             	pushl  -0x14(%ebp)
c000670c:	e8 2e ea ff ff       	call   c000513f <rd_wt>
c0006711:	83 c4 20             	add    $0x20,%esp
c0006714:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000671a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000671d:	8d 48 01             	lea    0x1(%eax),%ecx
c0006720:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0006723:	83 ec 0c             	sub    $0xc,%esp
c0006726:	6a 07                	push   $0x7
c0006728:	68 00 02 00 00       	push   $0x200
c000672d:	52                   	push   %edx
c000672e:	ff 75 b8             	pushl  -0x48(%ebp)
c0006731:	50                   	push   %eax
c0006732:	e8 08 ea ff ff       	call   c000513f <rd_wt>
c0006737:	83 c4 20             	add    $0x20,%esp
c000673a:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006740:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006743:	01 d0                	add    %edx,%eax
c0006745:	0f b6 10             	movzbl (%eax),%edx
c0006748:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000674b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0006750:	89 c1                	mov    %eax,%ecx
c0006752:	d3 e3                	shl    %cl,%ebx
c0006754:	89 d8                	mov    %ebx,%eax
c0006756:	89 c3                	mov    %eax,%ebx
c0006758:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c000675e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006761:	01 c8                	add    %ecx,%eax
c0006763:	21 da                	and    %ebx,%edx
c0006765:	88 10                	mov    %dl,(%eax)
c0006767:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000676c:	83 ec 0c             	sub    $0xc,%esp
c000676f:	6a 0a                	push   $0xa
c0006771:	68 00 02 00 00       	push   $0x200
c0006776:	50                   	push   %eax
c0006777:	ff 75 b8             	pushl  -0x48(%ebp)
c000677a:	ff 75 ec             	pushl  -0x14(%ebp)
c000677d:	e8 bd e9 ff ff       	call   c000513f <rd_wt>
c0006782:	83 c4 20             	add    $0x20,%esp
c0006785:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c000678c:	00 00 00 
c000678f:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0006796:	00 00 00 
c0006799:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c00067a0:	00 00 00 
c00067a3:	83 ec 0c             	sub    $0xc,%esp
c00067a6:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00067ac:	50                   	push   %eax
c00067ad:	e8 d1 04 00 00       	call   c0006c83 <sync_inode>
c00067b2:	83 c4 10             	add    $0x10,%esp
c00067b5:	83 ec 0c             	sub    $0xc,%esp
c00067b8:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00067be:	50                   	push   %eax
c00067bf:	e8 13 06 00 00       	call   c0006dd7 <put_inode>
c00067c4:	83 c4 10             	add    $0x10,%esp
c00067c7:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00067ca:	8b 00                	mov    (%eax),%eax
c00067cc:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00067cf:	c7 45 98 c0 20 01 c0 	movl   $0xc00120c0,-0x68(%ebp)
c00067d6:	8b 45 98             	mov    -0x68(%ebp),%eax
c00067d9:	8b 40 04             	mov    0x4(%eax),%eax
c00067dc:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00067df:	8b 45 98             	mov    -0x68(%ebp),%eax
c00067e2:	8b 40 0c             	mov    0xc(%eax),%eax
c00067e5:	89 45 90             	mov    %eax,-0x70(%ebp)
c00067e8:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00067eb:	c1 e8 04             	shr    $0x4,%eax
c00067ee:	89 45 8c             	mov    %eax,-0x74(%ebp)
c00067f1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00067f8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00067ff:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006806:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000680d:	e9 a3 00 00 00       	jmp    c00068b5 <do_unlink+0x475>
c0006812:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006817:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c000681a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000681d:	01 ca                	add    %ecx,%edx
c000681f:	83 ec 0c             	sub    $0xc,%esp
c0006822:	6a 07                	push   $0x7
c0006824:	68 00 02 00 00       	push   $0x200
c0006829:	50                   	push   %eax
c000682a:	ff 75 b8             	pushl  -0x48(%ebp)
c000682d:	52                   	push   %edx
c000682e:	e8 0c e9 ff ff       	call   c000513f <rd_wt>
c0006833:	83 c4 20             	add    $0x20,%esp
c0006836:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000683b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000683e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0006845:	eb 51                	jmp    c0006898 <do_unlink+0x458>
c0006847:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000684b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000684e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0006851:	7f 4f                	jg     c00068a2 <do_unlink+0x462>
c0006853:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006856:	83 c0 10             	add    $0x10,%eax
c0006859:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000685c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000685f:	83 c0 04             	add    $0x4,%eax
c0006862:	83 ec 08             	sub    $0x8,%esp
c0006865:	ff 75 08             	pushl  0x8(%ebp)
c0006868:	50                   	push   %eax
c0006869:	e8 49 da ff ff       	call   c00042b7 <strcmp>
c000686e:	83 c4 10             	add    $0x10,%esp
c0006871:	85 c0                	test   %eax,%eax
c0006873:	75 1b                	jne    c0006890 <do_unlink+0x450>
c0006875:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000687c:	83 ec 04             	sub    $0x4,%esp
c000687f:	6a 10                	push   $0x10
c0006881:	6a 00                	push   $0x0
c0006883:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006886:	e8 24 39 00 00       	call   c000a1af <Memset>
c000688b:	83 c4 10             	add    $0x10,%esp
c000688e:	eb 13                	jmp    c00068a3 <do_unlink+0x463>
c0006890:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0006894:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0006898:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000689b:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000689e:	7c a7                	jl     c0006847 <do_unlink+0x407>
c00068a0:	eb 01                	jmp    c00068a3 <do_unlink+0x463>
c00068a2:	90                   	nop
c00068a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00068a6:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00068a9:	7f 16                	jg     c00068c1 <do_unlink+0x481>
c00068ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00068af:	75 10                	jne    c00068c1 <do_unlink+0x481>
c00068b1:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00068b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00068b8:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00068bb:	0f 8c 51 ff ff ff    	jl     c0006812 <do_unlink+0x3d2>
c00068c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00068c4:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00068c7:	75 17                	jne    c00068e0 <do_unlink+0x4a0>
c00068c9:	8b 45 98             	mov    -0x68(%ebp),%eax
c00068cc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00068cf:	89 50 04             	mov    %edx,0x4(%eax)
c00068d2:	83 ec 0c             	sub    $0xc,%esp
c00068d5:	ff 75 98             	pushl  -0x68(%ebp)
c00068d8:	e8 a6 03 00 00       	call   c0006c83 <sync_inode>
c00068dd:	83 c4 10             	add    $0x10,%esp
c00068e0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00068e4:	74 24                	je     c000690a <do_unlink+0x4ca>
c00068e6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00068eb:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c00068ee:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00068f1:	01 ca                	add    %ecx,%edx
c00068f3:	83 ec 0c             	sub    $0xc,%esp
c00068f6:	6a 0a                	push   $0xa
c00068f8:	68 00 02 00 00       	push   $0x200
c00068fd:	50                   	push   %eax
c00068fe:	ff 75 b8             	pushl  -0x48(%ebp)
c0006901:	52                   	push   %edx
c0006902:	e8 38 e8 ff ff       	call   c000513f <rd_wt>
c0006907:	83 c4 20             	add    $0x20,%esp
c000690a:	90                   	nop
c000690b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000690e:	c9                   	leave  
c000690f:	c3                   	ret    

c0006910 <do_rdwt>:
c0006910:	55                   	push   %ebp
c0006911:	89 e5                	mov    %esp,%ebp
c0006913:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0006919:	8b 45 08             	mov    0x8(%ebp),%eax
c000691c:	8b 40 68             	mov    0x68(%eax),%eax
c000691f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006922:	8b 45 08             	mov    0x8(%ebp),%eax
c0006925:	8b 40 50             	mov    0x50(%eax),%eax
c0006928:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000692b:	8b 45 08             	mov    0x8(%ebp),%eax
c000692e:	8b 40 5c             	mov    0x5c(%eax),%eax
c0006931:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006934:	8b 45 08             	mov    0x8(%ebp),%eax
c0006937:	8b 00                	mov    (%eax),%eax
c0006939:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000693c:	8b 45 08             	mov    0x8(%ebp),%eax
c000693f:	8b 40 10             	mov    0x10(%eax),%eax
c0006942:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006945:	8b 45 08             	mov    0x8(%ebp),%eax
c0006948:	8b 40 40             	mov    0x40(%eax),%eax
c000694b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000694e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006951:	6b d0 6b             	imul   $0x6b,%eax,%edx
c0006954:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006957:	01 d0                	add    %edx,%eax
c0006959:	83 c0 0c             	add    $0xc,%eax
c000695c:	8b 04 85 0c 21 08 c0 	mov    -0x3ff7def4(,%eax,4),%eax
c0006963:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006966:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006969:	8b 40 08             	mov    0x8(%eax),%eax
c000696c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000696f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006972:	8b 00                	mov    (%eax),%eax
c0006974:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006977:	83 ec 08             	sub    $0x8,%esp
c000697a:	ff 75 c0             	pushl  -0x40(%ebp)
c000697d:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0006983:	50                   	push   %eax
c0006984:	e8 26 f2 ff ff       	call   c0005baf <get_inode>
c0006989:	83 c4 10             	add    $0x10,%esp
c000698c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000698f:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c0006993:	75 10                	jne    c00069a5 <do_rdwt+0x95>
c0006995:	83 ec 0c             	sub    $0xc,%esp
c0006998:	68 6c a0 00 c0       	push   $0xc000a06c
c000699d:	e8 90 cd ff ff       	call   c0003732 <panic>
c00069a2:	83 c4 10             	add    $0x10,%esp
c00069a5:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00069ab:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00069ae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00069b1:	8b 40 04             	mov    0x4(%eax),%eax
c00069b4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00069b7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00069bb:	74 22                	je     c00069df <do_rdwt+0xcf>
c00069bd:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00069c1:	74 1c                	je     c00069df <do_rdwt+0xcf>
c00069c3:	68 ba 04 00 00       	push   $0x4ba
c00069c8:	68 50 9f 00 c0       	push   $0xc0009f50
c00069cd:	68 50 9f 00 c0       	push   $0xc0009f50
c00069d2:	68 7c a0 00 c0       	push   $0xc000a07c
c00069d7:	e8 74 cd ff ff       	call   c0003750 <assertion_failure>
c00069dc:	83 c4 10             	add    $0x10,%esp
c00069df:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c00069e5:	83 f8 01             	cmp    $0x1,%eax
c00069e8:	75 4a                	jne    c0006a34 <do_rdwt+0x124>
c00069ea:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00069ee:	75 09                	jne    c00069f9 <do_rdwt+0xe9>
c00069f0:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c00069f7:	eb 0d                	jmp    c0006a06 <do_rdwt+0xf6>
c00069f9:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00069fd:	75 07                	jne    c0006a06 <do_rdwt+0xf6>
c00069ff:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0006a06:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a09:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a0c:	89 50 68             	mov    %edx,0x68(%eax)
c0006a0f:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0006a12:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a15:	89 50 58             	mov    %edx,0x58(%eax)
c0006a18:	83 ec 04             	sub    $0x4,%esp
c0006a1b:	6a 00                	push   $0x0
c0006a1d:	ff 75 08             	pushl  0x8(%ebp)
c0006a20:	6a 03                	push   $0x3
c0006a22:	e8 a1 d5 ff ff       	call   c0003fc8 <send_rec>
c0006a27:	83 c4 10             	add    $0x10,%esp
c0006a2a:	b8 00 00 00 00       	mov    $0x0,%eax
c0006a2f:	e9 4d 02 00 00       	jmp    c0006c81 <do_rdwt+0x371>
c0006a34:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0006a38:	75 12                	jne    c0006a4c <do_rdwt+0x13c>
c0006a3a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006a3d:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
c0006a40:	75 0a                	jne    c0006a4c <do_rdwt+0x13c>
c0006a42:	b8 00 00 00 00       	mov    $0x0,%eax
c0006a47:	e9 35 02 00 00       	jmp    c0006c81 <do_rdwt+0x371>
c0006a4c:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0006a50:	75 18                	jne    c0006a6a <do_rdwt+0x15a>
c0006a52:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006a58:	c1 e0 09             	shl    $0x9,%eax
c0006a5b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0006a5e:	75 0a                	jne    c0006a6a <do_rdwt+0x15a>
c0006a60:	b8 00 00 00 00       	mov    $0x0,%eax
c0006a65:	e9 17 02 00 00       	jmp    c0006c81 <do_rdwt+0x371>
c0006a6a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0006a6e:	75 14                	jne    c0006a84 <do_rdwt+0x174>
c0006a70:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006a73:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006a76:	01 d0                	add    %edx,%eax
c0006a78:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c0006a7b:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
c0006a7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a82:	eb 19                	jmp    c0006a9d <do_rdwt+0x18d>
c0006a84:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006a87:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006a8a:	01 c2                	add    %eax,%edx
c0006a8c:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006a92:	c1 e0 09             	shl    $0x9,%eax
c0006a95:	39 c2                	cmp    %eax,%edx
c0006a97:	0f 4e c2             	cmovle %edx,%eax
c0006a9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a9d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006aa0:	99                   	cltd   
c0006aa1:	c1 ea 17             	shr    $0x17,%edx
c0006aa4:	01 d0                	add    %edx,%eax
c0006aa6:	25 ff 01 00 00       	and    $0x1ff,%eax
c0006aab:	29 d0                	sub    %edx,%eax
c0006aad:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ab0:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006ab6:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006ab9:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0006abf:	85 c0                	test   %eax,%eax
c0006ac1:	0f 48 c1             	cmovs  %ecx,%eax
c0006ac4:	c1 f8 09             	sar    $0x9,%eax
c0006ac7:	01 d0                	add    %edx,%eax
c0006ac9:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006acc:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006ad2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006ad5:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0006adb:	85 c0                	test   %eax,%eax
c0006add:	0f 48 c1             	cmovs  %ecx,%eax
c0006ae0:	c1 f8 09             	sar    $0x9,%eax
c0006ae3:	01 d0                	add    %edx,%eax
c0006ae5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0006ae8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0006aeb:	2b 45 ac             	sub    -0x54(%ebp),%eax
c0006aee:	ba 00 00 10 00       	mov    $0x100000,%edx
c0006af3:	39 d0                	cmp    %edx,%eax
c0006af5:	7d 0b                	jge    c0006b02 <do_rdwt+0x1f2>
c0006af7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0006afa:	2b 45 ac             	sub    -0x54(%ebp),%eax
c0006afd:	83 c0 01             	add    $0x1,%eax
c0006b00:	eb 05                	jmp    c0006b07 <do_rdwt+0x1f7>
c0006b02:	b8 00 00 10 00       	mov    $0x100000,%eax
c0006b07:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0006b0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006b0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b10:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006b17:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b1a:	8b 00                	mov    (%eax),%eax
c0006b1c:	83 ec 0c             	sub    $0xc,%esp
c0006b1f:	50                   	push   %eax
c0006b20:	e8 6e 05 00 00       	call   c0007093 <pid2proc>
c0006b25:	83 c4 10             	add    $0x10,%esp
c0006b28:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0006b2b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0006b2e:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0006b34:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006b37:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0006b3a:	83 ec 08             	sub    $0x8,%esp
c0006b3d:	ff 75 a0             	pushl  -0x60(%ebp)
c0006b40:	50                   	push   %eax
c0006b41:	e8 36 06 00 00       	call   c000717c <Seg2PhyAddrLDT>
c0006b46:	83 c4 10             	add    $0x10,%esp
c0006b49:	89 45 98             	mov    %eax,-0x68(%ebp)
c0006b4c:	8b 55 98             	mov    -0x68(%ebp),%edx
c0006b4f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006b52:	01 d0                	add    %edx,%eax
c0006b54:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0006b57:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006b5a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006b5d:	e9 c7 00 00 00       	jmp    c0006c29 <do_rdwt+0x319>
c0006b62:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006b65:	c1 e0 09             	shl    $0x9,%eax
c0006b68:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0006b6b:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0006b6e:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c0006b72:	89 45 90             	mov    %eax,-0x70(%ebp)
c0006b75:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
c0006b7c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006b7f:	c1 e0 09             	shl    $0x9,%eax
c0006b82:	89 c2                	mov    %eax,%edx
c0006b84:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006b89:	83 ec 0c             	sub    $0xc,%esp
c0006b8c:	6a 07                	push   $0x7
c0006b8e:	52                   	push   %edx
c0006b8f:	50                   	push   %eax
c0006b90:	ff 75 8c             	pushl  -0x74(%ebp)
c0006b93:	ff 75 e0             	pushl  -0x20(%ebp)
c0006b96:	e8 a4 e5 ff ff       	call   c000513f <rd_wt>
c0006b9b:	83 c4 20             	add    $0x20,%esp
c0006b9e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0006ba2:	75 25                	jne    c0006bc9 <do_rdwt+0x2b9>
c0006ba4:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006baa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bad:	01 d0                	add    %edx,%eax
c0006baf:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c0006bb2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006bb5:	01 ca                	add    %ecx,%edx
c0006bb7:	83 ec 04             	sub    $0x4,%esp
c0006bba:	ff 75 90             	pushl  -0x70(%ebp)
c0006bbd:	50                   	push   %eax
c0006bbe:	52                   	push   %edx
c0006bbf:	e8 bd 35 00 00       	call   c000a181 <Memcpy>
c0006bc4:	83 c4 10             	add    $0x10,%esp
c0006bc7:	eb 47                	jmp    c0006c10 <do_rdwt+0x300>
c0006bc9:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0006bcc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006bcf:	01 d0                	add    %edx,%eax
c0006bd1:	89 c1                	mov    %eax,%ecx
c0006bd3:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006bd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bdc:	01 d0                	add    %edx,%eax
c0006bde:	83 ec 04             	sub    $0x4,%esp
c0006be1:	ff 75 90             	pushl  -0x70(%ebp)
c0006be4:	51                   	push   %ecx
c0006be5:	50                   	push   %eax
c0006be6:	e8 96 35 00 00       	call   c000a181 <Memcpy>
c0006beb:	83 c4 10             	add    $0x10,%esp
c0006bee:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006bf1:	c1 e0 09             	shl    $0x9,%eax
c0006bf4:	89 c2                	mov    %eax,%edx
c0006bf6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006bfb:	83 ec 0c             	sub    $0xc,%esp
c0006bfe:	6a 0a                	push   $0xa
c0006c00:	52                   	push   %edx
c0006c01:	50                   	push   %eax
c0006c02:	ff 75 8c             	pushl  -0x74(%ebp)
c0006c05:	ff 75 e0             	pushl  -0x20(%ebp)
c0006c08:	e8 32 e5 ff ff       	call   c000513f <rd_wt>
c0006c0d:	83 c4 20             	add    $0x20,%esp
c0006c10:	8b 45 90             	mov    -0x70(%ebp),%eax
c0006c13:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0006c16:	8b 45 90             	mov    -0x70(%ebp),%eax
c0006c19:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006c1c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006c23:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006c26:	01 45 e0             	add    %eax,-0x20(%ebp)
c0006c29:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c2c:	3b 45 a8             	cmp    -0x58(%ebp),%eax
c0006c2f:	7f 0a                	jg     c0006c3b <do_rdwt+0x32b>
c0006c31:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006c35:	0f 85 27 ff ff ff    	jne    c0006b62 <do_rdwt+0x252>
c0006c3b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006c3e:	8b 50 04             	mov    0x4(%eax),%edx
c0006c41:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006c44:	01 c2                	add    %eax,%edx
c0006c46:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006c49:	89 50 04             	mov    %edx,0x4(%eax)
c0006c4c:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006c4f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006c52:	01 c2                	add    %eax,%edx
c0006c54:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0006c5a:	39 c2                	cmp    %eax,%edx
c0006c5c:	7e 20                	jle    c0006c7e <do_rdwt+0x36e>
c0006c5e:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006c61:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006c64:	01 d0                	add    %edx,%eax
c0006c66:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0006c6c:	83 ec 0c             	sub    $0xc,%esp
c0006c6f:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0006c75:	50                   	push   %eax
c0006c76:	e8 08 00 00 00       	call   c0006c83 <sync_inode>
c0006c7b:	83 c4 10             	add    $0x10,%esp
c0006c7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006c81:	c9                   	leave  
c0006c82:	c3                   	ret    

c0006c83 <sync_inode>:
c0006c83:	55                   	push   %ebp
c0006c84:	89 e5                	mov    %esp,%ebp
c0006c86:	53                   	push   %ebx
c0006c87:	83 ec 34             	sub    $0x34,%esp
c0006c8a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006c91:	eb 74                	jmp    c0006d07 <sync_inode+0x84>
c0006c93:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006c96:	89 d0                	mov    %edx,%eax
c0006c98:	c1 e0 02             	shl    $0x2,%eax
c0006c9b:	01 d0                	add    %edx,%eax
c0006c9d:	c1 e0 03             	shl    $0x3,%eax
c0006ca0:	05 d0 16 01 c0       	add    $0xc00116d0,%eax
c0006ca5:	8b 10                	mov    (%eax),%edx
c0006ca7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006caa:	8b 40 10             	mov    0x10(%eax),%eax
c0006cad:	39 c2                	cmp    %eax,%edx
c0006caf:	75 52                	jne    c0006d03 <sync_inode+0x80>
c0006cb1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006cb4:	89 d0                	mov    %edx,%eax
c0006cb6:	c1 e0 02             	shl    $0x2,%eax
c0006cb9:	01 d0                	add    %edx,%eax
c0006cbb:	c1 e0 03             	shl    $0x3,%eax
c0006cbe:	8d 90 c0 16 01 c0    	lea    -0x3ffee940(%eax),%edx
c0006cc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cc7:	8b 08                	mov    (%eax),%ecx
c0006cc9:	89 0a                	mov    %ecx,(%edx)
c0006ccb:	8b 48 04             	mov    0x4(%eax),%ecx
c0006cce:	89 4a 04             	mov    %ecx,0x4(%edx)
c0006cd1:	8b 48 08             	mov    0x8(%eax),%ecx
c0006cd4:	89 4a 08             	mov    %ecx,0x8(%edx)
c0006cd7:	8b 48 0c             	mov    0xc(%eax),%ecx
c0006cda:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0006cdd:	8b 48 10             	mov    0x10(%eax),%ecx
c0006ce0:	89 4a 10             	mov    %ecx,0x10(%edx)
c0006ce3:	8b 48 14             	mov    0x14(%eax),%ecx
c0006ce6:	89 4a 14             	mov    %ecx,0x14(%edx)
c0006ce9:	8b 48 18             	mov    0x18(%eax),%ecx
c0006cec:	89 4a 18             	mov    %ecx,0x18(%edx)
c0006cef:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0006cf2:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0006cf5:	8b 48 20             	mov    0x20(%eax),%ecx
c0006cf8:	89 4a 20             	mov    %ecx,0x20(%edx)
c0006cfb:	8b 40 24             	mov    0x24(%eax),%eax
c0006cfe:	89 42 24             	mov    %eax,0x24(%edx)
c0006d01:	eb 0a                	jmp    c0006d0d <sync_inode+0x8a>
c0006d03:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006d07:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0006d0b:	7e 86                	jle    c0006c93 <sync_inode+0x10>
c0006d0d:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0006d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d17:	8b 40 10             	mov    0x10(%eax),%eax
c0006d1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d20:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0006d23:	b8 00 02 00 00       	mov    $0x200,%eax
c0006d28:	99                   	cltd   
c0006d29:	f7 7d f0             	idivl  -0x10(%ebp)
c0006d2c:	89 c3                	mov    %eax,%ebx
c0006d2e:	89 c8                	mov    %ecx,%eax
c0006d30:	99                   	cltd   
c0006d31:	f7 fb                	idiv   %ebx
c0006d33:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0006d36:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d39:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0006d3c:	b8 00 02 00 00       	mov    $0x200,%eax
c0006d41:	99                   	cltd   
c0006d42:	f7 7d f0             	idivl  -0x10(%ebp)
c0006d45:	89 c3                	mov    %eax,%ebx
c0006d47:	89 c8                	mov    %ecx,%eax
c0006d49:	99                   	cltd   
c0006d4a:	f7 fb                	idiv   %ebx
c0006d4c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006d4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d52:	8b 40 20             	mov    0x20(%eax),%eax
c0006d55:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006d58:	e8 0a 01 00 00       	call   c0006e67 <get_super_block>
c0006d5d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006d60:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006d63:	8b 40 04             	mov    0x4(%eax),%eax
c0006d66:	8d 50 02             	lea    0x2(%eax),%edx
c0006d69:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006d6c:	8b 40 08             	mov    0x8(%eax),%eax
c0006d6f:	01 c2                	add    %eax,%edx
c0006d71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006d74:	01 d0                	add    %edx,%eax
c0006d76:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006d79:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006d7e:	83 ec 0c             	sub    $0xc,%esp
c0006d81:	6a 07                	push   $0x7
c0006d83:	68 00 02 00 00       	push   $0x200
c0006d88:	50                   	push   %eax
c0006d89:	ff 75 e0             	pushl  -0x20(%ebp)
c0006d8c:	ff 75 d8             	pushl  -0x28(%ebp)
c0006d8f:	e8 ab e3 ff ff       	call   c000513f <rd_wt>
c0006d94:	83 c4 20             	add    $0x20,%esp
c0006d97:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006d9c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006d9f:	83 ec 04             	sub    $0x4,%esp
c0006da2:	ff 75 f0             	pushl  -0x10(%ebp)
c0006da5:	ff 75 08             	pushl  0x8(%ebp)
c0006da8:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006dab:	e8 d1 33 00 00       	call   c000a181 <Memcpy>
c0006db0:	83 c4 10             	add    $0x10,%esp
c0006db3:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006db8:	83 ec 0c             	sub    $0xc,%esp
c0006dbb:	6a 0a                	push   $0xa
c0006dbd:	68 00 02 00 00       	push   $0x200
c0006dc2:	50                   	push   %eax
c0006dc3:	ff 75 e0             	pushl  -0x20(%ebp)
c0006dc6:	ff 75 d8             	pushl  -0x28(%ebp)
c0006dc9:	e8 71 e3 ff ff       	call   c000513f <rd_wt>
c0006dce:	83 c4 20             	add    $0x20,%esp
c0006dd1:	90                   	nop
c0006dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0006dd5:	c9                   	leave  
c0006dd6:	c3                   	ret    

c0006dd7 <put_inode>:
c0006dd7:	55                   	push   %ebp
c0006dd8:	89 e5                	mov    %esp,%ebp
c0006dda:	83 ec 08             	sub    $0x8,%esp
c0006ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006de0:	8b 40 24             	mov    0x24(%eax),%eax
c0006de3:	85 c0                	test   %eax,%eax
c0006de5:	7f 1c                	jg     c0006e03 <put_inode+0x2c>
c0006de7:	68 54 05 00 00       	push   $0x554
c0006dec:	68 50 9f 00 c0       	push   $0xc0009f50
c0006df1:	68 50 9f 00 c0       	push   $0xc0009f50
c0006df6:	68 b0 a0 00 c0       	push   $0xc000a0b0
c0006dfb:	e8 50 c9 ff ff       	call   c0003750 <assertion_failure>
c0006e00:	83 c4 10             	add    $0x10,%esp
c0006e03:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e06:	8b 40 24             	mov    0x24(%eax),%eax
c0006e09:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006e0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e0f:	89 50 24             	mov    %edx,0x24(%eax)
c0006e12:	90                   	nop
c0006e13:	c9                   	leave  
c0006e14:	c3                   	ret    

c0006e15 <do_close>:
c0006e15:	55                   	push   %ebp
c0006e16:	89 e5                	mov    %esp,%ebp
c0006e18:	a1 c4 ea 00 c0       	mov    0xc000eac4,%eax
c0006e1d:	8b 55 08             	mov    0x8(%ebp),%edx
c0006e20:	83 c2 0c             	add    $0xc,%edx
c0006e23:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0006e27:	8b 50 0c             	mov    0xc(%eax),%edx
c0006e2a:	83 ea 01             	sub    $0x1,%edx
c0006e2d:	89 50 0c             	mov    %edx,0xc(%eax)
c0006e30:	8b 40 0c             	mov    0xc(%eax),%eax
c0006e33:	85 c0                	test   %eax,%eax
c0006e35:	75 16                	jne    c0006e4d <do_close+0x38>
c0006e37:	a1 c4 ea 00 c0       	mov    0xc000eac4,%eax
c0006e3c:	8b 55 08             	mov    0x8(%ebp),%edx
c0006e3f:	83 c2 0c             	add    $0xc,%edx
c0006e42:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0006e46:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0006e4d:	a1 c4 ea 00 c0       	mov    0xc000eac4,%eax
c0006e52:	8b 55 08             	mov    0x8(%ebp),%edx
c0006e55:	83 c2 0c             	add    $0xc,%edx
c0006e58:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0006e5f:	00 
c0006e60:	b8 00 00 00 00       	mov    $0x0,%eax
c0006e65:	5d                   	pop    %ebp
c0006e66:	c3                   	ret    

c0006e67 <get_super_block>:
c0006e67:	55                   	push   %ebp
c0006e68:	89 e5                	mov    %esp,%ebp
c0006e6a:	83 ec 08             	sub    $0x8,%esp
c0006e6d:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006e72:	83 ec 0c             	sub    $0xc,%esp
c0006e75:	6a 07                	push   $0x7
c0006e77:	68 00 02 00 00       	push   $0x200
c0006e7c:	50                   	push   %eax
c0006e7d:	6a 20                	push   $0x20
c0006e7f:	6a 01                	push   $0x1
c0006e81:	e8 b9 e2 ff ff       	call   c000513f <rd_wt>
c0006e86:	83 c4 20             	add    $0x20,%esp
c0006e89:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006e8f:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c0006e94:	8b 0a                	mov    (%edx),%ecx
c0006e96:	89 08                	mov    %ecx,(%eax)
c0006e98:	8b 4a 04             	mov    0x4(%edx),%ecx
c0006e9b:	89 48 04             	mov    %ecx,0x4(%eax)
c0006e9e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0006ea1:	89 48 08             	mov    %ecx,0x8(%eax)
c0006ea4:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0006ea7:	89 48 0c             	mov    %ecx,0xc(%eax)
c0006eaa:	8b 4a 10             	mov    0x10(%edx),%ecx
c0006ead:	89 48 10             	mov    %ecx,0x10(%eax)
c0006eb0:	8b 4a 14             	mov    0x14(%edx),%ecx
c0006eb3:	89 48 14             	mov    %ecx,0x14(%eax)
c0006eb6:	8b 4a 18             	mov    0x18(%edx),%ecx
c0006eb9:	89 48 18             	mov    %ecx,0x18(%eax)
c0006ebc:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0006ebf:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0006ec2:	8b 52 20             	mov    0x20(%edx),%edx
c0006ec5:	89 50 20             	mov    %edx,0x20(%eax)
c0006ec8:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c0006ecd:	c9                   	leave  
c0006ece:	c3                   	ret    

c0006ecf <check>:
c0006ecf:	55                   	push   %ebp
c0006ed0:	89 e5                	mov    %esp,%ebp
c0006ed2:	83 ec 18             	sub    $0x18,%esp
c0006ed5:	c7 45 f4 00 21 08 c0 	movl   $0xc0082100,-0xc(%ebp)
c0006edc:	eb 59                	jmp    c0006f37 <check+0x68>
c0006ede:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ee1:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0006ee7:	85 c0                	test   %eax,%eax
c0006ee9:	74 45                	je     c0006f30 <check+0x61>
c0006eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006eee:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0006ef4:	83 f8 01             	cmp    $0x1,%eax
c0006ef7:	74 37                	je     c0006f30 <check+0x61>
c0006ef9:	c7 05 9c e6 00 c0 02 	movl   $0x2802,0xc000e69c
c0006f00:	28 00 00 
c0006f03:	83 ec 08             	sub    $0x8,%esp
c0006f06:	6a 0a                	push   $0xa
c0006f08:	68 bf a0 00 c0       	push   $0xc000a0bf
c0006f0d:	e8 b5 a6 ff ff       	call   c00015c7 <disp_str_colour>
c0006f12:	83 c4 10             	add    $0x10,%esp
c0006f15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f18:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0006f1f:	0f be c0             	movsbl %al,%eax
c0006f22:	83 ec 0c             	sub    $0xc,%esp
c0006f25:	50                   	push   %eax
c0006f26:	e8 46 ac ff ff       	call   c0001b71 <disp_int>
c0006f2b:	83 c4 10             	add    $0x10,%esp
c0006f2e:	eb fe                	jmp    c0006f2e <check+0x5f>
c0006f30:	81 45 f4 ac 01 00 00 	addl   $0x1ac,-0xc(%ebp)
c0006f37:	b8 ac 22 08 c0       	mov    $0xc00822ac,%eax
c0006f3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0006f3f:	72 9d                	jb     c0006ede <check+0xf>
c0006f41:	90                   	nop
c0006f42:	c9                   	leave  
c0006f43:	c3                   	ret    

c0006f44 <schedule_process>:
c0006f44:	55                   	push   %ebp
c0006f45:	89 e5                	mov    %esp,%ebp
c0006f47:	83 ec 10             	sub    $0x10,%esp
c0006f4a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0006f51:	eb 7e                	jmp    c0006fd1 <schedule_process+0x8d>
c0006f53:	c7 45 fc 00 21 08 c0 	movl   $0xc0082100,-0x4(%ebp)
c0006f5a:	eb 31                	jmp    c0006f8d <schedule_process+0x49>
c0006f5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f5f:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0006f66:	84 c0                	test   %al,%al
c0006f68:	75 1c                	jne    c0006f86 <schedule_process+0x42>
c0006f6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f6d:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006f70:	39 45 f8             	cmp    %eax,-0x8(%ebp)
c0006f73:	73 11                	jae    c0006f86 <schedule_process+0x42>
c0006f75:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f78:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006f7b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f81:	a3 c0 ea 00 c0       	mov    %eax,0xc000eac0
c0006f86:	81 45 fc ac 01 00 00 	addl   $0x1ac,-0x4(%ebp)
c0006f8d:	b8 ac 22 08 c0       	mov    $0xc00822ac,%eax
c0006f92:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c0006f95:	72 c5                	jb     c0006f5c <schedule_process+0x18>
c0006f97:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c0006f9b:	75 34                	jne    c0006fd1 <schedule_process+0x8d>
c0006f9d:	c7 45 fc 00 21 08 c0 	movl   $0xc0082100,-0x4(%ebp)
c0006fa4:	eb 21                	jmp    c0006fc7 <schedule_process+0x83>
c0006fa6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006fa9:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0006fb0:	84 c0                	test   %al,%al
c0006fb2:	75 0c                	jne    c0006fc0 <schedule_process+0x7c>
c0006fb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006fb7:	8b 50 20             	mov    0x20(%eax),%edx
c0006fba:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006fbd:	89 50 1c             	mov    %edx,0x1c(%eax)
c0006fc0:	81 45 fc ac 01 00 00 	addl   $0x1ac,-0x4(%ebp)
c0006fc7:	b8 ac 22 08 c0       	mov    $0xc00822ac,%eax
c0006fcc:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c0006fcf:	72 d5                	jb     c0006fa6 <schedule_process+0x62>
c0006fd1:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c0006fd5:	0f 84 78 ff ff ff    	je     c0006f53 <schedule_process+0xf>
c0006fdb:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0006fe2:	a1 c0 ea 00 c0       	mov    0xc000eac0,%eax
c0006fe7:	8b 80 3c 01 00 00    	mov    0x13c(%eax),%eax
c0006fed:	85 c0                	test   %eax,%eax
c0006fef:	74 10                	je     c0007001 <schedule_process+0xbd>
c0006ff1:	a1 c0 ea 00 c0       	mov    0xc000eac0,%eax
c0006ff6:	8b 80 3c 01 00 00    	mov    0x13c(%eax),%eax
c0006ffc:	0f 22 d8             	mov    %eax,%cr3
c0006fff:	eb 06                	jmp    c0007007 <schedule_process+0xc3>
c0007001:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007004:	0f 22 d8             	mov    %eax,%cr3
c0007007:	90                   	nop
c0007008:	c9                   	leave  
c0007009:	c3                   	ret    

c000700a <clock_handler>:
c000700a:	55                   	push   %ebp
c000700b:	89 e5                	mov    %esp,%ebp
c000700d:	83 ec 08             	sub    $0x8,%esp
c0007010:	a1 c0 ea 00 c0       	mov    0xc000eac0,%eax
c0007015:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c000701c:	3c 02                	cmp    $0x2,%al
c000701e:	a1 20 0e 01 c0       	mov    0xc0010e20,%eax
c0007023:	83 c0 01             	add    $0x1,%eax
c0007026:	a3 20 0e 01 c0       	mov    %eax,0xc0010e20
c000702b:	a1 20 0e 01 c0       	mov    0xc0010e20,%eax
c0007030:	3d cc ab ff 7f       	cmp    $0x7fffabcc,%eax
c0007035:	76 0a                	jbe    c0007041 <clock_handler+0x37>
c0007037:	c7 05 20 0e 01 c0 00 	movl   $0x0,0xc0010e20
c000703e:	00 00 00 
c0007041:	a1 c0 ea 00 c0       	mov    0xc000eac0,%eax
c0007046:	8b 40 1c             	mov    0x1c(%eax),%eax
c0007049:	85 c0                	test   %eax,%eax
c000704b:	74 0e                	je     c000705b <clock_handler+0x51>
c000704d:	a1 c0 ea 00 c0       	mov    0xc000eac0,%eax
c0007052:	8b 50 1c             	mov    0x1c(%eax),%edx
c0007055:	83 ea 01             	sub    $0x1,%edx
c0007058:	89 50 1c             	mov    %edx,0x1c(%eax)
c000705b:	a1 00 06 01 c0       	mov    0xc0010600,%eax
c0007060:	85 c0                	test   %eax,%eax
c0007062:	74 0d                	je     c0007071 <clock_handler+0x67>
c0007064:	83 ec 0c             	sub    $0xc,%esp
c0007067:	6a 00                	push   $0x0
c0007069:	e8 90 d1 ff ff       	call   c00041fe <inform_int>
c000706e:	83 c4 10             	add    $0x10,%esp
c0007071:	a1 a0 e6 00 c0       	mov    0xc000e6a0,%eax
c0007076:	85 c0                	test   %eax,%eax
c0007078:	75 13                	jne    c000708d <clock_handler+0x83>
c000707a:	a1 c0 ea 00 c0       	mov    0xc000eac0,%eax
c000707f:	8b 40 1c             	mov    0x1c(%eax),%eax
c0007082:	85 c0                	test   %eax,%eax
c0007084:	75 0a                	jne    c0007090 <clock_handler+0x86>
c0007086:	e8 b9 fe ff ff       	call   c0006f44 <schedule_process>
c000708b:	eb 04                	jmp    c0007091 <clock_handler+0x87>
c000708d:	90                   	nop
c000708e:	eb 01                	jmp    c0007091 <clock_handler+0x87>
c0007090:	90                   	nop
c0007091:	c9                   	leave  
c0007092:	c3                   	ret    

c0007093 <pid2proc>:
c0007093:	55                   	push   %ebp
c0007094:	89 e5                	mov    %esp,%ebp
c0007096:	83 ec 10             	sub    $0x10,%esp
c0007099:	8b 45 08             	mov    0x8(%ebp),%eax
c000709c:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c00070a2:	05 00 21 08 c0       	add    $0xc0082100,%eax
c00070a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00070aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00070ad:	c9                   	leave  
c00070ae:	c3                   	ret    

c00070af <proc2pid>:
c00070af:	55                   	push   %ebp
c00070b0:	89 e5                	mov    %esp,%ebp
c00070b2:	83 ec 10             	sub    $0x10,%esp
c00070b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00070b8:	2d 00 21 08 c0       	sub    $0xc0082100,%eax
c00070bd:	c1 f8 02             	sar    $0x2,%eax
c00070c0:	69 c0 43 ac 28 8d    	imul   $0x8d28ac43,%eax,%eax
c00070c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00070c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00070cc:	c9                   	leave  
c00070cd:	c3                   	ret    

c00070ce <InitDescriptor>:
c00070ce:	55                   	push   %ebp
c00070cf:	89 e5                	mov    %esp,%ebp
c00070d1:	83 ec 04             	sub    $0x4,%esp
c00070d4:	8b 45 14             	mov    0x14(%ebp),%eax
c00070d7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c00070db:	8b 45 10             	mov    0x10(%ebp),%eax
c00070de:	89 c2                	mov    %eax,%edx
c00070e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00070e3:	66 89 10             	mov    %dx,(%eax)
c00070e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070e9:	89 c2                	mov    %eax,%edx
c00070eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00070ee:	66 89 50 02          	mov    %dx,0x2(%eax)
c00070f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070f5:	c1 e8 10             	shr    $0x10,%eax
c00070f8:	89 c2                	mov    %eax,%edx
c00070fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00070fd:	88 50 04             	mov    %dl,0x4(%eax)
c0007100:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0007104:	89 c2                	mov    %eax,%edx
c0007106:	8b 45 08             	mov    0x8(%ebp),%eax
c0007109:	88 50 05             	mov    %dl,0x5(%eax)
c000710c:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0007110:	66 c1 e8 08          	shr    $0x8,%ax
c0007114:	c1 e0 04             	shl    $0x4,%eax
c0007117:	89 c2                	mov    %eax,%edx
c0007119:	8b 45 10             	mov    0x10(%ebp),%eax
c000711c:	c1 e8 10             	shr    $0x10,%eax
c000711f:	83 e0 0f             	and    $0xf,%eax
c0007122:	09 c2                	or     %eax,%edx
c0007124:	8b 45 08             	mov    0x8(%ebp),%eax
c0007127:	88 50 06             	mov    %dl,0x6(%eax)
c000712a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000712d:	c1 e8 18             	shr    $0x18,%eax
c0007130:	89 c2                	mov    %eax,%edx
c0007132:	8b 45 08             	mov    0x8(%ebp),%eax
c0007135:	88 50 07             	mov    %dl,0x7(%eax)
c0007138:	90                   	nop
c0007139:	c9                   	leave  
c000713a:	c3                   	ret    

c000713b <Seg2PhyAddr>:
c000713b:	55                   	push   %ebp
c000713c:	89 e5                	mov    %esp,%ebp
c000713e:	83 ec 10             	sub    $0x10,%esp
c0007141:	8b 45 08             	mov    0x8(%ebp),%eax
c0007144:	c1 e8 03             	shr    $0x3,%eax
c0007147:	8b 14 c5 c4 e6 00 c0 	mov    -0x3fff193c(,%eax,8),%edx
c000714e:	8b 04 c5 c0 e6 00 c0 	mov    -0x3fff1940(,%eax,8),%eax
c0007155:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007158:	89 55 f8             	mov    %edx,-0x8(%ebp)
c000715b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000715f:	0f b7 c0             	movzwl %ax,%eax
c0007162:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0007166:	0f b6 d2             	movzbl %dl,%edx
c0007169:	c1 e2 10             	shl    $0x10,%edx
c000716c:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0007172:	09 d0                	or     %edx,%eax
c0007174:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007177:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000717a:	c9                   	leave  
c000717b:	c3                   	ret    

c000717c <Seg2PhyAddrLDT>:
c000717c:	55                   	push   %ebp
c000717d:	89 e5                	mov    %esp,%ebp
c000717f:	83 ec 10             	sub    $0x10,%esp
c0007182:	8b 45 08             	mov    0x8(%ebp),%eax
c0007185:	c1 e8 03             	shr    $0x3,%eax
c0007188:	89 c2                	mov    %eax,%edx
c000718a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000718d:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
c0007191:	8b 02                	mov    (%edx),%eax
c0007193:	8b 52 04             	mov    0x4(%edx),%edx
c0007196:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007199:	89 55 f8             	mov    %edx,-0x8(%ebp)
c000719c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00071a0:	0f b7 c0             	movzwl %ax,%eax
c00071a3:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c00071a7:	0f b6 d2             	movzbl %dl,%edx
c00071aa:	c1 e2 10             	shl    $0x10,%edx
c00071ad:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c00071b3:	09 d0                	or     %edx,%eax
c00071b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00071b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00071bb:	c9                   	leave  
c00071bc:	c3                   	ret    

c00071bd <VirAddr2PhyAddr>:
c00071bd:	55                   	push   %ebp
c00071be:	89 e5                	mov    %esp,%ebp
c00071c0:	83 ec 10             	sub    $0x10,%esp
c00071c3:	8b 55 0c             	mov    0xc(%ebp),%edx
c00071c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00071c9:	01 d0                	add    %edx,%eax
c00071cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00071ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00071d1:	c9                   	leave  
c00071d2:	c3                   	ret    

c00071d3 <v2l>:
c00071d3:	55                   	push   %ebp
c00071d4:	89 e5                	mov    %esp,%ebp
c00071d6:	83 ec 18             	sub    $0x18,%esp
c00071d9:	83 ec 0c             	sub    $0xc,%esp
c00071dc:	ff 75 08             	pushl  0x8(%ebp)
c00071df:	e8 af fe ff ff       	call   c0007093 <pid2proc>
c00071e4:	83 c4 10             	add    $0x10,%esp
c00071e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00071ea:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00071f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00071f4:	83 ec 08             	sub    $0x8,%esp
c00071f7:	ff 75 f4             	pushl  -0xc(%ebp)
c00071fa:	50                   	push   %eax
c00071fb:	e8 7c ff ff ff       	call   c000717c <Seg2PhyAddrLDT>
c0007200:	83 c4 10             	add    $0x10,%esp
c0007203:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007206:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0007209:	8b 45 0c             	mov    0xc(%ebp),%eax
c000720c:	01 d0                	add    %edx,%eax
c000720e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007211:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007214:	c9                   	leave  
c0007215:	c3                   	ret    

c0007216 <init_propt>:
c0007216:	55                   	push   %ebp
c0007217:	89 e5                	mov    %esp,%ebp
c0007219:	83 ec 28             	sub    $0x28,%esp
c000721c:	6a 0e                	push   $0xe
c000721e:	6a 08                	push   $0x8
c0007220:	68 6a 16 00 c0       	push   $0xc000166a
c0007225:	6a 20                	push   $0x20
c0007227:	e8 d1 00 00 00       	call   c00072fd <InitInterruptDesc>
c000722c:	83 c4 10             	add    $0x10,%esp
c000722f:	6a 0e                	push   $0xe
c0007231:	6a 08                	push   $0x8
c0007233:	68 b3 16 00 c0       	push   $0xc00016b3
c0007238:	6a 21                	push   $0x21
c000723a:	e8 be 00 00 00       	call   c00072fd <InitInterruptDesc>
c000723f:	83 c4 10             	add    $0x10,%esp
c0007242:	6a 0e                	push   $0xe
c0007244:	6a 08                	push   $0x8
c0007246:	68 fc 16 00 c0       	push   $0xc00016fc
c000724b:	6a 2e                	push   $0x2e
c000724d:	e8 ab 00 00 00       	call   c00072fd <InitInterruptDesc>
c0007252:	83 c4 10             	add    $0x10,%esp
c0007255:	83 ec 04             	sub    $0x4,%esp
c0007258:	68 ac 01 00 00       	push   $0x1ac
c000725d:	6a 00                	push   $0x0
c000725f:	68 00 21 08 c0       	push   $0xc0082100
c0007264:	e8 46 2f 00 00       	call   c000a1af <Memset>
c0007269:	83 c4 10             	add    $0x10,%esp
c000726c:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0007273:	83 ec 04             	sub    $0x4,%esp
c0007276:	ff 75 f4             	pushl  -0xc(%ebp)
c0007279:	6a 00                	push   $0x0
c000727b:	68 80 05 01 c0       	push   $0xc0010580
c0007280:	e8 2a 2f 00 00       	call   c000a1af <Memset>
c0007285:	83 c4 10             	add    $0x10,%esp
c0007288:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000728b:	a3 e8 05 01 c0       	mov    %eax,0xc00105e8
c0007290:	c7 05 88 05 01 c0 30 	movl   $0x30,0xc0010588
c0007297:	00 00 00 
c000729a:	83 ec 0c             	sub    $0xc,%esp
c000729d:	6a 30                	push   $0x30
c000729f:	e8 97 fe ff ff       	call   c000713b <Seg2PhyAddr>
c00072a4:	83 c4 10             	add    $0x10,%esp
c00072a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00072aa:	c7 45 ec 80 05 01 c0 	movl   $0xc0010580,-0x14(%ebp)
c00072b1:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c00072b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00072bb:	0f b7 d0             	movzwl %ax,%edx
c00072be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00072c1:	83 e8 01             	sub    $0x1,%eax
c00072c4:	89 c1                	mov    %eax,%ecx
c00072c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072c9:	52                   	push   %edx
c00072ca:	51                   	push   %ecx
c00072cb:	50                   	push   %eax
c00072cc:	68 00 e7 00 c0       	push   $0xc000e700
c00072d1:	e8 f8 fd ff ff       	call   c00070ce <InitDescriptor>
c00072d6:	83 c4 10             	add    $0x10,%esp
c00072d9:	c7 45 e4 00 80 0b 0c 	movl   $0xc0b8000,-0x1c(%ebp)
c00072e0:	68 f2 00 00 00       	push   $0xf2
c00072e5:	68 ff ff 00 00       	push   $0xffff
c00072ea:	ff 75 e4             	pushl  -0x1c(%ebp)
c00072ed:	68 f8 e6 00 c0       	push   $0xc000e6f8
c00072f2:	e8 d7 fd ff ff       	call   c00070ce <InitDescriptor>
c00072f7:	83 c4 10             	add    $0x10,%esp
c00072fa:	90                   	nop
c00072fb:	c9                   	leave  
c00072fc:	c3                   	ret    

c00072fd <InitInterruptDesc>:
c00072fd:	55                   	push   %ebp
c00072fe:	89 e5                	mov    %esp,%ebp
c0007300:	83 ec 10             	sub    $0x10,%esp
c0007303:	8b 45 08             	mov    0x8(%ebp),%eax
c0007306:	c1 e0 03             	shl    $0x3,%eax
c0007309:	05 20 06 01 c0       	add    $0xc0010620,%eax
c000730e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007311:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007314:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0007318:	8b 45 0c             	mov    0xc(%ebp),%eax
c000731b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000731e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007321:	89 c2                	mov    %eax,%edx
c0007323:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007326:	66 89 10             	mov    %dx,(%eax)
c0007329:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000732c:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0007332:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007335:	c1 f8 10             	sar    $0x10,%eax
c0007338:	89 c2                	mov    %eax,%edx
c000733a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000733d:	66 89 50 06          	mov    %dx,0x6(%eax)
c0007341:	8b 45 10             	mov    0x10(%ebp),%eax
c0007344:	c1 e0 04             	shl    $0x4,%eax
c0007347:	89 c2                	mov    %eax,%edx
c0007349:	8b 45 14             	mov    0x14(%ebp),%eax
c000734c:	09 d0                	or     %edx,%eax
c000734e:	89 c2                	mov    %eax,%edx
c0007350:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007353:	88 50 05             	mov    %dl,0x5(%eax)
c0007356:	90                   	nop
c0007357:	c9                   	leave  
c0007358:	c3                   	ret    

c0007359 <ReloadGDT>:
c0007359:	55                   	push   %ebp
c000735a:	89 e5                	mov    %esp,%ebp
c000735c:	83 ec 28             	sub    $0x28,%esp
c000735f:	b8 08 06 01 c0       	mov    $0xc0010608,%eax
c0007364:	0f b7 00             	movzwl (%eax),%eax
c0007367:	98                   	cwtl   
c0007368:	ba 0a 06 01 c0       	mov    $0xc001060a,%edx
c000736d:	8b 12                	mov    (%edx),%edx
c000736f:	83 ec 04             	sub    $0x4,%esp
c0007372:	50                   	push   %eax
c0007373:	52                   	push   %edx
c0007374:	68 c0 e6 00 c0       	push   $0xc000e6c0
c0007379:	e8 03 2e 00 00       	call   c000a181 <Memcpy>
c000737e:	83 c4 10             	add    $0x10,%esp
c0007381:	c7 45 f0 08 06 01 c0 	movl   $0xc0010608,-0x10(%ebp)
c0007388:	c7 45 ec 0a 06 01 c0 	movl   $0xc001060a,-0x14(%ebp)
c000738f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007392:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0007397:	ba c0 e6 00 c0       	mov    $0xc000e6c0,%edx
c000739c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000739f:	89 10                	mov    %edx,(%eax)
c00073a1:	c7 45 e8 88 e6 00 c0 	movl   $0xc000e688,-0x18(%ebp)
c00073a8:	c7 45 e4 8a e6 00 c0 	movl   $0xc000e68a,-0x1c(%ebp)
c00073af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00073b2:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c00073b7:	ba 20 06 01 c0       	mov    $0xc0010620,%edx
c00073bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00073bf:	89 10                	mov    %edx,(%eax)
c00073c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00073c8:	eb 04                	jmp    c00073ce <ReloadGDT+0x75>
c00073ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00073ce:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00073d5:	7e f3                	jle    c00073ca <ReloadGDT+0x71>
c00073d7:	e8 51 ac ff ff       	call   c000202d <init_internal_interrupt>
c00073dc:	e8 35 fe ff ff       	call   c0007216 <init_propt>
c00073e1:	90                   	nop
c00073e2:	c9                   	leave  
c00073e3:	c3                   	ret    

c00073e4 <select_console>:
c00073e4:	55                   	push   %ebp
c00073e5:	89 e5                	mov    %esp,%ebp
c00073e7:	83 ec 18             	sub    $0x18,%esp
c00073ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00073ed:	88 45 f4             	mov    %al,-0xc(%ebp)
c00073f0:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c00073f4:	77 27                	ja     c000741d <select_console+0x39>
c00073f6:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c00073fa:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0007400:	05 00 ed 00 c0       	add    $0xc000ed00,%eax
c0007405:	a3 80 e6 00 c0       	mov    %eax,0xc000e680
c000740a:	a1 80 e6 00 c0       	mov    0xc000e680,%eax
c000740f:	83 ec 0c             	sub    $0xc,%esp
c0007412:	50                   	push   %eax
c0007413:	e8 08 00 00 00       	call   c0007420 <flush>
c0007418:	83 c4 10             	add    $0x10,%esp
c000741b:	eb 01                	jmp    c000741e <select_console+0x3a>
c000741d:	90                   	nop
c000741e:	c9                   	leave  
c000741f:	c3                   	ret    

c0007420 <flush>:
c0007420:	55                   	push   %ebp
c0007421:	89 e5                	mov    %esp,%ebp
c0007423:	83 ec 08             	sub    $0x8,%esp
c0007426:	8b 45 08             	mov    0x8(%ebp),%eax
c0007429:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000742f:	8b 40 0c             	mov    0xc(%eax),%eax
c0007432:	83 ec 0c             	sub    $0xc,%esp
c0007435:	50                   	push   %eax
c0007436:	e8 1e 00 00 00       	call   c0007459 <set_cursor>
c000743b:	83 c4 10             	add    $0x10,%esp
c000743e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007441:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007447:	8b 40 08             	mov    0x8(%eax),%eax
c000744a:	83 ec 0c             	sub    $0xc,%esp
c000744d:	50                   	push   %eax
c000744e:	e8 64 00 00 00       	call   c00074b7 <set_console_start_video_addr>
c0007453:	83 c4 10             	add    $0x10,%esp
c0007456:	90                   	nop
c0007457:	c9                   	leave  
c0007458:	c3                   	ret    

c0007459 <set_cursor>:
c0007459:	55                   	push   %ebp
c000745a:	89 e5                	mov    %esp,%ebp
c000745c:	83 ec 08             	sub    $0x8,%esp
c000745f:	83 ec 08             	sub    $0x8,%esp
c0007462:	6a 0e                	push   $0xe
c0007464:	68 d4 03 00 00       	push   $0x3d4
c0007469:	e8 71 a3 ff ff       	call   c00017df <out_byte>
c000746e:	83 c4 10             	add    $0x10,%esp
c0007471:	8b 45 08             	mov    0x8(%ebp),%eax
c0007474:	c1 e8 08             	shr    $0x8,%eax
c0007477:	0f b7 c0             	movzwl %ax,%eax
c000747a:	83 ec 08             	sub    $0x8,%esp
c000747d:	50                   	push   %eax
c000747e:	68 d5 03 00 00       	push   $0x3d5
c0007483:	e8 57 a3 ff ff       	call   c00017df <out_byte>
c0007488:	83 c4 10             	add    $0x10,%esp
c000748b:	83 ec 08             	sub    $0x8,%esp
c000748e:	6a 0f                	push   $0xf
c0007490:	68 d4 03 00 00       	push   $0x3d4
c0007495:	e8 45 a3 ff ff       	call   c00017df <out_byte>
c000749a:	83 c4 10             	add    $0x10,%esp
c000749d:	8b 45 08             	mov    0x8(%ebp),%eax
c00074a0:	0f b7 c0             	movzwl %ax,%eax
c00074a3:	83 ec 08             	sub    $0x8,%esp
c00074a6:	50                   	push   %eax
c00074a7:	68 d5 03 00 00       	push   $0x3d5
c00074ac:	e8 2e a3 ff ff       	call   c00017df <out_byte>
c00074b1:	83 c4 10             	add    $0x10,%esp
c00074b4:	90                   	nop
c00074b5:	c9                   	leave  
c00074b6:	c3                   	ret    

c00074b7 <set_console_start_video_addr>:
c00074b7:	55                   	push   %ebp
c00074b8:	89 e5                	mov    %esp,%ebp
c00074ba:	83 ec 08             	sub    $0x8,%esp
c00074bd:	83 ec 08             	sub    $0x8,%esp
c00074c0:	6a 0c                	push   $0xc
c00074c2:	68 d4 03 00 00       	push   $0x3d4
c00074c7:	e8 13 a3 ff ff       	call   c00017df <out_byte>
c00074cc:	83 c4 10             	add    $0x10,%esp
c00074cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00074d2:	c1 e8 08             	shr    $0x8,%eax
c00074d5:	0f b7 c0             	movzwl %ax,%eax
c00074d8:	83 ec 08             	sub    $0x8,%esp
c00074db:	50                   	push   %eax
c00074dc:	68 d5 03 00 00       	push   $0x3d5
c00074e1:	e8 f9 a2 ff ff       	call   c00017df <out_byte>
c00074e6:	83 c4 10             	add    $0x10,%esp
c00074e9:	83 ec 08             	sub    $0x8,%esp
c00074ec:	6a 0d                	push   $0xd
c00074ee:	68 d4 03 00 00       	push   $0x3d4
c00074f3:	e8 e7 a2 ff ff       	call   c00017df <out_byte>
c00074f8:	83 c4 10             	add    $0x10,%esp
c00074fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00074fe:	0f b7 c0             	movzwl %ax,%eax
c0007501:	83 ec 08             	sub    $0x8,%esp
c0007504:	50                   	push   %eax
c0007505:	68 d5 03 00 00       	push   $0x3d5
c000750a:	e8 d0 a2 ff ff       	call   c00017df <out_byte>
c000750f:	83 c4 10             	add    $0x10,%esp
c0007512:	90                   	nop
c0007513:	c9                   	leave  
c0007514:	c3                   	ret    

c0007515 <put_key>:
c0007515:	55                   	push   %ebp
c0007516:	89 e5                	mov    %esp,%ebp
c0007518:	83 ec 04             	sub    $0x4,%esp
c000751b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000751e:	88 45 fc             	mov    %al,-0x4(%ebp)
c0007521:	8b 45 08             	mov    0x8(%ebp),%eax
c0007524:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000752a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c000752f:	77 4d                	ja     c000757e <put_key+0x69>
c0007531:	8b 45 08             	mov    0x8(%ebp),%eax
c0007534:	8b 00                	mov    (%eax),%eax
c0007536:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c000753a:	89 10                	mov    %edx,(%eax)
c000753c:	8b 45 08             	mov    0x8(%ebp),%eax
c000753f:	8b 00                	mov    (%eax),%eax
c0007541:	8d 50 04             	lea    0x4(%eax),%edx
c0007544:	8b 45 08             	mov    0x8(%ebp),%eax
c0007547:	89 10                	mov    %edx,(%eax)
c0007549:	8b 45 08             	mov    0x8(%ebp),%eax
c000754c:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0007552:	8d 50 01             	lea    0x1(%eax),%edx
c0007555:	8b 45 08             	mov    0x8(%ebp),%eax
c0007558:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000755e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007561:	8b 00                	mov    (%eax),%eax
c0007563:	8b 55 08             	mov    0x8(%ebp),%edx
c0007566:	83 c2 08             	add    $0x8,%edx
c0007569:	81 c2 00 08 00 00    	add    $0x800,%edx
c000756f:	39 d0                	cmp    %edx,%eax
c0007571:	75 0b                	jne    c000757e <put_key+0x69>
c0007573:	8b 45 08             	mov    0x8(%ebp),%eax
c0007576:	8d 50 08             	lea    0x8(%eax),%edx
c0007579:	8b 45 08             	mov    0x8(%ebp),%eax
c000757c:	89 10                	mov    %edx,(%eax)
c000757e:	90                   	nop
c000757f:	c9                   	leave  
c0007580:	c3                   	ret    

c0007581 <scroll_up>:
c0007581:	55                   	push   %ebp
c0007582:	89 e5                	mov    %esp,%ebp
c0007584:	83 ec 08             	sub    $0x8,%esp
c0007587:	8b 45 08             	mov    0x8(%ebp),%eax
c000758a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007590:	8b 40 08             	mov    0x8(%eax),%eax
c0007593:	8d 50 b0             	lea    -0x50(%eax),%edx
c0007596:	8b 45 08             	mov    0x8(%ebp),%eax
c0007599:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000759f:	8b 00                	mov    (%eax),%eax
c00075a1:	39 c2                	cmp    %eax,%edx
c00075a3:	76 1b                	jbe    c00075c0 <scroll_up+0x3f>
c00075a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00075a8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075ae:	8b 40 08             	mov    0x8(%eax),%eax
c00075b1:	83 e8 50             	sub    $0x50,%eax
c00075b4:	83 ec 0c             	sub    $0xc,%esp
c00075b7:	50                   	push   %eax
c00075b8:	e8 fa fe ff ff       	call   c00074b7 <set_console_start_video_addr>
c00075bd:	83 c4 10             	add    $0x10,%esp
c00075c0:	90                   	nop
c00075c1:	c9                   	leave  
c00075c2:	c3                   	ret    

c00075c3 <scroll_down>:
c00075c3:	55                   	push   %ebp
c00075c4:	89 e5                	mov    %esp,%ebp
c00075c6:	83 ec 08             	sub    $0x8,%esp
c00075c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00075cc:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075d2:	8b 40 08             	mov    0x8(%eax),%eax
c00075d5:	8d 48 50             	lea    0x50(%eax),%ecx
c00075d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00075db:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075e1:	8b 10                	mov    (%eax),%edx
c00075e3:	8b 45 08             	mov    0x8(%ebp),%eax
c00075e6:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075ec:	8b 40 04             	mov    0x4(%eax),%eax
c00075ef:	01 d0                	add    %edx,%eax
c00075f1:	39 c1                	cmp    %eax,%ecx
c00075f3:	73 36                	jae    c000762b <scroll_down+0x68>
c00075f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00075f8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075fe:	8b 40 08             	mov    0x8(%eax),%eax
c0007601:	83 c0 50             	add    $0x50,%eax
c0007604:	83 ec 0c             	sub    $0xc,%esp
c0007607:	50                   	push   %eax
c0007608:	e8 aa fe ff ff       	call   c00074b7 <set_console_start_video_addr>
c000760d:	83 c4 10             	add    $0x10,%esp
c0007610:	8b 45 08             	mov    0x8(%ebp),%eax
c0007613:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007619:	8b 50 08             	mov    0x8(%eax),%edx
c000761c:	8b 45 08             	mov    0x8(%ebp),%eax
c000761f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007625:	83 c2 50             	add    $0x50,%edx
c0007628:	89 50 08             	mov    %edx,0x8(%eax)
c000762b:	90                   	nop
c000762c:	c9                   	leave  
c000762d:	c3                   	ret    

c000762e <out_char>:
c000762e:	55                   	push   %ebp
c000762f:	89 e5                	mov    %esp,%ebp
c0007631:	83 ec 28             	sub    $0x28,%esp
c0007634:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007637:	88 45 e4             	mov    %al,-0x1c(%ebp)
c000763a:	8b 45 08             	mov    0x8(%ebp),%eax
c000763d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007643:	8b 40 0c             	mov    0xc(%eax),%eax
c0007646:	05 00 c0 05 00       	add    $0x5c000,%eax
c000764b:	01 c0                	add    %eax,%eax
c000764d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007650:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0007654:	83 f8 08             	cmp    $0x8,%eax
c0007657:	0f 84 8d 00 00 00    	je     c00076ea <out_char+0xbc>
c000765d:	83 f8 0a             	cmp    $0xa,%eax
c0007660:	0f 85 c9 00 00 00    	jne    c000772f <out_char+0x101>
c0007666:	8b 45 08             	mov    0x8(%ebp),%eax
c0007669:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000766f:	8b 50 0c             	mov    0xc(%eax),%edx
c0007672:	8b 45 08             	mov    0x8(%ebp),%eax
c0007675:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000767b:	8b 08                	mov    (%eax),%ecx
c000767d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007680:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007686:	8b 40 04             	mov    0x4(%eax),%eax
c0007689:	01 c8                	add    %ecx,%eax
c000768b:	83 e8 50             	sub    $0x50,%eax
c000768e:	39 c2                	cmp    %eax,%edx
c0007690:	0f 83 f4 00 00 00    	jae    c000778a <out_char+0x15c>
c0007696:	8b 45 08             	mov    0x8(%ebp),%eax
c0007699:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000769f:	8b 08                	mov    (%eax),%ecx
c00076a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00076a4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00076aa:	8b 50 0c             	mov    0xc(%eax),%edx
c00076ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00076b0:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00076b6:	8b 00                	mov    (%eax),%eax
c00076b8:	29 c2                	sub    %eax,%edx
c00076ba:	89 d0                	mov    %edx,%eax
c00076bc:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00076c1:	f7 e2                	mul    %edx
c00076c3:	89 d0                	mov    %edx,%eax
c00076c5:	c1 e8 06             	shr    $0x6,%eax
c00076c8:	8d 50 01             	lea    0x1(%eax),%edx
c00076cb:	89 d0                	mov    %edx,%eax
c00076cd:	c1 e0 02             	shl    $0x2,%eax
c00076d0:	01 d0                	add    %edx,%eax
c00076d2:	c1 e0 04             	shl    $0x4,%eax
c00076d5:	89 c2                	mov    %eax,%edx
c00076d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00076da:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00076e0:	01 ca                	add    %ecx,%edx
c00076e2:	89 50 0c             	mov    %edx,0xc(%eax)
c00076e5:	e9 a0 00 00 00       	jmp    c000778a <out_char+0x15c>
c00076ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00076ed:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00076f3:	8b 50 0c             	mov    0xc(%eax),%edx
c00076f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00076f9:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00076ff:	8b 00                	mov    (%eax),%eax
c0007701:	39 c2                	cmp    %eax,%edx
c0007703:	0f 86 84 00 00 00    	jbe    c000778d <out_char+0x15f>
c0007709:	8b 45 08             	mov    0x8(%ebp),%eax
c000770c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007712:	8b 50 0c             	mov    0xc(%eax),%edx
c0007715:	83 ea 01             	sub    $0x1,%edx
c0007718:	89 50 0c             	mov    %edx,0xc(%eax)
c000771b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000771e:	83 e8 02             	sub    $0x2,%eax
c0007721:	c6 00 20             	movb   $0x20,(%eax)
c0007724:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007727:	83 e8 01             	sub    $0x1,%eax
c000772a:	c6 00 00             	movb   $0x0,(%eax)
c000772d:	eb 5e                	jmp    c000778d <out_char+0x15f>
c000772f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007732:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007738:	8b 40 0c             	mov    0xc(%eax),%eax
c000773b:	8d 48 01             	lea    0x1(%eax),%ecx
c000773e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007741:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007747:	8b 10                	mov    (%eax),%edx
c0007749:	8b 45 08             	mov    0x8(%ebp),%eax
c000774c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007752:	8b 40 04             	mov    0x4(%eax),%eax
c0007755:	01 d0                	add    %edx,%eax
c0007757:	39 c1                	cmp    %eax,%ecx
c0007759:	73 35                	jae    c0007790 <out_char+0x162>
c000775b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000775e:	8d 50 01             	lea    0x1(%eax),%edx
c0007761:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0007764:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0007768:	88 10                	mov    %dl,(%eax)
c000776a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000776d:	8d 50 01             	lea    0x1(%eax),%edx
c0007770:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0007773:	c6 00 0a             	movb   $0xa,(%eax)
c0007776:	8b 45 08             	mov    0x8(%ebp),%eax
c0007779:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000777f:	8b 50 0c             	mov    0xc(%eax),%edx
c0007782:	83 c2 01             	add    $0x1,%edx
c0007785:	89 50 0c             	mov    %edx,0xc(%eax)
c0007788:	eb 06                	jmp    c0007790 <out_char+0x162>
c000778a:	90                   	nop
c000778b:	eb 14                	jmp    c00077a1 <out_char+0x173>
c000778d:	90                   	nop
c000778e:	eb 11                	jmp    c00077a1 <out_char+0x173>
c0007790:	90                   	nop
c0007791:	eb 0e                	jmp    c00077a1 <out_char+0x173>
c0007793:	83 ec 0c             	sub    $0xc,%esp
c0007796:	ff 75 08             	pushl  0x8(%ebp)
c0007799:	e8 25 fe ff ff       	call   c00075c3 <scroll_down>
c000779e:	83 c4 10             	add    $0x10,%esp
c00077a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00077a4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00077aa:	8b 50 0c             	mov    0xc(%eax),%edx
c00077ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00077b0:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00077b6:	8b 40 08             	mov    0x8(%eax),%eax
c00077b9:	29 c2                	sub    %eax,%edx
c00077bb:	89 d0                	mov    %edx,%eax
c00077bd:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00077c2:	77 cf                	ja     c0007793 <out_char+0x165>
c00077c4:	83 ec 0c             	sub    $0xc,%esp
c00077c7:	ff 75 08             	pushl  0x8(%ebp)
c00077ca:	e8 51 fc ff ff       	call   c0007420 <flush>
c00077cf:	83 c4 10             	add    $0x10,%esp
c00077d2:	90                   	nop
c00077d3:	c9                   	leave  
c00077d4:	c3                   	ret    

c00077d5 <tty_dev_read>:
c00077d5:	55                   	push   %ebp
c00077d6:	89 e5                	mov    %esp,%ebp
c00077d8:	83 ec 08             	sub    $0x8,%esp
c00077db:	a1 80 e6 00 c0       	mov    0xc000e680,%eax
c00077e0:	39 45 08             	cmp    %eax,0x8(%ebp)
c00077e3:	75 17                	jne    c00077fc <tty_dev_read+0x27>
c00077e5:	a1 e8 ea 00 c0       	mov    0xc000eae8,%eax
c00077ea:	85 c0                	test   %eax,%eax
c00077ec:	7e 0e                	jle    c00077fc <tty_dev_read+0x27>
c00077ee:	83 ec 0c             	sub    $0xc,%esp
c00077f1:	ff 75 08             	pushl  0x8(%ebp)
c00077f4:	e8 f5 06 00 00       	call   c0007eee <keyboard_read>
c00077f9:	83 c4 10             	add    $0x10,%esp
c00077fc:	90                   	nop
c00077fd:	c9                   	leave  
c00077fe:	c3                   	ret    

c00077ff <tty_dev_write>:
c00077ff:	55                   	push   %ebp
c0007800:	89 e5                	mov    %esp,%ebp
c0007802:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0007808:	8b 45 08             	mov    0x8(%ebp),%eax
c000780b:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0007811:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007814:	e9 da 01 00 00       	jmp    c00079f3 <tty_dev_write+0x1f4>
c0007819:	8b 45 08             	mov    0x8(%ebp),%eax
c000781c:	8b 40 04             	mov    0x4(%eax),%eax
c000781f:	8b 00                	mov    (%eax),%eax
c0007821:	88 45 f3             	mov    %al,-0xd(%ebp)
c0007824:	8b 45 08             	mov    0x8(%ebp),%eax
c0007827:	8b 40 04             	mov    0x4(%eax),%eax
c000782a:	8d 50 04             	lea    0x4(%eax),%edx
c000782d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007830:	89 50 04             	mov    %edx,0x4(%eax)
c0007833:	8b 45 08             	mov    0x8(%ebp),%eax
c0007836:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000783c:	8d 50 ff             	lea    -0x1(%eax),%edx
c000783f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007842:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0007848:	8b 45 08             	mov    0x8(%ebp),%eax
c000784b:	8b 40 04             	mov    0x4(%eax),%eax
c000784e:	8b 55 08             	mov    0x8(%ebp),%edx
c0007851:	83 c2 08             	add    $0x8,%edx
c0007854:	81 c2 00 08 00 00    	add    $0x800,%edx
c000785a:	39 d0                	cmp    %edx,%eax
c000785c:	75 0c                	jne    c000786a <tty_dev_write+0x6b>
c000785e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007861:	8d 50 08             	lea    0x8(%eax),%edx
c0007864:	8b 45 08             	mov    0x8(%ebp),%eax
c0007867:	89 50 04             	mov    %edx,0x4(%eax)
c000786a:	8b 45 08             	mov    0x8(%ebp),%eax
c000786d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0007873:	85 c0                	test   %eax,%eax
c0007875:	0f 84 78 01 00 00    	je     c00079f3 <tty_dev_write+0x1f4>
c000787b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000787f:	3c 20                	cmp    $0x20,%al
c0007881:	76 08                	jbe    c000788b <tty_dev_write+0x8c>
c0007883:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007887:	3c 7e                	cmp    $0x7e,%al
c0007889:	76 10                	jbe    c000789b <tty_dev_write+0x9c>
c000788b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000788f:	3c 20                	cmp    $0x20,%al
c0007891:	74 08                	je     c000789b <tty_dev_write+0x9c>
c0007893:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007897:	84 c0                	test   %al,%al
c0007899:	75 7b                	jne    c0007916 <tty_dev_write+0x117>
c000789b:	83 ec 08             	sub    $0x8,%esp
c000789e:	8d 45 f3             	lea    -0xd(%ebp),%eax
c00078a1:	50                   	push   %eax
c00078a2:	6a 00                	push   $0x0
c00078a4:	e8 2a f9 ff ff       	call   c00071d3 <v2l>
c00078a9:	83 c4 10             	add    $0x10,%esp
c00078ac:	89 c1                	mov    %eax,%ecx
c00078ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00078b1:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c00078b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00078ba:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00078c0:	01 d0                	add    %edx,%eax
c00078c2:	83 ec 04             	sub    $0x4,%esp
c00078c5:	6a 01                	push   $0x1
c00078c7:	51                   	push   %ecx
c00078c8:	50                   	push   %eax
c00078c9:	e8 b3 28 00 00       	call   c000a181 <Memcpy>
c00078ce:	83 c4 10             	add    $0x10,%esp
c00078d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00078d4:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00078da:	8d 50 ff             	lea    -0x1(%eax),%edx
c00078dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00078e0:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00078e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00078e9:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00078ef:	8d 50 01             	lea    0x1(%eax),%edx
c00078f2:	8b 45 08             	mov    0x8(%ebp),%eax
c00078f5:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00078fb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00078ff:	0f b6 c0             	movzbl %al,%eax
c0007902:	83 ec 08             	sub    $0x8,%esp
c0007905:	50                   	push   %eax
c0007906:	ff 75 08             	pushl  0x8(%ebp)
c0007909:	e8 20 fd ff ff       	call   c000762e <out_char>
c000790e:	83 c4 10             	add    $0x10,%esp
c0007911:	e9 dd 00 00 00       	jmp    c00079f3 <tty_dev_write+0x1f4>
c0007916:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000791a:	3c 08                	cmp    $0x8,%al
c000791c:	75 45                	jne    c0007963 <tty_dev_write+0x164>
c000791e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007921:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0007927:	8d 50 01             	lea    0x1(%eax),%edx
c000792a:	8b 45 08             	mov    0x8(%ebp),%eax
c000792d:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0007933:	8b 45 08             	mov    0x8(%ebp),%eax
c0007936:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000793c:	8d 50 ff             	lea    -0x1(%eax),%edx
c000793f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007942:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0007948:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000794c:	0f b6 c0             	movzbl %al,%eax
c000794f:	83 ec 08             	sub    $0x8,%esp
c0007952:	50                   	push   %eax
c0007953:	ff 75 08             	pushl  0x8(%ebp)
c0007956:	e8 d3 fc ff ff       	call   c000762e <out_char>
c000795b:	83 c4 10             	add    $0x10,%esp
c000795e:	e9 90 00 00 00       	jmp    c00079f3 <tty_dev_write+0x1f4>
c0007963:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007967:	3c 0a                	cmp    $0xa,%al
c0007969:	74 10                	je     c000797b <tty_dev_write+0x17c>
c000796b:	8b 45 08             	mov    0x8(%ebp),%eax
c000796e:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0007974:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007977:	39 c2                	cmp    %eax,%edx
c0007979:	75 78                	jne    c00079f3 <tty_dev_write+0x1f4>
c000797b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000797f:	0f b6 c0             	movzbl %al,%eax
c0007982:	83 ec 08             	sub    $0x8,%esp
c0007985:	50                   	push   %eax
c0007986:	ff 75 08             	pushl  0x8(%ebp)
c0007989:	e8 a0 fc ff ff       	call   c000762e <out_char>
c000798e:	83 c4 10             	add    $0x10,%esp
c0007991:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
c0007998:	8b 45 08             	mov    0x8(%ebp),%eax
c000799b:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00079a1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00079a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00079a7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00079ad:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00079b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00079b3:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00079b9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00079bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00079bf:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c00079c6:	00 00 00 
c00079c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00079cc:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00079d3:	00 00 00 
c00079d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00079d9:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c00079df:	83 ec 04             	sub    $0x4,%esp
c00079e2:	50                   	push   %eax
c00079e3:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00079e6:	50                   	push   %eax
c00079e7:	6a 01                	push   $0x1
c00079e9:	e8 da c5 ff ff       	call   c0003fc8 <send_rec>
c00079ee:	83 c4 10             	add    $0x10,%esp
c00079f1:	eb 11                	jmp    c0007a04 <tty_dev_write+0x205>
c00079f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00079f6:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00079fc:	85 c0                	test   %eax,%eax
c00079fe:	0f 85 15 fe ff ff    	jne    c0007819 <tty_dev_write+0x1a>
c0007a04:	c9                   	leave  
c0007a05:	c3                   	ret    

c0007a06 <tty_do_read>:
c0007a06:	55                   	push   %ebp
c0007a07:	89 e5                	mov    %esp,%ebp
c0007a09:	83 ec 08             	sub    $0x8,%esp
c0007a0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a0f:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0007a16:	00 00 00 
c0007a19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a1c:	8b 50 58             	mov    0x58(%eax),%edx
c0007a1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a22:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0007a28:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a2b:	8b 00                	mov    (%eax),%eax
c0007a2d:	89 c2                	mov    %eax,%edx
c0007a2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a32:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0007a38:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a3b:	8b 50 50             	mov    0x50(%eax),%edx
c0007a3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a41:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0007a47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a4a:	8b 40 10             	mov    0x10(%eax),%eax
c0007a4d:	89 c2                	mov    %eax,%edx
c0007a4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a52:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0007a58:	83 ec 08             	sub    $0x8,%esp
c0007a5b:	52                   	push   %edx
c0007a5c:	50                   	push   %eax
c0007a5d:	e8 71 f7 ff ff       	call   c00071d3 <v2l>
c0007a62:	83 c4 10             	add    $0x10,%esp
c0007a65:	89 c2                	mov    %eax,%edx
c0007a67:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a6a:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0007a70:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a73:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c0007a7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a7d:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c0007a83:	83 ec 04             	sub    $0x4,%esp
c0007a86:	50                   	push   %eax
c0007a87:	ff 75 0c             	pushl  0xc(%ebp)
c0007a8a:	6a 01                	push   $0x1
c0007a8c:	e8 37 c5 ff ff       	call   c0003fc8 <send_rec>
c0007a91:	83 c4 10             	add    $0x10,%esp
c0007a94:	90                   	nop
c0007a95:	c9                   	leave  
c0007a96:	c3                   	ret    

c0007a97 <tty_do_write>:
c0007a97:	55                   	push   %ebp
c0007a98:	89 e5                	mov    %esp,%ebp
c0007a9a:	53                   	push   %ebx
c0007a9b:	81 ec 94 00 00 00    	sub    $0x94,%esp
c0007aa1:	89 e0                	mov    %esp,%eax
c0007aa3:	89 c3                	mov    %eax,%ebx
c0007aa5:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0007aac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007aaf:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007ab2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0007ab5:	89 c2                	mov    %eax,%edx
c0007ab7:	b8 10 00 00 00       	mov    $0x10,%eax
c0007abc:	83 e8 01             	sub    $0x1,%eax
c0007abf:	01 d0                	add    %edx,%eax
c0007ac1:	b9 10 00 00 00       	mov    $0x10,%ecx
c0007ac6:	ba 00 00 00 00       	mov    $0x0,%edx
c0007acb:	f7 f1                	div    %ecx
c0007acd:	6b c0 10             	imul   $0x10,%eax,%eax
c0007ad0:	29 c4                	sub    %eax,%esp
c0007ad2:	89 e0                	mov    %esp,%eax
c0007ad4:	83 c0 00             	add    $0x0,%eax
c0007ad7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007ada:	83 ec 04             	sub    $0x4,%esp
c0007add:	ff 75 e8             	pushl  -0x18(%ebp)
c0007ae0:	6a 00                	push   $0x0
c0007ae2:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ae5:	e8 c5 26 00 00       	call   c000a1af <Memset>
c0007aea:	83 c4 10             	add    $0x10,%esp
c0007aed:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007af0:	8b 40 50             	mov    0x50(%eax),%eax
c0007af3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007af6:	8b 45 08             	mov    0x8(%ebp),%eax
c0007af9:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0007b00:	00 00 00 
c0007b03:	e9 98 00 00 00       	jmp    c0007ba0 <tty_do_write+0x109>
c0007b08:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007b0b:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0007b0e:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0007b12:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007b15:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007b18:	8b 40 10             	mov    0x10(%eax),%eax
c0007b1b:	89 c2                	mov    %eax,%edx
c0007b1d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007b20:	8b 40 58             	mov    0x58(%eax),%eax
c0007b23:	83 ec 08             	sub    $0x8,%esp
c0007b26:	52                   	push   %edx
c0007b27:	50                   	push   %eax
c0007b28:	e8 a6 f6 ff ff       	call   c00071d3 <v2l>
c0007b2d:	83 c4 10             	add    $0x10,%esp
c0007b30:	89 c2                	mov    %eax,%edx
c0007b32:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b35:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007b3b:	01 d0                	add    %edx,%eax
c0007b3d:	83 ec 04             	sub    $0x4,%esp
c0007b40:	ff 75 f0             	pushl  -0x10(%ebp)
c0007b43:	50                   	push   %eax
c0007b44:	ff 75 e0             	pushl  -0x20(%ebp)
c0007b47:	e8 35 26 00 00       	call   c000a181 <Memcpy>
c0007b4c:	83 c4 10             	add    $0x10,%esp
c0007b4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b52:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0007b55:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b58:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0007b5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b61:	01 c2                	add    %eax,%edx
c0007b63:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b66:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0007b6c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b73:	eb 25                	jmp    c0007b9a <tty_do_write+0x103>
c0007b75:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007b78:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b7b:	01 d0                	add    %edx,%eax
c0007b7d:	0f b6 00             	movzbl (%eax),%eax
c0007b80:	0f b6 c0             	movzbl %al,%eax
c0007b83:	83 ec 08             	sub    $0x8,%esp
c0007b86:	50                   	push   %eax
c0007b87:	ff 75 08             	pushl  0x8(%ebp)
c0007b8a:	e8 9f fa ff ff       	call   c000762e <out_char>
c0007b8f:	83 c4 10             	add    $0x10,%esp
c0007b92:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007b96:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007b9a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007b9e:	75 d5                	jne    c0007b75 <tty_do_write+0xde>
c0007ba0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0007ba4:	0f 85 5e ff ff ff    	jne    c0007b08 <tty_do_write+0x71>
c0007baa:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
c0007bb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0007bb4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007bba:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007bbd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007bc0:	8b 00                	mov    (%eax),%eax
c0007bc2:	83 ec 04             	sub    $0x4,%esp
c0007bc5:	50                   	push   %eax
c0007bc6:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0007bcc:	50                   	push   %eax
c0007bcd:	6a 01                	push   $0x1
c0007bcf:	e8 f4 c3 ff ff       	call   c0003fc8 <send_rec>
c0007bd4:	83 c4 10             	add    $0x10,%esp
c0007bd7:	89 dc                	mov    %ebx,%esp
c0007bd9:	90                   	nop
c0007bda:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0007bdd:	c9                   	leave  
c0007bde:	c3                   	ret    

c0007bdf <init_screen>:
c0007bdf:	55                   	push   %ebp
c0007be0:	89 e5                	mov    %esp,%ebp
c0007be2:	83 ec 10             	sub    $0x10,%esp
c0007be5:	8b 45 08             	mov    0x8(%ebp),%eax
c0007be8:	2d 00 ed 00 c0       	sub    $0xc000ed00,%eax
c0007bed:	c1 f8 02             	sar    $0x2,%eax
c0007bf0:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c0007bf6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007bf9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007bfc:	c1 e0 04             	shl    $0x4,%eax
c0007bff:	8d 90 40 0e 01 c0    	lea    -0x3ffef1c0(%eax),%edx
c0007c05:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c08:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0007c0e:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0007c15:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c18:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
c0007c1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007c21:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c0007c26:	f7 e2                	mul    %edx
c0007c28:	89 d0                	mov    %edx,%eax
c0007c2a:	d1 e8                	shr    %eax
c0007c2c:	89 41 04             	mov    %eax,0x4(%ecx)
c0007c2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c32:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007c38:	8b 50 04             	mov    0x4(%eax),%edx
c0007c3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c3e:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007c44:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0007c48:	89 10                	mov    %edx,(%eax)
c0007c4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c4d:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0007c53:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c56:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007c5c:	8b 12                	mov    (%edx),%edx
c0007c5e:	89 50 08             	mov    %edx,0x8(%eax)
c0007c61:	8b 55 08             	mov    0x8(%ebp),%edx
c0007c64:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
c0007c6a:	8b 40 08             	mov    0x8(%eax),%eax
c0007c6d:	89 42 0c             	mov    %eax,0xc(%edx)
c0007c70:	90                   	nop
c0007c71:	c9                   	leave  
c0007c72:	c3                   	ret    

c0007c73 <init_tty>:
c0007c73:	55                   	push   %ebp
c0007c74:	89 e5                	mov    %esp,%ebp
c0007c76:	83 ec 18             	sub    $0x18,%esp
c0007c79:	c7 45 f4 00 ed 00 c0 	movl   $0xc000ed00,-0xc(%ebp)
c0007c80:	eb 7a                	jmp    c0007cfc <init_tty+0x89>
c0007c82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c85:	8d 50 08             	lea    0x8(%eax),%edx
c0007c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c8b:	89 50 04             	mov    %edx,0x4(%eax)
c0007c8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c91:	8b 50 04             	mov    0x4(%eax),%edx
c0007c94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c97:	89 10                	mov    %edx,(%eax)
c0007c99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c9c:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0007ca3:	00 00 00 
c0007ca6:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ca9:	e8 31 ff ff ff       	call   c0007bdf <init_screen>
c0007cae:	83 c4 04             	add    $0x4,%esp
c0007cb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007cb4:	2d 00 ed 00 c0       	sub    $0xc000ed00,%eax
c0007cb9:	85 c0                	test   %eax,%eax
c0007cbb:	7e 38                	jle    c0007cf5 <init_tty+0x82>
c0007cbd:	83 ec 08             	sub    $0x8,%esp
c0007cc0:	6a 23                	push   $0x23
c0007cc2:	ff 75 f4             	pushl  -0xc(%ebp)
c0007cc5:	e8 64 f9 ff ff       	call   c000762e <out_char>
c0007cca:	83 c4 10             	add    $0x10,%esp
c0007ccd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007cd0:	05 e4 8e 01 00       	add    $0x18ee4,%eax
c0007cd5:	2d 00 ed 00 c0       	sub    $0xc000ed00,%eax
c0007cda:	c1 f8 02             	sar    $0x2,%eax
c0007cdd:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c0007ce3:	0f b6 c0             	movzbl %al,%eax
c0007ce6:	83 ec 08             	sub    $0x8,%esp
c0007ce9:	50                   	push   %eax
c0007cea:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ced:	e8 3c f9 ff ff       	call   c000762e <out_char>
c0007cf2:	83 c4 10             	add    $0x10,%esp
c0007cf5:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0007cfc:	b8 6c 05 01 c0       	mov    $0xc001056c,%eax
c0007d01:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0007d04:	0f 82 78 ff ff ff    	jb     c0007c82 <init_tty+0xf>
c0007d0a:	90                   	nop
c0007d0b:	c9                   	leave  
c0007d0c:	c3                   	ret    

c0007d0d <TaskTTY>:
c0007d0d:	55                   	push   %ebp
c0007d0e:	89 e5                	mov    %esp,%ebp
c0007d10:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0007d16:	e8 58 ff ff ff       	call   c0007c73 <init_tty>
c0007d1b:	83 ec 0c             	sub    $0xc,%esp
c0007d1e:	6a 01                	push   $0x1
c0007d20:	e8 bf f6 ff ff       	call   c00073e4 <select_console>
c0007d25:	83 c4 10             	add    $0x10,%esp
c0007d28:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007d2f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007d36:	c7 45 f4 00 ed 00 c0 	movl   $0xc000ed00,-0xc(%ebp)
c0007d3d:	eb 30                	jmp    c0007d6f <TaskTTY+0x62>
c0007d3f:	83 ec 0c             	sub    $0xc,%esp
c0007d42:	ff 75 f4             	pushl  -0xc(%ebp)
c0007d45:	e8 8b fa ff ff       	call   c00077d5 <tty_dev_read>
c0007d4a:	83 c4 10             	add    $0x10,%esp
c0007d4d:	83 ec 0c             	sub    $0xc,%esp
c0007d50:	ff 75 f4             	pushl  -0xc(%ebp)
c0007d53:	e8 a7 fa ff ff       	call   c00077ff <tty_dev_write>
c0007d58:	83 c4 10             	add    $0x10,%esp
c0007d5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d5e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0007d64:	85 c0                	test   %eax,%eax
c0007d66:	75 d7                	jne    c0007d3f <TaskTTY+0x32>
c0007d68:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0007d6f:	b8 6c 05 01 c0       	mov    $0xc001056c,%eax
c0007d74:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0007d77:	72 c6                	jb     c0007d3f <TaskTTY+0x32>
c0007d79:	83 ec 04             	sub    $0x4,%esp
c0007d7c:	6a 0b                	push   $0xb
c0007d7e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0007d84:	50                   	push   %eax
c0007d85:	6a 02                	push   $0x2
c0007d87:	e8 3c c2 ff ff       	call   c0003fc8 <send_rec>
c0007d8c:	83 c4 10             	add    $0x10,%esp
c0007d8f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007d92:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007d95:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
c0007d9c:	74 28                	je     c0007dc6 <TaskTTY+0xb9>
c0007d9e:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
c0007da5:	7f 0b                	jg     c0007db2 <TaskTTY+0xa5>
c0007da7:	81 7d e8 d1 07 00 00 	cmpl   $0x7d1,-0x18(%ebp)
c0007dae:	74 56                	je     c0007e06 <TaskTTY+0xf9>
c0007db0:	eb 55                	jmp    c0007e07 <TaskTTY+0xfa>
c0007db2:	81 7d e8 d3 07 00 00 	cmpl   $0x7d3,-0x18(%ebp)
c0007db9:	74 25                	je     c0007de0 <TaskTTY+0xd3>
c0007dbb:	81 7d e8 d5 07 00 00 	cmpl   $0x7d5,-0x18(%ebp)
c0007dc2:	74 36                	je     c0007dfa <TaskTTY+0xed>
c0007dc4:	eb 41                	jmp    c0007e07 <TaskTTY+0xfa>
c0007dc6:	a1 80 e6 00 c0       	mov    0xc000e680,%eax
c0007dcb:	83 ec 08             	sub    $0x8,%esp
c0007dce:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
c0007dd4:	52                   	push   %edx
c0007dd5:	50                   	push   %eax
c0007dd6:	e8 2b fc ff ff       	call   c0007a06 <tty_do_read>
c0007ddb:	83 c4 10             	add    $0x10,%esp
c0007dde:	eb 27                	jmp    c0007e07 <TaskTTY+0xfa>
c0007de0:	a1 80 e6 00 c0       	mov    0xc000e680,%eax
c0007de5:	83 ec 08             	sub    $0x8,%esp
c0007de8:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
c0007dee:	52                   	push   %edx
c0007def:	50                   	push   %eax
c0007df0:	e8 a2 fc ff ff       	call   c0007a97 <tty_do_write>
c0007df5:	83 c4 10             	add    $0x10,%esp
c0007df8:	eb 0d                	jmp    c0007e07 <TaskTTY+0xfa>
c0007dfa:	c7 05 00 06 01 c0 00 	movl   $0x0,0xc0010600
c0007e01:	00 00 00 
c0007e04:	eb 01                	jmp    c0007e07 <TaskTTY+0xfa>
c0007e06:	90                   	nop
c0007e07:	e9 2a ff ff ff       	jmp    c0007d36 <TaskTTY+0x29>

c0007e0c <keyboard_handler>:
c0007e0c:	55                   	push   %ebp
c0007e0d:	89 e5                	mov    %esp,%ebp
c0007e0f:	83 ec 18             	sub    $0x18,%esp
c0007e12:	c7 05 00 06 01 c0 01 	movl   $0x1,0xc0010600
c0007e19:	00 00 00 
c0007e1c:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0007e23:	a1 e8 ea 00 c0       	mov    0xc000eae8,%eax
c0007e28:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0007e2d:	7f 5c                	jg     c0007e8b <keyboard_handler+0x7f>
c0007e2f:	e8 cd 99 ff ff       	call   c0001801 <disable_int>
c0007e34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e37:	0f b7 c0             	movzwl %ax,%eax
c0007e3a:	83 ec 0c             	sub    $0xc,%esp
c0007e3d:	50                   	push   %eax
c0007e3e:	e8 90 99 ff ff       	call   c00017d3 <in_byte>
c0007e43:	83 c4 10             	add    $0x10,%esp
c0007e46:	88 45 f3             	mov    %al,-0xd(%ebp)
c0007e49:	a1 e0 ea 00 c0       	mov    0xc000eae0,%eax
c0007e4e:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0007e52:	88 10                	mov    %dl,(%eax)
c0007e54:	a1 e0 ea 00 c0       	mov    0xc000eae0,%eax
c0007e59:	83 c0 01             	add    $0x1,%eax
c0007e5c:	a3 e0 ea 00 c0       	mov    %eax,0xc000eae0
c0007e61:	a1 e8 ea 00 c0       	mov    0xc000eae8,%eax
c0007e66:	83 c0 01             	add    $0x1,%eax
c0007e69:	a3 e8 ea 00 c0       	mov    %eax,0xc000eae8
c0007e6e:	a1 e0 ea 00 c0       	mov    0xc000eae0,%eax
c0007e73:	ba ec ec 00 c0       	mov    $0xc000ecec,%edx
c0007e78:	39 d0                	cmp    %edx,%eax
c0007e7a:	72 0a                	jb     c0007e86 <keyboard_handler+0x7a>
c0007e7c:	c7 05 e0 ea 00 c0 ec 	movl   $0xc000eaec,0xc000eae0
c0007e83:	ea 00 c0 
c0007e86:	e8 78 99 ff ff       	call   c0001803 <enable_int>
c0007e8b:	90                   	nop
c0007e8c:	c9                   	leave  
c0007e8d:	c3                   	ret    

c0007e8e <read_from_keyboard_buf>:
c0007e8e:	55                   	push   %ebp
c0007e8f:	89 e5                	mov    %esp,%ebp
c0007e91:	83 ec 18             	sub    $0x18,%esp
c0007e94:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0007e98:	a1 e8 ea 00 c0       	mov    0xc000eae8,%eax
c0007e9d:	85 c0                	test   %eax,%eax
c0007e9f:	7e 47                	jle    c0007ee8 <read_from_keyboard_buf+0x5a>
c0007ea1:	e8 5b 99 ff ff       	call   c0001801 <disable_int>
c0007ea6:	a1 e4 ea 00 c0       	mov    0xc000eae4,%eax
c0007eab:	0f b6 00             	movzbl (%eax),%eax
c0007eae:	88 45 f7             	mov    %al,-0x9(%ebp)
c0007eb1:	a1 e4 ea 00 c0       	mov    0xc000eae4,%eax
c0007eb6:	83 c0 01             	add    $0x1,%eax
c0007eb9:	a3 e4 ea 00 c0       	mov    %eax,0xc000eae4
c0007ebe:	a1 e8 ea 00 c0       	mov    0xc000eae8,%eax
c0007ec3:	83 e8 01             	sub    $0x1,%eax
c0007ec6:	a3 e8 ea 00 c0       	mov    %eax,0xc000eae8
c0007ecb:	a1 e4 ea 00 c0       	mov    0xc000eae4,%eax
c0007ed0:	ba ec ec 00 c0       	mov    $0xc000ecec,%edx
c0007ed5:	39 d0                	cmp    %edx,%eax
c0007ed7:	72 0a                	jb     c0007ee3 <read_from_keyboard_buf+0x55>
c0007ed9:	c7 05 e4 ea 00 c0 ec 	movl   $0xc000eaec,0xc000eae4
c0007ee0:	ea 00 c0 
c0007ee3:	e8 1b 99 ff ff       	call   c0001803 <enable_int>
c0007ee8:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0007eec:	c9                   	leave  
c0007eed:	c3                   	ret    

c0007eee <keyboard_read>:
c0007eee:	55                   	push   %ebp
c0007eef:	89 e5                	mov    %esp,%ebp
c0007ef1:	83 ec 28             	sub    $0x28,%esp
c0007ef4:	90                   	nop
c0007ef5:	a1 e8 ea 00 c0       	mov    0xc000eae8,%eax
c0007efa:	85 c0                	test   %eax,%eax
c0007efc:	7e f7                	jle    c0007ef5 <keyboard_read+0x7>
c0007efe:	e8 8b ff ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007f03:	88 45 ea             	mov    %al,-0x16(%ebp)
c0007f06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007f0d:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0007f11:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0007f15:	75 5a                	jne    c0007f71 <keyboard_read+0x83>
c0007f17:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0007f1b:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0007f1f:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0007f23:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0007f27:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0007f2b:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0007f2f:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0007f33:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0007f3a:	eb 20                	jmp    c0007f5c <keyboard_read+0x6e>
c0007f3c:	e8 4d ff ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007f41:	89 c1                	mov    %eax,%ecx
c0007f43:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0007f46:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007f49:	01 d0                	add    %edx,%eax
c0007f4b:	0f b6 00             	movzbl (%eax),%eax
c0007f4e:	38 c1                	cmp    %al,%cl
c0007f50:	74 06                	je     c0007f58 <keyboard_read+0x6a>
c0007f52:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0007f56:	eb 0a                	jmp    c0007f62 <keyboard_read+0x74>
c0007f58:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007f5c:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0007f60:	7e da                	jle    c0007f3c <keyboard_read+0x4e>
c0007f62:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0007f66:	74 68                	je     c0007fd0 <keyboard_read+0xe2>
c0007f68:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0007f6f:	eb 5f                	jmp    c0007fd0 <keyboard_read+0xe2>
c0007f71:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0007f75:	75 59                	jne    c0007fd0 <keyboard_read+0xe2>
c0007f77:	e8 12 ff ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007f7c:	3c 2a                	cmp    $0x2a,%al
c0007f7e:	75 1d                	jne    c0007f9d <keyboard_read+0xaf>
c0007f80:	e8 09 ff ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007f85:	3c e0                	cmp    $0xe0,%al
c0007f87:	75 14                	jne    c0007f9d <keyboard_read+0xaf>
c0007f89:	e8 00 ff ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007f8e:	3c 37                	cmp    $0x37,%al
c0007f90:	75 0b                	jne    c0007f9d <keyboard_read+0xaf>
c0007f92:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0007f99:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0007f9d:	e8 ec fe ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007fa2:	3c b7                	cmp    $0xb7,%al
c0007fa4:	75 1d                	jne    c0007fc3 <keyboard_read+0xd5>
c0007fa6:	e8 e3 fe ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007fab:	3c e0                	cmp    $0xe0,%al
c0007fad:	75 14                	jne    c0007fc3 <keyboard_read+0xd5>
c0007faf:	e8 da fe ff ff       	call   c0007e8e <read_from_keyboard_buf>
c0007fb4:	3c aa                	cmp    $0xaa,%al
c0007fb6:	75 0b                	jne    c0007fc3 <keyboard_read+0xd5>
c0007fb8:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0007fbf:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0007fc3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007fc7:	75 07                	jne    c0007fd0 <keyboard_read+0xe2>
c0007fc9:	c6 05 84 e6 00 c0 01 	movb   $0x1,0xc000e684
c0007fd0:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0007fd7:	0f 84 8d 00 00 00    	je     c000806a <keyboard_read+0x17c>
c0007fdd:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0007fe4:	0f 84 80 00 00 00    	je     c000806a <keyboard_read+0x17c>
c0007fea:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0007fee:	0f 94 c2             	sete   %dl
c0007ff1:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0007ff5:	0f 94 c0             	sete   %al
c0007ff8:	09 d0                	or     %edx,%eax
c0007ffa:	84 c0                	test   %al,%al
c0007ffc:	74 07                	je     c0008005 <keyboard_read+0x117>
c0007ffe:	c6 05 04 06 01 c0 01 	movb   $0x1,0xc0010604
c0008005:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0008009:	f7 d0                	not    %eax
c000800b:	c0 e8 07             	shr    $0x7,%al
c000800e:	88 45 e9             	mov    %al,-0x17(%ebp)
c0008011:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0008015:	74 53                	je     c000806a <keyboard_read+0x17c>
c0008017:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c000801b:	74 4d                	je     c000806a <keyboard_read+0x17c>
c000801d:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0008021:	0f b6 05 04 06 01 c0 	movzbl 0xc0010604,%eax
c0008028:	3c 01                	cmp    $0x1,%al
c000802a:	75 04                	jne    c0008030 <keyboard_read+0x142>
c000802c:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0008030:	0f b6 05 84 e6 00 c0 	movzbl 0xc000e684,%eax
c0008037:	84 c0                	test   %al,%al
c0008039:	74 04                	je     c000803f <keyboard_read+0x151>
c000803b:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c000803f:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0008043:	89 d0                	mov    %edx,%eax
c0008045:	01 c0                	add    %eax,%eax
c0008047:	01 c2                	add    %eax,%edx
c0008049:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c000804d:	01 d0                	add    %edx,%eax
c000804f:	8b 04 85 60 d0 00 c0 	mov    -0x3fff2fa0(,%eax,4),%eax
c0008056:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008059:	83 ec 08             	sub    $0x8,%esp
c000805c:	ff 75 f4             	pushl  -0xc(%ebp)
c000805f:	ff 75 08             	pushl  0x8(%ebp)
c0008062:	e8 1a 00 00 00       	call   c0008081 <in_process>
c0008067:	83 c4 10             	add    $0x10,%esp
c000806a:	90                   	nop
c000806b:	c9                   	leave  
c000806c:	c3                   	ret    

c000806d <init_keyboard_handler>:
c000806d:	55                   	push   %ebp
c000806e:	89 e5                	mov    %esp,%ebp
c0008070:	c6 05 84 e6 00 c0 00 	movb   $0x0,0xc000e684
c0008077:	c6 05 04 06 01 c0 00 	movb   $0x0,0xc0010604
c000807e:	90                   	nop
c000807f:	5d                   	pop    %ebp
c0008080:	c3                   	ret    

c0008081 <in_process>:
c0008081:	55                   	push   %ebp
c0008082:	89 e5                	mov    %esp,%ebp
c0008084:	83 ec 18             	sub    $0x18,%esp
c0008087:	83 ec 04             	sub    $0x4,%esp
c000808a:	6a 02                	push   $0x2
c000808c:	6a 00                	push   $0x0
c000808e:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0008091:	50                   	push   %eax
c0008092:	e8 18 21 00 00       	call   c000a1af <Memset>
c0008097:	83 c4 10             	add    $0x10,%esp
c000809a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000809d:	25 00 01 00 00       	and    $0x100,%eax
c00080a2:	85 c0                	test   %eax,%eax
c00080a4:	75 28                	jne    c00080ce <in_process+0x4d>
c00080a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00080a9:	0f b6 c0             	movzbl %al,%eax
c00080ac:	83 ec 08             	sub    $0x8,%esp
c00080af:	50                   	push   %eax
c00080b0:	ff 75 08             	pushl  0x8(%ebp)
c00080b3:	e8 5d f4 ff ff       	call   c0007515 <put_key>
c00080b8:	83 c4 10             	add    $0x10,%esp
c00080bb:	c6 05 84 e6 00 c0 00 	movb   $0x0,0xc000e684
c00080c2:	c6 05 04 06 01 c0 00 	movb   $0x0,0xc0010604
c00080c9:	e9 42 01 00 00       	jmp    c0008210 <in_process+0x18f>
c00080ce:	0f b6 05 04 06 01 c0 	movzbl 0xc0010604,%eax
c00080d5:	84 c0                	test   %al,%al
c00080d7:	0f 84 a9 00 00 00    	je     c0008186 <in_process+0x105>
c00080dd:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c00080e1:	0f 84 9f 00 00 00    	je     c0008186 <in_process+0x105>
c00080e7:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c00080eb:	0f 84 95 00 00 00    	je     c0008186 <in_process+0x105>
c00080f1:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00080f8:	74 64                	je     c000815e <in_process+0xdd>
c00080fa:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0008101:	77 0b                	ja     c000810e <in_process+0x8d>
c0008103:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c000810a:	74 64                	je     c0008170 <in_process+0xef>
c000810c:	eb 73                	jmp    c0008181 <in_process+0x100>
c000810e:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0008115:	74 0b                	je     c0008122 <in_process+0xa1>
c0008117:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c000811e:	74 20                	je     c0008140 <in_process+0xbf>
c0008120:	eb 5f                	jmp    c0008181 <in_process+0x100>
c0008122:	83 ec 0c             	sub    $0xc,%esp
c0008125:	ff 75 08             	pushl  0x8(%ebp)
c0008128:	e8 54 f4 ff ff       	call   c0007581 <scroll_up>
c000812d:	83 c4 10             	add    $0x10,%esp
c0008130:	c6 05 04 06 01 c0 00 	movb   $0x0,0xc0010604
c0008137:	c6 05 84 e6 00 c0 00 	movb   $0x0,0xc000e684
c000813e:	eb 41                	jmp    c0008181 <in_process+0x100>
c0008140:	83 ec 0c             	sub    $0xc,%esp
c0008143:	ff 75 08             	pushl  0x8(%ebp)
c0008146:	e8 78 f4 ff ff       	call   c00075c3 <scroll_down>
c000814b:	83 c4 10             	add    $0x10,%esp
c000814e:	c6 05 04 06 01 c0 00 	movb   $0x0,0xc0010604
c0008155:	c6 05 84 e6 00 c0 00 	movb   $0x0,0xc000e684
c000815c:	eb 23                	jmp    c0008181 <in_process+0x100>
c000815e:	83 ec 08             	sub    $0x8,%esp
c0008161:	6a 0a                	push   $0xa
c0008163:	ff 75 08             	pushl  0x8(%ebp)
c0008166:	e8 c3 f4 ff ff       	call   c000762e <out_char>
c000816b:	83 c4 10             	add    $0x10,%esp
c000816e:	eb 11                	jmp    c0008181 <in_process+0x100>
c0008170:	83 ec 08             	sub    $0x8,%esp
c0008173:	6a 08                	push   $0x8
c0008175:	ff 75 08             	pushl  0x8(%ebp)
c0008178:	e8 b1 f4 ff ff       	call   c000762e <out_char>
c000817d:	83 c4 10             	add    $0x10,%esp
c0008180:	90                   	nop
c0008181:	e9 8a 00 00 00       	jmp    c0008210 <in_process+0x18f>
c0008186:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c000818d:	74 55                	je     c00081e4 <in_process+0x163>
c000818f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0008196:	77 14                	ja     c00081ac <in_process+0x12b>
c0008198:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c000819f:	74 31                	je     c00081d2 <in_process+0x151>
c00081a1:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00081a8:	74 16                	je     c00081c0 <in_process+0x13f>
c00081aa:	eb 64                	jmp    c0008210 <in_process+0x18f>
c00081ac:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c00081b3:	74 3e                	je     c00081f3 <in_process+0x172>
c00081b5:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c00081bc:	74 44                	je     c0008202 <in_process+0x181>
c00081be:	eb 50                	jmp    c0008210 <in_process+0x18f>
c00081c0:	83 ec 08             	sub    $0x8,%esp
c00081c3:	6a 0a                	push   $0xa
c00081c5:	ff 75 08             	pushl  0x8(%ebp)
c00081c8:	e8 48 f3 ff ff       	call   c0007515 <put_key>
c00081cd:	83 c4 10             	add    $0x10,%esp
c00081d0:	eb 3e                	jmp    c0008210 <in_process+0x18f>
c00081d2:	83 ec 08             	sub    $0x8,%esp
c00081d5:	6a 08                	push   $0x8
c00081d7:	ff 75 08             	pushl  0x8(%ebp)
c00081da:	e8 36 f3 ff ff       	call   c0007515 <put_key>
c00081df:	83 c4 10             	add    $0x10,%esp
c00081e2:	eb 2c                	jmp    c0008210 <in_process+0x18f>
c00081e4:	83 ec 0c             	sub    $0xc,%esp
c00081e7:	6a 00                	push   $0x0
c00081e9:	e8 f6 f1 ff ff       	call   c00073e4 <select_console>
c00081ee:	83 c4 10             	add    $0x10,%esp
c00081f1:	eb 1d                	jmp    c0008210 <in_process+0x18f>
c00081f3:	83 ec 0c             	sub    $0xc,%esp
c00081f6:	6a 01                	push   $0x1
c00081f8:	e8 e7 f1 ff ff       	call   c00073e4 <select_console>
c00081fd:	83 c4 10             	add    $0x10,%esp
c0008200:	eb 0e                	jmp    c0008210 <in_process+0x18f>
c0008202:	83 ec 0c             	sub    $0xc,%esp
c0008205:	6a 02                	push   $0x2
c0008207:	e8 d8 f1 ff ff       	call   c00073e4 <select_console>
c000820c:	83 c4 10             	add    $0x10,%esp
c000820f:	90                   	nop
c0008210:	90                   	nop
c0008211:	c9                   	leave  
c0008212:	c3                   	ret    

c0008213 <open>:
c0008213:	55                   	push   %ebp
c0008214:	89 e5                	mov    %esp,%ebp
c0008216:	83 ec 78             	sub    $0x78,%esp
c0008219:	83 ec 04             	sub    $0x4,%esp
c000821c:	6a 6c                	push   $0x6c
c000821e:	6a 00                	push   $0x0
c0008220:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008223:	50                   	push   %eax
c0008224:	e8 86 1f 00 00       	call   c000a1af <Memset>
c0008229:	83 c4 10             	add    $0x10,%esp
c000822c:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0008233:	8b 45 08             	mov    0x8(%ebp),%eax
c0008236:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008239:	8b 45 0c             	mov    0xc(%ebp),%eax
c000823c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000823f:	83 ec 0c             	sub    $0xc,%esp
c0008242:	ff 75 08             	pushl  0x8(%ebp)
c0008245:	e8 9e 1f 00 00       	call   c000a1e8 <Strlen>
c000824a:	83 c4 10             	add    $0x10,%esp
c000824d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0008250:	83 ec 04             	sub    $0x4,%esp
c0008253:	6a 03                	push   $0x3
c0008255:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008258:	50                   	push   %eax
c0008259:	6a 03                	push   $0x3
c000825b:	e8 68 bd ff ff       	call   c0003fc8 <send_rec>
c0008260:	83 c4 10             	add    $0x10,%esp
c0008263:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008266:	c9                   	leave  
c0008267:	c3                   	ret    

c0008268 <read>:
c0008268:	55                   	push   %ebp
c0008269:	89 e5                	mov    %esp,%ebp
c000826b:	83 ec 78             	sub    $0x78,%esp
c000826e:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
c0008275:	8b 45 08             	mov    0x8(%ebp),%eax
c0008278:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000827b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000827e:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0008281:	8b 45 10             	mov    0x10(%ebp),%eax
c0008284:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008287:	83 ec 04             	sub    $0x4,%esp
c000828a:	6a 03                	push   $0x3
c000828c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000828f:	50                   	push   %eax
c0008290:	6a 03                	push   $0x3
c0008292:	e8 31 bd ff ff       	call   c0003fc8 <send_rec>
c0008297:	83 c4 10             	add    $0x10,%esp
c000829a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000829d:	c9                   	leave  
c000829e:	c3                   	ret    

c000829f <write>:
c000829f:	55                   	push   %ebp
c00082a0:	89 e5                	mov    %esp,%ebp
c00082a2:	83 ec 78             	sub    $0x78,%esp
c00082a5:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
c00082ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00082af:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00082b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00082b5:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00082b8:	8b 45 10             	mov    0x10(%ebp),%eax
c00082bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00082be:	83 ec 04             	sub    $0x4,%esp
c00082c1:	6a 03                	push   $0x3
c00082c3:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00082c6:	50                   	push   %eax
c00082c7:	6a 03                	push   $0x3
c00082c9:	e8 fa bc ff ff       	call   c0003fc8 <send_rec>
c00082ce:	83 c4 10             	add    $0x10,%esp
c00082d1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00082d4:	c9                   	leave  
c00082d5:	c3                   	ret    

c00082d6 <close>:
c00082d6:	55                   	push   %ebp
c00082d7:	89 e5                	mov    %esp,%ebp
c00082d9:	83 ec 78             	sub    $0x78,%esp
c00082dc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00082e3:	8b 45 08             	mov    0x8(%ebp),%eax
c00082e6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00082e9:	83 ec 04             	sub    $0x4,%esp
c00082ec:	6a 03                	push   $0x3
c00082ee:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00082f1:	50                   	push   %eax
c00082f2:	6a 03                	push   $0x3
c00082f4:	e8 cf bc ff ff       	call   c0003fc8 <send_rec>
c00082f9:	83 c4 10             	add    $0x10,%esp
c00082fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00082ff:	83 f8 65             	cmp    $0x65,%eax
c0008302:	74 19                	je     c000831d <close+0x47>
c0008304:	6a 14                	push   $0x14
c0008306:	68 c5 a0 00 c0       	push   $0xc000a0c5
c000830b:	68 c5 a0 00 c0       	push   $0xc000a0c5
c0008310:	68 d1 a0 00 c0       	push   $0xc000a0d1
c0008315:	e8 36 b4 ff ff       	call   c0003750 <assertion_failure>
c000831a:	83 c4 10             	add    $0x10,%esp
c000831d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008320:	c9                   	leave  
c0008321:	c3                   	ret    

c0008322 <wait>:
c0008322:	55                   	push   %ebp
c0008323:	89 e5                	mov    %esp,%ebp
c0008325:	83 ec 78             	sub    $0x78,%esp
c0008328:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c000832f:	83 ec 04             	sub    $0x4,%esp
c0008332:	6a 04                	push   $0x4
c0008334:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008337:	50                   	push   %eax
c0008338:	6a 03                	push   $0x3
c000833a:	e8 89 bc ff ff       	call   c0003fc8 <send_rec>
c000833f:	83 c4 10             	add    $0x10,%esp
c0008342:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008345:	89 c2                	mov    %eax,%edx
c0008347:	8b 45 08             	mov    0x8(%ebp),%eax
c000834a:	89 10                	mov    %edx,(%eax)
c000834c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000834f:	83 f8 1a             	cmp    $0x1a,%eax
c0008352:	74 05                	je     c0008359 <wait+0x37>
c0008354:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008357:	eb 05                	jmp    c000835e <wait+0x3c>
c0008359:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000835e:	c9                   	leave  
c000835f:	c3                   	ret    

c0008360 <exit>:
c0008360:	55                   	push   %ebp
c0008361:	89 e5                	mov    %esp,%ebp
c0008363:	83 ec 78             	sub    $0x78,%esp
c0008366:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c000836d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008370:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008373:	83 ec 04             	sub    $0x4,%esp
c0008376:	6a 04                	push   $0x4
c0008378:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000837b:	50                   	push   %eax
c000837c:	6a 03                	push   $0x3
c000837e:	e8 45 bc ff ff       	call   c0003fc8 <send_rec>
c0008383:	83 c4 10             	add    $0x10,%esp
c0008386:	90                   	nop
c0008387:	c9                   	leave  
c0008388:	c3                   	ret    

c0008389 <fork>:
c0008389:	55                   	push   %ebp
c000838a:	89 e5                	mov    %esp,%ebp
c000838c:	83 ec 78             	sub    $0x78,%esp
c000838f:	83 ec 04             	sub    $0x4,%esp
c0008392:	6a 6c                	push   $0x6c
c0008394:	6a 00                	push   $0x0
c0008396:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008399:	50                   	push   %eax
c000839a:	e8 10 1e 00 00       	call   c000a1af <Memset>
c000839f:	83 c4 10             	add    $0x10,%esp
c00083a2:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00083a9:	83 ec 04             	sub    $0x4,%esp
c00083ac:	6a 04                	push   $0x4
c00083ae:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00083b1:	50                   	push   %eax
c00083b2:	6a 03                	push   $0x3
c00083b4:	e8 0f bc ff ff       	call   c0003fc8 <send_rec>
c00083b9:	83 c4 10             	add    $0x10,%esp
c00083bc:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00083c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00083c6:	85 c0                	test   %eax,%eax
c00083c8:	74 19                	je     c00083e3 <fork+0x5a>
c00083ca:	6a 15                	push   $0x15
c00083cc:	68 e9 a0 00 c0       	push   $0xc000a0e9
c00083d1:	68 e9 a0 00 c0       	push   $0xc000a0e9
c00083d6:	68 f4 a0 00 c0       	push   $0xc000a0f4
c00083db:	e8 70 b3 ff ff       	call   c0003750 <assertion_failure>
c00083e0:	83 c4 10             	add    $0x10,%esp
c00083e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083e6:	c9                   	leave  
c00083e7:	c3                   	ret    

c00083e8 <getpid>:
c00083e8:	55                   	push   %ebp
c00083e9:	89 e5                	mov    %esp,%ebp
c00083eb:	83 ec 78             	sub    $0x78,%esp
c00083ee:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c00083f5:	83 ec 04             	sub    $0x4,%esp
c00083f8:	6a 01                	push   $0x1
c00083fa:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00083fd:	50                   	push   %eax
c00083fe:	6a 03                	push   $0x3
c0008400:	e8 c3 bb ff ff       	call   c0003fc8 <send_rec>
c0008405:	83 c4 10             	add    $0x10,%esp
c0008408:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000840b:	c9                   	leave  
c000840c:	c3                   	ret    

c000840d <exec>:
c000840d:	55                   	push   %ebp
c000840e:	89 e5                	mov    %esp,%ebp
c0008410:	83 ec 78             	sub    $0x78,%esp
c0008413:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c000841a:	8b 45 08             	mov    0x8(%ebp),%eax
c000841d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008420:	83 ec 0c             	sub    $0xc,%esp
c0008423:	ff 75 08             	pushl  0x8(%ebp)
c0008426:	e8 bd 1d 00 00       	call   c000a1e8 <Strlen>
c000842b:	83 c4 10             	add    $0x10,%esp
c000842e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0008431:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0008438:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c000843f:	83 ec 04             	sub    $0x4,%esp
c0008442:	6a 04                	push   $0x4
c0008444:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008447:	50                   	push   %eax
c0008448:	6a 03                	push   $0x3
c000844a:	e8 79 bb ff ff       	call   c0003fc8 <send_rec>
c000844f:	83 c4 10             	add    $0x10,%esp
c0008452:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008455:	83 f8 65             	cmp    $0x65,%eax
c0008458:	74 19                	je     c0008473 <exec+0x66>
c000845a:	6a 1a                	push   $0x1a
c000845c:	68 04 a1 00 c0       	push   $0xc000a104
c0008461:	68 04 a1 00 c0       	push   $0xc000a104
c0008466:	68 0f a1 00 c0       	push   $0xc000a10f
c000846b:	e8 e0 b2 ff ff       	call   c0003750 <assertion_failure>
c0008470:	83 c4 10             	add    $0x10,%esp
c0008473:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008476:	c9                   	leave  
c0008477:	c3                   	ret    

c0008478 <execv>:
c0008478:	55                   	push   %ebp
c0008479:	89 e5                	mov    %esp,%ebp
c000847b:	57                   	push   %edi
c000847c:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0008482:	83 ec 04             	sub    $0x4,%esp
c0008485:	68 00 80 00 00       	push   $0x8000
c000848a:	6a 00                	push   $0x0
c000848c:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0008492:	50                   	push   %eax
c0008493:	e8 17 1d 00 00       	call   c000a1af <Memset>
c0008498:	83 c4 10             	add    $0x10,%esp
c000849b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000849e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00084a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00084a8:	eb 0d                	jmp    c00084b7 <execv+0x3f>
c00084aa:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00084ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00084b1:	83 c0 04             	add    $0x4,%eax
c00084b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00084b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00084ba:	8b 00                	mov    (%eax),%eax
c00084bc:	85 c0                	test   %eax,%eax
c00084be:	75 ea                	jne    c00084aa <execv+0x32>
c00084c0:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00084c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00084c9:	01 d0                	add    %edx,%eax
c00084cb:	c6 00 00             	movb   $0x0,(%eax)
c00084ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00084d1:	83 c0 04             	add    $0x4,%eax
c00084d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00084d7:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00084dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00084e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00084e3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00084e6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00084ed:	eb 64                	jmp    c0008553 <execv+0xdb>
c00084ef:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00084f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00084f8:	01 c2                	add    %eax,%edx
c00084fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00084fd:	89 10                	mov    %edx,(%eax)
c00084ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008502:	8b 00                	mov    (%eax),%eax
c0008504:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c000850a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000850d:	01 ca                	add    %ecx,%edx
c000850f:	83 ec 08             	sub    $0x8,%esp
c0008512:	50                   	push   %eax
c0008513:	52                   	push   %edx
c0008514:	e8 b5 1c 00 00       	call   c000a1ce <Strcpy>
c0008519:	83 c4 10             	add    $0x10,%esp
c000851c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000851f:	8b 00                	mov    (%eax),%eax
c0008521:	83 ec 0c             	sub    $0xc,%esp
c0008524:	50                   	push   %eax
c0008525:	e8 be 1c 00 00       	call   c000a1e8 <Strlen>
c000852a:	83 c4 10             	add    $0x10,%esp
c000852d:	01 45 f0             	add    %eax,-0x10(%ebp)
c0008530:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0008536:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008539:	01 d0                	add    %edx,%eax
c000853b:	c6 00 00             	movb   $0x0,(%eax)
c000853e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008541:	83 c0 01             	add    $0x1,%eax
c0008544:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008547:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c000854b:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000854f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008553:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008556:	8b 00                	mov    (%eax),%eax
c0008558:	85 c0                	test   %eax,%eax
c000855a:	75 93                	jne    c00084ef <execv+0x77>
c000855c:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0008562:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008565:	eb 04                	jmp    c000856b <execv+0xf3>
c0008567:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c000856b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000856e:	8b 00                	mov    (%eax),%eax
c0008570:	85 c0                	test   %eax,%eax
c0008572:	75 f3                	jne    c0008567 <execv+0xef>
c0008574:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c000857a:	b8 00 00 00 00       	mov    $0x0,%eax
c000857f:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0008584:	89 d7                	mov    %edx,%edi
c0008586:	f3 ab                	rep stos %eax,%es:(%edi)
c0008588:	c7 85 4c 7f ff ff 27 	movl   $0xc000a127,-0x80b4(%ebp)
c000858f:	a1 00 c0 
c0008592:	c7 85 50 7f ff ff 2e 	movl   $0xc000a12e,-0x80b0(%ebp)
c0008599:	a1 00 c0 
c000859c:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c00085a3:	00 00 00 
c00085a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00085a9:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c00085af:	83 ec 0c             	sub    $0xc,%esp
c00085b2:	ff 75 08             	pushl  0x8(%ebp)
c00085b5:	e8 2e 1c 00 00       	call   c000a1e8 <Strlen>
c00085ba:	83 c4 10             	add    $0x10,%esp
c00085bd:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c00085c3:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00085c9:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c00085cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00085d2:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c00085d8:	83 ec 04             	sub    $0x4,%esp
c00085db:	6a 04                	push   $0x4
c00085dd:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c00085e3:	50                   	push   %eax
c00085e4:	6a 03                	push   $0x3
c00085e6:	e8 dd b9 ff ff       	call   c0003fc8 <send_rec>
c00085eb:	83 c4 10             	add    $0x10,%esp
c00085ee:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c00085f4:	83 f8 65             	cmp    $0x65,%eax
c00085f7:	74 19                	je     c0008612 <execv+0x19a>
c00085f9:	6a 73                	push   $0x73
c00085fb:	68 04 a1 00 c0       	push   $0xc000a104
c0008600:	68 04 a1 00 c0       	push   $0xc000a104
c0008605:	68 0f a1 00 c0       	push   $0xc000a10f
c000860a:	e8 41 b1 ff ff       	call   c0003750 <assertion_failure>
c000860f:	83 c4 10             	add    $0x10,%esp
c0008612:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0008618:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000861b:	c9                   	leave  
c000861c:	c3                   	ret    

c000861d <execl>:
c000861d:	55                   	push   %ebp
c000861e:	89 e5                	mov    %esp,%ebp
c0008620:	83 ec 18             	sub    $0x18,%esp
c0008623:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008626:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008629:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000862c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000862f:	83 ec 08             	sub    $0x8,%esp
c0008632:	ff 75 f0             	pushl  -0x10(%ebp)
c0008635:	ff 75 08             	pushl  0x8(%ebp)
c0008638:	e8 3b fe ff ff       	call   c0008478 <execv>
c000863d:	83 c4 10             	add    $0x10,%esp
c0008640:	c9                   	leave  
c0008641:	c3                   	ret    

c0008642 <TaskMM>:
c0008642:	55                   	push   %ebp
c0008643:	89 e5                	mov    %esp,%ebp
c0008645:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c000864b:	83 ec 04             	sub    $0x4,%esp
c000864e:	6a 0b                	push   $0xb
c0008650:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0008656:	50                   	push   %eax
c0008657:	6a 02                	push   $0x2
c0008659:	e8 6a b9 ff ff       	call   c0003fc8 <send_rec>
c000865e:	83 c4 10             	add    $0x10,%esp
c0008661:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0008667:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000866a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0008670:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008673:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000867a:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
c0008681:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0008688:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
c000868f:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0008693:	74 4e                	je     c00086e3 <TaskMM+0xa1>
c0008695:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0008699:	7f 08                	jg     c00086a3 <TaskMM+0x61>
c000869b:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c000869f:	74 27                	je     c00086c8 <TaskMM+0x86>
c00086a1:	eb 79                	jmp    c000871c <TaskMM+0xda>
c00086a3:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c00086a7:	74 08                	je     c00086b1 <TaskMM+0x6f>
c00086a9:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
c00086ad:	74 52                	je     c0008701 <TaskMM+0xbf>
c00086af:	eb 6b                	jmp    c000871c <TaskMM+0xda>
c00086b1:	83 ec 0c             	sub    $0xc,%esp
c00086b4:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c00086ba:	50                   	push   %eax
c00086bb:	e8 f6 03 00 00       	call   c0008ab6 <do_fork>
c00086c0:	83 c4 10             	add    $0x10,%esp
c00086c3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00086c6:	eb 65                	jmp    c000872d <TaskMM+0xeb>
c00086c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00086cf:	83 ec 0c             	sub    $0xc,%esp
c00086d2:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c00086d8:	50                   	push   %eax
c00086d9:	e8 a8 00 00 00       	call   c0008786 <do_exec>
c00086de:	83 c4 10             	add    $0x10,%esp
c00086e1:	eb 4a                	jmp    c000872d <TaskMM+0xeb>
c00086e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00086ea:	83 ec 08             	sub    $0x8,%esp
c00086ed:	ff 75 e4             	pushl  -0x1c(%ebp)
c00086f0:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c00086f6:	50                   	push   %eax
c00086f7:	e8 be 05 00 00       	call   c0008cba <do_exit>
c00086fc:	83 c4 10             	add    $0x10,%esp
c00086ff:	eb 2c                	jmp    c000872d <TaskMM+0xeb>
c0008701:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008708:	83 ec 0c             	sub    $0xc,%esp
c000870b:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0008711:	50                   	push   %eax
c0008712:	e8 9f 06 00 00       	call   c0008db6 <do_wait>
c0008717:	83 c4 10             	add    $0x10,%esp
c000871a:	eb 11                	jmp    c000872d <TaskMM+0xeb>
c000871c:	83 ec 0c             	sub    $0xc,%esp
c000871f:	68 35 a1 00 c0       	push   $0xc000a135
c0008724:	e8 09 b0 ff ff       	call   c0003732 <panic>
c0008729:	83 c4 10             	add    $0x10,%esp
c000872c:	90                   	nop
c000872d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008731:	0f 84 14 ff ff ff    	je     c000864b <TaskMM+0x9>
c0008737:	83 ec 04             	sub    $0x4,%esp
c000873a:	ff 75 ec             	pushl  -0x14(%ebp)
c000873d:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
c0008743:	50                   	push   %eax
c0008744:	6a 01                	push   $0x1
c0008746:	e8 7d b8 ff ff       	call   c0003fc8 <send_rec>
c000874b:	83 c4 10             	add    $0x10,%esp
c000874e:	e9 f8 fe ff ff       	jmp    c000864b <TaskMM+0x9>

c0008753 <alloc_mem>:
c0008753:	55                   	push   %ebp
c0008754:	89 e5                	mov    %esp,%ebp
c0008756:	83 ec 10             	sub    $0x10,%esp
c0008759:	8b 45 08             	mov    0x8(%ebp),%eax
c000875c:	83 e8 01             	sub    $0x1,%eax
c000875f:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0008765:	05 00 00 a0 00       	add    $0xa00000,%eax
c000876a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000876d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008770:	c9                   	leave  
c0008771:	c3                   	ret    

c0008772 <do_exec2>:
c0008772:	55                   	push   %ebp
c0008773:	89 e5                	mov    %esp,%ebp
c0008775:	83 ec 10             	sub    $0x10,%esp
c0008778:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c000877f:	b8 00 00 00 00       	mov    $0x0,%eax
c0008784:	c9                   	leave  
c0008785:	c3                   	ret    

c0008786 <do_exec>:
c0008786:	55                   	push   %ebp
c0008787:	89 e5                	mov    %esp,%ebp
c0008789:	56                   	push   %esi
c000878a:	53                   	push   %ebx
c000878b:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0008791:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0008798:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c000879f:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c00087a5:	83 ec 08             	sub    $0x8,%esp
c00087a8:	6a 00                	push   $0x0
c00087aa:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00087ad:	50                   	push   %eax
c00087ae:	e8 60 fa ff ff       	call   c0008213 <open>
c00087b3:	83 c4 10             	add    $0x10,%esp
c00087b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00087b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00087bc:	8b 00                	mov    (%eax),%eax
c00087be:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00087c1:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c00087c8:	83 ec 04             	sub    $0x4,%esp
c00087cb:	6a 0c                	push   $0xc
c00087cd:	6a 00                	push   $0x0
c00087cf:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00087d5:	50                   	push   %eax
c00087d6:	e8 d4 19 00 00       	call   c000a1af <Memset>
c00087db:	83 c4 10             	add    $0x10,%esp
c00087de:	8b 45 08             	mov    0x8(%ebp),%eax
c00087e1:	8b 40 30             	mov    0x30(%eax),%eax
c00087e4:	89 c6                	mov    %eax,%esi
c00087e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00087e9:	8b 40 34             	mov    0x34(%eax),%eax
c00087ec:	83 ec 08             	sub    $0x8,%esp
c00087ef:	50                   	push   %eax
c00087f0:	ff 75 d8             	pushl  -0x28(%ebp)
c00087f3:	e8 db e9 ff ff       	call   c00071d3 <v2l>
c00087f8:	83 c4 10             	add    $0x10,%esp
c00087fb:	89 c3                	mov    %eax,%ebx
c00087fd:	83 ec 08             	sub    $0x8,%esp
c0008800:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0008806:	50                   	push   %eax
c0008807:	6a 04                	push   $0x4
c0008809:	e8 c5 e9 ff ff       	call   c00071d3 <v2l>
c000880e:	83 c4 10             	add    $0x10,%esp
c0008811:	83 ec 04             	sub    $0x4,%esp
c0008814:	56                   	push   %esi
c0008815:	53                   	push   %ebx
c0008816:	50                   	push   %eax
c0008817:	e8 65 19 00 00       	call   c000a181 <Memcpy>
c000881c:	83 c4 10             	add    $0x10,%esp
c000881f:	83 ec 08             	sub    $0x8,%esp
c0008822:	6a 00                	push   $0x0
c0008824:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000882a:	50                   	push   %eax
c000882b:	e8 e3 f9 ff ff       	call   c0008213 <open>
c0008830:	83 c4 10             	add    $0x10,%esp
c0008833:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008836:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000883d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008840:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0008846:	01 d0                	add    %edx,%eax
c0008848:	83 ec 04             	sub    $0x4,%esp
c000884b:	68 00 02 00 00       	push   $0x200
c0008850:	50                   	push   %eax
c0008851:	ff 75 d0             	pushl  -0x30(%ebp)
c0008854:	e8 0f fa ff ff       	call   c0008268 <read>
c0008859:	83 c4 10             	add    $0x10,%esp
c000885c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000885f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008862:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008865:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008869:	74 02                	je     c000886d <do_exec+0xe7>
c000886b:	eb d0                	jmp    c000883d <do_exec+0xb7>
c000886d:	90                   	nop
c000886e:	83 ec 0c             	sub    $0xc,%esp
c0008871:	ff 75 d0             	pushl  -0x30(%ebp)
c0008874:	e8 5d fa ff ff       	call   c00082d6 <close>
c0008879:	83 c4 10             	add    $0x10,%esp
c000887c:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0008882:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008885:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000888c:	eb 72                	jmp    c0008900 <do_exec+0x17a>
c000888e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008891:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0008895:	0f b7 d0             	movzwl %ax,%edx
c0008898:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000889b:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c000889f:	0f b7 c0             	movzwl %ax,%eax
c00088a2:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00088a6:	01 c2                	add    %eax,%edx
c00088a8:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00088ae:	01 d0                	add    %edx,%eax
c00088b0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00088b3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00088b6:	8b 40 10             	mov    0x10(%eax),%eax
c00088b9:	89 c6                	mov    %eax,%esi
c00088bb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00088be:	8b 40 04             	mov    0x4(%eax),%eax
c00088c1:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00088c7:	01 d0                	add    %edx,%eax
c00088c9:	83 ec 08             	sub    $0x8,%esp
c00088cc:	50                   	push   %eax
c00088cd:	6a 04                	push   $0x4
c00088cf:	e8 ff e8 ff ff       	call   c00071d3 <v2l>
c00088d4:	83 c4 10             	add    $0x10,%esp
c00088d7:	89 c3                	mov    %eax,%ebx
c00088d9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00088dc:	8b 40 08             	mov    0x8(%eax),%eax
c00088df:	83 ec 08             	sub    $0x8,%esp
c00088e2:	50                   	push   %eax
c00088e3:	ff 75 d8             	pushl  -0x28(%ebp)
c00088e6:	e8 e8 e8 ff ff       	call   c00071d3 <v2l>
c00088eb:	83 c4 10             	add    $0x10,%esp
c00088ee:	83 ec 04             	sub    $0x4,%esp
c00088f1:	56                   	push   %esi
c00088f2:	53                   	push   %ebx
c00088f3:	50                   	push   %eax
c00088f4:	e8 88 18 00 00       	call   c000a181 <Memcpy>
c00088f9:	83 c4 10             	add    $0x10,%esp
c00088fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008900:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008903:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0008907:	0f b7 c0             	movzwl %ax,%eax
c000890a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000890d:	0f 8c 7b ff ff ff    	jl     c000888e <do_exec+0x108>
c0008913:	8b 45 08             	mov    0x8(%ebp),%eax
c0008916:	8b 40 10             	mov    0x10(%eax),%eax
c0008919:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000891c:	8b 45 08             	mov    0x8(%ebp),%eax
c000891f:	8b 40 1c             	mov    0x1c(%eax),%eax
c0008922:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0008925:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c000892c:	83 ec 08             	sub    $0x8,%esp
c000892f:	ff 75 c0             	pushl  -0x40(%ebp)
c0008932:	ff 75 d8             	pushl  -0x28(%ebp)
c0008935:	e8 99 e8 ff ff       	call   c00071d3 <v2l>
c000893a:	83 c4 10             	add    $0x10,%esp
c000893d:	89 c3                	mov    %eax,%ebx
c000893f:	83 ec 08             	sub    $0x8,%esp
c0008942:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0008948:	50                   	push   %eax
c0008949:	6a 04                	push   $0x4
c000894b:	e8 83 e8 ff ff       	call   c00071d3 <v2l>
c0008950:	83 c4 10             	add    $0x10,%esp
c0008953:	83 ec 04             	sub    $0x4,%esp
c0008956:	ff 75 bc             	pushl  -0x44(%ebp)
c0008959:	53                   	push   %ebx
c000895a:	50                   	push   %eax
c000895b:	e8 21 18 00 00       	call   c000a181 <Memcpy>
c0008960:	83 c4 10             	add    $0x10,%esp
c0008963:	83 ec 08             	sub    $0x8,%esp
c0008966:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c000896c:	50                   	push   %eax
c000896d:	6a 04                	push   $0x4
c000896f:	e8 5f e8 ff ff       	call   c00071d3 <v2l>
c0008974:	83 c4 10             	add    $0x10,%esp
c0008977:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000897a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000897d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008980:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008987:	eb 08                	jmp    c0008991 <do_exec+0x20b>
c0008989:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000898d:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0008991:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008994:	8b 00                	mov    (%eax),%eax
c0008996:	85 c0                	test   %eax,%eax
c0008998:	75 ef                	jne    c0008989 <do_exec+0x203>
c000899a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000899d:	2b 45 c0             	sub    -0x40(%ebp),%eax
c00089a0:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00089a3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00089aa:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00089b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00089b3:	eb 17                	jmp    c00089cc <do_exec+0x246>
c00089b5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00089b9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00089bc:	8b 10                	mov    (%eax),%edx
c00089be:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00089c1:	01 c2                	add    %eax,%edx
c00089c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00089c6:	89 10                	mov    %edx,(%eax)
c00089c8:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00089cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00089cf:	8b 00                	mov    (%eax),%eax
c00089d1:	85 c0                	test   %eax,%eax
c00089d3:	75 e0                	jne    c00089b5 <do_exec+0x22f>
c00089d5:	83 ec 08             	sub    $0x8,%esp
c00089d8:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00089de:	50                   	push   %eax
c00089df:	6a 04                	push   $0x4
c00089e1:	e8 ed e7 ff ff       	call   c00071d3 <v2l>
c00089e6:	83 c4 10             	add    $0x10,%esp
c00089e9:	89 c3                	mov    %eax,%ebx
c00089eb:	83 ec 08             	sub    $0x8,%esp
c00089ee:	ff 75 b8             	pushl  -0x48(%ebp)
c00089f1:	ff 75 d8             	pushl  -0x28(%ebp)
c00089f4:	e8 da e7 ff ff       	call   c00071d3 <v2l>
c00089f9:	83 c4 10             	add    $0x10,%esp
c00089fc:	83 ec 04             	sub    $0x4,%esp
c00089ff:	ff 75 bc             	pushl  -0x44(%ebp)
c0008a02:	53                   	push   %ebx
c0008a03:	50                   	push   %eax
c0008a04:	e8 78 17 00 00       	call   c000a181 <Memcpy>
c0008a09:	83 c4 10             	add    $0x10,%esp
c0008a0c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a0f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0008a12:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0008a15:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0008a18:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0008a1e:	81 c2 94 22 08 c0    	add    $0xc0082294,%edx
c0008a24:	89 02                	mov    %eax,(%edx)
c0008a26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008a29:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0008a2c:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0008a32:	81 c2 90 22 08 c0    	add    $0xc0082290,%edx
c0008a38:	89 02                	mov    %eax,(%edx)
c0008a3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008a3d:	8b 40 18             	mov    0x18(%eax),%eax
c0008a40:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0008a43:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0008a49:	81 c2 98 22 08 c0    	add    $0xc0082298,%edx
c0008a4f:	89 02                	mov    %eax,(%edx)
c0008a51:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0008a54:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0008a57:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0008a5d:	81 c2 a4 22 08 c0    	add    $0xc00822a4,%edx
c0008a63:	89 02                	mov    %eax,(%edx)
c0008a65:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0008a68:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008a6e:	05 4c 22 08 c0       	add    $0xc008224c,%eax
c0008a73:	c7 00 1a 00 00 00    	movl   $0x1a,(%eax)
c0008a79:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c0008a80:	00 00 00 
c0008a83:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0008a8a:	00 00 00 
c0008a8d:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c0008a94:	00 00 00 
c0008a97:	83 ec 04             	sub    $0x4,%esp
c0008a9a:	ff 75 d8             	pushl  -0x28(%ebp)
c0008a9d:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c0008aa3:	50                   	push   %eax
c0008aa4:	6a 01                	push   $0x1
c0008aa6:	e8 1d b5 ff ff       	call   c0003fc8 <send_rec>
c0008aab:	83 c4 10             	add    $0x10,%esp
c0008aae:	90                   	nop
c0008aaf:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0008ab2:	5b                   	pop    %ebx
c0008ab3:	5e                   	pop    %esi
c0008ab4:	5d                   	pop    %ebp
c0008ab5:	c3                   	ret    

c0008ab6 <do_fork>:
c0008ab6:	55                   	push   %ebp
c0008ab7:	89 e5                	mov    %esp,%ebp
c0008ab9:	57                   	push   %edi
c0008aba:	56                   	push   %esi
c0008abb:	53                   	push   %ebx
c0008abc:	81 ec ac 00 00 00    	sub    $0xac,%esp
c0008ac2:	c7 45 e4 ac 22 08 c0 	movl   $0xc00822ac,-0x1c(%ebp)
c0008ac9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008ad0:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
c0008ad7:	eb 21                	jmp    c0008afa <do_fork+0x44>
c0008ad9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008adc:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0008ae3:	3c ff                	cmp    $0xff,%al
c0008ae5:	75 08                	jne    c0008aef <do_fork+0x39>
c0008ae7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0008aea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008aed:	eb 11                	jmp    c0008b00 <do_fork+0x4a>
c0008aef:	81 45 e4 ac 01 00 00 	addl   $0x1ac,-0x1c(%ebp)
c0008af6:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0008afa:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0008afe:	7e d9                	jle    c0008ad9 <do_fork+0x23>
c0008b00:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0008b04:	7f 19                	jg     c0008b1f <do_fork+0x69>
c0008b06:	6a 26                	push   $0x26
c0008b08:	68 48 a1 00 c0       	push   $0xc000a148
c0008b0d:	68 48 a1 00 c0       	push   $0xc000a148
c0008b12:	68 58 a1 00 c0       	push   $0xc000a158
c0008b17:	e8 34 ac ff ff       	call   c0003750 <assertion_failure>
c0008b1c:	83 c4 10             	add    $0x10,%esp
c0008b1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0008b22:	8b 00                	mov    (%eax),%eax
c0008b24:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008b27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b2a:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0008b2e:	0f b7 c0             	movzwl %ax,%eax
c0008b31:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008b34:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b37:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008b3a:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0008b40:	8d 8a 00 21 08 c0    	lea    -0x3ff7df00(%edx),%ecx
c0008b46:	89 c2                	mov    %eax,%edx
c0008b48:	89 cb                	mov    %ecx,%ebx
c0008b4a:	b8 6b 00 00 00       	mov    $0x6b,%eax
c0008b4f:	89 d7                	mov    %edx,%edi
c0008b51:	89 de                	mov    %ebx,%esi
c0008b53:	89 c1                	mov    %eax,%ecx
c0008b55:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008b57:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008b5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b5d:	89 50 18             	mov    %edx,0x18(%eax)
c0008b60:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008b63:	89 c2                	mov    %eax,%edx
c0008b65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b68:	66 89 50 04          	mov    %dx,0x4(%eax)
c0008b6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b6f:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008b72:	89 90 60 01 00 00    	mov    %edx,0x160(%eax)
c0008b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b7b:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008b81:	05 00 21 08 c0       	add    $0xc0082100,%eax
c0008b86:	83 c0 06             	add    $0x6,%eax
c0008b89:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008b8c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008b8f:	0f b6 40 07          	movzbl 0x7(%eax),%eax
c0008b93:	0f b6 c0             	movzbl %al,%eax
c0008b96:	c1 e0 18             	shl    $0x18,%eax
c0008b99:	89 c2                	mov    %eax,%edx
c0008b9b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008b9e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0008ba2:	0f b6 c0             	movzbl %al,%eax
c0008ba5:	c1 e0 10             	shl    $0x10,%eax
c0008ba8:	01 c2                	add    %eax,%edx
c0008baa:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008bad:	0f b7 40 02          	movzwl 0x2(%eax),%eax
c0008bb1:	0f b7 c0             	movzwl %ax,%eax
c0008bb4:	01 d0                	add    %edx,%eax
c0008bb6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008bb9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008bbc:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0008bc0:	0f b6 c0             	movzbl %al,%eax
c0008bc3:	25 00 00 0f 00       	and    $0xf0000,%eax
c0008bc8:	89 c2                	mov    %eax,%edx
c0008bca:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008bcd:	0f b7 00             	movzwl (%eax),%eax
c0008bd0:	0f b7 c0             	movzwl %ax,%eax
c0008bd3:	01 d0                	add    %edx,%eax
c0008bd5:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008bd8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008bdb:	83 c0 01             	add    $0x1,%eax
c0008bde:	c1 e0 0c             	shl    $0xc,%eax
c0008be1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0008be4:	83 ec 08             	sub    $0x8,%esp
c0008be7:	ff 75 c4             	pushl  -0x3c(%ebp)
c0008bea:	ff 75 e0             	pushl  -0x20(%ebp)
c0008bed:	e8 61 fb ff ff       	call   c0008753 <alloc_mem>
c0008bf2:	83 c4 10             	add    $0x10,%esp
c0008bf5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008bf8:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0008bfb:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0008bfe:	83 ec 04             	sub    $0x4,%esp
c0008c01:	ff 75 c4             	pushl  -0x3c(%ebp)
c0008c04:	52                   	push   %edx
c0008c05:	50                   	push   %eax
c0008c06:	e8 76 15 00 00       	call   c000a181 <Memcpy>
c0008c0b:	83 c4 10             	add    $0x10,%esp
c0008c0e:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0008c15:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
c0008c1c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0008c1f:	0f b7 c8             	movzwl %ax,%ecx
c0008c22:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0008c25:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0008c28:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c0008c2b:	69 db ac 01 00 00    	imul   $0x1ac,%ebx,%ebx
c0008c31:	81 c3 00 21 08 c0    	add    $0xc0082100,%ebx
c0008c37:	83 c3 06             	add    $0x6,%ebx
c0008c3a:	51                   	push   %ecx
c0008c3b:	52                   	push   %edx
c0008c3c:	50                   	push   %eax
c0008c3d:	53                   	push   %ebx
c0008c3e:	e8 8b e4 ff ff       	call   c00070ce <InitDescriptor>
c0008c43:	83 c4 10             	add    $0x10,%esp
c0008c46:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
c0008c4d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0008c50:	0f b7 c8             	movzwl %ax,%ecx
c0008c53:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0008c56:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0008c59:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c0008c5c:	69 db ac 01 00 00    	imul   $0x1ac,%ebx,%ebx
c0008c62:	83 c3 08             	add    $0x8,%ebx
c0008c65:	81 c3 00 21 08 c0    	add    $0xc0082100,%ebx
c0008c6b:	83 c3 06             	add    $0x6,%ebx
c0008c6e:	51                   	push   %ecx
c0008c6f:	52                   	push   %edx
c0008c70:	50                   	push   %eax
c0008c71:	53                   	push   %ebx
c0008c72:	e8 57 e4 ff ff       	call   c00070ce <InitDescriptor>
c0008c77:	83 c4 10             	add    $0x10,%esp
c0008c7a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008c7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008c80:	89 50 4c             	mov    %edx,0x4c(%eax)
c0008c83:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
c0008c8a:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c0008c91:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0008c98:	83 ec 04             	sub    $0x4,%esp
c0008c9b:	ff 75 e0             	pushl  -0x20(%ebp)
c0008c9e:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
c0008ca4:	50                   	push   %eax
c0008ca5:	6a 01                	push   $0x1
c0008ca7:	e8 1c b3 ff ff       	call   c0003fc8 <send_rec>
c0008cac:	83 c4 10             	add    $0x10,%esp
c0008caf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008cb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008cb5:	5b                   	pop    %ebx
c0008cb6:	5e                   	pop    %esi
c0008cb7:	5f                   	pop    %edi
c0008cb8:	5d                   	pop    %ebp
c0008cb9:	c3                   	ret    

c0008cba <do_exit>:
c0008cba:	55                   	push   %ebp
c0008cbb:	89 e5                	mov    %esp,%ebp
c0008cbd:	83 ec 18             	sub    $0x18,%esp
c0008cc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0008cc3:	8b 00                	mov    (%eax),%eax
c0008cc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008cc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ccb:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008cd1:	05 00 21 08 c0       	add    $0xc0082100,%eax
c0008cd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008cd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008cdc:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c0008ce2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ce5:	8b 45 08             	mov    0x8(%ebp),%eax
c0008ce8:	8b 40 44             	mov    0x44(%eax),%eax
c0008ceb:	89 c2                	mov    %eax,%edx
c0008ced:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008cf0:	89 90 64 01 00 00    	mov    %edx,0x164(%eax)
c0008cf6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008cf9:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008cff:	05 45 22 08 c0       	add    $0xc0082245,%eax
c0008d04:	0f b6 00             	movzbl (%eax),%eax
c0008d07:	3c 04                	cmp    $0x4,%al
c0008d09:	75 21                	jne    c0008d2c <do_exit+0x72>
c0008d0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008d0e:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008d14:	05 45 22 08 c0       	add    $0xc0082245,%eax
c0008d19:	c6 00 fb             	movb   $0xfb,(%eax)
c0008d1c:	83 ec 0c             	sub    $0xc,%esp
c0008d1f:	ff 75 ec             	pushl  -0x14(%ebp)
c0008d22:	e8 59 01 00 00       	call   c0008e80 <cleanup>
c0008d27:	83 c4 10             	add    $0x10,%esp
c0008d2a:	eb 0a                	jmp    c0008d36 <do_exit+0x7c>
c0008d2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d2f:	c6 80 44 01 00 00 03 	movb   $0x3,0x144(%eax)
c0008d36:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0008d3d:	eb 6e                	jmp    c0008dad <do_exit+0xf3>
c0008d3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d42:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008d48:	05 60 22 08 c0       	add    $0xc0082260,%eax
c0008d4d:	8b 00                	mov    (%eax),%eax
c0008d4f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0008d52:	75 55                	jne    c0008da9 <do_exit+0xef>
c0008d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d57:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008d5d:	05 60 22 08 c0       	add    $0xc0082260,%eax
c0008d62:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0008d68:	0f b6 05 4d 2c 08 c0 	movzbl 0xc0082c4d,%eax
c0008d6f:	3c 04                	cmp    $0x4,%al
c0008d71:	75 36                	jne    c0008da9 <do_exit+0xef>
c0008d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d76:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008d7c:	05 45 22 08 c0       	add    $0xc0082245,%eax
c0008d81:	0f b6 00             	movzbl (%eax),%eax
c0008d84:	3c 03                	cmp    $0x3,%al
c0008d86:	75 21                	jne    c0008da9 <do_exit+0xef>
c0008d88:	c6 05 4d 2c 08 c0 fb 	movb   $0xfb,0xc0082c4d
c0008d8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d92:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008d98:	05 00 21 08 c0       	add    $0xc0082100,%eax
c0008d9d:	83 ec 0c             	sub    $0xc,%esp
c0008da0:	50                   	push   %eax
c0008da1:	e8 da 00 00 00       	call   c0008e80 <cleanup>
c0008da6:	83 c4 10             	add    $0x10,%esp
c0008da9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008dad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008db1:	7e 8c                	jle    c0008d3f <do_exit+0x85>
c0008db3:	90                   	nop
c0008db4:	c9                   	leave  
c0008db5:	c3                   	ret    

c0008db6 <do_wait>:
c0008db6:	55                   	push   %ebp
c0008db7:	89 e5                	mov    %esp,%ebp
c0008db9:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0008dbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0008dc2:	8b 00                	mov    (%eax),%eax
c0008dc4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008dc7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008dce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008dd5:	eb 5f                	jmp    c0008e36 <do_wait+0x80>
c0008dd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008dda:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008de0:	05 60 22 08 c0       	add    $0xc0082260,%eax
c0008de5:	8b 00                	mov    (%eax),%eax
c0008de7:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0008dea:	75 46                	jne    c0008e32 <do_wait+0x7c>
c0008dec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008df0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008df3:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008df9:	05 45 22 08 c0       	add    $0xc0082245,%eax
c0008dfe:	0f b6 00             	movzbl (%eax),%eax
c0008e01:	3c 03                	cmp    $0x3,%al
c0008e03:	75 2d                	jne    c0008e32 <do_wait+0x7c>
c0008e05:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e08:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008e0e:	05 45 22 08 c0       	add    $0xc0082245,%eax
c0008e13:	c6 00 fb             	movb   $0xfb,(%eax)
c0008e16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e19:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008e1f:	05 00 21 08 c0       	add    $0xc0082100,%eax
c0008e24:	83 ec 0c             	sub    $0xc,%esp
c0008e27:	50                   	push   %eax
c0008e28:	e8 53 00 00 00       	call   c0008e80 <cleanup>
c0008e2d:	83 c4 10             	add    $0x10,%esp
c0008e30:	eb 4c                	jmp    c0008e7e <do_wait+0xc8>
c0008e32:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008e36:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008e3a:	7e 9b                	jle    c0008dd7 <do_wait+0x21>
c0008e3c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008e40:	74 13                	je     c0008e55 <do_wait+0x9f>
c0008e42:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e45:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0008e4b:	05 45 22 08 c0       	add    $0xc0082245,%eax
c0008e50:	c6 00 04             	movb   $0x4,(%eax)
c0008e53:	eb 29                	jmp    c0008e7e <do_wait+0xc8>
c0008e55:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0008e5c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0008e63:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0008e6a:	83 ec 04             	sub    $0x4,%esp
c0008e6d:	ff 75 ec             	pushl  -0x14(%ebp)
c0008e70:	8d 45 80             	lea    -0x80(%ebp),%eax
c0008e73:	50                   	push   %eax
c0008e74:	6a 01                	push   $0x1
c0008e76:	e8 4d b1 ff ff       	call   c0003fc8 <send_rec>
c0008e7b:	83 c4 10             	add    $0x10,%esp
c0008e7e:	c9                   	leave  
c0008e7f:	c3                   	ret    

c0008e80 <cleanup>:
c0008e80:	55                   	push   %ebp
c0008e81:	89 e5                	mov    %esp,%ebp
c0008e83:	83 ec 78             	sub    $0x78,%esp
c0008e86:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0008e8d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0008e94:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e97:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c0008e9d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008ea0:	8b 45 08             	mov    0x8(%ebp),%eax
c0008ea3:	8b 80 64 01 00 00    	mov    0x164(%eax),%eax
c0008ea9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008eac:	8b 45 08             	mov    0x8(%ebp),%eax
c0008eaf:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c0008eb5:	83 ec 04             	sub    $0x4,%esp
c0008eb8:	50                   	push   %eax
c0008eb9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008ebc:	50                   	push   %eax
c0008ebd:	6a 01                	push   $0x1
c0008ebf:	e8 04 b1 ff ff       	call   c0003fc8 <send_rec>
c0008ec4:	83 c4 10             	add    $0x10,%esp
c0008ec7:	8b 45 08             	mov    0x8(%ebp),%eax
c0008eca:	c6 80 44 01 00 00 ff 	movb   $0xff,0x144(%eax)
c0008ed1:	90                   	nop
c0008ed2:	c9                   	leave  
c0008ed3:	c3                   	ret    

c0008ed4 <test_bit_val>:
c0008ed4:	55                   	push   %ebp
c0008ed5:	89 e5                	mov    %esp,%ebp
c0008ed7:	53                   	push   %ebx
c0008ed8:	83 ec 10             	sub    $0x10,%esp
c0008edb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ede:	8d 50 07             	lea    0x7(%eax),%edx
c0008ee1:	85 c0                	test   %eax,%eax
c0008ee3:	0f 48 c2             	cmovs  %edx,%eax
c0008ee6:	c1 f8 03             	sar    $0x3,%eax
c0008ee9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008eec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008eef:	99                   	cltd   
c0008ef0:	c1 ea 1d             	shr    $0x1d,%edx
c0008ef3:	01 d0                	add    %edx,%eax
c0008ef5:	83 e0 07             	and    $0x7,%eax
c0008ef8:	29 d0                	sub    %edx,%eax
c0008efa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008efd:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f00:	8b 10                	mov    (%eax),%edx
c0008f02:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008f05:	01 d0                	add    %edx,%eax
c0008f07:	0f b6 00             	movzbl (%eax),%eax
c0008f0a:	88 45 f3             	mov    %al,-0xd(%ebp)
c0008f0d:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0008f11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f14:	bb 01 00 00 00       	mov    $0x1,%ebx
c0008f19:	89 c1                	mov    %eax,%ecx
c0008f1b:	d3 e3                	shl    %cl,%ebx
c0008f1d:	89 d8                	mov    %ebx,%eax
c0008f1f:	21 c2                	and    %eax,%edx
c0008f21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f24:	89 c1                	mov    %eax,%ecx
c0008f26:	d3 fa                	sar    %cl,%edx
c0008f28:	89 d0                	mov    %edx,%eax
c0008f2a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f2d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0008f31:	0f 9f c0             	setg   %al
c0008f34:	0f b6 c0             	movzbl %al,%eax
c0008f37:	83 c4 10             	add    $0x10,%esp
c0008f3a:	5b                   	pop    %ebx
c0008f3b:	5d                   	pop    %ebp
c0008f3c:	c3                   	ret    

c0008f3d <set_bit_val>:
c0008f3d:	55                   	push   %ebp
c0008f3e:	89 e5                	mov    %esp,%ebp
c0008f40:	83 ec 10             	sub    $0x10,%esp
c0008f43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f46:	8d 50 07             	lea    0x7(%eax),%edx
c0008f49:	85 c0                	test   %eax,%eax
c0008f4b:	0f 48 c2             	cmovs  %edx,%eax
c0008f4e:	c1 f8 03             	sar    $0x3,%eax
c0008f51:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008f54:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f57:	99                   	cltd   
c0008f58:	c1 ea 1d             	shr    $0x1d,%edx
c0008f5b:	01 d0                	add    %edx,%eax
c0008f5d:	83 e0 07             	and    $0x7,%eax
c0008f60:	29 d0                	sub    %edx,%eax
c0008f62:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f65:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f68:	8b 10                	mov    (%eax),%edx
c0008f6a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008f6d:	01 d0                	add    %edx,%eax
c0008f6f:	0f b6 00             	movzbl (%eax),%eax
c0008f72:	88 45 ff             	mov    %al,-0x1(%ebp)
c0008f75:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0008f79:	7e 13                	jle    c0008f8e <set_bit_val+0x51>
c0008f7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f7e:	ba 01 00 00 00       	mov    $0x1,%edx
c0008f83:	89 c1                	mov    %eax,%ecx
c0008f85:	d3 e2                	shl    %cl,%edx
c0008f87:	89 d0                	mov    %edx,%eax
c0008f89:	08 45 ff             	or     %al,-0x1(%ebp)
c0008f8c:	eb 13                	jmp    c0008fa1 <set_bit_val+0x64>
c0008f8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f91:	ba 01 00 00 00       	mov    $0x1,%edx
c0008f96:	89 c1                	mov    %eax,%ecx
c0008f98:	d3 e2                	shl    %cl,%edx
c0008f9a:	89 d0                	mov    %edx,%eax
c0008f9c:	f7 d0                	not    %eax
c0008f9e:	20 45 ff             	and    %al,-0x1(%ebp)
c0008fa1:	8b 45 08             	mov    0x8(%ebp),%eax
c0008fa4:	8b 10                	mov    (%eax),%edx
c0008fa6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008fa9:	01 c2                	add    %eax,%edx
c0008fab:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0008faf:	88 02                	mov    %al,(%edx)
c0008fb1:	b8 01 00 00 00       	mov    $0x1,%eax
c0008fb6:	c9                   	leave  
c0008fb7:	c3                   	ret    

c0008fb8 <set_bits>:
c0008fb8:	55                   	push   %ebp
c0008fb9:	89 e5                	mov    %esp,%ebp
c0008fbb:	83 ec 10             	sub    $0x10,%esp
c0008fbe:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008fc5:	eb 1c                	jmp    c0008fe3 <set_bits+0x2b>
c0008fc7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008fca:	8d 50 01             	lea    0x1(%eax),%edx
c0008fcd:	89 55 0c             	mov    %edx,0xc(%ebp)
c0008fd0:	ff 75 10             	pushl  0x10(%ebp)
c0008fd3:	50                   	push   %eax
c0008fd4:	ff 75 08             	pushl  0x8(%ebp)
c0008fd7:	e8 61 ff ff ff       	call   c0008f3d <set_bit_val>
c0008fdc:	83 c4 0c             	add    $0xc,%esp
c0008fdf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008fe3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008fe6:	3b 45 14             	cmp    0x14(%ebp),%eax
c0008fe9:	7c dc                	jl     c0008fc7 <set_bits+0xf>
c0008feb:	b8 01 00 00 00       	mov    $0x1,%eax
c0008ff0:	c9                   	leave  
c0008ff1:	c3                   	ret    

c0008ff2 <get_first_free_bit>:
c0008ff2:	55                   	push   %ebp
c0008ff3:	89 e5                	mov    %esp,%ebp
c0008ff5:	83 ec 10             	sub    $0x10,%esp
c0008ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0008ffb:	8b 40 04             	mov    0x4(%eax),%eax
c0008ffe:	c1 e0 03             	shl    $0x3,%eax
c0009001:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009004:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009007:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000900a:	eb 1b                	jmp    c0009027 <get_first_free_bit+0x35>
c000900c:	ff 75 fc             	pushl  -0x4(%ebp)
c000900f:	ff 75 08             	pushl  0x8(%ebp)
c0009012:	e8 bd fe ff ff       	call   c0008ed4 <test_bit_val>
c0009017:	83 c4 08             	add    $0x8,%esp
c000901a:	85 c0                	test   %eax,%eax
c000901c:	75 05                	jne    c0009023 <get_first_free_bit+0x31>
c000901e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009021:	eb 11                	jmp    c0009034 <get_first_free_bit+0x42>
c0009023:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009027:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000902a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c000902d:	7c dd                	jl     c000900c <get_first_free_bit+0x1a>
c000902f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0009034:	c9                   	leave  
c0009035:	c3                   	ret    

c0009036 <get_bits>:
c0009036:	55                   	push   %ebp
c0009037:	89 e5                	mov    %esp,%ebp
c0009039:	83 ec 20             	sub    $0x20,%esp
c000903c:	c7 45 f0 02 01 00 00 	movl   $0x102,-0x10(%ebp)
c0009043:	ff 75 f0             	pushl  -0x10(%ebp)
c0009046:	ff 75 08             	pushl  0x8(%ebp)
c0009049:	e8 a4 ff ff ff       	call   c0008ff2 <get_first_free_bit>
c000904e:	83 c4 08             	add    $0x8,%esp
c0009051:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009054:	8b 45 08             	mov    0x8(%ebp),%eax
c0009057:	8b 40 04             	mov    0x4(%eax),%eax
c000905a:	c1 e0 03             	shl    $0x3,%eax
c000905d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009060:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009063:	83 e8 01             	sub    $0x1,%eax
c0009066:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009069:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000906c:	83 c0 01             	add    $0x1,%eax
c000906f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009072:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009075:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009078:	eb 58                	jmp    c00090d2 <get_bits+0x9c>
c000907a:	ff 75 f8             	pushl  -0x8(%ebp)
c000907d:	ff 75 08             	pushl  0x8(%ebp)
c0009080:	e8 4f fe ff ff       	call   c0008ed4 <test_bit_val>
c0009085:	83 c4 08             	add    $0x8,%esp
c0009088:	85 c0                	test   %eax,%eax
c000908a:	75 0a                	jne    c0009096 <get_bits+0x60>
c000908c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009090:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009094:	eb 2b                	jmp    c00090c1 <get_bits+0x8b>
c0009096:	6a 00                	push   $0x0
c0009098:	ff 75 08             	pushl  0x8(%ebp)
c000909b:	e8 52 ff ff ff       	call   c0008ff2 <get_first_free_bit>
c00090a0:	83 c4 08             	add    $0x8,%esp
c00090a3:	83 c0 01             	add    $0x1,%eax
c00090a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00090a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090ac:	83 c0 01             	add    $0x1,%eax
c00090af:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00090b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00090b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00090bb:	83 e8 01             	sub    $0x1,%eax
c00090be:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00090c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090c4:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c00090c7:	7c 09                	jl     c00090d2 <get_bits+0x9c>
c00090c9:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00090d0:	eb 0d                	jmp    c00090df <get_bits+0xa9>
c00090d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00090d5:	8d 50 ff             	lea    -0x1(%eax),%edx
c00090d8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00090db:	85 c0                	test   %eax,%eax
c00090dd:	7f 9b                	jg     c000907a <get_bits+0x44>
c00090df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090e2:	2b 45 0c             	sub    0xc(%ebp),%eax
c00090e5:	83 c0 01             	add    $0x1,%eax
c00090e8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00090eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00090ee:	c9                   	leave  
c00090ef:	c3                   	ret    

c00090f0 <get_a_page2>:
c00090f0:	55                   	push   %ebp
c00090f1:	89 e5                	mov    %esp,%ebp
c00090f3:	83 ec 18             	sub    $0x18,%esp
c00090f6:	83 ec 0c             	sub    $0xc,%esp
c00090f9:	ff 75 0c             	pushl  0xc(%ebp)
c00090fc:	e8 1e 00 00 00       	call   c000911f <get_a_page>
c0009101:	83 c4 10             	add    $0x10,%esp
c0009104:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009107:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000910a:	8b 45 08             	mov    0x8(%ebp),%eax
c000910d:	83 ec 08             	sub    $0x8,%esp
c0009110:	52                   	push   %edx
c0009111:	50                   	push   %eax
c0009112:	e8 42 01 00 00       	call   c0009259 <add_map_entry>
c0009117:	83 c4 10             	add    $0x10,%esp
c000911a:	8b 45 08             	mov    0x8(%ebp),%eax
c000911d:	c9                   	leave  
c000911e:	c3                   	ret    

c000911f <get_a_page>:
c000911f:	55                   	push   %ebp
c0009120:	89 e5                	mov    %esp,%ebp
c0009122:	83 ec 20             	sub    $0x20,%esp
c0009125:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009129:	75 22                	jne    c000914d <get_a_page+0x2e>
c000912b:	a1 ec 05 01 c0       	mov    0xc00105ec,%eax
c0009130:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009133:	a1 f0 05 01 c0       	mov    0xc00105f0,%eax
c0009138:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000913b:	a1 f4 05 01 c0       	mov    0xc00105f4,%eax
c0009140:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009143:	a1 f8 05 01 c0       	mov    0xc00105f8,%eax
c0009148:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000914b:	eb 20                	jmp    c000916d <get_a_page+0x4e>
c000914d:	a1 24 0e 01 c0       	mov    0xc0010e24,%eax
c0009152:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009155:	a1 28 0e 01 c0       	mov    0xc0010e28,%eax
c000915a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000915d:	a1 2c 0e 01 c0       	mov    0xc0010e2c,%eax
c0009162:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009165:	a1 30 0e 01 c0       	mov    0xc0010e30,%eax
c000916a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000916d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009170:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0009173:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009176:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0009179:	6a 01                	push   $0x1
c000917b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c000917e:	50                   	push   %eax
c000917f:	e8 b2 fe ff ff       	call   c0009036 <get_bits>
c0009184:	83 c4 08             	add    $0x8,%esp
c0009187:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000918a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000918d:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0009190:	c1 e2 0c             	shl    $0xc,%edx
c0009193:	01 d0                	add    %edx,%eax
c0009195:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009198:	6a 01                	push   $0x1
c000919a:	ff 75 fc             	pushl  -0x4(%ebp)
c000919d:	8d 45 e0             	lea    -0x20(%ebp),%eax
c00091a0:	50                   	push   %eax
c00091a1:	e8 97 fd ff ff       	call   c0008f3d <set_bit_val>
c00091a6:	83 c4 0c             	add    $0xc,%esp
c00091a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00091ac:	c9                   	leave  
c00091ad:	c3                   	ret    

c00091ae <get_virtual_address>:
c00091ae:	55                   	push   %ebp
c00091af:	89 e5                	mov    %esp,%ebp
c00091b1:	83 ec 20             	sub    $0x20,%esp
c00091b4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00091b8:	75 18                	jne    c00091d2 <get_virtual_address+0x24>
c00091ba:	a1 90 e6 00 c0       	mov    0xc000e690,%eax
c00091bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00091c2:	a1 94 e6 00 c0       	mov    0xc000e694,%eax
c00091c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00091ca:	a1 98 e6 00 c0       	mov    0xc000e698,%eax
c00091cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00091d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00091d5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00091d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00091db:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00091de:	8b 45 08             	mov    0x8(%ebp),%eax
c00091e1:	50                   	push   %eax
c00091e2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c00091e5:	50                   	push   %eax
c00091e6:	e8 4b fe ff ff       	call   c0009036 <get_bits>
c00091eb:	83 c4 08             	add    $0x8,%esp
c00091ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00091f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00091f4:	8b 55 08             	mov    0x8(%ebp),%edx
c00091f7:	81 c2 ff ff 0f 00    	add    $0xfffff,%edx
c00091fd:	c1 e2 0c             	shl    $0xc,%edx
c0009200:	01 d0                	add    %edx,%eax
c0009202:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009205:	8b 45 08             	mov    0x8(%ebp),%eax
c0009208:	50                   	push   %eax
c0009209:	6a 01                	push   $0x1
c000920b:	ff 75 fc             	pushl  -0x4(%ebp)
c000920e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0009211:	50                   	push   %eax
c0009212:	e8 a1 fd ff ff       	call   c0008fb8 <set_bits>
c0009217:	83 c4 10             	add    $0x10,%esp
c000921a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000921d:	c9                   	leave  
c000921e:	c3                   	ret    

c000921f <ptr_pde>:
c000921f:	55                   	push   %ebp
c0009220:	89 e5                	mov    %esp,%ebp
c0009222:	8b 45 08             	mov    0x8(%ebp),%eax
c0009225:	c1 e8 16             	shr    $0x16,%eax
c0009228:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c000922d:	c1 e0 02             	shl    $0x2,%eax
c0009230:	5d                   	pop    %ebp
c0009231:	c3                   	ret    

c0009232 <ptr_pte>:
c0009232:	55                   	push   %ebp
c0009233:	89 e5                	mov    %esp,%ebp
c0009235:	8b 45 08             	mov    0x8(%ebp),%eax
c0009238:	c1 e8 0a             	shr    $0xa,%eax
c000923b:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0009240:	89 c2                	mov    %eax,%edx
c0009242:	8b 45 08             	mov    0x8(%ebp),%eax
c0009245:	c1 e8 0c             	shr    $0xc,%eax
c0009248:	25 ff 03 00 00       	and    $0x3ff,%eax
c000924d:	c1 e0 02             	shl    $0x2,%eax
c0009250:	01 d0                	add    %edx,%eax
c0009252:	2d 00 00 40 00       	sub    $0x400000,%eax
c0009257:	5d                   	pop    %ebp
c0009258:	c3                   	ret    

c0009259 <add_map_entry>:
c0009259:	55                   	push   %ebp
c000925a:	89 e5                	mov    %esp,%ebp
c000925c:	83 ec 18             	sub    $0x18,%esp
c000925f:	66 87 db             	xchg   %bx,%bx
c0009262:	ff 75 08             	pushl  0x8(%ebp)
c0009265:	e8 b5 ff ff ff       	call   c000921f <ptr_pde>
c000926a:	83 c4 04             	add    $0x4,%esp
c000926d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009270:	ff 75 08             	pushl  0x8(%ebp)
c0009273:	e8 ba ff ff ff       	call   c0009232 <ptr_pte>
c0009278:	83 c4 04             	add    $0x4,%esp
c000927b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000927e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009281:	8b 00                	mov    (%eax),%eax
c0009283:	83 e0 01             	and    $0x1,%eax
c0009286:	85 c0                	test   %eax,%eax
c0009288:	74 1e                	je     c00092a8 <add_map_entry+0x4f>
c000928a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000928d:	8b 00                	mov    (%eax),%eax
c000928f:	83 e0 01             	and    $0x1,%eax
c0009292:	85 c0                	test   %eax,%eax
c0009294:	75 54                	jne    c00092ea <add_map_entry+0x91>
c0009296:	66 87 db             	xchg   %bx,%bx
c0009299:	8b 45 0c             	mov    0xc(%ebp),%eax
c000929c:	83 c8 07             	or     $0x7,%eax
c000929f:	89 c2                	mov    %eax,%edx
c00092a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092a4:	89 10                	mov    %edx,(%eax)
c00092a6:	eb 42                	jmp    c00092ea <add_map_entry+0x91>
c00092a8:	6a 00                	push   $0x0
c00092aa:	e8 70 fe ff ff       	call   c000911f <get_a_page>
c00092af:	83 c4 04             	add    $0x4,%esp
c00092b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092b8:	83 c8 07             	or     $0x7,%eax
c00092bb:	89 c2                	mov    %eax,%edx
c00092bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00092c0:	89 10                	mov    %edx,(%eax)
c00092c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092c5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00092ca:	83 ec 04             	sub    $0x4,%esp
c00092cd:	68 00 10 00 00       	push   $0x1000
c00092d2:	6a 00                	push   $0x0
c00092d4:	50                   	push   %eax
c00092d5:	e8 d5 0e 00 00       	call   c000a1af <Memset>
c00092da:	83 c4 10             	add    $0x10,%esp
c00092dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00092e0:	83 c8 07             	or     $0x7,%eax
c00092e3:	89 c2                	mov    %eax,%edx
c00092e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092e8:	89 10                	mov    %edx,(%eax)
c00092ea:	90                   	nop
c00092eb:	c9                   	leave  
c00092ec:	c3                   	ret    

c00092ed <get_physical_address>:
c00092ed:	55                   	push   %ebp
c00092ee:	89 e5                	mov    %esp,%ebp
c00092f0:	83 ec 10             	sub    $0x10,%esp
c00092f3:	ff 75 08             	pushl  0x8(%ebp)
c00092f6:	e8 37 ff ff ff       	call   c0009232 <ptr_pte>
c00092fb:	83 c4 04             	add    $0x4,%esp
c00092fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009301:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009304:	8b 00                	mov    (%eax),%eax
c0009306:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000930b:	89 c2                	mov    %eax,%edx
c000930d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009310:	25 ff 0f 00 00       	and    $0xfff,%eax
c0009315:	09 d0                	or     %edx,%eax
c0009317:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000931a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000931d:	c9                   	leave  
c000931e:	c3                   	ret    

c000931f <alloc_memory>:
c000931f:	55                   	push   %ebp
c0009320:	89 e5                	mov    %esp,%ebp
c0009322:	83 ec 18             	sub    $0x18,%esp
c0009325:	ff 75 0c             	pushl  0xc(%ebp)
c0009328:	ff 75 08             	pushl  0x8(%ebp)
c000932b:	e8 7e fe ff ff       	call   c00091ae <get_virtual_address>
c0009330:	83 c4 08             	add    $0x8,%esp
c0009333:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009336:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009339:	2d 00 10 00 00       	sub    $0x1000,%eax
c000933e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009341:	eb 26                	jmp    c0009369 <alloc_memory+0x4a>
c0009343:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c000934a:	ff 75 0c             	pushl  0xc(%ebp)
c000934d:	e8 cd fd ff ff       	call   c000911f <get_a_page>
c0009352:	83 c4 04             	add    $0x4,%esp
c0009355:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009358:	83 ec 08             	sub    $0x8,%esp
c000935b:	ff 75 ec             	pushl  -0x14(%ebp)
c000935e:	ff 75 f4             	pushl  -0xc(%ebp)
c0009361:	e8 f3 fe ff ff       	call   c0009259 <add_map_entry>
c0009366:	83 c4 10             	add    $0x10,%esp
c0009369:	8b 45 08             	mov    0x8(%ebp),%eax
c000936c:	8d 50 ff             	lea    -0x1(%eax),%edx
c000936f:	89 55 08             	mov    %edx,0x8(%ebp)
c0009372:	85 c0                	test   %eax,%eax
c0009374:	75 cd                	jne    c0009343 <alloc_memory+0x24>
c0009376:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009379:	c9                   	leave  
c000937a:	c3                   	ret    

c000937b <init_memory2>:
c000937b:	55                   	push   %ebp
c000937c:	89 e5                	mov    %esp,%ebp
c000937e:	83 ec 38             	sub    $0x38,%esp
c0009381:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0009388:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c000938f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009392:	a3 f4 05 01 c0       	mov    %eax,0xc00105f4
c0009397:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000939a:	a1 f4 05 01 c0       	mov    0xc00105f4,%eax
c000939f:	29 c2                	sub    %eax,%edx
c00093a1:	89 d0                	mov    %edx,%eax
c00093a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00093a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00093a9:	89 c2                	mov    %eax,%edx
c00093ab:	c1 ea 1f             	shr    $0x1f,%edx
c00093ae:	01 d0                	add    %edx,%eax
c00093b0:	d1 f8                	sar    %eax
c00093b2:	a3 f8 05 01 c0       	mov    %eax,0xc00105f8
c00093b7:	a1 f8 05 01 c0       	mov    0xc00105f8,%eax
c00093bc:	83 ec 0c             	sub    $0xc,%esp
c00093bf:	50                   	push   %eax
c00093c0:	e8 ac 87 ff ff       	call   c0001b71 <disp_int>
c00093c5:	83 c4 10             	add    $0x10,%esp
c00093c8:	a1 f8 05 01 c0       	mov    0xc00105f8,%eax
c00093cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00093d0:	29 c2                	sub    %eax,%edx
c00093d2:	89 d0                	mov    %edx,%eax
c00093d4:	a3 30 0e 01 c0       	mov    %eax,0xc0010e30
c00093d9:	83 ec 0c             	sub    $0xc,%esp
c00093dc:	68 7f a1 00 c0       	push   $0xc000a17f
c00093e1:	e8 a6 81 ff ff       	call   c000158c <disp_str>
c00093e6:	83 c4 10             	add    $0x10,%esp
c00093e9:	a1 30 0e 01 c0       	mov    0xc0010e30,%eax
c00093ee:	83 ec 0c             	sub    $0xc,%esp
c00093f1:	50                   	push   %eax
c00093f2:	e8 7a 87 ff ff       	call   c0001b71 <disp_int>
c00093f7:	83 c4 10             	add    $0x10,%esp
c00093fa:	83 ec 0c             	sub    $0xc,%esp
c00093fd:	68 7f a1 00 c0       	push   $0xc000a17f
c0009402:	e8 85 81 ff ff       	call   c000158c <disp_str>
c0009407:	83 c4 10             	add    $0x10,%esp
c000940a:	a1 f8 05 01 c0       	mov    0xc00105f8,%eax
c000940f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009414:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000941a:	85 c0                	test   %eax,%eax
c000941c:	0f 48 c2             	cmovs  %edx,%eax
c000941f:	c1 f8 0c             	sar    $0xc,%eax
c0009422:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009425:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009428:	83 c0 07             	add    $0x7,%eax
c000942b:	8d 50 07             	lea    0x7(%eax),%edx
c000942e:	85 c0                	test   %eax,%eax
c0009430:	0f 48 c2             	cmovs  %edx,%eax
c0009433:	c1 f8 03             	sar    $0x3,%eax
c0009436:	a3 f0 05 01 c0       	mov    %eax,0xc00105f0
c000943b:	a1 f4 05 01 c0       	mov    0xc00105f4,%eax
c0009440:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0009445:	a3 ec 05 01 c0       	mov    %eax,0xc00105ec
c000944a:	8b 15 f0 05 01 c0    	mov    0xc00105f0,%edx
c0009450:	a1 ec 05 01 c0       	mov    0xc00105ec,%eax
c0009455:	83 ec 04             	sub    $0x4,%esp
c0009458:	52                   	push   %edx
c0009459:	6a 00                	push   $0x0
c000945b:	50                   	push   %eax
c000945c:	e8 4e 0d 00 00       	call   c000a1af <Memset>
c0009461:	83 c4 10             	add    $0x10,%esp
c0009464:	a1 f0 05 01 c0       	mov    0xc00105f0,%eax
c0009469:	05 ff 0f 00 00       	add    $0xfff,%eax
c000946e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009474:	85 c0                	test   %eax,%eax
c0009476:	0f 48 c2             	cmovs  %edx,%eax
c0009479:	c1 f8 0c             	sar    $0xc,%eax
c000947c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000947f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009482:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009485:	ff 75 e8             	pushl  -0x18(%ebp)
c0009488:	6a 01                	push   $0x1
c000948a:	6a 00                	push   $0x0
c000948c:	68 ec 05 01 c0       	push   $0xc00105ec
c0009491:	e8 22 fb ff ff       	call   c0008fb8 <set_bits>
c0009496:	83 c4 10             	add    $0x10,%esp
c0009499:	a1 30 0e 01 c0       	mov    0xc0010e30,%eax
c000949e:	05 ff 0f 00 00       	add    $0xfff,%eax
c00094a3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00094a9:	85 c0                	test   %eax,%eax
c00094ab:	0f 48 c2             	cmovs  %edx,%eax
c00094ae:	c1 f8 0c             	sar    $0xc,%eax
c00094b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094b7:	83 c0 07             	add    $0x7,%eax
c00094ba:	8d 50 07             	lea    0x7(%eax),%edx
c00094bd:	85 c0                	test   %eax,%eax
c00094bf:	0f 48 c2             	cmovs  %edx,%eax
c00094c2:	c1 f8 03             	sar    $0x3,%eax
c00094c5:	a3 28 0e 01 c0       	mov    %eax,0xc0010e28
c00094ca:	a1 f4 05 01 c0       	mov    0xc00105f4,%eax
c00094cf:	8b 15 f0 05 01 c0    	mov    0xc00105f0,%edx
c00094d5:	01 d0                	add    %edx,%eax
c00094d7:	a3 24 0e 01 c0       	mov    %eax,0xc0010e24
c00094dc:	8b 15 28 0e 01 c0    	mov    0xc0010e28,%edx
c00094e2:	a1 24 0e 01 c0       	mov    0xc0010e24,%eax
c00094e7:	83 ec 04             	sub    $0x4,%esp
c00094ea:	52                   	push   %edx
c00094eb:	6a 00                	push   $0x0
c00094ed:	50                   	push   %eax
c00094ee:	e8 bc 0c 00 00       	call   c000a1af <Memset>
c00094f3:	83 c4 10             	add    $0x10,%esp
c00094f6:	a1 28 0e 01 c0       	mov    0xc0010e28,%eax
c00094fb:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009500:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009506:	85 c0                	test   %eax,%eax
c0009508:	0f 48 c2             	cmovs  %edx,%eax
c000950b:	c1 f8 0c             	sar    $0xc,%eax
c000950e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009511:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009514:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009517:	ff 75 e8             	pushl  -0x18(%ebp)
c000951a:	6a 01                	push   $0x1
c000951c:	ff 75 e0             	pushl  -0x20(%ebp)
c000951f:	68 ec 05 01 c0       	push   $0xc00105ec
c0009524:	e8 8f fa ff ff       	call   c0008fb8 <set_bits>
c0009529:	83 c4 10             	add    $0x10,%esp
c000952c:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0009533:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009536:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009539:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000953c:	83 c0 07             	add    $0x7,%eax
c000953f:	8d 50 07             	lea    0x7(%eax),%edx
c0009542:	85 c0                	test   %eax,%eax
c0009544:	0f 48 c2             	cmovs  %edx,%eax
c0009547:	c1 f8 03             	sar    $0x3,%eax
c000954a:	a3 94 e6 00 c0       	mov    %eax,0xc000e694
c000954f:	a1 f4 05 01 c0       	mov    0xc00105f4,%eax
c0009554:	8b 15 f0 05 01 c0    	mov    0xc00105f0,%edx
c000955a:	01 c2                	add    %eax,%edx
c000955c:	a1 28 0e 01 c0       	mov    0xc0010e28,%eax
c0009561:	01 d0                	add    %edx,%eax
c0009563:	a3 90 e6 00 c0       	mov    %eax,0xc000e690
c0009568:	8b 15 94 e6 00 c0    	mov    0xc000e694,%edx
c000956e:	a1 90 e6 00 c0       	mov    0xc000e690,%eax
c0009573:	83 ec 04             	sub    $0x4,%esp
c0009576:	52                   	push   %edx
c0009577:	6a 00                	push   $0x0
c0009579:	50                   	push   %eax
c000957a:	e8 30 0c 00 00       	call   c000a1af <Memset>
c000957f:	83 c4 10             	add    $0x10,%esp
c0009582:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0009585:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009588:	01 d0                	add    %edx,%eax
c000958a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000958d:	a1 94 e6 00 c0       	mov    0xc000e694,%eax
c0009592:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009597:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000959d:	85 c0                	test   %eax,%eax
c000959f:	0f 48 c2             	cmovs  %edx,%eax
c00095a2:	c1 f8 0c             	sar    $0xc,%eax
c00095a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00095a8:	ff 75 e8             	pushl  -0x18(%ebp)
c00095ab:	6a 01                	push   $0x1
c00095ad:	ff 75 e0             	pushl  -0x20(%ebp)
c00095b0:	68 ec 05 01 c0       	push   $0xc00105ec
c00095b5:	e8 fe f9 ff ff       	call   c0008fb8 <set_bits>
c00095ba:	83 c4 10             	add    $0x10,%esp
c00095bd:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00095c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00095c3:	01 d0                	add    %edx,%eax
c00095c5:	c1 e0 0c             	shl    $0xc,%eax
c00095c8:	a3 98 e6 00 c0       	mov    %eax,0xc000e698
c00095cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00095d0:	83 c0 02             	add    $0x2,%eax
c00095d3:	c1 e0 0c             	shl    $0xc,%eax
c00095d6:	89 c2                	mov    %eax,%edx
c00095d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095db:	01 d0                	add    %edx,%eax
c00095dd:	a3 98 e6 00 c0       	mov    %eax,0xc000e698
c00095e2:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00095e9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00095ec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00095ef:	90                   	nop
c00095f0:	c9                   	leave  
c00095f1:	c3                   	ret    

c00095f2 <init_memory>:
c00095f2:	55                   	push   %ebp
c00095f3:	89 e5                	mov    %esp,%ebp
c00095f5:	83 ec 38             	sub    $0x38,%esp
c00095f8:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c00095ff:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0009606:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c000960d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009610:	05 00 00 10 00       	add    $0x100000,%eax
c0009615:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009618:	8b 45 08             	mov    0x8(%ebp),%eax
c000961b:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000961e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009624:	85 c0                	test   %eax,%eax
c0009626:	0f 48 c2             	cmovs  %edx,%eax
c0009629:	c1 f8 0c             	sar    $0xc,%eax
c000962c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000962f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009632:	89 c2                	mov    %eax,%edx
c0009634:	c1 ea 1f             	shr    $0x1f,%edx
c0009637:	01 d0                	add    %edx,%eax
c0009639:	d1 f8                	sar    %eax
c000963b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000963e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009641:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0009644:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009647:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000964a:	8d 50 07             	lea    0x7(%eax),%edx
c000964d:	85 c0                	test   %eax,%eax
c000964f:	0f 48 c2             	cmovs  %edx,%eax
c0009652:	c1 f8 03             	sar    $0x3,%eax
c0009655:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009658:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000965b:	8d 50 07             	lea    0x7(%eax),%edx
c000965e:	85 c0                	test   %eax,%eax
c0009660:	0f 48 c2             	cmovs  %edx,%eax
c0009663:	c1 f8 03             	sar    $0x3,%eax
c0009666:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009669:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000966c:	a3 f4 05 01 c0       	mov    %eax,0xc00105f4
c0009671:	a1 f4 05 01 c0       	mov    0xc00105f4,%eax
c0009676:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0009679:	c1 e2 0c             	shl    $0xc,%edx
c000967c:	01 d0                	add    %edx,%eax
c000967e:	a3 2c 0e 01 c0       	mov    %eax,0xc0010e2c
c0009683:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009686:	a3 ec 05 01 c0       	mov    %eax,0xc00105ec
c000968b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000968e:	a3 f0 05 01 c0       	mov    %eax,0xc00105f0
c0009693:	a1 ec 05 01 c0       	mov    0xc00105ec,%eax
c0009698:	83 ec 04             	sub    $0x4,%esp
c000969b:	ff 75 d8             	pushl  -0x28(%ebp)
c000969e:	6a 00                	push   $0x0
c00096a0:	50                   	push   %eax
c00096a1:	e8 09 0b 00 00       	call   c000a1af <Memset>
c00096a6:	83 c4 10             	add    $0x10,%esp
c00096a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00096ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00096af:	01 d0                	add    %edx,%eax
c00096b1:	a3 24 0e 01 c0       	mov    %eax,0xc0010e24
c00096b6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00096b9:	a3 28 0e 01 c0       	mov    %eax,0xc0010e28
c00096be:	a1 24 0e 01 c0       	mov    0xc0010e24,%eax
c00096c3:	83 ec 04             	sub    $0x4,%esp
c00096c6:	ff 75 d4             	pushl  -0x2c(%ebp)
c00096c9:	6a 00                	push   $0x0
c00096cb:	50                   	push   %eax
c00096cc:	e8 de 0a 00 00       	call   c000a1af <Memset>
c00096d1:	83 c4 10             	add    $0x10,%esp
c00096d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00096d7:	a3 94 e6 00 c0       	mov    %eax,0xc000e694
c00096dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00096df:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00096e2:	01 c2                	add    %eax,%edx
c00096e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00096e7:	01 d0                	add    %edx,%eax
c00096e9:	a3 90 e6 00 c0       	mov    %eax,0xc000e690
c00096ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00096f1:	a3 98 e6 00 c0       	mov    %eax,0xc000e698
c00096f6:	a1 90 e6 00 c0       	mov    0xc000e690,%eax
c00096fb:	83 ec 04             	sub    $0x4,%esp
c00096fe:	ff 75 d8             	pushl  -0x28(%ebp)
c0009701:	6a 00                	push   $0x0
c0009703:	50                   	push   %eax
c0009704:	e8 a6 0a 00 00       	call   c000a1af <Memset>
c0009709:	83 c4 10             	add    $0x10,%esp
c000970c:	90                   	nop
c000970d:	c9                   	leave  
c000970e:	c3                   	ret    
c000970f:	90                   	nop

c0009710 <switch_to>:
c0009710:	56                   	push   %esi
c0009711:	57                   	push   %edi
c0009712:	53                   	push   %ebx
c0009713:	55                   	push   %ebp
c0009714:	89 e5                	mov    %esp,%ebp
c0009716:	8b 45 14             	mov    0x14(%ebp),%eax
c0009719:	89 c4                	mov    %eax,%esp
c000971b:	5d                   	pop    %ebp
c000971c:	5b                   	pop    %ebx
c000971d:	5f                   	pop    %edi
c000971e:	5e                   	pop    %esi
c000971f:	c3                   	ret    
