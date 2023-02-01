c0004271 <do_rdwt>:
c0004271:	55                   	push   %ebp
c0004272:	89 e5                	mov    %esp,%ebp
c0004274:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000427a:	8b 45 08             	mov    0x8(%ebp),%eax
c000427d:	8b 40 68             	mov    0x68(%eax),%eax
c0004280:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004283:	8b 45 08             	mov    0x8(%ebp),%eax
c0004286:	8b 40 50             	mov    0x50(%eax),%eax
c0004289:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000428c:	8b 45 08             	mov    0x8(%ebp),%eax
c000428f:	8b 40 5c             	mov    0x5c(%eax),%eax
c0004292:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004295:	8b 45 08             	mov    0x8(%ebp),%eax
c0004298:	8b 00                	mov    (%eax),%eax
c000429a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000429d:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a0:	8b 40 10             	mov    0x10(%eax),%eax
c00042a3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00042a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a9:	8b 40 40             	mov    0x40(%eax),%eax
c00042ac:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00042af:	83 ec 0c             	sub    $0xc,%esp
c00042b2:	ff 75 cc             	pushl  -0x34(%ebp)
c00042b5:	e8 72 07 00 00       	call   c0004a2c <pid2proc>
c00042ba:	83 c4 10             	add    $0x10,%esp
c00042bd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00042c0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00042c3:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c00042c6:	83 c2 50             	add    $0x50,%edx
c00042c9:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00042cd:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00042d0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00042d3:	8b 40 08             	mov    0x8(%eax),%eax
c00042d6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00042d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00042dc:	8b 00                	mov    (%eax),%eax
c00042de:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00042e1:	83 ec 08             	sub    $0x8,%esp
c00042e4:	ff 75 b8             	pushl  -0x48(%ebp)
c00042e7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00042ed:	50                   	push   %eax
c00042ee:	e8 0d f2 ff ff       	call   c0003500 <get_inode>
c00042f3:	83 c4 10             	add    $0x10,%esp
c00042f6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00042f9:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c00042fd:	75 10                	jne    c000430f <do_rdwt+0x9e>
c00042ff:	83 ec 0c             	sub    $0xc,%esp
c0004302:	68 04 ab 00 c0       	push   $0xc000ab04
c0004307:	e8 d1 4e 00 00       	call   c00091dd <panic>
c000430c:	83 c4 10             	add    $0x10,%esp
c000430f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004315:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004318:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000431b:	8b 40 04             	mov    0x4(%eax),%eax
c000431e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004321:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004325:	74 22                	je     c0004349 <do_rdwt+0xd8>
c0004327:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000432b:	74 1c                	je     c0004349 <do_rdwt+0xd8>
c000432d:	68 9e 04 00 00       	push   $0x49e
c0004332:	68 70 a9 00 c0       	push   $0xc000a970
c0004337:	68 70 a9 00 c0       	push   $0xc000a970
c000433c:	68 14 ab 00 c0       	push   $0xc000ab14
c0004341:	e8 b5 4e 00 00       	call   c00091fb <assertion_failure>
c0004346:	83 c4 10             	add    $0x10,%esp
c0004349:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000434f:	83 f8 01             	cmp    $0x1,%eax
c0004352:	0f 85 86 00 00 00    	jne    c00043de <do_rdwt+0x16d>
c0004358:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000435c:	75 09                	jne    c0004367 <do_rdwt+0xf6>
c000435e:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c0004365:	eb 0d                	jmp    c0004374 <do_rdwt+0x103>
c0004367:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c000436b:	75 07                	jne    c0004374 <do_rdwt+0x103>
c000436d:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c0004374:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004377:	8b 45 08             	mov    0x8(%ebp),%eax
c000437a:	89 50 68             	mov    %edx,0x68(%eax)
c000437d:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0004380:	8b 45 08             	mov    0x8(%ebp),%eax
c0004383:	89 50 58             	mov    %edx,0x58(%eax)
c0004386:	83 ec 04             	sub    $0x4,%esp
c0004389:	6a 02                	push   $0x2
c000438b:	ff 75 08             	pushl  0x8(%ebp)
c000438e:	6a 03                	push   $0x3
c0004390:	e8 b1 56 00 00       	call   c0009a46 <send_rec>
c0004395:	83 c4 10             	add    $0x10,%esp
c0004398:	8b 45 08             	mov    0x8(%ebp),%eax
c000439b:	8b 40 68             	mov    0x68(%eax),%eax
c000439e:	83 f8 66             	cmp    $0x66,%eax
c00043a1:	75 13                	jne    c00043b6 <do_rdwt+0x145>
c00043a3:	83 ec 04             	sub    $0x4,%esp
c00043a6:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043a9:	ff 75 08             	pushl  0x8(%ebp)
c00043ac:	6a 01                	push   $0x1
c00043ae:	e8 93 56 00 00       	call   c0009a46 <send_rec>
c00043b3:	83 c4 10             	add    $0x10,%esp
c00043b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043b9:	8b 40 68             	mov    0x68(%eax),%eax
c00043bc:	83 f8 65             	cmp    $0x65,%eax
c00043bf:	75 13                	jne    c00043d4 <do_rdwt+0x163>
c00043c1:	83 ec 04             	sub    $0x4,%esp
c00043c4:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043c7:	ff 75 08             	pushl  0x8(%ebp)
c00043ca:	6a 01                	push   $0x1
c00043cc:	e8 75 56 00 00       	call   c0009a46 <send_rec>
c00043d1:	83 c4 10             	add    $0x10,%esp
c00043d4:	b8 00 00 00 00       	mov    $0x0,%eax
c00043d9:	e9 23 02 00 00       	jmp    c0004601 <do_rdwt+0x390>
c00043de:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c00043e2:	75 18                	jne    c00043fc <do_rdwt+0x18b>
c00043e4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00043ea:	c1 e0 09             	shl    $0x9,%eax
c00043ed:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00043f0:	75 0a                	jne    c00043fc <do_rdwt+0x18b>
c00043f2:	b8 00 00 00 00       	mov    $0x0,%eax
c00043f7:	e9 05 02 00 00       	jmp    c0004601 <do_rdwt+0x390>
c00043fc:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004400:	75 1b                	jne    c000441d <do_rdwt+0x1ac>
c0004402:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004409:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000440c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000440f:	01 d0                	add    %edx,%eax
c0004411:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004414:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c0004418:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000441b:	eb 19                	jmp    c0004436 <do_rdwt+0x1c5>
c000441d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004420:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004423:	01 c2                	add    %eax,%edx
c0004425:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000442b:	c1 e0 09             	shl    $0x9,%eax
c000442e:	39 c2                	cmp    %eax,%edx
c0004430:	0f 4e c2             	cmovle %edx,%eax
c0004433:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004436:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004439:	99                   	cltd   
c000443a:	c1 ea 17             	shr    $0x17,%edx
c000443d:	01 d0                	add    %edx,%eax
c000443f:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004444:	29 d0                	sub    %edx,%eax
c0004446:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004449:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000444f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004452:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004458:	85 c0                	test   %eax,%eax
c000445a:	0f 48 c1             	cmovs  %ecx,%eax
c000445d:	c1 f8 09             	sar    $0x9,%eax
c0004460:	01 d0                	add    %edx,%eax
c0004462:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004465:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000446b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000446e:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004474:	85 c0                	test   %eax,%eax
c0004476:	0f 48 c1             	cmovs  %ecx,%eax
c0004479:	c1 f8 09             	sar    $0x9,%eax
c000447c:	01 d0                	add    %edx,%eax
c000447e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004481:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004484:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004487:	ba 00 00 10 00       	mov    $0x100000,%edx
c000448c:	39 d0                	cmp    %edx,%eax
c000448e:	7d 0b                	jge    c000449b <do_rdwt+0x22a>
c0004490:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004493:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004496:	83 c0 01             	add    $0x1,%eax
c0004499:	eb 05                	jmp    c00044a0 <do_rdwt+0x22f>
c000449b:	b8 00 00 10 00       	mov    $0x100000,%eax
c00044a0:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00044a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00044a9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00044b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00044b3:	8b 00                	mov    (%eax),%eax
c00044b5:	83 ec 0c             	sub    $0xc,%esp
c00044b8:	50                   	push   %eax
c00044b9:	e8 6e 05 00 00       	call   c0004a2c <pid2proc>
c00044be:	83 c4 10             	add    $0x10,%esp
c00044c1:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00044c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044c7:	83 ec 08             	sub    $0x8,%esp
c00044ca:	50                   	push   %eax
c00044cb:	ff 75 c8             	pushl  -0x38(%ebp)
c00044ce:	e8 b7 28 00 00       	call   c0006d8a <alloc_virtual_memory>
c00044d3:	83 c4 10             	add    $0x10,%esp
c00044d6:	89 45 98             	mov    %eax,-0x68(%ebp)
c00044d9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00044dc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00044df:	e9 c5 00 00 00       	jmp    c00045a9 <do_rdwt+0x338>
c00044e4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00044e7:	c1 e0 09             	shl    $0x9,%eax
c00044ea:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00044ed:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c00044f0:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c00044f4:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00044f7:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c00044fe:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004502:	75 46                	jne    c000454a <do_rdwt+0x2d9>
c0004504:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004507:	c1 e0 09             	shl    $0x9,%eax
c000450a:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004510:	83 ec 0c             	sub    $0xc,%esp
c0004513:	6a 07                	push   $0x7
c0004515:	50                   	push   %eax
c0004516:	52                   	push   %edx
c0004517:	ff 75 90             	pushl  -0x70(%ebp)
c000451a:	ff 75 dc             	pushl  -0x24(%ebp)
c000451d:	e8 00 e5 ff ff       	call   c0002a22 <rd_wt>
c0004522:	83 c4 20             	add    $0x20,%esp
c0004525:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000452b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000452e:	01 d0                	add    %edx,%eax
c0004530:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004533:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004536:	01 ca                	add    %ecx,%edx
c0004538:	83 ec 04             	sub    $0x4,%esp
c000453b:	ff 75 94             	pushl  -0x6c(%ebp)
c000453e:	50                   	push   %eax
c000453f:	52                   	push   %edx
c0004540:	e8 ff 6d 00 00       	call   c000b344 <Memcpy>
c0004545:	83 c4 10             	add    $0x10,%esp
c0004548:	eb 46                	jmp    c0004590 <do_rdwt+0x31f>
c000454a:	8b 55 98             	mov    -0x68(%ebp),%edx
c000454d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004550:	01 d0                	add    %edx,%eax
c0004552:	89 c1                	mov    %eax,%ecx
c0004554:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000455a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000455d:	01 d0                	add    %edx,%eax
c000455f:	83 ec 04             	sub    $0x4,%esp
c0004562:	ff 75 94             	pushl  -0x6c(%ebp)
c0004565:	51                   	push   %ecx
c0004566:	50                   	push   %eax
c0004567:	e8 d8 6d 00 00       	call   c000b344 <Memcpy>
c000456c:	83 c4 10             	add    $0x10,%esp
c000456f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004572:	c1 e0 09             	shl    $0x9,%eax
c0004575:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000457b:	83 ec 0c             	sub    $0xc,%esp
c000457e:	6a 0a                	push   $0xa
c0004580:	50                   	push   %eax
c0004581:	52                   	push   %edx
c0004582:	ff 75 90             	pushl  -0x70(%ebp)
c0004585:	ff 75 dc             	pushl  -0x24(%ebp)
c0004588:	e8 95 e4 ff ff       	call   c0002a22 <rd_wt>
c000458d:	83 c4 20             	add    $0x20,%esp
c0004590:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004593:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0004596:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004599:	01 45 e0             	add    %eax,-0x20(%ebp)
c000459c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00045a3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00045a6:	01 45 dc             	add    %eax,-0x24(%ebp)
c00045a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045ac:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c00045af:	7f 0a                	jg     c00045bb <do_rdwt+0x34a>
c00045b1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00045b5:	0f 85 29 ff ff ff    	jne    c00044e4 <do_rdwt+0x273>
c00045bb:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045be:	8b 50 04             	mov    0x4(%eax),%edx
c00045c1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045c4:	01 c2                	add    %eax,%edx
c00045c6:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045c9:	89 50 04             	mov    %edx,0x4(%eax)
c00045cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045d2:	01 c2                	add    %eax,%edx
c00045d4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00045da:	39 c2                	cmp    %eax,%edx
c00045dc:	7e 20                	jle    c00045fe <do_rdwt+0x38d>
c00045de:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045e4:	01 d0                	add    %edx,%eax
c00045e6:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00045ec:	83 ec 0c             	sub    $0xc,%esp
c00045ef:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00045f5:	50                   	push   %eax
c00045f6:	e8 08 00 00 00       	call   c0004603 <sync_inode>
c00045fb:	83 c4 10             	add    $0x10,%esp
c00045fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004601:	c9                   	leave  
c0004602:	c3                   	ret    
