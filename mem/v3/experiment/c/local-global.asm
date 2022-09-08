
local-global:     file format elf32-i386


Disassembly of section .init:

080482f4 <_init>:
 80482f4:	f3 0f 1e fb          	endbr32 
 80482f8:	53                   	push   %ebx
 80482f9:	83 ec 08             	sub    $0x8,%esp
 80482fc:	e8 8f 00 00 00       	call   8048390 <__x86.get_pc_thunk.bx>
 8048301:	81 c3 ff 1c 00 00    	add    $0x1cff,%ebx
 8048307:	8b 83 f8 ff ff ff    	mov    -0x8(%ebx),%eax
 804830d:	85 c0                	test   %eax,%eax
 804830f:	74 02                	je     8048313 <_init+0x1f>
 8048311:	ff d0                	call   *%eax
 8048313:	83 c4 08             	add    $0x8,%esp
 8048316:	5b                   	pop    %ebx
 8048317:	c3                   	ret    

Disassembly of section .plt:

08048320 <.plt>:
 8048320:	ff 35 04 a0 04 08    	pushl  0x804a004
 8048326:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804832c:	00 00                	add    %al,(%eax)
	...

08048330 <__libc_start_main@plt>:
 8048330:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048336:	68 00 00 00 00       	push   $0x0
 804833b:	e9 e0 ff ff ff       	jmp    8048320 <.plt>

Disassembly of section .text:

08048340 <_start>:
 8048340:	f3 0f 1e fb          	endbr32 
 8048344:	31 ed                	xor    %ebp,%ebp
 8048346:	5e                   	pop    %esi
 8048347:	89 e1                	mov    %esp,%ecx
 8048349:	83 e4 f0             	and    $0xfffffff0,%esp
 804834c:	50                   	push   %eax
 804834d:	54                   	push   %esp
 804834e:	52                   	push   %edx
 804834f:	e8 23 00 00 00       	call   8048377 <_start+0x37>
 8048354:	81 c3 ac 1c 00 00    	add    $0x1cac,%ebx
 804835a:	8d 83 a0 e5 ff ff    	lea    -0x1a60(%ebx),%eax
 8048360:	50                   	push   %eax
 8048361:	8d 83 40 e5 ff ff    	lea    -0x1ac0(%ebx),%eax
 8048367:	50                   	push   %eax
 8048368:	51                   	push   %ecx
 8048369:	56                   	push   %esi
 804836a:	c7 c0 7d 84 04 08    	mov    $0x804847d,%eax
 8048370:	50                   	push   %eax
 8048371:	e8 ba ff ff ff       	call   8048330 <__libc_start_main@plt>
 8048376:	f4                   	hlt    
 8048377:	8b 1c 24             	mov    (%esp),%ebx
 804837a:	c3                   	ret    

0804837b <.annobin_init.c>:
 804837b:	66 90                	xchg   %ax,%ax
 804837d:	66 90                	xchg   %ax,%ax
 804837f:	90                   	nop

08048380 <_dl_relocate_static_pie>:
 8048380:	f3 0f 1e fb          	endbr32 
 8048384:	c3                   	ret    

08048385 <.annobin__dl_relocate_static_pie.end>:
 8048385:	66 90                	xchg   %ax,%ax
 8048387:	66 90                	xchg   %ax,%ax
 8048389:	66 90                	xchg   %ax,%ax
 804838b:	66 90                	xchg   %ax,%ax
 804838d:	66 90                	xchg   %ax,%ax
 804838f:	90                   	nop

08048390 <__x86.get_pc_thunk.bx>:
 8048390:	8b 1c 24             	mov    (%esp),%ebx
 8048393:	c3                   	ret    
 8048394:	66 90                	xchg   %ax,%ax
 8048396:	66 90                	xchg   %ax,%ax
 8048398:	66 90                	xchg   %ax,%ax
 804839a:	66 90                	xchg   %ax,%ax
 804839c:	66 90                	xchg   %ax,%ax
 804839e:	66 90                	xchg   %ax,%ax

