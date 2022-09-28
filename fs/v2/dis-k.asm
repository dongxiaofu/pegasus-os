
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00001000 <_start>:
    1000:	c7 05 50 d7 00 00 00 	movl   $0x0,0xd750
    1007:	00 00 00 
    100a:	b4 0b                	mov    $0xb,%ah
    100c:	b0 4c                	mov    $0x4c,%al
    100e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
    1015:	bc 20 cf 00 00       	mov    $0xcf20,%esp
    101a:	66 c7 05 50 d7 00 00 	movw   $0x0,0xd750
    1021:	00 00 
    1023:	0f 01 05 98 f6 00 00 	sgdtl  0xf698
    102a:	e8 e5 5b 00 00       	call   6c14 <ReloadGDT>
    102f:	0f 01 15 98 f6 00 00 	lgdtl  0xf698
    1036:	0f 01 1d 48 d7 00 00 	lidtl  0xd748
    103d:	ea 44 10 00 00 08 00 	ljmp   $0x8,$0x1044

00001044 <csinit>:
    1044:	31 c0                	xor    %eax,%eax
    1046:	66 b8 40 00          	mov    $0x40,%ax
    104a:	0f 00 d8             	ltr    %ax
    104d:	e9 16 0a 00 00       	jmp    1a68 <kernel_main>
    1052:	f4                   	hlt    
    1053:	eb fe                	jmp    1053 <csinit+0xf>
    1055:	fb                   	sti    
    1056:	b4 0b                	mov    $0xb,%ah
    1058:	b0 4d                	mov    $0x4d,%al
    105a:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
    1061:	eb fe                	jmp    1061 <csinit+0x1d>
    1063:	f4                   	hlt    
    1064:	6a 00                	push   $0x0
    1066:	9d                   	popf   
    1067:	eb fe                	jmp    1067 <csinit+0x23>
    1069:	e8 45 09 00 00       	call   19b3 <test>
    106e:	6a 01                	push   $0x1
    1070:	6a 02                	push   $0x2
    1072:	6a 03                	push   $0x3
    1074:	f4                   	hlt    
    1075:	66 90                	xchg   %ax,%ax
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <InterruptTest>:
    1080:	b4 0d                	mov    $0xd,%ah
    1082:	b0 54                	mov    $0x54,%al
    1084:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
    108b:	c3                   	ret    

0000108c <disp_str>:
    108c:	55                   	push   %ebp
    108d:	89 e5                	mov    %esp,%ebp
    108f:	b4 0d                	mov    $0xd,%ah
    1091:	8b 75 08             	mov    0x8(%ebp),%esi
    1094:	8b 3d 50 d7 00 00    	mov    0xd750,%edi

0000109a <disp_str.1>:
    109a:	ac                   	lods   %ds:(%esi),%al
    109b:	84 c0                	test   %al,%al
    109d:	74 1e                	je     10bd <disp_str.4>
    109f:	3c 0a                	cmp    $0xa,%al
    10a1:	75 11                	jne    10b4 <disp_str.3>
    10a3:	50                   	push   %eax
    10a4:	89 f8                	mov    %edi,%eax
    10a6:	b3 a0                	mov    $0xa0,%bl
    10a8:	f6 f3                	div    %bl
    10aa:	40                   	inc    %eax
    10ab:	b3 a0                	mov    $0xa0,%bl
    10ad:	f6 e3                	mul    %bl
    10af:	89 c7                	mov    %eax,%edi
    10b1:	58                   	pop    %eax
    10b2:	eb e6                	jmp    109a <disp_str.1>

000010b4 <disp_str.3>:
    10b4:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10b8:	83 c7 02             	add    $0x2,%edi
    10bb:	eb dd                	jmp    109a <disp_str.1>

000010bd <disp_str.4>:
    10bd:	89 3d 50 d7 00 00    	mov    %edi,0xd750
    10c3:	89 ec                	mov    %ebp,%esp
    10c5:	5d                   	pop    %ebp
    10c6:	c3                   	ret    

000010c7 <disp_str_colour>:
    10c7:	55                   	push   %ebp
    10c8:	89 e5                	mov    %esp,%ebp
    10ca:	8b 75 08             	mov    0x8(%ebp),%esi
    10cd:	8a 65 0c             	mov    0xc(%ebp),%ah
    10d0:	8b 3d 50 d7 00 00    	mov    0xd750,%edi

000010d6 <disp_str_colour.1>:
    10d6:	ac                   	lods   %ds:(%esi),%al
    10d7:	84 c0                	test   %al,%al
    10d9:	74 1e                	je     10f9 <disp_str_colour.4>
    10db:	3c 0a                	cmp    $0xa,%al
    10dd:	75 11                	jne    10f0 <disp_str_colour.3>
    10df:	50                   	push   %eax
    10e0:	89 f8                	mov    %edi,%eax
    10e2:	b3 a0                	mov    $0xa0,%bl
    10e4:	f6 f3                	div    %bl
    10e6:	40                   	inc    %eax
    10e7:	b3 a0                	mov    $0xa0,%bl
    10e9:	f6 e3                	mul    %bl
    10eb:	89 c7                	mov    %eax,%edi
    10ed:	58                   	pop    %eax
    10ee:	eb e6                	jmp    10d6 <disp_str_colour.1>

000010f0 <disp_str_colour.3>:
    10f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10f4:	83 c7 02             	add    $0x2,%edi
    10f7:	eb dd                	jmp    10d6 <disp_str_colour.1>

000010f9 <disp_str_colour.4>:
    10f9:	89 3d 50 d7 00 00    	mov    %edi,0xd750
    10ff:	89 ec                	mov    %ebp,%esp
    1101:	5d                   	pop    %ebp
    1102:	c3                   	ret    

00001103 <divide_zero_fault>:
    1103:	6a ff                	push   $0xffffffff
    1105:	6a 00                	push   $0x0
    1107:	eb 58                	jmp    1161 <exception>

00001109 <single_step_fault>:
    1109:	6a ff                	push   $0xffffffff
    110b:	6a 01                	push   $0x1
    110d:	eb 52                	jmp    1161 <exception>

0000110f <non_maskable_interrupt>:
    110f:	6a ff                	push   $0xffffffff
    1111:	6a 02                	push   $0x2
    1113:	eb 4c                	jmp    1161 <exception>

00001115 <breakpoint_trap>:
    1115:	6a ff                	push   $0xffffffff
    1117:	6a 03                	push   $0x3
    1119:	eb 46                	jmp    1161 <exception>

0000111b <overflow_trap>:
    111b:	6a ff                	push   $0xffffffff
    111d:	6a 04                	push   $0x4
    111f:	eb 40                	jmp    1161 <exception>

00001121 <bound_range_exceeded_fault>:
    1121:	6a ff                	push   $0xffffffff
    1123:	6a 05                	push   $0x5
    1125:	eb 3a                	jmp    1161 <exception>

00001127 <invalid_opcode_fault>:
    1127:	6a ff                	push   $0xffffffff
    1129:	6a 06                	push   $0x6
    112b:	eb 34                	jmp    1161 <exception>

0000112d <coprocessor_not_available_fault>:
    112d:	6a ff                	push   $0xffffffff
    112f:	6a 07                	push   $0x7
    1131:	eb 2e                	jmp    1161 <exception>

00001133 <double_fault_exception_abort>:
    1133:	6a 08                	push   $0x8
    1135:	eb 2a                	jmp    1161 <exception>

00001137 <coprocessor_segment_overrun>:
    1137:	6a ff                	push   $0xffffffff
    1139:	6a 09                	push   $0x9
    113b:	eb 24                	jmp    1161 <exception>

0000113d <invalid_task_state_segment_fault>:
    113d:	6a 0a                	push   $0xa
    113f:	eb 20                	jmp    1161 <exception>

00001141 <segment_not_present_fault>:
    1141:	6a 0b                	push   $0xb
    1143:	eb 1c                	jmp    1161 <exception>

00001145 <stack_exception_fault>:
    1145:	6a 0c                	push   $0xc
    1147:	eb 18                	jmp    1161 <exception>

00001149 <general_protection_exception_fault>:
    1149:	6a 0d                	push   $0xd
    114b:	eb 14                	jmp    1161 <exception>

0000114d <page_fault>:
    114d:	6a 0e                	push   $0xe
    114f:	eb 10                	jmp    1161 <exception>

00001151 <coprocessor_error_fault>:
    1151:	6a ff                	push   $0xffffffff
    1153:	6a 10                	push   $0x10
    1155:	eb 0a                	jmp    1161 <exception>

00001157 <align_check_fault>:
    1157:	6a 11                	push   $0x11
    1159:	eb 06                	jmp    1161 <exception>

0000115b <simd_float_exception_fault>:
    115b:	6a ff                	push   $0xffffffff
    115d:	6a 12                	push   $0x12
    115f:	eb 00                	jmp    1161 <exception>

00001161 <exception>:
    1161:	e8 37 05 00 00       	call   169d <exception_handler>
    1166:	83 c4 08             	add    $0x8,%esp
    1169:	f4                   	hlt    

0000116a <hwint0>:
    116a:	60                   	pusha  
    116b:	1e                   	push   %ds
    116c:	06                   	push   %es
    116d:	0f a0                	push   %fs
    116f:	0f a8                	push   %gs
    1171:	66 8c d2             	mov    %ss,%dx
    1174:	8e da                	mov    %edx,%ds
    1176:	8e c2                	mov    %edx,%es
    1178:	8e e2                	mov    %edx,%fs
    117a:	b0 f9                	mov    $0xf9,%al
    117c:	e6 21                	out    %al,$0x21
    117e:	b0 20                	mov    $0x20,%al
    1180:	e6 20                	out    %al,$0x20
    1182:	ff 05 54 d7 00 00    	incl   0xd754
    1188:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    118f:	75 05                	jne    1196 <hwint0.2>

00001191 <hwint0.1>:
    1191:	bc 20 d7 00 00       	mov    $0xd720,%esp

00001196 <hwint0.2>:
    1196:	fb                   	sti    
    1197:	e8 a3 56 00 00       	call   683f <clock_handler>
    119c:	b0 f8                	mov    $0xf8,%al
    119e:	e6 21                	out    %al,$0x21
    11a0:	fa                   	cli    
    11a1:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    11a8:	0f 85 1a 01 00 00    	jne    12c8 <reenter_restore>
    11ae:	e9 01 01 00 00       	jmp    12b4 <restore>

000011b3 <hwint1>:
    11b3:	60                   	pusha  
    11b4:	1e                   	push   %ds
    11b5:	06                   	push   %es
    11b6:	0f a0                	push   %fs
    11b8:	0f a8                	push   %gs
    11ba:	66 8c d2             	mov    %ss,%dx
    11bd:	8e da                	mov    %edx,%ds
    11bf:	8e c2                	mov    %edx,%es
    11c1:	8e e2                	mov    %edx,%fs
    11c3:	b0 fa                	mov    $0xfa,%al
    11c5:	e6 21                	out    %al,$0x21
    11c7:	b0 20                	mov    $0x20,%al
    11c9:	e6 20                	out    %al,$0x20
    11cb:	ff 05 54 d7 00 00    	incl   0xd754
    11d1:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    11d8:	75 05                	jne    11df <hwint1.2>

000011da <hwint1.1>:
    11da:	bc 20 d7 00 00       	mov    $0xd720,%esp

000011df <hwint1.2>:
    11df:	fb                   	sti    
    11e0:	e8 e2 64 00 00       	call   76c7 <keyboard_handler>
    11e5:	b0 f8                	mov    $0xf8,%al
    11e7:	e6 21                	out    %al,$0x21
    11e9:	fa                   	cli    
    11ea:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    11f1:	0f 85 d1 00 00 00    	jne    12c8 <reenter_restore>
    11f7:	e9 b8 00 00 00       	jmp    12b4 <restore>

000011fc <hwint14>:
    11fc:	60                   	pusha  
    11fd:	1e                   	push   %ds
    11fe:	06                   	push   %es
    11ff:	0f a0                	push   %fs
    1201:	0f a8                	push   %gs
    1203:	66 8c d2             	mov    %ss,%dx
    1206:	8e da                	mov    %edx,%ds
    1208:	8e c2                	mov    %edx,%es
    120a:	8e e2                	mov    %edx,%fs
    120c:	b0 ff                	mov    $0xff,%al
    120e:	e6 a1                	out    %al,$0xa1
    1210:	b0 20                	mov    $0x20,%al
    1212:	e6 20                	out    %al,$0x20
    1214:	90                   	nop
    1215:	e6 a0                	out    %al,$0xa0
    1217:	ff 05 54 d7 00 00    	incl   0xd754
    121d:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    1224:	75 05                	jne    122b <hwint14.2>

00001226 <hwint14.1>:
    1226:	bc 20 d7 00 00       	mov    $0xd720,%esp

0000122b <hwint14.2>:
    122b:	fb                   	sti    
    122c:	e8 0c 34 00 00       	call   463d <hd_handler>
    1231:	b0 bf                	mov    $0xbf,%al
    1233:	e6 a1                	out    %al,$0xa1
    1235:	fa                   	cli    
    1236:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    123d:	0f 85 85 00 00 00    	jne    12c8 <reenter_restore>
    1243:	eb 6f                	jmp    12b4 <restore>

00001245 <sys_call>:
    1245:	60                   	pusha  
    1246:	1e                   	push   %ds
    1247:	06                   	push   %es
    1248:	0f a0                	push   %fs
    124a:	0f a8                	push   %gs
    124c:	89 e6                	mov    %esp,%esi
    124e:	66 8c d2             	mov    %ss,%dx
    1251:	8e da                	mov    %edx,%ds
    1253:	8e c2                	mov    %edx,%es
    1255:	8e e2                	mov    %edx,%fs
    1257:	ff 05 54 d7 00 00    	incl   0xd754
    125d:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    1264:	75 05                	jne    126b <sys_call.2>

00001266 <sys_call.1>:
    1266:	bc 20 d7 00 00       	mov    $0xd720,%esp

0000126b <sys_call.2>:
    126b:	fb                   	sti    
    126c:	56                   	push   %esi
    126d:	ff 35 60 db 00 00    	pushl  0xdb60
    1273:	53                   	push   %ebx
    1274:	51                   	push   %ecx
    1275:	ff 14 85 0c c1 00 00 	call   *0xc10c(,%eax,4)
    127c:	83 c4 0c             	add    $0xc,%esp
    127f:	5e                   	pop    %esi
    1280:	89 46 2c             	mov    %eax,0x2c(%esi)
    1283:	fa                   	cli    
    1284:	83 3d 54 d7 00 00 00 	cmpl   $0x0,0xd754
    128b:	75 3b                	jne    12c8 <reenter_restore>
    128d:	eb 25                	jmp    12b4 <restore>

0000128f <restart>:
    128f:	ff 0d 54 d7 00 00    	decl   0xd754
    1295:	8b 25 60 db 00 00    	mov    0xdb60,%esp
    129b:	0f 00 54 24 44       	lldt   0x44(%esp)
    12a0:	8d 44 24 44          	lea    0x44(%esp),%eax
    12a4:	a3 24 f6 00 00       	mov    %eax,0xf624
    12a9:	0f a9                	pop    %gs
    12ab:	0f a1                	pop    %fs
    12ad:	07                   	pop    %es
    12ae:	1f                   	pop    %ds
    12af:	61                   	popa   
    12b0:	66 87 db             	xchg   %bx,%bx
    12b3:	cf                   	iret   

000012b4 <restore>:
    12b4:	8b 25 60 db 00 00    	mov    0xdb60,%esp
    12ba:	0f 00 54 24 44       	lldt   0x44(%esp)
    12bf:	8d 44 24 44          	lea    0x44(%esp),%eax
    12c3:	a3 24 f6 00 00       	mov    %eax,0xf624

000012c8 <reenter_restore>:
    12c8:	ff 0d 54 d7 00 00    	decl   0xd754
    12ce:	0f a9                	pop    %gs
    12d0:	0f a1                	pop    %fs
    12d2:	07                   	pop    %es
    12d3:	1f                   	pop    %ds
    12d4:	61                   	popa   
    12d5:	cf                   	iret   

000012d6 <in_byte>:
    12d6:	31 d2                	xor    %edx,%edx
    12d8:	8b 54 24 04          	mov    0x4(%esp),%edx
    12dc:	31 c0                	xor    %eax,%eax
    12de:	ec                   	in     (%dx),%al
    12df:	90                   	nop
    12e0:	90                   	nop
    12e1:	c3                   	ret    

000012e2 <out_byte>:
    12e2:	31 d2                	xor    %edx,%edx
    12e4:	31 c0                	xor    %eax,%eax
    12e6:	8b 54 24 04          	mov    0x4(%esp),%edx
    12ea:	8a 44 24 08          	mov    0x8(%esp),%al
    12ee:	ee                   	out    %al,(%dx)
    12ef:	90                   	nop
    12f0:	90                   	nop
    12f1:	c3                   	ret    

000012f2 <in_byte2>:
    12f2:	55                   	push   %ebp
    12f3:	89 e5                	mov    %esp,%ebp
    12f5:	52                   	push   %edx
    12f6:	31 d2                	xor    %edx,%edx
    12f8:	66 8b 55 08          	mov    0x8(%ebp),%dx
    12fc:	31 c0                	xor    %eax,%eax
    12fe:	ec                   	in     (%dx),%al
    12ff:	90                   	nop
    1300:	90                   	nop
    1301:	5b                   	pop    %ebx
    1302:	5d                   	pop    %ebp
    1303:	c3                   	ret    

00001304 <disable_int>:
    1304:	fa                   	cli    
    1305:	c3                   	ret    

00001306 <enable_int>:
    1306:	fb                   	sti    
    1307:	c3                   	ret    

00001308 <check_tss_esp0>:
    1308:	55                   	push   %ebp
    1309:	89 e5                	mov    %esp,%ebp
    130b:	8b 45 08             	mov    0x8(%ebp),%eax
    130e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    1311:	83 c0 44             	add    $0x44,%eax
    1314:	8b 15 24 f6 00 00    	mov    0xf624,%edx
    131a:	39 d0                	cmp    %edx,%eax
    131c:	74 7c                	je     139a <check_tss_esp0.2>

0000131e <check_tss_esp0.1>:
    131e:	50                   	push   %eax
    131f:	52                   	push   %edx
    1320:	68 10 c0 00 00       	push   $0xc010
    1325:	e8 62 fd ff ff       	call   108c <disp_str>
    132a:	83 c4 04             	add    $0x4,%esp
    132d:	5a                   	pop    %edx
    132e:	58                   	pop    %eax
    132f:	52                   	push   %edx
    1330:	50                   	push   %eax
    1331:	53                   	push   %ebx
    1332:	e8 3d 03 00 00       	call   1674 <disp_int>
    1337:	83 c4 04             	add    $0x4,%esp
    133a:	58                   	pop    %eax
    133b:	5a                   	pop    %edx
    133c:	52                   	push   %edx
    133d:	50                   	push   %eax
    133e:	e8 31 03 00 00       	call   1674 <disp_int>
    1343:	58                   	pop    %eax
    1344:	5a                   	pop    %edx
    1345:	52                   	push   %edx
    1346:	50                   	push   %eax
    1347:	ff 35 54 d7 00 00    	pushl  0xd754
    134d:	e8 22 03 00 00       	call   1674 <disp_int>
    1352:	83 c4 04             	add    $0x4,%esp
    1355:	58                   	pop    %eax
    1356:	5a                   	pop    %edx
    1357:	52                   	push   %edx
    1358:	50                   	push   %eax
    1359:	ff 72 ec             	pushl  -0x14(%edx)
    135c:	e8 13 03 00 00       	call   1674 <disp_int>
    1361:	83 c4 04             	add    $0x4,%esp
    1364:	58                   	pop    %eax
    1365:	5a                   	pop    %edx
    1366:	52                   	push   %edx
    1367:	50                   	push   %eax
    1368:	ff 70 ec             	pushl  -0x14(%eax)
    136b:	e8 04 03 00 00       	call   1674 <disp_int>
    1370:	83 c4 04             	add    $0x4,%esp
    1373:	58                   	pop    %eax
    1374:	5a                   	pop    %edx
    1375:	52                   	push   %edx
    1376:	50                   	push   %eax
    1377:	ff 35 60 db 00 00    	pushl  0xdb60
    137d:	e8 f2 02 00 00       	call   1674 <disp_int>
    1382:	83 c4 04             	add    $0x4,%esp
    1385:	58                   	pop    %eax
    1386:	5a                   	pop    %edx
    1387:	52                   	push   %edx
    1388:	50                   	push   %eax
    1389:	68 20 d7 00 00       	push   $0xd720
    138e:	e8 e1 02 00 00       	call   1674 <disp_int>
    1393:	83 c4 04             	add    $0x4,%esp
    1396:	58                   	pop    %eax
    1397:	5a                   	pop    %edx
    1398:	5d                   	pop    %ebp
    1399:	c3                   	ret    

0000139a <check_tss_esp0.2>:
    139a:	5d                   	pop    %ebp
    139b:	c3                   	ret    

0000139c <enable_8259A_casecade_irq>:
    139c:	9c                   	pushf  
    139d:	fa                   	cli    
    139e:	e4 21                	in     $0x21,%al
    13a0:	24 fb                	and    $0xfb,%al
    13a2:	e6 21                	out    %al,$0x21
    13a4:	9d                   	popf   
    13a5:	c3                   	ret    

000013a6 <disable_8259A_casecade_irq>:
    13a6:	9c                   	pushf  
    13a7:	fa                   	cli    
    13a8:	e4 21                	in     $0x21,%al
    13aa:	0c 04                	or     $0x4,%al
    13ac:	e6 21                	out    %al,$0x21
    13ae:	9c                   	pushf  
    13af:	c3                   	ret    

000013b0 <enable_8259A_slave_winchester_irq>:
    13b0:	9c                   	pushf  
    13b1:	fa                   	cli    
    13b2:	e4 a1                	in     $0xa1,%al
    13b4:	24 bf                	and    $0xbf,%al
    13b6:	e6 a1                	out    %al,$0xa1
    13b8:	9d                   	popf   
    13b9:	c3                   	ret    

000013ba <disable_8259A_slave_winchester_irq>:
    13ba:	9c                   	pushf  
    13bb:	fa                   	cli    
    13bc:	e4 a1                	in     $0xa1,%al
    13be:	0c 40                	or     $0x40,%al
    13c0:	e6 a1                	out    %al,$0xa1
    13c2:	9d                   	popf   
    13c3:	c3                   	ret    

000013c4 <untar>:
    13c4:	55                   	push   %ebp
    13c5:	89 e5                	mov    %esp,%ebp
    13c7:	81 ec 48 20 00 00    	sub    $0x2048,%esp
    13cd:	83 ec 08             	sub    $0x8,%esp
    13d0:	6a 00                	push   $0x0
    13d2:	ff 75 08             	pushl  0x8(%ebp)
    13d5:	e8 f4 66 00 00       	call   7ace <open>
    13da:	83 c4 10             	add    $0x10,%esp
    13dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    13e0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    13e7:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
    13ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    13f5:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    13fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1400:	7e 58                	jle    145a <untar+0x96>
    1402:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1405:	05 ff 01 00 00       	add    $0x1ff,%eax
    140a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    1410:	85 c0                	test   %eax,%eax
    1412:	0f 48 c2             	cmovs  %edx,%eax
    1415:	c1 f8 09             	sar    $0x9,%eax
    1418:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    141b:	83 ec 04             	sub    $0x4,%esp
    141e:	68 00 20 00 00       	push   $0x2000
    1423:	6a 00                	push   $0x0
    1425:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    142b:	50                   	push   %eax
    142c:	e8 88 7d 00 00       	call   91b9 <Memset>
    1431:	83 c4 10             	add    $0x10,%esp
    1434:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1437:	c1 e0 09             	shl    $0x9,%eax
    143a:	2b 45 f4             	sub    -0xc(%ebp),%eax
    143d:	83 ec 04             	sub    $0x4,%esp
    1440:	50                   	push   %eax
    1441:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1447:	50                   	push   %eax
    1448:	ff 75 e4             	pushl  -0x1c(%ebp)
    144b:	e8 d3 66 00 00       	call   7b23 <read>
    1450:	83 c4 10             	add    $0x10,%esp
    1453:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    145a:	83 ec 04             	sub    $0x4,%esp
    145d:	68 00 20 00 00       	push   $0x2000
    1462:	6a 00                	push   $0x0
    1464:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    146a:	50                   	push   %eax
    146b:	e8 49 7d 00 00       	call   91b9 <Memset>
    1470:	83 c4 10             	add    $0x10,%esp
    1473:	83 ec 04             	sub    $0x4,%esp
    1476:	68 00 02 00 00       	push   $0x200
    147b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1481:	50                   	push   %eax
    1482:	ff 75 e4             	pushl  -0x1c(%ebp)
    1485:	e8 99 66 00 00       	call   7b23 <read>
    148a:	83 c4 10             	add    $0x10,%esp
    148d:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1490:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1494:	0f 84 1f 01 00 00    	je     15b9 <untar+0x1f5>
    149a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    149d:	01 45 f4             	add    %eax,-0xc(%ebp)
    14a0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    14a7:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    14ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14b3:	89 45 cc             	mov    %eax,-0x34(%ebp)
    14b6:	83 ec 08             	sub    $0x8,%esp
    14b9:	6a 07                	push   $0x7
    14bb:	ff 75 cc             	pushl  -0x34(%ebp)
    14be:	e8 0b 66 00 00       	call   7ace <open>
    14c3:	83 c4 10             	add    $0x10,%esp
    14c6:	89 45 c8             	mov    %eax,-0x38(%ebp)
    14c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14d3:	83 c0 7c             	add    $0x7c,%eax
    14d6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    14d9:	83 ec 0c             	sub    $0xc,%esp
    14dc:	ff 75 cc             	pushl  -0x34(%ebp)
    14df:	e8 0e 7d 00 00       	call   91f2 <Strlen>
    14e4:	83 c4 10             	add    $0x10,%esp
    14e7:	85 c0                	test   %eax,%eax
    14e9:	75 16                	jne    1501 <untar+0x13d>
    14eb:	83 ec 0c             	sub    $0xc,%esp
    14ee:	ff 75 c4             	pushl  -0x3c(%ebp)
    14f1:	e8 fc 7c 00 00       	call   91f2 <Strlen>
    14f6:	83 c4 10             	add    $0x10,%esp
    14f9:	85 c0                	test   %eax,%eax
    14fb:	0f 84 bb 00 00 00    	je     15bc <untar+0x1f8>
    1501:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1504:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1507:	eb 1f                	jmp    1528 <untar+0x164>
    1509:	8b 45 f0             	mov    -0x10(%ebp),%eax
    150c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1513:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1516:	0f b6 00             	movzbl (%eax),%eax
    1519:	0f be c0             	movsbl %al,%eax
    151c:	83 e8 30             	sub    $0x30,%eax
    151f:	01 d0                	add    %edx,%eax
    1521:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1524:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1528:	8b 45 ec             	mov    -0x14(%ebp),%eax
    152b:	0f b6 00             	movzbl (%eax),%eax
    152e:	84 c0                	test   %al,%al
    1530:	75 d7                	jne    1509 <untar+0x145>
    1532:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1535:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1538:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
    153f:	eb 5f                	jmp    15a0 <untar+0x1dc>
    1541:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1544:	39 45 c0             	cmp    %eax,-0x40(%ebp)
    1547:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
    154b:	89 45 bc             	mov    %eax,-0x44(%ebp)
    154e:	83 ec 04             	sub    $0x4,%esp
    1551:	68 00 02 00 00       	push   $0x200
    1556:	6a 00                	push   $0x0
    1558:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    155e:	50                   	push   %eax
    155f:	e8 55 7c 00 00       	call   91b9 <Memset>
    1564:	83 c4 10             	add    $0x10,%esp
    1567:	83 ec 04             	sub    $0x4,%esp
    156a:	ff 75 bc             	pushl  -0x44(%ebp)
    156d:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1573:	50                   	push   %eax
    1574:	ff 75 e4             	pushl  -0x1c(%ebp)
    1577:	e8 a7 65 00 00       	call   7b23 <read>
    157c:	83 c4 10             	add    $0x10,%esp
    157f:	01 45 f4             	add    %eax,-0xc(%ebp)
    1582:	83 ec 04             	sub    $0x4,%esp
    1585:	ff 75 bc             	pushl  -0x44(%ebp)
    1588:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    158e:	50                   	push   %eax
    158f:	ff 75 c8             	pushl  -0x38(%ebp)
    1592:	e8 c3 65 00 00       	call   7b5a <write>
    1597:	83 c4 10             	add    $0x10,%esp
    159a:	8b 45 bc             	mov    -0x44(%ebp),%eax
    159d:	29 45 e8             	sub    %eax,-0x18(%ebp)
    15a0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15a4:	75 9b                	jne    1541 <untar+0x17d>
    15a6:	83 ec 0c             	sub    $0xc,%esp
    15a9:	ff 75 c8             	pushl  -0x38(%ebp)
    15ac:	e8 e0 65 00 00       	call   7b91 <close>
    15b1:	83 c4 10             	add    $0x10,%esp
    15b4:	e9 43 fe ff ff       	jmp    13fc <untar+0x38>
    15b9:	90                   	nop
    15ba:	eb 01                	jmp    15bd <untar+0x1f9>
    15bc:	90                   	nop
    15bd:	83 ec 0c             	sub    $0xc,%esp
    15c0:	ff 75 e4             	pushl  -0x1c(%ebp)
    15c3:	e8 c9 65 00 00       	call   7b91 <close>
    15c8:	83 c4 10             	add    $0x10,%esp
    15cb:	90                   	nop
    15cc:	c9                   	leave  
    15cd:	c3                   	ret    

000015ce <atoi>:
    15ce:	55                   	push   %ebp
    15cf:	89 e5                	mov    %esp,%ebp
    15d1:	83 ec 10             	sub    $0x10,%esp
    15d4:	8b 45 08             	mov    0x8(%ebp),%eax
    15d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15da:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15dd:	8d 50 01             	lea    0x1(%eax),%edx
    15e0:	89 55 fc             	mov    %edx,-0x4(%ebp)
    15e3:	c6 00 30             	movb   $0x30,(%eax)
    15e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15e9:	8d 50 01             	lea    0x1(%eax),%edx
    15ec:	89 55 fc             	mov    %edx,-0x4(%ebp)
    15ef:	c6 00 78             	movb   $0x78,(%eax)
    15f2:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
    15f6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    15fa:	75 0e                	jne    160a <atoi+0x3c>
    15fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15ff:	8d 50 01             	lea    0x1(%eax),%edx
    1602:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1605:	c6 00 30             	movb   $0x30,(%eax)
    1608:	eb 61                	jmp    166b <atoi+0x9d>
    160a:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
    1611:	eb 52                	jmp    1665 <atoi+0x97>
    1613:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1616:	8b 55 0c             	mov    0xc(%ebp),%edx
    1619:	89 c1                	mov    %eax,%ecx
    161b:	d3 fa                	sar    %cl,%edx
    161d:	89 d0                	mov    %edx,%eax
    161f:	83 e0 0f             	and    $0xf,%eax
    1622:	88 45 fb             	mov    %al,-0x5(%ebp)
    1625:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
    1629:	75 06                	jne    1631 <atoi+0x63>
    162b:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
    162f:	74 2f                	je     1660 <atoi+0x92>
    1631:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
    1635:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1639:	83 c0 30             	add    $0x30,%eax
    163c:	88 45 fb             	mov    %al,-0x5(%ebp)
    163f:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
    1643:	7e 0a                	jle    164f <atoi+0x81>
    1645:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1649:	83 c0 07             	add    $0x7,%eax
    164c:	88 45 fb             	mov    %al,-0x5(%ebp)
    164f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1652:	8d 50 01             	lea    0x1(%eax),%edx
    1655:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1658:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
    165c:	88 10                	mov    %dl,(%eax)
    165e:	eb 01                	jmp    1661 <atoi+0x93>
    1660:	90                   	nop
    1661:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
    1665:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1669:	79 a8                	jns    1613 <atoi+0x45>
    166b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    166e:	c6 00 00             	movb   $0x0,(%eax)
    1671:	90                   	nop
    1672:	c9                   	leave  
    1673:	c3                   	ret    

00001674 <disp_int>:
    1674:	55                   	push   %ebp
    1675:	89 e5                	mov    %esp,%ebp
    1677:	83 ec 18             	sub    $0x18,%esp
    167a:	ff 75 08             	pushl  0x8(%ebp)
    167d:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1680:	50                   	push   %eax
    1681:	e8 48 ff ff ff       	call   15ce <atoi>
    1686:	83 c4 08             	add    $0x8,%esp
    1689:	83 ec 08             	sub    $0x8,%esp
    168c:	6a 0b                	push   $0xb
    168e:	8d 45 ee             	lea    -0x12(%ebp),%eax
    1691:	50                   	push   %eax
    1692:	e8 30 fa ff ff       	call   10c7 <disp_str_colour>
    1697:	83 c4 10             	add    $0x10,%esp
    169a:	90                   	nop
    169b:	c9                   	leave  
    169c:	c3                   	ret    

0000169d <exception_handler>:
    169d:	55                   	push   %ebp
    169e:	89 e5                	mov    %esp,%ebp
    16a0:	57                   	push   %edi
    16a1:	56                   	push   %esi
    16a2:	53                   	push   %ebx
    16a3:	83 ec 6c             	sub    $0x6c,%esp
    16a6:	8d 45 90             	lea    -0x70(%ebp),%eax
    16a9:	bb c0 89 00 00       	mov    $0x89c0,%ebx
    16ae:	ba 13 00 00 00       	mov    $0x13,%edx
    16b3:	89 c7                	mov    %eax,%edi
    16b5:	89 de                	mov    %ebx,%esi
    16b7:	89 d1                	mov    %edx,%ecx
    16b9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    16bb:	c7 05 50 d7 00 00 6a 	movl   $0x2e6a,0xd750
    16c2:	2e 00 00 
    16c5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    16cc:	eb 14                	jmp    16e2 <exception_handler+0x45>
    16ce:	83 ec 0c             	sub    $0xc,%esp
    16d1:	68 a0 87 00 00       	push   $0x87a0
    16d6:	e8 b1 f9 ff ff       	call   108c <disp_str>
    16db:	83 c4 10             	add    $0x10,%esp
    16de:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    16e2:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
    16e9:	7e e3                	jle    16ce <exception_handler+0x31>
    16eb:	c7 05 50 d7 00 00 6a 	movl   $0x2e6a,0xd750
    16f2:	2e 00 00 
    16f5:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
    16fc:	8b 45 08             	mov    0x8(%ebp),%eax
    16ff:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
    1703:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1706:	83 ec 08             	sub    $0x8,%esp
    1709:	ff 75 e0             	pushl  -0x20(%ebp)
    170c:	ff 75 dc             	pushl  -0x24(%ebp)
    170f:	e8 b3 f9 ff ff       	call   10c7 <disp_str_colour>
    1714:	83 c4 10             	add    $0x10,%esp
    1717:	83 ec 0c             	sub    $0xc,%esp
    171a:	68 a2 87 00 00       	push   $0x87a2
    171f:	e8 68 f9 ff ff       	call   108c <disp_str>
    1724:	83 c4 10             	add    $0x10,%esp
    1727:	83 ec 08             	sub    $0x8,%esp
    172a:	ff 75 e0             	pushl  -0x20(%ebp)
    172d:	68 a5 87 00 00       	push   $0x87a5
    1732:	e8 90 f9 ff ff       	call   10c7 <disp_str_colour>
    1737:	83 c4 10             	add    $0x10,%esp
    173a:	83 ec 0c             	sub    $0xc,%esp
    173d:	ff 75 08             	pushl  0x8(%ebp)
    1740:	e8 2f ff ff ff       	call   1674 <disp_int>
    1745:	83 c4 10             	add    $0x10,%esp
    1748:	83 ec 0c             	sub    $0xc,%esp
    174b:	68 a2 87 00 00       	push   $0x87a2
    1750:	e8 37 f9 ff ff       	call   108c <disp_str>
    1755:	83 c4 10             	add    $0x10,%esp
    1758:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
    175c:	74 44                	je     17a2 <exception_handler+0x105>
    175e:	83 ec 08             	sub    $0x8,%esp
    1761:	ff 75 e0             	pushl  -0x20(%ebp)
    1764:	68 ad 87 00 00       	push   $0x87ad
    1769:	e8 59 f9 ff ff       	call   10c7 <disp_str_colour>
    176e:	83 c4 10             	add    $0x10,%esp
    1771:	83 ec 08             	sub    $0x8,%esp
    1774:	ff 75 e0             	pushl  -0x20(%ebp)
    1777:	68 ad 87 00 00       	push   $0x87ad
    177c:	e8 46 f9 ff ff       	call   10c7 <disp_str_colour>
    1781:	83 c4 10             	add    $0x10,%esp
    1784:	83 ec 0c             	sub    $0xc,%esp
    1787:	ff 75 0c             	pushl  0xc(%ebp)
    178a:	e8 e5 fe ff ff       	call   1674 <disp_int>
    178f:	83 c4 10             	add    $0x10,%esp
    1792:	83 ec 0c             	sub    $0xc,%esp
    1795:	68 a2 87 00 00       	push   $0x87a2
    179a:	e8 ed f8 ff ff       	call   108c <disp_str>
    179f:	83 c4 10             	add    $0x10,%esp
    17a2:	83 ec 08             	sub    $0x8,%esp
    17a5:	ff 75 e0             	pushl  -0x20(%ebp)
    17a8:	68 b7 87 00 00       	push   $0x87b7
    17ad:	e8 15 f9 ff ff       	call   10c7 <disp_str_colour>
    17b2:	83 c4 10             	add    $0x10,%esp
    17b5:	83 ec 0c             	sub    $0xc,%esp
    17b8:	ff 75 14             	pushl  0x14(%ebp)
    17bb:	e8 b4 fe ff ff       	call   1674 <disp_int>
    17c0:	83 c4 10             	add    $0x10,%esp
    17c3:	83 ec 0c             	sub    $0xc,%esp
    17c6:	68 a2 87 00 00       	push   $0x87a2
    17cb:	e8 bc f8 ff ff       	call   108c <disp_str>
    17d0:	83 c4 10             	add    $0x10,%esp
    17d3:	83 ec 08             	sub    $0x8,%esp
    17d6:	ff 75 e0             	pushl  -0x20(%ebp)
    17d9:	68 bb 87 00 00       	push   $0x87bb
    17de:	e8 e4 f8 ff ff       	call   10c7 <disp_str_colour>
    17e3:	83 c4 10             	add    $0x10,%esp
    17e6:	83 ec 0c             	sub    $0xc,%esp
    17e9:	ff 75 10             	pushl  0x10(%ebp)
    17ec:	e8 83 fe ff ff       	call   1674 <disp_int>
    17f1:	83 c4 10             	add    $0x10,%esp
    17f4:	83 ec 0c             	sub    $0xc,%esp
    17f7:	68 a2 87 00 00       	push   $0x87a2
    17fc:	e8 8b f8 ff ff       	call   108c <disp_str>
    1801:	83 c4 10             	add    $0x10,%esp
    1804:	83 ec 08             	sub    $0x8,%esp
    1807:	ff 75 e0             	pushl  -0x20(%ebp)
    180a:	68 c0 87 00 00       	push   $0x87c0
    180f:	e8 b3 f8 ff ff       	call   10c7 <disp_str_colour>
    1814:	83 c4 10             	add    $0x10,%esp
    1817:	83 ec 0c             	sub    $0xc,%esp
    181a:	ff 75 18             	pushl  0x18(%ebp)
    181d:	e8 52 fe ff ff       	call   1674 <disp_int>
    1822:	83 c4 10             	add    $0x10,%esp
    1825:	83 ec 0c             	sub    $0xc,%esp
    1828:	68 a2 87 00 00       	push   $0x87a2
    182d:	e8 5a f8 ff ff       	call   108c <disp_str>
    1832:	83 c4 10             	add    $0x10,%esp
    1835:	90                   	nop
    1836:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1839:	5b                   	pop    %ebx
    183a:	5e                   	pop    %esi
    183b:	5f                   	pop    %edi
    183c:	5d                   	pop    %ebp
    183d:	c3                   	ret    

0000183e <init_internal_interrupt>:
    183e:	55                   	push   %ebp
    183f:	89 e5                	mov    %esp,%ebp
    1841:	83 ec 08             	sub    $0x8,%esp
    1844:	6a 0e                	push   $0xe
    1846:	6a 08                	push   $0x8
    1848:	68 03 11 00 00       	push   $0x1103
    184d:	6a 00                	push   $0x0
    184f:	e8 64 53 00 00       	call   6bb8 <InitInterruptDesc>
    1854:	83 c4 10             	add    $0x10,%esp
    1857:	6a 0e                	push   $0xe
    1859:	6a 08                	push   $0x8
    185b:	68 09 11 00 00       	push   $0x1109
    1860:	6a 01                	push   $0x1
    1862:	e8 51 53 00 00       	call   6bb8 <InitInterruptDesc>
    1867:	83 c4 10             	add    $0x10,%esp
    186a:	6a 0e                	push   $0xe
    186c:	6a 08                	push   $0x8
    186e:	68 0f 11 00 00       	push   $0x110f
    1873:	6a 02                	push   $0x2
    1875:	e8 3e 53 00 00       	call   6bb8 <InitInterruptDesc>
    187a:	83 c4 10             	add    $0x10,%esp
    187d:	6a 0e                	push   $0xe
    187f:	6a 08                	push   $0x8
    1881:	68 15 11 00 00       	push   $0x1115
    1886:	6a 03                	push   $0x3
    1888:	e8 2b 53 00 00       	call   6bb8 <InitInterruptDesc>
    188d:	83 c4 10             	add    $0x10,%esp
    1890:	6a 0e                	push   $0xe
    1892:	6a 08                	push   $0x8
    1894:	68 1b 11 00 00       	push   $0x111b
    1899:	6a 04                	push   $0x4
    189b:	e8 18 53 00 00       	call   6bb8 <InitInterruptDesc>
    18a0:	83 c4 10             	add    $0x10,%esp
    18a3:	6a 0e                	push   $0xe
    18a5:	6a 08                	push   $0x8
    18a7:	68 21 11 00 00       	push   $0x1121
    18ac:	6a 05                	push   $0x5
    18ae:	e8 05 53 00 00       	call   6bb8 <InitInterruptDesc>
    18b3:	83 c4 10             	add    $0x10,%esp
    18b6:	6a 0e                	push   $0xe
    18b8:	6a 08                	push   $0x8
    18ba:	68 27 11 00 00       	push   $0x1127
    18bf:	6a 06                	push   $0x6
    18c1:	e8 f2 52 00 00       	call   6bb8 <InitInterruptDesc>
    18c6:	83 c4 10             	add    $0x10,%esp
    18c9:	6a 0e                	push   $0xe
    18cb:	6a 08                	push   $0x8
    18cd:	68 2d 11 00 00       	push   $0x112d
    18d2:	6a 07                	push   $0x7
    18d4:	e8 df 52 00 00       	call   6bb8 <InitInterruptDesc>
    18d9:	83 c4 10             	add    $0x10,%esp
    18dc:	6a 0e                	push   $0xe
    18de:	6a 08                	push   $0x8
    18e0:	68 33 11 00 00       	push   $0x1133
    18e5:	6a 08                	push   $0x8
    18e7:	e8 cc 52 00 00       	call   6bb8 <InitInterruptDesc>
    18ec:	83 c4 10             	add    $0x10,%esp
    18ef:	6a 0e                	push   $0xe
    18f1:	6a 08                	push   $0x8
    18f3:	68 37 11 00 00       	push   $0x1137
    18f8:	6a 09                	push   $0x9
    18fa:	e8 b9 52 00 00       	call   6bb8 <InitInterruptDesc>
    18ff:	83 c4 10             	add    $0x10,%esp
    1902:	6a 0e                	push   $0xe
    1904:	6a 08                	push   $0x8
    1906:	68 3d 11 00 00       	push   $0x113d
    190b:	6a 0a                	push   $0xa
    190d:	e8 a6 52 00 00       	call   6bb8 <InitInterruptDesc>
    1912:	83 c4 10             	add    $0x10,%esp
    1915:	6a 0e                	push   $0xe
    1917:	6a 08                	push   $0x8
    1919:	68 41 11 00 00       	push   $0x1141
    191e:	6a 0b                	push   $0xb
    1920:	e8 93 52 00 00       	call   6bb8 <InitInterruptDesc>
    1925:	83 c4 10             	add    $0x10,%esp
    1928:	6a 0e                	push   $0xe
    192a:	6a 08                	push   $0x8
    192c:	68 45 11 00 00       	push   $0x1145
    1931:	6a 0c                	push   $0xc
    1933:	e8 80 52 00 00       	call   6bb8 <InitInterruptDesc>
    1938:	83 c4 10             	add    $0x10,%esp
    193b:	6a 0e                	push   $0xe
    193d:	6a 08                	push   $0x8
    193f:	68 49 11 00 00       	push   $0x1149
    1944:	6a 0d                	push   $0xd
    1946:	e8 6d 52 00 00       	call   6bb8 <InitInterruptDesc>
    194b:	83 c4 10             	add    $0x10,%esp
    194e:	6a 0e                	push   $0xe
    1950:	6a 08                	push   $0x8
    1952:	68 4d 11 00 00       	push   $0x114d
    1957:	6a 0e                	push   $0xe
    1959:	e8 5a 52 00 00       	call   6bb8 <InitInterruptDesc>
    195e:	83 c4 10             	add    $0x10,%esp
    1961:	6a 0e                	push   $0xe
    1963:	6a 08                	push   $0x8
    1965:	68 51 11 00 00       	push   $0x1151
    196a:	6a 10                	push   $0x10
    196c:	e8 47 52 00 00       	call   6bb8 <InitInterruptDesc>
    1971:	83 c4 10             	add    $0x10,%esp
    1974:	6a 0e                	push   $0xe
    1976:	6a 08                	push   $0x8
    1978:	68 57 11 00 00       	push   $0x1157
    197d:	6a 11                	push   $0x11
    197f:	e8 34 52 00 00       	call   6bb8 <InitInterruptDesc>
    1984:	83 c4 10             	add    $0x10,%esp
    1987:	6a 0e                	push   $0xe
    1989:	6a 08                	push   $0x8
    198b:	68 5b 11 00 00       	push   $0x115b
    1990:	6a 12                	push   $0x12
    1992:	e8 21 52 00 00       	call   6bb8 <InitInterruptDesc>
    1997:	83 c4 10             	add    $0x10,%esp
    199a:	6a 0e                	push   $0xe
    199c:	6a 0e                	push   $0xe
    199e:	68 45 12 00 00       	push   $0x1245
    19a3:	68 90 00 00 00       	push   $0x90
    19a8:	e8 0b 52 00 00       	call   6bb8 <InitInterruptDesc>
    19ad:	83 c4 10             	add    $0x10,%esp
    19b0:	90                   	nop
    19b1:	c9                   	leave  
    19b2:	c3                   	ret    

000019b3 <test>:
    19b3:	55                   	push   %ebp
    19b4:	89 e5                	mov    %esp,%ebp
    19b6:	83 ec 08             	sub    $0x8,%esp
    19b9:	83 ec 0c             	sub    $0xc,%esp
    19bc:	68 0c 8a 00 00       	push   $0x8a0c
    19c1:	e8 c6 f6 ff ff       	call   108c <disp_str>
    19c6:	83 c4 10             	add    $0x10,%esp
    19c9:	83 ec 0c             	sub    $0xc,%esp
    19cc:	6a 06                	push   $0x6
    19ce:	e8 a1 fc ff ff       	call   1674 <disp_int>
    19d3:	83 c4 10             	add    $0x10,%esp
    19d6:	83 ec 0c             	sub    $0xc,%esp
    19d9:	68 0e 8a 00 00       	push   $0x8a0e
    19de:	e8 a9 f6 ff ff       	call   108c <disp_str>
    19e3:	83 c4 10             	add    $0x10,%esp
    19e6:	90                   	nop
    19e7:	c9                   	leave  
    19e8:	c3                   	ret    

000019e9 <disp_str_colour3>:
    19e9:	55                   	push   %ebp
    19ea:	89 e5                	mov    %esp,%ebp
    19ec:	90                   	nop
    19ed:	5d                   	pop    %ebp
    19ee:	c3                   	ret    

000019ef <spurious_irq>:
    19ef:	55                   	push   %ebp
    19f0:	89 e5                	mov    %esp,%ebp
    19f2:	83 ec 08             	sub    $0x8,%esp
    19f5:	83 ec 08             	sub    $0x8,%esp
    19f8:	6a 0b                	push   $0xb
    19fa:	68 10 8a 00 00       	push   $0x8a10
    19ff:	e8 c3 f6 ff ff       	call   10c7 <disp_str_colour>
    1a04:	83 c4 10             	add    $0x10,%esp
    1a07:	83 ec 0c             	sub    $0xc,%esp
    1a0a:	ff 75 08             	pushl  0x8(%ebp)
    1a0d:	e8 62 fc ff ff       	call   1674 <disp_int>
    1a12:	83 c4 10             	add    $0x10,%esp
    1a15:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    1a1a:	83 c0 01             	add    $0x1,%eax
    1a1d:	a3 a0 fe 00 00       	mov    %eax,0xfea0
    1a22:	83 ec 0c             	sub    $0xc,%esp
    1a25:	68 37 8a 00 00       	push   $0x8a37
    1a2a:	e8 5d f6 ff ff       	call   108c <disp_str>
    1a2f:	83 c4 10             	add    $0x10,%esp
    1a32:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    1a37:	83 ec 0c             	sub    $0xc,%esp
    1a3a:	50                   	push   %eax
    1a3b:	e8 34 fc ff ff       	call   1674 <disp_int>
    1a40:	83 c4 10             	add    $0x10,%esp
    1a43:	83 ec 0c             	sub    $0xc,%esp
    1a46:	68 39 8a 00 00       	push   $0x8a39
    1a4b:	e8 3c f6 ff ff       	call   108c <disp_str>
    1a50:	83 c4 10             	add    $0x10,%esp
    1a53:	83 ec 08             	sub    $0x8,%esp
    1a56:	6a 0c                	push   $0xc
    1a58:	68 3c 8a 00 00       	push   $0x8a3c
    1a5d:	e8 65 f6 ff ff       	call   10c7 <disp_str_colour>
    1a62:	83 c4 10             	add    $0x10,%esp
    1a65:	90                   	nop
    1a66:	c9                   	leave  
    1a67:	c3                   	ret    

00001a68 <kernel_main>:
    1a68:	55                   	push   %ebp
    1a69:	89 e5                	mov    %esp,%ebp
    1a6b:	83 ec 38             	sub    $0x38,%esp
    1a6e:	c7 05 a0 fe 00 00 00 	movl   $0x0,0xfea0
    1a75:	00 00 00 
    1a78:	c7 05 8c f6 00 00 00 	movl   $0x0,0xf68c
    1a7f:	00 00 00 
    1a82:	c7 05 54 d7 00 00 00 	movl   $0x0,0xd754
    1a89:	00 00 00 
    1a8c:	c7 45 e8 80 11 08 00 	movl   $0x81180,-0x18(%ebp)
    1a93:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1a9a:	e9 d4 02 00 00       	jmp    1d73 <kernel_main+0x30b>
    1a9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1aa2:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    1aa8:	05 80 11 08 00       	add    $0x81180,%eax
    1aad:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1ab0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ab3:	83 c0 09             	add    $0x9,%eax
    1ab6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1abd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ac0:	66 89 50 44          	mov    %dx,0x44(%eax)
    1ac4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1ac7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1aca:	89 50 58             	mov    %edx,0x58(%eax)
    1acd:	83 7d e4 06          	cmpl   $0x6,-0x1c(%ebp)
    1ad1:	7e 0f                	jle    1ae2 <kernel_main+0x7a>
    1ad3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ad6:	c6 80 7c 01 00 00 ff 	movb   $0xff,0x17c(%eax)
    1add:	e9 8d 02 00 00       	jmp    1d6f <kernel_main+0x307>
    1ae2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ae5:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    1aec:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
    1af0:	7f 3f                	jg     1b31 <kernel_main+0xc9>
    1af2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1af5:	6b c0 1c             	imul   $0x1c,%eax,%eax
    1af8:	05 80 c0 00 00       	add    $0xc080,%eax
    1afd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b00:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
    1b07:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    1b0b:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
    1b0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b12:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
    1b19:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b1c:	8b 50 60             	mov    0x60(%eax),%edx
    1b1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b22:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b25:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b28:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
    1b2f:	eb 42                	jmp    1b73 <kernel_main+0x10b>
    1b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b34:	6b c0 1c             	imul   $0x1c,%eax,%eax
    1b37:	2d 8c 00 00 00       	sub    $0x8c,%eax
    1b3c:	05 40 c0 00 00       	add    $0xc040,%eax
    1b41:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b44:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
    1b4b:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
    1b4f:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
    1b53:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b56:	c7 40 60 05 00 00 00 	movl   $0x5,0x60(%eax)
    1b5d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b60:	8b 50 60             	mov    0x60(%eax),%edx
    1b63:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b66:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b69:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b6c:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
    1b73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b76:	8b 55 dc             	mov    -0x24(%ebp),%edx
    1b79:	83 c2 68             	add    $0x68,%edx
    1b7c:	83 ec 08             	sub    $0x8,%esp
    1b7f:	50                   	push   %eax
    1b80:	52                   	push   %edx
    1b81:	e8 52 76 00 00       	call   91d8 <Strcpy>
    1b86:	83 c4 10             	add    $0x10,%esp
    1b89:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b8c:	83 c0 46             	add    $0x46,%eax
    1b8f:	83 ec 04             	sub    $0x4,%esp
    1b92:	6a 08                	push   $0x8
    1b94:	68 68 d7 00 00       	push   $0xd768
    1b99:	50                   	push   %eax
    1b9a:	e8 ec 75 00 00       	call   918b <Memcpy>
    1b9f:	83 c4 10             	add    $0x10,%esp
    1ba2:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1ba6:	c1 e0 05             	shl    $0x5,%eax
    1ba9:	83 c8 9a             	or     $0xffffff9a,%eax
    1bac:	89 c2                	mov    %eax,%edx
    1bae:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bb1:	88 50 4b             	mov    %dl,0x4b(%eax)
    1bb4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bb7:	83 c0 4e             	add    $0x4e,%eax
    1bba:	83 ec 04             	sub    $0x4,%esp
    1bbd:	6a 08                	push   $0x8
    1bbf:	68 90 d7 00 00       	push   $0xd790
    1bc4:	50                   	push   %eax
    1bc5:	e8 c1 75 00 00       	call   918b <Memcpy>
    1bca:	83 c4 10             	add    $0x10,%esp
    1bcd:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1bd1:	c1 e0 05             	shl    $0x5,%eax
    1bd4:	83 c8 92             	or     $0xffffff92,%eax
    1bd7:	89 c2                	mov    %eax,%edx
    1bd9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bdc:	88 50 53             	mov    %dl,0x53(%eax)
    1bdf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1be2:	83 c0 68             	add    $0x68,%eax
    1be5:	83 ec 08             	sub    $0x8,%esp
    1be8:	68 61 8a 00 00       	push   $0x8a61
    1bed:	50                   	push   %eax
    1bee:	e8 14 1f 00 00       	call   3b07 <strcmp>
    1bf3:	83 c4 10             	add    $0x10,%esp
    1bf6:	85 c0                	test   %eax,%eax
    1bf8:	75 7b                	jne    1c75 <kernel_main+0x20d>
    1bfa:	c7 45 d8 00 10 10 00 	movl   $0x101000,-0x28(%ebp)
    1c01:	c7 45 d4 fa 0c 00 00 	movl   $0xcfa,-0x2c(%ebp)
    1c08:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c0b:	0f b7 c0             	movzwl %ax,%eax
    1c0e:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1c11:	83 ea 01             	sub    $0x1,%edx
    1c14:	c1 fa 0c             	sar    $0xc,%edx
    1c17:	89 d1                	mov    %edx,%ecx
    1c19:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1c1c:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    1c22:	83 c2 40             	add    $0x40,%edx
    1c25:	81 c2 80 11 08 00    	add    $0x81180,%edx
    1c2b:	83 c2 06             	add    $0x6,%edx
    1c2e:	50                   	push   %eax
    1c2f:	51                   	push   %ecx
    1c30:	6a 00                	push   $0x0
    1c32:	52                   	push   %edx
    1c33:	e8 cb 4c 00 00       	call   6903 <InitDescriptor>
    1c38:	83 c4 10             	add    $0x10,%esp
    1c3b:	c7 45 d0 f2 0c 00 00 	movl   $0xcf2,-0x30(%ebp)
    1c42:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1c45:	0f b7 c0             	movzwl %ax,%eax
    1c48:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1c4b:	83 ea 01             	sub    $0x1,%edx
    1c4e:	c1 fa 0c             	sar    $0xc,%edx
    1c51:	89 d1                	mov    %edx,%ecx
    1c53:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1c56:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    1c5c:	83 c2 48             	add    $0x48,%edx
    1c5f:	81 c2 80 11 08 00    	add    $0x81180,%edx
    1c65:	83 c2 06             	add    $0x6,%edx
    1c68:	50                   	push   %eax
    1c69:	51                   	push   %ecx
    1c6a:	6a 00                	push   $0x0
    1c6c:	52                   	push   %edx
    1c6d:	e8 91 4c 00 00       	call   6903 <InitDescriptor>
    1c72:	83 c4 10             	add    $0x10,%esp
    1c75:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c79:	83 c8 04             	or     $0x4,%eax
    1c7c:	0f b6 c0             	movzbl %al,%eax
    1c7f:	66 89 45 ce          	mov    %ax,-0x32(%ebp)
    1c83:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c87:	83 c8 0c             	or     $0xc,%eax
    1c8a:	0f b6 c0             	movzbl %al,%eax
    1c8d:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
    1c91:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
    1c95:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c98:	89 50 34             	mov    %edx,0x34(%eax)
    1c9b:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1c9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ca2:	89 50 0c             	mov    %edx,0xc(%eax)
    1ca5:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1ca9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cac:	89 50 04             	mov    %edx,0x4(%eax)
    1caf:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1cb3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cb6:	89 50 08             	mov    %edx,0x8(%eax)
    1cb9:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1cbd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cc0:	89 50 40             	mov    %edx,0x40(%eax)
    1cc3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cc6:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
    1ccc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ccf:	8b 40 14             	mov    0x14(%eax),%eax
    1cd2:	89 c2                	mov    %eax,%edx
    1cd4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cd7:	89 50 30             	mov    %edx,0x30(%eax)
    1cda:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cdd:	83 c0 68             	add    $0x68,%eax
    1ce0:	83 ec 08             	sub    $0x8,%esp
    1ce3:	68 61 8a 00 00       	push   $0x8a61
    1ce8:	50                   	push   %eax
    1ce9:	e8 19 1e 00 00       	call   3b07 <strcmp>
    1cee:	83 c4 10             	add    $0x10,%esp
    1cf1:	85 c0                	test   %eax,%eax
    1cf3:	75 0b                	jne    1d00 <kernel_main+0x298>
    1cf5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1cf8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cfb:	89 50 3c             	mov    %edx,0x3c(%eax)
    1cfe:	eb 09                	jmp    1d09 <kernel_main+0x2a1>
    1d00:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1d03:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d06:	89 50 3c             	mov    %edx,0x3c(%eax)
    1d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d0c:	0f b7 40 18          	movzwl 0x18(%eax),%eax
    1d10:	0f b7 c0             	movzwl %ax,%eax
    1d13:	f7 d8                	neg    %eax
    1d15:	01 45 e8             	add    %eax,-0x18(%ebp)
    1d18:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d1b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d1e:	89 50 38             	mov    %edx,0x38(%eax)
    1d21:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d24:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    1d2b:	00 00 00 
    1d2e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d31:	c7 80 8c 01 00 00 00 	movl   $0x0,0x18c(%eax)
    1d38:	00 00 00 
    1d3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d3e:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    1d45:	00 00 00 
    1d48:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d4b:	c7 80 88 01 00 00 20 	movl   $0x20,0x188(%eax)
    1d52:	00 00 00 
    1d55:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d58:	c7 80 84 01 00 00 20 	movl   $0x20,0x184(%eax)
    1d5f:	00 00 00 
    1d62:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d65:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    1d6c:	00 00 00 
    1d6f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1d73:	83 7d e4 26          	cmpl   $0x26,-0x1c(%ebp)
    1d77:	0f 8e 22 fd ff ff    	jle    1a9f <kernel_main+0x37>
    1d7d:	c7 05 60 db 00 00 80 	movl   $0x81180,0xdb60
    1d84:	11 08 00 
    1d87:	83 ec 04             	sub    $0x4,%esp
    1d8a:	68 00 02 00 00       	push   $0x200
    1d8f:	6a 00                	push   $0x0
    1d91:	68 8c db 00 00       	push   $0xdb8c
    1d96:	e8 1e 74 00 00       	call   91b9 <Memset>
    1d9b:	83 c4 10             	add    $0x10,%esp
    1d9e:	c7 05 80 db 00 00 8c 	movl   $0xdb8c,0xdb80
    1da5:	db 00 00 
    1da8:	a1 80 db 00 00       	mov    0xdb80,%eax
    1dad:	a3 84 db 00 00       	mov    %eax,0xdb84
    1db2:	c7 05 88 db 00 00 00 	movl   $0x0,0xdb88
    1db9:	00 00 00 
    1dbc:	c7 05 50 d7 00 00 00 	movl   $0x0,0xd750
    1dc3:	00 00 00 
    1dc6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1dcd:	eb 14                	jmp    1de3 <kernel_main+0x37b>
    1dcf:	83 ec 0c             	sub    $0xc,%esp
    1dd2:	68 a0 87 00 00       	push   $0x87a0
    1dd7:	e8 b0 f2 ff ff       	call   108c <disp_str>
    1ddc:	83 c4 10             	add    $0x10,%esp
    1ddf:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1de3:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
    1dea:	7e e3                	jle    1dcf <kernel_main+0x367>
    1dec:	c7 05 50 d7 00 00 00 	movl   $0x0,0xd750
    1df3:	00 00 00 
    1df6:	e8 2d 5b 00 00       	call   7928 <init_keyboard_handler>
    1dfb:	e8 8f f4 ff ff       	call   128f <restart>
    1e00:	eb fe                	jmp    1e00 <kernel_main+0x398>

00001e02 <TestFS>:
    1e02:	55                   	push   %ebp
    1e03:	89 e5                	mov    %esp,%ebp
    1e05:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
    1e0b:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
    1e12:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
    1e19:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
    1e1f:	83 ec 08             	sub    $0x8,%esp
    1e22:	6a 02                	push   $0x2
    1e24:	8d 45 be             	lea    -0x42(%ebp),%eax
    1e27:	50                   	push   %eax
    1e28:	e8 a1 5c 00 00       	call   7ace <open>
    1e2d:	83 c4 10             	add    $0x10,%esp
    1e30:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1e33:	83 ec 08             	sub    $0x8,%esp
    1e36:	6a 02                	push   $0x2
    1e38:	8d 45 be             	lea    -0x42(%ebp),%eax
    1e3b:	50                   	push   %eax
    1e3c:	e8 8d 5c 00 00       	call   7ace <open>
    1e41:	83 c4 10             	add    $0x10,%esp
    1e44:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e47:	83 ec 0c             	sub    $0xc,%esp
    1e4a:	68 66 8a 00 00       	push   $0x8a66
    1e4f:	e8 09 0e 00 00       	call   2c5d <Printf>
    1e54:	83 c4 10             	add    $0x10,%esp
    1e57:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
    1e5e:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    1e62:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
    1e69:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    1e6d:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
    1e74:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
    1e7b:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
    1e81:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1e88:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    1e8c:	75 fa                	jne    1e88 <TestFS+0x86>
    1e8e:	83 ec 08             	sub    $0x8,%esp
    1e91:	6a 07                	push   $0x7
    1e93:	8d 45 b9             	lea    -0x47(%ebp),%eax
    1e96:	50                   	push   %eax
    1e97:	e8 32 5c 00 00       	call   7ace <open>
    1e9c:	83 c4 10             	add    $0x10,%esp
    1e9f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1ea2:	83 ec 08             	sub    $0x8,%esp
    1ea5:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ea8:	68 78 8a 00 00       	push   $0x8a78
    1ead:	e8 ab 0d 00 00       	call   2c5d <Printf>
    1eb2:	83 c4 10             	add    $0x10,%esp
    1eb5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1ebc:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
    1ec3:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
    1eca:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
    1ed1:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
    1ed8:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
    1edf:	83 ec 0c             	sub    $0xc,%esp
    1ee2:	8d 45 96             	lea    -0x6a(%ebp),%eax
    1ee5:	50                   	push   %eax
    1ee6:	e8 07 73 00 00       	call   91f2 <Strlen>
    1eeb:	83 c4 10             	add    $0x10,%esp
    1eee:	83 ec 04             	sub    $0x4,%esp
    1ef1:	50                   	push   %eax
    1ef2:	8d 45 96             	lea    -0x6a(%ebp),%eax
    1ef5:	50                   	push   %eax
    1ef6:	ff 75 e4             	pushl  -0x1c(%ebp)
    1ef9:	e8 5c 5c 00 00       	call   7b5a <write>
    1efe:	83 c4 10             	add    $0x10,%esp
    1f01:	83 ec 04             	sub    $0x4,%esp
    1f04:	6a 14                	push   $0x14
    1f06:	6a 00                	push   $0x0
    1f08:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1f0b:	50                   	push   %eax
    1f0c:	e8 a8 72 00 00       	call   91b9 <Memset>
    1f11:	83 c4 10             	add    $0x10,%esp
    1f14:	83 ec 04             	sub    $0x4,%esp
    1f17:	6a 12                	push   $0x12
    1f19:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1f1c:	50                   	push   %eax
    1f1d:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f20:	e8 fe 5b 00 00       	call   7b23 <read>
    1f25:	83 c4 10             	add    $0x10,%esp
    1f28:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1f2b:	83 ec 08             	sub    $0x8,%esp
    1f2e:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1f31:	50                   	push   %eax
    1f32:	68 81 8a 00 00       	push   $0x8a81
    1f37:	e8 21 0d 00 00       	call   2c5d <Printf>
    1f3c:	83 c4 10             	add    $0x10,%esp
    1f3f:	83 ec 0c             	sub    $0xc,%esp
    1f42:	6a 0a                	push   $0xa
    1f44:	e8 67 0b 00 00       	call   2ab0 <delay>
    1f49:	83 c4 10             	add    $0x10,%esp
    1f4c:	83 ec 08             	sub    $0x8,%esp
    1f4f:	6a 07                	push   $0x7
    1f51:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    1f54:	50                   	push   %eax
    1f55:	e8 74 5b 00 00       	call   7ace <open>
    1f5a:	83 c4 10             	add    $0x10,%esp
    1f5d:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1f60:	83 ec 08             	sub    $0x8,%esp
    1f63:	ff 75 dc             	pushl  -0x24(%ebp)
    1f66:	68 8c 8a 00 00       	push   $0x8a8c
    1f6b:	e8 ed 0c 00 00       	call   2c5d <Printf>
    1f70:	83 c4 10             	add    $0x10,%esp
    1f73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f7a:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
    1f81:	67 3a 68 
    1f84:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
    1f8b:	77 20 61 
    1f8e:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
    1f95:	65 20 79 
    1f98:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
    1f9f:	75 3f 00 
    1fa2:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
    1fa9:	00 00 00 
    1fac:	83 ec 0c             	sub    $0xc,%esp
    1faf:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
    1fb5:	50                   	push   %eax
    1fb6:	e8 37 72 00 00       	call   91f2 <Strlen>
    1fbb:	83 c4 10             	add    $0x10,%esp
    1fbe:	83 ec 04             	sub    $0x4,%esp
    1fc1:	50                   	push   %eax
    1fc2:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
    1fc8:	50                   	push   %eax
    1fc9:	ff 75 dc             	pushl  -0x24(%ebp)
    1fcc:	e8 89 5b 00 00       	call   7b5a <write>
    1fd1:	83 c4 10             	add    $0x10,%esp
    1fd4:	83 ec 04             	sub    $0x4,%esp
    1fd7:	6a 14                	push   $0x14
    1fd9:	6a 00                	push   $0x0
    1fdb:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    1fe1:	50                   	push   %eax
    1fe2:	e8 d2 71 00 00       	call   91b9 <Memset>
    1fe7:	83 c4 10             	add    $0x10,%esp
    1fea:	83 ec 04             	sub    $0x4,%esp
    1fed:	6a 12                	push   $0x12
    1fef:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    1ff5:	50                   	push   %eax
    1ff6:	ff 75 dc             	pushl  -0x24(%ebp)
    1ff9:	e8 25 5b 00 00       	call   7b23 <read>
    1ffe:	83 c4 10             	add    $0x10,%esp
    2001:	89 45 d8             	mov    %eax,-0x28(%ebp)
    2004:	83 ec 08             	sub    $0x8,%esp
    2007:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    200d:	50                   	push   %eax
    200e:	68 96 8a 00 00       	push   $0x8a96
    2013:	e8 45 0c 00 00       	call   2c5d <Printf>
    2018:	83 c4 10             	add    $0x10,%esp
    201b:	83 ec 08             	sub    $0x8,%esp
    201e:	6a 07                	push   $0x7
    2020:	8d 45 aa             	lea    -0x56(%ebp),%eax
    2023:	50                   	push   %eax
    2024:	e8 a5 5a 00 00       	call   7ace <open>
    2029:	83 c4 10             	add    $0x10,%esp
    202c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    202f:	83 ec 08             	sub    $0x8,%esp
    2032:	ff 75 dc             	pushl  -0x24(%ebp)
    2035:	68 8c 8a 00 00       	push   $0x8a8c
    203a:	e8 1e 0c 00 00       	call   2c5d <Printf>
    203f:	83 c4 10             	add    $0x10,%esp
    2042:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2049:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
    2050:	20 77 69 
    2053:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
    205a:	6c 20 73 
    205d:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
    2064:	63 63 65 
    2067:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
    206e:	73 20 61 
    2071:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
    2078:	20 6c 61 
    207b:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
    2082:	74 2e 00 
    2085:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
    208c:	00 00 00 
    208f:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
    2096:	00 00 
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    20a1:	50                   	push   %eax
    20a2:	e8 4b 71 00 00       	call   91f2 <Strlen>
    20a7:	83 c4 10             	add    $0x10,%esp
    20aa:	83 ec 04             	sub    $0x4,%esp
    20ad:	50                   	push   %eax
    20ae:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    20b4:	50                   	push   %eax
    20b5:	ff 75 d4             	pushl  -0x2c(%ebp)
    20b8:	e8 9d 5a 00 00       	call   7b5a <write>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    20c7:	eb 5c                	jmp    2125 <TestFS+0x323>
    20c9:	83 ec 04             	sub    $0x4,%esp
    20cc:	6a 1e                	push   $0x1e
    20ce:	6a 00                	push   $0x0
    20d0:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    20d6:	50                   	push   %eax
    20d7:	e8 dd 70 00 00       	call   91b9 <Memset>
    20dc:	83 c4 10             	add    $0x10,%esp
    20df:	83 ec 0c             	sub    $0xc,%esp
    20e2:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    20e8:	50                   	push   %eax
    20e9:	e8 04 71 00 00       	call   91f2 <Strlen>
    20ee:	83 c4 10             	add    $0x10,%esp
    20f1:	83 ec 04             	sub    $0x4,%esp
    20f4:	50                   	push   %eax
    20f5:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    20fb:	50                   	push   %eax
    20fc:	ff 75 d4             	pushl  -0x2c(%ebp)
    20ff:	e8 1f 5a 00 00       	call   7b23 <read>
    2104:	83 c4 10             	add    $0x10,%esp
    2107:	89 45 d0             	mov    %eax,-0x30(%ebp)
    210a:	83 ec 08             	sub    $0x8,%esp
    210d:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    2113:	50                   	push   %eax
    2114:	68 a1 8a 00 00       	push   $0x8aa1
    2119:	e8 3f 0b 00 00       	call   2c5d <Printf>
    211e:	83 c4 10             	add    $0x10,%esp
    2121:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2125:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
    2129:	7e 9e                	jle    20c9 <TestFS+0x2c7>
    212b:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
    2132:	6e 73 74 
    2135:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
    213c:	6c 6c 2e 
    213f:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
    2146:	61 72 00 
    2149:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
    2150:	00 00 00 
    2153:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
    215a:	00 00 00 
    215d:	83 ec 08             	sub    $0x8,%esp
    2160:	6a 00                	push   $0x0
    2162:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
    2168:	50                   	push   %eax
    2169:	e8 60 59 00 00       	call   7ace <open>
    216e:	83 c4 10             	add    $0x10,%esp
    2171:	89 45 cc             	mov    %eax,-0x34(%ebp)
    2174:	83 ec 08             	sub    $0x8,%esp
    2177:	ff 75 cc             	pushl  -0x34(%ebp)
    217a:	68 ac 8a 00 00       	push   $0x8aac
    217f:	e8 d9 0a 00 00       	call   2c5d <Printf>
    2184:	83 c4 10             	add    $0x10,%esp
    2187:	83 ec 04             	sub    $0x4,%esp
    218a:	6a 14                	push   $0x14
    218c:	6a 00                	push   $0x0
    218e:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    2194:	50                   	push   %eax
    2195:	e8 1f 70 00 00       	call   91b9 <Memset>
    219a:	83 c4 10             	add    $0x10,%esp
    219d:	83 ec 04             	sub    $0x4,%esp
    21a0:	68 00 02 00 00       	push   $0x200
    21a5:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    21ab:	50                   	push   %eax
    21ac:	ff 75 cc             	pushl  -0x34(%ebp)
    21af:	e8 6f 59 00 00       	call   7b23 <read>
    21b4:	83 c4 10             	add    $0x10,%esp
    21b7:	89 45 c8             	mov    %eax,-0x38(%ebp)
    21ba:	83 ec 08             	sub    $0x8,%esp
    21bd:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    21c3:	50                   	push   %eax
    21c4:	68 b6 8a 00 00       	push   $0x8ab6
    21c9:	e8 8f 0a 00 00       	call   2c5d <Printf>
    21ce:	83 c4 10             	add    $0x10,%esp
    21d1:	e9 b2 fc ff ff       	jmp    1e88 <TestFS+0x86>

000021d6 <wait_exit>:
    21d6:	55                   	push   %ebp
    21d7:	89 e5                	mov    %esp,%ebp
    21d9:	83 ec 28             	sub    $0x28,%esp
    21dc:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
    21e3:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
    21ea:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
    21f0:	83 ec 08             	sub    $0x8,%esp
    21f3:	6a 02                	push   $0x2
    21f5:	8d 45 de             	lea    -0x22(%ebp),%eax
    21f8:	50                   	push   %eax
    21f9:	e8 d0 58 00 00       	call   7ace <open>
    21fe:	83 c4 10             	add    $0x10,%esp
    2201:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2204:	83 ec 08             	sub    $0x8,%esp
    2207:	6a 02                	push   $0x2
    2209:	8d 45 de             	lea    -0x22(%ebp),%eax
    220c:	50                   	push   %eax
    220d:	e8 bc 58 00 00       	call   7ace <open>
    2212:	83 c4 10             	add    $0x10,%esp
    2215:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2218:	e8 27 5a 00 00       	call   7c44 <fork>
    221d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2220:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2224:	7e 25                	jle    224b <wait_exit+0x75>
    2226:	83 ec 0c             	sub    $0xc,%esp
    2229:	8d 45 d8             	lea    -0x28(%ebp),%eax
    222c:	50                   	push   %eax
    222d:	e8 ab 59 00 00       	call   7bdd <wait>
    2232:	83 c4 10             	add    $0x10,%esp
    2235:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2238:	83 ec 08             	sub    $0x8,%esp
    223b:	50                   	push   %eax
    223c:	68 c1 8a 00 00       	push   $0x8ac1
    2241:	e8 17 0a 00 00       	call   2c5d <Printf>
    2246:	83 c4 10             	add    $0x10,%esp
    2249:	eb fe                	jmp    2249 <wait_exit+0x73>
    224b:	83 ec 0c             	sub    $0xc,%esp
    224e:	68 dc 8a 00 00       	push   $0x8adc
    2253:	e8 05 0a 00 00       	call   2c5d <Printf>
    2258:	83 c4 10             	add    $0x10,%esp
    225b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2262:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2265:	8d 50 01             	lea    0x1(%eax),%edx
    2268:	89 55 f4             	mov    %edx,-0xc(%ebp)
    226b:	3d 50 c3 00 00       	cmp    $0xc350,%eax
    2270:	7f 02                	jg     2274 <wait_exit+0x9e>
    2272:	eb ee                	jmp    2262 <wait_exit+0x8c>
    2274:	90                   	nop
    2275:	83 ec 0c             	sub    $0xc,%esp
    2278:	68 e8 8a 00 00       	push   $0x8ae8
    227d:	e8 db 09 00 00       	call   2c5d <Printf>
    2282:	83 c4 10             	add    $0x10,%esp
    2285:	83 ec 0c             	sub    $0xc,%esp
    2288:	6a 09                	push   $0x9
    228a:	e8 8c 59 00 00       	call   7c1b <exit>
    228f:	83 c4 10             	add    $0x10,%esp
    2292:	83 ec 0c             	sub    $0xc,%esp
    2295:	68 f6 8a 00 00       	push   $0x8af6
    229a:	e8 be 09 00 00       	call   2c5d <Printf>
    229f:	83 c4 10             	add    $0x10,%esp
    22a2:	eb fe                	jmp    22a2 <wait_exit+0xcc>

000022a4 <INIT_fork>:
    22a4:	55                   	push   %ebp
    22a5:	89 e5                	mov    %esp,%ebp
    22a7:	53                   	push   %ebx
    22a8:	81 ec 84 00 00 00    	sub    $0x84,%esp
    22ae:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
    22b5:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
    22bc:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
    22c2:	83 ec 08             	sub    $0x8,%esp
    22c5:	6a 02                	push   $0x2
    22c7:	8d 45 da             	lea    -0x26(%ebp),%eax
    22ca:	50                   	push   %eax
    22cb:	e8 fe 57 00 00       	call   7ace <open>
    22d0:	83 c4 10             	add    $0x10,%esp
    22d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    22d6:	83 ec 08             	sub    $0x8,%esp
    22d9:	6a 02                	push   $0x2
    22db:	8d 45 da             	lea    -0x26(%ebp),%eax
    22de:	50                   	push   %eax
    22df:	e8 ea 57 00 00       	call   7ace <open>
    22e4:	83 c4 10             	add    $0x10,%esp
    22e7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    22ea:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
    22f1:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
    22f8:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
    22ff:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
    2306:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
    230d:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
    2314:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
    231b:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
    2322:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
    2329:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
    2330:	83 ec 0c             	sub    $0xc,%esp
    2333:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2336:	50                   	push   %eax
    2337:	e8 b6 6e 00 00       	call   91f2 <Strlen>
    233c:	83 c4 10             	add    $0x10,%esp
    233f:	83 ec 04             	sub    $0x4,%esp
    2342:	50                   	push   %eax
    2343:	6a 00                	push   $0x0
    2345:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2348:	50                   	push   %eax
    2349:	e8 6b 6e 00 00       	call   91b9 <Memset>
    234e:	83 c4 10             	add    $0x10,%esp
    2351:	83 ec 04             	sub    $0x4,%esp
    2354:	6a 28                	push   $0x28
    2356:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2359:	50                   	push   %eax
    235a:	ff 75 e8             	pushl  -0x18(%ebp)
    235d:	e8 c1 57 00 00       	call   7b23 <read>
    2362:	83 c4 10             	add    $0x10,%esp
    2365:	83 ec 04             	sub    $0x4,%esp
    2368:	6a 28                	push   $0x28
    236a:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    236d:	50                   	push   %eax
    236e:	ff 75 ec             	pushl  -0x14(%ebp)
    2371:	e8 e4 57 00 00       	call   7b5a <write>
    2376:	83 c4 10             	add    $0x10,%esp
    2379:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2380:	e8 bf 58 00 00       	call   7c44 <fork>
    2385:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2388:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    238c:	0f 8e dd 00 00 00    	jle    246f <INIT_fork+0x1cb>
    2392:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2396:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
    239d:	61 72 65 
    23a0:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
    23a7:	8d 45 87             	lea    -0x79(%ebp),%eax
    23aa:	b9 20 00 00 00       	mov    $0x20,%ecx
    23af:	bb 00 00 00 00       	mov    $0x0,%ebx
    23b4:	89 18                	mov    %ebx,(%eax)
    23b6:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
    23ba:	8d 50 04             	lea    0x4(%eax),%edx
    23bd:	83 e2 fc             	and    $0xfffffffc,%edx
    23c0:	29 d0                	sub    %edx,%eax
    23c2:	01 c1                	add    %eax,%ecx
    23c4:	83 e1 fc             	and    $0xfffffffc,%ecx
    23c7:	83 e1 fc             	and    $0xfffffffc,%ecx
    23ca:	b8 00 00 00 00       	mov    $0x0,%eax
    23cf:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
    23d2:	83 c0 04             	add    $0x4,%eax
    23d5:	39 c8                	cmp    %ecx,%eax
    23d7:	72 f6                	jb     23cf <INIT_fork+0x12b>
    23d9:	01 c2                	add    %eax,%edx
    23db:	83 ec 0c             	sub    $0xc,%esp
    23de:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    23e4:	50                   	push   %eax
    23e5:	e8 08 6e 00 00       	call   91f2 <Strlen>
    23ea:	83 c4 10             	add    $0x10,%esp
    23ed:	83 ec 04             	sub    $0x4,%esp
    23f0:	50                   	push   %eax
    23f1:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    23f7:	50                   	push   %eax
    23f8:	ff 75 ec             	pushl  -0x14(%ebp)
    23fb:	e8 5a 57 00 00       	call   7b5a <write>
    2400:	83 c4 10             	add    $0x10,%esp
    2403:	83 ec 0c             	sub    $0xc,%esp
    2406:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    240c:	50                   	push   %eax
    240d:	e8 e0 6d 00 00       	call   91f2 <Strlen>
    2412:	83 c4 10             	add    $0x10,%esp
    2415:	83 ec 04             	sub    $0x4,%esp
    2418:	50                   	push   %eax
    2419:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    241f:	50                   	push   %eax
    2420:	ff 75 ec             	pushl  -0x14(%ebp)
    2423:	e8 32 57 00 00       	call   7b5a <write>
    2428:	83 c4 10             	add    $0x10,%esp
    242b:	83 ec 0c             	sub    $0xc,%esp
    242e:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2434:	50                   	push   %eax
    2435:	e8 b8 6d 00 00       	call   91f2 <Strlen>
    243a:	83 c4 10             	add    $0x10,%esp
    243d:	83 ec 04             	sub    $0x4,%esp
    2440:	50                   	push   %eax
    2441:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2447:	50                   	push   %eax
    2448:	ff 75 ec             	pushl  -0x14(%ebp)
    244b:	e8 0a 57 00 00       	call   7b5a <write>
    2450:	83 c4 10             	add    $0x10,%esp
    2453:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    245a:	eb 08                	jmp    2464 <INIT_fork+0x1c0>
    245c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2460:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2464:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    2468:	7e f2                	jle    245c <INIT_fork+0x1b8>
    246a:	e9 0f 01 00 00       	jmp    257e <INIT_fork+0x2da>
    246f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2473:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
    2477:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
    247e:	68 69 6c 
    2481:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
    2488:	8d 45 87             	lea    -0x79(%ebp),%eax
    248b:	b9 20 00 00 00       	mov    $0x20,%ecx
    2490:	bb 00 00 00 00       	mov    $0x0,%ebx
    2495:	89 18                	mov    %ebx,(%eax)
    2497:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
    249b:	8d 50 04             	lea    0x4(%eax),%edx
    249e:	83 e2 fc             	and    $0xfffffffc,%edx
    24a1:	29 d0                	sub    %edx,%eax
    24a3:	01 c1                	add    %eax,%ecx
    24a5:	83 e1 fc             	and    $0xfffffffc,%ecx
    24a8:	83 e1 fc             	and    $0xfffffffc,%ecx
    24ab:	b8 00 00 00 00       	mov    $0x0,%eax
    24b0:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
    24b3:	83 c0 04             	add    $0x4,%eax
    24b6:	39 c8                	cmp    %ecx,%eax
    24b8:	72 f6                	jb     24b0 <INIT_fork+0x20c>
    24ba:	01 c2                	add    %eax,%edx
    24bc:	83 ec 0c             	sub    $0xc,%esp
    24bf:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    24c5:	50                   	push   %eax
    24c6:	e8 27 6d 00 00       	call   91f2 <Strlen>
    24cb:	83 c4 10             	add    $0x10,%esp
    24ce:	83 ec 04             	sub    $0x4,%esp
    24d1:	50                   	push   %eax
    24d2:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    24d8:	50                   	push   %eax
    24d9:	ff 75 ec             	pushl  -0x14(%ebp)
    24dc:	e8 79 56 00 00       	call   7b5a <write>
    24e1:	83 c4 10             	add    $0x10,%esp
    24e4:	83 ec 0c             	sub    $0xc,%esp
    24e7:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    24ed:	50                   	push   %eax
    24ee:	e8 ff 6c 00 00       	call   91f2 <Strlen>
    24f3:	83 c4 10             	add    $0x10,%esp
    24f6:	83 ec 04             	sub    $0x4,%esp
    24f9:	50                   	push   %eax
    24fa:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2500:	50                   	push   %eax
    2501:	ff 75 ec             	pushl  -0x14(%ebp)
    2504:	e8 51 56 00 00       	call   7b5a <write>
    2509:	83 c4 10             	add    $0x10,%esp
    250c:	83 ec 0c             	sub    $0xc,%esp
    250f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2515:	50                   	push   %eax
    2516:	e8 d7 6c 00 00       	call   91f2 <Strlen>
    251b:	83 c4 10             	add    $0x10,%esp
    251e:	83 ec 04             	sub    $0x4,%esp
    2521:	50                   	push   %eax
    2522:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2528:	50                   	push   %eax
    2529:	ff 75 ec             	pushl  -0x14(%ebp)
    252c:	e8 29 56 00 00       	call   7b5a <write>
    2531:	83 c4 10             	add    $0x10,%esp
    2534:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
    253b:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
    2542:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
    2548:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
    254c:	83 ec 0c             	sub    $0xc,%esp
    254f:	8d 45 a7             	lea    -0x59(%ebp),%eax
    2552:	50                   	push   %eax
    2553:	e8 9a 6c 00 00       	call   91f2 <Strlen>
    2558:	83 c4 10             	add    $0x10,%esp
    255b:	83 ec 04             	sub    $0x4,%esp
    255e:	50                   	push   %eax
    255f:	8d 45 a7             	lea    -0x59(%ebp),%eax
    2562:	50                   	push   %eax
    2563:	ff 75 ec             	pushl  -0x14(%ebp)
    2566:	e8 ef 55 00 00       	call   7b5a <write>
    256b:	83 c4 10             	add    $0x10,%esp
    256e:	83 ec 0c             	sub    $0xc,%esp
    2571:	68 04 8b 00 00       	push   $0x8b04
    2576:	e8 0e 0a 00 00       	call   2f89 <spin>
    257b:	83 c4 10             	add    $0x10,%esp
    257e:	83 ec 0c             	sub    $0xc,%esp
    2581:	68 0b 8b 00 00       	push   $0x8b0b
    2586:	e8 fe 09 00 00       	call   2f89 <spin>
    258b:	83 c4 10             	add    $0x10,%esp
    258e:	90                   	nop
    258f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2592:	c9                   	leave  
    2593:	c3                   	ret    

00002594 <simple_shell>:
    2594:	55                   	push   %ebp
    2595:	89 e5                	mov    %esp,%ebp
    2597:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    259d:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
    25a4:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
    25ab:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
    25b1:	83 ec 08             	sub    $0x8,%esp
    25b4:	6a 02                	push   $0x2
    25b6:	8d 45 c2             	lea    -0x3e(%ebp),%eax
    25b9:	50                   	push   %eax
    25ba:	e8 0f 55 00 00       	call   7ace <open>
    25bf:	83 c4 10             	add    $0x10,%esp
    25c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    25c5:	83 ec 08             	sub    $0x8,%esp
    25c8:	6a 02                	push   $0x2
    25ca:	8d 45 c2             	lea    -0x3e(%ebp),%eax
    25cd:	50                   	push   %eax
    25ce:	e8 fb 54 00 00       	call   7ace <open>
    25d3:	83 c4 10             	add    $0x10,%esp
    25d6:	89 45 dc             	mov    %eax,-0x24(%ebp)
    25d9:	83 ec 04             	sub    $0x4,%esp
    25dc:	68 80 00 00 00       	push   $0x80
    25e1:	6a 00                	push   $0x0
    25e3:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    25e9:	50                   	push   %eax
    25ea:	e8 ca 6b 00 00       	call   91b9 <Memset>
    25ef:	83 c4 10             	add    $0x10,%esp
    25f2:	83 ec 04             	sub    $0x4,%esp
    25f5:	68 80 00 00 00       	push   $0x80
    25fa:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    2600:	50                   	push   %eax
    2601:	ff 75 e0             	pushl  -0x20(%ebp)
    2604:	e8 1a 55 00 00       	call   7b23 <read>
    2609:	83 c4 10             	add    $0x10,%esp
    260c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2613:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    261a:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    2620:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2623:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2626:	0f b6 00             	movzbl (%eax),%eax
    2629:	88 45 db             	mov    %al,-0x25(%ebp)
    262c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    262f:	0f b6 00             	movzbl (%eax),%eax
    2632:	3c 20                	cmp    $0x20,%al
    2634:	74 1d                	je     2653 <simple_shell+0xbf>
    2636:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2639:	0f b6 00             	movzbl (%eax),%eax
    263c:	84 c0                	test   %al,%al
    263e:	74 13                	je     2653 <simple_shell+0xbf>
    2640:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2644:	75 0d                	jne    2653 <simple_shell+0xbf>
    2646:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2649:	89 45 e8             	mov    %eax,-0x18(%ebp)
    264c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    2653:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2656:	0f b6 00             	movzbl (%eax),%eax
    2659:	3c 20                	cmp    $0x20,%al
    265b:	74 0a                	je     2667 <simple_shell+0xd3>
    265d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2660:	0f b6 00             	movzbl (%eax),%eax
    2663:	84 c0                	test   %al,%al
    2665:	75 26                	jne    268d <simple_shell+0xf9>
    2667:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    266b:	75 20                	jne    268d <simple_shell+0xf9>
    266d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2670:	8d 50 01             	lea    0x1(%eax),%edx
    2673:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2676:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2679:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
    2680:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2683:	c6 00 00             	movb   $0x0,(%eax)
    2686:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    268d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2691:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
    2695:	75 8c                	jne    2623 <simple_shell+0x8f>
    2697:	8b 45 f4             	mov    -0xc(%ebp),%eax
    269a:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
    26a1:	00 00 00 00 
    26a5:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
    26ac:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    26b2:	83 ec 08             	sub    $0x8,%esp
    26b5:	6a 02                	push   $0x2
    26b7:	50                   	push   %eax
    26b8:	e8 11 54 00 00       	call   7ace <open>
    26bd:	83 c4 10             	add    $0x10,%esp
    26c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    26c3:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    26c7:	75 54                	jne    271d <simple_shell+0x189>
    26c9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    26d0:	eb 29                	jmp    26fb <simple_shell+0x167>
    26d2:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
    26d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    26db:	01 d0                	add    %edx,%eax
    26dd:	0f b6 00             	movzbl (%eax),%eax
    26e0:	0f be c0             	movsbl %al,%eax
    26e3:	83 ec 04             	sub    $0x4,%esp
    26e6:	50                   	push   %eax
    26e7:	ff 75 e4             	pushl  -0x1c(%ebp)
    26ea:	68 13 8b 00 00       	push   $0x8b13
    26ef:	e8 69 05 00 00       	call   2c5d <Printf>
    26f4:	83 c4 10             	add    $0x10,%esp
    26f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    26fb:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
    26ff:	7e d1                	jle    26d2 <simple_shell+0x13e>
    2701:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    2707:	83 ec 08             	sub    $0x8,%esp
    270a:	50                   	push   %eax
    270b:	68 1a 8b 00 00       	push   $0x8b1a
    2710:	e8 48 05 00 00       	call   2c5d <Printf>
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	e9 bc fe ff ff       	jmp    25d9 <simple_shell+0x45>
    271d:	e8 22 55 00 00       	call   7c44 <fork>
    2722:	89 45 cc             	mov    %eax,-0x34(%ebp)
    2725:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    2729:	7e 17                	jle    2742 <simple_shell+0x1ae>
    272b:	83 ec 0c             	sub    $0xc,%esp
    272e:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    2734:	50                   	push   %eax
    2735:	e8 a3 54 00 00       	call   7bdd <wait>
    273a:	83 c4 10             	add    $0x10,%esp
    273d:	e9 97 fe ff ff       	jmp    25d9 <simple_shell+0x45>
    2742:	83 ec 0c             	sub    $0xc,%esp
    2745:	ff 75 d0             	pushl  -0x30(%ebp)
    2748:	e8 44 54 00 00       	call   7b91 <close>
    274d:	83 c4 10             	add    $0x10,%esp
    2750:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    2756:	83 ec 08             	sub    $0x8,%esp
    2759:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
    275f:	52                   	push   %edx
    2760:	50                   	push   %eax
    2761:	e8 cd 55 00 00       	call   7d33 <execv>
    2766:	83 c4 10             	add    $0x10,%esp
    2769:	eb fe                	jmp    2769 <simple_shell+0x1d5>

0000276b <test_split_str>:
    276b:	55                   	push   %ebp
    276c:	89 e5                	mov    %esp,%ebp
    276e:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
    2774:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    277b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2782:	c7 45 ec 20 8b 00 00 	movl   $0x8b20,-0x14(%ebp)
    2789:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    278d:	75 1a                	jne    27a9 <test_split_str+0x3e>
    278f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2792:	0f b6 00             	movzbl (%eax),%eax
    2795:	0f be c0             	movsbl %al,%eax
    2798:	83 ec 08             	sub    $0x8,%esp
    279b:	50                   	push   %eax
    279c:	68 31 8b 00 00       	push   $0x8b31
    27a1:	e8 b7 04 00 00       	call   2c5d <Printf>
    27a6:	83 c4 10             	add    $0x10,%esp
    27a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27ac:	0f b6 00             	movzbl (%eax),%eax
    27af:	3c 20                	cmp    $0x20,%al
    27b1:	75 0a                	jne    27bd <test_split_str+0x52>
    27b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27b6:	0f b6 00             	movzbl (%eax),%eax
    27b9:	84 c0                	test   %al,%al
    27bb:	74 13                	je     27d0 <test_split_str+0x65>
    27bd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    27c1:	75 0d                	jne    27d0 <test_split_str+0x65>
    27c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    27c9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    27d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27d3:	0f b6 00             	movzbl (%eax),%eax
    27d6:	3c 20                	cmp    $0x20,%al
    27d8:	74 0a                	je     27e4 <test_split_str+0x79>
    27da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27dd:	0f b6 00             	movzbl (%eax),%eax
    27e0:	84 c0                	test   %al,%al
    27e2:	75 26                	jne    280a <test_split_str+0x9f>
    27e4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    27e8:	75 20                	jne    280a <test_split_str+0x9f>
    27ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27ed:	8d 50 01             	lea    0x1(%eax),%edx
    27f0:	89 55 f4             	mov    %edx,-0xc(%ebp)
    27f3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    27f6:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
    27fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2800:	c6 00 00             	movb   $0x0,(%eax)
    2803:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    280a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    280e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2811:	0f b6 00             	movzbl (%eax),%eax
    2814:	84 c0                	test   %al,%al
    2816:	0f 85 6d ff ff ff    	jne    2789 <test_split_str+0x1e>
    281c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    281f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2822:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
    2829:	83 ec 08             	sub    $0x8,%esp
    282c:	ff 75 f4             	pushl  -0xc(%ebp)
    282f:	68 3a 8b 00 00       	push   $0x8b3a
    2834:	e8 24 04 00 00       	call   2c5d <Printf>
    2839:	83 c4 10             	add    $0x10,%esp
    283c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    2843:	eb 22                	jmp    2867 <test_split_str+0xfc>
    2845:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2848:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
    284f:	83 ec 04             	sub    $0x4,%esp
    2852:	50                   	push   %eax
    2853:	ff 75 e4             	pushl  -0x1c(%ebp)
    2856:	68 51 8b 00 00       	push   $0x8b51
    285b:	e8 fd 03 00 00       	call   2c5d <Printf>
    2860:	83 c4 10             	add    $0x10,%esp
    2863:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    2867:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    286a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    286d:	7e d6                	jle    2845 <test_split_str+0xda>
    286f:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
    2875:	83 ec 08             	sub    $0x8,%esp
    2878:	68 60 8b 00 00       	push   $0x8b60
    287d:	50                   	push   %eax
    287e:	e8 84 12 00 00       	call   3b07 <strcmp>
    2883:	83 c4 10             	add    $0x10,%esp
    2886:	85 c0                	test   %eax,%eax
    2888:	75 10                	jne    289a <test_split_str+0x12f>
    288a:	83 ec 0c             	sub    $0xc,%esp
    288d:	68 65 8b 00 00       	push   $0x8b65
    2892:	e8 c6 03 00 00       	call   2c5d <Printf>
    2897:	83 c4 10             	add    $0x10,%esp
    289a:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
    28a0:	83 ec 08             	sub    $0x8,%esp
    28a3:	50                   	push   %eax
    28a4:	68 71 8b 00 00       	push   $0x8b71
    28a9:	e8 af 03 00 00       	call   2c5d <Printf>
    28ae:	83 c4 10             	add    $0x10,%esp
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	68 7f 8b 00 00       	push   $0x8b7f
    28b9:	e8 9f 03 00 00       	call   2c5d <Printf>
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    28c8:	eb 26                	jmp    28f0 <test_split_str+0x185>
    28ca:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
    28d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    28d3:	01 d0                	add    %edx,%eax
    28d5:	0f b6 00             	movzbl (%eax),%eax
    28d8:	0f be c0             	movsbl %al,%eax
    28db:	83 ec 08             	sub    $0x8,%esp
    28de:	50                   	push   %eax
    28df:	68 8e 8b 00 00       	push   $0x8b8e
    28e4:	e8 74 03 00 00       	call   2c5d <Printf>
    28e9:	83 c4 10             	add    $0x10,%esp
    28ec:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    28f0:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
    28f4:	7e d4                	jle    28ca <test_split_str+0x15f>
    28f6:	c9                   	leave  
    28f7:	c3                   	ret    

000028f8 <test_shell>:
    28f8:	55                   	push   %ebp
    28f9:	89 e5                	mov    %esp,%ebp
    28fb:	83 ec 48             	sub    $0x48,%esp
    28fe:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
    2905:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
    290c:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
    2912:	83 ec 08             	sub    $0x8,%esp
    2915:	6a 02                	push   $0x2
    2917:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    291a:	50                   	push   %eax
    291b:	e8 ae 51 00 00       	call   7ace <open>
    2920:	83 c4 10             	add    $0x10,%esp
    2923:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2926:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
    292d:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
    2934:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
    293b:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
    2942:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
    2949:	83 ec 0c             	sub    $0xc,%esp
    294c:	8d 45 ce             	lea    -0x32(%ebp),%eax
    294f:	50                   	push   %eax
    2950:	e8 6f ea ff ff       	call   13c4 <untar>
    2955:	83 c4 10             	add    $0x10,%esp
    2958:	e8 e7 52 00 00       	call   7c44 <fork>
    295d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2960:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2964:	7e 25                	jle    298b <test_shell+0x93>
    2966:	83 ec 0c             	sub    $0xc,%esp
    2969:	8d 45 c8             	lea    -0x38(%ebp),%eax
    296c:	50                   	push   %eax
    296d:	e8 6b 52 00 00       	call   7bdd <wait>
    2972:	83 c4 10             	add    $0x10,%esp
    2975:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2978:	83 ec 08             	sub    $0x8,%esp
    297b:	50                   	push   %eax
    297c:	68 97 8b 00 00       	push   $0x8b97
    2981:	e8 d7 02 00 00       	call   2c5d <Printf>
    2986:	83 c4 10             	add    $0x10,%esp
    2989:	eb 23                	jmp    29ae <test_shell+0xb6>
    298b:	83 ec 0c             	sub    $0xc,%esp
    298e:	68 a9 8b 00 00       	push   $0x8ba9
    2993:	e8 c5 02 00 00       	call   2c5d <Printf>
    2998:	83 c4 10             	add    $0x10,%esp
    299b:	83 ec 0c             	sub    $0xc,%esp
    299e:	ff 75 f4             	pushl  -0xc(%ebp)
    29a1:	e8 eb 51 00 00       	call   7b91 <close>
    29a6:	83 c4 10             	add    $0x10,%esp
    29a9:	e8 e6 fb ff ff       	call   2594 <simple_shell>
    29ae:	83 ec 0c             	sub    $0xc,%esp
    29b1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    29b4:	50                   	push   %eax
    29b5:	e8 23 52 00 00       	call   7bdd <wait>
    29ba:	83 c4 10             	add    $0x10,%esp
    29bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    29c0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    29c3:	83 ec 08             	sub    $0x8,%esp
    29c6:	50                   	push   %eax
    29c7:	68 b7 8b 00 00       	push   $0x8bb7
    29cc:	e8 8c 02 00 00       	call   2c5d <Printf>
    29d1:	83 c4 10             	add    $0x10,%esp
    29d4:	eb d8                	jmp    29ae <test_shell+0xb6>

000029d6 <test_exec>:
    29d6:	55                   	push   %ebp
    29d7:	89 e5                	mov    %esp,%ebp
    29d9:	83 ec 38             	sub    $0x38,%esp
    29dc:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
    29e3:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
    29ea:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
    29f0:	83 ec 08             	sub    $0x8,%esp
    29f3:	6a 02                	push   $0x2
    29f5:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    29f8:	50                   	push   %eax
    29f9:	e8 d0 50 00 00       	call   7ace <open>
    29fe:	83 c4 10             	add    $0x10,%esp
    2a01:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a04:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
    2a0b:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
    2a12:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
    2a19:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
    2a20:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
    2a27:	83 ec 0c             	sub    $0xc,%esp
    2a2a:	8d 45 d2             	lea    -0x2e(%ebp),%eax
    2a2d:	50                   	push   %eax
    2a2e:	e8 91 e9 ff ff       	call   13c4 <untar>
    2a33:	83 c4 10             	add    $0x10,%esp
    2a36:	e8 09 52 00 00       	call   7c44 <fork>
    2a3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2a3e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2a42:	7e 25                	jle    2a69 <test_exec+0x93>
    2a44:	83 ec 0c             	sub    $0xc,%esp
    2a47:	8d 45 cc             	lea    -0x34(%ebp),%eax
    2a4a:	50                   	push   %eax
    2a4b:	e8 8d 51 00 00       	call   7bdd <wait>
    2a50:	83 c4 10             	add    $0x10,%esp
    2a53:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2a56:	83 ec 08             	sub    $0x8,%esp
    2a59:	50                   	push   %eax
    2a5a:	68 97 8b 00 00       	push   $0x8b97
    2a5f:	e8 f9 01 00 00       	call   2c5d <Printf>
    2a64:	83 c4 10             	add    $0x10,%esp
    2a67:	eb 33                	jmp    2a9c <test_exec+0xc6>
    2a69:	83 ec 0c             	sub    $0xc,%esp
    2a6c:	68 a9 8b 00 00       	push   $0x8ba9
    2a71:	e8 e7 01 00 00       	call   2c5d <Printf>
    2a76:	83 c4 10             	add    $0x10,%esp
    2a79:	83 ec 0c             	sub    $0xc,%esp
    2a7c:	6a 00                	push   $0x0
    2a7e:	68 d2 8b 00 00       	push   $0x8bd2
    2a83:	68 d8 8b 00 00       	push   $0x8bd8
    2a88:	68 60 8b 00 00       	push   $0x8b60
    2a8d:	68 de 8b 00 00       	push   $0x8bde
    2a92:	e8 41 54 00 00       	call   7ed8 <execl>
    2a97:	83 c4 20             	add    $0x20,%esp
    2a9a:	eb fe                	jmp    2a9a <test_exec+0xc4>
    2a9c:	c9                   	leave  
    2a9d:	c3                   	ret    

00002a9e <INIT>:
    2a9e:	55                   	push   %ebp
    2a9f:	89 e5                	mov    %esp,%ebp
    2aa1:	83 ec 08             	sub    $0x8,%esp
    2aa4:	e8 fb f7 ff ff       	call   22a4 <INIT_fork>
    2aa9:	eb fe                	jmp    2aa9 <INIT+0xb>

00002aab <TestA>:
    2aab:	55                   	push   %ebp
    2aac:	89 e5                	mov    %esp,%ebp
    2aae:	eb fe                	jmp    2aae <TestA+0x3>

00002ab0 <delay>:
    2ab0:	55                   	push   %ebp
    2ab1:	89 e5                	mov    %esp,%ebp
    2ab3:	83 ec 10             	sub    $0x10,%esp
    2ab6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    2abd:	eb 2d                	jmp    2aec <delay+0x3c>
    2abf:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2ac6:	eb 1a                	jmp    2ae2 <delay+0x32>
    2ac8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2acf:	eb 04                	jmp    2ad5 <delay+0x25>
    2ad1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ad5:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    2adc:	7e f3                	jle    2ad1 <delay+0x21>
    2ade:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2ae2:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
    2ae6:	7e e0                	jle    2ac8 <delay+0x18>
    2ae8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2aec:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2aef:	3b 45 08             	cmp    0x8(%ebp),%eax
    2af2:	7c cb                	jl     2abf <delay+0xf>
    2af4:	90                   	nop
    2af5:	c9                   	leave  
    2af6:	c3                   	ret    

00002af7 <TestB>:
    2af7:	55                   	push   %ebp
    2af8:	89 e5                	mov    %esp,%ebp
    2afa:	83 ec 18             	sub    $0x18,%esp
    2afd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2b04:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    2b08:	77 16                	ja     2b20 <TestB+0x29>
    2b0a:	e8 38 0e 00 00       	call   3947 <get_ticks_ipc>
    2b0f:	83 ec 08             	sub    $0x8,%esp
    2b12:	50                   	push   %eax
    2b13:	68 e4 8b 00 00       	push   $0x8be4
    2b18:	e8 40 01 00 00       	call   2c5d <Printf>
    2b1d:	83 c4 10             	add    $0x10,%esp
    2b20:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2b24:	eb de                	jmp    2b04 <TestB+0xd>

00002b26 <TestC>:
    2b26:	55                   	push   %ebp
    2b27:	89 e5                	mov    %esp,%ebp
    2b29:	83 ec 18             	sub    $0x18,%esp
    2b2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2b33:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    2b37:	77 1a                	ja     2b53 <TestC+0x2d>
    2b39:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
    2b40:	83 ec 08             	sub    $0x8,%esp
    2b43:	ff 75 f0             	pushl  -0x10(%ebp)
    2b46:	68 eb 8b 00 00       	push   $0x8beb
    2b4b:	e8 0d 01 00 00       	call   2c5d <Printf>
    2b50:	83 c4 10             	add    $0x10,%esp
    2b53:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2b57:	eb da                	jmp    2b33 <TestC+0xd>

00002b59 <sys_get_ticks>:
    2b59:	55                   	push   %ebp
    2b5a:	89 e5                	mov    %esp,%ebp
    2b5c:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    2b61:	5d                   	pop    %ebp
    2b62:	c3                   	ret    

00002b63 <sys_write>:
    2b63:	55                   	push   %ebp
    2b64:	89 e5                	mov    %esp,%ebp
    2b66:	83 ec 18             	sub    $0x18,%esp
    2b69:	8b 45 10             	mov    0x10(%ebp),%eax
    2b6c:	8b 40 64             	mov    0x64(%eax),%eax
    2b6f:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    2b75:	05 a0 dd 00 00       	add    $0xdda0,%eax
    2b7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b7d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b80:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b83:	8b 45 08             	mov    0x8(%ebp),%eax
    2b86:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2b89:	eb 20                	jmp    2bab <sys_write+0x48>
    2b8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b8e:	0f b6 00             	movzbl (%eax),%eax
    2b91:	0f b6 c0             	movzbl %al,%eax
    2b94:	83 ec 08             	sub    $0x8,%esp
    2b97:	50                   	push   %eax
    2b98:	ff 75 ec             	pushl  -0x14(%ebp)
    2b9b:	e8 49 43 00 00       	call   6ee9 <out_char>
    2ba0:	83 c4 10             	add    $0x10,%esp
    2ba3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2ba7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2bab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2baf:	7f da                	jg     2b8b <sys_write+0x28>
    2bb1:	90                   	nop
    2bb2:	c9                   	leave  
    2bb3:	c3                   	ret    

00002bb4 <milli_delay>:
    2bb4:	55                   	push   %ebp
    2bb5:	89 e5                	mov    %esp,%ebp
    2bb7:	83 ec 18             	sub    $0x18,%esp
    2bba:	e8 88 0d 00 00       	call   3947 <get_ticks_ipc>
    2bbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2bc2:	90                   	nop
    2bc3:	e8 7f 0d 00 00       	call   3947 <get_ticks_ipc>
    2bc8:	2b 45 f4             	sub    -0xc(%ebp),%eax
    2bcb:	89 c1                	mov    %eax,%ecx
    2bcd:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    2bd2:	89 c8                	mov    %ecx,%eax
    2bd4:	f7 ea                	imul   %edx
    2bd6:	c1 fa 05             	sar    $0x5,%edx
    2bd9:	89 c8                	mov    %ecx,%eax
    2bdb:	c1 f8 1f             	sar    $0x1f,%eax
    2bde:	29 c2                	sub    %eax,%edx
    2be0:	89 d0                	mov    %edx,%eax
    2be2:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
    2be8:	39 45 08             	cmp    %eax,0x8(%ebp)
    2beb:	77 d6                	ja     2bc3 <milli_delay+0xf>
    2bed:	90                   	nop
    2bee:	c9                   	leave  
    2bef:	c3                   	ret    

00002bf0 <TaskSys>:
    2bf0:	55                   	push   %ebp
    2bf1:	89 e5                	mov    %esp,%ebp
    2bf3:	81 ec 88 00 00 00    	sub    $0x88,%esp
    2bf9:	83 ec 04             	sub    $0x4,%esp
    2bfc:	6a 6c                	push   $0x6c
    2bfe:	6a 00                	push   $0x0
    2c00:	8d 45 80             	lea    -0x80(%ebp),%eax
    2c03:	50                   	push   %eax
    2c04:	e8 b0 65 00 00       	call   91b9 <Memset>
    2c09:	83 c4 10             	add    $0x10,%esp
    2c0c:	83 ec 08             	sub    $0x8,%esp
    2c0f:	6a 11                	push   $0x11
    2c11:	8d 45 80             	lea    -0x80(%ebp),%eax
    2c14:	50                   	push   %eax
    2c15:	e8 24 1c 00 00       	call   483e <receive_msg>
    2c1a:	83 c4 10             	add    $0x10,%esp
    2c1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c20:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2c24:	75 34                	jne    2c5a <TaskSys+0x6a>
    2c26:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c29:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2c2c:	8b 45 80             	mov    -0x80(%ebp),%eax
    2c2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2c32:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2c36:	75 1f                	jne    2c57 <TaskSys+0x67>
    2c38:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    2c3d:	89 45 88             	mov    %eax,-0x78(%ebp)
    2c40:	83 ec 08             	sub    $0x8,%esp
    2c43:	ff 75 ec             	pushl  -0x14(%ebp)
    2c46:	8d 45 80             	lea    -0x80(%ebp),%eax
    2c49:	50                   	push   %eax
    2c4a:	e8 c9 1b 00 00       	call   4818 <send_msg>
    2c4f:	83 c4 10             	add    $0x10,%esp
    2c52:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c55:	eb 01                	jmp    2c58 <TaskSys+0x68>
    2c57:	90                   	nop
    2c58:	eb 9f                	jmp    2bf9 <TaskSys+0x9>
    2c5a:	90                   	nop
    2c5b:	c9                   	leave  
    2c5c:	c3                   	ret    

00002c5d <Printf>:
    2c5d:	55                   	push   %ebp
    2c5e:	89 e5                	mov    %esp,%ebp
    2c60:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2c66:	83 ec 04             	sub    $0x4,%esp
    2c69:	68 00 01 00 00       	push   $0x100
    2c6e:	6a 00                	push   $0x0
    2c70:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2c76:	50                   	push   %eax
    2c77:	e8 3d 65 00 00       	call   91b9 <Memset>
    2c7c:	83 c4 10             	add    $0x10,%esp
    2c7f:	8d 45 0c             	lea    0xc(%ebp),%eax
    2c82:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c85:	8b 45 08             	mov    0x8(%ebp),%eax
    2c88:	83 ec 04             	sub    $0x4,%esp
    2c8b:	ff 75 f4             	pushl  -0xc(%ebp)
    2c8e:	50                   	push   %eax
    2c8f:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2c95:	50                   	push   %eax
    2c96:	e8 20 00 00 00       	call   2cbb <vsprintf>
    2c9b:	83 c4 10             	add    $0x10,%esp
    2c9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2ca1:	83 ec 04             	sub    $0x4,%esp
    2ca4:	ff 75 f0             	pushl  -0x10(%ebp)
    2ca7:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2cad:	50                   	push   %eax
    2cae:	6a 00                	push   $0x0
    2cb0:	e8 a5 4e 00 00       	call   7b5a <write>
    2cb5:	83 c4 10             	add    $0x10,%esp
    2cb8:	90                   	nop
    2cb9:	c9                   	leave  
    2cba:	c3                   	ret    

00002cbb <vsprintf>:
    2cbb:	55                   	push   %ebp
    2cbc:	89 e5                	mov    %esp,%ebp
    2cbe:	81 ec 68 02 00 00    	sub    $0x268,%esp
    2cc4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2cca:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
    2cd0:	83 ec 04             	sub    $0x4,%esp
    2cd3:	6a 40                	push   $0x40
    2cd5:	6a 00                	push   $0x0
    2cd7:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2cdd:	50                   	push   %eax
    2cde:	e8 d6 64 00 00       	call   91b9 <Memset>
    2ce3:	83 c4 10             	add    $0x10,%esp
    2ce6:	8b 45 10             	mov    0x10(%ebp),%eax
    2ce9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2cec:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    2cf3:	8b 45 08             	mov    0x8(%ebp),%eax
    2cf6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2cf9:	e9 53 01 00 00       	jmp    2e51 <vsprintf+0x196>
    2cfe:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d01:	0f b6 00             	movzbl (%eax),%eax
    2d04:	3c 25                	cmp    $0x25,%al
    2d06:	74 16                	je     2d1e <vsprintf+0x63>
    2d08:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d0b:	8d 50 01             	lea    0x1(%eax),%edx
    2d0e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2d11:	8b 55 0c             	mov    0xc(%ebp),%edx
    2d14:	0f b6 12             	movzbl (%edx),%edx
    2d17:	88 10                	mov    %dl,(%eax)
    2d19:	e9 2f 01 00 00       	jmp    2e4d <vsprintf+0x192>
    2d1e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2d22:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d25:	0f b6 00             	movzbl (%eax),%eax
    2d28:	0f be c0             	movsbl %al,%eax
    2d2b:	83 f8 64             	cmp    $0x64,%eax
    2d2e:	74 26                	je     2d56 <vsprintf+0x9b>
    2d30:	83 f8 64             	cmp    $0x64,%eax
    2d33:	7f 0e                	jg     2d43 <vsprintf+0x88>
    2d35:	83 f8 63             	cmp    $0x63,%eax
    2d38:	0f 84 f2 00 00 00    	je     2e30 <vsprintf+0x175>
    2d3e:	e9 0a 01 00 00       	jmp    2e4d <vsprintf+0x192>
    2d43:	83 f8 73             	cmp    $0x73,%eax
    2d46:	0f 84 b0 00 00 00    	je     2dfc <vsprintf+0x141>
    2d4c:	83 f8 78             	cmp    $0x78,%eax
    2d4f:	74 5d                	je     2dae <vsprintf+0xf3>
    2d51:	e9 f7 00 00 00       	jmp    2e4d <vsprintf+0x192>
    2d56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d59:	8b 00                	mov    (%eax),%eax
    2d5b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2d5e:	83 ec 04             	sub    $0x4,%esp
    2d61:	6a 0a                	push   $0xa
    2d63:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2d69:	50                   	push   %eax
    2d6a:	ff 75 e8             	pushl  -0x18(%ebp)
    2d6d:	e8 20 0c 00 00       	call   3992 <itoa>
    2d72:	83 c4 10             	add    $0x10,%esp
    2d75:	83 ec 08             	sub    $0x8,%esp
    2d78:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2d7e:	50                   	push   %eax
    2d7f:	ff 75 f4             	pushl  -0xc(%ebp)
    2d82:	e8 51 64 00 00       	call   91d8 <Strcpy>
    2d87:	83 c4 10             	add    $0x10,%esp
    2d8a:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2d8e:	83 ec 0c             	sub    $0xc,%esp
    2d91:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2d97:	50                   	push   %eax
    2d98:	e8 55 64 00 00       	call   91f2 <Strlen>
    2d9d:	83 c4 10             	add    $0x10,%esp
    2da0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2da3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2da6:	01 45 f4             	add    %eax,-0xc(%ebp)
    2da9:	e9 9f 00 00 00       	jmp    2e4d <vsprintf+0x192>
    2dae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2db1:	8b 00                	mov    (%eax),%eax
    2db3:	83 ec 08             	sub    $0x8,%esp
    2db6:	50                   	push   %eax
    2db7:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2dbd:	50                   	push   %eax
    2dbe:	e8 0b e8 ff ff       	call   15ce <atoi>
    2dc3:	83 c4 10             	add    $0x10,%esp
    2dc6:	83 ec 08             	sub    $0x8,%esp
    2dc9:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2dcf:	50                   	push   %eax
    2dd0:	ff 75 f4             	pushl  -0xc(%ebp)
    2dd3:	e8 00 64 00 00       	call   91d8 <Strcpy>
    2dd8:	83 c4 10             	add    $0x10,%esp
    2ddb:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2ddf:	83 ec 0c             	sub    $0xc,%esp
    2de2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2de8:	50                   	push   %eax
    2de9:	e8 04 64 00 00       	call   91f2 <Strlen>
    2dee:	83 c4 10             	add    $0x10,%esp
    2df1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2df4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2df7:	01 45 f4             	add    %eax,-0xc(%ebp)
    2dfa:	eb 51                	jmp    2e4d <vsprintf+0x192>
    2dfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2dff:	8b 00                	mov    (%eax),%eax
    2e01:	83 ec 08             	sub    $0x8,%esp
    2e04:	50                   	push   %eax
    2e05:	ff 75 f4             	pushl  -0xc(%ebp)
    2e08:	e8 cb 63 00 00       	call   91d8 <Strcpy>
    2e0d:	83 c4 10             	add    $0x10,%esp
    2e10:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e13:	8b 00                	mov    (%eax),%eax
    2e15:	83 ec 0c             	sub    $0xc,%esp
    2e18:	50                   	push   %eax
    2e19:	e8 d4 63 00 00       	call   91f2 <Strlen>
    2e1e:	83 c4 10             	add    $0x10,%esp
    2e21:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2e24:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2e28:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e2b:	01 45 f4             	add    %eax,-0xc(%ebp)
    2e2e:	eb 1d                	jmp    2e4d <vsprintf+0x192>
    2e30:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e33:	0f b6 10             	movzbl (%eax),%edx
    2e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e39:	88 10                	mov    %dl,(%eax)
    2e3b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2e3f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    2e46:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e49:	01 45 f4             	add    %eax,-0xc(%ebp)
    2e4c:	90                   	nop
    2e4d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2e51:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e54:	0f b6 00             	movzbl (%eax),%eax
    2e57:	84 c0                	test   %al,%al
    2e59:	0f 85 9f fe ff ff    	jne    2cfe <vsprintf+0x43>
    2e5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e62:	2b 45 08             	sub    0x8(%ebp),%eax
    2e65:	c9                   	leave  
    2e66:	c3                   	ret    

00002e67 <printx>:
    2e67:	55                   	push   %ebp
    2e68:	89 e5                	mov    %esp,%ebp
    2e6a:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2e70:	8d 45 0c             	lea    0xc(%ebp),%eax
    2e73:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2e76:	8b 45 08             	mov    0x8(%ebp),%eax
    2e79:	83 ec 04             	sub    $0x4,%esp
    2e7c:	ff 75 f4             	pushl  -0xc(%ebp)
    2e7f:	50                   	push   %eax
    2e80:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2e86:	50                   	push   %eax
    2e87:	e8 2f fe ff ff       	call   2cbb <vsprintf>
    2e8c:	83 c4 10             	add    $0x10,%esp
    2e8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2e92:	83 ec 08             	sub    $0x8,%esp
    2e95:	ff 75 f0             	pushl  -0x10(%ebp)
    2e98:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2e9e:	50                   	push   %eax
    2e9f:	e8 54 19 00 00       	call   47f8 <write_debug>
    2ea4:	83 c4 10             	add    $0x10,%esp
    2ea7:	90                   	nop
    2ea8:	c9                   	leave  
    2ea9:	c3                   	ret    

00002eaa <sys_printx>:
    2eaa:	55                   	push   %ebp
    2eab:	89 e5                	mov    %esp,%ebp
    2ead:	83 ec 28             	sub    $0x28,%esp
    2eb0:	a1 54 d7 00 00       	mov    0xd754,%eax
    2eb5:	85 c0                	test   %eax,%eax
    2eb7:	75 20                	jne    2ed9 <sys_printx+0x2f>
    2eb9:	8b 45 10             	mov    0x10(%ebp),%eax
    2ebc:	8b 40 0c             	mov    0xc(%eax),%eax
    2ebf:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ec2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ec5:	83 ec 08             	sub    $0x8,%esp
    2ec8:	ff 75 10             	pushl  0x10(%ebp)
    2ecb:	50                   	push   %eax
    2ecc:	e8 e0 3a 00 00       	call   69b1 <Seg2PhyAddrLDT>
    2ed1:	83 c4 10             	add    $0x10,%esp
    2ed4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2ed7:	eb 19                	jmp    2ef2 <sys_printx+0x48>
    2ed9:	a1 54 d7 00 00       	mov    0xd754,%eax
    2ede:	85 c0                	test   %eax,%eax
    2ee0:	74 10                	je     2ef2 <sys_printx+0x48>
    2ee2:	83 ec 0c             	sub    $0xc,%esp
    2ee5:	6a 30                	push   $0x30
    2ee7:	e8 84 3a 00 00       	call   6970 <Seg2PhyAddr>
    2eec:	83 c4 10             	add    $0x10,%esp
    2eef:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2ef2:	8b 55 08             	mov    0x8(%ebp),%edx
    2ef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ef8:	01 d0                	add    %edx,%eax
    2efa:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2efd:	8b 45 10             	mov    0x10(%ebp),%eax
    2f00:	8b 40 64             	mov    0x64(%eax),%eax
    2f03:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    2f09:	05 a0 dd 00 00       	add    $0xdda0,%eax
    2f0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2f11:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f14:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2f17:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f1a:	0f b6 00             	movzbl (%eax),%eax
    2f1d:	88 45 e3             	mov    %al,-0x1d(%ebp)
    2f20:	eb 3a                	jmp    2f5c <sys_printx+0xb2>
    2f22:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f25:	0f b6 00             	movzbl (%eax),%eax
    2f28:	3c 3b                	cmp    $0x3b,%al
    2f2a:	74 0a                	je     2f36 <sys_printx+0x8c>
    2f2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f2f:	0f b6 00             	movzbl (%eax),%eax
    2f32:	3c 3a                	cmp    $0x3a,%al
    2f34:	75 06                	jne    2f3c <sys_printx+0x92>
    2f36:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f3a:	eb 20                	jmp    2f5c <sys_printx+0xb2>
    2f3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f3f:	0f b6 00             	movzbl (%eax),%eax
    2f42:	0f b6 c0             	movzbl %al,%eax
    2f45:	83 ec 08             	sub    $0x8,%esp
    2f48:	50                   	push   %eax
    2f49:	ff 75 e4             	pushl  -0x1c(%ebp)
    2f4c:	e8 98 3f 00 00       	call   6ee9 <out_char>
    2f51:	83 c4 10             	add    $0x10,%esp
    2f54:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f58:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    2f5c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2f60:	7f c0                	jg     2f22 <sys_printx+0x78>
    2f62:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
    2f66:	75 11                	jne    2f79 <sys_printx+0xcf>
    2f68:	a1 54 d7 00 00       	mov    0xd754,%eax
    2f6d:	85 c0                	test   %eax,%eax
    2f6f:	74 15                	je     2f86 <sys_printx+0xdc>
    2f71:	e8 8e e3 ff ff       	call   1304 <disable_int>
    2f76:	f4                   	hlt    
    2f77:	eb 0d                	jmp    2f86 <sys_printx+0xdc>
    2f79:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
    2f7d:	75 07                	jne    2f86 <sys_printx+0xdc>
    2f7f:	e8 80 e3 ff ff       	call   1304 <disable_int>
    2f84:	f4                   	hlt    
    2f85:	90                   	nop
    2f86:	90                   	nop
    2f87:	c9                   	leave  
    2f88:	c3                   	ret    

00002f89 <spin>:
    2f89:	55                   	push   %ebp
    2f8a:	89 e5                	mov    %esp,%ebp
    2f8c:	eb fe                	jmp    2f8c <spin+0x3>

00002f8e <panic>:
    2f8e:	55                   	push   %ebp
    2f8f:	89 e5                	mov    %esp,%ebp
    2f91:	83 ec 08             	sub    $0x8,%esp
    2f94:	83 ec 04             	sub    $0x4,%esp
    2f97:	ff 75 08             	pushl  0x8(%ebp)
    2f9a:	6a 3a                	push   $0x3a
    2f9c:	68 f8 8b 00 00       	push   $0x8bf8
    2fa1:	e8 c1 fe ff ff       	call   2e67 <printx>
    2fa6:	83 c4 10             	add    $0x10,%esp
    2fa9:	90                   	nop
    2faa:	c9                   	leave  
    2fab:	c3                   	ret    

00002fac <assertion_failure>:
    2fac:	55                   	push   %ebp
    2fad:	89 e5                	mov    %esp,%ebp
    2faf:	83 ec 08             	sub    $0x8,%esp
    2fb2:	83 ec 08             	sub    $0x8,%esp
    2fb5:	ff 75 14             	pushl  0x14(%ebp)
    2fb8:	ff 75 10             	pushl  0x10(%ebp)
    2fbb:	ff 75 0c             	pushl  0xc(%ebp)
    2fbe:	ff 75 08             	pushl  0x8(%ebp)
    2fc1:	6a 3b                	push   $0x3b
    2fc3:	68 00 8c 00 00       	push   $0x8c00
    2fc8:	e8 9a fe ff ff       	call   2e67 <printx>
    2fcd:	83 c4 20             	add    $0x20,%esp
    2fd0:	83 ec 0c             	sub    $0xc,%esp
    2fd3:	68 33 8c 00 00       	push   $0x8c33
    2fd8:	e8 ac ff ff ff       	call   2f89 <spin>
    2fdd:	83 c4 10             	add    $0x10,%esp
    2fe0:	90                   	nop
    2fe1:	c9                   	leave  
    2fe2:	c3                   	ret    

00002fe3 <dead_lock>:
    2fe3:	55                   	push   %ebp
    2fe4:	89 e5                	mov    %esp,%ebp
    2fe6:	b8 00 00 00 00       	mov    $0x0,%eax
    2feb:	5d                   	pop    %ebp
    2fec:	c3                   	ret    

00002fed <sys_send_msg>:
    2fed:	55                   	push   %ebp
    2fee:	89 e5                	mov    %esp,%ebp
    2ff0:	83 ec 48             	sub    $0x48,%esp
    2ff3:	83 ec 0c             	sub    $0xc,%esp
    2ff6:	ff 75 0c             	pushl  0xc(%ebp)
    2ff9:	e8 ca 38 00 00       	call   68c8 <pid2proc>
    2ffe:	83 c4 10             	add    $0x10,%esp
    3001:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3004:	83 ec 0c             	sub    $0xc,%esp
    3007:	ff 75 10             	pushl  0x10(%ebp)
    300a:	e8 d5 38 00 00       	call   68e4 <proc2pid>
    300f:	83 c4 10             	add    $0x10,%esp
    3012:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3015:	8b 45 10             	mov    0x10(%ebp),%eax
    3018:	8b 40 0c             	mov    0xc(%eax),%eax
    301b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    301e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3021:	83 ec 08             	sub    $0x8,%esp
    3024:	ff 75 10             	pushl  0x10(%ebp)
    3027:	50                   	push   %eax
    3028:	e8 84 39 00 00       	call   69b1 <Seg2PhyAddrLDT>
    302d:	83 c4 10             	add    $0x10,%esp
    3030:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3033:	8b 55 08             	mov    0x8(%ebp),%edx
    3036:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3039:	01 d0                	add    %edx,%eax
    303b:	89 45 dc             	mov    %eax,-0x24(%ebp)
    303e:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
    3045:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3048:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    304b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    304e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3051:	89 10                	mov    %edx,(%eax)
    3053:	83 ec 08             	sub    $0x8,%esp
    3056:	ff 75 0c             	pushl  0xc(%ebp)
    3059:	ff 75 e8             	pushl  -0x18(%ebp)
    305c:	e8 82 ff ff ff       	call   2fe3 <dead_lock>
    3061:	83 c4 10             	add    $0x10,%esp
    3064:	83 f8 01             	cmp    $0x1,%eax
    3067:	75 10                	jne    3079 <sys_send_msg+0x8c>
    3069:	83 ec 0c             	sub    $0xc,%esp
    306c:	68 3f 8c 00 00       	push   $0x8c3f
    3071:	e8 18 ff ff ff       	call   2f8e <panic>
    3076:	83 c4 10             	add    $0x10,%esp
    3079:	8b 45 ec             	mov    -0x14(%ebp),%eax
    307c:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3083:	3c 02                	cmp    $0x2,%al
    3085:	0f 85 9c 01 00 00    	jne    3227 <sys_send_msg+0x23a>
    308b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    308e:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    3094:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    3097:	74 12                	je     30ab <sys_send_msg+0xbe>
    3099:	8b 45 ec             	mov    -0x14(%ebp),%eax
    309c:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    30a2:	83 f8 11             	cmp    $0x11,%eax
    30a5:	0f 85 7c 01 00 00    	jne    3227 <sys_send_msg+0x23a>
    30ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30ae:	8b 40 0c             	mov    0xc(%eax),%eax
    30b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    30b4:	8b 45 d0             	mov    -0x30(%ebp),%eax
    30b7:	83 ec 08             	sub    $0x8,%esp
    30ba:	ff 75 ec             	pushl  -0x14(%ebp)
    30bd:	50                   	push   %eax
    30be:	e8 ee 38 00 00       	call   69b1 <Seg2PhyAddrLDT>
    30c3:	83 c4 10             	add    $0x10,%esp
    30c6:	89 45 cc             	mov    %eax,-0x34(%ebp)
    30c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30cc:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    30d2:	89 c2                	mov    %eax,%edx
    30d4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    30d7:	01 d0                	add    %edx,%eax
    30d9:	89 45 c8             	mov    %eax,-0x38(%ebp)
    30dc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    30df:	8b 45 c8             	mov    -0x38(%ebp),%eax
    30e2:	83 ec 04             	sub    $0x4,%esp
    30e5:	ff 75 d8             	pushl  -0x28(%ebp)
    30e8:	52                   	push   %edx
    30e9:	50                   	push   %eax
    30ea:	e8 9c 60 00 00       	call   918b <Memcpy>
    30ef:	83 c4 10             	add    $0x10,%esp
    30f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30f5:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    30fc:	00 00 00 
    30ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3102:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3109:	8b 45 ec             	mov    -0x14(%ebp),%eax
    310c:	c7 80 88 01 00 00 20 	movl   $0x20,0x188(%eax)
    3113:	00 00 00 
    3116:	83 ec 0c             	sub    $0xc,%esp
    3119:	ff 75 ec             	pushl  -0x14(%ebp)
    311c:	e8 ef 07 00 00       	call   3910 <unblock>
    3121:	83 c4 10             	add    $0x10,%esp
    3124:	8b 45 10             	mov    0x10(%ebp),%eax
    3127:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    312d:	85 c0                	test   %eax,%eax
    312f:	74 1c                	je     314d <sys_send_msg+0x160>
    3131:	68 2f 05 00 00       	push   $0x52f
    3136:	68 4a 8c 00 00       	push   $0x8c4a
    313b:	68 4a 8c 00 00       	push   $0x8c4a
    3140:	68 51 8c 00 00       	push   $0x8c51
    3145:	e8 62 fe ff ff       	call   2fac <assertion_failure>
    314a:	83 c4 10             	add    $0x10,%esp
    314d:	8b 45 10             	mov    0x10(%ebp),%eax
    3150:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3157:	84 c0                	test   %al,%al
    3159:	74 1c                	je     3177 <sys_send_msg+0x18a>
    315b:	68 30 05 00 00       	push   $0x530
    3160:	68 4a 8c 00 00       	push   $0x8c4a
    3165:	68 4a 8c 00 00       	push   $0x8c4a
    316a:	68 64 8c 00 00       	push   $0x8c64
    316f:	e8 38 fe ff ff       	call   2fac <assertion_failure>
    3174:	83 c4 10             	add    $0x10,%esp
    3177:	8b 45 10             	mov    0x10(%ebp),%eax
    317a:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3180:	83 f8 20             	cmp    $0x20,%eax
    3183:	74 1c                	je     31a1 <sys_send_msg+0x1b4>
    3185:	68 31 05 00 00       	push   $0x531
    318a:	68 4a 8c 00 00       	push   $0x8c4a
    318f:	68 4a 8c 00 00       	push   $0x8c4a
    3194:	68 78 8c 00 00       	push   $0x8c78
    3199:	e8 0e fe ff ff       	call   2fac <assertion_failure>
    319e:	83 c4 10             	add    $0x10,%esp
    31a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    31a4:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    31aa:	85 c0                	test   %eax,%eax
    31ac:	74 1c                	je     31ca <sys_send_msg+0x1dd>
    31ae:	68 33 05 00 00       	push   $0x533
    31b3:	68 4a 8c 00 00       	push   $0x8c4a
    31b8:	68 4a 8c 00 00       	push   $0x8c4a
    31bd:	68 95 8c 00 00       	push   $0x8c95
    31c2:	e8 e5 fd ff ff       	call   2fac <assertion_failure>
    31c7:	83 c4 10             	add    $0x10,%esp
    31ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    31cd:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    31d4:	84 c0                	test   %al,%al
    31d6:	74 1c                	je     31f4 <sys_send_msg+0x207>
    31d8:	68 34 05 00 00       	push   $0x534
    31dd:	68 4a 8c 00 00       	push   $0x8c4a
    31e2:	68 4a 8c 00 00       	push   $0x8c4a
    31e7:	68 aa 8c 00 00       	push   $0x8caa
    31ec:	e8 bb fd ff ff       	call   2fac <assertion_failure>
    31f1:	83 c4 10             	add    $0x10,%esp
    31f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    31f7:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    31fd:	83 f8 20             	cmp    $0x20,%eax
    3200:	0f 84 45 01 00 00    	je     334b <sys_send_msg+0x35e>
    3206:	68 35 05 00 00       	push   $0x535
    320b:	68 4a 8c 00 00       	push   $0x8c4a
    3210:	68 4a 8c 00 00       	push   $0x8c4a
    3215:	68 c0 8c 00 00       	push   $0x8cc0
    321a:	e8 8d fd ff ff       	call   2fac <assertion_failure>
    321f:	83 c4 10             	add    $0x10,%esp
    3222:	e9 24 01 00 00       	jmp    334b <sys_send_msg+0x35e>
    3227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    322e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3231:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3234:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3237:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    323d:	85 c0                	test   %eax,%eax
    323f:	75 1b                	jne    325c <sys_send_msg+0x26f>
    3241:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3244:	8b 55 10             	mov    0x10(%ebp),%edx
    3247:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    324d:	8b 45 10             	mov    0x10(%ebp),%eax
    3250:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    3257:	00 00 00 
    325a:	eb 3f                	jmp    329b <sys_send_msg+0x2ae>
    325c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    325f:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3265:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3268:	eb 12                	jmp    327c <sys_send_msg+0x28f>
    326a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    326d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3270:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3273:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    3279:	89 45 f0             	mov    %eax,-0x10(%ebp)
    327c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3280:	75 e8                	jne    326a <sys_send_msg+0x27d>
    3282:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3285:	8b 55 10             	mov    0x10(%ebp),%edx
    3288:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    328e:	8b 45 10             	mov    0x10(%ebp),%eax
    3291:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    3298:	00 00 00 
    329b:	8b 45 10             	mov    0x10(%ebp),%eax
    329e:	8b 55 08             	mov    0x8(%ebp),%edx
    32a1:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    32a7:	8b 45 10             	mov    0x10(%ebp),%eax
    32aa:	8b 55 0c             	mov    0xc(%ebp),%edx
    32ad:	89 90 84 01 00 00    	mov    %edx,0x184(%eax)
    32b3:	8b 45 10             	mov    0x10(%ebp),%eax
    32b6:	c6 80 7c 01 00 00 01 	movb   $0x1,0x17c(%eax)
    32bd:	8b 45 10             	mov    0x10(%ebp),%eax
    32c0:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    32c7:	3c 01                	cmp    $0x1,%al
    32c9:	74 1c                	je     32e7 <sys_send_msg+0x2fa>
    32cb:	68 56 05 00 00       	push   $0x556
    32d0:	68 4a 8c 00 00       	push   $0x8c4a
    32d5:	68 4a 8c 00 00       	push   $0x8c4a
    32da:	68 e4 8c 00 00       	push   $0x8ce4
    32df:	e8 c8 fc ff ff       	call   2fac <assertion_failure>
    32e4:	83 c4 10             	add    $0x10,%esp
    32e7:	8b 45 10             	mov    0x10(%ebp),%eax
    32ea:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    32f0:	39 45 0c             	cmp    %eax,0xc(%ebp)
    32f3:	74 1c                	je     3311 <sys_send_msg+0x324>
    32f5:	68 57 05 00 00       	push   $0x557
    32fa:	68 4a 8c 00 00       	push   $0x8c4a
    32ff:	68 4a 8c 00 00       	push   $0x8c4a
    3304:	68 00 8d 00 00       	push   $0x8d00
    3309:	e8 9e fc ff ff       	call   2fac <assertion_failure>
    330e:	83 c4 10             	add    $0x10,%esp
    3311:	8b 45 10             	mov    0x10(%ebp),%eax
    3314:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    331a:	39 45 08             	cmp    %eax,0x8(%ebp)
    331d:	74 1c                	je     333b <sys_send_msg+0x34e>
    331f:	68 58 05 00 00       	push   $0x558
    3324:	68 4a 8c 00 00       	push   $0x8c4a
    3329:	68 4a 8c 00 00       	push   $0x8c4a
    332e:	68 22 8d 00 00       	push   $0x8d22
    3333:	e8 74 fc ff ff       	call   2fac <assertion_failure>
    3338:	83 c4 10             	add    $0x10,%esp
    333b:	83 ec 0c             	sub    $0xc,%esp
    333e:	ff 75 10             	pushl  0x10(%ebp)
    3341:	e8 b8 05 00 00       	call   38fe <block>
    3346:	83 c4 10             	add    $0x10,%esp
    3349:	eb 01                	jmp    334c <sys_send_msg+0x35f>
    334b:	90                   	nop
    334c:	b8 00 00 00 00       	mov    $0x0,%eax
    3351:	c9                   	leave  
    3352:	c3                   	ret    

00003353 <sys_receive_msg>:
    3353:	55                   	push   %ebp
    3354:	89 e5                	mov    %esp,%ebp
    3356:	81 ec b8 00 00 00    	sub    $0xb8,%esp
    335c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3363:	83 ec 0c             	sub    $0xc,%esp
    3366:	ff 75 0c             	pushl  0xc(%ebp)
    3369:	e8 5a 35 00 00       	call   68c8 <pid2proc>
    336e:	83 c4 10             	add    $0x10,%esp
    3371:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3374:	83 ec 0c             	sub    $0xc,%esp
    3377:	ff 75 10             	pushl  0x10(%ebp)
    337a:	e8 65 35 00 00       	call   68e4 <proc2pid>
    337f:	83 c4 10             	add    $0x10,%esp
    3382:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3385:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    338c:	8b 45 10             	mov    0x10(%ebp),%eax
    338f:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    3395:	85 c0                	test   %eax,%eax
    3397:	0f 84 9a 00 00 00    	je     3437 <sys_receive_msg+0xe4>
    339d:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    33a1:	74 0d                	je     33b0 <sys_receive_msg+0x5d>
    33a3:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
    33aa:	0f 85 87 00 00 00    	jne    3437 <sys_receive_msg+0xe4>
    33b0:	83 ec 04             	sub    $0x4,%esp
    33b3:	6a 6c                	push   $0x6c
    33b5:	6a 00                	push   $0x0
    33b7:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
    33bd:	50                   	push   %eax
    33be:	e8 f6 5d 00 00       	call   91b9 <Memset>
    33c3:	83 c4 10             	add    $0x10,%esp
    33c6:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
    33cd:	02 00 00 
    33d0:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
    33d7:	83 ec 08             	sub    $0x8,%esp
    33da:	ff 75 08             	pushl  0x8(%ebp)
    33dd:	ff 75 e0             	pushl  -0x20(%ebp)
    33e0:	e8 26 36 00 00       	call   6a0b <v2l>
    33e5:	83 c4 10             	add    $0x10,%esp
    33e8:	89 c2                	mov    %eax,%edx
    33ea:	83 ec 04             	sub    $0x4,%esp
    33ed:	6a 6c                	push   $0x6c
    33ef:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
    33f5:	50                   	push   %eax
    33f6:	52                   	push   %edx
    33f7:	e8 8f 5d 00 00       	call   918b <Memcpy>
    33fc:	83 c4 10             	add    $0x10,%esp
    33ff:	8b 45 10             	mov    0x10(%ebp),%eax
    3402:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    3409:	00 00 00 
    340c:	8b 45 10             	mov    0x10(%ebp),%eax
    340f:	c7 80 88 01 00 00 20 	movl   $0x20,0x188(%eax)
    3416:	00 00 00 
    3419:	8b 45 10             	mov    0x10(%ebp),%eax
    341c:	c7 80 84 01 00 00 20 	movl   $0x20,0x184(%eax)
    3423:	00 00 00 
    3426:	8b 45 10             	mov    0x10(%ebp),%eax
    3429:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3430:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    3437:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    343b:	0f 84 cd 03 00 00    	je     380e <sys_receive_msg+0x4bb>
    3441:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    3445:	75 26                	jne    346d <sys_receive_msg+0x11a>
    3447:	8b 45 10             	mov    0x10(%ebp),%eax
    344a:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3450:	85 c0                	test   %eax,%eax
    3452:	0f 84 87 00 00 00    	je     34df <sys_receive_msg+0x18c>
    3458:	8b 45 10             	mov    0x10(%ebp),%eax
    345b:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3461:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3464:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    346b:	eb 72                	jmp    34df <sys_receive_msg+0x18c>
    346d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3471:	78 6c                	js     34df <sys_receive_msg+0x18c>
    3473:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
    3477:	7f 66                	jg     34df <sys_receive_msg+0x18c>
    3479:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    347c:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3483:	3c 01                	cmp    $0x1,%al
    3485:	75 58                	jne    34df <sys_receive_msg+0x18c>
    3487:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    348a:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3490:	83 f8 11             	cmp    $0x11,%eax
    3493:	74 0e                	je     34a3 <sys_receive_msg+0x150>
    3495:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3498:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    349e:	39 45 e0             	cmp    %eax,-0x20(%ebp)
    34a1:	75 3c                	jne    34df <sys_receive_msg+0x18c>
    34a3:	8b 45 10             	mov    0x10(%ebp),%eax
    34a6:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    34ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
    34af:	eb 28                	jmp    34d9 <sys_receive_msg+0x186>
    34b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    34b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34ba:	8b 50 58             	mov    0x58(%eax),%edx
    34bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    34c0:	39 c2                	cmp    %eax,%edx
    34c2:	75 09                	jne    34cd <sys_receive_msg+0x17a>
    34c4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    34cb:	eb 12                	jmp    34df <sys_receive_msg+0x18c>
    34cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34d0:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    34d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    34d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    34dd:	75 d2                	jne    34b1 <sys_receive_msg+0x15e>
    34df:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    34e3:	0f 85 82 02 00 00    	jne    376b <sys_receive_msg+0x418>
    34e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
    34ef:	8b 45 10             	mov    0x10(%ebp),%eax
    34f2:	8b 40 0c             	mov    0xc(%eax),%eax
    34f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
    34f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    34fb:	83 ec 08             	sub    $0x8,%esp
    34fe:	ff 75 10             	pushl  0x10(%ebp)
    3501:	50                   	push   %eax
    3502:	e8 aa 34 00 00       	call   69b1 <Seg2PhyAddrLDT>
    3507:	83 c4 10             	add    $0x10,%esp
    350a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    350d:	8b 55 08             	mov    0x8(%ebp),%edx
    3510:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3513:	01 d0                	add    %edx,%eax
    3515:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3518:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
    351f:	8b 45 10             	mov    0x10(%ebp),%eax
    3522:	8b 40 0c             	mov    0xc(%eax),%eax
    3525:	89 45 c8             	mov    %eax,-0x38(%ebp)
    3528:	8b 45 c8             	mov    -0x38(%ebp),%eax
    352b:	83 ec 08             	sub    $0x8,%esp
    352e:	ff 75 dc             	pushl  -0x24(%ebp)
    3531:	50                   	push   %eax
    3532:	e8 7a 34 00 00       	call   69b1 <Seg2PhyAddrLDT>
    3537:	83 c4 10             	add    $0x10,%esp
    353a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    353d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3540:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3546:	89 c2                	mov    %eax,%edx
    3548:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    354b:	01 d0                	add    %edx,%eax
    354d:	89 45 c0             	mov    %eax,-0x40(%ebp)
    3550:	83 ec 04             	sub    $0x4,%esp
    3553:	ff 75 cc             	pushl  -0x34(%ebp)
    3556:	ff 75 c0             	pushl  -0x40(%ebp)
    3559:	ff 75 d0             	pushl  -0x30(%ebp)
    355c:	e8 2a 5c 00 00       	call   918b <Memcpy>
    3561:	83 c4 10             	add    $0x10,%esp
    3564:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3567:	89 45 bc             	mov    %eax,-0x44(%ebp)
    356a:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
    356e:	75 27                	jne    3597 <sys_receive_msg+0x244>
    3570:	8b 45 08             	mov    0x8(%ebp),%eax
    3573:	8b 40 68             	mov    0x68(%eax),%eax
    3576:	83 f8 06             	cmp    $0x6,%eax
    3579:	74 1c                	je     3597 <sys_receive_msg+0x244>
    357b:	68 e5 05 00 00       	push   $0x5e5
    3580:	68 4a 8c 00 00       	push   $0x8c4a
    3585:	68 4a 8c 00 00       	push   $0x8c4a
    358a:	68 37 8d 00 00       	push   $0x8d37
    358f:	e8 18 fa ff ff       	call   2fac <assertion_failure>
    3594:	83 c4 10             	add    $0x10,%esp
    3597:	8b 45 10             	mov    0x10(%ebp),%eax
    359a:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    35a0:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    35a3:	75 21                	jne    35c6 <sys_receive_msg+0x273>
    35a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35a8:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    35ae:	8b 45 10             	mov    0x10(%ebp),%eax
    35b1:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    35b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35ba:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    35c1:	00 00 00 
    35c4:	eb 1f                	jmp    35e5 <sys_receive_msg+0x292>
    35c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35c9:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    35cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35d2:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    35d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35db:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    35e2:	00 00 00 
    35e5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    35e8:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    35ef:	00 00 00 
    35f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    35f5:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    35fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    35ff:	c7 80 84 01 00 00 20 	movl   $0x20,0x184(%eax)
    3606:	00 00 00 
    3609:	8b 45 10             	mov    0x10(%ebp),%eax
    360c:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3613:	00 00 00 
    3616:	8b 45 10             	mov    0x10(%ebp),%eax
    3619:	c7 80 88 01 00 00 20 	movl   $0x20,0x188(%eax)
    3620:	00 00 00 
    3623:	8b 45 10             	mov    0x10(%ebp),%eax
    3626:	c7 80 84 01 00 00 20 	movl   $0x20,0x184(%eax)
    362d:	00 00 00 
    3630:	83 ec 0c             	sub    $0xc,%esp
    3633:	ff 75 dc             	pushl  -0x24(%ebp)
    3636:	e8 d5 02 00 00       	call   3910 <unblock>
    363b:	83 c4 10             	add    $0x10,%esp
    363e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3641:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3647:	85 c0                	test   %eax,%eax
    3649:	74 1c                	je     3667 <sys_receive_msg+0x314>
    364b:	68 06 06 00 00       	push   $0x606
    3650:	68 4a 8c 00 00       	push   $0x8c4a
    3655:	68 4a 8c 00 00       	push   $0x8c4a
    365a:	68 49 8d 00 00       	push   $0x8d49
    365f:	e8 48 f9 ff ff       	call   2fac <assertion_failure>
    3664:	83 c4 10             	add    $0x10,%esp
    3667:	8b 45 dc             	mov    -0x24(%ebp),%eax
    366a:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3671:	84 c0                	test   %al,%al
    3673:	74 1c                	je     3691 <sys_receive_msg+0x33e>
    3675:	68 07 06 00 00       	push   $0x607
    367a:	68 4a 8c 00 00       	push   $0x8c4a
    367f:	68 4a 8c 00 00       	push   $0x8c4a
    3684:	68 61 8d 00 00       	push   $0x8d61
    3689:	e8 1e f9 ff ff       	call   2fac <assertion_failure>
    368e:	83 c4 10             	add    $0x10,%esp
    3691:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3694:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    369a:	83 f8 20             	cmp    $0x20,%eax
    369d:	74 1c                	je     36bb <sys_receive_msg+0x368>
    369f:	68 08 06 00 00       	push   $0x608
    36a4:	68 4a 8c 00 00       	push   $0x8c4a
    36a9:	68 4a 8c 00 00       	push   $0x8c4a
    36ae:	68 7c 8d 00 00       	push   $0x8d7c
    36b3:	e8 f4 f8 ff ff       	call   2fac <assertion_failure>
    36b8:	83 c4 10             	add    $0x10,%esp
    36bb:	8b 45 10             	mov    0x10(%ebp),%eax
    36be:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    36c4:	85 c0                	test   %eax,%eax
    36c6:	74 1c                	je     36e4 <sys_receive_msg+0x391>
    36c8:	68 0a 06 00 00       	push   $0x60a
    36cd:	68 4a 8c 00 00       	push   $0x8c4a
    36d2:	68 4a 8c 00 00       	push   $0x8c4a
    36d7:	68 95 8c 00 00       	push   $0x8c95
    36dc:	e8 cb f8 ff ff       	call   2fac <assertion_failure>
    36e1:	83 c4 10             	add    $0x10,%esp
    36e4:	8b 45 10             	mov    0x10(%ebp),%eax
    36e7:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    36ee:	84 c0                	test   %al,%al
    36f0:	74 1c                	je     370e <sys_receive_msg+0x3bb>
    36f2:	68 0b 06 00 00       	push   $0x60b
    36f7:	68 4a 8c 00 00       	push   $0x8c4a
    36fc:	68 4a 8c 00 00       	push   $0x8c4a
    3701:	68 aa 8c 00 00       	push   $0x8caa
    3706:	e8 a1 f8 ff ff       	call   2fac <assertion_failure>
    370b:	83 c4 10             	add    $0x10,%esp
    370e:	8b 45 10             	mov    0x10(%ebp),%eax
    3711:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    3717:	83 f8 20             	cmp    $0x20,%eax
    371a:	74 1c                	je     3738 <sys_receive_msg+0x3e5>
    371c:	68 0c 06 00 00       	push   $0x60c
    3721:	68 4a 8c 00 00       	push   $0x8c4a
    3726:	68 4a 8c 00 00       	push   $0x8c4a
    372b:	68 c0 8c 00 00       	push   $0x8cc0
    3730:	e8 77 f8 ff ff       	call   2fac <assertion_failure>
    3735:	83 c4 10             	add    $0x10,%esp
    3738:	8b 45 10             	mov    0x10(%ebp),%eax
    373b:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3741:	83 f8 20             	cmp    $0x20,%eax
    3744:	0f 84 bd 00 00 00    	je     3807 <sys_receive_msg+0x4b4>
    374a:	68 0d 06 00 00       	push   $0x60d
    374f:	68 4a 8c 00 00       	push   $0x8c4a
    3754:	68 4a 8c 00 00       	push   $0x8c4a
    3759:	68 a0 8d 00 00       	push   $0x8da0
    375e:	e8 49 f8 ff ff       	call   2fac <assertion_failure>
    3763:	83 c4 10             	add    $0x10,%esp
    3766:	e9 9c 00 00 00       	jmp    3807 <sys_receive_msg+0x4b4>
    376b:	8b 45 10             	mov    0x10(%ebp),%eax
    376e:	c6 80 7c 01 00 00 02 	movb   $0x2,0x17c(%eax)
    3775:	8b 45 10             	mov    0x10(%ebp),%eax
    3778:	8b 55 08             	mov    0x8(%ebp),%edx
    377b:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    3781:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    3785:	75 0f                	jne    3796 <sys_receive_msg+0x443>
    3787:	8b 45 10             	mov    0x10(%ebp),%eax
    378a:	c7 80 88 01 00 00 11 	movl   $0x11,0x188(%eax)
    3791:	00 00 00 
    3794:	eb 0c                	jmp    37a2 <sys_receive_msg+0x44f>
    3796:	8b 45 10             	mov    0x10(%ebp),%eax
    3799:	8b 55 0c             	mov    0xc(%ebp),%edx
    379c:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
    37a2:	8b 0d 50 d7 00 00    	mov    0xd750,%ecx
    37a8:	ba 67 66 66 66       	mov    $0x66666667,%edx
    37ad:	89 c8                	mov    %ecx,%eax
    37af:	f7 ea                	imul   %edx
    37b1:	c1 fa 06             	sar    $0x6,%edx
    37b4:	89 c8                	mov    %ecx,%eax
    37b6:	c1 f8 1f             	sar    $0x1f,%eax
    37b9:	29 c2                	sub    %eax,%edx
    37bb:	89 d0                	mov    %edx,%eax
    37bd:	8d 50 01             	lea    0x1(%eax),%edx
    37c0:	89 d0                	mov    %edx,%eax
    37c2:	c1 e0 02             	shl    $0x2,%eax
    37c5:	01 d0                	add    %edx,%eax
    37c7:	c1 e0 05             	shl    $0x5,%eax
    37ca:	a3 50 d7 00 00       	mov    %eax,0xd750
    37cf:	8b 45 10             	mov    0x10(%ebp),%eax
    37d2:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    37d9:	3c 02                	cmp    $0x2,%al
    37db:	74 1c                	je     37f9 <sys_receive_msg+0x4a6>
    37dd:	68 42 06 00 00       	push   $0x642
    37e2:	68 4a 8c 00 00       	push   $0x8c4a
    37e7:	68 4a 8c 00 00       	push   $0x8c4a
    37ec:	68 bf 8d 00 00       	push   $0x8dbf
    37f1:	e8 b6 f7 ff ff       	call   2fac <assertion_failure>
    37f6:	83 c4 10             	add    $0x10,%esp
    37f9:	83 ec 0c             	sub    $0xc,%esp
    37fc:	ff 75 10             	pushl  0x10(%ebp)
    37ff:	e8 fa 00 00 00       	call   38fe <block>
    3804:	83 c4 10             	add    $0x10,%esp
    3807:	b8 00 00 00 00       	mov    $0x0,%eax
    380c:	eb 02                	jmp    3810 <sys_receive_msg+0x4bd>
    380e:	90                   	nop
    380f:	90                   	nop
    3810:	c9                   	leave  
    3811:	c3                   	ret    

00003812 <disp_str_colour_debug>:
    3812:	55                   	push   %ebp
    3813:	89 e5                	mov    %esp,%ebp
    3815:	90                   	nop
    3816:	5d                   	pop    %ebp
    3817:	c3                   	ret    

00003818 <send_rec>:
    3818:	55                   	push   %ebp
    3819:	89 e5                	mov    %esp,%ebp
    381b:	83 ec 18             	sub    $0x18,%esp
    381e:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    3822:	74 28                	je     384c <send_rec+0x34>
    3824:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    3828:	74 22                	je     384c <send_rec+0x34>
    382a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    382e:	74 1c                	je     384c <send_rec+0x34>
    3830:	68 6b 06 00 00       	push   $0x66b
    3835:	68 4a 8c 00 00       	push   $0x8c4a
    383a:	68 4a 8c 00 00       	push   $0x8c4a
    383f:	68 e0 8d 00 00       	push   $0x8de0
    3844:	e8 63 f7 ff ff       	call   2fac <assertion_failure>
    3849:	83 c4 10             	add    $0x10,%esp
    384c:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    3850:	75 12                	jne    3864 <send_rec+0x4c>
    3852:	83 ec 04             	sub    $0x4,%esp
    3855:	6a 6c                	push   $0x6c
    3857:	6a 00                	push   $0x0
    3859:	ff 75 0c             	pushl  0xc(%ebp)
    385c:	e8 58 59 00 00       	call   91b9 <Memset>
    3861:	83 c4 10             	add    $0x10,%esp
    3864:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    3868:	74 22                	je     388c <send_rec+0x74>
    386a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    386e:	74 32                	je     38a2 <send_rec+0x8a>
    3870:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    3874:	75 6e                	jne    38e4 <send_rec+0xcc>
    3876:	83 ec 08             	sub    $0x8,%esp
    3879:	ff 75 10             	pushl  0x10(%ebp)
    387c:	ff 75 0c             	pushl  0xc(%ebp)
    387f:	e8 94 0f 00 00       	call   4818 <send_msg>
    3884:	83 c4 10             	add    $0x10,%esp
    3887:	89 45 f4             	mov    %eax,-0xc(%ebp)
    388a:	eb 6b                	jmp    38f7 <send_rec+0xdf>
    388c:	83 ec 08             	sub    $0x8,%esp
    388f:	ff 75 10             	pushl  0x10(%ebp)
    3892:	ff 75 0c             	pushl  0xc(%ebp)
    3895:	e8 a4 0f 00 00       	call   483e <receive_msg>
    389a:	83 c4 10             	add    $0x10,%esp
    389d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38a0:	eb 55                	jmp    38f7 <send_rec+0xdf>
    38a2:	83 ec 08             	sub    $0x8,%esp
    38a5:	ff 75 10             	pushl  0x10(%ebp)
    38a8:	ff 75 0c             	pushl  0xc(%ebp)
    38ab:	e8 68 0f 00 00       	call   4818 <send_msg>
    38b0:	83 c4 10             	add    $0x10,%esp
    38b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    38ba:	75 3a                	jne    38f6 <send_rec+0xde>
    38bc:	83 ec 04             	sub    $0x4,%esp
    38bf:	6a 6c                	push   $0x6c
    38c1:	6a 00                	push   $0x0
    38c3:	ff 75 0c             	pushl  0xc(%ebp)
    38c6:	e8 ee 58 00 00       	call   91b9 <Memset>
    38cb:	83 c4 10             	add    $0x10,%esp
    38ce:	83 ec 08             	sub    $0x8,%esp
    38d1:	ff 75 10             	pushl  0x10(%ebp)
    38d4:	ff 75 0c             	pushl  0xc(%ebp)
    38d7:	e8 62 0f 00 00       	call   483e <receive_msg>
    38dc:	83 c4 10             	add    $0x10,%esp
    38df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38e2:	eb 12                	jmp    38f6 <send_rec+0xde>
    38e4:	83 ec 0c             	sub    $0xc,%esp
    38e7:	68 1c 8e 00 00       	push   $0x8e1c
    38ec:	e8 9d f6 ff ff       	call   2f8e <panic>
    38f1:	83 c4 10             	add    $0x10,%esp
    38f4:	eb 01                	jmp    38f7 <send_rec+0xdf>
    38f6:	90                   	nop
    38f7:	b8 00 00 00 00       	mov    $0x0,%eax
    38fc:	c9                   	leave  
    38fd:	c3                   	ret    

000038fe <block>:
    38fe:	55                   	push   %ebp
    38ff:	89 e5                	mov    %esp,%ebp
    3901:	83 ec 08             	sub    $0x8,%esp
    3904:	e8 88 2e 00 00       	call   6791 <schedule_process>
    3909:	b8 00 00 00 00       	mov    $0x0,%eax
    390e:	c9                   	leave  
    390f:	c3                   	ret    

00003910 <unblock>:
    3910:	55                   	push   %ebp
    3911:	89 e5                	mov    %esp,%ebp
    3913:	83 ec 08             	sub    $0x8,%esp
    3916:	8b 45 08             	mov    0x8(%ebp),%eax
    3919:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3920:	84 c0                	test   %al,%al
    3922:	74 1c                	je     3940 <unblock+0x30>
    3924:	68 a3 06 00 00       	push   $0x6a3
    3929:	68 4a 8c 00 00       	push   $0x8c4a
    392e:	68 4a 8c 00 00       	push   $0x8c4a
    3933:	68 31 8e 00 00       	push   $0x8e31
    3938:	e8 6f f6 ff ff       	call   2fac <assertion_failure>
    393d:	83 c4 10             	add    $0x10,%esp
    3940:	b8 00 00 00 00       	mov    $0x0,%eax
    3945:	c9                   	leave  
    3946:	c3                   	ret    

00003947 <get_ticks_ipc>:
    3947:	55                   	push   %ebp
    3948:	89 e5                	mov    %esp,%ebp
    394a:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3950:	83 ec 04             	sub    $0x4,%esp
    3953:	6a 6c                	push   $0x6c
    3955:	6a 00                	push   $0x0
    3957:	8d 45 84             	lea    -0x7c(%ebp),%eax
    395a:	50                   	push   %eax
    395b:	e8 59 58 00 00       	call   91b9 <Memset>
    3960:	83 c4 10             	add    $0x10,%esp
    3963:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
    396a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    3971:	83 ec 04             	sub    $0x4,%esp
    3974:	6a 01                	push   $0x1
    3976:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3979:	50                   	push   %eax
    397a:	6a 03                	push   $0x3
    397c:	e8 97 fe ff ff       	call   3818 <send_rec>
    3981:	83 c4 10             	add    $0x10,%esp
    3984:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3987:	8b 45 8c             	mov    -0x74(%ebp),%eax
    398a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    398d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3990:	c9                   	leave  
    3991:	c3                   	ret    

00003992 <itoa>:
    3992:	55                   	push   %ebp
    3993:	89 e5                	mov    %esp,%ebp
    3995:	53                   	push   %ebx
    3996:	83 ec 14             	sub    $0x14,%esp
    3999:	8b 45 08             	mov    0x8(%ebp),%eax
    399c:	99                   	cltd   
    399d:	f7 7d 10             	idivl  0x10(%ebp)
    39a0:	89 55 f4             	mov    %edx,-0xc(%ebp)
    39a3:	8b 45 08             	mov    0x8(%ebp),%eax
    39a6:	99                   	cltd   
    39a7:	f7 7d 10             	idivl  0x10(%ebp)
    39aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    39ad:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    39b1:	74 14                	je     39c7 <itoa+0x35>
    39b3:	83 ec 04             	sub    $0x4,%esp
    39b6:	ff 75 10             	pushl  0x10(%ebp)
    39b9:	ff 75 0c             	pushl  0xc(%ebp)
    39bc:	ff 75 f0             	pushl  -0x10(%ebp)
    39bf:	e8 ce ff ff ff       	call   3992 <itoa>
    39c4:	83 c4 10             	add    $0x10,%esp
    39c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39ca:	8d 58 30             	lea    0x30(%eax),%ebx
    39cd:	8b 45 0c             	mov    0xc(%ebp),%eax
    39d0:	8b 00                	mov    (%eax),%eax
    39d2:	8d 48 01             	lea    0x1(%eax),%ecx
    39d5:	8b 55 0c             	mov    0xc(%ebp),%edx
    39d8:	89 0a                	mov    %ecx,(%edx)
    39da:	89 da                	mov    %ebx,%edx
    39dc:	88 10                	mov    %dl,(%eax)
    39de:	8b 45 0c             	mov    0xc(%ebp),%eax
    39e1:	8b 00                	mov    (%eax),%eax
    39e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    39e6:	c9                   	leave  
    39e7:	c3                   	ret    

000039e8 <i2a>:
    39e8:	55                   	push   %ebp
    39e9:	89 e5                	mov    %esp,%ebp
    39eb:	53                   	push   %ebx
    39ec:	83 ec 14             	sub    $0x14,%esp
    39ef:	8b 45 08             	mov    0x8(%ebp),%eax
    39f2:	99                   	cltd   
    39f3:	f7 7d 0c             	idivl  0xc(%ebp)
    39f6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    39f9:	8b 45 08             	mov    0x8(%ebp),%eax
    39fc:	99                   	cltd   
    39fd:	f7 7d 0c             	idivl  0xc(%ebp)
    3a00:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3a03:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3a07:	74 14                	je     3a1d <i2a+0x35>
    3a09:	83 ec 04             	sub    $0x4,%esp
    3a0c:	ff 75 10             	pushl  0x10(%ebp)
    3a0f:	ff 75 0c             	pushl  0xc(%ebp)
    3a12:	ff 75 f0             	pushl  -0x10(%ebp)
    3a15:	e8 ce ff ff ff       	call   39e8 <i2a>
    3a1a:	83 c4 10             	add    $0x10,%esp
    3a1d:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    3a21:	7f 0a                	jg     3a2d <i2a+0x45>
    3a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a26:	83 c0 30             	add    $0x30,%eax
    3a29:	89 c3                	mov    %eax,%ebx
    3a2b:	eb 08                	jmp    3a35 <i2a+0x4d>
    3a2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a30:	83 c0 37             	add    $0x37,%eax
    3a33:	89 c3                	mov    %eax,%ebx
    3a35:	8b 45 10             	mov    0x10(%ebp),%eax
    3a38:	8b 00                	mov    (%eax),%eax
    3a3a:	8d 48 01             	lea    0x1(%eax),%ecx
    3a3d:	8b 55 10             	mov    0x10(%ebp),%edx
    3a40:	89 0a                	mov    %ecx,(%edx)
    3a42:	88 18                	mov    %bl,(%eax)
    3a44:	8b 45 10             	mov    0x10(%ebp),%eax
    3a47:	8b 00                	mov    (%eax),%eax
    3a49:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3a4c:	c9                   	leave  
    3a4d:	c3                   	ret    

00003a4e <inform_int>:
    3a4e:	55                   	push   %ebp
    3a4f:	89 e5                	mov    %esp,%ebp
    3a51:	83 ec 18             	sub    $0x18,%esp
    3a54:	83 ec 0c             	sub    $0xc,%esp
    3a57:	ff 75 08             	pushl  0x8(%ebp)
    3a5a:	e8 69 2e 00 00       	call   68c8 <pid2proc>
    3a5f:	83 c4 10             	add    $0x10,%esp
    3a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3a65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a68:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3a6f:	0f be c0             	movsbl %al,%eax
    3a72:	83 e0 02             	and    $0x2,%eax
    3a75:	85 c0                	test   %eax,%eax
    3a77:	74 7e                	je     3af7 <inform_int+0xa9>
    3a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a7c:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    3a82:	3d 13 02 00 00       	cmp    $0x213,%eax
    3a87:	74 0e                	je     3a97 <inform_int+0x49>
    3a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a8c:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    3a92:	83 f8 11             	cmp    $0x11,%eax
    3a95:	75 6d                	jne    3b04 <inform_int+0xb6>
    3a97:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a9a:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3aa0:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
    3aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aa9:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3aaf:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
    3ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ab9:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    3ac0:	00 00 00 
    3ac3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ac6:	c7 80 88 01 00 00 20 	movl   $0x20,0x188(%eax)
    3acd:	00 00 00 
    3ad0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ad3:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3ada:	00 00 00 
    3add:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ae0:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3ae7:	83 ec 0c             	sub    $0xc,%esp
    3aea:	ff 75 f4             	pushl  -0xc(%ebp)
    3aed:	e8 1e fe ff ff       	call   3910 <unblock>
    3af2:	83 c4 10             	add    $0x10,%esp
    3af5:	eb 0d                	jmp    3b04 <inform_int+0xb6>
    3af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3afa:	c7 80 94 01 00 00 01 	movl   $0x1,0x194(%eax)
    3b01:	00 00 00 
    3b04:	90                   	nop
    3b05:	c9                   	leave  
    3b06:	c3                   	ret    

00003b07 <strcmp>:
    3b07:	55                   	push   %ebp
    3b08:	89 e5                	mov    %esp,%ebp
    3b0a:	83 ec 10             	sub    $0x10,%esp
    3b0d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3b11:	74 06                	je     3b19 <strcmp+0x12>
    3b13:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3b17:	75 08                	jne    3b21 <strcmp+0x1a>
    3b19:	8b 45 08             	mov    0x8(%ebp),%eax
    3b1c:	2b 45 0c             	sub    0xc(%ebp),%eax
    3b1f:	eb 53                	jmp    3b74 <strcmp+0x6d>
    3b21:	8b 45 08             	mov    0x8(%ebp),%eax
    3b24:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3b27:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b2a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3b2d:	eb 18                	jmp    3b47 <strcmp+0x40>
    3b2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b32:	0f b6 10             	movzbl (%eax),%edx
    3b35:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3b38:	0f b6 00             	movzbl (%eax),%eax
    3b3b:	38 c2                	cmp    %al,%dl
    3b3d:	75 1e                	jne    3b5d <strcmp+0x56>
    3b3f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3b43:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3b47:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b4a:	0f b6 00             	movzbl (%eax),%eax
    3b4d:	84 c0                	test   %al,%al
    3b4f:	74 0d                	je     3b5e <strcmp+0x57>
    3b51:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3b54:	0f b6 00             	movzbl (%eax),%eax
    3b57:	84 c0                	test   %al,%al
    3b59:	75 d4                	jne    3b2f <strcmp+0x28>
    3b5b:	eb 01                	jmp    3b5e <strcmp+0x57>
    3b5d:	90                   	nop
    3b5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b61:	0f b6 00             	movzbl (%eax),%eax
    3b64:	0f be d0             	movsbl %al,%edx
    3b67:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3b6a:	0f b6 00             	movzbl (%eax),%eax
    3b6d:	0f be c0             	movsbl %al,%eax
    3b70:	29 c2                	sub    %eax,%edx
    3b72:	89 d0                	mov    %edx,%eax
    3b74:	c9                   	leave  
    3b75:	c3                   	ret    

00003b76 <TaskHD>:
    3b76:	55                   	push   %ebp
    3b77:	89 e5                	mov    %esp,%ebp
    3b79:	83 ec 08             	sub    $0x8,%esp
    3b7c:	e8 07 00 00 00       	call   3b88 <init_hd>
    3b81:	e8 1c 00 00 00       	call   3ba2 <hd_handle>
    3b86:	eb f9                	jmp    3b81 <TaskHD+0xb>

00003b88 <init_hd>:
    3b88:	55                   	push   %ebp
    3b89:	89 e5                	mov    %esp,%ebp
    3b8b:	83 ec 18             	sub    $0x18,%esp
    3b8e:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
    3b95:	e8 02 d8 ff ff       	call   139c <enable_8259A_casecade_irq>
    3b9a:	e8 11 d8 ff ff       	call   13b0 <enable_8259A_slave_winchester_irq>
    3b9f:	90                   	nop
    3ba0:	c9                   	leave  
    3ba1:	c3                   	ret    

00003ba2 <hd_handle>:
    3ba2:	55                   	push   %ebp
    3ba3:	89 e5                	mov    %esp,%ebp
    3ba5:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3bab:	83 ec 04             	sub    $0x4,%esp
    3bae:	6a 11                	push   $0x11
    3bb0:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3bb3:	50                   	push   %eax
    3bb4:	6a 02                	push   $0x2
    3bb6:	e8 5d fc ff ff       	call   3818 <send_rec>
    3bbb:	83 c4 10             	add    $0x10,%esp
    3bbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3bc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3bc4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3bc8:	0f 84 96 00 00 00    	je     3c64 <hd_handle+0xc2>
    3bce:	8b 45 84             	mov    -0x7c(%ebp),%eax
    3bd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3bd4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3bd8:	74 23                	je     3bfd <hd_handle+0x5b>
    3bda:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3bde:	77 08                	ja     3be8 <hd_handle+0x46>
    3be0:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    3be4:	74 10                	je     3bf6 <hd_handle+0x54>
    3be6:	eb 35                	jmp    3c1d <hd_handle+0x7b>
    3be8:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    3bec:	74 0f                	je     3bfd <hd_handle+0x5b>
    3bee:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    3bf2:	74 1a                	je     3c0e <hd_handle+0x6c>
    3bf4:	eb 27                	jmp    3c1d <hd_handle+0x7b>
    3bf6:	e8 18 07 00 00       	call   4313 <hd_open>
    3bfb:	eb 31                	jmp    3c2e <hd_handle+0x8c>
    3bfd:	83 ec 0c             	sub    $0xc,%esp
    3c00:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3c03:	50                   	push   %eax
    3c04:	e8 02 08 00 00       	call   440b <hd_rdwt>
    3c09:	83 c4 10             	add    $0x10,%esp
    3c0c:	eb 20                	jmp    3c2e <hd_handle+0x8c>
    3c0e:	83 ec 0c             	sub    $0xc,%esp
    3c11:	6a 00                	push   $0x0
    3c13:	e8 4a 07 00 00       	call   4362 <get_hd_ioctl>
    3c18:	83 c4 10             	add    $0x10,%esp
    3c1b:	eb 11                	jmp    3c2e <hd_handle+0x8c>
    3c1d:	83 ec 0c             	sub    $0xc,%esp
    3c20:	68 49 8e 00 00       	push   $0x8e49
    3c25:	e8 5f f3 ff ff       	call   2f89 <spin>
    3c2a:	83 c4 10             	add    $0x10,%esp
    3c2d:	90                   	nop
    3c2e:	83 ec 04             	sub    $0x4,%esp
    3c31:	6a 6c                	push   $0x6c
    3c33:	6a 00                	push   $0x0
    3c35:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3c38:	50                   	push   %eax
    3c39:	e8 7b 55 00 00       	call   91b9 <Memset>
    3c3e:	83 c4 10             	add    $0x10,%esp
    3c41:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
    3c48:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
    3c4f:	83 ec 04             	sub    $0x4,%esp
    3c52:	6a 03                	push   $0x3
    3c54:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3c57:	50                   	push   %eax
    3c58:	6a 01                	push   $0x1
    3c5a:	e8 b9 fb ff ff       	call   3818 <send_rec>
    3c5f:	83 c4 10             	add    $0x10,%esp
    3c62:	eb 01                	jmp    3c65 <hd_handle+0xc3>
    3c64:	90                   	nop
    3c65:	c9                   	leave  
    3c66:	c3                   	ret    

00003c67 <hd_cmd_out>:
    3c67:	55                   	push   %ebp
    3c68:	89 e5                	mov    %esp,%ebp
    3c6a:	83 ec 08             	sub    $0x8,%esp
    3c6d:	83 ec 04             	sub    $0x4,%esp
    3c70:	68 98 3a 00 00       	push   $0x3a98
    3c75:	6a 00                	push   $0x0
    3c77:	68 80 00 00 00       	push   $0x80
    3c7c:	e8 e8 09 00 00       	call   4669 <waitfor>
    3c81:	83 c4 10             	add    $0x10,%esp
    3c84:	85 c0                	test   %eax,%eax
    3c86:	75 10                	jne    3c98 <hd_cmd_out+0x31>
    3c88:	83 ec 0c             	sub    $0xc,%esp
    3c8b:	68 5b 8e 00 00       	push   $0x8e5b
    3c90:	e8 f9 f2 ff ff       	call   2f8e <panic>
    3c95:	83 c4 10             	add    $0x10,%esp
    3c98:	83 ec 08             	sub    $0x8,%esp
    3c9b:	6a 00                	push   $0x0
    3c9d:	68 f6 03 00 00       	push   $0x3f6
    3ca2:	e8 3b d6 ff ff       	call   12e2 <out_byte>
    3ca7:	83 c4 10             	add    $0x10,%esp
    3caa:	8b 45 08             	mov    0x8(%ebp),%eax
    3cad:	0f b6 00             	movzbl (%eax),%eax
    3cb0:	0f b6 c0             	movzbl %al,%eax
    3cb3:	83 ec 08             	sub    $0x8,%esp
    3cb6:	50                   	push   %eax
    3cb7:	68 f1 01 00 00       	push   $0x1f1
    3cbc:	e8 21 d6 ff ff       	call   12e2 <out_byte>
    3cc1:	83 c4 10             	add    $0x10,%esp
    3cc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3cc7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3ccb:	0f b6 c0             	movzbl %al,%eax
    3cce:	83 ec 08             	sub    $0x8,%esp
    3cd1:	50                   	push   %eax
    3cd2:	68 f2 01 00 00       	push   $0x1f2
    3cd7:	e8 06 d6 ff ff       	call   12e2 <out_byte>
    3cdc:	83 c4 10             	add    $0x10,%esp
    3cdf:	8b 45 08             	mov    0x8(%ebp),%eax
    3ce2:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3ce6:	0f b6 c0             	movzbl %al,%eax
    3ce9:	83 ec 08             	sub    $0x8,%esp
    3cec:	50                   	push   %eax
    3ced:	68 f3 01 00 00       	push   $0x1f3
    3cf2:	e8 eb d5 ff ff       	call   12e2 <out_byte>
    3cf7:	83 c4 10             	add    $0x10,%esp
    3cfa:	8b 45 08             	mov    0x8(%ebp),%eax
    3cfd:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    3d01:	0f b6 c0             	movzbl %al,%eax
    3d04:	83 ec 08             	sub    $0x8,%esp
    3d07:	50                   	push   %eax
    3d08:	68 f4 01 00 00       	push   $0x1f4
    3d0d:	e8 d0 d5 ff ff       	call   12e2 <out_byte>
    3d12:	83 c4 10             	add    $0x10,%esp
    3d15:	8b 45 08             	mov    0x8(%ebp),%eax
    3d18:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3d1c:	0f b6 c0             	movzbl %al,%eax
    3d1f:	83 ec 08             	sub    $0x8,%esp
    3d22:	50                   	push   %eax
    3d23:	68 f5 01 00 00       	push   $0x1f5
    3d28:	e8 b5 d5 ff ff       	call   12e2 <out_byte>
    3d2d:	83 c4 10             	add    $0x10,%esp
    3d30:	8b 45 08             	mov    0x8(%ebp),%eax
    3d33:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    3d37:	0f b6 c0             	movzbl %al,%eax
    3d3a:	83 ec 08             	sub    $0x8,%esp
    3d3d:	50                   	push   %eax
    3d3e:	68 f6 01 00 00       	push   $0x1f6
    3d43:	e8 9a d5 ff ff       	call   12e2 <out_byte>
    3d48:	83 c4 10             	add    $0x10,%esp
    3d4b:	8b 45 08             	mov    0x8(%ebp),%eax
    3d4e:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    3d52:	0f b6 c0             	movzbl %al,%eax
    3d55:	83 ec 08             	sub    $0x8,%esp
    3d58:	50                   	push   %eax
    3d59:	68 f7 01 00 00       	push   $0x1f7
    3d5e:	e8 7f d5 ff ff       	call   12e2 <out_byte>
    3d63:	83 c4 10             	add    $0x10,%esp
    3d66:	90                   	nop
    3d67:	c9                   	leave  
    3d68:	c3                   	ret    

00003d69 <hd_identify>:
    3d69:	55                   	push   %ebp
    3d6a:	89 e5                	mov    %esp,%ebp
    3d6c:	53                   	push   %ebx
    3d6d:	83 ec 24             	sub    $0x24,%esp
    3d70:	89 e0                	mov    %esp,%eax
    3d72:	89 c3                	mov    %eax,%ebx
    3d74:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    3d78:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
    3d7c:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    3d80:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    3d84:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    3d88:	8b 45 08             	mov    0x8(%ebp),%eax
    3d8b:	c1 e0 04             	shl    $0x4,%eax
    3d8e:	83 c8 e0             	or     $0xffffffe0,%eax
    3d91:	88 45 ea             	mov    %al,-0x16(%ebp)
    3d94:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
    3d98:	83 ec 0c             	sub    $0xc,%esp
    3d9b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3d9e:	50                   	push   %eax
    3d9f:	e8 c3 fe ff ff       	call   3c67 <hd_cmd_out>
    3da4:	83 c4 10             	add    $0x10,%esp
    3da7:	e8 40 06 00 00       	call   43ec <interrupt_wait>
    3dac:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
    3db3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3db6:	8d 50 ff             	lea    -0x1(%eax),%edx
    3db9:	89 55 f0             	mov    %edx,-0x10(%ebp)
    3dbc:	89 c2                	mov    %eax,%edx
    3dbe:	b8 10 00 00 00       	mov    $0x10,%eax
    3dc3:	83 e8 01             	sub    $0x1,%eax
    3dc6:	01 d0                	add    %edx,%eax
    3dc8:	b9 10 00 00 00       	mov    $0x10,%ecx
    3dcd:	ba 00 00 00 00       	mov    $0x0,%edx
    3dd2:	f7 f1                	div    %ecx
    3dd4:	6b c0 10             	imul   $0x10,%eax,%eax
    3dd7:	29 c4                	sub    %eax,%esp
    3dd9:	89 e0                	mov    %esp,%eax
    3ddb:	83 c0 00             	add    $0x0,%eax
    3dde:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3de1:	83 ec 04             	sub    $0x4,%esp
    3de4:	ff 75 f4             	pushl  -0xc(%ebp)
    3de7:	6a 00                	push   $0x0
    3de9:	ff 75 ec             	pushl  -0x14(%ebp)
    3dec:	e8 c8 53 00 00       	call   91b9 <Memset>
    3df1:	83 c4 10             	add    $0x10,%esp
    3df4:	83 ec 04             	sub    $0x4,%esp
    3df7:	ff 75 f4             	pushl  -0xc(%ebp)
    3dfa:	ff 75 ec             	pushl  -0x14(%ebp)
    3dfd:	68 f0 01 00 00       	push   $0x1f0
    3e02:	e8 06 54 00 00       	call   920d <read_port>
    3e07:	83 c4 10             	add    $0x10,%esp
    3e0a:	83 ec 0c             	sub    $0xc,%esp
    3e0d:	ff 75 ec             	pushl  -0x14(%ebp)
    3e10:	e8 0b 00 00 00       	call   3e20 <print_hdinfo>
    3e15:	83 c4 10             	add    $0x10,%esp
    3e18:	89 dc                	mov    %ebx,%esp
    3e1a:	90                   	nop
    3e1b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3e1e:	c9                   	leave  
    3e1f:	c3                   	ret    

00003e20 <print_hdinfo>:
    3e20:	55                   	push   %ebp
    3e21:	89 e5                	mov    %esp,%ebp
    3e23:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3e29:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
    3e2f:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
    3e35:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
    3e3c:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
    3e43:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
    3e4a:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
    3e51:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    3e58:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
    3e5e:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
    3e64:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
    3e6b:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
    3e72:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
    3e79:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    3e80:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    3e87:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e8e:	e9 8f 00 00 00       	jmp    3f22 <print_hdinfo+0x102>
    3e93:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3e9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3e9d:	89 d0                	mov    %edx,%eax
    3e9f:	01 c0                	add    %eax,%eax
    3ea1:	01 d0                	add    %edx,%eax
    3ea3:	c1 e0 03             	shl    $0x3,%eax
    3ea6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3ea9:	01 c8                	add    %ecx,%eax
    3eab:	83 e8 44             	sub    $0x44,%eax
    3eae:	0f b7 00             	movzwl (%eax),%eax
    3eb1:	0f b7 c0             	movzwl %ax,%eax
    3eb4:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3eb7:	8b 45 08             	mov    0x8(%ebp),%eax
    3eba:	01 d0                	add    %edx,%eax
    3ebc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3ebf:	eb 30                	jmp    3ef1 <print_hdinfo+0xd1>
    3ec1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ec4:	8d 50 01             	lea    0x1(%eax),%edx
    3ec7:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3eca:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3ecd:	83 c2 01             	add    $0x1,%edx
    3ed0:	0f b6 00             	movzbl (%eax),%eax
    3ed3:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
    3ed7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3eda:	8d 50 01             	lea    0x1(%eax),%edx
    3edd:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3ee0:	0f b6 00             	movzbl (%eax),%eax
    3ee3:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
    3ee6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3ee9:	01 ca                	add    %ecx,%edx
    3eeb:	88 02                	mov    %al,(%edx)
    3eed:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3ef1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3ef4:	89 d0                	mov    %edx,%eax
    3ef6:	01 c0                	add    %eax,%eax
    3ef8:	01 d0                	add    %edx,%eax
    3efa:	c1 e0 03             	shl    $0x3,%eax
    3efd:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3f00:	01 c8                	add    %ecx,%eax
    3f02:	83 e8 42             	sub    $0x42,%eax
    3f05:	0f b7 00             	movzwl (%eax),%eax
    3f08:	66 d1 e8             	shr    %ax
    3f0b:	0f b7 c0             	movzwl %ax,%eax
    3f0e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    3f11:	7c ae                	jl     3ec1 <print_hdinfo+0xa1>
    3f13:	8d 55 81             	lea    -0x7f(%ebp),%edx
    3f16:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f19:	01 d0                	add    %edx,%eax
    3f1b:	c6 00 00             	movb   $0x0,(%eax)
    3f1e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3f22:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    3f26:	0f 8e 67 ff ff ff    	jle    3e93 <print_hdinfo+0x73>
    3f2c:	8b 45 08             	mov    0x8(%ebp),%eax
    3f2f:	0f b7 40 62          	movzwl 0x62(%eax),%eax
    3f33:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    3f37:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    3f3b:	66 c1 e8 08          	shr    $0x8,%ax
    3f3f:	66 85 c0             	test   %ax,%ax
    3f42:	0f 95 c0             	setne  %al
    3f45:	88 45 e9             	mov    %al,-0x17(%ebp)
    3f48:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
    3f4f:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
    3f55:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
    3f59:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
    3f5d:	75 15                	jne    3f74 <print_hdinfo+0x154>
    3f5f:	83 ec 08             	sub    $0x8,%esp
    3f62:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3f65:	50                   	push   %eax
    3f66:	8d 45 b0             	lea    -0x50(%ebp),%eax
    3f69:	50                   	push   %eax
    3f6a:	e8 69 52 00 00       	call   91d8 <Strcpy>
    3f6f:	83 c4 10             	add    $0x10,%esp
    3f72:	eb 13                	jmp    3f87 <print_hdinfo+0x167>
    3f74:	83 ec 08             	sub    $0x8,%esp
    3f77:	8d 45 a9             	lea    -0x57(%ebp),%eax
    3f7a:	50                   	push   %eax
    3f7b:	8d 45 b0             	lea    -0x50(%ebp),%eax
    3f7e:	50                   	push   %eax
    3f7f:	e8 54 52 00 00       	call   91d8 <Strcpy>
    3f84:	83 c4 10             	add    $0x10,%esp
    3f87:	8b 45 08             	mov    0x8(%ebp),%eax
    3f8a:	83 c0 7a             	add    $0x7a,%eax
    3f8d:	0f b7 00             	movzwl (%eax),%eax
    3f90:	0f b7 d0             	movzwl %ax,%edx
    3f93:	8b 45 08             	mov    0x8(%ebp),%eax
    3f96:	83 c0 78             	add    $0x78,%eax
    3f99:	0f b7 00             	movzwl (%eax),%eax
    3f9c:	0f b7 c0             	movzwl %ax,%eax
    3f9f:	83 c0 10             	add    $0x10,%eax
    3fa2:	89 c1                	mov    %eax,%ecx
    3fa4:	d3 e2                	shl    %cl,%edx
    3fa6:	89 d0                	mov    %edx,%eax
    3fa8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3fab:	90                   	nop
    3fac:	c9                   	leave  
    3fad:	c3                   	ret    

00003fae <print_dpt_entry>:
    3fae:	55                   	push   %ebp
    3faf:	89 e5                	mov    %esp,%ebp
    3fb1:	83 ec 08             	sub    $0x8,%esp
    3fb4:	8b 45 08             	mov    0x8(%ebp),%eax
    3fb7:	8b 40 08             	mov    0x8(%eax),%eax
    3fba:	83 ec 08             	sub    $0x8,%esp
    3fbd:	50                   	push   %eax
    3fbe:	68 65 8e 00 00       	push   $0x8e65
    3fc3:	e8 95 ec ff ff       	call   2c5d <Printf>
    3fc8:	83 c4 10             	add    $0x10,%esp
    3fcb:	8b 45 08             	mov    0x8(%ebp),%eax
    3fce:	8b 40 0c             	mov    0xc(%eax),%eax
    3fd1:	83 ec 08             	sub    $0x8,%esp
    3fd4:	50                   	push   %eax
    3fd5:	68 6d 8e 00 00       	push   $0x8e6d
    3fda:	e8 7e ec ff ff       	call   2c5d <Printf>
    3fdf:	83 c4 10             	add    $0x10,%esp
    3fe2:	8b 45 08             	mov    0x8(%ebp),%eax
    3fe5:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3fe9:	0f b6 c0             	movzbl %al,%eax
    3fec:	83 ec 08             	sub    $0x8,%esp
    3fef:	50                   	push   %eax
    3ff0:	68 7e 8e 00 00       	push   $0x8e7e
    3ff5:	e8 63 ec ff ff       	call   2c5d <Printf>
    3ffa:	83 c4 10             	add    $0x10,%esp
    3ffd:	8b 45 08             	mov    0x8(%ebp),%eax
    4000:	0f b6 00             	movzbl (%eax),%eax
    4003:	0f b6 c0             	movzbl %al,%eax
    4006:	83 ec 08             	sub    $0x8,%esp
    4009:	50                   	push   %eax
    400a:	68 8c 8e 00 00       	push   $0x8e8c
    400f:	e8 49 ec ff ff       	call   2c5d <Printf>
    4014:	83 c4 10             	add    $0x10,%esp
    4017:	90                   	nop
    4018:	c9                   	leave  
    4019:	c3                   	ret    

0000401a <get_partition_table>:
    401a:	55                   	push   %ebp
    401b:	89 e5                	mov    %esp,%ebp
    401d:	53                   	push   %ebx
    401e:	83 ec 24             	sub    $0x24,%esp
    4021:	89 e0                	mov    %esp,%eax
    4023:	89 c3                	mov    %eax,%ebx
    4025:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    4029:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
    402d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4030:	88 45 e3             	mov    %al,-0x1d(%ebp)
    4033:	8b 45 0c             	mov    0xc(%ebp),%eax
    4036:	c1 f8 08             	sar    $0x8,%eax
    4039:	88 45 e4             	mov    %al,-0x1c(%ebp)
    403c:	8b 45 0c             	mov    0xc(%ebp),%eax
    403f:	c1 f8 10             	sar    $0x10,%eax
    4042:	88 45 e5             	mov    %al,-0x1b(%ebp)
    4045:	8b 45 0c             	mov    0xc(%ebp),%eax
    4048:	c1 f8 18             	sar    $0x18,%eax
    404b:	89 c2                	mov    %eax,%edx
    404d:	8b 45 08             	mov    0x8(%ebp),%eax
    4050:	c1 e0 04             	shl    $0x4,%eax
    4053:	09 d0                	or     %edx,%eax
    4055:	83 c8 e0             	or     $0xffffffe0,%eax
    4058:	88 45 e6             	mov    %al,-0x1a(%ebp)
    405b:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
    405f:	83 ec 0c             	sub    $0xc,%esp
    4062:	8d 45 e1             	lea    -0x1f(%ebp),%eax
    4065:	50                   	push   %eax
    4066:	e8 fc fb ff ff       	call   3c67 <hd_cmd_out>
    406b:	83 c4 10             	add    $0x10,%esp
    406e:	e8 79 03 00 00       	call   43ec <interrupt_wait>
    4073:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
    407a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    407d:	8d 50 ff             	lea    -0x1(%eax),%edx
    4080:	89 55 f0             	mov    %edx,-0x10(%ebp)
    4083:	89 c2                	mov    %eax,%edx
    4085:	b8 10 00 00 00       	mov    $0x10,%eax
    408a:	83 e8 01             	sub    $0x1,%eax
    408d:	01 d0                	add    %edx,%eax
    408f:	b9 10 00 00 00       	mov    $0x10,%ecx
    4094:	ba 00 00 00 00       	mov    $0x0,%edx
    4099:	f7 f1                	div    %ecx
    409b:	6b c0 10             	imul   $0x10,%eax,%eax
    409e:	29 c4                	sub    %eax,%esp
    40a0:	89 e0                	mov    %esp,%eax
    40a2:	83 c0 00             	add    $0x0,%eax
    40a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    40a8:	83 ec 04             	sub    $0x4,%esp
    40ab:	ff 75 f4             	pushl  -0xc(%ebp)
    40ae:	6a 00                	push   $0x0
    40b0:	ff 75 ec             	pushl  -0x14(%ebp)
    40b3:	e8 01 51 00 00       	call   91b9 <Memset>
    40b8:	83 c4 10             	add    $0x10,%esp
    40bb:	83 ec 04             	sub    $0x4,%esp
    40be:	ff 75 f4             	pushl  -0xc(%ebp)
    40c1:	ff 75 ec             	pushl  -0x14(%ebp)
    40c4:	68 f0 01 00 00       	push   $0x1f0
    40c9:	e8 3f 51 00 00       	call   920d <read_port>
    40ce:	83 c4 10             	add    $0x10,%esp
    40d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    40d4:	05 be 01 00 00       	add    $0x1be,%eax
    40d9:	83 ec 04             	sub    $0x4,%esp
    40dc:	6a 40                	push   $0x40
    40de:	50                   	push   %eax
    40df:	ff 75 10             	pushl  0x10(%ebp)
    40e2:	e8 a4 50 00 00       	call   918b <Memcpy>
    40e7:	83 c4 10             	add    $0x10,%esp
    40ea:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
    40f1:	89 dc                	mov    %ebx,%esp
    40f3:	90                   	nop
    40f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    40f7:	c9                   	leave  
    40f8:	c3                   	ret    

000040f9 <partition>:
    40f9:	55                   	push   %ebp
    40fa:	89 e5                	mov    %esp,%ebp
    40fc:	81 ec 88 00 00 00    	sub    $0x88,%esp
    4102:	8b 45 0c             	mov    0xc(%ebp),%eax
    4105:	88 45 84             	mov    %al,-0x7c(%ebp)
    4108:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    410c:	7f 19                	jg     4127 <partition+0x2e>
    410e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4111:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4116:	89 c8                	mov    %ecx,%eax
    4118:	f7 ea                	imul   %edx
    411a:	d1 fa                	sar    %edx
    411c:	89 c8                	mov    %ecx,%eax
    411e:	c1 f8 1f             	sar    $0x1f,%eax
    4121:	29 c2                	sub    %eax,%edx
    4123:	89 d0                	mov    %edx,%eax
    4125:	eb 11                	jmp    4138 <partition+0x3f>
    4127:	8b 45 08             	mov    0x8(%ebp),%eax
    412a:	83 e8 10             	sub    $0x10,%eax
    412d:	8d 50 3f             	lea    0x3f(%eax),%edx
    4130:	85 c0                	test   %eax,%eax
    4132:	0f 48 c2             	cmovs  %edx,%eax
    4135:	c1 f8 06             	sar    $0x6,%eax
    4138:	89 45 e8             	mov    %eax,-0x18(%ebp)
    413b:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
    413f:	0f 85 cc 00 00 00    	jne    4211 <partition+0x118>
    4145:	83 ec 04             	sub    $0x4,%esp
    4148:	6a 40                	push   $0x40
    414a:	6a 00                	push   $0x0
    414c:	8d 45 94             	lea    -0x6c(%ebp),%eax
    414f:	50                   	push   %eax
    4150:	e8 64 50 00 00       	call   91b9 <Memset>
    4155:	83 c4 10             	add    $0x10,%esp
    4158:	83 ec 04             	sub    $0x4,%esp
    415b:	8d 45 94             	lea    -0x6c(%ebp),%eax
    415e:	50                   	push   %eax
    415f:	6a 00                	push   $0x0
    4161:	ff 75 e8             	pushl  -0x18(%ebp)
    4164:	e8 b1 fe ff ff       	call   401a <get_partition_table>
    4169:	83 c4 10             	add    $0x10,%esp
    416c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4173:	e9 8a 00 00 00       	jmp    4202 <partition+0x109>
    4178:	8b 45 f4             	mov    -0xc(%ebp),%eax
    417b:	83 c0 01             	add    $0x1,%eax
    417e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4181:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4184:	c1 e0 04             	shl    $0x4,%eax
    4187:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    418a:	01 c8                	add    %ecx,%eax
    418c:	83 e8 5c             	sub    $0x5c,%eax
    418f:	8b 00                	mov    (%eax),%eax
    4191:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4194:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4197:	c1 e1 03             	shl    $0x3,%ecx
    419a:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    41a0:	01 ca                	add    %ecx,%edx
    41a2:	81 c2 04 ff 00 00    	add    $0xff04,%edx
    41a8:	89 02                	mov    %eax,(%edx)
    41aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41ad:	c1 e0 04             	shl    $0x4,%eax
    41b0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    41b3:	01 c8                	add    %ecx,%eax
    41b5:	83 e8 58             	sub    $0x58,%eax
    41b8:	8b 00                	mov    (%eax),%eax
    41ba:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    41bd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    41c0:	c1 e1 03             	shl    $0x3,%ecx
    41c3:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    41c9:	01 ca                	add    %ecx,%edx
    41cb:	81 c2 08 ff 00 00    	add    $0xff08,%edx
    41d1:	89 02                	mov    %eax,(%edx)
    41d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41d6:	c1 e0 04             	shl    $0x4,%eax
    41d9:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    41dc:	01 c8                	add    %ecx,%eax
    41de:	83 e8 60             	sub    $0x60,%eax
    41e1:	0f b6 00             	movzbl (%eax),%eax
    41e4:	3c 05                	cmp    $0x5,%al
    41e6:	75 16                	jne    41fe <partition+0x105>
    41e8:	8b 55 08             	mov    0x8(%ebp),%edx
    41eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41ee:	01 d0                	add    %edx,%eax
    41f0:	83 ec 08             	sub    $0x8,%esp
    41f3:	6a 01                	push   $0x1
    41f5:	50                   	push   %eax
    41f6:	e8 fe fe ff ff       	call   40f9 <partition>
    41fb:	83 c4 10             	add    $0x10,%esp
    41fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4202:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    4206:	0f 8e 6c ff ff ff    	jle    4178 <partition+0x7f>
    420c:	e9 ff 00 00 00       	jmp    4310 <partition+0x217>
    4211:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
    4215:	0f 85 f5 00 00 00    	jne    4310 <partition+0x217>
    421b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    421e:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4223:	89 c8                	mov    %ecx,%eax
    4225:	f7 ea                	imul   %edx
    4227:	d1 fa                	sar    %edx
    4229:	89 c8                	mov    %ecx,%eax
    422b:	c1 f8 1f             	sar    $0x1f,%eax
    422e:	29 c2                	sub    %eax,%edx
    4230:	89 d0                	mov    %edx,%eax
    4232:	c1 e0 02             	shl    $0x2,%eax
    4235:	01 d0                	add    %edx,%eax
    4237:	29 c1                	sub    %eax,%ecx
    4239:	89 c8                	mov    %ecx,%eax
    423b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    423e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4241:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4244:	c1 e2 03             	shl    $0x3,%edx
    4247:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    424d:	01 d0                	add    %edx,%eax
    424f:	05 04 ff 00 00       	add    $0xff04,%eax
    4254:	8b 00                	mov    (%eax),%eax
    4256:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4259:	8b 45 dc             	mov    -0x24(%ebp),%eax
    425c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    425f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4262:	83 e8 01             	sub    $0x1,%eax
    4265:	c1 e0 04             	shl    $0x4,%eax
    4268:	89 45 d8             	mov    %eax,-0x28(%ebp)
    426b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4272:	e9 8c 00 00 00       	jmp    4303 <partition+0x20a>
    4277:	83 ec 04             	sub    $0x4,%esp
    427a:	6a 40                	push   $0x40
    427c:	6a 00                	push   $0x0
    427e:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4281:	50                   	push   %eax
    4282:	e8 32 4f 00 00       	call   91b9 <Memset>
    4287:	83 c4 10             	add    $0x10,%esp
    428a:	83 ec 04             	sub    $0x4,%esp
    428d:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4290:	50                   	push   %eax
    4291:	ff 75 f0             	pushl  -0x10(%ebp)
    4294:	ff 75 e8             	pushl  -0x18(%ebp)
    4297:	e8 7e fd ff ff       	call   401a <get_partition_table>
    429c:	83 c4 10             	add    $0x10,%esp
    429f:	8b 55 d8             	mov    -0x28(%ebp),%edx
    42a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42a5:	01 d0                	add    %edx,%eax
    42a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    42aa:	8b 55 9c             	mov    -0x64(%ebp),%edx
    42ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42b0:	01 c2                	add    %eax,%edx
    42b2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    42b5:	8d 48 04             	lea    0x4(%eax),%ecx
    42b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    42bb:	c1 e1 03             	shl    $0x3,%ecx
    42be:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    42c4:	01 c8                	add    %ecx,%eax
    42c6:	05 04 ff 00 00       	add    $0xff04,%eax
    42cb:	89 10                	mov    %edx,(%eax)
    42cd:	8b 45 a0             	mov    -0x60(%ebp),%eax
    42d0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    42d3:	8d 4a 04             	lea    0x4(%edx),%ecx
    42d6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    42d9:	c1 e1 03             	shl    $0x3,%ecx
    42dc:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    42e2:	01 ca                	add    %ecx,%edx
    42e4:	81 c2 08 ff 00 00    	add    $0xff08,%edx
    42ea:	89 02                	mov    %eax,(%edx)
    42ec:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
    42f0:	84 c0                	test   %al,%al
    42f2:	74 1b                	je     430f <partition+0x216>
    42f4:	8b 55 ac             	mov    -0x54(%ebp),%edx
    42f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    42fa:	01 d0                	add    %edx,%eax
    42fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    42ff:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4303:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
    4307:	0f 8e 6a ff ff ff    	jle    4277 <partition+0x17e>
    430d:	eb 01                	jmp    4310 <partition+0x217>
    430f:	90                   	nop
    4310:	90                   	nop
    4311:	c9                   	leave  
    4312:	c3                   	ret    

00004313 <hd_open>:
    4313:	55                   	push   %ebp
    4314:	89 e5                	mov    %esp,%ebp
    4316:	83 ec 18             	sub    $0x18,%esp
    4319:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4320:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4323:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    4329:	05 00 ff 00 00       	add    $0xff00,%eax
    432e:	8b 00                	mov    (%eax),%eax
    4330:	8d 50 01             	lea    0x1(%eax),%edx
    4333:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4336:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    433c:	05 00 ff 00 00       	add    $0xff00,%eax
    4341:	89 10                	mov    %edx,(%eax)
    4343:	83 ec 0c             	sub    $0xc,%esp
    4346:	6a 00                	push   $0x0
    4348:	e8 1c fa ff ff       	call   3d69 <hd_identify>
    434d:	83 c4 10             	add    $0x10,%esp
    4350:	83 ec 08             	sub    $0x8,%esp
    4353:	6a 00                	push   $0x0
    4355:	6a 00                	push   $0x0
    4357:	e8 9d fd ff ff       	call   40f9 <partition>
    435c:	83 c4 10             	add    $0x10,%esp
    435f:	90                   	nop
    4360:	c9                   	leave  
    4361:	c3                   	ret    

00004362 <get_hd_ioctl>:
    4362:	55                   	push   %ebp
    4363:	89 e5                	mov    %esp,%ebp
    4365:	83 ec 10             	sub    $0x10,%esp
    4368:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    436c:	7f 19                	jg     4387 <get_hd_ioctl+0x25>
    436e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4371:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4376:	89 c8                	mov    %ecx,%eax
    4378:	f7 ea                	imul   %edx
    437a:	d1 fa                	sar    %edx
    437c:	89 c8                	mov    %ecx,%eax
    437e:	c1 f8 1f             	sar    $0x1f,%eax
    4381:	29 c2                	sub    %eax,%edx
    4383:	89 d0                	mov    %edx,%eax
    4385:	eb 11                	jmp    4398 <get_hd_ioctl+0x36>
    4387:	8b 45 08             	mov    0x8(%ebp),%eax
    438a:	83 e8 10             	sub    $0x10,%eax
    438d:	8d 50 3f             	lea    0x3f(%eax),%edx
    4390:	85 c0                	test   %eax,%eax
    4392:	0f 48 c2             	cmovs  %edx,%eax
    4395:	c1 f8 06             	sar    $0x6,%eax
    4398:	89 45 fc             	mov    %eax,-0x4(%ebp)
    439b:	8b 55 08             	mov    0x8(%ebp),%edx
    439e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43a1:	c1 e2 03             	shl    $0x3,%edx
    43a4:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    43aa:	01 d0                	add    %edx,%eax
    43ac:	05 08 ff 00 00       	add    $0xff08,%eax
    43b1:	8b 00                	mov    (%eax),%eax
    43b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    43b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43b9:	c9                   	leave  
    43ba:	c3                   	ret    

000043bb <wait_for>:
    43bb:	55                   	push   %ebp
    43bc:	89 e5                	mov    %esp,%ebp
    43be:	83 ec 08             	sub    $0x8,%esp
    43c1:	83 ec 04             	sub    $0x4,%esp
    43c4:	68 40 42 0f 00       	push   $0xf4240
    43c9:	6a 08                	push   $0x8
    43cb:	6a 08                	push   $0x8
    43cd:	e8 97 02 00 00       	call   4669 <waitfor>
    43d2:	83 c4 10             	add    $0x10,%esp
    43d5:	85 c0                	test   %eax,%eax
    43d7:	75 10                	jne    43e9 <wait_for+0x2e>
    43d9:	83 ec 0c             	sub    $0xc,%esp
    43dc:	68 97 8e 00 00       	push   $0x8e97
    43e1:	e8 a8 eb ff ff       	call   2f8e <panic>
    43e6:	83 c4 10             	add    $0x10,%esp
    43e9:	90                   	nop
    43ea:	c9                   	leave  
    43eb:	c3                   	ret    

000043ec <interrupt_wait>:
    43ec:	55                   	push   %ebp
    43ed:	89 e5                	mov    %esp,%ebp
    43ef:	83 ec 78             	sub    $0x78,%esp
    43f2:	83 ec 04             	sub    $0x4,%esp
    43f5:	68 13 02 00 00       	push   $0x213
    43fa:	8d 45 8c             	lea    -0x74(%ebp),%eax
    43fd:	50                   	push   %eax
    43fe:	6a 02                	push   $0x2
    4400:	e8 13 f4 ff ff       	call   3818 <send_rec>
    4405:	83 c4 10             	add    $0x10,%esp
    4408:	90                   	nop
    4409:	c9                   	leave  
    440a:	c3                   	ret    

0000440b <hd_rdwt>:
    440b:	55                   	push   %ebp
    440c:	89 e5                	mov    %esp,%ebp
    440e:	83 ec 48             	sub    $0x48,%esp
    4411:	8b 45 08             	mov    0x8(%ebp),%eax
    4414:	8b 40 18             	mov    0x18(%eax),%eax
    4417:	89 45 ec             	mov    %eax,-0x14(%ebp)
    441a:	8b 45 08             	mov    0x8(%ebp),%eax
    441d:	8b 40 14             	mov    0x14(%eax),%eax
    4420:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4423:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
    4427:	7f 19                	jg     4442 <hd_rdwt+0x37>
    4429:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    442c:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4431:	89 c8                	mov    %ecx,%eax
    4433:	f7 ea                	imul   %edx
    4435:	d1 fa                	sar    %edx
    4437:	89 c8                	mov    %ecx,%eax
    4439:	c1 f8 1f             	sar    $0x1f,%eax
    443c:	29 c2                	sub    %eax,%edx
    443e:	89 d0                	mov    %edx,%eax
    4440:	eb 11                	jmp    4453 <hd_rdwt+0x48>
    4442:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4445:	83 e8 10             	sub    $0x10,%eax
    4448:	8d 50 3f             	lea    0x3f(%eax),%edx
    444b:	85 c0                	test   %eax,%eax
    444d:	0f 48 c2             	cmovs  %edx,%eax
    4450:	c1 f8 06             	sar    $0x6,%eax
    4453:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4456:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4459:	8d 50 f0             	lea    -0x10(%eax),%edx
    445c:	89 d0                	mov    %edx,%eax
    445e:	c1 f8 1f             	sar    $0x1f,%eax
    4461:	c1 e8 1a             	shr    $0x1a,%eax
    4464:	01 c2                	add    %eax,%edx
    4466:	83 e2 3f             	and    $0x3f,%edx
    4469:	29 c2                	sub    %eax,%edx
    446b:	89 d0                	mov    %edx,%eax
    446d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4470:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4473:	c1 e8 09             	shr    $0x9,%eax
    4476:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4479:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
    447d:	7f 1a                	jg     4499 <hd_rdwt+0x8e>
    447f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4482:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4485:	c1 e2 03             	shl    $0x3,%edx
    4488:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    448e:	01 d0                	add    %edx,%eax
    4490:	05 04 ff 00 00       	add    $0xff04,%eax
    4495:	8b 00                	mov    (%eax),%eax
    4497:	eb 1b                	jmp    44b4 <hd_rdwt+0xa9>
    4499:	8b 45 e0             	mov    -0x20(%ebp),%eax
    449c:	8d 50 04             	lea    0x4(%eax),%edx
    449f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44a2:	c1 e2 03             	shl    $0x3,%edx
    44a5:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    44ab:	01 d0                	add    %edx,%eax
    44ad:	05 04 ff 00 00       	add    $0xff04,%eax
    44b2:	8b 00                	mov    (%eax),%eax
    44b4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    44b7:	01 d0                	add    %edx,%eax
    44b9:	89 45 dc             	mov    %eax,-0x24(%ebp)
    44bc:	8b 45 08             	mov    0x8(%ebp),%eax
    44bf:	8b 40 0c             	mov    0xc(%eax),%eax
    44c2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    44c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    44c8:	05 ff 01 00 00       	add    $0x1ff,%eax
    44cd:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    44d3:	85 c0                	test   %eax,%eax
    44d5:	0f 48 c2             	cmovs  %edx,%eax
    44d8:	c1 f8 09             	sar    $0x9,%eax
    44db:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    44de:	8b 45 d8             	mov    -0x28(%ebp),%eax
    44e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    44e4:	8b 45 08             	mov    0x8(%ebp),%eax
    44e7:	8b 40 10             	mov    0x10(%eax),%eax
    44ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
    44ed:	8b 45 08             	mov    0x8(%ebp),%eax
    44f0:	8b 00                	mov    (%eax),%eax
    44f2:	89 45 cc             	mov    %eax,-0x34(%ebp)
    44f5:	83 ec 08             	sub    $0x8,%esp
    44f8:	ff 75 d0             	pushl  -0x30(%ebp)
    44fb:	ff 75 cc             	pushl  -0x34(%ebp)
    44fe:	e8 08 25 00 00       	call   6a0b <v2l>
    4503:	83 c4 10             	add    $0x10,%esp
    4506:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4509:	8b 45 08             	mov    0x8(%ebp),%eax
    450c:	8b 40 68             	mov    0x68(%eax),%eax
    450f:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4512:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    4516:	74 22                	je     453a <hd_rdwt+0x12f>
    4518:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    451c:	74 1c                	je     453a <hd_rdwt+0x12f>
    451e:	68 9f 01 00 00       	push   $0x19f
    4523:	68 a9 8e 00 00       	push   $0x8ea9
    4528:	68 a9 8e 00 00       	push   $0x8ea9
    452d:	68 b1 8e 00 00       	push   $0x8eb1
    4532:	e8 75 ea ff ff       	call   2fac <assertion_failure>
    4537:	83 c4 10             	add    $0x10,%esp
    453a:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    453e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4541:	88 45 be             	mov    %al,-0x42(%ebp)
    4544:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4547:	88 45 bf             	mov    %al,-0x41(%ebp)
    454a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    454d:	c1 f8 08             	sar    $0x8,%eax
    4550:	88 45 c0             	mov    %al,-0x40(%ebp)
    4553:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4556:	c1 f8 10             	sar    $0x10,%eax
    4559:	88 45 c1             	mov    %al,-0x3f(%ebp)
    455c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    455f:	c1 f8 18             	sar    $0x18,%eax
    4562:	83 e0 0f             	and    $0xf,%eax
    4565:	83 c8 e0             	or     $0xffffffe0,%eax
    4568:	88 45 c2             	mov    %al,-0x3e(%ebp)
    456b:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    456f:	75 07                	jne    4578 <hd_rdwt+0x16d>
    4571:	b8 20 00 00 00       	mov    $0x20,%eax
    4576:	eb 05                	jmp    457d <hd_rdwt+0x172>
    4578:	b8 30 00 00 00       	mov    $0x30,%eax
    457d:	88 45 c3             	mov    %al,-0x3d(%ebp)
    4580:	83 ec 0c             	sub    $0xc,%esp
    4583:	8d 45 bd             	lea    -0x43(%ebp),%eax
    4586:	50                   	push   %eax
    4587:	e8 db f6 ff ff       	call   3c67 <hd_cmd_out>
    458c:	83 c4 10             	add    $0x10,%esp
    458f:	e9 9c 00 00 00       	jmp    4630 <hd_rdwt+0x225>
    4594:	b8 00 02 00 00       	mov    $0x200,%eax
    4599:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
    45a0:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
    45a4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    45a7:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    45ab:	75 51                	jne    45fe <hd_rdwt+0x1f3>
    45ad:	e8 09 fe ff ff       	call   43bb <wait_for>
    45b2:	e8 35 fe ff ff       	call   43ec <interrupt_wait>
    45b7:	83 ec 04             	sub    $0x4,%esp
    45ba:	ff 75 c4             	pushl  -0x3c(%ebp)
    45bd:	6a 00                	push   $0x0
    45bf:	68 40 01 01 00       	push   $0x10140
    45c4:	e8 f0 4b 00 00       	call   91b9 <Memset>
    45c9:	83 c4 10             	add    $0x10,%esp
    45cc:	83 ec 04             	sub    $0x4,%esp
    45cf:	68 00 02 00 00       	push   $0x200
    45d4:	68 40 01 01 00       	push   $0x10140
    45d9:	68 f0 01 00 00       	push   $0x1f0
    45de:	e8 2a 4c 00 00       	call   920d <read_port>
    45e3:	83 c4 10             	add    $0x10,%esp
    45e6:	83 ec 04             	sub    $0x4,%esp
    45e9:	ff 75 c4             	pushl  -0x3c(%ebp)
    45ec:	68 40 01 01 00       	push   $0x10140
    45f1:	ff 75 f0             	pushl  -0x10(%ebp)
    45f4:	e8 92 4b 00 00       	call   918b <Memcpy>
    45f9:	83 c4 10             	add    $0x10,%esp
    45fc:	eb 26                	jmp    4624 <hd_rdwt+0x219>
    45fe:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    4602:	75 20                	jne    4624 <hd_rdwt+0x219>
    4604:	e8 b2 fd ff ff       	call   43bb <wait_for>
    4609:	83 ec 04             	sub    $0x4,%esp
    460c:	ff 75 c4             	pushl  -0x3c(%ebp)
    460f:	ff 75 f0             	pushl  -0x10(%ebp)
    4612:	68 f0 01 00 00       	push   $0x1f0
    4617:	e8 05 4c 00 00       	call   9221 <write_port>
    461c:	83 c4 10             	add    $0x10,%esp
    461f:	e8 c8 fd ff ff       	call   43ec <interrupt_wait>
    4624:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4627:	29 45 f4             	sub    %eax,-0xc(%ebp)
    462a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    462d:	01 45 f0             	add    %eax,-0x10(%ebp)
    4630:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4634:	0f 85 5a ff ff ff    	jne    4594 <hd_rdwt+0x189>
    463a:	90                   	nop
    463b:	c9                   	leave  
    463c:	c3                   	ret    

0000463d <hd_handler>:
    463d:	55                   	push   %ebp
    463e:	89 e5                	mov    %esp,%ebp
    4640:	83 ec 18             	sub    $0x18,%esp
    4643:	83 ec 0c             	sub    $0xc,%esp
    4646:	68 f7 01 00 00       	push   $0x1f7
    464b:	e8 86 cc ff ff       	call   12d6 <in_byte>
    4650:	83 c4 10             	add    $0x10,%esp
    4653:	0f b6 c0             	movzbl %al,%eax
    4656:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4659:	83 ec 0c             	sub    $0xc,%esp
    465c:	6a 02                	push   $0x2
    465e:	e8 eb f3 ff ff       	call   3a4e <inform_int>
    4663:	83 c4 10             	add    $0x10,%esp
    4666:	90                   	nop
    4667:	c9                   	leave  
    4668:	c3                   	ret    

00004669 <waitfor>:
    4669:	55                   	push   %ebp
    466a:	89 e5                	mov    %esp,%ebp
    466c:	83 ec 18             	sub    $0x18,%esp
    466f:	e8 d3 f2 ff ff       	call   3947 <get_ticks_ipc>
    4674:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4677:	eb 22                	jmp    469b <waitfor+0x32>
    4679:	83 ec 0c             	sub    $0xc,%esp
    467c:	68 f7 01 00 00       	push   $0x1f7
    4681:	e8 50 cc ff ff       	call   12d6 <in_byte>
    4686:	83 c4 10             	add    $0x10,%esp
    4689:	0f b6 c0             	movzbl %al,%eax
    468c:	23 45 08             	and    0x8(%ebp),%eax
    468f:	39 45 0c             	cmp    %eax,0xc(%ebp)
    4692:	75 07                	jne    469b <waitfor+0x32>
    4694:	b8 01 00 00 00       	mov    $0x1,%eax
    4699:	eb 1d                	jmp    46b8 <waitfor+0x4f>
    469b:	e8 a7 f2 ff ff       	call   3947 <get_ticks_ipc>
    46a0:	2b 45 f4             	sub    -0xc(%ebp),%eax
    46a3:	89 c2                	mov    %eax,%edx
    46a5:	89 d0                	mov    %edx,%eax
    46a7:	c1 e0 02             	shl    $0x2,%eax
    46aa:	01 d0                	add    %edx,%eax
    46ac:	01 c0                	add    %eax,%eax
    46ae:	39 45 10             	cmp    %eax,0x10(%ebp)
    46b1:	7f c6                	jg     4679 <waitfor+0x10>
    46b3:	b8 00 00 00 00       	mov    $0x0,%eax
    46b8:	c9                   	leave  
    46b9:	c3                   	ret    

000046ba <print_hd_info>:
    46ba:	55                   	push   %ebp
    46bb:	89 e5                	mov    %esp,%ebp
    46bd:	83 ec 18             	sub    $0x18,%esp
    46c0:	83 ec 0c             	sub    $0xc,%esp
    46c3:	68 cf 8e 00 00       	push   $0x8ecf
    46c8:	e8 90 e5 ff ff       	call   2c5d <Printf>
    46cd:	83 c4 10             	add    $0x10,%esp
    46d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    46d7:	eb 3b                	jmp    4714 <print_hd_info+0x5a>
    46d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46dc:	8b 04 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%eax
    46e3:	85 c0                	test   %eax,%eax
    46e5:	74 28                	je     470f <print_hd_info+0x55>
    46e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46ea:	8b 14 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%edx
    46f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46f4:	8b 04 c5 04 ff 00 00 	mov    0xff04(,%eax,8),%eax
    46fb:	ff 75 f4             	pushl  -0xc(%ebp)
    46fe:	52                   	push   %edx
    46ff:	50                   	push   %eax
    4700:	68 ec 8e 00 00       	push   $0x8eec
    4705:	e8 53 e5 ff ff       	call   2c5d <Printf>
    470a:	83 c4 10             	add    $0x10,%esp
    470d:	eb 01                	jmp    4710 <print_hd_info+0x56>
    470f:	90                   	nop
    4710:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4714:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    4718:	7e bf                	jle    46d9 <print_hd_info+0x1f>
    471a:	83 ec 0c             	sub    $0xc,%esp
    471d:	68 04 8f 00 00       	push   $0x8f04
    4722:	e8 36 e5 ff ff       	call   2c5d <Printf>
    4727:	83 c4 10             	add    $0x10,%esp
    472a:	83 ec 0c             	sub    $0xc,%esp
    472d:	68 1f 8f 00 00       	push   $0x8f1f
    4732:	e8 26 e5 ff ff       	call   2c5d <Printf>
    4737:	83 c4 10             	add    $0x10,%esp
    473a:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
    4741:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4748:	eb 44                	jmp    478e <print_hd_info+0xd4>
    474a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    474d:	83 c0 04             	add    $0x4,%eax
    4750:	8b 04 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%eax
    4757:	85 c0                	test   %eax,%eax
    4759:	74 2e                	je     4789 <print_hd_info+0xcf>
    475b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    475e:	83 c0 04             	add    $0x4,%eax
    4761:	8b 14 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%edx
    4768:	8b 45 f0             	mov    -0x10(%ebp),%eax
    476b:	83 c0 04             	add    $0x4,%eax
    476e:	8b 04 c5 04 ff 00 00 	mov    0xff04(,%eax,8),%eax
    4775:	ff 75 f0             	pushl  -0x10(%ebp)
    4778:	52                   	push   %edx
    4779:	50                   	push   %eax
    477a:	68 ec 8e 00 00       	push   $0x8eec
    477f:	e8 d9 e4 ff ff       	call   2c5d <Printf>
    4784:	83 c4 10             	add    $0x10,%esp
    4787:	eb 01                	jmp    478a <print_hd_info+0xd0>
    4789:	90                   	nop
    478a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    478e:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    4792:	7e b6                	jle    474a <print_hd_info+0x90>
    4794:	83 ec 0c             	sub    $0xc,%esp
    4797:	68 3c 8f 00 00       	push   $0x8f3c
    479c:	e8 bc e4 ff ff       	call   2c5d <Printf>
    47a1:	83 c4 10             	add    $0x10,%esp
    47a4:	90                   	nop
    47a5:	c9                   	leave  
    47a6:	c3                   	ret    

000047a7 <is_empty>:
    47a7:	55                   	push   %ebp
    47a8:	89 e5                	mov    %esp,%ebp
    47aa:	83 ec 10             	sub    $0x10,%esp
    47ad:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    47b4:	eb 1a                	jmp    47d0 <is_empty+0x29>
    47b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
    47b9:	8b 45 08             	mov    0x8(%ebp),%eax
    47bc:	01 d0                	add    %edx,%eax
    47be:	0f b6 00             	movzbl (%eax),%eax
    47c1:	84 c0                	test   %al,%al
    47c3:	74 07                	je     47cc <is_empty+0x25>
    47c5:	b8 00 00 00 00       	mov    $0x0,%eax
    47ca:	eb 11                	jmp    47dd <is_empty+0x36>
    47cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    47d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    47d3:	3b 45 0c             	cmp    0xc(%ebp),%eax
    47d6:	7c de                	jl     47b6 <is_empty+0xf>
    47d8:	b8 01 00 00 00       	mov    $0x1,%eax
    47dd:	c9                   	leave  
    47de:	c3                   	ret    
    47df:	90                   	nop

000047e0 <get_ticks>:
    47e0:	b8 00 00 00 00       	mov    $0x0,%eax
    47e5:	cd 90                	int    $0x90
    47e7:	c3                   	ret    

000047e8 <write2>:
    47e8:	b8 01 00 00 00       	mov    $0x1,%eax
    47ed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    47f1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    47f5:	cd 90                	int    $0x90
    47f7:	c3                   	ret    

000047f8 <write_debug>:
    47f8:	b8 02 00 00 00       	mov    $0x2,%eax
    47fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4801:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4805:	cd 90                	int    $0x90
    4807:	c3                   	ret    

00004808 <send_msg2>:
    4808:	b8 03 00 00 00       	mov    $0x3,%eax
    480d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4811:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4815:	cd 90                	int    $0x90
    4817:	c3                   	ret    

00004818 <send_msg>:
    4818:	55                   	push   %ebp
    4819:	89 e5                	mov    %esp,%ebp
    481b:	53                   	push   %ebx
    481c:	51                   	push   %ecx
    481d:	b8 03 00 00 00       	mov    $0x3,%eax
    4822:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    4825:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4828:	cd 90                	int    $0x90
    482a:	59                   	pop    %ecx
    482b:	5b                   	pop    %ebx
    482c:	5d                   	pop    %ebp
    482d:	c3                   	ret    

0000482e <receive_msg2>:
    482e:	b8 04 00 00 00       	mov    $0x4,%eax
    4833:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4837:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    483b:	cd 90                	int    $0x90
    483d:	c3                   	ret    

0000483e <receive_msg>:
    483e:	55                   	push   %ebp
    483f:	89 e5                	mov    %esp,%ebp
    4841:	53                   	push   %ebx
    4842:	51                   	push   %ecx
    4843:	b8 04 00 00 00       	mov    $0x4,%eax
    4848:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    484b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    484e:	cd 90                	int    $0x90
    4850:	59                   	pop    %ecx
    4851:	5b                   	pop    %ebx
    4852:	5d                   	pop    %ebp
    4853:	c3                   	ret    

00004854 <task_fs>:
    4854:	55                   	push   %ebp
    4855:	89 e5                	mov    %esp,%ebp
    4857:	81 ec 08 01 00 00    	sub    $0x108,%esp
    485d:	e8 91 07 00 00       	call   4ff3 <init_fs>
    4862:	83 ec 04             	sub    $0x4,%esp
    4865:	6a 6c                	push   $0x6c
    4867:	6a 00                	push   $0x0
    4869:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    486f:	50                   	push   %eax
    4870:	e8 44 49 00 00       	call   91b9 <Memset>
    4875:	83 c4 10             	add    $0x10,%esp
    4878:	83 ec 04             	sub    $0x4,%esp
    487b:	6a 11                	push   $0x11
    487d:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    4883:	50                   	push   %eax
    4884:	6a 02                	push   $0x2
    4886:	e8 8d ef ff ff       	call   3818 <send_rec>
    488b:	83 c4 10             	add    $0x10,%esp
    488e:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    4894:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4897:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
    489d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    48a0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
    48a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    48a9:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
    48af:	89 45 e0             	mov    %eax,-0x20(%ebp)
    48b2:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
    48b8:	85 c0                	test   %eax,%eax
    48ba:	75 07                	jne    48c3 <task_fs+0x6f>
    48bc:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
    48c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    48c6:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    48cc:	05 80 11 08 00       	add    $0x81180,%eax
    48d1:	a3 64 db 00 00       	mov    %eax,0xdb64
    48d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    48dd:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
    48e1:	74 1c                	je     48ff <task_fs+0xab>
    48e3:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
    48e7:	7f 08                	jg     48f1 <task_fs+0x9d>
    48e9:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    48ed:	74 3e                	je     492d <task_fs+0xd9>
    48ef:	eb 4b                	jmp    493c <task_fs+0xe8>
    48f1:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
    48f5:	74 1f                	je     4916 <task_fs+0xc2>
    48f7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
    48fb:	74 19                	je     4916 <task_fs+0xc2>
    48fd:	eb 3d                	jmp    493c <task_fs+0xe8>
    48ff:	83 ec 0c             	sub    $0xc,%esp
    4902:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    4908:	50                   	push   %eax
    4909:	e8 14 07 00 00       	call   5022 <do_open>
    490e:	83 c4 10             	add    $0x10,%esp
    4911:	89 45 b0             	mov    %eax,-0x50(%ebp)
    4914:	eb 26                	jmp    493c <task_fs+0xe8>
    4916:	83 ec 0c             	sub    $0xc,%esp
    4919:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    491f:	50                   	push   %eax
    4920:	e8 3b 18 00 00       	call   6160 <do_rdwt>
    4925:	83 c4 10             	add    $0x10,%esp
    4928:	89 45 f4             	mov    %eax,-0xc(%ebp)
    492b:	eb 0f                	jmp    493c <task_fs+0xe8>
    492d:	83 ec 0c             	sub    $0xc,%esp
    4930:	ff 75 e4             	pushl  -0x1c(%ebp)
    4933:	e8 2a 1d 00 00       	call   6662 <do_close>
    4938:	83 c4 10             	add    $0x10,%esp
    493b:	90                   	nop
    493c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    4942:	83 f8 67             	cmp    $0x67,%eax
    4945:	74 36                	je     497d <task_fs+0x129>
    4947:	8b 45 e8             	mov    -0x18(%ebp),%eax
    494a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    494d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
    4951:	75 06                	jne    4959 <task_fs+0x105>
    4953:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4956:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4959:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
    4960:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4963:	89 45 c0             	mov    %eax,-0x40(%ebp)
    4966:	83 ec 04             	sub    $0x4,%esp
    4969:	ff 75 f0             	pushl  -0x10(%ebp)
    496c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    4972:	50                   	push   %eax
    4973:	6a 01                	push   $0x1
    4975:	e8 9e ee ff ff       	call   3818 <send_rec>
    497a:	83 c4 10             	add    $0x10,%esp
    497d:	a1 20 d7 00 00       	mov    0xd720,%eax
    4982:	83 c0 01             	add    $0x1,%eax
    4985:	a3 20 d7 00 00       	mov    %eax,0xd720
    498a:	e9 d3 fe ff ff       	jmp    4862 <task_fs+0xe>

0000498f <rd_wt>:
    498f:	55                   	push   %ebp
    4990:	89 e5                	mov    %esp,%ebp
    4992:	83 ec 78             	sub    $0x78,%esp
    4995:	83 ec 04             	sub    $0x4,%esp
    4998:	6a 6c                	push   $0x6c
    499a:	6a 00                	push   $0x0
    499c:	8d 45 8c             	lea    -0x74(%ebp),%eax
    499f:	50                   	push   %eax
    49a0:	e8 14 48 00 00       	call   91b9 <Memset>
    49a5:	83 c4 10             	add    $0x10,%esp
    49a8:	8b 45 18             	mov    0x18(%ebp),%eax
    49ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
    49ae:	8b 45 0c             	mov    0xc(%ebp),%eax
    49b1:	89 45 a0             	mov    %eax,-0x60(%ebp)
    49b4:	8b 45 10             	mov    0x10(%ebp),%eax
    49b7:	89 45 9c             	mov    %eax,-0x64(%ebp)
    49ba:	8b 45 14             	mov    0x14(%ebp),%eax
    49bd:	89 45 98             	mov    %eax,-0x68(%ebp)
    49c0:	8b 45 08             	mov    0x8(%ebp),%eax
    49c3:	c1 e0 09             	shl    $0x9,%eax
    49c6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    49c9:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
    49cd:	74 22                	je     49f1 <rd_wt+0x62>
    49cf:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
    49d3:	74 1c                	je     49f1 <rd_wt+0x62>
    49d5:	68 d1 00 00 00       	push   $0xd1
    49da:	68 5c 8f 00 00       	push   $0x8f5c
    49df:	68 5c 8f 00 00       	push   $0x8f5c
    49e4:	68 69 8f 00 00       	push   $0x8f69
    49e9:	e8 be e5 ff ff       	call   2fac <assertion_failure>
    49ee:	83 c4 10             	add    $0x10,%esp
    49f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    49f4:	83 f8 07             	cmp    $0x7,%eax
    49f7:	74 24                	je     4a1d <rd_wt+0x8e>
    49f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    49fc:	83 f8 0a             	cmp    $0xa,%eax
    49ff:	74 1c                	je     4a1d <rd_wt+0x8e>
    4a01:	68 d2 00 00 00       	push   $0xd2
    4a06:	68 5c 8f 00 00       	push   $0x8f5c
    4a0b:	68 5c 8f 00 00       	push   $0x8f5c
    4a10:	68 88 8f 00 00       	push   $0x8f88
    4a15:	e8 92 e5 ff ff       	call   2fac <assertion_failure>
    4a1a:	83 c4 10             	add    $0x10,%esp
    4a1d:	83 ec 04             	sub    $0x4,%esp
    4a20:	6a 02                	push   $0x2
    4a22:	8d 45 8c             	lea    -0x74(%ebp),%eax
    4a25:	50                   	push   %eax
    4a26:	6a 03                	push   $0x3
    4a28:	e8 eb ed ff ff       	call   3818 <send_rec>
    4a2d:	83 c4 10             	add    $0x10,%esp
    4a30:	90                   	nop
    4a31:	c9                   	leave  
    4a32:	c3                   	ret    

00004a33 <mkfs>:
    4a33:	55                   	push   %ebp
    4a34:	89 e5                	mov    %esp,%ebp
    4a36:	57                   	push   %edi
    4a37:	81 ec d4 00 00 00    	sub    $0xd4,%esp
    4a3d:	a1 20 c0 00 00       	mov    0xc020,%eax
    4a42:	83 ec 04             	sub    $0x4,%esp
    4a45:	68 00 02 00 00       	push   $0x200
    4a4a:	6a 00                	push   $0x0
    4a4c:	50                   	push   %eax
    4a4d:	e8 67 47 00 00       	call   91b9 <Memset>
    4a52:	83 c4 10             	add    $0x10,%esp
    4a55:	a1 20 c0 00 00       	mov    0xc020,%eax
    4a5a:	83 ec 0c             	sub    $0xc,%esp
    4a5d:	6a 0a                	push   $0xa
    4a5f:	68 00 02 00 00       	push   $0x200
    4a64:	50                   	push   %eax
    4a65:	6a 20                	push   $0x20
    4a67:	6a 00                	push   $0x0
    4a69:	e8 21 ff ff ff       	call   498f <rd_wt>
    4a6e:	83 c4 20             	add    $0x20,%esp
    4a71:	a1 20 c0 00 00       	mov    0xc020,%eax
    4a76:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4a79:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a7c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    4a83:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a86:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
    4a8d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a90:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
    4a97:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a9a:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
    4aa1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4aa4:	8b 40 04             	mov    0x4(%eax),%eax
    4aa7:	8d 50 02             	lea    0x2(%eax),%edx
    4aaa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4aad:	8b 40 08             	mov    0x8(%eax),%eax
    4ab0:	01 c2                	add    %eax,%edx
    4ab2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4ab5:	8b 40 0c             	mov    0xc(%eax),%eax
    4ab8:	01 c2                	add    %eax,%edx
    4aba:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4abd:	89 10                	mov    %edx,(%eax)
    4abf:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    4ac6:	b8 00 02 00 00       	mov    $0x200,%eax
    4acb:	2b 45 d8             	sub    -0x28(%ebp),%eax
    4ace:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    4ad4:	8b 55 d8             	mov    -0x28(%ebp),%edx
    4ad7:	01 ca                	add    %ecx,%edx
    4ad9:	83 ec 04             	sub    $0x4,%esp
    4adc:	50                   	push   %eax
    4add:	6a 80                	push   $0xffffff80
    4adf:	52                   	push   %edx
    4ae0:	e8 d4 46 00 00       	call   91b9 <Memset>
    4ae5:	83 c4 10             	add    $0x10,%esp
    4ae8:	a1 20 c0 00 00       	mov    0xc020,%eax
    4aed:	83 ec 0c             	sub    $0xc,%esp
    4af0:	6a 0a                	push   $0xa
    4af2:	68 00 02 00 00       	push   $0x200
    4af7:	50                   	push   %eax
    4af8:	6a 20                	push   $0x20
    4afa:	6a 01                	push   $0x1
    4afc:	e8 8e fe ff ff       	call   498f <rd_wt>
    4b01:	83 c4 20             	add    $0x20,%esp
    4b04:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4b07:	8b 10                	mov    (%eax),%edx
    4b09:	89 55 98             	mov    %edx,-0x68(%ebp)
    4b0c:	8b 50 04             	mov    0x4(%eax),%edx
    4b0f:	89 55 9c             	mov    %edx,-0x64(%ebp)
    4b12:	8b 50 08             	mov    0x8(%eax),%edx
    4b15:	89 55 a0             	mov    %edx,-0x60(%ebp)
    4b18:	8b 50 0c             	mov    0xc(%eax),%edx
    4b1b:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    4b1e:	8b 50 10             	mov    0x10(%eax),%edx
    4b21:	89 55 a8             	mov    %edx,-0x58(%ebp)
    4b24:	8b 50 14             	mov    0x14(%eax),%edx
    4b27:	89 55 ac             	mov    %edx,-0x54(%ebp)
    4b2a:	8b 50 18             	mov    0x18(%eax),%edx
    4b2d:	89 55 b0             	mov    %edx,-0x50(%ebp)
    4b30:	8b 50 1c             	mov    0x1c(%eax),%edx
    4b33:	89 55 b4             	mov    %edx,-0x4c(%ebp)
    4b36:	8b 40 20             	mov    0x20(%eax),%eax
    4b39:	89 45 b8             	mov    %eax,-0x48(%ebp)
    4b3c:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
    4b40:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
    4b44:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b49:	83 ec 04             	sub    $0x4,%esp
    4b4c:	6a 01                	push   $0x1
    4b4e:	52                   	push   %edx
    4b4f:	50                   	push   %eax
    4b50:	e8 64 46 00 00       	call   91b9 <Memset>
    4b55:	83 c4 10             	add    $0x10,%esp
    4b58:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b5d:	83 c0 01             	add    $0x1,%eax
    4b60:	83 ec 04             	sub    $0x4,%esp
    4b63:	68 ff 01 00 00       	push   $0x1ff
    4b68:	6a 80                	push   $0xffffff80
    4b6a:	50                   	push   %eax
    4b6b:	e8 49 46 00 00       	call   91b9 <Memset>
    4b70:	83 c4 10             	add    $0x10,%esp
    4b73:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b78:	83 ec 0c             	sub    $0xc,%esp
    4b7b:	6a 0a                	push   $0xa
    4b7d:	68 00 02 00 00       	push   $0x200
    4b82:	50                   	push   %eax
    4b83:	6a 20                	push   $0x20
    4b85:	6a 02                	push   $0x2
    4b87:	e8 03 fe ff ff       	call   498f <rd_wt>
    4b8c:	83 c4 20             	add    $0x20,%esp
    4b8f:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
    4b96:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b9b:	83 ec 04             	sub    $0x4,%esp
    4b9e:	68 00 02 00 00       	push   $0x200
    4ba3:	6a ff                	push   $0xffffffff
    4ba5:	50                   	push   %eax
    4ba6:	e8 0e 46 00 00       	call   91b9 <Memset>
    4bab:	83 c4 10             	add    $0x10,%esp
    4bae:	a1 20 c0 00 00       	mov    0xc020,%eax
    4bb3:	83 ec 0c             	sub    $0xc,%esp
    4bb6:	6a 0a                	push   $0xa
    4bb8:	68 00 02 00 00       	push   $0x200
    4bbd:	50                   	push   %eax
    4bbe:	6a 20                	push   $0x20
    4bc0:	ff 75 d0             	pushl  -0x30(%ebp)
    4bc3:	e8 c7 fd ff ff       	call   498f <rd_wt>
    4bc8:	83 c4 20             	add    $0x20,%esp
    4bcb:	a1 20 c0 00 00       	mov    0xc020,%eax
    4bd0:	83 ec 04             	sub    $0x4,%esp
    4bd3:	6a 01                	push   $0x1
    4bd5:	6a 01                	push   $0x1
    4bd7:	50                   	push   %eax
    4bd8:	e8 dc 45 00 00       	call   91b9 <Memset>
    4bdd:	83 c4 10             	add    $0x10,%esp
    4be0:	a1 20 c0 00 00       	mov    0xc020,%eax
    4be5:	83 c0 01             	add    $0x1,%eax
    4be8:	83 ec 04             	sub    $0x4,%esp
    4beb:	68 ff 01 00 00       	push   $0x1ff
    4bf0:	6a 00                	push   $0x0
    4bf2:	50                   	push   %eax
    4bf3:	e8 c1 45 00 00       	call   91b9 <Memset>
    4bf8:	83 c4 10             	add    $0x10,%esp
    4bfb:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c00:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4c03:	83 c2 01             	add    $0x1,%edx
    4c06:	83 ec 0c             	sub    $0xc,%esp
    4c09:	6a 0a                	push   $0xa
    4c0b:	68 00 02 00 00       	push   $0x200
    4c10:	50                   	push   %eax
    4c11:	6a 20                	push   $0x20
    4c13:	52                   	push   %edx
    4c14:	e8 76 fd ff ff       	call   498f <rd_wt>
    4c19:	83 c4 20             	add    $0x20,%esp
    4c1c:	8b 45 a0             	mov    -0x60(%ebp),%eax
    4c1f:	83 e8 02             	sub    $0x2,%eax
    4c22:	89 45 cc             	mov    %eax,-0x34(%ebp)
    4c25:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
    4c2c:	eb 3f                	jmp    4c6d <mkfs+0x23a>
    4c2e:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c33:	83 ec 04             	sub    $0x4,%esp
    4c36:	68 00 02 00 00       	push   $0x200
    4c3b:	6a 00                	push   $0x0
    4c3d:	50                   	push   %eax
    4c3e:	e8 76 45 00 00       	call   91b9 <Memset>
    4c43:	83 c4 10             	add    $0x10,%esp
    4c46:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c4b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    4c4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4c51:	01 ca                	add    %ecx,%edx
    4c53:	83 ec 0c             	sub    $0xc,%esp
    4c56:	6a 0a                	push   $0xa
    4c58:	68 00 02 00 00       	push   $0x200
    4c5d:	50                   	push   %eax
    4c5e:	6a 20                	push   $0x20
    4c60:	52                   	push   %edx
    4c61:	e8 29 fd ff ff       	call   498f <rd_wt>
    4c66:	83 c4 20             	add    $0x20,%esp
    4c69:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4c6d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4c70:	83 c0 01             	add    $0x1,%eax
    4c73:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4c76:	7e b6                	jle    4c2e <mkfs+0x1fb>
    4c78:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c7d:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4c80:	83 c2 03             	add    $0x3,%edx
    4c83:	83 ec 0c             	sub    $0xc,%esp
    4c86:	6a 0a                	push   $0xa
    4c88:	68 00 02 00 00       	push   $0x200
    4c8d:	50                   	push   %eax
    4c8e:	6a 20                	push   $0x20
    4c90:	52                   	push   %edx
    4c91:	e8 f9 fc ff ff       	call   498f <rd_wt>
    4c96:	83 c4 20             	add    $0x20,%esp
    4c99:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c9e:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4ca1:	83 c2 03             	add    $0x3,%edx
    4ca4:	83 ec 0c             	sub    $0xc,%esp
    4ca7:	6a 07                	push   $0x7
    4ca9:	68 00 02 00 00       	push   $0x200
    4cae:	50                   	push   %eax
    4caf:	6a 20                	push   $0x20
    4cb1:	52                   	push   %edx
    4cb2:	e8 d8 fc ff ff       	call   498f <rd_wt>
    4cb7:	83 c4 20             	add    $0x20,%esp
    4cba:	a1 20 c0 00 00       	mov    0xc020,%eax
    4cbf:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4cc2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cc5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    4ccb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cce:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
    4cd5:	8b 55 98             	mov    -0x68(%ebp),%edx
    4cd8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cdb:	89 50 08             	mov    %edx,0x8(%eax)
    4cde:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4ce1:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4ce8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4ceb:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
    4cf2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cf5:	8b 10                	mov    (%eax),%edx
    4cf7:	89 15 40 11 01 00    	mov    %edx,0x11140
    4cfd:	8b 50 04             	mov    0x4(%eax),%edx
    4d00:	89 15 44 11 01 00    	mov    %edx,0x11144
    4d06:	8b 50 08             	mov    0x8(%eax),%edx
    4d09:	89 15 48 11 01 00    	mov    %edx,0x11148
    4d0f:	8b 50 0c             	mov    0xc(%eax),%edx
    4d12:	89 15 4c 11 01 00    	mov    %edx,0x1114c
    4d18:	8b 50 10             	mov    0x10(%eax),%edx
    4d1b:	89 15 50 11 01 00    	mov    %edx,0x11150
    4d21:	8b 50 14             	mov    0x14(%eax),%edx
    4d24:	89 15 54 11 01 00    	mov    %edx,0x11154
    4d2a:	8b 50 18             	mov    0x18(%eax),%edx
    4d2d:	89 15 58 11 01 00    	mov    %edx,0x11158
    4d33:	8b 50 1c             	mov    0x1c(%eax),%edx
    4d36:	89 15 5c 11 01 00    	mov    %edx,0x1115c
    4d3c:	8b 50 20             	mov    0x20(%eax),%edx
    4d3f:	89 15 60 11 01 00    	mov    %edx,0x11160
    4d45:	8b 40 24             	mov    0x24(%eax),%eax
    4d48:	a3 64 11 01 00       	mov    %eax,0x11164
    4d4d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4d54:	eb 4c                	jmp    4da2 <mkfs+0x36f>
    4d56:	a1 20 c0 00 00       	mov    0xc020,%eax
    4d5b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4d5e:	83 c2 01             	add    $0x1,%edx
    4d61:	c1 e2 05             	shl    $0x5,%edx
    4d64:	01 d0                	add    %edx,%eax
    4d66:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4d69:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d6c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    4d72:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d75:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    4d7c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d7f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    4d86:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    4d8d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4d90:	c1 e0 08             	shl    $0x8,%eax
    4d93:	0b 45 f0             	or     -0x10(%ebp),%eax
    4d96:	89 c2                	mov    %eax,%edx
    4d98:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d9b:	89 50 08             	mov    %edx,0x8(%eax)
    4d9e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4da2:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    4da6:	7e ae                	jle    4d56 <mkfs+0x323>
    4da8:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    4daf:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
    4db5:	b8 00 00 00 00       	mov    $0x0,%eax
    4dba:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4dbf:	89 d7                	mov    %edx,%edi
    4dc1:	f3 ab                	rep stos %eax,%es:(%edi)
    4dc3:	c7 85 70 ff ff ff ae 	movl   $0x8fae,-0x90(%ebp)
    4dca:	8f 00 00 
    4dcd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4dd4:	eb 54                	jmp    4e2a <mkfs+0x3f7>
    4dd6:	a1 20 c0 00 00       	mov    0xc020,%eax
    4ddb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4dde:	83 c2 04             	add    $0x4,%edx
    4de1:	c1 e2 05             	shl    $0x5,%edx
    4de4:	01 d0                	add    %edx,%eax
    4de6:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4de9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4dec:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    4df2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4df5:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
    4dfc:	8b 45 98             	mov    -0x68(%ebp),%eax
    4dff:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4e02:	83 c2 01             	add    $0x1,%edx
    4e05:	c1 e2 0b             	shl    $0xb,%edx
    4e08:	01 c2                	add    %eax,%edx
    4e0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e0d:	89 50 08             	mov    %edx,0x8(%eax)
    4e10:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e13:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4e1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4e1d:	8d 50 05             	lea    0x5(%eax),%edx
    4e20:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e23:	89 50 10             	mov    %edx,0x10(%eax)
    4e26:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4e2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4e2d:	3b 45 c0             	cmp    -0x40(%ebp),%eax
    4e30:	7c a4                	jl     4dd6 <mkfs+0x3a3>
    4e32:	a1 20 c0 00 00       	mov    0xc020,%eax
    4e37:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4e3a:	83 c2 03             	add    $0x3,%edx
    4e3d:	83 ec 0c             	sub    $0xc,%esp
    4e40:	6a 0a                	push   $0xa
    4e42:	68 00 02 00 00       	push   $0x200
    4e47:	50                   	push   %eax
    4e48:	6a 20                	push   $0x20
    4e4a:	52                   	push   %edx
    4e4b:	e8 3f fb ff ff       	call   498f <rd_wt>
    4e50:	83 c4 20             	add    $0x20,%esp
    4e53:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    4e59:	8b 45 98             	mov    -0x68(%ebp),%eax
    4e5c:	83 ec 0c             	sub    $0xc,%esp
    4e5f:	6a 07                	push   $0x7
    4e61:	68 00 02 00 00       	push   $0x200
    4e66:	52                   	push   %edx
    4e67:	6a 20                	push   $0x20
    4e69:	50                   	push   %eax
    4e6a:	e8 20 fb ff ff       	call   498f <rd_wt>
    4e6f:	83 c4 20             	add    $0x20,%esp
    4e72:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
    4e79:	00 00 00 
    4e7c:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
    4e83:	2e 00 
    4e85:	a1 20 c0 00 00       	mov    0xc020,%eax
    4e8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4e8d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e90:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    4e96:	83 ec 0c             	sub    $0xc,%esp
    4e99:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
    4e9f:	50                   	push   %eax
    4ea0:	e8 4d 43 00 00       	call   91f2 <Strlen>
    4ea5:	83 c4 10             	add    $0x10,%esp
    4ea8:	89 c1                	mov    %eax,%ecx
    4eaa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4ead:	8d 50 04             	lea    0x4(%eax),%edx
    4eb0:	83 ec 04             	sub    $0x4,%esp
    4eb3:	51                   	push   %ecx
    4eb4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
    4eba:	50                   	push   %eax
    4ebb:	52                   	push   %edx
    4ebc:	e8 ca 42 00 00       	call   918b <Memcpy>
    4ec1:	83 c4 10             	add    $0x10,%esp
    4ec4:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
    4eca:	b8 00 00 00 00       	mov    $0x0,%eax
    4ecf:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4ed4:	89 d7                	mov    %edx,%edi
    4ed6:	f3 ab                	rep stos %eax,%es:(%edi)
    4ed8:	c7 85 34 ff ff ff ba 	movl   $0x8fba,-0xcc(%ebp)
    4edf:	8f 00 00 
    4ee2:	c7 85 38 ff ff ff c3 	movl   $0x8fc3,-0xc8(%ebp)
    4ee9:	8f 00 00 
    4eec:	c7 85 3c ff ff ff cc 	movl   $0x8fcc,-0xc4(%ebp)
    4ef3:	8f 00 00 
    4ef6:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
    4efd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4f04:	eb 49                	jmp    4f4f <mkfs+0x51c>
    4f06:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
    4f0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f0d:	8d 50 02             	lea    0x2(%eax),%edx
    4f10:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f13:	89 10                	mov    %edx,(%eax)
    4f15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f18:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
    4f1f:	83 ec 0c             	sub    $0xc,%esp
    4f22:	50                   	push   %eax
    4f23:	e8 ca 42 00 00       	call   91f2 <Strlen>
    4f28:	83 c4 10             	add    $0x10,%esp
    4f2b:	89 c1                	mov    %eax,%ecx
    4f2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f30:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
    4f37:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4f3a:	83 c2 04             	add    $0x4,%edx
    4f3d:	83 ec 04             	sub    $0x4,%esp
    4f40:	51                   	push   %ecx
    4f41:	50                   	push   %eax
    4f42:	52                   	push   %edx
    4f43:	e8 43 42 00 00       	call   918b <Memcpy>
    4f48:	83 c4 10             	add    $0x10,%esp
    4f4b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4f4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f52:	3b 45 bc             	cmp    -0x44(%ebp),%eax
    4f55:	7c af                	jl     4f06 <mkfs+0x4d3>
    4f57:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    4f5e:	eb 66                	jmp    4fc6 <mkfs+0x593>
    4f60:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4f63:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4f6a:	83 ec 0c             	sub    $0xc,%esp
    4f6d:	50                   	push   %eax
    4f6e:	e8 7f 42 00 00       	call   91f2 <Strlen>
    4f73:	83 c4 10             	add    $0x10,%esp
    4f76:	85 c0                	test   %eax,%eax
    4f78:	74 47                	je     4fc1 <mkfs+0x58e>
    4f7a:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
    4f7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4f81:	8d 50 05             	lea    0x5(%eax),%edx
    4f84:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f87:	89 10                	mov    %edx,(%eax)
    4f89:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4f8c:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4f93:	83 ec 0c             	sub    $0xc,%esp
    4f96:	50                   	push   %eax
    4f97:	e8 56 42 00 00       	call   91f2 <Strlen>
    4f9c:	83 c4 10             	add    $0x10,%esp
    4f9f:	89 c1                	mov    %eax,%ecx
    4fa1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4fa4:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4fab:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4fae:	83 c2 04             	add    $0x4,%edx
    4fb1:	83 ec 04             	sub    $0x4,%esp
    4fb4:	51                   	push   %ecx
    4fb5:	50                   	push   %eax
    4fb6:	52                   	push   %edx
    4fb7:	e8 cf 41 00 00       	call   918b <Memcpy>
    4fbc:	83 c4 10             	add    $0x10,%esp
    4fbf:	eb 01                	jmp    4fc2 <mkfs+0x58f>
    4fc1:	90                   	nop
    4fc2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    4fc6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4fc9:	3b 45 c0             	cmp    -0x40(%ebp),%eax
    4fcc:	7c 92                	jl     4f60 <mkfs+0x52d>
    4fce:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    4fd4:	8b 45 98             	mov    -0x68(%ebp),%eax
    4fd7:	83 ec 0c             	sub    $0xc,%esp
    4fda:	6a 0a                	push   $0xa
    4fdc:	68 00 02 00 00       	push   $0x200
    4fe1:	52                   	push   %edx
    4fe2:	6a 20                	push   $0x20
    4fe4:	50                   	push   %eax
    4fe5:	e8 a5 f9 ff ff       	call   498f <rd_wt>
    4fea:	83 c4 20             	add    $0x20,%esp
    4fed:	90                   	nop
    4fee:	8b 7d fc             	mov    -0x4(%ebp),%edi
    4ff1:	c9                   	leave  
    4ff2:	c3                   	ret    

00004ff3 <init_fs>:
    4ff3:	55                   	push   %ebp
    4ff4:	89 e5                	mov    %esp,%ebp
    4ff6:	83 ec 78             	sub    $0x78,%esp
    4ff9:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    5000:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
    5007:	83 ec 04             	sub    $0x4,%esp
    500a:	6a 02                	push   $0x2
    500c:	8d 45 8c             	lea    -0x74(%ebp),%eax
    500f:	50                   	push   %eax
    5010:	6a 03                	push   $0x3
    5012:	e8 01 e8 ff ff       	call   3818 <send_rec>
    5017:	83 c4 10             	add    $0x10,%esp
    501a:	e8 14 fa ff ff       	call   4a33 <mkfs>
    501f:	90                   	nop
    5020:	c9                   	leave  
    5021:	c3                   	ret    

00005022 <do_open>:
    5022:	55                   	push   %ebp
    5023:	89 e5                	mov    %esp,%ebp
    5025:	56                   	push   %esi
    5026:	53                   	push   %ebx
    5027:	83 ec 60             	sub    $0x60,%esp
    502a:	83 ec 04             	sub    $0x4,%esp
    502d:	6a 0c                	push   $0xc
    502f:	6a 00                	push   $0x0
    5031:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5034:	50                   	push   %eax
    5035:	e8 7f 41 00 00       	call   91b9 <Memset>
    503a:	83 c4 10             	add    $0x10,%esp
    503d:	8b 45 08             	mov    0x8(%ebp),%eax
    5040:	8b 40 30             	mov    0x30(%eax),%eax
    5043:	89 c6                	mov    %eax,%esi
    5045:	8b 45 08             	mov    0x8(%ebp),%eax
    5048:	8b 40 34             	mov    0x34(%eax),%eax
    504b:	89 c2                	mov    %eax,%edx
    504d:	8b 45 08             	mov    0x8(%ebp),%eax
    5050:	8b 00                	mov    (%eax),%eax
    5052:	83 ec 08             	sub    $0x8,%esp
    5055:	52                   	push   %edx
    5056:	50                   	push   %eax
    5057:	e8 af 19 00 00       	call   6a0b <v2l>
    505c:	83 c4 10             	add    $0x10,%esp
    505f:	89 c3                	mov    %eax,%ebx
    5061:	83 ec 08             	sub    $0x8,%esp
    5064:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5067:	50                   	push   %eax
    5068:	6a 03                	push   $0x3
    506a:	e8 9c 19 00 00       	call   6a0b <v2l>
    506f:	83 c4 10             	add    $0x10,%esp
    5072:	83 ec 04             	sub    $0x4,%esp
    5075:	56                   	push   %esi
    5076:	53                   	push   %ebx
    5077:	50                   	push   %eax
    5078:	e8 0e 41 00 00       	call   918b <Memcpy>
    507d:	83 c4 10             	add    $0x10,%esp
    5080:	8b 45 08             	mov    0x8(%ebp),%eax
    5083:	8b 40 30             	mov    0x30(%eax),%eax
    5086:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
    508b:	8b 45 08             	mov    0x8(%ebp),%eax
    508e:	8b 40 64             	mov    0x64(%eax),%eax
    5091:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5094:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
    509b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    50a2:	eb 1f                	jmp    50c3 <do_open+0xa1>
    50a4:	a1 64 db 00 00       	mov    0xdb64,%eax
    50a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    50ac:	83 c2 1c             	add    $0x1c,%edx
    50af:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    50b3:	85 c0                	test   %eax,%eax
    50b5:	75 08                	jne    50bf <do_open+0x9d>
    50b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    50ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    50bd:	eb 0a                	jmp    50c9 <do_open+0xa7>
    50bf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    50c3:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    50c7:	7e db                	jle    50a4 <do_open+0x82>
    50c9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    50cd:	75 1c                	jne    50eb <do_open+0xc9>
    50cf:	68 d8 01 00 00       	push   $0x1d8
    50d4:	68 5c 8f 00 00       	push   $0x8f5c
    50d9:	68 5c 8f 00 00       	push   $0x8f5c
    50de:	68 d5 8f 00 00       	push   $0x8fd5
    50e3:	e8 c4 de ff ff       	call   2fac <assertion_failure>
    50e8:	83 c4 10             	add    $0x10,%esp
    50eb:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
    50f2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    50f9:	eb 1d                	jmp    5118 <do_open+0xf6>
    50fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    50fe:	c1 e0 04             	shl    $0x4,%eax
    5101:	05 48 03 01 00       	add    $0x10348,%eax
    5106:	8b 00                	mov    (%eax),%eax
    5108:	85 c0                	test   %eax,%eax
    510a:	75 08                	jne    5114 <do_open+0xf2>
    510c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    510f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5112:	eb 0a                	jmp    511e <do_open+0xfc>
    5114:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    5118:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
    511c:	7e dd                	jle    50fb <do_open+0xd9>
    511e:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
    5122:	75 1c                	jne    5140 <do_open+0x11e>
    5124:	68 e4 01 00 00       	push   $0x1e4
    5129:	68 5c 8f 00 00       	push   $0x8f5c
    512e:	68 5c 8f 00 00       	push   $0x8f5c
    5133:	68 dd 8f 00 00       	push   $0x8fdd
    5138:	e8 6f de ff ff       	call   2fac <assertion_failure>
    513d:	83 c4 10             	add    $0x10,%esp
    5140:	83 ec 0c             	sub    $0xc,%esp
    5143:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5146:	50                   	push   %eax
    5147:	e8 b7 00 00 00       	call   5203 <search_file>
    514c:	83 c4 10             	add    $0x10,%esp
    514f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5152:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
    5156:	75 2b                	jne    5183 <do_open+0x161>
    5158:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    515c:	7e 10                	jle    516e <do_open+0x14c>
    515e:	83 ec 0c             	sub    $0xc,%esp
    5161:	68 e5 8f 00 00       	push   $0x8fe5
    5166:	e8 23 de ff ff       	call   2f8e <panic>
    516b:	83 c4 10             	add    $0x10,%esp
    516e:	83 ec 08             	sub    $0x8,%esp
    5171:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5174:	50                   	push   %eax
    5175:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5178:	50                   	push   %eax
    5179:	e8 43 04 00 00       	call   55c1 <create_file>
    517e:	83 c4 10             	add    $0x10,%esp
    5181:	eb 22                	jmp    51a5 <do_open+0x183>
    5183:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    5187:	75 07                	jne    5190 <do_open+0x16e>
    5189:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    518e:	eb 6c                	jmp    51fc <do_open+0x1da>
    5190:	83 ec 08             	sub    $0x8,%esp
    5193:	ff 75 e0             	pushl  -0x20(%ebp)
    5196:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5199:	50                   	push   %eax
    519a:	e8 60 02 00 00       	call   53ff <get_inode>
    519f:	83 c4 10             	add    $0x10,%esp
    51a2:	89 45 dc             	mov    %eax,-0x24(%ebp)
    51a5:	a1 64 db 00 00       	mov    0xdb64,%eax
    51aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    51ad:	c1 e2 04             	shl    $0x4,%edx
    51b0:	8d 8a 40 03 01 00    	lea    0x10340(%edx),%ecx
    51b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    51b9:	83 c2 1c             	add    $0x1c,%edx
    51bc:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
    51c0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    51c3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    51c6:	c1 e2 04             	shl    $0x4,%edx
    51c9:	81 c2 48 03 01 00    	add    $0x10348,%edx
    51cf:	89 02                	mov    %eax,(%edx)
    51d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51d4:	c1 e0 04             	shl    $0x4,%eax
    51d7:	05 44 03 01 00       	add    $0x10344,%eax
    51dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    51e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51e5:	c1 e0 04             	shl    $0x4,%eax
    51e8:	05 40 03 01 00       	add    $0x10340,%eax
    51ed:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    51f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    51f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    51fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    51ff:	5b                   	pop    %ebx
    5200:	5e                   	pop    %esi
    5201:	5d                   	pop    %ebp
    5202:	c3                   	ret    

00005203 <search_file>:
    5203:	55                   	push   %ebp
    5204:	89 e5                	mov    %esp,%ebp
    5206:	83 ec 68             	sub    $0x68,%esp
    5209:	83 ec 04             	sub    $0x4,%esp
    520c:	6a 0c                	push   $0xc
    520e:	6a 00                	push   $0x0
    5210:	8d 45 c0             	lea    -0x40(%ebp),%eax
    5213:	50                   	push   %eax
    5214:	e8 a0 3f 00 00       	call   91b9 <Memset>
    5219:	83 c4 10             	add    $0x10,%esp
    521c:	83 ec 04             	sub    $0x4,%esp
    521f:	6a 28                	push   $0x28
    5221:	6a 00                	push   $0x0
    5223:	8d 45 98             	lea    -0x68(%ebp),%eax
    5226:	50                   	push   %eax
    5227:	e8 8d 3f 00 00       	call   91b9 <Memset>
    522c:	83 c4 10             	add    $0x10,%esp
    522f:	83 ec 04             	sub    $0x4,%esp
    5232:	8d 45 98             	lea    -0x68(%ebp),%eax
    5235:	50                   	push   %eax
    5236:	ff 75 08             	pushl  0x8(%ebp)
    5239:	8d 45 c0             	lea    -0x40(%ebp),%eax
    523c:	50                   	push   %eax
    523d:	e8 f1 00 00 00       	call   5333 <strip_path>
    5242:	83 c4 10             	add    $0x10,%esp
    5245:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5248:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
    524c:	75 0a                	jne    5258 <search_file+0x55>
    524e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5253:	e9 d9 00 00 00       	jmp    5331 <search_file+0x12e>
    5258:	8b 45 9c             	mov    -0x64(%ebp),%eax
    525b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    525e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5261:	05 00 02 00 00       	add    $0x200,%eax
    5266:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    526c:	85 c0                	test   %eax,%eax
    526e:	0f 48 c2             	cmovs  %edx,%eax
    5271:	c1 f8 09             	sar    $0x9,%eax
    5274:	89 45 dc             	mov    %eax,-0x24(%ebp)
    5277:	8b 45 9c             	mov    -0x64(%ebp),%eax
    527a:	c1 e8 04             	shr    $0x4,%eax
    527d:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5280:	e8 2f 14 00 00       	call   66b4 <get_super_block>
    5285:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5288:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    528b:	8b 00                	mov    (%eax),%eax
    528d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5290:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
    5297:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    529e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    52a5:	eb 79                	jmp    5320 <search_file+0x11d>
    52a7:	a1 20 c0 00 00       	mov    0xc020,%eax
    52ac:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    52af:	8b 55 f0             	mov    -0x10(%ebp),%edx
    52b2:	01 ca                	add    %ecx,%edx
    52b4:	83 ec 0c             	sub    $0xc,%esp
    52b7:	6a 07                	push   $0x7
    52b9:	68 00 02 00 00       	push   $0x200
    52be:	50                   	push   %eax
    52bf:	ff 75 cc             	pushl  -0x34(%ebp)
    52c2:	52                   	push   %edx
    52c3:	e8 c7 f6 ff ff       	call   498f <rd_wt>
    52c8:	83 c4 20             	add    $0x20,%esp
    52cb:	a1 20 c0 00 00       	mov    0xc020,%eax
    52d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    52d3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    52da:	eb 35                	jmp    5311 <search_file+0x10e>
    52dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    52e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52e3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    52e6:	7f 33                	jg     531b <search_file+0x118>
    52e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    52eb:	83 c0 04             	add    $0x4,%eax
    52ee:	83 ec 08             	sub    $0x8,%esp
    52f1:	50                   	push   %eax
    52f2:	8d 45 c0             	lea    -0x40(%ebp),%eax
    52f5:	50                   	push   %eax
    52f6:	e8 0c e8 ff ff       	call   3b07 <strcmp>
    52fb:	83 c4 10             	add    $0x10,%esp
    52fe:	85 c0                	test   %eax,%eax
    5300:	75 07                	jne    5309 <search_file+0x106>
    5302:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5305:	8b 00                	mov    (%eax),%eax
    5307:	eb 28                	jmp    5331 <search_file+0x12e>
    5309:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    530d:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
    5311:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5314:	83 f8 1f             	cmp    $0x1f,%eax
    5317:	76 c3                	jbe    52dc <search_file+0xd9>
    5319:	eb 01                	jmp    531c <search_file+0x119>
    531b:	90                   	nop
    531c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5320:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5323:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    5326:	0f 8c 7b ff ff ff    	jl     52a7 <search_file+0xa4>
    532c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5331:	c9                   	leave  
    5332:	c3                   	ret    

00005333 <strip_path>:
    5333:	55                   	push   %ebp
    5334:	89 e5                	mov    %esp,%ebp
    5336:	83 ec 10             	sub    $0x10,%esp
    5339:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    533d:	75 0a                	jne    5349 <strip_path+0x16>
    533f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5344:	e9 b4 00 00 00       	jmp    53fd <strip_path+0xca>
    5349:	8b 45 08             	mov    0x8(%ebp),%eax
    534c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    534f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5352:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5355:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5358:	0f b6 00             	movzbl (%eax),%eax
    535b:	3c 2f                	cmp    $0x2f,%al
    535d:	75 2d                	jne    538c <strip_path+0x59>
    535f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    5363:	eb 27                	jmp    538c <strip_path+0x59>
    5365:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5368:	0f b6 00             	movzbl (%eax),%eax
    536b:	3c 2f                	cmp    $0x2f,%al
    536d:	75 0a                	jne    5379 <strip_path+0x46>
    536f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5374:	e9 84 00 00 00       	jmp    53fd <strip_path+0xca>
    5379:	8b 45 f8             	mov    -0x8(%ebp),%eax
    537c:	0f b6 10             	movzbl (%eax),%edx
    537f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5382:	88 10                	mov    %dl,(%eax)
    5384:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    5388:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    538c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    538f:	0f b6 00             	movzbl (%eax),%eax
    5392:	84 c0                	test   %al,%al
    5394:	75 cf                	jne    5365 <strip_path+0x32>
    5396:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5399:	c6 00 00             	movb   $0x0,(%eax)
    539c:	8b 45 10             	mov    0x10(%ebp),%eax
    539f:	8b 15 40 11 01 00    	mov    0x11140,%edx
    53a5:	89 10                	mov    %edx,(%eax)
    53a7:	8b 15 44 11 01 00    	mov    0x11144,%edx
    53ad:	89 50 04             	mov    %edx,0x4(%eax)
    53b0:	8b 15 48 11 01 00    	mov    0x11148,%edx
    53b6:	89 50 08             	mov    %edx,0x8(%eax)
    53b9:	8b 15 4c 11 01 00    	mov    0x1114c,%edx
    53bf:	89 50 0c             	mov    %edx,0xc(%eax)
    53c2:	8b 15 50 11 01 00    	mov    0x11150,%edx
    53c8:	89 50 10             	mov    %edx,0x10(%eax)
    53cb:	8b 15 54 11 01 00    	mov    0x11154,%edx
    53d1:	89 50 14             	mov    %edx,0x14(%eax)
    53d4:	8b 15 58 11 01 00    	mov    0x11158,%edx
    53da:	89 50 18             	mov    %edx,0x18(%eax)
    53dd:	8b 15 5c 11 01 00    	mov    0x1115c,%edx
    53e3:	89 50 1c             	mov    %edx,0x1c(%eax)
    53e6:	8b 15 60 11 01 00    	mov    0x11160,%edx
    53ec:	89 50 20             	mov    %edx,0x20(%eax)
    53ef:	8b 15 64 11 01 00    	mov    0x11164,%edx
    53f5:	89 50 24             	mov    %edx,0x24(%eax)
    53f8:	b8 00 00 00 00       	mov    $0x0,%eax
    53fd:	c9                   	leave  
    53fe:	c3                   	ret    

000053ff <get_inode>:
    53ff:	55                   	push   %ebp
    5400:	89 e5                	mov    %esp,%ebp
    5402:	56                   	push   %esi
    5403:	53                   	push   %ebx
    5404:	83 ec 20             	sub    $0x20,%esp
    5407:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    540b:	75 0a                	jne    5417 <get_inode+0x18>
    540d:	b8 00 00 00 00       	mov    $0x0,%eax
    5412:	e9 a3 01 00 00       	jmp    55ba <get_inode+0x1bb>
    5417:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    541e:	c7 45 f0 40 07 01 00 	movl   $0x10740,-0x10(%ebp)
    5425:	eb 69                	jmp    5490 <get_inode+0x91>
    5427:	8b 45 f0             	mov    -0x10(%ebp),%eax
    542a:	8b 40 24             	mov    0x24(%eax),%eax
    542d:	85 c0                	test   %eax,%eax
    542f:	7e 53                	jle    5484 <get_inode+0x85>
    5431:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5434:	8b 40 10             	mov    0x10(%eax),%eax
    5437:	39 45 0c             	cmp    %eax,0xc(%ebp)
    543a:	75 50                	jne    548c <get_inode+0x8d>
    543c:	8b 45 08             	mov    0x8(%ebp),%eax
    543f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5442:	8b 0a                	mov    (%edx),%ecx
    5444:	89 08                	mov    %ecx,(%eax)
    5446:	8b 4a 04             	mov    0x4(%edx),%ecx
    5449:	89 48 04             	mov    %ecx,0x4(%eax)
    544c:	8b 4a 08             	mov    0x8(%edx),%ecx
    544f:	89 48 08             	mov    %ecx,0x8(%eax)
    5452:	8b 4a 0c             	mov    0xc(%edx),%ecx
    5455:	89 48 0c             	mov    %ecx,0xc(%eax)
    5458:	8b 4a 10             	mov    0x10(%edx),%ecx
    545b:	89 48 10             	mov    %ecx,0x10(%eax)
    545e:	8b 4a 14             	mov    0x14(%edx),%ecx
    5461:	89 48 14             	mov    %ecx,0x14(%eax)
    5464:	8b 4a 18             	mov    0x18(%edx),%ecx
    5467:	89 48 18             	mov    %ecx,0x18(%eax)
    546a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    546d:	89 48 1c             	mov    %ecx,0x1c(%eax)
    5470:	8b 4a 20             	mov    0x20(%edx),%ecx
    5473:	89 48 20             	mov    %ecx,0x20(%eax)
    5476:	8b 52 24             	mov    0x24(%edx),%edx
    5479:	89 50 24             	mov    %edx,0x24(%eax)
    547c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    547f:	e9 36 01 00 00       	jmp    55ba <get_inode+0x1bb>
    5484:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5487:	89 45 f4             	mov    %eax,-0xc(%ebp)
    548a:	eb 0d                	jmp    5499 <get_inode+0x9a>
    548c:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
    5490:	81 7d f0 40 11 01 00 	cmpl   $0x11140,-0x10(%ebp)
    5497:	76 8e                	jbe    5427 <get_inode+0x28>
    5499:	e8 16 12 00 00       	call   66b4 <get_super_block>
    549e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    54a1:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    54a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    54ab:	8b 40 04             	mov    0x4(%eax),%eax
    54ae:	8d 50 02             	lea    0x2(%eax),%edx
    54b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    54b4:	8b 40 08             	mov    0x8(%eax),%eax
    54b7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    54ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    54bd:	8d 48 ff             	lea    -0x1(%eax),%ecx
    54c0:	b8 00 02 00 00       	mov    $0x200,%eax
    54c5:	99                   	cltd   
    54c6:	f7 7d e8             	idivl  -0x18(%ebp)
    54c9:	89 c6                	mov    %eax,%esi
    54cb:	89 c8                	mov    %ecx,%eax
    54cd:	99                   	cltd   
    54ce:	f7 fe                	idiv   %esi
    54d0:	01 d8                	add    %ebx,%eax
    54d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    54d5:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
    54dc:	a1 20 c0 00 00       	mov    0xc020,%eax
    54e1:	83 ec 0c             	sub    $0xc,%esp
    54e4:	6a 07                	push   $0x7
    54e6:	68 00 02 00 00       	push   $0x200
    54eb:	50                   	push   %eax
    54ec:	ff 75 e0             	pushl  -0x20(%ebp)
    54ef:	ff 75 e4             	pushl  -0x1c(%ebp)
    54f2:	e8 98 f4 ff ff       	call   498f <rd_wt>
    54f7:	83 c4 20             	add    $0x20,%esp
    54fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    54fd:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5500:	b8 00 02 00 00       	mov    $0x200,%eax
    5505:	99                   	cltd   
    5506:	f7 7d e8             	idivl  -0x18(%ebp)
    5509:	89 c3                	mov    %eax,%ebx
    550b:	89 c8                	mov    %ecx,%eax
    550d:	99                   	cltd   
    550e:	f7 fb                	idiv   %ebx
    5510:	89 55 dc             	mov    %edx,-0x24(%ebp)
    5513:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5519:	8b 45 e8             	mov    -0x18(%ebp),%eax
    551c:	0f af 45 dc          	imul   -0x24(%ebp),%eax
    5520:	01 d0                	add    %edx,%eax
    5522:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5525:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5528:	8b 55 d8             	mov    -0x28(%ebp),%edx
    552b:	8b 0a                	mov    (%edx),%ecx
    552d:	89 08                	mov    %ecx,(%eax)
    552f:	8b 4a 04             	mov    0x4(%edx),%ecx
    5532:	89 48 04             	mov    %ecx,0x4(%eax)
    5535:	8b 4a 08             	mov    0x8(%edx),%ecx
    5538:	89 48 08             	mov    %ecx,0x8(%eax)
    553b:	8b 4a 0c             	mov    0xc(%edx),%ecx
    553e:	89 48 0c             	mov    %ecx,0xc(%eax)
    5541:	8b 4a 10             	mov    0x10(%edx),%ecx
    5544:	89 48 10             	mov    %ecx,0x10(%eax)
    5547:	8b 4a 14             	mov    0x14(%edx),%ecx
    554a:	89 48 14             	mov    %ecx,0x14(%eax)
    554d:	8b 4a 18             	mov    0x18(%edx),%ecx
    5550:	89 48 18             	mov    %ecx,0x18(%eax)
    5553:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    5556:	89 48 1c             	mov    %ecx,0x1c(%eax)
    5559:	8b 4a 20             	mov    0x20(%edx),%ecx
    555c:	89 48 20             	mov    %ecx,0x20(%eax)
    555f:	8b 52 24             	mov    0x24(%edx),%edx
    5562:	89 50 24             	mov    %edx,0x24(%eax)
    5565:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5568:	8b 55 0c             	mov    0xc(%ebp),%edx
    556b:	89 50 10             	mov    %edx,0x10(%eax)
    556e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5571:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5574:	89 50 20             	mov    %edx,0x20(%eax)
    5577:	8b 45 08             	mov    0x8(%ebp),%eax
    557a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    557d:	8b 0a                	mov    (%edx),%ecx
    557f:	89 08                	mov    %ecx,(%eax)
    5581:	8b 4a 04             	mov    0x4(%edx),%ecx
    5584:	89 48 04             	mov    %ecx,0x4(%eax)
    5587:	8b 4a 08             	mov    0x8(%edx),%ecx
    558a:	89 48 08             	mov    %ecx,0x8(%eax)
    558d:	8b 4a 0c             	mov    0xc(%edx),%ecx
    5590:	89 48 0c             	mov    %ecx,0xc(%eax)
    5593:	8b 4a 10             	mov    0x10(%edx),%ecx
    5596:	89 48 10             	mov    %ecx,0x10(%eax)
    5599:	8b 4a 14             	mov    0x14(%edx),%ecx
    559c:	89 48 14             	mov    %ecx,0x14(%eax)
    559f:	8b 4a 18             	mov    0x18(%edx),%ecx
    55a2:	89 48 18             	mov    %ecx,0x18(%eax)
    55a5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    55a8:	89 48 1c             	mov    %ecx,0x1c(%eax)
    55ab:	8b 4a 20             	mov    0x20(%edx),%ecx
    55ae:	89 48 20             	mov    %ecx,0x20(%eax)
    55b1:	8b 52 24             	mov    0x24(%edx),%edx
    55b4:	89 50 24             	mov    %edx,0x24(%eax)
    55b7:	8b 45 08             	mov    0x8(%ebp),%eax
    55ba:	8d 65 f8             	lea    -0x8(%ebp),%esp
    55bd:	5b                   	pop    %ebx
    55be:	5e                   	pop    %esi
    55bf:	5d                   	pop    %ebp
    55c0:	c3                   	ret    

000055c1 <create_file>:
    55c1:	55                   	push   %ebp
    55c2:	89 e5                	mov    %esp,%ebp
    55c4:	81 ec 98 00 00 00    	sub    $0x98,%esp
    55ca:	8d 45 b8             	lea    -0x48(%ebp),%eax
    55cd:	50                   	push   %eax
    55ce:	ff 75 0c             	pushl  0xc(%ebp)
    55d1:	8d 45 ac             	lea    -0x54(%ebp),%eax
    55d4:	50                   	push   %eax
    55d5:	e8 59 fd ff ff       	call   5333 <strip_path>
    55da:	83 c4 0c             	add    $0xc,%esp
    55dd:	83 f8 ff             	cmp    $0xffffffff,%eax
    55e0:	75 0a                	jne    55ec <create_file+0x2b>
    55e2:	b8 00 00 00 00       	mov    $0x0,%eax
    55e7:	e9 de 00 00 00       	jmp    56ca <create_file+0x109>
    55ec:	e8 db 00 00 00       	call   56cc <alloc_imap_bit>
    55f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    55f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    55f8:	75 0a                	jne    5604 <create_file+0x43>
    55fa:	b8 00 00 00 00       	mov    $0x0,%eax
    55ff:	e9 c6 00 00 00       	jmp    56ca <create_file+0x109>
    5604:	e8 ab 10 00 00       	call   66b4 <get_super_block>
    5609:	89 45 f0             	mov    %eax,-0x10(%ebp)
    560c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    560f:	8b 40 10             	mov    0x10(%eax),%eax
    5612:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5615:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5618:	83 ec 08             	sub    $0x8,%esp
    561b:	50                   	push   %eax
    561c:	ff 75 f4             	pushl  -0xc(%ebp)
    561f:	e8 a5 01 00 00       	call   57c9 <alloc_smap_bit>
    5624:	83 c4 10             	add    $0x10,%esp
    5627:	89 45 e8             	mov    %eax,-0x18(%ebp)
    562a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    562e:	75 0a                	jne    563a <create_file+0x79>
    5630:	b8 00 00 00 00       	mov    $0x0,%eax
    5635:	e9 90 00 00 00       	jmp    56ca <create_file+0x109>
    563a:	83 ec 04             	sub    $0x4,%esp
    563d:	ff 75 e8             	pushl  -0x18(%ebp)
    5640:	ff 75 f4             	pushl  -0xc(%ebp)
    5643:	8d 45 84             	lea    -0x7c(%ebp),%eax
    5646:	50                   	push   %eax
    5647:	e8 1e 03 00 00       	call   596a <new_inode>
    564c:	83 c4 10             	add    $0x10,%esp
    564f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5652:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    5656:	75 07                	jne    565f <create_file+0x9e>
    5658:	b8 00 00 00 00       	mov    $0x0,%eax
    565d:	eb 6b                	jmp    56ca <create_file+0x109>
    565f:	ff 75 f4             	pushl  -0xc(%ebp)
    5662:	8d 45 ac             	lea    -0x54(%ebp),%eax
    5665:	50                   	push   %eax
    5666:	8d 45 b8             	lea    -0x48(%ebp),%eax
    5669:	50                   	push   %eax
    566a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
    5670:	50                   	push   %eax
    5671:	e8 12 04 00 00       	call   5a88 <new_dir_entry>
    5676:	83 c4 10             	add    $0x10,%esp
    5679:	89 45 e0             	mov    %eax,-0x20(%ebp)
    567c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    5680:	75 07                	jne    5689 <create_file+0xc8>
    5682:	b8 00 00 00 00       	mov    $0x0,%eax
    5687:	eb 41                	jmp    56ca <create_file+0x109>
    5689:	8b 45 08             	mov    0x8(%ebp),%eax
    568c:	8b 55 84             	mov    -0x7c(%ebp),%edx
    568f:	89 10                	mov    %edx,(%eax)
    5691:	8b 55 88             	mov    -0x78(%ebp),%edx
    5694:	89 50 04             	mov    %edx,0x4(%eax)
    5697:	8b 55 8c             	mov    -0x74(%ebp),%edx
    569a:	89 50 08             	mov    %edx,0x8(%eax)
    569d:	8b 55 90             	mov    -0x70(%ebp),%edx
    56a0:	89 50 0c             	mov    %edx,0xc(%eax)
    56a3:	8b 55 94             	mov    -0x6c(%ebp),%edx
    56a6:	89 50 10             	mov    %edx,0x10(%eax)
    56a9:	8b 55 98             	mov    -0x68(%ebp),%edx
    56ac:	89 50 14             	mov    %edx,0x14(%eax)
    56af:	8b 55 9c             	mov    -0x64(%ebp),%edx
    56b2:	89 50 18             	mov    %edx,0x18(%eax)
    56b5:	8b 55 a0             	mov    -0x60(%ebp),%edx
    56b8:	89 50 1c             	mov    %edx,0x1c(%eax)
    56bb:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    56be:	89 50 20             	mov    %edx,0x20(%eax)
    56c1:	8b 55 a8             	mov    -0x58(%ebp),%edx
    56c4:	89 50 24             	mov    %edx,0x24(%eax)
    56c7:	8b 45 08             	mov    0x8(%ebp),%eax
    56ca:	c9                   	leave  
    56cb:	c3                   	ret    

000056cc <alloc_imap_bit>:
    56cc:	55                   	push   %ebp
    56cd:	89 e5                	mov    %esp,%ebp
    56cf:	53                   	push   %ebx
    56d0:	83 ec 24             	sub    $0x24,%esp
    56d3:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
    56da:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    56e1:	a1 20 c0 00 00       	mov    0xc020,%eax
    56e6:	83 ec 0c             	sub    $0xc,%esp
    56e9:	6a 07                	push   $0x7
    56eb:	68 00 02 00 00       	push   $0x200
    56f0:	50                   	push   %eax
    56f1:	ff 75 e8             	pushl  -0x18(%ebp)
    56f4:	ff 75 ec             	pushl  -0x14(%ebp)
    56f7:	e8 93 f2 ff ff       	call   498f <rd_wt>
    56fc:	83 c4 20             	add    $0x20,%esp
    56ff:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5706:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    570d:	e9 a5 00 00 00       	jmp    57b7 <alloc_imap_bit+0xeb>
    5712:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5719:	e9 8b 00 00 00       	jmp    57a9 <alloc_imap_bit+0xdd>
    571e:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5724:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5727:	01 d0                	add    %edx,%eax
    5729:	0f b6 00             	movzbl (%eax),%eax
    572c:	0f be d0             	movsbl %al,%edx
    572f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5732:	89 c1                	mov    %eax,%ecx
    5734:	d3 fa                	sar    %cl,%edx
    5736:	89 d0                	mov    %edx,%eax
    5738:	83 e0 01             	and    $0x1,%eax
    573b:	85 c0                	test   %eax,%eax
    573d:	74 06                	je     5745 <alloc_imap_bit+0x79>
    573f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5743:	eb 64                	jmp    57a9 <alloc_imap_bit+0xdd>
    5745:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    574b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    574e:	01 d0                	add    %edx,%eax
    5750:	0f b6 18             	movzbl (%eax),%ebx
    5753:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5756:	ba 01 00 00 00       	mov    $0x1,%edx
    575b:	89 c1                	mov    %eax,%ecx
    575d:	d3 e2                	shl    %cl,%edx
    575f:	89 d0                	mov    %edx,%eax
    5761:	89 c1                	mov    %eax,%ecx
    5763:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5769:	8b 45 f4             	mov    -0xc(%ebp),%eax
    576c:	01 d0                	add    %edx,%eax
    576e:	09 cb                	or     %ecx,%ebx
    5770:	89 da                	mov    %ebx,%edx
    5772:	88 10                	mov    %dl,(%eax)
    5774:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5777:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    577e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5781:	01 d0                	add    %edx,%eax
    5783:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5786:	a1 20 c0 00 00       	mov    0xc020,%eax
    578b:	83 ec 0c             	sub    $0xc,%esp
    578e:	6a 0a                	push   $0xa
    5790:	68 00 02 00 00       	push   $0x200
    5795:	50                   	push   %eax
    5796:	ff 75 e8             	pushl  -0x18(%ebp)
    5799:	ff 75 ec             	pushl  -0x14(%ebp)
    579c:	e8 ee f1 ff ff       	call   498f <rd_wt>
    57a1:	83 c4 20             	add    $0x20,%esp
    57a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57a7:	eb 1b                	jmp    57c4 <alloc_imap_bit+0xf8>
    57a9:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    57ad:	0f 8e 6b ff ff ff    	jle    571e <alloc_imap_bit+0x52>
    57b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    57b7:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    57be:	0f 8e 4e ff ff ff    	jle    5712 <alloc_imap_bit+0x46>
    57c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    57c7:	c9                   	leave  
    57c8:	c3                   	ret    

000057c9 <alloc_smap_bit>:
    57c9:	55                   	push   %ebp
    57ca:	89 e5                	mov    %esp,%ebp
    57cc:	53                   	push   %ebx
    57cd:	83 ec 34             	sub    $0x34,%esp
    57d0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    57d4:	75 1c                	jne    57f2 <alloc_smap_bit+0x29>
    57d6:	68 0e 03 00 00       	push   $0x30e
    57db:	68 5c 8f 00 00       	push   $0x8f5c
    57e0:	68 5c 8f 00 00       	push   $0x8f5c
    57e5:	68 f2 8f 00 00       	push   $0x8ff2
    57ea:	e8 bd d7 ff ff       	call   2fac <assertion_failure>
    57ef:	83 c4 10             	add    $0x10,%esp
    57f2:	e8 bd 0e 00 00       	call   66b4 <get_super_block>
    57f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    57fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57fd:	8b 40 08             	mov    0x8(%eax),%eax
    5800:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5803:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5806:	8b 40 04             	mov    0x4(%eax),%eax
    5809:	83 c0 02             	add    $0x2,%eax
    580c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    580f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5816:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    581d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5824:	e9 20 01 00 00       	jmp    5949 <alloc_smap_bit+0x180>
    5829:	8b 55 dc             	mov    -0x24(%ebp),%edx
    582c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    582f:	01 d0                	add    %edx,%eax
    5831:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5834:	a1 20 c0 00 00       	mov    0xc020,%eax
    5839:	83 ec 0c             	sub    $0xc,%esp
    583c:	6a 07                	push   $0x7
    583e:	68 00 02 00 00       	push   $0x200
    5843:	50                   	push   %eax
    5844:	ff 75 d8             	pushl  -0x28(%ebp)
    5847:	ff 75 d4             	pushl  -0x2c(%ebp)
    584a:	e8 40 f1 ff ff       	call   498f <rd_wt>
    584f:	83 c4 20             	add    $0x20,%esp
    5852:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5859:	e9 b0 00 00 00       	jmp    590e <alloc_smap_bit+0x145>
    585e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5865:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5869:	0f 85 8c 00 00 00    	jne    58fb <alloc_smap_bit+0x132>
    586f:	eb 45                	jmp    58b6 <alloc_smap_bit+0xed>
    5871:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5877:	8b 45 ec             	mov    -0x14(%ebp),%eax
    587a:	01 d0                	add    %edx,%eax
    587c:	0f b6 00             	movzbl (%eax),%eax
    587f:	0f be d0             	movsbl %al,%edx
    5882:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5885:	89 c1                	mov    %eax,%ecx
    5887:	d3 fa                	sar    %cl,%edx
    5889:	89 d0                	mov    %edx,%eax
    588b:	83 e0 01             	and    $0x1,%eax
    588e:	85 c0                	test   %eax,%eax
    5890:	74 06                	je     5898 <alloc_smap_bit+0xcf>
    5892:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    5896:	eb 1e                	jmp    58b6 <alloc_smap_bit+0xed>
    5898:	8b 45 f0             	mov    -0x10(%ebp),%eax
    589b:	c1 e0 09             	shl    $0x9,%eax
    589e:	89 c2                	mov    %eax,%edx
    58a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    58a3:	01 d0                	add    %edx,%eax
    58a5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    58ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58af:	01 d0                	add    %edx,%eax
    58b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    58b4:	eb 06                	jmp    58bc <alloc_smap_bit+0xf3>
    58b6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    58ba:	7e b5                	jle    5871 <alloc_smap_bit+0xa8>
    58bc:	eb 3d                	jmp    58fb <alloc_smap_bit+0x132>
    58be:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    58c2:	74 45                	je     5909 <alloc_smap_bit+0x140>
    58c4:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    58ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    58cd:	01 d0                	add    %edx,%eax
    58cf:	0f b6 18             	movzbl (%eax),%ebx
    58d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58d5:	ba 01 00 00 00       	mov    $0x1,%edx
    58da:	89 c1                	mov    %eax,%ecx
    58dc:	d3 e2                	shl    %cl,%edx
    58de:	89 d0                	mov    %edx,%eax
    58e0:	89 c1                	mov    %eax,%ecx
    58e2:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    58e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    58eb:	01 d0                	add    %edx,%eax
    58ed:	09 cb                	or     %ecx,%ebx
    58ef:	89 da                	mov    %ebx,%edx
    58f1:	88 10                	mov    %dl,(%eax)
    58f3:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    58f7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    58fb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    58ff:	74 09                	je     590a <alloc_smap_bit+0x141>
    5901:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    5905:	7e b7                	jle    58be <alloc_smap_bit+0xf5>
    5907:	eb 01                	jmp    590a <alloc_smap_bit+0x141>
    5909:	90                   	nop
    590a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    590e:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
    5915:	0f 8e 43 ff ff ff    	jle    585e <alloc_smap_bit+0x95>
    591b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    591f:	74 1e                	je     593f <alloc_smap_bit+0x176>
    5921:	a1 20 c0 00 00       	mov    0xc020,%eax
    5926:	83 ec 0c             	sub    $0xc,%esp
    5929:	6a 0a                	push   $0xa
    592b:	68 00 02 00 00       	push   $0x200
    5930:	50                   	push   %eax
    5931:	ff 75 d8             	pushl  -0x28(%ebp)
    5934:	ff 75 d4             	pushl  -0x2c(%ebp)
    5937:	e8 53 f0 ff ff       	call   498f <rd_wt>
    593c:	83 c4 20             	add    $0x20,%esp
    593f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5943:	74 12                	je     5957 <alloc_smap_bit+0x18e>
    5945:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5949:	8b 45 f0             	mov    -0x10(%ebp),%eax
    594c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    594f:	0f 8c d4 fe ff ff    	jl     5829 <alloc_smap_bit+0x60>
    5955:	eb 01                	jmp    5958 <alloc_smap_bit+0x18f>
    5957:	90                   	nop
    5958:	8b 45 f4             	mov    -0xc(%ebp),%eax
    595b:	8d 50 ff             	lea    -0x1(%eax),%edx
    595e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5961:	8b 00                	mov    (%eax),%eax
    5963:	01 d0                	add    %edx,%eax
    5965:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5968:	c9                   	leave  
    5969:	c3                   	ret    

0000596a <new_inode>:
    596a:	55                   	push   %ebp
    596b:	89 e5                	mov    %esp,%ebp
    596d:	83 ec 38             	sub    $0x38,%esp
    5970:	83 ec 08             	sub    $0x8,%esp
    5973:	ff 75 0c             	pushl  0xc(%ebp)
    5976:	8d 45 c8             	lea    -0x38(%ebp),%eax
    5979:	50                   	push   %eax
    597a:	e8 80 fa ff ff       	call   53ff <get_inode>
    597f:	83 c4 10             	add    $0x10,%esp
    5982:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5985:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5989:	75 0a                	jne    5995 <new_inode+0x2b>
    598b:	b8 00 00 00 00       	mov    $0x0,%eax
    5990:	e9 f1 00 00 00       	jmp    5a86 <new_inode+0x11c>
    5995:	8b 45 10             	mov    0x10(%ebp),%eax
    5998:	89 45 d0             	mov    %eax,-0x30(%ebp)
    599b:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
    59a2:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    59a9:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
    59b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    59b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    59b6:	83 ec 0c             	sub    $0xc,%esp
    59b9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    59bc:	50                   	push   %eax
    59bd:	e8 0e 0b 00 00       	call   64d0 <sync_inode>
    59c2:	83 c4 10             	add    $0x10,%esp
    59c5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    59cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    59d3:	eb 1d                	jmp    59f2 <new_inode+0x88>
    59d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    59d8:	89 d0                	mov    %edx,%eax
    59da:	c1 e0 02             	shl    $0x2,%eax
    59dd:	01 d0                	add    %edx,%eax
    59df:	c1 e0 03             	shl    $0x3,%eax
    59e2:	05 50 07 01 00       	add    $0x10750,%eax
    59e7:	8b 00                	mov    (%eax),%eax
    59e9:	39 45 0c             	cmp    %eax,0xc(%ebp)
    59ec:	74 0c                	je     59fa <new_inode+0x90>
    59ee:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    59f2:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    59f6:	7e dd                	jle    59d5 <new_inode+0x6b>
    59f8:	eb 01                	jmp    59fb <new_inode+0x91>
    59fa:	90                   	nop
    59fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    59fe:	89 d0                	mov    %edx,%eax
    5a00:	c1 e0 02             	shl    $0x2,%eax
    5a03:	01 d0                	add    %edx,%eax
    5a05:	c1 e0 03             	shl    $0x3,%eax
    5a08:	05 40 07 01 00       	add    $0x10740,%eax
    5a0d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    5a10:	89 10                	mov    %edx,(%eax)
    5a12:	8b 55 cc             	mov    -0x34(%ebp),%edx
    5a15:	89 50 04             	mov    %edx,0x4(%eax)
    5a18:	8b 55 d0             	mov    -0x30(%ebp),%edx
    5a1b:	89 50 08             	mov    %edx,0x8(%eax)
    5a1e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    5a21:	89 50 0c             	mov    %edx,0xc(%eax)
    5a24:	8b 55 d8             	mov    -0x28(%ebp),%edx
    5a27:	89 50 10             	mov    %edx,0x10(%eax)
    5a2a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    5a2d:	89 50 14             	mov    %edx,0x14(%eax)
    5a30:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5a33:	89 50 18             	mov    %edx,0x18(%eax)
    5a36:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    5a39:	89 50 1c             	mov    %edx,0x1c(%eax)
    5a3c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5a3f:	89 50 20             	mov    %edx,0x20(%eax)
    5a42:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a45:	89 50 24             	mov    %edx,0x24(%eax)
    5a48:	8b 45 08             	mov    0x8(%ebp),%eax
    5a4b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    5a4e:	89 10                	mov    %edx,(%eax)
    5a50:	8b 55 cc             	mov    -0x34(%ebp),%edx
    5a53:	89 50 04             	mov    %edx,0x4(%eax)
    5a56:	8b 55 d0             	mov    -0x30(%ebp),%edx
    5a59:	89 50 08             	mov    %edx,0x8(%eax)
    5a5c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    5a5f:	89 50 0c             	mov    %edx,0xc(%eax)
    5a62:	8b 55 d8             	mov    -0x28(%ebp),%edx
    5a65:	89 50 10             	mov    %edx,0x10(%eax)
    5a68:	8b 55 dc             	mov    -0x24(%ebp),%edx
    5a6b:	89 50 14             	mov    %edx,0x14(%eax)
    5a6e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5a71:	89 50 18             	mov    %edx,0x18(%eax)
    5a74:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    5a77:	89 50 1c             	mov    %edx,0x1c(%eax)
    5a7a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5a7d:	89 50 20             	mov    %edx,0x20(%eax)
    5a80:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a83:	89 50 24             	mov    %edx,0x24(%eax)
    5a86:	c9                   	leave  
    5a87:	c3                   	ret    

00005a88 <new_dir_entry>:
    5a88:	55                   	push   %ebp
    5a89:	89 e5                	mov    %esp,%ebp
    5a8b:	83 ec 48             	sub    $0x48,%esp
    5a8e:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
    5a95:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a98:	8b 40 04             	mov    0x4(%eax),%eax
    5a9b:	99                   	cltd   
    5a9c:	f7 7d dc             	idivl  -0x24(%ebp)
    5a9f:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5aa2:	8b 45 0c             	mov    0xc(%ebp),%eax
    5aa5:	8b 40 0c             	mov    0xc(%eax),%eax
    5aa8:	99                   	cltd   
    5aa9:	f7 7d dc             	idivl  -0x24(%ebp)
    5aac:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5aaf:	e8 00 0c 00 00       	call   66b4 <get_super_block>
    5ab4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5ab7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5aba:	8b 00                	mov    (%eax),%eax
    5abc:	89 45 cc             	mov    %eax,-0x34(%ebp)
    5abf:	8b 45 0c             	mov    0xc(%ebp),%eax
    5ac2:	8b 40 0c             	mov    0xc(%eax),%eax
    5ac5:	05 00 02 00 00       	add    $0x200,%eax
    5aca:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5ad0:	85 c0                	test   %eax,%eax
    5ad2:	0f 48 c2             	cmovs  %edx,%eax
    5ad5:	c1 f8 09             	sar    $0x9,%eax
    5ad8:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5adb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5ae2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5ae9:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
    5af0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5af7:	eb 7d                	jmp    5b76 <new_dir_entry+0xee>
    5af9:	a1 20 c0 00 00       	mov    0xc020,%eax
    5afe:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    5b01:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5b04:	01 ca                	add    %ecx,%edx
    5b06:	83 ec 0c             	sub    $0xc,%esp
    5b09:	6a 07                	push   $0x7
    5b0b:	68 00 02 00 00       	push   $0x200
    5b10:	50                   	push   %eax
    5b11:	ff 75 c4             	pushl  -0x3c(%ebp)
    5b14:	52                   	push   %edx
    5b15:	e8 75 ee ff ff       	call   498f <rd_wt>
    5b1a:	83 c4 20             	add    $0x20,%esp
    5b1d:	a1 20 c0 00 00       	mov    0xc020,%eax
    5b22:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5b25:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5b2c:	eb 25                	jmp    5b53 <new_dir_entry+0xcb>
    5b2e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5b32:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5b35:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5b38:	7f 29                	jg     5b63 <new_dir_entry+0xdb>
    5b3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b3d:	8b 00                	mov    (%eax),%eax
    5b3f:	85 c0                	test   %eax,%eax
    5b41:	75 08                	jne    5b4b <new_dir_entry+0xc3>
    5b43:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b46:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5b49:	eb 19                	jmp    5b64 <new_dir_entry+0xdc>
    5b4b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    5b4f:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
    5b53:	b8 00 02 00 00       	mov    $0x200,%eax
    5b58:	99                   	cltd   
    5b59:	f7 7d dc             	idivl  -0x24(%ebp)
    5b5c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    5b5f:	7c cd                	jl     5b2e <new_dir_entry+0xa6>
    5b61:	eb 01                	jmp    5b64 <new_dir_entry+0xdc>
    5b63:	90                   	nop
    5b64:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5b67:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5b6a:	7f 16                	jg     5b82 <new_dir_entry+0xfa>
    5b6c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5b70:	75 10                	jne    5b82 <new_dir_entry+0xfa>
    5b72:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    5b76:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5b79:	3b 45 c8             	cmp    -0x38(%ebp),%eax
    5b7c:	0f 8c 77 ff ff ff    	jl     5af9 <new_dir_entry+0x71>
    5b82:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5b85:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    5b88:	75 0a                	jne    5b94 <new_dir_entry+0x10c>
    5b8a:	b8 00 00 00 00       	mov    $0x0,%eax
    5b8f:	e9 fa 00 00 00       	jmp    5c8e <new_dir_entry+0x206>
    5b94:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    5b9b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5b9f:	75 1e                	jne    5bbf <new_dir_entry+0x137>
    5ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ba4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5ba7:	8b 45 0c             	mov    0xc(%ebp),%eax
    5baa:	8b 50 04             	mov    0x4(%eax),%edx
    5bad:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5bb0:	01 c2                	add    %eax,%edx
    5bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
    5bb5:	89 50 04             	mov    %edx,0x4(%eax)
    5bb8:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
    5bbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bc2:	8b 55 14             	mov    0x14(%ebp),%edx
    5bc5:	89 10                	mov    %edx,(%eax)
    5bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bca:	83 c0 04             	add    $0x4,%eax
    5bcd:	83 ec 08             	sub    $0x8,%esp
    5bd0:	ff 75 10             	pushl  0x10(%ebp)
    5bd3:	50                   	push   %eax
    5bd4:	e8 ff 35 00 00       	call   91d8 <Strcpy>
    5bd9:	83 c4 10             	add    $0x10,%esp
    5bdc:	8b 45 08             	mov    0x8(%ebp),%eax
    5bdf:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5be2:	8b 0a                	mov    (%edx),%ecx
    5be4:	89 08                	mov    %ecx,(%eax)
    5be6:	8b 4a 04             	mov    0x4(%edx),%ecx
    5be9:	89 48 04             	mov    %ecx,0x4(%eax)
    5bec:	8b 4a 08             	mov    0x8(%edx),%ecx
    5bef:	89 48 08             	mov    %ecx,0x8(%eax)
    5bf2:	8b 52 0c             	mov    0xc(%edx),%edx
    5bf5:	89 50 0c             	mov    %edx,0xc(%eax)
    5bf8:	a1 20 c0 00 00       	mov    0xc020,%eax
    5bfd:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    5c00:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5c03:	01 ca                	add    %ecx,%edx
    5c05:	83 ec 0c             	sub    $0xc,%esp
    5c08:	6a 0a                	push   $0xa
    5c0a:	68 00 02 00 00       	push   $0x200
    5c0f:	50                   	push   %eax
    5c10:	ff 75 c4             	pushl  -0x3c(%ebp)
    5c13:	52                   	push   %edx
    5c14:	e8 76 ed ff ff       	call   498f <rd_wt>
    5c19:	83 c4 20             	add    $0x20,%esp
    5c1c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    5c20:	74 69                	je     5c8b <new_dir_entry+0x203>
    5c22:	8b 45 0c             	mov    0xc(%ebp),%eax
    5c25:	8b 10                	mov    (%eax),%edx
    5c27:	89 15 40 11 01 00    	mov    %edx,0x11140
    5c2d:	8b 50 04             	mov    0x4(%eax),%edx
    5c30:	89 15 44 11 01 00    	mov    %edx,0x11144
    5c36:	8b 50 08             	mov    0x8(%eax),%edx
    5c39:	89 15 48 11 01 00    	mov    %edx,0x11148
    5c3f:	8b 50 0c             	mov    0xc(%eax),%edx
    5c42:	89 15 4c 11 01 00    	mov    %edx,0x1114c
    5c48:	8b 50 10             	mov    0x10(%eax),%edx
    5c4b:	89 15 50 11 01 00    	mov    %edx,0x11150
    5c51:	8b 50 14             	mov    0x14(%eax),%edx
    5c54:	89 15 54 11 01 00    	mov    %edx,0x11154
    5c5a:	8b 50 18             	mov    0x18(%eax),%edx
    5c5d:	89 15 58 11 01 00    	mov    %edx,0x11158
    5c63:	8b 50 1c             	mov    0x1c(%eax),%edx
    5c66:	89 15 5c 11 01 00    	mov    %edx,0x1115c
    5c6c:	8b 50 20             	mov    0x20(%eax),%edx
    5c6f:	89 15 60 11 01 00    	mov    %edx,0x11160
    5c75:	8b 40 24             	mov    0x24(%eax),%eax
    5c78:	a3 64 11 01 00       	mov    %eax,0x11164
    5c7d:	83 ec 0c             	sub    $0xc,%esp
    5c80:	ff 75 0c             	pushl  0xc(%ebp)
    5c83:	e8 48 08 00 00       	call   64d0 <sync_inode>
    5c88:	83 c4 10             	add    $0x10,%esp
    5c8b:	8b 45 08             	mov    0x8(%ebp),%eax
    5c8e:	c9                   	leave  
    5c8f:	c3                   	ret    

00005c90 <do_unlink>:
    5c90:	55                   	push   %ebp
    5c91:	89 e5                	mov    %esp,%ebp
    5c93:	53                   	push   %ebx
    5c94:	81 ec a4 00 00 00    	sub    $0xa4,%esp
    5c9a:	83 ec 08             	sub    $0x8,%esp
    5c9d:	ff 75 08             	pushl  0x8(%ebp)
    5ca0:	68 07 90 00 00       	push   $0x9007
    5ca5:	e8 5d de ff ff       	call   3b07 <strcmp>
    5caa:	83 c4 10             	add    $0x10,%esp
    5cad:	85 c0                	test   %eax,%eax
    5caf:	75 10                	jne    5cc1 <do_unlink+0x31>
    5cb1:	83 ec 0c             	sub    $0xc,%esp
    5cb4:	68 09 90 00 00       	push   $0x9009
    5cb9:	e8 d0 d2 ff ff       	call   2f8e <panic>
    5cbe:	83 c4 10             	add    $0x10,%esp
    5cc1:	83 ec 0c             	sub    $0xc,%esp
    5cc4:	ff 75 08             	pushl  0x8(%ebp)
    5cc7:	e8 37 f5 ff ff       	call   5203 <search_file>
    5ccc:	83 c4 10             	add    $0x10,%esp
    5ccf:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5cd2:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    5cd6:	75 10                	jne    5ce8 <do_unlink+0x58>
    5cd8:	83 ec 0c             	sub    $0xc,%esp
    5cdb:	68 25 90 00 00       	push   $0x9025
    5ce0:	e8 a9 d2 ff ff       	call   2f8e <panic>
    5ce5:	83 c4 10             	add    $0x10,%esp
    5ce8:	83 ec 08             	sub    $0x8,%esp
    5ceb:	ff 75 d0             	pushl  -0x30(%ebp)
    5cee:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5cf4:	50                   	push   %eax
    5cf5:	e8 05 f7 ff ff       	call   53ff <get_inode>
    5cfa:	83 c4 10             	add    $0x10,%esp
    5cfd:	89 45 cc             	mov    %eax,-0x34(%ebp)
    5d00:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    5d04:	75 10                	jne    5d16 <do_unlink+0x86>
    5d06:	83 ec 0c             	sub    $0xc,%esp
    5d09:	68 25 90 00 00       	push   $0x9025
    5d0e:	e8 7b d2 ff ff       	call   2f8e <panic>
    5d13:	83 c4 10             	add    $0x10,%esp
    5d16:	8b 45 88             	mov    -0x78(%ebp),%eax
    5d19:	85 c0                	test   %eax,%eax
    5d1b:	7e 10                	jle    5d2d <do_unlink+0x9d>
    5d1d:	83 ec 0c             	sub    $0xc,%esp
    5d20:	68 40 90 00 00       	push   $0x9040
    5d25:	e8 64 d2 ff ff       	call   2f8e <panic>
    5d2a:	83 c4 10             	add    $0x10,%esp
    5d2d:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    5d33:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5d36:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5d39:	8d 50 07             	lea    0x7(%eax),%edx
    5d3c:	85 c0                	test   %eax,%eax
    5d3e:	0f 48 c2             	cmovs  %edx,%eax
    5d41:	c1 f8 03             	sar    $0x3,%eax
    5d44:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    5d47:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5d4a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5d50:	85 c0                	test   %eax,%eax
    5d52:	0f 48 c2             	cmovs  %edx,%eax
    5d55:	c1 f8 09             	sar    $0x9,%eax
    5d58:	89 45 c0             	mov    %eax,-0x40(%ebp)
    5d5b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5d5e:	99                   	cltd   
    5d5f:	c1 ea 1d             	shr    $0x1d,%edx
    5d62:	01 d0                	add    %edx,%eax
    5d64:	83 e0 07             	and    $0x7,%eax
    5d67:	29 d0                	sub    %edx,%eax
    5d69:	89 45 bc             	mov    %eax,-0x44(%ebp)
    5d6c:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
    5d73:	a1 20 c0 00 00       	mov    0xc020,%eax
    5d78:	8b 55 c0             	mov    -0x40(%ebp),%edx
    5d7b:	83 c2 02             	add    $0x2,%edx
    5d7e:	83 ec 0c             	sub    $0xc,%esp
    5d81:	6a 07                	push   $0x7
    5d83:	68 00 02 00 00       	push   $0x200
    5d88:	50                   	push   %eax
    5d89:	ff 75 b8             	pushl  -0x48(%ebp)
    5d8c:	52                   	push   %edx
    5d8d:	e8 fd eb ff ff       	call   498f <rd_wt>
    5d92:	83 c4 20             	add    $0x20,%esp
    5d95:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5d9b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5d9e:	01 d0                	add    %edx,%eax
    5da0:	0f b6 10             	movzbl (%eax),%edx
    5da3:	8b 45 bc             	mov    -0x44(%ebp),%eax
    5da6:	bb 01 00 00 00       	mov    $0x1,%ebx
    5dab:	89 c1                	mov    %eax,%ecx
    5dad:	d3 e3                	shl    %cl,%ebx
    5daf:	89 d8                	mov    %ebx,%eax
    5db1:	f7 d0                	not    %eax
    5db3:	89 c3                	mov    %eax,%ebx
    5db5:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5dbb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5dbe:	01 c8                	add    %ecx,%eax
    5dc0:	21 da                	and    %ebx,%edx
    5dc2:	88 10                	mov    %dl,(%eax)
    5dc4:	a1 20 c0 00 00       	mov    0xc020,%eax
    5dc9:	8b 55 c0             	mov    -0x40(%ebp),%edx
    5dcc:	83 c2 02             	add    $0x2,%edx
    5dcf:	83 ec 0c             	sub    $0xc,%esp
    5dd2:	6a 0a                	push   $0xa
    5dd4:	68 00 02 00 00       	push   $0x200
    5dd9:	50                   	push   %eax
    5dda:	ff 75 b8             	pushl  -0x48(%ebp)
    5ddd:	52                   	push   %edx
    5dde:	e8 ac eb ff ff       	call   498f <rd_wt>
    5de3:	83 c4 20             	add    $0x20,%esp
    5de6:	e8 c9 08 00 00       	call   66b4 <get_super_block>
    5deb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    5dee:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    5df4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    5df7:	8b 00                	mov    (%eax),%eax
    5df9:	29 c2                	sub    %eax,%edx
    5dfb:	89 d0                	mov    %edx,%eax
    5dfd:	83 c0 01             	add    $0x1,%eax
    5e00:	89 45 b0             	mov    %eax,-0x50(%ebp)
    5e03:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5e06:	8d 50 07             	lea    0x7(%eax),%edx
    5e09:	85 c0                	test   %eax,%eax
    5e0b:	0f 48 c2             	cmovs  %edx,%eax
    5e0e:	c1 f8 03             	sar    $0x3,%eax
    5e11:	89 45 ac             	mov    %eax,-0x54(%ebp)
    5e14:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5e17:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5e1d:	85 c0                	test   %eax,%eax
    5e1f:	0f 48 c2             	cmovs  %edx,%eax
    5e22:	c1 f8 09             	sar    $0x9,%eax
    5e25:	89 45 a8             	mov    %eax,-0x58(%ebp)
    5e28:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5e2b:	99                   	cltd   
    5e2c:	c1 ea 1d             	shr    $0x1d,%edx
    5e2f:	01 d0                	add    %edx,%eax
    5e31:	83 e0 07             	and    $0x7,%eax
    5e34:	29 d0                	sub    %edx,%eax
    5e36:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    5e39:	b8 08 00 00 00       	mov    $0x8,%eax
    5e3e:	2b 45 a4             	sub    -0x5c(%ebp),%eax
    5e41:	8b 55 b0             	mov    -0x50(%ebp),%edx
    5e44:	29 c2                	sub    %eax,%edx
    5e46:	89 d0                	mov    %edx,%eax
    5e48:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5e4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e4e:	8d 50 07             	lea    0x7(%eax),%edx
    5e51:	85 c0                	test   %eax,%eax
    5e53:	0f 48 c2             	cmovs  %edx,%eax
    5e56:	c1 f8 03             	sar    $0x3,%eax
    5e59:	89 45 a0             	mov    %eax,-0x60(%ebp)
    5e5c:	a1 20 c0 00 00       	mov    0xc020,%eax
    5e61:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    5e64:	8b 52 04             	mov    0x4(%edx),%edx
    5e67:	8d 4a 02             	lea    0x2(%edx),%ecx
    5e6a:	8b 55 a8             	mov    -0x58(%ebp),%edx
    5e6d:	01 ca                	add    %ecx,%edx
    5e6f:	83 ec 0c             	sub    $0xc,%esp
    5e72:	6a 07                	push   $0x7
    5e74:	68 00 02 00 00       	push   $0x200
    5e79:	50                   	push   %eax
    5e7a:	ff 75 b8             	pushl  -0x48(%ebp)
    5e7d:	52                   	push   %edx
    5e7e:	e8 0c eb ff ff       	call   498f <rd_wt>
    5e83:	83 c4 20             	add    $0x20,%esp
    5e86:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5e8c:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5e8f:	01 d0                	add    %edx,%eax
    5e91:	0f b6 10             	movzbl (%eax),%edx
    5e94:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5e97:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    5e9c:	89 c1                	mov    %eax,%ecx
    5e9e:	d3 e3                	shl    %cl,%ebx
    5ea0:	89 d8                	mov    %ebx,%eax
    5ea2:	f7 d0                	not    %eax
    5ea4:	89 c3                	mov    %eax,%ebx
    5ea6:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5eac:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5eaf:	01 c8                	add    %ecx,%eax
    5eb1:	21 da                	and    %ebx,%edx
    5eb3:	88 10                	mov    %dl,(%eax)
    5eb5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    5ebc:	8b 45 a8             	mov    -0x58(%ebp),%eax
    5ebf:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5ec2:	eb 6a                	jmp    5f2e <do_unlink+0x29e>
    5ec4:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    5ecb:	75 4b                	jne    5f18 <do_unlink+0x288>
    5ecd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5ed4:	a1 20 c0 00 00       	mov    0xc020,%eax
    5ed9:	83 ec 0c             	sub    $0xc,%esp
    5edc:	6a 0a                	push   $0xa
    5ede:	68 00 02 00 00       	push   $0x200
    5ee3:	50                   	push   %eax
    5ee4:	ff 75 b8             	pushl  -0x48(%ebp)
    5ee7:	ff 75 ec             	pushl  -0x14(%ebp)
    5eea:	e8 a0 ea ff ff       	call   498f <rd_wt>
    5eef:	83 c4 20             	add    $0x20,%esp
    5ef2:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5ef8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5efb:	8d 48 01             	lea    0x1(%eax),%ecx
    5efe:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    5f01:	83 ec 0c             	sub    $0xc,%esp
    5f04:	6a 07                	push   $0x7
    5f06:	68 00 02 00 00       	push   $0x200
    5f0b:	52                   	push   %edx
    5f0c:	ff 75 b8             	pushl  -0x48(%ebp)
    5f0f:	50                   	push   %eax
    5f10:	e8 7a ea ff ff       	call   498f <rd_wt>
    5f15:	83 c4 20             	add    $0x20,%esp
    5f18:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5f1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f21:	01 d0                	add    %edx,%eax
    5f23:	c6 00 00             	movb   $0x0,(%eax)
    5f26:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5f2a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
    5f2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f31:	3b 45 a0             	cmp    -0x60(%ebp),%eax
    5f34:	7c 8e                	jl     5ec4 <do_unlink+0x234>
    5f36:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    5f3d:	75 4b                	jne    5f8a <do_unlink+0x2fa>
    5f3f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5f46:	a1 20 c0 00 00       	mov    0xc020,%eax
    5f4b:	83 ec 0c             	sub    $0xc,%esp
    5f4e:	6a 0a                	push   $0xa
    5f50:	68 00 02 00 00       	push   $0x200
    5f55:	50                   	push   %eax
    5f56:	ff 75 b8             	pushl  -0x48(%ebp)
    5f59:	ff 75 ec             	pushl  -0x14(%ebp)
    5f5c:	e8 2e ea ff ff       	call   498f <rd_wt>
    5f61:	83 c4 20             	add    $0x20,%esp
    5f64:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5f6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5f6d:	8d 48 01             	lea    0x1(%eax),%ecx
    5f70:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    5f73:	83 ec 0c             	sub    $0xc,%esp
    5f76:	6a 07                	push   $0x7
    5f78:	68 00 02 00 00       	push   $0x200
    5f7d:	52                   	push   %edx
    5f7e:	ff 75 b8             	pushl  -0x48(%ebp)
    5f81:	50                   	push   %eax
    5f82:	e8 08 ea ff ff       	call   498f <rd_wt>
    5f87:	83 c4 20             	add    $0x20,%esp
    5f8a:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5f90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f93:	01 d0                	add    %edx,%eax
    5f95:	0f b6 10             	movzbl (%eax),%edx
    5f98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f9b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    5fa0:	89 c1                	mov    %eax,%ecx
    5fa2:	d3 e3                	shl    %cl,%ebx
    5fa4:	89 d8                	mov    %ebx,%eax
    5fa6:	89 c3                	mov    %eax,%ebx
    5fa8:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5fae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5fb1:	01 c8                	add    %ecx,%eax
    5fb3:	21 da                	and    %ebx,%edx
    5fb5:	88 10                	mov    %dl,(%eax)
    5fb7:	a1 20 c0 00 00       	mov    0xc020,%eax
    5fbc:	83 ec 0c             	sub    $0xc,%esp
    5fbf:	6a 0a                	push   $0xa
    5fc1:	68 00 02 00 00       	push   $0x200
    5fc6:	50                   	push   %eax
    5fc7:	ff 75 b8             	pushl  -0x48(%ebp)
    5fca:	ff 75 ec             	pushl  -0x14(%ebp)
    5fcd:	e8 bd e9 ff ff       	call   498f <rd_wt>
    5fd2:	83 c4 20             	add    $0x20,%esp
    5fd5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
    5fdc:	00 00 00 
    5fdf:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
    5fe6:	00 00 00 
    5fe9:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
    5ff0:	00 00 00 
    5ff3:	83 ec 0c             	sub    $0xc,%esp
    5ff6:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5ffc:	50                   	push   %eax
    5ffd:	e8 ce 04 00 00       	call   64d0 <sync_inode>
    6002:	83 c4 10             	add    $0x10,%esp
    6005:	83 ec 0c             	sub    $0xc,%esp
    6008:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    600e:	50                   	push   %eax
    600f:	e8 10 06 00 00       	call   6624 <put_inode>
    6014:	83 c4 10             	add    $0x10,%esp
    6017:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    601a:	8b 00                	mov    (%eax),%eax
    601c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    601f:	c7 45 98 40 11 01 00 	movl   $0x11140,-0x68(%ebp)
    6026:	8b 45 98             	mov    -0x68(%ebp),%eax
    6029:	8b 40 04             	mov    0x4(%eax),%eax
    602c:	89 45 94             	mov    %eax,-0x6c(%ebp)
    602f:	8b 45 98             	mov    -0x68(%ebp),%eax
    6032:	8b 40 0c             	mov    0xc(%eax),%eax
    6035:	89 45 90             	mov    %eax,-0x70(%ebp)
    6038:	8b 45 94             	mov    -0x6c(%ebp),%eax
    603b:	c1 e8 04             	shr    $0x4,%eax
    603e:	89 45 8c             	mov    %eax,-0x74(%ebp)
    6041:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    6048:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    604f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6056:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    605d:	e9 a3 00 00 00       	jmp    6105 <do_unlink+0x475>
    6062:	a1 20 c0 00 00       	mov    0xc020,%eax
    6067:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    606a:	8b 55 d8             	mov    -0x28(%ebp),%edx
    606d:	01 ca                	add    %ecx,%edx
    606f:	83 ec 0c             	sub    $0xc,%esp
    6072:	6a 07                	push   $0x7
    6074:	68 00 02 00 00       	push   $0x200
    6079:	50                   	push   %eax
    607a:	ff 75 b8             	pushl  -0x48(%ebp)
    607d:	52                   	push   %edx
    607e:	e8 0c e9 ff ff       	call   498f <rd_wt>
    6083:	83 c4 20             	add    $0x20,%esp
    6086:	a1 20 c0 00 00       	mov    0xc020,%eax
    608b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    608e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6095:	eb 51                	jmp    60e8 <do_unlink+0x458>
    6097:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    609b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    609e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    60a1:	7f 4f                	jg     60f2 <do_unlink+0x462>
    60a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    60a6:	83 c0 10             	add    $0x10,%eax
    60a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    60ac:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    60af:	83 c0 04             	add    $0x4,%eax
    60b2:	83 ec 08             	sub    $0x8,%esp
    60b5:	ff 75 08             	pushl  0x8(%ebp)
    60b8:	50                   	push   %eax
    60b9:	e8 49 da ff ff       	call   3b07 <strcmp>
    60be:	83 c4 10             	add    $0x10,%esp
    60c1:	85 c0                	test   %eax,%eax
    60c3:	75 1b                	jne    60e0 <do_unlink+0x450>
    60c5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    60cc:	83 ec 04             	sub    $0x4,%esp
    60cf:	6a 10                	push   $0x10
    60d1:	6a 00                	push   $0x0
    60d3:	ff 75 d4             	pushl  -0x2c(%ebp)
    60d6:	e8 de 30 00 00       	call   91b9 <Memset>
    60db:	83 c4 10             	add    $0x10,%esp
    60de:	eb 13                	jmp    60f3 <do_unlink+0x463>
    60e0:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    60e4:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
    60e8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    60eb:	3b 45 90             	cmp    -0x70(%ebp),%eax
    60ee:	7c a7                	jl     6097 <do_unlink+0x407>
    60f0:	eb 01                	jmp    60f3 <do_unlink+0x463>
    60f2:	90                   	nop
    60f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    60f6:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    60f9:	7f 16                	jg     6111 <do_unlink+0x481>
    60fb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    60ff:	75 10                	jne    6111 <do_unlink+0x481>
    6101:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6105:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6108:	3b 45 90             	cmp    -0x70(%ebp),%eax
    610b:	0f 8c 51 ff ff ff    	jl     6062 <do_unlink+0x3d2>
    6111:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6114:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    6117:	75 17                	jne    6130 <do_unlink+0x4a0>
    6119:	8b 45 98             	mov    -0x68(%ebp),%eax
    611c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    611f:	89 50 04             	mov    %edx,0x4(%eax)
    6122:	83 ec 0c             	sub    $0xc,%esp
    6125:	ff 75 98             	pushl  -0x68(%ebp)
    6128:	e8 a3 03 00 00       	call   64d0 <sync_inode>
    612d:	83 c4 10             	add    $0x10,%esp
    6130:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    6134:	74 24                	je     615a <do_unlink+0x4ca>
    6136:	a1 20 c0 00 00       	mov    0xc020,%eax
    613b:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    613e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6141:	01 ca                	add    %ecx,%edx
    6143:	83 ec 0c             	sub    $0xc,%esp
    6146:	6a 0a                	push   $0xa
    6148:	68 00 02 00 00       	push   $0x200
    614d:	50                   	push   %eax
    614e:	ff 75 b8             	pushl  -0x48(%ebp)
    6151:	52                   	push   %edx
    6152:	e8 38 e8 ff ff       	call   498f <rd_wt>
    6157:	83 c4 20             	add    $0x20,%esp
    615a:	90                   	nop
    615b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    615e:	c9                   	leave  
    615f:	c3                   	ret    

00006160 <do_rdwt>:
    6160:	55                   	push   %ebp
    6161:	89 e5                	mov    %esp,%ebp
    6163:	81 ec a8 00 00 00    	sub    $0xa8,%esp
    6169:	8b 45 08             	mov    0x8(%ebp),%eax
    616c:	8b 40 68             	mov    0x68(%eax),%eax
    616f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    6172:	8b 45 08             	mov    0x8(%ebp),%eax
    6175:	8b 40 50             	mov    0x50(%eax),%eax
    6178:	89 45 d8             	mov    %eax,-0x28(%ebp)
    617b:	8b 45 08             	mov    0x8(%ebp),%eax
    617e:	8b 40 5c             	mov    0x5c(%eax),%eax
    6181:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    6184:	8b 45 08             	mov    0x8(%ebp),%eax
    6187:	8b 00                	mov    (%eax),%eax
    6189:	89 45 d0             	mov    %eax,-0x30(%ebp)
    618c:	8b 45 08             	mov    0x8(%ebp),%eax
    618f:	8b 40 10             	mov    0x10(%eax),%eax
    6192:	89 45 cc             	mov    %eax,-0x34(%ebp)
    6195:	8b 45 08             	mov    0x8(%ebp),%eax
    6198:	8b 40 40             	mov    0x40(%eax),%eax
    619b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    619e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    61a1:	6b d0 68             	imul   $0x68,%eax,%edx
    61a4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    61a7:	01 d0                	add    %edx,%eax
    61a9:	83 c0 1c             	add    $0x1c,%eax
    61ac:	8b 04 85 8c 11 08 00 	mov    0x8118c(,%eax,4),%eax
    61b3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    61b6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    61b9:	8b 40 08             	mov    0x8(%eax),%eax
    61bc:	89 45 c0             	mov    %eax,-0x40(%ebp)
    61bf:	8b 45 08             	mov    0x8(%ebp),%eax
    61c2:	8b 00                	mov    (%eax),%eax
    61c4:	89 45 bc             	mov    %eax,-0x44(%ebp)
    61c7:	83 ec 08             	sub    $0x8,%esp
    61ca:	ff 75 c0             	pushl  -0x40(%ebp)
    61cd:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    61d3:	50                   	push   %eax
    61d4:	e8 26 f2 ff ff       	call   53ff <get_inode>
    61d9:	83 c4 10             	add    $0x10,%esp
    61dc:	89 45 b8             	mov    %eax,-0x48(%ebp)
    61df:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
    61e3:	75 10                	jne    61f5 <do_rdwt+0x95>
    61e5:	83 ec 0c             	sub    $0xc,%esp
    61e8:	68 78 90 00 00       	push   $0x9078
    61ed:	e8 9c cd ff ff       	call   2f8e <panic>
    61f2:	83 c4 10             	add    $0x10,%esp
    61f5:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    61fb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    61fe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    6201:	8b 40 04             	mov    0x4(%eax),%eax
    6204:	89 45 b0             	mov    %eax,-0x50(%ebp)
    6207:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    620b:	74 22                	je     622f <do_rdwt+0xcf>
    620d:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    6211:	74 1c                	je     622f <do_rdwt+0xcf>
    6213:	68 ba 04 00 00       	push   $0x4ba
    6218:	68 5c 8f 00 00       	push   $0x8f5c
    621d:	68 5c 8f 00 00       	push   $0x8f5c
    6222:	68 88 90 00 00       	push   $0x9088
    6227:	e8 80 cd ff ff       	call   2fac <assertion_failure>
    622c:	83 c4 10             	add    $0x10,%esp
    622f:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
    6235:	83 f8 01             	cmp    $0x1,%eax
    6238:	75 4a                	jne    6284 <do_rdwt+0x124>
    623a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    623e:	75 09                	jne    6249 <do_rdwt+0xe9>
    6240:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
    6247:	eb 0d                	jmp    6256 <do_rdwt+0xf6>
    6249:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    624d:	75 07                	jne    6256 <do_rdwt+0xf6>
    624f:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
    6256:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6259:	8b 45 08             	mov    0x8(%ebp),%eax
    625c:	89 50 68             	mov    %edx,0x68(%eax)
    625f:	8b 55 bc             	mov    -0x44(%ebp),%edx
    6262:	8b 45 08             	mov    0x8(%ebp),%eax
    6265:	89 50 58             	mov    %edx,0x58(%eax)
    6268:	83 ec 04             	sub    $0x4,%esp
    626b:	6a 00                	push   $0x0
    626d:	ff 75 08             	pushl  0x8(%ebp)
    6270:	6a 03                	push   $0x3
    6272:	e8 a1 d5 ff ff       	call   3818 <send_rec>
    6277:	83 c4 10             	add    $0x10,%esp
    627a:	b8 00 00 00 00       	mov    $0x0,%eax
    627f:	e9 4a 02 00 00       	jmp    64ce <do_rdwt+0x36e>
    6284:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    6288:	75 12                	jne    629c <do_rdwt+0x13c>
    628a:	8b 45 b0             	mov    -0x50(%ebp),%eax
    628d:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
    6290:	75 0a                	jne    629c <do_rdwt+0x13c>
    6292:	b8 00 00 00 00       	mov    $0x0,%eax
    6297:	e9 32 02 00 00       	jmp    64ce <do_rdwt+0x36e>
    629c:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    62a0:	75 18                	jne    62ba <do_rdwt+0x15a>
    62a2:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    62a8:	c1 e0 09             	shl    $0x9,%eax
    62ab:	39 45 b0             	cmp    %eax,-0x50(%ebp)
    62ae:	75 0a                	jne    62ba <do_rdwt+0x15a>
    62b0:	b8 00 00 00 00       	mov    $0x0,%eax
    62b5:	e9 14 02 00 00       	jmp    64ce <do_rdwt+0x36e>
    62ba:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    62be:	75 14                	jne    62d4 <do_rdwt+0x174>
    62c0:	8b 55 b0             	mov    -0x50(%ebp),%edx
    62c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    62c6:	01 d0                	add    %edx,%eax
    62c8:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
    62cb:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
    62cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    62d2:	eb 19                	jmp    62ed <do_rdwt+0x18d>
    62d4:	8b 55 b0             	mov    -0x50(%ebp),%edx
    62d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    62da:	01 c2                	add    %eax,%edx
    62dc:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    62e2:	c1 e0 09             	shl    $0x9,%eax
    62e5:	39 c2                	cmp    %eax,%edx
    62e7:	0f 4e c2             	cmovle %edx,%eax
    62ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
    62ed:	8b 45 b0             	mov    -0x50(%ebp),%eax
    62f0:	99                   	cltd   
    62f1:	c1 ea 17             	shr    $0x17,%edx
    62f4:	01 d0                	add    %edx,%eax
    62f6:	25 ff 01 00 00       	and    $0x1ff,%eax
    62fb:	29 d0                	sub    %edx,%eax
    62fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6300:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    6306:	8b 45 b0             	mov    -0x50(%ebp),%eax
    6309:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    630f:	85 c0                	test   %eax,%eax
    6311:	0f 48 c1             	cmovs  %ecx,%eax
    6314:	c1 f8 09             	sar    $0x9,%eax
    6317:	01 d0                	add    %edx,%eax
    6319:	89 45 ac             	mov    %eax,-0x54(%ebp)
    631c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    6322:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6325:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    632b:	85 c0                	test   %eax,%eax
    632d:	0f 48 c1             	cmovs  %ecx,%eax
    6330:	c1 f8 09             	sar    $0x9,%eax
    6333:	01 d0                	add    %edx,%eax
    6335:	89 45 a8             	mov    %eax,-0x58(%ebp)
    6338:	8b 45 a8             	mov    -0x58(%ebp),%eax
    633b:	2b 45 ac             	sub    -0x54(%ebp),%eax
    633e:	ba 00 00 10 00       	mov    $0x100000,%edx
    6343:	39 d0                	cmp    %edx,%eax
    6345:	7d 0b                	jge    6352 <do_rdwt+0x1f2>
    6347:	8b 45 a8             	mov    -0x58(%ebp),%eax
    634a:	2b 45 ac             	sub    -0x54(%ebp),%eax
    634d:	83 c0 01             	add    $0x1,%eax
    6350:	eb 05                	jmp    6357 <do_rdwt+0x1f7>
    6352:	b8 00 00 10 00       	mov    $0x100000,%eax
    6357:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    635a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    635d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6360:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    6367:	8b 45 08             	mov    0x8(%ebp),%eax
    636a:	8b 00                	mov    (%eax),%eax
    636c:	83 ec 0c             	sub    $0xc,%esp
    636f:	50                   	push   %eax
    6370:	e8 53 05 00 00       	call   68c8 <pid2proc>
    6375:	83 c4 10             	add    $0x10,%esp
    6378:	89 45 a0             	mov    %eax,-0x60(%ebp)
    637b:	8b 45 a0             	mov    -0x60(%ebp),%eax
    637e:	8b 40 0c             	mov    0xc(%eax),%eax
    6381:	89 45 9c             	mov    %eax,-0x64(%ebp)
    6384:	8b 45 9c             	mov    -0x64(%ebp),%eax
    6387:	83 ec 08             	sub    $0x8,%esp
    638a:	ff 75 a0             	pushl  -0x60(%ebp)
    638d:	50                   	push   %eax
    638e:	e8 1e 06 00 00       	call   69b1 <Seg2PhyAddrLDT>
    6393:	83 c4 10             	add    $0x10,%esp
    6396:	89 45 98             	mov    %eax,-0x68(%ebp)
    6399:	8b 55 98             	mov    -0x68(%ebp),%edx
    639c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    639f:	01 d0                	add    %edx,%eax
    63a1:	89 45 94             	mov    %eax,-0x6c(%ebp)
    63a4:	8b 45 ac             	mov    -0x54(%ebp),%eax
    63a7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    63aa:	e9 c7 00 00 00       	jmp    6476 <do_rdwt+0x316>
    63af:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    63b2:	c1 e0 09             	shl    $0x9,%eax
    63b5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    63b8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    63bb:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
    63bf:	89 45 90             	mov    %eax,-0x70(%ebp)
    63c2:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
    63c9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    63cc:	c1 e0 09             	shl    $0x9,%eax
    63cf:	89 c2                	mov    %eax,%edx
    63d1:	a1 20 c0 00 00       	mov    0xc020,%eax
    63d6:	83 ec 0c             	sub    $0xc,%esp
    63d9:	6a 07                	push   $0x7
    63db:	52                   	push   %edx
    63dc:	50                   	push   %eax
    63dd:	ff 75 8c             	pushl  -0x74(%ebp)
    63e0:	ff 75 e0             	pushl  -0x20(%ebp)
    63e3:	e8 a7 e5 ff ff       	call   498f <rd_wt>
    63e8:	83 c4 20             	add    $0x20,%esp
    63eb:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    63ef:	75 25                	jne    6416 <do_rdwt+0x2b6>
    63f1:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    63f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    63fa:	01 d0                	add    %edx,%eax
    63fc:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
    63ff:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    6402:	01 ca                	add    %ecx,%edx
    6404:	83 ec 04             	sub    $0x4,%esp
    6407:	ff 75 90             	pushl  -0x70(%ebp)
    640a:	50                   	push   %eax
    640b:	52                   	push   %edx
    640c:	e8 7a 2d 00 00       	call   918b <Memcpy>
    6411:	83 c4 10             	add    $0x10,%esp
    6414:	eb 47                	jmp    645d <do_rdwt+0x2fd>
    6416:	8b 55 94             	mov    -0x6c(%ebp),%edx
    6419:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    641c:	01 d0                	add    %edx,%eax
    641e:	89 c1                	mov    %eax,%ecx
    6420:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    6426:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6429:	01 d0                	add    %edx,%eax
    642b:	83 ec 04             	sub    $0x4,%esp
    642e:	ff 75 90             	pushl  -0x70(%ebp)
    6431:	51                   	push   %ecx
    6432:	50                   	push   %eax
    6433:	e8 53 2d 00 00       	call   918b <Memcpy>
    6438:	83 c4 10             	add    $0x10,%esp
    643b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    643e:	c1 e0 09             	shl    $0x9,%eax
    6441:	89 c2                	mov    %eax,%edx
    6443:	a1 20 c0 00 00       	mov    0xc020,%eax
    6448:	83 ec 0c             	sub    $0xc,%esp
    644b:	6a 0a                	push   $0xa
    644d:	52                   	push   %edx
    644e:	50                   	push   %eax
    644f:	ff 75 8c             	pushl  -0x74(%ebp)
    6452:	ff 75 e0             	pushl  -0x20(%ebp)
    6455:	e8 35 e5 ff ff       	call   498f <rd_wt>
    645a:	83 c4 20             	add    $0x20,%esp
    645d:	8b 45 90             	mov    -0x70(%ebp),%eax
    6460:	29 45 e8             	sub    %eax,-0x18(%ebp)
    6463:	8b 45 90             	mov    -0x70(%ebp),%eax
    6466:	01 45 e4             	add    %eax,-0x1c(%ebp)
    6469:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6470:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    6473:	01 45 e0             	add    %eax,-0x20(%ebp)
    6476:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6479:	3b 45 a8             	cmp    -0x58(%ebp),%eax
    647c:	7f 0a                	jg     6488 <do_rdwt+0x328>
    647e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    6482:	0f 85 27 ff ff ff    	jne    63af <do_rdwt+0x24f>
    6488:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    648b:	8b 50 04             	mov    0x4(%eax),%edx
    648e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6491:	01 c2                	add    %eax,%edx
    6493:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    6496:	89 50 04             	mov    %edx,0x4(%eax)
    6499:	8b 55 b0             	mov    -0x50(%ebp),%edx
    649c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    649f:	01 c2                	add    %eax,%edx
    64a1:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    64a7:	39 c2                	cmp    %eax,%edx
    64a9:	7e 20                	jle    64cb <do_rdwt+0x36b>
    64ab:	8b 55 b0             	mov    -0x50(%ebp),%edx
    64ae:	8b 45 d8             	mov    -0x28(%ebp),%eax
    64b1:	01 d0                	add    %edx,%eax
    64b3:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
    64b9:	83 ec 0c             	sub    $0xc,%esp
    64bc:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    64c2:	50                   	push   %eax
    64c3:	e8 08 00 00 00       	call   64d0 <sync_inode>
    64c8:	83 c4 10             	add    $0x10,%esp
    64cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    64ce:	c9                   	leave  
    64cf:	c3                   	ret    

000064d0 <sync_inode>:
    64d0:	55                   	push   %ebp
    64d1:	89 e5                	mov    %esp,%ebp
    64d3:	53                   	push   %ebx
    64d4:	83 ec 34             	sub    $0x34,%esp
    64d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    64de:	eb 74                	jmp    6554 <sync_inode+0x84>
    64e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    64e3:	89 d0                	mov    %edx,%eax
    64e5:	c1 e0 02             	shl    $0x2,%eax
    64e8:	01 d0                	add    %edx,%eax
    64ea:	c1 e0 03             	shl    $0x3,%eax
    64ed:	05 50 07 01 00       	add    $0x10750,%eax
    64f2:	8b 10                	mov    (%eax),%edx
    64f4:	8b 45 08             	mov    0x8(%ebp),%eax
    64f7:	8b 40 10             	mov    0x10(%eax),%eax
    64fa:	39 c2                	cmp    %eax,%edx
    64fc:	75 52                	jne    6550 <sync_inode+0x80>
    64fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6501:	89 d0                	mov    %edx,%eax
    6503:	c1 e0 02             	shl    $0x2,%eax
    6506:	01 d0                	add    %edx,%eax
    6508:	c1 e0 03             	shl    $0x3,%eax
    650b:	8d 90 40 07 01 00    	lea    0x10740(%eax),%edx
    6511:	8b 45 08             	mov    0x8(%ebp),%eax
    6514:	8b 08                	mov    (%eax),%ecx
    6516:	89 0a                	mov    %ecx,(%edx)
    6518:	8b 48 04             	mov    0x4(%eax),%ecx
    651b:	89 4a 04             	mov    %ecx,0x4(%edx)
    651e:	8b 48 08             	mov    0x8(%eax),%ecx
    6521:	89 4a 08             	mov    %ecx,0x8(%edx)
    6524:	8b 48 0c             	mov    0xc(%eax),%ecx
    6527:	89 4a 0c             	mov    %ecx,0xc(%edx)
    652a:	8b 48 10             	mov    0x10(%eax),%ecx
    652d:	89 4a 10             	mov    %ecx,0x10(%edx)
    6530:	8b 48 14             	mov    0x14(%eax),%ecx
    6533:	89 4a 14             	mov    %ecx,0x14(%edx)
    6536:	8b 48 18             	mov    0x18(%eax),%ecx
    6539:	89 4a 18             	mov    %ecx,0x18(%edx)
    653c:	8b 48 1c             	mov    0x1c(%eax),%ecx
    653f:	89 4a 1c             	mov    %ecx,0x1c(%edx)
    6542:	8b 48 20             	mov    0x20(%eax),%ecx
    6545:	89 4a 20             	mov    %ecx,0x20(%edx)
    6548:	8b 40 24             	mov    0x24(%eax),%eax
    654b:	89 42 24             	mov    %eax,0x24(%edx)
    654e:	eb 0a                	jmp    655a <sync_inode+0x8a>
    6550:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6554:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    6558:	7e 86                	jle    64e0 <sync_inode+0x10>
    655a:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
    6561:	8b 45 08             	mov    0x8(%ebp),%eax
    6564:	8b 40 10             	mov    0x10(%eax),%eax
    6567:	89 45 ec             	mov    %eax,-0x14(%ebp)
    656a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    656d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6570:	b8 00 02 00 00       	mov    $0x200,%eax
    6575:	99                   	cltd   
    6576:	f7 7d f0             	idivl  -0x10(%ebp)
    6579:	89 c3                	mov    %eax,%ebx
    657b:	89 c8                	mov    %ecx,%eax
    657d:	99                   	cltd   
    657e:	f7 fb                	idiv   %ebx
    6580:	89 55 e8             	mov    %edx,-0x18(%ebp)
    6583:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6586:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6589:	b8 00 02 00 00       	mov    $0x200,%eax
    658e:	99                   	cltd   
    658f:	f7 7d f0             	idivl  -0x10(%ebp)
    6592:	89 c3                	mov    %eax,%ebx
    6594:	89 c8                	mov    %ecx,%eax
    6596:	99                   	cltd   
    6597:	f7 fb                	idiv   %ebx
    6599:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    659c:	8b 45 08             	mov    0x8(%ebp),%eax
    659f:	8b 40 20             	mov    0x20(%eax),%eax
    65a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    65a5:	e8 0a 01 00 00       	call   66b4 <get_super_block>
    65aa:	89 45 dc             	mov    %eax,-0x24(%ebp)
    65ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
    65b0:	8b 40 04             	mov    0x4(%eax),%eax
    65b3:	8d 50 02             	lea    0x2(%eax),%edx
    65b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    65b9:	8b 40 08             	mov    0x8(%eax),%eax
    65bc:	01 c2                	add    %eax,%edx
    65be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    65c1:	01 d0                	add    %edx,%eax
    65c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    65c6:	a1 20 c0 00 00       	mov    0xc020,%eax
    65cb:	83 ec 0c             	sub    $0xc,%esp
    65ce:	6a 07                	push   $0x7
    65d0:	68 00 02 00 00       	push   $0x200
    65d5:	50                   	push   %eax
    65d6:	ff 75 e0             	pushl  -0x20(%ebp)
    65d9:	ff 75 d8             	pushl  -0x28(%ebp)
    65dc:	e8 ae e3 ff ff       	call   498f <rd_wt>
    65e1:	83 c4 20             	add    $0x20,%esp
    65e4:	a1 20 c0 00 00       	mov    0xc020,%eax
    65e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    65ec:	83 ec 04             	sub    $0x4,%esp
    65ef:	ff 75 f0             	pushl  -0x10(%ebp)
    65f2:	ff 75 08             	pushl  0x8(%ebp)
    65f5:	ff 75 d4             	pushl  -0x2c(%ebp)
    65f8:	e8 8e 2b 00 00       	call   918b <Memcpy>
    65fd:	83 c4 10             	add    $0x10,%esp
    6600:	a1 20 c0 00 00       	mov    0xc020,%eax
    6605:	83 ec 0c             	sub    $0xc,%esp
    6608:	6a 0a                	push   $0xa
    660a:	68 00 02 00 00       	push   $0x200
    660f:	50                   	push   %eax
    6610:	ff 75 e0             	pushl  -0x20(%ebp)
    6613:	ff 75 d8             	pushl  -0x28(%ebp)
    6616:	e8 74 e3 ff ff       	call   498f <rd_wt>
    661b:	83 c4 20             	add    $0x20,%esp
    661e:	90                   	nop
    661f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    6622:	c9                   	leave  
    6623:	c3                   	ret    

00006624 <put_inode>:
    6624:	55                   	push   %ebp
    6625:	89 e5                	mov    %esp,%ebp
    6627:	83 ec 08             	sub    $0x8,%esp
    662a:	8b 45 08             	mov    0x8(%ebp),%eax
    662d:	8b 40 24             	mov    0x24(%eax),%eax
    6630:	85 c0                	test   %eax,%eax
    6632:	7f 1c                	jg     6650 <put_inode+0x2c>
    6634:	68 54 05 00 00       	push   $0x554
    6639:	68 5c 8f 00 00       	push   $0x8f5c
    663e:	68 5c 8f 00 00       	push   $0x8f5c
    6643:	68 bc 90 00 00       	push   $0x90bc
    6648:	e8 5f c9 ff ff       	call   2fac <assertion_failure>
    664d:	83 c4 10             	add    $0x10,%esp
    6650:	8b 45 08             	mov    0x8(%ebp),%eax
    6653:	8b 40 24             	mov    0x24(%eax),%eax
    6656:	8d 50 ff             	lea    -0x1(%eax),%edx
    6659:	8b 45 08             	mov    0x8(%ebp),%eax
    665c:	89 50 24             	mov    %edx,0x24(%eax)
    665f:	90                   	nop
    6660:	c9                   	leave  
    6661:	c3                   	ret    

00006662 <do_close>:
    6662:	55                   	push   %ebp
    6663:	89 e5                	mov    %esp,%ebp
    6665:	a1 64 db 00 00       	mov    0xdb64,%eax
    666a:	8b 55 08             	mov    0x8(%ebp),%edx
    666d:	83 c2 1c             	add    $0x1c,%edx
    6670:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    6674:	8b 50 0c             	mov    0xc(%eax),%edx
    6677:	83 ea 01             	sub    $0x1,%edx
    667a:	89 50 0c             	mov    %edx,0xc(%eax)
    667d:	8b 40 0c             	mov    0xc(%eax),%eax
    6680:	85 c0                	test   %eax,%eax
    6682:	75 16                	jne    669a <do_close+0x38>
    6684:	a1 64 db 00 00       	mov    0xdb64,%eax
    6689:	8b 55 08             	mov    0x8(%ebp),%edx
    668c:	83 c2 1c             	add    $0x1c,%edx
    668f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    6693:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    669a:	a1 64 db 00 00       	mov    0xdb64,%eax
    669f:	8b 55 08             	mov    0x8(%ebp),%edx
    66a2:	83 c2 1c             	add    $0x1c,%edx
    66a5:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    66ac:	00 
    66ad:	b8 00 00 00 00       	mov    $0x0,%eax
    66b2:	5d                   	pop    %ebp
    66b3:	c3                   	ret    

000066b4 <get_super_block>:
    66b4:	55                   	push   %ebp
    66b5:	89 e5                	mov    %esp,%ebp
    66b7:	83 ec 08             	sub    $0x8,%esp
    66ba:	a1 20 c0 00 00       	mov    0xc020,%eax
    66bf:	83 ec 0c             	sub    $0xc,%esp
    66c2:	6a 07                	push   $0x7
    66c4:	68 00 02 00 00       	push   $0x200
    66c9:	50                   	push   %eax
    66ca:	6a 20                	push   $0x20
    66cc:	6a 01                	push   $0x1
    66ce:	e8 bc e2 ff ff       	call   498f <rd_wt>
    66d3:	83 c4 20             	add    $0x20,%esp
    66d6:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    66dc:	a1 24 c0 00 00       	mov    0xc024,%eax
    66e1:	8b 0a                	mov    (%edx),%ecx
    66e3:	89 08                	mov    %ecx,(%eax)
    66e5:	8b 4a 04             	mov    0x4(%edx),%ecx
    66e8:	89 48 04             	mov    %ecx,0x4(%eax)
    66eb:	8b 4a 08             	mov    0x8(%edx),%ecx
    66ee:	89 48 08             	mov    %ecx,0x8(%eax)
    66f1:	8b 4a 0c             	mov    0xc(%edx),%ecx
    66f4:	89 48 0c             	mov    %ecx,0xc(%eax)
    66f7:	8b 4a 10             	mov    0x10(%edx),%ecx
    66fa:	89 48 10             	mov    %ecx,0x10(%eax)
    66fd:	8b 4a 14             	mov    0x14(%edx),%ecx
    6700:	89 48 14             	mov    %ecx,0x14(%eax)
    6703:	8b 4a 18             	mov    0x18(%edx),%ecx
    6706:	89 48 18             	mov    %ecx,0x18(%eax)
    6709:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    670c:	89 48 1c             	mov    %ecx,0x1c(%eax)
    670f:	8b 52 20             	mov    0x20(%edx),%edx
    6712:	89 50 20             	mov    %edx,0x20(%eax)
    6715:	a1 24 c0 00 00       	mov    0xc024,%eax
    671a:	c9                   	leave  
    671b:	c3                   	ret    

0000671c <check>:
    671c:	55                   	push   %ebp
    671d:	89 e5                	mov    %esp,%ebp
    671f:	83 ec 18             	sub    $0x18,%esp
    6722:	c7 45 f4 80 11 08 00 	movl   $0x81180,-0xc(%ebp)
    6729:	eb 59                	jmp    6784 <check+0x68>
    672b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    672e:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    6734:	85 c0                	test   %eax,%eax
    6736:	74 45                	je     677d <check+0x61>
    6738:	8b 45 f4             	mov    -0xc(%ebp),%eax
    673b:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    6741:	83 f8 01             	cmp    $0x1,%eax
    6744:	74 37                	je     677d <check+0x61>
    6746:	c7 05 50 d7 00 00 02 	movl   $0x2802,0xd750
    674d:	28 00 00 
    6750:	83 ec 08             	sub    $0x8,%esp
    6753:	6a 0a                	push   $0xa
    6755:	68 cb 90 00 00       	push   $0x90cb
    675a:	e8 68 a9 ff ff       	call   10c7 <disp_str_colour>
    675f:	83 c4 10             	add    $0x10,%esp
    6762:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6765:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    676c:	0f be c0             	movsbl %al,%eax
    676f:	83 ec 0c             	sub    $0xc,%esp
    6772:	50                   	push   %eax
    6773:	e8 fc ae ff ff       	call   1674 <disp_int>
    6778:	83 c4 10             	add    $0x10,%esp
    677b:	eb fe                	jmp    677b <check+0x5f>
    677d:	81 45 f4 a0 01 00 00 	addl   $0x1a0,-0xc(%ebp)
    6784:	b8 a0 19 08 00       	mov    $0x819a0,%eax
    6789:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    678c:	72 9d                	jb     672b <check+0xf>
    678e:	90                   	nop
    678f:	c9                   	leave  
    6790:	c3                   	ret    

00006791 <schedule_process>:
    6791:	55                   	push   %ebp
    6792:	89 e5                	mov    %esp,%ebp
    6794:	83 ec 10             	sub    $0x10,%esp
    6797:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    679e:	eb 7e                	jmp    681e <schedule_process+0x8d>
    67a0:	c7 45 fc 80 11 08 00 	movl   $0x81180,-0x4(%ebp)
    67a7:	eb 31                	jmp    67da <schedule_process+0x49>
    67a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67ac:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    67b3:	84 c0                	test   %al,%al
    67b5:	75 1c                	jne    67d3 <schedule_process+0x42>
    67b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67ba:	8b 40 5c             	mov    0x5c(%eax),%eax
    67bd:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    67c0:	73 11                	jae    67d3 <schedule_process+0x42>
    67c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67c5:	8b 40 5c             	mov    0x5c(%eax),%eax
    67c8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    67cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67ce:	a3 60 db 00 00       	mov    %eax,0xdb60
    67d3:	81 45 fc a0 01 00 00 	addl   $0x1a0,-0x4(%ebp)
    67da:	b8 e0 50 08 00       	mov    $0x850e0,%eax
    67df:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    67e2:	72 c5                	jb     67a9 <schedule_process+0x18>
    67e4:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    67e8:	75 34                	jne    681e <schedule_process+0x8d>
    67ea:	c7 45 fc 80 11 08 00 	movl   $0x81180,-0x4(%ebp)
    67f1:	eb 21                	jmp    6814 <schedule_process+0x83>
    67f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67f6:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    67fd:	84 c0                	test   %al,%al
    67ff:	75 0c                	jne    680d <schedule_process+0x7c>
    6801:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6804:	8b 50 60             	mov    0x60(%eax),%edx
    6807:	8b 45 fc             	mov    -0x4(%ebp),%eax
    680a:	89 50 5c             	mov    %edx,0x5c(%eax)
    680d:	81 45 fc a0 01 00 00 	addl   $0x1a0,-0x4(%ebp)
    6814:	b8 e0 50 08 00       	mov    $0x850e0,%eax
    6819:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    681c:	72 d5                	jb     67f3 <schedule_process+0x62>
    681e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    6822:	0f 84 78 ff ff ff    	je     67a0 <schedule_process+0xf>
    6828:	a1 60 db 00 00       	mov    0xdb60,%eax
    682d:	8b 40 58             	mov    0x58(%eax),%eax
    6830:	83 f8 07             	cmp    $0x7,%eax
    6833:	75 07                	jne    683c <schedule_process+0xab>
    6835:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
    683c:	90                   	nop
    683d:	c9                   	leave  
    683e:	c3                   	ret    

0000683f <clock_handler>:
    683f:	55                   	push   %ebp
    6840:	89 e5                	mov    %esp,%ebp
    6842:	83 ec 08             	sub    $0x8,%esp
    6845:	a1 60 db 00 00       	mov    0xdb60,%eax
    684a:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    6851:	3c 02                	cmp    $0x2,%al
    6853:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    6858:	83 c0 01             	add    $0x1,%eax
    685b:	a3 a0 fe 00 00       	mov    %eax,0xfea0
    6860:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    6865:	3d cc ab ff 7f       	cmp    $0x7fffabcc,%eax
    686a:	76 0a                	jbe    6876 <clock_handler+0x37>
    686c:	c7 05 a0 fe 00 00 00 	movl   $0x0,0xfea0
    6873:	00 00 00 
    6876:	a1 60 db 00 00       	mov    0xdb60,%eax
    687b:	8b 40 5c             	mov    0x5c(%eax),%eax
    687e:	85 c0                	test   %eax,%eax
    6880:	74 0e                	je     6890 <clock_handler+0x51>
    6882:	a1 60 db 00 00       	mov    0xdb60,%eax
    6887:	8b 50 5c             	mov    0x5c(%eax),%edx
    688a:	83 ea 01             	sub    $0x1,%edx
    688d:	89 50 5c             	mov    %edx,0x5c(%eax)
    6890:	a1 90 f6 00 00       	mov    0xf690,%eax
    6895:	85 c0                	test   %eax,%eax
    6897:	74 0d                	je     68a6 <clock_handler+0x67>
    6899:	83 ec 0c             	sub    $0xc,%esp
    689c:	6a 00                	push   $0x0
    689e:	e8 ab d1 ff ff       	call   3a4e <inform_int>
    68a3:	83 c4 10             	add    $0x10,%esp
    68a6:	a1 54 d7 00 00       	mov    0xd754,%eax
    68ab:	85 c0                	test   %eax,%eax
    68ad:	75 13                	jne    68c2 <clock_handler+0x83>
    68af:	a1 60 db 00 00       	mov    0xdb60,%eax
    68b4:	8b 40 5c             	mov    0x5c(%eax),%eax
    68b7:	85 c0                	test   %eax,%eax
    68b9:	75 0a                	jne    68c5 <clock_handler+0x86>
    68bb:	e8 d1 fe ff ff       	call   6791 <schedule_process>
    68c0:	eb 04                	jmp    68c6 <clock_handler+0x87>
    68c2:	90                   	nop
    68c3:	eb 01                	jmp    68c6 <clock_handler+0x87>
    68c5:	90                   	nop
    68c6:	c9                   	leave  
    68c7:	c3                   	ret    

000068c8 <pid2proc>:
    68c8:	55                   	push   %ebp
    68c9:	89 e5                	mov    %esp,%ebp
    68cb:	83 ec 10             	sub    $0x10,%esp
    68ce:	8b 45 08             	mov    0x8(%ebp),%eax
    68d1:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    68d7:	05 80 11 08 00       	add    $0x81180,%eax
    68dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    68df:	8b 45 fc             	mov    -0x4(%ebp),%eax
    68e2:	c9                   	leave  
    68e3:	c3                   	ret    

000068e4 <proc2pid>:
    68e4:	55                   	push   %ebp
    68e5:	89 e5                	mov    %esp,%ebp
    68e7:	83 ec 10             	sub    $0x10,%esp
    68ea:	8b 45 08             	mov    0x8(%ebp),%eax
    68ed:	2d 80 11 08 00       	sub    $0x81180,%eax
    68f2:	c1 f8 05             	sar    $0x5,%eax
    68f5:	69 c0 c5 4e ec c4    	imul   $0xc4ec4ec5,%eax,%eax
    68fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
    68fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6901:	c9                   	leave  
    6902:	c3                   	ret    

00006903 <InitDescriptor>:
    6903:	55                   	push   %ebp
    6904:	89 e5                	mov    %esp,%ebp
    6906:	83 ec 04             	sub    $0x4,%esp
    6909:	8b 45 14             	mov    0x14(%ebp),%eax
    690c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
    6910:	8b 45 10             	mov    0x10(%ebp),%eax
    6913:	89 c2                	mov    %eax,%edx
    6915:	8b 45 08             	mov    0x8(%ebp),%eax
    6918:	66 89 10             	mov    %dx,(%eax)
    691b:	8b 45 0c             	mov    0xc(%ebp),%eax
    691e:	89 c2                	mov    %eax,%edx
    6920:	8b 45 08             	mov    0x8(%ebp),%eax
    6923:	66 89 50 02          	mov    %dx,0x2(%eax)
    6927:	8b 45 0c             	mov    0xc(%ebp),%eax
    692a:	c1 e8 10             	shr    $0x10,%eax
    692d:	89 c2                	mov    %eax,%edx
    692f:	8b 45 08             	mov    0x8(%ebp),%eax
    6932:	88 50 04             	mov    %dl,0x4(%eax)
    6935:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    6939:	89 c2                	mov    %eax,%edx
    693b:	8b 45 08             	mov    0x8(%ebp),%eax
    693e:	88 50 05             	mov    %dl,0x5(%eax)
    6941:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    6945:	66 c1 e8 08          	shr    $0x8,%ax
    6949:	c1 e0 04             	shl    $0x4,%eax
    694c:	89 c2                	mov    %eax,%edx
    694e:	8b 45 10             	mov    0x10(%ebp),%eax
    6951:	c1 e8 10             	shr    $0x10,%eax
    6954:	83 e0 0f             	and    $0xf,%eax
    6957:	09 c2                	or     %eax,%edx
    6959:	8b 45 08             	mov    0x8(%ebp),%eax
    695c:	88 50 06             	mov    %dl,0x6(%eax)
    695f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6962:	c1 e8 18             	shr    $0x18,%eax
    6965:	89 c2                	mov    %eax,%edx
    6967:	8b 45 08             	mov    0x8(%ebp),%eax
    696a:	88 50 07             	mov    %dl,0x7(%eax)
    696d:	90                   	nop
    696e:	c9                   	leave  
    696f:	c3                   	ret    

00006970 <Seg2PhyAddr>:
    6970:	55                   	push   %ebp
    6971:	89 e5                	mov    %esp,%ebp
    6973:	83 ec 10             	sub    $0x10,%esp
    6976:	8b 45 08             	mov    0x8(%ebp),%eax
    6979:	c1 e8 03             	shr    $0x3,%eax
    697c:	8b 14 c5 64 d7 00 00 	mov    0xd764(,%eax,8),%edx
    6983:	8b 04 c5 60 d7 00 00 	mov    0xd760(,%eax,8),%eax
    698a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    698d:	89 55 f8             	mov    %edx,-0x8(%ebp)
    6990:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    6994:	0f b7 c0             	movzwl %ax,%eax
    6997:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    699b:	0f b6 d2             	movzbl %dl,%edx
    699e:	c1 e2 10             	shl    $0x10,%edx
    69a1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    69a7:	09 d0                	or     %edx,%eax
    69a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    69ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    69af:	c9                   	leave  
    69b0:	c3                   	ret    

000069b1 <Seg2PhyAddrLDT>:
    69b1:	55                   	push   %ebp
    69b2:	89 e5                	mov    %esp,%ebp
    69b4:	83 ec 10             	sub    $0x10,%esp
    69b7:	8b 45 08             	mov    0x8(%ebp),%eax
    69ba:	c1 e8 03             	shr    $0x3,%eax
    69bd:	89 c2                	mov    %eax,%edx
    69bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    69c2:	83 c2 08             	add    $0x8,%edx
    69c5:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
    69c9:	8b 02                	mov    (%edx),%eax
    69cb:	8b 52 04             	mov    0x4(%edx),%edx
    69ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
    69d1:	89 55 f8             	mov    %edx,-0x8(%ebp)
    69d4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    69d8:	0f b7 c0             	movzwl %ax,%eax
    69db:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    69df:	0f b6 d2             	movzbl %dl,%edx
    69e2:	c1 e2 10             	shl    $0x10,%edx
    69e5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    69eb:	09 d0                	or     %edx,%eax
    69ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
    69f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    69f3:	c9                   	leave  
    69f4:	c3                   	ret    

000069f5 <VirAddr2PhyAddr>:
    69f5:	55                   	push   %ebp
    69f6:	89 e5                	mov    %esp,%ebp
    69f8:	83 ec 10             	sub    $0x10,%esp
    69fb:	8b 55 0c             	mov    0xc(%ebp),%edx
    69fe:	8b 45 08             	mov    0x8(%ebp),%eax
    6a01:	01 d0                	add    %edx,%eax
    6a03:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6a06:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6a09:	c9                   	leave  
    6a0a:	c3                   	ret    

00006a0b <v2l>:
    6a0b:	55                   	push   %ebp
    6a0c:	89 e5                	mov    %esp,%ebp
    6a0e:	83 ec 18             	sub    $0x18,%esp
    6a11:	83 ec 0c             	sub    $0xc,%esp
    6a14:	ff 75 08             	pushl  0x8(%ebp)
    6a17:	e8 ac fe ff ff       	call   68c8 <pid2proc>
    6a1c:	83 c4 10             	add    $0x10,%esp
    6a1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6a22:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    6a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6a2c:	83 ec 08             	sub    $0x8,%esp
    6a2f:	ff 75 f4             	pushl  -0xc(%ebp)
    6a32:	50                   	push   %eax
    6a33:	e8 79 ff ff ff       	call   69b1 <Seg2PhyAddrLDT>
    6a38:	83 c4 10             	add    $0x10,%esp
    6a3b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6a3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6a41:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a44:	01 d0                	add    %edx,%eax
    6a46:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6a49:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6a4c:	c9                   	leave  
    6a4d:	c3                   	ret    

00006a4e <init_propt>:
    6a4e:	55                   	push   %ebp
    6a4f:	89 e5                	mov    %esp,%ebp
    6a51:	53                   	push   %ebx
    6a52:	83 ec 24             	sub    $0x24,%esp
    6a55:	6a 0e                	push   $0xe
    6a57:	6a 08                	push   $0x8
    6a59:	68 6a 11 00 00       	push   $0x116a
    6a5e:	6a 20                	push   $0x20
    6a60:	e8 53 01 00 00       	call   6bb8 <InitInterruptDesc>
    6a65:	83 c4 10             	add    $0x10,%esp
    6a68:	6a 0e                	push   $0xe
    6a6a:	6a 08                	push   $0x8
    6a6c:	68 b3 11 00 00       	push   $0x11b3
    6a71:	6a 21                	push   $0x21
    6a73:	e8 40 01 00 00       	call   6bb8 <InitInterruptDesc>
    6a78:	83 c4 10             	add    $0x10,%esp
    6a7b:	6a 0e                	push   $0xe
    6a7d:	6a 08                	push   $0x8
    6a7f:	68 fc 11 00 00       	push   $0x11fc
    6a84:	6a 2e                	push   $0x2e
    6a86:	e8 2d 01 00 00       	call   6bb8 <InitInterruptDesc>
    6a8b:	83 c4 10             	add    $0x10,%esp
    6a8e:	83 ec 04             	sub    $0x4,%esp
    6a91:	68 60 0b 00 00       	push   $0xb60
    6a96:	6a 00                	push   $0x0
    6a98:	68 80 11 08 00       	push   $0x81180
    6a9d:	e8 17 27 00 00       	call   91b9 <Memset>
    6aa2:	83 c4 10             	add    $0x10,%esp
    6aa5:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
    6aac:	83 ec 04             	sub    $0x4,%esp
    6aaf:	ff 75 f0             	pushl  -0x10(%ebp)
    6ab2:	6a 00                	push   $0x0
    6ab4:	68 20 f6 00 00       	push   $0xf620
    6ab9:	e8 fb 26 00 00       	call   91b9 <Memset>
    6abe:	83 c4 10             	add    $0x10,%esp
    6ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ac4:	a3 88 f6 00 00       	mov    %eax,0xf688
    6ac9:	c7 05 28 f6 00 00 30 	movl   $0x30,0xf628
    6ad0:	00 00 00 
    6ad3:	83 ec 0c             	sub    $0xc,%esp
    6ad6:	6a 30                	push   $0x30
    6ad8:	e8 93 fe ff ff       	call   6970 <Seg2PhyAddr>
    6add:	83 c4 10             	add    $0x10,%esp
    6ae0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6ae3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6ae6:	83 ec 08             	sub    $0x8,%esp
    6ae9:	68 20 f6 00 00       	push   $0xf620
    6aee:	50                   	push   %eax
    6aef:	e8 01 ff ff ff       	call   69f5 <VirAddr2PhyAddr>
    6af4:	83 c4 10             	add    $0x10,%esp
    6af7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6afa:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
    6b01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6b04:	0f b7 d0             	movzwl %ax,%edx
    6b07:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b0a:	83 e8 01             	sub    $0x1,%eax
    6b0d:	89 c1                	mov    %eax,%ecx
    6b0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6b12:	52                   	push   %edx
    6b13:	51                   	push   %ecx
    6b14:	50                   	push   %eax
    6b15:	68 a0 d7 00 00       	push   $0xd7a0
    6b1a:	e8 e4 fd ff ff       	call   6903 <InitDescriptor>
    6b1f:	83 c4 10             	add    $0x10,%esp
    6b22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6b29:	eb 65                	jmp    6b90 <init_propt+0x142>
    6b2b:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
    6b32:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
    6b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b3c:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    6b42:	83 c0 40             	add    $0x40,%eax
    6b45:	05 80 11 08 00       	add    $0x81180,%eax
    6b4a:	8d 50 06             	lea    0x6(%eax),%edx
    6b4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6b50:	83 ec 08             	sub    $0x8,%esp
    6b53:	52                   	push   %edx
    6b54:	50                   	push   %eax
    6b55:	e8 9b fe ff ff       	call   69f5 <VirAddr2PhyAddr>
    6b5a:	83 c4 10             	add    $0x10,%esp
    6b5d:	89 45 d8             	mov    %eax,-0x28(%ebp)
    6b60:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6b63:	0f b7 d0             	movzwl %ax,%edx
    6b66:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6b69:	83 e8 01             	sub    $0x1,%eax
    6b6c:	89 c3                	mov    %eax,%ebx
    6b6e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6b71:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b74:	83 c1 09             	add    $0x9,%ecx
    6b77:	c1 e1 03             	shl    $0x3,%ecx
    6b7a:	81 c1 60 d7 00 00    	add    $0xd760,%ecx
    6b80:	52                   	push   %edx
    6b81:	53                   	push   %ebx
    6b82:	50                   	push   %eax
    6b83:	51                   	push   %ecx
    6b84:	e8 7a fd ff ff       	call   6903 <InitDescriptor>
    6b89:	83 c4 10             	add    $0x10,%esp
    6b8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6b90:	83 7d f4 26          	cmpl   $0x26,-0xc(%ebp)
    6b94:	7e 95                	jle    6b2b <init_propt+0xdd>
    6b96:	68 f2 00 00 00       	push   $0xf2
    6b9b:	68 ff ff 00 00       	push   $0xffff
    6ba0:	68 00 80 0b 00       	push   $0xb8000
    6ba5:	68 98 d7 00 00       	push   $0xd798
    6baa:	e8 54 fd ff ff       	call   6903 <InitDescriptor>
    6baf:	83 c4 10             	add    $0x10,%esp
    6bb2:	90                   	nop
    6bb3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    6bb6:	c9                   	leave  
    6bb7:	c3                   	ret    

00006bb8 <InitInterruptDesc>:
    6bb8:	55                   	push   %ebp
    6bb9:	89 e5                	mov    %esp,%ebp
    6bbb:	83 ec 10             	sub    $0x10,%esp
    6bbe:	8b 45 08             	mov    0x8(%ebp),%eax
    6bc1:	c1 e0 03             	shl    $0x3,%eax
    6bc4:	05 a0 f6 00 00       	add    $0xf6a0,%eax
    6bc9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6bcc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6bcf:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    6bd3:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bd6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    6bd9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6bdc:	89 c2                	mov    %eax,%edx
    6bde:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6be1:	66 89 10             	mov    %dx,(%eax)
    6be4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6be7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
    6bed:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6bf0:	c1 f8 10             	sar    $0x10,%eax
    6bf3:	89 c2                	mov    %eax,%edx
    6bf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6bf8:	66 89 50 06          	mov    %dx,0x6(%eax)
    6bfc:	8b 45 10             	mov    0x10(%ebp),%eax
    6bff:	c1 e0 04             	shl    $0x4,%eax
    6c02:	89 c2                	mov    %eax,%edx
    6c04:	8b 45 14             	mov    0x14(%ebp),%eax
    6c07:	09 d0                	or     %edx,%eax
    6c09:	89 c2                	mov    %eax,%edx
    6c0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6c0e:	88 50 05             	mov    %dl,0x5(%eax)
    6c11:	90                   	nop
    6c12:	c9                   	leave  
    6c13:	c3                   	ret    

00006c14 <ReloadGDT>:
    6c14:	55                   	push   %ebp
    6c15:	89 e5                	mov    %esp,%ebp
    6c17:	83 ec 28             	sub    $0x28,%esp
    6c1a:	b8 98 f6 00 00       	mov    $0xf698,%eax
    6c1f:	0f b7 00             	movzwl (%eax),%eax
    6c22:	98                   	cwtl   
    6c23:	ba 9a f6 00 00       	mov    $0xf69a,%edx
    6c28:	8b 12                	mov    (%edx),%edx
    6c2a:	83 ec 04             	sub    $0x4,%esp
    6c2d:	50                   	push   %eax
    6c2e:	52                   	push   %edx
    6c2f:	68 60 d7 00 00       	push   $0xd760
    6c34:	e8 52 25 00 00       	call   918b <Memcpy>
    6c39:	83 c4 10             	add    $0x10,%esp
    6c3c:	c7 45 f0 98 f6 00 00 	movl   $0xf698,-0x10(%ebp)
    6c43:	c7 45 ec 9a f6 00 00 	movl   $0xf69a,-0x14(%ebp)
    6c4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c4d:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
    6c52:	ba 60 d7 00 00       	mov    $0xd760,%edx
    6c57:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6c5a:	89 10                	mov    %edx,(%eax)
    6c5c:	c7 45 e8 48 d7 00 00 	movl   $0xd748,-0x18(%ebp)
    6c63:	c7 45 e4 4a d7 00 00 	movl   $0xd74a,-0x1c(%ebp)
    6c6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6c6d:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
    6c72:	ba a0 f6 00 00       	mov    $0xf6a0,%edx
    6c77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6c7a:	89 10                	mov    %edx,(%eax)
    6c7c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6c83:	eb 04                	jmp    6c89 <ReloadGDT+0x75>
    6c85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6c89:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    6c90:	7e f3                	jle    6c85 <ReloadGDT+0x71>
    6c92:	e8 a7 ab ff ff       	call   183e <init_internal_interrupt>
    6c97:	e8 b2 fd ff ff       	call   6a4e <init_propt>
    6c9c:	90                   	nop
    6c9d:	c9                   	leave  
    6c9e:	c3                   	ret    

00006c9f <select_console>:
    6c9f:	55                   	push   %ebp
    6ca0:	89 e5                	mov    %esp,%ebp
    6ca2:	83 ec 18             	sub    $0x18,%esp
    6ca5:	8b 45 08             	mov    0x8(%ebp),%eax
    6ca8:	88 45 f4             	mov    %al,-0xc(%ebp)
    6cab:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
    6caf:	77 27                	ja     6cd8 <select_console+0x39>
    6cb1:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
    6cb5:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    6cbb:	05 a0 dd 00 00       	add    $0xdda0,%eax
    6cc0:	a3 40 d7 00 00       	mov    %eax,0xd740
    6cc5:	a1 40 d7 00 00       	mov    0xd740,%eax
    6cca:	83 ec 0c             	sub    $0xc,%esp
    6ccd:	50                   	push   %eax
    6cce:	e8 08 00 00 00       	call   6cdb <flush>
    6cd3:	83 c4 10             	add    $0x10,%esp
    6cd6:	eb 01                	jmp    6cd9 <select_console+0x3a>
    6cd8:	90                   	nop
    6cd9:	c9                   	leave  
    6cda:	c3                   	ret    

00006cdb <flush>:
    6cdb:	55                   	push   %ebp
    6cdc:	89 e5                	mov    %esp,%ebp
    6cde:	83 ec 08             	sub    $0x8,%esp
    6ce1:	8b 45 08             	mov    0x8(%ebp),%eax
    6ce4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6cea:	8b 40 0c             	mov    0xc(%eax),%eax
    6ced:	83 ec 0c             	sub    $0xc,%esp
    6cf0:	50                   	push   %eax
    6cf1:	e8 1e 00 00 00       	call   6d14 <set_cursor>
    6cf6:	83 c4 10             	add    $0x10,%esp
    6cf9:	8b 45 08             	mov    0x8(%ebp),%eax
    6cfc:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6d02:	8b 40 08             	mov    0x8(%eax),%eax
    6d05:	83 ec 0c             	sub    $0xc,%esp
    6d08:	50                   	push   %eax
    6d09:	e8 64 00 00 00       	call   6d72 <set_console_start_video_addr>
    6d0e:	83 c4 10             	add    $0x10,%esp
    6d11:	90                   	nop
    6d12:	c9                   	leave  
    6d13:	c3                   	ret    

00006d14 <set_cursor>:
    6d14:	55                   	push   %ebp
    6d15:	89 e5                	mov    %esp,%ebp
    6d17:	83 ec 08             	sub    $0x8,%esp
    6d1a:	83 ec 08             	sub    $0x8,%esp
    6d1d:	6a 0e                	push   $0xe
    6d1f:	68 d4 03 00 00       	push   $0x3d4
    6d24:	e8 b9 a5 ff ff       	call   12e2 <out_byte>
    6d29:	83 c4 10             	add    $0x10,%esp
    6d2c:	8b 45 08             	mov    0x8(%ebp),%eax
    6d2f:	c1 e8 08             	shr    $0x8,%eax
    6d32:	0f b7 c0             	movzwl %ax,%eax
    6d35:	83 ec 08             	sub    $0x8,%esp
    6d38:	50                   	push   %eax
    6d39:	68 d5 03 00 00       	push   $0x3d5
    6d3e:	e8 9f a5 ff ff       	call   12e2 <out_byte>
    6d43:	83 c4 10             	add    $0x10,%esp
    6d46:	83 ec 08             	sub    $0x8,%esp
    6d49:	6a 0f                	push   $0xf
    6d4b:	68 d4 03 00 00       	push   $0x3d4
    6d50:	e8 8d a5 ff ff       	call   12e2 <out_byte>
    6d55:	83 c4 10             	add    $0x10,%esp
    6d58:	8b 45 08             	mov    0x8(%ebp),%eax
    6d5b:	0f b7 c0             	movzwl %ax,%eax
    6d5e:	83 ec 08             	sub    $0x8,%esp
    6d61:	50                   	push   %eax
    6d62:	68 d5 03 00 00       	push   $0x3d5
    6d67:	e8 76 a5 ff ff       	call   12e2 <out_byte>
    6d6c:	83 c4 10             	add    $0x10,%esp
    6d6f:	90                   	nop
    6d70:	c9                   	leave  
    6d71:	c3                   	ret    

00006d72 <set_console_start_video_addr>:
    6d72:	55                   	push   %ebp
    6d73:	89 e5                	mov    %esp,%ebp
    6d75:	83 ec 08             	sub    $0x8,%esp
    6d78:	83 ec 08             	sub    $0x8,%esp
    6d7b:	6a 0c                	push   $0xc
    6d7d:	68 d4 03 00 00       	push   $0x3d4
    6d82:	e8 5b a5 ff ff       	call   12e2 <out_byte>
    6d87:	83 c4 10             	add    $0x10,%esp
    6d8a:	8b 45 08             	mov    0x8(%ebp),%eax
    6d8d:	c1 e8 08             	shr    $0x8,%eax
    6d90:	0f b7 c0             	movzwl %ax,%eax
    6d93:	83 ec 08             	sub    $0x8,%esp
    6d96:	50                   	push   %eax
    6d97:	68 d5 03 00 00       	push   $0x3d5
    6d9c:	e8 41 a5 ff ff       	call   12e2 <out_byte>
    6da1:	83 c4 10             	add    $0x10,%esp
    6da4:	83 ec 08             	sub    $0x8,%esp
    6da7:	6a 0d                	push   $0xd
    6da9:	68 d4 03 00 00       	push   $0x3d4
    6dae:	e8 2f a5 ff ff       	call   12e2 <out_byte>
    6db3:	83 c4 10             	add    $0x10,%esp
    6db6:	8b 45 08             	mov    0x8(%ebp),%eax
    6db9:	0f b7 c0             	movzwl %ax,%eax
    6dbc:	83 ec 08             	sub    $0x8,%esp
    6dbf:	50                   	push   %eax
    6dc0:	68 d5 03 00 00       	push   $0x3d5
    6dc5:	e8 18 a5 ff ff       	call   12e2 <out_byte>
    6dca:	83 c4 10             	add    $0x10,%esp
    6dcd:	90                   	nop
    6dce:	c9                   	leave  
    6dcf:	c3                   	ret    

00006dd0 <put_key>:
    6dd0:	55                   	push   %ebp
    6dd1:	89 e5                	mov    %esp,%ebp
    6dd3:	83 ec 04             	sub    $0x4,%esp
    6dd6:	8b 45 0c             	mov    0xc(%ebp),%eax
    6dd9:	88 45 fc             	mov    %al,-0x4(%ebp)
    6ddc:	8b 45 08             	mov    0x8(%ebp),%eax
    6ddf:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6de5:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    6dea:	77 4d                	ja     6e39 <put_key+0x69>
    6dec:	8b 45 08             	mov    0x8(%ebp),%eax
    6def:	8b 00                	mov    (%eax),%eax
    6df1:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
    6df5:	89 10                	mov    %edx,(%eax)
    6df7:	8b 45 08             	mov    0x8(%ebp),%eax
    6dfa:	8b 00                	mov    (%eax),%eax
    6dfc:	8d 50 04             	lea    0x4(%eax),%edx
    6dff:	8b 45 08             	mov    0x8(%ebp),%eax
    6e02:	89 10                	mov    %edx,(%eax)
    6e04:	8b 45 08             	mov    0x8(%ebp),%eax
    6e07:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6e0d:	8d 50 01             	lea    0x1(%eax),%edx
    6e10:	8b 45 08             	mov    0x8(%ebp),%eax
    6e13:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
    6e19:	8b 45 08             	mov    0x8(%ebp),%eax
    6e1c:	8b 00                	mov    (%eax),%eax
    6e1e:	8b 55 08             	mov    0x8(%ebp),%edx
    6e21:	83 c2 08             	add    $0x8,%edx
    6e24:	81 c2 00 08 00 00    	add    $0x800,%edx
    6e2a:	39 d0                	cmp    %edx,%eax
    6e2c:	75 0b                	jne    6e39 <put_key+0x69>
    6e2e:	8b 45 08             	mov    0x8(%ebp),%eax
    6e31:	8d 50 08             	lea    0x8(%eax),%edx
    6e34:	8b 45 08             	mov    0x8(%ebp),%eax
    6e37:	89 10                	mov    %edx,(%eax)
    6e39:	90                   	nop
    6e3a:	c9                   	leave  
    6e3b:	c3                   	ret    

00006e3c <scroll_up>:
    6e3c:	55                   	push   %ebp
    6e3d:	89 e5                	mov    %esp,%ebp
    6e3f:	83 ec 08             	sub    $0x8,%esp
    6e42:	8b 45 08             	mov    0x8(%ebp),%eax
    6e45:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e4b:	8b 40 08             	mov    0x8(%eax),%eax
    6e4e:	8d 50 b0             	lea    -0x50(%eax),%edx
    6e51:	8b 45 08             	mov    0x8(%ebp),%eax
    6e54:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e5a:	8b 00                	mov    (%eax),%eax
    6e5c:	39 c2                	cmp    %eax,%edx
    6e5e:	76 1b                	jbe    6e7b <scroll_up+0x3f>
    6e60:	8b 45 08             	mov    0x8(%ebp),%eax
    6e63:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e69:	8b 40 08             	mov    0x8(%eax),%eax
    6e6c:	83 e8 50             	sub    $0x50,%eax
    6e6f:	83 ec 0c             	sub    $0xc,%esp
    6e72:	50                   	push   %eax
    6e73:	e8 fa fe ff ff       	call   6d72 <set_console_start_video_addr>
    6e78:	83 c4 10             	add    $0x10,%esp
    6e7b:	90                   	nop
    6e7c:	c9                   	leave  
    6e7d:	c3                   	ret    

00006e7e <scroll_down>:
    6e7e:	55                   	push   %ebp
    6e7f:	89 e5                	mov    %esp,%ebp
    6e81:	83 ec 08             	sub    $0x8,%esp
    6e84:	8b 45 08             	mov    0x8(%ebp),%eax
    6e87:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e8d:	8b 40 08             	mov    0x8(%eax),%eax
    6e90:	8d 48 50             	lea    0x50(%eax),%ecx
    6e93:	8b 45 08             	mov    0x8(%ebp),%eax
    6e96:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e9c:	8b 10                	mov    (%eax),%edx
    6e9e:	8b 45 08             	mov    0x8(%ebp),%eax
    6ea1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ea7:	8b 40 04             	mov    0x4(%eax),%eax
    6eaa:	01 d0                	add    %edx,%eax
    6eac:	39 c1                	cmp    %eax,%ecx
    6eae:	73 36                	jae    6ee6 <scroll_down+0x68>
    6eb0:	8b 45 08             	mov    0x8(%ebp),%eax
    6eb3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6eb9:	8b 40 08             	mov    0x8(%eax),%eax
    6ebc:	83 c0 50             	add    $0x50,%eax
    6ebf:	83 ec 0c             	sub    $0xc,%esp
    6ec2:	50                   	push   %eax
    6ec3:	e8 aa fe ff ff       	call   6d72 <set_console_start_video_addr>
    6ec8:	83 c4 10             	add    $0x10,%esp
    6ecb:	8b 45 08             	mov    0x8(%ebp),%eax
    6ece:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ed4:	8b 50 08             	mov    0x8(%eax),%edx
    6ed7:	8b 45 08             	mov    0x8(%ebp),%eax
    6eda:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ee0:	83 c2 50             	add    $0x50,%edx
    6ee3:	89 50 08             	mov    %edx,0x8(%eax)
    6ee6:	90                   	nop
    6ee7:	c9                   	leave  
    6ee8:	c3                   	ret    

00006ee9 <out_char>:
    6ee9:	55                   	push   %ebp
    6eea:	89 e5                	mov    %esp,%ebp
    6eec:	83 ec 28             	sub    $0x28,%esp
    6eef:	8b 45 0c             	mov    0xc(%ebp),%eax
    6ef2:	88 45 e4             	mov    %al,-0x1c(%ebp)
    6ef5:	8b 45 08             	mov    0x8(%ebp),%eax
    6ef8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6efe:	8b 40 0c             	mov    0xc(%eax),%eax
    6f01:	05 00 c0 05 00       	add    $0x5c000,%eax
    6f06:	01 c0                	add    %eax,%eax
    6f08:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6f0b:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    6f0f:	83 f8 08             	cmp    $0x8,%eax
    6f12:	0f 84 8d 00 00 00    	je     6fa5 <out_char+0xbc>
    6f18:	83 f8 0a             	cmp    $0xa,%eax
    6f1b:	0f 85 c9 00 00 00    	jne    6fea <out_char+0x101>
    6f21:	8b 45 08             	mov    0x8(%ebp),%eax
    6f24:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f2a:	8b 50 0c             	mov    0xc(%eax),%edx
    6f2d:	8b 45 08             	mov    0x8(%ebp),%eax
    6f30:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f36:	8b 08                	mov    (%eax),%ecx
    6f38:	8b 45 08             	mov    0x8(%ebp),%eax
    6f3b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f41:	8b 40 04             	mov    0x4(%eax),%eax
    6f44:	01 c8                	add    %ecx,%eax
    6f46:	83 e8 50             	sub    $0x50,%eax
    6f49:	39 c2                	cmp    %eax,%edx
    6f4b:	0f 83 f4 00 00 00    	jae    7045 <out_char+0x15c>
    6f51:	8b 45 08             	mov    0x8(%ebp),%eax
    6f54:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f5a:	8b 08                	mov    (%eax),%ecx
    6f5c:	8b 45 08             	mov    0x8(%ebp),%eax
    6f5f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f65:	8b 50 0c             	mov    0xc(%eax),%edx
    6f68:	8b 45 08             	mov    0x8(%ebp),%eax
    6f6b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f71:	8b 00                	mov    (%eax),%eax
    6f73:	29 c2                	sub    %eax,%edx
    6f75:	89 d0                	mov    %edx,%eax
    6f77:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    6f7c:	f7 e2                	mul    %edx
    6f7e:	89 d0                	mov    %edx,%eax
    6f80:	c1 e8 06             	shr    $0x6,%eax
    6f83:	8d 50 01             	lea    0x1(%eax),%edx
    6f86:	89 d0                	mov    %edx,%eax
    6f88:	c1 e0 02             	shl    $0x2,%eax
    6f8b:	01 d0                	add    %edx,%eax
    6f8d:	c1 e0 04             	shl    $0x4,%eax
    6f90:	89 c2                	mov    %eax,%edx
    6f92:	8b 45 08             	mov    0x8(%ebp),%eax
    6f95:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f9b:	01 ca                	add    %ecx,%edx
    6f9d:	89 50 0c             	mov    %edx,0xc(%eax)
    6fa0:	e9 a0 00 00 00       	jmp    7045 <out_char+0x15c>
    6fa5:	8b 45 08             	mov    0x8(%ebp),%eax
    6fa8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6fae:	8b 50 0c             	mov    0xc(%eax),%edx
    6fb1:	8b 45 08             	mov    0x8(%ebp),%eax
    6fb4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6fba:	8b 00                	mov    (%eax),%eax
    6fbc:	39 c2                	cmp    %eax,%edx
    6fbe:	0f 86 84 00 00 00    	jbe    7048 <out_char+0x15f>
    6fc4:	8b 45 08             	mov    0x8(%ebp),%eax
    6fc7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6fcd:	8b 50 0c             	mov    0xc(%eax),%edx
    6fd0:	83 ea 01             	sub    $0x1,%edx
    6fd3:	89 50 0c             	mov    %edx,0xc(%eax)
    6fd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6fd9:	83 e8 02             	sub    $0x2,%eax
    6fdc:	c6 00 20             	movb   $0x20,(%eax)
    6fdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6fe2:	83 e8 01             	sub    $0x1,%eax
    6fe5:	c6 00 00             	movb   $0x0,(%eax)
    6fe8:	eb 5e                	jmp    7048 <out_char+0x15f>
    6fea:	8b 45 08             	mov    0x8(%ebp),%eax
    6fed:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ff3:	8b 40 0c             	mov    0xc(%eax),%eax
    6ff6:	8d 48 01             	lea    0x1(%eax),%ecx
    6ff9:	8b 45 08             	mov    0x8(%ebp),%eax
    6ffc:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7002:	8b 10                	mov    (%eax),%edx
    7004:	8b 45 08             	mov    0x8(%ebp),%eax
    7007:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    700d:	8b 40 04             	mov    0x4(%eax),%eax
    7010:	01 d0                	add    %edx,%eax
    7012:	39 c1                	cmp    %eax,%ecx
    7014:	73 35                	jae    704b <out_char+0x162>
    7016:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7019:	8d 50 01             	lea    0x1(%eax),%edx
    701c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    701f:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
    7023:	88 10                	mov    %dl,(%eax)
    7025:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7028:	8d 50 01             	lea    0x1(%eax),%edx
    702b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    702e:	c6 00 0a             	movb   $0xa,(%eax)
    7031:	8b 45 08             	mov    0x8(%ebp),%eax
    7034:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    703a:	8b 50 0c             	mov    0xc(%eax),%edx
    703d:	83 c2 01             	add    $0x1,%edx
    7040:	89 50 0c             	mov    %edx,0xc(%eax)
    7043:	eb 06                	jmp    704b <out_char+0x162>
    7045:	90                   	nop
    7046:	eb 14                	jmp    705c <out_char+0x173>
    7048:	90                   	nop
    7049:	eb 11                	jmp    705c <out_char+0x173>
    704b:	90                   	nop
    704c:	eb 0e                	jmp    705c <out_char+0x173>
    704e:	83 ec 0c             	sub    $0xc,%esp
    7051:	ff 75 08             	pushl  0x8(%ebp)
    7054:	e8 25 fe ff ff       	call   6e7e <scroll_down>
    7059:	83 c4 10             	add    $0x10,%esp
    705c:	8b 45 08             	mov    0x8(%ebp),%eax
    705f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7065:	8b 50 0c             	mov    0xc(%eax),%edx
    7068:	8b 45 08             	mov    0x8(%ebp),%eax
    706b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7071:	8b 40 08             	mov    0x8(%eax),%eax
    7074:	29 c2                	sub    %eax,%edx
    7076:	89 d0                	mov    %edx,%eax
    7078:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    707d:	77 cf                	ja     704e <out_char+0x165>
    707f:	83 ec 0c             	sub    $0xc,%esp
    7082:	ff 75 08             	pushl  0x8(%ebp)
    7085:	e8 51 fc ff ff       	call   6cdb <flush>
    708a:	83 c4 10             	add    $0x10,%esp
    708d:	90                   	nop
    708e:	c9                   	leave  
    708f:	c3                   	ret    

00007090 <tty_dev_read>:
    7090:	55                   	push   %ebp
    7091:	89 e5                	mov    %esp,%ebp
    7093:	83 ec 08             	sub    $0x8,%esp
    7096:	a1 40 d7 00 00       	mov    0xd740,%eax
    709b:	39 45 08             	cmp    %eax,0x8(%ebp)
    709e:	75 17                	jne    70b7 <tty_dev_read+0x27>
    70a0:	a1 88 db 00 00       	mov    0xdb88,%eax
    70a5:	85 c0                	test   %eax,%eax
    70a7:	7e 0e                	jle    70b7 <tty_dev_read+0x27>
    70a9:	83 ec 0c             	sub    $0xc,%esp
    70ac:	ff 75 08             	pushl  0x8(%ebp)
    70af:	e8 f5 06 00 00       	call   77a9 <keyboard_read>
    70b4:	83 c4 10             	add    $0x10,%esp
    70b7:	90                   	nop
    70b8:	c9                   	leave  
    70b9:	c3                   	ret    

000070ba <tty_dev_write>:
    70ba:	55                   	push   %ebp
    70bb:	89 e5                	mov    %esp,%ebp
    70bd:	81 ec 88 00 00 00    	sub    $0x88,%esp
    70c3:	8b 45 08             	mov    0x8(%ebp),%eax
    70c6:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    70cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    70cf:	e9 da 01 00 00       	jmp    72ae <tty_dev_write+0x1f4>
    70d4:	8b 45 08             	mov    0x8(%ebp),%eax
    70d7:	8b 40 04             	mov    0x4(%eax),%eax
    70da:	8b 00                	mov    (%eax),%eax
    70dc:	88 45 f3             	mov    %al,-0xd(%ebp)
    70df:	8b 45 08             	mov    0x8(%ebp),%eax
    70e2:	8b 40 04             	mov    0x4(%eax),%eax
    70e5:	8d 50 04             	lea    0x4(%eax),%edx
    70e8:	8b 45 08             	mov    0x8(%ebp),%eax
    70eb:	89 50 04             	mov    %edx,0x4(%eax)
    70ee:	8b 45 08             	mov    0x8(%ebp),%eax
    70f1:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    70f7:	8d 50 ff             	lea    -0x1(%eax),%edx
    70fa:	8b 45 08             	mov    0x8(%ebp),%eax
    70fd:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
    7103:	8b 45 08             	mov    0x8(%ebp),%eax
    7106:	8b 40 04             	mov    0x4(%eax),%eax
    7109:	8b 55 08             	mov    0x8(%ebp),%edx
    710c:	83 c2 08             	add    $0x8,%edx
    710f:	81 c2 00 08 00 00    	add    $0x800,%edx
    7115:	39 d0                	cmp    %edx,%eax
    7117:	75 0c                	jne    7125 <tty_dev_write+0x6b>
    7119:	8b 45 08             	mov    0x8(%ebp),%eax
    711c:	8d 50 08             	lea    0x8(%eax),%edx
    711f:	8b 45 08             	mov    0x8(%ebp),%eax
    7122:	89 50 04             	mov    %edx,0x4(%eax)
    7125:	8b 45 08             	mov    0x8(%ebp),%eax
    7128:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    712e:	85 c0                	test   %eax,%eax
    7130:	0f 84 78 01 00 00    	je     72ae <tty_dev_write+0x1f4>
    7136:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    713a:	3c 20                	cmp    $0x20,%al
    713c:	76 08                	jbe    7146 <tty_dev_write+0x8c>
    713e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7142:	3c 7e                	cmp    $0x7e,%al
    7144:	76 10                	jbe    7156 <tty_dev_write+0x9c>
    7146:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    714a:	3c 20                	cmp    $0x20,%al
    714c:	74 08                	je     7156 <tty_dev_write+0x9c>
    714e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7152:	84 c0                	test   %al,%al
    7154:	75 7b                	jne    71d1 <tty_dev_write+0x117>
    7156:	83 ec 08             	sub    $0x8,%esp
    7159:	8d 45 f3             	lea    -0xd(%ebp),%eax
    715c:	50                   	push   %eax
    715d:	6a 00                	push   $0x0
    715f:	e8 a7 f8 ff ff       	call   6a0b <v2l>
    7164:	83 c4 10             	add    $0x10,%esp
    7167:	89 c1                	mov    %eax,%ecx
    7169:	8b 45 08             	mov    0x8(%ebp),%eax
    716c:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
    7172:	8b 45 08             	mov    0x8(%ebp),%eax
    7175:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    717b:	01 d0                	add    %edx,%eax
    717d:	83 ec 04             	sub    $0x4,%esp
    7180:	6a 01                	push   $0x1
    7182:	51                   	push   %ecx
    7183:	50                   	push   %eax
    7184:	e8 02 20 00 00       	call   918b <Memcpy>
    7189:	83 c4 10             	add    $0x10,%esp
    718c:	8b 45 08             	mov    0x8(%ebp),%eax
    718f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    7195:	8d 50 ff             	lea    -0x1(%eax),%edx
    7198:	8b 45 08             	mov    0x8(%ebp),%eax
    719b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    71a1:	8b 45 08             	mov    0x8(%ebp),%eax
    71a4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    71aa:	8d 50 01             	lea    0x1(%eax),%edx
    71ad:	8b 45 08             	mov    0x8(%ebp),%eax
    71b0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    71b6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    71ba:	0f b6 c0             	movzbl %al,%eax
    71bd:	83 ec 08             	sub    $0x8,%esp
    71c0:	50                   	push   %eax
    71c1:	ff 75 08             	pushl  0x8(%ebp)
    71c4:	e8 20 fd ff ff       	call   6ee9 <out_char>
    71c9:	83 c4 10             	add    $0x10,%esp
    71cc:	e9 dd 00 00 00       	jmp    72ae <tty_dev_write+0x1f4>
    71d1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    71d5:	3c 08                	cmp    $0x8,%al
    71d7:	75 45                	jne    721e <tty_dev_write+0x164>
    71d9:	8b 45 08             	mov    0x8(%ebp),%eax
    71dc:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    71e2:	8d 50 01             	lea    0x1(%eax),%edx
    71e5:	8b 45 08             	mov    0x8(%ebp),%eax
    71e8:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    71ee:	8b 45 08             	mov    0x8(%ebp),%eax
    71f1:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    71f7:	8d 50 ff             	lea    -0x1(%eax),%edx
    71fa:	8b 45 08             	mov    0x8(%ebp),%eax
    71fd:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    7203:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7207:	0f b6 c0             	movzbl %al,%eax
    720a:	83 ec 08             	sub    $0x8,%esp
    720d:	50                   	push   %eax
    720e:	ff 75 08             	pushl  0x8(%ebp)
    7211:	e8 d3 fc ff ff       	call   6ee9 <out_char>
    7216:	83 c4 10             	add    $0x10,%esp
    7219:	e9 90 00 00 00       	jmp    72ae <tty_dev_write+0x1f4>
    721e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7222:	3c 0a                	cmp    $0xa,%al
    7224:	74 10                	je     7236 <tty_dev_write+0x17c>
    7226:	8b 45 08             	mov    0x8(%ebp),%eax
    7229:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
    722f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7232:	39 c2                	cmp    %eax,%edx
    7234:	75 78                	jne    72ae <tty_dev_write+0x1f4>
    7236:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    723a:	0f b6 c0             	movzbl %al,%eax
    723d:	83 ec 08             	sub    $0x8,%esp
    7240:	50                   	push   %eax
    7241:	ff 75 08             	pushl  0x8(%ebp)
    7244:	e8 a0 fc ff ff       	call   6ee9 <out_char>
    7249:	83 c4 10             	add    $0x10,%esp
    724c:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
    7253:	8b 45 08             	mov    0x8(%ebp),%eax
    7256:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    725c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    725f:	8b 45 08             	mov    0x8(%ebp),%eax
    7262:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
    7268:	89 45 dc             	mov    %eax,-0x24(%ebp)
    726b:	8b 45 08             	mov    0x8(%ebp),%eax
    726e:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
    7274:	89 45 94             	mov    %eax,-0x6c(%ebp)
    7277:	8b 45 08             	mov    0x8(%ebp),%eax
    727a:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
    7281:	00 00 00 
    7284:	8b 45 08             	mov    0x8(%ebp),%eax
    7287:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    728e:	00 00 00 
    7291:	8b 45 08             	mov    0x8(%ebp),%eax
    7294:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
    729a:	83 ec 04             	sub    $0x4,%esp
    729d:	50                   	push   %eax
    729e:	8d 45 84             	lea    -0x7c(%ebp),%eax
    72a1:	50                   	push   %eax
    72a2:	6a 01                	push   $0x1
    72a4:	e8 6f c5 ff ff       	call   3818 <send_rec>
    72a9:	83 c4 10             	add    $0x10,%esp
    72ac:	eb 11                	jmp    72bf <tty_dev_write+0x205>
    72ae:	8b 45 08             	mov    0x8(%ebp),%eax
    72b1:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    72b7:	85 c0                	test   %eax,%eax
    72b9:	0f 85 15 fe ff ff    	jne    70d4 <tty_dev_write+0x1a>
    72bf:	c9                   	leave  
    72c0:	c3                   	ret    

000072c1 <tty_do_read>:
    72c1:	55                   	push   %ebp
    72c2:	89 e5                	mov    %esp,%ebp
    72c4:	83 ec 08             	sub    $0x8,%esp
    72c7:	8b 45 08             	mov    0x8(%ebp),%eax
    72ca:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    72d1:	00 00 00 
    72d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    72d7:	8b 50 58             	mov    0x58(%eax),%edx
    72da:	8b 45 08             	mov    0x8(%ebp),%eax
    72dd:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
    72e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    72e6:	8b 00                	mov    (%eax),%eax
    72e8:	89 c2                	mov    %eax,%edx
    72ea:	8b 45 08             	mov    0x8(%ebp),%eax
    72ed:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
    72f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    72f6:	8b 50 50             	mov    0x50(%eax),%edx
    72f9:	8b 45 08             	mov    0x8(%ebp),%eax
    72fc:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    7302:	8b 45 0c             	mov    0xc(%ebp),%eax
    7305:	8b 40 10             	mov    0x10(%eax),%eax
    7308:	89 c2                	mov    %eax,%edx
    730a:	8b 45 08             	mov    0x8(%ebp),%eax
    730d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
    7313:	83 ec 08             	sub    $0x8,%esp
    7316:	52                   	push   %edx
    7317:	50                   	push   %eax
    7318:	e8 ee f6 ff ff       	call   6a0b <v2l>
    731d:	83 c4 10             	add    $0x10,%esp
    7320:	89 c2                	mov    %eax,%edx
    7322:	8b 45 08             	mov    0x8(%ebp),%eax
    7325:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
    732b:	8b 45 0c             	mov    0xc(%ebp),%eax
    732e:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
    7335:	8b 45 08             	mov    0x8(%ebp),%eax
    7338:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
    733e:	83 ec 04             	sub    $0x4,%esp
    7341:	50                   	push   %eax
    7342:	ff 75 0c             	pushl  0xc(%ebp)
    7345:	6a 01                	push   $0x1
    7347:	e8 cc c4 ff ff       	call   3818 <send_rec>
    734c:	83 c4 10             	add    $0x10,%esp
    734f:	90                   	nop
    7350:	c9                   	leave  
    7351:	c3                   	ret    

00007352 <tty_do_write>:
    7352:	55                   	push   %ebp
    7353:	89 e5                	mov    %esp,%ebp
    7355:	53                   	push   %ebx
    7356:	81 ec 94 00 00 00    	sub    $0x94,%esp
    735c:	89 e0                	mov    %esp,%eax
    735e:	89 c3                	mov    %eax,%ebx
    7360:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
    7367:	8b 45 e8             	mov    -0x18(%ebp),%eax
    736a:	8d 50 ff             	lea    -0x1(%eax),%edx
    736d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    7370:	89 c2                	mov    %eax,%edx
    7372:	b8 10 00 00 00       	mov    $0x10,%eax
    7377:	83 e8 01             	sub    $0x1,%eax
    737a:	01 d0                	add    %edx,%eax
    737c:	b9 10 00 00 00       	mov    $0x10,%ecx
    7381:	ba 00 00 00 00       	mov    $0x0,%edx
    7386:	f7 f1                	div    %ecx
    7388:	6b c0 10             	imul   $0x10,%eax,%eax
    738b:	29 c4                	sub    %eax,%esp
    738d:	89 e0                	mov    %esp,%eax
    738f:	83 c0 00             	add    $0x0,%eax
    7392:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7395:	83 ec 04             	sub    $0x4,%esp
    7398:	ff 75 e8             	pushl  -0x18(%ebp)
    739b:	6a 00                	push   $0x0
    739d:	ff 75 e0             	pushl  -0x20(%ebp)
    73a0:	e8 14 1e 00 00       	call   91b9 <Memset>
    73a5:	83 c4 10             	add    $0x10,%esp
    73a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    73ab:	8b 40 50             	mov    0x50(%eax),%eax
    73ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
    73b1:	8b 45 08             	mov    0x8(%ebp),%eax
    73b4:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    73bb:	00 00 00 
    73be:	e9 98 00 00 00       	jmp    745b <tty_do_write+0x109>
    73c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    73c6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    73c9:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
    73cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    73d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    73d3:	8b 40 10             	mov    0x10(%eax),%eax
    73d6:	89 c2                	mov    %eax,%edx
    73d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    73db:	8b 40 58             	mov    0x58(%eax),%eax
    73de:	83 ec 08             	sub    $0x8,%esp
    73e1:	52                   	push   %edx
    73e2:	50                   	push   %eax
    73e3:	e8 23 f6 ff ff       	call   6a0b <v2l>
    73e8:	83 c4 10             	add    $0x10,%esp
    73eb:	89 c2                	mov    %eax,%edx
    73ed:	8b 45 08             	mov    0x8(%ebp),%eax
    73f0:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    73f6:	01 d0                	add    %edx,%eax
    73f8:	83 ec 04             	sub    $0x4,%esp
    73fb:	ff 75 f0             	pushl  -0x10(%ebp)
    73fe:	50                   	push   %eax
    73ff:	ff 75 e0             	pushl  -0x20(%ebp)
    7402:	e8 84 1d 00 00       	call   918b <Memcpy>
    7407:	83 c4 10             	add    $0x10,%esp
    740a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    740d:	29 45 ec             	sub    %eax,-0x14(%ebp)
    7410:	8b 45 08             	mov    0x8(%ebp),%eax
    7413:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
    7419:	8b 45 f0             	mov    -0x10(%ebp),%eax
    741c:	01 c2                	add    %eax,%edx
    741e:	8b 45 08             	mov    0x8(%ebp),%eax
    7421:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    7427:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    742e:	eb 25                	jmp    7455 <tty_do_write+0x103>
    7430:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7433:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7436:	01 d0                	add    %edx,%eax
    7438:	0f b6 00             	movzbl (%eax),%eax
    743b:	0f b6 c0             	movzbl %al,%eax
    743e:	83 ec 08             	sub    $0x8,%esp
    7441:	50                   	push   %eax
    7442:	ff 75 08             	pushl  0x8(%ebp)
    7445:	e8 9f fa ff ff       	call   6ee9 <out_char>
    744a:	83 c4 10             	add    $0x10,%esp
    744d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7451:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    7455:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    7459:	75 d5                	jne    7430 <tty_do_write+0xde>
    745b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    745f:	0f 85 5e ff ff ff    	jne    73c3 <tty_do_write+0x71>
    7465:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
    746c:	8b 45 08             	mov    0x8(%ebp),%eax
    746f:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    7475:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7478:	8b 45 0c             	mov    0xc(%ebp),%eax
    747b:	8b 00                	mov    (%eax),%eax
    747d:	83 ec 04             	sub    $0x4,%esp
    7480:	50                   	push   %eax
    7481:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
    7487:	50                   	push   %eax
    7488:	6a 01                	push   $0x1
    748a:	e8 89 c3 ff ff       	call   3818 <send_rec>
    748f:	83 c4 10             	add    $0x10,%esp
    7492:	89 dc                	mov    %ebx,%esp
    7494:	90                   	nop
    7495:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    7498:	c9                   	leave  
    7499:	c3                   	ret    

0000749a <init_screen>:
    749a:	55                   	push   %ebp
    749b:	89 e5                	mov    %esp,%ebp
    749d:	83 ec 10             	sub    $0x10,%esp
    74a0:	8b 45 08             	mov    0x8(%ebp),%eax
    74a3:	2d a0 dd 00 00       	sub    $0xdda0,%eax
    74a8:	c1 f8 02             	sar    $0x2,%eax
    74ab:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
    74b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    74b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    74b7:	c1 e0 04             	shl    $0x4,%eax
    74ba:	8d 90 c0 fe 00 00    	lea    0xfec0(%eax),%edx
    74c0:	8b 45 08             	mov    0x8(%ebp),%eax
    74c3:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
    74c9:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
    74d0:	8b 45 08             	mov    0x8(%ebp),%eax
    74d3:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
    74d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    74dc:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    74e1:	f7 e2                	mul    %edx
    74e3:	89 d0                	mov    %edx,%eax
    74e5:	d1 e8                	shr    %eax
    74e7:	89 41 04             	mov    %eax,0x4(%ecx)
    74ea:	8b 45 08             	mov    0x8(%ebp),%eax
    74ed:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    74f3:	8b 50 04             	mov    0x4(%eax),%edx
    74f6:	8b 45 08             	mov    0x8(%ebp),%eax
    74f9:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    74ff:	0f af 55 fc          	imul   -0x4(%ebp),%edx
    7503:	89 10                	mov    %edx,(%eax)
    7505:	8b 45 08             	mov    0x8(%ebp),%eax
    7508:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
    750e:	8b 45 08             	mov    0x8(%ebp),%eax
    7511:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7517:	8b 12                	mov    (%edx),%edx
    7519:	89 50 08             	mov    %edx,0x8(%eax)
    751c:	8b 55 08             	mov    0x8(%ebp),%edx
    751f:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
    7525:	8b 40 08             	mov    0x8(%eax),%eax
    7528:	89 42 0c             	mov    %eax,0xc(%edx)
    752b:	90                   	nop
    752c:	c9                   	leave  
    752d:	c3                   	ret    

0000752e <init_tty>:
    752e:	55                   	push   %ebp
    752f:	89 e5                	mov    %esp,%ebp
    7531:	83 ec 18             	sub    $0x18,%esp
    7534:	c7 45 f4 a0 dd 00 00 	movl   $0xdda0,-0xc(%ebp)
    753b:	eb 7a                	jmp    75b7 <init_tty+0x89>
    753d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7540:	8d 50 08             	lea    0x8(%eax),%edx
    7543:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7546:	89 50 04             	mov    %edx,0x4(%eax)
    7549:	8b 45 f4             	mov    -0xc(%ebp),%eax
    754c:	8b 50 04             	mov    0x4(%eax),%edx
    754f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7552:	89 10                	mov    %edx,(%eax)
    7554:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7557:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
    755e:	00 00 00 
    7561:	ff 75 f4             	pushl  -0xc(%ebp)
    7564:	e8 31 ff ff ff       	call   749a <init_screen>
    7569:	83 c4 04             	add    $0x4,%esp
    756c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    756f:	2d a0 dd 00 00       	sub    $0xdda0,%eax
    7574:	85 c0                	test   %eax,%eax
    7576:	7e 38                	jle    75b0 <init_tty+0x82>
    7578:	83 ec 08             	sub    $0x8,%esp
    757b:	6a 23                	push   $0x23
    757d:	ff 75 f4             	pushl  -0xc(%ebp)
    7580:	e8 64 f9 ff ff       	call   6ee9 <out_char>
    7585:	83 c4 10             	add    $0x10,%esp
    7588:	8b 45 f4             	mov    -0xc(%ebp),%eax
    758b:	05 e4 8e 01 00       	add    $0x18ee4,%eax
    7590:	2d a0 dd 00 00       	sub    $0xdda0,%eax
    7595:	c1 f8 02             	sar    $0x2,%eax
    7598:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
    759e:	0f b6 c0             	movzbl %al,%eax
    75a1:	83 ec 08             	sub    $0x8,%esp
    75a4:	50                   	push   %eax
    75a5:	ff 75 f4             	pushl  -0xc(%ebp)
    75a8:	e8 3c f9 ff ff       	call   6ee9 <out_char>
    75ad:	83 c4 10             	add    $0x10,%esp
    75b0:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
    75b7:	b8 0c f6 00 00       	mov    $0xf60c,%eax
    75bc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    75bf:	0f 82 78 ff ff ff    	jb     753d <init_tty+0xf>
    75c5:	90                   	nop
    75c6:	c9                   	leave  
    75c7:	c3                   	ret    

000075c8 <TaskTTY>:
    75c8:	55                   	push   %ebp
    75c9:	89 e5                	mov    %esp,%ebp
    75cb:	81 ec 88 00 00 00    	sub    $0x88,%esp
    75d1:	e8 58 ff ff ff       	call   752e <init_tty>
    75d6:	83 ec 0c             	sub    $0xc,%esp
    75d9:	6a 01                	push   $0x1
    75db:	e8 bf f6 ff ff       	call   6c9f <select_console>
    75e0:	83 c4 10             	add    $0x10,%esp
    75e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    75ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    75f1:	c7 45 f4 a0 dd 00 00 	movl   $0xdda0,-0xc(%ebp)
    75f8:	eb 30                	jmp    762a <TaskTTY+0x62>
    75fa:	83 ec 0c             	sub    $0xc,%esp
    75fd:	ff 75 f4             	pushl  -0xc(%ebp)
    7600:	e8 8b fa ff ff       	call   7090 <tty_dev_read>
    7605:	83 c4 10             	add    $0x10,%esp
    7608:	83 ec 0c             	sub    $0xc,%esp
    760b:	ff 75 f4             	pushl  -0xc(%ebp)
    760e:	e8 a7 fa ff ff       	call   70ba <tty_dev_write>
    7613:	83 c4 10             	add    $0x10,%esp
    7616:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7619:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    761f:	85 c0                	test   %eax,%eax
    7621:	75 d7                	jne    75fa <TaskTTY+0x32>
    7623:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
    762a:	b8 0c f6 00 00       	mov    $0xf60c,%eax
    762f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    7632:	72 c6                	jb     75fa <TaskTTY+0x32>
    7634:	83 ec 04             	sub    $0x4,%esp
    7637:	6a 11                	push   $0x11
    7639:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    763f:	50                   	push   %eax
    7640:	6a 02                	push   $0x2
    7642:	e8 d1 c1 ff ff       	call   3818 <send_rec>
    7647:	83 c4 10             	add    $0x10,%esp
    764a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    764d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7650:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
    7657:	74 28                	je     7681 <TaskTTY+0xb9>
    7659:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
    7660:	7f 0b                	jg     766d <TaskTTY+0xa5>
    7662:	81 7d e8 d1 07 00 00 	cmpl   $0x7d1,-0x18(%ebp)
    7669:	74 56                	je     76c1 <TaskTTY+0xf9>
    766b:	eb 55                	jmp    76c2 <TaskTTY+0xfa>
    766d:	81 7d e8 d3 07 00 00 	cmpl   $0x7d3,-0x18(%ebp)
    7674:	74 25                	je     769b <TaskTTY+0xd3>
    7676:	81 7d e8 d5 07 00 00 	cmpl   $0x7d5,-0x18(%ebp)
    767d:	74 36                	je     76b5 <TaskTTY+0xed>
    767f:	eb 41                	jmp    76c2 <TaskTTY+0xfa>
    7681:	a1 40 d7 00 00       	mov    0xd740,%eax
    7686:	83 ec 08             	sub    $0x8,%esp
    7689:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
    768f:	52                   	push   %edx
    7690:	50                   	push   %eax
    7691:	e8 2b fc ff ff       	call   72c1 <tty_do_read>
    7696:	83 c4 10             	add    $0x10,%esp
    7699:	eb 27                	jmp    76c2 <TaskTTY+0xfa>
    769b:	a1 40 d7 00 00       	mov    0xd740,%eax
    76a0:	83 ec 08             	sub    $0x8,%esp
    76a3:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
    76a9:	52                   	push   %edx
    76aa:	50                   	push   %eax
    76ab:	e8 a2 fc ff ff       	call   7352 <tty_do_write>
    76b0:	83 c4 10             	add    $0x10,%esp
    76b3:	eb 0d                	jmp    76c2 <TaskTTY+0xfa>
    76b5:	c7 05 90 f6 00 00 00 	movl   $0x0,0xf690
    76bc:	00 00 00 
    76bf:	eb 01                	jmp    76c2 <TaskTTY+0xfa>
    76c1:	90                   	nop
    76c2:	e9 2a ff ff ff       	jmp    75f1 <TaskTTY+0x29>

000076c7 <keyboard_handler>:
    76c7:	55                   	push   %ebp
    76c8:	89 e5                	mov    %esp,%ebp
    76ca:	83 ec 18             	sub    $0x18,%esp
    76cd:	c7 05 90 f6 00 00 01 	movl   $0x1,0xf690
    76d4:	00 00 00 
    76d7:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
    76de:	a1 88 db 00 00       	mov    0xdb88,%eax
    76e3:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    76e8:	7f 5c                	jg     7746 <keyboard_handler+0x7f>
    76ea:	e8 15 9c ff ff       	call   1304 <disable_int>
    76ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    76f2:	0f b7 c0             	movzwl %ax,%eax
    76f5:	83 ec 0c             	sub    $0xc,%esp
    76f8:	50                   	push   %eax
    76f9:	e8 d8 9b ff ff       	call   12d6 <in_byte>
    76fe:	83 c4 10             	add    $0x10,%esp
    7701:	88 45 f3             	mov    %al,-0xd(%ebp)
    7704:	a1 80 db 00 00       	mov    0xdb80,%eax
    7709:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
    770d:	88 10                	mov    %dl,(%eax)
    770f:	a1 80 db 00 00       	mov    0xdb80,%eax
    7714:	83 c0 01             	add    $0x1,%eax
    7717:	a3 80 db 00 00       	mov    %eax,0xdb80
    771c:	a1 88 db 00 00       	mov    0xdb88,%eax
    7721:	83 c0 01             	add    $0x1,%eax
    7724:	a3 88 db 00 00       	mov    %eax,0xdb88
    7729:	a1 80 db 00 00       	mov    0xdb80,%eax
    772e:	ba 8c dd 00 00       	mov    $0xdd8c,%edx
    7733:	39 d0                	cmp    %edx,%eax
    7735:	72 0a                	jb     7741 <keyboard_handler+0x7a>
    7737:	c7 05 80 db 00 00 8c 	movl   $0xdb8c,0xdb80
    773e:	db 00 00 
    7741:	e8 c0 9b ff ff       	call   1306 <enable_int>
    7746:	90                   	nop
    7747:	c9                   	leave  
    7748:	c3                   	ret    

00007749 <read_from_keyboard_buf>:
    7749:	55                   	push   %ebp
    774a:	89 e5                	mov    %esp,%ebp
    774c:	83 ec 18             	sub    $0x18,%esp
    774f:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
    7753:	a1 88 db 00 00       	mov    0xdb88,%eax
    7758:	85 c0                	test   %eax,%eax
    775a:	7e 47                	jle    77a3 <read_from_keyboard_buf+0x5a>
    775c:	e8 a3 9b ff ff       	call   1304 <disable_int>
    7761:	a1 84 db 00 00       	mov    0xdb84,%eax
    7766:	0f b6 00             	movzbl (%eax),%eax
    7769:	88 45 f7             	mov    %al,-0x9(%ebp)
    776c:	a1 84 db 00 00       	mov    0xdb84,%eax
    7771:	83 c0 01             	add    $0x1,%eax
    7774:	a3 84 db 00 00       	mov    %eax,0xdb84
    7779:	a1 88 db 00 00       	mov    0xdb88,%eax
    777e:	83 e8 01             	sub    $0x1,%eax
    7781:	a3 88 db 00 00       	mov    %eax,0xdb88
    7786:	a1 84 db 00 00       	mov    0xdb84,%eax
    778b:	ba 8c dd 00 00       	mov    $0xdd8c,%edx
    7790:	39 d0                	cmp    %edx,%eax
    7792:	72 0a                	jb     779e <read_from_keyboard_buf+0x55>
    7794:	c7 05 84 db 00 00 8c 	movl   $0xdb8c,0xdb84
    779b:	db 00 00 
    779e:	e8 63 9b ff ff       	call   1306 <enable_int>
    77a3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    77a7:	c9                   	leave  
    77a8:	c3                   	ret    

000077a9 <keyboard_read>:
    77a9:	55                   	push   %ebp
    77aa:	89 e5                	mov    %esp,%ebp
    77ac:	83 ec 28             	sub    $0x28,%esp
    77af:	90                   	nop
    77b0:	a1 88 db 00 00       	mov    0xdb88,%eax
    77b5:	85 c0                	test   %eax,%eax
    77b7:	7e f7                	jle    77b0 <keyboard_read+0x7>
    77b9:	e8 8b ff ff ff       	call   7749 <read_from_keyboard_buf>
    77be:	88 45 ea             	mov    %al,-0x16(%ebp)
    77c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    77c8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    77cc:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
    77d0:	75 5a                	jne    782c <keyboard_read+0x83>
    77d2:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
    77d6:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
    77da:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
    77de:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
    77e2:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
    77e6:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
    77ea:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
    77ee:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    77f5:	eb 20                	jmp    7817 <keyboard_read+0x6e>
    77f7:	e8 4d ff ff ff       	call   7749 <read_from_keyboard_buf>
    77fc:	89 c1                	mov    %eax,%ecx
    77fe:	8d 55 e3             	lea    -0x1d(%ebp),%edx
    7801:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7804:	01 d0                	add    %edx,%eax
    7806:	0f b6 00             	movzbl (%eax),%eax
    7809:	38 c1                	cmp    %al,%cl
    780b:	74 06                	je     7813 <keyboard_read+0x6a>
    780d:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    7811:	eb 0a                	jmp    781d <keyboard_read+0x74>
    7813:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7817:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
    781b:	7e da                	jle    77f7 <keyboard_read+0x4e>
    781d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
    7821:	74 68                	je     788b <keyboard_read+0xe2>
    7823:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
    782a:	eb 5f                	jmp    788b <keyboard_read+0xe2>
    782c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
    7830:	75 59                	jne    788b <keyboard_read+0xe2>
    7832:	e8 12 ff ff ff       	call   7749 <read_from_keyboard_buf>
    7837:	3c 2a                	cmp    $0x2a,%al
    7839:	75 1d                	jne    7858 <keyboard_read+0xaf>
    783b:	e8 09 ff ff ff       	call   7749 <read_from_keyboard_buf>
    7840:	3c e0                	cmp    $0xe0,%al
    7842:	75 14                	jne    7858 <keyboard_read+0xaf>
    7844:	e8 00 ff ff ff       	call   7749 <read_from_keyboard_buf>
    7849:	3c 37                	cmp    $0x37,%al
    784b:	75 0b                	jne    7858 <keyboard_read+0xaf>
    784d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    7854:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    7858:	e8 ec fe ff ff       	call   7749 <read_from_keyboard_buf>
    785d:	3c b7                	cmp    $0xb7,%al
    785f:	75 1d                	jne    787e <keyboard_read+0xd5>
    7861:	e8 e3 fe ff ff       	call   7749 <read_from_keyboard_buf>
    7866:	3c e0                	cmp    $0xe0,%al
    7868:	75 14                	jne    787e <keyboard_read+0xd5>
    786a:	e8 da fe ff ff       	call   7749 <read_from_keyboard_buf>
    786f:	3c aa                	cmp    $0xaa,%al
    7871:	75 0b                	jne    787e <keyboard_read+0xd5>
    7873:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    787a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    787e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7882:	75 07                	jne    788b <keyboard_read+0xe2>
    7884:	c6 05 44 d7 00 00 01 	movb   $0x1,0xd744
    788b:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
    7892:	0f 84 8d 00 00 00    	je     7925 <keyboard_read+0x17c>
    7898:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
    789f:	0f 84 80 00 00 00    	je     7925 <keyboard_read+0x17c>
    78a5:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
    78a9:	0f 94 c2             	sete   %dl
    78ac:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
    78b0:	0f 94 c0             	sete   %al
    78b3:	09 d0                	or     %edx,%eax
    78b5:	84 c0                	test   %al,%al
    78b7:	74 07                	je     78c0 <keyboard_read+0x117>
    78b9:	c6 05 94 f6 00 00 01 	movb   $0x1,0xf694
    78c0:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    78c4:	f7 d0                	not    %eax
    78c6:	c0 e8 07             	shr    $0x7,%al
    78c9:	88 45 e9             	mov    %al,-0x17(%ebp)
    78cc:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
    78d0:	74 53                	je     7925 <keyboard_read+0x17c>
    78d2:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
    78d6:	74 4d                	je     7925 <keyboard_read+0x17c>
    78d8:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
    78dc:	0f b6 05 94 f6 00 00 	movzbl 0xf694,%eax
    78e3:	3c 01                	cmp    $0x1,%al
    78e5:	75 04                	jne    78eb <keyboard_read+0x142>
    78e7:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    78eb:	0f b6 05 44 d7 00 00 	movzbl 0xd744,%eax
    78f2:	84 c0                	test   %al,%al
    78f4:	74 04                	je     78fa <keyboard_read+0x151>
    78f6:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
    78fa:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
    78fe:	89 d0                	mov    %edx,%eax
    7900:	01 c0                	add    %eax,%eax
    7902:	01 c2                	add    %eax,%edx
    7904:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    7908:	01 d0                	add    %edx,%eax
    790a:	8b 04 85 20 c1 00 00 	mov    0xc120(,%eax,4),%eax
    7911:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7914:	83 ec 08             	sub    $0x8,%esp
    7917:	ff 75 f4             	pushl  -0xc(%ebp)
    791a:	ff 75 08             	pushl  0x8(%ebp)
    791d:	e8 1a 00 00 00       	call   793c <in_process>
    7922:	83 c4 10             	add    $0x10,%esp
    7925:	90                   	nop
    7926:	c9                   	leave  
    7927:	c3                   	ret    

00007928 <init_keyboard_handler>:
    7928:	55                   	push   %ebp
    7929:	89 e5                	mov    %esp,%ebp
    792b:	c6 05 44 d7 00 00 00 	movb   $0x0,0xd744
    7932:	c6 05 94 f6 00 00 00 	movb   $0x0,0xf694
    7939:	90                   	nop
    793a:	5d                   	pop    %ebp
    793b:	c3                   	ret    

0000793c <in_process>:
    793c:	55                   	push   %ebp
    793d:	89 e5                	mov    %esp,%ebp
    793f:	83 ec 18             	sub    $0x18,%esp
    7942:	83 ec 04             	sub    $0x4,%esp
    7945:	6a 02                	push   $0x2
    7947:	6a 00                	push   $0x0
    7949:	8d 45 f6             	lea    -0xa(%ebp),%eax
    794c:	50                   	push   %eax
    794d:	e8 67 18 00 00       	call   91b9 <Memset>
    7952:	83 c4 10             	add    $0x10,%esp
    7955:	8b 45 0c             	mov    0xc(%ebp),%eax
    7958:	25 00 01 00 00       	and    $0x100,%eax
    795d:	85 c0                	test   %eax,%eax
    795f:	75 28                	jne    7989 <in_process+0x4d>
    7961:	8b 45 0c             	mov    0xc(%ebp),%eax
    7964:	0f b6 c0             	movzbl %al,%eax
    7967:	83 ec 08             	sub    $0x8,%esp
    796a:	50                   	push   %eax
    796b:	ff 75 08             	pushl  0x8(%ebp)
    796e:	e8 5d f4 ff ff       	call   6dd0 <put_key>
    7973:	83 c4 10             	add    $0x10,%esp
    7976:	c6 05 44 d7 00 00 00 	movb   $0x0,0xd744
    797d:	c6 05 94 f6 00 00 00 	movb   $0x0,0xf694
    7984:	e9 42 01 00 00       	jmp    7acb <in_process+0x18f>
    7989:	0f b6 05 94 f6 00 00 	movzbl 0xf694,%eax
    7990:	84 c0                	test   %al,%al
    7992:	0f 84 a9 00 00 00    	je     7a41 <in_process+0x105>
    7998:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
    799c:	0f 84 9f 00 00 00    	je     7a41 <in_process+0x105>
    79a2:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
    79a6:	0f 84 95 00 00 00    	je     7a41 <in_process+0x105>
    79ac:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    79b3:	74 64                	je     7a19 <in_process+0xdd>
    79b5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    79bc:	77 0b                	ja     79c9 <in_process+0x8d>
    79be:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    79c5:	74 64                	je     7a2b <in_process+0xef>
    79c7:	eb 73                	jmp    7a3c <in_process+0x100>
    79c9:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
    79d0:	74 0b                	je     79dd <in_process+0xa1>
    79d2:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
    79d9:	74 20                	je     79fb <in_process+0xbf>
    79db:	eb 5f                	jmp    7a3c <in_process+0x100>
    79dd:	83 ec 0c             	sub    $0xc,%esp
    79e0:	ff 75 08             	pushl  0x8(%ebp)
    79e3:	e8 54 f4 ff ff       	call   6e3c <scroll_up>
    79e8:	83 c4 10             	add    $0x10,%esp
    79eb:	c6 05 94 f6 00 00 00 	movb   $0x0,0xf694
    79f2:	c6 05 44 d7 00 00 00 	movb   $0x0,0xd744
    79f9:	eb 41                	jmp    7a3c <in_process+0x100>
    79fb:	83 ec 0c             	sub    $0xc,%esp
    79fe:	ff 75 08             	pushl  0x8(%ebp)
    7a01:	e8 78 f4 ff ff       	call   6e7e <scroll_down>
    7a06:	83 c4 10             	add    $0x10,%esp
    7a09:	c6 05 94 f6 00 00 00 	movb   $0x0,0xf694
    7a10:	c6 05 44 d7 00 00 00 	movb   $0x0,0xd744
    7a17:	eb 23                	jmp    7a3c <in_process+0x100>
    7a19:	83 ec 08             	sub    $0x8,%esp
    7a1c:	6a 0a                	push   $0xa
    7a1e:	ff 75 08             	pushl  0x8(%ebp)
    7a21:	e8 c3 f4 ff ff       	call   6ee9 <out_char>
    7a26:	83 c4 10             	add    $0x10,%esp
    7a29:	eb 11                	jmp    7a3c <in_process+0x100>
    7a2b:	83 ec 08             	sub    $0x8,%esp
    7a2e:	6a 08                	push   $0x8
    7a30:	ff 75 08             	pushl  0x8(%ebp)
    7a33:	e8 b1 f4 ff ff       	call   6ee9 <out_char>
    7a38:	83 c4 10             	add    $0x10,%esp
    7a3b:	90                   	nop
    7a3c:	e9 8a 00 00 00       	jmp    7acb <in_process+0x18f>
    7a41:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    7a48:	74 55                	je     7a9f <in_process+0x163>
    7a4a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    7a51:	77 14                	ja     7a67 <in_process+0x12b>
    7a53:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    7a5a:	74 31                	je     7a8d <in_process+0x151>
    7a5c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    7a63:	74 16                	je     7a7b <in_process+0x13f>
    7a65:	eb 64                	jmp    7acb <in_process+0x18f>
    7a67:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
    7a6e:	74 3e                	je     7aae <in_process+0x172>
    7a70:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
    7a77:	74 44                	je     7abd <in_process+0x181>
    7a79:	eb 50                	jmp    7acb <in_process+0x18f>
    7a7b:	83 ec 08             	sub    $0x8,%esp
    7a7e:	6a 0a                	push   $0xa
    7a80:	ff 75 08             	pushl  0x8(%ebp)
    7a83:	e8 48 f3 ff ff       	call   6dd0 <put_key>
    7a88:	83 c4 10             	add    $0x10,%esp
    7a8b:	eb 3e                	jmp    7acb <in_process+0x18f>
    7a8d:	83 ec 08             	sub    $0x8,%esp
    7a90:	6a 08                	push   $0x8
    7a92:	ff 75 08             	pushl  0x8(%ebp)
    7a95:	e8 36 f3 ff ff       	call   6dd0 <put_key>
    7a9a:	83 c4 10             	add    $0x10,%esp
    7a9d:	eb 2c                	jmp    7acb <in_process+0x18f>
    7a9f:	83 ec 0c             	sub    $0xc,%esp
    7aa2:	6a 00                	push   $0x0
    7aa4:	e8 f6 f1 ff ff       	call   6c9f <select_console>
    7aa9:	83 c4 10             	add    $0x10,%esp
    7aac:	eb 1d                	jmp    7acb <in_process+0x18f>
    7aae:	83 ec 0c             	sub    $0xc,%esp
    7ab1:	6a 01                	push   $0x1
    7ab3:	e8 e7 f1 ff ff       	call   6c9f <select_console>
    7ab8:	83 c4 10             	add    $0x10,%esp
    7abb:	eb 0e                	jmp    7acb <in_process+0x18f>
    7abd:	83 ec 0c             	sub    $0xc,%esp
    7ac0:	6a 02                	push   $0x2
    7ac2:	e8 d8 f1 ff ff       	call   6c9f <select_console>
    7ac7:	83 c4 10             	add    $0x10,%esp
    7aca:	90                   	nop
    7acb:	90                   	nop
    7acc:	c9                   	leave  
    7acd:	c3                   	ret    

00007ace <open>:
    7ace:	55                   	push   %ebp
    7acf:	89 e5                	mov    %esp,%ebp
    7ad1:	83 ec 78             	sub    $0x78,%esp
    7ad4:	83 ec 04             	sub    $0x4,%esp
    7ad7:	6a 6c                	push   $0x6c
    7ad9:	6a 00                	push   $0x0
    7adb:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7ade:	50                   	push   %eax
    7adf:	e8 d5 16 00 00       	call   91b9 <Memset>
    7ae4:	83 c4 10             	add    $0x10,%esp
    7ae7:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7aee:	8b 45 08             	mov    0x8(%ebp),%eax
    7af1:	89 45 c0             	mov    %eax,-0x40(%ebp)
    7af4:	8b 45 0c             	mov    0xc(%ebp),%eax
    7af7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7afa:	83 ec 0c             	sub    $0xc,%esp
    7afd:	ff 75 08             	pushl  0x8(%ebp)
    7b00:	e8 ed 16 00 00       	call   91f2 <Strlen>
    7b05:	83 c4 10             	add    $0x10,%esp
    7b08:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7b0b:	83 ec 04             	sub    $0x4,%esp
    7b0e:	6a 03                	push   $0x3
    7b10:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7b13:	50                   	push   %eax
    7b14:	6a 03                	push   $0x3
    7b16:	e8 fd bc ff ff       	call   3818 <send_rec>
    7b1b:	83 c4 10             	add    $0x10,%esp
    7b1e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7b21:	c9                   	leave  
    7b22:	c3                   	ret    

00007b23 <read>:
    7b23:	55                   	push   %ebp
    7b24:	89 e5                	mov    %esp,%ebp
    7b26:	83 ec 78             	sub    $0x78,%esp
    7b29:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
    7b30:	8b 45 08             	mov    0x8(%ebp),%eax
    7b33:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7b36:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b39:	89 45 9c             	mov    %eax,-0x64(%ebp)
    7b3c:	8b 45 10             	mov    0x10(%ebp),%eax
    7b3f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    7b42:	83 ec 04             	sub    $0x4,%esp
    7b45:	6a 03                	push   $0x3
    7b47:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7b4a:	50                   	push   %eax
    7b4b:	6a 03                	push   $0x3
    7b4d:	e8 c6 bc ff ff       	call   3818 <send_rec>
    7b52:	83 c4 10             	add    $0x10,%esp
    7b55:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b58:	c9                   	leave  
    7b59:	c3                   	ret    

00007b5a <write>:
    7b5a:	55                   	push   %ebp
    7b5b:	89 e5                	mov    %esp,%ebp
    7b5d:	83 ec 78             	sub    $0x78,%esp
    7b60:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
    7b67:	8b 45 08             	mov    0x8(%ebp),%eax
    7b6a:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7b6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b70:	89 45 9c             	mov    %eax,-0x64(%ebp)
    7b73:	8b 45 10             	mov    0x10(%ebp),%eax
    7b76:	89 45 dc             	mov    %eax,-0x24(%ebp)
    7b79:	83 ec 04             	sub    $0x4,%esp
    7b7c:	6a 03                	push   $0x3
    7b7e:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7b81:	50                   	push   %eax
    7b82:	6a 03                	push   $0x3
    7b84:	e8 8f bc ff ff       	call   3818 <send_rec>
    7b89:	83 c4 10             	add    $0x10,%esp
    7b8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b8f:	c9                   	leave  
    7b90:	c3                   	ret    

00007b91 <close>:
    7b91:	55                   	push   %ebp
    7b92:	89 e5                	mov    %esp,%ebp
    7b94:	83 ec 78             	sub    $0x78,%esp
    7b97:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    7b9e:	8b 45 08             	mov    0x8(%ebp),%eax
    7ba1:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7ba4:	83 ec 04             	sub    $0x4,%esp
    7ba7:	6a 03                	push   $0x3
    7ba9:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7bac:	50                   	push   %eax
    7bad:	6a 03                	push   $0x3
    7baf:	e8 64 bc ff ff       	call   3818 <send_rec>
    7bb4:	83 c4 10             	add    $0x10,%esp
    7bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bba:	83 f8 65             	cmp    $0x65,%eax
    7bbd:	74 19                	je     7bd8 <close+0x47>
    7bbf:	6a 14                	push   $0x14
    7bc1:	68 d1 90 00 00       	push   $0x90d1
    7bc6:	68 d1 90 00 00       	push   $0x90d1
    7bcb:	68 dd 90 00 00       	push   $0x90dd
    7bd0:	e8 d7 b3 ff ff       	call   2fac <assertion_failure>
    7bd5:	83 c4 10             	add    $0x10,%esp
    7bd8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7bdb:	c9                   	leave  
    7bdc:	c3                   	ret    

00007bdd <wait>:
    7bdd:	55                   	push   %ebp
    7bde:	89 e5                	mov    %esp,%ebp
    7be0:	83 ec 78             	sub    $0x78,%esp
    7be3:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
    7bea:	83 ec 04             	sub    $0x4,%esp
    7bed:	6a 04                	push   $0x4
    7bef:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7bf2:	50                   	push   %eax
    7bf3:	6a 03                	push   $0x3
    7bf5:	e8 1e bc ff ff       	call   3818 <send_rec>
    7bfa:	83 c4 10             	add    $0x10,%esp
    7bfd:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7c00:	89 c2                	mov    %eax,%edx
    7c02:	8b 45 08             	mov    0x8(%ebp),%eax
    7c05:	89 10                	mov    %edx,(%eax)
    7c07:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7c0a:	83 f8 20             	cmp    $0x20,%eax
    7c0d:	74 05                	je     7c14 <wait+0x37>
    7c0f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7c12:	eb 05                	jmp    7c19 <wait+0x3c>
    7c14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    7c19:	c9                   	leave  
    7c1a:	c3                   	ret    

00007c1b <exit>:
    7c1b:	55                   	push   %ebp
    7c1c:	89 e5                	mov    %esp,%ebp
    7c1e:	83 ec 78             	sub    $0x78,%esp
    7c21:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    7c28:	8b 45 08             	mov    0x8(%ebp),%eax
    7c2b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    7c2e:	83 ec 04             	sub    $0x4,%esp
    7c31:	6a 04                	push   $0x4
    7c33:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7c36:	50                   	push   %eax
    7c37:	6a 03                	push   $0x3
    7c39:	e8 da bb ff ff       	call   3818 <send_rec>
    7c3e:	83 c4 10             	add    $0x10,%esp
    7c41:	90                   	nop
    7c42:	c9                   	leave  
    7c43:	c3                   	ret    

00007c44 <fork>:
    7c44:	55                   	push   %ebp
    7c45:	89 e5                	mov    %esp,%ebp
    7c47:	83 ec 78             	sub    $0x78,%esp
    7c4a:	83 ec 04             	sub    $0x4,%esp
    7c4d:	6a 6c                	push   $0x6c
    7c4f:	6a 00                	push   $0x0
    7c51:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7c54:	50                   	push   %eax
    7c55:	e8 5f 15 00 00       	call   91b9 <Memset>
    7c5a:	83 c4 10             	add    $0x10,%esp
    7c5d:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
    7c64:	83 ec 04             	sub    $0x4,%esp
    7c67:	6a 04                	push   $0x4
    7c69:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7c6c:	50                   	push   %eax
    7c6d:	6a 03                	push   $0x3
    7c6f:	e8 a4 bb ff ff       	call   3818 <send_rec>
    7c74:	83 c4 10             	add    $0x10,%esp
    7c77:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
    7c7e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7c81:	85 c0                	test   %eax,%eax
    7c83:	74 19                	je     7c9e <fork+0x5a>
    7c85:	6a 15                	push   $0x15
    7c87:	68 f5 90 00 00       	push   $0x90f5
    7c8c:	68 f5 90 00 00       	push   $0x90f5
    7c91:	68 00 91 00 00       	push   $0x9100
    7c96:	e8 11 b3 ff ff       	call   2fac <assertion_failure>
    7c9b:	83 c4 10             	add    $0x10,%esp
    7c9e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7ca1:	c9                   	leave  
    7ca2:	c3                   	ret    

00007ca3 <getpid>:
    7ca3:	55                   	push   %ebp
    7ca4:	89 e5                	mov    %esp,%ebp
    7ca6:	83 ec 78             	sub    $0x78,%esp
    7ca9:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
    7cb0:	83 ec 04             	sub    $0x4,%esp
    7cb3:	6a 01                	push   $0x1
    7cb5:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7cb8:	50                   	push   %eax
    7cb9:	6a 03                	push   $0x3
    7cbb:	e8 58 bb ff ff       	call   3818 <send_rec>
    7cc0:	83 c4 10             	add    $0x10,%esp
    7cc3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7cc6:	c9                   	leave  
    7cc7:	c3                   	ret    

00007cc8 <exec>:
    7cc8:	55                   	push   %ebp
    7cc9:	89 e5                	mov    %esp,%ebp
    7ccb:	83 ec 78             	sub    $0x78,%esp
    7cce:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
    7cd5:	8b 45 08             	mov    0x8(%ebp),%eax
    7cd8:	89 45 c0             	mov    %eax,-0x40(%ebp)
    7cdb:	83 ec 0c             	sub    $0xc,%esp
    7cde:	ff 75 08             	pushl  0x8(%ebp)
    7ce1:	e8 0c 15 00 00       	call   91f2 <Strlen>
    7ce6:	83 c4 10             	add    $0x10,%esp
    7ce9:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7cec:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
    7cf3:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
    7cfa:	83 ec 04             	sub    $0x4,%esp
    7cfd:	6a 04                	push   $0x4
    7cff:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7d02:	50                   	push   %eax
    7d03:	6a 03                	push   $0x3
    7d05:	e8 0e bb ff ff       	call   3818 <send_rec>
    7d0a:	83 c4 10             	add    $0x10,%esp
    7d0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d10:	83 f8 65             	cmp    $0x65,%eax
    7d13:	74 19                	je     7d2e <exec+0x66>
    7d15:	6a 1a                	push   $0x1a
    7d17:	68 10 91 00 00       	push   $0x9110
    7d1c:	68 10 91 00 00       	push   $0x9110
    7d21:	68 1b 91 00 00       	push   $0x911b
    7d26:	e8 81 b2 ff ff       	call   2fac <assertion_failure>
    7d2b:	83 c4 10             	add    $0x10,%esp
    7d2e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7d31:	c9                   	leave  
    7d32:	c3                   	ret    

00007d33 <execv>:
    7d33:	55                   	push   %ebp
    7d34:	89 e5                	mov    %esp,%ebp
    7d36:	57                   	push   %edi
    7d37:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
    7d3d:	83 ec 04             	sub    $0x4,%esp
    7d40:	68 00 80 00 00       	push   $0x8000
    7d45:	6a 00                	push   $0x0
    7d47:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7d4d:	50                   	push   %eax
    7d4e:	e8 66 14 00 00       	call   91b9 <Memset>
    7d53:	83 c4 10             	add    $0x10,%esp
    7d56:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d59:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7d5c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7d63:	eb 0d                	jmp    7d72 <execv+0x3f>
    7d65:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    7d69:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d6c:	83 c0 04             	add    $0x4,%eax
    7d6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d75:	8b 00                	mov    (%eax),%eax
    7d77:	85 c0                	test   %eax,%eax
    7d79:	75 ea                	jne    7d65 <execv+0x32>
    7d7b:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7d81:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d84:	01 d0                	add    %edx,%eax
    7d86:	c6 00 00             	movb   $0x0,(%eax)
    7d89:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d8c:	83 c0 04             	add    $0x4,%eax
    7d8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7d92:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7d98:	89 45 ec             	mov    %eax,-0x14(%ebp)
    7d9b:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d9e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7da1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7da8:	eb 64                	jmp    7e0e <execv+0xdb>
    7daa:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7db0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7db3:	01 c2                	add    %eax,%edx
    7db5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7db8:	89 10                	mov    %edx,(%eax)
    7dba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7dbd:	8b 00                	mov    (%eax),%eax
    7dbf:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
    7dc5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7dc8:	01 ca                	add    %ecx,%edx
    7dca:	83 ec 08             	sub    $0x8,%esp
    7dcd:	50                   	push   %eax
    7dce:	52                   	push   %edx
    7dcf:	e8 04 14 00 00       	call   91d8 <Strcpy>
    7dd4:	83 c4 10             	add    $0x10,%esp
    7dd7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7dda:	8b 00                	mov    (%eax),%eax
    7ddc:	83 ec 0c             	sub    $0xc,%esp
    7ddf:	50                   	push   %eax
    7de0:	e8 0d 14 00 00       	call   91f2 <Strlen>
    7de5:	83 c4 10             	add    $0x10,%esp
    7de8:	01 45 f0             	add    %eax,-0x10(%ebp)
    7deb:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7df1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7df4:	01 d0                	add    %edx,%eax
    7df6:	c6 00 00             	movb   $0x0,(%eax)
    7df9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7dfc:	83 c0 01             	add    $0x1,%eax
    7dff:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7e02:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    7e06:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
    7e0a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7e0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7e11:	8b 00                	mov    (%eax),%eax
    7e13:	85 c0                	test   %eax,%eax
    7e15:	75 93                	jne    7daa <execv+0x77>
    7e17:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7e1d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7e20:	eb 04                	jmp    7e26 <execv+0xf3>
    7e22:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
    7e26:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7e29:	8b 00                	mov    (%eax),%eax
    7e2b:	85 c0                	test   %eax,%eax
    7e2d:	75 f3                	jne    7e22 <execv+0xef>
    7e2f:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
    7e35:	b8 00 00 00 00       	mov    $0x0,%eax
    7e3a:	b9 0a 00 00 00       	mov    $0xa,%ecx
    7e3f:	89 d7                	mov    %edx,%edi
    7e41:	f3 ab                	rep stos %eax,%es:(%edi)
    7e43:	c7 85 4c 7f ff ff 33 	movl   $0x9133,-0x80b4(%ebp)
    7e4a:	91 00 00 
    7e4d:	c7 85 50 7f ff ff 3a 	movl   $0x913a,-0x80b0(%ebp)
    7e54:	91 00 00 
    7e57:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
    7e5e:	00 00 00 
    7e61:	8b 45 08             	mov    0x8(%ebp),%eax
    7e64:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
    7e6a:	83 ec 0c             	sub    $0xc,%esp
    7e6d:	ff 75 08             	pushl  0x8(%ebp)
    7e70:	e8 7d 13 00 00       	call   91f2 <Strlen>
    7e75:	83 c4 10             	add    $0x10,%esp
    7e78:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
    7e7e:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7e84:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
    7e8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e8d:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
    7e93:	83 ec 04             	sub    $0x4,%esp
    7e96:	6a 04                	push   $0x4
    7e98:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
    7e9e:	50                   	push   %eax
    7e9f:	6a 03                	push   $0x3
    7ea1:	e8 72 b9 ff ff       	call   3818 <send_rec>
    7ea6:	83 c4 10             	add    $0x10,%esp
    7ea9:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
    7eaf:	83 f8 65             	cmp    $0x65,%eax
    7eb2:	74 19                	je     7ecd <execv+0x19a>
    7eb4:	6a 73                	push   $0x73
    7eb6:	68 10 91 00 00       	push   $0x9110
    7ebb:	68 10 91 00 00       	push   $0x9110
    7ec0:	68 1b 91 00 00       	push   $0x911b
    7ec5:	e8 e2 b0 ff ff       	call   2fac <assertion_failure>
    7eca:	83 c4 10             	add    $0x10,%esp
    7ecd:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
    7ed3:	8b 7d fc             	mov    -0x4(%ebp),%edi
    7ed6:	c9                   	leave  
    7ed7:	c3                   	ret    

00007ed8 <execl>:
    7ed8:	55                   	push   %ebp
    7ed9:	89 e5                	mov    %esp,%ebp
    7edb:	83 ec 18             	sub    $0x18,%esp
    7ede:	8d 45 0c             	lea    0xc(%ebp),%eax
    7ee1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7ee4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ee7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7eea:	83 ec 08             	sub    $0x8,%esp
    7eed:	ff 75 f0             	pushl  -0x10(%ebp)
    7ef0:	ff 75 08             	pushl  0x8(%ebp)
    7ef3:	e8 3b fe ff ff       	call   7d33 <execv>
    7ef8:	83 c4 10             	add    $0x10,%esp
    7efb:	c9                   	leave  
    7efc:	c3                   	ret    

00007efd <TaskMM>:
    7efd:	55                   	push   %ebp
    7efe:	89 e5                	mov    %esp,%ebp
    7f00:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    7f06:	83 ec 04             	sub    $0x4,%esp
    7f09:	6a 11                	push   $0x11
    7f0b:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7f11:	50                   	push   %eax
    7f12:	6a 02                	push   $0x2
    7f14:	e8 ff b8 ff ff       	call   3818 <send_rec>
    7f19:	83 c4 10             	add    $0x10,%esp
    7f1c:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    7f22:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7f25:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
    7f2b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    7f2e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    7f35:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
    7f3c:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
    7f43:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
    7f4a:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7f4e:	74 4e                	je     7f9e <TaskMM+0xa1>
    7f50:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7f54:	7f 08                	jg     7f5e <TaskMM+0x61>
    7f56:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    7f5a:	74 27                	je     7f83 <TaskMM+0x86>
    7f5c:	eb 79                	jmp    7fd7 <TaskMM+0xda>
    7f5e:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    7f62:	74 08                	je     7f6c <TaskMM+0x6f>
    7f64:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    7f68:	74 52                	je     7fbc <TaskMM+0xbf>
    7f6a:	eb 6b                	jmp    7fd7 <TaskMM+0xda>
    7f6c:	83 ec 0c             	sub    $0xc,%esp
    7f6f:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7f75:	50                   	push   %eax
    7f76:	e8 f6 03 00 00       	call   8371 <do_fork>
    7f7b:	83 c4 10             	add    $0x10,%esp
    7f7e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    7f81:	eb 65                	jmp    7fe8 <TaskMM+0xeb>
    7f83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7f8a:	83 ec 0c             	sub    $0xc,%esp
    7f8d:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7f93:	50                   	push   %eax
    7f94:	e8 a8 00 00 00       	call   8041 <do_exec>
    7f99:	83 c4 10             	add    $0x10,%esp
    7f9c:	eb 4a                	jmp    7fe8 <TaskMM+0xeb>
    7f9e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fa5:	83 ec 08             	sub    $0x8,%esp
    7fa8:	ff 75 e4             	pushl  -0x1c(%ebp)
    7fab:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7fb1:	50                   	push   %eax
    7fb2:	e8 c4 05 00 00       	call   857b <do_exit>
    7fb7:	83 c4 10             	add    $0x10,%esp
    7fba:	eb 2c                	jmp    7fe8 <TaskMM+0xeb>
    7fbc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fc3:	83 ec 0c             	sub    $0xc,%esp
    7fc6:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7fcc:	50                   	push   %eax
    7fcd:	e8 a5 06 00 00       	call   8677 <do_wait>
    7fd2:	83 c4 10             	add    $0x10,%esp
    7fd5:	eb 11                	jmp    7fe8 <TaskMM+0xeb>
    7fd7:	83 ec 0c             	sub    $0xc,%esp
    7fda:	68 41 91 00 00       	push   $0x9141
    7fdf:	e8 aa af ff ff       	call   2f8e <panic>
    7fe4:	83 c4 10             	add    $0x10,%esp
    7fe7:	90                   	nop
    7fe8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7fec:	0f 84 14 ff ff ff    	je     7f06 <TaskMM+0x9>
    7ff2:	83 ec 04             	sub    $0x4,%esp
    7ff5:	ff 75 ec             	pushl  -0x14(%ebp)
    7ff8:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    7ffe:	50                   	push   %eax
    7fff:	6a 01                	push   $0x1
    8001:	e8 12 b8 ff ff       	call   3818 <send_rec>
    8006:	83 c4 10             	add    $0x10,%esp
    8009:	e9 f8 fe ff ff       	jmp    7f06 <TaskMM+0x9>

0000800e <alloc_mem>:
    800e:	55                   	push   %ebp
    800f:	89 e5                	mov    %esp,%ebp
    8011:	83 ec 10             	sub    $0x10,%esp
    8014:	8b 45 08             	mov    0x8(%ebp),%eax
    8017:	83 e8 07             	sub    $0x7,%eax
    801a:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
    8020:	05 00 00 a0 00       	add    $0xa00000,%eax
    8025:	89 45 fc             	mov    %eax,-0x4(%ebp)
    8028:	8b 45 fc             	mov    -0x4(%ebp),%eax
    802b:	c9                   	leave  
    802c:	c3                   	ret    

0000802d <do_exec2>:
    802d:	55                   	push   %ebp
    802e:	89 e5                	mov    %esp,%ebp
    8030:	83 ec 10             	sub    $0x10,%esp
    8033:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
    803a:	b8 00 00 00 00       	mov    $0x0,%eax
    803f:	c9                   	leave  
    8040:	c3                   	ret    

00008041 <do_exec>:
    8041:	55                   	push   %ebp
    8042:	89 e5                	mov    %esp,%ebp
    8044:	56                   	push   %esi
    8045:	53                   	push   %ebx
    8046:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
    804c:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
    8053:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
    805a:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
    8060:	83 ec 08             	sub    $0x8,%esp
    8063:	6a 00                	push   $0x0
    8065:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    8068:	50                   	push   %eax
    8069:	e8 60 fa ff ff       	call   7ace <open>
    806e:	83 c4 10             	add    $0x10,%esp
    8071:	89 45 dc             	mov    %eax,-0x24(%ebp)
    8074:	8b 45 08             	mov    0x8(%ebp),%eax
    8077:	8b 00                	mov    (%eax),%eax
    8079:	89 45 d8             	mov    %eax,-0x28(%ebp)
    807c:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
    8083:	83 ec 04             	sub    $0x4,%esp
    8086:	6a 0c                	push   $0xc
    8088:	6a 00                	push   $0x0
    808a:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    8090:	50                   	push   %eax
    8091:	e8 23 11 00 00       	call   91b9 <Memset>
    8096:	83 c4 10             	add    $0x10,%esp
    8099:	8b 45 08             	mov    0x8(%ebp),%eax
    809c:	8b 40 30             	mov    0x30(%eax),%eax
    809f:	89 c6                	mov    %eax,%esi
    80a1:	8b 45 08             	mov    0x8(%ebp),%eax
    80a4:	8b 40 34             	mov    0x34(%eax),%eax
    80a7:	83 ec 08             	sub    $0x8,%esp
    80aa:	50                   	push   %eax
    80ab:	ff 75 d8             	pushl  -0x28(%ebp)
    80ae:	e8 58 e9 ff ff       	call   6a0b <v2l>
    80b3:	83 c4 10             	add    $0x10,%esp
    80b6:	89 c3                	mov    %eax,%ebx
    80b8:	83 ec 08             	sub    $0x8,%esp
    80bb:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    80c1:	50                   	push   %eax
    80c2:	6a 04                	push   $0x4
    80c4:	e8 42 e9 ff ff       	call   6a0b <v2l>
    80c9:	83 c4 10             	add    $0x10,%esp
    80cc:	83 ec 04             	sub    $0x4,%esp
    80cf:	56                   	push   %esi
    80d0:	53                   	push   %ebx
    80d1:	50                   	push   %eax
    80d2:	e8 b4 10 00 00       	call   918b <Memcpy>
    80d7:	83 c4 10             	add    $0x10,%esp
    80da:	83 ec 08             	sub    $0x8,%esp
    80dd:	6a 00                	push   $0x0
    80df:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    80e5:	50                   	push   %eax
    80e6:	e8 e3 f9 ff ff       	call   7ace <open>
    80eb:	83 c4 10             	add    $0x10,%esp
    80ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
    80f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    80f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    80fb:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
    8101:	01 d0                	add    %edx,%eax
    8103:	83 ec 04             	sub    $0x4,%esp
    8106:	68 00 02 00 00       	push   $0x200
    810b:	50                   	push   %eax
    810c:	ff 75 d0             	pushl  -0x30(%ebp)
    810f:	e8 0f fa ff ff       	call   7b23 <read>
    8114:	83 c4 10             	add    $0x10,%esp
    8117:	89 45 cc             	mov    %eax,-0x34(%ebp)
    811a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    811d:	01 45 f4             	add    %eax,-0xc(%ebp)
    8120:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    8124:	74 02                	je     8128 <do_exec+0xe7>
    8126:	eb d0                	jmp    80f8 <do_exec+0xb7>
    8128:	90                   	nop
    8129:	83 ec 0c             	sub    $0xc,%esp
    812c:	ff 75 d0             	pushl  -0x30(%ebp)
    812f:	e8 5d fa ff ff       	call   7b91 <close>
    8134:	83 c4 10             	add    $0x10,%esp
    8137:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
    813d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8140:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8147:	eb 72                	jmp    81bb <do_exec+0x17a>
    8149:	8b 45 c8             	mov    -0x38(%ebp),%eax
    814c:	0f b7 40 28          	movzwl 0x28(%eax),%eax
    8150:	0f b7 d0             	movzwl %ax,%edx
    8153:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8156:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
    815a:	0f b7 c0             	movzwl %ax,%eax
    815d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    8161:	01 c2                	add    %eax,%edx
    8163:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
    8169:	01 d0                	add    %edx,%eax
    816b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    816e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    8171:	8b 40 10             	mov    0x10(%eax),%eax
    8174:	89 c6                	mov    %eax,%esi
    8176:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    8179:	8b 40 04             	mov    0x4(%eax),%eax
    817c:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
    8182:	01 d0                	add    %edx,%eax
    8184:	83 ec 08             	sub    $0x8,%esp
    8187:	50                   	push   %eax
    8188:	6a 04                	push   $0x4
    818a:	e8 7c e8 ff ff       	call   6a0b <v2l>
    818f:	83 c4 10             	add    $0x10,%esp
    8192:	89 c3                	mov    %eax,%ebx
    8194:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    8197:	8b 40 08             	mov    0x8(%eax),%eax
    819a:	83 ec 08             	sub    $0x8,%esp
    819d:	50                   	push   %eax
    819e:	ff 75 d8             	pushl  -0x28(%ebp)
    81a1:	e8 65 e8 ff ff       	call   6a0b <v2l>
    81a6:	83 c4 10             	add    $0x10,%esp
    81a9:	83 ec 04             	sub    $0x4,%esp
    81ac:	56                   	push   %esi
    81ad:	53                   	push   %ebx
    81ae:	50                   	push   %eax
    81af:	e8 d7 0f 00 00       	call   918b <Memcpy>
    81b4:	83 c4 10             	add    $0x10,%esp
    81b7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    81bb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    81be:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    81c2:	0f b7 c0             	movzwl %ax,%eax
    81c5:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    81c8:	0f 8c 7b ff ff ff    	jl     8149 <do_exec+0x108>
    81ce:	8b 45 08             	mov    0x8(%ebp),%eax
    81d1:	8b 40 10             	mov    0x10(%eax),%eax
    81d4:	89 45 c0             	mov    %eax,-0x40(%ebp)
    81d7:	8b 45 08             	mov    0x8(%ebp),%eax
    81da:	8b 40 1c             	mov    0x1c(%eax),%eax
    81dd:	89 45 bc             	mov    %eax,-0x44(%ebp)
    81e0:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
    81e7:	83 ec 08             	sub    $0x8,%esp
    81ea:	ff 75 c0             	pushl  -0x40(%ebp)
    81ed:	ff 75 d8             	pushl  -0x28(%ebp)
    81f0:	e8 16 e8 ff ff       	call   6a0b <v2l>
    81f5:	83 c4 10             	add    $0x10,%esp
    81f8:	89 c3                	mov    %eax,%ebx
    81fa:	83 ec 08             	sub    $0x8,%esp
    81fd:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    8203:	50                   	push   %eax
    8204:	6a 04                	push   $0x4
    8206:	e8 00 e8 ff ff       	call   6a0b <v2l>
    820b:	83 c4 10             	add    $0x10,%esp
    820e:	83 ec 04             	sub    $0x4,%esp
    8211:	ff 75 bc             	pushl  -0x44(%ebp)
    8214:	53                   	push   %ebx
    8215:	50                   	push   %eax
    8216:	e8 70 0f 00 00       	call   918b <Memcpy>
    821b:	83 c4 10             	add    $0x10,%esp
    821e:	83 ec 08             	sub    $0x8,%esp
    8221:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    8227:	50                   	push   %eax
    8228:	6a 04                	push   $0x4
    822a:	e8 dc e7 ff ff       	call   6a0b <v2l>
    822f:	83 c4 10             	add    $0x10,%esp
    8232:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    8235:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    8238:	89 45 ec             	mov    %eax,-0x14(%ebp)
    823b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8242:	eb 08                	jmp    824c <do_exec+0x20b>
    8244:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8248:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
    824c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    824f:	8b 00                	mov    (%eax),%eax
    8251:	85 c0                	test   %eax,%eax
    8253:	75 ef                	jne    8244 <do_exec+0x203>
    8255:	8b 45 b8             	mov    -0x48(%ebp),%eax
    8258:	2b 45 c0             	sub    -0x40(%ebp),%eax
    825b:	89 45 b0             	mov    %eax,-0x50(%ebp)
    825e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8265:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    826b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    826e:	eb 17                	jmp    8287 <do_exec+0x246>
    8270:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8274:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8277:	8b 10                	mov    (%eax),%edx
    8279:	8b 45 b0             	mov    -0x50(%ebp),%eax
    827c:	01 c2                	add    %eax,%edx
    827e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8281:	89 10                	mov    %edx,(%eax)
    8283:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
    8287:	8b 45 e0             	mov    -0x20(%ebp),%eax
    828a:	8b 00                	mov    (%eax),%eax
    828c:	85 c0                	test   %eax,%eax
    828e:	75 e0                	jne    8270 <do_exec+0x22f>
    8290:	83 ec 08             	sub    $0x8,%esp
    8293:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    8299:	50                   	push   %eax
    829a:	6a 04                	push   $0x4
    829c:	e8 6a e7 ff ff       	call   6a0b <v2l>
    82a1:	83 c4 10             	add    $0x10,%esp
    82a4:	89 c3                	mov    %eax,%ebx
    82a6:	83 ec 08             	sub    $0x8,%esp
    82a9:	ff 75 b8             	pushl  -0x48(%ebp)
    82ac:	ff 75 d8             	pushl  -0x28(%ebp)
    82af:	e8 57 e7 ff ff       	call   6a0b <v2l>
    82b4:	83 c4 10             	add    $0x10,%esp
    82b7:	83 ec 04             	sub    $0x4,%esp
    82ba:	ff 75 bc             	pushl  -0x44(%ebp)
    82bd:	53                   	push   %ebx
    82be:	50                   	push   %eax
    82bf:	e8 c7 0e 00 00       	call   918b <Memcpy>
    82c4:	83 c4 10             	add    $0x10,%esp
    82c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    82ca:	89 45 ac             	mov    %eax,-0x54(%ebp)
    82cd:	8b 45 b8             	mov    -0x48(%ebp),%eax
    82d0:	8b 55 ac             	mov    -0x54(%ebp),%edx
    82d3:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    82d9:	81 c2 ac 11 08 00    	add    $0x811ac,%edx
    82df:	89 02                	mov    %eax,(%edx)
    82e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    82e4:	8b 55 ac             	mov    -0x54(%ebp),%edx
    82e7:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    82ed:	81 c2 a8 11 08 00    	add    $0x811a8,%edx
    82f3:	89 02                	mov    %eax,(%edx)
    82f5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    82f8:	8b 40 18             	mov    0x18(%eax),%eax
    82fb:	8b 55 ac             	mov    -0x54(%ebp),%edx
    82fe:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    8304:	81 c2 b0 11 08 00    	add    $0x811b0,%edx
    830a:	89 02                	mov    %eax,(%edx)
    830c:	8b 45 b8             	mov    -0x48(%ebp),%eax
    830f:	8b 55 ac             	mov    -0x54(%ebp),%edx
    8312:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    8318:	81 c2 bc 11 08 00    	add    $0x811bc,%edx
    831e:	89 02                	mov    %eax,(%edx)
    8320:	8b 45 ac             	mov    -0x54(%ebp),%eax
    8323:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8329:	05 04 13 08 00       	add    $0x81304,%eax
    832e:	c7 00 20 00 00 00    	movl   $0x20,(%eax)
    8334:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
    833b:	00 00 00 
    833e:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
    8345:	00 00 00 
    8348:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
    834f:	00 00 00 
    8352:	83 ec 04             	sub    $0x4,%esp
    8355:	ff 75 d8             	pushl  -0x28(%ebp)
    8358:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
    835e:	50                   	push   %eax
    835f:	6a 01                	push   $0x1
    8361:	e8 b2 b4 ff ff       	call   3818 <send_rec>
    8366:	83 c4 10             	add    $0x10,%esp
    8369:	90                   	nop
    836a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    836d:	5b                   	pop    %ebx
    836e:	5e                   	pop    %esi
    836f:	5d                   	pop    %ebp
    8370:	c3                   	ret    

00008371 <do_fork>:
    8371:	55                   	push   %ebp
    8372:	89 e5                	mov    %esp,%ebp
    8374:	57                   	push   %edi
    8375:	56                   	push   %esi
    8376:	53                   	push   %ebx
    8377:	81 ec ac 00 00 00    	sub    $0xac,%esp
    837d:	c7 45 e4 e0 1c 08 00 	movl   $0x81ce0,-0x1c(%ebp)
    8384:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    838b:	c7 45 dc 07 00 00 00 	movl   $0x7,-0x24(%ebp)
    8392:	eb 21                	jmp    83b5 <do_fork+0x44>
    8394:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8397:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    839e:	3c ff                	cmp    $0xff,%al
    83a0:	75 08                	jne    83aa <do_fork+0x39>
    83a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    83a8:	eb 11                	jmp    83bb <do_fork+0x4a>
    83aa:	81 45 e4 a0 01 00 00 	addl   $0x1a0,-0x1c(%ebp)
    83b1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    83b5:	83 7d dc 20          	cmpl   $0x20,-0x24(%ebp)
    83b9:	7e d9                	jle    8394 <do_fork+0x23>
    83bb:	83 7d e0 06          	cmpl   $0x6,-0x20(%ebp)
    83bf:	7f 19                	jg     83da <do_fork+0x69>
    83c1:	6a 26                	push   $0x26
    83c3:	68 54 91 00 00       	push   $0x9154
    83c8:	68 54 91 00 00       	push   $0x9154
    83cd:	68 64 91 00 00       	push   $0x9164
    83d2:	e8 d5 ab ff ff       	call   2fac <assertion_failure>
    83d7:	83 c4 10             	add    $0x10,%esp
    83da:	8b 45 08             	mov    0x8(%ebp),%eax
    83dd:	8b 00                	mov    (%eax),%eax
    83df:	89 45 d8             	mov    %eax,-0x28(%ebp)
    83e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    83e5:	0f b7 40 44          	movzwl 0x44(%eax),%eax
    83e9:	0f b7 c0             	movzwl %ax,%eax
    83ec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    83ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    83f2:	8b 55 d8             	mov    -0x28(%ebp),%edx
    83f5:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    83fb:	8d 8a 80 11 08 00    	lea    0x81180(%edx),%ecx
    8401:	89 c2                	mov    %eax,%edx
    8403:	89 cb                	mov    %ecx,%ebx
    8405:	b8 68 00 00 00       	mov    $0x68,%eax
    840a:	89 d7                	mov    %edx,%edi
    840c:	89 de                	mov    %ebx,%esi
    840e:	89 c1                	mov    %eax,%ecx
    8410:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    8412:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8415:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8418:	89 50 58             	mov    %edx,0x58(%eax)
    841b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    841e:	89 c2                	mov    %eax,%edx
    8420:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8423:	66 89 50 44          	mov    %dx,0x44(%eax)
    8427:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    842a:	8b 55 d8             	mov    -0x28(%ebp),%edx
    842d:	89 90 98 01 00 00    	mov    %edx,0x198(%eax)
    8433:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8436:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    843c:	83 c0 40             	add    $0x40,%eax
    843f:	05 80 11 08 00       	add    $0x81180,%eax
    8444:	83 c0 06             	add    $0x6,%eax
    8447:	89 45 d0             	mov    %eax,-0x30(%ebp)
    844a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    844d:	0f b6 40 07          	movzbl 0x7(%eax),%eax
    8451:	0f b6 c0             	movzbl %al,%eax
    8454:	c1 e0 18             	shl    $0x18,%eax
    8457:	89 c2                	mov    %eax,%edx
    8459:	8b 45 d0             	mov    -0x30(%ebp),%eax
    845c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    8460:	0f b6 c0             	movzbl %al,%eax
    8463:	c1 e0 10             	shl    $0x10,%eax
    8466:	01 c2                	add    %eax,%edx
    8468:	8b 45 d0             	mov    -0x30(%ebp),%eax
    846b:	0f b7 40 02          	movzwl 0x2(%eax),%eax
    846f:	0f b7 c0             	movzwl %ax,%eax
    8472:	01 d0                	add    %edx,%eax
    8474:	89 45 cc             	mov    %eax,-0x34(%ebp)
    8477:	8b 45 d0             	mov    -0x30(%ebp),%eax
    847a:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    847e:	0f b6 c0             	movzbl %al,%eax
    8481:	25 00 00 0f 00       	and    $0xf0000,%eax
    8486:	89 c2                	mov    %eax,%edx
    8488:	8b 45 d0             	mov    -0x30(%ebp),%eax
    848b:	0f b7 00             	movzwl (%eax),%eax
    848e:	0f b7 c0             	movzwl %ax,%eax
    8491:	01 d0                	add    %edx,%eax
    8493:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8496:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8499:	83 c0 01             	add    $0x1,%eax
    849c:	c1 e0 0c             	shl    $0xc,%eax
    849f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    84a2:	83 ec 08             	sub    $0x8,%esp
    84a5:	ff 75 c4             	pushl  -0x3c(%ebp)
    84a8:	ff 75 e0             	pushl  -0x20(%ebp)
    84ab:	e8 5e fb ff ff       	call   800e <alloc_mem>
    84b0:	83 c4 10             	add    $0x10,%esp
    84b3:	89 45 c0             	mov    %eax,-0x40(%ebp)
    84b6:	8b 55 cc             	mov    -0x34(%ebp),%edx
    84b9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    84bc:	83 ec 04             	sub    $0x4,%esp
    84bf:	ff 75 c4             	pushl  -0x3c(%ebp)
    84c2:	52                   	push   %edx
    84c3:	50                   	push   %eax
    84c4:	e8 c2 0c 00 00       	call   918b <Memcpy>
    84c9:	83 c4 10             	add    $0x10,%esp
    84cc:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
    84d3:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
    84da:	8b 45 b8             	mov    -0x48(%ebp),%eax
    84dd:	0f b7 c8             	movzwl %ax,%ecx
    84e0:	8b 55 c8             	mov    -0x38(%ebp),%edx
    84e3:	8b 45 c0             	mov    -0x40(%ebp),%eax
    84e6:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    84e9:	69 db a0 01 00 00    	imul   $0x1a0,%ebx,%ebx
    84ef:	83 c3 40             	add    $0x40,%ebx
    84f2:	81 c3 80 11 08 00    	add    $0x81180,%ebx
    84f8:	83 c3 06             	add    $0x6,%ebx
    84fb:	51                   	push   %ecx
    84fc:	52                   	push   %edx
    84fd:	50                   	push   %eax
    84fe:	53                   	push   %ebx
    84ff:	e8 ff e3 ff ff       	call   6903 <InitDescriptor>
    8504:	83 c4 10             	add    $0x10,%esp
    8507:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
    850e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    8511:	0f b7 c8             	movzwl %ax,%ecx
    8514:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8517:	8b 45 c0             	mov    -0x40(%ebp),%eax
    851a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    851d:	69 db a0 01 00 00    	imul   $0x1a0,%ebx,%ebx
    8523:	83 c3 48             	add    $0x48,%ebx
    8526:	81 c3 80 11 08 00    	add    $0x81180,%ebx
    852c:	83 c3 06             	add    $0x6,%ebx
    852f:	51                   	push   %ecx
    8530:	52                   	push   %edx
    8531:	50                   	push   %eax
    8532:	53                   	push   %ebx
    8533:	e8 cb e3 ff ff       	call   6903 <InitDescriptor>
    8538:	83 c4 10             	add    $0x10,%esp
    853b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    853e:	8b 45 08             	mov    0x8(%ebp),%eax
    8541:	89 50 4c             	mov    %edx,0x4c(%eax)
    8544:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
    854b:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
    8552:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
    8559:	83 ec 04             	sub    $0x4,%esp
    855c:	ff 75 e0             	pushl  -0x20(%ebp)
    855f:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
    8565:	50                   	push   %eax
    8566:	6a 01                	push   $0x1
    8568:	e8 ab b2 ff ff       	call   3818 <send_rec>
    856d:	83 c4 10             	add    $0x10,%esp
    8570:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8573:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8576:	5b                   	pop    %ebx
    8577:	5e                   	pop    %esi
    8578:	5f                   	pop    %edi
    8579:	5d                   	pop    %ebp
    857a:	c3                   	ret    

0000857b <do_exit>:
    857b:	55                   	push   %ebp
    857c:	89 e5                	mov    %esp,%ebp
    857e:	83 ec 18             	sub    $0x18,%esp
    8581:	8b 45 08             	mov    0x8(%ebp),%eax
    8584:	8b 00                	mov    (%eax),%eax
    8586:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8589:	8b 45 f0             	mov    -0x10(%ebp),%eax
    858c:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8592:	05 80 11 08 00       	add    $0x81180,%eax
    8597:	89 45 ec             	mov    %eax,-0x14(%ebp)
    859a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    859d:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    85a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    85a6:	8b 45 08             	mov    0x8(%ebp),%eax
    85a9:	8b 40 44             	mov    0x44(%eax),%eax
    85ac:	89 c2                	mov    %eax,%edx
    85ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85b1:	89 90 9c 01 00 00    	mov    %edx,0x19c(%eax)
    85b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85ba:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    85c0:	05 fd 12 08 00       	add    $0x812fd,%eax
    85c5:	0f b6 00             	movzbl (%eax),%eax
    85c8:	3c 04                	cmp    $0x4,%al
    85ca:	75 21                	jne    85ed <do_exit+0x72>
    85cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85cf:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    85d5:	05 fd 12 08 00       	add    $0x812fd,%eax
    85da:	c6 00 fb             	movb   $0xfb,(%eax)
    85dd:	83 ec 0c             	sub    $0xc,%esp
    85e0:	ff 75 ec             	pushl  -0x14(%ebp)
    85e3:	e8 59 01 00 00       	call   8741 <cleanup>
    85e8:	83 c4 10             	add    $0x10,%esp
    85eb:	eb 0a                	jmp    85f7 <do_exit+0x7c>
    85ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85f0:	c6 80 7c 01 00 00 03 	movb   $0x3,0x17c(%eax)
    85f7:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
    85fe:	eb 6e                	jmp    866e <do_exit+0xf3>
    8600:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8603:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8609:	05 18 13 08 00       	add    $0x81318,%eax
    860e:	8b 00                	mov    (%eax),%eax
    8610:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    8613:	75 55                	jne    866a <do_exit+0xef>
    8615:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8618:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    861e:	05 18 13 08 00       	add    $0x81318,%eax
    8623:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
    8629:	0f b6 05 bd 1c 08 00 	movzbl 0x81cbd,%eax
    8630:	3c 04                	cmp    $0x4,%al
    8632:	75 36                	jne    866a <do_exit+0xef>
    8634:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8637:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    863d:	05 fd 12 08 00       	add    $0x812fd,%eax
    8642:	0f b6 00             	movzbl (%eax),%eax
    8645:	3c 03                	cmp    $0x3,%al
    8647:	75 21                	jne    866a <do_exit+0xef>
    8649:	c6 05 bd 1c 08 00 fb 	movb   $0xfb,0x81cbd
    8650:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8653:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8659:	05 80 11 08 00       	add    $0x81180,%eax
    865e:	83 ec 0c             	sub    $0xc,%esp
    8661:	50                   	push   %eax
    8662:	e8 da 00 00 00       	call   8741 <cleanup>
    8667:	83 c4 10             	add    $0x10,%esp
    866a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    866e:	83 7d f4 20          	cmpl   $0x20,-0xc(%ebp)
    8672:	7e 8c                	jle    8600 <do_exit+0x85>
    8674:	90                   	nop
    8675:	c9                   	leave  
    8676:	c3                   	ret    

00008677 <do_wait>:
    8677:	55                   	push   %ebp
    8678:	89 e5                	mov    %esp,%ebp
    867a:	81 ec 88 00 00 00    	sub    $0x88,%esp
    8680:	8b 45 08             	mov    0x8(%ebp),%eax
    8683:	8b 00                	mov    (%eax),%eax
    8685:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8688:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    868f:	c7 45 f0 07 00 00 00 	movl   $0x7,-0x10(%ebp)
    8696:	eb 5f                	jmp    86f7 <do_wait+0x80>
    8698:	8b 45 f0             	mov    -0x10(%ebp),%eax
    869b:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86a1:	05 18 13 08 00       	add    $0x81318,%eax
    86a6:	8b 00                	mov    (%eax),%eax
    86a8:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    86ab:	75 46                	jne    86f3 <do_wait+0x7c>
    86ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    86b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86b4:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86ba:	05 fd 12 08 00       	add    $0x812fd,%eax
    86bf:	0f b6 00             	movzbl (%eax),%eax
    86c2:	3c 03                	cmp    $0x3,%al
    86c4:	75 2d                	jne    86f3 <do_wait+0x7c>
    86c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    86c9:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86cf:	05 fd 12 08 00       	add    $0x812fd,%eax
    86d4:	c6 00 fb             	movb   $0xfb,(%eax)
    86d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86da:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86e0:	05 80 11 08 00       	add    $0x81180,%eax
    86e5:	83 ec 0c             	sub    $0xc,%esp
    86e8:	50                   	push   %eax
    86e9:	e8 53 00 00 00       	call   8741 <cleanup>
    86ee:	83 c4 10             	add    $0x10,%esp
    86f1:	eb 4c                	jmp    873f <do_wait+0xc8>
    86f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    86f7:	83 7d f0 20          	cmpl   $0x20,-0x10(%ebp)
    86fb:	7e 9b                	jle    8698 <do_wait+0x21>
    86fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8701:	74 13                	je     8716 <do_wait+0x9f>
    8703:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8706:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    870c:	05 fd 12 08 00       	add    $0x812fd,%eax
    8711:	c6 00 04             	movb   $0x4,(%eax)
    8714:	eb 29                	jmp    873f <do_wait+0xc8>
    8716:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
    871d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    8724:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    872b:	83 ec 04             	sub    $0x4,%esp
    872e:	ff 75 ec             	pushl  -0x14(%ebp)
    8731:	8d 45 80             	lea    -0x80(%ebp),%eax
    8734:	50                   	push   %eax
    8735:	6a 01                	push   $0x1
    8737:	e8 dc b0 ff ff       	call   3818 <send_rec>
    873c:	83 c4 10             	add    $0x10,%esp
    873f:	c9                   	leave  
    8740:	c3                   	ret    

00008741 <cleanup>:
    8741:	55                   	push   %ebp
    8742:	89 e5                	mov    %esp,%ebp
    8744:	83 ec 78             	sub    $0x78,%esp
    8747:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
    874e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8755:	8b 45 08             	mov    0x8(%ebp),%eax
    8758:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    875e:	89 45 d8             	mov    %eax,-0x28(%ebp)
    8761:	8b 45 08             	mov    0x8(%ebp),%eax
    8764:	8b 80 9c 01 00 00    	mov    0x19c(%eax),%eax
    876a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    876d:	8b 45 08             	mov    0x8(%ebp),%eax
    8770:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    8776:	83 ec 04             	sub    $0x4,%esp
    8779:	50                   	push   %eax
    877a:	8d 45 8c             	lea    -0x74(%ebp),%eax
    877d:	50                   	push   %eax
    877e:	6a 01                	push   $0x1
    8780:	e8 93 b0 ff ff       	call   3818 <send_rec>
    8785:	83 c4 10             	add    $0x10,%esp
    8788:	8b 45 08             	mov    0x8(%ebp),%eax
    878b:	c6 80 7c 01 00 00 ff 	movb   $0xff,0x17c(%eax)
    8792:	90                   	nop
    8793:	c9                   	leave  
    8794:	c3                   	ret    
