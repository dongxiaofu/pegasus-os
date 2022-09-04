
printf-demo:     file format elf32-i386


Disassembly of section .init:

08048314 <_init>:
 8048314:	f3 0f 1e fb          	endbr32 
 8048318:	53                   	push   %ebx
 8048319:	83 ec 08             	sub    $0x8,%esp
 804831c:	e8 9f 00 00 00       	call   80483c0 <__x86.get_pc_thunk.bx>
 8048321:	81 c3 df 1c 00 00    	add    $0x1cdf,%ebx
 8048327:	8b 83 f8 ff ff ff    	mov    -0x8(%ebx),%eax
 804832d:	85 c0                	test   %eax,%eax
 804832f:	74 02                	je     8048333 <_init+0x1f>
 8048331:	ff d0                	call   *%eax
 8048333:	83 c4 08             	add    $0x8,%esp
 8048336:	5b                   	pop    %ebx
 8048337:	c3                   	ret    

Disassembly of section .plt:

08048340 <.plt>:
 8048340:	ff 35 04 a0 04 08    	pushl  0x804a004
 8048346:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804834c:	00 00                	add    %al,(%eax)
	...

08048350 <printf@plt>:
 8048350:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048356:	68 00 00 00 00       	push   $0x0
 804835b:	e9 e0 ff ff ff       	jmp    8048340 <.plt>

08048360 <__libc_start_main@plt>:
 8048360:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048366:	68 08 00 00 00       	push   $0x8
 804836b:	e9 d0 ff ff ff       	jmp    8048340 <.plt>

Disassembly of section .text:

08048370 <_start>:
 8048370:	f3 0f 1e fb          	endbr32 
 8048374:	31 ed                	xor    %ebp,%ebp
 8048376:	5e                   	pop    %esi
 8048377:	89 e1                	mov    %esp,%ecx
 8048379:	83 e4 f0             	and    $0xfffffff0,%esp
 804837c:	50                   	push   %eax
 804837d:	54                   	push   %esp
 804837e:	52                   	push   %edx
 804837f:	e8 23 00 00 00       	call   80483a7 <_start+0x37>
 8048384:	81 c3 7c 1c 00 00    	add    $0x1c7c,%ebx
 804838a:	8d 83 c0 e5 ff ff    	lea    -0x1a40(%ebx),%eax
 8048390:	50                   	push   %eax
 8048391:	8d 83 60 e5 ff ff    	lea    -0x1aa0(%ebx),%eax
 8048397:	50                   	push   %eax
 8048398:	51                   	push   %ecx
 8048399:	56                   	push   %esi
 804839a:	c7 c0 ad 84 04 08    	mov    $0x80484ad,%eax
 80483a0:	50                   	push   %eax
 80483a1:	e8 ba ff ff ff       	call   8048360 <__libc_start_main@plt>
 80483a6:	f4                   	hlt    
 80483a7:	8b 1c 24             	mov    (%esp),%ebx
 80483aa:	c3                   	ret    

080483ab <.annobin_init.c>:
 80483ab:	66 90                	xchg   %ax,%ax
 80483ad:	66 90                	xchg   %ax,%ax
 80483af:	90                   	nop

080483b0 <_dl_relocate_static_pie>:
 80483b0:	f3 0f 1e fb          	endbr32 
 80483b4:	c3                   	ret    

080483b5 <.annobin__dl_relocate_static_pie.end>:
 80483b5:	66 90                	xchg   %ax,%ax
 80483b7:	66 90                	xchg   %ax,%ax
 80483b9:	66 90                	xchg   %ax,%ax
 80483bb:	66 90                	xchg   %ax,%ax
 80483bd:	66 90                	xchg   %ax,%ax
 80483bf:	90                   	nop