080483a0 <deregister_tm_clones>:
 80483a0:	e8 d4 00 00 00       	call   8048479 <__x86.get_pc_thunk.dx>
 80483a5:	81 c2 5b 1c 00 00    	add    $0x1c5b,%edx
 80483ab:	8d 8a 14 00 00 00    	lea    0x14(%edx),%ecx
 80483b1:	8d 82 14 00 00 00    	lea    0x14(%edx),%eax
 80483b7:	39 c8                	cmp    %ecx,%eax
 80483b9:	74 1d                	je     80483d8 <deregister_tm_clones+0x38>
 80483bb:	8b 82 f4 ff ff ff    	mov    -0xc(%edx),%eax
 80483c1:	85 c0                	test   %eax,%eax
 80483c3:	74 13                	je     80483d8 <deregister_tm_clones+0x38>
 80483c5:	55                   	push   %ebp
 80483c6:	89 e5                	mov    %esp,%ebp
 80483c8:	83 ec 14             	sub    $0x14,%esp
 80483cb:	51                   	push   %ecx
 80483cc:	ff d0                	call   *%eax
 80483ce:	83 c4 10             	add    $0x10,%esp
 80483d1:	c9                   	leave  
 80483d2:	c3                   	ret    
 80483d3:	90                   	nop
 80483d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483d8:	c3                   	ret    
 80483d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

080483e0 <register_tm_clones>:
 80483e0:	e8 94 00 00 00       	call   8048479 <__x86.get_pc_thunk.dx>
 80483e5:	81 c2 1b 1c 00 00    	add    $0x1c1b,%edx
 80483eb:	55                   	push   %ebp
 80483ec:	89 e5                	mov    %esp,%ebp
 80483ee:	53                   	push   %ebx
 80483ef:	8d 8a 14 00 00 00    	lea    0x14(%edx),%ecx
 80483f5:	8d 82 14 00 00 00    	lea    0x14(%edx),%eax
 80483fb:	83 ec 04             	sub    $0x4,%esp
 80483fe:	29 c8                	sub    %ecx,%eax
 8048400:	c1 f8 02             	sar    $0x2,%eax
 8048403:	89 c3                	mov    %eax,%ebx
 8048405:	c1 eb 1f             	shr    $0x1f,%ebx
 8048408:	01 d8                	add    %ebx,%eax
 804840a:	d1 f8                	sar    %eax
 804840c:	74 14                	je     8048422 <register_tm_clones+0x42>
 804840e:	8b 92 fc ff ff ff    	mov    -0x4(%edx),%edx
 8048414:	85 d2                	test   %edx,%edx
 8048416:	74 0a                	je     8048422 <register_tm_clones+0x42>
 8048418:	83 ec 08             	sub    $0x8,%esp
 804841b:	50                   	push   %eax
 804841c:	51                   	push   %ecx
 804841d:	ff d2                	call   *%edx
 804841f:	83 c4 10             	add    $0x10,%esp
 8048422:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048425:	c9                   	leave  
 8048426:	c3                   	ret    
 8048427:	89 f6                	mov    %esi,%esi
 8048429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048430 <__do_global_dtors_aux>:
 8048430:	f3 0f 1e fb          	endbr32 
 8048434:	55                   	push   %ebp
 8048435:	89 e5                	mov    %esp,%ebp
 8048437:	53                   	push   %ebx
 8048438:	e8 53 ff ff ff       	call   8048390 <__x86.get_pc_thunk.bx>
 804843d:	81 c3 c3 1b 00 00    	add    $0x1bc3,%ebx
 8048443:	83 ec 04             	sub    $0x4,%esp
 8048446:	80 bb 14 00 00 00 00 	cmpb   $0x0,0x14(%ebx)
 804844d:	75 0c                	jne    804845b <__do_global_dtors_aux+0x2b>
 804844f:	e8 4c ff ff ff       	call   80483a0 <deregister_tm_clones>
 8048454:	c6 83 14 00 00 00 01 	movb   $0x1,0x14(%ebx)
 804845b:	83 c4 04             	add    $0x4,%esp
 804845e:	5b                   	pop    %ebx
 804845f:	5d                   	pop    %ebp
 8048460:	c3                   	ret    
 8048461:	eb 0d                	jmp    8048470 <frame_dummy>
 8048463:	90                   	nop
 8048464:	90                   	nop
 8048465:	90                   	nop
 8048466:	90                   	nop
 8048467:	90                   	nop
 8048468:	90                   	nop
 8048469:	90                   	nop
 804846a:	90                   	nop
 804846b:	90                   	nop
 804846c:	90                   	nop
 804846d:	90                   	nop
 804846e:	90                   	nop
 804846f:	90                   	nop

