
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	66 c7 05 5c e7 00 c0 	movw   $0x0,0xc000e75c
c000151c:	00 00 
c000151e:	0f 01 05 e8 06 01 c0 	sgdtl  0xc00106e8
c0001525:	e8 21 35 00 00       	call   c0004a4b <ReloadGDT>
c000152a:	0f 01 15 e8 06 01 c0 	lgdtl  0xc00106e8
c0001531:	0f 01 1d 48 e7 00 c0 	lidtl  0xc000e748
c0001538:	0f a8                	push   %gs
c000153a:	0f a9                	pop    %gs
c000153c:	ea 43 15 00 c0 08 00 	ljmp   $0x8,$0xc0001543

c0001543 <csinit>:
c0001543:	31 c0                	xor    %eax,%eax
c0001545:	66 b8 40 00          	mov    $0x40,%ax
c0001549:	0f 00 d8             	ltr    %ax
c000154c:	31 c0                	xor    %eax,%eax
c000154e:	e9 50 03 00 00       	jmp    c00018a3 <kernel_main>
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
c000156a:	e8 c0 60 00 00       	call   c000762f <test>
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
c0001594:	8b 3d 5c e7 00 c0    	mov    0xc000e75c,%edi

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
c00015bd:	89 3d 5c e7 00 c0    	mov    %edi,0xc000e75c
c00015c3:	89 ec                	mov    %ebp,%esp
c00015c5:	5d                   	pop    %ebp
c00015c6:	c3                   	ret    

c00015c7 <disp_str_colour>:
c00015c7:	55                   	push   %ebp
c00015c8:	89 e5                	mov    %esp,%ebp
c00015ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00015cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00015d0:	8b 3d 5c e7 00 c0    	mov    0xc000e75c,%edi

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
c00015f9:	89 3d 5c e7 00 c0    	mov    %edi,0xc000e75c
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
c0001661:	e8 ec 5a 00 00       	call   c0007152 <exception_handler>
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
c000167e:	ff 05 60 e7 00 c0    	incl   0xc000e760
c0001684:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c000168b:	75 00                	jne    c000168d <hwint0.1>

c000168d <hwint0.1>:
c000168d:	e8 9e 30 00 00       	call   c0004730 <clock_handler>
c0001692:	fa                   	cli    
c0001693:	e9 eb 00 00 00       	jmp    c0001783 <reenter_restore>

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
c00016b0:	ff 05 60 e7 00 c0    	incl   0xc000e760
c00016b6:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c00016bd:	75 05                	jne    c00016c4 <hwint1.2>

c00016bf <hwint1.1>:
c00016bf:	bc 20 e7 00 c0       	mov    $0xc000e720,%esp

c00016c4 <hwint1.2>:
c00016c4:	fb                   	sti    
c00016c5:	e8 4d 3d 00 00       	call   c0005417 <keyboard_handler>
c00016ca:	b0 f8                	mov    $0xf8,%al
c00016cc:	e6 21                	out    %al,$0x21
c00016ce:	fa                   	cli    
c00016cf:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c00016d6:	0f 85 a7 00 00 00    	jne    c0001783 <reenter_restore>
c00016dc:	e9 a2 00 00 00       	jmp    c0001783 <reenter_restore>

c00016e1 <hwint14>:
c00016e1:	60                   	pusha  
c00016e2:	1e                   	push   %ds
c00016e3:	06                   	push   %es
c00016e4:	0f a0                	push   %fs
c00016e6:	0f a8                	push   %gs
c00016e8:	66 8c d2             	mov    %ss,%dx
c00016eb:	8e da                	mov    %edx,%ds
c00016ed:	8e c2                	mov    %edx,%es
c00016ef:	8e e2                	mov    %edx,%fs
c00016f1:	b0 ff                	mov    $0xff,%al
c00016f3:	e6 a1                	out    %al,$0xa1
c00016f5:	b0 20                	mov    $0x20,%al
c00016f7:	e6 20                	out    %al,$0x20
c00016f9:	90                   	nop
c00016fa:	e6 a0                	out    %al,$0xa0
c00016fc:	ff 05 60 e7 00 c0    	incl   0xc000e760
c0001702:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c0001709:	75 05                	jne    c0001710 <hwint14.2>

c000170b <hwint14.1>:
c000170b:	bc 20 e7 00 c0       	mov    $0xc000e720,%esp

c0001710 <hwint14.2>:
c0001710:	fb                   	sti    
c0001711:	e8 11 0e 00 00       	call   c0002527 <hd_handler>
c0001716:	b0 bf                	mov    $0xbf,%al
c0001718:	e6 a1                	out    %al,$0xa1
c000171a:	fa                   	cli    
c000171b:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c0001722:	75 5f                	jne    c0001783 <reenter_restore>
c0001724:	eb 5d                	jmp    c0001783 <reenter_restore>

c0001726 <sys_call>:
c0001726:	60                   	pusha  
c0001727:	1e                   	push   %ds
c0001728:	06                   	push   %es
c0001729:	0f a0                	push   %fs
c000172b:	0f a8                	push   %gs
c000172d:	89 e6                	mov    %esp,%esi
c000172f:	66 8c d2             	mov    %ss,%dx
c0001732:	8e da                	mov    %edx,%ds
c0001734:	8e c2                	mov    %edx,%es
c0001736:	8e e2                	mov    %edx,%fs
c0001738:	ff 05 60 e7 00 c0    	incl   0xc000e760
c000173e:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c0001745:	75 05                	jne    c000174c <sys_call.2>

c0001747 <sys_call.1>:
c0001747:	bc 20 e7 00 c0       	mov    $0xc000e720,%esp

c000174c <sys_call.2>:
c000174c:	fb                   	sti    
c000174d:	56                   	push   %esi
c000174e:	ff 35 80 eb 00 c0    	pushl  0xc000eb80
c0001754:	53                   	push   %ebx
c0001755:	51                   	push   %ecx
c0001756:	ff 14 85 0c d1 00 c0 	call   *-0x3fff2ef4(,%eax,4)
c000175d:	83 c4 0c             	add    $0xc,%esp
c0001760:	5e                   	pop    %esi
c0001761:	89 46 2c             	mov    %eax,0x2c(%esi)
c0001764:	fa                   	cli    
c0001765:	83 3d 60 e7 00 c0 00 	cmpl   $0x0,0xc000e760
c000176c:	75 15                	jne    c0001783 <reenter_restore>
c000176e:	eb 13                	jmp    c0001783 <reenter_restore>

c0001770 <restart>:
c0001770:	ff 0d 60 e7 00 c0    	decl   0xc000e760
c0001776:	89 e5                	mov    %esp,%ebp
c0001778:	8b 65 04             	mov    0x4(%ebp),%esp
c000177b:	0f a9                	pop    %gs
c000177d:	0f a1                	pop    %fs
c000177f:	07                   	pop    %es
c0001780:	1f                   	pop    %ds
c0001781:	61                   	popa   
c0001782:	cf                   	iret   

c0001783 <reenter_restore>:
c0001783:	ff 0d 60 e7 00 c0    	decl   0xc000e760
c0001789:	0f a9                	pop    %gs
c000178b:	0f a1                	pop    %fs
c000178d:	07                   	pop    %es
c000178e:	1f                   	pop    %ds
c000178f:	61                   	popa   
c0001790:	cf                   	iret   

c0001791 <in_byte>:
c0001791:	31 d2                	xor    %edx,%edx
c0001793:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001797:	31 c0                	xor    %eax,%eax
c0001799:	ec                   	in     (%dx),%al
c000179a:	90                   	nop
c000179b:	90                   	nop
c000179c:	c3                   	ret    

c000179d <out_byte>:
c000179d:	31 d2                	xor    %edx,%edx
c000179f:	31 c0                	xor    %eax,%eax
c00017a1:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017a5:	8a 44 24 08          	mov    0x8(%esp),%al
c00017a9:	ee                   	out    %al,(%dx)
c00017aa:	90                   	nop
c00017ab:	90                   	nop
c00017ac:	c3                   	ret    

c00017ad <in_byte2>:
c00017ad:	55                   	push   %ebp
c00017ae:	89 e5                	mov    %esp,%ebp
c00017b0:	52                   	push   %edx
c00017b1:	31 d2                	xor    %edx,%edx
c00017b3:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017b7:	31 c0                	xor    %eax,%eax
c00017b9:	ec                   	in     (%dx),%al
c00017ba:	90                   	nop
c00017bb:	90                   	nop
c00017bc:	5b                   	pop    %ebx
c00017bd:	5d                   	pop    %ebp
c00017be:	c3                   	ret    

c00017bf <disable_int>:
c00017bf:	fa                   	cli    
c00017c0:	c3                   	ret    

c00017c1 <enable_int>:
c00017c1:	fb                   	sti    
c00017c2:	c3                   	ret    

c00017c3 <check_tss_esp0>:
c00017c3:	55                   	push   %ebp
c00017c4:	89 e5                	mov    %esp,%ebp
c00017c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00017c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017cc:	83 c0 44             	add    $0x44,%eax
c00017cf:	8b 15 64 06 01 c0    	mov    0xc0010664,%edx
c00017d5:	39 d0                	cmp    %edx,%eax
c00017d7:	74 7c                	je     c0001855 <check_tss_esp0.2>

c00017d9 <check_tss_esp0.1>:
c00017d9:	50                   	push   %eax
c00017da:	52                   	push   %edx
c00017db:	68 10 d0 00 c0       	push   $0xc000d010
c00017e0:	e8 a7 fd ff ff       	call   c000158c <disp_str>
c00017e5:	83 c4 04             	add    $0x4,%esp
c00017e8:	5a                   	pop    %edx
c00017e9:	58                   	pop    %eax
c00017ea:	52                   	push   %edx
c00017eb:	50                   	push   %eax
c00017ec:	53                   	push   %ebx
c00017ed:	e8 04 58 00 00       	call   c0006ff6 <disp_int>
c00017f2:	83 c4 04             	add    $0x4,%esp
c00017f5:	58                   	pop    %eax
c00017f6:	5a                   	pop    %edx
c00017f7:	52                   	push   %edx
c00017f8:	50                   	push   %eax
c00017f9:	e8 f8 57 00 00       	call   c0006ff6 <disp_int>
c00017fe:	58                   	pop    %eax
c00017ff:	5a                   	pop    %edx
c0001800:	52                   	push   %edx
c0001801:	50                   	push   %eax
c0001802:	ff 35 60 e7 00 c0    	pushl  0xc000e760
c0001808:	e8 e9 57 00 00       	call   c0006ff6 <disp_int>
c000180d:	83 c4 04             	add    $0x4,%esp
c0001810:	58                   	pop    %eax
c0001811:	5a                   	pop    %edx
c0001812:	52                   	push   %edx
c0001813:	50                   	push   %eax
c0001814:	ff 72 ec             	pushl  -0x14(%edx)
c0001817:	e8 da 57 00 00       	call   c0006ff6 <disp_int>
c000181c:	83 c4 04             	add    $0x4,%esp
c000181f:	58                   	pop    %eax
c0001820:	5a                   	pop    %edx
c0001821:	52                   	push   %edx
c0001822:	50                   	push   %eax
c0001823:	ff 70 ec             	pushl  -0x14(%eax)
c0001826:	e8 cb 57 00 00       	call   c0006ff6 <disp_int>
c000182b:	83 c4 04             	add    $0x4,%esp
c000182e:	58                   	pop    %eax
c000182f:	5a                   	pop    %edx
c0001830:	52                   	push   %edx
c0001831:	50                   	push   %eax
c0001832:	ff 35 80 eb 00 c0    	pushl  0xc000eb80
c0001838:	e8 b9 57 00 00       	call   c0006ff6 <disp_int>
c000183d:	83 c4 04             	add    $0x4,%esp
c0001840:	58                   	pop    %eax
c0001841:	5a                   	pop    %edx
c0001842:	52                   	push   %edx
c0001843:	50                   	push   %eax
c0001844:	68 20 e7 00 c0       	push   $0xc000e720
c0001849:	e8 a8 57 00 00       	call   c0006ff6 <disp_int>
c000184e:	83 c4 04             	add    $0x4,%esp
c0001851:	58                   	pop    %eax
c0001852:	5a                   	pop    %edx
c0001853:	5d                   	pop    %ebp
c0001854:	c3                   	ret    

c0001855 <check_tss_esp0.2>:
c0001855:	5d                   	pop    %ebp
c0001856:	c3                   	ret    

c0001857 <enable_8259A_casecade_irq>:
c0001857:	9c                   	pushf  
c0001858:	fa                   	cli    
c0001859:	e4 21                	in     $0x21,%al
c000185b:	24 fb                	and    $0xfb,%al
c000185d:	e6 21                	out    %al,$0x21
c000185f:	9d                   	popf   
c0001860:	c3                   	ret    

c0001861 <disable_8259A_casecade_irq>:
c0001861:	9c                   	pushf  
c0001862:	fa                   	cli    
c0001863:	e4 21                	in     $0x21,%al
c0001865:	0c 04                	or     $0x4,%al
c0001867:	e6 21                	out    %al,$0x21
c0001869:	9c                   	pushf  
c000186a:	c3                   	ret    

c000186b <enable_8259A_slave_winchester_irq>:
c000186b:	9c                   	pushf  
c000186c:	fa                   	cli    
c000186d:	e4 a1                	in     $0xa1,%al
c000186f:	24 bf                	and    $0xbf,%al
c0001871:	e6 a1                	out    %al,$0xa1
c0001873:	9d                   	popf   
c0001874:	c3                   	ret    

c0001875 <disable_8259A_slave_winchester_irq>:
c0001875:	9c                   	pushf  
c0001876:	fa                   	cli    
c0001877:	e4 a1                	in     $0xa1,%al
c0001879:	0c 40                	or     $0x40,%al
c000187b:	e6 a1                	out    %al,$0xa1
c000187d:	9d                   	popf   
c000187e:	c3                   	ret    

c000187f <update_cr3>:
c000187f:	55                   	push   %ebp
c0001880:	89 e5                	mov    %esp,%ebp
c0001882:	8b 45 08             	mov    0x8(%ebp),%eax
c0001885:	0f 22 d8             	mov    %eax,%cr3
c0001888:	89 ec                	mov    %ebp,%esp
c000188a:	5d                   	pop    %ebp
c000188b:	c3                   	ret    

c000188c <update_tss>:
c000188c:	55                   	push   %ebp
c000188d:	89 e5                	mov    %esp,%ebp
c000188f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001892:	a3 64 06 01 c0       	mov    %eax,0xc0010664
c0001897:	89 ec                	mov    %ebp,%esp
c0001899:	5d                   	pop    %ebp
c000189a:	c3                   	ret    

c000189b <get_running_thread_pcb>:
c000189b:	89 e0                	mov    %esp,%eax
c000189d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00018a2:	c3                   	ret    

c00018a3 <kernel_main>:
c00018a3:	55                   	push   %ebp
c00018a4:	89 e5                	mov    %esp,%ebp
c00018a6:	83 ec 08             	sub    $0x8,%esp
c00018a9:	e8 a1 00 00 00       	call   c000194f <init>
c00018ae:	83 ec 0c             	sub    $0xc,%esp
c00018b1:	68 40 9b 00 c0       	push   $0xc0009b40
c00018b6:	e8 d1 fc ff ff       	call   c000158c <disp_str>
c00018bb:	83 c4 10             	add    $0x10,%esp
c00018be:	83 ec 08             	sub    $0x8,%esp
c00018c1:	68 4c 9b 00 c0       	push   $0xc0009b4c
c00018c6:	68 30 1a 00 c0       	push   $0xc0001a30
c00018cb:	e8 c6 7e 00 00       	call   c0009796 <process_execute>
c00018d0:	83 c4 10             	add    $0x10,%esp
c00018d3:	83 ec 08             	sub    $0x8,%esp
c00018d6:	68 59 9b 00 c0       	push   $0xc0009b59
c00018db:	68 8c 19 00 c0       	push   $0xc000198c
c00018e0:	e8 c1 81 00 00       	call   c0009aa6 <thread_start>
c00018e5:	83 c4 10             	add    $0x10,%esp
c00018e8:	83 ec 08             	sub    $0x8,%esp
c00018eb:	68 63 9b 00 c0       	push   $0xc0009b63
c00018f0:	68 ee 19 00 c0       	push   $0xc00019ee
c00018f5:	e8 ac 81 00 00       	call   c0009aa6 <thread_start>
c00018fa:	83 c4 10             	add    $0x10,%esp
c00018fd:	83 ec 08             	sub    $0x8,%esp
c0001900:	68 6d 9b 00 c0       	push   $0xc0009b6d
c0001905:	68 04 1a 00 c0       	push   $0xc0001a04
c000190a:	e8 97 81 00 00       	call   c0009aa6 <thread_start>
c000190f:	83 c4 10             	add    $0x10,%esp
c0001912:	83 ec 08             	sub    $0x8,%esp
c0001915:	68 77 9b 00 c0       	push   $0xc0009b77
c000191a:	68 1a 1a 00 c0       	push   $0xc0001a1a
c000191f:	e8 82 81 00 00       	call   c0009aa6 <thread_start>
c0001924:	83 c4 10             	add    $0x10,%esp
c0001927:	83 ec 08             	sub    $0x8,%esp
c000192a:	68 81 9b 00 c0       	push   $0xc0009b81
c000192f:	68 48 1a 00 c0       	push   $0xc0001a48
c0001934:	e8 5d 7e 00 00       	call   c0009796 <process_execute>
c0001939:	83 c4 10             	add    $0x10,%esp
c000193c:	83 ec 0c             	sub    $0xc,%esp
c000193f:	68 8e 9b 00 c0       	push   $0xc0009b8e
c0001944:	e8 43 fc ff ff       	call   c000158c <disp_str>
c0001949:	83 c4 10             	add    $0x10,%esp
c000194c:	fb                   	sti    
c000194d:	eb fe                	jmp    c000194d <kernel_main+0xaa>

c000194f <init>:
c000194f:	55                   	push   %ebp
c0001950:	89 e5                	mov    %esp,%ebp
c0001952:	83 ec 08             	sub    $0x8,%esp
c0001955:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c000195c:	00 00 00 
c000195f:	83 ec 0c             	sub    $0xc,%esp
c0001962:	68 98 9b 00 c0       	push   $0xc0009b98
c0001967:	e8 20 fc ff ff       	call   c000158c <disp_str>
c000196c:	83 c4 10             	add    $0x10,%esp
c000196f:	e8 70 5d 00 00       	call   c00076e4 <init_keyboard>
c0001974:	83 ec 0c             	sub    $0xc,%esp
c0001977:	68 00 00 00 02       	push   $0x2000000
c000197c:	e8 a3 52 00 00       	call   c0006c24 <init_memory>
c0001981:	83 c4 10             	add    $0x10,%esp
c0001984:	e8 1c 7f 00 00       	call   c00098a5 <initDoubleLinkList>
c0001989:	90                   	nop
c000198a:	c9                   	leave  
c000198b:	c3                   	ret    

c000198c <kernel_thread_a>:
c000198c:	55                   	push   %ebp
c000198d:	89 e5                	mov    %esp,%ebp
c000198f:	83 ec 18             	sub    $0x18,%esp
c0001992:	83 ec 0c             	sub    $0xc,%esp
c0001995:	ff 75 08             	pushl  0x8(%ebp)
c0001998:	e8 ef fb ff ff       	call   c000158c <disp_str>
c000199d:	83 c4 10             	add    $0x10,%esp
c00019a0:	a1 5c e7 00 c0       	mov    0xc000e75c,%eax
c00019a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00019b2:	a3 5c e7 00 c0       	mov    %eax,0xc000e75c
c00019b7:	83 ec 0c             	sub    $0xc,%esp
c00019ba:	68 9e 9b 00 c0       	push   $0xc0009b9e
c00019bf:	e8 c8 fb ff ff       	call   c000158c <disp_str>
c00019c4:	83 c4 10             	add    $0x10,%esp
c00019c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019ca:	8d 50 01             	lea    0x1(%eax),%edx
c00019cd:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019d0:	83 ec 0c             	sub    $0xc,%esp
c00019d3:	50                   	push   %eax
c00019d4:	e8 1d 56 00 00       	call   c0006ff6 <disp_int>
c00019d9:	83 c4 10             	add    $0x10,%esp
c00019dc:	83 ec 0c             	sub    $0xc,%esp
c00019df:	68 a7 9b 00 c0       	push   $0xc0009ba7
c00019e4:	e8 a3 fb ff ff       	call   c000158c <disp_str>
c00019e9:	83 c4 10             	add    $0x10,%esp
c00019ec:	eb c1                	jmp    c00019af <kernel_thread_a+0x23>

c00019ee <kernel_thread_b>:
c00019ee:	55                   	push   %ebp
c00019ef:	89 e5                	mov    %esp,%ebp
c00019f1:	83 ec 08             	sub    $0x8,%esp
c00019f4:	83 ec 0c             	sub    $0xc,%esp
c00019f7:	ff 75 08             	pushl  0x8(%ebp)
c00019fa:	e8 8d fb ff ff       	call   c000158c <disp_str>
c00019ff:	83 c4 10             	add    $0x10,%esp
c0001a02:	eb fe                	jmp    c0001a02 <kernel_thread_b+0x14>

c0001a04 <kernel_thread_c>:
c0001a04:	55                   	push   %ebp
c0001a05:	89 e5                	mov    %esp,%ebp
c0001a07:	83 ec 08             	sub    $0x8,%esp
c0001a0a:	83 ec 0c             	sub    $0xc,%esp
c0001a0d:	ff 75 08             	pushl  0x8(%ebp)
c0001a10:	e8 77 fb ff ff       	call   c000158c <disp_str>
c0001a15:	83 c4 10             	add    $0x10,%esp
c0001a18:	eb fe                	jmp    c0001a18 <kernel_thread_c+0x14>

c0001a1a <kernel_thread_d>:
c0001a1a:	55                   	push   %ebp
c0001a1b:	89 e5                	mov    %esp,%ebp
c0001a1d:	83 ec 08             	sub    $0x8,%esp
c0001a20:	83 ec 0c             	sub    $0xc,%esp
c0001a23:	ff 75 08             	pushl  0x8(%ebp)
c0001a26:	e8 61 fb ff ff       	call   c000158c <disp_str>
c0001a2b:	83 c4 10             	add    $0x10,%esp
c0001a2e:	eb fe                	jmp    c0001a2e <kernel_thread_d+0x14>

c0001a30 <user_proc_a>:
c0001a30:	55                   	push   %ebp
c0001a31:	89 e5                	mov    %esp,%ebp
c0001a33:	83 ec 08             	sub    $0x8,%esp
c0001a36:	83 ec 0c             	sub    $0xc,%esp
c0001a39:	68 a9 9b 00 c0       	push   $0xc0009ba9
c0001a3e:	e8 49 fb ff ff       	call   c000158c <disp_str>
c0001a43:	83 c4 10             	add    $0x10,%esp
c0001a46:	eb fe                	jmp    c0001a46 <user_proc_a+0x16>

c0001a48 <user_proc_b>:
c0001a48:	55                   	push   %ebp
c0001a49:	89 e5                	mov    %esp,%ebp
c0001a4b:	83 ec 08             	sub    $0x8,%esp
c0001a4e:	83 ec 0c             	sub    $0xc,%esp
c0001a51:	68 bb 9b 00 c0       	push   $0xc0009bbb
c0001a56:	e8 31 fb ff ff       	call   c000158c <disp_str>
c0001a5b:	83 c4 10             	add    $0x10,%esp
c0001a5e:	eb fe                	jmp    c0001a5e <user_proc_b+0x16>

c0001a60 <TaskHD>:
c0001a60:	55                   	push   %ebp
c0001a61:	89 e5                	mov    %esp,%ebp
c0001a63:	83 ec 08             	sub    $0x8,%esp
c0001a66:	e8 07 00 00 00       	call   c0001a72 <init_hd>
c0001a6b:	e8 1c 00 00 00       	call   c0001a8c <hd_handle>
c0001a70:	eb f9                	jmp    c0001a6b <TaskHD+0xb>

c0001a72 <init_hd>:
c0001a72:	55                   	push   %ebp
c0001a73:	89 e5                	mov    %esp,%ebp
c0001a75:	83 ec 18             	sub    $0x18,%esp
c0001a78:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001a7f:	e8 d3 fd ff ff       	call   c0001857 <enable_8259A_casecade_irq>
c0001a84:	e8 e2 fd ff ff       	call   c000186b <enable_8259A_slave_winchester_irq>
c0001a89:	90                   	nop
c0001a8a:	c9                   	leave  
c0001a8b:	c3                   	ret    

c0001a8c <hd_handle>:
c0001a8c:	55                   	push   %ebp
c0001a8d:	89 e5                	mov    %esp,%ebp
c0001a8f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001a95:	83 ec 04             	sub    $0x4,%esp
c0001a98:	6a 0e                	push   $0xe
c0001a9a:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0001a9d:	50                   	push   %eax
c0001a9e:	6a 02                	push   $0x2
c0001aa0:	e8 5b 78 00 00       	call   c0009300 <send_rec>
c0001aa5:	83 c4 10             	add    $0x10,%esp
c0001aa8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001aae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001ab2:	0f 84 96 00 00 00    	je     c0001b4e <hd_handle+0xc2>
c0001ab8:	8b 45 84             	mov    -0x7c(%ebp),%eax
c0001abb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001abe:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001ac2:	74 23                	je     c0001ae7 <hd_handle+0x5b>
c0001ac4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001ac8:	77 08                	ja     c0001ad2 <hd_handle+0x46>
c0001aca:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001ace:	74 10                	je     c0001ae0 <hd_handle+0x54>
c0001ad0:	eb 35                	jmp    c0001b07 <hd_handle+0x7b>
c0001ad2:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001ad6:	74 0f                	je     c0001ae7 <hd_handle+0x5b>
c0001ad8:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001adc:	74 1a                	je     c0001af8 <hd_handle+0x6c>
c0001ade:	eb 27                	jmp    c0001b07 <hd_handle+0x7b>
c0001ae0:	e8 18 07 00 00       	call   c00021fd <hd_open>
c0001ae5:	eb 31                	jmp    c0001b18 <hd_handle+0x8c>
c0001ae7:	83 ec 0c             	sub    $0xc,%esp
c0001aea:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0001aed:	50                   	push   %eax
c0001aee:	e8 02 08 00 00       	call   c00022f5 <hd_rdwt>
c0001af3:	83 c4 10             	add    $0x10,%esp
c0001af6:	eb 20                	jmp    c0001b18 <hd_handle+0x8c>
c0001af8:	83 ec 0c             	sub    $0xc,%esp
c0001afb:	6a 00                	push   $0x0
c0001afd:	e8 4a 07 00 00       	call   c000224c <get_hd_ioctl>
c0001b02:	83 c4 10             	add    $0x10,%esp
c0001b05:	eb 11                	jmp    c0001b18 <hd_handle+0x8c>
c0001b07:	83 ec 0c             	sub    $0xc,%esp
c0001b0a:	68 cd 9b 00 c0       	push   $0xc0009bcd
c0001b0f:	e8 25 70 00 00       	call   c0008b39 <spin>
c0001b14:	83 c4 10             	add    $0x10,%esp
c0001b17:	90                   	nop
c0001b18:	83 ec 04             	sub    $0x4,%esp
c0001b1b:	6a 6c                	push   $0x6c
c0001b1d:	6a 00                	push   $0x0
c0001b1f:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0001b22:	50                   	push   %eax
c0001b23:	e8 97 8b 00 00       	call   c000a6bf <Memset>
c0001b28:	83 c4 10             	add    $0x10,%esp
c0001b2b:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
c0001b32:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0001b39:	83 ec 04             	sub    $0x4,%esp
c0001b3c:	6a 03                	push   $0x3
c0001b3e:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0001b41:	50                   	push   %eax
c0001b42:	6a 01                	push   $0x1
c0001b44:	e8 b7 77 00 00       	call   c0009300 <send_rec>
c0001b49:	83 c4 10             	add    $0x10,%esp
c0001b4c:	eb 01                	jmp    c0001b4f <hd_handle+0xc3>
c0001b4e:	90                   	nop
c0001b4f:	c9                   	leave  
c0001b50:	c3                   	ret    

c0001b51 <hd_cmd_out>:
c0001b51:	55                   	push   %ebp
c0001b52:	89 e5                	mov    %esp,%ebp
c0001b54:	83 ec 08             	sub    $0x8,%esp
c0001b57:	83 ec 04             	sub    $0x4,%esp
c0001b5a:	68 98 3a 00 00       	push   $0x3a98
c0001b5f:	6a 00                	push   $0x0
c0001b61:	68 80 00 00 00       	push   $0x80
c0001b66:	e8 e8 09 00 00       	call   c0002553 <waitfor>
c0001b6b:	83 c4 10             	add    $0x10,%esp
c0001b6e:	85 c0                	test   %eax,%eax
c0001b70:	75 10                	jne    c0001b82 <hd_cmd_out+0x31>
c0001b72:	83 ec 0c             	sub    $0xc,%esp
c0001b75:	68 df 9b 00 c0       	push   $0xc0009bdf
c0001b7a:	e8 bf 6f 00 00       	call   c0008b3e <panic>
c0001b7f:	83 c4 10             	add    $0x10,%esp
c0001b82:	83 ec 08             	sub    $0x8,%esp
c0001b85:	6a 00                	push   $0x0
c0001b87:	68 f6 03 00 00       	push   $0x3f6
c0001b8c:	e8 0c fc ff ff       	call   c000179d <out_byte>
c0001b91:	83 c4 10             	add    $0x10,%esp
c0001b94:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b97:	0f b6 00             	movzbl (%eax),%eax
c0001b9a:	0f b6 c0             	movzbl %al,%eax
c0001b9d:	83 ec 08             	sub    $0x8,%esp
c0001ba0:	50                   	push   %eax
c0001ba1:	68 f1 01 00 00       	push   $0x1f1
c0001ba6:	e8 f2 fb ff ff       	call   c000179d <out_byte>
c0001bab:	83 c4 10             	add    $0x10,%esp
c0001bae:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bb1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001bb5:	0f b6 c0             	movzbl %al,%eax
c0001bb8:	83 ec 08             	sub    $0x8,%esp
c0001bbb:	50                   	push   %eax
c0001bbc:	68 f2 01 00 00       	push   $0x1f2
c0001bc1:	e8 d7 fb ff ff       	call   c000179d <out_byte>
c0001bc6:	83 c4 10             	add    $0x10,%esp
c0001bc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bcc:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001bd0:	0f b6 c0             	movzbl %al,%eax
c0001bd3:	83 ec 08             	sub    $0x8,%esp
c0001bd6:	50                   	push   %eax
c0001bd7:	68 f3 01 00 00       	push   $0x1f3
c0001bdc:	e8 bc fb ff ff       	call   c000179d <out_byte>
c0001be1:	83 c4 10             	add    $0x10,%esp
c0001be4:	8b 45 08             	mov    0x8(%ebp),%eax
c0001be7:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001beb:	0f b6 c0             	movzbl %al,%eax
c0001bee:	83 ec 08             	sub    $0x8,%esp
c0001bf1:	50                   	push   %eax
c0001bf2:	68 f4 01 00 00       	push   $0x1f4
c0001bf7:	e8 a1 fb ff ff       	call   c000179d <out_byte>
c0001bfc:	83 c4 10             	add    $0x10,%esp
c0001bff:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c02:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001c06:	0f b6 c0             	movzbl %al,%eax
c0001c09:	83 ec 08             	sub    $0x8,%esp
c0001c0c:	50                   	push   %eax
c0001c0d:	68 f5 01 00 00       	push   $0x1f5
c0001c12:	e8 86 fb ff ff       	call   c000179d <out_byte>
c0001c17:	83 c4 10             	add    $0x10,%esp
c0001c1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c1d:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001c21:	0f b6 c0             	movzbl %al,%eax
c0001c24:	83 ec 08             	sub    $0x8,%esp
c0001c27:	50                   	push   %eax
c0001c28:	68 f6 01 00 00       	push   $0x1f6
c0001c2d:	e8 6b fb ff ff       	call   c000179d <out_byte>
c0001c32:	83 c4 10             	add    $0x10,%esp
c0001c35:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c38:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001c3c:	0f b6 c0             	movzbl %al,%eax
c0001c3f:	83 ec 08             	sub    $0x8,%esp
c0001c42:	50                   	push   %eax
c0001c43:	68 f7 01 00 00       	push   $0x1f7
c0001c48:	e8 50 fb ff ff       	call   c000179d <out_byte>
c0001c4d:	83 c4 10             	add    $0x10,%esp
c0001c50:	90                   	nop
c0001c51:	c9                   	leave  
c0001c52:	c3                   	ret    

c0001c53 <hd_identify>:
c0001c53:	55                   	push   %ebp
c0001c54:	89 e5                	mov    %esp,%ebp
c0001c56:	53                   	push   %ebx
c0001c57:	83 ec 24             	sub    $0x24,%esp
c0001c5a:	89 e0                	mov    %esp,%eax
c0001c5c:	89 c3                	mov    %eax,%ebx
c0001c5e:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001c62:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001c66:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001c6a:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001c6e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001c72:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c75:	c1 e0 04             	shl    $0x4,%eax
c0001c78:	83 c8 e0             	or     $0xffffffe0,%eax
c0001c7b:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001c7e:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001c82:	83 ec 0c             	sub    $0xc,%esp
c0001c85:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001c88:	50                   	push   %eax
c0001c89:	e8 c3 fe ff ff       	call   c0001b51 <hd_cmd_out>
c0001c8e:	83 c4 10             	add    $0x10,%esp
c0001c91:	e8 40 06 00 00       	call   c00022d6 <interrupt_wait>
c0001c96:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001c9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ca0:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001ca3:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001ca6:	89 c2                	mov    %eax,%edx
c0001ca8:	b8 10 00 00 00       	mov    $0x10,%eax
c0001cad:	83 e8 01             	sub    $0x1,%eax
c0001cb0:	01 d0                	add    %edx,%eax
c0001cb2:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001cb7:	ba 00 00 00 00       	mov    $0x0,%edx
c0001cbc:	f7 f1                	div    %ecx
c0001cbe:	6b c0 10             	imul   $0x10,%eax,%eax
c0001cc1:	29 c4                	sub    %eax,%esp
c0001cc3:	89 e0                	mov    %esp,%eax
c0001cc5:	83 c0 00             	add    $0x0,%eax
c0001cc8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001ccb:	83 ec 04             	sub    $0x4,%esp
c0001cce:	ff 75 f4             	pushl  -0xc(%ebp)
c0001cd1:	6a 00                	push   $0x0
c0001cd3:	ff 75 ec             	pushl  -0x14(%ebp)
c0001cd6:	e8 e4 89 00 00       	call   c000a6bf <Memset>
c0001cdb:	83 c4 10             	add    $0x10,%esp
c0001cde:	83 ec 04             	sub    $0x4,%esp
c0001ce1:	ff 75 f4             	pushl  -0xc(%ebp)
c0001ce4:	ff 75 ec             	pushl  -0x14(%ebp)
c0001ce7:	68 f0 01 00 00       	push   $0x1f0
c0001cec:	e8 22 8a 00 00       	call   c000a713 <read_port>
c0001cf1:	83 c4 10             	add    $0x10,%esp
c0001cf4:	83 ec 0c             	sub    $0xc,%esp
c0001cf7:	ff 75 ec             	pushl  -0x14(%ebp)
c0001cfa:	e8 0b 00 00 00       	call   c0001d0a <print_hdinfo>
c0001cff:	83 c4 10             	add    $0x10,%esp
c0001d02:	89 dc                	mov    %ebx,%esp
c0001d04:	90                   	nop
c0001d05:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001d08:	c9                   	leave  
c0001d09:	c3                   	ret    

c0001d0a <print_hdinfo>:
c0001d0a:	55                   	push   %ebp
c0001d0b:	89 e5                	mov    %esp,%ebp
c0001d0d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001d13:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001d19:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001d1f:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001d26:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001d2d:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001d34:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001d3b:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001d42:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001d48:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001d4e:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001d55:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001d5c:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001d63:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001d6a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001d71:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001d78:	e9 8f 00 00 00       	jmp    c0001e0c <print_hdinfo+0x102>
c0001d7d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001d84:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001d87:	89 d0                	mov    %edx,%eax
c0001d89:	01 c0                	add    %eax,%eax
c0001d8b:	01 d0                	add    %edx,%eax
c0001d8d:	c1 e0 03             	shl    $0x3,%eax
c0001d90:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001d93:	01 c8                	add    %ecx,%eax
c0001d95:	83 e8 44             	sub    $0x44,%eax
c0001d98:	0f b7 00             	movzwl (%eax),%eax
c0001d9b:	0f b7 c0             	movzwl %ax,%eax
c0001d9e:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001da1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001da4:	01 d0                	add    %edx,%eax
c0001da6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001da9:	eb 30                	jmp    c0001ddb <print_hdinfo+0xd1>
c0001dab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001dae:	8d 50 01             	lea    0x1(%eax),%edx
c0001db1:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001db4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001db7:	83 c2 01             	add    $0x1,%edx
c0001dba:	0f b6 00             	movzbl (%eax),%eax
c0001dbd:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001dc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001dc4:	8d 50 01             	lea    0x1(%eax),%edx
c0001dc7:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001dca:	0f b6 00             	movzbl (%eax),%eax
c0001dcd:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001dd0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001dd3:	01 ca                	add    %ecx,%edx
c0001dd5:	88 02                	mov    %al,(%edx)
c0001dd7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001ddb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001dde:	89 d0                	mov    %edx,%eax
c0001de0:	01 c0                	add    %eax,%eax
c0001de2:	01 d0                	add    %edx,%eax
c0001de4:	c1 e0 03             	shl    $0x3,%eax
c0001de7:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001dea:	01 c8                	add    %ecx,%eax
c0001dec:	83 e8 42             	sub    $0x42,%eax
c0001def:	0f b7 00             	movzwl (%eax),%eax
c0001df2:	66 d1 e8             	shr    %ax
c0001df5:	0f b7 c0             	movzwl %ax,%eax
c0001df8:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001dfb:	7c ae                	jl     c0001dab <print_hdinfo+0xa1>
c0001dfd:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001e00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001e03:	01 d0                	add    %edx,%eax
c0001e05:	c6 00 00             	movb   $0x0,(%eax)
c0001e08:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001e0c:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001e10:	0f 8e 67 ff ff ff    	jle    c0001d7d <print_hdinfo+0x73>
c0001e16:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e19:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001e1d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001e21:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001e25:	66 c1 e8 08          	shr    $0x8,%ax
c0001e29:	66 85 c0             	test   %ax,%ax
c0001e2c:	0f 95 c0             	setne  %al
c0001e2f:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001e32:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001e39:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001e3f:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001e43:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001e47:	75 15                	jne    c0001e5e <print_hdinfo+0x154>
c0001e49:	83 ec 08             	sub    $0x8,%esp
c0001e4c:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001e4f:	50                   	push   %eax
c0001e50:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001e53:	50                   	push   %eax
c0001e54:	e8 85 88 00 00       	call   c000a6de <Strcpy>
c0001e59:	83 c4 10             	add    $0x10,%esp
c0001e5c:	eb 13                	jmp    c0001e71 <print_hdinfo+0x167>
c0001e5e:	83 ec 08             	sub    $0x8,%esp
c0001e61:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001e64:	50                   	push   %eax
c0001e65:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001e68:	50                   	push   %eax
c0001e69:	e8 70 88 00 00       	call   c000a6de <Strcpy>
c0001e6e:	83 c4 10             	add    $0x10,%esp
c0001e71:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e74:	83 c0 7a             	add    $0x7a,%eax
c0001e77:	0f b7 00             	movzwl (%eax),%eax
c0001e7a:	0f b7 d0             	movzwl %ax,%edx
c0001e7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e80:	83 c0 78             	add    $0x78,%eax
c0001e83:	0f b7 00             	movzwl (%eax),%eax
c0001e86:	0f b7 c0             	movzwl %ax,%eax
c0001e89:	83 c0 10             	add    $0x10,%eax
c0001e8c:	89 c1                	mov    %eax,%ecx
c0001e8e:	d3 e2                	shl    %cl,%edx
c0001e90:	89 d0                	mov    %edx,%eax
c0001e92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001e95:	90                   	nop
c0001e96:	c9                   	leave  
c0001e97:	c3                   	ret    

c0001e98 <print_dpt_entry>:
c0001e98:	55                   	push   %ebp
c0001e99:	89 e5                	mov    %esp,%ebp
c0001e9b:	83 ec 08             	sub    $0x8,%esp
c0001e9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ea1:	8b 40 08             	mov    0x8(%eax),%eax
c0001ea4:	83 ec 08             	sub    $0x8,%esp
c0001ea7:	50                   	push   %eax
c0001ea8:	68 e9 9b 00 c0       	push   $0xc0009be9
c0001ead:	e8 5d 69 00 00       	call   c000880f <Printf>
c0001eb2:	83 c4 10             	add    $0x10,%esp
c0001eb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001eb8:	8b 40 0c             	mov    0xc(%eax),%eax
c0001ebb:	83 ec 08             	sub    $0x8,%esp
c0001ebe:	50                   	push   %eax
c0001ebf:	68 f1 9b 00 c0       	push   $0xc0009bf1
c0001ec4:	e8 46 69 00 00       	call   c000880f <Printf>
c0001ec9:	83 c4 10             	add    $0x10,%esp
c0001ecc:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ecf:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001ed3:	0f b6 c0             	movzbl %al,%eax
c0001ed6:	83 ec 08             	sub    $0x8,%esp
c0001ed9:	50                   	push   %eax
c0001eda:	68 02 9c 00 c0       	push   $0xc0009c02
c0001edf:	e8 2b 69 00 00       	call   c000880f <Printf>
c0001ee4:	83 c4 10             	add    $0x10,%esp
c0001ee7:	8b 45 08             	mov    0x8(%ebp),%eax
c0001eea:	0f b6 00             	movzbl (%eax),%eax
c0001eed:	0f b6 c0             	movzbl %al,%eax
c0001ef0:	83 ec 08             	sub    $0x8,%esp
c0001ef3:	50                   	push   %eax
c0001ef4:	68 10 9c 00 c0       	push   $0xc0009c10
c0001ef9:	e8 11 69 00 00       	call   c000880f <Printf>
c0001efe:	83 c4 10             	add    $0x10,%esp
c0001f01:	90                   	nop
c0001f02:	c9                   	leave  
c0001f03:	c3                   	ret    

c0001f04 <get_partition_table>:
c0001f04:	55                   	push   %ebp
c0001f05:	89 e5                	mov    %esp,%ebp
c0001f07:	53                   	push   %ebx
c0001f08:	83 ec 24             	sub    $0x24,%esp
c0001f0b:	89 e0                	mov    %esp,%eax
c0001f0d:	89 c3                	mov    %eax,%ebx
c0001f0f:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001f13:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001f17:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f1a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001f1d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f20:	c1 f8 08             	sar    $0x8,%eax
c0001f23:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001f26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f29:	c1 f8 10             	sar    $0x10,%eax
c0001f2c:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001f2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001f32:	c1 f8 18             	sar    $0x18,%eax
c0001f35:	89 c2                	mov    %eax,%edx
c0001f37:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f3a:	c1 e0 04             	shl    $0x4,%eax
c0001f3d:	09 d0                	or     %edx,%eax
c0001f3f:	83 c8 e0             	or     $0xffffffe0,%eax
c0001f42:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001f45:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001f49:	83 ec 0c             	sub    $0xc,%esp
c0001f4c:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001f4f:	50                   	push   %eax
c0001f50:	e8 fc fb ff ff       	call   c0001b51 <hd_cmd_out>
c0001f55:	83 c4 10             	add    $0x10,%esp
c0001f58:	e8 79 03 00 00       	call   c00022d6 <interrupt_wait>
c0001f5d:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001f64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f67:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001f6a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001f6d:	89 c2                	mov    %eax,%edx
c0001f6f:	b8 10 00 00 00       	mov    $0x10,%eax
c0001f74:	83 e8 01             	sub    $0x1,%eax
c0001f77:	01 d0                	add    %edx,%eax
c0001f79:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001f7e:	ba 00 00 00 00       	mov    $0x0,%edx
c0001f83:	f7 f1                	div    %ecx
c0001f85:	6b c0 10             	imul   $0x10,%eax,%eax
c0001f88:	29 c4                	sub    %eax,%esp
c0001f8a:	89 e0                	mov    %esp,%eax
c0001f8c:	83 c0 00             	add    $0x0,%eax
c0001f8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001f92:	83 ec 04             	sub    $0x4,%esp
c0001f95:	ff 75 f4             	pushl  -0xc(%ebp)
c0001f98:	6a 00                	push   $0x0
c0001f9a:	ff 75 ec             	pushl  -0x14(%ebp)
c0001f9d:	e8 1d 87 00 00       	call   c000a6bf <Memset>
c0001fa2:	83 c4 10             	add    $0x10,%esp
c0001fa5:	83 ec 04             	sub    $0x4,%esp
c0001fa8:	ff 75 f4             	pushl  -0xc(%ebp)
c0001fab:	ff 75 ec             	pushl  -0x14(%ebp)
c0001fae:	68 f0 01 00 00       	push   $0x1f0
c0001fb3:	e8 5b 87 00 00       	call   c000a713 <read_port>
c0001fb8:	83 c4 10             	add    $0x10,%esp
c0001fbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001fbe:	05 be 01 00 00       	add    $0x1be,%eax
c0001fc3:	83 ec 04             	sub    $0x4,%esp
c0001fc6:	6a 40                	push   $0x40
c0001fc8:	50                   	push   %eax
c0001fc9:	ff 75 10             	pushl  0x10(%ebp)
c0001fcc:	e8 c0 86 00 00       	call   c000a691 <Memcpy>
c0001fd1:	83 c4 10             	add    $0x10,%esp
c0001fd4:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001fdb:	89 dc                	mov    %ebx,%esp
c0001fdd:	90                   	nop
c0001fde:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001fe1:	c9                   	leave  
c0001fe2:	c3                   	ret    

c0001fe3 <partition>:
c0001fe3:	55                   	push   %ebp
c0001fe4:	89 e5                	mov    %esp,%ebp
c0001fe6:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001fec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fef:	88 45 84             	mov    %al,-0x7c(%ebp)
c0001ff2:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001ff6:	7f 19                	jg     c0002011 <partition+0x2e>
c0001ff8:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001ffb:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002000:	89 c8                	mov    %ecx,%eax
c0002002:	f7 ea                	imul   %edx
c0002004:	d1 fa                	sar    %edx
c0002006:	89 c8                	mov    %ecx,%eax
c0002008:	c1 f8 1f             	sar    $0x1f,%eax
c000200b:	29 c2                	sub    %eax,%edx
c000200d:	89 d0                	mov    %edx,%eax
c000200f:	eb 11                	jmp    c0002022 <partition+0x3f>
c0002011:	8b 45 08             	mov    0x8(%ebp),%eax
c0002014:	83 e8 10             	sub    $0x10,%eax
c0002017:	8d 50 3f             	lea    0x3f(%eax),%edx
c000201a:	85 c0                	test   %eax,%eax
c000201c:	0f 48 c2             	cmovs  %edx,%eax
c000201f:	c1 f8 06             	sar    $0x6,%eax
c0002022:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002025:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0002029:	0f 85 cc 00 00 00    	jne    c00020fb <partition+0x118>
c000202f:	83 ec 04             	sub    $0x4,%esp
c0002032:	6a 40                	push   $0x40
c0002034:	6a 00                	push   $0x0
c0002036:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002039:	50                   	push   %eax
c000203a:	e8 80 86 00 00       	call   c000a6bf <Memset>
c000203f:	83 c4 10             	add    $0x10,%esp
c0002042:	83 ec 04             	sub    $0x4,%esp
c0002045:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002048:	50                   	push   %eax
c0002049:	6a 00                	push   $0x0
c000204b:	ff 75 e8             	pushl  -0x18(%ebp)
c000204e:	e8 b1 fe ff ff       	call   c0001f04 <get_partition_table>
c0002053:	83 c4 10             	add    $0x10,%esp
c0002056:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000205d:	e9 8a 00 00 00       	jmp    c00020ec <partition+0x109>
c0002062:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002065:	83 c0 01             	add    $0x1,%eax
c0002068:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000206b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000206e:	c1 e0 04             	shl    $0x4,%eax
c0002071:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002074:	01 c8                	add    %ecx,%eax
c0002076:	83 e8 5c             	sub    $0x5c,%eax
c0002079:	8b 00                	mov    (%eax),%eax
c000207b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c000207e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002081:	c1 e1 03             	shl    $0x3,%ecx
c0002084:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000208a:	01 ca                	add    %ecx,%edx
c000208c:	81 c2 64 0f 01 c0    	add    $0xc0010f64,%edx
c0002092:	89 02                	mov    %eax,(%edx)
c0002094:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002097:	c1 e0 04             	shl    $0x4,%eax
c000209a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000209d:	01 c8                	add    %ecx,%eax
c000209f:	83 e8 58             	sub    $0x58,%eax
c00020a2:	8b 00                	mov    (%eax),%eax
c00020a4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00020a7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00020aa:	c1 e1 03             	shl    $0x3,%ecx
c00020ad:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00020b3:	01 ca                	add    %ecx,%edx
c00020b5:	81 c2 68 0f 01 c0    	add    $0xc0010f68,%edx
c00020bb:	89 02                	mov    %eax,(%edx)
c00020bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00020c0:	c1 e0 04             	shl    $0x4,%eax
c00020c3:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00020c6:	01 c8                	add    %ecx,%eax
c00020c8:	83 e8 60             	sub    $0x60,%eax
c00020cb:	0f b6 00             	movzbl (%eax),%eax
c00020ce:	3c 05                	cmp    $0x5,%al
c00020d0:	75 16                	jne    c00020e8 <partition+0x105>
c00020d2:	8b 55 08             	mov    0x8(%ebp),%edx
c00020d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00020d8:	01 d0                	add    %edx,%eax
c00020da:	83 ec 08             	sub    $0x8,%esp
c00020dd:	6a 01                	push   $0x1
c00020df:	50                   	push   %eax
c00020e0:	e8 fe fe ff ff       	call   c0001fe3 <partition>
c00020e5:	83 c4 10             	add    $0x10,%esp
c00020e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00020ec:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00020f0:	0f 8e 6c ff ff ff    	jle    c0002062 <partition+0x7f>
c00020f6:	e9 ff 00 00 00       	jmp    c00021fa <partition+0x217>
c00020fb:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c00020ff:	0f 85 f5 00 00 00    	jne    c00021fa <partition+0x217>
c0002105:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002108:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000210d:	89 c8                	mov    %ecx,%eax
c000210f:	f7 ea                	imul   %edx
c0002111:	d1 fa                	sar    %edx
c0002113:	89 c8                	mov    %ecx,%eax
c0002115:	c1 f8 1f             	sar    $0x1f,%eax
c0002118:	29 c2                	sub    %eax,%edx
c000211a:	89 d0                	mov    %edx,%eax
c000211c:	c1 e0 02             	shl    $0x2,%eax
c000211f:	01 d0                	add    %edx,%eax
c0002121:	29 c1                	sub    %eax,%ecx
c0002123:	89 c8                	mov    %ecx,%eax
c0002125:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002128:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000212b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000212e:	c1 e2 03             	shl    $0x3,%edx
c0002131:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002137:	01 d0                	add    %edx,%eax
c0002139:	05 64 0f 01 c0       	add    $0xc0010f64,%eax
c000213e:	8b 00                	mov    (%eax),%eax
c0002140:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002143:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002146:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002149:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000214c:	83 e8 01             	sub    $0x1,%eax
c000214f:	c1 e0 04             	shl    $0x4,%eax
c0002152:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002155:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000215c:	e9 8c 00 00 00       	jmp    c00021ed <partition+0x20a>
c0002161:	83 ec 04             	sub    $0x4,%esp
c0002164:	6a 40                	push   $0x40
c0002166:	6a 00                	push   $0x0
c0002168:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000216b:	50                   	push   %eax
c000216c:	e8 4e 85 00 00       	call   c000a6bf <Memset>
c0002171:	83 c4 10             	add    $0x10,%esp
c0002174:	83 ec 04             	sub    $0x4,%esp
c0002177:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000217a:	50                   	push   %eax
c000217b:	ff 75 f0             	pushl  -0x10(%ebp)
c000217e:	ff 75 e8             	pushl  -0x18(%ebp)
c0002181:	e8 7e fd ff ff       	call   c0001f04 <get_partition_table>
c0002186:	83 c4 10             	add    $0x10,%esp
c0002189:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000218c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000218f:	01 d0                	add    %edx,%eax
c0002191:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0002194:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0002197:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000219a:	01 c2                	add    %eax,%edx
c000219c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000219f:	8d 48 04             	lea    0x4(%eax),%ecx
c00021a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00021a5:	c1 e1 03             	shl    $0x3,%ecx
c00021a8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021ae:	01 c8                	add    %ecx,%eax
c00021b0:	05 64 0f 01 c0       	add    $0xc0010f64,%eax
c00021b5:	89 10                	mov    %edx,(%eax)
c00021b7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00021ba:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00021bd:	8d 4a 04             	lea    0x4(%edx),%ecx
c00021c0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021c3:	c1 e1 03             	shl    $0x3,%ecx
c00021c6:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021cc:	01 ca                	add    %ecx,%edx
c00021ce:	81 c2 68 0f 01 c0    	add    $0xc0010f68,%edx
c00021d4:	89 02                	mov    %eax,(%edx)
c00021d6:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c00021da:	84 c0                	test   %al,%al
c00021dc:	74 1b                	je     c00021f9 <partition+0x216>
c00021de:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00021e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00021e4:	01 d0                	add    %edx,%eax
c00021e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00021e9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00021ed:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c00021f1:	0f 8e 6a ff ff ff    	jle    c0002161 <partition+0x17e>
c00021f7:	eb 01                	jmp    c00021fa <partition+0x217>
c00021f9:	90                   	nop
c00021fa:	90                   	nop
c00021fb:	c9                   	leave  
c00021fc:	c3                   	ret    

c00021fd <hd_open>:
c00021fd:	55                   	push   %ebp
c00021fe:	89 e5                	mov    %esp,%ebp
c0002200:	83 ec 18             	sub    $0x18,%esp
c0002203:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000220a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000220d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002213:	05 60 0f 01 c0       	add    $0xc0010f60,%eax
c0002218:	8b 00                	mov    (%eax),%eax
c000221a:	8d 50 01             	lea    0x1(%eax),%edx
c000221d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002220:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002226:	05 60 0f 01 c0       	add    $0xc0010f60,%eax
c000222b:	89 10                	mov    %edx,(%eax)
c000222d:	83 ec 0c             	sub    $0xc,%esp
c0002230:	6a 00                	push   $0x0
c0002232:	e8 1c fa ff ff       	call   c0001c53 <hd_identify>
c0002237:	83 c4 10             	add    $0x10,%esp
c000223a:	83 ec 08             	sub    $0x8,%esp
c000223d:	6a 00                	push   $0x0
c000223f:	6a 00                	push   $0x0
c0002241:	e8 9d fd ff ff       	call   c0001fe3 <partition>
c0002246:	83 c4 10             	add    $0x10,%esp
c0002249:	90                   	nop
c000224a:	c9                   	leave  
c000224b:	c3                   	ret    

c000224c <get_hd_ioctl>:
c000224c:	55                   	push   %ebp
c000224d:	89 e5                	mov    %esp,%ebp
c000224f:	83 ec 10             	sub    $0x10,%esp
c0002252:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002256:	7f 19                	jg     c0002271 <get_hd_ioctl+0x25>
c0002258:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000225b:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002260:	89 c8                	mov    %ecx,%eax
c0002262:	f7 ea                	imul   %edx
c0002264:	d1 fa                	sar    %edx
c0002266:	89 c8                	mov    %ecx,%eax
c0002268:	c1 f8 1f             	sar    $0x1f,%eax
c000226b:	29 c2                	sub    %eax,%edx
c000226d:	89 d0                	mov    %edx,%eax
c000226f:	eb 11                	jmp    c0002282 <get_hd_ioctl+0x36>
c0002271:	8b 45 08             	mov    0x8(%ebp),%eax
c0002274:	83 e8 10             	sub    $0x10,%eax
c0002277:	8d 50 3f             	lea    0x3f(%eax),%edx
c000227a:	85 c0                	test   %eax,%eax
c000227c:	0f 48 c2             	cmovs  %edx,%eax
c000227f:	c1 f8 06             	sar    $0x6,%eax
c0002282:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0002285:	8b 55 08             	mov    0x8(%ebp),%edx
c0002288:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000228b:	c1 e2 03             	shl    $0x3,%edx
c000228e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002294:	01 d0                	add    %edx,%eax
c0002296:	05 68 0f 01 c0       	add    $0xc0010f68,%eax
c000229b:	8b 00                	mov    (%eax),%eax
c000229d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00022a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00022a3:	c9                   	leave  
c00022a4:	c3                   	ret    

c00022a5 <wait_for>:
c00022a5:	55                   	push   %ebp
c00022a6:	89 e5                	mov    %esp,%ebp
c00022a8:	83 ec 08             	sub    $0x8,%esp
c00022ab:	83 ec 04             	sub    $0x4,%esp
c00022ae:	68 40 42 0f 00       	push   $0xf4240
c00022b3:	6a 08                	push   $0x8
c00022b5:	6a 08                	push   $0x8
c00022b7:	e8 97 02 00 00       	call   c0002553 <waitfor>
c00022bc:	83 c4 10             	add    $0x10,%esp
c00022bf:	85 c0                	test   %eax,%eax
c00022c1:	75 10                	jne    c00022d3 <wait_for+0x2e>
c00022c3:	83 ec 0c             	sub    $0xc,%esp
c00022c6:	68 1b 9c 00 c0       	push   $0xc0009c1b
c00022cb:	e8 6e 68 00 00       	call   c0008b3e <panic>
c00022d0:	83 c4 10             	add    $0x10,%esp
c00022d3:	90                   	nop
c00022d4:	c9                   	leave  
c00022d5:	c3                   	ret    

c00022d6 <interrupt_wait>:
c00022d6:	55                   	push   %ebp
c00022d7:	89 e5                	mov    %esp,%ebp
c00022d9:	83 ec 78             	sub    $0x78,%esp
c00022dc:	83 ec 04             	sub    $0x4,%esp
c00022df:	68 13 02 00 00       	push   $0x213
c00022e4:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00022e7:	50                   	push   %eax
c00022e8:	6a 02                	push   $0x2
c00022ea:	e8 11 70 00 00       	call   c0009300 <send_rec>
c00022ef:	83 c4 10             	add    $0x10,%esp
c00022f2:	90                   	nop
c00022f3:	c9                   	leave  
c00022f4:	c3                   	ret    

c00022f5 <hd_rdwt>:
c00022f5:	55                   	push   %ebp
c00022f6:	89 e5                	mov    %esp,%ebp
c00022f8:	83 ec 48             	sub    $0x48,%esp
c00022fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00022fe:	8b 40 18             	mov    0x18(%eax),%eax
c0002301:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002304:	8b 45 08             	mov    0x8(%ebp),%eax
c0002307:	8b 40 14             	mov    0x14(%eax),%eax
c000230a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000230d:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002311:	7f 19                	jg     c000232c <hd_rdwt+0x37>
c0002313:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002316:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000231b:	89 c8                	mov    %ecx,%eax
c000231d:	f7 ea                	imul   %edx
c000231f:	d1 fa                	sar    %edx
c0002321:	89 c8                	mov    %ecx,%eax
c0002323:	c1 f8 1f             	sar    $0x1f,%eax
c0002326:	29 c2                	sub    %eax,%edx
c0002328:	89 d0                	mov    %edx,%eax
c000232a:	eb 11                	jmp    c000233d <hd_rdwt+0x48>
c000232c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000232f:	83 e8 10             	sub    $0x10,%eax
c0002332:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002335:	85 c0                	test   %eax,%eax
c0002337:	0f 48 c2             	cmovs  %edx,%eax
c000233a:	c1 f8 06             	sar    $0x6,%eax
c000233d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002340:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002343:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002346:	89 d0                	mov    %edx,%eax
c0002348:	c1 f8 1f             	sar    $0x1f,%eax
c000234b:	c1 e8 1a             	shr    $0x1a,%eax
c000234e:	01 c2                	add    %eax,%edx
c0002350:	83 e2 3f             	and    $0x3f,%edx
c0002353:	29 c2                	sub    %eax,%edx
c0002355:	89 d0                	mov    %edx,%eax
c0002357:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000235a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000235d:	c1 e8 09             	shr    $0x9,%eax
c0002360:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002363:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002367:	7f 1a                	jg     c0002383 <hd_rdwt+0x8e>
c0002369:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000236c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000236f:	c1 e2 03             	shl    $0x3,%edx
c0002372:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002378:	01 d0                	add    %edx,%eax
c000237a:	05 64 0f 01 c0       	add    $0xc0010f64,%eax
c000237f:	8b 00                	mov    (%eax),%eax
c0002381:	eb 1b                	jmp    c000239e <hd_rdwt+0xa9>
c0002383:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002386:	8d 50 04             	lea    0x4(%eax),%edx
c0002389:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000238c:	c1 e2 03             	shl    $0x3,%edx
c000238f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002395:	01 d0                	add    %edx,%eax
c0002397:	05 64 0f 01 c0       	add    $0xc0010f64,%eax
c000239c:	8b 00                	mov    (%eax),%eax
c000239e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00023a1:	01 d0                	add    %edx,%eax
c00023a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00023a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00023a9:	8b 40 0c             	mov    0xc(%eax),%eax
c00023ac:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00023af:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00023b2:	05 ff 01 00 00       	add    $0x1ff,%eax
c00023b7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00023bd:	85 c0                	test   %eax,%eax
c00023bf:	0f 48 c2             	cmovs  %edx,%eax
c00023c2:	c1 f8 09             	sar    $0x9,%eax
c00023c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00023c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00023cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00023ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00023d1:	8b 40 10             	mov    0x10(%eax),%eax
c00023d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00023d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00023da:	8b 00                	mov    (%eax),%eax
c00023dc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00023df:	83 ec 08             	sub    $0x8,%esp
c00023e2:	ff 75 d0             	pushl  -0x30(%ebp)
c00023e5:	ff 75 cc             	pushl  -0x34(%ebp)
c00023e8:	e8 91 24 00 00       	call   c000487e <v2l>
c00023ed:	83 c4 10             	add    $0x10,%esp
c00023f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00023f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00023f6:	8b 40 68             	mov    0x68(%eax),%eax
c00023f9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00023fc:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002400:	74 22                	je     c0002424 <hd_rdwt+0x12f>
c0002402:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002406:	74 1c                	je     c0002424 <hd_rdwt+0x12f>
c0002408:	68 a0 01 00 00       	push   $0x1a0
c000240d:	68 2d 9c 00 c0       	push   $0xc0009c2d
c0002412:	68 2d 9c 00 c0       	push   $0xc0009c2d
c0002417:	68 35 9c 00 c0       	push   $0xc0009c35
c000241c:	e8 3b 67 00 00       	call   c0008b5c <assertion_failure>
c0002421:	83 c4 10             	add    $0x10,%esp
c0002424:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0002428:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000242b:	88 45 be             	mov    %al,-0x42(%ebp)
c000242e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002431:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002434:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002437:	c1 f8 08             	sar    $0x8,%eax
c000243a:	88 45 c0             	mov    %al,-0x40(%ebp)
c000243d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002440:	c1 f8 10             	sar    $0x10,%eax
c0002443:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002446:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002449:	c1 f8 18             	sar    $0x18,%eax
c000244c:	83 e0 0f             	and    $0xf,%eax
c000244f:	83 c8 e0             	or     $0xffffffe0,%eax
c0002452:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002455:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002459:	75 07                	jne    c0002462 <hd_rdwt+0x16d>
c000245b:	b8 20 00 00 00       	mov    $0x20,%eax
c0002460:	eb 05                	jmp    c0002467 <hd_rdwt+0x172>
c0002462:	b8 30 00 00 00       	mov    $0x30,%eax
c0002467:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000246a:	83 ec 0c             	sub    $0xc,%esp
c000246d:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0002470:	50                   	push   %eax
c0002471:	e8 db f6 ff ff       	call   c0001b51 <hd_cmd_out>
c0002476:	83 c4 10             	add    $0x10,%esp
c0002479:	e9 9c 00 00 00       	jmp    c000251a <hd_rdwt+0x225>
c000247e:	b8 00 02 00 00       	mov    $0x200,%eax
c0002483:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c000248a:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c000248e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0002491:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002495:	75 51                	jne    c00024e8 <hd_rdwt+0x1f3>
c0002497:	e8 09 fe ff ff       	call   c00022a5 <wait_for>
c000249c:	e8 35 fe ff ff       	call   c00022d6 <interrupt_wait>
c00024a1:	83 ec 04             	sub    $0x4,%esp
c00024a4:	ff 75 c4             	pushl  -0x3c(%ebp)
c00024a7:	6a 00                	push   $0x0
c00024a9:	68 a0 11 01 c0       	push   $0xc00111a0
c00024ae:	e8 0c 82 00 00       	call   c000a6bf <Memset>
c00024b3:	83 c4 10             	add    $0x10,%esp
c00024b6:	83 ec 04             	sub    $0x4,%esp
c00024b9:	68 00 02 00 00       	push   $0x200
c00024be:	68 a0 11 01 c0       	push   $0xc00111a0
c00024c3:	68 f0 01 00 00       	push   $0x1f0
c00024c8:	e8 46 82 00 00       	call   c000a713 <read_port>
c00024cd:	83 c4 10             	add    $0x10,%esp
c00024d0:	83 ec 04             	sub    $0x4,%esp
c00024d3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00024d6:	68 a0 11 01 c0       	push   $0xc00111a0
c00024db:	ff 75 f0             	pushl  -0x10(%ebp)
c00024de:	e8 ae 81 00 00       	call   c000a691 <Memcpy>
c00024e3:	83 c4 10             	add    $0x10,%esp
c00024e6:	eb 26                	jmp    c000250e <hd_rdwt+0x219>
c00024e8:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00024ec:	75 20                	jne    c000250e <hd_rdwt+0x219>
c00024ee:	e8 b2 fd ff ff       	call   c00022a5 <wait_for>
c00024f3:	83 ec 04             	sub    $0x4,%esp
c00024f6:	ff 75 c4             	pushl  -0x3c(%ebp)
c00024f9:	ff 75 f0             	pushl  -0x10(%ebp)
c00024fc:	68 f0 01 00 00       	push   $0x1f0
c0002501:	e8 21 82 00 00       	call   c000a727 <write_port>
c0002506:	83 c4 10             	add    $0x10,%esp
c0002509:	e8 c8 fd ff ff       	call   c00022d6 <interrupt_wait>
c000250e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002511:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002514:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002517:	01 45 f0             	add    %eax,-0x10(%ebp)
c000251a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000251e:	0f 85 5a ff ff ff    	jne    c000247e <hd_rdwt+0x189>
c0002524:	90                   	nop
c0002525:	c9                   	leave  
c0002526:	c3                   	ret    

c0002527 <hd_handler>:
c0002527:	55                   	push   %ebp
c0002528:	89 e5                	mov    %esp,%ebp
c000252a:	83 ec 18             	sub    $0x18,%esp
c000252d:	83 ec 0c             	sub    $0xc,%esp
c0002530:	68 f7 01 00 00       	push   $0x1f7
c0002535:	e8 57 f2 ff ff       	call   c0001791 <in_byte>
c000253a:	83 c4 10             	add    $0x10,%esp
c000253d:	0f b6 c0             	movzbl %al,%eax
c0002540:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002543:	83 ec 0c             	sub    $0xc,%esp
c0002546:	6a 02                	push   $0x2
c0002548:	e8 e6 6f 00 00       	call   c0009533 <inform_int>
c000254d:	83 c4 10             	add    $0x10,%esp
c0002550:	90                   	nop
c0002551:	c9                   	leave  
c0002552:	c3                   	ret    

c0002553 <waitfor>:
c0002553:	55                   	push   %ebp
c0002554:	89 e5                	mov    %esp,%ebp
c0002556:	83 ec 18             	sub    $0x18,%esp
c0002559:	e8 ce 6e 00 00       	call   c000942c <get_ticks_ipc>
c000255e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002561:	eb 22                	jmp    c0002585 <waitfor+0x32>
c0002563:	83 ec 0c             	sub    $0xc,%esp
c0002566:	68 f7 01 00 00       	push   $0x1f7
c000256b:	e8 21 f2 ff ff       	call   c0001791 <in_byte>
c0002570:	83 c4 10             	add    $0x10,%esp
c0002573:	0f b6 c0             	movzbl %al,%eax
c0002576:	23 45 08             	and    0x8(%ebp),%eax
c0002579:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000257c:	75 07                	jne    c0002585 <waitfor+0x32>
c000257e:	b8 01 00 00 00       	mov    $0x1,%eax
c0002583:	eb 1d                	jmp    c00025a2 <waitfor+0x4f>
c0002585:	e8 a2 6e 00 00       	call   c000942c <get_ticks_ipc>
c000258a:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000258d:	89 c2                	mov    %eax,%edx
c000258f:	89 d0                	mov    %edx,%eax
c0002591:	c1 e0 02             	shl    $0x2,%eax
c0002594:	01 d0                	add    %edx,%eax
c0002596:	01 c0                	add    %eax,%eax
c0002598:	39 45 10             	cmp    %eax,0x10(%ebp)
c000259b:	7f c6                	jg     c0002563 <waitfor+0x10>
c000259d:	b8 00 00 00 00       	mov    $0x0,%eax
c00025a2:	c9                   	leave  
c00025a3:	c3                   	ret    

c00025a4 <print_hd_info>:
c00025a4:	55                   	push   %ebp
c00025a5:	89 e5                	mov    %esp,%ebp
c00025a7:	83 ec 18             	sub    $0x18,%esp
c00025aa:	83 ec 0c             	sub    $0xc,%esp
c00025ad:	68 53 9c 00 c0       	push   $0xc0009c53
c00025b2:	e8 58 62 00 00       	call   c000880f <Printf>
c00025b7:	83 c4 10             	add    $0x10,%esp
c00025ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00025c1:	eb 3b                	jmp    c00025fe <print_hd_info+0x5a>
c00025c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025c6:	8b 04 c5 68 0f 01 c0 	mov    -0x3ffef098(,%eax,8),%eax
c00025cd:	85 c0                	test   %eax,%eax
c00025cf:	74 28                	je     c00025f9 <print_hd_info+0x55>
c00025d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025d4:	8b 14 c5 68 0f 01 c0 	mov    -0x3ffef098(,%eax,8),%edx
c00025db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025de:	8b 04 c5 64 0f 01 c0 	mov    -0x3ffef09c(,%eax,8),%eax
c00025e5:	ff 75 f4             	pushl  -0xc(%ebp)
c00025e8:	52                   	push   %edx
c00025e9:	50                   	push   %eax
c00025ea:	68 70 9c 00 c0       	push   $0xc0009c70
c00025ef:	e8 1b 62 00 00       	call   c000880f <Printf>
c00025f4:	83 c4 10             	add    $0x10,%esp
c00025f7:	eb 01                	jmp    c00025fa <print_hd_info+0x56>
c00025f9:	90                   	nop
c00025fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00025fe:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002602:	7e bf                	jle    c00025c3 <print_hd_info+0x1f>
c0002604:	83 ec 0c             	sub    $0xc,%esp
c0002607:	68 88 9c 00 c0       	push   $0xc0009c88
c000260c:	e8 fe 61 00 00       	call   c000880f <Printf>
c0002611:	83 c4 10             	add    $0x10,%esp
c0002614:	83 ec 0c             	sub    $0xc,%esp
c0002617:	68 a3 9c 00 c0       	push   $0xc0009ca3
c000261c:	e8 ee 61 00 00       	call   c000880f <Printf>
c0002621:	83 c4 10             	add    $0x10,%esp
c0002624:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c000262b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002632:	eb 44                	jmp    c0002678 <print_hd_info+0xd4>
c0002634:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002637:	83 c0 04             	add    $0x4,%eax
c000263a:	8b 04 c5 68 0f 01 c0 	mov    -0x3ffef098(,%eax,8),%eax
c0002641:	85 c0                	test   %eax,%eax
c0002643:	74 2e                	je     c0002673 <print_hd_info+0xcf>
c0002645:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002648:	83 c0 04             	add    $0x4,%eax
c000264b:	8b 14 c5 68 0f 01 c0 	mov    -0x3ffef098(,%eax,8),%edx
c0002652:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002655:	83 c0 04             	add    $0x4,%eax
c0002658:	8b 04 c5 64 0f 01 c0 	mov    -0x3ffef09c(,%eax,8),%eax
c000265f:	ff 75 f0             	pushl  -0x10(%ebp)
c0002662:	52                   	push   %edx
c0002663:	50                   	push   %eax
c0002664:	68 70 9c 00 c0       	push   $0xc0009c70
c0002669:	e8 a1 61 00 00       	call   c000880f <Printf>
c000266e:	83 c4 10             	add    $0x10,%esp
c0002671:	eb 01                	jmp    c0002674 <print_hd_info+0xd0>
c0002673:	90                   	nop
c0002674:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002678:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000267c:	7e b6                	jle    c0002634 <print_hd_info+0x90>
c000267e:	83 ec 0c             	sub    $0xc,%esp
c0002681:	68 c0 9c 00 c0       	push   $0xc0009cc0
c0002686:	e8 84 61 00 00       	call   c000880f <Printf>
c000268b:	83 c4 10             	add    $0x10,%esp
c000268e:	90                   	nop
c000268f:	c9                   	leave  
c0002690:	c3                   	ret    

c0002691 <is_empty>:
c0002691:	55                   	push   %ebp
c0002692:	89 e5                	mov    %esp,%ebp
c0002694:	83 ec 10             	sub    $0x10,%esp
c0002697:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000269e:	eb 1a                	jmp    c00026ba <is_empty+0x29>
c00026a0:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00026a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00026a6:	01 d0                	add    %edx,%eax
c00026a8:	0f b6 00             	movzbl (%eax),%eax
c00026ab:	84 c0                	test   %al,%al
c00026ad:	74 07                	je     c00026b6 <is_empty+0x25>
c00026af:	b8 00 00 00 00       	mov    $0x0,%eax
c00026b4:	eb 11                	jmp    c00026c7 <is_empty+0x36>
c00026b6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00026ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00026bd:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00026c0:	7c de                	jl     c00026a0 <is_empty+0xf>
c00026c2:	b8 01 00 00 00       	mov    $0x1,%eax
c00026c7:	c9                   	leave  
c00026c8:	c3                   	ret    
c00026c9:	66 90                	xchg   %ax,%ax
c00026cb:	66 90                	xchg   %ax,%ax
c00026cd:	66 90                	xchg   %ax,%ax
c00026cf:	90                   	nop

c00026d0 <get_ticks>:
c00026d0:	b8 00 00 00 00       	mov    $0x0,%eax
c00026d5:	cd 90                	int    $0x90
c00026d7:	c3                   	ret    

c00026d8 <write2>:
c00026d8:	b8 01 00 00 00       	mov    $0x1,%eax
c00026dd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00026e1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00026e5:	cd 90                	int    $0x90
c00026e7:	c3                   	ret    

c00026e8 <write_debug>:
c00026e8:	b8 02 00 00 00       	mov    $0x2,%eax
c00026ed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00026f1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00026f5:	cd 90                	int    $0x90
c00026f7:	c3                   	ret    

c00026f8 <send_msg2>:
c00026f8:	b8 03 00 00 00       	mov    $0x3,%eax
c00026fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002701:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002705:	cd 90                	int    $0x90
c0002707:	c3                   	ret    

c0002708 <send_msg>:
c0002708:	55                   	push   %ebp
c0002709:	89 e5                	mov    %esp,%ebp
c000270b:	53                   	push   %ebx
c000270c:	51                   	push   %ecx
c000270d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002712:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002715:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002718:	cd 90                	int    $0x90
c000271a:	59                   	pop    %ecx
c000271b:	5b                   	pop    %ebx
c000271c:	5d                   	pop    %ebp
c000271d:	c3                   	ret    

c000271e <receive_msg2>:
c000271e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002723:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002727:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000272b:	cd 90                	int    $0x90
c000272d:	c3                   	ret    

c000272e <receive_msg>:
c000272e:	55                   	push   %ebp
c000272f:	89 e5                	mov    %esp,%ebp
c0002731:	53                   	push   %ebx
c0002732:	51                   	push   %ecx
c0002733:	b8 04 00 00 00       	mov    $0x4,%eax
c0002738:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000273b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000273e:	cd 90                	int    $0x90
c0002740:	59                   	pop    %ecx
c0002741:	5b                   	pop    %ebx
c0002742:	5d                   	pop    %ebp
c0002743:	c3                   	ret    

c0002744 <task_fs>:
c0002744:	55                   	push   %ebp
c0002745:	89 e5                	mov    %esp,%ebp
c0002747:	81 ec 08 01 00 00    	sub    $0x108,%esp
c000274d:	e8 91 07 00 00       	call   c0002ee3 <init_fs>
c0002752:	83 ec 04             	sub    $0x4,%esp
c0002755:	6a 6c                	push   $0x6c
c0002757:	6a 00                	push   $0x0
c0002759:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c000275f:	50                   	push   %eax
c0002760:	e8 5a 7f 00 00       	call   c000a6bf <Memset>
c0002765:	83 c4 10             	add    $0x10,%esp
c0002768:	83 ec 04             	sub    $0x4,%esp
c000276b:	6a 0e                	push   $0xe
c000276d:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0002773:	50                   	push   %eax
c0002774:	6a 02                	push   $0x2
c0002776:	e8 85 6b 00 00       	call   c0009300 <send_rec>
c000277b:	83 c4 10             	add    $0x10,%esp
c000277e:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0002784:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002787:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c000278d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002790:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0002796:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002799:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c000279f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00027a2:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c00027a8:	85 c0                	test   %eax,%eax
c00027aa:	75 07                	jne    c00027b3 <task_fs+0x6f>
c00027ac:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c00027b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00027b6:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00027bc:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c00027c1:	a3 84 eb 00 c0       	mov    %eax,0xc000eb84
c00027c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027cd:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00027d1:	74 1c                	je     c00027ef <task_fs+0xab>
c00027d3:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00027d7:	7f 08                	jg     c00027e1 <task_fs+0x9d>
c00027d9:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c00027dd:	74 3e                	je     c000281d <task_fs+0xd9>
c00027df:	eb 4b                	jmp    c000282c <task_fs+0xe8>
c00027e1:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c00027e5:	74 1f                	je     c0002806 <task_fs+0xc2>
c00027e7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00027eb:	74 19                	je     c0002806 <task_fs+0xc2>
c00027ed:	eb 3d                	jmp    c000282c <task_fs+0xe8>
c00027ef:	83 ec 0c             	sub    $0xc,%esp
c00027f2:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c00027f8:	50                   	push   %eax
c00027f9:	e8 14 07 00 00       	call   c0002f12 <do_open>
c00027fe:	83 c4 10             	add    $0x10,%esp
c0002801:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0002804:	eb 26                	jmp    c000282c <task_fs+0xe8>
c0002806:	83 ec 0c             	sub    $0xc,%esp
c0002809:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c000280f:	50                   	push   %eax
c0002810:	e8 3b 18 00 00       	call   c0004050 <do_rdwt>
c0002815:	83 c4 10             	add    $0x10,%esp
c0002818:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000281b:	eb 0f                	jmp    c000282c <task_fs+0xe8>
c000281d:	83 ec 0c             	sub    $0xc,%esp
c0002820:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002823:	e8 2a 1d 00 00       	call   c0004552 <do_close>
c0002828:	83 c4 10             	add    $0x10,%esp
c000282b:	90                   	nop
c000282c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0002832:	83 f8 67             	cmp    $0x67,%eax
c0002835:	74 36                	je     c000286d <task_fs+0x129>
c0002837:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000283a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000283d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002841:	75 06                	jne    c0002849 <task_fs+0x105>
c0002843:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002846:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002849:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
c0002850:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002853:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0002856:	83 ec 04             	sub    $0x4,%esp
c0002859:	ff 75 f0             	pushl  -0x10(%ebp)
c000285c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0002862:	50                   	push   %eax
c0002863:	6a 01                	push   $0x1
c0002865:	e8 96 6a 00 00       	call   c0009300 <send_rec>
c000286a:	83 c4 10             	add    $0x10,%esp
c000286d:	a1 20 e7 00 c0       	mov    0xc000e720,%eax
c0002872:	83 c0 01             	add    $0x1,%eax
c0002875:	a3 20 e7 00 c0       	mov    %eax,0xc000e720
c000287a:	e9 d3 fe ff ff       	jmp    c0002752 <task_fs+0xe>

c000287f <rd_wt>:
c000287f:	55                   	push   %ebp
c0002880:	89 e5                	mov    %esp,%ebp
c0002882:	83 ec 78             	sub    $0x78,%esp
c0002885:	83 ec 04             	sub    $0x4,%esp
c0002888:	6a 6c                	push   $0x6c
c000288a:	6a 00                	push   $0x0
c000288c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000288f:	50                   	push   %eax
c0002890:	e8 2a 7e 00 00       	call   c000a6bf <Memset>
c0002895:	83 c4 10             	add    $0x10,%esp
c0002898:	8b 45 18             	mov    0x18(%ebp),%eax
c000289b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000289e:	8b 45 0c             	mov    0xc(%ebp),%eax
c00028a1:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00028a4:	8b 45 10             	mov    0x10(%ebp),%eax
c00028a7:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00028aa:	8b 45 14             	mov    0x14(%ebp),%eax
c00028ad:	89 45 98             	mov    %eax,-0x68(%ebp)
c00028b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00028b3:	c1 e0 09             	shl    $0x9,%eax
c00028b6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00028b9:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c00028bd:	74 22                	je     c00028e1 <rd_wt+0x62>
c00028bf:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c00028c3:	74 1c                	je     c00028e1 <rd_wt+0x62>
c00028c5:	68 d2 00 00 00       	push   $0xd2
c00028ca:	68 e0 9c 00 c0       	push   $0xc0009ce0
c00028cf:	68 e0 9c 00 c0       	push   $0xc0009ce0
c00028d4:	68 ed 9c 00 c0       	push   $0xc0009ced
c00028d9:	e8 7e 62 00 00       	call   c0008b5c <assertion_failure>
c00028de:	83 c4 10             	add    $0x10,%esp
c00028e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00028e4:	83 f8 07             	cmp    $0x7,%eax
c00028e7:	74 24                	je     c000290d <rd_wt+0x8e>
c00028e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00028ec:	83 f8 0a             	cmp    $0xa,%eax
c00028ef:	74 1c                	je     c000290d <rd_wt+0x8e>
c00028f1:	68 d3 00 00 00       	push   $0xd3
c00028f6:	68 e0 9c 00 c0       	push   $0xc0009ce0
c00028fb:	68 e0 9c 00 c0       	push   $0xc0009ce0
c0002900:	68 0c 9d 00 c0       	push   $0xc0009d0c
c0002905:	e8 52 62 00 00       	call   c0008b5c <assertion_failure>
c000290a:	83 c4 10             	add    $0x10,%esp
c000290d:	83 ec 04             	sub    $0x4,%esp
c0002910:	6a 02                	push   $0x2
c0002912:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0002915:	50                   	push   %eax
c0002916:	6a 03                	push   $0x3
c0002918:	e8 e3 69 00 00       	call   c0009300 <send_rec>
c000291d:	83 c4 10             	add    $0x10,%esp
c0002920:	90                   	nop
c0002921:	c9                   	leave  
c0002922:	c3                   	ret    

c0002923 <mkfs>:
c0002923:	55                   	push   %ebp
c0002924:	89 e5                	mov    %esp,%ebp
c0002926:	57                   	push   %edi
c0002927:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c000292d:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002932:	83 ec 04             	sub    $0x4,%esp
c0002935:	68 00 02 00 00       	push   $0x200
c000293a:	6a 00                	push   $0x0
c000293c:	50                   	push   %eax
c000293d:	e8 7d 7d 00 00       	call   c000a6bf <Memset>
c0002942:	83 c4 10             	add    $0x10,%esp
c0002945:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000294a:	83 ec 0c             	sub    $0xc,%esp
c000294d:	6a 0a                	push   $0xa
c000294f:	68 00 02 00 00       	push   $0x200
c0002954:	50                   	push   %eax
c0002955:	6a 20                	push   $0x20
c0002957:	6a 00                	push   $0x0
c0002959:	e8 21 ff ff ff       	call   c000287f <rd_wt>
c000295e:	83 c4 20             	add    $0x20,%esp
c0002961:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002966:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002969:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000296c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002973:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002976:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c000297d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002980:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002987:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000298a:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002991:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002994:	8b 40 04             	mov    0x4(%eax),%eax
c0002997:	8d 50 02             	lea    0x2(%eax),%edx
c000299a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000299d:	8b 40 08             	mov    0x8(%eax),%eax
c00029a0:	01 c2                	add    %eax,%edx
c00029a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00029a5:	8b 40 0c             	mov    0xc(%eax),%eax
c00029a8:	01 c2                	add    %eax,%edx
c00029aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00029ad:	89 10                	mov    %edx,(%eax)
c00029af:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00029b6:	b8 00 02 00 00       	mov    $0x200,%eax
c00029bb:	2b 45 d8             	sub    -0x28(%ebp),%eax
c00029be:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c00029c4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00029c7:	01 ca                	add    %ecx,%edx
c00029c9:	83 ec 04             	sub    $0x4,%esp
c00029cc:	50                   	push   %eax
c00029cd:	6a 80                	push   $0xffffff80
c00029cf:	52                   	push   %edx
c00029d0:	e8 ea 7c 00 00       	call   c000a6bf <Memset>
c00029d5:	83 c4 10             	add    $0x10,%esp
c00029d8:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00029dd:	83 ec 0c             	sub    $0xc,%esp
c00029e0:	6a 0a                	push   $0xa
c00029e2:	68 00 02 00 00       	push   $0x200
c00029e7:	50                   	push   %eax
c00029e8:	6a 20                	push   $0x20
c00029ea:	6a 01                	push   $0x1
c00029ec:	e8 8e fe ff ff       	call   c000287f <rd_wt>
c00029f1:	83 c4 20             	add    $0x20,%esp
c00029f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00029f7:	8b 10                	mov    (%eax),%edx
c00029f9:	89 55 98             	mov    %edx,-0x68(%ebp)
c00029fc:	8b 50 04             	mov    0x4(%eax),%edx
c00029ff:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002a02:	8b 50 08             	mov    0x8(%eax),%edx
c0002a05:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002a08:	8b 50 0c             	mov    0xc(%eax),%edx
c0002a0b:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002a0e:	8b 50 10             	mov    0x10(%eax),%edx
c0002a11:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002a14:	8b 50 14             	mov    0x14(%eax),%edx
c0002a17:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002a1a:	8b 50 18             	mov    0x18(%eax),%edx
c0002a1d:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002a20:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002a23:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002a26:	8b 40 20             	mov    0x20(%eax),%eax
c0002a29:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002a2c:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002a30:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002a34:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a39:	83 ec 04             	sub    $0x4,%esp
c0002a3c:	6a 01                	push   $0x1
c0002a3e:	52                   	push   %edx
c0002a3f:	50                   	push   %eax
c0002a40:	e8 7a 7c 00 00       	call   c000a6bf <Memset>
c0002a45:	83 c4 10             	add    $0x10,%esp
c0002a48:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a4d:	83 c0 01             	add    $0x1,%eax
c0002a50:	83 ec 04             	sub    $0x4,%esp
c0002a53:	68 ff 01 00 00       	push   $0x1ff
c0002a58:	6a 80                	push   $0xffffff80
c0002a5a:	50                   	push   %eax
c0002a5b:	e8 5f 7c 00 00       	call   c000a6bf <Memset>
c0002a60:	83 c4 10             	add    $0x10,%esp
c0002a63:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a68:	83 ec 0c             	sub    $0xc,%esp
c0002a6b:	6a 0a                	push   $0xa
c0002a6d:	68 00 02 00 00       	push   $0x200
c0002a72:	50                   	push   %eax
c0002a73:	6a 20                	push   $0x20
c0002a75:	6a 02                	push   $0x2
c0002a77:	e8 03 fe ff ff       	call   c000287f <rd_wt>
c0002a7c:	83 c4 20             	add    $0x20,%esp
c0002a7f:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002a86:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002a8b:	83 ec 04             	sub    $0x4,%esp
c0002a8e:	68 00 02 00 00       	push   $0x200
c0002a93:	6a ff                	push   $0xffffffff
c0002a95:	50                   	push   %eax
c0002a96:	e8 24 7c 00 00       	call   c000a6bf <Memset>
c0002a9b:	83 c4 10             	add    $0x10,%esp
c0002a9e:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002aa3:	83 ec 0c             	sub    $0xc,%esp
c0002aa6:	6a 0a                	push   $0xa
c0002aa8:	68 00 02 00 00       	push   $0x200
c0002aad:	50                   	push   %eax
c0002aae:	6a 20                	push   $0x20
c0002ab0:	ff 75 d0             	pushl  -0x30(%ebp)
c0002ab3:	e8 c7 fd ff ff       	call   c000287f <rd_wt>
c0002ab8:	83 c4 20             	add    $0x20,%esp
c0002abb:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002ac0:	83 ec 04             	sub    $0x4,%esp
c0002ac3:	6a 01                	push   $0x1
c0002ac5:	6a 01                	push   $0x1
c0002ac7:	50                   	push   %eax
c0002ac8:	e8 f2 7b 00 00       	call   c000a6bf <Memset>
c0002acd:	83 c4 10             	add    $0x10,%esp
c0002ad0:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002ad5:	83 c0 01             	add    $0x1,%eax
c0002ad8:	83 ec 04             	sub    $0x4,%esp
c0002adb:	68 ff 01 00 00       	push   $0x1ff
c0002ae0:	6a 00                	push   $0x0
c0002ae2:	50                   	push   %eax
c0002ae3:	e8 d7 7b 00 00       	call   c000a6bf <Memset>
c0002ae8:	83 c4 10             	add    $0x10,%esp
c0002aeb:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002af0:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0002af3:	83 c2 01             	add    $0x1,%edx
c0002af6:	83 ec 0c             	sub    $0xc,%esp
c0002af9:	6a 0a                	push   $0xa
c0002afb:	68 00 02 00 00       	push   $0x200
c0002b00:	50                   	push   %eax
c0002b01:	6a 20                	push   $0x20
c0002b03:	52                   	push   %edx
c0002b04:	e8 76 fd ff ff       	call   c000287f <rd_wt>
c0002b09:	83 c4 20             	add    $0x20,%esp
c0002b0c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002b0f:	83 e8 02             	sub    $0x2,%eax
c0002b12:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002b15:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002b1c:	eb 3f                	jmp    c0002b5d <mkfs+0x23a>
c0002b1e:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002b23:	83 ec 04             	sub    $0x4,%esp
c0002b26:	68 00 02 00 00       	push   $0x200
c0002b2b:	6a 00                	push   $0x0
c0002b2d:	50                   	push   %eax
c0002b2e:	e8 8c 7b 00 00       	call   c000a6bf <Memset>
c0002b33:	83 c4 10             	add    $0x10,%esp
c0002b36:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002b3b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0002b3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0002b41:	01 ca                	add    %ecx,%edx
c0002b43:	83 ec 0c             	sub    $0xc,%esp
c0002b46:	6a 0a                	push   $0xa
c0002b48:	68 00 02 00 00       	push   $0x200
c0002b4d:	50                   	push   %eax
c0002b4e:	6a 20                	push   $0x20
c0002b50:	52                   	push   %edx
c0002b51:	e8 29 fd ff ff       	call   c000287f <rd_wt>
c0002b56:	83 c4 20             	add    $0x20,%esp
c0002b59:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002b5d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002b60:	83 c0 01             	add    $0x1,%eax
c0002b63:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002b66:	7e b6                	jle    c0002b1e <mkfs+0x1fb>
c0002b68:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002b6d:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002b70:	83 c2 03             	add    $0x3,%edx
c0002b73:	83 ec 0c             	sub    $0xc,%esp
c0002b76:	6a 0a                	push   $0xa
c0002b78:	68 00 02 00 00       	push   $0x200
c0002b7d:	50                   	push   %eax
c0002b7e:	6a 20                	push   $0x20
c0002b80:	52                   	push   %edx
c0002b81:	e8 f9 fc ff ff       	call   c000287f <rd_wt>
c0002b86:	83 c4 20             	add    $0x20,%esp
c0002b89:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002b8e:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002b91:	83 c2 03             	add    $0x3,%edx
c0002b94:	83 ec 0c             	sub    $0xc,%esp
c0002b97:	6a 07                	push   $0x7
c0002b99:	68 00 02 00 00       	push   $0x200
c0002b9e:	50                   	push   %eax
c0002b9f:	6a 20                	push   $0x20
c0002ba1:	52                   	push   %edx
c0002ba2:	e8 d8 fc ff ff       	call   c000287f <rd_wt>
c0002ba7:	83 c4 20             	add    $0x20,%esp
c0002baa:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002baf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002bb2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bb5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002bbb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bbe:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002bc5:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002bc8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bcb:	89 50 08             	mov    %edx,0x8(%eax)
c0002bce:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bd1:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002bd8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bdb:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002be2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002be5:	8b 10                	mov    (%eax),%edx
c0002be7:	89 15 a0 21 01 c0    	mov    %edx,0xc00121a0
c0002bed:	8b 50 04             	mov    0x4(%eax),%edx
c0002bf0:	89 15 a4 21 01 c0    	mov    %edx,0xc00121a4
c0002bf6:	8b 50 08             	mov    0x8(%eax),%edx
c0002bf9:	89 15 a8 21 01 c0    	mov    %edx,0xc00121a8
c0002bff:	8b 50 0c             	mov    0xc(%eax),%edx
c0002c02:	89 15 ac 21 01 c0    	mov    %edx,0xc00121ac
c0002c08:	8b 50 10             	mov    0x10(%eax),%edx
c0002c0b:	89 15 b0 21 01 c0    	mov    %edx,0xc00121b0
c0002c11:	8b 50 14             	mov    0x14(%eax),%edx
c0002c14:	89 15 b4 21 01 c0    	mov    %edx,0xc00121b4
c0002c1a:	8b 50 18             	mov    0x18(%eax),%edx
c0002c1d:	89 15 b8 21 01 c0    	mov    %edx,0xc00121b8
c0002c23:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002c26:	89 15 bc 21 01 c0    	mov    %edx,0xc00121bc
c0002c2c:	8b 50 20             	mov    0x20(%eax),%edx
c0002c2f:	89 15 c0 21 01 c0    	mov    %edx,0xc00121c0
c0002c35:	8b 40 24             	mov    0x24(%eax),%eax
c0002c38:	a3 c4 21 01 c0       	mov    %eax,0xc00121c4
c0002c3d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002c44:	eb 4c                	jmp    c0002c92 <mkfs+0x36f>
c0002c46:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002c4b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002c4e:	83 c2 01             	add    $0x1,%edx
c0002c51:	c1 e2 05             	shl    $0x5,%edx
c0002c54:	01 d0                	add    %edx,%eax
c0002c56:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002c59:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c5c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002c62:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c65:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002c6c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c6f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002c76:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002c7d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002c80:	c1 e0 08             	shl    $0x8,%eax
c0002c83:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002c86:	89 c2                	mov    %eax,%edx
c0002c88:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c8b:	89 50 08             	mov    %edx,0x8(%eax)
c0002c8e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002c92:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002c96:	7e ae                	jle    c0002c46 <mkfs+0x323>
c0002c98:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002c9f:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002ca5:	b8 00 00 00 00       	mov    $0x0,%eax
c0002caa:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002caf:	89 d7                	mov    %edx,%edi
c0002cb1:	f3 ab                	rep stos %eax,%es:(%edi)
c0002cb3:	c7 85 70 ff ff ff 32 	movl   $0xc0009d32,-0x90(%ebp)
c0002cba:	9d 00 c0 
c0002cbd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002cc4:	eb 54                	jmp    c0002d1a <mkfs+0x3f7>
c0002cc6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002ccb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002cce:	83 c2 04             	add    $0x4,%edx
c0002cd1:	c1 e2 05             	shl    $0x5,%edx
c0002cd4:	01 d0                	add    %edx,%eax
c0002cd6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002cd9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cdc:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002ce2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ce5:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002cec:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002cef:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002cf2:	83 c2 01             	add    $0x1,%edx
c0002cf5:	c1 e2 0b             	shl    $0xb,%edx
c0002cf8:	01 c2                	add    %eax,%edx
c0002cfa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cfd:	89 50 08             	mov    %edx,0x8(%eax)
c0002d00:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d03:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002d0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002d0d:	8d 50 05             	lea    0x5(%eax),%edx
c0002d10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d13:	89 50 10             	mov    %edx,0x10(%eax)
c0002d16:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002d1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002d1d:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002d20:	7c a4                	jl     c0002cc6 <mkfs+0x3a3>
c0002d22:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002d27:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0002d2a:	83 c2 03             	add    $0x3,%edx
c0002d2d:	83 ec 0c             	sub    $0xc,%esp
c0002d30:	6a 0a                	push   $0xa
c0002d32:	68 00 02 00 00       	push   $0x200
c0002d37:	50                   	push   %eax
c0002d38:	6a 20                	push   $0x20
c0002d3a:	52                   	push   %edx
c0002d3b:	e8 3f fb ff ff       	call   c000287f <rd_wt>
c0002d40:	83 c4 20             	add    $0x20,%esp
c0002d43:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0002d49:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002d4c:	83 ec 0c             	sub    $0xc,%esp
c0002d4f:	6a 07                	push   $0x7
c0002d51:	68 00 02 00 00       	push   $0x200
c0002d56:	52                   	push   %edx
c0002d57:	6a 20                	push   $0x20
c0002d59:	50                   	push   %eax
c0002d5a:	e8 20 fb ff ff       	call   c000287f <rd_wt>
c0002d5f:	83 c4 20             	add    $0x20,%esp
c0002d62:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002d69:	00 00 00 
c0002d6c:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002d73:	2e 00 
c0002d75:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0002d7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002d7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002d80:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002d86:	83 ec 0c             	sub    $0xc,%esp
c0002d89:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002d8f:	50                   	push   %eax
c0002d90:	e8 63 79 00 00       	call   c000a6f8 <Strlen>
c0002d95:	83 c4 10             	add    $0x10,%esp
c0002d98:	89 c1                	mov    %eax,%ecx
c0002d9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002d9d:	8d 50 04             	lea    0x4(%eax),%edx
c0002da0:	83 ec 04             	sub    $0x4,%esp
c0002da3:	51                   	push   %ecx
c0002da4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002daa:	50                   	push   %eax
c0002dab:	52                   	push   %edx
c0002dac:	e8 e0 78 00 00       	call   c000a691 <Memcpy>
c0002db1:	83 c4 10             	add    $0x10,%esp
c0002db4:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002dba:	b8 00 00 00 00       	mov    $0x0,%eax
c0002dbf:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002dc4:	89 d7                	mov    %edx,%edi
c0002dc6:	f3 ab                	rep stos %eax,%es:(%edi)
c0002dc8:	c7 85 34 ff ff ff 3e 	movl   $0xc0009d3e,-0xcc(%ebp)
c0002dcf:	9d 00 c0 
c0002dd2:	c7 85 38 ff ff ff 47 	movl   $0xc0009d47,-0xc8(%ebp)
c0002dd9:	9d 00 c0 
c0002ddc:	c7 85 3c ff ff ff 50 	movl   $0xc0009d50,-0xc4(%ebp)
c0002de3:	9d 00 c0 
c0002de6:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002ded:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002df4:	eb 49                	jmp    c0002e3f <mkfs+0x51c>
c0002df6:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002dfa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002dfd:	8d 50 02             	lea    0x2(%eax),%edx
c0002e00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e03:	89 10                	mov    %edx,(%eax)
c0002e05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002e08:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002e0f:	83 ec 0c             	sub    $0xc,%esp
c0002e12:	50                   	push   %eax
c0002e13:	e8 e0 78 00 00       	call   c000a6f8 <Strlen>
c0002e18:	83 c4 10             	add    $0x10,%esp
c0002e1b:	89 c1                	mov    %eax,%ecx
c0002e1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002e20:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002e27:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002e2a:	83 c2 04             	add    $0x4,%edx
c0002e2d:	83 ec 04             	sub    $0x4,%esp
c0002e30:	51                   	push   %ecx
c0002e31:	50                   	push   %eax
c0002e32:	52                   	push   %edx
c0002e33:	e8 59 78 00 00       	call   c000a691 <Memcpy>
c0002e38:	83 c4 10             	add    $0x10,%esp
c0002e3b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002e3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002e42:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002e45:	7c af                	jl     c0002df6 <mkfs+0x4d3>
c0002e47:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002e4e:	eb 66                	jmp    c0002eb6 <mkfs+0x593>
c0002e50:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e53:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002e5a:	83 ec 0c             	sub    $0xc,%esp
c0002e5d:	50                   	push   %eax
c0002e5e:	e8 95 78 00 00       	call   c000a6f8 <Strlen>
c0002e63:	83 c4 10             	add    $0x10,%esp
c0002e66:	85 c0                	test   %eax,%eax
c0002e68:	74 47                	je     c0002eb1 <mkfs+0x58e>
c0002e6a:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002e6e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e71:	8d 50 05             	lea    0x5(%eax),%edx
c0002e74:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e77:	89 10                	mov    %edx,(%eax)
c0002e79:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e7c:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002e83:	83 ec 0c             	sub    $0xc,%esp
c0002e86:	50                   	push   %eax
c0002e87:	e8 6c 78 00 00       	call   c000a6f8 <Strlen>
c0002e8c:	83 c4 10             	add    $0x10,%esp
c0002e8f:	89 c1                	mov    %eax,%ecx
c0002e91:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e94:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002e9b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002e9e:	83 c2 04             	add    $0x4,%edx
c0002ea1:	83 ec 04             	sub    $0x4,%esp
c0002ea4:	51                   	push   %ecx
c0002ea5:	50                   	push   %eax
c0002ea6:	52                   	push   %edx
c0002ea7:	e8 e5 77 00 00       	call   c000a691 <Memcpy>
c0002eac:	83 c4 10             	add    $0x10,%esp
c0002eaf:	eb 01                	jmp    c0002eb2 <mkfs+0x58f>
c0002eb1:	90                   	nop
c0002eb2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002eb6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002eb9:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002ebc:	7c 92                	jl     c0002e50 <mkfs+0x52d>
c0002ebe:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0002ec4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002ec7:	83 ec 0c             	sub    $0xc,%esp
c0002eca:	6a 0a                	push   $0xa
c0002ecc:	68 00 02 00 00       	push   $0x200
c0002ed1:	52                   	push   %edx
c0002ed2:	6a 20                	push   $0x20
c0002ed4:	50                   	push   %eax
c0002ed5:	e8 a5 f9 ff ff       	call   c000287f <rd_wt>
c0002eda:	83 c4 20             	add    $0x20,%esp
c0002edd:	90                   	nop
c0002ede:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0002ee1:	c9                   	leave  
c0002ee2:	c3                   	ret    

c0002ee3 <init_fs>:
c0002ee3:	55                   	push   %ebp
c0002ee4:	89 e5                	mov    %esp,%ebp
c0002ee6:	83 ec 78             	sub    $0x78,%esp
c0002ee9:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0002ef0:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
c0002ef7:	83 ec 04             	sub    $0x4,%esp
c0002efa:	6a 02                	push   $0x2
c0002efc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0002eff:	50                   	push   %eax
c0002f00:	6a 03                	push   $0x3
c0002f02:	e8 f9 63 00 00       	call   c0009300 <send_rec>
c0002f07:	83 c4 10             	add    $0x10,%esp
c0002f0a:	e8 14 fa ff ff       	call   c0002923 <mkfs>
c0002f0f:	90                   	nop
c0002f10:	c9                   	leave  
c0002f11:	c3                   	ret    

c0002f12 <do_open>:
c0002f12:	55                   	push   %ebp
c0002f13:	89 e5                	mov    %esp,%ebp
c0002f15:	56                   	push   %esi
c0002f16:	53                   	push   %ebx
c0002f17:	83 ec 60             	sub    $0x60,%esp
c0002f1a:	83 ec 04             	sub    $0x4,%esp
c0002f1d:	6a 0c                	push   $0xc
c0002f1f:	6a 00                	push   $0x0
c0002f21:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002f24:	50                   	push   %eax
c0002f25:	e8 95 77 00 00       	call   c000a6bf <Memset>
c0002f2a:	83 c4 10             	add    $0x10,%esp
c0002f2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f30:	8b 40 30             	mov    0x30(%eax),%eax
c0002f33:	89 c6                	mov    %eax,%esi
c0002f35:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f38:	8b 40 34             	mov    0x34(%eax),%eax
c0002f3b:	89 c2                	mov    %eax,%edx
c0002f3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f40:	8b 00                	mov    (%eax),%eax
c0002f42:	83 ec 08             	sub    $0x8,%esp
c0002f45:	52                   	push   %edx
c0002f46:	50                   	push   %eax
c0002f47:	e8 32 19 00 00       	call   c000487e <v2l>
c0002f4c:	83 c4 10             	add    $0x10,%esp
c0002f4f:	89 c3                	mov    %eax,%ebx
c0002f51:	83 ec 08             	sub    $0x8,%esp
c0002f54:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002f57:	50                   	push   %eax
c0002f58:	6a 03                	push   $0x3
c0002f5a:	e8 1f 19 00 00       	call   c000487e <v2l>
c0002f5f:	83 c4 10             	add    $0x10,%esp
c0002f62:	83 ec 04             	sub    $0x4,%esp
c0002f65:	56                   	push   %esi
c0002f66:	53                   	push   %ebx
c0002f67:	50                   	push   %eax
c0002f68:	e8 24 77 00 00       	call   c000a691 <Memcpy>
c0002f6d:	83 c4 10             	add    $0x10,%esp
c0002f70:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f73:	8b 40 30             	mov    0x30(%eax),%eax
c0002f76:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
c0002f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f7e:	8b 40 64             	mov    0x64(%eax),%eax
c0002f81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002f84:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0002f8b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002f92:	eb 1f                	jmp    c0002fb3 <do_open+0xa1>
c0002f94:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c0002f99:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002f9c:	83 c2 10             	add    $0x10,%edx
c0002f9f:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0002fa3:	85 c0                	test   %eax,%eax
c0002fa5:	75 08                	jne    c0002faf <do_open+0x9d>
c0002fa7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002faa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002fad:	eb 0a                	jmp    c0002fb9 <do_open+0xa7>
c0002faf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002fb3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002fb7:	7e db                	jle    c0002f94 <do_open+0x82>
c0002fb9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0002fbd:	75 1c                	jne    c0002fdb <do_open+0xc9>
c0002fbf:	68 d9 01 00 00       	push   $0x1d9
c0002fc4:	68 e0 9c 00 c0       	push   $0xc0009ce0
c0002fc9:	68 e0 9c 00 c0       	push   $0xc0009ce0
c0002fce:	68 59 9d 00 c0       	push   $0xc0009d59
c0002fd3:	e8 84 5b 00 00       	call   c0008b5c <assertion_failure>
c0002fd8:	83 c4 10             	add    $0x10,%esp
c0002fdb:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0002fe2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0002fe9:	eb 1d                	jmp    c0003008 <do_open+0xf6>
c0002feb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002fee:	c1 e0 04             	shl    $0x4,%eax
c0002ff1:	05 a8 13 01 c0       	add    $0xc00113a8,%eax
c0002ff6:	8b 00                	mov    (%eax),%eax
c0002ff8:	85 c0                	test   %eax,%eax
c0002ffa:	75 08                	jne    c0003004 <do_open+0xf2>
c0002ffc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002fff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003002:	eb 0a                	jmp    c000300e <do_open+0xfc>
c0003004:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003008:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c000300c:	7e dd                	jle    c0002feb <do_open+0xd9>
c000300e:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0003012:	75 1c                	jne    c0003030 <do_open+0x11e>
c0003014:	68 e5 01 00 00       	push   $0x1e5
c0003019:	68 e0 9c 00 c0       	push   $0xc0009ce0
c000301e:	68 e0 9c 00 c0       	push   $0xc0009ce0
c0003023:	68 61 9d 00 c0       	push   $0xc0009d61
c0003028:	e8 2f 5b 00 00       	call   c0008b5c <assertion_failure>
c000302d:	83 c4 10             	add    $0x10,%esp
c0003030:	83 ec 0c             	sub    $0xc,%esp
c0003033:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0003036:	50                   	push   %eax
c0003037:	e8 b7 00 00 00       	call   c00030f3 <search_file>
c000303c:	83 c4 10             	add    $0x10,%esp
c000303f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003042:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
c0003046:	75 2b                	jne    c0003073 <do_open+0x161>
c0003048:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c000304c:	7e 10                	jle    c000305e <do_open+0x14c>
c000304e:	83 ec 0c             	sub    $0xc,%esp
c0003051:	68 69 9d 00 c0       	push   $0xc0009d69
c0003056:	e8 e3 5a 00 00       	call   c0008b3e <panic>
c000305b:	83 c4 10             	add    $0x10,%esp
c000305e:	83 ec 08             	sub    $0x8,%esp
c0003061:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0003064:	50                   	push   %eax
c0003065:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0003068:	50                   	push   %eax
c0003069:	e8 43 04 00 00       	call   c00034b1 <create_file>
c000306e:	83 c4 10             	add    $0x10,%esp
c0003071:	eb 22                	jmp    c0003095 <do_open+0x183>
c0003073:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0003077:	75 07                	jne    c0003080 <do_open+0x16e>
c0003079:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000307e:	eb 6c                	jmp    c00030ec <do_open+0x1da>
c0003080:	83 ec 08             	sub    $0x8,%esp
c0003083:	ff 75 e0             	pushl  -0x20(%ebp)
c0003086:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0003089:	50                   	push   %eax
c000308a:	e8 60 02 00 00       	call   c00032ef <get_inode>
c000308f:	83 c4 10             	add    $0x10,%esp
c0003092:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003095:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c000309a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000309d:	c1 e2 04             	shl    $0x4,%edx
c00030a0:	8d 8a a0 13 01 c0    	lea    -0x3ffeec60(%edx),%ecx
c00030a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00030a9:	83 c2 10             	add    $0x10,%edx
c00030ac:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
c00030b0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00030b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00030b6:	c1 e2 04             	shl    $0x4,%edx
c00030b9:	81 c2 a8 13 01 c0    	add    $0xc00113a8,%edx
c00030bf:	89 02                	mov    %eax,(%edx)
c00030c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030c4:	c1 e0 04             	shl    $0x4,%eax
c00030c7:	05 a4 13 01 c0       	add    $0xc00113a4,%eax
c00030cc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00030d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030d5:	c1 e0 04             	shl    $0x4,%eax
c00030d8:	05 a0 13 01 c0       	add    $0xc00113a0,%eax
c00030dd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00030e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00030e9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00030ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00030ef:	5b                   	pop    %ebx
c00030f0:	5e                   	pop    %esi
c00030f1:	5d                   	pop    %ebp
c00030f2:	c3                   	ret    

c00030f3 <search_file>:
c00030f3:	55                   	push   %ebp
c00030f4:	89 e5                	mov    %esp,%ebp
c00030f6:	83 ec 68             	sub    $0x68,%esp
c00030f9:	83 ec 04             	sub    $0x4,%esp
c00030fc:	6a 0c                	push   $0xc
c00030fe:	6a 00                	push   $0x0
c0003100:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003103:	50                   	push   %eax
c0003104:	e8 b6 75 00 00       	call   c000a6bf <Memset>
c0003109:	83 c4 10             	add    $0x10,%esp
c000310c:	83 ec 04             	sub    $0x4,%esp
c000310f:	6a 28                	push   $0x28
c0003111:	6a 00                	push   $0x0
c0003113:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003116:	50                   	push   %eax
c0003117:	e8 a3 75 00 00       	call   c000a6bf <Memset>
c000311c:	83 c4 10             	add    $0x10,%esp
c000311f:	83 ec 04             	sub    $0x4,%esp
c0003122:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003125:	50                   	push   %eax
c0003126:	ff 75 08             	pushl  0x8(%ebp)
c0003129:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000312c:	50                   	push   %eax
c000312d:	e8 f1 00 00 00       	call   c0003223 <strip_path>
c0003132:	83 c4 10             	add    $0x10,%esp
c0003135:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003138:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000313c:	75 0a                	jne    c0003148 <search_file+0x55>
c000313e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003143:	e9 d9 00 00 00       	jmp    c0003221 <search_file+0x12e>
c0003148:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000314b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000314e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003151:	05 00 02 00 00       	add    $0x200,%eax
c0003156:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000315c:	85 c0                	test   %eax,%eax
c000315e:	0f 48 c2             	cmovs  %edx,%eax
c0003161:	c1 f8 09             	sar    $0x9,%eax
c0003164:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003167:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000316a:	c1 e8 04             	shr    $0x4,%eax
c000316d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003170:	e8 2f 14 00 00       	call   c00045a4 <get_super_block>
c0003175:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003178:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000317b:	8b 00                	mov    (%eax),%eax
c000317d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003180:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003187:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000318e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003195:	eb 79                	jmp    c0003210 <search_file+0x11d>
c0003197:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000319c:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c000319f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00031a2:	01 ca                	add    %ecx,%edx
c00031a4:	83 ec 0c             	sub    $0xc,%esp
c00031a7:	6a 07                	push   $0x7
c00031a9:	68 00 02 00 00       	push   $0x200
c00031ae:	50                   	push   %eax
c00031af:	ff 75 cc             	pushl  -0x34(%ebp)
c00031b2:	52                   	push   %edx
c00031b3:	e8 c7 f6 ff ff       	call   c000287f <rd_wt>
c00031b8:	83 c4 20             	add    $0x20,%esp
c00031bb:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00031c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00031c3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00031ca:	eb 35                	jmp    c0003201 <search_file+0x10e>
c00031cc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00031d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00031d3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00031d6:	7f 33                	jg     c000320b <search_file+0x118>
c00031d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031db:	83 c0 04             	add    $0x4,%eax
c00031de:	83 ec 08             	sub    $0x8,%esp
c00031e1:	50                   	push   %eax
c00031e2:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00031e5:	50                   	push   %eax
c00031e6:	e8 e3 63 00 00       	call   c00095ce <strcmp>
c00031eb:	83 c4 10             	add    $0x10,%esp
c00031ee:	85 c0                	test   %eax,%eax
c00031f0:	75 07                	jne    c00031f9 <search_file+0x106>
c00031f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031f5:	8b 00                	mov    (%eax),%eax
c00031f7:	eb 28                	jmp    c0003221 <search_file+0x12e>
c00031f9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00031fd:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003201:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003204:	83 f8 1f             	cmp    $0x1f,%eax
c0003207:	76 c3                	jbe    c00031cc <search_file+0xd9>
c0003209:	eb 01                	jmp    c000320c <search_file+0x119>
c000320b:	90                   	nop
c000320c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003210:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003213:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003216:	0f 8c 7b ff ff ff    	jl     c0003197 <search_file+0xa4>
c000321c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003221:	c9                   	leave  
c0003222:	c3                   	ret    

c0003223 <strip_path>:
c0003223:	55                   	push   %ebp
c0003224:	89 e5                	mov    %esp,%ebp
c0003226:	83 ec 10             	sub    $0x10,%esp
c0003229:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000322d:	75 0a                	jne    c0003239 <strip_path+0x16>
c000322f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003234:	e9 b4 00 00 00       	jmp    c00032ed <strip_path+0xca>
c0003239:	8b 45 08             	mov    0x8(%ebp),%eax
c000323c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000323f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003242:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003245:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003248:	0f b6 00             	movzbl (%eax),%eax
c000324b:	3c 2f                	cmp    $0x2f,%al
c000324d:	75 2d                	jne    c000327c <strip_path+0x59>
c000324f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003253:	eb 27                	jmp    c000327c <strip_path+0x59>
c0003255:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003258:	0f b6 00             	movzbl (%eax),%eax
c000325b:	3c 2f                	cmp    $0x2f,%al
c000325d:	75 0a                	jne    c0003269 <strip_path+0x46>
c000325f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003264:	e9 84 00 00 00       	jmp    c00032ed <strip_path+0xca>
c0003269:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000326c:	0f b6 10             	movzbl (%eax),%edx
c000326f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003272:	88 10                	mov    %dl,(%eax)
c0003274:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003278:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000327c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000327f:	0f b6 00             	movzbl (%eax),%eax
c0003282:	84 c0                	test   %al,%al
c0003284:	75 cf                	jne    c0003255 <strip_path+0x32>
c0003286:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003289:	c6 00 00             	movb   $0x0,(%eax)
c000328c:	8b 45 10             	mov    0x10(%ebp),%eax
c000328f:	8b 15 a0 21 01 c0    	mov    0xc00121a0,%edx
c0003295:	89 10                	mov    %edx,(%eax)
c0003297:	8b 15 a4 21 01 c0    	mov    0xc00121a4,%edx
c000329d:	89 50 04             	mov    %edx,0x4(%eax)
c00032a0:	8b 15 a8 21 01 c0    	mov    0xc00121a8,%edx
c00032a6:	89 50 08             	mov    %edx,0x8(%eax)
c00032a9:	8b 15 ac 21 01 c0    	mov    0xc00121ac,%edx
c00032af:	89 50 0c             	mov    %edx,0xc(%eax)
c00032b2:	8b 15 b0 21 01 c0    	mov    0xc00121b0,%edx
c00032b8:	89 50 10             	mov    %edx,0x10(%eax)
c00032bb:	8b 15 b4 21 01 c0    	mov    0xc00121b4,%edx
c00032c1:	89 50 14             	mov    %edx,0x14(%eax)
c00032c4:	8b 15 b8 21 01 c0    	mov    0xc00121b8,%edx
c00032ca:	89 50 18             	mov    %edx,0x18(%eax)
c00032cd:	8b 15 bc 21 01 c0    	mov    0xc00121bc,%edx
c00032d3:	89 50 1c             	mov    %edx,0x1c(%eax)
c00032d6:	8b 15 c0 21 01 c0    	mov    0xc00121c0,%edx
c00032dc:	89 50 20             	mov    %edx,0x20(%eax)
c00032df:	8b 15 c4 21 01 c0    	mov    0xc00121c4,%edx
c00032e5:	89 50 24             	mov    %edx,0x24(%eax)
c00032e8:	b8 00 00 00 00       	mov    $0x0,%eax
c00032ed:	c9                   	leave  
c00032ee:	c3                   	ret    

c00032ef <get_inode>:
c00032ef:	55                   	push   %ebp
c00032f0:	89 e5                	mov    %esp,%ebp
c00032f2:	56                   	push   %esi
c00032f3:	53                   	push   %ebx
c00032f4:	83 ec 20             	sub    $0x20,%esp
c00032f7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00032fb:	75 0a                	jne    c0003307 <get_inode+0x18>
c00032fd:	b8 00 00 00 00       	mov    $0x0,%eax
c0003302:	e9 a3 01 00 00       	jmp    c00034aa <get_inode+0x1bb>
c0003307:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000330e:	c7 45 f0 a0 17 01 c0 	movl   $0xc00117a0,-0x10(%ebp)
c0003315:	eb 69                	jmp    c0003380 <get_inode+0x91>
c0003317:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000331a:	8b 40 24             	mov    0x24(%eax),%eax
c000331d:	85 c0                	test   %eax,%eax
c000331f:	7e 53                	jle    c0003374 <get_inode+0x85>
c0003321:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003324:	8b 40 10             	mov    0x10(%eax),%eax
c0003327:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000332a:	75 50                	jne    c000337c <get_inode+0x8d>
c000332c:	8b 45 08             	mov    0x8(%ebp),%eax
c000332f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003332:	8b 0a                	mov    (%edx),%ecx
c0003334:	89 08                	mov    %ecx,(%eax)
c0003336:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003339:	89 48 04             	mov    %ecx,0x4(%eax)
c000333c:	8b 4a 08             	mov    0x8(%edx),%ecx
c000333f:	89 48 08             	mov    %ecx,0x8(%eax)
c0003342:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003345:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003348:	8b 4a 10             	mov    0x10(%edx),%ecx
c000334b:	89 48 10             	mov    %ecx,0x10(%eax)
c000334e:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003351:	89 48 14             	mov    %ecx,0x14(%eax)
c0003354:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003357:	89 48 18             	mov    %ecx,0x18(%eax)
c000335a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000335d:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003360:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003363:	89 48 20             	mov    %ecx,0x20(%eax)
c0003366:	8b 52 24             	mov    0x24(%edx),%edx
c0003369:	89 50 24             	mov    %edx,0x24(%eax)
c000336c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000336f:	e9 36 01 00 00       	jmp    c00034aa <get_inode+0x1bb>
c0003374:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003377:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000337a:	eb 0d                	jmp    c0003389 <get_inode+0x9a>
c000337c:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003380:	81 7d f0 a0 21 01 c0 	cmpl   $0xc00121a0,-0x10(%ebp)
c0003387:	76 8e                	jbe    c0003317 <get_inode+0x28>
c0003389:	e8 16 12 00 00       	call   c00045a4 <get_super_block>
c000338e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003391:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003398:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000339b:	8b 40 04             	mov    0x4(%eax),%eax
c000339e:	8d 50 02             	lea    0x2(%eax),%edx
c00033a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033a4:	8b 40 08             	mov    0x8(%eax),%eax
c00033a7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00033aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c00033ad:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00033b0:	b8 00 02 00 00       	mov    $0x200,%eax
c00033b5:	99                   	cltd   
c00033b6:	f7 7d e8             	idivl  -0x18(%ebp)
c00033b9:	89 c6                	mov    %eax,%esi
c00033bb:	89 c8                	mov    %ecx,%eax
c00033bd:	99                   	cltd   
c00033be:	f7 fe                	idiv   %esi
c00033c0:	01 d8                	add    %ebx,%eax
c00033c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00033c5:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00033cc:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00033d1:	83 ec 0c             	sub    $0xc,%esp
c00033d4:	6a 07                	push   $0x7
c00033d6:	68 00 02 00 00       	push   $0x200
c00033db:	50                   	push   %eax
c00033dc:	ff 75 e0             	pushl  -0x20(%ebp)
c00033df:	ff 75 e4             	pushl  -0x1c(%ebp)
c00033e2:	e8 98 f4 ff ff       	call   c000287f <rd_wt>
c00033e7:	83 c4 20             	add    $0x20,%esp
c00033ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c00033ed:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00033f0:	b8 00 02 00 00       	mov    $0x200,%eax
c00033f5:	99                   	cltd   
c00033f6:	f7 7d e8             	idivl  -0x18(%ebp)
c00033f9:	89 c3                	mov    %eax,%ebx
c00033fb:	89 c8                	mov    %ecx,%eax
c00033fd:	99                   	cltd   
c00033fe:	f7 fb                	idiv   %ebx
c0003400:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003403:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003409:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000340c:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003410:	01 d0                	add    %edx,%eax
c0003412:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003415:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003418:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000341b:	8b 0a                	mov    (%edx),%ecx
c000341d:	89 08                	mov    %ecx,(%eax)
c000341f:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003422:	89 48 04             	mov    %ecx,0x4(%eax)
c0003425:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003428:	89 48 08             	mov    %ecx,0x8(%eax)
c000342b:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000342e:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003431:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003434:	89 48 10             	mov    %ecx,0x10(%eax)
c0003437:	8b 4a 14             	mov    0x14(%edx),%ecx
c000343a:	89 48 14             	mov    %ecx,0x14(%eax)
c000343d:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003440:	89 48 18             	mov    %ecx,0x18(%eax)
c0003443:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003446:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003449:	8b 4a 20             	mov    0x20(%edx),%ecx
c000344c:	89 48 20             	mov    %ecx,0x20(%eax)
c000344f:	8b 52 24             	mov    0x24(%edx),%edx
c0003452:	89 50 24             	mov    %edx,0x24(%eax)
c0003455:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003458:	8b 55 0c             	mov    0xc(%ebp),%edx
c000345b:	89 50 10             	mov    %edx,0x10(%eax)
c000345e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003461:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003464:	89 50 20             	mov    %edx,0x20(%eax)
c0003467:	8b 45 08             	mov    0x8(%ebp),%eax
c000346a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000346d:	8b 0a                	mov    (%edx),%ecx
c000346f:	89 08                	mov    %ecx,(%eax)
c0003471:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003474:	89 48 04             	mov    %ecx,0x4(%eax)
c0003477:	8b 4a 08             	mov    0x8(%edx),%ecx
c000347a:	89 48 08             	mov    %ecx,0x8(%eax)
c000347d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003480:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003483:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003486:	89 48 10             	mov    %ecx,0x10(%eax)
c0003489:	8b 4a 14             	mov    0x14(%edx),%ecx
c000348c:	89 48 14             	mov    %ecx,0x14(%eax)
c000348f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003492:	89 48 18             	mov    %ecx,0x18(%eax)
c0003495:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003498:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000349b:	8b 4a 20             	mov    0x20(%edx),%ecx
c000349e:	89 48 20             	mov    %ecx,0x20(%eax)
c00034a1:	8b 52 24             	mov    0x24(%edx),%edx
c00034a4:	89 50 24             	mov    %edx,0x24(%eax)
c00034a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00034aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00034ad:	5b                   	pop    %ebx
c00034ae:	5e                   	pop    %esi
c00034af:	5d                   	pop    %ebp
c00034b0:	c3                   	ret    

c00034b1 <create_file>:
c00034b1:	55                   	push   %ebp
c00034b2:	89 e5                	mov    %esp,%ebp
c00034b4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00034ba:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00034bd:	50                   	push   %eax
c00034be:	ff 75 0c             	pushl  0xc(%ebp)
c00034c1:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00034c4:	50                   	push   %eax
c00034c5:	e8 59 fd ff ff       	call   c0003223 <strip_path>
c00034ca:	83 c4 0c             	add    $0xc,%esp
c00034cd:	83 f8 ff             	cmp    $0xffffffff,%eax
c00034d0:	75 0a                	jne    c00034dc <create_file+0x2b>
c00034d2:	b8 00 00 00 00       	mov    $0x0,%eax
c00034d7:	e9 de 00 00 00       	jmp    c00035ba <create_file+0x109>
c00034dc:	e8 db 00 00 00       	call   c00035bc <alloc_imap_bit>
c00034e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00034e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00034e8:	75 0a                	jne    c00034f4 <create_file+0x43>
c00034ea:	b8 00 00 00 00       	mov    $0x0,%eax
c00034ef:	e9 c6 00 00 00       	jmp    c00035ba <create_file+0x109>
c00034f4:	e8 ab 10 00 00       	call   c00045a4 <get_super_block>
c00034f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00034fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034ff:	8b 40 10             	mov    0x10(%eax),%eax
c0003502:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003505:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003508:	83 ec 08             	sub    $0x8,%esp
c000350b:	50                   	push   %eax
c000350c:	ff 75 f4             	pushl  -0xc(%ebp)
c000350f:	e8 a5 01 00 00       	call   c00036b9 <alloc_smap_bit>
c0003514:	83 c4 10             	add    $0x10,%esp
c0003517:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000351a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000351e:	75 0a                	jne    c000352a <create_file+0x79>
c0003520:	b8 00 00 00 00       	mov    $0x0,%eax
c0003525:	e9 90 00 00 00       	jmp    c00035ba <create_file+0x109>
c000352a:	83 ec 04             	sub    $0x4,%esp
c000352d:	ff 75 e8             	pushl  -0x18(%ebp)
c0003530:	ff 75 f4             	pushl  -0xc(%ebp)
c0003533:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003536:	50                   	push   %eax
c0003537:	e8 1e 03 00 00       	call   c000385a <new_inode>
c000353c:	83 c4 10             	add    $0x10,%esp
c000353f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003542:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003546:	75 07                	jne    c000354f <create_file+0x9e>
c0003548:	b8 00 00 00 00       	mov    $0x0,%eax
c000354d:	eb 6b                	jmp    c00035ba <create_file+0x109>
c000354f:	ff 75 f4             	pushl  -0xc(%ebp)
c0003552:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003555:	50                   	push   %eax
c0003556:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003559:	50                   	push   %eax
c000355a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003560:	50                   	push   %eax
c0003561:	e8 12 04 00 00       	call   c0003978 <new_dir_entry>
c0003566:	83 c4 10             	add    $0x10,%esp
c0003569:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000356c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003570:	75 07                	jne    c0003579 <create_file+0xc8>
c0003572:	b8 00 00 00 00       	mov    $0x0,%eax
c0003577:	eb 41                	jmp    c00035ba <create_file+0x109>
c0003579:	8b 45 08             	mov    0x8(%ebp),%eax
c000357c:	8b 55 84             	mov    -0x7c(%ebp),%edx
c000357f:	89 10                	mov    %edx,(%eax)
c0003581:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003584:	89 50 04             	mov    %edx,0x4(%eax)
c0003587:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000358a:	89 50 08             	mov    %edx,0x8(%eax)
c000358d:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003590:	89 50 0c             	mov    %edx,0xc(%eax)
c0003593:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0003596:	89 50 10             	mov    %edx,0x10(%eax)
c0003599:	8b 55 98             	mov    -0x68(%ebp),%edx
c000359c:	89 50 14             	mov    %edx,0x14(%eax)
c000359f:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00035a2:	89 50 18             	mov    %edx,0x18(%eax)
c00035a5:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00035a8:	89 50 1c             	mov    %edx,0x1c(%eax)
c00035ab:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c00035ae:	89 50 20             	mov    %edx,0x20(%eax)
c00035b1:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00035b4:	89 50 24             	mov    %edx,0x24(%eax)
c00035b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00035ba:	c9                   	leave  
c00035bb:	c3                   	ret    

c00035bc <alloc_imap_bit>:
c00035bc:	55                   	push   %ebp
c00035bd:	89 e5                	mov    %esp,%ebp
c00035bf:	53                   	push   %ebx
c00035c0:	83 ec 24             	sub    $0x24,%esp
c00035c3:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00035ca:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00035d1:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00035d6:	83 ec 0c             	sub    $0xc,%esp
c00035d9:	6a 07                	push   $0x7
c00035db:	68 00 02 00 00       	push   $0x200
c00035e0:	50                   	push   %eax
c00035e1:	ff 75 e8             	pushl  -0x18(%ebp)
c00035e4:	ff 75 ec             	pushl  -0x14(%ebp)
c00035e7:	e8 93 f2 ff ff       	call   c000287f <rd_wt>
c00035ec:	83 c4 20             	add    $0x20,%esp
c00035ef:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00035f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00035fd:	e9 a5 00 00 00       	jmp    c00036a7 <alloc_imap_bit+0xeb>
c0003602:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003609:	e9 8b 00 00 00       	jmp    c0003699 <alloc_imap_bit+0xdd>
c000360e:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003614:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003617:	01 d0                	add    %edx,%eax
c0003619:	0f b6 00             	movzbl (%eax),%eax
c000361c:	0f be d0             	movsbl %al,%edx
c000361f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003622:	89 c1                	mov    %eax,%ecx
c0003624:	d3 fa                	sar    %cl,%edx
c0003626:	89 d0                	mov    %edx,%eax
c0003628:	83 e0 01             	and    $0x1,%eax
c000362b:	85 c0                	test   %eax,%eax
c000362d:	74 06                	je     c0003635 <alloc_imap_bit+0x79>
c000362f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003633:	eb 64                	jmp    c0003699 <alloc_imap_bit+0xdd>
c0003635:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c000363b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000363e:	01 d0                	add    %edx,%eax
c0003640:	0f b6 18             	movzbl (%eax),%ebx
c0003643:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003646:	ba 01 00 00 00       	mov    $0x1,%edx
c000364b:	89 c1                	mov    %eax,%ecx
c000364d:	d3 e2                	shl    %cl,%edx
c000364f:	89 d0                	mov    %edx,%eax
c0003651:	89 c1                	mov    %eax,%ecx
c0003653:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003659:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000365c:	01 d0                	add    %edx,%eax
c000365e:	09 cb                	or     %ecx,%ebx
c0003660:	89 da                	mov    %ebx,%edx
c0003662:	88 10                	mov    %dl,(%eax)
c0003664:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003667:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000366e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003671:	01 d0                	add    %edx,%eax
c0003673:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003676:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000367b:	83 ec 0c             	sub    $0xc,%esp
c000367e:	6a 0a                	push   $0xa
c0003680:	68 00 02 00 00       	push   $0x200
c0003685:	50                   	push   %eax
c0003686:	ff 75 e8             	pushl  -0x18(%ebp)
c0003689:	ff 75 ec             	pushl  -0x14(%ebp)
c000368c:	e8 ee f1 ff ff       	call   c000287f <rd_wt>
c0003691:	83 c4 20             	add    $0x20,%esp
c0003694:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003697:	eb 1b                	jmp    c00036b4 <alloc_imap_bit+0xf8>
c0003699:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c000369d:	0f 8e 6b ff ff ff    	jle    c000360e <alloc_imap_bit+0x52>
c00036a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00036a7:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c00036ae:	0f 8e 4e ff ff ff    	jle    c0003602 <alloc_imap_bit+0x46>
c00036b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00036b7:	c9                   	leave  
c00036b8:	c3                   	ret    

c00036b9 <alloc_smap_bit>:
c00036b9:	55                   	push   %ebp
c00036ba:	89 e5                	mov    %esp,%ebp
c00036bc:	53                   	push   %ebx
c00036bd:	83 ec 34             	sub    $0x34,%esp
c00036c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00036c4:	75 1c                	jne    c00036e2 <alloc_smap_bit+0x29>
c00036c6:	68 0f 03 00 00       	push   $0x30f
c00036cb:	68 e0 9c 00 c0       	push   $0xc0009ce0
c00036d0:	68 e0 9c 00 c0       	push   $0xc0009ce0
c00036d5:	68 76 9d 00 c0       	push   $0xc0009d76
c00036da:	e8 7d 54 00 00       	call   c0008b5c <assertion_failure>
c00036df:	83 c4 10             	add    $0x10,%esp
c00036e2:	e8 bd 0e 00 00       	call   c00045a4 <get_super_block>
c00036e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00036ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00036ed:	8b 40 08             	mov    0x8(%eax),%eax
c00036f0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00036f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00036f6:	8b 40 04             	mov    0x4(%eax),%eax
c00036f9:	83 c0 02             	add    $0x2,%eax
c00036fc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00036ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003706:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c000370d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003714:	e9 20 01 00 00       	jmp    c0003839 <alloc_smap_bit+0x180>
c0003719:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000371c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000371f:	01 d0                	add    %edx,%eax
c0003721:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003724:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003729:	83 ec 0c             	sub    $0xc,%esp
c000372c:	6a 07                	push   $0x7
c000372e:	68 00 02 00 00       	push   $0x200
c0003733:	50                   	push   %eax
c0003734:	ff 75 d8             	pushl  -0x28(%ebp)
c0003737:	ff 75 d4             	pushl  -0x2c(%ebp)
c000373a:	e8 40 f1 ff ff       	call   c000287f <rd_wt>
c000373f:	83 c4 20             	add    $0x20,%esp
c0003742:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003749:	e9 b0 00 00 00       	jmp    c00037fe <alloc_smap_bit+0x145>
c000374e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003755:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003759:	0f 85 8c 00 00 00    	jne    c00037eb <alloc_smap_bit+0x132>
c000375f:	eb 45                	jmp    c00037a6 <alloc_smap_bit+0xed>
c0003761:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003767:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000376a:	01 d0                	add    %edx,%eax
c000376c:	0f b6 00             	movzbl (%eax),%eax
c000376f:	0f be d0             	movsbl %al,%edx
c0003772:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003775:	89 c1                	mov    %eax,%ecx
c0003777:	d3 fa                	sar    %cl,%edx
c0003779:	89 d0                	mov    %edx,%eax
c000377b:	83 e0 01             	and    $0x1,%eax
c000377e:	85 c0                	test   %eax,%eax
c0003780:	74 06                	je     c0003788 <alloc_smap_bit+0xcf>
c0003782:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003786:	eb 1e                	jmp    c00037a6 <alloc_smap_bit+0xed>
c0003788:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000378b:	c1 e0 09             	shl    $0x9,%eax
c000378e:	89 c2                	mov    %eax,%edx
c0003790:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003793:	01 d0                	add    %edx,%eax
c0003795:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000379c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000379f:	01 d0                	add    %edx,%eax
c00037a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00037a4:	eb 06                	jmp    c00037ac <alloc_smap_bit+0xf3>
c00037a6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00037aa:	7e b5                	jle    c0003761 <alloc_smap_bit+0xa8>
c00037ac:	eb 3d                	jmp    c00037eb <alloc_smap_bit+0x132>
c00037ae:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00037b2:	74 45                	je     c00037f9 <alloc_smap_bit+0x140>
c00037b4:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00037ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00037bd:	01 d0                	add    %edx,%eax
c00037bf:	0f b6 18             	movzbl (%eax),%ebx
c00037c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00037c5:	ba 01 00 00 00       	mov    $0x1,%edx
c00037ca:	89 c1                	mov    %eax,%ecx
c00037cc:	d3 e2                	shl    %cl,%edx
c00037ce:	89 d0                	mov    %edx,%eax
c00037d0:	89 c1                	mov    %eax,%ecx
c00037d2:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00037d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00037db:	01 d0                	add    %edx,%eax
c00037dd:	09 cb                	or     %ecx,%ebx
c00037df:	89 da                	mov    %ebx,%edx
c00037e1:	88 10                	mov    %dl,(%eax)
c00037e3:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00037e7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00037eb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00037ef:	74 09                	je     c00037fa <alloc_smap_bit+0x141>
c00037f1:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00037f5:	7e b7                	jle    c00037ae <alloc_smap_bit+0xf5>
c00037f7:	eb 01                	jmp    c00037fa <alloc_smap_bit+0x141>
c00037f9:	90                   	nop
c00037fa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00037fe:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003805:	0f 8e 43 ff ff ff    	jle    c000374e <alloc_smap_bit+0x95>
c000380b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000380f:	74 1e                	je     c000382f <alloc_smap_bit+0x176>
c0003811:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003816:	83 ec 0c             	sub    $0xc,%esp
c0003819:	6a 0a                	push   $0xa
c000381b:	68 00 02 00 00       	push   $0x200
c0003820:	50                   	push   %eax
c0003821:	ff 75 d8             	pushl  -0x28(%ebp)
c0003824:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003827:	e8 53 f0 ff ff       	call   c000287f <rd_wt>
c000382c:	83 c4 20             	add    $0x20,%esp
c000382f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003833:	74 12                	je     c0003847 <alloc_smap_bit+0x18e>
c0003835:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003839:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000383c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c000383f:	0f 8c d4 fe ff ff    	jl     c0003719 <alloc_smap_bit+0x60>
c0003845:	eb 01                	jmp    c0003848 <alloc_smap_bit+0x18f>
c0003847:	90                   	nop
c0003848:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000384b:	8d 50 ff             	lea    -0x1(%eax),%edx
c000384e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003851:	8b 00                	mov    (%eax),%eax
c0003853:	01 d0                	add    %edx,%eax
c0003855:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003858:	c9                   	leave  
c0003859:	c3                   	ret    

c000385a <new_inode>:
c000385a:	55                   	push   %ebp
c000385b:	89 e5                	mov    %esp,%ebp
c000385d:	83 ec 38             	sub    $0x38,%esp
c0003860:	83 ec 08             	sub    $0x8,%esp
c0003863:	ff 75 0c             	pushl  0xc(%ebp)
c0003866:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003869:	50                   	push   %eax
c000386a:	e8 80 fa ff ff       	call   c00032ef <get_inode>
c000386f:	83 c4 10             	add    $0x10,%esp
c0003872:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003875:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003879:	75 0a                	jne    c0003885 <new_inode+0x2b>
c000387b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003880:	e9 f1 00 00 00       	jmp    c0003976 <new_inode+0x11c>
c0003885:	8b 45 10             	mov    0x10(%ebp),%eax
c0003888:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000388b:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003892:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003899:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c00038a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00038a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00038a6:	83 ec 0c             	sub    $0xc,%esp
c00038a9:	8d 45 c8             	lea    -0x38(%ebp),%eax
c00038ac:	50                   	push   %eax
c00038ad:	e8 0e 0b 00 00       	call   c00043c0 <sync_inode>
c00038b2:	83 c4 10             	add    $0x10,%esp
c00038b5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00038bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00038c3:	eb 1d                	jmp    c00038e2 <new_inode+0x88>
c00038c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00038c8:	89 d0                	mov    %edx,%eax
c00038ca:	c1 e0 02             	shl    $0x2,%eax
c00038cd:	01 d0                	add    %edx,%eax
c00038cf:	c1 e0 03             	shl    $0x3,%eax
c00038d2:	05 b0 17 01 c0       	add    $0xc00117b0,%eax
c00038d7:	8b 00                	mov    (%eax),%eax
c00038d9:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00038dc:	74 0c                	je     c00038ea <new_inode+0x90>
c00038de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00038e2:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00038e6:	7e dd                	jle    c00038c5 <new_inode+0x6b>
c00038e8:	eb 01                	jmp    c00038eb <new_inode+0x91>
c00038ea:	90                   	nop
c00038eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00038ee:	89 d0                	mov    %edx,%eax
c00038f0:	c1 e0 02             	shl    $0x2,%eax
c00038f3:	01 d0                	add    %edx,%eax
c00038f5:	c1 e0 03             	shl    $0x3,%eax
c00038f8:	05 a0 17 01 c0       	add    $0xc00117a0,%eax
c00038fd:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003900:	89 10                	mov    %edx,(%eax)
c0003902:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003905:	89 50 04             	mov    %edx,0x4(%eax)
c0003908:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000390b:	89 50 08             	mov    %edx,0x8(%eax)
c000390e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003911:	89 50 0c             	mov    %edx,0xc(%eax)
c0003914:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003917:	89 50 10             	mov    %edx,0x10(%eax)
c000391a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000391d:	89 50 14             	mov    %edx,0x14(%eax)
c0003920:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003923:	89 50 18             	mov    %edx,0x18(%eax)
c0003926:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003929:	89 50 1c             	mov    %edx,0x1c(%eax)
c000392c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000392f:	89 50 20             	mov    %edx,0x20(%eax)
c0003932:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003935:	89 50 24             	mov    %edx,0x24(%eax)
c0003938:	8b 45 08             	mov    0x8(%ebp),%eax
c000393b:	8b 55 c8             	mov    -0x38(%ebp),%edx
c000393e:	89 10                	mov    %edx,(%eax)
c0003940:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003943:	89 50 04             	mov    %edx,0x4(%eax)
c0003946:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003949:	89 50 08             	mov    %edx,0x8(%eax)
c000394c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c000394f:	89 50 0c             	mov    %edx,0xc(%eax)
c0003952:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003955:	89 50 10             	mov    %edx,0x10(%eax)
c0003958:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000395b:	89 50 14             	mov    %edx,0x14(%eax)
c000395e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003961:	89 50 18             	mov    %edx,0x18(%eax)
c0003964:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003967:	89 50 1c             	mov    %edx,0x1c(%eax)
c000396a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000396d:	89 50 20             	mov    %edx,0x20(%eax)
c0003970:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003973:	89 50 24             	mov    %edx,0x24(%eax)
c0003976:	c9                   	leave  
c0003977:	c3                   	ret    

c0003978 <new_dir_entry>:
c0003978:	55                   	push   %ebp
c0003979:	89 e5                	mov    %esp,%ebp
c000397b:	83 ec 48             	sub    $0x48,%esp
c000397e:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003985:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003988:	8b 40 04             	mov    0x4(%eax),%eax
c000398b:	99                   	cltd   
c000398c:	f7 7d dc             	idivl  -0x24(%ebp)
c000398f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003992:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003995:	8b 40 0c             	mov    0xc(%eax),%eax
c0003998:	99                   	cltd   
c0003999:	f7 7d dc             	idivl  -0x24(%ebp)
c000399c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000399f:	e8 00 0c 00 00       	call   c00045a4 <get_super_block>
c00039a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00039a7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00039aa:	8b 00                	mov    (%eax),%eax
c00039ac:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00039af:	8b 45 0c             	mov    0xc(%ebp),%eax
c00039b2:	8b 40 0c             	mov    0xc(%eax),%eax
c00039b5:	05 00 02 00 00       	add    $0x200,%eax
c00039ba:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00039c0:	85 c0                	test   %eax,%eax
c00039c2:	0f 48 c2             	cmovs  %edx,%eax
c00039c5:	c1 f8 09             	sar    $0x9,%eax
c00039c8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00039cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00039d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00039d9:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c00039e0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00039e7:	eb 7d                	jmp    c0003a66 <new_dir_entry+0xee>
c00039e9:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00039ee:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c00039f1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00039f4:	01 ca                	add    %ecx,%edx
c00039f6:	83 ec 0c             	sub    $0xc,%esp
c00039f9:	6a 07                	push   $0x7
c00039fb:	68 00 02 00 00       	push   $0x200
c0003a00:	50                   	push   %eax
c0003a01:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003a04:	52                   	push   %edx
c0003a05:	e8 75 ee ff ff       	call   c000287f <rd_wt>
c0003a0a:	83 c4 20             	add    $0x20,%esp
c0003a0d:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003a12:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a15:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003a1c:	eb 25                	jmp    c0003a43 <new_dir_entry+0xcb>
c0003a1e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003a22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003a25:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003a28:	7f 29                	jg     c0003a53 <new_dir_entry+0xdb>
c0003a2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a2d:	8b 00                	mov    (%eax),%eax
c0003a2f:	85 c0                	test   %eax,%eax
c0003a31:	75 08                	jne    c0003a3b <new_dir_entry+0xc3>
c0003a33:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a36:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003a39:	eb 19                	jmp    c0003a54 <new_dir_entry+0xdc>
c0003a3b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003a3f:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003a43:	b8 00 02 00 00       	mov    $0x200,%eax
c0003a48:	99                   	cltd   
c0003a49:	f7 7d dc             	idivl  -0x24(%ebp)
c0003a4c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003a4f:	7c cd                	jl     c0003a1e <new_dir_entry+0xa6>
c0003a51:	eb 01                	jmp    c0003a54 <new_dir_entry+0xdc>
c0003a53:	90                   	nop
c0003a54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003a57:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003a5a:	7f 16                	jg     c0003a72 <new_dir_entry+0xfa>
c0003a5c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a60:	75 10                	jne    c0003a72 <new_dir_entry+0xfa>
c0003a62:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003a66:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003a69:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003a6c:	0f 8c 77 ff ff ff    	jl     c00039e9 <new_dir_entry+0x71>
c0003a72:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003a75:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003a78:	75 0a                	jne    c0003a84 <new_dir_entry+0x10c>
c0003a7a:	b8 00 00 00 00       	mov    $0x0,%eax
c0003a7f:	e9 fa 00 00 00       	jmp    c0003b7e <new_dir_entry+0x206>
c0003a84:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003a8b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a8f:	75 1e                	jne    c0003aaf <new_dir_entry+0x137>
c0003a91:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a94:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003a97:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a9a:	8b 50 04             	mov    0x4(%eax),%edx
c0003a9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003aa0:	01 c2                	add    %eax,%edx
c0003aa2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003aa5:	89 50 04             	mov    %edx,0x4(%eax)
c0003aa8:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003ab2:	8b 55 14             	mov    0x14(%ebp),%edx
c0003ab5:	89 10                	mov    %edx,(%eax)
c0003ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003aba:	83 c0 04             	add    $0x4,%eax
c0003abd:	83 ec 08             	sub    $0x8,%esp
c0003ac0:	ff 75 10             	pushl  0x10(%ebp)
c0003ac3:	50                   	push   %eax
c0003ac4:	e8 15 6c 00 00       	call   c000a6de <Strcpy>
c0003ac9:	83 c4 10             	add    $0x10,%esp
c0003acc:	8b 45 08             	mov    0x8(%ebp),%eax
c0003acf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ad2:	8b 0a                	mov    (%edx),%ecx
c0003ad4:	89 08                	mov    %ecx,(%eax)
c0003ad6:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003ad9:	89 48 04             	mov    %ecx,0x4(%eax)
c0003adc:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003adf:	89 48 08             	mov    %ecx,0x8(%eax)
c0003ae2:	8b 52 0c             	mov    0xc(%edx),%edx
c0003ae5:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ae8:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003aed:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0003af0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003af3:	01 ca                	add    %ecx,%edx
c0003af5:	83 ec 0c             	sub    $0xc,%esp
c0003af8:	6a 0a                	push   $0xa
c0003afa:	68 00 02 00 00       	push   $0x200
c0003aff:	50                   	push   %eax
c0003b00:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003b03:	52                   	push   %edx
c0003b04:	e8 76 ed ff ff       	call   c000287f <rd_wt>
c0003b09:	83 c4 20             	add    $0x20,%esp
c0003b0c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003b10:	74 69                	je     c0003b7b <new_dir_entry+0x203>
c0003b12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b15:	8b 10                	mov    (%eax),%edx
c0003b17:	89 15 a0 21 01 c0    	mov    %edx,0xc00121a0
c0003b1d:	8b 50 04             	mov    0x4(%eax),%edx
c0003b20:	89 15 a4 21 01 c0    	mov    %edx,0xc00121a4
c0003b26:	8b 50 08             	mov    0x8(%eax),%edx
c0003b29:	89 15 a8 21 01 c0    	mov    %edx,0xc00121a8
c0003b2f:	8b 50 0c             	mov    0xc(%eax),%edx
c0003b32:	89 15 ac 21 01 c0    	mov    %edx,0xc00121ac
c0003b38:	8b 50 10             	mov    0x10(%eax),%edx
c0003b3b:	89 15 b0 21 01 c0    	mov    %edx,0xc00121b0
c0003b41:	8b 50 14             	mov    0x14(%eax),%edx
c0003b44:	89 15 b4 21 01 c0    	mov    %edx,0xc00121b4
c0003b4a:	8b 50 18             	mov    0x18(%eax),%edx
c0003b4d:	89 15 b8 21 01 c0    	mov    %edx,0xc00121b8
c0003b53:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003b56:	89 15 bc 21 01 c0    	mov    %edx,0xc00121bc
c0003b5c:	8b 50 20             	mov    0x20(%eax),%edx
c0003b5f:	89 15 c0 21 01 c0    	mov    %edx,0xc00121c0
c0003b65:	8b 40 24             	mov    0x24(%eax),%eax
c0003b68:	a3 c4 21 01 c0       	mov    %eax,0xc00121c4
c0003b6d:	83 ec 0c             	sub    $0xc,%esp
c0003b70:	ff 75 0c             	pushl  0xc(%ebp)
c0003b73:	e8 48 08 00 00       	call   c00043c0 <sync_inode>
c0003b78:	83 c4 10             	add    $0x10,%esp
c0003b7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0003b7e:	c9                   	leave  
c0003b7f:	c3                   	ret    

c0003b80 <do_unlink>:
c0003b80:	55                   	push   %ebp
c0003b81:	89 e5                	mov    %esp,%ebp
c0003b83:	53                   	push   %ebx
c0003b84:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003b8a:	83 ec 08             	sub    $0x8,%esp
c0003b8d:	ff 75 08             	pushl  0x8(%ebp)
c0003b90:	68 8b 9d 00 c0       	push   $0xc0009d8b
c0003b95:	e8 34 5a 00 00       	call   c00095ce <strcmp>
c0003b9a:	83 c4 10             	add    $0x10,%esp
c0003b9d:	85 c0                	test   %eax,%eax
c0003b9f:	75 10                	jne    c0003bb1 <do_unlink+0x31>
c0003ba1:	83 ec 0c             	sub    $0xc,%esp
c0003ba4:	68 8d 9d 00 c0       	push   $0xc0009d8d
c0003ba9:	e8 90 4f 00 00       	call   c0008b3e <panic>
c0003bae:	83 c4 10             	add    $0x10,%esp
c0003bb1:	83 ec 0c             	sub    $0xc,%esp
c0003bb4:	ff 75 08             	pushl  0x8(%ebp)
c0003bb7:	e8 37 f5 ff ff       	call   c00030f3 <search_file>
c0003bbc:	83 c4 10             	add    $0x10,%esp
c0003bbf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003bc2:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003bc6:	75 10                	jne    c0003bd8 <do_unlink+0x58>
c0003bc8:	83 ec 0c             	sub    $0xc,%esp
c0003bcb:	68 a9 9d 00 c0       	push   $0xc0009da9
c0003bd0:	e8 69 4f 00 00       	call   c0008b3e <panic>
c0003bd5:	83 c4 10             	add    $0x10,%esp
c0003bd8:	83 ec 08             	sub    $0x8,%esp
c0003bdb:	ff 75 d0             	pushl  -0x30(%ebp)
c0003bde:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003be4:	50                   	push   %eax
c0003be5:	e8 05 f7 ff ff       	call   c00032ef <get_inode>
c0003bea:	83 c4 10             	add    $0x10,%esp
c0003bed:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003bf0:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003bf4:	75 10                	jne    c0003c06 <do_unlink+0x86>
c0003bf6:	83 ec 0c             	sub    $0xc,%esp
c0003bf9:	68 a9 9d 00 c0       	push   $0xc0009da9
c0003bfe:	e8 3b 4f 00 00       	call   c0008b3e <panic>
c0003c03:	83 c4 10             	add    $0x10,%esp
c0003c06:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003c09:	85 c0                	test   %eax,%eax
c0003c0b:	7e 10                	jle    c0003c1d <do_unlink+0x9d>
c0003c0d:	83 ec 0c             	sub    $0xc,%esp
c0003c10:	68 c4 9d 00 c0       	push   $0xc0009dc4
c0003c15:	e8 24 4f 00 00       	call   c0008b3e <panic>
c0003c1a:	83 c4 10             	add    $0x10,%esp
c0003c1d:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003c23:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003c26:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003c29:	8d 50 07             	lea    0x7(%eax),%edx
c0003c2c:	85 c0                	test   %eax,%eax
c0003c2e:	0f 48 c2             	cmovs  %edx,%eax
c0003c31:	c1 f8 03             	sar    $0x3,%eax
c0003c34:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003c37:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003c3a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003c40:	85 c0                	test   %eax,%eax
c0003c42:	0f 48 c2             	cmovs  %edx,%eax
c0003c45:	c1 f8 09             	sar    $0x9,%eax
c0003c48:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003c4b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003c4e:	99                   	cltd   
c0003c4f:	c1 ea 1d             	shr    $0x1d,%edx
c0003c52:	01 d0                	add    %edx,%eax
c0003c54:	83 e0 07             	and    $0x7,%eax
c0003c57:	29 d0                	sub    %edx,%eax
c0003c59:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003c5c:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003c63:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003c68:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0003c6b:	83 c2 02             	add    $0x2,%edx
c0003c6e:	83 ec 0c             	sub    $0xc,%esp
c0003c71:	6a 07                	push   $0x7
c0003c73:	68 00 02 00 00       	push   $0x200
c0003c78:	50                   	push   %eax
c0003c79:	ff 75 b8             	pushl  -0x48(%ebp)
c0003c7c:	52                   	push   %edx
c0003c7d:	e8 fd eb ff ff       	call   c000287f <rd_wt>
c0003c82:	83 c4 20             	add    $0x20,%esp
c0003c85:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003c8b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003c8e:	01 d0                	add    %edx,%eax
c0003c90:	0f b6 10             	movzbl (%eax),%edx
c0003c93:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003c96:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003c9b:	89 c1                	mov    %eax,%ecx
c0003c9d:	d3 e3                	shl    %cl,%ebx
c0003c9f:	89 d8                	mov    %ebx,%eax
c0003ca1:	f7 d0                	not    %eax
c0003ca3:	89 c3                	mov    %eax,%ebx
c0003ca5:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0003cab:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003cae:	01 c8                	add    %ecx,%eax
c0003cb0:	21 da                	and    %ebx,%edx
c0003cb2:	88 10                	mov    %dl,(%eax)
c0003cb4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003cb9:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0003cbc:	83 c2 02             	add    $0x2,%edx
c0003cbf:	83 ec 0c             	sub    $0xc,%esp
c0003cc2:	6a 0a                	push   $0xa
c0003cc4:	68 00 02 00 00       	push   $0x200
c0003cc9:	50                   	push   %eax
c0003cca:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ccd:	52                   	push   %edx
c0003cce:	e8 ac eb ff ff       	call   c000287f <rd_wt>
c0003cd3:	83 c4 20             	add    $0x20,%esp
c0003cd6:	e8 c9 08 00 00       	call   c00045a4 <get_super_block>
c0003cdb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003cde:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003ce4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003ce7:	8b 00                	mov    (%eax),%eax
c0003ce9:	29 c2                	sub    %eax,%edx
c0003ceb:	89 d0                	mov    %edx,%eax
c0003ced:	83 c0 01             	add    $0x1,%eax
c0003cf0:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003cf3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003cf6:	8d 50 07             	lea    0x7(%eax),%edx
c0003cf9:	85 c0                	test   %eax,%eax
c0003cfb:	0f 48 c2             	cmovs  %edx,%eax
c0003cfe:	c1 f8 03             	sar    $0x3,%eax
c0003d01:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003d04:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003d07:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d0d:	85 c0                	test   %eax,%eax
c0003d0f:	0f 48 c2             	cmovs  %edx,%eax
c0003d12:	c1 f8 09             	sar    $0x9,%eax
c0003d15:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003d18:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003d1b:	99                   	cltd   
c0003d1c:	c1 ea 1d             	shr    $0x1d,%edx
c0003d1f:	01 d0                	add    %edx,%eax
c0003d21:	83 e0 07             	and    $0x7,%eax
c0003d24:	29 d0                	sub    %edx,%eax
c0003d26:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003d29:	b8 08 00 00 00       	mov    $0x8,%eax
c0003d2e:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003d31:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003d34:	29 c2                	sub    %eax,%edx
c0003d36:	89 d0                	mov    %edx,%eax
c0003d38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003d3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003d3e:	8d 50 07             	lea    0x7(%eax),%edx
c0003d41:	85 c0                	test   %eax,%eax
c0003d43:	0f 48 c2             	cmovs  %edx,%eax
c0003d46:	c1 f8 03             	sar    $0x3,%eax
c0003d49:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003d4c:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003d51:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0003d54:	8b 52 04             	mov    0x4(%edx),%edx
c0003d57:	8d 4a 02             	lea    0x2(%edx),%ecx
c0003d5a:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003d5d:	01 ca                	add    %ecx,%edx
c0003d5f:	83 ec 0c             	sub    $0xc,%esp
c0003d62:	6a 07                	push   $0x7
c0003d64:	68 00 02 00 00       	push   $0x200
c0003d69:	50                   	push   %eax
c0003d6a:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d6d:	52                   	push   %edx
c0003d6e:	e8 0c eb ff ff       	call   c000287f <rd_wt>
c0003d73:	83 c4 20             	add    $0x20,%esp
c0003d76:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003d7c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003d7f:	01 d0                	add    %edx,%eax
c0003d81:	0f b6 10             	movzbl (%eax),%edx
c0003d84:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003d87:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003d8c:	89 c1                	mov    %eax,%ecx
c0003d8e:	d3 e3                	shl    %cl,%ebx
c0003d90:	89 d8                	mov    %ebx,%eax
c0003d92:	f7 d0                	not    %eax
c0003d94:	89 c3                	mov    %eax,%ebx
c0003d96:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0003d9c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003d9f:	01 c8                	add    %ecx,%eax
c0003da1:	21 da                	and    %ebx,%edx
c0003da3:	88 10                	mov    %dl,(%eax)
c0003da5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003dac:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003daf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003db2:	eb 6a                	jmp    c0003e1e <do_unlink+0x29e>
c0003db4:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003dbb:	75 4b                	jne    c0003e08 <do_unlink+0x288>
c0003dbd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003dc4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003dc9:	83 ec 0c             	sub    $0xc,%esp
c0003dcc:	6a 0a                	push   $0xa
c0003dce:	68 00 02 00 00       	push   $0x200
c0003dd3:	50                   	push   %eax
c0003dd4:	ff 75 b8             	pushl  -0x48(%ebp)
c0003dd7:	ff 75 ec             	pushl  -0x14(%ebp)
c0003dda:	e8 a0 ea ff ff       	call   c000287f <rd_wt>
c0003ddf:	83 c4 20             	add    $0x20,%esp
c0003de2:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003de8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003deb:	8d 48 01             	lea    0x1(%eax),%ecx
c0003dee:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0003df1:	83 ec 0c             	sub    $0xc,%esp
c0003df4:	6a 07                	push   $0x7
c0003df6:	68 00 02 00 00       	push   $0x200
c0003dfb:	52                   	push   %edx
c0003dfc:	ff 75 b8             	pushl  -0x48(%ebp)
c0003dff:	50                   	push   %eax
c0003e00:	e8 7a ea ff ff       	call   c000287f <rd_wt>
c0003e05:	83 c4 20             	add    $0x20,%esp
c0003e08:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003e0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e11:	01 d0                	add    %edx,%eax
c0003e13:	c6 00 00             	movb   $0x0,(%eax)
c0003e16:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003e1a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003e1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e21:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003e24:	7c 8e                	jl     c0003db4 <do_unlink+0x234>
c0003e26:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003e2d:	75 4b                	jne    c0003e7a <do_unlink+0x2fa>
c0003e2f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003e36:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003e3b:	83 ec 0c             	sub    $0xc,%esp
c0003e3e:	6a 0a                	push   $0xa
c0003e40:	68 00 02 00 00       	push   $0x200
c0003e45:	50                   	push   %eax
c0003e46:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e49:	ff 75 ec             	pushl  -0x14(%ebp)
c0003e4c:	e8 2e ea ff ff       	call   c000287f <rd_wt>
c0003e51:	83 c4 20             	add    $0x20,%esp
c0003e54:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003e5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003e5d:	8d 48 01             	lea    0x1(%eax),%ecx
c0003e60:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0003e63:	83 ec 0c             	sub    $0xc,%esp
c0003e66:	6a 07                	push   $0x7
c0003e68:	68 00 02 00 00       	push   $0x200
c0003e6d:	52                   	push   %edx
c0003e6e:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e71:	50                   	push   %eax
c0003e72:	e8 08 ea ff ff       	call   c000287f <rd_wt>
c0003e77:	83 c4 20             	add    $0x20,%esp
c0003e7a:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0003e80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e83:	01 d0                	add    %edx,%eax
c0003e85:	0f b6 10             	movzbl (%eax),%edx
c0003e88:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e8b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003e90:	89 c1                	mov    %eax,%ecx
c0003e92:	d3 e3                	shl    %cl,%ebx
c0003e94:	89 d8                	mov    %ebx,%eax
c0003e96:	89 c3                	mov    %eax,%ebx
c0003e98:	8b 0d 20 d0 00 c0    	mov    0xc000d020,%ecx
c0003e9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003ea1:	01 c8                	add    %ecx,%eax
c0003ea3:	21 da                	and    %ebx,%edx
c0003ea5:	88 10                	mov    %dl,(%eax)
c0003ea7:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003eac:	83 ec 0c             	sub    $0xc,%esp
c0003eaf:	6a 0a                	push   $0xa
c0003eb1:	68 00 02 00 00       	push   $0x200
c0003eb6:	50                   	push   %eax
c0003eb7:	ff 75 b8             	pushl  -0x48(%ebp)
c0003eba:	ff 75 ec             	pushl  -0x14(%ebp)
c0003ebd:	e8 bd e9 ff ff       	call   c000287f <rd_wt>
c0003ec2:	83 c4 20             	add    $0x20,%esp
c0003ec5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0003ecc:	00 00 00 
c0003ecf:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0003ed6:	00 00 00 
c0003ed9:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0003ee0:	00 00 00 
c0003ee3:	83 ec 0c             	sub    $0xc,%esp
c0003ee6:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003eec:	50                   	push   %eax
c0003eed:	e8 ce 04 00 00       	call   c00043c0 <sync_inode>
c0003ef2:	83 c4 10             	add    $0x10,%esp
c0003ef5:	83 ec 0c             	sub    $0xc,%esp
c0003ef8:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003efe:	50                   	push   %eax
c0003eff:	e8 10 06 00 00       	call   c0004514 <put_inode>
c0003f04:	83 c4 10             	add    $0x10,%esp
c0003f07:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f0a:	8b 00                	mov    (%eax),%eax
c0003f0c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0003f0f:	c7 45 98 a0 21 01 c0 	movl   $0xc00121a0,-0x68(%ebp)
c0003f16:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003f19:	8b 40 04             	mov    0x4(%eax),%eax
c0003f1c:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0003f1f:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003f22:	8b 40 0c             	mov    0xc(%eax),%eax
c0003f25:	89 45 90             	mov    %eax,-0x70(%ebp)
c0003f28:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0003f2b:	c1 e8 04             	shr    $0x4,%eax
c0003f2e:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0003f31:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003f38:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003f3f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003f46:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0003f4d:	e9 a3 00 00 00       	jmp    c0003ff5 <do_unlink+0x475>
c0003f52:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003f57:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c0003f5a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003f5d:	01 ca                	add    %ecx,%edx
c0003f5f:	83 ec 0c             	sub    $0xc,%esp
c0003f62:	6a 07                	push   $0x7
c0003f64:	68 00 02 00 00       	push   $0x200
c0003f69:	50                   	push   %eax
c0003f6a:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f6d:	52                   	push   %edx
c0003f6e:	e8 0c e9 ff ff       	call   c000287f <rd_wt>
c0003f73:	83 c4 20             	add    $0x20,%esp
c0003f76:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0003f7b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003f7e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0003f85:	eb 51                	jmp    c0003fd8 <do_unlink+0x458>
c0003f87:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003f8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003f8e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003f91:	7f 4f                	jg     c0003fe2 <do_unlink+0x462>
c0003f93:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003f96:	83 c0 10             	add    $0x10,%eax
c0003f99:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003f9c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003f9f:	83 c0 04             	add    $0x4,%eax
c0003fa2:	83 ec 08             	sub    $0x8,%esp
c0003fa5:	ff 75 08             	pushl  0x8(%ebp)
c0003fa8:	50                   	push   %eax
c0003fa9:	e8 20 56 00 00       	call   c00095ce <strcmp>
c0003fae:	83 c4 10             	add    $0x10,%esp
c0003fb1:	85 c0                	test   %eax,%eax
c0003fb3:	75 1b                	jne    c0003fd0 <do_unlink+0x450>
c0003fb5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003fbc:	83 ec 04             	sub    $0x4,%esp
c0003fbf:	6a 10                	push   $0x10
c0003fc1:	6a 00                	push   $0x0
c0003fc3:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003fc6:	e8 f4 66 00 00       	call   c000a6bf <Memset>
c0003fcb:	83 c4 10             	add    $0x10,%esp
c0003fce:	eb 13                	jmp    c0003fe3 <do_unlink+0x463>
c0003fd0:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0003fd4:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0003fd8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003fdb:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003fde:	7c a7                	jl     c0003f87 <do_unlink+0x407>
c0003fe0:	eb 01                	jmp    c0003fe3 <do_unlink+0x463>
c0003fe2:	90                   	nop
c0003fe3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003fe6:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003fe9:	7f 16                	jg     c0004001 <do_unlink+0x481>
c0003feb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003fef:	75 10                	jne    c0004001 <do_unlink+0x481>
c0003ff1:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0003ff5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003ff8:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003ffb:	0f 8c 51 ff ff ff    	jl     c0003f52 <do_unlink+0x3d2>
c0004001:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004004:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004007:	75 17                	jne    c0004020 <do_unlink+0x4a0>
c0004009:	8b 45 98             	mov    -0x68(%ebp),%eax
c000400c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000400f:	89 50 04             	mov    %edx,0x4(%eax)
c0004012:	83 ec 0c             	sub    $0xc,%esp
c0004015:	ff 75 98             	pushl  -0x68(%ebp)
c0004018:	e8 a3 03 00 00       	call   c00043c0 <sync_inode>
c000401d:	83 c4 10             	add    $0x10,%esp
c0004020:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004024:	74 24                	je     c000404a <do_unlink+0x4ca>
c0004026:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c000402b:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c000402e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004031:	01 ca                	add    %ecx,%edx
c0004033:	83 ec 0c             	sub    $0xc,%esp
c0004036:	6a 0a                	push   $0xa
c0004038:	68 00 02 00 00       	push   $0x200
c000403d:	50                   	push   %eax
c000403e:	ff 75 b8             	pushl  -0x48(%ebp)
c0004041:	52                   	push   %edx
c0004042:	e8 38 e8 ff ff       	call   c000287f <rd_wt>
c0004047:	83 c4 20             	add    $0x20,%esp
c000404a:	90                   	nop
c000404b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000404e:	c9                   	leave  
c000404f:	c3                   	ret    

c0004050 <do_rdwt>:
c0004050:	55                   	push   %ebp
c0004051:	89 e5                	mov    %esp,%ebp
c0004053:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0004059:	8b 45 08             	mov    0x8(%ebp),%eax
c000405c:	8b 40 68             	mov    0x68(%eax),%eax
c000405f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004062:	8b 45 08             	mov    0x8(%ebp),%eax
c0004065:	8b 40 50             	mov    0x50(%eax),%eax
c0004068:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000406b:	8b 45 08             	mov    0x8(%ebp),%eax
c000406e:	8b 40 5c             	mov    0x5c(%eax),%eax
c0004071:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004074:	8b 45 08             	mov    0x8(%ebp),%eax
c0004077:	8b 00                	mov    (%eax),%eax
c0004079:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000407c:	8b 45 08             	mov    0x8(%ebp),%eax
c000407f:	8b 40 10             	mov    0x10(%eax),%eax
c0004082:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004085:	8b 45 08             	mov    0x8(%ebp),%eax
c0004088:	8b 40 40             	mov    0x40(%eax),%eax
c000408b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000408e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004091:	6b d0 2c             	imul   $0x2c,%eax,%edx
c0004094:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004097:	01 d0                	add    %edx,%eax
c0004099:	83 c0 10             	add    $0x10,%eax
c000409c:	8b 04 85 e4 21 08 c0 	mov    -0x3ff7de1c(,%eax,4),%eax
c00040a3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00040a6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00040a9:	8b 40 08             	mov    0x8(%eax),%eax
c00040ac:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00040af:	8b 45 08             	mov    0x8(%ebp),%eax
c00040b2:	8b 00                	mov    (%eax),%eax
c00040b4:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00040b7:	83 ec 08             	sub    $0x8,%esp
c00040ba:	ff 75 c0             	pushl  -0x40(%ebp)
c00040bd:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00040c3:	50                   	push   %eax
c00040c4:	e8 26 f2 ff ff       	call   c00032ef <get_inode>
c00040c9:	83 c4 10             	add    $0x10,%esp
c00040cc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00040cf:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c00040d3:	75 10                	jne    c00040e5 <do_rdwt+0x95>
c00040d5:	83 ec 0c             	sub    $0xc,%esp
c00040d8:	68 fc 9d 00 c0       	push   $0xc0009dfc
c00040dd:	e8 5c 4a 00 00       	call   c0008b3e <panic>
c00040e2:	83 c4 10             	add    $0x10,%esp
c00040e5:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00040eb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00040ee:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00040f1:	8b 40 04             	mov    0x4(%eax),%eax
c00040f4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00040f7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00040fb:	74 22                	je     c000411f <do_rdwt+0xcf>
c00040fd:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004101:	74 1c                	je     c000411f <do_rdwt+0xcf>
c0004103:	68 bb 04 00 00       	push   $0x4bb
c0004108:	68 e0 9c 00 c0       	push   $0xc0009ce0
c000410d:	68 e0 9c 00 c0       	push   $0xc0009ce0
c0004112:	68 0c 9e 00 c0       	push   $0xc0009e0c
c0004117:	e8 40 4a 00 00       	call   c0008b5c <assertion_failure>
c000411c:	83 c4 10             	add    $0x10,%esp
c000411f:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c0004125:	83 f8 01             	cmp    $0x1,%eax
c0004128:	75 4a                	jne    c0004174 <do_rdwt+0x124>
c000412a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000412e:	75 09                	jne    c0004139 <do_rdwt+0xe9>
c0004130:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0004137:	eb 0d                	jmp    c0004146 <do_rdwt+0xf6>
c0004139:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c000413d:	75 07                	jne    c0004146 <do_rdwt+0xf6>
c000413f:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0004146:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004149:	8b 45 08             	mov    0x8(%ebp),%eax
c000414c:	89 50 68             	mov    %edx,0x68(%eax)
c000414f:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0004152:	8b 45 08             	mov    0x8(%ebp),%eax
c0004155:	89 50 58             	mov    %edx,0x58(%eax)
c0004158:	83 ec 04             	sub    $0x4,%esp
c000415b:	6a 00                	push   $0x0
c000415d:	ff 75 08             	pushl  0x8(%ebp)
c0004160:	6a 03                	push   $0x3
c0004162:	e8 99 51 00 00       	call   c0009300 <send_rec>
c0004167:	83 c4 10             	add    $0x10,%esp
c000416a:	b8 00 00 00 00       	mov    $0x0,%eax
c000416f:	e9 4a 02 00 00       	jmp    c00043be <do_rdwt+0x36e>
c0004174:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004178:	75 12                	jne    c000418c <do_rdwt+0x13c>
c000417a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000417d:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
c0004180:	75 0a                	jne    c000418c <do_rdwt+0x13c>
c0004182:	b8 00 00 00 00       	mov    $0x0,%eax
c0004187:	e9 32 02 00 00       	jmp    c00043be <do_rdwt+0x36e>
c000418c:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004190:	75 18                	jne    c00041aa <do_rdwt+0x15a>
c0004192:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0004198:	c1 e0 09             	shl    $0x9,%eax
c000419b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c000419e:	75 0a                	jne    c00041aa <do_rdwt+0x15a>
c00041a0:	b8 00 00 00 00       	mov    $0x0,%eax
c00041a5:	e9 14 02 00 00       	jmp    c00043be <do_rdwt+0x36e>
c00041aa:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00041ae:	75 14                	jne    c00041c4 <do_rdwt+0x174>
c00041b0:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00041b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00041b6:	01 d0                	add    %edx,%eax
c00041b8:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c00041bb:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
c00041bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00041c2:	eb 19                	jmp    c00041dd <do_rdwt+0x18d>
c00041c4:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00041c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00041ca:	01 c2                	add    %eax,%edx
c00041cc:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00041d2:	c1 e0 09             	shl    $0x9,%eax
c00041d5:	39 c2                	cmp    %eax,%edx
c00041d7:	0f 4e c2             	cmovle %edx,%eax
c00041da:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00041dd:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00041e0:	99                   	cltd   
c00041e1:	c1 ea 17             	shr    $0x17,%edx
c00041e4:	01 d0                	add    %edx,%eax
c00041e6:	25 ff 01 00 00       	and    $0x1ff,%eax
c00041eb:	29 d0                	sub    %edx,%eax
c00041ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00041f0:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c00041f6:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00041f9:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00041ff:	85 c0                	test   %eax,%eax
c0004201:	0f 48 c1             	cmovs  %ecx,%eax
c0004204:	c1 f8 09             	sar    $0x9,%eax
c0004207:	01 d0                	add    %edx,%eax
c0004209:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000420c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0004212:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004215:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c000421b:	85 c0                	test   %eax,%eax
c000421d:	0f 48 c1             	cmovs  %ecx,%eax
c0004220:	c1 f8 09             	sar    $0x9,%eax
c0004223:	01 d0                	add    %edx,%eax
c0004225:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004228:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000422b:	2b 45 ac             	sub    -0x54(%ebp),%eax
c000422e:	ba 00 00 10 00       	mov    $0x100000,%edx
c0004233:	39 d0                	cmp    %edx,%eax
c0004235:	7d 0b                	jge    c0004242 <do_rdwt+0x1f2>
c0004237:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000423a:	2b 45 ac             	sub    -0x54(%ebp),%eax
c000423d:	83 c0 01             	add    $0x1,%eax
c0004240:	eb 05                	jmp    c0004247 <do_rdwt+0x1f7>
c0004242:	b8 00 00 10 00       	mov    $0x100000,%eax
c0004247:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c000424a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000424d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004250:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004257:	8b 45 08             	mov    0x8(%ebp),%eax
c000425a:	8b 00                	mov    (%eax),%eax
c000425c:	83 ec 0c             	sub    $0xc,%esp
c000425f:	50                   	push   %eax
c0004260:	e8 d9 04 00 00       	call   c000473e <pid2proc>
c0004265:	83 c4 10             	add    $0x10,%esp
c0004268:	89 45 a0             	mov    %eax,-0x60(%ebp)
c000426b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000426e:	8b 40 78             	mov    0x78(%eax),%eax
c0004271:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004274:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0004277:	83 ec 08             	sub    $0x8,%esp
c000427a:	ff 75 a0             	pushl  -0x60(%ebp)
c000427d:	50                   	push   %eax
c000427e:	e8 a4 05 00 00       	call   c0004827 <Seg2PhyAddrLDT>
c0004283:	83 c4 10             	add    $0x10,%esp
c0004286:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004289:	8b 55 98             	mov    -0x68(%ebp),%edx
c000428c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000428f:	01 d0                	add    %edx,%eax
c0004291:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004294:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0004297:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000429a:	e9 c7 00 00 00       	jmp    c0004366 <do_rdwt+0x316>
c000429f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00042a2:	c1 e0 09             	shl    $0x9,%eax
c00042a5:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00042a8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00042ab:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c00042af:	89 45 90             	mov    %eax,-0x70(%ebp)
c00042b2:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
c00042b9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00042bc:	c1 e0 09             	shl    $0x9,%eax
c00042bf:	89 c2                	mov    %eax,%edx
c00042c1:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00042c6:	83 ec 0c             	sub    $0xc,%esp
c00042c9:	6a 07                	push   $0x7
c00042cb:	52                   	push   %edx
c00042cc:	50                   	push   %eax
c00042cd:	ff 75 8c             	pushl  -0x74(%ebp)
c00042d0:	ff 75 e0             	pushl  -0x20(%ebp)
c00042d3:	e8 a7 e5 ff ff       	call   c000287f <rd_wt>
c00042d8:	83 c4 20             	add    $0x20,%esp
c00042db:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00042df:	75 25                	jne    c0004306 <do_rdwt+0x2b6>
c00042e1:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00042e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00042ea:	01 d0                	add    %edx,%eax
c00042ec:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c00042ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00042f2:	01 ca                	add    %ecx,%edx
c00042f4:	83 ec 04             	sub    $0x4,%esp
c00042f7:	ff 75 90             	pushl  -0x70(%ebp)
c00042fa:	50                   	push   %eax
c00042fb:	52                   	push   %edx
c00042fc:	e8 90 63 00 00       	call   c000a691 <Memcpy>
c0004301:	83 c4 10             	add    $0x10,%esp
c0004304:	eb 47                	jmp    c000434d <do_rdwt+0x2fd>
c0004306:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0004309:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000430c:	01 d0                	add    %edx,%eax
c000430e:	89 c1                	mov    %eax,%ecx
c0004310:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c0004316:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004319:	01 d0                	add    %edx,%eax
c000431b:	83 ec 04             	sub    $0x4,%esp
c000431e:	ff 75 90             	pushl  -0x70(%ebp)
c0004321:	51                   	push   %ecx
c0004322:	50                   	push   %eax
c0004323:	e8 69 63 00 00       	call   c000a691 <Memcpy>
c0004328:	83 c4 10             	add    $0x10,%esp
c000432b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000432e:	c1 e0 09             	shl    $0x9,%eax
c0004331:	89 c2                	mov    %eax,%edx
c0004333:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c0004338:	83 ec 0c             	sub    $0xc,%esp
c000433b:	6a 0a                	push   $0xa
c000433d:	52                   	push   %edx
c000433e:	50                   	push   %eax
c000433f:	ff 75 8c             	pushl  -0x74(%ebp)
c0004342:	ff 75 e0             	pushl  -0x20(%ebp)
c0004345:	e8 35 e5 ff ff       	call   c000287f <rd_wt>
c000434a:	83 c4 20             	add    $0x20,%esp
c000434d:	8b 45 90             	mov    -0x70(%ebp),%eax
c0004350:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004353:	8b 45 90             	mov    -0x70(%ebp),%eax
c0004356:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0004359:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004360:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004363:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004366:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004369:	3b 45 a8             	cmp    -0x58(%ebp),%eax
c000436c:	7f 0a                	jg     c0004378 <do_rdwt+0x328>
c000436e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004372:	0f 85 27 ff ff ff    	jne    c000429f <do_rdwt+0x24f>
c0004378:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000437b:	8b 50 04             	mov    0x4(%eax),%edx
c000437e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004381:	01 c2                	add    %eax,%edx
c0004383:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004386:	89 50 04             	mov    %edx,0x4(%eax)
c0004389:	8b 55 b0             	mov    -0x50(%ebp),%edx
c000438c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000438f:	01 c2                	add    %eax,%edx
c0004391:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0004397:	39 c2                	cmp    %eax,%edx
c0004399:	7e 20                	jle    c00043bb <do_rdwt+0x36b>
c000439b:	8b 55 b0             	mov    -0x50(%ebp),%edx
c000439e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00043a1:	01 d0                	add    %edx,%eax
c00043a3:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c00043a9:	83 ec 0c             	sub    $0xc,%esp
c00043ac:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00043b2:	50                   	push   %eax
c00043b3:	e8 08 00 00 00       	call   c00043c0 <sync_inode>
c00043b8:	83 c4 10             	add    $0x10,%esp
c00043bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043be:	c9                   	leave  
c00043bf:	c3                   	ret    

c00043c0 <sync_inode>:
c00043c0:	55                   	push   %ebp
c00043c1:	89 e5                	mov    %esp,%ebp
c00043c3:	53                   	push   %ebx
c00043c4:	83 ec 34             	sub    $0x34,%esp
c00043c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00043ce:	eb 74                	jmp    c0004444 <sync_inode+0x84>
c00043d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00043d3:	89 d0                	mov    %edx,%eax
c00043d5:	c1 e0 02             	shl    $0x2,%eax
c00043d8:	01 d0                	add    %edx,%eax
c00043da:	c1 e0 03             	shl    $0x3,%eax
c00043dd:	05 b0 17 01 c0       	add    $0xc00117b0,%eax
c00043e2:	8b 10                	mov    (%eax),%edx
c00043e4:	8b 45 08             	mov    0x8(%ebp),%eax
c00043e7:	8b 40 10             	mov    0x10(%eax),%eax
c00043ea:	39 c2                	cmp    %eax,%edx
c00043ec:	75 52                	jne    c0004440 <sync_inode+0x80>
c00043ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00043f1:	89 d0                	mov    %edx,%eax
c00043f3:	c1 e0 02             	shl    $0x2,%eax
c00043f6:	01 d0                	add    %edx,%eax
c00043f8:	c1 e0 03             	shl    $0x3,%eax
c00043fb:	8d 90 a0 17 01 c0    	lea    -0x3ffee860(%eax),%edx
c0004401:	8b 45 08             	mov    0x8(%ebp),%eax
c0004404:	8b 08                	mov    (%eax),%ecx
c0004406:	89 0a                	mov    %ecx,(%edx)
c0004408:	8b 48 04             	mov    0x4(%eax),%ecx
c000440b:	89 4a 04             	mov    %ecx,0x4(%edx)
c000440e:	8b 48 08             	mov    0x8(%eax),%ecx
c0004411:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004414:	8b 48 0c             	mov    0xc(%eax),%ecx
c0004417:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000441a:	8b 48 10             	mov    0x10(%eax),%ecx
c000441d:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004420:	8b 48 14             	mov    0x14(%eax),%ecx
c0004423:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004426:	8b 48 18             	mov    0x18(%eax),%ecx
c0004429:	89 4a 18             	mov    %ecx,0x18(%edx)
c000442c:	8b 48 1c             	mov    0x1c(%eax),%ecx
c000442f:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004432:	8b 48 20             	mov    0x20(%eax),%ecx
c0004435:	89 4a 20             	mov    %ecx,0x20(%edx)
c0004438:	8b 40 24             	mov    0x24(%eax),%eax
c000443b:	89 42 24             	mov    %eax,0x24(%edx)
c000443e:	eb 0a                	jmp    c000444a <sync_inode+0x8a>
c0004440:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004444:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0004448:	7e 86                	jle    c00043d0 <sync_inode+0x10>
c000444a:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004451:	8b 45 08             	mov    0x8(%ebp),%eax
c0004454:	8b 40 10             	mov    0x10(%eax),%eax
c0004457:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000445a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000445d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004460:	b8 00 02 00 00       	mov    $0x200,%eax
c0004465:	99                   	cltd   
c0004466:	f7 7d f0             	idivl  -0x10(%ebp)
c0004469:	89 c3                	mov    %eax,%ebx
c000446b:	89 c8                	mov    %ecx,%eax
c000446d:	99                   	cltd   
c000446e:	f7 fb                	idiv   %ebx
c0004470:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004473:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004476:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004479:	b8 00 02 00 00       	mov    $0x200,%eax
c000447e:	99                   	cltd   
c000447f:	f7 7d f0             	idivl  -0x10(%ebp)
c0004482:	89 c3                	mov    %eax,%ebx
c0004484:	89 c8                	mov    %ecx,%eax
c0004486:	99                   	cltd   
c0004487:	f7 fb                	idiv   %ebx
c0004489:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000448c:	8b 45 08             	mov    0x8(%ebp),%eax
c000448f:	8b 40 20             	mov    0x20(%eax),%eax
c0004492:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004495:	e8 0a 01 00 00       	call   c00045a4 <get_super_block>
c000449a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000449d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044a0:	8b 40 04             	mov    0x4(%eax),%eax
c00044a3:	8d 50 02             	lea    0x2(%eax),%edx
c00044a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044a9:	8b 40 08             	mov    0x8(%eax),%eax
c00044ac:	01 c2                	add    %eax,%edx
c00044ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00044b1:	01 d0                	add    %edx,%eax
c00044b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00044b6:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00044bb:	83 ec 0c             	sub    $0xc,%esp
c00044be:	6a 07                	push   $0x7
c00044c0:	68 00 02 00 00       	push   $0x200
c00044c5:	50                   	push   %eax
c00044c6:	ff 75 e0             	pushl  -0x20(%ebp)
c00044c9:	ff 75 d8             	pushl  -0x28(%ebp)
c00044cc:	e8 ae e3 ff ff       	call   c000287f <rd_wt>
c00044d1:	83 c4 20             	add    $0x20,%esp
c00044d4:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00044d9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00044dc:	83 ec 04             	sub    $0x4,%esp
c00044df:	ff 75 f0             	pushl  -0x10(%ebp)
c00044e2:	ff 75 08             	pushl  0x8(%ebp)
c00044e5:	ff 75 d4             	pushl  -0x2c(%ebp)
c00044e8:	e8 a4 61 00 00       	call   c000a691 <Memcpy>
c00044ed:	83 c4 10             	add    $0x10,%esp
c00044f0:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00044f5:	83 ec 0c             	sub    $0xc,%esp
c00044f8:	6a 0a                	push   $0xa
c00044fa:	68 00 02 00 00       	push   $0x200
c00044ff:	50                   	push   %eax
c0004500:	ff 75 e0             	pushl  -0x20(%ebp)
c0004503:	ff 75 d8             	pushl  -0x28(%ebp)
c0004506:	e8 74 e3 ff ff       	call   c000287f <rd_wt>
c000450b:	83 c4 20             	add    $0x20,%esp
c000450e:	90                   	nop
c000450f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004512:	c9                   	leave  
c0004513:	c3                   	ret    

c0004514 <put_inode>:
c0004514:	55                   	push   %ebp
c0004515:	89 e5                	mov    %esp,%ebp
c0004517:	83 ec 08             	sub    $0x8,%esp
c000451a:	8b 45 08             	mov    0x8(%ebp),%eax
c000451d:	8b 40 24             	mov    0x24(%eax),%eax
c0004520:	85 c0                	test   %eax,%eax
c0004522:	7f 1c                	jg     c0004540 <put_inode+0x2c>
c0004524:	68 55 05 00 00       	push   $0x555
c0004529:	68 e0 9c 00 c0       	push   $0xc0009ce0
c000452e:	68 e0 9c 00 c0       	push   $0xc0009ce0
c0004533:	68 40 9e 00 c0       	push   $0xc0009e40
c0004538:	e8 1f 46 00 00       	call   c0008b5c <assertion_failure>
c000453d:	83 c4 10             	add    $0x10,%esp
c0004540:	8b 45 08             	mov    0x8(%ebp),%eax
c0004543:	8b 40 24             	mov    0x24(%eax),%eax
c0004546:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004549:	8b 45 08             	mov    0x8(%ebp),%eax
c000454c:	89 50 24             	mov    %edx,0x24(%eax)
c000454f:	90                   	nop
c0004550:	c9                   	leave  
c0004551:	c3                   	ret    

c0004552 <do_close>:
c0004552:	55                   	push   %ebp
c0004553:	89 e5                	mov    %esp,%ebp
c0004555:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c000455a:	8b 55 08             	mov    0x8(%ebp),%edx
c000455d:	83 c2 10             	add    $0x10,%edx
c0004560:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004564:	8b 50 0c             	mov    0xc(%eax),%edx
c0004567:	83 ea 01             	sub    $0x1,%edx
c000456a:	89 50 0c             	mov    %edx,0xc(%eax)
c000456d:	8b 40 0c             	mov    0xc(%eax),%eax
c0004570:	85 c0                	test   %eax,%eax
c0004572:	75 16                	jne    c000458a <do_close+0x38>
c0004574:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c0004579:	8b 55 08             	mov    0x8(%ebp),%edx
c000457c:	83 c2 10             	add    $0x10,%edx
c000457f:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004583:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000458a:	a1 84 eb 00 c0       	mov    0xc000eb84,%eax
c000458f:	8b 55 08             	mov    0x8(%ebp),%edx
c0004592:	83 c2 10             	add    $0x10,%edx
c0004595:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
c000459c:	00 
c000459d:	b8 00 00 00 00       	mov    $0x0,%eax
c00045a2:	5d                   	pop    %ebp
c00045a3:	c3                   	ret    

c00045a4 <get_super_block>:
c00045a4:	55                   	push   %ebp
c00045a5:	89 e5                	mov    %esp,%ebp
c00045a7:	83 ec 08             	sub    $0x8,%esp
c00045aa:	a1 20 d0 00 c0       	mov    0xc000d020,%eax
c00045af:	83 ec 0c             	sub    $0xc,%esp
c00045b2:	6a 07                	push   $0x7
c00045b4:	68 00 02 00 00       	push   $0x200
c00045b9:	50                   	push   %eax
c00045ba:	6a 20                	push   $0x20
c00045bc:	6a 01                	push   $0x1
c00045be:	e8 bc e2 ff ff       	call   c000287f <rd_wt>
c00045c3:	83 c4 20             	add    $0x20,%esp
c00045c6:	8b 15 20 d0 00 c0    	mov    0xc000d020,%edx
c00045cc:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c00045d1:	8b 0a                	mov    (%edx),%ecx
c00045d3:	89 08                	mov    %ecx,(%eax)
c00045d5:	8b 4a 04             	mov    0x4(%edx),%ecx
c00045d8:	89 48 04             	mov    %ecx,0x4(%eax)
c00045db:	8b 4a 08             	mov    0x8(%edx),%ecx
c00045de:	89 48 08             	mov    %ecx,0x8(%eax)
c00045e1:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00045e4:	89 48 0c             	mov    %ecx,0xc(%eax)
c00045e7:	8b 4a 10             	mov    0x10(%edx),%ecx
c00045ea:	89 48 10             	mov    %ecx,0x10(%eax)
c00045ed:	8b 4a 14             	mov    0x14(%edx),%ecx
c00045f0:	89 48 14             	mov    %ecx,0x14(%eax)
c00045f3:	8b 4a 18             	mov    0x18(%edx),%ecx
c00045f6:	89 48 18             	mov    %ecx,0x18(%eax)
c00045f9:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00045fc:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00045ff:	8b 52 20             	mov    0x20(%edx),%edx
c0004602:	89 50 20             	mov    %edx,0x20(%eax)
c0004605:	a1 24 d0 00 c0       	mov    0xc000d024,%eax
c000460a:	c9                   	leave  
c000460b:	c3                   	ret    

c000460c <check>:
c000460c:	55                   	push   %ebp
c000460d:	89 e5                	mov    %esp,%ebp
c000460f:	83 ec 18             	sub    $0x18,%esp
c0004612:	c7 45 f4 e0 21 08 c0 	movl   $0xc00821e0,-0xc(%ebp)
c0004619:	eb 50                	jmp    c000466b <check+0x5f>
c000461b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000461e:	8b 40 60             	mov    0x60(%eax),%eax
c0004621:	85 c0                	test   %eax,%eax
c0004623:	74 3f                	je     c0004664 <check+0x58>
c0004625:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004628:	8b 40 60             	mov    0x60(%eax),%eax
c000462b:	83 f8 01             	cmp    $0x1,%eax
c000462e:	74 34                	je     c0004664 <check+0x58>
c0004630:	c7 05 5c e7 00 c0 02 	movl   $0x2802,0xc000e75c
c0004637:	28 00 00 
c000463a:	83 ec 08             	sub    $0x8,%esp
c000463d:	6a 0a                	push   $0xa
c000463f:	68 4f 9e 00 c0       	push   $0xc0009e4f
c0004644:	e8 7e cf ff ff       	call   c00015c7 <disp_str_colour>
c0004649:	83 c4 10             	add    $0x10,%esp
c000464c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000464f:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0004653:	0f be c0             	movsbl %al,%eax
c0004656:	83 ec 0c             	sub    $0xc,%esp
c0004659:	50                   	push   %eax
c000465a:	e8 97 29 00 00       	call   c0006ff6 <disp_int>
c000465f:	83 c4 10             	add    $0x10,%esp
c0004662:	eb fe                	jmp    c0004662 <check+0x56>
c0004664:	81 45 f4 b0 00 00 00 	addl   $0xb0,-0xc(%ebp)
c000466b:	b8 40 23 08 c0       	mov    $0xc0082340,%eax
c0004670:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0004673:	72 a6                	jb     c000461b <check+0xf>
c0004675:	90                   	nop
c0004676:	c9                   	leave  
c0004677:	c3                   	ret    

c0004678 <schedule_process>:
c0004678:	55                   	push   %ebp
c0004679:	89 e5                	mov    %esp,%ebp
c000467b:	83 ec 18             	sub    $0x18,%esp
c000467e:	e8 18 d2 ff ff       	call   c000189b <get_running_thread_pcb>
c0004683:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004686:	83 ec 0c             	sub    $0xc,%esp
c0004689:	68 ac ed 00 c0       	push   $0xc000edac
c000468e:	e8 40 52 00 00       	call   c00098d3 <isListEmpty>
c0004693:	83 c4 10             	add    $0x10,%esp
c0004696:	3c 01                	cmp    $0x1,%al
c0004698:	75 08                	jne    c00046a2 <schedule_process+0x2a>
c000469a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000469d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00046a0:	eb 32                	jmp    c00046d4 <schedule_process+0x5c>
c00046a2:	83 ec 0c             	sub    $0xc,%esp
c00046a5:	68 ac ed 00 c0       	push   $0xc000edac
c00046aa:	e8 07 53 00 00       	call   c00099b6 <popFromDoubleLinkList>
c00046af:	83 c4 10             	add    $0x10,%esp
c00046b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00046b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00046b9:	74 19                	je     c00046d4 <schedule_process+0x5c>
c00046bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00046c1:	83 ec 08             	sub    $0x8,%esp
c00046c4:	ff 75 f4             	pushl  -0xc(%ebp)
c00046c7:	68 ac ed 00 c0       	push   $0xc000edac
c00046cc:	e8 23 52 00 00       	call   c00098f4 <appendToDoubleLinkList>
c00046d1:	83 c4 10             	add    $0x10,%esp
c00046d4:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c00046db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00046de:	8b 40 04             	mov    0x4(%eax),%eax
c00046e1:	85 c0                	test   %eax,%eax
c00046e3:	74 28                	je     c000470d <schedule_process+0x95>
c00046e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00046e8:	05 00 10 00 00       	add    $0x1000,%eax
c00046ed:	83 ec 0c             	sub    $0xc,%esp
c00046f0:	50                   	push   %eax
c00046f1:	e8 96 d1 ff ff       	call   c000188c <update_tss>
c00046f6:	83 c4 10             	add    $0x10,%esp
c00046f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00046fc:	8b 40 04             	mov    0x4(%eax),%eax
c00046ff:	83 ec 0c             	sub    $0xc,%esp
c0004702:	50                   	push   %eax
c0004703:	e8 77 d1 ff ff       	call   c000187f <update_cr3>
c0004708:	83 c4 10             	add    $0x10,%esp
c000470b:	eb 0f                	jmp    c000471c <schedule_process+0xa4>
c000470d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004710:	83 ec 0c             	sub    $0xc,%esp
c0004713:	50                   	push   %eax
c0004714:	e8 66 d1 ff ff       	call   c000187f <update_cr3>
c0004719:	83 c4 10             	add    $0x10,%esp
c000471c:	83 ec 08             	sub    $0x8,%esp
c000471f:	ff 75 f4             	pushl  -0xc(%ebp)
c0004722:	ff 75 f0             	pushl  -0x10(%ebp)
c0004725:	e8 66 51 00 00       	call   c0009890 <switch_to>
c000472a:	83 c4 10             	add    $0x10,%esp
c000472d:	90                   	nop
c000472e:	c9                   	leave  
c000472f:	c3                   	ret    

c0004730 <clock_handler>:
c0004730:	55                   	push   %ebp
c0004731:	89 e5                	mov    %esp,%ebp
c0004733:	83 ec 08             	sub    $0x8,%esp
c0004736:	e8 3d ff ff ff       	call   c0004678 <schedule_process>
c000473b:	90                   	nop
c000473c:	c9                   	leave  
c000473d:	c3                   	ret    

c000473e <pid2proc>:
c000473e:	55                   	push   %ebp
c000473f:	89 e5                	mov    %esp,%ebp
c0004741:	83 ec 10             	sub    $0x10,%esp
c0004744:	8b 45 08             	mov    0x8(%ebp),%eax
c0004747:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000474d:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c0004752:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004755:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004758:	c9                   	leave  
c0004759:	c3                   	ret    

c000475a <proc2pid>:
c000475a:	55                   	push   %ebp
c000475b:	89 e5                	mov    %esp,%ebp
c000475d:	83 ec 10             	sub    $0x10,%esp
c0004760:	8b 45 08             	mov    0x8(%ebp),%eax
c0004763:	2d e0 21 08 c0       	sub    $0xc00821e0,%eax
c0004768:	c1 f8 04             	sar    $0x4,%eax
c000476b:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
c0004771:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004774:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004777:	c9                   	leave  
c0004778:	c3                   	ret    

c0004779 <InitDescriptor>:
c0004779:	55                   	push   %ebp
c000477a:	89 e5                	mov    %esp,%ebp
c000477c:	83 ec 04             	sub    $0x4,%esp
c000477f:	8b 45 14             	mov    0x14(%ebp),%eax
c0004782:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004786:	8b 45 10             	mov    0x10(%ebp),%eax
c0004789:	89 c2                	mov    %eax,%edx
c000478b:	8b 45 08             	mov    0x8(%ebp),%eax
c000478e:	66 89 10             	mov    %dx,(%eax)
c0004791:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004794:	89 c2                	mov    %eax,%edx
c0004796:	8b 45 08             	mov    0x8(%ebp),%eax
c0004799:	66 89 50 02          	mov    %dx,0x2(%eax)
c000479d:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047a0:	c1 e8 10             	shr    $0x10,%eax
c00047a3:	89 c2                	mov    %eax,%edx
c00047a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00047a8:	88 50 04             	mov    %dl,0x4(%eax)
c00047ab:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c00047af:	89 c2                	mov    %eax,%edx
c00047b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00047b4:	88 50 05             	mov    %dl,0x5(%eax)
c00047b7:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c00047bb:	66 c1 e8 08          	shr    $0x8,%ax
c00047bf:	c1 e0 04             	shl    $0x4,%eax
c00047c2:	89 c2                	mov    %eax,%edx
c00047c4:	8b 45 10             	mov    0x10(%ebp),%eax
c00047c7:	c1 e8 10             	shr    $0x10,%eax
c00047ca:	83 e0 0f             	and    $0xf,%eax
c00047cd:	09 c2                	or     %eax,%edx
c00047cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00047d2:	88 50 06             	mov    %dl,0x6(%eax)
c00047d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047d8:	c1 e8 18             	shr    $0x18,%eax
c00047db:	89 c2                	mov    %eax,%edx
c00047dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00047e0:	88 50 07             	mov    %dl,0x7(%eax)
c00047e3:	90                   	nop
c00047e4:	c9                   	leave  
c00047e5:	c3                   	ret    

c00047e6 <Seg2PhyAddr>:
c00047e6:	55                   	push   %ebp
c00047e7:	89 e5                	mov    %esp,%ebp
c00047e9:	83 ec 10             	sub    $0x10,%esp
c00047ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00047ef:	c1 e8 03             	shr    $0x3,%eax
c00047f2:	8b 14 c5 84 e7 00 c0 	mov    -0x3fff187c(,%eax,8),%edx
c00047f9:	8b 04 c5 80 e7 00 c0 	mov    -0x3fff1880(,%eax,8),%eax
c0004800:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004803:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004806:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000480a:	0f b7 c0             	movzwl %ax,%eax
c000480d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004811:	0f b6 d2             	movzbl %dl,%edx
c0004814:	c1 e2 10             	shl    $0x10,%edx
c0004817:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c000481d:	09 d0                	or     %edx,%eax
c000481f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004822:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004825:	c9                   	leave  
c0004826:	c3                   	ret    

c0004827 <Seg2PhyAddrLDT>:
c0004827:	55                   	push   %ebp
c0004828:	89 e5                	mov    %esp,%ebp
c000482a:	83 ec 10             	sub    $0x10,%esp
c000482d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004830:	c1 e8 03             	shr    $0x3,%eax
c0004833:	89 c2                	mov    %eax,%edx
c0004835:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004838:	8d 54 d0 0e          	lea    0xe(%eax,%edx,8),%edx
c000483c:	8b 02                	mov    (%edx),%eax
c000483e:	8b 52 04             	mov    0x4(%edx),%edx
c0004841:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004844:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004847:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000484b:	0f b7 c0             	movzwl %ax,%eax
c000484e:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004852:	0f b6 d2             	movzbl %dl,%edx
c0004855:	c1 e2 10             	shl    $0x10,%edx
c0004858:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c000485e:	09 d0                	or     %edx,%eax
c0004860:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004863:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004866:	c9                   	leave  
c0004867:	c3                   	ret    

c0004868 <VirAddr2PhyAddr>:
c0004868:	55                   	push   %ebp
c0004869:	89 e5                	mov    %esp,%ebp
c000486b:	83 ec 10             	sub    $0x10,%esp
c000486e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004871:	8b 45 08             	mov    0x8(%ebp),%eax
c0004874:	01 d0                	add    %edx,%eax
c0004876:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004879:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000487c:	c9                   	leave  
c000487d:	c3                   	ret    

c000487e <v2l>:
c000487e:	55                   	push   %ebp
c000487f:	89 e5                	mov    %esp,%ebp
c0004881:	83 ec 18             	sub    $0x18,%esp
c0004884:	83 ec 0c             	sub    $0xc,%esp
c0004887:	ff 75 08             	pushl  0x8(%ebp)
c000488a:	e8 af fe ff ff       	call   c000473e <pid2proc>
c000488f:	83 c4 10             	add    $0x10,%esp
c0004892:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004895:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000489c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000489f:	83 ec 08             	sub    $0x8,%esp
c00048a2:	ff 75 f4             	pushl  -0xc(%ebp)
c00048a5:	50                   	push   %eax
c00048a6:	e8 7c ff ff ff       	call   c0004827 <Seg2PhyAddrLDT>
c00048ab:	83 c4 10             	add    $0x10,%esp
c00048ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00048b1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00048b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00048b7:	01 d0                	add    %edx,%eax
c00048b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00048bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00048bf:	c9                   	leave  
c00048c0:	c3                   	ret    

c00048c1 <init_propt>:
c00048c1:	55                   	push   %ebp
c00048c2:	89 e5                	mov    %esp,%ebp
c00048c4:	83 ec 28             	sub    $0x28,%esp
c00048c7:	6a 0e                	push   $0xe
c00048c9:	6a 08                	push   $0x8
c00048cb:	68 6a 16 00 c0       	push   $0xc000166a
c00048d0:	6a 20                	push   $0x20
c00048d2:	e8 18 01 00 00       	call   c00049ef <InitInterruptDesc>
c00048d7:	83 c4 10             	add    $0x10,%esp
c00048da:	6a 0e                	push   $0xe
c00048dc:	6a 08                	push   $0x8
c00048de:	68 98 16 00 c0       	push   $0xc0001698
c00048e3:	6a 21                	push   $0x21
c00048e5:	e8 05 01 00 00       	call   c00049ef <InitInterruptDesc>
c00048ea:	83 c4 10             	add    $0x10,%esp
c00048ed:	6a 0e                	push   $0xe
c00048ef:	6a 08                	push   $0x8
c00048f1:	68 e1 16 00 c0       	push   $0xc00016e1
c00048f6:	6a 2e                	push   $0x2e
c00048f8:	e8 f2 00 00 00       	call   c00049ef <InitInterruptDesc>
c00048fd:	83 c4 10             	add    $0x10,%esp
c0004900:	83 ec 04             	sub    $0x4,%esp
c0004903:	68 c0 02 00 00       	push   $0x2c0
c0004908:	6a 00                	push   $0x0
c000490a:	68 e0 21 08 c0       	push   $0xc00821e0
c000490f:	e8 ab 5d 00 00       	call   c000a6bf <Memset>
c0004914:	83 c4 10             	add    $0x10,%esp
c0004917:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c000491e:	83 ec 04             	sub    $0x4,%esp
c0004921:	ff 75 f4             	pushl  -0xc(%ebp)
c0004924:	6a 00                	push   $0x0
c0004926:	68 60 06 01 c0       	push   $0xc0010660
c000492b:	e8 8f 5d 00 00       	call   c000a6bf <Memset>
c0004930:	83 c4 10             	add    $0x10,%esp
c0004933:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004936:	a3 c8 06 01 c0       	mov    %eax,0xc00106c8
c000493b:	c7 05 68 06 01 c0 30 	movl   $0x30,0xc0010668
c0004942:	00 00 00 
c0004945:	83 ec 0c             	sub    $0xc,%esp
c0004948:	6a 30                	push   $0x30
c000494a:	e8 97 fe ff ff       	call   c00047e6 <Seg2PhyAddr>
c000494f:	83 c4 10             	add    $0x10,%esp
c0004952:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004955:	c7 45 ec 60 06 01 c0 	movl   $0xc0010660,-0x14(%ebp)
c000495c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004963:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004966:	0f b7 d0             	movzwl %ax,%edx
c0004969:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000496c:	83 e8 01             	sub    $0x1,%eax
c000496f:	89 c1                	mov    %eax,%ecx
c0004971:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004974:	52                   	push   %edx
c0004975:	51                   	push   %ecx
c0004976:	50                   	push   %eax
c0004977:	68 c0 e7 00 c0       	push   $0xc000e7c0
c000497c:	e8 f8 fd ff ff       	call   c0004779 <InitDescriptor>
c0004981:	83 c4 10             	add    $0x10,%esp
c0004984:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c000498b:	68 f2 00 00 00       	push   $0xf2
c0004990:	68 ff ff 00 00       	push   $0xffff
c0004995:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004998:	68 b8 e7 00 c0       	push   $0xc000e7b8
c000499d:	e8 d7 fd ff ff       	call   c0004779 <InitDescriptor>
c00049a2:	83 c4 10             	add    $0x10,%esp
c00049a5:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c00049ac:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c00049b3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c00049ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00049bd:	0f b7 c0             	movzwl %ax,%eax
c00049c0:	50                   	push   %eax
c00049c1:	ff 75 d8             	pushl  -0x28(%ebp)
c00049c4:	6a 00                	push   $0x0
c00049c6:	68 c8 e7 00 c0       	push   $0xc000e7c8
c00049cb:	e8 a9 fd ff ff       	call   c0004779 <InitDescriptor>
c00049d0:	83 c4 10             	add    $0x10,%esp
c00049d3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00049d6:	0f b7 c0             	movzwl %ax,%eax
c00049d9:	50                   	push   %eax
c00049da:	ff 75 d8             	pushl  -0x28(%ebp)
c00049dd:	6a 00                	push   $0x0
c00049df:	68 d0 e7 00 c0       	push   $0xc000e7d0
c00049e4:	e8 90 fd ff ff       	call   c0004779 <InitDescriptor>
c00049e9:	83 c4 10             	add    $0x10,%esp
c00049ec:	90                   	nop
c00049ed:	c9                   	leave  
c00049ee:	c3                   	ret    

c00049ef <InitInterruptDesc>:
c00049ef:	55                   	push   %ebp
c00049f0:	89 e5                	mov    %esp,%ebp
c00049f2:	83 ec 10             	sub    $0x10,%esp
c00049f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00049f8:	c1 e0 03             	shl    $0x3,%eax
c00049fb:	05 00 07 01 c0       	add    $0xc0010700,%eax
c0004a00:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a03:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a06:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004a0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a0d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a10:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a13:	89 c2                	mov    %eax,%edx
c0004a15:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a18:	66 89 10             	mov    %dx,(%eax)
c0004a1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a1e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004a24:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a27:	c1 f8 10             	sar    $0x10,%eax
c0004a2a:	89 c2                	mov    %eax,%edx
c0004a2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a2f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004a33:	8b 45 10             	mov    0x10(%ebp),%eax
c0004a36:	c1 e0 04             	shl    $0x4,%eax
c0004a39:	89 c2                	mov    %eax,%edx
c0004a3b:	8b 45 14             	mov    0x14(%ebp),%eax
c0004a3e:	09 d0                	or     %edx,%eax
c0004a40:	89 c2                	mov    %eax,%edx
c0004a42:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a45:	88 50 05             	mov    %dl,0x5(%eax)
c0004a48:	90                   	nop
c0004a49:	c9                   	leave  
c0004a4a:	c3                   	ret    

c0004a4b <ReloadGDT>:
c0004a4b:	55                   	push   %ebp
c0004a4c:	89 e5                	mov    %esp,%ebp
c0004a4e:	83 ec 28             	sub    $0x28,%esp
c0004a51:	b8 e8 06 01 c0       	mov    $0xc00106e8,%eax
c0004a56:	0f b7 00             	movzwl (%eax),%eax
c0004a59:	98                   	cwtl   
c0004a5a:	ba ea 06 01 c0       	mov    $0xc00106ea,%edx
c0004a5f:	8b 12                	mov    (%edx),%edx
c0004a61:	83 ec 04             	sub    $0x4,%esp
c0004a64:	50                   	push   %eax
c0004a65:	52                   	push   %edx
c0004a66:	68 80 e7 00 c0       	push   $0xc000e780
c0004a6b:	e8 21 5c 00 00       	call   c000a691 <Memcpy>
c0004a70:	83 c4 10             	add    $0x10,%esp
c0004a73:	c7 45 f0 e8 06 01 c0 	movl   $0xc00106e8,-0x10(%ebp)
c0004a7a:	c7 45 ec ea 06 01 c0 	movl   $0xc00106ea,-0x14(%ebp)
c0004a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a84:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004a89:	ba 80 e7 00 c0       	mov    $0xc000e780,%edx
c0004a8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004a91:	89 10                	mov    %edx,(%eax)
c0004a93:	c7 45 e8 48 e7 00 c0 	movl   $0xc000e748,-0x18(%ebp)
c0004a9a:	c7 45 e4 4a e7 00 c0 	movl   $0xc000e74a,-0x1c(%ebp)
c0004aa1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004aa4:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004aa9:	ba 00 07 01 c0       	mov    $0xc0010700,%edx
c0004aae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004ab1:	89 10                	mov    %edx,(%eax)
c0004ab3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004aba:	eb 04                	jmp    c0004ac0 <ReloadGDT+0x75>
c0004abc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004ac0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004ac7:	7e f3                	jle    c0004abc <ReloadGDT+0x71>
c0004ac9:	e8 ec 29 00 00       	call   c00074ba <init_internal_interrupt>
c0004ace:	e8 ee fd ff ff       	call   c00048c1 <init_propt>
c0004ad3:	90                   	nop
c0004ad4:	c9                   	leave  
c0004ad5:	c3                   	ret    

c0004ad6 <select_console>:
c0004ad6:	55                   	push   %ebp
c0004ad7:	89 e5                	mov    %esp,%ebp
c0004ad9:	83 ec 18             	sub    $0x18,%esp
c0004adc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004adf:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004ae2:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004ae6:	77 27                	ja     c0004b0f <select_console+0x39>
c0004ae8:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004aec:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0004af2:	05 e0 ed 00 c0       	add    $0xc000ede0,%eax
c0004af7:	a3 40 e7 00 c0       	mov    %eax,0xc000e740
c0004afc:	a1 40 e7 00 c0       	mov    0xc000e740,%eax
c0004b01:	83 ec 0c             	sub    $0xc,%esp
c0004b04:	50                   	push   %eax
c0004b05:	e8 08 00 00 00       	call   c0004b12 <flush>
c0004b0a:	83 c4 10             	add    $0x10,%esp
c0004b0d:	eb 01                	jmp    c0004b10 <select_console+0x3a>
c0004b0f:	90                   	nop
c0004b10:	c9                   	leave  
c0004b11:	c3                   	ret    

c0004b12 <flush>:
c0004b12:	55                   	push   %ebp
c0004b13:	89 e5                	mov    %esp,%ebp
c0004b15:	83 ec 08             	sub    $0x8,%esp
c0004b18:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b1b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004b21:	8b 40 0c             	mov    0xc(%eax),%eax
c0004b24:	83 ec 0c             	sub    $0xc,%esp
c0004b27:	50                   	push   %eax
c0004b28:	e8 1e 00 00 00       	call   c0004b4b <set_cursor>
c0004b2d:	83 c4 10             	add    $0x10,%esp
c0004b30:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b33:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004b39:	8b 40 08             	mov    0x8(%eax),%eax
c0004b3c:	83 ec 0c             	sub    $0xc,%esp
c0004b3f:	50                   	push   %eax
c0004b40:	e8 64 00 00 00       	call   c0004ba9 <set_console_start_video_addr>
c0004b45:	83 c4 10             	add    $0x10,%esp
c0004b48:	90                   	nop
c0004b49:	c9                   	leave  
c0004b4a:	c3                   	ret    

c0004b4b <set_cursor>:
c0004b4b:	55                   	push   %ebp
c0004b4c:	89 e5                	mov    %esp,%ebp
c0004b4e:	83 ec 08             	sub    $0x8,%esp
c0004b51:	83 ec 08             	sub    $0x8,%esp
c0004b54:	6a 0e                	push   $0xe
c0004b56:	68 d4 03 00 00       	push   $0x3d4
c0004b5b:	e8 3d cc ff ff       	call   c000179d <out_byte>
c0004b60:	83 c4 10             	add    $0x10,%esp
c0004b63:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b66:	c1 e8 08             	shr    $0x8,%eax
c0004b69:	0f b7 c0             	movzwl %ax,%eax
c0004b6c:	83 ec 08             	sub    $0x8,%esp
c0004b6f:	50                   	push   %eax
c0004b70:	68 d5 03 00 00       	push   $0x3d5
c0004b75:	e8 23 cc ff ff       	call   c000179d <out_byte>
c0004b7a:	83 c4 10             	add    $0x10,%esp
c0004b7d:	83 ec 08             	sub    $0x8,%esp
c0004b80:	6a 0f                	push   $0xf
c0004b82:	68 d4 03 00 00       	push   $0x3d4
c0004b87:	e8 11 cc ff ff       	call   c000179d <out_byte>
c0004b8c:	83 c4 10             	add    $0x10,%esp
c0004b8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b92:	0f b7 c0             	movzwl %ax,%eax
c0004b95:	83 ec 08             	sub    $0x8,%esp
c0004b98:	50                   	push   %eax
c0004b99:	68 d5 03 00 00       	push   $0x3d5
c0004b9e:	e8 fa cb ff ff       	call   c000179d <out_byte>
c0004ba3:	83 c4 10             	add    $0x10,%esp
c0004ba6:	90                   	nop
c0004ba7:	c9                   	leave  
c0004ba8:	c3                   	ret    

c0004ba9 <set_console_start_video_addr>:
c0004ba9:	55                   	push   %ebp
c0004baa:	89 e5                	mov    %esp,%ebp
c0004bac:	83 ec 08             	sub    $0x8,%esp
c0004baf:	83 ec 08             	sub    $0x8,%esp
c0004bb2:	6a 0c                	push   $0xc
c0004bb4:	68 d4 03 00 00       	push   $0x3d4
c0004bb9:	e8 df cb ff ff       	call   c000179d <out_byte>
c0004bbe:	83 c4 10             	add    $0x10,%esp
c0004bc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bc4:	c1 e8 08             	shr    $0x8,%eax
c0004bc7:	0f b7 c0             	movzwl %ax,%eax
c0004bca:	83 ec 08             	sub    $0x8,%esp
c0004bcd:	50                   	push   %eax
c0004bce:	68 d5 03 00 00       	push   $0x3d5
c0004bd3:	e8 c5 cb ff ff       	call   c000179d <out_byte>
c0004bd8:	83 c4 10             	add    $0x10,%esp
c0004bdb:	83 ec 08             	sub    $0x8,%esp
c0004bde:	6a 0d                	push   $0xd
c0004be0:	68 d4 03 00 00       	push   $0x3d4
c0004be5:	e8 b3 cb ff ff       	call   c000179d <out_byte>
c0004bea:	83 c4 10             	add    $0x10,%esp
c0004bed:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bf0:	0f b7 c0             	movzwl %ax,%eax
c0004bf3:	83 ec 08             	sub    $0x8,%esp
c0004bf6:	50                   	push   %eax
c0004bf7:	68 d5 03 00 00       	push   $0x3d5
c0004bfc:	e8 9c cb ff ff       	call   c000179d <out_byte>
c0004c01:	83 c4 10             	add    $0x10,%esp
c0004c04:	90                   	nop
c0004c05:	c9                   	leave  
c0004c06:	c3                   	ret    

c0004c07 <put_key>:
c0004c07:	55                   	push   %ebp
c0004c08:	89 e5                	mov    %esp,%ebp
c0004c0a:	83 ec 04             	sub    $0x4,%esp
c0004c0d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c10:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004c13:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c16:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004c1c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004c21:	77 4d                	ja     c0004c70 <put_key+0x69>
c0004c23:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c26:	8b 00                	mov    (%eax),%eax
c0004c28:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004c2c:	89 10                	mov    %edx,(%eax)
c0004c2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c31:	8b 00                	mov    (%eax),%eax
c0004c33:	8d 50 04             	lea    0x4(%eax),%edx
c0004c36:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c39:	89 10                	mov    %edx,(%eax)
c0004c3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c3e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004c44:	8d 50 01             	lea    0x1(%eax),%edx
c0004c47:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c4a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004c50:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c53:	8b 00                	mov    (%eax),%eax
c0004c55:	8b 55 08             	mov    0x8(%ebp),%edx
c0004c58:	83 c2 08             	add    $0x8,%edx
c0004c5b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004c61:	39 d0                	cmp    %edx,%eax
c0004c63:	75 0b                	jne    c0004c70 <put_key+0x69>
c0004c65:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c68:	8d 50 08             	lea    0x8(%eax),%edx
c0004c6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c6e:	89 10                	mov    %edx,(%eax)
c0004c70:	90                   	nop
c0004c71:	c9                   	leave  
c0004c72:	c3                   	ret    

c0004c73 <scroll_up>:
c0004c73:	55                   	push   %ebp
c0004c74:	89 e5                	mov    %esp,%ebp
c0004c76:	83 ec 08             	sub    $0x8,%esp
c0004c79:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c7c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c82:	8b 40 08             	mov    0x8(%eax),%eax
c0004c85:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004c88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c8b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004c91:	8b 00                	mov    (%eax),%eax
c0004c93:	39 c2                	cmp    %eax,%edx
c0004c95:	76 1b                	jbe    c0004cb2 <scroll_up+0x3f>
c0004c97:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c9a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ca0:	8b 40 08             	mov    0x8(%eax),%eax
c0004ca3:	83 e8 50             	sub    $0x50,%eax
c0004ca6:	83 ec 0c             	sub    $0xc,%esp
c0004ca9:	50                   	push   %eax
c0004caa:	e8 fa fe ff ff       	call   c0004ba9 <set_console_start_video_addr>
c0004caf:	83 c4 10             	add    $0x10,%esp
c0004cb2:	90                   	nop
c0004cb3:	c9                   	leave  
c0004cb4:	c3                   	ret    

c0004cb5 <scroll_down>:
c0004cb5:	55                   	push   %ebp
c0004cb6:	89 e5                	mov    %esp,%ebp
c0004cb8:	83 ec 08             	sub    $0x8,%esp
c0004cbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cbe:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cc4:	8b 40 08             	mov    0x8(%eax),%eax
c0004cc7:	8d 48 50             	lea    0x50(%eax),%ecx
c0004cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ccd:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cd3:	8b 10                	mov    (%eax),%edx
c0004cd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cd8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cde:	8b 40 04             	mov    0x4(%eax),%eax
c0004ce1:	01 d0                	add    %edx,%eax
c0004ce3:	39 c1                	cmp    %eax,%ecx
c0004ce5:	73 36                	jae    c0004d1d <scroll_down+0x68>
c0004ce7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cea:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004cf0:	8b 40 08             	mov    0x8(%eax),%eax
c0004cf3:	83 c0 50             	add    $0x50,%eax
c0004cf6:	83 ec 0c             	sub    $0xc,%esp
c0004cf9:	50                   	push   %eax
c0004cfa:	e8 aa fe ff ff       	call   c0004ba9 <set_console_start_video_addr>
c0004cff:	83 c4 10             	add    $0x10,%esp
c0004d02:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d05:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d0b:	8b 50 08             	mov    0x8(%eax),%edx
c0004d0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d11:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d17:	83 c2 50             	add    $0x50,%edx
c0004d1a:	89 50 08             	mov    %edx,0x8(%eax)
c0004d1d:	90                   	nop
c0004d1e:	c9                   	leave  
c0004d1f:	c3                   	ret    

c0004d20 <out_char>:
c0004d20:	55                   	push   %ebp
c0004d21:	89 e5                	mov    %esp,%ebp
c0004d23:	83 ec 28             	sub    $0x28,%esp
c0004d26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d29:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004d2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d2f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d35:	8b 40 0c             	mov    0xc(%eax),%eax
c0004d38:	05 00 c0 05 00       	add    $0x5c000,%eax
c0004d3d:	01 c0                	add    %eax,%eax
c0004d3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d42:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004d46:	83 f8 08             	cmp    $0x8,%eax
c0004d49:	0f 84 8d 00 00 00    	je     c0004ddc <out_char+0xbc>
c0004d4f:	83 f8 0a             	cmp    $0xa,%eax
c0004d52:	0f 85 c9 00 00 00    	jne    c0004e21 <out_char+0x101>
c0004d58:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d5b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d61:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d64:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d67:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d6d:	8b 08                	mov    (%eax),%ecx
c0004d6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d72:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d78:	8b 40 04             	mov    0x4(%eax),%eax
c0004d7b:	01 c8                	add    %ecx,%eax
c0004d7d:	83 e8 50             	sub    $0x50,%eax
c0004d80:	39 c2                	cmp    %eax,%edx
c0004d82:	0f 83 f4 00 00 00    	jae    c0004e7c <out_char+0x15c>
c0004d88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d8b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d91:	8b 08                	mov    (%eax),%ecx
c0004d93:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d96:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d9c:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004da2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004da8:	8b 00                	mov    (%eax),%eax
c0004daa:	29 c2                	sub    %eax,%edx
c0004dac:	89 d0                	mov    %edx,%eax
c0004dae:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0004db3:	f7 e2                	mul    %edx
c0004db5:	89 d0                	mov    %edx,%eax
c0004db7:	c1 e8 06             	shr    $0x6,%eax
c0004dba:	8d 50 01             	lea    0x1(%eax),%edx
c0004dbd:	89 d0                	mov    %edx,%eax
c0004dbf:	c1 e0 02             	shl    $0x2,%eax
c0004dc2:	01 d0                	add    %edx,%eax
c0004dc4:	c1 e0 04             	shl    $0x4,%eax
c0004dc7:	89 c2                	mov    %eax,%edx
c0004dc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dcc:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004dd2:	01 ca                	add    %ecx,%edx
c0004dd4:	89 50 0c             	mov    %edx,0xc(%eax)
c0004dd7:	e9 a0 00 00 00       	jmp    c0004e7c <out_char+0x15c>
c0004ddc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ddf:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004de5:	8b 50 0c             	mov    0xc(%eax),%edx
c0004de8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004deb:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004df1:	8b 00                	mov    (%eax),%eax
c0004df3:	39 c2                	cmp    %eax,%edx
c0004df5:	0f 86 84 00 00 00    	jbe    c0004e7f <out_char+0x15f>
c0004dfb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dfe:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e04:	8b 50 0c             	mov    0xc(%eax),%edx
c0004e07:	83 ea 01             	sub    $0x1,%edx
c0004e0a:	89 50 0c             	mov    %edx,0xc(%eax)
c0004e0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e10:	83 e8 02             	sub    $0x2,%eax
c0004e13:	c6 00 20             	movb   $0x20,(%eax)
c0004e16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e19:	83 e8 01             	sub    $0x1,%eax
c0004e1c:	c6 00 00             	movb   $0x0,(%eax)
c0004e1f:	eb 5e                	jmp    c0004e7f <out_char+0x15f>
c0004e21:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e24:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e2a:	8b 40 0c             	mov    0xc(%eax),%eax
c0004e2d:	8d 48 01             	lea    0x1(%eax),%ecx
c0004e30:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e33:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e39:	8b 10                	mov    (%eax),%edx
c0004e3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e3e:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e44:	8b 40 04             	mov    0x4(%eax),%eax
c0004e47:	01 d0                	add    %edx,%eax
c0004e49:	39 c1                	cmp    %eax,%ecx
c0004e4b:	73 35                	jae    c0004e82 <out_char+0x162>
c0004e4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e50:	8d 50 01             	lea    0x1(%eax),%edx
c0004e53:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004e56:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0004e5a:	88 10                	mov    %dl,(%eax)
c0004e5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e5f:	8d 50 01             	lea    0x1(%eax),%edx
c0004e62:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004e65:	c6 00 0a             	movb   $0xa,(%eax)
c0004e68:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e6b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e71:	8b 50 0c             	mov    0xc(%eax),%edx
c0004e74:	83 c2 01             	add    $0x1,%edx
c0004e77:	89 50 0c             	mov    %edx,0xc(%eax)
c0004e7a:	eb 06                	jmp    c0004e82 <out_char+0x162>
c0004e7c:	90                   	nop
c0004e7d:	eb 14                	jmp    c0004e93 <out_char+0x173>
c0004e7f:	90                   	nop
c0004e80:	eb 11                	jmp    c0004e93 <out_char+0x173>
c0004e82:	90                   	nop
c0004e83:	eb 0e                	jmp    c0004e93 <out_char+0x173>
c0004e85:	83 ec 0c             	sub    $0xc,%esp
c0004e88:	ff 75 08             	pushl  0x8(%ebp)
c0004e8b:	e8 25 fe ff ff       	call   c0004cb5 <scroll_down>
c0004e90:	83 c4 10             	add    $0x10,%esp
c0004e93:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e96:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004e9c:	8b 50 0c             	mov    0xc(%eax),%edx
c0004e9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ea8:	8b 40 08             	mov    0x8(%eax),%eax
c0004eab:	29 c2                	sub    %eax,%edx
c0004ead:	89 d0                	mov    %edx,%eax
c0004eaf:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0004eb4:	77 cf                	ja     c0004e85 <out_char+0x165>
c0004eb6:	83 ec 0c             	sub    $0xc,%esp
c0004eb9:	ff 75 08             	pushl  0x8(%ebp)
c0004ebc:	e8 51 fc ff ff       	call   c0004b12 <flush>
c0004ec1:	83 c4 10             	add    $0x10,%esp
c0004ec4:	90                   	nop
c0004ec5:	c9                   	leave  
c0004ec6:	c3                   	ret    

c0004ec7 <tty_dev_read>:
c0004ec7:	55                   	push   %ebp
c0004ec8:	89 e5                	mov    %esp,%ebp
c0004eca:	83 ec 08             	sub    $0x8,%esp
c0004ecd:	a1 40 e7 00 c0       	mov    0xc000e740,%eax
c0004ed2:	39 45 08             	cmp    %eax,0x8(%ebp)
c0004ed5:	75 17                	jne    c0004eee <tty_dev_read+0x27>
c0004ed7:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c0004edc:	85 c0                	test   %eax,%eax
c0004ede:	7e 0e                	jle    c0004eee <tty_dev_read+0x27>
c0004ee0:	83 ec 0c             	sub    $0xc,%esp
c0004ee3:	ff 75 08             	pushl  0x8(%ebp)
c0004ee6:	e8 0e 06 00 00       	call   c00054f9 <keyboard_read>
c0004eeb:	83 c4 10             	add    $0x10,%esp
c0004eee:	90                   	nop
c0004eef:	c9                   	leave  
c0004ef0:	c3                   	ret    

c0004ef1 <tty_dev_write>:
c0004ef1:	55                   	push   %ebp
c0004ef2:	89 e5                	mov    %esp,%ebp
c0004ef4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0004efa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004efd:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004f03:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f06:	e9 da 01 00 00       	jmp    c00050e5 <tty_dev_write+0x1f4>
c0004f0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f0e:	8b 40 04             	mov    0x4(%eax),%eax
c0004f11:	8b 00                	mov    (%eax),%eax
c0004f13:	88 45 f3             	mov    %al,-0xd(%ebp)
c0004f16:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f19:	8b 40 04             	mov    0x4(%eax),%eax
c0004f1c:	8d 50 04             	lea    0x4(%eax),%edx
c0004f1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f22:	89 50 04             	mov    %edx,0x4(%eax)
c0004f25:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f28:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f2e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004f31:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f34:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004f3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f3d:	8b 40 04             	mov    0x4(%eax),%eax
c0004f40:	8b 55 08             	mov    0x8(%ebp),%edx
c0004f43:	83 c2 08             	add    $0x8,%edx
c0004f46:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004f4c:	39 d0                	cmp    %edx,%eax
c0004f4e:	75 0c                	jne    c0004f5c <tty_dev_write+0x6b>
c0004f50:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f53:	8d 50 08             	lea    0x8(%eax),%edx
c0004f56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f59:	89 50 04             	mov    %edx,0x4(%eax)
c0004f5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f5f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004f65:	85 c0                	test   %eax,%eax
c0004f67:	0f 84 78 01 00 00    	je     c00050e5 <tty_dev_write+0x1f4>
c0004f6d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f71:	3c 20                	cmp    $0x20,%al
c0004f73:	76 08                	jbe    c0004f7d <tty_dev_write+0x8c>
c0004f75:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f79:	3c 7e                	cmp    $0x7e,%al
c0004f7b:	76 10                	jbe    c0004f8d <tty_dev_write+0x9c>
c0004f7d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f81:	3c 20                	cmp    $0x20,%al
c0004f83:	74 08                	je     c0004f8d <tty_dev_write+0x9c>
c0004f85:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004f89:	84 c0                	test   %al,%al
c0004f8b:	75 7b                	jne    c0005008 <tty_dev_write+0x117>
c0004f8d:	83 ec 08             	sub    $0x8,%esp
c0004f90:	8d 45 f3             	lea    -0xd(%ebp),%eax
c0004f93:	50                   	push   %eax
c0004f94:	6a 00                	push   $0x0
c0004f96:	e8 e3 f8 ff ff       	call   c000487e <v2l>
c0004f9b:	83 c4 10             	add    $0x10,%esp
c0004f9e:	89 c1                	mov    %eax,%ecx
c0004fa0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa3:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c0004fa9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fac:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004fb2:	01 d0                	add    %edx,%eax
c0004fb4:	83 ec 04             	sub    $0x4,%esp
c0004fb7:	6a 01                	push   $0x1
c0004fb9:	51                   	push   %ecx
c0004fba:	50                   	push   %eax
c0004fbb:	e8 d1 56 00 00       	call   c000a691 <Memcpy>
c0004fc0:	83 c4 10             	add    $0x10,%esp
c0004fc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fc6:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004fcc:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004fcf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd2:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0004fd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fdb:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004fe1:	8d 50 01             	lea    0x1(%eax),%edx
c0004fe4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe7:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0004fed:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0004ff1:	0f b6 c0             	movzbl %al,%eax
c0004ff4:	83 ec 08             	sub    $0x8,%esp
c0004ff7:	50                   	push   %eax
c0004ff8:	ff 75 08             	pushl  0x8(%ebp)
c0004ffb:	e8 20 fd ff ff       	call   c0004d20 <out_char>
c0005000:	83 c4 10             	add    $0x10,%esp
c0005003:	e9 dd 00 00 00       	jmp    c00050e5 <tty_dev_write+0x1f4>
c0005008:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000500c:	3c 08                	cmp    $0x8,%al
c000500e:	75 45                	jne    c0005055 <tty_dev_write+0x164>
c0005010:	8b 45 08             	mov    0x8(%ebp),%eax
c0005013:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005019:	8d 50 01             	lea    0x1(%eax),%edx
c000501c:	8b 45 08             	mov    0x8(%ebp),%eax
c000501f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005025:	8b 45 08             	mov    0x8(%ebp),%eax
c0005028:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000502e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005031:	8b 45 08             	mov    0x8(%ebp),%eax
c0005034:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000503a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000503e:	0f b6 c0             	movzbl %al,%eax
c0005041:	83 ec 08             	sub    $0x8,%esp
c0005044:	50                   	push   %eax
c0005045:	ff 75 08             	pushl  0x8(%ebp)
c0005048:	e8 d3 fc ff ff       	call   c0004d20 <out_char>
c000504d:	83 c4 10             	add    $0x10,%esp
c0005050:	e9 90 00 00 00       	jmp    c00050e5 <tty_dev_write+0x1f4>
c0005055:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005059:	3c 0a                	cmp    $0xa,%al
c000505b:	74 10                	je     c000506d <tty_dev_write+0x17c>
c000505d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005060:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005066:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005069:	39 c2                	cmp    %eax,%edx
c000506b:	75 78                	jne    c00050e5 <tty_dev_write+0x1f4>
c000506d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0005071:	0f b6 c0             	movzbl %al,%eax
c0005074:	83 ec 08             	sub    $0x8,%esp
c0005077:	50                   	push   %eax
c0005078:	ff 75 08             	pushl  0x8(%ebp)
c000507b:	e8 a0 fc ff ff       	call   c0004d20 <out_char>
c0005080:	83 c4 10             	add    $0x10,%esp
c0005083:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
c000508a:	8b 45 08             	mov    0x8(%ebp),%eax
c000508d:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005093:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005096:	8b 45 08             	mov    0x8(%ebp),%eax
c0005099:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000509f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00050a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00050a5:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00050ab:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00050ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00050b1:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c00050b8:	00 00 00 
c00050bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00050be:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00050c5:	00 00 00 
c00050c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00050cb:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c00050d1:	83 ec 04             	sub    $0x4,%esp
c00050d4:	50                   	push   %eax
c00050d5:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00050d8:	50                   	push   %eax
c00050d9:	6a 01                	push   $0x1
c00050db:	e8 20 42 00 00       	call   c0009300 <send_rec>
c00050e0:	83 c4 10             	add    $0x10,%esp
c00050e3:	eb 11                	jmp    c00050f6 <tty_dev_write+0x205>
c00050e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00050e8:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00050ee:	85 c0                	test   %eax,%eax
c00050f0:	0f 85 15 fe ff ff    	jne    c0004f0b <tty_dev_write+0x1a>
c00050f6:	c9                   	leave  
c00050f7:	c3                   	ret    

c00050f8 <tty_do_read>:
c00050f8:	55                   	push   %ebp
c00050f9:	89 e5                	mov    %esp,%ebp
c00050fb:	83 ec 08             	sub    $0x8,%esp
c00050fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0005101:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005108:	00 00 00 
c000510b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000510e:	8b 50 58             	mov    0x58(%eax),%edx
c0005111:	8b 45 08             	mov    0x8(%ebp),%eax
c0005114:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000511a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000511d:	8b 00                	mov    (%eax),%eax
c000511f:	89 c2                	mov    %eax,%edx
c0005121:	8b 45 08             	mov    0x8(%ebp),%eax
c0005124:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c000512a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000512d:	8b 50 50             	mov    0x50(%eax),%edx
c0005130:	8b 45 08             	mov    0x8(%ebp),%eax
c0005133:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005139:	8b 45 0c             	mov    0xc(%ebp),%eax
c000513c:	8b 40 10             	mov    0x10(%eax),%eax
c000513f:	89 c2                	mov    %eax,%edx
c0005141:	8b 45 08             	mov    0x8(%ebp),%eax
c0005144:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000514a:	83 ec 08             	sub    $0x8,%esp
c000514d:	52                   	push   %edx
c000514e:	50                   	push   %eax
c000514f:	e8 2a f7 ff ff       	call   c000487e <v2l>
c0005154:	83 c4 10             	add    $0x10,%esp
c0005157:	89 c2                	mov    %eax,%edx
c0005159:	8b 45 08             	mov    0x8(%ebp),%eax
c000515c:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005162:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005165:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c000516c:	8b 45 08             	mov    0x8(%ebp),%eax
c000516f:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c0005175:	83 ec 04             	sub    $0x4,%esp
c0005178:	50                   	push   %eax
c0005179:	ff 75 0c             	pushl  0xc(%ebp)
c000517c:	6a 01                	push   $0x1
c000517e:	e8 7d 41 00 00       	call   c0009300 <send_rec>
c0005183:	83 c4 10             	add    $0x10,%esp
c0005186:	90                   	nop
c0005187:	c9                   	leave  
c0005188:	c3                   	ret    

c0005189 <tty_do_write>:
c0005189:	55                   	push   %ebp
c000518a:	89 e5                	mov    %esp,%ebp
c000518c:	53                   	push   %ebx
c000518d:	81 ec 94 00 00 00    	sub    $0x94,%esp
c0005193:	89 e0                	mov    %esp,%eax
c0005195:	89 c3                	mov    %eax,%ebx
c0005197:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000519e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00051a1:	8d 50 ff             	lea    -0x1(%eax),%edx
c00051a4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00051a7:	89 c2                	mov    %eax,%edx
c00051a9:	b8 10 00 00 00       	mov    $0x10,%eax
c00051ae:	83 e8 01             	sub    $0x1,%eax
c00051b1:	01 d0                	add    %edx,%eax
c00051b3:	b9 10 00 00 00       	mov    $0x10,%ecx
c00051b8:	ba 00 00 00 00       	mov    $0x0,%edx
c00051bd:	f7 f1                	div    %ecx
c00051bf:	6b c0 10             	imul   $0x10,%eax,%eax
c00051c2:	29 c4                	sub    %eax,%esp
c00051c4:	89 e0                	mov    %esp,%eax
c00051c6:	83 c0 00             	add    $0x0,%eax
c00051c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00051cc:	83 ec 04             	sub    $0x4,%esp
c00051cf:	ff 75 e8             	pushl  -0x18(%ebp)
c00051d2:	6a 00                	push   $0x0
c00051d4:	ff 75 e0             	pushl  -0x20(%ebp)
c00051d7:	e8 e3 54 00 00       	call   c000a6bf <Memset>
c00051dc:	83 c4 10             	add    $0x10,%esp
c00051df:	8b 45 0c             	mov    0xc(%ebp),%eax
c00051e2:	8b 40 50             	mov    0x50(%eax),%eax
c00051e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00051e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00051eb:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00051f2:	00 00 00 
c00051f5:	e9 98 00 00 00       	jmp    c0005292 <tty_do_write+0x109>
c00051fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00051fd:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005200:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005204:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005207:	8b 45 0c             	mov    0xc(%ebp),%eax
c000520a:	8b 40 10             	mov    0x10(%eax),%eax
c000520d:	89 c2                	mov    %eax,%edx
c000520f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005212:	8b 40 58             	mov    0x58(%eax),%eax
c0005215:	83 ec 08             	sub    $0x8,%esp
c0005218:	52                   	push   %edx
c0005219:	50                   	push   %eax
c000521a:	e8 5f f6 ff ff       	call   c000487e <v2l>
c000521f:	83 c4 10             	add    $0x10,%esp
c0005222:	89 c2                	mov    %eax,%edx
c0005224:	8b 45 08             	mov    0x8(%ebp),%eax
c0005227:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000522d:	01 d0                	add    %edx,%eax
c000522f:	83 ec 04             	sub    $0x4,%esp
c0005232:	ff 75 f0             	pushl  -0x10(%ebp)
c0005235:	50                   	push   %eax
c0005236:	ff 75 e0             	pushl  -0x20(%ebp)
c0005239:	e8 53 54 00 00       	call   c000a691 <Memcpy>
c000523e:	83 c4 10             	add    $0x10,%esp
c0005241:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005244:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0005247:	8b 45 08             	mov    0x8(%ebp),%eax
c000524a:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005250:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005253:	01 c2                	add    %eax,%edx
c0005255:	8b 45 08             	mov    0x8(%ebp),%eax
c0005258:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000525e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005265:	eb 25                	jmp    c000528c <tty_do_write+0x103>
c0005267:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000526a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000526d:	01 d0                	add    %edx,%eax
c000526f:	0f b6 00             	movzbl (%eax),%eax
c0005272:	0f b6 c0             	movzbl %al,%eax
c0005275:	83 ec 08             	sub    $0x8,%esp
c0005278:	50                   	push   %eax
c0005279:	ff 75 08             	pushl  0x8(%ebp)
c000527c:	e8 9f fa ff ff       	call   c0004d20 <out_char>
c0005281:	83 c4 10             	add    $0x10,%esp
c0005284:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005288:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c000528c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005290:	75 d5                	jne    c0005267 <tty_do_write+0xde>
c0005292:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005296:	0f 85 5e ff ff ff    	jne    c00051fa <tty_do_write+0x71>
c000529c:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
c00052a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a6:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00052ac:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00052af:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052b2:	8b 00                	mov    (%eax),%eax
c00052b4:	83 ec 04             	sub    $0x4,%esp
c00052b7:	50                   	push   %eax
c00052b8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c00052be:	50                   	push   %eax
c00052bf:	6a 01                	push   $0x1
c00052c1:	e8 3a 40 00 00       	call   c0009300 <send_rec>
c00052c6:	83 c4 10             	add    $0x10,%esp
c00052c9:	89 dc                	mov    %ebx,%esp
c00052cb:	90                   	nop
c00052cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00052cf:	c9                   	leave  
c00052d0:	c3                   	ret    

c00052d1 <init_screen>:
c00052d1:	55                   	push   %ebp
c00052d2:	89 e5                	mov    %esp,%ebp
c00052d4:	83 ec 10             	sub    $0x10,%esp
c00052d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052da:	2d e0 ed 00 c0       	sub    $0xc000ede0,%eax
c00052df:	c1 f8 02             	sar    $0x2,%eax
c00052e2:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c00052e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00052eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00052ee:	c1 e0 04             	shl    $0x4,%eax
c00052f1:	8d 90 20 0f 01 c0    	lea    -0x3ffef0e0(%eax),%edx
c00052f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052fa:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005300:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005307:	8b 45 08             	mov    0x8(%ebp),%eax
c000530a:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
c0005310:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005313:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c0005318:	f7 e2                	mul    %edx
c000531a:	89 d0                	mov    %edx,%eax
c000531c:	d1 e8                	shr    %eax
c000531e:	89 41 04             	mov    %eax,0x4(%ecx)
c0005321:	8b 45 08             	mov    0x8(%ebp),%eax
c0005324:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000532a:	8b 50 04             	mov    0x4(%eax),%edx
c000532d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005330:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005336:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c000533a:	89 10                	mov    %edx,(%eax)
c000533c:	8b 45 08             	mov    0x8(%ebp),%eax
c000533f:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0005345:	8b 45 08             	mov    0x8(%ebp),%eax
c0005348:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000534e:	8b 12                	mov    (%edx),%edx
c0005350:	89 50 08             	mov    %edx,0x8(%eax)
c0005353:	8b 55 08             	mov    0x8(%ebp),%edx
c0005356:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
c000535c:	8b 40 08             	mov    0x8(%eax),%eax
c000535f:	89 42 0c             	mov    %eax,0xc(%edx)
c0005362:	90                   	nop
c0005363:	c9                   	leave  
c0005364:	c3                   	ret    

c0005365 <init_tty>:
c0005365:	55                   	push   %ebp
c0005366:	89 e5                	mov    %esp,%ebp
c0005368:	83 ec 18             	sub    $0x18,%esp
c000536b:	c7 45 f4 e0 ed 00 c0 	movl   $0xc000ede0,-0xc(%ebp)
c0005372:	eb 7a                	jmp    c00053ee <init_tty+0x89>
c0005374:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005377:	8d 50 08             	lea    0x8(%eax),%edx
c000537a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000537d:	89 50 04             	mov    %edx,0x4(%eax)
c0005380:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005383:	8b 50 04             	mov    0x4(%eax),%edx
c0005386:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005389:	89 10                	mov    %edx,(%eax)
c000538b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000538e:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005395:	00 00 00 
c0005398:	ff 75 f4             	pushl  -0xc(%ebp)
c000539b:	e8 31 ff ff ff       	call   c00052d1 <init_screen>
c00053a0:	83 c4 04             	add    $0x4,%esp
c00053a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00053a6:	2d e0 ed 00 c0       	sub    $0xc000ede0,%eax
c00053ab:	85 c0                	test   %eax,%eax
c00053ad:	7e 38                	jle    c00053e7 <init_tty+0x82>
c00053af:	83 ec 08             	sub    $0x8,%esp
c00053b2:	6a 23                	push   $0x23
c00053b4:	ff 75 f4             	pushl  -0xc(%ebp)
c00053b7:	e8 64 f9 ff ff       	call   c0004d20 <out_char>
c00053bc:	83 c4 10             	add    $0x10,%esp
c00053bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00053c2:	05 e4 8e 01 00       	add    $0x18ee4,%eax
c00053c7:	2d e0 ed 00 c0       	sub    $0xc000ede0,%eax
c00053cc:	c1 f8 02             	sar    $0x2,%eax
c00053cf:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c00053d5:	0f b6 c0             	movzbl %al,%eax
c00053d8:	83 ec 08             	sub    $0x8,%esp
c00053db:	50                   	push   %eax
c00053dc:	ff 75 f4             	pushl  -0xc(%ebp)
c00053df:	e8 3c f9 ff ff       	call   c0004d20 <out_char>
c00053e4:	83 c4 10             	add    $0x10,%esp
c00053e7:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c00053ee:	b8 4c 06 01 c0       	mov    $0xc001064c,%eax
c00053f3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00053f6:	0f 82 78 ff ff ff    	jb     c0005374 <init_tty+0xf>
c00053fc:	90                   	nop
c00053fd:	c9                   	leave  
c00053fe:	c3                   	ret    

c00053ff <TaskTTY>:
c00053ff:	55                   	push   %ebp
c0005400:	89 e5                	mov    %esp,%ebp
c0005402:	83 ec 78             	sub    $0x78,%esp
c0005405:	83 ec 0c             	sub    $0xc,%esp
c0005408:	68 55 9e 00 c0       	push   $0xc0009e55
c000540d:	e8 7a c1 ff ff       	call   c000158c <disp_str>
c0005412:	83 c4 10             	add    $0x10,%esp
c0005415:	eb fe                	jmp    c0005415 <TaskTTY+0x16>

c0005417 <keyboard_handler>:
c0005417:	55                   	push   %ebp
c0005418:	89 e5                	mov    %esp,%ebp
c000541a:	83 ec 18             	sub    $0x18,%esp
c000541d:	c7 05 e0 06 01 c0 01 	movl   $0x1,0xc00106e0
c0005424:	00 00 00 
c0005427:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c000542e:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c0005433:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005438:	7f 5c                	jg     c0005496 <keyboard_handler+0x7f>
c000543a:	e8 80 c3 ff ff       	call   c00017bf <disable_int>
c000543f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005442:	0f b7 c0             	movzwl %ax,%eax
c0005445:	83 ec 0c             	sub    $0xc,%esp
c0005448:	50                   	push   %eax
c0005449:	e8 43 c3 ff ff       	call   c0001791 <in_byte>
c000544e:	83 c4 10             	add    $0x10,%esp
c0005451:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005454:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c0005459:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c000545d:	88 10                	mov    %dl,(%eax)
c000545f:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c0005464:	83 c0 01             	add    $0x1,%eax
c0005467:	a3 a0 eb 00 c0       	mov    %eax,0xc000eba0
c000546c:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c0005471:	83 c0 01             	add    $0x1,%eax
c0005474:	a3 a8 eb 00 c0       	mov    %eax,0xc000eba8
c0005479:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c000547e:	ba ac ed 00 c0       	mov    $0xc000edac,%edx
c0005483:	39 d0                	cmp    %edx,%eax
c0005485:	72 0a                	jb     c0005491 <keyboard_handler+0x7a>
c0005487:	c7 05 a0 eb 00 c0 ac 	movl   $0xc000ebac,0xc000eba0
c000548e:	eb 00 c0 
c0005491:	e8 2b c3 ff ff       	call   c00017c1 <enable_int>
c0005496:	90                   	nop
c0005497:	c9                   	leave  
c0005498:	c3                   	ret    

c0005499 <read_from_keyboard_buf>:
c0005499:	55                   	push   %ebp
c000549a:	89 e5                	mov    %esp,%ebp
c000549c:	83 ec 18             	sub    $0x18,%esp
c000549f:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c00054a3:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c00054a8:	85 c0                	test   %eax,%eax
c00054aa:	7e 47                	jle    c00054f3 <read_from_keyboard_buf+0x5a>
c00054ac:	e8 0e c3 ff ff       	call   c00017bf <disable_int>
c00054b1:	a1 a4 eb 00 c0       	mov    0xc000eba4,%eax
c00054b6:	0f b6 00             	movzbl (%eax),%eax
c00054b9:	88 45 f7             	mov    %al,-0x9(%ebp)
c00054bc:	a1 a4 eb 00 c0       	mov    0xc000eba4,%eax
c00054c1:	83 c0 01             	add    $0x1,%eax
c00054c4:	a3 a4 eb 00 c0       	mov    %eax,0xc000eba4
c00054c9:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c00054ce:	83 e8 01             	sub    $0x1,%eax
c00054d1:	a3 a8 eb 00 c0       	mov    %eax,0xc000eba8
c00054d6:	a1 a4 eb 00 c0       	mov    0xc000eba4,%eax
c00054db:	ba ac ed 00 c0       	mov    $0xc000edac,%edx
c00054e0:	39 d0                	cmp    %edx,%eax
c00054e2:	72 0a                	jb     c00054ee <read_from_keyboard_buf+0x55>
c00054e4:	c7 05 a4 eb 00 c0 ac 	movl   $0xc000ebac,0xc000eba4
c00054eb:	eb 00 c0 
c00054ee:	e8 ce c2 ff ff       	call   c00017c1 <enable_int>
c00054f3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00054f7:	c9                   	leave  
c00054f8:	c3                   	ret    

c00054f9 <keyboard_read>:
c00054f9:	55                   	push   %ebp
c00054fa:	89 e5                	mov    %esp,%ebp
c00054fc:	83 ec 28             	sub    $0x28,%esp
c00054ff:	90                   	nop
c0005500:	a1 a8 eb 00 c0       	mov    0xc000eba8,%eax
c0005505:	85 c0                	test   %eax,%eax
c0005507:	7e f7                	jle    c0005500 <keyboard_read+0x7>
c0005509:	e8 8b ff ff ff       	call   c0005499 <read_from_keyboard_buf>
c000550e:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005511:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005518:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c000551c:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005520:	75 5a                	jne    c000557c <keyboard_read+0x83>
c0005522:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005526:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c000552a:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c000552e:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005532:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005536:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c000553a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c000553e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005545:	eb 20                	jmp    c0005567 <keyboard_read+0x6e>
c0005547:	e8 4d ff ff ff       	call   c0005499 <read_from_keyboard_buf>
c000554c:	89 c1                	mov    %eax,%ecx
c000554e:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005551:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005554:	01 d0                	add    %edx,%eax
c0005556:	0f b6 00             	movzbl (%eax),%eax
c0005559:	38 c1                	cmp    %al,%cl
c000555b:	74 06                	je     c0005563 <keyboard_read+0x6a>
c000555d:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005561:	eb 0a                	jmp    c000556d <keyboard_read+0x74>
c0005563:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005567:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c000556b:	7e da                	jle    c0005547 <keyboard_read+0x4e>
c000556d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005571:	74 68                	je     c00055db <keyboard_read+0xe2>
c0005573:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c000557a:	eb 5f                	jmp    c00055db <keyboard_read+0xe2>
c000557c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005580:	75 59                	jne    c00055db <keyboard_read+0xe2>
c0005582:	e8 12 ff ff ff       	call   c0005499 <read_from_keyboard_buf>
c0005587:	3c 2a                	cmp    $0x2a,%al
c0005589:	75 1d                	jne    c00055a8 <keyboard_read+0xaf>
c000558b:	e8 09 ff ff ff       	call   c0005499 <read_from_keyboard_buf>
c0005590:	3c e0                	cmp    $0xe0,%al
c0005592:	75 14                	jne    c00055a8 <keyboard_read+0xaf>
c0005594:	e8 00 ff ff ff       	call   c0005499 <read_from_keyboard_buf>
c0005599:	3c 37                	cmp    $0x37,%al
c000559b:	75 0b                	jne    c00055a8 <keyboard_read+0xaf>
c000559d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00055a4:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c00055a8:	e8 ec fe ff ff       	call   c0005499 <read_from_keyboard_buf>
c00055ad:	3c b7                	cmp    $0xb7,%al
c00055af:	75 1d                	jne    c00055ce <keyboard_read+0xd5>
c00055b1:	e8 e3 fe ff ff       	call   c0005499 <read_from_keyboard_buf>
c00055b6:	3c e0                	cmp    $0xe0,%al
c00055b8:	75 14                	jne    c00055ce <keyboard_read+0xd5>
c00055ba:	e8 da fe ff ff       	call   c0005499 <read_from_keyboard_buf>
c00055bf:	3c aa                	cmp    $0xaa,%al
c00055c1:	75 0b                	jne    c00055ce <keyboard_read+0xd5>
c00055c3:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00055ca:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00055ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00055d2:	75 07                	jne    c00055db <keyboard_read+0xe2>
c00055d4:	c6 05 44 e7 00 c0 01 	movb   $0x1,0xc000e744
c00055db:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c00055e2:	0f 84 8d 00 00 00    	je     c0005675 <keyboard_read+0x17c>
c00055e8:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c00055ef:	0f 84 80 00 00 00    	je     c0005675 <keyboard_read+0x17c>
c00055f5:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c00055f9:	0f 94 c2             	sete   %dl
c00055fc:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005600:	0f 94 c0             	sete   %al
c0005603:	09 d0                	or     %edx,%eax
c0005605:	84 c0                	test   %al,%al
c0005607:	74 07                	je     c0005610 <keyboard_read+0x117>
c0005609:	c6 05 e4 06 01 c0 01 	movb   $0x1,0xc00106e4
c0005610:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005614:	f7 d0                	not    %eax
c0005616:	c0 e8 07             	shr    $0x7,%al
c0005619:	88 45 e9             	mov    %al,-0x17(%ebp)
c000561c:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005620:	74 53                	je     c0005675 <keyboard_read+0x17c>
c0005622:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005626:	74 4d                	je     c0005675 <keyboard_read+0x17c>
c0005628:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c000562c:	0f b6 05 e4 06 01 c0 	movzbl 0xc00106e4,%eax
c0005633:	3c 01                	cmp    $0x1,%al
c0005635:	75 04                	jne    c000563b <keyboard_read+0x142>
c0005637:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c000563b:	0f b6 05 44 e7 00 c0 	movzbl 0xc000e744,%eax
c0005642:	84 c0                	test   %al,%al
c0005644:	74 04                	je     c000564a <keyboard_read+0x151>
c0005646:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c000564a:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c000564e:	89 d0                	mov    %edx,%eax
c0005650:	01 c0                	add    %eax,%eax
c0005652:	01 c2                	add    %eax,%edx
c0005654:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005658:	01 d0                	add    %edx,%eax
c000565a:	8b 04 85 20 d1 00 c0 	mov    -0x3fff2ee0(,%eax,4),%eax
c0005661:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005664:	83 ec 08             	sub    $0x8,%esp
c0005667:	ff 75 f4             	pushl  -0xc(%ebp)
c000566a:	ff 75 08             	pushl  0x8(%ebp)
c000566d:	e8 1a 00 00 00       	call   c000568c <in_process>
c0005672:	83 c4 10             	add    $0x10,%esp
c0005675:	90                   	nop
c0005676:	c9                   	leave  
c0005677:	c3                   	ret    

c0005678 <init_keyboard_handler>:
c0005678:	55                   	push   %ebp
c0005679:	89 e5                	mov    %esp,%ebp
c000567b:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c0005682:	c6 05 e4 06 01 c0 00 	movb   $0x0,0xc00106e4
c0005689:	90                   	nop
c000568a:	5d                   	pop    %ebp
c000568b:	c3                   	ret    

c000568c <in_process>:
c000568c:	55                   	push   %ebp
c000568d:	89 e5                	mov    %esp,%ebp
c000568f:	83 ec 18             	sub    $0x18,%esp
c0005692:	83 ec 04             	sub    $0x4,%esp
c0005695:	6a 02                	push   $0x2
c0005697:	6a 00                	push   $0x0
c0005699:	8d 45 f6             	lea    -0xa(%ebp),%eax
c000569c:	50                   	push   %eax
c000569d:	e8 1d 50 00 00       	call   c000a6bf <Memset>
c00056a2:	83 c4 10             	add    $0x10,%esp
c00056a5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00056a8:	25 00 01 00 00       	and    $0x100,%eax
c00056ad:	85 c0                	test   %eax,%eax
c00056af:	75 28                	jne    c00056d9 <in_process+0x4d>
c00056b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00056b4:	0f b6 c0             	movzbl %al,%eax
c00056b7:	83 ec 08             	sub    $0x8,%esp
c00056ba:	50                   	push   %eax
c00056bb:	ff 75 08             	pushl  0x8(%ebp)
c00056be:	e8 44 f5 ff ff       	call   c0004c07 <put_key>
c00056c3:	83 c4 10             	add    $0x10,%esp
c00056c6:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c00056cd:	c6 05 e4 06 01 c0 00 	movb   $0x0,0xc00106e4
c00056d4:	e9 42 01 00 00       	jmp    c000581b <in_process+0x18f>
c00056d9:	0f b6 05 e4 06 01 c0 	movzbl 0xc00106e4,%eax
c00056e0:	84 c0                	test   %al,%al
c00056e2:	0f 84 a9 00 00 00    	je     c0005791 <in_process+0x105>
c00056e8:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c00056ec:	0f 84 9f 00 00 00    	je     c0005791 <in_process+0x105>
c00056f2:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c00056f6:	0f 84 95 00 00 00    	je     c0005791 <in_process+0x105>
c00056fc:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005703:	74 64                	je     c0005769 <in_process+0xdd>
c0005705:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000570c:	77 0b                	ja     c0005719 <in_process+0x8d>
c000570e:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005715:	74 64                	je     c000577b <in_process+0xef>
c0005717:	eb 73                	jmp    c000578c <in_process+0x100>
c0005719:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005720:	74 0b                	je     c000572d <in_process+0xa1>
c0005722:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005729:	74 20                	je     c000574b <in_process+0xbf>
c000572b:	eb 5f                	jmp    c000578c <in_process+0x100>
c000572d:	83 ec 0c             	sub    $0xc,%esp
c0005730:	ff 75 08             	pushl  0x8(%ebp)
c0005733:	e8 3b f5 ff ff       	call   c0004c73 <scroll_up>
c0005738:	83 c4 10             	add    $0x10,%esp
c000573b:	c6 05 e4 06 01 c0 00 	movb   $0x0,0xc00106e4
c0005742:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c0005749:	eb 41                	jmp    c000578c <in_process+0x100>
c000574b:	83 ec 0c             	sub    $0xc,%esp
c000574e:	ff 75 08             	pushl  0x8(%ebp)
c0005751:	e8 5f f5 ff ff       	call   c0004cb5 <scroll_down>
c0005756:	83 c4 10             	add    $0x10,%esp
c0005759:	c6 05 e4 06 01 c0 00 	movb   $0x0,0xc00106e4
c0005760:	c6 05 44 e7 00 c0 00 	movb   $0x0,0xc000e744
c0005767:	eb 23                	jmp    c000578c <in_process+0x100>
c0005769:	83 ec 08             	sub    $0x8,%esp
c000576c:	6a 0a                	push   $0xa
c000576e:	ff 75 08             	pushl  0x8(%ebp)
c0005771:	e8 aa f5 ff ff       	call   c0004d20 <out_char>
c0005776:	83 c4 10             	add    $0x10,%esp
c0005779:	eb 11                	jmp    c000578c <in_process+0x100>
c000577b:	83 ec 08             	sub    $0x8,%esp
c000577e:	6a 08                	push   $0x8
c0005780:	ff 75 08             	pushl  0x8(%ebp)
c0005783:	e8 98 f5 ff ff       	call   c0004d20 <out_char>
c0005788:	83 c4 10             	add    $0x10,%esp
c000578b:	90                   	nop
c000578c:	e9 8a 00 00 00       	jmp    c000581b <in_process+0x18f>
c0005791:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005798:	74 55                	je     c00057ef <in_process+0x163>
c000579a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c00057a1:	77 14                	ja     c00057b7 <in_process+0x12b>
c00057a3:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c00057aa:	74 31                	je     c00057dd <in_process+0x151>
c00057ac:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00057b3:	74 16                	je     c00057cb <in_process+0x13f>
c00057b5:	eb 64                	jmp    c000581b <in_process+0x18f>
c00057b7:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c00057be:	74 3e                	je     c00057fe <in_process+0x172>
c00057c0:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c00057c7:	74 44                	je     c000580d <in_process+0x181>
c00057c9:	eb 50                	jmp    c000581b <in_process+0x18f>
c00057cb:	83 ec 08             	sub    $0x8,%esp
c00057ce:	6a 0a                	push   $0xa
c00057d0:	ff 75 08             	pushl  0x8(%ebp)
c00057d3:	e8 2f f4 ff ff       	call   c0004c07 <put_key>
c00057d8:	83 c4 10             	add    $0x10,%esp
c00057db:	eb 3e                	jmp    c000581b <in_process+0x18f>
c00057dd:	83 ec 08             	sub    $0x8,%esp
c00057e0:	6a 08                	push   $0x8
c00057e2:	ff 75 08             	pushl  0x8(%ebp)
c00057e5:	e8 1d f4 ff ff       	call   c0004c07 <put_key>
c00057ea:	83 c4 10             	add    $0x10,%esp
c00057ed:	eb 2c                	jmp    c000581b <in_process+0x18f>
c00057ef:	83 ec 0c             	sub    $0xc,%esp
c00057f2:	6a 00                	push   $0x0
c00057f4:	e8 dd f2 ff ff       	call   c0004ad6 <select_console>
c00057f9:	83 c4 10             	add    $0x10,%esp
c00057fc:	eb 1d                	jmp    c000581b <in_process+0x18f>
c00057fe:	83 ec 0c             	sub    $0xc,%esp
c0005801:	6a 01                	push   $0x1
c0005803:	e8 ce f2 ff ff       	call   c0004ad6 <select_console>
c0005808:	83 c4 10             	add    $0x10,%esp
c000580b:	eb 0e                	jmp    c000581b <in_process+0x18f>
c000580d:	83 ec 0c             	sub    $0xc,%esp
c0005810:	6a 02                	push   $0x2
c0005812:	e8 bf f2 ff ff       	call   c0004ad6 <select_console>
c0005817:	83 c4 10             	add    $0x10,%esp
c000581a:	90                   	nop
c000581b:	90                   	nop
c000581c:	c9                   	leave  
c000581d:	c3                   	ret    

c000581e <open>:
c000581e:	55                   	push   %ebp
c000581f:	89 e5                	mov    %esp,%ebp
c0005821:	83 ec 78             	sub    $0x78,%esp
c0005824:	83 ec 04             	sub    $0x4,%esp
c0005827:	6a 6c                	push   $0x6c
c0005829:	6a 00                	push   $0x0
c000582b:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000582e:	50                   	push   %eax
c000582f:	e8 8b 4e 00 00       	call   c000a6bf <Memset>
c0005834:	83 c4 10             	add    $0x10,%esp
c0005837:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c000583e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005841:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005844:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005847:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000584a:	83 ec 0c             	sub    $0xc,%esp
c000584d:	ff 75 08             	pushl  0x8(%ebp)
c0005850:	e8 a3 4e 00 00       	call   c000a6f8 <Strlen>
c0005855:	83 c4 10             	add    $0x10,%esp
c0005858:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000585b:	83 ec 04             	sub    $0x4,%esp
c000585e:	6a 03                	push   $0x3
c0005860:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005863:	50                   	push   %eax
c0005864:	6a 03                	push   $0x3
c0005866:	e8 95 3a 00 00       	call   c0009300 <send_rec>
c000586b:	83 c4 10             	add    $0x10,%esp
c000586e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0005871:	c9                   	leave  
c0005872:	c3                   	ret    

c0005873 <read>:
c0005873:	55                   	push   %ebp
c0005874:	89 e5                	mov    %esp,%ebp
c0005876:	83 ec 78             	sub    $0x78,%esp
c0005879:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
c0005880:	8b 45 08             	mov    0x8(%ebp),%eax
c0005883:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005886:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005889:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000588c:	8b 45 10             	mov    0x10(%ebp),%eax
c000588f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005892:	83 ec 04             	sub    $0x4,%esp
c0005895:	6a 03                	push   $0x3
c0005897:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000589a:	50                   	push   %eax
c000589b:	6a 03                	push   $0x3
c000589d:	e8 5e 3a 00 00       	call   c0009300 <send_rec>
c00058a2:	83 c4 10             	add    $0x10,%esp
c00058a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00058a8:	c9                   	leave  
c00058a9:	c3                   	ret    

c00058aa <write>:
c00058aa:	55                   	push   %ebp
c00058ab:	89 e5                	mov    %esp,%ebp
c00058ad:	83 ec 78             	sub    $0x78,%esp
c00058b0:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
c00058b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00058ba:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00058bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00058c0:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00058c3:	8b 45 10             	mov    0x10(%ebp),%eax
c00058c6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00058c9:	83 ec 04             	sub    $0x4,%esp
c00058cc:	6a 03                	push   $0x3
c00058ce:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00058d1:	50                   	push   %eax
c00058d2:	6a 03                	push   $0x3
c00058d4:	e8 27 3a 00 00       	call   c0009300 <send_rec>
c00058d9:	83 c4 10             	add    $0x10,%esp
c00058dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00058df:	c9                   	leave  
c00058e0:	c3                   	ret    

c00058e1 <close>:
c00058e1:	55                   	push   %ebp
c00058e2:	89 e5                	mov    %esp,%ebp
c00058e4:	83 ec 78             	sub    $0x78,%esp
c00058e7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00058ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00058f1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00058f4:	83 ec 04             	sub    $0x4,%esp
c00058f7:	6a 03                	push   $0x3
c00058f9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00058fc:	50                   	push   %eax
c00058fd:	6a 03                	push   $0x3
c00058ff:	e8 fc 39 00 00       	call   c0009300 <send_rec>
c0005904:	83 c4 10             	add    $0x10,%esp
c0005907:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000590a:	83 f8 65             	cmp    $0x65,%eax
c000590d:	74 19                	je     c0005928 <close+0x47>
c000590f:	6a 13                	push   $0x13
c0005911:	68 5f 9e 00 c0       	push   $0xc0009e5f
c0005916:	68 5f 9e 00 c0       	push   $0xc0009e5f
c000591b:	68 6b 9e 00 c0       	push   $0xc0009e6b
c0005920:	e8 37 32 00 00       	call   c0008b5c <assertion_failure>
c0005925:	83 c4 10             	add    $0x10,%esp
c0005928:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000592b:	c9                   	leave  
c000592c:	c3                   	ret    

c000592d <wait>:
c000592d:	55                   	push   %ebp
c000592e:	89 e5                	mov    %esp,%ebp
c0005930:	83 ec 78             	sub    $0x78,%esp
c0005933:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c000593a:	83 ec 04             	sub    $0x4,%esp
c000593d:	6a 04                	push   $0x4
c000593f:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005942:	50                   	push   %eax
c0005943:	6a 03                	push   $0x3
c0005945:	e8 b6 39 00 00       	call   c0009300 <send_rec>
c000594a:	83 c4 10             	add    $0x10,%esp
c000594d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005950:	89 c2                	mov    %eax,%edx
c0005952:	8b 45 08             	mov    0x8(%ebp),%eax
c0005955:	89 10                	mov    %edx,(%eax)
c0005957:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000595a:	83 f8 1d             	cmp    $0x1d,%eax
c000595d:	74 05                	je     c0005964 <wait+0x37>
c000595f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005962:	eb 05                	jmp    c0005969 <wait+0x3c>
c0005964:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005969:	c9                   	leave  
c000596a:	c3                   	ret    

c000596b <exit>:
c000596b:	55                   	push   %ebp
c000596c:	89 e5                	mov    %esp,%ebp
c000596e:	83 ec 78             	sub    $0x78,%esp
c0005971:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005978:	8b 45 08             	mov    0x8(%ebp),%eax
c000597b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000597e:	83 ec 04             	sub    $0x4,%esp
c0005981:	6a 04                	push   $0x4
c0005983:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005986:	50                   	push   %eax
c0005987:	6a 03                	push   $0x3
c0005989:	e8 72 39 00 00       	call   c0009300 <send_rec>
c000598e:	83 c4 10             	add    $0x10,%esp
c0005991:	90                   	nop
c0005992:	c9                   	leave  
c0005993:	c3                   	ret    

c0005994 <fork>:
c0005994:	55                   	push   %ebp
c0005995:	89 e5                	mov    %esp,%ebp
c0005997:	83 ec 78             	sub    $0x78,%esp
c000599a:	83 ec 04             	sub    $0x4,%esp
c000599d:	6a 6c                	push   $0x6c
c000599f:	6a 00                	push   $0x0
c00059a1:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00059a4:	50                   	push   %eax
c00059a5:	e8 15 4d 00 00       	call   c000a6bf <Memset>
c00059aa:	83 c4 10             	add    $0x10,%esp
c00059ad:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00059b4:	83 ec 04             	sub    $0x4,%esp
c00059b7:	6a 04                	push   $0x4
c00059b9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00059bc:	50                   	push   %eax
c00059bd:	6a 03                	push   $0x3
c00059bf:	e8 3c 39 00 00       	call   c0009300 <send_rec>
c00059c4:	83 c4 10             	add    $0x10,%esp
c00059c7:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00059ce:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00059d1:	85 c0                	test   %eax,%eax
c00059d3:	74 19                	je     c00059ee <fork+0x5a>
c00059d5:	6a 14                	push   $0x14
c00059d7:	68 83 9e 00 c0       	push   $0xc0009e83
c00059dc:	68 83 9e 00 c0       	push   $0xc0009e83
c00059e1:	68 8e 9e 00 c0       	push   $0xc0009e8e
c00059e6:	e8 71 31 00 00       	call   c0008b5c <assertion_failure>
c00059eb:	83 c4 10             	add    $0x10,%esp
c00059ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00059f1:	c9                   	leave  
c00059f2:	c3                   	ret    

c00059f3 <getpid>:
c00059f3:	55                   	push   %ebp
c00059f4:	89 e5                	mov    %esp,%ebp
c00059f6:	83 ec 78             	sub    $0x78,%esp
c00059f9:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005a00:	83 ec 04             	sub    $0x4,%esp
c0005a03:	6a 01                	push   $0x1
c0005a05:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005a08:	50                   	push   %eax
c0005a09:	6a 03                	push   $0x3
c0005a0b:	e8 f0 38 00 00       	call   c0009300 <send_rec>
c0005a10:	83 c4 10             	add    $0x10,%esp
c0005a13:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a16:	c9                   	leave  
c0005a17:	c3                   	ret    

c0005a18 <exec>:
c0005a18:	55                   	push   %ebp
c0005a19:	89 e5                	mov    %esp,%ebp
c0005a1b:	83 ec 78             	sub    $0x78,%esp
c0005a1e:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005a25:	8b 45 08             	mov    0x8(%ebp),%eax
c0005a28:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005a2b:	83 ec 0c             	sub    $0xc,%esp
c0005a2e:	ff 75 08             	pushl  0x8(%ebp)
c0005a31:	e8 c2 4c 00 00       	call   c000a6f8 <Strlen>
c0005a36:	83 c4 10             	add    $0x10,%esp
c0005a39:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005a3c:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005a43:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005a4a:	83 ec 04             	sub    $0x4,%esp
c0005a4d:	6a 04                	push   $0x4
c0005a4f:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005a52:	50                   	push   %eax
c0005a53:	6a 03                	push   $0x3
c0005a55:	e8 a6 38 00 00       	call   c0009300 <send_rec>
c0005a5a:	83 c4 10             	add    $0x10,%esp
c0005a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a60:	83 f8 65             	cmp    $0x65,%eax
c0005a63:	74 19                	je     c0005a7e <exec+0x66>
c0005a65:	6a 19                	push   $0x19
c0005a67:	68 9e 9e 00 c0       	push   $0xc0009e9e
c0005a6c:	68 9e 9e 00 c0       	push   $0xc0009e9e
c0005a71:	68 a9 9e 00 c0       	push   $0xc0009ea9
c0005a76:	e8 e1 30 00 00       	call   c0008b5c <assertion_failure>
c0005a7b:	83 c4 10             	add    $0x10,%esp
c0005a7e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005a81:	c9                   	leave  
c0005a82:	c3                   	ret    

c0005a83 <execv>:
c0005a83:	55                   	push   %ebp
c0005a84:	89 e5                	mov    %esp,%ebp
c0005a86:	57                   	push   %edi
c0005a87:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0005a8d:	83 ec 04             	sub    $0x4,%esp
c0005a90:	68 00 80 00 00       	push   $0x8000
c0005a95:	6a 00                	push   $0x0
c0005a97:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005a9d:	50                   	push   %eax
c0005a9e:	e8 1c 4c 00 00       	call   c000a6bf <Memset>
c0005aa3:	83 c4 10             	add    $0x10,%esp
c0005aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005aa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005aac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005ab3:	eb 0d                	jmp    c0005ac2 <execv+0x3f>
c0005ab5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0005ab9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005abc:	83 c0 04             	add    $0x4,%eax
c0005abf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ac5:	8b 00                	mov    (%eax),%eax
c0005ac7:	85 c0                	test   %eax,%eax
c0005ac9:	75 ea                	jne    c0005ab5 <execv+0x32>
c0005acb:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005ad1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ad4:	01 d0                	add    %edx,%eax
c0005ad6:	c6 00 00             	movb   $0x0,(%eax)
c0005ad9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005adc:	83 c0 04             	add    $0x4,%eax
c0005adf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005ae2:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005ae8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005aeb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005aee:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005af1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005af8:	eb 64                	jmp    c0005b5e <execv+0xdb>
c0005afa:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b03:	01 c2                	add    %eax,%edx
c0005b05:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005b08:	89 10                	mov    %edx,(%eax)
c0005b0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005b0d:	8b 00                	mov    (%eax),%eax
c0005b0f:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0005b15:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005b18:	01 ca                	add    %ecx,%edx
c0005b1a:	83 ec 08             	sub    $0x8,%esp
c0005b1d:	50                   	push   %eax
c0005b1e:	52                   	push   %edx
c0005b1f:	e8 ba 4b 00 00       	call   c000a6de <Strcpy>
c0005b24:	83 c4 10             	add    $0x10,%esp
c0005b27:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005b2a:	8b 00                	mov    (%eax),%eax
c0005b2c:	83 ec 0c             	sub    $0xc,%esp
c0005b2f:	50                   	push   %eax
c0005b30:	e8 c3 4b 00 00       	call   c000a6f8 <Strlen>
c0005b35:	83 c4 10             	add    $0x10,%esp
c0005b38:	01 45 f0             	add    %eax,-0x10(%ebp)
c0005b3b:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005b41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b44:	01 d0                	add    %edx,%eax
c0005b46:	c6 00 00             	movb   $0x0,(%eax)
c0005b49:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b4c:	83 c0 01             	add    $0x1,%eax
c0005b4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b52:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0005b56:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005b5a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005b5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005b61:	8b 00                	mov    (%eax),%eax
c0005b63:	85 c0                	test   %eax,%eax
c0005b65:	75 93                	jne    c0005afa <execv+0x77>
c0005b67:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005b6d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005b70:	eb 04                	jmp    c0005b76 <execv+0xf3>
c0005b72:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0005b76:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005b79:	8b 00                	mov    (%eax),%eax
c0005b7b:	85 c0                	test   %eax,%eax
c0005b7d:	75 f3                	jne    c0005b72 <execv+0xef>
c0005b7f:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0005b85:	b8 00 00 00 00       	mov    $0x0,%eax
c0005b8a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0005b8f:	89 d7                	mov    %edx,%edi
c0005b91:	f3 ab                	rep stos %eax,%es:(%edi)
c0005b93:	c7 85 4c 7f ff ff c1 	movl   $0xc0009ec1,-0x80b4(%ebp)
c0005b9a:	9e 00 c0 
c0005b9d:	c7 85 50 7f ff ff c8 	movl   $0xc0009ec8,-0x80b0(%ebp)
c0005ba4:	9e 00 c0 
c0005ba7:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0005bae:	00 00 00 
c0005bb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005bb4:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0005bba:	83 ec 0c             	sub    $0xc,%esp
c0005bbd:	ff 75 08             	pushl  0x8(%ebp)
c0005bc0:	e8 33 4b 00 00       	call   c000a6f8 <Strlen>
c0005bc5:	83 c4 10             	add    $0x10,%esp
c0005bc8:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0005bce:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005bd4:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0005bda:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005bdd:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0005be3:	83 ec 04             	sub    $0x4,%esp
c0005be6:	6a 04                	push   $0x4
c0005be8:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0005bee:	50                   	push   %eax
c0005bef:	6a 03                	push   $0x3
c0005bf1:	e8 0a 37 00 00       	call   c0009300 <send_rec>
c0005bf6:	83 c4 10             	add    $0x10,%esp
c0005bf9:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0005bff:	83 f8 65             	cmp    $0x65,%eax
c0005c02:	74 19                	je     c0005c1d <execv+0x19a>
c0005c04:	6a 72                	push   $0x72
c0005c06:	68 9e 9e 00 c0       	push   $0xc0009e9e
c0005c0b:	68 9e 9e 00 c0       	push   $0xc0009e9e
c0005c10:	68 a9 9e 00 c0       	push   $0xc0009ea9
c0005c15:	e8 42 2f 00 00       	call   c0008b5c <assertion_failure>
c0005c1a:	83 c4 10             	add    $0x10,%esp
c0005c1d:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0005c23:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0005c26:	c9                   	leave  
c0005c27:	c3                   	ret    

c0005c28 <execl>:
c0005c28:	55                   	push   %ebp
c0005c29:	89 e5                	mov    %esp,%ebp
c0005c2b:	83 ec 18             	sub    $0x18,%esp
c0005c2e:	8d 45 0c             	lea    0xc(%ebp),%eax
c0005c31:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005c34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c37:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c3a:	83 ec 08             	sub    $0x8,%esp
c0005c3d:	ff 75 f0             	pushl  -0x10(%ebp)
c0005c40:	ff 75 08             	pushl  0x8(%ebp)
c0005c43:	e8 3b fe ff ff       	call   c0005a83 <execv>
c0005c48:	83 c4 10             	add    $0x10,%esp
c0005c4b:	c9                   	leave  
c0005c4c:	c3                   	ret    

c0005c4d <TaskMM>:
c0005c4d:	55                   	push   %ebp
c0005c4e:	89 e5                	mov    %esp,%ebp
c0005c50:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0005c56:	83 ec 04             	sub    $0x4,%esp
c0005c59:	6a 0e                	push   $0xe
c0005c5b:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005c61:	50                   	push   %eax
c0005c62:	6a 02                	push   $0x2
c0005c64:	e8 97 36 00 00       	call   c0009300 <send_rec>
c0005c69:	83 c4 10             	add    $0x10,%esp
c0005c6c:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0005c72:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c75:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0005c7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005c7e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005c85:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
c0005c8c:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0005c93:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
c0005c9a:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0005c9e:	74 4e                	je     c0005cee <TaskMM+0xa1>
c0005ca0:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0005ca4:	7f 08                	jg     c0005cae <TaskMM+0x61>
c0005ca6:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0005caa:	74 27                	je     c0005cd3 <TaskMM+0x86>
c0005cac:	eb 79                	jmp    c0005d27 <TaskMM+0xda>
c0005cae:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0005cb2:	74 08                	je     c0005cbc <TaskMM+0x6f>
c0005cb4:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
c0005cb8:	74 52                	je     c0005d0c <TaskMM+0xbf>
c0005cba:	eb 6b                	jmp    c0005d27 <TaskMM+0xda>
c0005cbc:	83 ec 0c             	sub    $0xc,%esp
c0005cbf:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005cc5:	50                   	push   %eax
c0005cc6:	e8 f7 03 00 00       	call   c00060c2 <do_fork>
c0005ccb:	83 c4 10             	add    $0x10,%esp
c0005cce:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0005cd1:	eb 65                	jmp    c0005d38 <TaskMM+0xeb>
c0005cd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005cda:	83 ec 0c             	sub    $0xc,%esp
c0005cdd:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005ce3:	50                   	push   %eax
c0005ce4:	e8 a8 00 00 00       	call   c0005d91 <do_exec>
c0005ce9:	83 c4 10             	add    $0x10,%esp
c0005cec:	eb 4a                	jmp    c0005d38 <TaskMM+0xeb>
c0005cee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005cf5:	83 ec 08             	sub    $0x8,%esp
c0005cf8:	ff 75 e4             	pushl  -0x1c(%ebp)
c0005cfb:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005d01:	50                   	push   %eax
c0005d02:	e8 ab 05 00 00       	call   c00062b2 <do_exit>
c0005d07:	83 c4 10             	add    $0x10,%esp
c0005d0a:	eb 2c                	jmp    c0005d38 <TaskMM+0xeb>
c0005d0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005d13:	83 ec 0c             	sub    $0xc,%esp
c0005d16:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0005d1c:	50                   	push   %eax
c0005d1d:	e8 83 06 00 00       	call   c00063a5 <do_wait>
c0005d22:	83 c4 10             	add    $0x10,%esp
c0005d25:	eb 11                	jmp    c0005d38 <TaskMM+0xeb>
c0005d27:	83 ec 0c             	sub    $0xc,%esp
c0005d2a:	68 cf 9e 00 c0       	push   $0xc0009ecf
c0005d2f:	e8 0a 2e 00 00       	call   c0008b3e <panic>
c0005d34:	83 c4 10             	add    $0x10,%esp
c0005d37:	90                   	nop
c0005d38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005d3c:	0f 84 14 ff ff ff    	je     c0005c56 <TaskMM+0x9>
c0005d42:	83 ec 04             	sub    $0x4,%esp
c0005d45:	ff 75 ec             	pushl  -0x14(%ebp)
c0005d48:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
c0005d4e:	50                   	push   %eax
c0005d4f:	6a 01                	push   $0x1
c0005d51:	e8 aa 35 00 00       	call   c0009300 <send_rec>
c0005d56:	83 c4 10             	add    $0x10,%esp
c0005d59:	e9 f8 fe ff ff       	jmp    c0005c56 <TaskMM+0x9>

c0005d5e <alloc_mem>:
c0005d5e:	55                   	push   %ebp
c0005d5f:	89 e5                	mov    %esp,%ebp
c0005d61:	83 ec 10             	sub    $0x10,%esp
c0005d64:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d67:	83 e8 04             	sub    $0x4,%eax
c0005d6a:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0005d70:	05 00 00 a0 00       	add    $0xa00000,%eax
c0005d75:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005d78:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005d7b:	c9                   	leave  
c0005d7c:	c3                   	ret    

c0005d7d <do_exec2>:
c0005d7d:	55                   	push   %ebp
c0005d7e:	89 e5                	mov    %esp,%ebp
c0005d80:	83 ec 10             	sub    $0x10,%esp
c0005d83:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0005d8a:	b8 00 00 00 00       	mov    $0x0,%eax
c0005d8f:	c9                   	leave  
c0005d90:	c3                   	ret    

c0005d91 <do_exec>:
c0005d91:	55                   	push   %ebp
c0005d92:	89 e5                	mov    %esp,%ebp
c0005d94:	56                   	push   %esi
c0005d95:	53                   	push   %ebx
c0005d96:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0005d9c:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0005da3:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0005daa:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c0005db0:	83 ec 08             	sub    $0x8,%esp
c0005db3:	6a 00                	push   $0x0
c0005db5:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c0005db8:	50                   	push   %eax
c0005db9:	e8 60 fa ff ff       	call   c000581e <open>
c0005dbe:	83 c4 10             	add    $0x10,%esp
c0005dc1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005dc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0005dc7:	8b 00                	mov    (%eax),%eax
c0005dc9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005dcc:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0005dd3:	83 ec 04             	sub    $0x4,%esp
c0005dd6:	6a 0c                	push   $0xc
c0005dd8:	6a 00                	push   $0x0
c0005dda:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0005de0:	50                   	push   %eax
c0005de1:	e8 d9 48 00 00       	call   c000a6bf <Memset>
c0005de6:	83 c4 10             	add    $0x10,%esp
c0005de9:	8b 45 08             	mov    0x8(%ebp),%eax
c0005dec:	8b 40 30             	mov    0x30(%eax),%eax
c0005def:	89 c6                	mov    %eax,%esi
c0005df1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005df4:	8b 40 34             	mov    0x34(%eax),%eax
c0005df7:	83 ec 08             	sub    $0x8,%esp
c0005dfa:	50                   	push   %eax
c0005dfb:	ff 75 d8             	pushl  -0x28(%ebp)
c0005dfe:	e8 7b ea ff ff       	call   c000487e <v2l>
c0005e03:	83 c4 10             	add    $0x10,%esp
c0005e06:	89 c3                	mov    %eax,%ebx
c0005e08:	83 ec 08             	sub    $0x8,%esp
c0005e0b:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0005e11:	50                   	push   %eax
c0005e12:	6a 04                	push   $0x4
c0005e14:	e8 65 ea ff ff       	call   c000487e <v2l>
c0005e19:	83 c4 10             	add    $0x10,%esp
c0005e1c:	83 ec 04             	sub    $0x4,%esp
c0005e1f:	56                   	push   %esi
c0005e20:	53                   	push   %ebx
c0005e21:	50                   	push   %eax
c0005e22:	e8 6a 48 00 00       	call   c000a691 <Memcpy>
c0005e27:	83 c4 10             	add    $0x10,%esp
c0005e2a:	83 ec 08             	sub    $0x8,%esp
c0005e2d:	6a 00                	push   $0x0
c0005e2f:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0005e35:	50                   	push   %eax
c0005e36:	e8 e3 f9 ff ff       	call   c000581e <open>
c0005e3b:	83 c4 10             	add    $0x10,%esp
c0005e3e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005e41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e4b:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0005e51:	01 d0                	add    %edx,%eax
c0005e53:	83 ec 04             	sub    $0x4,%esp
c0005e56:	68 00 02 00 00       	push   $0x200
c0005e5b:	50                   	push   %eax
c0005e5c:	ff 75 d0             	pushl  -0x30(%ebp)
c0005e5f:	e8 0f fa ff ff       	call   c0005873 <read>
c0005e64:	83 c4 10             	add    $0x10,%esp
c0005e67:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005e6a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0005e6d:	01 45 f4             	add    %eax,-0xc(%ebp)
c0005e70:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0005e74:	74 02                	je     c0005e78 <do_exec+0xe7>
c0005e76:	eb d0                	jmp    c0005e48 <do_exec+0xb7>
c0005e78:	90                   	nop
c0005e79:	83 ec 0c             	sub    $0xc,%esp
c0005e7c:	ff 75 d0             	pushl  -0x30(%ebp)
c0005e7f:	e8 5d fa ff ff       	call   c00058e1 <close>
c0005e84:	83 c4 10             	add    $0x10,%esp
c0005e87:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0005e8d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005e90:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005e97:	eb 72                	jmp    c0005f0b <do_exec+0x17a>
c0005e99:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005e9c:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0005ea0:	0f b7 d0             	movzwl %ax,%edx
c0005ea3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005ea6:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0005eaa:	0f b7 c0             	movzwl %ax,%eax
c0005ead:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0005eb1:	01 c2                	add    %eax,%edx
c0005eb3:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0005eb9:	01 d0                	add    %edx,%eax
c0005ebb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0005ebe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005ec1:	8b 40 10             	mov    0x10(%eax),%eax
c0005ec4:	89 c6                	mov    %eax,%esi
c0005ec6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005ec9:	8b 40 04             	mov    0x4(%eax),%eax
c0005ecc:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0005ed2:	01 d0                	add    %edx,%eax
c0005ed4:	83 ec 08             	sub    $0x8,%esp
c0005ed7:	50                   	push   %eax
c0005ed8:	6a 04                	push   $0x4
c0005eda:	e8 9f e9 ff ff       	call   c000487e <v2l>
c0005edf:	83 c4 10             	add    $0x10,%esp
c0005ee2:	89 c3                	mov    %eax,%ebx
c0005ee4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005ee7:	8b 40 08             	mov    0x8(%eax),%eax
c0005eea:	83 ec 08             	sub    $0x8,%esp
c0005eed:	50                   	push   %eax
c0005eee:	ff 75 d8             	pushl  -0x28(%ebp)
c0005ef1:	e8 88 e9 ff ff       	call   c000487e <v2l>
c0005ef6:	83 c4 10             	add    $0x10,%esp
c0005ef9:	83 ec 04             	sub    $0x4,%esp
c0005efc:	56                   	push   %esi
c0005efd:	53                   	push   %ebx
c0005efe:	50                   	push   %eax
c0005eff:	e8 8d 47 00 00       	call   c000a691 <Memcpy>
c0005f04:	83 c4 10             	add    $0x10,%esp
c0005f07:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005f0b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005f0e:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0005f12:	0f b7 c0             	movzwl %ax,%eax
c0005f15:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0005f18:	0f 8c 7b ff ff ff    	jl     c0005e99 <do_exec+0x108>
c0005f1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005f21:	8b 40 10             	mov    0x10(%eax),%eax
c0005f24:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005f27:	8b 45 08             	mov    0x8(%ebp),%eax
c0005f2a:	8b 40 1c             	mov    0x1c(%eax),%eax
c0005f2d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005f30:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0005f37:	83 ec 08             	sub    $0x8,%esp
c0005f3a:	ff 75 c0             	pushl  -0x40(%ebp)
c0005f3d:	ff 75 d8             	pushl  -0x28(%ebp)
c0005f40:	e8 39 e9 ff ff       	call   c000487e <v2l>
c0005f45:	83 c4 10             	add    $0x10,%esp
c0005f48:	89 c3                	mov    %eax,%ebx
c0005f4a:	83 ec 08             	sub    $0x8,%esp
c0005f4d:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005f53:	50                   	push   %eax
c0005f54:	6a 04                	push   $0x4
c0005f56:	e8 23 e9 ff ff       	call   c000487e <v2l>
c0005f5b:	83 c4 10             	add    $0x10,%esp
c0005f5e:	83 ec 04             	sub    $0x4,%esp
c0005f61:	ff 75 bc             	pushl  -0x44(%ebp)
c0005f64:	53                   	push   %ebx
c0005f65:	50                   	push   %eax
c0005f66:	e8 26 47 00 00       	call   c000a691 <Memcpy>
c0005f6b:	83 c4 10             	add    $0x10,%esp
c0005f6e:	83 ec 08             	sub    $0x8,%esp
c0005f71:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005f77:	50                   	push   %eax
c0005f78:	6a 04                	push   $0x4
c0005f7a:	e8 ff e8 ff ff       	call   c000487e <v2l>
c0005f7f:	83 c4 10             	add    $0x10,%esp
c0005f82:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0005f85:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0005f88:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005f8b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005f92:	eb 08                	jmp    c0005f9c <do_exec+0x20b>
c0005f94:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005f98:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005f9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005f9f:	8b 00                	mov    (%eax),%eax
c0005fa1:	85 c0                	test   %eax,%eax
c0005fa3:	75 ef                	jne    c0005f94 <do_exec+0x203>
c0005fa5:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0005fa8:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0005fab:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0005fae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005fb5:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005fbb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005fbe:	eb 17                	jmp    c0005fd7 <do_exec+0x246>
c0005fc0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005fc4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005fc7:	8b 10                	mov    (%eax),%edx
c0005fc9:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0005fcc:	01 c2                	add    %eax,%edx
c0005fce:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005fd1:	89 10                	mov    %edx,(%eax)
c0005fd3:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0005fd7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005fda:	8b 00                	mov    (%eax),%eax
c0005fdc:	85 c0                	test   %eax,%eax
c0005fde:	75 e0                	jne    c0005fc0 <do_exec+0x22f>
c0005fe0:	83 ec 08             	sub    $0x8,%esp
c0005fe3:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0005fe9:	50                   	push   %eax
c0005fea:	6a 04                	push   $0x4
c0005fec:	e8 8d e8 ff ff       	call   c000487e <v2l>
c0005ff1:	83 c4 10             	add    $0x10,%esp
c0005ff4:	89 c3                	mov    %eax,%ebx
c0005ff6:	83 ec 08             	sub    $0x8,%esp
c0005ff9:	ff 75 b8             	pushl  -0x48(%ebp)
c0005ffc:	ff 75 d8             	pushl  -0x28(%ebp)
c0005fff:	e8 7a e8 ff ff       	call   c000487e <v2l>
c0006004:	83 c4 10             	add    $0x10,%esp
c0006007:	83 ec 04             	sub    $0x4,%esp
c000600a:	ff 75 bc             	pushl  -0x44(%ebp)
c000600d:	53                   	push   %ebx
c000600e:	50                   	push   %eax
c000600f:	e8 7d 46 00 00       	call   c000a691 <Memcpy>
c0006014:	83 c4 10             	add    $0x10,%esp
c0006017:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000601a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000601d:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006020:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006023:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c0006029:	81 c2 78 22 08 c0    	add    $0xc0082278,%edx
c000602f:	89 02                	mov    %eax,(%edx)
c0006031:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006034:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006037:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c000603d:	81 c2 74 22 08 c0    	add    $0xc0082274,%edx
c0006043:	89 02                	mov    %eax,(%edx)
c0006045:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006048:	8b 40 18             	mov    0x18(%eax),%eax
c000604b:	89 c2                	mov    %eax,%edx
c000604d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006050:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0006056:	05 7c 22 08 c0       	add    $0xc008227c,%eax
c000605b:	89 10                	mov    %edx,(%eax)
c000605d:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006060:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006063:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c0006069:	81 c2 88 22 08 c0    	add    $0xc0082288,%edx
c000606f:	89 02                	mov    %eax,(%edx)
c0006071:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006074:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000607a:	05 30 22 08 c0       	add    $0xc0082230,%eax
c000607f:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c0006085:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c000608c:	00 00 00 
c000608f:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0006096:	00 00 00 
c0006099:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c00060a0:	00 00 00 
c00060a3:	83 ec 04             	sub    $0x4,%esp
c00060a6:	ff 75 d8             	pushl  -0x28(%ebp)
c00060a9:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c00060af:	50                   	push   %eax
c00060b0:	6a 01                	push   $0x1
c00060b2:	e8 49 32 00 00       	call   c0009300 <send_rec>
c00060b7:	83 c4 10             	add    $0x10,%esp
c00060ba:	90                   	nop
c00060bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00060be:	5b                   	pop    %ebx
c00060bf:	5e                   	pop    %esi
c00060c0:	5d                   	pop    %ebp
c00060c1:	c3                   	ret    

c00060c2 <do_fork>:
c00060c2:	55                   	push   %ebp
c00060c3:	89 e5                	mov    %esp,%ebp
c00060c5:	57                   	push   %edi
c00060c6:	56                   	push   %esi
c00060c7:	53                   	push   %ebx
c00060c8:	81 ec ac 00 00 00    	sub    $0xac,%esp
c00060ce:	c7 45 e4 a0 24 08 c0 	movl   $0xc00824a0,-0x1c(%ebp)
c00060d5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00060dc:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%ebp)
c00060e3:	eb 1e                	jmp    c0006103 <do_fork+0x41>
c00060e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00060e8:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00060ec:	3c ff                	cmp    $0xff,%al
c00060ee:	75 08                	jne    c00060f8 <do_fork+0x36>
c00060f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00060f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00060f6:	eb 11                	jmp    c0006109 <do_fork+0x47>
c00060f8:	81 45 e4 b0 00 00 00 	addl   $0xb0,-0x1c(%ebp)
c00060ff:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0006103:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0006107:	7e dc                	jle    c00060e5 <do_fork+0x23>
c0006109:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000610d:	7f 19                	jg     c0006128 <do_fork+0x66>
c000610f:	6a 25                	push   $0x25
c0006111:	68 e0 9e 00 c0       	push   $0xc0009ee0
c0006116:	68 e0 9e 00 c0       	push   $0xc0009ee0
c000611b:	68 f0 9e 00 c0       	push   $0xc0009ef0
c0006120:	e8 37 2a 00 00       	call   c0008b5c <assertion_failure>
c0006125:	83 c4 10             	add    $0x10,%esp
c0006128:	8b 45 08             	mov    0x8(%ebp),%eax
c000612b:	8b 00                	mov    (%eax),%eax
c000612d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006130:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006133:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
c0006137:	0f b7 c0             	movzwl %ax,%eax
c000613a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000613d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006140:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006143:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c0006149:	8d 8a e0 21 08 c0    	lea    -0x3ff7de20(%edx),%ecx
c000614f:	89 c2                	mov    %eax,%edx
c0006151:	89 cb                	mov    %ecx,%ebx
c0006153:	b8 2c 00 00 00       	mov    $0x2c,%eax
c0006158:	89 d7                	mov    %edx,%edi
c000615a:	89 de                	mov    %ebx,%esi
c000615c:	89 c1                	mov    %eax,%ecx
c000615e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0006160:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006163:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006166:	89 50 20             	mov    %edx,0x20(%eax)
c0006169:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000616c:	89 c2                	mov    %eax,%edx
c000616e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006171:	66 89 50 0c          	mov    %dx,0xc(%eax)
c0006175:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006178:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000617b:	89 50 64             	mov    %edx,0x64(%eax)
c000617e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006181:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0006187:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c000618c:	83 c0 0e             	add    $0xe,%eax
c000618f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006192:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006195:	0f b6 40 07          	movzbl 0x7(%eax),%eax
c0006199:	0f b6 c0             	movzbl %al,%eax
c000619c:	c1 e0 18             	shl    $0x18,%eax
c000619f:	89 c2                	mov    %eax,%edx
c00061a1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00061a4:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c00061a8:	0f b6 c0             	movzbl %al,%eax
c00061ab:	c1 e0 10             	shl    $0x10,%eax
c00061ae:	01 c2                	add    %eax,%edx
c00061b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00061b3:	0f b7 40 02          	movzwl 0x2(%eax),%eax
c00061b7:	0f b7 c0             	movzwl %ax,%eax
c00061ba:	01 d0                	add    %edx,%eax
c00061bc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00061bf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00061c2:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c00061c6:	0f b6 c0             	movzbl %al,%eax
c00061c9:	25 00 00 0f 00       	and    $0xf0000,%eax
c00061ce:	89 c2                	mov    %eax,%edx
c00061d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00061d3:	0f b7 00             	movzwl (%eax),%eax
c00061d6:	0f b7 c0             	movzwl %ax,%eax
c00061d9:	01 d0                	add    %edx,%eax
c00061db:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00061de:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00061e1:	83 c0 01             	add    $0x1,%eax
c00061e4:	c1 e0 0c             	shl    $0xc,%eax
c00061e7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00061ea:	83 ec 08             	sub    $0x8,%esp
c00061ed:	ff 75 c4             	pushl  -0x3c(%ebp)
c00061f0:	ff 75 e0             	pushl  -0x20(%ebp)
c00061f3:	e8 66 fb ff ff       	call   c0005d5e <alloc_mem>
c00061f8:	83 c4 10             	add    $0x10,%esp
c00061fb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00061fe:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0006201:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006204:	83 ec 04             	sub    $0x4,%esp
c0006207:	ff 75 c4             	pushl  -0x3c(%ebp)
c000620a:	52                   	push   %edx
c000620b:	50                   	push   %eax
c000620c:	e8 80 44 00 00       	call   c000a691 <Memcpy>
c0006211:	83 c4 10             	add    $0x10,%esp
c0006214:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c000621b:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
c0006222:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006225:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000622b:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c0006230:	83 c0 0e             	add    $0xe,%eax
c0006233:	ff 75 b8             	pushl  -0x48(%ebp)
c0006236:	ff 75 c8             	pushl  -0x38(%ebp)
c0006239:	ff 75 c0             	pushl  -0x40(%ebp)
c000623c:	50                   	push   %eax
c000623d:	e8 37 e5 ff ff       	call   c0004779 <InitDescriptor>
c0006242:	83 c4 10             	add    $0x10,%esp
c0006245:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
c000624c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000624f:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0006255:	83 c0 08             	add    $0x8,%eax
c0006258:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c000625d:	83 c0 0e             	add    $0xe,%eax
c0006260:	ff 75 b4             	pushl  -0x4c(%ebp)
c0006263:	ff 75 c8             	pushl  -0x38(%ebp)
c0006266:	ff 75 c0             	pushl  -0x40(%ebp)
c0006269:	50                   	push   %eax
c000626a:	e8 0a e5 ff ff       	call   c0004779 <InitDescriptor>
c000626f:	83 c4 10             	add    $0x10,%esp
c0006272:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006275:	8b 45 08             	mov    0x8(%ebp),%eax
c0006278:	89 50 4c             	mov    %edx,0x4c(%eax)
c000627b:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
c0006282:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c0006289:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0006290:	83 ec 04             	sub    $0x4,%esp
c0006293:	ff 75 e0             	pushl  -0x20(%ebp)
c0006296:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
c000629c:	50                   	push   %eax
c000629d:	6a 01                	push   $0x1
c000629f:	e8 5c 30 00 00       	call   c0009300 <send_rec>
c00062a4:	83 c4 10             	add    $0x10,%esp
c00062a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00062aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00062ad:	5b                   	pop    %ebx
c00062ae:	5e                   	pop    %esi
c00062af:	5f                   	pop    %edi
c00062b0:	5d                   	pop    %ebp
c00062b1:	c3                   	ret    

c00062b2 <do_exit>:
c00062b2:	55                   	push   %ebp
c00062b3:	89 e5                	mov    %esp,%ebp
c00062b5:	83 ec 18             	sub    $0x18,%esp
c00062b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00062bb:	8b 00                	mov    (%eax),%eax
c00062bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00062c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062c3:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00062c9:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c00062ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00062d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00062d4:	8b 40 64             	mov    0x64(%eax),%eax
c00062d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00062da:	8b 45 08             	mov    0x8(%ebp),%eax
c00062dd:	8b 40 44             	mov    0x44(%eax),%eax
c00062e0:	89 c2                	mov    %eax,%edx
c00062e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00062e5:	89 50 68             	mov    %edx,0x68(%eax)
c00062e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062eb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00062f1:	05 29 22 08 c0       	add    $0xc0082229,%eax
c00062f6:	0f b6 00             	movzbl (%eax),%eax
c00062f9:	3c 04                	cmp    $0x4,%al
c00062fb:	75 21                	jne    c000631e <do_exit+0x6c>
c00062fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006300:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0006306:	05 29 22 08 c0       	add    $0xc0082229,%eax
c000630b:	c6 00 fb             	movb   $0xfb,(%eax)
c000630e:	83 ec 0c             	sub    $0xc,%esp
c0006311:	ff 75 ec             	pushl  -0x14(%ebp)
c0006314:	e8 56 01 00 00       	call   c000646f <cleanup>
c0006319:	83 c4 10             	add    $0x10,%esp
c000631c:	eb 07                	jmp    c0006325 <do_exit+0x73>
c000631e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006321:	c6 40 48 03          	movb   $0x3,0x48(%eax)
c0006325:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c000632c:	eb 6e                	jmp    c000639c <do_exit+0xea>
c000632e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006331:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0006337:	05 44 22 08 c0       	add    $0xc0082244,%eax
c000633c:	8b 00                	mov    (%eax),%eax
c000633e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006341:	75 55                	jne    c0006398 <do_exit+0xe6>
c0006343:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006346:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000634c:	05 44 22 08 c0       	add    $0xc0082244,%eax
c0006351:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0006357:	0f b6 05 49 26 08 c0 	movzbl 0xc0082649,%eax
c000635e:	3c 04                	cmp    $0x4,%al
c0006360:	75 36                	jne    c0006398 <do_exit+0xe6>
c0006362:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006365:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000636b:	05 29 22 08 c0       	add    $0xc0082229,%eax
c0006370:	0f b6 00             	movzbl (%eax),%eax
c0006373:	3c 03                	cmp    $0x3,%al
c0006375:	75 21                	jne    c0006398 <do_exit+0xe6>
c0006377:	c6 05 49 26 08 c0 fb 	movb   $0xfb,0xc0082649
c000637e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006381:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0006387:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c000638c:	83 ec 0c             	sub    $0xc,%esp
c000638f:	50                   	push   %eax
c0006390:	e8 da 00 00 00       	call   c000646f <cleanup>
c0006395:	83 c4 10             	add    $0x10,%esp
c0006398:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000639c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00063a0:	7e 8c                	jle    c000632e <do_exit+0x7c>
c00063a2:	90                   	nop
c00063a3:	c9                   	leave  
c00063a4:	c3                   	ret    

c00063a5 <do_wait>:
c00063a5:	55                   	push   %ebp
c00063a6:	89 e5                	mov    %esp,%ebp
c00063a8:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00063ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00063b1:	8b 00                	mov    (%eax),%eax
c00063b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00063b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00063bd:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c00063c4:	eb 5f                	jmp    c0006425 <do_wait+0x80>
c00063c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00063c9:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00063cf:	05 44 22 08 c0       	add    $0xc0082244,%eax
c00063d4:	8b 00                	mov    (%eax),%eax
c00063d6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00063d9:	75 46                	jne    c0006421 <do_wait+0x7c>
c00063db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00063df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00063e2:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00063e8:	05 29 22 08 c0       	add    $0xc0082229,%eax
c00063ed:	0f b6 00             	movzbl (%eax),%eax
c00063f0:	3c 03                	cmp    $0x3,%al
c00063f2:	75 2d                	jne    c0006421 <do_wait+0x7c>
c00063f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00063f7:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00063fd:	05 29 22 08 c0       	add    $0xc0082229,%eax
c0006402:	c6 00 fb             	movb   $0xfb,(%eax)
c0006405:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006408:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000640e:	05 e0 21 08 c0       	add    $0xc00821e0,%eax
c0006413:	83 ec 0c             	sub    $0xc,%esp
c0006416:	50                   	push   %eax
c0006417:	e8 53 00 00 00       	call   c000646f <cleanup>
c000641c:	83 c4 10             	add    $0x10,%esp
c000641f:	eb 4c                	jmp    c000646d <do_wait+0xc8>
c0006421:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006425:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006429:	7e 9b                	jle    c00063c6 <do_wait+0x21>
c000642b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000642f:	74 13                	je     c0006444 <do_wait+0x9f>
c0006431:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006434:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000643a:	05 29 22 08 c0       	add    $0xc0082229,%eax
c000643f:	c6 00 04             	movb   $0x4,(%eax)
c0006442:	eb 29                	jmp    c000646d <do_wait+0xc8>
c0006444:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c000644b:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006452:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006459:	83 ec 04             	sub    $0x4,%esp
c000645c:	ff 75 ec             	pushl  -0x14(%ebp)
c000645f:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006462:	50                   	push   %eax
c0006463:	6a 01                	push   $0x1
c0006465:	e8 96 2e 00 00       	call   c0009300 <send_rec>
c000646a:	83 c4 10             	add    $0x10,%esp
c000646d:	c9                   	leave  
c000646e:	c3                   	ret    

c000646f <cleanup>:
c000646f:	55                   	push   %ebp
c0006470:	89 e5                	mov    %esp,%ebp
c0006472:	83 ec 78             	sub    $0x78,%esp
c0006475:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c000647c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006483:	8b 45 08             	mov    0x8(%ebp),%eax
c0006486:	8b 40 64             	mov    0x64(%eax),%eax
c0006489:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000648c:	8b 45 08             	mov    0x8(%ebp),%eax
c000648f:	8b 40 68             	mov    0x68(%eax),%eax
c0006492:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006495:	8b 45 08             	mov    0x8(%ebp),%eax
c0006498:	8b 40 64             	mov    0x64(%eax),%eax
c000649b:	83 ec 04             	sub    $0x4,%esp
c000649e:	50                   	push   %eax
c000649f:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00064a2:	50                   	push   %eax
c00064a3:	6a 01                	push   $0x1
c00064a5:	e8 56 2e 00 00       	call   c0009300 <send_rec>
c00064aa:	83 c4 10             	add    $0x10,%esp
c00064ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00064b0:	c6 40 48 ff          	movb   $0xff,0x48(%eax)
c00064b4:	90                   	nop
c00064b5:	c9                   	leave  
c00064b6:	c3                   	ret    

c00064b7 <init_bitmap>:
c00064b7:	55                   	push   %ebp
c00064b8:	89 e5                	mov    %esp,%ebp
c00064ba:	83 ec 08             	sub    $0x8,%esp
c00064bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00064c0:	8b 50 04             	mov    0x4(%eax),%edx
c00064c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00064c6:	8b 00                	mov    (%eax),%eax
c00064c8:	83 ec 04             	sub    $0x4,%esp
c00064cb:	52                   	push   %edx
c00064cc:	6a 00                	push   $0x0
c00064ce:	50                   	push   %eax
c00064cf:	e8 eb 41 00 00       	call   c000a6bf <Memset>
c00064d4:	83 c4 10             	add    $0x10,%esp
c00064d7:	90                   	nop
c00064d8:	c9                   	leave  
c00064d9:	c3                   	ret    

c00064da <test_bit_val>:
c00064da:	55                   	push   %ebp
c00064db:	89 e5                	mov    %esp,%ebp
c00064dd:	53                   	push   %ebx
c00064de:	83 ec 10             	sub    $0x10,%esp
c00064e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00064e4:	8d 50 07             	lea    0x7(%eax),%edx
c00064e7:	85 c0                	test   %eax,%eax
c00064e9:	0f 48 c2             	cmovs  %edx,%eax
c00064ec:	c1 f8 03             	sar    $0x3,%eax
c00064ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00064f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00064f5:	99                   	cltd   
c00064f6:	c1 ea 1d             	shr    $0x1d,%edx
c00064f9:	01 d0                	add    %edx,%eax
c00064fb:	83 e0 07             	and    $0x7,%eax
c00064fe:	29 d0                	sub    %edx,%eax
c0006500:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006503:	8b 45 08             	mov    0x8(%ebp),%eax
c0006506:	8b 10                	mov    (%eax),%edx
c0006508:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000650b:	01 d0                	add    %edx,%eax
c000650d:	0f b6 00             	movzbl (%eax),%eax
c0006510:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006513:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006517:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000651a:	bb 01 00 00 00       	mov    $0x1,%ebx
c000651f:	89 c1                	mov    %eax,%ecx
c0006521:	d3 e3                	shl    %cl,%ebx
c0006523:	89 d8                	mov    %ebx,%eax
c0006525:	21 c2                	and    %eax,%edx
c0006527:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000652a:	89 c1                	mov    %eax,%ecx
c000652c:	d3 fa                	sar    %cl,%edx
c000652e:	89 d0                	mov    %edx,%eax
c0006530:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006533:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006537:	0f 9f c0             	setg   %al
c000653a:	0f b6 c0             	movzbl %al,%eax
c000653d:	83 c4 10             	add    $0x10,%esp
c0006540:	5b                   	pop    %ebx
c0006541:	5d                   	pop    %ebp
c0006542:	c3                   	ret    

c0006543 <set_bit_val>:
c0006543:	55                   	push   %ebp
c0006544:	89 e5                	mov    %esp,%ebp
c0006546:	83 ec 10             	sub    $0x10,%esp
c0006549:	8b 45 0c             	mov    0xc(%ebp),%eax
c000654c:	8d 50 07             	lea    0x7(%eax),%edx
c000654f:	85 c0                	test   %eax,%eax
c0006551:	0f 48 c2             	cmovs  %edx,%eax
c0006554:	c1 f8 03             	sar    $0x3,%eax
c0006557:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000655a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000655d:	99                   	cltd   
c000655e:	c1 ea 1d             	shr    $0x1d,%edx
c0006561:	01 d0                	add    %edx,%eax
c0006563:	83 e0 07             	and    $0x7,%eax
c0006566:	29 d0                	sub    %edx,%eax
c0006568:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000656b:	8b 45 08             	mov    0x8(%ebp),%eax
c000656e:	8b 10                	mov    (%eax),%edx
c0006570:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006573:	01 d0                	add    %edx,%eax
c0006575:	0f b6 00             	movzbl (%eax),%eax
c0006578:	88 45 ff             	mov    %al,-0x1(%ebp)
c000657b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000657f:	7e 13                	jle    c0006594 <set_bit_val+0x51>
c0006581:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006584:	ba 01 00 00 00       	mov    $0x1,%edx
c0006589:	89 c1                	mov    %eax,%ecx
c000658b:	d3 e2                	shl    %cl,%edx
c000658d:	89 d0                	mov    %edx,%eax
c000658f:	08 45 ff             	or     %al,-0x1(%ebp)
c0006592:	eb 13                	jmp    c00065a7 <set_bit_val+0x64>
c0006594:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006597:	ba 01 00 00 00       	mov    $0x1,%edx
c000659c:	89 c1                	mov    %eax,%ecx
c000659e:	d3 e2                	shl    %cl,%edx
c00065a0:	89 d0                	mov    %edx,%eax
c00065a2:	f7 d0                	not    %eax
c00065a4:	20 45 ff             	and    %al,-0x1(%ebp)
c00065a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00065aa:	8b 10                	mov    (%eax),%edx
c00065ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00065af:	01 c2                	add    %eax,%edx
c00065b1:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c00065b5:	88 02                	mov    %al,(%edx)
c00065b7:	b8 01 00 00 00       	mov    $0x1,%eax
c00065bc:	c9                   	leave  
c00065bd:	c3                   	ret    

c00065be <set_bits>:
c00065be:	55                   	push   %ebp
c00065bf:	89 e5                	mov    %esp,%ebp
c00065c1:	83 ec 10             	sub    $0x10,%esp
c00065c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00065cb:	eb 1c                	jmp    c00065e9 <set_bits+0x2b>
c00065cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00065d0:	8d 50 01             	lea    0x1(%eax),%edx
c00065d3:	89 55 0c             	mov    %edx,0xc(%ebp)
c00065d6:	ff 75 10             	pushl  0x10(%ebp)
c00065d9:	50                   	push   %eax
c00065da:	ff 75 08             	pushl  0x8(%ebp)
c00065dd:	e8 61 ff ff ff       	call   c0006543 <set_bit_val>
c00065e2:	83 c4 0c             	add    $0xc,%esp
c00065e5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00065e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00065ec:	3b 45 14             	cmp    0x14(%ebp),%eax
c00065ef:	7c dc                	jl     c00065cd <set_bits+0xf>
c00065f1:	b8 01 00 00 00       	mov    $0x1,%eax
c00065f6:	c9                   	leave  
c00065f7:	c3                   	ret    

c00065f8 <get_first_free_bit>:
c00065f8:	55                   	push   %ebp
c00065f9:	89 e5                	mov    %esp,%ebp
c00065fb:	83 ec 10             	sub    $0x10,%esp
c00065fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0006601:	8b 40 04             	mov    0x4(%eax),%eax
c0006604:	c1 e0 03             	shl    $0x3,%eax
c0006607:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000660a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000660d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006610:	eb 1b                	jmp    c000662d <get_first_free_bit+0x35>
c0006612:	ff 75 fc             	pushl  -0x4(%ebp)
c0006615:	ff 75 08             	pushl  0x8(%ebp)
c0006618:	e8 bd fe ff ff       	call   c00064da <test_bit_val>
c000661d:	83 c4 08             	add    $0x8,%esp
c0006620:	85 c0                	test   %eax,%eax
c0006622:	75 05                	jne    c0006629 <get_first_free_bit+0x31>
c0006624:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006627:	eb 11                	jmp    c000663a <get_first_free_bit+0x42>
c0006629:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000662d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006630:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006633:	7c dd                	jl     c0006612 <get_first_free_bit+0x1a>
c0006635:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000663a:	c9                   	leave  
c000663b:	c3                   	ret    

c000663c <get_bits>:
c000663c:	55                   	push   %ebp
c000663d:	89 e5                	mov    %esp,%ebp
c000663f:	83 ec 20             	sub    $0x20,%esp
c0006642:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006649:	ff 75 f0             	pushl  -0x10(%ebp)
c000664c:	ff 75 08             	pushl  0x8(%ebp)
c000664f:	e8 a4 ff ff ff       	call   c00065f8 <get_first_free_bit>
c0006654:	83 c4 08             	add    $0x8,%esp
c0006657:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000665a:	8b 45 08             	mov    0x8(%ebp),%eax
c000665d:	8b 40 04             	mov    0x4(%eax),%eax
c0006660:	c1 e0 03             	shl    $0x3,%eax
c0006663:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006666:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006669:	83 e8 01             	sub    $0x1,%eax
c000666c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000666f:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006673:	75 08                	jne    c000667d <get_bits+0x41>
c0006675:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006678:	e9 85 00 00 00       	jmp    c0006702 <get_bits+0xc6>
c000667d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006680:	83 c0 01             	add    $0x1,%eax
c0006683:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006686:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006689:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000668c:	eb 58                	jmp    c00066e6 <get_bits+0xaa>
c000668e:	ff 75 f8             	pushl  -0x8(%ebp)
c0006691:	ff 75 08             	pushl  0x8(%ebp)
c0006694:	e8 41 fe ff ff       	call   c00064da <test_bit_val>
c0006699:	83 c4 08             	add    $0x8,%esp
c000669c:	85 c0                	test   %eax,%eax
c000669e:	75 0a                	jne    c00066aa <get_bits+0x6e>
c00066a0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00066a4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00066a8:	eb 2b                	jmp    c00066d5 <get_bits+0x99>
c00066aa:	6a 00                	push   $0x0
c00066ac:	ff 75 08             	pushl  0x8(%ebp)
c00066af:	e8 44 ff ff ff       	call   c00065f8 <get_first_free_bit>
c00066b4:	83 c4 08             	add    $0x8,%esp
c00066b7:	83 c0 01             	add    $0x1,%eax
c00066ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00066c0:	83 c0 01             	add    $0x1,%eax
c00066c3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00066c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00066c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00066cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00066cf:	83 e8 01             	sub    $0x1,%eax
c00066d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00066d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066d8:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c00066db:	7c 09                	jl     c00066e6 <get_bits+0xaa>
c00066dd:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00066e4:	eb 0d                	jmp    c00066f3 <get_bits+0xb7>
c00066e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00066e9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00066ec:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00066ef:	85 c0                	test   %eax,%eax
c00066f1:	7f 9b                	jg     c000668e <get_bits+0x52>
c00066f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066f6:	2b 45 0c             	sub    0xc(%ebp),%eax
c00066f9:	83 c0 01             	add    $0x1,%eax
c00066fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00066ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006702:	c9                   	leave  
c0006703:	c3                   	ret    

c0006704 <get_a_page2>:
c0006704:	55                   	push   %ebp
c0006705:	89 e5                	mov    %esp,%ebp
c0006707:	83 ec 18             	sub    $0x18,%esp
c000670a:	83 ec 0c             	sub    $0xc,%esp
c000670d:	ff 75 0c             	pushl  0xc(%ebp)
c0006710:	e8 1e 00 00 00       	call   c0006733 <get_a_page>
c0006715:	83 c4 10             	add    $0x10,%esp
c0006718:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000671b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000671e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006721:	83 ec 08             	sub    $0x8,%esp
c0006724:	52                   	push   %edx
c0006725:	50                   	push   %eax
c0006726:	e8 3c 01 00 00       	call   c0006867 <add_map_entry>
c000672b:	83 c4 10             	add    $0x10,%esp
c000672e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006731:	c9                   	leave  
c0006732:	c3                   	ret    

c0006733 <get_a_page>:
c0006733:	55                   	push   %ebp
c0006734:	89 e5                	mov    %esp,%ebp
c0006736:	83 ec 20             	sub    $0x20,%esp
c0006739:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000673d:	75 22                	jne    c0006761 <get_a_page+0x2e>
c000673f:	a1 cc 06 01 c0       	mov    0xc00106cc,%eax
c0006744:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006747:	a1 d0 06 01 c0       	mov    0xc00106d0,%eax
c000674c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000674f:	a1 d4 06 01 c0       	mov    0xc00106d4,%eax
c0006754:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006757:	a1 d8 06 01 c0       	mov    0xc00106d8,%eax
c000675c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000675f:	eb 20                	jmp    c0006781 <get_a_page+0x4e>
c0006761:	a1 04 0f 01 c0       	mov    0xc0010f04,%eax
c0006766:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006769:	a1 08 0f 01 c0       	mov    0xc0010f08,%eax
c000676e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006771:	a1 0c 0f 01 c0       	mov    0xc0010f0c,%eax
c0006776:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006779:	a1 10 0f 01 c0       	mov    0xc0010f10,%eax
c000677e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006781:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006784:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006787:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000678a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c000678d:	6a 01                	push   $0x1
c000678f:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006792:	50                   	push   %eax
c0006793:	e8 a4 fe ff ff       	call   c000663c <get_bits>
c0006798:	83 c4 08             	add    $0x8,%esp
c000679b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000679e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00067a1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00067a4:	c1 e2 0c             	shl    $0xc,%edx
c00067a7:	01 d0                	add    %edx,%eax
c00067a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00067ac:	6a 01                	push   $0x1
c00067ae:	ff 75 fc             	pushl  -0x4(%ebp)
c00067b1:	8d 45 e0             	lea    -0x20(%ebp),%eax
c00067b4:	50                   	push   %eax
c00067b5:	e8 89 fd ff ff       	call   c0006543 <set_bit_val>
c00067ba:	83 c4 0c             	add    $0xc,%esp
c00067bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00067c0:	c9                   	leave  
c00067c1:	c3                   	ret    

c00067c2 <get_virtual_address>:
c00067c2:	55                   	push   %ebp
c00067c3:	89 e5                	mov    %esp,%ebp
c00067c5:	83 ec 20             	sub    $0x20,%esp
c00067c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00067cc:	75 18                	jne    c00067e6 <get_virtual_address+0x24>
c00067ce:	a1 50 e7 00 c0       	mov    0xc000e750,%eax
c00067d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00067d6:	a1 54 e7 00 c0       	mov    0xc000e754,%eax
c00067db:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00067de:	a1 58 e7 00 c0       	mov    0xc000e758,%eax
c00067e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00067e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00067e9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00067ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00067ef:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00067f2:	8b 45 08             	mov    0x8(%ebp),%eax
c00067f5:	50                   	push   %eax
c00067f6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c00067f9:	50                   	push   %eax
c00067fa:	e8 3d fe ff ff       	call   c000663c <get_bits>
c00067ff:	83 c4 08             	add    $0x8,%esp
c0006802:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006805:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006808:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000680b:	c1 e2 0c             	shl    $0xc,%edx
c000680e:	01 d0                	add    %edx,%eax
c0006810:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006813:	8b 45 08             	mov    0x8(%ebp),%eax
c0006816:	50                   	push   %eax
c0006817:	6a 01                	push   $0x1
c0006819:	ff 75 fc             	pushl  -0x4(%ebp)
c000681c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000681f:	50                   	push   %eax
c0006820:	e8 99 fd ff ff       	call   c00065be <set_bits>
c0006825:	83 c4 10             	add    $0x10,%esp
c0006828:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000682b:	c9                   	leave  
c000682c:	c3                   	ret    

c000682d <ptr_pde>:
c000682d:	55                   	push   %ebp
c000682e:	89 e5                	mov    %esp,%ebp
c0006830:	8b 45 08             	mov    0x8(%ebp),%eax
c0006833:	c1 e8 16             	shr    $0x16,%eax
c0006836:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c000683b:	c1 e0 02             	shl    $0x2,%eax
c000683e:	5d                   	pop    %ebp
c000683f:	c3                   	ret    

c0006840 <ptr_pte>:
c0006840:	55                   	push   %ebp
c0006841:	89 e5                	mov    %esp,%ebp
c0006843:	8b 45 08             	mov    0x8(%ebp),%eax
c0006846:	c1 e8 0a             	shr    $0xa,%eax
c0006849:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c000684e:	89 c2                	mov    %eax,%edx
c0006850:	8b 45 08             	mov    0x8(%ebp),%eax
c0006853:	c1 e8 0c             	shr    $0xc,%eax
c0006856:	25 ff 03 00 00       	and    $0x3ff,%eax
c000685b:	c1 e0 02             	shl    $0x2,%eax
c000685e:	01 d0                	add    %edx,%eax
c0006860:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006865:	5d                   	pop    %ebp
c0006866:	c3                   	ret    

c0006867 <add_map_entry>:
c0006867:	55                   	push   %ebp
c0006868:	89 e5                	mov    %esp,%ebp
c000686a:	83 ec 18             	sub    $0x18,%esp
c000686d:	ff 75 08             	pushl  0x8(%ebp)
c0006870:	e8 b8 ff ff ff       	call   c000682d <ptr_pde>
c0006875:	83 c4 04             	add    $0x4,%esp
c0006878:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000687b:	ff 75 08             	pushl  0x8(%ebp)
c000687e:	e8 bd ff ff ff       	call   c0006840 <ptr_pte>
c0006883:	83 c4 04             	add    $0x4,%esp
c0006886:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006889:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000688c:	8b 00                	mov    (%eax),%eax
c000688e:	83 e0 01             	and    $0x1,%eax
c0006891:	85 c0                	test   %eax,%eax
c0006893:	74 1b                	je     c00068b0 <add_map_entry+0x49>
c0006895:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006898:	8b 00                	mov    (%eax),%eax
c000689a:	83 e0 01             	and    $0x1,%eax
c000689d:	85 c0                	test   %eax,%eax
c000689f:	75 51                	jne    c00068f2 <add_map_entry+0x8b>
c00068a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068a4:	83 c8 07             	or     $0x7,%eax
c00068a7:	89 c2                	mov    %eax,%edx
c00068a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068ac:	89 10                	mov    %edx,(%eax)
c00068ae:	eb 42                	jmp    c00068f2 <add_map_entry+0x8b>
c00068b0:	6a 00                	push   $0x0
c00068b2:	e8 7c fe ff ff       	call   c0006733 <get_a_page>
c00068b7:	83 c4 04             	add    $0x4,%esp
c00068ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068c0:	83 c8 07             	or     $0x7,%eax
c00068c3:	89 c2                	mov    %eax,%edx
c00068c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00068c8:	89 10                	mov    %edx,(%eax)
c00068ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00068d2:	83 ec 04             	sub    $0x4,%esp
c00068d5:	68 00 10 00 00       	push   $0x1000
c00068da:	6a 00                	push   $0x0
c00068dc:	50                   	push   %eax
c00068dd:	e8 dd 3d 00 00       	call   c000a6bf <Memset>
c00068e2:	83 c4 10             	add    $0x10,%esp
c00068e5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068e8:	83 c8 07             	or     $0x7,%eax
c00068eb:	89 c2                	mov    %eax,%edx
c00068ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068f0:	89 10                	mov    %edx,(%eax)
c00068f2:	90                   	nop
c00068f3:	c9                   	leave  
c00068f4:	c3                   	ret    

c00068f5 <get_physical_address>:
c00068f5:	55                   	push   %ebp
c00068f6:	89 e5                	mov    %esp,%ebp
c00068f8:	83 ec 10             	sub    $0x10,%esp
c00068fb:	ff 75 08             	pushl  0x8(%ebp)
c00068fe:	e8 3d ff ff ff       	call   c0006840 <ptr_pte>
c0006903:	83 c4 04             	add    $0x4,%esp
c0006906:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006909:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000690c:	8b 00                	mov    (%eax),%eax
c000690e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006913:	89 c2                	mov    %eax,%edx
c0006915:	8b 45 08             	mov    0x8(%ebp),%eax
c0006918:	25 ff 0f 00 00       	and    $0xfff,%eax
c000691d:	09 d0                	or     %edx,%eax
c000691f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006922:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006925:	c9                   	leave  
c0006926:	c3                   	ret    

c0006927 <alloc_memory>:
c0006927:	55                   	push   %ebp
c0006928:	89 e5                	mov    %esp,%ebp
c000692a:	83 ec 18             	sub    $0x18,%esp
c000692d:	ff 75 0c             	pushl  0xc(%ebp)
c0006930:	ff 75 08             	pushl  0x8(%ebp)
c0006933:	e8 8a fe ff ff       	call   c00067c2 <get_virtual_address>
c0006938:	83 c4 08             	add    $0x8,%esp
c000693b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000693e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006941:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006946:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006949:	eb 26                	jmp    c0006971 <alloc_memory+0x4a>
c000694b:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006952:	ff 75 0c             	pushl  0xc(%ebp)
c0006955:	e8 d9 fd ff ff       	call   c0006733 <get_a_page>
c000695a:	83 c4 04             	add    $0x4,%esp
c000695d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006960:	83 ec 08             	sub    $0x8,%esp
c0006963:	ff 75 ec             	pushl  -0x14(%ebp)
c0006966:	ff 75 f4             	pushl  -0xc(%ebp)
c0006969:	e8 f9 fe ff ff       	call   c0006867 <add_map_entry>
c000696e:	83 c4 10             	add    $0x10,%esp
c0006971:	8b 45 08             	mov    0x8(%ebp),%eax
c0006974:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006977:	89 55 08             	mov    %edx,0x8(%ebp)
c000697a:	85 c0                	test   %eax,%eax
c000697c:	75 cd                	jne    c000694b <alloc_memory+0x24>
c000697e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006981:	c9                   	leave  
c0006982:	c3                   	ret    

c0006983 <get_a_virtual_page>:
c0006983:	55                   	push   %ebp
c0006984:	89 e5                	mov    %esp,%ebp
c0006986:	83 ec 18             	sub    $0x18,%esp
c0006989:	ff 75 08             	pushl  0x8(%ebp)
c000698c:	e8 a2 fd ff ff       	call   c0006733 <get_a_page>
c0006991:	83 c4 04             	add    $0x4,%esp
c0006994:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006997:	83 ec 08             	sub    $0x8,%esp
c000699a:	ff 75 f4             	pushl  -0xc(%ebp)
c000699d:	ff 75 0c             	pushl  0xc(%ebp)
c00069a0:	e8 c2 fe ff ff       	call   c0006867 <add_map_entry>
c00069a5:	83 c4 10             	add    $0x10,%esp
c00069a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069ab:	c9                   	leave  
c00069ac:	c3                   	ret    

c00069ad <init_memory2>:
c00069ad:	55                   	push   %ebp
c00069ae:	89 e5                	mov    %esp,%ebp
c00069b0:	83 ec 38             	sub    $0x38,%esp
c00069b3:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00069ba:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00069c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00069c4:	a3 d4 06 01 c0       	mov    %eax,0xc00106d4
c00069c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00069cc:	a1 d4 06 01 c0       	mov    0xc00106d4,%eax
c00069d1:	29 c2                	sub    %eax,%edx
c00069d3:	89 d0                	mov    %edx,%eax
c00069d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069db:	89 c2                	mov    %eax,%edx
c00069dd:	c1 ea 1f             	shr    $0x1f,%edx
c00069e0:	01 d0                	add    %edx,%eax
c00069e2:	d1 f8                	sar    %eax
c00069e4:	a3 d8 06 01 c0       	mov    %eax,0xc00106d8
c00069e9:	a1 d8 06 01 c0       	mov    0xc00106d8,%eax
c00069ee:	83 ec 0c             	sub    $0xc,%esp
c00069f1:	50                   	push   %eax
c00069f2:	e8 ff 05 00 00       	call   c0006ff6 <disp_int>
c00069f7:	83 c4 10             	add    $0x10,%esp
c00069fa:	a1 d8 06 01 c0       	mov    0xc00106d8,%eax
c00069ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a02:	29 c2                	sub    %eax,%edx
c0006a04:	89 d0                	mov    %edx,%eax
c0006a06:	a3 10 0f 01 c0       	mov    %eax,0xc0010f10
c0006a0b:	83 ec 0c             	sub    $0xc,%esp
c0006a0e:	68 17 9f 00 c0       	push   $0xc0009f17
c0006a13:	e8 74 ab ff ff       	call   c000158c <disp_str>
c0006a18:	83 c4 10             	add    $0x10,%esp
c0006a1b:	a1 10 0f 01 c0       	mov    0xc0010f10,%eax
c0006a20:	83 ec 0c             	sub    $0xc,%esp
c0006a23:	50                   	push   %eax
c0006a24:	e8 cd 05 00 00       	call   c0006ff6 <disp_int>
c0006a29:	83 c4 10             	add    $0x10,%esp
c0006a2c:	83 ec 0c             	sub    $0xc,%esp
c0006a2f:	68 17 9f 00 c0       	push   $0xc0009f17
c0006a34:	e8 53 ab ff ff       	call   c000158c <disp_str>
c0006a39:	83 c4 10             	add    $0x10,%esp
c0006a3c:	a1 d8 06 01 c0       	mov    0xc00106d8,%eax
c0006a41:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006a46:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006a4c:	85 c0                	test   %eax,%eax
c0006a4e:	0f 48 c2             	cmovs  %edx,%eax
c0006a51:	c1 f8 0c             	sar    $0xc,%eax
c0006a54:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a5a:	83 c0 07             	add    $0x7,%eax
c0006a5d:	8d 50 07             	lea    0x7(%eax),%edx
c0006a60:	85 c0                	test   %eax,%eax
c0006a62:	0f 48 c2             	cmovs  %edx,%eax
c0006a65:	c1 f8 03             	sar    $0x3,%eax
c0006a68:	a3 d0 06 01 c0       	mov    %eax,0xc00106d0
c0006a6d:	a1 d4 06 01 c0       	mov    0xc00106d4,%eax
c0006a72:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0006a77:	a3 cc 06 01 c0       	mov    %eax,0xc00106cc
c0006a7c:	8b 15 d0 06 01 c0    	mov    0xc00106d0,%edx
c0006a82:	a1 cc 06 01 c0       	mov    0xc00106cc,%eax
c0006a87:	83 ec 04             	sub    $0x4,%esp
c0006a8a:	52                   	push   %edx
c0006a8b:	6a 00                	push   $0x0
c0006a8d:	50                   	push   %eax
c0006a8e:	e8 2c 3c 00 00       	call   c000a6bf <Memset>
c0006a93:	83 c4 10             	add    $0x10,%esp
c0006a96:	a1 d0 06 01 c0       	mov    0xc00106d0,%eax
c0006a9b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006aa0:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006aa6:	85 c0                	test   %eax,%eax
c0006aa8:	0f 48 c2             	cmovs  %edx,%eax
c0006aab:	c1 f8 0c             	sar    $0xc,%eax
c0006aae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ab1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ab4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006ab7:	ff 75 e8             	pushl  -0x18(%ebp)
c0006aba:	6a 01                	push   $0x1
c0006abc:	6a 00                	push   $0x0
c0006abe:	68 cc 06 01 c0       	push   $0xc00106cc
c0006ac3:	e8 f6 fa ff ff       	call   c00065be <set_bits>
c0006ac8:	83 c4 10             	add    $0x10,%esp
c0006acb:	a1 10 0f 01 c0       	mov    0xc0010f10,%eax
c0006ad0:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006ad5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006adb:	85 c0                	test   %eax,%eax
c0006add:	0f 48 c2             	cmovs  %edx,%eax
c0006ae0:	c1 f8 0c             	sar    $0xc,%eax
c0006ae3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ae6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ae9:	83 c0 07             	add    $0x7,%eax
c0006aec:	8d 50 07             	lea    0x7(%eax),%edx
c0006aef:	85 c0                	test   %eax,%eax
c0006af1:	0f 48 c2             	cmovs  %edx,%eax
c0006af4:	c1 f8 03             	sar    $0x3,%eax
c0006af7:	a3 08 0f 01 c0       	mov    %eax,0xc0010f08
c0006afc:	a1 d4 06 01 c0       	mov    0xc00106d4,%eax
c0006b01:	8b 15 d0 06 01 c0    	mov    0xc00106d0,%edx
c0006b07:	01 d0                	add    %edx,%eax
c0006b09:	a3 04 0f 01 c0       	mov    %eax,0xc0010f04
c0006b0e:	8b 15 08 0f 01 c0    	mov    0xc0010f08,%edx
c0006b14:	a1 04 0f 01 c0       	mov    0xc0010f04,%eax
c0006b19:	83 ec 04             	sub    $0x4,%esp
c0006b1c:	52                   	push   %edx
c0006b1d:	6a 00                	push   $0x0
c0006b1f:	50                   	push   %eax
c0006b20:	e8 9a 3b 00 00       	call   c000a6bf <Memset>
c0006b25:	83 c4 10             	add    $0x10,%esp
c0006b28:	a1 08 0f 01 c0       	mov    0xc0010f08,%eax
c0006b2d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006b32:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006b38:	85 c0                	test   %eax,%eax
c0006b3a:	0f 48 c2             	cmovs  %edx,%eax
c0006b3d:	c1 f8 0c             	sar    $0xc,%eax
c0006b40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006b46:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006b49:	ff 75 e8             	pushl  -0x18(%ebp)
c0006b4c:	6a 01                	push   $0x1
c0006b4e:	ff 75 e0             	pushl  -0x20(%ebp)
c0006b51:	68 cc 06 01 c0       	push   $0xc00106cc
c0006b56:	e8 63 fa ff ff       	call   c00065be <set_bits>
c0006b5b:	83 c4 10             	add    $0x10,%esp
c0006b5e:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0006b65:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006b68:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b6e:	83 c0 07             	add    $0x7,%eax
c0006b71:	8d 50 07             	lea    0x7(%eax),%edx
c0006b74:	85 c0                	test   %eax,%eax
c0006b76:	0f 48 c2             	cmovs  %edx,%eax
c0006b79:	c1 f8 03             	sar    $0x3,%eax
c0006b7c:	a3 54 e7 00 c0       	mov    %eax,0xc000e754
c0006b81:	a1 d4 06 01 c0       	mov    0xc00106d4,%eax
c0006b86:	8b 15 d0 06 01 c0    	mov    0xc00106d0,%edx
c0006b8c:	01 c2                	add    %eax,%edx
c0006b8e:	a1 08 0f 01 c0       	mov    0xc0010f08,%eax
c0006b93:	01 d0                	add    %edx,%eax
c0006b95:	a3 50 e7 00 c0       	mov    %eax,0xc000e750
c0006b9a:	8b 15 54 e7 00 c0    	mov    0xc000e754,%edx
c0006ba0:	a1 50 e7 00 c0       	mov    0xc000e750,%eax
c0006ba5:	83 ec 04             	sub    $0x4,%esp
c0006ba8:	52                   	push   %edx
c0006ba9:	6a 00                	push   $0x0
c0006bab:	50                   	push   %eax
c0006bac:	e8 0e 3b 00 00       	call   c000a6bf <Memset>
c0006bb1:	83 c4 10             	add    $0x10,%esp
c0006bb4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006bb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006bba:	01 d0                	add    %edx,%eax
c0006bbc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006bbf:	a1 54 e7 00 c0       	mov    0xc000e754,%eax
c0006bc4:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006bc9:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006bcf:	85 c0                	test   %eax,%eax
c0006bd1:	0f 48 c2             	cmovs  %edx,%eax
c0006bd4:	c1 f8 0c             	sar    $0xc,%eax
c0006bd7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bda:	ff 75 e8             	pushl  -0x18(%ebp)
c0006bdd:	6a 01                	push   $0x1
c0006bdf:	ff 75 e0             	pushl  -0x20(%ebp)
c0006be2:	68 cc 06 01 c0       	push   $0xc00106cc
c0006be7:	e8 d2 f9 ff ff       	call   c00065be <set_bits>
c0006bec:	83 c4 10             	add    $0x10,%esp
c0006bef:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006bf2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006bf5:	01 d0                	add    %edx,%eax
c0006bf7:	c1 e0 0c             	shl    $0xc,%eax
c0006bfa:	a3 58 e7 00 c0       	mov    %eax,0xc000e758
c0006bff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c02:	83 c0 02             	add    $0x2,%eax
c0006c05:	c1 e0 0c             	shl    $0xc,%eax
c0006c08:	89 c2                	mov    %eax,%edx
c0006c0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c0d:	01 d0                	add    %edx,%eax
c0006c0f:	a3 58 e7 00 c0       	mov    %eax,0xc000e758
c0006c14:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0006c1b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006c1e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006c21:	90                   	nop
c0006c22:	c9                   	leave  
c0006c23:	c3                   	ret    

c0006c24 <init_memory>:
c0006c24:	55                   	push   %ebp
c0006c25:	89 e5                	mov    %esp,%ebp
c0006c27:	83 ec 38             	sub    $0x38,%esp
c0006c2a:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0006c31:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0006c38:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0006c3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c42:	05 00 00 10 00       	add    $0x100000,%eax
c0006c47:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c4d:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0006c50:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0006c56:	85 c0                	test   %eax,%eax
c0006c58:	0f 48 c2             	cmovs  %edx,%eax
c0006c5b:	c1 f8 0c             	sar    $0xc,%eax
c0006c5e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006c64:	89 c2                	mov    %eax,%edx
c0006c66:	c1 ea 1f             	shr    $0x1f,%edx
c0006c69:	01 d0                	add    %edx,%eax
c0006c6b:	d1 f8                	sar    %eax
c0006c6d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006c73:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0006c76:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006c79:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c7c:	8d 50 07             	lea    0x7(%eax),%edx
c0006c7f:	85 c0                	test   %eax,%eax
c0006c81:	0f 48 c2             	cmovs  %edx,%eax
c0006c84:	c1 f8 03             	sar    $0x3,%eax
c0006c87:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c8a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006c8d:	8d 50 07             	lea    0x7(%eax),%edx
c0006c90:	85 c0                	test   %eax,%eax
c0006c92:	0f 48 c2             	cmovs  %edx,%eax
c0006c95:	c1 f8 03             	sar    $0x3,%eax
c0006c98:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006c9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c9e:	a3 d4 06 01 c0       	mov    %eax,0xc00106d4
c0006ca3:	a1 d4 06 01 c0       	mov    0xc00106d4,%eax
c0006ca8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006cab:	c1 e2 0c             	shl    $0xc,%edx
c0006cae:	01 d0                	add    %edx,%eax
c0006cb0:	a3 0c 0f 01 c0       	mov    %eax,0xc0010f0c
c0006cb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cb8:	a3 cc 06 01 c0       	mov    %eax,0xc00106cc
c0006cbd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006cc0:	a3 d0 06 01 c0       	mov    %eax,0xc00106d0
c0006cc5:	a1 cc 06 01 c0       	mov    0xc00106cc,%eax
c0006cca:	83 ec 04             	sub    $0x4,%esp
c0006ccd:	ff 75 d8             	pushl  -0x28(%ebp)
c0006cd0:	6a 00                	push   $0x0
c0006cd2:	50                   	push   %eax
c0006cd3:	e8 e7 39 00 00       	call   c000a6bf <Memset>
c0006cd8:	83 c4 10             	add    $0x10,%esp
c0006cdb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006cde:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006ce1:	01 d0                	add    %edx,%eax
c0006ce3:	a3 04 0f 01 c0       	mov    %eax,0xc0010f04
c0006ce8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006ceb:	a3 08 0f 01 c0       	mov    %eax,0xc0010f08
c0006cf0:	a1 04 0f 01 c0       	mov    0xc0010f04,%eax
c0006cf5:	83 ec 04             	sub    $0x4,%esp
c0006cf8:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006cfb:	6a 00                	push   $0x0
c0006cfd:	50                   	push   %eax
c0006cfe:	e8 bc 39 00 00       	call   c000a6bf <Memset>
c0006d03:	83 c4 10             	add    $0x10,%esp
c0006d06:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006d09:	a3 54 e7 00 c0       	mov    %eax,0xc000e754
c0006d0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006d11:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006d14:	01 c2                	add    %eax,%edx
c0006d16:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006d19:	01 d0                	add    %edx,%eax
c0006d1b:	a3 50 e7 00 c0       	mov    %eax,0xc000e750
c0006d20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d23:	05 00 00 10 00       	add    $0x100000,%eax
c0006d28:	a3 58 e7 00 c0       	mov    %eax,0xc000e758
c0006d2d:	a1 50 e7 00 c0       	mov    0xc000e750,%eax
c0006d32:	83 ec 04             	sub    $0x4,%esp
c0006d35:	ff 75 d8             	pushl  -0x28(%ebp)
c0006d38:	6a 00                	push   $0x0
c0006d3a:	50                   	push   %eax
c0006d3b:	e8 7f 39 00 00       	call   c000a6bf <Memset>
c0006d40:	83 c4 10             	add    $0x10,%esp
c0006d43:	90                   	nop
c0006d44:	c9                   	leave  
c0006d45:	c3                   	ret    

c0006d46 <untar>:
c0006d46:	55                   	push   %ebp
c0006d47:	89 e5                	mov    %esp,%ebp
c0006d49:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c0006d4f:	83 ec 08             	sub    $0x8,%esp
c0006d52:	6a 00                	push   $0x0
c0006d54:	ff 75 08             	pushl  0x8(%ebp)
c0006d57:	e8 c2 ea ff ff       	call   c000581e <open>
c0006d5c:	83 c4 10             	add    $0x10,%esp
c0006d5f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006d62:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006d69:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c0006d70:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006d77:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006d7e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006d82:	7e 58                	jle    c0006ddc <untar+0x96>
c0006d84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d87:	05 ff 01 00 00       	add    $0x1ff,%eax
c0006d8c:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0006d92:	85 c0                	test   %eax,%eax
c0006d94:	0f 48 c2             	cmovs  %edx,%eax
c0006d97:	c1 f8 09             	sar    $0x9,%eax
c0006d9a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006d9d:	83 ec 04             	sub    $0x4,%esp
c0006da0:	68 00 20 00 00       	push   $0x2000
c0006da5:	6a 00                	push   $0x0
c0006da7:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006dad:	50                   	push   %eax
c0006dae:	e8 0c 39 00 00       	call   c000a6bf <Memset>
c0006db3:	83 c4 10             	add    $0x10,%esp
c0006db6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006db9:	c1 e0 09             	shl    $0x9,%eax
c0006dbc:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006dbf:	83 ec 04             	sub    $0x4,%esp
c0006dc2:	50                   	push   %eax
c0006dc3:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006dc9:	50                   	push   %eax
c0006dca:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006dcd:	e8 a1 ea ff ff       	call   c0005873 <read>
c0006dd2:	83 c4 10             	add    $0x10,%esp
c0006dd5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006ddc:	83 ec 04             	sub    $0x4,%esp
c0006ddf:	68 00 20 00 00       	push   $0x2000
c0006de4:	6a 00                	push   $0x0
c0006de6:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006dec:	50                   	push   %eax
c0006ded:	e8 cd 38 00 00       	call   c000a6bf <Memset>
c0006df2:	83 c4 10             	add    $0x10,%esp
c0006df5:	83 ec 04             	sub    $0x4,%esp
c0006df8:	68 00 02 00 00       	push   $0x200
c0006dfd:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006e03:	50                   	push   %eax
c0006e04:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006e07:	e8 67 ea ff ff       	call   c0005873 <read>
c0006e0c:	83 c4 10             	add    $0x10,%esp
c0006e0f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006e12:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0006e16:	0f 84 1f 01 00 00    	je     c0006f3b <untar+0x1f5>
c0006e1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006e1f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006e22:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006e29:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006e2f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006e32:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e35:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006e38:	83 ec 08             	sub    $0x8,%esp
c0006e3b:	6a 07                	push   $0x7
c0006e3d:	ff 75 cc             	pushl  -0x34(%ebp)
c0006e40:	e8 d9 e9 ff ff       	call   c000581e <open>
c0006e45:	83 c4 10             	add    $0x10,%esp
c0006e48:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006e4b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006e52:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e55:	83 c0 7c             	add    $0x7c,%eax
c0006e58:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006e5b:	83 ec 0c             	sub    $0xc,%esp
c0006e5e:	ff 75 cc             	pushl  -0x34(%ebp)
c0006e61:	e8 92 38 00 00       	call   c000a6f8 <Strlen>
c0006e66:	83 c4 10             	add    $0x10,%esp
c0006e69:	85 c0                	test   %eax,%eax
c0006e6b:	75 16                	jne    c0006e83 <untar+0x13d>
c0006e6d:	83 ec 0c             	sub    $0xc,%esp
c0006e70:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006e73:	e8 80 38 00 00       	call   c000a6f8 <Strlen>
c0006e78:	83 c4 10             	add    $0x10,%esp
c0006e7b:	85 c0                	test   %eax,%eax
c0006e7d:	0f 84 bb 00 00 00    	je     c0006f3e <untar+0x1f8>
c0006e83:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006e86:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e89:	eb 1f                	jmp    c0006eaa <untar+0x164>
c0006e8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e8e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0006e95:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e98:	0f b6 00             	movzbl (%eax),%eax
c0006e9b:	0f be c0             	movsbl %al,%eax
c0006e9e:	83 e8 30             	sub    $0x30,%eax
c0006ea1:	01 d0                	add    %edx,%eax
c0006ea3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ea6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0006eaa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ead:	0f b6 00             	movzbl (%eax),%eax
c0006eb0:	84 c0                	test   %al,%al
c0006eb2:	75 d7                	jne    c0006e8b <untar+0x145>
c0006eb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006eb7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006eba:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0006ec1:	eb 5f                	jmp    c0006f22 <untar+0x1dc>
c0006ec3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ec6:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0006ec9:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0006ecd:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006ed0:	83 ec 04             	sub    $0x4,%esp
c0006ed3:	68 00 02 00 00       	push   $0x200
c0006ed8:	6a 00                	push   $0x0
c0006eda:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006ee0:	50                   	push   %eax
c0006ee1:	e8 d9 37 00 00       	call   c000a6bf <Memset>
c0006ee6:	83 c4 10             	add    $0x10,%esp
c0006ee9:	83 ec 04             	sub    $0x4,%esp
c0006eec:	ff 75 bc             	pushl  -0x44(%ebp)
c0006eef:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006ef5:	50                   	push   %eax
c0006ef6:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006ef9:	e8 75 e9 ff ff       	call   c0005873 <read>
c0006efe:	83 c4 10             	add    $0x10,%esp
c0006f01:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006f04:	83 ec 04             	sub    $0x4,%esp
c0006f07:	ff 75 bc             	pushl  -0x44(%ebp)
c0006f0a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0006f10:	50                   	push   %eax
c0006f11:	ff 75 c8             	pushl  -0x38(%ebp)
c0006f14:	e8 91 e9 ff ff       	call   c00058aa <write>
c0006f19:	83 c4 10             	add    $0x10,%esp
c0006f1c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006f1f:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0006f22:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006f26:	75 9b                	jne    c0006ec3 <untar+0x17d>
c0006f28:	83 ec 0c             	sub    $0xc,%esp
c0006f2b:	ff 75 c8             	pushl  -0x38(%ebp)
c0006f2e:	e8 ae e9 ff ff       	call   c00058e1 <close>
c0006f33:	83 c4 10             	add    $0x10,%esp
c0006f36:	e9 43 fe ff ff       	jmp    c0006d7e <untar+0x38>
c0006f3b:	90                   	nop
c0006f3c:	eb 01                	jmp    c0006f3f <untar+0x1f9>
c0006f3e:	90                   	nop
c0006f3f:	83 ec 0c             	sub    $0xc,%esp
c0006f42:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006f45:	e8 97 e9 ff ff       	call   c00058e1 <close>
c0006f4a:	83 c4 10             	add    $0x10,%esp
c0006f4d:	90                   	nop
c0006f4e:	c9                   	leave  
c0006f4f:	c3                   	ret    

c0006f50 <atoi>:
c0006f50:	55                   	push   %ebp
c0006f51:	89 e5                	mov    %esp,%ebp
c0006f53:	83 ec 10             	sub    $0x10,%esp
c0006f56:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f59:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f5f:	8d 50 01             	lea    0x1(%eax),%edx
c0006f62:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006f65:	c6 00 30             	movb   $0x30,(%eax)
c0006f68:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f6b:	8d 50 01             	lea    0x1(%eax),%edx
c0006f6e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006f71:	c6 00 78             	movb   $0x78,(%eax)
c0006f74:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0006f78:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006f7c:	75 0e                	jne    c0006f8c <atoi+0x3c>
c0006f7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f81:	8d 50 01             	lea    0x1(%eax),%edx
c0006f84:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006f87:	c6 00 30             	movb   $0x30,(%eax)
c0006f8a:	eb 61                	jmp    c0006fed <atoi+0x9d>
c0006f8c:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0006f93:	eb 52                	jmp    c0006fe7 <atoi+0x97>
c0006f95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f98:	8b 55 0c             	mov    0xc(%ebp),%edx
c0006f9b:	89 c1                	mov    %eax,%ecx
c0006f9d:	d3 fa                	sar    %cl,%edx
c0006f9f:	89 d0                	mov    %edx,%eax
c0006fa1:	83 e0 0f             	and    $0xf,%eax
c0006fa4:	88 45 fb             	mov    %al,-0x5(%ebp)
c0006fa7:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0006fab:	75 06                	jne    c0006fb3 <atoi+0x63>
c0006fad:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0006fb1:	74 2f                	je     c0006fe2 <atoi+0x92>
c0006fb3:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0006fb7:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0006fbb:	83 c0 30             	add    $0x30,%eax
c0006fbe:	88 45 fb             	mov    %al,-0x5(%ebp)
c0006fc1:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0006fc5:	7e 0a                	jle    c0006fd1 <atoi+0x81>
c0006fc7:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0006fcb:	83 c0 07             	add    $0x7,%eax
c0006fce:	88 45 fb             	mov    %al,-0x5(%ebp)
c0006fd1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006fd4:	8d 50 01             	lea    0x1(%eax),%edx
c0006fd7:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006fda:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0006fde:	88 10                	mov    %dl,(%eax)
c0006fe0:	eb 01                	jmp    c0006fe3 <atoi+0x93>
c0006fe2:	90                   	nop
c0006fe3:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0006fe7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006feb:	79 a8                	jns    c0006f95 <atoi+0x45>
c0006fed:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ff0:	c6 00 00             	movb   $0x0,(%eax)
c0006ff3:	90                   	nop
c0006ff4:	c9                   	leave  
c0006ff5:	c3                   	ret    

c0006ff6 <disp_int>:
c0006ff6:	55                   	push   %ebp
c0006ff7:	89 e5                	mov    %esp,%ebp
c0006ff9:	83 ec 18             	sub    $0x18,%esp
c0006ffc:	ff 75 08             	pushl  0x8(%ebp)
c0006fff:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007002:	50                   	push   %eax
c0007003:	e8 48 ff ff ff       	call   c0006f50 <atoi>
c0007008:	83 c4 08             	add    $0x8,%esp
c000700b:	83 ec 08             	sub    $0x8,%esp
c000700e:	6a 0b                	push   $0xb
c0007010:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007013:	50                   	push   %eax
c0007014:	e8 ae a5 ff ff       	call   c00015c7 <disp_str_colour>
c0007019:	83 c4 10             	add    $0x10,%esp
c000701c:	90                   	nop
c000701d:	c9                   	leave  
c000701e:	c3                   	ret    

c000701f <do_page_fault>:
c000701f:	55                   	push   %ebp
c0007020:	89 e5                	mov    %esp,%ebp
c0007022:	83 ec 28             	sub    $0x28,%esp
c0007025:	0f 20 d0             	mov    %cr2,%eax
c0007028:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000702b:	83 ec 0c             	sub    $0xc,%esp
c000702e:	68 20 9f 00 c0       	push   $0xc0009f20
c0007033:	e8 54 a5 ff ff       	call   c000158c <disp_str>
c0007038:	83 c4 10             	add    $0x10,%esp
c000703b:	83 ec 0c             	sub    $0xc,%esp
c000703e:	68 2f 9f 00 c0       	push   $0xc0009f2f
c0007043:	e8 44 a5 ff ff       	call   c000158c <disp_str>
c0007048:	83 c4 10             	add    $0x10,%esp
c000704b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000704e:	83 ec 0c             	sub    $0xc,%esp
c0007051:	50                   	push   %eax
c0007052:	e8 9f ff ff ff       	call   c0006ff6 <disp_int>
c0007057:	83 c4 10             	add    $0x10,%esp
c000705a:	83 ec 0c             	sub    $0xc,%esp
c000705d:	68 34 9f 00 c0       	push   $0xc0009f34
c0007062:	e8 25 a5 ff ff       	call   c000158c <disp_str>
c0007067:	83 c4 10             	add    $0x10,%esp
c000706a:	83 ec 0c             	sub    $0xc,%esp
c000706d:	ff 75 f4             	pushl  -0xc(%ebp)
c0007070:	e8 b8 f7 ff ff       	call   c000682d <ptr_pde>
c0007075:	83 c4 10             	add    $0x10,%esp
c0007078:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000707b:	83 ec 0c             	sub    $0xc,%esp
c000707e:	ff 75 f4             	pushl  -0xc(%ebp)
c0007081:	e8 ba f7 ff ff       	call   c0006840 <ptr_pte>
c0007086:	83 c4 10             	add    $0x10,%esp
c0007089:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000708c:	83 ec 0c             	sub    $0xc,%esp
c000708f:	68 36 9f 00 c0       	push   $0xc0009f36
c0007094:	e8 f3 a4 ff ff       	call   c000158c <disp_str>
c0007099:	83 c4 10             	add    $0x10,%esp
c000709c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000709f:	83 ec 0c             	sub    $0xc,%esp
c00070a2:	50                   	push   %eax
c00070a3:	e8 4e ff ff ff       	call   c0006ff6 <disp_int>
c00070a8:	83 c4 10             	add    $0x10,%esp
c00070ab:	83 ec 0c             	sub    $0xc,%esp
c00070ae:	68 3b 9f 00 c0       	push   $0xc0009f3b
c00070b3:	e8 d4 a4 ff ff       	call   c000158c <disp_str>
c00070b8:	83 c4 10             	add    $0x10,%esp
c00070bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070be:	8b 00                	mov    (%eax),%eax
c00070c0:	83 ec 0c             	sub    $0xc,%esp
c00070c3:	50                   	push   %eax
c00070c4:	e8 2d ff ff ff       	call   c0006ff6 <disp_int>
c00070c9:	83 c4 10             	add    $0x10,%esp
c00070cc:	83 ec 0c             	sub    $0xc,%esp
c00070cf:	68 34 9f 00 c0       	push   $0xc0009f34
c00070d4:	e8 b3 a4 ff ff       	call   c000158c <disp_str>
c00070d9:	83 c4 10             	add    $0x10,%esp
c00070dc:	83 ec 0c             	sub    $0xc,%esp
c00070df:	68 44 9f 00 c0       	push   $0xc0009f44
c00070e4:	e8 a3 a4 ff ff       	call   c000158c <disp_str>
c00070e9:	83 c4 10             	add    $0x10,%esp
c00070ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070ef:	83 ec 0c             	sub    $0xc,%esp
c00070f2:	50                   	push   %eax
c00070f3:	e8 fe fe ff ff       	call   c0006ff6 <disp_int>
c00070f8:	83 c4 10             	add    $0x10,%esp
c00070fb:	83 ec 0c             	sub    $0xc,%esp
c00070fe:	68 49 9f 00 c0       	push   $0xc0009f49
c0007103:	e8 84 a4 ff ff       	call   c000158c <disp_str>
c0007108:	83 c4 10             	add    $0x10,%esp
c000710b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000710e:	8b 00                	mov    (%eax),%eax
c0007110:	83 ec 0c             	sub    $0xc,%esp
c0007113:	50                   	push   %eax
c0007114:	e8 dd fe ff ff       	call   c0006ff6 <disp_int>
c0007119:	83 c4 10             	add    $0x10,%esp
c000711c:	83 ec 0c             	sub    $0xc,%esp
c000711f:	68 34 9f 00 c0       	push   $0xc0009f34
c0007124:	e8 63 a4 ff ff       	call   c000158c <disp_str>
c0007129:	83 c4 10             	add    $0x10,%esp
c000712c:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007133:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007136:	8b 00                	mov    (%eax),%eax
c0007138:	83 e0 01             	and    $0x1,%eax
c000713b:	85 c0                	test   %eax,%eax
c000713d:	74 09                	je     c0007148 <do_page_fault+0x129>
c000713f:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007146:	eb 07                	jmp    c000714f <do_page_fault+0x130>
c0007148:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000714f:	90                   	nop
c0007150:	c9                   	leave  
c0007151:	c3                   	ret    

c0007152 <exception_handler>:
c0007152:	55                   	push   %ebp
c0007153:	89 e5                	mov    %esp,%ebp
c0007155:	57                   	push   %edi
c0007156:	56                   	push   %esi
c0007157:	53                   	push   %ebx
c0007158:	83 ec 6c             	sub    $0x6c,%esp
c000715b:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000715e:	bb c0 a1 00 c0       	mov    $0xc000a1c0,%ebx
c0007163:	ba 13 00 00 00       	mov    $0x13,%edx
c0007168:	89 c7                	mov    %eax,%edi
c000716a:	89 de                	mov    %ebx,%esi
c000716c:	89 d1                	mov    %edx,%ecx
c000716e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007170:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007177:	eb 04                	jmp    c000717d <exception_handler+0x2b>
c0007179:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000717d:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007184:	7e f3                	jle    c0007179 <exception_handler+0x27>
c0007186:	83 ec 0c             	sub    $0xc,%esp
c0007189:	68 52 9f 00 c0       	push   $0xc0009f52
c000718e:	e8 f9 a3 ff ff       	call   c000158c <disp_str>
c0007193:	83 c4 10             	add    $0x10,%esp
c0007196:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000719d:	8b 45 08             	mov    0x8(%ebp),%eax
c00071a0:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c00071a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00071a7:	83 ec 0c             	sub    $0xc,%esp
c00071aa:	ff 75 dc             	pushl  -0x24(%ebp)
c00071ad:	e8 da a3 ff ff       	call   c000158c <disp_str>
c00071b2:	83 c4 10             	add    $0x10,%esp
c00071b5:	83 ec 0c             	sub    $0xc,%esp
c00071b8:	68 60 9f 00 c0       	push   $0xc0009f60
c00071bd:	e8 ca a3 ff ff       	call   c000158c <disp_str>
c00071c2:	83 c4 10             	add    $0x10,%esp
c00071c5:	83 ec 0c             	sub    $0xc,%esp
c00071c8:	68 63 9f 00 c0       	push   $0xc0009f63
c00071cd:	e8 ba a3 ff ff       	call   c000158c <disp_str>
c00071d2:	83 c4 10             	add    $0x10,%esp
c00071d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00071d8:	83 ec 0c             	sub    $0xc,%esp
c00071db:	50                   	push   %eax
c00071dc:	e8 15 fe ff ff       	call   c0006ff6 <disp_int>
c00071e1:	83 c4 10             	add    $0x10,%esp
c00071e4:	83 ec 0c             	sub    $0xc,%esp
c00071e7:	68 60 9f 00 c0       	push   $0xc0009f60
c00071ec:	e8 9b a3 ff ff       	call   c000158c <disp_str>
c00071f1:	83 c4 10             	add    $0x10,%esp
c00071f4:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c00071f8:	74 2f                	je     c0007229 <exception_handler+0xd7>
c00071fa:	83 ec 0c             	sub    $0xc,%esp
c00071fd:	68 6b 9f 00 c0       	push   $0xc0009f6b
c0007202:	e8 85 a3 ff ff       	call   c000158c <disp_str>
c0007207:	83 c4 10             	add    $0x10,%esp
c000720a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000720d:	83 ec 0c             	sub    $0xc,%esp
c0007210:	50                   	push   %eax
c0007211:	e8 e0 fd ff ff       	call   c0006ff6 <disp_int>
c0007216:	83 c4 10             	add    $0x10,%esp
c0007219:	83 ec 0c             	sub    $0xc,%esp
c000721c:	68 60 9f 00 c0       	push   $0xc0009f60
c0007221:	e8 66 a3 ff ff       	call   c000158c <disp_str>
c0007226:	83 c4 10             	add    $0x10,%esp
c0007229:	83 ec 0c             	sub    $0xc,%esp
c000722c:	68 75 9f 00 c0       	push   $0xc0009f75
c0007231:	e8 56 a3 ff ff       	call   c000158c <disp_str>
c0007236:	83 c4 10             	add    $0x10,%esp
c0007239:	83 ec 0c             	sub    $0xc,%esp
c000723c:	ff 75 14             	pushl  0x14(%ebp)
c000723f:	e8 b2 fd ff ff       	call   c0006ff6 <disp_int>
c0007244:	83 c4 10             	add    $0x10,%esp
c0007247:	83 ec 0c             	sub    $0xc,%esp
c000724a:	68 60 9f 00 c0       	push   $0xc0009f60
c000724f:	e8 38 a3 ff ff       	call   c000158c <disp_str>
c0007254:	83 c4 10             	add    $0x10,%esp
c0007257:	83 ec 0c             	sub    $0xc,%esp
c000725a:	68 79 9f 00 c0       	push   $0xc0009f79
c000725f:	e8 28 a3 ff ff       	call   c000158c <disp_str>
c0007264:	83 c4 10             	add    $0x10,%esp
c0007267:	8b 45 10             	mov    0x10(%ebp),%eax
c000726a:	83 ec 0c             	sub    $0xc,%esp
c000726d:	50                   	push   %eax
c000726e:	e8 83 fd ff ff       	call   c0006ff6 <disp_int>
c0007273:	83 c4 10             	add    $0x10,%esp
c0007276:	83 ec 0c             	sub    $0xc,%esp
c0007279:	68 60 9f 00 c0       	push   $0xc0009f60
c000727e:	e8 09 a3 ff ff       	call   c000158c <disp_str>
c0007283:	83 c4 10             	add    $0x10,%esp
c0007286:	83 ec 0c             	sub    $0xc,%esp
c0007289:	68 7e 9f 00 c0       	push   $0xc0009f7e
c000728e:	e8 f9 a2 ff ff       	call   c000158c <disp_str>
c0007293:	83 c4 10             	add    $0x10,%esp
c0007296:	83 ec 0c             	sub    $0xc,%esp
c0007299:	ff 75 18             	pushl  0x18(%ebp)
c000729c:	e8 55 fd ff ff       	call   c0006ff6 <disp_int>
c00072a1:	83 c4 10             	add    $0x10,%esp
c00072a4:	83 ec 0c             	sub    $0xc,%esp
c00072a7:	68 60 9f 00 c0       	push   $0xc0009f60
c00072ac:	e8 db a2 ff ff       	call   c000158c <disp_str>
c00072b1:	83 c4 10             	add    $0x10,%esp
c00072b4:	83 ec 0c             	sub    $0xc,%esp
c00072b7:	68 88 9f 00 c0       	push   $0xc0009f88
c00072bc:	e8 cb a2 ff ff       	call   c000158c <disp_str>
c00072c1:	83 c4 10             	add    $0x10,%esp
c00072c4:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c00072c8:	75 46                	jne    c0007310 <exception_handler+0x1be>
c00072ca:	0f 20 d0             	mov    %cr2,%eax
c00072cd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00072d0:	83 ec 0c             	sub    $0xc,%esp
c00072d3:	68 a7 9f 00 c0       	push   $0xc0009fa7
c00072d8:	e8 af a2 ff ff       	call   c000158c <disp_str>
c00072dd:	83 c4 10             	add    $0x10,%esp
c00072e0:	83 ec 0c             	sub    $0xc,%esp
c00072e3:	68 2f 9f 00 c0       	push   $0xc0009f2f
c00072e8:	e8 9f a2 ff ff       	call   c000158c <disp_str>
c00072ed:	83 c4 10             	add    $0x10,%esp
c00072f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00072f3:	83 ec 0c             	sub    $0xc,%esp
c00072f6:	50                   	push   %eax
c00072f7:	e8 fa fc ff ff       	call   c0006ff6 <disp_int>
c00072fc:	83 c4 10             	add    $0x10,%esp
c00072ff:	83 ec 0c             	sub    $0xc,%esp
c0007302:	68 34 9f 00 c0       	push   $0xc0009f34
c0007307:	e8 80 a2 ff ff       	call   c000158c <disp_str>
c000730c:	83 c4 10             	add    $0x10,%esp
c000730f:	90                   	nop
c0007310:	90                   	nop
c0007311:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007314:	5b                   	pop    %ebx
c0007315:	5e                   	pop    %esi
c0007316:	5f                   	pop    %edi
c0007317:	5d                   	pop    %ebp
c0007318:	c3                   	ret    

c0007319 <exception_handler2>:
c0007319:	55                   	push   %ebp
c000731a:	89 e5                	mov    %esp,%ebp
c000731c:	57                   	push   %edi
c000731d:	56                   	push   %esi
c000731e:	53                   	push   %ebx
c000731f:	83 ec 6c             	sub    $0x6c,%esp
c0007322:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007325:	bb c0 a1 00 c0       	mov    $0xc000a1c0,%ebx
c000732a:	ba 13 00 00 00       	mov    $0x13,%edx
c000732f:	89 c7                	mov    %eax,%edi
c0007331:	89 de                	mov    %ebx,%esi
c0007333:	89 d1                	mov    %edx,%ecx
c0007335:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007337:	c7 05 5c e7 00 c0 6a 	movl   $0x2e6a,0xc000e75c
c000733e:	2e 00 00 
c0007341:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007348:	eb 14                	jmp    c000735e <exception_handler2+0x45>
c000734a:	83 ec 0c             	sub    $0xc,%esp
c000734d:	68 0c a2 00 c0       	push   $0xc000a20c
c0007352:	e8 35 a2 ff ff       	call   c000158c <disp_str>
c0007357:	83 c4 10             	add    $0x10,%esp
c000735a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000735e:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007365:	7e e3                	jle    c000734a <exception_handler2+0x31>
c0007367:	c7 05 5c e7 00 c0 6a 	movl   $0x2e6a,0xc000e75c
c000736e:	2e 00 00 
c0007371:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007378:	8b 45 08             	mov    0x8(%ebp),%eax
c000737b:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c000737f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007382:	83 ec 08             	sub    $0x8,%esp
c0007385:	ff 75 e0             	pushl  -0x20(%ebp)
c0007388:	ff 75 dc             	pushl  -0x24(%ebp)
c000738b:	e8 37 a2 ff ff       	call   c00015c7 <disp_str_colour>
c0007390:	83 c4 10             	add    $0x10,%esp
c0007393:	83 ec 0c             	sub    $0xc,%esp
c0007396:	68 60 9f 00 c0       	push   $0xc0009f60
c000739b:	e8 ec a1 ff ff       	call   c000158c <disp_str>
c00073a0:	83 c4 10             	add    $0x10,%esp
c00073a3:	83 ec 08             	sub    $0x8,%esp
c00073a6:	ff 75 e0             	pushl  -0x20(%ebp)
c00073a9:	68 63 9f 00 c0       	push   $0xc0009f63
c00073ae:	e8 14 a2 ff ff       	call   c00015c7 <disp_str_colour>
c00073b3:	83 c4 10             	add    $0x10,%esp
c00073b6:	83 ec 0c             	sub    $0xc,%esp
c00073b9:	ff 75 08             	pushl  0x8(%ebp)
c00073bc:	e8 35 fc ff ff       	call   c0006ff6 <disp_int>
c00073c1:	83 c4 10             	add    $0x10,%esp
c00073c4:	83 ec 0c             	sub    $0xc,%esp
c00073c7:	68 60 9f 00 c0       	push   $0xc0009f60
c00073cc:	e8 bb a1 ff ff       	call   c000158c <disp_str>
c00073d1:	83 c4 10             	add    $0x10,%esp
c00073d4:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c00073d8:	74 44                	je     c000741e <exception_handler2+0x105>
c00073da:	83 ec 08             	sub    $0x8,%esp
c00073dd:	ff 75 e0             	pushl  -0x20(%ebp)
c00073e0:	68 6b 9f 00 c0       	push   $0xc0009f6b
c00073e5:	e8 dd a1 ff ff       	call   c00015c7 <disp_str_colour>
c00073ea:	83 c4 10             	add    $0x10,%esp
c00073ed:	83 ec 08             	sub    $0x8,%esp
c00073f0:	ff 75 e0             	pushl  -0x20(%ebp)
c00073f3:	68 6b 9f 00 c0       	push   $0xc0009f6b
c00073f8:	e8 ca a1 ff ff       	call   c00015c7 <disp_str_colour>
c00073fd:	83 c4 10             	add    $0x10,%esp
c0007400:	83 ec 0c             	sub    $0xc,%esp
c0007403:	ff 75 0c             	pushl  0xc(%ebp)
c0007406:	e8 eb fb ff ff       	call   c0006ff6 <disp_int>
c000740b:	83 c4 10             	add    $0x10,%esp
c000740e:	83 ec 0c             	sub    $0xc,%esp
c0007411:	68 60 9f 00 c0       	push   $0xc0009f60
c0007416:	e8 71 a1 ff ff       	call   c000158c <disp_str>
c000741b:	83 c4 10             	add    $0x10,%esp
c000741e:	83 ec 08             	sub    $0x8,%esp
c0007421:	ff 75 e0             	pushl  -0x20(%ebp)
c0007424:	68 75 9f 00 c0       	push   $0xc0009f75
c0007429:	e8 99 a1 ff ff       	call   c00015c7 <disp_str_colour>
c000742e:	83 c4 10             	add    $0x10,%esp
c0007431:	83 ec 0c             	sub    $0xc,%esp
c0007434:	ff 75 14             	pushl  0x14(%ebp)
c0007437:	e8 ba fb ff ff       	call   c0006ff6 <disp_int>
c000743c:	83 c4 10             	add    $0x10,%esp
c000743f:	83 ec 0c             	sub    $0xc,%esp
c0007442:	68 60 9f 00 c0       	push   $0xc0009f60
c0007447:	e8 40 a1 ff ff       	call   c000158c <disp_str>
c000744c:	83 c4 10             	add    $0x10,%esp
c000744f:	83 ec 08             	sub    $0x8,%esp
c0007452:	ff 75 e0             	pushl  -0x20(%ebp)
c0007455:	68 79 9f 00 c0       	push   $0xc0009f79
c000745a:	e8 68 a1 ff ff       	call   c00015c7 <disp_str_colour>
c000745f:	83 c4 10             	add    $0x10,%esp
c0007462:	83 ec 0c             	sub    $0xc,%esp
c0007465:	ff 75 10             	pushl  0x10(%ebp)
c0007468:	e8 89 fb ff ff       	call   c0006ff6 <disp_int>
c000746d:	83 c4 10             	add    $0x10,%esp
c0007470:	83 ec 0c             	sub    $0xc,%esp
c0007473:	68 60 9f 00 c0       	push   $0xc0009f60
c0007478:	e8 0f a1 ff ff       	call   c000158c <disp_str>
c000747d:	83 c4 10             	add    $0x10,%esp
c0007480:	83 ec 08             	sub    $0x8,%esp
c0007483:	ff 75 e0             	pushl  -0x20(%ebp)
c0007486:	68 7e 9f 00 c0       	push   $0xc0009f7e
c000748b:	e8 37 a1 ff ff       	call   c00015c7 <disp_str_colour>
c0007490:	83 c4 10             	add    $0x10,%esp
c0007493:	83 ec 0c             	sub    $0xc,%esp
c0007496:	ff 75 18             	pushl  0x18(%ebp)
c0007499:	e8 58 fb ff ff       	call   c0006ff6 <disp_int>
c000749e:	83 c4 10             	add    $0x10,%esp
c00074a1:	83 ec 0c             	sub    $0xc,%esp
c00074a4:	68 60 9f 00 c0       	push   $0xc0009f60
c00074a9:	e8 de a0 ff ff       	call   c000158c <disp_str>
c00074ae:	83 c4 10             	add    $0x10,%esp
c00074b1:	90                   	nop
c00074b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00074b5:	5b                   	pop    %ebx
c00074b6:	5e                   	pop    %esi
c00074b7:	5f                   	pop    %edi
c00074b8:	5d                   	pop    %ebp
c00074b9:	c3                   	ret    

c00074ba <init_internal_interrupt>:
c00074ba:	55                   	push   %ebp
c00074bb:	89 e5                	mov    %esp,%ebp
c00074bd:	83 ec 08             	sub    $0x8,%esp
c00074c0:	6a 0e                	push   $0xe
c00074c2:	6a 08                	push   $0x8
c00074c4:	68 03 16 00 c0       	push   $0xc0001603
c00074c9:	6a 00                	push   $0x0
c00074cb:	e8 1f d5 ff ff       	call   c00049ef <InitInterruptDesc>
c00074d0:	83 c4 10             	add    $0x10,%esp
c00074d3:	6a 0e                	push   $0xe
c00074d5:	6a 08                	push   $0x8
c00074d7:	68 09 16 00 c0       	push   $0xc0001609
c00074dc:	6a 01                	push   $0x1
c00074de:	e8 0c d5 ff ff       	call   c00049ef <InitInterruptDesc>
c00074e3:	83 c4 10             	add    $0x10,%esp
c00074e6:	6a 0e                	push   $0xe
c00074e8:	6a 08                	push   $0x8
c00074ea:	68 0f 16 00 c0       	push   $0xc000160f
c00074ef:	6a 02                	push   $0x2
c00074f1:	e8 f9 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c00074f6:	83 c4 10             	add    $0x10,%esp
c00074f9:	6a 0e                	push   $0xe
c00074fb:	6a 08                	push   $0x8
c00074fd:	68 15 16 00 c0       	push   $0xc0001615
c0007502:	6a 03                	push   $0x3
c0007504:	e8 e6 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c0007509:	83 c4 10             	add    $0x10,%esp
c000750c:	6a 0e                	push   $0xe
c000750e:	6a 08                	push   $0x8
c0007510:	68 1b 16 00 c0       	push   $0xc000161b
c0007515:	6a 04                	push   $0x4
c0007517:	e8 d3 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c000751c:	83 c4 10             	add    $0x10,%esp
c000751f:	6a 0e                	push   $0xe
c0007521:	6a 08                	push   $0x8
c0007523:	68 21 16 00 c0       	push   $0xc0001621
c0007528:	6a 05                	push   $0x5
c000752a:	e8 c0 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c000752f:	83 c4 10             	add    $0x10,%esp
c0007532:	6a 0e                	push   $0xe
c0007534:	6a 08                	push   $0x8
c0007536:	68 27 16 00 c0       	push   $0xc0001627
c000753b:	6a 06                	push   $0x6
c000753d:	e8 ad d4 ff ff       	call   c00049ef <InitInterruptDesc>
c0007542:	83 c4 10             	add    $0x10,%esp
c0007545:	6a 0e                	push   $0xe
c0007547:	6a 08                	push   $0x8
c0007549:	68 2d 16 00 c0       	push   $0xc000162d
c000754e:	6a 07                	push   $0x7
c0007550:	e8 9a d4 ff ff       	call   c00049ef <InitInterruptDesc>
c0007555:	83 c4 10             	add    $0x10,%esp
c0007558:	6a 0e                	push   $0xe
c000755a:	6a 08                	push   $0x8
c000755c:	68 33 16 00 c0       	push   $0xc0001633
c0007561:	6a 08                	push   $0x8
c0007563:	e8 87 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c0007568:	83 c4 10             	add    $0x10,%esp
c000756b:	6a 0e                	push   $0xe
c000756d:	6a 08                	push   $0x8
c000756f:	68 37 16 00 c0       	push   $0xc0001637
c0007574:	6a 09                	push   $0x9
c0007576:	e8 74 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c000757b:	83 c4 10             	add    $0x10,%esp
c000757e:	6a 0e                	push   $0xe
c0007580:	6a 08                	push   $0x8
c0007582:	68 3d 16 00 c0       	push   $0xc000163d
c0007587:	6a 0a                	push   $0xa
c0007589:	e8 61 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c000758e:	83 c4 10             	add    $0x10,%esp
c0007591:	6a 0e                	push   $0xe
c0007593:	6a 08                	push   $0x8
c0007595:	68 41 16 00 c0       	push   $0xc0001641
c000759a:	6a 0b                	push   $0xb
c000759c:	e8 4e d4 ff ff       	call   c00049ef <InitInterruptDesc>
c00075a1:	83 c4 10             	add    $0x10,%esp
c00075a4:	6a 0e                	push   $0xe
c00075a6:	6a 08                	push   $0x8
c00075a8:	68 45 16 00 c0       	push   $0xc0001645
c00075ad:	6a 0c                	push   $0xc
c00075af:	e8 3b d4 ff ff       	call   c00049ef <InitInterruptDesc>
c00075b4:	83 c4 10             	add    $0x10,%esp
c00075b7:	6a 0e                	push   $0xe
c00075b9:	6a 08                	push   $0x8
c00075bb:	68 49 16 00 c0       	push   $0xc0001649
c00075c0:	6a 0d                	push   $0xd
c00075c2:	e8 28 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c00075c7:	83 c4 10             	add    $0x10,%esp
c00075ca:	6a 0e                	push   $0xe
c00075cc:	6a 08                	push   $0x8
c00075ce:	68 4d 16 00 c0       	push   $0xc000164d
c00075d3:	6a 0e                	push   $0xe
c00075d5:	e8 15 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c00075da:	83 c4 10             	add    $0x10,%esp
c00075dd:	6a 0e                	push   $0xe
c00075df:	6a 08                	push   $0x8
c00075e1:	68 51 16 00 c0       	push   $0xc0001651
c00075e6:	6a 10                	push   $0x10
c00075e8:	e8 02 d4 ff ff       	call   c00049ef <InitInterruptDesc>
c00075ed:	83 c4 10             	add    $0x10,%esp
c00075f0:	6a 0e                	push   $0xe
c00075f2:	6a 08                	push   $0x8
c00075f4:	68 57 16 00 c0       	push   $0xc0001657
c00075f9:	6a 11                	push   $0x11
c00075fb:	e8 ef d3 ff ff       	call   c00049ef <InitInterruptDesc>
c0007600:	83 c4 10             	add    $0x10,%esp
c0007603:	6a 0e                	push   $0xe
c0007605:	6a 08                	push   $0x8
c0007607:	68 5b 16 00 c0       	push   $0xc000165b
c000760c:	6a 12                	push   $0x12
c000760e:	e8 dc d3 ff ff       	call   c00049ef <InitInterruptDesc>
c0007613:	83 c4 10             	add    $0x10,%esp
c0007616:	6a 0e                	push   $0xe
c0007618:	6a 0e                	push   $0xe
c000761a:	68 26 17 00 c0       	push   $0xc0001726
c000761f:	68 90 00 00 00       	push   $0x90
c0007624:	e8 c6 d3 ff ff       	call   c00049ef <InitInterruptDesc>
c0007629:	83 c4 10             	add    $0x10,%esp
c000762c:	90                   	nop
c000762d:	c9                   	leave  
c000762e:	c3                   	ret    

c000762f <test>:
c000762f:	55                   	push   %ebp
c0007630:	89 e5                	mov    %esp,%ebp
c0007632:	83 ec 08             	sub    $0x8,%esp
c0007635:	83 ec 0c             	sub    $0xc,%esp
c0007638:	68 0e a2 00 c0       	push   $0xc000a20e
c000763d:	e8 4a 9f ff ff       	call   c000158c <disp_str>
c0007642:	83 c4 10             	add    $0x10,%esp
c0007645:	83 ec 0c             	sub    $0xc,%esp
c0007648:	6a 06                	push   $0x6
c000764a:	e8 a7 f9 ff ff       	call   c0006ff6 <disp_int>
c000764f:	83 c4 10             	add    $0x10,%esp
c0007652:	83 ec 0c             	sub    $0xc,%esp
c0007655:	68 34 9f 00 c0       	push   $0xc0009f34
c000765a:	e8 2d 9f ff ff       	call   c000158c <disp_str>
c000765f:	83 c4 10             	add    $0x10,%esp
c0007662:	90                   	nop
c0007663:	c9                   	leave  
c0007664:	c3                   	ret    

c0007665 <disp_str_colour3>:
c0007665:	55                   	push   %ebp
c0007666:	89 e5                	mov    %esp,%ebp
c0007668:	90                   	nop
c0007669:	5d                   	pop    %ebp
c000766a:	c3                   	ret    

c000766b <spurious_irq>:
c000766b:	55                   	push   %ebp
c000766c:	89 e5                	mov    %esp,%ebp
c000766e:	83 ec 08             	sub    $0x8,%esp
c0007671:	83 ec 08             	sub    $0x8,%esp
c0007674:	6a 0b                	push   $0xb
c0007676:	68 10 a2 00 c0       	push   $0xc000a210
c000767b:	e8 47 9f ff ff       	call   c00015c7 <disp_str_colour>
c0007680:	83 c4 10             	add    $0x10,%esp
c0007683:	83 ec 0c             	sub    $0xc,%esp
c0007686:	ff 75 08             	pushl  0x8(%ebp)
c0007689:	e8 68 f9 ff ff       	call   c0006ff6 <disp_int>
c000768e:	83 c4 10             	add    $0x10,%esp
c0007691:	a1 00 0f 01 c0       	mov    0xc0010f00,%eax
c0007696:	83 c0 01             	add    $0x1,%eax
c0007699:	a3 00 0f 01 c0       	mov    %eax,0xc0010f00
c000769e:	83 ec 0c             	sub    $0xc,%esp
c00076a1:	68 37 a2 00 c0       	push   $0xc000a237
c00076a6:	e8 e1 9e ff ff       	call   c000158c <disp_str>
c00076ab:	83 c4 10             	add    $0x10,%esp
c00076ae:	a1 00 0f 01 c0       	mov    0xc0010f00,%eax
c00076b3:	83 ec 0c             	sub    $0xc,%esp
c00076b6:	50                   	push   %eax
c00076b7:	e8 3a f9 ff ff       	call   c0006ff6 <disp_int>
c00076bc:	83 c4 10             	add    $0x10,%esp
c00076bf:	83 ec 0c             	sub    $0xc,%esp
c00076c2:	68 39 a2 00 c0       	push   $0xc000a239
c00076c7:	e8 c0 9e ff ff       	call   c000158c <disp_str>
c00076cc:	83 c4 10             	add    $0x10,%esp
c00076cf:	83 ec 08             	sub    $0x8,%esp
c00076d2:	6a 0c                	push   $0xc
c00076d4:	68 3c a2 00 c0       	push   $0xc000a23c
c00076d9:	e8 e9 9e ff ff       	call   c00015c7 <disp_str_colour>
c00076de:	83 c4 10             	add    $0x10,%esp
c00076e1:	90                   	nop
c00076e2:	c9                   	leave  
c00076e3:	c3                   	ret    

c00076e4 <init_keyboard>:
c00076e4:	55                   	push   %ebp
c00076e5:	89 e5                	mov    %esp,%ebp
c00076e7:	83 ec 18             	sub    $0x18,%esp
c00076ea:	83 ec 04             	sub    $0x4,%esp
c00076ed:	68 00 02 00 00       	push   $0x200
c00076f2:	6a 00                	push   $0x0
c00076f4:	68 ac eb 00 c0       	push   $0xc000ebac
c00076f9:	e8 c1 2f 00 00       	call   c000a6bf <Memset>
c00076fe:	83 c4 10             	add    $0x10,%esp
c0007701:	c7 05 a0 eb 00 c0 ac 	movl   $0xc000ebac,0xc000eba0
c0007708:	eb 00 c0 
c000770b:	a1 a0 eb 00 c0       	mov    0xc000eba0,%eax
c0007710:	a3 a4 eb 00 c0       	mov    %eax,0xc000eba4
c0007715:	c7 05 a8 eb 00 c0 00 	movl   $0x0,0xc000eba8
c000771c:	00 00 00 
c000771f:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c0007726:	00 00 00 
c0007729:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007730:	eb 04                	jmp    c0007736 <init_keyboard+0x52>
c0007732:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007736:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000773d:	7e f3                	jle    c0007732 <init_keyboard+0x4e>
c000773f:	c7 05 5c e7 00 c0 00 	movl   $0x0,0xc000e75c
c0007746:	00 00 00 
c0007749:	e8 2a df ff ff       	call   c0005678 <init_keyboard_handler>
c000774e:	90                   	nop
c000774f:	c9                   	leave  
c0007750:	c3                   	ret    

c0007751 <init2>:
c0007751:	55                   	push   %ebp
c0007752:	89 e5                	mov    %esp,%ebp
c0007754:	83 ec 08             	sub    $0x8,%esp
c0007757:	83 ec 0c             	sub    $0xc,%esp
c000775a:	68 61 a2 00 c0       	push   $0xc000a261
c000775f:	e8 28 9e ff ff       	call   c000158c <disp_str>
c0007764:	83 c4 10             	add    $0x10,%esp
c0007767:	e8 78 ff ff ff       	call   c00076e4 <init_keyboard>
c000776c:	83 ec 0c             	sub    $0xc,%esp
c000776f:	68 00 00 00 02       	push   $0x2000000
c0007774:	e8 ab f4 ff ff       	call   c0006c24 <init_memory>
c0007779:	83 c4 10             	add    $0x10,%esp
c000777c:	90                   	nop
c000777d:	c9                   	leave  
c000777e:	c3                   	ret    

c000777f <u_thread_a>:
c000777f:	55                   	push   %ebp
c0007780:	89 e5                	mov    %esp,%ebp
c0007782:	83 ec 08             	sub    $0x8,%esp
c0007785:	83 ec 0c             	sub    $0xc,%esp
c0007788:	68 67 a2 00 c0       	push   $0xc000a267
c000778d:	e8 fa 9d ff ff       	call   c000158c <disp_str>
c0007792:	83 c4 10             	add    $0x10,%esp
c0007795:	eb fe                	jmp    c0007795 <u_thread_a+0x16>

c0007797 <kernel_main2>:
c0007797:	55                   	push   %ebp
c0007798:	89 e5                	mov    %esp,%ebp
c000779a:	57                   	push   %edi
c000779b:	56                   	push   %esi
c000779c:	53                   	push   %ebx
c000779d:	83 ec 3c             	sub    $0x3c,%esp
c00077a0:	83 ec 0c             	sub    $0xc,%esp
c00077a3:	68 75 a2 00 c0       	push   $0xc000a275
c00077a8:	e8 df 9d ff ff       	call   c000158c <disp_str>
c00077ad:	83 c4 10             	add    $0x10,%esp
c00077b0:	e8 9a a1 ff ff       	call   c000194f <init>
c00077b5:	c7 05 00 0f 01 c0 00 	movl   $0x0,0xc0010f00
c00077bc:	00 00 00 
c00077bf:	c7 05 dc 06 01 c0 00 	movl   $0x0,0xc00106dc
c00077c6:	00 00 00 
c00077c9:	c7 05 60 e7 00 c0 00 	movl   $0x0,0xc000e760
c00077d0:	00 00 00 
c00077d3:	c7 45 dc e0 21 08 c0 	movl   $0xc00821e0,-0x24(%ebp)
c00077da:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00077e1:	e9 d4 01 00 00       	jmp    c00079ba <kernel_main2+0x223>
c00077e6:	83 ec 08             	sub    $0x8,%esp
c00077e9:	6a 00                	push   $0x0
c00077eb:	6a 01                	push   $0x1
c00077ed:	e8 35 f1 ff ff       	call   c0006927 <alloc_memory>
c00077f2:	83 c4 10             	add    $0x10,%esp
c00077f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00077f8:	83 ec 04             	sub    $0x4,%esp
c00077fb:	68 b0 00 00 00       	push   $0xb0
c0007800:	6a 00                	push   $0x0
c0007802:	ff 75 d8             	pushl  -0x28(%ebp)
c0007805:	e8 b5 2e 00 00       	call   c000a6bf <Memset>
c000780a:	83 c4 10             	add    $0x10,%esp
c000780d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007810:	05 00 10 00 00       	add    $0x1000,%eax
c0007815:	89 c2                	mov    %eax,%edx
c0007817:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000781a:	89 10                	mov    %edx,(%eax)
c000781c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000781f:	66 c7 40 0c 00 00    	movw   $0x0,0xc(%eax)
c0007825:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007828:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000782b:	89 50 20             	mov    %edx,0x20(%eax)
c000782e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007831:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0007838:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000783c:	7e 0c                	jle    c000784a <kernel_main2+0xb3>
c000783e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007841:	c6 40 48 ff          	movb   $0xff,0x48(%eax)
c0007845:	e9 6c 01 00 00       	jmp    c00079b6 <kernel_main2+0x21f>
c000784a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000784d:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c0007851:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c0007855:	7f 73                	jg     c00078ca <kernel_main2+0x133>
c0007857:	c7 45 e4 40 d0 00 c0 	movl   $0xc000d040,-0x1c(%ebp)
c000785e:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0007865:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c000786c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000786f:	8b 00                	mov    (%eax),%eax
c0007871:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0007874:	89 c2                	mov    %eax,%edx
c0007876:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007879:	89 10                	mov    %edx,(%eax)
c000787b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000787e:	8b 00                	mov    (%eax),%eax
c0007880:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0007883:	89 c2                	mov    %eax,%edx
c0007885:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007888:	89 10                	mov    %edx,(%eax)
c000788a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000788d:	8b 00                	mov    (%eax),%eax
c000788f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007892:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007895:	8b 50 14             	mov    0x14(%eax),%edx
c0007898:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000789b:	89 50 24             	mov    %edx,0x24(%eax)
c000789e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00078a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00078a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00078aa:	8b 10                	mov    (%eax),%edx
c00078ac:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00078af:	89 50 04             	mov    %edx,0x4(%eax)
c00078b2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00078b5:	8b 50 04             	mov    0x4(%eax),%edx
c00078b8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00078bb:	89 50 08             	mov    %edx,0x8(%eax)
c00078be:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00078c1:	8b 50 08             	mov    0x8(%eax),%edx
c00078c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00078c7:	89 50 0c             	mov    %edx,0xc(%eax)
c00078ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00078cd:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00078d0:	83 c2 30             	add    $0x30,%edx
c00078d3:	83 ec 08             	sub    $0x8,%esp
c00078d6:	50                   	push   %eax
c00078d7:	52                   	push   %edx
c00078d8:	e8 01 2e 00 00       	call   c000a6de <Strcpy>
c00078dd:	83 c4 10             	add    $0x10,%esp
c00078e0:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00078e4:	83 c8 04             	or     $0x4,%eax
c00078e7:	0f b6 c0             	movzbl %al,%eax
c00078ea:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c00078ee:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00078f2:	83 c8 0c             	or     $0xc,%eax
c00078f5:	0f b6 c0             	movzbl %al,%eax
c00078f8:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c00078fc:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c0007900:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007903:	89 90 a0 00 00 00    	mov    %edx,0xa0(%eax)
c0007909:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000790d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007910:	89 50 78             	mov    %edx,0x78(%eax)
c0007913:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0007917:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000791a:	89 50 70             	mov    %edx,0x70(%eax)
c000791d:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0007921:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007924:	89 50 74             	mov    %edx,0x74(%eax)
c0007927:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000792b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000792e:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
c0007934:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007937:	c7 40 6c 39 00 00 00 	movl   $0x39,0x6c(%eax)
c000793e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007941:	8b 50 14             	mov    0x14(%eax),%edx
c0007944:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007947:	89 90 9c 00 00 00    	mov    %edx,0x9c(%eax)
c000794d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007950:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0007953:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
c0007959:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000795c:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
c0007963:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007966:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c000796d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007970:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c0007977:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000797a:	c7 40 54 1d 00 00 00 	movl   $0x1d,0x54(%eax)
c0007981:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007984:	c7 40 50 1d 00 00 00 	movl   $0x1d,0x50(%eax)
c000798b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000798e:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c0007995:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007998:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000799e:	8d 90 e0 21 08 c0    	lea    -0x3ff7de20(%eax),%edx
c00079a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079a7:	89 c3                	mov    %eax,%ebx
c00079a9:	b8 2c 00 00 00       	mov    $0x2c,%eax
c00079ae:	89 d7                	mov    %edx,%edi
c00079b0:	89 de                	mov    %ebx,%esi
c00079b2:	89 c1                	mov    %eax,%ecx
c00079b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00079b6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00079ba:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00079be:	0f 8e 22 fe ff ff    	jle    c00077e6 <kernel_main2+0x4f>
c00079c4:	c7 05 80 eb 00 c0 e0 	movl   $0xc00821e0,0xc000eb80
c00079cb:	21 08 c0 
c00079ce:	eb fe                	jmp    c00079ce <kernel_main2+0x237>

c00079d0 <TestFS>:
c00079d0:	55                   	push   %ebp
c00079d1:	89 e5                	mov    %esp,%ebp
c00079d3:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
c00079d9:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c00079e0:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c00079e7:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c00079ed:	83 ec 08             	sub    $0x8,%esp
c00079f0:	6a 02                	push   $0x2
c00079f2:	8d 45 be             	lea    -0x42(%ebp),%eax
c00079f5:	50                   	push   %eax
c00079f6:	e8 23 de ff ff       	call   c000581e <open>
c00079fb:	83 c4 10             	add    $0x10,%esp
c00079fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007a01:	83 ec 08             	sub    $0x8,%esp
c0007a04:	6a 02                	push   $0x2
c0007a06:	8d 45 be             	lea    -0x42(%ebp),%eax
c0007a09:	50                   	push   %eax
c0007a0a:	e8 0f de ff ff       	call   c000581e <open>
c0007a0f:	83 c4 10             	add    $0x10,%esp
c0007a12:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007a15:	83 ec 0c             	sub    $0xc,%esp
c0007a18:	68 81 a2 00 c0       	push   $0xc000a281
c0007a1d:	e8 ed 0d 00 00       	call   c000880f <Printf>
c0007a22:	83 c4 10             	add    $0x10,%esp
c0007a25:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0007a2c:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0007a30:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0007a37:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0007a3b:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0007a42:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0007a49:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0007a4f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007a56:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0007a5a:	75 fa                	jne    c0007a56 <TestFS+0x86>
c0007a5c:	83 ec 08             	sub    $0x8,%esp
c0007a5f:	6a 07                	push   $0x7
c0007a61:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0007a64:	50                   	push   %eax
c0007a65:	e8 b4 dd ff ff       	call   c000581e <open>
c0007a6a:	83 c4 10             	add    $0x10,%esp
c0007a6d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007a70:	83 ec 08             	sub    $0x8,%esp
c0007a73:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007a76:	68 93 a2 00 c0       	push   $0xc000a293
c0007a7b:	e8 8f 0d 00 00       	call   c000880f <Printf>
c0007a80:	83 c4 10             	add    $0x10,%esp
c0007a83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007a8a:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0007a91:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0007a98:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0007a9f:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0007aa6:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0007aad:	83 ec 0c             	sub    $0xc,%esp
c0007ab0:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0007ab3:	50                   	push   %eax
c0007ab4:	e8 3f 2c 00 00       	call   c000a6f8 <Strlen>
c0007ab9:	83 c4 10             	add    $0x10,%esp
c0007abc:	83 ec 04             	sub    $0x4,%esp
c0007abf:	50                   	push   %eax
c0007ac0:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0007ac3:	50                   	push   %eax
c0007ac4:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007ac7:	e8 de dd ff ff       	call   c00058aa <write>
c0007acc:	83 c4 10             	add    $0x10,%esp
c0007acf:	83 ec 04             	sub    $0x4,%esp
c0007ad2:	6a 14                	push   $0x14
c0007ad4:	6a 00                	push   $0x0
c0007ad6:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0007ad9:	50                   	push   %eax
c0007ada:	e8 e0 2b 00 00       	call   c000a6bf <Memset>
c0007adf:	83 c4 10             	add    $0x10,%esp
c0007ae2:	83 ec 04             	sub    $0x4,%esp
c0007ae5:	6a 12                	push   $0x12
c0007ae7:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0007aea:	50                   	push   %eax
c0007aeb:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007aee:	e8 80 dd ff ff       	call   c0005873 <read>
c0007af3:	83 c4 10             	add    $0x10,%esp
c0007af6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007af9:	83 ec 08             	sub    $0x8,%esp
c0007afc:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0007aff:	50                   	push   %eax
c0007b00:	68 9c a2 00 c0       	push   $0xc000a29c
c0007b05:	e8 05 0d 00 00       	call   c000880f <Printf>
c0007b0a:	83 c4 10             	add    $0x10,%esp
c0007b0d:	83 ec 0c             	sub    $0xc,%esp
c0007b10:	6a 0a                	push   $0xa
c0007b12:	e8 97 0b 00 00       	call   c00086ae <delay>
c0007b17:	83 c4 10             	add    $0x10,%esp
c0007b1a:	83 ec 08             	sub    $0x8,%esp
c0007b1d:	6a 07                	push   $0x7
c0007b1f:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0007b22:	50                   	push   %eax
c0007b23:	e8 f6 dc ff ff       	call   c000581e <open>
c0007b28:	83 c4 10             	add    $0x10,%esp
c0007b2b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007b2e:	83 ec 08             	sub    $0x8,%esp
c0007b31:	ff 75 dc             	pushl  -0x24(%ebp)
c0007b34:	68 a7 a2 00 c0       	push   $0xc000a2a7
c0007b39:	e8 d1 0c 00 00       	call   c000880f <Printf>
c0007b3e:	83 c4 10             	add    $0x10,%esp
c0007b41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b48:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0007b4f:	67 3a 68 
c0007b52:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0007b59:	77 20 61 
c0007b5c:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0007b63:	65 20 79 
c0007b66:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0007b6d:	75 3f 00 
c0007b70:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0007b77:	00 00 00 
c0007b7a:	83 ec 0c             	sub    $0xc,%esp
c0007b7d:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0007b83:	50                   	push   %eax
c0007b84:	e8 6f 2b 00 00       	call   c000a6f8 <Strlen>
c0007b89:	83 c4 10             	add    $0x10,%esp
c0007b8c:	83 ec 04             	sub    $0x4,%esp
c0007b8f:	50                   	push   %eax
c0007b90:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0007b96:	50                   	push   %eax
c0007b97:	ff 75 dc             	pushl  -0x24(%ebp)
c0007b9a:	e8 0b dd ff ff       	call   c00058aa <write>
c0007b9f:	83 c4 10             	add    $0x10,%esp
c0007ba2:	83 ec 04             	sub    $0x4,%esp
c0007ba5:	6a 14                	push   $0x14
c0007ba7:	6a 00                	push   $0x0
c0007ba9:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0007baf:	50                   	push   %eax
c0007bb0:	e8 0a 2b 00 00       	call   c000a6bf <Memset>
c0007bb5:	83 c4 10             	add    $0x10,%esp
c0007bb8:	83 ec 04             	sub    $0x4,%esp
c0007bbb:	6a 12                	push   $0x12
c0007bbd:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0007bc3:	50                   	push   %eax
c0007bc4:	ff 75 dc             	pushl  -0x24(%ebp)
c0007bc7:	e8 a7 dc ff ff       	call   c0005873 <read>
c0007bcc:	83 c4 10             	add    $0x10,%esp
c0007bcf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007bd2:	83 ec 08             	sub    $0x8,%esp
c0007bd5:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0007bdb:	50                   	push   %eax
c0007bdc:	68 b1 a2 00 c0       	push   $0xc000a2b1
c0007be1:	e8 29 0c 00 00       	call   c000880f <Printf>
c0007be6:	83 c4 10             	add    $0x10,%esp
c0007be9:	83 ec 08             	sub    $0x8,%esp
c0007bec:	6a 07                	push   $0x7
c0007bee:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0007bf1:	50                   	push   %eax
c0007bf2:	e8 27 dc ff ff       	call   c000581e <open>
c0007bf7:	83 c4 10             	add    $0x10,%esp
c0007bfa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007bfd:	83 ec 08             	sub    $0x8,%esp
c0007c00:	ff 75 dc             	pushl  -0x24(%ebp)
c0007c03:	68 a7 a2 00 c0       	push   $0xc000a2a7
c0007c08:	e8 02 0c 00 00       	call   c000880f <Printf>
c0007c0d:	83 c4 10             	add    $0x10,%esp
c0007c10:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c17:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0007c1e:	20 77 69 
c0007c21:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0007c28:	6c 20 73 
c0007c2b:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0007c32:	63 63 65 
c0007c35:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0007c3c:	73 20 61 
c0007c3f:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0007c46:	20 6c 61 
c0007c49:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0007c50:	74 2e 00 
c0007c53:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0007c5a:	00 00 00 
c0007c5d:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0007c64:	00 00 
c0007c66:	83 ec 0c             	sub    $0xc,%esp
c0007c69:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0007c6f:	50                   	push   %eax
c0007c70:	e8 83 2a 00 00       	call   c000a6f8 <Strlen>
c0007c75:	83 c4 10             	add    $0x10,%esp
c0007c78:	83 ec 04             	sub    $0x4,%esp
c0007c7b:	50                   	push   %eax
c0007c7c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0007c82:	50                   	push   %eax
c0007c83:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007c86:	e8 1f dc ff ff       	call   c00058aa <write>
c0007c8b:	83 c4 10             	add    $0x10,%esp
c0007c8e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007c95:	eb 5c                	jmp    c0007cf3 <TestFS+0x323>
c0007c97:	83 ec 04             	sub    $0x4,%esp
c0007c9a:	6a 1e                	push   $0x1e
c0007c9c:	6a 00                	push   $0x0
c0007c9e:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0007ca4:	50                   	push   %eax
c0007ca5:	e8 15 2a 00 00       	call   c000a6bf <Memset>
c0007caa:	83 c4 10             	add    $0x10,%esp
c0007cad:	83 ec 0c             	sub    $0xc,%esp
c0007cb0:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0007cb6:	50                   	push   %eax
c0007cb7:	e8 3c 2a 00 00       	call   c000a6f8 <Strlen>
c0007cbc:	83 c4 10             	add    $0x10,%esp
c0007cbf:	83 ec 04             	sub    $0x4,%esp
c0007cc2:	50                   	push   %eax
c0007cc3:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0007cc9:	50                   	push   %eax
c0007cca:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007ccd:	e8 a1 db ff ff       	call   c0005873 <read>
c0007cd2:	83 c4 10             	add    $0x10,%esp
c0007cd5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007cd8:	83 ec 08             	sub    $0x8,%esp
c0007cdb:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0007ce1:	50                   	push   %eax
c0007ce2:	68 bc a2 00 c0       	push   $0xc000a2bc
c0007ce7:	e8 23 0b 00 00       	call   c000880f <Printf>
c0007cec:	83 c4 10             	add    $0x10,%esp
c0007cef:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0007cf3:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
c0007cf7:	7e 9e                	jle    c0007c97 <TestFS+0x2c7>
c0007cf9:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0007d00:	6e 73 74 
c0007d03:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0007d0a:	6c 6c 2e 
c0007d0d:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0007d14:	61 72 00 
c0007d17:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0007d1e:	00 00 00 
c0007d21:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0007d28:	00 00 00 
c0007d2b:	83 ec 08             	sub    $0x8,%esp
c0007d2e:	6a 00                	push   $0x0
c0007d30:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0007d36:	50                   	push   %eax
c0007d37:	e8 e2 da ff ff       	call   c000581e <open>
c0007d3c:	83 c4 10             	add    $0x10,%esp
c0007d3f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007d42:	83 ec 08             	sub    $0x8,%esp
c0007d45:	ff 75 cc             	pushl  -0x34(%ebp)
c0007d48:	68 c7 a2 00 c0       	push   $0xc000a2c7
c0007d4d:	e8 bd 0a 00 00       	call   c000880f <Printf>
c0007d52:	83 c4 10             	add    $0x10,%esp
c0007d55:	83 ec 04             	sub    $0x4,%esp
c0007d58:	6a 14                	push   $0x14
c0007d5a:	6a 00                	push   $0x0
c0007d5c:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0007d62:	50                   	push   %eax
c0007d63:	e8 57 29 00 00       	call   c000a6bf <Memset>
c0007d68:	83 c4 10             	add    $0x10,%esp
c0007d6b:	83 ec 04             	sub    $0x4,%esp
c0007d6e:	68 00 02 00 00       	push   $0x200
c0007d73:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0007d79:	50                   	push   %eax
c0007d7a:	ff 75 cc             	pushl  -0x34(%ebp)
c0007d7d:	e8 f1 da ff ff       	call   c0005873 <read>
c0007d82:	83 c4 10             	add    $0x10,%esp
c0007d85:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007d88:	83 ec 08             	sub    $0x8,%esp
c0007d8b:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0007d91:	50                   	push   %eax
c0007d92:	68 d1 a2 00 c0       	push   $0xc000a2d1
c0007d97:	e8 73 0a 00 00       	call   c000880f <Printf>
c0007d9c:	83 c4 10             	add    $0x10,%esp
c0007d9f:	e9 b2 fc ff ff       	jmp    c0007a56 <TestFS+0x86>

c0007da4 <wait_exit>:
c0007da4:	55                   	push   %ebp
c0007da5:	89 e5                	mov    %esp,%ebp
c0007da7:	83 ec 28             	sub    $0x28,%esp
c0007daa:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0007db1:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0007db8:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0007dbe:	83 ec 08             	sub    $0x8,%esp
c0007dc1:	6a 02                	push   $0x2
c0007dc3:	8d 45 de             	lea    -0x22(%ebp),%eax
c0007dc6:	50                   	push   %eax
c0007dc7:	e8 52 da ff ff       	call   c000581e <open>
c0007dcc:	83 c4 10             	add    $0x10,%esp
c0007dcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007dd2:	83 ec 08             	sub    $0x8,%esp
c0007dd5:	6a 02                	push   $0x2
c0007dd7:	8d 45 de             	lea    -0x22(%ebp),%eax
c0007dda:	50                   	push   %eax
c0007ddb:	e8 3e da ff ff       	call   c000581e <open>
c0007de0:	83 c4 10             	add    $0x10,%esp
c0007de3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007de6:	e8 a9 db ff ff       	call   c0005994 <fork>
c0007deb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007dee:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007df2:	7e 25                	jle    c0007e19 <wait_exit+0x75>
c0007df4:	83 ec 0c             	sub    $0xc,%esp
c0007df7:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007dfa:	50                   	push   %eax
c0007dfb:	e8 2d db ff ff       	call   c000592d <wait>
c0007e00:	83 c4 10             	add    $0x10,%esp
c0007e03:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007e06:	83 ec 08             	sub    $0x8,%esp
c0007e09:	50                   	push   %eax
c0007e0a:	68 dc a2 00 c0       	push   $0xc000a2dc
c0007e0f:	e8 fb 09 00 00       	call   c000880f <Printf>
c0007e14:	83 c4 10             	add    $0x10,%esp
c0007e17:	eb fe                	jmp    c0007e17 <wait_exit+0x73>
c0007e19:	83 ec 0c             	sub    $0xc,%esp
c0007e1c:	68 f7 a2 00 c0       	push   $0xc000a2f7
c0007e21:	e8 e9 09 00 00       	call   c000880f <Printf>
c0007e26:	83 c4 10             	add    $0x10,%esp
c0007e29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e33:	8d 50 01             	lea    0x1(%eax),%edx
c0007e36:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0007e39:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0007e3e:	7f 02                	jg     c0007e42 <wait_exit+0x9e>
c0007e40:	eb ee                	jmp    c0007e30 <wait_exit+0x8c>
c0007e42:	90                   	nop
c0007e43:	83 ec 0c             	sub    $0xc,%esp
c0007e46:	68 03 a3 00 c0       	push   $0xc000a303
c0007e4b:	e8 bf 09 00 00       	call   c000880f <Printf>
c0007e50:	83 c4 10             	add    $0x10,%esp
c0007e53:	83 ec 0c             	sub    $0xc,%esp
c0007e56:	6a 09                	push   $0x9
c0007e58:	e8 0e db ff ff       	call   c000596b <exit>
c0007e5d:	83 c4 10             	add    $0x10,%esp
c0007e60:	83 ec 0c             	sub    $0xc,%esp
c0007e63:	68 11 a3 00 c0       	push   $0xc000a311
c0007e68:	e8 a2 09 00 00       	call   c000880f <Printf>
c0007e6d:	83 c4 10             	add    $0x10,%esp
c0007e70:	eb fe                	jmp    c0007e70 <wait_exit+0xcc>

c0007e72 <INIT_fork>:
c0007e72:	55                   	push   %ebp
c0007e73:	89 e5                	mov    %esp,%ebp
c0007e75:	53                   	push   %ebx
c0007e76:	81 ec 84 00 00 00    	sub    $0x84,%esp
c0007e7c:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c0007e83:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0007e8a:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0007e90:	83 ec 08             	sub    $0x8,%esp
c0007e93:	6a 02                	push   $0x2
c0007e95:	8d 45 da             	lea    -0x26(%ebp),%eax
c0007e98:	50                   	push   %eax
c0007e99:	e8 80 d9 ff ff       	call   c000581e <open>
c0007e9e:	83 c4 10             	add    $0x10,%esp
c0007ea1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007ea4:	83 ec 08             	sub    $0x8,%esp
c0007ea7:	6a 02                	push   $0x2
c0007ea9:	8d 45 da             	lea    -0x26(%ebp),%eax
c0007eac:	50                   	push   %eax
c0007ead:	e8 6c d9 ff ff       	call   c000581e <open>
c0007eb2:	83 c4 10             	add    $0x10,%esp
c0007eb5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007eb8:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c0007ebf:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c0007ec6:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c0007ecd:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c0007ed4:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c0007edb:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0007ee2:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0007ee9:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0007ef0:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0007ef7:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0007efe:	83 ec 0c             	sub    $0xc,%esp
c0007f01:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007f04:	50                   	push   %eax
c0007f05:	e8 ee 27 00 00       	call   c000a6f8 <Strlen>
c0007f0a:	83 c4 10             	add    $0x10,%esp
c0007f0d:	83 ec 04             	sub    $0x4,%esp
c0007f10:	50                   	push   %eax
c0007f11:	6a 00                	push   $0x0
c0007f13:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007f16:	50                   	push   %eax
c0007f17:	e8 a3 27 00 00       	call   c000a6bf <Memset>
c0007f1c:	83 c4 10             	add    $0x10,%esp
c0007f1f:	83 ec 04             	sub    $0x4,%esp
c0007f22:	6a 28                	push   $0x28
c0007f24:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007f27:	50                   	push   %eax
c0007f28:	ff 75 e8             	pushl  -0x18(%ebp)
c0007f2b:	e8 43 d9 ff ff       	call   c0005873 <read>
c0007f30:	83 c4 10             	add    $0x10,%esp
c0007f33:	83 ec 04             	sub    $0x4,%esp
c0007f36:	6a 28                	push   $0x28
c0007f38:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0007f3b:	50                   	push   %eax
c0007f3c:	ff 75 ec             	pushl  -0x14(%ebp)
c0007f3f:	e8 66 d9 ff ff       	call   c00058aa <write>
c0007f44:	83 c4 10             	add    $0x10,%esp
c0007f47:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007f4e:	e8 41 da ff ff       	call   c0005994 <fork>
c0007f53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007f56:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0007f5a:	0f 8e dd 00 00 00    	jle    c000803d <INIT_fork+0x1cb>
c0007f60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007f64:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
c0007f6b:	61 72 65 
c0007f6e:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
c0007f75:	8d 45 87             	lea    -0x79(%ebp),%eax
c0007f78:	b9 20 00 00 00       	mov    $0x20,%ecx
c0007f7d:	bb 00 00 00 00       	mov    $0x0,%ebx
c0007f82:	89 18                	mov    %ebx,(%eax)
c0007f84:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0007f88:	8d 50 04             	lea    0x4(%eax),%edx
c0007f8b:	83 e2 fc             	and    $0xfffffffc,%edx
c0007f8e:	29 d0                	sub    %edx,%eax
c0007f90:	01 c1                	add    %eax,%ecx
c0007f92:	83 e1 fc             	and    $0xfffffffc,%ecx
c0007f95:	83 e1 fc             	and    $0xfffffffc,%ecx
c0007f98:	b8 00 00 00 00       	mov    $0x0,%eax
c0007f9d:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0007fa0:	83 c0 04             	add    $0x4,%eax
c0007fa3:	39 c8                	cmp    %ecx,%eax
c0007fa5:	72 f6                	jb     c0007f9d <INIT_fork+0x12b>
c0007fa7:	01 c2                	add    %eax,%edx
c0007fa9:	83 ec 0c             	sub    $0xc,%esp
c0007fac:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fb2:	50                   	push   %eax
c0007fb3:	e8 40 27 00 00       	call   c000a6f8 <Strlen>
c0007fb8:	83 c4 10             	add    $0x10,%esp
c0007fbb:	83 ec 04             	sub    $0x4,%esp
c0007fbe:	50                   	push   %eax
c0007fbf:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fc5:	50                   	push   %eax
c0007fc6:	ff 75 ec             	pushl  -0x14(%ebp)
c0007fc9:	e8 dc d8 ff ff       	call   c00058aa <write>
c0007fce:	83 c4 10             	add    $0x10,%esp
c0007fd1:	83 ec 0c             	sub    $0xc,%esp
c0007fd4:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fda:	50                   	push   %eax
c0007fdb:	e8 18 27 00 00       	call   c000a6f8 <Strlen>
c0007fe0:	83 c4 10             	add    $0x10,%esp
c0007fe3:	83 ec 04             	sub    $0x4,%esp
c0007fe6:	50                   	push   %eax
c0007fe7:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0007fed:	50                   	push   %eax
c0007fee:	ff 75 ec             	pushl  -0x14(%ebp)
c0007ff1:	e8 b4 d8 ff ff       	call   c00058aa <write>
c0007ff6:	83 c4 10             	add    $0x10,%esp
c0007ff9:	83 ec 0c             	sub    $0xc,%esp
c0007ffc:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008002:	50                   	push   %eax
c0008003:	e8 f0 26 00 00       	call   c000a6f8 <Strlen>
c0008008:	83 c4 10             	add    $0x10,%esp
c000800b:	83 ec 04             	sub    $0x4,%esp
c000800e:	50                   	push   %eax
c000800f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008015:	50                   	push   %eax
c0008016:	ff 75 ec             	pushl  -0x14(%ebp)
c0008019:	e8 8c d8 ff ff       	call   c00058aa <write>
c000801e:	83 c4 10             	add    $0x10,%esp
c0008021:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008028:	eb 08                	jmp    c0008032 <INIT_fork+0x1c0>
c000802a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000802e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008032:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0008036:	7e f2                	jle    c000802a <INIT_fork+0x1b8>
c0008038:	e9 0f 01 00 00       	jmp    c000814c <INIT_fork+0x2da>
c000803d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008041:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0008045:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
c000804c:	68 69 6c 
c000804f:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
c0008056:	8d 45 87             	lea    -0x79(%ebp),%eax
c0008059:	b9 20 00 00 00       	mov    $0x20,%ecx
c000805e:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008063:	89 18                	mov    %ebx,(%eax)
c0008065:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008069:	8d 50 04             	lea    0x4(%eax),%edx
c000806c:	83 e2 fc             	and    $0xfffffffc,%edx
c000806f:	29 d0                	sub    %edx,%eax
c0008071:	01 c1                	add    %eax,%ecx
c0008073:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008076:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008079:	b8 00 00 00 00       	mov    $0x0,%eax
c000807e:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008081:	83 c0 04             	add    $0x4,%eax
c0008084:	39 c8                	cmp    %ecx,%eax
c0008086:	72 f6                	jb     c000807e <INIT_fork+0x20c>
c0008088:	01 c2                	add    %eax,%edx
c000808a:	83 ec 0c             	sub    $0xc,%esp
c000808d:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008093:	50                   	push   %eax
c0008094:	e8 5f 26 00 00       	call   c000a6f8 <Strlen>
c0008099:	83 c4 10             	add    $0x10,%esp
c000809c:	83 ec 04             	sub    $0x4,%esp
c000809f:	50                   	push   %eax
c00080a0:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00080a6:	50                   	push   %eax
c00080a7:	ff 75 ec             	pushl  -0x14(%ebp)
c00080aa:	e8 fb d7 ff ff       	call   c00058aa <write>
c00080af:	83 c4 10             	add    $0x10,%esp
c00080b2:	83 ec 0c             	sub    $0xc,%esp
c00080b5:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00080bb:	50                   	push   %eax
c00080bc:	e8 37 26 00 00       	call   c000a6f8 <Strlen>
c00080c1:	83 c4 10             	add    $0x10,%esp
c00080c4:	83 ec 04             	sub    $0x4,%esp
c00080c7:	50                   	push   %eax
c00080c8:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00080ce:	50                   	push   %eax
c00080cf:	ff 75 ec             	pushl  -0x14(%ebp)
c00080d2:	e8 d3 d7 ff ff       	call   c00058aa <write>
c00080d7:	83 c4 10             	add    $0x10,%esp
c00080da:	83 ec 0c             	sub    $0xc,%esp
c00080dd:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00080e3:	50                   	push   %eax
c00080e4:	e8 0f 26 00 00       	call   c000a6f8 <Strlen>
c00080e9:	83 c4 10             	add    $0x10,%esp
c00080ec:	83 ec 04             	sub    $0x4,%esp
c00080ef:	50                   	push   %eax
c00080f0:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00080f6:	50                   	push   %eax
c00080f7:	ff 75 ec             	pushl  -0x14(%ebp)
c00080fa:	e8 ab d7 ff ff       	call   c00058aa <write>
c00080ff:	83 c4 10             	add    $0x10,%esp
c0008102:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
c0008109:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
c0008110:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
c0008116:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
c000811a:	83 ec 0c             	sub    $0xc,%esp
c000811d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008120:	50                   	push   %eax
c0008121:	e8 d2 25 00 00       	call   c000a6f8 <Strlen>
c0008126:	83 c4 10             	add    $0x10,%esp
c0008129:	83 ec 04             	sub    $0x4,%esp
c000812c:	50                   	push   %eax
c000812d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008130:	50                   	push   %eax
c0008131:	ff 75 ec             	pushl  -0x14(%ebp)
c0008134:	e8 71 d7 ff ff       	call   c00058aa <write>
c0008139:	83 c4 10             	add    $0x10,%esp
c000813c:	83 ec 0c             	sub    $0xc,%esp
c000813f:	68 1f a3 00 c0       	push   $0xc000a31f
c0008144:	e8 f0 09 00 00       	call   c0008b39 <spin>
c0008149:	83 c4 10             	add    $0x10,%esp
c000814c:	83 ec 0c             	sub    $0xc,%esp
c000814f:	68 26 a3 00 c0       	push   $0xc000a326
c0008154:	e8 e0 09 00 00       	call   c0008b39 <spin>
c0008159:	83 c4 10             	add    $0x10,%esp
c000815c:	90                   	nop
c000815d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0008160:	c9                   	leave  
c0008161:	c3                   	ret    

c0008162 <simple_shell>:
c0008162:	55                   	push   %ebp
c0008163:	89 e5                	mov    %esp,%ebp
c0008165:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c000816b:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008172:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008179:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c000817f:	83 ec 08             	sub    $0x8,%esp
c0008182:	6a 02                	push   $0x2
c0008184:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008187:	50                   	push   %eax
c0008188:	e8 91 d6 ff ff       	call   c000581e <open>
c000818d:	83 c4 10             	add    $0x10,%esp
c0008190:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008193:	83 ec 08             	sub    $0x8,%esp
c0008196:	6a 02                	push   $0x2
c0008198:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000819b:	50                   	push   %eax
c000819c:	e8 7d d6 ff ff       	call   c000581e <open>
c00081a1:	83 c4 10             	add    $0x10,%esp
c00081a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00081a7:	83 ec 04             	sub    $0x4,%esp
c00081aa:	68 80 00 00 00       	push   $0x80
c00081af:	6a 00                	push   $0x0
c00081b1:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00081b7:	50                   	push   %eax
c00081b8:	e8 02 25 00 00       	call   c000a6bf <Memset>
c00081bd:	83 c4 10             	add    $0x10,%esp
c00081c0:	83 ec 04             	sub    $0x4,%esp
c00081c3:	68 80 00 00 00       	push   $0x80
c00081c8:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00081ce:	50                   	push   %eax
c00081cf:	ff 75 e0             	pushl  -0x20(%ebp)
c00081d2:	e8 9c d6 ff ff       	call   c0005873 <read>
c00081d7:	83 c4 10             	add    $0x10,%esp
c00081da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00081e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00081e8:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00081ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00081f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00081f4:	0f b6 00             	movzbl (%eax),%eax
c00081f7:	88 45 db             	mov    %al,-0x25(%ebp)
c00081fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00081fd:	0f b6 00             	movzbl (%eax),%eax
c0008200:	3c 20                	cmp    $0x20,%al
c0008202:	74 1d                	je     c0008221 <simple_shell+0xbf>
c0008204:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008207:	0f b6 00             	movzbl (%eax),%eax
c000820a:	84 c0                	test   %al,%al
c000820c:	74 13                	je     c0008221 <simple_shell+0xbf>
c000820e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008212:	75 0d                	jne    c0008221 <simple_shell+0xbf>
c0008214:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008217:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000821a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008221:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008224:	0f b6 00             	movzbl (%eax),%eax
c0008227:	3c 20                	cmp    $0x20,%al
c0008229:	74 0a                	je     c0008235 <simple_shell+0xd3>
c000822b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000822e:	0f b6 00             	movzbl (%eax),%eax
c0008231:	84 c0                	test   %al,%al
c0008233:	75 26                	jne    c000825b <simple_shell+0xf9>
c0008235:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008239:	75 20                	jne    c000825b <simple_shell+0xf9>
c000823b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000823e:	8d 50 01             	lea    0x1(%eax),%edx
c0008241:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008244:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008247:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c000824e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008251:	c6 00 00             	movb   $0x0,(%eax)
c0008254:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000825b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000825f:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008263:	75 8c                	jne    c00081f1 <simple_shell+0x8f>
c0008265:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008268:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c000826f:	00 00 00 00 
c0008273:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000827a:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008280:	83 ec 08             	sub    $0x8,%esp
c0008283:	6a 02                	push   $0x2
c0008285:	50                   	push   %eax
c0008286:	e8 93 d5 ff ff       	call   c000581e <open>
c000828b:	83 c4 10             	add    $0x10,%esp
c000828e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008291:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008295:	75 54                	jne    c00082eb <simple_shell+0x189>
c0008297:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000829e:	eb 29                	jmp    c00082c9 <simple_shell+0x167>
c00082a0:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c00082a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082a9:	01 d0                	add    %edx,%eax
c00082ab:	0f b6 00             	movzbl (%eax),%eax
c00082ae:	0f be c0             	movsbl %al,%eax
c00082b1:	83 ec 04             	sub    $0x4,%esp
c00082b4:	50                   	push   %eax
c00082b5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00082b8:	68 2e a3 00 c0       	push   $0xc000a32e
c00082bd:	e8 4d 05 00 00       	call   c000880f <Printf>
c00082c2:	83 c4 10             	add    $0x10,%esp
c00082c5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00082c9:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c00082cd:	7e d1                	jle    c00082a0 <simple_shell+0x13e>
c00082cf:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00082d5:	83 ec 08             	sub    $0x8,%esp
c00082d8:	50                   	push   %eax
c00082d9:	68 35 a3 00 c0       	push   $0xc000a335
c00082de:	e8 2c 05 00 00       	call   c000880f <Printf>
c00082e3:	83 c4 10             	add    $0x10,%esp
c00082e6:	e9 bc fe ff ff       	jmp    c00081a7 <simple_shell+0x45>
c00082eb:	e8 a4 d6 ff ff       	call   c0005994 <fork>
c00082f0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00082f3:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00082f7:	7e 17                	jle    c0008310 <simple_shell+0x1ae>
c00082f9:	83 ec 0c             	sub    $0xc,%esp
c00082fc:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008302:	50                   	push   %eax
c0008303:	e8 25 d6 ff ff       	call   c000592d <wait>
c0008308:	83 c4 10             	add    $0x10,%esp
c000830b:	e9 97 fe ff ff       	jmp    c00081a7 <simple_shell+0x45>
c0008310:	83 ec 0c             	sub    $0xc,%esp
c0008313:	ff 75 d0             	pushl  -0x30(%ebp)
c0008316:	e8 c6 d5 ff ff       	call   c00058e1 <close>
c000831b:	83 c4 10             	add    $0x10,%esp
c000831e:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008324:	83 ec 08             	sub    $0x8,%esp
c0008327:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c000832d:	52                   	push   %edx
c000832e:	50                   	push   %eax
c000832f:	e8 4f d7 ff ff       	call   c0005a83 <execv>
c0008334:	83 c4 10             	add    $0x10,%esp
c0008337:	eb fe                	jmp    c0008337 <simple_shell+0x1d5>

c0008339 <test_split_str>:
c0008339:	55                   	push   %ebp
c000833a:	89 e5                	mov    %esp,%ebp
c000833c:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008342:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008349:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008350:	c7 45 ec 3b a3 00 c0 	movl   $0xc000a33b,-0x14(%ebp)
c0008357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000835b:	75 1a                	jne    c0008377 <test_split_str+0x3e>
c000835d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008360:	0f b6 00             	movzbl (%eax),%eax
c0008363:	0f be c0             	movsbl %al,%eax
c0008366:	83 ec 08             	sub    $0x8,%esp
c0008369:	50                   	push   %eax
c000836a:	68 4c a3 00 c0       	push   $0xc000a34c
c000836f:	e8 9b 04 00 00       	call   c000880f <Printf>
c0008374:	83 c4 10             	add    $0x10,%esp
c0008377:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000837a:	0f b6 00             	movzbl (%eax),%eax
c000837d:	3c 20                	cmp    $0x20,%al
c000837f:	75 0a                	jne    c000838b <test_split_str+0x52>
c0008381:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008384:	0f b6 00             	movzbl (%eax),%eax
c0008387:	84 c0                	test   %al,%al
c0008389:	74 13                	je     c000839e <test_split_str+0x65>
c000838b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000838f:	75 0d                	jne    c000839e <test_split_str+0x65>
c0008391:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008394:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008397:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000839e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00083a1:	0f b6 00             	movzbl (%eax),%eax
c00083a4:	3c 20                	cmp    $0x20,%al
c00083a6:	74 0a                	je     c00083b2 <test_split_str+0x79>
c00083a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00083ab:	0f b6 00             	movzbl (%eax),%eax
c00083ae:	84 c0                	test   %al,%al
c00083b0:	75 26                	jne    c00083d8 <test_split_str+0x9f>
c00083b2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00083b6:	75 20                	jne    c00083d8 <test_split_str+0x9f>
c00083b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00083bb:	8d 50 01             	lea    0x1(%eax),%edx
c00083be:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00083c1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00083c4:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00083cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00083ce:	c6 00 00             	movb   $0x0,(%eax)
c00083d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00083d8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00083dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00083df:	0f b6 00             	movzbl (%eax),%eax
c00083e2:	84 c0                	test   %al,%al
c00083e4:	0f 85 6d ff ff ff    	jne    c0008357 <test_split_str+0x1e>
c00083ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00083ed:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00083f0:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00083f7:	83 ec 08             	sub    $0x8,%esp
c00083fa:	ff 75 f4             	pushl  -0xc(%ebp)
c00083fd:	68 55 a3 00 c0       	push   $0xc000a355
c0008402:	e8 08 04 00 00       	call   c000880f <Printf>
c0008407:	83 c4 10             	add    $0x10,%esp
c000840a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008411:	eb 22                	jmp    c0008435 <test_split_str+0xfc>
c0008413:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008416:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c000841d:	83 ec 04             	sub    $0x4,%esp
c0008420:	50                   	push   %eax
c0008421:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008424:	68 6c a3 00 c0       	push   $0xc000a36c
c0008429:	e8 e1 03 00 00       	call   c000880f <Printf>
c000842e:	83 c4 10             	add    $0x10,%esp
c0008431:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008435:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008438:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c000843b:	7e d6                	jle    c0008413 <test_split_str+0xda>
c000843d:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008443:	83 ec 08             	sub    $0x8,%esp
c0008446:	68 7b a3 00 c0       	push   $0xc000a37b
c000844b:	50                   	push   %eax
c000844c:	e8 7d 11 00 00       	call   c00095ce <strcmp>
c0008451:	83 c4 10             	add    $0x10,%esp
c0008454:	85 c0                	test   %eax,%eax
c0008456:	75 10                	jne    c0008468 <test_split_str+0x12f>
c0008458:	83 ec 0c             	sub    $0xc,%esp
c000845b:	68 80 a3 00 c0       	push   $0xc000a380
c0008460:	e8 aa 03 00 00       	call   c000880f <Printf>
c0008465:	83 c4 10             	add    $0x10,%esp
c0008468:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c000846e:	83 ec 08             	sub    $0x8,%esp
c0008471:	50                   	push   %eax
c0008472:	68 8c a3 00 c0       	push   $0xc000a38c
c0008477:	e8 93 03 00 00       	call   c000880f <Printf>
c000847c:	83 c4 10             	add    $0x10,%esp
c000847f:	83 ec 0c             	sub    $0xc,%esp
c0008482:	68 9a a3 00 c0       	push   $0xc000a39a
c0008487:	e8 83 03 00 00       	call   c000880f <Printf>
c000848c:	83 c4 10             	add    $0x10,%esp
c000848f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008496:	eb 26                	jmp    c00084be <test_split_str+0x185>
c0008498:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c000849e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00084a1:	01 d0                	add    %edx,%eax
c00084a3:	0f b6 00             	movzbl (%eax),%eax
c00084a6:	0f be c0             	movsbl %al,%eax
c00084a9:	83 ec 08             	sub    $0x8,%esp
c00084ac:	50                   	push   %eax
c00084ad:	68 a9 a3 00 c0       	push   $0xc000a3a9
c00084b2:	e8 58 03 00 00       	call   c000880f <Printf>
c00084b7:	83 c4 10             	add    $0x10,%esp
c00084ba:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00084be:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c00084c2:	7e d4                	jle    c0008498 <test_split_str+0x15f>
c00084c4:	c9                   	leave  
c00084c5:	c3                   	ret    

c00084c6 <test_shell>:
c00084c6:	55                   	push   %ebp
c00084c7:	89 e5                	mov    %esp,%ebp
c00084c9:	83 ec 48             	sub    $0x48,%esp
c00084cc:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c00084d3:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c00084da:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c00084e0:	83 ec 08             	sub    $0x8,%esp
c00084e3:	6a 02                	push   $0x2
c00084e5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c00084e8:	50                   	push   %eax
c00084e9:	e8 30 d3 ff ff       	call   c000581e <open>
c00084ee:	83 c4 10             	add    $0x10,%esp
c00084f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00084f4:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c00084fb:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0008502:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0008509:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008510:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008517:	83 ec 0c             	sub    $0xc,%esp
c000851a:	8d 45 ce             	lea    -0x32(%ebp),%eax
c000851d:	50                   	push   %eax
c000851e:	e8 23 e8 ff ff       	call   c0006d46 <untar>
c0008523:	83 c4 10             	add    $0x10,%esp
c0008526:	e8 69 d4 ff ff       	call   c0005994 <fork>
c000852b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000852e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008532:	7e 25                	jle    c0008559 <test_shell+0x93>
c0008534:	83 ec 0c             	sub    $0xc,%esp
c0008537:	8d 45 c8             	lea    -0x38(%ebp),%eax
c000853a:	50                   	push   %eax
c000853b:	e8 ed d3 ff ff       	call   c000592d <wait>
c0008540:	83 c4 10             	add    $0x10,%esp
c0008543:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008546:	83 ec 08             	sub    $0x8,%esp
c0008549:	50                   	push   %eax
c000854a:	68 b2 a3 00 c0       	push   $0xc000a3b2
c000854f:	e8 bb 02 00 00       	call   c000880f <Printf>
c0008554:	83 c4 10             	add    $0x10,%esp
c0008557:	eb 23                	jmp    c000857c <test_shell+0xb6>
c0008559:	83 ec 0c             	sub    $0xc,%esp
c000855c:	68 c4 a3 00 c0       	push   $0xc000a3c4
c0008561:	e8 a9 02 00 00       	call   c000880f <Printf>
c0008566:	83 c4 10             	add    $0x10,%esp
c0008569:	83 ec 0c             	sub    $0xc,%esp
c000856c:	ff 75 f4             	pushl  -0xc(%ebp)
c000856f:	e8 6d d3 ff ff       	call   c00058e1 <close>
c0008574:	83 c4 10             	add    $0x10,%esp
c0008577:	e8 e6 fb ff ff       	call   c0008162 <simple_shell>
c000857c:	83 ec 0c             	sub    $0xc,%esp
c000857f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008582:	50                   	push   %eax
c0008583:	e8 a5 d3 ff ff       	call   c000592d <wait>
c0008588:	83 c4 10             	add    $0x10,%esp
c000858b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000858e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008591:	83 ec 08             	sub    $0x8,%esp
c0008594:	50                   	push   %eax
c0008595:	68 d2 a3 00 c0       	push   $0xc000a3d2
c000859a:	e8 70 02 00 00       	call   c000880f <Printf>
c000859f:	83 c4 10             	add    $0x10,%esp
c00085a2:	eb d8                	jmp    c000857c <test_shell+0xb6>

c00085a4 <test_exec>:
c00085a4:	55                   	push   %ebp
c00085a5:	89 e5                	mov    %esp,%ebp
c00085a7:	83 ec 38             	sub    $0x38,%esp
c00085aa:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c00085b1:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c00085b8:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c00085be:	83 ec 08             	sub    $0x8,%esp
c00085c1:	6a 02                	push   $0x2
c00085c3:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00085c6:	50                   	push   %eax
c00085c7:	e8 52 d2 ff ff       	call   c000581e <open>
c00085cc:	83 c4 10             	add    $0x10,%esp
c00085cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00085d2:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c00085d9:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c00085e0:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c00085e7:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c00085ee:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00085f5:	83 ec 0c             	sub    $0xc,%esp
c00085f8:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c00085fb:	50                   	push   %eax
c00085fc:	e8 45 e7 ff ff       	call   c0006d46 <untar>
c0008601:	83 c4 10             	add    $0x10,%esp
c0008604:	e8 8b d3 ff ff       	call   c0005994 <fork>
c0008609:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000860c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008610:	7e 25                	jle    c0008637 <test_exec+0x93>
c0008612:	83 ec 0c             	sub    $0xc,%esp
c0008615:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008618:	50                   	push   %eax
c0008619:	e8 0f d3 ff ff       	call   c000592d <wait>
c000861e:	83 c4 10             	add    $0x10,%esp
c0008621:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008624:	83 ec 08             	sub    $0x8,%esp
c0008627:	50                   	push   %eax
c0008628:	68 b2 a3 00 c0       	push   $0xc000a3b2
c000862d:	e8 dd 01 00 00       	call   c000880f <Printf>
c0008632:	83 c4 10             	add    $0x10,%esp
c0008635:	eb 33                	jmp    c000866a <test_exec+0xc6>
c0008637:	83 ec 0c             	sub    $0xc,%esp
c000863a:	68 c4 a3 00 c0       	push   $0xc000a3c4
c000863f:	e8 cb 01 00 00       	call   c000880f <Printf>
c0008644:	83 c4 10             	add    $0x10,%esp
c0008647:	83 ec 0c             	sub    $0xc,%esp
c000864a:	6a 00                	push   $0x0
c000864c:	68 ed a3 00 c0       	push   $0xc000a3ed
c0008651:	68 f3 a3 00 c0       	push   $0xc000a3f3
c0008656:	68 7b a3 00 c0       	push   $0xc000a37b
c000865b:	68 f9 a3 00 c0       	push   $0xc000a3f9
c0008660:	e8 c3 d5 ff ff       	call   c0005c28 <execl>
c0008665:	83 c4 20             	add    $0x20,%esp
c0008668:	eb fe                	jmp    c0008668 <test_exec+0xc4>
c000866a:	c9                   	leave  
c000866b:	c3                   	ret    

c000866c <INIT>:
c000866c:	55                   	push   %ebp
c000866d:	89 e5                	mov    %esp,%ebp
c000866f:	83 ec 08             	sub    $0x8,%esp
c0008672:	e8 4f fe ff ff       	call   c00084c6 <test_shell>
c0008677:	eb fe                	jmp    c0008677 <INIT+0xb>

c0008679 <TestA>:
c0008679:	55                   	push   %ebp
c000867a:	89 e5                	mov    %esp,%ebp
c000867c:	83 ec 08             	sub    $0x8,%esp
c000867f:	83 ec 0c             	sub    $0xc,%esp
c0008682:	6a 05                	push   $0x5
c0008684:	e8 6d e9 ff ff       	call   c0006ff6 <disp_int>
c0008689:	83 c4 10             	add    $0x10,%esp
c000868c:	83 ec 0c             	sub    $0xc,%esp
c000868f:	68 34 9f 00 c0       	push   $0xc0009f34
c0008694:	e8 f3 8e ff ff       	call   c000158c <disp_str>
c0008699:	83 c4 10             	add    $0x10,%esp
c000869c:	83 ec 0c             	sub    $0xc,%esp
c000869f:	68 ff a3 00 c0       	push   $0xc000a3ff
c00086a4:	e8 e3 8e ff ff       	call   c000158c <disp_str>
c00086a9:	83 c4 10             	add    $0x10,%esp
c00086ac:	eb fe                	jmp    c00086ac <TestA+0x33>

c00086ae <delay>:
c00086ae:	55                   	push   %ebp
c00086af:	89 e5                	mov    %esp,%ebp
c00086b1:	83 ec 10             	sub    $0x10,%esp
c00086b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00086bb:	eb 2d                	jmp    c00086ea <delay+0x3c>
c00086bd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00086c4:	eb 1a                	jmp    c00086e0 <delay+0x32>
c00086c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00086cd:	eb 04                	jmp    c00086d3 <delay+0x25>
c00086cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00086d3:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c00086da:	7e f3                	jle    c00086cf <delay+0x21>
c00086dc:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00086e0:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c00086e4:	7e e0                	jle    c00086c6 <delay+0x18>
c00086e6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00086ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00086ed:	3b 45 08             	cmp    0x8(%ebp),%eax
c00086f0:	7c cb                	jl     c00086bd <delay+0xf>
c00086f2:	90                   	nop
c00086f3:	c9                   	leave  
c00086f4:	c3                   	ret    

c00086f5 <TestB>:
c00086f5:	55                   	push   %ebp
c00086f6:	89 e5                	mov    %esp,%ebp
c00086f8:	83 ec 08             	sub    $0x8,%esp
c00086fb:	83 ec 0c             	sub    $0xc,%esp
c00086fe:	68 06 a4 00 c0       	push   $0xc000a406
c0008703:	e8 84 8e ff ff       	call   c000158c <disp_str>
c0008708:	83 c4 10             	add    $0x10,%esp
c000870b:	eb fe                	jmp    c000870b <TestB+0x16>

c000870d <TestC>:
c000870d:	55                   	push   %ebp
c000870e:	89 e5                	mov    %esp,%ebp
c0008710:	83 ec 18             	sub    $0x18,%esp
c0008713:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000871a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c000871e:	77 1a                	ja     c000873a <TestC+0x2d>
c0008720:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008727:	83 ec 08             	sub    $0x8,%esp
c000872a:	ff 75 f0             	pushl  -0x10(%ebp)
c000872d:	68 09 a4 00 c0       	push   $0xc000a409
c0008732:	e8 d8 00 00 00       	call   c000880f <Printf>
c0008737:	83 c4 10             	add    $0x10,%esp
c000873a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000873e:	eb da                	jmp    c000871a <TestC+0xd>

c0008740 <sys_get_ticks>:
c0008740:	55                   	push   %ebp
c0008741:	89 e5                	mov    %esp,%ebp
c0008743:	a1 00 0f 01 c0       	mov    0xc0010f00,%eax
c0008748:	5d                   	pop    %ebp
c0008749:	c3                   	ret    

c000874a <sys_write>:
c000874a:	55                   	push   %ebp
c000874b:	89 e5                	mov    %esp,%ebp
c000874d:	83 ec 18             	sub    $0x18,%esp
c0008750:	8b 45 10             	mov    0x10(%ebp),%eax
c0008753:	8b 40 2c             	mov    0x2c(%eax),%eax
c0008756:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c000875c:	05 e0 ed 00 c0       	add    $0xc000ede0,%eax
c0008761:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008764:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008767:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000876a:	8b 45 08             	mov    0x8(%ebp),%eax
c000876d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008770:	eb 20                	jmp    c0008792 <sys_write+0x48>
c0008772:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008775:	0f b6 00             	movzbl (%eax),%eax
c0008778:	0f b6 c0             	movzbl %al,%eax
c000877b:	83 ec 08             	sub    $0x8,%esp
c000877e:	50                   	push   %eax
c000877f:	ff 75 ec             	pushl  -0x14(%ebp)
c0008782:	e8 99 c5 ff ff       	call   c0004d20 <out_char>
c0008787:	83 c4 10             	add    $0x10,%esp
c000878a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000878e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008792:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008796:	7f da                	jg     c0008772 <sys_write+0x28>
c0008798:	90                   	nop
c0008799:	c9                   	leave  
c000879a:	c3                   	ret    

c000879b <milli_delay>:
c000879b:	55                   	push   %ebp
c000879c:	89 e5                	mov    %esp,%ebp
c000879e:	83 ec 18             	sub    $0x18,%esp
c00087a1:	e8 86 0c 00 00       	call   c000942c <get_ticks_ipc>
c00087a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00087a9:	90                   	nop
c00087aa:	e8 7d 0c 00 00       	call   c000942c <get_ticks_ipc>
c00087af:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00087b2:	89 c1                	mov    %eax,%ecx
c00087b4:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00087b9:	89 c8                	mov    %ecx,%eax
c00087bb:	f7 ea                	imul   %edx
c00087bd:	c1 fa 05             	sar    $0x5,%edx
c00087c0:	89 c8                	mov    %ecx,%eax
c00087c2:	c1 f8 1f             	sar    $0x1f,%eax
c00087c5:	29 c2                	sub    %eax,%edx
c00087c7:	89 d0                	mov    %edx,%eax
c00087c9:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c00087cf:	39 45 08             	cmp    %eax,0x8(%ebp)
c00087d2:	77 d6                	ja     c00087aa <milli_delay+0xf>
c00087d4:	90                   	nop
c00087d5:	c9                   	leave  
c00087d6:	c3                   	ret    

c00087d7 <TaskSys>:
c00087d7:	55                   	push   %ebp
c00087d8:	89 e5                	mov    %esp,%ebp
c00087da:	83 ec 78             	sub    $0x78,%esp
c00087dd:	83 ec 0c             	sub    $0xc,%esp
c00087e0:	68 16 a4 00 c0       	push   $0xc000a416
c00087e5:	e8 a2 8d ff ff       	call   c000158c <disp_str>
c00087ea:	83 c4 10             	add    $0x10,%esp
c00087ed:	83 ec 0c             	sub    $0xc,%esp
c00087f0:	68 20 a4 00 c0       	push   $0xc000a420
c00087f5:	e8 92 8d ff ff       	call   c000158c <disp_str>
c00087fa:	83 c4 10             	add    $0x10,%esp
c00087fd:	83 ec 0c             	sub    $0xc,%esp
c0008800:	68 2a a4 00 c0       	push   $0xc000a42a
c0008805:	e8 82 8d ff ff       	call   c000158c <disp_str>
c000880a:	83 c4 10             	add    $0x10,%esp
c000880d:	eb fe                	jmp    c000880d <TaskSys+0x36>

c000880f <Printf>:
c000880f:	55                   	push   %ebp
c0008810:	89 e5                	mov    %esp,%ebp
c0008812:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008818:	83 ec 04             	sub    $0x4,%esp
c000881b:	68 00 01 00 00       	push   $0x100
c0008820:	6a 00                	push   $0x0
c0008822:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008828:	50                   	push   %eax
c0008829:	e8 91 1e 00 00       	call   c000a6bf <Memset>
c000882e:	83 c4 10             	add    $0x10,%esp
c0008831:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008834:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008837:	8b 45 08             	mov    0x8(%ebp),%eax
c000883a:	83 ec 04             	sub    $0x4,%esp
c000883d:	ff 75 f4             	pushl  -0xc(%ebp)
c0008840:	50                   	push   %eax
c0008841:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008847:	50                   	push   %eax
c0008848:	e8 20 00 00 00       	call   c000886d <vsprintf>
c000884d:	83 c4 10             	add    $0x10,%esp
c0008850:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008853:	83 ec 04             	sub    $0x4,%esp
c0008856:	ff 75 f0             	pushl  -0x10(%ebp)
c0008859:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000885f:	50                   	push   %eax
c0008860:	6a 00                	push   $0x0
c0008862:	e8 43 d0 ff ff       	call   c00058aa <write>
c0008867:	83 c4 10             	add    $0x10,%esp
c000886a:	90                   	nop
c000886b:	c9                   	leave  
c000886c:	c3                   	ret    

c000886d <vsprintf>:
c000886d:	55                   	push   %ebp
c000886e:	89 e5                	mov    %esp,%ebp
c0008870:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008876:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000887c:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008882:	83 ec 04             	sub    $0x4,%esp
c0008885:	6a 40                	push   $0x40
c0008887:	6a 00                	push   $0x0
c0008889:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000888f:	50                   	push   %eax
c0008890:	e8 2a 1e 00 00       	call   c000a6bf <Memset>
c0008895:	83 c4 10             	add    $0x10,%esp
c0008898:	8b 45 10             	mov    0x10(%ebp),%eax
c000889b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000889e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00088a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00088a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00088ab:	e9 53 01 00 00       	jmp    c0008a03 <vsprintf+0x196>
c00088b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00088b3:	0f b6 00             	movzbl (%eax),%eax
c00088b6:	3c 25                	cmp    $0x25,%al
c00088b8:	74 16                	je     c00088d0 <vsprintf+0x63>
c00088ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00088bd:	8d 50 01             	lea    0x1(%eax),%edx
c00088c0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00088c3:	8b 55 0c             	mov    0xc(%ebp),%edx
c00088c6:	0f b6 12             	movzbl (%edx),%edx
c00088c9:	88 10                	mov    %dl,(%eax)
c00088cb:	e9 2f 01 00 00       	jmp    c00089ff <vsprintf+0x192>
c00088d0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00088d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00088d7:	0f b6 00             	movzbl (%eax),%eax
c00088da:	0f be c0             	movsbl %al,%eax
c00088dd:	83 f8 64             	cmp    $0x64,%eax
c00088e0:	74 26                	je     c0008908 <vsprintf+0x9b>
c00088e2:	83 f8 64             	cmp    $0x64,%eax
c00088e5:	7f 0e                	jg     c00088f5 <vsprintf+0x88>
c00088e7:	83 f8 63             	cmp    $0x63,%eax
c00088ea:	0f 84 f2 00 00 00    	je     c00089e2 <vsprintf+0x175>
c00088f0:	e9 0a 01 00 00       	jmp    c00089ff <vsprintf+0x192>
c00088f5:	83 f8 73             	cmp    $0x73,%eax
c00088f8:	0f 84 b0 00 00 00    	je     c00089ae <vsprintf+0x141>
c00088fe:	83 f8 78             	cmp    $0x78,%eax
c0008901:	74 5d                	je     c0008960 <vsprintf+0xf3>
c0008903:	e9 f7 00 00 00       	jmp    c00089ff <vsprintf+0x192>
c0008908:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000890b:	8b 00                	mov    (%eax),%eax
c000890d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008910:	83 ec 04             	sub    $0x4,%esp
c0008913:	6a 0a                	push   $0xa
c0008915:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c000891b:	50                   	push   %eax
c000891c:	ff 75 e8             	pushl  -0x18(%ebp)
c000891f:	e8 53 0b 00 00       	call   c0009477 <itoa>
c0008924:	83 c4 10             	add    $0x10,%esp
c0008927:	83 ec 08             	sub    $0x8,%esp
c000892a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008930:	50                   	push   %eax
c0008931:	ff 75 f4             	pushl  -0xc(%ebp)
c0008934:	e8 a5 1d 00 00       	call   c000a6de <Strcpy>
c0008939:	83 c4 10             	add    $0x10,%esp
c000893c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008940:	83 ec 0c             	sub    $0xc,%esp
c0008943:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008949:	50                   	push   %eax
c000894a:	e8 a9 1d 00 00       	call   c000a6f8 <Strlen>
c000894f:	83 c4 10             	add    $0x10,%esp
c0008952:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008955:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008958:	01 45 f4             	add    %eax,-0xc(%ebp)
c000895b:	e9 9f 00 00 00       	jmp    c00089ff <vsprintf+0x192>
c0008960:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008963:	8b 00                	mov    (%eax),%eax
c0008965:	83 ec 08             	sub    $0x8,%esp
c0008968:	50                   	push   %eax
c0008969:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000896f:	50                   	push   %eax
c0008970:	e8 db e5 ff ff       	call   c0006f50 <atoi>
c0008975:	83 c4 10             	add    $0x10,%esp
c0008978:	83 ec 08             	sub    $0x8,%esp
c000897b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008981:	50                   	push   %eax
c0008982:	ff 75 f4             	pushl  -0xc(%ebp)
c0008985:	e8 54 1d 00 00       	call   c000a6de <Strcpy>
c000898a:	83 c4 10             	add    $0x10,%esp
c000898d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008991:	83 ec 0c             	sub    $0xc,%esp
c0008994:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000899a:	50                   	push   %eax
c000899b:	e8 58 1d 00 00       	call   c000a6f8 <Strlen>
c00089a0:	83 c4 10             	add    $0x10,%esp
c00089a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00089a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089a9:	01 45 f4             	add    %eax,-0xc(%ebp)
c00089ac:	eb 51                	jmp    c00089ff <vsprintf+0x192>
c00089ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089b1:	8b 00                	mov    (%eax),%eax
c00089b3:	83 ec 08             	sub    $0x8,%esp
c00089b6:	50                   	push   %eax
c00089b7:	ff 75 f4             	pushl  -0xc(%ebp)
c00089ba:	e8 1f 1d 00 00       	call   c000a6de <Strcpy>
c00089bf:	83 c4 10             	add    $0x10,%esp
c00089c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089c5:	8b 00                	mov    (%eax),%eax
c00089c7:	83 ec 0c             	sub    $0xc,%esp
c00089ca:	50                   	push   %eax
c00089cb:	e8 28 1d 00 00       	call   c000a6f8 <Strlen>
c00089d0:	83 c4 10             	add    $0x10,%esp
c00089d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00089d6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00089da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089dd:	01 45 f4             	add    %eax,-0xc(%ebp)
c00089e0:	eb 1d                	jmp    c00089ff <vsprintf+0x192>
c00089e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089e5:	0f b6 10             	movzbl (%eax),%edx
c00089e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00089eb:	88 10                	mov    %dl,(%eax)
c00089ed:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00089f1:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00089f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089fb:	01 45 f4             	add    %eax,-0xc(%ebp)
c00089fe:	90                   	nop
c00089ff:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008a03:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008a06:	0f b6 00             	movzbl (%eax),%eax
c0008a09:	84 c0                	test   %al,%al
c0008a0b:	0f 85 9f fe ff ff    	jne    c00088b0 <vsprintf+0x43>
c0008a11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a14:	2b 45 08             	sub    0x8(%ebp),%eax
c0008a17:	c9                   	leave  
c0008a18:	c3                   	ret    

c0008a19 <printx>:
c0008a19:	55                   	push   %ebp
c0008a1a:	89 e5                	mov    %esp,%ebp
c0008a1c:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008a22:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008a25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008a28:	8b 45 08             	mov    0x8(%ebp),%eax
c0008a2b:	83 ec 04             	sub    $0x4,%esp
c0008a2e:	ff 75 f4             	pushl  -0xc(%ebp)
c0008a31:	50                   	push   %eax
c0008a32:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008a38:	50                   	push   %eax
c0008a39:	e8 2f fe ff ff       	call   c000886d <vsprintf>
c0008a3e:	83 c4 10             	add    $0x10,%esp
c0008a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a44:	83 ec 08             	sub    $0x8,%esp
c0008a47:	ff 75 f0             	pushl  -0x10(%ebp)
c0008a4a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008a50:	50                   	push   %eax
c0008a51:	e8 92 9c ff ff       	call   c00026e8 <write_debug>
c0008a56:	83 c4 10             	add    $0x10,%esp
c0008a59:	90                   	nop
c0008a5a:	c9                   	leave  
c0008a5b:	c3                   	ret    

c0008a5c <sys_printx>:
c0008a5c:	55                   	push   %ebp
c0008a5d:	89 e5                	mov    %esp,%ebp
c0008a5f:	83 ec 28             	sub    $0x28,%esp
c0008a62:	a1 60 e7 00 c0       	mov    0xc000e760,%eax
c0008a67:	85 c0                	test   %eax,%eax
c0008a69:	75 20                	jne    c0008a8b <sys_printx+0x2f>
c0008a6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0008a6e:	8b 40 78             	mov    0x78(%eax),%eax
c0008a71:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a74:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a77:	83 ec 08             	sub    $0x8,%esp
c0008a7a:	ff 75 10             	pushl  0x10(%ebp)
c0008a7d:	50                   	push   %eax
c0008a7e:	e8 a4 bd ff ff       	call   c0004827 <Seg2PhyAddrLDT>
c0008a83:	83 c4 10             	add    $0x10,%esp
c0008a86:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008a89:	eb 19                	jmp    c0008aa4 <sys_printx+0x48>
c0008a8b:	a1 60 e7 00 c0       	mov    0xc000e760,%eax
c0008a90:	85 c0                	test   %eax,%eax
c0008a92:	74 10                	je     c0008aa4 <sys_printx+0x48>
c0008a94:	83 ec 0c             	sub    $0xc,%esp
c0008a97:	6a 30                	push   $0x30
c0008a99:	e8 48 bd ff ff       	call   c00047e6 <Seg2PhyAddr>
c0008a9e:	83 c4 10             	add    $0x10,%esp
c0008aa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008aa4:	8b 55 08             	mov    0x8(%ebp),%edx
c0008aa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008aaa:	01 d0                	add    %edx,%eax
c0008aac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008aaf:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ab2:	8b 40 2c             	mov    0x2c(%eax),%eax
c0008ab5:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0008abb:	05 e0 ed 00 c0       	add    $0xc000ede0,%eax
c0008ac0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008ac3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008ac6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ac9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008acc:	0f b6 00             	movzbl (%eax),%eax
c0008acf:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0008ad2:	eb 3a                	jmp    c0008b0e <sys_printx+0xb2>
c0008ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ad7:	0f b6 00             	movzbl (%eax),%eax
c0008ada:	3c 3b                	cmp    $0x3b,%al
c0008adc:	74 0a                	je     c0008ae8 <sys_printx+0x8c>
c0008ade:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ae1:	0f b6 00             	movzbl (%eax),%eax
c0008ae4:	3c 3a                	cmp    $0x3a,%al
c0008ae6:	75 06                	jne    c0008aee <sys_printx+0x92>
c0008ae8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008aec:	eb 20                	jmp    c0008b0e <sys_printx+0xb2>
c0008aee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008af1:	0f b6 00             	movzbl (%eax),%eax
c0008af4:	0f b6 c0             	movzbl %al,%eax
c0008af7:	83 ec 08             	sub    $0x8,%esp
c0008afa:	50                   	push   %eax
c0008afb:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008afe:	e8 1d c2 ff ff       	call   c0004d20 <out_char>
c0008b03:	83 c4 10             	add    $0x10,%esp
c0008b06:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008b0a:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0008b0e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0008b12:	7f c0                	jg     c0008ad4 <sys_printx+0x78>
c0008b14:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0008b18:	75 10                	jne    c0008b2a <sys_printx+0xce>
c0008b1a:	a1 60 e7 00 c0       	mov    0xc000e760,%eax
c0008b1f:	85 c0                	test   %eax,%eax
c0008b21:	74 13                	je     c0008b36 <sys_printx+0xda>
c0008b23:	e8 97 8c ff ff       	call   c00017bf <disable_int>
c0008b28:	eb 0c                	jmp    c0008b36 <sys_printx+0xda>
c0008b2a:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0008b2e:	75 06                	jne    c0008b36 <sys_printx+0xda>
c0008b30:	e8 8a 8c ff ff       	call   c00017bf <disable_int>
c0008b35:	90                   	nop
c0008b36:	90                   	nop
c0008b37:	c9                   	leave  
c0008b38:	c3                   	ret    

c0008b39 <spin>:
c0008b39:	55                   	push   %ebp
c0008b3a:	89 e5                	mov    %esp,%ebp
c0008b3c:	eb fe                	jmp    c0008b3c <spin+0x3>

c0008b3e <panic>:
c0008b3e:	55                   	push   %ebp
c0008b3f:	89 e5                	mov    %esp,%ebp
c0008b41:	83 ec 08             	sub    $0x8,%esp
c0008b44:	83 ec 04             	sub    $0x4,%esp
c0008b47:	ff 75 08             	pushl  0x8(%ebp)
c0008b4a:	6a 3a                	push   $0x3a
c0008b4c:	68 34 a4 00 c0       	push   $0xc000a434
c0008b51:	e8 c3 fe ff ff       	call   c0008a19 <printx>
c0008b56:	83 c4 10             	add    $0x10,%esp
c0008b59:	90                   	nop
c0008b5a:	c9                   	leave  
c0008b5b:	c3                   	ret    

c0008b5c <assertion_failure>:
c0008b5c:	55                   	push   %ebp
c0008b5d:	89 e5                	mov    %esp,%ebp
c0008b5f:	83 ec 08             	sub    $0x8,%esp
c0008b62:	83 ec 08             	sub    $0x8,%esp
c0008b65:	ff 75 14             	pushl  0x14(%ebp)
c0008b68:	ff 75 10             	pushl  0x10(%ebp)
c0008b6b:	ff 75 0c             	pushl  0xc(%ebp)
c0008b6e:	ff 75 08             	pushl  0x8(%ebp)
c0008b71:	6a 3b                	push   $0x3b
c0008b73:	68 3c a4 00 c0       	push   $0xc000a43c
c0008b78:	e8 9c fe ff ff       	call   c0008a19 <printx>
c0008b7d:	83 c4 20             	add    $0x20,%esp
c0008b80:	83 ec 0c             	sub    $0xc,%esp
c0008b83:	68 6f a4 00 c0       	push   $0xc000a46f
c0008b88:	e8 ac ff ff ff       	call   c0008b39 <spin>
c0008b8d:	83 c4 10             	add    $0x10,%esp
c0008b90:	90                   	nop
c0008b91:	c9                   	leave  
c0008b92:	c3                   	ret    

c0008b93 <dead_lock>:
c0008b93:	55                   	push   %ebp
c0008b94:	89 e5                	mov    %esp,%ebp
c0008b96:	b8 00 00 00 00       	mov    $0x0,%eax
c0008b9b:	5d                   	pop    %ebp
c0008b9c:	c3                   	ret    

c0008b9d <sys_send_msg>:
c0008b9d:	55                   	push   %ebp
c0008b9e:	89 e5                	mov    %esp,%ebp
c0008ba0:	83 ec 48             	sub    $0x48,%esp
c0008ba3:	83 ec 0c             	sub    $0xc,%esp
c0008ba6:	ff 75 0c             	pushl  0xc(%ebp)
c0008ba9:	e8 90 bb ff ff       	call   c000473e <pid2proc>
c0008bae:	83 c4 10             	add    $0x10,%esp
c0008bb1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008bb4:	83 ec 0c             	sub    $0xc,%esp
c0008bb7:	ff 75 10             	pushl  0x10(%ebp)
c0008bba:	e8 9b bb ff ff       	call   c000475a <proc2pid>
c0008bbf:	83 c4 10             	add    $0x10,%esp
c0008bc2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008bc5:	8b 45 10             	mov    0x10(%ebp),%eax
c0008bc8:	8b 40 78             	mov    0x78(%eax),%eax
c0008bcb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008bce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008bd1:	83 ec 08             	sub    $0x8,%esp
c0008bd4:	ff 75 10             	pushl  0x10(%ebp)
c0008bd7:	50                   	push   %eax
c0008bd8:	e8 4a bc ff ff       	call   c0004827 <Seg2PhyAddrLDT>
c0008bdd:	83 c4 10             	add    $0x10,%esp
c0008be0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008be3:	8b 55 08             	mov    0x8(%ebp),%edx
c0008be6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008be9:	01 d0                	add    %edx,%eax
c0008beb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008bee:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0008bf5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0008bf8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008bfb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008bfe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008c01:	89 10                	mov    %edx,(%eax)
c0008c03:	83 ec 08             	sub    $0x8,%esp
c0008c06:	ff 75 0c             	pushl  0xc(%ebp)
c0008c09:	ff 75 e8             	pushl  -0x18(%ebp)
c0008c0c:	e8 82 ff ff ff       	call   c0008b93 <dead_lock>
c0008c11:	83 c4 10             	add    $0x10,%esp
c0008c14:	83 f8 01             	cmp    $0x1,%eax
c0008c17:	75 10                	jne    c0008c29 <sys_send_msg+0x8c>
c0008c19:	83 ec 0c             	sub    $0xc,%esp
c0008c1c:	68 7b a4 00 c0       	push   $0xc000a47b
c0008c21:	e8 18 ff ff ff       	call   c0008b3e <panic>
c0008c26:	83 c4 10             	add    $0x10,%esp
c0008c29:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c2c:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0008c30:	3c 02                	cmp    $0x2,%al
c0008c32:	0f 85 78 01 00 00    	jne    c0008db0 <sys_send_msg+0x213>
c0008c38:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c3b:	8b 40 54             	mov    0x54(%eax),%eax
c0008c3e:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0008c41:	74 0f                	je     c0008c52 <sys_send_msg+0xb5>
c0008c43:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c46:	8b 40 54             	mov    0x54(%eax),%eax
c0008c49:	83 f8 0e             	cmp    $0xe,%eax
c0008c4c:	0f 85 5e 01 00 00    	jne    c0008db0 <sys_send_msg+0x213>
c0008c52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c55:	8b 40 78             	mov    0x78(%eax),%eax
c0008c58:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008c5b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008c5e:	83 ec 08             	sub    $0x8,%esp
c0008c61:	ff 75 ec             	pushl  -0x14(%ebp)
c0008c64:	50                   	push   %eax
c0008c65:	e8 bd bb ff ff       	call   c0004827 <Seg2PhyAddrLDT>
c0008c6a:	83 c4 10             	add    $0x10,%esp
c0008c6d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008c70:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c73:	8b 40 4c             	mov    0x4c(%eax),%eax
c0008c76:	89 c2                	mov    %eax,%edx
c0008c78:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008c7b:	01 d0                	add    %edx,%eax
c0008c7d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008c80:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0008c83:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008c86:	83 ec 04             	sub    $0x4,%esp
c0008c89:	ff 75 d8             	pushl  -0x28(%ebp)
c0008c8c:	52                   	push   %edx
c0008c8d:	50                   	push   %eax
c0008c8e:	e8 fe 19 00 00       	call   c000a691 <Memcpy>
c0008c93:	83 c4 10             	add    $0x10,%esp
c0008c96:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c99:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c0008ca0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ca3:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c0008ca7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008caa:	c7 40 54 1d 00 00 00 	movl   $0x1d,0x54(%eax)
c0008cb1:	83 ec 0c             	sub    $0xc,%esp
c0008cb4:	ff 75 ec             	pushl  -0x14(%ebp)
c0008cb7:	e8 3c 07 00 00       	call   c00093f8 <unblock>
c0008cbc:	83 c4 10             	add    $0x10,%esp
c0008cbf:	8b 45 10             	mov    0x10(%ebp),%eax
c0008cc2:	8b 40 4c             	mov    0x4c(%eax),%eax
c0008cc5:	85 c0                	test   %eax,%eax
c0008cc7:	74 1c                	je     c0008ce5 <sys_send_msg+0x148>
c0008cc9:	68 77 05 00 00       	push   $0x577
c0008cce:	68 86 a4 00 c0       	push   $0xc000a486
c0008cd3:	68 86 a4 00 c0       	push   $0xc000a486
c0008cd8:	68 96 a4 00 c0       	push   $0xc000a496
c0008cdd:	e8 7a fe ff ff       	call   c0008b5c <assertion_failure>
c0008ce2:	83 c4 10             	add    $0x10,%esp
c0008ce5:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ce8:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0008cec:	84 c0                	test   %al,%al
c0008cee:	74 1c                	je     c0008d0c <sys_send_msg+0x16f>
c0008cf0:	68 78 05 00 00       	push   $0x578
c0008cf5:	68 86 a4 00 c0       	push   $0xc000a486
c0008cfa:	68 86 a4 00 c0       	push   $0xc000a486
c0008cff:	68 a9 a4 00 c0       	push   $0xc000a4a9
c0008d04:	e8 53 fe ff ff       	call   c0008b5c <assertion_failure>
c0008d09:	83 c4 10             	add    $0x10,%esp
c0008d0c:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d0f:	8b 40 50             	mov    0x50(%eax),%eax
c0008d12:	83 f8 1d             	cmp    $0x1d,%eax
c0008d15:	74 1c                	je     c0008d33 <sys_send_msg+0x196>
c0008d17:	68 79 05 00 00       	push   $0x579
c0008d1c:	68 86 a4 00 c0       	push   $0xc000a486
c0008d21:	68 86 a4 00 c0       	push   $0xc000a486
c0008d26:	68 bd a4 00 c0       	push   $0xc000a4bd
c0008d2b:	e8 2c fe ff ff       	call   c0008b5c <assertion_failure>
c0008d30:	83 c4 10             	add    $0x10,%esp
c0008d33:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d36:	8b 40 4c             	mov    0x4c(%eax),%eax
c0008d39:	85 c0                	test   %eax,%eax
c0008d3b:	74 1c                	je     c0008d59 <sys_send_msg+0x1bc>
c0008d3d:	68 7b 05 00 00       	push   $0x57b
c0008d42:	68 86 a4 00 c0       	push   $0xc000a486
c0008d47:	68 86 a4 00 c0       	push   $0xc000a486
c0008d4c:	68 da a4 00 c0       	push   $0xc000a4da
c0008d51:	e8 06 fe ff ff       	call   c0008b5c <assertion_failure>
c0008d56:	83 c4 10             	add    $0x10,%esp
c0008d59:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d5c:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0008d60:	84 c0                	test   %al,%al
c0008d62:	74 1c                	je     c0008d80 <sys_send_msg+0x1e3>
c0008d64:	68 7c 05 00 00       	push   $0x57c
c0008d69:	68 86 a4 00 c0       	push   $0xc000a486
c0008d6e:	68 86 a4 00 c0       	push   $0xc000a486
c0008d73:	68 ef a4 00 c0       	push   $0xc000a4ef
c0008d78:	e8 df fd ff ff       	call   c0008b5c <assertion_failure>
c0008d7d:	83 c4 10             	add    $0x10,%esp
c0008d80:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d83:	8b 40 54             	mov    0x54(%eax),%eax
c0008d86:	83 f8 1d             	cmp    $0x1d,%eax
c0008d89:	0f 84 1e 01 00 00    	je     c0008ead <sys_send_msg+0x310>
c0008d8f:	68 7d 05 00 00       	push   $0x57d
c0008d94:	68 86 a4 00 c0       	push   $0xc000a486
c0008d99:	68 86 a4 00 c0       	push   $0xc000a486
c0008d9e:	68 08 a5 00 c0       	push   $0xc000a508
c0008da3:	e8 b4 fd ff ff       	call   c0008b5c <assertion_failure>
c0008da8:	83 c4 10             	add    $0x10,%esp
c0008dab:	e9 fd 00 00 00       	jmp    c0008ead <sys_send_msg+0x310>
c0008db0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dba:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0008dbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dc0:	8b 40 58             	mov    0x58(%eax),%eax
c0008dc3:	85 c0                	test   %eax,%eax
c0008dc5:	75 15                	jne    c0008ddc <sys_send_msg+0x23f>
c0008dc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dca:	8b 55 10             	mov    0x10(%ebp),%edx
c0008dcd:	89 50 58             	mov    %edx,0x58(%eax)
c0008dd0:	8b 45 10             	mov    0x10(%ebp),%eax
c0008dd3:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c0008dda:	eb 33                	jmp    c0008e0f <sys_send_msg+0x272>
c0008ddc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ddf:	8b 40 58             	mov    0x58(%eax),%eax
c0008de2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008de5:	eb 0f                	jmp    c0008df6 <sys_send_msg+0x259>
c0008de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008dea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ded:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008df0:	8b 40 5c             	mov    0x5c(%eax),%eax
c0008df3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008df6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008dfa:	75 eb                	jne    c0008de7 <sys_send_msg+0x24a>
c0008dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008dff:	8b 55 10             	mov    0x10(%ebp),%edx
c0008e02:	89 50 5c             	mov    %edx,0x5c(%eax)
c0008e05:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e08:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c0008e0f:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e12:	8b 55 08             	mov    0x8(%ebp),%edx
c0008e15:	89 50 4c             	mov    %edx,0x4c(%eax)
c0008e18:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e1b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008e1e:	89 50 50             	mov    %edx,0x50(%eax)
c0008e21:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e24:	c6 40 48 01          	movb   $0x1,0x48(%eax)
c0008e28:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e2b:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0008e2f:	3c 01                	cmp    $0x1,%al
c0008e31:	74 1c                	je     c0008e4f <sys_send_msg+0x2b2>
c0008e33:	68 9e 05 00 00       	push   $0x59e
c0008e38:	68 86 a4 00 c0       	push   $0xc000a486
c0008e3d:	68 86 a4 00 c0       	push   $0xc000a486
c0008e42:	68 2c a5 00 c0       	push   $0xc000a52c
c0008e47:	e8 10 fd ff ff       	call   c0008b5c <assertion_failure>
c0008e4c:	83 c4 10             	add    $0x10,%esp
c0008e4f:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e52:	8b 40 50             	mov    0x50(%eax),%eax
c0008e55:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0008e58:	74 1c                	je     c0008e76 <sys_send_msg+0x2d9>
c0008e5a:	68 9f 05 00 00       	push   $0x59f
c0008e5f:	68 86 a4 00 c0       	push   $0xc000a486
c0008e64:	68 86 a4 00 c0       	push   $0xc000a486
c0008e69:	68 48 a5 00 c0       	push   $0xc000a548
c0008e6e:	e8 e9 fc ff ff       	call   c0008b5c <assertion_failure>
c0008e73:	83 c4 10             	add    $0x10,%esp
c0008e76:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e79:	8b 40 4c             	mov    0x4c(%eax),%eax
c0008e7c:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008e7f:	74 1c                	je     c0008e9d <sys_send_msg+0x300>
c0008e81:	68 a0 05 00 00       	push   $0x5a0
c0008e86:	68 86 a4 00 c0       	push   $0xc000a486
c0008e8b:	68 86 a4 00 c0       	push   $0xc000a486
c0008e90:	68 6a a5 00 c0       	push   $0xc000a56a
c0008e95:	e8 c2 fc ff ff       	call   c0008b5c <assertion_failure>
c0008e9a:	83 c4 10             	add    $0x10,%esp
c0008e9d:	83 ec 0c             	sub    $0xc,%esp
c0008ea0:	ff 75 10             	pushl  0x10(%ebp)
c0008ea3:	e8 3e 05 00 00       	call   c00093e6 <block>
c0008ea8:	83 c4 10             	add    $0x10,%esp
c0008eab:	eb 01                	jmp    c0008eae <sys_send_msg+0x311>
c0008ead:	90                   	nop
c0008eae:	b8 00 00 00 00       	mov    $0x0,%eax
c0008eb3:	c9                   	leave  
c0008eb4:	c3                   	ret    

c0008eb5 <sys_receive_msg>:
c0008eb5:	55                   	push   %ebp
c0008eb6:	89 e5                	mov    %esp,%ebp
c0008eb8:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0008ebe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ec5:	83 ec 0c             	sub    $0xc,%esp
c0008ec8:	ff 75 0c             	pushl  0xc(%ebp)
c0008ecb:	e8 6e b8 ff ff       	call   c000473e <pid2proc>
c0008ed0:	83 c4 10             	add    $0x10,%esp
c0008ed3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008ed6:	83 ec 0c             	sub    $0xc,%esp
c0008ed9:	ff 75 10             	pushl  0x10(%ebp)
c0008edc:	e8 79 b8 ff ff       	call   c000475a <proc2pid>
c0008ee1:	83 c4 10             	add    $0x10,%esp
c0008ee4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008ee7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008eee:	8b 45 10             	mov    0x10(%ebp),%eax
c0008ef1:	8b 40 60             	mov    0x60(%eax),%eax
c0008ef4:	85 c0                	test   %eax,%eax
c0008ef6:	0f 84 8a 00 00 00    	je     c0008f86 <sys_receive_msg+0xd1>
c0008efc:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0008f00:	74 09                	je     c0008f0b <sys_receive_msg+0x56>
c0008f02:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0008f09:	75 7b                	jne    c0008f86 <sys_receive_msg+0xd1>
c0008f0b:	83 ec 04             	sub    $0x4,%esp
c0008f0e:	6a 6c                	push   $0x6c
c0008f10:	6a 00                	push   $0x0
c0008f12:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0008f18:	50                   	push   %eax
c0008f19:	e8 a1 17 00 00       	call   c000a6bf <Memset>
c0008f1e:	83 c4 10             	add    $0x10,%esp
c0008f21:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
c0008f28:	02 00 00 
c0008f2b:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
c0008f32:	83 ec 08             	sub    $0x8,%esp
c0008f35:	ff 75 08             	pushl  0x8(%ebp)
c0008f38:	ff 75 e0             	pushl  -0x20(%ebp)
c0008f3b:	e8 3e b9 ff ff       	call   c000487e <v2l>
c0008f40:	83 c4 10             	add    $0x10,%esp
c0008f43:	89 c2                	mov    %eax,%edx
c0008f45:	83 ec 04             	sub    $0x4,%esp
c0008f48:	6a 6c                	push   $0x6c
c0008f4a:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0008f50:	50                   	push   %eax
c0008f51:	52                   	push   %edx
c0008f52:	e8 3a 17 00 00       	call   c000a691 <Memcpy>
c0008f57:	83 c4 10             	add    $0x10,%esp
c0008f5a:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f5d:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
c0008f64:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f67:	c7 40 54 1d 00 00 00 	movl   $0x1d,0x54(%eax)
c0008f6e:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f71:	c7 40 50 1d 00 00 00 	movl   $0x1d,0x50(%eax)
c0008f78:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f7b:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c0008f7f:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008f86:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008f8a:	0f 84 66 03 00 00    	je     c00092f6 <sys_receive_msg+0x441>
c0008f90:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0008f94:	75 1c                	jne    c0008fb2 <sys_receive_msg+0xfd>
c0008f96:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f99:	8b 40 58             	mov    0x58(%eax),%eax
c0008f9c:	85 c0                	test   %eax,%eax
c0008f9e:	74 75                	je     c0009015 <sys_receive_msg+0x160>
c0008fa0:	8b 45 10             	mov    0x10(%ebp),%eax
c0008fa3:	8b 40 58             	mov    0x58(%eax),%eax
c0008fa6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008fa9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0008fb0:	eb 63                	jmp    c0009015 <sys_receive_msg+0x160>
c0008fb2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0008fb6:	78 5d                	js     c0009015 <sys_receive_msg+0x160>
c0008fb8:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c0008fbc:	7f 57                	jg     c0009015 <sys_receive_msg+0x160>
c0008fbe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008fc1:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0008fc5:	3c 01                	cmp    $0x1,%al
c0008fc7:	75 4c                	jne    c0009015 <sys_receive_msg+0x160>
c0008fc9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008fcc:	8b 40 50             	mov    0x50(%eax),%eax
c0008fcf:	83 f8 0e             	cmp    $0xe,%eax
c0008fd2:	74 0b                	je     c0008fdf <sys_receive_msg+0x12a>
c0008fd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008fd7:	8b 40 50             	mov    0x50(%eax),%eax
c0008fda:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0008fdd:	75 36                	jne    c0009015 <sys_receive_msg+0x160>
c0008fdf:	8b 45 10             	mov    0x10(%ebp),%eax
c0008fe2:	8b 40 58             	mov    0x58(%eax),%eax
c0008fe5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008fe8:	eb 25                	jmp    c000900f <sys_receive_msg+0x15a>
c0008fea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008ff0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ff3:	8b 50 20             	mov    0x20(%eax),%edx
c0008ff6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ff9:	39 c2                	cmp    %eax,%edx
c0008ffb:	75 09                	jne    c0009006 <sys_receive_msg+0x151>
c0008ffd:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009004:	eb 0f                	jmp    c0009015 <sys_receive_msg+0x160>
c0009006:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009009:	8b 40 5c             	mov    0x5c(%eax),%eax
c000900c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000900f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009013:	75 d5                	jne    c0008fea <sys_receive_msg+0x135>
c0009015:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009019:	0f 85 43 02 00 00    	jne    c0009262 <sys_receive_msg+0x3ad>
c000901f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009022:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009025:	8b 45 10             	mov    0x10(%ebp),%eax
c0009028:	8b 40 78             	mov    0x78(%eax),%eax
c000902b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000902e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009031:	83 ec 08             	sub    $0x8,%esp
c0009034:	ff 75 10             	pushl  0x10(%ebp)
c0009037:	50                   	push   %eax
c0009038:	e8 ea b7 ff ff       	call   c0004827 <Seg2PhyAddrLDT>
c000903d:	83 c4 10             	add    $0x10,%esp
c0009040:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009043:	8b 55 08             	mov    0x8(%ebp),%edx
c0009046:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009049:	01 d0                	add    %edx,%eax
c000904b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000904e:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
c0009055:	8b 45 10             	mov    0x10(%ebp),%eax
c0009058:	8b 40 78             	mov    0x78(%eax),%eax
c000905b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000905e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0009061:	83 ec 08             	sub    $0x8,%esp
c0009064:	ff 75 dc             	pushl  -0x24(%ebp)
c0009067:	50                   	push   %eax
c0009068:	e8 ba b7 ff ff       	call   c0004827 <Seg2PhyAddrLDT>
c000906d:	83 c4 10             	add    $0x10,%esp
c0009070:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009073:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009076:	8b 40 4c             	mov    0x4c(%eax),%eax
c0009079:	89 c2                	mov    %eax,%edx
c000907b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000907e:	01 d0                	add    %edx,%eax
c0009080:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0009083:	83 ec 04             	sub    $0x4,%esp
c0009086:	ff 75 cc             	pushl  -0x34(%ebp)
c0009089:	ff 75 c0             	pushl  -0x40(%ebp)
c000908c:	ff 75 d0             	pushl  -0x30(%ebp)
c000908f:	e8 fd 15 00 00       	call   c000a691 <Memcpy>
c0009094:	83 c4 10             	add    $0x10,%esp
c0009097:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000909a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000909d:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
c00090a1:	75 27                	jne    c00090ca <sys_receive_msg+0x215>
c00090a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00090a6:	8b 40 68             	mov    0x68(%eax),%eax
c00090a9:	83 f8 06             	cmp    $0x6,%eax
c00090ac:	74 1c                	je     c00090ca <sys_receive_msg+0x215>
c00090ae:	68 2d 06 00 00       	push   $0x62d
c00090b3:	68 86 a4 00 c0       	push   $0xc000a486
c00090b8:	68 86 a4 00 c0       	push   $0xc000a486
c00090bd:	68 7f a5 00 c0       	push   $0xc000a57f
c00090c2:	e8 95 fa ff ff       	call   c0008b5c <assertion_failure>
c00090c7:	83 c4 10             	add    $0x10,%esp
c00090ca:	8b 45 10             	mov    0x10(%ebp),%eax
c00090cd:	8b 40 58             	mov    0x58(%eax),%eax
c00090d0:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00090d3:	75 18                	jne    c00090ed <sys_receive_msg+0x238>
c00090d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090d8:	8b 50 5c             	mov    0x5c(%eax),%edx
c00090db:	8b 45 10             	mov    0x10(%ebp),%eax
c00090de:	89 50 58             	mov    %edx,0x58(%eax)
c00090e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090e4:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c00090eb:	eb 16                	jmp    c0009103 <sys_receive_msg+0x24e>
c00090ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090f0:	8b 50 5c             	mov    0x5c(%eax),%edx
c00090f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090f6:	89 50 5c             	mov    %edx,0x5c(%eax)
c00090f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090fc:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c0009103:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009106:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c000910d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009110:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c0009114:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009117:	c7 40 50 1d 00 00 00 	movl   $0x1d,0x50(%eax)
c000911e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009121:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c0009128:	8b 45 10             	mov    0x10(%ebp),%eax
c000912b:	c7 40 54 1d 00 00 00 	movl   $0x1d,0x54(%eax)
c0009132:	8b 45 10             	mov    0x10(%ebp),%eax
c0009135:	c7 40 50 1d 00 00 00 	movl   $0x1d,0x50(%eax)
c000913c:	83 ec 0c             	sub    $0xc,%esp
c000913f:	ff 75 dc             	pushl  -0x24(%ebp)
c0009142:	e8 b1 02 00 00       	call   c00093f8 <unblock>
c0009147:	83 c4 10             	add    $0x10,%esp
c000914a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000914d:	8b 40 4c             	mov    0x4c(%eax),%eax
c0009150:	85 c0                	test   %eax,%eax
c0009152:	74 1c                	je     c0009170 <sys_receive_msg+0x2bb>
c0009154:	68 4e 06 00 00       	push   $0x64e
c0009159:	68 86 a4 00 c0       	push   $0xc000a486
c000915e:	68 86 a4 00 c0       	push   $0xc000a486
c0009163:	68 91 a5 00 c0       	push   $0xc000a591
c0009168:	e8 ef f9 ff ff       	call   c0008b5c <assertion_failure>
c000916d:	83 c4 10             	add    $0x10,%esp
c0009170:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009173:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0009177:	84 c0                	test   %al,%al
c0009179:	74 1c                	je     c0009197 <sys_receive_msg+0x2e2>
c000917b:	68 4f 06 00 00       	push   $0x64f
c0009180:	68 86 a4 00 c0       	push   $0xc000a486
c0009185:	68 86 a4 00 c0       	push   $0xc000a486
c000918a:	68 a9 a5 00 c0       	push   $0xc000a5a9
c000918f:	e8 c8 f9 ff ff       	call   c0008b5c <assertion_failure>
c0009194:	83 c4 10             	add    $0x10,%esp
c0009197:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000919a:	8b 40 50             	mov    0x50(%eax),%eax
c000919d:	83 f8 1d             	cmp    $0x1d,%eax
c00091a0:	74 1c                	je     c00091be <sys_receive_msg+0x309>
c00091a2:	68 50 06 00 00       	push   $0x650
c00091a7:	68 86 a4 00 c0       	push   $0xc000a486
c00091ac:	68 86 a4 00 c0       	push   $0xc000a486
c00091b1:	68 c4 a5 00 c0       	push   $0xc000a5c4
c00091b6:	e8 a1 f9 ff ff       	call   c0008b5c <assertion_failure>
c00091bb:	83 c4 10             	add    $0x10,%esp
c00091be:	8b 45 10             	mov    0x10(%ebp),%eax
c00091c1:	8b 40 4c             	mov    0x4c(%eax),%eax
c00091c4:	85 c0                	test   %eax,%eax
c00091c6:	74 1c                	je     c00091e4 <sys_receive_msg+0x32f>
c00091c8:	68 52 06 00 00       	push   $0x652
c00091cd:	68 86 a4 00 c0       	push   $0xc000a486
c00091d2:	68 86 a4 00 c0       	push   $0xc000a486
c00091d7:	68 da a4 00 c0       	push   $0xc000a4da
c00091dc:	e8 7b f9 ff ff       	call   c0008b5c <assertion_failure>
c00091e1:	83 c4 10             	add    $0x10,%esp
c00091e4:	8b 45 10             	mov    0x10(%ebp),%eax
c00091e7:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00091eb:	84 c0                	test   %al,%al
c00091ed:	74 1c                	je     c000920b <sys_receive_msg+0x356>
c00091ef:	68 53 06 00 00       	push   $0x653
c00091f4:	68 86 a4 00 c0       	push   $0xc000a486
c00091f9:	68 86 a4 00 c0       	push   $0xc000a486
c00091fe:	68 ef a4 00 c0       	push   $0xc000a4ef
c0009203:	e8 54 f9 ff ff       	call   c0008b5c <assertion_failure>
c0009208:	83 c4 10             	add    $0x10,%esp
c000920b:	8b 45 10             	mov    0x10(%ebp),%eax
c000920e:	8b 40 54             	mov    0x54(%eax),%eax
c0009211:	83 f8 1d             	cmp    $0x1d,%eax
c0009214:	74 1c                	je     c0009232 <sys_receive_msg+0x37d>
c0009216:	68 54 06 00 00       	push   $0x654
c000921b:	68 86 a4 00 c0       	push   $0xc000a486
c0009220:	68 86 a4 00 c0       	push   $0xc000a486
c0009225:	68 08 a5 00 c0       	push   $0xc000a508
c000922a:	e8 2d f9 ff ff       	call   c0008b5c <assertion_failure>
c000922f:	83 c4 10             	add    $0x10,%esp
c0009232:	8b 45 10             	mov    0x10(%ebp),%eax
c0009235:	8b 40 50             	mov    0x50(%eax),%eax
c0009238:	83 f8 1d             	cmp    $0x1d,%eax
c000923b:	0f 84 ae 00 00 00    	je     c00092ef <sys_receive_msg+0x43a>
c0009241:	68 55 06 00 00       	push   $0x655
c0009246:	68 86 a4 00 c0       	push   $0xc000a486
c000924b:	68 86 a4 00 c0       	push   $0xc000a486
c0009250:	68 e8 a5 00 c0       	push   $0xc000a5e8
c0009255:	e8 02 f9 ff ff       	call   c0008b5c <assertion_failure>
c000925a:	83 c4 10             	add    $0x10,%esp
c000925d:	e9 8d 00 00 00       	jmp    c00092ef <sys_receive_msg+0x43a>
c0009262:	8b 45 10             	mov    0x10(%ebp),%eax
c0009265:	c6 40 48 02          	movb   $0x2,0x48(%eax)
c0009269:	8b 45 10             	mov    0x10(%ebp),%eax
c000926c:	8b 55 08             	mov    0x8(%ebp),%edx
c000926f:	89 50 4c             	mov    %edx,0x4c(%eax)
c0009272:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009276:	75 0c                	jne    c0009284 <sys_receive_msg+0x3cf>
c0009278:	8b 45 10             	mov    0x10(%ebp),%eax
c000927b:	c7 40 54 0e 00 00 00 	movl   $0xe,0x54(%eax)
c0009282:	eb 09                	jmp    c000928d <sys_receive_msg+0x3d8>
c0009284:	8b 45 10             	mov    0x10(%ebp),%eax
c0009287:	8b 55 0c             	mov    0xc(%ebp),%edx
c000928a:	89 50 54             	mov    %edx,0x54(%eax)
c000928d:	8b 0d 5c e7 00 c0    	mov    0xc000e75c,%ecx
c0009293:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0009298:	89 c8                	mov    %ecx,%eax
c000929a:	f7 ea                	imul   %edx
c000929c:	c1 fa 06             	sar    $0x6,%edx
c000929f:	89 c8                	mov    %ecx,%eax
c00092a1:	c1 f8 1f             	sar    $0x1f,%eax
c00092a4:	29 c2                	sub    %eax,%edx
c00092a6:	89 d0                	mov    %edx,%eax
c00092a8:	8d 50 01             	lea    0x1(%eax),%edx
c00092ab:	89 d0                	mov    %edx,%eax
c00092ad:	c1 e0 02             	shl    $0x2,%eax
c00092b0:	01 d0                	add    %edx,%eax
c00092b2:	c1 e0 05             	shl    $0x5,%eax
c00092b5:	a3 5c e7 00 c0       	mov    %eax,0xc000e75c
c00092ba:	8b 45 10             	mov    0x10(%ebp),%eax
c00092bd:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00092c1:	3c 02                	cmp    $0x2,%al
c00092c3:	74 1c                	je     c00092e1 <sys_receive_msg+0x42c>
c00092c5:	68 8a 06 00 00       	push   $0x68a
c00092ca:	68 86 a4 00 c0       	push   $0xc000a486
c00092cf:	68 86 a4 00 c0       	push   $0xc000a486
c00092d4:	68 07 a6 00 c0       	push   $0xc000a607
c00092d9:	e8 7e f8 ff ff       	call   c0008b5c <assertion_failure>
c00092de:	83 c4 10             	add    $0x10,%esp
c00092e1:	83 ec 0c             	sub    $0xc,%esp
c00092e4:	ff 75 10             	pushl  0x10(%ebp)
c00092e7:	e8 fa 00 00 00       	call   c00093e6 <block>
c00092ec:	83 c4 10             	add    $0x10,%esp
c00092ef:	b8 00 00 00 00       	mov    $0x0,%eax
c00092f4:	eb 02                	jmp    c00092f8 <sys_receive_msg+0x443>
c00092f6:	90                   	nop
c00092f7:	90                   	nop
c00092f8:	c9                   	leave  
c00092f9:	c3                   	ret    

c00092fa <disp_str_colour_debug>:
c00092fa:	55                   	push   %ebp
c00092fb:	89 e5                	mov    %esp,%ebp
c00092fd:	90                   	nop
c00092fe:	5d                   	pop    %ebp
c00092ff:	c3                   	ret    

c0009300 <send_rec>:
c0009300:	55                   	push   %ebp
c0009301:	89 e5                	mov    %esp,%ebp
c0009303:	83 ec 18             	sub    $0x18,%esp
c0009306:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000930a:	74 28                	je     c0009334 <send_rec+0x34>
c000930c:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009310:	74 22                	je     c0009334 <send_rec+0x34>
c0009312:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009316:	74 1c                	je     c0009334 <send_rec+0x34>
c0009318:	68 b3 06 00 00       	push   $0x6b3
c000931d:	68 86 a4 00 c0       	push   $0xc000a486
c0009322:	68 86 a4 00 c0       	push   $0xc000a486
c0009327:	68 28 a6 00 c0       	push   $0xc000a628
c000932c:	e8 2b f8 ff ff       	call   c0008b5c <assertion_failure>
c0009331:	83 c4 10             	add    $0x10,%esp
c0009334:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009338:	75 12                	jne    c000934c <send_rec+0x4c>
c000933a:	83 ec 04             	sub    $0x4,%esp
c000933d:	6a 6c                	push   $0x6c
c000933f:	6a 00                	push   $0x0
c0009341:	ff 75 0c             	pushl  0xc(%ebp)
c0009344:	e8 76 13 00 00       	call   c000a6bf <Memset>
c0009349:	83 c4 10             	add    $0x10,%esp
c000934c:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009350:	74 22                	je     c0009374 <send_rec+0x74>
c0009352:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009356:	74 32                	je     c000938a <send_rec+0x8a>
c0009358:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000935c:	75 6e                	jne    c00093cc <send_rec+0xcc>
c000935e:	83 ec 08             	sub    $0x8,%esp
c0009361:	ff 75 10             	pushl  0x10(%ebp)
c0009364:	ff 75 0c             	pushl  0xc(%ebp)
c0009367:	e8 9c 93 ff ff       	call   c0002708 <send_msg>
c000936c:	83 c4 10             	add    $0x10,%esp
c000936f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009372:	eb 6b                	jmp    c00093df <send_rec+0xdf>
c0009374:	83 ec 08             	sub    $0x8,%esp
c0009377:	ff 75 10             	pushl  0x10(%ebp)
c000937a:	ff 75 0c             	pushl  0xc(%ebp)
c000937d:	e8 ac 93 ff ff       	call   c000272e <receive_msg>
c0009382:	83 c4 10             	add    $0x10,%esp
c0009385:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009388:	eb 55                	jmp    c00093df <send_rec+0xdf>
c000938a:	83 ec 08             	sub    $0x8,%esp
c000938d:	ff 75 10             	pushl  0x10(%ebp)
c0009390:	ff 75 0c             	pushl  0xc(%ebp)
c0009393:	e8 70 93 ff ff       	call   c0002708 <send_msg>
c0009398:	83 c4 10             	add    $0x10,%esp
c000939b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000939e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00093a2:	75 3a                	jne    c00093de <send_rec+0xde>
c00093a4:	83 ec 04             	sub    $0x4,%esp
c00093a7:	6a 6c                	push   $0x6c
c00093a9:	6a 00                	push   $0x0
c00093ab:	ff 75 0c             	pushl  0xc(%ebp)
c00093ae:	e8 0c 13 00 00       	call   c000a6bf <Memset>
c00093b3:	83 c4 10             	add    $0x10,%esp
c00093b6:	83 ec 08             	sub    $0x8,%esp
c00093b9:	ff 75 10             	pushl  0x10(%ebp)
c00093bc:	ff 75 0c             	pushl  0xc(%ebp)
c00093bf:	e8 6a 93 ff ff       	call   c000272e <receive_msg>
c00093c4:	83 c4 10             	add    $0x10,%esp
c00093c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00093ca:	eb 12                	jmp    c00093de <send_rec+0xde>
c00093cc:	83 ec 0c             	sub    $0xc,%esp
c00093cf:	68 64 a6 00 c0       	push   $0xc000a664
c00093d4:	e8 65 f7 ff ff       	call   c0008b3e <panic>
c00093d9:	83 c4 10             	add    $0x10,%esp
c00093dc:	eb 01                	jmp    c00093df <send_rec+0xdf>
c00093de:	90                   	nop
c00093df:	b8 00 00 00 00       	mov    $0x0,%eax
c00093e4:	c9                   	leave  
c00093e5:	c3                   	ret    

c00093e6 <block>:
c00093e6:	55                   	push   %ebp
c00093e7:	89 e5                	mov    %esp,%ebp
c00093e9:	83 ec 08             	sub    $0x8,%esp
c00093ec:	e8 87 b2 ff ff       	call   c0004678 <schedule_process>
c00093f1:	b8 00 00 00 00       	mov    $0x0,%eax
c00093f6:	c9                   	leave  
c00093f7:	c3                   	ret    

c00093f8 <unblock>:
c00093f8:	55                   	push   %ebp
c00093f9:	89 e5                	mov    %esp,%ebp
c00093fb:	83 ec 08             	sub    $0x8,%esp
c00093fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0009401:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0009405:	84 c0                	test   %al,%al
c0009407:	74 1c                	je     c0009425 <unblock+0x2d>
c0009409:	68 eb 06 00 00       	push   $0x6eb
c000940e:	68 86 a4 00 c0       	push   $0xc000a486
c0009413:	68 86 a4 00 c0       	push   $0xc000a486
c0009418:	68 79 a6 00 c0       	push   $0xc000a679
c000941d:	e8 3a f7 ff ff       	call   c0008b5c <assertion_failure>
c0009422:	83 c4 10             	add    $0x10,%esp
c0009425:	b8 00 00 00 00       	mov    $0x0,%eax
c000942a:	c9                   	leave  
c000942b:	c3                   	ret    

c000942c <get_ticks_ipc>:
c000942c:	55                   	push   %ebp
c000942d:	89 e5                	mov    %esp,%ebp
c000942f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009435:	83 ec 04             	sub    $0x4,%esp
c0009438:	6a 6c                	push   $0x6c
c000943a:	6a 00                	push   $0x0
c000943c:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000943f:	50                   	push   %eax
c0009440:	e8 7a 12 00 00       	call   c000a6bf <Memset>
c0009445:	83 c4 10             	add    $0x10,%esp
c0009448:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000944f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009456:	83 ec 04             	sub    $0x4,%esp
c0009459:	6a 01                	push   $0x1
c000945b:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000945e:	50                   	push   %eax
c000945f:	6a 03                	push   $0x3
c0009461:	e8 9a fe ff ff       	call   c0009300 <send_rec>
c0009466:	83 c4 10             	add    $0x10,%esp
c0009469:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000946c:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000946f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009472:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009475:	c9                   	leave  
c0009476:	c3                   	ret    

c0009477 <itoa>:
c0009477:	55                   	push   %ebp
c0009478:	89 e5                	mov    %esp,%ebp
c000947a:	53                   	push   %ebx
c000947b:	83 ec 14             	sub    $0x14,%esp
c000947e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009481:	99                   	cltd   
c0009482:	f7 7d 10             	idivl  0x10(%ebp)
c0009485:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009488:	8b 45 08             	mov    0x8(%ebp),%eax
c000948b:	99                   	cltd   
c000948c:	f7 7d 10             	idivl  0x10(%ebp)
c000948f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009492:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009496:	74 14                	je     c00094ac <itoa+0x35>
c0009498:	83 ec 04             	sub    $0x4,%esp
c000949b:	ff 75 10             	pushl  0x10(%ebp)
c000949e:	ff 75 0c             	pushl  0xc(%ebp)
c00094a1:	ff 75 f0             	pushl  -0x10(%ebp)
c00094a4:	e8 ce ff ff ff       	call   c0009477 <itoa>
c00094a9:	83 c4 10             	add    $0x10,%esp
c00094ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094af:	8d 58 30             	lea    0x30(%eax),%ebx
c00094b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00094b5:	8b 00                	mov    (%eax),%eax
c00094b7:	8d 48 01             	lea    0x1(%eax),%ecx
c00094ba:	8b 55 0c             	mov    0xc(%ebp),%edx
c00094bd:	89 0a                	mov    %ecx,(%edx)
c00094bf:	89 da                	mov    %ebx,%edx
c00094c1:	88 10                	mov    %dl,(%eax)
c00094c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00094c6:	8b 00                	mov    (%eax),%eax
c00094c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00094cb:	c9                   	leave  
c00094cc:	c3                   	ret    

c00094cd <i2a>:
c00094cd:	55                   	push   %ebp
c00094ce:	89 e5                	mov    %esp,%ebp
c00094d0:	53                   	push   %ebx
c00094d1:	83 ec 14             	sub    $0x14,%esp
c00094d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00094d7:	99                   	cltd   
c00094d8:	f7 7d 0c             	idivl  0xc(%ebp)
c00094db:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00094de:	8b 45 08             	mov    0x8(%ebp),%eax
c00094e1:	99                   	cltd   
c00094e2:	f7 7d 0c             	idivl  0xc(%ebp)
c00094e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00094e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00094ec:	74 14                	je     c0009502 <i2a+0x35>
c00094ee:	83 ec 04             	sub    $0x4,%esp
c00094f1:	ff 75 10             	pushl  0x10(%ebp)
c00094f4:	ff 75 0c             	pushl  0xc(%ebp)
c00094f7:	ff 75 f0             	pushl  -0x10(%ebp)
c00094fa:	e8 ce ff ff ff       	call   c00094cd <i2a>
c00094ff:	83 c4 10             	add    $0x10,%esp
c0009502:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009506:	7f 0a                	jg     c0009512 <i2a+0x45>
c0009508:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000950b:	83 c0 30             	add    $0x30,%eax
c000950e:	89 c3                	mov    %eax,%ebx
c0009510:	eb 08                	jmp    c000951a <i2a+0x4d>
c0009512:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009515:	83 c0 37             	add    $0x37,%eax
c0009518:	89 c3                	mov    %eax,%ebx
c000951a:	8b 45 10             	mov    0x10(%ebp),%eax
c000951d:	8b 00                	mov    (%eax),%eax
c000951f:	8d 48 01             	lea    0x1(%eax),%ecx
c0009522:	8b 55 10             	mov    0x10(%ebp),%edx
c0009525:	89 0a                	mov    %ecx,(%edx)
c0009527:	88 18                	mov    %bl,(%eax)
c0009529:	8b 45 10             	mov    0x10(%ebp),%eax
c000952c:	8b 00                	mov    (%eax),%eax
c000952e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009531:	c9                   	leave  
c0009532:	c3                   	ret    

c0009533 <inform_int>:
c0009533:	55                   	push   %ebp
c0009534:	89 e5                	mov    %esp,%ebp
c0009536:	83 ec 18             	sub    $0x18,%esp
c0009539:	83 ec 0c             	sub    $0xc,%esp
c000953c:	ff 75 08             	pushl  0x8(%ebp)
c000953f:	e8 fa b1 ff ff       	call   c000473e <pid2proc>
c0009544:	83 c4 10             	add    $0x10,%esp
c0009547:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000954a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000954d:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0009551:	0f be c0             	movsbl %al,%eax
c0009554:	83 e0 02             	and    $0x2,%eax
c0009557:	85 c0                	test   %eax,%eax
c0009559:	74 66                	je     c00095c1 <inform_int+0x8e>
c000955b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000955e:	8b 40 54             	mov    0x54(%eax),%eax
c0009561:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009566:	74 0b                	je     c0009573 <inform_int+0x40>
c0009568:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000956b:	8b 40 54             	mov    0x54(%eax),%eax
c000956e:	83 f8 0e             	cmp    $0xe,%eax
c0009571:	75 58                	jne    c00095cb <inform_int+0x98>
c0009573:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009576:	8b 40 4c             	mov    0x4c(%eax),%eax
c0009579:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000957f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009582:	8b 40 4c             	mov    0x4c(%eax),%eax
c0009585:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000958c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000958f:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
c0009596:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009599:	c7 40 54 1d 00 00 00 	movl   $0x1d,0x54(%eax)
c00095a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095a3:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c00095aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095ad:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c00095b1:	83 ec 0c             	sub    $0xc,%esp
c00095b4:	ff 75 f4             	pushl  -0xc(%ebp)
c00095b7:	e8 3c fe ff ff       	call   c00093f8 <unblock>
c00095bc:	83 c4 10             	add    $0x10,%esp
c00095bf:	eb 0a                	jmp    c00095cb <inform_int+0x98>
c00095c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095c4:	c7 40 60 01 00 00 00 	movl   $0x1,0x60(%eax)
c00095cb:	90                   	nop
c00095cc:	c9                   	leave  
c00095cd:	c3                   	ret    

c00095ce <strcmp>:
c00095ce:	55                   	push   %ebp
c00095cf:	89 e5                	mov    %esp,%ebp
c00095d1:	83 ec 10             	sub    $0x10,%esp
c00095d4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c00095d8:	74 06                	je     c00095e0 <strcmp+0x12>
c00095da:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00095de:	75 08                	jne    c00095e8 <strcmp+0x1a>
c00095e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00095e3:	2b 45 0c             	sub    0xc(%ebp),%eax
c00095e6:	eb 53                	jmp    c000963b <strcmp+0x6d>
c00095e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00095eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00095ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c00095f1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00095f4:	eb 18                	jmp    c000960e <strcmp+0x40>
c00095f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00095f9:	0f b6 10             	movzbl (%eax),%edx
c00095fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00095ff:	0f b6 00             	movzbl (%eax),%eax
c0009602:	38 c2                	cmp    %al,%dl
c0009604:	75 1e                	jne    c0009624 <strcmp+0x56>
c0009606:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000960a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000960e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009611:	0f b6 00             	movzbl (%eax),%eax
c0009614:	84 c0                	test   %al,%al
c0009616:	74 0d                	je     c0009625 <strcmp+0x57>
c0009618:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000961b:	0f b6 00             	movzbl (%eax),%eax
c000961e:	84 c0                	test   %al,%al
c0009620:	75 d4                	jne    c00095f6 <strcmp+0x28>
c0009622:	eb 01                	jmp    c0009625 <strcmp+0x57>
c0009624:	90                   	nop
c0009625:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009628:	0f b6 00             	movzbl (%eax),%eax
c000962b:	0f be d0             	movsbl %al,%edx
c000962e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009631:	0f b6 00             	movzbl (%eax),%eax
c0009634:	0f be c0             	movsbl %al,%eax
c0009637:	29 c2                	sub    %eax,%edx
c0009639:	89 d0                	mov    %edx,%eax
c000963b:	c9                   	leave  
c000963c:	c3                   	ret    

c000963d <create_user_process_address_space>:
c000963d:	55                   	push   %ebp
c000963e:	89 e5                	mov    %esp,%ebp
c0009640:	83 ec 18             	sub    $0x18,%esp
c0009643:	83 ec 08             	sub    $0x8,%esp
c0009646:	6a 00                	push   $0x0
c0009648:	6a 01                	push   $0x1
c000964a:	e8 d8 d2 ff ff       	call   c0006927 <alloc_memory>
c000964f:	83 c4 10             	add    $0x10,%esp
c0009652:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009655:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009658:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000965f:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009666:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009669:	05 ff 0f 00 00       	add    $0xfff,%eax
c000966e:	c1 e8 0c             	shr    $0xc,%eax
c0009671:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009674:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009677:	83 c0 07             	add    $0x7,%eax
c000967a:	c1 e8 03             	shr    $0x3,%eax
c000967d:	89 c2                	mov    %eax,%edx
c000967f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009682:	89 50 04             	mov    %edx,0x4(%eax)
c0009685:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009688:	8b 40 04             	mov    0x4(%eax),%eax
c000968b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009690:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009696:	85 c0                	test   %eax,%eax
c0009698:	0f 48 c2             	cmovs  %edx,%eax
c000969b:	c1 f8 0c             	sar    $0xc,%eax
c000969e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00096a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00096a4:	83 ec 08             	sub    $0x8,%esp
c00096a7:	6a 00                	push   $0x0
c00096a9:	50                   	push   %eax
c00096aa:	e8 78 d2 ff ff       	call   c0006927 <alloc_memory>
c00096af:	83 c4 10             	add    $0x10,%esp
c00096b2:	89 c2                	mov    %eax,%edx
c00096b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096b7:	89 10                	mov    %edx,(%eax)
c00096b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096bc:	83 ec 0c             	sub    $0xc,%esp
c00096bf:	50                   	push   %eax
c00096c0:	e8 f2 cd ff ff       	call   c00064b7 <init_bitmap>
c00096c5:	83 c4 10             	add    $0x10,%esp
c00096c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096cb:	c9                   	leave  
c00096cc:	c3                   	ret    

c00096cd <user_process>:
c00096cd:	55                   	push   %ebp
c00096ce:	89 e5                	mov    %esp,%ebp
c00096d0:	83 ec 28             	sub    $0x28,%esp
c00096d3:	e8 c3 81 ff ff       	call   c000189b <get_running_thread_pcb>
c00096d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00096db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096de:	05 00 10 00 00       	add    $0x1000,%eax
c00096e3:	89 c2                	mov    %eax,%edx
c00096e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096e8:	89 10                	mov    %edx,(%eax)
c00096ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096ed:	8b 00                	mov    (%eax),%eax
c00096ef:	8d 90 f0 fe ff ff    	lea    -0x110(%eax),%edx
c00096f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096f8:	89 10                	mov    %edx,(%eax)
c00096fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096fd:	8b 00                	mov    (%eax),%eax
c00096ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009702:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009706:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c000970c:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c0009712:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c0009718:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000971c:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c0009720:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009724:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c0009728:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c000972c:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c0009730:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c0009736:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c000973a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000973d:	89 50 34             	mov    %edx,0x34(%eax)
c0009740:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009744:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009747:	89 50 0c             	mov    %edx,0xc(%eax)
c000974a:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c000974e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009751:	89 50 04             	mov    %edx,0x4(%eax)
c0009754:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009758:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000975b:	89 50 08             	mov    %edx,0x8(%eax)
c000975e:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009762:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009765:	89 50 40             	mov    %edx,0x40(%eax)
c0009768:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c000976c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000976f:	89 10                	mov    %edx,(%eax)
c0009771:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009774:	8b 55 08             	mov    0x8(%ebp),%edx
c0009777:	89 50 30             	mov    %edx,0x30(%eax)
c000977a:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c000977e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009781:	89 50 38             	mov    %edx,0x38(%eax)
c0009784:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009787:	83 ec 0c             	sub    $0xc,%esp
c000978a:	50                   	push   %eax
c000978b:	e8 e0 7f ff ff       	call   c0001770 <restart>
c0009790:	83 c4 10             	add    $0x10,%esp
c0009793:	90                   	nop
c0009794:	c9                   	leave  
c0009795:	c3                   	ret    

c0009796 <process_execute>:
c0009796:	55                   	push   %ebp
c0009797:	89 e5                	mov    %esp,%ebp
c0009799:	83 ec 28             	sub    $0x28,%esp
c000979c:	e8 85 02 00 00       	call   c0009a26 <thread_init>
c00097a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00097a4:	83 ec 0c             	sub    $0xc,%esp
c00097a7:	ff 75 f4             	pushl  -0xc(%ebp)
c00097aa:	e8 c2 02 00 00       	call   c0009a71 <thread_create>
c00097af:	83 c4 10             	add    $0x10,%esp
c00097b2:	83 ec 08             	sub    $0x8,%esp
c00097b5:	6a 00                	push   $0x0
c00097b7:	6a 01                	push   $0x1
c00097b9:	e8 69 d1 ff ff       	call   c0006927 <alloc_memory>
c00097be:	83 c4 10             	add    $0x10,%esp
c00097c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00097c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097c7:	05 00 0c 00 00       	add    $0xc00,%eax
c00097cc:	83 ec 04             	sub    $0x4,%esp
c00097cf:	68 00 04 00 00       	push   $0x400
c00097d4:	68 00 fc ff ff       	push   $0xfffffc00
c00097d9:	50                   	push   %eax
c00097da:	e8 b2 0e 00 00       	call   c000a691 <Memcpy>
c00097df:	83 c4 10             	add    $0x10,%esp
c00097e2:	83 ec 0c             	sub    $0xc,%esp
c00097e5:	ff 75 f0             	pushl  -0x10(%ebp)
c00097e8:	e8 08 d1 ff ff       	call   c00068f5 <get_physical_address>
c00097ed:	83 c4 10             	add    $0x10,%esp
c00097f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00097f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097f6:	05 fc 0f 00 00       	add    $0xffc,%eax
c00097fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00097fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009801:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0009804:	89 10                	mov    %edx,(%eax)
c0009806:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009809:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000980c:	89 50 04             	mov    %edx,0x4(%eax)
c000980f:	e8 29 fe ff ff       	call   c000963d <create_user_process_address_space>
c0009814:	89 c2                	mov    %eax,%edx
c0009816:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009819:	89 50 08             	mov    %edx,0x8(%eax)
c000981c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000981f:	8b 00                	mov    (%eax),%eax
c0009821:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009824:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009827:	c7 40 10 cd 96 00 c0 	movl   $0xc00096cd,0x10(%eax)
c000982e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009831:	8b 55 08             	mov    0x8(%ebp),%edx
c0009834:	89 50 18             	mov    %edx,0x18(%eax)
c0009837:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000983a:	8b 55 0c             	mov    0xc(%ebp),%edx
c000983d:	89 50 1c             	mov    %edx,0x1c(%eax)
c0009840:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0009843:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009846:	89 50 20             	mov    %edx,0x20(%eax)
c0009849:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000984c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0009852:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009855:	8b 10                	mov    (%eax),%edx
c0009857:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000985a:	89 50 04             	mov    %edx,0x4(%eax)
c000985d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009860:	8b 50 04             	mov    0x4(%eax),%edx
c0009863:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009866:	89 50 08             	mov    %edx,0x8(%eax)
c0009869:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000986c:	8b 50 08             	mov    0x8(%eax),%edx
c000986f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009872:	89 50 0c             	mov    %edx,0xc(%eax)
c0009875:	83 ec 08             	sub    $0x8,%esp
c0009878:	ff 75 f4             	pushl  -0xc(%ebp)
c000987b:	68 ac ed 00 c0       	push   $0xc000edac
c0009880:	e8 6f 00 00 00       	call   c00098f4 <appendToDoubleLinkList>
c0009885:	83 c4 10             	add    $0x10,%esp
c0009888:	90                   	nop
c0009889:	c9                   	leave  
c000988a:	c3                   	ret    
c000988b:	66 90                	xchg   %ax,%ax
c000988d:	66 90                	xchg   %ax,%ax
c000988f:	90                   	nop

c0009890 <switch_to>:
c0009890:	56                   	push   %esi
c0009891:	57                   	push   %edi
c0009892:	53                   	push   %ebx
c0009893:	55                   	push   %ebp
c0009894:	89 e5                	mov    %esp,%ebp
c0009896:	8b 45 14             	mov    0x14(%ebp),%eax
c0009899:	89 20                	mov    %esp,(%eax)
c000989b:	8b 45 18             	mov    0x18(%ebp),%eax
c000989e:	8b 20                	mov    (%eax),%esp
c00098a0:	5d                   	pop    %ebp
c00098a1:	5b                   	pop    %ebx
c00098a2:	5f                   	pop    %edi
c00098a3:	5e                   	pop    %esi
c00098a4:	c3                   	ret    

c00098a5 <initDoubleLinkList>:
c00098a5:	55                   	push   %ebp
c00098a6:	89 e5                	mov    %esp,%ebp
c00098a8:	c7 05 ac ed 00 c0 00 	movl   $0x0,0xc000edac
c00098af:	00 00 00 
c00098b2:	c7 05 bc ed 00 c0 00 	movl   $0x0,0xc000edbc
c00098b9:	00 00 00 
c00098bc:	c7 05 b0 ed 00 c0 b8 	movl   $0xc000edb8,0xc000edb0
c00098c3:	ed 00 c0 
c00098c6:	c7 05 b8 ed 00 c0 ac 	movl   $0xc000edac,0xc000edb8
c00098cd:	ed 00 c0 
c00098d0:	90                   	nop
c00098d1:	5d                   	pop    %ebp
c00098d2:	c3                   	ret    

c00098d3 <isListEmpty>:
c00098d3:	55                   	push   %ebp
c00098d4:	89 e5                	mov    %esp,%ebp
c00098d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00098d9:	8b 40 04             	mov    0x4(%eax),%eax
c00098dc:	8b 55 08             	mov    0x8(%ebp),%edx
c00098df:	83 c2 0c             	add    $0xc,%edx
c00098e2:	39 d0                	cmp    %edx,%eax
c00098e4:	75 07                	jne    c00098ed <isListEmpty+0x1a>
c00098e6:	b8 01 00 00 00       	mov    $0x1,%eax
c00098eb:	eb 05                	jmp    c00098f2 <isListEmpty+0x1f>
c00098ed:	b8 00 00 00 00       	mov    $0x0,%eax
c00098f2:	5d                   	pop    %ebp
c00098f3:	c3                   	ret    

c00098f4 <appendToDoubleLinkList>:
c00098f4:	55                   	push   %ebp
c00098f5:	89 e5                	mov    %esp,%ebp
c00098f7:	83 ec 18             	sub    $0x18,%esp
c00098fa:	83 ec 08             	sub    $0x8,%esp
c00098fd:	6a 00                	push   $0x0
c00098ff:	6a 01                	push   $0x1
c0009901:	e8 21 d0 ff ff       	call   c0006927 <alloc_memory>
c0009906:	83 c4 10             	add    $0x10,%esp
c0009909:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000990c:	83 ec 04             	sub    $0x4,%esp
c000990f:	6a 0c                	push   $0xc
c0009911:	6a 00                	push   $0x0
c0009913:	ff 75 f4             	pushl  -0xc(%ebp)
c0009916:	e8 a4 0d 00 00       	call   c000a6bf <Memset>
c000991b:	83 c4 10             	add    $0x10,%esp
c000991e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009921:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009924:	89 50 08             	mov    %edx,0x8(%eax)
c0009927:	8b 45 08             	mov    0x8(%ebp),%eax
c000992a:	8b 50 0c             	mov    0xc(%eax),%edx
c000992d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009930:	89 10                	mov    %edx,(%eax)
c0009932:	8b 45 08             	mov    0x8(%ebp),%eax
c0009935:	8b 40 0c             	mov    0xc(%eax),%eax
c0009938:	85 c0                	test   %eax,%eax
c000993a:	74 0c                	je     c0009948 <appendToDoubleLinkList+0x54>
c000993c:	8b 45 08             	mov    0x8(%ebp),%eax
c000993f:	8b 40 0c             	mov    0xc(%eax),%eax
c0009942:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0009945:	89 50 04             	mov    %edx,0x4(%eax)
c0009948:	8b 45 08             	mov    0x8(%ebp),%eax
c000994b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000994e:	89 50 0c             	mov    %edx,0xc(%eax)
c0009951:	8b 45 08             	mov    0x8(%ebp),%eax
c0009954:	8d 50 0c             	lea    0xc(%eax),%edx
c0009957:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000995a:	89 50 04             	mov    %edx,0x4(%eax)
c000995d:	90                   	nop
c000995e:	c9                   	leave  
c000995f:	c3                   	ret    

c0009960 <insertToDoubleLinkList>:
c0009960:	55                   	push   %ebp
c0009961:	89 e5                	mov    %esp,%ebp
c0009963:	83 ec 18             	sub    $0x18,%esp
c0009966:	83 ec 08             	sub    $0x8,%esp
c0009969:	6a 00                	push   $0x0
c000996b:	6a 01                	push   $0x1
c000996d:	e8 b5 cf ff ff       	call   c0006927 <alloc_memory>
c0009972:	83 c4 10             	add    $0x10,%esp
c0009975:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009978:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000997b:	8b 55 0c             	mov    0xc(%ebp),%edx
c000997e:	89 50 08             	mov    %edx,0x8(%eax)
c0009981:	8b 45 08             	mov    0x8(%ebp),%eax
c0009984:	8b 50 04             	mov    0x4(%eax),%edx
c0009987:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000998a:	89 50 04             	mov    %edx,0x4(%eax)
c000998d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009990:	8b 40 04             	mov    0x4(%eax),%eax
c0009993:	85 c0                	test   %eax,%eax
c0009995:	74 0b                	je     c00099a2 <insertToDoubleLinkList+0x42>
c0009997:	8b 45 08             	mov    0x8(%ebp),%eax
c000999a:	8b 40 04             	mov    0x4(%eax),%eax
c000999d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00099a0:	89 10                	mov    %edx,(%eax)
c00099a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00099a5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00099a8:	89 50 04             	mov    %edx,0x4(%eax)
c00099ab:	8b 55 08             	mov    0x8(%ebp),%edx
c00099ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099b1:	89 10                	mov    %edx,(%eax)
c00099b3:	90                   	nop
c00099b4:	c9                   	leave  
c00099b5:	c3                   	ret    

c00099b6 <popFromDoubleLinkList>:
c00099b6:	55                   	push   %ebp
c00099b7:	89 e5                	mov    %esp,%ebp
c00099b9:	83 ec 10             	sub    $0x10,%esp
c00099bc:	ff 75 08             	pushl  0x8(%ebp)
c00099bf:	e8 0f ff ff ff       	call   c00098d3 <isListEmpty>
c00099c4:	83 c4 04             	add    $0x4,%esp
c00099c7:	3c 01                	cmp    $0x1,%al
c00099c9:	75 07                	jne    c00099d2 <popFromDoubleLinkList+0x1c>
c00099cb:	b8 00 00 00 00       	mov    $0x0,%eax
c00099d0:	eb 3a                	jmp    c0009a0c <popFromDoubleLinkList+0x56>
c00099d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00099d5:	8b 40 0c             	mov    0xc(%eax),%eax
c00099d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00099db:	8b 45 08             	mov    0x8(%ebp),%eax
c00099de:	8b 40 0c             	mov    0xc(%eax),%eax
c00099e1:	8b 00                	mov    (%eax),%eax
c00099e3:	85 c0                	test   %eax,%eax
c00099e5:	74 11                	je     c00099f8 <popFromDoubleLinkList+0x42>
c00099e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00099ea:	8b 40 0c             	mov    0xc(%eax),%eax
c00099ed:	8b 00                	mov    (%eax),%eax
c00099ef:	8b 55 08             	mov    0x8(%ebp),%edx
c00099f2:	83 c2 0c             	add    $0xc,%edx
c00099f5:	89 50 04             	mov    %edx,0x4(%eax)
c00099f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00099fb:	8b 40 0c             	mov    0xc(%eax),%eax
c00099fe:	8b 10                	mov    (%eax),%edx
c0009a00:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a03:	89 50 0c             	mov    %edx,0xc(%eax)
c0009a06:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009a09:	8b 40 08             	mov    0x8(%eax),%eax
c0009a0c:	c9                   	leave  
c0009a0d:	c3                   	ret    

c0009a0e <kernel_thread>:
c0009a0e:	55                   	push   %ebp
c0009a0f:	89 e5                	mov    %esp,%ebp
c0009a11:	83 ec 08             	sub    $0x8,%esp
c0009a14:	fb                   	sti    
c0009a15:	83 ec 0c             	sub    $0xc,%esp
c0009a18:	ff 75 0c             	pushl  0xc(%ebp)
c0009a1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a1e:	ff d0                	call   *%eax
c0009a20:	83 c4 10             	add    $0x10,%esp
c0009a23:	90                   	nop
c0009a24:	c9                   	leave  
c0009a25:	c3                   	ret    

c0009a26 <thread_init>:
c0009a26:	55                   	push   %ebp
c0009a27:	89 e5                	mov    %esp,%ebp
c0009a29:	83 ec 18             	sub    $0x18,%esp
c0009a2c:	83 ec 08             	sub    $0x8,%esp
c0009a2f:	6a 00                	push   $0x0
c0009a31:	6a 01                	push   $0x1
c0009a33:	e8 ef ce ff ff       	call   c0006927 <alloc_memory>
c0009a38:	83 c4 10             	add    $0x10,%esp
c0009a3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a3e:	83 ec 04             	sub    $0x4,%esp
c0009a41:	68 00 10 00 00       	push   $0x1000
c0009a46:	6a 00                	push   $0x0
c0009a48:	ff 75 f4             	pushl  -0xc(%ebp)
c0009a4b:	e8 6f 0c 00 00       	call   c000a6bf <Memset>
c0009a50:	83 c4 10             	add    $0x10,%esp
c0009a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a56:	05 00 10 00 00       	add    $0x1000,%eax
c0009a5b:	89 c2                	mov    %eax,%edx
c0009a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a60:	89 10                	mov    %edx,(%eax)
c0009a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a65:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0009a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a6f:	c9                   	leave  
c0009a70:	c3                   	ret    

c0009a71 <thread_create>:
c0009a71:	55                   	push   %ebp
c0009a72:	89 e5                	mov    %esp,%ebp
c0009a74:	83 ec 10             	sub    $0x10,%esp
c0009a77:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c0009a7e:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c0009a85:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a88:	8b 00                	mov    (%eax),%eax
c0009a8a:	2b 45 fc             	sub    -0x4(%ebp),%eax
c0009a8d:	89 c2                	mov    %eax,%edx
c0009a8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a92:	89 10                	mov    %edx,(%eax)
c0009a94:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a97:	8b 00                	mov    (%eax),%eax
c0009a99:	2b 45 f8             	sub    -0x8(%ebp),%eax
c0009a9c:	89 c2                	mov    %eax,%edx
c0009a9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009aa1:	89 10                	mov    %edx,(%eax)
c0009aa3:	90                   	nop
c0009aa4:	c9                   	leave  
c0009aa5:	c3                   	ret    

c0009aa6 <thread_start>:
c0009aa6:	55                   	push   %ebp
c0009aa7:	89 e5                	mov    %esp,%ebp
c0009aa9:	83 ec 18             	sub    $0x18,%esp
c0009aac:	e8 75 ff ff ff       	call   c0009a26 <thread_init>
c0009ab1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ab4:	83 ec 0c             	sub    $0xc,%esp
c0009ab7:	ff 75 f4             	pushl  -0xc(%ebp)
c0009aba:	e8 b2 ff ff ff       	call   c0009a71 <thread_create>
c0009abf:	83 c4 10             	add    $0x10,%esp
c0009ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ac5:	8b 00                	mov    (%eax),%eax
c0009ac7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009aca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009acd:	c7 40 10 0e 9a 00 c0 	movl   $0xc0009a0e,0x10(%eax)
c0009ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ad7:	8b 55 08             	mov    0x8(%ebp),%edx
c0009ada:	89 50 18             	mov    %edx,0x18(%eax)
c0009add:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ae0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009ae3:	89 50 1c             	mov    %edx,0x1c(%eax)
c0009ae6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ae9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0009aef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009af2:	8b 10                	mov    (%eax),%edx
c0009af4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009af7:	89 50 04             	mov    %edx,0x4(%eax)
c0009afa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009afd:	8b 50 04             	mov    0x4(%eax),%edx
c0009b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b03:	89 50 08             	mov    %edx,0x8(%eax)
c0009b06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b09:	8b 50 08             	mov    0x8(%eax),%edx
c0009b0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b0f:	89 50 0c             	mov    %edx,0xc(%eax)
c0009b12:	83 ec 08             	sub    $0x8,%esp
c0009b15:	ff 75 f4             	pushl  -0xc(%ebp)
c0009b18:	68 ac ed 00 c0       	push   $0xc000edac
c0009b1d:	e8 d2 fd ff ff       	call   c00098f4 <appendToDoubleLinkList>
c0009b22:	83 c4 10             	add    $0x10,%esp
c0009b25:	90                   	nop
c0009b26:	c9                   	leave  
c0009b27:	c3                   	ret    