080483c0 <__x86.get_pc_thunk.bx>:
 80483c0:	8b 1c 24             	mov    (%esp),%ebx
 80483c3:	c3                   	ret    
 80483c4:	66 90                	xchg   %ax,%ax
 80483c6:	66 90                	xchg   %ax,%ax
 80483c8:	66 90                	xchg   %ax,%ax
 80483ca:	66 90                	xchg   %ax,%ax
 80483cc:	66 90                	xchg   %ax,%ax
 80483ce:	66 90                	xchg   %ax,%ax

080483d0 <deregister_tm_clones>:
 80483d0:	e8 d4 00 00 00       	call   80484a9 <__x86.get_pc_thunk.dx>
 80483d5:	81 c2 2b 1c 00 00    	add    $0x1c2b,%edx
 80483db:	8d 8a 18 00 00 00    	lea    0x18(%edx),%ecx
 80483e1:	8d 82 18 00 00 00    	lea    0x18(%edx),%eax
 80483e7:	39 c8                	cmp    %ecx,%eax
 80483e9:	74 1d                	je     8048408 <deregister_tm_clones+0x38>
 80483eb:	8b 82 f4 ff ff ff    	mov    -0xc(%edx),%eax
 80483f1:	85 c0                	test   %eax,%eax
 80483f3:	74 13                	je     8048408 <deregister_tm_clones+0x38>
 80483f5:	55                   	push   %ebp
 80483f6:	89 e5                	mov    %esp,%ebp
 80483f8:	83 ec 14             	sub    $0x14,%esp
 80483fb:	51                   	push   %ecx
 80483fc:	ff d0                	call   *%eax
 80483fe:	83 c4 10             	add    $0x10,%esp
 8048401:	c9                   	leave  
 8048402:	c3                   	ret    
 8048403:	90                   	nop
 8048404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048408:	c3                   	ret    
 8048409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08048410 <register_tm_clones>:
 8048410:	e8 94 00 00 00       	call   80484a9 <__x86.get_pc_thunk.dx>
 8048415:	81 c2 eb 1b 00 00    	add    $0x1beb,%edx
 804841b:	55                   	push   %ebp
 804841c:	89 e5                	mov    %esp,%ebp
 804841e:	53                   	push   %ebx
 804841f:	8d 8a 18 00 00 00    	lea    0x18(%edx),%ecx
 8048425:	8d 82 18 00 00 00    	lea    0x18(%edx),%eax
 804842b:	83 ec 04             	sub    $0x4,%esp
 804842e:	29 c8                	sub    %ecx,%eax
 8048430:	c1 f8 02             	sar    $0x2,%eax
 8048433:	89 c3                	mov    %eax,%ebx
 8048435:	c1 eb 1f             	shr    $0x1f,%ebx
 8048438:	01 d8                	add    %ebx,%eax
 804843a:	d1 f8                	sar    %eax
 804843c:	74 14                	je     8048452 <register_tm_clones+0x42>
 804843e:	8b 92 fc ff ff ff    	mov    -0x4(%edx),%edx
 8048444:	85 d2                	test   %edx,%edx
 8048446:	74 0a                	je     8048452 <register_tm_clones+0x42>
 8048448:	83 ec 08             	sub    $0x8,%esp
 804844b:	50                   	push   %eax
 804844c:	51                   	push   %ecx
 804844d:	ff d2                	call   *%edx
 804844f:	83 c4 10             	add    $0x10,%esp
 8048452:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048455:	c9                   	leave  
 8048456:	c3                   	ret    
 8048457:	89 f6                	mov    %esi,%esi
 8048459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048460 <__do_global_dtors_aux>:
 8048460:	f3 0f 1e fb          	endbr32 
 8048464:	55                   	push   %ebp
 8048465:	89 e5                	mov    %esp,%ebp
 8048467:	53                   	push   %ebx
 8048468:	e8 53 ff ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 804846d:	81 c3 93 1b 00 00    	add    $0x1b93,%ebx
 8048473:	83 ec 04             	sub    $0x4,%esp
 8048476:	80 bb 18 00 00 00 00 	cmpb   $0x0,0x18(%ebx)
 804847d:	75 0c                	jne    804848b <__do_global_dtors_aux+0x2b>
 804847f:	e8 4c ff ff ff       	call   80483d0 <deregister_tm_clones>
 8048484:	c6 83 18 00 00 00 01 	movb   $0x1,0x18(%ebx)
 804848b:	83 c4 04             	add    $0x4,%esp
 804848e:	5b                   	pop    %ebx
 804848f:	5d                   	pop    %ebp
 8048490:	c3                   	ret    
 8048491:	eb 0d                	jmp    80484a0 <frame_dummy>
 8048493:	90                   	nop
 8048494:	90                   	nop
 8048495:	90                   	nop
 8048496:	90                   	nop
 8048497:	90                   	nop
 8048498:	90                   	nop
 8048499:	90                   	nop
 804849a:	90                   	nop
 804849b:	90                   	nop
 804849c:	90                   	nop
 804849d:	90                   	nop
 804849e:	90                   	nop
 804849f:	90                   	nop

