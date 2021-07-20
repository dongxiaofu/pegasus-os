
tmp:     file format elf32-i386


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
 804838a:	8d 83 b0 e5 ff ff    	lea    -0x1a50(%ebx),%eax
 8048390:	50                   	push   %eax
 8048391:	8d 83 50 e5 ff ff    	lea    -0x1ab0(%ebx),%eax
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
 80484ba:	51                   	push   %ecx
 80484bb:	83 ec 24             	sub    $0x24,%esp
 80484be:	c7 45 ea 68 65 6c 6c 	movl   $0x6c6c6568,-0x16(%ebp)
 80484c5:	66 c7 45 ee 6f 00    	movw   $0x6f,-0x12(%ebp)
 80484cb:	8d 45 ea             	lea    -0x16(%ebp),%eax
 80484ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80484d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80484d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80484d9:	8d 45 ea             	lea    -0x16(%ebp),%eax
 80484dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80484df:	29 c2                	sub    %eax,%edx
 80484e1:	89 d0                	mov    %edx,%eax
 80484e3:	83 ec 08             	sub    $0x8,%esp
 80484e6:	50                   	push   %eax
 80484e7:	68 dc 85 04 08       	push   $0x80485dc
 80484ec:	e8 5f fe ff ff       	call   8048350 <printf@plt>
 80484f1:	83 c4 10             	add    $0x10,%esp
 80484f4:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 80484fb:	c7 45 e0 02 00 00 00 	movl   $0x2,-0x20(%ebp)
 8048502:	c7 45 e4 03 00 00 00 	movl   $0x3,-0x1c(%ebp)
 8048509:	8d 45 dc             	lea    -0x24(%ebp),%eax
 804850c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804850f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
 8048513:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
 8048517:	8d 45 dc             	lea    -0x24(%ebp),%eax
 804851a:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804851d:	29 c2                	sub    %eax,%edx
 804851f:	89 d0                	mov    %edx,%eax
 8048521:	c1 f8 02             	sar    $0x2,%eax
 8048524:	83 ec 08             	sub    $0x8,%esp
 8048527:	50                   	push   %eax
 8048528:	68 ef 85 04 08       	push   $0x80485ef
 804852d:	e8 1e fe ff ff       	call   8048350 <printf@plt>
 8048532:	83 c4 10             	add    $0x10,%esp
 8048535:	b8 00 00 00 00       	mov    $0x0,%eax
 804853a:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 804853d:	c9                   	leave  
 804853e:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048541:	c3                   	ret    
 8048542:	66 90                	xchg   %ax,%ax
 8048544:	66 90                	xchg   %ax,%ax
 8048546:	66 90                	xchg   %ax,%ax
 8048548:	66 90                	xchg   %ax,%ax
 804854a:	66 90                	xchg   %ax,%ax
 804854c:	66 90                	xchg   %ax,%ax
 804854e:	66 90                	xchg   %ax,%ax

08048550 <__libc_csu_init>:
 8048550:	f3 0f 1e fb          	endbr32 
 8048554:	55                   	push   %ebp
 8048555:	57                   	push   %edi
 8048556:	56                   	push   %esi
 8048557:	53                   	push   %ebx
 8048558:	e8 63 fe ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 804855d:	81 c3 a3 1a 00 00    	add    $0x1aa3,%ebx
 8048563:	83 ec 0c             	sub    $0xc,%esp
 8048566:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 804856a:	e8 a5 fd ff ff       	call   8048314 <_init>
 804856f:	8d b3 08 ff ff ff    	lea    -0xf8(%ebx),%esi
 8048575:	8d 83 04 ff ff ff    	lea    -0xfc(%ebx),%eax
 804857b:	29 c6                	sub    %eax,%esi
 804857d:	c1 fe 02             	sar    $0x2,%esi
 8048580:	74 23                	je     80485a5 <__libc_csu_init+0x55>
 8048582:	31 ff                	xor    %edi,%edi
 8048584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048588:	83 ec 04             	sub    $0x4,%esp
 804858b:	55                   	push   %ebp
 804858c:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048590:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048594:	ff 94 bb 04 ff ff ff 	call   *-0xfc(%ebx,%edi,4)
 804859b:	83 c7 01             	add    $0x1,%edi
 804859e:	83 c4 10             	add    $0x10,%esp
 80485a1:	39 fe                	cmp    %edi,%esi
 80485a3:	75 e3                	jne    8048588 <__libc_csu_init+0x38>
 80485a5:	83 c4 0c             	add    $0xc,%esp
 80485a8:	5b                   	pop    %ebx
 80485a9:	5e                   	pop    %esi
 80485aa:	5f                   	pop    %edi
 80485ab:	5d                   	pop    %ebp
 80485ac:	c3                   	ret    

080485ad <.annobin___libc_csu_fini.start>:
 80485ad:	8d 76 00             	lea    0x0(%esi),%esi

080485b0 <__libc_csu_fini>:
 80485b0:	f3 0f 1e fb          	endbr32 
 80485b4:	c3                   	ret    

Disassembly of section .fini:

080485b8 <_fini>:
 80485b8:	f3 0f 1e fb          	endbr32 
 80485bc:	53                   	push   %ebx
 80485bd:	83 ec 08             	sub    $0x8,%esp
 80485c0:	e8 fb fd ff ff       	call   80483c0 <__x86.get_pc_thunk.bx>
 80485c5:	81 c3 3b 1a 00 00    	add    $0x1a3b,%ebx
 80485cb:	83 c4 08             	add    $0x8,%esp
 80485ce:	5b                   	pop    %ebx
 80485cf:	c3                   	ret    
