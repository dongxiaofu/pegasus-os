
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	bc 00 df 00 c0       	mov    $0xc000df00,%esp
c000151a:	66 c7 05 40 f7 00 c0 	movw   $0x0,0xc000f740
c0001521:	00 00 
c0001523:	66 87 db             	xchg   %bx,%bx
c0001526:	0f 01 05 a8 16 01 c0 	sgdtl  0xc00116a8
c000152d:	e8 5f 5c 00 00       	call   c0007191 <ReloadGDT>
c0001532:	0f 01 15 a8 16 01 c0 	lgdtl  0xc00116a8
c0001539:	0f 01 1d 28 e7 00 c0 	lidtl  0xc000e728
c0001540:	ea 47 15 00 c0 08 00 	ljmp   $0x8,$0xc0001547

c0001547 <csinit>:
c0001547:	31 c0                	xor    %eax,%eax
c0001549:	66 b8 40 00          	mov    $0x40,%ax
c000154d:	0f 00 d8             	ltr    %ax
c0001550:	66 87 db             	xchg   %bx,%bx
c0001553:	e9 bb 0a 00 00       	jmp    c0002013 <kernel_main>
c0001558:	f4                   	hlt    
c0001559:	eb fe                	jmp    c0001559 <csinit+0x12>
c000155b:	fb                   	sti    
c000155c:	b4 0b                	mov    $0xb,%ah
c000155e:	b0 4d                	mov    $0x4d,%al
c0001560:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001567:	eb fe                	jmp    c0001567 <csinit+0x20>
c0001569:	f4                   	hlt    
c000156a:	6a 00                	push   $0x0
c000156c:	9d                   	popf   
c000156d:	eb fe                	jmp    c000156d <csinit+0x26>
c000156f:	e8 3c 09 00 00       	call   c0001eb0 <test>
c0001574:	6a 01                	push   $0x1
c0001576:	6a 02                	push   $0x2
c0001578:	6a 03                	push   $0x3
c000157a:	f4                   	hlt    
c000157b:	66 90                	xchg   %ax,%ax
c000157d:	66 90                	xchg   %ax,%ax
c000157f:	90                   	nop

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
c0001661:	e8 34 05 00 00       	call   c0001b9a <exception_handler>
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
c0001682:	ff 05 44 f7 00 c0    	incl   0xc000f744
c0001688:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c000168f:	75 05                	jne    c0001696 <hwint0.2>

c0001691 <hwint0.1>:
c0001691:	bc 00 e7 00 c0       	mov    $0xc000e700,%esp

c0001696 <hwint0.2>:
c0001696:	fb                   	sti    
c0001697:	e8 1b 57 00 00       	call   c0006db7 <clock_handler>
c000169c:	b0 f8                	mov    $0xf8,%al
c000169e:	e6 21                	out    %al,$0x21
c00016a0:	fa                   	cli    
c00016a1:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
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
c00016cb:	ff 05 44 f7 00 c0    	incl   0xc000f744
c00016d1:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c00016d8:	75 05                	jne    c00016df <hwint1.2>

c00016da <hwint1.1>:
c00016da:	bc 00 e7 00 c0       	mov    $0xc000e700,%esp

c00016df <hwint1.2>:
c00016df:	fb                   	sti    
c00016e0:	e8 5f 65 00 00       	call   c0007c44 <keyboard_handler>
c00016e5:	b0 f8                	mov    $0xf8,%al
c00016e7:	e6 21                	out    %al,$0x21
c00016e9:	fa                   	cli    
c00016ea:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
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
c0001717:	ff 05 44 f7 00 c0    	incl   0xc000f744
c000171d:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c0001724:	75 05                	jne    c000172b <hwint14.2>

c0001726 <hwint14.1>:
c0001726:	bc 00 e7 00 c0       	mov    $0xc000e700,%esp

c000172b <hwint14.2>:
c000172b:	fb                   	sti    
c000172c:	e8 65 34 00 00       	call   c0004b96 <hd_handler>
c0001731:	b0 bf                	mov    $0xbf,%al
c0001733:	e6 a1                	out    %al,$0xa1
c0001735:	fa                   	cli    
c0001736:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
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
c0001757:	ff 05 44 f7 00 c0    	incl   0xc000f744
c000175d:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c0001764:	75 05                	jne    c000176b <sys_call.2>

c0001766 <sys_call.1>:
c0001766:	bc 00 e7 00 c0       	mov    $0xc000e700,%esp

c000176b <sys_call.2>:
c000176b:	fb                   	sti    
c000176c:	56                   	push   %esi
c000176d:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c0001773:	53                   	push   %ebx
c0001774:	51                   	push   %ecx
c0001775:	ff 14 85 ec d0 00 c0 	call   *-0x3fff2f14(,%eax,4)
c000177c:	83 c4 0c             	add    $0xc,%esp
c000177f:	5e                   	pop    %esi
c0001780:	89 46 2c             	mov    %eax,0x2c(%esi)
c0001783:	fa                   	cli    
c0001784:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c000178b:	75 38                	jne    c00017c5 <reenter_restore>
c000178d:	eb 22                	jmp    c00017b1 <restore>

c000178f <restart>:
c000178f:	ff 0d 44 f7 00 c0    	decl   0xc000f744
c0001795:	8b 25 60 fb 00 c0    	mov    0xc000fb60,%esp
c000179b:	0f 00 54 24 44       	lldt   0x44(%esp)
c00017a0:	8d 44 24 44          	lea    0x44(%esp),%eax
c00017a4:	a3 24 16 01 c0       	mov    %eax,0xc0011624
c00017a9:	0f a9                	pop    %gs
c00017ab:	0f a1                	pop    %fs
c00017ad:	07                   	pop    %es
c00017ae:	1f                   	pop    %ds
c00017af:	61                   	popa   
c00017b0:	cf                   	iret   

c00017b1 <restore>:
c00017b1:	8b 25 60 fb 00 c0    	mov    0xc000fb60,%esp
c00017b7:	0f 00 54 24 44       	lldt   0x44(%esp)
c00017bc:	8d 44 24 44          	lea    0x44(%esp),%eax
c00017c0:	a3 24 16 01 c0       	mov    %eax,0xc0011624

c00017c5 <reenter_restore>:
c00017c5:	ff 0d 44 f7 00 c0    	decl   0xc000f744
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
c0001811:	8b 15 24 16 01 c0    	mov    0xc0011624,%edx
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
c0001844:	ff 35 44 f7 00 c0    	pushl  0xc000f744
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
c0001874:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c000187a:	e8 f2 02 00 00       	call   c0001b71 <disp_int>
c000187f:	83 c4 04             	add    $0x4,%esp
c0001882:	58                   	pop    %eax
c0001883:	5a                   	pop    %edx
c0001884:	52                   	push   %edx
c0001885:	50                   	push   %eax
c0001886:	68 00 e7 00 c0       	push   $0xc000e700
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
c00018d2:	e8 74 67 00 00       	call   c000804b <open>
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
c0001929:	e8 61 86 00 00       	call   c0009f8f <Memset>
c000192e:	83 c4 10             	add    $0x10,%esp
c0001931:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0001934:	c1 e0 09             	shl    $0x9,%eax
c0001937:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000193a:	83 ec 04             	sub    $0x4,%esp
c000193d:	50                   	push   %eax
c000193e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001944:	50                   	push   %eax
c0001945:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001948:	e8 53 67 00 00       	call   c00080a0 <read>
c000194d:	83 c4 10             	add    $0x10,%esp
c0001950:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001957:	83 ec 04             	sub    $0x4,%esp
c000195a:	68 00 20 00 00       	push   $0x2000
c000195f:	6a 00                	push   $0x0
c0001961:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001967:	50                   	push   %eax
c0001968:	e8 22 86 00 00       	call   c0009f8f <Memset>
c000196d:	83 c4 10             	add    $0x10,%esp
c0001970:	83 ec 04             	sub    $0x4,%esp
c0001973:	68 00 02 00 00       	push   $0x200
c0001978:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000197e:	50                   	push   %eax
c000197f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001982:	e8 19 67 00 00       	call   c00080a0 <read>
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
c00019bb:	e8 8b 66 00 00       	call   c000804b <open>
c00019c0:	83 c4 10             	add    $0x10,%esp
c00019c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00019c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00019cd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00019d0:	83 c0 7c             	add    $0x7c,%eax
c00019d3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00019d6:	83 ec 0c             	sub    $0xc,%esp
c00019d9:	ff 75 cc             	pushl  -0x34(%ebp)
c00019dc:	e8 e7 85 00 00       	call   c0009fc8 <Strlen>
c00019e1:	83 c4 10             	add    $0x10,%esp
c00019e4:	85 c0                	test   %eax,%eax
c00019e6:	75 16                	jne    c00019fe <untar+0x13d>
c00019e8:	83 ec 0c             	sub    $0xc,%esp
c00019eb:	ff 75 c4             	pushl  -0x3c(%ebp)
c00019ee:	e8 d5 85 00 00       	call   c0009fc8 <Strlen>
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
c0001a5c:	e8 2e 85 00 00       	call   c0009f8f <Memset>
c0001a61:	83 c4 10             	add    $0x10,%esp
c0001a64:	83 ec 04             	sub    $0x4,%esp
c0001a67:	ff 75 bc             	pushl  -0x44(%ebp)
c0001a6a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001a70:	50                   	push   %eax
c0001a71:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001a74:	e8 27 66 00 00       	call   c00080a0 <read>
c0001a79:	83 c4 10             	add    $0x10,%esp
c0001a7c:	01 45 f4             	add    %eax,-0xc(%ebp)
c0001a7f:	83 ec 04             	sub    $0x4,%esp
c0001a82:	ff 75 bc             	pushl  -0x44(%ebp)
c0001a85:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001a8b:	50                   	push   %eax
c0001a8c:	ff 75 c8             	pushl  -0x38(%ebp)
c0001a8f:	e8 43 66 00 00       	call   c00080d7 <write>
c0001a94:	83 c4 10             	add    $0x10,%esp
c0001a97:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0001a9a:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0001a9d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0001aa1:	75 9b                	jne    c0001a3e <untar+0x17d>
c0001aa3:	83 ec 0c             	sub    $0xc,%esp
c0001aa6:	ff 75 c8             	pushl  -0x38(%ebp)
c0001aa9:	e8 60 66 00 00       	call   c000810e <close>
c0001aae:	83 c4 10             	add    $0x10,%esp
c0001ab1:	e9 43 fe ff ff       	jmp    c00018f9 <untar+0x38>
c0001ab6:	90                   	nop
c0001ab7:	eb 01                	jmp    c0001aba <untar+0x1f9>
c0001ab9:	90                   	nop
c0001aba:	83 ec 0c             	sub    $0xc,%esp
c0001abd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001ac0:	e8 49 66 00 00       	call   c000810e <close>
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

c0001b9a <exception_handler>:
c0001b9a:	55                   	push   %ebp
c0001b9b:	89 e5                	mov    %esp,%ebp
c0001b9d:	57                   	push   %edi
c0001b9e:	56                   	push   %esi
c0001b9f:	53                   	push   %ebx
c0001ba0:	83 ec 6c             	sub    $0x6c,%esp
c0001ba3:	8d 45 90             	lea    -0x70(%ebp),%eax
c0001ba6:	bb 80 97 00 c0       	mov    $0xc0009780,%ebx
c0001bab:	ba 13 00 00 00       	mov    $0x13,%edx
c0001bb0:	89 c7                	mov    %eax,%edi
c0001bb2:	89 de                	mov    %ebx,%esi
c0001bb4:	89 d1                	mov    %edx,%ecx
c0001bb6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0001bb8:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0001bbf:	2e 00 00 
c0001bc2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0001bc9:	eb 14                	jmp    c0001bdf <exception_handler+0x45>
c0001bcb:	83 ec 0c             	sub    $0xc,%esp
c0001bce:	68 60 95 00 c0       	push   $0xc0009560
c0001bd3:	e8 b4 f9 ff ff       	call   c000158c <disp_str>
c0001bd8:	83 c4 10             	add    $0x10,%esp
c0001bdb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0001bdf:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0001be6:	7e e3                	jle    c0001bcb <exception_handler+0x31>
c0001be8:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0001bef:	2e 00 00 
c0001bf2:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0001bf9:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bfc:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0001c00:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001c03:	83 ec 08             	sub    $0x8,%esp
c0001c06:	ff 75 e0             	pushl  -0x20(%ebp)
c0001c09:	ff 75 dc             	pushl  -0x24(%ebp)
c0001c0c:	e8 b6 f9 ff ff       	call   c00015c7 <disp_str_colour>
c0001c11:	83 c4 10             	add    $0x10,%esp
c0001c14:	83 ec 0c             	sub    $0xc,%esp
c0001c17:	68 62 95 00 c0       	push   $0xc0009562
c0001c1c:	e8 6b f9 ff ff       	call   c000158c <disp_str>
c0001c21:	83 c4 10             	add    $0x10,%esp
c0001c24:	83 ec 08             	sub    $0x8,%esp
c0001c27:	ff 75 e0             	pushl  -0x20(%ebp)
c0001c2a:	68 65 95 00 c0       	push   $0xc0009565
c0001c2f:	e8 93 f9 ff ff       	call   c00015c7 <disp_str_colour>
c0001c34:	83 c4 10             	add    $0x10,%esp
c0001c37:	83 ec 0c             	sub    $0xc,%esp
c0001c3a:	ff 75 08             	pushl  0x8(%ebp)
c0001c3d:	e8 2f ff ff ff       	call   c0001b71 <disp_int>
c0001c42:	83 c4 10             	add    $0x10,%esp
c0001c45:	83 ec 0c             	sub    $0xc,%esp
c0001c48:	68 62 95 00 c0       	push   $0xc0009562
c0001c4d:	e8 3a f9 ff ff       	call   c000158c <disp_str>
c0001c52:	83 c4 10             	add    $0x10,%esp
c0001c55:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0001c59:	74 44                	je     c0001c9f <exception_handler+0x105>
c0001c5b:	83 ec 08             	sub    $0x8,%esp
c0001c5e:	ff 75 e0             	pushl  -0x20(%ebp)
c0001c61:	68 6d 95 00 c0       	push   $0xc000956d
c0001c66:	e8 5c f9 ff ff       	call   c00015c7 <disp_str_colour>
c0001c6b:	83 c4 10             	add    $0x10,%esp
c0001c6e:	83 ec 08             	sub    $0x8,%esp
c0001c71:	ff 75 e0             	pushl  -0x20(%ebp)
c0001c74:	68 6d 95 00 c0       	push   $0xc000956d
c0001c79:	e8 49 f9 ff ff       	call   c00015c7 <disp_str_colour>
c0001c7e:	83 c4 10             	add    $0x10,%esp
c0001c81:	83 ec 0c             	sub    $0xc,%esp
c0001c84:	ff 75 0c             	pushl  0xc(%ebp)
c0001c87:	e8 e5 fe ff ff       	call   c0001b71 <disp_int>
c0001c8c:	83 c4 10             	add    $0x10,%esp
c0001c8f:	83 ec 0c             	sub    $0xc,%esp
c0001c92:	68 62 95 00 c0       	push   $0xc0009562
c0001c97:	e8 f0 f8 ff ff       	call   c000158c <disp_str>
c0001c9c:	83 c4 10             	add    $0x10,%esp
c0001c9f:	83 ec 08             	sub    $0x8,%esp
c0001ca2:	ff 75 e0             	pushl  -0x20(%ebp)
c0001ca5:	68 77 95 00 c0       	push   $0xc0009577
c0001caa:	e8 18 f9 ff ff       	call   c00015c7 <disp_str_colour>
c0001caf:	83 c4 10             	add    $0x10,%esp
c0001cb2:	83 ec 0c             	sub    $0xc,%esp
c0001cb5:	ff 75 14             	pushl  0x14(%ebp)
c0001cb8:	e8 b4 fe ff ff       	call   c0001b71 <disp_int>
c0001cbd:	83 c4 10             	add    $0x10,%esp
c0001cc0:	83 ec 0c             	sub    $0xc,%esp
c0001cc3:	68 62 95 00 c0       	push   $0xc0009562
c0001cc8:	e8 bf f8 ff ff       	call   c000158c <disp_str>
c0001ccd:	83 c4 10             	add    $0x10,%esp
c0001cd0:	83 ec 08             	sub    $0x8,%esp
c0001cd3:	ff 75 e0             	pushl  -0x20(%ebp)
c0001cd6:	68 7b 95 00 c0       	push   $0xc000957b
c0001cdb:	e8 e7 f8 ff ff       	call   c00015c7 <disp_str_colour>
c0001ce0:	83 c4 10             	add    $0x10,%esp
c0001ce3:	83 ec 0c             	sub    $0xc,%esp
c0001ce6:	ff 75 10             	pushl  0x10(%ebp)
c0001ce9:	e8 83 fe ff ff       	call   c0001b71 <disp_int>
c0001cee:	83 c4 10             	add    $0x10,%esp
c0001cf1:	83 ec 0c             	sub    $0xc,%esp
c0001cf4:	68 62 95 00 c0       	push   $0xc0009562
c0001cf9:	e8 8e f8 ff ff       	call   c000158c <disp_str>
c0001cfe:	83 c4 10             	add    $0x10,%esp
c0001d01:	83 ec 08             	sub    $0x8,%esp
c0001d04:	ff 75 e0             	pushl  -0x20(%ebp)
c0001d07:	68 80 95 00 c0       	push   $0xc0009580
c0001d0c:	e8 b6 f8 ff ff       	call   c00015c7 <disp_str_colour>
c0001d11:	83 c4 10             	add    $0x10,%esp
c0001d14:	83 ec 0c             	sub    $0xc,%esp
c0001d17:	ff 75 18             	pushl  0x18(%ebp)
c0001d1a:	e8 52 fe ff ff       	call   c0001b71 <disp_int>
c0001d1f:	83 c4 10             	add    $0x10,%esp
c0001d22:	83 ec 0c             	sub    $0xc,%esp
c0001d25:	68 62 95 00 c0       	push   $0xc0009562
c0001d2a:	e8 5d f8 ff ff       	call   c000158c <disp_str>
c0001d2f:	83 c4 10             	add    $0x10,%esp
c0001d32:	90                   	nop
c0001d33:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0001d36:	5b                   	pop    %ebx
c0001d37:	5e                   	pop    %esi
c0001d38:	5f                   	pop    %edi
c0001d39:	5d                   	pop    %ebp
c0001d3a:	c3                   	ret    

c0001d3b <init_internal_interrupt>:
c0001d3b:	55                   	push   %ebp
c0001d3c:	89 e5                	mov    %esp,%ebp
c0001d3e:	83 ec 08             	sub    $0x8,%esp
c0001d41:	6a 0e                	push   $0xe
c0001d43:	6a 08                	push   $0x8
c0001d45:	68 03 16 00 c0       	push   $0xc0001603
c0001d4a:	6a 00                	push   $0x0
c0001d4c:	e8 e4 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001d51:	83 c4 10             	add    $0x10,%esp
c0001d54:	6a 0e                	push   $0xe
c0001d56:	6a 08                	push   $0x8
c0001d58:	68 09 16 00 c0       	push   $0xc0001609
c0001d5d:	6a 01                	push   $0x1
c0001d5f:	e8 d1 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001d64:	83 c4 10             	add    $0x10,%esp
c0001d67:	6a 0e                	push   $0xe
c0001d69:	6a 08                	push   $0x8
c0001d6b:	68 0f 16 00 c0       	push   $0xc000160f
c0001d70:	6a 02                	push   $0x2
c0001d72:	e8 be 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001d77:	83 c4 10             	add    $0x10,%esp
c0001d7a:	6a 0e                	push   $0xe
c0001d7c:	6a 08                	push   $0x8
c0001d7e:	68 15 16 00 c0       	push   $0xc0001615
c0001d83:	6a 03                	push   $0x3
c0001d85:	e8 ab 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001d8a:	83 c4 10             	add    $0x10,%esp
c0001d8d:	6a 0e                	push   $0xe
c0001d8f:	6a 08                	push   $0x8
c0001d91:	68 1b 16 00 c0       	push   $0xc000161b
c0001d96:	6a 04                	push   $0x4
c0001d98:	e8 98 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001d9d:	83 c4 10             	add    $0x10,%esp
c0001da0:	6a 0e                	push   $0xe
c0001da2:	6a 08                	push   $0x8
c0001da4:	68 21 16 00 c0       	push   $0xc0001621
c0001da9:	6a 05                	push   $0x5
c0001dab:	e8 85 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001db0:	83 c4 10             	add    $0x10,%esp
c0001db3:	6a 0e                	push   $0xe
c0001db5:	6a 08                	push   $0x8
c0001db7:	68 27 16 00 c0       	push   $0xc0001627
c0001dbc:	6a 06                	push   $0x6
c0001dbe:	e8 72 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001dc3:	83 c4 10             	add    $0x10,%esp
c0001dc6:	6a 0e                	push   $0xe
c0001dc8:	6a 08                	push   $0x8
c0001dca:	68 2d 16 00 c0       	push   $0xc000162d
c0001dcf:	6a 07                	push   $0x7
c0001dd1:	e8 5f 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001dd6:	83 c4 10             	add    $0x10,%esp
c0001dd9:	6a 0e                	push   $0xe
c0001ddb:	6a 08                	push   $0x8
c0001ddd:	68 33 16 00 c0       	push   $0xc0001633
c0001de2:	6a 08                	push   $0x8
c0001de4:	e8 4c 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001de9:	83 c4 10             	add    $0x10,%esp
c0001dec:	6a 0e                	push   $0xe
c0001dee:	6a 08                	push   $0x8
c0001df0:	68 37 16 00 c0       	push   $0xc0001637
c0001df5:	6a 09                	push   $0x9
c0001df7:	e8 39 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001dfc:	83 c4 10             	add    $0x10,%esp
c0001dff:	6a 0e                	push   $0xe
c0001e01:	6a 08                	push   $0x8
c0001e03:	68 3d 16 00 c0       	push   $0xc000163d
c0001e08:	6a 0a                	push   $0xa
c0001e0a:	e8 26 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001e0f:	83 c4 10             	add    $0x10,%esp
c0001e12:	6a 0e                	push   $0xe
c0001e14:	6a 08                	push   $0x8
c0001e16:	68 41 16 00 c0       	push   $0xc0001641
c0001e1b:	6a 0b                	push   $0xb
c0001e1d:	e8 13 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001e22:	83 c4 10             	add    $0x10,%esp
c0001e25:	6a 0e                	push   $0xe
c0001e27:	6a 08                	push   $0x8
c0001e29:	68 45 16 00 c0       	push   $0xc0001645
c0001e2e:	6a 0c                	push   $0xc
c0001e30:	e8 00 53 00 00       	call   c0007135 <InitInterruptDesc>
c0001e35:	83 c4 10             	add    $0x10,%esp
c0001e38:	6a 0e                	push   $0xe
c0001e3a:	6a 08                	push   $0x8
c0001e3c:	68 49 16 00 c0       	push   $0xc0001649
c0001e41:	6a 0d                	push   $0xd
c0001e43:	e8 ed 52 00 00       	call   c0007135 <InitInterruptDesc>
c0001e48:	83 c4 10             	add    $0x10,%esp
c0001e4b:	6a 0e                	push   $0xe
c0001e4d:	6a 08                	push   $0x8
c0001e4f:	68 4d 16 00 c0       	push   $0xc000164d
c0001e54:	6a 0e                	push   $0xe
c0001e56:	e8 da 52 00 00       	call   c0007135 <InitInterruptDesc>
c0001e5b:	83 c4 10             	add    $0x10,%esp
c0001e5e:	6a 0e                	push   $0xe
c0001e60:	6a 08                	push   $0x8
c0001e62:	68 51 16 00 c0       	push   $0xc0001651
c0001e67:	6a 10                	push   $0x10
c0001e69:	e8 c7 52 00 00       	call   c0007135 <InitInterruptDesc>
c0001e6e:	83 c4 10             	add    $0x10,%esp
c0001e71:	6a 0e                	push   $0xe
c0001e73:	6a 08                	push   $0x8
c0001e75:	68 57 16 00 c0       	push   $0xc0001657
c0001e7a:	6a 11                	push   $0x11
c0001e7c:	e8 b4 52 00 00       	call   c0007135 <InitInterruptDesc>
c0001e81:	83 c4 10             	add    $0x10,%esp
c0001e84:	6a 0e                	push   $0xe
c0001e86:	6a 08                	push   $0x8
c0001e88:	68 5b 16 00 c0       	push   $0xc000165b
c0001e8d:	6a 12                	push   $0x12
c0001e8f:	e8 a1 52 00 00       	call   c0007135 <InitInterruptDesc>
c0001e94:	83 c4 10             	add    $0x10,%esp
c0001e97:	6a 0e                	push   $0xe
c0001e99:	6a 0e                	push   $0xe
c0001e9b:	68 45 17 00 c0       	push   $0xc0001745
c0001ea0:	68 90 00 00 00       	push   $0x90
c0001ea5:	e8 8b 52 00 00       	call   c0007135 <InitInterruptDesc>
c0001eaa:	83 c4 10             	add    $0x10,%esp
c0001ead:	90                   	nop
c0001eae:	c9                   	leave  
c0001eaf:	c3                   	ret    

c0001eb0 <test>:
c0001eb0:	55                   	push   %ebp
c0001eb1:	89 e5                	mov    %esp,%ebp
c0001eb3:	83 ec 08             	sub    $0x8,%esp
c0001eb6:	83 ec 0c             	sub    $0xc,%esp
c0001eb9:	68 cc 97 00 c0       	push   $0xc00097cc
c0001ebe:	e8 c9 f6 ff ff       	call   c000158c <disp_str>
c0001ec3:	83 c4 10             	add    $0x10,%esp
c0001ec6:	83 ec 0c             	sub    $0xc,%esp
c0001ec9:	6a 06                	push   $0x6
c0001ecb:	e8 a1 fc ff ff       	call   c0001b71 <disp_int>
c0001ed0:	83 c4 10             	add    $0x10,%esp
c0001ed3:	83 ec 0c             	sub    $0xc,%esp
c0001ed6:	68 ce 97 00 c0       	push   $0xc00097ce
c0001edb:	e8 ac f6 ff ff       	call   c000158c <disp_str>
c0001ee0:	83 c4 10             	add    $0x10,%esp
c0001ee3:	90                   	nop
c0001ee4:	c9                   	leave  
c0001ee5:	c3                   	ret    

c0001ee6 <disp_str_colour3>:
c0001ee6:	55                   	push   %ebp
c0001ee7:	89 e5                	mov    %esp,%ebp
c0001ee9:	90                   	nop
c0001eea:	5d                   	pop    %ebp
c0001eeb:	c3                   	ret    

c0001eec <spurious_irq>:
c0001eec:	55                   	push   %ebp
c0001eed:	89 e5                	mov    %esp,%ebp
c0001eef:	83 ec 08             	sub    $0x8,%esp
c0001ef2:	83 ec 08             	sub    $0x8,%esp
c0001ef5:	6a 0b                	push   $0xb
c0001ef7:	68 d0 97 00 c0       	push   $0xc00097d0
c0001efc:	e8 c6 f6 ff ff       	call   c00015c7 <disp_str_colour>
c0001f01:	83 c4 10             	add    $0x10,%esp
c0001f04:	83 ec 0c             	sub    $0xc,%esp
c0001f07:	ff 75 08             	pushl  0x8(%ebp)
c0001f0a:	e8 62 fc ff ff       	call   c0001b71 <disp_int>
c0001f0f:	83 c4 10             	add    $0x10,%esp
c0001f12:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0001f17:	83 c0 01             	add    $0x1,%eax
c0001f1a:	a3 c0 1e 01 c0       	mov    %eax,0xc0011ec0
c0001f1f:	83 ec 0c             	sub    $0xc,%esp
c0001f22:	68 f7 97 00 c0       	push   $0xc00097f7
c0001f27:	e8 60 f6 ff ff       	call   c000158c <disp_str>
c0001f2c:	83 c4 10             	add    $0x10,%esp
c0001f2f:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0001f34:	83 ec 0c             	sub    $0xc,%esp
c0001f37:	50                   	push   %eax
c0001f38:	e8 34 fc ff ff       	call   c0001b71 <disp_int>
c0001f3d:	83 c4 10             	add    $0x10,%esp
c0001f40:	83 ec 0c             	sub    $0xc,%esp
c0001f43:	68 f9 97 00 c0       	push   $0xc00097f9
c0001f48:	e8 3f f6 ff ff       	call   c000158c <disp_str>
c0001f4d:	83 c4 10             	add    $0x10,%esp
c0001f50:	83 ec 08             	sub    $0x8,%esp
c0001f53:	6a 0c                	push   $0xc
c0001f55:	68 fc 97 00 c0       	push   $0xc00097fc
c0001f5a:	e8 68 f6 ff ff       	call   c00015c7 <disp_str_colour>
c0001f5f:	83 c4 10             	add    $0x10,%esp
c0001f62:	90                   	nop
c0001f63:	c9                   	leave  
c0001f64:	c3                   	ret    

c0001f65 <init_keyboard>:
c0001f65:	55                   	push   %ebp
c0001f66:	89 e5                	mov    %esp,%ebp
c0001f68:	83 ec 18             	sub    $0x18,%esp
c0001f6b:	83 ec 04             	sub    $0x4,%esp
c0001f6e:	68 00 02 00 00       	push   $0x200
c0001f73:	6a 00                	push   $0x0
c0001f75:	68 8c fb 00 c0       	push   $0xc000fb8c
c0001f7a:	e8 10 80 00 00       	call   c0009f8f <Memset>
c0001f7f:	83 c4 10             	add    $0x10,%esp
c0001f82:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0001f89:	fb 00 c0 
c0001f8c:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0001f91:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0001f96:	c7 05 88 fb 00 c0 00 	movl   $0x0,0xc000fb88
c0001f9d:	00 00 00 
c0001fa0:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0001fa7:	00 00 00 
c0001faa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001fb1:	eb 14                	jmp    c0001fc7 <init_keyboard+0x62>
c0001fb3:	83 ec 0c             	sub    $0xc,%esp
c0001fb6:	68 60 95 00 c0       	push   $0xc0009560
c0001fbb:	e8 cc f5 ff ff       	call   c000158c <disp_str>
c0001fc0:	83 c4 10             	add    $0x10,%esp
c0001fc3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001fc7:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001fce:	7e e3                	jle    c0001fb3 <init_keyboard+0x4e>
c0001fd0:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0001fd7:	00 00 00 
c0001fda:	e8 c6 5e 00 00       	call   c0007ea5 <init_keyboard_handler>
c0001fdf:	90                   	nop
c0001fe0:	c9                   	leave  
c0001fe1:	c3                   	ret    

c0001fe2 <init>:
c0001fe2:	55                   	push   %ebp
c0001fe3:	89 e5                	mov    %esp,%ebp
c0001fe5:	83 ec 08             	sub    $0x8,%esp
c0001fe8:	66 87 db             	xchg   %bx,%bx
c0001feb:	83 ec 0c             	sub    $0xc,%esp
c0001fee:	68 21 98 00 c0       	push   $0xc0009821
c0001ff3:	e8 94 f5 ff ff       	call   c000158c <disp_str>
c0001ff8:	83 c4 10             	add    $0x10,%esp
c0001ffb:	e8 65 ff ff ff       	call   c0001f65 <init_keyboard>
c0002000:	83 ec 0c             	sub    $0xc,%esp
c0002003:	68 00 00 00 02       	push   $0x2000000
c0002008:	e8 23 74 00 00       	call   c0009430 <init_memory>
c000200d:	83 c4 10             	add    $0x10,%esp
c0002010:	90                   	nop
c0002011:	c9                   	leave  
c0002012:	c3                   	ret    

c0002013 <kernel_main>:
c0002013:	55                   	push   %ebp
c0002014:	89 e5                	mov    %esp,%ebp
c0002016:	83 ec 48             	sub    $0x48,%esp
c0002019:	83 ec 0c             	sub    $0xc,%esp
c000201c:	68 27 98 00 c0       	push   $0xc0009827
c0002021:	e8 66 f5 ff ff       	call   c000158c <disp_str>
c0002026:	83 c4 10             	add    $0x10,%esp
c0002029:	e8 b4 ff ff ff       	call   c0001fe2 <init>
c000202e:	c7 05 c0 1e 01 c0 00 	movl   $0x0,0xc0011ec0
c0002035:	00 00 00 
c0002038:	c7 05 9c 16 01 c0 00 	movl   $0x0,0xc001169c
c000203f:	00 00 00 
c0002042:	c7 05 44 f7 00 c0 00 	movl   $0x0,0xc000f744
c0002049:	00 00 00 
c000204c:	c7 45 e8 a0 31 08 c0 	movl   $0xc00831a0,-0x18(%ebp)
c0002053:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000205a:	e9 ce 02 00 00       	jmp    c000232d <kernel_main+0x31a>
c000205f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002062:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0002068:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c000206d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002070:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002073:	83 c0 09             	add    $0x9,%eax
c0002076:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000207d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002080:	66 89 50 44          	mov    %dx,0x44(%eax)
c0002084:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0002087:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000208a:	89 50 58             	mov    %edx,0x58(%eax)
c000208d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002090:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
c0002097:	00 00 00 
c000209a:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c000209e:	7e 0f                	jle    c00020af <kernel_main+0x9c>
c00020a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00020a3:	c6 80 84 01 00 00 ff 	movb   $0xff,0x184(%eax)
c00020aa:	e9 7a 02 00 00       	jmp    c0002329 <kernel_main+0x316>
c00020af:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00020b2:	c6 80 84 01 00 00 00 	movb   $0x0,0x184(%eax)
c00020b9:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
c00020bd:	7f 52                	jg     c0002111 <kernel_main+0xfe>
c00020bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00020c2:	6b c0 1c             	imul   $0x1c,%eax,%eax
c00020c5:	05 60 d0 00 c0       	add    $0xc000d060,%eax
c00020ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00020cd:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
c00020d4:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
c00020d8:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
c00020dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00020df:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
c00020e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00020e9:	8b 50 60             	mov    0x60(%eax),%edx
c00020ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00020ef:	89 50 5c             	mov    %edx,0x5c(%eax)
c00020f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00020f5:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
c00020fc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00020ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002102:	89 50 3c             	mov    %edx,0x3c(%eax)
c0002105:	81 6d e8 00 80 00 00 	subl   $0x8000,-0x18(%ebp)
c000210c:	e9 f0 00 00 00       	jmp    c0002201 <kernel_main+0x1ee>
c0002111:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002114:	6b c0 1c             	imul   $0x1c,%eax,%eax
c0002117:	2d 8c 00 00 00       	sub    $0x8c,%eax
c000211c:	05 40 d0 00 c0       	add    $0xc000d040,%eax
c0002121:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002124:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
c000212b:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
c000212f:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
c0002133:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002136:	c7 40 60 05 00 00 00 	movl   $0x5,0x60(%eax)
c000213d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002140:	8b 50 60             	mov    0x60(%eax),%edx
c0002143:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002146:	89 50 5c             	mov    %edx,0x5c(%eax)
c0002149:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000214c:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
c0002153:	83 ec 08             	sub    $0x8,%esp
c0002156:	6a 00                	push   $0x0
c0002158:	6a 01                	push   $0x1
c000215a:	e8 fe 6f 00 00       	call   c000915d <alloc_memory>
c000215f:	83 c4 10             	add    $0x10,%esp
c0002162:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002165:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
c000216c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000216f:	83 ec 08             	sub    $0x8,%esp
c0002172:	6a 00                	push   $0x0
c0002174:	50                   	push   %eax
c0002175:	e8 e3 6f 00 00       	call   c000915d <alloc_memory>
c000217a:	83 c4 10             	add    $0x10,%esp
c000217d:	89 c2                	mov    %eax,%edx
c000217f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002182:	89 50 7c             	mov    %edx,0x7c(%eax)
c0002185:	c7 45 d4 00 14 10 00 	movl   $0x101400,-0x2c(%ebp)
c000218c:	c7 45 d0 07 20 30 00 	movl   $0x302007,-0x30(%ebp)
c0002193:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002196:	05 00 0c 00 00       	add    $0xc00,%eax
c000219b:	83 ec 04             	sub    $0x4,%esp
c000219e:	68 00 04 00 00       	push   $0x400
c00021a3:	68 00 fc ff ff       	push   $0xfffffc00
c00021a8:	50                   	push   %eax
c00021a9:	e8 b3 7d 00 00       	call   c0009f61 <Memcpy>
c00021ae:	83 c4 10             	add    $0x10,%esp
c00021b1:	83 ec 0c             	sub    $0xc,%esp
c00021b4:	ff 75 dc             	pushl  -0x24(%ebp)
c00021b7:	e8 6f 6f 00 00       	call   c000912b <get_physical_address>
c00021bc:	83 c4 10             	add    $0x10,%esp
c00021bf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00021c2:	c7 45 c8 07 00 00 00 	movl   $0x7,-0x38(%ebp)
c00021c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00021cc:	05 fc 0f 00 00       	add    $0xffc,%eax
c00021d1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00021d4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00021d7:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00021da:	89 10                	mov    %edx,(%eax)
c00021dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00021df:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00021e2:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
c00021e8:	83 ec 0c             	sub    $0xc,%esp
c00021eb:	6a 00                	push   $0x0
c00021ed:	e8 6b 6d 00 00       	call   c0008f5d <get_a_page>
c00021f2:	83 c4 10             	add    $0x10,%esp
c00021f5:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c00021fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00021fe:	89 50 3c             	mov    %edx,0x3c(%eax)
c0002201:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002204:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0002207:	83 c2 68             	add    $0x68,%edx
c000220a:	83 ec 08             	sub    $0x8,%esp
c000220d:	50                   	push   %eax
c000220e:	52                   	push   %edx
c000220f:	e8 9a 7d 00 00       	call   c0009fae <Strcpy>
c0002214:	83 c4 10             	add    $0x10,%esp
c0002217:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000221a:	83 c0 46             	add    $0x46,%eax
c000221d:	83 ec 04             	sub    $0x4,%esp
c0002220:	6a 08                	push   $0x8
c0002222:	68 68 f7 00 c0       	push   $0xc000f768
c0002227:	50                   	push   %eax
c0002228:	e8 34 7d 00 00       	call   c0009f61 <Memcpy>
c000222d:	83 c4 10             	add    $0x10,%esp
c0002230:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
c0002234:	c1 e0 05             	shl    $0x5,%eax
c0002237:	83 c8 9a             	or     $0xffffff9a,%eax
c000223a:	89 c2                	mov    %eax,%edx
c000223c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000223f:	88 50 4b             	mov    %dl,0x4b(%eax)
c0002242:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002245:	83 c0 4e             	add    $0x4e,%eax
c0002248:	83 ec 04             	sub    $0x4,%esp
c000224b:	6a 08                	push   $0x8
c000224d:	68 90 f7 00 c0       	push   $0xc000f790
c0002252:	50                   	push   %eax
c0002253:	e8 09 7d 00 00       	call   c0009f61 <Memcpy>
c0002258:	83 c4 10             	add    $0x10,%esp
c000225b:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
c000225f:	c1 e0 05             	shl    $0x5,%eax
c0002262:	83 c8 92             	or     $0xffffff92,%eax
c0002265:	89 c2                	mov    %eax,%edx
c0002267:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000226a:	88 50 53             	mov    %dl,0x53(%eax)
c000226d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0002271:	83 c8 04             	or     $0x4,%eax
c0002274:	0f b6 c0             	movzbl %al,%eax
c0002277:	66 89 45 c2          	mov    %ax,-0x3e(%ebp)
c000227b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c000227f:	83 c8 0c             	or     $0xc,%eax
c0002282:	0f b6 c0             	movzbl %al,%eax
c0002285:	66 89 45 c0          	mov    %ax,-0x40(%ebp)
c0002289:	0f b7 55 c2          	movzwl -0x3e(%ebp),%edx
c000228d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002290:	89 50 34             	mov    %edx,0x34(%eax)
c0002293:	0f b7 55 c0          	movzwl -0x40(%ebp),%edx
c0002297:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000229a:	89 50 0c             	mov    %edx,0xc(%eax)
c000229d:	0f b7 55 c0          	movzwl -0x40(%ebp),%edx
c00022a1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022a4:	89 50 04             	mov    %edx,0x4(%eax)
c00022a7:	0f b7 55 c0          	movzwl -0x40(%ebp),%edx
c00022ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022ae:	89 50 08             	mov    %edx,0x8(%eax)
c00022b1:	0f b7 55 c0          	movzwl -0x40(%ebp),%edx
c00022b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022b8:	89 50 40             	mov    %edx,0x40(%eax)
c00022bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022be:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
c00022c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022c7:	8b 40 14             	mov    0x14(%eax),%eax
c00022ca:	89 c2                	mov    %eax,%edx
c00022cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022cf:	89 50 30             	mov    %edx,0x30(%eax)
c00022d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022d5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00022d8:	89 50 38             	mov    %edx,0x38(%eax)
c00022db:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022de:	c7 80 9c 01 00 00 00 	movl   $0x0,0x19c(%eax)
c00022e5:	00 00 00 
c00022e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022eb:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
c00022f2:	00 00 00 
c00022f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022f8:	c7 80 98 01 00 00 00 	movl   $0x0,0x198(%eax)
c00022ff:	00 00 00 
c0002302:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002305:	c7 80 90 01 00 00 1f 	movl   $0x1f,0x190(%eax)
c000230c:	00 00 00 
c000230f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002312:	c7 80 8c 01 00 00 1f 	movl   $0x1f,0x18c(%eax)
c0002319:	00 00 00 
c000231c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000231f:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
c0002326:	00 00 00 
c0002329:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000232d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
c0002331:	0f 8e 28 fd ff ff    	jle    c000205f <kernel_main+0x4c>
c0002337:	c7 05 60 fb 00 c0 48 	movl   $0xc0083348,0xc000fb60
c000233e:	33 08 c0 
c0002341:	e8 49 f4 ff ff       	call   c000178f <restart>
c0002346:	eb fe                	jmp    c0002346 <kernel_main+0x333>

c0002348 <TestFS>:
c0002348:	55                   	push   %ebp
c0002349:	89 e5                	mov    %esp,%ebp
c000234b:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
c0002351:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0002358:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c000235f:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0002365:	83 ec 08             	sub    $0x8,%esp
c0002368:	6a 02                	push   $0x2
c000236a:	8d 45 be             	lea    -0x42(%ebp),%eax
c000236d:	50                   	push   %eax
c000236e:	e8 d8 5c 00 00       	call   c000804b <open>
c0002373:	83 c4 10             	add    $0x10,%esp
c0002376:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002379:	83 ec 08             	sub    $0x8,%esp
c000237c:	6a 02                	push   $0x2
c000237e:	8d 45 be             	lea    -0x42(%ebp),%eax
c0002381:	50                   	push   %eax
c0002382:	e8 c4 5c 00 00       	call   c000804b <open>
c0002387:	83 c4 10             	add    $0x10,%esp
c000238a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000238d:	83 ec 0c             	sub    $0xc,%esp
c0002390:	68 33 98 00 c0       	push   $0xc0009833
c0002395:	e8 1c 0e 00 00       	call   c00031b6 <Printf>
c000239a:	83 c4 10             	add    $0x10,%esp
c000239d:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c00023a4:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c00023a8:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c00023af:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c00023b3:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c00023ba:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c00023c1:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c00023c7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00023ce:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c00023d2:	75 fa                	jne    c00023ce <TestFS+0x86>
c00023d4:	83 ec 08             	sub    $0x8,%esp
c00023d7:	6a 07                	push   $0x7
c00023d9:	8d 45 b9             	lea    -0x47(%ebp),%eax
c00023dc:	50                   	push   %eax
c00023dd:	e8 69 5c 00 00       	call   c000804b <open>
c00023e2:	83 c4 10             	add    $0x10,%esp
c00023e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00023e8:	83 ec 08             	sub    $0x8,%esp
c00023eb:	ff 75 e4             	pushl  -0x1c(%ebp)
c00023ee:	68 45 98 00 c0       	push   $0xc0009845
c00023f3:	e8 be 0d 00 00       	call   c00031b6 <Printf>
c00023f8:	83 c4 10             	add    $0x10,%esp
c00023fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002402:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0002409:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0002410:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0002417:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c000241e:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0002425:	83 ec 0c             	sub    $0xc,%esp
c0002428:	8d 45 96             	lea    -0x6a(%ebp),%eax
c000242b:	50                   	push   %eax
c000242c:	e8 97 7b 00 00       	call   c0009fc8 <Strlen>
c0002431:	83 c4 10             	add    $0x10,%esp
c0002434:	83 ec 04             	sub    $0x4,%esp
c0002437:	50                   	push   %eax
c0002438:	8d 45 96             	lea    -0x6a(%ebp),%eax
c000243b:	50                   	push   %eax
c000243c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000243f:	e8 93 5c 00 00       	call   c00080d7 <write>
c0002444:	83 c4 10             	add    $0x10,%esp
c0002447:	83 ec 04             	sub    $0x4,%esp
c000244a:	6a 14                	push   $0x14
c000244c:	6a 00                	push   $0x0
c000244e:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0002451:	50                   	push   %eax
c0002452:	e8 38 7b 00 00       	call   c0009f8f <Memset>
c0002457:	83 c4 10             	add    $0x10,%esp
c000245a:	83 ec 04             	sub    $0x4,%esp
c000245d:	6a 12                	push   $0x12
c000245f:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0002462:	50                   	push   %eax
c0002463:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002466:	e8 35 5c 00 00       	call   c00080a0 <read>
c000246b:	83 c4 10             	add    $0x10,%esp
c000246e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002471:	83 ec 08             	sub    $0x8,%esp
c0002474:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0002477:	50                   	push   %eax
c0002478:	68 4e 98 00 c0       	push   $0xc000984e
c000247d:	e8 34 0d 00 00       	call   c00031b6 <Printf>
c0002482:	83 c4 10             	add    $0x10,%esp
c0002485:	83 ec 0c             	sub    $0xc,%esp
c0002488:	6a 0a                	push   $0xa
c000248a:	e8 6a 0b 00 00       	call   c0002ff9 <delay>
c000248f:	83 c4 10             	add    $0x10,%esp
c0002492:	83 ec 08             	sub    $0x8,%esp
c0002495:	6a 07                	push   $0x7
c0002497:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c000249a:	50                   	push   %eax
c000249b:	e8 ab 5b 00 00       	call   c000804b <open>
c00024a0:	83 c4 10             	add    $0x10,%esp
c00024a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00024a6:	83 ec 08             	sub    $0x8,%esp
c00024a9:	ff 75 dc             	pushl  -0x24(%ebp)
c00024ac:	68 59 98 00 c0       	push   $0xc0009859
c00024b1:	e8 00 0d 00 00       	call   c00031b6 <Printf>
c00024b6:	83 c4 10             	add    $0x10,%esp
c00024b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00024c0:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c00024c7:	67 3a 68 
c00024ca:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c00024d1:	77 20 61 
c00024d4:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c00024db:	65 20 79 
c00024de:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c00024e5:	75 3f 00 
c00024e8:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c00024ef:	00 00 00 
c00024f2:	83 ec 0c             	sub    $0xc,%esp
c00024f5:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c00024fb:	50                   	push   %eax
c00024fc:	e8 c7 7a 00 00       	call   c0009fc8 <Strlen>
c0002501:	83 c4 10             	add    $0x10,%esp
c0002504:	83 ec 04             	sub    $0x4,%esp
c0002507:	50                   	push   %eax
c0002508:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c000250e:	50                   	push   %eax
c000250f:	ff 75 dc             	pushl  -0x24(%ebp)
c0002512:	e8 c0 5b 00 00       	call   c00080d7 <write>
c0002517:	83 c4 10             	add    $0x10,%esp
c000251a:	83 ec 04             	sub    $0x4,%esp
c000251d:	6a 14                	push   $0x14
c000251f:	6a 00                	push   $0x0
c0002521:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0002527:	50                   	push   %eax
c0002528:	e8 62 7a 00 00       	call   c0009f8f <Memset>
c000252d:	83 c4 10             	add    $0x10,%esp
c0002530:	83 ec 04             	sub    $0x4,%esp
c0002533:	6a 12                	push   $0x12
c0002535:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c000253b:	50                   	push   %eax
c000253c:	ff 75 dc             	pushl  -0x24(%ebp)
c000253f:	e8 5c 5b 00 00       	call   c00080a0 <read>
c0002544:	83 c4 10             	add    $0x10,%esp
c0002547:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000254a:	83 ec 08             	sub    $0x8,%esp
c000254d:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0002553:	50                   	push   %eax
c0002554:	68 63 98 00 c0       	push   $0xc0009863
c0002559:	e8 58 0c 00 00       	call   c00031b6 <Printf>
c000255e:	83 c4 10             	add    $0x10,%esp
c0002561:	83 ec 08             	sub    $0x8,%esp
c0002564:	6a 07                	push   $0x7
c0002566:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0002569:	50                   	push   %eax
c000256a:	e8 dc 5a 00 00       	call   c000804b <open>
c000256f:	83 c4 10             	add    $0x10,%esp
c0002572:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0002575:	83 ec 08             	sub    $0x8,%esp
c0002578:	ff 75 dc             	pushl  -0x24(%ebp)
c000257b:	68 59 98 00 c0       	push   $0xc0009859
c0002580:	e8 31 0c 00 00       	call   c00031b6 <Printf>
c0002585:	83 c4 10             	add    $0x10,%esp
c0002588:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000258f:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0002596:	20 77 69 
c0002599:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c00025a0:	6c 20 73 
c00025a3:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c00025aa:	63 63 65 
c00025ad:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c00025b4:	73 20 61 
c00025b7:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c00025be:	20 6c 61 
c00025c1:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c00025c8:	74 2e 00 
c00025cb:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c00025d2:	00 00 00 
c00025d5:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c00025dc:	00 00 
c00025de:	83 ec 0c             	sub    $0xc,%esp
c00025e1:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00025e7:	50                   	push   %eax
c00025e8:	e8 db 79 00 00       	call   c0009fc8 <Strlen>
c00025ed:	83 c4 10             	add    $0x10,%esp
c00025f0:	83 ec 04             	sub    $0x4,%esp
c00025f3:	50                   	push   %eax
c00025f4:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00025fa:	50                   	push   %eax
c00025fb:	ff 75 d4             	pushl  -0x2c(%ebp)
c00025fe:	e8 d4 5a 00 00       	call   c00080d7 <write>
c0002603:	83 c4 10             	add    $0x10,%esp
c0002606:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000260d:	eb 5c                	jmp    c000266b <TestFS+0x323>
c000260f:	83 ec 04             	sub    $0x4,%esp
c0002612:	6a 1e                	push   $0x1e
c0002614:	6a 00                	push   $0x0
c0002616:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c000261c:	50                   	push   %eax
c000261d:	e8 6d 79 00 00       	call   c0009f8f <Memset>
c0002622:	83 c4 10             	add    $0x10,%esp
c0002625:	83 ec 0c             	sub    $0xc,%esp
c0002628:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000262e:	50                   	push   %eax
c000262f:	e8 94 79 00 00       	call   c0009fc8 <Strlen>
c0002634:	83 c4 10             	add    $0x10,%esp
c0002637:	83 ec 04             	sub    $0x4,%esp
c000263a:	50                   	push   %eax
c000263b:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0002641:	50                   	push   %eax
c0002642:	ff 75 d4             	pushl  -0x2c(%ebp)
c0002645:	e8 56 5a 00 00       	call   c00080a0 <read>
c000264a:	83 c4 10             	add    $0x10,%esp
c000264d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002650:	83 ec 08             	sub    $0x8,%esp
c0002653:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0002659:	50                   	push   %eax
c000265a:	68 6e 98 00 c0       	push   $0xc000986e
c000265f:	e8 52 0b 00 00       	call   c00031b6 <Printf>
c0002664:	83 c4 10             	add    $0x10,%esp
c0002667:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000266b:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
c000266f:	7e 9e                	jle    c000260f <TestFS+0x2c7>
c0002671:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0002678:	6e 73 74 
c000267b:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0002682:	6c 6c 2e 
c0002685:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c000268c:	61 72 00 
c000268f:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0002696:	00 00 00 
c0002699:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c00026a0:	00 00 00 
c00026a3:	83 ec 08             	sub    $0x8,%esp
c00026a6:	6a 00                	push   $0x0
c00026a8:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c00026ae:	50                   	push   %eax
c00026af:	e8 97 59 00 00       	call   c000804b <open>
c00026b4:	83 c4 10             	add    $0x10,%esp
c00026b7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00026ba:	83 ec 08             	sub    $0x8,%esp
c00026bd:	ff 75 cc             	pushl  -0x34(%ebp)
c00026c0:	68 79 98 00 c0       	push   $0xc0009879
c00026c5:	e8 ec 0a 00 00       	call   c00031b6 <Printf>
c00026ca:	83 c4 10             	add    $0x10,%esp
c00026cd:	83 ec 04             	sub    $0x4,%esp
c00026d0:	6a 14                	push   $0x14
c00026d2:	6a 00                	push   $0x0
c00026d4:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c00026da:	50                   	push   %eax
c00026db:	e8 af 78 00 00       	call   c0009f8f <Memset>
c00026e0:	83 c4 10             	add    $0x10,%esp
c00026e3:	83 ec 04             	sub    $0x4,%esp
c00026e6:	68 00 02 00 00       	push   $0x200
c00026eb:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c00026f1:	50                   	push   %eax
c00026f2:	ff 75 cc             	pushl  -0x34(%ebp)
c00026f5:	e8 a6 59 00 00       	call   c00080a0 <read>
c00026fa:	83 c4 10             	add    $0x10,%esp
c00026fd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002700:	83 ec 08             	sub    $0x8,%esp
c0002703:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0002709:	50                   	push   %eax
c000270a:	68 83 98 00 c0       	push   $0xc0009883
c000270f:	e8 a2 0a 00 00       	call   c00031b6 <Printf>
c0002714:	83 c4 10             	add    $0x10,%esp
c0002717:	e9 b2 fc ff ff       	jmp    c00023ce <TestFS+0x86>

c000271c <wait_exit>:
c000271c:	55                   	push   %ebp
c000271d:	89 e5                	mov    %esp,%ebp
c000271f:	83 ec 28             	sub    $0x28,%esp
c0002722:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0002729:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0002730:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0002736:	83 ec 08             	sub    $0x8,%esp
c0002739:	6a 02                	push   $0x2
c000273b:	8d 45 de             	lea    -0x22(%ebp),%eax
c000273e:	50                   	push   %eax
c000273f:	e8 07 59 00 00       	call   c000804b <open>
c0002744:	83 c4 10             	add    $0x10,%esp
c0002747:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000274a:	83 ec 08             	sub    $0x8,%esp
c000274d:	6a 02                	push   $0x2
c000274f:	8d 45 de             	lea    -0x22(%ebp),%eax
c0002752:	50                   	push   %eax
c0002753:	e8 f3 58 00 00       	call   c000804b <open>
c0002758:	83 c4 10             	add    $0x10,%esp
c000275b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000275e:	e8 5e 5a 00 00       	call   c00081c1 <fork>
c0002763:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002766:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000276a:	7e 25                	jle    c0002791 <wait_exit+0x75>
c000276c:	83 ec 0c             	sub    $0xc,%esp
c000276f:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0002772:	50                   	push   %eax
c0002773:	e8 e2 59 00 00       	call   c000815a <wait>
c0002778:	83 c4 10             	add    $0x10,%esp
c000277b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000277e:	83 ec 08             	sub    $0x8,%esp
c0002781:	50                   	push   %eax
c0002782:	68 8e 98 00 c0       	push   $0xc000988e
c0002787:	e8 2a 0a 00 00       	call   c00031b6 <Printf>
c000278c:	83 c4 10             	add    $0x10,%esp
c000278f:	eb fe                	jmp    c000278f <wait_exit+0x73>
c0002791:	83 ec 0c             	sub    $0xc,%esp
c0002794:	68 a9 98 00 c0       	push   $0xc00098a9
c0002799:	e8 18 0a 00 00       	call   c00031b6 <Printf>
c000279e:	83 c4 10             	add    $0x10,%esp
c00027a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00027ab:	8d 50 01             	lea    0x1(%eax),%edx
c00027ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00027b1:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c00027b6:	7f 02                	jg     c00027ba <wait_exit+0x9e>
c00027b8:	eb ee                	jmp    c00027a8 <wait_exit+0x8c>
c00027ba:	90                   	nop
c00027bb:	83 ec 0c             	sub    $0xc,%esp
c00027be:	68 b5 98 00 c0       	push   $0xc00098b5
c00027c3:	e8 ee 09 00 00       	call   c00031b6 <Printf>
c00027c8:	83 c4 10             	add    $0x10,%esp
c00027cb:	83 ec 0c             	sub    $0xc,%esp
c00027ce:	6a 09                	push   $0x9
c00027d0:	e8 c3 59 00 00       	call   c0008198 <exit>
c00027d5:	83 c4 10             	add    $0x10,%esp
c00027d8:	83 ec 0c             	sub    $0xc,%esp
c00027db:	68 c3 98 00 c0       	push   $0xc00098c3
c00027e0:	e8 d1 09 00 00       	call   c00031b6 <Printf>
c00027e5:	83 c4 10             	add    $0x10,%esp
c00027e8:	eb fe                	jmp    c00027e8 <wait_exit+0xcc>

c00027ea <INIT_fork>:
c00027ea:	55                   	push   %ebp
c00027eb:	89 e5                	mov    %esp,%ebp
c00027ed:	53                   	push   %ebx
c00027ee:	81 ec 84 00 00 00    	sub    $0x84,%esp
c00027f4:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c00027fb:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0002802:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0002808:	83 ec 08             	sub    $0x8,%esp
c000280b:	6a 02                	push   $0x2
c000280d:	8d 45 da             	lea    -0x26(%ebp),%eax
c0002810:	50                   	push   %eax
c0002811:	e8 35 58 00 00       	call   c000804b <open>
c0002816:	83 c4 10             	add    $0x10,%esp
c0002819:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000281c:	83 ec 08             	sub    $0x8,%esp
c000281f:	6a 02                	push   $0x2
c0002821:	8d 45 da             	lea    -0x26(%ebp),%eax
c0002824:	50                   	push   %eax
c0002825:	e8 21 58 00 00       	call   c000804b <open>
c000282a:	83 c4 10             	add    $0x10,%esp
c000282d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002830:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c0002837:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c000283e:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c0002845:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c000284c:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c0002853:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c000285a:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0002861:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0002868:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c000286f:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0002876:	83 ec 0c             	sub    $0xc,%esp
c0002879:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c000287c:	50                   	push   %eax
c000287d:	e8 46 77 00 00       	call   c0009fc8 <Strlen>
c0002882:	83 c4 10             	add    $0x10,%esp
c0002885:	83 ec 04             	sub    $0x4,%esp
c0002888:	50                   	push   %eax
c0002889:	6a 00                	push   $0x0
c000288b:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c000288e:	50                   	push   %eax
c000288f:	e8 fb 76 00 00       	call   c0009f8f <Memset>
c0002894:	83 c4 10             	add    $0x10,%esp
c0002897:	83 ec 04             	sub    $0x4,%esp
c000289a:	6a 28                	push   $0x28
c000289c:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c000289f:	50                   	push   %eax
c00028a0:	ff 75 e8             	pushl  -0x18(%ebp)
c00028a3:	e8 f8 57 00 00       	call   c00080a0 <read>
c00028a8:	83 c4 10             	add    $0x10,%esp
c00028ab:	83 ec 04             	sub    $0x4,%esp
c00028ae:	6a 28                	push   $0x28
c00028b0:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00028b3:	50                   	push   %eax
c00028b4:	ff 75 ec             	pushl  -0x14(%ebp)
c00028b7:	e8 1b 58 00 00       	call   c00080d7 <write>
c00028bc:	83 c4 10             	add    $0x10,%esp
c00028bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00028c6:	e8 f6 58 00 00       	call   c00081c1 <fork>
c00028cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00028ce:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00028d2:	0f 8e dd 00 00 00    	jle    c00029b5 <INIT_fork+0x1cb>
c00028d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00028dc:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
c00028e3:	61 72 65 
c00028e6:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
c00028ed:	8d 45 87             	lea    -0x79(%ebp),%eax
c00028f0:	b9 20 00 00 00       	mov    $0x20,%ecx
c00028f5:	bb 00 00 00 00       	mov    $0x0,%ebx
c00028fa:	89 18                	mov    %ebx,(%eax)
c00028fc:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0002900:	8d 50 04             	lea    0x4(%eax),%edx
c0002903:	83 e2 fc             	and    $0xfffffffc,%edx
c0002906:	29 d0                	sub    %edx,%eax
c0002908:	01 c1                	add    %eax,%ecx
c000290a:	83 e1 fc             	and    $0xfffffffc,%ecx
c000290d:	83 e1 fc             	and    $0xfffffffc,%ecx
c0002910:	b8 00 00 00 00       	mov    $0x0,%eax
c0002915:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0002918:	83 c0 04             	add    $0x4,%eax
c000291b:	39 c8                	cmp    %ecx,%eax
c000291d:	72 f6                	jb     c0002915 <INIT_fork+0x12b>
c000291f:	01 c2                	add    %eax,%edx
c0002921:	83 ec 0c             	sub    $0xc,%esp
c0002924:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000292a:	50                   	push   %eax
c000292b:	e8 98 76 00 00       	call   c0009fc8 <Strlen>
c0002930:	83 c4 10             	add    $0x10,%esp
c0002933:	83 ec 04             	sub    $0x4,%esp
c0002936:	50                   	push   %eax
c0002937:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000293d:	50                   	push   %eax
c000293e:	ff 75 ec             	pushl  -0x14(%ebp)
c0002941:	e8 91 57 00 00       	call   c00080d7 <write>
c0002946:	83 c4 10             	add    $0x10,%esp
c0002949:	83 ec 0c             	sub    $0xc,%esp
c000294c:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002952:	50                   	push   %eax
c0002953:	e8 70 76 00 00       	call   c0009fc8 <Strlen>
c0002958:	83 c4 10             	add    $0x10,%esp
c000295b:	83 ec 04             	sub    $0x4,%esp
c000295e:	50                   	push   %eax
c000295f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002965:	50                   	push   %eax
c0002966:	ff 75 ec             	pushl  -0x14(%ebp)
c0002969:	e8 69 57 00 00       	call   c00080d7 <write>
c000296e:	83 c4 10             	add    $0x10,%esp
c0002971:	83 ec 0c             	sub    $0xc,%esp
c0002974:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000297a:	50                   	push   %eax
c000297b:	e8 48 76 00 00       	call   c0009fc8 <Strlen>
c0002980:	83 c4 10             	add    $0x10,%esp
c0002983:	83 ec 04             	sub    $0x4,%esp
c0002986:	50                   	push   %eax
c0002987:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000298d:	50                   	push   %eax
c000298e:	ff 75 ec             	pushl  -0x14(%ebp)
c0002991:	e8 41 57 00 00       	call   c00080d7 <write>
c0002996:	83 c4 10             	add    $0x10,%esp
c0002999:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00029a0:	eb 08                	jmp    c00029aa <INIT_fork+0x1c0>
c00029a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00029a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00029aa:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c00029ae:	7e f2                	jle    c00029a2 <INIT_fork+0x1b8>
c00029b0:	e9 0f 01 00 00       	jmp    c0002ac4 <INIT_fork+0x2da>
c00029b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00029b9:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c00029bd:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
c00029c4:	68 69 6c 
c00029c7:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
c00029ce:	8d 45 87             	lea    -0x79(%ebp),%eax
c00029d1:	b9 20 00 00 00       	mov    $0x20,%ecx
c00029d6:	bb 00 00 00 00       	mov    $0x0,%ebx
c00029db:	89 18                	mov    %ebx,(%eax)
c00029dd:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c00029e1:	8d 50 04             	lea    0x4(%eax),%edx
c00029e4:	83 e2 fc             	and    $0xfffffffc,%edx
c00029e7:	29 d0                	sub    %edx,%eax
c00029e9:	01 c1                	add    %eax,%ecx
c00029eb:	83 e1 fc             	and    $0xfffffffc,%ecx
c00029ee:	83 e1 fc             	and    $0xfffffffc,%ecx
c00029f1:	b8 00 00 00 00       	mov    $0x0,%eax
c00029f6:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c00029f9:	83 c0 04             	add    $0x4,%eax
c00029fc:	39 c8                	cmp    %ecx,%eax
c00029fe:	72 f6                	jb     c00029f6 <INIT_fork+0x20c>
c0002a00:	01 c2                	add    %eax,%edx
c0002a02:	83 ec 0c             	sub    $0xc,%esp
c0002a05:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002a0b:	50                   	push   %eax
c0002a0c:	e8 b7 75 00 00       	call   c0009fc8 <Strlen>
c0002a11:	83 c4 10             	add    $0x10,%esp
c0002a14:	83 ec 04             	sub    $0x4,%esp
c0002a17:	50                   	push   %eax
c0002a18:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002a1e:	50                   	push   %eax
c0002a1f:	ff 75 ec             	pushl  -0x14(%ebp)
c0002a22:	e8 b0 56 00 00       	call   c00080d7 <write>
c0002a27:	83 c4 10             	add    $0x10,%esp
c0002a2a:	83 ec 0c             	sub    $0xc,%esp
c0002a2d:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002a33:	50                   	push   %eax
c0002a34:	e8 8f 75 00 00       	call   c0009fc8 <Strlen>
c0002a39:	83 c4 10             	add    $0x10,%esp
c0002a3c:	83 ec 04             	sub    $0x4,%esp
c0002a3f:	50                   	push   %eax
c0002a40:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002a46:	50                   	push   %eax
c0002a47:	ff 75 ec             	pushl  -0x14(%ebp)
c0002a4a:	e8 88 56 00 00       	call   c00080d7 <write>
c0002a4f:	83 c4 10             	add    $0x10,%esp
c0002a52:	83 ec 0c             	sub    $0xc,%esp
c0002a55:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002a5b:	50                   	push   %eax
c0002a5c:	e8 67 75 00 00       	call   c0009fc8 <Strlen>
c0002a61:	83 c4 10             	add    $0x10,%esp
c0002a64:	83 ec 04             	sub    $0x4,%esp
c0002a67:	50                   	push   %eax
c0002a68:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002a6e:	50                   	push   %eax
c0002a6f:	ff 75 ec             	pushl  -0x14(%ebp)
c0002a72:	e8 60 56 00 00       	call   c00080d7 <write>
c0002a77:	83 c4 10             	add    $0x10,%esp
c0002a7a:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
c0002a81:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
c0002a88:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
c0002a8e:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
c0002a92:	83 ec 0c             	sub    $0xc,%esp
c0002a95:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0002a98:	50                   	push   %eax
c0002a99:	e8 2a 75 00 00       	call   c0009fc8 <Strlen>
c0002a9e:	83 c4 10             	add    $0x10,%esp
c0002aa1:	83 ec 04             	sub    $0x4,%esp
c0002aa4:	50                   	push   %eax
c0002aa5:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0002aa8:	50                   	push   %eax
c0002aa9:	ff 75 ec             	pushl  -0x14(%ebp)
c0002aac:	e8 26 56 00 00       	call   c00080d7 <write>
c0002ab1:	83 c4 10             	add    $0x10,%esp
c0002ab4:	83 ec 0c             	sub    $0xc,%esp
c0002ab7:	68 d1 98 00 c0       	push   $0xc00098d1
c0002abc:	e8 21 0a 00 00       	call   c00034e2 <spin>
c0002ac1:	83 c4 10             	add    $0x10,%esp
c0002ac4:	83 ec 0c             	sub    $0xc,%esp
c0002ac7:	68 d8 98 00 c0       	push   $0xc00098d8
c0002acc:	e8 11 0a 00 00       	call   c00034e2 <spin>
c0002ad1:	83 c4 10             	add    $0x10,%esp
c0002ad4:	90                   	nop
c0002ad5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0002ad8:	c9                   	leave  
c0002ad9:	c3                   	ret    

c0002ada <simple_shell>:
c0002ada:	55                   	push   %ebp
c0002adb:	89 e5                	mov    %esp,%ebp
c0002add:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0002ae3:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0002aea:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0002af1:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0002af7:	83 ec 08             	sub    $0x8,%esp
c0002afa:	6a 02                	push   $0x2
c0002afc:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0002aff:	50                   	push   %eax
c0002b00:	e8 46 55 00 00       	call   c000804b <open>
c0002b05:	83 c4 10             	add    $0x10,%esp
c0002b08:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002b0b:	83 ec 08             	sub    $0x8,%esp
c0002b0e:	6a 02                	push   $0x2
c0002b10:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0002b13:	50                   	push   %eax
c0002b14:	e8 32 55 00 00       	call   c000804b <open>
c0002b19:	83 c4 10             	add    $0x10,%esp
c0002b1c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002b1f:	83 ec 04             	sub    $0x4,%esp
c0002b22:	68 80 00 00 00       	push   $0x80
c0002b27:	6a 00                	push   $0x0
c0002b29:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002b2f:	50                   	push   %eax
c0002b30:	e8 5a 74 00 00       	call   c0009f8f <Memset>
c0002b35:	83 c4 10             	add    $0x10,%esp
c0002b38:	83 ec 04             	sub    $0x4,%esp
c0002b3b:	68 80 00 00 00       	push   $0x80
c0002b40:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002b46:	50                   	push   %eax
c0002b47:	ff 75 e0             	pushl  -0x20(%ebp)
c0002b4a:	e8 51 55 00 00       	call   c00080a0 <read>
c0002b4f:	83 c4 10             	add    $0x10,%esp
c0002b52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002b59:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002b60:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002b66:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002b69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002b6c:	0f b6 00             	movzbl (%eax),%eax
c0002b6f:	88 45 db             	mov    %al,-0x25(%ebp)
c0002b72:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002b75:	0f b6 00             	movzbl (%eax),%eax
c0002b78:	3c 20                	cmp    $0x20,%al
c0002b7a:	74 1d                	je     c0002b99 <simple_shell+0xbf>
c0002b7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002b7f:	0f b6 00             	movzbl (%eax),%eax
c0002b82:	84 c0                	test   %al,%al
c0002b84:	74 13                	je     c0002b99 <simple_shell+0xbf>
c0002b86:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002b8a:	75 0d                	jne    c0002b99 <simple_shell+0xbf>
c0002b8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002b8f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002b92:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0002b99:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002b9c:	0f b6 00             	movzbl (%eax),%eax
c0002b9f:	3c 20                	cmp    $0x20,%al
c0002ba1:	74 0a                	je     c0002bad <simple_shell+0xd3>
c0002ba3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ba6:	0f b6 00             	movzbl (%eax),%eax
c0002ba9:	84 c0                	test   %al,%al
c0002bab:	75 26                	jne    c0002bd3 <simple_shell+0xf9>
c0002bad:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0002bb1:	75 20                	jne    c0002bd3 <simple_shell+0xf9>
c0002bb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bb6:	8d 50 01             	lea    0x1(%eax),%edx
c0002bb9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0002bbc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002bbf:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0002bc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002bc9:	c6 00 00             	movb   $0x0,(%eax)
c0002bcc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002bd3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002bd7:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0002bdb:	75 8c                	jne    c0002b69 <simple_shell+0x8f>
c0002bdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002be0:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0002be7:	00 00 00 00 
c0002beb:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0002bf2:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0002bf8:	83 ec 08             	sub    $0x8,%esp
c0002bfb:	6a 02                	push   $0x2
c0002bfd:	50                   	push   %eax
c0002bfe:	e8 48 54 00 00       	call   c000804b <open>
c0002c03:	83 c4 10             	add    $0x10,%esp
c0002c06:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002c09:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0002c0d:	75 54                	jne    c0002c63 <simple_shell+0x189>
c0002c0f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002c16:	eb 29                	jmp    c0002c41 <simple_shell+0x167>
c0002c18:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0002c1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002c21:	01 d0                	add    %edx,%eax
c0002c23:	0f b6 00             	movzbl (%eax),%eax
c0002c26:	0f be c0             	movsbl %al,%eax
c0002c29:	83 ec 04             	sub    $0x4,%esp
c0002c2c:	50                   	push   %eax
c0002c2d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002c30:	68 e0 98 00 c0       	push   $0xc00098e0
c0002c35:	e8 7c 05 00 00       	call   c00031b6 <Printf>
c0002c3a:	83 c4 10             	add    $0x10,%esp
c0002c3d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002c41:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0002c45:	7e d1                	jle    c0002c18 <simple_shell+0x13e>
c0002c47:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0002c4d:	83 ec 08             	sub    $0x8,%esp
c0002c50:	50                   	push   %eax
c0002c51:	68 e7 98 00 c0       	push   $0xc00098e7
c0002c56:	e8 5b 05 00 00       	call   c00031b6 <Printf>
c0002c5b:	83 c4 10             	add    $0x10,%esp
c0002c5e:	e9 bc fe ff ff       	jmp    c0002b1f <simple_shell+0x45>
c0002c63:	e8 59 55 00 00       	call   c00081c1 <fork>
c0002c68:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002c6b:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0002c6f:	7e 17                	jle    c0002c88 <simple_shell+0x1ae>
c0002c71:	83 ec 0c             	sub    $0xc,%esp
c0002c74:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0002c7a:	50                   	push   %eax
c0002c7b:	e8 da 54 00 00       	call   c000815a <wait>
c0002c80:	83 c4 10             	add    $0x10,%esp
c0002c83:	e9 97 fe ff ff       	jmp    c0002b1f <simple_shell+0x45>
c0002c88:	83 ec 0c             	sub    $0xc,%esp
c0002c8b:	ff 75 d0             	pushl  -0x30(%ebp)
c0002c8e:	e8 7b 54 00 00       	call   c000810e <close>
c0002c93:	83 c4 10             	add    $0x10,%esp
c0002c96:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0002c9c:	83 ec 08             	sub    $0x8,%esp
c0002c9f:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0002ca5:	52                   	push   %edx
c0002ca6:	50                   	push   %eax
c0002ca7:	e8 04 56 00 00       	call   c00082b0 <execv>
c0002cac:	83 c4 10             	add    $0x10,%esp
c0002caf:	eb fe                	jmp    c0002caf <simple_shell+0x1d5>

c0002cb1 <test_split_str>:
c0002cb1:	55                   	push   %ebp
c0002cb2:	89 e5                	mov    %esp,%ebp
c0002cb4:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0002cba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002cc1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002cc8:	c7 45 ec ed 98 00 c0 	movl   $0xc00098ed,-0x14(%ebp)
c0002ccf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002cd3:	75 1a                	jne    c0002cef <test_split_str+0x3e>
c0002cd5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002cd8:	0f b6 00             	movzbl (%eax),%eax
c0002cdb:	0f be c0             	movsbl %al,%eax
c0002cde:	83 ec 08             	sub    $0x8,%esp
c0002ce1:	50                   	push   %eax
c0002ce2:	68 fe 98 00 c0       	push   $0xc00098fe
c0002ce7:	e8 ca 04 00 00       	call   c00031b6 <Printf>
c0002cec:	83 c4 10             	add    $0x10,%esp
c0002cef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002cf2:	0f b6 00             	movzbl (%eax),%eax
c0002cf5:	3c 20                	cmp    $0x20,%al
c0002cf7:	75 0a                	jne    c0002d03 <test_split_str+0x52>
c0002cf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002cfc:	0f b6 00             	movzbl (%eax),%eax
c0002cff:	84 c0                	test   %al,%al
c0002d01:	74 13                	je     c0002d16 <test_split_str+0x65>
c0002d03:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002d07:	75 0d                	jne    c0002d16 <test_split_str+0x65>
c0002d09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002d0c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002d0f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0002d16:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002d19:	0f b6 00             	movzbl (%eax),%eax
c0002d1c:	3c 20                	cmp    $0x20,%al
c0002d1e:	74 0a                	je     c0002d2a <test_split_str+0x79>
c0002d20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002d23:	0f b6 00             	movzbl (%eax),%eax
c0002d26:	84 c0                	test   %al,%al
c0002d28:	75 26                	jne    c0002d50 <test_split_str+0x9f>
c0002d2a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0002d2e:	75 20                	jne    c0002d50 <test_split_str+0x9f>
c0002d30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002d33:	8d 50 01             	lea    0x1(%eax),%edx
c0002d36:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0002d39:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002d3c:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0002d43:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002d46:	c6 00 00             	movb   $0x0,(%eax)
c0002d49:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002d50:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002d54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002d57:	0f b6 00             	movzbl (%eax),%eax
c0002d5a:	84 c0                	test   %al,%al
c0002d5c:	0f 85 6d ff ff ff    	jne    c0002ccf <test_split_str+0x1e>
c0002d62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002d65:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002d68:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0002d6f:	83 ec 08             	sub    $0x8,%esp
c0002d72:	ff 75 f4             	pushl  -0xc(%ebp)
c0002d75:	68 07 99 00 c0       	push   $0xc0009907
c0002d7a:	e8 37 04 00 00       	call   c00031b6 <Printf>
c0002d7f:	83 c4 10             	add    $0x10,%esp
c0002d82:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002d89:	eb 22                	jmp    c0002dad <test_split_str+0xfc>
c0002d8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002d8e:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0002d95:	83 ec 04             	sub    $0x4,%esp
c0002d98:	50                   	push   %eax
c0002d99:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002d9c:	68 1e 99 00 c0       	push   $0xc000991e
c0002da1:	e8 10 04 00 00       	call   c00031b6 <Printf>
c0002da6:	83 c4 10             	add    $0x10,%esp
c0002da9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002dad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002db0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0002db3:	7e d6                	jle    c0002d8b <test_split_str+0xda>
c0002db5:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0002dbb:	83 ec 08             	sub    $0x8,%esp
c0002dbe:	68 2d 99 00 c0       	push   $0xc000992d
c0002dc3:	50                   	push   %eax
c0002dc4:	e8 97 12 00 00       	call   c0004060 <strcmp>
c0002dc9:	83 c4 10             	add    $0x10,%esp
c0002dcc:	85 c0                	test   %eax,%eax
c0002dce:	75 10                	jne    c0002de0 <test_split_str+0x12f>
c0002dd0:	83 ec 0c             	sub    $0xc,%esp
c0002dd3:	68 32 99 00 c0       	push   $0xc0009932
c0002dd8:	e8 d9 03 00 00       	call   c00031b6 <Printf>
c0002ddd:	83 c4 10             	add    $0x10,%esp
c0002de0:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0002de6:	83 ec 08             	sub    $0x8,%esp
c0002de9:	50                   	push   %eax
c0002dea:	68 3e 99 00 c0       	push   $0xc000993e
c0002def:	e8 c2 03 00 00       	call   c00031b6 <Printf>
c0002df4:	83 c4 10             	add    $0x10,%esp
c0002df7:	83 ec 0c             	sub    $0xc,%esp
c0002dfa:	68 4c 99 00 c0       	push   $0xc000994c
c0002dff:	e8 b2 03 00 00       	call   c00031b6 <Printf>
c0002e04:	83 c4 10             	add    $0x10,%esp
c0002e07:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002e0e:	eb 26                	jmp    c0002e36 <test_split_str+0x185>
c0002e10:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0002e16:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e19:	01 d0                	add    %edx,%eax
c0002e1b:	0f b6 00             	movzbl (%eax),%eax
c0002e1e:	0f be c0             	movsbl %al,%eax
c0002e21:	83 ec 08             	sub    $0x8,%esp
c0002e24:	50                   	push   %eax
c0002e25:	68 5b 99 00 c0       	push   $0xc000995b
c0002e2a:	e8 87 03 00 00       	call   c00031b6 <Printf>
c0002e2f:	83 c4 10             	add    $0x10,%esp
c0002e32:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002e36:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0002e3a:	7e d4                	jle    c0002e10 <test_split_str+0x15f>
c0002e3c:	c9                   	leave  
c0002e3d:	c3                   	ret    

c0002e3e <test_shell>:
c0002e3e:	55                   	push   %ebp
c0002e3f:	89 e5                	mov    %esp,%ebp
c0002e41:	83 ec 48             	sub    $0x48,%esp
c0002e44:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0002e4b:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0002e52:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0002e58:	83 ec 08             	sub    $0x8,%esp
c0002e5b:	6a 02                	push   $0x2
c0002e5d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0002e60:	50                   	push   %eax
c0002e61:	e8 e5 51 00 00       	call   c000804b <open>
c0002e66:	83 c4 10             	add    $0x10,%esp
c0002e69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002e6c:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0002e73:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0002e7a:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0002e81:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0002e88:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0002e8f:	83 ec 0c             	sub    $0xc,%esp
c0002e92:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0002e95:	50                   	push   %eax
c0002e96:	e8 26 ea ff ff       	call   c00018c1 <untar>
c0002e9b:	83 c4 10             	add    $0x10,%esp
c0002e9e:	e8 1e 53 00 00       	call   c00081c1 <fork>
c0002ea3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002ea6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002eaa:	7e 25                	jle    c0002ed1 <test_shell+0x93>
c0002eac:	83 ec 0c             	sub    $0xc,%esp
c0002eaf:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0002eb2:	50                   	push   %eax
c0002eb3:	e8 a2 52 00 00       	call   c000815a <wait>
c0002eb8:	83 c4 10             	add    $0x10,%esp
c0002ebb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ebe:	83 ec 08             	sub    $0x8,%esp
c0002ec1:	50                   	push   %eax
c0002ec2:	68 64 99 00 c0       	push   $0xc0009964
c0002ec7:	e8 ea 02 00 00       	call   c00031b6 <Printf>
c0002ecc:	83 c4 10             	add    $0x10,%esp
c0002ecf:	eb 23                	jmp    c0002ef4 <test_shell+0xb6>
c0002ed1:	83 ec 0c             	sub    $0xc,%esp
c0002ed4:	68 76 99 00 c0       	push   $0xc0009976
c0002ed9:	e8 d8 02 00 00       	call   c00031b6 <Printf>
c0002ede:	83 c4 10             	add    $0x10,%esp
c0002ee1:	83 ec 0c             	sub    $0xc,%esp
c0002ee4:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ee7:	e8 22 52 00 00       	call   c000810e <close>
c0002eec:	83 c4 10             	add    $0x10,%esp
c0002eef:	e8 e6 fb ff ff       	call   c0002ada <simple_shell>
c0002ef4:	83 ec 0c             	sub    $0xc,%esp
c0002ef7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002efa:	50                   	push   %eax
c0002efb:	e8 5a 52 00 00       	call   c000815a <wait>
c0002f00:	83 c4 10             	add    $0x10,%esp
c0002f03:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002f06:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002f09:	83 ec 08             	sub    $0x8,%esp
c0002f0c:	50                   	push   %eax
c0002f0d:	68 84 99 00 c0       	push   $0xc0009984
c0002f12:	e8 9f 02 00 00       	call   c00031b6 <Printf>
c0002f17:	83 c4 10             	add    $0x10,%esp
c0002f1a:	eb d8                	jmp    c0002ef4 <test_shell+0xb6>

c0002f1c <test_exec>:
c0002f1c:	55                   	push   %ebp
c0002f1d:	89 e5                	mov    %esp,%ebp
c0002f1f:	83 ec 38             	sub    $0x38,%esp
c0002f22:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0002f29:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0002f30:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0002f36:	83 ec 08             	sub    $0x8,%esp
c0002f39:	6a 02                	push   $0x2
c0002f3b:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0002f3e:	50                   	push   %eax
c0002f3f:	e8 07 51 00 00       	call   c000804b <open>
c0002f44:	83 c4 10             	add    $0x10,%esp
c0002f47:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002f4a:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0002f51:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0002f58:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0002f5f:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0002f66:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0002f6d:	83 ec 0c             	sub    $0xc,%esp
c0002f70:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0002f73:	50                   	push   %eax
c0002f74:	e8 48 e9 ff ff       	call   c00018c1 <untar>
c0002f79:	83 c4 10             	add    $0x10,%esp
c0002f7c:	e8 40 52 00 00       	call   c00081c1 <fork>
c0002f81:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002f84:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002f88:	7e 25                	jle    c0002faf <test_exec+0x93>
c0002f8a:	83 ec 0c             	sub    $0xc,%esp
c0002f8d:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002f90:	50                   	push   %eax
c0002f91:	e8 c4 51 00 00       	call   c000815a <wait>
c0002f96:	83 c4 10             	add    $0x10,%esp
c0002f99:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002f9c:	83 ec 08             	sub    $0x8,%esp
c0002f9f:	50                   	push   %eax
c0002fa0:	68 64 99 00 c0       	push   $0xc0009964
c0002fa5:	e8 0c 02 00 00       	call   c00031b6 <Printf>
c0002faa:	83 c4 10             	add    $0x10,%esp
c0002fad:	eb 33                	jmp    c0002fe2 <test_exec+0xc6>
c0002faf:	83 ec 0c             	sub    $0xc,%esp
c0002fb2:	68 76 99 00 c0       	push   $0xc0009976
c0002fb7:	e8 fa 01 00 00       	call   c00031b6 <Printf>
c0002fbc:	83 c4 10             	add    $0x10,%esp
c0002fbf:	83 ec 0c             	sub    $0xc,%esp
c0002fc2:	6a 00                	push   $0x0
c0002fc4:	68 9f 99 00 c0       	push   $0xc000999f
c0002fc9:	68 a5 99 00 c0       	push   $0xc00099a5
c0002fce:	68 2d 99 00 c0       	push   $0xc000992d
c0002fd3:	68 ab 99 00 c0       	push   $0xc00099ab
c0002fd8:	e8 78 54 00 00       	call   c0008455 <execl>
c0002fdd:	83 c4 20             	add    $0x20,%esp
c0002fe0:	eb fe                	jmp    c0002fe0 <test_exec+0xc4>
c0002fe2:	c9                   	leave  
c0002fe3:	c3                   	ret    

c0002fe4 <INIT>:
c0002fe4:	55                   	push   %ebp
c0002fe5:	89 e5                	mov    %esp,%ebp
c0002fe7:	83 ec 08             	sub    $0x8,%esp
c0002fea:	e8 4f fe ff ff       	call   c0002e3e <test_shell>
c0002fef:	eb fe                	jmp    c0002fef <INIT+0xb>

c0002ff1 <TestA>:
c0002ff1:	55                   	push   %ebp
c0002ff2:	89 e5                	mov    %esp,%ebp
c0002ff4:	66 87 db             	xchg   %bx,%bx
c0002ff7:	eb fe                	jmp    c0002ff7 <TestA+0x6>

c0002ff9 <delay>:
c0002ff9:	55                   	push   %ebp
c0002ffa:	89 e5                	mov    %esp,%ebp
c0002ffc:	83 ec 10             	sub    $0x10,%esp
c0002fff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0003006:	eb 2d                	jmp    c0003035 <delay+0x3c>
c0003008:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c000300f:	eb 1a                	jmp    c000302b <delay+0x32>
c0003011:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003018:	eb 04                	jmp    c000301e <delay+0x25>
c000301a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000301e:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0003025:	7e f3                	jle    c000301a <delay+0x21>
c0003027:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000302b:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c000302f:	7e e0                	jle    c0003011 <delay+0x18>
c0003031:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003035:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003038:	3b 45 08             	cmp    0x8(%ebp),%eax
c000303b:	7c cb                	jl     c0003008 <delay+0xf>
c000303d:	90                   	nop
c000303e:	c9                   	leave  
c000303f:	c3                   	ret    

c0003040 <TestB>:
c0003040:	55                   	push   %ebp
c0003041:	89 e5                	mov    %esp,%ebp
c0003043:	83 ec 18             	sub    $0x18,%esp
c0003046:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000304d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0003051:	77 16                	ja     c0003069 <TestB+0x29>
c0003053:	e8 48 0e 00 00       	call   c0003ea0 <get_ticks_ipc>
c0003058:	83 ec 08             	sub    $0x8,%esp
c000305b:	50                   	push   %eax
c000305c:	68 b1 99 00 c0       	push   $0xc00099b1
c0003061:	e8 50 01 00 00       	call   c00031b6 <Printf>
c0003066:	83 c4 10             	add    $0x10,%esp
c0003069:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000306d:	eb de                	jmp    c000304d <TestB+0xd>

c000306f <TestC>:
c000306f:	55                   	push   %ebp
c0003070:	89 e5                	mov    %esp,%ebp
c0003072:	83 ec 18             	sub    $0x18,%esp
c0003075:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000307c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0003080:	77 1a                	ja     c000309c <TestC+0x2d>
c0003082:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0003089:	83 ec 08             	sub    $0x8,%esp
c000308c:	ff 75 f0             	pushl  -0x10(%ebp)
c000308f:	68 b8 99 00 c0       	push   $0xc00099b8
c0003094:	e8 1d 01 00 00       	call   c00031b6 <Printf>
c0003099:	83 c4 10             	add    $0x10,%esp
c000309c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00030a0:	eb da                	jmp    c000307c <TestC+0xd>

c00030a2 <sys_get_ticks>:
c00030a2:	55                   	push   %ebp
c00030a3:	89 e5                	mov    %esp,%ebp
c00030a5:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c00030aa:	5d                   	pop    %ebp
c00030ab:	c3                   	ret    

c00030ac <sys_write>:
c00030ac:	55                   	push   %ebp
c00030ad:	89 e5                	mov    %esp,%ebp
c00030af:	83 ec 18             	sub    $0x18,%esp
c00030b2:	8b 45 10             	mov    0x10(%ebp),%eax
c00030b5:	8b 40 64             	mov    0x64(%eax),%eax
c00030b8:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c00030be:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c00030c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00030c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00030c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00030cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00030cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00030d2:	eb 20                	jmp    c00030f4 <sys_write+0x48>
c00030d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00030d7:	0f b6 00             	movzbl (%eax),%eax
c00030da:	0f b6 c0             	movzbl %al,%eax
c00030dd:	83 ec 08             	sub    $0x8,%esp
c00030e0:	50                   	push   %eax
c00030e1:	ff 75 ec             	pushl  -0x14(%ebp)
c00030e4:	e8 7d 43 00 00       	call   c0007466 <out_char>
c00030e9:	83 c4 10             	add    $0x10,%esp
c00030ec:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00030f0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00030f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00030f8:	7f da                	jg     c00030d4 <sys_write+0x28>
c00030fa:	90                   	nop
c00030fb:	c9                   	leave  
c00030fc:	c3                   	ret    

c00030fd <milli_delay>:
c00030fd:	55                   	push   %ebp
c00030fe:	89 e5                	mov    %esp,%ebp
c0003100:	83 ec 18             	sub    $0x18,%esp
c0003103:	e8 98 0d 00 00       	call   c0003ea0 <get_ticks_ipc>
c0003108:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000310b:	90                   	nop
c000310c:	e8 8f 0d 00 00       	call   c0003ea0 <get_ticks_ipc>
c0003111:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0003114:	89 c1                	mov    %eax,%ecx
c0003116:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c000311b:	89 c8                	mov    %ecx,%eax
c000311d:	f7 ea                	imul   %edx
c000311f:	c1 fa 05             	sar    $0x5,%edx
c0003122:	89 c8                	mov    %ecx,%eax
c0003124:	c1 f8 1f             	sar    $0x1f,%eax
c0003127:	29 c2                	sub    %eax,%edx
c0003129:	89 d0                	mov    %edx,%eax
c000312b:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0003131:	39 45 08             	cmp    %eax,0x8(%ebp)
c0003134:	77 d6                	ja     c000310c <milli_delay+0xf>
c0003136:	90                   	nop
c0003137:	c9                   	leave  
c0003138:	c3                   	ret    

c0003139 <TaskSys>:
c0003139:	55                   	push   %ebp
c000313a:	89 e5                	mov    %esp,%ebp
c000313c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0003142:	83 ec 0c             	sub    $0xc,%esp
c0003145:	68 c5 99 00 c0       	push   $0xc00099c5
c000314a:	e8 3d e4 ff ff       	call   c000158c <disp_str>
c000314f:	83 c4 10             	add    $0x10,%esp
c0003152:	83 ec 04             	sub    $0x4,%esp
c0003155:	6a 6c                	push   $0x6c
c0003157:	6a 00                	push   $0x0
c0003159:	8d 45 80             	lea    -0x80(%ebp),%eax
c000315c:	50                   	push   %eax
c000315d:	e8 2d 6e 00 00       	call   c0009f8f <Memset>
c0003162:	83 c4 10             	add    $0x10,%esp
c0003165:	83 ec 08             	sub    $0x8,%esp
c0003168:	6a 10                	push   $0x10
c000316a:	8d 45 80             	lea    -0x80(%ebp),%eax
c000316d:	50                   	push   %eax
c000316e:	e8 2b 1c 00 00       	call   c0004d9e <receive_msg>
c0003173:	83 c4 10             	add    $0x10,%esp
c0003176:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003179:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000317d:	75 34                	jne    c00031b3 <TaskSys+0x7a>
c000317f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003182:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003185:	8b 45 80             	mov    -0x80(%ebp),%eax
c0003188:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000318b:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c000318f:	75 1f                	jne    c00031b0 <TaskSys+0x77>
c0003191:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0003196:	89 45 88             	mov    %eax,-0x78(%ebp)
c0003199:	83 ec 08             	sub    $0x8,%esp
c000319c:	ff 75 ec             	pushl  -0x14(%ebp)
c000319f:	8d 45 80             	lea    -0x80(%ebp),%eax
c00031a2:	50                   	push   %eax
c00031a3:	e8 d0 1b 00 00       	call   c0004d78 <send_msg>
c00031a8:	83 c4 10             	add    $0x10,%esp
c00031ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00031ae:	eb 01                	jmp    c00031b1 <TaskSys+0x78>
c00031b0:	90                   	nop
c00031b1:	eb 9f                	jmp    c0003152 <TaskSys+0x19>
c00031b3:	90                   	nop
c00031b4:	c9                   	leave  
c00031b5:	c3                   	ret    

c00031b6 <Printf>:
c00031b6:	55                   	push   %ebp
c00031b7:	89 e5                	mov    %esp,%ebp
c00031b9:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00031bf:	83 ec 04             	sub    $0x4,%esp
c00031c2:	68 00 01 00 00       	push   $0x100
c00031c7:	6a 00                	push   $0x0
c00031c9:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00031cf:	50                   	push   %eax
c00031d0:	e8 ba 6d 00 00       	call   c0009f8f <Memset>
c00031d5:	83 c4 10             	add    $0x10,%esp
c00031d8:	8d 45 0c             	lea    0xc(%ebp),%eax
c00031db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00031de:	8b 45 08             	mov    0x8(%ebp),%eax
c00031e1:	83 ec 04             	sub    $0x4,%esp
c00031e4:	ff 75 f4             	pushl  -0xc(%ebp)
c00031e7:	50                   	push   %eax
c00031e8:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00031ee:	50                   	push   %eax
c00031ef:	e8 20 00 00 00       	call   c0003214 <vsprintf>
c00031f4:	83 c4 10             	add    $0x10,%esp
c00031f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00031fa:	83 ec 04             	sub    $0x4,%esp
c00031fd:	ff 75 f0             	pushl  -0x10(%ebp)
c0003200:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0003206:	50                   	push   %eax
c0003207:	6a 00                	push   $0x0
c0003209:	e8 c9 4e 00 00       	call   c00080d7 <write>
c000320e:	83 c4 10             	add    $0x10,%esp
c0003211:	90                   	nop
c0003212:	c9                   	leave  
c0003213:	c3                   	ret    

c0003214 <vsprintf>:
c0003214:	55                   	push   %ebp
c0003215:	89 e5                	mov    %esp,%ebp
c0003217:	81 ec 68 02 00 00    	sub    $0x268,%esp
c000321d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0003223:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0003229:	83 ec 04             	sub    $0x4,%esp
c000322c:	6a 40                	push   $0x40
c000322e:	6a 00                	push   $0x0
c0003230:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0003236:	50                   	push   %eax
c0003237:	e8 53 6d 00 00       	call   c0009f8f <Memset>
c000323c:	83 c4 10             	add    $0x10,%esp
c000323f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003242:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003245:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000324c:	8b 45 08             	mov    0x8(%ebp),%eax
c000324f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003252:	e9 53 01 00 00       	jmp    c00033aa <vsprintf+0x196>
c0003257:	8b 45 0c             	mov    0xc(%ebp),%eax
c000325a:	0f b6 00             	movzbl (%eax),%eax
c000325d:	3c 25                	cmp    $0x25,%al
c000325f:	74 16                	je     c0003277 <vsprintf+0x63>
c0003261:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003264:	8d 50 01             	lea    0x1(%eax),%edx
c0003267:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000326a:	8b 55 0c             	mov    0xc(%ebp),%edx
c000326d:	0f b6 12             	movzbl (%edx),%edx
c0003270:	88 10                	mov    %dl,(%eax)
c0003272:	e9 2f 01 00 00       	jmp    c00033a6 <vsprintf+0x192>
c0003277:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c000327b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000327e:	0f b6 00             	movzbl (%eax),%eax
c0003281:	0f be c0             	movsbl %al,%eax
c0003284:	83 f8 64             	cmp    $0x64,%eax
c0003287:	74 26                	je     c00032af <vsprintf+0x9b>
c0003289:	83 f8 64             	cmp    $0x64,%eax
c000328c:	7f 0e                	jg     c000329c <vsprintf+0x88>
c000328e:	83 f8 63             	cmp    $0x63,%eax
c0003291:	0f 84 f2 00 00 00    	je     c0003389 <vsprintf+0x175>
c0003297:	e9 0a 01 00 00       	jmp    c00033a6 <vsprintf+0x192>
c000329c:	83 f8 73             	cmp    $0x73,%eax
c000329f:	0f 84 b0 00 00 00    	je     c0003355 <vsprintf+0x141>
c00032a5:	83 f8 78             	cmp    $0x78,%eax
c00032a8:	74 5d                	je     c0003307 <vsprintf+0xf3>
c00032aa:	e9 f7 00 00 00       	jmp    c00033a6 <vsprintf+0x192>
c00032af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00032b2:	8b 00                	mov    (%eax),%eax
c00032b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00032b7:	83 ec 04             	sub    $0x4,%esp
c00032ba:	6a 0a                	push   $0xa
c00032bc:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c00032c2:	50                   	push   %eax
c00032c3:	ff 75 e8             	pushl  -0x18(%ebp)
c00032c6:	e8 20 0c 00 00       	call   c0003eeb <itoa>
c00032cb:	83 c4 10             	add    $0x10,%esp
c00032ce:	83 ec 08             	sub    $0x8,%esp
c00032d1:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00032d7:	50                   	push   %eax
c00032d8:	ff 75 f4             	pushl  -0xc(%ebp)
c00032db:	e8 ce 6c 00 00       	call   c0009fae <Strcpy>
c00032e0:	83 c4 10             	add    $0x10,%esp
c00032e3:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00032e7:	83 ec 0c             	sub    $0xc,%esp
c00032ea:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00032f0:	50                   	push   %eax
c00032f1:	e8 d2 6c 00 00       	call   c0009fc8 <Strlen>
c00032f6:	83 c4 10             	add    $0x10,%esp
c00032f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00032fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032ff:	01 45 f4             	add    %eax,-0xc(%ebp)
c0003302:	e9 9f 00 00 00       	jmp    c00033a6 <vsprintf+0x192>
c0003307:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000330a:	8b 00                	mov    (%eax),%eax
c000330c:	83 ec 08             	sub    $0x8,%esp
c000330f:	50                   	push   %eax
c0003310:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0003316:	50                   	push   %eax
c0003317:	e8 af e7 ff ff       	call   c0001acb <atoi>
c000331c:	83 c4 10             	add    $0x10,%esp
c000331f:	83 ec 08             	sub    $0x8,%esp
c0003322:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0003328:	50                   	push   %eax
c0003329:	ff 75 f4             	pushl  -0xc(%ebp)
c000332c:	e8 7d 6c 00 00       	call   c0009fae <Strcpy>
c0003331:	83 c4 10             	add    $0x10,%esp
c0003334:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0003338:	83 ec 0c             	sub    $0xc,%esp
c000333b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0003341:	50                   	push   %eax
c0003342:	e8 81 6c 00 00       	call   c0009fc8 <Strlen>
c0003347:	83 c4 10             	add    $0x10,%esp
c000334a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000334d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003350:	01 45 f4             	add    %eax,-0xc(%ebp)
c0003353:	eb 51                	jmp    c00033a6 <vsprintf+0x192>
c0003355:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003358:	8b 00                	mov    (%eax),%eax
c000335a:	83 ec 08             	sub    $0x8,%esp
c000335d:	50                   	push   %eax
c000335e:	ff 75 f4             	pushl  -0xc(%ebp)
c0003361:	e8 48 6c 00 00       	call   c0009fae <Strcpy>
c0003366:	83 c4 10             	add    $0x10,%esp
c0003369:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000336c:	8b 00                	mov    (%eax),%eax
c000336e:	83 ec 0c             	sub    $0xc,%esp
c0003371:	50                   	push   %eax
c0003372:	e8 51 6c 00 00       	call   c0009fc8 <Strlen>
c0003377:	83 c4 10             	add    $0x10,%esp
c000337a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000337d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0003381:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003384:	01 45 f4             	add    %eax,-0xc(%ebp)
c0003387:	eb 1d                	jmp    c00033a6 <vsprintf+0x192>
c0003389:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000338c:	0f b6 10             	movzbl (%eax),%edx
c000338f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003392:	88 10                	mov    %dl,(%eax)
c0003394:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0003398:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000339f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033a2:	01 45 f4             	add    %eax,-0xc(%ebp)
c00033a5:	90                   	nop
c00033a6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00033aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c00033ad:	0f b6 00             	movzbl (%eax),%eax
c00033b0:	84 c0                	test   %al,%al
c00033b2:	0f 85 9f fe ff ff    	jne    c0003257 <vsprintf+0x43>
c00033b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00033bb:	2b 45 08             	sub    0x8(%ebp),%eax
c00033be:	c9                   	leave  
c00033bf:	c3                   	ret    

c00033c0 <printx>:
c00033c0:	55                   	push   %ebp
c00033c1:	89 e5                	mov    %esp,%ebp
c00033c3:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00033c9:	8d 45 0c             	lea    0xc(%ebp),%eax
c00033cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00033cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00033d2:	83 ec 04             	sub    $0x4,%esp
c00033d5:	ff 75 f4             	pushl  -0xc(%ebp)
c00033d8:	50                   	push   %eax
c00033d9:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00033df:	50                   	push   %eax
c00033e0:	e8 2f fe ff ff       	call   c0003214 <vsprintf>
c00033e5:	83 c4 10             	add    $0x10,%esp
c00033e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00033eb:	83 ec 08             	sub    $0x8,%esp
c00033ee:	ff 75 f0             	pushl  -0x10(%ebp)
c00033f1:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00033f7:	50                   	push   %eax
c00033f8:	e8 5b 19 00 00       	call   c0004d58 <write_debug>
c00033fd:	83 c4 10             	add    $0x10,%esp
c0003400:	90                   	nop
c0003401:	c9                   	leave  
c0003402:	c3                   	ret    

c0003403 <sys_printx>:
c0003403:	55                   	push   %ebp
c0003404:	89 e5                	mov    %esp,%ebp
c0003406:	83 ec 28             	sub    $0x28,%esp
c0003409:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c000340e:	85 c0                	test   %eax,%eax
c0003410:	75 20                	jne    c0003432 <sys_printx+0x2f>
c0003412:	8b 45 10             	mov    0x10(%ebp),%eax
c0003415:	8b 40 0c             	mov    0xc(%eax),%eax
c0003418:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000341b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000341e:	83 ec 08             	sub    $0x8,%esp
c0003421:	ff 75 10             	pushl  0x10(%ebp)
c0003424:	50                   	push   %eax
c0003425:	e8 ff 3a 00 00       	call   c0006f29 <Seg2PhyAddrLDT>
c000342a:	83 c4 10             	add    $0x10,%esp
c000342d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003430:	eb 19                	jmp    c000344b <sys_printx+0x48>
c0003432:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0003437:	85 c0                	test   %eax,%eax
c0003439:	74 10                	je     c000344b <sys_printx+0x48>
c000343b:	83 ec 0c             	sub    $0xc,%esp
c000343e:	6a 30                	push   $0x30
c0003440:	e8 a3 3a 00 00       	call   c0006ee8 <Seg2PhyAddr>
c0003445:	83 c4 10             	add    $0x10,%esp
c0003448:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000344b:	8b 55 08             	mov    0x8(%ebp),%edx
c000344e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003451:	01 d0                	add    %edx,%eax
c0003453:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003456:	8b 45 10             	mov    0x10(%ebp),%eax
c0003459:	8b 40 64             	mov    0x64(%eax),%eax
c000345c:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0003462:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0003467:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000346a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000346d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003470:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003473:	0f b6 00             	movzbl (%eax),%eax
c0003476:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0003479:	eb 3a                	jmp    c00034b5 <sys_printx+0xb2>
c000347b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000347e:	0f b6 00             	movzbl (%eax),%eax
c0003481:	3c 3b                	cmp    $0x3b,%al
c0003483:	74 0a                	je     c000348f <sys_printx+0x8c>
c0003485:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003488:	0f b6 00             	movzbl (%eax),%eax
c000348b:	3c 3a                	cmp    $0x3a,%al
c000348d:	75 06                	jne    c0003495 <sys_printx+0x92>
c000348f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003493:	eb 20                	jmp    c00034b5 <sys_printx+0xb2>
c0003495:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003498:	0f b6 00             	movzbl (%eax),%eax
c000349b:	0f b6 c0             	movzbl %al,%eax
c000349e:	83 ec 08             	sub    $0x8,%esp
c00034a1:	50                   	push   %eax
c00034a2:	ff 75 e4             	pushl  -0x1c(%ebp)
c00034a5:	e8 bc 3f 00 00       	call   c0007466 <out_char>
c00034aa:	83 c4 10             	add    $0x10,%esp
c00034ad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00034b1:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00034b5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00034b9:	7f c0                	jg     c000347b <sys_printx+0x78>
c00034bb:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c00034bf:	75 11                	jne    c00034d2 <sys_printx+0xcf>
c00034c1:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c00034c6:	85 c0                	test   %eax,%eax
c00034c8:	74 15                	je     c00034df <sys_printx+0xdc>
c00034ca:	e8 32 e3 ff ff       	call   c0001801 <disable_int>
c00034cf:	f4                   	hlt    
c00034d0:	eb 0d                	jmp    c00034df <sys_printx+0xdc>
c00034d2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c00034d6:	75 07                	jne    c00034df <sys_printx+0xdc>
c00034d8:	e8 24 e3 ff ff       	call   c0001801 <disable_int>
c00034dd:	f4                   	hlt    
c00034de:	90                   	nop
c00034df:	90                   	nop
c00034e0:	c9                   	leave  
c00034e1:	c3                   	ret    

c00034e2 <spin>:
c00034e2:	55                   	push   %ebp
c00034e3:	89 e5                	mov    %esp,%ebp
c00034e5:	eb fe                	jmp    c00034e5 <spin+0x3>

c00034e7 <panic>:
c00034e7:	55                   	push   %ebp
c00034e8:	89 e5                	mov    %esp,%ebp
c00034ea:	83 ec 08             	sub    $0x8,%esp
c00034ed:	83 ec 04             	sub    $0x4,%esp
c00034f0:	ff 75 08             	pushl  0x8(%ebp)
c00034f3:	6a 3a                	push   $0x3a
c00034f5:	68 ce 99 00 c0       	push   $0xc00099ce
c00034fa:	e8 c1 fe ff ff       	call   c00033c0 <printx>
c00034ff:	83 c4 10             	add    $0x10,%esp
c0003502:	90                   	nop
c0003503:	c9                   	leave  
c0003504:	c3                   	ret    

c0003505 <assertion_failure>:
c0003505:	55                   	push   %ebp
c0003506:	89 e5                	mov    %esp,%ebp
c0003508:	83 ec 08             	sub    $0x8,%esp
c000350b:	83 ec 08             	sub    $0x8,%esp
c000350e:	ff 75 14             	pushl  0x14(%ebp)
c0003511:	ff 75 10             	pushl  0x10(%ebp)
c0003514:	ff 75 0c             	pushl  0xc(%ebp)
c0003517:	ff 75 08             	pushl  0x8(%ebp)
c000351a:	6a 3b                	push   $0x3b
c000351c:	68 d4 99 00 c0       	push   $0xc00099d4
c0003521:	e8 9a fe ff ff       	call   c00033c0 <printx>
c0003526:	83 c4 20             	add    $0x20,%esp
c0003529:	83 ec 0c             	sub    $0xc,%esp
c000352c:	68 07 9a 00 c0       	push   $0xc0009a07
c0003531:	e8 ac ff ff ff       	call   c00034e2 <spin>
c0003536:	83 c4 10             	add    $0x10,%esp
c0003539:	90                   	nop
c000353a:	c9                   	leave  
c000353b:	c3                   	ret    

c000353c <dead_lock>:
c000353c:	55                   	push   %ebp
c000353d:	89 e5                	mov    %esp,%ebp
c000353f:	b8 00 00 00 00       	mov    $0x0,%eax
c0003544:	5d                   	pop    %ebp
c0003545:	c3                   	ret    

c0003546 <sys_send_msg>:
c0003546:	55                   	push   %ebp
c0003547:	89 e5                	mov    %esp,%ebp
c0003549:	83 ec 48             	sub    $0x48,%esp
c000354c:	83 ec 0c             	sub    $0xc,%esp
c000354f:	ff 75 0c             	pushl  0xc(%ebp)
c0003552:	e8 e9 38 00 00       	call   c0006e40 <pid2proc>
c0003557:	83 c4 10             	add    $0x10,%esp
c000355a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000355d:	83 ec 0c             	sub    $0xc,%esp
c0003560:	ff 75 10             	pushl  0x10(%ebp)
c0003563:	e8 f4 38 00 00       	call   c0006e5c <proc2pid>
c0003568:	83 c4 10             	add    $0x10,%esp
c000356b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000356e:	8b 45 10             	mov    0x10(%ebp),%eax
c0003571:	8b 40 0c             	mov    0xc(%eax),%eax
c0003574:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003577:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000357a:	83 ec 08             	sub    $0x8,%esp
c000357d:	ff 75 10             	pushl  0x10(%ebp)
c0003580:	50                   	push   %eax
c0003581:	e8 a3 39 00 00       	call   c0006f29 <Seg2PhyAddrLDT>
c0003586:	83 c4 10             	add    $0x10,%esp
c0003589:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000358c:	8b 55 08             	mov    0x8(%ebp),%edx
c000358f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003592:	01 d0                	add    %edx,%eax
c0003594:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003597:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c000359e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00035a1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00035a4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00035a7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00035aa:	89 10                	mov    %edx,(%eax)
c00035ac:	83 ec 08             	sub    $0x8,%esp
c00035af:	ff 75 0c             	pushl  0xc(%ebp)
c00035b2:	ff 75 e8             	pushl  -0x18(%ebp)
c00035b5:	e8 82 ff ff ff       	call   c000353c <dead_lock>
c00035ba:	83 c4 10             	add    $0x10,%esp
c00035bd:	83 f8 01             	cmp    $0x1,%eax
c00035c0:	75 10                	jne    c00035d2 <sys_send_msg+0x8c>
c00035c2:	83 ec 0c             	sub    $0xc,%esp
c00035c5:	68 13 9a 00 c0       	push   $0xc0009a13
c00035ca:	e8 18 ff ff ff       	call   c00034e7 <panic>
c00035cf:	83 c4 10             	add    $0x10,%esp
c00035d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035d5:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c00035dc:	3c 02                	cmp    $0x2,%al
c00035de:	0f 85 9c 01 00 00    	jne    c0003780 <sys_send_msg+0x23a>
c00035e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035e7:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
c00035ed:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00035f0:	74 12                	je     c0003604 <sys_send_msg+0xbe>
c00035f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035f5:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
c00035fb:	83 f8 10             	cmp    $0x10,%eax
c00035fe:	0f 85 7c 01 00 00    	jne    c0003780 <sys_send_msg+0x23a>
c0003604:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003607:	8b 40 0c             	mov    0xc(%eax),%eax
c000360a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000360d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003610:	83 ec 08             	sub    $0x8,%esp
c0003613:	ff 75 ec             	pushl  -0x14(%ebp)
c0003616:	50                   	push   %eax
c0003617:	e8 0d 39 00 00       	call   c0006f29 <Seg2PhyAddrLDT>
c000361c:	83 c4 10             	add    $0x10,%esp
c000361f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003622:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003625:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c000362b:	89 c2                	mov    %eax,%edx
c000362d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0003630:	01 d0                	add    %edx,%eax
c0003632:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003635:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003638:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000363b:	83 ec 04             	sub    $0x4,%esp
c000363e:	ff 75 d8             	pushl  -0x28(%ebp)
c0003641:	52                   	push   %edx
c0003642:	50                   	push   %eax
c0003643:	e8 19 69 00 00       	call   c0009f61 <Memcpy>
c0003648:	83 c4 10             	add    $0x10,%esp
c000364b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000364e:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
c0003655:	00 00 00 
c0003658:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000365b:	c6 80 84 01 00 00 00 	movb   $0x0,0x184(%eax)
c0003662:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003665:	c7 80 90 01 00 00 1f 	movl   $0x1f,0x190(%eax)
c000366c:	00 00 00 
c000366f:	83 ec 0c             	sub    $0xc,%esp
c0003672:	ff 75 ec             	pushl  -0x14(%ebp)
c0003675:	e8 ef 07 00 00       	call   c0003e69 <unblock>
c000367a:	83 c4 10             	add    $0x10,%esp
c000367d:	8b 45 10             	mov    0x10(%ebp),%eax
c0003680:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0003686:	85 c0                	test   %eax,%eax
c0003688:	74 1c                	je     c00036a6 <sys_send_msg+0x160>
c000368a:	68 11 05 00 00       	push   $0x511
c000368f:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003694:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003699:	68 25 9a 00 c0       	push   $0xc0009a25
c000369e:	e8 62 fe ff ff       	call   c0003505 <assertion_failure>
c00036a3:	83 c4 10             	add    $0x10,%esp
c00036a6:	8b 45 10             	mov    0x10(%ebp),%eax
c00036a9:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c00036b0:	84 c0                	test   %al,%al
c00036b2:	74 1c                	je     c00036d0 <sys_send_msg+0x18a>
c00036b4:	68 12 05 00 00       	push   $0x512
c00036b9:	68 1e 9a 00 c0       	push   $0xc0009a1e
c00036be:	68 1e 9a 00 c0       	push   $0xc0009a1e
c00036c3:	68 38 9a 00 c0       	push   $0xc0009a38
c00036c8:	e8 38 fe ff ff       	call   c0003505 <assertion_failure>
c00036cd:	83 c4 10             	add    $0x10,%esp
c00036d0:	8b 45 10             	mov    0x10(%ebp),%eax
c00036d3:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
c00036d9:	83 f8 1f             	cmp    $0x1f,%eax
c00036dc:	74 1c                	je     c00036fa <sys_send_msg+0x1b4>
c00036de:	68 13 05 00 00       	push   $0x513
c00036e3:	68 1e 9a 00 c0       	push   $0xc0009a1e
c00036e8:	68 1e 9a 00 c0       	push   $0xc0009a1e
c00036ed:	68 4c 9a 00 c0       	push   $0xc0009a4c
c00036f2:	e8 0e fe ff ff       	call   c0003505 <assertion_failure>
c00036f7:	83 c4 10             	add    $0x10,%esp
c00036fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036fd:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0003703:	85 c0                	test   %eax,%eax
c0003705:	74 1c                	je     c0003723 <sys_send_msg+0x1dd>
c0003707:	68 15 05 00 00       	push   $0x515
c000370c:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003711:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003716:	68 69 9a 00 c0       	push   $0xc0009a69
c000371b:	e8 e5 fd ff ff       	call   c0003505 <assertion_failure>
c0003720:	83 c4 10             	add    $0x10,%esp
c0003723:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003726:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c000372d:	84 c0                	test   %al,%al
c000372f:	74 1c                	je     c000374d <sys_send_msg+0x207>
c0003731:	68 16 05 00 00       	push   $0x516
c0003736:	68 1e 9a 00 c0       	push   $0xc0009a1e
c000373b:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003740:	68 7e 9a 00 c0       	push   $0xc0009a7e
c0003745:	e8 bb fd ff ff       	call   c0003505 <assertion_failure>
c000374a:	83 c4 10             	add    $0x10,%esp
c000374d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003750:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
c0003756:	83 f8 1f             	cmp    $0x1f,%eax
c0003759:	0f 84 45 01 00 00    	je     c00038a4 <sys_send_msg+0x35e>
c000375f:	68 17 05 00 00       	push   $0x517
c0003764:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003769:	68 1e 9a 00 c0       	push   $0xc0009a1e
c000376e:	68 94 9a 00 c0       	push   $0xc0009a94
c0003773:	e8 8d fd ff ff       	call   c0003505 <assertion_failure>
c0003778:	83 c4 10             	add    $0x10,%esp
c000377b:	e9 24 01 00 00       	jmp    c00038a4 <sys_send_msg+0x35e>
c0003780:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003787:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000378a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000378d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003790:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
c0003796:	85 c0                	test   %eax,%eax
c0003798:	75 1b                	jne    c00037b5 <sys_send_msg+0x26f>
c000379a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000379d:	8b 55 10             	mov    0x10(%ebp),%edx
c00037a0:	89 90 94 01 00 00    	mov    %edx,0x194(%eax)
c00037a6:	8b 45 10             	mov    0x10(%ebp),%eax
c00037a9:	c7 80 98 01 00 00 00 	movl   $0x0,0x198(%eax)
c00037b0:	00 00 00 
c00037b3:	eb 3f                	jmp    c00037f4 <sys_send_msg+0x2ae>
c00037b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00037b8:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
c00037be:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00037c1:	eb 12                	jmp    c00037d5 <sys_send_msg+0x28f>
c00037c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00037c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00037c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00037cc:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
c00037d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00037d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00037d9:	75 e8                	jne    c00037c3 <sys_send_msg+0x27d>
c00037db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037de:	8b 55 10             	mov    0x10(%ebp),%edx
c00037e1:	89 90 98 01 00 00    	mov    %edx,0x198(%eax)
c00037e7:	8b 45 10             	mov    0x10(%ebp),%eax
c00037ea:	c7 80 98 01 00 00 00 	movl   $0x0,0x198(%eax)
c00037f1:	00 00 00 
c00037f4:	8b 45 10             	mov    0x10(%ebp),%eax
c00037f7:	8b 55 08             	mov    0x8(%ebp),%edx
c00037fa:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
c0003800:	8b 45 10             	mov    0x10(%ebp),%eax
c0003803:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003806:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
c000380c:	8b 45 10             	mov    0x10(%ebp),%eax
c000380f:	c6 80 84 01 00 00 01 	movb   $0x1,0x184(%eax)
c0003816:	8b 45 10             	mov    0x10(%ebp),%eax
c0003819:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0003820:	3c 01                	cmp    $0x1,%al
c0003822:	74 1c                	je     c0003840 <sys_send_msg+0x2fa>
c0003824:	68 38 05 00 00       	push   $0x538
c0003829:	68 1e 9a 00 c0       	push   $0xc0009a1e
c000382e:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003833:	68 b8 9a 00 c0       	push   $0xc0009ab8
c0003838:	e8 c8 fc ff ff       	call   c0003505 <assertion_failure>
c000383d:	83 c4 10             	add    $0x10,%esp
c0003840:	8b 45 10             	mov    0x10(%ebp),%eax
c0003843:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
c0003849:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000384c:	74 1c                	je     c000386a <sys_send_msg+0x324>
c000384e:	68 39 05 00 00       	push   $0x539
c0003853:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003858:	68 1e 9a 00 c0       	push   $0xc0009a1e
c000385d:	68 d4 9a 00 c0       	push   $0xc0009ad4
c0003862:	e8 9e fc ff ff       	call   c0003505 <assertion_failure>
c0003867:	83 c4 10             	add    $0x10,%esp
c000386a:	8b 45 10             	mov    0x10(%ebp),%eax
c000386d:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0003873:	39 45 08             	cmp    %eax,0x8(%ebp)
c0003876:	74 1c                	je     c0003894 <sys_send_msg+0x34e>
c0003878:	68 3a 05 00 00       	push   $0x53a
c000387d:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003882:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003887:	68 f6 9a 00 c0       	push   $0xc0009af6
c000388c:	e8 74 fc ff ff       	call   c0003505 <assertion_failure>
c0003891:	83 c4 10             	add    $0x10,%esp
c0003894:	83 ec 0c             	sub    $0xc,%esp
c0003897:	ff 75 10             	pushl  0x10(%ebp)
c000389a:	e8 b8 05 00 00       	call   c0003e57 <block>
c000389f:	83 c4 10             	add    $0x10,%esp
c00038a2:	eb 01                	jmp    c00038a5 <sys_send_msg+0x35f>
c00038a4:	90                   	nop
c00038a5:	b8 00 00 00 00       	mov    $0x0,%eax
c00038aa:	c9                   	leave  
c00038ab:	c3                   	ret    

c00038ac <sys_receive_msg>:
c00038ac:	55                   	push   %ebp
c00038ad:	89 e5                	mov    %esp,%ebp
c00038af:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c00038b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00038bc:	83 ec 0c             	sub    $0xc,%esp
c00038bf:	ff 75 0c             	pushl  0xc(%ebp)
c00038c2:	e8 79 35 00 00       	call   c0006e40 <pid2proc>
c00038c7:	83 c4 10             	add    $0x10,%esp
c00038ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00038cd:	83 ec 0c             	sub    $0xc,%esp
c00038d0:	ff 75 10             	pushl  0x10(%ebp)
c00038d3:	e8 84 35 00 00       	call   c0006e5c <proc2pid>
c00038d8:	83 c4 10             	add    $0x10,%esp
c00038db:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00038de:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00038e5:	8b 45 10             	mov    0x10(%ebp),%eax
c00038e8:	8b 80 9c 01 00 00    	mov    0x19c(%eax),%eax
c00038ee:	85 c0                	test   %eax,%eax
c00038f0:	0f 84 9a 00 00 00    	je     c0003990 <sys_receive_msg+0xe4>
c00038f6:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
c00038fa:	74 0d                	je     c0003909 <sys_receive_msg+0x5d>
c00038fc:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0003903:	0f 85 87 00 00 00    	jne    c0003990 <sys_receive_msg+0xe4>
c0003909:	83 ec 04             	sub    $0x4,%esp
c000390c:	6a 6c                	push   $0x6c
c000390e:	6a 00                	push   $0x0
c0003910:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0003916:	50                   	push   %eax
c0003917:	e8 73 66 00 00       	call   c0009f8f <Memset>
c000391c:	83 c4 10             	add    $0x10,%esp
c000391f:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
c0003926:	02 00 00 
c0003929:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
c0003930:	83 ec 08             	sub    $0x8,%esp
c0003933:	ff 75 08             	pushl  0x8(%ebp)
c0003936:	ff 75 e0             	pushl  -0x20(%ebp)
c0003939:	e8 45 36 00 00       	call   c0006f83 <v2l>
c000393e:	83 c4 10             	add    $0x10,%esp
c0003941:	89 c2                	mov    %eax,%edx
c0003943:	83 ec 04             	sub    $0x4,%esp
c0003946:	6a 6c                	push   $0x6c
c0003948:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c000394e:	50                   	push   %eax
c000394f:	52                   	push   %edx
c0003950:	e8 0c 66 00 00       	call   c0009f61 <Memcpy>
c0003955:	83 c4 10             	add    $0x10,%esp
c0003958:	8b 45 10             	mov    0x10(%ebp),%eax
c000395b:	c7 80 9c 01 00 00 00 	movl   $0x0,0x19c(%eax)
c0003962:	00 00 00 
c0003965:	8b 45 10             	mov    0x10(%ebp),%eax
c0003968:	c7 80 90 01 00 00 1f 	movl   $0x1f,0x190(%eax)
c000396f:	00 00 00 
c0003972:	8b 45 10             	mov    0x10(%ebp),%eax
c0003975:	c7 80 8c 01 00 00 1f 	movl   $0x1f,0x18c(%eax)
c000397c:	00 00 00 
c000397f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003982:	c6 80 84 01 00 00 00 	movb   $0x0,0x184(%eax)
c0003989:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003990:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0003994:	0f 84 cd 03 00 00    	je     c0003d67 <sys_receive_msg+0x4bb>
c000399a:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
c000399e:	75 26                	jne    c00039c6 <sys_receive_msg+0x11a>
c00039a0:	8b 45 10             	mov    0x10(%ebp),%eax
c00039a3:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
c00039a9:	85 c0                	test   %eax,%eax
c00039ab:	0f 84 87 00 00 00    	je     c0003a38 <sys_receive_msg+0x18c>
c00039b1:	8b 45 10             	mov    0x10(%ebp),%eax
c00039b4:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
c00039ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00039bd:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00039c4:	eb 72                	jmp    c0003a38 <sys_receive_msg+0x18c>
c00039c6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00039ca:	78 6c                	js     c0003a38 <sys_receive_msg+0x18c>
c00039cc:	83 7d 0c 05          	cmpl   $0x5,0xc(%ebp)
c00039d0:	7f 66                	jg     c0003a38 <sys_receive_msg+0x18c>
c00039d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00039d5:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c00039dc:	3c 01                	cmp    $0x1,%al
c00039de:	75 58                	jne    c0003a38 <sys_receive_msg+0x18c>
c00039e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00039e3:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
c00039e9:	83 f8 10             	cmp    $0x10,%eax
c00039ec:	74 0e                	je     c00039fc <sys_receive_msg+0x150>
c00039ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00039f1:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
c00039f7:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c00039fa:	75 3c                	jne    c0003a38 <sys_receive_msg+0x18c>
c00039fc:	8b 45 10             	mov    0x10(%ebp),%eax
c00039ff:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
c0003a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a08:	eb 28                	jmp    c0003a32 <sys_receive_msg+0x186>
c0003a0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a0d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003a10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a13:	8b 50 58             	mov    0x58(%eax),%edx
c0003a16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a19:	39 c2                	cmp    %eax,%edx
c0003a1b:	75 09                	jne    c0003a26 <sys_receive_msg+0x17a>
c0003a1d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0003a24:	eb 12                	jmp    c0003a38 <sys_receive_msg+0x18c>
c0003a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a29:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
c0003a2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a32:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003a36:	75 d2                	jne    c0003a0a <sys_receive_msg+0x15e>
c0003a38:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0003a3c:	0f 85 82 02 00 00    	jne    c0003cc4 <sys_receive_msg+0x418>
c0003a42:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a45:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003a48:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a4b:	8b 40 0c             	mov    0xc(%eax),%eax
c0003a4e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003a51:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003a54:	83 ec 08             	sub    $0x8,%esp
c0003a57:	ff 75 10             	pushl  0x10(%ebp)
c0003a5a:	50                   	push   %eax
c0003a5b:	e8 c9 34 00 00       	call   c0006f29 <Seg2PhyAddrLDT>
c0003a60:	83 c4 10             	add    $0x10,%esp
c0003a63:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003a66:	8b 55 08             	mov    0x8(%ebp),%edx
c0003a69:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003a6c:	01 d0                	add    %edx,%eax
c0003a6e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003a71:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
c0003a78:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a7b:	8b 40 0c             	mov    0xc(%eax),%eax
c0003a7e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003a81:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003a84:	83 ec 08             	sub    $0x8,%esp
c0003a87:	ff 75 dc             	pushl  -0x24(%ebp)
c0003a8a:	50                   	push   %eax
c0003a8b:	e8 99 34 00 00       	call   c0006f29 <Seg2PhyAddrLDT>
c0003a90:	83 c4 10             	add    $0x10,%esp
c0003a93:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003a96:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003a99:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0003a9f:	89 c2                	mov    %eax,%edx
c0003aa1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003aa4:	01 d0                	add    %edx,%eax
c0003aa6:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003aa9:	83 ec 04             	sub    $0x4,%esp
c0003aac:	ff 75 cc             	pushl  -0x34(%ebp)
c0003aaf:	ff 75 c0             	pushl  -0x40(%ebp)
c0003ab2:	ff 75 d0             	pushl  -0x30(%ebp)
c0003ab5:	e8 a7 64 00 00       	call   c0009f61 <Memcpy>
c0003aba:	83 c4 10             	add    $0x10,%esp
c0003abd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003ac0:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003ac3:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
c0003ac7:	75 27                	jne    c0003af0 <sys_receive_msg+0x244>
c0003ac9:	8b 45 08             	mov    0x8(%ebp),%eax
c0003acc:	8b 40 68             	mov    0x68(%eax),%eax
c0003acf:	83 f8 06             	cmp    $0x6,%eax
c0003ad2:	74 1c                	je     c0003af0 <sys_receive_msg+0x244>
c0003ad4:	68 c7 05 00 00       	push   $0x5c7
c0003ad9:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003ade:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003ae3:	68 0b 9b 00 c0       	push   $0xc0009b0b
c0003ae8:	e8 18 fa ff ff       	call   c0003505 <assertion_failure>
c0003aed:	83 c4 10             	add    $0x10,%esp
c0003af0:	8b 45 10             	mov    0x10(%ebp),%eax
c0003af3:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
c0003af9:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0003afc:	75 21                	jne    c0003b1f <sys_receive_msg+0x273>
c0003afe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b01:	8b 90 98 01 00 00    	mov    0x198(%eax),%edx
c0003b07:	8b 45 10             	mov    0x10(%ebp),%eax
c0003b0a:	89 90 94 01 00 00    	mov    %edx,0x194(%eax)
c0003b10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b13:	c7 80 98 01 00 00 00 	movl   $0x0,0x198(%eax)
c0003b1a:	00 00 00 
c0003b1d:	eb 1f                	jmp    c0003b3e <sys_receive_msg+0x292>
c0003b1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b22:	8b 90 98 01 00 00    	mov    0x198(%eax),%edx
c0003b28:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b2b:	89 90 98 01 00 00    	mov    %edx,0x198(%eax)
c0003b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b34:	c7 80 98 01 00 00 00 	movl   $0x0,0x198(%eax)
c0003b3b:	00 00 00 
c0003b3e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003b41:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
c0003b48:	00 00 00 
c0003b4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003b4e:	c6 80 84 01 00 00 00 	movb   $0x0,0x184(%eax)
c0003b55:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003b58:	c7 80 8c 01 00 00 1f 	movl   $0x1f,0x18c(%eax)
c0003b5f:	00 00 00 
c0003b62:	8b 45 10             	mov    0x10(%ebp),%eax
c0003b65:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
c0003b6c:	00 00 00 
c0003b6f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003b72:	c7 80 90 01 00 00 1f 	movl   $0x1f,0x190(%eax)
c0003b79:	00 00 00 
c0003b7c:	8b 45 10             	mov    0x10(%ebp),%eax
c0003b7f:	c7 80 8c 01 00 00 1f 	movl   $0x1f,0x18c(%eax)
c0003b86:	00 00 00 
c0003b89:	83 ec 0c             	sub    $0xc,%esp
c0003b8c:	ff 75 dc             	pushl  -0x24(%ebp)
c0003b8f:	e8 d5 02 00 00       	call   c0003e69 <unblock>
c0003b94:	83 c4 10             	add    $0x10,%esp
c0003b97:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003b9a:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0003ba0:	85 c0                	test   %eax,%eax
c0003ba2:	74 1c                	je     c0003bc0 <sys_receive_msg+0x314>
c0003ba4:	68 e8 05 00 00       	push   $0x5e8
c0003ba9:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003bae:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003bb3:	68 1d 9b 00 c0       	push   $0xc0009b1d
c0003bb8:	e8 48 f9 ff ff       	call   c0003505 <assertion_failure>
c0003bbd:	83 c4 10             	add    $0x10,%esp
c0003bc0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003bc3:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0003bca:	84 c0                	test   %al,%al
c0003bcc:	74 1c                	je     c0003bea <sys_receive_msg+0x33e>
c0003bce:	68 e9 05 00 00       	push   $0x5e9
c0003bd3:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003bd8:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003bdd:	68 35 9b 00 c0       	push   $0xc0009b35
c0003be2:	e8 1e f9 ff ff       	call   c0003505 <assertion_failure>
c0003be7:	83 c4 10             	add    $0x10,%esp
c0003bea:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003bed:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
c0003bf3:	83 f8 1f             	cmp    $0x1f,%eax
c0003bf6:	74 1c                	je     c0003c14 <sys_receive_msg+0x368>
c0003bf8:	68 ea 05 00 00       	push   $0x5ea
c0003bfd:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c02:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c07:	68 50 9b 00 c0       	push   $0xc0009b50
c0003c0c:	e8 f4 f8 ff ff       	call   c0003505 <assertion_failure>
c0003c11:	83 c4 10             	add    $0x10,%esp
c0003c14:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c17:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0003c1d:	85 c0                	test   %eax,%eax
c0003c1f:	74 1c                	je     c0003c3d <sys_receive_msg+0x391>
c0003c21:	68 ec 05 00 00       	push   $0x5ec
c0003c26:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c2b:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c30:	68 69 9a 00 c0       	push   $0xc0009a69
c0003c35:	e8 cb f8 ff ff       	call   c0003505 <assertion_failure>
c0003c3a:	83 c4 10             	add    $0x10,%esp
c0003c3d:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c40:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0003c47:	84 c0                	test   %al,%al
c0003c49:	74 1c                	je     c0003c67 <sys_receive_msg+0x3bb>
c0003c4b:	68 ed 05 00 00       	push   $0x5ed
c0003c50:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c55:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c5a:	68 7e 9a 00 c0       	push   $0xc0009a7e
c0003c5f:	e8 a1 f8 ff ff       	call   c0003505 <assertion_failure>
c0003c64:	83 c4 10             	add    $0x10,%esp
c0003c67:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c6a:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
c0003c70:	83 f8 1f             	cmp    $0x1f,%eax
c0003c73:	74 1c                	je     c0003c91 <sys_receive_msg+0x3e5>
c0003c75:	68 ee 05 00 00       	push   $0x5ee
c0003c7a:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c7f:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003c84:	68 94 9a 00 c0       	push   $0xc0009a94
c0003c89:	e8 77 f8 ff ff       	call   c0003505 <assertion_failure>
c0003c8e:	83 c4 10             	add    $0x10,%esp
c0003c91:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c94:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
c0003c9a:	83 f8 1f             	cmp    $0x1f,%eax
c0003c9d:	0f 84 bd 00 00 00    	je     c0003d60 <sys_receive_msg+0x4b4>
c0003ca3:	68 ef 05 00 00       	push   $0x5ef
c0003ca8:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003cad:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003cb2:	68 74 9b 00 c0       	push   $0xc0009b74
c0003cb7:	e8 49 f8 ff ff       	call   c0003505 <assertion_failure>
c0003cbc:	83 c4 10             	add    $0x10,%esp
c0003cbf:	e9 9c 00 00 00       	jmp    c0003d60 <sys_receive_msg+0x4b4>
c0003cc4:	8b 45 10             	mov    0x10(%ebp),%eax
c0003cc7:	c6 80 84 01 00 00 02 	movb   $0x2,0x184(%eax)
c0003cce:	8b 45 10             	mov    0x10(%ebp),%eax
c0003cd1:	8b 55 08             	mov    0x8(%ebp),%edx
c0003cd4:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
c0003cda:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
c0003cde:	75 0f                	jne    c0003cef <sys_receive_msg+0x443>
c0003ce0:	8b 45 10             	mov    0x10(%ebp),%eax
c0003ce3:	c7 80 90 01 00 00 10 	movl   $0x10,0x190(%eax)
c0003cea:	00 00 00 
c0003ced:	eb 0c                	jmp    c0003cfb <sys_receive_msg+0x44f>
c0003cef:	8b 45 10             	mov    0x10(%ebp),%eax
c0003cf2:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003cf5:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
c0003cfb:	8b 0d 40 f7 00 c0    	mov    0xc000f740,%ecx
c0003d01:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0003d06:	89 c8                	mov    %ecx,%eax
c0003d08:	f7 ea                	imul   %edx
c0003d0a:	c1 fa 06             	sar    $0x6,%edx
c0003d0d:	89 c8                	mov    %ecx,%eax
c0003d0f:	c1 f8 1f             	sar    $0x1f,%eax
c0003d12:	29 c2                	sub    %eax,%edx
c0003d14:	89 d0                	mov    %edx,%eax
c0003d16:	8d 50 01             	lea    0x1(%eax),%edx
c0003d19:	89 d0                	mov    %edx,%eax
c0003d1b:	c1 e0 02             	shl    $0x2,%eax
c0003d1e:	01 d0                	add    %edx,%eax
c0003d20:	c1 e0 05             	shl    $0x5,%eax
c0003d23:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c0003d28:	8b 45 10             	mov    0x10(%ebp),%eax
c0003d2b:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0003d32:	3c 02                	cmp    $0x2,%al
c0003d34:	74 1c                	je     c0003d52 <sys_receive_msg+0x4a6>
c0003d36:	68 24 06 00 00       	push   $0x624
c0003d3b:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003d40:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003d45:	68 93 9b 00 c0       	push   $0xc0009b93
c0003d4a:	e8 b6 f7 ff ff       	call   c0003505 <assertion_failure>
c0003d4f:	83 c4 10             	add    $0x10,%esp
c0003d52:	83 ec 0c             	sub    $0xc,%esp
c0003d55:	ff 75 10             	pushl  0x10(%ebp)
c0003d58:	e8 fa 00 00 00       	call   c0003e57 <block>
c0003d5d:	83 c4 10             	add    $0x10,%esp
c0003d60:	b8 00 00 00 00       	mov    $0x0,%eax
c0003d65:	eb 02                	jmp    c0003d69 <sys_receive_msg+0x4bd>
c0003d67:	90                   	nop
c0003d68:	90                   	nop
c0003d69:	c9                   	leave  
c0003d6a:	c3                   	ret    

c0003d6b <disp_str_colour_debug>:
c0003d6b:	55                   	push   %ebp
c0003d6c:	89 e5                	mov    %esp,%ebp
c0003d6e:	90                   	nop
c0003d6f:	5d                   	pop    %ebp
c0003d70:	c3                   	ret    

c0003d71 <send_rec>:
c0003d71:	55                   	push   %ebp
c0003d72:	89 e5                	mov    %esp,%ebp
c0003d74:	83 ec 18             	sub    $0x18,%esp
c0003d77:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0003d7b:	74 28                	je     c0003da5 <send_rec+0x34>
c0003d7d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0003d81:	74 22                	je     c0003da5 <send_rec+0x34>
c0003d83:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0003d87:	74 1c                	je     c0003da5 <send_rec+0x34>
c0003d89:	68 4d 06 00 00       	push   $0x64d
c0003d8e:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003d93:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003d98:	68 b4 9b 00 c0       	push   $0xc0009bb4
c0003d9d:	e8 63 f7 ff ff       	call   c0003505 <assertion_failure>
c0003da2:	83 c4 10             	add    $0x10,%esp
c0003da5:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0003da9:	75 12                	jne    c0003dbd <send_rec+0x4c>
c0003dab:	83 ec 04             	sub    $0x4,%esp
c0003dae:	6a 6c                	push   $0x6c
c0003db0:	6a 00                	push   $0x0
c0003db2:	ff 75 0c             	pushl  0xc(%ebp)
c0003db5:	e8 d5 61 00 00       	call   c0009f8f <Memset>
c0003dba:	83 c4 10             	add    $0x10,%esp
c0003dbd:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0003dc1:	74 22                	je     c0003de5 <send_rec+0x74>
c0003dc3:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0003dc7:	74 32                	je     c0003dfb <send_rec+0x8a>
c0003dc9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0003dcd:	75 6e                	jne    c0003e3d <send_rec+0xcc>
c0003dcf:	83 ec 08             	sub    $0x8,%esp
c0003dd2:	ff 75 10             	pushl  0x10(%ebp)
c0003dd5:	ff 75 0c             	pushl  0xc(%ebp)
c0003dd8:	e8 9b 0f 00 00       	call   c0004d78 <send_msg>
c0003ddd:	83 c4 10             	add    $0x10,%esp
c0003de0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003de3:	eb 6b                	jmp    c0003e50 <send_rec+0xdf>
c0003de5:	83 ec 08             	sub    $0x8,%esp
c0003de8:	ff 75 10             	pushl  0x10(%ebp)
c0003deb:	ff 75 0c             	pushl  0xc(%ebp)
c0003dee:	e8 ab 0f 00 00       	call   c0004d9e <receive_msg>
c0003df3:	83 c4 10             	add    $0x10,%esp
c0003df6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003df9:	eb 55                	jmp    c0003e50 <send_rec+0xdf>
c0003dfb:	83 ec 08             	sub    $0x8,%esp
c0003dfe:	ff 75 10             	pushl  0x10(%ebp)
c0003e01:	ff 75 0c             	pushl  0xc(%ebp)
c0003e04:	e8 6f 0f 00 00       	call   c0004d78 <send_msg>
c0003e09:	83 c4 10             	add    $0x10,%esp
c0003e0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003e13:	75 3a                	jne    c0003e4f <send_rec+0xde>
c0003e15:	83 ec 04             	sub    $0x4,%esp
c0003e18:	6a 6c                	push   $0x6c
c0003e1a:	6a 00                	push   $0x0
c0003e1c:	ff 75 0c             	pushl  0xc(%ebp)
c0003e1f:	e8 6b 61 00 00       	call   c0009f8f <Memset>
c0003e24:	83 c4 10             	add    $0x10,%esp
c0003e27:	83 ec 08             	sub    $0x8,%esp
c0003e2a:	ff 75 10             	pushl  0x10(%ebp)
c0003e2d:	ff 75 0c             	pushl  0xc(%ebp)
c0003e30:	e8 69 0f 00 00       	call   c0004d9e <receive_msg>
c0003e35:	83 c4 10             	add    $0x10,%esp
c0003e38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e3b:	eb 12                	jmp    c0003e4f <send_rec+0xde>
c0003e3d:	83 ec 0c             	sub    $0xc,%esp
c0003e40:	68 f0 9b 00 c0       	push   $0xc0009bf0
c0003e45:	e8 9d f6 ff ff       	call   c00034e7 <panic>
c0003e4a:	83 c4 10             	add    $0x10,%esp
c0003e4d:	eb 01                	jmp    c0003e50 <send_rec+0xdf>
c0003e4f:	90                   	nop
c0003e50:	b8 00 00 00 00       	mov    $0x0,%eax
c0003e55:	c9                   	leave  
c0003e56:	c3                   	ret    

c0003e57 <block>:
c0003e57:	55                   	push   %ebp
c0003e58:	89 e5                	mov    %esp,%ebp
c0003e5a:	83 ec 08             	sub    $0x8,%esp
c0003e5d:	e8 8f 2e 00 00       	call   c0006cf1 <schedule_process>
c0003e62:	b8 00 00 00 00       	mov    $0x0,%eax
c0003e67:	c9                   	leave  
c0003e68:	c3                   	ret    

c0003e69 <unblock>:
c0003e69:	55                   	push   %ebp
c0003e6a:	89 e5                	mov    %esp,%ebp
c0003e6c:	83 ec 08             	sub    $0x8,%esp
c0003e6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0003e72:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0003e79:	84 c0                	test   %al,%al
c0003e7b:	74 1c                	je     c0003e99 <unblock+0x30>
c0003e7d:	68 85 06 00 00       	push   $0x685
c0003e82:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003e87:	68 1e 9a 00 c0       	push   $0xc0009a1e
c0003e8c:	68 05 9c 00 c0       	push   $0xc0009c05
c0003e91:	e8 6f f6 ff ff       	call   c0003505 <assertion_failure>
c0003e96:	83 c4 10             	add    $0x10,%esp
c0003e99:	b8 00 00 00 00       	mov    $0x0,%eax
c0003e9e:	c9                   	leave  
c0003e9f:	c3                   	ret    

c0003ea0 <get_ticks_ipc>:
c0003ea0:	55                   	push   %ebp
c0003ea1:	89 e5                	mov    %esp,%ebp
c0003ea3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0003ea9:	83 ec 04             	sub    $0x4,%esp
c0003eac:	6a 6c                	push   $0x6c
c0003eae:	6a 00                	push   $0x0
c0003eb0:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003eb3:	50                   	push   %eax
c0003eb4:	e8 d6 60 00 00       	call   c0009f8f <Memset>
c0003eb9:	83 c4 10             	add    $0x10,%esp
c0003ebc:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c0003ec3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003eca:	83 ec 04             	sub    $0x4,%esp
c0003ecd:	6a 01                	push   $0x1
c0003ecf:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003ed2:	50                   	push   %eax
c0003ed3:	6a 03                	push   $0x3
c0003ed5:	e8 97 fe ff ff       	call   c0003d71 <send_rec>
c0003eda:	83 c4 10             	add    $0x10,%esp
c0003edd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003ee0:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0003ee3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003ee6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003ee9:	c9                   	leave  
c0003eea:	c3                   	ret    

c0003eeb <itoa>:
c0003eeb:	55                   	push   %ebp
c0003eec:	89 e5                	mov    %esp,%ebp
c0003eee:	53                   	push   %ebx
c0003eef:	83 ec 14             	sub    $0x14,%esp
c0003ef2:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ef5:	99                   	cltd   
c0003ef6:	f7 7d 10             	idivl  0x10(%ebp)
c0003ef9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0003efc:	8b 45 08             	mov    0x8(%ebp),%eax
c0003eff:	99                   	cltd   
c0003f00:	f7 7d 10             	idivl  0x10(%ebp)
c0003f03:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003f06:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003f0a:	74 14                	je     c0003f20 <itoa+0x35>
c0003f0c:	83 ec 04             	sub    $0x4,%esp
c0003f0f:	ff 75 10             	pushl  0x10(%ebp)
c0003f12:	ff 75 0c             	pushl  0xc(%ebp)
c0003f15:	ff 75 f0             	pushl  -0x10(%ebp)
c0003f18:	e8 ce ff ff ff       	call   c0003eeb <itoa>
c0003f1d:	83 c4 10             	add    $0x10,%esp
c0003f20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f23:	8d 58 30             	lea    0x30(%eax),%ebx
c0003f26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003f29:	8b 00                	mov    (%eax),%eax
c0003f2b:	8d 48 01             	lea    0x1(%eax),%ecx
c0003f2e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003f31:	89 0a                	mov    %ecx,(%edx)
c0003f33:	89 da                	mov    %ebx,%edx
c0003f35:	88 10                	mov    %dl,(%eax)
c0003f37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003f3a:	8b 00                	mov    (%eax),%eax
c0003f3c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003f3f:	c9                   	leave  
c0003f40:	c3                   	ret    

c0003f41 <i2a>:
c0003f41:	55                   	push   %ebp
c0003f42:	89 e5                	mov    %esp,%ebp
c0003f44:	53                   	push   %ebx
c0003f45:	83 ec 14             	sub    $0x14,%esp
c0003f48:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f4b:	99                   	cltd   
c0003f4c:	f7 7d 0c             	idivl  0xc(%ebp)
c0003f4f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0003f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f55:	99                   	cltd   
c0003f56:	f7 7d 0c             	idivl  0xc(%ebp)
c0003f59:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003f5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003f60:	74 14                	je     c0003f76 <i2a+0x35>
c0003f62:	83 ec 04             	sub    $0x4,%esp
c0003f65:	ff 75 10             	pushl  0x10(%ebp)
c0003f68:	ff 75 0c             	pushl  0xc(%ebp)
c0003f6b:	ff 75 f0             	pushl  -0x10(%ebp)
c0003f6e:	e8 ce ff ff ff       	call   c0003f41 <i2a>
c0003f73:	83 c4 10             	add    $0x10,%esp
c0003f76:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0003f7a:	7f 0a                	jg     c0003f86 <i2a+0x45>
c0003f7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f7f:	83 c0 30             	add    $0x30,%eax
c0003f82:	89 c3                	mov    %eax,%ebx
c0003f84:	eb 08                	jmp    c0003f8e <i2a+0x4d>
c0003f86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f89:	83 c0 37             	add    $0x37,%eax
c0003f8c:	89 c3                	mov    %eax,%ebx
c0003f8e:	8b 45 10             	mov    0x10(%ebp),%eax
c0003f91:	8b 00                	mov    (%eax),%eax
c0003f93:	8d 48 01             	lea    0x1(%eax),%ecx
c0003f96:	8b 55 10             	mov    0x10(%ebp),%edx
c0003f99:	89 0a                	mov    %ecx,(%edx)
c0003f9b:	88 18                	mov    %bl,(%eax)
c0003f9d:	8b 45 10             	mov    0x10(%ebp),%eax
c0003fa0:	8b 00                	mov    (%eax),%eax
c0003fa2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003fa5:	c9                   	leave  
c0003fa6:	c3                   	ret    

c0003fa7 <inform_int>:
c0003fa7:	55                   	push   %ebp
c0003fa8:	89 e5                	mov    %esp,%ebp
c0003faa:	83 ec 18             	sub    $0x18,%esp
c0003fad:	83 ec 0c             	sub    $0xc,%esp
c0003fb0:	ff 75 08             	pushl  0x8(%ebp)
c0003fb3:	e8 88 2e 00 00       	call   c0006e40 <pid2proc>
c0003fb8:	83 c4 10             	add    $0x10,%esp
c0003fbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003fbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003fc1:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0003fc8:	0f be c0             	movsbl %al,%eax
c0003fcb:	83 e0 02             	and    $0x2,%eax
c0003fce:	85 c0                	test   %eax,%eax
c0003fd0:	74 7e                	je     c0004050 <inform_int+0xa9>
c0003fd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003fd5:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
c0003fdb:	3d 13 02 00 00       	cmp    $0x213,%eax
c0003fe0:	74 0e                	je     c0003ff0 <inform_int+0x49>
c0003fe2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003fe5:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
c0003feb:	83 f8 10             	cmp    $0x10,%eax
c0003fee:	75 6d                	jne    c000405d <inform_int+0xb6>
c0003ff0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003ff3:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0003ff9:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0003fff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004002:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
c0004008:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000400f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004012:	c7 80 9c 01 00 00 00 	movl   $0x0,0x19c(%eax)
c0004019:	00 00 00 
c000401c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000401f:	c7 80 90 01 00 00 1f 	movl   $0x1f,0x190(%eax)
c0004026:	00 00 00 
c0004029:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000402c:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
c0004033:	00 00 00 
c0004036:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004039:	c6 80 84 01 00 00 00 	movb   $0x0,0x184(%eax)
c0004040:	83 ec 0c             	sub    $0xc,%esp
c0004043:	ff 75 f4             	pushl  -0xc(%ebp)
c0004046:	e8 1e fe ff ff       	call   c0003e69 <unblock>
c000404b:	83 c4 10             	add    $0x10,%esp
c000404e:	eb 0d                	jmp    c000405d <inform_int+0xb6>
c0004050:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004053:	c7 80 9c 01 00 00 01 	movl   $0x1,0x19c(%eax)
c000405a:	00 00 00 
c000405d:	90                   	nop
c000405e:	c9                   	leave  
c000405f:	c3                   	ret    

c0004060 <strcmp>:
c0004060:	55                   	push   %ebp
c0004061:	89 e5                	mov    %esp,%ebp
c0004063:	83 ec 10             	sub    $0x10,%esp
c0004066:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000406a:	74 06                	je     c0004072 <strcmp+0x12>
c000406c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0004070:	75 08                	jne    c000407a <strcmp+0x1a>
c0004072:	8b 45 08             	mov    0x8(%ebp),%eax
c0004075:	2b 45 0c             	sub    0xc(%ebp),%eax
c0004078:	eb 53                	jmp    c00040cd <strcmp+0x6d>
c000407a:	8b 45 08             	mov    0x8(%ebp),%eax
c000407d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004080:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004083:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004086:	eb 18                	jmp    c00040a0 <strcmp+0x40>
c0004088:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000408b:	0f b6 10             	movzbl (%eax),%edx
c000408e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004091:	0f b6 00             	movzbl (%eax),%eax
c0004094:	38 c2                	cmp    %al,%dl
c0004096:	75 1e                	jne    c00040b6 <strcmp+0x56>
c0004098:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000409c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00040a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00040a3:	0f b6 00             	movzbl (%eax),%eax
c00040a6:	84 c0                	test   %al,%al
c00040a8:	74 0d                	je     c00040b7 <strcmp+0x57>
c00040aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00040ad:	0f b6 00             	movzbl (%eax),%eax
c00040b0:	84 c0                	test   %al,%al
c00040b2:	75 d4                	jne    c0004088 <strcmp+0x28>
c00040b4:	eb 01                	jmp    c00040b7 <strcmp+0x57>
c00040b6:	90                   	nop
c00040b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00040ba:	0f b6 00             	movzbl (%eax),%eax
c00040bd:	0f be d0             	movsbl %al,%edx
c00040c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00040c3:	0f b6 00             	movzbl (%eax),%eax
c00040c6:	0f be c0             	movsbl %al,%eax
c00040c9:	29 c2                	sub    %eax,%edx
c00040cb:	89 d0                	mov    %edx,%eax
c00040cd:	c9                   	leave  
c00040ce:	c3                   	ret    

c00040cf <TaskHD>:
c00040cf:	55                   	push   %ebp
c00040d0:	89 e5                	mov    %esp,%ebp
c00040d2:	83 ec 08             	sub    $0x8,%esp
c00040d5:	e8 07 00 00 00       	call   c00040e1 <init_hd>
c00040da:	e8 1c 00 00 00       	call   c00040fb <hd_handle>
c00040df:	eb f9                	jmp    c00040da <TaskHD+0xb>

c00040e1 <init_hd>:
c00040e1:	55                   	push   %ebp
c00040e2:	89 e5                	mov    %esp,%ebp
c00040e4:	83 ec 18             	sub    $0x18,%esp
c00040e7:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c00040ee:	e8 a6 d7 ff ff       	call   c0001899 <enable_8259A_casecade_irq>
c00040f3:	e8 b5 d7 ff ff       	call   c00018ad <enable_8259A_slave_winchester_irq>
c00040f8:	90                   	nop
c00040f9:	c9                   	leave  
c00040fa:	c3                   	ret    

c00040fb <hd_handle>:
c00040fb:	55                   	push   %ebp
c00040fc:	89 e5                	mov    %esp,%ebp
c00040fe:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0004104:	83 ec 04             	sub    $0x4,%esp
c0004107:	6a 10                	push   $0x10
c0004109:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000410c:	50                   	push   %eax
c000410d:	6a 02                	push   $0x2
c000410f:	e8 5d fc ff ff       	call   c0003d71 <send_rec>
c0004114:	83 c4 10             	add    $0x10,%esp
c0004117:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000411a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000411d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004121:	0f 84 96 00 00 00    	je     c00041bd <hd_handle+0xc2>
c0004127:	8b 45 84             	mov    -0x7c(%ebp),%eax
c000412a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000412d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0004131:	74 23                	je     c0004156 <hd_handle+0x5b>
c0004133:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0004137:	77 08                	ja     c0004141 <hd_handle+0x46>
c0004139:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c000413d:	74 10                	je     c000414f <hd_handle+0x54>
c000413f:	eb 35                	jmp    c0004176 <hd_handle+0x7b>
c0004141:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0004145:	74 0f                	je     c0004156 <hd_handle+0x5b>
c0004147:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c000414b:	74 1a                	je     c0004167 <hd_handle+0x6c>
c000414d:	eb 27                	jmp    c0004176 <hd_handle+0x7b>
c000414f:	e8 18 07 00 00       	call   c000486c <hd_open>
c0004154:	eb 31                	jmp    c0004187 <hd_handle+0x8c>
c0004156:	83 ec 0c             	sub    $0xc,%esp
c0004159:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000415c:	50                   	push   %eax
c000415d:	e8 02 08 00 00       	call   c0004964 <hd_rdwt>
c0004162:	83 c4 10             	add    $0x10,%esp
c0004165:	eb 20                	jmp    c0004187 <hd_handle+0x8c>
c0004167:	83 ec 0c             	sub    $0xc,%esp
c000416a:	6a 00                	push   $0x0
c000416c:	e8 4a 07 00 00       	call   c00048bb <get_hd_ioctl>
c0004171:	83 c4 10             	add    $0x10,%esp
c0004174:	eb 11                	jmp    c0004187 <hd_handle+0x8c>
c0004176:	83 ec 0c             	sub    $0xc,%esp
c0004179:	68 1d 9c 00 c0       	push   $0xc0009c1d
c000417e:	e8 5f f3 ff ff       	call   c00034e2 <spin>
c0004183:	83 c4 10             	add    $0x10,%esp
c0004186:	90                   	nop
c0004187:	83 ec 04             	sub    $0x4,%esp
c000418a:	6a 6c                	push   $0x6c
c000418c:	6a 00                	push   $0x0
c000418e:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0004191:	50                   	push   %eax
c0004192:	e8 f8 5d 00 00       	call   c0009f8f <Memset>
c0004197:	83 c4 10             	add    $0x10,%esp
c000419a:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
c00041a1:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c00041a8:	83 ec 04             	sub    $0x4,%esp
c00041ab:	6a 03                	push   $0x3
c00041ad:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00041b0:	50                   	push   %eax
c00041b1:	6a 01                	push   $0x1
c00041b3:	e8 b9 fb ff ff       	call   c0003d71 <send_rec>
c00041b8:	83 c4 10             	add    $0x10,%esp
c00041bb:	eb 01                	jmp    c00041be <hd_handle+0xc3>
c00041bd:	90                   	nop
c00041be:	c9                   	leave  
c00041bf:	c3                   	ret    

c00041c0 <hd_cmd_out>:
c00041c0:	55                   	push   %ebp
c00041c1:	89 e5                	mov    %esp,%ebp
c00041c3:	83 ec 08             	sub    $0x8,%esp
c00041c6:	83 ec 04             	sub    $0x4,%esp
c00041c9:	68 98 3a 00 00       	push   $0x3a98
c00041ce:	6a 00                	push   $0x0
c00041d0:	68 80 00 00 00       	push   $0x80
c00041d5:	e8 e8 09 00 00       	call   c0004bc2 <waitfor>
c00041da:	83 c4 10             	add    $0x10,%esp
c00041dd:	85 c0                	test   %eax,%eax
c00041df:	75 10                	jne    c00041f1 <hd_cmd_out+0x31>
c00041e1:	83 ec 0c             	sub    $0xc,%esp
c00041e4:	68 2f 9c 00 c0       	push   $0xc0009c2f
c00041e9:	e8 f9 f2 ff ff       	call   c00034e7 <panic>
c00041ee:	83 c4 10             	add    $0x10,%esp
c00041f1:	83 ec 08             	sub    $0x8,%esp
c00041f4:	6a 00                	push   $0x0
c00041f6:	68 f6 03 00 00       	push   $0x3f6
c00041fb:	e8 df d5 ff ff       	call   c00017df <out_byte>
c0004200:	83 c4 10             	add    $0x10,%esp
c0004203:	8b 45 08             	mov    0x8(%ebp),%eax
c0004206:	0f b6 00             	movzbl (%eax),%eax
c0004209:	0f b6 c0             	movzbl %al,%eax
c000420c:	83 ec 08             	sub    $0x8,%esp
c000420f:	50                   	push   %eax
c0004210:	68 f1 01 00 00       	push   $0x1f1
c0004215:	e8 c5 d5 ff ff       	call   c00017df <out_byte>
c000421a:	83 c4 10             	add    $0x10,%esp
c000421d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004220:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0004224:	0f b6 c0             	movzbl %al,%eax
c0004227:	83 ec 08             	sub    $0x8,%esp
c000422a:	50                   	push   %eax
c000422b:	68 f2 01 00 00       	push   $0x1f2
c0004230:	e8 aa d5 ff ff       	call   c00017df <out_byte>
c0004235:	83 c4 10             	add    $0x10,%esp
c0004238:	8b 45 08             	mov    0x8(%ebp),%eax
c000423b:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c000423f:	0f b6 c0             	movzbl %al,%eax
c0004242:	83 ec 08             	sub    $0x8,%esp
c0004245:	50                   	push   %eax
c0004246:	68 f3 01 00 00       	push   $0x1f3
c000424b:	e8 8f d5 ff ff       	call   c00017df <out_byte>
c0004250:	83 c4 10             	add    $0x10,%esp
c0004253:	8b 45 08             	mov    0x8(%ebp),%eax
c0004256:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c000425a:	0f b6 c0             	movzbl %al,%eax
c000425d:	83 ec 08             	sub    $0x8,%esp
c0004260:	50                   	push   %eax
c0004261:	68 f4 01 00 00       	push   $0x1f4
c0004266:	e8 74 d5 ff ff       	call   c00017df <out_byte>
c000426b:	83 c4 10             	add    $0x10,%esp
c000426e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004271:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0004275:	0f b6 c0             	movzbl %al,%eax
c0004278:	83 ec 08             	sub    $0x8,%esp
c000427b:	50                   	push   %eax
c000427c:	68 f5 01 00 00       	push   $0x1f5
c0004281:	e8 59 d5 ff ff       	call   c00017df <out_byte>
c0004286:	83 c4 10             	add    $0x10,%esp
c0004289:	8b 45 08             	mov    0x8(%ebp),%eax
c000428c:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0004290:	0f b6 c0             	movzbl %al,%eax
c0004293:	83 ec 08             	sub    $0x8,%esp
c0004296:	50                   	push   %eax
c0004297:	68 f6 01 00 00       	push   $0x1f6
c000429c:	e8 3e d5 ff ff       	call   c00017df <out_byte>
c00042a1:	83 c4 10             	add    $0x10,%esp
c00042a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a7:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c00042ab:	0f b6 c0             	movzbl %al,%eax
c00042ae:	83 ec 08             	sub    $0x8,%esp
c00042b1:	50                   	push   %eax
c00042b2:	68 f7 01 00 00       	push   $0x1f7
c00042b7:	e8 23 d5 ff ff       	call   c00017df <out_byte>
c00042bc:	83 c4 10             	add    $0x10,%esp
c00042bf:	90                   	nop
c00042c0:	c9                   	leave  
c00042c1:	c3                   	ret    

c00042c2 <hd_identify>:
c00042c2:	55                   	push   %ebp
c00042c3:	89 e5                	mov    %esp,%ebp
c00042c5:	53                   	push   %ebx
c00042c6:	83 ec 24             	sub    $0x24,%esp
c00042c9:	89 e0                	mov    %esp,%eax
c00042cb:	89 c3                	mov    %eax,%ebx
c00042cd:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c00042d1:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c00042d5:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c00042d9:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c00042dd:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00042e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00042e4:	c1 e0 04             	shl    $0x4,%eax
c00042e7:	83 c8 e0             	or     $0xffffffe0,%eax
c00042ea:	88 45 ea             	mov    %al,-0x16(%ebp)
c00042ed:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c00042f1:	83 ec 0c             	sub    $0xc,%esp
c00042f4:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c00042f7:	50                   	push   %eax
c00042f8:	e8 c3 fe ff ff       	call   c00041c0 <hd_cmd_out>
c00042fd:	83 c4 10             	add    $0x10,%esp
c0004300:	e8 40 06 00 00       	call   c0004945 <interrupt_wait>
c0004305:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c000430c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000430f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004312:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004315:	89 c2                	mov    %eax,%edx
c0004317:	b8 10 00 00 00       	mov    $0x10,%eax
c000431c:	83 e8 01             	sub    $0x1,%eax
c000431f:	01 d0                	add    %edx,%eax
c0004321:	b9 10 00 00 00       	mov    $0x10,%ecx
c0004326:	ba 00 00 00 00       	mov    $0x0,%edx
c000432b:	f7 f1                	div    %ecx
c000432d:	6b c0 10             	imul   $0x10,%eax,%eax
c0004330:	29 c4                	sub    %eax,%esp
c0004332:	89 e0                	mov    %esp,%eax
c0004334:	83 c0 00             	add    $0x0,%eax
c0004337:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000433a:	83 ec 04             	sub    $0x4,%esp
c000433d:	ff 75 f4             	pushl  -0xc(%ebp)
c0004340:	6a 00                	push   $0x0
c0004342:	ff 75 ec             	pushl  -0x14(%ebp)
c0004345:	e8 45 5c 00 00       	call   c0009f8f <Memset>
c000434a:	83 c4 10             	add    $0x10,%esp
c000434d:	83 ec 04             	sub    $0x4,%esp
c0004350:	ff 75 f4             	pushl  -0xc(%ebp)
c0004353:	ff 75 ec             	pushl  -0x14(%ebp)
c0004356:	68 f0 01 00 00       	push   $0x1f0
c000435b:	e8 83 5c 00 00       	call   c0009fe3 <read_port>
c0004360:	83 c4 10             	add    $0x10,%esp
c0004363:	83 ec 0c             	sub    $0xc,%esp
c0004366:	ff 75 ec             	pushl  -0x14(%ebp)
c0004369:	e8 0b 00 00 00       	call   c0004379 <print_hdinfo>
c000436e:	83 c4 10             	add    $0x10,%esp
c0004371:	89 dc                	mov    %ebx,%esp
c0004373:	90                   	nop
c0004374:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004377:	c9                   	leave  
c0004378:	c3                   	ret    

c0004379 <print_hdinfo>:
c0004379:	55                   	push   %ebp
c000437a:	89 e5                	mov    %esp,%ebp
c000437c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0004382:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0004388:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c000438e:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0004395:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c000439c:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c00043a3:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c00043aa:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00043b1:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c00043b7:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c00043bd:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c00043c4:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c00043cb:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c00043d2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00043d9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00043e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00043e7:	e9 8f 00 00 00       	jmp    c000447b <print_hdinfo+0x102>
c00043ec:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00043f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00043f6:	89 d0                	mov    %edx,%eax
c00043f8:	01 c0                	add    %eax,%eax
c00043fa:	01 d0                	add    %edx,%eax
c00043fc:	c1 e0 03             	shl    $0x3,%eax
c00043ff:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0004402:	01 c8                	add    %ecx,%eax
c0004404:	83 e8 44             	sub    $0x44,%eax
c0004407:	0f b7 00             	movzwl (%eax),%eax
c000440a:	0f b7 c0             	movzwl %ax,%eax
c000440d:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0004410:	8b 45 08             	mov    0x8(%ebp),%eax
c0004413:	01 d0                	add    %edx,%eax
c0004415:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004418:	eb 30                	jmp    c000444a <print_hdinfo+0xd1>
c000441a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000441d:	8d 50 01             	lea    0x1(%eax),%edx
c0004420:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004423:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004426:	83 c2 01             	add    $0x1,%edx
c0004429:	0f b6 00             	movzbl (%eax),%eax
c000442c:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0004430:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004433:	8d 50 01             	lea    0x1(%eax),%edx
c0004436:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004439:	0f b6 00             	movzbl (%eax),%eax
c000443c:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c000443f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004442:	01 ca                	add    %ecx,%edx
c0004444:	88 02                	mov    %al,(%edx)
c0004446:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000444a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000444d:	89 d0                	mov    %edx,%eax
c000444f:	01 c0                	add    %eax,%eax
c0004451:	01 d0                	add    %edx,%eax
c0004453:	c1 e0 03             	shl    $0x3,%eax
c0004456:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0004459:	01 c8                	add    %ecx,%eax
c000445b:	83 e8 42             	sub    $0x42,%eax
c000445e:	0f b7 00             	movzwl (%eax),%eax
c0004461:	66 d1 e8             	shr    %ax
c0004464:	0f b7 c0             	movzwl %ax,%eax
c0004467:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000446a:	7c ae                	jl     c000441a <print_hdinfo+0xa1>
c000446c:	8d 55 81             	lea    -0x7f(%ebp),%edx
c000446f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004472:	01 d0                	add    %edx,%eax
c0004474:	c6 00 00             	movb   $0x0,(%eax)
c0004477:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000447b:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000447f:	0f 8e 67 ff ff ff    	jle    c00043ec <print_hdinfo+0x73>
c0004485:	8b 45 08             	mov    0x8(%ebp),%eax
c0004488:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c000448c:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0004490:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0004494:	66 c1 e8 08          	shr    $0x8,%ax
c0004498:	66 85 c0             	test   %ax,%ax
c000449b:	0f 95 c0             	setne  %al
c000449e:	88 45 e9             	mov    %al,-0x17(%ebp)
c00044a1:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c00044a8:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c00044ae:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c00044b2:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c00044b6:	75 15                	jne    c00044cd <print_hdinfo+0x154>
c00044b8:	83 ec 08             	sub    $0x8,%esp
c00044bb:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00044be:	50                   	push   %eax
c00044bf:	8d 45 b0             	lea    -0x50(%ebp),%eax
c00044c2:	50                   	push   %eax
c00044c3:	e8 e6 5a 00 00       	call   c0009fae <Strcpy>
c00044c8:	83 c4 10             	add    $0x10,%esp
c00044cb:	eb 13                	jmp    c00044e0 <print_hdinfo+0x167>
c00044cd:	83 ec 08             	sub    $0x8,%esp
c00044d0:	8d 45 a9             	lea    -0x57(%ebp),%eax
c00044d3:	50                   	push   %eax
c00044d4:	8d 45 b0             	lea    -0x50(%ebp),%eax
c00044d7:	50                   	push   %eax
c00044d8:	e8 d1 5a 00 00       	call   c0009fae <Strcpy>
c00044dd:	83 c4 10             	add    $0x10,%esp
c00044e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00044e3:	83 c0 7a             	add    $0x7a,%eax
c00044e6:	0f b7 00             	movzwl (%eax),%eax
c00044e9:	0f b7 d0             	movzwl %ax,%edx
c00044ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00044ef:	83 c0 78             	add    $0x78,%eax
c00044f2:	0f b7 00             	movzwl (%eax),%eax
c00044f5:	0f b7 c0             	movzwl %ax,%eax
c00044f8:	83 c0 10             	add    $0x10,%eax
c00044fb:	89 c1                	mov    %eax,%ecx
c00044fd:	d3 e2                	shl    %cl,%edx
c00044ff:	89 d0                	mov    %edx,%eax
c0004501:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004504:	90                   	nop
c0004505:	c9                   	leave  
c0004506:	c3                   	ret    

c0004507 <print_dpt_entry>:
c0004507:	55                   	push   %ebp
c0004508:	89 e5                	mov    %esp,%ebp
c000450a:	83 ec 08             	sub    $0x8,%esp
c000450d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004510:	8b 40 08             	mov    0x8(%eax),%eax
c0004513:	83 ec 08             	sub    $0x8,%esp
c0004516:	50                   	push   %eax
c0004517:	68 39 9c 00 c0       	push   $0xc0009c39
c000451c:	e8 95 ec ff ff       	call   c00031b6 <Printf>
c0004521:	83 c4 10             	add    $0x10,%esp
c0004524:	8b 45 08             	mov    0x8(%ebp),%eax
c0004527:	8b 40 0c             	mov    0xc(%eax),%eax
c000452a:	83 ec 08             	sub    $0x8,%esp
c000452d:	50                   	push   %eax
c000452e:	68 41 9c 00 c0       	push   $0xc0009c41
c0004533:	e8 7e ec ff ff       	call   c00031b6 <Printf>
c0004538:	83 c4 10             	add    $0x10,%esp
c000453b:	8b 45 08             	mov    0x8(%ebp),%eax
c000453e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0004542:	0f b6 c0             	movzbl %al,%eax
c0004545:	83 ec 08             	sub    $0x8,%esp
c0004548:	50                   	push   %eax
c0004549:	68 52 9c 00 c0       	push   $0xc0009c52
c000454e:	e8 63 ec ff ff       	call   c00031b6 <Printf>
c0004553:	83 c4 10             	add    $0x10,%esp
c0004556:	8b 45 08             	mov    0x8(%ebp),%eax
c0004559:	0f b6 00             	movzbl (%eax),%eax
c000455c:	0f b6 c0             	movzbl %al,%eax
c000455f:	83 ec 08             	sub    $0x8,%esp
c0004562:	50                   	push   %eax
c0004563:	68 60 9c 00 c0       	push   $0xc0009c60
c0004568:	e8 49 ec ff ff       	call   c00031b6 <Printf>
c000456d:	83 c4 10             	add    $0x10,%esp
c0004570:	90                   	nop
c0004571:	c9                   	leave  
c0004572:	c3                   	ret    

c0004573 <get_partition_table>:
c0004573:	55                   	push   %ebp
c0004574:	89 e5                	mov    %esp,%ebp
c0004576:	53                   	push   %ebx
c0004577:	83 ec 24             	sub    $0x24,%esp
c000457a:	89 e0                	mov    %esp,%eax
c000457c:	89 c3                	mov    %eax,%ebx
c000457e:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0004582:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0004586:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004589:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000458c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000458f:	c1 f8 08             	sar    $0x8,%eax
c0004592:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004595:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004598:	c1 f8 10             	sar    $0x10,%eax
c000459b:	88 45 e5             	mov    %al,-0x1b(%ebp)
c000459e:	8b 45 0c             	mov    0xc(%ebp),%eax
c00045a1:	c1 f8 18             	sar    $0x18,%eax
c00045a4:	89 c2                	mov    %eax,%edx
c00045a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00045a9:	c1 e0 04             	shl    $0x4,%eax
c00045ac:	09 d0                	or     %edx,%eax
c00045ae:	83 c8 e0             	or     $0xffffffe0,%eax
c00045b1:	88 45 e6             	mov    %al,-0x1a(%ebp)
c00045b4:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c00045b8:	83 ec 0c             	sub    $0xc,%esp
c00045bb:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c00045be:	50                   	push   %eax
c00045bf:	e8 fc fb ff ff       	call   c00041c0 <hd_cmd_out>
c00045c4:	83 c4 10             	add    $0x10,%esp
c00045c7:	e8 79 03 00 00       	call   c0004945 <interrupt_wait>
c00045cc:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c00045d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00045d6:	8d 50 ff             	lea    -0x1(%eax),%edx
c00045d9:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00045dc:	89 c2                	mov    %eax,%edx
c00045de:	b8 10 00 00 00       	mov    $0x10,%eax
c00045e3:	83 e8 01             	sub    $0x1,%eax
c00045e6:	01 d0                	add    %edx,%eax
c00045e8:	b9 10 00 00 00       	mov    $0x10,%ecx
c00045ed:	ba 00 00 00 00       	mov    $0x0,%edx
c00045f2:	f7 f1                	div    %ecx
c00045f4:	6b c0 10             	imul   $0x10,%eax,%eax
c00045f7:	29 c4                	sub    %eax,%esp
c00045f9:	89 e0                	mov    %esp,%eax
c00045fb:	83 c0 00             	add    $0x0,%eax
c00045fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004601:	83 ec 04             	sub    $0x4,%esp
c0004604:	ff 75 f4             	pushl  -0xc(%ebp)
c0004607:	6a 00                	push   $0x0
c0004609:	ff 75 ec             	pushl  -0x14(%ebp)
c000460c:	e8 7e 59 00 00       	call   c0009f8f <Memset>
c0004611:	83 c4 10             	add    $0x10,%esp
c0004614:	83 ec 04             	sub    $0x4,%esp
c0004617:	ff 75 f4             	pushl  -0xc(%ebp)
c000461a:	ff 75 ec             	pushl  -0x14(%ebp)
c000461d:	68 f0 01 00 00       	push   $0x1f0
c0004622:	e8 bc 59 00 00       	call   c0009fe3 <read_port>
c0004627:	83 c4 10             	add    $0x10,%esp
c000462a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000462d:	05 be 01 00 00       	add    $0x1be,%eax
c0004632:	83 ec 04             	sub    $0x4,%esp
c0004635:	6a 40                	push   $0x40
c0004637:	50                   	push   %eax
c0004638:	ff 75 10             	pushl  0x10(%ebp)
c000463b:	e8 21 59 00 00       	call   c0009f61 <Memcpy>
c0004640:	83 c4 10             	add    $0x10,%esp
c0004643:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c000464a:	89 dc                	mov    %ebx,%esp
c000464c:	90                   	nop
c000464d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004650:	c9                   	leave  
c0004651:	c3                   	ret    

c0004652 <partition>:
c0004652:	55                   	push   %ebp
c0004653:	89 e5                	mov    %esp,%ebp
c0004655:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000465b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000465e:	88 45 84             	mov    %al,-0x7c(%ebp)
c0004661:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0004665:	7f 19                	jg     c0004680 <partition+0x2e>
c0004667:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000466a:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000466f:	89 c8                	mov    %ecx,%eax
c0004671:	f7 ea                	imul   %edx
c0004673:	d1 fa                	sar    %edx
c0004675:	89 c8                	mov    %ecx,%eax
c0004677:	c1 f8 1f             	sar    $0x1f,%eax
c000467a:	29 c2                	sub    %eax,%edx
c000467c:	89 d0                	mov    %edx,%eax
c000467e:	eb 11                	jmp    c0004691 <partition+0x3f>
c0004680:	8b 45 08             	mov    0x8(%ebp),%eax
c0004683:	83 e8 10             	sub    $0x10,%eax
c0004686:	8d 50 3f             	lea    0x3f(%eax),%edx
c0004689:	85 c0                	test   %eax,%eax
c000468b:	0f 48 c2             	cmovs  %edx,%eax
c000468e:	c1 f8 06             	sar    $0x6,%eax
c0004691:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004694:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0004698:	0f 85 cc 00 00 00    	jne    c000476a <partition+0x118>
c000469e:	83 ec 04             	sub    $0x4,%esp
c00046a1:	6a 40                	push   $0x40
c00046a3:	6a 00                	push   $0x0
c00046a5:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00046a8:	50                   	push   %eax
c00046a9:	e8 e1 58 00 00       	call   c0009f8f <Memset>
c00046ae:	83 c4 10             	add    $0x10,%esp
c00046b1:	83 ec 04             	sub    $0x4,%esp
c00046b4:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00046b7:	50                   	push   %eax
c00046b8:	6a 00                	push   $0x0
c00046ba:	ff 75 e8             	pushl  -0x18(%ebp)
c00046bd:	e8 b1 fe ff ff       	call   c0004573 <get_partition_table>
c00046c2:	83 c4 10             	add    $0x10,%esp
c00046c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00046cc:	e9 8a 00 00 00       	jmp    c000475b <partition+0x109>
c00046d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00046d4:	83 c0 01             	add    $0x1,%eax
c00046d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00046da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00046dd:	c1 e0 04             	shl    $0x4,%eax
c00046e0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00046e3:	01 c8                	add    %ecx,%eax
c00046e5:	83 e8 5c             	sub    $0x5c,%eax
c00046e8:	8b 00                	mov    (%eax),%eax
c00046ea:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00046ed:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00046f0:	c1 e1 03             	shl    $0x3,%ecx
c00046f3:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00046f9:	01 ca                	add    %ecx,%edx
c00046fb:	81 c2 24 1f 01 c0    	add    $0xc0011f24,%edx
c0004701:	89 02                	mov    %eax,(%edx)
c0004703:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004706:	c1 e0 04             	shl    $0x4,%eax
c0004709:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000470c:	01 c8                	add    %ecx,%eax
c000470e:	83 e8 58             	sub    $0x58,%eax
c0004711:	8b 00                	mov    (%eax),%eax
c0004713:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0004716:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004719:	c1 e1 03             	shl    $0x3,%ecx
c000471c:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0004722:	01 ca                	add    %ecx,%edx
c0004724:	81 c2 28 1f 01 c0    	add    $0xc0011f28,%edx
c000472a:	89 02                	mov    %eax,(%edx)
c000472c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000472f:	c1 e0 04             	shl    $0x4,%eax
c0004732:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0004735:	01 c8                	add    %ecx,%eax
c0004737:	83 e8 60             	sub    $0x60,%eax
c000473a:	0f b6 00             	movzbl (%eax),%eax
c000473d:	3c 05                	cmp    $0x5,%al
c000473f:	75 16                	jne    c0004757 <partition+0x105>
c0004741:	8b 55 08             	mov    0x8(%ebp),%edx
c0004744:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004747:	01 d0                	add    %edx,%eax
c0004749:	83 ec 08             	sub    $0x8,%esp
c000474c:	6a 01                	push   $0x1
c000474e:	50                   	push   %eax
c000474f:	e8 fe fe ff ff       	call   c0004652 <partition>
c0004754:	83 c4 10             	add    $0x10,%esp
c0004757:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000475b:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000475f:	0f 8e 6c ff ff ff    	jle    c00046d1 <partition+0x7f>
c0004765:	e9 ff 00 00 00       	jmp    c0004869 <partition+0x217>
c000476a:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c000476e:	0f 85 f5 00 00 00    	jne    c0004869 <partition+0x217>
c0004774:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0004777:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000477c:	89 c8                	mov    %ecx,%eax
c000477e:	f7 ea                	imul   %edx
c0004780:	d1 fa                	sar    %edx
c0004782:	89 c8                	mov    %ecx,%eax
c0004784:	c1 f8 1f             	sar    $0x1f,%eax
c0004787:	29 c2                	sub    %eax,%edx
c0004789:	89 d0                	mov    %edx,%eax
c000478b:	c1 e0 02             	shl    $0x2,%eax
c000478e:	01 d0                	add    %edx,%eax
c0004790:	29 c1                	sub    %eax,%ecx
c0004792:	89 c8                	mov    %ecx,%eax
c0004794:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004797:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000479a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000479d:	c1 e2 03             	shl    $0x3,%edx
c00047a0:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00047a6:	01 d0                	add    %edx,%eax
c00047a8:	05 24 1f 01 c0       	add    $0xc0011f24,%eax
c00047ad:	8b 00                	mov    (%eax),%eax
c00047af:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00047b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00047b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00047b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00047bb:	83 e8 01             	sub    $0x1,%eax
c00047be:	c1 e0 04             	shl    $0x4,%eax
c00047c1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00047c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00047cb:	e9 8c 00 00 00       	jmp    c000485c <partition+0x20a>
c00047d0:	83 ec 04             	sub    $0x4,%esp
c00047d3:	6a 40                	push   $0x40
c00047d5:	6a 00                	push   $0x0
c00047d7:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00047da:	50                   	push   %eax
c00047db:	e8 af 57 00 00       	call   c0009f8f <Memset>
c00047e0:	83 c4 10             	add    $0x10,%esp
c00047e3:	83 ec 04             	sub    $0x4,%esp
c00047e6:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00047e9:	50                   	push   %eax
c00047ea:	ff 75 f0             	pushl  -0x10(%ebp)
c00047ed:	ff 75 e8             	pushl  -0x18(%ebp)
c00047f0:	e8 7e fd ff ff       	call   c0004573 <get_partition_table>
c00047f5:	83 c4 10             	add    $0x10,%esp
c00047f8:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00047fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00047fe:	01 d0                	add    %edx,%eax
c0004800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004803:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004806:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004809:	01 c2                	add    %eax,%edx
c000480b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000480e:	8d 48 04             	lea    0x4(%eax),%ecx
c0004811:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004814:	c1 e1 03             	shl    $0x3,%ecx
c0004817:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000481d:	01 c8                	add    %ecx,%eax
c000481f:	05 24 1f 01 c0       	add    $0xc0011f24,%eax
c0004824:	89 10                	mov    %edx,(%eax)
c0004826:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004829:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c000482c:	8d 4a 04             	lea    0x4(%edx),%ecx
c000482f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004832:	c1 e1 03             	shl    $0x3,%ecx
c0004835:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000483b:	01 ca                	add    %ecx,%edx
c000483d:	81 c2 28 1f 01 c0    	add    $0xc0011f28,%edx
c0004843:	89 02                	mov    %eax,(%edx)
c0004845:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0004849:	84 c0                	test   %al,%al
c000484b:	74 1b                	je     c0004868 <partition+0x216>
c000484d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0004850:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004853:	01 d0                	add    %edx,%eax
c0004855:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004858:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000485c:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0004860:	0f 8e 6a ff ff ff    	jle    c00047d0 <partition+0x17e>
c0004866:	eb 01                	jmp    c0004869 <partition+0x217>
c0004868:	90                   	nop
c0004869:	90                   	nop
c000486a:	c9                   	leave  
c000486b:	c3                   	ret    

c000486c <hd_open>:
c000486c:	55                   	push   %ebp
c000486d:	89 e5                	mov    %esp,%ebp
c000486f:	83 ec 18             	sub    $0x18,%esp
c0004872:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004879:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000487c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004882:	05 20 1f 01 c0       	add    $0xc0011f20,%eax
c0004887:	8b 00                	mov    (%eax),%eax
c0004889:	8d 50 01             	lea    0x1(%eax),%edx
c000488c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000488f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004895:	05 20 1f 01 c0       	add    $0xc0011f20,%eax
c000489a:	89 10                	mov    %edx,(%eax)
c000489c:	83 ec 0c             	sub    $0xc,%esp
c000489f:	6a 00                	push   $0x0
c00048a1:	e8 1c fa ff ff       	call   c00042c2 <hd_identify>
c00048a6:	83 c4 10             	add    $0x10,%esp
c00048a9:	83 ec 08             	sub    $0x8,%esp
c00048ac:	6a 00                	push   $0x0
c00048ae:	6a 00                	push   $0x0
c00048b0:	e8 9d fd ff ff       	call   c0004652 <partition>
c00048b5:	83 c4 10             	add    $0x10,%esp
c00048b8:	90                   	nop
c00048b9:	c9                   	leave  
c00048ba:	c3                   	ret    

c00048bb <get_hd_ioctl>:
c00048bb:	55                   	push   %ebp
c00048bc:	89 e5                	mov    %esp,%ebp
c00048be:	83 ec 10             	sub    $0x10,%esp
c00048c1:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00048c5:	7f 19                	jg     c00048e0 <get_hd_ioctl+0x25>
c00048c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00048ca:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00048cf:	89 c8                	mov    %ecx,%eax
c00048d1:	f7 ea                	imul   %edx
c00048d3:	d1 fa                	sar    %edx
c00048d5:	89 c8                	mov    %ecx,%eax
c00048d7:	c1 f8 1f             	sar    $0x1f,%eax
c00048da:	29 c2                	sub    %eax,%edx
c00048dc:	89 d0                	mov    %edx,%eax
c00048de:	eb 11                	jmp    c00048f1 <get_hd_ioctl+0x36>
c00048e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00048e3:	83 e8 10             	sub    $0x10,%eax
c00048e6:	8d 50 3f             	lea    0x3f(%eax),%edx
c00048e9:	85 c0                	test   %eax,%eax
c00048eb:	0f 48 c2             	cmovs  %edx,%eax
c00048ee:	c1 f8 06             	sar    $0x6,%eax
c00048f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00048f4:	8b 55 08             	mov    0x8(%ebp),%edx
c00048f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00048fa:	c1 e2 03             	shl    $0x3,%edx
c00048fd:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004903:	01 d0                	add    %edx,%eax
c0004905:	05 28 1f 01 c0       	add    $0xc0011f28,%eax
c000490a:	8b 00                	mov    (%eax),%eax
c000490c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000490f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004912:	c9                   	leave  
c0004913:	c3                   	ret    

c0004914 <wait_for>:
c0004914:	55                   	push   %ebp
c0004915:	89 e5                	mov    %esp,%ebp
c0004917:	83 ec 08             	sub    $0x8,%esp
c000491a:	83 ec 04             	sub    $0x4,%esp
c000491d:	68 40 42 0f 00       	push   $0xf4240
c0004922:	6a 08                	push   $0x8
c0004924:	6a 08                	push   $0x8
c0004926:	e8 97 02 00 00       	call   c0004bc2 <waitfor>
c000492b:	83 c4 10             	add    $0x10,%esp
c000492e:	85 c0                	test   %eax,%eax
c0004930:	75 10                	jne    c0004942 <wait_for+0x2e>
c0004932:	83 ec 0c             	sub    $0xc,%esp
c0004935:	68 6b 9c 00 c0       	push   $0xc0009c6b
c000493a:	e8 a8 eb ff ff       	call   c00034e7 <panic>
c000493f:	83 c4 10             	add    $0x10,%esp
c0004942:	90                   	nop
c0004943:	c9                   	leave  
c0004944:	c3                   	ret    

c0004945 <interrupt_wait>:
c0004945:	55                   	push   %ebp
c0004946:	89 e5                	mov    %esp,%ebp
c0004948:	83 ec 78             	sub    $0x78,%esp
c000494b:	83 ec 04             	sub    $0x4,%esp
c000494e:	68 13 02 00 00       	push   $0x213
c0004953:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0004956:	50                   	push   %eax
c0004957:	6a 02                	push   $0x2
c0004959:	e8 13 f4 ff ff       	call   c0003d71 <send_rec>
c000495e:	83 c4 10             	add    $0x10,%esp
c0004961:	90                   	nop
c0004962:	c9                   	leave  
c0004963:	c3                   	ret    

c0004964 <hd_rdwt>:
c0004964:	55                   	push   %ebp
c0004965:	89 e5                	mov    %esp,%ebp
c0004967:	83 ec 48             	sub    $0x48,%esp
c000496a:	8b 45 08             	mov    0x8(%ebp),%eax
c000496d:	8b 40 18             	mov    0x18(%eax),%eax
c0004970:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004973:	8b 45 08             	mov    0x8(%ebp),%eax
c0004976:	8b 40 14             	mov    0x14(%eax),%eax
c0004979:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000497c:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0004980:	7f 19                	jg     c000499b <hd_rdwt+0x37>
c0004982:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0004985:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000498a:	89 c8                	mov    %ecx,%eax
c000498c:	f7 ea                	imul   %edx
c000498e:	d1 fa                	sar    %edx
c0004990:	89 c8                	mov    %ecx,%eax
c0004992:	c1 f8 1f             	sar    $0x1f,%eax
c0004995:	29 c2                	sub    %eax,%edx
c0004997:	89 d0                	mov    %edx,%eax
c0004999:	eb 11                	jmp    c00049ac <hd_rdwt+0x48>
c000499b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000499e:	83 e8 10             	sub    $0x10,%eax
c00049a1:	8d 50 3f             	lea    0x3f(%eax),%edx
c00049a4:	85 c0                	test   %eax,%eax
c00049a6:	0f 48 c2             	cmovs  %edx,%eax
c00049a9:	c1 f8 06             	sar    $0x6,%eax
c00049ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00049af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00049b2:	8d 50 f0             	lea    -0x10(%eax),%edx
c00049b5:	89 d0                	mov    %edx,%eax
c00049b7:	c1 f8 1f             	sar    $0x1f,%eax
c00049ba:	c1 e8 1a             	shr    $0x1a,%eax
c00049bd:	01 c2                	add    %eax,%edx
c00049bf:	83 e2 3f             	and    $0x3f,%edx
c00049c2:	29 c2                	sub    %eax,%edx
c00049c4:	89 d0                	mov    %edx,%eax
c00049c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00049c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00049cc:	c1 e8 09             	shr    $0x9,%eax
c00049cf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00049d2:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c00049d6:	7f 1a                	jg     c00049f2 <hd_rdwt+0x8e>
c00049d8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00049db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00049de:	c1 e2 03             	shl    $0x3,%edx
c00049e1:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00049e7:	01 d0                	add    %edx,%eax
c00049e9:	05 24 1f 01 c0       	add    $0xc0011f24,%eax
c00049ee:	8b 00                	mov    (%eax),%eax
c00049f0:	eb 1b                	jmp    c0004a0d <hd_rdwt+0xa9>
c00049f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00049f5:	8d 50 04             	lea    0x4(%eax),%edx
c00049f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00049fb:	c1 e2 03             	shl    $0x3,%edx
c00049fe:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004a04:	01 d0                	add    %edx,%eax
c0004a06:	05 24 1f 01 c0       	add    $0xc0011f24,%eax
c0004a0b:	8b 00                	mov    (%eax),%eax
c0004a0d:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0004a10:	01 d0                	add    %edx,%eax
c0004a12:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004a15:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a18:	8b 40 0c             	mov    0xc(%eax),%eax
c0004a1b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004a1e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004a21:	05 ff 01 00 00       	add    $0x1ff,%eax
c0004a26:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0004a2c:	85 c0                	test   %eax,%eax
c0004a2e:	0f 48 c2             	cmovs  %edx,%eax
c0004a31:	c1 f8 09             	sar    $0x9,%eax
c0004a34:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004a37:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004a3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a40:	8b 40 10             	mov    0x10(%eax),%eax
c0004a43:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004a46:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a49:	8b 00                	mov    (%eax),%eax
c0004a4b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004a4e:	83 ec 08             	sub    $0x8,%esp
c0004a51:	ff 75 d0             	pushl  -0x30(%ebp)
c0004a54:	ff 75 cc             	pushl  -0x34(%ebp)
c0004a57:	e8 27 25 00 00       	call   c0006f83 <v2l>
c0004a5c:	83 c4 10             	add    $0x10,%esp
c0004a5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a62:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a65:	8b 40 68             	mov    0x68(%eax),%eax
c0004a68:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004a6b:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0004a6f:	74 22                	je     c0004a93 <hd_rdwt+0x12f>
c0004a71:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0004a75:	74 1c                	je     c0004a93 <hd_rdwt+0x12f>
c0004a77:	68 9f 01 00 00       	push   $0x19f
c0004a7c:	68 7d 9c 00 c0       	push   $0xc0009c7d
c0004a81:	68 7d 9c 00 c0       	push   $0xc0009c7d
c0004a86:	68 85 9c 00 c0       	push   $0xc0009c85
c0004a8b:	e8 75 ea ff ff       	call   c0003505 <assertion_failure>
c0004a90:	83 c4 10             	add    $0x10,%esp
c0004a93:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0004a97:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004a9a:	88 45 be             	mov    %al,-0x42(%ebp)
c0004a9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004aa0:	88 45 bf             	mov    %al,-0x41(%ebp)
c0004aa3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004aa6:	c1 f8 08             	sar    $0x8,%eax
c0004aa9:	88 45 c0             	mov    %al,-0x40(%ebp)
c0004aac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004aaf:	c1 f8 10             	sar    $0x10,%eax
c0004ab2:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0004ab5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004ab8:	c1 f8 18             	sar    $0x18,%eax
c0004abb:	83 e0 0f             	and    $0xf,%eax
c0004abe:	83 c8 e0             	or     $0xffffffe0,%eax
c0004ac1:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0004ac4:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0004ac8:	75 07                	jne    c0004ad1 <hd_rdwt+0x16d>
c0004aca:	b8 20 00 00 00       	mov    $0x20,%eax
c0004acf:	eb 05                	jmp    c0004ad6 <hd_rdwt+0x172>
c0004ad1:	b8 30 00 00 00       	mov    $0x30,%eax
c0004ad6:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0004ad9:	83 ec 0c             	sub    $0xc,%esp
c0004adc:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0004adf:	50                   	push   %eax
c0004ae0:	e8 db f6 ff ff       	call   c00041c0 <hd_cmd_out>
c0004ae5:	83 c4 10             	add    $0x10,%esp
c0004ae8:	e9 9c 00 00 00       	jmp    c0004b89 <hd_rdwt+0x225>
c0004aed:	b8 00 02 00 00       	mov    $0x200,%eax
c0004af2:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0004af9:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c0004afd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004b00:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0004b04:	75 51                	jne    c0004b57 <hd_rdwt+0x1f3>
c0004b06:	e8 09 fe ff ff       	call   c0004914 <wait_for>
c0004b0b:	e8 35 fe ff ff       	call   c0004945 <interrupt_wait>
c0004b10:	83 ec 04             	sub    $0x4,%esp
c0004b13:	ff 75 c4             	pushl  -0x3c(%ebp)
c0004b16:	6a 00                	push   $0x0
c0004b18:	68 60 21 01 c0       	push   $0xc0012160
c0004b1d:	e8 6d 54 00 00       	call   c0009f8f <Memset>
c0004b22:	83 c4 10             	add    $0x10,%esp
c0004b25:	83 ec 04             	sub    $0x4,%esp
c0004b28:	68 00 02 00 00       	push   $0x200
c0004b2d:	68 60 21 01 c0       	push   $0xc0012160
c0004b32:	68 f0 01 00 00       	push   $0x1f0
c0004b37:	e8 a7 54 00 00       	call   c0009fe3 <read_port>
c0004b3c:	83 c4 10             	add    $0x10,%esp
c0004b3f:	83 ec 04             	sub    $0x4,%esp
c0004b42:	ff 75 c4             	pushl  -0x3c(%ebp)
c0004b45:	68 60 21 01 c0       	push   $0xc0012160
c0004b4a:	ff 75 f0             	pushl  -0x10(%ebp)
c0004b4d:	e8 0f 54 00 00       	call   c0009f61 <Memcpy>
c0004b52:	83 c4 10             	add    $0x10,%esp
c0004b55:	eb 26                	jmp    c0004b7d <hd_rdwt+0x219>
c0004b57:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0004b5b:	75 20                	jne    c0004b7d <hd_rdwt+0x219>
c0004b5d:	e8 b2 fd ff ff       	call   c0004914 <wait_for>
c0004b62:	83 ec 04             	sub    $0x4,%esp
c0004b65:	ff 75 c4             	pushl  -0x3c(%ebp)
c0004b68:	ff 75 f0             	pushl  -0x10(%ebp)
c0004b6b:	68 f0 01 00 00       	push   $0x1f0
c0004b70:	e8 82 54 00 00       	call   c0009ff7 <write_port>
c0004b75:	83 c4 10             	add    $0x10,%esp
c0004b78:	e8 c8 fd ff ff       	call   c0004945 <interrupt_wait>
c0004b7d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004b80:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0004b83:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004b86:	01 45 f0             	add    %eax,-0x10(%ebp)
c0004b89:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0004b8d:	0f 85 5a ff ff ff    	jne    c0004aed <hd_rdwt+0x189>
c0004b93:	90                   	nop
c0004b94:	c9                   	leave  
c0004b95:	c3                   	ret    

c0004b96 <hd_handler>:
c0004b96:	55                   	push   %ebp
c0004b97:	89 e5                	mov    %esp,%ebp
c0004b99:	83 ec 18             	sub    $0x18,%esp
c0004b9c:	83 ec 0c             	sub    $0xc,%esp
c0004b9f:	68 f7 01 00 00       	push   $0x1f7
c0004ba4:	e8 2a cc ff ff       	call   c00017d3 <in_byte>
c0004ba9:	83 c4 10             	add    $0x10,%esp
c0004bac:	0f b6 c0             	movzbl %al,%eax
c0004baf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004bb2:	83 ec 0c             	sub    $0xc,%esp
c0004bb5:	6a 02                	push   $0x2
c0004bb7:	e8 eb f3 ff ff       	call   c0003fa7 <inform_int>
c0004bbc:	83 c4 10             	add    $0x10,%esp
c0004bbf:	90                   	nop
c0004bc0:	c9                   	leave  
c0004bc1:	c3                   	ret    

c0004bc2 <waitfor>:
c0004bc2:	55                   	push   %ebp
c0004bc3:	89 e5                	mov    %esp,%ebp
c0004bc5:	83 ec 18             	sub    $0x18,%esp
c0004bc8:	e8 d3 f2 ff ff       	call   c0003ea0 <get_ticks_ipc>
c0004bcd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004bd0:	eb 22                	jmp    c0004bf4 <waitfor+0x32>
c0004bd2:	83 ec 0c             	sub    $0xc,%esp
c0004bd5:	68 f7 01 00 00       	push   $0x1f7
c0004bda:	e8 f4 cb ff ff       	call   c00017d3 <in_byte>
c0004bdf:	83 c4 10             	add    $0x10,%esp
c0004be2:	0f b6 c0             	movzbl %al,%eax
c0004be5:	23 45 08             	and    0x8(%ebp),%eax
c0004be8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0004beb:	75 07                	jne    c0004bf4 <waitfor+0x32>
c0004bed:	b8 01 00 00 00       	mov    $0x1,%eax
c0004bf2:	eb 1d                	jmp    c0004c11 <waitfor+0x4f>
c0004bf4:	e8 a7 f2 ff ff       	call   c0003ea0 <get_ticks_ipc>
c0004bf9:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0004bfc:	89 c2                	mov    %eax,%edx
c0004bfe:	89 d0                	mov    %edx,%eax
c0004c00:	c1 e0 02             	shl    $0x2,%eax
c0004c03:	01 d0                	add    %edx,%eax
c0004c05:	01 c0                	add    %eax,%eax
c0004c07:	39 45 10             	cmp    %eax,0x10(%ebp)
c0004c0a:	7f c6                	jg     c0004bd2 <waitfor+0x10>
c0004c0c:	b8 00 00 00 00       	mov    $0x0,%eax
c0004c11:	c9                   	leave  
c0004c12:	c3                   	ret    

c0004c13 <print_hd_info>:
c0004c13:	55                   	push   %ebp
c0004c14:	89 e5                	mov    %esp,%ebp
c0004c16:	83 ec 18             	sub    $0x18,%esp
c0004c19:	83 ec 0c             	sub    $0xc,%esp
c0004c1c:	68 a3 9c 00 c0       	push   $0xc0009ca3
c0004c21:	e8 90 e5 ff ff       	call   c00031b6 <Printf>
c0004c26:	83 c4 10             	add    $0x10,%esp
c0004c29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004c30:	eb 3b                	jmp    c0004c6d <print_hd_info+0x5a>
c0004c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c35:	8b 04 c5 28 1f 01 c0 	mov    -0x3ffee0d8(,%eax,8),%eax
c0004c3c:	85 c0                	test   %eax,%eax
c0004c3e:	74 28                	je     c0004c68 <print_hd_info+0x55>
c0004c40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c43:	8b 14 c5 28 1f 01 c0 	mov    -0x3ffee0d8(,%eax,8),%edx
c0004c4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c4d:	8b 04 c5 24 1f 01 c0 	mov    -0x3ffee0dc(,%eax,8),%eax
c0004c54:	ff 75 f4             	pushl  -0xc(%ebp)
c0004c57:	52                   	push   %edx
c0004c58:	50                   	push   %eax
c0004c59:	68 c0 9c 00 c0       	push   $0xc0009cc0
c0004c5e:	e8 53 e5 ff ff       	call   c00031b6 <Printf>
c0004c63:	83 c4 10             	add    $0x10,%esp
c0004c66:	eb 01                	jmp    c0004c69 <print_hd_info+0x56>
c0004c68:	90                   	nop
c0004c69:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004c6d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0004c71:	7e bf                	jle    c0004c32 <print_hd_info+0x1f>
c0004c73:	83 ec 0c             	sub    $0xc,%esp
c0004c76:	68 d8 9c 00 c0       	push   $0xc0009cd8
c0004c7b:	e8 36 e5 ff ff       	call   c00031b6 <Printf>
c0004c80:	83 c4 10             	add    $0x10,%esp
c0004c83:	83 ec 0c             	sub    $0xc,%esp
c0004c86:	68 f3 9c 00 c0       	push   $0xc0009cf3
c0004c8b:	e8 26 e5 ff ff       	call   c00031b6 <Printf>
c0004c90:	83 c4 10             	add    $0x10,%esp
c0004c93:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0004c9a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004ca1:	eb 44                	jmp    c0004ce7 <print_hd_info+0xd4>
c0004ca3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004ca6:	83 c0 04             	add    $0x4,%eax
c0004ca9:	8b 04 c5 28 1f 01 c0 	mov    -0x3ffee0d8(,%eax,8),%eax
c0004cb0:	85 c0                	test   %eax,%eax
c0004cb2:	74 2e                	je     c0004ce2 <print_hd_info+0xcf>
c0004cb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004cb7:	83 c0 04             	add    $0x4,%eax
c0004cba:	8b 14 c5 28 1f 01 c0 	mov    -0x3ffee0d8(,%eax,8),%edx
c0004cc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004cc4:	83 c0 04             	add    $0x4,%eax
c0004cc7:	8b 04 c5 24 1f 01 c0 	mov    -0x3ffee0dc(,%eax,8),%eax
c0004cce:	ff 75 f0             	pushl  -0x10(%ebp)
c0004cd1:	52                   	push   %edx
c0004cd2:	50                   	push   %eax
c0004cd3:	68 c0 9c 00 c0       	push   $0xc0009cc0
c0004cd8:	e8 d9 e4 ff ff       	call   c00031b6 <Printf>
c0004cdd:	83 c4 10             	add    $0x10,%esp
c0004ce0:	eb 01                	jmp    c0004ce3 <print_hd_info+0xd0>
c0004ce2:	90                   	nop
c0004ce3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004ce7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0004ceb:	7e b6                	jle    c0004ca3 <print_hd_info+0x90>
c0004ced:	83 ec 0c             	sub    $0xc,%esp
c0004cf0:	68 10 9d 00 c0       	push   $0xc0009d10
c0004cf5:	e8 bc e4 ff ff       	call   c00031b6 <Printf>
c0004cfa:	83 c4 10             	add    $0x10,%esp
c0004cfd:	90                   	nop
c0004cfe:	c9                   	leave  
c0004cff:	c3                   	ret    

c0004d00 <is_empty>:
c0004d00:	55                   	push   %ebp
c0004d01:	89 e5                	mov    %esp,%ebp
c0004d03:	83 ec 10             	sub    $0x10,%esp
c0004d06:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0004d0d:	eb 1a                	jmp    c0004d29 <is_empty+0x29>
c0004d0f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0004d12:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d15:	01 d0                	add    %edx,%eax
c0004d17:	0f b6 00             	movzbl (%eax),%eax
c0004d1a:	84 c0                	test   %al,%al
c0004d1c:	74 07                	je     c0004d25 <is_empty+0x25>
c0004d1e:	b8 00 00 00 00       	mov    $0x0,%eax
c0004d23:	eb 11                	jmp    c0004d36 <is_empty+0x36>
c0004d25:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0004d29:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d2c:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0004d2f:	7c de                	jl     c0004d0f <is_empty+0xf>
c0004d31:	b8 01 00 00 00       	mov    $0x1,%eax
c0004d36:	c9                   	leave  
c0004d37:	c3                   	ret    
c0004d38:	66 90                	xchg   %ax,%ax
c0004d3a:	66 90                	xchg   %ax,%ax
c0004d3c:	66 90                	xchg   %ax,%ax
c0004d3e:	66 90                	xchg   %ax,%ax

c0004d40 <get_ticks>:
c0004d40:	b8 00 00 00 00       	mov    $0x0,%eax
c0004d45:	cd 90                	int    $0x90
c0004d47:	c3                   	ret    

c0004d48 <write2>:
c0004d48:	b8 01 00 00 00       	mov    $0x1,%eax
c0004d4d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004d51:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004d55:	cd 90                	int    $0x90
c0004d57:	c3                   	ret    

c0004d58 <write_debug>:
c0004d58:	b8 02 00 00 00       	mov    $0x2,%eax
c0004d5d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004d61:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004d65:	cd 90                	int    $0x90
c0004d67:	c3                   	ret    

c0004d68 <send_msg2>:
c0004d68:	b8 03 00 00 00       	mov    $0x3,%eax
c0004d6d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004d71:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004d75:	cd 90                	int    $0x90
c0004d77:	c3                   	ret    

c0004d78 <send_msg>:
c0004d78:	55                   	push   %ebp
c0004d79:	89 e5                	mov    %esp,%ebp
c0004d7b:	53                   	push   %ebx
c0004d7c:	51                   	push   %ecx
c0004d7d:	b8 03 00 00 00       	mov    $0x3,%eax
c0004d82:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0004d85:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0004d88:	cd 90                	int    $0x90
c0004d8a:	59                   	pop    %ecx
c0004d8b:	5b                   	pop    %ebx
c0004d8c:	5d                   	pop    %ebp
c0004d8d:	c3                   	ret    

c0004d8e <receive_msg2>:
c0004d8e:	b8 04 00 00 00       	mov    $0x4,%eax
c0004d93:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004d97:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004d9b:	cd 90                	int    $0x90
c0004d9d:	c3                   	ret    

c0004d9e <receive_msg>:
c0004d9e:	55                   	push   %ebp
c0004d9f:	89 e5                	mov    %esp,%ebp
c0004da1:	53                   	push   %ebx
c0004da2:	51                   	push   %ecx
c0004da3:	b8 04 00 00 00       	mov    $0x4,%eax
c0004da8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0004dab:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0004dae:	cd 90                	int    $0x90
c0004db0:	59                   	pop    %ecx
c0004db1:	5b                   	pop    %ebx
c0004db2:	5d                   	pop    %ebp
c0004db3:	c3                   	ret    

c0004db4 <task_fs>:
c0004db4:	55                   	push   %ebp
c0004db5:	89 e5                	mov    %esp,%ebp
c0004db7:	81 ec 08 01 00 00    	sub    $0x108,%esp
c0004dbd:	e8 91 07 00 00       	call   c0005553 <init_fs>
c0004dc2:	83 ec 04             	sub    $0x4,%esp
c0004dc5:	6a 6c                	push   $0x6c
c0004dc7:	6a 00                	push   $0x0
c0004dc9:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0004dcf:	50                   	push   %eax
c0004dd0:	e8 ba 51 00 00       	call   c0009f8f <Memset>
c0004dd5:	83 c4 10             	add    $0x10,%esp
c0004dd8:	83 ec 04             	sub    $0x4,%esp
c0004ddb:	6a 10                	push   $0x10
c0004ddd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0004de3:	50                   	push   %eax
c0004de4:	6a 02                	push   $0x2
c0004de6:	e8 86 ef ff ff       	call   c0003d71 <send_rec>
c0004deb:	83 c4 10             	add    $0x10,%esp
c0004dee:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004df4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004df7:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c0004dfd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004e00:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0004e06:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004e09:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0004e0f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004e12:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c0004e18:	85 c0                	test   %eax,%eax
c0004e1a:	75 07                	jne    c0004e23 <task_fs+0x6f>
c0004e1c:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0004e23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004e26:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0004e2c:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c0004e31:	a3 64 fb 00 c0       	mov    %eax,0xc000fb64
c0004e36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004e3d:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0004e41:	74 1c                	je     c0004e5f <task_fs+0xab>
c0004e43:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0004e47:	7f 08                	jg     c0004e51 <task_fs+0x9d>
c0004e49:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0004e4d:	74 3e                	je     c0004e8d <task_fs+0xd9>
c0004e4f:	eb 4b                	jmp    c0004e9c <task_fs+0xe8>
c0004e51:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0004e55:	74 1f                	je     c0004e76 <task_fs+0xc2>
c0004e57:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0004e5b:	74 19                	je     c0004e76 <task_fs+0xc2>
c0004e5d:	eb 3d                	jmp    c0004e9c <task_fs+0xe8>
c0004e5f:	83 ec 0c             	sub    $0xc,%esp
c0004e62:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0004e68:	50                   	push   %eax
c0004e69:	e8 14 07 00 00       	call   c0005582 <do_open>
c0004e6e:	83 c4 10             	add    $0x10,%esp
c0004e71:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0004e74:	eb 26                	jmp    c0004e9c <task_fs+0xe8>
c0004e76:	83 ec 0c             	sub    $0xc,%esp
c0004e79:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0004e7f:	50                   	push   %eax
c0004e80:	e8 3b 18 00 00       	call   c00066c0 <do_rdwt>
c0004e85:	83 c4 10             	add    $0x10,%esp
c0004e88:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004e8b:	eb 0f                	jmp    c0004e9c <task_fs+0xe8>
c0004e8d:	83 ec 0c             	sub    $0xc,%esp
c0004e90:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004e93:	e8 2a 1d 00 00       	call   c0006bc2 <do_close>
c0004e98:	83 c4 10             	add    $0x10,%esp
c0004e9b:	90                   	nop
c0004e9c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004ea2:	83 f8 67             	cmp    $0x67,%eax
c0004ea5:	74 36                	je     c0004edd <task_fs+0x129>
c0004ea7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004eaa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004ead:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0004eb1:	75 06                	jne    c0004eb9 <task_fs+0x105>
c0004eb3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004eb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004eb9:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
c0004ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004ec3:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004ec6:	83 ec 04             	sub    $0x4,%esp
c0004ec9:	ff 75 f0             	pushl  -0x10(%ebp)
c0004ecc:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0004ed2:	50                   	push   %eax
c0004ed3:	6a 01                	push   $0x1
c0004ed5:	e8 97 ee ff ff       	call   c0003d71 <send_rec>
c0004eda:	83 c4 10             	add    $0x10,%esp
c0004edd:	a1 00 e7 00 c0       	mov    0xc000e700,%eax
c0004ee2:	83 c0 01             	add    $0x1,%eax
c0004ee5:	a3 00 e7 00 c0       	mov    %eax,0xc000e700
c0004eea:	e9 d3 fe ff ff       	jmp    c0004dc2 <task_fs+0xe>

c0004eef <rd_wt>:
c0004eef:	55                   	push   %ebp
c0004ef0:	89 e5                	mov    %esp,%ebp
c0004ef2:	83 ec 78             	sub    $0x78,%esp
c0004ef5:	83 ec 04             	sub    $0x4,%esp
c0004ef8:	6a 6c                	push   $0x6c
c0004efa:	6a 00                	push   $0x0
c0004efc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0004eff:	50                   	push   %eax
c0004f00:	e8 8a 50 00 00       	call   c0009f8f <Memset>
c0004f05:	83 c4 10             	add    $0x10,%esp
c0004f08:	8b 45 18             	mov    0x18(%ebp),%eax
c0004f0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f11:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004f14:	8b 45 10             	mov    0x10(%ebp),%eax
c0004f17:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004f1a:	8b 45 14             	mov    0x14(%ebp),%eax
c0004f1d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004f20:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f23:	c1 e0 09             	shl    $0x9,%eax
c0004f26:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004f29:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0004f2d:	74 22                	je     c0004f51 <rd_wt+0x62>
c0004f2f:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0004f33:	74 1c                	je     c0004f51 <rd_wt+0x62>
c0004f35:	68 d1 00 00 00       	push   $0xd1
c0004f3a:	68 30 9d 00 c0       	push   $0xc0009d30
c0004f3f:	68 30 9d 00 c0       	push   $0xc0009d30
c0004f44:	68 3d 9d 00 c0       	push   $0xc0009d3d
c0004f49:	e8 b7 e5 ff ff       	call   c0003505 <assertion_failure>
c0004f4e:	83 c4 10             	add    $0x10,%esp
c0004f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004f54:	83 f8 07             	cmp    $0x7,%eax
c0004f57:	74 24                	je     c0004f7d <rd_wt+0x8e>
c0004f59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004f5c:	83 f8 0a             	cmp    $0xa,%eax
c0004f5f:	74 1c                	je     c0004f7d <rd_wt+0x8e>
c0004f61:	68 d2 00 00 00       	push   $0xd2
c0004f66:	68 30 9d 00 c0       	push   $0xc0009d30
c0004f6b:	68 30 9d 00 c0       	push   $0xc0009d30
c0004f70:	68 5c 9d 00 c0       	push   $0xc0009d5c
c0004f75:	e8 8b e5 ff ff       	call   c0003505 <assertion_failure>
c0004f7a:	83 c4 10             	add    $0x10,%esp
c0004f7d:	83 ec 04             	sub    $0x4,%esp
c0004f80:	6a 02                	push   $0x2
c0004f82:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0004f85:	50                   	push   %eax
c0004f86:	6a 03                	push   $0x3
c0004f88:	e8 e4 ed ff ff       	call   c0003d71 <send_rec>
c0004f8d:	83 c4 10             	add    $0x10,%esp
c0004f90:	90                   	nop
c0004f91:	c9                   	leave  
c0004f92:	c3                   	ret    

c0004f93 <mkfs>:
c0004f93:	55                   	push   %ebp
c0004f94:	89 e5                	mov    %esp,%ebp
c0004f96:	57                   	push   %edi
c0004f97:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0004f9d:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0004fa2:	83 ec 04             	sub    $0x4,%esp
c0004fa5:	68 00 02 00 00       	push   $0x200
c0004faa:	6a 00                	push   $0x0
c0004fac:	50                   	push   %eax
c0004fad:	e8 dd 4f 00 00       	call   c0009f8f <Memset>
c0004fb2:	83 c4 10             	add    $0x10,%esp
c0004fb5:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0004fba:	83 ec 0c             	sub    $0xc,%esp
c0004fbd:	6a 0a                	push   $0xa
c0004fbf:	68 00 02 00 00       	push   $0x200
c0004fc4:	50                   	push   %eax
c0004fc5:	6a 20                	push   $0x20
c0004fc7:	6a 00                	push   $0x0
c0004fc9:	e8 21 ff ff ff       	call   c0004eef <rd_wt>
c0004fce:	83 c4 20             	add    $0x20,%esp
c0004fd1:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0004fd6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004fd9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004fdc:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0004fe3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004fe6:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0004fed:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004ff0:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0004ff7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004ffa:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0005001:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005004:	8b 40 04             	mov    0x4(%eax),%eax
c0005007:	8d 50 02             	lea    0x2(%eax),%edx
c000500a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000500d:	8b 40 08             	mov    0x8(%eax),%eax
c0005010:	01 c2                	add    %eax,%edx
c0005012:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005015:	8b 40 0c             	mov    0xc(%eax),%eax
c0005018:	01 c2                	add    %eax,%edx
c000501a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000501d:	89 10                	mov    %edx,(%eax)
c000501f:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0005026:	b8 00 02 00 00       	mov    $0x200,%eax
c000502b:	2b 45 d8             	sub    -0x28(%ebp),%eax
c000502e:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0005034:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0005037:	01 ca                	add    %ecx,%edx
c0005039:	83 ec 04             	sub    $0x4,%esp
c000503c:	50                   	push   %eax
c000503d:	6a 80                	push   $0xffffff80
c000503f:	52                   	push   %edx
c0005040:	e8 4a 4f 00 00       	call   c0009f8f <Memset>
c0005045:	83 c4 10             	add    $0x10,%esp
c0005048:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000504d:	83 ec 0c             	sub    $0xc,%esp
c0005050:	6a 0a                	push   $0xa
c0005052:	68 00 02 00 00       	push   $0x200
c0005057:	50                   	push   %eax
c0005058:	6a 20                	push   $0x20
c000505a:	6a 01                	push   $0x1
c000505c:	e8 8e fe ff ff       	call   c0004eef <rd_wt>
c0005061:	83 c4 20             	add    $0x20,%esp
c0005064:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005067:	8b 10                	mov    (%eax),%edx
c0005069:	89 55 98             	mov    %edx,-0x68(%ebp)
c000506c:	8b 50 04             	mov    0x4(%eax),%edx
c000506f:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0005072:	8b 50 08             	mov    0x8(%eax),%edx
c0005075:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0005078:	8b 50 0c             	mov    0xc(%eax),%edx
c000507b:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c000507e:	8b 50 10             	mov    0x10(%eax),%edx
c0005081:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0005084:	8b 50 14             	mov    0x14(%eax),%edx
c0005087:	89 55 ac             	mov    %edx,-0x54(%ebp)
c000508a:	8b 50 18             	mov    0x18(%eax),%edx
c000508d:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0005090:	8b 50 1c             	mov    0x1c(%eax),%edx
c0005093:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0005096:	8b 40 20             	mov    0x20(%eax),%eax
c0005099:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000509c:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c00050a0:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c00050a4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00050a9:	83 ec 04             	sub    $0x4,%esp
c00050ac:	6a 01                	push   $0x1
c00050ae:	52                   	push   %edx
c00050af:	50                   	push   %eax
c00050b0:	e8 da 4e 00 00       	call   c0009f8f <Memset>
c00050b5:	83 c4 10             	add    $0x10,%esp
c00050b8:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00050bd:	83 c0 01             	add    $0x1,%eax
c00050c0:	83 ec 04             	sub    $0x4,%esp
c00050c3:	68 ff 01 00 00       	push   $0x1ff
c00050c8:	6a 80                	push   $0xffffff80
c00050ca:	50                   	push   %eax
c00050cb:	e8 bf 4e 00 00       	call   c0009f8f <Memset>
c00050d0:	83 c4 10             	add    $0x10,%esp
c00050d3:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00050d8:	83 ec 0c             	sub    $0xc,%esp
c00050db:	6a 0a                	push   $0xa
c00050dd:	68 00 02 00 00       	push   $0x200
c00050e2:	50                   	push   %eax
c00050e3:	6a 20                	push   $0x20
c00050e5:	6a 02                	push   $0x2
c00050e7:	e8 03 fe ff ff       	call   c0004eef <rd_wt>
c00050ec:	83 c4 20             	add    $0x20,%esp
c00050ef:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c00050f6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00050fb:	83 ec 04             	sub    $0x4,%esp
c00050fe:	68 00 02 00 00       	push   $0x200
c0005103:	6a ff                	push   $0xffffffff
c0005105:	50                   	push   %eax
c0005106:	e8 84 4e 00 00       	call   c0009f8f <Memset>
c000510b:	83 c4 10             	add    $0x10,%esp
c000510e:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005113:	83 ec 0c             	sub    $0xc,%esp
c0005116:	6a 0a                	push   $0xa
c0005118:	68 00 02 00 00       	push   $0x200
c000511d:	50                   	push   %eax
c000511e:	6a 20                	push   $0x20
c0005120:	ff 75 d0             	pushl  -0x30(%ebp)
c0005123:	e8 c7 fd ff ff       	call   c0004eef <rd_wt>
c0005128:	83 c4 20             	add    $0x20,%esp
c000512b:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005130:	83 ec 04             	sub    $0x4,%esp
c0005133:	6a 01                	push   $0x1
c0005135:	6a 01                	push   $0x1
c0005137:	50                   	push   %eax
c0005138:	e8 52 4e 00 00       	call   c0009f8f <Memset>
c000513d:	83 c4 10             	add    $0x10,%esp
c0005140:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005145:	83 c0 01             	add    $0x1,%eax
c0005148:	83 ec 04             	sub    $0x4,%esp
c000514b:	68 ff 01 00 00       	push   $0x1ff
c0005150:	6a 00                	push   $0x0
c0005152:	50                   	push   %eax
c0005153:	e8 37 4e 00 00       	call   c0009f8f <Memset>
c0005158:	83 c4 10             	add    $0x10,%esp
c000515b:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005160:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0005163:	83 c2 01             	add    $0x1,%edx
c0005166:	83 ec 0c             	sub    $0xc,%esp
c0005169:	6a 0a                	push   $0xa
c000516b:	68 00 02 00 00       	push   $0x200
c0005170:	50                   	push   %eax
c0005171:	6a 20                	push   $0x20
c0005173:	52                   	push   %edx
c0005174:	e8 76 fd ff ff       	call   c0004eef <rd_wt>
c0005179:	83 c4 20             	add    $0x20,%esp
c000517c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000517f:	83 e8 02             	sub    $0x2,%eax
c0005182:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005185:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c000518c:	eb 3f                	jmp    c00051cd <mkfs+0x23a>
c000518e:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005193:	83 ec 04             	sub    $0x4,%esp
c0005196:	68 00 02 00 00       	push   $0x200
c000519b:	6a 00                	push   $0x0
c000519d:	50                   	push   %eax
c000519e:	e8 ec 4d 00 00       	call   c0009f8f <Memset>
c00051a3:	83 c4 10             	add    $0x10,%esp
c00051a6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00051ab:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c00051ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00051b1:	01 ca                	add    %ecx,%edx
c00051b3:	83 ec 0c             	sub    $0xc,%esp
c00051b6:	6a 0a                	push   $0xa
c00051b8:	68 00 02 00 00       	push   $0x200
c00051bd:	50                   	push   %eax
c00051be:	6a 20                	push   $0x20
c00051c0:	52                   	push   %edx
c00051c1:	e8 29 fd ff ff       	call   c0004eef <rd_wt>
c00051c6:	83 c4 20             	add    $0x20,%esp
c00051c9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00051cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00051d0:	83 c0 01             	add    $0x1,%eax
c00051d3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00051d6:	7e b6                	jle    c000518e <mkfs+0x1fb>
c00051d8:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00051dd:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00051e0:	83 c2 03             	add    $0x3,%edx
c00051e3:	83 ec 0c             	sub    $0xc,%esp
c00051e6:	6a 0a                	push   $0xa
c00051e8:	68 00 02 00 00       	push   $0x200
c00051ed:	50                   	push   %eax
c00051ee:	6a 20                	push   $0x20
c00051f0:	52                   	push   %edx
c00051f1:	e8 f9 fc ff ff       	call   c0004eef <rd_wt>
c00051f6:	83 c4 20             	add    $0x20,%esp
c00051f9:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00051fe:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0005201:	83 c2 03             	add    $0x3,%edx
c0005204:	83 ec 0c             	sub    $0xc,%esp
c0005207:	6a 07                	push   $0x7
c0005209:	68 00 02 00 00       	push   $0x200
c000520e:	50                   	push   %eax
c000520f:	6a 20                	push   $0x20
c0005211:	52                   	push   %edx
c0005212:	e8 d8 fc ff ff       	call   c0004eef <rd_wt>
c0005217:	83 c4 20             	add    $0x20,%esp
c000521a:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000521f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005222:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005225:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000522b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000522e:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0005235:	8b 55 98             	mov    -0x68(%ebp),%edx
c0005238:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000523b:	89 50 08             	mov    %edx,0x8(%eax)
c000523e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005241:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0005248:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000524b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0005252:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005255:	8b 10                	mov    (%eax),%edx
c0005257:	89 15 60 31 01 c0    	mov    %edx,0xc0013160
c000525d:	8b 50 04             	mov    0x4(%eax),%edx
c0005260:	89 15 64 31 01 c0    	mov    %edx,0xc0013164
c0005266:	8b 50 08             	mov    0x8(%eax),%edx
c0005269:	89 15 68 31 01 c0    	mov    %edx,0xc0013168
c000526f:	8b 50 0c             	mov    0xc(%eax),%edx
c0005272:	89 15 6c 31 01 c0    	mov    %edx,0xc001316c
c0005278:	8b 50 10             	mov    0x10(%eax),%edx
c000527b:	89 15 70 31 01 c0    	mov    %edx,0xc0013170
c0005281:	8b 50 14             	mov    0x14(%eax),%edx
c0005284:	89 15 74 31 01 c0    	mov    %edx,0xc0013174
c000528a:	8b 50 18             	mov    0x18(%eax),%edx
c000528d:	89 15 78 31 01 c0    	mov    %edx,0xc0013178
c0005293:	8b 50 1c             	mov    0x1c(%eax),%edx
c0005296:	89 15 7c 31 01 c0    	mov    %edx,0xc001317c
c000529c:	8b 50 20             	mov    0x20(%eax),%edx
c000529f:	89 15 80 31 01 c0    	mov    %edx,0xc0013180
c00052a5:	8b 40 24             	mov    0x24(%eax),%eax
c00052a8:	a3 84 31 01 c0       	mov    %eax,0xc0013184
c00052ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00052b4:	eb 4c                	jmp    c0005302 <mkfs+0x36f>
c00052b6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00052bb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00052be:	83 c2 01             	add    $0x1,%edx
c00052c1:	c1 e2 05             	shl    $0x5,%edx
c00052c4:	01 d0                	add    %edx,%eax
c00052c6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00052c9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00052cc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c00052d2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00052d5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c00052dc:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00052df:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c00052e6:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c00052ed:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00052f0:	c1 e0 08             	shl    $0x8,%eax
c00052f3:	0b 45 f0             	or     -0x10(%ebp),%eax
c00052f6:	89 c2                	mov    %eax,%edx
c00052f8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00052fb:	89 50 08             	mov    %edx,0x8(%eax)
c00052fe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005302:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0005306:	7e ae                	jle    c00052b6 <mkfs+0x323>
c0005308:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c000530f:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0005315:	b8 00 00 00 00       	mov    $0x0,%eax
c000531a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c000531f:	89 d7                	mov    %edx,%edi
c0005321:	f3 ab                	rep stos %eax,%es:(%edi)
c0005323:	c7 85 70 ff ff ff 82 	movl   $0xc0009d82,-0x90(%ebp)
c000532a:	9d 00 c0 
c000532d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005334:	eb 54                	jmp    c000538a <mkfs+0x3f7>
c0005336:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000533b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000533e:	83 c2 04             	add    $0x4,%edx
c0005341:	c1 e2 05             	shl    $0x5,%edx
c0005344:	01 d0                	add    %edx,%eax
c0005346:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005349:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000534c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0005352:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005355:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c000535c:	8b 45 98             	mov    -0x68(%ebp),%eax
c000535f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005362:	83 c2 01             	add    $0x1,%edx
c0005365:	c1 e2 0b             	shl    $0xb,%edx
c0005368:	01 c2                	add    %eax,%edx
c000536a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000536d:	89 50 08             	mov    %edx,0x8(%eax)
c0005370:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005373:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c000537a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000537d:	8d 50 05             	lea    0x5(%eax),%edx
c0005380:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005383:	89 50 10             	mov    %edx,0x10(%eax)
c0005386:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000538a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000538d:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0005390:	7c a4                	jl     c0005336 <mkfs+0x3a3>
c0005392:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005397:	8b 55 a0             	mov    -0x60(%ebp),%edx
c000539a:	83 c2 03             	add    $0x3,%edx
c000539d:	83 ec 0c             	sub    $0xc,%esp
c00053a0:	6a 0a                	push   $0xa
c00053a2:	68 00 02 00 00       	push   $0x200
c00053a7:	50                   	push   %eax
c00053a8:	6a 20                	push   $0x20
c00053aa:	52                   	push   %edx
c00053ab:	e8 3f fb ff ff       	call   c0004eef <rd_wt>
c00053b0:	83 c4 20             	add    $0x20,%esp
c00053b3:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00053b9:	8b 45 98             	mov    -0x68(%ebp),%eax
c00053bc:	83 ec 0c             	sub    $0xc,%esp
c00053bf:	6a 07                	push   $0x7
c00053c1:	68 00 02 00 00       	push   $0x200
c00053c6:	52                   	push   %edx
c00053c7:	6a 20                	push   $0x20
c00053c9:	50                   	push   %eax
c00053ca:	e8 20 fb ff ff       	call   c0004eef <rd_wt>
c00053cf:	83 c4 20             	add    $0x20,%esp
c00053d2:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c00053d9:	00 00 00 
c00053dc:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c00053e3:	2e 00 
c00053e5:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00053ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00053ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00053f0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c00053f6:	83 ec 0c             	sub    $0xc,%esp
c00053f9:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c00053ff:	50                   	push   %eax
c0005400:	e8 c3 4b 00 00       	call   c0009fc8 <Strlen>
c0005405:	83 c4 10             	add    $0x10,%esp
c0005408:	89 c1                	mov    %eax,%ecx
c000540a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000540d:	8d 50 04             	lea    0x4(%eax),%edx
c0005410:	83 ec 04             	sub    $0x4,%esp
c0005413:	51                   	push   %ecx
c0005414:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c000541a:	50                   	push   %eax
c000541b:	52                   	push   %edx
c000541c:	e8 40 4b 00 00       	call   c0009f61 <Memcpy>
c0005421:	83 c4 10             	add    $0x10,%esp
c0005424:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c000542a:	b8 00 00 00 00       	mov    $0x0,%eax
c000542f:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0005434:	89 d7                	mov    %edx,%edi
c0005436:	f3 ab                	rep stos %eax,%es:(%edi)
c0005438:	c7 85 34 ff ff ff 8e 	movl   $0xc0009d8e,-0xcc(%ebp)
c000543f:	9d 00 c0 
c0005442:	c7 85 38 ff ff ff 97 	movl   $0xc0009d97,-0xc8(%ebp)
c0005449:	9d 00 c0 
c000544c:	c7 85 3c ff ff ff a0 	movl   $0xc0009da0,-0xc4(%ebp)
c0005453:	9d 00 c0 
c0005456:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c000545d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005464:	eb 49                	jmp    c00054af <mkfs+0x51c>
c0005466:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c000546a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000546d:	8d 50 02             	lea    0x2(%eax),%edx
c0005470:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005473:	89 10                	mov    %edx,(%eax)
c0005475:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005478:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c000547f:	83 ec 0c             	sub    $0xc,%esp
c0005482:	50                   	push   %eax
c0005483:	e8 40 4b 00 00       	call   c0009fc8 <Strlen>
c0005488:	83 c4 10             	add    $0x10,%esp
c000548b:	89 c1                	mov    %eax,%ecx
c000548d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005490:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0005497:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000549a:	83 c2 04             	add    $0x4,%edx
c000549d:	83 ec 04             	sub    $0x4,%esp
c00054a0:	51                   	push   %ecx
c00054a1:	50                   	push   %eax
c00054a2:	52                   	push   %edx
c00054a3:	e8 b9 4a 00 00       	call   c0009f61 <Memcpy>
c00054a8:	83 c4 10             	add    $0x10,%esp
c00054ab:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00054af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00054b2:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c00054b5:	7c af                	jl     c0005466 <mkfs+0x4d3>
c00054b7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00054be:	eb 66                	jmp    c0005526 <mkfs+0x593>
c00054c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00054c3:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00054ca:	83 ec 0c             	sub    $0xc,%esp
c00054cd:	50                   	push   %eax
c00054ce:	e8 f5 4a 00 00       	call   c0009fc8 <Strlen>
c00054d3:	83 c4 10             	add    $0x10,%esp
c00054d6:	85 c0                	test   %eax,%eax
c00054d8:	74 47                	je     c0005521 <mkfs+0x58e>
c00054da:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c00054de:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00054e1:	8d 50 05             	lea    0x5(%eax),%edx
c00054e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00054e7:	89 10                	mov    %edx,(%eax)
c00054e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00054ec:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00054f3:	83 ec 0c             	sub    $0xc,%esp
c00054f6:	50                   	push   %eax
c00054f7:	e8 cc 4a 00 00       	call   c0009fc8 <Strlen>
c00054fc:	83 c4 10             	add    $0x10,%esp
c00054ff:	89 c1                	mov    %eax,%ecx
c0005501:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005504:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000550b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000550e:	83 c2 04             	add    $0x4,%edx
c0005511:	83 ec 04             	sub    $0x4,%esp
c0005514:	51                   	push   %ecx
c0005515:	50                   	push   %eax
c0005516:	52                   	push   %edx
c0005517:	e8 45 4a 00 00       	call   c0009f61 <Memcpy>
c000551c:	83 c4 10             	add    $0x10,%esp
c000551f:	eb 01                	jmp    c0005522 <mkfs+0x58f>
c0005521:	90                   	nop
c0005522:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0005526:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005529:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c000552c:	7c 92                	jl     c00054c0 <mkfs+0x52d>
c000552e:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005534:	8b 45 98             	mov    -0x68(%ebp),%eax
c0005537:	83 ec 0c             	sub    $0xc,%esp
c000553a:	6a 0a                	push   $0xa
c000553c:	68 00 02 00 00       	push   $0x200
c0005541:	52                   	push   %edx
c0005542:	6a 20                	push   $0x20
c0005544:	50                   	push   %eax
c0005545:	e8 a5 f9 ff ff       	call   c0004eef <rd_wt>
c000554a:	83 c4 20             	add    $0x20,%esp
c000554d:	90                   	nop
c000554e:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0005551:	c9                   	leave  
c0005552:	c3                   	ret    

c0005553 <init_fs>:
c0005553:	55                   	push   %ebp
c0005554:	89 e5                	mov    %esp,%ebp
c0005556:	83 ec 78             	sub    $0x78,%esp
c0005559:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0005560:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
c0005567:	83 ec 04             	sub    $0x4,%esp
c000556a:	6a 02                	push   $0x2
c000556c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000556f:	50                   	push   %eax
c0005570:	6a 03                	push   $0x3
c0005572:	e8 fa e7 ff ff       	call   c0003d71 <send_rec>
c0005577:	83 c4 10             	add    $0x10,%esp
c000557a:	e8 14 fa ff ff       	call   c0004f93 <mkfs>
c000557f:	90                   	nop
c0005580:	c9                   	leave  
c0005581:	c3                   	ret    

c0005582 <do_open>:
c0005582:	55                   	push   %ebp
c0005583:	89 e5                	mov    %esp,%ebp
c0005585:	56                   	push   %esi
c0005586:	53                   	push   %ebx
c0005587:	83 ec 60             	sub    $0x60,%esp
c000558a:	83 ec 04             	sub    $0x4,%esp
c000558d:	6a 0c                	push   $0xc
c000558f:	6a 00                	push   $0x0
c0005591:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0005594:	50                   	push   %eax
c0005595:	e8 f5 49 00 00       	call   c0009f8f <Memset>
c000559a:	83 c4 10             	add    $0x10,%esp
c000559d:	8b 45 08             	mov    0x8(%ebp),%eax
c00055a0:	8b 40 30             	mov    0x30(%eax),%eax
c00055a3:	89 c6                	mov    %eax,%esi
c00055a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00055a8:	8b 40 34             	mov    0x34(%eax),%eax
c00055ab:	89 c2                	mov    %eax,%edx
c00055ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00055b0:	8b 00                	mov    (%eax),%eax
c00055b2:	83 ec 08             	sub    $0x8,%esp
c00055b5:	52                   	push   %edx
c00055b6:	50                   	push   %eax
c00055b7:	e8 c7 19 00 00       	call   c0006f83 <v2l>
c00055bc:	83 c4 10             	add    $0x10,%esp
c00055bf:	89 c3                	mov    %eax,%ebx
c00055c1:	83 ec 08             	sub    $0x8,%esp
c00055c4:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00055c7:	50                   	push   %eax
c00055c8:	6a 03                	push   $0x3
c00055ca:	e8 b4 19 00 00       	call   c0006f83 <v2l>
c00055cf:	83 c4 10             	add    $0x10,%esp
c00055d2:	83 ec 04             	sub    $0x4,%esp
c00055d5:	56                   	push   %esi
c00055d6:	53                   	push   %ebx
c00055d7:	50                   	push   %eax
c00055d8:	e8 84 49 00 00       	call   c0009f61 <Memcpy>
c00055dd:	83 c4 10             	add    $0x10,%esp
c00055e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00055e3:	8b 40 30             	mov    0x30(%eax),%eax
c00055e6:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
c00055eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00055ee:	8b 40 64             	mov    0x64(%eax),%eax
c00055f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00055f4:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00055fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005602:	eb 1f                	jmp    c0005623 <do_open+0xa1>
c0005604:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c0005609:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000560c:	83 c2 20             	add    $0x20,%edx
c000560f:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0005613:	85 c0                	test   %eax,%eax
c0005615:	75 08                	jne    c000561f <do_open+0x9d>
c0005617:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000561a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000561d:	eb 0a                	jmp    c0005629 <do_open+0xa7>
c000561f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005623:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0005627:	7e db                	jle    c0005604 <do_open+0x82>
c0005629:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c000562d:	75 1c                	jne    c000564b <do_open+0xc9>
c000562f:	68 d8 01 00 00       	push   $0x1d8
c0005634:	68 30 9d 00 c0       	push   $0xc0009d30
c0005639:	68 30 9d 00 c0       	push   $0xc0009d30
c000563e:	68 a9 9d 00 c0       	push   $0xc0009da9
c0005643:	e8 bd de ff ff       	call   c0003505 <assertion_failure>
c0005648:	83 c4 10             	add    $0x10,%esp
c000564b:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0005652:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005659:	eb 1d                	jmp    c0005678 <do_open+0xf6>
c000565b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000565e:	c1 e0 04             	shl    $0x4,%eax
c0005661:	05 68 23 01 c0       	add    $0xc0012368,%eax
c0005666:	8b 00                	mov    (%eax),%eax
c0005668:	85 c0                	test   %eax,%eax
c000566a:	75 08                	jne    c0005674 <do_open+0xf2>
c000566c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000566f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005672:	eb 0a                	jmp    c000567e <do_open+0xfc>
c0005674:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005678:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c000567c:	7e dd                	jle    c000565b <do_open+0xd9>
c000567e:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0005682:	75 1c                	jne    c00056a0 <do_open+0x11e>
c0005684:	68 e4 01 00 00       	push   $0x1e4
c0005689:	68 30 9d 00 c0       	push   $0xc0009d30
c000568e:	68 30 9d 00 c0       	push   $0xc0009d30
c0005693:	68 b1 9d 00 c0       	push   $0xc0009db1
c0005698:	e8 68 de ff ff       	call   c0003505 <assertion_failure>
c000569d:	83 c4 10             	add    $0x10,%esp
c00056a0:	83 ec 0c             	sub    $0xc,%esp
c00056a3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00056a6:	50                   	push   %eax
c00056a7:	e8 b7 00 00 00       	call   c0005763 <search_file>
c00056ac:	83 c4 10             	add    $0x10,%esp
c00056af:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00056b2:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
c00056b6:	75 2b                	jne    c00056e3 <do_open+0x161>
c00056b8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00056bc:	7e 10                	jle    c00056ce <do_open+0x14c>
c00056be:	83 ec 0c             	sub    $0xc,%esp
c00056c1:	68 b9 9d 00 c0       	push   $0xc0009db9
c00056c6:	e8 1c de ff ff       	call   c00034e7 <panic>
c00056cb:	83 c4 10             	add    $0x10,%esp
c00056ce:	83 ec 08             	sub    $0x8,%esp
c00056d1:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00056d4:	50                   	push   %eax
c00056d5:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c00056d8:	50                   	push   %eax
c00056d9:	e8 43 04 00 00       	call   c0005b21 <create_file>
c00056de:	83 c4 10             	add    $0x10,%esp
c00056e1:	eb 22                	jmp    c0005705 <do_open+0x183>
c00056e3:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c00056e7:	75 07                	jne    c00056f0 <do_open+0x16e>
c00056e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00056ee:	eb 6c                	jmp    c000575c <do_open+0x1da>
c00056f0:	83 ec 08             	sub    $0x8,%esp
c00056f3:	ff 75 e0             	pushl  -0x20(%ebp)
c00056f6:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c00056f9:	50                   	push   %eax
c00056fa:	e8 60 02 00 00       	call   c000595f <get_inode>
c00056ff:	83 c4 10             	add    $0x10,%esp
c0005702:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005705:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000570a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000570d:	c1 e2 04             	shl    $0x4,%edx
c0005710:	8d 8a 60 23 01 c0    	lea    -0x3ffedca0(%edx),%ecx
c0005716:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005719:	83 c2 20             	add    $0x20,%edx
c000571c:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
c0005720:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0005723:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005726:	c1 e2 04             	shl    $0x4,%edx
c0005729:	81 c2 68 23 01 c0    	add    $0xc0012368,%edx
c000572f:	89 02                	mov    %eax,(%edx)
c0005731:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005734:	c1 e0 04             	shl    $0x4,%eax
c0005737:	05 64 23 01 c0       	add    $0xc0012364,%eax
c000573c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0005742:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005745:	c1 e0 04             	shl    $0x4,%eax
c0005748:	05 60 23 01 c0       	add    $0xc0012360,%eax
c000574d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0005753:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005756:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005759:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000575c:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000575f:	5b                   	pop    %ebx
c0005760:	5e                   	pop    %esi
c0005761:	5d                   	pop    %ebp
c0005762:	c3                   	ret    

c0005763 <search_file>:
c0005763:	55                   	push   %ebp
c0005764:	89 e5                	mov    %esp,%ebp
c0005766:	83 ec 68             	sub    $0x68,%esp
c0005769:	83 ec 04             	sub    $0x4,%esp
c000576c:	6a 0c                	push   $0xc
c000576e:	6a 00                	push   $0x0
c0005770:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0005773:	50                   	push   %eax
c0005774:	e8 16 48 00 00       	call   c0009f8f <Memset>
c0005779:	83 c4 10             	add    $0x10,%esp
c000577c:	83 ec 04             	sub    $0x4,%esp
c000577f:	6a 28                	push   $0x28
c0005781:	6a 00                	push   $0x0
c0005783:	8d 45 98             	lea    -0x68(%ebp),%eax
c0005786:	50                   	push   %eax
c0005787:	e8 03 48 00 00       	call   c0009f8f <Memset>
c000578c:	83 c4 10             	add    $0x10,%esp
c000578f:	83 ec 04             	sub    $0x4,%esp
c0005792:	8d 45 98             	lea    -0x68(%ebp),%eax
c0005795:	50                   	push   %eax
c0005796:	ff 75 08             	pushl  0x8(%ebp)
c0005799:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000579c:	50                   	push   %eax
c000579d:	e8 f1 00 00 00       	call   c0005893 <strip_path>
c00057a2:	83 c4 10             	add    $0x10,%esp
c00057a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00057a8:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c00057ac:	75 0a                	jne    c00057b8 <search_file+0x55>
c00057ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00057b3:	e9 d9 00 00 00       	jmp    c0005891 <search_file+0x12e>
c00057b8:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00057bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00057be:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00057c1:	05 00 02 00 00       	add    $0x200,%eax
c00057c6:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00057cc:	85 c0                	test   %eax,%eax
c00057ce:	0f 48 c2             	cmovs  %edx,%eax
c00057d1:	c1 f8 09             	sar    $0x9,%eax
c00057d4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00057d7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00057da:	c1 e8 04             	shr    $0x4,%eax
c00057dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00057e0:	e8 2f 14 00 00       	call   c0006c14 <get_super_block>
c00057e5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00057e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00057eb:	8b 00                	mov    (%eax),%eax
c00057ed:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00057f0:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c00057f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00057fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005805:	eb 79                	jmp    c0005880 <search_file+0x11d>
c0005807:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000580c:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c000580f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005812:	01 ca                	add    %ecx,%edx
c0005814:	83 ec 0c             	sub    $0xc,%esp
c0005817:	6a 07                	push   $0x7
c0005819:	68 00 02 00 00       	push   $0x200
c000581e:	50                   	push   %eax
c000581f:	ff 75 cc             	pushl  -0x34(%ebp)
c0005822:	52                   	push   %edx
c0005823:	e8 c7 f6 ff ff       	call   c0004eef <rd_wt>
c0005828:	83 c4 20             	add    $0x20,%esp
c000582b:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005830:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005833:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000583a:	eb 35                	jmp    c0005871 <search_file+0x10e>
c000583c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005840:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005843:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0005846:	7f 33                	jg     c000587b <search_file+0x118>
c0005848:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000584b:	83 c0 04             	add    $0x4,%eax
c000584e:	83 ec 08             	sub    $0x8,%esp
c0005851:	50                   	push   %eax
c0005852:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0005855:	50                   	push   %eax
c0005856:	e8 05 e8 ff ff       	call   c0004060 <strcmp>
c000585b:	83 c4 10             	add    $0x10,%esp
c000585e:	85 c0                	test   %eax,%eax
c0005860:	75 07                	jne    c0005869 <search_file+0x106>
c0005862:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005865:	8b 00                	mov    (%eax),%eax
c0005867:	eb 28                	jmp    c0005891 <search_file+0x12e>
c0005869:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000586d:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0005871:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005874:	83 f8 1f             	cmp    $0x1f,%eax
c0005877:	76 c3                	jbe    c000583c <search_file+0xd9>
c0005879:	eb 01                	jmp    c000587c <search_file+0x119>
c000587b:	90                   	nop
c000587c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005880:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005883:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0005886:	0f 8c 7b ff ff ff    	jl     c0005807 <search_file+0xa4>
c000588c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005891:	c9                   	leave  
c0005892:	c3                   	ret    

c0005893 <strip_path>:
c0005893:	55                   	push   %ebp
c0005894:	89 e5                	mov    %esp,%ebp
c0005896:	83 ec 10             	sub    $0x10,%esp
c0005899:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000589d:	75 0a                	jne    c00058a9 <strip_path+0x16>
c000589f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00058a4:	e9 b4 00 00 00       	jmp    c000595d <strip_path+0xca>
c00058a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00058ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00058af:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058b2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00058b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00058b8:	0f b6 00             	movzbl (%eax),%eax
c00058bb:	3c 2f                	cmp    $0x2f,%al
c00058bd:	75 2d                	jne    c00058ec <strip_path+0x59>
c00058bf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00058c3:	eb 27                	jmp    c00058ec <strip_path+0x59>
c00058c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00058c8:	0f b6 00             	movzbl (%eax),%eax
c00058cb:	3c 2f                	cmp    $0x2f,%al
c00058cd:	75 0a                	jne    c00058d9 <strip_path+0x46>
c00058cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00058d4:	e9 84 00 00 00       	jmp    c000595d <strip_path+0xca>
c00058d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00058dc:	0f b6 10             	movzbl (%eax),%edx
c00058df:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00058e2:	88 10                	mov    %dl,(%eax)
c00058e4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00058e8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00058ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00058ef:	0f b6 00             	movzbl (%eax),%eax
c00058f2:	84 c0                	test   %al,%al
c00058f4:	75 cf                	jne    c00058c5 <strip_path+0x32>
c00058f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00058f9:	c6 00 00             	movb   $0x0,(%eax)
c00058fc:	8b 45 10             	mov    0x10(%ebp),%eax
c00058ff:	8b 15 60 31 01 c0    	mov    0xc0013160,%edx
c0005905:	89 10                	mov    %edx,(%eax)
c0005907:	8b 15 64 31 01 c0    	mov    0xc0013164,%edx
c000590d:	89 50 04             	mov    %edx,0x4(%eax)
c0005910:	8b 15 68 31 01 c0    	mov    0xc0013168,%edx
c0005916:	89 50 08             	mov    %edx,0x8(%eax)
c0005919:	8b 15 6c 31 01 c0    	mov    0xc001316c,%edx
c000591f:	89 50 0c             	mov    %edx,0xc(%eax)
c0005922:	8b 15 70 31 01 c0    	mov    0xc0013170,%edx
c0005928:	89 50 10             	mov    %edx,0x10(%eax)
c000592b:	8b 15 74 31 01 c0    	mov    0xc0013174,%edx
c0005931:	89 50 14             	mov    %edx,0x14(%eax)
c0005934:	8b 15 78 31 01 c0    	mov    0xc0013178,%edx
c000593a:	89 50 18             	mov    %edx,0x18(%eax)
c000593d:	8b 15 7c 31 01 c0    	mov    0xc001317c,%edx
c0005943:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005946:	8b 15 80 31 01 c0    	mov    0xc0013180,%edx
c000594c:	89 50 20             	mov    %edx,0x20(%eax)
c000594f:	8b 15 84 31 01 c0    	mov    0xc0013184,%edx
c0005955:	89 50 24             	mov    %edx,0x24(%eax)
c0005958:	b8 00 00 00 00       	mov    $0x0,%eax
c000595d:	c9                   	leave  
c000595e:	c3                   	ret    

c000595f <get_inode>:
c000595f:	55                   	push   %ebp
c0005960:	89 e5                	mov    %esp,%ebp
c0005962:	56                   	push   %esi
c0005963:	53                   	push   %ebx
c0005964:	83 ec 20             	sub    $0x20,%esp
c0005967:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000596b:	75 0a                	jne    c0005977 <get_inode+0x18>
c000596d:	b8 00 00 00 00       	mov    $0x0,%eax
c0005972:	e9 a3 01 00 00       	jmp    c0005b1a <get_inode+0x1bb>
c0005977:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000597e:	c7 45 f0 60 27 01 c0 	movl   $0xc0012760,-0x10(%ebp)
c0005985:	eb 69                	jmp    c00059f0 <get_inode+0x91>
c0005987:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000598a:	8b 40 24             	mov    0x24(%eax),%eax
c000598d:	85 c0                	test   %eax,%eax
c000598f:	7e 53                	jle    c00059e4 <get_inode+0x85>
c0005991:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005994:	8b 40 10             	mov    0x10(%eax),%eax
c0005997:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000599a:	75 50                	jne    c00059ec <get_inode+0x8d>
c000599c:	8b 45 08             	mov    0x8(%ebp),%eax
c000599f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00059a2:	8b 0a                	mov    (%edx),%ecx
c00059a4:	89 08                	mov    %ecx,(%eax)
c00059a6:	8b 4a 04             	mov    0x4(%edx),%ecx
c00059a9:	89 48 04             	mov    %ecx,0x4(%eax)
c00059ac:	8b 4a 08             	mov    0x8(%edx),%ecx
c00059af:	89 48 08             	mov    %ecx,0x8(%eax)
c00059b2:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00059b5:	89 48 0c             	mov    %ecx,0xc(%eax)
c00059b8:	8b 4a 10             	mov    0x10(%edx),%ecx
c00059bb:	89 48 10             	mov    %ecx,0x10(%eax)
c00059be:	8b 4a 14             	mov    0x14(%edx),%ecx
c00059c1:	89 48 14             	mov    %ecx,0x14(%eax)
c00059c4:	8b 4a 18             	mov    0x18(%edx),%ecx
c00059c7:	89 48 18             	mov    %ecx,0x18(%eax)
c00059ca:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00059cd:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00059d0:	8b 4a 20             	mov    0x20(%edx),%ecx
c00059d3:	89 48 20             	mov    %ecx,0x20(%eax)
c00059d6:	8b 52 24             	mov    0x24(%edx),%edx
c00059d9:	89 50 24             	mov    %edx,0x24(%eax)
c00059dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059df:	e9 36 01 00 00       	jmp    c0005b1a <get_inode+0x1bb>
c00059e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00059ea:	eb 0d                	jmp    c00059f9 <get_inode+0x9a>
c00059ec:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c00059f0:	81 7d f0 60 31 01 c0 	cmpl   $0xc0013160,-0x10(%ebp)
c00059f7:	76 8e                	jbe    c0005987 <get_inode+0x28>
c00059f9:	e8 16 12 00 00       	call   c0006c14 <get_super_block>
c00059fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005a01:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0005a08:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a0b:	8b 40 04             	mov    0x4(%eax),%eax
c0005a0e:	8d 50 02             	lea    0x2(%eax),%edx
c0005a11:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a14:	8b 40 08             	mov    0x8(%eax),%eax
c0005a17:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0005a1a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a1d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0005a20:	b8 00 02 00 00       	mov    $0x200,%eax
c0005a25:	99                   	cltd   
c0005a26:	f7 7d e8             	idivl  -0x18(%ebp)
c0005a29:	89 c6                	mov    %eax,%esi
c0005a2b:	89 c8                	mov    %ecx,%eax
c0005a2d:	99                   	cltd   
c0005a2e:	f7 fe                	idiv   %esi
c0005a30:	01 d8                	add    %ebx,%eax
c0005a32:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005a35:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c0005a3c:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005a41:	83 ec 0c             	sub    $0xc,%esp
c0005a44:	6a 07                	push   $0x7
c0005a46:	68 00 02 00 00       	push   $0x200
c0005a4b:	50                   	push   %eax
c0005a4c:	ff 75 e0             	pushl  -0x20(%ebp)
c0005a4f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0005a52:	e8 98 f4 ff ff       	call   c0004eef <rd_wt>
c0005a57:	83 c4 20             	add    $0x20,%esp
c0005a5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a5d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0005a60:	b8 00 02 00 00       	mov    $0x200,%eax
c0005a65:	99                   	cltd   
c0005a66:	f7 7d e8             	idivl  -0x18(%ebp)
c0005a69:	89 c3                	mov    %eax,%ebx
c0005a6b:	89 c8                	mov    %ecx,%eax
c0005a6d:	99                   	cltd   
c0005a6e:	f7 fb                	idiv   %ebx
c0005a70:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0005a73:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005a79:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005a7c:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0005a80:	01 d0                	add    %edx,%eax
c0005a82:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a88:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0005a8b:	8b 0a                	mov    (%edx),%ecx
c0005a8d:	89 08                	mov    %ecx,(%eax)
c0005a8f:	8b 4a 04             	mov    0x4(%edx),%ecx
c0005a92:	89 48 04             	mov    %ecx,0x4(%eax)
c0005a95:	8b 4a 08             	mov    0x8(%edx),%ecx
c0005a98:	89 48 08             	mov    %ecx,0x8(%eax)
c0005a9b:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0005a9e:	89 48 0c             	mov    %ecx,0xc(%eax)
c0005aa1:	8b 4a 10             	mov    0x10(%edx),%ecx
c0005aa4:	89 48 10             	mov    %ecx,0x10(%eax)
c0005aa7:	8b 4a 14             	mov    0x14(%edx),%ecx
c0005aaa:	89 48 14             	mov    %ecx,0x14(%eax)
c0005aad:	8b 4a 18             	mov    0x18(%edx),%ecx
c0005ab0:	89 48 18             	mov    %ecx,0x18(%eax)
c0005ab3:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0005ab6:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0005ab9:	8b 4a 20             	mov    0x20(%edx),%ecx
c0005abc:	89 48 20             	mov    %ecx,0x20(%eax)
c0005abf:	8b 52 24             	mov    0x24(%edx),%edx
c0005ac2:	89 50 24             	mov    %edx,0x24(%eax)
c0005ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ac8:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005acb:	89 50 10             	mov    %edx,0x10(%eax)
c0005ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ad1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005ad4:	89 50 20             	mov    %edx,0x20(%eax)
c0005ad7:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ada:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005add:	8b 0a                	mov    (%edx),%ecx
c0005adf:	89 08                	mov    %ecx,(%eax)
c0005ae1:	8b 4a 04             	mov    0x4(%edx),%ecx
c0005ae4:	89 48 04             	mov    %ecx,0x4(%eax)
c0005ae7:	8b 4a 08             	mov    0x8(%edx),%ecx
c0005aea:	89 48 08             	mov    %ecx,0x8(%eax)
c0005aed:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0005af0:	89 48 0c             	mov    %ecx,0xc(%eax)
c0005af3:	8b 4a 10             	mov    0x10(%edx),%ecx
c0005af6:	89 48 10             	mov    %ecx,0x10(%eax)
c0005af9:	8b 4a 14             	mov    0x14(%edx),%ecx
c0005afc:	89 48 14             	mov    %ecx,0x14(%eax)
c0005aff:	8b 4a 18             	mov    0x18(%edx),%ecx
c0005b02:	89 48 18             	mov    %ecx,0x18(%eax)
c0005b05:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0005b08:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0005b0b:	8b 4a 20             	mov    0x20(%edx),%ecx
c0005b0e:	89 48 20             	mov    %ecx,0x20(%eax)
c0005b11:	8b 52 24             	mov    0x24(%edx),%edx
c0005b14:	89 50 24             	mov    %edx,0x24(%eax)
c0005b17:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b1a:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0005b1d:	5b                   	pop    %ebx
c0005b1e:	5e                   	pop    %esi
c0005b1f:	5d                   	pop    %ebp
c0005b20:	c3                   	ret    

c0005b21 <create_file>:
c0005b21:	55                   	push   %ebp
c0005b22:	89 e5                	mov    %esp,%ebp
c0005b24:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0005b2a:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0005b2d:	50                   	push   %eax
c0005b2e:	ff 75 0c             	pushl  0xc(%ebp)
c0005b31:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0005b34:	50                   	push   %eax
c0005b35:	e8 59 fd ff ff       	call   c0005893 <strip_path>
c0005b3a:	83 c4 0c             	add    $0xc,%esp
c0005b3d:	83 f8 ff             	cmp    $0xffffffff,%eax
c0005b40:	75 0a                	jne    c0005b4c <create_file+0x2b>
c0005b42:	b8 00 00 00 00       	mov    $0x0,%eax
c0005b47:	e9 de 00 00 00       	jmp    c0005c2a <create_file+0x109>
c0005b4c:	e8 db 00 00 00       	call   c0005c2c <alloc_imap_bit>
c0005b51:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005b58:	75 0a                	jne    c0005b64 <create_file+0x43>
c0005b5a:	b8 00 00 00 00       	mov    $0x0,%eax
c0005b5f:	e9 c6 00 00 00       	jmp    c0005c2a <create_file+0x109>
c0005b64:	e8 ab 10 00 00       	call   c0006c14 <get_super_block>
c0005b69:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b6f:	8b 40 10             	mov    0x10(%eax),%eax
c0005b72:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005b75:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005b78:	83 ec 08             	sub    $0x8,%esp
c0005b7b:	50                   	push   %eax
c0005b7c:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b7f:	e8 a5 01 00 00       	call   c0005d29 <alloc_smap_bit>
c0005b84:	83 c4 10             	add    $0x10,%esp
c0005b87:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005b8a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0005b8e:	75 0a                	jne    c0005b9a <create_file+0x79>
c0005b90:	b8 00 00 00 00       	mov    $0x0,%eax
c0005b95:	e9 90 00 00 00       	jmp    c0005c2a <create_file+0x109>
c0005b9a:	83 ec 04             	sub    $0x4,%esp
c0005b9d:	ff 75 e8             	pushl  -0x18(%ebp)
c0005ba0:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ba3:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0005ba6:	50                   	push   %eax
c0005ba7:	e8 1e 03 00 00       	call   c0005eca <new_inode>
c0005bac:	83 c4 10             	add    $0x10,%esp
c0005baf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005bb2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0005bb6:	75 07                	jne    c0005bbf <create_file+0x9e>
c0005bb8:	b8 00 00 00 00       	mov    $0x0,%eax
c0005bbd:	eb 6b                	jmp    c0005c2a <create_file+0x109>
c0005bbf:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bc2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0005bc5:	50                   	push   %eax
c0005bc6:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0005bc9:	50                   	push   %eax
c0005bca:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0005bd0:	50                   	push   %eax
c0005bd1:	e8 12 04 00 00       	call   c0005fe8 <new_dir_entry>
c0005bd6:	83 c4 10             	add    $0x10,%esp
c0005bd9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005bdc:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0005be0:	75 07                	jne    c0005be9 <create_file+0xc8>
c0005be2:	b8 00 00 00 00       	mov    $0x0,%eax
c0005be7:	eb 41                	jmp    c0005c2a <create_file+0x109>
c0005be9:	8b 45 08             	mov    0x8(%ebp),%eax
c0005bec:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0005bef:	89 10                	mov    %edx,(%eax)
c0005bf1:	8b 55 88             	mov    -0x78(%ebp),%edx
c0005bf4:	89 50 04             	mov    %edx,0x4(%eax)
c0005bf7:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0005bfa:	89 50 08             	mov    %edx,0x8(%eax)
c0005bfd:	8b 55 90             	mov    -0x70(%ebp),%edx
c0005c00:	89 50 0c             	mov    %edx,0xc(%eax)
c0005c03:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0005c06:	89 50 10             	mov    %edx,0x10(%eax)
c0005c09:	8b 55 98             	mov    -0x68(%ebp),%edx
c0005c0c:	89 50 14             	mov    %edx,0x14(%eax)
c0005c0f:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0005c12:	89 50 18             	mov    %edx,0x18(%eax)
c0005c15:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0005c18:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005c1b:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0005c1e:	89 50 20             	mov    %edx,0x20(%eax)
c0005c21:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0005c24:	89 50 24             	mov    %edx,0x24(%eax)
c0005c27:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c2a:	c9                   	leave  
c0005c2b:	c3                   	ret    

c0005c2c <alloc_imap_bit>:
c0005c2c:	55                   	push   %ebp
c0005c2d:	89 e5                	mov    %esp,%ebp
c0005c2f:	53                   	push   %ebx
c0005c30:	83 ec 24             	sub    $0x24,%esp
c0005c33:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0005c3a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0005c41:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005c46:	83 ec 0c             	sub    $0xc,%esp
c0005c49:	6a 07                	push   $0x7
c0005c4b:	68 00 02 00 00       	push   $0x200
c0005c50:	50                   	push   %eax
c0005c51:	ff 75 e8             	pushl  -0x18(%ebp)
c0005c54:	ff 75 ec             	pushl  -0x14(%ebp)
c0005c57:	e8 93 f2 ff ff       	call   c0004eef <rd_wt>
c0005c5c:	83 c4 20             	add    $0x20,%esp
c0005c5f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005c66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005c6d:	e9 a5 00 00 00       	jmp    c0005d17 <alloc_imap_bit+0xeb>
c0005c72:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005c79:	e9 8b 00 00 00       	jmp    c0005d09 <alloc_imap_bit+0xdd>
c0005c7e:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005c84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c87:	01 d0                	add    %edx,%eax
c0005c89:	0f b6 00             	movzbl (%eax),%eax
c0005c8c:	0f be d0             	movsbl %al,%edx
c0005c8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c92:	89 c1                	mov    %eax,%ecx
c0005c94:	d3 fa                	sar    %cl,%edx
c0005c96:	89 d0                	mov    %edx,%eax
c0005c98:	83 e0 01             	and    $0x1,%eax
c0005c9b:	85 c0                	test   %eax,%eax
c0005c9d:	74 06                	je     c0005ca5 <alloc_imap_bit+0x79>
c0005c9f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005ca3:	eb 64                	jmp    c0005d09 <alloc_imap_bit+0xdd>
c0005ca5:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005cab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cae:	01 d0                	add    %edx,%eax
c0005cb0:	0f b6 18             	movzbl (%eax),%ebx
c0005cb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cb6:	ba 01 00 00 00       	mov    $0x1,%edx
c0005cbb:	89 c1                	mov    %eax,%ecx
c0005cbd:	d3 e2                	shl    %cl,%edx
c0005cbf:	89 d0                	mov    %edx,%eax
c0005cc1:	89 c1                	mov    %eax,%ecx
c0005cc3:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005cc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ccc:	01 d0                	add    %edx,%eax
c0005cce:	09 cb                	or     %ecx,%ebx
c0005cd0:	89 da                	mov    %ebx,%edx
c0005cd2:	88 10                	mov    %dl,(%eax)
c0005cd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cd7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0005cde:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ce1:	01 d0                	add    %edx,%eax
c0005ce3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005ce6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005ceb:	83 ec 0c             	sub    $0xc,%esp
c0005cee:	6a 0a                	push   $0xa
c0005cf0:	68 00 02 00 00       	push   $0x200
c0005cf5:	50                   	push   %eax
c0005cf6:	ff 75 e8             	pushl  -0x18(%ebp)
c0005cf9:	ff 75 ec             	pushl  -0x14(%ebp)
c0005cfc:	e8 ee f1 ff ff       	call   c0004eef <rd_wt>
c0005d01:	83 c4 20             	add    $0x20,%esp
c0005d04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005d07:	eb 1b                	jmp    c0005d24 <alloc_imap_bit+0xf8>
c0005d09:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0005d0d:	0f 8e 6b ff ff ff    	jle    c0005c7e <alloc_imap_bit+0x52>
c0005d13:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005d17:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0005d1e:	0f 8e 4e ff ff ff    	jle    c0005c72 <alloc_imap_bit+0x46>
c0005d24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005d27:	c9                   	leave  
c0005d28:	c3                   	ret    

c0005d29 <alloc_smap_bit>:
c0005d29:	55                   	push   %ebp
c0005d2a:	89 e5                	mov    %esp,%ebp
c0005d2c:	53                   	push   %ebx
c0005d2d:	83 ec 34             	sub    $0x34,%esp
c0005d30:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005d34:	75 1c                	jne    c0005d52 <alloc_smap_bit+0x29>
c0005d36:	68 0e 03 00 00       	push   $0x30e
c0005d3b:	68 30 9d 00 c0       	push   $0xc0009d30
c0005d40:	68 30 9d 00 c0       	push   $0xc0009d30
c0005d45:	68 c6 9d 00 c0       	push   $0xc0009dc6
c0005d4a:	e8 b6 d7 ff ff       	call   c0003505 <assertion_failure>
c0005d4f:	83 c4 10             	add    $0x10,%esp
c0005d52:	e8 bd 0e 00 00       	call   c0006c14 <get_super_block>
c0005d57:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005d5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005d5d:	8b 40 08             	mov    0x8(%eax),%eax
c0005d60:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005d63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005d66:	8b 40 04             	mov    0x4(%eax),%eax
c0005d69:	83 c0 02             	add    $0x2,%eax
c0005d6c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005d6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005d76:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0005d7d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005d84:	e9 20 01 00 00       	jmp    c0005ea9 <alloc_smap_bit+0x180>
c0005d89:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0005d8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d8f:	01 d0                	add    %edx,%eax
c0005d91:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005d94:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005d99:	83 ec 0c             	sub    $0xc,%esp
c0005d9c:	6a 07                	push   $0x7
c0005d9e:	68 00 02 00 00       	push   $0x200
c0005da3:	50                   	push   %eax
c0005da4:	ff 75 d8             	pushl  -0x28(%ebp)
c0005da7:	ff 75 d4             	pushl  -0x2c(%ebp)
c0005daa:	e8 40 f1 ff ff       	call   c0004eef <rd_wt>
c0005daf:	83 c4 20             	add    $0x20,%esp
c0005db2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005db9:	e9 b0 00 00 00       	jmp    c0005e6e <alloc_smap_bit+0x145>
c0005dbe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005dc5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005dc9:	0f 85 8c 00 00 00    	jne    c0005e5b <alloc_smap_bit+0x132>
c0005dcf:	eb 45                	jmp    c0005e16 <alloc_smap_bit+0xed>
c0005dd1:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005dd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005dda:	01 d0                	add    %edx,%eax
c0005ddc:	0f b6 00             	movzbl (%eax),%eax
c0005ddf:	0f be d0             	movsbl %al,%edx
c0005de2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005de5:	89 c1                	mov    %eax,%ecx
c0005de7:	d3 fa                	sar    %cl,%edx
c0005de9:	89 d0                	mov    %edx,%eax
c0005deb:	83 e0 01             	and    $0x1,%eax
c0005dee:	85 c0                	test   %eax,%eax
c0005df0:	74 06                	je     c0005df8 <alloc_smap_bit+0xcf>
c0005df2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005df6:	eb 1e                	jmp    c0005e16 <alloc_smap_bit+0xed>
c0005df8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dfb:	c1 e0 09             	shl    $0x9,%eax
c0005dfe:	89 c2                	mov    %eax,%edx
c0005e00:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e03:	01 d0                	add    %edx,%eax
c0005e05:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0005e0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e0f:	01 d0                	add    %edx,%eax
c0005e11:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005e14:	eb 06                	jmp    c0005e1c <alloc_smap_bit+0xf3>
c0005e16:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0005e1a:	7e b5                	jle    c0005dd1 <alloc_smap_bit+0xa8>
c0005e1c:	eb 3d                	jmp    c0005e5b <alloc_smap_bit+0x132>
c0005e1e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005e22:	74 45                	je     c0005e69 <alloc_smap_bit+0x140>
c0005e24:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005e2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e2d:	01 d0                	add    %edx,%eax
c0005e2f:	0f b6 18             	movzbl (%eax),%ebx
c0005e32:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e35:	ba 01 00 00 00       	mov    $0x1,%edx
c0005e3a:	89 c1                	mov    %eax,%ecx
c0005e3c:	d3 e2                	shl    %cl,%edx
c0005e3e:	89 d0                	mov    %edx,%eax
c0005e40:	89 c1                	mov    %eax,%ecx
c0005e42:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0005e48:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e4b:	01 d0                	add    %edx,%eax
c0005e4d:	09 cb                	or     %ecx,%ebx
c0005e4f:	89 da                	mov    %ebx,%edx
c0005e51:	88 10                	mov    %dl,(%eax)
c0005e53:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0005e57:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005e5b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005e5f:	74 09                	je     c0005e6a <alloc_smap_bit+0x141>
c0005e61:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0005e65:	7e b7                	jle    c0005e1e <alloc_smap_bit+0xf5>
c0005e67:	eb 01                	jmp    c0005e6a <alloc_smap_bit+0x141>
c0005e69:	90                   	nop
c0005e6a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005e6e:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0005e75:	0f 8e 43 ff ff ff    	jle    c0005dbe <alloc_smap_bit+0x95>
c0005e7b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005e7f:	74 1e                	je     c0005e9f <alloc_smap_bit+0x176>
c0005e81:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0005e86:	83 ec 0c             	sub    $0xc,%esp
c0005e89:	6a 0a                	push   $0xa
c0005e8b:	68 00 02 00 00       	push   $0x200
c0005e90:	50                   	push   %eax
c0005e91:	ff 75 d8             	pushl  -0x28(%ebp)
c0005e94:	ff 75 d4             	pushl  -0x2c(%ebp)
c0005e97:	e8 53 f0 ff ff       	call   c0004eef <rd_wt>
c0005e9c:	83 c4 20             	add    $0x20,%esp
c0005e9f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005ea3:	74 12                	je     c0005eb7 <alloc_smap_bit+0x18e>
c0005ea5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005ea9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005eac:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0005eaf:	0f 8c d4 fe ff ff    	jl     c0005d89 <alloc_smap_bit+0x60>
c0005eb5:	eb 01                	jmp    c0005eb8 <alloc_smap_bit+0x18f>
c0005eb7:	90                   	nop
c0005eb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ebb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005ebe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005ec1:	8b 00                	mov    (%eax),%eax
c0005ec3:	01 d0                	add    %edx,%eax
c0005ec5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005ec8:	c9                   	leave  
c0005ec9:	c3                   	ret    

c0005eca <new_inode>:
c0005eca:	55                   	push   %ebp
c0005ecb:	89 e5                	mov    %esp,%ebp
c0005ecd:	83 ec 38             	sub    $0x38,%esp
c0005ed0:	83 ec 08             	sub    $0x8,%esp
c0005ed3:	ff 75 0c             	pushl  0xc(%ebp)
c0005ed6:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0005ed9:	50                   	push   %eax
c0005eda:	e8 80 fa ff ff       	call   c000595f <get_inode>
c0005edf:	83 c4 10             	add    $0x10,%esp
c0005ee2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005ee5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005ee9:	75 0a                	jne    c0005ef5 <new_inode+0x2b>
c0005eeb:	b8 00 00 00 00       	mov    $0x0,%eax
c0005ef0:	e9 f1 00 00 00       	jmp    c0005fe6 <new_inode+0x11c>
c0005ef5:	8b 45 10             	mov    0x10(%ebp),%eax
c0005ef8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005efb:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0005f02:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0005f09:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0005f10:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f13:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005f16:	83 ec 0c             	sub    $0xc,%esp
c0005f19:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0005f1c:	50                   	push   %eax
c0005f1d:	e8 0e 0b 00 00       	call   c0006a30 <sync_inode>
c0005f22:	83 c4 10             	add    $0x10,%esp
c0005f25:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005f2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005f33:	eb 1d                	jmp    c0005f52 <new_inode+0x88>
c0005f35:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005f38:	89 d0                	mov    %edx,%eax
c0005f3a:	c1 e0 02             	shl    $0x2,%eax
c0005f3d:	01 d0                	add    %edx,%eax
c0005f3f:	c1 e0 03             	shl    $0x3,%eax
c0005f42:	05 70 27 01 c0       	add    $0xc0012770,%eax
c0005f47:	8b 00                	mov    (%eax),%eax
c0005f49:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0005f4c:	74 0c                	je     c0005f5a <new_inode+0x90>
c0005f4e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005f52:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0005f56:	7e dd                	jle    c0005f35 <new_inode+0x6b>
c0005f58:	eb 01                	jmp    c0005f5b <new_inode+0x91>
c0005f5a:	90                   	nop
c0005f5b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005f5e:	89 d0                	mov    %edx,%eax
c0005f60:	c1 e0 02             	shl    $0x2,%eax
c0005f63:	01 d0                	add    %edx,%eax
c0005f65:	c1 e0 03             	shl    $0x3,%eax
c0005f68:	05 60 27 01 c0       	add    $0xc0012760,%eax
c0005f6d:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0005f70:	89 10                	mov    %edx,(%eax)
c0005f72:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0005f75:	89 50 04             	mov    %edx,0x4(%eax)
c0005f78:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0005f7b:	89 50 08             	mov    %edx,0x8(%eax)
c0005f7e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0005f81:	89 50 0c             	mov    %edx,0xc(%eax)
c0005f84:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0005f87:	89 50 10             	mov    %edx,0x10(%eax)
c0005f8a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0005f8d:	89 50 14             	mov    %edx,0x14(%eax)
c0005f90:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005f93:	89 50 18             	mov    %edx,0x18(%eax)
c0005f96:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0005f99:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005f9c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0005f9f:	89 50 20             	mov    %edx,0x20(%eax)
c0005fa2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005fa5:	89 50 24             	mov    %edx,0x24(%eax)
c0005fa8:	8b 45 08             	mov    0x8(%ebp),%eax
c0005fab:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0005fae:	89 10                	mov    %edx,(%eax)
c0005fb0:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0005fb3:	89 50 04             	mov    %edx,0x4(%eax)
c0005fb6:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0005fb9:	89 50 08             	mov    %edx,0x8(%eax)
c0005fbc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0005fbf:	89 50 0c             	mov    %edx,0xc(%eax)
c0005fc2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0005fc5:	89 50 10             	mov    %edx,0x10(%eax)
c0005fc8:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0005fcb:	89 50 14             	mov    %edx,0x14(%eax)
c0005fce:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005fd1:	89 50 18             	mov    %edx,0x18(%eax)
c0005fd4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0005fd7:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005fda:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0005fdd:	89 50 20             	mov    %edx,0x20(%eax)
c0005fe0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005fe3:	89 50 24             	mov    %edx,0x24(%eax)
c0005fe6:	c9                   	leave  
c0005fe7:	c3                   	ret    

c0005fe8 <new_dir_entry>:
c0005fe8:	55                   	push   %ebp
c0005fe9:	89 e5                	mov    %esp,%ebp
c0005feb:	83 ec 48             	sub    $0x48,%esp
c0005fee:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0005ff5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005ff8:	8b 40 04             	mov    0x4(%eax),%eax
c0005ffb:	99                   	cltd   
c0005ffc:	f7 7d dc             	idivl  -0x24(%ebp)
c0005fff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006002:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006005:	8b 40 0c             	mov    0xc(%eax),%eax
c0006008:	99                   	cltd   
c0006009:	f7 7d dc             	idivl  -0x24(%ebp)
c000600c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000600f:	e8 00 0c 00 00       	call   c0006c14 <get_super_block>
c0006014:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006017:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000601a:	8b 00                	mov    (%eax),%eax
c000601c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000601f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006022:	8b 40 0c             	mov    0xc(%eax),%eax
c0006025:	05 00 02 00 00       	add    $0x200,%eax
c000602a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0006030:	85 c0                	test   %eax,%eax
c0006032:	0f 48 c2             	cmovs  %edx,%eax
c0006035:	c1 f8 09             	sar    $0x9,%eax
c0006038:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000603b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006042:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006049:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0006050:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006057:	eb 7d                	jmp    c00060d6 <new_dir_entry+0xee>
c0006059:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000605e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0006061:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006064:	01 ca                	add    %ecx,%edx
c0006066:	83 ec 0c             	sub    $0xc,%esp
c0006069:	6a 07                	push   $0x7
c000606b:	68 00 02 00 00       	push   $0x200
c0006070:	50                   	push   %eax
c0006071:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006074:	52                   	push   %edx
c0006075:	e8 75 ee ff ff       	call   c0004eef <rd_wt>
c000607a:	83 c4 20             	add    $0x20,%esp
c000607d:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006082:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006085:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000608c:	eb 25                	jmp    c00060b3 <new_dir_entry+0xcb>
c000608e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0006092:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006095:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0006098:	7f 29                	jg     c00060c3 <new_dir_entry+0xdb>
c000609a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000609d:	8b 00                	mov    (%eax),%eax
c000609f:	85 c0                	test   %eax,%eax
c00060a1:	75 08                	jne    c00060ab <new_dir_entry+0xc3>
c00060a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00060a9:	eb 19                	jmp    c00060c4 <new_dir_entry+0xdc>
c00060ab:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00060af:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c00060b3:	b8 00 02 00 00       	mov    $0x200,%eax
c00060b8:	99                   	cltd   
c00060b9:	f7 7d dc             	idivl  -0x24(%ebp)
c00060bc:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c00060bf:	7c cd                	jl     c000608e <new_dir_entry+0xa6>
c00060c1:	eb 01                	jmp    c00060c4 <new_dir_entry+0xdc>
c00060c3:	90                   	nop
c00060c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00060c7:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00060ca:	7f 16                	jg     c00060e2 <new_dir_entry+0xfa>
c00060cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00060d0:	75 10                	jne    c00060e2 <new_dir_entry+0xfa>
c00060d2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00060d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060d9:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c00060dc:	0f 8c 77 ff ff ff    	jl     c0006059 <new_dir_entry+0x71>
c00060e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00060e5:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c00060e8:	75 0a                	jne    c00060f4 <new_dir_entry+0x10c>
c00060ea:	b8 00 00 00 00       	mov    $0x0,%eax
c00060ef:	e9 fa 00 00 00       	jmp    c00061ee <new_dir_entry+0x206>
c00060f4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00060fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00060ff:	75 1e                	jne    c000611f <new_dir_entry+0x137>
c0006101:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006104:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006107:	8b 45 0c             	mov    0xc(%ebp),%eax
c000610a:	8b 50 04             	mov    0x4(%eax),%edx
c000610d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006110:	01 c2                	add    %eax,%edx
c0006112:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006115:	89 50 04             	mov    %edx,0x4(%eax)
c0006118:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c000611f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006122:	8b 55 14             	mov    0x14(%ebp),%edx
c0006125:	89 10                	mov    %edx,(%eax)
c0006127:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000612a:	83 c0 04             	add    $0x4,%eax
c000612d:	83 ec 08             	sub    $0x8,%esp
c0006130:	ff 75 10             	pushl  0x10(%ebp)
c0006133:	50                   	push   %eax
c0006134:	e8 75 3e 00 00       	call   c0009fae <Strcpy>
c0006139:	83 c4 10             	add    $0x10,%esp
c000613c:	8b 45 08             	mov    0x8(%ebp),%eax
c000613f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006142:	8b 0a                	mov    (%edx),%ecx
c0006144:	89 08                	mov    %ecx,(%eax)
c0006146:	8b 4a 04             	mov    0x4(%edx),%ecx
c0006149:	89 48 04             	mov    %ecx,0x4(%eax)
c000614c:	8b 4a 08             	mov    0x8(%edx),%ecx
c000614f:	89 48 08             	mov    %ecx,0x8(%eax)
c0006152:	8b 52 0c             	mov    0xc(%edx),%edx
c0006155:	89 50 0c             	mov    %edx,0xc(%eax)
c0006158:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000615d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0006160:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006163:	01 ca                	add    %ecx,%edx
c0006165:	83 ec 0c             	sub    $0xc,%esp
c0006168:	6a 0a                	push   $0xa
c000616a:	68 00 02 00 00       	push   $0x200
c000616f:	50                   	push   %eax
c0006170:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006173:	52                   	push   %edx
c0006174:	e8 76 ed ff ff       	call   c0004eef <rd_wt>
c0006179:	83 c4 20             	add    $0x20,%esp
c000617c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0006180:	74 69                	je     c00061eb <new_dir_entry+0x203>
c0006182:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006185:	8b 10                	mov    (%eax),%edx
c0006187:	89 15 60 31 01 c0    	mov    %edx,0xc0013160
c000618d:	8b 50 04             	mov    0x4(%eax),%edx
c0006190:	89 15 64 31 01 c0    	mov    %edx,0xc0013164
c0006196:	8b 50 08             	mov    0x8(%eax),%edx
c0006199:	89 15 68 31 01 c0    	mov    %edx,0xc0013168
c000619f:	8b 50 0c             	mov    0xc(%eax),%edx
c00061a2:	89 15 6c 31 01 c0    	mov    %edx,0xc001316c
c00061a8:	8b 50 10             	mov    0x10(%eax),%edx
c00061ab:	89 15 70 31 01 c0    	mov    %edx,0xc0013170
c00061b1:	8b 50 14             	mov    0x14(%eax),%edx
c00061b4:	89 15 74 31 01 c0    	mov    %edx,0xc0013174
c00061ba:	8b 50 18             	mov    0x18(%eax),%edx
c00061bd:	89 15 78 31 01 c0    	mov    %edx,0xc0013178
c00061c3:	8b 50 1c             	mov    0x1c(%eax),%edx
c00061c6:	89 15 7c 31 01 c0    	mov    %edx,0xc001317c
c00061cc:	8b 50 20             	mov    0x20(%eax),%edx
c00061cf:	89 15 80 31 01 c0    	mov    %edx,0xc0013180
c00061d5:	8b 40 24             	mov    0x24(%eax),%eax
c00061d8:	a3 84 31 01 c0       	mov    %eax,0xc0013184
c00061dd:	83 ec 0c             	sub    $0xc,%esp
c00061e0:	ff 75 0c             	pushl  0xc(%ebp)
c00061e3:	e8 48 08 00 00       	call   c0006a30 <sync_inode>
c00061e8:	83 c4 10             	add    $0x10,%esp
c00061eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00061ee:	c9                   	leave  
c00061ef:	c3                   	ret    

c00061f0 <do_unlink>:
c00061f0:	55                   	push   %ebp
c00061f1:	89 e5                	mov    %esp,%ebp
c00061f3:	53                   	push   %ebx
c00061f4:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c00061fa:	83 ec 08             	sub    $0x8,%esp
c00061fd:	ff 75 08             	pushl  0x8(%ebp)
c0006200:	68 db 9d 00 c0       	push   $0xc0009ddb
c0006205:	e8 56 de ff ff       	call   c0004060 <strcmp>
c000620a:	83 c4 10             	add    $0x10,%esp
c000620d:	85 c0                	test   %eax,%eax
c000620f:	75 10                	jne    c0006221 <do_unlink+0x31>
c0006211:	83 ec 0c             	sub    $0xc,%esp
c0006214:	68 dd 9d 00 c0       	push   $0xc0009ddd
c0006219:	e8 c9 d2 ff ff       	call   c00034e7 <panic>
c000621e:	83 c4 10             	add    $0x10,%esp
c0006221:	83 ec 0c             	sub    $0xc,%esp
c0006224:	ff 75 08             	pushl  0x8(%ebp)
c0006227:	e8 37 f5 ff ff       	call   c0005763 <search_file>
c000622c:	83 c4 10             	add    $0x10,%esp
c000622f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006232:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0006236:	75 10                	jne    c0006248 <do_unlink+0x58>
c0006238:	83 ec 0c             	sub    $0xc,%esp
c000623b:	68 f9 9d 00 c0       	push   $0xc0009df9
c0006240:	e8 a2 d2 ff ff       	call   c00034e7 <panic>
c0006245:	83 c4 10             	add    $0x10,%esp
c0006248:	83 ec 08             	sub    $0x8,%esp
c000624b:	ff 75 d0             	pushl  -0x30(%ebp)
c000624e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0006254:	50                   	push   %eax
c0006255:	e8 05 f7 ff ff       	call   c000595f <get_inode>
c000625a:	83 c4 10             	add    $0x10,%esp
c000625d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006260:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0006264:	75 10                	jne    c0006276 <do_unlink+0x86>
c0006266:	83 ec 0c             	sub    $0xc,%esp
c0006269:	68 f9 9d 00 c0       	push   $0xc0009df9
c000626e:	e8 74 d2 ff ff       	call   c00034e7 <panic>
c0006273:	83 c4 10             	add    $0x10,%esp
c0006276:	8b 45 88             	mov    -0x78(%ebp),%eax
c0006279:	85 c0                	test   %eax,%eax
c000627b:	7e 10                	jle    c000628d <do_unlink+0x9d>
c000627d:	83 ec 0c             	sub    $0xc,%esp
c0006280:	68 14 9e 00 c0       	push   $0xc0009e14
c0006285:	e8 5d d2 ff ff       	call   c00034e7 <panic>
c000628a:	83 c4 10             	add    $0x10,%esp
c000628d:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0006293:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006296:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006299:	8d 50 07             	lea    0x7(%eax),%edx
c000629c:	85 c0                	test   %eax,%eax
c000629e:	0f 48 c2             	cmovs  %edx,%eax
c00062a1:	c1 f8 03             	sar    $0x3,%eax
c00062a4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00062a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00062aa:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00062b0:	85 c0                	test   %eax,%eax
c00062b2:	0f 48 c2             	cmovs  %edx,%eax
c00062b5:	c1 f8 09             	sar    $0x9,%eax
c00062b8:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00062bb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00062be:	99                   	cltd   
c00062bf:	c1 ea 1d             	shr    $0x1d,%edx
c00062c2:	01 d0                	add    %edx,%eax
c00062c4:	83 e0 07             	and    $0x7,%eax
c00062c7:	29 d0                	sub    %edx,%eax
c00062c9:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00062cc:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c00062d3:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00062d8:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00062db:	83 c2 02             	add    $0x2,%edx
c00062de:	83 ec 0c             	sub    $0xc,%esp
c00062e1:	6a 07                	push   $0x7
c00062e3:	68 00 02 00 00       	push   $0x200
c00062e8:	50                   	push   %eax
c00062e9:	ff 75 b8             	pushl  -0x48(%ebp)
c00062ec:	52                   	push   %edx
c00062ed:	e8 fd eb ff ff       	call   c0004eef <rd_wt>
c00062f2:	83 c4 20             	add    $0x20,%esp
c00062f5:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00062fb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00062fe:	01 d0                	add    %edx,%eax
c0006300:	0f b6 10             	movzbl (%eax),%edx
c0006303:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006306:	bb 01 00 00 00       	mov    $0x1,%ebx
c000630b:	89 c1                	mov    %eax,%ecx
c000630d:	d3 e3                	shl    %cl,%ebx
c000630f:	89 d8                	mov    %ebx,%eax
c0006311:	f7 d0                	not    %eax
c0006313:	89 c3                	mov    %eax,%ebx
c0006315:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c000631b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000631e:	01 c8                	add    %ecx,%eax
c0006320:	21 da                	and    %ebx,%edx
c0006322:	88 10                	mov    %dl,(%eax)
c0006324:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006329:	8b 55 c0             	mov    -0x40(%ebp),%edx
c000632c:	83 c2 02             	add    $0x2,%edx
c000632f:	83 ec 0c             	sub    $0xc,%esp
c0006332:	6a 0a                	push   $0xa
c0006334:	68 00 02 00 00       	push   $0x200
c0006339:	50                   	push   %eax
c000633a:	ff 75 b8             	pushl  -0x48(%ebp)
c000633d:	52                   	push   %edx
c000633e:	e8 ac eb ff ff       	call   c0004eef <rd_wt>
c0006343:	83 c4 20             	add    $0x20,%esp
c0006346:	e8 c9 08 00 00       	call   c0006c14 <get_super_block>
c000634b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000634e:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006354:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006357:	8b 00                	mov    (%eax),%eax
c0006359:	29 c2                	sub    %eax,%edx
c000635b:	89 d0                	mov    %edx,%eax
c000635d:	83 c0 01             	add    $0x1,%eax
c0006360:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006363:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006366:	8d 50 07             	lea    0x7(%eax),%edx
c0006369:	85 c0                	test   %eax,%eax
c000636b:	0f 48 c2             	cmovs  %edx,%eax
c000636e:	c1 f8 03             	sar    $0x3,%eax
c0006371:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006374:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006377:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000637d:	85 c0                	test   %eax,%eax
c000637f:	0f 48 c2             	cmovs  %edx,%eax
c0006382:	c1 f8 09             	sar    $0x9,%eax
c0006385:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0006388:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000638b:	99                   	cltd   
c000638c:	c1 ea 1d             	shr    $0x1d,%edx
c000638f:	01 d0                	add    %edx,%eax
c0006391:	83 e0 07             	and    $0x7,%eax
c0006394:	29 d0                	sub    %edx,%eax
c0006396:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0006399:	b8 08 00 00 00       	mov    $0x8,%eax
c000639e:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c00063a1:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00063a4:	29 c2                	sub    %eax,%edx
c00063a6:	89 d0                	mov    %edx,%eax
c00063a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00063ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00063ae:	8d 50 07             	lea    0x7(%eax),%edx
c00063b1:	85 c0                	test   %eax,%eax
c00063b3:	0f 48 c2             	cmovs  %edx,%eax
c00063b6:	c1 f8 03             	sar    $0x3,%eax
c00063b9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00063bc:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00063c1:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c00063c4:	8b 52 04             	mov    0x4(%edx),%edx
c00063c7:	8d 4a 02             	lea    0x2(%edx),%ecx
c00063ca:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00063cd:	01 ca                	add    %ecx,%edx
c00063cf:	83 ec 0c             	sub    $0xc,%esp
c00063d2:	6a 07                	push   $0x7
c00063d4:	68 00 02 00 00       	push   $0x200
c00063d9:	50                   	push   %eax
c00063da:	ff 75 b8             	pushl  -0x48(%ebp)
c00063dd:	52                   	push   %edx
c00063de:	e8 0c eb ff ff       	call   c0004eef <rd_wt>
c00063e3:	83 c4 20             	add    $0x20,%esp
c00063e6:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00063ec:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00063ef:	01 d0                	add    %edx,%eax
c00063f1:	0f b6 10             	movzbl (%eax),%edx
c00063f4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00063f7:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00063fc:	89 c1                	mov    %eax,%ecx
c00063fe:	d3 e3                	shl    %cl,%ebx
c0006400:	89 d8                	mov    %ebx,%eax
c0006402:	f7 d0                	not    %eax
c0006404:	89 c3                	mov    %eax,%ebx
c0006406:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c000640c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000640f:	01 c8                	add    %ecx,%eax
c0006411:	21 da                	and    %ebx,%edx
c0006413:	88 10                	mov    %dl,(%eax)
c0006415:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000641c:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000641f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006422:	eb 6a                	jmp    c000648e <do_unlink+0x29e>
c0006424:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c000642b:	75 4b                	jne    c0006478 <do_unlink+0x288>
c000642d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006434:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006439:	83 ec 0c             	sub    $0xc,%esp
c000643c:	6a 0a                	push   $0xa
c000643e:	68 00 02 00 00       	push   $0x200
c0006443:	50                   	push   %eax
c0006444:	ff 75 b8             	pushl  -0x48(%ebp)
c0006447:	ff 75 ec             	pushl  -0x14(%ebp)
c000644a:	e8 a0 ea ff ff       	call   c0004eef <rd_wt>
c000644f:	83 c4 20             	add    $0x20,%esp
c0006452:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006458:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000645b:	8d 48 01             	lea    0x1(%eax),%ecx
c000645e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0006461:	83 ec 0c             	sub    $0xc,%esp
c0006464:	6a 07                	push   $0x7
c0006466:	68 00 02 00 00       	push   $0x200
c000646b:	52                   	push   %edx
c000646c:	ff 75 b8             	pushl  -0x48(%ebp)
c000646f:	50                   	push   %eax
c0006470:	e8 7a ea ff ff       	call   c0004eef <rd_wt>
c0006475:	83 c4 20             	add    $0x20,%esp
c0006478:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000647e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006481:	01 d0                	add    %edx,%eax
c0006483:	c6 00 00             	movb   $0x0,(%eax)
c0006486:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000648a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c000648e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006491:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0006494:	7c 8e                	jl     c0006424 <do_unlink+0x234>
c0006496:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c000649d:	75 4b                	jne    c00064ea <do_unlink+0x2fa>
c000649f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00064a6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00064ab:	83 ec 0c             	sub    $0xc,%esp
c00064ae:	6a 0a                	push   $0xa
c00064b0:	68 00 02 00 00       	push   $0x200
c00064b5:	50                   	push   %eax
c00064b6:	ff 75 b8             	pushl  -0x48(%ebp)
c00064b9:	ff 75 ec             	pushl  -0x14(%ebp)
c00064bc:	e8 2e ea ff ff       	call   c0004eef <rd_wt>
c00064c1:	83 c4 20             	add    $0x20,%esp
c00064c4:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00064ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00064cd:	8d 48 01             	lea    0x1(%eax),%ecx
c00064d0:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c00064d3:	83 ec 0c             	sub    $0xc,%esp
c00064d6:	6a 07                	push   $0x7
c00064d8:	68 00 02 00 00       	push   $0x200
c00064dd:	52                   	push   %edx
c00064de:	ff 75 b8             	pushl  -0x48(%ebp)
c00064e1:	50                   	push   %eax
c00064e2:	e8 08 ea ff ff       	call   c0004eef <rd_wt>
c00064e7:	83 c4 20             	add    $0x20,%esp
c00064ea:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00064f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064f3:	01 d0                	add    %edx,%eax
c00064f5:	0f b6 10             	movzbl (%eax),%edx
c00064f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00064fb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0006500:	89 c1                	mov    %eax,%ecx
c0006502:	d3 e3                	shl    %cl,%ebx
c0006504:	89 d8                	mov    %ebx,%eax
c0006506:	89 c3                	mov    %eax,%ebx
c0006508:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c000650e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006511:	01 c8                	add    %ecx,%eax
c0006513:	21 da                	and    %ebx,%edx
c0006515:	88 10                	mov    %dl,(%eax)
c0006517:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000651c:	83 ec 0c             	sub    $0xc,%esp
c000651f:	6a 0a                	push   $0xa
c0006521:	68 00 02 00 00       	push   $0x200
c0006526:	50                   	push   %eax
c0006527:	ff 75 b8             	pushl  -0x48(%ebp)
c000652a:	ff 75 ec             	pushl  -0x14(%ebp)
c000652d:	e8 bd e9 ff ff       	call   c0004eef <rd_wt>
c0006532:	83 c4 20             	add    $0x20,%esp
c0006535:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c000653c:	00 00 00 
c000653f:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0006546:	00 00 00 
c0006549:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0006550:	00 00 00 
c0006553:	83 ec 0c             	sub    $0xc,%esp
c0006556:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000655c:	50                   	push   %eax
c000655d:	e8 ce 04 00 00       	call   c0006a30 <sync_inode>
c0006562:	83 c4 10             	add    $0x10,%esp
c0006565:	83 ec 0c             	sub    $0xc,%esp
c0006568:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000656e:	50                   	push   %eax
c000656f:	e8 10 06 00 00       	call   c0006b84 <put_inode>
c0006574:	83 c4 10             	add    $0x10,%esp
c0006577:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000657a:	8b 00                	mov    (%eax),%eax
c000657c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000657f:	c7 45 98 60 31 01 c0 	movl   $0xc0013160,-0x68(%ebp)
c0006586:	8b 45 98             	mov    -0x68(%ebp),%eax
c0006589:	8b 40 04             	mov    0x4(%eax),%eax
c000658c:	89 45 94             	mov    %eax,-0x6c(%ebp)
c000658f:	8b 45 98             	mov    -0x68(%ebp),%eax
c0006592:	8b 40 0c             	mov    0xc(%eax),%eax
c0006595:	89 45 90             	mov    %eax,-0x70(%ebp)
c0006598:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000659b:	c1 e8 04             	shr    $0x4,%eax
c000659e:	89 45 8c             	mov    %eax,-0x74(%ebp)
c00065a1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00065a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00065af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00065b6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00065bd:	e9 a3 00 00 00       	jmp    c0006665 <do_unlink+0x475>
c00065c2:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00065c7:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c00065ca:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00065cd:	01 ca                	add    %ecx,%edx
c00065cf:	83 ec 0c             	sub    $0xc,%esp
c00065d2:	6a 07                	push   $0x7
c00065d4:	68 00 02 00 00       	push   $0x200
c00065d9:	50                   	push   %eax
c00065da:	ff 75 b8             	pushl  -0x48(%ebp)
c00065dd:	52                   	push   %edx
c00065de:	e8 0c e9 ff ff       	call   c0004eef <rd_wt>
c00065e3:	83 c4 20             	add    $0x20,%esp
c00065e6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00065eb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00065ee:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00065f5:	eb 51                	jmp    c0006648 <do_unlink+0x458>
c00065f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00065fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00065fe:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0006601:	7f 4f                	jg     c0006652 <do_unlink+0x462>
c0006603:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006606:	83 c0 10             	add    $0x10,%eax
c0006609:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000660c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000660f:	83 c0 04             	add    $0x4,%eax
c0006612:	83 ec 08             	sub    $0x8,%esp
c0006615:	ff 75 08             	pushl  0x8(%ebp)
c0006618:	50                   	push   %eax
c0006619:	e8 42 da ff ff       	call   c0004060 <strcmp>
c000661e:	83 c4 10             	add    $0x10,%esp
c0006621:	85 c0                	test   %eax,%eax
c0006623:	75 1b                	jne    c0006640 <do_unlink+0x450>
c0006625:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000662c:	83 ec 04             	sub    $0x4,%esp
c000662f:	6a 10                	push   $0x10
c0006631:	6a 00                	push   $0x0
c0006633:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006636:	e8 54 39 00 00       	call   c0009f8f <Memset>
c000663b:	83 c4 10             	add    $0x10,%esp
c000663e:	eb 13                	jmp    c0006653 <do_unlink+0x463>
c0006640:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0006644:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0006648:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000664b:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000664e:	7c a7                	jl     c00065f7 <do_unlink+0x407>
c0006650:	eb 01                	jmp    c0006653 <do_unlink+0x463>
c0006652:	90                   	nop
c0006653:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006656:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0006659:	7f 16                	jg     c0006671 <do_unlink+0x481>
c000665b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000665f:	75 10                	jne    c0006671 <do_unlink+0x481>
c0006661:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0006665:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006668:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000666b:	0f 8c 51 ff ff ff    	jl     c00065c2 <do_unlink+0x3d2>
c0006671:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006674:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0006677:	75 17                	jne    c0006690 <do_unlink+0x4a0>
c0006679:	8b 45 98             	mov    -0x68(%ebp),%eax
c000667c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000667f:	89 50 04             	mov    %edx,0x4(%eax)
c0006682:	83 ec 0c             	sub    $0xc,%esp
c0006685:	ff 75 98             	pushl  -0x68(%ebp)
c0006688:	e8 a3 03 00 00       	call   c0006a30 <sync_inode>
c000668d:	83 c4 10             	add    $0x10,%esp
c0006690:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006694:	74 24                	je     c00066ba <do_unlink+0x4ca>
c0006696:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000669b:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c000669e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00066a1:	01 ca                	add    %ecx,%edx
c00066a3:	83 ec 0c             	sub    $0xc,%esp
c00066a6:	6a 0a                	push   $0xa
c00066a8:	68 00 02 00 00       	push   $0x200
c00066ad:	50                   	push   %eax
c00066ae:	ff 75 b8             	pushl  -0x48(%ebp)
c00066b1:	52                   	push   %edx
c00066b2:	e8 38 e8 ff ff       	call   c0004eef <rd_wt>
c00066b7:	83 c4 20             	add    $0x20,%esp
c00066ba:	90                   	nop
c00066bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00066be:	c9                   	leave  
c00066bf:	c3                   	ret    

c00066c0 <do_rdwt>:
c00066c0:	55                   	push   %ebp
c00066c1:	89 e5                	mov    %esp,%ebp
c00066c3:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c00066c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00066cc:	8b 40 68             	mov    0x68(%eax),%eax
c00066cf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00066d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00066d5:	8b 40 50             	mov    0x50(%eax),%eax
c00066d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00066db:	8b 45 08             	mov    0x8(%ebp),%eax
c00066de:	8b 40 5c             	mov    0x5c(%eax),%eax
c00066e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00066e4:	8b 45 08             	mov    0x8(%ebp),%eax
c00066e7:	8b 00                	mov    (%eax),%eax
c00066e9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00066ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00066ef:	8b 40 10             	mov    0x10(%eax),%eax
c00066f2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00066f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00066f8:	8b 40 40             	mov    0x40(%eax),%eax
c00066fb:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00066fe:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006701:	6b d0 6a             	imul   $0x6a,%eax,%edx
c0006704:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006707:	01 d0                	add    %edx,%eax
c0006709:	83 c0 20             	add    $0x20,%eax
c000670c:	8b 04 85 a4 31 08 c0 	mov    -0x3ff7ce5c(,%eax,4),%eax
c0006713:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006716:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006719:	8b 40 08             	mov    0x8(%eax),%eax
c000671c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000671f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006722:	8b 00                	mov    (%eax),%eax
c0006724:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006727:	83 ec 08             	sub    $0x8,%esp
c000672a:	ff 75 c0             	pushl  -0x40(%ebp)
c000672d:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0006733:	50                   	push   %eax
c0006734:	e8 26 f2 ff ff       	call   c000595f <get_inode>
c0006739:	83 c4 10             	add    $0x10,%esp
c000673c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000673f:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c0006743:	75 10                	jne    c0006755 <do_rdwt+0x95>
c0006745:	83 ec 0c             	sub    $0xc,%esp
c0006748:	68 4c 9e 00 c0       	push   $0xc0009e4c
c000674d:	e8 95 cd ff ff       	call   c00034e7 <panic>
c0006752:	83 c4 10             	add    $0x10,%esp
c0006755:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000675b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000675e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006761:	8b 40 04             	mov    0x4(%eax),%eax
c0006764:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006767:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c000676b:	74 22                	je     c000678f <do_rdwt+0xcf>
c000676d:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0006771:	74 1c                	je     c000678f <do_rdwt+0xcf>
c0006773:	68 ba 04 00 00       	push   $0x4ba
c0006778:	68 30 9d 00 c0       	push   $0xc0009d30
c000677d:	68 30 9d 00 c0       	push   $0xc0009d30
c0006782:	68 5c 9e 00 c0       	push   $0xc0009e5c
c0006787:	e8 79 cd ff ff       	call   c0003505 <assertion_failure>
c000678c:	83 c4 10             	add    $0x10,%esp
c000678f:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c0006795:	83 f8 01             	cmp    $0x1,%eax
c0006798:	75 4a                	jne    c00067e4 <do_rdwt+0x124>
c000679a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000679e:	75 09                	jne    c00067a9 <do_rdwt+0xe9>
c00067a0:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c00067a7:	eb 0d                	jmp    c00067b6 <do_rdwt+0xf6>
c00067a9:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00067ad:	75 07                	jne    c00067b6 <do_rdwt+0xf6>
c00067af:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c00067b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00067b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00067bc:	89 50 68             	mov    %edx,0x68(%eax)
c00067bf:	8b 55 bc             	mov    -0x44(%ebp),%edx
c00067c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00067c5:	89 50 58             	mov    %edx,0x58(%eax)
c00067c8:	83 ec 04             	sub    $0x4,%esp
c00067cb:	6a 00                	push   $0x0
c00067cd:	ff 75 08             	pushl  0x8(%ebp)
c00067d0:	6a 03                	push   $0x3
c00067d2:	e8 9a d5 ff ff       	call   c0003d71 <send_rec>
c00067d7:	83 c4 10             	add    $0x10,%esp
c00067da:	b8 00 00 00 00       	mov    $0x0,%eax
c00067df:	e9 4a 02 00 00       	jmp    c0006a2e <do_rdwt+0x36e>
c00067e4:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00067e8:	75 12                	jne    c00067fc <do_rdwt+0x13c>
c00067ea:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00067ed:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
c00067f0:	75 0a                	jne    c00067fc <do_rdwt+0x13c>
c00067f2:	b8 00 00 00 00       	mov    $0x0,%eax
c00067f7:	e9 32 02 00 00       	jmp    c0006a2e <do_rdwt+0x36e>
c00067fc:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0006800:	75 18                	jne    c000681a <do_rdwt+0x15a>
c0006802:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006808:	c1 e0 09             	shl    $0x9,%eax
c000680b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c000680e:	75 0a                	jne    c000681a <do_rdwt+0x15a>
c0006810:	b8 00 00 00 00       	mov    $0x0,%eax
c0006815:	e9 14 02 00 00       	jmp    c0006a2e <do_rdwt+0x36e>
c000681a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000681e:	75 14                	jne    c0006834 <do_rdwt+0x174>
c0006820:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006823:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006826:	01 d0                	add    %edx,%eax
c0006828:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c000682b:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
c000682f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006832:	eb 19                	jmp    c000684d <do_rdwt+0x18d>
c0006834:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006837:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000683a:	01 c2                	add    %eax,%edx
c000683c:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006842:	c1 e0 09             	shl    $0x9,%eax
c0006845:	39 c2                	cmp    %eax,%edx
c0006847:	0f 4e c2             	cmovle %edx,%eax
c000684a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000684d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006850:	99                   	cltd   
c0006851:	c1 ea 17             	shr    $0x17,%edx
c0006854:	01 d0                	add    %edx,%eax
c0006856:	25 ff 01 00 00       	and    $0x1ff,%eax
c000685b:	29 d0                	sub    %edx,%eax
c000685d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006860:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006866:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006869:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c000686f:	85 c0                	test   %eax,%eax
c0006871:	0f 48 c1             	cmovs  %ecx,%eax
c0006874:	c1 f8 09             	sar    $0x9,%eax
c0006877:	01 d0                	add    %edx,%eax
c0006879:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000687c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006882:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006885:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c000688b:	85 c0                	test   %eax,%eax
c000688d:	0f 48 c1             	cmovs  %ecx,%eax
c0006890:	c1 f8 09             	sar    $0x9,%eax
c0006893:	01 d0                	add    %edx,%eax
c0006895:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0006898:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000689b:	2b 45 ac             	sub    -0x54(%ebp),%eax
c000689e:	ba 00 00 10 00       	mov    $0x100000,%edx
c00068a3:	39 d0                	cmp    %edx,%eax
c00068a5:	7d 0b                	jge    c00068b2 <do_rdwt+0x1f2>
c00068a7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00068aa:	2b 45 ac             	sub    -0x54(%ebp),%eax
c00068ad:	83 c0 01             	add    $0x1,%eax
c00068b0:	eb 05                	jmp    c00068b7 <do_rdwt+0x1f7>
c00068b2:	b8 00 00 10 00       	mov    $0x100000,%eax
c00068b7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00068ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00068bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00068c0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00068c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00068ca:	8b 00                	mov    (%eax),%eax
c00068cc:	83 ec 0c             	sub    $0xc,%esp
c00068cf:	50                   	push   %eax
c00068d0:	e8 6b 05 00 00       	call   c0006e40 <pid2proc>
c00068d5:	83 c4 10             	add    $0x10,%esp
c00068d8:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00068db:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00068de:	8b 40 0c             	mov    0xc(%eax),%eax
c00068e1:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00068e4:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00068e7:	83 ec 08             	sub    $0x8,%esp
c00068ea:	ff 75 a0             	pushl  -0x60(%ebp)
c00068ed:	50                   	push   %eax
c00068ee:	e8 36 06 00 00       	call   c0006f29 <Seg2PhyAddrLDT>
c00068f3:	83 c4 10             	add    $0x10,%esp
c00068f6:	89 45 98             	mov    %eax,-0x68(%ebp)
c00068f9:	8b 55 98             	mov    -0x68(%ebp),%edx
c00068fc:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00068ff:	01 d0                	add    %edx,%eax
c0006901:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0006904:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006907:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000690a:	e9 c7 00 00 00       	jmp    c00069d6 <do_rdwt+0x316>
c000690f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006912:	c1 e0 09             	shl    $0x9,%eax
c0006915:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0006918:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000691b:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c000691f:	89 45 90             	mov    %eax,-0x70(%ebp)
c0006922:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
c0006929:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000692c:	c1 e0 09             	shl    $0x9,%eax
c000692f:	89 c2                	mov    %eax,%edx
c0006931:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006936:	83 ec 0c             	sub    $0xc,%esp
c0006939:	6a 07                	push   $0x7
c000693b:	52                   	push   %edx
c000693c:	50                   	push   %eax
c000693d:	ff 75 8c             	pushl  -0x74(%ebp)
c0006940:	ff 75 e0             	pushl  -0x20(%ebp)
c0006943:	e8 a7 e5 ff ff       	call   c0004eef <rd_wt>
c0006948:	83 c4 20             	add    $0x20,%esp
c000694b:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000694f:	75 25                	jne    c0006976 <do_rdwt+0x2b6>
c0006951:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006957:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000695a:	01 d0                	add    %edx,%eax
c000695c:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c000695f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006962:	01 ca                	add    %ecx,%edx
c0006964:	83 ec 04             	sub    $0x4,%esp
c0006967:	ff 75 90             	pushl  -0x70(%ebp)
c000696a:	50                   	push   %eax
c000696b:	52                   	push   %edx
c000696c:	e8 f0 35 00 00       	call   c0009f61 <Memcpy>
c0006971:	83 c4 10             	add    $0x10,%esp
c0006974:	eb 47                	jmp    c00069bd <do_rdwt+0x2fd>
c0006976:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0006979:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000697c:	01 d0                	add    %edx,%eax
c000697e:	89 c1                	mov    %eax,%ecx
c0006980:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006986:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006989:	01 d0                	add    %edx,%eax
c000698b:	83 ec 04             	sub    $0x4,%esp
c000698e:	ff 75 90             	pushl  -0x70(%ebp)
c0006991:	51                   	push   %ecx
c0006992:	50                   	push   %eax
c0006993:	e8 c9 35 00 00       	call   c0009f61 <Memcpy>
c0006998:	83 c4 10             	add    $0x10,%esp
c000699b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000699e:	c1 e0 09             	shl    $0x9,%eax
c00069a1:	89 c2                	mov    %eax,%edx
c00069a3:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00069a8:	83 ec 0c             	sub    $0xc,%esp
c00069ab:	6a 0a                	push   $0xa
c00069ad:	52                   	push   %edx
c00069ae:	50                   	push   %eax
c00069af:	ff 75 8c             	pushl  -0x74(%ebp)
c00069b2:	ff 75 e0             	pushl  -0x20(%ebp)
c00069b5:	e8 35 e5 ff ff       	call   c0004eef <rd_wt>
c00069ba:	83 c4 20             	add    $0x20,%esp
c00069bd:	8b 45 90             	mov    -0x70(%ebp),%eax
c00069c0:	29 45 e8             	sub    %eax,-0x18(%ebp)
c00069c3:	8b 45 90             	mov    -0x70(%ebp),%eax
c00069c6:	01 45 e4             	add    %eax,-0x1c(%ebp)
c00069c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00069d0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00069d3:	01 45 e0             	add    %eax,-0x20(%ebp)
c00069d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00069d9:	3b 45 a8             	cmp    -0x58(%ebp),%eax
c00069dc:	7f 0a                	jg     c00069e8 <do_rdwt+0x328>
c00069de:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00069e2:	0f 85 27 ff ff ff    	jne    c000690f <do_rdwt+0x24f>
c00069e8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00069eb:	8b 50 04             	mov    0x4(%eax),%edx
c00069ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00069f1:	01 c2                	add    %eax,%edx
c00069f3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00069f6:	89 50 04             	mov    %edx,0x4(%eax)
c00069f9:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00069fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00069ff:	01 c2                	add    %eax,%edx
c0006a01:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0006a07:	39 c2                	cmp    %eax,%edx
c0006a09:	7e 20                	jle    c0006a2b <do_rdwt+0x36b>
c0006a0b:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006a0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006a11:	01 d0                	add    %edx,%eax
c0006a13:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0006a19:	83 ec 0c             	sub    $0xc,%esp
c0006a1c:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0006a22:	50                   	push   %eax
c0006a23:	e8 08 00 00 00       	call   c0006a30 <sync_inode>
c0006a28:	83 c4 10             	add    $0x10,%esp
c0006a2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006a2e:	c9                   	leave  
c0006a2f:	c3                   	ret    

c0006a30 <sync_inode>:
c0006a30:	55                   	push   %ebp
c0006a31:	89 e5                	mov    %esp,%ebp
c0006a33:	53                   	push   %ebx
c0006a34:	83 ec 34             	sub    $0x34,%esp
c0006a37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006a3e:	eb 74                	jmp    c0006ab4 <sync_inode+0x84>
c0006a40:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a43:	89 d0                	mov    %edx,%eax
c0006a45:	c1 e0 02             	shl    $0x2,%eax
c0006a48:	01 d0                	add    %edx,%eax
c0006a4a:	c1 e0 03             	shl    $0x3,%eax
c0006a4d:	05 70 27 01 c0       	add    $0xc0012770,%eax
c0006a52:	8b 10                	mov    (%eax),%edx
c0006a54:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a57:	8b 40 10             	mov    0x10(%eax),%eax
c0006a5a:	39 c2                	cmp    %eax,%edx
c0006a5c:	75 52                	jne    c0006ab0 <sync_inode+0x80>
c0006a5e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a61:	89 d0                	mov    %edx,%eax
c0006a63:	c1 e0 02             	shl    $0x2,%eax
c0006a66:	01 d0                	add    %edx,%eax
c0006a68:	c1 e0 03             	shl    $0x3,%eax
c0006a6b:	8d 90 60 27 01 c0    	lea    -0x3ffed8a0(%eax),%edx
c0006a71:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a74:	8b 08                	mov    (%eax),%ecx
c0006a76:	89 0a                	mov    %ecx,(%edx)
c0006a78:	8b 48 04             	mov    0x4(%eax),%ecx
c0006a7b:	89 4a 04             	mov    %ecx,0x4(%edx)
c0006a7e:	8b 48 08             	mov    0x8(%eax),%ecx
c0006a81:	89 4a 08             	mov    %ecx,0x8(%edx)
c0006a84:	8b 48 0c             	mov    0xc(%eax),%ecx
c0006a87:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0006a8a:	8b 48 10             	mov    0x10(%eax),%ecx
c0006a8d:	89 4a 10             	mov    %ecx,0x10(%edx)
c0006a90:	8b 48 14             	mov    0x14(%eax),%ecx
c0006a93:	89 4a 14             	mov    %ecx,0x14(%edx)
c0006a96:	8b 48 18             	mov    0x18(%eax),%ecx
c0006a99:	89 4a 18             	mov    %ecx,0x18(%edx)
c0006a9c:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0006a9f:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0006aa2:	8b 48 20             	mov    0x20(%eax),%ecx
c0006aa5:	89 4a 20             	mov    %ecx,0x20(%edx)
c0006aa8:	8b 40 24             	mov    0x24(%eax),%eax
c0006aab:	89 42 24             	mov    %eax,0x24(%edx)
c0006aae:	eb 0a                	jmp    c0006aba <sync_inode+0x8a>
c0006ab0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006ab4:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0006ab8:	7e 86                	jle    c0006a40 <sync_inode+0x10>
c0006aba:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0006ac1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ac4:	8b 40 10             	mov    0x10(%eax),%eax
c0006ac7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006aca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006acd:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0006ad0:	b8 00 02 00 00       	mov    $0x200,%eax
c0006ad5:	99                   	cltd   
c0006ad6:	f7 7d f0             	idivl  -0x10(%ebp)
c0006ad9:	89 c3                	mov    %eax,%ebx
c0006adb:	89 c8                	mov    %ecx,%eax
c0006add:	99                   	cltd   
c0006ade:	f7 fb                	idiv   %ebx
c0006ae0:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0006ae3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ae6:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0006ae9:	b8 00 02 00 00       	mov    $0x200,%eax
c0006aee:	99                   	cltd   
c0006aef:	f7 7d f0             	idivl  -0x10(%ebp)
c0006af2:	89 c3                	mov    %eax,%ebx
c0006af4:	89 c8                	mov    %ecx,%eax
c0006af6:	99                   	cltd   
c0006af7:	f7 fb                	idiv   %ebx
c0006af9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006afc:	8b 45 08             	mov    0x8(%ebp),%eax
c0006aff:	8b 40 20             	mov    0x20(%eax),%eax
c0006b02:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006b05:	e8 0a 01 00 00       	call   c0006c14 <get_super_block>
c0006b0a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006b0d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006b10:	8b 40 04             	mov    0x4(%eax),%eax
c0006b13:	8d 50 02             	lea    0x2(%eax),%edx
c0006b16:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006b19:	8b 40 08             	mov    0x8(%eax),%eax
c0006b1c:	01 c2                	add    %eax,%edx
c0006b1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006b21:	01 d0                	add    %edx,%eax
c0006b23:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006b26:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006b2b:	83 ec 0c             	sub    $0xc,%esp
c0006b2e:	6a 07                	push   $0x7
c0006b30:	68 00 02 00 00       	push   $0x200
c0006b35:	50                   	push   %eax
c0006b36:	ff 75 e0             	pushl  -0x20(%ebp)
c0006b39:	ff 75 d8             	pushl  -0x28(%ebp)
c0006b3c:	e8 ae e3 ff ff       	call   c0004eef <rd_wt>
c0006b41:	83 c4 20             	add    $0x20,%esp
c0006b44:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006b49:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006b4c:	83 ec 04             	sub    $0x4,%esp
c0006b4f:	ff 75 f0             	pushl  -0x10(%ebp)
c0006b52:	ff 75 08             	pushl  0x8(%ebp)
c0006b55:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006b58:	e8 04 34 00 00       	call   c0009f61 <Memcpy>
c0006b5d:	83 c4 10             	add    $0x10,%esp
c0006b60:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006b65:	83 ec 0c             	sub    $0xc,%esp
c0006b68:	6a 0a                	push   $0xa
c0006b6a:	68 00 02 00 00       	push   $0x200
c0006b6f:	50                   	push   %eax
c0006b70:	ff 75 e0             	pushl  -0x20(%ebp)
c0006b73:	ff 75 d8             	pushl  -0x28(%ebp)
c0006b76:	e8 74 e3 ff ff       	call   c0004eef <rd_wt>
c0006b7b:	83 c4 20             	add    $0x20,%esp
c0006b7e:	90                   	nop
c0006b7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0006b82:	c9                   	leave  
c0006b83:	c3                   	ret    

c0006b84 <put_inode>:
c0006b84:	55                   	push   %ebp
c0006b85:	89 e5                	mov    %esp,%ebp
c0006b87:	83 ec 08             	sub    $0x8,%esp
c0006b8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b8d:	8b 40 24             	mov    0x24(%eax),%eax
c0006b90:	85 c0                	test   %eax,%eax
c0006b92:	7f 1c                	jg     c0006bb0 <put_inode+0x2c>
c0006b94:	68 54 05 00 00       	push   $0x554
c0006b99:	68 30 9d 00 c0       	push   $0xc0009d30
c0006b9e:	68 30 9d 00 c0       	push   $0xc0009d30
c0006ba3:	68 90 9e 00 c0       	push   $0xc0009e90
c0006ba8:	e8 58 c9 ff ff       	call   c0003505 <assertion_failure>
c0006bad:	83 c4 10             	add    $0x10,%esp
c0006bb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bb3:	8b 40 24             	mov    0x24(%eax),%eax
c0006bb6:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006bb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bbc:	89 50 24             	mov    %edx,0x24(%eax)
c0006bbf:	90                   	nop
c0006bc0:	c9                   	leave  
c0006bc1:	c3                   	ret    

c0006bc2 <do_close>:
c0006bc2:	55                   	push   %ebp
c0006bc3:	89 e5                	mov    %esp,%ebp
c0006bc5:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c0006bca:	8b 55 08             	mov    0x8(%ebp),%edx
c0006bcd:	83 c2 20             	add    $0x20,%edx
c0006bd0:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0006bd4:	8b 50 0c             	mov    0xc(%eax),%edx
c0006bd7:	83 ea 01             	sub    $0x1,%edx
c0006bda:	89 50 0c             	mov    %edx,0xc(%eax)
c0006bdd:	8b 40 0c             	mov    0xc(%eax),%eax
c0006be0:	85 c0                	test   %eax,%eax
c0006be2:	75 16                	jne    c0006bfa <do_close+0x38>
c0006be4:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c0006be9:	8b 55 08             	mov    0x8(%ebp),%edx
c0006bec:	83 c2 20             	add    $0x20,%edx
c0006bef:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0006bf3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0006bfa:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c0006bff:	8b 55 08             	mov    0x8(%ebp),%edx
c0006c02:	83 c2 20             	add    $0x20,%edx
c0006c05:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
c0006c0c:	00 
c0006c0d:	b8 00 00 00 00       	mov    $0x0,%eax
c0006c12:	5d                   	pop    %ebp
c0006c13:	c3                   	ret    

c0006c14 <get_super_block>:
c0006c14:	55                   	push   %ebp
c0006c15:	89 e5                	mov    %esp,%ebp
c0006c17:	83 ec 08             	sub    $0x8,%esp
c0006c1a:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0006c1f:	83 ec 0c             	sub    $0xc,%esp
c0006c22:	6a 07                	push   $0x7
c0006c24:	68 00 02 00 00       	push   $0x200
c0006c29:	50                   	push   %eax
c0006c2a:	6a 20                	push   $0x20
c0006c2c:	6a 01                	push   $0x1
c0006c2e:	e8 bc e2 ff ff       	call   c0004eef <rd_wt>
c0006c33:	83 c4 20             	add    $0x20,%esp
c0006c36:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0006c3c:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c0006c41:	8b 0a                	mov    (%edx),%ecx
c0006c43:	89 08                	mov    %ecx,(%eax)
c0006c45:	8b 4a 04             	mov    0x4(%edx),%ecx
c0006c48:	89 48 04             	mov    %ecx,0x4(%eax)
c0006c4b:	8b 4a 08             	mov    0x8(%edx),%ecx
c0006c4e:	89 48 08             	mov    %ecx,0x8(%eax)
c0006c51:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0006c54:	89 48 0c             	mov    %ecx,0xc(%eax)
c0006c57:	8b 4a 10             	mov    0x10(%edx),%ecx
c0006c5a:	89 48 10             	mov    %ecx,0x10(%eax)
c0006c5d:	8b 4a 14             	mov    0x14(%edx),%ecx
c0006c60:	89 48 14             	mov    %ecx,0x14(%eax)
c0006c63:	8b 4a 18             	mov    0x18(%edx),%ecx
c0006c66:	89 48 18             	mov    %ecx,0x18(%eax)
c0006c69:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0006c6c:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0006c6f:	8b 52 20             	mov    0x20(%edx),%edx
c0006c72:	89 50 20             	mov    %edx,0x20(%eax)
c0006c75:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c0006c7a:	c9                   	leave  
c0006c7b:	c3                   	ret    

c0006c7c <check>:
c0006c7c:	55                   	push   %ebp
c0006c7d:	89 e5                	mov    %esp,%ebp
c0006c7f:	83 ec 18             	sub    $0x18,%esp
c0006c82:	c7 45 f4 a0 31 08 c0 	movl   $0xc00831a0,-0xc(%ebp)
c0006c89:	eb 59                	jmp    c0006ce4 <check+0x68>
c0006c8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c8e:	8b 80 9c 01 00 00    	mov    0x19c(%eax),%eax
c0006c94:	85 c0                	test   %eax,%eax
c0006c96:	74 45                	je     c0006cdd <check+0x61>
c0006c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c9b:	8b 80 9c 01 00 00    	mov    0x19c(%eax),%eax
c0006ca1:	83 f8 01             	cmp    $0x1,%eax
c0006ca4:	74 37                	je     c0006cdd <check+0x61>
c0006ca6:	c7 05 40 f7 00 c0 02 	movl   $0x2802,0xc000f740
c0006cad:	28 00 00 
c0006cb0:	83 ec 08             	sub    $0x8,%esp
c0006cb3:	6a 0a                	push   $0xa
c0006cb5:	68 9f 9e 00 c0       	push   $0xc0009e9f
c0006cba:	e8 08 a9 ff ff       	call   c00015c7 <disp_str_colour>
c0006cbf:	83 c4 10             	add    $0x10,%esp
c0006cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cc5:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0006ccc:	0f be c0             	movsbl %al,%eax
c0006ccf:	83 ec 0c             	sub    $0xc,%esp
c0006cd2:	50                   	push   %eax
c0006cd3:	e8 99 ae ff ff       	call   c0001b71 <disp_int>
c0006cd8:	83 c4 10             	add    $0x10,%esp
c0006cdb:	eb fe                	jmp    c0006cdb <check+0x5f>
c0006cdd:	81 45 f4 a8 01 00 00 	addl   $0x1a8,-0xc(%ebp)
c0006ce4:	b8 e8 39 08 c0       	mov    $0xc00839e8,%eax
c0006ce9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0006cec:	72 9d                	jb     c0006c8b <check+0xf>
c0006cee:	90                   	nop
c0006cef:	c9                   	leave  
c0006cf0:	c3                   	ret    

c0006cf1 <schedule_process>:
c0006cf1:	55                   	push   %ebp
c0006cf2:	89 e5                	mov    %esp,%ebp
c0006cf4:	83 ec 10             	sub    $0x10,%esp
c0006cf7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0006cfe:	eb 7e                	jmp    c0006d7e <schedule_process+0x8d>
c0006d00:	c7 45 fc a0 31 08 c0 	movl   $0xc00831a0,-0x4(%ebp)
c0006d07:	eb 31                	jmp    c0006d3a <schedule_process+0x49>
c0006d09:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d0c:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0006d13:	84 c0                	test   %al,%al
c0006d15:	75 1c                	jne    c0006d33 <schedule_process+0x42>
c0006d17:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d1a:	8b 40 5c             	mov    0x5c(%eax),%eax
c0006d1d:	39 45 f8             	cmp    %eax,-0x8(%ebp)
c0006d20:	73 11                	jae    c0006d33 <schedule_process+0x42>
c0006d22:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d25:	8b 40 5c             	mov    0x5c(%eax),%eax
c0006d28:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d2e:	a3 60 fb 00 c0       	mov    %eax,0xc000fb60
c0006d33:	81 45 fc a8 01 00 00 	addl   $0x1a8,-0x4(%ebp)
c0006d3a:	b8 90 70 08 c0       	mov    $0xc0087090,%eax
c0006d3f:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c0006d42:	72 c5                	jb     c0006d09 <schedule_process+0x18>
c0006d44:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c0006d48:	75 34                	jne    c0006d7e <schedule_process+0x8d>
c0006d4a:	c7 45 fc a0 31 08 c0 	movl   $0xc00831a0,-0x4(%ebp)
c0006d51:	eb 21                	jmp    c0006d74 <schedule_process+0x83>
c0006d53:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d56:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0006d5d:	84 c0                	test   %al,%al
c0006d5f:	75 0c                	jne    c0006d6d <schedule_process+0x7c>
c0006d61:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d64:	8b 50 60             	mov    0x60(%eax),%edx
c0006d67:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d6a:	89 50 5c             	mov    %edx,0x5c(%eax)
c0006d6d:	81 45 fc a8 01 00 00 	addl   $0x1a8,-0x4(%ebp)
c0006d74:	b8 90 70 08 c0       	mov    $0xc0087090,%eax
c0006d79:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c0006d7c:	72 d5                	jb     c0006d53 <schedule_process+0x62>
c0006d7e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c0006d82:	0f 84 78 ff ff ff    	je     c0006d00 <schedule_process+0xf>
c0006d88:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0006d8f:	a1 60 fb 00 c0       	mov    0xc000fb60,%eax
c0006d94:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
c0006d9a:	85 c0                	test   %eax,%eax
c0006d9c:	74 10                	je     c0006dae <schedule_process+0xbd>
c0006d9e:	a1 60 fb 00 c0       	mov    0xc000fb60,%eax
c0006da3:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
c0006da9:	0f 22 d8             	mov    %eax,%cr3
c0006dac:	eb 06                	jmp    c0006db4 <schedule_process+0xc3>
c0006dae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006db1:	0f 22 d8             	mov    %eax,%cr3
c0006db4:	90                   	nop
c0006db5:	c9                   	leave  
c0006db6:	c3                   	ret    

c0006db7 <clock_handler>:
c0006db7:	55                   	push   %ebp
c0006db8:	89 e5                	mov    %esp,%ebp
c0006dba:	83 ec 08             	sub    $0x8,%esp
c0006dbd:	a1 60 fb 00 c0       	mov    0xc000fb60,%eax
c0006dc2:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c0006dc9:	3c 02                	cmp    $0x2,%al
c0006dcb:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0006dd0:	83 c0 01             	add    $0x1,%eax
c0006dd3:	a3 c0 1e 01 c0       	mov    %eax,0xc0011ec0
c0006dd8:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0006ddd:	3d cc ab ff 7f       	cmp    $0x7fffabcc,%eax
c0006de2:	76 0a                	jbe    c0006dee <clock_handler+0x37>
c0006de4:	c7 05 c0 1e 01 c0 00 	movl   $0x0,0xc0011ec0
c0006deb:	00 00 00 
c0006dee:	a1 60 fb 00 c0       	mov    0xc000fb60,%eax
c0006df3:	8b 40 5c             	mov    0x5c(%eax),%eax
c0006df6:	85 c0                	test   %eax,%eax
c0006df8:	74 0e                	je     c0006e08 <clock_handler+0x51>
c0006dfa:	a1 60 fb 00 c0       	mov    0xc000fb60,%eax
c0006dff:	8b 50 5c             	mov    0x5c(%eax),%edx
c0006e02:	83 ea 01             	sub    $0x1,%edx
c0006e05:	89 50 5c             	mov    %edx,0x5c(%eax)
c0006e08:	a1 a0 16 01 c0       	mov    0xc00116a0,%eax
c0006e0d:	85 c0                	test   %eax,%eax
c0006e0f:	74 0d                	je     c0006e1e <clock_handler+0x67>
c0006e11:	83 ec 0c             	sub    $0xc,%esp
c0006e14:	6a 00                	push   $0x0
c0006e16:	e8 8c d1 ff ff       	call   c0003fa7 <inform_int>
c0006e1b:	83 c4 10             	add    $0x10,%esp
c0006e1e:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0006e23:	85 c0                	test   %eax,%eax
c0006e25:	75 13                	jne    c0006e3a <clock_handler+0x83>
c0006e27:	a1 60 fb 00 c0       	mov    0xc000fb60,%eax
c0006e2c:	8b 40 5c             	mov    0x5c(%eax),%eax
c0006e2f:	85 c0                	test   %eax,%eax
c0006e31:	75 0a                	jne    c0006e3d <clock_handler+0x86>
c0006e33:	e8 b9 fe ff ff       	call   c0006cf1 <schedule_process>
c0006e38:	eb 04                	jmp    c0006e3e <clock_handler+0x87>
c0006e3a:	90                   	nop
c0006e3b:	eb 01                	jmp    c0006e3e <clock_handler+0x87>
c0006e3d:	90                   	nop
c0006e3e:	c9                   	leave  
c0006e3f:	c3                   	ret    

c0006e40 <pid2proc>:
c0006e40:	55                   	push   %ebp
c0006e41:	89 e5                	mov    %esp,%ebp
c0006e43:	83 ec 10             	sub    $0x10,%esp
c0006e46:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e49:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0006e4f:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c0006e54:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e57:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e5a:	c9                   	leave  
c0006e5b:	c3                   	ret    

c0006e5c <proc2pid>:
c0006e5c:	55                   	push   %ebp
c0006e5d:	89 e5                	mov    %esp,%ebp
c0006e5f:	83 ec 10             	sub    $0x10,%esp
c0006e62:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e65:	2d a0 31 08 c0       	sub    $0xc00831a0,%eax
c0006e6a:	c1 f8 03             	sar    $0x3,%eax
c0006e6d:	69 c0 1d 52 13 8c    	imul   $0x8c13521d,%eax,%eax
c0006e73:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e76:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e79:	c9                   	leave  
c0006e7a:	c3                   	ret    

c0006e7b <InitDescriptor>:
c0006e7b:	55                   	push   %ebp
c0006e7c:	89 e5                	mov    %esp,%ebp
c0006e7e:	83 ec 04             	sub    $0x4,%esp
c0006e81:	8b 45 14             	mov    0x14(%ebp),%eax
c0006e84:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0006e88:	8b 45 10             	mov    0x10(%ebp),%eax
c0006e8b:	89 c2                	mov    %eax,%edx
c0006e8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e90:	66 89 10             	mov    %dx,(%eax)
c0006e93:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e96:	89 c2                	mov    %eax,%edx
c0006e98:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e9b:	66 89 50 02          	mov    %dx,0x2(%eax)
c0006e9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ea2:	c1 e8 10             	shr    $0x10,%eax
c0006ea5:	89 c2                	mov    %eax,%edx
c0006ea7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006eaa:	88 50 04             	mov    %dl,0x4(%eax)
c0006ead:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0006eb1:	89 c2                	mov    %eax,%edx
c0006eb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006eb6:	88 50 05             	mov    %dl,0x5(%eax)
c0006eb9:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0006ebd:	66 c1 e8 08          	shr    $0x8,%ax
c0006ec1:	c1 e0 04             	shl    $0x4,%eax
c0006ec4:	89 c2                	mov    %eax,%edx
c0006ec6:	8b 45 10             	mov    0x10(%ebp),%eax
c0006ec9:	c1 e8 10             	shr    $0x10,%eax
c0006ecc:	83 e0 0f             	and    $0xf,%eax
c0006ecf:	09 c2                	or     %eax,%edx
c0006ed1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ed4:	88 50 06             	mov    %dl,0x6(%eax)
c0006ed7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006eda:	c1 e8 18             	shr    $0x18,%eax
c0006edd:	89 c2                	mov    %eax,%edx
c0006edf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ee2:	88 50 07             	mov    %dl,0x7(%eax)
c0006ee5:	90                   	nop
c0006ee6:	c9                   	leave  
c0006ee7:	c3                   	ret    

c0006ee8 <Seg2PhyAddr>:
c0006ee8:	55                   	push   %ebp
c0006ee9:	89 e5                	mov    %esp,%ebp
c0006eeb:	83 ec 10             	sub    $0x10,%esp
c0006eee:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ef1:	c1 e8 03             	shr    $0x3,%eax
c0006ef4:	8b 14 c5 64 f7 00 c0 	mov    -0x3fff089c(,%eax,8),%edx
c0006efb:	8b 04 c5 60 f7 00 c0 	mov    -0x3fff08a0(,%eax,8),%eax
c0006f02:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f05:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0006f08:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0006f0c:	0f b7 c0             	movzwl %ax,%eax
c0006f0f:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0006f13:	0f b6 d2             	movzbl %dl,%edx
c0006f16:	c1 e2 10             	shl    $0x10,%edx
c0006f19:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0006f1f:	09 d0                	or     %edx,%eax
c0006f21:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f24:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f27:	c9                   	leave  
c0006f28:	c3                   	ret    

c0006f29 <Seg2PhyAddrLDT>:
c0006f29:	55                   	push   %ebp
c0006f2a:	89 e5                	mov    %esp,%ebp
c0006f2c:	83 ec 10             	sub    $0x10,%esp
c0006f2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f32:	c1 e8 03             	shr    $0x3,%eax
c0006f35:	89 c2                	mov    %eax,%edx
c0006f37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006f3a:	83 c2 08             	add    $0x8,%edx
c0006f3d:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
c0006f41:	8b 02                	mov    (%edx),%eax
c0006f43:	8b 52 04             	mov    0x4(%edx),%edx
c0006f46:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f49:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0006f4c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0006f50:	0f b7 c0             	movzwl %ax,%eax
c0006f53:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0006f57:	0f b6 d2             	movzbl %dl,%edx
c0006f5a:	c1 e2 10             	shl    $0x10,%edx
c0006f5d:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0006f63:	09 d0                	or     %edx,%eax
c0006f65:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f68:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f6b:	c9                   	leave  
c0006f6c:	c3                   	ret    

c0006f6d <VirAddr2PhyAddr>:
c0006f6d:	55                   	push   %ebp
c0006f6e:	89 e5                	mov    %esp,%ebp
c0006f70:	83 ec 10             	sub    $0x10,%esp
c0006f73:	8b 55 0c             	mov    0xc(%ebp),%edx
c0006f76:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f79:	01 d0                	add    %edx,%eax
c0006f7b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f81:	c9                   	leave  
c0006f82:	c3                   	ret    

c0006f83 <v2l>:
c0006f83:	55                   	push   %ebp
c0006f84:	89 e5                	mov    %esp,%ebp
c0006f86:	83 ec 18             	sub    $0x18,%esp
c0006f89:	83 ec 0c             	sub    $0xc,%esp
c0006f8c:	ff 75 08             	pushl  0x8(%ebp)
c0006f8f:	e8 ac fe ff ff       	call   c0006e40 <pid2proc>
c0006f94:	83 c4 10             	add    $0x10,%esp
c0006f97:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f9a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006fa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fa4:	83 ec 08             	sub    $0x8,%esp
c0006fa7:	ff 75 f4             	pushl  -0xc(%ebp)
c0006faa:	50                   	push   %eax
c0006fab:	e8 79 ff ff ff       	call   c0006f29 <Seg2PhyAddrLDT>
c0006fb0:	83 c4 10             	add    $0x10,%esp
c0006fb3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006fb6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006fb9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006fbc:	01 d0                	add    %edx,%eax
c0006fbe:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006fc4:	c9                   	leave  
c0006fc5:	c3                   	ret    

c0006fc6 <init_propt>:
c0006fc6:	55                   	push   %ebp
c0006fc7:	89 e5                	mov    %esp,%ebp
c0006fc9:	53                   	push   %ebx
c0006fca:	83 ec 34             	sub    $0x34,%esp
c0006fcd:	6a 0e                	push   $0xe
c0006fcf:	6a 08                	push   $0x8
c0006fd1:	68 6a 16 00 c0       	push   $0xc000166a
c0006fd6:	6a 20                	push   $0x20
c0006fd8:	e8 58 01 00 00       	call   c0007135 <InitInterruptDesc>
c0006fdd:	83 c4 10             	add    $0x10,%esp
c0006fe0:	6a 0e                	push   $0xe
c0006fe2:	6a 08                	push   $0x8
c0006fe4:	68 b3 16 00 c0       	push   $0xc00016b3
c0006fe9:	6a 21                	push   $0x21
c0006feb:	e8 45 01 00 00       	call   c0007135 <InitInterruptDesc>
c0006ff0:	83 c4 10             	add    $0x10,%esp
c0006ff3:	6a 0e                	push   $0xe
c0006ff5:	6a 08                	push   $0x8
c0006ff7:	68 fc 16 00 c0       	push   $0xc00016fc
c0006ffc:	6a 2e                	push   $0x2e
c0006ffe:	e8 32 01 00 00       	call   c0007135 <InitInterruptDesc>
c0007003:	83 c4 10             	add    $0x10,%esp
c0007006:	83 ec 04             	sub    $0x4,%esp
c0007009:	68 f0 09 00 00       	push   $0x9f0
c000700e:	6a 00                	push   $0x0
c0007010:	68 a0 31 08 c0       	push   $0xc00831a0
c0007015:	e8 75 2f 00 00       	call   c0009f8f <Memset>
c000701a:	83 c4 10             	add    $0x10,%esp
c000701d:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c0007024:	83 ec 04             	sub    $0x4,%esp
c0007027:	ff 75 f0             	pushl  -0x10(%ebp)
c000702a:	6a 00                	push   $0x0
c000702c:	68 20 16 01 c0       	push   $0xc0011620
c0007031:	e8 59 2f 00 00       	call   c0009f8f <Memset>
c0007036:	83 c4 10             	add    $0x10,%esp
c0007039:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000703c:	a3 88 16 01 c0       	mov    %eax,0xc0011688
c0007041:	c7 05 28 16 01 c0 30 	movl   $0x30,0xc0011628
c0007048:	00 00 00 
c000704b:	83 ec 0c             	sub    $0xc,%esp
c000704e:	6a 30                	push   $0x30
c0007050:	e8 93 fe ff ff       	call   c0006ee8 <Seg2PhyAddr>
c0007055:	83 c4 10             	add    $0x10,%esp
c0007058:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000705b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000705e:	83 ec 08             	sub    $0x8,%esp
c0007061:	68 20 16 01 c0       	push   $0xc0011620
c0007066:	50                   	push   %eax
c0007067:	e8 01 ff ff ff       	call   c0006f6d <VirAddr2PhyAddr>
c000706c:	83 c4 10             	add    $0x10,%esp
c000706f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007072:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
c0007079:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000707c:	0f b7 d0             	movzwl %ax,%edx
c000707f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007082:	83 e8 01             	sub    $0x1,%eax
c0007085:	89 c1                	mov    %eax,%ecx
c0007087:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000708a:	52                   	push   %edx
c000708b:	51                   	push   %ecx
c000708c:	50                   	push   %eax
c000708d:	68 a0 f7 00 c0       	push   $0xc000f7a0
c0007092:	e8 e4 fd ff ff       	call   c0006e7b <InitDescriptor>
c0007097:	83 c4 10             	add    $0x10,%esp
c000709a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00070a1:	eb 65                	jmp    c0007108 <init_propt+0x142>
c00070a3:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
c00070aa:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
c00070b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070b4:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c00070ba:	83 c0 40             	add    $0x40,%eax
c00070bd:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c00070c2:	8d 50 06             	lea    0x6(%eax),%edx
c00070c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070c8:	83 ec 08             	sub    $0x8,%esp
c00070cb:	52                   	push   %edx
c00070cc:	50                   	push   %eax
c00070cd:	e8 9b fe ff ff       	call   c0006f6d <VirAddr2PhyAddr>
c00070d2:	83 c4 10             	add    $0x10,%esp
c00070d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00070d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00070db:	0f b7 d0             	movzwl %ax,%edx
c00070de:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00070e1:	83 e8 01             	sub    $0x1,%eax
c00070e4:	89 c3                	mov    %eax,%ebx
c00070e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00070e9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c00070ec:	83 c1 09             	add    $0x9,%ecx
c00070ef:	c1 e1 03             	shl    $0x3,%ecx
c00070f2:	81 c1 60 f7 00 c0    	add    $0xc000f760,%ecx
c00070f8:	52                   	push   %edx
c00070f9:	53                   	push   %ebx
c00070fa:	50                   	push   %eax
c00070fb:	51                   	push   %ecx
c00070fc:	e8 7a fd ff ff       	call   c0006e7b <InitDescriptor>
c0007101:	83 c4 10             	add    $0x10,%esp
c0007104:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007108:	83 7d f4 25          	cmpl   $0x25,-0xc(%ebp)
c000710c:	7e 95                	jle    c00070a3 <init_propt+0xdd>
c000710e:	c7 45 d4 00 80 0b 0c 	movl   $0xc0b8000,-0x2c(%ebp)
c0007115:	68 f2 00 00 00       	push   $0xf2
c000711a:	68 ff ff 00 00       	push   $0xffff
c000711f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007122:	68 98 f7 00 c0       	push   $0xc000f798
c0007127:	e8 4f fd ff ff       	call   c0006e7b <InitDescriptor>
c000712c:	83 c4 10             	add    $0x10,%esp
c000712f:	90                   	nop
c0007130:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0007133:	c9                   	leave  
c0007134:	c3                   	ret    

c0007135 <InitInterruptDesc>:
c0007135:	55                   	push   %ebp
c0007136:	89 e5                	mov    %esp,%ebp
c0007138:	83 ec 10             	sub    $0x10,%esp
c000713b:	8b 45 08             	mov    0x8(%ebp),%eax
c000713e:	c1 e0 03             	shl    $0x3,%eax
c0007141:	05 c0 16 01 c0       	add    $0xc00116c0,%eax
c0007146:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007149:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000714c:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0007150:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007153:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007156:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007159:	89 c2                	mov    %eax,%edx
c000715b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000715e:	66 89 10             	mov    %dx,(%eax)
c0007161:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007164:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c000716a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000716d:	c1 f8 10             	sar    $0x10,%eax
c0007170:	89 c2                	mov    %eax,%edx
c0007172:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007175:	66 89 50 06          	mov    %dx,0x6(%eax)
c0007179:	8b 45 10             	mov    0x10(%ebp),%eax
c000717c:	c1 e0 04             	shl    $0x4,%eax
c000717f:	89 c2                	mov    %eax,%edx
c0007181:	8b 45 14             	mov    0x14(%ebp),%eax
c0007184:	09 d0                	or     %edx,%eax
c0007186:	89 c2                	mov    %eax,%edx
c0007188:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000718b:	88 50 05             	mov    %dl,0x5(%eax)
c000718e:	90                   	nop
c000718f:	c9                   	leave  
c0007190:	c3                   	ret    

c0007191 <ReloadGDT>:
c0007191:	55                   	push   %ebp
c0007192:	89 e5                	mov    %esp,%ebp
c0007194:	83 ec 28             	sub    $0x28,%esp
c0007197:	b8 a8 16 01 c0       	mov    $0xc00116a8,%eax
c000719c:	0f b7 00             	movzwl (%eax),%eax
c000719f:	98                   	cwtl   
c00071a0:	ba aa 16 01 c0       	mov    $0xc00116aa,%edx
c00071a5:	8b 12                	mov    (%edx),%edx
c00071a7:	83 ec 04             	sub    $0x4,%esp
c00071aa:	50                   	push   %eax
c00071ab:	52                   	push   %edx
c00071ac:	68 60 f7 00 c0       	push   $0xc000f760
c00071b1:	e8 ab 2d 00 00       	call   c0009f61 <Memcpy>
c00071b6:	83 c4 10             	add    $0x10,%esp
c00071b9:	c7 45 f0 a8 16 01 c0 	movl   $0xc00116a8,-0x10(%ebp)
c00071c0:	c7 45 ec aa 16 01 c0 	movl   $0xc00116aa,-0x14(%ebp)
c00071c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00071ca:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c00071cf:	ba 60 f7 00 c0       	mov    $0xc000f760,%edx
c00071d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071d7:	89 10                	mov    %edx,(%eax)
c00071d9:	c7 45 e8 28 e7 00 c0 	movl   $0xc000e728,-0x18(%ebp)
c00071e0:	c7 45 e4 2a e7 00 c0 	movl   $0xc000e72a,-0x1c(%ebp)
c00071e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00071ea:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c00071ef:	ba c0 16 01 c0       	mov    $0xc00116c0,%edx
c00071f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00071f7:	89 10                	mov    %edx,(%eax)
c00071f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007200:	eb 04                	jmp    c0007206 <ReloadGDT+0x75>
c0007202:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007206:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000720d:	7e f3                	jle    c0007202 <ReloadGDT+0x71>
c000720f:	e8 27 ab ff ff       	call   c0001d3b <init_internal_interrupt>
c0007214:	e8 ad fd ff ff       	call   c0006fc6 <init_propt>
c0007219:	90                   	nop
c000721a:	c9                   	leave  
c000721b:	c3                   	ret    

c000721c <select_console>:
c000721c:	55                   	push   %ebp
c000721d:	89 e5                	mov    %esp,%ebp
c000721f:	83 ec 18             	sub    $0x18,%esp
c0007222:	8b 45 08             	mov    0x8(%ebp),%eax
c0007225:	88 45 f4             	mov    %al,-0xc(%ebp)
c0007228:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c000722c:	77 27                	ja     c0007255 <select_console+0x39>
c000722e:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0007232:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0007238:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c000723d:	a3 20 e7 00 c0       	mov    %eax,0xc000e720
c0007242:	a1 20 e7 00 c0       	mov    0xc000e720,%eax
c0007247:	83 ec 0c             	sub    $0xc,%esp
c000724a:	50                   	push   %eax
c000724b:	e8 08 00 00 00       	call   c0007258 <flush>
c0007250:	83 c4 10             	add    $0x10,%esp
c0007253:	eb 01                	jmp    c0007256 <select_console+0x3a>
c0007255:	90                   	nop
c0007256:	c9                   	leave  
c0007257:	c3                   	ret    

c0007258 <flush>:
c0007258:	55                   	push   %ebp
c0007259:	89 e5                	mov    %esp,%ebp
c000725b:	83 ec 08             	sub    $0x8,%esp
c000725e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007261:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007267:	8b 40 0c             	mov    0xc(%eax),%eax
c000726a:	83 ec 0c             	sub    $0xc,%esp
c000726d:	50                   	push   %eax
c000726e:	e8 1e 00 00 00       	call   c0007291 <set_cursor>
c0007273:	83 c4 10             	add    $0x10,%esp
c0007276:	8b 45 08             	mov    0x8(%ebp),%eax
c0007279:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000727f:	8b 40 08             	mov    0x8(%eax),%eax
c0007282:	83 ec 0c             	sub    $0xc,%esp
c0007285:	50                   	push   %eax
c0007286:	e8 64 00 00 00       	call   c00072ef <set_console_start_video_addr>
c000728b:	83 c4 10             	add    $0x10,%esp
c000728e:	90                   	nop
c000728f:	c9                   	leave  
c0007290:	c3                   	ret    

c0007291 <set_cursor>:
c0007291:	55                   	push   %ebp
c0007292:	89 e5                	mov    %esp,%ebp
c0007294:	83 ec 08             	sub    $0x8,%esp
c0007297:	83 ec 08             	sub    $0x8,%esp
c000729a:	6a 0e                	push   $0xe
c000729c:	68 d4 03 00 00       	push   $0x3d4
c00072a1:	e8 39 a5 ff ff       	call   c00017df <out_byte>
c00072a6:	83 c4 10             	add    $0x10,%esp
c00072a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00072ac:	c1 e8 08             	shr    $0x8,%eax
c00072af:	0f b7 c0             	movzwl %ax,%eax
c00072b2:	83 ec 08             	sub    $0x8,%esp
c00072b5:	50                   	push   %eax
c00072b6:	68 d5 03 00 00       	push   $0x3d5
c00072bb:	e8 1f a5 ff ff       	call   c00017df <out_byte>
c00072c0:	83 c4 10             	add    $0x10,%esp
c00072c3:	83 ec 08             	sub    $0x8,%esp
c00072c6:	6a 0f                	push   $0xf
c00072c8:	68 d4 03 00 00       	push   $0x3d4
c00072cd:	e8 0d a5 ff ff       	call   c00017df <out_byte>
c00072d2:	83 c4 10             	add    $0x10,%esp
c00072d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00072d8:	0f b7 c0             	movzwl %ax,%eax
c00072db:	83 ec 08             	sub    $0x8,%esp
c00072de:	50                   	push   %eax
c00072df:	68 d5 03 00 00       	push   $0x3d5
c00072e4:	e8 f6 a4 ff ff       	call   c00017df <out_byte>
c00072e9:	83 c4 10             	add    $0x10,%esp
c00072ec:	90                   	nop
c00072ed:	c9                   	leave  
c00072ee:	c3                   	ret    

c00072ef <set_console_start_video_addr>:
c00072ef:	55                   	push   %ebp
c00072f0:	89 e5                	mov    %esp,%ebp
c00072f2:	83 ec 08             	sub    $0x8,%esp
c00072f5:	83 ec 08             	sub    $0x8,%esp
c00072f8:	6a 0c                	push   $0xc
c00072fa:	68 d4 03 00 00       	push   $0x3d4
c00072ff:	e8 db a4 ff ff       	call   c00017df <out_byte>
c0007304:	83 c4 10             	add    $0x10,%esp
c0007307:	8b 45 08             	mov    0x8(%ebp),%eax
c000730a:	c1 e8 08             	shr    $0x8,%eax
c000730d:	0f b7 c0             	movzwl %ax,%eax
c0007310:	83 ec 08             	sub    $0x8,%esp
c0007313:	50                   	push   %eax
c0007314:	68 d5 03 00 00       	push   $0x3d5
c0007319:	e8 c1 a4 ff ff       	call   c00017df <out_byte>
c000731e:	83 c4 10             	add    $0x10,%esp
c0007321:	83 ec 08             	sub    $0x8,%esp
c0007324:	6a 0d                	push   $0xd
c0007326:	68 d4 03 00 00       	push   $0x3d4
c000732b:	e8 af a4 ff ff       	call   c00017df <out_byte>
c0007330:	83 c4 10             	add    $0x10,%esp
c0007333:	8b 45 08             	mov    0x8(%ebp),%eax
c0007336:	0f b7 c0             	movzwl %ax,%eax
c0007339:	83 ec 08             	sub    $0x8,%esp
c000733c:	50                   	push   %eax
c000733d:	68 d5 03 00 00       	push   $0x3d5
c0007342:	e8 98 a4 ff ff       	call   c00017df <out_byte>
c0007347:	83 c4 10             	add    $0x10,%esp
c000734a:	90                   	nop
c000734b:	c9                   	leave  
c000734c:	c3                   	ret    

c000734d <put_key>:
c000734d:	55                   	push   %ebp
c000734e:	89 e5                	mov    %esp,%ebp
c0007350:	83 ec 04             	sub    $0x4,%esp
c0007353:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007356:	88 45 fc             	mov    %al,-0x4(%ebp)
c0007359:	8b 45 08             	mov    0x8(%ebp),%eax
c000735c:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0007362:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0007367:	77 4d                	ja     c00073b6 <put_key+0x69>
c0007369:	8b 45 08             	mov    0x8(%ebp),%eax
c000736c:	8b 00                	mov    (%eax),%eax
c000736e:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0007372:	89 10                	mov    %edx,(%eax)
c0007374:	8b 45 08             	mov    0x8(%ebp),%eax
c0007377:	8b 00                	mov    (%eax),%eax
c0007379:	8d 50 04             	lea    0x4(%eax),%edx
c000737c:	8b 45 08             	mov    0x8(%ebp),%eax
c000737f:	89 10                	mov    %edx,(%eax)
c0007381:	8b 45 08             	mov    0x8(%ebp),%eax
c0007384:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000738a:	8d 50 01             	lea    0x1(%eax),%edx
c000738d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007390:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0007396:	8b 45 08             	mov    0x8(%ebp),%eax
c0007399:	8b 00                	mov    (%eax),%eax
c000739b:	8b 55 08             	mov    0x8(%ebp),%edx
c000739e:	83 c2 08             	add    $0x8,%edx
c00073a1:	81 c2 00 08 00 00    	add    $0x800,%edx
c00073a7:	39 d0                	cmp    %edx,%eax
c00073a9:	75 0b                	jne    c00073b6 <put_key+0x69>
c00073ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00073ae:	8d 50 08             	lea    0x8(%eax),%edx
c00073b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00073b4:	89 10                	mov    %edx,(%eax)
c00073b6:	90                   	nop
c00073b7:	c9                   	leave  
c00073b8:	c3                   	ret    

c00073b9 <scroll_up>:
c00073b9:	55                   	push   %ebp
c00073ba:	89 e5                	mov    %esp,%ebp
c00073bc:	83 ec 08             	sub    $0x8,%esp
c00073bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00073c2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00073c8:	8b 40 08             	mov    0x8(%eax),%eax
c00073cb:	8d 50 b0             	lea    -0x50(%eax),%edx
c00073ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00073d1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00073d7:	8b 00                	mov    (%eax),%eax
c00073d9:	39 c2                	cmp    %eax,%edx
c00073db:	76 1b                	jbe    c00073f8 <scroll_up+0x3f>
c00073dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00073e0:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00073e6:	8b 40 08             	mov    0x8(%eax),%eax
c00073e9:	83 e8 50             	sub    $0x50,%eax
c00073ec:	83 ec 0c             	sub    $0xc,%esp
c00073ef:	50                   	push   %eax
c00073f0:	e8 fa fe ff ff       	call   c00072ef <set_console_start_video_addr>
c00073f5:	83 c4 10             	add    $0x10,%esp
c00073f8:	90                   	nop
c00073f9:	c9                   	leave  
c00073fa:	c3                   	ret    

c00073fb <scroll_down>:
c00073fb:	55                   	push   %ebp
c00073fc:	89 e5                	mov    %esp,%ebp
c00073fe:	83 ec 08             	sub    $0x8,%esp
c0007401:	8b 45 08             	mov    0x8(%ebp),%eax
c0007404:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000740a:	8b 40 08             	mov    0x8(%eax),%eax
c000740d:	8d 48 50             	lea    0x50(%eax),%ecx
c0007410:	8b 45 08             	mov    0x8(%ebp),%eax
c0007413:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007419:	8b 10                	mov    (%eax),%edx
c000741b:	8b 45 08             	mov    0x8(%ebp),%eax
c000741e:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007424:	8b 40 04             	mov    0x4(%eax),%eax
c0007427:	01 d0                	add    %edx,%eax
c0007429:	39 c1                	cmp    %eax,%ecx
c000742b:	73 36                	jae    c0007463 <scroll_down+0x68>
c000742d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007430:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007436:	8b 40 08             	mov    0x8(%eax),%eax
c0007439:	83 c0 50             	add    $0x50,%eax
c000743c:	83 ec 0c             	sub    $0xc,%esp
c000743f:	50                   	push   %eax
c0007440:	e8 aa fe ff ff       	call   c00072ef <set_console_start_video_addr>
c0007445:	83 c4 10             	add    $0x10,%esp
c0007448:	8b 45 08             	mov    0x8(%ebp),%eax
c000744b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007451:	8b 50 08             	mov    0x8(%eax),%edx
c0007454:	8b 45 08             	mov    0x8(%ebp),%eax
c0007457:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000745d:	83 c2 50             	add    $0x50,%edx
c0007460:	89 50 08             	mov    %edx,0x8(%eax)
c0007463:	90                   	nop
c0007464:	c9                   	leave  
c0007465:	c3                   	ret    

c0007466 <out_char>:
c0007466:	55                   	push   %ebp
c0007467:	89 e5                	mov    %esp,%ebp
c0007469:	83 ec 28             	sub    $0x28,%esp
c000746c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000746f:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0007472:	8b 45 08             	mov    0x8(%ebp),%eax
c0007475:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000747b:	8b 40 0c             	mov    0xc(%eax),%eax
c000747e:	05 00 c0 05 00       	add    $0x5c000,%eax
c0007483:	01 c0                	add    %eax,%eax
c0007485:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007488:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c000748c:	83 f8 08             	cmp    $0x8,%eax
c000748f:	0f 84 8d 00 00 00    	je     c0007522 <out_char+0xbc>
c0007495:	83 f8 0a             	cmp    $0xa,%eax
c0007498:	0f 85 c9 00 00 00    	jne    c0007567 <out_char+0x101>
c000749e:	8b 45 08             	mov    0x8(%ebp),%eax
c00074a1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00074a7:	8b 50 0c             	mov    0xc(%eax),%edx
c00074aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00074ad:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00074b3:	8b 08                	mov    (%eax),%ecx
c00074b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00074b8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00074be:	8b 40 04             	mov    0x4(%eax),%eax
c00074c1:	01 c8                	add    %ecx,%eax
c00074c3:	83 e8 50             	sub    $0x50,%eax
c00074c6:	39 c2                	cmp    %eax,%edx
c00074c8:	0f 83 f4 00 00 00    	jae    c00075c2 <out_char+0x15c>
c00074ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00074d1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00074d7:	8b 08                	mov    (%eax),%ecx
c00074d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00074dc:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00074e2:	8b 50 0c             	mov    0xc(%eax),%edx
c00074e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00074e8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00074ee:	8b 00                	mov    (%eax),%eax
c00074f0:	29 c2                	sub    %eax,%edx
c00074f2:	89 d0                	mov    %edx,%eax
c00074f4:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00074f9:	f7 e2                	mul    %edx
c00074fb:	89 d0                	mov    %edx,%eax
c00074fd:	c1 e8 06             	shr    $0x6,%eax
c0007500:	8d 50 01             	lea    0x1(%eax),%edx
c0007503:	89 d0                	mov    %edx,%eax
c0007505:	c1 e0 02             	shl    $0x2,%eax
c0007508:	01 d0                	add    %edx,%eax
c000750a:	c1 e0 04             	shl    $0x4,%eax
c000750d:	89 c2                	mov    %eax,%edx
c000750f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007512:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007518:	01 ca                	add    %ecx,%edx
c000751a:	89 50 0c             	mov    %edx,0xc(%eax)
c000751d:	e9 a0 00 00 00       	jmp    c00075c2 <out_char+0x15c>
c0007522:	8b 45 08             	mov    0x8(%ebp),%eax
c0007525:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000752b:	8b 50 0c             	mov    0xc(%eax),%edx
c000752e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007531:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007537:	8b 00                	mov    (%eax),%eax
c0007539:	39 c2                	cmp    %eax,%edx
c000753b:	0f 86 84 00 00 00    	jbe    c00075c5 <out_char+0x15f>
c0007541:	8b 45 08             	mov    0x8(%ebp),%eax
c0007544:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000754a:	8b 50 0c             	mov    0xc(%eax),%edx
c000754d:	83 ea 01             	sub    $0x1,%edx
c0007550:	89 50 0c             	mov    %edx,0xc(%eax)
c0007553:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007556:	83 e8 02             	sub    $0x2,%eax
c0007559:	c6 00 20             	movb   $0x20,(%eax)
c000755c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000755f:	83 e8 01             	sub    $0x1,%eax
c0007562:	c6 00 00             	movb   $0x0,(%eax)
c0007565:	eb 5e                	jmp    c00075c5 <out_char+0x15f>
c0007567:	8b 45 08             	mov    0x8(%ebp),%eax
c000756a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007570:	8b 40 0c             	mov    0xc(%eax),%eax
c0007573:	8d 48 01             	lea    0x1(%eax),%ecx
c0007576:	8b 45 08             	mov    0x8(%ebp),%eax
c0007579:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000757f:	8b 10                	mov    (%eax),%edx
c0007581:	8b 45 08             	mov    0x8(%ebp),%eax
c0007584:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000758a:	8b 40 04             	mov    0x4(%eax),%eax
c000758d:	01 d0                	add    %edx,%eax
c000758f:	39 c1                	cmp    %eax,%ecx
c0007591:	73 35                	jae    c00075c8 <out_char+0x162>
c0007593:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007596:	8d 50 01             	lea    0x1(%eax),%edx
c0007599:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000759c:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c00075a0:	88 10                	mov    %dl,(%eax)
c00075a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00075a5:	8d 50 01             	lea    0x1(%eax),%edx
c00075a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00075ab:	c6 00 0a             	movb   $0xa,(%eax)
c00075ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00075b1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075b7:	8b 50 0c             	mov    0xc(%eax),%edx
c00075ba:	83 c2 01             	add    $0x1,%edx
c00075bd:	89 50 0c             	mov    %edx,0xc(%eax)
c00075c0:	eb 06                	jmp    c00075c8 <out_char+0x162>
c00075c2:	90                   	nop
c00075c3:	eb 14                	jmp    c00075d9 <out_char+0x173>
c00075c5:	90                   	nop
c00075c6:	eb 11                	jmp    c00075d9 <out_char+0x173>
c00075c8:	90                   	nop
c00075c9:	eb 0e                	jmp    c00075d9 <out_char+0x173>
c00075cb:	83 ec 0c             	sub    $0xc,%esp
c00075ce:	ff 75 08             	pushl  0x8(%ebp)
c00075d1:	e8 25 fe ff ff       	call   c00073fb <scroll_down>
c00075d6:	83 c4 10             	add    $0x10,%esp
c00075d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00075dc:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075e2:	8b 50 0c             	mov    0xc(%eax),%edx
c00075e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00075e8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00075ee:	8b 40 08             	mov    0x8(%eax),%eax
c00075f1:	29 c2                	sub    %eax,%edx
c00075f3:	89 d0                	mov    %edx,%eax
c00075f5:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00075fa:	77 cf                	ja     c00075cb <out_char+0x165>
c00075fc:	83 ec 0c             	sub    $0xc,%esp
c00075ff:	ff 75 08             	pushl  0x8(%ebp)
c0007602:	e8 51 fc ff ff       	call   c0007258 <flush>
c0007607:	83 c4 10             	add    $0x10,%esp
c000760a:	90                   	nop
c000760b:	c9                   	leave  
c000760c:	c3                   	ret    

c000760d <tty_dev_read>:
c000760d:	55                   	push   %ebp
c000760e:	89 e5                	mov    %esp,%ebp
c0007610:	83 ec 08             	sub    $0x8,%esp
c0007613:	a1 20 e7 00 c0       	mov    0xc000e720,%eax
c0007618:	39 45 08             	cmp    %eax,0x8(%ebp)
c000761b:	75 17                	jne    c0007634 <tty_dev_read+0x27>
c000761d:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0007622:	85 c0                	test   %eax,%eax
c0007624:	7e 0e                	jle    c0007634 <tty_dev_read+0x27>
c0007626:	83 ec 0c             	sub    $0xc,%esp
c0007629:	ff 75 08             	pushl  0x8(%ebp)
c000762c:	e8 f5 06 00 00       	call   c0007d26 <keyboard_read>
c0007631:	83 c4 10             	add    $0x10,%esp
c0007634:	90                   	nop
c0007635:	c9                   	leave  
c0007636:	c3                   	ret    

c0007637 <tty_dev_write>:
c0007637:	55                   	push   %ebp
c0007638:	89 e5                	mov    %esp,%ebp
c000763a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0007640:	8b 45 08             	mov    0x8(%ebp),%eax
c0007643:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0007649:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000764c:	e9 da 01 00 00       	jmp    c000782b <tty_dev_write+0x1f4>
c0007651:	8b 45 08             	mov    0x8(%ebp),%eax
c0007654:	8b 40 04             	mov    0x4(%eax),%eax
c0007657:	8b 00                	mov    (%eax),%eax
c0007659:	88 45 f3             	mov    %al,-0xd(%ebp)
c000765c:	8b 45 08             	mov    0x8(%ebp),%eax
c000765f:	8b 40 04             	mov    0x4(%eax),%eax
c0007662:	8d 50 04             	lea    0x4(%eax),%edx
c0007665:	8b 45 08             	mov    0x8(%ebp),%eax
c0007668:	89 50 04             	mov    %edx,0x4(%eax)
c000766b:	8b 45 08             	mov    0x8(%ebp),%eax
c000766e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0007674:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007677:	8b 45 08             	mov    0x8(%ebp),%eax
c000767a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0007680:	8b 45 08             	mov    0x8(%ebp),%eax
c0007683:	8b 40 04             	mov    0x4(%eax),%eax
c0007686:	8b 55 08             	mov    0x8(%ebp),%edx
c0007689:	83 c2 08             	add    $0x8,%edx
c000768c:	81 c2 00 08 00 00    	add    $0x800,%edx
c0007692:	39 d0                	cmp    %edx,%eax
c0007694:	75 0c                	jne    c00076a2 <tty_dev_write+0x6b>
c0007696:	8b 45 08             	mov    0x8(%ebp),%eax
c0007699:	8d 50 08             	lea    0x8(%eax),%edx
c000769c:	8b 45 08             	mov    0x8(%ebp),%eax
c000769f:	89 50 04             	mov    %edx,0x4(%eax)
c00076a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00076a5:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00076ab:	85 c0                	test   %eax,%eax
c00076ad:	0f 84 78 01 00 00    	je     c000782b <tty_dev_write+0x1f4>
c00076b3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00076b7:	3c 20                	cmp    $0x20,%al
c00076b9:	76 08                	jbe    c00076c3 <tty_dev_write+0x8c>
c00076bb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00076bf:	3c 7e                	cmp    $0x7e,%al
c00076c1:	76 10                	jbe    c00076d3 <tty_dev_write+0x9c>
c00076c3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00076c7:	3c 20                	cmp    $0x20,%al
c00076c9:	74 08                	je     c00076d3 <tty_dev_write+0x9c>
c00076cb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00076cf:	84 c0                	test   %al,%al
c00076d1:	75 7b                	jne    c000774e <tty_dev_write+0x117>
c00076d3:	83 ec 08             	sub    $0x8,%esp
c00076d6:	8d 45 f3             	lea    -0xd(%ebp),%eax
c00076d9:	50                   	push   %eax
c00076da:	6a 00                	push   $0x0
c00076dc:	e8 a2 f8 ff ff       	call   c0006f83 <v2l>
c00076e1:	83 c4 10             	add    $0x10,%esp
c00076e4:	89 c1                	mov    %eax,%ecx
c00076e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00076e9:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c00076ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00076f2:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00076f8:	01 d0                	add    %edx,%eax
c00076fa:	83 ec 04             	sub    $0x4,%esp
c00076fd:	6a 01                	push   $0x1
c00076ff:	51                   	push   %ecx
c0007700:	50                   	push   %eax
c0007701:	e8 5b 28 00 00       	call   c0009f61 <Memcpy>
c0007706:	83 c4 10             	add    $0x10,%esp
c0007709:	8b 45 08             	mov    0x8(%ebp),%eax
c000770c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0007712:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007715:	8b 45 08             	mov    0x8(%ebp),%eax
c0007718:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000771e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007721:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007727:	8d 50 01             	lea    0x1(%eax),%edx
c000772a:	8b 45 08             	mov    0x8(%ebp),%eax
c000772d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0007733:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007737:	0f b6 c0             	movzbl %al,%eax
c000773a:	83 ec 08             	sub    $0x8,%esp
c000773d:	50                   	push   %eax
c000773e:	ff 75 08             	pushl  0x8(%ebp)
c0007741:	e8 20 fd ff ff       	call   c0007466 <out_char>
c0007746:	83 c4 10             	add    $0x10,%esp
c0007749:	e9 dd 00 00 00       	jmp    c000782b <tty_dev_write+0x1f4>
c000774e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007752:	3c 08                	cmp    $0x8,%al
c0007754:	75 45                	jne    c000779b <tty_dev_write+0x164>
c0007756:	8b 45 08             	mov    0x8(%ebp),%eax
c0007759:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000775f:	8d 50 01             	lea    0x1(%eax),%edx
c0007762:	8b 45 08             	mov    0x8(%ebp),%eax
c0007765:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000776b:	8b 45 08             	mov    0x8(%ebp),%eax
c000776e:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007774:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007777:	8b 45 08             	mov    0x8(%ebp),%eax
c000777a:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0007780:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007784:	0f b6 c0             	movzbl %al,%eax
c0007787:	83 ec 08             	sub    $0x8,%esp
c000778a:	50                   	push   %eax
c000778b:	ff 75 08             	pushl  0x8(%ebp)
c000778e:	e8 d3 fc ff ff       	call   c0007466 <out_char>
c0007793:	83 c4 10             	add    $0x10,%esp
c0007796:	e9 90 00 00 00       	jmp    c000782b <tty_dev_write+0x1f4>
c000779b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000779f:	3c 0a                	cmp    $0xa,%al
c00077a1:	74 10                	je     c00077b3 <tty_dev_write+0x17c>
c00077a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00077a6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00077ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00077af:	39 c2                	cmp    %eax,%edx
c00077b1:	75 78                	jne    c000782b <tty_dev_write+0x1f4>
c00077b3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00077b7:	0f b6 c0             	movzbl %al,%eax
c00077ba:	83 ec 08             	sub    $0x8,%esp
c00077bd:	50                   	push   %eax
c00077be:	ff 75 08             	pushl  0x8(%ebp)
c00077c1:	e8 a0 fc ff ff       	call   c0007466 <out_char>
c00077c6:	83 c4 10             	add    $0x10,%esp
c00077c9:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
c00077d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00077d3:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00077d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00077dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00077df:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00077e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00077e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00077eb:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00077f1:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00077f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00077f7:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c00077fe:	00 00 00 
c0007801:	8b 45 08             	mov    0x8(%ebp),%eax
c0007804:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000780b:	00 00 00 
c000780e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007811:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c0007817:	83 ec 04             	sub    $0x4,%esp
c000781a:	50                   	push   %eax
c000781b:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000781e:	50                   	push   %eax
c000781f:	6a 01                	push   $0x1
c0007821:	e8 4b c5 ff ff       	call   c0003d71 <send_rec>
c0007826:	83 c4 10             	add    $0x10,%esp
c0007829:	eb 11                	jmp    c000783c <tty_dev_write+0x205>
c000782b:	8b 45 08             	mov    0x8(%ebp),%eax
c000782e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0007834:	85 c0                	test   %eax,%eax
c0007836:	0f 85 15 fe ff ff    	jne    c0007651 <tty_dev_write+0x1a>
c000783c:	c9                   	leave  
c000783d:	c3                   	ret    

c000783e <tty_do_read>:
c000783e:	55                   	push   %ebp
c000783f:	89 e5                	mov    %esp,%ebp
c0007841:	83 ec 08             	sub    $0x8,%esp
c0007844:	8b 45 08             	mov    0x8(%ebp),%eax
c0007847:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000784e:	00 00 00 
c0007851:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007854:	8b 50 58             	mov    0x58(%eax),%edx
c0007857:	8b 45 08             	mov    0x8(%ebp),%eax
c000785a:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0007860:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007863:	8b 00                	mov    (%eax),%eax
c0007865:	89 c2                	mov    %eax,%edx
c0007867:	8b 45 08             	mov    0x8(%ebp),%eax
c000786a:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0007870:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007873:	8b 50 50             	mov    0x50(%eax),%edx
c0007876:	8b 45 08             	mov    0x8(%ebp),%eax
c0007879:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000787f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007882:	8b 40 10             	mov    0x10(%eax),%eax
c0007885:	89 c2                	mov    %eax,%edx
c0007887:	8b 45 08             	mov    0x8(%ebp),%eax
c000788a:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0007890:	83 ec 08             	sub    $0x8,%esp
c0007893:	52                   	push   %edx
c0007894:	50                   	push   %eax
c0007895:	e8 e9 f6 ff ff       	call   c0006f83 <v2l>
c000789a:	83 c4 10             	add    $0x10,%esp
c000789d:	89 c2                	mov    %eax,%edx
c000789f:	8b 45 08             	mov    0x8(%ebp),%eax
c00078a2:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00078a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00078ab:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00078b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00078b5:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c00078bb:	83 ec 04             	sub    $0x4,%esp
c00078be:	50                   	push   %eax
c00078bf:	ff 75 0c             	pushl  0xc(%ebp)
c00078c2:	6a 01                	push   $0x1
c00078c4:	e8 a8 c4 ff ff       	call   c0003d71 <send_rec>
c00078c9:	83 c4 10             	add    $0x10,%esp
c00078cc:	90                   	nop
c00078cd:	c9                   	leave  
c00078ce:	c3                   	ret    

c00078cf <tty_do_write>:
c00078cf:	55                   	push   %ebp
c00078d0:	89 e5                	mov    %esp,%ebp
c00078d2:	53                   	push   %ebx
c00078d3:	81 ec 94 00 00 00    	sub    $0x94,%esp
c00078d9:	89 e0                	mov    %esp,%eax
c00078db:	89 c3                	mov    %eax,%ebx
c00078dd:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c00078e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00078e7:	8d 50 ff             	lea    -0x1(%eax),%edx
c00078ea:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00078ed:	89 c2                	mov    %eax,%edx
c00078ef:	b8 10 00 00 00       	mov    $0x10,%eax
c00078f4:	83 e8 01             	sub    $0x1,%eax
c00078f7:	01 d0                	add    %edx,%eax
c00078f9:	b9 10 00 00 00       	mov    $0x10,%ecx
c00078fe:	ba 00 00 00 00       	mov    $0x0,%edx
c0007903:	f7 f1                	div    %ecx
c0007905:	6b c0 10             	imul   $0x10,%eax,%eax
c0007908:	29 c4                	sub    %eax,%esp
c000790a:	89 e0                	mov    %esp,%eax
c000790c:	83 c0 00             	add    $0x0,%eax
c000790f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007912:	83 ec 04             	sub    $0x4,%esp
c0007915:	ff 75 e8             	pushl  -0x18(%ebp)
c0007918:	6a 00                	push   $0x0
c000791a:	ff 75 e0             	pushl  -0x20(%ebp)
c000791d:	e8 6d 26 00 00       	call   c0009f8f <Memset>
c0007922:	83 c4 10             	add    $0x10,%esp
c0007925:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007928:	8b 40 50             	mov    0x50(%eax),%eax
c000792b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000792e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007931:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0007938:	00 00 00 
c000793b:	e9 98 00 00 00       	jmp    c00079d8 <tty_do_write+0x109>
c0007940:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007943:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0007946:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c000794a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000794d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007950:	8b 40 10             	mov    0x10(%eax),%eax
c0007953:	89 c2                	mov    %eax,%edx
c0007955:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007958:	8b 40 58             	mov    0x58(%eax),%eax
c000795b:	83 ec 08             	sub    $0x8,%esp
c000795e:	52                   	push   %edx
c000795f:	50                   	push   %eax
c0007960:	e8 1e f6 ff ff       	call   c0006f83 <v2l>
c0007965:	83 c4 10             	add    $0x10,%esp
c0007968:	89 c2                	mov    %eax,%edx
c000796a:	8b 45 08             	mov    0x8(%ebp),%eax
c000796d:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007973:	01 d0                	add    %edx,%eax
c0007975:	83 ec 04             	sub    $0x4,%esp
c0007978:	ff 75 f0             	pushl  -0x10(%ebp)
c000797b:	50                   	push   %eax
c000797c:	ff 75 e0             	pushl  -0x20(%ebp)
c000797f:	e8 dd 25 00 00       	call   c0009f61 <Memcpy>
c0007984:	83 c4 10             	add    $0x10,%esp
c0007987:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000798a:	29 45 ec             	sub    %eax,-0x14(%ebp)
c000798d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007990:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0007996:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007999:	01 c2                	add    %eax,%edx
c000799b:	8b 45 08             	mov    0x8(%ebp),%eax
c000799e:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00079a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00079ab:	eb 25                	jmp    c00079d2 <tty_do_write+0x103>
c00079ad:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00079b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079b3:	01 d0                	add    %edx,%eax
c00079b5:	0f b6 00             	movzbl (%eax),%eax
c00079b8:	0f b6 c0             	movzbl %al,%eax
c00079bb:	83 ec 08             	sub    $0x8,%esp
c00079be:	50                   	push   %eax
c00079bf:	ff 75 08             	pushl  0x8(%ebp)
c00079c2:	e8 9f fa ff ff       	call   c0007466 <out_char>
c00079c7:	83 c4 10             	add    $0x10,%esp
c00079ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00079ce:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c00079d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00079d6:	75 d5                	jne    c00079ad <tty_do_write+0xde>
c00079d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00079dc:	0f 85 5e ff ff ff    	jne    c0007940 <tty_do_write+0x71>
c00079e2:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
c00079e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00079ec:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00079f2:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00079f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00079f8:	8b 00                	mov    (%eax),%eax
c00079fa:	83 ec 04             	sub    $0x4,%esp
c00079fd:	50                   	push   %eax
c00079fe:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0007a04:	50                   	push   %eax
c0007a05:	6a 01                	push   $0x1
c0007a07:	e8 65 c3 ff ff       	call   c0003d71 <send_rec>
c0007a0c:	83 c4 10             	add    $0x10,%esp
c0007a0f:	89 dc                	mov    %ebx,%esp
c0007a11:	90                   	nop
c0007a12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0007a15:	c9                   	leave  
c0007a16:	c3                   	ret    

c0007a17 <init_screen>:
c0007a17:	55                   	push   %ebp
c0007a18:	89 e5                	mov    %esp,%ebp
c0007a1a:	83 ec 10             	sub    $0x10,%esp
c0007a1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a20:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0007a25:	c1 f8 02             	sar    $0x2,%eax
c0007a28:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c0007a2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007a31:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a34:	c1 e0 04             	shl    $0x4,%eax
c0007a37:	8d 90 e0 1e 01 c0    	lea    -0x3ffee120(%eax),%edx
c0007a3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a40:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0007a46:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0007a4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a50:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
c0007a56:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007a59:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c0007a5e:	f7 e2                	mul    %edx
c0007a60:	89 d0                	mov    %edx,%eax
c0007a62:	d1 e8                	shr    %eax
c0007a64:	89 41 04             	mov    %eax,0x4(%ecx)
c0007a67:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a6a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007a70:	8b 50 04             	mov    0x4(%eax),%edx
c0007a73:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a76:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007a7c:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0007a80:	89 10                	mov    %edx,(%eax)
c0007a82:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a85:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0007a8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a8e:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0007a94:	8b 12                	mov    (%edx),%edx
c0007a96:	89 50 08             	mov    %edx,0x8(%eax)
c0007a99:	8b 55 08             	mov    0x8(%ebp),%edx
c0007a9c:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
c0007aa2:	8b 40 08             	mov    0x8(%eax),%eax
c0007aa5:	89 42 0c             	mov    %eax,0xc(%edx)
c0007aa8:	90                   	nop
c0007aa9:	c9                   	leave  
c0007aaa:	c3                   	ret    

c0007aab <init_tty>:
c0007aab:	55                   	push   %ebp
c0007aac:	89 e5                	mov    %esp,%ebp
c0007aae:	83 ec 18             	sub    $0x18,%esp
c0007ab1:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c0007ab8:	eb 7a                	jmp    c0007b34 <init_tty+0x89>
c0007aba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007abd:	8d 50 08             	lea    0x8(%eax),%edx
c0007ac0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ac3:	89 50 04             	mov    %edx,0x4(%eax)
c0007ac6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ac9:	8b 50 04             	mov    0x4(%eax),%edx
c0007acc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007acf:	89 10                	mov    %edx,(%eax)
c0007ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ad4:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0007adb:	00 00 00 
c0007ade:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ae1:	e8 31 ff ff ff       	call   c0007a17 <init_screen>
c0007ae6:	83 c4 04             	add    $0x4,%esp
c0007ae9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007aec:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0007af1:	85 c0                	test   %eax,%eax
c0007af3:	7e 38                	jle    c0007b2d <init_tty+0x82>
c0007af5:	83 ec 08             	sub    $0x8,%esp
c0007af8:	6a 23                	push   $0x23
c0007afa:	ff 75 f4             	pushl  -0xc(%ebp)
c0007afd:	e8 64 f9 ff ff       	call   c0007466 <out_char>
c0007b02:	83 c4 10             	add    $0x10,%esp
c0007b05:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b08:	05 e4 8e 01 00       	add    $0x18ee4,%eax
c0007b0d:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0007b12:	c1 f8 02             	sar    $0x2,%eax
c0007b15:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c0007b1b:	0f b6 c0             	movzbl %al,%eax
c0007b1e:	83 ec 08             	sub    $0x8,%esp
c0007b21:	50                   	push   %eax
c0007b22:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b25:	e8 3c f9 ff ff       	call   c0007466 <out_char>
c0007b2a:	83 c4 10             	add    $0x10,%esp
c0007b2d:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0007b34:	b8 0c 16 01 c0       	mov    $0xc001160c,%eax
c0007b39:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0007b3c:	0f 82 78 ff ff ff    	jb     c0007aba <init_tty+0xf>
c0007b42:	90                   	nop
c0007b43:	c9                   	leave  
c0007b44:	c3                   	ret    

c0007b45 <TaskTTY>:
c0007b45:	55                   	push   %ebp
c0007b46:	89 e5                	mov    %esp,%ebp
c0007b48:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0007b4e:	e8 58 ff ff ff       	call   c0007aab <init_tty>
c0007b53:	83 ec 0c             	sub    $0xc,%esp
c0007b56:	6a 01                	push   $0x1
c0007b58:	e8 bf f6 ff ff       	call   c000721c <select_console>
c0007b5d:	83 c4 10             	add    $0x10,%esp
c0007b60:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007b67:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007b6e:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c0007b75:	eb 30                	jmp    c0007ba7 <TaskTTY+0x62>
c0007b77:	83 ec 0c             	sub    $0xc,%esp
c0007b7a:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b7d:	e8 8b fa ff ff       	call   c000760d <tty_dev_read>
c0007b82:	83 c4 10             	add    $0x10,%esp
c0007b85:	83 ec 0c             	sub    $0xc,%esp
c0007b88:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b8b:	e8 a7 fa ff ff       	call   c0007637 <tty_dev_write>
c0007b90:	83 c4 10             	add    $0x10,%esp
c0007b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b96:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0007b9c:	85 c0                	test   %eax,%eax
c0007b9e:	75 d7                	jne    c0007b77 <TaskTTY+0x32>
c0007ba0:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0007ba7:	b8 0c 16 01 c0       	mov    $0xc001160c,%eax
c0007bac:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0007baf:	72 c6                	jb     c0007b77 <TaskTTY+0x32>
c0007bb1:	83 ec 04             	sub    $0x4,%esp
c0007bb4:	6a 10                	push   $0x10
c0007bb6:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0007bbc:	50                   	push   %eax
c0007bbd:	6a 02                	push   $0x2
c0007bbf:	e8 ad c1 ff ff       	call   c0003d71 <send_rec>
c0007bc4:	83 c4 10             	add    $0x10,%esp
c0007bc7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007bca:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007bcd:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
c0007bd4:	74 28                	je     c0007bfe <TaskTTY+0xb9>
c0007bd6:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
c0007bdd:	7f 0b                	jg     c0007bea <TaskTTY+0xa5>
c0007bdf:	81 7d e8 d1 07 00 00 	cmpl   $0x7d1,-0x18(%ebp)
c0007be6:	74 56                	je     c0007c3e <TaskTTY+0xf9>
c0007be8:	eb 55                	jmp    c0007c3f <TaskTTY+0xfa>
c0007bea:	81 7d e8 d3 07 00 00 	cmpl   $0x7d3,-0x18(%ebp)
c0007bf1:	74 25                	je     c0007c18 <TaskTTY+0xd3>
c0007bf3:	81 7d e8 d5 07 00 00 	cmpl   $0x7d5,-0x18(%ebp)
c0007bfa:	74 36                	je     c0007c32 <TaskTTY+0xed>
c0007bfc:	eb 41                	jmp    c0007c3f <TaskTTY+0xfa>
c0007bfe:	a1 20 e7 00 c0       	mov    0xc000e720,%eax
c0007c03:	83 ec 08             	sub    $0x8,%esp
c0007c06:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
c0007c0c:	52                   	push   %edx
c0007c0d:	50                   	push   %eax
c0007c0e:	e8 2b fc ff ff       	call   c000783e <tty_do_read>
c0007c13:	83 c4 10             	add    $0x10,%esp
c0007c16:	eb 27                	jmp    c0007c3f <TaskTTY+0xfa>
c0007c18:	a1 20 e7 00 c0       	mov    0xc000e720,%eax
c0007c1d:	83 ec 08             	sub    $0x8,%esp
c0007c20:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
c0007c26:	52                   	push   %edx
c0007c27:	50                   	push   %eax
c0007c28:	e8 a2 fc ff ff       	call   c00078cf <tty_do_write>
c0007c2d:	83 c4 10             	add    $0x10,%esp
c0007c30:	eb 0d                	jmp    c0007c3f <TaskTTY+0xfa>
c0007c32:	c7 05 a0 16 01 c0 00 	movl   $0x0,0xc00116a0
c0007c39:	00 00 00 
c0007c3c:	eb 01                	jmp    c0007c3f <TaskTTY+0xfa>
c0007c3e:	90                   	nop
c0007c3f:	e9 2a ff ff ff       	jmp    c0007b6e <TaskTTY+0x29>

c0007c44 <keyboard_handler>:
c0007c44:	55                   	push   %ebp
c0007c45:	89 e5                	mov    %esp,%ebp
c0007c47:	83 ec 18             	sub    $0x18,%esp
c0007c4a:	c7 05 a0 16 01 c0 01 	movl   $0x1,0xc00116a0
c0007c51:	00 00 00 
c0007c54:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0007c5b:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0007c60:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0007c65:	7f 5c                	jg     c0007cc3 <keyboard_handler+0x7f>
c0007c67:	e8 95 9b ff ff       	call   c0001801 <disable_int>
c0007c6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c6f:	0f b7 c0             	movzwl %ax,%eax
c0007c72:	83 ec 0c             	sub    $0xc,%esp
c0007c75:	50                   	push   %eax
c0007c76:	e8 58 9b ff ff       	call   c00017d3 <in_byte>
c0007c7b:	83 c4 10             	add    $0x10,%esp
c0007c7e:	88 45 f3             	mov    %al,-0xd(%ebp)
c0007c81:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0007c86:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0007c8a:	88 10                	mov    %dl,(%eax)
c0007c8c:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0007c91:	83 c0 01             	add    $0x1,%eax
c0007c94:	a3 80 fb 00 c0       	mov    %eax,0xc000fb80
c0007c99:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0007c9e:	83 c0 01             	add    $0x1,%eax
c0007ca1:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c0007ca6:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0007cab:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0007cb0:	39 d0                	cmp    %edx,%eax
c0007cb2:	72 0a                	jb     c0007cbe <keyboard_handler+0x7a>
c0007cb4:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0007cbb:	fb 00 c0 
c0007cbe:	e8 40 9b ff ff       	call   c0001803 <enable_int>
c0007cc3:	90                   	nop
c0007cc4:	c9                   	leave  
c0007cc5:	c3                   	ret    

c0007cc6 <read_from_keyboard_buf>:
c0007cc6:	55                   	push   %ebp
c0007cc7:	89 e5                	mov    %esp,%ebp
c0007cc9:	83 ec 18             	sub    $0x18,%esp
c0007ccc:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0007cd0:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0007cd5:	85 c0                	test   %eax,%eax
c0007cd7:	7e 47                	jle    c0007d20 <read_from_keyboard_buf+0x5a>
c0007cd9:	e8 23 9b ff ff       	call   c0001801 <disable_int>
c0007cde:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0007ce3:	0f b6 00             	movzbl (%eax),%eax
c0007ce6:	88 45 f7             	mov    %al,-0x9(%ebp)
c0007ce9:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0007cee:	83 c0 01             	add    $0x1,%eax
c0007cf1:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0007cf6:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0007cfb:	83 e8 01             	sub    $0x1,%eax
c0007cfe:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c0007d03:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0007d08:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0007d0d:	39 d0                	cmp    %edx,%eax
c0007d0f:	72 0a                	jb     c0007d1b <read_from_keyboard_buf+0x55>
c0007d11:	c7 05 84 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb84
c0007d18:	fb 00 c0 
c0007d1b:	e8 e3 9a ff ff       	call   c0001803 <enable_int>
c0007d20:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0007d24:	c9                   	leave  
c0007d25:	c3                   	ret    

c0007d26 <keyboard_read>:
c0007d26:	55                   	push   %ebp
c0007d27:	89 e5                	mov    %esp,%ebp
c0007d29:	83 ec 28             	sub    $0x28,%esp
c0007d2c:	90                   	nop
c0007d2d:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0007d32:	85 c0                	test   %eax,%eax
c0007d34:	7e f7                	jle    c0007d2d <keyboard_read+0x7>
c0007d36:	e8 8b ff ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007d3b:	88 45 ea             	mov    %al,-0x16(%ebp)
c0007d3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007d45:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0007d49:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0007d4d:	75 5a                	jne    c0007da9 <keyboard_read+0x83>
c0007d4f:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0007d53:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0007d57:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0007d5b:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0007d5f:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0007d63:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0007d67:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0007d6b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0007d72:	eb 20                	jmp    c0007d94 <keyboard_read+0x6e>
c0007d74:	e8 4d ff ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007d79:	89 c1                	mov    %eax,%ecx
c0007d7b:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0007d7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d81:	01 d0                	add    %edx,%eax
c0007d83:	0f b6 00             	movzbl (%eax),%eax
c0007d86:	38 c1                	cmp    %al,%cl
c0007d88:	74 06                	je     c0007d90 <keyboard_read+0x6a>
c0007d8a:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0007d8e:	eb 0a                	jmp    c0007d9a <keyboard_read+0x74>
c0007d90:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007d94:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0007d98:	7e da                	jle    c0007d74 <keyboard_read+0x4e>
c0007d9a:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0007d9e:	74 68                	je     c0007e08 <keyboard_read+0xe2>
c0007da0:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0007da7:	eb 5f                	jmp    c0007e08 <keyboard_read+0xe2>
c0007da9:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0007dad:	75 59                	jne    c0007e08 <keyboard_read+0xe2>
c0007daf:	e8 12 ff ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007db4:	3c 2a                	cmp    $0x2a,%al
c0007db6:	75 1d                	jne    c0007dd5 <keyboard_read+0xaf>
c0007db8:	e8 09 ff ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007dbd:	3c e0                	cmp    $0xe0,%al
c0007dbf:	75 14                	jne    c0007dd5 <keyboard_read+0xaf>
c0007dc1:	e8 00 ff ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007dc6:	3c 37                	cmp    $0x37,%al
c0007dc8:	75 0b                	jne    c0007dd5 <keyboard_read+0xaf>
c0007dca:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0007dd1:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0007dd5:	e8 ec fe ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007dda:	3c b7                	cmp    $0xb7,%al
c0007ddc:	75 1d                	jne    c0007dfb <keyboard_read+0xd5>
c0007dde:	e8 e3 fe ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007de3:	3c e0                	cmp    $0xe0,%al
c0007de5:	75 14                	jne    c0007dfb <keyboard_read+0xd5>
c0007de7:	e8 da fe ff ff       	call   c0007cc6 <read_from_keyboard_buf>
c0007dec:	3c aa                	cmp    $0xaa,%al
c0007dee:	75 0b                	jne    c0007dfb <keyboard_read+0xd5>
c0007df0:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0007df7:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0007dfb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007dff:	75 07                	jne    c0007e08 <keyboard_read+0xe2>
c0007e01:	c6 05 24 e7 00 c0 01 	movb   $0x1,0xc000e724
c0007e08:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0007e0f:	0f 84 8d 00 00 00    	je     c0007ea2 <keyboard_read+0x17c>
c0007e15:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0007e1c:	0f 84 80 00 00 00    	je     c0007ea2 <keyboard_read+0x17c>
c0007e22:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0007e26:	0f 94 c2             	sete   %dl
c0007e29:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0007e2d:	0f 94 c0             	sete   %al
c0007e30:	09 d0                	or     %edx,%eax
c0007e32:	84 c0                	test   %al,%al
c0007e34:	74 07                	je     c0007e3d <keyboard_read+0x117>
c0007e36:	c6 05 a4 16 01 c0 01 	movb   $0x1,0xc00116a4
c0007e3d:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0007e41:	f7 d0                	not    %eax
c0007e43:	c0 e8 07             	shr    $0x7,%al
c0007e46:	88 45 e9             	mov    %al,-0x17(%ebp)
c0007e49:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0007e4d:	74 53                	je     c0007ea2 <keyboard_read+0x17c>
c0007e4f:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0007e53:	74 4d                	je     c0007ea2 <keyboard_read+0x17c>
c0007e55:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0007e59:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0007e60:	3c 01                	cmp    $0x1,%al
c0007e62:	75 04                	jne    c0007e68 <keyboard_read+0x142>
c0007e64:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0007e68:	0f b6 05 24 e7 00 c0 	movzbl 0xc000e724,%eax
c0007e6f:	84 c0                	test   %al,%al
c0007e71:	74 04                	je     c0007e77 <keyboard_read+0x151>
c0007e73:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0007e77:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0007e7b:	89 d0                	mov    %edx,%eax
c0007e7d:	01 c0                	add    %eax,%eax
c0007e7f:	01 c2                	add    %eax,%edx
c0007e81:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0007e85:	01 d0                	add    %edx,%eax
c0007e87:	8b 04 85 00 d1 00 c0 	mov    -0x3fff2f00(,%eax,4),%eax
c0007e8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007e91:	83 ec 08             	sub    $0x8,%esp
c0007e94:	ff 75 f4             	pushl  -0xc(%ebp)
c0007e97:	ff 75 08             	pushl  0x8(%ebp)
c0007e9a:	e8 1a 00 00 00       	call   c0007eb9 <in_process>
c0007e9f:	83 c4 10             	add    $0x10,%esp
c0007ea2:	90                   	nop
c0007ea3:	c9                   	leave  
c0007ea4:	c3                   	ret    

c0007ea5 <init_keyboard_handler>:
c0007ea5:	55                   	push   %ebp
c0007ea6:	89 e5                	mov    %esp,%ebp
c0007ea8:	c6 05 24 e7 00 c0 00 	movb   $0x0,0xc000e724
c0007eaf:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0007eb6:	90                   	nop
c0007eb7:	5d                   	pop    %ebp
c0007eb8:	c3                   	ret    

c0007eb9 <in_process>:
c0007eb9:	55                   	push   %ebp
c0007eba:	89 e5                	mov    %esp,%ebp
c0007ebc:	83 ec 18             	sub    $0x18,%esp
c0007ebf:	83 ec 04             	sub    $0x4,%esp
c0007ec2:	6a 02                	push   $0x2
c0007ec4:	6a 00                	push   $0x0
c0007ec6:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0007ec9:	50                   	push   %eax
c0007eca:	e8 c0 20 00 00       	call   c0009f8f <Memset>
c0007ecf:	83 c4 10             	add    $0x10,%esp
c0007ed2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007ed5:	25 00 01 00 00       	and    $0x100,%eax
c0007eda:	85 c0                	test   %eax,%eax
c0007edc:	75 28                	jne    c0007f06 <in_process+0x4d>
c0007ede:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007ee1:	0f b6 c0             	movzbl %al,%eax
c0007ee4:	83 ec 08             	sub    $0x8,%esp
c0007ee7:	50                   	push   %eax
c0007ee8:	ff 75 08             	pushl  0x8(%ebp)
c0007eeb:	e8 5d f4 ff ff       	call   c000734d <put_key>
c0007ef0:	83 c4 10             	add    $0x10,%esp
c0007ef3:	c6 05 24 e7 00 c0 00 	movb   $0x0,0xc000e724
c0007efa:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0007f01:	e9 42 01 00 00       	jmp    c0008048 <in_process+0x18f>
c0007f06:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0007f0d:	84 c0                	test   %al,%al
c0007f0f:	0f 84 a9 00 00 00    	je     c0007fbe <in_process+0x105>
c0007f15:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0007f19:	0f 84 9f 00 00 00    	je     c0007fbe <in_process+0x105>
c0007f1f:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0007f23:	0f 84 95 00 00 00    	je     c0007fbe <in_process+0x105>
c0007f29:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0007f30:	74 64                	je     c0007f96 <in_process+0xdd>
c0007f32:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0007f39:	77 0b                	ja     c0007f46 <in_process+0x8d>
c0007f3b:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0007f42:	74 64                	je     c0007fa8 <in_process+0xef>
c0007f44:	eb 73                	jmp    c0007fb9 <in_process+0x100>
c0007f46:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0007f4d:	74 0b                	je     c0007f5a <in_process+0xa1>
c0007f4f:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0007f56:	74 20                	je     c0007f78 <in_process+0xbf>
c0007f58:	eb 5f                	jmp    c0007fb9 <in_process+0x100>
c0007f5a:	83 ec 0c             	sub    $0xc,%esp
c0007f5d:	ff 75 08             	pushl  0x8(%ebp)
c0007f60:	e8 54 f4 ff ff       	call   c00073b9 <scroll_up>
c0007f65:	83 c4 10             	add    $0x10,%esp
c0007f68:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0007f6f:	c6 05 24 e7 00 c0 00 	movb   $0x0,0xc000e724
c0007f76:	eb 41                	jmp    c0007fb9 <in_process+0x100>
c0007f78:	83 ec 0c             	sub    $0xc,%esp
c0007f7b:	ff 75 08             	pushl  0x8(%ebp)
c0007f7e:	e8 78 f4 ff ff       	call   c00073fb <scroll_down>
c0007f83:	83 c4 10             	add    $0x10,%esp
c0007f86:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0007f8d:	c6 05 24 e7 00 c0 00 	movb   $0x0,0xc000e724
c0007f94:	eb 23                	jmp    c0007fb9 <in_process+0x100>
c0007f96:	83 ec 08             	sub    $0x8,%esp
c0007f99:	6a 0a                	push   $0xa
c0007f9b:	ff 75 08             	pushl  0x8(%ebp)
c0007f9e:	e8 c3 f4 ff ff       	call   c0007466 <out_char>
c0007fa3:	83 c4 10             	add    $0x10,%esp
c0007fa6:	eb 11                	jmp    c0007fb9 <in_process+0x100>
c0007fa8:	83 ec 08             	sub    $0x8,%esp
c0007fab:	6a 08                	push   $0x8
c0007fad:	ff 75 08             	pushl  0x8(%ebp)
c0007fb0:	e8 b1 f4 ff ff       	call   c0007466 <out_char>
c0007fb5:	83 c4 10             	add    $0x10,%esp
c0007fb8:	90                   	nop
c0007fb9:	e9 8a 00 00 00       	jmp    c0008048 <in_process+0x18f>
c0007fbe:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0007fc5:	74 55                	je     c000801c <in_process+0x163>
c0007fc7:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0007fce:	77 14                	ja     c0007fe4 <in_process+0x12b>
c0007fd0:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0007fd7:	74 31                	je     c000800a <in_process+0x151>
c0007fd9:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0007fe0:	74 16                	je     c0007ff8 <in_process+0x13f>
c0007fe2:	eb 64                	jmp    c0008048 <in_process+0x18f>
c0007fe4:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0007feb:	74 3e                	je     c000802b <in_process+0x172>
c0007fed:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0007ff4:	74 44                	je     c000803a <in_process+0x181>
c0007ff6:	eb 50                	jmp    c0008048 <in_process+0x18f>
c0007ff8:	83 ec 08             	sub    $0x8,%esp
c0007ffb:	6a 0a                	push   $0xa
c0007ffd:	ff 75 08             	pushl  0x8(%ebp)
c0008000:	e8 48 f3 ff ff       	call   c000734d <put_key>
c0008005:	83 c4 10             	add    $0x10,%esp
c0008008:	eb 3e                	jmp    c0008048 <in_process+0x18f>
c000800a:	83 ec 08             	sub    $0x8,%esp
c000800d:	6a 08                	push   $0x8
c000800f:	ff 75 08             	pushl  0x8(%ebp)
c0008012:	e8 36 f3 ff ff       	call   c000734d <put_key>
c0008017:	83 c4 10             	add    $0x10,%esp
c000801a:	eb 2c                	jmp    c0008048 <in_process+0x18f>
c000801c:	83 ec 0c             	sub    $0xc,%esp
c000801f:	6a 00                	push   $0x0
c0008021:	e8 f6 f1 ff ff       	call   c000721c <select_console>
c0008026:	83 c4 10             	add    $0x10,%esp
c0008029:	eb 1d                	jmp    c0008048 <in_process+0x18f>
c000802b:	83 ec 0c             	sub    $0xc,%esp
c000802e:	6a 01                	push   $0x1
c0008030:	e8 e7 f1 ff ff       	call   c000721c <select_console>
c0008035:	83 c4 10             	add    $0x10,%esp
c0008038:	eb 0e                	jmp    c0008048 <in_process+0x18f>
c000803a:	83 ec 0c             	sub    $0xc,%esp
c000803d:	6a 02                	push   $0x2
c000803f:	e8 d8 f1 ff ff       	call   c000721c <select_console>
c0008044:	83 c4 10             	add    $0x10,%esp
c0008047:	90                   	nop
c0008048:	90                   	nop
c0008049:	c9                   	leave  
c000804a:	c3                   	ret    

c000804b <open>:
c000804b:	55                   	push   %ebp
c000804c:	89 e5                	mov    %esp,%ebp
c000804e:	83 ec 78             	sub    $0x78,%esp
c0008051:	83 ec 04             	sub    $0x4,%esp
c0008054:	6a 6c                	push   $0x6c
c0008056:	6a 00                	push   $0x0
c0008058:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000805b:	50                   	push   %eax
c000805c:	e8 2e 1f 00 00       	call   c0009f8f <Memset>
c0008061:	83 c4 10             	add    $0x10,%esp
c0008064:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c000806b:	8b 45 08             	mov    0x8(%ebp),%eax
c000806e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008071:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008074:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008077:	83 ec 0c             	sub    $0xc,%esp
c000807a:	ff 75 08             	pushl  0x8(%ebp)
c000807d:	e8 46 1f 00 00       	call   c0009fc8 <Strlen>
c0008082:	83 c4 10             	add    $0x10,%esp
c0008085:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0008088:	83 ec 04             	sub    $0x4,%esp
c000808b:	6a 03                	push   $0x3
c000808d:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008090:	50                   	push   %eax
c0008091:	6a 03                	push   $0x3
c0008093:	e8 d9 bc ff ff       	call   c0003d71 <send_rec>
c0008098:	83 c4 10             	add    $0x10,%esp
c000809b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000809e:	c9                   	leave  
c000809f:	c3                   	ret    

c00080a0 <read>:
c00080a0:	55                   	push   %ebp
c00080a1:	89 e5                	mov    %esp,%ebp
c00080a3:	83 ec 78             	sub    $0x78,%esp
c00080a6:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
c00080ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00080b0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00080b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00080b6:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00080b9:	8b 45 10             	mov    0x10(%ebp),%eax
c00080bc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00080bf:	83 ec 04             	sub    $0x4,%esp
c00080c2:	6a 03                	push   $0x3
c00080c4:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00080c7:	50                   	push   %eax
c00080c8:	6a 03                	push   $0x3
c00080ca:	e8 a2 bc ff ff       	call   c0003d71 <send_rec>
c00080cf:	83 c4 10             	add    $0x10,%esp
c00080d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00080d5:	c9                   	leave  
c00080d6:	c3                   	ret    

c00080d7 <write>:
c00080d7:	55                   	push   %ebp
c00080d8:	89 e5                	mov    %esp,%ebp
c00080da:	83 ec 78             	sub    $0x78,%esp
c00080dd:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
c00080e4:	8b 45 08             	mov    0x8(%ebp),%eax
c00080e7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00080ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c00080ed:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00080f0:	8b 45 10             	mov    0x10(%ebp),%eax
c00080f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00080f6:	83 ec 04             	sub    $0x4,%esp
c00080f9:	6a 03                	push   $0x3
c00080fb:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00080fe:	50                   	push   %eax
c00080ff:	6a 03                	push   $0x3
c0008101:	e8 6b bc ff ff       	call   c0003d71 <send_rec>
c0008106:	83 c4 10             	add    $0x10,%esp
c0008109:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000810c:	c9                   	leave  
c000810d:	c3                   	ret    

c000810e <close>:
c000810e:	55                   	push   %ebp
c000810f:	89 e5                	mov    %esp,%ebp
c0008111:	83 ec 78             	sub    $0x78,%esp
c0008114:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000811b:	8b 45 08             	mov    0x8(%ebp),%eax
c000811e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008121:	83 ec 04             	sub    $0x4,%esp
c0008124:	6a 03                	push   $0x3
c0008126:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008129:	50                   	push   %eax
c000812a:	6a 03                	push   $0x3
c000812c:	e8 40 bc ff ff       	call   c0003d71 <send_rec>
c0008131:	83 c4 10             	add    $0x10,%esp
c0008134:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008137:	83 f8 65             	cmp    $0x65,%eax
c000813a:	74 19                	je     c0008155 <close+0x47>
c000813c:	6a 14                	push   $0x14
c000813e:	68 a5 9e 00 c0       	push   $0xc0009ea5
c0008143:	68 a5 9e 00 c0       	push   $0xc0009ea5
c0008148:	68 b1 9e 00 c0       	push   $0xc0009eb1
c000814d:	e8 b3 b3 ff ff       	call   c0003505 <assertion_failure>
c0008152:	83 c4 10             	add    $0x10,%esp
c0008155:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008158:	c9                   	leave  
c0008159:	c3                   	ret    

c000815a <wait>:
c000815a:	55                   	push   %ebp
c000815b:	89 e5                	mov    %esp,%ebp
c000815d:	83 ec 78             	sub    $0x78,%esp
c0008160:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0008167:	83 ec 04             	sub    $0x4,%esp
c000816a:	6a 04                	push   $0x4
c000816c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000816f:	50                   	push   %eax
c0008170:	6a 03                	push   $0x3
c0008172:	e8 fa bb ff ff       	call   c0003d71 <send_rec>
c0008177:	83 c4 10             	add    $0x10,%esp
c000817a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000817d:	89 c2                	mov    %eax,%edx
c000817f:	8b 45 08             	mov    0x8(%ebp),%eax
c0008182:	89 10                	mov    %edx,(%eax)
c0008184:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008187:	83 f8 1f             	cmp    $0x1f,%eax
c000818a:	74 05                	je     c0008191 <wait+0x37>
c000818c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000818f:	eb 05                	jmp    c0008196 <wait+0x3c>
c0008191:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0008196:	c9                   	leave  
c0008197:	c3                   	ret    

c0008198 <exit>:
c0008198:	55                   	push   %ebp
c0008199:	89 e5                	mov    %esp,%ebp
c000819b:	83 ec 78             	sub    $0x78,%esp
c000819e:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c00081a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00081a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00081ab:	83 ec 04             	sub    $0x4,%esp
c00081ae:	6a 04                	push   $0x4
c00081b0:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00081b3:	50                   	push   %eax
c00081b4:	6a 03                	push   $0x3
c00081b6:	e8 b6 bb ff ff       	call   c0003d71 <send_rec>
c00081bb:	83 c4 10             	add    $0x10,%esp
c00081be:	90                   	nop
c00081bf:	c9                   	leave  
c00081c0:	c3                   	ret    

c00081c1 <fork>:
c00081c1:	55                   	push   %ebp
c00081c2:	89 e5                	mov    %esp,%ebp
c00081c4:	83 ec 78             	sub    $0x78,%esp
c00081c7:	83 ec 04             	sub    $0x4,%esp
c00081ca:	6a 6c                	push   $0x6c
c00081cc:	6a 00                	push   $0x0
c00081ce:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00081d1:	50                   	push   %eax
c00081d2:	e8 b8 1d 00 00       	call   c0009f8f <Memset>
c00081d7:	83 c4 10             	add    $0x10,%esp
c00081da:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00081e1:	83 ec 04             	sub    $0x4,%esp
c00081e4:	6a 04                	push   $0x4
c00081e6:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00081e9:	50                   	push   %eax
c00081ea:	6a 03                	push   $0x3
c00081ec:	e8 80 bb ff ff       	call   c0003d71 <send_rec>
c00081f1:	83 c4 10             	add    $0x10,%esp
c00081f4:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00081fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00081fe:	85 c0                	test   %eax,%eax
c0008200:	74 19                	je     c000821b <fork+0x5a>
c0008202:	6a 15                	push   $0x15
c0008204:	68 c9 9e 00 c0       	push   $0xc0009ec9
c0008209:	68 c9 9e 00 c0       	push   $0xc0009ec9
c000820e:	68 d4 9e 00 c0       	push   $0xc0009ed4
c0008213:	e8 ed b2 ff ff       	call   c0003505 <assertion_failure>
c0008218:	83 c4 10             	add    $0x10,%esp
c000821b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000821e:	c9                   	leave  
c000821f:	c3                   	ret    

c0008220 <getpid>:
c0008220:	55                   	push   %ebp
c0008221:	89 e5                	mov    %esp,%ebp
c0008223:	83 ec 78             	sub    $0x78,%esp
c0008226:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c000822d:	83 ec 04             	sub    $0x4,%esp
c0008230:	6a 01                	push   $0x1
c0008232:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008235:	50                   	push   %eax
c0008236:	6a 03                	push   $0x3
c0008238:	e8 34 bb ff ff       	call   c0003d71 <send_rec>
c000823d:	83 c4 10             	add    $0x10,%esp
c0008240:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008243:	c9                   	leave  
c0008244:	c3                   	ret    

c0008245 <exec>:
c0008245:	55                   	push   %ebp
c0008246:	89 e5                	mov    %esp,%ebp
c0008248:	83 ec 78             	sub    $0x78,%esp
c000824b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0008252:	8b 45 08             	mov    0x8(%ebp),%eax
c0008255:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008258:	83 ec 0c             	sub    $0xc,%esp
c000825b:	ff 75 08             	pushl  0x8(%ebp)
c000825e:	e8 65 1d 00 00       	call   c0009fc8 <Strlen>
c0008263:	83 c4 10             	add    $0x10,%esp
c0008266:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0008269:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0008270:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0008277:	83 ec 04             	sub    $0x4,%esp
c000827a:	6a 04                	push   $0x4
c000827c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000827f:	50                   	push   %eax
c0008280:	6a 03                	push   $0x3
c0008282:	e8 ea ba ff ff       	call   c0003d71 <send_rec>
c0008287:	83 c4 10             	add    $0x10,%esp
c000828a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000828d:	83 f8 65             	cmp    $0x65,%eax
c0008290:	74 19                	je     c00082ab <exec+0x66>
c0008292:	6a 1a                	push   $0x1a
c0008294:	68 e4 9e 00 c0       	push   $0xc0009ee4
c0008299:	68 e4 9e 00 c0       	push   $0xc0009ee4
c000829e:	68 ef 9e 00 c0       	push   $0xc0009eef
c00082a3:	e8 5d b2 ff ff       	call   c0003505 <assertion_failure>
c00082a8:	83 c4 10             	add    $0x10,%esp
c00082ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00082ae:	c9                   	leave  
c00082af:	c3                   	ret    

c00082b0 <execv>:
c00082b0:	55                   	push   %ebp
c00082b1:	89 e5                	mov    %esp,%ebp
c00082b3:	57                   	push   %edi
c00082b4:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c00082ba:	83 ec 04             	sub    $0x4,%esp
c00082bd:	68 00 80 00 00       	push   $0x8000
c00082c2:	6a 00                	push   $0x0
c00082c4:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00082ca:	50                   	push   %eax
c00082cb:	e8 bf 1c 00 00       	call   c0009f8f <Memset>
c00082d0:	83 c4 10             	add    $0x10,%esp
c00082d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00082d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00082d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00082e0:	eb 0d                	jmp    c00082ef <execv+0x3f>
c00082e2:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00082e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00082e9:	83 c0 04             	add    $0x4,%eax
c00082ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00082ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00082f2:	8b 00                	mov    (%eax),%eax
c00082f4:	85 c0                	test   %eax,%eax
c00082f6:	75 ea                	jne    c00082e2 <execv+0x32>
c00082f8:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00082fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008301:	01 d0                	add    %edx,%eax
c0008303:	c6 00 00             	movb   $0x0,(%eax)
c0008306:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008309:	83 c0 04             	add    $0x4,%eax
c000830c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000830f:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0008315:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008318:	8b 45 0c             	mov    0xc(%ebp),%eax
c000831b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000831e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008325:	eb 64                	jmp    c000838b <execv+0xdb>
c0008327:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000832d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008330:	01 c2                	add    %eax,%edx
c0008332:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008335:	89 10                	mov    %edx,(%eax)
c0008337:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000833a:	8b 00                	mov    (%eax),%eax
c000833c:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0008342:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0008345:	01 ca                	add    %ecx,%edx
c0008347:	83 ec 08             	sub    $0x8,%esp
c000834a:	50                   	push   %eax
c000834b:	52                   	push   %edx
c000834c:	e8 5d 1c 00 00       	call   c0009fae <Strcpy>
c0008351:	83 c4 10             	add    $0x10,%esp
c0008354:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008357:	8b 00                	mov    (%eax),%eax
c0008359:	83 ec 0c             	sub    $0xc,%esp
c000835c:	50                   	push   %eax
c000835d:	e8 66 1c 00 00       	call   c0009fc8 <Strlen>
c0008362:	83 c4 10             	add    $0x10,%esp
c0008365:	01 45 f0             	add    %eax,-0x10(%ebp)
c0008368:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000836e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008371:	01 d0                	add    %edx,%eax
c0008373:	c6 00 00             	movb   $0x0,(%eax)
c0008376:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008379:	83 c0 01             	add    $0x1,%eax
c000837c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000837f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0008383:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0008387:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000838b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000838e:	8b 00                	mov    (%eax),%eax
c0008390:	85 c0                	test   %eax,%eax
c0008392:	75 93                	jne    c0008327 <execv+0x77>
c0008394:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000839a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000839d:	eb 04                	jmp    c00083a3 <execv+0xf3>
c000839f:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00083a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00083a6:	8b 00                	mov    (%eax),%eax
c00083a8:	85 c0                	test   %eax,%eax
c00083aa:	75 f3                	jne    c000839f <execv+0xef>
c00083ac:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c00083b2:	b8 00 00 00 00       	mov    $0x0,%eax
c00083b7:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00083bc:	89 d7                	mov    %edx,%edi
c00083be:	f3 ab                	rep stos %eax,%es:(%edi)
c00083c0:	c7 85 4c 7f ff ff 07 	movl   $0xc0009f07,-0x80b4(%ebp)
c00083c7:	9f 00 c0 
c00083ca:	c7 85 50 7f ff ff 0e 	movl   $0xc0009f0e,-0x80b0(%ebp)
c00083d1:	9f 00 c0 
c00083d4:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c00083db:	00 00 00 
c00083de:	8b 45 08             	mov    0x8(%ebp),%eax
c00083e1:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c00083e7:	83 ec 0c             	sub    $0xc,%esp
c00083ea:	ff 75 08             	pushl  0x8(%ebp)
c00083ed:	e8 d6 1b 00 00       	call   c0009fc8 <Strlen>
c00083f2:	83 c4 10             	add    $0x10,%esp
c00083f5:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c00083fb:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0008401:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0008407:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000840a:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0008410:	83 ec 04             	sub    $0x4,%esp
c0008413:	6a 04                	push   $0x4
c0008415:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c000841b:	50                   	push   %eax
c000841c:	6a 03                	push   $0x3
c000841e:	e8 4e b9 ff ff       	call   c0003d71 <send_rec>
c0008423:	83 c4 10             	add    $0x10,%esp
c0008426:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c000842c:	83 f8 65             	cmp    $0x65,%eax
c000842f:	74 19                	je     c000844a <execv+0x19a>
c0008431:	6a 73                	push   $0x73
c0008433:	68 e4 9e 00 c0       	push   $0xc0009ee4
c0008438:	68 e4 9e 00 c0       	push   $0xc0009ee4
c000843d:	68 ef 9e 00 c0       	push   $0xc0009eef
c0008442:	e8 be b0 ff ff       	call   c0003505 <assertion_failure>
c0008447:	83 c4 10             	add    $0x10,%esp
c000844a:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0008450:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0008453:	c9                   	leave  
c0008454:	c3                   	ret    

c0008455 <execl>:
c0008455:	55                   	push   %ebp
c0008456:	89 e5                	mov    %esp,%ebp
c0008458:	83 ec 18             	sub    $0x18,%esp
c000845b:	8d 45 0c             	lea    0xc(%ebp),%eax
c000845e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008461:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008464:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008467:	83 ec 08             	sub    $0x8,%esp
c000846a:	ff 75 f0             	pushl  -0x10(%ebp)
c000846d:	ff 75 08             	pushl  0x8(%ebp)
c0008470:	e8 3b fe ff ff       	call   c00082b0 <execv>
c0008475:	83 c4 10             	add    $0x10,%esp
c0008478:	c9                   	leave  
c0008479:	c3                   	ret    

c000847a <TaskMM>:
c000847a:	55                   	push   %ebp
c000847b:	89 e5                	mov    %esp,%ebp
c000847d:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008483:	83 ec 04             	sub    $0x4,%esp
c0008486:	6a 10                	push   $0x10
c0008488:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c000848e:	50                   	push   %eax
c000848f:	6a 02                	push   $0x2
c0008491:	e8 db b8 ff ff       	call   c0003d71 <send_rec>
c0008496:	83 c4 10             	add    $0x10,%esp
c0008499:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000849f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00084a2:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c00084a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00084ab:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00084b2:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
c00084b9:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c00084c0:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
c00084c7:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c00084cb:	74 4e                	je     c000851b <TaskMM+0xa1>
c00084cd:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c00084d1:	7f 08                	jg     c00084db <TaskMM+0x61>
c00084d3:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c00084d7:	74 27                	je     c0008500 <TaskMM+0x86>
c00084d9:	eb 79                	jmp    c0008554 <TaskMM+0xda>
c00084db:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c00084df:	74 08                	je     c00084e9 <TaskMM+0x6f>
c00084e1:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
c00084e5:	74 52                	je     c0008539 <TaskMM+0xbf>
c00084e7:	eb 6b                	jmp    c0008554 <TaskMM+0xda>
c00084e9:	83 ec 0c             	sub    $0xc,%esp
c00084ec:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c00084f2:	50                   	push   %eax
c00084f3:	e8 f6 03 00 00       	call   c00088ee <do_fork>
c00084f8:	83 c4 10             	add    $0x10,%esp
c00084fb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00084fe:	eb 65                	jmp    c0008565 <TaskMM+0xeb>
c0008500:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008507:	83 ec 0c             	sub    $0xc,%esp
c000850a:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0008510:	50                   	push   %eax
c0008511:	e8 a8 00 00 00       	call   c00085be <do_exec>
c0008516:	83 c4 10             	add    $0x10,%esp
c0008519:	eb 4a                	jmp    c0008565 <TaskMM+0xeb>
c000851b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008522:	83 ec 08             	sub    $0x8,%esp
c0008525:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008528:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c000852e:	50                   	push   %eax
c000852f:	e8 c4 05 00 00       	call   c0008af8 <do_exit>
c0008534:	83 c4 10             	add    $0x10,%esp
c0008537:	eb 2c                	jmp    c0008565 <TaskMM+0xeb>
c0008539:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008540:	83 ec 0c             	sub    $0xc,%esp
c0008543:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0008549:	50                   	push   %eax
c000854a:	e8 a5 06 00 00       	call   c0008bf4 <do_wait>
c000854f:	83 c4 10             	add    $0x10,%esp
c0008552:	eb 11                	jmp    c0008565 <TaskMM+0xeb>
c0008554:	83 ec 0c             	sub    $0xc,%esp
c0008557:	68 15 9f 00 c0       	push   $0xc0009f15
c000855c:	e8 86 af ff ff       	call   c00034e7 <panic>
c0008561:	83 c4 10             	add    $0x10,%esp
c0008564:	90                   	nop
c0008565:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008569:	0f 84 14 ff ff ff    	je     c0008483 <TaskMM+0x9>
c000856f:	83 ec 04             	sub    $0x4,%esp
c0008572:	ff 75 ec             	pushl  -0x14(%ebp)
c0008575:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
c000857b:	50                   	push   %eax
c000857c:	6a 01                	push   $0x1
c000857e:	e8 ee b7 ff ff       	call   c0003d71 <send_rec>
c0008583:	83 c4 10             	add    $0x10,%esp
c0008586:	e9 f8 fe ff ff       	jmp    c0008483 <TaskMM+0x9>

c000858b <alloc_mem>:
c000858b:	55                   	push   %ebp
c000858c:	89 e5                	mov    %esp,%ebp
c000858e:	83 ec 10             	sub    $0x10,%esp
c0008591:	8b 45 08             	mov    0x8(%ebp),%eax
c0008594:	83 e8 06             	sub    $0x6,%eax
c0008597:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c000859d:	05 00 00 a0 00       	add    $0xa00000,%eax
c00085a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00085a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00085a8:	c9                   	leave  
c00085a9:	c3                   	ret    

c00085aa <do_exec2>:
c00085aa:	55                   	push   %ebp
c00085ab:	89 e5                	mov    %esp,%ebp
c00085ad:	83 ec 10             	sub    $0x10,%esp
c00085b0:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c00085b7:	b8 00 00 00 00       	mov    $0x0,%eax
c00085bc:	c9                   	leave  
c00085bd:	c3                   	ret    

c00085be <do_exec>:
c00085be:	55                   	push   %ebp
c00085bf:	89 e5                	mov    %esp,%ebp
c00085c1:	56                   	push   %esi
c00085c2:	53                   	push   %ebx
c00085c3:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c00085c9:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c00085d0:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c00085d7:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c00085dd:	83 ec 08             	sub    $0x8,%esp
c00085e0:	6a 00                	push   $0x0
c00085e2:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00085e5:	50                   	push   %eax
c00085e6:	e8 60 fa ff ff       	call   c000804b <open>
c00085eb:	83 c4 10             	add    $0x10,%esp
c00085ee:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00085f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00085f4:	8b 00                	mov    (%eax),%eax
c00085f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00085f9:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0008600:	83 ec 04             	sub    $0x4,%esp
c0008603:	6a 0c                	push   $0xc
c0008605:	6a 00                	push   $0x0
c0008607:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000860d:	50                   	push   %eax
c000860e:	e8 7c 19 00 00       	call   c0009f8f <Memset>
c0008613:	83 c4 10             	add    $0x10,%esp
c0008616:	8b 45 08             	mov    0x8(%ebp),%eax
c0008619:	8b 40 30             	mov    0x30(%eax),%eax
c000861c:	89 c6                	mov    %eax,%esi
c000861e:	8b 45 08             	mov    0x8(%ebp),%eax
c0008621:	8b 40 34             	mov    0x34(%eax),%eax
c0008624:	83 ec 08             	sub    $0x8,%esp
c0008627:	50                   	push   %eax
c0008628:	ff 75 d8             	pushl  -0x28(%ebp)
c000862b:	e8 53 e9 ff ff       	call   c0006f83 <v2l>
c0008630:	83 c4 10             	add    $0x10,%esp
c0008633:	89 c3                	mov    %eax,%ebx
c0008635:	83 ec 08             	sub    $0x8,%esp
c0008638:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000863e:	50                   	push   %eax
c000863f:	6a 04                	push   $0x4
c0008641:	e8 3d e9 ff ff       	call   c0006f83 <v2l>
c0008646:	83 c4 10             	add    $0x10,%esp
c0008649:	83 ec 04             	sub    $0x4,%esp
c000864c:	56                   	push   %esi
c000864d:	53                   	push   %ebx
c000864e:	50                   	push   %eax
c000864f:	e8 0d 19 00 00       	call   c0009f61 <Memcpy>
c0008654:	83 c4 10             	add    $0x10,%esp
c0008657:	83 ec 08             	sub    $0x8,%esp
c000865a:	6a 00                	push   $0x0
c000865c:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0008662:	50                   	push   %eax
c0008663:	e8 e3 f9 ff ff       	call   c000804b <open>
c0008668:	83 c4 10             	add    $0x10,%esp
c000866b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000866e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008675:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008678:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000867e:	01 d0                	add    %edx,%eax
c0008680:	83 ec 04             	sub    $0x4,%esp
c0008683:	68 00 02 00 00       	push   $0x200
c0008688:	50                   	push   %eax
c0008689:	ff 75 d0             	pushl  -0x30(%ebp)
c000868c:	e8 0f fa ff ff       	call   c00080a0 <read>
c0008691:	83 c4 10             	add    $0x10,%esp
c0008694:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008697:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000869a:	01 45 f4             	add    %eax,-0xc(%ebp)
c000869d:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00086a1:	74 02                	je     c00086a5 <do_exec+0xe7>
c00086a3:	eb d0                	jmp    c0008675 <do_exec+0xb7>
c00086a5:	90                   	nop
c00086a6:	83 ec 0c             	sub    $0xc,%esp
c00086a9:	ff 75 d0             	pushl  -0x30(%ebp)
c00086ac:	e8 5d fa ff ff       	call   c000810e <close>
c00086b1:	83 c4 10             	add    $0x10,%esp
c00086b4:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00086ba:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00086bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00086c4:	eb 72                	jmp    c0008738 <do_exec+0x17a>
c00086c6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00086c9:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00086cd:	0f b7 d0             	movzwl %ax,%edx
c00086d0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00086d3:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00086d7:	0f b7 c0             	movzwl %ax,%eax
c00086da:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00086de:	01 c2                	add    %eax,%edx
c00086e0:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00086e6:	01 d0                	add    %edx,%eax
c00086e8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00086eb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00086ee:	8b 40 10             	mov    0x10(%eax),%eax
c00086f1:	89 c6                	mov    %eax,%esi
c00086f3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00086f6:	8b 40 04             	mov    0x4(%eax),%eax
c00086f9:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00086ff:	01 d0                	add    %edx,%eax
c0008701:	83 ec 08             	sub    $0x8,%esp
c0008704:	50                   	push   %eax
c0008705:	6a 04                	push   $0x4
c0008707:	e8 77 e8 ff ff       	call   c0006f83 <v2l>
c000870c:	83 c4 10             	add    $0x10,%esp
c000870f:	89 c3                	mov    %eax,%ebx
c0008711:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008714:	8b 40 08             	mov    0x8(%eax),%eax
c0008717:	83 ec 08             	sub    $0x8,%esp
c000871a:	50                   	push   %eax
c000871b:	ff 75 d8             	pushl  -0x28(%ebp)
c000871e:	e8 60 e8 ff ff       	call   c0006f83 <v2l>
c0008723:	83 c4 10             	add    $0x10,%esp
c0008726:	83 ec 04             	sub    $0x4,%esp
c0008729:	56                   	push   %esi
c000872a:	53                   	push   %ebx
c000872b:	50                   	push   %eax
c000872c:	e8 30 18 00 00       	call   c0009f61 <Memcpy>
c0008731:	83 c4 10             	add    $0x10,%esp
c0008734:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008738:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000873b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c000873f:	0f b7 c0             	movzwl %ax,%eax
c0008742:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0008745:	0f 8c 7b ff ff ff    	jl     c00086c6 <do_exec+0x108>
c000874b:	8b 45 08             	mov    0x8(%ebp),%eax
c000874e:	8b 40 10             	mov    0x10(%eax),%eax
c0008751:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008754:	8b 45 08             	mov    0x8(%ebp),%eax
c0008757:	8b 40 1c             	mov    0x1c(%eax),%eax
c000875a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000875d:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0008764:	83 ec 08             	sub    $0x8,%esp
c0008767:	ff 75 c0             	pushl  -0x40(%ebp)
c000876a:	ff 75 d8             	pushl  -0x28(%ebp)
c000876d:	e8 11 e8 ff ff       	call   c0006f83 <v2l>
c0008772:	83 c4 10             	add    $0x10,%esp
c0008775:	89 c3                	mov    %eax,%ebx
c0008777:	83 ec 08             	sub    $0x8,%esp
c000877a:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0008780:	50                   	push   %eax
c0008781:	6a 04                	push   $0x4
c0008783:	e8 fb e7 ff ff       	call   c0006f83 <v2l>
c0008788:	83 c4 10             	add    $0x10,%esp
c000878b:	83 ec 04             	sub    $0x4,%esp
c000878e:	ff 75 bc             	pushl  -0x44(%ebp)
c0008791:	53                   	push   %ebx
c0008792:	50                   	push   %eax
c0008793:	e8 c9 17 00 00       	call   c0009f61 <Memcpy>
c0008798:	83 c4 10             	add    $0x10,%esp
c000879b:	83 ec 08             	sub    $0x8,%esp
c000879e:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00087a4:	50                   	push   %eax
c00087a5:	6a 04                	push   $0x4
c00087a7:	e8 d7 e7 ff ff       	call   c0006f83 <v2l>
c00087ac:	83 c4 10             	add    $0x10,%esp
c00087af:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00087b2:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00087b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00087b8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00087bf:	eb 08                	jmp    c00087c9 <do_exec+0x20b>
c00087c1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00087c5:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00087c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087cc:	8b 00                	mov    (%eax),%eax
c00087ce:	85 c0                	test   %eax,%eax
c00087d0:	75 ef                	jne    c00087c1 <do_exec+0x203>
c00087d2:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00087d5:	2b 45 c0             	sub    -0x40(%ebp),%eax
c00087d8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00087db:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00087e2:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00087e8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00087eb:	eb 17                	jmp    c0008804 <do_exec+0x246>
c00087ed:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00087f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00087f4:	8b 10                	mov    (%eax),%edx
c00087f6:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00087f9:	01 c2                	add    %eax,%edx
c00087fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00087fe:	89 10                	mov    %edx,(%eax)
c0008800:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0008804:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008807:	8b 00                	mov    (%eax),%eax
c0008809:	85 c0                	test   %eax,%eax
c000880b:	75 e0                	jne    c00087ed <do_exec+0x22f>
c000880d:	83 ec 08             	sub    $0x8,%esp
c0008810:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0008816:	50                   	push   %eax
c0008817:	6a 04                	push   $0x4
c0008819:	e8 65 e7 ff ff       	call   c0006f83 <v2l>
c000881e:	83 c4 10             	add    $0x10,%esp
c0008821:	89 c3                	mov    %eax,%ebx
c0008823:	83 ec 08             	sub    $0x8,%esp
c0008826:	ff 75 b8             	pushl  -0x48(%ebp)
c0008829:	ff 75 d8             	pushl  -0x28(%ebp)
c000882c:	e8 52 e7 ff ff       	call   c0006f83 <v2l>
c0008831:	83 c4 10             	add    $0x10,%esp
c0008834:	83 ec 04             	sub    $0x4,%esp
c0008837:	ff 75 bc             	pushl  -0x44(%ebp)
c000883a:	53                   	push   %ebx
c000883b:	50                   	push   %eax
c000883c:	e8 20 17 00 00       	call   c0009f61 <Memcpy>
c0008841:	83 c4 10             	add    $0x10,%esp
c0008844:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008847:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000884a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000884d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0008850:	69 d2 a8 01 00 00    	imul   $0x1a8,%edx,%edx
c0008856:	81 c2 cc 31 08 c0    	add    $0xc00831cc,%edx
c000885c:	89 02                	mov    %eax,(%edx)
c000885e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008861:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0008864:	69 d2 a8 01 00 00    	imul   $0x1a8,%edx,%edx
c000886a:	81 c2 c8 31 08 c0    	add    $0xc00831c8,%edx
c0008870:	89 02                	mov    %eax,(%edx)
c0008872:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008875:	8b 40 18             	mov    0x18(%eax),%eax
c0008878:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000887b:	69 d2 a8 01 00 00    	imul   $0x1a8,%edx,%edx
c0008881:	81 c2 d0 31 08 c0    	add    $0xc00831d0,%edx
c0008887:	89 02                	mov    %eax,(%edx)
c0008889:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000888c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000888f:	69 d2 a8 01 00 00    	imul   $0x1a8,%edx,%edx
c0008895:	81 c2 dc 31 08 c0    	add    $0xc00831dc,%edx
c000889b:	89 02                	mov    %eax,(%edx)
c000889d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00088a0:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c00088a6:	05 2c 33 08 c0       	add    $0xc008332c,%eax
c00088ab:	c7 00 1f 00 00 00    	movl   $0x1f,(%eax)
c00088b1:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c00088b8:	00 00 00 
c00088bb:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c00088c2:	00 00 00 
c00088c5:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c00088cc:	00 00 00 
c00088cf:	83 ec 04             	sub    $0x4,%esp
c00088d2:	ff 75 d8             	pushl  -0x28(%ebp)
c00088d5:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c00088db:	50                   	push   %eax
c00088dc:	6a 01                	push   $0x1
c00088de:	e8 8e b4 ff ff       	call   c0003d71 <send_rec>
c00088e3:	83 c4 10             	add    $0x10,%esp
c00088e6:	90                   	nop
c00088e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00088ea:	5b                   	pop    %ebx
c00088eb:	5e                   	pop    %esi
c00088ec:	5d                   	pop    %ebp
c00088ed:	c3                   	ret    

c00088ee <do_fork>:
c00088ee:	55                   	push   %ebp
c00088ef:	89 e5                	mov    %esp,%ebp
c00088f1:	57                   	push   %edi
c00088f2:	56                   	push   %esi
c00088f3:	53                   	push   %ebx
c00088f4:	81 ec ac 00 00 00    	sub    $0xac,%esp
c00088fa:	c7 45 e4 90 3b 08 c0 	movl   $0xc0083b90,-0x1c(%ebp)
c0008901:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008908:	c7 45 dc 06 00 00 00 	movl   $0x6,-0x24(%ebp)
c000890f:	eb 21                	jmp    c0008932 <do_fork+0x44>
c0008911:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008914:	0f b6 80 84 01 00 00 	movzbl 0x184(%eax),%eax
c000891b:	3c ff                	cmp    $0xff,%al
c000891d:	75 08                	jne    c0008927 <do_fork+0x39>
c000891f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0008922:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008925:	eb 11                	jmp    c0008938 <do_fork+0x4a>
c0008927:	81 45 e4 a8 01 00 00 	addl   $0x1a8,-0x1c(%ebp)
c000892e:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0008932:	83 7d dc 20          	cmpl   $0x20,-0x24(%ebp)
c0008936:	7e d9                	jle    c0008911 <do_fork+0x23>
c0008938:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c000893c:	7f 19                	jg     c0008957 <do_fork+0x69>
c000893e:	6a 26                	push   $0x26
c0008940:	68 28 9f 00 c0       	push   $0xc0009f28
c0008945:	68 28 9f 00 c0       	push   $0xc0009f28
c000894a:	68 38 9f 00 c0       	push   $0xc0009f38
c000894f:	e8 b1 ab ff ff       	call   c0003505 <assertion_failure>
c0008954:	83 c4 10             	add    $0x10,%esp
c0008957:	8b 45 08             	mov    0x8(%ebp),%eax
c000895a:	8b 00                	mov    (%eax),%eax
c000895c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000895f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008962:	0f b7 40 44          	movzwl 0x44(%eax),%eax
c0008966:	0f b7 c0             	movzwl %ax,%eax
c0008969:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000896c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000896f:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008972:	69 d2 a8 01 00 00    	imul   $0x1a8,%edx,%edx
c0008978:	8d 8a a0 31 08 c0    	lea    -0x3ff7ce60(%edx),%ecx
c000897e:	89 c2                	mov    %eax,%edx
c0008980:	89 cb                	mov    %ecx,%ebx
c0008982:	b8 6a 00 00 00       	mov    $0x6a,%eax
c0008987:	89 d7                	mov    %edx,%edi
c0008989:	89 de                	mov    %ebx,%esi
c000898b:	89 c1                	mov    %eax,%ecx
c000898d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000898f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008992:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008995:	89 50 58             	mov    %edx,0x58(%eax)
c0008998:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000899b:	89 c2                	mov    %eax,%edx
c000899d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00089a0:	66 89 50 44          	mov    %dx,0x44(%eax)
c00089a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00089a7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00089aa:	89 90 a0 01 00 00    	mov    %edx,0x1a0(%eax)
c00089b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089b3:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c00089b9:	83 c0 40             	add    $0x40,%eax
c00089bc:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c00089c1:	83 c0 06             	add    $0x6,%eax
c00089c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00089c7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00089ca:	0f b6 40 07          	movzbl 0x7(%eax),%eax
c00089ce:	0f b6 c0             	movzbl %al,%eax
c00089d1:	c1 e0 18             	shl    $0x18,%eax
c00089d4:	89 c2                	mov    %eax,%edx
c00089d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00089d9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c00089dd:	0f b6 c0             	movzbl %al,%eax
c00089e0:	c1 e0 10             	shl    $0x10,%eax
c00089e3:	01 c2                	add    %eax,%edx
c00089e5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00089e8:	0f b7 40 02          	movzwl 0x2(%eax),%eax
c00089ec:	0f b7 c0             	movzwl %ax,%eax
c00089ef:	01 d0                	add    %edx,%eax
c00089f1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00089f4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00089f7:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c00089fb:	0f b6 c0             	movzbl %al,%eax
c00089fe:	25 00 00 0f 00       	and    $0xf0000,%eax
c0008a03:	89 c2                	mov    %eax,%edx
c0008a05:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008a08:	0f b7 00             	movzwl (%eax),%eax
c0008a0b:	0f b7 c0             	movzwl %ax,%eax
c0008a0e:	01 d0                	add    %edx,%eax
c0008a10:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008a13:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008a16:	83 c0 01             	add    $0x1,%eax
c0008a19:	c1 e0 0c             	shl    $0xc,%eax
c0008a1c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0008a1f:	83 ec 08             	sub    $0x8,%esp
c0008a22:	ff 75 c4             	pushl  -0x3c(%ebp)
c0008a25:	ff 75 e0             	pushl  -0x20(%ebp)
c0008a28:	e8 5e fb ff ff       	call   c000858b <alloc_mem>
c0008a2d:	83 c4 10             	add    $0x10,%esp
c0008a30:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008a33:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0008a36:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0008a39:	83 ec 04             	sub    $0x4,%esp
c0008a3c:	ff 75 c4             	pushl  -0x3c(%ebp)
c0008a3f:	52                   	push   %edx
c0008a40:	50                   	push   %eax
c0008a41:	e8 1b 15 00 00       	call   c0009f61 <Memcpy>
c0008a46:	83 c4 10             	add    $0x10,%esp
c0008a49:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0008a50:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
c0008a57:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0008a5a:	0f b7 c8             	movzwl %ax,%ecx
c0008a5d:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0008a60:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0008a63:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c0008a66:	69 db a8 01 00 00    	imul   $0x1a8,%ebx,%ebx
c0008a6c:	83 c3 40             	add    $0x40,%ebx
c0008a6f:	81 c3 a0 31 08 c0    	add    $0xc00831a0,%ebx
c0008a75:	83 c3 06             	add    $0x6,%ebx
c0008a78:	51                   	push   %ecx
c0008a79:	52                   	push   %edx
c0008a7a:	50                   	push   %eax
c0008a7b:	53                   	push   %ebx
c0008a7c:	e8 fa e3 ff ff       	call   c0006e7b <InitDescriptor>
c0008a81:	83 c4 10             	add    $0x10,%esp
c0008a84:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
c0008a8b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0008a8e:	0f b7 c8             	movzwl %ax,%ecx
c0008a91:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0008a94:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0008a97:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c0008a9a:	69 db a8 01 00 00    	imul   $0x1a8,%ebx,%ebx
c0008aa0:	83 c3 48             	add    $0x48,%ebx
c0008aa3:	81 c3 a0 31 08 c0    	add    $0xc00831a0,%ebx
c0008aa9:	83 c3 06             	add    $0x6,%ebx
c0008aac:	51                   	push   %ecx
c0008aad:	52                   	push   %edx
c0008aae:	50                   	push   %eax
c0008aaf:	53                   	push   %ebx
c0008ab0:	e8 c6 e3 ff ff       	call   c0006e7b <InitDescriptor>
c0008ab5:	83 c4 10             	add    $0x10,%esp
c0008ab8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008abb:	8b 45 08             	mov    0x8(%ebp),%eax
c0008abe:	89 50 4c             	mov    %edx,0x4c(%eax)
c0008ac1:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
c0008ac8:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c0008acf:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0008ad6:	83 ec 04             	sub    $0x4,%esp
c0008ad9:	ff 75 e0             	pushl  -0x20(%ebp)
c0008adc:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
c0008ae2:	50                   	push   %eax
c0008ae3:	6a 01                	push   $0x1
c0008ae5:	e8 87 b2 ff ff       	call   c0003d71 <send_rec>
c0008aea:	83 c4 10             	add    $0x10,%esp
c0008aed:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008af0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008af3:	5b                   	pop    %ebx
c0008af4:	5e                   	pop    %esi
c0008af5:	5f                   	pop    %edi
c0008af6:	5d                   	pop    %ebp
c0008af7:	c3                   	ret    

c0008af8 <do_exit>:
c0008af8:	55                   	push   %ebp
c0008af9:	89 e5                	mov    %esp,%ebp
c0008afb:	83 ec 18             	sub    $0x18,%esp
c0008afe:	8b 45 08             	mov    0x8(%ebp),%eax
c0008b01:	8b 00                	mov    (%eax),%eax
c0008b03:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008b06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008b09:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008b0f:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c0008b14:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008b17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b1a:	8b 80 a0 01 00 00    	mov    0x1a0(%eax),%eax
c0008b20:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008b23:	8b 45 08             	mov    0x8(%ebp),%eax
c0008b26:	8b 40 44             	mov    0x44(%eax),%eax
c0008b29:	89 c2                	mov    %eax,%edx
c0008b2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b2e:	89 90 a4 01 00 00    	mov    %edx,0x1a4(%eax)
c0008b34:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008b37:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008b3d:	05 25 33 08 c0       	add    $0xc0083325,%eax
c0008b42:	0f b6 00             	movzbl (%eax),%eax
c0008b45:	3c 04                	cmp    $0x4,%al
c0008b47:	75 21                	jne    c0008b6a <do_exit+0x72>
c0008b49:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008b4c:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008b52:	05 25 33 08 c0       	add    $0xc0083325,%eax
c0008b57:	c6 00 fb             	movb   $0xfb,(%eax)
c0008b5a:	83 ec 0c             	sub    $0xc,%esp
c0008b5d:	ff 75 ec             	pushl  -0x14(%ebp)
c0008b60:	e8 59 01 00 00       	call   c0008cbe <cleanup>
c0008b65:	83 c4 10             	add    $0x10,%esp
c0008b68:	eb 0a                	jmp    c0008b74 <do_exit+0x7c>
c0008b6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b6d:	c6 80 84 01 00 00 03 	movb   $0x3,0x184(%eax)
c0008b74:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0008b7b:	eb 6e                	jmp    c0008beb <do_exit+0xf3>
c0008b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008b80:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008b86:	05 40 33 08 c0       	add    $0xc0083340,%eax
c0008b8b:	8b 00                	mov    (%eax),%eax
c0008b8d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0008b90:	75 55                	jne    c0008be7 <do_exit+0xef>
c0008b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008b95:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008b9b:	05 40 33 08 c0       	add    $0xc0083340,%eax
c0008ba0:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0008ba6:	0f b6 05 15 3d 08 c0 	movzbl 0xc0083d15,%eax
c0008bad:	3c 04                	cmp    $0x4,%al
c0008baf:	75 36                	jne    c0008be7 <do_exit+0xef>
c0008bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008bb4:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008bba:	05 25 33 08 c0       	add    $0xc0083325,%eax
c0008bbf:	0f b6 00             	movzbl (%eax),%eax
c0008bc2:	3c 03                	cmp    $0x3,%al
c0008bc4:	75 21                	jne    c0008be7 <do_exit+0xef>
c0008bc6:	c6 05 15 3d 08 c0 fb 	movb   $0xfb,0xc0083d15
c0008bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008bd0:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008bd6:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c0008bdb:	83 ec 0c             	sub    $0xc,%esp
c0008bde:	50                   	push   %eax
c0008bdf:	e8 da 00 00 00       	call   c0008cbe <cleanup>
c0008be4:	83 c4 10             	add    $0x10,%esp
c0008be7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008beb:	83 7d f4 20          	cmpl   $0x20,-0xc(%ebp)
c0008bef:	7e 8c                	jle    c0008b7d <do_exit+0x85>
c0008bf1:	90                   	nop
c0008bf2:	c9                   	leave  
c0008bf3:	c3                   	ret    

c0008bf4 <do_wait>:
c0008bf4:	55                   	push   %ebp
c0008bf5:	89 e5                	mov    %esp,%ebp
c0008bf7:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0008bfd:	8b 45 08             	mov    0x8(%ebp),%eax
c0008c00:	8b 00                	mov    (%eax),%eax
c0008c02:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008c05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008c0c:	c7 45 f0 06 00 00 00 	movl   $0x6,-0x10(%ebp)
c0008c13:	eb 5f                	jmp    c0008c74 <do_wait+0x80>
c0008c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008c18:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008c1e:	05 40 33 08 c0       	add    $0xc0083340,%eax
c0008c23:	8b 00                	mov    (%eax),%eax
c0008c25:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0008c28:	75 46                	jne    c0008c70 <do_wait+0x7c>
c0008c2a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008c2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008c31:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008c37:	05 25 33 08 c0       	add    $0xc0083325,%eax
c0008c3c:	0f b6 00             	movzbl (%eax),%eax
c0008c3f:	3c 03                	cmp    $0x3,%al
c0008c41:	75 2d                	jne    c0008c70 <do_wait+0x7c>
c0008c43:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c46:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008c4c:	05 25 33 08 c0       	add    $0xc0083325,%eax
c0008c51:	c6 00 fb             	movb   $0xfb,(%eax)
c0008c54:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008c57:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008c5d:	05 a0 31 08 c0       	add    $0xc00831a0,%eax
c0008c62:	83 ec 0c             	sub    $0xc,%esp
c0008c65:	50                   	push   %eax
c0008c66:	e8 53 00 00 00       	call   c0008cbe <cleanup>
c0008c6b:	83 c4 10             	add    $0x10,%esp
c0008c6e:	eb 4c                	jmp    c0008cbc <do_wait+0xc8>
c0008c70:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008c74:	83 7d f0 20          	cmpl   $0x20,-0x10(%ebp)
c0008c78:	7e 9b                	jle    c0008c15 <do_wait+0x21>
c0008c7a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008c7e:	74 13                	je     c0008c93 <do_wait+0x9f>
c0008c80:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c83:	69 c0 a8 01 00 00    	imul   $0x1a8,%eax,%eax
c0008c89:	05 25 33 08 c0       	add    $0xc0083325,%eax
c0008c8e:	c6 00 04             	movb   $0x4,(%eax)
c0008c91:	eb 29                	jmp    c0008cbc <do_wait+0xc8>
c0008c93:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0008c9a:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0008ca1:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0008ca8:	83 ec 04             	sub    $0x4,%esp
c0008cab:	ff 75 ec             	pushl  -0x14(%ebp)
c0008cae:	8d 45 80             	lea    -0x80(%ebp),%eax
c0008cb1:	50                   	push   %eax
c0008cb2:	6a 01                	push   $0x1
c0008cb4:	e8 b8 b0 ff ff       	call   c0003d71 <send_rec>
c0008cb9:	83 c4 10             	add    $0x10,%esp
c0008cbc:	c9                   	leave  
c0008cbd:	c3                   	ret    

c0008cbe <cleanup>:
c0008cbe:	55                   	push   %ebp
c0008cbf:	89 e5                	mov    %esp,%ebp
c0008cc1:	83 ec 78             	sub    $0x78,%esp
c0008cc4:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0008ccb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0008cd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0008cd5:	8b 80 a0 01 00 00    	mov    0x1a0(%eax),%eax
c0008cdb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008cde:	8b 45 08             	mov    0x8(%ebp),%eax
c0008ce1:	8b 80 a4 01 00 00    	mov    0x1a4(%eax),%eax
c0008ce7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008cea:	8b 45 08             	mov    0x8(%ebp),%eax
c0008ced:	8b 80 a0 01 00 00    	mov    0x1a0(%eax),%eax
c0008cf3:	83 ec 04             	sub    $0x4,%esp
c0008cf6:	50                   	push   %eax
c0008cf7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008cfa:	50                   	push   %eax
c0008cfb:	6a 01                	push   $0x1
c0008cfd:	e8 6f b0 ff ff       	call   c0003d71 <send_rec>
c0008d02:	83 c4 10             	add    $0x10,%esp
c0008d05:	8b 45 08             	mov    0x8(%ebp),%eax
c0008d08:	c6 80 84 01 00 00 ff 	movb   $0xff,0x184(%eax)
c0008d0f:	90                   	nop
c0008d10:	c9                   	leave  
c0008d11:	c3                   	ret    

c0008d12 <test_bit_val>:
c0008d12:	55                   	push   %ebp
c0008d13:	89 e5                	mov    %esp,%ebp
c0008d15:	53                   	push   %ebx
c0008d16:	83 ec 10             	sub    $0x10,%esp
c0008d19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d1c:	8d 50 07             	lea    0x7(%eax),%edx
c0008d1f:	85 c0                	test   %eax,%eax
c0008d21:	0f 48 c2             	cmovs  %edx,%eax
c0008d24:	c1 f8 03             	sar    $0x3,%eax
c0008d27:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008d2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d2d:	99                   	cltd   
c0008d2e:	c1 ea 1d             	shr    $0x1d,%edx
c0008d31:	01 d0                	add    %edx,%eax
c0008d33:	83 e0 07             	and    $0x7,%eax
c0008d36:	29 d0                	sub    %edx,%eax
c0008d38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0008d3e:	8b 10                	mov    (%eax),%edx
c0008d40:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008d43:	01 d0                	add    %edx,%eax
c0008d45:	0f b6 00             	movzbl (%eax),%eax
c0008d48:	88 45 f3             	mov    %al,-0xd(%ebp)
c0008d4b:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0008d4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d52:	bb 01 00 00 00       	mov    $0x1,%ebx
c0008d57:	89 c1                	mov    %eax,%ecx
c0008d59:	d3 e3                	shl    %cl,%ebx
c0008d5b:	89 d8                	mov    %ebx,%eax
c0008d5d:	21 c2                	and    %eax,%edx
c0008d5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d62:	89 c1                	mov    %eax,%ecx
c0008d64:	d3 fa                	sar    %cl,%edx
c0008d66:	89 d0                	mov    %edx,%eax
c0008d68:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d6b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0008d6f:	0f 9f c0             	setg   %al
c0008d72:	0f b6 c0             	movzbl %al,%eax
c0008d75:	83 c4 10             	add    $0x10,%esp
c0008d78:	5b                   	pop    %ebx
c0008d79:	5d                   	pop    %ebp
c0008d7a:	c3                   	ret    

c0008d7b <set_bit_val>:
c0008d7b:	55                   	push   %ebp
c0008d7c:	89 e5                	mov    %esp,%ebp
c0008d7e:	83 ec 10             	sub    $0x10,%esp
c0008d81:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d84:	8d 50 07             	lea    0x7(%eax),%edx
c0008d87:	85 c0                	test   %eax,%eax
c0008d89:	0f 48 c2             	cmovs  %edx,%eax
c0008d8c:	c1 f8 03             	sar    $0x3,%eax
c0008d8f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008d92:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d95:	99                   	cltd   
c0008d96:	c1 ea 1d             	shr    $0x1d,%edx
c0008d99:	01 d0                	add    %edx,%eax
c0008d9b:	83 e0 07             	and    $0x7,%eax
c0008d9e:	29 d0                	sub    %edx,%eax
c0008da0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008da3:	8b 45 08             	mov    0x8(%ebp),%eax
c0008da6:	8b 10                	mov    (%eax),%edx
c0008da8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008dab:	01 d0                	add    %edx,%eax
c0008dad:	0f b6 00             	movzbl (%eax),%eax
c0008db0:	88 45 ff             	mov    %al,-0x1(%ebp)
c0008db3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0008db7:	7e 13                	jle    c0008dcc <set_bit_val+0x51>
c0008db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008dbc:	ba 01 00 00 00       	mov    $0x1,%edx
c0008dc1:	89 c1                	mov    %eax,%ecx
c0008dc3:	d3 e2                	shl    %cl,%edx
c0008dc5:	89 d0                	mov    %edx,%eax
c0008dc7:	08 45 ff             	or     %al,-0x1(%ebp)
c0008dca:	eb 13                	jmp    c0008ddf <set_bit_val+0x64>
c0008dcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008dcf:	ba 01 00 00 00       	mov    $0x1,%edx
c0008dd4:	89 c1                	mov    %eax,%ecx
c0008dd6:	d3 e2                	shl    %cl,%edx
c0008dd8:	89 d0                	mov    %edx,%eax
c0008dda:	f7 d0                	not    %eax
c0008ddc:	20 45 ff             	and    %al,-0x1(%ebp)
c0008ddf:	8b 45 08             	mov    0x8(%ebp),%eax
c0008de2:	8b 10                	mov    (%eax),%edx
c0008de4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008de7:	01 c2                	add    %eax,%edx
c0008de9:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0008ded:	88 02                	mov    %al,(%edx)
c0008def:	b8 01 00 00 00       	mov    $0x1,%eax
c0008df4:	c9                   	leave  
c0008df5:	c3                   	ret    

c0008df6 <set_bits>:
c0008df6:	55                   	push   %ebp
c0008df7:	89 e5                	mov    %esp,%ebp
c0008df9:	83 ec 10             	sub    $0x10,%esp
c0008dfc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008e03:	eb 1c                	jmp    c0008e21 <set_bits+0x2b>
c0008e05:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008e08:	8d 50 01             	lea    0x1(%eax),%edx
c0008e0b:	89 55 0c             	mov    %edx,0xc(%ebp)
c0008e0e:	ff 75 10             	pushl  0x10(%ebp)
c0008e11:	50                   	push   %eax
c0008e12:	ff 75 08             	pushl  0x8(%ebp)
c0008e15:	e8 61 ff ff ff       	call   c0008d7b <set_bit_val>
c0008e1a:	83 c4 0c             	add    $0xc,%esp
c0008e1d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008e21:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008e24:	3b 45 14             	cmp    0x14(%ebp),%eax
c0008e27:	7c dc                	jl     c0008e05 <set_bits+0xf>
c0008e29:	b8 01 00 00 00       	mov    $0x1,%eax
c0008e2e:	c9                   	leave  
c0008e2f:	c3                   	ret    

c0008e30 <get_first_free_bit>:
c0008e30:	55                   	push   %ebp
c0008e31:	89 e5                	mov    %esp,%ebp
c0008e33:	83 ec 10             	sub    $0x10,%esp
c0008e36:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e39:	8b 40 04             	mov    0x4(%eax),%eax
c0008e3c:	c1 e0 03             	shl    $0x3,%eax
c0008e3f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008e42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008e45:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008e48:	eb 1b                	jmp    c0008e65 <get_first_free_bit+0x35>
c0008e4a:	ff 75 fc             	pushl  -0x4(%ebp)
c0008e4d:	ff 75 08             	pushl  0x8(%ebp)
c0008e50:	e8 bd fe ff ff       	call   c0008d12 <test_bit_val>
c0008e55:	83 c4 08             	add    $0x8,%esp
c0008e58:	85 c0                	test   %eax,%eax
c0008e5a:	75 05                	jne    c0008e61 <get_first_free_bit+0x31>
c0008e5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008e5f:	eb 11                	jmp    c0008e72 <get_first_free_bit+0x42>
c0008e61:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008e65:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008e68:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0008e6b:	7c dd                	jl     c0008e4a <get_first_free_bit+0x1a>
c0008e6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0008e72:	c9                   	leave  
c0008e73:	c3                   	ret    

c0008e74 <get_bits>:
c0008e74:	55                   	push   %ebp
c0008e75:	89 e5                	mov    %esp,%ebp
c0008e77:	83 ec 20             	sub    $0x20,%esp
c0008e7a:	c7 45 f0 02 01 00 00 	movl   $0x102,-0x10(%ebp)
c0008e81:	ff 75 f0             	pushl  -0x10(%ebp)
c0008e84:	ff 75 08             	pushl  0x8(%ebp)
c0008e87:	e8 a4 ff ff ff       	call   c0008e30 <get_first_free_bit>
c0008e8c:	83 c4 08             	add    $0x8,%esp
c0008e8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e92:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e95:	8b 40 04             	mov    0x4(%eax),%eax
c0008e98:	c1 e0 03             	shl    $0x3,%eax
c0008e9b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008e9e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ea1:	83 e8 01             	sub    $0x1,%eax
c0008ea4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008ea7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008eaa:	83 c0 01             	add    $0x1,%eax
c0008ead:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008eb0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008eb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008eb6:	eb 58                	jmp    c0008f10 <get_bits+0x9c>
c0008eb8:	ff 75 f8             	pushl  -0x8(%ebp)
c0008ebb:	ff 75 08             	pushl  0x8(%ebp)
c0008ebe:	e8 4f fe ff ff       	call   c0008d12 <test_bit_val>
c0008ec3:	83 c4 08             	add    $0x8,%esp
c0008ec6:	85 c0                	test   %eax,%eax
c0008ec8:	75 0a                	jne    c0008ed4 <get_bits+0x60>
c0008eca:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008ece:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008ed2:	eb 2b                	jmp    c0008eff <get_bits+0x8b>
c0008ed4:	6a 00                	push   $0x0
c0008ed6:	ff 75 08             	pushl  0x8(%ebp)
c0008ed9:	e8 52 ff ff ff       	call   c0008e30 <get_first_free_bit>
c0008ede:	83 c4 08             	add    $0x8,%esp
c0008ee1:	83 c0 01             	add    $0x1,%eax
c0008ee4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008ee7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008eea:	83 c0 01             	add    $0x1,%eax
c0008eed:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008ef0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008ef3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ef6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ef9:	83 e8 01             	sub    $0x1,%eax
c0008efc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f02:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0008f05:	7c 09                	jl     c0008f10 <get_bits+0x9c>
c0008f07:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0008f0e:	eb 0d                	jmp    c0008f1d <get_bits+0xa9>
c0008f10:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008f13:	8d 50 ff             	lea    -0x1(%eax),%edx
c0008f16:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0008f19:	85 c0                	test   %eax,%eax
c0008f1b:	7f 9b                	jg     c0008eb8 <get_bits+0x44>
c0008f1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f20:	2b 45 0c             	sub    0xc(%ebp),%eax
c0008f23:	83 c0 01             	add    $0x1,%eax
c0008f26:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008f29:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008f2c:	c9                   	leave  
c0008f2d:	c3                   	ret    

c0008f2e <get_a_page2>:
c0008f2e:	55                   	push   %ebp
c0008f2f:	89 e5                	mov    %esp,%ebp
c0008f31:	83 ec 18             	sub    $0x18,%esp
c0008f34:	83 ec 0c             	sub    $0xc,%esp
c0008f37:	ff 75 0c             	pushl  0xc(%ebp)
c0008f3a:	e8 1e 00 00 00       	call   c0008f5d <get_a_page>
c0008f3f:	83 c4 10             	add    $0x10,%esp
c0008f42:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f45:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0008f48:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f4b:	83 ec 08             	sub    $0x8,%esp
c0008f4e:	52                   	push   %edx
c0008f4f:	50                   	push   %eax
c0008f50:	e8 42 01 00 00       	call   c0009097 <add_map_entry>
c0008f55:	83 c4 10             	add    $0x10,%esp
c0008f58:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f5b:	c9                   	leave  
c0008f5c:	c3                   	ret    

c0008f5d <get_a_page>:
c0008f5d:	55                   	push   %ebp
c0008f5e:	89 e5                	mov    %esp,%ebp
c0008f60:	83 ec 20             	sub    $0x20,%esp
c0008f63:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0008f67:	75 22                	jne    c0008f8b <get_a_page+0x2e>
c0008f69:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0008f6e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008f71:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c0008f76:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f79:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0008f7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f81:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0008f86:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f89:	eb 20                	jmp    c0008fab <get_a_page+0x4e>
c0008f8b:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0008f90:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008f93:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0008f98:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f9b:	a1 cc 1e 01 c0       	mov    0xc0011ecc,%eax
c0008fa0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008fa3:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0008fa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008fab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008fae:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0008fb1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008fb4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0008fb7:	6a 01                	push   $0x1
c0008fb9:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0008fbc:	50                   	push   %eax
c0008fbd:	e8 b2 fe ff ff       	call   c0008e74 <get_bits>
c0008fc2:	83 c4 08             	add    $0x8,%esp
c0008fc5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008fc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fcb:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0008fce:	c1 e2 0c             	shl    $0xc,%edx
c0008fd1:	01 d0                	add    %edx,%eax
c0008fd3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008fd6:	6a 01                	push   $0x1
c0008fd8:	ff 75 fc             	pushl  -0x4(%ebp)
c0008fdb:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0008fde:	50                   	push   %eax
c0008fdf:	e8 97 fd ff ff       	call   c0008d7b <set_bit_val>
c0008fe4:	83 c4 0c             	add    $0xc,%esp
c0008fe7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008fea:	c9                   	leave  
c0008feb:	c3                   	ret    

c0008fec <get_virtual_address>:
c0008fec:	55                   	push   %ebp
c0008fed:	89 e5                	mov    %esp,%ebp
c0008fef:	83 ec 20             	sub    $0x20,%esp
c0008ff2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0008ff6:	75 18                	jne    c0009010 <get_virtual_address+0x24>
c0008ff8:	a1 30 e7 00 c0       	mov    0xc000e730,%eax
c0008ffd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009000:	a1 34 e7 00 c0       	mov    0xc000e734,%eax
c0009005:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009008:	a1 38 e7 00 c0       	mov    0xc000e738,%eax
c000900d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009010:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009013:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0009016:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009019:	89 55 e8             	mov    %edx,-0x18(%ebp)
c000901c:	8b 45 08             	mov    0x8(%ebp),%eax
c000901f:	50                   	push   %eax
c0009020:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0009023:	50                   	push   %eax
c0009024:	e8 4b fe ff ff       	call   c0008e74 <get_bits>
c0009029:	83 c4 08             	add    $0x8,%esp
c000902c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000902f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009032:	8b 55 08             	mov    0x8(%ebp),%edx
c0009035:	81 c2 ff ff 0f 00    	add    $0xfffff,%edx
c000903b:	c1 e2 0c             	shl    $0xc,%edx
c000903e:	01 d0                	add    %edx,%eax
c0009040:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009043:	8b 45 08             	mov    0x8(%ebp),%eax
c0009046:	50                   	push   %eax
c0009047:	6a 01                	push   $0x1
c0009049:	ff 75 fc             	pushl  -0x4(%ebp)
c000904c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000904f:	50                   	push   %eax
c0009050:	e8 a1 fd ff ff       	call   c0008df6 <set_bits>
c0009055:	83 c4 10             	add    $0x10,%esp
c0009058:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000905b:	c9                   	leave  
c000905c:	c3                   	ret    

c000905d <ptr_pde>:
c000905d:	55                   	push   %ebp
c000905e:	89 e5                	mov    %esp,%ebp
c0009060:	8b 45 08             	mov    0x8(%ebp),%eax
c0009063:	c1 e8 16             	shr    $0x16,%eax
c0009066:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c000906b:	c1 e0 02             	shl    $0x2,%eax
c000906e:	5d                   	pop    %ebp
c000906f:	c3                   	ret    

c0009070 <ptr_pte>:
c0009070:	55                   	push   %ebp
c0009071:	89 e5                	mov    %esp,%ebp
c0009073:	8b 45 08             	mov    0x8(%ebp),%eax
c0009076:	c1 e8 0a             	shr    $0xa,%eax
c0009079:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c000907e:	89 c2                	mov    %eax,%edx
c0009080:	8b 45 08             	mov    0x8(%ebp),%eax
c0009083:	c1 e8 0c             	shr    $0xc,%eax
c0009086:	25 ff 03 00 00       	and    $0x3ff,%eax
c000908b:	c1 e0 02             	shl    $0x2,%eax
c000908e:	01 d0                	add    %edx,%eax
c0009090:	2d 00 00 40 00       	sub    $0x400000,%eax
c0009095:	5d                   	pop    %ebp
c0009096:	c3                   	ret    

c0009097 <add_map_entry>:
c0009097:	55                   	push   %ebp
c0009098:	89 e5                	mov    %esp,%ebp
c000909a:	83 ec 18             	sub    $0x18,%esp
c000909d:	66 87 db             	xchg   %bx,%bx
c00090a0:	ff 75 08             	pushl  0x8(%ebp)
c00090a3:	e8 b5 ff ff ff       	call   c000905d <ptr_pde>
c00090a8:	83 c4 04             	add    $0x4,%esp
c00090ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090ae:	ff 75 08             	pushl  0x8(%ebp)
c00090b1:	e8 ba ff ff ff       	call   c0009070 <ptr_pte>
c00090b6:	83 c4 04             	add    $0x4,%esp
c00090b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00090bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090bf:	8b 00                	mov    (%eax),%eax
c00090c1:	83 e0 01             	and    $0x1,%eax
c00090c4:	85 c0                	test   %eax,%eax
c00090c6:	74 1e                	je     c00090e6 <add_map_entry+0x4f>
c00090c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090cb:	8b 00                	mov    (%eax),%eax
c00090cd:	83 e0 01             	and    $0x1,%eax
c00090d0:	85 c0                	test   %eax,%eax
c00090d2:	75 54                	jne    c0009128 <add_map_entry+0x91>
c00090d4:	66 87 db             	xchg   %bx,%bx
c00090d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00090da:	83 c8 07             	or     $0x7,%eax
c00090dd:	89 c2                	mov    %eax,%edx
c00090df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090e2:	89 10                	mov    %edx,(%eax)
c00090e4:	eb 42                	jmp    c0009128 <add_map_entry+0x91>
c00090e6:	6a 00                	push   $0x0
c00090e8:	e8 70 fe ff ff       	call   c0008f5d <get_a_page>
c00090ed:	83 c4 04             	add    $0x4,%esp
c00090f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00090f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090f6:	83 c8 07             	or     $0x7,%eax
c00090f9:	89 c2                	mov    %eax,%edx
c00090fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090fe:	89 10                	mov    %edx,(%eax)
c0009100:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009103:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0009108:	83 ec 04             	sub    $0x4,%esp
c000910b:	68 00 10 00 00       	push   $0x1000
c0009110:	6a 00                	push   $0x0
c0009112:	50                   	push   %eax
c0009113:	e8 77 0e 00 00       	call   c0009f8f <Memset>
c0009118:	83 c4 10             	add    $0x10,%esp
c000911b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000911e:	83 c8 07             	or     $0x7,%eax
c0009121:	89 c2                	mov    %eax,%edx
c0009123:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009126:	89 10                	mov    %edx,(%eax)
c0009128:	90                   	nop
c0009129:	c9                   	leave  
c000912a:	c3                   	ret    

c000912b <get_physical_address>:
c000912b:	55                   	push   %ebp
c000912c:	89 e5                	mov    %esp,%ebp
c000912e:	83 ec 10             	sub    $0x10,%esp
c0009131:	ff 75 08             	pushl  0x8(%ebp)
c0009134:	e8 37 ff ff ff       	call   c0009070 <ptr_pte>
c0009139:	83 c4 04             	add    $0x4,%esp
c000913c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000913f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009142:	8b 00                	mov    (%eax),%eax
c0009144:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0009149:	89 c2                	mov    %eax,%edx
c000914b:	8b 45 08             	mov    0x8(%ebp),%eax
c000914e:	25 ff 0f 00 00       	and    $0xfff,%eax
c0009153:	09 d0                	or     %edx,%eax
c0009155:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009158:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000915b:	c9                   	leave  
c000915c:	c3                   	ret    

c000915d <alloc_memory>:
c000915d:	55                   	push   %ebp
c000915e:	89 e5                	mov    %esp,%ebp
c0009160:	83 ec 18             	sub    $0x18,%esp
c0009163:	ff 75 0c             	pushl  0xc(%ebp)
c0009166:	ff 75 08             	pushl  0x8(%ebp)
c0009169:	e8 7e fe ff ff       	call   c0008fec <get_virtual_address>
c000916e:	83 c4 08             	add    $0x8,%esp
c0009171:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009174:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009177:	2d 00 10 00 00       	sub    $0x1000,%eax
c000917c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000917f:	eb 26                	jmp    c00091a7 <alloc_memory+0x4a>
c0009181:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0009188:	ff 75 0c             	pushl  0xc(%ebp)
c000918b:	e8 cd fd ff ff       	call   c0008f5d <get_a_page>
c0009190:	83 c4 04             	add    $0x4,%esp
c0009193:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009196:	83 ec 08             	sub    $0x8,%esp
c0009199:	ff 75 ec             	pushl  -0x14(%ebp)
c000919c:	ff 75 f4             	pushl  -0xc(%ebp)
c000919f:	e8 f3 fe ff ff       	call   c0009097 <add_map_entry>
c00091a4:	83 c4 10             	add    $0x10,%esp
c00091a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00091aa:	8d 50 ff             	lea    -0x1(%eax),%edx
c00091ad:	89 55 08             	mov    %edx,0x8(%ebp)
c00091b0:	85 c0                	test   %eax,%eax
c00091b2:	75 cd                	jne    c0009181 <alloc_memory+0x24>
c00091b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00091b7:	c9                   	leave  
c00091b8:	c3                   	ret    

c00091b9 <init_memory2>:
c00091b9:	55                   	push   %ebp
c00091ba:	89 e5                	mov    %esp,%ebp
c00091bc:	83 ec 38             	sub    $0x38,%esp
c00091bf:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00091c6:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00091cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00091d0:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c00091d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00091d8:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00091dd:	29 c2                	sub    %eax,%edx
c00091df:	89 d0                	mov    %edx,%eax
c00091e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00091e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00091e7:	89 c2                	mov    %eax,%edx
c00091e9:	c1 ea 1f             	shr    $0x1f,%edx
c00091ec:	01 d0                	add    %edx,%eax
c00091ee:	d1 f8                	sar    %eax
c00091f0:	a3 98 16 01 c0       	mov    %eax,0xc0011698
c00091f5:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c00091fa:	83 ec 0c             	sub    $0xc,%esp
c00091fd:	50                   	push   %eax
c00091fe:	e8 6e 89 ff ff       	call   c0001b71 <disp_int>
c0009203:	83 c4 10             	add    $0x10,%esp
c0009206:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000920b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000920e:	29 c2                	sub    %eax,%edx
c0009210:	89 d0                	mov    %edx,%eax
c0009212:	a3 d0 1e 01 c0       	mov    %eax,0xc0011ed0
c0009217:	83 ec 0c             	sub    $0xc,%esp
c000921a:	68 5f 9f 00 c0       	push   $0xc0009f5f
c000921f:	e8 68 83 ff ff       	call   c000158c <disp_str>
c0009224:	83 c4 10             	add    $0x10,%esp
c0009227:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c000922c:	83 ec 0c             	sub    $0xc,%esp
c000922f:	50                   	push   %eax
c0009230:	e8 3c 89 ff ff       	call   c0001b71 <disp_int>
c0009235:	83 c4 10             	add    $0x10,%esp
c0009238:	83 ec 0c             	sub    $0xc,%esp
c000923b:	68 5f 9f 00 c0       	push   $0xc0009f5f
c0009240:	e8 47 83 ff ff       	call   c000158c <disp_str>
c0009245:	83 c4 10             	add    $0x10,%esp
c0009248:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000924d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009252:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009258:	85 c0                	test   %eax,%eax
c000925a:	0f 48 c2             	cmovs  %edx,%eax
c000925d:	c1 f8 0c             	sar    $0xc,%eax
c0009260:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009263:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009266:	83 c0 07             	add    $0x7,%eax
c0009269:	8d 50 07             	lea    0x7(%eax),%edx
c000926c:	85 c0                	test   %eax,%eax
c000926e:	0f 48 c2             	cmovs  %edx,%eax
c0009271:	c1 f8 03             	sar    $0x3,%eax
c0009274:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c0009279:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000927e:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0009283:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c0009288:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c000928e:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0009293:	83 ec 04             	sub    $0x4,%esp
c0009296:	52                   	push   %edx
c0009297:	6a 00                	push   $0x0
c0009299:	50                   	push   %eax
c000929a:	e8 f0 0c 00 00       	call   c0009f8f <Memset>
c000929f:	83 c4 10             	add    $0x10,%esp
c00092a2:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c00092a7:	05 ff 0f 00 00       	add    $0xfff,%eax
c00092ac:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00092b2:	85 c0                	test   %eax,%eax
c00092b4:	0f 48 c2             	cmovs  %edx,%eax
c00092b7:	c1 f8 0c             	sar    $0xc,%eax
c00092ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00092bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00092c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00092c3:	ff 75 e8             	pushl  -0x18(%ebp)
c00092c6:	6a 01                	push   $0x1
c00092c8:	6a 00                	push   $0x0
c00092ca:	68 8c 16 01 c0       	push   $0xc001168c
c00092cf:	e8 22 fb ff ff       	call   c0008df6 <set_bits>
c00092d4:	83 c4 10             	add    $0x10,%esp
c00092d7:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c00092dc:	05 ff 0f 00 00       	add    $0xfff,%eax
c00092e1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00092e7:	85 c0                	test   %eax,%eax
c00092e9:	0f 48 c2             	cmovs  %edx,%eax
c00092ec:	c1 f8 0c             	sar    $0xc,%eax
c00092ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092f5:	83 c0 07             	add    $0x7,%eax
c00092f8:	8d 50 07             	lea    0x7(%eax),%edx
c00092fb:	85 c0                	test   %eax,%eax
c00092fd:	0f 48 c2             	cmovs  %edx,%eax
c0009300:	c1 f8 03             	sar    $0x3,%eax
c0009303:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c0009308:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000930d:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c0009313:	01 d0                	add    %edx,%eax
c0009315:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c000931a:	8b 15 c8 1e 01 c0    	mov    0xc0011ec8,%edx
c0009320:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0009325:	83 ec 04             	sub    $0x4,%esp
c0009328:	52                   	push   %edx
c0009329:	6a 00                	push   $0x0
c000932b:	50                   	push   %eax
c000932c:	e8 5e 0c 00 00       	call   c0009f8f <Memset>
c0009331:	83 c4 10             	add    $0x10,%esp
c0009334:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0009339:	05 ff 0f 00 00       	add    $0xfff,%eax
c000933e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009344:	85 c0                	test   %eax,%eax
c0009346:	0f 48 c2             	cmovs  %edx,%eax
c0009349:	c1 f8 0c             	sar    $0xc,%eax
c000934c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000934f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009352:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009355:	ff 75 e8             	pushl  -0x18(%ebp)
c0009358:	6a 01                	push   $0x1
c000935a:	ff 75 e0             	pushl  -0x20(%ebp)
c000935d:	68 8c 16 01 c0       	push   $0xc001168c
c0009362:	e8 8f fa ff ff       	call   c0008df6 <set_bits>
c0009367:	83 c4 10             	add    $0x10,%esp
c000936a:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0009371:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009374:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009377:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000937a:	83 c0 07             	add    $0x7,%eax
c000937d:	8d 50 07             	lea    0x7(%eax),%edx
c0009380:	85 c0                	test   %eax,%eax
c0009382:	0f 48 c2             	cmovs  %edx,%eax
c0009385:	c1 f8 03             	sar    $0x3,%eax
c0009388:	a3 34 e7 00 c0       	mov    %eax,0xc000e734
c000938d:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0009392:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c0009398:	01 c2                	add    %eax,%edx
c000939a:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c000939f:	01 d0                	add    %edx,%eax
c00093a1:	a3 30 e7 00 c0       	mov    %eax,0xc000e730
c00093a6:	8b 15 34 e7 00 c0    	mov    0xc000e734,%edx
c00093ac:	a1 30 e7 00 c0       	mov    0xc000e730,%eax
c00093b1:	83 ec 04             	sub    $0x4,%esp
c00093b4:	52                   	push   %edx
c00093b5:	6a 00                	push   $0x0
c00093b7:	50                   	push   %eax
c00093b8:	e8 d2 0b 00 00       	call   c0009f8f <Memset>
c00093bd:	83 c4 10             	add    $0x10,%esp
c00093c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00093c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00093c6:	01 d0                	add    %edx,%eax
c00093c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00093cb:	a1 34 e7 00 c0       	mov    0xc000e734,%eax
c00093d0:	05 ff 0f 00 00       	add    $0xfff,%eax
c00093d5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00093db:	85 c0                	test   %eax,%eax
c00093dd:	0f 48 c2             	cmovs  %edx,%eax
c00093e0:	c1 f8 0c             	sar    $0xc,%eax
c00093e3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00093e6:	ff 75 e8             	pushl  -0x18(%ebp)
c00093e9:	6a 01                	push   $0x1
c00093eb:	ff 75 e0             	pushl  -0x20(%ebp)
c00093ee:	68 8c 16 01 c0       	push   $0xc001168c
c00093f3:	e8 fe f9 ff ff       	call   c0008df6 <set_bits>
c00093f8:	83 c4 10             	add    $0x10,%esp
c00093fb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00093fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009401:	01 d0                	add    %edx,%eax
c0009403:	c1 e0 0c             	shl    $0xc,%eax
c0009406:	a3 38 e7 00 c0       	mov    %eax,0xc000e738
c000940b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000940e:	83 c0 02             	add    $0x2,%eax
c0009411:	c1 e0 0c             	shl    $0xc,%eax
c0009414:	89 c2                	mov    %eax,%edx
c0009416:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009419:	01 d0                	add    %edx,%eax
c000941b:	a3 38 e7 00 c0       	mov    %eax,0xc000e738
c0009420:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0009427:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000942a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000942d:	90                   	nop
c000942e:	c9                   	leave  
c000942f:	c3                   	ret    

c0009430 <init_memory>:
c0009430:	55                   	push   %ebp
c0009431:	89 e5                	mov    %esp,%ebp
c0009433:	83 ec 38             	sub    $0x38,%esp
c0009436:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c000943d:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0009444:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c000944b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000944e:	05 00 00 10 00       	add    $0x100000,%eax
c0009453:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009456:	8b 45 08             	mov    0x8(%ebp),%eax
c0009459:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000945c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009462:	85 c0                	test   %eax,%eax
c0009464:	0f 48 c2             	cmovs  %edx,%eax
c0009467:	c1 f8 0c             	sar    $0xc,%eax
c000946a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000946d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009470:	89 c2                	mov    %eax,%edx
c0009472:	c1 ea 1f             	shr    $0x1f,%edx
c0009475:	01 d0                	add    %edx,%eax
c0009477:	d1 f8                	sar    %eax
c0009479:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000947c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000947f:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0009482:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009485:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009488:	8d 50 07             	lea    0x7(%eax),%edx
c000948b:	85 c0                	test   %eax,%eax
c000948d:	0f 48 c2             	cmovs  %edx,%eax
c0009490:	c1 f8 03             	sar    $0x3,%eax
c0009493:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009496:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009499:	8d 50 07             	lea    0x7(%eax),%edx
c000949c:	85 c0                	test   %eax,%eax
c000949e:	0f 48 c2             	cmovs  %edx,%eax
c00094a1:	c1 f8 03             	sar    $0x3,%eax
c00094a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00094a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00094aa:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c00094af:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00094b4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00094b7:	c1 e2 0c             	shl    $0xc,%edx
c00094ba:	01 d0                	add    %edx,%eax
c00094bc:	a3 cc 1e 01 c0       	mov    %eax,0xc0011ecc
c00094c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094c4:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00094c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00094cc:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c00094d1:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c00094d6:	83 ec 04             	sub    $0x4,%esp
c00094d9:	ff 75 d8             	pushl  -0x28(%ebp)
c00094dc:	6a 00                	push   $0x0
c00094de:	50                   	push   %eax
c00094df:	e8 ab 0a 00 00       	call   c0009f8f <Memset>
c00094e4:	83 c4 10             	add    $0x10,%esp
c00094e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00094ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00094ed:	01 d0                	add    %edx,%eax
c00094ef:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c00094f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00094f7:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c00094fc:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0009501:	83 ec 04             	sub    $0x4,%esp
c0009504:	ff 75 d4             	pushl  -0x2c(%ebp)
c0009507:	6a 00                	push   $0x0
c0009509:	50                   	push   %eax
c000950a:	e8 80 0a 00 00       	call   c0009f8f <Memset>
c000950f:	83 c4 10             	add    $0x10,%esp
c0009512:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009515:	a3 34 e7 00 c0       	mov    %eax,0xc000e734
c000951a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000951d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009520:	01 c2                	add    %eax,%edx
c0009522:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009525:	01 d0                	add    %edx,%eax
c0009527:	a3 30 e7 00 c0       	mov    %eax,0xc000e730
c000952c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000952f:	a3 38 e7 00 c0       	mov    %eax,0xc000e738
c0009534:	a1 30 e7 00 c0       	mov    0xc000e730,%eax
c0009539:	83 ec 04             	sub    $0x4,%esp
c000953c:	ff 75 d8             	pushl  -0x28(%ebp)
c000953f:	6a 00                	push   $0x0
c0009541:	50                   	push   %eax
c0009542:	e8 48 0a 00 00       	call   c0009f8f <Memset>
c0009547:	83 c4 10             	add    $0x10,%esp
c000954a:	90                   	nop
c000954b:	c9                   	leave  
c000954c:	c3                   	ret    