080484a0 <frame_dummy>:
 80484a0:	f3 0f 1e fb          	endbr32 
 80484a4:	e9 67 ff ff ff       	jmp    8048410 <register_tm_clones>

080484a9 <__x86.get_pc_thunk.dx>:
 80484a9:	8b 14 24             	mov    (%esp),%edx
 80484ac:	c3                   	ret    

080484ad <main>:
 80484ad:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 80484b1:	83 e4 f0             	and    $0xfffffff0,%esp
 80484b4:	ff 71 fc             	pushl  -0x4(%ecx)
 80484b7:	55                   	push   %ebp
 80484b8:	89 e5                	mov    %esp,%ebp
 80484ba:	57                   	push   %edi
 80484bb:	51                   	push   %ecx
 80484bc:	83 ec 70             	sub    $0x70,%esp
 80484bf:	c7 45 94 78 20 69 73 	movl   $0x73692078,-0x6c(%ebp)
 80484c6:	c7 45 98 20 25 70 2c 	movl   $0x2c702520,-0x68(%ebp)
 80484cd:	c7 45 9c 20 25 64 0a 	movl   $0xa642520,-0x64(%ebp)
 80484d4:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
 80484db:	8d 55 a4             	lea    -0x5c(%ebp),%edx
 80484de:	b8 00 00 00 00       	mov    $0x0,%eax
 80484e3:	b9 15 00 00 00       	mov    $0x15,%ecx
 80484e8:	89 d7                	mov    %edx,%edi
 80484ea:	f3 ab                	rep stos %eax,%es:(%edi)
 80484ec:	c7 45 90 0a 00 00 00 	movl   $0xa,-0x70(%ebp)
 80484f3:	8b 45 90             	mov    -0x70(%ebp),%eax
 80484f6:	83 ec 04             	sub    $0x4,%esp
 80484f9:	50                   	push   %eax
 80484fa:	8d 45 90             	lea    -0x70(%ebp),%eax
 80484fd:	50                   	push   %eax
 80484fe:	8d 45 94             	lea    -0x6c(%ebp),%eax
 8048501:	50                   	push   %eax
 8048502:	e8 49 fe ff ff       	call   8048350 <printf@plt>
 8048507:	83 c4 10             	add    $0x10,%esp
 804850a:	e8 21 00 00 00       	call   8048530 <f>
 804850f:	83 ec 0c             	sub    $0xc,%esp
 8048512:	6a 0a                	push   $0xa
 8048514:	e8 21 00 00 00       	call   804853a <f2>
 8048519:	83 c4 10             	add    $0x10,%esp
 804851c:	e8 21 00 00 00       	call   8048542 <f3>
 8048521:	b8 00 00 00 00       	mov    $0x0,%eax
 8048526:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048529:	59                   	pop    %ecx
 804852a:	5f                   	pop    %edi
 804852b:	5d                   	pop    %ebp
 804852c:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804852f:	c3                   	ret    