08048470 <frame_dummy>:
 8048470:	f3 0f 1e fb          	endbr32 
 8048474:	e9 67 ff ff ff       	jmp    80483e0 <register_tm_clones>

08048479 <__x86.get_pc_thunk.dx>:
 8048479:	8b 14 24             	mov    (%esp),%edx
 804847c:	c3                   	ret    

0804847d <main>:
 804847d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048481:	83 e4 f0             	and    $0xfffffff0,%esp
 8048484:	ff 71 fc             	pushl  -0x4(%ecx)
 8048487:	55                   	push   %ebp
 8048488:	89 e5                	mov    %esp,%ebp
 804848a:	51                   	push   %ecx
 804848b:	83 ec 24             	sub    $0x24,%esp
 804848e:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
 8048495:	c7 45 f0 14 00 00 00 	movl   $0x14,-0x10(%ebp)
 804849c:	c7 45 ec 1e 00 00 00 	movl   $0x1e,-0x14(%ebp)
 80484a3:	c7 45 e8 28 00 00 00 	movl   $0x28,-0x18(%ebp)
 80484aa:	c7 45 e4 32 00 00 00 	movl   $0x32,-0x1c(%ebp)
 80484b1:	83 ec 0c             	sub    $0xc,%esp
 80484b4:	ff 75 e8             	pushl  -0x18(%ebp)
 80484b7:	ff 75 f0             	pushl  -0x10(%ebp)
 80484ba:	ff 75 ec             	pushl  -0x14(%ebp)
 80484bd:	ff 75 e4             	pushl  -0x1c(%ebp)
 80484c0:	ff 75 f4             	pushl  -0xc(%ebp)
 80484c3:	e8 13 00 00 00       	call   80484db <f1>
 80484c8:	83 c4 20             	add    $0x20,%esp
 80484cb:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80484ce:	b8 00 00 00 00       	mov    $0x0,%eax
 80484d3:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 80484d6:	c9                   	leave  
 80484d7:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80484da:	c3                   	ret    

080484db <f1>:
 80484db:	55                   	push   %ebp
 80484dc:	89 e5                	mov    %esp,%ebp
 80484de:	b8 00 00 00 00       	mov    $0x0,%eax
 80484e3:	5d                   	pop    %ebp
 80484e4:	c3                   	ret    

080484e5 <f2>:
 80484e5:	55                   	push   %ebp
 80484e6:	89 e5                	mov    %esp,%ebp
 80484e8:	83 ec 18             	sub    $0x18,%esp
 80484eb:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
 80484f2:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
 80484f9:	c7 45 f0 28 00 00 00 	movl   $0x28,-0x10(%ebp)
 8048500:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048503:	6a 10                	push   $0x10
 8048505:	ff 75 f0             	pushl  -0x10(%ebp)
 8048508:	ff 75 f4             	pushl  -0xc(%ebp)
 804850b:	6a 14                	push   $0x14
 804850d:	50                   	push   %eax
 804850e:	e8 c8 ff ff ff       	call   80484db <f1>
 8048513:	83 c4 14             	add    $0x14,%esp
 8048516:	e8 07 00 00 00       	call   8048522 <f3>
 804851b:	b8 00 00 00 00       	mov    $0x0,%eax
 8048520:	c9                   	leave  
 8048521:	c3                   	ret    

