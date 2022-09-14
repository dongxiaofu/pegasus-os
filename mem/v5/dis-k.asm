
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	bc 20 df 00 c0       	mov    $0xc000df20,%esp
c000151a:	66 c7 05 5c e7 00 c0 	movw   $0x0,0xc000e75c
c0001521:	00 00 
c0001523:	0f 01 05 c8 06 01 c0 	sgdtl  0xc00106c8
c000152a:	e8 35 34 00 00       	call   c0004964 <ReloadGDT>
c000152f:	0f 01 15 c8 06 01 c0 	lgdtl  0xc00106c8
c0001536:	0f 01 1d 48 e7 00 c0 	lidtl  0xc000e748
c000153d:	ea 44 15 00 c0 08 00 	ljmp   $0x8,$0xc0001544

c0001544 <csinit>:
c0001544:	e9 35 03 00 00       	jmp    c000187e <kernel_main>
c0001549:	f4                   	hlt    
c000154a:	eb fe                	jmp    c000154a <csinit+0x6>
c000154c:	fb                   	sti    
c000154d:	b4 0b                	mov    $0xb,%ah
c000154f:	b0 4d                	mov    $0x4d,%al
c0001551:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001558:	eb fe                	jmp    c0001558 <csinit+0x14>
c000155a:	f4                   	hlt    
c000155b:	6a 00                	push   $0x0
c000155d:	9d                   	popf   
c000155e:	eb fe                	jmp    c000155e <csinit+0x1a>
c0001560:	e8 94 5f 00 00       	call   c00074f9 <test>
c0001565:	6a 01                	push   $0x1
c0001567:	6a 02                	push   $0x2
c0001569:	6a 03                	push   $0x3
c000156b:	f4                   	hlt    
c000156c:	66 90                	xchg   %ax,%ax
c000156e:	66 90                	xchg   %ax,%ax

c0001570 <InterruptTest>:
c0001570:	b4 0d                	mov    $0xd,%ah
c0001572:	b0 54                	mov    $0x54,%al
c0001574:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
c000157b:	c3                   	ret    

c000157c <disp_str>:
c000157c:	55                   	push   %ebp
c000157d:	89 e5                	mov    %esp,%ebp
c000157f:	b4 0d                	mov    $0xd,%ah
c0001581:	8b 75 08             	mov    0x8(%ebp),%esi
c0001584:	8b 3d 5c e7 00 c0    	mov    0xc000e75c,%edi

c000158a <disp_str.1>:
c000158a:	ac                   	lods   %ds:(%esi),%al
c000158b:	84 c0                	test   %al,%al
c000158d:	74 1e                	je     c00015ad <disp_str.4>
c000158f:	3c 0a                	cmp    $0xa,%al
c0001591:	75 11                	jne    c00015a4 <disp_str.3>
c0001593:	50                   	push   %eax
c0001594:	89 f8                	mov    %edi,%eax
c0001596:	b3 a0                	mov    $0xa0,%bl
c0001598:	f6 f3                	div    %bl
c000159a:	40                   	inc    %eax
c000159b:	b3 a0                	mov    $0xa0,%bl
c000159d:	f6 e3                	mul    %bl
c000159f:	89 c7                	mov    %eax,%edi
c00015a1:	58                   	pop    %eax
c00015a2:	eb e6                	jmp    c000158a <disp_str.1>

c00015a4 <disp_str.3>:
c00015a4:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00015a8:	83 c7 02             	add    $0x2,%edi
c00015ab:	eb dd                	jmp    c000158a <disp_str.1>

c00015ad <disp_str.4>:
c00015ad:	89 3d 5c e7 00 c0    	mov    %edi,0xc000e75c
c00015b3:	89 ec                	mov    %ebp,%esp
c00015b5:	5d                   	pop    %ebp
c00015b6:	c3                   	ret    

c00015b7 <disp_str_colour>:
c00015b7:	55                   	push   %ebp
c00015b8:	89 e5                	mov    %esp,%ebp
c00015ba:	8b 75 08             	mov    0x8(%ebp),%esi
c00015bd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00015c0:	8b 3d 5c e7 00 c0    	mov    0xc000e75c,%edi

c00015c6 <disp_str_colour.1>:
c00015c6:	ac                   	lods   %ds:(%esi),%al
c00015c7:	84 c0                	test   %al,%al
c00015c9:	74 1e                	je     c00015e9 <disp_str_colour.4>
c00015cb:	3c 0a                	cmp    $0xa,%al
c00015cd:	75 11                	jne    c00015e0 <disp_str_colour.3>
c00015cf:	50                   	push   %eax
c00015d0:	89 f8                	mov    %edi,%eax
c00015d2:	b3 a0                	mov    $0xa0,%bl
c00015d4:	f6 f3                	div    %bl
c00015d6:	40                   	inc    %eax
c00015d7:	b3 a0                	mov    $0xa0,%bl
c00015d9:	f6 e3                	mul    %bl
c00015db:	89 c7                	mov    %eax,%edi
c00015dd:	58                   	pop    %eax
c00015de:	eb e6                	jmp    c00015c6 <disp_str_colour.1>

c00015e0 <disp_str_colour.3>:
c00015e0:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00015e4:	83 c7 02             	add    $0x2,%edi
c00015e7:	eb dd                	jmp    c00015c6 <disp_str_colour.1>

c00015e9 <disp_str_colour.4>:
c00015e9:	89 3d 5c e7 00 c0    	mov    %edi,0xc000e75c
c00015ef:	89 ec                	mov    %ebp,%esp
c00015f1:	5d                   	pop    %ebp
c00015f2:	c3                   	ret    

c00015f3 <divide_zero_fault>:
c00015f3:	6a ff                	push   $0xffffffff
c00015f5:	6a 00                	push   $0x0
c00015f7:	eb 58                	jmp    c0001651 <exception>

c00015f9 <single_step_fault>:
c00015f9:	6a ff                	push   $0xffffffff
c00015fb:	6a 01                	push   $0x1
c00015fd:	eb 52                	jmp    c0001651 <exception>

c00015ff <non_maskable_interrupt>:
c00015ff:	6a ff                	push   $0xffffffff
c0001601:	6a 02                	push   $0x2
c0001603:	eb 4c                	jmp    c0001651 <exception>

c0001605 <breakpoint_trap>:
c0001605:	6a ff                	push   $0xffffffff
c0001607:	6a 03                	push   $0x3
c0001609:	eb 46                	jmp    c0001651 <exception>

c000160b <overflow_trap>:
c000160b:	6a ff                	push   $0xffffffff
c000160d:	6a 04                	push   $0x4
c000160f:	eb 40                	jmp    c0001651 <exception>

c0001611 <bound_range_exceeded_fault>:
c0001611:	6a ff                	push   $0xffffffff
c0001613:	6a 05                	push   $0x5
c0001615:	eb 3a                	jmp    c0001651 <exception>

c0001617 <invalid_opcode_fault>:
c0001617:	6a ff                	push   $0xffffffff
c0001619:	6a 06                	push   $0x6
c000161b:	eb 34                	jmp    c0001651 <exception>

c000161d <coprocessor_not_available_fault>:
c000161d:	6a ff                	push   $0xffffffff
c000161f:	6a 07                	push   $0x7
c0001621:	eb 2e                	jmp    c0001651 <exception>

c0001623 <double_fault_exception_abort>:
c0001623:	6a 08                	push   $0x8
c0001625:	eb 2a                	jmp    c0001651 <exception>

c0001627 <coprocessor_segment_overrun>:
c0001627:	6a ff                	push   $0xffffffff
c0001629:	6a 09                	push   $0x9
c000162b:	eb 24                	jmp    c0001651 <exception>

c000162d <invalid_task_state_segment_fault>:
c000162d:	6a 0a                	push   $0xa
c000162f:	eb 20                	jmp    c0001651 <exception>

c0001631 <segment_not_present_fault>:
c0001631:	6a 0b                	push   $0xb
c0001633:	eb 1c                	jmp    c0001651 <exception>

c0001635 <stack_exception_fault>:
c0001635:	6a 0c                	push   $0xc
c0001637:	eb 18                	jmp    c0001651 <exception>

c0001639 <general_protection_exception_fault>:
c0001639:	6a 0d                	push   $0xd
c000163b:	eb 14                	jmp    c0001651 <exception>

c000163d <page_fault>:
c000163d:	6a 0e                	push   $0xe
c000163f:	eb 10                	jmp    c0001651 <exception>

c0001641 <coprocessor_error_fault>:
c0001641:	6a ff                	push   $0xffffffff
c0001643:	6a 10                	push   $0x10
c0001645:	eb 0a                	jmp    c0001651 <exception>

c0001647 <align_check_fault>:
c0001647:	6a 11                	push   $0x11
c0001649:	eb 06                	jmp    c0001651 <exception>

c000164b <simd_float_exception_fault>:
c000164b:	6a ff                	push   $0xffffffff
c000164d:	6a 12                	push   $0x12
c000164f:	eb 00                	jmp    c0001651 <exception>

c0001651 <exception>:
c0001651:	e8 06 5a 00 00       	call   c000705c <exception_handler>
c0001656:	83 c4 08             	add    $0x8,%esp
c0001659:	f4                   	hlt    

c000165a <hwint0>:
c000165a:	60                   	pusha  
c000165b:	1e                   	push   %ds
c000165c:	06                   	push   %es
c000165d:	0f a0                	push   %fs
c000165f:	0f a8                	push   %gs
c0001661:	66 8c d2             	mov    %ss,%dx
c0001664:	8e da                	mov    %edx,%ds
c0001666:	8e c2                	mov    %edx,%es
c0001668:	8e e2                	mov    %edx,%fs
c000166a:	b0 20                	mov    $0x20,%al
c000166c:	e6 20                	out    %al,$0x20
c000166e:	ff 05 60 e7 00 c0    	incl   0xc000e760
c0001674:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c000167b:	75 00                	jne    c000167d <hwint0.1>

c000167d <hwint0.1>:
c000167d:	e8 dd 2f 00 00       	call   c000465f <clock_handler>
c0001682:	fa                   	cli    
c0001683:	e9 fa 00 00 00       	jmp    c0001782 <reenter_restore>

c0001688 <hwint1>:
c0001688:	60                   	pusha  
c0001689:	1e                   	push   %ds
c000168a:	06                   	push   %es
c000168b:	0f a0                	push   %fs
c000168d:	0f a8                	push   %gs
c000168f:	66 8c d2             	mov    %ss,%dx
c0001692:	8e da                	mov    %edx,%ds
c0001694:	8e c2                	mov    %edx,%es
c0001696:	8e e2                	mov    %edx,%fs
c0001698:	b0 fa                	mov    $0xfa,%al
c000169a:	e6 21                	out    %al,$0x21
c000169c:	b0 20                	mov    $0x20,%al
c000169e:	e6 20                	out    %al,$0x20
c00016a0:	ff 05 60 e7 00 c0    	incl   0xc000e760
c00016a6:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c00016ad:	75 05                	jne    c00016b4 <hwint1.2>

c00016af <hwint1.1>:
c00016af:	bc 20 e7 00 c0       	mov    $0xc000e720,%esp

c00016b4 <hwint1.2>:
c00016b4:	fb                   	sti    
c00016b5:	e8 76 3c 00 00       	call   c0005330 <keyboard_handler>
c00016ba:	b0 f8                	mov    $0xf8,%al
c00016bc:	e6 21                	out    %al,$0x21
c00016be:	fa                   	cli    
c00016bf:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c00016c6:	0f 85 b6 00 00 00    	jne    c0001782 <reenter_restore>
c00016cc:	e9 b1 00 00 00       	jmp    c0001782 <reenter_restore>

c00016d1 <hwint14>:
c00016d1:	60                   	pusha  
c00016d2:	1e                   	push   %ds
c00016d3:	06                   	push   %es
c00016d4:	0f a0                	push   %fs
c00016d6:	0f a8                	push   %gs
c00016d8:	66 8c d2             	mov    %ss,%dx
c00016db:	8e da                	mov    %edx,%ds
c00016dd:	8e c2                	mov    %edx,%es
c00016df:	8e e2                	mov    %edx,%fs
c00016e1:	b0 ff                	mov    $0xff,%al
c00016e3:	e6 a1                	out    %al,$0xa1
c00016e5:	b0 20                	mov    $0x20,%al
c00016e7:	e6 20                	out    %al,$0x20
c00016e9:	90                   	nop
c00016ea:	e6 a0                	out    %al,$0xa0
c00016ec:	ff 05 60 e7 00 c0    	incl   0xc000e760
c00016f2:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c00016f9:	75 05                	jne    c0001700 <hwint14.2>

c00016fb <hwint14.1>:
c00016fb:	bc 20 e7 00 c0       	mov    $0xc000e720,%esp

c0001700 <hwint14.2>:
c0001700:	fb                   	sti    
c0001701:	e8 51 0d 00 00       	call   c0002457 <hd_handler>
c0001706:	b0 bf                	mov    $0xbf,%al
c0001708:	e6 a1                	out    %al,$0xa1
c000170a:	fa                   	cli    
c000170b:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c0001712:	75 6e                	jne    c0001782 <reenter_restore>
c0001714:	eb 6c                	jmp    c0001782 <reenter_restore>

c0001716 <sys_call>:
c0001716:	60                   	pusha  
c0001717:	1e                   	push   %ds
c0001718:	06                   	push   %es
c0001719:	0f a0                	push   %fs
c000171b:	0f a8                	push   %gs
c000171d:	89 e6                	mov    %esp,%esi
c000171f:	66 8c d2             	mov    %ss,%dx
c0001722:	8e da                	mov    %edx,%ds
c0001724:	8e c2                	mov    %edx,%es
c0001726:	8e e2                	mov    %edx,%fs
c0001728:	ff 05 60 e7 00 c0    	incl   0xc000e760
c000172e:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c0001735:	75 05                	jne    c000173c <sys_call.2>

c0001737 <sys_call.1>:
c0001737:	bc 20 e7 00 c0       	mov    $0xc000e720,%esp

c000173c <sys_call.2>:
c000173c:	fb                   	sti    
c000173d:	56                   	push   %esi
c000173e:	ff 35 80 eb 00 c0    	pushl  0xc000eb80
c0001744:	53                   	push   %ebx
c0001745:	51                   	push   %ecx
c0001746:	ff 14 85 0c d1 00 c0 	call   *-0x3fff2ef4(,%eax,4)
c000174d:	83 c4 0c             	add    $0xc,%esp
c0001750:	5e                   	pop    %esi
c0001751:	89 46 2c             	mov    %eax,0x2c(%esi)
c0001754:	fa                   	cli    
c0001755:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c000175c:	75 24                	jne    c0001782 <reenter_restore>
c000175e:	eb 22                	jmp    c0001782 <reenter_restore>

c0001760 <restart>:
c0001760:	ff 0d 60 e7 00 c0    	decl   0xc000e760
c0001766:	8b 25 80 eb 00 c0    	mov    0xc000eb80,%esp
c000176c:	0f 00 54 24 44       	lldt   0x44(%esp)
c0001771:	8d 44 24 44          	lea    0x44(%esp),%eax
c0001775:	a3 44 06 01 c0       	mov    %eax,0xc0010644
c000177a:	0f a9                	pop    %gs
c000177c:	0f a1                	pop    %fs
c000177e:	07                   	pop    %es
c000177f:	1f                   	pop    %ds
c0001780:	61                   	popa   
c0001781:	cf                   	iret   

c0001782 <reenter_restore>:
c0001782:	ff 0d 60 e7 00 c0    	decl   0xc000e760
c0001788:	0f a9                	pop    %gs
c000178a:	0f a1                	pop    %fs
c000178c:	07                   	pop    %es
c000178d:	1f                   	pop    %ds
c000178e:	61                   	popa   
c000178f:	cf                   	iret   

c0001790 <in_byte>:
c0001790:	31 d2                	xor    %edx,%edx
c0001792:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001796:	31 c0                	xor    %eax,%eax
c0001798:	ec                   	in     (%dx),%al
c0001799:	90                   	nop
c000179a:	90                   	nop
c000179b:	c3                   	ret    

c000179c <out_byte>:
c000179c:	31 d2                	xor    %edx,%edx
c000179e:	31 c0                	xor    %eax,%eax
c00017a0:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017a4:	8a 44 24 08          	mov    0x8(%esp),%al
c00017a8:	ee                   	out    %al,(%dx)
c00017a9:	90                   	nop
c00017aa:	90                   	nop
c00017ab:	c3                   	ret    

c00017ac <in_byte2>:
c00017ac:	55                   	push   %ebp
c00017ad:	89 e5                	mov    %esp,%ebp
c00017af:	52                   	push   %edx
c00017b0:	31 d2                	xor    %edx,%edx
c00017b2:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017b6:	31 c0                	xor    %eax,%eax
c00017b8:	ec                   	in     (%dx),%al
c00017b9:	90                   	nop
c00017ba:	90                   	nop
c00017bb:	5b                   	pop    %ebx
c00017bc:	5d                   	pop    %ebp
c00017bd:	c3                   	ret    

c00017be <disable_int>:
c00017be:	fa                   	cli    
c00017bf:	c3                   	ret    

c00017c0 <enable_int>:
c00017c0:	fb                   	sti    
c00017c1:	c3                   	ret    

c00017c2 <check_tss_esp0>:
c00017c2:	55                   	push   %ebp
c00017c3:	89 e5                	mov    %esp,%ebp
c00017c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00017c8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017cb:	83 c0 44             	add    $0x44,%eax
c00017ce:	8b 15 44 06 01 c0    	mov    0xc0010644,%edx
c00017d4:	39 d0                	cmp    %edx,%eax
c00017d6:	74 7c                	je     c0001854 <check_tss_esp0.2>

c00017d8 <check_tss_esp0.1>:
c00017d8:	50                   	push   %eax
c00017d9:	52                   	push   %edx
c00017da:	68 10 d0 00 c0       	push   $0xc000d010
c00017df:	e8 98 fd ff ff       	call   c000157c <disp_str>
c00017e4:	83 c4 04             	add    $0x4,%esp
c00017e7:	5a                   	pop    %edx
c00017e8:	58                   	pop    %eax
c00017e9:	52                   	push   %edx
c00017ea:	50                   	push   %eax
c00017eb:	53                   	push   %ebx
c00017ec:	e8 e9 56 00 00       	call   c0006eda <disp_int>
c00017f1:	83 c4 04             	add    $0x4,%esp
c00017f4:	58                   	pop    %eax
c00017f5:	5a                   	pop    %edx
c00017f6:	52                   	push   %edx
c00017f7:	50                   	push   %eax
c00017f8:	e8 dd 56 00 00       	call   c0006eda <disp_int>
c00017fd:	58                   	pop    %eax
c00017fe:	5a                   	pop    %edx
c00017ff:	52                   	push   %edx
c0001800:	50                   	push   %eax
c0001801:	ff 35 60 e7 00 c0    	pushl  0xc000e760
c0001807:	e8 ce 56 00 00       	call   c0006eda <disp_int>
c000180c:	83 c4 04             	add    $0x4,%esp
c000180f:	58                   	pop    %eax
c0001810:	5a                   	pop    %edx
c0001811:	52                   	push   %edx
c0001812:	50                   	push   %eax
c0001813:	ff 72 ec             	pushl  -0x14(%edx)
c0001816:	e8 bf 56 00 00       	call   c0006eda <disp_int>
c000181b:	83 c4 04             	add    $0x4,%esp
c000181e:	58                   	pop    %eax
c000181f:	5a                   	pop    %edx
c0001820:	52                   	push   %edx
c0001821:	50                   	push   %eax
c0001822:	ff 70 ec             	pushl  -0x14(%eax)
c0001825:	e8 b0 56 00 00       	call   c0006eda <disp_int>
c000182a:	83 c4 04             	add    $0x4,%esp
c000182d:	58                   	pop    %eax
c000182e:	5a                   	pop    %edx
c000182f:	52                   	push   %edx
c0001830:	50                   	push   %eax
c0001831:	ff 35 80 eb 00 c0    	pushl  0xc000eb80
c0001837:	e8 9e 56 00 00       	call   c0006eda <disp_int>
c000183c:	83 c4 04             	add    $0x4,%esp
c000183f:	58                   	pop    %eax
c0001840:	5a                   	pop    %edx
c0001841:	52                   	push   %edx
c0001842:	50                   	push   %eax
c0001843:	68 20 e7 00 c0       	push   $0xc000e720
c0001848:	e8 8d 56 00 00       	call   c0006eda <disp_int>
c000184d:	83 c4 04             	add    $0x4,%esp
c0001850:	58                   	pop    %eax
c0001851:	5a                   	pop    %edx
c0001852:	5d                   	pop    %ebp
c0001853:	c3                   	ret    

c0001854 <check_tss_esp0.2>:
c0001854:	5d                   	pop    %ebp
c0001855:	c3                   	ret    

c0001856 <enable_8259A_casecade_irq>:
c0001856:	9c                   	pushf  
c0001857:	fa                   	cli    
c0001858:	e4 21                	in     $0x21,%al
c000185a:	24 fb                	and    $0xfb,%al
c000185c:	e6 21                	out    %al,$0x21
c000185e:	9d                   	popf   
c000185f:	c3                   	ret    

c0001860 <disable_8259A_casecade_irq>:
c0001860:	9c                   	pushf  
c0001861:	fa                   	cli    
c0001862:	e4 21                	in     $0x21,%al
c0001864:	0c 04                	or     $0x4,%al
c0001866:	e6 21                	out    %al,$0x21
c0001868:	9c                   	pushf  
c0001869:	c3                   	ret    

c000186a <enable_8259A_slave_winchester_irq>:
c000186a:	9c                   	pushf  
c000186b:	fa                   	cli    
c000186c:	e4 a1                	in     $0xa1,%al
c000186e:	24 bf                	and    $0xbf,%al
c0001870:	e6 a1                	out    %al,$0xa1
c0001872:	9d                   	popf   
c0001873:	c3                   	ret    

c0001874 <disable_8259A_slave_winchester_irq>:
c0001874:	9c                   	pushf  
c0001875:	fa                   	cli    
c0001876:	e4 a1                	in     $0xa1,%al
c0001878:	0c 40                	or     $0x40,%al
c000187a:	e6 a1                	out    %al,$0xa1
c000187c:	9d                   	popf   
c000187d:	c3                   	ret    

c000187e <kernel_main>:
c000187e:	55                   	push   %ebp
c000187f:	89 e5                	mov    %esp,%ebp
c0001881:	83 ec 08             	sub    $0x8,%esp
c0001884:	e8 4d 00 00 00       	call   c00018d6 <init>
c0001889:	83 ec 0c             	sub    $0xc,%esp
c000188c:	68 80 99 00 c0       	push   $0xc0009980
c0001891:	e8 e6 fc ff ff       	call   c000157c <disp_str>
c0001896:	83 c4 10             	add    $0x10,%esp
c0001899:	83 ec 08             	sub    $0x8,%esp
c000189c:	68 8c 99 00 c0       	push   $0xc000998c
c00018a1:	68 18 19 00 c0       	push   $0xc0001918
c00018a6:	e8 38 80 00 00       	call   c00098e3 <thread_start>
c00018ab:	83 c4 10             	add    $0x10,%esp
c00018ae:	83 ec 08             	sub    $0x8,%esp
c00018b1:	68 96 99 00 c0       	push   $0xc0009996
c00018b6:	68 7a 19 00 c0       	push   $0xc000197a
c00018bb:	e8 23 80 00 00       	call   c00098e3 <thread_start>
c00018c0:	83 c4 10             	add    $0x10,%esp
c00018c3:	83 ec 0c             	sub    $0xc,%esp
c00018c6:	68 a0 99 00 c0       	push   $0xc00099a0
c00018cb:	e8 ac fc ff ff       	call   c000157c <disp_str>
c00018d0:	83 c4 10             	add    $0x10,%esp
c00018d3:	fb                   	sti    
c00018d4:	eb fe                	jmp    c00018d4 <kernel_main+0x56>

c00018d6 <init>:
c00018d6:	55                   	push   %ebp
c00018d7:	89 e5                	mov    %esp,%ebp
c00018d9:	83 ec 08             	sub    $0x8,%esp
c00018dc:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c00018e3:	00 00 00 
c00018e6:	83 ec 0c             	sub    $0xc,%esp
c00018e9:	68 aa 99 00 c0       	push   $0xc00099aa
c00018ee:	e8 89 fc ff ff       	call   c000157c <disp_str>
c00018f3:	83 c4 10             	add    $0x10,%esp
c00018f6:	e8 b3 5c 00 00       	call   c00075ae <init_keyboard>
c00018fb:	83 ec 0c             	sub    $0xc,%esp
c00018fe:	68 00 00 00 02       	push   $0x2000000
c0001903:	e8 05 52 00 00       	call   c0006b0d <init_memory>
c0001908:	83 c4 10             	add    $0x10,%esp
c000190b:	e8 35 7d 00 00       	call   c0009645 <initDoubleLinkList>
c0001910:	a3 ac ed 00 c0       	mov    %eax,0xc000edac
c0001915:	90                   	nop
c0001916:	c9                   	leave  
c0001917:	c3                   	ret    

c0001918 <kernel_thread_a>:
c0001918:	55                   	push   %ebp
c0001919:	89 e5                	mov    %esp,%ebp
c000191b:	83 ec 18             	sub    $0x18,%esp
c000191e:	83 ec 0c             	sub    $0xc,%esp
c0001921:	ff 75 08             	pushl  0x8(%ebp)
c0001924:	e8 53 fc ff ff       	call   c000157c <disp_str>
c0001929:	83 c4 10             	add    $0x10,%esp
c000192c:	a1 5c e7 00 c0       	mov    0xc000e75c,%eax
c0001931:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001934:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000193b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000193e:	a3 5c e7 00 c0       	mov    %eax,0xc000e75c
c0001943:	83 ec 0c             	sub    $0xc,%esp
c0001946:	68 b0 99 00 c0       	push   $0xc00099b0
c000194b:	e8 2c fc ff ff       	call   c000157c <disp_str>
c0001950:	83 c4 10             	add    $0x10,%esp
c0001953:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001956:	8d 50 01             	lea    0x1(%eax),%edx
c0001959:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000195c:	83 ec 0c             	sub    $0xc,%esp
c000195f:	50                   	push   %eax
c0001960:	e8 75 55 00 00       	call   c0006eda <disp_int>
c0001965:	83 c4 10             	add    $0x10,%esp
c0001968:	83 ec 0c             	sub    $0xc,%esp
c000196b:	68 b9 99 00 c0       	push   $0xc00099b9
c0001970:	e8 07 fc ff ff       	call   c000157c <disp_str>
c0001975:	83 c4 10             	add    $0x10,%esp
c0001978:	eb c1                	jmp    c000193b <kernel_thread_a+0x23>

c000197a <kernel_thread_b>:
c000197a:	55                   	push   %ebp
c000197b:	89 e5                	mov    %esp,%ebp
c000197d:	83 ec 08             	sub    $0x8,%esp
c0001980:	83 ec 0c             	sub    $0xc,%esp
c0001983:	ff 75 08             	pushl  0x8(%ebp)
c0001986:	e8 f1 fb ff ff       	call   c000157c <disp_str>
c000198b:	83 c4 10             	add    $0x10,%esp
c000198e:	eb fe                	jmp    c000198e <kernel_thread_b+0x14>

c0001990 <TaskHD>:
c0001990:	55                   	push   %ebp
c0001991:	89 e5                	mov    %esp,%ebp
c0001993:	83 ec 08             	sub    $0x8,%esp
c0001996:	e8 07 00 00 00       	call   c00019a2 <init_hd>
c000199b:	e8 1c 00 00 00       	call   c00019bc <hd_handle>
c00019a0:	eb f9                	jmp    c000199b <TaskHD+0xb>

c00019a2 <init_hd>:
c00019a2:	55                   	push   %ebp
c00019a3:	89 e5                	mov    %esp,%ebp
c00019a5:	83 ec 18             	sub    $0x18,%esp
c00019a8:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c00019af:	e8 a2 fe ff ff       	call   c0001856 <enable_8259A_casecade_irq>
c00019b4:	e8 b1 fe ff ff       	call   c000186a <enable_8259A_slave_winchester_irq>
c00019b9:	90                   	nop
c00019ba:	c9                   	leave  
c00019bb:	c3                   	ret    

c00019bc <hd_handle>:
c00019bc:	55                   	push   %ebp
c00019bd:	89 e5                	mov    %esp,%ebp
c00019bf:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00019c5:	83 ec 04             	sub    $0x4,%esp
c00019c8:	6a 0e                	push   $0xe
c00019ca:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00019cd:	50                   	push   %eax
c00019ce:	6a 02                	push   $0x2
c00019d0:	e8 f5 78 00 00       	call   c00092ca <send_rec>
c00019d5:	83 c4 10             	add    $0x10,%esp
c00019d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00019db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00019de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00019e2:	0f 84 96 00 00 00    	je     c0001a7e <hd_handle+0xc2>
c00019e8:	8b 45 84             	mov    -0x7c(%ebp),%eax
c00019eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019ee:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00019f2:	74 23                	je     c0001a17 <hd_handle+0x5b>
c00019f4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00019f8:	77 08                	ja     c0001a02 <hd_handle+0x46>
c00019fa:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00019fe:	74 10                	je     c0001a10 <hd_handle+0x54>
c0001a00:	eb 35                	jmp    c0001a37 <hd_handle+0x7b>
c0001a02:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001a06:	74 0f                	je     c0001a17 <hd_handle+0x5b>
c0001a08:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001a0c:	74 1a                	je     c0001a28 <hd_handle+0x6c>
c0001a0e:	eb 27                	jmp    c0001a37 <hd_handle+0x7b>
c0001a10:	e8 18 07 00 00       	call   c000212d <hd_open>
c0001a15:	eb 31                	jmp    c0001a48 <hd_handle+0x8c>
c0001a17:	83 ec 0c             	sub    $0xc,%esp
c0001a1a:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0001a1d:	50                   	push   %eax
c0001a1e:	e8 02 08 00 00       	call   c0002225 <hd_rdwt>
c0001a23:	83 c4 10             	add    $0x10,%esp
c0001a26:	eb 20                	jmp    c0001a48 <hd_handle+0x8c>
c0001a28:	83 ec 0c             	sub    $0xc,%esp
c0001a2b:	6a 00                	push   $0x0
c0001a2d:	e8 4a 07 00 00       	call   c000217c <get_hd_ioctl>
c0001a32:	83 c4 10             	add    $0x10,%esp
c0001a35:	eb 11                	jmp    c0001a48 <hd_handle+0x8c>
c0001a37:	83 ec 0c             	sub    $0xc,%esp
c0001a3a:	68 bb 99 00 c0       	push   $0xc00099bb
c0001a3f:	e8 eb 6f 00 00       	call   c0008a2f <spin>
c0001a44:	83 c4 10             	add    $0x10,%esp
c0001a47:	90                   	nop
c0001a48:	83 ec 04             	sub    $0x4,%esp
c0001a4b:	6a 6c                	push   $0x6c
c0001a4d:	6a 00                	push   $0x0
c0001a4f:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0001a52:	50                   	push   %eax
c0001a53:	e8 87 8a 00 00       	call   c000a4df <Memset>
c0001a58:	83 c4 10             	add    $0x10,%esp
c0001a5b:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
c0001a62:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0001a69:	83 ec 04             	sub    $0x4,%esp
c0001a6c:	6a 03                	push   $0x3
c0001a6e:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0001a71:	50                   	push   %eax
c0001a72:	6a 01                	push   $0x1
c0001a74:	e8 51 78 00 00       	call   c00092ca <send_rec>
c0001a79:	83 c4 10             	add    $0x10,%esp
c0001a7c:	eb 01                	jmp    c0001a7f <hd_handle+0xc3>
c0001a7e:	90                   	nop
c0001a7f:	c9                   	leave  
c0001a80:	c3                   	ret    

c0001a81 <hd_cmd_out>:
c0001a81:	55                   	push   %ebp
c0001a82:	89 e5                	mov    %esp,%ebp
c0001a84:	83 ec 08             	sub    $0x8,%esp
c0001a87:	83 ec 04             	sub    $0x4,%esp
c0001a8a:	68 98 3a 00 00       	push   $0x3a98
c0001a8f:	6a 00                	push   $0x0
c0001a91:	68 80 00 00 00       	push   $0x80
c0001a96:	e8 e8 09 00 00       	call   c0002483 <waitfor>
c0001a9b:	83 c4 10             	add    $0x10,%esp
c0001a9e:	85 c0                	test   %eax,%eax
c0001aa0:	75 10                	jne    c0001ab2 <hd_cmd_out+0x31>
c0001aa2:	83 ec 0c             	sub    $0xc,%esp
c0001aa5:	68 cd 99 00 c0       	push   $0xc00099cd
c0001aaa:	e8 85 6f 00 00       	call   c0008a34 <panic>
c0001aaf:	83 c4 10             	add    $0x10,%esp
c0001ab2:	83 ec 08             	sub    $0x8,%esp
c0001ab5:	6a 00                	push   $0x0
c0001ab7:	68 f6 03 00 00       	push   $0x3f6
c0001abc:	e8 db fc ff ff       	call   c000179c <out_byte>
c0001ac1:	83 c4 10             	add    $0x10,%esp
c0001ac4:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ac7:	0f b6 00             	movzbl (%eax),%eax
c0001aca:	0f b6 c0             	movzbl %al,%eax
c0001acd:	83 ec 08             	sub    $0x8,%esp
c0001ad0:	50                   	push   %eax
c0001ad1:	68 f1 01 00 00       	push   $0x1f1
c0001ad6:	e8 c1 fc ff ff       	call   c000179c <out_byte>
c0001adb:	83 c4 10             	add    $0x10,%esp
c0001ade:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ae1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001ae5:	0f b6 c0             	movzbl %al,%eax
c0001ae8:	83 ec 08             	sub    $0x8,%esp
c0001aeb:	50                   	push   %eax
c0001aec:	68 f2 01 00 00       	push   $0x1f2
c0001af1:	e8 a6 fc ff ff       	call   c000179c <out_byte>
c0001af6:	83 c4 10             	add    $0x10,%esp
c0001af9:	8b 45 08             	mov    0x8(%ebp),%eax
c0001afc:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001b00:	0f b6 c0             	movzbl %al,%eax
c0001b03:	83 ec 08             	sub    $0x8,%esp
c0001b06:	50                   	push   %eax
c0001b07:	68 f3 01 00 00       	push   $0x1f3
c0001b0c:	e8 8b fc ff ff       	call   c000179c <out_byte>
c0001b11:	83 c4 10             	add    $0x10,%esp
c0001b14:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b17:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001b1b:	0f b6 c0             	movzbl %al,%eax
c0001b1e:	83 ec 08             	sub    $0x8,%esp
c0001b21:	50                   	push   %eax
c0001b22:	68 f4 01 00 00       	push   $0x1f4
c0001b27:	e8 70 fc ff ff       	call   c000179c <out_byte>
c0001b2c:	83 c4 10             	add    $0x10,%esp
c0001b2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b32:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001b36:	0f b6 c0             	movzbl %al,%eax
c0001b39:	83 ec 08             	sub    $0x8,%esp
c0001b3c:	50                   	push   %eax
c0001b3d:	68 f5 01 00 00       	push   $0x1f5
c0001b42:	e8 55 fc ff ff       	call   c000179c <out_byte>
c0001b47:	83 c4 10             	add    $0x10,%esp
c0001b4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b4d:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001b51:	0f b6 c0             	movzbl %al,%eax
c0001b54:	83 ec 08             	sub    $0x8,%esp
c0001b57:	50                   	push   %eax
c0001b58:	68 f6 01 00 00       	push   $0x1f6
c0001b5d:	e8 3a fc ff ff       	call   c000179c <out_byte>
c0001b62:	83 c4 10             	add    $0x10,%esp
c0001b65:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b68:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001b6c:	0f b6 c0             	movzbl %al,%eax
c0001b6f:	83 ec 08             	sub    $0x8,%esp
c0001b72:	50                   	push   %eax
c0001b73:	68 f7 01 00 00       	push   $0x1f7
c0001b78:	e8 1f fc ff ff       	call   c000179c <out_byte>
c0001b7d:	83 c4 10             	add    $0x10,%esp
c0001b80:	90                   	nop
c0001b81:	c9                   	leave  
c0001b82:	c3                   	ret    

c0001b83 <hd_identify>:
c0001b83:	55                   	push   %ebp
c0001b84:	89 e5                	mov    %esp,%ebp
c0001b86:	53                   	push   %ebx
c0001b87:	83 ec 24             	sub    $0x24,%esp
c0001b8a:	89 e0                	mov    %esp,%eax
c0001b8c:	89 c3                	mov    %eax,%ebx
c0001b8e:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001b92:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001b96:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001b9a:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001b9e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ba5:	c1 e0 04             	shl    $0x4,%eax
c0001ba8:	83 c8 e0             	or     $0xffffffe0,%eax
c0001bab:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001bae:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001bb2:	83 ec 0c             	sub    $0xc,%esp
c0001bb5:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001bb8:	50                   	push   %eax
c0001bb9:	e8 c3 fe ff ff       	call   c0001a81 <hd_cmd_out>
c0001bbe:	83 c4 10             	add    $0x10,%esp
c0001bc1:	e8 40 06 00 00       	call   c0002206 <interrupt_wait>
c0001bc6:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001bd0:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001bd3:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001bd6:	89 c2                	mov    %eax,%edx
c0001bd8:	b8 10 00 00 00       	mov    $0x10,%eax
c0001bdd:	83 e8 01             	sub    $0x1,%eax
c0001be0:	01 d0                	add    %edx,%eax
c0001be2:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001be7:	ba 00 00 00 00       	mov    $0x0,%edx
c0001bec:	f7 f1                	div    %ecx
c0001bee:	6b c0 10             	imul   $0x10,%eax,%eax
c0001bf1:	29 c4                	sub    %eax,%esp
c0001bf3:	89 e0                	mov    %esp,%eax
c0001bf5:	83 c0 00             	add    $0x0,%eax
c0001bf8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001bfb:	83 ec 04             	sub    $0x4,%esp
c0001bfe:	ff 75 f4             	pushl  -0xc(%ebp)
c0001c01:	6a 00                	push   $0x0
c0001c03:	ff 75 ec             	pushl  -0x14(%ebp)
c0001c06:	e8 d4 88 00 00       	call   c000a4df <Memset>
c0001c0b:	83 c4 10             	add    $0x10,%esp
c0001c0e:	83 ec 04             	sub    $0x4,%esp
c0001c11:	ff 75 f4             	pushl  -0xc(%ebp)
c0001c14:	ff 75 ec             	pushl  -0x14(%ebp)
c0001c17:	68 f0 01 00 00       	push   $0x1f0
c0001c1c:	e8 12 89 00 00       	call   c000a533 <read_port>
c0001c21:	83 c4 10             	add    $0x10,%esp
c0001c24:	83 ec 0c             	sub    $0xc,%esp
c0001c27:	ff 75 ec             	pushl  -0x14(%ebp)
c0001c2a:	e8 0b 00 00 00       	call   c0001c3a <print_hdinfo>
c0001c2f:	83 c4 10             	add    $0x10,%esp
c0001c32:	89 dc                	mov    %ebx,%esp
c0001c34:	90                   	nop
c0001c35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001c38:	c9                   	leave  
c0001c39:	c3                   	ret    

c0001c3a <print_hdinfo>:
c0001c3a:	55                   	push   %ebp
c0001c3b:	89 e5                	mov    %esp,%ebp
c0001c3d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001c43:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001c49:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001c4f:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001c56:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001c5d:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001c64:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001c6b:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001c72:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001c78:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001c7e:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001c85:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001c8c:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001c93:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001c9a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001ca1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001ca8:	e9 8f 00 00 00       	jmp    c0001d3c <print_hdinfo+0x102>
c0001cad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001cb4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001cb7:	89 d0                	mov    %edx,%eax
c0001cb9:	01 c0                	add    %eax,%eax
c0001cbb:	01 d0                	add    %edx,%eax
c0001cbd:	c1 e0 03             	shl    $0x3,%eax
c0001cc0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001cc3:	01 c8                	add    %ecx,%eax
c0001cc5:	83 e8 44             	sub    $0x44,%eax
c0001cc8:	0f b7 00             	movzwl (%eax),%eax
c0001ccb:	0f b7 c0             	movzwl %ax,%eax
c0001cce:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001cd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cd4:	01 d0                	add    %edx,%eax
c0001cd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001cd9:	eb 30                	jmp    c0001d0b <print_hdinfo+0xd1>
c0001cdb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001cde:	8d 50 01             	lea    0x1(%eax),%edx
c0001ce1:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001ce4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001ce7:	83 c2 01             	add    $0x1,%edx
c0001cea:	0f b6 00             	movzbl (%eax),%eax
c0001ced:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001cf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001cf4:	8d 50 01             	lea    0x1(%eax),%edx
c0001cf7:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001cfa:	0f b6 00             	movzbl (%eax),%eax
c0001cfd:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001d00:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001d03:	01 ca                	add    %ecx,%edx
c0001d05:	88 02                	mov    %al,(%edx)
c0001d07:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001d0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001d0e:	89 d0                	mov    %edx,%eax
c0001d10:	01 c0                	add    %eax,%eax
c0001d12:	01 d0                	add    %edx,%eax
c0001d14:	c1 e0 03             	shl    $0x3,%eax
c0001d17:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001d1a:	01 c8                	add    %ecx,%eax
c0001d1c:	83 e8 42             	sub    $0x42,%eax
c0001d1f:	0f b7 00             	movzwl (%eax),%eax
c0001d22:	66 d1 e8             	shr    %ax
c0001d25:	0f b7 c0             	movzwl %ax,%eax
c0001d28:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001d2b:	7c ae                	jl     c0001cdb <print_hdinfo+0xa1>
c0001d2d:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001d30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001d33:	01 d0                	add    %edx,%eax
c0001d35:	c6 00 00             	movb   $0x0,(%eax)
c0001d38:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001d3c:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001d40:	0f 8e 67 ff ff ff    	jle    c0001cad <print_hdinfo+0x73>
c0001d46:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d49:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001d4d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001d51:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001d55:	66 c1 e8 08          	shr    $0x8,%ax
c0001d59:	66 85 c0             	test   %ax,%ax
c0001d5c:	0f 95 c0             	setne  %al
c0001d5f:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001d62:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001d69:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001d6f:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001d73:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001d77:	75 15                	jne    c0001d8e <print_hdinfo+0x154>
c0001d79:	83 ec 08             	sub    $0x8,%esp
c0001d7c:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001d7f:	50                   	push   %eax
c0001d80:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001d83:	50                   	push   %eax
c0001d84:	e8 75 87 00 00       	call   c000a4fe <Strcpy>
c0001d89:	83 c4 10             	add    $0x10,%esp
c0001d8c:	eb 13                	jmp    c0001da1 <print_hdinfo+0x167>
c0001d8e:	83 ec 08             	sub    $0x8,%esp
c0001d91:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001d94:	50                   	push   %eax
c0001d95:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001d98:	50                   	push   %eax
c0001d99:	e8 60 87 00 00       	call   c000a4fe <Strcpy>
c0001d9e:	83 c4 10             	add    $0x10,%esp
c0001da1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001da4:	83 c0 7a             	add    $0x7a,%eax
c0001da7:	0f b7 00             	movzwl (%eax),%eax
c0001daa:	0f b7 d0             	movzwl %ax,%edx
c0001dad:	8b 45 08             	mov    0x8(%ebp),%eax
c0001db0:	83 c0 78             	add    $0x78,%eax
c0001db3:	0f b7 00             	movzwl (%eax),%eax
c0001db6:	0f b7 c0             	movzwl %ax,%eax
c0001db9:	83 c0 10             	add    $0x10,%eax
c0001dbc:	89 c1                	mov    %eax,%ecx
c0001dbe:	d3 e2                	shl    %cl,%edx
c0001dc0:	89 d0                	mov    %edx,%eax
c0001dc2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001dc5:	90                   	nop
c0001dc6:	c9                   	leave  
c0001dc7:	c3                   	ret    

c0001dc8 <print_dpt_entry>:
c0001dc8:	55                   	push   %ebp
c0001dc9:	89 e5                	mov    %esp,%ebp
c0001dcb:	83 ec 08             	sub    $0x8,%esp
c0001dce:	8b 45 08             	mov    0x8(%ebp),%eax
c0001dd1:	8b 40 08             	mov    0x8(%eax),%eax
c0001dd4:	83 ec 08             	sub    $0x8,%esp
c0001dd7:	50                   	push   %eax
c0001dd8:	68 d7 99 00 c0       	push   $0xc00099d7
c0001ddd:	e8 20 69 00 00       	call   c0008702 <Printf>
c0001de2:	83 c4 10             	add    $0x10,%esp
c0001de5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001de8:	8b 40 0c             	mov    0xc(%eax),%eax
c0001deb:	83 ec 08             	sub    $0x8,%esp
c0001dee:	50                   	push   %eax
c0001def:	68 df 99 00 c0       	push   $0xc00099df
c0001df4:	e8 09 69 00 00       	call   c0008702 <Printf>
c0001df9:	83 c4 10             	add    $0x10,%esp
c0001dfc:	8b 45 08             	mov    0x8(%ebp),%eax
c0001dff:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001e03:	0f b6 c0             	movzbl %al,%eax
c0001e06:	83 ec 08             	sub    $0x8,%esp
c0001e09:	50                   	push   %eax
c0001e0a:	68 f0 99 00 c0       	push   $0xc00099f0
c0001e0f:	e8 ee 68 00 00       	call   c0008702 <Printf>
c0001e14:	83 c4 10             	add    $0x10,%esp
c0001e17:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e1a:	0f b6 00             	movzbl (%eax),%eax
c0001e1d:	0f b6 c0             	movzbl %al,%eax
c0001e20:	83 ec 08             	sub    $0x8,%esp
c0001e23:	50                   	push   %eax
c0001e24:	68 fe 99 00 c0       	push   $0xc00099fe
c0001e29:	e8 d4 68 00 00       	call   c0008702 <Printf>
c0001e2e:	83 c4 10             	add    $0x10,%esp
c0001e31:	90                   	nop
c0001e32:	c9                   	leave  
c0001e33:	c3                   	ret    

c0001e34 <get_partition_table>:
c0001e34:	55                   	push   %ebp
c0001e35:	89 e5                	mov    %esp,%ebp
c0001e37:	53                   	push   %ebx
c0001e38:	83 ec 24             	sub    $0x24,%esp
c0001e3b:	89 e0                	mov    %esp,%eax
c0001e3d:	89 c3                	mov    %eax,%ebx
c0001e3f:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001e43:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001e47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001e4a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001e4d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001e50:	c1 f8 08             	sar    $0x8,%eax
c0001e53:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001e56:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001e59:	c1 f8 10             	sar    $0x10,%eax
c0001e5c:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001e5f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001e62:	c1 f8 18             	sar    $0x18,%eax
c0001e65:	89 c2                	mov    %eax,%edx
c0001e67:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e6a:	c1 e0 04             	shl    $0x4,%eax
c0001e6d:	09 d0                	or     %edx,%eax
c0001e6f:	83 c8 e0             	or     $0xffffffe0,%eax
c0001e72:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001e75:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001e79:	83 ec 0c             	sub    $0xc,%esp
c0001e7c:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001e7f:	50                   	push   %eax
c0001e80:	e8 fc fb ff ff       	call   c0001a81 <hd_cmd_out>
c0001e85:	83 c4 10             	add    $0x10,%esp
c0001e88:	e8 79 03 00 00       	call   c0002206 <interrupt_wait>
c0001e8d:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001e94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e97:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001e9a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001e9d:	89 c2                	mov    %eax,%edx
c0001e9f:	b8 10 00 00 00       	mov    $0x10,%eax
c0001ea4:	83 e8 01             	sub    $0x1,%eax
c0001ea7:	01 d0                	add    %edx,%eax
c0001ea9:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001eae:	ba 00 00 00 00       	mov    $0x0,%edx
c0001eb3:	f7 f1                	div    %ecx
c0001eb5:	6b c0 10             	imul   $0x10,%eax,%eax
c0001eb8:	29 c4                	sub    %eax,%esp
c0001eba:	89 e0                	mov    %esp,%eax
c0001ebc:	83 c0 00             	add    $0x0,%eax
c0001ebf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001ec2:	83 ec 04             	sub    $0x4,%esp
c0001ec5:	ff 75 f4             	pushl  -0xc(%ebp)
c0001ec8:	6a 00                	push   $0x0
c0001eca:	ff 75 ec             	pushl  -0x14(%ebp)
c0001ecd:	e8 0d 86 00 00       	call   c000a4df <Memset>
c0001ed2:	83 c4 10             	add    $0x10,%esp
c0001ed5:	83 ec 04             	sub    $0x4,%esp
c0001ed8:	ff 75 f4             	pushl  -0xc(%ebp)
c0001edb:	ff 75 ec             	pushl  -0x14(%ebp)
c0001ede:	68 f0 01 00 00       	push   $0x1f0
c0001ee3:	e8 4b 86 00 00       	call   c000a533 <read_port>
c0001ee8:	83 c4 10             	add    $0x10,%esp
c0001eeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001eee:	05 be 01 00 00       	add    $0x1be,%eax
c0001ef3:	83 ec 04             	sub    $0x4,%esp
c0001ef6:	6a 40                	push   $0x40
c0001ef8:	50                   	push   %eax
c0001ef9:	ff 75 10             	pushl  0x10(%ebp)
c0001efc:	e8 b0 85 00 00       	call   c000a4b1 <Memcpy>
c0001f01:	83 c4 10             	add    $0x10,%esp
c0001f04:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001f0b:	89 dc                	mov    %ebx,%esp
c0001f0d:	90                   	nop
c0001f0e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001f11:	c9                   	leave  
c0001f12:	c3                   	ret    

c0001f13 <partition>:
c0001f13:	55                   	push   %ebp
c0001f14:	89 e5                	mov    %esp,%ebp
c0001f16:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001f1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f1f:	88 45 84             	mov    %al,-0x7c(%ebp)
c0001f22:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001f26:	7f 19                	jg     c0001f41 <partition+0x2e>
c0001f28:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001f2b:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001f30:	89 c8                	mov    %ecx,%eax
c0001f32:	f7 ea                	imul   %edx
c0001f34:	d1 fa                	sar    %edx
c0001f36:	89 c8                	mov    %ecx,%eax
c0001f38:	c1 f8 1f             	sar    $0x1f,%eax
c0001f3b:	29 c2                	sub    %eax,%edx
c0001f3d:	89 d0                	mov    %edx,%eax
c0001f3f:	eb 11                	jmp    c0001f52 <partition+0x3f>
c0001f41:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f44:	83 e8 10             	sub    $0x10,%eax
c0001f47:	8d 50 3f             	lea    0x3f(%eax),%edx
c0001f4a:	85 c0                	test   %eax,%eax
c0001f4c:	0f 48 c2             	cmovs  %edx,%eax
c0001f4f:	c1 f8 06             	sar    $0x6,%eax
c0001f52:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001f55:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0001f59:	0f 85 cc 00 00 00    	jne    c000202b <partition+0x118>
c0001f5f:	83 ec 04             	sub    $0x4,%esp
c0001f62:	6a 40                	push   $0x40
c0001f64:	6a 00                	push   $0x0
c0001f66:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001f69:	50                   	push   %eax
c0001f6a:	e8 70 85 00 00       	call   c000a4df <Memset>
c0001f6f:	83 c4 10             	add    $0x10,%esp
c0001f72:	83 ec 04             	sub    $0x4,%esp
c0001f75:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001f78:	50                   	push   %eax
c0001f79:	6a 00                	push   $0x0
c0001f7b:	ff 75 e8             	pushl  -0x18(%ebp)
c0001f7e:	e8 b1 fe ff ff       	call   c0001e34 <get_partition_table>
c0001f83:	83 c4 10             	add    $0x10,%esp
c0001f86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001f8d:	e9 8a 00 00 00       	jmp    c000201c <partition+0x109>
c0001f92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f95:	83 c0 01             	add    $0x1,%eax
c0001f98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001f9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f9e:	c1 e0 04             	shl    $0x4,%eax
c0001fa1:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001fa4:	01 c8                	add    %ecx,%eax
c0001fa6:	83 e8 5c             	sub    $0x5c,%eax
c0001fa9:	8b 00                	mov    (%eax),%eax
c0001fab:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001fae:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001fb1:	c1 e1 03             	shl    $0x3,%ecx
c0001fb4:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001fba:	01 ca                	add    %ecx,%edx
c0001fbc:	81 c2 44 0f 01 c0    	add    $0xc0010f44,%edx
c0001fc2:	89 02                	mov    %eax,(%edx)
c0001fc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001fc7:	c1 e0 04             	shl    $0x4,%eax
c0001fca:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001fcd:	01 c8                	add    %ecx,%eax
c0001fcf:	83 e8 58             	sub    $0x58,%eax
c0001fd2:	8b 00                	mov    (%eax),%eax
c0001fd4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001fd7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001fda:	c1 e1 03             	shl    $0x3,%ecx
c0001fdd:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001fe3:	01 ca                	add    %ecx,%edx
c0001fe5:	81 c2 48 0f 01 c0    	add    $0xc0010f48,%edx
c0001feb:	89 02                	mov    %eax,(%edx)
c0001fed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ff0:	c1 e0 04             	shl    $0x4,%eax
c0001ff3:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ff6:	01 c8                	add    %ecx,%eax
c0001ff8:	83 e8 60             	sub    $0x60,%eax
c0001ffb:	0f b6 00             	movzbl (%eax),%eax
c0001ffe:	3c 05                	cmp    $0x5,%al
c0002000:	75 16                	jne    c0002018 <partition+0x105>
c0002002:	8b 55 08             	mov    0x8(%ebp),%edx
c0002005:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002008:	01 d0                	add    %edx,%eax
c000200a:	83 ec 08             	sub    $0x8,%esp
c000200d:	6a 01                	push   $0x1
c000200f:	50                   	push   %eax
c0002010:	e8 fe fe ff ff       	call   c0001f13 <partition>
c0002015:	83 c4 10             	add    $0x10,%esp
c0002018:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000201c:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002020:	0f 8e 6c ff ff ff    	jle    c0001f92 <partition+0x7f>
c0002026:	e9 ff 00 00 00       	jmp    c000212a <partition+0x217>
c000202b:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c000202f:	0f 85 f5 00 00 00    	jne    c000212a <partition+0x217>
c0002035:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002038:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000203d:	89 c8                	mov    %ecx,%eax
c000203f:	f7 ea                	imul   %edx
c0002041:	d1 fa                	sar    %edx
c0002043:	89 c8                	mov    %ecx,%eax
c0002045:	c1 f8 1f             	sar    $0x1f,%eax
c0002048:	29 c2                	sub    %eax,%edx
c000204a:	89 d0                	mov    %edx,%eax
c000204c:	c1 e0 02             	shl    $0x2,%eax
c000204f:	01 d0                	add    %edx,%eax
c0002051:	29 c1                	sub    %eax,%ecx
c0002053:	89 c8                	mov    %ecx,%eax
c0002055:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002058:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000205b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000205e:	c1 e2 03             	shl    $0x3,%edx
c0002061:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002067:	01 d0                	add    %edx,%eax
c0002069:	05 44 0f 01 c0       	add    $0xc0010f44,%eax
c000206e:	8b 00                	mov    (%eax),%eax
c0002070:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002073:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002076:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002079:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000207c:	83 e8 01             	sub    $0x1,%eax
c000207f:	c1 e0 04             	shl    $0x4,%eax
c0002082:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002085:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000208c:	e9 8c 00 00 00       	jmp    c000211d <partition+0x20a>
c0002091:	83 ec 04             	sub    $0x4,%esp
c0002094:	6a 40                	push   $0x40
c0002096:	6a 00                	push   $0x0
c0002098:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000209b:	50                   	push   %eax
c000209c:	e8 3e 84 00 00       	call   c000a4df <Memset>
c00020a1:	83 c4 10             	add    $0x10,%esp
c00020a4:	83 ec 04             	sub    $0x4,%esp
c00020a7:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00020aa:	50                   	push   %eax
c00020ab:	ff 75 f0             	pushl  -0x10(%ebp)
c00020ae:	ff 75 e8             	pushl  -0x18(%ebp)
c00020b1:	e8 7e fd ff ff       	call   c0001e34 <get_partition_table>
c00020b6:	83 c4 10             	add    $0x10,%esp
c00020b9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00020bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00020bf:	01 d0                	add    %edx,%eax
c00020c1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00020c4:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00020c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00020ca:	01 c2                	add    %eax,%edx
c00020cc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00020cf:	8d 48 04             	lea    0x4(%eax),%ecx
c00020d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00020d5:	c1 e1 03             	shl    $0x3,%ecx
c00020d8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00020de:	01 c8                	add    %ecx,%eax
c00020e0:	05 44 0f 01 c0       	add    $0xc0010f44,%eax
c00020e5:	89 10                	mov    %edx,(%eax)
c00020e7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00020ea:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00020ed:	8d 4a 04             	lea    0x4(%edx),%ecx
c00020f0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00020f3:	c1 e1 03             	shl    $0x3,%ecx
c00020f6:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00020fc:	01 ca                	add    %ecx,%edx
c00020fe:	81 c2 48 0f 01 c0    	add    $0xc0010f48,%edx
c0002104:	89 02                	mov    %eax,(%edx)
c0002106:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c000210a:	84 c0                	test   %al,%al
c000210c:	74 1b                	je     c0002129 <partition+0x216>
c000210e:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0002111:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002114:	01 d0                	add    %edx,%eax
c0002116:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002119:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000211d:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0002121:	0f 8e 6a ff ff ff    	jle    c0002091 <partition+0x17e>
c0002127:	eb 01                	jmp    c000212a <partition+0x217>
c0002129:	90                   	nop
c000212a:	90                   	nop
c000212b:	c9                   	leave  
c000212c:	c3                   	ret    

c000212d <hd_open>:
c000212d:	55                   	push   %ebp
c000212e:	89 e5                	mov    %esp,%ebp
c0002130:	83 ec 18             	sub    $0x18,%esp
c0002133:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000213a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000213d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002143:	05 40 0f 01 c0       	add    $0xc0010f40,%eax
c0002148:	8b 00                	mov    (%eax),%eax
c000214a:	8d 50 01             	lea    0x1(%eax),%edx
c000214d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002150:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002156:	05 40 0f 01 c0       	add    $0xc0010f40,%eax
c000215b:	89 10                	mov    %edx,(%eax)
c000215d:	83 ec 0c             	sub    $0xc,%esp
c0002160:	6a 00                	push   $0x0
c0002162:	e8 1c fa ff ff       	call   c0001b83 <hd_identify>
c0002167:	83 c4 10             	add    $0x10,%esp
c000216a:	83 ec 08             	sub    $0x8,%esp
c000216d:	6a 00                	push   $0x0
c000216f:	6a 00                	push   $0x0
c0002171:	e8 9d fd ff ff       	call   c0001f13 <partition>
c0002176:	83 c4 10             	add    $0x10,%esp
c0002179:	90                   	nop
c000217a:	c9                   	leave  
c000217b:	c3                   	ret    

c000217c <get_hd_ioctl>:
c000217c:	55                   	push   %ebp
c000217d:	89 e5                	mov    %esp,%ebp
c000217f:	83 ec 10             	sub    $0x10,%esp
c0002182:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002186:	7f 19                	jg     c00021a1 <get_hd_ioctl+0x25>
c0002188:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000218b:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002190:	89 c8                	mov    %ecx,%eax
c0002192:	f7 ea                	imul   %edx
c0002194:	d1 fa                	sar    %edx
c0002196:	89 c8                	mov    %ecx,%eax
c0002198:	c1 f8 1f             	sar    $0x1f,%eax
c000219b:	29 c2                	sub    %eax,%edx
c000219d:	89 d0                	mov    %edx,%eax
c000219f:	eb 11                	jmp    c00021b2 <get_hd_ioctl+0x36>
c00021a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00021a4:	83 e8 10             	sub    $0x10,%eax
c00021a7:	8d 50 3f             	lea    0x3f(%eax),%edx
c00021aa:	85 c0                	test   %eax,%eax
c00021ac:	0f 48 c2             	cmovs  %edx,%eax
c00021af:	c1 f8 06             	sar    $0x6,%eax
c00021b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00021b5:	8b 55 08             	mov    0x8(%ebp),%edx
c00021b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00021bb:	c1 e2 03             	shl    $0x3,%edx
c00021be:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021c4:	01 d0                	add    %edx,%eax
c00021c6:	05 48 0f 01 c0       	add    $0xc0010f48,%eax
c00021cb:	8b 00                	mov    (%eax),%eax
c00021cd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00021d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00021d3:	c9                   	leave  
c00021d4:	c3                   	ret    

c00021d5 <wait_for>:
c00021d5:	55                   	push   %ebp
c00021d6:	89 e5                	mov    %esp,%ebp
c00021d8:	83 ec 08             	sub    $0x8,%esp
c00021db:	83 ec 04             	sub    $0x4,%esp
c00021de:	68 40 42 0f 00       	push   $0xf4240
c00021e3:	6a 08                	push   $0x8
c00021e5:	6a 08                	push   $0x8
c00021e7:	e8 97 02 00 00       	call   c0002483 <waitfor>
c00021ec:	83 c4 10             	add    $0x10,%esp
c00021ef:	85 c0                	test   %eax,%eax
c00021f1:	75 10                	jne    c0002203 <wait_for+0x2e>
c00021f3:	83 ec 0c             	sub    $0xc,%esp
c00021f6:	68 09 9a 00 c0       	push   $0xc0009a09
c00021fb:	e8 34 68 00 00       	call   c0008a34 <panic>
c0002200:	83 c4 10             	add    $0x10,%esp
c0002203:	90                   	nop
c0002204:	c9                   	leave  
c0002205:	c3                   	ret    

c0002206 <interrupt_wait>:
c0002206:	55                   	push   %ebp
c0002207:	89 e5                	mov    %esp,%ebp
c0002209:	83 ec 78             	sub    $0x78,%esp
c000220c:	83 ec 04             	sub    $0x4,%esp
c000220f:	68 13 02 00 00       	push   $0x213
c0002214:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0002217:	50                   	push   %eax
c0002218:	6a 02                	push   $0x2
c000221a:	e8 ab 70 00 00       	call   c00092ca <send_rec>
c000221f:	83 c4 10             	add    $0x10,%esp
c0002222:	90                   	nop
c0002223:	c9                   	leave  
c0002224:	c3                   	ret    

c0002225 <hd_rdwt>:
c0002225:	55                   	push   %ebp
c0002226:	89 e5                	mov    %esp,%ebp
c0002228:	83 ec 48             	sub    $0x48,%esp
c000222b:	8b 45 08             	mov    0x8(%ebp),%eax
c000222e:	8b 40 18             	mov    0x18(%eax),%eax
c0002231:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002234:	8b 45 08             	mov    0x8(%ebp),%eax
c0002237:	8b 40 14             	mov    0x14(%eax),%eax
c000223a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000223d:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002241:	7f 19                	jg     c000225c <hd_rdwt+0x37>
c0002243:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002246:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000224b:	89 c8                	mov    %ecx,%eax
c000224d:	f7 ea                	imul   %edx
c000224f:	d1 fa                	sar    %edx
c0002251:	89 c8                	mov    %ecx,%eax
c0002253:	c1 f8 1f             	sar    $0x1f,%eax
c0002256:	29 c2                	sub    %eax,%edx
c0002258:	89 d0                	mov    %edx,%eax
c000225a:	eb 11                	jmp    c000226d <hd_rdwt+0x48>
c000225c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000225f:	83 e8 10             	sub    $0x10,%eax
c0002262:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002265:	85 c0                	test   %eax,%eax
c0002267:	0f 48 c2             	cmovs  %edx,%eax
c000226a:	c1 f8 06             	sar    $0x6,%eax
c000226d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002270:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002273:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002276:	89 d0                	mov    %edx,%eax
c0002278:	c1 f8 1f             	sar    $0x1f,%eax
c000227b:	c1 e8 1a             	shr    $0x1a,%eax
c000227e:	01 c2                	add    %eax,%edx
c0002280:	83 e2 3f             	and    $0x3f,%edx
c0002283:	29 c2                	sub    %eax,%edx
c0002285:	89 d0                	mov    %edx,%eax
c0002287:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000228a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000228d:	c1 e8 09             	shr    $0x9,%eax
c0002290:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002293:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002297:	7f 1a                	jg     c00022b3 <hd_rdwt+0x8e>
c0002299:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000229c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000229f:	c1 e2 03             	shl    $0x3,%edx
c00022a2:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022a8:	01 d0                	add    %edx,%eax
c00022aa:	05 44 0f 01 c0       	add    $0xc0010f44,%eax
c00022af:	8b 00                	mov    (%eax),%eax
c00022b1:	eb 1b                	jmp    c00022ce <hd_rdwt+0xa9>
c00022b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022b6:	8d 50 04             	lea    0x4(%eax),%edx
c00022b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00022bc:	c1 e2 03             	shl    $0x3,%edx
c00022bf:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022c5:	01 d0                	add    %edx,%eax
c00022c7:	05 44 0f 01 c0       	add    $0xc0010f44,%eax
c00022cc:	8b 00                	mov    (%eax),%eax
c00022ce:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00022d1:	01 d0                	add    %edx,%eax
c00022d3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00022d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00022d9:	8b 40 0c             	mov    0xc(%eax),%eax
c00022dc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00022df:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00022e2:	05 ff 01 00 00       	add    $0x1ff,%eax
c00022e7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00022ed:	85 c0                	test   %eax,%eax
c00022ef:	0f 48 c2             	cmovs  %edx,%eax
c00022f2:	c1 f8 09             	sar    $0x9,%eax
c00022f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00022f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00022fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00022fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0002301:	8b 40 10             	mov    0x10(%eax),%eax
c0002304:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002307:	8b 45 08             	mov    0x8(%ebp),%eax
c000230a:	8b 00                	mov    (%eax),%eax
c000230c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000230f:	83 ec 08             	sub    $0x8,%esp
c0002312:	ff 75 d0             	pushl  -0x30(%ebp)
c0002315:	ff 75 cc             	pushl  -0x34(%ebp)
c0002318:	e8 c1 24 00 00       	call   c00047de <v2l>
c000231d:	83 c4 10             	add    $0x10,%esp
c0002320:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002323:	8b 45 08             	mov    0x8(%ebp),%eax
c0002326:	8b 40 68             	mov    0x68(%eax),%eax
c0002329:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000232c:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002330:	74 22                	je     c0002354 <hd_rdwt+0x12f>
c0002332:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002336:	74 1c                	je     c0002354 <hd_rdwt+0x12f>
c0002338:	68 9f 01 00 00       	push   $0x19f
c000233d:	68 1b 9a 00 c0       	push   $0xc0009a1b
c0002342:	68 1b 9a 00 c0       	push   $0xc0009a1b
c0002347:	68 23 9a 00 c0       	push   $0xc0009a23
c000234c:	e8 01 67 00 00       	call   c0008a52 <assertion_failure>
c0002351:	83 c4 10             	add    $0x10,%esp
c0002354:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0002358:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000235b:	88 45 be             	mov    %al,-0x42(%ebp)
c000235e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002361:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002364:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002367:	c1 f8 08             	sar    $0x8,%eax
c000236a:	88 45 c0             	mov    %al,-0x40(%ebp)
c000236d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002370:	c1 f8 10             	sar    $0x10,%eax
c0002373:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002376:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002379:	c1 f8 18             	sar    $0x18,%eax
c000237c:	83 e0 0f             	and    $0xf,%eax
c000237f:	83 c8 e0             	or     $0xffffffe0,%eax
c0002382:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002385:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002389:	75 07                	jne    c0002392 <hd_rdwt+0x16d>
c000238b:	b8 20 00 00 00       	mov    $0x20,%eax
c0002390:	eb 05                	jmp    c0002397 <hd_rdwt+0x172>
c0002392:	b8 30 00 00 00       	mov    $0x30,%eax
c0002397:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000239a:	83 ec 0c             	sub    $0xc,%esp
c000239d:	8d 45 bd             	lea    -0x43(%ebp),%eax
c00023a0:	50                   	push   %eax
c00023a1:	e8 db f6 ff ff       	call   c0001a81 <hd_cmd_out>
c00023a6:	83 c4 10             	add    $0x10,%esp
c00023a9:	e9 9c 00 00 00       	jmp    c000244a <hd_rdwt+0x225>
c00023ae:	b8 00 02 00 00       	mov    $0x200,%eax
c00023b3:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00023ba:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00023be:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00023c1:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00023c5:	75 51                	jne    c0002418 <hd_rdwt+0x1f3>
c00023c7:	e8 09 fe ff ff       	call   c00021d5 <wait_for>
c00023cc:	e8 35 fe ff ff       	call   c0002206 <interrupt_wait>
c00023d1:	83 ec 04             	sub    $0x4,%esp
c00023d4:	ff 75 c4             	pushl  -0x3c(%ebp)
c00023d7:	6a 00                	push   $0x0
c00023d9:	68 80 11 01 c0       	push   $0xc0011180
c00023de:	e8 fc 80 00 00       	call   c000a4df <Memset>
c00023e3:	83 c4 10             	add    $0x10,%esp
c00023e6:	83 ec 04             	sub    $0x4,%esp
c00023e9:	68 00 02 00 00       	push   $0x200
c00023ee:	68 80 11 01 c0       	push   $0xc0011180
c00023f3:	68 f0 01 00 00       	push   $0x1f0
c00023f8:	e8 36 81 00 00       	call   c000a533 <read_port>
c00023fd:	83 c4 10             	add    $0x10,%esp
c0002400:	83 ec 04             	sub    $0x4,%esp
c0002403:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002406:	68 80 11 01 c0       	push   $0xc0011180
c000240b:	ff 75 f0             	pushl  -0x10(%ebp)
c000240e:	e8 9e 80 00 00       	call   c000a4b1 <Memcpy>
c0002413:	83 c4 10             	add    $0x10,%esp
c0002416:	eb 26                	jmp    c000243e <hd_rdwt+0x219>
c0002418:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000241c:	75 20                	jne    c000243e <hd_rdwt+0x219>
c000241e:	e8 b2 fd ff ff       	call   c00021d5 <wait_for>
c0002423:	83 ec 04             	sub    $0x4,%esp
c0002426:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002429:	ff 75 f0             	pushl  -0x10(%ebp)
c000242c:	68 f0 01 00 00       	push   $0x1f0
c0002431:	e8 11 81 00 00       	call   c000a547 <write_port>
c0002436:	83 c4 10             	add    $0x10,%esp
c0002439:	e8 c8 fd ff ff       	call   c0002206 <interrupt_wait>
c000243e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002441:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002444:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002447:	01 45 f0             	add    %eax,-0x10(%ebp)
c000244a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000244e:	0f 85 5a ff ff ff    	jne    c00023ae <hd_rdwt+0x189>
c0002454:	90                   	nop
c0002455:	c9                   	leave  
c0002456:	c3                   	ret    

c0002457 <hd_handler>:
c0002457:	55                   	push   %ebp
c0002458:	89 e5                	mov    %esp,%ebp
c000245a:	83 ec 18             	sub    $0x18,%esp
c000245d:	83 ec 0c             	sub    $0xc,%esp
c0002460:	68 f7 01 00 00       	push   $0x1f7
c0002465:	e8 26 f3 ff ff       	call   c0001790 <in_byte>
c000246a:	83 c4 10             	add    $0x10,%esp
c000246d:	0f b6 c0             	movzbl %al,%eax
c0002470:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002473:	83 ec 0c             	sub    $0xc,%esp
c0002476:	6a 02                	push   $0x2
c0002478:	e8 83 70 00 00       	call   c0009500 <inform_int>
c000247d:	83 c4 10             	add    $0x10,%esp
c0002480:	90                   	nop
c0002481:	c9                   	leave  
c0002482:	c3                   	ret    

c0002483 <waitfor>:
c0002483:	55                   	push   %ebp
c0002484:	89 e5                	mov    %esp,%ebp
c0002486:	83 ec 18             	sub    $0x18,%esp
c0002489:	e8 6b 6f 00 00       	call   c00093f9 <get_ticks_ipc>
c000248e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002491:	eb 22                	jmp    c00024b5 <waitfor+0x32>
c0002493:	83 ec 0c             	sub    $0xc,%esp
c0002496:	68 f7 01 00 00       	push   $0x1f7
c000249b:	e8 f0 f2 ff ff       	call   c0001790 <in_byte>
c00024a0:	83 c4 10             	add    $0x10,%esp
c00024a3:	0f b6 c0             	movzbl %al,%eax
c00024a6:	23 45 08             	and    0x8(%ebp),%eax
c00024a9:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00024ac:	75 07                	jne    c00024b5 <waitfor+0x32>
c00024ae:	b8 01 00 00 00       	mov    $0x1,%eax
c00024b3:	eb 1d                	jmp    c00024d2 <waitfor+0x4f>
c00024b5:	e8 3f 6f 00 00       	call   c00093f9 <get_ticks_ipc>
c00024ba:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00024bd:	89 c2                	mov    %eax,%edx
c00024bf:	89 d0                	mov    %edx,%eax
c00024c1:	c1 e0 02             	shl    $0x2,%eax
c00024c4:	01 d0                	add    %edx,%eax
c00024c6:	01 c0                	add    %eax,%eax
c00024c8:	39 45 10             	cmp    %eax,0x10(%ebp)
c00024cb:	7f c6                	jg     c0002493 <waitfor+0x10>
c00024cd:	b8 00 00 00 00       	mov    $0x0,%eax
c00024d2:	c9                   	leave  
c00024d3:	c3                   	ret    

c00024d4 <print_hd_info>:
c00024d4:	55                   	push   %ebp
c00024d5:	89 e5                	mov    %esp,%ebp
c00024d7:	83 ec 18             	sub    $0x18,%esp
c00024da:	83 ec 0c             	sub    $0xc,%esp
c00024dd:	68 41 9a 00 c0       	push   $0xc0009a41
c00024e2:	e8 1b 62 00 00       	call   c0008702 <Printf>
c00024e7:	83 c4 10             	add    $0x10,%esp
c00024ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00024f1:	eb 3b                	jmp    c000252e <print_hd_info+0x5a>
c00024f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024f6:	8b 04 c5 48 0f 01 c0 	mov    -0x3ffef0b8(,%eax,8),%eax
c00024fd:	85 c0                	test   %eax,%eax
c00024ff:	74 28                	je     c0002529 <print_hd_info+0x55>
c0002501:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002504:	8b 14 c5 48 0f 01 c0 	mov    -0x3ffef0b8(,%eax,8),%edx
c000250b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000250e:	8b 04 c5 44 0f 01 c0 	mov    -0x3ffef0bc(,%eax,8),%eax
c0002515:	ff 75 f4             	pushl  -0xc(%ebp)
c0002518:	52                   	push   %edx
c0002519:	50                   	push   %eax
c000251a:	68 5e 9a 00 c0       	push   $0xc0009a5e
c000251f:	e8 de 61 00 00       	call   c0008702 <Printf>
c0002524:	83 c4 10             	add    $0x10,%esp
c0002527:	eb 01                	jmp    c000252a <print_hd_info+0x56>
c0002529:	90                   	nop
c000252a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000252e:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002532:	7e bf                	jle    c00024f3 <print_hd_info+0x1f>
c0002534:	83 ec 0c             	sub    $0xc,%esp
c0002537:	68 76 9a 00 c0       	push   $0xc0009a76
c000253c:	e8 c1 61 00 00       	call   c0008702 <Printf>
c0002541:	83 c4 10             	add    $0x10,%esp
c0002544:	83 ec 0c             	sub    $0xc,%esp
c0002547:	68 91 9a 00 c0       	push   $0xc0009a91
c000254c:	e8 b1 61 00 00       	call   c0008702 <Printf>
c0002551:	83 c4 10             	add    $0x10,%esp
c0002554:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c000255b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002562:	eb 44                	jmp    c00025a8 <print_hd_info+0xd4>
c0002564:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002567:	83 c0 04             	add    $0x4,%eax
c000256a:	8b 04 c5 48 0f 01 c0 	mov    -0x3ffef0b8(,%eax,8),%eax
c0002571:	85 c0                	test   %eax,%eax
c0002573:	74 2e                	je     c00025a3 <print_hd_info+0xcf>
c0002575:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002578:	83 c0 04             	add    $0x4,%eax
c000257b:	8b 14 c5 48 0f 01 c0 	mov    -0x3ffef0b8(,%eax,8),%edx
c0002582:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002585:	83 c0 04             	add    $0x4,%eax
c0002588:	8b 04 c5 44 0f 01 c0 	mov    -0x3ffef0bc(,%eax,8),%eax
c000258f:	ff 75 f0             	pushl  -0x10(%ebp)
c0002592:	52                   	push   %edx
c0002593:	50                   	push   %eax
c0002594:	68 5e 9a 00 c0       	push   $0xc0009a5e
c0002599:	e8 64 61 00 00       	call   c0008702 <Printf>
c000259e:	83 c4 10             	add    $0x10,%esp
c00025a1:	eb 01                	jmp    c00025a4 <print_hd_info+0xd0>
c00025a3:	90                   	nop
c00025a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00025a8:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00025ac:	7e b6                	jle    c0002564 <print_hd_info+0x90>
c00025ae:	83 ec 0c             	sub    $0xc,%esp
c00025b1:	68 ae 9a 00 c0       	push   $0xc0009aae
c00025b6:	e8 47 61 00 00       	call   c0008702 <Printf>
c00025bb:	83 c4 10             	add    $0x10,%esp
c00025be:	90                   	nop
c00025bf:	c9                   	leave  
c00025c0:	c3                   	ret    

c00025c1 <is_empty>:
c00025c1:	55                   	push   %ebp
c00025c2:	89 e5                	mov    %esp,%ebp
c00025c4:	83 ec 10             	sub    $0x10,%esp
c00025c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00025ce:	eb 1a                	jmp    c00025ea <is_empty+0x29>
c00025d0:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00025d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00025d6:	01 d0                	add    %edx,%eax
c00025d8:	0f b6 00             	movzbl (%eax),%eax
c00025db:	84 c0                	test   %al,%al
c00025dd:	74 07                	je     c00025e6 <is_empty+0x25>
c00025df:	b8 00 00 00 00       	mov    $0x0,%eax
c00025e4:	eb 11                	jmp    c00025f7 <is_empty+0x36>
c00025e6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00025ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00025ed:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00025f0:	7c de                	jl     c00025d0 <is_empty+0xf>
c00025f2:	b8 01 00 00 00       	mov    $0x1,%eax
c00025f7:	c9                   	leave  
c00025f8:	c3                   	ret    
c00025f9:	66 90                	xchg   %ax,%ax
c00025fb:	66 90                	xchg   %ax,%ax
c00025fd:	66 90                	xchg   %ax,%ax
c00025ff:	90                   	nop

c0002600 <get_ticks>:
c0002600:	b8 00 00 00 00       	mov    $0x0,%eax
c0002605:	cd 90                	int    $0x90
c0002607:	c3                   	ret    

c0002608 <write2>:
c0002608:	b8 01 00 00 00       	mov    $0x1,%eax
c000260d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002611:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002615:	cd 90                	int    $0x90
c0002617:	c3                   	ret    

c0002618 <write_debug>:
c0002618:	b8 02 00 00 00       	mov    $0x2,%eax
c000261d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002621:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002625:	cd 90                	int    $0x90
c0002627:	c3                   	ret    

c0002628 <send_msg2>:
c0002628:	b8 03 00 00 00       	mov    $0x3,%eax
c000262d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002631:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002635:	cd 90                	int    $0x90
c0002637:	c3                   	ret    

c0002638 <send_msg>:
c0002638:	55                   	push   %ebp
c0002639:	89 e5                	mov    %esp,%ebp
c000263b:	53                   	push   %ebx
c000263c:	51                   	push   %ecx
c000263d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002642:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002645:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002648:	cd 90                	int    $0x90
c000264a:	59                   	pop    %ecx
c000264b:	5b                   	pop    %ebx
c000264c:	5d                   	pop    %ebp
c000264d:	c3                   	ret    

c000264e <receive_msg2>:
c000264e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002653:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002657:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000265b:	cd 90                	int    $0x90
c000265d:	c3                   	ret    

c000265e <receive_msg>:
c000265e:	55                   	push   %ebp
c000265f:	89 e5                	mov    %esp,%ebp
c0002661:	53                   	push   %ebx
c0002662:	51                   	push   %ecx
c0002663:	b8 04 00 00 00       	mov    $0x4,%eax
c0002668:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000266b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000266e:	cd 90                	int    $0x90
c0002670:	59                   	pop    %ecx
c0002671:	5b                   	pop    %ebx
c0002672:	5d                   	pop    %ebp
c0002673:	c3                   	ret    

c0002674 <task_fs>:
c0002674:	55                   	push   %ebp
c0002675:	89 e5                	mov    %esp,%ebp
c0002677:	81 ec 08 01 00 00    	sub    $0x108,%esp
c000267d:	e8 91 07 00 00       	call   c0002e13 <init_fs>
c0002682:	83 ec 04             	sub    $0x4,%esp
c0002685:	6a 6c                	push   $0x6c
c0002687:	6a 00                	push   $0x0
c0002689:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c000268f:	50                   	push   %eax
c0002690:	e8 4a 7e 00 00       	call   c000a4df <Memset>
c0002695:	83 c4 10             	add    $0x10,%esp
c0002698:	83 ec 04             	sub    $0x4,%esp
c000269b:	6a 0e                	push   $0xe
c000269d:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c00026a3:	50                   	push   %eax
c00026a4:	6a 02                	push   $0x2
c00026a6:	e8 1f 6c 00 00       	call   c00092ca <send_rec>
c00026ab:	83 c4 10             	add    $0x10,%esp
c00026ae:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00026b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00026b7:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c00026bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00026c0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c00026c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00026c9:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c00026cf:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00026d2:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c00026d8:	85 c0                	test   %eax,%eax
c00026da:	75 07                	jne    c00026e3 <task_fs+0x6f>
c00026dc:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c00026e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00026e6:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c00026ec:	05 c0 21 08 c0       	add    $0xc00821c0,%eax
c00026f1:	a3 84 eb 00 c0       	mov    %eax,0xc000eb84
c00026f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00026fd:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002701:	74 1c                	je     c000271f <task_fs+0xab>
c0002703:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002707:	7f 08                	jg     c0002711 <task_fs+0x9d>
c0002709:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c000270d:	74 3e                	je     c000274d <task_fs+0xd9>
c000270f:	eb 4b                	jmp    c000275c <task_fs+0xe8>
c0002711:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002715:	74 1f                	je     c0002736 <task_fs+0xc2>
c0002717:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c000271b:	74 19                	je     c0002736 <task_fs+0xc2>
c000271d:	eb 3d                	jmp    c000275c <task_fs+0xe8>
c000271f:	83 ec 0c             	sub    $0xc,%esp
c0002722:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0002728:	50                   	push   %eax
c0002729:	e8 14 07 00 00       	call   c0002e42 <do_open>
c000272e:	83 c4 10             	add    $0x10,%esp
c0002731:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0002734:	eb 26                	jmp    c000275c <task_fs+0xe8>
c0002736:	83 ec 0c             	sub    $0xc,%esp
c0002739:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c000273f:	50                   	push   %eax
c0002740:	e8 3b 18 00 00       	call   c0003f80 <do_rdwt>
c0002745:	83 c4 10             	add    $0x10,%esp
c0002748:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000274b:	eb 0f                	jmp    c000275c <task_fs+0xe8>
c000274d:	83 ec 0c             	sub    $0xc,%esp
c0002750:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002753:	e8 2d 1d 00 00       	call   c0004485 <do_close>
c0002758:	83 c4 10             	add    $0x10,%esp
c000275b:	90                   	nop
c000275c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0002762:	83 f8 67             	cmp    $0x67,%eax
c0002765:	74 36                	je     c000279d <task_fs+0x129>
c0002767:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000276a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000276d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002771:	75 06                	jne    c0002779 <task_fs+0x105>
c0002773:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002776:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002779:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
c0002780:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002783:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0002786:	83 ec 04             	sub    $0x4,%esp
c0002789:	ff 75 f0             	pushl  -0x10(%ebp)
c000278c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0002792:	50                   	push   %eax
c0002793:	6a 01                	push   $0x1
c0002795:	e8 30 6b 00 00       	call   c00092ca <send_rec>
c000279a:	83 c4 10             	add    $0x10,%esp
c000279d:	a1 20 e7 00 c0       	mov    0xc000e720,%eax
c00027a2:	83 c0 01             	add    $0x1,%eax
c00027a5:	a3 20 e7 00 c0       	mov    %eax,0xc000e720
c00027aa:	e9 d3 fe ff ff       	jmp    c0002682 <task_fs+0xe>

c00027af <rd_wt>:
c00027af:	55                   	push   %ebp
c00027b0:	89 e5                	mov    %esp,%ebp
c00027b2:	83 ec 78             	sub    $0x78,%esp
c00027b5:	83 ec 04             	sub    $0x4,%esp
c00027b8:	6a 6c                	push   $0x6c
c00027ba:	6a 00                	push   $0x0
c00027bc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00027bf:	50                   	push   %eax
c00027c0:	e8 1a 7d 00 00       	call   c000a4df <Memset>
c00027c5:	83 c4 10             	add    $0x10,%esp
c00027c8:	8b 45 18             	mov    0x18(%ebp),%eax
c00027cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00027ce:	8b 45 0c             	mov    0xc(%ebp),%eax
c00027d1:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00027d4:	8b 45 10             	mov    0x10(%ebp),%eax
c00027d7:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00027da:	8b 45 14             	mov    0x14(%ebp),%eax
c00027dd:	89 45 98             	mov    %eax,-0x68(%ebp)
c00027e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00027e3:	c1 e0 09             	shl    $0x9,%eax
c00027e6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00027e9:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c00027ed:	74 22                	je     c0002811 <rd_wt+0x62>
c00027ef:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c00027f3:	74 1c                	je     c0002811 <rd_wt+0x62>
c00027f5:	68 d1 00 00 00       	push   $0xd1
c00027fa:	68 d0 9a 00 c0       	push   $0xc0009ad0
c00027ff:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0002804:	68 dd 9a 00 c0       	push   $0xc0009add
c0002809:	e8 44 62 00 00       	call   c0008a52 <assertion_failure>
c000280e:	83 c4 10             	add    $0x10,%esp
c0002811:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002814:	83 f8 07             	cmp    $0x7,%eax
c0002817:	74 24                	je     c000283d <rd_wt+0x8e>
c0002819:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000281c:	83 f8 0a             	cmp    $0xa,%eax
c000281f:	74 1c                	je     c000283d <rd_wt+0x8e>
c0002821:	68 d2 00 00 00       	push   $0xd2
c0002826:	68 d0 9a 00 c0       	push   $0xc0009ad0
c000282b:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0002830:	68 fc 9a 00 c0       	push   $0xc0009afc
c0002835:	e8 18 62 00 00       	call   c0008a52 <assertion_failure>
c000283a:	83 c4 10             	add    $0x10,%esp
c000283d:	83 ec 04             	sub    $0x4,%esp
c0002840:	6a 02                	push   $0x2
c0002842:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0002845:	50                   	push   %eax
c0002846:	6a 03                	push   $0x3
c0002848:	e8 7d 6a 00 00       	call   c00092ca <send_rec>
c000284d:	83 c4 10             	add    $0x10,%esp
c0002850:	90                   	nop
c0002851:	c9                   	leave  
c0002852:	c3                   	ret    

c0002853 <mkfs>:
c0002853:	55                   	push   %ebp
c0002854:	89 e5                	mov    %esp,%ebp
c0002856:	57                   	push   %edi
c0002857:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c000285d:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002862:	83 ec 04             	sub    $0x4,%esp
c0002865:	68 00 02 00 00       	push   $0x200
c000286a:	6a 00                	push   $0x0
c000286c:	50                   	push   %eax
c000286d:	e8 6d 7c 00 00       	call   c000a4df <Memset>
c0002872:	83 c4 10             	add    $0x10,%esp
c0002875:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000287a:	83 ec 0c             	sub    $0xc,%esp
c000287d:	6a 0a                	push   $0xa
c000287f:	68 00 02 00 00       	push   $0x200
c0002884:	50                   	push   %eax
c0002885:	6a 20                	push   $0x20
c0002887:	6a 00                	push   $0x0
c0002889:	e8 21 ff ff ff       	call   c00027af <rd_wt>
c000288e:	83 c4 20             	add    $0x20,%esp
c0002891:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002896:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002899:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000289c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00028a3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028a6:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c00028ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028b0:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c00028b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028ba:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c00028c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028c4:	8b 40 04             	mov    0x4(%eax),%eax
c00028c7:	8d 50 02             	lea    0x2(%eax),%edx
c00028ca:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028cd:	8b 40 08             	mov    0x8(%eax),%eax
c00028d0:	01 c2                	add    %eax,%edx
c00028d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028d5:	8b 40 0c             	mov    0xc(%eax),%eax
c00028d8:	01 c2                	add    %eax,%edx
c00028da:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028dd:	89 10                	mov    %edx,(%eax)
c00028df:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00028e6:	b8 00 02 00 00       	mov    $0x200,%eax
c00028eb:	2b 45 d8             	sub    -0x28(%ebp),%eax
c00028ee:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c00028f4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00028f7:	01 ca                	add    %ecx,%edx
c00028f9:	83 ec 04             	sub    $0x4,%esp
c00028fc:	50                   	push   %eax
c00028fd:	6a 80                	push   $0xffffff80
c00028ff:	52                   	push   %edx
c0002900:	e8 da 7b 00 00       	call   c000a4df <Memset>
c0002905:	83 c4 10             	add    $0x10,%esp
c0002908:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000290d:	83 ec 0c             	sub    $0xc,%esp
c0002910:	6a 0a                	push   $0xa
c0002912:	68 00 02 00 00       	push   $0x200
c0002917:	50                   	push   %eax
c0002918:	6a 20                	push   $0x20
c000291a:	6a 01                	push   $0x1
c000291c:	e8 8e fe ff ff       	call   c00027af <rd_wt>
c0002921:	83 c4 20             	add    $0x20,%esp
c0002924:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002927:	8b 10                	mov    (%eax),%edx
c0002929:	89 55 98             	mov    %edx,-0x68(%ebp)
c000292c:	8b 50 04             	mov    0x4(%eax),%edx
c000292f:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002932:	8b 50 08             	mov    0x8(%eax),%edx
c0002935:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002938:	8b 50 0c             	mov    0xc(%eax),%edx
c000293b:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c000293e:	8b 50 10             	mov    0x10(%eax),%edx
c0002941:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002944:	8b 50 14             	mov    0x14(%eax),%edx
c0002947:	89 55 ac             	mov    %edx,-0x54(%ebp)
c000294a:	8b 50 18             	mov    0x18(%eax),%edx
c000294d:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002950:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002953:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002956:	8b 40 20             	mov    0x20(%eax),%eax
c0002959:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000295c:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002960:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002964:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002969:	83 ec 04             	sub    $0x4,%esp
c000296c:	6a 01                	push   $0x1
c000296e:	52                   	push   %edx
c000296f:	50                   	push   %eax
c0002970:	e8 6a 7b 00 00       	call   c000a4df <Memset>
c0002975:	83 c4 10             	add    $0x10,%esp
c0002978:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000297d:	83 c0 01             	add    $0x1,%eax
c0002980:	83 ec 04             	sub    $0x4,%esp
c0002983:	68 ff 01 00 00       	push   $0x1ff
c0002988:	6a 80                	push   $0xffffff80
c000298a:	50                   	push   %eax
c000298b:	e8 4f 7b 00 00       	call   c000a4df <Memset>
c0002990:	83 c4 10             	add    $0x10,%esp
c0002993:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002998:	83 ec 0c             	sub    $0xc,%esp
c000299b:	6a 0a                	push   $0xa
c000299d:	68 00 02 00 00       	push   $0x200
c00029a2:	50                   	push   %eax
c00029a3:	6a 20                	push   $0x20
c00029a5:	6a 02                	push   $0x2
c00029a7:	e8 03 fe ff ff       	call   c00027af <rd_wt>
c00029ac:	83 c4 20             	add    $0x20,%esp
c00029af:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c00029b6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00029bb:	83 ec 04             	sub    $0x4,%esp
c00029be:	68 00 02 00 00       	push   $0x200
c00029c3:	6a ff                	push   $0xffffffff
c00029c5:	50                   	push   %eax
c00029c6:	e8 14 7b 00 00       	call   c000a4df <Memset>
c00029cb:	83 c4 10             	add    $0x10,%esp
c00029ce:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00029d3:	83 ec 0c             	sub    $0xc,%esp
c00029d6:	6a 0a                	push   $0xa
c00029d8:	68 00 02 00 00       	push   $0x200
c00029dd:	50                   	push   %eax
c00029de:	6a 20                	push   $0x20
c00029e0:	ff 75 d0             	pushl  -0x30(%ebp)
c00029e3:	e8 c7 fd ff ff       	call   c00027af <rd_wt>
c00029e8:	83 c4 20             	add    $0x20,%esp
c00029eb:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00029f0:	83 ec 04             	sub    $0x4,%esp
c00029f3:	6a 01                	push   $0x1
c00029f5:	6a 01                	push   $0x1
c00029f7:	50                   	push   %eax
c00029f8:	e8 e2 7a 00 00       	call   c000a4df <Memset>
c00029fd:	83 c4 10             	add    $0x10,%esp
c0002a00:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a05:	83 c0 01             	add    $0x1,%eax
c0002a08:	83 ec 04             	sub    $0x4,%esp
c0002a0b:	68 ff 01 00 00       	push   $0x1ff
c0002a10:	6a 00                	push   $0x0
c0002a12:	50                   	push   %eax
c0002a13:	e8 c7 7a 00 00       	call   c000a4df <Memset>
c0002a18:	83 c4 10             	add    $0x10,%esp
c0002a1b:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a20:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0002a23:	83 c2 01             	add    $0x1,%edx
c0002a26:	83 ec 0c             	sub    $0xc,%esp
c0002a29:	6a 0a                	push   $0xa
c0002a2b:	68 00 02 00 00       	push   $0x200
c0002a30:	50                   	push   %eax
c0002a31:	6a 20                	push   $0x20
c0002a33:	52                   	push   %edx
c0002a34:	e8 76 fd ff ff       	call   c00027af <rd_wt>
c0002a39:	83 c4 20             	add    $0x20,%esp
c0002a3c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002a3f:	83 e8 02             	sub    $0x2,%eax
c0002a42:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002a45:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002a4c:	eb 3f                	jmp    c0002a8d <mkfs+0x23a>
c0002a4e:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a53:	83 ec 04             	sub    $0x4,%esp
c0002a56:	68 00 02 00 00       	push   $0x200
c0002a5b:	6a 00                	push   $0x0
c0002a5d:	50                   	push   %eax
c0002a5e:	e8 7c 7a 00 00       	call   c000a4df <Memset>
c0002a63:	83 c4 10             	add    $0x10,%esp
c0002a66:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a6b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0002a6e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0002a71:	01 ca                	add    %ecx,%edx
c0002a73:	83 ec 0c             	sub    $0xc,%esp
c0002a76:	6a 0a                	push   $0xa
c0002a78:	68 00 02 00 00       	push   $0x200
c0002a7d:	50                   	push   %eax
c0002a7e:	6a 20                	push   $0x20
c0002a80:	52                   	push   %edx
c0002a81:	e8 29 fd ff ff       	call   c00027af <rd_wt>
c0002a86:	83 c4 20             	add    $0x20,%esp
c0002a89:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002a8d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002a90:	83 c0 01             	add    $0x1,%eax
c0002a93:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002a96:	7e b6                	jle    c0002a4e <mkfs+0x1fb>
c0002a98:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a9d:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002aa0:	83 c2 03             	add    $0x3,%edx
c0002aa3:	83 ec 0c             	sub    $0xc,%esp
c0002aa6:	6a 0a                	push   $0xa
c0002aa8:	68 00 02 00 00       	push   $0x200
c0002aad:	50                   	push   %eax
c0002aae:	6a 20                	push   $0x20
c0002ab0:	52                   	push   %edx
c0002ab1:	e8 f9 fc ff ff       	call   c00027af <rd_wt>
c0002ab6:	83 c4 20             	add    $0x20,%esp
c0002ab9:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002abe:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002ac1:	83 c2 03             	add    $0x3,%edx
c0002ac4:	83 ec 0c             	sub    $0xc,%esp
c0002ac7:	6a 07                	push   $0x7
c0002ac9:	68 00 02 00 00       	push   $0x200
c0002ace:	50                   	push   %eax
c0002acf:	6a 20                	push   $0x20
c0002ad1:	52                   	push   %edx
c0002ad2:	e8 d8 fc ff ff       	call   c00027af <rd_wt>
c0002ad7:	83 c4 20             	add    $0x20,%esp
c0002ada:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002adf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ae2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ae5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002aeb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002aee:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002af5:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002af8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002afb:	89 50 08             	mov    %edx,0x8(%eax)
c0002afe:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b01:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002b08:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b0b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002b12:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b15:	8b 10                	mov    (%eax),%edx
c0002b17:	89 15 80 21 01 c0    	mov    %edx,0xc0012180
c0002b1d:	8b 50 04             	mov    0x4(%eax),%edx
c0002b20:	89 15 84 21 01 c0    	mov    %edx,0xc0012184
c0002b26:	8b 50 08             	mov    0x8(%eax),%edx
c0002b29:	89 15 88 21 01 c0    	mov    %edx,0xc0012188
c0002b2f:	8b 50 0c             	mov    0xc(%eax),%edx
c0002b32:	89 15 8c 21 01 c0    	mov    %edx,0xc001218c
c0002b38:	8b 50 10             	mov    0x10(%eax),%edx
c0002b3b:	89 15 90 21 01 c0    	mov    %edx,0xc0012190
c0002b41:	8b 50 14             	mov    0x14(%eax),%edx
c0002b44:	89 15 94 21 01 c0    	mov    %edx,0xc0012194
c0002b4a:	8b 50 18             	mov    0x18(%eax),%edx
c0002b4d:	89 15 98 21 01 c0    	mov    %edx,0xc0012198
c0002b53:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002b56:	89 15 9c 21 01 c0    	mov    %edx,0xc001219c
c0002b5c:	8b 50 20             	mov    0x20(%eax),%edx
c0002b5f:	89 15 a0 21 01 c0    	mov    %edx,0xc00121a0
c0002b65:	8b 40 24             	mov    0x24(%eax),%eax
c0002b68:	a3 a4 21 01 c0       	mov    %eax,0xc00121a4
c0002b6d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002b74:	eb 4c                	jmp    c0002bc2 <mkfs+0x36f>
c0002b76:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002b7b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002b7e:	83 c2 01             	add    $0x1,%edx
c0002b81:	c1 e2 05             	shl    $0x5,%edx
c0002b84:	01 d0                	add    %edx,%eax
c0002b86:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002b89:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b8c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002b92:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b95:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002b9c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b9f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002ba6:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002bad:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002bb0:	c1 e0 08             	shl    $0x8,%eax
c0002bb3:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002bb6:	89 c2                	mov    %eax,%edx
c0002bb8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bbb:	89 50 08             	mov    %edx,0x8(%eax)
c0002bbe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002bc2:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002bc6:	7e ae                	jle    c0002b76 <mkfs+0x323>
c0002bc8:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002bcf:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002bd5:	b8 00 00 00 00       	mov    $0x0,%eax
c0002bda:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002bdf:	89 d7                	mov    %edx,%edi
c0002be1:	f3 ab                	rep stos %eax,%es:(%edi)
c0002be3:	c7 85 70 ff ff ff 22 	movl   $0xc0009b22,-0x90(%ebp)
c0002bea:	9b 00 c0 
c0002bed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002bf4:	eb 54                	jmp    c0002c4a <mkfs+0x3f7>
c0002bf6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002bfb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002bfe:	83 c2 04             	add    $0x4,%edx
c0002c01:	c1 e2 05             	shl    $0x5,%edx
c0002c04:	01 d0                	add    %edx,%eax
c0002c06:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002c09:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c0c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002c12:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c15:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002c1c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002c1f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002c22:	83 c2 01             	add    $0x1,%edx
c0002c25:	c1 e2 0b             	shl    $0xb,%edx
c0002c28:	01 c2                	add    %eax,%edx
c0002c2a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c2d:	89 50 08             	mov    %edx,0x8(%eax)
c0002c30:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c33:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002c3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002c3d:	8d 50 05             	lea    0x5(%eax),%edx
c0002c40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c43:	89 50 10             	mov    %edx,0x10(%eax)
c0002c46:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002c4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002c4d:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002c50:	7c a4                	jl     c0002bf6 <mkfs+0x3a3>
c0002c52:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002c57:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002c5a:	83 c2 03             	add    $0x3,%edx
c0002c5d:	83 ec 0c             	sub    $0xc,%esp
c0002c60:	6a 0a                	push   $0xa
c0002c62:	68 00 02 00 00       	push   $0x200
c0002c67:	50                   	push   %eax
c0002c68:	6a 20                	push   $0x20
c0002c6a:	52                   	push   %edx
c0002c6b:	e8 3f fb ff ff       	call   c00027af <rd_wt>
c0002c70:	83 c4 20             	add    $0x20,%esp
c0002c73:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0002c79:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002c7c:	83 ec 0c             	sub    $0xc,%esp
c0002c7f:	6a 07                	push   $0x7
c0002c81:	68 00 02 00 00       	push   $0x200
c0002c86:	52                   	push   %edx
c0002c87:	6a 20                	push   $0x20
c0002c89:	50                   	push   %eax
c0002c8a:	e8 20 fb ff ff       	call   c00027af <rd_wt>
c0002c8f:	83 c4 20             	add    $0x20,%esp
c0002c92:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002c99:	00 00 00 
c0002c9c:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002ca3:	2e 00 
c0002ca5:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002caa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002cad:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002cb0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002cb6:	83 ec 0c             	sub    $0xc,%esp
c0002cb9:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002cbf:	50                   	push   %eax
c0002cc0:	e8 53 78 00 00       	call   c000a518 <Strlen>
c0002cc5:	83 c4 10             	add    $0x10,%esp
c0002cc8:	89 c1                	mov    %eax,%ecx
c0002cca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002ccd:	8d 50 04             	lea    0x4(%eax),%edx
c0002cd0:	83 ec 04             	sub    $0x4,%esp
c0002cd3:	51                   	push   %ecx
c0002cd4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002cda:	50                   	push   %eax
c0002cdb:	52                   	push   %edx
c0002cdc:	e8 d0 77 00 00       	call   c000a4b1 <Memcpy>
c0002ce1:	83 c4 10             	add    $0x10,%esp
c0002ce4:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002cea:	b8 00 00 00 00       	mov    $0x0,%eax
c0002cef:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002cf4:	89 d7                	mov    %edx,%edi
c0002cf6:	f3 ab                	rep stos %eax,%es:(%edi)
c0002cf8:	c7 85 34 ff ff ff 2e 	movl   $0xc0009b2e,-0xcc(%ebp)
c0002cff:	9b 00 c0 
c0002d02:	c7 85 38 ff ff ff 37 	movl   $0xc0009b37,-0xc8(%ebp)
c0002d09:	9b 00 c0 
c0002d0c:	c7 85 3c ff ff ff 40 	movl   $0xc0009b40,-0xc4(%ebp)
c0002d13:	9b 00 c0 
c0002d16:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002d1d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002d24:	eb 49                	jmp    c0002d6f <mkfs+0x51c>
c0002d26:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002d2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002d2d:	8d 50 02             	lea    0x2(%eax),%edx
c0002d30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002d33:	89 10                	mov    %edx,(%eax)
c0002d35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002d38:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002d3f:	83 ec 0c             	sub    $0xc,%esp
c0002d42:	50                   	push   %eax
c0002d43:	e8 d0 77 00 00       	call   c000a518 <Strlen>
c0002d48:	83 c4 10             	add    $0x10,%esp
c0002d4b:	89 c1                	mov    %eax,%ecx
c0002d4d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002d50:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002d57:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002d5a:	83 c2 04             	add    $0x4,%edx
c0002d5d:	83 ec 04             	sub    $0x4,%esp
c0002d60:	51                   	push   %ecx
c0002d61:	50                   	push   %eax
c0002d62:	52                   	push   %edx
c0002d63:	e8 49 77 00 00       	call   c000a4b1 <Memcpy>
c0002d68:	83 c4 10             	add    $0x10,%esp
c0002d6b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002d6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002d72:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002d75:	7c af                	jl     c0002d26 <mkfs+0x4d3>
c0002d77:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002d7e:	eb 66                	jmp    c0002de6 <mkfs+0x593>
c0002d80:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d83:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002d8a:	83 ec 0c             	sub    $0xc,%esp
c0002d8d:	50                   	push   %eax
c0002d8e:	e8 85 77 00 00       	call   c000a518 <Strlen>
c0002d93:	83 c4 10             	add    $0x10,%esp
c0002d96:	85 c0                	test   %eax,%eax
c0002d98:	74 47                	je     c0002de1 <mkfs+0x58e>
c0002d9a:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002d9e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002da1:	8d 50 05             	lea    0x5(%eax),%edx
c0002da4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002da7:	89 10                	mov    %edx,(%eax)
c0002da9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002dac:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002db3:	83 ec 0c             	sub    $0xc,%esp
c0002db6:	50                   	push   %eax
c0002db7:	e8 5c 77 00 00       	call   c000a518 <Strlen>
c0002dbc:	83 c4 10             	add    $0x10,%esp
c0002dbf:	89 c1                	mov    %eax,%ecx
c0002dc1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002dc4:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002dcb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002dce:	83 c2 04             	add    $0x4,%edx
c0002dd1:	83 ec 04             	sub    $0x4,%esp
c0002dd4:	51                   	push   %ecx
c0002dd5:	50                   	push   %eax
c0002dd6:	52                   	push   %edx
c0002dd7:	e8 d5 76 00 00       	call   c000a4b1 <Memcpy>
c0002ddc:	83 c4 10             	add    $0x10,%esp
c0002ddf:	eb 01                	jmp    c0002de2 <mkfs+0x58f>
c0002de1:	90                   	nop
c0002de2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002de6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002de9:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002dec:	7c 92                	jl     c0002d80 <mkfs+0x52d>
c0002dee:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0002df4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002df7:	83 ec 0c             	sub    $0xc,%esp
c0002dfa:	6a 0a                	push   $0xa
c0002dfc:	68 00 02 00 00       	push   $0x200
c0002e01:	52                   	push   %edx
c0002e02:	6a 20                	push   $0x20
c0002e04:	50                   	push   %eax
c0002e05:	e8 a5 f9 ff ff       	call   c00027af <rd_wt>
c0002e0a:	83 c4 20             	add    $0x20,%esp
c0002e0d:	90                   	nop
c0002e0e:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0002e11:	c9                   	leave  
c0002e12:	c3                   	ret    

c0002e13 <init_fs>:
c0002e13:	55                   	push   %ebp
c0002e14:	89 e5                	mov    %esp,%ebp
c0002e16:	83 ec 78             	sub    $0x78,%esp
c0002e19:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0002e20:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
c0002e27:	83 ec 04             	sub    $0x4,%esp
c0002e2a:	6a 02                	push   $0x2
c0002e2c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0002e2f:	50                   	push   %eax
c0002e30:	6a 03                	push   $0x3
c0002e32:	e8 93 64 00 00       	call   c00092ca <send_rec>
c0002e37:	83 c4 10             	add    $0x10,%esp
c0002e3a:	e8 14 fa ff ff       	call   c0002853 <mkfs>
c0002e3f:	90                   	nop
c0002e40:	c9                   	leave  
c0002e41:	c3                   	ret    

c0002e42 <do_open>:
c0002e42:	55                   	push   %ebp
c0002e43:	89 e5                	mov    %esp,%ebp
c0002e45:	56                   	push   %esi
c0002e46:	53                   	push   %ebx
c0002e47:	83 ec 60             	sub    $0x60,%esp
c0002e4a:	83 ec 04             	sub    $0x4,%esp
c0002e4d:	6a 0c                	push   $0xc
c0002e4f:	6a 00                	push   $0x0
c0002e51:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002e54:	50                   	push   %eax
c0002e55:	e8 85 76 00 00       	call   c000a4df <Memset>
c0002e5a:	83 c4 10             	add    $0x10,%esp
c0002e5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e60:	8b 40 30             	mov    0x30(%eax),%eax
c0002e63:	89 c6                	mov    %eax,%esi
c0002e65:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e68:	8b 40 34             	mov    0x34(%eax),%eax
c0002e6b:	89 c2                	mov    %eax,%edx
c0002e6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e70:	8b 00                	mov    (%eax),%eax
c0002e72:	83 ec 08             	sub    $0x8,%esp
c0002e75:	52                   	push   %edx
c0002e76:	50                   	push   %eax
c0002e77:	e8 62 19 00 00       	call   c00047de <v2l>
c0002e7c:	83 c4 10             	add    $0x10,%esp
c0002e7f:	89 c3                	mov    %eax,%ebx
c0002e81:	83 ec 08             	sub    $0x8,%esp
c0002e84:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002e87:	50                   	push   %eax
c0002e88:	6a 03                	push   $0x3
c0002e8a:	e8 4f 19 00 00       	call   c00047de <v2l>
c0002e8f:	83 c4 10             	add    $0x10,%esp
c0002e92:	83 ec 04             	sub    $0x4,%esp
c0002e95:	56                   	push   %esi
c0002e96:	53                   	push   %ebx
c0002e97:	50                   	push   %eax
c0002e98:	e8 14 76 00 00       	call   c000a4b1 <Memcpy>
c0002e9d:	83 c4 10             	add    $0x10,%esp
c0002ea0:	8b 45 08             	mov    0x8(%ebp),%eax
c0002ea3:	8b 40 30             	mov    0x30(%eax),%eax
c0002ea6:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
c0002eab:	8b 45 08             	mov    0x8(%ebp),%eax
c0002eae:	8b 40 64             	mov    0x64(%eax),%eax
c0002eb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002eb4:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0002ebb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002ec2:	eb 1f                	jmp    c0002ee3 <do_open+0xa1>
c0002ec4:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c0002ec9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002ecc:	83 c2 0c             	add    $0xc,%edx
c0002ecf:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0002ed3:	85 c0                	test   %eax,%eax
c0002ed5:	75 08                	jne    c0002edf <do_open+0x9d>
c0002ed7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002eda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002edd:	eb 0a                	jmp    c0002ee9 <do_open+0xa7>
c0002edf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002ee3:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002ee7:	7e db                	jle    c0002ec4 <do_open+0x82>
c0002ee9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0002eed:	75 1c                	jne    c0002f0b <do_open+0xc9>
c0002eef:	68 d8 01 00 00       	push   $0x1d8
c0002ef4:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0002ef9:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0002efe:	68 49 9b 00 c0       	push   $0xc0009b49
c0002f03:	e8 4a 5b 00 00       	call   c0008a52 <assertion_failure>
c0002f08:	83 c4 10             	add    $0x10,%esp
c0002f0b:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0002f12:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0002f19:	eb 1d                	jmp    c0002f38 <do_open+0xf6>
c0002f1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f1e:	c1 e0 04             	shl    $0x4,%eax
c0002f21:	05 88 13 01 c0       	add    $0xc0011388,%eax
c0002f26:	8b 00                	mov    (%eax),%eax
c0002f28:	85 c0                	test   %eax,%eax
c0002f2a:	75 08                	jne    c0002f34 <do_open+0xf2>
c0002f2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002f32:	eb 0a                	jmp    c0002f3e <do_open+0xfc>
c0002f34:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0002f38:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0002f3c:	7e dd                	jle    c0002f1b <do_open+0xd9>
c0002f3e:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0002f42:	75 1c                	jne    c0002f60 <do_open+0x11e>
c0002f44:	68 e4 01 00 00       	push   $0x1e4
c0002f49:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0002f4e:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0002f53:	68 51 9b 00 c0       	push   $0xc0009b51
c0002f58:	e8 f5 5a 00 00       	call   c0008a52 <assertion_failure>
c0002f5d:	83 c4 10             	add    $0x10,%esp
c0002f60:	83 ec 0c             	sub    $0xc,%esp
c0002f63:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002f66:	50                   	push   %eax
c0002f67:	e8 b7 00 00 00       	call   c0003023 <search_file>
c0002f6c:	83 c4 10             	add    $0x10,%esp
c0002f6f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002f72:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
c0002f76:	75 2b                	jne    c0002fa3 <do_open+0x161>
c0002f78:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0002f7c:	7e 10                	jle    c0002f8e <do_open+0x14c>
c0002f7e:	83 ec 0c             	sub    $0xc,%esp
c0002f81:	68 59 9b 00 c0       	push   $0xc0009b59
c0002f86:	e8 a9 5a 00 00       	call   c0008a34 <panic>
c0002f8b:	83 c4 10             	add    $0x10,%esp
c0002f8e:	83 ec 08             	sub    $0x8,%esp
c0002f91:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002f94:	50                   	push   %eax
c0002f95:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0002f98:	50                   	push   %eax
c0002f99:	e8 43 04 00 00       	call   c00033e1 <create_file>
c0002f9e:	83 c4 10             	add    $0x10,%esp
c0002fa1:	eb 22                	jmp    c0002fc5 <do_open+0x183>
c0002fa3:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0002fa7:	75 07                	jne    c0002fb0 <do_open+0x16e>
c0002fa9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0002fae:	eb 6c                	jmp    c000301c <do_open+0x1da>
c0002fb0:	83 ec 08             	sub    $0x8,%esp
c0002fb3:	ff 75 e0             	pushl  -0x20(%ebp)
c0002fb6:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0002fb9:	50                   	push   %eax
c0002fba:	e8 60 02 00 00       	call   c000321f <get_inode>
c0002fbf:	83 c4 10             	add    $0x10,%esp
c0002fc2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002fc5:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c0002fca:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002fcd:	c1 e2 04             	shl    $0x4,%edx
c0002fd0:	8d 8a 80 13 01 c0    	lea    -0x3ffeec80(%edx),%ecx
c0002fd6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0002fd9:	83 c2 0c             	add    $0xc,%edx
c0002fdc:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0002fe0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0002fe3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002fe6:	c1 e2 04             	shl    $0x4,%edx
c0002fe9:	81 c2 88 13 01 c0    	add    $0xc0011388,%edx
c0002fef:	89 02                	mov    %eax,(%edx)
c0002ff1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ff4:	c1 e0 04             	shl    $0x4,%eax
c0002ff7:	05 84 13 01 c0       	add    $0xc0011384,%eax
c0002ffc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003002:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003005:	c1 e0 04             	shl    $0x4,%eax
c0003008:	05 80 13 01 c0       	add    $0xc0011380,%eax
c000300d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003013:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003016:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003019:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000301c:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000301f:	5b                   	pop    %ebx
c0003020:	5e                   	pop    %esi
c0003021:	5d                   	pop    %ebp
c0003022:	c3                   	ret    

c0003023 <search_file>:
c0003023:	55                   	push   %ebp
c0003024:	89 e5                	mov    %esp,%ebp
c0003026:	83 ec 68             	sub    $0x68,%esp
c0003029:	83 ec 04             	sub    $0x4,%esp
c000302c:	6a 0c                	push   $0xc
c000302e:	6a 00                	push   $0x0
c0003030:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003033:	50                   	push   %eax
c0003034:	e8 a6 74 00 00       	call   c000a4df <Memset>
c0003039:	83 c4 10             	add    $0x10,%esp
c000303c:	83 ec 04             	sub    $0x4,%esp
c000303f:	6a 28                	push   $0x28
c0003041:	6a 00                	push   $0x0
c0003043:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003046:	50                   	push   %eax
c0003047:	e8 93 74 00 00       	call   c000a4df <Memset>
c000304c:	83 c4 10             	add    $0x10,%esp
c000304f:	83 ec 04             	sub    $0x4,%esp
c0003052:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003055:	50                   	push   %eax
c0003056:	ff 75 08             	pushl  0x8(%ebp)
c0003059:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000305c:	50                   	push   %eax
c000305d:	e8 f1 00 00 00       	call   c0003153 <strip_path>
c0003062:	83 c4 10             	add    $0x10,%esp
c0003065:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003068:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000306c:	75 0a                	jne    c0003078 <search_file+0x55>
c000306e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003073:	e9 d9 00 00 00       	jmp    c0003151 <search_file+0x12e>
c0003078:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000307b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000307e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003081:	05 00 02 00 00       	add    $0x200,%eax
c0003086:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000308c:	85 c0                	test   %eax,%eax
c000308e:	0f 48 c2             	cmovs  %edx,%eax
c0003091:	c1 f8 09             	sar    $0x9,%eax
c0003094:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003097:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000309a:	c1 e8 04             	shr    $0x4,%eax
c000309d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00030a0:	e8 32 14 00 00       	call   c00044d7 <get_super_block>
c00030a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00030a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00030ab:	8b 00                	mov    (%eax),%eax
c00030ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00030b0:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c00030b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00030be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00030c5:	eb 79                	jmp    c0003140 <search_file+0x11d>
c00030c7:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00030cc:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c00030cf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00030d2:	01 ca                	add    %ecx,%edx
c00030d4:	83 ec 0c             	sub    $0xc,%esp
c00030d7:	6a 07                	push   $0x7
c00030d9:	68 00 02 00 00       	push   $0x200
c00030de:	50                   	push   %eax
c00030df:	ff 75 cc             	pushl  -0x34(%ebp)
c00030e2:	52                   	push   %edx
c00030e3:	e8 c7 f6 ff ff       	call   c00027af <rd_wt>
c00030e8:	83 c4 20             	add    $0x20,%esp
c00030eb:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00030f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00030f3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00030fa:	eb 35                	jmp    c0003131 <search_file+0x10e>
c00030fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003100:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003103:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003106:	7f 33                	jg     c000313b <search_file+0x118>
c0003108:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000310b:	83 c0 04             	add    $0x4,%eax
c000310e:	83 ec 08             	sub    $0x8,%esp
c0003111:	50                   	push   %eax
c0003112:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003115:	50                   	push   %eax
c0003116:	e8 9e 64 00 00       	call   c00095b9 <strcmp>
c000311b:	83 c4 10             	add    $0x10,%esp
c000311e:	85 c0                	test   %eax,%eax
c0003120:	75 07                	jne    c0003129 <search_file+0x106>
c0003122:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003125:	8b 00                	mov    (%eax),%eax
c0003127:	eb 28                	jmp    c0003151 <search_file+0x12e>
c0003129:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000312d:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003131:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003134:	83 f8 1f             	cmp    $0x1f,%eax
c0003137:	76 c3                	jbe    c00030fc <search_file+0xd9>
c0003139:	eb 01                	jmp    c000313c <search_file+0x119>
c000313b:	90                   	nop
c000313c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003140:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003143:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003146:	0f 8c 7b ff ff ff    	jl     c00030c7 <search_file+0xa4>
c000314c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003151:	c9                   	leave  
c0003152:	c3                   	ret    

c0003153 <strip_path>:
c0003153:	55                   	push   %ebp
c0003154:	89 e5                	mov    %esp,%ebp
c0003156:	83 ec 10             	sub    $0x10,%esp
c0003159:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000315d:	75 0a                	jne    c0003169 <strip_path+0x16>
c000315f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003164:	e9 b4 00 00 00       	jmp    c000321d <strip_path+0xca>
c0003169:	8b 45 08             	mov    0x8(%ebp),%eax
c000316c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000316f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003172:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003175:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003178:	0f b6 00             	movzbl (%eax),%eax
c000317b:	3c 2f                	cmp    $0x2f,%al
c000317d:	75 2d                	jne    c00031ac <strip_path+0x59>
c000317f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003183:	eb 27                	jmp    c00031ac <strip_path+0x59>
c0003185:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003188:	0f b6 00             	movzbl (%eax),%eax
c000318b:	3c 2f                	cmp    $0x2f,%al
c000318d:	75 0a                	jne    c0003199 <strip_path+0x46>
c000318f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003194:	e9 84 00 00 00       	jmp    c000321d <strip_path+0xca>
c0003199:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000319c:	0f b6 10             	movzbl (%eax),%edx
c000319f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00031a2:	88 10                	mov    %dl,(%eax)
c00031a4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00031a8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00031ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00031af:	0f b6 00             	movzbl (%eax),%eax
c00031b2:	84 c0                	test   %al,%al
c00031b4:	75 cf                	jne    c0003185 <strip_path+0x32>
c00031b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00031b9:	c6 00 00             	movb   $0x0,(%eax)
c00031bc:	8b 45 10             	mov    0x10(%ebp),%eax
c00031bf:	8b 15 80 21 01 c0    	mov    0xc0012180,%edx
c00031c5:	89 10                	mov    %edx,(%eax)
c00031c7:	8b 15 84 21 01 c0    	mov    0xc0012184,%edx
c00031cd:	89 50 04             	mov    %edx,0x4(%eax)
c00031d0:	8b 15 88 21 01 c0    	mov    0xc0012188,%edx
c00031d6:	89 50 08             	mov    %edx,0x8(%eax)
c00031d9:	8b 15 8c 21 01 c0    	mov    0xc001218c,%edx
c00031df:	89 50 0c             	mov    %edx,0xc(%eax)
c00031e2:	8b 15 90 21 01 c0    	mov    0xc0012190,%edx
c00031e8:	89 50 10             	mov    %edx,0x10(%eax)
c00031eb:	8b 15 94 21 01 c0    	mov    0xc0012194,%edx
c00031f1:	89 50 14             	mov    %edx,0x14(%eax)
c00031f4:	8b 15 98 21 01 c0    	mov    0xc0012198,%edx
c00031fa:	89 50 18             	mov    %edx,0x18(%eax)
c00031fd:	8b 15 9c 21 01 c0    	mov    0xc001219c,%edx
c0003203:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003206:	8b 15 a0 21 01 c0    	mov    0xc00121a0,%edx
c000320c:	89 50 20             	mov    %edx,0x20(%eax)
c000320f:	8b 15 a4 21 01 c0    	mov    0xc00121a4,%edx
c0003215:	89 50 24             	mov    %edx,0x24(%eax)
c0003218:	b8 00 00 00 00       	mov    $0x0,%eax
c000321d:	c9                   	leave  
c000321e:	c3                   	ret    

c000321f <get_inode>:
c000321f:	55                   	push   %ebp
c0003220:	89 e5                	mov    %esp,%ebp
c0003222:	56                   	push   %esi
c0003223:	53                   	push   %ebx
c0003224:	83 ec 20             	sub    $0x20,%esp
c0003227:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000322b:	75 0a                	jne    c0003237 <get_inode+0x18>
c000322d:	b8 00 00 00 00       	mov    $0x0,%eax
c0003232:	e9 a3 01 00 00       	jmp    c00033da <get_inode+0x1bb>
c0003237:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000323e:	c7 45 f0 80 17 01 c0 	movl   $0xc0011780,-0x10(%ebp)
c0003245:	eb 69                	jmp    c00032b0 <get_inode+0x91>
c0003247:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000324a:	8b 40 24             	mov    0x24(%eax),%eax
c000324d:	85 c0                	test   %eax,%eax
c000324f:	7e 53                	jle    c00032a4 <get_inode+0x85>
c0003251:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003254:	8b 40 10             	mov    0x10(%eax),%eax
c0003257:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000325a:	75 50                	jne    c00032ac <get_inode+0x8d>
c000325c:	8b 45 08             	mov    0x8(%ebp),%eax
c000325f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003262:	8b 0a                	mov    (%edx),%ecx
c0003264:	89 08                	mov    %ecx,(%eax)
c0003266:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003269:	89 48 04             	mov    %ecx,0x4(%eax)
c000326c:	8b 4a 08             	mov    0x8(%edx),%ecx
c000326f:	89 48 08             	mov    %ecx,0x8(%eax)
c0003272:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003275:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003278:	8b 4a 10             	mov    0x10(%edx),%ecx
c000327b:	89 48 10             	mov    %ecx,0x10(%eax)
c000327e:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003281:	89 48 14             	mov    %ecx,0x14(%eax)
c0003284:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003287:	89 48 18             	mov    %ecx,0x18(%eax)
c000328a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000328d:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003290:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003293:	89 48 20             	mov    %ecx,0x20(%eax)
c0003296:	8b 52 24             	mov    0x24(%edx),%edx
c0003299:	89 50 24             	mov    %edx,0x24(%eax)
c000329c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000329f:	e9 36 01 00 00       	jmp    c00033da <get_inode+0x1bb>
c00032a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00032a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00032aa:	eb 0d                	jmp    c00032b9 <get_inode+0x9a>
c00032ac:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c00032b0:	81 7d f0 80 21 01 c0 	cmpl   $0xc0012180,-0x10(%ebp)
c00032b7:	76 8e                	jbe    c0003247 <get_inode+0x28>
c00032b9:	e8 19 12 00 00       	call   c00044d7 <get_super_block>
c00032be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00032c1:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00032c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032cb:	8b 40 04             	mov    0x4(%eax),%eax
c00032ce:	8d 50 02             	lea    0x2(%eax),%edx
c00032d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032d4:	8b 40 08             	mov    0x8(%eax),%eax
c00032d7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00032da:	8b 45 0c             	mov    0xc(%ebp),%eax
c00032dd:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00032e0:	b8 00 02 00 00       	mov    $0x200,%eax
c00032e5:	99                   	cltd   
c00032e6:	f7 7d e8             	idivl  -0x18(%ebp)
c00032e9:	89 c6                	mov    %eax,%esi
c00032eb:	89 c8                	mov    %ecx,%eax
c00032ed:	99                   	cltd   
c00032ee:	f7 fe                	idiv   %esi
c00032f0:	01 d8                	add    %ebx,%eax
c00032f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00032f5:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00032fc:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003301:	83 ec 0c             	sub    $0xc,%esp
c0003304:	6a 07                	push   $0x7
c0003306:	68 00 02 00 00       	push   $0x200
c000330b:	50                   	push   %eax
c000330c:	ff 75 e0             	pushl  -0x20(%ebp)
c000330f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003312:	e8 98 f4 ff ff       	call   c00027af <rd_wt>
c0003317:	83 c4 20             	add    $0x20,%esp
c000331a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000331d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003320:	b8 00 02 00 00       	mov    $0x200,%eax
c0003325:	99                   	cltd   
c0003326:	f7 7d e8             	idivl  -0x18(%ebp)
c0003329:	89 c3                	mov    %eax,%ebx
c000332b:	89 c8                	mov    %ecx,%eax
c000332d:	99                   	cltd   
c000332e:	f7 fb                	idiv   %ebx
c0003330:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003333:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003339:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000333c:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003340:	01 d0                	add    %edx,%eax
c0003342:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003345:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003348:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000334b:	8b 0a                	mov    (%edx),%ecx
c000334d:	89 08                	mov    %ecx,(%eax)
c000334f:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003352:	89 48 04             	mov    %ecx,0x4(%eax)
c0003355:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003358:	89 48 08             	mov    %ecx,0x8(%eax)
c000335b:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000335e:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003361:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003364:	89 48 10             	mov    %ecx,0x10(%eax)
c0003367:	8b 4a 14             	mov    0x14(%edx),%ecx
c000336a:	89 48 14             	mov    %ecx,0x14(%eax)
c000336d:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003370:	89 48 18             	mov    %ecx,0x18(%eax)
c0003373:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003376:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003379:	8b 4a 20             	mov    0x20(%edx),%ecx
c000337c:	89 48 20             	mov    %ecx,0x20(%eax)
c000337f:	8b 52 24             	mov    0x24(%edx),%edx
c0003382:	89 50 24             	mov    %edx,0x24(%eax)
c0003385:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003388:	8b 55 0c             	mov    0xc(%ebp),%edx
c000338b:	89 50 10             	mov    %edx,0x10(%eax)
c000338e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003391:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003394:	89 50 20             	mov    %edx,0x20(%eax)
c0003397:	8b 45 08             	mov    0x8(%ebp),%eax
c000339a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000339d:	8b 0a                	mov    (%edx),%ecx
c000339f:	89 08                	mov    %ecx,(%eax)
c00033a1:	8b 4a 04             	mov    0x4(%edx),%ecx
c00033a4:	89 48 04             	mov    %ecx,0x4(%eax)
c00033a7:	8b 4a 08             	mov    0x8(%edx),%ecx
c00033aa:	89 48 08             	mov    %ecx,0x8(%eax)
c00033ad:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00033b0:	89 48 0c             	mov    %ecx,0xc(%eax)
c00033b3:	8b 4a 10             	mov    0x10(%edx),%ecx
c00033b6:	89 48 10             	mov    %ecx,0x10(%eax)
c00033b9:	8b 4a 14             	mov    0x14(%edx),%ecx
c00033bc:	89 48 14             	mov    %ecx,0x14(%eax)
c00033bf:	8b 4a 18             	mov    0x18(%edx),%ecx
c00033c2:	89 48 18             	mov    %ecx,0x18(%eax)
c00033c5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00033c8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00033cb:	8b 4a 20             	mov    0x20(%edx),%ecx
c00033ce:	89 48 20             	mov    %ecx,0x20(%eax)
c00033d1:	8b 52 24             	mov    0x24(%edx),%edx
c00033d4:	89 50 24             	mov    %edx,0x24(%eax)
c00033d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00033da:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00033dd:	5b                   	pop    %ebx
c00033de:	5e                   	pop    %esi
c00033df:	5d                   	pop    %ebp
c00033e0:	c3                   	ret    

c00033e1 <create_file>:
c00033e1:	55                   	push   %ebp
c00033e2:	89 e5                	mov    %esp,%ebp
c00033e4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00033ea:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00033ed:	50                   	push   %eax
c00033ee:	ff 75 0c             	pushl  0xc(%ebp)
c00033f1:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00033f4:	50                   	push   %eax
c00033f5:	e8 59 fd ff ff       	call   c0003153 <strip_path>
c00033fa:	83 c4 0c             	add    $0xc,%esp
c00033fd:	83 f8 ff             	cmp    $0xffffffff,%eax
c0003400:	75 0a                	jne    c000340c <create_file+0x2b>
c0003402:	b8 00 00 00 00       	mov    $0x0,%eax
c0003407:	e9 de 00 00 00       	jmp    c00034ea <create_file+0x109>
c000340c:	e8 db 00 00 00       	call   c00034ec <alloc_imap_bit>
c0003411:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003414:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003418:	75 0a                	jne    c0003424 <create_file+0x43>
c000341a:	b8 00 00 00 00       	mov    $0x0,%eax
c000341f:	e9 c6 00 00 00       	jmp    c00034ea <create_file+0x109>
c0003424:	e8 ae 10 00 00       	call   c00044d7 <get_super_block>
c0003429:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000342c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000342f:	8b 40 10             	mov    0x10(%eax),%eax
c0003432:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003435:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003438:	83 ec 08             	sub    $0x8,%esp
c000343b:	50                   	push   %eax
c000343c:	ff 75 f4             	pushl  -0xc(%ebp)
c000343f:	e8 a5 01 00 00       	call   c00035e9 <alloc_smap_bit>
c0003444:	83 c4 10             	add    $0x10,%esp
c0003447:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000344a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000344e:	75 0a                	jne    c000345a <create_file+0x79>
c0003450:	b8 00 00 00 00       	mov    $0x0,%eax
c0003455:	e9 90 00 00 00       	jmp    c00034ea <create_file+0x109>
c000345a:	83 ec 04             	sub    $0x4,%esp
c000345d:	ff 75 e8             	pushl  -0x18(%ebp)
c0003460:	ff 75 f4             	pushl  -0xc(%ebp)
c0003463:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003466:	50                   	push   %eax
c0003467:	e8 1e 03 00 00       	call   c000378a <new_inode>
c000346c:	83 c4 10             	add    $0x10,%esp
c000346f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003472:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003476:	75 07                	jne    c000347f <create_file+0x9e>
c0003478:	b8 00 00 00 00       	mov    $0x0,%eax
c000347d:	eb 6b                	jmp    c00034ea <create_file+0x109>
c000347f:	ff 75 f4             	pushl  -0xc(%ebp)
c0003482:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003485:	50                   	push   %eax
c0003486:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003489:	50                   	push   %eax
c000348a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003490:	50                   	push   %eax
c0003491:	e8 12 04 00 00       	call   c00038a8 <new_dir_entry>
c0003496:	83 c4 10             	add    $0x10,%esp
c0003499:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000349c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00034a0:	75 07                	jne    c00034a9 <create_file+0xc8>
c00034a2:	b8 00 00 00 00       	mov    $0x0,%eax
c00034a7:	eb 41                	jmp    c00034ea <create_file+0x109>
c00034a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00034ac:	8b 55 84             	mov    -0x7c(%ebp),%edx
c00034af:	89 10                	mov    %edx,(%eax)
c00034b1:	8b 55 88             	mov    -0x78(%ebp),%edx
c00034b4:	89 50 04             	mov    %edx,0x4(%eax)
c00034b7:	8b 55 8c             	mov    -0x74(%ebp),%edx
c00034ba:	89 50 08             	mov    %edx,0x8(%eax)
c00034bd:	8b 55 90             	mov    -0x70(%ebp),%edx
c00034c0:	89 50 0c             	mov    %edx,0xc(%eax)
c00034c3:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00034c6:	89 50 10             	mov    %edx,0x10(%eax)
c00034c9:	8b 55 98             	mov    -0x68(%ebp),%edx
c00034cc:	89 50 14             	mov    %edx,0x14(%eax)
c00034cf:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00034d2:	89 50 18             	mov    %edx,0x18(%eax)
c00034d5:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00034d8:	89 50 1c             	mov    %edx,0x1c(%eax)
c00034db:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c00034de:	89 50 20             	mov    %edx,0x20(%eax)
c00034e1:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00034e4:	89 50 24             	mov    %edx,0x24(%eax)
c00034e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00034ea:	c9                   	leave  
c00034eb:	c3                   	ret    

c00034ec <alloc_imap_bit>:
c00034ec:	55                   	push   %ebp
c00034ed:	89 e5                	mov    %esp,%ebp
c00034ef:	53                   	push   %ebx
c00034f0:	83 ec 24             	sub    $0x24,%esp
c00034f3:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00034fa:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003501:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003506:	83 ec 0c             	sub    $0xc,%esp
c0003509:	6a 07                	push   $0x7
c000350b:	68 00 02 00 00       	push   $0x200
c0003510:	50                   	push   %eax
c0003511:	ff 75 e8             	pushl  -0x18(%ebp)
c0003514:	ff 75 ec             	pushl  -0x14(%ebp)
c0003517:	e8 93 f2 ff ff       	call   c00027af <rd_wt>
c000351c:	83 c4 20             	add    $0x20,%esp
c000351f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003526:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000352d:	e9 a5 00 00 00       	jmp    c00035d7 <alloc_imap_bit+0xeb>
c0003532:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003539:	e9 8b 00 00 00       	jmp    c00035c9 <alloc_imap_bit+0xdd>
c000353e:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003544:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003547:	01 d0                	add    %edx,%eax
c0003549:	0f b6 00             	movzbl (%eax),%eax
c000354c:	0f be d0             	movsbl %al,%edx
c000354f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003552:	89 c1                	mov    %eax,%ecx
c0003554:	d3 fa                	sar    %cl,%edx
c0003556:	89 d0                	mov    %edx,%eax
c0003558:	83 e0 01             	and    $0x1,%eax
c000355b:	85 c0                	test   %eax,%eax
c000355d:	74 06                	je     c0003565 <alloc_imap_bit+0x79>
c000355f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003563:	eb 64                	jmp    c00035c9 <alloc_imap_bit+0xdd>
c0003565:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000356b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000356e:	01 d0                	add    %edx,%eax
c0003570:	0f b6 18             	movzbl (%eax),%ebx
c0003573:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003576:	ba 01 00 00 00       	mov    $0x1,%edx
c000357b:	89 c1                	mov    %eax,%ecx
c000357d:	d3 e2                	shl    %cl,%edx
c000357f:	89 d0                	mov    %edx,%eax
c0003581:	89 c1                	mov    %eax,%ecx
c0003583:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003589:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000358c:	01 d0                	add    %edx,%eax
c000358e:	09 cb                	or     %ecx,%ebx
c0003590:	89 da                	mov    %ebx,%edx
c0003592:	88 10                	mov    %dl,(%eax)
c0003594:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003597:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000359e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035a1:	01 d0                	add    %edx,%eax
c00035a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00035a6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00035ab:	83 ec 0c             	sub    $0xc,%esp
c00035ae:	6a 0a                	push   $0xa
c00035b0:	68 00 02 00 00       	push   $0x200
c00035b5:	50                   	push   %eax
c00035b6:	ff 75 e8             	pushl  -0x18(%ebp)
c00035b9:	ff 75 ec             	pushl  -0x14(%ebp)
c00035bc:	e8 ee f1 ff ff       	call   c00027af <rd_wt>
c00035c1:	83 c4 20             	add    $0x20,%esp
c00035c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00035c7:	eb 1b                	jmp    c00035e4 <alloc_imap_bit+0xf8>
c00035c9:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c00035cd:	0f 8e 6b ff ff ff    	jle    c000353e <alloc_imap_bit+0x52>
c00035d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00035d7:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c00035de:	0f 8e 4e ff ff ff    	jle    c0003532 <alloc_imap_bit+0x46>
c00035e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00035e7:	c9                   	leave  
c00035e8:	c3                   	ret    

c00035e9 <alloc_smap_bit>:
c00035e9:	55                   	push   %ebp
c00035ea:	89 e5                	mov    %esp,%ebp
c00035ec:	53                   	push   %ebx
c00035ed:	83 ec 34             	sub    $0x34,%esp
c00035f0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00035f4:	75 1c                	jne    c0003612 <alloc_smap_bit+0x29>
c00035f6:	68 0e 03 00 00       	push   $0x30e
c00035fb:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0003600:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0003605:	68 66 9b 00 c0       	push   $0xc0009b66
c000360a:	e8 43 54 00 00       	call   c0008a52 <assertion_failure>
c000360f:	83 c4 10             	add    $0x10,%esp
c0003612:	e8 c0 0e 00 00       	call   c00044d7 <get_super_block>
c0003617:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000361a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000361d:	8b 40 08             	mov    0x8(%eax),%eax
c0003620:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003623:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003626:	8b 40 04             	mov    0x4(%eax),%eax
c0003629:	83 c0 02             	add    $0x2,%eax
c000362c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000362f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003636:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c000363d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003644:	e9 20 01 00 00       	jmp    c0003769 <alloc_smap_bit+0x180>
c0003649:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000364c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000364f:	01 d0                	add    %edx,%eax
c0003651:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003654:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003659:	83 ec 0c             	sub    $0xc,%esp
c000365c:	6a 07                	push   $0x7
c000365e:	68 00 02 00 00       	push   $0x200
c0003663:	50                   	push   %eax
c0003664:	ff 75 d8             	pushl  -0x28(%ebp)
c0003667:	ff 75 d4             	pushl  -0x2c(%ebp)
c000366a:	e8 40 f1 ff ff       	call   c00027af <rd_wt>
c000366f:	83 c4 20             	add    $0x20,%esp
c0003672:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003679:	e9 b0 00 00 00       	jmp    c000372e <alloc_smap_bit+0x145>
c000367e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003685:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003689:	0f 85 8c 00 00 00    	jne    c000371b <alloc_smap_bit+0x132>
c000368f:	eb 45                	jmp    c00036d6 <alloc_smap_bit+0xed>
c0003691:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003697:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000369a:	01 d0                	add    %edx,%eax
c000369c:	0f b6 00             	movzbl (%eax),%eax
c000369f:	0f be d0             	movsbl %al,%edx
c00036a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00036a5:	89 c1                	mov    %eax,%ecx
c00036a7:	d3 fa                	sar    %cl,%edx
c00036a9:	89 d0                	mov    %edx,%eax
c00036ab:	83 e0 01             	and    $0x1,%eax
c00036ae:	85 c0                	test   %eax,%eax
c00036b0:	74 06                	je     c00036b8 <alloc_smap_bit+0xcf>
c00036b2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00036b6:	eb 1e                	jmp    c00036d6 <alloc_smap_bit+0xed>
c00036b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036bb:	c1 e0 09             	shl    $0x9,%eax
c00036be:	89 c2                	mov    %eax,%edx
c00036c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036c3:	01 d0                	add    %edx,%eax
c00036c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00036cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00036cf:	01 d0                	add    %edx,%eax
c00036d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00036d4:	eb 06                	jmp    c00036dc <alloc_smap_bit+0xf3>
c00036d6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00036da:	7e b5                	jle    c0003691 <alloc_smap_bit+0xa8>
c00036dc:	eb 3d                	jmp    c000371b <alloc_smap_bit+0x132>
c00036de:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00036e2:	74 45                	je     c0003729 <alloc_smap_bit+0x140>
c00036e4:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00036ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036ed:	01 d0                	add    %edx,%eax
c00036ef:	0f b6 18             	movzbl (%eax),%ebx
c00036f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00036f5:	ba 01 00 00 00       	mov    $0x1,%edx
c00036fa:	89 c1                	mov    %eax,%ecx
c00036fc:	d3 e2                	shl    %cl,%edx
c00036fe:	89 d0                	mov    %edx,%eax
c0003700:	89 c1                	mov    %eax,%ecx
c0003702:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003708:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000370b:	01 d0                	add    %edx,%eax
c000370d:	09 cb                	or     %ecx,%ebx
c000370f:	89 da                	mov    %ebx,%edx
c0003711:	88 10                	mov    %dl,(%eax)
c0003713:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003717:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000371b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000371f:	74 09                	je     c000372a <alloc_smap_bit+0x141>
c0003721:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003725:	7e b7                	jle    c00036de <alloc_smap_bit+0xf5>
c0003727:	eb 01                	jmp    c000372a <alloc_smap_bit+0x141>
c0003729:	90                   	nop
c000372a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000372e:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003735:	0f 8e 43 ff ff ff    	jle    c000367e <alloc_smap_bit+0x95>
c000373b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000373f:	74 1e                	je     c000375f <alloc_smap_bit+0x176>
c0003741:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003746:	83 ec 0c             	sub    $0xc,%esp
c0003749:	6a 0a                	push   $0xa
c000374b:	68 00 02 00 00       	push   $0x200
c0003750:	50                   	push   %eax
c0003751:	ff 75 d8             	pushl  -0x28(%ebp)
c0003754:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003757:	e8 53 f0 ff ff       	call   c00027af <rd_wt>
c000375c:	83 c4 20             	add    $0x20,%esp
c000375f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003763:	74 12                	je     c0003777 <alloc_smap_bit+0x18e>
c0003765:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003769:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000376c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c000376f:	0f 8c d4 fe ff ff    	jl     c0003649 <alloc_smap_bit+0x60>
c0003775:	eb 01                	jmp    c0003778 <alloc_smap_bit+0x18f>
c0003777:	90                   	nop
c0003778:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000377b:	8d 50 ff             	lea    -0x1(%eax),%edx
c000377e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003781:	8b 00                	mov    (%eax),%eax
c0003783:	01 d0                	add    %edx,%eax
c0003785:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003788:	c9                   	leave  
c0003789:	c3                   	ret    

c000378a <new_inode>:
c000378a:	55                   	push   %ebp
c000378b:	89 e5                	mov    %esp,%ebp
c000378d:	83 ec 38             	sub    $0x38,%esp
c0003790:	83 ec 08             	sub    $0x8,%esp
c0003793:	ff 75 0c             	pushl  0xc(%ebp)
c0003796:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003799:	50                   	push   %eax
c000379a:	e8 80 fa ff ff       	call   c000321f <get_inode>
c000379f:	83 c4 10             	add    $0x10,%esp
c00037a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00037a5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00037a9:	75 0a                	jne    c00037b5 <new_inode+0x2b>
c00037ab:	b8 00 00 00 00       	mov    $0x0,%eax
c00037b0:	e9 f1 00 00 00       	jmp    c00038a6 <new_inode+0x11c>
c00037b5:	8b 45 10             	mov    0x10(%ebp),%eax
c00037b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00037bb:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c00037c2:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00037c9:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c00037d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00037d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00037d6:	83 ec 0c             	sub    $0xc,%esp
c00037d9:	8d 45 c8             	lea    -0x38(%ebp),%eax
c00037dc:	50                   	push   %eax
c00037dd:	e8 11 0b 00 00       	call   c00042f3 <sync_inode>
c00037e2:	83 c4 10             	add    $0x10,%esp
c00037e5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00037ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00037f3:	eb 1d                	jmp    c0003812 <new_inode+0x88>
c00037f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00037f8:	89 d0                	mov    %edx,%eax
c00037fa:	c1 e0 02             	shl    $0x2,%eax
c00037fd:	01 d0                	add    %edx,%eax
c00037ff:	c1 e0 03             	shl    $0x3,%eax
c0003802:	05 90 17 01 c0       	add    $0xc0011790,%eax
c0003807:	8b 00                	mov    (%eax),%eax
c0003809:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000380c:	74 0c                	je     c000381a <new_inode+0x90>
c000380e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003812:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003816:	7e dd                	jle    c00037f5 <new_inode+0x6b>
c0003818:	eb 01                	jmp    c000381b <new_inode+0x91>
c000381a:	90                   	nop
c000381b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000381e:	89 d0                	mov    %edx,%eax
c0003820:	c1 e0 02             	shl    $0x2,%eax
c0003823:	01 d0                	add    %edx,%eax
c0003825:	c1 e0 03             	shl    $0x3,%eax
c0003828:	05 80 17 01 c0       	add    $0xc0011780,%eax
c000382d:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003830:	89 10                	mov    %edx,(%eax)
c0003832:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003835:	89 50 04             	mov    %edx,0x4(%eax)
c0003838:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000383b:	89 50 08             	mov    %edx,0x8(%eax)
c000383e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003841:	89 50 0c             	mov    %edx,0xc(%eax)
c0003844:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003847:	89 50 10             	mov    %edx,0x10(%eax)
c000384a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000384d:	89 50 14             	mov    %edx,0x14(%eax)
c0003850:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003853:	89 50 18             	mov    %edx,0x18(%eax)
c0003856:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003859:	89 50 1c             	mov    %edx,0x1c(%eax)
c000385c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000385f:	89 50 20             	mov    %edx,0x20(%eax)
c0003862:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003865:	89 50 24             	mov    %edx,0x24(%eax)
c0003868:	8b 45 08             	mov    0x8(%ebp),%eax
c000386b:	8b 55 c8             	mov    -0x38(%ebp),%edx
c000386e:	89 10                	mov    %edx,(%eax)
c0003870:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003873:	89 50 04             	mov    %edx,0x4(%eax)
c0003876:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003879:	89 50 08             	mov    %edx,0x8(%eax)
c000387c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c000387f:	89 50 0c             	mov    %edx,0xc(%eax)
c0003882:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003885:	89 50 10             	mov    %edx,0x10(%eax)
c0003888:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000388b:	89 50 14             	mov    %edx,0x14(%eax)
c000388e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003891:	89 50 18             	mov    %edx,0x18(%eax)
c0003894:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003897:	89 50 1c             	mov    %edx,0x1c(%eax)
c000389a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000389d:	89 50 20             	mov    %edx,0x20(%eax)
c00038a0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00038a3:	89 50 24             	mov    %edx,0x24(%eax)
c00038a6:	c9                   	leave  
c00038a7:	c3                   	ret    

c00038a8 <new_dir_entry>:
c00038a8:	55                   	push   %ebp
c00038a9:	89 e5                	mov    %esp,%ebp
c00038ab:	83 ec 48             	sub    $0x48,%esp
c00038ae:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c00038b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00038b8:	8b 40 04             	mov    0x4(%eax),%eax
c00038bb:	99                   	cltd   
c00038bc:	f7 7d dc             	idivl  -0x24(%ebp)
c00038bf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00038c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00038c5:	8b 40 0c             	mov    0xc(%eax),%eax
c00038c8:	99                   	cltd   
c00038c9:	f7 7d dc             	idivl  -0x24(%ebp)
c00038cc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00038cf:	e8 03 0c 00 00       	call   c00044d7 <get_super_block>
c00038d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00038d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00038da:	8b 00                	mov    (%eax),%eax
c00038dc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00038df:	8b 45 0c             	mov    0xc(%ebp),%eax
c00038e2:	8b 40 0c             	mov    0xc(%eax),%eax
c00038e5:	05 00 02 00 00       	add    $0x200,%eax
c00038ea:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00038f0:	85 c0                	test   %eax,%eax
c00038f2:	0f 48 c2             	cmovs  %edx,%eax
c00038f5:	c1 f8 09             	sar    $0x9,%eax
c00038f8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00038fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003902:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003909:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003910:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003917:	eb 7d                	jmp    c0003996 <new_dir_entry+0xee>
c0003919:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000391e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0003921:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003924:	01 ca                	add    %ecx,%edx
c0003926:	83 ec 0c             	sub    $0xc,%esp
c0003929:	6a 07                	push   $0x7
c000392b:	68 00 02 00 00       	push   $0x200
c0003930:	50                   	push   %eax
c0003931:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003934:	52                   	push   %edx
c0003935:	e8 75 ee ff ff       	call   c00027af <rd_wt>
c000393a:	83 c4 20             	add    $0x20,%esp
c000393d:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003942:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003945:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000394c:	eb 25                	jmp    c0003973 <new_dir_entry+0xcb>
c000394e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003952:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003955:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003958:	7f 29                	jg     c0003983 <new_dir_entry+0xdb>
c000395a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000395d:	8b 00                	mov    (%eax),%eax
c000395f:	85 c0                	test   %eax,%eax
c0003961:	75 08                	jne    c000396b <new_dir_entry+0xc3>
c0003963:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003966:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003969:	eb 19                	jmp    c0003984 <new_dir_entry+0xdc>
c000396b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000396f:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003973:	b8 00 02 00 00       	mov    $0x200,%eax
c0003978:	99                   	cltd   
c0003979:	f7 7d dc             	idivl  -0x24(%ebp)
c000397c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c000397f:	7c cd                	jl     c000394e <new_dir_entry+0xa6>
c0003981:	eb 01                	jmp    c0003984 <new_dir_entry+0xdc>
c0003983:	90                   	nop
c0003984:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003987:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c000398a:	7f 16                	jg     c00039a2 <new_dir_entry+0xfa>
c000398c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003990:	75 10                	jne    c00039a2 <new_dir_entry+0xfa>
c0003992:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003996:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003999:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c000399c:	0f 8c 77 ff ff ff    	jl     c0003919 <new_dir_entry+0x71>
c00039a2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00039a5:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c00039a8:	75 0a                	jne    c00039b4 <new_dir_entry+0x10c>
c00039aa:	b8 00 00 00 00       	mov    $0x0,%eax
c00039af:	e9 fa 00 00 00       	jmp    c0003aae <new_dir_entry+0x206>
c00039b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00039bb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00039bf:	75 1e                	jne    c00039df <new_dir_entry+0x137>
c00039c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00039c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00039ca:	8b 50 04             	mov    0x4(%eax),%edx
c00039cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00039d0:	01 c2                	add    %eax,%edx
c00039d2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00039d5:	89 50 04             	mov    %edx,0x4(%eax)
c00039d8:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c00039df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039e2:	8b 55 14             	mov    0x14(%ebp),%edx
c00039e5:	89 10                	mov    %edx,(%eax)
c00039e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039ea:	83 c0 04             	add    $0x4,%eax
c00039ed:	83 ec 08             	sub    $0x8,%esp
c00039f0:	ff 75 10             	pushl  0x10(%ebp)
c00039f3:	50                   	push   %eax
c00039f4:	e8 05 6b 00 00       	call   c000a4fe <Strcpy>
c00039f9:	83 c4 10             	add    $0x10,%esp
c00039fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00039ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003a02:	8b 0a                	mov    (%edx),%ecx
c0003a04:	89 08                	mov    %ecx,(%eax)
c0003a06:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003a09:	89 48 04             	mov    %ecx,0x4(%eax)
c0003a0c:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003a0f:	89 48 08             	mov    %ecx,0x8(%eax)
c0003a12:	8b 52 0c             	mov    0xc(%edx),%edx
c0003a15:	89 50 0c             	mov    %edx,0xc(%eax)
c0003a18:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003a1d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0003a20:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003a23:	01 ca                	add    %ecx,%edx
c0003a25:	83 ec 0c             	sub    $0xc,%esp
c0003a28:	6a 0a                	push   $0xa
c0003a2a:	68 00 02 00 00       	push   $0x200
c0003a2f:	50                   	push   %eax
c0003a30:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003a33:	52                   	push   %edx
c0003a34:	e8 76 ed ff ff       	call   c00027af <rd_wt>
c0003a39:	83 c4 20             	add    $0x20,%esp
c0003a3c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003a40:	74 69                	je     c0003aab <new_dir_entry+0x203>
c0003a42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a45:	8b 10                	mov    (%eax),%edx
c0003a47:	89 15 80 21 01 c0    	mov    %edx,0xc0012180
c0003a4d:	8b 50 04             	mov    0x4(%eax),%edx
c0003a50:	89 15 84 21 01 c0    	mov    %edx,0xc0012184
c0003a56:	8b 50 08             	mov    0x8(%eax),%edx
c0003a59:	89 15 88 21 01 c0    	mov    %edx,0xc0012188
c0003a5f:	8b 50 0c             	mov    0xc(%eax),%edx
c0003a62:	89 15 8c 21 01 c0    	mov    %edx,0xc001218c
c0003a68:	8b 50 10             	mov    0x10(%eax),%edx
c0003a6b:	89 15 90 21 01 c0    	mov    %edx,0xc0012190
c0003a71:	8b 50 14             	mov    0x14(%eax),%edx
c0003a74:	89 15 94 21 01 c0    	mov    %edx,0xc0012194
c0003a7a:	8b 50 18             	mov    0x18(%eax),%edx
c0003a7d:	89 15 98 21 01 c0    	mov    %edx,0xc0012198
c0003a83:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003a86:	89 15 9c 21 01 c0    	mov    %edx,0xc001219c
c0003a8c:	8b 50 20             	mov    0x20(%eax),%edx
c0003a8f:	89 15 a0 21 01 c0    	mov    %edx,0xc00121a0
c0003a95:	8b 40 24             	mov    0x24(%eax),%eax
c0003a98:	a3 a4 21 01 c0       	mov    %eax,0xc00121a4
c0003a9d:	83 ec 0c             	sub    $0xc,%esp
c0003aa0:	ff 75 0c             	pushl  0xc(%ebp)
c0003aa3:	e8 4b 08 00 00       	call   c00042f3 <sync_inode>
c0003aa8:	83 c4 10             	add    $0x10,%esp
c0003aab:	8b 45 08             	mov    0x8(%ebp),%eax
c0003aae:	c9                   	leave  
c0003aaf:	c3                   	ret    

c0003ab0 <do_unlink>:
c0003ab0:	55                   	push   %ebp
c0003ab1:	89 e5                	mov    %esp,%ebp
c0003ab3:	53                   	push   %ebx
c0003ab4:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003aba:	83 ec 08             	sub    $0x8,%esp
c0003abd:	ff 75 08             	pushl  0x8(%ebp)
c0003ac0:	68 7b 9b 00 c0       	push   $0xc0009b7b
c0003ac5:	e8 ef 5a 00 00       	call   c00095b9 <strcmp>
c0003aca:	83 c4 10             	add    $0x10,%esp
c0003acd:	85 c0                	test   %eax,%eax
c0003acf:	75 10                	jne    c0003ae1 <do_unlink+0x31>
c0003ad1:	83 ec 0c             	sub    $0xc,%esp
c0003ad4:	68 7d 9b 00 c0       	push   $0xc0009b7d
c0003ad9:	e8 56 4f 00 00       	call   c0008a34 <panic>
c0003ade:	83 c4 10             	add    $0x10,%esp
c0003ae1:	83 ec 0c             	sub    $0xc,%esp
c0003ae4:	ff 75 08             	pushl  0x8(%ebp)
c0003ae7:	e8 37 f5 ff ff       	call   c0003023 <search_file>
c0003aec:	83 c4 10             	add    $0x10,%esp
c0003aef:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003af2:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003af6:	75 10                	jne    c0003b08 <do_unlink+0x58>
c0003af8:	83 ec 0c             	sub    $0xc,%esp
c0003afb:	68 99 9b 00 c0       	push   $0xc0009b99
c0003b00:	e8 2f 4f 00 00       	call   c0008a34 <panic>
c0003b05:	83 c4 10             	add    $0x10,%esp
c0003b08:	83 ec 08             	sub    $0x8,%esp
c0003b0b:	ff 75 d0             	pushl  -0x30(%ebp)
c0003b0e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003b14:	50                   	push   %eax
c0003b15:	e8 05 f7 ff ff       	call   c000321f <get_inode>
c0003b1a:	83 c4 10             	add    $0x10,%esp
c0003b1d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003b20:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003b24:	75 10                	jne    c0003b36 <do_unlink+0x86>
c0003b26:	83 ec 0c             	sub    $0xc,%esp
c0003b29:	68 99 9b 00 c0       	push   $0xc0009b99
c0003b2e:	e8 01 4f 00 00       	call   c0008a34 <panic>
c0003b33:	83 c4 10             	add    $0x10,%esp
c0003b36:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003b39:	85 c0                	test   %eax,%eax
c0003b3b:	7e 10                	jle    c0003b4d <do_unlink+0x9d>
c0003b3d:	83 ec 0c             	sub    $0xc,%esp
c0003b40:	68 b4 9b 00 c0       	push   $0xc0009bb4
c0003b45:	e8 ea 4e 00 00       	call   c0008a34 <panic>
c0003b4a:	83 c4 10             	add    $0x10,%esp
c0003b4d:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003b53:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003b56:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003b59:	8d 50 07             	lea    0x7(%eax),%edx
c0003b5c:	85 c0                	test   %eax,%eax
c0003b5e:	0f 48 c2             	cmovs  %edx,%eax
c0003b61:	c1 f8 03             	sar    $0x3,%eax
c0003b64:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003b67:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003b6a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003b70:	85 c0                	test   %eax,%eax
c0003b72:	0f 48 c2             	cmovs  %edx,%eax
c0003b75:	c1 f8 09             	sar    $0x9,%eax
c0003b78:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003b7b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003b7e:	99                   	cltd   
c0003b7f:	c1 ea 1d             	shr    $0x1d,%edx
c0003b82:	01 d0                	add    %edx,%eax
c0003b84:	83 e0 07             	and    $0x7,%eax
c0003b87:	29 d0                	sub    %edx,%eax
c0003b89:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003b8c:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003b93:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003b98:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0003b9b:	83 c2 02             	add    $0x2,%edx
c0003b9e:	83 ec 0c             	sub    $0xc,%esp
c0003ba1:	6a 07                	push   $0x7
c0003ba3:	68 00 02 00 00       	push   $0x200
c0003ba8:	50                   	push   %eax
c0003ba9:	ff 75 b8             	pushl  -0x48(%ebp)
c0003bac:	52                   	push   %edx
c0003bad:	e8 fd eb ff ff       	call   c00027af <rd_wt>
c0003bb2:	83 c4 20             	add    $0x20,%esp
c0003bb5:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003bbb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003bbe:	01 d0                	add    %edx,%eax
c0003bc0:	0f b6 10             	movzbl (%eax),%edx
c0003bc3:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003bc6:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003bcb:	89 c1                	mov    %eax,%ecx
c0003bcd:	d3 e3                	shl    %cl,%ebx
c0003bcf:	89 d8                	mov    %ebx,%eax
c0003bd1:	f7 d0                	not    %eax
c0003bd3:	89 c3                	mov    %eax,%ebx
c0003bd5:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0003bdb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003bde:	01 c8                	add    %ecx,%eax
c0003be0:	21 da                	and    %ebx,%edx
c0003be2:	88 10                	mov    %dl,(%eax)
c0003be4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003be9:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0003bec:	83 c2 02             	add    $0x2,%edx
c0003bef:	83 ec 0c             	sub    $0xc,%esp
c0003bf2:	6a 0a                	push   $0xa
c0003bf4:	68 00 02 00 00       	push   $0x200
c0003bf9:	50                   	push   %eax
c0003bfa:	ff 75 b8             	pushl  -0x48(%ebp)
c0003bfd:	52                   	push   %edx
c0003bfe:	e8 ac eb ff ff       	call   c00027af <rd_wt>
c0003c03:	83 c4 20             	add    $0x20,%esp
c0003c06:	e8 cc 08 00 00       	call   c00044d7 <get_super_block>
c0003c0b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003c0e:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003c14:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003c17:	8b 00                	mov    (%eax),%eax
c0003c19:	29 c2                	sub    %eax,%edx
c0003c1b:	89 d0                	mov    %edx,%eax
c0003c1d:	83 c0 01             	add    $0x1,%eax
c0003c20:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003c23:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003c26:	8d 50 07             	lea    0x7(%eax),%edx
c0003c29:	85 c0                	test   %eax,%eax
c0003c2b:	0f 48 c2             	cmovs  %edx,%eax
c0003c2e:	c1 f8 03             	sar    $0x3,%eax
c0003c31:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003c34:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003c37:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003c3d:	85 c0                	test   %eax,%eax
c0003c3f:	0f 48 c2             	cmovs  %edx,%eax
c0003c42:	c1 f8 09             	sar    $0x9,%eax
c0003c45:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003c48:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003c4b:	99                   	cltd   
c0003c4c:	c1 ea 1d             	shr    $0x1d,%edx
c0003c4f:	01 d0                	add    %edx,%eax
c0003c51:	83 e0 07             	and    $0x7,%eax
c0003c54:	29 d0                	sub    %edx,%eax
c0003c56:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003c59:	b8 08 00 00 00       	mov    $0x8,%eax
c0003c5e:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003c61:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003c64:	29 c2                	sub    %eax,%edx
c0003c66:	89 d0                	mov    %edx,%eax
c0003c68:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003c6e:	8d 50 07             	lea    0x7(%eax),%edx
c0003c71:	85 c0                	test   %eax,%eax
c0003c73:	0f 48 c2             	cmovs  %edx,%eax
c0003c76:	c1 f8 03             	sar    $0x3,%eax
c0003c79:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003c7c:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003c81:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0003c84:	8b 52 04             	mov    0x4(%edx),%edx
c0003c87:	8d 4a 02             	lea    0x2(%edx),%ecx
c0003c8a:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003c8d:	01 ca                	add    %ecx,%edx
c0003c8f:	83 ec 0c             	sub    $0xc,%esp
c0003c92:	6a 07                	push   $0x7
c0003c94:	68 00 02 00 00       	push   $0x200
c0003c99:	50                   	push   %eax
c0003c9a:	ff 75 b8             	pushl  -0x48(%ebp)
c0003c9d:	52                   	push   %edx
c0003c9e:	e8 0c eb ff ff       	call   c00027af <rd_wt>
c0003ca3:	83 c4 20             	add    $0x20,%esp
c0003ca6:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003cac:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003caf:	01 d0                	add    %edx,%eax
c0003cb1:	0f b6 10             	movzbl (%eax),%edx
c0003cb4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003cb7:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003cbc:	89 c1                	mov    %eax,%ecx
c0003cbe:	d3 e3                	shl    %cl,%ebx
c0003cc0:	89 d8                	mov    %ebx,%eax
c0003cc2:	f7 d0                	not    %eax
c0003cc4:	89 c3                	mov    %eax,%ebx
c0003cc6:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0003ccc:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003ccf:	01 c8                	add    %ecx,%eax
c0003cd1:	21 da                	and    %ebx,%edx
c0003cd3:	88 10                	mov    %dl,(%eax)
c0003cd5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003cdc:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003cdf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003ce2:	eb 6a                	jmp    c0003d4e <do_unlink+0x29e>
c0003ce4:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003ceb:	75 4b                	jne    c0003d38 <do_unlink+0x288>
c0003ced:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003cf4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003cf9:	83 ec 0c             	sub    $0xc,%esp
c0003cfc:	6a 0a                	push   $0xa
c0003cfe:	68 00 02 00 00       	push   $0x200
c0003d03:	50                   	push   %eax
c0003d04:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d07:	ff 75 ec             	pushl  -0x14(%ebp)
c0003d0a:	e8 a0 ea ff ff       	call   c00027af <rd_wt>
c0003d0f:	83 c4 20             	add    $0x20,%esp
c0003d12:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003d18:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003d1b:	8d 48 01             	lea    0x1(%eax),%ecx
c0003d1e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0003d21:	83 ec 0c             	sub    $0xc,%esp
c0003d24:	6a 07                	push   $0x7
c0003d26:	68 00 02 00 00       	push   $0x200
c0003d2b:	52                   	push   %edx
c0003d2c:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d2f:	50                   	push   %eax
c0003d30:	e8 7a ea ff ff       	call   c00027af <rd_wt>
c0003d35:	83 c4 20             	add    $0x20,%esp
c0003d38:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003d3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d41:	01 d0                	add    %edx,%eax
c0003d43:	c6 00 00             	movb   $0x0,(%eax)
c0003d46:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003d4a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003d4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d51:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003d54:	7c 8e                	jl     c0003ce4 <do_unlink+0x234>
c0003d56:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003d5d:	75 4b                	jne    c0003daa <do_unlink+0x2fa>
c0003d5f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003d66:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003d6b:	83 ec 0c             	sub    $0xc,%esp
c0003d6e:	6a 0a                	push   $0xa
c0003d70:	68 00 02 00 00       	push   $0x200
c0003d75:	50                   	push   %eax
c0003d76:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d79:	ff 75 ec             	pushl  -0x14(%ebp)
c0003d7c:	e8 2e ea ff ff       	call   c00027af <rd_wt>
c0003d81:	83 c4 20             	add    $0x20,%esp
c0003d84:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003d8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003d8d:	8d 48 01             	lea    0x1(%eax),%ecx
c0003d90:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0003d93:	83 ec 0c             	sub    $0xc,%esp
c0003d96:	6a 07                	push   $0x7
c0003d98:	68 00 02 00 00       	push   $0x200
c0003d9d:	52                   	push   %edx
c0003d9e:	ff 75 b8             	pushl  -0x48(%ebp)
c0003da1:	50                   	push   %eax
c0003da2:	e8 08 ea ff ff       	call   c00027af <rd_wt>
c0003da7:	83 c4 20             	add    $0x20,%esp
c0003daa:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003db0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003db3:	01 d0                	add    %edx,%eax
c0003db5:	0f b6 10             	movzbl (%eax),%edx
c0003db8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003dbb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003dc0:	89 c1                	mov    %eax,%ecx
c0003dc2:	d3 e3                	shl    %cl,%ebx
c0003dc4:	89 d8                	mov    %ebx,%eax
c0003dc6:	89 c3                	mov    %eax,%ebx
c0003dc8:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0003dce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003dd1:	01 c8                	add    %ecx,%eax
c0003dd3:	21 da                	and    %ebx,%edx
c0003dd5:	88 10                	mov    %dl,(%eax)
c0003dd7:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003ddc:	83 ec 0c             	sub    $0xc,%esp
c0003ddf:	6a 0a                	push   $0xa
c0003de1:	68 00 02 00 00       	push   $0x200
c0003de6:	50                   	push   %eax
c0003de7:	ff 75 b8             	pushl  -0x48(%ebp)
c0003dea:	ff 75 ec             	pushl  -0x14(%ebp)
c0003ded:	e8 bd e9 ff ff       	call   c00027af <rd_wt>
c0003df2:	83 c4 20             	add    $0x20,%esp
c0003df5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0003dfc:	00 00 00 
c0003dff:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0003e06:	00 00 00 
c0003e09:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0003e10:	00 00 00 
c0003e13:	83 ec 0c             	sub    $0xc,%esp
c0003e16:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003e1c:	50                   	push   %eax
c0003e1d:	e8 d1 04 00 00       	call   c00042f3 <sync_inode>
c0003e22:	83 c4 10             	add    $0x10,%esp
c0003e25:	83 ec 0c             	sub    $0xc,%esp
c0003e28:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003e2e:	50                   	push   %eax
c0003e2f:	e8 13 06 00 00       	call   c0004447 <put_inode>
c0003e34:	83 c4 10             	add    $0x10,%esp
c0003e37:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003e3a:	8b 00                	mov    (%eax),%eax
c0003e3c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0003e3f:	c7 45 98 80 21 01 c0 	movl   $0xc0012180,-0x68(%ebp)
c0003e46:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003e49:	8b 40 04             	mov    0x4(%eax),%eax
c0003e4c:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0003e4f:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003e52:	8b 40 0c             	mov    0xc(%eax),%eax
c0003e55:	89 45 90             	mov    %eax,-0x70(%ebp)
c0003e58:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0003e5b:	c1 e8 04             	shr    $0x4,%eax
c0003e5e:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0003e61:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003e68:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003e6f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003e76:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0003e7d:	e9 a3 00 00 00       	jmp    c0003f25 <do_unlink+0x475>
c0003e82:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003e87:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c0003e8a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003e8d:	01 ca                	add    %ecx,%edx
c0003e8f:	83 ec 0c             	sub    $0xc,%esp
c0003e92:	6a 07                	push   $0x7
c0003e94:	68 00 02 00 00       	push   $0x200
c0003e99:	50                   	push   %eax
c0003e9a:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e9d:	52                   	push   %edx
c0003e9e:	e8 0c e9 ff ff       	call   c00027af <rd_wt>
c0003ea3:	83 c4 20             	add    $0x20,%esp
c0003ea6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003eab:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003eae:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0003eb5:	eb 51                	jmp    c0003f08 <do_unlink+0x458>
c0003eb7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003ebb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003ebe:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003ec1:	7f 4f                	jg     c0003f12 <do_unlink+0x462>
c0003ec3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003ec6:	83 c0 10             	add    $0x10,%eax
c0003ec9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003ecc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003ecf:	83 c0 04             	add    $0x4,%eax
c0003ed2:	83 ec 08             	sub    $0x8,%esp
c0003ed5:	ff 75 08             	pushl  0x8(%ebp)
c0003ed8:	50                   	push   %eax
c0003ed9:	e8 db 56 00 00       	call   c00095b9 <strcmp>
c0003ede:	83 c4 10             	add    $0x10,%esp
c0003ee1:	85 c0                	test   %eax,%eax
c0003ee3:	75 1b                	jne    c0003f00 <do_unlink+0x450>
c0003ee5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003eec:	83 ec 04             	sub    $0x4,%esp
c0003eef:	6a 10                	push   $0x10
c0003ef1:	6a 00                	push   $0x0
c0003ef3:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003ef6:	e8 e4 65 00 00       	call   c000a4df <Memset>
c0003efb:	83 c4 10             	add    $0x10,%esp
c0003efe:	eb 13                	jmp    c0003f13 <do_unlink+0x463>
c0003f00:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0003f04:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0003f08:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003f0b:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003f0e:	7c a7                	jl     c0003eb7 <do_unlink+0x407>
c0003f10:	eb 01                	jmp    c0003f13 <do_unlink+0x463>
c0003f12:	90                   	nop
c0003f13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003f16:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003f19:	7f 16                	jg     c0003f31 <do_unlink+0x481>
c0003f1b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003f1f:	75 10                	jne    c0003f31 <do_unlink+0x481>
c0003f21:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0003f25:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003f28:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003f2b:	0f 8c 51 ff ff ff    	jl     c0003e82 <do_unlink+0x3d2>
c0003f31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003f34:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003f37:	75 17                	jne    c0003f50 <do_unlink+0x4a0>
c0003f39:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003f3c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003f3f:	89 50 04             	mov    %edx,0x4(%eax)
c0003f42:	83 ec 0c             	sub    $0xc,%esp
c0003f45:	ff 75 98             	pushl  -0x68(%ebp)
c0003f48:	e8 a6 03 00 00       	call   c00042f3 <sync_inode>
c0003f4d:	83 c4 10             	add    $0x10,%esp
c0003f50:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003f54:	74 24                	je     c0003f7a <do_unlink+0x4ca>
c0003f56:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003f5b:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c0003f5e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003f61:	01 ca                	add    %ecx,%edx
c0003f63:	83 ec 0c             	sub    $0xc,%esp
c0003f66:	6a 0a                	push   $0xa
c0003f68:	68 00 02 00 00       	push   $0x200
c0003f6d:	50                   	push   %eax
c0003f6e:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f71:	52                   	push   %edx
c0003f72:	e8 38 e8 ff ff       	call   c00027af <rd_wt>
c0003f77:	83 c4 20             	add    $0x20,%esp
c0003f7a:	90                   	nop
c0003f7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003f7e:	c9                   	leave  
c0003f7f:	c3                   	ret    

c0003f80 <do_rdwt>:
c0003f80:	55                   	push   %ebp
c0003f81:	89 e5                	mov    %esp,%ebp
c0003f83:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0003f89:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f8c:	8b 40 68             	mov    0x68(%eax),%eax
c0003f8f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003f92:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f95:	8b 40 50             	mov    0x50(%eax),%eax
c0003f98:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003f9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f9e:	8b 40 5c             	mov    0x5c(%eax),%eax
c0003fa1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003fa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0003fa7:	8b 00                	mov    (%eax),%eax
c0003fa9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003fac:	8b 45 08             	mov    0x8(%ebp),%eax
c0003faf:	8b 40 10             	mov    0x10(%eax),%eax
c0003fb2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003fb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0003fb8:	8b 40 40             	mov    0x40(%eax),%eax
c0003fbb:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003fbe:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003fc1:	6b d0 6b             	imul   $0x6b,%eax,%edx
c0003fc4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003fc7:	01 d0                	add    %edx,%eax
c0003fc9:	83 c0 0c             	add    $0xc,%eax
c0003fcc:	8b 04 85 cc 21 08 c0 	mov    -0x3ff7de34(,%eax,4),%eax
c0003fd3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003fd6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003fd9:	8b 40 08             	mov    0x8(%eax),%eax
c0003fdc:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003fdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0003fe2:	8b 00                	mov    (%eax),%eax
c0003fe4:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003fe7:	83 ec 08             	sub    $0x8,%esp
c0003fea:	ff 75 c0             	pushl  -0x40(%ebp)
c0003fed:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003ff3:	50                   	push   %eax
c0003ff4:	e8 26 f2 ff ff       	call   c000321f <get_inode>
c0003ff9:	83 c4 10             	add    $0x10,%esp
c0003ffc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0003fff:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c0004003:	75 10                	jne    c0004015 <do_rdwt+0x95>
c0004005:	83 ec 0c             	sub    $0xc,%esp
c0004008:	68 ec 9b 00 c0       	push   $0xc0009bec
c000400d:	e8 22 4a 00 00       	call   c0008a34 <panic>
c0004012:	83 c4 10             	add    $0x10,%esp
c0004015:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000401b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000401e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004021:	8b 40 04             	mov    0x4(%eax),%eax
c0004024:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0004027:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c000402b:	74 22                	je     c000404f <do_rdwt+0xcf>
c000402d:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004031:	74 1c                	je     c000404f <do_rdwt+0xcf>
c0004033:	68 ba 04 00 00       	push   $0x4ba
c0004038:	68 d0 9a 00 c0       	push   $0xc0009ad0
c000403d:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0004042:	68 fc 9b 00 c0       	push   $0xc0009bfc
c0004047:	e8 06 4a 00 00       	call   c0008a52 <assertion_failure>
c000404c:	83 c4 10             	add    $0x10,%esp
c000404f:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c0004055:	83 f8 01             	cmp    $0x1,%eax
c0004058:	75 4a                	jne    c00040a4 <do_rdwt+0x124>
c000405a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000405e:	75 09                	jne    c0004069 <do_rdwt+0xe9>
c0004060:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0004067:	eb 0d                	jmp    c0004076 <do_rdwt+0xf6>
c0004069:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c000406d:	75 07                	jne    c0004076 <do_rdwt+0xf6>
c000406f:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0004076:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004079:	8b 45 08             	mov    0x8(%ebp),%eax
c000407c:	89 50 68             	mov    %edx,0x68(%eax)
c000407f:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0004082:	8b 45 08             	mov    0x8(%ebp),%eax
c0004085:	89 50 58             	mov    %edx,0x58(%eax)
c0004088:	83 ec 04             	sub    $0x4,%esp
c000408b:	6a 00                	push   $0x0
c000408d:	ff 75 08             	pushl  0x8(%ebp)
c0004090:	6a 03                	push   $0x3
c0004092:	e8 33 52 00 00       	call   c00092ca <send_rec>
c0004097:	83 c4 10             	add    $0x10,%esp
c000409a:	b8 00 00 00 00       	mov    $0x0,%eax
c000409f:	e9 4d 02 00 00       	jmp    c00042f1 <do_rdwt+0x371>
c00040a4:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00040a8:	75 12                	jne    c00040bc <do_rdwt+0x13c>
c00040aa:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00040ad:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
c00040b0:	75 0a                	jne    c00040bc <do_rdwt+0x13c>
c00040b2:	b8 00 00 00 00       	mov    $0x0,%eax
c00040b7:	e9 35 02 00 00       	jmp    c00042f1 <do_rdwt+0x371>
c00040bc:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00040c0:	75 18                	jne    c00040da <do_rdwt+0x15a>
c00040c2:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00040c8:	c1 e0 09             	shl    $0x9,%eax
c00040cb:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00040ce:	75 0a                	jne    c00040da <do_rdwt+0x15a>
c00040d0:	b8 00 00 00 00       	mov    $0x0,%eax
c00040d5:	e9 17 02 00 00       	jmp    c00042f1 <do_rdwt+0x371>
c00040da:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00040de:	75 14                	jne    c00040f4 <do_rdwt+0x174>
c00040e0:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00040e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00040e6:	01 d0                	add    %edx,%eax
c00040e8:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c00040eb:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
c00040ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00040f2:	eb 19                	jmp    c000410d <do_rdwt+0x18d>
c00040f4:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00040f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00040fa:	01 c2                	add    %eax,%edx
c00040fc:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0004102:	c1 e0 09             	shl    $0x9,%eax
c0004105:	39 c2                	cmp    %eax,%edx
c0004107:	0f 4e c2             	cmovle %edx,%eax
c000410a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000410d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004110:	99                   	cltd   
c0004111:	c1 ea 17             	shr    $0x17,%edx
c0004114:	01 d0                	add    %edx,%eax
c0004116:	25 ff 01 00 00       	and    $0x1ff,%eax
c000411b:	29 d0                	sub    %edx,%eax
c000411d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004120:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0004126:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0004129:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c000412f:	85 c0                	test   %eax,%eax
c0004131:	0f 48 c1             	cmovs  %ecx,%eax
c0004134:	c1 f8 09             	sar    $0x9,%eax
c0004137:	01 d0                	add    %edx,%eax
c0004139:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000413c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0004142:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004145:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c000414b:	85 c0                	test   %eax,%eax
c000414d:	0f 48 c1             	cmovs  %ecx,%eax
c0004150:	c1 f8 09             	sar    $0x9,%eax
c0004153:	01 d0                	add    %edx,%eax
c0004155:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004158:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000415b:	2b 45 ac             	sub    -0x54(%ebp),%eax
c000415e:	ba 00 00 10 00       	mov    $0x100000,%edx
c0004163:	39 d0                	cmp    %edx,%eax
c0004165:	7d 0b                	jge    c0004172 <do_rdwt+0x1f2>
c0004167:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000416a:	2b 45 ac             	sub    -0x54(%ebp),%eax
c000416d:	83 c0 01             	add    $0x1,%eax
c0004170:	eb 05                	jmp    c0004177 <do_rdwt+0x1f7>
c0004172:	b8 00 00 10 00       	mov    $0x100000,%eax
c0004177:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c000417a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000417d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004180:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004187:	8b 45 08             	mov    0x8(%ebp),%eax
c000418a:	8b 00                	mov    (%eax),%eax
c000418c:	83 ec 0c             	sub    $0xc,%esp
c000418f:	50                   	push   %eax
c0004190:	e8 09 05 00 00       	call   c000469e <pid2proc>
c0004195:	83 c4 10             	add    $0x10,%esp
c0004198:	89 45 a0             	mov    %eax,-0x60(%ebp)
c000419b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000419e:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c00041a4:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00041a7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00041aa:	83 ec 08             	sub    $0x8,%esp
c00041ad:	ff 75 a0             	pushl  -0x60(%ebp)
c00041b0:	50                   	push   %eax
c00041b1:	e8 d1 05 00 00       	call   c0004787 <Seg2PhyAddrLDT>
c00041b6:	83 c4 10             	add    $0x10,%esp
c00041b9:	89 45 98             	mov    %eax,-0x68(%ebp)
c00041bc:	8b 55 98             	mov    -0x68(%ebp),%edx
c00041bf:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00041c2:	01 d0                	add    %edx,%eax
c00041c4:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00041c7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00041ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00041cd:	e9 c7 00 00 00       	jmp    c0004299 <do_rdwt+0x319>
c00041d2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00041d5:	c1 e0 09             	shl    $0x9,%eax
c00041d8:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00041db:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00041de:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c00041e2:	89 45 90             	mov    %eax,-0x70(%ebp)
c00041e5:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
c00041ec:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00041ef:	c1 e0 09             	shl    $0x9,%eax
c00041f2:	89 c2                	mov    %eax,%edx
c00041f4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00041f9:	83 ec 0c             	sub    $0xc,%esp
c00041fc:	6a 07                	push   $0x7
c00041fe:	52                   	push   %edx
c00041ff:	50                   	push   %eax
c0004200:	ff 75 8c             	pushl  -0x74(%ebp)
c0004203:	ff 75 e0             	pushl  -0x20(%ebp)
c0004206:	e8 a4 e5 ff ff       	call   c00027af <rd_wt>
c000420b:	83 c4 20             	add    $0x20,%esp
c000420e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004212:	75 25                	jne    c0004239 <do_rdwt+0x2b9>
c0004214:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000421a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000421d:	01 d0                	add    %edx,%eax
c000421f:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c0004222:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0004225:	01 ca                	add    %ecx,%edx
c0004227:	83 ec 04             	sub    $0x4,%esp
c000422a:	ff 75 90             	pushl  -0x70(%ebp)
c000422d:	50                   	push   %eax
c000422e:	52                   	push   %edx
c000422f:	e8 7d 62 00 00       	call   c000a4b1 <Memcpy>
c0004234:	83 c4 10             	add    $0x10,%esp
c0004237:	eb 47                	jmp    c0004280 <do_rdwt+0x300>
c0004239:	8b 55 94             	mov    -0x6c(%ebp),%edx
c000423c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000423f:	01 d0                	add    %edx,%eax
c0004241:	89 c1                	mov    %eax,%ecx
c0004243:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0004249:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000424c:	01 d0                	add    %edx,%eax
c000424e:	83 ec 04             	sub    $0x4,%esp
c0004251:	ff 75 90             	pushl  -0x70(%ebp)
c0004254:	51                   	push   %ecx
c0004255:	50                   	push   %eax
c0004256:	e8 56 62 00 00       	call   c000a4b1 <Memcpy>
c000425b:	83 c4 10             	add    $0x10,%esp
c000425e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004261:	c1 e0 09             	shl    $0x9,%eax
c0004264:	89 c2                	mov    %eax,%edx
c0004266:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000426b:	83 ec 0c             	sub    $0xc,%esp
c000426e:	6a 0a                	push   $0xa
c0004270:	52                   	push   %edx
c0004271:	50                   	push   %eax
c0004272:	ff 75 8c             	pushl  -0x74(%ebp)
c0004275:	ff 75 e0             	pushl  -0x20(%ebp)
c0004278:	e8 32 e5 ff ff       	call   c00027af <rd_wt>
c000427d:	83 c4 20             	add    $0x20,%esp
c0004280:	8b 45 90             	mov    -0x70(%ebp),%eax
c0004283:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004286:	8b 45 90             	mov    -0x70(%ebp),%eax
c0004289:	01 45 e4             	add    %eax,-0x1c(%ebp)
c000428c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004293:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004296:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004299:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000429c:	3b 45 a8             	cmp    -0x58(%ebp),%eax
c000429f:	7f 0a                	jg     c00042ab <do_rdwt+0x32b>
c00042a1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00042a5:	0f 85 27 ff ff ff    	jne    c00041d2 <do_rdwt+0x252>
c00042ab:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00042ae:	8b 50 04             	mov    0x4(%eax),%edx
c00042b1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042b4:	01 c2                	add    %eax,%edx
c00042b6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00042b9:	89 50 04             	mov    %edx,0x4(%eax)
c00042bc:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00042bf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042c2:	01 c2                	add    %eax,%edx
c00042c4:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00042ca:	39 c2                	cmp    %eax,%edx
c00042cc:	7e 20                	jle    c00042ee <do_rdwt+0x36e>
c00042ce:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00042d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042d4:	01 d0                	add    %edx,%eax
c00042d6:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c00042dc:	83 ec 0c             	sub    $0xc,%esp
c00042df:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00042e5:	50                   	push   %eax
c00042e6:	e8 08 00 00 00       	call   c00042f3 <sync_inode>
c00042eb:	83 c4 10             	add    $0x10,%esp
c00042ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00042f1:	c9                   	leave  
c00042f2:	c3                   	ret    

c00042f3 <sync_inode>:
c00042f3:	55                   	push   %ebp
c00042f4:	89 e5                	mov    %esp,%ebp
c00042f6:	53                   	push   %ebx
c00042f7:	83 ec 34             	sub    $0x34,%esp
c00042fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004301:	eb 74                	jmp    c0004377 <sync_inode+0x84>
c0004303:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004306:	89 d0                	mov    %edx,%eax
c0004308:	c1 e0 02             	shl    $0x2,%eax
c000430b:	01 d0                	add    %edx,%eax
c000430d:	c1 e0 03             	shl    $0x3,%eax
c0004310:	05 90 17 01 c0       	add    $0xc0011790,%eax
c0004315:	8b 10                	mov    (%eax),%edx
c0004317:	8b 45 08             	mov    0x8(%ebp),%eax
c000431a:	8b 40 10             	mov    0x10(%eax),%eax
c000431d:	39 c2                	cmp    %eax,%edx
c000431f:	75 52                	jne    c0004373 <sync_inode+0x80>
c0004321:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004324:	89 d0                	mov    %edx,%eax
c0004326:	c1 e0 02             	shl    $0x2,%eax
c0004329:	01 d0                	add    %edx,%eax
c000432b:	c1 e0 03             	shl    $0x3,%eax
c000432e:	8d 90 80 17 01 c0    	lea    -0x3ffee880(%eax),%edx
c0004334:	8b 45 08             	mov    0x8(%ebp),%eax
c0004337:	8b 08                	mov    (%eax),%ecx
c0004339:	89 0a                	mov    %ecx,(%edx)
c000433b:	8b 48 04             	mov    0x4(%eax),%ecx
c000433e:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004341:	8b 48 08             	mov    0x8(%eax),%ecx
c0004344:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004347:	8b 48 0c             	mov    0xc(%eax),%ecx
c000434a:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000434d:	8b 48 10             	mov    0x10(%eax),%ecx
c0004350:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004353:	8b 48 14             	mov    0x14(%eax),%ecx
c0004356:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004359:	8b 48 18             	mov    0x18(%eax),%ecx
c000435c:	89 4a 18             	mov    %ecx,0x18(%edx)
c000435f:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004362:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004365:	8b 48 20             	mov    0x20(%eax),%ecx
c0004368:	89 4a 20             	mov    %ecx,0x20(%edx)
c000436b:	8b 40 24             	mov    0x24(%eax),%eax
c000436e:	89 42 24             	mov    %eax,0x24(%edx)
c0004371:	eb 0a                	jmp    c000437d <sync_inode+0x8a>
c0004373:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004377:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c000437b:	7e 86                	jle    c0004303 <sync_inode+0x10>
c000437d:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004384:	8b 45 08             	mov    0x8(%ebp),%eax
c0004387:	8b 40 10             	mov    0x10(%eax),%eax
c000438a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000438d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004390:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004393:	b8 00 02 00 00       	mov    $0x200,%eax
c0004398:	99                   	cltd   
c0004399:	f7 7d f0             	idivl  -0x10(%ebp)
c000439c:	89 c3                	mov    %eax,%ebx
c000439e:	89 c8                	mov    %ecx,%eax
c00043a0:	99                   	cltd   
c00043a1:	f7 fb                	idiv   %ebx
c00043a3:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00043a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00043a9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00043ac:	b8 00 02 00 00       	mov    $0x200,%eax
c00043b1:	99                   	cltd   
c00043b2:	f7 7d f0             	idivl  -0x10(%ebp)
c00043b5:	89 c3                	mov    %eax,%ebx
c00043b7:	89 c8                	mov    %ecx,%eax
c00043b9:	99                   	cltd   
c00043ba:	f7 fb                	idiv   %ebx
c00043bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00043bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00043c2:	8b 40 20             	mov    0x20(%eax),%eax
c00043c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00043c8:	e8 0a 01 00 00       	call   c00044d7 <get_super_block>
c00043cd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00043d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00043d3:	8b 40 04             	mov    0x4(%eax),%eax
c00043d6:	8d 50 02             	lea    0x2(%eax),%edx
c00043d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00043dc:	8b 40 08             	mov    0x8(%eax),%eax
c00043df:	01 c2                	add    %eax,%edx
c00043e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043e4:	01 d0                	add    %edx,%eax
c00043e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00043e9:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00043ee:	83 ec 0c             	sub    $0xc,%esp
c00043f1:	6a 07                	push   $0x7
c00043f3:	68 00 02 00 00       	push   $0x200
c00043f8:	50                   	push   %eax
c00043f9:	ff 75 e0             	pushl  -0x20(%ebp)
c00043fc:	ff 75 d8             	pushl  -0x28(%ebp)
c00043ff:	e8 ab e3 ff ff       	call   c00027af <rd_wt>
c0004404:	83 c4 20             	add    $0x20,%esp
c0004407:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000440c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000440f:	83 ec 04             	sub    $0x4,%esp
c0004412:	ff 75 f0             	pushl  -0x10(%ebp)
c0004415:	ff 75 08             	pushl  0x8(%ebp)
c0004418:	ff 75 d4             	pushl  -0x2c(%ebp)
c000441b:	e8 91 60 00 00       	call   c000a4b1 <Memcpy>
c0004420:	83 c4 10             	add    $0x10,%esp
c0004423:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0004428:	83 ec 0c             	sub    $0xc,%esp
c000442b:	6a 0a                	push   $0xa
c000442d:	68 00 02 00 00       	push   $0x200
c0004432:	50                   	push   %eax
c0004433:	ff 75 e0             	pushl  -0x20(%ebp)
c0004436:	ff 75 d8             	pushl  -0x28(%ebp)
c0004439:	e8 71 e3 ff ff       	call   c00027af <rd_wt>
c000443e:	83 c4 20             	add    $0x20,%esp
c0004441:	90                   	nop
c0004442:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004445:	c9                   	leave  
c0004446:	c3                   	ret    

c0004447 <put_inode>:
c0004447:	55                   	push   %ebp
c0004448:	89 e5                	mov    %esp,%ebp
c000444a:	83 ec 08             	sub    $0x8,%esp
c000444d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004450:	8b 40 24             	mov    0x24(%eax),%eax
c0004453:	85 c0                	test   %eax,%eax
c0004455:	7f 1c                	jg     c0004473 <put_inode+0x2c>
c0004457:	68 54 05 00 00       	push   $0x554
c000445c:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0004461:	68 d0 9a 00 c0       	push   $0xc0009ad0
c0004466:	68 30 9c 00 c0       	push   $0xc0009c30
c000446b:	e8 e2 45 00 00       	call   c0008a52 <assertion_failure>
c0004470:	83 c4 10             	add    $0x10,%esp
c0004473:	8b 45 08             	mov    0x8(%ebp),%eax
c0004476:	8b 40 24             	mov    0x24(%eax),%eax
c0004479:	8d 50 ff             	lea    -0x1(%eax),%edx
c000447c:	8b 45 08             	mov    0x8(%ebp),%eax
c000447f:	89 50 24             	mov    %edx,0x24(%eax)
c0004482:	90                   	nop
c0004483:	c9                   	leave  
c0004484:	c3                   	ret    

c0004485 <do_close>:
c0004485:	55                   	push   %ebp
c0004486:	89 e5                	mov    %esp,%ebp
c0004488:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c000448d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004490:	83 c2 0c             	add    $0xc,%edx
c0004493:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0004497:	8b 50 0c             	mov    0xc(%eax),%edx
c000449a:	83 ea 01             	sub    $0x1,%edx
c000449d:	89 50 0c             	mov    %edx,0xc(%eax)
c00044a0:	8b 40 0c             	mov    0xc(%eax),%eax
c00044a3:	85 c0                	test   %eax,%eax
c00044a5:	75 16                	jne    c00044bd <do_close+0x38>
c00044a7:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c00044ac:	8b 55 08             	mov    0x8(%ebp),%edx
c00044af:	83 c2 0c             	add    $0xc,%edx
c00044b2:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c00044b6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00044bd:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c00044c2:	8b 55 08             	mov    0x8(%ebp),%edx
c00044c5:	83 c2 0c             	add    $0xc,%edx
c00044c8:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c00044cf:	00 
c00044d0:	b8 00 00 00 00       	mov    $0x0,%eax
c00044d5:	5d                   	pop    %ebp
c00044d6:	c3                   	ret    

c00044d7 <get_super_block>:
c00044d7:	55                   	push   %ebp
c00044d8:	89 e5                	mov    %esp,%ebp
c00044da:	83 ec 08             	sub    $0x8,%esp
c00044dd:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00044e2:	83 ec 0c             	sub    $0xc,%esp
c00044e5:	6a 07                	push   $0x7
c00044e7:	68 00 02 00 00       	push   $0x200
c00044ec:	50                   	push   %eax
c00044ed:	6a 20                	push   $0x20
c00044ef:	6a 01                	push   $0x1
c00044f1:	e8 b9 e2 ff ff       	call   c00027af <rd_wt>
c00044f6:	83 c4 20             	add    $0x20,%esp
c00044f9:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00044ff:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c0004504:	8b 0a                	mov    (%edx),%ecx
c0004506:	89 08                	mov    %ecx,(%eax)
c0004508:	8b 4a 04             	mov    0x4(%edx),%ecx
c000450b:	89 48 04             	mov    %ecx,0x4(%eax)
c000450e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0004511:	89 48 08             	mov    %ecx,0x8(%eax)
c0004514:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004517:	89 48 0c             	mov    %ecx,0xc(%eax)
c000451a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000451d:	89 48 10             	mov    %ecx,0x10(%eax)
c0004520:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004523:	89 48 14             	mov    %ecx,0x14(%eax)
c0004526:	8b 4a 18             	mov    0x18(%edx),%ecx
c0004529:	89 48 18             	mov    %ecx,0x18(%eax)
c000452c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000452f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004532:	8b 52 20             	mov    0x20(%edx),%edx
c0004535:	89 50 20             	mov    %edx,0x20(%eax)
c0004538:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c000453d:	c9                   	leave  
c000453e:	c3                   	ret    

c000453f <check>:
c000453f:	55                   	push   %ebp
c0004540:	89 e5                	mov    %esp,%ebp
c0004542:	83 ec 18             	sub    $0x18,%esp
c0004545:	c7 45 f4 c0 21 08 c0 	movl   $0xc00821c0,-0xc(%ebp)
c000454c:	eb 59                	jmp    c00045a7 <check+0x68>
c000454e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004551:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0004557:	85 c0                	test   %eax,%eax
c0004559:	74 45                	je     c00045a0 <check+0x61>
c000455b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000455e:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0004564:	83 f8 01             	cmp    $0x1,%eax
c0004567:	74 37                	je     c00045a0 <check+0x61>
c0004569:	c7 05 5c e7 00 c0 02 	movl   $0x2802,0xc000e75c
c0004570:	28 00 00 
c0004573:	83 ec 08             	sub    $0x8,%esp
c0004576:	6a 0a                	push   $0xa
c0004578:	68 3f 9c 00 c0       	push   $0xc0009c3f
c000457d:	e8 35 d0 ff ff       	call   c00015b7 <disp_str_colour>
c0004582:	83 c4 10             	add    $0x10,%esp
c0004585:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004588:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c000458f:	0f be c0             	movsbl %al,%eax
c0004592:	83 ec 0c             	sub    $0xc,%esp
c0004595:	50                   	push   %eax
c0004596:	e8 3f 29 00 00       	call   c0006eda <disp_int>
c000459b:	83 c4 10             	add    $0x10,%esp
c000459e:	eb fe                	jmp    c000459e <check+0x5f>
c00045a0:	81 45 f4 ac 01 00 00 	addl   $0x1ac,-0xc(%ebp)
c00045a7:	b8 18 25 08 c0       	mov    $0xc0082518,%eax
c00045ac:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00045af:	72 9d                	jb     c000454e <check+0xf>
c00045b1:	90                   	nop
c00045b2:	c9                   	leave  
c00045b3:	c3                   	ret    

c00045b4 <schedule_process>:
c00045b4:	55                   	push   %ebp
c00045b5:	89 e5                	mov    %esp,%ebp
c00045b7:	83 ec 18             	sub    $0x18,%esp
c00045ba:	a1 80 eb 00 c0       	mov    0xc000eb80,%eax
c00045bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00045c2:	a1 ac ed 00 c0       	mov    0xc000edac,%eax
c00045c7:	83 ec 0c             	sub    $0xc,%esp
c00045ca:	50                   	push   %eax
c00045cb:	e8 17 51 00 00       	call   c00096e7 <isListEmpty>
c00045d0:	83 c4 10             	add    $0x10,%esp
c00045d3:	83 f8 01             	cmp    $0x1,%eax
c00045d6:	75 12                	jne    c00045ea <schedule_process+0x36>
c00045d8:	83 ec 0c             	sub    $0xc,%esp
c00045db:	68 45 9c 00 c0       	push   $0xc0009c45
c00045e0:	e8 97 cf ff ff       	call   c000157c <disp_str>
c00045e5:	83 c4 10             	add    $0x10,%esp
c00045e8:	eb 32                	jmp    c000461c <schedule_process+0x68>
c00045ea:	83 ec 0c             	sub    $0xc,%esp
c00045ed:	68 53 9c 00 c0       	push   $0xc0009c53
c00045f2:	e8 85 cf ff ff       	call   c000157c <disp_str>
c00045f7:	83 c4 10             	add    $0x10,%esp
c00045fa:	a1 ac ed 00 c0       	mov    0xc000edac,%eax
c00045ff:	83 ec 0c             	sub    $0xc,%esp
c0004602:	50                   	push   %eax
c0004603:	e8 e7 51 00 00       	call   c00097ef <popFromDoubleLinkList>
c0004608:	83 c4 10             	add    $0x10,%esp
c000460b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000460e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0004612:	74 08                	je     c000461c <schedule_process+0x68>
c0004614:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004617:	a3 80 eb 00 c0       	mov    %eax,0xc000eb80
c000461c:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0004623:	a1 80 eb 00 c0       	mov    0xc000eb80,%eax
c0004628:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000462b:	83 ec 0c             	sub    $0xc,%esp
c000462e:	68 62 9c 00 c0       	push   $0xc0009c62
c0004633:	e8 44 cf ff ff       	call   c000157c <disp_str>
c0004638:	83 c4 10             	add    $0x10,%esp
c000463b:	83 ec 08             	sub    $0x8,%esp
c000463e:	ff 75 e8             	pushl  -0x18(%ebp)
c0004641:	ff 75 f4             	pushl  -0xc(%ebp)
c0004644:	e8 e7 4f 00 00       	call   c0009630 <switch_to>
c0004649:	83 c4 10             	add    $0x10,%esp
c000464c:	83 ec 0c             	sub    $0xc,%esp
c000464f:	68 70 9c 00 c0       	push   $0xc0009c70
c0004654:	e8 23 cf ff ff       	call   c000157c <disp_str>
c0004659:	83 c4 10             	add    $0x10,%esp
c000465c:	90                   	nop
c000465d:	c9                   	leave  
c000465e:	c3                   	ret    

c000465f <clock_handler>:
c000465f:	55                   	push   %ebp
c0004660:	89 e5                	mov    %esp,%ebp
c0004662:	83 ec 08             	sub    $0x8,%esp
c0004665:	e8 4a ff ff ff       	call   c00045b4 <schedule_process>
c000466a:	83 ec 0c             	sub    $0xc,%esp
c000466d:	68 80 9c 00 c0       	push   $0xc0009c80
c0004672:	e8 05 cf ff ff       	call   c000157c <disp_str>
c0004677:	83 c4 10             	add    $0x10,%esp
c000467a:	a1 e0 0e 01 c0       	mov    0xc0010ee0,%eax
c000467f:	83 ec 0c             	sub    $0xc,%esp
c0004682:	50                   	push   %eax
c0004683:	e8 52 28 00 00       	call   c0006eda <disp_int>
c0004688:	83 c4 10             	add    $0x10,%esp
c000468b:	83 ec 0c             	sub    $0xc,%esp
c000468e:	68 8f 9c 00 c0       	push   $0xc0009c8f
c0004693:	e8 e4 ce ff ff       	call   c000157c <disp_str>
c0004698:	83 c4 10             	add    $0x10,%esp
c000469b:	90                   	nop
c000469c:	c9                   	leave  
c000469d:	c3                   	ret    

c000469e <pid2proc>:
c000469e:	55                   	push   %ebp
c000469f:	89 e5                	mov    %esp,%ebp
c00046a1:	83 ec 10             	sub    $0x10,%esp
c00046a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00046a7:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c00046ad:	05 c0 21 08 c0       	add    $0xc00821c0,%eax
c00046b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00046b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00046b8:	c9                   	leave  
c00046b9:	c3                   	ret    

c00046ba <proc2pid>:
c00046ba:	55                   	push   %ebp
c00046bb:	89 e5                	mov    %esp,%ebp
c00046bd:	83 ec 10             	sub    $0x10,%esp
c00046c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00046c3:	2d c0 21 08 c0       	sub    $0xc00821c0,%eax
c00046c8:	c1 f8 02             	sar    $0x2,%eax
c00046cb:	69 c0 43 ac 28 8d    	imul   $0x8d28ac43,%eax,%eax
c00046d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00046d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00046d7:	c9                   	leave  
c00046d8:	c3                   	ret    

c00046d9 <InitDescriptor>:
c00046d9:	55                   	push   %ebp
c00046da:	89 e5                	mov    %esp,%ebp
c00046dc:	83 ec 04             	sub    $0x4,%esp
c00046df:	8b 45 14             	mov    0x14(%ebp),%eax
c00046e2:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c00046e6:	8b 45 10             	mov    0x10(%ebp),%eax
c00046e9:	89 c2                	mov    %eax,%edx
c00046eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00046ee:	66 89 10             	mov    %dx,(%eax)
c00046f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00046f4:	89 c2                	mov    %eax,%edx
c00046f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00046f9:	66 89 50 02          	mov    %dx,0x2(%eax)
c00046fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004700:	c1 e8 10             	shr    $0x10,%eax
c0004703:	89 c2                	mov    %eax,%edx
c0004705:	8b 45 08             	mov    0x8(%ebp),%eax
c0004708:	88 50 04             	mov    %dl,0x4(%eax)
c000470b:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c000470f:	89 c2                	mov    %eax,%edx
c0004711:	8b 45 08             	mov    0x8(%ebp),%eax
c0004714:	88 50 05             	mov    %dl,0x5(%eax)
c0004717:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c000471b:	66 c1 e8 08          	shr    $0x8,%ax
c000471f:	c1 e0 04             	shl    $0x4,%eax
c0004722:	89 c2                	mov    %eax,%edx
c0004724:	8b 45 10             	mov    0x10(%ebp),%eax
c0004727:	c1 e8 10             	shr    $0x10,%eax
c000472a:	83 e0 0f             	and    $0xf,%eax
c000472d:	09 c2                	or     %eax,%edx
c000472f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004732:	88 50 06             	mov    %dl,0x6(%eax)
c0004735:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004738:	c1 e8 18             	shr    $0x18,%eax
c000473b:	89 c2                	mov    %eax,%edx
c000473d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004740:	88 50 07             	mov    %dl,0x7(%eax)
c0004743:	90                   	nop
c0004744:	c9                   	leave  
c0004745:	c3                   	ret    

c0004746 <Seg2PhyAddr>:
c0004746:	55                   	push   %ebp
c0004747:	89 e5                	mov    %esp,%ebp
c0004749:	83 ec 10             	sub    $0x10,%esp
c000474c:	8b 45 08             	mov    0x8(%ebp),%eax
c000474f:	c1 e8 03             	shr    $0x3,%eax
c0004752:	8b 14 c5 84 e7 00 c0 	mov    -0x3fff187c(,%eax,8),%edx
c0004759:	8b 04 c5 80 e7 00 c0 	mov    -0x3fff1880(,%eax,8),%eax
c0004760:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004763:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004766:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000476a:	0f b7 c0             	movzwl %ax,%eax
c000476d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004771:	0f b6 d2             	movzbl %dl,%edx
c0004774:	c1 e2 10             	shl    $0x10,%edx
c0004777:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c000477d:	09 d0                	or     %edx,%eax
c000477f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004782:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004785:	c9                   	leave  
c0004786:	c3                   	ret    

c0004787 <Seg2PhyAddrLDT>:
c0004787:	55                   	push   %ebp
c0004788:	89 e5                	mov    %esp,%ebp
c000478a:	83 ec 10             	sub    $0x10,%esp
c000478d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004790:	c1 e8 03             	shr    $0x3,%eax
c0004793:	89 c2                	mov    %eax,%edx
c0004795:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004798:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
c000479c:	8b 02                	mov    (%edx),%eax
c000479e:	8b 52 04             	mov    0x4(%edx),%edx
c00047a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00047a4:	89 55 f8             	mov    %edx,-0x8(%ebp)
c00047a7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00047ab:	0f b7 c0             	movzwl %ax,%eax
c00047ae:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c00047b2:	0f b6 d2             	movzbl %dl,%edx
c00047b5:	c1 e2 10             	shl    $0x10,%edx
c00047b8:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c00047be:	09 d0                	or     %edx,%eax
c00047c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00047c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00047c6:	c9                   	leave  
c00047c7:	c3                   	ret    

c00047c8 <VirAddr2PhyAddr>:
c00047c8:	55                   	push   %ebp
c00047c9:	89 e5                	mov    %esp,%ebp
c00047cb:	83 ec 10             	sub    $0x10,%esp
c00047ce:	8b 55 0c             	mov    0xc(%ebp),%edx
c00047d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00047d4:	01 d0                	add    %edx,%eax
c00047d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00047d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00047dc:	c9                   	leave  
c00047dd:	c3                   	ret    

c00047de <v2l>:
c00047de:	55                   	push   %ebp
c00047df:	89 e5                	mov    %esp,%ebp
c00047e1:	83 ec 18             	sub    $0x18,%esp
c00047e4:	83 ec 0c             	sub    $0xc,%esp
c00047e7:	ff 75 08             	pushl  0x8(%ebp)
c00047ea:	e8 af fe ff ff       	call   c000469e <pid2proc>
c00047ef:	83 c4 10             	add    $0x10,%esp
c00047f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00047f5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00047fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00047ff:	83 ec 08             	sub    $0x8,%esp
c0004802:	ff 75 f4             	pushl  -0xc(%ebp)
c0004805:	50                   	push   %eax
c0004806:	e8 7c ff ff ff       	call   c0004787 <Seg2PhyAddrLDT>
c000480b:	83 c4 10             	add    $0x10,%esp
c000480e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004811:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004814:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004817:	01 d0                	add    %edx,%eax
c0004819:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000481c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000481f:	c9                   	leave  
c0004820:	c3                   	ret    

c0004821 <init_propt>:
c0004821:	55                   	push   %ebp
c0004822:	89 e5                	mov    %esp,%ebp
c0004824:	83 ec 28             	sub    $0x28,%esp
c0004827:	6a 0e                	push   $0xe
c0004829:	6a 08                	push   $0x8
c000482b:	68 5a 16 00 c0       	push   $0xc000165a
c0004830:	6a 20                	push   $0x20
c0004832:	e8 d1 00 00 00       	call   c0004908 <InitInterruptDesc>
c0004837:	83 c4 10             	add    $0x10,%esp
c000483a:	6a 0e                	push   $0xe
c000483c:	6a 08                	push   $0x8
c000483e:	68 88 16 00 c0       	push   $0xc0001688
c0004843:	6a 21                	push   $0x21
c0004845:	e8 be 00 00 00       	call   c0004908 <InitInterruptDesc>
c000484a:	83 c4 10             	add    $0x10,%esp
c000484d:	6a 0e                	push   $0xe
c000484f:	6a 08                	push   $0x8
c0004851:	68 d1 16 00 c0       	push   $0xc00016d1
c0004856:	6a 2e                	push   $0x2e
c0004858:	e8 ab 00 00 00       	call   c0004908 <InitInterruptDesc>
c000485d:	83 c4 10             	add    $0x10,%esp
c0004860:	83 ec 04             	sub    $0x4,%esp
c0004863:	68 b0 06 00 00       	push   $0x6b0
c0004868:	6a 00                	push   $0x0
c000486a:	68 c0 21 08 c0       	push   $0xc00821c0
c000486f:	e8 6b 5c 00 00       	call   c000a4df <Memset>
c0004874:	83 c4 10             	add    $0x10,%esp
c0004877:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c000487e:	83 ec 04             	sub    $0x4,%esp
c0004881:	ff 75 f4             	pushl  -0xc(%ebp)
c0004884:	6a 00                	push   $0x0
c0004886:	68 40 06 01 c0       	push   $0xc0010640
c000488b:	e8 4f 5c 00 00       	call   c000a4df <Memset>
c0004890:	83 c4 10             	add    $0x10,%esp
c0004893:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004896:	a3 a8 06 01 c0       	mov    %eax,0xc00106a8
c000489b:	c7 05 48 06 01 c0 30 	movl   $0x30,0xc0010648
c00048a2:	00 00 00 
c00048a5:	83 ec 0c             	sub    $0xc,%esp
c00048a8:	6a 30                	push   $0x30
c00048aa:	e8 97 fe ff ff       	call   c0004746 <Seg2PhyAddr>
c00048af:	83 c4 10             	add    $0x10,%esp
c00048b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048b5:	c7 45 ec 40 06 01 c0 	movl   $0xc0010640,-0x14(%ebp)
c00048bc:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c00048c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00048c6:	0f b7 d0             	movzwl %ax,%edx
c00048c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048cc:	83 e8 01             	sub    $0x1,%eax
c00048cf:	89 c1                	mov    %eax,%ecx
c00048d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00048d4:	52                   	push   %edx
c00048d5:	51                   	push   %ecx
c00048d6:	50                   	push   %eax
c00048d7:	68 c0 e7 00 c0       	push   $0xc000e7c0
c00048dc:	e8 f8 fd ff ff       	call   c00046d9 <InitDescriptor>
c00048e1:	83 c4 10             	add    $0x10,%esp
c00048e4:	c7 45 e4 00 80 0b 0c 	movl   $0xc0b8000,-0x1c(%ebp)
c00048eb:	68 f2 00 00 00       	push   $0xf2
c00048f0:	68 ff ff 00 00       	push   $0xffff
c00048f5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00048f8:	68 b8 e7 00 c0       	push   $0xc000e7b8
c00048fd:	e8 d7 fd ff ff       	call   c00046d9 <InitDescriptor>
c0004902:	83 c4 10             	add    $0x10,%esp
c0004905:	90                   	nop
c0004906:	c9                   	leave  
c0004907:	c3                   	ret    

c0004908 <InitInterruptDesc>:
c0004908:	55                   	push   %ebp
c0004909:	89 e5                	mov    %esp,%ebp
c000490b:	83 ec 10             	sub    $0x10,%esp
c000490e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004911:	c1 e0 03             	shl    $0x3,%eax
c0004914:	05 e0 06 01 c0       	add    $0xc00106e0,%eax
c0004919:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000491c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000491f:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004923:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004926:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004929:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000492c:	89 c2                	mov    %eax,%edx
c000492e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004931:	66 89 10             	mov    %dx,(%eax)
c0004934:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004937:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c000493d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004940:	c1 f8 10             	sar    $0x10,%eax
c0004943:	89 c2                	mov    %eax,%edx
c0004945:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004948:	66 89 50 06          	mov    %dx,0x6(%eax)
c000494c:	8b 45 10             	mov    0x10(%ebp),%eax
c000494f:	c1 e0 04             	shl    $0x4,%eax
c0004952:	89 c2                	mov    %eax,%edx
c0004954:	8b 45 14             	mov    0x14(%ebp),%eax
c0004957:	09 d0                	or     %edx,%eax
c0004959:	89 c2                	mov    %eax,%edx
c000495b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000495e:	88 50 05             	mov    %dl,0x5(%eax)
c0004961:	90                   	nop
c0004962:	c9                   	leave  
c0004963:	c3                   	ret    

c0004964 <ReloadGDT>:
c0004964:	55                   	push   %ebp
c0004965:	89 e5                	mov    %esp,%ebp
c0004967:	83 ec 28             	sub    $0x28,%esp
c000496a:	b8 c8 06 01 c0       	mov    $0xc00106c8,%eax
c000496f:	0f b7 00             	movzwl (%eax),%eax
c0004972:	98                   	cwtl   
c0004973:	ba ca 06 01 c0       	mov    $0xc00106ca,%edx
c0004978:	8b 12                	mov    (%edx),%edx
c000497a:	83 ec 04             	sub    $0x4,%esp
c000497d:	50                   	push   %eax
c000497e:	52                   	push   %edx
c000497f:	68 80 e7 00 c0       	push   $0xc000e780
c0004984:	e8 28 5b 00 00       	call   c000a4b1 <Memcpy>
c0004989:	83 c4 10             	add    $0x10,%esp
c000498c:	c7 45 f0 c8 06 01 c0 	movl   $0xc00106c8,-0x10(%ebp)
c0004993:	c7 45 ec ca 06 01 c0 	movl   $0xc00106ca,-0x14(%ebp)
c000499a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000499d:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c00049a2:	ba 80 e7 00 c0       	mov    $0xc000e780,%edx
c00049a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00049aa:	89 10                	mov    %edx,(%eax)
c00049ac:	c7 45 e8 48 e7 00 c0 	movl   $0xc000e748,-0x18(%ebp)
c00049b3:	c7 45 e4 4a e7 00 c0 	movl   $0xc000e74a,-0x1c(%ebp)
c00049ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00049bd:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c00049c2:	ba e0 06 01 c0       	mov    $0xc00106e0,%edx
c00049c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00049ca:	89 10                	mov    %edx,(%eax)
c00049cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00049d3:	eb 04                	jmp    c00049d9 <ReloadGDT+0x75>
c00049d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00049d9:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00049e0:	7e f3                	jle    c00049d5 <ReloadGDT+0x71>
c00049e2:	e8 9d 29 00 00       	call   c0007384 <init_internal_interrupt>
c00049e7:	e8 35 fe ff ff       	call   c0004821 <init_propt>
c00049ec:	90                   	nop
c00049ed:	c9                   	leave  
c00049ee:	c3                   	ret    

c00049ef <select_console>:
c00049ef:	55                   	push   %ebp
c00049f0:	89 e5                	mov    %esp,%ebp
c00049f2:	83 ec 18             	sub    $0x18,%esp
c00049f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00049f8:	88 45 f4             	mov    %al,-0xc(%ebp)
c00049fb:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c00049ff:	77 27                	ja     c0004a28 <select_console+0x39>
c0004a01:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004a05:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0004a0b:	05 c0 ed 00 c0       	add    $0xc000edc0,%eax
c0004a10:	a3 40 e7 00 c0       	mov    %eax,0xc000e740
c0004a15:	a1 40 e7 00 c0       	mov    0xc000e740,%eax
c0004a1a:	83 ec 0c             	sub    $0xc,%esp
c0004a1d:	50                   	push   %eax
c0004a1e:	e8 08 00 00 00       	call   c0004a2b <flush>
c0004a23:	83 c4 10             	add    $0x10,%esp
c0004a26:	eb 01                	jmp    c0004a29 <select_console+0x3a>
c0004a28:	90                   	nop
c0004a29:	c9                   	leave  
c0004a2a:	c3                   	ret    

c0004a2b <flush>:
c0004a2b:	55                   	push   %ebp
c0004a2c:	89 e5                	mov    %esp,%ebp
c0004a2e:	83 ec 08             	sub    $0x8,%esp
c0004a31:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a34:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004a3a:	8b 40 0c             	mov    0xc(%eax),%eax
c0004a3d:	83 ec 0c             	sub    $0xc,%esp
c0004a40:	50                   	push   %eax
c0004a41:	e8 1e 00 00 00       	call   c0004a64 <set_cursor>
c0004a46:	83 c4 10             	add    $0x10,%esp
c0004a49:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a4c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004a52:	8b 40 08             	mov    0x8(%eax),%eax
c0004a55:	83 ec 0c             	sub    $0xc,%esp
c0004a58:	50                   	push   %eax
c0004a59:	e8 64 00 00 00       	call   c0004ac2 <set_console_start_video_addr>
c0004a5e:	83 c4 10             	add    $0x10,%esp
c0004a61:	90                   	nop
c0004a62:	c9                   	leave  
c0004a63:	c3                   	ret    

c0004a64 <set_cursor>:
c0004a64:	55                   	push   %ebp
c0004a65:	89 e5                	mov    %esp,%ebp
c0004a67:	83 ec 08             	sub    $0x8,%esp
c0004a6a:	83 ec 08             	sub    $0x8,%esp
c0004a6d:	6a 0e                	push   $0xe
c0004a6f:	68 d4 03 00 00       	push   $0x3d4
c0004a74:	e8 23 cd ff ff       	call   c000179c <out_byte>
c0004a79:	83 c4 10             	add    $0x10,%esp
c0004a7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a7f:	c1 e8 08             	shr    $0x8,%eax
c0004a82:	0f b7 c0             	movzwl %ax,%eax
c0004a85:	83 ec 08             	sub    $0x8,%esp
c0004a88:	50                   	push   %eax
c0004a89:	68 d5 03 00 00       	push   $0x3d5
c0004a8e:	e8 09 cd ff ff       	call   c000179c <out_byte>
c0004a93:	83 c4 10             	add    $0x10,%esp
c0004a96:	83 ec 08             	sub    $0x8,%esp
c0004a99:	6a 0f                	push   $0xf
c0004a9b:	68 d4 03 00 00       	push   $0x3d4
c0004aa0:	e8 f7 cc ff ff       	call   c000179c <out_byte>
c0004aa5:	83 c4 10             	add    $0x10,%esp
c0004aa8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004aab:	0f b7 c0             	movzwl %ax,%eax
c0004aae:	83 ec 08             	sub    $0x8,%esp
c0004ab1:	50                   	push   %eax
c0004ab2:	68 d5 03 00 00       	push   $0x3d5
c0004ab7:	e8 e0 cc ff ff       	call   c000179c <out_byte>
c0004abc:	83 c4 10             	add    $0x10,%esp
c0004abf:	90                   	nop
c0004ac0:	c9                   	leave  
c0004ac1:	c3                   	ret    

c0004ac2 <set_console_start_video_addr>:
c0004ac2:	55                   	push   %ebp
c0004ac3:	89 e5                	mov    %esp,%ebp
c0004ac5:	83 ec 08             	sub    $0x8,%esp
c0004ac8:	83 ec 08             	sub    $0x8,%esp
c0004acb:	6a 0c                	push   $0xc
c0004acd:	68 d4 03 00 00       	push   $0x3d4
c0004ad2:	e8 c5 cc ff ff       	call   c000179c <out_byte>
c0004ad7:	83 c4 10             	add    $0x10,%esp
c0004ada:	8b 45 08             	mov    0x8(%ebp),%eax
c0004add:	c1 e8 08             	shr    $0x8,%eax
c0004ae0:	0f b7 c0             	movzwl %ax,%eax
c0004ae3:	83 ec 08             	sub    $0x8,%esp
c0004ae6:	50                   	push   %eax
c0004ae7:	68 d5 03 00 00       	push   $0x3d5
c0004aec:	e8 ab cc ff ff       	call   c000179c <out_byte>
c0004af1:	83 c4 10             	add    $0x10,%esp
c0004af4:	83 ec 08             	sub    $0x8,%esp
c0004af7:	6a 0d                	push   $0xd
c0004af9:	68 d4 03 00 00       	push   $0x3d4
c0004afe:	e8 99 cc ff ff       	call   c000179c <out_byte>
c0004b03:	83 c4 10             	add    $0x10,%esp
c0004b06:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b09:	0f b7 c0             	movzwl %ax,%eax
c0004b0c:	83 ec 08             	sub    $0x8,%esp
c0004b0f:	50                   	push   %eax
c0004b10:	68 d5 03 00 00       	push   $0x3d5
c0004b15:	e8 82 cc ff ff       	call   c000179c <out_byte>
c0004b1a:	83 c4 10             	add    $0x10,%esp
c0004b1d:	90                   	nop
c0004b1e:	c9                   	leave  
c0004b1f:	c3                   	ret    

c0004b20 <put_key>:
c0004b20:	55                   	push   %ebp
c0004b21:	89 e5                	mov    %esp,%ebp
c0004b23:	83 ec 04             	sub    $0x4,%esp
c0004b26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b29:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004b2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b2f:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004b35:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004b3a:	77 4d                	ja     c0004b89 <put_key+0x69>
c0004b3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b3f:	8b 00                	mov    (%eax),%eax
c0004b41:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004b45:	89 10                	mov    %edx,(%eax)
c0004b47:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b4a:	8b 00                	mov    (%eax),%eax
c0004b4c:	8d 50 04             	lea    0x4(%eax),%edx
c0004b4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b52:	89 10                	mov    %edx,(%eax)
c0004b54:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b57:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004b5d:	8d 50 01             	lea    0x1(%eax),%edx
c0004b60:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b63:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004b69:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b6c:	8b 00                	mov    (%eax),%eax
c0004b6e:	8b 55 08             	mov    0x8(%ebp),%edx
c0004b71:	83 c2 08             	add    $0x8,%edx
c0004b74:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004b7a:	39 d0                	cmp    %edx,%eax
c0004b7c:	75 0b                	jne    c0004b89 <put_key+0x69>
c0004b7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b81:	8d 50 08             	lea    0x8(%eax),%edx
c0004b84:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b87:	89 10                	mov    %edx,(%eax)
c0004b89:	90                   	nop
c0004b8a:	c9                   	leave  
c0004b8b:	c3                   	ret    

c0004b8c <scroll_up>:
c0004b8c:	55                   	push   %ebp
c0004b8d:	89 e5                	mov    %esp,%ebp
c0004b8f:	83 ec 08             	sub    $0x8,%esp
c0004b92:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b95:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004b9b:	8b 40 08             	mov    0x8(%eax),%eax
c0004b9e:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004ba1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ba4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004baa:	8b 00                	mov    (%eax),%eax
c0004bac:	39 c2                	cmp    %eax,%edx
c0004bae:	76 1b                	jbe    c0004bcb <scroll_up+0x3f>
c0004bb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bb3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004bb9:	8b 40 08             	mov    0x8(%eax),%eax
c0004bbc:	83 e8 50             	sub    $0x50,%eax
c0004bbf:	83 ec 0c             	sub    $0xc,%esp
c0004bc2:	50                   	push   %eax
c0004bc3:	e8 fa fe ff ff       	call   c0004ac2 <set_console_start_video_addr>
c0004bc8:	83 c4 10             	add    $0x10,%esp
c0004bcb:	90                   	nop
c0004bcc:	c9                   	leave  
c0004bcd:	c3                   	ret    

c0004bce <scroll_down>:
c0004bce:	55                   	push   %ebp
c0004bcf:	89 e5                	mov    %esp,%ebp
c0004bd1:	83 ec 08             	sub    $0x8,%esp
c0004bd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bd7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004bdd:	8b 40 08             	mov    0x8(%eax),%eax
c0004be0:	8d 48 50             	lea    0x50(%eax),%ecx
c0004be3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004be6:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004bec:	8b 10                	mov    (%eax),%edx
c0004bee:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bf1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004bf7:	8b 40 04             	mov    0x4(%eax),%eax
c0004bfa:	01 d0                	add    %edx,%eax
c0004bfc:	39 c1                	cmp    %eax,%ecx
c0004bfe:	73 36                	jae    c0004c36 <scroll_down+0x68>
c0004c00:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c03:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c09:	8b 40 08             	mov    0x8(%eax),%eax
c0004c0c:	83 c0 50             	add    $0x50,%eax
c0004c0f:	83 ec 0c             	sub    $0xc,%esp
c0004c12:	50                   	push   %eax
c0004c13:	e8 aa fe ff ff       	call   c0004ac2 <set_console_start_video_addr>
c0004c18:	83 c4 10             	add    $0x10,%esp
c0004c1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c1e:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c24:	8b 50 08             	mov    0x8(%eax),%edx
c0004c27:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c2a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c30:	83 c2 50             	add    $0x50,%edx
c0004c33:	89 50 08             	mov    %edx,0x8(%eax)
c0004c36:	90                   	nop
c0004c37:	c9                   	leave  
c0004c38:	c3                   	ret    

c0004c39 <out_char>:
c0004c39:	55                   	push   %ebp
c0004c3a:	89 e5                	mov    %esp,%ebp
c0004c3c:	83 ec 28             	sub    $0x28,%esp
c0004c3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c42:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c48:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c4e:	8b 40 0c             	mov    0xc(%eax),%eax
c0004c51:	05 00 c0 05 00       	add    $0x5c000,%eax
c0004c56:	01 c0                	add    %eax,%eax
c0004c58:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c5b:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004c5f:	83 f8 08             	cmp    $0x8,%eax
c0004c62:	0f 84 8d 00 00 00    	je     c0004cf5 <out_char+0xbc>
c0004c68:	83 f8 0a             	cmp    $0xa,%eax
c0004c6b:	0f 85 c9 00 00 00    	jne    c0004d3a <out_char+0x101>
c0004c71:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c74:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c7a:	8b 50 0c             	mov    0xc(%eax),%edx
c0004c7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c80:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c86:	8b 08                	mov    (%eax),%ecx
c0004c88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c8b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c91:	8b 40 04             	mov    0x4(%eax),%eax
c0004c94:	01 c8                	add    %ecx,%eax
c0004c96:	83 e8 50             	sub    $0x50,%eax
c0004c99:	39 c2                	cmp    %eax,%edx
c0004c9b:	0f 83 f4 00 00 00    	jae    c0004d95 <out_char+0x15c>
c0004ca1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ca4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004caa:	8b 08                	mov    (%eax),%ecx
c0004cac:	8b 45 08             	mov    0x8(%ebp),%eax
c0004caf:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cb5:	8b 50 0c             	mov    0xc(%eax),%edx
c0004cb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cbb:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cc1:	8b 00                	mov    (%eax),%eax
c0004cc3:	29 c2                	sub    %eax,%edx
c0004cc5:	89 d0                	mov    %edx,%eax
c0004cc7:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0004ccc:	f7 e2                	mul    %edx
c0004cce:	89 d0                	mov    %edx,%eax
c0004cd0:	c1 e8 06             	shr    $0x6,%eax
c0004cd3:	8d 50 01             	lea    0x1(%eax),%edx
c0004cd6:	89 d0                	mov    %edx,%eax
c0004cd8:	c1 e0 02             	shl    $0x2,%eax
c0004cdb:	01 d0                	add    %edx,%eax
c0004cdd:	c1 e0 04             	shl    $0x4,%eax
c0004ce0:	89 c2                	mov    %eax,%edx
c0004ce2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ce5:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ceb:	01 ca                	add    %ecx,%edx
c0004ced:	89 50 0c             	mov    %edx,0xc(%eax)
c0004cf0:	e9 a0 00 00 00       	jmp    c0004d95 <out_char+0x15c>
c0004cf5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cf8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cfe:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d01:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d04:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d0a:	8b 00                	mov    (%eax),%eax
c0004d0c:	39 c2                	cmp    %eax,%edx
c0004d0e:	0f 86 84 00 00 00    	jbe    c0004d98 <out_char+0x15f>
c0004d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d17:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d1d:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d20:	83 ea 01             	sub    $0x1,%edx
c0004d23:	89 50 0c             	mov    %edx,0xc(%eax)
c0004d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d29:	83 e8 02             	sub    $0x2,%eax
c0004d2c:	c6 00 20             	movb   $0x20,(%eax)
c0004d2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d32:	83 e8 01             	sub    $0x1,%eax
c0004d35:	c6 00 00             	movb   $0x0,(%eax)
c0004d38:	eb 5e                	jmp    c0004d98 <out_char+0x15f>
c0004d3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d3d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d43:	8b 40 0c             	mov    0xc(%eax),%eax
c0004d46:	8d 48 01             	lea    0x1(%eax),%ecx
c0004d49:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d4c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d52:	8b 10                	mov    (%eax),%edx
c0004d54:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d57:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d5d:	8b 40 04             	mov    0x4(%eax),%eax
c0004d60:	01 d0                	add    %edx,%eax
c0004d62:	39 c1                	cmp    %eax,%ecx
c0004d64:	73 35                	jae    c0004d9b <out_char+0x162>
c0004d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d69:	8d 50 01             	lea    0x1(%eax),%edx
c0004d6c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004d6f:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0004d73:	88 10                	mov    %dl,(%eax)
c0004d75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004d78:	8d 50 01             	lea    0x1(%eax),%edx
c0004d7b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004d7e:	c6 00 0a             	movb   $0xa,(%eax)
c0004d81:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d84:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d8a:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d8d:	83 c2 01             	add    $0x1,%edx
c0004d90:	89 50 0c             	mov    %edx,0xc(%eax)
c0004d93:	eb 06                	jmp    c0004d9b <out_char+0x162>
c0004d95:	90                   	nop
c0004d96:	eb 14                	jmp    c0004dac <out_char+0x173>
c0004d98:	90                   	nop
c0004d99:	eb 11                	jmp    c0004dac <out_char+0x173>
c0004d9b:	90                   	nop
c0004d9c:	eb 0e                	jmp    c0004dac <out_char+0x173>
c0004d9e:	83 ec 0c             	sub    $0xc,%esp
c0004da1:	ff 75 08             	pushl  0x8(%ebp)
c0004da4:	e8 25 fe ff ff       	call   c0004bce <scroll_down>
c0004da9:	83 c4 10             	add    $0x10,%esp
c0004dac:	8b 45 08             	mov    0x8(%ebp),%eax
c0004daf:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004db5:	8b 50 0c             	mov    0xc(%eax),%edx
c0004db8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dbb:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004dc1:	8b 40 08             	mov    0x8(%eax),%eax
c0004dc4:	29 c2                	sub    %eax,%edx
c0004dc6:	89 d0                	mov    %edx,%eax
c0004dc8:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0004dcd:	77 cf                	ja     c0004d9e <out_char+0x165>
c0004dcf:	83 ec 0c             	sub    $0xc,%esp
c0004dd2:	ff 75 08             	pushl  0x8(%ebp)
c0004dd5:	e8 51 fc ff ff       	call   c0004a2b <flush>
c0004dda:	83 c4 10             	add    $0x10,%esp
c0004ddd:	90                   	nop
c0004dde:	c9                   	leave  
c0004ddf:	c3                   	ret    

c0004de0 <tty_dev_read>:
c0004de0:	55                   	push   %ebp
c0004de1:	89 e5                	mov    %esp,%ebp
c0004de3:	83 ec 08             	sub    $0x8,%esp
c0004de6:	a1 40 e7 00 c0       	mov    0xc000e740,%eax
c0004deb:	39 45 08             	cmp    %eax,0x8(%ebp)
c0004dee:	75 17                	jne    c0004e07 <tty_dev_read+0x27>
c0004df0:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c0004df5:	85 c0                	test   %eax,%eax
c0004df7:	7e 0e                	jle    c0004e07 <tty_dev_read+0x27>
c0004df9:	83 ec 0c             	sub    $0xc,%esp
c0004dfc:	ff 75 08             	pushl  0x8(%ebp)
c0004dff:	e8 0e 06 00 00       	call   c0005412 <keyboard_read>
c0004e04:	83 c4 10             	add    $0x10,%esp
c0004e07:	90                   	nop
c0004e08:	c9                   	leave  
c0004e09:	c3                   	ret    

c0004e0a <tty_dev_write>:
c0004e0a:	55                   	push   %ebp
c0004e0b:	89 e5                	mov    %esp,%ebp
c0004e0d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0004e13:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e16:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004e1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004e1f:	e9 da 01 00 00       	jmp    c0004ffe <tty_dev_write+0x1f4>
c0004e24:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e27:	8b 40 04             	mov    0x4(%eax),%eax
c0004e2a:	8b 00                	mov    (%eax),%eax
c0004e2c:	88 45 f3             	mov    %al,-0xd(%ebp)
c0004e2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e32:	8b 40 04             	mov    0x4(%eax),%eax
c0004e35:	8d 50 04             	lea    0x4(%eax),%edx
c0004e38:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e3b:	89 50 04             	mov    %edx,0x4(%eax)
c0004e3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e41:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004e47:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e4d:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004e53:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e56:	8b 40 04             	mov    0x4(%eax),%eax
c0004e59:	8b 55 08             	mov    0x8(%ebp),%edx
c0004e5c:	83 c2 08             	add    $0x8,%edx
c0004e5f:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004e65:	39 d0                	cmp    %edx,%eax
c0004e67:	75 0c                	jne    c0004e75 <tty_dev_write+0x6b>
c0004e69:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e6c:	8d 50 08             	lea    0x8(%eax),%edx
c0004e6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e72:	89 50 04             	mov    %edx,0x4(%eax)
c0004e75:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e78:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004e7e:	85 c0                	test   %eax,%eax
c0004e80:	0f 84 78 01 00 00    	je     c0004ffe <tty_dev_write+0x1f4>
c0004e86:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004e8a:	3c 20                	cmp    $0x20,%al
c0004e8c:	76 08                	jbe    c0004e96 <tty_dev_write+0x8c>
c0004e8e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004e92:	3c 7e                	cmp    $0x7e,%al
c0004e94:	76 10                	jbe    c0004ea6 <tty_dev_write+0x9c>
c0004e96:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004e9a:	3c 20                	cmp    $0x20,%al
c0004e9c:	74 08                	je     c0004ea6 <tty_dev_write+0x9c>
c0004e9e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004ea2:	84 c0                	test   %al,%al
c0004ea4:	75 7b                	jne    c0004f21 <tty_dev_write+0x117>
c0004ea6:	83 ec 08             	sub    $0x8,%esp
c0004ea9:	8d 45 f3             	lea    -0xd(%ebp),%eax
c0004eac:	50                   	push   %eax
c0004ead:	6a 00                	push   $0x0
c0004eaf:	e8 2a f9 ff ff       	call   c00047de <v2l>
c0004eb4:	83 c4 10             	add    $0x10,%esp
c0004eb7:	89 c1                	mov    %eax,%ecx
c0004eb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ebc:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c0004ec2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec5:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004ecb:	01 d0                	add    %edx,%eax
c0004ecd:	83 ec 04             	sub    $0x4,%esp
c0004ed0:	6a 01                	push   $0x1
c0004ed2:	51                   	push   %ecx
c0004ed3:	50                   	push   %eax
c0004ed4:	e8 d8 55 00 00       	call   c000a4b1 <Memcpy>
c0004ed9:	83 c4 10             	add    $0x10,%esp
c0004edc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004edf:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004ee5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eeb:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0004ef1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004efa:	8d 50 01             	lea    0x1(%eax),%edx
c0004efd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f00:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0004f06:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f0a:	0f b6 c0             	movzbl %al,%eax
c0004f0d:	83 ec 08             	sub    $0x8,%esp
c0004f10:	50                   	push   %eax
c0004f11:	ff 75 08             	pushl  0x8(%ebp)
c0004f14:	e8 20 fd ff ff       	call   c0004c39 <out_char>
c0004f19:	83 c4 10             	add    $0x10,%esp
c0004f1c:	e9 dd 00 00 00       	jmp    c0004ffe <tty_dev_write+0x1f4>
c0004f21:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f25:	3c 08                	cmp    $0x8,%al
c0004f27:	75 45                	jne    c0004f6e <tty_dev_write+0x164>
c0004f29:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f2c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004f32:	8d 50 01             	lea    0x1(%eax),%edx
c0004f35:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f38:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0004f3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f41:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004f47:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004f4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f4d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0004f53:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f57:	0f b6 c0             	movzbl %al,%eax
c0004f5a:	83 ec 08             	sub    $0x8,%esp
c0004f5d:	50                   	push   %eax
c0004f5e:	ff 75 08             	pushl  0x8(%ebp)
c0004f61:	e8 d3 fc ff ff       	call   c0004c39 <out_char>
c0004f66:	83 c4 10             	add    $0x10,%esp
c0004f69:	e9 90 00 00 00       	jmp    c0004ffe <tty_dev_write+0x1f4>
c0004f6e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f72:	3c 0a                	cmp    $0xa,%al
c0004f74:	74 10                	je     c0004f86 <tty_dev_write+0x17c>
c0004f76:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f79:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0004f7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004f82:	39 c2                	cmp    %eax,%edx
c0004f84:	75 78                	jne    c0004ffe <tty_dev_write+0x1f4>
c0004f86:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f8a:	0f b6 c0             	movzbl %al,%eax
c0004f8d:	83 ec 08             	sub    $0x8,%esp
c0004f90:	50                   	push   %eax
c0004f91:	ff 75 08             	pushl  0x8(%ebp)
c0004f94:	e8 a0 fc ff ff       	call   c0004c39 <out_char>
c0004f99:	83 c4 10             	add    $0x10,%esp
c0004f9c:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
c0004fa3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa6:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004fac:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004faf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb2:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0004fb8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004fbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fbe:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0004fc4:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004fc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fca:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0004fd1:	00 00 00 
c0004fd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd7:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0004fde:	00 00 00 
c0004fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe4:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c0004fea:	83 ec 04             	sub    $0x4,%esp
c0004fed:	50                   	push   %eax
c0004fee:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0004ff1:	50                   	push   %eax
c0004ff2:	6a 01                	push   $0x1
c0004ff4:	e8 d1 42 00 00       	call   c00092ca <send_rec>
c0004ff9:	83 c4 10             	add    $0x10,%esp
c0004ffc:	eb 11                	jmp    c000500f <tty_dev_write+0x205>
c0004ffe:	8b 45 08             	mov    0x8(%ebp),%eax
c0005001:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005007:	85 c0                	test   %eax,%eax
c0005009:	0f 85 15 fe ff ff    	jne    c0004e24 <tty_dev_write+0x1a>
c000500f:	c9                   	leave  
c0005010:	c3                   	ret    

c0005011 <tty_do_read>:
c0005011:	55                   	push   %ebp
c0005012:	89 e5                	mov    %esp,%ebp
c0005014:	83 ec 08             	sub    $0x8,%esp
c0005017:	8b 45 08             	mov    0x8(%ebp),%eax
c000501a:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005021:	00 00 00 
c0005024:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005027:	8b 50 58             	mov    0x58(%eax),%edx
c000502a:	8b 45 08             	mov    0x8(%ebp),%eax
c000502d:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005033:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005036:	8b 00                	mov    (%eax),%eax
c0005038:	89 c2                	mov    %eax,%edx
c000503a:	8b 45 08             	mov    0x8(%ebp),%eax
c000503d:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0005043:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005046:	8b 50 50             	mov    0x50(%eax),%edx
c0005049:	8b 45 08             	mov    0x8(%ebp),%eax
c000504c:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005052:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005055:	8b 40 10             	mov    0x10(%eax),%eax
c0005058:	89 c2                	mov    %eax,%edx
c000505a:	8b 45 08             	mov    0x8(%ebp),%eax
c000505d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005063:	83 ec 08             	sub    $0x8,%esp
c0005066:	52                   	push   %edx
c0005067:	50                   	push   %eax
c0005068:	e8 71 f7 ff ff       	call   c00047de <v2l>
c000506d:	83 c4 10             	add    $0x10,%esp
c0005070:	89 c2                	mov    %eax,%edx
c0005072:	8b 45 08             	mov    0x8(%ebp),%eax
c0005075:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c000507b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000507e:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c0005085:	8b 45 08             	mov    0x8(%ebp),%eax
c0005088:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c000508e:	83 ec 04             	sub    $0x4,%esp
c0005091:	50                   	push   %eax
c0005092:	ff 75 0c             	pushl  0xc(%ebp)
c0005095:	6a 01                	push   $0x1
c0005097:	e8 2e 42 00 00       	call   c00092ca <send_rec>
c000509c:	83 c4 10             	add    $0x10,%esp
c000509f:	90                   	nop
c00050a0:	c9                   	leave  
c00050a1:	c3                   	ret    

c00050a2 <tty_do_write>:
c00050a2:	55                   	push   %ebp
c00050a3:	89 e5                	mov    %esp,%ebp
c00050a5:	53                   	push   %ebx
c00050a6:	81 ec 94 00 00 00    	sub    $0x94,%esp
c00050ac:	89 e0                	mov    %esp,%eax
c00050ae:	89 c3                	mov    %eax,%ebx
c00050b0:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c00050b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00050ba:	8d 50 ff             	lea    -0x1(%eax),%edx
c00050bd:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00050c0:	89 c2                	mov    %eax,%edx
c00050c2:	b8 10 00 00 00       	mov    $0x10,%eax
c00050c7:	83 e8 01             	sub    $0x1,%eax
c00050ca:	01 d0                	add    %edx,%eax
c00050cc:	b9 10 00 00 00       	mov    $0x10,%ecx
c00050d1:	ba 00 00 00 00       	mov    $0x0,%edx
c00050d6:	f7 f1                	div    %ecx
c00050d8:	6b c0 10             	imul   $0x10,%eax,%eax
c00050db:	29 c4                	sub    %eax,%esp
c00050dd:	89 e0                	mov    %esp,%eax
c00050df:	83 c0 00             	add    $0x0,%eax
c00050e2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00050e5:	83 ec 04             	sub    $0x4,%esp
c00050e8:	ff 75 e8             	pushl  -0x18(%ebp)
c00050eb:	6a 00                	push   $0x0
c00050ed:	ff 75 e0             	pushl  -0x20(%ebp)
c00050f0:	e8 ea 53 00 00       	call   c000a4df <Memset>
c00050f5:	83 c4 10             	add    $0x10,%esp
c00050f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00050fb:	8b 40 50             	mov    0x50(%eax),%eax
c00050fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005101:	8b 45 08             	mov    0x8(%ebp),%eax
c0005104:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000510b:	00 00 00 
c000510e:	e9 98 00 00 00       	jmp    c00051ab <tty_do_write+0x109>
c0005113:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005116:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005119:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c000511d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005120:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005123:	8b 40 10             	mov    0x10(%eax),%eax
c0005126:	89 c2                	mov    %eax,%edx
c0005128:	8b 45 0c             	mov    0xc(%ebp),%eax
c000512b:	8b 40 58             	mov    0x58(%eax),%eax
c000512e:	83 ec 08             	sub    $0x8,%esp
c0005131:	52                   	push   %edx
c0005132:	50                   	push   %eax
c0005133:	e8 a6 f6 ff ff       	call   c00047de <v2l>
c0005138:	83 c4 10             	add    $0x10,%esp
c000513b:	89 c2                	mov    %eax,%edx
c000513d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005140:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005146:	01 d0                	add    %edx,%eax
c0005148:	83 ec 04             	sub    $0x4,%esp
c000514b:	ff 75 f0             	pushl  -0x10(%ebp)
c000514e:	50                   	push   %eax
c000514f:	ff 75 e0             	pushl  -0x20(%ebp)
c0005152:	e8 5a 53 00 00       	call   c000a4b1 <Memcpy>
c0005157:	83 c4 10             	add    $0x10,%esp
c000515a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000515d:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0005160:	8b 45 08             	mov    0x8(%ebp),%eax
c0005163:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005169:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000516c:	01 c2                	add    %eax,%edx
c000516e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005171:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005177:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000517e:	eb 25                	jmp    c00051a5 <tty_do_write+0x103>
c0005180:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005183:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005186:	01 d0                	add    %edx,%eax
c0005188:	0f b6 00             	movzbl (%eax),%eax
c000518b:	0f b6 c0             	movzbl %al,%eax
c000518e:	83 ec 08             	sub    $0x8,%esp
c0005191:	50                   	push   %eax
c0005192:	ff 75 08             	pushl  0x8(%ebp)
c0005195:	e8 9f fa ff ff       	call   c0004c39 <out_char>
c000519a:	83 c4 10             	add    $0x10,%esp
c000519d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00051a1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c00051a5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00051a9:	75 d5                	jne    c0005180 <tty_do_write+0xde>
c00051ab:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00051af:	0f 85 5e ff ff ff    	jne    c0005113 <tty_do_write+0x71>
c00051b5:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
c00051bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00051bf:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00051c5:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00051c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00051cb:	8b 00                	mov    (%eax),%eax
c00051cd:	83 ec 04             	sub    $0x4,%esp
c00051d0:	50                   	push   %eax
c00051d1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c00051d7:	50                   	push   %eax
c00051d8:	6a 01                	push   $0x1
c00051da:	e8 eb 40 00 00       	call   c00092ca <send_rec>
c00051df:	83 c4 10             	add    $0x10,%esp
c00051e2:	89 dc                	mov    %ebx,%esp
c00051e4:	90                   	nop
c00051e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00051e8:	c9                   	leave  
c00051e9:	c3                   	ret    

c00051ea <init_screen>:
c00051ea:	55                   	push   %ebp
c00051eb:	89 e5                	mov    %esp,%ebp
c00051ed:	83 ec 10             	sub    $0x10,%esp
c00051f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f3:	2d c0 ed 00 c0       	sub    $0xc000edc0,%eax
c00051f8:	c1 f8 02             	sar    $0x2,%eax
c00051fb:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c0005201:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005204:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005207:	c1 e0 04             	shl    $0x4,%eax
c000520a:	8d 90 00 0f 01 c0    	lea    -0x3ffef100(%eax),%edx
c0005210:	8b 45 08             	mov    0x8(%ebp),%eax
c0005213:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005219:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005220:	8b 45 08             	mov    0x8(%ebp),%eax
c0005223:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
c0005229:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000522c:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c0005231:	f7 e2                	mul    %edx
c0005233:	89 d0                	mov    %edx,%eax
c0005235:	d1 e8                	shr    %eax
c0005237:	89 41 04             	mov    %eax,0x4(%ecx)
c000523a:	8b 45 08             	mov    0x8(%ebp),%eax
c000523d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005243:	8b 50 04             	mov    0x4(%eax),%edx
c0005246:	8b 45 08             	mov    0x8(%ebp),%eax
c0005249:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000524f:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0005253:	89 10                	mov    %edx,(%eax)
c0005255:	8b 45 08             	mov    0x8(%ebp),%eax
c0005258:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c000525e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005261:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005267:	8b 12                	mov    (%edx),%edx
c0005269:	89 50 08             	mov    %edx,0x8(%eax)
c000526c:	8b 55 08             	mov    0x8(%ebp),%edx
c000526f:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
c0005275:	8b 40 08             	mov    0x8(%eax),%eax
c0005278:	89 42 0c             	mov    %eax,0xc(%edx)
c000527b:	90                   	nop
c000527c:	c9                   	leave  
c000527d:	c3                   	ret    

c000527e <init_tty>:
c000527e:	55                   	push   %ebp
c000527f:	89 e5                	mov    %esp,%ebp
c0005281:	83 ec 18             	sub    $0x18,%esp
c0005284:	c7 45 f4 c0 ed 00 c0 	movl   $0xc000edc0,-0xc(%ebp)
c000528b:	eb 7a                	jmp    c0005307 <init_tty+0x89>
c000528d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005290:	8d 50 08             	lea    0x8(%eax),%edx
c0005293:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005296:	89 50 04             	mov    %edx,0x4(%eax)
c0005299:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000529c:	8b 50 04             	mov    0x4(%eax),%edx
c000529f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00052a2:	89 10                	mov    %edx,(%eax)
c00052a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00052a7:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c00052ae:	00 00 00 
c00052b1:	ff 75 f4             	pushl  -0xc(%ebp)
c00052b4:	e8 31 ff ff ff       	call   c00051ea <init_screen>
c00052b9:	83 c4 04             	add    $0x4,%esp
c00052bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00052bf:	2d c0 ed 00 c0       	sub    $0xc000edc0,%eax
c00052c4:	85 c0                	test   %eax,%eax
c00052c6:	7e 38                	jle    c0005300 <init_tty+0x82>
c00052c8:	83 ec 08             	sub    $0x8,%esp
c00052cb:	6a 23                	push   $0x23
c00052cd:	ff 75 f4             	pushl  -0xc(%ebp)
c00052d0:	e8 64 f9 ff ff       	call   c0004c39 <out_char>
c00052d5:	83 c4 10             	add    $0x10,%esp
c00052d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00052db:	05 e4 8e 01 00       	add    $0x18ee4,%eax
c00052e0:	2d c0 ed 00 c0       	sub    $0xc000edc0,%eax
c00052e5:	c1 f8 02             	sar    $0x2,%eax
c00052e8:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c00052ee:	0f b6 c0             	movzbl %al,%eax
c00052f1:	83 ec 08             	sub    $0x8,%esp
c00052f4:	50                   	push   %eax
c00052f5:	ff 75 f4             	pushl  -0xc(%ebp)
c00052f8:	e8 3c f9 ff ff       	call   c0004c39 <out_char>
c00052fd:	83 c4 10             	add    $0x10,%esp
c0005300:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0005307:	b8 2c 06 01 c0       	mov    $0xc001062c,%eax
c000530c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000530f:	0f 82 78 ff ff ff    	jb     c000528d <init_tty+0xf>
c0005315:	90                   	nop
c0005316:	c9                   	leave  
c0005317:	c3                   	ret    

c0005318 <TaskTTY>:
c0005318:	55                   	push   %ebp
c0005319:	89 e5                	mov    %esp,%ebp
c000531b:	83 ec 78             	sub    $0x78,%esp
c000531e:	83 ec 0c             	sub    $0xc,%esp
c0005321:	68 91 9c 00 c0       	push   $0xc0009c91
c0005326:	e8 51 c2 ff ff       	call   c000157c <disp_str>
c000532b:	83 c4 10             	add    $0x10,%esp
c000532e:	eb fe                	jmp    c000532e <TaskTTY+0x16>

c0005330 <keyboard_handler>:
c0005330:	55                   	push   %ebp
c0005331:	89 e5                	mov    %esp,%ebp
c0005333:	83 ec 18             	sub    $0x18,%esp
c0005336:	c7 05 c0 06 01 c0 01 	movl   $0x1,0xc00106c0
c000533d:	00 00 00 
c0005340:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005347:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c000534c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005351:	7f 5c                	jg     c00053af <keyboard_handler+0x7f>
c0005353:	e8 66 c4 ff ff       	call   c00017be <disable_int>
c0005358:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000535b:	0f b7 c0             	movzwl %ax,%eax
c000535e:	83 ec 0c             	sub    $0xc,%esp
c0005361:	50                   	push   %eax
c0005362:	e8 29 c4 ff ff       	call   c0001790 <in_byte>
c0005367:	83 c4 10             	add    $0x10,%esp
c000536a:	88 45 f3             	mov    %al,-0xd(%ebp)
c000536d:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c0005372:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005376:	88 10                	mov    %dl,(%eax)
c0005378:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c000537d:	83 c0 01             	add    $0x1,%eax
c0005380:	a3 a0 eb 00 c0       	mov    %eax,0xc000eba0
c0005385:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c000538a:	83 c0 01             	add    $0x1,%eax
c000538d:	a3 a8 eb 00 c0       	mov    %eax,0xc000eba8
c0005392:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c0005397:	ba ac ed 00 c0       	mov    $0xc000edac,%edx
c000539c:	39 d0                	cmp    %edx,%eax
c000539e:	72 0a                	jb     c00053aa <keyboard_handler+0x7a>
c00053a0:	c7 05 a0 eb 00 c0 ac 	movl   $0xc000ebac,0xc000eba0
c00053a7:	eb 00 c0 
c00053aa:	e8 11 c4 ff ff       	call   c00017c0 <enable_int>
c00053af:	90                   	nop
c00053b0:	c9                   	leave  
c00053b1:	c3                   	ret    

c00053b2 <read_from_keyboard_buf>:
c00053b2:	55                   	push   %ebp
c00053b3:	89 e5                	mov    %esp,%ebp
c00053b5:	83 ec 18             	sub    $0x18,%esp
c00053b8:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c00053bc:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c00053c1:	85 c0                	test   %eax,%eax
c00053c3:	7e 47                	jle    c000540c <read_from_keyboard_buf+0x5a>
c00053c5:	e8 f4 c3 ff ff       	call   c00017be <disable_int>
c00053ca:	a1 a4 eb 00 c0       	mov    0xc000eba4,%eax
c00053cf:	0f b6 00             	movzbl (%eax),%eax
c00053d2:	88 45 f7             	mov    %al,-0x9(%ebp)
c00053d5:	a1 a4 eb 00 c0       	mov    0xc000eba4,%eax
c00053da:	83 c0 01             	add    $0x1,%eax
c00053dd:	a3 a4 eb 00 c0       	mov    %eax,0xc000eba4
c00053e2:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c00053e7:	83 e8 01             	sub    $0x1,%eax
c00053ea:	a3 a8 eb 00 c0       	mov    %eax,0xc000eba8
c00053ef:	a1 a4 eb 00 c0       	mov    0xc000eba4,%eax
c00053f4:	ba ac ed 00 c0       	mov    $0xc000edac,%edx
c00053f9:	39 d0                	cmp    %edx,%eax
c00053fb:	72 0a                	jb     c0005407 <read_from_keyboard_buf+0x55>
c00053fd:	c7 05 a4 eb 00 c0 ac 	movl   $0xc000ebac,0xc000eba4
c0005404:	eb 00 c0 
c0005407:	e8 b4 c3 ff ff       	call   c00017c0 <enable_int>
c000540c:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005410:	c9                   	leave  
c0005411:	c3                   	ret    

c0005412 <keyboard_read>:
c0005412:	55                   	push   %ebp
c0005413:	89 e5                	mov    %esp,%ebp
c0005415:	83 ec 28             	sub    $0x28,%esp
c0005418:	90                   	nop
c0005419:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c000541e:	85 c0                	test   %eax,%eax
c0005420:	7e f7                	jle    c0005419 <keyboard_read+0x7>
c0005422:	e8 8b ff ff ff       	call   c00053b2 <read_from_keyboard_buf>
c0005427:	88 45 ea             	mov    %al,-0x16(%ebp)
c000542a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005431:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005435:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005439:	75 5a                	jne    c0005495 <keyboard_read+0x83>
c000543b:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c000543f:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005443:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005447:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c000544b:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c000544f:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005453:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005457:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000545e:	eb 20                	jmp    c0005480 <keyboard_read+0x6e>
c0005460:	e8 4d ff ff ff       	call   c00053b2 <read_from_keyboard_buf>
c0005465:	89 c1                	mov    %eax,%ecx
c0005467:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c000546a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000546d:	01 d0                	add    %edx,%eax
c000546f:	0f b6 00             	movzbl (%eax),%eax
c0005472:	38 c1                	cmp    %al,%cl
c0005474:	74 06                	je     c000547c <keyboard_read+0x6a>
c0005476:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c000547a:	eb 0a                	jmp    c0005486 <keyboard_read+0x74>
c000547c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005480:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005484:	7e da                	jle    c0005460 <keyboard_read+0x4e>
c0005486:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c000548a:	74 68                	je     c00054f4 <keyboard_read+0xe2>
c000548c:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005493:	eb 5f                	jmp    c00054f4 <keyboard_read+0xe2>
c0005495:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005499:	75 59                	jne    c00054f4 <keyboard_read+0xe2>
c000549b:	e8 12 ff ff ff       	call   c00053b2 <read_from_keyboard_buf>
c00054a0:	3c 2a                	cmp    $0x2a,%al
c00054a2:	75 1d                	jne    c00054c1 <keyboard_read+0xaf>
c00054a4:	e8 09 ff ff ff       	call   c00053b2 <read_from_keyboard_buf>
c00054a9:	3c e0                	cmp    $0xe0,%al
c00054ab:	75 14                	jne    c00054c1 <keyboard_read+0xaf>
c00054ad:	e8 00 ff ff ff       	call   c00053b2 <read_from_keyboard_buf>
c00054b2:	3c 37                	cmp    $0x37,%al
c00054b4:	75 0b                	jne    c00054c1 <keyboard_read+0xaf>
c00054b6:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00054bd:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c00054c1:	e8 ec fe ff ff       	call   c00053b2 <read_from_keyboard_buf>
c00054c6:	3c b7                	cmp    $0xb7,%al
c00054c8:	75 1d                	jne    c00054e7 <keyboard_read+0xd5>
c00054ca:	e8 e3 fe ff ff       	call   c00053b2 <read_from_keyboard_buf>
c00054cf:	3c e0                	cmp    $0xe0,%al
c00054d1:	75 14                	jne    c00054e7 <keyboard_read+0xd5>
c00054d3:	e8 da fe ff ff       	call   c00053b2 <read_from_keyboard_buf>
c00054d8:	3c aa                	cmp    $0xaa,%al
c00054da:	75 0b                	jne    c00054e7 <keyboard_read+0xd5>
c00054dc:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00054e3:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00054e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00054eb:	75 07                	jne    c00054f4 <keyboard_read+0xe2>
c00054ed:	c6 05 44 e7 00 c0 01 	movb   $0x1,0xc000e744
c00054f4:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c00054fb:	0f 84 8d 00 00 00    	je     c000558e <keyboard_read+0x17c>
c0005501:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005508:	0f 84 80 00 00 00    	je     c000558e <keyboard_read+0x17c>
c000550e:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005512:	0f 94 c2             	sete   %dl
c0005515:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005519:	0f 94 c0             	sete   %al
c000551c:	09 d0                	or     %edx,%eax
c000551e:	84 c0                	test   %al,%al
c0005520:	74 07                	je     c0005529 <keyboard_read+0x117>
c0005522:	c6 05 c4 06 01 c0 01 	movb   $0x1,0xc00106c4
c0005529:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c000552d:	f7 d0                	not    %eax
c000552f:	c0 e8 07             	shr    $0x7,%al
c0005532:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005535:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005539:	74 53                	je     c000558e <keyboard_read+0x17c>
c000553b:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c000553f:	74 4d                	je     c000558e <keyboard_read+0x17c>
c0005541:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005545:	0f b6 05 c4 06 01 c0 	movzbl 0xc00106c4,%eax
c000554c:	3c 01                	cmp    $0x1,%al
c000554e:	75 04                	jne    c0005554 <keyboard_read+0x142>
c0005550:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005554:	0f b6 05 44 e7 00 c0 	movzbl 0xc000e744,%eax
c000555b:	84 c0                	test   %al,%al
c000555d:	74 04                	je     c0005563 <keyboard_read+0x151>
c000555f:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005563:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005567:	89 d0                	mov    %edx,%eax
c0005569:	01 c0                	add    %eax,%eax
c000556b:	01 c2                	add    %eax,%edx
c000556d:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005571:	01 d0                	add    %edx,%eax
c0005573:	8b 04 85 20 d1 00 c0 	mov    -0x3fff2ee0(,%eax,4),%eax
c000557a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000557d:	83 ec 08             	sub    $0x8,%esp
c0005580:	ff 75 f4             	pushl  -0xc(%ebp)
c0005583:	ff 75 08             	pushl  0x8(%ebp)
c0005586:	e8 1a 00 00 00       	call   c00055a5 <in_process>
c000558b:	83 c4 10             	add    $0x10,%esp
c000558e:	90                   	nop
c000558f:	c9                   	leave  
c0005590:	c3                   	ret    

c0005591 <init_keyboard_handler>:
c0005591:	55                   	push   %ebp
c0005592:	89 e5                	mov    %esp,%ebp
c0005594:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c000559b:	c6 05 c4 06 01 c0 00 	movb   $0x0,0xc00106c4
c00055a2:	90                   	nop
c00055a3:	5d                   	pop    %ebp
c00055a4:	c3                   	ret    

c00055a5 <in_process>:
c00055a5:	55                   	push   %ebp
c00055a6:	89 e5                	mov    %esp,%ebp
c00055a8:	83 ec 18             	sub    $0x18,%esp
c00055ab:	83 ec 04             	sub    $0x4,%esp
c00055ae:	6a 02                	push   $0x2
c00055b0:	6a 00                	push   $0x0
c00055b2:	8d 45 f6             	lea    -0xa(%ebp),%eax
c00055b5:	50                   	push   %eax
c00055b6:	e8 24 4f 00 00       	call   c000a4df <Memset>
c00055bb:	83 c4 10             	add    $0x10,%esp
c00055be:	8b 45 0c             	mov    0xc(%ebp),%eax
c00055c1:	25 00 01 00 00       	and    $0x100,%eax
c00055c6:	85 c0                	test   %eax,%eax
c00055c8:	75 28                	jne    c00055f2 <in_process+0x4d>
c00055ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c00055cd:	0f b6 c0             	movzbl %al,%eax
c00055d0:	83 ec 08             	sub    $0x8,%esp
c00055d3:	50                   	push   %eax
c00055d4:	ff 75 08             	pushl  0x8(%ebp)
c00055d7:	e8 44 f5 ff ff       	call   c0004b20 <put_key>
c00055dc:	83 c4 10             	add    $0x10,%esp
c00055df:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c00055e6:	c6 05 c4 06 01 c0 00 	movb   $0x0,0xc00106c4
c00055ed:	e9 42 01 00 00       	jmp    c0005734 <in_process+0x18f>
c00055f2:	0f b6 05 c4 06 01 c0 	movzbl 0xc00106c4,%eax
c00055f9:	84 c0                	test   %al,%al
c00055fb:	0f 84 a9 00 00 00    	je     c00056aa <in_process+0x105>
c0005601:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005605:	0f 84 9f 00 00 00    	je     c00056aa <in_process+0x105>
c000560b:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c000560f:	0f 84 95 00 00 00    	je     c00056aa <in_process+0x105>
c0005615:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000561c:	74 64                	je     c0005682 <in_process+0xdd>
c000561e:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005625:	77 0b                	ja     c0005632 <in_process+0x8d>
c0005627:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c000562e:	74 64                	je     c0005694 <in_process+0xef>
c0005630:	eb 73                	jmp    c00056a5 <in_process+0x100>
c0005632:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005639:	74 0b                	je     c0005646 <in_process+0xa1>
c000563b:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005642:	74 20                	je     c0005664 <in_process+0xbf>
c0005644:	eb 5f                	jmp    c00056a5 <in_process+0x100>
c0005646:	83 ec 0c             	sub    $0xc,%esp
c0005649:	ff 75 08             	pushl  0x8(%ebp)
c000564c:	e8 3b f5 ff ff       	call   c0004b8c <scroll_up>
c0005651:	83 c4 10             	add    $0x10,%esp
c0005654:	c6 05 c4 06 01 c0 00 	movb   $0x0,0xc00106c4
c000565b:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c0005662:	eb 41                	jmp    c00056a5 <in_process+0x100>
c0005664:	83 ec 0c             	sub    $0xc,%esp
c0005667:	ff 75 08             	pushl  0x8(%ebp)
c000566a:	e8 5f f5 ff ff       	call   c0004bce <scroll_down>
c000566f:	83 c4 10             	add    $0x10,%esp
c0005672:	c6 05 c4 06 01 c0 00 	movb   $0x0,0xc00106c4
c0005679:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c0005680:	eb 23                	jmp    c00056a5 <in_process+0x100>
c0005682:	83 ec 08             	sub    $0x8,%esp
c0005685:	6a 0a                	push   $0xa
c0005687:	ff 75 08             	pushl  0x8(%ebp)
c000568a:	e8 aa f5 ff ff       	call   c0004c39 <out_char>
c000568f:	83 c4 10             	add    $0x10,%esp
c0005692:	eb 11                	jmp    c00056a5 <in_process+0x100>
c0005694:	83 ec 08             	sub    $0x8,%esp
c0005697:	6a 08                	push   $0x8
c0005699:	ff 75 08             	pushl  0x8(%ebp)
c000569c:	e8 98 f5 ff ff       	call   c0004c39 <out_char>
c00056a1:	83 c4 10             	add    $0x10,%esp
c00056a4:	90                   	nop
c00056a5:	e9 8a 00 00 00       	jmp    c0005734 <in_process+0x18f>
c00056aa:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c00056b1:	74 55                	je     c0005708 <in_process+0x163>
c00056b3:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c00056ba:	77 14                	ja     c00056d0 <in_process+0x12b>
c00056bc:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c00056c3:	74 31                	je     c00056f6 <in_process+0x151>
c00056c5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00056cc:	74 16                	je     c00056e4 <in_process+0x13f>
c00056ce:	eb 64                	jmp    c0005734 <in_process+0x18f>
c00056d0:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c00056d7:	74 3e                	je     c0005717 <in_process+0x172>
c00056d9:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c00056e0:	74 44                	je     c0005726 <in_process+0x181>
c00056e2:	eb 50                	jmp    c0005734 <in_process+0x18f>
c00056e4:	83 ec 08             	sub    $0x8,%esp
c00056e7:	6a 0a                	push   $0xa
c00056e9:	ff 75 08             	pushl  0x8(%ebp)
c00056ec:	e8 2f f4 ff ff       	call   c0004b20 <put_key>
c00056f1:	83 c4 10             	add    $0x10,%esp
c00056f4:	eb 3e                	jmp    c0005734 <in_process+0x18f>
c00056f6:	83 ec 08             	sub    $0x8,%esp
c00056f9:	6a 08                	push   $0x8
c00056fb:	ff 75 08             	pushl  0x8(%ebp)
c00056fe:	e8 1d f4 ff ff       	call   c0004b20 <put_key>
c0005703:	83 c4 10             	add    $0x10,%esp
c0005706:	eb 2c                	jmp    c0005734 <in_process+0x18f>
c0005708:	83 ec 0c             	sub    $0xc,%esp
c000570b:	6a 00                	push   $0x0
c000570d:	e8 dd f2 ff ff       	call   c00049ef <select_console>
c0005712:	83 c4 10             	add    $0x10,%esp
c0005715:	eb 1d                	jmp    c0005734 <in_process+0x18f>
c0005717:	83 ec 0c             	sub    $0xc,%esp
c000571a:	6a 01                	push   $0x1
c000571c:	e8 ce f2 ff ff       	call   c00049ef <select_console>
c0005721:	83 c4 10             	add    $0x10,%esp
c0005724:	eb 0e                	jmp    c0005734 <in_process+0x18f>
c0005726:	83 ec 0c             	sub    $0xc,%esp
c0005729:	6a 02                	push   $0x2
c000572b:	e8 bf f2 ff ff       	call   c00049ef <select_console>
c0005730:	83 c4 10             	add    $0x10,%esp
c0005733:	90                   	nop
c0005734:	90                   	nop
c0005735:	c9                   	leave  
c0005736:	c3                   	ret    

c0005737 <open>:
c0005737:	55                   	push   %ebp
c0005738:	89 e5                	mov    %esp,%ebp
c000573a:	83 ec 78             	sub    $0x78,%esp
c000573d:	83 ec 04             	sub    $0x4,%esp
c0005740:	6a 6c                	push   $0x6c
c0005742:	6a 00                	push   $0x0
c0005744:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005747:	50                   	push   %eax
c0005748:	e8 92 4d 00 00       	call   c000a4df <Memset>
c000574d:	83 c4 10             	add    $0x10,%esp
c0005750:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0005757:	8b 45 08             	mov    0x8(%ebp),%eax
c000575a:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000575d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005760:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005763:	83 ec 0c             	sub    $0xc,%esp
c0005766:	ff 75 08             	pushl  0x8(%ebp)
c0005769:	e8 aa 4d 00 00       	call   c000a518 <Strlen>
c000576e:	83 c4 10             	add    $0x10,%esp
c0005771:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005774:	83 ec 04             	sub    $0x4,%esp
c0005777:	6a 03                	push   $0x3
c0005779:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000577c:	50                   	push   %eax
c000577d:	6a 03                	push   $0x3
c000577f:	e8 46 3b 00 00       	call   c00092ca <send_rec>
c0005784:	83 c4 10             	add    $0x10,%esp
c0005787:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000578a:	c9                   	leave  
c000578b:	c3                   	ret    

c000578c <read>:
c000578c:	55                   	push   %ebp
c000578d:	89 e5                	mov    %esp,%ebp
c000578f:	83 ec 78             	sub    $0x78,%esp
c0005792:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
c0005799:	8b 45 08             	mov    0x8(%ebp),%eax
c000579c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000579f:	8b 45 0c             	mov    0xc(%ebp),%eax
c00057a2:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00057a5:	8b 45 10             	mov    0x10(%ebp),%eax
c00057a8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00057ab:	83 ec 04             	sub    $0x4,%esp
c00057ae:	6a 03                	push   $0x3
c00057b0:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00057b3:	50                   	push   %eax
c00057b4:	6a 03                	push   $0x3
c00057b6:	e8 0f 3b 00 00       	call   c00092ca <send_rec>
c00057bb:	83 c4 10             	add    $0x10,%esp
c00057be:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00057c1:	c9                   	leave  
c00057c2:	c3                   	ret    

c00057c3 <write>:
c00057c3:	55                   	push   %ebp
c00057c4:	89 e5                	mov    %esp,%ebp
c00057c6:	83 ec 78             	sub    $0x78,%esp
c00057c9:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
c00057d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00057d3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00057d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00057d9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00057dc:	8b 45 10             	mov    0x10(%ebp),%eax
c00057df:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00057e2:	83 ec 04             	sub    $0x4,%esp
c00057e5:	6a 03                	push   $0x3
c00057e7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00057ea:	50                   	push   %eax
c00057eb:	6a 03                	push   $0x3
c00057ed:	e8 d8 3a 00 00       	call   c00092ca <send_rec>
c00057f2:	83 c4 10             	add    $0x10,%esp
c00057f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00057f8:	c9                   	leave  
c00057f9:	c3                   	ret    

c00057fa <close>:
c00057fa:	55                   	push   %ebp
c00057fb:	89 e5                	mov    %esp,%ebp
c00057fd:	83 ec 78             	sub    $0x78,%esp
c0005800:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005807:	8b 45 08             	mov    0x8(%ebp),%eax
c000580a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000580d:	83 ec 04             	sub    $0x4,%esp
c0005810:	6a 03                	push   $0x3
c0005812:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005815:	50                   	push   %eax
c0005816:	6a 03                	push   $0x3
c0005818:	e8 ad 3a 00 00       	call   c00092ca <send_rec>
c000581d:	83 c4 10             	add    $0x10,%esp
c0005820:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005823:	83 f8 65             	cmp    $0x65,%eax
c0005826:	74 19                	je     c0005841 <close+0x47>
c0005828:	6a 14                	push   $0x14
c000582a:	68 9b 9c 00 c0       	push   $0xc0009c9b
c000582f:	68 9b 9c 00 c0       	push   $0xc0009c9b
c0005834:	68 a7 9c 00 c0       	push   $0xc0009ca7
c0005839:	e8 14 32 00 00       	call   c0008a52 <assertion_failure>
c000583e:	83 c4 10             	add    $0x10,%esp
c0005841:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005844:	c9                   	leave  
c0005845:	c3                   	ret    

c0005846 <wait>:
c0005846:	55                   	push   %ebp
c0005847:	89 e5                	mov    %esp,%ebp
c0005849:	83 ec 78             	sub    $0x78,%esp
c000584c:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005853:	83 ec 04             	sub    $0x4,%esp
c0005856:	6a 04                	push   $0x4
c0005858:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000585b:	50                   	push   %eax
c000585c:	6a 03                	push   $0x3
c000585e:	e8 67 3a 00 00       	call   c00092ca <send_rec>
c0005863:	83 c4 10             	add    $0x10,%esp
c0005866:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005869:	89 c2                	mov    %eax,%edx
c000586b:	8b 45 08             	mov    0x8(%ebp),%eax
c000586e:	89 10                	mov    %edx,(%eax)
c0005870:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005873:	83 f8 1d             	cmp    $0x1d,%eax
c0005876:	74 05                	je     c000587d <wait+0x37>
c0005878:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000587b:	eb 05                	jmp    c0005882 <wait+0x3c>
c000587d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005882:	c9                   	leave  
c0005883:	c3                   	ret    

c0005884 <exit>:
c0005884:	55                   	push   %ebp
c0005885:	89 e5                	mov    %esp,%ebp
c0005887:	83 ec 78             	sub    $0x78,%esp
c000588a:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005891:	8b 45 08             	mov    0x8(%ebp),%eax
c0005894:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005897:	83 ec 04             	sub    $0x4,%esp
c000589a:	6a 04                	push   $0x4
c000589c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000589f:	50                   	push   %eax
c00058a0:	6a 03                	push   $0x3
c00058a2:	e8 23 3a 00 00       	call   c00092ca <send_rec>
c00058a7:	83 c4 10             	add    $0x10,%esp
c00058aa:	90                   	nop
c00058ab:	c9                   	leave  
c00058ac:	c3                   	ret    

c00058ad <fork>:
c00058ad:	55                   	push   %ebp
c00058ae:	89 e5                	mov    %esp,%ebp
c00058b0:	83 ec 78             	sub    $0x78,%esp
c00058b3:	83 ec 04             	sub    $0x4,%esp
c00058b6:	6a 6c                	push   $0x6c
c00058b8:	6a 00                	push   $0x0
c00058ba:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00058bd:	50                   	push   %eax
c00058be:	e8 1c 4c 00 00       	call   c000a4df <Memset>
c00058c3:	83 c4 10             	add    $0x10,%esp
c00058c6:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00058cd:	83 ec 04             	sub    $0x4,%esp
c00058d0:	6a 04                	push   $0x4
c00058d2:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00058d5:	50                   	push   %eax
c00058d6:	6a 03                	push   $0x3
c00058d8:	e8 ed 39 00 00       	call   c00092ca <send_rec>
c00058dd:	83 c4 10             	add    $0x10,%esp
c00058e0:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00058e7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00058ea:	85 c0                	test   %eax,%eax
c00058ec:	74 19                	je     c0005907 <fork+0x5a>
c00058ee:	6a 15                	push   $0x15
c00058f0:	68 bf 9c 00 c0       	push   $0xc0009cbf
c00058f5:	68 bf 9c 00 c0       	push   $0xc0009cbf
c00058fa:	68 ca 9c 00 c0       	push   $0xc0009cca
c00058ff:	e8 4e 31 00 00       	call   c0008a52 <assertion_failure>
c0005904:	83 c4 10             	add    $0x10,%esp
c0005907:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000590a:	c9                   	leave  
c000590b:	c3                   	ret    

c000590c <getpid>:
c000590c:	55                   	push   %ebp
c000590d:	89 e5                	mov    %esp,%ebp
c000590f:	83 ec 78             	sub    $0x78,%esp
c0005912:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005919:	83 ec 04             	sub    $0x4,%esp
c000591c:	6a 01                	push   $0x1
c000591e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005921:	50                   	push   %eax
c0005922:	6a 03                	push   $0x3
c0005924:	e8 a1 39 00 00       	call   c00092ca <send_rec>
c0005929:	83 c4 10             	add    $0x10,%esp
c000592c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000592f:	c9                   	leave  
c0005930:	c3                   	ret    

c0005931 <exec>:
c0005931:	55                   	push   %ebp
c0005932:	89 e5                	mov    %esp,%ebp
c0005934:	83 ec 78             	sub    $0x78,%esp
c0005937:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c000593e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005941:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005944:	83 ec 0c             	sub    $0xc,%esp
c0005947:	ff 75 08             	pushl  0x8(%ebp)
c000594a:	e8 c9 4b 00 00       	call   c000a518 <Strlen>
c000594f:	83 c4 10             	add    $0x10,%esp
c0005952:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005955:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c000595c:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005963:	83 ec 04             	sub    $0x4,%esp
c0005966:	6a 04                	push   $0x4
c0005968:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000596b:	50                   	push   %eax
c000596c:	6a 03                	push   $0x3
c000596e:	e8 57 39 00 00       	call   c00092ca <send_rec>
c0005973:	83 c4 10             	add    $0x10,%esp
c0005976:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005979:	83 f8 65             	cmp    $0x65,%eax
c000597c:	74 19                	je     c0005997 <exec+0x66>
c000597e:	6a 1a                	push   $0x1a
c0005980:	68 da 9c 00 c0       	push   $0xc0009cda
c0005985:	68 da 9c 00 c0       	push   $0xc0009cda
c000598a:	68 e5 9c 00 c0       	push   $0xc0009ce5
c000598f:	e8 be 30 00 00       	call   c0008a52 <assertion_failure>
c0005994:	83 c4 10             	add    $0x10,%esp
c0005997:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000599a:	c9                   	leave  
c000599b:	c3                   	ret    

c000599c <execv>:
c000599c:	55                   	push   %ebp
c000599d:	89 e5                	mov    %esp,%ebp
c000599f:	57                   	push   %edi
c00059a0:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c00059a6:	83 ec 04             	sub    $0x4,%esp
c00059a9:	68 00 80 00 00       	push   $0x8000
c00059ae:	6a 00                	push   $0x0
c00059b0:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00059b6:	50                   	push   %eax
c00059b7:	e8 23 4b 00 00       	call   c000a4df <Memset>
c00059bc:	83 c4 10             	add    $0x10,%esp
c00059bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c00059c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00059c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00059cc:	eb 0d                	jmp    c00059db <execv+0x3f>
c00059ce:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00059d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059d5:	83 c0 04             	add    $0x4,%eax
c00059d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00059db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00059de:	8b 00                	mov    (%eax),%eax
c00059e0:	85 c0                	test   %eax,%eax
c00059e2:	75 ea                	jne    c00059ce <execv+0x32>
c00059e4:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00059ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059ed:	01 d0                	add    %edx,%eax
c00059ef:	c6 00 00             	movb   $0x0,(%eax)
c00059f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059f5:	83 c0 04             	add    $0x4,%eax
c00059f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00059fb:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005a01:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005a04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a07:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005a0a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005a11:	eb 64                	jmp    c0005a77 <execv+0xdb>
c0005a13:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005a19:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a1c:	01 c2                	add    %eax,%edx
c0005a1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a21:	89 10                	mov    %edx,(%eax)
c0005a23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005a26:	8b 00                	mov    (%eax),%eax
c0005a28:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0005a2e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005a31:	01 ca                	add    %ecx,%edx
c0005a33:	83 ec 08             	sub    $0x8,%esp
c0005a36:	50                   	push   %eax
c0005a37:	52                   	push   %edx
c0005a38:	e8 c1 4a 00 00       	call   c000a4fe <Strcpy>
c0005a3d:	83 c4 10             	add    $0x10,%esp
c0005a40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005a43:	8b 00                	mov    (%eax),%eax
c0005a45:	83 ec 0c             	sub    $0xc,%esp
c0005a48:	50                   	push   %eax
c0005a49:	e8 ca 4a 00 00       	call   c000a518 <Strlen>
c0005a4e:	83 c4 10             	add    $0x10,%esp
c0005a51:	01 45 f0             	add    %eax,-0x10(%ebp)
c0005a54:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a5d:	01 d0                	add    %edx,%eax
c0005a5f:	c6 00 00             	movb   $0x0,(%eax)
c0005a62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a65:	83 c0 01             	add    $0x1,%eax
c0005a68:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005a6b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0005a6f:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005a73:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005a77:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005a7a:	8b 00                	mov    (%eax),%eax
c0005a7c:	85 c0                	test   %eax,%eax
c0005a7e:	75 93                	jne    c0005a13 <execv+0x77>
c0005a80:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005a86:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005a89:	eb 04                	jmp    c0005a8f <execv+0xf3>
c0005a8b:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0005a8f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005a92:	8b 00                	mov    (%eax),%eax
c0005a94:	85 c0                	test   %eax,%eax
c0005a96:	75 f3                	jne    c0005a8b <execv+0xef>
c0005a98:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0005a9e:	b8 00 00 00 00       	mov    $0x0,%eax
c0005aa3:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0005aa8:	89 d7                	mov    %edx,%edi
c0005aaa:	f3 ab                	rep stos %eax,%es:(%edi)
c0005aac:	c7 85 4c 7f ff ff fd 	movl   $0xc0009cfd,-0x80b4(%ebp)
c0005ab3:	9c 00 c0 
c0005ab6:	c7 85 50 7f ff ff 04 	movl   $0xc0009d04,-0x80b0(%ebp)
c0005abd:	9d 00 c0 
c0005ac0:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0005ac7:	00 00 00 
c0005aca:	8b 45 08             	mov    0x8(%ebp),%eax
c0005acd:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0005ad3:	83 ec 0c             	sub    $0xc,%esp
c0005ad6:	ff 75 08             	pushl  0x8(%ebp)
c0005ad9:	e8 3a 4a 00 00       	call   c000a518 <Strlen>
c0005ade:	83 c4 10             	add    $0x10,%esp
c0005ae1:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0005ae7:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005aed:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0005af3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005af6:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0005afc:	83 ec 04             	sub    $0x4,%esp
c0005aff:	6a 04                	push   $0x4
c0005b01:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0005b07:	50                   	push   %eax
c0005b08:	6a 03                	push   $0x3
c0005b0a:	e8 bb 37 00 00       	call   c00092ca <send_rec>
c0005b0f:	83 c4 10             	add    $0x10,%esp
c0005b12:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0005b18:	83 f8 65             	cmp    $0x65,%eax
c0005b1b:	74 19                	je     c0005b36 <execv+0x19a>
c0005b1d:	6a 73                	push   $0x73
c0005b1f:	68 da 9c 00 c0       	push   $0xc0009cda
c0005b24:	68 da 9c 00 c0       	push   $0xc0009cda
c0005b29:	68 e5 9c 00 c0       	push   $0xc0009ce5
c0005b2e:	e8 1f 2f 00 00       	call   c0008a52 <assertion_failure>
c0005b33:	83 c4 10             	add    $0x10,%esp
c0005b36:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0005b3c:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0005b3f:	c9                   	leave  
c0005b40:	c3                   	ret    

c0005b41 <execl>:
c0005b41:	55                   	push   %ebp
c0005b42:	89 e5                	mov    %esp,%ebp
c0005b44:	83 ec 18             	sub    $0x18,%esp
c0005b47:	8d 45 0c             	lea    0xc(%ebp),%eax
c0005b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b50:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b53:	83 ec 08             	sub    $0x8,%esp
c0005b56:	ff 75 f0             	pushl  -0x10(%ebp)
c0005b59:	ff 75 08             	pushl  0x8(%ebp)
c0005b5c:	e8 3b fe ff ff       	call   c000599c <execv>
c0005b61:	83 c4 10             	add    $0x10,%esp
c0005b64:	c9                   	leave  
c0005b65:	c3                   	ret    

c0005b66 <TaskMM>:
c0005b66:	55                   	push   %ebp
c0005b67:	89 e5                	mov    %esp,%ebp
c0005b69:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0005b6f:	83 ec 04             	sub    $0x4,%esp
c0005b72:	6a 0e                	push   $0xe
c0005b74:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005b7a:	50                   	push   %eax
c0005b7b:	6a 02                	push   $0x2
c0005b7d:	e8 48 37 00 00       	call   c00092ca <send_rec>
c0005b82:	83 c4 10             	add    $0x10,%esp
c0005b85:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0005b8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b8e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0005b94:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005b97:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005b9e:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
c0005ba5:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0005bac:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
c0005bb3:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0005bb7:	74 4e                	je     c0005c07 <TaskMM+0xa1>
c0005bb9:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0005bbd:	7f 08                	jg     c0005bc7 <TaskMM+0x61>
c0005bbf:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0005bc3:	74 27                	je     c0005bec <TaskMM+0x86>
c0005bc5:	eb 79                	jmp    c0005c40 <TaskMM+0xda>
c0005bc7:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0005bcb:	74 08                	je     c0005bd5 <TaskMM+0x6f>
c0005bcd:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
c0005bd1:	74 52                	je     c0005c25 <TaskMM+0xbf>
c0005bd3:	eb 6b                	jmp    c0005c40 <TaskMM+0xda>
c0005bd5:	83 ec 0c             	sub    $0xc,%esp
c0005bd8:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005bde:	50                   	push   %eax
c0005bdf:	e8 f6 03 00 00       	call   c0005fda <do_fork>
c0005be4:	83 c4 10             	add    $0x10,%esp
c0005be7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0005bea:	eb 65                	jmp    c0005c51 <TaskMM+0xeb>
c0005bec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005bf3:	83 ec 0c             	sub    $0xc,%esp
c0005bf6:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005bfc:	50                   	push   %eax
c0005bfd:	e8 a8 00 00 00       	call   c0005caa <do_exec>
c0005c02:	83 c4 10             	add    $0x10,%esp
c0005c05:	eb 4a                	jmp    c0005c51 <TaskMM+0xeb>
c0005c07:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005c0e:	83 ec 08             	sub    $0x8,%esp
c0005c11:	ff 75 e4             	pushl  -0x1c(%ebp)
c0005c14:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005c1a:	50                   	push   %eax
c0005c1b:	e8 be 05 00 00       	call   c00061de <do_exit>
c0005c20:	83 c4 10             	add    $0x10,%esp
c0005c23:	eb 2c                	jmp    c0005c51 <TaskMM+0xeb>
c0005c25:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005c2c:	83 ec 0c             	sub    $0xc,%esp
c0005c2f:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005c35:	50                   	push   %eax
c0005c36:	e8 9f 06 00 00       	call   c00062da <do_wait>
c0005c3b:	83 c4 10             	add    $0x10,%esp
c0005c3e:	eb 11                	jmp    c0005c51 <TaskMM+0xeb>
c0005c40:	83 ec 0c             	sub    $0xc,%esp
c0005c43:	68 0b 9d 00 c0       	push   $0xc0009d0b
c0005c48:	e8 e7 2d 00 00       	call   c0008a34 <panic>
c0005c4d:	83 c4 10             	add    $0x10,%esp
c0005c50:	90                   	nop
c0005c51:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005c55:	0f 84 14 ff ff ff    	je     c0005b6f <TaskMM+0x9>
c0005c5b:	83 ec 04             	sub    $0x4,%esp
c0005c5e:	ff 75 ec             	pushl  -0x14(%ebp)
c0005c61:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
c0005c67:	50                   	push   %eax
c0005c68:	6a 01                	push   $0x1
c0005c6a:	e8 5b 36 00 00       	call   c00092ca <send_rec>
c0005c6f:	83 c4 10             	add    $0x10,%esp
c0005c72:	e9 f8 fe ff ff       	jmp    c0005b6f <TaskMM+0x9>

c0005c77 <alloc_mem>:
c0005c77:	55                   	push   %ebp
c0005c78:	89 e5                	mov    %esp,%ebp
c0005c7a:	83 ec 10             	sub    $0x10,%esp
c0005c7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c80:	83 e8 04             	sub    $0x4,%eax
c0005c83:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0005c89:	05 00 00 a0 00       	add    $0xa00000,%eax
c0005c8e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005c91:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005c94:	c9                   	leave  
c0005c95:	c3                   	ret    

c0005c96 <do_exec2>:
c0005c96:	55                   	push   %ebp
c0005c97:	89 e5                	mov    %esp,%ebp
c0005c99:	83 ec 10             	sub    $0x10,%esp
c0005c9c:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0005ca3:	b8 00 00 00 00       	mov    $0x0,%eax
c0005ca8:	c9                   	leave  
c0005ca9:	c3                   	ret    

c0005caa <do_exec>:
c0005caa:	55                   	push   %ebp
c0005cab:	89 e5                	mov    %esp,%ebp
c0005cad:	56                   	push   %esi
c0005cae:	53                   	push   %ebx
c0005caf:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0005cb5:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0005cbc:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0005cc3:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c0005cc9:	83 ec 08             	sub    $0x8,%esp
c0005ccc:	6a 00                	push   $0x0
c0005cce:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c0005cd1:	50                   	push   %eax
c0005cd2:	e8 60 fa ff ff       	call   c0005737 <open>
c0005cd7:	83 c4 10             	add    $0x10,%esp
c0005cda:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005cdd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ce0:	8b 00                	mov    (%eax),%eax
c0005ce2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005ce5:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0005cec:	83 ec 04             	sub    $0x4,%esp
c0005cef:	6a 0c                	push   $0xc
c0005cf1:	6a 00                	push   $0x0
c0005cf3:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0005cf9:	50                   	push   %eax
c0005cfa:	e8 e0 47 00 00       	call   c000a4df <Memset>
c0005cff:	83 c4 10             	add    $0x10,%esp
c0005d02:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d05:	8b 40 30             	mov    0x30(%eax),%eax
c0005d08:	89 c6                	mov    %eax,%esi
c0005d0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d0d:	8b 40 34             	mov    0x34(%eax),%eax
c0005d10:	83 ec 08             	sub    $0x8,%esp
c0005d13:	50                   	push   %eax
c0005d14:	ff 75 d8             	pushl  -0x28(%ebp)
c0005d17:	e8 c2 ea ff ff       	call   c00047de <v2l>
c0005d1c:	83 c4 10             	add    $0x10,%esp
c0005d1f:	89 c3                	mov    %eax,%ebx
c0005d21:	83 ec 08             	sub    $0x8,%esp
c0005d24:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0005d2a:	50                   	push   %eax
c0005d2b:	6a 04                	push   $0x4
c0005d2d:	e8 ac ea ff ff       	call   c00047de <v2l>
c0005d32:	83 c4 10             	add    $0x10,%esp
c0005d35:	83 ec 04             	sub    $0x4,%esp
c0005d38:	56                   	push   %esi
c0005d39:	53                   	push   %ebx
c0005d3a:	50                   	push   %eax
c0005d3b:	e8 71 47 00 00       	call   c000a4b1 <Memcpy>
c0005d40:	83 c4 10             	add    $0x10,%esp
c0005d43:	83 ec 08             	sub    $0x8,%esp
c0005d46:	6a 00                	push   $0x0
c0005d48:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0005d4e:	50                   	push   %eax
c0005d4f:	e8 e3 f9 ff ff       	call   c0005737 <open>
c0005d54:	83 c4 10             	add    $0x10,%esp
c0005d57:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005d5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005d61:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d64:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0005d6a:	01 d0                	add    %edx,%eax
c0005d6c:	83 ec 04             	sub    $0x4,%esp
c0005d6f:	68 00 02 00 00       	push   $0x200
c0005d74:	50                   	push   %eax
c0005d75:	ff 75 d0             	pushl  -0x30(%ebp)
c0005d78:	e8 0f fa ff ff       	call   c000578c <read>
c0005d7d:	83 c4 10             	add    $0x10,%esp
c0005d80:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005d83:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0005d86:	01 45 f4             	add    %eax,-0xc(%ebp)
c0005d89:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0005d8d:	74 02                	je     c0005d91 <do_exec+0xe7>
c0005d8f:	eb d0                	jmp    c0005d61 <do_exec+0xb7>
c0005d91:	90                   	nop
c0005d92:	83 ec 0c             	sub    $0xc,%esp
c0005d95:	ff 75 d0             	pushl  -0x30(%ebp)
c0005d98:	e8 5d fa ff ff       	call   c00057fa <close>
c0005d9d:	83 c4 10             	add    $0x10,%esp
c0005da0:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0005da6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005da9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005db0:	eb 72                	jmp    c0005e24 <do_exec+0x17a>
c0005db2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005db5:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0005db9:	0f b7 d0             	movzwl %ax,%edx
c0005dbc:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005dbf:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0005dc3:	0f b7 c0             	movzwl %ax,%eax
c0005dc6:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0005dca:	01 c2                	add    %eax,%edx
c0005dcc:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0005dd2:	01 d0                	add    %edx,%eax
c0005dd4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0005dd7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005dda:	8b 40 10             	mov    0x10(%eax),%eax
c0005ddd:	89 c6                	mov    %eax,%esi
c0005ddf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005de2:	8b 40 04             	mov    0x4(%eax),%eax
c0005de5:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0005deb:	01 d0                	add    %edx,%eax
c0005ded:	83 ec 08             	sub    $0x8,%esp
c0005df0:	50                   	push   %eax
c0005df1:	6a 04                	push   $0x4
c0005df3:	e8 e6 e9 ff ff       	call   c00047de <v2l>
c0005df8:	83 c4 10             	add    $0x10,%esp
c0005dfb:	89 c3                	mov    %eax,%ebx
c0005dfd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005e00:	8b 40 08             	mov    0x8(%eax),%eax
c0005e03:	83 ec 08             	sub    $0x8,%esp
c0005e06:	50                   	push   %eax
c0005e07:	ff 75 d8             	pushl  -0x28(%ebp)
c0005e0a:	e8 cf e9 ff ff       	call   c00047de <v2l>
c0005e0f:	83 c4 10             	add    $0x10,%esp
c0005e12:	83 ec 04             	sub    $0x4,%esp
c0005e15:	56                   	push   %esi
c0005e16:	53                   	push   %ebx
c0005e17:	50                   	push   %eax
c0005e18:	e8 94 46 00 00       	call   c000a4b1 <Memcpy>
c0005e1d:	83 c4 10             	add    $0x10,%esp
c0005e20:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005e24:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005e27:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0005e2b:	0f b7 c0             	movzwl %ax,%eax
c0005e2e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0005e31:	0f 8c 7b ff ff ff    	jl     c0005db2 <do_exec+0x108>
c0005e37:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e3a:	8b 40 10             	mov    0x10(%eax),%eax
c0005e3d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005e40:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e43:	8b 40 1c             	mov    0x1c(%eax),%eax
c0005e46:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005e49:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0005e50:	83 ec 08             	sub    $0x8,%esp
c0005e53:	ff 75 c0             	pushl  -0x40(%ebp)
c0005e56:	ff 75 d8             	pushl  -0x28(%ebp)
c0005e59:	e8 80 e9 ff ff       	call   c00047de <v2l>
c0005e5e:	83 c4 10             	add    $0x10,%esp
c0005e61:	89 c3                	mov    %eax,%ebx
c0005e63:	83 ec 08             	sub    $0x8,%esp
c0005e66:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005e6c:	50                   	push   %eax
c0005e6d:	6a 04                	push   $0x4
c0005e6f:	e8 6a e9 ff ff       	call   c00047de <v2l>
c0005e74:	83 c4 10             	add    $0x10,%esp
c0005e77:	83 ec 04             	sub    $0x4,%esp
c0005e7a:	ff 75 bc             	pushl  -0x44(%ebp)
c0005e7d:	53                   	push   %ebx
c0005e7e:	50                   	push   %eax
c0005e7f:	e8 2d 46 00 00       	call   c000a4b1 <Memcpy>
c0005e84:	83 c4 10             	add    $0x10,%esp
c0005e87:	83 ec 08             	sub    $0x8,%esp
c0005e8a:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005e90:	50                   	push   %eax
c0005e91:	6a 04                	push   $0x4
c0005e93:	e8 46 e9 ff ff       	call   c00047de <v2l>
c0005e98:	83 c4 10             	add    $0x10,%esp
c0005e9b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0005e9e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0005ea1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005ea4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005eab:	eb 08                	jmp    c0005eb5 <do_exec+0x20b>
c0005ead:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005eb1:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005eb5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005eb8:	8b 00                	mov    (%eax),%eax
c0005eba:	85 c0                	test   %eax,%eax
c0005ebc:	75 ef                	jne    c0005ead <do_exec+0x203>
c0005ebe:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0005ec1:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0005ec4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0005ec7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005ece:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005ed4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005ed7:	eb 17                	jmp    c0005ef0 <do_exec+0x246>
c0005ed9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005edd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005ee0:	8b 10                	mov    (%eax),%edx
c0005ee2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0005ee5:	01 c2                	add    %eax,%edx
c0005ee7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005eea:	89 10                	mov    %edx,(%eax)
c0005eec:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0005ef0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005ef3:	8b 00                	mov    (%eax),%eax
c0005ef5:	85 c0                	test   %eax,%eax
c0005ef7:	75 e0                	jne    c0005ed9 <do_exec+0x22f>
c0005ef9:	83 ec 08             	sub    $0x8,%esp
c0005efc:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005f02:	50                   	push   %eax
c0005f03:	6a 04                	push   $0x4
c0005f05:	e8 d4 e8 ff ff       	call   c00047de <v2l>
c0005f0a:	83 c4 10             	add    $0x10,%esp
c0005f0d:	89 c3                	mov    %eax,%ebx
c0005f0f:	83 ec 08             	sub    $0x8,%esp
c0005f12:	ff 75 b8             	pushl  -0x48(%ebp)
c0005f15:	ff 75 d8             	pushl  -0x28(%ebp)
c0005f18:	e8 c1 e8 ff ff       	call   c00047de <v2l>
c0005f1d:	83 c4 10             	add    $0x10,%esp
c0005f20:	83 ec 04             	sub    $0x4,%esp
c0005f23:	ff 75 bc             	pushl  -0x44(%ebp)
c0005f26:	53                   	push   %ebx
c0005f27:	50                   	push   %eax
c0005f28:	e8 84 45 00 00       	call   c000a4b1 <Memcpy>
c0005f2d:	83 c4 10             	add    $0x10,%esp
c0005f30:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f33:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0005f36:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0005f39:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0005f3c:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0005f42:	81 c2 54 23 08 c0    	add    $0xc0082354,%edx
c0005f48:	89 02                	mov    %eax,(%edx)
c0005f4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005f4d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0005f50:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0005f56:	81 c2 50 23 08 c0    	add    $0xc0082350,%edx
c0005f5c:	89 02                	mov    %eax,(%edx)
c0005f5e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005f61:	8b 40 18             	mov    0x18(%eax),%eax
c0005f64:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0005f67:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0005f6d:	81 c2 58 23 08 c0    	add    $0xc0082358,%edx
c0005f73:	89 02                	mov    %eax,(%edx)
c0005f75:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0005f78:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0005f7b:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0005f81:	81 c2 64 23 08 c0    	add    $0xc0082364,%edx
c0005f87:	89 02                	mov    %eax,(%edx)
c0005f89:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0005f8c:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0005f92:	05 0c 23 08 c0       	add    $0xc008230c,%eax
c0005f97:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c0005f9d:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c0005fa4:	00 00 00 
c0005fa7:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0005fae:	00 00 00 
c0005fb1:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c0005fb8:	00 00 00 
c0005fbb:	83 ec 04             	sub    $0x4,%esp
c0005fbe:	ff 75 d8             	pushl  -0x28(%ebp)
c0005fc1:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c0005fc7:	50                   	push   %eax
c0005fc8:	6a 01                	push   $0x1
c0005fca:	e8 fb 32 00 00       	call   c00092ca <send_rec>
c0005fcf:	83 c4 10             	add    $0x10,%esp
c0005fd2:	90                   	nop
c0005fd3:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0005fd6:	5b                   	pop    %ebx
c0005fd7:	5e                   	pop    %esi
c0005fd8:	5d                   	pop    %ebp
c0005fd9:	c3                   	ret    

c0005fda <do_fork>:
c0005fda:	55                   	push   %ebp
c0005fdb:	89 e5                	mov    %esp,%ebp
c0005fdd:	57                   	push   %edi
c0005fde:	56                   	push   %esi
c0005fdf:	53                   	push   %ebx
c0005fe0:	81 ec ac 00 00 00    	sub    $0xac,%esp
c0005fe6:	c7 45 e4 70 28 08 c0 	movl   $0xc0082870,-0x1c(%ebp)
c0005fed:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0005ff4:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%ebp)
c0005ffb:	eb 21                	jmp    c000601e <do_fork+0x44>
c0005ffd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006000:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0006007:	3c ff                	cmp    $0xff,%al
c0006009:	75 08                	jne    c0006013 <do_fork+0x39>
c000600b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000600e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006011:	eb 11                	jmp    c0006024 <do_fork+0x4a>
c0006013:	81 45 e4 ac 01 00 00 	addl   $0x1ac,-0x1c(%ebp)
c000601a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c000601e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0006022:	7e d9                	jle    c0005ffd <do_fork+0x23>
c0006024:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0006028:	7f 19                	jg     c0006043 <do_fork+0x69>
c000602a:	6a 26                	push   $0x26
c000602c:	68 1c 9d 00 c0       	push   $0xc0009d1c
c0006031:	68 1c 9d 00 c0       	push   $0xc0009d1c
c0006036:	68 2c 9d 00 c0       	push   $0xc0009d2c
c000603b:	e8 12 2a 00 00       	call   c0008a52 <assertion_failure>
c0006040:	83 c4 10             	add    $0x10,%esp
c0006043:	8b 45 08             	mov    0x8(%ebp),%eax
c0006046:	8b 00                	mov    (%eax),%eax
c0006048:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000604b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000604e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c0006052:	0f b7 c0             	movzwl %ax,%eax
c0006055:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006058:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000605b:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000605e:	69 d2 ac 01 00 00    	imul   $0x1ac,%edx,%edx
c0006064:	8d 8a c0 21 08 c0    	lea    -0x3ff7de40(%edx),%ecx
c000606a:	89 c2                	mov    %eax,%edx
c000606c:	89 cb                	mov    %ecx,%ebx
c000606e:	b8 6b 00 00 00       	mov    $0x6b,%eax
c0006073:	89 d7                	mov    %edx,%edi
c0006075:	89 de                	mov    %ebx,%esi
c0006077:	89 c1                	mov    %eax,%ecx
c0006079:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000607b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000607e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006081:	89 50 18             	mov    %edx,0x18(%eax)
c0006084:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006087:	89 c2                	mov    %eax,%edx
c0006089:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000608c:	66 89 50 04          	mov    %dx,0x4(%eax)
c0006090:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006093:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006096:	89 90 60 01 00 00    	mov    %edx,0x160(%eax)
c000609c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000609f:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c00060a5:	05 c0 21 08 c0       	add    $0xc00821c0,%eax
c00060aa:	83 c0 06             	add    $0x6,%eax
c00060ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00060b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00060b3:	0f b6 40 07          	movzbl 0x7(%eax),%eax
c00060b7:	0f b6 c0             	movzbl %al,%eax
c00060ba:	c1 e0 18             	shl    $0x18,%eax
c00060bd:	89 c2                	mov    %eax,%edx
c00060bf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00060c2:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c00060c6:	0f b6 c0             	movzbl %al,%eax
c00060c9:	c1 e0 10             	shl    $0x10,%eax
c00060cc:	01 c2                	add    %eax,%edx
c00060ce:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00060d1:	0f b7 40 02          	movzwl 0x2(%eax),%eax
c00060d5:	0f b7 c0             	movzwl %ax,%eax
c00060d8:	01 d0                	add    %edx,%eax
c00060da:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00060dd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00060e0:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c00060e4:	0f b6 c0             	movzbl %al,%eax
c00060e7:	25 00 00 0f 00       	and    $0xf0000,%eax
c00060ec:	89 c2                	mov    %eax,%edx
c00060ee:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00060f1:	0f b7 00             	movzwl (%eax),%eax
c00060f4:	0f b7 c0             	movzwl %ax,%eax
c00060f7:	01 d0                	add    %edx,%eax
c00060f9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00060fc:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00060ff:	83 c0 01             	add    $0x1,%eax
c0006102:	c1 e0 0c             	shl    $0xc,%eax
c0006105:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006108:	83 ec 08             	sub    $0x8,%esp
c000610b:	ff 75 c4             	pushl  -0x3c(%ebp)
c000610e:	ff 75 e0             	pushl  -0x20(%ebp)
c0006111:	e8 61 fb ff ff       	call   c0005c77 <alloc_mem>
c0006116:	83 c4 10             	add    $0x10,%esp
c0006119:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000611c:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000611f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006122:	83 ec 04             	sub    $0x4,%esp
c0006125:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006128:	52                   	push   %edx
c0006129:	50                   	push   %eax
c000612a:	e8 82 43 00 00       	call   c000a4b1 <Memcpy>
c000612f:	83 c4 10             	add    $0x10,%esp
c0006132:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0006139:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
c0006140:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006143:	0f b7 c8             	movzwl %ax,%ecx
c0006146:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0006149:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000614c:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c000614f:	69 db ac 01 00 00    	imul   $0x1ac,%ebx,%ebx
c0006155:	81 c3 c0 21 08 c0    	add    $0xc00821c0,%ebx
c000615b:	83 c3 06             	add    $0x6,%ebx
c000615e:	51                   	push   %ecx
c000615f:	52                   	push   %edx
c0006160:	50                   	push   %eax
c0006161:	53                   	push   %ebx
c0006162:	e8 72 e5 ff ff       	call   c00046d9 <InitDescriptor>
c0006167:	83 c4 10             	add    $0x10,%esp
c000616a:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
c0006171:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006174:	0f b7 c8             	movzwl %ax,%ecx
c0006177:	8b 55 c8             	mov    -0x38(%ebp),%edx
c000617a:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000617d:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c0006180:	69 db ac 01 00 00    	imul   $0x1ac,%ebx,%ebx
c0006186:	83 c3 08             	add    $0x8,%ebx
c0006189:	81 c3 c0 21 08 c0    	add    $0xc00821c0,%ebx
c000618f:	83 c3 06             	add    $0x6,%ebx
c0006192:	51                   	push   %ecx
c0006193:	52                   	push   %edx
c0006194:	50                   	push   %eax
c0006195:	53                   	push   %ebx
c0006196:	e8 3e e5 ff ff       	call   c00046d9 <InitDescriptor>
c000619b:	83 c4 10             	add    $0x10,%esp
c000619e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00061a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00061a4:	89 50 4c             	mov    %edx,0x4c(%eax)
c00061a7:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
c00061ae:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c00061b5:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c00061bc:	83 ec 04             	sub    $0x4,%esp
c00061bf:	ff 75 e0             	pushl  -0x20(%ebp)
c00061c2:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
c00061c8:	50                   	push   %eax
c00061c9:	6a 01                	push   $0x1
c00061cb:	e8 fa 30 00 00       	call   c00092ca <send_rec>
c00061d0:	83 c4 10             	add    $0x10,%esp
c00061d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00061d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00061d9:	5b                   	pop    %ebx
c00061da:	5e                   	pop    %esi
c00061db:	5f                   	pop    %edi
c00061dc:	5d                   	pop    %ebp
c00061dd:	c3                   	ret    

c00061de <do_exit>:
c00061de:	55                   	push   %ebp
c00061df:	89 e5                	mov    %esp,%ebp
c00061e1:	83 ec 18             	sub    $0x18,%esp
c00061e4:	8b 45 08             	mov    0x8(%ebp),%eax
c00061e7:	8b 00                	mov    (%eax),%eax
c00061e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061ef:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c00061f5:	05 c0 21 08 c0       	add    $0xc00821c0,%eax
c00061fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00061fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006200:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c0006206:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006209:	8b 45 08             	mov    0x8(%ebp),%eax
c000620c:	8b 40 44             	mov    0x44(%eax),%eax
c000620f:	89 c2                	mov    %eax,%edx
c0006211:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006214:	89 90 64 01 00 00    	mov    %edx,0x164(%eax)
c000621a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000621d:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0006223:	05 05 23 08 c0       	add    $0xc0082305,%eax
c0006228:	0f b6 00             	movzbl (%eax),%eax
c000622b:	3c 04                	cmp    $0x4,%al
c000622d:	75 21                	jne    c0006250 <do_exit+0x72>
c000622f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006232:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0006238:	05 05 23 08 c0       	add    $0xc0082305,%eax
c000623d:	c6 00 fb             	movb   $0xfb,(%eax)
c0006240:	83 ec 0c             	sub    $0xc,%esp
c0006243:	ff 75 ec             	pushl  -0x14(%ebp)
c0006246:	e8 59 01 00 00       	call   c00063a4 <cleanup>
c000624b:	83 c4 10             	add    $0x10,%esp
c000624e:	eb 0a                	jmp    c000625a <do_exit+0x7c>
c0006250:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006253:	c6 80 44 01 00 00 03 	movb   $0x3,0x144(%eax)
c000625a:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0006261:	eb 6e                	jmp    c00062d1 <do_exit+0xf3>
c0006263:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006266:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c000626c:	05 20 23 08 c0       	add    $0xc0082320,%eax
c0006271:	8b 00                	mov    (%eax),%eax
c0006273:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006276:	75 55                	jne    c00062cd <do_exit+0xef>
c0006278:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000627b:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0006281:	05 20 23 08 c0       	add    $0xc0082320,%eax
c0006286:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c000628c:	0f b6 05 0d 2d 08 c0 	movzbl 0xc0082d0d,%eax
c0006293:	3c 04                	cmp    $0x4,%al
c0006295:	75 36                	jne    c00062cd <do_exit+0xef>
c0006297:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000629a:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c00062a0:	05 05 23 08 c0       	add    $0xc0082305,%eax
c00062a5:	0f b6 00             	movzbl (%eax),%eax
c00062a8:	3c 03                	cmp    $0x3,%al
c00062aa:	75 21                	jne    c00062cd <do_exit+0xef>
c00062ac:	c6 05 0d 2d 08 c0 fb 	movb   $0xfb,0xc0082d0d
c00062b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00062b6:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c00062bc:	05 c0 21 08 c0       	add    $0xc00821c0,%eax
c00062c1:	83 ec 0c             	sub    $0xc,%esp
c00062c4:	50                   	push   %eax
c00062c5:	e8 da 00 00 00       	call   c00063a4 <cleanup>
c00062ca:	83 c4 10             	add    $0x10,%esp
c00062cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00062d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00062d5:	7e 8c                	jle    c0006263 <do_exit+0x85>
c00062d7:	90                   	nop
c00062d8:	c9                   	leave  
c00062d9:	c3                   	ret    

c00062da <do_wait>:
c00062da:	55                   	push   %ebp
c00062db:	89 e5                	mov    %esp,%ebp
c00062dd:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00062e3:	8b 45 08             	mov    0x8(%ebp),%eax
c00062e6:	8b 00                	mov    (%eax),%eax
c00062e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00062eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062f2:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c00062f9:	eb 5f                	jmp    c000635a <do_wait+0x80>
c00062fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062fe:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0006304:	05 20 23 08 c0       	add    $0xc0082320,%eax
c0006309:	8b 00                	mov    (%eax),%eax
c000630b:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000630e:	75 46                	jne    c0006356 <do_wait+0x7c>
c0006310:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006314:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006317:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c000631d:	05 05 23 08 c0       	add    $0xc0082305,%eax
c0006322:	0f b6 00             	movzbl (%eax),%eax
c0006325:	3c 03                	cmp    $0x3,%al
c0006327:	75 2d                	jne    c0006356 <do_wait+0x7c>
c0006329:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000632c:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0006332:	05 05 23 08 c0       	add    $0xc0082305,%eax
c0006337:	c6 00 fb             	movb   $0xfb,(%eax)
c000633a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000633d:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0006343:	05 c0 21 08 c0       	add    $0xc00821c0,%eax
c0006348:	83 ec 0c             	sub    $0xc,%esp
c000634b:	50                   	push   %eax
c000634c:	e8 53 00 00 00       	call   c00063a4 <cleanup>
c0006351:	83 c4 10             	add    $0x10,%esp
c0006354:	eb 4c                	jmp    c00063a2 <do_wait+0xc8>
c0006356:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000635a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000635e:	7e 9b                	jle    c00062fb <do_wait+0x21>
c0006360:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006364:	74 13                	je     c0006379 <do_wait+0x9f>
c0006366:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006369:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c000636f:	05 05 23 08 c0       	add    $0xc0082305,%eax
c0006374:	c6 00 04             	movb   $0x4,(%eax)
c0006377:	eb 29                	jmp    c00063a2 <do_wait+0xc8>
c0006379:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006380:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006387:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c000638e:	83 ec 04             	sub    $0x4,%esp
c0006391:	ff 75 ec             	pushl  -0x14(%ebp)
c0006394:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006397:	50                   	push   %eax
c0006398:	6a 01                	push   $0x1
c000639a:	e8 2b 2f 00 00       	call   c00092ca <send_rec>
c000639f:	83 c4 10             	add    $0x10,%esp
c00063a2:	c9                   	leave  
c00063a3:	c3                   	ret    

c00063a4 <cleanup>:
c00063a4:	55                   	push   %ebp
c00063a5:	89 e5                	mov    %esp,%ebp
c00063a7:	83 ec 78             	sub    $0x78,%esp
c00063aa:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00063b1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00063b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00063bb:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c00063c1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00063c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00063c7:	8b 80 64 01 00 00    	mov    0x164(%eax),%eax
c00063cd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00063d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00063d3:	8b 80 60 01 00 00    	mov    0x160(%eax),%eax
c00063d9:	83 ec 04             	sub    $0x4,%esp
c00063dc:	50                   	push   %eax
c00063dd:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00063e0:	50                   	push   %eax
c00063e1:	6a 01                	push   $0x1
c00063e3:	e8 e2 2e 00 00       	call   c00092ca <send_rec>
c00063e8:	83 c4 10             	add    $0x10,%esp
c00063eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00063ee:	c6 80 44 01 00 00 ff 	movb   $0xff,0x144(%eax)
c00063f5:	90                   	nop
c00063f6:	c9                   	leave  
c00063f7:	c3                   	ret    

c00063f8 <test_bit_val>:
c00063f8:	55                   	push   %ebp
c00063f9:	89 e5                	mov    %esp,%ebp
c00063fb:	53                   	push   %ebx
c00063fc:	83 ec 10             	sub    $0x10,%esp
c00063ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006402:	8d 50 07             	lea    0x7(%eax),%edx
c0006405:	85 c0                	test   %eax,%eax
c0006407:	0f 48 c2             	cmovs  %edx,%eax
c000640a:	c1 f8 03             	sar    $0x3,%eax
c000640d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006410:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006413:	99                   	cltd   
c0006414:	c1 ea 1d             	shr    $0x1d,%edx
c0006417:	01 d0                	add    %edx,%eax
c0006419:	83 e0 07             	and    $0x7,%eax
c000641c:	29 d0                	sub    %edx,%eax
c000641e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006421:	8b 45 08             	mov    0x8(%ebp),%eax
c0006424:	8b 10                	mov    (%eax),%edx
c0006426:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006429:	01 d0                	add    %edx,%eax
c000642b:	0f b6 00             	movzbl (%eax),%eax
c000642e:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006431:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006435:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006438:	bb 01 00 00 00       	mov    $0x1,%ebx
c000643d:	89 c1                	mov    %eax,%ecx
c000643f:	d3 e3                	shl    %cl,%ebx
c0006441:	89 d8                	mov    %ebx,%eax
c0006443:	21 c2                	and    %eax,%edx
c0006445:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006448:	89 c1                	mov    %eax,%ecx
c000644a:	d3 fa                	sar    %cl,%edx
c000644c:	89 d0                	mov    %edx,%eax
c000644e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006451:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006455:	0f 9f c0             	setg   %al
c0006458:	0f b6 c0             	movzbl %al,%eax
c000645b:	83 c4 10             	add    $0x10,%esp
c000645e:	5b                   	pop    %ebx
c000645f:	5d                   	pop    %ebp
c0006460:	c3                   	ret    

c0006461 <set_bit_val>:
c0006461:	55                   	push   %ebp
c0006462:	89 e5                	mov    %esp,%ebp
c0006464:	83 ec 10             	sub    $0x10,%esp
c0006467:	8b 45 0c             	mov    0xc(%ebp),%eax
c000646a:	8d 50 07             	lea    0x7(%eax),%edx
c000646d:	85 c0                	test   %eax,%eax
c000646f:	0f 48 c2             	cmovs  %edx,%eax
c0006472:	c1 f8 03             	sar    $0x3,%eax
c0006475:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006478:	8b 45 0c             	mov    0xc(%ebp),%eax
c000647b:	99                   	cltd   
c000647c:	c1 ea 1d             	shr    $0x1d,%edx
c000647f:	01 d0                	add    %edx,%eax
c0006481:	83 e0 07             	and    $0x7,%eax
c0006484:	29 d0                	sub    %edx,%eax
c0006486:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006489:	8b 45 08             	mov    0x8(%ebp),%eax
c000648c:	8b 10                	mov    (%eax),%edx
c000648e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006491:	01 d0                	add    %edx,%eax
c0006493:	0f b6 00             	movzbl (%eax),%eax
c0006496:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006499:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000649d:	7e 13                	jle    c00064b2 <set_bit_val+0x51>
c000649f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00064a2:	ba 01 00 00 00       	mov    $0x1,%edx
c00064a7:	89 c1                	mov    %eax,%ecx
c00064a9:	d3 e2                	shl    %cl,%edx
c00064ab:	89 d0                	mov    %edx,%eax
c00064ad:	08 45 ff             	or     %al,-0x1(%ebp)
c00064b0:	eb 13                	jmp    c00064c5 <set_bit_val+0x64>
c00064b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00064b5:	ba 01 00 00 00       	mov    $0x1,%edx
c00064ba:	89 c1                	mov    %eax,%ecx
c00064bc:	d3 e2                	shl    %cl,%edx
c00064be:	89 d0                	mov    %edx,%eax
c00064c0:	f7 d0                	not    %eax
c00064c2:	20 45 ff             	and    %al,-0x1(%ebp)
c00064c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00064c8:	8b 10                	mov    (%eax),%edx
c00064ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00064cd:	01 c2                	add    %eax,%edx
c00064cf:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c00064d3:	88 02                	mov    %al,(%edx)
c00064d5:	b8 01 00 00 00       	mov    $0x1,%eax
c00064da:	c9                   	leave  
c00064db:	c3                   	ret    

c00064dc <set_bits>:
c00064dc:	55                   	push   %ebp
c00064dd:	89 e5                	mov    %esp,%ebp
c00064df:	83 ec 10             	sub    $0x10,%esp
c00064e2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00064e9:	eb 1c                	jmp    c0006507 <set_bits+0x2b>
c00064eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00064ee:	8d 50 01             	lea    0x1(%eax),%edx
c00064f1:	89 55 0c             	mov    %edx,0xc(%ebp)
c00064f4:	ff 75 10             	pushl  0x10(%ebp)
c00064f7:	50                   	push   %eax
c00064f8:	ff 75 08             	pushl  0x8(%ebp)
c00064fb:	e8 61 ff ff ff       	call   c0006461 <set_bit_val>
c0006500:	83 c4 0c             	add    $0xc,%esp
c0006503:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006507:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000650a:	3b 45 14             	cmp    0x14(%ebp),%eax
c000650d:	7c dc                	jl     c00064eb <set_bits+0xf>
c000650f:	b8 01 00 00 00       	mov    $0x1,%eax
c0006514:	c9                   	leave  
c0006515:	c3                   	ret    

c0006516 <get_first_free_bit>:
c0006516:	55                   	push   %ebp
c0006517:	89 e5                	mov    %esp,%ebp
c0006519:	83 ec 10             	sub    $0x10,%esp
c000651c:	8b 45 08             	mov    0x8(%ebp),%eax
c000651f:	8b 40 04             	mov    0x4(%eax),%eax
c0006522:	c1 e0 03             	shl    $0x3,%eax
c0006525:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006528:	8b 45 0c             	mov    0xc(%ebp),%eax
c000652b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000652e:	eb 1b                	jmp    c000654b <get_first_free_bit+0x35>
c0006530:	ff 75 fc             	pushl  -0x4(%ebp)
c0006533:	ff 75 08             	pushl  0x8(%ebp)
c0006536:	e8 bd fe ff ff       	call   c00063f8 <test_bit_val>
c000653b:	83 c4 08             	add    $0x8,%esp
c000653e:	85 c0                	test   %eax,%eax
c0006540:	75 05                	jne    c0006547 <get_first_free_bit+0x31>
c0006542:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006545:	eb 11                	jmp    c0006558 <get_first_free_bit+0x42>
c0006547:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000654b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000654e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006551:	7c dd                	jl     c0006530 <get_first_free_bit+0x1a>
c0006553:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006558:	c9                   	leave  
c0006559:	c3                   	ret    

c000655a <get_bits>:
c000655a:	55                   	push   %ebp
c000655b:	89 e5                	mov    %esp,%ebp
c000655d:	83 ec 20             	sub    $0x20,%esp
c0006560:	c7 45 f0 02 01 00 00 	movl   $0x102,-0x10(%ebp)
c0006567:	ff 75 f0             	pushl  -0x10(%ebp)
c000656a:	ff 75 08             	pushl  0x8(%ebp)
c000656d:	e8 a4 ff ff ff       	call   c0006516 <get_first_free_bit>
c0006572:	83 c4 08             	add    $0x8,%esp
c0006575:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006578:	8b 45 08             	mov    0x8(%ebp),%eax
c000657b:	8b 40 04             	mov    0x4(%eax),%eax
c000657e:	c1 e0 03             	shl    $0x3,%eax
c0006581:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006584:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006587:	83 e8 01             	sub    $0x1,%eax
c000658a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000658d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006590:	83 c0 01             	add    $0x1,%eax
c0006593:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006596:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006599:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000659c:	eb 58                	jmp    c00065f6 <get_bits+0x9c>
c000659e:	ff 75 f8             	pushl  -0x8(%ebp)
c00065a1:	ff 75 08             	pushl  0x8(%ebp)
c00065a4:	e8 4f fe ff ff       	call   c00063f8 <test_bit_val>
c00065a9:	83 c4 08             	add    $0x8,%esp
c00065ac:	85 c0                	test   %eax,%eax
c00065ae:	75 0a                	jne    c00065ba <get_bits+0x60>
c00065b0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00065b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00065b8:	eb 2b                	jmp    c00065e5 <get_bits+0x8b>
c00065ba:	6a 00                	push   $0x0
c00065bc:	ff 75 08             	pushl  0x8(%ebp)
c00065bf:	e8 52 ff ff ff       	call   c0006516 <get_first_free_bit>
c00065c4:	83 c4 08             	add    $0x8,%esp
c00065c7:	83 c0 01             	add    $0x1,%eax
c00065ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00065cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00065d0:	83 c0 01             	add    $0x1,%eax
c00065d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00065d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00065d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00065dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00065df:	83 e8 01             	sub    $0x1,%eax
c00065e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00065e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065e8:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c00065eb:	7c 09                	jl     c00065f6 <get_bits+0x9c>
c00065ed:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00065f4:	eb 0d                	jmp    c0006603 <get_bits+0xa9>
c00065f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00065f9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00065fc:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00065ff:	85 c0                	test   %eax,%eax
c0006601:	7f 9b                	jg     c000659e <get_bits+0x44>
c0006603:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006606:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006609:	83 c0 01             	add    $0x1,%eax
c000660c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000660f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006612:	c9                   	leave  
c0006613:	c3                   	ret    

c0006614 <get_a_page2>:
c0006614:	55                   	push   %ebp
c0006615:	89 e5                	mov    %esp,%ebp
c0006617:	83 ec 18             	sub    $0x18,%esp
c000661a:	83 ec 0c             	sub    $0xc,%esp
c000661d:	ff 75 0c             	pushl  0xc(%ebp)
c0006620:	e8 1e 00 00 00       	call   c0006643 <get_a_page>
c0006625:	83 c4 10             	add    $0x10,%esp
c0006628:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000662b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000662e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006631:	83 ec 08             	sub    $0x8,%esp
c0006634:	52                   	push   %edx
c0006635:	50                   	push   %eax
c0006636:	e8 3f 01 00 00       	call   c000677a <add_map_entry>
c000663b:	83 c4 10             	add    $0x10,%esp
c000663e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006641:	c9                   	leave  
c0006642:	c3                   	ret    

c0006643 <get_a_page>:
c0006643:	55                   	push   %ebp
c0006644:	89 e5                	mov    %esp,%ebp
c0006646:	83 ec 20             	sub    $0x20,%esp
c0006649:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000664d:	75 22                	jne    c0006671 <get_a_page+0x2e>
c000664f:	a1 ac 06 01 c0       	mov    0xc00106ac,%eax
c0006654:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006657:	a1 b0 06 01 c0       	mov    0xc00106b0,%eax
c000665c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000665f:	a1 b4 06 01 c0       	mov    0xc00106b4,%eax
c0006664:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006667:	a1 b8 06 01 c0       	mov    0xc00106b8,%eax
c000666c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000666f:	eb 20                	jmp    c0006691 <get_a_page+0x4e>
c0006671:	a1 e4 0e 01 c0       	mov    0xc0010ee4,%eax
c0006676:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006679:	a1 e8 0e 01 c0       	mov    0xc0010ee8,%eax
c000667e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006681:	a1 ec 0e 01 c0       	mov    0xc0010eec,%eax
c0006686:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006689:	a1 f0 0e 01 c0       	mov    0xc0010ef0,%eax
c000668e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006691:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006694:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006697:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000669a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c000669d:	6a 01                	push   $0x1
c000669f:	8d 45 e0             	lea    -0x20(%ebp),%eax
c00066a2:	50                   	push   %eax
c00066a3:	e8 b2 fe ff ff       	call   c000655a <get_bits>
c00066a8:	83 c4 08             	add    $0x8,%esp
c00066ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00066ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00066b4:	c1 e2 0c             	shl    $0xc,%edx
c00066b7:	01 d0                	add    %edx,%eax
c00066b9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00066bc:	6a 01                	push   $0x1
c00066be:	ff 75 fc             	pushl  -0x4(%ebp)
c00066c1:	8d 45 e0             	lea    -0x20(%ebp),%eax
c00066c4:	50                   	push   %eax
c00066c5:	e8 97 fd ff ff       	call   c0006461 <set_bit_val>
c00066ca:	83 c4 0c             	add    $0xc,%esp
c00066cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00066d0:	c9                   	leave  
c00066d1:	c3                   	ret    

c00066d2 <get_virtual_address>:
c00066d2:	55                   	push   %ebp
c00066d3:	89 e5                	mov    %esp,%ebp
c00066d5:	83 ec 20             	sub    $0x20,%esp
c00066d8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00066dc:	75 18                	jne    c00066f6 <get_virtual_address+0x24>
c00066de:	a1 50 e7 00 c0       	mov    0xc000e750,%eax
c00066e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066e6:	a1 54 e7 00 c0       	mov    0xc000e754,%eax
c00066eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00066ee:	a1 58 e7 00 c0       	mov    0xc000e758,%eax
c00066f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00066f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00066f9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00066fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00066ff:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0006702:	8b 45 08             	mov    0x8(%ebp),%eax
c0006705:	50                   	push   %eax
c0006706:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0006709:	50                   	push   %eax
c000670a:	e8 4b fe ff ff       	call   c000655a <get_bits>
c000670f:	83 c4 08             	add    $0x8,%esp
c0006712:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006715:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006718:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000671b:	83 ea 01             	sub    $0x1,%edx
c000671e:	c1 e2 0c             	shl    $0xc,%edx
c0006721:	01 d0                	add    %edx,%eax
c0006723:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006726:	8b 45 08             	mov    0x8(%ebp),%eax
c0006729:	50                   	push   %eax
c000672a:	6a 01                	push   $0x1
c000672c:	ff 75 fc             	pushl  -0x4(%ebp)
c000672f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0006732:	50                   	push   %eax
c0006733:	e8 a4 fd ff ff       	call   c00064dc <set_bits>
c0006738:	83 c4 10             	add    $0x10,%esp
c000673b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000673e:	c9                   	leave  
c000673f:	c3                   	ret    

c0006740 <ptr_pde>:
c0006740:	55                   	push   %ebp
c0006741:	89 e5                	mov    %esp,%ebp
c0006743:	8b 45 08             	mov    0x8(%ebp),%eax
c0006746:	c1 e8 16             	shr    $0x16,%eax
c0006749:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c000674e:	c1 e0 02             	shl    $0x2,%eax
c0006751:	5d                   	pop    %ebp
c0006752:	c3                   	ret    

c0006753 <ptr_pte>:
c0006753:	55                   	push   %ebp
c0006754:	89 e5                	mov    %esp,%ebp
c0006756:	8b 45 08             	mov    0x8(%ebp),%eax
c0006759:	c1 e8 0a             	shr    $0xa,%eax
c000675c:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006761:	89 c2                	mov    %eax,%edx
c0006763:	8b 45 08             	mov    0x8(%ebp),%eax
c0006766:	c1 e8 0c             	shr    $0xc,%eax
c0006769:	25 ff 03 00 00       	and    $0x3ff,%eax
c000676e:	c1 e0 02             	shl    $0x2,%eax
c0006771:	01 d0                	add    %edx,%eax
c0006773:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006778:	5d                   	pop    %ebp
c0006779:	c3                   	ret    

c000677a <add_map_entry>:
c000677a:	55                   	push   %ebp
c000677b:	89 e5                	mov    %esp,%ebp
c000677d:	83 ec 18             	sub    $0x18,%esp
c0006780:	ff 75 08             	pushl  0x8(%ebp)
c0006783:	e8 b8 ff ff ff       	call   c0006740 <ptr_pde>
c0006788:	83 c4 04             	add    $0x4,%esp
c000678b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000678e:	ff 75 08             	pushl  0x8(%ebp)
c0006791:	e8 bd ff ff ff       	call   c0006753 <ptr_pte>
c0006796:	83 c4 04             	add    $0x4,%esp
c0006799:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000679c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000679f:	8b 00                	mov    (%eax),%eax
c00067a1:	83 e0 01             	and    $0x1,%eax
c00067a4:	85 c0                	test   %eax,%eax
c00067a6:	74 1b                	je     c00067c3 <add_map_entry+0x49>
c00067a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00067ab:	8b 00                	mov    (%eax),%eax
c00067ad:	83 e0 01             	and    $0x1,%eax
c00067b0:	85 c0                	test   %eax,%eax
c00067b2:	75 51                	jne    c0006805 <add_map_entry+0x8b>
c00067b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00067b7:	83 c8 07             	or     $0x7,%eax
c00067ba:	89 c2                	mov    %eax,%edx
c00067bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00067bf:	89 10                	mov    %edx,(%eax)
c00067c1:	eb 42                	jmp    c0006805 <add_map_entry+0x8b>
c00067c3:	6a 00                	push   $0x0
c00067c5:	e8 79 fe ff ff       	call   c0006643 <get_a_page>
c00067ca:	83 c4 04             	add    $0x4,%esp
c00067cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00067d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00067d3:	83 c8 07             	or     $0x7,%eax
c00067d6:	89 c2                	mov    %eax,%edx
c00067d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067db:	89 10                	mov    %edx,(%eax)
c00067dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00067e0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00067e5:	83 ec 04             	sub    $0x4,%esp
c00067e8:	68 00 10 00 00       	push   $0x1000
c00067ed:	6a 00                	push   $0x0
c00067ef:	50                   	push   %eax
c00067f0:	e8 ea 3c 00 00       	call   c000a4df <Memset>
c00067f5:	83 c4 10             	add    $0x10,%esp
c00067f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00067fb:	83 c8 07             	or     $0x7,%eax
c00067fe:	89 c2                	mov    %eax,%edx
c0006800:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006803:	89 10                	mov    %edx,(%eax)
c0006805:	90                   	nop
c0006806:	c9                   	leave  
c0006807:	c3                   	ret    

c0006808 <get_physical_address>:
c0006808:	55                   	push   %ebp
c0006809:	89 e5                	mov    %esp,%ebp
c000680b:	83 ec 10             	sub    $0x10,%esp
c000680e:	ff 75 08             	pushl  0x8(%ebp)
c0006811:	e8 3d ff ff ff       	call   c0006753 <ptr_pte>
c0006816:	83 c4 04             	add    $0x4,%esp
c0006819:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000681c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000681f:	8b 00                	mov    (%eax),%eax
c0006821:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006826:	89 c2                	mov    %eax,%edx
c0006828:	8b 45 08             	mov    0x8(%ebp),%eax
c000682b:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006830:	09 d0                	or     %edx,%eax
c0006832:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006835:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006838:	c9                   	leave  
c0006839:	c3                   	ret    

c000683a <alloc_memory>:
c000683a:	55                   	push   %ebp
c000683b:	89 e5                	mov    %esp,%ebp
c000683d:	83 ec 18             	sub    $0x18,%esp
c0006840:	ff 75 0c             	pushl  0xc(%ebp)
c0006843:	ff 75 08             	pushl  0x8(%ebp)
c0006846:	e8 87 fe ff ff       	call   c00066d2 <get_virtual_address>
c000684b:	83 c4 08             	add    $0x8,%esp
c000684e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006851:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006854:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006859:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000685c:	eb 26                	jmp    c0006884 <alloc_memory+0x4a>
c000685e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006865:	ff 75 0c             	pushl  0xc(%ebp)
c0006868:	e8 d6 fd ff ff       	call   c0006643 <get_a_page>
c000686d:	83 c4 04             	add    $0x4,%esp
c0006870:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006873:	83 ec 08             	sub    $0x8,%esp
c0006876:	ff 75 ec             	pushl  -0x14(%ebp)
c0006879:	ff 75 f4             	pushl  -0xc(%ebp)
c000687c:	e8 f9 fe ff ff       	call   c000677a <add_map_entry>
c0006881:	83 c4 10             	add    $0x10,%esp
c0006884:	8b 45 08             	mov    0x8(%ebp),%eax
c0006887:	8d 50 ff             	lea    -0x1(%eax),%edx
c000688a:	89 55 08             	mov    %edx,0x8(%ebp)
c000688d:	85 c0                	test   %eax,%eax
c000688f:	75 cd                	jne    c000685e <alloc_memory+0x24>
c0006891:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006894:	c9                   	leave  
c0006895:	c3                   	ret    

c0006896 <init_memory2>:
c0006896:	55                   	push   %ebp
c0006897:	89 e5                	mov    %esp,%ebp
c0006899:	83 ec 38             	sub    $0x38,%esp
c000689c:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00068a3:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00068aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068ad:	a3 b4 06 01 c0       	mov    %eax,0xc00106b4
c00068b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00068b5:	a1 b4 06 01 c0       	mov    0xc00106b4,%eax
c00068ba:	29 c2                	sub    %eax,%edx
c00068bc:	89 d0                	mov    %edx,%eax
c00068be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00068c4:	89 c2                	mov    %eax,%edx
c00068c6:	c1 ea 1f             	shr    $0x1f,%edx
c00068c9:	01 d0                	add    %edx,%eax
c00068cb:	d1 f8                	sar    %eax
c00068cd:	a3 b8 06 01 c0       	mov    %eax,0xc00106b8
c00068d2:	a1 b8 06 01 c0       	mov    0xc00106b8,%eax
c00068d7:	83 ec 0c             	sub    $0xc,%esp
c00068da:	50                   	push   %eax
c00068db:	e8 fa 05 00 00       	call   c0006eda <disp_int>
c00068e0:	83 c4 10             	add    $0x10,%esp
c00068e3:	a1 b8 06 01 c0       	mov    0xc00106b8,%eax
c00068e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00068eb:	29 c2                	sub    %eax,%edx
c00068ed:	89 d0                	mov    %edx,%eax
c00068ef:	a3 f0 0e 01 c0       	mov    %eax,0xc0010ef0
c00068f4:	83 ec 0c             	sub    $0xc,%esp
c00068f7:	68 53 9d 00 c0       	push   $0xc0009d53
c00068fc:	e8 7b ac ff ff       	call   c000157c <disp_str>
c0006901:	83 c4 10             	add    $0x10,%esp
c0006904:	a1 f0 0e 01 c0       	mov    0xc0010ef0,%eax
c0006909:	83 ec 0c             	sub    $0xc,%esp
c000690c:	50                   	push   %eax
c000690d:	e8 c8 05 00 00       	call   c0006eda <disp_int>
c0006912:	83 c4 10             	add    $0x10,%esp
c0006915:	83 ec 0c             	sub    $0xc,%esp
c0006918:	68 53 9d 00 c0       	push   $0xc0009d53
c000691d:	e8 5a ac ff ff       	call   c000157c <disp_str>
c0006922:	83 c4 10             	add    $0x10,%esp
c0006925:	a1 b8 06 01 c0       	mov    0xc00106b8,%eax
c000692a:	05 ff 0f 00 00       	add    $0xfff,%eax
c000692f:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006935:	85 c0                	test   %eax,%eax
c0006937:	0f 48 c2             	cmovs  %edx,%eax
c000693a:	c1 f8 0c             	sar    $0xc,%eax
c000693d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006940:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006943:	83 c0 07             	add    $0x7,%eax
c0006946:	8d 50 07             	lea    0x7(%eax),%edx
c0006949:	85 c0                	test   %eax,%eax
c000694b:	0f 48 c2             	cmovs  %edx,%eax
c000694e:	c1 f8 03             	sar    $0x3,%eax
c0006951:	a3 b0 06 01 c0       	mov    %eax,0xc00106b0
c0006956:	a1 b4 06 01 c0       	mov    0xc00106b4,%eax
c000695b:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0006960:	a3 ac 06 01 c0       	mov    %eax,0xc00106ac
c0006965:	8b 15 b0 06 01 c0    	mov    0xc00106b0,%edx
c000696b:	a1 ac 06 01 c0       	mov    0xc00106ac,%eax
c0006970:	83 ec 04             	sub    $0x4,%esp
c0006973:	52                   	push   %edx
c0006974:	6a 00                	push   $0x0
c0006976:	50                   	push   %eax
c0006977:	e8 63 3b 00 00       	call   c000a4df <Memset>
c000697c:	83 c4 10             	add    $0x10,%esp
c000697f:	a1 b0 06 01 c0       	mov    0xc00106b0,%eax
c0006984:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006989:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000698f:	85 c0                	test   %eax,%eax
c0006991:	0f 48 c2             	cmovs  %edx,%eax
c0006994:	c1 f8 0c             	sar    $0xc,%eax
c0006997:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000699a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000699d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00069a0:	ff 75 e8             	pushl  -0x18(%ebp)
c00069a3:	6a 01                	push   $0x1
c00069a5:	6a 00                	push   $0x0
c00069a7:	68 ac 06 01 c0       	push   $0xc00106ac
c00069ac:	e8 2b fb ff ff       	call   c00064dc <set_bits>
c00069b1:	83 c4 10             	add    $0x10,%esp
c00069b4:	a1 f0 0e 01 c0       	mov    0xc0010ef0,%eax
c00069b9:	05 ff 0f 00 00       	add    $0xfff,%eax
c00069be:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00069c4:	85 c0                	test   %eax,%eax
c00069c6:	0f 48 c2             	cmovs  %edx,%eax
c00069c9:	c1 f8 0c             	sar    $0xc,%eax
c00069cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069d2:	83 c0 07             	add    $0x7,%eax
c00069d5:	8d 50 07             	lea    0x7(%eax),%edx
c00069d8:	85 c0                	test   %eax,%eax
c00069da:	0f 48 c2             	cmovs  %edx,%eax
c00069dd:	c1 f8 03             	sar    $0x3,%eax
c00069e0:	a3 e8 0e 01 c0       	mov    %eax,0xc0010ee8
c00069e5:	a1 b4 06 01 c0       	mov    0xc00106b4,%eax
c00069ea:	8b 15 b0 06 01 c0    	mov    0xc00106b0,%edx
c00069f0:	01 d0                	add    %edx,%eax
c00069f2:	a3 e4 0e 01 c0       	mov    %eax,0xc0010ee4
c00069f7:	8b 15 e8 0e 01 c0    	mov    0xc0010ee8,%edx
c00069fd:	a1 e4 0e 01 c0       	mov    0xc0010ee4,%eax
c0006a02:	83 ec 04             	sub    $0x4,%esp
c0006a05:	52                   	push   %edx
c0006a06:	6a 00                	push   $0x0
c0006a08:	50                   	push   %eax
c0006a09:	e8 d1 3a 00 00       	call   c000a4df <Memset>
c0006a0e:	83 c4 10             	add    $0x10,%esp
c0006a11:	a1 e8 0e 01 c0       	mov    0xc0010ee8,%eax
c0006a16:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006a1b:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006a21:	85 c0                	test   %eax,%eax
c0006a23:	0f 48 c2             	cmovs  %edx,%eax
c0006a26:	c1 f8 0c             	sar    $0xc,%eax
c0006a29:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006a2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006a2f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006a32:	ff 75 e8             	pushl  -0x18(%ebp)
c0006a35:	6a 01                	push   $0x1
c0006a37:	ff 75 e0             	pushl  -0x20(%ebp)
c0006a3a:	68 ac 06 01 c0       	push   $0xc00106ac
c0006a3f:	e8 98 fa ff ff       	call   c00064dc <set_bits>
c0006a44:	83 c4 10             	add    $0x10,%esp
c0006a47:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0006a4e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006a51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a57:	83 c0 07             	add    $0x7,%eax
c0006a5a:	8d 50 07             	lea    0x7(%eax),%edx
c0006a5d:	85 c0                	test   %eax,%eax
c0006a5f:	0f 48 c2             	cmovs  %edx,%eax
c0006a62:	c1 f8 03             	sar    $0x3,%eax
c0006a65:	a3 54 e7 00 c0       	mov    %eax,0xc000e754
c0006a6a:	a1 b4 06 01 c0       	mov    0xc00106b4,%eax
c0006a6f:	8b 15 b0 06 01 c0    	mov    0xc00106b0,%edx
c0006a75:	01 c2                	add    %eax,%edx
c0006a77:	a1 e8 0e 01 c0       	mov    0xc0010ee8,%eax
c0006a7c:	01 d0                	add    %edx,%eax
c0006a7e:	a3 50 e7 00 c0       	mov    %eax,0xc000e750
c0006a83:	8b 15 54 e7 00 c0    	mov    0xc000e754,%edx
c0006a89:	a1 50 e7 00 c0       	mov    0xc000e750,%eax
c0006a8e:	83 ec 04             	sub    $0x4,%esp
c0006a91:	52                   	push   %edx
c0006a92:	6a 00                	push   $0x0
c0006a94:	50                   	push   %eax
c0006a95:	e8 45 3a 00 00       	call   c000a4df <Memset>
c0006a9a:	83 c4 10             	add    $0x10,%esp
c0006a9d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006aa0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006aa3:	01 d0                	add    %edx,%eax
c0006aa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006aa8:	a1 54 e7 00 c0       	mov    0xc000e754,%eax
c0006aad:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006ab2:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006ab8:	85 c0                	test   %eax,%eax
c0006aba:	0f 48 c2             	cmovs  %edx,%eax
c0006abd:	c1 f8 0c             	sar    $0xc,%eax
c0006ac0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ac3:	ff 75 e8             	pushl  -0x18(%ebp)
c0006ac6:	6a 01                	push   $0x1
c0006ac8:	ff 75 e0             	pushl  -0x20(%ebp)
c0006acb:	68 ac 06 01 c0       	push   $0xc00106ac
c0006ad0:	e8 07 fa ff ff       	call   c00064dc <set_bits>
c0006ad5:	83 c4 10             	add    $0x10,%esp
c0006ad8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006adb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ade:	01 d0                	add    %edx,%eax
c0006ae0:	c1 e0 0c             	shl    $0xc,%eax
c0006ae3:	a3 58 e7 00 c0       	mov    %eax,0xc000e758
c0006ae8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006aeb:	83 c0 02             	add    $0x2,%eax
c0006aee:	c1 e0 0c             	shl    $0xc,%eax
c0006af1:	89 c2                	mov    %eax,%edx
c0006af3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006af6:	01 d0                	add    %edx,%eax
c0006af8:	a3 58 e7 00 c0       	mov    %eax,0xc000e758
c0006afd:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0006b04:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006b07:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006b0a:	90                   	nop
c0006b0b:	c9                   	leave  
c0006b0c:	c3                   	ret    

c0006b0d <init_memory>:
c0006b0d:	55                   	push   %ebp
c0006b0e:	89 e5                	mov    %esp,%ebp
c0006b10:	83 ec 38             	sub    $0x38,%esp
c0006b13:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0006b1a:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0006b21:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0006b28:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b2b:	05 00 00 10 00       	add    $0x100000,%eax
c0006b30:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b33:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b36:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0006b39:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006b3f:	85 c0                	test   %eax,%eax
c0006b41:	0f 48 c2             	cmovs  %edx,%eax
c0006b44:	c1 f8 0c             	sar    $0xc,%eax
c0006b47:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006b4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006b4d:	89 c2                	mov    %eax,%edx
c0006b4f:	c1 ea 1f             	shr    $0x1f,%edx
c0006b52:	01 d0                	add    %edx,%eax
c0006b54:	d1 f8                	sar    %eax
c0006b56:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006b59:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006b5c:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0006b5f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006b62:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006b65:	8d 50 07             	lea    0x7(%eax),%edx
c0006b68:	85 c0                	test   %eax,%eax
c0006b6a:	0f 48 c2             	cmovs  %edx,%eax
c0006b6d:	c1 f8 03             	sar    $0x3,%eax
c0006b70:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006b73:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006b76:	8d 50 07             	lea    0x7(%eax),%edx
c0006b79:	85 c0                	test   %eax,%eax
c0006b7b:	0f 48 c2             	cmovs  %edx,%eax
c0006b7e:	c1 f8 03             	sar    $0x3,%eax
c0006b81:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006b84:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b87:	a3 b4 06 01 c0       	mov    %eax,0xc00106b4
c0006b8c:	a1 b4 06 01 c0       	mov    0xc00106b4,%eax
c0006b91:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006b94:	c1 e2 0c             	shl    $0xc,%edx
c0006b97:	01 d0                	add    %edx,%eax
c0006b99:	a3 ec 0e 01 c0       	mov    %eax,0xc0010eec
c0006b9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ba1:	a3 ac 06 01 c0       	mov    %eax,0xc00106ac
c0006ba6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006ba9:	a3 b0 06 01 c0       	mov    %eax,0xc00106b0
c0006bae:	a1 ac 06 01 c0       	mov    0xc00106ac,%eax
c0006bb3:	83 ec 04             	sub    $0x4,%esp
c0006bb6:	ff 75 d8             	pushl  -0x28(%ebp)
c0006bb9:	6a 00                	push   $0x0
c0006bbb:	50                   	push   %eax
c0006bbc:	e8 1e 39 00 00       	call   c000a4df <Memset>
c0006bc1:	83 c4 10             	add    $0x10,%esp
c0006bc4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006bc7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006bca:	01 d0                	add    %edx,%eax
c0006bcc:	a3 e4 0e 01 c0       	mov    %eax,0xc0010ee4
c0006bd1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006bd4:	a3 e8 0e 01 c0       	mov    %eax,0xc0010ee8
c0006bd9:	a1 e4 0e 01 c0       	mov    0xc0010ee4,%eax
c0006bde:	83 ec 04             	sub    $0x4,%esp
c0006be1:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006be4:	6a 00                	push   $0x0
c0006be6:	50                   	push   %eax
c0006be7:	e8 f3 38 00 00       	call   c000a4df <Memset>
c0006bec:	83 c4 10             	add    $0x10,%esp
c0006bef:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006bf2:	a3 54 e7 00 c0       	mov    %eax,0xc000e754
c0006bf7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006bfa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006bfd:	01 c2                	add    %eax,%edx
c0006bff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006c02:	01 d0                	add    %edx,%eax
c0006c04:	a3 50 e7 00 c0       	mov    %eax,0xc000e750
c0006c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c0c:	a3 58 e7 00 c0       	mov    %eax,0xc000e758
c0006c11:	a1 50 e7 00 c0       	mov    0xc000e750,%eax
c0006c16:	83 ec 04             	sub    $0x4,%esp
c0006c19:	ff 75 d8             	pushl  -0x28(%ebp)
c0006c1c:	6a 00                	push   $0x0
c0006c1e:	50                   	push   %eax
c0006c1f:	e8 bb 38 00 00       	call   c000a4df <Memset>
c0006c24:	83 c4 10             	add    $0x10,%esp
c0006c27:	90                   	nop
c0006c28:	c9                   	leave  
c0006c29:	c3                   	ret    

c0006c2a <untar>:
c0006c2a:	55                   	push   %ebp
c0006c2b:	89 e5                	mov    %esp,%ebp
c0006c2d:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c0006c33:	83 ec 08             	sub    $0x8,%esp
c0006c36:	6a 00                	push   $0x0
c0006c38:	ff 75 08             	pushl  0x8(%ebp)
c0006c3b:	e8 f7 ea ff ff       	call   c0005737 <open>
c0006c40:	83 c4 10             	add    $0x10,%esp
c0006c43:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c46:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006c4d:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c0006c54:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006c5b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006c62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006c66:	7e 58                	jle    c0006cc0 <untar+0x96>
c0006c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c6b:	05 ff 01 00 00       	add    $0x1ff,%eax
c0006c70:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0006c76:	85 c0                	test   %eax,%eax
c0006c78:	0f 48 c2             	cmovs  %edx,%eax
c0006c7b:	c1 f8 09             	sar    $0x9,%eax
c0006c7e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006c81:	83 ec 04             	sub    $0x4,%esp
c0006c84:	68 00 20 00 00       	push   $0x2000
c0006c89:	6a 00                	push   $0x0
c0006c8b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006c91:	50                   	push   %eax
c0006c92:	e8 48 38 00 00       	call   c000a4df <Memset>
c0006c97:	83 c4 10             	add    $0x10,%esp
c0006c9a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006c9d:	c1 e0 09             	shl    $0x9,%eax
c0006ca0:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006ca3:	83 ec 04             	sub    $0x4,%esp
c0006ca6:	50                   	push   %eax
c0006ca7:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006cad:	50                   	push   %eax
c0006cae:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006cb1:	e8 d6 ea ff ff       	call   c000578c <read>
c0006cb6:	83 c4 10             	add    $0x10,%esp
c0006cb9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006cc0:	83 ec 04             	sub    $0x4,%esp
c0006cc3:	68 00 20 00 00       	push   $0x2000
c0006cc8:	6a 00                	push   $0x0
c0006cca:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006cd0:	50                   	push   %eax
c0006cd1:	e8 09 38 00 00       	call   c000a4df <Memset>
c0006cd6:	83 c4 10             	add    $0x10,%esp
c0006cd9:	83 ec 04             	sub    $0x4,%esp
c0006cdc:	68 00 02 00 00       	push   $0x200
c0006ce1:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006ce7:	50                   	push   %eax
c0006ce8:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006ceb:	e8 9c ea ff ff       	call   c000578c <read>
c0006cf0:	83 c4 10             	add    $0x10,%esp
c0006cf3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006cf6:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0006cfa:	0f 84 1f 01 00 00    	je     c0006e1f <untar+0x1f5>
c0006d00:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006d03:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006d06:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006d0d:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006d13:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006d16:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006d19:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006d1c:	83 ec 08             	sub    $0x8,%esp
c0006d1f:	6a 07                	push   $0x7
c0006d21:	ff 75 cc             	pushl  -0x34(%ebp)
c0006d24:	e8 0e ea ff ff       	call   c0005737 <open>
c0006d29:	83 c4 10             	add    $0x10,%esp
c0006d2c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006d2f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006d36:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006d39:	83 c0 7c             	add    $0x7c,%eax
c0006d3c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006d3f:	83 ec 0c             	sub    $0xc,%esp
c0006d42:	ff 75 cc             	pushl  -0x34(%ebp)
c0006d45:	e8 ce 37 00 00       	call   c000a518 <Strlen>
c0006d4a:	83 c4 10             	add    $0x10,%esp
c0006d4d:	85 c0                	test   %eax,%eax
c0006d4f:	75 16                	jne    c0006d67 <untar+0x13d>
c0006d51:	83 ec 0c             	sub    $0xc,%esp
c0006d54:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006d57:	e8 bc 37 00 00       	call   c000a518 <Strlen>
c0006d5c:	83 c4 10             	add    $0x10,%esp
c0006d5f:	85 c0                	test   %eax,%eax
c0006d61:	0f 84 bb 00 00 00    	je     c0006e22 <untar+0x1f8>
c0006d67:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006d6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d6d:	eb 1f                	jmp    c0006d8e <untar+0x164>
c0006d6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d72:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0006d79:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d7c:	0f b6 00             	movzbl (%eax),%eax
c0006d7f:	0f be c0             	movsbl %al,%eax
c0006d82:	83 e8 30             	sub    $0x30,%eax
c0006d85:	01 d0                	add    %edx,%eax
c0006d87:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d8a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0006d8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d91:	0f b6 00             	movzbl (%eax),%eax
c0006d94:	84 c0                	test   %al,%al
c0006d96:	75 d7                	jne    c0006d6f <untar+0x145>
c0006d98:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d9b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d9e:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0006da5:	eb 5f                	jmp    c0006e06 <untar+0x1dc>
c0006da7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006daa:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0006dad:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0006db1:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006db4:	83 ec 04             	sub    $0x4,%esp
c0006db7:	68 00 02 00 00       	push   $0x200
c0006dbc:	6a 00                	push   $0x0
c0006dbe:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006dc4:	50                   	push   %eax
c0006dc5:	e8 15 37 00 00       	call   c000a4df <Memset>
c0006dca:	83 c4 10             	add    $0x10,%esp
c0006dcd:	83 ec 04             	sub    $0x4,%esp
c0006dd0:	ff 75 bc             	pushl  -0x44(%ebp)
c0006dd3:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006dd9:	50                   	push   %eax
c0006dda:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006ddd:	e8 aa e9 ff ff       	call   c000578c <read>
c0006de2:	83 c4 10             	add    $0x10,%esp
c0006de5:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006de8:	83 ec 04             	sub    $0x4,%esp
c0006deb:	ff 75 bc             	pushl  -0x44(%ebp)
c0006dee:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006df4:	50                   	push   %eax
c0006df5:	ff 75 c8             	pushl  -0x38(%ebp)
c0006df8:	e8 c6 e9 ff ff       	call   c00057c3 <write>
c0006dfd:	83 c4 10             	add    $0x10,%esp
c0006e00:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006e03:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0006e06:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006e0a:	75 9b                	jne    c0006da7 <untar+0x17d>
c0006e0c:	83 ec 0c             	sub    $0xc,%esp
c0006e0f:	ff 75 c8             	pushl  -0x38(%ebp)
c0006e12:	e8 e3 e9 ff ff       	call   c00057fa <close>
c0006e17:	83 c4 10             	add    $0x10,%esp
c0006e1a:	e9 43 fe ff ff       	jmp    c0006c62 <untar+0x38>
c0006e1f:	90                   	nop
c0006e20:	eb 01                	jmp    c0006e23 <untar+0x1f9>
c0006e22:	90                   	nop
c0006e23:	83 ec 0c             	sub    $0xc,%esp
c0006e26:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006e29:	e8 cc e9 ff ff       	call   c00057fa <close>
c0006e2e:	83 c4 10             	add    $0x10,%esp
c0006e31:	90                   	nop
c0006e32:	c9                   	leave  
c0006e33:	c3                   	ret    

c0006e34 <atoi>:
c0006e34:	55                   	push   %ebp
c0006e35:	89 e5                	mov    %esp,%ebp
c0006e37:	83 ec 10             	sub    $0x10,%esp
c0006e3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e3d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e40:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e43:	8d 50 01             	lea    0x1(%eax),%edx
c0006e46:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006e49:	c6 00 30             	movb   $0x30,(%eax)
c0006e4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e4f:	8d 50 01             	lea    0x1(%eax),%edx
c0006e52:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006e55:	c6 00 78             	movb   $0x78,(%eax)
c0006e58:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0006e5c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006e60:	75 0e                	jne    c0006e70 <atoi+0x3c>
c0006e62:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e65:	8d 50 01             	lea    0x1(%eax),%edx
c0006e68:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006e6b:	c6 00 30             	movb   $0x30,(%eax)
c0006e6e:	eb 61                	jmp    c0006ed1 <atoi+0x9d>
c0006e70:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0006e77:	eb 52                	jmp    c0006ecb <atoi+0x97>
c0006e79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e7c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0006e7f:	89 c1                	mov    %eax,%ecx
c0006e81:	d3 fa                	sar    %cl,%edx
c0006e83:	89 d0                	mov    %edx,%eax
c0006e85:	83 e0 0f             	and    $0xf,%eax
c0006e88:	88 45 fb             	mov    %al,-0x5(%ebp)
c0006e8b:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0006e8f:	75 06                	jne    c0006e97 <atoi+0x63>
c0006e91:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0006e95:	74 2f                	je     c0006ec6 <atoi+0x92>
c0006e97:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0006e9b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0006e9f:	83 c0 30             	add    $0x30,%eax
c0006ea2:	88 45 fb             	mov    %al,-0x5(%ebp)
c0006ea5:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0006ea9:	7e 0a                	jle    c0006eb5 <atoi+0x81>
c0006eab:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0006eaf:	83 c0 07             	add    $0x7,%eax
c0006eb2:	88 45 fb             	mov    %al,-0x5(%ebp)
c0006eb5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006eb8:	8d 50 01             	lea    0x1(%eax),%edx
c0006ebb:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006ebe:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0006ec2:	88 10                	mov    %dl,(%eax)
c0006ec4:	eb 01                	jmp    c0006ec7 <atoi+0x93>
c0006ec6:	90                   	nop
c0006ec7:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0006ecb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006ecf:	79 a8                	jns    c0006e79 <atoi+0x45>
c0006ed1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ed4:	c6 00 00             	movb   $0x0,(%eax)
c0006ed7:	90                   	nop
c0006ed8:	c9                   	leave  
c0006ed9:	c3                   	ret    

c0006eda <disp_int>:
c0006eda:	55                   	push   %ebp
c0006edb:	89 e5                	mov    %esp,%ebp
c0006edd:	83 ec 18             	sub    $0x18,%esp
c0006ee0:	ff 75 08             	pushl  0x8(%ebp)
c0006ee3:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0006ee6:	50                   	push   %eax
c0006ee7:	e8 48 ff ff ff       	call   c0006e34 <atoi>
c0006eec:	83 c4 08             	add    $0x8,%esp
c0006eef:	83 ec 08             	sub    $0x8,%esp
c0006ef2:	6a 0b                	push   $0xb
c0006ef4:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0006ef7:	50                   	push   %eax
c0006ef8:	e8 ba a6 ff ff       	call   c00015b7 <disp_str_colour>
c0006efd:	83 c4 10             	add    $0x10,%esp
c0006f00:	90                   	nop
c0006f01:	c9                   	leave  
c0006f02:	c3                   	ret    

c0006f03 <do_page_fault>:
c0006f03:	55                   	push   %ebp
c0006f04:	89 e5                	mov    %esp,%ebp
c0006f06:	83 ec 28             	sub    $0x28,%esp
c0006f09:	83 ec 0c             	sub    $0xc,%esp
c0006f0c:	68 60 9d 00 c0       	push   $0xc0009d60
c0006f11:	e8 66 a6 ff ff       	call   c000157c <disp_str>
c0006f16:	83 c4 10             	add    $0x10,%esp
c0006f19:	83 ec 0c             	sub    $0xc,%esp
c0006f1c:	68 6f 9d 00 c0       	push   $0xc0009d6f
c0006f21:	e8 56 a6 ff ff       	call   c000157c <disp_str>
c0006f26:	83 c4 10             	add    $0x10,%esp
c0006f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f2c:	83 ec 0c             	sub    $0xc,%esp
c0006f2f:	50                   	push   %eax
c0006f30:	e8 a5 ff ff ff       	call   c0006eda <disp_int>
c0006f35:	83 c4 10             	add    $0x10,%esp
c0006f38:	83 ec 0c             	sub    $0xc,%esp
c0006f3b:	68 74 9d 00 c0       	push   $0xc0009d74
c0006f40:	e8 37 a6 ff ff       	call   c000157c <disp_str>
c0006f45:	83 c4 10             	add    $0x10,%esp
c0006f48:	83 ec 0c             	sub    $0xc,%esp
c0006f4b:	ff 75 f4             	pushl  -0xc(%ebp)
c0006f4e:	e8 ed f7 ff ff       	call   c0006740 <ptr_pde>
c0006f53:	83 c4 10             	add    $0x10,%esp
c0006f56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f59:	83 ec 0c             	sub    $0xc,%esp
c0006f5c:	ff 75 f4             	pushl  -0xc(%ebp)
c0006f5f:	e8 ef f7 ff ff       	call   c0006753 <ptr_pte>
c0006f64:	83 c4 10             	add    $0x10,%esp
c0006f67:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f6a:	83 ec 0c             	sub    $0xc,%esp
c0006f6d:	68 76 9d 00 c0       	push   $0xc0009d76
c0006f72:	e8 05 a6 ff ff       	call   c000157c <disp_str>
c0006f77:	83 c4 10             	add    $0x10,%esp
c0006f7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006f7d:	83 ec 0c             	sub    $0xc,%esp
c0006f80:	50                   	push   %eax
c0006f81:	e8 54 ff ff ff       	call   c0006eda <disp_int>
c0006f86:	83 c4 10             	add    $0x10,%esp
c0006f89:	83 ec 0c             	sub    $0xc,%esp
c0006f8c:	68 7b 9d 00 c0       	push   $0xc0009d7b
c0006f91:	e8 e6 a5 ff ff       	call   c000157c <disp_str>
c0006f96:	83 c4 10             	add    $0x10,%esp
c0006f99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006f9c:	8b 00                	mov    (%eax),%eax
c0006f9e:	83 ec 0c             	sub    $0xc,%esp
c0006fa1:	50                   	push   %eax
c0006fa2:	e8 33 ff ff ff       	call   c0006eda <disp_int>
c0006fa7:	83 c4 10             	add    $0x10,%esp
c0006faa:	83 ec 0c             	sub    $0xc,%esp
c0006fad:	68 74 9d 00 c0       	push   $0xc0009d74
c0006fb2:	e8 c5 a5 ff ff       	call   c000157c <disp_str>
c0006fb7:	83 c4 10             	add    $0x10,%esp
c0006fba:	83 ec 0c             	sub    $0xc,%esp
c0006fbd:	68 84 9d 00 c0       	push   $0xc0009d84
c0006fc2:	e8 b5 a5 ff ff       	call   c000157c <disp_str>
c0006fc7:	83 c4 10             	add    $0x10,%esp
c0006fca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fcd:	83 ec 0c             	sub    $0xc,%esp
c0006fd0:	50                   	push   %eax
c0006fd1:	e8 04 ff ff ff       	call   c0006eda <disp_int>
c0006fd6:	83 c4 10             	add    $0x10,%esp
c0006fd9:	83 ec 0c             	sub    $0xc,%esp
c0006fdc:	68 89 9d 00 c0       	push   $0xc0009d89
c0006fe1:	e8 96 a5 ff ff       	call   c000157c <disp_str>
c0006fe6:	83 c4 10             	add    $0x10,%esp
c0006fe9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fec:	8b 00                	mov    (%eax),%eax
c0006fee:	83 ec 0c             	sub    $0xc,%esp
c0006ff1:	50                   	push   %eax
c0006ff2:	e8 e3 fe ff ff       	call   c0006eda <disp_int>
c0006ff7:	83 c4 10             	add    $0x10,%esp
c0006ffa:	83 ec 0c             	sub    $0xc,%esp
c0006ffd:	68 74 9d 00 c0       	push   $0xc0009d74
c0007002:	e8 75 a5 ff ff       	call   c000157c <disp_str>
c0007007:	83 c4 10             	add    $0x10,%esp
c000700a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000700d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007012:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007015:	83 ec 0c             	sub    $0xc,%esp
c0007018:	6a 00                	push   $0x0
c000701a:	e8 24 f6 ff ff       	call   c0006643 <get_a_page>
c000701f:	83 c4 10             	add    $0x10,%esp
c0007022:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007025:	83 ec 08             	sub    $0x8,%esp
c0007028:	ff 75 e4             	pushl  -0x1c(%ebp)
c000702b:	ff 75 e8             	pushl  -0x18(%ebp)
c000702e:	e8 47 f7 ff ff       	call   c000677a <add_map_entry>
c0007033:	83 c4 10             	add    $0x10,%esp
c0007036:	c7 45 e0 00 00 10 00 	movl   $0x100000,-0x20(%ebp)
c000703d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007040:	8b 00                	mov    (%eax),%eax
c0007042:	83 e0 01             	and    $0x1,%eax
c0007045:	85 c0                	test   %eax,%eax
c0007047:	74 09                	je     c0007052 <do_page_fault+0x14f>
c0007049:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
c0007050:	eb 07                	jmp    c0007059 <do_page_fault+0x156>
c0007052:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0007059:	90                   	nop
c000705a:	c9                   	leave  
c000705b:	c3                   	ret    

c000705c <exception_handler>:
c000705c:	55                   	push   %ebp
c000705d:	89 e5                	mov    %esp,%ebp
c000705f:	57                   	push   %edi
c0007060:	56                   	push   %esi
c0007061:	53                   	push   %ebx
c0007062:	83 ec 6c             	sub    $0x6c,%esp
c0007065:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007068:	bb e0 9f 00 c0       	mov    $0xc0009fe0,%ebx
c000706d:	ba 13 00 00 00       	mov    $0x13,%edx
c0007072:	89 c7                	mov    %eax,%edi
c0007074:	89 de                	mov    %ebx,%esi
c0007076:	89 d1                	mov    %edx,%ecx
c0007078:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000707a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007081:	eb 04                	jmp    c0007087 <exception_handler+0x2b>
c0007083:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007087:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c000708e:	7e f3                	jle    c0007083 <exception_handler+0x27>
c0007090:	83 ec 0c             	sub    $0xc,%esp
c0007093:	68 92 9d 00 c0       	push   $0xc0009d92
c0007098:	e8 df a4 ff ff       	call   c000157c <disp_str>
c000709d:	83 c4 10             	add    $0x10,%esp
c00070a0:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c00070a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00070aa:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c00070ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00070b1:	83 ec 0c             	sub    $0xc,%esp
c00070b4:	ff 75 dc             	pushl  -0x24(%ebp)
c00070b7:	e8 c0 a4 ff ff       	call   c000157c <disp_str>
c00070bc:	83 c4 10             	add    $0x10,%esp
c00070bf:	83 ec 0c             	sub    $0xc,%esp
c00070c2:	68 a0 9d 00 c0       	push   $0xc0009da0
c00070c7:	e8 b0 a4 ff ff       	call   c000157c <disp_str>
c00070cc:	83 c4 10             	add    $0x10,%esp
c00070cf:	83 ec 0c             	sub    $0xc,%esp
c00070d2:	68 a3 9d 00 c0       	push   $0xc0009da3
c00070d7:	e8 a0 a4 ff ff       	call   c000157c <disp_str>
c00070dc:	83 c4 10             	add    $0x10,%esp
c00070df:	8b 45 08             	mov    0x8(%ebp),%eax
c00070e2:	83 ec 0c             	sub    $0xc,%esp
c00070e5:	50                   	push   %eax
c00070e6:	e8 ef fd ff ff       	call   c0006eda <disp_int>
c00070eb:	83 c4 10             	add    $0x10,%esp
c00070ee:	83 ec 0c             	sub    $0xc,%esp
c00070f1:	68 a0 9d 00 c0       	push   $0xc0009da0
c00070f6:	e8 81 a4 ff ff       	call   c000157c <disp_str>
c00070fb:	83 c4 10             	add    $0x10,%esp
c00070fe:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007102:	74 2f                	je     c0007133 <exception_handler+0xd7>
c0007104:	83 ec 0c             	sub    $0xc,%esp
c0007107:	68 ab 9d 00 c0       	push   $0xc0009dab
c000710c:	e8 6b a4 ff ff       	call   c000157c <disp_str>
c0007111:	83 c4 10             	add    $0x10,%esp
c0007114:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007117:	83 ec 0c             	sub    $0xc,%esp
c000711a:	50                   	push   %eax
c000711b:	e8 ba fd ff ff       	call   c0006eda <disp_int>
c0007120:	83 c4 10             	add    $0x10,%esp
c0007123:	83 ec 0c             	sub    $0xc,%esp
c0007126:	68 a0 9d 00 c0       	push   $0xc0009da0
c000712b:	e8 4c a4 ff ff       	call   c000157c <disp_str>
c0007130:	83 c4 10             	add    $0x10,%esp
c0007133:	83 ec 0c             	sub    $0xc,%esp
c0007136:	68 b5 9d 00 c0       	push   $0xc0009db5
c000713b:	e8 3c a4 ff ff       	call   c000157c <disp_str>
c0007140:	83 c4 10             	add    $0x10,%esp
c0007143:	83 ec 0c             	sub    $0xc,%esp
c0007146:	ff 75 14             	pushl  0x14(%ebp)
c0007149:	e8 8c fd ff ff       	call   c0006eda <disp_int>
c000714e:	83 c4 10             	add    $0x10,%esp
c0007151:	83 ec 0c             	sub    $0xc,%esp
c0007154:	68 a0 9d 00 c0       	push   $0xc0009da0
c0007159:	e8 1e a4 ff ff       	call   c000157c <disp_str>
c000715e:	83 c4 10             	add    $0x10,%esp
c0007161:	83 ec 0c             	sub    $0xc,%esp
c0007164:	68 b9 9d 00 c0       	push   $0xc0009db9
c0007169:	e8 0e a4 ff ff       	call   c000157c <disp_str>
c000716e:	83 c4 10             	add    $0x10,%esp
c0007171:	8b 45 10             	mov    0x10(%ebp),%eax
c0007174:	83 ec 0c             	sub    $0xc,%esp
c0007177:	50                   	push   %eax
c0007178:	e8 5d fd ff ff       	call   c0006eda <disp_int>
c000717d:	83 c4 10             	add    $0x10,%esp
c0007180:	83 ec 0c             	sub    $0xc,%esp
c0007183:	68 a0 9d 00 c0       	push   $0xc0009da0
c0007188:	e8 ef a3 ff ff       	call   c000157c <disp_str>
c000718d:	83 c4 10             	add    $0x10,%esp
c0007190:	83 ec 0c             	sub    $0xc,%esp
c0007193:	68 be 9d 00 c0       	push   $0xc0009dbe
c0007198:	e8 df a3 ff ff       	call   c000157c <disp_str>
c000719d:	83 c4 10             	add    $0x10,%esp
c00071a0:	83 ec 0c             	sub    $0xc,%esp
c00071a3:	ff 75 18             	pushl  0x18(%ebp)
c00071a6:	e8 2f fd ff ff       	call   c0006eda <disp_int>
c00071ab:	83 c4 10             	add    $0x10,%esp
c00071ae:	83 ec 0c             	sub    $0xc,%esp
c00071b1:	68 a0 9d 00 c0       	push   $0xc0009da0
c00071b6:	e8 c1 a3 ff ff       	call   c000157c <disp_str>
c00071bb:	83 c4 10             	add    $0x10,%esp
c00071be:	83 ec 0c             	sub    $0xc,%esp
c00071c1:	68 c8 9d 00 c0       	push   $0xc0009dc8
c00071c6:	e8 b1 a3 ff ff       	call   c000157c <disp_str>
c00071cb:	83 c4 10             	add    $0x10,%esp
c00071ce:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c00071d2:	75 06                	jne    c00071da <exception_handler+0x17e>
c00071d4:	e8 2a fd ff ff       	call   c0006f03 <do_page_fault>
c00071d9:	90                   	nop
c00071da:	90                   	nop
c00071db:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00071de:	5b                   	pop    %ebx
c00071df:	5e                   	pop    %esi
c00071e0:	5f                   	pop    %edi
c00071e1:	5d                   	pop    %ebp
c00071e2:	c3                   	ret    

c00071e3 <exception_handler2>:
c00071e3:	55                   	push   %ebp
c00071e4:	89 e5                	mov    %esp,%ebp
c00071e6:	57                   	push   %edi
c00071e7:	56                   	push   %esi
c00071e8:	53                   	push   %ebx
c00071e9:	83 ec 6c             	sub    $0x6c,%esp
c00071ec:	8d 45 90             	lea    -0x70(%ebp),%eax
c00071ef:	bb e0 9f 00 c0       	mov    $0xc0009fe0,%ebx
c00071f4:	ba 13 00 00 00       	mov    $0x13,%edx
c00071f9:	89 c7                	mov    %eax,%edi
c00071fb:	89 de                	mov    %ebx,%esi
c00071fd:	89 d1                	mov    %edx,%ecx
c00071ff:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007201:	c7 05 5c e7 00 c0 6a 	movl   $0x2e6a,0xc000e75c
c0007208:	2e 00 00 
c000720b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007212:	eb 14                	jmp    c0007228 <exception_handler2+0x45>
c0007214:	83 ec 0c             	sub    $0xc,%esp
c0007217:	68 2c a0 00 c0       	push   $0xc000a02c
c000721c:	e8 5b a3 ff ff       	call   c000157c <disp_str>
c0007221:	83 c4 10             	add    $0x10,%esp
c0007224:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007228:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c000722f:	7e e3                	jle    c0007214 <exception_handler2+0x31>
c0007231:	c7 05 5c e7 00 c0 6a 	movl   $0x2e6a,0xc000e75c
c0007238:	2e 00 00 
c000723b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007242:	8b 45 08             	mov    0x8(%ebp),%eax
c0007245:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007249:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000724c:	83 ec 08             	sub    $0x8,%esp
c000724f:	ff 75 e0             	pushl  -0x20(%ebp)
c0007252:	ff 75 dc             	pushl  -0x24(%ebp)
c0007255:	e8 5d a3 ff ff       	call   c00015b7 <disp_str_colour>
c000725a:	83 c4 10             	add    $0x10,%esp
c000725d:	83 ec 0c             	sub    $0xc,%esp
c0007260:	68 a0 9d 00 c0       	push   $0xc0009da0
c0007265:	e8 12 a3 ff ff       	call   c000157c <disp_str>
c000726a:	83 c4 10             	add    $0x10,%esp
c000726d:	83 ec 08             	sub    $0x8,%esp
c0007270:	ff 75 e0             	pushl  -0x20(%ebp)
c0007273:	68 a3 9d 00 c0       	push   $0xc0009da3
c0007278:	e8 3a a3 ff ff       	call   c00015b7 <disp_str_colour>
c000727d:	83 c4 10             	add    $0x10,%esp
c0007280:	83 ec 0c             	sub    $0xc,%esp
c0007283:	ff 75 08             	pushl  0x8(%ebp)
c0007286:	e8 4f fc ff ff       	call   c0006eda <disp_int>
c000728b:	83 c4 10             	add    $0x10,%esp
c000728e:	83 ec 0c             	sub    $0xc,%esp
c0007291:	68 a0 9d 00 c0       	push   $0xc0009da0
c0007296:	e8 e1 a2 ff ff       	call   c000157c <disp_str>
c000729b:	83 c4 10             	add    $0x10,%esp
c000729e:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c00072a2:	74 44                	je     c00072e8 <exception_handler2+0x105>
c00072a4:	83 ec 08             	sub    $0x8,%esp
c00072a7:	ff 75 e0             	pushl  -0x20(%ebp)
c00072aa:	68 ab 9d 00 c0       	push   $0xc0009dab
c00072af:	e8 03 a3 ff ff       	call   c00015b7 <disp_str_colour>
c00072b4:	83 c4 10             	add    $0x10,%esp
c00072b7:	83 ec 08             	sub    $0x8,%esp
c00072ba:	ff 75 e0             	pushl  -0x20(%ebp)
c00072bd:	68 ab 9d 00 c0       	push   $0xc0009dab
c00072c2:	e8 f0 a2 ff ff       	call   c00015b7 <disp_str_colour>
c00072c7:	83 c4 10             	add    $0x10,%esp
c00072ca:	83 ec 0c             	sub    $0xc,%esp
c00072cd:	ff 75 0c             	pushl  0xc(%ebp)
c00072d0:	e8 05 fc ff ff       	call   c0006eda <disp_int>
c00072d5:	83 c4 10             	add    $0x10,%esp
c00072d8:	83 ec 0c             	sub    $0xc,%esp
c00072db:	68 a0 9d 00 c0       	push   $0xc0009da0
c00072e0:	e8 97 a2 ff ff       	call   c000157c <disp_str>
c00072e5:	83 c4 10             	add    $0x10,%esp
c00072e8:	83 ec 08             	sub    $0x8,%esp
c00072eb:	ff 75 e0             	pushl  -0x20(%ebp)
c00072ee:	68 b5 9d 00 c0       	push   $0xc0009db5
c00072f3:	e8 bf a2 ff ff       	call   c00015b7 <disp_str_colour>
c00072f8:	83 c4 10             	add    $0x10,%esp
c00072fb:	83 ec 0c             	sub    $0xc,%esp
c00072fe:	ff 75 14             	pushl  0x14(%ebp)
c0007301:	e8 d4 fb ff ff       	call   c0006eda <disp_int>
c0007306:	83 c4 10             	add    $0x10,%esp
c0007309:	83 ec 0c             	sub    $0xc,%esp
c000730c:	68 a0 9d 00 c0       	push   $0xc0009da0
c0007311:	e8 66 a2 ff ff       	call   c000157c <disp_str>
c0007316:	83 c4 10             	add    $0x10,%esp
c0007319:	83 ec 08             	sub    $0x8,%esp
c000731c:	ff 75 e0             	pushl  -0x20(%ebp)
c000731f:	68 b9 9d 00 c0       	push   $0xc0009db9
c0007324:	e8 8e a2 ff ff       	call   c00015b7 <disp_str_colour>
c0007329:	83 c4 10             	add    $0x10,%esp
c000732c:	83 ec 0c             	sub    $0xc,%esp
c000732f:	ff 75 10             	pushl  0x10(%ebp)
c0007332:	e8 a3 fb ff ff       	call   c0006eda <disp_int>
c0007337:	83 c4 10             	add    $0x10,%esp
c000733a:	83 ec 0c             	sub    $0xc,%esp
c000733d:	68 a0 9d 00 c0       	push   $0xc0009da0
c0007342:	e8 35 a2 ff ff       	call   c000157c <disp_str>
c0007347:	83 c4 10             	add    $0x10,%esp
c000734a:	83 ec 08             	sub    $0x8,%esp
c000734d:	ff 75 e0             	pushl  -0x20(%ebp)
c0007350:	68 be 9d 00 c0       	push   $0xc0009dbe
c0007355:	e8 5d a2 ff ff       	call   c00015b7 <disp_str_colour>
c000735a:	83 c4 10             	add    $0x10,%esp
c000735d:	83 ec 0c             	sub    $0xc,%esp
c0007360:	ff 75 18             	pushl  0x18(%ebp)
c0007363:	e8 72 fb ff ff       	call   c0006eda <disp_int>
c0007368:	83 c4 10             	add    $0x10,%esp
c000736b:	83 ec 0c             	sub    $0xc,%esp
c000736e:	68 a0 9d 00 c0       	push   $0xc0009da0
c0007373:	e8 04 a2 ff ff       	call   c000157c <disp_str>
c0007378:	83 c4 10             	add    $0x10,%esp
c000737b:	90                   	nop
c000737c:	8d 65 f4             	lea    -0xc(%ebp),%esp
c000737f:	5b                   	pop    %ebx
c0007380:	5e                   	pop    %esi
c0007381:	5f                   	pop    %edi
c0007382:	5d                   	pop    %ebp
c0007383:	c3                   	ret    

c0007384 <init_internal_interrupt>:
c0007384:	55                   	push   %ebp
c0007385:	89 e5                	mov    %esp,%ebp
c0007387:	83 ec 08             	sub    $0x8,%esp
c000738a:	6a 0e                	push   $0xe
c000738c:	6a 08                	push   $0x8
c000738e:	68 f3 15 00 c0       	push   $0xc00015f3
c0007393:	6a 00                	push   $0x0
c0007395:	e8 6e d5 ff ff       	call   c0004908 <InitInterruptDesc>
c000739a:	83 c4 10             	add    $0x10,%esp
c000739d:	6a 0e                	push   $0xe
c000739f:	6a 08                	push   $0x8
c00073a1:	68 f9 15 00 c0       	push   $0xc00015f9
c00073a6:	6a 01                	push   $0x1
c00073a8:	e8 5b d5 ff ff       	call   c0004908 <InitInterruptDesc>
c00073ad:	83 c4 10             	add    $0x10,%esp
c00073b0:	6a 0e                	push   $0xe
c00073b2:	6a 08                	push   $0x8
c00073b4:	68 ff 15 00 c0       	push   $0xc00015ff
c00073b9:	6a 02                	push   $0x2
c00073bb:	e8 48 d5 ff ff       	call   c0004908 <InitInterruptDesc>
c00073c0:	83 c4 10             	add    $0x10,%esp
c00073c3:	6a 0e                	push   $0xe
c00073c5:	6a 08                	push   $0x8
c00073c7:	68 05 16 00 c0       	push   $0xc0001605
c00073cc:	6a 03                	push   $0x3
c00073ce:	e8 35 d5 ff ff       	call   c0004908 <InitInterruptDesc>
c00073d3:	83 c4 10             	add    $0x10,%esp
c00073d6:	6a 0e                	push   $0xe
c00073d8:	6a 08                	push   $0x8
c00073da:	68 0b 16 00 c0       	push   $0xc000160b
c00073df:	6a 04                	push   $0x4
c00073e1:	e8 22 d5 ff ff       	call   c0004908 <InitInterruptDesc>
c00073e6:	83 c4 10             	add    $0x10,%esp
c00073e9:	6a 0e                	push   $0xe
c00073eb:	6a 08                	push   $0x8
c00073ed:	68 11 16 00 c0       	push   $0xc0001611
c00073f2:	6a 05                	push   $0x5
c00073f4:	e8 0f d5 ff ff       	call   c0004908 <InitInterruptDesc>
c00073f9:	83 c4 10             	add    $0x10,%esp
c00073fc:	6a 0e                	push   $0xe
c00073fe:	6a 08                	push   $0x8
c0007400:	68 17 16 00 c0       	push   $0xc0001617
c0007405:	6a 06                	push   $0x6
c0007407:	e8 fc d4 ff ff       	call   c0004908 <InitInterruptDesc>
c000740c:	83 c4 10             	add    $0x10,%esp
c000740f:	6a 0e                	push   $0xe
c0007411:	6a 08                	push   $0x8
c0007413:	68 1d 16 00 c0       	push   $0xc000161d
c0007418:	6a 07                	push   $0x7
c000741a:	e8 e9 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c000741f:	83 c4 10             	add    $0x10,%esp
c0007422:	6a 0e                	push   $0xe
c0007424:	6a 08                	push   $0x8
c0007426:	68 23 16 00 c0       	push   $0xc0001623
c000742b:	6a 08                	push   $0x8
c000742d:	e8 d6 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c0007432:	83 c4 10             	add    $0x10,%esp
c0007435:	6a 0e                	push   $0xe
c0007437:	6a 08                	push   $0x8
c0007439:	68 27 16 00 c0       	push   $0xc0001627
c000743e:	6a 09                	push   $0x9
c0007440:	e8 c3 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c0007445:	83 c4 10             	add    $0x10,%esp
c0007448:	6a 0e                	push   $0xe
c000744a:	6a 08                	push   $0x8
c000744c:	68 2d 16 00 c0       	push   $0xc000162d
c0007451:	6a 0a                	push   $0xa
c0007453:	e8 b0 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c0007458:	83 c4 10             	add    $0x10,%esp
c000745b:	6a 0e                	push   $0xe
c000745d:	6a 08                	push   $0x8
c000745f:	68 31 16 00 c0       	push   $0xc0001631
c0007464:	6a 0b                	push   $0xb
c0007466:	e8 9d d4 ff ff       	call   c0004908 <InitInterruptDesc>
c000746b:	83 c4 10             	add    $0x10,%esp
c000746e:	6a 0e                	push   $0xe
c0007470:	6a 08                	push   $0x8
c0007472:	68 35 16 00 c0       	push   $0xc0001635
c0007477:	6a 0c                	push   $0xc
c0007479:	e8 8a d4 ff ff       	call   c0004908 <InitInterruptDesc>
c000747e:	83 c4 10             	add    $0x10,%esp
c0007481:	6a 0e                	push   $0xe
c0007483:	6a 08                	push   $0x8
c0007485:	68 39 16 00 c0       	push   $0xc0001639
c000748a:	6a 0d                	push   $0xd
c000748c:	e8 77 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c0007491:	83 c4 10             	add    $0x10,%esp
c0007494:	6a 0e                	push   $0xe
c0007496:	6a 08                	push   $0x8
c0007498:	68 3d 16 00 c0       	push   $0xc000163d
c000749d:	6a 0e                	push   $0xe
c000749f:	e8 64 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c00074a4:	83 c4 10             	add    $0x10,%esp
c00074a7:	6a 0e                	push   $0xe
c00074a9:	6a 08                	push   $0x8
c00074ab:	68 41 16 00 c0       	push   $0xc0001641
c00074b0:	6a 10                	push   $0x10
c00074b2:	e8 51 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c00074b7:	83 c4 10             	add    $0x10,%esp
c00074ba:	6a 0e                	push   $0xe
c00074bc:	6a 08                	push   $0x8
c00074be:	68 47 16 00 c0       	push   $0xc0001647
c00074c3:	6a 11                	push   $0x11
c00074c5:	e8 3e d4 ff ff       	call   c0004908 <InitInterruptDesc>
c00074ca:	83 c4 10             	add    $0x10,%esp
c00074cd:	6a 0e                	push   $0xe
c00074cf:	6a 08                	push   $0x8
c00074d1:	68 4b 16 00 c0       	push   $0xc000164b
c00074d6:	6a 12                	push   $0x12
c00074d8:	e8 2b d4 ff ff       	call   c0004908 <InitInterruptDesc>
c00074dd:	83 c4 10             	add    $0x10,%esp
c00074e0:	6a 0e                	push   $0xe
c00074e2:	6a 0e                	push   $0xe
c00074e4:	68 16 17 00 c0       	push   $0xc0001716
c00074e9:	68 90 00 00 00       	push   $0x90
c00074ee:	e8 15 d4 ff ff       	call   c0004908 <InitInterruptDesc>
c00074f3:	83 c4 10             	add    $0x10,%esp
c00074f6:	90                   	nop
c00074f7:	c9                   	leave  
c00074f8:	c3                   	ret    

c00074f9 <test>:
c00074f9:	55                   	push   %ebp
c00074fa:	89 e5                	mov    %esp,%ebp
c00074fc:	83 ec 08             	sub    $0x8,%esp
c00074ff:	83 ec 0c             	sub    $0xc,%esp
c0007502:	68 2e a0 00 c0       	push   $0xc000a02e
c0007507:	e8 70 a0 ff ff       	call   c000157c <disp_str>
c000750c:	83 c4 10             	add    $0x10,%esp
c000750f:	83 ec 0c             	sub    $0xc,%esp
c0007512:	6a 06                	push   $0x6
c0007514:	e8 c1 f9 ff ff       	call   c0006eda <disp_int>
c0007519:	83 c4 10             	add    $0x10,%esp
c000751c:	83 ec 0c             	sub    $0xc,%esp
c000751f:	68 74 9d 00 c0       	push   $0xc0009d74
c0007524:	e8 53 a0 ff ff       	call   c000157c <disp_str>
c0007529:	83 c4 10             	add    $0x10,%esp
c000752c:	90                   	nop
c000752d:	c9                   	leave  
c000752e:	c3                   	ret    

c000752f <disp_str_colour3>:
c000752f:	55                   	push   %ebp
c0007530:	89 e5                	mov    %esp,%ebp
c0007532:	90                   	nop
c0007533:	5d                   	pop    %ebp
c0007534:	c3                   	ret    

c0007535 <spurious_irq>:
c0007535:	55                   	push   %ebp
c0007536:	89 e5                	mov    %esp,%ebp
c0007538:	83 ec 08             	sub    $0x8,%esp
c000753b:	83 ec 08             	sub    $0x8,%esp
c000753e:	6a 0b                	push   $0xb
c0007540:	68 30 a0 00 c0       	push   $0xc000a030
c0007545:	e8 6d a0 ff ff       	call   c00015b7 <disp_str_colour>
c000754a:	83 c4 10             	add    $0x10,%esp
c000754d:	83 ec 0c             	sub    $0xc,%esp
c0007550:	ff 75 08             	pushl  0x8(%ebp)
c0007553:	e8 82 f9 ff ff       	call   c0006eda <disp_int>
c0007558:	83 c4 10             	add    $0x10,%esp
c000755b:	a1 e0 0e 01 c0       	mov    0xc0010ee0,%eax
c0007560:	83 c0 01             	add    $0x1,%eax
c0007563:	a3 e0 0e 01 c0       	mov    %eax,0xc0010ee0
c0007568:	83 ec 0c             	sub    $0xc,%esp
c000756b:	68 57 a0 00 c0       	push   $0xc000a057
c0007570:	e8 07 a0 ff ff       	call   c000157c <disp_str>
c0007575:	83 c4 10             	add    $0x10,%esp
c0007578:	a1 e0 0e 01 c0       	mov    0xc0010ee0,%eax
c000757d:	83 ec 0c             	sub    $0xc,%esp
c0007580:	50                   	push   %eax
c0007581:	e8 54 f9 ff ff       	call   c0006eda <disp_int>
c0007586:	83 c4 10             	add    $0x10,%esp
c0007589:	83 ec 0c             	sub    $0xc,%esp
c000758c:	68 59 a0 00 c0       	push   $0xc000a059
c0007591:	e8 e6 9f ff ff       	call   c000157c <disp_str>
c0007596:	83 c4 10             	add    $0x10,%esp
c0007599:	83 ec 08             	sub    $0x8,%esp
c000759c:	6a 0c                	push   $0xc
c000759e:	68 5c a0 00 c0       	push   $0xc000a05c
c00075a3:	e8 0f a0 ff ff       	call   c00015b7 <disp_str_colour>
c00075a8:	83 c4 10             	add    $0x10,%esp
c00075ab:	90                   	nop
c00075ac:	c9                   	leave  
c00075ad:	c3                   	ret    

c00075ae <init_keyboard>:
c00075ae:	55                   	push   %ebp
c00075af:	89 e5                	mov    %esp,%ebp
c00075b1:	83 ec 18             	sub    $0x18,%esp
c00075b4:	83 ec 04             	sub    $0x4,%esp
c00075b7:	68 00 02 00 00       	push   $0x200
c00075bc:	6a 00                	push   $0x0
c00075be:	68 ac eb 00 c0       	push   $0xc000ebac
c00075c3:	e8 17 2f 00 00       	call   c000a4df <Memset>
c00075c8:	83 c4 10             	add    $0x10,%esp
c00075cb:	c7 05 a0 eb 00 c0 ac 	movl   $0xc000ebac,0xc000eba0
c00075d2:	eb 00 c0 
c00075d5:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c00075da:	a3 a4 eb 00 c0       	mov    %eax,0xc000eba4
c00075df:	c7 05 a8 eb 00 c0 00 	movl   $0x0,0xc000eba8
c00075e6:	00 00 00 
c00075e9:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c00075f0:	00 00 00 
c00075f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00075fa:	eb 04                	jmp    c0007600 <init_keyboard+0x52>
c00075fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007600:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0007607:	7e f3                	jle    c00075fc <init_keyboard+0x4e>
c0007609:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c0007610:	00 00 00 
c0007613:	e8 79 df ff ff       	call   c0005591 <init_keyboard_handler>
c0007618:	90                   	nop
c0007619:	c9                   	leave  
c000761a:	c3                   	ret    

c000761b <init2>:
c000761b:	55                   	push   %ebp
c000761c:	89 e5                	mov    %esp,%ebp
c000761e:	83 ec 08             	sub    $0x8,%esp
c0007621:	83 ec 0c             	sub    $0xc,%esp
c0007624:	68 81 a0 00 c0       	push   $0xc000a081
c0007629:	e8 4e 9f ff ff       	call   c000157c <disp_str>
c000762e:	83 c4 10             	add    $0x10,%esp
c0007631:	e8 78 ff ff ff       	call   c00075ae <init_keyboard>
c0007636:	83 ec 0c             	sub    $0xc,%esp
c0007639:	68 00 00 00 02       	push   $0x2000000
c000763e:	e8 ca f4 ff ff       	call   c0006b0d <init_memory>
c0007643:	83 c4 10             	add    $0x10,%esp
c0007646:	90                   	nop
c0007647:	c9                   	leave  
c0007648:	c3                   	ret    

c0007649 <u_thread_a>:
c0007649:	55                   	push   %ebp
c000764a:	89 e5                	mov    %esp,%ebp
c000764c:	83 ec 08             	sub    $0x8,%esp
c000764f:	83 ec 0c             	sub    $0xc,%esp
c0007652:	68 87 a0 00 c0       	push   $0xc000a087
c0007657:	e8 20 9f ff ff       	call   c000157c <disp_str>
c000765c:	83 c4 10             	add    $0x10,%esp
c000765f:	eb fe                	jmp    c000765f <u_thread_a+0x16>

c0007661 <kernel_main2>:
c0007661:	55                   	push   %ebp
c0007662:	89 e5                	mov    %esp,%ebp
c0007664:	57                   	push   %edi
c0007665:	56                   	push   %esi
c0007666:	53                   	push   %ebx
c0007667:	83 ec 3c             	sub    $0x3c,%esp
c000766a:	83 ec 0c             	sub    $0xc,%esp
c000766d:	68 95 a0 00 c0       	push   $0xc000a095
c0007672:	e8 05 9f ff ff       	call   c000157c <disp_str>
c0007677:	83 c4 10             	add    $0x10,%esp
c000767a:	e8 57 a2 ff ff       	call   c00018d6 <init>
c000767f:	c7 05 e0 0e 01 c0 00 	movl   $0x0,0xc0010ee0
c0007686:	00 00 00 
c0007689:	c7 05 bc 06 01 c0 00 	movl   $0x0,0xc00106bc
c0007690:	00 00 00 
c0007693:	c7 05 60 e7 00 c0 00 	movl   $0x0,0xc000e760
c000769a:	00 00 00 
c000769d:	c7 45 dc c0 21 08 c0 	movl   $0xc00821c0,-0x24(%ebp)
c00076a4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00076ab:	e9 fd 01 00 00       	jmp    c00078ad <kernel_main2+0x24c>
c00076b0:	83 ec 08             	sub    $0x8,%esp
c00076b3:	6a 00                	push   $0x0
c00076b5:	6a 01                	push   $0x1
c00076b7:	e8 7e f1 ff ff       	call   c000683a <alloc_memory>
c00076bc:	83 c4 10             	add    $0x10,%esp
c00076bf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00076c2:	83 ec 04             	sub    $0x4,%esp
c00076c5:	68 ac 01 00 00       	push   $0x1ac
c00076ca:	6a 00                	push   $0x0
c00076cc:	ff 75 d8             	pushl  -0x28(%ebp)
c00076cf:	e8 0b 2e 00 00       	call   c000a4df <Memset>
c00076d4:	83 c4 10             	add    $0x10,%esp
c00076d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00076da:	05 00 10 00 00       	add    $0x1000,%eax
c00076df:	89 c2                	mov    %eax,%edx
c00076e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00076e4:	89 10                	mov    %edx,(%eax)
c00076e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00076e9:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
c00076ef:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00076f2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00076f5:	89 50 18             	mov    %edx,0x18(%eax)
c00076f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00076fb:	c7 80 3c 01 00 00 00 	movl   $0x0,0x13c(%eax)
c0007702:	00 00 00 
c0007705:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0007709:	7e 0f                	jle    c000771a <kernel_main2+0xb9>
c000770b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000770e:	c6 80 44 01 00 00 ff 	movb   $0xff,0x144(%eax)
c0007715:	e9 8f 01 00 00       	jmp    c00078a9 <kernel_main2+0x248>
c000771a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000771d:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c0007724:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c0007728:	7f 73                	jg     c000779d <kernel_main2+0x13c>
c000772a:	c7 45 e4 40 d0 00 c0 	movl   $0xc000d040,-0x1c(%ebp)
c0007731:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0007738:	c7 45 d0 24 00 00 00 	movl   $0x24,-0x30(%ebp)
c000773f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007742:	8b 00                	mov    (%eax),%eax
c0007744:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0007747:	89 c2                	mov    %eax,%edx
c0007749:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000774c:	89 10                	mov    %edx,(%eax)
c000774e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007751:	8b 00                	mov    (%eax),%eax
c0007753:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0007756:	89 c2                	mov    %eax,%edx
c0007758:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000775b:	89 10                	mov    %edx,(%eax)
c000775d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007760:	8b 00                	mov    (%eax),%eax
c0007762:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007765:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007768:	8b 50 14             	mov    0x14(%eax),%edx
c000776b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000776e:	89 50 20             	mov    %edx,0x20(%eax)
c0007771:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007774:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000777a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000777d:	8b 10                	mov    (%eax),%edx
c000777f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007782:	89 50 04             	mov    %edx,0x4(%eax)
c0007785:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007788:	8b 50 04             	mov    0x4(%eax),%edx
c000778b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000778e:	89 50 08             	mov    %edx,0x8(%eax)
c0007791:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007794:	8b 50 08             	mov    0x8(%eax),%edx
c0007797:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000779a:	89 50 0c             	mov    %edx,0xc(%eax)
c000779d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00077a0:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00077a3:	83 c2 28             	add    $0x28,%edx
c00077a6:	83 ec 08             	sub    $0x8,%esp
c00077a9:	50                   	push   %eax
c00077aa:	52                   	push   %edx
c00077ab:	e8 4e 2d 00 00       	call   c000a4fe <Strcpy>
c00077b0:	83 c4 10             	add    $0x10,%esp
c00077b3:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00077b7:	83 c8 04             	or     $0x4,%eax
c00077ba:	0f b6 c0             	movzbl %al,%eax
c00077bd:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c00077c1:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00077c5:	83 c8 0c             	or     $0xc,%eax
c00077c8:	0f b6 c0             	movzbl %al,%eax
c00077cb:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c00077cf:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c00077d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00077d6:	89 90 9c 01 00 00    	mov    %edx,0x19c(%eax)
c00077dc:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00077e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00077e3:	89 90 74 01 00 00    	mov    %edx,0x174(%eax)
c00077e9:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00077ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00077f0:	89 90 6c 01 00 00    	mov    %edx,0x16c(%eax)
c00077f6:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00077fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00077fd:	89 90 70 01 00 00    	mov    %edx,0x170(%eax)
c0007803:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0007807:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000780a:	89 90 a8 01 00 00    	mov    %edx,0x1a8(%eax)
c0007810:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007813:	c7 80 68 01 00 00 39 	movl   $0x39,0x168(%eax)
c000781a:	00 00 00 
c000781d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007820:	8b 40 14             	mov    0x14(%eax),%eax
c0007823:	89 c2                	mov    %eax,%edx
c0007825:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007828:	89 90 98 01 00 00    	mov    %edx,0x198(%eax)
c000782e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007831:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0007834:	89 90 a0 01 00 00    	mov    %edx,0x1a0(%eax)
c000783a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000783d:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0007844:	00 00 00 
c0007847:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000784a:	c7 80 54 01 00 00 00 	movl   $0x0,0x154(%eax)
c0007851:	00 00 00 
c0007854:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007857:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c000785e:	00 00 00 
c0007861:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007864:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c000786b:	00 00 00 
c000786e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007871:	c7 80 4c 01 00 00 1d 	movl   $0x1d,0x14c(%eax)
c0007878:	00 00 00 
c000787b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000787e:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c0007885:	00 00 00 
c0007888:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000788b:	69 c0 ac 01 00 00    	imul   $0x1ac,%eax,%eax
c0007891:	8d 90 c0 21 08 c0    	lea    -0x3ff7de40(%eax),%edx
c0007897:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000789a:	89 c3                	mov    %eax,%ebx
c000789c:	b8 6b 00 00 00       	mov    $0x6b,%eax
c00078a1:	89 d7                	mov    %edx,%edi
c00078a3:	89 de                	mov    %ebx,%esi
c00078a5:	89 c1                	mov    %eax,%ecx
c00078a7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00078a9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00078ad:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00078b1:	0f 8e f9 fd ff ff    	jle    c00076b0 <kernel_main2+0x4f>
c00078b7:	c7 05 80 eb 00 c0 c0 	movl   $0xc00821c0,0xc000eb80
c00078be:	21 08 c0 
c00078c1:	eb fe                	jmp    c00078c1 <kernel_main2+0x260>

c00078c3 <TestFS>:
c00078c3:	55                   	push   %ebp
c00078c4:	89 e5                	mov    %esp,%ebp
c00078c6:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
c00078cc:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c00078d3:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c00078da:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c00078e0:	83 ec 08             	sub    $0x8,%esp
c00078e3:	6a 02                	push   $0x2
c00078e5:	8d 45 be             	lea    -0x42(%ebp),%eax
c00078e8:	50                   	push   %eax
c00078e9:	e8 49 de ff ff       	call   c0005737 <open>
c00078ee:	83 c4 10             	add    $0x10,%esp
c00078f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078f4:	83 ec 08             	sub    $0x8,%esp
c00078f7:	6a 02                	push   $0x2
c00078f9:	8d 45 be             	lea    -0x42(%ebp),%eax
c00078fc:	50                   	push   %eax
c00078fd:	e8 35 de ff ff       	call   c0005737 <open>
c0007902:	83 c4 10             	add    $0x10,%esp
c0007905:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007908:	83 ec 0c             	sub    $0xc,%esp
c000790b:	68 a1 a0 00 c0       	push   $0xc000a0a1
c0007910:	e8 ed 0d 00 00       	call   c0008702 <Printf>
c0007915:	83 c4 10             	add    $0x10,%esp
c0007918:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c000791f:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0007923:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c000792a:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c000792e:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0007935:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c000793c:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0007942:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007949:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000794d:	75 fa                	jne    c0007949 <TestFS+0x86>
c000794f:	83 ec 08             	sub    $0x8,%esp
c0007952:	6a 07                	push   $0x7
c0007954:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0007957:	50                   	push   %eax
c0007958:	e8 da dd ff ff       	call   c0005737 <open>
c000795d:	83 c4 10             	add    $0x10,%esp
c0007960:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007963:	83 ec 08             	sub    $0x8,%esp
c0007966:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007969:	68 b3 a0 00 c0       	push   $0xc000a0b3
c000796e:	e8 8f 0d 00 00       	call   c0008702 <Printf>
c0007973:	83 c4 10             	add    $0x10,%esp
c0007976:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000797d:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0007984:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c000798b:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0007992:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0007999:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c00079a0:	83 ec 0c             	sub    $0xc,%esp
c00079a3:	8d 45 96             	lea    -0x6a(%ebp),%eax
c00079a6:	50                   	push   %eax
c00079a7:	e8 6c 2b 00 00       	call   c000a518 <Strlen>
c00079ac:	83 c4 10             	add    $0x10,%esp
c00079af:	83 ec 04             	sub    $0x4,%esp
c00079b2:	50                   	push   %eax
c00079b3:	8d 45 96             	lea    -0x6a(%ebp),%eax
c00079b6:	50                   	push   %eax
c00079b7:	ff 75 e4             	pushl  -0x1c(%ebp)
c00079ba:	e8 04 de ff ff       	call   c00057c3 <write>
c00079bf:	83 c4 10             	add    $0x10,%esp
c00079c2:	83 ec 04             	sub    $0x4,%esp
c00079c5:	6a 14                	push   $0x14
c00079c7:	6a 00                	push   $0x0
c00079c9:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00079cc:	50                   	push   %eax
c00079cd:	e8 0d 2b 00 00       	call   c000a4df <Memset>
c00079d2:	83 c4 10             	add    $0x10,%esp
c00079d5:	83 ec 04             	sub    $0x4,%esp
c00079d8:	6a 12                	push   $0x12
c00079da:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00079dd:	50                   	push   %eax
c00079de:	ff 75 e4             	pushl  -0x1c(%ebp)
c00079e1:	e8 a6 dd ff ff       	call   c000578c <read>
c00079e6:	83 c4 10             	add    $0x10,%esp
c00079e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00079ec:	83 ec 08             	sub    $0x8,%esp
c00079ef:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00079f2:	50                   	push   %eax
c00079f3:	68 bc a0 00 c0       	push   $0xc000a0bc
c00079f8:	e8 05 0d 00 00       	call   c0008702 <Printf>
c00079fd:	83 c4 10             	add    $0x10,%esp
c0007a00:	83 ec 0c             	sub    $0xc,%esp
c0007a03:	6a 0a                	push   $0xa
c0007a05:	e8 97 0b 00 00       	call   c00085a1 <delay>
c0007a0a:	83 c4 10             	add    $0x10,%esp
c0007a0d:	83 ec 08             	sub    $0x8,%esp
c0007a10:	6a 07                	push   $0x7
c0007a12:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0007a15:	50                   	push   %eax
c0007a16:	e8 1c dd ff ff       	call   c0005737 <open>
c0007a1b:	83 c4 10             	add    $0x10,%esp
c0007a1e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a21:	83 ec 08             	sub    $0x8,%esp
c0007a24:	ff 75 dc             	pushl  -0x24(%ebp)
c0007a27:	68 c7 a0 00 c0       	push   $0xc000a0c7
c0007a2c:	e8 d1 0c 00 00       	call   c0008702 <Printf>
c0007a31:	83 c4 10             	add    $0x10,%esp
c0007a34:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007a3b:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0007a42:	67 3a 68 
c0007a45:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0007a4c:	77 20 61 
c0007a4f:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0007a56:	65 20 79 
c0007a59:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0007a60:	75 3f 00 
c0007a63:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0007a6a:	00 00 00 
c0007a6d:	83 ec 0c             	sub    $0xc,%esp
c0007a70:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0007a76:	50                   	push   %eax
c0007a77:	e8 9c 2a 00 00       	call   c000a518 <Strlen>
c0007a7c:	83 c4 10             	add    $0x10,%esp
c0007a7f:	83 ec 04             	sub    $0x4,%esp
c0007a82:	50                   	push   %eax
c0007a83:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0007a89:	50                   	push   %eax
c0007a8a:	ff 75 dc             	pushl  -0x24(%ebp)
c0007a8d:	e8 31 dd ff ff       	call   c00057c3 <write>
c0007a92:	83 c4 10             	add    $0x10,%esp
c0007a95:	83 ec 04             	sub    $0x4,%esp
c0007a98:	6a 14                	push   $0x14
c0007a9a:	6a 00                	push   $0x0
c0007a9c:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0007aa2:	50                   	push   %eax
c0007aa3:	e8 37 2a 00 00       	call   c000a4df <Memset>
c0007aa8:	83 c4 10             	add    $0x10,%esp
c0007aab:	83 ec 04             	sub    $0x4,%esp
c0007aae:	6a 12                	push   $0x12
c0007ab0:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0007ab6:	50                   	push   %eax
c0007ab7:	ff 75 dc             	pushl  -0x24(%ebp)
c0007aba:	e8 cd dc ff ff       	call   c000578c <read>
c0007abf:	83 c4 10             	add    $0x10,%esp
c0007ac2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007ac5:	83 ec 08             	sub    $0x8,%esp
c0007ac8:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0007ace:	50                   	push   %eax
c0007acf:	68 d1 a0 00 c0       	push   $0xc000a0d1
c0007ad4:	e8 29 0c 00 00       	call   c0008702 <Printf>
c0007ad9:	83 c4 10             	add    $0x10,%esp
c0007adc:	83 ec 08             	sub    $0x8,%esp
c0007adf:	6a 07                	push   $0x7
c0007ae1:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0007ae4:	50                   	push   %eax
c0007ae5:	e8 4d dc ff ff       	call   c0005737 <open>
c0007aea:	83 c4 10             	add    $0x10,%esp
c0007aed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007af0:	83 ec 08             	sub    $0x8,%esp
c0007af3:	ff 75 dc             	pushl  -0x24(%ebp)
c0007af6:	68 c7 a0 00 c0       	push   $0xc000a0c7
c0007afb:	e8 02 0c 00 00       	call   c0008702 <Printf>
c0007b00:	83 c4 10             	add    $0x10,%esp
c0007b03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b0a:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0007b11:	20 77 69 
c0007b14:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0007b1b:	6c 20 73 
c0007b1e:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0007b25:	63 63 65 
c0007b28:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0007b2f:	73 20 61 
c0007b32:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0007b39:	20 6c 61 
c0007b3c:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0007b43:	74 2e 00 
c0007b46:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0007b4d:	00 00 00 
c0007b50:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0007b57:	00 00 
c0007b59:	83 ec 0c             	sub    $0xc,%esp
c0007b5c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0007b62:	50                   	push   %eax
c0007b63:	e8 b0 29 00 00       	call   c000a518 <Strlen>
c0007b68:	83 c4 10             	add    $0x10,%esp
c0007b6b:	83 ec 04             	sub    $0x4,%esp
c0007b6e:	50                   	push   %eax
c0007b6f:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0007b75:	50                   	push   %eax
c0007b76:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007b79:	e8 45 dc ff ff       	call   c00057c3 <write>
c0007b7e:	83 c4 10             	add    $0x10,%esp
c0007b81:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007b88:	eb 5c                	jmp    c0007be6 <TestFS+0x323>
c0007b8a:	83 ec 04             	sub    $0x4,%esp
c0007b8d:	6a 1e                	push   $0x1e
c0007b8f:	6a 00                	push   $0x0
c0007b91:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0007b97:	50                   	push   %eax
c0007b98:	e8 42 29 00 00       	call   c000a4df <Memset>
c0007b9d:	83 c4 10             	add    $0x10,%esp
c0007ba0:	83 ec 0c             	sub    $0xc,%esp
c0007ba3:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0007ba9:	50                   	push   %eax
c0007baa:	e8 69 29 00 00       	call   c000a518 <Strlen>
c0007baf:	83 c4 10             	add    $0x10,%esp
c0007bb2:	83 ec 04             	sub    $0x4,%esp
c0007bb5:	50                   	push   %eax
c0007bb6:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0007bbc:	50                   	push   %eax
c0007bbd:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007bc0:	e8 c7 db ff ff       	call   c000578c <read>
c0007bc5:	83 c4 10             	add    $0x10,%esp
c0007bc8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007bcb:	83 ec 08             	sub    $0x8,%esp
c0007bce:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0007bd4:	50                   	push   %eax
c0007bd5:	68 dc a0 00 c0       	push   $0xc000a0dc
c0007bda:	e8 23 0b 00 00       	call   c0008702 <Printf>
c0007bdf:	83 c4 10             	add    $0x10,%esp
c0007be2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0007be6:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
c0007bea:	7e 9e                	jle    c0007b8a <TestFS+0x2c7>
c0007bec:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0007bf3:	6e 73 74 
c0007bf6:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0007bfd:	6c 6c 2e 
c0007c00:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0007c07:	61 72 00 
c0007c0a:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0007c11:	00 00 00 
c0007c14:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0007c1b:	00 00 00 
c0007c1e:	83 ec 08             	sub    $0x8,%esp
c0007c21:	6a 00                	push   $0x0
c0007c23:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0007c29:	50                   	push   %eax
c0007c2a:	e8 08 db ff ff       	call   c0005737 <open>
c0007c2f:	83 c4 10             	add    $0x10,%esp
c0007c32:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007c35:	83 ec 08             	sub    $0x8,%esp
c0007c38:	ff 75 cc             	pushl  -0x34(%ebp)
c0007c3b:	68 e7 a0 00 c0       	push   $0xc000a0e7
c0007c40:	e8 bd 0a 00 00       	call   c0008702 <Printf>
c0007c45:	83 c4 10             	add    $0x10,%esp
c0007c48:	83 ec 04             	sub    $0x4,%esp
c0007c4b:	6a 14                	push   $0x14
c0007c4d:	6a 00                	push   $0x0
c0007c4f:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0007c55:	50                   	push   %eax
c0007c56:	e8 84 28 00 00       	call   c000a4df <Memset>
c0007c5b:	83 c4 10             	add    $0x10,%esp
c0007c5e:	83 ec 04             	sub    $0x4,%esp
c0007c61:	68 00 02 00 00       	push   $0x200
c0007c66:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0007c6c:	50                   	push   %eax
c0007c6d:	ff 75 cc             	pushl  -0x34(%ebp)
c0007c70:	e8 17 db ff ff       	call   c000578c <read>
c0007c75:	83 c4 10             	add    $0x10,%esp
c0007c78:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007c7b:	83 ec 08             	sub    $0x8,%esp
c0007c7e:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0007c84:	50                   	push   %eax
c0007c85:	68 f1 a0 00 c0       	push   $0xc000a0f1
c0007c8a:	e8 73 0a 00 00       	call   c0008702 <Printf>
c0007c8f:	83 c4 10             	add    $0x10,%esp
c0007c92:	e9 b2 fc ff ff       	jmp    c0007949 <TestFS+0x86>

c0007c97 <wait_exit>:
c0007c97:	55                   	push   %ebp
c0007c98:	89 e5                	mov    %esp,%ebp
c0007c9a:	83 ec 28             	sub    $0x28,%esp
c0007c9d:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0007ca4:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0007cab:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0007cb1:	83 ec 08             	sub    $0x8,%esp
c0007cb4:	6a 02                	push   $0x2
c0007cb6:	8d 45 de             	lea    -0x22(%ebp),%eax
c0007cb9:	50                   	push   %eax
c0007cba:	e8 78 da ff ff       	call   c0005737 <open>
c0007cbf:	83 c4 10             	add    $0x10,%esp
c0007cc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007cc5:	83 ec 08             	sub    $0x8,%esp
c0007cc8:	6a 02                	push   $0x2
c0007cca:	8d 45 de             	lea    -0x22(%ebp),%eax
c0007ccd:	50                   	push   %eax
c0007cce:	e8 64 da ff ff       	call   c0005737 <open>
c0007cd3:	83 c4 10             	add    $0x10,%esp
c0007cd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007cd9:	e8 cf db ff ff       	call   c00058ad <fork>
c0007cde:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007ce1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007ce5:	7e 25                	jle    c0007d0c <wait_exit+0x75>
c0007ce7:	83 ec 0c             	sub    $0xc,%esp
c0007cea:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007ced:	50                   	push   %eax
c0007cee:	e8 53 db ff ff       	call   c0005846 <wait>
c0007cf3:	83 c4 10             	add    $0x10,%esp
c0007cf6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007cf9:	83 ec 08             	sub    $0x8,%esp
c0007cfc:	50                   	push   %eax
c0007cfd:	68 fc a0 00 c0       	push   $0xc000a0fc
c0007d02:	e8 fb 09 00 00       	call   c0008702 <Printf>
c0007d07:	83 c4 10             	add    $0x10,%esp
c0007d0a:	eb fe                	jmp    c0007d0a <wait_exit+0x73>
c0007d0c:	83 ec 0c             	sub    $0xc,%esp
c0007d0f:	68 17 a1 00 c0       	push   $0xc000a117
c0007d14:	e8 e9 09 00 00       	call   c0008702 <Printf>
c0007d19:	83 c4 10             	add    $0x10,%esp
c0007d1c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007d23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d26:	8d 50 01             	lea    0x1(%eax),%edx
c0007d29:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0007d2c:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0007d31:	7f 02                	jg     c0007d35 <wait_exit+0x9e>
c0007d33:	eb ee                	jmp    c0007d23 <wait_exit+0x8c>
c0007d35:	90                   	nop
c0007d36:	83 ec 0c             	sub    $0xc,%esp
c0007d39:	68 23 a1 00 c0       	push   $0xc000a123
c0007d3e:	e8 bf 09 00 00       	call   c0008702 <Printf>
c0007d43:	83 c4 10             	add    $0x10,%esp
c0007d46:	83 ec 0c             	sub    $0xc,%esp
c0007d49:	6a 09                	push   $0x9
c0007d4b:	e8 34 db ff ff       	call   c0005884 <exit>
c0007d50:	83 c4 10             	add    $0x10,%esp
c0007d53:	83 ec 0c             	sub    $0xc,%esp
c0007d56:	68 31 a1 00 c0       	push   $0xc000a131
c0007d5b:	e8 a2 09 00 00       	call   c0008702 <Printf>
c0007d60:	83 c4 10             	add    $0x10,%esp
c0007d63:	eb fe                	jmp    c0007d63 <wait_exit+0xcc>

c0007d65 <INIT_fork>:
c0007d65:	55                   	push   %ebp
c0007d66:	89 e5                	mov    %esp,%ebp
c0007d68:	53                   	push   %ebx
c0007d69:	81 ec 84 00 00 00    	sub    $0x84,%esp
c0007d6f:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c0007d76:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0007d7d:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0007d83:	83 ec 08             	sub    $0x8,%esp
c0007d86:	6a 02                	push   $0x2
c0007d88:	8d 45 da             	lea    -0x26(%ebp),%eax
c0007d8b:	50                   	push   %eax
c0007d8c:	e8 a6 d9 ff ff       	call   c0005737 <open>
c0007d91:	83 c4 10             	add    $0x10,%esp
c0007d94:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d97:	83 ec 08             	sub    $0x8,%esp
c0007d9a:	6a 02                	push   $0x2
c0007d9c:	8d 45 da             	lea    -0x26(%ebp),%eax
c0007d9f:	50                   	push   %eax
c0007da0:	e8 92 d9 ff ff       	call   c0005737 <open>
c0007da5:	83 c4 10             	add    $0x10,%esp
c0007da8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007dab:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c0007db2:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c0007db9:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c0007dc0:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c0007dc7:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c0007dce:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0007dd5:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0007ddc:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0007de3:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0007dea:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0007df1:	83 ec 0c             	sub    $0xc,%esp
c0007df4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007df7:	50                   	push   %eax
c0007df8:	e8 1b 27 00 00       	call   c000a518 <Strlen>
c0007dfd:	83 c4 10             	add    $0x10,%esp
c0007e00:	83 ec 04             	sub    $0x4,%esp
c0007e03:	50                   	push   %eax
c0007e04:	6a 00                	push   $0x0
c0007e06:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007e09:	50                   	push   %eax
c0007e0a:	e8 d0 26 00 00       	call   c000a4df <Memset>
c0007e0f:	83 c4 10             	add    $0x10,%esp
c0007e12:	83 ec 04             	sub    $0x4,%esp
c0007e15:	6a 28                	push   $0x28
c0007e17:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007e1a:	50                   	push   %eax
c0007e1b:	ff 75 e8             	pushl  -0x18(%ebp)
c0007e1e:	e8 69 d9 ff ff       	call   c000578c <read>
c0007e23:	83 c4 10             	add    $0x10,%esp
c0007e26:	83 ec 04             	sub    $0x4,%esp
c0007e29:	6a 28                	push   $0x28
c0007e2b:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007e2e:	50                   	push   %eax
c0007e2f:	ff 75 ec             	pushl  -0x14(%ebp)
c0007e32:	e8 8c d9 ff ff       	call   c00057c3 <write>
c0007e37:	83 c4 10             	add    $0x10,%esp
c0007e3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007e41:	e8 67 da ff ff       	call   c00058ad <fork>
c0007e46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007e49:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0007e4d:	0f 8e dd 00 00 00    	jle    c0007f30 <INIT_fork+0x1cb>
c0007e53:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007e57:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
c0007e5e:	61 72 65 
c0007e61:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
c0007e68:	8d 45 87             	lea    -0x79(%ebp),%eax
c0007e6b:	b9 20 00 00 00       	mov    $0x20,%ecx
c0007e70:	bb 00 00 00 00       	mov    $0x0,%ebx
c0007e75:	89 18                	mov    %ebx,(%eax)
c0007e77:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0007e7b:	8d 50 04             	lea    0x4(%eax),%edx
c0007e7e:	83 e2 fc             	and    $0xfffffffc,%edx
c0007e81:	29 d0                	sub    %edx,%eax
c0007e83:	01 c1                	add    %eax,%ecx
c0007e85:	83 e1 fc             	and    $0xfffffffc,%ecx
c0007e88:	83 e1 fc             	and    $0xfffffffc,%ecx
c0007e8b:	b8 00 00 00 00       	mov    $0x0,%eax
c0007e90:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0007e93:	83 c0 04             	add    $0x4,%eax
c0007e96:	39 c8                	cmp    %ecx,%eax
c0007e98:	72 f6                	jb     c0007e90 <INIT_fork+0x12b>
c0007e9a:	01 c2                	add    %eax,%edx
c0007e9c:	83 ec 0c             	sub    $0xc,%esp
c0007e9f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007ea5:	50                   	push   %eax
c0007ea6:	e8 6d 26 00 00       	call   c000a518 <Strlen>
c0007eab:	83 c4 10             	add    $0x10,%esp
c0007eae:	83 ec 04             	sub    $0x4,%esp
c0007eb1:	50                   	push   %eax
c0007eb2:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007eb8:	50                   	push   %eax
c0007eb9:	ff 75 ec             	pushl  -0x14(%ebp)
c0007ebc:	e8 02 d9 ff ff       	call   c00057c3 <write>
c0007ec1:	83 c4 10             	add    $0x10,%esp
c0007ec4:	83 ec 0c             	sub    $0xc,%esp
c0007ec7:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007ecd:	50                   	push   %eax
c0007ece:	e8 45 26 00 00       	call   c000a518 <Strlen>
c0007ed3:	83 c4 10             	add    $0x10,%esp
c0007ed6:	83 ec 04             	sub    $0x4,%esp
c0007ed9:	50                   	push   %eax
c0007eda:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007ee0:	50                   	push   %eax
c0007ee1:	ff 75 ec             	pushl  -0x14(%ebp)
c0007ee4:	e8 da d8 ff ff       	call   c00057c3 <write>
c0007ee9:	83 c4 10             	add    $0x10,%esp
c0007eec:	83 ec 0c             	sub    $0xc,%esp
c0007eef:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007ef5:	50                   	push   %eax
c0007ef6:	e8 1d 26 00 00       	call   c000a518 <Strlen>
c0007efb:	83 c4 10             	add    $0x10,%esp
c0007efe:	83 ec 04             	sub    $0x4,%esp
c0007f01:	50                   	push   %eax
c0007f02:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007f08:	50                   	push   %eax
c0007f09:	ff 75 ec             	pushl  -0x14(%ebp)
c0007f0c:	e8 b2 d8 ff ff       	call   c00057c3 <write>
c0007f11:	83 c4 10             	add    $0x10,%esp
c0007f14:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007f1b:	eb 08                	jmp    c0007f25 <INIT_fork+0x1c0>
c0007f1d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007f21:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0007f25:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0007f29:	7e f2                	jle    c0007f1d <INIT_fork+0x1b8>
c0007f2b:	e9 0f 01 00 00       	jmp    c000803f <INIT_fork+0x2da>
c0007f30:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007f34:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0007f38:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
c0007f3f:	68 69 6c 
c0007f42:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
c0007f49:	8d 45 87             	lea    -0x79(%ebp),%eax
c0007f4c:	b9 20 00 00 00       	mov    $0x20,%ecx
c0007f51:	bb 00 00 00 00       	mov    $0x0,%ebx
c0007f56:	89 18                	mov    %ebx,(%eax)
c0007f58:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0007f5c:	8d 50 04             	lea    0x4(%eax),%edx
c0007f5f:	83 e2 fc             	and    $0xfffffffc,%edx
c0007f62:	29 d0                	sub    %edx,%eax
c0007f64:	01 c1                	add    %eax,%ecx
c0007f66:	83 e1 fc             	and    $0xfffffffc,%ecx
c0007f69:	83 e1 fc             	and    $0xfffffffc,%ecx
c0007f6c:	b8 00 00 00 00       	mov    $0x0,%eax
c0007f71:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0007f74:	83 c0 04             	add    $0x4,%eax
c0007f77:	39 c8                	cmp    %ecx,%eax
c0007f79:	72 f6                	jb     c0007f71 <INIT_fork+0x20c>
c0007f7b:	01 c2                	add    %eax,%edx
c0007f7d:	83 ec 0c             	sub    $0xc,%esp
c0007f80:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007f86:	50                   	push   %eax
c0007f87:	e8 8c 25 00 00       	call   c000a518 <Strlen>
c0007f8c:	83 c4 10             	add    $0x10,%esp
c0007f8f:	83 ec 04             	sub    $0x4,%esp
c0007f92:	50                   	push   %eax
c0007f93:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007f99:	50                   	push   %eax
c0007f9a:	ff 75 ec             	pushl  -0x14(%ebp)
c0007f9d:	e8 21 d8 ff ff       	call   c00057c3 <write>
c0007fa2:	83 c4 10             	add    $0x10,%esp
c0007fa5:	83 ec 0c             	sub    $0xc,%esp
c0007fa8:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fae:	50                   	push   %eax
c0007faf:	e8 64 25 00 00       	call   c000a518 <Strlen>
c0007fb4:	83 c4 10             	add    $0x10,%esp
c0007fb7:	83 ec 04             	sub    $0x4,%esp
c0007fba:	50                   	push   %eax
c0007fbb:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fc1:	50                   	push   %eax
c0007fc2:	ff 75 ec             	pushl  -0x14(%ebp)
c0007fc5:	e8 f9 d7 ff ff       	call   c00057c3 <write>
c0007fca:	83 c4 10             	add    $0x10,%esp
c0007fcd:	83 ec 0c             	sub    $0xc,%esp
c0007fd0:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fd6:	50                   	push   %eax
c0007fd7:	e8 3c 25 00 00       	call   c000a518 <Strlen>
c0007fdc:	83 c4 10             	add    $0x10,%esp
c0007fdf:	83 ec 04             	sub    $0x4,%esp
c0007fe2:	50                   	push   %eax
c0007fe3:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fe9:	50                   	push   %eax
c0007fea:	ff 75 ec             	pushl  -0x14(%ebp)
c0007fed:	e8 d1 d7 ff ff       	call   c00057c3 <write>
c0007ff2:	83 c4 10             	add    $0x10,%esp
c0007ff5:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
c0007ffc:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
c0008003:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
c0008009:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
c000800d:	83 ec 0c             	sub    $0xc,%esp
c0008010:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008013:	50                   	push   %eax
c0008014:	e8 ff 24 00 00       	call   c000a518 <Strlen>
c0008019:	83 c4 10             	add    $0x10,%esp
c000801c:	83 ec 04             	sub    $0x4,%esp
c000801f:	50                   	push   %eax
c0008020:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008023:	50                   	push   %eax
c0008024:	ff 75 ec             	pushl  -0x14(%ebp)
c0008027:	e8 97 d7 ff ff       	call   c00057c3 <write>
c000802c:	83 c4 10             	add    $0x10,%esp
c000802f:	83 ec 0c             	sub    $0xc,%esp
c0008032:	68 3f a1 00 c0       	push   $0xc000a13f
c0008037:	e8 f3 09 00 00       	call   c0008a2f <spin>
c000803c:	83 c4 10             	add    $0x10,%esp
c000803f:	83 ec 0c             	sub    $0xc,%esp
c0008042:	68 46 a1 00 c0       	push   $0xc000a146
c0008047:	e8 e3 09 00 00       	call   c0008a2f <spin>
c000804c:	83 c4 10             	add    $0x10,%esp
c000804f:	90                   	nop
c0008050:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0008053:	c9                   	leave  
c0008054:	c3                   	ret    

c0008055 <simple_shell>:
c0008055:	55                   	push   %ebp
c0008056:	89 e5                	mov    %esp,%ebp
c0008058:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c000805e:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008065:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c000806c:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008072:	83 ec 08             	sub    $0x8,%esp
c0008075:	6a 02                	push   $0x2
c0008077:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000807a:	50                   	push   %eax
c000807b:	e8 b7 d6 ff ff       	call   c0005737 <open>
c0008080:	83 c4 10             	add    $0x10,%esp
c0008083:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008086:	83 ec 08             	sub    $0x8,%esp
c0008089:	6a 02                	push   $0x2
c000808b:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000808e:	50                   	push   %eax
c000808f:	e8 a3 d6 ff ff       	call   c0005737 <open>
c0008094:	83 c4 10             	add    $0x10,%esp
c0008097:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000809a:	83 ec 04             	sub    $0x4,%esp
c000809d:	68 80 00 00 00       	push   $0x80
c00080a2:	6a 00                	push   $0x0
c00080a4:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00080aa:	50                   	push   %eax
c00080ab:	e8 2f 24 00 00       	call   c000a4df <Memset>
c00080b0:	83 c4 10             	add    $0x10,%esp
c00080b3:	83 ec 04             	sub    $0x4,%esp
c00080b6:	68 80 00 00 00       	push   $0x80
c00080bb:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00080c1:	50                   	push   %eax
c00080c2:	ff 75 e0             	pushl  -0x20(%ebp)
c00080c5:	e8 c2 d6 ff ff       	call   c000578c <read>
c00080ca:	83 c4 10             	add    $0x10,%esp
c00080cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00080d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00080db:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00080e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00080e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00080e7:	0f b6 00             	movzbl (%eax),%eax
c00080ea:	88 45 db             	mov    %al,-0x25(%ebp)
c00080ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00080f0:	0f b6 00             	movzbl (%eax),%eax
c00080f3:	3c 20                	cmp    $0x20,%al
c00080f5:	74 1d                	je     c0008114 <simple_shell+0xbf>
c00080f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00080fa:	0f b6 00             	movzbl (%eax),%eax
c00080fd:	84 c0                	test   %al,%al
c00080ff:	74 13                	je     c0008114 <simple_shell+0xbf>
c0008101:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008105:	75 0d                	jne    c0008114 <simple_shell+0xbf>
c0008107:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000810a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000810d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008114:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008117:	0f b6 00             	movzbl (%eax),%eax
c000811a:	3c 20                	cmp    $0x20,%al
c000811c:	74 0a                	je     c0008128 <simple_shell+0xd3>
c000811e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008121:	0f b6 00             	movzbl (%eax),%eax
c0008124:	84 c0                	test   %al,%al
c0008126:	75 26                	jne    c000814e <simple_shell+0xf9>
c0008128:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c000812c:	75 20                	jne    c000814e <simple_shell+0xf9>
c000812e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008131:	8d 50 01             	lea    0x1(%eax),%edx
c0008134:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008137:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000813a:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008141:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008144:	c6 00 00             	movb   $0x0,(%eax)
c0008147:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000814e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008152:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008156:	75 8c                	jne    c00080e4 <simple_shell+0x8f>
c0008158:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000815b:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008162:	00 00 00 00 
c0008166:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000816d:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008173:	83 ec 08             	sub    $0x8,%esp
c0008176:	6a 02                	push   $0x2
c0008178:	50                   	push   %eax
c0008179:	e8 b9 d5 ff ff       	call   c0005737 <open>
c000817e:	83 c4 10             	add    $0x10,%esp
c0008181:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008184:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008188:	75 54                	jne    c00081de <simple_shell+0x189>
c000818a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008191:	eb 29                	jmp    c00081bc <simple_shell+0x167>
c0008193:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008199:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000819c:	01 d0                	add    %edx,%eax
c000819e:	0f b6 00             	movzbl (%eax),%eax
c00081a1:	0f be c0             	movsbl %al,%eax
c00081a4:	83 ec 04             	sub    $0x4,%esp
c00081a7:	50                   	push   %eax
c00081a8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00081ab:	68 4e a1 00 c0       	push   $0xc000a14e
c00081b0:	e8 4d 05 00 00       	call   c0008702 <Printf>
c00081b5:	83 c4 10             	add    $0x10,%esp
c00081b8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00081bc:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c00081c0:	7e d1                	jle    c0008193 <simple_shell+0x13e>
c00081c2:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00081c8:	83 ec 08             	sub    $0x8,%esp
c00081cb:	50                   	push   %eax
c00081cc:	68 55 a1 00 c0       	push   $0xc000a155
c00081d1:	e8 2c 05 00 00       	call   c0008702 <Printf>
c00081d6:	83 c4 10             	add    $0x10,%esp
c00081d9:	e9 bc fe ff ff       	jmp    c000809a <simple_shell+0x45>
c00081de:	e8 ca d6 ff ff       	call   c00058ad <fork>
c00081e3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00081e6:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00081ea:	7e 17                	jle    c0008203 <simple_shell+0x1ae>
c00081ec:	83 ec 0c             	sub    $0xc,%esp
c00081ef:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00081f5:	50                   	push   %eax
c00081f6:	e8 4b d6 ff ff       	call   c0005846 <wait>
c00081fb:	83 c4 10             	add    $0x10,%esp
c00081fe:	e9 97 fe ff ff       	jmp    c000809a <simple_shell+0x45>
c0008203:	83 ec 0c             	sub    $0xc,%esp
c0008206:	ff 75 d0             	pushl  -0x30(%ebp)
c0008209:	e8 ec d5 ff ff       	call   c00057fa <close>
c000820e:	83 c4 10             	add    $0x10,%esp
c0008211:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008217:	83 ec 08             	sub    $0x8,%esp
c000821a:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008220:	52                   	push   %edx
c0008221:	50                   	push   %eax
c0008222:	e8 75 d7 ff ff       	call   c000599c <execv>
c0008227:	83 c4 10             	add    $0x10,%esp
c000822a:	eb fe                	jmp    c000822a <simple_shell+0x1d5>

c000822c <test_split_str>:
c000822c:	55                   	push   %ebp
c000822d:	89 e5                	mov    %esp,%ebp
c000822f:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008235:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000823c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008243:	c7 45 ec 5b a1 00 c0 	movl   $0xc000a15b,-0x14(%ebp)
c000824a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000824e:	75 1a                	jne    c000826a <test_split_str+0x3e>
c0008250:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008253:	0f b6 00             	movzbl (%eax),%eax
c0008256:	0f be c0             	movsbl %al,%eax
c0008259:	83 ec 08             	sub    $0x8,%esp
c000825c:	50                   	push   %eax
c000825d:	68 6c a1 00 c0       	push   $0xc000a16c
c0008262:	e8 9b 04 00 00       	call   c0008702 <Printf>
c0008267:	83 c4 10             	add    $0x10,%esp
c000826a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000826d:	0f b6 00             	movzbl (%eax),%eax
c0008270:	3c 20                	cmp    $0x20,%al
c0008272:	75 0a                	jne    c000827e <test_split_str+0x52>
c0008274:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008277:	0f b6 00             	movzbl (%eax),%eax
c000827a:	84 c0                	test   %al,%al
c000827c:	74 13                	je     c0008291 <test_split_str+0x65>
c000827e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008282:	75 0d                	jne    c0008291 <test_split_str+0x65>
c0008284:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008287:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000828a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008291:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008294:	0f b6 00             	movzbl (%eax),%eax
c0008297:	3c 20                	cmp    $0x20,%al
c0008299:	74 0a                	je     c00082a5 <test_split_str+0x79>
c000829b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000829e:	0f b6 00             	movzbl (%eax),%eax
c00082a1:	84 c0                	test   %al,%al
c00082a3:	75 26                	jne    c00082cb <test_split_str+0x9f>
c00082a5:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00082a9:	75 20                	jne    c00082cb <test_split_str+0x9f>
c00082ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00082ae:	8d 50 01             	lea    0x1(%eax),%edx
c00082b1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00082b4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00082b7:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00082be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00082c1:	c6 00 00             	movb   $0x0,(%eax)
c00082c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00082cb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00082cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00082d2:	0f b6 00             	movzbl (%eax),%eax
c00082d5:	84 c0                	test   %al,%al
c00082d7:	0f 85 6d ff ff ff    	jne    c000824a <test_split_str+0x1e>
c00082dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00082e0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00082e3:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00082ea:	83 ec 08             	sub    $0x8,%esp
c00082ed:	ff 75 f4             	pushl  -0xc(%ebp)
c00082f0:	68 75 a1 00 c0       	push   $0xc000a175
c00082f5:	e8 08 04 00 00       	call   c0008702 <Printf>
c00082fa:	83 c4 10             	add    $0x10,%esp
c00082fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008304:	eb 22                	jmp    c0008328 <test_split_str+0xfc>
c0008306:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008309:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008310:	83 ec 04             	sub    $0x4,%esp
c0008313:	50                   	push   %eax
c0008314:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008317:	68 8c a1 00 c0       	push   $0xc000a18c
c000831c:	e8 e1 03 00 00       	call   c0008702 <Printf>
c0008321:	83 c4 10             	add    $0x10,%esp
c0008324:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008328:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000832b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c000832e:	7e d6                	jle    c0008306 <test_split_str+0xda>
c0008330:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008336:	83 ec 08             	sub    $0x8,%esp
c0008339:	68 9b a1 00 c0       	push   $0xc000a19b
c000833e:	50                   	push   %eax
c000833f:	e8 75 12 00 00       	call   c00095b9 <strcmp>
c0008344:	83 c4 10             	add    $0x10,%esp
c0008347:	85 c0                	test   %eax,%eax
c0008349:	75 10                	jne    c000835b <test_split_str+0x12f>
c000834b:	83 ec 0c             	sub    $0xc,%esp
c000834e:	68 a0 a1 00 c0       	push   $0xc000a1a0
c0008353:	e8 aa 03 00 00       	call   c0008702 <Printf>
c0008358:	83 c4 10             	add    $0x10,%esp
c000835b:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008361:	83 ec 08             	sub    $0x8,%esp
c0008364:	50                   	push   %eax
c0008365:	68 ac a1 00 c0       	push   $0xc000a1ac
c000836a:	e8 93 03 00 00       	call   c0008702 <Printf>
c000836f:	83 c4 10             	add    $0x10,%esp
c0008372:	83 ec 0c             	sub    $0xc,%esp
c0008375:	68 ba a1 00 c0       	push   $0xc000a1ba
c000837a:	e8 83 03 00 00       	call   c0008702 <Printf>
c000837f:	83 c4 10             	add    $0x10,%esp
c0008382:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008389:	eb 26                	jmp    c00083b1 <test_split_str+0x185>
c000838b:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008391:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008394:	01 d0                	add    %edx,%eax
c0008396:	0f b6 00             	movzbl (%eax),%eax
c0008399:	0f be c0             	movsbl %al,%eax
c000839c:	83 ec 08             	sub    $0x8,%esp
c000839f:	50                   	push   %eax
c00083a0:	68 c9 a1 00 c0       	push   $0xc000a1c9
c00083a5:	e8 58 03 00 00       	call   c0008702 <Printf>
c00083aa:	83 c4 10             	add    $0x10,%esp
c00083ad:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00083b1:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c00083b5:	7e d4                	jle    c000838b <test_split_str+0x15f>
c00083b7:	c9                   	leave  
c00083b8:	c3                   	ret    

c00083b9 <test_shell>:
c00083b9:	55                   	push   %ebp
c00083ba:	89 e5                	mov    %esp,%ebp
c00083bc:	83 ec 48             	sub    $0x48,%esp
c00083bf:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c00083c6:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c00083cd:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c00083d3:	83 ec 08             	sub    $0x8,%esp
c00083d6:	6a 02                	push   $0x2
c00083d8:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c00083db:	50                   	push   %eax
c00083dc:	e8 56 d3 ff ff       	call   c0005737 <open>
c00083e1:	83 c4 10             	add    $0x10,%esp
c00083e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00083e7:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c00083ee:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c00083f5:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c00083fc:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008403:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c000840a:	83 ec 0c             	sub    $0xc,%esp
c000840d:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008410:	50                   	push   %eax
c0008411:	e8 14 e8 ff ff       	call   c0006c2a <untar>
c0008416:	83 c4 10             	add    $0x10,%esp
c0008419:	e8 8f d4 ff ff       	call   c00058ad <fork>
c000841e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008421:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008425:	7e 25                	jle    c000844c <test_shell+0x93>
c0008427:	83 ec 0c             	sub    $0xc,%esp
c000842a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c000842d:	50                   	push   %eax
c000842e:	e8 13 d4 ff ff       	call   c0005846 <wait>
c0008433:	83 c4 10             	add    $0x10,%esp
c0008436:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008439:	83 ec 08             	sub    $0x8,%esp
c000843c:	50                   	push   %eax
c000843d:	68 d2 a1 00 c0       	push   $0xc000a1d2
c0008442:	e8 bb 02 00 00       	call   c0008702 <Printf>
c0008447:	83 c4 10             	add    $0x10,%esp
c000844a:	eb 23                	jmp    c000846f <test_shell+0xb6>
c000844c:	83 ec 0c             	sub    $0xc,%esp
c000844f:	68 e4 a1 00 c0       	push   $0xc000a1e4
c0008454:	e8 a9 02 00 00       	call   c0008702 <Printf>
c0008459:	83 c4 10             	add    $0x10,%esp
c000845c:	83 ec 0c             	sub    $0xc,%esp
c000845f:	ff 75 f4             	pushl  -0xc(%ebp)
c0008462:	e8 93 d3 ff ff       	call   c00057fa <close>
c0008467:	83 c4 10             	add    $0x10,%esp
c000846a:	e8 e6 fb ff ff       	call   c0008055 <simple_shell>
c000846f:	83 ec 0c             	sub    $0xc,%esp
c0008472:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008475:	50                   	push   %eax
c0008476:	e8 cb d3 ff ff       	call   c0005846 <wait>
c000847b:	83 c4 10             	add    $0x10,%esp
c000847e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008481:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008484:	83 ec 08             	sub    $0x8,%esp
c0008487:	50                   	push   %eax
c0008488:	68 f2 a1 00 c0       	push   $0xc000a1f2
c000848d:	e8 70 02 00 00       	call   c0008702 <Printf>
c0008492:	83 c4 10             	add    $0x10,%esp
c0008495:	eb d8                	jmp    c000846f <test_shell+0xb6>

c0008497 <test_exec>:
c0008497:	55                   	push   %ebp
c0008498:	89 e5                	mov    %esp,%ebp
c000849a:	83 ec 38             	sub    $0x38,%esp
c000849d:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c00084a4:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c00084ab:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c00084b1:	83 ec 08             	sub    $0x8,%esp
c00084b4:	6a 02                	push   $0x2
c00084b6:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00084b9:	50                   	push   %eax
c00084ba:	e8 78 d2 ff ff       	call   c0005737 <open>
c00084bf:	83 c4 10             	add    $0x10,%esp
c00084c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00084c5:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c00084cc:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c00084d3:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c00084da:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c00084e1:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00084e8:	83 ec 0c             	sub    $0xc,%esp
c00084eb:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c00084ee:	50                   	push   %eax
c00084ef:	e8 36 e7 ff ff       	call   c0006c2a <untar>
c00084f4:	83 c4 10             	add    $0x10,%esp
c00084f7:	e8 b1 d3 ff ff       	call   c00058ad <fork>
c00084fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00084ff:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008503:	7e 25                	jle    c000852a <test_exec+0x93>
c0008505:	83 ec 0c             	sub    $0xc,%esp
c0008508:	8d 45 cc             	lea    -0x34(%ebp),%eax
c000850b:	50                   	push   %eax
c000850c:	e8 35 d3 ff ff       	call   c0005846 <wait>
c0008511:	83 c4 10             	add    $0x10,%esp
c0008514:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008517:	83 ec 08             	sub    $0x8,%esp
c000851a:	50                   	push   %eax
c000851b:	68 d2 a1 00 c0       	push   $0xc000a1d2
c0008520:	e8 dd 01 00 00       	call   c0008702 <Printf>
c0008525:	83 c4 10             	add    $0x10,%esp
c0008528:	eb 33                	jmp    c000855d <test_exec+0xc6>
c000852a:	83 ec 0c             	sub    $0xc,%esp
c000852d:	68 e4 a1 00 c0       	push   $0xc000a1e4
c0008532:	e8 cb 01 00 00       	call   c0008702 <Printf>
c0008537:	83 c4 10             	add    $0x10,%esp
c000853a:	83 ec 0c             	sub    $0xc,%esp
c000853d:	6a 00                	push   $0x0
c000853f:	68 0d a2 00 c0       	push   $0xc000a20d
c0008544:	68 13 a2 00 c0       	push   $0xc000a213
c0008549:	68 9b a1 00 c0       	push   $0xc000a19b
c000854e:	68 19 a2 00 c0       	push   $0xc000a219
c0008553:	e8 e9 d5 ff ff       	call   c0005b41 <execl>
c0008558:	83 c4 20             	add    $0x20,%esp
c000855b:	eb fe                	jmp    c000855b <test_exec+0xc4>
c000855d:	c9                   	leave  
c000855e:	c3                   	ret    

c000855f <INIT>:
c000855f:	55                   	push   %ebp
c0008560:	89 e5                	mov    %esp,%ebp
c0008562:	83 ec 08             	sub    $0x8,%esp
c0008565:	e8 4f fe ff ff       	call   c00083b9 <test_shell>
c000856a:	eb fe                	jmp    c000856a <INIT+0xb>

c000856c <TestA>:
c000856c:	55                   	push   %ebp
c000856d:	89 e5                	mov    %esp,%ebp
c000856f:	83 ec 08             	sub    $0x8,%esp
c0008572:	83 ec 0c             	sub    $0xc,%esp
c0008575:	6a 05                	push   $0x5
c0008577:	e8 5e e9 ff ff       	call   c0006eda <disp_int>
c000857c:	83 c4 10             	add    $0x10,%esp
c000857f:	83 ec 0c             	sub    $0xc,%esp
c0008582:	68 74 9d 00 c0       	push   $0xc0009d74
c0008587:	e8 f0 8f ff ff       	call   c000157c <disp_str>
c000858c:	83 c4 10             	add    $0x10,%esp
c000858f:	83 ec 0c             	sub    $0xc,%esp
c0008592:	68 1f a2 00 c0       	push   $0xc000a21f
c0008597:	e8 e0 8f ff ff       	call   c000157c <disp_str>
c000859c:	83 c4 10             	add    $0x10,%esp
c000859f:	eb fe                	jmp    c000859f <TestA+0x33>

c00085a1 <delay>:
c00085a1:	55                   	push   %ebp
c00085a2:	89 e5                	mov    %esp,%ebp
c00085a4:	83 ec 10             	sub    $0x10,%esp
c00085a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00085ae:	eb 2d                	jmp    c00085dd <delay+0x3c>
c00085b0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00085b7:	eb 1a                	jmp    c00085d3 <delay+0x32>
c00085b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00085c0:	eb 04                	jmp    c00085c6 <delay+0x25>
c00085c2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00085c6:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c00085cd:	7e f3                	jle    c00085c2 <delay+0x21>
c00085cf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00085d3:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c00085d7:	7e e0                	jle    c00085b9 <delay+0x18>
c00085d9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00085dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00085e0:	3b 45 08             	cmp    0x8(%ebp),%eax
c00085e3:	7c cb                	jl     c00085b0 <delay+0xf>
c00085e5:	90                   	nop
c00085e6:	c9                   	leave  
c00085e7:	c3                   	ret    

c00085e8 <TestB>:
c00085e8:	55                   	push   %ebp
c00085e9:	89 e5                	mov    %esp,%ebp
c00085eb:	83 ec 08             	sub    $0x8,%esp
c00085ee:	83 ec 0c             	sub    $0xc,%esp
c00085f1:	68 26 a2 00 c0       	push   $0xc000a226
c00085f6:	e8 81 8f ff ff       	call   c000157c <disp_str>
c00085fb:	83 c4 10             	add    $0x10,%esp
c00085fe:	eb fe                	jmp    c00085fe <TestB+0x16>

c0008600 <TestC>:
c0008600:	55                   	push   %ebp
c0008601:	89 e5                	mov    %esp,%ebp
c0008603:	83 ec 18             	sub    $0x18,%esp
c0008606:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000860d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008611:	77 1a                	ja     c000862d <TestC+0x2d>
c0008613:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c000861a:	83 ec 08             	sub    $0x8,%esp
c000861d:	ff 75 f0             	pushl  -0x10(%ebp)
c0008620:	68 29 a2 00 c0       	push   $0xc000a229
c0008625:	e8 d8 00 00 00       	call   c0008702 <Printf>
c000862a:	83 c4 10             	add    $0x10,%esp
c000862d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008631:	eb da                	jmp    c000860d <TestC+0xd>

c0008633 <sys_get_ticks>:
c0008633:	55                   	push   %ebp
c0008634:	89 e5                	mov    %esp,%ebp
c0008636:	a1 e0 0e 01 c0       	mov    0xc0010ee0,%eax
c000863b:	5d                   	pop    %ebp
c000863c:	c3                   	ret    

c000863d <sys_write>:
c000863d:	55                   	push   %ebp
c000863e:	89 e5                	mov    %esp,%ebp
c0008640:	83 ec 18             	sub    $0x18,%esp
c0008643:	8b 45 10             	mov    0x10(%ebp),%eax
c0008646:	8b 40 24             	mov    0x24(%eax),%eax
c0008649:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c000864f:	05 c0 ed 00 c0       	add    $0xc000edc0,%eax
c0008654:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008657:	8b 45 0c             	mov    0xc(%ebp),%eax
c000865a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000865d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008660:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008663:	eb 20                	jmp    c0008685 <sys_write+0x48>
c0008665:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008668:	0f b6 00             	movzbl (%eax),%eax
c000866b:	0f b6 c0             	movzbl %al,%eax
c000866e:	83 ec 08             	sub    $0x8,%esp
c0008671:	50                   	push   %eax
c0008672:	ff 75 ec             	pushl  -0x14(%ebp)
c0008675:	e8 bf c5 ff ff       	call   c0004c39 <out_char>
c000867a:	83 c4 10             	add    $0x10,%esp
c000867d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008681:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008685:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008689:	7f da                	jg     c0008665 <sys_write+0x28>
c000868b:	90                   	nop
c000868c:	c9                   	leave  
c000868d:	c3                   	ret    

c000868e <milli_delay>:
c000868e:	55                   	push   %ebp
c000868f:	89 e5                	mov    %esp,%ebp
c0008691:	83 ec 18             	sub    $0x18,%esp
c0008694:	e8 60 0d 00 00       	call   c00093f9 <get_ticks_ipc>
c0008699:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000869c:	90                   	nop
c000869d:	e8 57 0d 00 00       	call   c00093f9 <get_ticks_ipc>
c00086a2:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00086a5:	89 c1                	mov    %eax,%ecx
c00086a7:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00086ac:	89 c8                	mov    %ecx,%eax
c00086ae:	f7 ea                	imul   %edx
c00086b0:	c1 fa 05             	sar    $0x5,%edx
c00086b3:	89 c8                	mov    %ecx,%eax
c00086b5:	c1 f8 1f             	sar    $0x1f,%eax
c00086b8:	29 c2                	sub    %eax,%edx
c00086ba:	89 d0                	mov    %edx,%eax
c00086bc:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c00086c2:	39 45 08             	cmp    %eax,0x8(%ebp)
c00086c5:	77 d6                	ja     c000869d <milli_delay+0xf>
c00086c7:	90                   	nop
c00086c8:	c9                   	leave  
c00086c9:	c3                   	ret    

c00086ca <TaskSys>:
c00086ca:	55                   	push   %ebp
c00086cb:	89 e5                	mov    %esp,%ebp
c00086cd:	83 ec 78             	sub    $0x78,%esp
c00086d0:	83 ec 0c             	sub    $0xc,%esp
c00086d3:	68 36 a2 00 c0       	push   $0xc000a236
c00086d8:	e8 9f 8e ff ff       	call   c000157c <disp_str>
c00086dd:	83 c4 10             	add    $0x10,%esp
c00086e0:	83 ec 0c             	sub    $0xc,%esp
c00086e3:	68 40 a2 00 c0       	push   $0xc000a240
c00086e8:	e8 8f 8e ff ff       	call   c000157c <disp_str>
c00086ed:	83 c4 10             	add    $0x10,%esp
c00086f0:	83 ec 0c             	sub    $0xc,%esp
c00086f3:	68 4a a2 00 c0       	push   $0xc000a24a
c00086f8:	e8 7f 8e ff ff       	call   c000157c <disp_str>
c00086fd:	83 c4 10             	add    $0x10,%esp
c0008700:	eb fe                	jmp    c0008700 <TaskSys+0x36>

c0008702 <Printf>:
c0008702:	55                   	push   %ebp
c0008703:	89 e5                	mov    %esp,%ebp
c0008705:	81 ec 18 01 00 00    	sub    $0x118,%esp
c000870b:	83 ec 04             	sub    $0x4,%esp
c000870e:	68 00 01 00 00       	push   $0x100
c0008713:	6a 00                	push   $0x0
c0008715:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000871b:	50                   	push   %eax
c000871c:	e8 be 1d 00 00       	call   c000a4df <Memset>
c0008721:	83 c4 10             	add    $0x10,%esp
c0008724:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008727:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000872a:	8b 45 08             	mov    0x8(%ebp),%eax
c000872d:	83 ec 04             	sub    $0x4,%esp
c0008730:	ff 75 f4             	pushl  -0xc(%ebp)
c0008733:	50                   	push   %eax
c0008734:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000873a:	50                   	push   %eax
c000873b:	e8 20 00 00 00       	call   c0008760 <vsprintf>
c0008740:	83 c4 10             	add    $0x10,%esp
c0008743:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008746:	83 ec 04             	sub    $0x4,%esp
c0008749:	ff 75 f0             	pushl  -0x10(%ebp)
c000874c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008752:	50                   	push   %eax
c0008753:	6a 00                	push   $0x0
c0008755:	e8 69 d0 ff ff       	call   c00057c3 <write>
c000875a:	83 c4 10             	add    $0x10,%esp
c000875d:	90                   	nop
c000875e:	c9                   	leave  
c000875f:	c3                   	ret    

c0008760 <vsprintf>:
c0008760:	55                   	push   %ebp
c0008761:	89 e5                	mov    %esp,%ebp
c0008763:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008769:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000876f:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008775:	83 ec 04             	sub    $0x4,%esp
c0008778:	6a 40                	push   $0x40
c000877a:	6a 00                	push   $0x0
c000877c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008782:	50                   	push   %eax
c0008783:	e8 57 1d 00 00       	call   c000a4df <Memset>
c0008788:	83 c4 10             	add    $0x10,%esp
c000878b:	8b 45 10             	mov    0x10(%ebp),%eax
c000878e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008791:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008798:	8b 45 08             	mov    0x8(%ebp),%eax
c000879b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000879e:	e9 53 01 00 00       	jmp    c00088f6 <vsprintf+0x196>
c00087a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00087a6:	0f b6 00             	movzbl (%eax),%eax
c00087a9:	3c 25                	cmp    $0x25,%al
c00087ab:	74 16                	je     c00087c3 <vsprintf+0x63>
c00087ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00087b0:	8d 50 01             	lea    0x1(%eax),%edx
c00087b3:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00087b6:	8b 55 0c             	mov    0xc(%ebp),%edx
c00087b9:	0f b6 12             	movzbl (%edx),%edx
c00087bc:	88 10                	mov    %dl,(%eax)
c00087be:	e9 2f 01 00 00       	jmp    c00088f2 <vsprintf+0x192>
c00087c3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00087c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00087ca:	0f b6 00             	movzbl (%eax),%eax
c00087cd:	0f be c0             	movsbl %al,%eax
c00087d0:	83 f8 64             	cmp    $0x64,%eax
c00087d3:	74 26                	je     c00087fb <vsprintf+0x9b>
c00087d5:	83 f8 64             	cmp    $0x64,%eax
c00087d8:	7f 0e                	jg     c00087e8 <vsprintf+0x88>
c00087da:	83 f8 63             	cmp    $0x63,%eax
c00087dd:	0f 84 f2 00 00 00    	je     c00088d5 <vsprintf+0x175>
c00087e3:	e9 0a 01 00 00       	jmp    c00088f2 <vsprintf+0x192>
c00087e8:	83 f8 73             	cmp    $0x73,%eax
c00087eb:	0f 84 b0 00 00 00    	je     c00088a1 <vsprintf+0x141>
c00087f1:	83 f8 78             	cmp    $0x78,%eax
c00087f4:	74 5d                	je     c0008853 <vsprintf+0xf3>
c00087f6:	e9 f7 00 00 00       	jmp    c00088f2 <vsprintf+0x192>
c00087fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00087fe:	8b 00                	mov    (%eax),%eax
c0008800:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008803:	83 ec 04             	sub    $0x4,%esp
c0008806:	6a 0a                	push   $0xa
c0008808:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c000880e:	50                   	push   %eax
c000880f:	ff 75 e8             	pushl  -0x18(%ebp)
c0008812:	e8 2d 0c 00 00       	call   c0009444 <itoa>
c0008817:	83 c4 10             	add    $0x10,%esp
c000881a:	83 ec 08             	sub    $0x8,%esp
c000881d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008823:	50                   	push   %eax
c0008824:	ff 75 f4             	pushl  -0xc(%ebp)
c0008827:	e8 d2 1c 00 00       	call   c000a4fe <Strcpy>
c000882c:	83 c4 10             	add    $0x10,%esp
c000882f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008833:	83 ec 0c             	sub    $0xc,%esp
c0008836:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000883c:	50                   	push   %eax
c000883d:	e8 d6 1c 00 00       	call   c000a518 <Strlen>
c0008842:	83 c4 10             	add    $0x10,%esp
c0008845:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008848:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000884b:	01 45 f4             	add    %eax,-0xc(%ebp)
c000884e:	e9 9f 00 00 00       	jmp    c00088f2 <vsprintf+0x192>
c0008853:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008856:	8b 00                	mov    (%eax),%eax
c0008858:	83 ec 08             	sub    $0x8,%esp
c000885b:	50                   	push   %eax
c000885c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008862:	50                   	push   %eax
c0008863:	e8 cc e5 ff ff       	call   c0006e34 <atoi>
c0008868:	83 c4 10             	add    $0x10,%esp
c000886b:	83 ec 08             	sub    $0x8,%esp
c000886e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008874:	50                   	push   %eax
c0008875:	ff 75 f4             	pushl  -0xc(%ebp)
c0008878:	e8 81 1c 00 00       	call   c000a4fe <Strcpy>
c000887d:	83 c4 10             	add    $0x10,%esp
c0008880:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008884:	83 ec 0c             	sub    $0xc,%esp
c0008887:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000888d:	50                   	push   %eax
c000888e:	e8 85 1c 00 00       	call   c000a518 <Strlen>
c0008893:	83 c4 10             	add    $0x10,%esp
c0008896:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008899:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000889c:	01 45 f4             	add    %eax,-0xc(%ebp)
c000889f:	eb 51                	jmp    c00088f2 <vsprintf+0x192>
c00088a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00088a4:	8b 00                	mov    (%eax),%eax
c00088a6:	83 ec 08             	sub    $0x8,%esp
c00088a9:	50                   	push   %eax
c00088aa:	ff 75 f4             	pushl  -0xc(%ebp)
c00088ad:	e8 4c 1c 00 00       	call   c000a4fe <Strcpy>
c00088b2:	83 c4 10             	add    $0x10,%esp
c00088b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00088b8:	8b 00                	mov    (%eax),%eax
c00088ba:	83 ec 0c             	sub    $0xc,%esp
c00088bd:	50                   	push   %eax
c00088be:	e8 55 1c 00 00       	call   c000a518 <Strlen>
c00088c3:	83 c4 10             	add    $0x10,%esp
c00088c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00088c9:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00088cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088d0:	01 45 f4             	add    %eax,-0xc(%ebp)
c00088d3:	eb 1d                	jmp    c00088f2 <vsprintf+0x192>
c00088d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00088d8:	0f b6 10             	movzbl (%eax),%edx
c00088db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00088de:	88 10                	mov    %dl,(%eax)
c00088e0:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00088e4:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00088eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088ee:	01 45 f4             	add    %eax,-0xc(%ebp)
c00088f1:	90                   	nop
c00088f2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00088f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00088f9:	0f b6 00             	movzbl (%eax),%eax
c00088fc:	84 c0                	test   %al,%al
c00088fe:	0f 85 9f fe ff ff    	jne    c00087a3 <vsprintf+0x43>
c0008904:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008907:	2b 45 08             	sub    0x8(%ebp),%eax
c000890a:	c9                   	leave  
c000890b:	c3                   	ret    

c000890c <printx>:
c000890c:	55                   	push   %ebp
c000890d:	89 e5                	mov    %esp,%ebp
c000890f:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008915:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008918:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000891b:	8b 45 08             	mov    0x8(%ebp),%eax
c000891e:	83 ec 04             	sub    $0x4,%esp
c0008921:	ff 75 f4             	pushl  -0xc(%ebp)
c0008924:	50                   	push   %eax
c0008925:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000892b:	50                   	push   %eax
c000892c:	e8 2f fe ff ff       	call   c0008760 <vsprintf>
c0008931:	83 c4 10             	add    $0x10,%esp
c0008934:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008937:	83 ec 08             	sub    $0x8,%esp
c000893a:	ff 75 f0             	pushl  -0x10(%ebp)
c000893d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008943:	50                   	push   %eax
c0008944:	e8 cf 9c ff ff       	call   c0002618 <write_debug>
c0008949:	83 c4 10             	add    $0x10,%esp
c000894c:	90                   	nop
c000894d:	c9                   	leave  
c000894e:	c3                   	ret    

c000894f <sys_printx>:
c000894f:	55                   	push   %ebp
c0008950:	89 e5                	mov    %esp,%ebp
c0008952:	83 ec 28             	sub    $0x28,%esp
c0008955:	a1 60 e7 00 c0       	mov    0xc000e760,%eax
c000895a:	85 c0                	test   %eax,%eax
c000895c:	75 23                	jne    c0008981 <sys_printx+0x32>
c000895e:	8b 45 10             	mov    0x10(%ebp),%eax
c0008961:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0008967:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000896a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000896d:	83 ec 08             	sub    $0x8,%esp
c0008970:	ff 75 10             	pushl  0x10(%ebp)
c0008973:	50                   	push   %eax
c0008974:	e8 0e be ff ff       	call   c0004787 <Seg2PhyAddrLDT>
c0008979:	83 c4 10             	add    $0x10,%esp
c000897c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000897f:	eb 19                	jmp    c000899a <sys_printx+0x4b>
c0008981:	a1 60 e7 00 c0       	mov    0xc000e760,%eax
c0008986:	85 c0                	test   %eax,%eax
c0008988:	74 10                	je     c000899a <sys_printx+0x4b>
c000898a:	83 ec 0c             	sub    $0xc,%esp
c000898d:	6a 30                	push   $0x30
c000898f:	e8 b2 bd ff ff       	call   c0004746 <Seg2PhyAddr>
c0008994:	83 c4 10             	add    $0x10,%esp
c0008997:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000899a:	8b 55 08             	mov    0x8(%ebp),%edx
c000899d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00089a0:	01 d0                	add    %edx,%eax
c00089a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00089a5:	8b 45 10             	mov    0x10(%ebp),%eax
c00089a8:	8b 40 24             	mov    0x24(%eax),%eax
c00089ab:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c00089b1:	05 c0 ed 00 c0       	add    $0xc000edc0,%eax
c00089b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00089b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00089bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089c2:	0f b6 00             	movzbl (%eax),%eax
c00089c5:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00089c8:	eb 3a                	jmp    c0008a04 <sys_printx+0xb5>
c00089ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089cd:	0f b6 00             	movzbl (%eax),%eax
c00089d0:	3c 3b                	cmp    $0x3b,%al
c00089d2:	74 0a                	je     c00089de <sys_printx+0x8f>
c00089d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089d7:	0f b6 00             	movzbl (%eax),%eax
c00089da:	3c 3a                	cmp    $0x3a,%al
c00089dc:	75 06                	jne    c00089e4 <sys_printx+0x95>
c00089de:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00089e2:	eb 20                	jmp    c0008a04 <sys_printx+0xb5>
c00089e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089e7:	0f b6 00             	movzbl (%eax),%eax
c00089ea:	0f b6 c0             	movzbl %al,%eax
c00089ed:	83 ec 08             	sub    $0x8,%esp
c00089f0:	50                   	push   %eax
c00089f1:	ff 75 e4             	pushl  -0x1c(%ebp)
c00089f4:	e8 40 c2 ff ff       	call   c0004c39 <out_char>
c00089f9:	83 c4 10             	add    $0x10,%esp
c00089fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008a00:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0008a04:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0008a08:	7f c0                	jg     c00089ca <sys_printx+0x7b>
c0008a0a:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0008a0e:	75 10                	jne    c0008a20 <sys_printx+0xd1>
c0008a10:	a1 60 e7 00 c0       	mov    0xc000e760,%eax
c0008a15:	85 c0                	test   %eax,%eax
c0008a17:	74 13                	je     c0008a2c <sys_printx+0xdd>
c0008a19:	e8 a0 8d ff ff       	call   c00017be <disable_int>
c0008a1e:	eb 0c                	jmp    c0008a2c <sys_printx+0xdd>
c0008a20:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0008a24:	75 06                	jne    c0008a2c <sys_printx+0xdd>
c0008a26:	e8 93 8d ff ff       	call   c00017be <disable_int>
c0008a2b:	90                   	nop
c0008a2c:	90                   	nop
c0008a2d:	c9                   	leave  
c0008a2e:	c3                   	ret    

c0008a2f <spin>:
c0008a2f:	55                   	push   %ebp
c0008a30:	89 e5                	mov    %esp,%ebp
c0008a32:	eb fe                	jmp    c0008a32 <spin+0x3>

c0008a34 <panic>:
c0008a34:	55                   	push   %ebp
c0008a35:	89 e5                	mov    %esp,%ebp
c0008a37:	83 ec 08             	sub    $0x8,%esp
c0008a3a:	83 ec 04             	sub    $0x4,%esp
c0008a3d:	ff 75 08             	pushl  0x8(%ebp)
c0008a40:	6a 3a                	push   $0x3a
c0008a42:	68 54 a2 00 c0       	push   $0xc000a254
c0008a47:	e8 c0 fe ff ff       	call   c000890c <printx>
c0008a4c:	83 c4 10             	add    $0x10,%esp
c0008a4f:	90                   	nop
c0008a50:	c9                   	leave  
c0008a51:	c3                   	ret    

c0008a52 <assertion_failure>:
c0008a52:	55                   	push   %ebp
c0008a53:	89 e5                	mov    %esp,%ebp
c0008a55:	83 ec 08             	sub    $0x8,%esp
c0008a58:	83 ec 08             	sub    $0x8,%esp
c0008a5b:	ff 75 14             	pushl  0x14(%ebp)
c0008a5e:	ff 75 10             	pushl  0x10(%ebp)
c0008a61:	ff 75 0c             	pushl  0xc(%ebp)
c0008a64:	ff 75 08             	pushl  0x8(%ebp)
c0008a67:	6a 3b                	push   $0x3b
c0008a69:	68 5c a2 00 c0       	push   $0xc000a25c
c0008a6e:	e8 99 fe ff ff       	call   c000890c <printx>
c0008a73:	83 c4 20             	add    $0x20,%esp
c0008a76:	83 ec 0c             	sub    $0xc,%esp
c0008a79:	68 8f a2 00 c0       	push   $0xc000a28f
c0008a7e:	e8 ac ff ff ff       	call   c0008a2f <spin>
c0008a83:	83 c4 10             	add    $0x10,%esp
c0008a86:	90                   	nop
c0008a87:	c9                   	leave  
c0008a88:	c3                   	ret    

c0008a89 <dead_lock>:
c0008a89:	55                   	push   %ebp
c0008a8a:	89 e5                	mov    %esp,%ebp
c0008a8c:	b8 00 00 00 00       	mov    $0x0,%eax
c0008a91:	5d                   	pop    %ebp
c0008a92:	c3                   	ret    

c0008a93 <sys_send_msg>:
c0008a93:	55                   	push   %ebp
c0008a94:	89 e5                	mov    %esp,%ebp
c0008a96:	83 ec 48             	sub    $0x48,%esp
c0008a99:	83 ec 0c             	sub    $0xc,%esp
c0008a9c:	ff 75 0c             	pushl  0xc(%ebp)
c0008a9f:	e8 fa bb ff ff       	call   c000469e <pid2proc>
c0008aa4:	83 c4 10             	add    $0x10,%esp
c0008aa7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008aaa:	83 ec 0c             	sub    $0xc,%esp
c0008aad:	ff 75 10             	pushl  0x10(%ebp)
c0008ab0:	e8 05 bc ff ff       	call   c00046ba <proc2pid>
c0008ab5:	83 c4 10             	add    $0x10,%esp
c0008ab8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008abb:	8b 45 10             	mov    0x10(%ebp),%eax
c0008abe:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0008ac4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008ac7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008aca:	83 ec 08             	sub    $0x8,%esp
c0008acd:	ff 75 10             	pushl  0x10(%ebp)
c0008ad0:	50                   	push   %eax
c0008ad1:	e8 b1 bc ff ff       	call   c0004787 <Seg2PhyAddrLDT>
c0008ad6:	83 c4 10             	add    $0x10,%esp
c0008ad9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008adc:	8b 55 08             	mov    0x8(%ebp),%edx
c0008adf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008ae2:	01 d0                	add    %edx,%eax
c0008ae4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008ae7:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0008aee:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0008af1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008af4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008af7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008afa:	89 10                	mov    %edx,(%eax)
c0008afc:	83 ec 08             	sub    $0x8,%esp
c0008aff:	ff 75 0c             	pushl  0xc(%ebp)
c0008b02:	ff 75 e8             	pushl  -0x18(%ebp)
c0008b05:	e8 7f ff ff ff       	call   c0008a89 <dead_lock>
c0008b0a:	83 c4 10             	add    $0x10,%esp
c0008b0d:	83 f8 01             	cmp    $0x1,%eax
c0008b10:	75 10                	jne    c0008b22 <sys_send_msg+0x8f>
c0008b12:	83 ec 0c             	sub    $0xc,%esp
c0008b15:	68 9b a2 00 c0       	push   $0xc000a29b
c0008b1a:	e8 15 ff ff ff       	call   c0008a34 <panic>
c0008b1f:	83 c4 10             	add    $0x10,%esp
c0008b22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b25:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0008b2c:	3c 02                	cmp    $0x2,%al
c0008b2e:	0f 85 9f 01 00 00    	jne    c0008cd3 <sys_send_msg+0x240>
c0008b34:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b37:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0008b3d:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0008b40:	74 12                	je     c0008b54 <sys_send_msg+0xc1>
c0008b42:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b45:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0008b4b:	83 f8 0e             	cmp    $0xe,%eax
c0008b4e:	0f 85 7f 01 00 00    	jne    c0008cd3 <sys_send_msg+0x240>
c0008b54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b57:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0008b5d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008b60:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008b63:	83 ec 08             	sub    $0x8,%esp
c0008b66:	ff 75 ec             	pushl  -0x14(%ebp)
c0008b69:	50                   	push   %eax
c0008b6a:	e8 18 bc ff ff       	call   c0004787 <Seg2PhyAddrLDT>
c0008b6f:	83 c4 10             	add    $0x10,%esp
c0008b72:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008b75:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b78:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0008b7e:	89 c2                	mov    %eax,%edx
c0008b80:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008b83:	01 d0                	add    %edx,%eax
c0008b85:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008b88:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0008b8b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008b8e:	83 ec 04             	sub    $0x4,%esp
c0008b91:	ff 75 d8             	pushl  -0x28(%ebp)
c0008b94:	52                   	push   %edx
c0008b95:	50                   	push   %eax
c0008b96:	e8 16 19 00 00       	call   c000a4b1 <Memcpy>
c0008b9b:	83 c4 10             	add    $0x10,%esp
c0008b9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ba1:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c0008ba8:	00 00 00 
c0008bab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008bae:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c0008bb5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008bb8:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c0008bbf:	00 00 00 
c0008bc2:	83 ec 0c             	sub    $0xc,%esp
c0008bc5:	ff 75 ec             	pushl  -0x14(%ebp)
c0008bc8:	e8 f5 07 00 00       	call   c00093c2 <unblock>
c0008bcd:	83 c4 10             	add    $0x10,%esp
c0008bd0:	8b 45 10             	mov    0x10(%ebp),%eax
c0008bd3:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0008bd9:	85 c0                	test   %eax,%eax
c0008bdb:	74 1c                	je     c0008bf9 <sys_send_msg+0x166>
c0008bdd:	68 6e 05 00 00       	push   $0x56e
c0008be2:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008be7:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008bec:	68 b6 a2 00 c0       	push   $0xc000a2b6
c0008bf1:	e8 5c fe ff ff       	call   c0008a52 <assertion_failure>
c0008bf6:	83 c4 10             	add    $0x10,%esp
c0008bf9:	8b 45 10             	mov    0x10(%ebp),%eax
c0008bfc:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0008c03:	84 c0                	test   %al,%al
c0008c05:	74 1c                	je     c0008c23 <sys_send_msg+0x190>
c0008c07:	68 6f 05 00 00       	push   $0x56f
c0008c0c:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c11:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c16:	68 c9 a2 00 c0       	push   $0xc000a2c9
c0008c1b:	e8 32 fe ff ff       	call   c0008a52 <assertion_failure>
c0008c20:	83 c4 10             	add    $0x10,%esp
c0008c23:	8b 45 10             	mov    0x10(%ebp),%eax
c0008c26:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0008c2c:	83 f8 1d             	cmp    $0x1d,%eax
c0008c2f:	74 1c                	je     c0008c4d <sys_send_msg+0x1ba>
c0008c31:	68 70 05 00 00       	push   $0x570
c0008c36:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c3b:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c40:	68 dd a2 00 c0       	push   $0xc000a2dd
c0008c45:	e8 08 fe ff ff       	call   c0008a52 <assertion_failure>
c0008c4a:	83 c4 10             	add    $0x10,%esp
c0008c4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c50:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0008c56:	85 c0                	test   %eax,%eax
c0008c58:	74 1c                	je     c0008c76 <sys_send_msg+0x1e3>
c0008c5a:	68 72 05 00 00       	push   $0x572
c0008c5f:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c64:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c69:	68 fa a2 00 c0       	push   $0xc000a2fa
c0008c6e:	e8 df fd ff ff       	call   c0008a52 <assertion_failure>
c0008c73:	83 c4 10             	add    $0x10,%esp
c0008c76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c79:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0008c80:	84 c0                	test   %al,%al
c0008c82:	74 1c                	je     c0008ca0 <sys_send_msg+0x20d>
c0008c84:	68 73 05 00 00       	push   $0x573
c0008c89:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c8e:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008c93:	68 0f a3 00 c0       	push   $0xc000a30f
c0008c98:	e8 b5 fd ff ff       	call   c0008a52 <assertion_failure>
c0008c9d:	83 c4 10             	add    $0x10,%esp
c0008ca0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ca3:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0008ca9:	83 f8 1d             	cmp    $0x1d,%eax
c0008cac:	0f 84 45 01 00 00    	je     c0008df7 <sys_send_msg+0x364>
c0008cb2:	68 74 05 00 00       	push   $0x574
c0008cb7:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008cbc:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008cc1:	68 28 a3 00 c0       	push   $0xc000a328
c0008cc6:	e8 87 fd ff ff       	call   c0008a52 <assertion_failure>
c0008ccb:	83 c4 10             	add    $0x10,%esp
c0008cce:	e9 24 01 00 00       	jmp    c0008df7 <sys_send_msg+0x364>
c0008cd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008cda:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008cdd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0008ce0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ce3:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0008ce9:	85 c0                	test   %eax,%eax
c0008ceb:	75 1b                	jne    c0008d08 <sys_send_msg+0x275>
c0008ced:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008cf0:	8b 55 10             	mov    0x10(%ebp),%edx
c0008cf3:	89 90 54 01 00 00    	mov    %edx,0x154(%eax)
c0008cf9:	8b 45 10             	mov    0x10(%ebp),%eax
c0008cfc:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0008d03:	00 00 00 
c0008d06:	eb 3f                	jmp    c0008d47 <sys_send_msg+0x2b4>
c0008d08:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d0b:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0008d11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d14:	eb 12                	jmp    c0008d28 <sys_send_msg+0x295>
c0008d16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008d19:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008d1f:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c0008d25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d28:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008d2c:	75 e8                	jne    c0008d16 <sys_send_msg+0x283>
c0008d2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d31:	8b 55 10             	mov    0x10(%ebp),%edx
c0008d34:	89 90 58 01 00 00    	mov    %edx,0x158(%eax)
c0008d3a:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d3d:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0008d44:	00 00 00 
c0008d47:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d4a:	8b 55 08             	mov    0x8(%ebp),%edx
c0008d4d:	89 90 48 01 00 00    	mov    %edx,0x148(%eax)
c0008d53:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d56:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008d59:	89 90 4c 01 00 00    	mov    %edx,0x14c(%eax)
c0008d5f:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d62:	c6 80 44 01 00 00 01 	movb   $0x1,0x144(%eax)
c0008d69:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d6c:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0008d73:	3c 01                	cmp    $0x1,%al
c0008d75:	74 1c                	je     c0008d93 <sys_send_msg+0x300>
c0008d77:	68 95 05 00 00       	push   $0x595
c0008d7c:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008d81:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008d86:	68 4c a3 00 c0       	push   $0xc000a34c
c0008d8b:	e8 c2 fc ff ff       	call   c0008a52 <assertion_failure>
c0008d90:	83 c4 10             	add    $0x10,%esp
c0008d93:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d96:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0008d9c:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0008d9f:	74 1c                	je     c0008dbd <sys_send_msg+0x32a>
c0008da1:	68 96 05 00 00       	push   $0x596
c0008da6:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008dab:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008db0:	68 68 a3 00 c0       	push   $0xc000a368
c0008db5:	e8 98 fc ff ff       	call   c0008a52 <assertion_failure>
c0008dba:	83 c4 10             	add    $0x10,%esp
c0008dbd:	8b 45 10             	mov    0x10(%ebp),%eax
c0008dc0:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0008dc6:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008dc9:	74 1c                	je     c0008de7 <sys_send_msg+0x354>
c0008dcb:	68 97 05 00 00       	push   $0x597
c0008dd0:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008dd5:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0008dda:	68 8a a3 00 c0       	push   $0xc000a38a
c0008ddf:	e8 6e fc ff ff       	call   c0008a52 <assertion_failure>
c0008de4:	83 c4 10             	add    $0x10,%esp
c0008de7:	83 ec 0c             	sub    $0xc,%esp
c0008dea:	ff 75 10             	pushl  0x10(%ebp)
c0008ded:	e8 be 05 00 00       	call   c00093b0 <block>
c0008df2:	83 c4 10             	add    $0x10,%esp
c0008df5:	eb 01                	jmp    c0008df8 <sys_send_msg+0x365>
c0008df7:	90                   	nop
c0008df8:	b8 00 00 00 00       	mov    $0x0,%eax
c0008dfd:	c9                   	leave  
c0008dfe:	c3                   	ret    

c0008dff <sys_receive_msg>:
c0008dff:	55                   	push   %ebp
c0008e00:	89 e5                	mov    %esp,%ebp
c0008e02:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0008e08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008e0f:	83 ec 0c             	sub    $0xc,%esp
c0008e12:	ff 75 0c             	pushl  0xc(%ebp)
c0008e15:	e8 84 b8 ff ff       	call   c000469e <pid2proc>
c0008e1a:	83 c4 10             	add    $0x10,%esp
c0008e1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008e20:	83 ec 0c             	sub    $0xc,%esp
c0008e23:	ff 75 10             	pushl  0x10(%ebp)
c0008e26:	e8 8f b8 ff ff       	call   c00046ba <proc2pid>
c0008e2b:	83 c4 10             	add    $0x10,%esp
c0008e2e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008e31:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008e38:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e3b:	8b 80 5c 01 00 00    	mov    0x15c(%eax),%eax
c0008e41:	85 c0                	test   %eax,%eax
c0008e43:	0f 84 9a 00 00 00    	je     c0008ee3 <sys_receive_msg+0xe4>
c0008e49:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0008e4d:	74 0d                	je     c0008e5c <sys_receive_msg+0x5d>
c0008e4f:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0008e56:	0f 85 87 00 00 00    	jne    c0008ee3 <sys_receive_msg+0xe4>
c0008e5c:	83 ec 04             	sub    $0x4,%esp
c0008e5f:	6a 6c                	push   $0x6c
c0008e61:	6a 00                	push   $0x0
c0008e63:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0008e69:	50                   	push   %eax
c0008e6a:	e8 70 16 00 00       	call   c000a4df <Memset>
c0008e6f:	83 c4 10             	add    $0x10,%esp
c0008e72:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
c0008e79:	02 00 00 
c0008e7c:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
c0008e83:	83 ec 08             	sub    $0x8,%esp
c0008e86:	ff 75 08             	pushl  0x8(%ebp)
c0008e89:	ff 75 e0             	pushl  -0x20(%ebp)
c0008e8c:	e8 4d b9 ff ff       	call   c00047de <v2l>
c0008e91:	83 c4 10             	add    $0x10,%esp
c0008e94:	89 c2                	mov    %eax,%edx
c0008e96:	83 ec 04             	sub    $0x4,%esp
c0008e99:	6a 6c                	push   $0x6c
c0008e9b:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0008ea1:	50                   	push   %eax
c0008ea2:	52                   	push   %edx
c0008ea3:	e8 09 16 00 00       	call   c000a4b1 <Memcpy>
c0008ea8:	83 c4 10             	add    $0x10,%esp
c0008eab:	8b 45 10             	mov    0x10(%ebp),%eax
c0008eae:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0008eb5:	00 00 00 
c0008eb8:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ebb:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c0008ec2:	00 00 00 
c0008ec5:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ec8:	c7 80 4c 01 00 00 1d 	movl   $0x1d,0x14c(%eax)
c0008ecf:	00 00 00 
c0008ed2:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ed5:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c0008edc:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008ee3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008ee7:	0f 84 d3 03 00 00    	je     c00092c0 <sys_receive_msg+0x4c1>
c0008eed:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0008ef1:	75 26                	jne    c0008f19 <sys_receive_msg+0x11a>
c0008ef3:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ef6:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0008efc:	85 c0                	test   %eax,%eax
c0008efe:	0f 84 87 00 00 00    	je     c0008f8b <sys_receive_msg+0x18c>
c0008f04:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f07:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0008f0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f10:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0008f17:	eb 72                	jmp    c0008f8b <sys_receive_msg+0x18c>
c0008f19:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0008f1d:	78 6c                	js     c0008f8b <sys_receive_msg+0x18c>
c0008f1f:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c0008f23:	7f 66                	jg     c0008f8b <sys_receive_msg+0x18c>
c0008f25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f28:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0008f2f:	3c 01                	cmp    $0x1,%al
c0008f31:	75 58                	jne    c0008f8b <sys_receive_msg+0x18c>
c0008f33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f36:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0008f3c:	83 f8 0e             	cmp    $0xe,%eax
c0008f3f:	74 0e                	je     c0008f4f <sys_receive_msg+0x150>
c0008f41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008f44:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c0008f4a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0008f4d:	75 3c                	jne    c0008f8b <sys_receive_msg+0x18c>
c0008f4f:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f52:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0008f58:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f5b:	eb 28                	jmp    c0008f85 <sys_receive_msg+0x186>
c0008f5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f60:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f66:	8b 50 18             	mov    0x18(%eax),%edx
c0008f69:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f6c:	39 c2                	cmp    %eax,%edx
c0008f6e:	75 09                	jne    c0008f79 <sys_receive_msg+0x17a>
c0008f70:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0008f77:	eb 12                	jmp    c0008f8b <sys_receive_msg+0x18c>
c0008f79:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f7c:	8b 80 58 01 00 00    	mov    0x158(%eax),%eax
c0008f82:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f85:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008f89:	75 d2                	jne    c0008f5d <sys_receive_msg+0x15e>
c0008f8b:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0008f8f:	0f 85 88 02 00 00    	jne    c000921d <sys_receive_msg+0x41e>
c0008f95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f98:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008f9b:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f9e:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0008fa4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008fa7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008faa:	83 ec 08             	sub    $0x8,%esp
c0008fad:	ff 75 10             	pushl  0x10(%ebp)
c0008fb0:	50                   	push   %eax
c0008fb1:	e8 d1 b7 ff ff       	call   c0004787 <Seg2PhyAddrLDT>
c0008fb6:	83 c4 10             	add    $0x10,%esp
c0008fb9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008fbc:	8b 55 08             	mov    0x8(%ebp),%edx
c0008fbf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008fc2:	01 d0                	add    %edx,%eax
c0008fc4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008fc7:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
c0008fce:	8b 45 10             	mov    0x10(%ebp),%eax
c0008fd1:	8b 80 74 01 00 00    	mov    0x174(%eax),%eax
c0008fd7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008fda:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008fdd:	83 ec 08             	sub    $0x8,%esp
c0008fe0:	ff 75 dc             	pushl  -0x24(%ebp)
c0008fe3:	50                   	push   %eax
c0008fe4:	e8 9e b7 ff ff       	call   c0004787 <Seg2PhyAddrLDT>
c0008fe9:	83 c4 10             	add    $0x10,%esp
c0008fec:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0008fef:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0008ff2:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0008ff8:	89 c2                	mov    %eax,%edx
c0008ffa:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008ffd:	01 d0                	add    %edx,%eax
c0008fff:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0009002:	83 ec 04             	sub    $0x4,%esp
c0009005:	ff 75 cc             	pushl  -0x34(%ebp)
c0009008:	ff 75 c0             	pushl  -0x40(%ebp)
c000900b:	ff 75 d0             	pushl  -0x30(%ebp)
c000900e:	e8 9e 14 00 00       	call   c000a4b1 <Memcpy>
c0009013:	83 c4 10             	add    $0x10,%esp
c0009016:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009019:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000901c:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
c0009020:	75 27                	jne    c0009049 <sys_receive_msg+0x24a>
c0009022:	8b 45 08             	mov    0x8(%ebp),%eax
c0009025:	8b 40 68             	mov    0x68(%eax),%eax
c0009028:	83 f8 06             	cmp    $0x6,%eax
c000902b:	74 1c                	je     c0009049 <sys_receive_msg+0x24a>
c000902d:	68 24 06 00 00       	push   $0x624
c0009032:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009037:	68 a6 a2 00 c0       	push   $0xc000a2a6
c000903c:	68 9f a3 00 c0       	push   $0xc000a39f
c0009041:	e8 0c fa ff ff       	call   c0008a52 <assertion_failure>
c0009046:	83 c4 10             	add    $0x10,%esp
c0009049:	8b 45 10             	mov    0x10(%ebp),%eax
c000904c:	8b 80 54 01 00 00    	mov    0x154(%eax),%eax
c0009052:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009055:	75 21                	jne    c0009078 <sys_receive_msg+0x279>
c0009057:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000905a:	8b 90 58 01 00 00    	mov    0x158(%eax),%edx
c0009060:	8b 45 10             	mov    0x10(%ebp),%eax
c0009063:	89 90 54 01 00 00    	mov    %edx,0x154(%eax)
c0009069:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000906c:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0009073:	00 00 00 
c0009076:	eb 1f                	jmp    c0009097 <sys_receive_msg+0x298>
c0009078:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000907b:	8b 90 58 01 00 00    	mov    0x158(%eax),%edx
c0009081:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009084:	89 90 58 01 00 00    	mov    %edx,0x158(%eax)
c000908a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000908d:	c7 80 58 01 00 00 00 	movl   $0x0,0x158(%eax)
c0009094:	00 00 00 
c0009097:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000909a:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c00090a1:	00 00 00 
c00090a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00090a7:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c00090ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00090b1:	c7 80 4c 01 00 00 1d 	movl   $0x1d,0x14c(%eax)
c00090b8:	00 00 00 
c00090bb:	8b 45 10             	mov    0x10(%ebp),%eax
c00090be:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c00090c5:	00 00 00 
c00090c8:	8b 45 10             	mov    0x10(%ebp),%eax
c00090cb:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c00090d2:	00 00 00 
c00090d5:	8b 45 10             	mov    0x10(%ebp),%eax
c00090d8:	c7 80 4c 01 00 00 1d 	movl   $0x1d,0x14c(%eax)
c00090df:	00 00 00 
c00090e2:	83 ec 0c             	sub    $0xc,%esp
c00090e5:	ff 75 dc             	pushl  -0x24(%ebp)
c00090e8:	e8 d5 02 00 00       	call   c00093c2 <unblock>
c00090ed:	83 c4 10             	add    $0x10,%esp
c00090f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00090f3:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c00090f9:	85 c0                	test   %eax,%eax
c00090fb:	74 1c                	je     c0009119 <sys_receive_msg+0x31a>
c00090fd:	68 45 06 00 00       	push   $0x645
c0009102:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009107:	68 a6 a2 00 c0       	push   $0xc000a2a6
c000910c:	68 b1 a3 00 c0       	push   $0xc000a3b1
c0009111:	e8 3c f9 ff ff       	call   c0008a52 <assertion_failure>
c0009116:	83 c4 10             	add    $0x10,%esp
c0009119:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000911c:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0009123:	84 c0                	test   %al,%al
c0009125:	74 1c                	je     c0009143 <sys_receive_msg+0x344>
c0009127:	68 46 06 00 00       	push   $0x646
c000912c:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009131:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009136:	68 c9 a3 00 c0       	push   $0xc000a3c9
c000913b:	e8 12 f9 ff ff       	call   c0008a52 <assertion_failure>
c0009140:	83 c4 10             	add    $0x10,%esp
c0009143:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009146:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c000914c:	83 f8 1d             	cmp    $0x1d,%eax
c000914f:	74 1c                	je     c000916d <sys_receive_msg+0x36e>
c0009151:	68 47 06 00 00       	push   $0x647
c0009156:	68 a6 a2 00 c0       	push   $0xc000a2a6
c000915b:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009160:	68 e4 a3 00 c0       	push   $0xc000a3e4
c0009165:	e8 e8 f8 ff ff       	call   c0008a52 <assertion_failure>
c000916a:	83 c4 10             	add    $0x10,%esp
c000916d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009170:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0009176:	85 c0                	test   %eax,%eax
c0009178:	74 1c                	je     c0009196 <sys_receive_msg+0x397>
c000917a:	68 49 06 00 00       	push   $0x649
c000917f:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009184:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009189:	68 fa a2 00 c0       	push   $0xc000a2fa
c000918e:	e8 bf f8 ff ff       	call   c0008a52 <assertion_failure>
c0009193:	83 c4 10             	add    $0x10,%esp
c0009196:	8b 45 10             	mov    0x10(%ebp),%eax
c0009199:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c00091a0:	84 c0                	test   %al,%al
c00091a2:	74 1c                	je     c00091c0 <sys_receive_msg+0x3c1>
c00091a4:	68 4a 06 00 00       	push   $0x64a
c00091a9:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00091ae:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00091b3:	68 0f a3 00 c0       	push   $0xc000a30f
c00091b8:	e8 95 f8 ff ff       	call   c0008a52 <assertion_failure>
c00091bd:	83 c4 10             	add    $0x10,%esp
c00091c0:	8b 45 10             	mov    0x10(%ebp),%eax
c00091c3:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c00091c9:	83 f8 1d             	cmp    $0x1d,%eax
c00091cc:	74 1c                	je     c00091ea <sys_receive_msg+0x3eb>
c00091ce:	68 4b 06 00 00       	push   $0x64b
c00091d3:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00091d8:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00091dd:	68 28 a3 00 c0       	push   $0xc000a328
c00091e2:	e8 6b f8 ff ff       	call   c0008a52 <assertion_failure>
c00091e7:	83 c4 10             	add    $0x10,%esp
c00091ea:	8b 45 10             	mov    0x10(%ebp),%eax
c00091ed:	8b 80 4c 01 00 00    	mov    0x14c(%eax),%eax
c00091f3:	83 f8 1d             	cmp    $0x1d,%eax
c00091f6:	0f 84 bd 00 00 00    	je     c00092b9 <sys_receive_msg+0x4ba>
c00091fc:	68 4c 06 00 00       	push   $0x64c
c0009201:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009206:	68 a6 a2 00 c0       	push   $0xc000a2a6
c000920b:	68 08 a4 00 c0       	push   $0xc000a408
c0009210:	e8 3d f8 ff ff       	call   c0008a52 <assertion_failure>
c0009215:	83 c4 10             	add    $0x10,%esp
c0009218:	e9 9c 00 00 00       	jmp    c00092b9 <sys_receive_msg+0x4ba>
c000921d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009220:	c6 80 44 01 00 00 02 	movb   $0x2,0x144(%eax)
c0009227:	8b 45 10             	mov    0x10(%ebp),%eax
c000922a:	8b 55 08             	mov    0x8(%ebp),%edx
c000922d:	89 90 48 01 00 00    	mov    %edx,0x148(%eax)
c0009233:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009237:	75 0f                	jne    c0009248 <sys_receive_msg+0x449>
c0009239:	8b 45 10             	mov    0x10(%ebp),%eax
c000923c:	c7 80 50 01 00 00 0e 	movl   $0xe,0x150(%eax)
c0009243:	00 00 00 
c0009246:	eb 0c                	jmp    c0009254 <sys_receive_msg+0x455>
c0009248:	8b 45 10             	mov    0x10(%ebp),%eax
c000924b:	8b 55 0c             	mov    0xc(%ebp),%edx
c000924e:	89 90 50 01 00 00    	mov    %edx,0x150(%eax)
c0009254:	8b 0d 5c e7 00 c0    	mov    0xc000e75c,%ecx
c000925a:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000925f:	89 c8                	mov    %ecx,%eax
c0009261:	f7 ea                	imul   %edx
c0009263:	c1 fa 06             	sar    $0x6,%edx
c0009266:	89 c8                	mov    %ecx,%eax
c0009268:	c1 f8 1f             	sar    $0x1f,%eax
c000926b:	29 c2                	sub    %eax,%edx
c000926d:	89 d0                	mov    %edx,%eax
c000926f:	8d 50 01             	lea    0x1(%eax),%edx
c0009272:	89 d0                	mov    %edx,%eax
c0009274:	c1 e0 02             	shl    $0x2,%eax
c0009277:	01 d0                	add    %edx,%eax
c0009279:	c1 e0 05             	shl    $0x5,%eax
c000927c:	a3 5c e7 00 c0       	mov    %eax,0xc000e75c
c0009281:	8b 45 10             	mov    0x10(%ebp),%eax
c0009284:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c000928b:	3c 02                	cmp    $0x2,%al
c000928d:	74 1c                	je     c00092ab <sys_receive_msg+0x4ac>
c000928f:	68 81 06 00 00       	push   $0x681
c0009294:	68 a6 a2 00 c0       	push   $0xc000a2a6
c0009299:	68 a6 a2 00 c0       	push   $0xc000a2a6
c000929e:	68 27 a4 00 c0       	push   $0xc000a427
c00092a3:	e8 aa f7 ff ff       	call   c0008a52 <assertion_failure>
c00092a8:	83 c4 10             	add    $0x10,%esp
c00092ab:	83 ec 0c             	sub    $0xc,%esp
c00092ae:	ff 75 10             	pushl  0x10(%ebp)
c00092b1:	e8 fa 00 00 00       	call   c00093b0 <block>
c00092b6:	83 c4 10             	add    $0x10,%esp
c00092b9:	b8 00 00 00 00       	mov    $0x0,%eax
c00092be:	eb 02                	jmp    c00092c2 <sys_receive_msg+0x4c3>
c00092c0:	90                   	nop
c00092c1:	90                   	nop
c00092c2:	c9                   	leave  
c00092c3:	c3                   	ret    

c00092c4 <disp_str_colour_debug>:
c00092c4:	55                   	push   %ebp
c00092c5:	89 e5                	mov    %esp,%ebp
c00092c7:	90                   	nop
c00092c8:	5d                   	pop    %ebp
c00092c9:	c3                   	ret    

c00092ca <send_rec>:
c00092ca:	55                   	push   %ebp
c00092cb:	89 e5                	mov    %esp,%ebp
c00092cd:	83 ec 18             	sub    $0x18,%esp
c00092d0:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c00092d4:	74 28                	je     c00092fe <send_rec+0x34>
c00092d6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c00092da:	74 22                	je     c00092fe <send_rec+0x34>
c00092dc:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c00092e0:	74 1c                	je     c00092fe <send_rec+0x34>
c00092e2:	68 aa 06 00 00       	push   $0x6aa
c00092e7:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00092ec:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00092f1:	68 48 a4 00 c0       	push   $0xc000a448
c00092f6:	e8 57 f7 ff ff       	call   c0008a52 <assertion_failure>
c00092fb:	83 c4 10             	add    $0x10,%esp
c00092fe:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009302:	75 12                	jne    c0009316 <send_rec+0x4c>
c0009304:	83 ec 04             	sub    $0x4,%esp
c0009307:	6a 6c                	push   $0x6c
c0009309:	6a 00                	push   $0x0
c000930b:	ff 75 0c             	pushl  0xc(%ebp)
c000930e:	e8 cc 11 00 00       	call   c000a4df <Memset>
c0009313:	83 c4 10             	add    $0x10,%esp
c0009316:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000931a:	74 22                	je     c000933e <send_rec+0x74>
c000931c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009320:	74 32                	je     c0009354 <send_rec+0x8a>
c0009322:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009326:	75 6e                	jne    c0009396 <send_rec+0xcc>
c0009328:	83 ec 08             	sub    $0x8,%esp
c000932b:	ff 75 10             	pushl  0x10(%ebp)
c000932e:	ff 75 0c             	pushl  0xc(%ebp)
c0009331:	e8 02 93 ff ff       	call   c0002638 <send_msg>
c0009336:	83 c4 10             	add    $0x10,%esp
c0009339:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000933c:	eb 6b                	jmp    c00093a9 <send_rec+0xdf>
c000933e:	83 ec 08             	sub    $0x8,%esp
c0009341:	ff 75 10             	pushl  0x10(%ebp)
c0009344:	ff 75 0c             	pushl  0xc(%ebp)
c0009347:	e8 12 93 ff ff       	call   c000265e <receive_msg>
c000934c:	83 c4 10             	add    $0x10,%esp
c000934f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009352:	eb 55                	jmp    c00093a9 <send_rec+0xdf>
c0009354:	83 ec 08             	sub    $0x8,%esp
c0009357:	ff 75 10             	pushl  0x10(%ebp)
c000935a:	ff 75 0c             	pushl  0xc(%ebp)
c000935d:	e8 d6 92 ff ff       	call   c0002638 <send_msg>
c0009362:	83 c4 10             	add    $0x10,%esp
c0009365:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009368:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000936c:	75 3a                	jne    c00093a8 <send_rec+0xde>
c000936e:	83 ec 04             	sub    $0x4,%esp
c0009371:	6a 6c                	push   $0x6c
c0009373:	6a 00                	push   $0x0
c0009375:	ff 75 0c             	pushl  0xc(%ebp)
c0009378:	e8 62 11 00 00       	call   c000a4df <Memset>
c000937d:	83 c4 10             	add    $0x10,%esp
c0009380:	83 ec 08             	sub    $0x8,%esp
c0009383:	ff 75 10             	pushl  0x10(%ebp)
c0009386:	ff 75 0c             	pushl  0xc(%ebp)
c0009389:	e8 d0 92 ff ff       	call   c000265e <receive_msg>
c000938e:	83 c4 10             	add    $0x10,%esp
c0009391:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009394:	eb 12                	jmp    c00093a8 <send_rec+0xde>
c0009396:	83 ec 0c             	sub    $0xc,%esp
c0009399:	68 84 a4 00 c0       	push   $0xc000a484
c000939e:	e8 91 f6 ff ff       	call   c0008a34 <panic>
c00093a3:	83 c4 10             	add    $0x10,%esp
c00093a6:	eb 01                	jmp    c00093a9 <send_rec+0xdf>
c00093a8:	90                   	nop
c00093a9:	b8 00 00 00 00       	mov    $0x0,%eax
c00093ae:	c9                   	leave  
c00093af:	c3                   	ret    

c00093b0 <block>:
c00093b0:	55                   	push   %ebp
c00093b1:	89 e5                	mov    %esp,%ebp
c00093b3:	83 ec 08             	sub    $0x8,%esp
c00093b6:	e8 f9 b1 ff ff       	call   c00045b4 <schedule_process>
c00093bb:	b8 00 00 00 00       	mov    $0x0,%eax
c00093c0:	c9                   	leave  
c00093c1:	c3                   	ret    

c00093c2 <unblock>:
c00093c2:	55                   	push   %ebp
c00093c3:	89 e5                	mov    %esp,%ebp
c00093c5:	83 ec 08             	sub    $0x8,%esp
c00093c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00093cb:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c00093d2:	84 c0                	test   %al,%al
c00093d4:	74 1c                	je     c00093f2 <unblock+0x30>
c00093d6:	68 e2 06 00 00       	push   $0x6e2
c00093db:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00093e0:	68 a6 a2 00 c0       	push   $0xc000a2a6
c00093e5:	68 99 a4 00 c0       	push   $0xc000a499
c00093ea:	e8 63 f6 ff ff       	call   c0008a52 <assertion_failure>
c00093ef:	83 c4 10             	add    $0x10,%esp
c00093f2:	b8 00 00 00 00       	mov    $0x0,%eax
c00093f7:	c9                   	leave  
c00093f8:	c3                   	ret    

c00093f9 <get_ticks_ipc>:
c00093f9:	55                   	push   %ebp
c00093fa:	89 e5                	mov    %esp,%ebp
c00093fc:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009402:	83 ec 04             	sub    $0x4,%esp
c0009405:	6a 6c                	push   $0x6c
c0009407:	6a 00                	push   $0x0
c0009409:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000940c:	50                   	push   %eax
c000940d:	e8 cd 10 00 00       	call   c000a4df <Memset>
c0009412:	83 c4 10             	add    $0x10,%esp
c0009415:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000941c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009423:	83 ec 04             	sub    $0x4,%esp
c0009426:	6a 01                	push   $0x1
c0009428:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000942b:	50                   	push   %eax
c000942c:	6a 03                	push   $0x3
c000942e:	e8 97 fe ff ff       	call   c00092ca <send_rec>
c0009433:	83 c4 10             	add    $0x10,%esp
c0009436:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009439:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000943c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000943f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009442:	c9                   	leave  
c0009443:	c3                   	ret    

c0009444 <itoa>:
c0009444:	55                   	push   %ebp
c0009445:	89 e5                	mov    %esp,%ebp
c0009447:	53                   	push   %ebx
c0009448:	83 ec 14             	sub    $0x14,%esp
c000944b:	8b 45 08             	mov    0x8(%ebp),%eax
c000944e:	99                   	cltd   
c000944f:	f7 7d 10             	idivl  0x10(%ebp)
c0009452:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009455:	8b 45 08             	mov    0x8(%ebp),%eax
c0009458:	99                   	cltd   
c0009459:	f7 7d 10             	idivl  0x10(%ebp)
c000945c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000945f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009463:	74 14                	je     c0009479 <itoa+0x35>
c0009465:	83 ec 04             	sub    $0x4,%esp
c0009468:	ff 75 10             	pushl  0x10(%ebp)
c000946b:	ff 75 0c             	pushl  0xc(%ebp)
c000946e:	ff 75 f0             	pushl  -0x10(%ebp)
c0009471:	e8 ce ff ff ff       	call   c0009444 <itoa>
c0009476:	83 c4 10             	add    $0x10,%esp
c0009479:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000947c:	8d 58 30             	lea    0x30(%eax),%ebx
c000947f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009482:	8b 00                	mov    (%eax),%eax
c0009484:	8d 48 01             	lea    0x1(%eax),%ecx
c0009487:	8b 55 0c             	mov    0xc(%ebp),%edx
c000948a:	89 0a                	mov    %ecx,(%edx)
c000948c:	89 da                	mov    %ebx,%edx
c000948e:	88 10                	mov    %dl,(%eax)
c0009490:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009493:	8b 00                	mov    (%eax),%eax
c0009495:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009498:	c9                   	leave  
c0009499:	c3                   	ret    

c000949a <i2a>:
c000949a:	55                   	push   %ebp
c000949b:	89 e5                	mov    %esp,%ebp
c000949d:	53                   	push   %ebx
c000949e:	83 ec 14             	sub    $0x14,%esp
c00094a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00094a4:	99                   	cltd   
c00094a5:	f7 7d 0c             	idivl  0xc(%ebp)
c00094a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00094ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00094ae:	99                   	cltd   
c00094af:	f7 7d 0c             	idivl  0xc(%ebp)
c00094b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00094b5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00094b9:	74 14                	je     c00094cf <i2a+0x35>
c00094bb:	83 ec 04             	sub    $0x4,%esp
c00094be:	ff 75 10             	pushl  0x10(%ebp)
c00094c1:	ff 75 0c             	pushl  0xc(%ebp)
c00094c4:	ff 75 f0             	pushl  -0x10(%ebp)
c00094c7:	e8 ce ff ff ff       	call   c000949a <i2a>
c00094cc:	83 c4 10             	add    $0x10,%esp
c00094cf:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00094d3:	7f 0a                	jg     c00094df <i2a+0x45>
c00094d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094d8:	83 c0 30             	add    $0x30,%eax
c00094db:	89 c3                	mov    %eax,%ebx
c00094dd:	eb 08                	jmp    c00094e7 <i2a+0x4d>
c00094df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094e2:	83 c0 37             	add    $0x37,%eax
c00094e5:	89 c3                	mov    %eax,%ebx
c00094e7:	8b 45 10             	mov    0x10(%ebp),%eax
c00094ea:	8b 00                	mov    (%eax),%eax
c00094ec:	8d 48 01             	lea    0x1(%eax),%ecx
c00094ef:	8b 55 10             	mov    0x10(%ebp),%edx
c00094f2:	89 0a                	mov    %ecx,(%edx)
c00094f4:	88 18                	mov    %bl,(%eax)
c00094f6:	8b 45 10             	mov    0x10(%ebp),%eax
c00094f9:	8b 00                	mov    (%eax),%eax
c00094fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00094fe:	c9                   	leave  
c00094ff:	c3                   	ret    

c0009500 <inform_int>:
c0009500:	55                   	push   %ebp
c0009501:	89 e5                	mov    %esp,%ebp
c0009503:	83 ec 18             	sub    $0x18,%esp
c0009506:	83 ec 0c             	sub    $0xc,%esp
c0009509:	ff 75 08             	pushl  0x8(%ebp)
c000950c:	e8 8d b1 ff ff       	call   c000469e <pid2proc>
c0009511:	83 c4 10             	add    $0x10,%esp
c0009514:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009517:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000951a:	0f b6 80 44 01 00 00 	movzbl 0x144(%eax),%eax
c0009521:	0f be c0             	movsbl %al,%eax
c0009524:	83 e0 02             	and    $0x2,%eax
c0009527:	85 c0                	test   %eax,%eax
c0009529:	74 7e                	je     c00095a9 <inform_int+0xa9>
c000952b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000952e:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0009534:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009539:	74 0e                	je     c0009549 <inform_int+0x49>
c000953b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000953e:	8b 80 50 01 00 00    	mov    0x150(%eax),%eax
c0009544:	83 f8 0e             	cmp    $0xe,%eax
c0009547:	75 6d                	jne    c00095b6 <inform_int+0xb6>
c0009549:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000954c:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0009552:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009558:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000955b:	8b 80 48 01 00 00    	mov    0x148(%eax),%eax
c0009561:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009568:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000956b:	c7 80 5c 01 00 00 00 	movl   $0x0,0x15c(%eax)
c0009572:	00 00 00 
c0009575:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009578:	c7 80 50 01 00 00 1d 	movl   $0x1d,0x150(%eax)
c000957f:	00 00 00 
c0009582:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009585:	c7 80 48 01 00 00 00 	movl   $0x0,0x148(%eax)
c000958c:	00 00 00 
c000958f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009592:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
c0009599:	83 ec 0c             	sub    $0xc,%esp
c000959c:	ff 75 f4             	pushl  -0xc(%ebp)
c000959f:	e8 1e fe ff ff       	call   c00093c2 <unblock>
c00095a4:	83 c4 10             	add    $0x10,%esp
c00095a7:	eb 0d                	jmp    c00095b6 <inform_int+0xb6>
c00095a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095ac:	c7 80 5c 01 00 00 01 	movl   $0x1,0x15c(%eax)
c00095b3:	00 00 00 
c00095b6:	90                   	nop
c00095b7:	c9                   	leave  
c00095b8:	c3                   	ret    

c00095b9 <strcmp>:
c00095b9:	55                   	push   %ebp
c00095ba:	89 e5                	mov    %esp,%ebp
c00095bc:	83 ec 10             	sub    $0x10,%esp
c00095bf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c00095c3:	74 06                	je     c00095cb <strcmp+0x12>
c00095c5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00095c9:	75 08                	jne    c00095d3 <strcmp+0x1a>
c00095cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00095ce:	2b 45 0c             	sub    0xc(%ebp),%eax
c00095d1:	eb 53                	jmp    c0009626 <strcmp+0x6d>
c00095d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00095d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00095d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00095dc:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00095df:	eb 18                	jmp    c00095f9 <strcmp+0x40>
c00095e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00095e4:	0f b6 10             	movzbl (%eax),%edx
c00095e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00095ea:	0f b6 00             	movzbl (%eax),%eax
c00095ed:	38 c2                	cmp    %al,%dl
c00095ef:	75 1e                	jne    c000960f <strcmp+0x56>
c00095f1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00095f5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00095f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00095fc:	0f b6 00             	movzbl (%eax),%eax
c00095ff:	84 c0                	test   %al,%al
c0009601:	74 0d                	je     c0009610 <strcmp+0x57>
c0009603:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009606:	0f b6 00             	movzbl (%eax),%eax
c0009609:	84 c0                	test   %al,%al
c000960b:	75 d4                	jne    c00095e1 <strcmp+0x28>
c000960d:	eb 01                	jmp    c0009610 <strcmp+0x57>
c000960f:	90                   	nop
c0009610:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009613:	0f b6 00             	movzbl (%eax),%eax
c0009616:	0f be d0             	movsbl %al,%edx
c0009619:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000961c:	0f b6 00             	movzbl (%eax),%eax
c000961f:	0f be c0             	movsbl %al,%eax
c0009622:	29 c2                	sub    %eax,%edx
c0009624:	89 d0                	mov    %edx,%eax
c0009626:	c9                   	leave  
c0009627:	c3                   	ret    
c0009628:	66 90                	xchg   %ax,%ax
c000962a:	66 90                	xchg   %ax,%ax
c000962c:	66 90                	xchg   %ax,%ax
c000962e:	66 90                	xchg   %ax,%ax

c0009630 <switch_to>:
c0009630:	56                   	push   %esi
c0009631:	57                   	push   %edi
c0009632:	53                   	push   %ebx
c0009633:	55                   	push   %ebp
c0009634:	89 e5                	mov    %esp,%ebp
c0009636:	8b 45 14             	mov    0x14(%ebp),%eax
c0009639:	89 20                	mov    %esp,(%eax)
c000963b:	8b 45 18             	mov    0x18(%ebp),%eax
c000963e:	8b 20                	mov    (%eax),%esp
c0009640:	5d                   	pop    %ebp
c0009641:	5b                   	pop    %ebx
c0009642:	5f                   	pop    %edi
c0009643:	5e                   	pop    %esi
c0009644:	c3                   	ret    

c0009645 <initDoubleLinkList>:
c0009645:	55                   	push   %ebp
c0009646:	89 e5                	mov    %esp,%ebp
c0009648:	83 ec 18             	sub    $0x18,%esp
c000964b:	83 ec 08             	sub    $0x8,%esp
c000964e:	6a 00                	push   $0x0
c0009650:	6a 01                	push   $0x1
c0009652:	e8 e3 d1 ff ff       	call   c000683a <alloc_memory>
c0009657:	83 c4 10             	add    $0x10,%esp
c000965a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000965d:	83 ec 04             	sub    $0x4,%esp
c0009660:	6a 08                	push   $0x8
c0009662:	6a 00                	push   $0x0
c0009664:	ff 75 f4             	pushl  -0xc(%ebp)
c0009667:	e8 73 0e 00 00       	call   c000a4df <Memset>
c000966c:	83 c4 10             	add    $0x10,%esp
c000966f:	83 ec 08             	sub    $0x8,%esp
c0009672:	6a 00                	push   $0x0
c0009674:	6a 01                	push   $0x1
c0009676:	e8 bf d1 ff ff       	call   c000683a <alloc_memory>
c000967b:	83 c4 10             	add    $0x10,%esp
c000967e:	89 c2                	mov    %eax,%edx
c0009680:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009683:	89 10                	mov    %edx,(%eax)
c0009685:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009688:	8b 00                	mov    (%eax),%eax
c000968a:	83 ec 04             	sub    $0x4,%esp
c000968d:	6a 0c                	push   $0xc
c000968f:	6a 00                	push   $0x0
c0009691:	50                   	push   %eax
c0009692:	e8 48 0e 00 00       	call   c000a4df <Memset>
c0009697:	83 c4 10             	add    $0x10,%esp
c000969a:	83 ec 08             	sub    $0x8,%esp
c000969d:	6a 00                	push   $0x0
c000969f:	6a 01                	push   $0x1
c00096a1:	e8 94 d1 ff ff       	call   c000683a <alloc_memory>
c00096a6:	83 c4 10             	add    $0x10,%esp
c00096a9:	89 c2                	mov    %eax,%edx
c00096ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096ae:	89 50 04             	mov    %edx,0x4(%eax)
c00096b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096b4:	8b 40 04             	mov    0x4(%eax),%eax
c00096b7:	83 ec 04             	sub    $0x4,%esp
c00096ba:	6a 0c                	push   $0xc
c00096bc:	6a 00                	push   $0x0
c00096be:	50                   	push   %eax
c00096bf:	e8 1b 0e 00 00       	call   c000a4df <Memset>
c00096c4:	83 c4 10             	add    $0x10,%esp
c00096c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096ca:	8b 00                	mov    (%eax),%eax
c00096cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00096cf:	8b 52 04             	mov    0x4(%edx),%edx
c00096d2:	89 50 04             	mov    %edx,0x4(%eax)
c00096d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096d8:	8b 40 04             	mov    0x4(%eax),%eax
c00096db:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00096de:	8b 12                	mov    (%edx),%edx
c00096e0:	89 10                	mov    %edx,(%eax)
c00096e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096e5:	c9                   	leave  
c00096e6:	c3                   	ret    

c00096e7 <isListEmpty>:
c00096e7:	55                   	push   %ebp
c00096e8:	89 e5                	mov    %esp,%ebp
c00096ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00096ed:	8b 00                	mov    (%eax),%eax
c00096ef:	8b 50 04             	mov    0x4(%eax),%edx
c00096f2:	8b 45 08             	mov    0x8(%ebp),%eax
c00096f5:	8b 40 04             	mov    0x4(%eax),%eax
c00096f8:	39 c2                	cmp    %eax,%edx
c00096fa:	75 18                	jne    c0009714 <isListEmpty+0x2d>
c00096fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00096ff:	8b 40 04             	mov    0x4(%eax),%eax
c0009702:	8b 10                	mov    (%eax),%edx
c0009704:	8b 45 08             	mov    0x8(%ebp),%eax
c0009707:	8b 00                	mov    (%eax),%eax
c0009709:	39 c2                	cmp    %eax,%edx
c000970b:	75 07                	jne    c0009714 <isListEmpty+0x2d>
c000970d:	b8 01 00 00 00       	mov    $0x1,%eax
c0009712:	eb 05                	jmp    c0009719 <isListEmpty+0x32>
c0009714:	b8 00 00 00 00       	mov    $0x0,%eax
c0009719:	5d                   	pop    %ebp
c000971a:	c3                   	ret    

c000971b <appendToDoubleLinkList>:
c000971b:	55                   	push   %ebp
c000971c:	89 e5                	mov    %esp,%ebp
c000971e:	83 ec 18             	sub    $0x18,%esp
c0009721:	83 ec 08             	sub    $0x8,%esp
c0009724:	6a 00                	push   $0x0
c0009726:	6a 01                	push   $0x1
c0009728:	e8 0d d1 ff ff       	call   c000683a <alloc_memory>
c000972d:	83 c4 10             	add    $0x10,%esp
c0009730:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009733:	83 ec 04             	sub    $0x4,%esp
c0009736:	6a 0c                	push   $0xc
c0009738:	6a 00                	push   $0x0
c000973a:	ff 75 f4             	pushl  -0xc(%ebp)
c000973d:	e8 9d 0d 00 00       	call   c000a4df <Memset>
c0009742:	83 c4 10             	add    $0x10,%esp
c0009745:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009748:	8b 55 0c             	mov    0xc(%ebp),%edx
c000974b:	89 50 08             	mov    %edx,0x8(%eax)
c000974e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009751:	8b 40 04             	mov    0x4(%eax),%eax
c0009754:	8b 10                	mov    (%eax),%edx
c0009756:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009759:	89 10                	mov    %edx,(%eax)
c000975b:	8b 45 08             	mov    0x8(%ebp),%eax
c000975e:	8b 40 04             	mov    0x4(%eax),%eax
c0009761:	8b 00                	mov    (%eax),%eax
c0009763:	85 c0                	test   %eax,%eax
c0009765:	74 0e                	je     c0009775 <appendToDoubleLinkList+0x5a>
c0009767:	8b 45 08             	mov    0x8(%ebp),%eax
c000976a:	8b 40 04             	mov    0x4(%eax),%eax
c000976d:	8b 00                	mov    (%eax),%eax
c000976f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0009772:	89 50 04             	mov    %edx,0x4(%eax)
c0009775:	8b 45 08             	mov    0x8(%ebp),%eax
c0009778:	8b 40 04             	mov    0x4(%eax),%eax
c000977b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000977e:	89 10                	mov    %edx,(%eax)
c0009780:	8b 45 08             	mov    0x8(%ebp),%eax
c0009783:	8b 50 04             	mov    0x4(%eax),%edx
c0009786:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009789:	89 50 04             	mov    %edx,0x4(%eax)
c000978c:	90                   	nop
c000978d:	c9                   	leave  
c000978e:	c3                   	ret    

c000978f <insertToDoubleLinkList>:
c000978f:	55                   	push   %ebp
c0009790:	89 e5                	mov    %esp,%ebp
c0009792:	83 ec 18             	sub    $0x18,%esp
c0009795:	83 ec 08             	sub    $0x8,%esp
c0009798:	6a 00                	push   $0x0
c000979a:	6a 01                	push   $0x1
c000979c:	e8 99 d0 ff ff       	call   c000683a <alloc_memory>
c00097a1:	83 c4 10             	add    $0x10,%esp
c00097a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00097a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00097aa:	8b 55 0c             	mov    0xc(%ebp),%edx
c00097ad:	89 50 08             	mov    %edx,0x8(%eax)
c00097b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00097b3:	8b 00                	mov    (%eax),%eax
c00097b5:	8b 50 04             	mov    0x4(%eax),%edx
c00097b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00097bb:	89 50 04             	mov    %edx,0x4(%eax)
c00097be:	8b 45 08             	mov    0x8(%ebp),%eax
c00097c1:	8b 00                	mov    (%eax),%eax
c00097c3:	8b 40 04             	mov    0x4(%eax),%eax
c00097c6:	85 c0                	test   %eax,%eax
c00097c8:	74 0d                	je     c00097d7 <insertToDoubleLinkList+0x48>
c00097ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00097cd:	8b 00                	mov    (%eax),%eax
c00097cf:	8b 40 04             	mov    0x4(%eax),%eax
c00097d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00097d5:	89 10                	mov    %edx,(%eax)
c00097d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00097da:	8b 00                	mov    (%eax),%eax
c00097dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00097df:	89 50 04             	mov    %edx,0x4(%eax)
c00097e2:	8b 45 08             	mov    0x8(%ebp),%eax
c00097e5:	8b 10                	mov    (%eax),%edx
c00097e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00097ea:	89 10                	mov    %edx,(%eax)
c00097ec:	90                   	nop
c00097ed:	c9                   	leave  
c00097ee:	c3                   	ret    

c00097ef <popFromDoubleLinkList>:
c00097ef:	55                   	push   %ebp
c00097f0:	89 e5                	mov    %esp,%ebp
c00097f2:	83 ec 10             	sub    $0x10,%esp
c00097f5:	ff 75 08             	pushl  0x8(%ebp)
c00097f8:	e8 ea fe ff ff       	call   c00096e7 <isListEmpty>
c00097fd:	83 c4 04             	add    $0x4,%esp
c0009800:	3c 01                	cmp    $0x1,%al
c0009802:	75 07                	jne    c000980b <popFromDoubleLinkList+0x1c>
c0009804:	b8 00 00 00 00       	mov    $0x0,%eax
c0009809:	eb 44                	jmp    c000984f <popFromDoubleLinkList+0x60>
c000980b:	8b 45 08             	mov    0x8(%ebp),%eax
c000980e:	8b 40 04             	mov    0x4(%eax),%eax
c0009811:	8b 00                	mov    (%eax),%eax
c0009813:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009816:	8b 45 08             	mov    0x8(%ebp),%eax
c0009819:	8b 40 04             	mov    0x4(%eax),%eax
c000981c:	8b 00                	mov    (%eax),%eax
c000981e:	8b 00                	mov    (%eax),%eax
c0009820:	85 c0                	test   %eax,%eax
c0009822:	74 13                	je     c0009837 <popFromDoubleLinkList+0x48>
c0009824:	8b 45 08             	mov    0x8(%ebp),%eax
c0009827:	8b 40 04             	mov    0x4(%eax),%eax
c000982a:	8b 00                	mov    (%eax),%eax
c000982c:	8b 00                	mov    (%eax),%eax
c000982e:	8b 55 08             	mov    0x8(%ebp),%edx
c0009831:	8b 52 04             	mov    0x4(%edx),%edx
c0009834:	89 50 04             	mov    %edx,0x4(%eax)
c0009837:	8b 45 08             	mov    0x8(%ebp),%eax
c000983a:	8b 40 04             	mov    0x4(%eax),%eax
c000983d:	8b 10                	mov    (%eax),%edx
c000983f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009842:	8b 40 04             	mov    0x4(%eax),%eax
c0009845:	8b 12                	mov    (%edx),%edx
c0009847:	89 10                	mov    %edx,(%eax)
c0009849:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000984c:	8b 40 08             	mov    0x8(%eax),%eax
c000984f:	c9                   	leave  
c0009850:	c3                   	ret    

c0009851 <kernel_thread>:
c0009851:	55                   	push   %ebp
c0009852:	89 e5                	mov    %esp,%ebp
c0009854:	83 ec 08             	sub    $0x8,%esp
c0009857:	fb                   	sti    
c0009858:	83 ec 0c             	sub    $0xc,%esp
c000985b:	ff 75 0c             	pushl  0xc(%ebp)
c000985e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009861:	ff d0                	call   *%eax
c0009863:	83 c4 10             	add    $0x10,%esp
c0009866:	90                   	nop
c0009867:	c9                   	leave  
c0009868:	c3                   	ret    

c0009869 <thread_create>:
c0009869:	55                   	push   %ebp
c000986a:	89 e5                	mov    %esp,%ebp
c000986c:	83 ec 18             	sub    $0x18,%esp
c000986f:	83 ec 08             	sub    $0x8,%esp
c0009872:	6a 00                	push   $0x0
c0009874:	6a 01                	push   $0x1
c0009876:	e8 bf cf ff ff       	call   c000683a <alloc_memory>
c000987b:	83 c4 10             	add    $0x10,%esp
c000987e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009881:	83 ec 04             	sub    $0x4,%esp
c0009884:	68 ac 01 00 00       	push   $0x1ac
c0009889:	6a 00                	push   $0x0
c000988b:	ff 75 f4             	pushl  -0xc(%ebp)
c000988e:	e8 4c 0c 00 00       	call   c000a4df <Memset>
c0009893:	83 c4 10             	add    $0x10,%esp
c0009896:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009899:	05 00 10 00 00       	add    $0x1000,%eax
c000989e:	89 c2                	mov    %eax,%edx
c00098a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098a3:	89 10                	mov    %edx,(%eax)
c00098a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098a8:	c7 80 3c 01 00 00 00 	movl   $0x0,0x13c(%eax)
c00098af:	00 00 00 
c00098b2:	c7 45 f0 44 00 00 00 	movl   $0x44,-0x10(%ebp)
c00098b9:	c7 45 ec 24 00 00 00 	movl   $0x24,-0x14(%ebp)
c00098c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098c3:	8b 00                	mov    (%eax),%eax
c00098c5:	2b 45 f0             	sub    -0x10(%ebp),%eax
c00098c8:	89 c2                	mov    %eax,%edx
c00098ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098cd:	89 10                	mov    %edx,(%eax)
c00098cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098d2:	8b 00                	mov    (%eax),%eax
c00098d4:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00098d7:	89 c2                	mov    %eax,%edx
c00098d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098dc:	89 10                	mov    %edx,(%eax)
c00098de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00098e1:	c9                   	leave  
c00098e2:	c3                   	ret    

c00098e3 <thread_start>:
c00098e3:	55                   	push   %ebp
c00098e4:	89 e5                	mov    %esp,%ebp
c00098e6:	83 ec 18             	sub    $0x18,%esp
c00098e9:	83 ec 08             	sub    $0x8,%esp
c00098ec:	ff 75 0c             	pushl  0xc(%ebp)
c00098ef:	ff 75 08             	pushl  0x8(%ebp)
c00098f2:	e8 72 ff ff ff       	call   c0009869 <thread_create>
c00098f7:	83 c4 10             	add    $0x10,%esp
c00098fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00098fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009900:	8b 00                	mov    (%eax),%eax
c0009902:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009905:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009908:	c7 40 10 51 98 00 c0 	movl   $0xc0009851,0x10(%eax)
c000990f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009912:	8b 55 08             	mov    0x8(%ebp),%edx
c0009915:	89 50 18             	mov    %edx,0x18(%eax)
c0009918:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000991b:	8b 55 0c             	mov    0xc(%ebp),%edx
c000991e:	89 50 1c             	mov    %edx,0x1c(%eax)
c0009921:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009924:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000992a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000992d:	8b 10                	mov    (%eax),%edx
c000992f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009932:	89 50 04             	mov    %edx,0x4(%eax)
c0009935:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009938:	8b 50 04             	mov    0x4(%eax),%edx
c000993b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000993e:	89 50 08             	mov    %edx,0x8(%eax)
c0009941:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009944:	8b 50 08             	mov    0x8(%eax),%edx
c0009947:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000994a:	89 50 0c             	mov    %edx,0xc(%eax)
c000994d:	a1 ac ed 00 c0       	mov    0xc000edac,%eax
c0009952:	83 ec 08             	sub    $0x8,%esp
c0009955:	ff 75 f4             	pushl  -0xc(%ebp)
c0009958:	50                   	push   %eax
c0009959:	e8 bd fd ff ff       	call   c000971b <appendToDoubleLinkList>
c000995e:	83 c4 10             	add    $0x10,%esp
c0009961:	90                   	nop
c0009962:	c9                   	leave  
c0009963:	c3                   	ret    