08048530 <f>:
 8048530:	55                   	push   %ebp
 8048531:	89 e5                	mov    %esp,%ebp
 8048533:	b8 00 00 00 00       	mov    $0x0,%eax
 8048538:	5d                   	pop    %ebp
 8048539:	c3                   	ret    

0804853a <f2>:
 804853a:	55                   	push   %ebp
 804853b:	89 e5                	mov    %esp,%ebp
 804853d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048540:	5d                   	pop    %ebp
 8048541:	c3                   	ret    

08048542 <f3>:
 8048542:	55                   	push   %ebp
 8048543:	89 e5                	mov    %esp,%ebp
 8048545:	83 ec 10             	sub    $0x10,%esp
 8048548:	c7 45 fc 0a 00 00 00 	movl   $0xa,-0x4(%ebp)
 804854f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048552:	c9                   	leave  
 8048553:	c3                   	ret    
 8048554:	66 90                	xchg   %ax,%ax
 8048556:	66 90                	xchg   %ax,%ax
 8048558:	66 90                	xchg   %ax,%ax
 804855a:	66 90                	xchg   %ax,%ax
 804855c:	66 90                	xchg   %ax,%ax
 804855e:	66 90                	xchg   %ax,%ax

08048560 <__libc_csu_init>:
 8048560:	f3 0f 1e fb          	endbr32 
 8048564:	55                   	push   %ebp
 8048565:	57                   	push   %edi
 8048566:	56                   	push   %esi
 8048567:	53                   	push   %ebx
 8048568:	e8 53 fe ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 804856d:	81 c3 93 1a 00 00    	add    $0x1a93,%ebx
 8048573:	83 ec 0c             	sub    $0xc,%esp
 8048576:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 804857a:	e8 95 fd ff ff       	call   8048314 <_init>
 804857f:	8d b3 08 ff ff ff    	lea    -0xf8(%ebx),%esi
 8048585:	8d 83 04 ff ff ff    	lea    -0xfc(%ebx),%eax
 804858b:	29 c6                	sub    %eax,%esi
 804858d:	c1 fe 02             	sar    $0x2,%esi
 8048590:	74 23                	je     80485b5 <__libc_csu_init+0x55>
 8048592:	31 ff                	xor    %edi,%edi
 8048594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048598:	83 ec 04             	sub    $0x4,%esp
 804859b:	55                   	push   %ebp
 804859c:	ff 74 24 2c          	pushl  0x2c(%esp)
 80485a0:	ff 74 24 2c          	pushl  0x2c(%esp)
 80485a4:	ff 94 bb 04 ff ff ff 	call   *-0xfc(%ebx,%edi,4)
 80485ab:	83 c7 01             	add    $0x1,%edi
 80485ae:	83 c4 10             	add    $0x10,%esp
 80485b1:	39 fe                	cmp    %edi,%esi
 80485b3:	75 e3                	jne    8048598 <__libc_csu_init+0x38>
 80485b5:	83 c4 0c             	add    $0xc,%esp
 80485b8:	5b                   	pop    %ebx
 80485b9:	5e                   	pop    %esi
 80485ba:	5f                   	pop    %edi
 80485bb:	5d                   	pop    %ebp
 80485bc:	c3                   	ret    

080485bd <.annobin___libc_csu_fini.start>:
 80485bd:	8d 76 00             	lea    0x0(%esi),%esi

080485c0 <__libc_csu_fini>:
 80485c0:	f3 0f 1e fb          	endbr32 
 80485c4:	c3                   	ret    

Disassembly of section .fini:

080485c8 <_fini>:
 80485c8:	f3 0f 1e fb          	endbr32 
 80485cc:	53                   	push   %ebx
 80485cd:	83 ec 08             	sub    $0x8,%esp
 80485d0:	e8 eb fd ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 80485d5:	81 c3 2b 1a 00 00    	add    $0x1a2b,%ebx
 80485db:	83 c4 08             	add    $0x8,%esp
 80485de:	5b                   	pop    %ebx
 80485df:	c3                   	ret    