08048522 <f3>:
 8048522:	55                   	push   %ebp
 8048523:	89 e5                	mov    %esp,%ebp
 8048525:	83 ec 10             	sub    $0x10,%esp
 8048528:	c7 45 fc 0a 00 00 00 	movl   $0xa,-0x4(%ebp)
 804852f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048532:	c9                   	leave  
 8048533:	c3                   	ret    
 8048534:	66 90                	xchg   %ax,%ax
 8048536:	66 90                	xchg   %ax,%ax
 8048538:	66 90                	xchg   %ax,%ax
 804853a:	66 90                	xchg   %ax,%ax
 804853c:	66 90                	xchg   %ax,%ax
 804853e:	66 90                	xchg   %ax,%ax

08048540 <__libc_csu_init>:
 8048540:	f3 0f 1e fb          	endbr32 
 8048544:	55                   	push   %ebp
 8048545:	57                   	push   %edi
 8048546:	56                   	push   %esi
 8048547:	53                   	push   %ebx
 8048548:	e8 43 fe ff ff       	call   8048390 <__x86.get_pc_thunk.bx>
 804854d:	81 c3 b3 1a 00 00    	add    $0x1ab3,%ebx
 8048553:	83 ec 0c             	sub    $0xc,%esp
 8048556:	8b 6c 24 28          	mov    0x28(%esp),%ebp
 804855a:	e8 95 fd ff ff       	call   80482f4 <_init>
 804855f:	8d b3 08 ff ff ff    	lea    -0xf8(%ebx),%esi
 8048565:	8d 83 04 ff ff ff    	lea    -0xfc(%ebx),%eax
 804856b:	29 c6                	sub    %eax,%esi
 804856d:	c1 fe 02             	sar    $0x2,%esi
 8048570:	74 23                	je     8048595 <__libc_csu_init+0x55>
 8048572:	31 ff                	xor    %edi,%edi
 8048574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048578:	83 ec 04             	sub    $0x4,%esp
 804857b:	55                   	push   %ebp
 804857c:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048580:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048584:	ff 94 bb 04 ff ff ff 	call   *-0xfc(%ebx,%edi,4)
 804858b:	83 c7 01             	add    $0x1,%edi
 804858e:	83 c4 10             	add    $0x10,%esp
 8048591:	39 fe                	cmp    %edi,%esi
 8048593:	75 e3                	jne    8048578 <__libc_csu_init+0x38>
 8048595:	83 c4 0c             	add    $0xc,%esp
 8048598:	5b                   	pop    %ebx
 8048599:	5e                   	pop    %esi
 804859a:	5f                   	pop    %edi
 804859b:	5d                   	pop    %ebp
 804859c:	c3                   	ret    

0804859d <.annobin___libc_csu_fini.start>:
 804859d:	8d 76 00             	lea    0x0(%esi),%esi

080485a0 <__libc_csu_fini>:
 80485a0:	f3 0f 1e fb          	endbr32 
 80485a4:	c3                   	ret    

Disassembly of section .fini:

080485a8 <_fini>:
 80485a8:	f3 0f 1e fb          	endbr32 
 80485ac:	53                   	push   %ebx
 80485ad:	83 ec 08             	sub    $0x8,%esp
 80485b0:	e8 db fd ff ff       	call   8048390 <__x86.get_pc_thunk.bx>
 80485b5:	81 c3 4b 1a 00 00    	add    $0x1a4b,%ebx
 80485bb:	83 c4 08             	add    $0x8,%esp
 80485be:	5b                   	pop    %ebx
 80485bf:	c3                   	ret    
