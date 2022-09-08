
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00001000 <_start>:
    1000:	c7 05 38 d7 00 00 00 	movl   $0x0,0xd738
    1007:	00 00 00 
    100a:	b4 0b                	mov    $0xb,%ah
    100c:	b0 4c                	mov    $0x4c,%al
    100e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
    1015:	bc 00 cf 00 00       	mov    $0xcf00,%esp
    101a:	66 c7 05 38 d7 00 00 	movw   $0x0,0xd738
    1021:	00 00 
    1023:	0f 01 05 88 f6 00 00 	sgdtl  0xf688
    102a:	e8 15 59 00 00       	call   6944 <ReloadGDT>
    102f:	0f 01 15 88 f6 00 00 	lgdtl  0xf688
    1036:	0f 01 1d 28 d7 00 00 	lidtl  0xd728
    103d:	ea 44 10 00 00 08 00 	ljmp   $0x8,$0x1044

00001044 <csinit>:
    1044:	31 c0                	xor    %eax,%eax
    1046:	66 b8 40 00          	mov    $0x40,%ax
    104a:	0f 00 d8             	ltr    %ax
    104d:	66 87 db             	xchg   %bx,%bx
    1050:	e9 a6 0a 00 00       	jmp    1afb <kernel_main>
    1055:	f4                   	hlt    
    1056:	eb fe                	jmp    1056 <csinit+0x12>
    1058:	fb                   	sti    
    1059:	b4 0b                	mov    $0xb,%ah
    105b:	b0 4d                	mov    $0x4d,%al
    105d:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
    1064:	eb fe                	jmp    1064 <csinit+0x20>
    1066:	f4                   	hlt    
    1067:	6a 00                	push   $0x0
    1069:	9d                   	popf   
    106a:	eb fe                	jmp    106a <csinit+0x26>
    106c:	e8 3f 09 00 00       	call   19b0 <test>
    1071:	6a 01                	push   $0x1
    1073:	6a 02                	push   $0x2
    1075:	6a 03                	push   $0x3
    1077:	f4                   	hlt    
    1078:	66 90                	xchg   %ax,%ax
    107a:	66 90                	xchg   %ax,%ax
    107c:	66 90                	xchg   %ax,%ax
    107e:	66 90                	xchg   %ax,%ax

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
    1094:	8b 3d 38 d7 00 00    	mov    0xd738,%edi

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
    10bd:	89 3d 38 d7 00 00    	mov    %edi,0xd738
    10c3:	89 ec                	mov    %ebp,%esp
    10c5:	5d                   	pop    %ebp
    10c6:	c3                   	ret    

000010c7 <disp_str_colour>:
    10c7:	55                   	push   %ebp
    10c8:	89 e5                	mov    %esp,%ebp
    10ca:	8b 75 08             	mov    0x8(%ebp),%esi
    10cd:	8a 65 0c             	mov    0xc(%ebp),%ah
    10d0:	8b 3d 38 d7 00 00    	mov    0xd738,%edi

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
    10f9:	89 3d 38 d7 00 00    	mov    %edi,0xd738
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
    1161:	e8 34 05 00 00       	call   169a <exception_handler>
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
    1182:	ff 05 3c d7 00 00    	incl   0xd73c
    1188:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    118f:	75 05                	jne    1196 <hwint0.2>

00001191 <hwint0.1>:
    1191:	bc 00 d7 00 00       	mov    $0xd700,%esp

00001196 <hwint0.2>:
    1196:	fb                   	sti    
    1197:	e8 d3 53 00 00       	call   656f <clock_handler>
    119c:	b0 f8                	mov    $0xf8,%al
    119e:	e6 21                	out    %al,$0x21
    11a0:	fa                   	cli    
    11a1:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    11a8:	0f 85 17 01 00 00    	jne    12c5 <reenter_restore>
    11ae:	e9 fe 00 00 00       	jmp    12b1 <restore>

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
    11cb:	ff 05 3c d7 00 00    	incl   0xd73c
    11d1:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    11d8:	75 05                	jne    11df <hwint1.2>

000011da <hwint1.1>:
    11da:	bc 00 d7 00 00       	mov    $0xd700,%esp

000011df <hwint1.2>:
    11df:	fb                   	sti    
    11e0:	e8 12 62 00 00       	call   73f7 <keyboard_handler>
    11e5:	b0 f8                	mov    $0xf8,%al
    11e7:	e6 21                	out    %al,$0x21
    11e9:	fa                   	cli    
    11ea:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    11f1:	0f 85 ce 00 00 00    	jne    12c5 <reenter_restore>
    11f7:	e9 b5 00 00 00       	jmp    12b1 <restore>

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
    1217:	ff 05 3c d7 00 00    	incl   0xd73c
    121d:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    1224:	75 05                	jne    122b <hwint14.2>

00001226 <hwint14.1>:
    1226:	bc 00 d7 00 00       	mov    $0xd700,%esp

0000122b <hwint14.2>:
    122b:	fb                   	sti    
    122c:	e8 32 31 00 00       	call   4363 <hd_handler>
    1231:	b0 bf                	mov    $0xbf,%al
    1233:	e6 a1                	out    %al,$0xa1
    1235:	fa                   	cli    
    1236:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    123d:	0f 85 82 00 00 00    	jne    12c5 <reenter_restore>
    1243:	eb 6c                	jmp    12b1 <restore>

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
    1257:	ff 05 3c d7 00 00    	incl   0xd73c
    125d:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    1264:	75 05                	jne    126b <sys_call.2>

00001266 <sys_call.1>:
    1266:	bc 00 d7 00 00       	mov    $0xd700,%esp

0000126b <sys_call.2>:
    126b:	fb                   	sti    
    126c:	56                   	push   %esi
    126d:	ff 35 40 db 00 00    	pushl  0xdb40
    1273:	53                   	push   %ebx
    1274:	51                   	push   %ecx
    1275:	ff 14 85 ec c0 00 00 	call   *0xc0ec(,%eax,4)
    127c:	83 c4 0c             	add    $0xc,%esp
    127f:	5e                   	pop    %esi
    1280:	89 46 2c             	mov    %eax,0x2c(%esi)
    1283:	fa                   	cli    
    1284:	83 3d 3c d7 00 00 00 	cmpl   $0x0,0xd73c
    128b:	75 38                	jne    12c5 <reenter_restore>
    128d:	eb 22                	jmp    12b1 <restore>

0000128f <restart>:
    128f:	ff 0d 3c d7 00 00    	decl   0xd73c
    1295:	8b 25 40 db 00 00    	mov    0xdb40,%esp
    129b:	0f 00 54 24 44       	lldt   0x44(%esp)
    12a0:	8d 44 24 44          	lea    0x44(%esp),%eax
    12a4:	a3 04 f6 00 00       	mov    %eax,0xf604
    12a9:	0f a9                	pop    %gs
    12ab:	0f a1                	pop    %fs
    12ad:	07                   	pop    %es
    12ae:	1f                   	pop    %ds
    12af:	61                   	popa   
    12b0:	cf                   	iret   

000012b1 <restore>:
    12b1:	8b 25 40 db 00 00    	mov    0xdb40,%esp
    12b7:	0f 00 54 24 44       	lldt   0x44(%esp)
    12bc:	8d 44 24 44          	lea    0x44(%esp),%eax
    12c0:	a3 04 f6 00 00       	mov    %eax,0xf604

000012c5 <reenter_restore>:
    12c5:	ff 0d 3c d7 00 00    	decl   0xd73c
    12cb:	0f a9                	pop    %gs
    12cd:	0f a1                	pop    %fs
    12cf:	07                   	pop    %es
    12d0:	1f                   	pop    %ds
    12d1:	61                   	popa   
    12d2:	cf                   	iret   

000012d3 <in_byte>:
    12d3:	31 d2                	xor    %edx,%edx
    12d5:	8b 54 24 04          	mov    0x4(%esp),%edx
    12d9:	31 c0                	xor    %eax,%eax
    12db:	ec                   	in     (%dx),%al
    12dc:	90                   	nop
    12dd:	90                   	nop
    12de:	c3                   	ret    

000012df <out_byte>:
    12df:	31 d2                	xor    %edx,%edx
    12e1:	31 c0                	xor    %eax,%eax
    12e3:	8b 54 24 04          	mov    0x4(%esp),%edx
    12e7:	8a 44 24 08          	mov    0x8(%esp),%al
    12eb:	ee                   	out    %al,(%dx)
    12ec:	90                   	nop
    12ed:	90                   	nop
    12ee:	c3                   	ret    

000012ef <in_byte2>:
    12ef:	55                   	push   %ebp
    12f0:	89 e5                	mov    %esp,%ebp
    12f2:	52                   	push   %edx
    12f3:	31 d2                	xor    %edx,%edx
    12f5:	66 8b 55 08          	mov    0x8(%ebp),%dx
    12f9:	31 c0                	xor    %eax,%eax
    12fb:	ec                   	in     (%dx),%al
    12fc:	90                   	nop
    12fd:	90                   	nop
    12fe:	5b                   	pop    %ebx
    12ff:	5d                   	pop    %ebp
    1300:	c3                   	ret    

00001301 <disable_int>:
    1301:	fa                   	cli    
    1302:	c3                   	ret    

00001303 <enable_int>:
    1303:	fb                   	sti    
    1304:	c3                   	ret    

00001305 <check_tss_esp0>:
    1305:	55                   	push   %ebp
    1306:	89 e5                	mov    %esp,%ebp
    1308:	8b 45 08             	mov    0x8(%ebp),%eax
    130b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    130e:	83 c0 44             	add    $0x44,%eax
    1311:	8b 15 04 f6 00 00    	mov    0xf604,%edx
    1317:	39 d0                	cmp    %edx,%eax
    1319:	74 7c                	je     1397 <check_tss_esp0.2>

0000131b <check_tss_esp0.1>:
    131b:	50                   	push   %eax
    131c:	52                   	push   %edx
    131d:	68 10 c0 00 00       	push   $0xc010
    1322:	e8 65 fd ff ff       	call   108c <disp_str>
    1327:	83 c4 04             	add    $0x4,%esp
    132a:	5a                   	pop    %edx
    132b:	58                   	pop    %eax
    132c:	52                   	push   %edx
    132d:	50                   	push   %eax
    132e:	53                   	push   %ebx
    132f:	e8 3d 03 00 00       	call   1671 <disp_int>
    1334:	83 c4 04             	add    $0x4,%esp
    1337:	58                   	pop    %eax
    1338:	5a                   	pop    %edx
    1339:	52                   	push   %edx
    133a:	50                   	push   %eax
    133b:	e8 31 03 00 00       	call   1671 <disp_int>
    1340:	58                   	pop    %eax
    1341:	5a                   	pop    %edx
    1342:	52                   	push   %edx
    1343:	50                   	push   %eax
    1344:	ff 35 3c d7 00 00    	pushl  0xd73c
    134a:	e8 22 03 00 00       	call   1671 <disp_int>
    134f:	83 c4 04             	add    $0x4,%esp
    1352:	58                   	pop    %eax
    1353:	5a                   	pop    %edx
    1354:	52                   	push   %edx
    1355:	50                   	push   %eax
    1356:	ff 72 ec             	pushl  -0x14(%edx)
    1359:	e8 13 03 00 00       	call   1671 <disp_int>
    135e:	83 c4 04             	add    $0x4,%esp
    1361:	58                   	pop    %eax
    1362:	5a                   	pop    %edx
    1363:	52                   	push   %edx
    1364:	50                   	push   %eax
    1365:	ff 70 ec             	pushl  -0x14(%eax)
    1368:	e8 04 03 00 00       	call   1671 <disp_int>
    136d:	83 c4 04             	add    $0x4,%esp
    1370:	58                   	pop    %eax
    1371:	5a                   	pop    %edx
    1372:	52                   	push   %edx
    1373:	50                   	push   %eax
    1374:	ff 35 40 db 00 00    	pushl  0xdb40
    137a:	e8 f2 02 00 00       	call   1671 <disp_int>
    137f:	83 c4 04             	add    $0x4,%esp
    1382:	58                   	pop    %eax
    1383:	5a                   	pop    %edx
    1384:	52                   	push   %edx
    1385:	50                   	push   %eax
    1386:	68 00 d7 00 00       	push   $0xd700
    138b:	e8 e1 02 00 00       	call   1671 <disp_int>
    1390:	83 c4 04             	add    $0x4,%esp
    1393:	58                   	pop    %eax
    1394:	5a                   	pop    %edx
    1395:	5d                   	pop    %ebp
    1396:	c3                   	ret    

00001397 <check_tss_esp0.2>:
    1397:	5d                   	pop    %ebp
    1398:	c3                   	ret    

00001399 <enable_8259A_casecade_irq>:
    1399:	9c                   	pushf  
    139a:	fa                   	cli    
    139b:	e4 21                	in     $0x21,%al
    139d:	24 fb                	and    $0xfb,%al
    139f:	e6 21                	out    %al,$0x21
    13a1:	9d                   	popf   
    13a2:	c3                   	ret    

000013a3 <disable_8259A_casecade_irq>:
    13a3:	9c                   	pushf  
    13a4:	fa                   	cli    
    13a5:	e4 21                	in     $0x21,%al
    13a7:	0c 04                	or     $0x4,%al
    13a9:	e6 21                	out    %al,$0x21
    13ab:	9c                   	pushf  
    13ac:	c3                   	ret    

000013ad <enable_8259A_slave_winchester_irq>:
    13ad:	9c                   	pushf  
    13ae:	fa                   	cli    
    13af:	e4 a1                	in     $0xa1,%al
    13b1:	24 bf                	and    $0xbf,%al
    13b3:	e6 a1                	out    %al,$0xa1
    13b5:	9d                   	popf   
    13b6:	c3                   	ret    

000013b7 <disable_8259A_slave_winchester_irq>:
    13b7:	9c                   	pushf  
    13b8:	fa                   	cli    
    13b9:	e4 a1                	in     $0xa1,%al
    13bb:	0c 40                	or     $0x40,%al
    13bd:	e6 a1                	out    %al,$0xa1
    13bf:	9d                   	popf   
    13c0:	c3                   	ret    

000013c1 <untar>:
    13c1:	55                   	push   %ebp
    13c2:	89 e5                	mov    %esp,%ebp
    13c4:	81 ec 48 20 00 00    	sub    $0x2048,%esp
    13ca:	83 ec 08             	sub    $0x8,%esp
    13cd:	6a 00                	push   $0x0
    13cf:	ff 75 08             	pushl  0x8(%ebp)
    13d2:	e8 27 64 00 00       	call   77fe <open>
    13d7:	83 c4 10             	add    $0x10,%esp
    13da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    13dd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    13e4:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
    13eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    13f2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    13f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13fd:	7e 58                	jle    1457 <untar+0x96>
    13ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1402:	05 ff 01 00 00       	add    $0x1ff,%eax
    1407:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    140d:	85 c0                	test   %eax,%eax
    140f:	0f 48 c2             	cmovs  %edx,%eax
    1412:	c1 f8 09             	sar    $0x9,%eax
    1415:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1418:	83 ec 04             	sub    $0x4,%esp
    141b:	68 00 20 00 00       	push   $0x2000
    1420:	6a 00                	push   $0x0
    1422:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1428:	50                   	push   %eax
    1429:	e8 93 80 00 00       	call   94c1 <Memset>
    142e:	83 c4 10             	add    $0x10,%esp
    1431:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1434:	c1 e0 09             	shl    $0x9,%eax
    1437:	2b 45 f4             	sub    -0xc(%ebp),%eax
    143a:	83 ec 04             	sub    $0x4,%esp
    143d:	50                   	push   %eax
    143e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1444:	50                   	push   %eax
    1445:	ff 75 e4             	pushl  -0x1c(%ebp)
    1448:	e8 06 64 00 00       	call   7853 <read>
    144d:	83 c4 10             	add    $0x10,%esp
    1450:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1457:	83 ec 04             	sub    $0x4,%esp
    145a:	68 00 20 00 00       	push   $0x2000
    145f:	6a 00                	push   $0x0
    1461:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1467:	50                   	push   %eax
    1468:	e8 54 80 00 00       	call   94c1 <Memset>
    146d:	83 c4 10             	add    $0x10,%esp
    1470:	83 ec 04             	sub    $0x4,%esp
    1473:	68 00 02 00 00       	push   $0x200
    1478:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    147e:	50                   	push   %eax
    147f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1482:	e8 cc 63 00 00       	call   7853 <read>
    1487:	83 c4 10             	add    $0x10,%esp
    148a:	89 45 d8             	mov    %eax,-0x28(%ebp)
    148d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1491:	0f 84 1f 01 00 00    	je     15b6 <untar+0x1f5>
    1497:	8b 45 d8             	mov    -0x28(%ebp),%eax
    149a:	01 45 f4             	add    %eax,-0xc(%ebp)
    149d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    14a4:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    14aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14ad:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14b0:	89 45 cc             	mov    %eax,-0x34(%ebp)
    14b3:	83 ec 08             	sub    $0x8,%esp
    14b6:	6a 07                	push   $0x7
    14b8:	ff 75 cc             	pushl  -0x34(%ebp)
    14bb:	e8 3e 63 00 00       	call   77fe <open>
    14c0:	83 c4 10             	add    $0x10,%esp
    14c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    14c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14cd:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14d0:	83 c0 7c             	add    $0x7c,%eax
    14d3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    14d6:	83 ec 0c             	sub    $0xc,%esp
    14d9:	ff 75 cc             	pushl  -0x34(%ebp)
    14dc:	e8 19 80 00 00       	call   94fa <Strlen>
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	85 c0                	test   %eax,%eax
    14e6:	75 16                	jne    14fe <untar+0x13d>
    14e8:	83 ec 0c             	sub    $0xc,%esp
    14eb:	ff 75 c4             	pushl  -0x3c(%ebp)
    14ee:	e8 07 80 00 00       	call   94fa <Strlen>
    14f3:	83 c4 10             	add    $0x10,%esp
    14f6:	85 c0                	test   %eax,%eax
    14f8:	0f 84 bb 00 00 00    	je     15b9 <untar+0x1f8>
    14fe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1501:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1504:	eb 1f                	jmp    1525 <untar+0x164>
    1506:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1509:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1510:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1513:	0f b6 00             	movzbl (%eax),%eax
    1516:	0f be c0             	movsbl %al,%eax
    1519:	83 e8 30             	sub    $0x30,%eax
    151c:	01 d0                	add    %edx,%eax
    151e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1521:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1525:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1528:	0f b6 00             	movzbl (%eax),%eax
    152b:	84 c0                	test   %al,%al
    152d:	75 d7                	jne    1506 <untar+0x145>
    152f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1532:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1535:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
    153c:	eb 5f                	jmp    159d <untar+0x1dc>
    153e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1541:	39 45 c0             	cmp    %eax,-0x40(%ebp)
    1544:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
    1548:	89 45 bc             	mov    %eax,-0x44(%ebp)
    154b:	83 ec 04             	sub    $0x4,%esp
    154e:	68 00 02 00 00       	push   $0x200
    1553:	6a 00                	push   $0x0
    1555:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    155b:	50                   	push   %eax
    155c:	e8 60 7f 00 00       	call   94c1 <Memset>
    1561:	83 c4 10             	add    $0x10,%esp
    1564:	83 ec 04             	sub    $0x4,%esp
    1567:	ff 75 bc             	pushl  -0x44(%ebp)
    156a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1570:	50                   	push   %eax
    1571:	ff 75 e4             	pushl  -0x1c(%ebp)
    1574:	e8 da 62 00 00       	call   7853 <read>
    1579:	83 c4 10             	add    $0x10,%esp
    157c:	01 45 f4             	add    %eax,-0xc(%ebp)
    157f:	83 ec 04             	sub    $0x4,%esp
    1582:	ff 75 bc             	pushl  -0x44(%ebp)
    1585:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    158b:	50                   	push   %eax
    158c:	ff 75 c8             	pushl  -0x38(%ebp)
    158f:	e8 f6 62 00 00       	call   788a <write>
    1594:	83 c4 10             	add    $0x10,%esp
    1597:	8b 45 bc             	mov    -0x44(%ebp),%eax
    159a:	29 45 e8             	sub    %eax,-0x18(%ebp)
    159d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15a1:	75 9b                	jne    153e <untar+0x17d>
    15a3:	83 ec 0c             	sub    $0xc,%esp
    15a6:	ff 75 c8             	pushl  -0x38(%ebp)
    15a9:	e8 13 63 00 00       	call   78c1 <close>
    15ae:	83 c4 10             	add    $0x10,%esp
    15b1:	e9 43 fe ff ff       	jmp    13f9 <untar+0x38>
    15b6:	90                   	nop
    15b7:	eb 01                	jmp    15ba <untar+0x1f9>
    15b9:	90                   	nop
    15ba:	83 ec 0c             	sub    $0xc,%esp
    15bd:	ff 75 e4             	pushl  -0x1c(%ebp)
    15c0:	e8 fc 62 00 00       	call   78c1 <close>
    15c5:	83 c4 10             	add    $0x10,%esp
    15c8:	90                   	nop
    15c9:	c9                   	leave  
    15ca:	c3                   	ret    

000015cb <atoi>:
    15cb:	55                   	push   %ebp
    15cc:	89 e5                	mov    %esp,%ebp
    15ce:	83 ec 10             	sub    $0x10,%esp
    15d1:	8b 45 08             	mov    0x8(%ebp),%eax
    15d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15da:	8d 50 01             	lea    0x1(%eax),%edx
    15dd:	89 55 fc             	mov    %edx,-0x4(%ebp)
    15e0:	c6 00 30             	movb   $0x30,(%eax)
    15e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15e6:	8d 50 01             	lea    0x1(%eax),%edx
    15e9:	89 55 fc             	mov    %edx,-0x4(%ebp)
    15ec:	c6 00 78             	movb   $0x78,(%eax)
    15ef:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
    15f3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    15f7:	75 0e                	jne    1607 <atoi+0x3c>
    15f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15fc:	8d 50 01             	lea    0x1(%eax),%edx
    15ff:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1602:	c6 00 30             	movb   $0x30,(%eax)
    1605:	eb 61                	jmp    1668 <atoi+0x9d>
    1607:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
    160e:	eb 52                	jmp    1662 <atoi+0x97>
    1610:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1613:	8b 55 0c             	mov    0xc(%ebp),%edx
    1616:	89 c1                	mov    %eax,%ecx
    1618:	d3 fa                	sar    %cl,%edx
    161a:	89 d0                	mov    %edx,%eax
    161c:	83 e0 0f             	and    $0xf,%eax
    161f:	88 45 fb             	mov    %al,-0x5(%ebp)
    1622:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
    1626:	75 06                	jne    162e <atoi+0x63>
    1628:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
    162c:	74 2f                	je     165d <atoi+0x92>
    162e:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
    1632:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1636:	83 c0 30             	add    $0x30,%eax
    1639:	88 45 fb             	mov    %al,-0x5(%ebp)
    163c:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
    1640:	7e 0a                	jle    164c <atoi+0x81>
    1642:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1646:	83 c0 07             	add    $0x7,%eax
    1649:	88 45 fb             	mov    %al,-0x5(%ebp)
    164c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    164f:	8d 50 01             	lea    0x1(%eax),%edx
    1652:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1655:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
    1659:	88 10                	mov    %dl,(%eax)
    165b:	eb 01                	jmp    165e <atoi+0x93>
    165d:	90                   	nop
    165e:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
    1662:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1666:	79 a8                	jns    1610 <atoi+0x45>
    1668:	8b 45 fc             	mov    -0x4(%ebp),%eax
    166b:	c6 00 00             	movb   $0x0,(%eax)
    166e:	90                   	nop
    166f:	c9                   	leave  
    1670:	c3                   	ret    

00001671 <disp_int>:
    1671:	55                   	push   %ebp
    1672:	89 e5                	mov    %esp,%ebp
    1674:	83 ec 18             	sub    $0x18,%esp
    1677:	ff 75 08             	pushl  0x8(%ebp)
    167a:	8d 45 ee             	lea    -0x12(%ebp),%eax
    167d:	50                   	push   %eax
    167e:	e8 48 ff ff ff       	call   15cb <atoi>
    1683:	83 c4 08             	add    $0x8,%esp
    1686:	83 ec 08             	sub    $0x8,%esp
    1689:	6a 0b                	push   $0xb
    168b:	8d 45 ee             	lea    -0x12(%ebp),%eax
    168e:	50                   	push   %eax
    168f:	e8 33 fa ff ff       	call   10c7 <disp_str_colour>
    1694:	83 c4 10             	add    $0x10,%esp
    1697:	90                   	nop
    1698:	c9                   	leave  
    1699:	c3                   	ret    

0000169a <exception_handler>:
    169a:	55                   	push   %ebp
    169b:	89 e5                	mov    %esp,%ebp
    169d:	57                   	push   %edi
    169e:	56                   	push   %esi
    169f:	53                   	push   %ebx
    16a0:	83 ec 6c             	sub    $0x6c,%esp
    16a3:	8d 45 90             	lea    -0x70(%ebp),%eax
    16a6:	bb c0 8c 00 00       	mov    $0x8cc0,%ebx
    16ab:	ba 13 00 00 00       	mov    $0x13,%edx
    16b0:	89 c7                	mov    %eax,%edi
    16b2:	89 de                	mov    %ebx,%esi
    16b4:	89 d1                	mov    %edx,%ecx
    16b6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    16b8:	c7 05 38 d7 00 00 6a 	movl   $0x2e6a,0xd738
    16bf:	2e 00 00 
    16c2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    16c9:	eb 14                	jmp    16df <exception_handler+0x45>
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	68 a0 8a 00 00       	push   $0x8aa0
    16d3:	e8 b4 f9 ff ff       	call   108c <disp_str>
    16d8:	83 c4 10             	add    $0x10,%esp
    16db:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    16df:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
    16e6:	7e e3                	jle    16cb <exception_handler+0x31>
    16e8:	c7 05 38 d7 00 00 6a 	movl   $0x2e6a,0xd738
    16ef:	2e 00 00 
    16f2:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
    16f9:	8b 45 08             	mov    0x8(%ebp),%eax
    16fc:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
    1700:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1703:	83 ec 08             	sub    $0x8,%esp
    1706:	ff 75 e0             	pushl  -0x20(%ebp)
    1709:	ff 75 dc             	pushl  -0x24(%ebp)
    170c:	e8 b6 f9 ff ff       	call   10c7 <disp_str_colour>
    1711:	83 c4 10             	add    $0x10,%esp
    1714:	83 ec 0c             	sub    $0xc,%esp
    1717:	68 a2 8a 00 00       	push   $0x8aa2
    171c:	e8 6b f9 ff ff       	call   108c <disp_str>
    1721:	83 c4 10             	add    $0x10,%esp
    1724:	83 ec 08             	sub    $0x8,%esp
    1727:	ff 75 e0             	pushl  -0x20(%ebp)
    172a:	68 a5 8a 00 00       	push   $0x8aa5
    172f:	e8 93 f9 ff ff       	call   10c7 <disp_str_colour>
    1734:	83 c4 10             	add    $0x10,%esp
    1737:	83 ec 0c             	sub    $0xc,%esp
    173a:	ff 75 08             	pushl  0x8(%ebp)
    173d:	e8 2f ff ff ff       	call   1671 <disp_int>
    1742:	83 c4 10             	add    $0x10,%esp
    1745:	83 ec 0c             	sub    $0xc,%esp
    1748:	68 a2 8a 00 00       	push   $0x8aa2
    174d:	e8 3a f9 ff ff       	call   108c <disp_str>
    1752:	83 c4 10             	add    $0x10,%esp
    1755:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
    1759:	74 44                	je     179f <exception_handler+0x105>
    175b:	83 ec 08             	sub    $0x8,%esp
    175e:	ff 75 e0             	pushl  -0x20(%ebp)
    1761:	68 ad 8a 00 00       	push   $0x8aad
    1766:	e8 5c f9 ff ff       	call   10c7 <disp_str_colour>
    176b:	83 c4 10             	add    $0x10,%esp
    176e:	83 ec 08             	sub    $0x8,%esp
    1771:	ff 75 e0             	pushl  -0x20(%ebp)
    1774:	68 ad 8a 00 00       	push   $0x8aad
    1779:	e8 49 f9 ff ff       	call   10c7 <disp_str_colour>
    177e:	83 c4 10             	add    $0x10,%esp
    1781:	83 ec 0c             	sub    $0xc,%esp
    1784:	ff 75 0c             	pushl  0xc(%ebp)
    1787:	e8 e5 fe ff ff       	call   1671 <disp_int>
    178c:	83 c4 10             	add    $0x10,%esp
    178f:	83 ec 0c             	sub    $0xc,%esp
    1792:	68 a2 8a 00 00       	push   $0x8aa2
    1797:	e8 f0 f8 ff ff       	call   108c <disp_str>
    179c:	83 c4 10             	add    $0x10,%esp
    179f:	83 ec 08             	sub    $0x8,%esp
    17a2:	ff 75 e0             	pushl  -0x20(%ebp)
    17a5:	68 b7 8a 00 00       	push   $0x8ab7
    17aa:	e8 18 f9 ff ff       	call   10c7 <disp_str_colour>
    17af:	83 c4 10             	add    $0x10,%esp
    17b2:	83 ec 0c             	sub    $0xc,%esp
    17b5:	ff 75 14             	pushl  0x14(%ebp)
    17b8:	e8 b4 fe ff ff       	call   1671 <disp_int>
    17bd:	83 c4 10             	add    $0x10,%esp
    17c0:	83 ec 0c             	sub    $0xc,%esp
    17c3:	68 a2 8a 00 00       	push   $0x8aa2
    17c8:	e8 bf f8 ff ff       	call   108c <disp_str>
    17cd:	83 c4 10             	add    $0x10,%esp
    17d0:	83 ec 08             	sub    $0x8,%esp
    17d3:	ff 75 e0             	pushl  -0x20(%ebp)
    17d6:	68 bb 8a 00 00       	push   $0x8abb
    17db:	e8 e7 f8 ff ff       	call   10c7 <disp_str_colour>
    17e0:	83 c4 10             	add    $0x10,%esp
    17e3:	83 ec 0c             	sub    $0xc,%esp
    17e6:	ff 75 10             	pushl  0x10(%ebp)
    17e9:	e8 83 fe ff ff       	call   1671 <disp_int>
    17ee:	83 c4 10             	add    $0x10,%esp
    17f1:	83 ec 0c             	sub    $0xc,%esp
    17f4:	68 a2 8a 00 00       	push   $0x8aa2
    17f9:	e8 8e f8 ff ff       	call   108c <disp_str>
    17fe:	83 c4 10             	add    $0x10,%esp
    1801:	83 ec 08             	sub    $0x8,%esp
    1804:	ff 75 e0             	pushl  -0x20(%ebp)
    1807:	68 c0 8a 00 00       	push   $0x8ac0
    180c:	e8 b6 f8 ff ff       	call   10c7 <disp_str_colour>
    1811:	83 c4 10             	add    $0x10,%esp
    1814:	83 ec 0c             	sub    $0xc,%esp
    1817:	ff 75 18             	pushl  0x18(%ebp)
    181a:	e8 52 fe ff ff       	call   1671 <disp_int>
    181f:	83 c4 10             	add    $0x10,%esp
    1822:	83 ec 0c             	sub    $0xc,%esp
    1825:	68 a2 8a 00 00       	push   $0x8aa2
    182a:	e8 5d f8 ff ff       	call   108c <disp_str>
    182f:	83 c4 10             	add    $0x10,%esp
    1832:	90                   	nop
    1833:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1836:	5b                   	pop    %ebx
    1837:	5e                   	pop    %esi
    1838:	5f                   	pop    %edi
    1839:	5d                   	pop    %ebp
    183a:	c3                   	ret    

0000183b <init_internal_interrupt>:
    183b:	55                   	push   %ebp
    183c:	89 e5                	mov    %esp,%ebp
    183e:	83 ec 08             	sub    $0x8,%esp
    1841:	6a 0e                	push   $0xe
    1843:	6a 08                	push   $0x8
    1845:	68 03 11 00 00       	push   $0x1103
    184a:	6a 00                	push   $0x0
    184c:	e8 97 50 00 00       	call   68e8 <InitInterruptDesc>
    1851:	83 c4 10             	add    $0x10,%esp
    1854:	6a 0e                	push   $0xe
    1856:	6a 08                	push   $0x8
    1858:	68 09 11 00 00       	push   $0x1109
    185d:	6a 01                	push   $0x1
    185f:	e8 84 50 00 00       	call   68e8 <InitInterruptDesc>
    1864:	83 c4 10             	add    $0x10,%esp
    1867:	6a 0e                	push   $0xe
    1869:	6a 08                	push   $0x8
    186b:	68 0f 11 00 00       	push   $0x110f
    1870:	6a 02                	push   $0x2
    1872:	e8 71 50 00 00       	call   68e8 <InitInterruptDesc>
    1877:	83 c4 10             	add    $0x10,%esp
    187a:	6a 0e                	push   $0xe
    187c:	6a 08                	push   $0x8
    187e:	68 15 11 00 00       	push   $0x1115
    1883:	6a 03                	push   $0x3
    1885:	e8 5e 50 00 00       	call   68e8 <InitInterruptDesc>
    188a:	83 c4 10             	add    $0x10,%esp
    188d:	6a 0e                	push   $0xe
    188f:	6a 08                	push   $0x8
    1891:	68 1b 11 00 00       	push   $0x111b
    1896:	6a 04                	push   $0x4
    1898:	e8 4b 50 00 00       	call   68e8 <InitInterruptDesc>
    189d:	83 c4 10             	add    $0x10,%esp
    18a0:	6a 0e                	push   $0xe
    18a2:	6a 08                	push   $0x8
    18a4:	68 21 11 00 00       	push   $0x1121
    18a9:	6a 05                	push   $0x5
    18ab:	e8 38 50 00 00       	call   68e8 <InitInterruptDesc>
    18b0:	83 c4 10             	add    $0x10,%esp
    18b3:	6a 0e                	push   $0xe
    18b5:	6a 08                	push   $0x8
    18b7:	68 27 11 00 00       	push   $0x1127
    18bc:	6a 06                	push   $0x6
    18be:	e8 25 50 00 00       	call   68e8 <InitInterruptDesc>
    18c3:	83 c4 10             	add    $0x10,%esp
    18c6:	6a 0e                	push   $0xe
    18c8:	6a 08                	push   $0x8
    18ca:	68 2d 11 00 00       	push   $0x112d
    18cf:	6a 07                	push   $0x7
    18d1:	e8 12 50 00 00       	call   68e8 <InitInterruptDesc>
    18d6:	83 c4 10             	add    $0x10,%esp
    18d9:	6a 0e                	push   $0xe
    18db:	6a 08                	push   $0x8
    18dd:	68 33 11 00 00       	push   $0x1133
    18e2:	6a 08                	push   $0x8
    18e4:	e8 ff 4f 00 00       	call   68e8 <InitInterruptDesc>
    18e9:	83 c4 10             	add    $0x10,%esp
    18ec:	6a 0e                	push   $0xe
    18ee:	6a 08                	push   $0x8
    18f0:	68 37 11 00 00       	push   $0x1137
    18f5:	6a 09                	push   $0x9
    18f7:	e8 ec 4f 00 00       	call   68e8 <InitInterruptDesc>
    18fc:	83 c4 10             	add    $0x10,%esp
    18ff:	6a 0e                	push   $0xe
    1901:	6a 08                	push   $0x8
    1903:	68 3d 11 00 00       	push   $0x113d
    1908:	6a 0a                	push   $0xa
    190a:	e8 d9 4f 00 00       	call   68e8 <InitInterruptDesc>
    190f:	83 c4 10             	add    $0x10,%esp
    1912:	6a 0e                	push   $0xe
    1914:	6a 08                	push   $0x8
    1916:	68 41 11 00 00       	push   $0x1141
    191b:	6a 0b                	push   $0xb
    191d:	e8 c6 4f 00 00       	call   68e8 <InitInterruptDesc>
    1922:	83 c4 10             	add    $0x10,%esp
    1925:	6a 0e                	push   $0xe
    1927:	6a 08                	push   $0x8
    1929:	68 45 11 00 00       	push   $0x1145
    192e:	6a 0c                	push   $0xc
    1930:	e8 b3 4f 00 00       	call   68e8 <InitInterruptDesc>
    1935:	83 c4 10             	add    $0x10,%esp
    1938:	6a 0e                	push   $0xe
    193a:	6a 08                	push   $0x8
    193c:	68 49 11 00 00       	push   $0x1149
    1941:	6a 0d                	push   $0xd
    1943:	e8 a0 4f 00 00       	call   68e8 <InitInterruptDesc>
    1948:	83 c4 10             	add    $0x10,%esp
    194b:	6a 0e                	push   $0xe
    194d:	6a 08                	push   $0x8
    194f:	68 4d 11 00 00       	push   $0x114d
    1954:	6a 0e                	push   $0xe
    1956:	e8 8d 4f 00 00       	call   68e8 <InitInterruptDesc>
    195b:	83 c4 10             	add    $0x10,%esp
    195e:	6a 0e                	push   $0xe
    1960:	6a 08                	push   $0x8
    1962:	68 51 11 00 00       	push   $0x1151
    1967:	6a 10                	push   $0x10
    1969:	e8 7a 4f 00 00       	call   68e8 <InitInterruptDesc>
    196e:	83 c4 10             	add    $0x10,%esp
    1971:	6a 0e                	push   $0xe
    1973:	6a 08                	push   $0x8
    1975:	68 57 11 00 00       	push   $0x1157
    197a:	6a 11                	push   $0x11
    197c:	e8 67 4f 00 00       	call   68e8 <InitInterruptDesc>
    1981:	83 c4 10             	add    $0x10,%esp
    1984:	6a 0e                	push   $0xe
    1986:	6a 08                	push   $0x8
    1988:	68 5b 11 00 00       	push   $0x115b
    198d:	6a 12                	push   $0x12
    198f:	e8 54 4f 00 00       	call   68e8 <InitInterruptDesc>
    1994:	83 c4 10             	add    $0x10,%esp
    1997:	6a 0e                	push   $0xe
    1999:	6a 0e                	push   $0xe
    199b:	68 45 12 00 00       	push   $0x1245
    19a0:	68 90 00 00 00       	push   $0x90
    19a5:	e8 3e 4f 00 00       	call   68e8 <InitInterruptDesc>
    19aa:	83 c4 10             	add    $0x10,%esp
    19ad:	90                   	nop
    19ae:	c9                   	leave  
    19af:	c3                   	ret    

000019b0 <test>:
    19b0:	55                   	push   %ebp
    19b1:	89 e5                	mov    %esp,%ebp
    19b3:	83 ec 08             	sub    $0x8,%esp
    19b6:	83 ec 0c             	sub    $0xc,%esp
    19b9:	68 0c 8d 00 00       	push   $0x8d0c
    19be:	e8 c9 f6 ff ff       	call   108c <disp_str>
    19c3:	83 c4 10             	add    $0x10,%esp
    19c6:	83 ec 0c             	sub    $0xc,%esp
    19c9:	6a 06                	push   $0x6
    19cb:	e8 a1 fc ff ff       	call   1671 <disp_int>
    19d0:	83 c4 10             	add    $0x10,%esp
    19d3:	83 ec 0c             	sub    $0xc,%esp
    19d6:	68 0e 8d 00 00       	push   $0x8d0e
    19db:	e8 ac f6 ff ff       	call   108c <disp_str>
    19e0:	83 c4 10             	add    $0x10,%esp
    19e3:	90                   	nop
    19e4:	c9                   	leave  
    19e5:	c3                   	ret    

000019e6 <disp_str_colour3>:
    19e6:	55                   	push   %ebp
    19e7:	89 e5                	mov    %esp,%ebp
    19e9:	90                   	nop
    19ea:	5d                   	pop    %ebp
    19eb:	c3                   	ret    

000019ec <spurious_irq>:
    19ec:	55                   	push   %ebp
    19ed:	89 e5                	mov    %esp,%ebp
    19ef:	83 ec 08             	sub    $0x8,%esp
    19f2:	83 ec 08             	sub    $0x8,%esp
    19f5:	6a 0b                	push   $0xb
    19f7:	68 10 8d 00 00       	push   $0x8d10
    19fc:	e8 c6 f6 ff ff       	call   10c7 <disp_str_colour>
    1a01:	83 c4 10             	add    $0x10,%esp
    1a04:	83 ec 0c             	sub    $0xc,%esp
    1a07:	ff 75 08             	pushl  0x8(%ebp)
    1a0a:	e8 62 fc ff ff       	call   1671 <disp_int>
    1a0f:	83 c4 10             	add    $0x10,%esp
    1a12:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    1a17:	83 c0 01             	add    $0x1,%eax
    1a1a:	a3 a0 fe 00 00       	mov    %eax,0xfea0
    1a1f:	83 ec 0c             	sub    $0xc,%esp
    1a22:	68 37 8d 00 00       	push   $0x8d37
    1a27:	e8 60 f6 ff ff       	call   108c <disp_str>
    1a2c:	83 c4 10             	add    $0x10,%esp
    1a2f:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    1a34:	83 ec 0c             	sub    $0xc,%esp
    1a37:	50                   	push   %eax
    1a38:	e8 34 fc ff ff       	call   1671 <disp_int>
    1a3d:	83 c4 10             	add    $0x10,%esp
    1a40:	83 ec 0c             	sub    $0xc,%esp
    1a43:	68 39 8d 00 00       	push   $0x8d39
    1a48:	e8 3f f6 ff ff       	call   108c <disp_str>
    1a4d:	83 c4 10             	add    $0x10,%esp
    1a50:	83 ec 08             	sub    $0x8,%esp
    1a53:	6a 0c                	push   $0xc
    1a55:	68 3c 8d 00 00       	push   $0x8d3c
    1a5a:	e8 68 f6 ff ff       	call   10c7 <disp_str_colour>
    1a5f:	83 c4 10             	add    $0x10,%esp
    1a62:	90                   	nop
    1a63:	c9                   	leave  
    1a64:	c3                   	ret    

00001a65 <init_keyboard>:
    1a65:	55                   	push   %ebp
    1a66:	89 e5                	mov    %esp,%ebp
    1a68:	83 ec 18             	sub    $0x18,%esp
    1a6b:	83 ec 04             	sub    $0x4,%esp
    1a6e:	68 00 02 00 00       	push   $0x200
    1a73:	6a 00                	push   $0x0
    1a75:	68 6c db 00 00       	push   $0xdb6c
    1a7a:	e8 42 7a 00 00       	call   94c1 <Memset>
    1a7f:	83 c4 10             	add    $0x10,%esp
    1a82:	c7 05 60 db 00 00 6c 	movl   $0xdb6c,0xdb60
    1a89:	db 00 00 
    1a8c:	a1 60 db 00 00       	mov    0xdb60,%eax
    1a91:	a3 64 db 00 00       	mov    %eax,0xdb64
    1a96:	c7 05 68 db 00 00 00 	movl   $0x0,0xdb68
    1a9d:	00 00 00 
    1aa0:	c7 05 38 d7 00 00 00 	movl   $0x0,0xd738
    1aa7:	00 00 00 
    1aaa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1ab1:	eb 14                	jmp    1ac7 <init_keyboard+0x62>
    1ab3:	83 ec 0c             	sub    $0xc,%esp
    1ab6:	68 a0 8a 00 00       	push   $0x8aa0
    1abb:	e8 cc f5 ff ff       	call   108c <disp_str>
    1ac0:	83 c4 10             	add    $0x10,%esp
    1ac3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1ac7:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    1ace:	7e e3                	jle    1ab3 <init_keyboard+0x4e>
    1ad0:	c7 05 38 d7 00 00 00 	movl   $0x0,0xd738
    1ad7:	00 00 00 
    1ada:	e8 79 5b 00 00       	call   7658 <init_keyboard_handler>
    1adf:	90                   	nop
    1ae0:	c9                   	leave  
    1ae1:	c3                   	ret    

00001ae2 <init>:
    1ae2:	55                   	push   %ebp
    1ae3:	89 e5                	mov    %esp,%ebp
    1ae5:	83 ec 08             	sub    $0x8,%esp
    1ae8:	e8 78 ff ff ff       	call   1a65 <init_keyboard>
    1aed:	66 87 db             	xchg   %bx,%bx
    1af0:	e8 c5 6d 00 00       	call   88ba <init_memory>
    1af5:	66 87 db             	xchg   %bx,%bx
    1af8:	90                   	nop
    1af9:	c9                   	leave  
    1afa:	c3                   	ret    

00001afb <kernel_main>:
    1afb:	55                   	push   %ebp
    1afc:	89 e5                	mov    %esp,%ebp
    1afe:	83 ec 08             	sub    $0x8,%esp
    1b01:	83 ec 0c             	sub    $0xc,%esp
    1b04:	68 61 8d 00 00       	push   $0x8d61
    1b09:	e8 7e f5 ff ff       	call   108c <disp_str>
    1b0e:	83 c4 10             	add    $0x10,%esp
    1b11:	e8 cc ff ff ff       	call   1ae2 <init>
    1b16:	eb fe                	jmp    1b16 <kernel_main+0x1b>

00001b18 <TestFS>:
    1b18:	55                   	push   %ebp
    1b19:	89 e5                	mov    %esp,%ebp
    1b1b:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
    1b21:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
    1b28:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
    1b2f:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
    1b35:	83 ec 08             	sub    $0x8,%esp
    1b38:	6a 02                	push   $0x2
    1b3a:	8d 45 be             	lea    -0x42(%ebp),%eax
    1b3d:	50                   	push   %eax
    1b3e:	e8 bb 5c 00 00       	call   77fe <open>
    1b43:	83 c4 10             	add    $0x10,%esp
    1b46:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1b49:	83 ec 08             	sub    $0x8,%esp
    1b4c:	6a 02                	push   $0x2
    1b4e:	8d 45 be             	lea    -0x42(%ebp),%eax
    1b51:	50                   	push   %eax
    1b52:	e8 a7 5c 00 00       	call   77fe <open>
    1b57:	83 c4 10             	add    $0x10,%esp
    1b5a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1b5d:	83 ec 0c             	sub    $0xc,%esp
    1b60:	68 6d 8d 00 00       	push   $0x8d6d
    1b65:	e8 19 0e 00 00       	call   2983 <Printf>
    1b6a:	83 c4 10             	add    $0x10,%esp
    1b6d:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
    1b74:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    1b78:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
    1b7f:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    1b83:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
    1b8a:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
    1b91:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
    1b97:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1b9e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    1ba2:	75 fa                	jne    1b9e <TestFS+0x86>
    1ba4:	83 ec 08             	sub    $0x8,%esp
    1ba7:	6a 07                	push   $0x7
    1ba9:	8d 45 b9             	lea    -0x47(%ebp),%eax
    1bac:	50                   	push   %eax
    1bad:	e8 4c 5c 00 00       	call   77fe <open>
    1bb2:	83 c4 10             	add    $0x10,%esp
    1bb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1bb8:	83 ec 08             	sub    $0x8,%esp
    1bbb:	ff 75 e4             	pushl  -0x1c(%ebp)
    1bbe:	68 7f 8d 00 00       	push   $0x8d7f
    1bc3:	e8 bb 0d 00 00       	call   2983 <Printf>
    1bc8:	83 c4 10             	add    $0x10,%esp
    1bcb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1bd2:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
    1bd9:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
    1be0:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
    1be7:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
    1bee:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
    1bf5:	83 ec 0c             	sub    $0xc,%esp
    1bf8:	8d 45 96             	lea    -0x6a(%ebp),%eax
    1bfb:	50                   	push   %eax
    1bfc:	e8 f9 78 00 00       	call   94fa <Strlen>
    1c01:	83 c4 10             	add    $0x10,%esp
    1c04:	83 ec 04             	sub    $0x4,%esp
    1c07:	50                   	push   %eax
    1c08:	8d 45 96             	lea    -0x6a(%ebp),%eax
    1c0b:	50                   	push   %eax
    1c0c:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c0f:	e8 76 5c 00 00       	call   788a <write>
    1c14:	83 c4 10             	add    $0x10,%esp
    1c17:	83 ec 04             	sub    $0x4,%esp
    1c1a:	6a 14                	push   $0x14
    1c1c:	6a 00                	push   $0x0
    1c1e:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1c21:	50                   	push   %eax
    1c22:	e8 9a 78 00 00       	call   94c1 <Memset>
    1c27:	83 c4 10             	add    $0x10,%esp
    1c2a:	83 ec 04             	sub    $0x4,%esp
    1c2d:	6a 12                	push   $0x12
    1c2f:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1c32:	50                   	push   %eax
    1c33:	ff 75 e4             	pushl  -0x1c(%ebp)
    1c36:	e8 18 5c 00 00       	call   7853 <read>
    1c3b:	83 c4 10             	add    $0x10,%esp
    1c3e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1c41:	83 ec 08             	sub    $0x8,%esp
    1c44:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1c47:	50                   	push   %eax
    1c48:	68 88 8d 00 00       	push   $0x8d88
    1c4d:	e8 31 0d 00 00       	call   2983 <Printf>
    1c52:	83 c4 10             	add    $0x10,%esp
    1c55:	83 ec 0c             	sub    $0xc,%esp
    1c58:	6a 0a                	push   $0xa
    1c5a:	e8 77 0b 00 00       	call   27d6 <delay>
    1c5f:	83 c4 10             	add    $0x10,%esp
    1c62:	83 ec 08             	sub    $0x8,%esp
    1c65:	6a 07                	push   $0x7
    1c67:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    1c6a:	50                   	push   %eax
    1c6b:	e8 8e 5b 00 00       	call   77fe <open>
    1c70:	83 c4 10             	add    $0x10,%esp
    1c73:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1c76:	83 ec 08             	sub    $0x8,%esp
    1c79:	ff 75 dc             	pushl  -0x24(%ebp)
    1c7c:	68 93 8d 00 00       	push   $0x8d93
    1c81:	e8 fd 0c 00 00       	call   2983 <Printf>
    1c86:	83 c4 10             	add    $0x10,%esp
    1c89:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c90:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
    1c97:	67 3a 68 
    1c9a:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
    1ca1:	77 20 61 
    1ca4:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
    1cab:	65 20 79 
    1cae:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
    1cb5:	75 3f 00 
    1cb8:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
    1cbf:	00 00 00 
    1cc2:	83 ec 0c             	sub    $0xc,%esp
    1cc5:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
    1ccb:	50                   	push   %eax
    1ccc:	e8 29 78 00 00       	call   94fa <Strlen>
    1cd1:	83 c4 10             	add    $0x10,%esp
    1cd4:	83 ec 04             	sub    $0x4,%esp
    1cd7:	50                   	push   %eax
    1cd8:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
    1cde:	50                   	push   %eax
    1cdf:	ff 75 dc             	pushl  -0x24(%ebp)
    1ce2:	e8 a3 5b 00 00       	call   788a <write>
    1ce7:	83 c4 10             	add    $0x10,%esp
    1cea:	83 ec 04             	sub    $0x4,%esp
    1ced:	6a 14                	push   $0x14
    1cef:	6a 00                	push   $0x0
    1cf1:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    1cf7:	50                   	push   %eax
    1cf8:	e8 c4 77 00 00       	call   94c1 <Memset>
    1cfd:	83 c4 10             	add    $0x10,%esp
    1d00:	83 ec 04             	sub    $0x4,%esp
    1d03:	6a 12                	push   $0x12
    1d05:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    1d0b:	50                   	push   %eax
    1d0c:	ff 75 dc             	pushl  -0x24(%ebp)
    1d0f:	e8 3f 5b 00 00       	call   7853 <read>
    1d14:	83 c4 10             	add    $0x10,%esp
    1d17:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1d1a:	83 ec 08             	sub    $0x8,%esp
    1d1d:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    1d23:	50                   	push   %eax
    1d24:	68 9d 8d 00 00       	push   $0x8d9d
    1d29:	e8 55 0c 00 00       	call   2983 <Printf>
    1d2e:	83 c4 10             	add    $0x10,%esp
    1d31:	83 ec 08             	sub    $0x8,%esp
    1d34:	6a 07                	push   $0x7
    1d36:	8d 45 aa             	lea    -0x56(%ebp),%eax
    1d39:	50                   	push   %eax
    1d3a:	e8 bf 5a 00 00       	call   77fe <open>
    1d3f:	83 c4 10             	add    $0x10,%esp
    1d42:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1d45:	83 ec 08             	sub    $0x8,%esp
    1d48:	ff 75 dc             	pushl  -0x24(%ebp)
    1d4b:	68 93 8d 00 00       	push   $0x8d93
    1d50:	e8 2e 0c 00 00       	call   2983 <Printf>
    1d55:	83 c4 10             	add    $0x10,%esp
    1d58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d5f:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
    1d66:	20 77 69 
    1d69:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
    1d70:	6c 20 73 
    1d73:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
    1d7a:	63 63 65 
    1d7d:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
    1d84:	73 20 61 
    1d87:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
    1d8e:	20 6c 61 
    1d91:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
    1d98:	74 2e 00 
    1d9b:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
    1da2:	00 00 00 
    1da5:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
    1dac:	00 00 
    1dae:	83 ec 0c             	sub    $0xc,%esp
    1db1:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    1db7:	50                   	push   %eax
    1db8:	e8 3d 77 00 00       	call   94fa <Strlen>
    1dbd:	83 c4 10             	add    $0x10,%esp
    1dc0:	83 ec 04             	sub    $0x4,%esp
    1dc3:	50                   	push   %eax
    1dc4:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    1dca:	50                   	push   %eax
    1dcb:	ff 75 d4             	pushl  -0x2c(%ebp)
    1dce:	e8 b7 5a 00 00       	call   788a <write>
    1dd3:	83 c4 10             	add    $0x10,%esp
    1dd6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1ddd:	eb 5c                	jmp    1e3b <TestFS+0x323>
    1ddf:	83 ec 04             	sub    $0x4,%esp
    1de2:	6a 1e                	push   $0x1e
    1de4:	6a 00                	push   $0x0
    1de6:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    1dec:	50                   	push   %eax
    1ded:	e8 cf 76 00 00       	call   94c1 <Memset>
    1df2:	83 c4 10             	add    $0x10,%esp
    1df5:	83 ec 0c             	sub    $0xc,%esp
    1df8:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    1dfe:	50                   	push   %eax
    1dff:	e8 f6 76 00 00       	call   94fa <Strlen>
    1e04:	83 c4 10             	add    $0x10,%esp
    1e07:	83 ec 04             	sub    $0x4,%esp
    1e0a:	50                   	push   %eax
    1e0b:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    1e11:	50                   	push   %eax
    1e12:	ff 75 d4             	pushl  -0x2c(%ebp)
    1e15:	e8 39 5a 00 00       	call   7853 <read>
    1e1a:	83 c4 10             	add    $0x10,%esp
    1e1d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1e20:	83 ec 08             	sub    $0x8,%esp
    1e23:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    1e29:	50                   	push   %eax
    1e2a:	68 a8 8d 00 00       	push   $0x8da8
    1e2f:	e8 4f 0b 00 00       	call   2983 <Printf>
    1e34:	83 c4 10             	add    $0x10,%esp
    1e37:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1e3b:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
    1e3f:	7e 9e                	jle    1ddf <TestFS+0x2c7>
    1e41:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
    1e48:	6e 73 74 
    1e4b:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
    1e52:	6c 6c 2e 
    1e55:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
    1e5c:	61 72 00 
    1e5f:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
    1e66:	00 00 00 
    1e69:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
    1e70:	00 00 00 
    1e73:	83 ec 08             	sub    $0x8,%esp
    1e76:	6a 00                	push   $0x0
    1e78:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
    1e7e:	50                   	push   %eax
    1e7f:	e8 7a 59 00 00       	call   77fe <open>
    1e84:	83 c4 10             	add    $0x10,%esp
    1e87:	89 45 cc             	mov    %eax,-0x34(%ebp)
    1e8a:	83 ec 08             	sub    $0x8,%esp
    1e8d:	ff 75 cc             	pushl  -0x34(%ebp)
    1e90:	68 b3 8d 00 00       	push   $0x8db3
    1e95:	e8 e9 0a 00 00       	call   2983 <Printf>
    1e9a:	83 c4 10             	add    $0x10,%esp
    1e9d:	83 ec 04             	sub    $0x4,%esp
    1ea0:	6a 14                	push   $0x14
    1ea2:	6a 00                	push   $0x0
    1ea4:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    1eaa:	50                   	push   %eax
    1eab:	e8 11 76 00 00       	call   94c1 <Memset>
    1eb0:	83 c4 10             	add    $0x10,%esp
    1eb3:	83 ec 04             	sub    $0x4,%esp
    1eb6:	68 00 02 00 00       	push   $0x200
    1ebb:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    1ec1:	50                   	push   %eax
    1ec2:	ff 75 cc             	pushl  -0x34(%ebp)
    1ec5:	e8 89 59 00 00       	call   7853 <read>
    1eca:	83 c4 10             	add    $0x10,%esp
    1ecd:	89 45 c8             	mov    %eax,-0x38(%ebp)
    1ed0:	83 ec 08             	sub    $0x8,%esp
    1ed3:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    1ed9:	50                   	push   %eax
    1eda:	68 bd 8d 00 00       	push   $0x8dbd
    1edf:	e8 9f 0a 00 00       	call   2983 <Printf>
    1ee4:	83 c4 10             	add    $0x10,%esp
    1ee7:	e9 b2 fc ff ff       	jmp    1b9e <TestFS+0x86>

00001eec <wait_exit>:
    1eec:	55                   	push   %ebp
    1eed:	89 e5                	mov    %esp,%ebp
    1eef:	83 ec 28             	sub    $0x28,%esp
    1ef2:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
    1ef9:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
    1f00:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
    1f06:	83 ec 08             	sub    $0x8,%esp
    1f09:	6a 02                	push   $0x2
    1f0b:	8d 45 de             	lea    -0x22(%ebp),%eax
    1f0e:	50                   	push   %eax
    1f0f:	e8 ea 58 00 00       	call   77fe <open>
    1f14:	83 c4 10             	add    $0x10,%esp
    1f17:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1f1a:	83 ec 08             	sub    $0x8,%esp
    1f1d:	6a 02                	push   $0x2
    1f1f:	8d 45 de             	lea    -0x22(%ebp),%eax
    1f22:	50                   	push   %eax
    1f23:	e8 d6 58 00 00       	call   77fe <open>
    1f28:	83 c4 10             	add    $0x10,%esp
    1f2b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1f2e:	e8 41 5a 00 00       	call   7974 <fork>
    1f33:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1f36:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1f3a:	7e 25                	jle    1f61 <wait_exit+0x75>
    1f3c:	83 ec 0c             	sub    $0xc,%esp
    1f3f:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1f42:	50                   	push   %eax
    1f43:	e8 c5 59 00 00       	call   790d <wait>
    1f48:	83 c4 10             	add    $0x10,%esp
    1f4b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1f4e:	83 ec 08             	sub    $0x8,%esp
    1f51:	50                   	push   %eax
    1f52:	68 c8 8d 00 00       	push   $0x8dc8
    1f57:	e8 27 0a 00 00       	call   2983 <Printf>
    1f5c:	83 c4 10             	add    $0x10,%esp
    1f5f:	eb fe                	jmp    1f5f <wait_exit+0x73>
    1f61:	83 ec 0c             	sub    $0xc,%esp
    1f64:	68 e3 8d 00 00       	push   $0x8de3
    1f69:	e8 15 0a 00 00       	call   2983 <Printf>
    1f6e:	83 c4 10             	add    $0x10,%esp
    1f71:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f7b:	8d 50 01             	lea    0x1(%eax),%edx
    1f7e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1f81:	3d 50 c3 00 00       	cmp    $0xc350,%eax
    1f86:	7f 02                	jg     1f8a <wait_exit+0x9e>
    1f88:	eb ee                	jmp    1f78 <wait_exit+0x8c>
    1f8a:	90                   	nop
    1f8b:	83 ec 0c             	sub    $0xc,%esp
    1f8e:	68 ef 8d 00 00       	push   $0x8def
    1f93:	e8 eb 09 00 00       	call   2983 <Printf>
    1f98:	83 c4 10             	add    $0x10,%esp
    1f9b:	83 ec 0c             	sub    $0xc,%esp
    1f9e:	6a 09                	push   $0x9
    1fa0:	e8 a6 59 00 00       	call   794b <exit>
    1fa5:	83 c4 10             	add    $0x10,%esp
    1fa8:	83 ec 0c             	sub    $0xc,%esp
    1fab:	68 fd 8d 00 00       	push   $0x8dfd
    1fb0:	e8 ce 09 00 00       	call   2983 <Printf>
    1fb5:	83 c4 10             	add    $0x10,%esp
    1fb8:	eb fe                	jmp    1fb8 <wait_exit+0xcc>

00001fba <INIT_fork>:
    1fba:	55                   	push   %ebp
    1fbb:	89 e5                	mov    %esp,%ebp
    1fbd:	53                   	push   %ebx
    1fbe:	81 ec 84 00 00 00    	sub    $0x84,%esp
    1fc4:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
    1fcb:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
    1fd2:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
    1fd8:	83 ec 08             	sub    $0x8,%esp
    1fdb:	6a 02                	push   $0x2
    1fdd:	8d 45 da             	lea    -0x26(%ebp),%eax
    1fe0:	50                   	push   %eax
    1fe1:	e8 18 58 00 00       	call   77fe <open>
    1fe6:	83 c4 10             	add    $0x10,%esp
    1fe9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1fec:	83 ec 08             	sub    $0x8,%esp
    1fef:	6a 02                	push   $0x2
    1ff1:	8d 45 da             	lea    -0x26(%ebp),%eax
    1ff4:	50                   	push   %eax
    1ff5:	e8 04 58 00 00       	call   77fe <open>
    1ffa:	83 c4 10             	add    $0x10,%esp
    1ffd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2000:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
    2007:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
    200e:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
    2015:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
    201c:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
    2023:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
    202a:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
    2031:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
    2038:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
    203f:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
    2046:	83 ec 0c             	sub    $0xc,%esp
    2049:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    204c:	50                   	push   %eax
    204d:	e8 a8 74 00 00       	call   94fa <Strlen>
    2052:	83 c4 10             	add    $0x10,%esp
    2055:	83 ec 04             	sub    $0x4,%esp
    2058:	50                   	push   %eax
    2059:	6a 00                	push   $0x0
    205b:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    205e:	50                   	push   %eax
    205f:	e8 5d 74 00 00       	call   94c1 <Memset>
    2064:	83 c4 10             	add    $0x10,%esp
    2067:	83 ec 04             	sub    $0x4,%esp
    206a:	6a 28                	push   $0x28
    206c:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    206f:	50                   	push   %eax
    2070:	ff 75 e8             	pushl  -0x18(%ebp)
    2073:	e8 db 57 00 00       	call   7853 <read>
    2078:	83 c4 10             	add    $0x10,%esp
    207b:	83 ec 04             	sub    $0x4,%esp
    207e:	6a 28                	push   $0x28
    2080:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2083:	50                   	push   %eax
    2084:	ff 75 ec             	pushl  -0x14(%ebp)
    2087:	e8 fe 57 00 00       	call   788a <write>
    208c:	83 c4 10             	add    $0x10,%esp
    208f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2096:	e8 d9 58 00 00       	call   7974 <fork>
    209b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    209e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    20a2:	0f 8e dd 00 00 00    	jle    2185 <INIT_fork+0x1cb>
    20a8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    20ac:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
    20b3:	61 72 65 
    20b6:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
    20bd:	8d 45 87             	lea    -0x79(%ebp),%eax
    20c0:	b9 20 00 00 00       	mov    $0x20,%ecx
    20c5:	bb 00 00 00 00       	mov    $0x0,%ebx
    20ca:	89 18                	mov    %ebx,(%eax)
    20cc:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
    20d0:	8d 50 04             	lea    0x4(%eax),%edx
    20d3:	83 e2 fc             	and    $0xfffffffc,%edx
    20d6:	29 d0                	sub    %edx,%eax
    20d8:	01 c1                	add    %eax,%ecx
    20da:	83 e1 fc             	and    $0xfffffffc,%ecx
    20dd:	83 e1 fc             	and    $0xfffffffc,%ecx
    20e0:	b8 00 00 00 00       	mov    $0x0,%eax
    20e5:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
    20e8:	83 c0 04             	add    $0x4,%eax
    20eb:	39 c8                	cmp    %ecx,%eax
    20ed:	72 f6                	jb     20e5 <INIT_fork+0x12b>
    20ef:	01 c2                	add    %eax,%edx
    20f1:	83 ec 0c             	sub    $0xc,%esp
    20f4:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    20fa:	50                   	push   %eax
    20fb:	e8 fa 73 00 00       	call   94fa <Strlen>
    2100:	83 c4 10             	add    $0x10,%esp
    2103:	83 ec 04             	sub    $0x4,%esp
    2106:	50                   	push   %eax
    2107:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    210d:	50                   	push   %eax
    210e:	ff 75 ec             	pushl  -0x14(%ebp)
    2111:	e8 74 57 00 00       	call   788a <write>
    2116:	83 c4 10             	add    $0x10,%esp
    2119:	83 ec 0c             	sub    $0xc,%esp
    211c:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2122:	50                   	push   %eax
    2123:	e8 d2 73 00 00       	call   94fa <Strlen>
    2128:	83 c4 10             	add    $0x10,%esp
    212b:	83 ec 04             	sub    $0x4,%esp
    212e:	50                   	push   %eax
    212f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2135:	50                   	push   %eax
    2136:	ff 75 ec             	pushl  -0x14(%ebp)
    2139:	e8 4c 57 00 00       	call   788a <write>
    213e:	83 c4 10             	add    $0x10,%esp
    2141:	83 ec 0c             	sub    $0xc,%esp
    2144:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    214a:	50                   	push   %eax
    214b:	e8 aa 73 00 00       	call   94fa <Strlen>
    2150:	83 c4 10             	add    $0x10,%esp
    2153:	83 ec 04             	sub    $0x4,%esp
    2156:	50                   	push   %eax
    2157:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    215d:	50                   	push   %eax
    215e:	ff 75 ec             	pushl  -0x14(%ebp)
    2161:	e8 24 57 00 00       	call   788a <write>
    2166:	83 c4 10             	add    $0x10,%esp
    2169:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2170:	eb 08                	jmp    217a <INIT_fork+0x1c0>
    2172:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2176:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    217a:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    217e:	7e f2                	jle    2172 <INIT_fork+0x1b8>
    2180:	e9 0f 01 00 00       	jmp    2294 <INIT_fork+0x2da>
    2185:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2189:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
    218d:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
    2194:	68 69 6c 
    2197:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
    219e:	8d 45 87             	lea    -0x79(%ebp),%eax
    21a1:	b9 20 00 00 00       	mov    $0x20,%ecx
    21a6:	bb 00 00 00 00       	mov    $0x0,%ebx
    21ab:	89 18                	mov    %ebx,(%eax)
    21ad:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
    21b1:	8d 50 04             	lea    0x4(%eax),%edx
    21b4:	83 e2 fc             	and    $0xfffffffc,%edx
    21b7:	29 d0                	sub    %edx,%eax
    21b9:	01 c1                	add    %eax,%ecx
    21bb:	83 e1 fc             	and    $0xfffffffc,%ecx
    21be:	83 e1 fc             	and    $0xfffffffc,%ecx
    21c1:	b8 00 00 00 00       	mov    $0x0,%eax
    21c6:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
    21c9:	83 c0 04             	add    $0x4,%eax
    21cc:	39 c8                	cmp    %ecx,%eax
    21ce:	72 f6                	jb     21c6 <INIT_fork+0x20c>
    21d0:	01 c2                	add    %eax,%edx
    21d2:	83 ec 0c             	sub    $0xc,%esp
    21d5:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    21db:	50                   	push   %eax
    21dc:	e8 19 73 00 00       	call   94fa <Strlen>
    21e1:	83 c4 10             	add    $0x10,%esp
    21e4:	83 ec 04             	sub    $0x4,%esp
    21e7:	50                   	push   %eax
    21e8:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    21ee:	50                   	push   %eax
    21ef:	ff 75 ec             	pushl  -0x14(%ebp)
    21f2:	e8 93 56 00 00       	call   788a <write>
    21f7:	83 c4 10             	add    $0x10,%esp
    21fa:	83 ec 0c             	sub    $0xc,%esp
    21fd:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2203:	50                   	push   %eax
    2204:	e8 f1 72 00 00       	call   94fa <Strlen>
    2209:	83 c4 10             	add    $0x10,%esp
    220c:	83 ec 04             	sub    $0x4,%esp
    220f:	50                   	push   %eax
    2210:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2216:	50                   	push   %eax
    2217:	ff 75 ec             	pushl  -0x14(%ebp)
    221a:	e8 6b 56 00 00       	call   788a <write>
    221f:	83 c4 10             	add    $0x10,%esp
    2222:	83 ec 0c             	sub    $0xc,%esp
    2225:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    222b:	50                   	push   %eax
    222c:	e8 c9 72 00 00       	call   94fa <Strlen>
    2231:	83 c4 10             	add    $0x10,%esp
    2234:	83 ec 04             	sub    $0x4,%esp
    2237:	50                   	push   %eax
    2238:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    223e:	50                   	push   %eax
    223f:	ff 75 ec             	pushl  -0x14(%ebp)
    2242:	e8 43 56 00 00       	call   788a <write>
    2247:	83 c4 10             	add    $0x10,%esp
    224a:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
    2251:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
    2258:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
    225e:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
    2262:	83 ec 0c             	sub    $0xc,%esp
    2265:	8d 45 a7             	lea    -0x59(%ebp),%eax
    2268:	50                   	push   %eax
    2269:	e8 8c 72 00 00       	call   94fa <Strlen>
    226e:	83 c4 10             	add    $0x10,%esp
    2271:	83 ec 04             	sub    $0x4,%esp
    2274:	50                   	push   %eax
    2275:	8d 45 a7             	lea    -0x59(%ebp),%eax
    2278:	50                   	push   %eax
    2279:	ff 75 ec             	pushl  -0x14(%ebp)
    227c:	e8 09 56 00 00       	call   788a <write>
    2281:	83 c4 10             	add    $0x10,%esp
    2284:	83 ec 0c             	sub    $0xc,%esp
    2287:	68 0b 8e 00 00       	push   $0x8e0b
    228c:	e8 1e 0a 00 00       	call   2caf <spin>
    2291:	83 c4 10             	add    $0x10,%esp
    2294:	83 ec 0c             	sub    $0xc,%esp
    2297:	68 12 8e 00 00       	push   $0x8e12
    229c:	e8 0e 0a 00 00       	call   2caf <spin>
    22a1:	83 c4 10             	add    $0x10,%esp
    22a4:	90                   	nop
    22a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    22a8:	c9                   	leave  
    22a9:	c3                   	ret    

000022aa <simple_shell>:
    22aa:	55                   	push   %ebp
    22ab:	89 e5                	mov    %esp,%ebp
    22ad:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    22b3:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
    22ba:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
    22c1:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
    22c7:	83 ec 08             	sub    $0x8,%esp
    22ca:	6a 02                	push   $0x2
    22cc:	8d 45 c2             	lea    -0x3e(%ebp),%eax
    22cf:	50                   	push   %eax
    22d0:	e8 29 55 00 00       	call   77fe <open>
    22d5:	83 c4 10             	add    $0x10,%esp
    22d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
    22db:	83 ec 08             	sub    $0x8,%esp
    22de:	6a 02                	push   $0x2
    22e0:	8d 45 c2             	lea    -0x3e(%ebp),%eax
    22e3:	50                   	push   %eax
    22e4:	e8 15 55 00 00       	call   77fe <open>
    22e9:	83 c4 10             	add    $0x10,%esp
    22ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
    22ef:	83 ec 04             	sub    $0x4,%esp
    22f2:	68 80 00 00 00       	push   $0x80
    22f7:	6a 00                	push   $0x0
    22f9:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    22ff:	50                   	push   %eax
    2300:	e8 bc 71 00 00       	call   94c1 <Memset>
    2305:	83 c4 10             	add    $0x10,%esp
    2308:	83 ec 04             	sub    $0x4,%esp
    230b:	68 80 00 00 00       	push   $0x80
    2310:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    2316:	50                   	push   %eax
    2317:	ff 75 e0             	pushl  -0x20(%ebp)
    231a:	e8 34 55 00 00       	call   7853 <read>
    231f:	83 c4 10             	add    $0x10,%esp
    2322:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2329:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2330:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    2336:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2339:	8b 45 ec             	mov    -0x14(%ebp),%eax
    233c:	0f b6 00             	movzbl (%eax),%eax
    233f:	88 45 db             	mov    %al,-0x25(%ebp)
    2342:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2345:	0f b6 00             	movzbl (%eax),%eax
    2348:	3c 20                	cmp    $0x20,%al
    234a:	74 1d                	je     2369 <simple_shell+0xbf>
    234c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    234f:	0f b6 00             	movzbl (%eax),%eax
    2352:	84 c0                	test   %al,%al
    2354:	74 13                	je     2369 <simple_shell+0xbf>
    2356:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    235a:	75 0d                	jne    2369 <simple_shell+0xbf>
    235c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    235f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2362:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    2369:	8b 45 ec             	mov    -0x14(%ebp),%eax
    236c:	0f b6 00             	movzbl (%eax),%eax
    236f:	3c 20                	cmp    $0x20,%al
    2371:	74 0a                	je     237d <simple_shell+0xd3>
    2373:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2376:	0f b6 00             	movzbl (%eax),%eax
    2379:	84 c0                	test   %al,%al
    237b:	75 26                	jne    23a3 <simple_shell+0xf9>
    237d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2381:	75 20                	jne    23a3 <simple_shell+0xf9>
    2383:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2386:	8d 50 01             	lea    0x1(%eax),%edx
    2389:	89 55 f4             	mov    %edx,-0xc(%ebp)
    238c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    238f:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
    2396:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2399:	c6 00 00             	movb   $0x0,(%eax)
    239c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    23a3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    23a7:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
    23ab:	75 8c                	jne    2339 <simple_shell+0x8f>
    23ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23b0:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
    23b7:	00 00 00 00 
    23bb:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
    23c2:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    23c8:	83 ec 08             	sub    $0x8,%esp
    23cb:	6a 02                	push   $0x2
    23cd:	50                   	push   %eax
    23ce:	e8 2b 54 00 00       	call   77fe <open>
    23d3:	83 c4 10             	add    $0x10,%esp
    23d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
    23d9:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    23dd:	75 54                	jne    2433 <simple_shell+0x189>
    23df:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    23e6:	eb 29                	jmp    2411 <simple_shell+0x167>
    23e8:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
    23ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    23f1:	01 d0                	add    %edx,%eax
    23f3:	0f b6 00             	movzbl (%eax),%eax
    23f6:	0f be c0             	movsbl %al,%eax
    23f9:	83 ec 04             	sub    $0x4,%esp
    23fc:	50                   	push   %eax
    23fd:	ff 75 e4             	pushl  -0x1c(%ebp)
    2400:	68 1a 8e 00 00       	push   $0x8e1a
    2405:	e8 79 05 00 00       	call   2983 <Printf>
    240a:	83 c4 10             	add    $0x10,%esp
    240d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    2411:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
    2415:	7e d1                	jle    23e8 <simple_shell+0x13e>
    2417:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    241d:	83 ec 08             	sub    $0x8,%esp
    2420:	50                   	push   %eax
    2421:	68 21 8e 00 00       	push   $0x8e21
    2426:	e8 58 05 00 00       	call   2983 <Printf>
    242b:	83 c4 10             	add    $0x10,%esp
    242e:	e9 bc fe ff ff       	jmp    22ef <simple_shell+0x45>
    2433:	e8 3c 55 00 00       	call   7974 <fork>
    2438:	89 45 cc             	mov    %eax,-0x34(%ebp)
    243b:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    243f:	7e 17                	jle    2458 <simple_shell+0x1ae>
    2441:	83 ec 0c             	sub    $0xc,%esp
    2444:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    244a:	50                   	push   %eax
    244b:	e8 bd 54 00 00       	call   790d <wait>
    2450:	83 c4 10             	add    $0x10,%esp
    2453:	e9 97 fe ff ff       	jmp    22ef <simple_shell+0x45>
    2458:	83 ec 0c             	sub    $0xc,%esp
    245b:	ff 75 d0             	pushl  -0x30(%ebp)
    245e:	e8 5e 54 00 00       	call   78c1 <close>
    2463:	83 c4 10             	add    $0x10,%esp
    2466:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    246c:	83 ec 08             	sub    $0x8,%esp
    246f:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
    2475:	52                   	push   %edx
    2476:	50                   	push   %eax
    2477:	e8 e7 55 00 00       	call   7a63 <execv>
    247c:	83 c4 10             	add    $0x10,%esp
    247f:	eb fe                	jmp    247f <simple_shell+0x1d5>

00002481 <test_split_str>:
    2481:	55                   	push   %ebp
    2482:	89 e5                	mov    %esp,%ebp
    2484:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
    248a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2491:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2498:	c7 45 ec 27 8e 00 00 	movl   $0x8e27,-0x14(%ebp)
    249f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    24a3:	75 1a                	jne    24bf <test_split_str+0x3e>
    24a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a8:	0f b6 00             	movzbl (%eax),%eax
    24ab:	0f be c0             	movsbl %al,%eax
    24ae:	83 ec 08             	sub    $0x8,%esp
    24b1:	50                   	push   %eax
    24b2:	68 38 8e 00 00       	push   $0x8e38
    24b7:	e8 c7 04 00 00       	call   2983 <Printf>
    24bc:	83 c4 10             	add    $0x10,%esp
    24bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24c2:	0f b6 00             	movzbl (%eax),%eax
    24c5:	3c 20                	cmp    $0x20,%al
    24c7:	75 0a                	jne    24d3 <test_split_str+0x52>
    24c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24cc:	0f b6 00             	movzbl (%eax),%eax
    24cf:	84 c0                	test   %al,%al
    24d1:	74 13                	je     24e6 <test_split_str+0x65>
    24d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    24d7:	75 0d                	jne    24e6 <test_split_str+0x65>
    24d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
    24df:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    24e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24e9:	0f b6 00             	movzbl (%eax),%eax
    24ec:	3c 20                	cmp    $0x20,%al
    24ee:	74 0a                	je     24fa <test_split_str+0x79>
    24f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24f3:	0f b6 00             	movzbl (%eax),%eax
    24f6:	84 c0                	test   %al,%al
    24f8:	75 26                	jne    2520 <test_split_str+0x9f>
    24fa:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    24fe:	75 20                	jne    2520 <test_split_str+0x9f>
    2500:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2503:	8d 50 01             	lea    0x1(%eax),%edx
    2506:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2509:	8b 55 e8             	mov    -0x18(%ebp),%edx
    250c:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
    2513:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2516:	c6 00 00             	movb   $0x0,(%eax)
    2519:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2520:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2524:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2527:	0f b6 00             	movzbl (%eax),%eax
    252a:	84 c0                	test   %al,%al
    252c:	0f 85 6d ff ff ff    	jne    249f <test_split_str+0x1e>
    2532:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2535:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2538:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
    253f:	83 ec 08             	sub    $0x8,%esp
    2542:	ff 75 f4             	pushl  -0xc(%ebp)
    2545:	68 41 8e 00 00       	push   $0x8e41
    254a:	e8 34 04 00 00       	call   2983 <Printf>
    254f:	83 c4 10             	add    $0x10,%esp
    2552:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    2559:	eb 22                	jmp    257d <test_split_str+0xfc>
    255b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    255e:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
    2565:	83 ec 04             	sub    $0x4,%esp
    2568:	50                   	push   %eax
    2569:	ff 75 e4             	pushl  -0x1c(%ebp)
    256c:	68 58 8e 00 00       	push   $0x8e58
    2571:	e8 0d 04 00 00       	call   2983 <Printf>
    2576:	83 c4 10             	add    $0x10,%esp
    2579:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    257d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2580:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2583:	7e d6                	jle    255b <test_split_str+0xda>
    2585:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
    258b:	83 ec 08             	sub    $0x8,%esp
    258e:	68 67 8e 00 00       	push   $0x8e67
    2593:	50                   	push   %eax
    2594:	e8 94 12 00 00       	call   382d <strcmp>
    2599:	83 c4 10             	add    $0x10,%esp
    259c:	85 c0                	test   %eax,%eax
    259e:	75 10                	jne    25b0 <test_split_str+0x12f>
    25a0:	83 ec 0c             	sub    $0xc,%esp
    25a3:	68 6c 8e 00 00       	push   $0x8e6c
    25a8:	e8 d6 03 00 00       	call   2983 <Printf>
    25ad:	83 c4 10             	add    $0x10,%esp
    25b0:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
    25b6:	83 ec 08             	sub    $0x8,%esp
    25b9:	50                   	push   %eax
    25ba:	68 78 8e 00 00       	push   $0x8e78
    25bf:	e8 bf 03 00 00       	call   2983 <Printf>
    25c4:	83 c4 10             	add    $0x10,%esp
    25c7:	83 ec 0c             	sub    $0xc,%esp
    25ca:	68 86 8e 00 00       	push   $0x8e86
    25cf:	e8 af 03 00 00       	call   2983 <Printf>
    25d4:	83 c4 10             	add    $0x10,%esp
    25d7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    25de:	eb 26                	jmp    2606 <test_split_str+0x185>
    25e0:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
    25e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    25e9:	01 d0                	add    %edx,%eax
    25eb:	0f b6 00             	movzbl (%eax),%eax
    25ee:	0f be c0             	movsbl %al,%eax
    25f1:	83 ec 08             	sub    $0x8,%esp
    25f4:	50                   	push   %eax
    25f5:	68 95 8e 00 00       	push   $0x8e95
    25fa:	e8 84 03 00 00       	call   2983 <Printf>
    25ff:	83 c4 10             	add    $0x10,%esp
    2602:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    2606:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
    260a:	7e d4                	jle    25e0 <test_split_str+0x15f>
    260c:	c9                   	leave  
    260d:	c3                   	ret    

0000260e <test_shell>:
    260e:	55                   	push   %ebp
    260f:	89 e5                	mov    %esp,%ebp
    2611:	83 ec 48             	sub    $0x48,%esp
    2614:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
    261b:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
    2622:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
    2628:	83 ec 08             	sub    $0x8,%esp
    262b:	6a 02                	push   $0x2
    262d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    2630:	50                   	push   %eax
    2631:	e8 c8 51 00 00       	call   77fe <open>
    2636:	83 c4 10             	add    $0x10,%esp
    2639:	89 45 f4             	mov    %eax,-0xc(%ebp)
    263c:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
    2643:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
    264a:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
    2651:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
    2658:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
    265f:	83 ec 0c             	sub    $0xc,%esp
    2662:	8d 45 ce             	lea    -0x32(%ebp),%eax
    2665:	50                   	push   %eax
    2666:	e8 56 ed ff ff       	call   13c1 <untar>
    266b:	83 c4 10             	add    $0x10,%esp
    266e:	e8 01 53 00 00       	call   7974 <fork>
    2673:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2676:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    267a:	7e 25                	jle    26a1 <test_shell+0x93>
    267c:	83 ec 0c             	sub    $0xc,%esp
    267f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    2682:	50                   	push   %eax
    2683:	e8 85 52 00 00       	call   790d <wait>
    2688:	83 c4 10             	add    $0x10,%esp
    268b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    268e:	83 ec 08             	sub    $0x8,%esp
    2691:	50                   	push   %eax
    2692:	68 9e 8e 00 00       	push   $0x8e9e
    2697:	e8 e7 02 00 00       	call   2983 <Printf>
    269c:	83 c4 10             	add    $0x10,%esp
    269f:	eb 23                	jmp    26c4 <test_shell+0xb6>
    26a1:	83 ec 0c             	sub    $0xc,%esp
    26a4:	68 b0 8e 00 00       	push   $0x8eb0
    26a9:	e8 d5 02 00 00       	call   2983 <Printf>
    26ae:	83 c4 10             	add    $0x10,%esp
    26b1:	83 ec 0c             	sub    $0xc,%esp
    26b4:	ff 75 f4             	pushl  -0xc(%ebp)
    26b7:	e8 05 52 00 00       	call   78c1 <close>
    26bc:	83 c4 10             	add    $0x10,%esp
    26bf:	e8 e6 fb ff ff       	call   22aa <simple_shell>
    26c4:	83 ec 0c             	sub    $0xc,%esp
    26c7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    26ca:	50                   	push   %eax
    26cb:	e8 3d 52 00 00       	call   790d <wait>
    26d0:	83 c4 10             	add    $0x10,%esp
    26d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    26d6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    26d9:	83 ec 08             	sub    $0x8,%esp
    26dc:	50                   	push   %eax
    26dd:	68 be 8e 00 00       	push   $0x8ebe
    26e2:	e8 9c 02 00 00       	call   2983 <Printf>
    26e7:	83 c4 10             	add    $0x10,%esp
    26ea:	eb d8                	jmp    26c4 <test_shell+0xb6>

000026ec <test_exec>:
    26ec:	55                   	push   %ebp
    26ed:	89 e5                	mov    %esp,%ebp
    26ef:	83 ec 38             	sub    $0x38,%esp
    26f2:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
    26f9:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
    2700:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
    2706:	83 ec 08             	sub    $0x8,%esp
    2709:	6a 02                	push   $0x2
    270b:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    270e:	50                   	push   %eax
    270f:	e8 ea 50 00 00       	call   77fe <open>
    2714:	83 c4 10             	add    $0x10,%esp
    2717:	89 45 f4             	mov    %eax,-0xc(%ebp)
    271a:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
    2721:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
    2728:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
    272f:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
    2736:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
    273d:	83 ec 0c             	sub    $0xc,%esp
    2740:	8d 45 d2             	lea    -0x2e(%ebp),%eax
    2743:	50                   	push   %eax
    2744:	e8 78 ec ff ff       	call   13c1 <untar>
    2749:	83 c4 10             	add    $0x10,%esp
    274c:	e8 23 52 00 00       	call   7974 <fork>
    2751:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2754:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2758:	7e 25                	jle    277f <test_exec+0x93>
    275a:	83 ec 0c             	sub    $0xc,%esp
    275d:	8d 45 cc             	lea    -0x34(%ebp),%eax
    2760:	50                   	push   %eax
    2761:	e8 a7 51 00 00       	call   790d <wait>
    2766:	83 c4 10             	add    $0x10,%esp
    2769:	8b 45 cc             	mov    -0x34(%ebp),%eax
    276c:	83 ec 08             	sub    $0x8,%esp
    276f:	50                   	push   %eax
    2770:	68 9e 8e 00 00       	push   $0x8e9e
    2775:	e8 09 02 00 00       	call   2983 <Printf>
    277a:	83 c4 10             	add    $0x10,%esp
    277d:	eb 33                	jmp    27b2 <test_exec+0xc6>
    277f:	83 ec 0c             	sub    $0xc,%esp
    2782:	68 b0 8e 00 00       	push   $0x8eb0
    2787:	e8 f7 01 00 00       	call   2983 <Printf>
    278c:	83 c4 10             	add    $0x10,%esp
    278f:	83 ec 0c             	sub    $0xc,%esp
    2792:	6a 00                	push   $0x0
    2794:	68 d9 8e 00 00       	push   $0x8ed9
    2799:	68 df 8e 00 00       	push   $0x8edf
    279e:	68 67 8e 00 00       	push   $0x8e67
    27a3:	68 e5 8e 00 00       	push   $0x8ee5
    27a8:	e8 5b 54 00 00       	call   7c08 <execl>
    27ad:	83 c4 20             	add    $0x20,%esp
    27b0:	eb fe                	jmp    27b0 <test_exec+0xc4>
    27b2:	c9                   	leave  
    27b3:	c3                   	ret    

000027b4 <INIT>:
    27b4:	55                   	push   %ebp
    27b5:	89 e5                	mov    %esp,%ebp
    27b7:	83 ec 08             	sub    $0x8,%esp
    27ba:	e8 4f fe ff ff       	call   260e <test_shell>
    27bf:	eb fe                	jmp    27bf <INIT+0xb>

000027c1 <TestA>:
    27c1:	55                   	push   %ebp
    27c2:	89 e5                	mov    %esp,%ebp
    27c4:	83 ec 08             	sub    $0x8,%esp
    27c7:	83 ec 0c             	sub    $0xc,%esp
    27ca:	6a 05                	push   $0x5
    27cc:	e8 a0 ee ff ff       	call   1671 <disp_int>
    27d1:	83 c4 10             	add    $0x10,%esp
    27d4:	eb fe                	jmp    27d4 <TestA+0x13>

000027d6 <delay>:
    27d6:	55                   	push   %ebp
    27d7:	89 e5                	mov    %esp,%ebp
    27d9:	83 ec 10             	sub    $0x10,%esp
    27dc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    27e3:	eb 2d                	jmp    2812 <delay+0x3c>
    27e5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    27ec:	eb 1a                	jmp    2808 <delay+0x32>
    27ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    27f5:	eb 04                	jmp    27fb <delay+0x25>
    27f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    27fb:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    2802:	7e f3                	jle    27f7 <delay+0x21>
    2804:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2808:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
    280c:	7e e0                	jle    27ee <delay+0x18>
    280e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2812:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2815:	3b 45 08             	cmp    0x8(%ebp),%eax
    2818:	7c cb                	jl     27e5 <delay+0xf>
    281a:	90                   	nop
    281b:	c9                   	leave  
    281c:	c3                   	ret    

0000281d <TestB>:
    281d:	55                   	push   %ebp
    281e:	89 e5                	mov    %esp,%ebp
    2820:	83 ec 18             	sub    $0x18,%esp
    2823:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    282a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    282e:	77 16                	ja     2846 <TestB+0x29>
    2830:	e8 38 0e 00 00       	call   366d <get_ticks_ipc>
    2835:	83 ec 08             	sub    $0x8,%esp
    2838:	50                   	push   %eax
    2839:	68 eb 8e 00 00       	push   $0x8eeb
    283e:	e8 40 01 00 00       	call   2983 <Printf>
    2843:	83 c4 10             	add    $0x10,%esp
    2846:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    284a:	eb de                	jmp    282a <TestB+0xd>

0000284c <TestC>:
    284c:	55                   	push   %ebp
    284d:	89 e5                	mov    %esp,%ebp
    284f:	83 ec 18             	sub    $0x18,%esp
    2852:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2859:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    285d:	77 1a                	ja     2879 <TestC+0x2d>
    285f:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
    2866:	83 ec 08             	sub    $0x8,%esp
    2869:	ff 75 f0             	pushl  -0x10(%ebp)
    286c:	68 f2 8e 00 00       	push   $0x8ef2
    2871:	e8 0d 01 00 00       	call   2983 <Printf>
    2876:	83 c4 10             	add    $0x10,%esp
    2879:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    287d:	eb da                	jmp    2859 <TestC+0xd>

0000287f <sys_get_ticks>:
    287f:	55                   	push   %ebp
    2880:	89 e5                	mov    %esp,%ebp
    2882:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    2887:	5d                   	pop    %ebp
    2888:	c3                   	ret    

00002889 <sys_write>:
    2889:	55                   	push   %ebp
    288a:	89 e5                	mov    %esp,%ebp
    288c:	83 ec 18             	sub    $0x18,%esp
    288f:	8b 45 10             	mov    0x10(%ebp),%eax
    2892:	8b 40 64             	mov    0x64(%eax),%eax
    2895:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    289b:	05 80 dd 00 00       	add    $0xdd80,%eax
    28a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    28a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    28a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    28a9:	8b 45 08             	mov    0x8(%ebp),%eax
    28ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
    28af:	eb 20                	jmp    28d1 <sys_write+0x48>
    28b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28b4:	0f b6 00             	movzbl (%eax),%eax
    28b7:	0f b6 c0             	movzbl %al,%eax
    28ba:	83 ec 08             	sub    $0x8,%esp
    28bd:	50                   	push   %eax
    28be:	ff 75 ec             	pushl  -0x14(%ebp)
    28c1:	e8 53 43 00 00       	call   6c19 <out_char>
    28c6:	83 c4 10             	add    $0x10,%esp
    28c9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    28cd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    28d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    28d5:	7f da                	jg     28b1 <sys_write+0x28>
    28d7:	90                   	nop
    28d8:	c9                   	leave  
    28d9:	c3                   	ret    

000028da <milli_delay>:
    28da:	55                   	push   %ebp
    28db:	89 e5                	mov    %esp,%ebp
    28dd:	83 ec 18             	sub    $0x18,%esp
    28e0:	e8 88 0d 00 00       	call   366d <get_ticks_ipc>
    28e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    28e8:	90                   	nop
    28e9:	e8 7f 0d 00 00       	call   366d <get_ticks_ipc>
    28ee:	2b 45 f4             	sub    -0xc(%ebp),%eax
    28f1:	89 c1                	mov    %eax,%ecx
    28f3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    28f8:	89 c8                	mov    %ecx,%eax
    28fa:	f7 ea                	imul   %edx
    28fc:	c1 fa 05             	sar    $0x5,%edx
    28ff:	89 c8                	mov    %ecx,%eax
    2901:	c1 f8 1f             	sar    $0x1f,%eax
    2904:	29 c2                	sub    %eax,%edx
    2906:	89 d0                	mov    %edx,%eax
    2908:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
    290e:	39 45 08             	cmp    %eax,0x8(%ebp)
    2911:	77 d6                	ja     28e9 <milli_delay+0xf>
    2913:	90                   	nop
    2914:	c9                   	leave  
    2915:	c3                   	ret    

00002916 <TaskSys>:
    2916:	55                   	push   %ebp
    2917:	89 e5                	mov    %esp,%ebp
    2919:	81 ec 88 00 00 00    	sub    $0x88,%esp
    291f:	83 ec 04             	sub    $0x4,%esp
    2922:	6a 6c                	push   $0x6c
    2924:	6a 00                	push   $0x0
    2926:	8d 45 80             	lea    -0x80(%ebp),%eax
    2929:	50                   	push   %eax
    292a:	e8 92 6b 00 00       	call   94c1 <Memset>
    292f:	83 c4 10             	add    $0x10,%esp
    2932:	83 ec 08             	sub    $0x8,%esp
    2935:	6a 10                	push   $0x10
    2937:	8d 45 80             	lea    -0x80(%ebp),%eax
    293a:	50                   	push   %eax
    293b:	e8 2e 1c 00 00       	call   456e <receive_msg>
    2940:	83 c4 10             	add    $0x10,%esp
    2943:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2946:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    294a:	75 34                	jne    2980 <TaskSys+0x6a>
    294c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    294f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2952:	8b 45 80             	mov    -0x80(%ebp),%eax
    2955:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2958:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    295c:	75 1f                	jne    297d <TaskSys+0x67>
    295e:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    2963:	89 45 88             	mov    %eax,-0x78(%ebp)
    2966:	83 ec 08             	sub    $0x8,%esp
    2969:	ff 75 ec             	pushl  -0x14(%ebp)
    296c:	8d 45 80             	lea    -0x80(%ebp),%eax
    296f:	50                   	push   %eax
    2970:	e8 d3 1b 00 00       	call   4548 <send_msg>
    2975:	83 c4 10             	add    $0x10,%esp
    2978:	89 45 f4             	mov    %eax,-0xc(%ebp)
    297b:	eb 01                	jmp    297e <TaskSys+0x68>
    297d:	90                   	nop
    297e:	eb 9f                	jmp    291f <TaskSys+0x9>
    2980:	90                   	nop
    2981:	c9                   	leave  
    2982:	c3                   	ret    

00002983 <Printf>:
    2983:	55                   	push   %ebp
    2984:	89 e5                	mov    %esp,%ebp
    2986:	81 ec 18 01 00 00    	sub    $0x118,%esp
    298c:	83 ec 04             	sub    $0x4,%esp
    298f:	68 00 01 00 00       	push   $0x100
    2994:	6a 00                	push   $0x0
    2996:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    299c:	50                   	push   %eax
    299d:	e8 1f 6b 00 00       	call   94c1 <Memset>
    29a2:	83 c4 10             	add    $0x10,%esp
    29a5:	8d 45 0c             	lea    0xc(%ebp),%eax
    29a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    29ab:	8b 45 08             	mov    0x8(%ebp),%eax
    29ae:	83 ec 04             	sub    $0x4,%esp
    29b1:	ff 75 f4             	pushl  -0xc(%ebp)
    29b4:	50                   	push   %eax
    29b5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    29bb:	50                   	push   %eax
    29bc:	e8 20 00 00 00       	call   29e1 <vsprintf>
    29c1:	83 c4 10             	add    $0x10,%esp
    29c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    29c7:	83 ec 04             	sub    $0x4,%esp
    29ca:	ff 75 f0             	pushl  -0x10(%ebp)
    29cd:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    29d3:	50                   	push   %eax
    29d4:	6a 00                	push   $0x0
    29d6:	e8 af 4e 00 00       	call   788a <write>
    29db:	83 c4 10             	add    $0x10,%esp
    29de:	90                   	nop
    29df:	c9                   	leave  
    29e0:	c3                   	ret    

000029e1 <vsprintf>:
    29e1:	55                   	push   %ebp
    29e2:	89 e5                	mov    %esp,%ebp
    29e4:	81 ec 68 02 00 00    	sub    $0x268,%esp
    29ea:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    29f0:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
    29f6:	83 ec 04             	sub    $0x4,%esp
    29f9:	6a 40                	push   $0x40
    29fb:	6a 00                	push   $0x0
    29fd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2a03:	50                   	push   %eax
    2a04:	e8 b8 6a 00 00       	call   94c1 <Memset>
    2a09:	83 c4 10             	add    $0x10,%esp
    2a0c:	8b 45 10             	mov    0x10(%ebp),%eax
    2a0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2a12:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    2a19:	8b 45 08             	mov    0x8(%ebp),%eax
    2a1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a1f:	e9 53 01 00 00       	jmp    2b77 <vsprintf+0x196>
    2a24:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a27:	0f b6 00             	movzbl (%eax),%eax
    2a2a:	3c 25                	cmp    $0x25,%al
    2a2c:	74 16                	je     2a44 <vsprintf+0x63>
    2a2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a31:	8d 50 01             	lea    0x1(%eax),%edx
    2a34:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2a37:	8b 55 0c             	mov    0xc(%ebp),%edx
    2a3a:	0f b6 12             	movzbl (%edx),%edx
    2a3d:	88 10                	mov    %dl,(%eax)
    2a3f:	e9 2f 01 00 00       	jmp    2b73 <vsprintf+0x192>
    2a44:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2a48:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a4b:	0f b6 00             	movzbl (%eax),%eax
    2a4e:	0f be c0             	movsbl %al,%eax
    2a51:	83 f8 64             	cmp    $0x64,%eax
    2a54:	74 26                	je     2a7c <vsprintf+0x9b>
    2a56:	83 f8 64             	cmp    $0x64,%eax
    2a59:	7f 0e                	jg     2a69 <vsprintf+0x88>
    2a5b:	83 f8 63             	cmp    $0x63,%eax
    2a5e:	0f 84 f2 00 00 00    	je     2b56 <vsprintf+0x175>
    2a64:	e9 0a 01 00 00       	jmp    2b73 <vsprintf+0x192>
    2a69:	83 f8 73             	cmp    $0x73,%eax
    2a6c:	0f 84 b0 00 00 00    	je     2b22 <vsprintf+0x141>
    2a72:	83 f8 78             	cmp    $0x78,%eax
    2a75:	74 5d                	je     2ad4 <vsprintf+0xf3>
    2a77:	e9 f7 00 00 00       	jmp    2b73 <vsprintf+0x192>
    2a7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a7f:	8b 00                	mov    (%eax),%eax
    2a81:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2a84:	83 ec 04             	sub    $0x4,%esp
    2a87:	6a 0a                	push   $0xa
    2a89:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2a8f:	50                   	push   %eax
    2a90:	ff 75 e8             	pushl  -0x18(%ebp)
    2a93:	e8 20 0c 00 00       	call   36b8 <itoa>
    2a98:	83 c4 10             	add    $0x10,%esp
    2a9b:	83 ec 08             	sub    $0x8,%esp
    2a9e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2aa4:	50                   	push   %eax
    2aa5:	ff 75 f4             	pushl  -0xc(%ebp)
    2aa8:	e8 33 6a 00 00       	call   94e0 <Strcpy>
    2aad:	83 c4 10             	add    $0x10,%esp
    2ab0:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2ab4:	83 ec 0c             	sub    $0xc,%esp
    2ab7:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2abd:	50                   	push   %eax
    2abe:	e8 37 6a 00 00       	call   94fa <Strlen>
    2ac3:	83 c4 10             	add    $0x10,%esp
    2ac6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ac9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2acc:	01 45 f4             	add    %eax,-0xc(%ebp)
    2acf:	e9 9f 00 00 00       	jmp    2b73 <vsprintf+0x192>
    2ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ad7:	8b 00                	mov    (%eax),%eax
    2ad9:	83 ec 08             	sub    $0x8,%esp
    2adc:	50                   	push   %eax
    2add:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2ae3:	50                   	push   %eax
    2ae4:	e8 e2 ea ff ff       	call   15cb <atoi>
    2ae9:	83 c4 10             	add    $0x10,%esp
    2aec:	83 ec 08             	sub    $0x8,%esp
    2aef:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2af5:	50                   	push   %eax
    2af6:	ff 75 f4             	pushl  -0xc(%ebp)
    2af9:	e8 e2 69 00 00       	call   94e0 <Strcpy>
    2afe:	83 c4 10             	add    $0x10,%esp
    2b01:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2b05:	83 ec 0c             	sub    $0xc,%esp
    2b08:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2b0e:	50                   	push   %eax
    2b0f:	e8 e6 69 00 00       	call   94fa <Strlen>
    2b14:	83 c4 10             	add    $0x10,%esp
    2b17:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b1d:	01 45 f4             	add    %eax,-0xc(%ebp)
    2b20:	eb 51                	jmp    2b73 <vsprintf+0x192>
    2b22:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b25:	8b 00                	mov    (%eax),%eax
    2b27:	83 ec 08             	sub    $0x8,%esp
    2b2a:	50                   	push   %eax
    2b2b:	ff 75 f4             	pushl  -0xc(%ebp)
    2b2e:	e8 ad 69 00 00       	call   94e0 <Strcpy>
    2b33:	83 c4 10             	add    $0x10,%esp
    2b36:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b39:	8b 00                	mov    (%eax),%eax
    2b3b:	83 ec 0c             	sub    $0xc,%esp
    2b3e:	50                   	push   %eax
    2b3f:	e8 b6 69 00 00       	call   94fa <Strlen>
    2b44:	83 c4 10             	add    $0x10,%esp
    2b47:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b4a:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2b4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b51:	01 45 f4             	add    %eax,-0xc(%ebp)
    2b54:	eb 1d                	jmp    2b73 <vsprintf+0x192>
    2b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b59:	0f b6 10             	movzbl (%eax),%edx
    2b5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b5f:	88 10                	mov    %dl,(%eax)
    2b61:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2b65:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    2b6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b6f:	01 45 f4             	add    %eax,-0xc(%ebp)
    2b72:	90                   	nop
    2b73:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2b77:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b7a:	0f b6 00             	movzbl (%eax),%eax
    2b7d:	84 c0                	test   %al,%al
    2b7f:	0f 85 9f fe ff ff    	jne    2a24 <vsprintf+0x43>
    2b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b88:	2b 45 08             	sub    0x8(%ebp),%eax
    2b8b:	c9                   	leave  
    2b8c:	c3                   	ret    

00002b8d <printx>:
    2b8d:	55                   	push   %ebp
    2b8e:	89 e5                	mov    %esp,%ebp
    2b90:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2b96:	8d 45 0c             	lea    0xc(%ebp),%eax
    2b99:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b9c:	8b 45 08             	mov    0x8(%ebp),%eax
    2b9f:	83 ec 04             	sub    $0x4,%esp
    2ba2:	ff 75 f4             	pushl  -0xc(%ebp)
    2ba5:	50                   	push   %eax
    2ba6:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2bac:	50                   	push   %eax
    2bad:	e8 2f fe ff ff       	call   29e1 <vsprintf>
    2bb2:	83 c4 10             	add    $0x10,%esp
    2bb5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2bb8:	83 ec 08             	sub    $0x8,%esp
    2bbb:	ff 75 f0             	pushl  -0x10(%ebp)
    2bbe:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2bc4:	50                   	push   %eax
    2bc5:	e8 5e 19 00 00       	call   4528 <write_debug>
    2bca:	83 c4 10             	add    $0x10,%esp
    2bcd:	90                   	nop
    2bce:	c9                   	leave  
    2bcf:	c3                   	ret    

00002bd0 <sys_printx>:
    2bd0:	55                   	push   %ebp
    2bd1:	89 e5                	mov    %esp,%ebp
    2bd3:	83 ec 28             	sub    $0x28,%esp
    2bd6:	a1 3c d7 00 00       	mov    0xd73c,%eax
    2bdb:	85 c0                	test   %eax,%eax
    2bdd:	75 20                	jne    2bff <sys_printx+0x2f>
    2bdf:	8b 45 10             	mov    0x10(%ebp),%eax
    2be2:	8b 40 0c             	mov    0xc(%eax),%eax
    2be5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2be8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2beb:	83 ec 08             	sub    $0x8,%esp
    2bee:	ff 75 10             	pushl  0x10(%ebp)
    2bf1:	50                   	push   %eax
    2bf2:	e8 ea 3a 00 00       	call   66e1 <Seg2PhyAddrLDT>
    2bf7:	83 c4 10             	add    $0x10,%esp
    2bfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2bfd:	eb 19                	jmp    2c18 <sys_printx+0x48>
    2bff:	a1 3c d7 00 00       	mov    0xd73c,%eax
    2c04:	85 c0                	test   %eax,%eax
    2c06:	74 10                	je     2c18 <sys_printx+0x48>
    2c08:	83 ec 0c             	sub    $0xc,%esp
    2c0b:	6a 30                	push   $0x30
    2c0d:	e8 8e 3a 00 00       	call   66a0 <Seg2PhyAddr>
    2c12:	83 c4 10             	add    $0x10,%esp
    2c15:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c18:	8b 55 08             	mov    0x8(%ebp),%edx
    2c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c1e:	01 d0                	add    %edx,%eax
    2c20:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2c23:	8b 45 10             	mov    0x10(%ebp),%eax
    2c26:	8b 40 64             	mov    0x64(%eax),%eax
    2c29:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    2c2f:	05 80 dd 00 00       	add    $0xdd80,%eax
    2c34:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2c37:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2c3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c40:	0f b6 00             	movzbl (%eax),%eax
    2c43:	88 45 e3             	mov    %al,-0x1d(%ebp)
    2c46:	eb 3a                	jmp    2c82 <sys_printx+0xb2>
    2c48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c4b:	0f b6 00             	movzbl (%eax),%eax
    2c4e:	3c 3b                	cmp    $0x3b,%al
    2c50:	74 0a                	je     2c5c <sys_printx+0x8c>
    2c52:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c55:	0f b6 00             	movzbl (%eax),%eax
    2c58:	3c 3a                	cmp    $0x3a,%al
    2c5a:	75 06                	jne    2c62 <sys_printx+0x92>
    2c5c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2c60:	eb 20                	jmp    2c82 <sys_printx+0xb2>
    2c62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c65:	0f b6 00             	movzbl (%eax),%eax
    2c68:	0f b6 c0             	movzbl %al,%eax
    2c6b:	83 ec 08             	sub    $0x8,%esp
    2c6e:	50                   	push   %eax
    2c6f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2c72:	e8 a2 3f 00 00       	call   6c19 <out_char>
    2c77:	83 c4 10             	add    $0x10,%esp
    2c7a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2c7e:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    2c82:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2c86:	7f c0                	jg     2c48 <sys_printx+0x78>
    2c88:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
    2c8c:	75 11                	jne    2c9f <sys_printx+0xcf>
    2c8e:	a1 3c d7 00 00       	mov    0xd73c,%eax
    2c93:	85 c0                	test   %eax,%eax
    2c95:	74 15                	je     2cac <sys_printx+0xdc>
    2c97:	e8 65 e6 ff ff       	call   1301 <disable_int>
    2c9c:	f4                   	hlt    
    2c9d:	eb 0d                	jmp    2cac <sys_printx+0xdc>
    2c9f:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
    2ca3:	75 07                	jne    2cac <sys_printx+0xdc>
    2ca5:	e8 57 e6 ff ff       	call   1301 <disable_int>
    2caa:	f4                   	hlt    
    2cab:	90                   	nop
    2cac:	90                   	nop
    2cad:	c9                   	leave  
    2cae:	c3                   	ret    

00002caf <spin>:
    2caf:	55                   	push   %ebp
    2cb0:	89 e5                	mov    %esp,%ebp
    2cb2:	eb fe                	jmp    2cb2 <spin+0x3>

00002cb4 <panic>:
    2cb4:	55                   	push   %ebp
    2cb5:	89 e5                	mov    %esp,%ebp
    2cb7:	83 ec 08             	sub    $0x8,%esp
    2cba:	83 ec 04             	sub    $0x4,%esp
    2cbd:	ff 75 08             	pushl  0x8(%ebp)
    2cc0:	6a 3a                	push   $0x3a
    2cc2:	68 ff 8e 00 00       	push   $0x8eff
    2cc7:	e8 c1 fe ff ff       	call   2b8d <printx>
    2ccc:	83 c4 10             	add    $0x10,%esp
    2ccf:	90                   	nop
    2cd0:	c9                   	leave  
    2cd1:	c3                   	ret    

00002cd2 <assertion_failure>:
    2cd2:	55                   	push   %ebp
    2cd3:	89 e5                	mov    %esp,%ebp
    2cd5:	83 ec 08             	sub    $0x8,%esp
    2cd8:	83 ec 08             	sub    $0x8,%esp
    2cdb:	ff 75 14             	pushl  0x14(%ebp)
    2cde:	ff 75 10             	pushl  0x10(%ebp)
    2ce1:	ff 75 0c             	pushl  0xc(%ebp)
    2ce4:	ff 75 08             	pushl  0x8(%ebp)
    2ce7:	6a 3b                	push   $0x3b
    2ce9:	68 08 8f 00 00       	push   $0x8f08
    2cee:	e8 9a fe ff ff       	call   2b8d <printx>
    2cf3:	83 c4 20             	add    $0x20,%esp
    2cf6:	83 ec 0c             	sub    $0xc,%esp
    2cf9:	68 3b 8f 00 00       	push   $0x8f3b
    2cfe:	e8 ac ff ff ff       	call   2caf <spin>
    2d03:	83 c4 10             	add    $0x10,%esp
    2d06:	90                   	nop
    2d07:	c9                   	leave  
    2d08:	c3                   	ret    

00002d09 <dead_lock>:
    2d09:	55                   	push   %ebp
    2d0a:	89 e5                	mov    %esp,%ebp
    2d0c:	b8 00 00 00 00       	mov    $0x0,%eax
    2d11:	5d                   	pop    %ebp
    2d12:	c3                   	ret    

00002d13 <sys_send_msg>:
    2d13:	55                   	push   %ebp
    2d14:	89 e5                	mov    %esp,%ebp
    2d16:	83 ec 48             	sub    $0x48,%esp
    2d19:	83 ec 0c             	sub    $0xc,%esp
    2d1c:	ff 75 0c             	pushl  0xc(%ebp)
    2d1f:	e8 d4 38 00 00       	call   65f8 <pid2proc>
    2d24:	83 c4 10             	add    $0x10,%esp
    2d27:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2d2a:	83 ec 0c             	sub    $0xc,%esp
    2d2d:	ff 75 10             	pushl  0x10(%ebp)
    2d30:	e8 df 38 00 00       	call   6614 <proc2pid>
    2d35:	83 c4 10             	add    $0x10,%esp
    2d38:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2d3b:	8b 45 10             	mov    0x10(%ebp),%eax
    2d3e:	8b 40 0c             	mov    0xc(%eax),%eax
    2d41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2d44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d47:	83 ec 08             	sub    $0x8,%esp
    2d4a:	ff 75 10             	pushl  0x10(%ebp)
    2d4d:	50                   	push   %eax
    2d4e:	e8 8e 39 00 00       	call   66e1 <Seg2PhyAddrLDT>
    2d53:	83 c4 10             	add    $0x10,%esp
    2d56:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2d59:	8b 55 08             	mov    0x8(%ebp),%edx
    2d5c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2d5f:	01 d0                	add    %edx,%eax
    2d61:	89 45 dc             	mov    %eax,-0x24(%ebp)
    2d64:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
    2d6b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2d6e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2d71:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2d74:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2d77:	89 10                	mov    %edx,(%eax)
    2d79:	83 ec 08             	sub    $0x8,%esp
    2d7c:	ff 75 0c             	pushl  0xc(%ebp)
    2d7f:	ff 75 e8             	pushl  -0x18(%ebp)
    2d82:	e8 82 ff ff ff       	call   2d09 <dead_lock>
    2d87:	83 c4 10             	add    $0x10,%esp
    2d8a:	83 f8 01             	cmp    $0x1,%eax
    2d8d:	75 10                	jne    2d9f <sys_send_msg+0x8c>
    2d8f:	83 ec 0c             	sub    $0xc,%esp
    2d92:	68 47 8f 00 00       	push   $0x8f47
    2d97:	e8 18 ff ff ff       	call   2cb4 <panic>
    2d9c:	83 c4 10             	add    $0x10,%esp
    2d9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2da2:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2da9:	3c 02                	cmp    $0x2,%al
    2dab:	0f 85 9c 01 00 00    	jne    2f4d <sys_send_msg+0x23a>
    2db1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2db4:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2dba:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    2dbd:	74 12                	je     2dd1 <sys_send_msg+0xbe>
    2dbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2dc2:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2dc8:	83 f8 10             	cmp    $0x10,%eax
    2dcb:	0f 85 7c 01 00 00    	jne    2f4d <sys_send_msg+0x23a>
    2dd1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2dd4:	8b 40 0c             	mov    0xc(%eax),%eax
    2dd7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    2dda:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2ddd:	83 ec 08             	sub    $0x8,%esp
    2de0:	ff 75 ec             	pushl  -0x14(%ebp)
    2de3:	50                   	push   %eax
    2de4:	e8 f8 38 00 00       	call   66e1 <Seg2PhyAddrLDT>
    2de9:	83 c4 10             	add    $0x10,%esp
    2dec:	89 45 cc             	mov    %eax,-0x34(%ebp)
    2def:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2df2:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2df8:	89 c2                	mov    %eax,%edx
    2dfa:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2dfd:	01 d0                	add    %edx,%eax
    2dff:	89 45 c8             	mov    %eax,-0x38(%ebp)
    2e02:	8b 55 dc             	mov    -0x24(%ebp),%edx
    2e05:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2e08:	83 ec 04             	sub    $0x4,%esp
    2e0b:	ff 75 d8             	pushl  -0x28(%ebp)
    2e0e:	52                   	push   %edx
    2e0f:	50                   	push   %eax
    2e10:	e8 7e 66 00 00       	call   9493 <Memcpy>
    2e15:	83 c4 10             	add    $0x10,%esp
    2e18:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e1b:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    2e22:	00 00 00 
    2e25:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e28:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    2e2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e32:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    2e39:	00 00 00 
    2e3c:	83 ec 0c             	sub    $0xc,%esp
    2e3f:	ff 75 ec             	pushl  -0x14(%ebp)
    2e42:	e8 ef 07 00 00       	call   3636 <unblock>
    2e47:	83 c4 10             	add    $0x10,%esp
    2e4a:	8b 45 10             	mov    0x10(%ebp),%eax
    2e4d:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2e53:	85 c0                	test   %eax,%eax
    2e55:	74 1c                	je     2e73 <sys_send_msg+0x160>
    2e57:	68 93 04 00 00       	push   $0x493
    2e5c:	68 52 8f 00 00       	push   $0x8f52
    2e61:	68 52 8f 00 00       	push   $0x8f52
    2e66:	68 59 8f 00 00       	push   $0x8f59
    2e6b:	e8 62 fe ff ff       	call   2cd2 <assertion_failure>
    2e70:	83 c4 10             	add    $0x10,%esp
    2e73:	8b 45 10             	mov    0x10(%ebp),%eax
    2e76:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2e7d:	84 c0                	test   %al,%al
    2e7f:	74 1c                	je     2e9d <sys_send_msg+0x18a>
    2e81:	68 94 04 00 00       	push   $0x494
    2e86:	68 52 8f 00 00       	push   $0x8f52
    2e8b:	68 52 8f 00 00       	push   $0x8f52
    2e90:	68 6c 8f 00 00       	push   $0x8f6c
    2e95:	e8 38 fe ff ff       	call   2cd2 <assertion_failure>
    2e9a:	83 c4 10             	add    $0x10,%esp
    2e9d:	8b 45 10             	mov    0x10(%ebp),%eax
    2ea0:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2ea6:	83 f8 1f             	cmp    $0x1f,%eax
    2ea9:	74 1c                	je     2ec7 <sys_send_msg+0x1b4>
    2eab:	68 95 04 00 00       	push   $0x495
    2eb0:	68 52 8f 00 00       	push   $0x8f52
    2eb5:	68 52 8f 00 00       	push   $0x8f52
    2eba:	68 80 8f 00 00       	push   $0x8f80
    2ebf:	e8 0e fe ff ff       	call   2cd2 <assertion_failure>
    2ec4:	83 c4 10             	add    $0x10,%esp
    2ec7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2eca:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2ed0:	85 c0                	test   %eax,%eax
    2ed2:	74 1c                	je     2ef0 <sys_send_msg+0x1dd>
    2ed4:	68 97 04 00 00       	push   $0x497
    2ed9:	68 52 8f 00 00       	push   $0x8f52
    2ede:	68 52 8f 00 00       	push   $0x8f52
    2ee3:	68 9d 8f 00 00       	push   $0x8f9d
    2ee8:	e8 e5 fd ff ff       	call   2cd2 <assertion_failure>
    2eed:	83 c4 10             	add    $0x10,%esp
    2ef0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ef3:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2efa:	84 c0                	test   %al,%al
    2efc:	74 1c                	je     2f1a <sys_send_msg+0x207>
    2efe:	68 98 04 00 00       	push   $0x498
    2f03:	68 52 8f 00 00       	push   $0x8f52
    2f08:	68 52 8f 00 00       	push   $0x8f52
    2f0d:	68 b2 8f 00 00       	push   $0x8fb2
    2f12:	e8 bb fd ff ff       	call   2cd2 <assertion_failure>
    2f17:	83 c4 10             	add    $0x10,%esp
    2f1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f1d:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2f23:	83 f8 1f             	cmp    $0x1f,%eax
    2f26:	0f 84 45 01 00 00    	je     3071 <sys_send_msg+0x35e>
    2f2c:	68 99 04 00 00       	push   $0x499
    2f31:	68 52 8f 00 00       	push   $0x8f52
    2f36:	68 52 8f 00 00       	push   $0x8f52
    2f3b:	68 c8 8f 00 00       	push   $0x8fc8
    2f40:	e8 8d fd ff ff       	call   2cd2 <assertion_failure>
    2f45:	83 c4 10             	add    $0x10,%esp
    2f48:	e9 24 01 00 00       	jmp    3071 <sys_send_msg+0x35e>
    2f4d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f54:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f57:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    2f5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f5d:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2f63:	85 c0                	test   %eax,%eax
    2f65:	75 1b                	jne    2f82 <sys_send_msg+0x26f>
    2f67:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f6a:	8b 55 10             	mov    0x10(%ebp),%edx
    2f6d:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    2f73:	8b 45 10             	mov    0x10(%ebp),%eax
    2f76:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    2f7d:	00 00 00 
    2f80:	eb 3f                	jmp    2fc1 <sys_send_msg+0x2ae>
    2f82:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f85:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2f8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2f8e:	eb 12                	jmp    2fa2 <sys_send_msg+0x28f>
    2f90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f93:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2f96:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f99:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    2f9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2fa2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2fa6:	75 e8                	jne    2f90 <sys_send_msg+0x27d>
    2fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fab:	8b 55 10             	mov    0x10(%ebp),%edx
    2fae:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    2fb4:	8b 45 10             	mov    0x10(%ebp),%eax
    2fb7:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    2fbe:	00 00 00 
    2fc1:	8b 45 10             	mov    0x10(%ebp),%eax
    2fc4:	8b 55 08             	mov    0x8(%ebp),%edx
    2fc7:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    2fcd:	8b 45 10             	mov    0x10(%ebp),%eax
    2fd0:	8b 55 0c             	mov    0xc(%ebp),%edx
    2fd3:	89 90 84 01 00 00    	mov    %edx,0x184(%eax)
    2fd9:	8b 45 10             	mov    0x10(%ebp),%eax
    2fdc:	c6 80 7c 01 00 00 01 	movb   $0x1,0x17c(%eax)
    2fe3:	8b 45 10             	mov    0x10(%ebp),%eax
    2fe6:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2fed:	3c 01                	cmp    $0x1,%al
    2fef:	74 1c                	je     300d <sys_send_msg+0x2fa>
    2ff1:	68 ba 04 00 00       	push   $0x4ba
    2ff6:	68 52 8f 00 00       	push   $0x8f52
    2ffb:	68 52 8f 00 00       	push   $0x8f52
    3000:	68 ec 8f 00 00       	push   $0x8fec
    3005:	e8 c8 fc ff ff       	call   2cd2 <assertion_failure>
    300a:	83 c4 10             	add    $0x10,%esp
    300d:	8b 45 10             	mov    0x10(%ebp),%eax
    3010:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3016:	39 45 0c             	cmp    %eax,0xc(%ebp)
    3019:	74 1c                	je     3037 <sys_send_msg+0x324>
    301b:	68 bb 04 00 00       	push   $0x4bb
    3020:	68 52 8f 00 00       	push   $0x8f52
    3025:	68 52 8f 00 00       	push   $0x8f52
    302a:	68 08 90 00 00       	push   $0x9008
    302f:	e8 9e fc ff ff       	call   2cd2 <assertion_failure>
    3034:	83 c4 10             	add    $0x10,%esp
    3037:	8b 45 10             	mov    0x10(%ebp),%eax
    303a:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3040:	39 45 08             	cmp    %eax,0x8(%ebp)
    3043:	74 1c                	je     3061 <sys_send_msg+0x34e>
    3045:	68 bc 04 00 00       	push   $0x4bc
    304a:	68 52 8f 00 00       	push   $0x8f52
    304f:	68 52 8f 00 00       	push   $0x8f52
    3054:	68 2a 90 00 00       	push   $0x902a
    3059:	e8 74 fc ff ff       	call   2cd2 <assertion_failure>
    305e:	83 c4 10             	add    $0x10,%esp
    3061:	83 ec 0c             	sub    $0xc,%esp
    3064:	ff 75 10             	pushl  0x10(%ebp)
    3067:	e8 b8 05 00 00       	call   3624 <block>
    306c:	83 c4 10             	add    $0x10,%esp
    306f:	eb 01                	jmp    3072 <sys_send_msg+0x35f>
    3071:	90                   	nop
    3072:	b8 00 00 00 00       	mov    $0x0,%eax
    3077:	c9                   	leave  
    3078:	c3                   	ret    

00003079 <sys_receive_msg>:
    3079:	55                   	push   %ebp
    307a:	89 e5                	mov    %esp,%ebp
    307c:	81 ec b8 00 00 00    	sub    $0xb8,%esp
    3082:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3089:	83 ec 0c             	sub    $0xc,%esp
    308c:	ff 75 0c             	pushl  0xc(%ebp)
    308f:	e8 64 35 00 00       	call   65f8 <pid2proc>
    3094:	83 c4 10             	add    $0x10,%esp
    3097:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    309a:	83 ec 0c             	sub    $0xc,%esp
    309d:	ff 75 10             	pushl  0x10(%ebp)
    30a0:	e8 6f 35 00 00       	call   6614 <proc2pid>
    30a5:	83 c4 10             	add    $0x10,%esp
    30a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
    30ab:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    30b2:	8b 45 10             	mov    0x10(%ebp),%eax
    30b5:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    30bb:	85 c0                	test   %eax,%eax
    30bd:	0f 84 9a 00 00 00    	je     315d <sys_receive_msg+0xe4>
    30c3:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
    30c7:	74 0d                	je     30d6 <sys_receive_msg+0x5d>
    30c9:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
    30d0:	0f 85 87 00 00 00    	jne    315d <sys_receive_msg+0xe4>
    30d6:	83 ec 04             	sub    $0x4,%esp
    30d9:	6a 6c                	push   $0x6c
    30db:	6a 00                	push   $0x0
    30dd:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
    30e3:	50                   	push   %eax
    30e4:	e8 d8 63 00 00       	call   94c1 <Memset>
    30e9:	83 c4 10             	add    $0x10,%esp
    30ec:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
    30f3:	02 00 00 
    30f6:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
    30fd:	83 ec 08             	sub    $0x8,%esp
    3100:	ff 75 08             	pushl  0x8(%ebp)
    3103:	ff 75 e0             	pushl  -0x20(%ebp)
    3106:	e8 30 36 00 00       	call   673b <v2l>
    310b:	83 c4 10             	add    $0x10,%esp
    310e:	89 c2                	mov    %eax,%edx
    3110:	83 ec 04             	sub    $0x4,%esp
    3113:	6a 6c                	push   $0x6c
    3115:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
    311b:	50                   	push   %eax
    311c:	52                   	push   %edx
    311d:	e8 71 63 00 00       	call   9493 <Memcpy>
    3122:	83 c4 10             	add    $0x10,%esp
    3125:	8b 45 10             	mov    0x10(%ebp),%eax
    3128:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    312f:	00 00 00 
    3132:	8b 45 10             	mov    0x10(%ebp),%eax
    3135:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    313c:	00 00 00 
    313f:	8b 45 10             	mov    0x10(%ebp),%eax
    3142:	c7 80 84 01 00 00 1f 	movl   $0x1f,0x184(%eax)
    3149:	00 00 00 
    314c:	8b 45 10             	mov    0x10(%ebp),%eax
    314f:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3156:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    315d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    3161:	0f 84 cd 03 00 00    	je     3534 <sys_receive_msg+0x4bb>
    3167:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
    316b:	75 26                	jne    3193 <sys_receive_msg+0x11a>
    316d:	8b 45 10             	mov    0x10(%ebp),%eax
    3170:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3176:	85 c0                	test   %eax,%eax
    3178:	0f 84 87 00 00 00    	je     3205 <sys_receive_msg+0x18c>
    317e:	8b 45 10             	mov    0x10(%ebp),%eax
    3181:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3187:	89 45 f0             	mov    %eax,-0x10(%ebp)
    318a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    3191:	eb 72                	jmp    3205 <sys_receive_msg+0x18c>
    3193:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3197:	78 6c                	js     3205 <sys_receive_msg+0x18c>
    3199:	83 7d 0c 05          	cmpl   $0x5,0xc(%ebp)
    319d:	7f 66                	jg     3205 <sys_receive_msg+0x18c>
    319f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31a2:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    31a9:	3c 01                	cmp    $0x1,%al
    31ab:	75 58                	jne    3205 <sys_receive_msg+0x18c>
    31ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31b0:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    31b6:	83 f8 10             	cmp    $0x10,%eax
    31b9:	74 0e                	je     31c9 <sys_receive_msg+0x150>
    31bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31be:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    31c4:	39 45 e0             	cmp    %eax,-0x20(%ebp)
    31c7:	75 3c                	jne    3205 <sys_receive_msg+0x18c>
    31c9:	8b 45 10             	mov    0x10(%ebp),%eax
    31cc:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    31d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    31d5:	eb 28                	jmp    31ff <sys_receive_msg+0x186>
    31d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31da:	89 45 ec             	mov    %eax,-0x14(%ebp)
    31dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31e0:	8b 50 58             	mov    0x58(%eax),%edx
    31e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    31e6:	39 c2                	cmp    %eax,%edx
    31e8:	75 09                	jne    31f3 <sys_receive_msg+0x17a>
    31ea:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    31f1:	eb 12                	jmp    3205 <sys_receive_msg+0x18c>
    31f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31f6:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    31fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    31ff:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3203:	75 d2                	jne    31d7 <sys_receive_msg+0x15e>
    3205:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    3209:	0f 85 82 02 00 00    	jne    3491 <sys_receive_msg+0x418>
    320f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3212:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3215:	8b 45 10             	mov    0x10(%ebp),%eax
    3218:	8b 40 0c             	mov    0xc(%eax),%eax
    321b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    321e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3221:	83 ec 08             	sub    $0x8,%esp
    3224:	ff 75 10             	pushl  0x10(%ebp)
    3227:	50                   	push   %eax
    3228:	e8 b4 34 00 00       	call   66e1 <Seg2PhyAddrLDT>
    322d:	83 c4 10             	add    $0x10,%esp
    3230:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3233:	8b 55 08             	mov    0x8(%ebp),%edx
    3236:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3239:	01 d0                	add    %edx,%eax
    323b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    323e:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
    3245:	8b 45 10             	mov    0x10(%ebp),%eax
    3248:	8b 40 0c             	mov    0xc(%eax),%eax
    324b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    324e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3251:	83 ec 08             	sub    $0x8,%esp
    3254:	ff 75 dc             	pushl  -0x24(%ebp)
    3257:	50                   	push   %eax
    3258:	e8 84 34 00 00       	call   66e1 <Seg2PhyAddrLDT>
    325d:	83 c4 10             	add    $0x10,%esp
    3260:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3263:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3266:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    326c:	89 c2                	mov    %eax,%edx
    326e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3271:	01 d0                	add    %edx,%eax
    3273:	89 45 c0             	mov    %eax,-0x40(%ebp)
    3276:	83 ec 04             	sub    $0x4,%esp
    3279:	ff 75 cc             	pushl  -0x34(%ebp)
    327c:	ff 75 c0             	pushl  -0x40(%ebp)
    327f:	ff 75 d0             	pushl  -0x30(%ebp)
    3282:	e8 0c 62 00 00       	call   9493 <Memcpy>
    3287:	83 c4 10             	add    $0x10,%esp
    328a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    328d:	89 45 bc             	mov    %eax,-0x44(%ebp)
    3290:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
    3294:	75 27                	jne    32bd <sys_receive_msg+0x244>
    3296:	8b 45 08             	mov    0x8(%ebp),%eax
    3299:	8b 40 68             	mov    0x68(%eax),%eax
    329c:	83 f8 06             	cmp    $0x6,%eax
    329f:	74 1c                	je     32bd <sys_receive_msg+0x244>
    32a1:	68 49 05 00 00       	push   $0x549
    32a6:	68 52 8f 00 00       	push   $0x8f52
    32ab:	68 52 8f 00 00       	push   $0x8f52
    32b0:	68 3f 90 00 00       	push   $0x903f
    32b5:	e8 18 fa ff ff       	call   2cd2 <assertion_failure>
    32ba:	83 c4 10             	add    $0x10,%esp
    32bd:	8b 45 10             	mov    0x10(%ebp),%eax
    32c0:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    32c6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    32c9:	75 21                	jne    32ec <sys_receive_msg+0x273>
    32cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32ce:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    32d4:	8b 45 10             	mov    0x10(%ebp),%eax
    32d7:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    32dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32e0:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    32e7:	00 00 00 
    32ea:	eb 1f                	jmp    330b <sys_receive_msg+0x292>
    32ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32ef:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    32f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    32f8:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    32fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3301:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    3308:	00 00 00 
    330b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    330e:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3315:	00 00 00 
    3318:	8b 45 dc             	mov    -0x24(%ebp),%eax
    331b:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3322:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3325:	c7 80 84 01 00 00 1f 	movl   $0x1f,0x184(%eax)
    332c:	00 00 00 
    332f:	8b 45 10             	mov    0x10(%ebp),%eax
    3332:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3339:	00 00 00 
    333c:	8b 45 10             	mov    0x10(%ebp),%eax
    333f:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    3346:	00 00 00 
    3349:	8b 45 10             	mov    0x10(%ebp),%eax
    334c:	c7 80 84 01 00 00 1f 	movl   $0x1f,0x184(%eax)
    3353:	00 00 00 
    3356:	83 ec 0c             	sub    $0xc,%esp
    3359:	ff 75 dc             	pushl  -0x24(%ebp)
    335c:	e8 d5 02 00 00       	call   3636 <unblock>
    3361:	83 c4 10             	add    $0x10,%esp
    3364:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3367:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    336d:	85 c0                	test   %eax,%eax
    336f:	74 1c                	je     338d <sys_receive_msg+0x314>
    3371:	68 6a 05 00 00       	push   $0x56a
    3376:	68 52 8f 00 00       	push   $0x8f52
    337b:	68 52 8f 00 00       	push   $0x8f52
    3380:	68 51 90 00 00       	push   $0x9051
    3385:	e8 48 f9 ff ff       	call   2cd2 <assertion_failure>
    338a:	83 c4 10             	add    $0x10,%esp
    338d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3390:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3397:	84 c0                	test   %al,%al
    3399:	74 1c                	je     33b7 <sys_receive_msg+0x33e>
    339b:	68 6b 05 00 00       	push   $0x56b
    33a0:	68 52 8f 00 00       	push   $0x8f52
    33a5:	68 52 8f 00 00       	push   $0x8f52
    33aa:	68 69 90 00 00       	push   $0x9069
    33af:	e8 1e f9 ff ff       	call   2cd2 <assertion_failure>
    33b4:	83 c4 10             	add    $0x10,%esp
    33b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    33ba:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    33c0:	83 f8 1f             	cmp    $0x1f,%eax
    33c3:	74 1c                	je     33e1 <sys_receive_msg+0x368>
    33c5:	68 6c 05 00 00       	push   $0x56c
    33ca:	68 52 8f 00 00       	push   $0x8f52
    33cf:	68 52 8f 00 00       	push   $0x8f52
    33d4:	68 84 90 00 00       	push   $0x9084
    33d9:	e8 f4 f8 ff ff       	call   2cd2 <assertion_failure>
    33de:	83 c4 10             	add    $0x10,%esp
    33e1:	8b 45 10             	mov    0x10(%ebp),%eax
    33e4:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    33ea:	85 c0                	test   %eax,%eax
    33ec:	74 1c                	je     340a <sys_receive_msg+0x391>
    33ee:	68 6e 05 00 00       	push   $0x56e
    33f3:	68 52 8f 00 00       	push   $0x8f52
    33f8:	68 52 8f 00 00       	push   $0x8f52
    33fd:	68 9d 8f 00 00       	push   $0x8f9d
    3402:	e8 cb f8 ff ff       	call   2cd2 <assertion_failure>
    3407:	83 c4 10             	add    $0x10,%esp
    340a:	8b 45 10             	mov    0x10(%ebp),%eax
    340d:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3414:	84 c0                	test   %al,%al
    3416:	74 1c                	je     3434 <sys_receive_msg+0x3bb>
    3418:	68 6f 05 00 00       	push   $0x56f
    341d:	68 52 8f 00 00       	push   $0x8f52
    3422:	68 52 8f 00 00       	push   $0x8f52
    3427:	68 b2 8f 00 00       	push   $0x8fb2
    342c:	e8 a1 f8 ff ff       	call   2cd2 <assertion_failure>
    3431:	83 c4 10             	add    $0x10,%esp
    3434:	8b 45 10             	mov    0x10(%ebp),%eax
    3437:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    343d:	83 f8 1f             	cmp    $0x1f,%eax
    3440:	74 1c                	je     345e <sys_receive_msg+0x3e5>
    3442:	68 70 05 00 00       	push   $0x570
    3447:	68 52 8f 00 00       	push   $0x8f52
    344c:	68 52 8f 00 00       	push   $0x8f52
    3451:	68 c8 8f 00 00       	push   $0x8fc8
    3456:	e8 77 f8 ff ff       	call   2cd2 <assertion_failure>
    345b:	83 c4 10             	add    $0x10,%esp
    345e:	8b 45 10             	mov    0x10(%ebp),%eax
    3461:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3467:	83 f8 1f             	cmp    $0x1f,%eax
    346a:	0f 84 bd 00 00 00    	je     352d <sys_receive_msg+0x4b4>
    3470:	68 71 05 00 00       	push   $0x571
    3475:	68 52 8f 00 00       	push   $0x8f52
    347a:	68 52 8f 00 00       	push   $0x8f52
    347f:	68 a8 90 00 00       	push   $0x90a8
    3484:	e8 49 f8 ff ff       	call   2cd2 <assertion_failure>
    3489:	83 c4 10             	add    $0x10,%esp
    348c:	e9 9c 00 00 00       	jmp    352d <sys_receive_msg+0x4b4>
    3491:	8b 45 10             	mov    0x10(%ebp),%eax
    3494:	c6 80 7c 01 00 00 02 	movb   $0x2,0x17c(%eax)
    349b:	8b 45 10             	mov    0x10(%ebp),%eax
    349e:	8b 55 08             	mov    0x8(%ebp),%edx
    34a1:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    34a7:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
    34ab:	75 0f                	jne    34bc <sys_receive_msg+0x443>
    34ad:	8b 45 10             	mov    0x10(%ebp),%eax
    34b0:	c7 80 88 01 00 00 10 	movl   $0x10,0x188(%eax)
    34b7:	00 00 00 
    34ba:	eb 0c                	jmp    34c8 <sys_receive_msg+0x44f>
    34bc:	8b 45 10             	mov    0x10(%ebp),%eax
    34bf:	8b 55 0c             	mov    0xc(%ebp),%edx
    34c2:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
    34c8:	8b 0d 38 d7 00 00    	mov    0xd738,%ecx
    34ce:	ba 67 66 66 66       	mov    $0x66666667,%edx
    34d3:	89 c8                	mov    %ecx,%eax
    34d5:	f7 ea                	imul   %edx
    34d7:	c1 fa 06             	sar    $0x6,%edx
    34da:	89 c8                	mov    %ecx,%eax
    34dc:	c1 f8 1f             	sar    $0x1f,%eax
    34df:	29 c2                	sub    %eax,%edx
    34e1:	89 d0                	mov    %edx,%eax
    34e3:	8d 50 01             	lea    0x1(%eax),%edx
    34e6:	89 d0                	mov    %edx,%eax
    34e8:	c1 e0 02             	shl    $0x2,%eax
    34eb:	01 d0                	add    %edx,%eax
    34ed:	c1 e0 05             	shl    $0x5,%eax
    34f0:	a3 38 d7 00 00       	mov    %eax,0xd738
    34f5:	8b 45 10             	mov    0x10(%ebp),%eax
    34f8:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    34ff:	3c 02                	cmp    $0x2,%al
    3501:	74 1c                	je     351f <sys_receive_msg+0x4a6>
    3503:	68 a6 05 00 00       	push   $0x5a6
    3508:	68 52 8f 00 00       	push   $0x8f52
    350d:	68 52 8f 00 00       	push   $0x8f52
    3512:	68 c7 90 00 00       	push   $0x90c7
    3517:	e8 b6 f7 ff ff       	call   2cd2 <assertion_failure>
    351c:	83 c4 10             	add    $0x10,%esp
    351f:	83 ec 0c             	sub    $0xc,%esp
    3522:	ff 75 10             	pushl  0x10(%ebp)
    3525:	e8 fa 00 00 00       	call   3624 <block>
    352a:	83 c4 10             	add    $0x10,%esp
    352d:	b8 00 00 00 00       	mov    $0x0,%eax
    3532:	eb 02                	jmp    3536 <sys_receive_msg+0x4bd>
    3534:	90                   	nop
    3535:	90                   	nop
    3536:	c9                   	leave  
    3537:	c3                   	ret    

00003538 <disp_str_colour_debug>:
    3538:	55                   	push   %ebp
    3539:	89 e5                	mov    %esp,%ebp
    353b:	90                   	nop
    353c:	5d                   	pop    %ebp
    353d:	c3                   	ret    

0000353e <send_rec>:
    353e:	55                   	push   %ebp
    353f:	89 e5                	mov    %esp,%ebp
    3541:	83 ec 18             	sub    $0x18,%esp
    3544:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    3548:	74 28                	je     3572 <send_rec+0x34>
    354a:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    354e:	74 22                	je     3572 <send_rec+0x34>
    3550:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    3554:	74 1c                	je     3572 <send_rec+0x34>
    3556:	68 cf 05 00 00       	push   $0x5cf
    355b:	68 52 8f 00 00       	push   $0x8f52
    3560:	68 52 8f 00 00       	push   $0x8f52
    3565:	68 e8 90 00 00       	push   $0x90e8
    356a:	e8 63 f7 ff ff       	call   2cd2 <assertion_failure>
    356f:	83 c4 10             	add    $0x10,%esp
    3572:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    3576:	75 12                	jne    358a <send_rec+0x4c>
    3578:	83 ec 04             	sub    $0x4,%esp
    357b:	6a 6c                	push   $0x6c
    357d:	6a 00                	push   $0x0
    357f:	ff 75 0c             	pushl  0xc(%ebp)
    3582:	e8 3a 5f 00 00       	call   94c1 <Memset>
    3587:	83 c4 10             	add    $0x10,%esp
    358a:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    358e:	74 22                	je     35b2 <send_rec+0x74>
    3590:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    3594:	74 32                	je     35c8 <send_rec+0x8a>
    3596:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    359a:	75 6e                	jne    360a <send_rec+0xcc>
    359c:	83 ec 08             	sub    $0x8,%esp
    359f:	ff 75 10             	pushl  0x10(%ebp)
    35a2:	ff 75 0c             	pushl  0xc(%ebp)
    35a5:	e8 9e 0f 00 00       	call   4548 <send_msg>
    35aa:	83 c4 10             	add    $0x10,%esp
    35ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
    35b0:	eb 6b                	jmp    361d <send_rec+0xdf>
    35b2:	83 ec 08             	sub    $0x8,%esp
    35b5:	ff 75 10             	pushl  0x10(%ebp)
    35b8:	ff 75 0c             	pushl  0xc(%ebp)
    35bb:	e8 ae 0f 00 00       	call   456e <receive_msg>
    35c0:	83 c4 10             	add    $0x10,%esp
    35c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    35c6:	eb 55                	jmp    361d <send_rec+0xdf>
    35c8:	83 ec 08             	sub    $0x8,%esp
    35cb:	ff 75 10             	pushl  0x10(%ebp)
    35ce:	ff 75 0c             	pushl  0xc(%ebp)
    35d1:	e8 72 0f 00 00       	call   4548 <send_msg>
    35d6:	83 c4 10             	add    $0x10,%esp
    35d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    35dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    35e0:	75 3a                	jne    361c <send_rec+0xde>
    35e2:	83 ec 04             	sub    $0x4,%esp
    35e5:	6a 6c                	push   $0x6c
    35e7:	6a 00                	push   $0x0
    35e9:	ff 75 0c             	pushl  0xc(%ebp)
    35ec:	e8 d0 5e 00 00       	call   94c1 <Memset>
    35f1:	83 c4 10             	add    $0x10,%esp
    35f4:	83 ec 08             	sub    $0x8,%esp
    35f7:	ff 75 10             	pushl  0x10(%ebp)
    35fa:	ff 75 0c             	pushl  0xc(%ebp)
    35fd:	e8 6c 0f 00 00       	call   456e <receive_msg>
    3602:	83 c4 10             	add    $0x10,%esp
    3605:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3608:	eb 12                	jmp    361c <send_rec+0xde>
    360a:	83 ec 0c             	sub    $0xc,%esp
    360d:	68 24 91 00 00       	push   $0x9124
    3612:	e8 9d f6 ff ff       	call   2cb4 <panic>
    3617:	83 c4 10             	add    $0x10,%esp
    361a:	eb 01                	jmp    361d <send_rec+0xdf>
    361c:	90                   	nop
    361d:	b8 00 00 00 00       	mov    $0x0,%eax
    3622:	c9                   	leave  
    3623:	c3                   	ret    

00003624 <block>:
    3624:	55                   	push   %ebp
    3625:	89 e5                	mov    %esp,%ebp
    3627:	83 ec 08             	sub    $0x8,%esp
    362a:	e8 92 2e 00 00       	call   64c1 <schedule_process>
    362f:	b8 00 00 00 00       	mov    $0x0,%eax
    3634:	c9                   	leave  
    3635:	c3                   	ret    

00003636 <unblock>:
    3636:	55                   	push   %ebp
    3637:	89 e5                	mov    %esp,%ebp
    3639:	83 ec 08             	sub    $0x8,%esp
    363c:	8b 45 08             	mov    0x8(%ebp),%eax
    363f:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3646:	84 c0                	test   %al,%al
    3648:	74 1c                	je     3666 <unblock+0x30>
    364a:	68 07 06 00 00       	push   $0x607
    364f:	68 52 8f 00 00       	push   $0x8f52
    3654:	68 52 8f 00 00       	push   $0x8f52
    3659:	68 39 91 00 00       	push   $0x9139
    365e:	e8 6f f6 ff ff       	call   2cd2 <assertion_failure>
    3663:	83 c4 10             	add    $0x10,%esp
    3666:	b8 00 00 00 00       	mov    $0x0,%eax
    366b:	c9                   	leave  
    366c:	c3                   	ret    

0000366d <get_ticks_ipc>:
    366d:	55                   	push   %ebp
    366e:	89 e5                	mov    %esp,%ebp
    3670:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3676:	83 ec 04             	sub    $0x4,%esp
    3679:	6a 6c                	push   $0x6c
    367b:	6a 00                	push   $0x0
    367d:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3680:	50                   	push   %eax
    3681:	e8 3b 5e 00 00       	call   94c1 <Memset>
    3686:	83 c4 10             	add    $0x10,%esp
    3689:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
    3690:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    3697:	83 ec 04             	sub    $0x4,%esp
    369a:	6a 01                	push   $0x1
    369c:	8d 45 84             	lea    -0x7c(%ebp),%eax
    369f:	50                   	push   %eax
    36a0:	6a 03                	push   $0x3
    36a2:	e8 97 fe ff ff       	call   353e <send_rec>
    36a7:	83 c4 10             	add    $0x10,%esp
    36aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    36ad:	8b 45 8c             	mov    -0x74(%ebp),%eax
    36b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    36b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36b6:	c9                   	leave  
    36b7:	c3                   	ret    

000036b8 <itoa>:
    36b8:	55                   	push   %ebp
    36b9:	89 e5                	mov    %esp,%ebp
    36bb:	53                   	push   %ebx
    36bc:	83 ec 14             	sub    $0x14,%esp
    36bf:	8b 45 08             	mov    0x8(%ebp),%eax
    36c2:	99                   	cltd   
    36c3:	f7 7d 10             	idivl  0x10(%ebp)
    36c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    36c9:	8b 45 08             	mov    0x8(%ebp),%eax
    36cc:	99                   	cltd   
    36cd:	f7 7d 10             	idivl  0x10(%ebp)
    36d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    36d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    36d7:	74 14                	je     36ed <itoa+0x35>
    36d9:	83 ec 04             	sub    $0x4,%esp
    36dc:	ff 75 10             	pushl  0x10(%ebp)
    36df:	ff 75 0c             	pushl  0xc(%ebp)
    36e2:	ff 75 f0             	pushl  -0x10(%ebp)
    36e5:	e8 ce ff ff ff       	call   36b8 <itoa>
    36ea:	83 c4 10             	add    $0x10,%esp
    36ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36f0:	8d 58 30             	lea    0x30(%eax),%ebx
    36f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    36f6:	8b 00                	mov    (%eax),%eax
    36f8:	8d 48 01             	lea    0x1(%eax),%ecx
    36fb:	8b 55 0c             	mov    0xc(%ebp),%edx
    36fe:	89 0a                	mov    %ecx,(%edx)
    3700:	89 da                	mov    %ebx,%edx
    3702:	88 10                	mov    %dl,(%eax)
    3704:	8b 45 0c             	mov    0xc(%ebp),%eax
    3707:	8b 00                	mov    (%eax),%eax
    3709:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    370c:	c9                   	leave  
    370d:	c3                   	ret    

0000370e <i2a>:
    370e:	55                   	push   %ebp
    370f:	89 e5                	mov    %esp,%ebp
    3711:	53                   	push   %ebx
    3712:	83 ec 14             	sub    $0x14,%esp
    3715:	8b 45 08             	mov    0x8(%ebp),%eax
    3718:	99                   	cltd   
    3719:	f7 7d 0c             	idivl  0xc(%ebp)
    371c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    371f:	8b 45 08             	mov    0x8(%ebp),%eax
    3722:	99                   	cltd   
    3723:	f7 7d 0c             	idivl  0xc(%ebp)
    3726:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3729:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    372d:	74 14                	je     3743 <i2a+0x35>
    372f:	83 ec 04             	sub    $0x4,%esp
    3732:	ff 75 10             	pushl  0x10(%ebp)
    3735:	ff 75 0c             	pushl  0xc(%ebp)
    3738:	ff 75 f0             	pushl  -0x10(%ebp)
    373b:	e8 ce ff ff ff       	call   370e <i2a>
    3740:	83 c4 10             	add    $0x10,%esp
    3743:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    3747:	7f 0a                	jg     3753 <i2a+0x45>
    3749:	8b 45 f4             	mov    -0xc(%ebp),%eax
    374c:	83 c0 30             	add    $0x30,%eax
    374f:	89 c3                	mov    %eax,%ebx
    3751:	eb 08                	jmp    375b <i2a+0x4d>
    3753:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3756:	83 c0 37             	add    $0x37,%eax
    3759:	89 c3                	mov    %eax,%ebx
    375b:	8b 45 10             	mov    0x10(%ebp),%eax
    375e:	8b 00                	mov    (%eax),%eax
    3760:	8d 48 01             	lea    0x1(%eax),%ecx
    3763:	8b 55 10             	mov    0x10(%ebp),%edx
    3766:	89 0a                	mov    %ecx,(%edx)
    3768:	88 18                	mov    %bl,(%eax)
    376a:	8b 45 10             	mov    0x10(%ebp),%eax
    376d:	8b 00                	mov    (%eax),%eax
    376f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3772:	c9                   	leave  
    3773:	c3                   	ret    

00003774 <inform_int>:
    3774:	55                   	push   %ebp
    3775:	89 e5                	mov    %esp,%ebp
    3777:	83 ec 18             	sub    $0x18,%esp
    377a:	83 ec 0c             	sub    $0xc,%esp
    377d:	ff 75 08             	pushl  0x8(%ebp)
    3780:	e8 73 2e 00 00       	call   65f8 <pid2proc>
    3785:	83 c4 10             	add    $0x10,%esp
    3788:	89 45 f4             	mov    %eax,-0xc(%ebp)
    378b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    378e:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3795:	0f be c0             	movsbl %al,%eax
    3798:	83 e0 02             	and    $0x2,%eax
    379b:	85 c0                	test   %eax,%eax
    379d:	74 7e                	je     381d <inform_int+0xa9>
    379f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37a2:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    37a8:	3d 13 02 00 00       	cmp    $0x213,%eax
    37ad:	74 0e                	je     37bd <inform_int+0x49>
    37af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37b2:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    37b8:	83 f8 10             	cmp    $0x10,%eax
    37bb:	75 6d                	jne    382a <inform_int+0xb6>
    37bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37c0:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    37c6:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
    37cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37cf:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    37d5:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
    37dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37df:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    37e6:	00 00 00 
    37e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37ec:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    37f3:	00 00 00 
    37f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37f9:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3800:	00 00 00 
    3803:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3806:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    380d:	83 ec 0c             	sub    $0xc,%esp
    3810:	ff 75 f4             	pushl  -0xc(%ebp)
    3813:	e8 1e fe ff ff       	call   3636 <unblock>
    3818:	83 c4 10             	add    $0x10,%esp
    381b:	eb 0d                	jmp    382a <inform_int+0xb6>
    381d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3820:	c7 80 94 01 00 00 01 	movl   $0x1,0x194(%eax)
    3827:	00 00 00 
    382a:	90                   	nop
    382b:	c9                   	leave  
    382c:	c3                   	ret    

0000382d <strcmp>:
    382d:	55                   	push   %ebp
    382e:	89 e5                	mov    %esp,%ebp
    3830:	83 ec 10             	sub    $0x10,%esp
    3833:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3837:	74 06                	je     383f <strcmp+0x12>
    3839:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    383d:	75 08                	jne    3847 <strcmp+0x1a>
    383f:	8b 45 08             	mov    0x8(%ebp),%eax
    3842:	2b 45 0c             	sub    0xc(%ebp),%eax
    3845:	eb 53                	jmp    389a <strcmp+0x6d>
    3847:	8b 45 08             	mov    0x8(%ebp),%eax
    384a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    384d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3850:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3853:	eb 18                	jmp    386d <strcmp+0x40>
    3855:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3858:	0f b6 10             	movzbl (%eax),%edx
    385b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    385e:	0f b6 00             	movzbl (%eax),%eax
    3861:	38 c2                	cmp    %al,%dl
    3863:	75 1e                	jne    3883 <strcmp+0x56>
    3865:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3869:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    386d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3870:	0f b6 00             	movzbl (%eax),%eax
    3873:	84 c0                	test   %al,%al
    3875:	74 0d                	je     3884 <strcmp+0x57>
    3877:	8b 45 f8             	mov    -0x8(%ebp),%eax
    387a:	0f b6 00             	movzbl (%eax),%eax
    387d:	84 c0                	test   %al,%al
    387f:	75 d4                	jne    3855 <strcmp+0x28>
    3881:	eb 01                	jmp    3884 <strcmp+0x57>
    3883:	90                   	nop
    3884:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3887:	0f b6 00             	movzbl (%eax),%eax
    388a:	0f be d0             	movsbl %al,%edx
    388d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3890:	0f b6 00             	movzbl (%eax),%eax
    3893:	0f be c0             	movsbl %al,%eax
    3896:	29 c2                	sub    %eax,%edx
    3898:	89 d0                	mov    %edx,%eax
    389a:	c9                   	leave  
    389b:	c3                   	ret    

0000389c <TaskHD>:
    389c:	55                   	push   %ebp
    389d:	89 e5                	mov    %esp,%ebp
    389f:	83 ec 08             	sub    $0x8,%esp
    38a2:	e8 07 00 00 00       	call   38ae <init_hd>
    38a7:	e8 1c 00 00 00       	call   38c8 <hd_handle>
    38ac:	eb f9                	jmp    38a7 <TaskHD+0xb>

000038ae <init_hd>:
    38ae:	55                   	push   %ebp
    38af:	89 e5                	mov    %esp,%ebp
    38b1:	83 ec 18             	sub    $0x18,%esp
    38b4:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
    38bb:	e8 d9 da ff ff       	call   1399 <enable_8259A_casecade_irq>
    38c0:	e8 e8 da ff ff       	call   13ad <enable_8259A_slave_winchester_irq>
    38c5:	90                   	nop
    38c6:	c9                   	leave  
    38c7:	c3                   	ret    

000038c8 <hd_handle>:
    38c8:	55                   	push   %ebp
    38c9:	89 e5                	mov    %esp,%ebp
    38cb:	81 ec 88 00 00 00    	sub    $0x88,%esp
    38d1:	83 ec 04             	sub    $0x4,%esp
    38d4:	6a 10                	push   $0x10
    38d6:	8d 45 84             	lea    -0x7c(%ebp),%eax
    38d9:	50                   	push   %eax
    38da:	6a 02                	push   $0x2
    38dc:	e8 5d fc ff ff       	call   353e <send_rec>
    38e1:	83 c4 10             	add    $0x10,%esp
    38e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38ea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    38ee:	0f 84 96 00 00 00    	je     398a <hd_handle+0xc2>
    38f4:	8b 45 84             	mov    -0x7c(%ebp),%eax
    38f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    38fa:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    38fe:	74 23                	je     3923 <hd_handle+0x5b>
    3900:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3904:	77 08                	ja     390e <hd_handle+0x46>
    3906:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    390a:	74 10                	je     391c <hd_handle+0x54>
    390c:	eb 35                	jmp    3943 <hd_handle+0x7b>
    390e:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    3912:	74 0f                	je     3923 <hd_handle+0x5b>
    3914:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    3918:	74 1a                	je     3934 <hd_handle+0x6c>
    391a:	eb 27                	jmp    3943 <hd_handle+0x7b>
    391c:	e8 18 07 00 00       	call   4039 <hd_open>
    3921:	eb 31                	jmp    3954 <hd_handle+0x8c>
    3923:	83 ec 0c             	sub    $0xc,%esp
    3926:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3929:	50                   	push   %eax
    392a:	e8 02 08 00 00       	call   4131 <hd_rdwt>
    392f:	83 c4 10             	add    $0x10,%esp
    3932:	eb 20                	jmp    3954 <hd_handle+0x8c>
    3934:	83 ec 0c             	sub    $0xc,%esp
    3937:	6a 00                	push   $0x0
    3939:	e8 4a 07 00 00       	call   4088 <get_hd_ioctl>
    393e:	83 c4 10             	add    $0x10,%esp
    3941:	eb 11                	jmp    3954 <hd_handle+0x8c>
    3943:	83 ec 0c             	sub    $0xc,%esp
    3946:	68 51 91 00 00       	push   $0x9151
    394b:	e8 5f f3 ff ff       	call   2caf <spin>
    3950:	83 c4 10             	add    $0x10,%esp
    3953:	90                   	nop
    3954:	83 ec 04             	sub    $0x4,%esp
    3957:	6a 6c                	push   $0x6c
    3959:	6a 00                	push   $0x0
    395b:	8d 45 84             	lea    -0x7c(%ebp),%eax
    395e:	50                   	push   %eax
    395f:	e8 5d 5b 00 00       	call   94c1 <Memset>
    3964:	83 c4 10             	add    $0x10,%esp
    3967:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
    396e:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
    3975:	83 ec 04             	sub    $0x4,%esp
    3978:	6a 03                	push   $0x3
    397a:	8d 45 84             	lea    -0x7c(%ebp),%eax
    397d:	50                   	push   %eax
    397e:	6a 01                	push   $0x1
    3980:	e8 b9 fb ff ff       	call   353e <send_rec>
    3985:	83 c4 10             	add    $0x10,%esp
    3988:	eb 01                	jmp    398b <hd_handle+0xc3>
    398a:	90                   	nop
    398b:	c9                   	leave  
    398c:	c3                   	ret    

0000398d <hd_cmd_out>:
    398d:	55                   	push   %ebp
    398e:	89 e5                	mov    %esp,%ebp
    3990:	83 ec 08             	sub    $0x8,%esp
    3993:	83 ec 04             	sub    $0x4,%esp
    3996:	68 98 3a 00 00       	push   $0x3a98
    399b:	6a 00                	push   $0x0
    399d:	68 80 00 00 00       	push   $0x80
    39a2:	e8 e8 09 00 00       	call   438f <waitfor>
    39a7:	83 c4 10             	add    $0x10,%esp
    39aa:	85 c0                	test   %eax,%eax
    39ac:	75 10                	jne    39be <hd_cmd_out+0x31>
    39ae:	83 ec 0c             	sub    $0xc,%esp
    39b1:	68 63 91 00 00       	push   $0x9163
    39b6:	e8 f9 f2 ff ff       	call   2cb4 <panic>
    39bb:	83 c4 10             	add    $0x10,%esp
    39be:	83 ec 08             	sub    $0x8,%esp
    39c1:	6a 00                	push   $0x0
    39c3:	68 f6 03 00 00       	push   $0x3f6
    39c8:	e8 12 d9 ff ff       	call   12df <out_byte>
    39cd:	83 c4 10             	add    $0x10,%esp
    39d0:	8b 45 08             	mov    0x8(%ebp),%eax
    39d3:	0f b6 00             	movzbl (%eax),%eax
    39d6:	0f b6 c0             	movzbl %al,%eax
    39d9:	83 ec 08             	sub    $0x8,%esp
    39dc:	50                   	push   %eax
    39dd:	68 f1 01 00 00       	push   $0x1f1
    39e2:	e8 f8 d8 ff ff       	call   12df <out_byte>
    39e7:	83 c4 10             	add    $0x10,%esp
    39ea:	8b 45 08             	mov    0x8(%ebp),%eax
    39ed:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    39f1:	0f b6 c0             	movzbl %al,%eax
    39f4:	83 ec 08             	sub    $0x8,%esp
    39f7:	50                   	push   %eax
    39f8:	68 f2 01 00 00       	push   $0x1f2
    39fd:	e8 dd d8 ff ff       	call   12df <out_byte>
    3a02:	83 c4 10             	add    $0x10,%esp
    3a05:	8b 45 08             	mov    0x8(%ebp),%eax
    3a08:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3a0c:	0f b6 c0             	movzbl %al,%eax
    3a0f:	83 ec 08             	sub    $0x8,%esp
    3a12:	50                   	push   %eax
    3a13:	68 f3 01 00 00       	push   $0x1f3
    3a18:	e8 c2 d8 ff ff       	call   12df <out_byte>
    3a1d:	83 c4 10             	add    $0x10,%esp
    3a20:	8b 45 08             	mov    0x8(%ebp),%eax
    3a23:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    3a27:	0f b6 c0             	movzbl %al,%eax
    3a2a:	83 ec 08             	sub    $0x8,%esp
    3a2d:	50                   	push   %eax
    3a2e:	68 f4 01 00 00       	push   $0x1f4
    3a33:	e8 a7 d8 ff ff       	call   12df <out_byte>
    3a38:	83 c4 10             	add    $0x10,%esp
    3a3b:	8b 45 08             	mov    0x8(%ebp),%eax
    3a3e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3a42:	0f b6 c0             	movzbl %al,%eax
    3a45:	83 ec 08             	sub    $0x8,%esp
    3a48:	50                   	push   %eax
    3a49:	68 f5 01 00 00       	push   $0x1f5
    3a4e:	e8 8c d8 ff ff       	call   12df <out_byte>
    3a53:	83 c4 10             	add    $0x10,%esp
    3a56:	8b 45 08             	mov    0x8(%ebp),%eax
    3a59:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    3a5d:	0f b6 c0             	movzbl %al,%eax
    3a60:	83 ec 08             	sub    $0x8,%esp
    3a63:	50                   	push   %eax
    3a64:	68 f6 01 00 00       	push   $0x1f6
    3a69:	e8 71 d8 ff ff       	call   12df <out_byte>
    3a6e:	83 c4 10             	add    $0x10,%esp
    3a71:	8b 45 08             	mov    0x8(%ebp),%eax
    3a74:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    3a78:	0f b6 c0             	movzbl %al,%eax
    3a7b:	83 ec 08             	sub    $0x8,%esp
    3a7e:	50                   	push   %eax
    3a7f:	68 f7 01 00 00       	push   $0x1f7
    3a84:	e8 56 d8 ff ff       	call   12df <out_byte>
    3a89:	83 c4 10             	add    $0x10,%esp
    3a8c:	90                   	nop
    3a8d:	c9                   	leave  
    3a8e:	c3                   	ret    

00003a8f <hd_identify>:
    3a8f:	55                   	push   %ebp
    3a90:	89 e5                	mov    %esp,%ebp
    3a92:	53                   	push   %ebx
    3a93:	83 ec 24             	sub    $0x24,%esp
    3a96:	89 e0                	mov    %esp,%eax
    3a98:	89 c3                	mov    %eax,%ebx
    3a9a:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    3a9e:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
    3aa2:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    3aa6:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    3aaa:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    3aae:	8b 45 08             	mov    0x8(%ebp),%eax
    3ab1:	c1 e0 04             	shl    $0x4,%eax
    3ab4:	83 c8 e0             	or     $0xffffffe0,%eax
    3ab7:	88 45 ea             	mov    %al,-0x16(%ebp)
    3aba:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
    3abe:	83 ec 0c             	sub    $0xc,%esp
    3ac1:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3ac4:	50                   	push   %eax
    3ac5:	e8 c3 fe ff ff       	call   398d <hd_cmd_out>
    3aca:	83 c4 10             	add    $0x10,%esp
    3acd:	e8 40 06 00 00       	call   4112 <interrupt_wait>
    3ad2:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
    3ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3adc:	8d 50 ff             	lea    -0x1(%eax),%edx
    3adf:	89 55 f0             	mov    %edx,-0x10(%ebp)
    3ae2:	89 c2                	mov    %eax,%edx
    3ae4:	b8 10 00 00 00       	mov    $0x10,%eax
    3ae9:	83 e8 01             	sub    $0x1,%eax
    3aec:	01 d0                	add    %edx,%eax
    3aee:	b9 10 00 00 00       	mov    $0x10,%ecx
    3af3:	ba 00 00 00 00       	mov    $0x0,%edx
    3af8:	f7 f1                	div    %ecx
    3afa:	6b c0 10             	imul   $0x10,%eax,%eax
    3afd:	29 c4                	sub    %eax,%esp
    3aff:	89 e0                	mov    %esp,%eax
    3b01:	83 c0 00             	add    $0x0,%eax
    3b04:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3b07:	83 ec 04             	sub    $0x4,%esp
    3b0a:	ff 75 f4             	pushl  -0xc(%ebp)
    3b0d:	6a 00                	push   $0x0
    3b0f:	ff 75 ec             	pushl  -0x14(%ebp)
    3b12:	e8 aa 59 00 00       	call   94c1 <Memset>
    3b17:	83 c4 10             	add    $0x10,%esp
    3b1a:	83 ec 04             	sub    $0x4,%esp
    3b1d:	ff 75 f4             	pushl  -0xc(%ebp)
    3b20:	ff 75 ec             	pushl  -0x14(%ebp)
    3b23:	68 f0 01 00 00       	push   $0x1f0
    3b28:	e8 e8 59 00 00       	call   9515 <read_port>
    3b2d:	83 c4 10             	add    $0x10,%esp
    3b30:	83 ec 0c             	sub    $0xc,%esp
    3b33:	ff 75 ec             	pushl  -0x14(%ebp)
    3b36:	e8 0b 00 00 00       	call   3b46 <print_hdinfo>
    3b3b:	83 c4 10             	add    $0x10,%esp
    3b3e:	89 dc                	mov    %ebx,%esp
    3b40:	90                   	nop
    3b41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b44:	c9                   	leave  
    3b45:	c3                   	ret    

00003b46 <print_hdinfo>:
    3b46:	55                   	push   %ebp
    3b47:	89 e5                	mov    %esp,%ebp
    3b49:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3b4f:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
    3b55:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
    3b5b:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
    3b62:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
    3b69:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
    3b70:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
    3b77:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    3b7e:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
    3b84:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
    3b8a:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
    3b91:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
    3b98:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
    3b9f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    3ba6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    3bad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3bb4:	e9 8f 00 00 00       	jmp    3c48 <print_hdinfo+0x102>
    3bb9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3bc0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3bc3:	89 d0                	mov    %edx,%eax
    3bc5:	01 c0                	add    %eax,%eax
    3bc7:	01 d0                	add    %edx,%eax
    3bc9:	c1 e0 03             	shl    $0x3,%eax
    3bcc:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3bcf:	01 c8                	add    %ecx,%eax
    3bd1:	83 e8 44             	sub    $0x44,%eax
    3bd4:	0f b7 00             	movzwl (%eax),%eax
    3bd7:	0f b7 c0             	movzwl %ax,%eax
    3bda:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3bdd:	8b 45 08             	mov    0x8(%ebp),%eax
    3be0:	01 d0                	add    %edx,%eax
    3be2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3be5:	eb 30                	jmp    3c17 <print_hdinfo+0xd1>
    3be7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3bea:	8d 50 01             	lea    0x1(%eax),%edx
    3bed:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3bf0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3bf3:	83 c2 01             	add    $0x1,%edx
    3bf6:	0f b6 00             	movzbl (%eax),%eax
    3bf9:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
    3bfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c00:	8d 50 01             	lea    0x1(%eax),%edx
    3c03:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3c06:	0f b6 00             	movzbl (%eax),%eax
    3c09:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
    3c0c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3c0f:	01 ca                	add    %ecx,%edx
    3c11:	88 02                	mov    %al,(%edx)
    3c13:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3c17:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3c1a:	89 d0                	mov    %edx,%eax
    3c1c:	01 c0                	add    %eax,%eax
    3c1e:	01 d0                	add    %edx,%eax
    3c20:	c1 e0 03             	shl    $0x3,%eax
    3c23:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3c26:	01 c8                	add    %ecx,%eax
    3c28:	83 e8 42             	sub    $0x42,%eax
    3c2b:	0f b7 00             	movzwl (%eax),%eax
    3c2e:	66 d1 e8             	shr    %ax
    3c31:	0f b7 c0             	movzwl %ax,%eax
    3c34:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    3c37:	7c ae                	jl     3be7 <print_hdinfo+0xa1>
    3c39:	8d 55 81             	lea    -0x7f(%ebp),%edx
    3c3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c3f:	01 d0                	add    %edx,%eax
    3c41:	c6 00 00             	movb   $0x0,(%eax)
    3c44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3c48:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    3c4c:	0f 8e 67 ff ff ff    	jle    3bb9 <print_hdinfo+0x73>
    3c52:	8b 45 08             	mov    0x8(%ebp),%eax
    3c55:	0f b7 40 62          	movzwl 0x62(%eax),%eax
    3c59:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    3c5d:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    3c61:	66 c1 e8 08          	shr    $0x8,%ax
    3c65:	66 85 c0             	test   %ax,%ax
    3c68:	0f 95 c0             	setne  %al
    3c6b:	88 45 e9             	mov    %al,-0x17(%ebp)
    3c6e:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
    3c75:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
    3c7b:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
    3c7f:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
    3c83:	75 15                	jne    3c9a <print_hdinfo+0x154>
    3c85:	83 ec 08             	sub    $0x8,%esp
    3c88:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3c8b:	50                   	push   %eax
    3c8c:	8d 45 b0             	lea    -0x50(%ebp),%eax
    3c8f:	50                   	push   %eax
    3c90:	e8 4b 58 00 00       	call   94e0 <Strcpy>
    3c95:	83 c4 10             	add    $0x10,%esp
    3c98:	eb 13                	jmp    3cad <print_hdinfo+0x167>
    3c9a:	83 ec 08             	sub    $0x8,%esp
    3c9d:	8d 45 a9             	lea    -0x57(%ebp),%eax
    3ca0:	50                   	push   %eax
    3ca1:	8d 45 b0             	lea    -0x50(%ebp),%eax
    3ca4:	50                   	push   %eax
    3ca5:	e8 36 58 00 00       	call   94e0 <Strcpy>
    3caa:	83 c4 10             	add    $0x10,%esp
    3cad:	8b 45 08             	mov    0x8(%ebp),%eax
    3cb0:	83 c0 7a             	add    $0x7a,%eax
    3cb3:	0f b7 00             	movzwl (%eax),%eax
    3cb6:	0f b7 d0             	movzwl %ax,%edx
    3cb9:	8b 45 08             	mov    0x8(%ebp),%eax
    3cbc:	83 c0 78             	add    $0x78,%eax
    3cbf:	0f b7 00             	movzwl (%eax),%eax
    3cc2:	0f b7 c0             	movzwl %ax,%eax
    3cc5:	83 c0 10             	add    $0x10,%eax
    3cc8:	89 c1                	mov    %eax,%ecx
    3cca:	d3 e2                	shl    %cl,%edx
    3ccc:	89 d0                	mov    %edx,%eax
    3cce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3cd1:	90                   	nop
    3cd2:	c9                   	leave  
    3cd3:	c3                   	ret    

00003cd4 <print_dpt_entry>:
    3cd4:	55                   	push   %ebp
    3cd5:	89 e5                	mov    %esp,%ebp
    3cd7:	83 ec 08             	sub    $0x8,%esp
    3cda:	8b 45 08             	mov    0x8(%ebp),%eax
    3cdd:	8b 40 08             	mov    0x8(%eax),%eax
    3ce0:	83 ec 08             	sub    $0x8,%esp
    3ce3:	50                   	push   %eax
    3ce4:	68 6d 91 00 00       	push   $0x916d
    3ce9:	e8 95 ec ff ff       	call   2983 <Printf>
    3cee:	83 c4 10             	add    $0x10,%esp
    3cf1:	8b 45 08             	mov    0x8(%ebp),%eax
    3cf4:	8b 40 0c             	mov    0xc(%eax),%eax
    3cf7:	83 ec 08             	sub    $0x8,%esp
    3cfa:	50                   	push   %eax
    3cfb:	68 75 91 00 00       	push   $0x9175
    3d00:	e8 7e ec ff ff       	call   2983 <Printf>
    3d05:	83 c4 10             	add    $0x10,%esp
    3d08:	8b 45 08             	mov    0x8(%ebp),%eax
    3d0b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3d0f:	0f b6 c0             	movzbl %al,%eax
    3d12:	83 ec 08             	sub    $0x8,%esp
    3d15:	50                   	push   %eax
    3d16:	68 86 91 00 00       	push   $0x9186
    3d1b:	e8 63 ec ff ff       	call   2983 <Printf>
    3d20:	83 c4 10             	add    $0x10,%esp
    3d23:	8b 45 08             	mov    0x8(%ebp),%eax
    3d26:	0f b6 00             	movzbl (%eax),%eax
    3d29:	0f b6 c0             	movzbl %al,%eax
    3d2c:	83 ec 08             	sub    $0x8,%esp
    3d2f:	50                   	push   %eax
    3d30:	68 94 91 00 00       	push   $0x9194
    3d35:	e8 49 ec ff ff       	call   2983 <Printf>
    3d3a:	83 c4 10             	add    $0x10,%esp
    3d3d:	90                   	nop
    3d3e:	c9                   	leave  
    3d3f:	c3                   	ret    

00003d40 <get_partition_table>:
    3d40:	55                   	push   %ebp
    3d41:	89 e5                	mov    %esp,%ebp
    3d43:	53                   	push   %ebx
    3d44:	83 ec 24             	sub    $0x24,%esp
    3d47:	89 e0                	mov    %esp,%eax
    3d49:	89 c3                	mov    %eax,%ebx
    3d4b:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    3d4f:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
    3d53:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d56:	88 45 e3             	mov    %al,-0x1d(%ebp)
    3d59:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d5c:	c1 f8 08             	sar    $0x8,%eax
    3d5f:	88 45 e4             	mov    %al,-0x1c(%ebp)
    3d62:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d65:	c1 f8 10             	sar    $0x10,%eax
    3d68:	88 45 e5             	mov    %al,-0x1b(%ebp)
    3d6b:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d6e:	c1 f8 18             	sar    $0x18,%eax
    3d71:	89 c2                	mov    %eax,%edx
    3d73:	8b 45 08             	mov    0x8(%ebp),%eax
    3d76:	c1 e0 04             	shl    $0x4,%eax
    3d79:	09 d0                	or     %edx,%eax
    3d7b:	83 c8 e0             	or     $0xffffffe0,%eax
    3d7e:	88 45 e6             	mov    %al,-0x1a(%ebp)
    3d81:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
    3d85:	83 ec 0c             	sub    $0xc,%esp
    3d88:	8d 45 e1             	lea    -0x1f(%ebp),%eax
    3d8b:	50                   	push   %eax
    3d8c:	e8 fc fb ff ff       	call   398d <hd_cmd_out>
    3d91:	83 c4 10             	add    $0x10,%esp
    3d94:	e8 79 03 00 00       	call   4112 <interrupt_wait>
    3d99:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
    3da0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3da3:	8d 50 ff             	lea    -0x1(%eax),%edx
    3da6:	89 55 f0             	mov    %edx,-0x10(%ebp)
    3da9:	89 c2                	mov    %eax,%edx
    3dab:	b8 10 00 00 00       	mov    $0x10,%eax
    3db0:	83 e8 01             	sub    $0x1,%eax
    3db3:	01 d0                	add    %edx,%eax
    3db5:	b9 10 00 00 00       	mov    $0x10,%ecx
    3dba:	ba 00 00 00 00       	mov    $0x0,%edx
    3dbf:	f7 f1                	div    %ecx
    3dc1:	6b c0 10             	imul   $0x10,%eax,%eax
    3dc4:	29 c4                	sub    %eax,%esp
    3dc6:	89 e0                	mov    %esp,%eax
    3dc8:	83 c0 00             	add    $0x0,%eax
    3dcb:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3dce:	83 ec 04             	sub    $0x4,%esp
    3dd1:	ff 75 f4             	pushl  -0xc(%ebp)
    3dd4:	6a 00                	push   $0x0
    3dd6:	ff 75 ec             	pushl  -0x14(%ebp)
    3dd9:	e8 e3 56 00 00       	call   94c1 <Memset>
    3dde:	83 c4 10             	add    $0x10,%esp
    3de1:	83 ec 04             	sub    $0x4,%esp
    3de4:	ff 75 f4             	pushl  -0xc(%ebp)
    3de7:	ff 75 ec             	pushl  -0x14(%ebp)
    3dea:	68 f0 01 00 00       	push   $0x1f0
    3def:	e8 21 57 00 00       	call   9515 <read_port>
    3df4:	83 c4 10             	add    $0x10,%esp
    3df7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3dfa:	05 be 01 00 00       	add    $0x1be,%eax
    3dff:	83 ec 04             	sub    $0x4,%esp
    3e02:	6a 40                	push   $0x40
    3e04:	50                   	push   %eax
    3e05:	ff 75 10             	pushl  0x10(%ebp)
    3e08:	e8 86 56 00 00       	call   9493 <Memcpy>
    3e0d:	83 c4 10             	add    $0x10,%esp
    3e10:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
    3e17:	89 dc                	mov    %ebx,%esp
    3e19:	90                   	nop
    3e1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3e1d:	c9                   	leave  
    3e1e:	c3                   	ret    

00003e1f <partition>:
    3e1f:	55                   	push   %ebp
    3e20:	89 e5                	mov    %esp,%ebp
    3e22:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3e28:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e2b:	88 45 84             	mov    %al,-0x7c(%ebp)
    3e2e:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    3e32:	7f 19                	jg     3e4d <partition+0x2e>
    3e34:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3e37:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3e3c:	89 c8                	mov    %ecx,%eax
    3e3e:	f7 ea                	imul   %edx
    3e40:	d1 fa                	sar    %edx
    3e42:	89 c8                	mov    %ecx,%eax
    3e44:	c1 f8 1f             	sar    $0x1f,%eax
    3e47:	29 c2                	sub    %eax,%edx
    3e49:	89 d0                	mov    %edx,%eax
    3e4b:	eb 11                	jmp    3e5e <partition+0x3f>
    3e4d:	8b 45 08             	mov    0x8(%ebp),%eax
    3e50:	83 e8 10             	sub    $0x10,%eax
    3e53:	8d 50 3f             	lea    0x3f(%eax),%edx
    3e56:	85 c0                	test   %eax,%eax
    3e58:	0f 48 c2             	cmovs  %edx,%eax
    3e5b:	c1 f8 06             	sar    $0x6,%eax
    3e5e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3e61:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
    3e65:	0f 85 cc 00 00 00    	jne    3f37 <partition+0x118>
    3e6b:	83 ec 04             	sub    $0x4,%esp
    3e6e:	6a 40                	push   $0x40
    3e70:	6a 00                	push   $0x0
    3e72:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3e75:	50                   	push   %eax
    3e76:	e8 46 56 00 00       	call   94c1 <Memset>
    3e7b:	83 c4 10             	add    $0x10,%esp
    3e7e:	83 ec 04             	sub    $0x4,%esp
    3e81:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3e84:	50                   	push   %eax
    3e85:	6a 00                	push   $0x0
    3e87:	ff 75 e8             	pushl  -0x18(%ebp)
    3e8a:	e8 b1 fe ff ff       	call   3d40 <get_partition_table>
    3e8f:	83 c4 10             	add    $0x10,%esp
    3e92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e99:	e9 8a 00 00 00       	jmp    3f28 <partition+0x109>
    3e9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ea1:	83 c0 01             	add    $0x1,%eax
    3ea4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3ea7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3eaa:	c1 e0 04             	shl    $0x4,%eax
    3ead:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3eb0:	01 c8                	add    %ecx,%eax
    3eb2:	83 e8 5c             	sub    $0x5c,%eax
    3eb5:	8b 00                	mov    (%eax),%eax
    3eb7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3eba:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3ebd:	c1 e1 03             	shl    $0x3,%ecx
    3ec0:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    3ec6:	01 ca                	add    %ecx,%edx
    3ec8:	81 c2 04 ff 00 00    	add    $0xff04,%edx
    3ece:	89 02                	mov    %eax,(%edx)
    3ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ed3:	c1 e0 04             	shl    $0x4,%eax
    3ed6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3ed9:	01 c8                	add    %ecx,%eax
    3edb:	83 e8 58             	sub    $0x58,%eax
    3ede:	8b 00                	mov    (%eax),%eax
    3ee0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3ee3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3ee6:	c1 e1 03             	shl    $0x3,%ecx
    3ee9:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    3eef:	01 ca                	add    %ecx,%edx
    3ef1:	81 c2 08 ff 00 00    	add    $0xff08,%edx
    3ef7:	89 02                	mov    %eax,(%edx)
    3ef9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3efc:	c1 e0 04             	shl    $0x4,%eax
    3eff:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3f02:	01 c8                	add    %ecx,%eax
    3f04:	83 e8 60             	sub    $0x60,%eax
    3f07:	0f b6 00             	movzbl (%eax),%eax
    3f0a:	3c 05                	cmp    $0x5,%al
    3f0c:	75 16                	jne    3f24 <partition+0x105>
    3f0e:	8b 55 08             	mov    0x8(%ebp),%edx
    3f11:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f14:	01 d0                	add    %edx,%eax
    3f16:	83 ec 08             	sub    $0x8,%esp
    3f19:	6a 01                	push   $0x1
    3f1b:	50                   	push   %eax
    3f1c:	e8 fe fe ff ff       	call   3e1f <partition>
    3f21:	83 c4 10             	add    $0x10,%esp
    3f24:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3f28:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    3f2c:	0f 8e 6c ff ff ff    	jle    3e9e <partition+0x7f>
    3f32:	e9 ff 00 00 00       	jmp    4036 <partition+0x217>
    3f37:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
    3f3b:	0f 85 f5 00 00 00    	jne    4036 <partition+0x217>
    3f41:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3f44:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3f49:	89 c8                	mov    %ecx,%eax
    3f4b:	f7 ea                	imul   %edx
    3f4d:	d1 fa                	sar    %edx
    3f4f:	89 c8                	mov    %ecx,%eax
    3f51:	c1 f8 1f             	sar    $0x1f,%eax
    3f54:	29 c2                	sub    %eax,%edx
    3f56:	89 d0                	mov    %edx,%eax
    3f58:	c1 e0 02             	shl    $0x2,%eax
    3f5b:	01 d0                	add    %edx,%eax
    3f5d:	29 c1                	sub    %eax,%ecx
    3f5f:	89 c8                	mov    %ecx,%eax
    3f61:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3f64:	8b 55 e0             	mov    -0x20(%ebp),%edx
    3f67:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f6a:	c1 e2 03             	shl    $0x3,%edx
    3f6d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3f73:	01 d0                	add    %edx,%eax
    3f75:	05 04 ff 00 00       	add    $0xff04,%eax
    3f7a:	8b 00                	mov    (%eax),%eax
    3f7c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3f7f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3f82:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3f85:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3f88:	83 e8 01             	sub    $0x1,%eax
    3f8b:	c1 e0 04             	shl    $0x4,%eax
    3f8e:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3f91:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    3f98:	e9 8c 00 00 00       	jmp    4029 <partition+0x20a>
    3f9d:	83 ec 04             	sub    $0x4,%esp
    3fa0:	6a 40                	push   $0x40
    3fa2:	6a 00                	push   $0x0
    3fa4:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3fa7:	50                   	push   %eax
    3fa8:	e8 14 55 00 00       	call   94c1 <Memset>
    3fad:	83 c4 10             	add    $0x10,%esp
    3fb0:	83 ec 04             	sub    $0x4,%esp
    3fb3:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3fb6:	50                   	push   %eax
    3fb7:	ff 75 f0             	pushl  -0x10(%ebp)
    3fba:	ff 75 e8             	pushl  -0x18(%ebp)
    3fbd:	e8 7e fd ff ff       	call   3d40 <get_partition_table>
    3fc2:	83 c4 10             	add    $0x10,%esp
    3fc5:	8b 55 d8             	mov    -0x28(%ebp),%edx
    3fc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3fcb:	01 d0                	add    %edx,%eax
    3fcd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3fd0:	8b 55 9c             	mov    -0x64(%ebp),%edx
    3fd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3fd6:	01 c2                	add    %eax,%edx
    3fd8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3fdb:	8d 48 04             	lea    0x4(%eax),%ecx
    3fde:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3fe1:	c1 e1 03             	shl    $0x3,%ecx
    3fe4:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3fea:	01 c8                	add    %ecx,%eax
    3fec:	05 04 ff 00 00       	add    $0xff04,%eax
    3ff1:	89 10                	mov    %edx,(%eax)
    3ff3:	8b 45 a0             	mov    -0x60(%ebp),%eax
    3ff6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3ff9:	8d 4a 04             	lea    0x4(%edx),%ecx
    3ffc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3fff:	c1 e1 03             	shl    $0x3,%ecx
    4002:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    4008:	01 ca                	add    %ecx,%edx
    400a:	81 c2 08 ff 00 00    	add    $0xff08,%edx
    4010:	89 02                	mov    %eax,(%edx)
    4012:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
    4016:	84 c0                	test   %al,%al
    4018:	74 1b                	je     4035 <partition+0x216>
    401a:	8b 55 ac             	mov    -0x54(%ebp),%edx
    401d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4020:	01 d0                	add    %edx,%eax
    4022:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4025:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4029:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
    402d:	0f 8e 6a ff ff ff    	jle    3f9d <partition+0x17e>
    4033:	eb 01                	jmp    4036 <partition+0x217>
    4035:	90                   	nop
    4036:	90                   	nop
    4037:	c9                   	leave  
    4038:	c3                   	ret    

00004039 <hd_open>:
    4039:	55                   	push   %ebp
    403a:	89 e5                	mov    %esp,%ebp
    403c:	83 ec 18             	sub    $0x18,%esp
    403f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4046:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4049:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    404f:	05 00 ff 00 00       	add    $0xff00,%eax
    4054:	8b 00                	mov    (%eax),%eax
    4056:	8d 50 01             	lea    0x1(%eax),%edx
    4059:	8b 45 f4             	mov    -0xc(%ebp),%eax
    405c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    4062:	05 00 ff 00 00       	add    $0xff00,%eax
    4067:	89 10                	mov    %edx,(%eax)
    4069:	83 ec 0c             	sub    $0xc,%esp
    406c:	6a 00                	push   $0x0
    406e:	e8 1c fa ff ff       	call   3a8f <hd_identify>
    4073:	83 c4 10             	add    $0x10,%esp
    4076:	83 ec 08             	sub    $0x8,%esp
    4079:	6a 00                	push   $0x0
    407b:	6a 00                	push   $0x0
    407d:	e8 9d fd ff ff       	call   3e1f <partition>
    4082:	83 c4 10             	add    $0x10,%esp
    4085:	90                   	nop
    4086:	c9                   	leave  
    4087:	c3                   	ret    

00004088 <get_hd_ioctl>:
    4088:	55                   	push   %ebp
    4089:	89 e5                	mov    %esp,%ebp
    408b:	83 ec 10             	sub    $0x10,%esp
    408e:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    4092:	7f 19                	jg     40ad <get_hd_ioctl+0x25>
    4094:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4097:	ba 67 66 66 66       	mov    $0x66666667,%edx
    409c:	89 c8                	mov    %ecx,%eax
    409e:	f7 ea                	imul   %edx
    40a0:	d1 fa                	sar    %edx
    40a2:	89 c8                	mov    %ecx,%eax
    40a4:	c1 f8 1f             	sar    $0x1f,%eax
    40a7:	29 c2                	sub    %eax,%edx
    40a9:	89 d0                	mov    %edx,%eax
    40ab:	eb 11                	jmp    40be <get_hd_ioctl+0x36>
    40ad:	8b 45 08             	mov    0x8(%ebp),%eax
    40b0:	83 e8 10             	sub    $0x10,%eax
    40b3:	8d 50 3f             	lea    0x3f(%eax),%edx
    40b6:	85 c0                	test   %eax,%eax
    40b8:	0f 48 c2             	cmovs  %edx,%eax
    40bb:	c1 f8 06             	sar    $0x6,%eax
    40be:	89 45 fc             	mov    %eax,-0x4(%ebp)
    40c1:	8b 55 08             	mov    0x8(%ebp),%edx
    40c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40c7:	c1 e2 03             	shl    $0x3,%edx
    40ca:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    40d0:	01 d0                	add    %edx,%eax
    40d2:	05 08 ff 00 00       	add    $0xff08,%eax
    40d7:	8b 00                	mov    (%eax),%eax
    40d9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    40dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40df:	c9                   	leave  
    40e0:	c3                   	ret    

000040e1 <wait_for>:
    40e1:	55                   	push   %ebp
    40e2:	89 e5                	mov    %esp,%ebp
    40e4:	83 ec 08             	sub    $0x8,%esp
    40e7:	83 ec 04             	sub    $0x4,%esp
    40ea:	68 40 42 0f 00       	push   $0xf4240
    40ef:	6a 08                	push   $0x8
    40f1:	6a 08                	push   $0x8
    40f3:	e8 97 02 00 00       	call   438f <waitfor>
    40f8:	83 c4 10             	add    $0x10,%esp
    40fb:	85 c0                	test   %eax,%eax
    40fd:	75 10                	jne    410f <wait_for+0x2e>
    40ff:	83 ec 0c             	sub    $0xc,%esp
    4102:	68 9f 91 00 00       	push   $0x919f
    4107:	e8 a8 eb ff ff       	call   2cb4 <panic>
    410c:	83 c4 10             	add    $0x10,%esp
    410f:	90                   	nop
    4110:	c9                   	leave  
    4111:	c3                   	ret    

00004112 <interrupt_wait>:
    4112:	55                   	push   %ebp
    4113:	89 e5                	mov    %esp,%ebp
    4115:	83 ec 78             	sub    $0x78,%esp
    4118:	83 ec 04             	sub    $0x4,%esp
    411b:	68 13 02 00 00       	push   $0x213
    4120:	8d 45 8c             	lea    -0x74(%ebp),%eax
    4123:	50                   	push   %eax
    4124:	6a 02                	push   $0x2
    4126:	e8 13 f4 ff ff       	call   353e <send_rec>
    412b:	83 c4 10             	add    $0x10,%esp
    412e:	90                   	nop
    412f:	c9                   	leave  
    4130:	c3                   	ret    

00004131 <hd_rdwt>:
    4131:	55                   	push   %ebp
    4132:	89 e5                	mov    %esp,%ebp
    4134:	83 ec 48             	sub    $0x48,%esp
    4137:	8b 45 08             	mov    0x8(%ebp),%eax
    413a:	8b 40 18             	mov    0x18(%eax),%eax
    413d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4140:	8b 45 08             	mov    0x8(%ebp),%eax
    4143:	8b 40 14             	mov    0x14(%eax),%eax
    4146:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4149:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
    414d:	7f 19                	jg     4168 <hd_rdwt+0x37>
    414f:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    4152:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4157:	89 c8                	mov    %ecx,%eax
    4159:	f7 ea                	imul   %edx
    415b:	d1 fa                	sar    %edx
    415d:	89 c8                	mov    %ecx,%eax
    415f:	c1 f8 1f             	sar    $0x1f,%eax
    4162:	29 c2                	sub    %eax,%edx
    4164:	89 d0                	mov    %edx,%eax
    4166:	eb 11                	jmp    4179 <hd_rdwt+0x48>
    4168:	8b 45 e8             	mov    -0x18(%ebp),%eax
    416b:	83 e8 10             	sub    $0x10,%eax
    416e:	8d 50 3f             	lea    0x3f(%eax),%edx
    4171:	85 c0                	test   %eax,%eax
    4173:	0f 48 c2             	cmovs  %edx,%eax
    4176:	c1 f8 06             	sar    $0x6,%eax
    4179:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    417c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    417f:	8d 50 f0             	lea    -0x10(%eax),%edx
    4182:	89 d0                	mov    %edx,%eax
    4184:	c1 f8 1f             	sar    $0x1f,%eax
    4187:	c1 e8 1a             	shr    $0x1a,%eax
    418a:	01 c2                	add    %eax,%edx
    418c:	83 e2 3f             	and    $0x3f,%edx
    418f:	29 c2                	sub    %eax,%edx
    4191:	89 d0                	mov    %edx,%eax
    4193:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4196:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4199:	c1 e8 09             	shr    $0x9,%eax
    419c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    419f:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
    41a3:	7f 1a                	jg     41bf <hd_rdwt+0x8e>
    41a5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    41a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41ab:	c1 e2 03             	shl    $0x3,%edx
    41ae:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    41b4:	01 d0                	add    %edx,%eax
    41b6:	05 04 ff 00 00       	add    $0xff04,%eax
    41bb:	8b 00                	mov    (%eax),%eax
    41bd:	eb 1b                	jmp    41da <hd_rdwt+0xa9>
    41bf:	8b 45 e0             	mov    -0x20(%ebp),%eax
    41c2:	8d 50 04             	lea    0x4(%eax),%edx
    41c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41c8:	c1 e2 03             	shl    $0x3,%edx
    41cb:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    41d1:	01 d0                	add    %edx,%eax
    41d3:	05 04 ff 00 00       	add    $0xff04,%eax
    41d8:	8b 00                	mov    (%eax),%eax
    41da:	8b 55 dc             	mov    -0x24(%ebp),%edx
    41dd:	01 d0                	add    %edx,%eax
    41df:	89 45 dc             	mov    %eax,-0x24(%ebp)
    41e2:	8b 45 08             	mov    0x8(%ebp),%eax
    41e5:	8b 40 0c             	mov    0xc(%eax),%eax
    41e8:	89 45 d8             	mov    %eax,-0x28(%ebp)
    41eb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    41ee:	05 ff 01 00 00       	add    $0x1ff,%eax
    41f3:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    41f9:	85 c0                	test   %eax,%eax
    41fb:	0f 48 c2             	cmovs  %edx,%eax
    41fe:	c1 f8 09             	sar    $0x9,%eax
    4201:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4204:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4207:	89 45 f4             	mov    %eax,-0xc(%ebp)
    420a:	8b 45 08             	mov    0x8(%ebp),%eax
    420d:	8b 40 10             	mov    0x10(%eax),%eax
    4210:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4213:	8b 45 08             	mov    0x8(%ebp),%eax
    4216:	8b 00                	mov    (%eax),%eax
    4218:	89 45 cc             	mov    %eax,-0x34(%ebp)
    421b:	83 ec 08             	sub    $0x8,%esp
    421e:	ff 75 d0             	pushl  -0x30(%ebp)
    4221:	ff 75 cc             	pushl  -0x34(%ebp)
    4224:	e8 12 25 00 00       	call   673b <v2l>
    4229:	83 c4 10             	add    $0x10,%esp
    422c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    422f:	8b 45 08             	mov    0x8(%ebp),%eax
    4232:	8b 40 68             	mov    0x68(%eax),%eax
    4235:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4238:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    423c:	74 22                	je     4260 <hd_rdwt+0x12f>
    423e:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    4242:	74 1c                	je     4260 <hd_rdwt+0x12f>
    4244:	68 9f 01 00 00       	push   $0x19f
    4249:	68 b1 91 00 00       	push   $0x91b1
    424e:	68 b1 91 00 00       	push   $0x91b1
    4253:	68 b9 91 00 00       	push   $0x91b9
    4258:	e8 75 ea ff ff       	call   2cd2 <assertion_failure>
    425d:	83 c4 10             	add    $0x10,%esp
    4260:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    4264:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4267:	88 45 be             	mov    %al,-0x42(%ebp)
    426a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    426d:	88 45 bf             	mov    %al,-0x41(%ebp)
    4270:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4273:	c1 f8 08             	sar    $0x8,%eax
    4276:	88 45 c0             	mov    %al,-0x40(%ebp)
    4279:	8b 45 dc             	mov    -0x24(%ebp),%eax
    427c:	c1 f8 10             	sar    $0x10,%eax
    427f:	88 45 c1             	mov    %al,-0x3f(%ebp)
    4282:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4285:	c1 f8 18             	sar    $0x18,%eax
    4288:	83 e0 0f             	and    $0xf,%eax
    428b:	83 c8 e0             	or     $0xffffffe0,%eax
    428e:	88 45 c2             	mov    %al,-0x3e(%ebp)
    4291:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    4295:	75 07                	jne    429e <hd_rdwt+0x16d>
    4297:	b8 20 00 00 00       	mov    $0x20,%eax
    429c:	eb 05                	jmp    42a3 <hd_rdwt+0x172>
    429e:	b8 30 00 00 00       	mov    $0x30,%eax
    42a3:	88 45 c3             	mov    %al,-0x3d(%ebp)
    42a6:	83 ec 0c             	sub    $0xc,%esp
    42a9:	8d 45 bd             	lea    -0x43(%ebp),%eax
    42ac:	50                   	push   %eax
    42ad:	e8 db f6 ff ff       	call   398d <hd_cmd_out>
    42b2:	83 c4 10             	add    $0x10,%esp
    42b5:	e9 9c 00 00 00       	jmp    4356 <hd_rdwt+0x225>
    42ba:	b8 00 02 00 00       	mov    $0x200,%eax
    42bf:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
    42c6:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
    42ca:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    42cd:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    42d1:	75 51                	jne    4324 <hd_rdwt+0x1f3>
    42d3:	e8 09 fe ff ff       	call   40e1 <wait_for>
    42d8:	e8 35 fe ff ff       	call   4112 <interrupt_wait>
    42dd:	83 ec 04             	sub    $0x4,%esp
    42e0:	ff 75 c4             	pushl  -0x3c(%ebp)
    42e3:	6a 00                	push   $0x0
    42e5:	68 40 01 01 00       	push   $0x10140
    42ea:	e8 d2 51 00 00       	call   94c1 <Memset>
    42ef:	83 c4 10             	add    $0x10,%esp
    42f2:	83 ec 04             	sub    $0x4,%esp
    42f5:	68 00 02 00 00       	push   $0x200
    42fa:	68 40 01 01 00       	push   $0x10140
    42ff:	68 f0 01 00 00       	push   $0x1f0
    4304:	e8 0c 52 00 00       	call   9515 <read_port>
    4309:	83 c4 10             	add    $0x10,%esp
    430c:	83 ec 04             	sub    $0x4,%esp
    430f:	ff 75 c4             	pushl  -0x3c(%ebp)
    4312:	68 40 01 01 00       	push   $0x10140
    4317:	ff 75 f0             	pushl  -0x10(%ebp)
    431a:	e8 74 51 00 00       	call   9493 <Memcpy>
    431f:	83 c4 10             	add    $0x10,%esp
    4322:	eb 26                	jmp    434a <hd_rdwt+0x219>
    4324:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    4328:	75 20                	jne    434a <hd_rdwt+0x219>
    432a:	e8 b2 fd ff ff       	call   40e1 <wait_for>
    432f:	83 ec 04             	sub    $0x4,%esp
    4332:	ff 75 c4             	pushl  -0x3c(%ebp)
    4335:	ff 75 f0             	pushl  -0x10(%ebp)
    4338:	68 f0 01 00 00       	push   $0x1f0
    433d:	e8 e7 51 00 00       	call   9529 <write_port>
    4342:	83 c4 10             	add    $0x10,%esp
    4345:	e8 c8 fd ff ff       	call   4112 <interrupt_wait>
    434a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    434d:	29 45 f4             	sub    %eax,-0xc(%ebp)
    4350:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4353:	01 45 f0             	add    %eax,-0x10(%ebp)
    4356:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    435a:	0f 85 5a ff ff ff    	jne    42ba <hd_rdwt+0x189>
    4360:	90                   	nop
    4361:	c9                   	leave  
    4362:	c3                   	ret    

00004363 <hd_handler>:
    4363:	55                   	push   %ebp
    4364:	89 e5                	mov    %esp,%ebp
    4366:	83 ec 18             	sub    $0x18,%esp
    4369:	83 ec 0c             	sub    $0xc,%esp
    436c:	68 f7 01 00 00       	push   $0x1f7
    4371:	e8 5d cf ff ff       	call   12d3 <in_byte>
    4376:	83 c4 10             	add    $0x10,%esp
    4379:	0f b6 c0             	movzbl %al,%eax
    437c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    437f:	83 ec 0c             	sub    $0xc,%esp
    4382:	6a 02                	push   $0x2
    4384:	e8 eb f3 ff ff       	call   3774 <inform_int>
    4389:	83 c4 10             	add    $0x10,%esp
    438c:	90                   	nop
    438d:	c9                   	leave  
    438e:	c3                   	ret    

0000438f <waitfor>:
    438f:	55                   	push   %ebp
    4390:	89 e5                	mov    %esp,%ebp
    4392:	83 ec 18             	sub    $0x18,%esp
    4395:	e8 d3 f2 ff ff       	call   366d <get_ticks_ipc>
    439a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    439d:	eb 22                	jmp    43c1 <waitfor+0x32>
    439f:	83 ec 0c             	sub    $0xc,%esp
    43a2:	68 f7 01 00 00       	push   $0x1f7
    43a7:	e8 27 cf ff ff       	call   12d3 <in_byte>
    43ac:	83 c4 10             	add    $0x10,%esp
    43af:	0f b6 c0             	movzbl %al,%eax
    43b2:	23 45 08             	and    0x8(%ebp),%eax
    43b5:	39 45 0c             	cmp    %eax,0xc(%ebp)
    43b8:	75 07                	jne    43c1 <waitfor+0x32>
    43ba:	b8 01 00 00 00       	mov    $0x1,%eax
    43bf:	eb 1d                	jmp    43de <waitfor+0x4f>
    43c1:	e8 a7 f2 ff ff       	call   366d <get_ticks_ipc>
    43c6:	2b 45 f4             	sub    -0xc(%ebp),%eax
    43c9:	89 c2                	mov    %eax,%edx
    43cb:	89 d0                	mov    %edx,%eax
    43cd:	c1 e0 02             	shl    $0x2,%eax
    43d0:	01 d0                	add    %edx,%eax
    43d2:	01 c0                	add    %eax,%eax
    43d4:	39 45 10             	cmp    %eax,0x10(%ebp)
    43d7:	7f c6                	jg     439f <waitfor+0x10>
    43d9:	b8 00 00 00 00       	mov    $0x0,%eax
    43de:	c9                   	leave  
    43df:	c3                   	ret    

000043e0 <print_hd_info>:
    43e0:	55                   	push   %ebp
    43e1:	89 e5                	mov    %esp,%ebp
    43e3:	83 ec 18             	sub    $0x18,%esp
    43e6:	83 ec 0c             	sub    $0xc,%esp
    43e9:	68 d7 91 00 00       	push   $0x91d7
    43ee:	e8 90 e5 ff ff       	call   2983 <Printf>
    43f3:	83 c4 10             	add    $0x10,%esp
    43f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    43fd:	eb 3b                	jmp    443a <print_hd_info+0x5a>
    43ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4402:	8b 04 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%eax
    4409:	85 c0                	test   %eax,%eax
    440b:	74 28                	je     4435 <print_hd_info+0x55>
    440d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4410:	8b 14 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%edx
    4417:	8b 45 f4             	mov    -0xc(%ebp),%eax
    441a:	8b 04 c5 04 ff 00 00 	mov    0xff04(,%eax,8),%eax
    4421:	ff 75 f4             	pushl  -0xc(%ebp)
    4424:	52                   	push   %edx
    4425:	50                   	push   %eax
    4426:	68 f4 91 00 00       	push   $0x91f4
    442b:	e8 53 e5 ff ff       	call   2983 <Printf>
    4430:	83 c4 10             	add    $0x10,%esp
    4433:	eb 01                	jmp    4436 <print_hd_info+0x56>
    4435:	90                   	nop
    4436:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    443a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    443e:	7e bf                	jle    43ff <print_hd_info+0x1f>
    4440:	83 ec 0c             	sub    $0xc,%esp
    4443:	68 0c 92 00 00       	push   $0x920c
    4448:	e8 36 e5 ff ff       	call   2983 <Printf>
    444d:	83 c4 10             	add    $0x10,%esp
    4450:	83 ec 0c             	sub    $0xc,%esp
    4453:	68 27 92 00 00       	push   $0x9227
    4458:	e8 26 e5 ff ff       	call   2983 <Printf>
    445d:	83 c4 10             	add    $0x10,%esp
    4460:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
    4467:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    446e:	eb 44                	jmp    44b4 <print_hd_info+0xd4>
    4470:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4473:	83 c0 04             	add    $0x4,%eax
    4476:	8b 04 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%eax
    447d:	85 c0                	test   %eax,%eax
    447f:	74 2e                	je     44af <print_hd_info+0xcf>
    4481:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4484:	83 c0 04             	add    $0x4,%eax
    4487:	8b 14 c5 08 ff 00 00 	mov    0xff08(,%eax,8),%edx
    448e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4491:	83 c0 04             	add    $0x4,%eax
    4494:	8b 04 c5 04 ff 00 00 	mov    0xff04(,%eax,8),%eax
    449b:	ff 75 f0             	pushl  -0x10(%ebp)
    449e:	52                   	push   %edx
    449f:	50                   	push   %eax
    44a0:	68 f4 91 00 00       	push   $0x91f4
    44a5:	e8 d9 e4 ff ff       	call   2983 <Printf>
    44aa:	83 c4 10             	add    $0x10,%esp
    44ad:	eb 01                	jmp    44b0 <print_hd_info+0xd0>
    44af:	90                   	nop
    44b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    44b4:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    44b8:	7e b6                	jle    4470 <print_hd_info+0x90>
    44ba:	83 ec 0c             	sub    $0xc,%esp
    44bd:	68 44 92 00 00       	push   $0x9244
    44c2:	e8 bc e4 ff ff       	call   2983 <Printf>
    44c7:	83 c4 10             	add    $0x10,%esp
    44ca:	90                   	nop
    44cb:	c9                   	leave  
    44cc:	c3                   	ret    

000044cd <is_empty>:
    44cd:	55                   	push   %ebp
    44ce:	89 e5                	mov    %esp,%ebp
    44d0:	83 ec 10             	sub    $0x10,%esp
    44d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    44da:	eb 1a                	jmp    44f6 <is_empty+0x29>
    44dc:	8b 55 fc             	mov    -0x4(%ebp),%edx
    44df:	8b 45 08             	mov    0x8(%ebp),%eax
    44e2:	01 d0                	add    %edx,%eax
    44e4:	0f b6 00             	movzbl (%eax),%eax
    44e7:	84 c0                	test   %al,%al
    44e9:	74 07                	je     44f2 <is_empty+0x25>
    44eb:	b8 00 00 00 00       	mov    $0x0,%eax
    44f0:	eb 11                	jmp    4503 <is_empty+0x36>
    44f2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    44f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44f9:	3b 45 0c             	cmp    0xc(%ebp),%eax
    44fc:	7c de                	jl     44dc <is_empty+0xf>
    44fe:	b8 01 00 00 00       	mov    $0x1,%eax
    4503:	c9                   	leave  
    4504:	c3                   	ret    
    4505:	66 90                	xchg   %ax,%ax
    4507:	66 90                	xchg   %ax,%ax
    4509:	66 90                	xchg   %ax,%ax
    450b:	66 90                	xchg   %ax,%ax
    450d:	66 90                	xchg   %ax,%ax
    450f:	90                   	nop

00004510 <get_ticks>:
    4510:	b8 00 00 00 00       	mov    $0x0,%eax
    4515:	cd 90                	int    $0x90
    4517:	c3                   	ret    

00004518 <write2>:
    4518:	b8 01 00 00 00       	mov    $0x1,%eax
    451d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4521:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4525:	cd 90                	int    $0x90
    4527:	c3                   	ret    

00004528 <write_debug>:
    4528:	b8 02 00 00 00       	mov    $0x2,%eax
    452d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4531:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4535:	cd 90                	int    $0x90
    4537:	c3                   	ret    

00004538 <send_msg2>:
    4538:	b8 03 00 00 00       	mov    $0x3,%eax
    453d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4541:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4545:	cd 90                	int    $0x90
    4547:	c3                   	ret    

00004548 <send_msg>:
    4548:	55                   	push   %ebp
    4549:	89 e5                	mov    %esp,%ebp
    454b:	53                   	push   %ebx
    454c:	51                   	push   %ecx
    454d:	b8 03 00 00 00       	mov    $0x3,%eax
    4552:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    4555:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4558:	cd 90                	int    $0x90
    455a:	59                   	pop    %ecx
    455b:	5b                   	pop    %ebx
    455c:	5d                   	pop    %ebp
    455d:	c3                   	ret    

0000455e <receive_msg2>:
    455e:	b8 04 00 00 00       	mov    $0x4,%eax
    4563:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4567:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    456b:	cd 90                	int    $0x90
    456d:	c3                   	ret    

0000456e <receive_msg>:
    456e:	55                   	push   %ebp
    456f:	89 e5                	mov    %esp,%ebp
    4571:	53                   	push   %ebx
    4572:	51                   	push   %ecx
    4573:	b8 04 00 00 00       	mov    $0x4,%eax
    4578:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    457b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    457e:	cd 90                	int    $0x90
    4580:	59                   	pop    %ecx
    4581:	5b                   	pop    %ebx
    4582:	5d                   	pop    %ebp
    4583:	c3                   	ret    

00004584 <task_fs>:
    4584:	55                   	push   %ebp
    4585:	89 e5                	mov    %esp,%ebp
    4587:	81 ec 08 01 00 00    	sub    $0x108,%esp
    458d:	e8 91 07 00 00       	call   4d23 <init_fs>
    4592:	83 ec 04             	sub    $0x4,%esp
    4595:	6a 6c                	push   $0x6c
    4597:	6a 00                	push   $0x0
    4599:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    459f:	50                   	push   %eax
    45a0:	e8 1c 4f 00 00       	call   94c1 <Memset>
    45a5:	83 c4 10             	add    $0x10,%esp
    45a8:	83 ec 04             	sub    $0x4,%esp
    45ab:	6a 10                	push   $0x10
    45ad:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    45b3:	50                   	push   %eax
    45b4:	6a 02                	push   $0x2
    45b6:	e8 83 ef ff ff       	call   353e <send_rec>
    45bb:	83 c4 10             	add    $0x10,%esp
    45be:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    45c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    45c7:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
    45cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    45d0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
    45d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    45d9:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
    45df:	89 45 e0             	mov    %eax,-0x20(%ebp)
    45e2:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
    45e8:	85 c0                	test   %eax,%eax
    45ea:	75 07                	jne    45f3 <task_fs+0x6f>
    45ec:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
    45f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    45f6:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    45fc:	05 80 11 08 00       	add    $0x81180,%eax
    4601:	a3 44 db 00 00       	mov    %eax,0xdb44
    4606:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    460d:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
    4611:	74 1c                	je     462f <task_fs+0xab>
    4613:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
    4617:	7f 08                	jg     4621 <task_fs+0x9d>
    4619:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    461d:	74 3e                	je     465d <task_fs+0xd9>
    461f:	eb 4b                	jmp    466c <task_fs+0xe8>
    4621:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
    4625:	74 1f                	je     4646 <task_fs+0xc2>
    4627:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
    462b:	74 19                	je     4646 <task_fs+0xc2>
    462d:	eb 3d                	jmp    466c <task_fs+0xe8>
    462f:	83 ec 0c             	sub    $0xc,%esp
    4632:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    4638:	50                   	push   %eax
    4639:	e8 14 07 00 00       	call   4d52 <do_open>
    463e:	83 c4 10             	add    $0x10,%esp
    4641:	89 45 b0             	mov    %eax,-0x50(%ebp)
    4644:	eb 26                	jmp    466c <task_fs+0xe8>
    4646:	83 ec 0c             	sub    $0xc,%esp
    4649:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    464f:	50                   	push   %eax
    4650:	e8 3b 18 00 00       	call   5e90 <do_rdwt>
    4655:	83 c4 10             	add    $0x10,%esp
    4658:	89 45 f4             	mov    %eax,-0xc(%ebp)
    465b:	eb 0f                	jmp    466c <task_fs+0xe8>
    465d:	83 ec 0c             	sub    $0xc,%esp
    4660:	ff 75 e4             	pushl  -0x1c(%ebp)
    4663:	e8 2a 1d 00 00       	call   6392 <do_close>
    4668:	83 c4 10             	add    $0x10,%esp
    466b:	90                   	nop
    466c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    4672:	83 f8 67             	cmp    $0x67,%eax
    4675:	74 36                	je     46ad <task_fs+0x129>
    4677:	8b 45 e8             	mov    -0x18(%ebp),%eax
    467a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    467d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
    4681:	75 06                	jne    4689 <task_fs+0x105>
    4683:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4686:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4689:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
    4690:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4693:	89 45 c0             	mov    %eax,-0x40(%ebp)
    4696:	83 ec 04             	sub    $0x4,%esp
    4699:	ff 75 f0             	pushl  -0x10(%ebp)
    469c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    46a2:	50                   	push   %eax
    46a3:	6a 01                	push   $0x1
    46a5:	e8 94 ee ff ff       	call   353e <send_rec>
    46aa:	83 c4 10             	add    $0x10,%esp
    46ad:	a1 00 d7 00 00       	mov    0xd700,%eax
    46b2:	83 c0 01             	add    $0x1,%eax
    46b5:	a3 00 d7 00 00       	mov    %eax,0xd700
    46ba:	e9 d3 fe ff ff       	jmp    4592 <task_fs+0xe>

000046bf <rd_wt>:
    46bf:	55                   	push   %ebp
    46c0:	89 e5                	mov    %esp,%ebp
    46c2:	83 ec 78             	sub    $0x78,%esp
    46c5:	83 ec 04             	sub    $0x4,%esp
    46c8:	6a 6c                	push   $0x6c
    46ca:	6a 00                	push   $0x0
    46cc:	8d 45 8c             	lea    -0x74(%ebp),%eax
    46cf:	50                   	push   %eax
    46d0:	e8 ec 4d 00 00       	call   94c1 <Memset>
    46d5:	83 c4 10             	add    $0x10,%esp
    46d8:	8b 45 18             	mov    0x18(%ebp),%eax
    46db:	89 45 f4             	mov    %eax,-0xc(%ebp)
    46de:	8b 45 0c             	mov    0xc(%ebp),%eax
    46e1:	89 45 a0             	mov    %eax,-0x60(%ebp)
    46e4:	8b 45 10             	mov    0x10(%ebp),%eax
    46e7:	89 45 9c             	mov    %eax,-0x64(%ebp)
    46ea:	8b 45 14             	mov    0x14(%ebp),%eax
    46ed:	89 45 98             	mov    %eax,-0x68(%ebp)
    46f0:	8b 45 08             	mov    0x8(%ebp),%eax
    46f3:	c1 e0 09             	shl    $0x9,%eax
    46f6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    46f9:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
    46fd:	74 22                	je     4721 <rd_wt+0x62>
    46ff:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
    4703:	74 1c                	je     4721 <rd_wt+0x62>
    4705:	68 d1 00 00 00       	push   $0xd1
    470a:	68 64 92 00 00       	push   $0x9264
    470f:	68 64 92 00 00       	push   $0x9264
    4714:	68 71 92 00 00       	push   $0x9271
    4719:	e8 b4 e5 ff ff       	call   2cd2 <assertion_failure>
    471e:	83 c4 10             	add    $0x10,%esp
    4721:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4724:	83 f8 07             	cmp    $0x7,%eax
    4727:	74 24                	je     474d <rd_wt+0x8e>
    4729:	8b 45 f4             	mov    -0xc(%ebp),%eax
    472c:	83 f8 0a             	cmp    $0xa,%eax
    472f:	74 1c                	je     474d <rd_wt+0x8e>
    4731:	68 d2 00 00 00       	push   $0xd2
    4736:	68 64 92 00 00       	push   $0x9264
    473b:	68 64 92 00 00       	push   $0x9264
    4740:	68 90 92 00 00       	push   $0x9290
    4745:	e8 88 e5 ff ff       	call   2cd2 <assertion_failure>
    474a:	83 c4 10             	add    $0x10,%esp
    474d:	83 ec 04             	sub    $0x4,%esp
    4750:	6a 02                	push   $0x2
    4752:	8d 45 8c             	lea    -0x74(%ebp),%eax
    4755:	50                   	push   %eax
    4756:	6a 03                	push   $0x3
    4758:	e8 e1 ed ff ff       	call   353e <send_rec>
    475d:	83 c4 10             	add    $0x10,%esp
    4760:	90                   	nop
    4761:	c9                   	leave  
    4762:	c3                   	ret    

00004763 <mkfs>:
    4763:	55                   	push   %ebp
    4764:	89 e5                	mov    %esp,%ebp
    4766:	57                   	push   %edi
    4767:	81 ec d4 00 00 00    	sub    $0xd4,%esp
    476d:	a1 20 c0 00 00       	mov    0xc020,%eax
    4772:	83 ec 04             	sub    $0x4,%esp
    4775:	68 00 02 00 00       	push   $0x200
    477a:	6a 00                	push   $0x0
    477c:	50                   	push   %eax
    477d:	e8 3f 4d 00 00       	call   94c1 <Memset>
    4782:	83 c4 10             	add    $0x10,%esp
    4785:	a1 20 c0 00 00       	mov    0xc020,%eax
    478a:	83 ec 0c             	sub    $0xc,%esp
    478d:	6a 0a                	push   $0xa
    478f:	68 00 02 00 00       	push   $0x200
    4794:	50                   	push   %eax
    4795:	6a 20                	push   $0x20
    4797:	6a 00                	push   $0x0
    4799:	e8 21 ff ff ff       	call   46bf <rd_wt>
    479e:	83 c4 20             	add    $0x20,%esp
    47a1:	a1 20 c0 00 00       	mov    0xc020,%eax
    47a6:	89 45 dc             	mov    %eax,-0x24(%ebp)
    47a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47ac:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    47b3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47b6:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
    47bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47c0:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
    47c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47ca:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
    47d1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47d4:	8b 40 04             	mov    0x4(%eax),%eax
    47d7:	8d 50 02             	lea    0x2(%eax),%edx
    47da:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47dd:	8b 40 08             	mov    0x8(%eax),%eax
    47e0:	01 c2                	add    %eax,%edx
    47e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47e5:	8b 40 0c             	mov    0xc(%eax),%eax
    47e8:	01 c2                	add    %eax,%edx
    47ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
    47ed:	89 10                	mov    %edx,(%eax)
    47ef:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    47f6:	b8 00 02 00 00       	mov    $0x200,%eax
    47fb:	2b 45 d8             	sub    -0x28(%ebp),%eax
    47fe:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    4804:	8b 55 d8             	mov    -0x28(%ebp),%edx
    4807:	01 ca                	add    %ecx,%edx
    4809:	83 ec 04             	sub    $0x4,%esp
    480c:	50                   	push   %eax
    480d:	6a 80                	push   $0xffffff80
    480f:	52                   	push   %edx
    4810:	e8 ac 4c 00 00       	call   94c1 <Memset>
    4815:	83 c4 10             	add    $0x10,%esp
    4818:	a1 20 c0 00 00       	mov    0xc020,%eax
    481d:	83 ec 0c             	sub    $0xc,%esp
    4820:	6a 0a                	push   $0xa
    4822:	68 00 02 00 00       	push   $0x200
    4827:	50                   	push   %eax
    4828:	6a 20                	push   $0x20
    482a:	6a 01                	push   $0x1
    482c:	e8 8e fe ff ff       	call   46bf <rd_wt>
    4831:	83 c4 20             	add    $0x20,%esp
    4834:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4837:	8b 10                	mov    (%eax),%edx
    4839:	89 55 98             	mov    %edx,-0x68(%ebp)
    483c:	8b 50 04             	mov    0x4(%eax),%edx
    483f:	89 55 9c             	mov    %edx,-0x64(%ebp)
    4842:	8b 50 08             	mov    0x8(%eax),%edx
    4845:	89 55 a0             	mov    %edx,-0x60(%ebp)
    4848:	8b 50 0c             	mov    0xc(%eax),%edx
    484b:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    484e:	8b 50 10             	mov    0x10(%eax),%edx
    4851:	89 55 a8             	mov    %edx,-0x58(%ebp)
    4854:	8b 50 14             	mov    0x14(%eax),%edx
    4857:	89 55 ac             	mov    %edx,-0x54(%ebp)
    485a:	8b 50 18             	mov    0x18(%eax),%edx
    485d:	89 55 b0             	mov    %edx,-0x50(%ebp)
    4860:	8b 50 1c             	mov    0x1c(%eax),%edx
    4863:	89 55 b4             	mov    %edx,-0x4c(%ebp)
    4866:	8b 40 20             	mov    0x20(%eax),%eax
    4869:	89 45 b8             	mov    %eax,-0x48(%ebp)
    486c:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
    4870:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
    4874:	a1 20 c0 00 00       	mov    0xc020,%eax
    4879:	83 ec 04             	sub    $0x4,%esp
    487c:	6a 01                	push   $0x1
    487e:	52                   	push   %edx
    487f:	50                   	push   %eax
    4880:	e8 3c 4c 00 00       	call   94c1 <Memset>
    4885:	83 c4 10             	add    $0x10,%esp
    4888:	a1 20 c0 00 00       	mov    0xc020,%eax
    488d:	83 c0 01             	add    $0x1,%eax
    4890:	83 ec 04             	sub    $0x4,%esp
    4893:	68 ff 01 00 00       	push   $0x1ff
    4898:	6a 80                	push   $0xffffff80
    489a:	50                   	push   %eax
    489b:	e8 21 4c 00 00       	call   94c1 <Memset>
    48a0:	83 c4 10             	add    $0x10,%esp
    48a3:	a1 20 c0 00 00       	mov    0xc020,%eax
    48a8:	83 ec 0c             	sub    $0xc,%esp
    48ab:	6a 0a                	push   $0xa
    48ad:	68 00 02 00 00       	push   $0x200
    48b2:	50                   	push   %eax
    48b3:	6a 20                	push   $0x20
    48b5:	6a 02                	push   $0x2
    48b7:	e8 03 fe ff ff       	call   46bf <rd_wt>
    48bc:	83 c4 20             	add    $0x20,%esp
    48bf:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
    48c6:	a1 20 c0 00 00       	mov    0xc020,%eax
    48cb:	83 ec 04             	sub    $0x4,%esp
    48ce:	68 00 02 00 00       	push   $0x200
    48d3:	6a ff                	push   $0xffffffff
    48d5:	50                   	push   %eax
    48d6:	e8 e6 4b 00 00       	call   94c1 <Memset>
    48db:	83 c4 10             	add    $0x10,%esp
    48de:	a1 20 c0 00 00       	mov    0xc020,%eax
    48e3:	83 ec 0c             	sub    $0xc,%esp
    48e6:	6a 0a                	push   $0xa
    48e8:	68 00 02 00 00       	push   $0x200
    48ed:	50                   	push   %eax
    48ee:	6a 20                	push   $0x20
    48f0:	ff 75 d0             	pushl  -0x30(%ebp)
    48f3:	e8 c7 fd ff ff       	call   46bf <rd_wt>
    48f8:	83 c4 20             	add    $0x20,%esp
    48fb:	a1 20 c0 00 00       	mov    0xc020,%eax
    4900:	83 ec 04             	sub    $0x4,%esp
    4903:	6a 01                	push   $0x1
    4905:	6a 01                	push   $0x1
    4907:	50                   	push   %eax
    4908:	e8 b4 4b 00 00       	call   94c1 <Memset>
    490d:	83 c4 10             	add    $0x10,%esp
    4910:	a1 20 c0 00 00       	mov    0xc020,%eax
    4915:	83 c0 01             	add    $0x1,%eax
    4918:	83 ec 04             	sub    $0x4,%esp
    491b:	68 ff 01 00 00       	push   $0x1ff
    4920:	6a 00                	push   $0x0
    4922:	50                   	push   %eax
    4923:	e8 99 4b 00 00       	call   94c1 <Memset>
    4928:	83 c4 10             	add    $0x10,%esp
    492b:	a1 20 c0 00 00       	mov    0xc020,%eax
    4930:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4933:	83 c2 01             	add    $0x1,%edx
    4936:	83 ec 0c             	sub    $0xc,%esp
    4939:	6a 0a                	push   $0xa
    493b:	68 00 02 00 00       	push   $0x200
    4940:	50                   	push   %eax
    4941:	6a 20                	push   $0x20
    4943:	52                   	push   %edx
    4944:	e8 76 fd ff ff       	call   46bf <rd_wt>
    4949:	83 c4 20             	add    $0x20,%esp
    494c:	8b 45 a0             	mov    -0x60(%ebp),%eax
    494f:	83 e8 02             	sub    $0x2,%eax
    4952:	89 45 cc             	mov    %eax,-0x34(%ebp)
    4955:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
    495c:	eb 3f                	jmp    499d <mkfs+0x23a>
    495e:	a1 20 c0 00 00       	mov    0xc020,%eax
    4963:	83 ec 04             	sub    $0x4,%esp
    4966:	68 00 02 00 00       	push   $0x200
    496b:	6a 00                	push   $0x0
    496d:	50                   	push   %eax
    496e:	e8 4e 4b 00 00       	call   94c1 <Memset>
    4973:	83 c4 10             	add    $0x10,%esp
    4976:	a1 20 c0 00 00       	mov    0xc020,%eax
    497b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    497e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4981:	01 ca                	add    %ecx,%edx
    4983:	83 ec 0c             	sub    $0xc,%esp
    4986:	6a 0a                	push   $0xa
    4988:	68 00 02 00 00       	push   $0x200
    498d:	50                   	push   %eax
    498e:	6a 20                	push   $0x20
    4990:	52                   	push   %edx
    4991:	e8 29 fd ff ff       	call   46bf <rd_wt>
    4996:	83 c4 20             	add    $0x20,%esp
    4999:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    499d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    49a0:	83 c0 01             	add    $0x1,%eax
    49a3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    49a6:	7e b6                	jle    495e <mkfs+0x1fb>
    49a8:	a1 20 c0 00 00       	mov    0xc020,%eax
    49ad:	8b 55 a0             	mov    -0x60(%ebp),%edx
    49b0:	83 c2 03             	add    $0x3,%edx
    49b3:	83 ec 0c             	sub    $0xc,%esp
    49b6:	6a 0a                	push   $0xa
    49b8:	68 00 02 00 00       	push   $0x200
    49bd:	50                   	push   %eax
    49be:	6a 20                	push   $0x20
    49c0:	52                   	push   %edx
    49c1:	e8 f9 fc ff ff       	call   46bf <rd_wt>
    49c6:	83 c4 20             	add    $0x20,%esp
    49c9:	a1 20 c0 00 00       	mov    0xc020,%eax
    49ce:	8b 55 a0             	mov    -0x60(%ebp),%edx
    49d1:	83 c2 03             	add    $0x3,%edx
    49d4:	83 ec 0c             	sub    $0xc,%esp
    49d7:	6a 07                	push   $0x7
    49d9:	68 00 02 00 00       	push   $0x200
    49de:	50                   	push   %eax
    49df:	6a 20                	push   $0x20
    49e1:	52                   	push   %edx
    49e2:	e8 d8 fc ff ff       	call   46bf <rd_wt>
    49e7:	83 c4 20             	add    $0x20,%esp
    49ea:	a1 20 c0 00 00       	mov    0xc020,%eax
    49ef:	89 45 c8             	mov    %eax,-0x38(%ebp)
    49f2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    49f5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    49fb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    49fe:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
    4a05:	8b 55 98             	mov    -0x68(%ebp),%edx
    4a08:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4a0b:	89 50 08             	mov    %edx,0x8(%eax)
    4a0e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4a11:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4a18:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4a1b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
    4a22:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4a25:	8b 10                	mov    (%eax),%edx
    4a27:	89 15 40 11 01 00    	mov    %edx,0x11140
    4a2d:	8b 50 04             	mov    0x4(%eax),%edx
    4a30:	89 15 44 11 01 00    	mov    %edx,0x11144
    4a36:	8b 50 08             	mov    0x8(%eax),%edx
    4a39:	89 15 48 11 01 00    	mov    %edx,0x11148
    4a3f:	8b 50 0c             	mov    0xc(%eax),%edx
    4a42:	89 15 4c 11 01 00    	mov    %edx,0x1114c
    4a48:	8b 50 10             	mov    0x10(%eax),%edx
    4a4b:	89 15 50 11 01 00    	mov    %edx,0x11150
    4a51:	8b 50 14             	mov    0x14(%eax),%edx
    4a54:	89 15 54 11 01 00    	mov    %edx,0x11154
    4a5a:	8b 50 18             	mov    0x18(%eax),%edx
    4a5d:	89 15 58 11 01 00    	mov    %edx,0x11158
    4a63:	8b 50 1c             	mov    0x1c(%eax),%edx
    4a66:	89 15 5c 11 01 00    	mov    %edx,0x1115c
    4a6c:	8b 50 20             	mov    0x20(%eax),%edx
    4a6f:	89 15 60 11 01 00    	mov    %edx,0x11160
    4a75:	8b 40 24             	mov    0x24(%eax),%eax
    4a78:	a3 64 11 01 00       	mov    %eax,0x11164
    4a7d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4a84:	eb 4c                	jmp    4ad2 <mkfs+0x36f>
    4a86:	a1 20 c0 00 00       	mov    0xc020,%eax
    4a8b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4a8e:	83 c2 01             	add    $0x1,%edx
    4a91:	c1 e2 05             	shl    $0x5,%edx
    4a94:	01 d0                	add    %edx,%eax
    4a96:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4a99:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4a9c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    4aa2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4aa5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    4aac:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4aaf:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    4ab6:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    4abd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4ac0:	c1 e0 08             	shl    $0x8,%eax
    4ac3:	0b 45 f0             	or     -0x10(%ebp),%eax
    4ac6:	89 c2                	mov    %eax,%edx
    4ac8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4acb:	89 50 08             	mov    %edx,0x8(%eax)
    4ace:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4ad2:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    4ad6:	7e ae                	jle    4a86 <mkfs+0x323>
    4ad8:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    4adf:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
    4ae5:	b8 00 00 00 00       	mov    $0x0,%eax
    4aea:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4aef:	89 d7                	mov    %edx,%edi
    4af1:	f3 ab                	rep stos %eax,%es:(%edi)
    4af3:	c7 85 70 ff ff ff b6 	movl   $0x92b6,-0x90(%ebp)
    4afa:	92 00 00 
    4afd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4b04:	eb 54                	jmp    4b5a <mkfs+0x3f7>
    4b06:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b0b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4b0e:	83 c2 04             	add    $0x4,%edx
    4b11:	c1 e2 05             	shl    $0x5,%edx
    4b14:	01 d0                	add    %edx,%eax
    4b16:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4b19:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4b1c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    4b22:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4b25:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
    4b2c:	8b 45 98             	mov    -0x68(%ebp),%eax
    4b2f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4b32:	83 c2 01             	add    $0x1,%edx
    4b35:	c1 e2 0b             	shl    $0xb,%edx
    4b38:	01 c2                	add    %eax,%edx
    4b3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4b3d:	89 50 08             	mov    %edx,0x8(%eax)
    4b40:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4b43:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4b4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4b4d:	8d 50 05             	lea    0x5(%eax),%edx
    4b50:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4b53:	89 50 10             	mov    %edx,0x10(%eax)
    4b56:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4b5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4b5d:	3b 45 c0             	cmp    -0x40(%ebp),%eax
    4b60:	7c a4                	jl     4b06 <mkfs+0x3a3>
    4b62:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b67:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4b6a:	83 c2 03             	add    $0x3,%edx
    4b6d:	83 ec 0c             	sub    $0xc,%esp
    4b70:	6a 0a                	push   $0xa
    4b72:	68 00 02 00 00       	push   $0x200
    4b77:	50                   	push   %eax
    4b78:	6a 20                	push   $0x20
    4b7a:	52                   	push   %edx
    4b7b:	e8 3f fb ff ff       	call   46bf <rd_wt>
    4b80:	83 c4 20             	add    $0x20,%esp
    4b83:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    4b89:	8b 45 98             	mov    -0x68(%ebp),%eax
    4b8c:	83 ec 0c             	sub    $0xc,%esp
    4b8f:	6a 07                	push   $0x7
    4b91:	68 00 02 00 00       	push   $0x200
    4b96:	52                   	push   %edx
    4b97:	6a 20                	push   $0x20
    4b99:	50                   	push   %eax
    4b9a:	e8 20 fb ff ff       	call   46bf <rd_wt>
    4b9f:	83 c4 20             	add    $0x20,%esp
    4ba2:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
    4ba9:	00 00 00 
    4bac:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
    4bb3:	2e 00 
    4bb5:	a1 20 c0 00 00       	mov    0xc020,%eax
    4bba:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4bbd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4bc0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    4bc6:	83 ec 0c             	sub    $0xc,%esp
    4bc9:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
    4bcf:	50                   	push   %eax
    4bd0:	e8 25 49 00 00       	call   94fa <Strlen>
    4bd5:	83 c4 10             	add    $0x10,%esp
    4bd8:	89 c1                	mov    %eax,%ecx
    4bda:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4bdd:	8d 50 04             	lea    0x4(%eax),%edx
    4be0:	83 ec 04             	sub    $0x4,%esp
    4be3:	51                   	push   %ecx
    4be4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
    4bea:	50                   	push   %eax
    4beb:	52                   	push   %edx
    4bec:	e8 a2 48 00 00       	call   9493 <Memcpy>
    4bf1:	83 c4 10             	add    $0x10,%esp
    4bf4:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
    4bfa:	b8 00 00 00 00       	mov    $0x0,%eax
    4bff:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4c04:	89 d7                	mov    %edx,%edi
    4c06:	f3 ab                	rep stos %eax,%es:(%edi)
    4c08:	c7 85 34 ff ff ff c2 	movl   $0x92c2,-0xcc(%ebp)
    4c0f:	92 00 00 
    4c12:	c7 85 38 ff ff ff cb 	movl   $0x92cb,-0xc8(%ebp)
    4c19:	92 00 00 
    4c1c:	c7 85 3c ff ff ff d4 	movl   $0x92d4,-0xc4(%ebp)
    4c23:	92 00 00 
    4c26:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
    4c2d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4c34:	eb 49                	jmp    4c7f <mkfs+0x51c>
    4c36:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
    4c3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c3d:	8d 50 02             	lea    0x2(%eax),%edx
    4c40:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4c43:	89 10                	mov    %edx,(%eax)
    4c45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c48:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
    4c4f:	83 ec 0c             	sub    $0xc,%esp
    4c52:	50                   	push   %eax
    4c53:	e8 a2 48 00 00       	call   94fa <Strlen>
    4c58:	83 c4 10             	add    $0x10,%esp
    4c5b:	89 c1                	mov    %eax,%ecx
    4c5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c60:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
    4c67:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4c6a:	83 c2 04             	add    $0x4,%edx
    4c6d:	83 ec 04             	sub    $0x4,%esp
    4c70:	51                   	push   %ecx
    4c71:	50                   	push   %eax
    4c72:	52                   	push   %edx
    4c73:	e8 1b 48 00 00       	call   9493 <Memcpy>
    4c78:	83 c4 10             	add    $0x10,%esp
    4c7b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4c7f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c82:	3b 45 bc             	cmp    -0x44(%ebp),%eax
    4c85:	7c af                	jl     4c36 <mkfs+0x4d3>
    4c87:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    4c8e:	eb 66                	jmp    4cf6 <mkfs+0x593>
    4c90:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4c93:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4c9a:	83 ec 0c             	sub    $0xc,%esp
    4c9d:	50                   	push   %eax
    4c9e:	e8 57 48 00 00       	call   94fa <Strlen>
    4ca3:	83 c4 10             	add    $0x10,%esp
    4ca6:	85 c0                	test   %eax,%eax
    4ca8:	74 47                	je     4cf1 <mkfs+0x58e>
    4caa:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
    4cae:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4cb1:	8d 50 05             	lea    0x5(%eax),%edx
    4cb4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4cb7:	89 10                	mov    %edx,(%eax)
    4cb9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4cbc:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4cc3:	83 ec 0c             	sub    $0xc,%esp
    4cc6:	50                   	push   %eax
    4cc7:	e8 2e 48 00 00       	call   94fa <Strlen>
    4ccc:	83 c4 10             	add    $0x10,%esp
    4ccf:	89 c1                	mov    %eax,%ecx
    4cd1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4cd4:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4cdb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4cde:	83 c2 04             	add    $0x4,%edx
    4ce1:	83 ec 04             	sub    $0x4,%esp
    4ce4:	51                   	push   %ecx
    4ce5:	50                   	push   %eax
    4ce6:	52                   	push   %edx
    4ce7:	e8 a7 47 00 00       	call   9493 <Memcpy>
    4cec:	83 c4 10             	add    $0x10,%esp
    4cef:	eb 01                	jmp    4cf2 <mkfs+0x58f>
    4cf1:	90                   	nop
    4cf2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    4cf6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4cf9:	3b 45 c0             	cmp    -0x40(%ebp),%eax
    4cfc:	7c 92                	jl     4c90 <mkfs+0x52d>
    4cfe:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    4d04:	8b 45 98             	mov    -0x68(%ebp),%eax
    4d07:	83 ec 0c             	sub    $0xc,%esp
    4d0a:	6a 0a                	push   $0xa
    4d0c:	68 00 02 00 00       	push   $0x200
    4d11:	52                   	push   %edx
    4d12:	6a 20                	push   $0x20
    4d14:	50                   	push   %eax
    4d15:	e8 a5 f9 ff ff       	call   46bf <rd_wt>
    4d1a:	83 c4 20             	add    $0x20,%esp
    4d1d:	90                   	nop
    4d1e:	8b 7d fc             	mov    -0x4(%ebp),%edi
    4d21:	c9                   	leave  
    4d22:	c3                   	ret    

00004d23 <init_fs>:
    4d23:	55                   	push   %ebp
    4d24:	89 e5                	mov    %esp,%ebp
    4d26:	83 ec 78             	sub    $0x78,%esp
    4d29:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    4d30:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
    4d37:	83 ec 04             	sub    $0x4,%esp
    4d3a:	6a 02                	push   $0x2
    4d3c:	8d 45 8c             	lea    -0x74(%ebp),%eax
    4d3f:	50                   	push   %eax
    4d40:	6a 03                	push   $0x3
    4d42:	e8 f7 e7 ff ff       	call   353e <send_rec>
    4d47:	83 c4 10             	add    $0x10,%esp
    4d4a:	e8 14 fa ff ff       	call   4763 <mkfs>
    4d4f:	90                   	nop
    4d50:	c9                   	leave  
    4d51:	c3                   	ret    

00004d52 <do_open>:
    4d52:	55                   	push   %ebp
    4d53:	89 e5                	mov    %esp,%ebp
    4d55:	56                   	push   %esi
    4d56:	53                   	push   %ebx
    4d57:	83 ec 60             	sub    $0x60,%esp
    4d5a:	83 ec 04             	sub    $0x4,%esp
    4d5d:	6a 0c                	push   $0xc
    4d5f:	6a 00                	push   $0x0
    4d61:	8d 45 cc             	lea    -0x34(%ebp),%eax
    4d64:	50                   	push   %eax
    4d65:	e8 57 47 00 00       	call   94c1 <Memset>
    4d6a:	83 c4 10             	add    $0x10,%esp
    4d6d:	8b 45 08             	mov    0x8(%ebp),%eax
    4d70:	8b 40 30             	mov    0x30(%eax),%eax
    4d73:	89 c6                	mov    %eax,%esi
    4d75:	8b 45 08             	mov    0x8(%ebp),%eax
    4d78:	8b 40 34             	mov    0x34(%eax),%eax
    4d7b:	89 c2                	mov    %eax,%edx
    4d7d:	8b 45 08             	mov    0x8(%ebp),%eax
    4d80:	8b 00                	mov    (%eax),%eax
    4d82:	83 ec 08             	sub    $0x8,%esp
    4d85:	52                   	push   %edx
    4d86:	50                   	push   %eax
    4d87:	e8 af 19 00 00       	call   673b <v2l>
    4d8c:	83 c4 10             	add    $0x10,%esp
    4d8f:	89 c3                	mov    %eax,%ebx
    4d91:	83 ec 08             	sub    $0x8,%esp
    4d94:	8d 45 cc             	lea    -0x34(%ebp),%eax
    4d97:	50                   	push   %eax
    4d98:	6a 03                	push   $0x3
    4d9a:	e8 9c 19 00 00       	call   673b <v2l>
    4d9f:	83 c4 10             	add    $0x10,%esp
    4da2:	83 ec 04             	sub    $0x4,%esp
    4da5:	56                   	push   %esi
    4da6:	53                   	push   %ebx
    4da7:	50                   	push   %eax
    4da8:	e8 e6 46 00 00       	call   9493 <Memcpy>
    4dad:	83 c4 10             	add    $0x10,%esp
    4db0:	8b 45 08             	mov    0x8(%ebp),%eax
    4db3:	8b 40 30             	mov    0x30(%eax),%eax
    4db6:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
    4dbb:	8b 45 08             	mov    0x8(%ebp),%eax
    4dbe:	8b 40 64             	mov    0x64(%eax),%eax
    4dc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4dc4:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
    4dcb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4dd2:	eb 1f                	jmp    4df3 <do_open+0xa1>
    4dd4:	a1 44 db 00 00       	mov    0xdb44,%eax
    4dd9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ddc:	83 c2 1c             	add    $0x1c,%edx
    4ddf:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4de3:	85 c0                	test   %eax,%eax
    4de5:	75 08                	jne    4def <do_open+0x9d>
    4de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4dea:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4ded:	eb 0a                	jmp    4df9 <do_open+0xa7>
    4def:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4df3:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    4df7:	7e db                	jle    4dd4 <do_open+0x82>
    4df9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4dfd:	75 1c                	jne    4e1b <do_open+0xc9>
    4dff:	68 d8 01 00 00       	push   $0x1d8
    4e04:	68 64 92 00 00       	push   $0x9264
    4e09:	68 64 92 00 00       	push   $0x9264
    4e0e:	68 dd 92 00 00       	push   $0x92dd
    4e13:	e8 ba de ff ff       	call   2cd2 <assertion_failure>
    4e18:	83 c4 10             	add    $0x10,%esp
    4e1b:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
    4e22:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    4e29:	eb 1d                	jmp    4e48 <do_open+0xf6>
    4e2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e2e:	c1 e0 04             	shl    $0x4,%eax
    4e31:	05 48 03 01 00       	add    $0x10348,%eax
    4e36:	8b 00                	mov    (%eax),%eax
    4e38:	85 c0                	test   %eax,%eax
    4e3a:	75 08                	jne    4e44 <do_open+0xf2>
    4e3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e3f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4e42:	eb 0a                	jmp    4e4e <do_open+0xfc>
    4e44:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4e48:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
    4e4c:	7e dd                	jle    4e2b <do_open+0xd9>
    4e4e:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
    4e52:	75 1c                	jne    4e70 <do_open+0x11e>
    4e54:	68 e4 01 00 00       	push   $0x1e4
    4e59:	68 64 92 00 00       	push   $0x9264
    4e5e:	68 64 92 00 00       	push   $0x9264
    4e63:	68 e5 92 00 00       	push   $0x92e5
    4e68:	e8 65 de ff ff       	call   2cd2 <assertion_failure>
    4e6d:	83 c4 10             	add    $0x10,%esp
    4e70:	83 ec 0c             	sub    $0xc,%esp
    4e73:	8d 45 cc             	lea    -0x34(%ebp),%eax
    4e76:	50                   	push   %eax
    4e77:	e8 b7 00 00 00       	call   4f33 <search_file>
    4e7c:	83 c4 10             	add    $0x10,%esp
    4e7f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4e82:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
    4e86:	75 2b                	jne    4eb3 <do_open+0x161>
    4e88:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    4e8c:	7e 10                	jle    4e9e <do_open+0x14c>
    4e8e:	83 ec 0c             	sub    $0xc,%esp
    4e91:	68 ed 92 00 00       	push   $0x92ed
    4e96:	e8 19 de ff ff       	call   2cb4 <panic>
    4e9b:	83 c4 10             	add    $0x10,%esp
    4e9e:	83 ec 08             	sub    $0x8,%esp
    4ea1:	8d 45 cc             	lea    -0x34(%ebp),%eax
    4ea4:	50                   	push   %eax
    4ea5:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4ea8:	50                   	push   %eax
    4ea9:	e8 43 04 00 00       	call   52f1 <create_file>
    4eae:	83 c4 10             	add    $0x10,%esp
    4eb1:	eb 22                	jmp    4ed5 <do_open+0x183>
    4eb3:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    4eb7:	75 07                	jne    4ec0 <do_open+0x16e>
    4eb9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4ebe:	eb 6c                	jmp    4f2c <do_open+0x1da>
    4ec0:	83 ec 08             	sub    $0x8,%esp
    4ec3:	ff 75 e0             	pushl  -0x20(%ebp)
    4ec6:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4ec9:	50                   	push   %eax
    4eca:	e8 60 02 00 00       	call   512f <get_inode>
    4ecf:	83 c4 10             	add    $0x10,%esp
    4ed2:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4ed5:	a1 44 db 00 00       	mov    0xdb44,%eax
    4eda:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4edd:	c1 e2 04             	shl    $0x4,%edx
    4ee0:	8d 8a 40 03 01 00    	lea    0x10340(%edx),%ecx
    4ee6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4ee9:	83 c2 1c             	add    $0x1c,%edx
    4eec:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
    4ef0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4ef3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4ef6:	c1 e2 04             	shl    $0x4,%edx
    4ef9:	81 c2 48 03 01 00    	add    $0x10348,%edx
    4eff:	89 02                	mov    %eax,(%edx)
    4f01:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4f04:	c1 e0 04             	shl    $0x4,%eax
    4f07:	05 44 03 01 00       	add    $0x10344,%eax
    4f0c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    4f12:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4f15:	c1 e0 04             	shl    $0x4,%eax
    4f18:	05 40 03 01 00       	add    $0x10340,%eax
    4f1d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    4f23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f26:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4f29:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4f2c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4f2f:	5b                   	pop    %ebx
    4f30:	5e                   	pop    %esi
    4f31:	5d                   	pop    %ebp
    4f32:	c3                   	ret    

00004f33 <search_file>:
    4f33:	55                   	push   %ebp
    4f34:	89 e5                	mov    %esp,%ebp
    4f36:	83 ec 68             	sub    $0x68,%esp
    4f39:	83 ec 04             	sub    $0x4,%esp
    4f3c:	6a 0c                	push   $0xc
    4f3e:	6a 00                	push   $0x0
    4f40:	8d 45 c0             	lea    -0x40(%ebp),%eax
    4f43:	50                   	push   %eax
    4f44:	e8 78 45 00 00       	call   94c1 <Memset>
    4f49:	83 c4 10             	add    $0x10,%esp
    4f4c:	83 ec 04             	sub    $0x4,%esp
    4f4f:	6a 28                	push   $0x28
    4f51:	6a 00                	push   $0x0
    4f53:	8d 45 98             	lea    -0x68(%ebp),%eax
    4f56:	50                   	push   %eax
    4f57:	e8 65 45 00 00       	call   94c1 <Memset>
    4f5c:	83 c4 10             	add    $0x10,%esp
    4f5f:	83 ec 04             	sub    $0x4,%esp
    4f62:	8d 45 98             	lea    -0x68(%ebp),%eax
    4f65:	50                   	push   %eax
    4f66:	ff 75 08             	pushl  0x8(%ebp)
    4f69:	8d 45 c0             	lea    -0x40(%ebp),%eax
    4f6c:	50                   	push   %eax
    4f6d:	e8 f1 00 00 00       	call   5063 <strip_path>
    4f72:	83 c4 10             	add    $0x10,%esp
    4f75:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4f78:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
    4f7c:	75 0a                	jne    4f88 <search_file+0x55>
    4f7e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4f83:	e9 d9 00 00 00       	jmp    5061 <search_file+0x12e>
    4f88:	8b 45 9c             	mov    -0x64(%ebp),%eax
    4f8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4f8e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4f91:	05 00 02 00 00       	add    $0x200,%eax
    4f96:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    4f9c:	85 c0                	test   %eax,%eax
    4f9e:	0f 48 c2             	cmovs  %edx,%eax
    4fa1:	c1 f8 09             	sar    $0x9,%eax
    4fa4:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4fa7:	8b 45 9c             	mov    -0x64(%ebp),%eax
    4faa:	c1 e8 04             	shr    $0x4,%eax
    4fad:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4fb0:	e8 2f 14 00 00       	call   63e4 <get_super_block>
    4fb5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4fb8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4fbb:	8b 00                	mov    (%eax),%eax
    4fbd:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4fc0:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
    4fc7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4fce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4fd5:	eb 79                	jmp    5050 <search_file+0x11d>
    4fd7:	a1 20 c0 00 00       	mov    0xc020,%eax
    4fdc:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    4fdf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4fe2:	01 ca                	add    %ecx,%edx
    4fe4:	83 ec 0c             	sub    $0xc,%esp
    4fe7:	6a 07                	push   $0x7
    4fe9:	68 00 02 00 00       	push   $0x200
    4fee:	50                   	push   %eax
    4fef:	ff 75 cc             	pushl  -0x34(%ebp)
    4ff2:	52                   	push   %edx
    4ff3:	e8 c7 f6 ff ff       	call   46bf <rd_wt>
    4ff8:	83 c4 20             	add    $0x20,%esp
    4ffb:	a1 20 c0 00 00       	mov    0xc020,%eax
    5000:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5003:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    500a:	eb 35                	jmp    5041 <search_file+0x10e>
    500c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5010:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5013:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5016:	7f 33                	jg     504b <search_file+0x118>
    5018:	8b 45 ec             	mov    -0x14(%ebp),%eax
    501b:	83 c0 04             	add    $0x4,%eax
    501e:	83 ec 08             	sub    $0x8,%esp
    5021:	50                   	push   %eax
    5022:	8d 45 c0             	lea    -0x40(%ebp),%eax
    5025:	50                   	push   %eax
    5026:	e8 02 e8 ff ff       	call   382d <strcmp>
    502b:	83 c4 10             	add    $0x10,%esp
    502e:	85 c0                	test   %eax,%eax
    5030:	75 07                	jne    5039 <search_file+0x106>
    5032:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5035:	8b 00                	mov    (%eax),%eax
    5037:	eb 28                	jmp    5061 <search_file+0x12e>
    5039:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    503d:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
    5041:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5044:	83 f8 1f             	cmp    $0x1f,%eax
    5047:	76 c3                	jbe    500c <search_file+0xd9>
    5049:	eb 01                	jmp    504c <search_file+0x119>
    504b:	90                   	nop
    504c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5050:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5053:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    5056:	0f 8c 7b ff ff ff    	jl     4fd7 <search_file+0xa4>
    505c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5061:	c9                   	leave  
    5062:	c3                   	ret    

00005063 <strip_path>:
    5063:	55                   	push   %ebp
    5064:	89 e5                	mov    %esp,%ebp
    5066:	83 ec 10             	sub    $0x10,%esp
    5069:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    506d:	75 0a                	jne    5079 <strip_path+0x16>
    506f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5074:	e9 b4 00 00 00       	jmp    512d <strip_path+0xca>
    5079:	8b 45 08             	mov    0x8(%ebp),%eax
    507c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    507f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5082:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5085:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5088:	0f b6 00             	movzbl (%eax),%eax
    508b:	3c 2f                	cmp    $0x2f,%al
    508d:	75 2d                	jne    50bc <strip_path+0x59>
    508f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    5093:	eb 27                	jmp    50bc <strip_path+0x59>
    5095:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5098:	0f b6 00             	movzbl (%eax),%eax
    509b:	3c 2f                	cmp    $0x2f,%al
    509d:	75 0a                	jne    50a9 <strip_path+0x46>
    509f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    50a4:	e9 84 00 00 00       	jmp    512d <strip_path+0xca>
    50a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    50ac:	0f b6 10             	movzbl (%eax),%edx
    50af:	8b 45 fc             	mov    -0x4(%ebp),%eax
    50b2:	88 10                	mov    %dl,(%eax)
    50b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    50b8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    50bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    50bf:	0f b6 00             	movzbl (%eax),%eax
    50c2:	84 c0                	test   %al,%al
    50c4:	75 cf                	jne    5095 <strip_path+0x32>
    50c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    50c9:	c6 00 00             	movb   $0x0,(%eax)
    50cc:	8b 45 10             	mov    0x10(%ebp),%eax
    50cf:	8b 15 40 11 01 00    	mov    0x11140,%edx
    50d5:	89 10                	mov    %edx,(%eax)
    50d7:	8b 15 44 11 01 00    	mov    0x11144,%edx
    50dd:	89 50 04             	mov    %edx,0x4(%eax)
    50e0:	8b 15 48 11 01 00    	mov    0x11148,%edx
    50e6:	89 50 08             	mov    %edx,0x8(%eax)
    50e9:	8b 15 4c 11 01 00    	mov    0x1114c,%edx
    50ef:	89 50 0c             	mov    %edx,0xc(%eax)
    50f2:	8b 15 50 11 01 00    	mov    0x11150,%edx
    50f8:	89 50 10             	mov    %edx,0x10(%eax)
    50fb:	8b 15 54 11 01 00    	mov    0x11154,%edx
    5101:	89 50 14             	mov    %edx,0x14(%eax)
    5104:	8b 15 58 11 01 00    	mov    0x11158,%edx
    510a:	89 50 18             	mov    %edx,0x18(%eax)
    510d:	8b 15 5c 11 01 00    	mov    0x1115c,%edx
    5113:	89 50 1c             	mov    %edx,0x1c(%eax)
    5116:	8b 15 60 11 01 00    	mov    0x11160,%edx
    511c:	89 50 20             	mov    %edx,0x20(%eax)
    511f:	8b 15 64 11 01 00    	mov    0x11164,%edx
    5125:	89 50 24             	mov    %edx,0x24(%eax)
    5128:	b8 00 00 00 00       	mov    $0x0,%eax
    512d:	c9                   	leave  
    512e:	c3                   	ret    

0000512f <get_inode>:
    512f:	55                   	push   %ebp
    5130:	89 e5                	mov    %esp,%ebp
    5132:	56                   	push   %esi
    5133:	53                   	push   %ebx
    5134:	83 ec 20             	sub    $0x20,%esp
    5137:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    513b:	75 0a                	jne    5147 <get_inode+0x18>
    513d:	b8 00 00 00 00       	mov    $0x0,%eax
    5142:	e9 a3 01 00 00       	jmp    52ea <get_inode+0x1bb>
    5147:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    514e:	c7 45 f0 40 07 01 00 	movl   $0x10740,-0x10(%ebp)
    5155:	eb 69                	jmp    51c0 <get_inode+0x91>
    5157:	8b 45 f0             	mov    -0x10(%ebp),%eax
    515a:	8b 40 24             	mov    0x24(%eax),%eax
    515d:	85 c0                	test   %eax,%eax
    515f:	7e 53                	jle    51b4 <get_inode+0x85>
    5161:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5164:	8b 40 10             	mov    0x10(%eax),%eax
    5167:	39 45 0c             	cmp    %eax,0xc(%ebp)
    516a:	75 50                	jne    51bc <get_inode+0x8d>
    516c:	8b 45 08             	mov    0x8(%ebp),%eax
    516f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5172:	8b 0a                	mov    (%edx),%ecx
    5174:	89 08                	mov    %ecx,(%eax)
    5176:	8b 4a 04             	mov    0x4(%edx),%ecx
    5179:	89 48 04             	mov    %ecx,0x4(%eax)
    517c:	8b 4a 08             	mov    0x8(%edx),%ecx
    517f:	89 48 08             	mov    %ecx,0x8(%eax)
    5182:	8b 4a 0c             	mov    0xc(%edx),%ecx
    5185:	89 48 0c             	mov    %ecx,0xc(%eax)
    5188:	8b 4a 10             	mov    0x10(%edx),%ecx
    518b:	89 48 10             	mov    %ecx,0x10(%eax)
    518e:	8b 4a 14             	mov    0x14(%edx),%ecx
    5191:	89 48 14             	mov    %ecx,0x14(%eax)
    5194:	8b 4a 18             	mov    0x18(%edx),%ecx
    5197:	89 48 18             	mov    %ecx,0x18(%eax)
    519a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    519d:	89 48 1c             	mov    %ecx,0x1c(%eax)
    51a0:	8b 4a 20             	mov    0x20(%edx),%ecx
    51a3:	89 48 20             	mov    %ecx,0x20(%eax)
    51a6:	8b 52 24             	mov    0x24(%edx),%edx
    51a9:	89 50 24             	mov    %edx,0x24(%eax)
    51ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51af:	e9 36 01 00 00       	jmp    52ea <get_inode+0x1bb>
    51b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    51ba:	eb 0d                	jmp    51c9 <get_inode+0x9a>
    51bc:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
    51c0:	81 7d f0 40 11 01 00 	cmpl   $0x11140,-0x10(%ebp)
    51c7:	76 8e                	jbe    5157 <get_inode+0x28>
    51c9:	e8 16 12 00 00       	call   63e4 <get_super_block>
    51ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
    51d1:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    51d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51db:	8b 40 04             	mov    0x4(%eax),%eax
    51de:	8d 50 02             	lea    0x2(%eax),%edx
    51e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51e4:	8b 40 08             	mov    0x8(%eax),%eax
    51e7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    51ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    51ed:	8d 48 ff             	lea    -0x1(%eax),%ecx
    51f0:	b8 00 02 00 00       	mov    $0x200,%eax
    51f5:	99                   	cltd   
    51f6:	f7 7d e8             	idivl  -0x18(%ebp)
    51f9:	89 c6                	mov    %eax,%esi
    51fb:	89 c8                	mov    %ecx,%eax
    51fd:	99                   	cltd   
    51fe:	f7 fe                	idiv   %esi
    5200:	01 d8                	add    %ebx,%eax
    5202:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5205:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
    520c:	a1 20 c0 00 00       	mov    0xc020,%eax
    5211:	83 ec 0c             	sub    $0xc,%esp
    5214:	6a 07                	push   $0x7
    5216:	68 00 02 00 00       	push   $0x200
    521b:	50                   	push   %eax
    521c:	ff 75 e0             	pushl  -0x20(%ebp)
    521f:	ff 75 e4             	pushl  -0x1c(%ebp)
    5222:	e8 98 f4 ff ff       	call   46bf <rd_wt>
    5227:	83 c4 20             	add    $0x20,%esp
    522a:	8b 45 0c             	mov    0xc(%ebp),%eax
    522d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5230:	b8 00 02 00 00       	mov    $0x200,%eax
    5235:	99                   	cltd   
    5236:	f7 7d e8             	idivl  -0x18(%ebp)
    5239:	89 c3                	mov    %eax,%ebx
    523b:	89 c8                	mov    %ecx,%eax
    523d:	99                   	cltd   
    523e:	f7 fb                	idiv   %ebx
    5240:	89 55 dc             	mov    %edx,-0x24(%ebp)
    5243:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5249:	8b 45 e8             	mov    -0x18(%ebp),%eax
    524c:	0f af 45 dc          	imul   -0x24(%ebp),%eax
    5250:	01 d0                	add    %edx,%eax
    5252:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5255:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5258:	8b 55 d8             	mov    -0x28(%ebp),%edx
    525b:	8b 0a                	mov    (%edx),%ecx
    525d:	89 08                	mov    %ecx,(%eax)
    525f:	8b 4a 04             	mov    0x4(%edx),%ecx
    5262:	89 48 04             	mov    %ecx,0x4(%eax)
    5265:	8b 4a 08             	mov    0x8(%edx),%ecx
    5268:	89 48 08             	mov    %ecx,0x8(%eax)
    526b:	8b 4a 0c             	mov    0xc(%edx),%ecx
    526e:	89 48 0c             	mov    %ecx,0xc(%eax)
    5271:	8b 4a 10             	mov    0x10(%edx),%ecx
    5274:	89 48 10             	mov    %ecx,0x10(%eax)
    5277:	8b 4a 14             	mov    0x14(%edx),%ecx
    527a:	89 48 14             	mov    %ecx,0x14(%eax)
    527d:	8b 4a 18             	mov    0x18(%edx),%ecx
    5280:	89 48 18             	mov    %ecx,0x18(%eax)
    5283:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    5286:	89 48 1c             	mov    %ecx,0x1c(%eax)
    5289:	8b 4a 20             	mov    0x20(%edx),%ecx
    528c:	89 48 20             	mov    %ecx,0x20(%eax)
    528f:	8b 52 24             	mov    0x24(%edx),%edx
    5292:	89 50 24             	mov    %edx,0x24(%eax)
    5295:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5298:	8b 55 0c             	mov    0xc(%ebp),%edx
    529b:	89 50 10             	mov    %edx,0x10(%eax)
    529e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52a1:	8b 55 e0             	mov    -0x20(%ebp),%edx
    52a4:	89 50 20             	mov    %edx,0x20(%eax)
    52a7:	8b 45 08             	mov    0x8(%ebp),%eax
    52aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    52ad:	8b 0a                	mov    (%edx),%ecx
    52af:	89 08                	mov    %ecx,(%eax)
    52b1:	8b 4a 04             	mov    0x4(%edx),%ecx
    52b4:	89 48 04             	mov    %ecx,0x4(%eax)
    52b7:	8b 4a 08             	mov    0x8(%edx),%ecx
    52ba:	89 48 08             	mov    %ecx,0x8(%eax)
    52bd:	8b 4a 0c             	mov    0xc(%edx),%ecx
    52c0:	89 48 0c             	mov    %ecx,0xc(%eax)
    52c3:	8b 4a 10             	mov    0x10(%edx),%ecx
    52c6:	89 48 10             	mov    %ecx,0x10(%eax)
    52c9:	8b 4a 14             	mov    0x14(%edx),%ecx
    52cc:	89 48 14             	mov    %ecx,0x14(%eax)
    52cf:	8b 4a 18             	mov    0x18(%edx),%ecx
    52d2:	89 48 18             	mov    %ecx,0x18(%eax)
    52d5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    52d8:	89 48 1c             	mov    %ecx,0x1c(%eax)
    52db:	8b 4a 20             	mov    0x20(%edx),%ecx
    52de:	89 48 20             	mov    %ecx,0x20(%eax)
    52e1:	8b 52 24             	mov    0x24(%edx),%edx
    52e4:	89 50 24             	mov    %edx,0x24(%eax)
    52e7:	8b 45 08             	mov    0x8(%ebp),%eax
    52ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
    52ed:	5b                   	pop    %ebx
    52ee:	5e                   	pop    %esi
    52ef:	5d                   	pop    %ebp
    52f0:	c3                   	ret    

000052f1 <create_file>:
    52f1:	55                   	push   %ebp
    52f2:	89 e5                	mov    %esp,%ebp
    52f4:	81 ec 98 00 00 00    	sub    $0x98,%esp
    52fa:	8d 45 b8             	lea    -0x48(%ebp),%eax
    52fd:	50                   	push   %eax
    52fe:	ff 75 0c             	pushl  0xc(%ebp)
    5301:	8d 45 ac             	lea    -0x54(%ebp),%eax
    5304:	50                   	push   %eax
    5305:	e8 59 fd ff ff       	call   5063 <strip_path>
    530a:	83 c4 0c             	add    $0xc,%esp
    530d:	83 f8 ff             	cmp    $0xffffffff,%eax
    5310:	75 0a                	jne    531c <create_file+0x2b>
    5312:	b8 00 00 00 00       	mov    $0x0,%eax
    5317:	e9 de 00 00 00       	jmp    53fa <create_file+0x109>
    531c:	e8 db 00 00 00       	call   53fc <alloc_imap_bit>
    5321:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5324:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5328:	75 0a                	jne    5334 <create_file+0x43>
    532a:	b8 00 00 00 00       	mov    $0x0,%eax
    532f:	e9 c6 00 00 00       	jmp    53fa <create_file+0x109>
    5334:	e8 ab 10 00 00       	call   63e4 <get_super_block>
    5339:	89 45 f0             	mov    %eax,-0x10(%ebp)
    533c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    533f:	8b 40 10             	mov    0x10(%eax),%eax
    5342:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5345:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5348:	83 ec 08             	sub    $0x8,%esp
    534b:	50                   	push   %eax
    534c:	ff 75 f4             	pushl  -0xc(%ebp)
    534f:	e8 a5 01 00 00       	call   54f9 <alloc_smap_bit>
    5354:	83 c4 10             	add    $0x10,%esp
    5357:	89 45 e8             	mov    %eax,-0x18(%ebp)
    535a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    535e:	75 0a                	jne    536a <create_file+0x79>
    5360:	b8 00 00 00 00       	mov    $0x0,%eax
    5365:	e9 90 00 00 00       	jmp    53fa <create_file+0x109>
    536a:	83 ec 04             	sub    $0x4,%esp
    536d:	ff 75 e8             	pushl  -0x18(%ebp)
    5370:	ff 75 f4             	pushl  -0xc(%ebp)
    5373:	8d 45 84             	lea    -0x7c(%ebp),%eax
    5376:	50                   	push   %eax
    5377:	e8 1e 03 00 00       	call   569a <new_inode>
    537c:	83 c4 10             	add    $0x10,%esp
    537f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5382:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    5386:	75 07                	jne    538f <create_file+0x9e>
    5388:	b8 00 00 00 00       	mov    $0x0,%eax
    538d:	eb 6b                	jmp    53fa <create_file+0x109>
    538f:	ff 75 f4             	pushl  -0xc(%ebp)
    5392:	8d 45 ac             	lea    -0x54(%ebp),%eax
    5395:	50                   	push   %eax
    5396:	8d 45 b8             	lea    -0x48(%ebp),%eax
    5399:	50                   	push   %eax
    539a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
    53a0:	50                   	push   %eax
    53a1:	e8 12 04 00 00       	call   57b8 <new_dir_entry>
    53a6:	83 c4 10             	add    $0x10,%esp
    53a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    53ac:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    53b0:	75 07                	jne    53b9 <create_file+0xc8>
    53b2:	b8 00 00 00 00       	mov    $0x0,%eax
    53b7:	eb 41                	jmp    53fa <create_file+0x109>
    53b9:	8b 45 08             	mov    0x8(%ebp),%eax
    53bc:	8b 55 84             	mov    -0x7c(%ebp),%edx
    53bf:	89 10                	mov    %edx,(%eax)
    53c1:	8b 55 88             	mov    -0x78(%ebp),%edx
    53c4:	89 50 04             	mov    %edx,0x4(%eax)
    53c7:	8b 55 8c             	mov    -0x74(%ebp),%edx
    53ca:	89 50 08             	mov    %edx,0x8(%eax)
    53cd:	8b 55 90             	mov    -0x70(%ebp),%edx
    53d0:	89 50 0c             	mov    %edx,0xc(%eax)
    53d3:	8b 55 94             	mov    -0x6c(%ebp),%edx
    53d6:	89 50 10             	mov    %edx,0x10(%eax)
    53d9:	8b 55 98             	mov    -0x68(%ebp),%edx
    53dc:	89 50 14             	mov    %edx,0x14(%eax)
    53df:	8b 55 9c             	mov    -0x64(%ebp),%edx
    53e2:	89 50 18             	mov    %edx,0x18(%eax)
    53e5:	8b 55 a0             	mov    -0x60(%ebp),%edx
    53e8:	89 50 1c             	mov    %edx,0x1c(%eax)
    53eb:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    53ee:	89 50 20             	mov    %edx,0x20(%eax)
    53f1:	8b 55 a8             	mov    -0x58(%ebp),%edx
    53f4:	89 50 24             	mov    %edx,0x24(%eax)
    53f7:	8b 45 08             	mov    0x8(%ebp),%eax
    53fa:	c9                   	leave  
    53fb:	c3                   	ret    

000053fc <alloc_imap_bit>:
    53fc:	55                   	push   %ebp
    53fd:	89 e5                	mov    %esp,%ebp
    53ff:	53                   	push   %ebx
    5400:	83 ec 24             	sub    $0x24,%esp
    5403:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
    540a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    5411:	a1 20 c0 00 00       	mov    0xc020,%eax
    5416:	83 ec 0c             	sub    $0xc,%esp
    5419:	6a 07                	push   $0x7
    541b:	68 00 02 00 00       	push   $0x200
    5420:	50                   	push   %eax
    5421:	ff 75 e8             	pushl  -0x18(%ebp)
    5424:	ff 75 ec             	pushl  -0x14(%ebp)
    5427:	e8 93 f2 ff ff       	call   46bf <rd_wt>
    542c:	83 c4 20             	add    $0x20,%esp
    542f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5436:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    543d:	e9 a5 00 00 00       	jmp    54e7 <alloc_imap_bit+0xeb>
    5442:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5449:	e9 8b 00 00 00       	jmp    54d9 <alloc_imap_bit+0xdd>
    544e:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5454:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5457:	01 d0                	add    %edx,%eax
    5459:	0f b6 00             	movzbl (%eax),%eax
    545c:	0f be d0             	movsbl %al,%edx
    545f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5462:	89 c1                	mov    %eax,%ecx
    5464:	d3 fa                	sar    %cl,%edx
    5466:	89 d0                	mov    %edx,%eax
    5468:	83 e0 01             	and    $0x1,%eax
    546b:	85 c0                	test   %eax,%eax
    546d:	74 06                	je     5475 <alloc_imap_bit+0x79>
    546f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5473:	eb 64                	jmp    54d9 <alloc_imap_bit+0xdd>
    5475:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    547b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    547e:	01 d0                	add    %edx,%eax
    5480:	0f b6 18             	movzbl (%eax),%ebx
    5483:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5486:	ba 01 00 00 00       	mov    $0x1,%edx
    548b:	89 c1                	mov    %eax,%ecx
    548d:	d3 e2                	shl    %cl,%edx
    548f:	89 d0                	mov    %edx,%eax
    5491:	89 c1                	mov    %eax,%ecx
    5493:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5499:	8b 45 f4             	mov    -0xc(%ebp),%eax
    549c:	01 d0                	add    %edx,%eax
    549e:	09 cb                	or     %ecx,%ebx
    54a0:	89 da                	mov    %ebx,%edx
    54a2:	88 10                	mov    %dl,(%eax)
    54a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54a7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    54ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54b1:	01 d0                	add    %edx,%eax
    54b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    54b6:	a1 20 c0 00 00       	mov    0xc020,%eax
    54bb:	83 ec 0c             	sub    $0xc,%esp
    54be:	6a 0a                	push   $0xa
    54c0:	68 00 02 00 00       	push   $0x200
    54c5:	50                   	push   %eax
    54c6:	ff 75 e8             	pushl  -0x18(%ebp)
    54c9:	ff 75 ec             	pushl  -0x14(%ebp)
    54cc:	e8 ee f1 ff ff       	call   46bf <rd_wt>
    54d1:	83 c4 20             	add    $0x20,%esp
    54d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    54d7:	eb 1b                	jmp    54f4 <alloc_imap_bit+0xf8>
    54d9:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    54dd:	0f 8e 6b ff ff ff    	jle    544e <alloc_imap_bit+0x52>
    54e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    54e7:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    54ee:	0f 8e 4e ff ff ff    	jle    5442 <alloc_imap_bit+0x46>
    54f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    54f7:	c9                   	leave  
    54f8:	c3                   	ret    

000054f9 <alloc_smap_bit>:
    54f9:	55                   	push   %ebp
    54fa:	89 e5                	mov    %esp,%ebp
    54fc:	53                   	push   %ebx
    54fd:	83 ec 34             	sub    $0x34,%esp
    5500:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5504:	75 1c                	jne    5522 <alloc_smap_bit+0x29>
    5506:	68 0e 03 00 00       	push   $0x30e
    550b:	68 64 92 00 00       	push   $0x9264
    5510:	68 64 92 00 00       	push   $0x9264
    5515:	68 fa 92 00 00       	push   $0x92fa
    551a:	e8 b3 d7 ff ff       	call   2cd2 <assertion_failure>
    551f:	83 c4 10             	add    $0x10,%esp
    5522:	e8 bd 0e 00 00       	call   63e4 <get_super_block>
    5527:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    552a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    552d:	8b 40 08             	mov    0x8(%eax),%eax
    5530:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5536:	8b 40 04             	mov    0x4(%eax),%eax
    5539:	83 c0 02             	add    $0x2,%eax
    553c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    553f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5546:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    554d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5554:	e9 20 01 00 00       	jmp    5679 <alloc_smap_bit+0x180>
    5559:	8b 55 dc             	mov    -0x24(%ebp),%edx
    555c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    555f:	01 d0                	add    %edx,%eax
    5561:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5564:	a1 20 c0 00 00       	mov    0xc020,%eax
    5569:	83 ec 0c             	sub    $0xc,%esp
    556c:	6a 07                	push   $0x7
    556e:	68 00 02 00 00       	push   $0x200
    5573:	50                   	push   %eax
    5574:	ff 75 d8             	pushl  -0x28(%ebp)
    5577:	ff 75 d4             	pushl  -0x2c(%ebp)
    557a:	e8 40 f1 ff ff       	call   46bf <rd_wt>
    557f:	83 c4 20             	add    $0x20,%esp
    5582:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5589:	e9 b0 00 00 00       	jmp    563e <alloc_smap_bit+0x145>
    558e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5595:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5599:	0f 85 8c 00 00 00    	jne    562b <alloc_smap_bit+0x132>
    559f:	eb 45                	jmp    55e6 <alloc_smap_bit+0xed>
    55a1:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    55a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    55aa:	01 d0                	add    %edx,%eax
    55ac:	0f b6 00             	movzbl (%eax),%eax
    55af:	0f be d0             	movsbl %al,%edx
    55b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    55b5:	89 c1                	mov    %eax,%ecx
    55b7:	d3 fa                	sar    %cl,%edx
    55b9:	89 d0                	mov    %edx,%eax
    55bb:	83 e0 01             	and    $0x1,%eax
    55be:	85 c0                	test   %eax,%eax
    55c0:	74 06                	je     55c8 <alloc_smap_bit+0xcf>
    55c2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    55c6:	eb 1e                	jmp    55e6 <alloc_smap_bit+0xed>
    55c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55cb:	c1 e0 09             	shl    $0x9,%eax
    55ce:	89 c2                	mov    %eax,%edx
    55d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    55d3:	01 d0                	add    %edx,%eax
    55d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    55dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    55df:	01 d0                	add    %edx,%eax
    55e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    55e4:	eb 06                	jmp    55ec <alloc_smap_bit+0xf3>
    55e6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    55ea:	7e b5                	jle    55a1 <alloc_smap_bit+0xa8>
    55ec:	eb 3d                	jmp    562b <alloc_smap_bit+0x132>
    55ee:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    55f2:	74 45                	je     5639 <alloc_smap_bit+0x140>
    55f4:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    55fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    55fd:	01 d0                	add    %edx,%eax
    55ff:	0f b6 18             	movzbl (%eax),%ebx
    5602:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5605:	ba 01 00 00 00       	mov    $0x1,%edx
    560a:	89 c1                	mov    %eax,%ecx
    560c:	d3 e2                	shl    %cl,%edx
    560e:	89 d0                	mov    %edx,%eax
    5610:	89 c1                	mov    %eax,%ecx
    5612:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5618:	8b 45 ec             	mov    -0x14(%ebp),%eax
    561b:	01 d0                	add    %edx,%eax
    561d:	09 cb                	or     %ecx,%ebx
    561f:	89 da                	mov    %ebx,%edx
    5621:	88 10                	mov    %dl,(%eax)
    5623:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    5627:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    562b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    562f:	74 09                	je     563a <alloc_smap_bit+0x141>
    5631:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    5635:	7e b7                	jle    55ee <alloc_smap_bit+0xf5>
    5637:	eb 01                	jmp    563a <alloc_smap_bit+0x141>
    5639:	90                   	nop
    563a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    563e:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
    5645:	0f 8e 43 ff ff ff    	jle    558e <alloc_smap_bit+0x95>
    564b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    564f:	74 1e                	je     566f <alloc_smap_bit+0x176>
    5651:	a1 20 c0 00 00       	mov    0xc020,%eax
    5656:	83 ec 0c             	sub    $0xc,%esp
    5659:	6a 0a                	push   $0xa
    565b:	68 00 02 00 00       	push   $0x200
    5660:	50                   	push   %eax
    5661:	ff 75 d8             	pushl  -0x28(%ebp)
    5664:	ff 75 d4             	pushl  -0x2c(%ebp)
    5667:	e8 53 f0 ff ff       	call   46bf <rd_wt>
    566c:	83 c4 20             	add    $0x20,%esp
    566f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5673:	74 12                	je     5687 <alloc_smap_bit+0x18e>
    5675:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5679:	8b 45 f0             	mov    -0x10(%ebp),%eax
    567c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    567f:	0f 8c d4 fe ff ff    	jl     5559 <alloc_smap_bit+0x60>
    5685:	eb 01                	jmp    5688 <alloc_smap_bit+0x18f>
    5687:	90                   	nop
    5688:	8b 45 f4             	mov    -0xc(%ebp),%eax
    568b:	8d 50 ff             	lea    -0x1(%eax),%edx
    568e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5691:	8b 00                	mov    (%eax),%eax
    5693:	01 d0                	add    %edx,%eax
    5695:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5698:	c9                   	leave  
    5699:	c3                   	ret    

0000569a <new_inode>:
    569a:	55                   	push   %ebp
    569b:	89 e5                	mov    %esp,%ebp
    569d:	83 ec 38             	sub    $0x38,%esp
    56a0:	83 ec 08             	sub    $0x8,%esp
    56a3:	ff 75 0c             	pushl  0xc(%ebp)
    56a6:	8d 45 c8             	lea    -0x38(%ebp),%eax
    56a9:	50                   	push   %eax
    56aa:	e8 80 fa ff ff       	call   512f <get_inode>
    56af:	83 c4 10             	add    $0x10,%esp
    56b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    56b5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    56b9:	75 0a                	jne    56c5 <new_inode+0x2b>
    56bb:	b8 00 00 00 00       	mov    $0x0,%eax
    56c0:	e9 f1 00 00 00       	jmp    57b6 <new_inode+0x11c>
    56c5:	8b 45 10             	mov    0x10(%ebp),%eax
    56c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
    56cb:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
    56d2:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    56d9:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
    56e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    56e3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    56e6:	83 ec 0c             	sub    $0xc,%esp
    56e9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    56ec:	50                   	push   %eax
    56ed:	e8 0e 0b 00 00       	call   6200 <sync_inode>
    56f2:	83 c4 10             	add    $0x10,%esp
    56f5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    56fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5703:	eb 1d                	jmp    5722 <new_inode+0x88>
    5705:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5708:	89 d0                	mov    %edx,%eax
    570a:	c1 e0 02             	shl    $0x2,%eax
    570d:	01 d0                	add    %edx,%eax
    570f:	c1 e0 03             	shl    $0x3,%eax
    5712:	05 50 07 01 00       	add    $0x10750,%eax
    5717:	8b 00                	mov    (%eax),%eax
    5719:	39 45 0c             	cmp    %eax,0xc(%ebp)
    571c:	74 0c                	je     572a <new_inode+0x90>
    571e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5722:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    5726:	7e dd                	jle    5705 <new_inode+0x6b>
    5728:	eb 01                	jmp    572b <new_inode+0x91>
    572a:	90                   	nop
    572b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    572e:	89 d0                	mov    %edx,%eax
    5730:	c1 e0 02             	shl    $0x2,%eax
    5733:	01 d0                	add    %edx,%eax
    5735:	c1 e0 03             	shl    $0x3,%eax
    5738:	05 40 07 01 00       	add    $0x10740,%eax
    573d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    5740:	89 10                	mov    %edx,(%eax)
    5742:	8b 55 cc             	mov    -0x34(%ebp),%edx
    5745:	89 50 04             	mov    %edx,0x4(%eax)
    5748:	8b 55 d0             	mov    -0x30(%ebp),%edx
    574b:	89 50 08             	mov    %edx,0x8(%eax)
    574e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    5751:	89 50 0c             	mov    %edx,0xc(%eax)
    5754:	8b 55 d8             	mov    -0x28(%ebp),%edx
    5757:	89 50 10             	mov    %edx,0x10(%eax)
    575a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    575d:	89 50 14             	mov    %edx,0x14(%eax)
    5760:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5763:	89 50 18             	mov    %edx,0x18(%eax)
    5766:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    5769:	89 50 1c             	mov    %edx,0x1c(%eax)
    576c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    576f:	89 50 20             	mov    %edx,0x20(%eax)
    5772:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5775:	89 50 24             	mov    %edx,0x24(%eax)
    5778:	8b 45 08             	mov    0x8(%ebp),%eax
    577b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    577e:	89 10                	mov    %edx,(%eax)
    5780:	8b 55 cc             	mov    -0x34(%ebp),%edx
    5783:	89 50 04             	mov    %edx,0x4(%eax)
    5786:	8b 55 d0             	mov    -0x30(%ebp),%edx
    5789:	89 50 08             	mov    %edx,0x8(%eax)
    578c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    578f:	89 50 0c             	mov    %edx,0xc(%eax)
    5792:	8b 55 d8             	mov    -0x28(%ebp),%edx
    5795:	89 50 10             	mov    %edx,0x10(%eax)
    5798:	8b 55 dc             	mov    -0x24(%ebp),%edx
    579b:	89 50 14             	mov    %edx,0x14(%eax)
    579e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    57a1:	89 50 18             	mov    %edx,0x18(%eax)
    57a4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    57a7:	89 50 1c             	mov    %edx,0x1c(%eax)
    57aa:	8b 55 e8             	mov    -0x18(%ebp),%edx
    57ad:	89 50 20             	mov    %edx,0x20(%eax)
    57b0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    57b3:	89 50 24             	mov    %edx,0x24(%eax)
    57b6:	c9                   	leave  
    57b7:	c3                   	ret    

000057b8 <new_dir_entry>:
    57b8:	55                   	push   %ebp
    57b9:	89 e5                	mov    %esp,%ebp
    57bb:	83 ec 48             	sub    $0x48,%esp
    57be:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
    57c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    57c8:	8b 40 04             	mov    0x4(%eax),%eax
    57cb:	99                   	cltd   
    57cc:	f7 7d dc             	idivl  -0x24(%ebp)
    57cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
    57d2:	8b 45 0c             	mov    0xc(%ebp),%eax
    57d5:	8b 40 0c             	mov    0xc(%eax),%eax
    57d8:	99                   	cltd   
    57d9:	f7 7d dc             	idivl  -0x24(%ebp)
    57dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    57df:	e8 00 0c 00 00       	call   63e4 <get_super_block>
    57e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    57e7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    57ea:	8b 00                	mov    (%eax),%eax
    57ec:	89 45 cc             	mov    %eax,-0x34(%ebp)
    57ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    57f2:	8b 40 0c             	mov    0xc(%eax),%eax
    57f5:	05 00 02 00 00       	add    $0x200,%eax
    57fa:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5800:	85 c0                	test   %eax,%eax
    5802:	0f 48 c2             	cmovs  %edx,%eax
    5805:	c1 f8 09             	sar    $0x9,%eax
    5808:	89 45 c8             	mov    %eax,-0x38(%ebp)
    580b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5812:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5819:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
    5820:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5827:	eb 7d                	jmp    58a6 <new_dir_entry+0xee>
    5829:	a1 20 c0 00 00       	mov    0xc020,%eax
    582e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    5831:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5834:	01 ca                	add    %ecx,%edx
    5836:	83 ec 0c             	sub    $0xc,%esp
    5839:	6a 07                	push   $0x7
    583b:	68 00 02 00 00       	push   $0x200
    5840:	50                   	push   %eax
    5841:	ff 75 c4             	pushl  -0x3c(%ebp)
    5844:	52                   	push   %edx
    5845:	e8 75 ee ff ff       	call   46bf <rd_wt>
    584a:	83 c4 20             	add    $0x20,%esp
    584d:	a1 20 c0 00 00       	mov    0xc020,%eax
    5852:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5855:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    585c:	eb 25                	jmp    5883 <new_dir_entry+0xcb>
    585e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5862:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5865:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5868:	7f 29                	jg     5893 <new_dir_entry+0xdb>
    586a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    586d:	8b 00                	mov    (%eax),%eax
    586f:	85 c0                	test   %eax,%eax
    5871:	75 08                	jne    587b <new_dir_entry+0xc3>
    5873:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5876:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5879:	eb 19                	jmp    5894 <new_dir_entry+0xdc>
    587b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    587f:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
    5883:	b8 00 02 00 00       	mov    $0x200,%eax
    5888:	99                   	cltd   
    5889:	f7 7d dc             	idivl  -0x24(%ebp)
    588c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    588f:	7c cd                	jl     585e <new_dir_entry+0xa6>
    5891:	eb 01                	jmp    5894 <new_dir_entry+0xdc>
    5893:	90                   	nop
    5894:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5897:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    589a:	7f 16                	jg     58b2 <new_dir_entry+0xfa>
    589c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    58a0:	75 10                	jne    58b2 <new_dir_entry+0xfa>
    58a2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    58a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58a9:	3b 45 c8             	cmp    -0x38(%ebp),%eax
    58ac:	0f 8c 77 ff ff ff    	jl     5829 <new_dir_entry+0x71>
    58b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    58b5:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    58b8:	75 0a                	jne    58c4 <new_dir_entry+0x10c>
    58ba:	b8 00 00 00 00       	mov    $0x0,%eax
    58bf:	e9 fa 00 00 00       	jmp    59be <new_dir_entry+0x206>
    58c4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    58cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    58cf:	75 1e                	jne    58ef <new_dir_entry+0x137>
    58d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    58d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    58d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    58da:	8b 50 04             	mov    0x4(%eax),%edx
    58dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    58e0:	01 c2                	add    %eax,%edx
    58e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    58e5:	89 50 04             	mov    %edx,0x4(%eax)
    58e8:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
    58ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58f2:	8b 55 14             	mov    0x14(%ebp),%edx
    58f5:	89 10                	mov    %edx,(%eax)
    58f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58fa:	83 c0 04             	add    $0x4,%eax
    58fd:	83 ec 08             	sub    $0x8,%esp
    5900:	ff 75 10             	pushl  0x10(%ebp)
    5903:	50                   	push   %eax
    5904:	e8 d7 3b 00 00       	call   94e0 <Strcpy>
    5909:	83 c4 10             	add    $0x10,%esp
    590c:	8b 45 08             	mov    0x8(%ebp),%eax
    590f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5912:	8b 0a                	mov    (%edx),%ecx
    5914:	89 08                	mov    %ecx,(%eax)
    5916:	8b 4a 04             	mov    0x4(%edx),%ecx
    5919:	89 48 04             	mov    %ecx,0x4(%eax)
    591c:	8b 4a 08             	mov    0x8(%edx),%ecx
    591f:	89 48 08             	mov    %ecx,0x8(%eax)
    5922:	8b 52 0c             	mov    0xc(%edx),%edx
    5925:	89 50 0c             	mov    %edx,0xc(%eax)
    5928:	a1 20 c0 00 00       	mov    0xc020,%eax
    592d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    5930:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5933:	01 ca                	add    %ecx,%edx
    5935:	83 ec 0c             	sub    $0xc,%esp
    5938:	6a 0a                	push   $0xa
    593a:	68 00 02 00 00       	push   $0x200
    593f:	50                   	push   %eax
    5940:	ff 75 c4             	pushl  -0x3c(%ebp)
    5943:	52                   	push   %edx
    5944:	e8 76 ed ff ff       	call   46bf <rd_wt>
    5949:	83 c4 20             	add    $0x20,%esp
    594c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    5950:	74 69                	je     59bb <new_dir_entry+0x203>
    5952:	8b 45 0c             	mov    0xc(%ebp),%eax
    5955:	8b 10                	mov    (%eax),%edx
    5957:	89 15 40 11 01 00    	mov    %edx,0x11140
    595d:	8b 50 04             	mov    0x4(%eax),%edx
    5960:	89 15 44 11 01 00    	mov    %edx,0x11144
    5966:	8b 50 08             	mov    0x8(%eax),%edx
    5969:	89 15 48 11 01 00    	mov    %edx,0x11148
    596f:	8b 50 0c             	mov    0xc(%eax),%edx
    5972:	89 15 4c 11 01 00    	mov    %edx,0x1114c
    5978:	8b 50 10             	mov    0x10(%eax),%edx
    597b:	89 15 50 11 01 00    	mov    %edx,0x11150
    5981:	8b 50 14             	mov    0x14(%eax),%edx
    5984:	89 15 54 11 01 00    	mov    %edx,0x11154
    598a:	8b 50 18             	mov    0x18(%eax),%edx
    598d:	89 15 58 11 01 00    	mov    %edx,0x11158
    5993:	8b 50 1c             	mov    0x1c(%eax),%edx
    5996:	89 15 5c 11 01 00    	mov    %edx,0x1115c
    599c:	8b 50 20             	mov    0x20(%eax),%edx
    599f:	89 15 60 11 01 00    	mov    %edx,0x11160
    59a5:	8b 40 24             	mov    0x24(%eax),%eax
    59a8:	a3 64 11 01 00       	mov    %eax,0x11164
    59ad:	83 ec 0c             	sub    $0xc,%esp
    59b0:	ff 75 0c             	pushl  0xc(%ebp)
    59b3:	e8 48 08 00 00       	call   6200 <sync_inode>
    59b8:	83 c4 10             	add    $0x10,%esp
    59bb:	8b 45 08             	mov    0x8(%ebp),%eax
    59be:	c9                   	leave  
    59bf:	c3                   	ret    

000059c0 <do_unlink>:
    59c0:	55                   	push   %ebp
    59c1:	89 e5                	mov    %esp,%ebp
    59c3:	53                   	push   %ebx
    59c4:	81 ec a4 00 00 00    	sub    $0xa4,%esp
    59ca:	83 ec 08             	sub    $0x8,%esp
    59cd:	ff 75 08             	pushl  0x8(%ebp)
    59d0:	68 0f 93 00 00       	push   $0x930f
    59d5:	e8 53 de ff ff       	call   382d <strcmp>
    59da:	83 c4 10             	add    $0x10,%esp
    59dd:	85 c0                	test   %eax,%eax
    59df:	75 10                	jne    59f1 <do_unlink+0x31>
    59e1:	83 ec 0c             	sub    $0xc,%esp
    59e4:	68 11 93 00 00       	push   $0x9311
    59e9:	e8 c6 d2 ff ff       	call   2cb4 <panic>
    59ee:	83 c4 10             	add    $0x10,%esp
    59f1:	83 ec 0c             	sub    $0xc,%esp
    59f4:	ff 75 08             	pushl  0x8(%ebp)
    59f7:	e8 37 f5 ff ff       	call   4f33 <search_file>
    59fc:	83 c4 10             	add    $0x10,%esp
    59ff:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5a02:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    5a06:	75 10                	jne    5a18 <do_unlink+0x58>
    5a08:	83 ec 0c             	sub    $0xc,%esp
    5a0b:	68 2d 93 00 00       	push   $0x932d
    5a10:	e8 9f d2 ff ff       	call   2cb4 <panic>
    5a15:	83 c4 10             	add    $0x10,%esp
    5a18:	83 ec 08             	sub    $0x8,%esp
    5a1b:	ff 75 d0             	pushl  -0x30(%ebp)
    5a1e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5a24:	50                   	push   %eax
    5a25:	e8 05 f7 ff ff       	call   512f <get_inode>
    5a2a:	83 c4 10             	add    $0x10,%esp
    5a2d:	89 45 cc             	mov    %eax,-0x34(%ebp)
    5a30:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    5a34:	75 10                	jne    5a46 <do_unlink+0x86>
    5a36:	83 ec 0c             	sub    $0xc,%esp
    5a39:	68 2d 93 00 00       	push   $0x932d
    5a3e:	e8 71 d2 ff ff       	call   2cb4 <panic>
    5a43:	83 c4 10             	add    $0x10,%esp
    5a46:	8b 45 88             	mov    -0x78(%ebp),%eax
    5a49:	85 c0                	test   %eax,%eax
    5a4b:	7e 10                	jle    5a5d <do_unlink+0x9d>
    5a4d:	83 ec 0c             	sub    $0xc,%esp
    5a50:	68 48 93 00 00       	push   $0x9348
    5a55:	e8 5a d2 ff ff       	call   2cb4 <panic>
    5a5a:	83 c4 10             	add    $0x10,%esp
    5a5d:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    5a63:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5a66:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5a69:	8d 50 07             	lea    0x7(%eax),%edx
    5a6c:	85 c0                	test   %eax,%eax
    5a6e:	0f 48 c2             	cmovs  %edx,%eax
    5a71:	c1 f8 03             	sar    $0x3,%eax
    5a74:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    5a77:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5a7a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5a80:	85 c0                	test   %eax,%eax
    5a82:	0f 48 c2             	cmovs  %edx,%eax
    5a85:	c1 f8 09             	sar    $0x9,%eax
    5a88:	89 45 c0             	mov    %eax,-0x40(%ebp)
    5a8b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5a8e:	99                   	cltd   
    5a8f:	c1 ea 1d             	shr    $0x1d,%edx
    5a92:	01 d0                	add    %edx,%eax
    5a94:	83 e0 07             	and    $0x7,%eax
    5a97:	29 d0                	sub    %edx,%eax
    5a99:	89 45 bc             	mov    %eax,-0x44(%ebp)
    5a9c:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
    5aa3:	a1 20 c0 00 00       	mov    0xc020,%eax
    5aa8:	8b 55 c0             	mov    -0x40(%ebp),%edx
    5aab:	83 c2 02             	add    $0x2,%edx
    5aae:	83 ec 0c             	sub    $0xc,%esp
    5ab1:	6a 07                	push   $0x7
    5ab3:	68 00 02 00 00       	push   $0x200
    5ab8:	50                   	push   %eax
    5ab9:	ff 75 b8             	pushl  -0x48(%ebp)
    5abc:	52                   	push   %edx
    5abd:	e8 fd eb ff ff       	call   46bf <rd_wt>
    5ac2:	83 c4 20             	add    $0x20,%esp
    5ac5:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5acb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5ace:	01 d0                	add    %edx,%eax
    5ad0:	0f b6 10             	movzbl (%eax),%edx
    5ad3:	8b 45 bc             	mov    -0x44(%ebp),%eax
    5ad6:	bb 01 00 00 00       	mov    $0x1,%ebx
    5adb:	89 c1                	mov    %eax,%ecx
    5add:	d3 e3                	shl    %cl,%ebx
    5adf:	89 d8                	mov    %ebx,%eax
    5ae1:	f7 d0                	not    %eax
    5ae3:	89 c3                	mov    %eax,%ebx
    5ae5:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5aeb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5aee:	01 c8                	add    %ecx,%eax
    5af0:	21 da                	and    %ebx,%edx
    5af2:	88 10                	mov    %dl,(%eax)
    5af4:	a1 20 c0 00 00       	mov    0xc020,%eax
    5af9:	8b 55 c0             	mov    -0x40(%ebp),%edx
    5afc:	83 c2 02             	add    $0x2,%edx
    5aff:	83 ec 0c             	sub    $0xc,%esp
    5b02:	6a 0a                	push   $0xa
    5b04:	68 00 02 00 00       	push   $0x200
    5b09:	50                   	push   %eax
    5b0a:	ff 75 b8             	pushl  -0x48(%ebp)
    5b0d:	52                   	push   %edx
    5b0e:	e8 ac eb ff ff       	call   46bf <rd_wt>
    5b13:	83 c4 20             	add    $0x20,%esp
    5b16:	e8 c9 08 00 00       	call   63e4 <get_super_block>
    5b1b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    5b1e:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    5b24:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    5b27:	8b 00                	mov    (%eax),%eax
    5b29:	29 c2                	sub    %eax,%edx
    5b2b:	89 d0                	mov    %edx,%eax
    5b2d:	83 c0 01             	add    $0x1,%eax
    5b30:	89 45 b0             	mov    %eax,-0x50(%ebp)
    5b33:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5b36:	8d 50 07             	lea    0x7(%eax),%edx
    5b39:	85 c0                	test   %eax,%eax
    5b3b:	0f 48 c2             	cmovs  %edx,%eax
    5b3e:	c1 f8 03             	sar    $0x3,%eax
    5b41:	89 45 ac             	mov    %eax,-0x54(%ebp)
    5b44:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5b47:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5b4d:	85 c0                	test   %eax,%eax
    5b4f:	0f 48 c2             	cmovs  %edx,%eax
    5b52:	c1 f8 09             	sar    $0x9,%eax
    5b55:	89 45 a8             	mov    %eax,-0x58(%ebp)
    5b58:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5b5b:	99                   	cltd   
    5b5c:	c1 ea 1d             	shr    $0x1d,%edx
    5b5f:	01 d0                	add    %edx,%eax
    5b61:	83 e0 07             	and    $0x7,%eax
    5b64:	29 d0                	sub    %edx,%eax
    5b66:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    5b69:	b8 08 00 00 00       	mov    $0x8,%eax
    5b6e:	2b 45 a4             	sub    -0x5c(%ebp),%eax
    5b71:	8b 55 b0             	mov    -0x50(%ebp),%edx
    5b74:	29 c2                	sub    %eax,%edx
    5b76:	89 d0                	mov    %edx,%eax
    5b78:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b7e:	8d 50 07             	lea    0x7(%eax),%edx
    5b81:	85 c0                	test   %eax,%eax
    5b83:	0f 48 c2             	cmovs  %edx,%eax
    5b86:	c1 f8 03             	sar    $0x3,%eax
    5b89:	89 45 a0             	mov    %eax,-0x60(%ebp)
    5b8c:	a1 20 c0 00 00       	mov    0xc020,%eax
    5b91:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    5b94:	8b 52 04             	mov    0x4(%edx),%edx
    5b97:	8d 4a 02             	lea    0x2(%edx),%ecx
    5b9a:	8b 55 a8             	mov    -0x58(%ebp),%edx
    5b9d:	01 ca                	add    %ecx,%edx
    5b9f:	83 ec 0c             	sub    $0xc,%esp
    5ba2:	6a 07                	push   $0x7
    5ba4:	68 00 02 00 00       	push   $0x200
    5ba9:	50                   	push   %eax
    5baa:	ff 75 b8             	pushl  -0x48(%ebp)
    5bad:	52                   	push   %edx
    5bae:	e8 0c eb ff ff       	call   46bf <rd_wt>
    5bb3:	83 c4 20             	add    $0x20,%esp
    5bb6:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5bbc:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5bbf:	01 d0                	add    %edx,%eax
    5bc1:	0f b6 10             	movzbl (%eax),%edx
    5bc4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5bc7:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    5bcc:	89 c1                	mov    %eax,%ecx
    5bce:	d3 e3                	shl    %cl,%ebx
    5bd0:	89 d8                	mov    %ebx,%eax
    5bd2:	f7 d0                	not    %eax
    5bd4:	89 c3                	mov    %eax,%ebx
    5bd6:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5bdc:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5bdf:	01 c8                	add    %ecx,%eax
    5be1:	21 da                	and    %ebx,%edx
    5be3:	88 10                	mov    %dl,(%eax)
    5be5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    5bec:	8b 45 a8             	mov    -0x58(%ebp),%eax
    5bef:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5bf2:	eb 6a                	jmp    5c5e <do_unlink+0x29e>
    5bf4:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    5bfb:	75 4b                	jne    5c48 <do_unlink+0x288>
    5bfd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5c04:	a1 20 c0 00 00       	mov    0xc020,%eax
    5c09:	83 ec 0c             	sub    $0xc,%esp
    5c0c:	6a 0a                	push   $0xa
    5c0e:	68 00 02 00 00       	push   $0x200
    5c13:	50                   	push   %eax
    5c14:	ff 75 b8             	pushl  -0x48(%ebp)
    5c17:	ff 75 ec             	pushl  -0x14(%ebp)
    5c1a:	e8 a0 ea ff ff       	call   46bf <rd_wt>
    5c1f:	83 c4 20             	add    $0x20,%esp
    5c22:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5c28:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5c2b:	8d 48 01             	lea    0x1(%eax),%ecx
    5c2e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    5c31:	83 ec 0c             	sub    $0xc,%esp
    5c34:	6a 07                	push   $0x7
    5c36:	68 00 02 00 00       	push   $0x200
    5c3b:	52                   	push   %edx
    5c3c:	ff 75 b8             	pushl  -0x48(%ebp)
    5c3f:	50                   	push   %eax
    5c40:	e8 7a ea ff ff       	call   46bf <rd_wt>
    5c45:	83 c4 20             	add    $0x20,%esp
    5c48:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5c4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5c51:	01 d0                	add    %edx,%eax
    5c53:	c6 00 00             	movb   $0x0,(%eax)
    5c56:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5c5a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
    5c5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5c61:	3b 45 a0             	cmp    -0x60(%ebp),%eax
    5c64:	7c 8e                	jl     5bf4 <do_unlink+0x234>
    5c66:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    5c6d:	75 4b                	jne    5cba <do_unlink+0x2fa>
    5c6f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5c76:	a1 20 c0 00 00       	mov    0xc020,%eax
    5c7b:	83 ec 0c             	sub    $0xc,%esp
    5c7e:	6a 0a                	push   $0xa
    5c80:	68 00 02 00 00       	push   $0x200
    5c85:	50                   	push   %eax
    5c86:	ff 75 b8             	pushl  -0x48(%ebp)
    5c89:	ff 75 ec             	pushl  -0x14(%ebp)
    5c8c:	e8 2e ea ff ff       	call   46bf <rd_wt>
    5c91:	83 c4 20             	add    $0x20,%esp
    5c94:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5c9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5c9d:	8d 48 01             	lea    0x1(%eax),%ecx
    5ca0:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    5ca3:	83 ec 0c             	sub    $0xc,%esp
    5ca6:	6a 07                	push   $0x7
    5ca8:	68 00 02 00 00       	push   $0x200
    5cad:	52                   	push   %edx
    5cae:	ff 75 b8             	pushl  -0x48(%ebp)
    5cb1:	50                   	push   %eax
    5cb2:	e8 08 ea ff ff       	call   46bf <rd_wt>
    5cb7:	83 c4 20             	add    $0x20,%esp
    5cba:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5cc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5cc3:	01 d0                	add    %edx,%eax
    5cc5:	0f b6 10             	movzbl (%eax),%edx
    5cc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5ccb:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    5cd0:	89 c1                	mov    %eax,%ecx
    5cd2:	d3 e3                	shl    %cl,%ebx
    5cd4:	89 d8                	mov    %ebx,%eax
    5cd6:	89 c3                	mov    %eax,%ebx
    5cd8:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5cde:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ce1:	01 c8                	add    %ecx,%eax
    5ce3:	21 da                	and    %ebx,%edx
    5ce5:	88 10                	mov    %dl,(%eax)
    5ce7:	a1 20 c0 00 00       	mov    0xc020,%eax
    5cec:	83 ec 0c             	sub    $0xc,%esp
    5cef:	6a 0a                	push   $0xa
    5cf1:	68 00 02 00 00       	push   $0x200
    5cf6:	50                   	push   %eax
    5cf7:	ff 75 b8             	pushl  -0x48(%ebp)
    5cfa:	ff 75 ec             	pushl  -0x14(%ebp)
    5cfd:	e8 bd e9 ff ff       	call   46bf <rd_wt>
    5d02:	83 c4 20             	add    $0x20,%esp
    5d05:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
    5d0c:	00 00 00 
    5d0f:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
    5d16:	00 00 00 
    5d19:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
    5d20:	00 00 00 
    5d23:	83 ec 0c             	sub    $0xc,%esp
    5d26:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5d2c:	50                   	push   %eax
    5d2d:	e8 ce 04 00 00       	call   6200 <sync_inode>
    5d32:	83 c4 10             	add    $0x10,%esp
    5d35:	83 ec 0c             	sub    $0xc,%esp
    5d38:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5d3e:	50                   	push   %eax
    5d3f:	e8 10 06 00 00       	call   6354 <put_inode>
    5d44:	83 c4 10             	add    $0x10,%esp
    5d47:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    5d4a:	8b 00                	mov    (%eax),%eax
    5d4c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5d4f:	c7 45 98 40 11 01 00 	movl   $0x11140,-0x68(%ebp)
    5d56:	8b 45 98             	mov    -0x68(%ebp),%eax
    5d59:	8b 40 04             	mov    0x4(%eax),%eax
    5d5c:	89 45 94             	mov    %eax,-0x6c(%ebp)
    5d5f:	8b 45 98             	mov    -0x68(%ebp),%eax
    5d62:	8b 40 0c             	mov    0xc(%eax),%eax
    5d65:	89 45 90             	mov    %eax,-0x70(%ebp)
    5d68:	8b 45 94             	mov    -0x6c(%ebp),%eax
    5d6b:	c1 e8 04             	shr    $0x4,%eax
    5d6e:	89 45 8c             	mov    %eax,-0x74(%ebp)
    5d71:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5d78:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5d7f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    5d86:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    5d8d:	e9 a3 00 00 00       	jmp    5e35 <do_unlink+0x475>
    5d92:	a1 20 c0 00 00       	mov    0xc020,%eax
    5d97:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    5d9a:	8b 55 d8             	mov    -0x28(%ebp),%edx
    5d9d:	01 ca                	add    %ecx,%edx
    5d9f:	83 ec 0c             	sub    $0xc,%esp
    5da2:	6a 07                	push   $0x7
    5da4:	68 00 02 00 00       	push   $0x200
    5da9:	50                   	push   %eax
    5daa:	ff 75 b8             	pushl  -0x48(%ebp)
    5dad:	52                   	push   %edx
    5dae:	e8 0c e9 ff ff       	call   46bf <rd_wt>
    5db3:	83 c4 20             	add    $0x20,%esp
    5db6:	a1 20 c0 00 00       	mov    0xc020,%eax
    5dbb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5dbe:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    5dc5:	eb 51                	jmp    5e18 <do_unlink+0x458>
    5dc7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    5dcb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5dce:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    5dd1:	7f 4f                	jg     5e22 <do_unlink+0x462>
    5dd3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5dd6:	83 c0 10             	add    $0x10,%eax
    5dd9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5ddc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5ddf:	83 c0 04             	add    $0x4,%eax
    5de2:	83 ec 08             	sub    $0x8,%esp
    5de5:	ff 75 08             	pushl  0x8(%ebp)
    5de8:	50                   	push   %eax
    5de9:	e8 3f da ff ff       	call   382d <strcmp>
    5dee:	83 c4 10             	add    $0x10,%esp
    5df1:	85 c0                	test   %eax,%eax
    5df3:	75 1b                	jne    5e10 <do_unlink+0x450>
    5df5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    5dfc:	83 ec 04             	sub    $0x4,%esp
    5dff:	6a 10                	push   $0x10
    5e01:	6a 00                	push   $0x0
    5e03:	ff 75 d4             	pushl  -0x2c(%ebp)
    5e06:	e8 b6 36 00 00       	call   94c1 <Memset>
    5e0b:	83 c4 10             	add    $0x10,%esp
    5e0e:	eb 13                	jmp    5e23 <do_unlink+0x463>
    5e10:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    5e14:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
    5e18:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5e1b:	3b 45 90             	cmp    -0x70(%ebp),%eax
    5e1e:	7c a7                	jl     5dc7 <do_unlink+0x407>
    5e20:	eb 01                	jmp    5e23 <do_unlink+0x463>
    5e22:	90                   	nop
    5e23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e26:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    5e29:	7f 16                	jg     5e41 <do_unlink+0x481>
    5e2b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    5e2f:	75 10                	jne    5e41 <do_unlink+0x481>
    5e31:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    5e35:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5e38:	3b 45 90             	cmp    -0x70(%ebp),%eax
    5e3b:	0f 8c 51 ff ff ff    	jl     5d92 <do_unlink+0x3d2>
    5e41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e44:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    5e47:	75 17                	jne    5e60 <do_unlink+0x4a0>
    5e49:	8b 45 98             	mov    -0x68(%ebp),%eax
    5e4c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5e4f:	89 50 04             	mov    %edx,0x4(%eax)
    5e52:	83 ec 0c             	sub    $0xc,%esp
    5e55:	ff 75 98             	pushl  -0x68(%ebp)
    5e58:	e8 a3 03 00 00       	call   6200 <sync_inode>
    5e5d:	83 c4 10             	add    $0x10,%esp
    5e60:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    5e64:	74 24                	je     5e8a <do_unlink+0x4ca>
    5e66:	a1 20 c0 00 00       	mov    0xc020,%eax
    5e6b:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    5e6e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5e71:	01 ca                	add    %ecx,%edx
    5e73:	83 ec 0c             	sub    $0xc,%esp
    5e76:	6a 0a                	push   $0xa
    5e78:	68 00 02 00 00       	push   $0x200
    5e7d:	50                   	push   %eax
    5e7e:	ff 75 b8             	pushl  -0x48(%ebp)
    5e81:	52                   	push   %edx
    5e82:	e8 38 e8 ff ff       	call   46bf <rd_wt>
    5e87:	83 c4 20             	add    $0x20,%esp
    5e8a:	90                   	nop
    5e8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5e8e:	c9                   	leave  
    5e8f:	c3                   	ret    

00005e90 <do_rdwt>:
    5e90:	55                   	push   %ebp
    5e91:	89 e5                	mov    %esp,%ebp
    5e93:	81 ec a8 00 00 00    	sub    $0xa8,%esp
    5e99:	8b 45 08             	mov    0x8(%ebp),%eax
    5e9c:	8b 40 68             	mov    0x68(%eax),%eax
    5e9f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    5ea2:	8b 45 08             	mov    0x8(%ebp),%eax
    5ea5:	8b 40 50             	mov    0x50(%eax),%eax
    5ea8:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5eab:	8b 45 08             	mov    0x8(%ebp),%eax
    5eae:	8b 40 5c             	mov    0x5c(%eax),%eax
    5eb1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5eb4:	8b 45 08             	mov    0x8(%ebp),%eax
    5eb7:	8b 00                	mov    (%eax),%eax
    5eb9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5ebc:	8b 45 08             	mov    0x8(%ebp),%eax
    5ebf:	8b 40 10             	mov    0x10(%eax),%eax
    5ec2:	89 45 cc             	mov    %eax,-0x34(%ebp)
    5ec5:	8b 45 08             	mov    0x8(%ebp),%eax
    5ec8:	8b 40 40             	mov    0x40(%eax),%eax
    5ecb:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5ece:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5ed1:	6b d0 68             	imul   $0x68,%eax,%edx
    5ed4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5ed7:	01 d0                	add    %edx,%eax
    5ed9:	83 c0 1c             	add    $0x1c,%eax
    5edc:	8b 04 85 8c 11 08 00 	mov    0x8118c(,%eax,4),%eax
    5ee3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    5ee6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5ee9:	8b 40 08             	mov    0x8(%eax),%eax
    5eec:	89 45 c0             	mov    %eax,-0x40(%ebp)
    5eef:	8b 45 08             	mov    0x8(%ebp),%eax
    5ef2:	8b 00                	mov    (%eax),%eax
    5ef4:	89 45 bc             	mov    %eax,-0x44(%ebp)
    5ef7:	83 ec 08             	sub    $0x8,%esp
    5efa:	ff 75 c0             	pushl  -0x40(%ebp)
    5efd:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5f03:	50                   	push   %eax
    5f04:	e8 26 f2 ff ff       	call   512f <get_inode>
    5f09:	83 c4 10             	add    $0x10,%esp
    5f0c:	89 45 b8             	mov    %eax,-0x48(%ebp)
    5f0f:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
    5f13:	75 10                	jne    5f25 <do_rdwt+0x95>
    5f15:	83 ec 0c             	sub    $0xc,%esp
    5f18:	68 80 93 00 00       	push   $0x9380
    5f1d:	e8 92 cd ff ff       	call   2cb4 <panic>
    5f22:	83 c4 10             	add    $0x10,%esp
    5f25:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    5f2b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    5f2e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5f31:	8b 40 04             	mov    0x4(%eax),%eax
    5f34:	89 45 b0             	mov    %eax,-0x50(%ebp)
    5f37:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    5f3b:	74 22                	je     5f5f <do_rdwt+0xcf>
    5f3d:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    5f41:	74 1c                	je     5f5f <do_rdwt+0xcf>
    5f43:	68 ba 04 00 00       	push   $0x4ba
    5f48:	68 64 92 00 00       	push   $0x9264
    5f4d:	68 64 92 00 00       	push   $0x9264
    5f52:	68 90 93 00 00       	push   $0x9390
    5f57:	e8 76 cd ff ff       	call   2cd2 <assertion_failure>
    5f5c:	83 c4 10             	add    $0x10,%esp
    5f5f:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
    5f65:	83 f8 01             	cmp    $0x1,%eax
    5f68:	75 4a                	jne    5fb4 <do_rdwt+0x124>
    5f6a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    5f6e:	75 09                	jne    5f79 <do_rdwt+0xe9>
    5f70:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
    5f77:	eb 0d                	jmp    5f86 <do_rdwt+0xf6>
    5f79:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    5f7d:	75 07                	jne    5f86 <do_rdwt+0xf6>
    5f7f:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
    5f86:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5f89:	8b 45 08             	mov    0x8(%ebp),%eax
    5f8c:	89 50 68             	mov    %edx,0x68(%eax)
    5f8f:	8b 55 bc             	mov    -0x44(%ebp),%edx
    5f92:	8b 45 08             	mov    0x8(%ebp),%eax
    5f95:	89 50 58             	mov    %edx,0x58(%eax)
    5f98:	83 ec 04             	sub    $0x4,%esp
    5f9b:	6a 00                	push   $0x0
    5f9d:	ff 75 08             	pushl  0x8(%ebp)
    5fa0:	6a 03                	push   $0x3
    5fa2:	e8 97 d5 ff ff       	call   353e <send_rec>
    5fa7:	83 c4 10             	add    $0x10,%esp
    5faa:	b8 00 00 00 00       	mov    $0x0,%eax
    5faf:	e9 4a 02 00 00       	jmp    61fe <do_rdwt+0x36e>
    5fb4:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    5fb8:	75 12                	jne    5fcc <do_rdwt+0x13c>
    5fba:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5fbd:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
    5fc0:	75 0a                	jne    5fcc <do_rdwt+0x13c>
    5fc2:	b8 00 00 00 00       	mov    $0x0,%eax
    5fc7:	e9 32 02 00 00       	jmp    61fe <do_rdwt+0x36e>
    5fcc:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    5fd0:	75 18                	jne    5fea <do_rdwt+0x15a>
    5fd2:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    5fd8:	c1 e0 09             	shl    $0x9,%eax
    5fdb:	39 45 b0             	cmp    %eax,-0x50(%ebp)
    5fde:	75 0a                	jne    5fea <do_rdwt+0x15a>
    5fe0:	b8 00 00 00 00       	mov    $0x0,%eax
    5fe5:	e9 14 02 00 00       	jmp    61fe <do_rdwt+0x36e>
    5fea:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    5fee:	75 14                	jne    6004 <do_rdwt+0x174>
    5ff0:	8b 55 b0             	mov    -0x50(%ebp),%edx
    5ff3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5ff6:	01 d0                	add    %edx,%eax
    5ff8:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
    5ffb:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
    5fff:	89 45 f0             	mov    %eax,-0x10(%ebp)
    6002:	eb 19                	jmp    601d <do_rdwt+0x18d>
    6004:	8b 55 b0             	mov    -0x50(%ebp),%edx
    6007:	8b 45 d8             	mov    -0x28(%ebp),%eax
    600a:	01 c2                	add    %eax,%edx
    600c:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    6012:	c1 e0 09             	shl    $0x9,%eax
    6015:	39 c2                	cmp    %eax,%edx
    6017:	0f 4e c2             	cmovle %edx,%eax
    601a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    601d:	8b 45 b0             	mov    -0x50(%ebp),%eax
    6020:	99                   	cltd   
    6021:	c1 ea 17             	shr    $0x17,%edx
    6024:	01 d0                	add    %edx,%eax
    6026:	25 ff 01 00 00       	and    $0x1ff,%eax
    602b:	29 d0                	sub    %edx,%eax
    602d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6030:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    6036:	8b 45 b0             	mov    -0x50(%ebp),%eax
    6039:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    603f:	85 c0                	test   %eax,%eax
    6041:	0f 48 c1             	cmovs  %ecx,%eax
    6044:	c1 f8 09             	sar    $0x9,%eax
    6047:	01 d0                	add    %edx,%eax
    6049:	89 45 ac             	mov    %eax,-0x54(%ebp)
    604c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    6052:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6055:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    605b:	85 c0                	test   %eax,%eax
    605d:	0f 48 c1             	cmovs  %ecx,%eax
    6060:	c1 f8 09             	sar    $0x9,%eax
    6063:	01 d0                	add    %edx,%eax
    6065:	89 45 a8             	mov    %eax,-0x58(%ebp)
    6068:	8b 45 a8             	mov    -0x58(%ebp),%eax
    606b:	2b 45 ac             	sub    -0x54(%ebp),%eax
    606e:	ba 00 00 10 00       	mov    $0x100000,%edx
    6073:	39 d0                	cmp    %edx,%eax
    6075:	7d 0b                	jge    6082 <do_rdwt+0x1f2>
    6077:	8b 45 a8             	mov    -0x58(%ebp),%eax
    607a:	2b 45 ac             	sub    -0x54(%ebp),%eax
    607d:	83 c0 01             	add    $0x1,%eax
    6080:	eb 05                	jmp    6087 <do_rdwt+0x1f7>
    6082:	b8 00 00 10 00       	mov    $0x100000,%eax
    6087:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    608a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    608d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6090:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    6097:	8b 45 08             	mov    0x8(%ebp),%eax
    609a:	8b 00                	mov    (%eax),%eax
    609c:	83 ec 0c             	sub    $0xc,%esp
    609f:	50                   	push   %eax
    60a0:	e8 53 05 00 00       	call   65f8 <pid2proc>
    60a5:	83 c4 10             	add    $0x10,%esp
    60a8:	89 45 a0             	mov    %eax,-0x60(%ebp)
    60ab:	8b 45 a0             	mov    -0x60(%ebp),%eax
    60ae:	8b 40 0c             	mov    0xc(%eax),%eax
    60b1:	89 45 9c             	mov    %eax,-0x64(%ebp)
    60b4:	8b 45 9c             	mov    -0x64(%ebp),%eax
    60b7:	83 ec 08             	sub    $0x8,%esp
    60ba:	ff 75 a0             	pushl  -0x60(%ebp)
    60bd:	50                   	push   %eax
    60be:	e8 1e 06 00 00       	call   66e1 <Seg2PhyAddrLDT>
    60c3:	83 c4 10             	add    $0x10,%esp
    60c6:	89 45 98             	mov    %eax,-0x68(%ebp)
    60c9:	8b 55 98             	mov    -0x68(%ebp),%edx
    60cc:	8b 45 cc             	mov    -0x34(%ebp),%eax
    60cf:	01 d0                	add    %edx,%eax
    60d1:	89 45 94             	mov    %eax,-0x6c(%ebp)
    60d4:	8b 45 ac             	mov    -0x54(%ebp),%eax
    60d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    60da:	e9 c7 00 00 00       	jmp    61a6 <do_rdwt+0x316>
    60df:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    60e2:	c1 e0 09             	shl    $0x9,%eax
    60e5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    60e8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    60eb:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
    60ef:	89 45 90             	mov    %eax,-0x70(%ebp)
    60f2:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
    60f9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    60fc:	c1 e0 09             	shl    $0x9,%eax
    60ff:	89 c2                	mov    %eax,%edx
    6101:	a1 20 c0 00 00       	mov    0xc020,%eax
    6106:	83 ec 0c             	sub    $0xc,%esp
    6109:	6a 07                	push   $0x7
    610b:	52                   	push   %edx
    610c:	50                   	push   %eax
    610d:	ff 75 8c             	pushl  -0x74(%ebp)
    6110:	ff 75 e0             	pushl  -0x20(%ebp)
    6113:	e8 a7 e5 ff ff       	call   46bf <rd_wt>
    6118:	83 c4 20             	add    $0x20,%esp
    611b:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    611f:	75 25                	jne    6146 <do_rdwt+0x2b6>
    6121:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    6127:	8b 45 ec             	mov    -0x14(%ebp),%eax
    612a:	01 d0                	add    %edx,%eax
    612c:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
    612f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    6132:	01 ca                	add    %ecx,%edx
    6134:	83 ec 04             	sub    $0x4,%esp
    6137:	ff 75 90             	pushl  -0x70(%ebp)
    613a:	50                   	push   %eax
    613b:	52                   	push   %edx
    613c:	e8 52 33 00 00       	call   9493 <Memcpy>
    6141:	83 c4 10             	add    $0x10,%esp
    6144:	eb 47                	jmp    618d <do_rdwt+0x2fd>
    6146:	8b 55 94             	mov    -0x6c(%ebp),%edx
    6149:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    614c:	01 d0                	add    %edx,%eax
    614e:	89 c1                	mov    %eax,%ecx
    6150:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    6156:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6159:	01 d0                	add    %edx,%eax
    615b:	83 ec 04             	sub    $0x4,%esp
    615e:	ff 75 90             	pushl  -0x70(%ebp)
    6161:	51                   	push   %ecx
    6162:	50                   	push   %eax
    6163:	e8 2b 33 00 00       	call   9493 <Memcpy>
    6168:	83 c4 10             	add    $0x10,%esp
    616b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    616e:	c1 e0 09             	shl    $0x9,%eax
    6171:	89 c2                	mov    %eax,%edx
    6173:	a1 20 c0 00 00       	mov    0xc020,%eax
    6178:	83 ec 0c             	sub    $0xc,%esp
    617b:	6a 0a                	push   $0xa
    617d:	52                   	push   %edx
    617e:	50                   	push   %eax
    617f:	ff 75 8c             	pushl  -0x74(%ebp)
    6182:	ff 75 e0             	pushl  -0x20(%ebp)
    6185:	e8 35 e5 ff ff       	call   46bf <rd_wt>
    618a:	83 c4 20             	add    $0x20,%esp
    618d:	8b 45 90             	mov    -0x70(%ebp),%eax
    6190:	29 45 e8             	sub    %eax,-0x18(%ebp)
    6193:	8b 45 90             	mov    -0x70(%ebp),%eax
    6196:	01 45 e4             	add    %eax,-0x1c(%ebp)
    6199:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    61a0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    61a3:	01 45 e0             	add    %eax,-0x20(%ebp)
    61a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    61a9:	3b 45 a8             	cmp    -0x58(%ebp),%eax
    61ac:	7f 0a                	jg     61b8 <do_rdwt+0x328>
    61ae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    61b2:	0f 85 27 ff ff ff    	jne    60df <do_rdwt+0x24f>
    61b8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    61bb:	8b 50 04             	mov    0x4(%eax),%edx
    61be:	8b 45 d8             	mov    -0x28(%ebp),%eax
    61c1:	01 c2                	add    %eax,%edx
    61c3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    61c6:	89 50 04             	mov    %edx,0x4(%eax)
    61c9:	8b 55 b0             	mov    -0x50(%ebp),%edx
    61cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    61cf:	01 c2                	add    %eax,%edx
    61d1:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    61d7:	39 c2                	cmp    %eax,%edx
    61d9:	7e 20                	jle    61fb <do_rdwt+0x36b>
    61db:	8b 55 b0             	mov    -0x50(%ebp),%edx
    61de:	8b 45 d8             	mov    -0x28(%ebp),%eax
    61e1:	01 d0                	add    %edx,%eax
    61e3:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
    61e9:	83 ec 0c             	sub    $0xc,%esp
    61ec:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    61f2:	50                   	push   %eax
    61f3:	e8 08 00 00 00       	call   6200 <sync_inode>
    61f8:	83 c4 10             	add    $0x10,%esp
    61fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    61fe:	c9                   	leave  
    61ff:	c3                   	ret    

00006200 <sync_inode>:
    6200:	55                   	push   %ebp
    6201:	89 e5                	mov    %esp,%ebp
    6203:	53                   	push   %ebx
    6204:	83 ec 34             	sub    $0x34,%esp
    6207:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    620e:	eb 74                	jmp    6284 <sync_inode+0x84>
    6210:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6213:	89 d0                	mov    %edx,%eax
    6215:	c1 e0 02             	shl    $0x2,%eax
    6218:	01 d0                	add    %edx,%eax
    621a:	c1 e0 03             	shl    $0x3,%eax
    621d:	05 50 07 01 00       	add    $0x10750,%eax
    6222:	8b 10                	mov    (%eax),%edx
    6224:	8b 45 08             	mov    0x8(%ebp),%eax
    6227:	8b 40 10             	mov    0x10(%eax),%eax
    622a:	39 c2                	cmp    %eax,%edx
    622c:	75 52                	jne    6280 <sync_inode+0x80>
    622e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6231:	89 d0                	mov    %edx,%eax
    6233:	c1 e0 02             	shl    $0x2,%eax
    6236:	01 d0                	add    %edx,%eax
    6238:	c1 e0 03             	shl    $0x3,%eax
    623b:	8d 90 40 07 01 00    	lea    0x10740(%eax),%edx
    6241:	8b 45 08             	mov    0x8(%ebp),%eax
    6244:	8b 08                	mov    (%eax),%ecx
    6246:	89 0a                	mov    %ecx,(%edx)
    6248:	8b 48 04             	mov    0x4(%eax),%ecx
    624b:	89 4a 04             	mov    %ecx,0x4(%edx)
    624e:	8b 48 08             	mov    0x8(%eax),%ecx
    6251:	89 4a 08             	mov    %ecx,0x8(%edx)
    6254:	8b 48 0c             	mov    0xc(%eax),%ecx
    6257:	89 4a 0c             	mov    %ecx,0xc(%edx)
    625a:	8b 48 10             	mov    0x10(%eax),%ecx
    625d:	89 4a 10             	mov    %ecx,0x10(%edx)
    6260:	8b 48 14             	mov    0x14(%eax),%ecx
    6263:	89 4a 14             	mov    %ecx,0x14(%edx)
    6266:	8b 48 18             	mov    0x18(%eax),%ecx
    6269:	89 4a 18             	mov    %ecx,0x18(%edx)
    626c:	8b 48 1c             	mov    0x1c(%eax),%ecx
    626f:	89 4a 1c             	mov    %ecx,0x1c(%edx)
    6272:	8b 48 20             	mov    0x20(%eax),%ecx
    6275:	89 4a 20             	mov    %ecx,0x20(%edx)
    6278:	8b 40 24             	mov    0x24(%eax),%eax
    627b:	89 42 24             	mov    %eax,0x24(%edx)
    627e:	eb 0a                	jmp    628a <sync_inode+0x8a>
    6280:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6284:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    6288:	7e 86                	jle    6210 <sync_inode+0x10>
    628a:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
    6291:	8b 45 08             	mov    0x8(%ebp),%eax
    6294:	8b 40 10             	mov    0x10(%eax),%eax
    6297:	89 45 ec             	mov    %eax,-0x14(%ebp)
    629a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    629d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    62a0:	b8 00 02 00 00       	mov    $0x200,%eax
    62a5:	99                   	cltd   
    62a6:	f7 7d f0             	idivl  -0x10(%ebp)
    62a9:	89 c3                	mov    %eax,%ebx
    62ab:	89 c8                	mov    %ecx,%eax
    62ad:	99                   	cltd   
    62ae:	f7 fb                	idiv   %ebx
    62b0:	89 55 e8             	mov    %edx,-0x18(%ebp)
    62b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    62b6:	8d 48 ff             	lea    -0x1(%eax),%ecx
    62b9:	b8 00 02 00 00       	mov    $0x200,%eax
    62be:	99                   	cltd   
    62bf:	f7 7d f0             	idivl  -0x10(%ebp)
    62c2:	89 c3                	mov    %eax,%ebx
    62c4:	89 c8                	mov    %ecx,%eax
    62c6:	99                   	cltd   
    62c7:	f7 fb                	idiv   %ebx
    62c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    62cc:	8b 45 08             	mov    0x8(%ebp),%eax
    62cf:	8b 40 20             	mov    0x20(%eax),%eax
    62d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    62d5:	e8 0a 01 00 00       	call   63e4 <get_super_block>
    62da:	89 45 dc             	mov    %eax,-0x24(%ebp)
    62dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    62e0:	8b 40 04             	mov    0x4(%eax),%eax
    62e3:	8d 50 02             	lea    0x2(%eax),%edx
    62e6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    62e9:	8b 40 08             	mov    0x8(%eax),%eax
    62ec:	01 c2                	add    %eax,%edx
    62ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    62f1:	01 d0                	add    %edx,%eax
    62f3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    62f6:	a1 20 c0 00 00       	mov    0xc020,%eax
    62fb:	83 ec 0c             	sub    $0xc,%esp
    62fe:	6a 07                	push   $0x7
    6300:	68 00 02 00 00       	push   $0x200
    6305:	50                   	push   %eax
    6306:	ff 75 e0             	pushl  -0x20(%ebp)
    6309:	ff 75 d8             	pushl  -0x28(%ebp)
    630c:	e8 ae e3 ff ff       	call   46bf <rd_wt>
    6311:	83 c4 20             	add    $0x20,%esp
    6314:	a1 20 c0 00 00       	mov    0xc020,%eax
    6319:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    631c:	83 ec 04             	sub    $0x4,%esp
    631f:	ff 75 f0             	pushl  -0x10(%ebp)
    6322:	ff 75 08             	pushl  0x8(%ebp)
    6325:	ff 75 d4             	pushl  -0x2c(%ebp)
    6328:	e8 66 31 00 00       	call   9493 <Memcpy>
    632d:	83 c4 10             	add    $0x10,%esp
    6330:	a1 20 c0 00 00       	mov    0xc020,%eax
    6335:	83 ec 0c             	sub    $0xc,%esp
    6338:	6a 0a                	push   $0xa
    633a:	68 00 02 00 00       	push   $0x200
    633f:	50                   	push   %eax
    6340:	ff 75 e0             	pushl  -0x20(%ebp)
    6343:	ff 75 d8             	pushl  -0x28(%ebp)
    6346:	e8 74 e3 ff ff       	call   46bf <rd_wt>
    634b:	83 c4 20             	add    $0x20,%esp
    634e:	90                   	nop
    634f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    6352:	c9                   	leave  
    6353:	c3                   	ret    

00006354 <put_inode>:
    6354:	55                   	push   %ebp
    6355:	89 e5                	mov    %esp,%ebp
    6357:	83 ec 08             	sub    $0x8,%esp
    635a:	8b 45 08             	mov    0x8(%ebp),%eax
    635d:	8b 40 24             	mov    0x24(%eax),%eax
    6360:	85 c0                	test   %eax,%eax
    6362:	7f 1c                	jg     6380 <put_inode+0x2c>
    6364:	68 54 05 00 00       	push   $0x554
    6369:	68 64 92 00 00       	push   $0x9264
    636e:	68 64 92 00 00       	push   $0x9264
    6373:	68 c4 93 00 00       	push   $0x93c4
    6378:	e8 55 c9 ff ff       	call   2cd2 <assertion_failure>
    637d:	83 c4 10             	add    $0x10,%esp
    6380:	8b 45 08             	mov    0x8(%ebp),%eax
    6383:	8b 40 24             	mov    0x24(%eax),%eax
    6386:	8d 50 ff             	lea    -0x1(%eax),%edx
    6389:	8b 45 08             	mov    0x8(%ebp),%eax
    638c:	89 50 24             	mov    %edx,0x24(%eax)
    638f:	90                   	nop
    6390:	c9                   	leave  
    6391:	c3                   	ret    

00006392 <do_close>:
    6392:	55                   	push   %ebp
    6393:	89 e5                	mov    %esp,%ebp
    6395:	a1 44 db 00 00       	mov    0xdb44,%eax
    639a:	8b 55 08             	mov    0x8(%ebp),%edx
    639d:	83 c2 1c             	add    $0x1c,%edx
    63a0:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    63a4:	8b 50 0c             	mov    0xc(%eax),%edx
    63a7:	83 ea 01             	sub    $0x1,%edx
    63aa:	89 50 0c             	mov    %edx,0xc(%eax)
    63ad:	8b 40 0c             	mov    0xc(%eax),%eax
    63b0:	85 c0                	test   %eax,%eax
    63b2:	75 16                	jne    63ca <do_close+0x38>
    63b4:	a1 44 db 00 00       	mov    0xdb44,%eax
    63b9:	8b 55 08             	mov    0x8(%ebp),%edx
    63bc:	83 c2 1c             	add    $0x1c,%edx
    63bf:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    63c3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    63ca:	a1 44 db 00 00       	mov    0xdb44,%eax
    63cf:	8b 55 08             	mov    0x8(%ebp),%edx
    63d2:	83 c2 1c             	add    $0x1c,%edx
    63d5:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    63dc:	00 
    63dd:	b8 00 00 00 00       	mov    $0x0,%eax
    63e2:	5d                   	pop    %ebp
    63e3:	c3                   	ret    

000063e4 <get_super_block>:
    63e4:	55                   	push   %ebp
    63e5:	89 e5                	mov    %esp,%ebp
    63e7:	83 ec 08             	sub    $0x8,%esp
    63ea:	a1 20 c0 00 00       	mov    0xc020,%eax
    63ef:	83 ec 0c             	sub    $0xc,%esp
    63f2:	6a 07                	push   $0x7
    63f4:	68 00 02 00 00       	push   $0x200
    63f9:	50                   	push   %eax
    63fa:	6a 20                	push   $0x20
    63fc:	6a 01                	push   $0x1
    63fe:	e8 bc e2 ff ff       	call   46bf <rd_wt>
    6403:	83 c4 20             	add    $0x20,%esp
    6406:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    640c:	a1 24 c0 00 00       	mov    0xc024,%eax
    6411:	8b 0a                	mov    (%edx),%ecx
    6413:	89 08                	mov    %ecx,(%eax)
    6415:	8b 4a 04             	mov    0x4(%edx),%ecx
    6418:	89 48 04             	mov    %ecx,0x4(%eax)
    641b:	8b 4a 08             	mov    0x8(%edx),%ecx
    641e:	89 48 08             	mov    %ecx,0x8(%eax)
    6421:	8b 4a 0c             	mov    0xc(%edx),%ecx
    6424:	89 48 0c             	mov    %ecx,0xc(%eax)
    6427:	8b 4a 10             	mov    0x10(%edx),%ecx
    642a:	89 48 10             	mov    %ecx,0x10(%eax)
    642d:	8b 4a 14             	mov    0x14(%edx),%ecx
    6430:	89 48 14             	mov    %ecx,0x14(%eax)
    6433:	8b 4a 18             	mov    0x18(%edx),%ecx
    6436:	89 48 18             	mov    %ecx,0x18(%eax)
    6439:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    643c:	89 48 1c             	mov    %ecx,0x1c(%eax)
    643f:	8b 52 20             	mov    0x20(%edx),%edx
    6442:	89 50 20             	mov    %edx,0x20(%eax)
    6445:	a1 24 c0 00 00       	mov    0xc024,%eax
    644a:	c9                   	leave  
    644b:	c3                   	ret    

0000644c <check>:
    644c:	55                   	push   %ebp
    644d:	89 e5                	mov    %esp,%ebp
    644f:	83 ec 18             	sub    $0x18,%esp
    6452:	c7 45 f4 80 11 08 00 	movl   $0x81180,-0xc(%ebp)
    6459:	eb 59                	jmp    64b4 <check+0x68>
    645b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    645e:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    6464:	85 c0                	test   %eax,%eax
    6466:	74 45                	je     64ad <check+0x61>
    6468:	8b 45 f4             	mov    -0xc(%ebp),%eax
    646b:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    6471:	83 f8 01             	cmp    $0x1,%eax
    6474:	74 37                	je     64ad <check+0x61>
    6476:	c7 05 38 d7 00 00 02 	movl   $0x2802,0xd738
    647d:	28 00 00 
    6480:	83 ec 08             	sub    $0x8,%esp
    6483:	6a 0a                	push   $0xa
    6485:	68 d3 93 00 00       	push   $0x93d3
    648a:	e8 38 ac ff ff       	call   10c7 <disp_str_colour>
    648f:	83 c4 10             	add    $0x10,%esp
    6492:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6495:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    649c:	0f be c0             	movsbl %al,%eax
    649f:	83 ec 0c             	sub    $0xc,%esp
    64a2:	50                   	push   %eax
    64a3:	e8 c9 b1 ff ff       	call   1671 <disp_int>
    64a8:	83 c4 10             	add    $0x10,%esp
    64ab:	eb fe                	jmp    64ab <check+0x5f>
    64ad:	81 45 f4 a0 01 00 00 	addl   $0x1a0,-0xc(%ebp)
    64b4:	b8 a0 19 08 00       	mov    $0x819a0,%eax
    64b9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    64bc:	72 9d                	jb     645b <check+0xf>
    64be:	90                   	nop
    64bf:	c9                   	leave  
    64c0:	c3                   	ret    

000064c1 <schedule_process>:
    64c1:	55                   	push   %ebp
    64c2:	89 e5                	mov    %esp,%ebp
    64c4:	83 ec 10             	sub    $0x10,%esp
    64c7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    64ce:	eb 7e                	jmp    654e <schedule_process+0x8d>
    64d0:	c7 45 fc 80 11 08 00 	movl   $0x81180,-0x4(%ebp)
    64d7:	eb 31                	jmp    650a <schedule_process+0x49>
    64d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    64dc:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    64e3:	84 c0                	test   %al,%al
    64e5:	75 1c                	jne    6503 <schedule_process+0x42>
    64e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    64ea:	8b 40 5c             	mov    0x5c(%eax),%eax
    64ed:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    64f0:	73 11                	jae    6503 <schedule_process+0x42>
    64f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    64f5:	8b 40 5c             	mov    0x5c(%eax),%eax
    64f8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    64fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    64fe:	a3 40 db 00 00       	mov    %eax,0xdb40
    6503:	81 45 fc a0 01 00 00 	addl   $0x1a0,-0x4(%ebp)
    650a:	b8 40 4f 08 00       	mov    $0x84f40,%eax
    650f:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    6512:	72 c5                	jb     64d9 <schedule_process+0x18>
    6514:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    6518:	75 34                	jne    654e <schedule_process+0x8d>
    651a:	c7 45 fc 80 11 08 00 	movl   $0x81180,-0x4(%ebp)
    6521:	eb 21                	jmp    6544 <schedule_process+0x83>
    6523:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6526:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    652d:	84 c0                	test   %al,%al
    652f:	75 0c                	jne    653d <schedule_process+0x7c>
    6531:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6534:	8b 50 60             	mov    0x60(%eax),%edx
    6537:	8b 45 fc             	mov    -0x4(%ebp),%eax
    653a:	89 50 5c             	mov    %edx,0x5c(%eax)
    653d:	81 45 fc a0 01 00 00 	addl   $0x1a0,-0x4(%ebp)
    6544:	b8 40 4f 08 00       	mov    $0x84f40,%eax
    6549:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    654c:	72 d5                	jb     6523 <schedule_process+0x62>
    654e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    6552:	0f 84 78 ff ff ff    	je     64d0 <schedule_process+0xf>
    6558:	a1 40 db 00 00       	mov    0xdb40,%eax
    655d:	8b 40 58             	mov    0x58(%eax),%eax
    6560:	83 f8 07             	cmp    $0x7,%eax
    6563:	75 07                	jne    656c <schedule_process+0xab>
    6565:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
    656c:	90                   	nop
    656d:	c9                   	leave  
    656e:	c3                   	ret    

0000656f <clock_handler>:
    656f:	55                   	push   %ebp
    6570:	89 e5                	mov    %esp,%ebp
    6572:	83 ec 08             	sub    $0x8,%esp
    6575:	a1 40 db 00 00       	mov    0xdb40,%eax
    657a:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    6581:	3c 02                	cmp    $0x2,%al
    6583:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    6588:	83 c0 01             	add    $0x1,%eax
    658b:	a3 a0 fe 00 00       	mov    %eax,0xfea0
    6590:	a1 a0 fe 00 00       	mov    0xfea0,%eax
    6595:	3d cc ab ff 7f       	cmp    $0x7fffabcc,%eax
    659a:	76 0a                	jbe    65a6 <clock_handler+0x37>
    659c:	c7 05 a0 fe 00 00 00 	movl   $0x0,0xfea0
    65a3:	00 00 00 
    65a6:	a1 40 db 00 00       	mov    0xdb40,%eax
    65ab:	8b 40 5c             	mov    0x5c(%eax),%eax
    65ae:	85 c0                	test   %eax,%eax
    65b0:	74 0e                	je     65c0 <clock_handler+0x51>
    65b2:	a1 40 db 00 00       	mov    0xdb40,%eax
    65b7:	8b 50 5c             	mov    0x5c(%eax),%edx
    65ba:	83 ea 01             	sub    $0x1,%edx
    65bd:	89 50 5c             	mov    %edx,0x5c(%eax)
    65c0:	a1 80 f6 00 00       	mov    0xf680,%eax
    65c5:	85 c0                	test   %eax,%eax
    65c7:	74 0d                	je     65d6 <clock_handler+0x67>
    65c9:	83 ec 0c             	sub    $0xc,%esp
    65cc:	6a 00                	push   $0x0
    65ce:	e8 a1 d1 ff ff       	call   3774 <inform_int>
    65d3:	83 c4 10             	add    $0x10,%esp
    65d6:	a1 3c d7 00 00       	mov    0xd73c,%eax
    65db:	85 c0                	test   %eax,%eax
    65dd:	75 13                	jne    65f2 <clock_handler+0x83>
    65df:	a1 40 db 00 00       	mov    0xdb40,%eax
    65e4:	8b 40 5c             	mov    0x5c(%eax),%eax
    65e7:	85 c0                	test   %eax,%eax
    65e9:	75 0a                	jne    65f5 <clock_handler+0x86>
    65eb:	e8 d1 fe ff ff       	call   64c1 <schedule_process>
    65f0:	eb 04                	jmp    65f6 <clock_handler+0x87>
    65f2:	90                   	nop
    65f3:	eb 01                	jmp    65f6 <clock_handler+0x87>
    65f5:	90                   	nop
    65f6:	c9                   	leave  
    65f7:	c3                   	ret    

000065f8 <pid2proc>:
    65f8:	55                   	push   %ebp
    65f9:	89 e5                	mov    %esp,%ebp
    65fb:	83 ec 10             	sub    $0x10,%esp
    65fe:	8b 45 08             	mov    0x8(%ebp),%eax
    6601:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    6607:	05 80 11 08 00       	add    $0x81180,%eax
    660c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    660f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6612:	c9                   	leave  
    6613:	c3                   	ret    

00006614 <proc2pid>:
    6614:	55                   	push   %ebp
    6615:	89 e5                	mov    %esp,%ebp
    6617:	83 ec 10             	sub    $0x10,%esp
    661a:	8b 45 08             	mov    0x8(%ebp),%eax
    661d:	2d 80 11 08 00       	sub    $0x81180,%eax
    6622:	c1 f8 05             	sar    $0x5,%eax
    6625:	69 c0 c5 4e ec c4    	imul   $0xc4ec4ec5,%eax,%eax
    662b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    662e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6631:	c9                   	leave  
    6632:	c3                   	ret    

00006633 <InitDescriptor>:
    6633:	55                   	push   %ebp
    6634:	89 e5                	mov    %esp,%ebp
    6636:	83 ec 04             	sub    $0x4,%esp
    6639:	8b 45 14             	mov    0x14(%ebp),%eax
    663c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
    6640:	8b 45 10             	mov    0x10(%ebp),%eax
    6643:	89 c2                	mov    %eax,%edx
    6645:	8b 45 08             	mov    0x8(%ebp),%eax
    6648:	66 89 10             	mov    %dx,(%eax)
    664b:	8b 45 0c             	mov    0xc(%ebp),%eax
    664e:	89 c2                	mov    %eax,%edx
    6650:	8b 45 08             	mov    0x8(%ebp),%eax
    6653:	66 89 50 02          	mov    %dx,0x2(%eax)
    6657:	8b 45 0c             	mov    0xc(%ebp),%eax
    665a:	c1 e8 10             	shr    $0x10,%eax
    665d:	89 c2                	mov    %eax,%edx
    665f:	8b 45 08             	mov    0x8(%ebp),%eax
    6662:	88 50 04             	mov    %dl,0x4(%eax)
    6665:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    6669:	89 c2                	mov    %eax,%edx
    666b:	8b 45 08             	mov    0x8(%ebp),%eax
    666e:	88 50 05             	mov    %dl,0x5(%eax)
    6671:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    6675:	66 c1 e8 08          	shr    $0x8,%ax
    6679:	c1 e0 04             	shl    $0x4,%eax
    667c:	89 c2                	mov    %eax,%edx
    667e:	8b 45 10             	mov    0x10(%ebp),%eax
    6681:	c1 e8 10             	shr    $0x10,%eax
    6684:	83 e0 0f             	and    $0xf,%eax
    6687:	09 c2                	or     %eax,%edx
    6689:	8b 45 08             	mov    0x8(%ebp),%eax
    668c:	88 50 06             	mov    %dl,0x6(%eax)
    668f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6692:	c1 e8 18             	shr    $0x18,%eax
    6695:	89 c2                	mov    %eax,%edx
    6697:	8b 45 08             	mov    0x8(%ebp),%eax
    669a:	88 50 07             	mov    %dl,0x7(%eax)
    669d:	90                   	nop
    669e:	c9                   	leave  
    669f:	c3                   	ret    

000066a0 <Seg2PhyAddr>:
    66a0:	55                   	push   %ebp
    66a1:	89 e5                	mov    %esp,%ebp
    66a3:	83 ec 10             	sub    $0x10,%esp
    66a6:	8b 45 08             	mov    0x8(%ebp),%eax
    66a9:	c1 e8 03             	shr    $0x3,%eax
    66ac:	8b 14 c5 44 d7 00 00 	mov    0xd744(,%eax,8),%edx
    66b3:	8b 04 c5 40 d7 00 00 	mov    0xd740(,%eax,8),%eax
    66ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    66bd:	89 55 f8             	mov    %edx,-0x8(%ebp)
    66c0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    66c4:	0f b7 c0             	movzwl %ax,%eax
    66c7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    66cb:	0f b6 d2             	movzbl %dl,%edx
    66ce:	c1 e2 10             	shl    $0x10,%edx
    66d1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    66d7:	09 d0                	or     %edx,%eax
    66d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    66dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    66df:	c9                   	leave  
    66e0:	c3                   	ret    

000066e1 <Seg2PhyAddrLDT>:
    66e1:	55                   	push   %ebp
    66e2:	89 e5                	mov    %esp,%ebp
    66e4:	83 ec 10             	sub    $0x10,%esp
    66e7:	8b 45 08             	mov    0x8(%ebp),%eax
    66ea:	c1 e8 03             	shr    $0x3,%eax
    66ed:	89 c2                	mov    %eax,%edx
    66ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    66f2:	83 c2 08             	add    $0x8,%edx
    66f5:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
    66f9:	8b 02                	mov    (%edx),%eax
    66fb:	8b 52 04             	mov    0x4(%edx),%edx
    66fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6701:	89 55 f8             	mov    %edx,-0x8(%ebp)
    6704:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    6708:	0f b7 c0             	movzwl %ax,%eax
    670b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    670f:	0f b6 d2             	movzbl %dl,%edx
    6712:	c1 e2 10             	shl    $0x10,%edx
    6715:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    671b:	09 d0                	or     %edx,%eax
    671d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6720:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6723:	c9                   	leave  
    6724:	c3                   	ret    

00006725 <VirAddr2PhyAddr>:
    6725:	55                   	push   %ebp
    6726:	89 e5                	mov    %esp,%ebp
    6728:	83 ec 10             	sub    $0x10,%esp
    672b:	8b 55 0c             	mov    0xc(%ebp),%edx
    672e:	8b 45 08             	mov    0x8(%ebp),%eax
    6731:	01 d0                	add    %edx,%eax
    6733:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6736:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6739:	c9                   	leave  
    673a:	c3                   	ret    

0000673b <v2l>:
    673b:	55                   	push   %ebp
    673c:	89 e5                	mov    %esp,%ebp
    673e:	83 ec 18             	sub    $0x18,%esp
    6741:	83 ec 0c             	sub    $0xc,%esp
    6744:	ff 75 08             	pushl  0x8(%ebp)
    6747:	e8 ac fe ff ff       	call   65f8 <pid2proc>
    674c:	83 c4 10             	add    $0x10,%esp
    674f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6752:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    6759:	8b 45 f0             	mov    -0x10(%ebp),%eax
    675c:	83 ec 08             	sub    $0x8,%esp
    675f:	ff 75 f4             	pushl  -0xc(%ebp)
    6762:	50                   	push   %eax
    6763:	e8 79 ff ff ff       	call   66e1 <Seg2PhyAddrLDT>
    6768:	83 c4 10             	add    $0x10,%esp
    676b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    676e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6771:	8b 45 0c             	mov    0xc(%ebp),%eax
    6774:	01 d0                	add    %edx,%eax
    6776:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6779:	8b 45 e8             	mov    -0x18(%ebp),%eax
    677c:	c9                   	leave  
    677d:	c3                   	ret    

0000677e <init_propt>:
    677e:	55                   	push   %ebp
    677f:	89 e5                	mov    %esp,%ebp
    6781:	53                   	push   %ebx
    6782:	83 ec 24             	sub    $0x24,%esp
    6785:	6a 0e                	push   $0xe
    6787:	6a 08                	push   $0x8
    6789:	68 6a 11 00 00       	push   $0x116a
    678e:	6a 20                	push   $0x20
    6790:	e8 53 01 00 00       	call   68e8 <InitInterruptDesc>
    6795:	83 c4 10             	add    $0x10,%esp
    6798:	6a 0e                	push   $0xe
    679a:	6a 08                	push   $0x8
    679c:	68 b3 11 00 00       	push   $0x11b3
    67a1:	6a 21                	push   $0x21
    67a3:	e8 40 01 00 00       	call   68e8 <InitInterruptDesc>
    67a8:	83 c4 10             	add    $0x10,%esp
    67ab:	6a 0e                	push   $0xe
    67ad:	6a 08                	push   $0x8
    67af:	68 fc 11 00 00       	push   $0x11fc
    67b4:	6a 2e                	push   $0x2e
    67b6:	e8 2d 01 00 00       	call   68e8 <InitInterruptDesc>
    67bb:	83 c4 10             	add    $0x10,%esp
    67be:	83 ec 04             	sub    $0x4,%esp
    67c1:	68 c0 09 00 00       	push   $0x9c0
    67c6:	6a 00                	push   $0x0
    67c8:	68 80 11 08 00       	push   $0x81180
    67cd:	e8 ef 2c 00 00       	call   94c1 <Memset>
    67d2:	83 c4 10             	add    $0x10,%esp
    67d5:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
    67dc:	83 ec 04             	sub    $0x4,%esp
    67df:	ff 75 f0             	pushl  -0x10(%ebp)
    67e2:	6a 00                	push   $0x0
    67e4:	68 00 f6 00 00       	push   $0xf600
    67e9:	e8 d3 2c 00 00       	call   94c1 <Memset>
    67ee:	83 c4 10             	add    $0x10,%esp
    67f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    67f4:	a3 68 f6 00 00       	mov    %eax,0xf668
    67f9:	c7 05 08 f6 00 00 30 	movl   $0x30,0xf608
    6800:	00 00 00 
    6803:	83 ec 0c             	sub    $0xc,%esp
    6806:	6a 30                	push   $0x30
    6808:	e8 93 fe ff ff       	call   66a0 <Seg2PhyAddr>
    680d:	83 c4 10             	add    $0x10,%esp
    6810:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6813:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6816:	83 ec 08             	sub    $0x8,%esp
    6819:	68 00 f6 00 00       	push   $0xf600
    681e:	50                   	push   %eax
    681f:	e8 01 ff ff ff       	call   6725 <VirAddr2PhyAddr>
    6824:	83 c4 10             	add    $0x10,%esp
    6827:	89 45 e8             	mov    %eax,-0x18(%ebp)
    682a:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
    6831:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6834:	0f b7 d0             	movzwl %ax,%edx
    6837:	8b 45 f0             	mov    -0x10(%ebp),%eax
    683a:	83 e8 01             	sub    $0x1,%eax
    683d:	89 c1                	mov    %eax,%ecx
    683f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6842:	52                   	push   %edx
    6843:	51                   	push   %ecx
    6844:	50                   	push   %eax
    6845:	68 80 d7 00 00       	push   $0xd780
    684a:	e8 e4 fd ff ff       	call   6633 <InitDescriptor>
    684f:	83 c4 10             	add    $0x10,%esp
    6852:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6859:	eb 65                	jmp    68c0 <init_propt+0x142>
    685b:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
    6862:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
    6869:	8b 45 f4             	mov    -0xc(%ebp),%eax
    686c:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    6872:	83 c0 40             	add    $0x40,%eax
    6875:	05 80 11 08 00       	add    $0x81180,%eax
    687a:	8d 50 06             	lea    0x6(%eax),%edx
    687d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6880:	83 ec 08             	sub    $0x8,%esp
    6883:	52                   	push   %edx
    6884:	50                   	push   %eax
    6885:	e8 9b fe ff ff       	call   6725 <VirAddr2PhyAddr>
    688a:	83 c4 10             	add    $0x10,%esp
    688d:	89 45 d8             	mov    %eax,-0x28(%ebp)
    6890:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6893:	0f b7 d0             	movzwl %ax,%edx
    6896:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6899:	83 e8 01             	sub    $0x1,%eax
    689c:	89 c3                	mov    %eax,%ebx
    689e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    68a1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    68a4:	83 c1 09             	add    $0x9,%ecx
    68a7:	c1 e1 03             	shl    $0x3,%ecx
    68aa:	81 c1 40 d7 00 00    	add    $0xd740,%ecx
    68b0:	52                   	push   %edx
    68b1:	53                   	push   %ebx
    68b2:	50                   	push   %eax
    68b3:	51                   	push   %ecx
    68b4:	e8 7a fd ff ff       	call   6633 <InitDescriptor>
    68b9:	83 c4 10             	add    $0x10,%esp
    68bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    68c0:	83 7d f4 25          	cmpl   $0x25,-0xc(%ebp)
    68c4:	7e 95                	jle    685b <init_propt+0xdd>
    68c6:	68 f2 00 00 00       	push   $0xf2
    68cb:	68 ff ff 00 00       	push   $0xffff
    68d0:	68 00 80 0b 00       	push   $0xb8000
    68d5:	68 78 d7 00 00       	push   $0xd778
    68da:	e8 54 fd ff ff       	call   6633 <InitDescriptor>
    68df:	83 c4 10             	add    $0x10,%esp
    68e2:	90                   	nop
    68e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    68e6:	c9                   	leave  
    68e7:	c3                   	ret    

000068e8 <InitInterruptDesc>:
    68e8:	55                   	push   %ebp
    68e9:	89 e5                	mov    %esp,%ebp
    68eb:	83 ec 10             	sub    $0x10,%esp
    68ee:	8b 45 08             	mov    0x8(%ebp),%eax
    68f1:	c1 e0 03             	shl    $0x3,%eax
    68f4:	05 a0 f6 00 00       	add    $0xf6a0,%eax
    68f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    68fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    68ff:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    6903:	8b 45 0c             	mov    0xc(%ebp),%eax
    6906:	89 45 f8             	mov    %eax,-0x8(%ebp)
    6909:	8b 45 f8             	mov    -0x8(%ebp),%eax
    690c:	89 c2                	mov    %eax,%edx
    690e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6911:	66 89 10             	mov    %dx,(%eax)
    6914:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6917:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
    691d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6920:	c1 f8 10             	sar    $0x10,%eax
    6923:	89 c2                	mov    %eax,%edx
    6925:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6928:	66 89 50 06          	mov    %dx,0x6(%eax)
    692c:	8b 45 10             	mov    0x10(%ebp),%eax
    692f:	c1 e0 04             	shl    $0x4,%eax
    6932:	89 c2                	mov    %eax,%edx
    6934:	8b 45 14             	mov    0x14(%ebp),%eax
    6937:	09 d0                	or     %edx,%eax
    6939:	89 c2                	mov    %eax,%edx
    693b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    693e:	88 50 05             	mov    %dl,0x5(%eax)
    6941:	90                   	nop
    6942:	c9                   	leave  
    6943:	c3                   	ret    

00006944 <ReloadGDT>:
    6944:	55                   	push   %ebp
    6945:	89 e5                	mov    %esp,%ebp
    6947:	83 ec 28             	sub    $0x28,%esp
    694a:	b8 88 f6 00 00       	mov    $0xf688,%eax
    694f:	0f b7 00             	movzwl (%eax),%eax
    6952:	98                   	cwtl   
    6953:	ba 8a f6 00 00       	mov    $0xf68a,%edx
    6958:	8b 12                	mov    (%edx),%edx
    695a:	83 ec 04             	sub    $0x4,%esp
    695d:	50                   	push   %eax
    695e:	52                   	push   %edx
    695f:	68 40 d7 00 00       	push   $0xd740
    6964:	e8 2a 2b 00 00       	call   9493 <Memcpy>
    6969:	83 c4 10             	add    $0x10,%esp
    696c:	c7 45 f0 88 f6 00 00 	movl   $0xf688,-0x10(%ebp)
    6973:	c7 45 ec 8a f6 00 00 	movl   $0xf68a,-0x14(%ebp)
    697a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    697d:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
    6982:	ba 40 d7 00 00       	mov    $0xd740,%edx
    6987:	8b 45 ec             	mov    -0x14(%ebp),%eax
    698a:	89 10                	mov    %edx,(%eax)
    698c:	c7 45 e8 28 d7 00 00 	movl   $0xd728,-0x18(%ebp)
    6993:	c7 45 e4 2a d7 00 00 	movl   $0xd72a,-0x1c(%ebp)
    699a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    699d:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
    69a2:	ba a0 f6 00 00       	mov    $0xf6a0,%edx
    69a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    69aa:	89 10                	mov    %edx,(%eax)
    69ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    69b3:	eb 04                	jmp    69b9 <ReloadGDT+0x75>
    69b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    69b9:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    69c0:	7e f3                	jle    69b5 <ReloadGDT+0x71>
    69c2:	e8 74 ae ff ff       	call   183b <init_internal_interrupt>
    69c7:	e8 b2 fd ff ff       	call   677e <init_propt>
    69cc:	90                   	nop
    69cd:	c9                   	leave  
    69ce:	c3                   	ret    

000069cf <select_console>:
    69cf:	55                   	push   %ebp
    69d0:	89 e5                	mov    %esp,%ebp
    69d2:	83 ec 18             	sub    $0x18,%esp
    69d5:	8b 45 08             	mov    0x8(%ebp),%eax
    69d8:	88 45 f4             	mov    %al,-0xc(%ebp)
    69db:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
    69df:	77 27                	ja     6a08 <select_console+0x39>
    69e1:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
    69e5:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    69eb:	05 80 dd 00 00       	add    $0xdd80,%eax
    69f0:	a3 20 d7 00 00       	mov    %eax,0xd720
    69f5:	a1 20 d7 00 00       	mov    0xd720,%eax
    69fa:	83 ec 0c             	sub    $0xc,%esp
    69fd:	50                   	push   %eax
    69fe:	e8 08 00 00 00       	call   6a0b <flush>
    6a03:	83 c4 10             	add    $0x10,%esp
    6a06:	eb 01                	jmp    6a09 <select_console+0x3a>
    6a08:	90                   	nop
    6a09:	c9                   	leave  
    6a0a:	c3                   	ret    

00006a0b <flush>:
    6a0b:	55                   	push   %ebp
    6a0c:	89 e5                	mov    %esp,%ebp
    6a0e:	83 ec 08             	sub    $0x8,%esp
    6a11:	8b 45 08             	mov    0x8(%ebp),%eax
    6a14:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6a1a:	8b 40 0c             	mov    0xc(%eax),%eax
    6a1d:	83 ec 0c             	sub    $0xc,%esp
    6a20:	50                   	push   %eax
    6a21:	e8 1e 00 00 00       	call   6a44 <set_cursor>
    6a26:	83 c4 10             	add    $0x10,%esp
    6a29:	8b 45 08             	mov    0x8(%ebp),%eax
    6a2c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6a32:	8b 40 08             	mov    0x8(%eax),%eax
    6a35:	83 ec 0c             	sub    $0xc,%esp
    6a38:	50                   	push   %eax
    6a39:	e8 64 00 00 00       	call   6aa2 <set_console_start_video_addr>
    6a3e:	83 c4 10             	add    $0x10,%esp
    6a41:	90                   	nop
    6a42:	c9                   	leave  
    6a43:	c3                   	ret    

00006a44 <set_cursor>:
    6a44:	55                   	push   %ebp
    6a45:	89 e5                	mov    %esp,%ebp
    6a47:	83 ec 08             	sub    $0x8,%esp
    6a4a:	83 ec 08             	sub    $0x8,%esp
    6a4d:	6a 0e                	push   $0xe
    6a4f:	68 d4 03 00 00       	push   $0x3d4
    6a54:	e8 86 a8 ff ff       	call   12df <out_byte>
    6a59:	83 c4 10             	add    $0x10,%esp
    6a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    6a5f:	c1 e8 08             	shr    $0x8,%eax
    6a62:	0f b7 c0             	movzwl %ax,%eax
    6a65:	83 ec 08             	sub    $0x8,%esp
    6a68:	50                   	push   %eax
    6a69:	68 d5 03 00 00       	push   $0x3d5
    6a6e:	e8 6c a8 ff ff       	call   12df <out_byte>
    6a73:	83 c4 10             	add    $0x10,%esp
    6a76:	83 ec 08             	sub    $0x8,%esp
    6a79:	6a 0f                	push   $0xf
    6a7b:	68 d4 03 00 00       	push   $0x3d4
    6a80:	e8 5a a8 ff ff       	call   12df <out_byte>
    6a85:	83 c4 10             	add    $0x10,%esp
    6a88:	8b 45 08             	mov    0x8(%ebp),%eax
    6a8b:	0f b7 c0             	movzwl %ax,%eax
    6a8e:	83 ec 08             	sub    $0x8,%esp
    6a91:	50                   	push   %eax
    6a92:	68 d5 03 00 00       	push   $0x3d5
    6a97:	e8 43 a8 ff ff       	call   12df <out_byte>
    6a9c:	83 c4 10             	add    $0x10,%esp
    6a9f:	90                   	nop
    6aa0:	c9                   	leave  
    6aa1:	c3                   	ret    

00006aa2 <set_console_start_video_addr>:
    6aa2:	55                   	push   %ebp
    6aa3:	89 e5                	mov    %esp,%ebp
    6aa5:	83 ec 08             	sub    $0x8,%esp
    6aa8:	83 ec 08             	sub    $0x8,%esp
    6aab:	6a 0c                	push   $0xc
    6aad:	68 d4 03 00 00       	push   $0x3d4
    6ab2:	e8 28 a8 ff ff       	call   12df <out_byte>
    6ab7:	83 c4 10             	add    $0x10,%esp
    6aba:	8b 45 08             	mov    0x8(%ebp),%eax
    6abd:	c1 e8 08             	shr    $0x8,%eax
    6ac0:	0f b7 c0             	movzwl %ax,%eax
    6ac3:	83 ec 08             	sub    $0x8,%esp
    6ac6:	50                   	push   %eax
    6ac7:	68 d5 03 00 00       	push   $0x3d5
    6acc:	e8 0e a8 ff ff       	call   12df <out_byte>
    6ad1:	83 c4 10             	add    $0x10,%esp
    6ad4:	83 ec 08             	sub    $0x8,%esp
    6ad7:	6a 0d                	push   $0xd
    6ad9:	68 d4 03 00 00       	push   $0x3d4
    6ade:	e8 fc a7 ff ff       	call   12df <out_byte>
    6ae3:	83 c4 10             	add    $0x10,%esp
    6ae6:	8b 45 08             	mov    0x8(%ebp),%eax
    6ae9:	0f b7 c0             	movzwl %ax,%eax
    6aec:	83 ec 08             	sub    $0x8,%esp
    6aef:	50                   	push   %eax
    6af0:	68 d5 03 00 00       	push   $0x3d5
    6af5:	e8 e5 a7 ff ff       	call   12df <out_byte>
    6afa:	83 c4 10             	add    $0x10,%esp
    6afd:	90                   	nop
    6afe:	c9                   	leave  
    6aff:	c3                   	ret    

00006b00 <put_key>:
    6b00:	55                   	push   %ebp
    6b01:	89 e5                	mov    %esp,%ebp
    6b03:	83 ec 04             	sub    $0x4,%esp
    6b06:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b09:	88 45 fc             	mov    %al,-0x4(%ebp)
    6b0c:	8b 45 08             	mov    0x8(%ebp),%eax
    6b0f:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6b15:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    6b1a:	77 4d                	ja     6b69 <put_key+0x69>
    6b1c:	8b 45 08             	mov    0x8(%ebp),%eax
    6b1f:	8b 00                	mov    (%eax),%eax
    6b21:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
    6b25:	89 10                	mov    %edx,(%eax)
    6b27:	8b 45 08             	mov    0x8(%ebp),%eax
    6b2a:	8b 00                	mov    (%eax),%eax
    6b2c:	8d 50 04             	lea    0x4(%eax),%edx
    6b2f:	8b 45 08             	mov    0x8(%ebp),%eax
    6b32:	89 10                	mov    %edx,(%eax)
    6b34:	8b 45 08             	mov    0x8(%ebp),%eax
    6b37:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6b3d:	8d 50 01             	lea    0x1(%eax),%edx
    6b40:	8b 45 08             	mov    0x8(%ebp),%eax
    6b43:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
    6b49:	8b 45 08             	mov    0x8(%ebp),%eax
    6b4c:	8b 00                	mov    (%eax),%eax
    6b4e:	8b 55 08             	mov    0x8(%ebp),%edx
    6b51:	83 c2 08             	add    $0x8,%edx
    6b54:	81 c2 00 08 00 00    	add    $0x800,%edx
    6b5a:	39 d0                	cmp    %edx,%eax
    6b5c:	75 0b                	jne    6b69 <put_key+0x69>
    6b5e:	8b 45 08             	mov    0x8(%ebp),%eax
    6b61:	8d 50 08             	lea    0x8(%eax),%edx
    6b64:	8b 45 08             	mov    0x8(%ebp),%eax
    6b67:	89 10                	mov    %edx,(%eax)
    6b69:	90                   	nop
    6b6a:	c9                   	leave  
    6b6b:	c3                   	ret    

00006b6c <scroll_up>:
    6b6c:	55                   	push   %ebp
    6b6d:	89 e5                	mov    %esp,%ebp
    6b6f:	83 ec 08             	sub    $0x8,%esp
    6b72:	8b 45 08             	mov    0x8(%ebp),%eax
    6b75:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6b7b:	8b 40 08             	mov    0x8(%eax),%eax
    6b7e:	8d 50 b0             	lea    -0x50(%eax),%edx
    6b81:	8b 45 08             	mov    0x8(%ebp),%eax
    6b84:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6b8a:	8b 00                	mov    (%eax),%eax
    6b8c:	39 c2                	cmp    %eax,%edx
    6b8e:	76 1b                	jbe    6bab <scroll_up+0x3f>
    6b90:	8b 45 08             	mov    0x8(%ebp),%eax
    6b93:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6b99:	8b 40 08             	mov    0x8(%eax),%eax
    6b9c:	83 e8 50             	sub    $0x50,%eax
    6b9f:	83 ec 0c             	sub    $0xc,%esp
    6ba2:	50                   	push   %eax
    6ba3:	e8 fa fe ff ff       	call   6aa2 <set_console_start_video_addr>
    6ba8:	83 c4 10             	add    $0x10,%esp
    6bab:	90                   	nop
    6bac:	c9                   	leave  
    6bad:	c3                   	ret    

00006bae <scroll_down>:
    6bae:	55                   	push   %ebp
    6baf:	89 e5                	mov    %esp,%ebp
    6bb1:	83 ec 08             	sub    $0x8,%esp
    6bb4:	8b 45 08             	mov    0x8(%ebp),%eax
    6bb7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6bbd:	8b 40 08             	mov    0x8(%eax),%eax
    6bc0:	8d 48 50             	lea    0x50(%eax),%ecx
    6bc3:	8b 45 08             	mov    0x8(%ebp),%eax
    6bc6:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6bcc:	8b 10                	mov    (%eax),%edx
    6bce:	8b 45 08             	mov    0x8(%ebp),%eax
    6bd1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6bd7:	8b 40 04             	mov    0x4(%eax),%eax
    6bda:	01 d0                	add    %edx,%eax
    6bdc:	39 c1                	cmp    %eax,%ecx
    6bde:	73 36                	jae    6c16 <scroll_down+0x68>
    6be0:	8b 45 08             	mov    0x8(%ebp),%eax
    6be3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6be9:	8b 40 08             	mov    0x8(%eax),%eax
    6bec:	83 c0 50             	add    $0x50,%eax
    6bef:	83 ec 0c             	sub    $0xc,%esp
    6bf2:	50                   	push   %eax
    6bf3:	e8 aa fe ff ff       	call   6aa2 <set_console_start_video_addr>
    6bf8:	83 c4 10             	add    $0x10,%esp
    6bfb:	8b 45 08             	mov    0x8(%ebp),%eax
    6bfe:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c04:	8b 50 08             	mov    0x8(%eax),%edx
    6c07:	8b 45 08             	mov    0x8(%ebp),%eax
    6c0a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c10:	83 c2 50             	add    $0x50,%edx
    6c13:	89 50 08             	mov    %edx,0x8(%eax)
    6c16:	90                   	nop
    6c17:	c9                   	leave  
    6c18:	c3                   	ret    

00006c19 <out_char>:
    6c19:	55                   	push   %ebp
    6c1a:	89 e5                	mov    %esp,%ebp
    6c1c:	83 ec 28             	sub    $0x28,%esp
    6c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c22:	88 45 e4             	mov    %al,-0x1c(%ebp)
    6c25:	8b 45 08             	mov    0x8(%ebp),%eax
    6c28:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c2e:	8b 40 0c             	mov    0xc(%eax),%eax
    6c31:	05 00 c0 05 00       	add    $0x5c000,%eax
    6c36:	01 c0                	add    %eax,%eax
    6c38:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6c3b:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    6c3f:	83 f8 08             	cmp    $0x8,%eax
    6c42:	0f 84 8d 00 00 00    	je     6cd5 <out_char+0xbc>
    6c48:	83 f8 0a             	cmp    $0xa,%eax
    6c4b:	0f 85 c9 00 00 00    	jne    6d1a <out_char+0x101>
    6c51:	8b 45 08             	mov    0x8(%ebp),%eax
    6c54:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c5a:	8b 50 0c             	mov    0xc(%eax),%edx
    6c5d:	8b 45 08             	mov    0x8(%ebp),%eax
    6c60:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c66:	8b 08                	mov    (%eax),%ecx
    6c68:	8b 45 08             	mov    0x8(%ebp),%eax
    6c6b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c71:	8b 40 04             	mov    0x4(%eax),%eax
    6c74:	01 c8                	add    %ecx,%eax
    6c76:	83 e8 50             	sub    $0x50,%eax
    6c79:	39 c2                	cmp    %eax,%edx
    6c7b:	0f 83 f4 00 00 00    	jae    6d75 <out_char+0x15c>
    6c81:	8b 45 08             	mov    0x8(%ebp),%eax
    6c84:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c8a:	8b 08                	mov    (%eax),%ecx
    6c8c:	8b 45 08             	mov    0x8(%ebp),%eax
    6c8f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6c95:	8b 50 0c             	mov    0xc(%eax),%edx
    6c98:	8b 45 08             	mov    0x8(%ebp),%eax
    6c9b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ca1:	8b 00                	mov    (%eax),%eax
    6ca3:	29 c2                	sub    %eax,%edx
    6ca5:	89 d0                	mov    %edx,%eax
    6ca7:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    6cac:	f7 e2                	mul    %edx
    6cae:	89 d0                	mov    %edx,%eax
    6cb0:	c1 e8 06             	shr    $0x6,%eax
    6cb3:	8d 50 01             	lea    0x1(%eax),%edx
    6cb6:	89 d0                	mov    %edx,%eax
    6cb8:	c1 e0 02             	shl    $0x2,%eax
    6cbb:	01 d0                	add    %edx,%eax
    6cbd:	c1 e0 04             	shl    $0x4,%eax
    6cc0:	89 c2                	mov    %eax,%edx
    6cc2:	8b 45 08             	mov    0x8(%ebp),%eax
    6cc5:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ccb:	01 ca                	add    %ecx,%edx
    6ccd:	89 50 0c             	mov    %edx,0xc(%eax)
    6cd0:	e9 a0 00 00 00       	jmp    6d75 <out_char+0x15c>
    6cd5:	8b 45 08             	mov    0x8(%ebp),%eax
    6cd8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6cde:	8b 50 0c             	mov    0xc(%eax),%edx
    6ce1:	8b 45 08             	mov    0x8(%ebp),%eax
    6ce4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6cea:	8b 00                	mov    (%eax),%eax
    6cec:	39 c2                	cmp    %eax,%edx
    6cee:	0f 86 84 00 00 00    	jbe    6d78 <out_char+0x15f>
    6cf4:	8b 45 08             	mov    0x8(%ebp),%eax
    6cf7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6cfd:	8b 50 0c             	mov    0xc(%eax),%edx
    6d00:	83 ea 01             	sub    $0x1,%edx
    6d03:	89 50 0c             	mov    %edx,0xc(%eax)
    6d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d09:	83 e8 02             	sub    $0x2,%eax
    6d0c:	c6 00 20             	movb   $0x20,(%eax)
    6d0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d12:	83 e8 01             	sub    $0x1,%eax
    6d15:	c6 00 00             	movb   $0x0,(%eax)
    6d18:	eb 5e                	jmp    6d78 <out_char+0x15f>
    6d1a:	8b 45 08             	mov    0x8(%ebp),%eax
    6d1d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6d23:	8b 40 0c             	mov    0xc(%eax),%eax
    6d26:	8d 48 01             	lea    0x1(%eax),%ecx
    6d29:	8b 45 08             	mov    0x8(%ebp),%eax
    6d2c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6d32:	8b 10                	mov    (%eax),%edx
    6d34:	8b 45 08             	mov    0x8(%ebp),%eax
    6d37:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6d3d:	8b 40 04             	mov    0x4(%eax),%eax
    6d40:	01 d0                	add    %edx,%eax
    6d42:	39 c1                	cmp    %eax,%ecx
    6d44:	73 35                	jae    6d7b <out_char+0x162>
    6d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d49:	8d 50 01             	lea    0x1(%eax),%edx
    6d4c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    6d4f:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
    6d53:	88 10                	mov    %dl,(%eax)
    6d55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d58:	8d 50 01             	lea    0x1(%eax),%edx
    6d5b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    6d5e:	c6 00 0a             	movb   $0xa,(%eax)
    6d61:	8b 45 08             	mov    0x8(%ebp),%eax
    6d64:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6d6a:	8b 50 0c             	mov    0xc(%eax),%edx
    6d6d:	83 c2 01             	add    $0x1,%edx
    6d70:	89 50 0c             	mov    %edx,0xc(%eax)
    6d73:	eb 06                	jmp    6d7b <out_char+0x162>
    6d75:	90                   	nop
    6d76:	eb 14                	jmp    6d8c <out_char+0x173>
    6d78:	90                   	nop
    6d79:	eb 11                	jmp    6d8c <out_char+0x173>
    6d7b:	90                   	nop
    6d7c:	eb 0e                	jmp    6d8c <out_char+0x173>
    6d7e:	83 ec 0c             	sub    $0xc,%esp
    6d81:	ff 75 08             	pushl  0x8(%ebp)
    6d84:	e8 25 fe ff ff       	call   6bae <scroll_down>
    6d89:	83 c4 10             	add    $0x10,%esp
    6d8c:	8b 45 08             	mov    0x8(%ebp),%eax
    6d8f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6d95:	8b 50 0c             	mov    0xc(%eax),%edx
    6d98:	8b 45 08             	mov    0x8(%ebp),%eax
    6d9b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6da1:	8b 40 08             	mov    0x8(%eax),%eax
    6da4:	29 c2                	sub    %eax,%edx
    6da6:	89 d0                	mov    %edx,%eax
    6da8:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    6dad:	77 cf                	ja     6d7e <out_char+0x165>
    6daf:	83 ec 0c             	sub    $0xc,%esp
    6db2:	ff 75 08             	pushl  0x8(%ebp)
    6db5:	e8 51 fc ff ff       	call   6a0b <flush>
    6dba:	83 c4 10             	add    $0x10,%esp
    6dbd:	90                   	nop
    6dbe:	c9                   	leave  
    6dbf:	c3                   	ret    

00006dc0 <tty_dev_read>:
    6dc0:	55                   	push   %ebp
    6dc1:	89 e5                	mov    %esp,%ebp
    6dc3:	83 ec 08             	sub    $0x8,%esp
    6dc6:	a1 20 d7 00 00       	mov    0xd720,%eax
    6dcb:	39 45 08             	cmp    %eax,0x8(%ebp)
    6dce:	75 17                	jne    6de7 <tty_dev_read+0x27>
    6dd0:	a1 68 db 00 00       	mov    0xdb68,%eax
    6dd5:	85 c0                	test   %eax,%eax
    6dd7:	7e 0e                	jle    6de7 <tty_dev_read+0x27>
    6dd9:	83 ec 0c             	sub    $0xc,%esp
    6ddc:	ff 75 08             	pushl  0x8(%ebp)
    6ddf:	e8 f5 06 00 00       	call   74d9 <keyboard_read>
    6de4:	83 c4 10             	add    $0x10,%esp
    6de7:	90                   	nop
    6de8:	c9                   	leave  
    6de9:	c3                   	ret    

00006dea <tty_dev_write>:
    6dea:	55                   	push   %ebp
    6deb:	89 e5                	mov    %esp,%ebp
    6ded:	81 ec 88 00 00 00    	sub    $0x88,%esp
    6df3:	8b 45 08             	mov    0x8(%ebp),%eax
    6df6:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    6dfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6dff:	e9 da 01 00 00       	jmp    6fde <tty_dev_write+0x1f4>
    6e04:	8b 45 08             	mov    0x8(%ebp),%eax
    6e07:	8b 40 04             	mov    0x4(%eax),%eax
    6e0a:	8b 00                	mov    (%eax),%eax
    6e0c:	88 45 f3             	mov    %al,-0xd(%ebp)
    6e0f:	8b 45 08             	mov    0x8(%ebp),%eax
    6e12:	8b 40 04             	mov    0x4(%eax),%eax
    6e15:	8d 50 04             	lea    0x4(%eax),%edx
    6e18:	8b 45 08             	mov    0x8(%ebp),%eax
    6e1b:	89 50 04             	mov    %edx,0x4(%eax)
    6e1e:	8b 45 08             	mov    0x8(%ebp),%eax
    6e21:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6e27:	8d 50 ff             	lea    -0x1(%eax),%edx
    6e2a:	8b 45 08             	mov    0x8(%ebp),%eax
    6e2d:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
    6e33:	8b 45 08             	mov    0x8(%ebp),%eax
    6e36:	8b 40 04             	mov    0x4(%eax),%eax
    6e39:	8b 55 08             	mov    0x8(%ebp),%edx
    6e3c:	83 c2 08             	add    $0x8,%edx
    6e3f:	81 c2 00 08 00 00    	add    $0x800,%edx
    6e45:	39 d0                	cmp    %edx,%eax
    6e47:	75 0c                	jne    6e55 <tty_dev_write+0x6b>
    6e49:	8b 45 08             	mov    0x8(%ebp),%eax
    6e4c:	8d 50 08             	lea    0x8(%eax),%edx
    6e4f:	8b 45 08             	mov    0x8(%ebp),%eax
    6e52:	89 50 04             	mov    %edx,0x4(%eax)
    6e55:	8b 45 08             	mov    0x8(%ebp),%eax
    6e58:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    6e5e:	85 c0                	test   %eax,%eax
    6e60:	0f 84 78 01 00 00    	je     6fde <tty_dev_write+0x1f4>
    6e66:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6e6a:	3c 20                	cmp    $0x20,%al
    6e6c:	76 08                	jbe    6e76 <tty_dev_write+0x8c>
    6e6e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6e72:	3c 7e                	cmp    $0x7e,%al
    6e74:	76 10                	jbe    6e86 <tty_dev_write+0x9c>
    6e76:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6e7a:	3c 20                	cmp    $0x20,%al
    6e7c:	74 08                	je     6e86 <tty_dev_write+0x9c>
    6e7e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6e82:	84 c0                	test   %al,%al
    6e84:	75 7b                	jne    6f01 <tty_dev_write+0x117>
    6e86:	83 ec 08             	sub    $0x8,%esp
    6e89:	8d 45 f3             	lea    -0xd(%ebp),%eax
    6e8c:	50                   	push   %eax
    6e8d:	6a 00                	push   $0x0
    6e8f:	e8 a7 f8 ff ff       	call   673b <v2l>
    6e94:	83 c4 10             	add    $0x10,%esp
    6e97:	89 c1                	mov    %eax,%ecx
    6e99:	8b 45 08             	mov    0x8(%ebp),%eax
    6e9c:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
    6ea2:	8b 45 08             	mov    0x8(%ebp),%eax
    6ea5:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    6eab:	01 d0                	add    %edx,%eax
    6ead:	83 ec 04             	sub    $0x4,%esp
    6eb0:	6a 01                	push   $0x1
    6eb2:	51                   	push   %ecx
    6eb3:	50                   	push   %eax
    6eb4:	e8 da 25 00 00       	call   9493 <Memcpy>
    6eb9:	83 c4 10             	add    $0x10,%esp
    6ebc:	8b 45 08             	mov    0x8(%ebp),%eax
    6ebf:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    6ec5:	8d 50 ff             	lea    -0x1(%eax),%edx
    6ec8:	8b 45 08             	mov    0x8(%ebp),%eax
    6ecb:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    6ed1:	8b 45 08             	mov    0x8(%ebp),%eax
    6ed4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    6eda:	8d 50 01             	lea    0x1(%eax),%edx
    6edd:	8b 45 08             	mov    0x8(%ebp),%eax
    6ee0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    6ee6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6eea:	0f b6 c0             	movzbl %al,%eax
    6eed:	83 ec 08             	sub    $0x8,%esp
    6ef0:	50                   	push   %eax
    6ef1:	ff 75 08             	pushl  0x8(%ebp)
    6ef4:	e8 20 fd ff ff       	call   6c19 <out_char>
    6ef9:	83 c4 10             	add    $0x10,%esp
    6efc:	e9 dd 00 00 00       	jmp    6fde <tty_dev_write+0x1f4>
    6f01:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6f05:	3c 08                	cmp    $0x8,%al
    6f07:	75 45                	jne    6f4e <tty_dev_write+0x164>
    6f09:	8b 45 08             	mov    0x8(%ebp),%eax
    6f0c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    6f12:	8d 50 01             	lea    0x1(%eax),%edx
    6f15:	8b 45 08             	mov    0x8(%ebp),%eax
    6f18:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    6f1e:	8b 45 08             	mov    0x8(%ebp),%eax
    6f21:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    6f27:	8d 50 ff             	lea    -0x1(%eax),%edx
    6f2a:	8b 45 08             	mov    0x8(%ebp),%eax
    6f2d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    6f33:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6f37:	0f b6 c0             	movzbl %al,%eax
    6f3a:	83 ec 08             	sub    $0x8,%esp
    6f3d:	50                   	push   %eax
    6f3e:	ff 75 08             	pushl  0x8(%ebp)
    6f41:	e8 d3 fc ff ff       	call   6c19 <out_char>
    6f46:	83 c4 10             	add    $0x10,%esp
    6f49:	e9 90 00 00 00       	jmp    6fde <tty_dev_write+0x1f4>
    6f4e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6f52:	3c 0a                	cmp    $0xa,%al
    6f54:	74 10                	je     6f66 <tty_dev_write+0x17c>
    6f56:	8b 45 08             	mov    0x8(%ebp),%eax
    6f59:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
    6f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f62:	39 c2                	cmp    %eax,%edx
    6f64:	75 78                	jne    6fde <tty_dev_write+0x1f4>
    6f66:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    6f6a:	0f b6 c0             	movzbl %al,%eax
    6f6d:	83 ec 08             	sub    $0x8,%esp
    6f70:	50                   	push   %eax
    6f71:	ff 75 08             	pushl  0x8(%ebp)
    6f74:	e8 a0 fc ff ff       	call   6c19 <out_char>
    6f79:	83 c4 10             	add    $0x10,%esp
    6f7c:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
    6f83:	8b 45 08             	mov    0x8(%ebp),%eax
    6f86:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    6f8c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    6f8f:	8b 45 08             	mov    0x8(%ebp),%eax
    6f92:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
    6f98:	89 45 dc             	mov    %eax,-0x24(%ebp)
    6f9b:	8b 45 08             	mov    0x8(%ebp),%eax
    6f9e:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
    6fa4:	89 45 94             	mov    %eax,-0x6c(%ebp)
    6fa7:	8b 45 08             	mov    0x8(%ebp),%eax
    6faa:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
    6fb1:	00 00 00 
    6fb4:	8b 45 08             	mov    0x8(%ebp),%eax
    6fb7:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    6fbe:	00 00 00 
    6fc1:	8b 45 08             	mov    0x8(%ebp),%eax
    6fc4:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
    6fca:	83 ec 04             	sub    $0x4,%esp
    6fcd:	50                   	push   %eax
    6fce:	8d 45 84             	lea    -0x7c(%ebp),%eax
    6fd1:	50                   	push   %eax
    6fd2:	6a 01                	push   $0x1
    6fd4:	e8 65 c5 ff ff       	call   353e <send_rec>
    6fd9:	83 c4 10             	add    $0x10,%esp
    6fdc:	eb 11                	jmp    6fef <tty_dev_write+0x205>
    6fde:	8b 45 08             	mov    0x8(%ebp),%eax
    6fe1:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6fe7:	85 c0                	test   %eax,%eax
    6fe9:	0f 85 15 fe ff ff    	jne    6e04 <tty_dev_write+0x1a>
    6fef:	c9                   	leave  
    6ff0:	c3                   	ret    

00006ff1 <tty_do_read>:
    6ff1:	55                   	push   %ebp
    6ff2:	89 e5                	mov    %esp,%ebp
    6ff4:	83 ec 08             	sub    $0x8,%esp
    6ff7:	8b 45 08             	mov    0x8(%ebp),%eax
    6ffa:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    7001:	00 00 00 
    7004:	8b 45 0c             	mov    0xc(%ebp),%eax
    7007:	8b 50 58             	mov    0x58(%eax),%edx
    700a:	8b 45 08             	mov    0x8(%ebp),%eax
    700d:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
    7013:	8b 45 0c             	mov    0xc(%ebp),%eax
    7016:	8b 00                	mov    (%eax),%eax
    7018:	89 c2                	mov    %eax,%edx
    701a:	8b 45 08             	mov    0x8(%ebp),%eax
    701d:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
    7023:	8b 45 0c             	mov    0xc(%ebp),%eax
    7026:	8b 50 50             	mov    0x50(%eax),%edx
    7029:	8b 45 08             	mov    0x8(%ebp),%eax
    702c:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    7032:	8b 45 0c             	mov    0xc(%ebp),%eax
    7035:	8b 40 10             	mov    0x10(%eax),%eax
    7038:	89 c2                	mov    %eax,%edx
    703a:	8b 45 08             	mov    0x8(%ebp),%eax
    703d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
    7043:	83 ec 08             	sub    $0x8,%esp
    7046:	52                   	push   %edx
    7047:	50                   	push   %eax
    7048:	e8 ee f6 ff ff       	call   673b <v2l>
    704d:	83 c4 10             	add    $0x10,%esp
    7050:	89 c2                	mov    %eax,%edx
    7052:	8b 45 08             	mov    0x8(%ebp),%eax
    7055:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
    705b:	8b 45 0c             	mov    0xc(%ebp),%eax
    705e:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
    7065:	8b 45 08             	mov    0x8(%ebp),%eax
    7068:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
    706e:	83 ec 04             	sub    $0x4,%esp
    7071:	50                   	push   %eax
    7072:	ff 75 0c             	pushl  0xc(%ebp)
    7075:	6a 01                	push   $0x1
    7077:	e8 c2 c4 ff ff       	call   353e <send_rec>
    707c:	83 c4 10             	add    $0x10,%esp
    707f:	90                   	nop
    7080:	c9                   	leave  
    7081:	c3                   	ret    

00007082 <tty_do_write>:
    7082:	55                   	push   %ebp
    7083:	89 e5                	mov    %esp,%ebp
    7085:	53                   	push   %ebx
    7086:	81 ec 94 00 00 00    	sub    $0x94,%esp
    708c:	89 e0                	mov    %esp,%eax
    708e:	89 c3                	mov    %eax,%ebx
    7090:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
    7097:	8b 45 e8             	mov    -0x18(%ebp),%eax
    709a:	8d 50 ff             	lea    -0x1(%eax),%edx
    709d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    70a0:	89 c2                	mov    %eax,%edx
    70a2:	b8 10 00 00 00       	mov    $0x10,%eax
    70a7:	83 e8 01             	sub    $0x1,%eax
    70aa:	01 d0                	add    %edx,%eax
    70ac:	b9 10 00 00 00       	mov    $0x10,%ecx
    70b1:	ba 00 00 00 00       	mov    $0x0,%edx
    70b6:	f7 f1                	div    %ecx
    70b8:	6b c0 10             	imul   $0x10,%eax,%eax
    70bb:	29 c4                	sub    %eax,%esp
    70bd:	89 e0                	mov    %esp,%eax
    70bf:	83 c0 00             	add    $0x0,%eax
    70c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    70c5:	83 ec 04             	sub    $0x4,%esp
    70c8:	ff 75 e8             	pushl  -0x18(%ebp)
    70cb:	6a 00                	push   $0x0
    70cd:	ff 75 e0             	pushl  -0x20(%ebp)
    70d0:	e8 ec 23 00 00       	call   94c1 <Memset>
    70d5:	83 c4 10             	add    $0x10,%esp
    70d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    70db:	8b 40 50             	mov    0x50(%eax),%eax
    70de:	89 45 ec             	mov    %eax,-0x14(%ebp)
    70e1:	8b 45 08             	mov    0x8(%ebp),%eax
    70e4:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    70eb:	00 00 00 
    70ee:	e9 98 00 00 00       	jmp    718b <tty_do_write+0x109>
    70f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    70f6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    70f9:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
    70fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7100:	8b 45 0c             	mov    0xc(%ebp),%eax
    7103:	8b 40 10             	mov    0x10(%eax),%eax
    7106:	89 c2                	mov    %eax,%edx
    7108:	8b 45 0c             	mov    0xc(%ebp),%eax
    710b:	8b 40 58             	mov    0x58(%eax),%eax
    710e:	83 ec 08             	sub    $0x8,%esp
    7111:	52                   	push   %edx
    7112:	50                   	push   %eax
    7113:	e8 23 f6 ff ff       	call   673b <v2l>
    7118:	83 c4 10             	add    $0x10,%esp
    711b:	89 c2                	mov    %eax,%edx
    711d:	8b 45 08             	mov    0x8(%ebp),%eax
    7120:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    7126:	01 d0                	add    %edx,%eax
    7128:	83 ec 04             	sub    $0x4,%esp
    712b:	ff 75 f0             	pushl  -0x10(%ebp)
    712e:	50                   	push   %eax
    712f:	ff 75 e0             	pushl  -0x20(%ebp)
    7132:	e8 5c 23 00 00       	call   9493 <Memcpy>
    7137:	83 c4 10             	add    $0x10,%esp
    713a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    713d:	29 45 ec             	sub    %eax,-0x14(%ebp)
    7140:	8b 45 08             	mov    0x8(%ebp),%eax
    7143:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
    7149:	8b 45 f0             	mov    -0x10(%ebp),%eax
    714c:	01 c2                	add    %eax,%edx
    714e:	8b 45 08             	mov    0x8(%ebp),%eax
    7151:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    7157:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    715e:	eb 25                	jmp    7185 <tty_do_write+0x103>
    7160:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7163:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7166:	01 d0                	add    %edx,%eax
    7168:	0f b6 00             	movzbl (%eax),%eax
    716b:	0f b6 c0             	movzbl %al,%eax
    716e:	83 ec 08             	sub    $0x8,%esp
    7171:	50                   	push   %eax
    7172:	ff 75 08             	pushl  0x8(%ebp)
    7175:	e8 9f fa ff ff       	call   6c19 <out_char>
    717a:	83 c4 10             	add    $0x10,%esp
    717d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7181:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    7185:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    7189:	75 d5                	jne    7160 <tty_do_write+0xde>
    718b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    718f:	0f 85 5e ff ff ff    	jne    70f3 <tty_do_write+0x71>
    7195:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
    719c:	8b 45 08             	mov    0x8(%ebp),%eax
    719f:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    71a5:	89 45 bc             	mov    %eax,-0x44(%ebp)
    71a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    71ab:	8b 00                	mov    (%eax),%eax
    71ad:	83 ec 04             	sub    $0x4,%esp
    71b0:	50                   	push   %eax
    71b1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
    71b7:	50                   	push   %eax
    71b8:	6a 01                	push   $0x1
    71ba:	e8 7f c3 ff ff       	call   353e <send_rec>
    71bf:	83 c4 10             	add    $0x10,%esp
    71c2:	89 dc                	mov    %ebx,%esp
    71c4:	90                   	nop
    71c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    71c8:	c9                   	leave  
    71c9:	c3                   	ret    

000071ca <init_screen>:
    71ca:	55                   	push   %ebp
    71cb:	89 e5                	mov    %esp,%ebp
    71cd:	83 ec 10             	sub    $0x10,%esp
    71d0:	8b 45 08             	mov    0x8(%ebp),%eax
    71d3:	2d 80 dd 00 00       	sub    $0xdd80,%eax
    71d8:	c1 f8 02             	sar    $0x2,%eax
    71db:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
    71e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    71e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    71e7:	c1 e0 04             	shl    $0x4,%eax
    71ea:	8d 90 c0 fe 00 00    	lea    0xfec0(%eax),%edx
    71f0:	8b 45 08             	mov    0x8(%ebp),%eax
    71f3:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
    71f9:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
    7200:	8b 45 08             	mov    0x8(%ebp),%eax
    7203:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
    7209:	8b 45 f8             	mov    -0x8(%ebp),%eax
    720c:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    7211:	f7 e2                	mul    %edx
    7213:	89 d0                	mov    %edx,%eax
    7215:	d1 e8                	shr    %eax
    7217:	89 41 04             	mov    %eax,0x4(%ecx)
    721a:	8b 45 08             	mov    0x8(%ebp),%eax
    721d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7223:	8b 50 04             	mov    0x4(%eax),%edx
    7226:	8b 45 08             	mov    0x8(%ebp),%eax
    7229:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    722f:	0f af 55 fc          	imul   -0x4(%ebp),%edx
    7233:	89 10                	mov    %edx,(%eax)
    7235:	8b 45 08             	mov    0x8(%ebp),%eax
    7238:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
    723e:	8b 45 08             	mov    0x8(%ebp),%eax
    7241:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7247:	8b 12                	mov    (%edx),%edx
    7249:	89 50 08             	mov    %edx,0x8(%eax)
    724c:	8b 55 08             	mov    0x8(%ebp),%edx
    724f:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
    7255:	8b 40 08             	mov    0x8(%eax),%eax
    7258:	89 42 0c             	mov    %eax,0xc(%edx)
    725b:	90                   	nop
    725c:	c9                   	leave  
    725d:	c3                   	ret    

0000725e <init_tty>:
    725e:	55                   	push   %ebp
    725f:	89 e5                	mov    %esp,%ebp
    7261:	83 ec 18             	sub    $0x18,%esp
    7264:	c7 45 f4 80 dd 00 00 	movl   $0xdd80,-0xc(%ebp)
    726b:	eb 7a                	jmp    72e7 <init_tty+0x89>
    726d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7270:	8d 50 08             	lea    0x8(%eax),%edx
    7273:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7276:	89 50 04             	mov    %edx,0x4(%eax)
    7279:	8b 45 f4             	mov    -0xc(%ebp),%eax
    727c:	8b 50 04             	mov    0x4(%eax),%edx
    727f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7282:	89 10                	mov    %edx,(%eax)
    7284:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7287:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
    728e:	00 00 00 
    7291:	ff 75 f4             	pushl  -0xc(%ebp)
    7294:	e8 31 ff ff ff       	call   71ca <init_screen>
    7299:	83 c4 04             	add    $0x4,%esp
    729c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    729f:	2d 80 dd 00 00       	sub    $0xdd80,%eax
    72a4:	85 c0                	test   %eax,%eax
    72a6:	7e 38                	jle    72e0 <init_tty+0x82>
    72a8:	83 ec 08             	sub    $0x8,%esp
    72ab:	6a 23                	push   $0x23
    72ad:	ff 75 f4             	pushl  -0xc(%ebp)
    72b0:	e8 64 f9 ff ff       	call   6c19 <out_char>
    72b5:	83 c4 10             	add    $0x10,%esp
    72b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    72bb:	05 e4 8e 01 00       	add    $0x18ee4,%eax
    72c0:	2d 80 dd 00 00       	sub    $0xdd80,%eax
    72c5:	c1 f8 02             	sar    $0x2,%eax
    72c8:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
    72ce:	0f b6 c0             	movzbl %al,%eax
    72d1:	83 ec 08             	sub    $0x8,%esp
    72d4:	50                   	push   %eax
    72d5:	ff 75 f4             	pushl  -0xc(%ebp)
    72d8:	e8 3c f9 ff ff       	call   6c19 <out_char>
    72dd:	83 c4 10             	add    $0x10,%esp
    72e0:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
    72e7:	b8 ec f5 00 00       	mov    $0xf5ec,%eax
    72ec:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    72ef:	0f 82 78 ff ff ff    	jb     726d <init_tty+0xf>
    72f5:	90                   	nop
    72f6:	c9                   	leave  
    72f7:	c3                   	ret    

000072f8 <TaskTTY>:
    72f8:	55                   	push   %ebp
    72f9:	89 e5                	mov    %esp,%ebp
    72fb:	81 ec 88 00 00 00    	sub    $0x88,%esp
    7301:	e8 58 ff ff ff       	call   725e <init_tty>
    7306:	83 ec 0c             	sub    $0xc,%esp
    7309:	6a 01                	push   $0x1
    730b:	e8 bf f6 ff ff       	call   69cf <select_console>
    7310:	83 c4 10             	add    $0x10,%esp
    7313:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    731a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7321:	c7 45 f4 80 dd 00 00 	movl   $0xdd80,-0xc(%ebp)
    7328:	eb 30                	jmp    735a <TaskTTY+0x62>
    732a:	83 ec 0c             	sub    $0xc,%esp
    732d:	ff 75 f4             	pushl  -0xc(%ebp)
    7330:	e8 8b fa ff ff       	call   6dc0 <tty_dev_read>
    7335:	83 c4 10             	add    $0x10,%esp
    7338:	83 ec 0c             	sub    $0xc,%esp
    733b:	ff 75 f4             	pushl  -0xc(%ebp)
    733e:	e8 a7 fa ff ff       	call   6dea <tty_dev_write>
    7343:	83 c4 10             	add    $0x10,%esp
    7346:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7349:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    734f:	85 c0                	test   %eax,%eax
    7351:	75 d7                	jne    732a <TaskTTY+0x32>
    7353:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
    735a:	b8 ec f5 00 00       	mov    $0xf5ec,%eax
    735f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    7362:	72 c6                	jb     732a <TaskTTY+0x32>
    7364:	83 ec 04             	sub    $0x4,%esp
    7367:	6a 10                	push   $0x10
    7369:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    736f:	50                   	push   %eax
    7370:	6a 02                	push   $0x2
    7372:	e8 c7 c1 ff ff       	call   353e <send_rec>
    7377:	83 c4 10             	add    $0x10,%esp
    737a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    737d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7380:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
    7387:	74 28                	je     73b1 <TaskTTY+0xb9>
    7389:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
    7390:	7f 0b                	jg     739d <TaskTTY+0xa5>
    7392:	81 7d e8 d1 07 00 00 	cmpl   $0x7d1,-0x18(%ebp)
    7399:	74 56                	je     73f1 <TaskTTY+0xf9>
    739b:	eb 55                	jmp    73f2 <TaskTTY+0xfa>
    739d:	81 7d e8 d3 07 00 00 	cmpl   $0x7d3,-0x18(%ebp)
    73a4:	74 25                	je     73cb <TaskTTY+0xd3>
    73a6:	81 7d e8 d5 07 00 00 	cmpl   $0x7d5,-0x18(%ebp)
    73ad:	74 36                	je     73e5 <TaskTTY+0xed>
    73af:	eb 41                	jmp    73f2 <TaskTTY+0xfa>
    73b1:	a1 20 d7 00 00       	mov    0xd720,%eax
    73b6:	83 ec 08             	sub    $0x8,%esp
    73b9:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
    73bf:	52                   	push   %edx
    73c0:	50                   	push   %eax
    73c1:	e8 2b fc ff ff       	call   6ff1 <tty_do_read>
    73c6:	83 c4 10             	add    $0x10,%esp
    73c9:	eb 27                	jmp    73f2 <TaskTTY+0xfa>
    73cb:	a1 20 d7 00 00       	mov    0xd720,%eax
    73d0:	83 ec 08             	sub    $0x8,%esp
    73d3:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
    73d9:	52                   	push   %edx
    73da:	50                   	push   %eax
    73db:	e8 a2 fc ff ff       	call   7082 <tty_do_write>
    73e0:	83 c4 10             	add    $0x10,%esp
    73e3:	eb 0d                	jmp    73f2 <TaskTTY+0xfa>
    73e5:	c7 05 80 f6 00 00 00 	movl   $0x0,0xf680
    73ec:	00 00 00 
    73ef:	eb 01                	jmp    73f2 <TaskTTY+0xfa>
    73f1:	90                   	nop
    73f2:	e9 2a ff ff ff       	jmp    7321 <TaskTTY+0x29>

000073f7 <keyboard_handler>:
    73f7:	55                   	push   %ebp
    73f8:	89 e5                	mov    %esp,%ebp
    73fa:	83 ec 18             	sub    $0x18,%esp
    73fd:	c7 05 80 f6 00 00 01 	movl   $0x1,0xf680
    7404:	00 00 00 
    7407:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
    740e:	a1 68 db 00 00       	mov    0xdb68,%eax
    7413:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    7418:	7f 5c                	jg     7476 <keyboard_handler+0x7f>
    741a:	e8 e2 9e ff ff       	call   1301 <disable_int>
    741f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7422:	0f b7 c0             	movzwl %ax,%eax
    7425:	83 ec 0c             	sub    $0xc,%esp
    7428:	50                   	push   %eax
    7429:	e8 a5 9e ff ff       	call   12d3 <in_byte>
    742e:	83 c4 10             	add    $0x10,%esp
    7431:	88 45 f3             	mov    %al,-0xd(%ebp)
    7434:	a1 60 db 00 00       	mov    0xdb60,%eax
    7439:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
    743d:	88 10                	mov    %dl,(%eax)
    743f:	a1 60 db 00 00       	mov    0xdb60,%eax
    7444:	83 c0 01             	add    $0x1,%eax
    7447:	a3 60 db 00 00       	mov    %eax,0xdb60
    744c:	a1 68 db 00 00       	mov    0xdb68,%eax
    7451:	83 c0 01             	add    $0x1,%eax
    7454:	a3 68 db 00 00       	mov    %eax,0xdb68
    7459:	a1 60 db 00 00       	mov    0xdb60,%eax
    745e:	ba 6c dd 00 00       	mov    $0xdd6c,%edx
    7463:	39 d0                	cmp    %edx,%eax
    7465:	72 0a                	jb     7471 <keyboard_handler+0x7a>
    7467:	c7 05 60 db 00 00 6c 	movl   $0xdb6c,0xdb60
    746e:	db 00 00 
    7471:	e8 8d 9e ff ff       	call   1303 <enable_int>
    7476:	90                   	nop
    7477:	c9                   	leave  
    7478:	c3                   	ret    

00007479 <read_from_keyboard_buf>:
    7479:	55                   	push   %ebp
    747a:	89 e5                	mov    %esp,%ebp
    747c:	83 ec 18             	sub    $0x18,%esp
    747f:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
    7483:	a1 68 db 00 00       	mov    0xdb68,%eax
    7488:	85 c0                	test   %eax,%eax
    748a:	7e 47                	jle    74d3 <read_from_keyboard_buf+0x5a>
    748c:	e8 70 9e ff ff       	call   1301 <disable_int>
    7491:	a1 64 db 00 00       	mov    0xdb64,%eax
    7496:	0f b6 00             	movzbl (%eax),%eax
    7499:	88 45 f7             	mov    %al,-0x9(%ebp)
    749c:	a1 64 db 00 00       	mov    0xdb64,%eax
    74a1:	83 c0 01             	add    $0x1,%eax
    74a4:	a3 64 db 00 00       	mov    %eax,0xdb64
    74a9:	a1 68 db 00 00       	mov    0xdb68,%eax
    74ae:	83 e8 01             	sub    $0x1,%eax
    74b1:	a3 68 db 00 00       	mov    %eax,0xdb68
    74b6:	a1 64 db 00 00       	mov    0xdb64,%eax
    74bb:	ba 6c dd 00 00       	mov    $0xdd6c,%edx
    74c0:	39 d0                	cmp    %edx,%eax
    74c2:	72 0a                	jb     74ce <read_from_keyboard_buf+0x55>
    74c4:	c7 05 64 db 00 00 6c 	movl   $0xdb6c,0xdb64
    74cb:	db 00 00 
    74ce:	e8 30 9e ff ff       	call   1303 <enable_int>
    74d3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    74d7:	c9                   	leave  
    74d8:	c3                   	ret    

000074d9 <keyboard_read>:
    74d9:	55                   	push   %ebp
    74da:	89 e5                	mov    %esp,%ebp
    74dc:	83 ec 28             	sub    $0x28,%esp
    74df:	90                   	nop
    74e0:	a1 68 db 00 00       	mov    0xdb68,%eax
    74e5:	85 c0                	test   %eax,%eax
    74e7:	7e f7                	jle    74e0 <keyboard_read+0x7>
    74e9:	e8 8b ff ff ff       	call   7479 <read_from_keyboard_buf>
    74ee:	88 45 ea             	mov    %al,-0x16(%ebp)
    74f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    74f8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    74fc:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
    7500:	75 5a                	jne    755c <keyboard_read+0x83>
    7502:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
    7506:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
    750a:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
    750e:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
    7512:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
    7516:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
    751a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
    751e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    7525:	eb 20                	jmp    7547 <keyboard_read+0x6e>
    7527:	e8 4d ff ff ff       	call   7479 <read_from_keyboard_buf>
    752c:	89 c1                	mov    %eax,%ecx
    752e:	8d 55 e3             	lea    -0x1d(%ebp),%edx
    7531:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7534:	01 d0                	add    %edx,%eax
    7536:	0f b6 00             	movzbl (%eax),%eax
    7539:	38 c1                	cmp    %al,%cl
    753b:	74 06                	je     7543 <keyboard_read+0x6a>
    753d:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    7541:	eb 0a                	jmp    754d <keyboard_read+0x74>
    7543:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7547:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
    754b:	7e da                	jle    7527 <keyboard_read+0x4e>
    754d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
    7551:	74 68                	je     75bb <keyboard_read+0xe2>
    7553:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
    755a:	eb 5f                	jmp    75bb <keyboard_read+0xe2>
    755c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
    7560:	75 59                	jne    75bb <keyboard_read+0xe2>
    7562:	e8 12 ff ff ff       	call   7479 <read_from_keyboard_buf>
    7567:	3c 2a                	cmp    $0x2a,%al
    7569:	75 1d                	jne    7588 <keyboard_read+0xaf>
    756b:	e8 09 ff ff ff       	call   7479 <read_from_keyboard_buf>
    7570:	3c e0                	cmp    $0xe0,%al
    7572:	75 14                	jne    7588 <keyboard_read+0xaf>
    7574:	e8 00 ff ff ff       	call   7479 <read_from_keyboard_buf>
    7579:	3c 37                	cmp    $0x37,%al
    757b:	75 0b                	jne    7588 <keyboard_read+0xaf>
    757d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    7584:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    7588:	e8 ec fe ff ff       	call   7479 <read_from_keyboard_buf>
    758d:	3c b7                	cmp    $0xb7,%al
    758f:	75 1d                	jne    75ae <keyboard_read+0xd5>
    7591:	e8 e3 fe ff ff       	call   7479 <read_from_keyboard_buf>
    7596:	3c e0                	cmp    $0xe0,%al
    7598:	75 14                	jne    75ae <keyboard_read+0xd5>
    759a:	e8 da fe ff ff       	call   7479 <read_from_keyboard_buf>
    759f:	3c aa                	cmp    $0xaa,%al
    75a1:	75 0b                	jne    75ae <keyboard_read+0xd5>
    75a3:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    75aa:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    75ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    75b2:	75 07                	jne    75bb <keyboard_read+0xe2>
    75b4:	c6 05 24 d7 00 00 01 	movb   $0x1,0xd724
    75bb:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
    75c2:	0f 84 8d 00 00 00    	je     7655 <keyboard_read+0x17c>
    75c8:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
    75cf:	0f 84 80 00 00 00    	je     7655 <keyboard_read+0x17c>
    75d5:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
    75d9:	0f 94 c2             	sete   %dl
    75dc:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
    75e0:	0f 94 c0             	sete   %al
    75e3:	09 d0                	or     %edx,%eax
    75e5:	84 c0                	test   %al,%al
    75e7:	74 07                	je     75f0 <keyboard_read+0x117>
    75e9:	c6 05 84 f6 00 00 01 	movb   $0x1,0xf684
    75f0:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    75f4:	f7 d0                	not    %eax
    75f6:	c0 e8 07             	shr    $0x7,%al
    75f9:	88 45 e9             	mov    %al,-0x17(%ebp)
    75fc:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
    7600:	74 53                	je     7655 <keyboard_read+0x17c>
    7602:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
    7606:	74 4d                	je     7655 <keyboard_read+0x17c>
    7608:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
    760c:	0f b6 05 84 f6 00 00 	movzbl 0xf684,%eax
    7613:	3c 01                	cmp    $0x1,%al
    7615:	75 04                	jne    761b <keyboard_read+0x142>
    7617:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    761b:	0f b6 05 24 d7 00 00 	movzbl 0xd724,%eax
    7622:	84 c0                	test   %al,%al
    7624:	74 04                	je     762a <keyboard_read+0x151>
    7626:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
    762a:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
    762e:	89 d0                	mov    %edx,%eax
    7630:	01 c0                	add    %eax,%eax
    7632:	01 c2                	add    %eax,%edx
    7634:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    7638:	01 d0                	add    %edx,%eax
    763a:	8b 04 85 00 c1 00 00 	mov    0xc100(,%eax,4),%eax
    7641:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7644:	83 ec 08             	sub    $0x8,%esp
    7647:	ff 75 f4             	pushl  -0xc(%ebp)
    764a:	ff 75 08             	pushl  0x8(%ebp)
    764d:	e8 1a 00 00 00       	call   766c <in_process>
    7652:	83 c4 10             	add    $0x10,%esp
    7655:	90                   	nop
    7656:	c9                   	leave  
    7657:	c3                   	ret    

00007658 <init_keyboard_handler>:
    7658:	55                   	push   %ebp
    7659:	89 e5                	mov    %esp,%ebp
    765b:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    7662:	c6 05 84 f6 00 00 00 	movb   $0x0,0xf684
    7669:	90                   	nop
    766a:	5d                   	pop    %ebp
    766b:	c3                   	ret    

0000766c <in_process>:
    766c:	55                   	push   %ebp
    766d:	89 e5                	mov    %esp,%ebp
    766f:	83 ec 18             	sub    $0x18,%esp
    7672:	83 ec 04             	sub    $0x4,%esp
    7675:	6a 02                	push   $0x2
    7677:	6a 00                	push   $0x0
    7679:	8d 45 f6             	lea    -0xa(%ebp),%eax
    767c:	50                   	push   %eax
    767d:	e8 3f 1e 00 00       	call   94c1 <Memset>
    7682:	83 c4 10             	add    $0x10,%esp
    7685:	8b 45 0c             	mov    0xc(%ebp),%eax
    7688:	25 00 01 00 00       	and    $0x100,%eax
    768d:	85 c0                	test   %eax,%eax
    768f:	75 28                	jne    76b9 <in_process+0x4d>
    7691:	8b 45 0c             	mov    0xc(%ebp),%eax
    7694:	0f b6 c0             	movzbl %al,%eax
    7697:	83 ec 08             	sub    $0x8,%esp
    769a:	50                   	push   %eax
    769b:	ff 75 08             	pushl  0x8(%ebp)
    769e:	e8 5d f4 ff ff       	call   6b00 <put_key>
    76a3:	83 c4 10             	add    $0x10,%esp
    76a6:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    76ad:	c6 05 84 f6 00 00 00 	movb   $0x0,0xf684
    76b4:	e9 42 01 00 00       	jmp    77fb <in_process+0x18f>
    76b9:	0f b6 05 84 f6 00 00 	movzbl 0xf684,%eax
    76c0:	84 c0                	test   %al,%al
    76c2:	0f 84 a9 00 00 00    	je     7771 <in_process+0x105>
    76c8:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
    76cc:	0f 84 9f 00 00 00    	je     7771 <in_process+0x105>
    76d2:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
    76d6:	0f 84 95 00 00 00    	je     7771 <in_process+0x105>
    76dc:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    76e3:	74 64                	je     7749 <in_process+0xdd>
    76e5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    76ec:	77 0b                	ja     76f9 <in_process+0x8d>
    76ee:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    76f5:	74 64                	je     775b <in_process+0xef>
    76f7:	eb 73                	jmp    776c <in_process+0x100>
    76f9:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
    7700:	74 0b                	je     770d <in_process+0xa1>
    7702:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
    7709:	74 20                	je     772b <in_process+0xbf>
    770b:	eb 5f                	jmp    776c <in_process+0x100>
    770d:	83 ec 0c             	sub    $0xc,%esp
    7710:	ff 75 08             	pushl  0x8(%ebp)
    7713:	e8 54 f4 ff ff       	call   6b6c <scroll_up>
    7718:	83 c4 10             	add    $0x10,%esp
    771b:	c6 05 84 f6 00 00 00 	movb   $0x0,0xf684
    7722:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    7729:	eb 41                	jmp    776c <in_process+0x100>
    772b:	83 ec 0c             	sub    $0xc,%esp
    772e:	ff 75 08             	pushl  0x8(%ebp)
    7731:	e8 78 f4 ff ff       	call   6bae <scroll_down>
    7736:	83 c4 10             	add    $0x10,%esp
    7739:	c6 05 84 f6 00 00 00 	movb   $0x0,0xf684
    7740:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    7747:	eb 23                	jmp    776c <in_process+0x100>
    7749:	83 ec 08             	sub    $0x8,%esp
    774c:	6a 0a                	push   $0xa
    774e:	ff 75 08             	pushl  0x8(%ebp)
    7751:	e8 c3 f4 ff ff       	call   6c19 <out_char>
    7756:	83 c4 10             	add    $0x10,%esp
    7759:	eb 11                	jmp    776c <in_process+0x100>
    775b:	83 ec 08             	sub    $0x8,%esp
    775e:	6a 08                	push   $0x8
    7760:	ff 75 08             	pushl  0x8(%ebp)
    7763:	e8 b1 f4 ff ff       	call   6c19 <out_char>
    7768:	83 c4 10             	add    $0x10,%esp
    776b:	90                   	nop
    776c:	e9 8a 00 00 00       	jmp    77fb <in_process+0x18f>
    7771:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    7778:	74 55                	je     77cf <in_process+0x163>
    777a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    7781:	77 14                	ja     7797 <in_process+0x12b>
    7783:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    778a:	74 31                	je     77bd <in_process+0x151>
    778c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    7793:	74 16                	je     77ab <in_process+0x13f>
    7795:	eb 64                	jmp    77fb <in_process+0x18f>
    7797:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
    779e:	74 3e                	je     77de <in_process+0x172>
    77a0:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
    77a7:	74 44                	je     77ed <in_process+0x181>
    77a9:	eb 50                	jmp    77fb <in_process+0x18f>
    77ab:	83 ec 08             	sub    $0x8,%esp
    77ae:	6a 0a                	push   $0xa
    77b0:	ff 75 08             	pushl  0x8(%ebp)
    77b3:	e8 48 f3 ff ff       	call   6b00 <put_key>
    77b8:	83 c4 10             	add    $0x10,%esp
    77bb:	eb 3e                	jmp    77fb <in_process+0x18f>
    77bd:	83 ec 08             	sub    $0x8,%esp
    77c0:	6a 08                	push   $0x8
    77c2:	ff 75 08             	pushl  0x8(%ebp)
    77c5:	e8 36 f3 ff ff       	call   6b00 <put_key>
    77ca:	83 c4 10             	add    $0x10,%esp
    77cd:	eb 2c                	jmp    77fb <in_process+0x18f>
    77cf:	83 ec 0c             	sub    $0xc,%esp
    77d2:	6a 00                	push   $0x0
    77d4:	e8 f6 f1 ff ff       	call   69cf <select_console>
    77d9:	83 c4 10             	add    $0x10,%esp
    77dc:	eb 1d                	jmp    77fb <in_process+0x18f>
    77de:	83 ec 0c             	sub    $0xc,%esp
    77e1:	6a 01                	push   $0x1
    77e3:	e8 e7 f1 ff ff       	call   69cf <select_console>
    77e8:	83 c4 10             	add    $0x10,%esp
    77eb:	eb 0e                	jmp    77fb <in_process+0x18f>
    77ed:	83 ec 0c             	sub    $0xc,%esp
    77f0:	6a 02                	push   $0x2
    77f2:	e8 d8 f1 ff ff       	call   69cf <select_console>
    77f7:	83 c4 10             	add    $0x10,%esp
    77fa:	90                   	nop
    77fb:	90                   	nop
    77fc:	c9                   	leave  
    77fd:	c3                   	ret    

000077fe <open>:
    77fe:	55                   	push   %ebp
    77ff:	89 e5                	mov    %esp,%ebp
    7801:	83 ec 78             	sub    $0x78,%esp
    7804:	83 ec 04             	sub    $0x4,%esp
    7807:	6a 6c                	push   $0x6c
    7809:	6a 00                	push   $0x0
    780b:	8d 45 8c             	lea    -0x74(%ebp),%eax
    780e:	50                   	push   %eax
    780f:	e8 ad 1c 00 00       	call   94c1 <Memset>
    7814:	83 c4 10             	add    $0x10,%esp
    7817:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    781e:	8b 45 08             	mov    0x8(%ebp),%eax
    7821:	89 45 c0             	mov    %eax,-0x40(%ebp)
    7824:	8b 45 0c             	mov    0xc(%ebp),%eax
    7827:	89 45 f0             	mov    %eax,-0x10(%ebp)
    782a:	83 ec 0c             	sub    $0xc,%esp
    782d:	ff 75 08             	pushl  0x8(%ebp)
    7830:	e8 c5 1c 00 00       	call   94fa <Strlen>
    7835:	83 c4 10             	add    $0x10,%esp
    7838:	89 45 bc             	mov    %eax,-0x44(%ebp)
    783b:	83 ec 04             	sub    $0x4,%esp
    783e:	6a 03                	push   $0x3
    7840:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7843:	50                   	push   %eax
    7844:	6a 03                	push   $0x3
    7846:	e8 f3 bc ff ff       	call   353e <send_rec>
    784b:	83 c4 10             	add    $0x10,%esp
    784e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7851:	c9                   	leave  
    7852:	c3                   	ret    

00007853 <read>:
    7853:	55                   	push   %ebp
    7854:	89 e5                	mov    %esp,%ebp
    7856:	83 ec 78             	sub    $0x78,%esp
    7859:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
    7860:	8b 45 08             	mov    0x8(%ebp),%eax
    7863:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7866:	8b 45 0c             	mov    0xc(%ebp),%eax
    7869:	89 45 9c             	mov    %eax,-0x64(%ebp)
    786c:	8b 45 10             	mov    0x10(%ebp),%eax
    786f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    7872:	83 ec 04             	sub    $0x4,%esp
    7875:	6a 03                	push   $0x3
    7877:	8d 45 8c             	lea    -0x74(%ebp),%eax
    787a:	50                   	push   %eax
    787b:	6a 03                	push   $0x3
    787d:	e8 bc bc ff ff       	call   353e <send_rec>
    7882:	83 c4 10             	add    $0x10,%esp
    7885:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7888:	c9                   	leave  
    7889:	c3                   	ret    

0000788a <write>:
    788a:	55                   	push   %ebp
    788b:	89 e5                	mov    %esp,%ebp
    788d:	83 ec 78             	sub    $0x78,%esp
    7890:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
    7897:	8b 45 08             	mov    0x8(%ebp),%eax
    789a:	89 45 cc             	mov    %eax,-0x34(%ebp)
    789d:	8b 45 0c             	mov    0xc(%ebp),%eax
    78a0:	89 45 9c             	mov    %eax,-0x64(%ebp)
    78a3:	8b 45 10             	mov    0x10(%ebp),%eax
    78a6:	89 45 dc             	mov    %eax,-0x24(%ebp)
    78a9:	83 ec 04             	sub    $0x4,%esp
    78ac:	6a 03                	push   $0x3
    78ae:	8d 45 8c             	lea    -0x74(%ebp),%eax
    78b1:	50                   	push   %eax
    78b2:	6a 03                	push   $0x3
    78b4:	e8 85 bc ff ff       	call   353e <send_rec>
    78b9:	83 c4 10             	add    $0x10,%esp
    78bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    78bf:	c9                   	leave  
    78c0:	c3                   	ret    

000078c1 <close>:
    78c1:	55                   	push   %ebp
    78c2:	89 e5                	mov    %esp,%ebp
    78c4:	83 ec 78             	sub    $0x78,%esp
    78c7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    78ce:	8b 45 08             	mov    0x8(%ebp),%eax
    78d1:	89 45 cc             	mov    %eax,-0x34(%ebp)
    78d4:	83 ec 04             	sub    $0x4,%esp
    78d7:	6a 03                	push   $0x3
    78d9:	8d 45 8c             	lea    -0x74(%ebp),%eax
    78dc:	50                   	push   %eax
    78dd:	6a 03                	push   $0x3
    78df:	e8 5a bc ff ff       	call   353e <send_rec>
    78e4:	83 c4 10             	add    $0x10,%esp
    78e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    78ea:	83 f8 65             	cmp    $0x65,%eax
    78ed:	74 19                	je     7908 <close+0x47>
    78ef:	6a 14                	push   $0x14
    78f1:	68 d9 93 00 00       	push   $0x93d9
    78f6:	68 d9 93 00 00       	push   $0x93d9
    78fb:	68 e5 93 00 00       	push   $0x93e5
    7900:	e8 cd b3 ff ff       	call   2cd2 <assertion_failure>
    7905:	83 c4 10             	add    $0x10,%esp
    7908:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    790b:	c9                   	leave  
    790c:	c3                   	ret    

0000790d <wait>:
    790d:	55                   	push   %ebp
    790e:	89 e5                	mov    %esp,%ebp
    7910:	83 ec 78             	sub    $0x78,%esp
    7913:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
    791a:	83 ec 04             	sub    $0x4,%esp
    791d:	6a 04                	push   $0x4
    791f:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7922:	50                   	push   %eax
    7923:	6a 03                	push   $0x3
    7925:	e8 14 bc ff ff       	call   353e <send_rec>
    792a:	83 c4 10             	add    $0x10,%esp
    792d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7930:	89 c2                	mov    %eax,%edx
    7932:	8b 45 08             	mov    0x8(%ebp),%eax
    7935:	89 10                	mov    %edx,(%eax)
    7937:	8b 45 d8             	mov    -0x28(%ebp),%eax
    793a:	83 f8 1f             	cmp    $0x1f,%eax
    793d:	74 05                	je     7944 <wait+0x37>
    793f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7942:	eb 05                	jmp    7949 <wait+0x3c>
    7944:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    7949:	c9                   	leave  
    794a:	c3                   	ret    

0000794b <exit>:
    794b:	55                   	push   %ebp
    794c:	89 e5                	mov    %esp,%ebp
    794e:	83 ec 78             	sub    $0x78,%esp
    7951:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    7958:	8b 45 08             	mov    0x8(%ebp),%eax
    795b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    795e:	83 ec 04             	sub    $0x4,%esp
    7961:	6a 04                	push   $0x4
    7963:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7966:	50                   	push   %eax
    7967:	6a 03                	push   $0x3
    7969:	e8 d0 bb ff ff       	call   353e <send_rec>
    796e:	83 c4 10             	add    $0x10,%esp
    7971:	90                   	nop
    7972:	c9                   	leave  
    7973:	c3                   	ret    

00007974 <fork>:
    7974:	55                   	push   %ebp
    7975:	89 e5                	mov    %esp,%ebp
    7977:	83 ec 78             	sub    $0x78,%esp
    797a:	83 ec 04             	sub    $0x4,%esp
    797d:	6a 6c                	push   $0x6c
    797f:	6a 00                	push   $0x0
    7981:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7984:	50                   	push   %eax
    7985:	e8 37 1b 00 00       	call   94c1 <Memset>
    798a:	83 c4 10             	add    $0x10,%esp
    798d:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
    7994:	83 ec 04             	sub    $0x4,%esp
    7997:	6a 04                	push   $0x4
    7999:	8d 45 8c             	lea    -0x74(%ebp),%eax
    799c:	50                   	push   %eax
    799d:	6a 03                	push   $0x3
    799f:	e8 9a bb ff ff       	call   353e <send_rec>
    79a4:	83 c4 10             	add    $0x10,%esp
    79a7:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
    79ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    79b1:	85 c0                	test   %eax,%eax
    79b3:	74 19                	je     79ce <fork+0x5a>
    79b5:	6a 15                	push   $0x15
    79b7:	68 fd 93 00 00       	push   $0x93fd
    79bc:	68 fd 93 00 00       	push   $0x93fd
    79c1:	68 08 94 00 00       	push   $0x9408
    79c6:	e8 07 b3 ff ff       	call   2cd2 <assertion_failure>
    79cb:	83 c4 10             	add    $0x10,%esp
    79ce:	8b 45 d8             	mov    -0x28(%ebp),%eax
    79d1:	c9                   	leave  
    79d2:	c3                   	ret    

000079d3 <getpid>:
    79d3:	55                   	push   %ebp
    79d4:	89 e5                	mov    %esp,%ebp
    79d6:	83 ec 78             	sub    $0x78,%esp
    79d9:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
    79e0:	83 ec 04             	sub    $0x4,%esp
    79e3:	6a 01                	push   $0x1
    79e5:	8d 45 8c             	lea    -0x74(%ebp),%eax
    79e8:	50                   	push   %eax
    79e9:	6a 03                	push   $0x3
    79eb:	e8 4e bb ff ff       	call   353e <send_rec>
    79f0:	83 c4 10             	add    $0x10,%esp
    79f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    79f6:	c9                   	leave  
    79f7:	c3                   	ret    

000079f8 <exec>:
    79f8:	55                   	push   %ebp
    79f9:	89 e5                	mov    %esp,%ebp
    79fb:	83 ec 78             	sub    $0x78,%esp
    79fe:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
    7a05:	8b 45 08             	mov    0x8(%ebp),%eax
    7a08:	89 45 c0             	mov    %eax,-0x40(%ebp)
    7a0b:	83 ec 0c             	sub    $0xc,%esp
    7a0e:	ff 75 08             	pushl  0x8(%ebp)
    7a11:	e8 e4 1a 00 00       	call   94fa <Strlen>
    7a16:	83 c4 10             	add    $0x10,%esp
    7a19:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7a1c:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
    7a23:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
    7a2a:	83 ec 04             	sub    $0x4,%esp
    7a2d:	6a 04                	push   $0x4
    7a2f:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7a32:	50                   	push   %eax
    7a33:	6a 03                	push   $0x3
    7a35:	e8 04 bb ff ff       	call   353e <send_rec>
    7a3a:	83 c4 10             	add    $0x10,%esp
    7a3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7a40:	83 f8 65             	cmp    $0x65,%eax
    7a43:	74 19                	je     7a5e <exec+0x66>
    7a45:	6a 1a                	push   $0x1a
    7a47:	68 18 94 00 00       	push   $0x9418
    7a4c:	68 18 94 00 00       	push   $0x9418
    7a51:	68 23 94 00 00       	push   $0x9423
    7a56:	e8 77 b2 ff ff       	call   2cd2 <assertion_failure>
    7a5b:	83 c4 10             	add    $0x10,%esp
    7a5e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7a61:	c9                   	leave  
    7a62:	c3                   	ret    

00007a63 <execv>:
    7a63:	55                   	push   %ebp
    7a64:	89 e5                	mov    %esp,%ebp
    7a66:	57                   	push   %edi
    7a67:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
    7a6d:	83 ec 04             	sub    $0x4,%esp
    7a70:	68 00 80 00 00       	push   $0x8000
    7a75:	6a 00                	push   $0x0
    7a77:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7a7d:	50                   	push   %eax
    7a7e:	e8 3e 1a 00 00       	call   94c1 <Memset>
    7a83:	83 c4 10             	add    $0x10,%esp
    7a86:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a89:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7a8c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7a93:	eb 0d                	jmp    7aa2 <execv+0x3f>
    7a95:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    7a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a9c:	83 c0 04             	add    $0x4,%eax
    7a9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7aa5:	8b 00                	mov    (%eax),%eax
    7aa7:	85 c0                	test   %eax,%eax
    7aa9:	75 ea                	jne    7a95 <execv+0x32>
    7aab:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7ab1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ab4:	01 d0                	add    %edx,%eax
    7ab6:	c6 00 00             	movb   $0x0,(%eax)
    7ab9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7abc:	83 c0 04             	add    $0x4,%eax
    7abf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7ac2:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7ac8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    7acb:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ace:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7ad1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7ad8:	eb 64                	jmp    7b3e <execv+0xdb>
    7ada:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7ae0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ae3:	01 c2                	add    %eax,%edx
    7ae5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7ae8:	89 10                	mov    %edx,(%eax)
    7aea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7aed:	8b 00                	mov    (%eax),%eax
    7aef:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
    7af5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7af8:	01 ca                	add    %ecx,%edx
    7afa:	83 ec 08             	sub    $0x8,%esp
    7afd:	50                   	push   %eax
    7afe:	52                   	push   %edx
    7aff:	e8 dc 19 00 00       	call   94e0 <Strcpy>
    7b04:	83 c4 10             	add    $0x10,%esp
    7b07:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7b0a:	8b 00                	mov    (%eax),%eax
    7b0c:	83 ec 0c             	sub    $0xc,%esp
    7b0f:	50                   	push   %eax
    7b10:	e8 e5 19 00 00       	call   94fa <Strlen>
    7b15:	83 c4 10             	add    $0x10,%esp
    7b18:	01 45 f0             	add    %eax,-0x10(%ebp)
    7b1b:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b24:	01 d0                	add    %edx,%eax
    7b26:	c6 00 00             	movb   $0x0,(%eax)
    7b29:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b2c:	83 c0 01             	add    $0x1,%eax
    7b2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7b32:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    7b36:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
    7b3a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7b3e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7b41:	8b 00                	mov    (%eax),%eax
    7b43:	85 c0                	test   %eax,%eax
    7b45:	75 93                	jne    7ada <execv+0x77>
    7b47:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7b4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7b50:	eb 04                	jmp    7b56 <execv+0xf3>
    7b52:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
    7b56:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7b59:	8b 00                	mov    (%eax),%eax
    7b5b:	85 c0                	test   %eax,%eax
    7b5d:	75 f3                	jne    7b52 <execv+0xef>
    7b5f:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
    7b65:	b8 00 00 00 00       	mov    $0x0,%eax
    7b6a:	b9 0a 00 00 00       	mov    $0xa,%ecx
    7b6f:	89 d7                	mov    %edx,%edi
    7b71:	f3 ab                	rep stos %eax,%es:(%edi)
    7b73:	c7 85 4c 7f ff ff 3b 	movl   $0x943b,-0x80b4(%ebp)
    7b7a:	94 00 00 
    7b7d:	c7 85 50 7f ff ff 42 	movl   $0x9442,-0x80b0(%ebp)
    7b84:	94 00 00 
    7b87:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
    7b8e:	00 00 00 
    7b91:	8b 45 08             	mov    0x8(%ebp),%eax
    7b94:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
    7b9a:	83 ec 0c             	sub    $0xc,%esp
    7b9d:	ff 75 08             	pushl  0x8(%ebp)
    7ba0:	e8 55 19 00 00       	call   94fa <Strlen>
    7ba5:	83 c4 10             	add    $0x10,%esp
    7ba8:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
    7bae:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7bb4:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
    7bba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7bbd:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
    7bc3:	83 ec 04             	sub    $0x4,%esp
    7bc6:	6a 04                	push   $0x4
    7bc8:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
    7bce:	50                   	push   %eax
    7bcf:	6a 03                	push   $0x3
    7bd1:	e8 68 b9 ff ff       	call   353e <send_rec>
    7bd6:	83 c4 10             	add    $0x10,%esp
    7bd9:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
    7bdf:	83 f8 65             	cmp    $0x65,%eax
    7be2:	74 19                	je     7bfd <execv+0x19a>
    7be4:	6a 73                	push   $0x73
    7be6:	68 18 94 00 00       	push   $0x9418
    7beb:	68 18 94 00 00       	push   $0x9418
    7bf0:	68 23 94 00 00       	push   $0x9423
    7bf5:	e8 d8 b0 ff ff       	call   2cd2 <assertion_failure>
    7bfa:	83 c4 10             	add    $0x10,%esp
    7bfd:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
    7c03:	8b 7d fc             	mov    -0x4(%ebp),%edi
    7c06:	c9                   	leave  
    7c07:	c3                   	ret    

00007c08 <execl>:
    7c08:	55                   	push   %ebp
    7c09:	89 e5                	mov    %esp,%ebp
    7c0b:	83 ec 18             	sub    $0x18,%esp
    7c0e:	8d 45 0c             	lea    0xc(%ebp),%eax
    7c11:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7c14:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c17:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7c1a:	83 ec 08             	sub    $0x8,%esp
    7c1d:	ff 75 f0             	pushl  -0x10(%ebp)
    7c20:	ff 75 08             	pushl  0x8(%ebp)
    7c23:	e8 3b fe ff ff       	call   7a63 <execv>
    7c28:	83 c4 10             	add    $0x10,%esp
    7c2b:	c9                   	leave  
    7c2c:	c3                   	ret    

00007c2d <TaskMM>:
    7c2d:	55                   	push   %ebp
    7c2e:	89 e5                	mov    %esp,%ebp
    7c30:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    7c36:	83 ec 04             	sub    $0x4,%esp
    7c39:	6a 10                	push   $0x10
    7c3b:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7c41:	50                   	push   %eax
    7c42:	6a 02                	push   $0x2
    7c44:	e8 f5 b8 ff ff       	call   353e <send_rec>
    7c49:	83 c4 10             	add    $0x10,%esp
    7c4c:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    7c52:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7c55:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
    7c5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    7c5e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    7c65:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
    7c6c:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
    7c73:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
    7c7a:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7c7e:	74 4e                	je     7cce <TaskMM+0xa1>
    7c80:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7c84:	7f 08                	jg     7c8e <TaskMM+0x61>
    7c86:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    7c8a:	74 27                	je     7cb3 <TaskMM+0x86>
    7c8c:	eb 79                	jmp    7d07 <TaskMM+0xda>
    7c8e:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    7c92:	74 08                	je     7c9c <TaskMM+0x6f>
    7c94:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    7c98:	74 52                	je     7cec <TaskMM+0xbf>
    7c9a:	eb 6b                	jmp    7d07 <TaskMM+0xda>
    7c9c:	83 ec 0c             	sub    $0xc,%esp
    7c9f:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7ca5:	50                   	push   %eax
    7ca6:	e8 f6 03 00 00       	call   80a1 <do_fork>
    7cab:	83 c4 10             	add    $0x10,%esp
    7cae:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    7cb1:	eb 65                	jmp    7d18 <TaskMM+0xeb>
    7cb3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7cba:	83 ec 0c             	sub    $0xc,%esp
    7cbd:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7cc3:	50                   	push   %eax
    7cc4:	e8 a8 00 00 00       	call   7d71 <do_exec>
    7cc9:	83 c4 10             	add    $0x10,%esp
    7ccc:	eb 4a                	jmp    7d18 <TaskMM+0xeb>
    7cce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7cd5:	83 ec 08             	sub    $0x8,%esp
    7cd8:	ff 75 e4             	pushl  -0x1c(%ebp)
    7cdb:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7ce1:	50                   	push   %eax
    7ce2:	e8 c4 05 00 00       	call   82ab <do_exit>
    7ce7:	83 c4 10             	add    $0x10,%esp
    7cea:	eb 2c                	jmp    7d18 <TaskMM+0xeb>
    7cec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7cf3:	83 ec 0c             	sub    $0xc,%esp
    7cf6:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7cfc:	50                   	push   %eax
    7cfd:	e8 a5 06 00 00       	call   83a7 <do_wait>
    7d02:	83 c4 10             	add    $0x10,%esp
    7d05:	eb 11                	jmp    7d18 <TaskMM+0xeb>
    7d07:	83 ec 0c             	sub    $0xc,%esp
    7d0a:	68 49 94 00 00       	push   $0x9449
    7d0f:	e8 a0 af ff ff       	call   2cb4 <panic>
    7d14:	83 c4 10             	add    $0x10,%esp
    7d17:	90                   	nop
    7d18:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7d1c:	0f 84 14 ff ff ff    	je     7c36 <TaskMM+0x9>
    7d22:	83 ec 04             	sub    $0x4,%esp
    7d25:	ff 75 ec             	pushl  -0x14(%ebp)
    7d28:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    7d2e:	50                   	push   %eax
    7d2f:	6a 01                	push   $0x1
    7d31:	e8 08 b8 ff ff       	call   353e <send_rec>
    7d36:	83 c4 10             	add    $0x10,%esp
    7d39:	e9 f8 fe ff ff       	jmp    7c36 <TaskMM+0x9>

00007d3e <alloc_mem>:
    7d3e:	55                   	push   %ebp
    7d3f:	89 e5                	mov    %esp,%ebp
    7d41:	83 ec 10             	sub    $0x10,%esp
    7d44:	8b 45 08             	mov    0x8(%ebp),%eax
    7d47:	83 e8 06             	sub    $0x6,%eax
    7d4a:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
    7d50:	05 00 00 a0 00       	add    $0xa00000,%eax
    7d55:	89 45 fc             	mov    %eax,-0x4(%ebp)
    7d58:	8b 45 fc             	mov    -0x4(%ebp),%eax
    7d5b:	c9                   	leave  
    7d5c:	c3                   	ret    

00007d5d <do_exec2>:
    7d5d:	55                   	push   %ebp
    7d5e:	89 e5                	mov    %esp,%ebp
    7d60:	83 ec 10             	sub    $0x10,%esp
    7d63:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
    7d6a:	b8 00 00 00 00       	mov    $0x0,%eax
    7d6f:	c9                   	leave  
    7d70:	c3                   	ret    

00007d71 <do_exec>:
    7d71:	55                   	push   %ebp
    7d72:	89 e5                	mov    %esp,%ebp
    7d74:	56                   	push   %esi
    7d75:	53                   	push   %ebx
    7d76:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
    7d7c:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
    7d83:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
    7d8a:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
    7d90:	83 ec 08             	sub    $0x8,%esp
    7d93:	6a 00                	push   $0x0
    7d95:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    7d98:	50                   	push   %eax
    7d99:	e8 60 fa ff ff       	call   77fe <open>
    7d9e:	83 c4 10             	add    $0x10,%esp
    7da1:	89 45 dc             	mov    %eax,-0x24(%ebp)
    7da4:	8b 45 08             	mov    0x8(%ebp),%eax
    7da7:	8b 00                	mov    (%eax),%eax
    7da9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    7dac:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
    7db3:	83 ec 04             	sub    $0x4,%esp
    7db6:	6a 0c                	push   $0xc
    7db8:	6a 00                	push   $0x0
    7dba:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    7dc0:	50                   	push   %eax
    7dc1:	e8 fb 16 00 00       	call   94c1 <Memset>
    7dc6:	83 c4 10             	add    $0x10,%esp
    7dc9:	8b 45 08             	mov    0x8(%ebp),%eax
    7dcc:	8b 40 30             	mov    0x30(%eax),%eax
    7dcf:	89 c6                	mov    %eax,%esi
    7dd1:	8b 45 08             	mov    0x8(%ebp),%eax
    7dd4:	8b 40 34             	mov    0x34(%eax),%eax
    7dd7:	83 ec 08             	sub    $0x8,%esp
    7dda:	50                   	push   %eax
    7ddb:	ff 75 d8             	pushl  -0x28(%ebp)
    7dde:	e8 58 e9 ff ff       	call   673b <v2l>
    7de3:	83 c4 10             	add    $0x10,%esp
    7de6:	89 c3                	mov    %eax,%ebx
    7de8:	83 ec 08             	sub    $0x8,%esp
    7deb:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    7df1:	50                   	push   %eax
    7df2:	6a 04                	push   $0x4
    7df4:	e8 42 e9 ff ff       	call   673b <v2l>
    7df9:	83 c4 10             	add    $0x10,%esp
    7dfc:	83 ec 04             	sub    $0x4,%esp
    7dff:	56                   	push   %esi
    7e00:	53                   	push   %ebx
    7e01:	50                   	push   %eax
    7e02:	e8 8c 16 00 00       	call   9493 <Memcpy>
    7e07:	83 c4 10             	add    $0x10,%esp
    7e0a:	83 ec 08             	sub    $0x8,%esp
    7e0d:	6a 00                	push   $0x0
    7e0f:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    7e15:	50                   	push   %eax
    7e16:	e8 e3 f9 ff ff       	call   77fe <open>
    7e1b:	83 c4 10             	add    $0x10,%esp
    7e1e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    7e21:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7e28:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e2b:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
    7e31:	01 d0                	add    %edx,%eax
    7e33:	83 ec 04             	sub    $0x4,%esp
    7e36:	68 00 02 00 00       	push   $0x200
    7e3b:	50                   	push   %eax
    7e3c:	ff 75 d0             	pushl  -0x30(%ebp)
    7e3f:	e8 0f fa ff ff       	call   7853 <read>
    7e44:	83 c4 10             	add    $0x10,%esp
    7e47:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7e4a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7e4d:	01 45 f4             	add    %eax,-0xc(%ebp)
    7e50:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    7e54:	74 02                	je     7e58 <do_exec+0xe7>
    7e56:	eb d0                	jmp    7e28 <do_exec+0xb7>
    7e58:	90                   	nop
    7e59:	83 ec 0c             	sub    $0xc,%esp
    7e5c:	ff 75 d0             	pushl  -0x30(%ebp)
    7e5f:	e8 5d fa ff ff       	call   78c1 <close>
    7e64:	83 c4 10             	add    $0x10,%esp
    7e67:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
    7e6d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7e70:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7e77:	eb 72                	jmp    7eeb <do_exec+0x17a>
    7e79:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7e7c:	0f b7 40 28          	movzwl 0x28(%eax),%eax
    7e80:	0f b7 d0             	movzwl %ax,%edx
    7e83:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7e86:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
    7e8a:	0f b7 c0             	movzwl %ax,%eax
    7e8d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    7e91:	01 c2                	add    %eax,%edx
    7e93:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
    7e99:	01 d0                	add    %edx,%eax
    7e9b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    7e9e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    7ea1:	8b 40 10             	mov    0x10(%eax),%eax
    7ea4:	89 c6                	mov    %eax,%esi
    7ea6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    7ea9:	8b 40 04             	mov    0x4(%eax),%eax
    7eac:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
    7eb2:	01 d0                	add    %edx,%eax
    7eb4:	83 ec 08             	sub    $0x8,%esp
    7eb7:	50                   	push   %eax
    7eb8:	6a 04                	push   $0x4
    7eba:	e8 7c e8 ff ff       	call   673b <v2l>
    7ebf:	83 c4 10             	add    $0x10,%esp
    7ec2:	89 c3                	mov    %eax,%ebx
    7ec4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    7ec7:	8b 40 08             	mov    0x8(%eax),%eax
    7eca:	83 ec 08             	sub    $0x8,%esp
    7ecd:	50                   	push   %eax
    7ece:	ff 75 d8             	pushl  -0x28(%ebp)
    7ed1:	e8 65 e8 ff ff       	call   673b <v2l>
    7ed6:	83 c4 10             	add    $0x10,%esp
    7ed9:	83 ec 04             	sub    $0x4,%esp
    7edc:	56                   	push   %esi
    7edd:	53                   	push   %ebx
    7ede:	50                   	push   %eax
    7edf:	e8 af 15 00 00       	call   9493 <Memcpy>
    7ee4:	83 c4 10             	add    $0x10,%esp
    7ee7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7eeb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7eee:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    7ef2:	0f b7 c0             	movzwl %ax,%eax
    7ef5:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    7ef8:	0f 8c 7b ff ff ff    	jl     7e79 <do_exec+0x108>
    7efe:	8b 45 08             	mov    0x8(%ebp),%eax
    7f01:	8b 40 10             	mov    0x10(%eax),%eax
    7f04:	89 45 c0             	mov    %eax,-0x40(%ebp)
    7f07:	8b 45 08             	mov    0x8(%ebp),%eax
    7f0a:	8b 40 1c             	mov    0x1c(%eax),%eax
    7f0d:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7f10:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
    7f17:	83 ec 08             	sub    $0x8,%esp
    7f1a:	ff 75 c0             	pushl  -0x40(%ebp)
    7f1d:	ff 75 d8             	pushl  -0x28(%ebp)
    7f20:	e8 16 e8 ff ff       	call   673b <v2l>
    7f25:	83 c4 10             	add    $0x10,%esp
    7f28:	89 c3                	mov    %eax,%ebx
    7f2a:	83 ec 08             	sub    $0x8,%esp
    7f2d:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    7f33:	50                   	push   %eax
    7f34:	6a 04                	push   $0x4
    7f36:	e8 00 e8 ff ff       	call   673b <v2l>
    7f3b:	83 c4 10             	add    $0x10,%esp
    7f3e:	83 ec 04             	sub    $0x4,%esp
    7f41:	ff 75 bc             	pushl  -0x44(%ebp)
    7f44:	53                   	push   %ebx
    7f45:	50                   	push   %eax
    7f46:	e8 48 15 00 00       	call   9493 <Memcpy>
    7f4b:	83 c4 10             	add    $0x10,%esp
    7f4e:	83 ec 08             	sub    $0x8,%esp
    7f51:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    7f57:	50                   	push   %eax
    7f58:	6a 04                	push   $0x4
    7f5a:	e8 dc e7 ff ff       	call   673b <v2l>
    7f5f:	83 c4 10             	add    $0x10,%esp
    7f62:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    7f65:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    7f68:	89 45 ec             	mov    %eax,-0x14(%ebp)
    7f6b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7f72:	eb 08                	jmp    7f7c <do_exec+0x20b>
    7f74:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7f78:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
    7f7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f7f:	8b 00                	mov    (%eax),%eax
    7f81:	85 c0                	test   %eax,%eax
    7f83:	75 ef                	jne    7f74 <do_exec+0x203>
    7f85:	8b 45 b8             	mov    -0x48(%ebp),%eax
    7f88:	2b 45 c0             	sub    -0x40(%ebp),%eax
    7f8b:	89 45 b0             	mov    %eax,-0x50(%ebp)
    7f8e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7f95:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    7f9b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7f9e:	eb 17                	jmp    7fb7 <do_exec+0x246>
    7fa0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7fa4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7fa7:	8b 10                	mov    (%eax),%edx
    7fa9:	8b 45 b0             	mov    -0x50(%ebp),%eax
    7fac:	01 c2                	add    %eax,%edx
    7fae:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7fb1:	89 10                	mov    %edx,(%eax)
    7fb3:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
    7fb7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7fba:	8b 00                	mov    (%eax),%eax
    7fbc:	85 c0                	test   %eax,%eax
    7fbe:	75 e0                	jne    7fa0 <do_exec+0x22f>
    7fc0:	83 ec 08             	sub    $0x8,%esp
    7fc3:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    7fc9:	50                   	push   %eax
    7fca:	6a 04                	push   $0x4
    7fcc:	e8 6a e7 ff ff       	call   673b <v2l>
    7fd1:	83 c4 10             	add    $0x10,%esp
    7fd4:	89 c3                	mov    %eax,%ebx
    7fd6:	83 ec 08             	sub    $0x8,%esp
    7fd9:	ff 75 b8             	pushl  -0x48(%ebp)
    7fdc:	ff 75 d8             	pushl  -0x28(%ebp)
    7fdf:	e8 57 e7 ff ff       	call   673b <v2l>
    7fe4:	83 c4 10             	add    $0x10,%esp
    7fe7:	83 ec 04             	sub    $0x4,%esp
    7fea:	ff 75 bc             	pushl  -0x44(%ebp)
    7fed:	53                   	push   %ebx
    7fee:	50                   	push   %eax
    7fef:	e8 9f 14 00 00       	call   9493 <Memcpy>
    7ff4:	83 c4 10             	add    $0x10,%esp
    7ff7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7ffa:	89 45 ac             	mov    %eax,-0x54(%ebp)
    7ffd:	8b 45 b8             	mov    -0x48(%ebp),%eax
    8000:	8b 55 ac             	mov    -0x54(%ebp),%edx
    8003:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    8009:	81 c2 ac 11 08 00    	add    $0x811ac,%edx
    800f:	89 02                	mov    %eax,(%edx)
    8011:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8014:	8b 55 ac             	mov    -0x54(%ebp),%edx
    8017:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    801d:	81 c2 a8 11 08 00    	add    $0x811a8,%edx
    8023:	89 02                	mov    %eax,(%edx)
    8025:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8028:	8b 40 18             	mov    0x18(%eax),%eax
    802b:	8b 55 ac             	mov    -0x54(%ebp),%edx
    802e:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    8034:	81 c2 b0 11 08 00    	add    $0x811b0,%edx
    803a:	89 02                	mov    %eax,(%edx)
    803c:	8b 45 b8             	mov    -0x48(%ebp),%eax
    803f:	8b 55 ac             	mov    -0x54(%ebp),%edx
    8042:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    8048:	81 c2 bc 11 08 00    	add    $0x811bc,%edx
    804e:	89 02                	mov    %eax,(%edx)
    8050:	8b 45 ac             	mov    -0x54(%ebp),%eax
    8053:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8059:	05 04 13 08 00       	add    $0x81304,%eax
    805e:	c7 00 1f 00 00 00    	movl   $0x1f,(%eax)
    8064:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
    806b:	00 00 00 
    806e:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
    8075:	00 00 00 
    8078:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
    807f:	00 00 00 
    8082:	83 ec 04             	sub    $0x4,%esp
    8085:	ff 75 d8             	pushl  -0x28(%ebp)
    8088:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
    808e:	50                   	push   %eax
    808f:	6a 01                	push   $0x1
    8091:	e8 a8 b4 ff ff       	call   353e <send_rec>
    8096:	83 c4 10             	add    $0x10,%esp
    8099:	90                   	nop
    809a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    809d:	5b                   	pop    %ebx
    809e:	5e                   	pop    %esi
    809f:	5d                   	pop    %ebp
    80a0:	c3                   	ret    

000080a1 <do_fork>:
    80a1:	55                   	push   %ebp
    80a2:	89 e5                	mov    %esp,%ebp
    80a4:	57                   	push   %edi
    80a5:	56                   	push   %esi
    80a6:	53                   	push   %ebx
    80a7:	81 ec ac 00 00 00    	sub    $0xac,%esp
    80ad:	c7 45 e4 40 1b 08 00 	movl   $0x81b40,-0x1c(%ebp)
    80b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    80bb:	c7 45 dc 06 00 00 00 	movl   $0x6,-0x24(%ebp)
    80c2:	eb 21                	jmp    80e5 <do_fork+0x44>
    80c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80c7:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    80ce:	3c ff                	cmp    $0xff,%al
    80d0:	75 08                	jne    80da <do_fork+0x39>
    80d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    80d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    80d8:	eb 11                	jmp    80eb <do_fork+0x4a>
    80da:	81 45 e4 a0 01 00 00 	addl   $0x1a0,-0x1c(%ebp)
    80e1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    80e5:	83 7d dc 20          	cmpl   $0x20,-0x24(%ebp)
    80e9:	7e d9                	jle    80c4 <do_fork+0x23>
    80eb:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
    80ef:	7f 19                	jg     810a <do_fork+0x69>
    80f1:	6a 26                	push   $0x26
    80f3:	68 5c 94 00 00       	push   $0x945c
    80f8:	68 5c 94 00 00       	push   $0x945c
    80fd:	68 6c 94 00 00       	push   $0x946c
    8102:	e8 cb ab ff ff       	call   2cd2 <assertion_failure>
    8107:	83 c4 10             	add    $0x10,%esp
    810a:	8b 45 08             	mov    0x8(%ebp),%eax
    810d:	8b 00                	mov    (%eax),%eax
    810f:	89 45 d8             	mov    %eax,-0x28(%ebp)
    8112:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8115:	0f b7 40 44          	movzwl 0x44(%eax),%eax
    8119:	0f b7 c0             	movzwl %ax,%eax
    811c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    811f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8122:	8b 55 d8             	mov    -0x28(%ebp),%edx
    8125:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    812b:	8d 8a 80 11 08 00    	lea    0x81180(%edx),%ecx
    8131:	89 c2                	mov    %eax,%edx
    8133:	89 cb                	mov    %ecx,%ebx
    8135:	b8 68 00 00 00       	mov    $0x68,%eax
    813a:	89 d7                	mov    %edx,%edi
    813c:	89 de                	mov    %ebx,%esi
    813e:	89 c1                	mov    %eax,%ecx
    8140:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    8142:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8145:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8148:	89 50 58             	mov    %edx,0x58(%eax)
    814b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    814e:	89 c2                	mov    %eax,%edx
    8150:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8153:	66 89 50 44          	mov    %dx,0x44(%eax)
    8157:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    815a:	8b 55 d8             	mov    -0x28(%ebp),%edx
    815d:	89 90 98 01 00 00    	mov    %edx,0x198(%eax)
    8163:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8166:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    816c:	83 c0 40             	add    $0x40,%eax
    816f:	05 80 11 08 00       	add    $0x81180,%eax
    8174:	83 c0 06             	add    $0x6,%eax
    8177:	89 45 d0             	mov    %eax,-0x30(%ebp)
    817a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    817d:	0f b6 40 07          	movzbl 0x7(%eax),%eax
    8181:	0f b6 c0             	movzbl %al,%eax
    8184:	c1 e0 18             	shl    $0x18,%eax
    8187:	89 c2                	mov    %eax,%edx
    8189:	8b 45 d0             	mov    -0x30(%ebp),%eax
    818c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    8190:	0f b6 c0             	movzbl %al,%eax
    8193:	c1 e0 10             	shl    $0x10,%eax
    8196:	01 c2                	add    %eax,%edx
    8198:	8b 45 d0             	mov    -0x30(%ebp),%eax
    819b:	0f b7 40 02          	movzwl 0x2(%eax),%eax
    819f:	0f b7 c0             	movzwl %ax,%eax
    81a2:	01 d0                	add    %edx,%eax
    81a4:	89 45 cc             	mov    %eax,-0x34(%ebp)
    81a7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    81aa:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    81ae:	0f b6 c0             	movzbl %al,%eax
    81b1:	25 00 00 0f 00       	and    $0xf0000,%eax
    81b6:	89 c2                	mov    %eax,%edx
    81b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    81bb:	0f b7 00             	movzwl (%eax),%eax
    81be:	0f b7 c0             	movzwl %ax,%eax
    81c1:	01 d0                	add    %edx,%eax
    81c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    81c6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    81c9:	83 c0 01             	add    $0x1,%eax
    81cc:	c1 e0 0c             	shl    $0xc,%eax
    81cf:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    81d2:	83 ec 08             	sub    $0x8,%esp
    81d5:	ff 75 c4             	pushl  -0x3c(%ebp)
    81d8:	ff 75 e0             	pushl  -0x20(%ebp)
    81db:	e8 5e fb ff ff       	call   7d3e <alloc_mem>
    81e0:	83 c4 10             	add    $0x10,%esp
    81e3:	89 45 c0             	mov    %eax,-0x40(%ebp)
    81e6:	8b 55 cc             	mov    -0x34(%ebp),%edx
    81e9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    81ec:	83 ec 04             	sub    $0x4,%esp
    81ef:	ff 75 c4             	pushl  -0x3c(%ebp)
    81f2:	52                   	push   %edx
    81f3:	50                   	push   %eax
    81f4:	e8 9a 12 00 00       	call   9493 <Memcpy>
    81f9:	83 c4 10             	add    $0x10,%esp
    81fc:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
    8203:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
    820a:	8b 45 b8             	mov    -0x48(%ebp),%eax
    820d:	0f b7 c8             	movzwl %ax,%ecx
    8210:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8213:	8b 45 c0             	mov    -0x40(%ebp),%eax
    8216:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    8219:	69 db a0 01 00 00    	imul   $0x1a0,%ebx,%ebx
    821f:	83 c3 40             	add    $0x40,%ebx
    8222:	81 c3 80 11 08 00    	add    $0x81180,%ebx
    8228:	83 c3 06             	add    $0x6,%ebx
    822b:	51                   	push   %ecx
    822c:	52                   	push   %edx
    822d:	50                   	push   %eax
    822e:	53                   	push   %ebx
    822f:	e8 ff e3 ff ff       	call   6633 <InitDescriptor>
    8234:	83 c4 10             	add    $0x10,%esp
    8237:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
    823e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    8241:	0f b7 c8             	movzwl %ax,%ecx
    8244:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8247:	8b 45 c0             	mov    -0x40(%ebp),%eax
    824a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    824d:	69 db a0 01 00 00    	imul   $0x1a0,%ebx,%ebx
    8253:	83 c3 48             	add    $0x48,%ebx
    8256:	81 c3 80 11 08 00    	add    $0x81180,%ebx
    825c:	83 c3 06             	add    $0x6,%ebx
    825f:	51                   	push   %ecx
    8260:	52                   	push   %edx
    8261:	50                   	push   %eax
    8262:	53                   	push   %ebx
    8263:	e8 cb e3 ff ff       	call   6633 <InitDescriptor>
    8268:	83 c4 10             	add    $0x10,%esp
    826b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    826e:	8b 45 08             	mov    0x8(%ebp),%eax
    8271:	89 50 4c             	mov    %edx,0x4c(%eax)
    8274:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
    827b:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
    8282:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
    8289:	83 ec 04             	sub    $0x4,%esp
    828c:	ff 75 e0             	pushl  -0x20(%ebp)
    828f:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
    8295:	50                   	push   %eax
    8296:	6a 01                	push   $0x1
    8298:	e8 a1 b2 ff ff       	call   353e <send_rec>
    829d:	83 c4 10             	add    $0x10,%esp
    82a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    82a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    82a6:	5b                   	pop    %ebx
    82a7:	5e                   	pop    %esi
    82a8:	5f                   	pop    %edi
    82a9:	5d                   	pop    %ebp
    82aa:	c3                   	ret    

000082ab <do_exit>:
    82ab:	55                   	push   %ebp
    82ac:	89 e5                	mov    %esp,%ebp
    82ae:	83 ec 18             	sub    $0x18,%esp
    82b1:	8b 45 08             	mov    0x8(%ebp),%eax
    82b4:	8b 00                	mov    (%eax),%eax
    82b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    82b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    82bc:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    82c2:	05 80 11 08 00       	add    $0x81180,%eax
    82c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    82ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82cd:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    82d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    82d6:	8b 45 08             	mov    0x8(%ebp),%eax
    82d9:	8b 40 44             	mov    0x44(%eax),%eax
    82dc:	89 c2                	mov    %eax,%edx
    82de:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82e1:	89 90 9c 01 00 00    	mov    %edx,0x19c(%eax)
    82e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    82ea:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    82f0:	05 fd 12 08 00       	add    $0x812fd,%eax
    82f5:	0f b6 00             	movzbl (%eax),%eax
    82f8:	3c 04                	cmp    $0x4,%al
    82fa:	75 21                	jne    831d <do_exit+0x72>
    82fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    82ff:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8305:	05 fd 12 08 00       	add    $0x812fd,%eax
    830a:	c6 00 fb             	movb   $0xfb,(%eax)
    830d:	83 ec 0c             	sub    $0xc,%esp
    8310:	ff 75 ec             	pushl  -0x14(%ebp)
    8313:	e8 59 01 00 00       	call   8471 <cleanup>
    8318:	83 c4 10             	add    $0x10,%esp
    831b:	eb 0a                	jmp    8327 <do_exit+0x7c>
    831d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8320:	c6 80 7c 01 00 00 03 	movb   $0x3,0x17c(%eax)
    8327:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    832e:	eb 6e                	jmp    839e <do_exit+0xf3>
    8330:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8333:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8339:	05 18 13 08 00       	add    $0x81318,%eax
    833e:	8b 00                	mov    (%eax),%eax
    8340:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    8343:	75 55                	jne    839a <do_exit+0xef>
    8345:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8348:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    834e:	05 18 13 08 00       	add    $0x81318,%eax
    8353:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
    8359:	0f b6 05 bd 1c 08 00 	movzbl 0x81cbd,%eax
    8360:	3c 04                	cmp    $0x4,%al
    8362:	75 36                	jne    839a <do_exit+0xef>
    8364:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8367:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    836d:	05 fd 12 08 00       	add    $0x812fd,%eax
    8372:	0f b6 00             	movzbl (%eax),%eax
    8375:	3c 03                	cmp    $0x3,%al
    8377:	75 21                	jne    839a <do_exit+0xef>
    8379:	c6 05 bd 1c 08 00 fb 	movb   $0xfb,0x81cbd
    8380:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8383:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8389:	05 80 11 08 00       	add    $0x81180,%eax
    838e:	83 ec 0c             	sub    $0xc,%esp
    8391:	50                   	push   %eax
    8392:	e8 da 00 00 00       	call   8471 <cleanup>
    8397:	83 c4 10             	add    $0x10,%esp
    839a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    839e:	83 7d f4 20          	cmpl   $0x20,-0xc(%ebp)
    83a2:	7e 8c                	jle    8330 <do_exit+0x85>
    83a4:	90                   	nop
    83a5:	c9                   	leave  
    83a6:	c3                   	ret    

000083a7 <do_wait>:
    83a7:	55                   	push   %ebp
    83a8:	89 e5                	mov    %esp,%ebp
    83aa:	81 ec 88 00 00 00    	sub    $0x88,%esp
    83b0:	8b 45 08             	mov    0x8(%ebp),%eax
    83b3:	8b 00                	mov    (%eax),%eax
    83b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    83b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    83bf:	c7 45 f0 06 00 00 00 	movl   $0x6,-0x10(%ebp)
    83c6:	eb 5f                	jmp    8427 <do_wait+0x80>
    83c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83cb:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    83d1:	05 18 13 08 00       	add    $0x81318,%eax
    83d6:	8b 00                	mov    (%eax),%eax
    83d8:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    83db:	75 46                	jne    8423 <do_wait+0x7c>
    83dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    83e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83e4:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    83ea:	05 fd 12 08 00       	add    $0x812fd,%eax
    83ef:	0f b6 00             	movzbl (%eax),%eax
    83f2:	3c 03                	cmp    $0x3,%al
    83f4:	75 2d                	jne    8423 <do_wait+0x7c>
    83f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    83f9:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    83ff:	05 fd 12 08 00       	add    $0x812fd,%eax
    8404:	c6 00 fb             	movb   $0xfb,(%eax)
    8407:	8b 45 f0             	mov    -0x10(%ebp),%eax
    840a:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8410:	05 80 11 08 00       	add    $0x81180,%eax
    8415:	83 ec 0c             	sub    $0xc,%esp
    8418:	50                   	push   %eax
    8419:	e8 53 00 00 00       	call   8471 <cleanup>
    841e:	83 c4 10             	add    $0x10,%esp
    8421:	eb 4c                	jmp    846f <do_wait+0xc8>
    8423:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8427:	83 7d f0 20          	cmpl   $0x20,-0x10(%ebp)
    842b:	7e 9b                	jle    83c8 <do_wait+0x21>
    842d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8431:	74 13                	je     8446 <do_wait+0x9f>
    8433:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8436:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    843c:	05 fd 12 08 00       	add    $0x812fd,%eax
    8441:	c6 00 04             	movb   $0x4,(%eax)
    8444:	eb 29                	jmp    846f <do_wait+0xc8>
    8446:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
    844d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    8454:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    845b:	83 ec 04             	sub    $0x4,%esp
    845e:	ff 75 ec             	pushl  -0x14(%ebp)
    8461:	8d 45 80             	lea    -0x80(%ebp),%eax
    8464:	50                   	push   %eax
    8465:	6a 01                	push   $0x1
    8467:	e8 d2 b0 ff ff       	call   353e <send_rec>
    846c:	83 c4 10             	add    $0x10,%esp
    846f:	c9                   	leave  
    8470:	c3                   	ret    

00008471 <cleanup>:
    8471:	55                   	push   %ebp
    8472:	89 e5                	mov    %esp,%ebp
    8474:	83 ec 78             	sub    $0x78,%esp
    8477:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
    847e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8485:	8b 45 08             	mov    0x8(%ebp),%eax
    8488:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    848e:	89 45 d8             	mov    %eax,-0x28(%ebp)
    8491:	8b 45 08             	mov    0x8(%ebp),%eax
    8494:	8b 80 9c 01 00 00    	mov    0x19c(%eax),%eax
    849a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    849d:	8b 45 08             	mov    0x8(%ebp),%eax
    84a0:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    84a6:	83 ec 04             	sub    $0x4,%esp
    84a9:	50                   	push   %eax
    84aa:	8d 45 8c             	lea    -0x74(%ebp),%eax
    84ad:	50                   	push   %eax
    84ae:	6a 01                	push   $0x1
    84b0:	e8 89 b0 ff ff       	call   353e <send_rec>
    84b5:	83 c4 10             	add    $0x10,%esp
    84b8:	8b 45 08             	mov    0x8(%ebp),%eax
    84bb:	c6 80 7c 01 00 00 ff 	movb   $0xff,0x17c(%eax)
    84c2:	90                   	nop
    84c3:	c9                   	leave  
    84c4:	c3                   	ret    

000084c5 <test_bit_val>:
    84c5:	55                   	push   %ebp
    84c6:	89 e5                	mov    %esp,%ebp
    84c8:	53                   	push   %ebx
    84c9:	83 ec 10             	sub    $0x10,%esp
    84cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    84cf:	8d 50 07             	lea    0x7(%eax),%edx
    84d2:	85 c0                	test   %eax,%eax
    84d4:	0f 48 c2             	cmovs  %edx,%eax
    84d7:	c1 f8 03             	sar    $0x3,%eax
    84da:	89 45 f8             	mov    %eax,-0x8(%ebp)
    84dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    84e0:	99                   	cltd   
    84e1:	c1 ea 1d             	shr    $0x1d,%edx
    84e4:	01 d0                	add    %edx,%eax
    84e6:	83 e0 07             	and    $0x7,%eax
    84e9:	29 d0                	sub    %edx,%eax
    84eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    84ee:	8b 45 08             	mov    0x8(%ebp),%eax
    84f1:	8b 10                	mov    (%eax),%edx
    84f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    84f6:	01 d0                	add    %edx,%eax
    84f8:	0f b6 00             	movzbl (%eax),%eax
    84fb:	88 45 f3             	mov    %al,-0xd(%ebp)
    84fe:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
    8502:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8505:	bb 01 00 00 00       	mov    $0x1,%ebx
    850a:	89 c1                	mov    %eax,%ecx
    850c:	d3 e3                	shl    %cl,%ebx
    850e:	89 d8                	mov    %ebx,%eax
    8510:	21 c2                	and    %eax,%edx
    8512:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8515:	89 c1                	mov    %eax,%ecx
    8517:	d3 fa                	sar    %cl,%edx
    8519:	89 d0                	mov    %edx,%eax
    851b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    851e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    8522:	0f 9f c0             	setg   %al
    8525:	0f b6 c0             	movzbl %al,%eax
    8528:	83 c4 10             	add    $0x10,%esp
    852b:	5b                   	pop    %ebx
    852c:	5d                   	pop    %ebp
    852d:	c3                   	ret    

0000852e <set_bit_val>:
    852e:	55                   	push   %ebp
    852f:	89 e5                	mov    %esp,%ebp
    8531:	83 ec 10             	sub    $0x10,%esp
    8534:	8b 45 0c             	mov    0xc(%ebp),%eax
    8537:	8d 50 07             	lea    0x7(%eax),%edx
    853a:	85 c0                	test   %eax,%eax
    853c:	0f 48 c2             	cmovs  %edx,%eax
    853f:	c1 f8 03             	sar    $0x3,%eax
    8542:	89 45 fc             	mov    %eax,-0x4(%ebp)
    8545:	8b 45 0c             	mov    0xc(%ebp),%eax
    8548:	99                   	cltd   
    8549:	c1 ea 1d             	shr    $0x1d,%edx
    854c:	01 d0                	add    %edx,%eax
    854e:	83 e0 07             	and    $0x7,%eax
    8551:	29 d0                	sub    %edx,%eax
    8553:	89 45 f8             	mov    %eax,-0x8(%ebp)
    8556:	8b 45 08             	mov    0x8(%ebp),%eax
    8559:	8b 10                	mov    (%eax),%edx
    855b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    855e:	01 d0                	add    %edx,%eax
    8560:	0f b6 00             	movzbl (%eax),%eax
    8563:	88 45 f7             	mov    %al,-0x9(%ebp)
    8566:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    856a:	7e 13                	jle    857f <set_bit_val+0x51>
    856c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    856f:	ba 01 00 00 00       	mov    $0x1,%edx
    8574:	89 c1                	mov    %eax,%ecx
    8576:	d3 e2                	shl    %cl,%edx
    8578:	89 d0                	mov    %edx,%eax
    857a:	08 45 f7             	or     %al,-0x9(%ebp)
    857d:	eb 13                	jmp    8592 <set_bit_val+0x64>
    857f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    8582:	ba 01 00 00 00       	mov    $0x1,%edx
    8587:	89 c1                	mov    %eax,%ecx
    8589:	d3 e2                	shl    %cl,%edx
    858b:	89 d0                	mov    %edx,%eax
    858d:	f7 d0                	not    %eax
    858f:	20 45 f7             	and    %al,-0x9(%ebp)
    8592:	b8 01 00 00 00       	mov    $0x1,%eax
    8597:	c9                   	leave  
    8598:	c3                   	ret    

00008599 <set_bits>:
    8599:	55                   	push   %ebp
    859a:	89 e5                	mov    %esp,%ebp
    859c:	83 ec 10             	sub    $0x10,%esp
    859f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    85a6:	eb 1c                	jmp    85c4 <set_bits+0x2b>
    85a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    85ab:	8d 50 01             	lea    0x1(%eax),%edx
    85ae:	89 55 0c             	mov    %edx,0xc(%ebp)
    85b1:	ff 75 10             	pushl  0x10(%ebp)
    85b4:	50                   	push   %eax
    85b5:	ff 75 08             	pushl  0x8(%ebp)
    85b8:	e8 71 ff ff ff       	call   852e <set_bit_val>
    85bd:	83 c4 0c             	add    $0xc,%esp
    85c0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    85c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    85c7:	3b 45 14             	cmp    0x14(%ebp),%eax
    85ca:	7c dc                	jl     85a8 <set_bits+0xf>
    85cc:	b8 01 00 00 00       	mov    $0x1,%eax
    85d1:	c9                   	leave  
    85d2:	c3                   	ret    

000085d3 <get_first_free_bit>:
    85d3:	55                   	push   %ebp
    85d4:	89 e5                	mov    %esp,%ebp
    85d6:	83 ec 10             	sub    $0x10,%esp
    85d9:	8b 45 08             	mov    0x8(%ebp),%eax
    85dc:	8b 40 04             	mov    0x4(%eax),%eax
    85df:	c1 e0 03             	shl    $0x3,%eax
    85e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    85e5:	8b 45 0c             	mov    0xc(%ebp),%eax
    85e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    85eb:	eb 1b                	jmp    8608 <get_first_free_bit+0x35>
    85ed:	ff 75 fc             	pushl  -0x4(%ebp)
    85f0:	ff 75 08             	pushl  0x8(%ebp)
    85f3:	e8 cd fe ff ff       	call   84c5 <test_bit_val>
    85f8:	83 c4 08             	add    $0x8,%esp
    85fb:	85 c0                	test   %eax,%eax
    85fd:	75 05                	jne    8604 <get_first_free_bit+0x31>
    85ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
    8602:	eb 11                	jmp    8615 <get_first_free_bit+0x42>
    8604:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    8608:	8b 45 fc             	mov    -0x4(%ebp),%eax
    860b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    860e:	7c dd                	jl     85ed <get_first_free_bit+0x1a>
    8610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    8615:	c9                   	leave  
    8616:	c3                   	ret    

00008617 <get_bits>:
    8617:	55                   	push   %ebp
    8618:	89 e5                	mov    %esp,%ebp
    861a:	83 ec 20             	sub    $0x20,%esp
    861d:	6a 00                	push   $0x0
    861f:	ff 75 08             	pushl  0x8(%ebp)
    8622:	e8 ac ff ff ff       	call   85d3 <get_first_free_bit>
    8627:	83 c4 08             	add    $0x8,%esp
    862a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    862d:	8b 45 08             	mov    0x8(%ebp),%eax
    8630:	8b 40 04             	mov    0x4(%eax),%eax
    8633:	c1 e0 03             	shl    $0x3,%eax
    8636:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8639:	8b 45 0c             	mov    0xc(%ebp),%eax
    863c:	83 e8 01             	sub    $0x1,%eax
    863f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    8642:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8645:	83 c0 01             	add    $0x1,%eax
    8648:	89 45 f8             	mov    %eax,-0x8(%ebp)
    864b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    864e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8651:	eb 58                	jmp    86ab <get_bits+0x94>
    8653:	ff 75 f8             	pushl  -0x8(%ebp)
    8656:	ff 75 08             	pushl  0x8(%ebp)
    8659:	e8 67 fe ff ff       	call   84c5 <test_bit_val>
    865e:	83 c4 08             	add    $0x8,%esp
    8661:	85 c0                	test   %eax,%eax
    8663:	75 0a                	jne    866f <get_bits+0x58>
    8665:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    8669:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    866d:	eb 2b                	jmp    869a <get_bits+0x83>
    866f:	6a 00                	push   $0x0
    8671:	ff 75 08             	pushl  0x8(%ebp)
    8674:	e8 5a ff ff ff       	call   85d3 <get_first_free_bit>
    8679:	83 c4 08             	add    $0x8,%esp
    867c:	83 c0 01             	add    $0x1,%eax
    867f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8682:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8685:	83 c0 01             	add    $0x1,%eax
    8688:	89 45 f8             	mov    %eax,-0x8(%ebp)
    868b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    868e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8691:	8b 45 0c             	mov    0xc(%ebp),%eax
    8694:	83 e8 01             	sub    $0x1,%eax
    8697:	89 45 fc             	mov    %eax,-0x4(%ebp)
    869a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    869d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    86a0:	7c 09                	jl     86ab <get_bits+0x94>
    86a2:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
    86a9:	eb 0d                	jmp    86b8 <get_bits+0xa1>
    86ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    86ae:	8d 50 ff             	lea    -0x1(%eax),%edx
    86b1:	89 55 fc             	mov    %edx,-0x4(%ebp)
    86b4:	85 c0                	test   %eax,%eax
    86b6:	7f 9b                	jg     8653 <get_bits+0x3c>
    86b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86bb:	2b 45 0c             	sub    0xc(%ebp),%eax
    86be:	83 c0 01             	add    $0x1,%eax
    86c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
    86c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    86c7:	c9                   	leave  
    86c8:	c3                   	ret    

000086c9 <get_a_page>:
    86c9:	55                   	push   %ebp
    86ca:	89 e5                	mov    %esp,%ebp
    86cc:	83 ec 20             	sub    $0x20,%esp
    86cf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    86d3:	75 22                	jne    86f7 <get_a_page+0x2e>
    86d5:	a1 6c f6 00 00       	mov    0xf66c,%eax
    86da:	89 45 e8             	mov    %eax,-0x18(%ebp)
    86dd:	a1 70 f6 00 00       	mov    0xf670,%eax
    86e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    86e5:	a1 74 f6 00 00       	mov    0xf674,%eax
    86ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
    86ed:	a1 78 f6 00 00       	mov    0xf678,%eax
    86f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    86f5:	eb 20                	jmp    8717 <get_a_page+0x4e>
    86f7:	a1 a4 fe 00 00       	mov    0xfea4,%eax
    86fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
    86ff:	a1 a8 fe 00 00       	mov    0xfea8,%eax
    8704:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8707:	a1 ac fe 00 00       	mov    0xfeac,%eax
    870c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    870f:	a1 b0 fe 00 00       	mov    0xfeb0,%eax
    8714:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8717:	8b 45 e8             	mov    -0x18(%ebp),%eax
    871a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    871d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8720:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    8723:	6a 01                	push   $0x1
    8725:	8d 45 e0             	lea    -0x20(%ebp),%eax
    8728:	50                   	push   %eax
    8729:	e8 e9 fe ff ff       	call   8617 <get_bits>
    872e:	83 c4 08             	add    $0x8,%esp
    8731:	89 45 fc             	mov    %eax,-0x4(%ebp)
    8734:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8737:	8b 55 fc             	mov    -0x4(%ebp),%edx
    873a:	c1 e2 0c             	shl    $0xc,%edx
    873d:	01 d0                	add    %edx,%eax
    873f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    8742:	6a 01                	push   $0x1
    8744:	ff 75 fc             	pushl  -0x4(%ebp)
    8747:	8d 45 e0             	lea    -0x20(%ebp),%eax
    874a:	50                   	push   %eax
    874b:	e8 de fd ff ff       	call   852e <set_bit_val>
    8750:	83 c4 0c             	add    $0xc,%esp
    8753:	8b 45 f8             	mov    -0x8(%ebp),%eax
    8756:	c9                   	leave  
    8757:	c3                   	ret    

00008758 <get_virtual_address>:
    8758:	55                   	push   %ebp
    8759:	89 e5                	mov    %esp,%ebp
    875b:	83 ec 20             	sub    $0x20,%esp
    875e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    8762:	75 11                	jne    8775 <get_virtual_address+0x1d>
    8764:	a1 30 d7 00 00       	mov    0xd730,%eax
    8769:	8b 15 34 d7 00 00    	mov    0xd734,%edx
    876f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8772:	89 55 f4             	mov    %edx,-0xc(%ebp)
    8775:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8778:	8b 55 f4             	mov    -0xc(%ebp),%edx
    877b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    877e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    8781:	ff 75 08             	pushl  0x8(%ebp)
    8784:	8d 45 e8             	lea    -0x18(%ebp),%eax
    8787:	50                   	push   %eax
    8788:	e8 8a fe ff ff       	call   8617 <get_bits>
    878d:	83 c4 08             	add    $0x8,%esp
    8790:	89 45 fc             	mov    %eax,-0x4(%ebp)
    8793:	8b 45 fc             	mov    -0x4(%ebp),%eax
    8796:	c1 e0 0c             	shl    $0xc,%eax
    8799:	89 45 f8             	mov    %eax,-0x8(%ebp)
    879c:	ff 75 08             	pushl  0x8(%ebp)
    879f:	6a 01                	push   $0x1
    87a1:	ff 75 fc             	pushl  -0x4(%ebp)
    87a4:	8d 45 e8             	lea    -0x18(%ebp),%eax
    87a7:	50                   	push   %eax
    87a8:	e8 ec fd ff ff       	call   8599 <set_bits>
    87ad:	83 c4 10             	add    $0x10,%esp
    87b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    87b3:	c9                   	leave  
    87b4:	c3                   	ret    

000087b5 <ptr_pde>:
    87b5:	55                   	push   %ebp
    87b6:	89 e5                	mov    %esp,%ebp
    87b8:	8b 45 08             	mov    0x8(%ebp),%eax
    87bb:	c1 f8 16             	sar    $0x16,%eax
    87be:	2d 00 04 00 00       	sub    $0x400,%eax
    87c3:	c1 e0 02             	shl    $0x2,%eax
    87c6:	5d                   	pop    %ebp
    87c7:	c3                   	ret    

000087c8 <ptr_pte>:
    87c8:	55                   	push   %ebp
    87c9:	89 e5                	mov    %esp,%ebp
    87cb:	8b 45 08             	mov    0x8(%ebp),%eax
    87ce:	c1 f8 16             	sar    $0x16,%eax
    87d1:	8d 90 00 00 c0 ff    	lea    -0x400000(%eax),%edx
    87d7:	8b 45 08             	mov    0x8(%ebp),%eax
    87da:	c1 f8 0c             	sar    $0xc,%eax
    87dd:	25 ff 03 00 00       	and    $0x3ff,%eax
    87e2:	83 c0 03             	add    $0x3,%eax
    87e5:	c1 e0 02             	shl    $0x2,%eax
    87e8:	89 c1                	mov    %eax,%ecx
    87ea:	d3 e2                	shl    %cl,%edx
    87ec:	89 d0                	mov    %edx,%eax
    87ee:	5d                   	pop    %ebp
    87ef:	c3                   	ret    

000087f0 <add_map_entry>:
    87f0:	55                   	push   %ebp
    87f1:	89 e5                	mov    %esp,%ebp
    87f3:	83 ec 18             	sub    $0x18,%esp
    87f6:	ff 75 08             	pushl  0x8(%ebp)
    87f9:	e8 b7 ff ff ff       	call   87b5 <ptr_pde>
    87fe:	83 c4 04             	add    $0x4,%esp
    8801:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8804:	ff 75 08             	pushl  0x8(%ebp)
    8807:	e8 bc ff ff ff       	call   87c8 <ptr_pte>
    880c:	83 c4 04             	add    $0x4,%esp
    880f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8812:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8815:	8b 00                	mov    (%eax),%eax
    8817:	83 e0 01             	and    $0x1,%eax
    881a:	85 c0                	test   %eax,%eax
    881c:	74 16                	je     8834 <add_map_entry+0x44>
    881e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8821:	8b 00                	mov    (%eax),%eax
    8823:	83 e0 01             	and    $0x1,%eax
    8826:	85 c0                	test   %eax,%eax
    8828:	75 3c                	jne    8866 <add_map_entry+0x76>
    882a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    882d:	8b 55 0c             	mov    0xc(%ebp),%edx
    8830:	89 10                	mov    %edx,(%eax)
    8832:	eb 32                	jmp    8866 <add_map_entry+0x76>
    8834:	6a 00                	push   $0x0
    8836:	e8 8e fe ff ff       	call   86c9 <get_a_page>
    883b:	83 c4 04             	add    $0x4,%esp
    883e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8841:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8844:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8847:	89 10                	mov    %edx,(%eax)
    8849:	83 ec 04             	sub    $0x4,%esp
    884c:	68 00 10 00 00       	push   $0x1000
    8851:	6a 00                	push   $0x0
    8853:	ff 75 f4             	pushl  -0xc(%ebp)
    8856:	e8 66 0c 00 00       	call   94c1 <Memset>
    885b:	83 c4 10             	add    $0x10,%esp
    885e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8861:	8b 55 0c             	mov    0xc(%ebp),%edx
    8864:	89 10                	mov    %edx,(%eax)
    8866:	90                   	nop
    8867:	c9                   	leave  
    8868:	c3                   	ret    

00008869 <alloc_memory>:
    8869:	55                   	push   %ebp
    886a:	89 e5                	mov    %esp,%ebp
    886c:	83 ec 18             	sub    $0x18,%esp
    886f:	ff 75 0c             	pushl  0xc(%ebp)
    8872:	ff 75 08             	pushl  0x8(%ebp)
    8875:	e8 de fe ff ff       	call   8758 <get_virtual_address>
    887a:	83 c4 08             	add    $0x8,%esp
    887d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    8880:	eb 26                	jmp    88a8 <alloc_memory+0x3f>
    8882:	ff 75 0c             	pushl  0xc(%ebp)
    8885:	e8 3f fe ff ff       	call   86c9 <get_a_page>
    888a:	83 c4 04             	add    $0x4,%esp
    888d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8890:	83 ec 08             	sub    $0x8,%esp
    8893:	ff 75 f0             	pushl  -0x10(%ebp)
    8896:	ff 75 f4             	pushl  -0xc(%ebp)
    8899:	e8 52 ff ff ff       	call   87f0 <add_map_entry>
    889e:	83 c4 10             	add    $0x10,%esp
    88a1:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    88a8:	8b 45 08             	mov    0x8(%ebp),%eax
    88ab:	8d 50 ff             	lea    -0x1(%eax),%edx
    88ae:	89 55 08             	mov    %edx,0x8(%ebp)
    88b1:	85 c0                	test   %eax,%eax
    88b3:	75 cd                	jne    8882 <alloc_memory+0x19>
    88b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88b8:	c9                   	leave  
    88b9:	c3                   	ret    

000088ba <init_memory>:
    88ba:	55                   	push   %ebp
    88bb:	89 e5                	mov    %esp,%ebp
    88bd:	83 ec 28             	sub    $0x28,%esp
    88c0:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
    88c7:	c7 05 74 f6 00 00 00 	movl   $0x102000,0xf674
    88ce:	20 10 00 
    88d1:	a1 74 f6 00 00       	mov    0xf674,%eax
    88d6:	29 45 f4             	sub    %eax,-0xc(%ebp)
    88d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88dc:	89 c2                	mov    %eax,%edx
    88de:	c1 ea 1f             	shr    $0x1f,%edx
    88e1:	01 d0                	add    %edx,%eax
    88e3:	d1 f8                	sar    %eax
    88e5:	a3 78 f6 00 00       	mov    %eax,0xf678
    88ea:	a1 78 f6 00 00       	mov    0xf678,%eax
    88ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
    88f2:	29 c2                	sub    %eax,%edx
    88f4:	89 d0                	mov    %edx,%eax
    88f6:	a3 b0 fe 00 00       	mov    %eax,0xfeb0
    88fb:	a1 78 f6 00 00       	mov    0xf678,%eax
    8900:	05 ff 0f 00 00       	add    $0xfff,%eax
    8905:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
    890b:	85 c0                	test   %eax,%eax
    890d:	0f 48 c2             	cmovs  %edx,%eax
    8910:	c1 f8 0c             	sar    $0xc,%eax
    8913:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8916:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8919:	83 c0 07             	add    $0x7,%eax
    891c:	8d 50 07             	lea    0x7(%eax),%edx
    891f:	85 c0                	test   %eax,%eax
    8921:	0f 48 c2             	cmovs  %edx,%eax
    8924:	c1 f8 03             	sar    $0x3,%eax
    8927:	a3 70 f6 00 00       	mov    %eax,0xf670
    892c:	a1 74 f6 00 00       	mov    0xf674,%eax
    8931:	a3 6c f6 00 00       	mov    %eax,0xf66c
    8936:	66 87 db             	xchg   %bx,%bx
    8939:	8b 15 70 f6 00 00    	mov    0xf670,%edx
    893f:	a1 6c f6 00 00       	mov    0xf66c,%eax
    8944:	83 ec 04             	sub    $0x4,%esp
    8947:	52                   	push   %edx
    8948:	6a 00                	push   $0x0
    894a:	50                   	push   %eax
    894b:	e8 71 0b 00 00       	call   94c1 <Memset>
    8950:	83 c4 10             	add    $0x10,%esp
    8953:	a1 70 f6 00 00       	mov    0xf670,%eax
    8958:	05 ff 0f 00 00       	add    $0xfff,%eax
    895d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
    8963:	85 c0                	test   %eax,%eax
    8965:	0f 48 c2             	cmovs  %edx,%eax
    8968:	c1 f8 0c             	sar    $0xc,%eax
    896b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    896e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8971:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8974:	66 87 db             	xchg   %bx,%bx
    8977:	ff 75 ec             	pushl  -0x14(%ebp)
    897a:	6a 01                	push   $0x1
    897c:	6a 00                	push   $0x0
    897e:	68 6c f6 00 00       	push   $0xf66c
    8983:	e8 11 fc ff ff       	call   8599 <set_bits>
    8988:	83 c4 10             	add    $0x10,%esp
    898b:	a1 b0 fe 00 00       	mov    0xfeb0,%eax
    8990:	05 ff 0f 00 00       	add    $0xfff,%eax
    8995:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
    899b:	85 c0                	test   %eax,%eax
    899d:	0f 48 c2             	cmovs  %edx,%eax
    89a0:	c1 f8 0c             	sar    $0xc,%eax
    89a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    89a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    89a9:	83 c0 07             	add    $0x7,%eax
    89ac:	8d 50 07             	lea    0x7(%eax),%edx
    89af:	85 c0                	test   %eax,%eax
    89b1:	0f 48 c2             	cmovs  %edx,%eax
    89b4:	c1 f8 03             	sar    $0x3,%eax
    89b7:	a3 a8 fe 00 00       	mov    %eax,0xfea8
    89bc:	8b 15 74 f6 00 00    	mov    0xf674,%edx
    89c2:	a1 70 f6 00 00       	mov    0xf670,%eax
    89c7:	01 d0                	add    %edx,%eax
    89c9:	a3 a4 fe 00 00       	mov    %eax,0xfea4
    89ce:	66 87 db             	xchg   %bx,%bx
    89d1:	8b 15 a8 fe 00 00    	mov    0xfea8,%edx
    89d7:	a1 a4 fe 00 00       	mov    0xfea4,%eax
    89dc:	83 ec 04             	sub    $0x4,%esp
    89df:	52                   	push   %edx
    89e0:	6a 00                	push   $0x0
    89e2:	50                   	push   %eax
    89e3:	e8 d9 0a 00 00       	call   94c1 <Memset>
    89e8:	83 c4 10             	add    $0x10,%esp
    89eb:	a1 a8 fe 00 00       	mov    0xfea8,%eax
    89f0:	05 ff 0f 00 00       	add    $0xfff,%eax
    89f5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
    89fb:	85 c0                	test   %eax,%eax
    89fd:	0f 48 c2             	cmovs  %edx,%eax
    8a00:	c1 f8 0c             	sar    $0xc,%eax
    8a03:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8a06:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8a09:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8a0c:	66 87 db             	xchg   %bx,%bx
    8a0f:	ff 75 ec             	pushl  -0x14(%ebp)
    8a12:	6a 01                	push   $0x1
    8a14:	ff 75 e4             	pushl  -0x1c(%ebp)
    8a17:	68 6c f6 00 00       	push   $0xf66c
    8a1c:	e8 78 fb ff ff       	call   8599 <set_bits>
    8a21:	83 c4 10             	add    $0x10,%esp
    8a24:	c7 45 e0 00 00 10 00 	movl   $0x100000,-0x20(%ebp)
    8a2b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8a2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a34:	83 c0 07             	add    $0x7,%eax
    8a37:	8d 50 07             	lea    0x7(%eax),%edx
    8a3a:	85 c0                	test   %eax,%eax
    8a3c:	0f 48 c2             	cmovs  %edx,%eax
    8a3f:	c1 f8 03             	sar    $0x3,%eax
    8a42:	a3 34 d7 00 00       	mov    %eax,0xd734
    8a47:	66 87 db             	xchg   %bx,%bx
    8a4a:	8b 15 34 d7 00 00    	mov    0xd734,%edx
    8a50:	a1 30 d7 00 00       	mov    0xd730,%eax
    8a55:	83 ec 04             	sub    $0x4,%esp
    8a58:	52                   	push   %edx
    8a59:	6a 00                	push   $0x0
    8a5b:	50                   	push   %eax
    8a5c:	e8 60 0a 00 00       	call   94c1 <Memset>
    8a61:	83 c4 10             	add    $0x10,%esp
    8a64:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8a67:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a6a:	01 d0                	add    %edx,%eax
    8a6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8a6f:	66 87 db             	xchg   %bx,%bx
    8a72:	ff 75 f0             	pushl  -0x10(%ebp)
    8a75:	6a 01                	push   $0x1
    8a77:	ff 75 e4             	pushl  -0x1c(%ebp)
    8a7a:	68 6c f6 00 00       	push   $0xf66c
    8a7f:	e8 15 fb ff ff       	call   8599 <set_bits>
    8a84:	83 c4 10             	add    $0x10,%esp
    8a87:	90                   	nop
    8a88:	c9                   	leave  
    8a89:	c3                   	ret    
