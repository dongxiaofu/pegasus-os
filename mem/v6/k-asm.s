
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00001000 <_start>:
    1000:	c7 05 30 d7 00 00 00 	movl   $0x0,0xd730
    1007:	00 00 00 
    100a:	b4 0b                	mov    $0xb,%ah
    100c:	b0 4c                	mov    $0x4c,%al
    100e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
    1015:	bc 00 cf 00 00       	mov    $0xcf00,%esp
    101a:	66 c7 05 30 d7 00 00 	movw   $0x0,0xd730
    1021:	00 00 
    1023:	0f 01 05 78 f6 00 00 	sgdtl  0xf678
    102a:	e8 f5 5b 00 00       	call   6c24 <ReloadGDT>
    102f:	0f 01 15 78 f6 00 00 	lgdtl  0xf678
    1036:	0f 01 1d 28 d7 00 00 	lidtl  0xd728
    103d:	ea 44 10 00 00 08 00 	ljmp   $0x8,$0x1044

00001044 <csinit>:
    1044:	31 c0                	xor    %eax,%eax
    1046:	66 b8 40 00          	mov    $0x40,%ax
    104a:	0f 00 d8             	ltr    %ax
    104d:	e9 13 0a 00 00       	jmp    1a65 <kernel_main>
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
    1069:	e8 42 09 00 00       	call   19b0 <test>
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
    1094:	8b 3d 30 d7 00 00    	mov    0xd730,%edi

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
    10bd:	89 3d 30 d7 00 00    	mov    %edi,0xd730
    10c3:	89 ec                	mov    %ebp,%esp
    10c5:	5d                   	pop    %ebp
    10c6:	c3                   	ret    

000010c7 <disp_str_colour>:
    10c7:	55                   	push   %ebp
    10c8:	89 e5                	mov    %esp,%ebp
    10ca:	8b 75 08             	mov    0x8(%ebp),%esi
    10cd:	8a 65 0c             	mov    0xc(%ebp),%ah
    10d0:	8b 3d 30 d7 00 00    	mov    0xd730,%edi

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
    10f9:	89 3d 30 d7 00 00    	mov    %edi,0xd730
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
    1182:	ff 05 34 d7 00 00    	incl   0xd734
    1188:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
    118f:	75 05                	jne    1196 <hwint0.2>

00001191 <hwint0.1>:
    1191:	bc 00 d7 00 00       	mov    $0xd700,%esp

00001196 <hwint0.2>:
    1196:	fb                   	sti    
    1197:	e8 b3 56 00 00       	call   684f <clock_handler>
    119c:	b0 f8                	mov    $0xf8,%al
    119e:	e6 21                	out    %al,$0x21
    11a0:	fa                   	cli    
    11a1:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
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
    11cb:	ff 05 34 d7 00 00    	incl   0xd734
    11d1:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
    11d8:	75 05                	jne    11df <hwint1.2>

000011da <hwint1.1>:
    11da:	bc 00 d7 00 00       	mov    $0xd700,%esp

000011df <hwint1.2>:
    11df:	fb                   	sti    
    11e0:	e8 f2 64 00 00       	call   76d7 <keyboard_handler>
    11e5:	b0 f8                	mov    $0xf8,%al
    11e7:	e6 21                	out    %al,$0x21
    11e9:	fa                   	cli    
    11ea:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
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
    1217:	ff 05 34 d7 00 00    	incl   0xd734
    121d:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
    1224:	75 05                	jne    122b <hwint14.2>

00001226 <hwint14.1>:
    1226:	bc 00 d7 00 00       	mov    $0xd700,%esp

0000122b <hwint14.2>:
    122b:	fb                   	sti    
    122c:	e8 12 34 00 00       	call   4643 <hd_handler>
    1231:	b0 bf                	mov    $0xbf,%al
    1233:	e6 a1                	out    %al,$0xa1
    1235:	fa                   	cli    
    1236:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
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
    1257:	ff 05 34 d7 00 00    	incl   0xd734
    125d:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
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
    1284:	83 3d 34 d7 00 00 00 	cmpl   $0x0,0xd734
    128b:	75 38                	jne    12c5 <reenter_restore>
    128d:	eb 22                	jmp    12b1 <restore>

0000128f <restart>:
    128f:	ff 0d 34 d7 00 00    	decl   0xd734
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
    12c5:	ff 0d 34 d7 00 00    	decl   0xd734
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
    1344:	ff 35 34 d7 00 00    	pushl  0xd734
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
    13d2:	e8 07 67 00 00       	call   7ade <open>
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
    1429:	e8 ab 7d 00 00       	call   91d9 <Memset>
    142e:	83 c4 10             	add    $0x10,%esp
    1431:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1434:	c1 e0 09             	shl    $0x9,%eax
    1437:	2b 45 f4             	sub    -0xc(%ebp),%eax
    143a:	83 ec 04             	sub    $0x4,%esp
    143d:	50                   	push   %eax
    143e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1444:	50                   	push   %eax
    1445:	ff 75 e4             	pushl  -0x1c(%ebp)
    1448:	e8 e6 66 00 00       	call   7b33 <read>
    144d:	83 c4 10             	add    $0x10,%esp
    1450:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1457:	83 ec 04             	sub    $0x4,%esp
    145a:	68 00 20 00 00       	push   $0x2000
    145f:	6a 00                	push   $0x0
    1461:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1467:	50                   	push   %eax
    1468:	e8 6c 7d 00 00       	call   91d9 <Memset>
    146d:	83 c4 10             	add    $0x10,%esp
    1470:	83 ec 04             	sub    $0x4,%esp
    1473:	68 00 02 00 00       	push   $0x200
    1478:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    147e:	50                   	push   %eax
    147f:	ff 75 e4             	pushl  -0x1c(%ebp)
    1482:	e8 ac 66 00 00       	call   7b33 <read>
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
    14bb:	e8 1e 66 00 00       	call   7ade <open>
    14c0:	83 c4 10             	add    $0x10,%esp
    14c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    14c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14cd:	8b 45 d0             	mov    -0x30(%ebp),%eax
    14d0:	83 c0 7c             	add    $0x7c,%eax
    14d3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    14d6:	83 ec 0c             	sub    $0xc,%esp
    14d9:	ff 75 cc             	pushl  -0x34(%ebp)
    14dc:	e8 31 7d 00 00       	call   9212 <Strlen>
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	85 c0                	test   %eax,%eax
    14e6:	75 16                	jne    14fe <untar+0x13d>
    14e8:	83 ec 0c             	sub    $0xc,%esp
    14eb:	ff 75 c4             	pushl  -0x3c(%ebp)
    14ee:	e8 1f 7d 00 00       	call   9212 <Strlen>
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
    155c:	e8 78 7c 00 00       	call   91d9 <Memset>
    1561:	83 c4 10             	add    $0x10,%esp
    1564:	83 ec 04             	sub    $0x4,%esp
    1567:	ff 75 bc             	pushl  -0x44(%ebp)
    156a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    1570:	50                   	push   %eax
    1571:	ff 75 e4             	pushl  -0x1c(%ebp)
    1574:	e8 ba 65 00 00       	call   7b33 <read>
    1579:	83 c4 10             	add    $0x10,%esp
    157c:	01 45 f4             	add    %eax,-0xc(%ebp)
    157f:	83 ec 04             	sub    $0x4,%esp
    1582:	ff 75 bc             	pushl  -0x44(%ebp)
    1585:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
    158b:	50                   	push   %eax
    158c:	ff 75 c8             	pushl  -0x38(%ebp)
    158f:	e8 d6 65 00 00       	call   7b6a <write>
    1594:	83 c4 10             	add    $0x10,%esp
    1597:	8b 45 bc             	mov    -0x44(%ebp),%eax
    159a:	29 45 e8             	sub    %eax,-0x18(%ebp)
    159d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15a1:	75 9b                	jne    153e <untar+0x17d>
    15a3:	83 ec 0c             	sub    $0xc,%esp
    15a6:	ff 75 c8             	pushl  -0x38(%ebp)
    15a9:	e8 f3 65 00 00       	call   7ba1 <close>
    15ae:	83 c4 10             	add    $0x10,%esp
    15b1:	e9 43 fe ff ff       	jmp    13f9 <untar+0x38>
    15b6:	90                   	nop
    15b7:	eb 01                	jmp    15ba <untar+0x1f9>
    15b9:	90                   	nop
    15ba:	83 ec 0c             	sub    $0xc,%esp
    15bd:	ff 75 e4             	pushl  -0x1c(%ebp)
    15c0:	e8 dc 65 00 00       	call   7ba1 <close>
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
    16a6:	bb e0 89 00 00       	mov    $0x89e0,%ebx
    16ab:	ba 13 00 00 00       	mov    $0x13,%edx
    16b0:	89 c7                	mov    %eax,%edi
    16b2:	89 de                	mov    %ebx,%esi
    16b4:	89 d1                	mov    %edx,%ecx
    16b6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    16b8:	c7 05 30 d7 00 00 6a 	movl   $0x2e6a,0xd730
    16bf:	2e 00 00 
    16c2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    16c9:	eb 14                	jmp    16df <exception_handler+0x45>
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	68 c0 87 00 00       	push   $0x87c0
    16d3:	e8 b4 f9 ff ff       	call   108c <disp_str>
    16d8:	83 c4 10             	add    $0x10,%esp
    16db:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    16df:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
    16e6:	7e e3                	jle    16cb <exception_handler+0x31>
    16e8:	c7 05 30 d7 00 00 6a 	movl   $0x2e6a,0xd730
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
    1717:	68 c2 87 00 00       	push   $0x87c2
    171c:	e8 6b f9 ff ff       	call   108c <disp_str>
    1721:	83 c4 10             	add    $0x10,%esp
    1724:	83 ec 08             	sub    $0x8,%esp
    1727:	ff 75 e0             	pushl  -0x20(%ebp)
    172a:	68 c5 87 00 00       	push   $0x87c5
    172f:	e8 93 f9 ff ff       	call   10c7 <disp_str_colour>
    1734:	83 c4 10             	add    $0x10,%esp
    1737:	83 ec 0c             	sub    $0xc,%esp
    173a:	ff 75 08             	pushl  0x8(%ebp)
    173d:	e8 2f ff ff ff       	call   1671 <disp_int>
    1742:	83 c4 10             	add    $0x10,%esp
    1745:	83 ec 0c             	sub    $0xc,%esp
    1748:	68 c2 87 00 00       	push   $0x87c2
    174d:	e8 3a f9 ff ff       	call   108c <disp_str>
    1752:	83 c4 10             	add    $0x10,%esp
    1755:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
    1759:	74 44                	je     179f <exception_handler+0x105>
    175b:	83 ec 08             	sub    $0x8,%esp
    175e:	ff 75 e0             	pushl  -0x20(%ebp)
    1761:	68 cd 87 00 00       	push   $0x87cd
    1766:	e8 5c f9 ff ff       	call   10c7 <disp_str_colour>
    176b:	83 c4 10             	add    $0x10,%esp
    176e:	83 ec 08             	sub    $0x8,%esp
    1771:	ff 75 e0             	pushl  -0x20(%ebp)
    1774:	68 cd 87 00 00       	push   $0x87cd
    1779:	e8 49 f9 ff ff       	call   10c7 <disp_str_colour>
    177e:	83 c4 10             	add    $0x10,%esp
    1781:	83 ec 0c             	sub    $0xc,%esp
    1784:	ff 75 0c             	pushl  0xc(%ebp)
    1787:	e8 e5 fe ff ff       	call   1671 <disp_int>
    178c:	83 c4 10             	add    $0x10,%esp
    178f:	83 ec 0c             	sub    $0xc,%esp
    1792:	68 c2 87 00 00       	push   $0x87c2
    1797:	e8 f0 f8 ff ff       	call   108c <disp_str>
    179c:	83 c4 10             	add    $0x10,%esp
    179f:	83 ec 08             	sub    $0x8,%esp
    17a2:	ff 75 e0             	pushl  -0x20(%ebp)
    17a5:	68 d7 87 00 00       	push   $0x87d7
    17aa:	e8 18 f9 ff ff       	call   10c7 <disp_str_colour>
    17af:	83 c4 10             	add    $0x10,%esp
    17b2:	83 ec 0c             	sub    $0xc,%esp
    17b5:	ff 75 14             	pushl  0x14(%ebp)
    17b8:	e8 b4 fe ff ff       	call   1671 <disp_int>
    17bd:	83 c4 10             	add    $0x10,%esp
    17c0:	83 ec 0c             	sub    $0xc,%esp
    17c3:	68 c2 87 00 00       	push   $0x87c2
    17c8:	e8 bf f8 ff ff       	call   108c <disp_str>
    17cd:	83 c4 10             	add    $0x10,%esp
    17d0:	83 ec 08             	sub    $0x8,%esp
    17d3:	ff 75 e0             	pushl  -0x20(%ebp)
    17d6:	68 db 87 00 00       	push   $0x87db
    17db:	e8 e7 f8 ff ff       	call   10c7 <disp_str_colour>
    17e0:	83 c4 10             	add    $0x10,%esp
    17e3:	83 ec 0c             	sub    $0xc,%esp
    17e6:	ff 75 10             	pushl  0x10(%ebp)
    17e9:	e8 83 fe ff ff       	call   1671 <disp_int>
    17ee:	83 c4 10             	add    $0x10,%esp
    17f1:	83 ec 0c             	sub    $0xc,%esp
    17f4:	68 c2 87 00 00       	push   $0x87c2
    17f9:	e8 8e f8 ff ff       	call   108c <disp_str>
    17fe:	83 c4 10             	add    $0x10,%esp
    1801:	83 ec 08             	sub    $0x8,%esp
    1804:	ff 75 e0             	pushl  -0x20(%ebp)
    1807:	68 e0 87 00 00       	push   $0x87e0
    180c:	e8 b6 f8 ff ff       	call   10c7 <disp_str_colour>
    1811:	83 c4 10             	add    $0x10,%esp
    1814:	83 ec 0c             	sub    $0xc,%esp
    1817:	ff 75 18             	pushl  0x18(%ebp)
    181a:	e8 52 fe ff ff       	call   1671 <disp_int>
    181f:	83 c4 10             	add    $0x10,%esp
    1822:	83 ec 0c             	sub    $0xc,%esp
    1825:	68 c2 87 00 00       	push   $0x87c2
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
    184c:	e8 77 53 00 00       	call   6bc8 <InitInterruptDesc>
    1851:	83 c4 10             	add    $0x10,%esp
    1854:	6a 0e                	push   $0xe
    1856:	6a 08                	push   $0x8
    1858:	68 09 11 00 00       	push   $0x1109
    185d:	6a 01                	push   $0x1
    185f:	e8 64 53 00 00       	call   6bc8 <InitInterruptDesc>
    1864:	83 c4 10             	add    $0x10,%esp
    1867:	6a 0e                	push   $0xe
    1869:	6a 08                	push   $0x8
    186b:	68 0f 11 00 00       	push   $0x110f
    1870:	6a 02                	push   $0x2
    1872:	e8 51 53 00 00       	call   6bc8 <InitInterruptDesc>
    1877:	83 c4 10             	add    $0x10,%esp
    187a:	6a 0e                	push   $0xe
    187c:	6a 08                	push   $0x8
    187e:	68 15 11 00 00       	push   $0x1115
    1883:	6a 03                	push   $0x3
    1885:	e8 3e 53 00 00       	call   6bc8 <InitInterruptDesc>
    188a:	83 c4 10             	add    $0x10,%esp
    188d:	6a 0e                	push   $0xe
    188f:	6a 08                	push   $0x8
    1891:	68 1b 11 00 00       	push   $0x111b
    1896:	6a 04                	push   $0x4
    1898:	e8 2b 53 00 00       	call   6bc8 <InitInterruptDesc>
    189d:	83 c4 10             	add    $0x10,%esp
    18a0:	6a 0e                	push   $0xe
    18a2:	6a 08                	push   $0x8
    18a4:	68 21 11 00 00       	push   $0x1121
    18a9:	6a 05                	push   $0x5
    18ab:	e8 18 53 00 00       	call   6bc8 <InitInterruptDesc>
    18b0:	83 c4 10             	add    $0x10,%esp
    18b3:	6a 0e                	push   $0xe
    18b5:	6a 08                	push   $0x8
    18b7:	68 27 11 00 00       	push   $0x1127
    18bc:	6a 06                	push   $0x6
    18be:	e8 05 53 00 00       	call   6bc8 <InitInterruptDesc>
    18c3:	83 c4 10             	add    $0x10,%esp
    18c6:	6a 0e                	push   $0xe
    18c8:	6a 08                	push   $0x8
    18ca:	68 2d 11 00 00       	push   $0x112d
    18cf:	6a 07                	push   $0x7
    18d1:	e8 f2 52 00 00       	call   6bc8 <InitInterruptDesc>
    18d6:	83 c4 10             	add    $0x10,%esp
    18d9:	6a 0e                	push   $0xe
    18db:	6a 08                	push   $0x8
    18dd:	68 33 11 00 00       	push   $0x1133
    18e2:	6a 08                	push   $0x8
    18e4:	e8 df 52 00 00       	call   6bc8 <InitInterruptDesc>
    18e9:	83 c4 10             	add    $0x10,%esp
    18ec:	6a 0e                	push   $0xe
    18ee:	6a 08                	push   $0x8
    18f0:	68 37 11 00 00       	push   $0x1137
    18f5:	6a 09                	push   $0x9
    18f7:	e8 cc 52 00 00       	call   6bc8 <InitInterruptDesc>
    18fc:	83 c4 10             	add    $0x10,%esp
    18ff:	6a 0e                	push   $0xe
    1901:	6a 08                	push   $0x8
    1903:	68 3d 11 00 00       	push   $0x113d
    1908:	6a 0a                	push   $0xa
    190a:	e8 b9 52 00 00       	call   6bc8 <InitInterruptDesc>
    190f:	83 c4 10             	add    $0x10,%esp
    1912:	6a 0e                	push   $0xe
    1914:	6a 08                	push   $0x8
    1916:	68 41 11 00 00       	push   $0x1141
    191b:	6a 0b                	push   $0xb
    191d:	e8 a6 52 00 00       	call   6bc8 <InitInterruptDesc>
    1922:	83 c4 10             	add    $0x10,%esp
    1925:	6a 0e                	push   $0xe
    1927:	6a 08                	push   $0x8
    1929:	68 45 11 00 00       	push   $0x1145
    192e:	6a 0c                	push   $0xc
    1930:	e8 93 52 00 00       	call   6bc8 <InitInterruptDesc>
    1935:	83 c4 10             	add    $0x10,%esp
    1938:	6a 0e                	push   $0xe
    193a:	6a 08                	push   $0x8
    193c:	68 49 11 00 00       	push   $0x1149
    1941:	6a 0d                	push   $0xd
    1943:	e8 80 52 00 00       	call   6bc8 <InitInterruptDesc>
    1948:	83 c4 10             	add    $0x10,%esp
    194b:	6a 0e                	push   $0xe
    194d:	6a 08                	push   $0x8
    194f:	68 4d 11 00 00       	push   $0x114d
    1954:	6a 0e                	push   $0xe
    1956:	e8 6d 52 00 00       	call   6bc8 <InitInterruptDesc>
    195b:	83 c4 10             	add    $0x10,%esp
    195e:	6a 0e                	push   $0xe
    1960:	6a 08                	push   $0x8
    1962:	68 51 11 00 00       	push   $0x1151
    1967:	6a 10                	push   $0x10
    1969:	e8 5a 52 00 00       	call   6bc8 <InitInterruptDesc>
    196e:	83 c4 10             	add    $0x10,%esp
    1971:	6a 0e                	push   $0xe
    1973:	6a 08                	push   $0x8
    1975:	68 57 11 00 00       	push   $0x1157
    197a:	6a 11                	push   $0x11
    197c:	e8 47 52 00 00       	call   6bc8 <InitInterruptDesc>
    1981:	83 c4 10             	add    $0x10,%esp
    1984:	6a 0e                	push   $0xe
    1986:	6a 08                	push   $0x8
    1988:	68 5b 11 00 00       	push   $0x115b
    198d:	6a 12                	push   $0x12
    198f:	e8 34 52 00 00       	call   6bc8 <InitInterruptDesc>
    1994:	83 c4 10             	add    $0x10,%esp
    1997:	6a 0e                	push   $0xe
    1999:	6a 0e                	push   $0xe
    199b:	68 45 12 00 00       	push   $0x1245
    19a0:	68 90 00 00 00       	push   $0x90
    19a5:	e8 1e 52 00 00       	call   6bc8 <InitInterruptDesc>
    19aa:	83 c4 10             	add    $0x10,%esp
    19ad:	90                   	nop
    19ae:	c9                   	leave  
    19af:	c3                   	ret    

000019b0 <test>:
    19b0:	55                   	push   %ebp
    19b1:	89 e5                	mov    %esp,%ebp
    19b3:	83 ec 08             	sub    $0x8,%esp
    19b6:	83 ec 0c             	sub    $0xc,%esp
    19b9:	68 2c 8a 00 00       	push   $0x8a2c
    19be:	e8 c9 f6 ff ff       	call   108c <disp_str>
    19c3:	83 c4 10             	add    $0x10,%esp
    19c6:	83 ec 0c             	sub    $0xc,%esp
    19c9:	6a 06                	push   $0x6
    19cb:	e8 a1 fc ff ff       	call   1671 <disp_int>
    19d0:	83 c4 10             	add    $0x10,%esp
    19d3:	83 ec 0c             	sub    $0xc,%esp
    19d6:	68 2e 8a 00 00       	push   $0x8a2e
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
    19f7:	68 30 8a 00 00       	push   $0x8a30
    19fc:	e8 c6 f6 ff ff       	call   10c7 <disp_str_colour>
    1a01:	83 c4 10             	add    $0x10,%esp
    1a04:	83 ec 0c             	sub    $0xc,%esp
    1a07:	ff 75 08             	pushl  0x8(%ebp)
    1a0a:	e8 62 fc ff ff       	call   1671 <disp_int>
    1a0f:	83 c4 10             	add    $0x10,%esp
    1a12:	a1 80 fe 00 00       	mov    0xfe80,%eax
    1a17:	83 c0 01             	add    $0x1,%eax
    1a1a:	a3 80 fe 00 00       	mov    %eax,0xfe80
    1a1f:	83 ec 0c             	sub    $0xc,%esp
    1a22:	68 57 8a 00 00       	push   $0x8a57
    1a27:	e8 60 f6 ff ff       	call   108c <disp_str>
    1a2c:	83 c4 10             	add    $0x10,%esp
    1a2f:	a1 80 fe 00 00       	mov    0xfe80,%eax
    1a34:	83 ec 0c             	sub    $0xc,%esp
    1a37:	50                   	push   %eax
    1a38:	e8 34 fc ff ff       	call   1671 <disp_int>
    1a3d:	83 c4 10             	add    $0x10,%esp
    1a40:	83 ec 0c             	sub    $0xc,%esp
    1a43:	68 59 8a 00 00       	push   $0x8a59
    1a48:	e8 3f f6 ff ff       	call   108c <disp_str>
    1a4d:	83 c4 10             	add    $0x10,%esp
    1a50:	83 ec 08             	sub    $0x8,%esp
    1a53:	6a 0c                	push   $0xc
    1a55:	68 5c 8a 00 00       	push   $0x8a5c
    1a5a:	e8 68 f6 ff ff       	call   10c7 <disp_str_colour>
    1a5f:	83 c4 10             	add    $0x10,%esp
    1a62:	90                   	nop
    1a63:	c9                   	leave  
    1a64:	c3                   	ret    

00001a65 <kernel_main>:
    1a65:	55                   	push   %ebp
    1a66:	89 e5                	mov    %esp,%ebp
    1a68:	83 ec 38             	sub    $0x38,%esp
    1a6b:	c7 05 80 fe 00 00 00 	movl   $0x0,0xfe80
    1a72:	00 00 00 
    1a75:	c7 05 6c f6 00 00 00 	movl   $0x0,0xf66c
    1a7c:	00 00 00 
    1a7f:	c7 05 34 d7 00 00 00 	movl   $0x0,0xd734
    1a86:	00 00 00 
    1a89:	c7 45 e8 60 11 08 00 	movl   $0x81160,-0x18(%ebp)
    1a90:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1a97:	e9 d4 02 00 00       	jmp    1d70 <kernel_main+0x30b>
    1a9c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1a9f:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    1aa5:	05 60 11 08 00       	add    $0x81160,%eax
    1aaa:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1aad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ab0:	83 c0 09             	add    $0x9,%eax
    1ab3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1aba:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1abd:	66 89 50 44          	mov    %dx,0x44(%eax)
    1ac1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1ac4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ac7:	89 50 58             	mov    %edx,0x58(%eax)
    1aca:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
    1ace:	7e 0f                	jle    1adf <kernel_main+0x7a>
    1ad0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ad3:	c6 80 7c 01 00 00 ff 	movb   $0xff,0x17c(%eax)
    1ada:	e9 8d 02 00 00       	jmp    1d6c <kernel_main+0x307>
    1adf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ae2:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    1ae9:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
    1aed:	7f 3f                	jg     1b2e <kernel_main+0xc9>
    1aef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1af2:	6b c0 1c             	imul   $0x1c,%eax,%eax
    1af5:	05 60 c0 00 00       	add    $0xc060,%eax
    1afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1afd:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
    1b04:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    1b08:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
    1b0c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b0f:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
    1b16:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b19:	8b 50 60             	mov    0x60(%eax),%edx
    1b1c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b1f:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b22:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b25:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
    1b2c:	eb 42                	jmp    1b70 <kernel_main+0x10b>
    1b2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b31:	6b c0 1c             	imul   $0x1c,%eax,%eax
    1b34:	2d 8c 00 00 00       	sub    $0x8c,%eax
    1b39:	05 40 c0 00 00       	add    $0xc040,%eax
    1b3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b41:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
    1b48:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
    1b4c:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
    1b50:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b53:	c7 40 60 05 00 00 00 	movl   $0x5,0x60(%eax)
    1b5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b5d:	8b 50 60             	mov    0x60(%eax),%edx
    1b60:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b63:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b66:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b69:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
    1b70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b73:	8b 55 dc             	mov    -0x24(%ebp),%edx
    1b76:	83 c2 68             	add    $0x68,%edx
    1b79:	83 ec 08             	sub    $0x8,%esp
    1b7c:	50                   	push   %eax
    1b7d:	52                   	push   %edx
    1b7e:	e8 75 76 00 00       	call   91f8 <Strcpy>
    1b83:	83 c4 10             	add    $0x10,%esp
    1b86:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b89:	83 c0 46             	add    $0x46,%eax
    1b8c:	83 ec 04             	sub    $0x4,%esp
    1b8f:	6a 08                	push   $0x8
    1b91:	68 48 d7 00 00       	push   $0xd748
    1b96:	50                   	push   %eax
    1b97:	e8 0f 76 00 00       	call   91ab <Memcpy>
    1b9c:	83 c4 10             	add    $0x10,%esp
    1b9f:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1ba3:	c1 e0 05             	shl    $0x5,%eax
    1ba6:	83 c8 9a             	or     $0xffffff9a,%eax
    1ba9:	89 c2                	mov    %eax,%edx
    1bab:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bae:	88 50 4b             	mov    %dl,0x4b(%eax)
    1bb1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bb4:	83 c0 4e             	add    $0x4e,%eax
    1bb7:	83 ec 04             	sub    $0x4,%esp
    1bba:	6a 08                	push   $0x8
    1bbc:	68 70 d7 00 00       	push   $0xd770
    1bc1:	50                   	push   %eax
    1bc2:	e8 e4 75 00 00       	call   91ab <Memcpy>
    1bc7:	83 c4 10             	add    $0x10,%esp
    1bca:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1bce:	c1 e0 05             	shl    $0x5,%eax
    1bd1:	83 c8 92             	or     $0xffffff92,%eax
    1bd4:	89 c2                	mov    %eax,%edx
    1bd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bd9:	88 50 53             	mov    %dl,0x53(%eax)
    1bdc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bdf:	83 c0 68             	add    $0x68,%eax
    1be2:	83 ec 08             	sub    $0x8,%esp
    1be5:	68 81 8a 00 00       	push   $0x8a81
    1bea:	50                   	push   %eax
    1beb:	e8 1d 1f 00 00       	call   3b0d <strcmp>
    1bf0:	83 c4 10             	add    $0x10,%esp
    1bf3:	85 c0                	test   %eax,%eax
    1bf5:	75 7b                	jne    1c72 <kernel_main+0x20d>
    1bf7:	c7 45 d8 00 10 10 00 	movl   $0x101000,-0x28(%ebp)
    1bfe:	c7 45 d4 fa 0c 00 00 	movl   $0xcfa,-0x2c(%ebp)
    1c05:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1c08:	0f b7 c0             	movzwl %ax,%eax
    1c0b:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1c0e:	83 ea 01             	sub    $0x1,%edx
    1c11:	c1 fa 0c             	sar    $0xc,%edx
    1c14:	89 d1                	mov    %edx,%ecx
    1c16:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1c19:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    1c1f:	83 c2 40             	add    $0x40,%edx
    1c22:	81 c2 60 11 08 00    	add    $0x81160,%edx
    1c28:	83 c2 06             	add    $0x6,%edx
    1c2b:	50                   	push   %eax
    1c2c:	51                   	push   %ecx
    1c2d:	6a 00                	push   $0x0
    1c2f:	52                   	push   %edx
    1c30:	e8 de 4c 00 00       	call   6913 <InitDescriptor>
    1c35:	83 c4 10             	add    $0x10,%esp
    1c38:	c7 45 d0 f2 0c 00 00 	movl   $0xcf2,-0x30(%ebp)
    1c3f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1c42:	0f b7 c0             	movzwl %ax,%eax
    1c45:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1c48:	83 ea 01             	sub    $0x1,%edx
    1c4b:	c1 fa 0c             	sar    $0xc,%edx
    1c4e:	89 d1                	mov    %edx,%ecx
    1c50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1c53:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    1c59:	83 c2 48             	add    $0x48,%edx
    1c5c:	81 c2 60 11 08 00    	add    $0x81160,%edx
    1c62:	83 c2 06             	add    $0x6,%edx
    1c65:	50                   	push   %eax
    1c66:	51                   	push   %ecx
    1c67:	6a 00                	push   $0x0
    1c69:	52                   	push   %edx
    1c6a:	e8 a4 4c 00 00       	call   6913 <InitDescriptor>
    1c6f:	83 c4 10             	add    $0x10,%esp
    1c72:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c76:	83 c8 04             	or     $0x4,%eax
    1c79:	0f b6 c0             	movzbl %al,%eax
    1c7c:	66 89 45 ce          	mov    %ax,-0x32(%ebp)
    1c80:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c84:	83 c8 0c             	or     $0xc,%eax
    1c87:	0f b6 c0             	movzbl %al,%eax
    1c8a:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
    1c8e:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
    1c92:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c95:	89 50 34             	mov    %edx,0x34(%eax)
    1c98:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1c9c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c9f:	89 50 0c             	mov    %edx,0xc(%eax)
    1ca2:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1ca6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ca9:	89 50 04             	mov    %edx,0x4(%eax)
    1cac:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1cb0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cb3:	89 50 08             	mov    %edx,0x8(%eax)
    1cb6:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
    1cba:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cbd:	89 50 40             	mov    %edx,0x40(%eax)
    1cc0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cc3:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
    1cc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ccc:	8b 40 14             	mov    0x14(%eax),%eax
    1ccf:	89 c2                	mov    %eax,%edx
    1cd1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cd4:	89 50 30             	mov    %edx,0x30(%eax)
    1cd7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cda:	83 c0 68             	add    $0x68,%eax
    1cdd:	83 ec 08             	sub    $0x8,%esp
    1ce0:	68 81 8a 00 00       	push   $0x8a81
    1ce5:	50                   	push   %eax
    1ce6:	e8 22 1e 00 00       	call   3b0d <strcmp>
    1ceb:	83 c4 10             	add    $0x10,%esp
    1cee:	85 c0                	test   %eax,%eax
    1cf0:	75 0b                	jne    1cfd <kernel_main+0x298>
    1cf2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1cf5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1cf8:	89 50 3c             	mov    %edx,0x3c(%eax)
    1cfb:	eb 09                	jmp    1d06 <kernel_main+0x2a1>
    1cfd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1d00:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d03:	89 50 3c             	mov    %edx,0x3c(%eax)
    1d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d09:	0f b7 40 18          	movzwl 0x18(%eax),%eax
    1d0d:	0f b7 c0             	movzwl %ax,%eax
    1d10:	f7 d8                	neg    %eax
    1d12:	01 45 e8             	add    %eax,-0x18(%ebp)
    1d15:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d18:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1d1b:	89 50 38             	mov    %edx,0x38(%eax)
    1d1e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d21:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    1d28:	00 00 00 
    1d2b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d2e:	c7 80 8c 01 00 00 00 	movl   $0x0,0x18c(%eax)
    1d35:	00 00 00 
    1d38:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d3b:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    1d42:	00 00 00 
    1d45:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d48:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    1d4f:	00 00 00 
    1d52:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d55:	c7 80 84 01 00 00 1f 	movl   $0x1f,0x184(%eax)
    1d5c:	00 00 00 
    1d5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d62:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    1d69:	00 00 00 
    1d6c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1d70:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
    1d74:	0f 8e 22 fd ff ff    	jle    1a9c <kernel_main+0x37>
    1d7a:	c7 05 40 db 00 00 80 	movl   $0x81980,0xdb40
    1d81:	19 08 00 
    1d84:	83 ec 04             	sub    $0x4,%esp
    1d87:	68 00 02 00 00       	push   $0x200
    1d8c:	6a 00                	push   $0x0
    1d8e:	68 6c db 00 00       	push   $0xdb6c
    1d93:	e8 41 74 00 00       	call   91d9 <Memset>
    1d98:	83 c4 10             	add    $0x10,%esp
    1d9b:	c7 05 60 db 00 00 6c 	movl   $0xdb6c,0xdb60
    1da2:	db 00 00 
    1da5:	a1 60 db 00 00       	mov    0xdb60,%eax
    1daa:	a3 64 db 00 00       	mov    %eax,0xdb64
    1daf:	c7 05 68 db 00 00 00 	movl   $0x0,0xdb68
    1db6:	00 00 00 
    1db9:	c7 05 30 d7 00 00 00 	movl   $0x0,0xd730
    1dc0:	00 00 00 
    1dc3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1dca:	eb 14                	jmp    1de0 <kernel_main+0x37b>
    1dcc:	83 ec 0c             	sub    $0xc,%esp
    1dcf:	68 c0 87 00 00       	push   $0x87c0
    1dd4:	e8 b3 f2 ff ff       	call   108c <disp_str>
    1dd9:	83 c4 10             	add    $0x10,%esp
    1ddc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1de0:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
    1de7:	7e e3                	jle    1dcc <kernel_main+0x367>
    1de9:	c7 05 30 d7 00 00 00 	movl   $0x0,0xd730
    1df0:	00 00 00 
    1df3:	e8 40 5b 00 00       	call   7938 <init_keyboard_handler>
    1df8:	66 87 db             	xchg   %bx,%bx
    1dfb:	e8 8f f4 ff ff       	call   128f <restart>
    1e00:	66 87 db             	xchg   %bx,%bx
    1e03:	eb fe                	jmp    1e03 <kernel_main+0x39e>

00001e05 <TestFS>:
    1e05:	55                   	push   %ebp
    1e06:	89 e5                	mov    %esp,%ebp
    1e08:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
    1e0e:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
    1e15:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
    1e1c:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
    1e22:	83 ec 08             	sub    $0x8,%esp
    1e25:	6a 02                	push   $0x2
    1e27:	8d 45 be             	lea    -0x42(%ebp),%eax
    1e2a:	50                   	push   %eax
    1e2b:	e8 ae 5c 00 00       	call   7ade <open>
    1e30:	83 c4 10             	add    $0x10,%esp
    1e33:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1e36:	83 ec 08             	sub    $0x8,%esp
    1e39:	6a 02                	push   $0x2
    1e3b:	8d 45 be             	lea    -0x42(%ebp),%eax
    1e3e:	50                   	push   %eax
    1e3f:	e8 9a 5c 00 00       	call   7ade <open>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e4a:	83 ec 0c             	sub    $0xc,%esp
    1e4d:	68 86 8a 00 00       	push   $0x8a86
    1e52:	e8 0c 0e 00 00       	call   2c63 <Printf>
    1e57:	83 c4 10             	add    $0x10,%esp
    1e5a:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
    1e61:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    1e65:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
    1e6c:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    1e70:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
    1e77:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
    1e7e:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
    1e84:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1e8b:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    1e8f:	75 fa                	jne    1e8b <TestFS+0x86>
    1e91:	83 ec 08             	sub    $0x8,%esp
    1e94:	6a 07                	push   $0x7
    1e96:	8d 45 b9             	lea    -0x47(%ebp),%eax
    1e99:	50                   	push   %eax
    1e9a:	e8 3f 5c 00 00       	call   7ade <open>
    1e9f:	83 c4 10             	add    $0x10,%esp
    1ea2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1ea5:	83 ec 08             	sub    $0x8,%esp
    1ea8:	ff 75 e4             	pushl  -0x1c(%ebp)
    1eab:	68 98 8a 00 00       	push   $0x8a98
    1eb0:	e8 ae 0d 00 00       	call   2c63 <Printf>
    1eb5:	83 c4 10             	add    $0x10,%esp
    1eb8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1ebf:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
    1ec6:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
    1ecd:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
    1ed4:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
    1edb:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
    1ee2:	83 ec 0c             	sub    $0xc,%esp
    1ee5:	8d 45 96             	lea    -0x6a(%ebp),%eax
    1ee8:	50                   	push   %eax
    1ee9:	e8 24 73 00 00       	call   9212 <Strlen>
    1eee:	83 c4 10             	add    $0x10,%esp
    1ef1:	83 ec 04             	sub    $0x4,%esp
    1ef4:	50                   	push   %eax
    1ef5:	8d 45 96             	lea    -0x6a(%ebp),%eax
    1ef8:	50                   	push   %eax
    1ef9:	ff 75 e4             	pushl  -0x1c(%ebp)
    1efc:	e8 69 5c 00 00       	call   7b6a <write>
    1f01:	83 c4 10             	add    $0x10,%esp
    1f04:	83 ec 04             	sub    $0x4,%esp
    1f07:	6a 14                	push   $0x14
    1f09:	6a 00                	push   $0x0
    1f0b:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1f0e:	50                   	push   %eax
    1f0f:	e8 c5 72 00 00       	call   91d9 <Memset>
    1f14:	83 c4 10             	add    $0x10,%esp
    1f17:	83 ec 04             	sub    $0x4,%esp
    1f1a:	6a 12                	push   $0x12
    1f1c:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1f1f:	50                   	push   %eax
    1f20:	ff 75 e4             	pushl  -0x1c(%ebp)
    1f23:	e8 0b 5c 00 00       	call   7b33 <read>
    1f28:	83 c4 10             	add    $0x10,%esp
    1f2b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    1f2e:	83 ec 08             	sub    $0x8,%esp
    1f31:	8d 45 82             	lea    -0x7e(%ebp),%eax
    1f34:	50                   	push   %eax
    1f35:	68 a1 8a 00 00       	push   $0x8aa1
    1f3a:	e8 24 0d 00 00       	call   2c63 <Printf>
    1f3f:	83 c4 10             	add    $0x10,%esp
    1f42:	83 ec 0c             	sub    $0xc,%esp
    1f45:	6a 0a                	push   $0xa
    1f47:	e8 6a 0b 00 00       	call   2ab6 <delay>
    1f4c:	83 c4 10             	add    $0x10,%esp
    1f4f:	83 ec 08             	sub    $0x8,%esp
    1f52:	6a 07                	push   $0x7
    1f54:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    1f57:	50                   	push   %eax
    1f58:	e8 81 5b 00 00       	call   7ade <open>
    1f5d:	83 c4 10             	add    $0x10,%esp
    1f60:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1f63:	83 ec 08             	sub    $0x8,%esp
    1f66:	ff 75 dc             	pushl  -0x24(%ebp)
    1f69:	68 ac 8a 00 00       	push   $0x8aac
    1f6e:	e8 f0 0c 00 00       	call   2c63 <Printf>
    1f73:	83 c4 10             	add    $0x10,%esp
    1f76:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f7d:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
    1f84:	67 3a 68 
    1f87:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
    1f8e:	77 20 61 
    1f91:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
    1f98:	65 20 79 
    1f9b:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
    1fa2:	75 3f 00 
    1fa5:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
    1fac:	00 00 00 
    1faf:	83 ec 0c             	sub    $0xc,%esp
    1fb2:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
    1fb8:	50                   	push   %eax
    1fb9:	e8 54 72 00 00       	call   9212 <Strlen>
    1fbe:	83 c4 10             	add    $0x10,%esp
    1fc1:	83 ec 04             	sub    $0x4,%esp
    1fc4:	50                   	push   %eax
    1fc5:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
    1fcb:	50                   	push   %eax
    1fcc:	ff 75 dc             	pushl  -0x24(%ebp)
    1fcf:	e8 96 5b 00 00       	call   7b6a <write>
    1fd4:	83 c4 10             	add    $0x10,%esp
    1fd7:	83 ec 04             	sub    $0x4,%esp
    1fda:	6a 14                	push   $0x14
    1fdc:	6a 00                	push   $0x0
    1fde:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    1fe4:	50                   	push   %eax
    1fe5:	e8 ef 71 00 00       	call   91d9 <Memset>
    1fea:	83 c4 10             	add    $0x10,%esp
    1fed:	83 ec 04             	sub    $0x4,%esp
    1ff0:	6a 12                	push   $0x12
    1ff2:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    1ff8:	50                   	push   %eax
    1ff9:	ff 75 dc             	pushl  -0x24(%ebp)
    1ffc:	e8 32 5b 00 00       	call   7b33 <read>
    2001:	83 c4 10             	add    $0x10,%esp
    2004:	89 45 d8             	mov    %eax,-0x28(%ebp)
    2007:	83 ec 08             	sub    $0x8,%esp
    200a:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
    2010:	50                   	push   %eax
    2011:	68 b6 8a 00 00       	push   $0x8ab6
    2016:	e8 48 0c 00 00       	call   2c63 <Printf>
    201b:	83 c4 10             	add    $0x10,%esp
    201e:	83 ec 08             	sub    $0x8,%esp
    2021:	6a 07                	push   $0x7
    2023:	8d 45 aa             	lea    -0x56(%ebp),%eax
    2026:	50                   	push   %eax
    2027:	e8 b2 5a 00 00       	call   7ade <open>
    202c:	83 c4 10             	add    $0x10,%esp
    202f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2032:	83 ec 08             	sub    $0x8,%esp
    2035:	ff 75 dc             	pushl  -0x24(%ebp)
    2038:	68 ac 8a 00 00       	push   $0x8aac
    203d:	e8 21 0c 00 00       	call   2c63 <Printf>
    2042:	83 c4 10             	add    $0x10,%esp
    2045:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    204c:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
    2053:	20 77 69 
    2056:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
    205d:	6c 20 73 
    2060:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
    2067:	63 63 65 
    206a:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
    2071:	73 20 61 
    2074:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
    207b:	20 6c 61 
    207e:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
    2085:	74 2e 00 
    2088:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
    208f:	00 00 00 
    2092:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
    2099:	00 00 
    209b:	83 ec 0c             	sub    $0xc,%esp
    209e:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    20a4:	50                   	push   %eax
    20a5:	e8 68 71 00 00       	call   9212 <Strlen>
    20aa:	83 c4 10             	add    $0x10,%esp
    20ad:	83 ec 04             	sub    $0x4,%esp
    20b0:	50                   	push   %eax
    20b1:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    20b7:	50                   	push   %eax
    20b8:	ff 75 d4             	pushl  -0x2c(%ebp)
    20bb:	e8 aa 5a 00 00       	call   7b6a <write>
    20c0:	83 c4 10             	add    $0x10,%esp
    20c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    20ca:	eb 5c                	jmp    2128 <TestFS+0x323>
    20cc:	83 ec 04             	sub    $0x4,%esp
    20cf:	6a 1e                	push   $0x1e
    20d1:	6a 00                	push   $0x0
    20d3:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    20d9:	50                   	push   %eax
    20da:	e8 fa 70 00 00       	call   91d9 <Memset>
    20df:	83 c4 10             	add    $0x10,%esp
    20e2:	83 ec 0c             	sub    $0xc,%esp
    20e5:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    20eb:	50                   	push   %eax
    20ec:	e8 21 71 00 00       	call   9212 <Strlen>
    20f1:	83 c4 10             	add    $0x10,%esp
    20f4:	83 ec 04             	sub    $0x4,%esp
    20f7:	50                   	push   %eax
    20f8:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    20fe:	50                   	push   %eax
    20ff:	ff 75 d4             	pushl  -0x2c(%ebp)
    2102:	e8 2c 5a 00 00       	call   7b33 <read>
    2107:	83 c4 10             	add    $0x10,%esp
    210a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    210d:	83 ec 08             	sub    $0x8,%esp
    2110:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
    2116:	50                   	push   %eax
    2117:	68 c1 8a 00 00       	push   $0x8ac1
    211c:	e8 42 0b 00 00       	call   2c63 <Printf>
    2121:	83 c4 10             	add    $0x10,%esp
    2124:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2128:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
    212c:	7e 9e                	jle    20cc <TestFS+0x2c7>
    212e:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
    2135:	6e 73 74 
    2138:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
    213f:	6c 6c 2e 
    2142:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
    2149:	61 72 00 
    214c:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
    2153:	00 00 00 
    2156:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
    215d:	00 00 00 
    2160:	83 ec 08             	sub    $0x8,%esp
    2163:	6a 00                	push   $0x0
    2165:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
    216b:	50                   	push   %eax
    216c:	e8 6d 59 00 00       	call   7ade <open>
    2171:	83 c4 10             	add    $0x10,%esp
    2174:	89 45 cc             	mov    %eax,-0x34(%ebp)
    2177:	83 ec 08             	sub    $0x8,%esp
    217a:	ff 75 cc             	pushl  -0x34(%ebp)
    217d:	68 cc 8a 00 00       	push   $0x8acc
    2182:	e8 dc 0a 00 00       	call   2c63 <Printf>
    2187:	83 c4 10             	add    $0x10,%esp
    218a:	83 ec 04             	sub    $0x4,%esp
    218d:	6a 14                	push   $0x14
    218f:	6a 00                	push   $0x0
    2191:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    2197:	50                   	push   %eax
    2198:	e8 3c 70 00 00       	call   91d9 <Memset>
    219d:	83 c4 10             	add    $0x10,%esp
    21a0:	83 ec 04             	sub    $0x4,%esp
    21a3:	68 00 02 00 00       	push   $0x200
    21a8:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    21ae:	50                   	push   %eax
    21af:	ff 75 cc             	pushl  -0x34(%ebp)
    21b2:	e8 7c 59 00 00       	call   7b33 <read>
    21b7:	83 c4 10             	add    $0x10,%esp
    21ba:	89 45 c8             	mov    %eax,-0x38(%ebp)
    21bd:	83 ec 08             	sub    $0x8,%esp
    21c0:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
    21c6:	50                   	push   %eax
    21c7:	68 d6 8a 00 00       	push   $0x8ad6
    21cc:	e8 92 0a 00 00       	call   2c63 <Printf>
    21d1:	83 c4 10             	add    $0x10,%esp
    21d4:	e9 b2 fc ff ff       	jmp    1e8b <TestFS+0x86>

000021d9 <wait_exit>:
    21d9:	55                   	push   %ebp
    21da:	89 e5                	mov    %esp,%ebp
    21dc:	83 ec 28             	sub    $0x28,%esp
    21df:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
    21e6:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
    21ed:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
    21f3:	83 ec 08             	sub    $0x8,%esp
    21f6:	6a 02                	push   $0x2
    21f8:	8d 45 de             	lea    -0x22(%ebp),%eax
    21fb:	50                   	push   %eax
    21fc:	e8 dd 58 00 00       	call   7ade <open>
    2201:	83 c4 10             	add    $0x10,%esp
    2204:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2207:	83 ec 08             	sub    $0x8,%esp
    220a:	6a 02                	push   $0x2
    220c:	8d 45 de             	lea    -0x22(%ebp),%eax
    220f:	50                   	push   %eax
    2210:	e8 c9 58 00 00       	call   7ade <open>
    2215:	83 c4 10             	add    $0x10,%esp
    2218:	89 45 ec             	mov    %eax,-0x14(%ebp)
    221b:	e8 34 5a 00 00       	call   7c54 <fork>
    2220:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2223:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2227:	7e 25                	jle    224e <wait_exit+0x75>
    2229:	83 ec 0c             	sub    $0xc,%esp
    222c:	8d 45 d8             	lea    -0x28(%ebp),%eax
    222f:	50                   	push   %eax
    2230:	e8 b8 59 00 00       	call   7bed <wait>
    2235:	83 c4 10             	add    $0x10,%esp
    2238:	8b 45 d8             	mov    -0x28(%ebp),%eax
    223b:	83 ec 08             	sub    $0x8,%esp
    223e:	50                   	push   %eax
    223f:	68 e1 8a 00 00       	push   $0x8ae1
    2244:	e8 1a 0a 00 00       	call   2c63 <Printf>
    2249:	83 c4 10             	add    $0x10,%esp
    224c:	eb fe                	jmp    224c <wait_exit+0x73>
    224e:	83 ec 0c             	sub    $0xc,%esp
    2251:	68 fc 8a 00 00       	push   $0x8afc
    2256:	e8 08 0a 00 00       	call   2c63 <Printf>
    225b:	83 c4 10             	add    $0x10,%esp
    225e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2265:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2268:	8d 50 01             	lea    0x1(%eax),%edx
    226b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    226e:	3d 50 c3 00 00       	cmp    $0xc350,%eax
    2273:	7f 02                	jg     2277 <wait_exit+0x9e>
    2275:	eb ee                	jmp    2265 <wait_exit+0x8c>
    2277:	90                   	nop
    2278:	83 ec 0c             	sub    $0xc,%esp
    227b:	68 08 8b 00 00       	push   $0x8b08
    2280:	e8 de 09 00 00       	call   2c63 <Printf>
    2285:	83 c4 10             	add    $0x10,%esp
    2288:	83 ec 0c             	sub    $0xc,%esp
    228b:	6a 09                	push   $0x9
    228d:	e8 99 59 00 00       	call   7c2b <exit>
    2292:	83 c4 10             	add    $0x10,%esp
    2295:	83 ec 0c             	sub    $0xc,%esp
    2298:	68 16 8b 00 00       	push   $0x8b16
    229d:	e8 c1 09 00 00       	call   2c63 <Printf>
    22a2:	83 c4 10             	add    $0x10,%esp
    22a5:	eb fe                	jmp    22a5 <wait_exit+0xcc>

000022a7 <INIT_fork>:
    22a7:	55                   	push   %ebp
    22a8:	89 e5                	mov    %esp,%ebp
    22aa:	53                   	push   %ebx
    22ab:	81 ec 84 00 00 00    	sub    $0x84,%esp
    22b1:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
    22b8:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
    22bf:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
    22c5:	83 ec 08             	sub    $0x8,%esp
    22c8:	6a 02                	push   $0x2
    22ca:	8d 45 da             	lea    -0x26(%ebp),%eax
    22cd:	50                   	push   %eax
    22ce:	e8 0b 58 00 00       	call   7ade <open>
    22d3:	83 c4 10             	add    $0x10,%esp
    22d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    22d9:	83 ec 08             	sub    $0x8,%esp
    22dc:	6a 02                	push   $0x2
    22de:	8d 45 da             	lea    -0x26(%ebp),%eax
    22e1:	50                   	push   %eax
    22e2:	e8 f7 57 00 00       	call   7ade <open>
    22e7:	83 c4 10             	add    $0x10,%esp
    22ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
    22ed:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
    22f4:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
    22fb:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
    2302:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
    2309:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
    2310:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
    2317:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
    231e:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
    2325:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
    232c:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
    2333:	83 ec 0c             	sub    $0xc,%esp
    2336:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2339:	50                   	push   %eax
    233a:	e8 d3 6e 00 00       	call   9212 <Strlen>
    233f:	83 c4 10             	add    $0x10,%esp
    2342:	83 ec 04             	sub    $0x4,%esp
    2345:	50                   	push   %eax
    2346:	6a 00                	push   $0x0
    2348:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    234b:	50                   	push   %eax
    234c:	e8 88 6e 00 00       	call   91d9 <Memset>
    2351:	83 c4 10             	add    $0x10,%esp
    2354:	83 ec 04             	sub    $0x4,%esp
    2357:	6a 28                	push   $0x28
    2359:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    235c:	50                   	push   %eax
    235d:	ff 75 e8             	pushl  -0x18(%ebp)
    2360:	e8 ce 57 00 00       	call   7b33 <read>
    2365:	83 c4 10             	add    $0x10,%esp
    2368:	83 ec 04             	sub    $0x4,%esp
    236b:	6a 28                	push   $0x28
    236d:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2370:	50                   	push   %eax
    2371:	ff 75 ec             	pushl  -0x14(%ebp)
    2374:	e8 f1 57 00 00       	call   7b6a <write>
    2379:	83 c4 10             	add    $0x10,%esp
    237c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2383:	e8 cc 58 00 00       	call   7c54 <fork>
    2388:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    238b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    238f:	0f 8e dd 00 00 00    	jle    2472 <INIT_fork+0x1cb>
    2395:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2399:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
    23a0:	61 72 65 
    23a3:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
    23aa:	8d 45 87             	lea    -0x79(%ebp),%eax
    23ad:	b9 20 00 00 00       	mov    $0x20,%ecx
    23b2:	bb 00 00 00 00       	mov    $0x0,%ebx
    23b7:	89 18                	mov    %ebx,(%eax)
    23b9:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
    23bd:	8d 50 04             	lea    0x4(%eax),%edx
    23c0:	83 e2 fc             	and    $0xfffffffc,%edx
    23c3:	29 d0                	sub    %edx,%eax
    23c5:	01 c1                	add    %eax,%ecx
    23c7:	83 e1 fc             	and    $0xfffffffc,%ecx
    23ca:	83 e1 fc             	and    $0xfffffffc,%ecx
    23cd:	b8 00 00 00 00       	mov    $0x0,%eax
    23d2:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
    23d5:	83 c0 04             	add    $0x4,%eax
    23d8:	39 c8                	cmp    %ecx,%eax
    23da:	72 f6                	jb     23d2 <INIT_fork+0x12b>
    23dc:	01 c2                	add    %eax,%edx
    23de:	83 ec 0c             	sub    $0xc,%esp
    23e1:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    23e7:	50                   	push   %eax
    23e8:	e8 25 6e 00 00       	call   9212 <Strlen>
    23ed:	83 c4 10             	add    $0x10,%esp
    23f0:	83 ec 04             	sub    $0x4,%esp
    23f3:	50                   	push   %eax
    23f4:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    23fa:	50                   	push   %eax
    23fb:	ff 75 ec             	pushl  -0x14(%ebp)
    23fe:	e8 67 57 00 00       	call   7b6a <write>
    2403:	83 c4 10             	add    $0x10,%esp
    2406:	83 ec 0c             	sub    $0xc,%esp
    2409:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    240f:	50                   	push   %eax
    2410:	e8 fd 6d 00 00       	call   9212 <Strlen>
    2415:	83 c4 10             	add    $0x10,%esp
    2418:	83 ec 04             	sub    $0x4,%esp
    241b:	50                   	push   %eax
    241c:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2422:	50                   	push   %eax
    2423:	ff 75 ec             	pushl  -0x14(%ebp)
    2426:	e8 3f 57 00 00       	call   7b6a <write>
    242b:	83 c4 10             	add    $0x10,%esp
    242e:	83 ec 0c             	sub    $0xc,%esp
    2431:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2437:	50                   	push   %eax
    2438:	e8 d5 6d 00 00       	call   9212 <Strlen>
    243d:	83 c4 10             	add    $0x10,%esp
    2440:	83 ec 04             	sub    $0x4,%esp
    2443:	50                   	push   %eax
    2444:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    244a:	50                   	push   %eax
    244b:	ff 75 ec             	pushl  -0x14(%ebp)
    244e:	e8 17 57 00 00       	call   7b6a <write>
    2453:	83 c4 10             	add    $0x10,%esp
    2456:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    245d:	eb 08                	jmp    2467 <INIT_fork+0x1c0>
    245f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2463:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2467:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    246b:	7e f2                	jle    245f <INIT_fork+0x1b8>
    246d:	e9 0f 01 00 00       	jmp    2581 <INIT_fork+0x2da>
    2472:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2476:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
    247a:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
    2481:	68 69 6c 
    2484:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
    248b:	8d 45 87             	lea    -0x79(%ebp),%eax
    248e:	b9 20 00 00 00       	mov    $0x20,%ecx
    2493:	bb 00 00 00 00       	mov    $0x0,%ebx
    2498:	89 18                	mov    %ebx,(%eax)
    249a:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
    249e:	8d 50 04             	lea    0x4(%eax),%edx
    24a1:	83 e2 fc             	and    $0xfffffffc,%edx
    24a4:	29 d0                	sub    %edx,%eax
    24a6:	01 c1                	add    %eax,%ecx
    24a8:	83 e1 fc             	and    $0xfffffffc,%ecx
    24ab:	83 e1 fc             	and    $0xfffffffc,%ecx
    24ae:	b8 00 00 00 00       	mov    $0x0,%eax
    24b3:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
    24b6:	83 c0 04             	add    $0x4,%eax
    24b9:	39 c8                	cmp    %ecx,%eax
    24bb:	72 f6                	jb     24b3 <INIT_fork+0x20c>
    24bd:	01 c2                	add    %eax,%edx
    24bf:	83 ec 0c             	sub    $0xc,%esp
    24c2:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    24c8:	50                   	push   %eax
    24c9:	e8 44 6d 00 00       	call   9212 <Strlen>
    24ce:	83 c4 10             	add    $0x10,%esp
    24d1:	83 ec 04             	sub    $0x4,%esp
    24d4:	50                   	push   %eax
    24d5:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    24db:	50                   	push   %eax
    24dc:	ff 75 ec             	pushl  -0x14(%ebp)
    24df:	e8 86 56 00 00       	call   7b6a <write>
    24e4:	83 c4 10             	add    $0x10,%esp
    24e7:	83 ec 0c             	sub    $0xc,%esp
    24ea:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    24f0:	50                   	push   %eax
    24f1:	e8 1c 6d 00 00       	call   9212 <Strlen>
    24f6:	83 c4 10             	add    $0x10,%esp
    24f9:	83 ec 04             	sub    $0x4,%esp
    24fc:	50                   	push   %eax
    24fd:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2503:	50                   	push   %eax
    2504:	ff 75 ec             	pushl  -0x14(%ebp)
    2507:	e8 5e 56 00 00       	call   7b6a <write>
    250c:	83 c4 10             	add    $0x10,%esp
    250f:	83 ec 0c             	sub    $0xc,%esp
    2512:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    2518:	50                   	push   %eax
    2519:	e8 f4 6c 00 00       	call   9212 <Strlen>
    251e:	83 c4 10             	add    $0x10,%esp
    2521:	83 ec 04             	sub    $0x4,%esp
    2524:	50                   	push   %eax
    2525:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
    252b:	50                   	push   %eax
    252c:	ff 75 ec             	pushl  -0x14(%ebp)
    252f:	e8 36 56 00 00       	call   7b6a <write>
    2534:	83 c4 10             	add    $0x10,%esp
    2537:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
    253e:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
    2545:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
    254b:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
    254f:	83 ec 0c             	sub    $0xc,%esp
    2552:	8d 45 a7             	lea    -0x59(%ebp),%eax
    2555:	50                   	push   %eax
    2556:	e8 b7 6c 00 00       	call   9212 <Strlen>
    255b:	83 c4 10             	add    $0x10,%esp
    255e:	83 ec 04             	sub    $0x4,%esp
    2561:	50                   	push   %eax
    2562:	8d 45 a7             	lea    -0x59(%ebp),%eax
    2565:	50                   	push   %eax
    2566:	ff 75 ec             	pushl  -0x14(%ebp)
    2569:	e8 fc 55 00 00       	call   7b6a <write>
    256e:	83 c4 10             	add    $0x10,%esp
    2571:	83 ec 0c             	sub    $0xc,%esp
    2574:	68 24 8b 00 00       	push   $0x8b24
    2579:	e8 11 0a 00 00       	call   2f8f <spin>
    257e:	83 c4 10             	add    $0x10,%esp
    2581:	83 ec 0c             	sub    $0xc,%esp
    2584:	68 2b 8b 00 00       	push   $0x8b2b
    2589:	e8 01 0a 00 00       	call   2f8f <spin>
    258e:	83 c4 10             	add    $0x10,%esp
    2591:	90                   	nop
    2592:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2595:	c9                   	leave  
    2596:	c3                   	ret    

00002597 <simple_shell>:
    2597:	55                   	push   %ebp
    2598:	89 e5                	mov    %esp,%ebp
    259a:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    25a0:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
    25a7:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
    25ae:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
    25b4:	83 ec 08             	sub    $0x8,%esp
    25b7:	6a 02                	push   $0x2
    25b9:	8d 45 c2             	lea    -0x3e(%ebp),%eax
    25bc:	50                   	push   %eax
    25bd:	e8 1c 55 00 00       	call   7ade <open>
    25c2:	83 c4 10             	add    $0x10,%esp
    25c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    25c8:	83 ec 08             	sub    $0x8,%esp
    25cb:	6a 02                	push   $0x2
    25cd:	8d 45 c2             	lea    -0x3e(%ebp),%eax
    25d0:	50                   	push   %eax
    25d1:	e8 08 55 00 00       	call   7ade <open>
    25d6:	83 c4 10             	add    $0x10,%esp
    25d9:	89 45 dc             	mov    %eax,-0x24(%ebp)
    25dc:	83 ec 04             	sub    $0x4,%esp
    25df:	68 80 00 00 00       	push   $0x80
    25e4:	6a 00                	push   $0x0
    25e6:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    25ec:	50                   	push   %eax
    25ed:	e8 e7 6b 00 00       	call   91d9 <Memset>
    25f2:	83 c4 10             	add    $0x10,%esp
    25f5:	83 ec 04             	sub    $0x4,%esp
    25f8:	68 80 00 00 00       	push   $0x80
    25fd:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    2603:	50                   	push   %eax
    2604:	ff 75 e0             	pushl  -0x20(%ebp)
    2607:	e8 27 55 00 00       	call   7b33 <read>
    260c:	83 c4 10             	add    $0x10,%esp
    260f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2616:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    261d:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
    2623:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2626:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2629:	0f b6 00             	movzbl (%eax),%eax
    262c:	88 45 db             	mov    %al,-0x25(%ebp)
    262f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2632:	0f b6 00             	movzbl (%eax),%eax
    2635:	3c 20                	cmp    $0x20,%al
    2637:	74 1d                	je     2656 <simple_shell+0xbf>
    2639:	8b 45 ec             	mov    -0x14(%ebp),%eax
    263c:	0f b6 00             	movzbl (%eax),%eax
    263f:	84 c0                	test   %al,%al
    2641:	74 13                	je     2656 <simple_shell+0xbf>
    2643:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2647:	75 0d                	jne    2656 <simple_shell+0xbf>
    2649:	8b 45 ec             	mov    -0x14(%ebp),%eax
    264c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    264f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    2656:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2659:	0f b6 00             	movzbl (%eax),%eax
    265c:	3c 20                	cmp    $0x20,%al
    265e:	74 0a                	je     266a <simple_shell+0xd3>
    2660:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2663:	0f b6 00             	movzbl (%eax),%eax
    2666:	84 c0                	test   %al,%al
    2668:	75 26                	jne    2690 <simple_shell+0xf9>
    266a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    266e:	75 20                	jne    2690 <simple_shell+0xf9>
    2670:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2673:	8d 50 01             	lea    0x1(%eax),%edx
    2676:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2679:	8b 55 e8             	mov    -0x18(%ebp),%edx
    267c:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
    2683:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2686:	c6 00 00             	movb   $0x0,(%eax)
    2689:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2690:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2694:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
    2698:	75 8c                	jne    2626 <simple_shell+0x8f>
    269a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    269d:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
    26a4:	00 00 00 00 
    26a8:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
    26af:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    26b5:	83 ec 08             	sub    $0x8,%esp
    26b8:	6a 02                	push   $0x2
    26ba:	50                   	push   %eax
    26bb:	e8 1e 54 00 00       	call   7ade <open>
    26c0:	83 c4 10             	add    $0x10,%esp
    26c3:	89 45 d0             	mov    %eax,-0x30(%ebp)
    26c6:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    26ca:	75 54                	jne    2720 <simple_shell+0x189>
    26cc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    26d3:	eb 29                	jmp    26fe <simple_shell+0x167>
    26d5:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
    26db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    26de:	01 d0                	add    %edx,%eax
    26e0:	0f b6 00             	movzbl (%eax),%eax
    26e3:	0f be c0             	movsbl %al,%eax
    26e6:	83 ec 04             	sub    $0x4,%esp
    26e9:	50                   	push   %eax
    26ea:	ff 75 e4             	pushl  -0x1c(%ebp)
    26ed:	68 33 8b 00 00       	push   $0x8b33
    26f2:	e8 6c 05 00 00       	call   2c63 <Printf>
    26f7:	83 c4 10             	add    $0x10,%esp
    26fa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    26fe:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
    2702:	7e d1                	jle    26d5 <simple_shell+0x13e>
    2704:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    270a:	83 ec 08             	sub    $0x8,%esp
    270d:	50                   	push   %eax
    270e:	68 3a 8b 00 00       	push   $0x8b3a
    2713:	e8 4b 05 00 00       	call   2c63 <Printf>
    2718:	83 c4 10             	add    $0x10,%esp
    271b:	e9 bc fe ff ff       	jmp    25dc <simple_shell+0x45>
    2720:	e8 2f 55 00 00       	call   7c54 <fork>
    2725:	89 45 cc             	mov    %eax,-0x34(%ebp)
    2728:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    272c:	7e 17                	jle    2745 <simple_shell+0x1ae>
    272e:	83 ec 0c             	sub    $0xc,%esp
    2731:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
    2737:	50                   	push   %eax
    2738:	e8 b0 54 00 00       	call   7bed <wait>
    273d:	83 c4 10             	add    $0x10,%esp
    2740:	e9 97 fe ff ff       	jmp    25dc <simple_shell+0x45>
    2745:	83 ec 0c             	sub    $0xc,%esp
    2748:	ff 75 d0             	pushl  -0x30(%ebp)
    274b:	e8 51 54 00 00       	call   7ba1 <close>
    2750:	83 c4 10             	add    $0x10,%esp
    2753:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    2759:	83 ec 08             	sub    $0x8,%esp
    275c:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
    2762:	52                   	push   %edx
    2763:	50                   	push   %eax
    2764:	e8 da 55 00 00       	call   7d43 <execv>
    2769:	83 c4 10             	add    $0x10,%esp
    276c:	eb fe                	jmp    276c <simple_shell+0x1d5>

0000276e <test_split_str>:
    276e:	55                   	push   %ebp
    276f:	89 e5                	mov    %esp,%ebp
    2771:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
    2777:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    277e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2785:	c7 45 ec 40 8b 00 00 	movl   $0x8b40,-0x14(%ebp)
    278c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2790:	75 1a                	jne    27ac <test_split_str+0x3e>
    2792:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2795:	0f b6 00             	movzbl (%eax),%eax
    2798:	0f be c0             	movsbl %al,%eax
    279b:	83 ec 08             	sub    $0x8,%esp
    279e:	50                   	push   %eax
    279f:	68 51 8b 00 00       	push   $0x8b51
    27a4:	e8 ba 04 00 00       	call   2c63 <Printf>
    27a9:	83 c4 10             	add    $0x10,%esp
    27ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27af:	0f b6 00             	movzbl (%eax),%eax
    27b2:	3c 20                	cmp    $0x20,%al
    27b4:	75 0a                	jne    27c0 <test_split_str+0x52>
    27b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27b9:	0f b6 00             	movzbl (%eax),%eax
    27bc:	84 c0                	test   %al,%al
    27be:	74 13                	je     27d3 <test_split_str+0x65>
    27c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    27c4:	75 0d                	jne    27d3 <test_split_str+0x65>
    27c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    27cc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    27d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27d6:	0f b6 00             	movzbl (%eax),%eax
    27d9:	3c 20                	cmp    $0x20,%al
    27db:	74 0a                	je     27e7 <test_split_str+0x79>
    27dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27e0:	0f b6 00             	movzbl (%eax),%eax
    27e3:	84 c0                	test   %al,%al
    27e5:	75 26                	jne    280d <test_split_str+0x9f>
    27e7:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    27eb:	75 20                	jne    280d <test_split_str+0x9f>
    27ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27f0:	8d 50 01             	lea    0x1(%eax),%edx
    27f3:	89 55 f4             	mov    %edx,-0xc(%ebp)
    27f6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    27f9:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
    2800:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2803:	c6 00 00             	movb   $0x0,(%eax)
    2806:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    280d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2811:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2814:	0f b6 00             	movzbl (%eax),%eax
    2817:	84 c0                	test   %al,%al
    2819:	0f 85 6d ff ff ff    	jne    278c <test_split_str+0x1e>
    281f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2822:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2825:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
    282c:	83 ec 08             	sub    $0x8,%esp
    282f:	ff 75 f4             	pushl  -0xc(%ebp)
    2832:	68 5a 8b 00 00       	push   $0x8b5a
    2837:	e8 27 04 00 00       	call   2c63 <Printf>
    283c:	83 c4 10             	add    $0x10,%esp
    283f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    2846:	eb 22                	jmp    286a <test_split_str+0xfc>
    2848:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    284b:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
    2852:	83 ec 04             	sub    $0x4,%esp
    2855:	50                   	push   %eax
    2856:	ff 75 e4             	pushl  -0x1c(%ebp)
    2859:	68 71 8b 00 00       	push   $0x8b71
    285e:	e8 00 04 00 00       	call   2c63 <Printf>
    2863:	83 c4 10             	add    $0x10,%esp
    2866:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    286a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    286d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2870:	7e d6                	jle    2848 <test_split_str+0xda>
    2872:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
    2878:	83 ec 08             	sub    $0x8,%esp
    287b:	68 80 8b 00 00       	push   $0x8b80
    2880:	50                   	push   %eax
    2881:	e8 87 12 00 00       	call   3b0d <strcmp>
    2886:	83 c4 10             	add    $0x10,%esp
    2889:	85 c0                	test   %eax,%eax
    288b:	75 10                	jne    289d <test_split_str+0x12f>
    288d:	83 ec 0c             	sub    $0xc,%esp
    2890:	68 85 8b 00 00       	push   $0x8b85
    2895:	e8 c9 03 00 00       	call   2c63 <Printf>
    289a:	83 c4 10             	add    $0x10,%esp
    289d:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
    28a3:	83 ec 08             	sub    $0x8,%esp
    28a6:	50                   	push   %eax
    28a7:	68 91 8b 00 00       	push   $0x8b91
    28ac:	e8 b2 03 00 00       	call   2c63 <Printf>
    28b1:	83 c4 10             	add    $0x10,%esp
    28b4:	83 ec 0c             	sub    $0xc,%esp
    28b7:	68 9f 8b 00 00       	push   $0x8b9f
    28bc:	e8 a2 03 00 00       	call   2c63 <Printf>
    28c1:	83 c4 10             	add    $0x10,%esp
    28c4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    28cb:	eb 26                	jmp    28f3 <test_split_str+0x185>
    28cd:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
    28d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    28d6:	01 d0                	add    %edx,%eax
    28d8:	0f b6 00             	movzbl (%eax),%eax
    28db:	0f be c0             	movsbl %al,%eax
    28de:	83 ec 08             	sub    $0x8,%esp
    28e1:	50                   	push   %eax
    28e2:	68 ae 8b 00 00       	push   $0x8bae
    28e7:	e8 77 03 00 00       	call   2c63 <Printf>
    28ec:	83 c4 10             	add    $0x10,%esp
    28ef:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    28f3:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
    28f7:	7e d4                	jle    28cd <test_split_str+0x15f>
    28f9:	c9                   	leave  
    28fa:	c3                   	ret    

000028fb <test_shell>:
    28fb:	55                   	push   %ebp
    28fc:	89 e5                	mov    %esp,%ebp
    28fe:	83 ec 48             	sub    $0x48,%esp
    2901:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
    2908:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
    290f:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
    2915:	83 ec 08             	sub    $0x8,%esp
    2918:	6a 02                	push   $0x2
    291a:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    291d:	50                   	push   %eax
    291e:	e8 bb 51 00 00       	call   7ade <open>
    2923:	83 c4 10             	add    $0x10,%esp
    2926:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2929:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
    2930:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
    2937:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
    293e:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
    2945:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
    294c:	83 ec 0c             	sub    $0xc,%esp
    294f:	8d 45 ce             	lea    -0x32(%ebp),%eax
    2952:	50                   	push   %eax
    2953:	e8 69 ea ff ff       	call   13c1 <untar>
    2958:	83 c4 10             	add    $0x10,%esp
    295b:	e8 f4 52 00 00       	call   7c54 <fork>
    2960:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2963:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2967:	7e 25                	jle    298e <test_shell+0x93>
    2969:	83 ec 0c             	sub    $0xc,%esp
    296c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    296f:	50                   	push   %eax
    2970:	e8 78 52 00 00       	call   7bed <wait>
    2975:	83 c4 10             	add    $0x10,%esp
    2978:	8b 45 c8             	mov    -0x38(%ebp),%eax
    297b:	83 ec 08             	sub    $0x8,%esp
    297e:	50                   	push   %eax
    297f:	68 b7 8b 00 00       	push   $0x8bb7
    2984:	e8 da 02 00 00       	call   2c63 <Printf>
    2989:	83 c4 10             	add    $0x10,%esp
    298c:	eb 23                	jmp    29b1 <test_shell+0xb6>
    298e:	83 ec 0c             	sub    $0xc,%esp
    2991:	68 c9 8b 00 00       	push   $0x8bc9
    2996:	e8 c8 02 00 00       	call   2c63 <Printf>
    299b:	83 c4 10             	add    $0x10,%esp
    299e:	83 ec 0c             	sub    $0xc,%esp
    29a1:	ff 75 f4             	pushl  -0xc(%ebp)
    29a4:	e8 f8 51 00 00       	call   7ba1 <close>
    29a9:	83 c4 10             	add    $0x10,%esp
    29ac:	e8 e6 fb ff ff       	call   2597 <simple_shell>
    29b1:	83 ec 0c             	sub    $0xc,%esp
    29b4:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    29b7:	50                   	push   %eax
    29b8:	e8 30 52 00 00       	call   7bed <wait>
    29bd:	83 c4 10             	add    $0x10,%esp
    29c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    29c3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    29c6:	83 ec 08             	sub    $0x8,%esp
    29c9:	50                   	push   %eax
    29ca:	68 d7 8b 00 00       	push   $0x8bd7
    29cf:	e8 8f 02 00 00       	call   2c63 <Printf>
    29d4:	83 c4 10             	add    $0x10,%esp
    29d7:	eb d8                	jmp    29b1 <test_shell+0xb6>

000029d9 <test_exec>:
    29d9:	55                   	push   %ebp
    29da:	89 e5                	mov    %esp,%ebp
    29dc:	83 ec 38             	sub    $0x38,%esp
    29df:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
    29e6:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
    29ed:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
    29f3:	83 ec 08             	sub    $0x8,%esp
    29f6:	6a 02                	push   $0x2
    29f8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    29fb:	50                   	push   %eax
    29fc:	e8 dd 50 00 00       	call   7ade <open>
    2a01:	83 c4 10             	add    $0x10,%esp
    2a04:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a07:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
    2a0e:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
    2a15:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
    2a1c:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
    2a23:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
    2a2a:	83 ec 0c             	sub    $0xc,%esp
    2a2d:	8d 45 d2             	lea    -0x2e(%ebp),%eax
    2a30:	50                   	push   %eax
    2a31:	e8 8b e9 ff ff       	call   13c1 <untar>
    2a36:	83 c4 10             	add    $0x10,%esp
    2a39:	e8 16 52 00 00       	call   7c54 <fork>
    2a3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2a41:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2a45:	7e 25                	jle    2a6c <test_exec+0x93>
    2a47:	83 ec 0c             	sub    $0xc,%esp
    2a4a:	8d 45 cc             	lea    -0x34(%ebp),%eax
    2a4d:	50                   	push   %eax
    2a4e:	e8 9a 51 00 00       	call   7bed <wait>
    2a53:	83 c4 10             	add    $0x10,%esp
    2a56:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2a59:	83 ec 08             	sub    $0x8,%esp
    2a5c:	50                   	push   %eax
    2a5d:	68 b7 8b 00 00       	push   $0x8bb7
    2a62:	e8 fc 01 00 00       	call   2c63 <Printf>
    2a67:	83 c4 10             	add    $0x10,%esp
    2a6a:	eb 33                	jmp    2a9f <test_exec+0xc6>
    2a6c:	83 ec 0c             	sub    $0xc,%esp
    2a6f:	68 c9 8b 00 00       	push   $0x8bc9
    2a74:	e8 ea 01 00 00       	call   2c63 <Printf>
    2a79:	83 c4 10             	add    $0x10,%esp
    2a7c:	83 ec 0c             	sub    $0xc,%esp
    2a7f:	6a 00                	push   $0x0
    2a81:	68 f2 8b 00 00       	push   $0x8bf2
    2a86:	68 f8 8b 00 00       	push   $0x8bf8
    2a8b:	68 80 8b 00 00       	push   $0x8b80
    2a90:	68 fe 8b 00 00       	push   $0x8bfe
    2a95:	e8 4e 54 00 00       	call   7ee8 <execl>
    2a9a:	83 c4 20             	add    $0x20,%esp
    2a9d:	eb fe                	jmp    2a9d <test_exec+0xc4>
    2a9f:	c9                   	leave  
    2aa0:	c3                   	ret    

00002aa1 <INIT>:
    2aa1:	55                   	push   %ebp
    2aa2:	89 e5                	mov    %esp,%ebp
    2aa4:	83 ec 08             	sub    $0x8,%esp
    2aa7:	e8 4f fe ff ff       	call   28fb <test_shell>
    2aac:	eb fe                	jmp    2aac <INIT+0xb>

00002aae <TestA>:
    2aae:	55                   	push   %ebp
    2aaf:	89 e5                	mov    %esp,%ebp
    2ab1:	66 87 db             	xchg   %bx,%bx
    2ab4:	eb fe                	jmp    2ab4 <TestA+0x6>

00002ab6 <delay>:
    2ab6:	55                   	push   %ebp
    2ab7:	89 e5                	mov    %esp,%ebp
    2ab9:	83 ec 10             	sub    $0x10,%esp
    2abc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    2ac3:	eb 2d                	jmp    2af2 <delay+0x3c>
    2ac5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2acc:	eb 1a                	jmp    2ae8 <delay+0x32>
    2ace:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2ad5:	eb 04                	jmp    2adb <delay+0x25>
    2ad7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2adb:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    2ae2:	7e f3                	jle    2ad7 <delay+0x21>
    2ae4:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2ae8:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
    2aec:	7e e0                	jle    2ace <delay+0x18>
    2aee:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2af2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2af5:	3b 45 08             	cmp    0x8(%ebp),%eax
    2af8:	7c cb                	jl     2ac5 <delay+0xf>
    2afa:	90                   	nop
    2afb:	c9                   	leave  
    2afc:	c3                   	ret    

00002afd <TestB>:
    2afd:	55                   	push   %ebp
    2afe:	89 e5                	mov    %esp,%ebp
    2b00:	83 ec 18             	sub    $0x18,%esp
    2b03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2b0a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    2b0e:	77 16                	ja     2b26 <TestB+0x29>
    2b10:	e8 38 0e 00 00       	call   394d <get_ticks_ipc>
    2b15:	83 ec 08             	sub    $0x8,%esp
    2b18:	50                   	push   %eax
    2b19:	68 04 8c 00 00       	push   $0x8c04
    2b1e:	e8 40 01 00 00       	call   2c63 <Printf>
    2b23:	83 c4 10             	add    $0x10,%esp
    2b26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2b2a:	eb de                	jmp    2b0a <TestB+0xd>

00002b2c <TestC>:
    2b2c:	55                   	push   %ebp
    2b2d:	89 e5                	mov    %esp,%ebp
    2b2f:	83 ec 18             	sub    $0x18,%esp
    2b32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2b39:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    2b3d:	77 1a                	ja     2b59 <TestC+0x2d>
    2b3f:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
    2b46:	83 ec 08             	sub    $0x8,%esp
    2b49:	ff 75 f0             	pushl  -0x10(%ebp)
    2b4c:	68 0b 8c 00 00       	push   $0x8c0b
    2b51:	e8 0d 01 00 00       	call   2c63 <Printf>
    2b56:	83 c4 10             	add    $0x10,%esp
    2b59:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2b5d:	eb da                	jmp    2b39 <TestC+0xd>

00002b5f <sys_get_ticks>:
    2b5f:	55                   	push   %ebp
    2b60:	89 e5                	mov    %esp,%ebp
    2b62:	a1 80 fe 00 00       	mov    0xfe80,%eax
    2b67:	5d                   	pop    %ebp
    2b68:	c3                   	ret    

00002b69 <sys_write>:
    2b69:	55                   	push   %ebp
    2b6a:	89 e5                	mov    %esp,%ebp
    2b6c:	83 ec 18             	sub    $0x18,%esp
    2b6f:	8b 45 10             	mov    0x10(%ebp),%eax
    2b72:	8b 40 64             	mov    0x64(%eax),%eax
    2b75:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    2b7b:	05 80 dd 00 00       	add    $0xdd80,%eax
    2b80:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b83:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b86:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b89:	8b 45 08             	mov    0x8(%ebp),%eax
    2b8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2b8f:	eb 20                	jmp    2bb1 <sys_write+0x48>
    2b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b94:	0f b6 00             	movzbl (%eax),%eax
    2b97:	0f b6 c0             	movzbl %al,%eax
    2b9a:	83 ec 08             	sub    $0x8,%esp
    2b9d:	50                   	push   %eax
    2b9e:	ff 75 ec             	pushl  -0x14(%ebp)
    2ba1:	e8 53 43 00 00       	call   6ef9 <out_char>
    2ba6:	83 c4 10             	add    $0x10,%esp
    2ba9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2bad:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2bb1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bb5:	7f da                	jg     2b91 <sys_write+0x28>
    2bb7:	90                   	nop
    2bb8:	c9                   	leave  
    2bb9:	c3                   	ret    

00002bba <milli_delay>:
    2bba:	55                   	push   %ebp
    2bbb:	89 e5                	mov    %esp,%ebp
    2bbd:	83 ec 18             	sub    $0x18,%esp
    2bc0:	e8 88 0d 00 00       	call   394d <get_ticks_ipc>
    2bc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2bc8:	90                   	nop
    2bc9:	e8 7f 0d 00 00       	call   394d <get_ticks_ipc>
    2bce:	2b 45 f4             	sub    -0xc(%ebp),%eax
    2bd1:	89 c1                	mov    %eax,%ecx
    2bd3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    2bd8:	89 c8                	mov    %ecx,%eax
    2bda:	f7 ea                	imul   %edx
    2bdc:	c1 fa 05             	sar    $0x5,%edx
    2bdf:	89 c8                	mov    %ecx,%eax
    2be1:	c1 f8 1f             	sar    $0x1f,%eax
    2be4:	29 c2                	sub    %eax,%edx
    2be6:	89 d0                	mov    %edx,%eax
    2be8:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
    2bee:	39 45 08             	cmp    %eax,0x8(%ebp)
    2bf1:	77 d6                	ja     2bc9 <milli_delay+0xf>
    2bf3:	90                   	nop
    2bf4:	c9                   	leave  
    2bf5:	c3                   	ret    

00002bf6 <TaskSys>:
    2bf6:	55                   	push   %ebp
    2bf7:	89 e5                	mov    %esp,%ebp
    2bf9:	81 ec 88 00 00 00    	sub    $0x88,%esp
    2bff:	83 ec 04             	sub    $0x4,%esp
    2c02:	6a 6c                	push   $0x6c
    2c04:	6a 00                	push   $0x0
    2c06:	8d 45 80             	lea    -0x80(%ebp),%eax
    2c09:	50                   	push   %eax
    2c0a:	e8 ca 65 00 00       	call   91d9 <Memset>
    2c0f:	83 c4 10             	add    $0x10,%esp
    2c12:	83 ec 08             	sub    $0x8,%esp
    2c15:	6a 10                	push   $0x10
    2c17:	8d 45 80             	lea    -0x80(%ebp),%eax
    2c1a:	50                   	push   %eax
    2c1b:	e8 2e 1c 00 00       	call   484e <receive_msg>
    2c20:	83 c4 10             	add    $0x10,%esp
    2c23:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2c2a:	75 34                	jne    2c60 <TaskSys+0x6a>
    2c2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2c32:	8b 45 80             	mov    -0x80(%ebp),%eax
    2c35:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2c38:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2c3c:	75 1f                	jne    2c5d <TaskSys+0x67>
    2c3e:	a1 80 fe 00 00       	mov    0xfe80,%eax
    2c43:	89 45 88             	mov    %eax,-0x78(%ebp)
    2c46:	83 ec 08             	sub    $0x8,%esp
    2c49:	ff 75 ec             	pushl  -0x14(%ebp)
    2c4c:	8d 45 80             	lea    -0x80(%ebp),%eax
    2c4f:	50                   	push   %eax
    2c50:	e8 d3 1b 00 00       	call   4828 <send_msg>
    2c55:	83 c4 10             	add    $0x10,%esp
    2c58:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c5b:	eb 01                	jmp    2c5e <TaskSys+0x68>
    2c5d:	90                   	nop
    2c5e:	eb 9f                	jmp    2bff <TaskSys+0x9>
    2c60:	90                   	nop
    2c61:	c9                   	leave  
    2c62:	c3                   	ret    

00002c63 <Printf>:
    2c63:	55                   	push   %ebp
    2c64:	89 e5                	mov    %esp,%ebp
    2c66:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2c6c:	83 ec 04             	sub    $0x4,%esp
    2c6f:	68 00 01 00 00       	push   $0x100
    2c74:	6a 00                	push   $0x0
    2c76:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2c7c:	50                   	push   %eax
    2c7d:	e8 57 65 00 00       	call   91d9 <Memset>
    2c82:	83 c4 10             	add    $0x10,%esp
    2c85:	8d 45 0c             	lea    0xc(%ebp),%eax
    2c88:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c8b:	8b 45 08             	mov    0x8(%ebp),%eax
    2c8e:	83 ec 04             	sub    $0x4,%esp
    2c91:	ff 75 f4             	pushl  -0xc(%ebp)
    2c94:	50                   	push   %eax
    2c95:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2c9b:	50                   	push   %eax
    2c9c:	e8 20 00 00 00       	call   2cc1 <vsprintf>
    2ca1:	83 c4 10             	add    $0x10,%esp
    2ca4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2ca7:	83 ec 04             	sub    $0x4,%esp
    2caa:	ff 75 f0             	pushl  -0x10(%ebp)
    2cad:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2cb3:	50                   	push   %eax
    2cb4:	6a 00                	push   $0x0
    2cb6:	e8 af 4e 00 00       	call   7b6a <write>
    2cbb:	83 c4 10             	add    $0x10,%esp
    2cbe:	90                   	nop
    2cbf:	c9                   	leave  
    2cc0:	c3                   	ret    

00002cc1 <vsprintf>:
    2cc1:	55                   	push   %ebp
    2cc2:	89 e5                	mov    %esp,%ebp
    2cc4:	81 ec 68 02 00 00    	sub    $0x268,%esp
    2cca:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2cd0:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
    2cd6:	83 ec 04             	sub    $0x4,%esp
    2cd9:	6a 40                	push   $0x40
    2cdb:	6a 00                	push   $0x0
    2cdd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2ce3:	50                   	push   %eax
    2ce4:	e8 f0 64 00 00       	call   91d9 <Memset>
    2ce9:	83 c4 10             	add    $0x10,%esp
    2cec:	8b 45 10             	mov    0x10(%ebp),%eax
    2cef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2cf2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    2cf9:	8b 45 08             	mov    0x8(%ebp),%eax
    2cfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2cff:	e9 53 01 00 00       	jmp    2e57 <vsprintf+0x196>
    2d04:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d07:	0f b6 00             	movzbl (%eax),%eax
    2d0a:	3c 25                	cmp    $0x25,%al
    2d0c:	74 16                	je     2d24 <vsprintf+0x63>
    2d0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d11:	8d 50 01             	lea    0x1(%eax),%edx
    2d14:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2d17:	8b 55 0c             	mov    0xc(%ebp),%edx
    2d1a:	0f b6 12             	movzbl (%edx),%edx
    2d1d:	88 10                	mov    %dl,(%eax)
    2d1f:	e9 2f 01 00 00       	jmp    2e53 <vsprintf+0x192>
    2d24:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2d28:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d2b:	0f b6 00             	movzbl (%eax),%eax
    2d2e:	0f be c0             	movsbl %al,%eax
    2d31:	83 f8 64             	cmp    $0x64,%eax
    2d34:	74 26                	je     2d5c <vsprintf+0x9b>
    2d36:	83 f8 64             	cmp    $0x64,%eax
    2d39:	7f 0e                	jg     2d49 <vsprintf+0x88>
    2d3b:	83 f8 63             	cmp    $0x63,%eax
    2d3e:	0f 84 f2 00 00 00    	je     2e36 <vsprintf+0x175>
    2d44:	e9 0a 01 00 00       	jmp    2e53 <vsprintf+0x192>
    2d49:	83 f8 73             	cmp    $0x73,%eax
    2d4c:	0f 84 b0 00 00 00    	je     2e02 <vsprintf+0x141>
    2d52:	83 f8 78             	cmp    $0x78,%eax
    2d55:	74 5d                	je     2db4 <vsprintf+0xf3>
    2d57:	e9 f7 00 00 00       	jmp    2e53 <vsprintf+0x192>
    2d5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d5f:	8b 00                	mov    (%eax),%eax
    2d61:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2d64:	83 ec 04             	sub    $0x4,%esp
    2d67:	6a 0a                	push   $0xa
    2d69:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2d6f:	50                   	push   %eax
    2d70:	ff 75 e8             	pushl  -0x18(%ebp)
    2d73:	e8 20 0c 00 00       	call   3998 <itoa>
    2d78:	83 c4 10             	add    $0x10,%esp
    2d7b:	83 ec 08             	sub    $0x8,%esp
    2d7e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2d84:	50                   	push   %eax
    2d85:	ff 75 f4             	pushl  -0xc(%ebp)
    2d88:	e8 6b 64 00 00       	call   91f8 <Strcpy>
    2d8d:	83 c4 10             	add    $0x10,%esp
    2d90:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2d94:	83 ec 0c             	sub    $0xc,%esp
    2d97:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2d9d:	50                   	push   %eax
    2d9e:	e8 6f 64 00 00       	call   9212 <Strlen>
    2da3:	83 c4 10             	add    $0x10,%esp
    2da6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2da9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2dac:	01 45 f4             	add    %eax,-0xc(%ebp)
    2daf:	e9 9f 00 00 00       	jmp    2e53 <vsprintf+0x192>
    2db4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2db7:	8b 00                	mov    (%eax),%eax
    2db9:	83 ec 08             	sub    $0x8,%esp
    2dbc:	50                   	push   %eax
    2dbd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2dc3:	50                   	push   %eax
    2dc4:	e8 02 e8 ff ff       	call   15cb <atoi>
    2dc9:	83 c4 10             	add    $0x10,%esp
    2dcc:	83 ec 08             	sub    $0x8,%esp
    2dcf:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2dd5:	50                   	push   %eax
    2dd6:	ff 75 f4             	pushl  -0xc(%ebp)
    2dd9:	e8 1a 64 00 00       	call   91f8 <Strcpy>
    2dde:	83 c4 10             	add    $0x10,%esp
    2de1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2de5:	83 ec 0c             	sub    $0xc,%esp
    2de8:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2dee:	50                   	push   %eax
    2def:	e8 1e 64 00 00       	call   9212 <Strlen>
    2df4:	83 c4 10             	add    $0x10,%esp
    2df7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2dfa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2dfd:	01 45 f4             	add    %eax,-0xc(%ebp)
    2e00:	eb 51                	jmp    2e53 <vsprintf+0x192>
    2e02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e05:	8b 00                	mov    (%eax),%eax
    2e07:	83 ec 08             	sub    $0x8,%esp
    2e0a:	50                   	push   %eax
    2e0b:	ff 75 f4             	pushl  -0xc(%ebp)
    2e0e:	e8 e5 63 00 00       	call   91f8 <Strcpy>
    2e13:	83 c4 10             	add    $0x10,%esp
    2e16:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e19:	8b 00                	mov    (%eax),%eax
    2e1b:	83 ec 0c             	sub    $0xc,%esp
    2e1e:	50                   	push   %eax
    2e1f:	e8 ee 63 00 00       	call   9212 <Strlen>
    2e24:	83 c4 10             	add    $0x10,%esp
    2e27:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2e2a:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2e2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e31:	01 45 f4             	add    %eax,-0xc(%ebp)
    2e34:	eb 1d                	jmp    2e53 <vsprintf+0x192>
    2e36:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e39:	0f b6 10             	movzbl (%eax),%edx
    2e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e3f:	88 10                	mov    %dl,(%eax)
    2e41:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2e45:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    2e4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e4f:	01 45 f4             	add    %eax,-0xc(%ebp)
    2e52:	90                   	nop
    2e53:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2e57:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e5a:	0f b6 00             	movzbl (%eax),%eax
    2e5d:	84 c0                	test   %al,%al
    2e5f:	0f 85 9f fe ff ff    	jne    2d04 <vsprintf+0x43>
    2e65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e68:	2b 45 08             	sub    0x8(%ebp),%eax
    2e6b:	c9                   	leave  
    2e6c:	c3                   	ret    

00002e6d <printx>:
    2e6d:	55                   	push   %ebp
    2e6e:	89 e5                	mov    %esp,%ebp
    2e70:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2e76:	8d 45 0c             	lea    0xc(%ebp),%eax
    2e79:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2e7c:	8b 45 08             	mov    0x8(%ebp),%eax
    2e7f:	83 ec 04             	sub    $0x4,%esp
    2e82:	ff 75 f4             	pushl  -0xc(%ebp)
    2e85:	50                   	push   %eax
    2e86:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2e8c:	50                   	push   %eax
    2e8d:	e8 2f fe ff ff       	call   2cc1 <vsprintf>
    2e92:	83 c4 10             	add    $0x10,%esp
    2e95:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2e98:	83 ec 08             	sub    $0x8,%esp
    2e9b:	ff 75 f0             	pushl  -0x10(%ebp)
    2e9e:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2ea4:	50                   	push   %eax
    2ea5:	e8 5e 19 00 00       	call   4808 <write_debug>
    2eaa:	83 c4 10             	add    $0x10,%esp
    2ead:	90                   	nop
    2eae:	c9                   	leave  
    2eaf:	c3                   	ret    

00002eb0 <sys_printx>:
    2eb0:	55                   	push   %ebp
    2eb1:	89 e5                	mov    %esp,%ebp
    2eb3:	83 ec 28             	sub    $0x28,%esp
    2eb6:	a1 34 d7 00 00       	mov    0xd734,%eax
    2ebb:	85 c0                	test   %eax,%eax
    2ebd:	75 20                	jne    2edf <sys_printx+0x2f>
    2ebf:	8b 45 10             	mov    0x10(%ebp),%eax
    2ec2:	8b 40 0c             	mov    0xc(%eax),%eax
    2ec5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ec8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ecb:	83 ec 08             	sub    $0x8,%esp
    2ece:	ff 75 10             	pushl  0x10(%ebp)
    2ed1:	50                   	push   %eax
    2ed2:	e8 ea 3a 00 00       	call   69c1 <Seg2PhyAddrLDT>
    2ed7:	83 c4 10             	add    $0x10,%esp
    2eda:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2edd:	eb 19                	jmp    2ef8 <sys_printx+0x48>
    2edf:	a1 34 d7 00 00       	mov    0xd734,%eax
    2ee4:	85 c0                	test   %eax,%eax
    2ee6:	74 10                	je     2ef8 <sys_printx+0x48>
    2ee8:	83 ec 0c             	sub    $0xc,%esp
    2eeb:	6a 30                	push   $0x30
    2eed:	e8 8e 3a 00 00       	call   6980 <Seg2PhyAddr>
    2ef2:	83 c4 10             	add    $0x10,%esp
    2ef5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2ef8:	8b 55 08             	mov    0x8(%ebp),%edx
    2efb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2efe:	01 d0                	add    %edx,%eax
    2f00:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2f03:	8b 45 10             	mov    0x10(%ebp),%eax
    2f06:	8b 40 64             	mov    0x64(%eax),%eax
    2f09:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    2f0f:	05 80 dd 00 00       	add    $0xdd80,%eax
    2f14:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2f17:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2f1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f20:	0f b6 00             	movzbl (%eax),%eax
    2f23:	88 45 e3             	mov    %al,-0x1d(%ebp)
    2f26:	eb 3a                	jmp    2f62 <sys_printx+0xb2>
    2f28:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f2b:	0f b6 00             	movzbl (%eax),%eax
    2f2e:	3c 3b                	cmp    $0x3b,%al
    2f30:	74 0a                	je     2f3c <sys_printx+0x8c>
    2f32:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f35:	0f b6 00             	movzbl (%eax),%eax
    2f38:	3c 3a                	cmp    $0x3a,%al
    2f3a:	75 06                	jne    2f42 <sys_printx+0x92>
    2f3c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f40:	eb 20                	jmp    2f62 <sys_printx+0xb2>
    2f42:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f45:	0f b6 00             	movzbl (%eax),%eax
    2f48:	0f b6 c0             	movzbl %al,%eax
    2f4b:	83 ec 08             	sub    $0x8,%esp
    2f4e:	50                   	push   %eax
    2f4f:	ff 75 e4             	pushl  -0x1c(%ebp)
    2f52:	e8 a2 3f 00 00       	call   6ef9 <out_char>
    2f57:	83 c4 10             	add    $0x10,%esp
    2f5a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f5e:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    2f62:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2f66:	7f c0                	jg     2f28 <sys_printx+0x78>
    2f68:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
    2f6c:	75 11                	jne    2f7f <sys_printx+0xcf>
    2f6e:	a1 34 d7 00 00       	mov    0xd734,%eax
    2f73:	85 c0                	test   %eax,%eax
    2f75:	74 15                	je     2f8c <sys_printx+0xdc>
    2f77:	e8 85 e3 ff ff       	call   1301 <disable_int>
    2f7c:	f4                   	hlt    
    2f7d:	eb 0d                	jmp    2f8c <sys_printx+0xdc>
    2f7f:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
    2f83:	75 07                	jne    2f8c <sys_printx+0xdc>
    2f85:	e8 77 e3 ff ff       	call   1301 <disable_int>
    2f8a:	f4                   	hlt    
    2f8b:	90                   	nop
    2f8c:	90                   	nop
    2f8d:	c9                   	leave  
    2f8e:	c3                   	ret    

00002f8f <spin>:
    2f8f:	55                   	push   %ebp
    2f90:	89 e5                	mov    %esp,%ebp
    2f92:	eb fe                	jmp    2f92 <spin+0x3>

00002f94 <panic>:
    2f94:	55                   	push   %ebp
    2f95:	89 e5                	mov    %esp,%ebp
    2f97:	83 ec 08             	sub    $0x8,%esp
    2f9a:	83 ec 04             	sub    $0x4,%esp
    2f9d:	ff 75 08             	pushl  0x8(%ebp)
    2fa0:	6a 3a                	push   $0x3a
    2fa2:	68 18 8c 00 00       	push   $0x8c18
    2fa7:	e8 c1 fe ff ff       	call   2e6d <printx>
    2fac:	83 c4 10             	add    $0x10,%esp
    2faf:	90                   	nop
    2fb0:	c9                   	leave  
    2fb1:	c3                   	ret    

00002fb2 <assertion_failure>:
    2fb2:	55                   	push   %ebp
    2fb3:	89 e5                	mov    %esp,%ebp
    2fb5:	83 ec 08             	sub    $0x8,%esp
    2fb8:	83 ec 08             	sub    $0x8,%esp
    2fbb:	ff 75 14             	pushl  0x14(%ebp)
    2fbe:	ff 75 10             	pushl  0x10(%ebp)
    2fc1:	ff 75 0c             	pushl  0xc(%ebp)
    2fc4:	ff 75 08             	pushl  0x8(%ebp)
    2fc7:	6a 3b                	push   $0x3b
    2fc9:	68 20 8c 00 00       	push   $0x8c20
    2fce:	e8 9a fe ff ff       	call   2e6d <printx>
    2fd3:	83 c4 20             	add    $0x20,%esp
    2fd6:	83 ec 0c             	sub    $0xc,%esp
    2fd9:	68 53 8c 00 00       	push   $0x8c53
    2fde:	e8 ac ff ff ff       	call   2f8f <spin>
    2fe3:	83 c4 10             	add    $0x10,%esp
    2fe6:	90                   	nop
    2fe7:	c9                   	leave  
    2fe8:	c3                   	ret    

00002fe9 <dead_lock>:
    2fe9:	55                   	push   %ebp
    2fea:	89 e5                	mov    %esp,%ebp
    2fec:	b8 00 00 00 00       	mov    $0x0,%eax
    2ff1:	5d                   	pop    %ebp
    2ff2:	c3                   	ret    

00002ff3 <sys_send_msg>:
    2ff3:	55                   	push   %ebp
    2ff4:	89 e5                	mov    %esp,%ebp
    2ff6:	83 ec 48             	sub    $0x48,%esp
    2ff9:	83 ec 0c             	sub    $0xc,%esp
    2ffc:	ff 75 0c             	pushl  0xc(%ebp)
    2fff:	e8 d4 38 00 00       	call   68d8 <pid2proc>
    3004:	83 c4 10             	add    $0x10,%esp
    3007:	89 45 ec             	mov    %eax,-0x14(%ebp)
    300a:	83 ec 0c             	sub    $0xc,%esp
    300d:	ff 75 10             	pushl  0x10(%ebp)
    3010:	e8 df 38 00 00       	call   68f4 <proc2pid>
    3015:	83 c4 10             	add    $0x10,%esp
    3018:	89 45 e8             	mov    %eax,-0x18(%ebp)
    301b:	8b 45 10             	mov    0x10(%ebp),%eax
    301e:	8b 40 0c             	mov    0xc(%eax),%eax
    3021:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3024:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3027:	83 ec 08             	sub    $0x8,%esp
    302a:	ff 75 10             	pushl  0x10(%ebp)
    302d:	50                   	push   %eax
    302e:	e8 8e 39 00 00       	call   69c1 <Seg2PhyAddrLDT>
    3033:	83 c4 10             	add    $0x10,%esp
    3036:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3039:	8b 55 08             	mov    0x8(%ebp),%edx
    303c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    303f:	01 d0                	add    %edx,%eax
    3041:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3044:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
    304b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    304e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3051:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3054:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3057:	89 10                	mov    %edx,(%eax)
    3059:	83 ec 08             	sub    $0x8,%esp
    305c:	ff 75 0c             	pushl  0xc(%ebp)
    305f:	ff 75 e8             	pushl  -0x18(%ebp)
    3062:	e8 82 ff ff ff       	call   2fe9 <dead_lock>
    3067:	83 c4 10             	add    $0x10,%esp
    306a:	83 f8 01             	cmp    $0x1,%eax
    306d:	75 10                	jne    307f <sys_send_msg+0x8c>
    306f:	83 ec 0c             	sub    $0xc,%esp
    3072:	68 5f 8c 00 00       	push   $0x8c5f
    3077:	e8 18 ff ff ff       	call   2f94 <panic>
    307c:	83 c4 10             	add    $0x10,%esp
    307f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3082:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3089:	3c 02                	cmp    $0x2,%al
    308b:	0f 85 9c 01 00 00    	jne    322d <sys_send_msg+0x23a>
    3091:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3094:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    309a:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    309d:	74 12                	je     30b1 <sys_send_msg+0xbe>
    309f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30a2:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    30a8:	83 f8 10             	cmp    $0x10,%eax
    30ab:	0f 85 7c 01 00 00    	jne    322d <sys_send_msg+0x23a>
    30b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30b4:	8b 40 0c             	mov    0xc(%eax),%eax
    30b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    30ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
    30bd:	83 ec 08             	sub    $0x8,%esp
    30c0:	ff 75 ec             	pushl  -0x14(%ebp)
    30c3:	50                   	push   %eax
    30c4:	e8 f8 38 00 00       	call   69c1 <Seg2PhyAddrLDT>
    30c9:	83 c4 10             	add    $0x10,%esp
    30cc:	89 45 cc             	mov    %eax,-0x34(%ebp)
    30cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30d2:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    30d8:	89 c2                	mov    %eax,%edx
    30da:	8b 45 cc             	mov    -0x34(%ebp),%eax
    30dd:	01 d0                	add    %edx,%eax
    30df:	89 45 c8             	mov    %eax,-0x38(%ebp)
    30e2:	8b 55 dc             	mov    -0x24(%ebp),%edx
    30e5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    30e8:	83 ec 04             	sub    $0x4,%esp
    30eb:	ff 75 d8             	pushl  -0x28(%ebp)
    30ee:	52                   	push   %edx
    30ef:	50                   	push   %eax
    30f0:	e8 b6 60 00 00       	call   91ab <Memcpy>
    30f5:	83 c4 10             	add    $0x10,%esp
    30f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30fb:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3102:	00 00 00 
    3105:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3108:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    310f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3112:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    3119:	00 00 00 
    311c:	83 ec 0c             	sub    $0xc,%esp
    311f:	ff 75 ec             	pushl  -0x14(%ebp)
    3122:	e8 ef 07 00 00       	call   3916 <unblock>
    3127:	83 c4 10             	add    $0x10,%esp
    312a:	8b 45 10             	mov    0x10(%ebp),%eax
    312d:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3133:	85 c0                	test   %eax,%eax
    3135:	74 1c                	je     3153 <sys_send_msg+0x160>
    3137:	68 35 05 00 00       	push   $0x535
    313c:	68 6a 8c 00 00       	push   $0x8c6a
    3141:	68 6a 8c 00 00       	push   $0x8c6a
    3146:	68 71 8c 00 00       	push   $0x8c71
    314b:	e8 62 fe ff ff       	call   2fb2 <assertion_failure>
    3150:	83 c4 10             	add    $0x10,%esp
    3153:	8b 45 10             	mov    0x10(%ebp),%eax
    3156:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    315d:	84 c0                	test   %al,%al
    315f:	74 1c                	je     317d <sys_send_msg+0x18a>
    3161:	68 36 05 00 00       	push   $0x536
    3166:	68 6a 8c 00 00       	push   $0x8c6a
    316b:	68 6a 8c 00 00       	push   $0x8c6a
    3170:	68 84 8c 00 00       	push   $0x8c84
    3175:	e8 38 fe ff ff       	call   2fb2 <assertion_failure>
    317a:	83 c4 10             	add    $0x10,%esp
    317d:	8b 45 10             	mov    0x10(%ebp),%eax
    3180:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3186:	83 f8 1f             	cmp    $0x1f,%eax
    3189:	74 1c                	je     31a7 <sys_send_msg+0x1b4>
    318b:	68 37 05 00 00       	push   $0x537
    3190:	68 6a 8c 00 00       	push   $0x8c6a
    3195:	68 6a 8c 00 00       	push   $0x8c6a
    319a:	68 98 8c 00 00       	push   $0x8c98
    319f:	e8 0e fe ff ff       	call   2fb2 <assertion_failure>
    31a4:	83 c4 10             	add    $0x10,%esp
    31a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    31aa:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    31b0:	85 c0                	test   %eax,%eax
    31b2:	74 1c                	je     31d0 <sys_send_msg+0x1dd>
    31b4:	68 39 05 00 00       	push   $0x539
    31b9:	68 6a 8c 00 00       	push   $0x8c6a
    31be:	68 6a 8c 00 00       	push   $0x8c6a
    31c3:	68 b5 8c 00 00       	push   $0x8cb5
    31c8:	e8 e5 fd ff ff       	call   2fb2 <assertion_failure>
    31cd:	83 c4 10             	add    $0x10,%esp
    31d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    31d3:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    31da:	84 c0                	test   %al,%al
    31dc:	74 1c                	je     31fa <sys_send_msg+0x207>
    31de:	68 3a 05 00 00       	push   $0x53a
    31e3:	68 6a 8c 00 00       	push   $0x8c6a
    31e8:	68 6a 8c 00 00       	push   $0x8c6a
    31ed:	68 ca 8c 00 00       	push   $0x8cca
    31f2:	e8 bb fd ff ff       	call   2fb2 <assertion_failure>
    31f7:	83 c4 10             	add    $0x10,%esp
    31fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    31fd:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    3203:	83 f8 1f             	cmp    $0x1f,%eax
    3206:	0f 84 45 01 00 00    	je     3351 <sys_send_msg+0x35e>
    320c:	68 3b 05 00 00       	push   $0x53b
    3211:	68 6a 8c 00 00       	push   $0x8c6a
    3216:	68 6a 8c 00 00       	push   $0x8c6a
    321b:	68 e0 8c 00 00       	push   $0x8ce0
    3220:	e8 8d fd ff ff       	call   2fb2 <assertion_failure>
    3225:	83 c4 10             	add    $0x10,%esp
    3228:	e9 24 01 00 00       	jmp    3351 <sys_send_msg+0x35e>
    322d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3234:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3237:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    323a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    323d:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3243:	85 c0                	test   %eax,%eax
    3245:	75 1b                	jne    3262 <sys_send_msg+0x26f>
    3247:	8b 45 ec             	mov    -0x14(%ebp),%eax
    324a:	8b 55 10             	mov    0x10(%ebp),%edx
    324d:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    3253:	8b 45 10             	mov    0x10(%ebp),%eax
    3256:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    325d:	00 00 00 
    3260:	eb 3f                	jmp    32a1 <sys_send_msg+0x2ae>
    3262:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3265:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    326b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    326e:	eb 12                	jmp    3282 <sys_send_msg+0x28f>
    3270:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3273:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3276:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3279:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    327f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3282:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3286:	75 e8                	jne    3270 <sys_send_msg+0x27d>
    3288:	8b 45 f4             	mov    -0xc(%ebp),%eax
    328b:	8b 55 10             	mov    0x10(%ebp),%edx
    328e:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    3294:	8b 45 10             	mov    0x10(%ebp),%eax
    3297:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    329e:	00 00 00 
    32a1:	8b 45 10             	mov    0x10(%ebp),%eax
    32a4:	8b 55 08             	mov    0x8(%ebp),%edx
    32a7:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    32ad:	8b 45 10             	mov    0x10(%ebp),%eax
    32b0:	8b 55 0c             	mov    0xc(%ebp),%edx
    32b3:	89 90 84 01 00 00    	mov    %edx,0x184(%eax)
    32b9:	8b 45 10             	mov    0x10(%ebp),%eax
    32bc:	c6 80 7c 01 00 00 01 	movb   $0x1,0x17c(%eax)
    32c3:	8b 45 10             	mov    0x10(%ebp),%eax
    32c6:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    32cd:	3c 01                	cmp    $0x1,%al
    32cf:	74 1c                	je     32ed <sys_send_msg+0x2fa>
    32d1:	68 5c 05 00 00       	push   $0x55c
    32d6:	68 6a 8c 00 00       	push   $0x8c6a
    32db:	68 6a 8c 00 00       	push   $0x8c6a
    32e0:	68 04 8d 00 00       	push   $0x8d04
    32e5:	e8 c8 fc ff ff       	call   2fb2 <assertion_failure>
    32ea:	83 c4 10             	add    $0x10,%esp
    32ed:	8b 45 10             	mov    0x10(%ebp),%eax
    32f0:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    32f6:	39 45 0c             	cmp    %eax,0xc(%ebp)
    32f9:	74 1c                	je     3317 <sys_send_msg+0x324>
    32fb:	68 5d 05 00 00       	push   $0x55d
    3300:	68 6a 8c 00 00       	push   $0x8c6a
    3305:	68 6a 8c 00 00       	push   $0x8c6a
    330a:	68 20 8d 00 00       	push   $0x8d20
    330f:	e8 9e fc ff ff       	call   2fb2 <assertion_failure>
    3314:	83 c4 10             	add    $0x10,%esp
    3317:	8b 45 10             	mov    0x10(%ebp),%eax
    331a:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3320:	39 45 08             	cmp    %eax,0x8(%ebp)
    3323:	74 1c                	je     3341 <sys_send_msg+0x34e>
    3325:	68 5e 05 00 00       	push   $0x55e
    332a:	68 6a 8c 00 00       	push   $0x8c6a
    332f:	68 6a 8c 00 00       	push   $0x8c6a
    3334:	68 42 8d 00 00       	push   $0x8d42
    3339:	e8 74 fc ff ff       	call   2fb2 <assertion_failure>
    333e:	83 c4 10             	add    $0x10,%esp
    3341:	83 ec 0c             	sub    $0xc,%esp
    3344:	ff 75 10             	pushl  0x10(%ebp)
    3347:	e8 b8 05 00 00       	call   3904 <block>
    334c:	83 c4 10             	add    $0x10,%esp
    334f:	eb 01                	jmp    3352 <sys_send_msg+0x35f>
    3351:	90                   	nop
    3352:	b8 00 00 00 00       	mov    $0x0,%eax
    3357:	c9                   	leave  
    3358:	c3                   	ret    

00003359 <sys_receive_msg>:
    3359:	55                   	push   %ebp
    335a:	89 e5                	mov    %esp,%ebp
    335c:	81 ec b8 00 00 00    	sub    $0xb8,%esp
    3362:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3369:	83 ec 0c             	sub    $0xc,%esp
    336c:	ff 75 0c             	pushl  0xc(%ebp)
    336f:	e8 64 35 00 00       	call   68d8 <pid2proc>
    3374:	83 c4 10             	add    $0x10,%esp
    3377:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    337a:	83 ec 0c             	sub    $0xc,%esp
    337d:	ff 75 10             	pushl  0x10(%ebp)
    3380:	e8 6f 35 00 00       	call   68f4 <proc2pid>
    3385:	83 c4 10             	add    $0x10,%esp
    3388:	89 45 e0             	mov    %eax,-0x20(%ebp)
    338b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3392:	8b 45 10             	mov    0x10(%ebp),%eax
    3395:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    339b:	85 c0                	test   %eax,%eax
    339d:	0f 84 9a 00 00 00    	je     343d <sys_receive_msg+0xe4>
    33a3:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
    33a7:	74 0d                	je     33b6 <sys_receive_msg+0x5d>
    33a9:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
    33b0:	0f 85 87 00 00 00    	jne    343d <sys_receive_msg+0xe4>
    33b6:	83 ec 04             	sub    $0x4,%esp
    33b9:	6a 6c                	push   $0x6c
    33bb:	6a 00                	push   $0x0
    33bd:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
    33c3:	50                   	push   %eax
    33c4:	e8 10 5e 00 00       	call   91d9 <Memset>
    33c9:	83 c4 10             	add    $0x10,%esp
    33cc:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
    33d3:	02 00 00 
    33d6:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
    33dd:	83 ec 08             	sub    $0x8,%esp
    33e0:	ff 75 08             	pushl  0x8(%ebp)
    33e3:	ff 75 e0             	pushl  -0x20(%ebp)
    33e6:	e8 30 36 00 00       	call   6a1b <v2l>
    33eb:	83 c4 10             	add    $0x10,%esp
    33ee:	89 c2                	mov    %eax,%edx
    33f0:	83 ec 04             	sub    $0x4,%esp
    33f3:	6a 6c                	push   $0x6c
    33f5:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
    33fb:	50                   	push   %eax
    33fc:	52                   	push   %edx
    33fd:	e8 a9 5d 00 00       	call   91ab <Memcpy>
    3402:	83 c4 10             	add    $0x10,%esp
    3405:	8b 45 10             	mov    0x10(%ebp),%eax
    3408:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    340f:	00 00 00 
    3412:	8b 45 10             	mov    0x10(%ebp),%eax
    3415:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    341c:	00 00 00 
    341f:	8b 45 10             	mov    0x10(%ebp),%eax
    3422:	c7 80 84 01 00 00 1f 	movl   $0x1f,0x184(%eax)
    3429:	00 00 00 
    342c:	8b 45 10             	mov    0x10(%ebp),%eax
    342f:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3436:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    343d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    3441:	0f 84 cd 03 00 00    	je     3814 <sys_receive_msg+0x4bb>
    3447:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
    344b:	75 26                	jne    3473 <sys_receive_msg+0x11a>
    344d:	8b 45 10             	mov    0x10(%ebp),%eax
    3450:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3456:	85 c0                	test   %eax,%eax
    3458:	0f 84 87 00 00 00    	je     34e5 <sys_receive_msg+0x18c>
    345e:	8b 45 10             	mov    0x10(%ebp),%eax
    3461:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    3467:	89 45 f0             	mov    %eax,-0x10(%ebp)
    346a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    3471:	eb 72                	jmp    34e5 <sys_receive_msg+0x18c>
    3473:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3477:	78 6c                	js     34e5 <sys_receive_msg+0x18c>
    3479:	83 7d 0c 05          	cmpl   $0x5,0xc(%ebp)
    347d:	7f 66                	jg     34e5 <sys_receive_msg+0x18c>
    347f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3482:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3489:	3c 01                	cmp    $0x1,%al
    348b:	75 58                	jne    34e5 <sys_receive_msg+0x18c>
    348d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3490:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3496:	83 f8 10             	cmp    $0x10,%eax
    3499:	74 0e                	je     34a9 <sys_receive_msg+0x150>
    349b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    349e:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    34a4:	39 45 e0             	cmp    %eax,-0x20(%ebp)
    34a7:	75 3c                	jne    34e5 <sys_receive_msg+0x18c>
    34a9:	8b 45 10             	mov    0x10(%ebp),%eax
    34ac:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    34b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    34b5:	eb 28                	jmp    34df <sys_receive_msg+0x186>
    34b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
    34bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34c0:	8b 50 58             	mov    0x58(%eax),%edx
    34c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    34c6:	39 c2                	cmp    %eax,%edx
    34c8:	75 09                	jne    34d3 <sys_receive_msg+0x17a>
    34ca:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    34d1:	eb 12                	jmp    34e5 <sys_receive_msg+0x18c>
    34d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34d6:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    34dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    34df:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    34e3:	75 d2                	jne    34b7 <sys_receive_msg+0x15e>
    34e5:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    34e9:	0f 85 82 02 00 00    	jne    3771 <sys_receive_msg+0x418>
    34ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34f2:	89 45 dc             	mov    %eax,-0x24(%ebp)
    34f5:	8b 45 10             	mov    0x10(%ebp),%eax
    34f8:	8b 40 0c             	mov    0xc(%eax),%eax
    34fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
    34fe:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3501:	83 ec 08             	sub    $0x8,%esp
    3504:	ff 75 10             	pushl  0x10(%ebp)
    3507:	50                   	push   %eax
    3508:	e8 b4 34 00 00       	call   69c1 <Seg2PhyAddrLDT>
    350d:	83 c4 10             	add    $0x10,%esp
    3510:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3513:	8b 55 08             	mov    0x8(%ebp),%edx
    3516:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3519:	01 d0                	add    %edx,%eax
    351b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    351e:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
    3525:	8b 45 10             	mov    0x10(%ebp),%eax
    3528:	8b 40 0c             	mov    0xc(%eax),%eax
    352b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    352e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3531:	83 ec 08             	sub    $0x8,%esp
    3534:	ff 75 dc             	pushl  -0x24(%ebp)
    3537:	50                   	push   %eax
    3538:	e8 84 34 00 00       	call   69c1 <Seg2PhyAddrLDT>
    353d:	83 c4 10             	add    $0x10,%esp
    3540:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3543:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3546:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    354c:	89 c2                	mov    %eax,%edx
    354e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3551:	01 d0                	add    %edx,%eax
    3553:	89 45 c0             	mov    %eax,-0x40(%ebp)
    3556:	83 ec 04             	sub    $0x4,%esp
    3559:	ff 75 cc             	pushl  -0x34(%ebp)
    355c:	ff 75 c0             	pushl  -0x40(%ebp)
    355f:	ff 75 d0             	pushl  -0x30(%ebp)
    3562:	e8 44 5c 00 00       	call   91ab <Memcpy>
    3567:	83 c4 10             	add    $0x10,%esp
    356a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    356d:	89 45 bc             	mov    %eax,-0x44(%ebp)
    3570:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
    3574:	75 27                	jne    359d <sys_receive_msg+0x244>
    3576:	8b 45 08             	mov    0x8(%ebp),%eax
    3579:	8b 40 68             	mov    0x68(%eax),%eax
    357c:	83 f8 06             	cmp    $0x6,%eax
    357f:	74 1c                	je     359d <sys_receive_msg+0x244>
    3581:	68 eb 05 00 00       	push   $0x5eb
    3586:	68 6a 8c 00 00       	push   $0x8c6a
    358b:	68 6a 8c 00 00       	push   $0x8c6a
    3590:	68 57 8d 00 00       	push   $0x8d57
    3595:	e8 18 fa ff ff       	call   2fb2 <assertion_failure>
    359a:	83 c4 10             	add    $0x10,%esp
    359d:	8b 45 10             	mov    0x10(%ebp),%eax
    35a0:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    35a6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    35a9:	75 21                	jne    35cc <sys_receive_msg+0x273>
    35ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35ae:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    35b4:	8b 45 10             	mov    0x10(%ebp),%eax
    35b7:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    35bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35c0:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    35c7:	00 00 00 
    35ca:	eb 1f                	jmp    35eb <sys_receive_msg+0x292>
    35cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35cf:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    35d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35d8:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    35de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35e1:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    35e8:	00 00 00 
    35eb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    35ee:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    35f5:	00 00 00 
    35f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    35fb:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3602:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3605:	c7 80 84 01 00 00 1f 	movl   $0x1f,0x184(%eax)
    360c:	00 00 00 
    360f:	8b 45 10             	mov    0x10(%ebp),%eax
    3612:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3619:	00 00 00 
    361c:	8b 45 10             	mov    0x10(%ebp),%eax
    361f:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    3626:	00 00 00 
    3629:	8b 45 10             	mov    0x10(%ebp),%eax
    362c:	c7 80 84 01 00 00 1f 	movl   $0x1f,0x184(%eax)
    3633:	00 00 00 
    3636:	83 ec 0c             	sub    $0xc,%esp
    3639:	ff 75 dc             	pushl  -0x24(%ebp)
    363c:	e8 d5 02 00 00       	call   3916 <unblock>
    3641:	83 c4 10             	add    $0x10,%esp
    3644:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3647:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    364d:	85 c0                	test   %eax,%eax
    364f:	74 1c                	je     366d <sys_receive_msg+0x314>
    3651:	68 0c 06 00 00       	push   $0x60c
    3656:	68 6a 8c 00 00       	push   $0x8c6a
    365b:	68 6a 8c 00 00       	push   $0x8c6a
    3660:	68 69 8d 00 00       	push   $0x8d69
    3665:	e8 48 f9 ff ff       	call   2fb2 <assertion_failure>
    366a:	83 c4 10             	add    $0x10,%esp
    366d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3670:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3677:	84 c0                	test   %al,%al
    3679:	74 1c                	je     3697 <sys_receive_msg+0x33e>
    367b:	68 0d 06 00 00       	push   $0x60d
    3680:	68 6a 8c 00 00       	push   $0x8c6a
    3685:	68 6a 8c 00 00       	push   $0x8c6a
    368a:	68 81 8d 00 00       	push   $0x8d81
    368f:	e8 1e f9 ff ff       	call   2fb2 <assertion_failure>
    3694:	83 c4 10             	add    $0x10,%esp
    3697:	8b 45 dc             	mov    -0x24(%ebp),%eax
    369a:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    36a0:	83 f8 1f             	cmp    $0x1f,%eax
    36a3:	74 1c                	je     36c1 <sys_receive_msg+0x368>
    36a5:	68 0e 06 00 00       	push   $0x60e
    36aa:	68 6a 8c 00 00       	push   $0x8c6a
    36af:	68 6a 8c 00 00       	push   $0x8c6a
    36b4:	68 9c 8d 00 00       	push   $0x8d9c
    36b9:	e8 f4 f8 ff ff       	call   2fb2 <assertion_failure>
    36be:	83 c4 10             	add    $0x10,%esp
    36c1:	8b 45 10             	mov    0x10(%ebp),%eax
    36c4:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    36ca:	85 c0                	test   %eax,%eax
    36cc:	74 1c                	je     36ea <sys_receive_msg+0x391>
    36ce:	68 10 06 00 00       	push   $0x610
    36d3:	68 6a 8c 00 00       	push   $0x8c6a
    36d8:	68 6a 8c 00 00       	push   $0x8c6a
    36dd:	68 b5 8c 00 00       	push   $0x8cb5
    36e2:	e8 cb f8 ff ff       	call   2fb2 <assertion_failure>
    36e7:	83 c4 10             	add    $0x10,%esp
    36ea:	8b 45 10             	mov    0x10(%ebp),%eax
    36ed:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    36f4:	84 c0                	test   %al,%al
    36f6:	74 1c                	je     3714 <sys_receive_msg+0x3bb>
    36f8:	68 11 06 00 00       	push   $0x611
    36fd:	68 6a 8c 00 00       	push   $0x8c6a
    3702:	68 6a 8c 00 00       	push   $0x8c6a
    3707:	68 ca 8c 00 00       	push   $0x8cca
    370c:	e8 a1 f8 ff ff       	call   2fb2 <assertion_failure>
    3711:	83 c4 10             	add    $0x10,%esp
    3714:	8b 45 10             	mov    0x10(%ebp),%eax
    3717:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    371d:	83 f8 1f             	cmp    $0x1f,%eax
    3720:	74 1c                	je     373e <sys_receive_msg+0x3e5>
    3722:	68 12 06 00 00       	push   $0x612
    3727:	68 6a 8c 00 00       	push   $0x8c6a
    372c:	68 6a 8c 00 00       	push   $0x8c6a
    3731:	68 e0 8c 00 00       	push   $0x8ce0
    3736:	e8 77 f8 ff ff       	call   2fb2 <assertion_failure>
    373b:	83 c4 10             	add    $0x10,%esp
    373e:	8b 45 10             	mov    0x10(%ebp),%eax
    3741:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    3747:	83 f8 1f             	cmp    $0x1f,%eax
    374a:	0f 84 bd 00 00 00    	je     380d <sys_receive_msg+0x4b4>
    3750:	68 13 06 00 00       	push   $0x613
    3755:	68 6a 8c 00 00       	push   $0x8c6a
    375a:	68 6a 8c 00 00       	push   $0x8c6a
    375f:	68 c0 8d 00 00       	push   $0x8dc0
    3764:	e8 49 f8 ff ff       	call   2fb2 <assertion_failure>
    3769:	83 c4 10             	add    $0x10,%esp
    376c:	e9 9c 00 00 00       	jmp    380d <sys_receive_msg+0x4b4>
    3771:	8b 45 10             	mov    0x10(%ebp),%eax
    3774:	c6 80 7c 01 00 00 02 	movb   $0x2,0x17c(%eax)
    377b:	8b 45 10             	mov    0x10(%ebp),%eax
    377e:	8b 55 08             	mov    0x8(%ebp),%edx
    3781:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    3787:	83 7d 0c 10          	cmpl   $0x10,0xc(%ebp)
    378b:	75 0f                	jne    379c <sys_receive_msg+0x443>
    378d:	8b 45 10             	mov    0x10(%ebp),%eax
    3790:	c7 80 88 01 00 00 10 	movl   $0x10,0x188(%eax)
    3797:	00 00 00 
    379a:	eb 0c                	jmp    37a8 <sys_receive_msg+0x44f>
    379c:	8b 45 10             	mov    0x10(%ebp),%eax
    379f:	8b 55 0c             	mov    0xc(%ebp),%edx
    37a2:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
    37a8:	8b 0d 30 d7 00 00    	mov    0xd730,%ecx
    37ae:	ba 67 66 66 66       	mov    $0x66666667,%edx
    37b3:	89 c8                	mov    %ecx,%eax
    37b5:	f7 ea                	imul   %edx
    37b7:	c1 fa 06             	sar    $0x6,%edx
    37ba:	89 c8                	mov    %ecx,%eax
    37bc:	c1 f8 1f             	sar    $0x1f,%eax
    37bf:	29 c2                	sub    %eax,%edx
    37c1:	89 d0                	mov    %edx,%eax
    37c3:	8d 50 01             	lea    0x1(%eax),%edx
    37c6:	89 d0                	mov    %edx,%eax
    37c8:	c1 e0 02             	shl    $0x2,%eax
    37cb:	01 d0                	add    %edx,%eax
    37cd:	c1 e0 05             	shl    $0x5,%eax
    37d0:	a3 30 d7 00 00       	mov    %eax,0xd730
    37d5:	8b 45 10             	mov    0x10(%ebp),%eax
    37d8:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    37df:	3c 02                	cmp    $0x2,%al
    37e1:	74 1c                	je     37ff <sys_receive_msg+0x4a6>
    37e3:	68 48 06 00 00       	push   $0x648
    37e8:	68 6a 8c 00 00       	push   $0x8c6a
    37ed:	68 6a 8c 00 00       	push   $0x8c6a
    37f2:	68 df 8d 00 00       	push   $0x8ddf
    37f7:	e8 b6 f7 ff ff       	call   2fb2 <assertion_failure>
    37fc:	83 c4 10             	add    $0x10,%esp
    37ff:	83 ec 0c             	sub    $0xc,%esp
    3802:	ff 75 10             	pushl  0x10(%ebp)
    3805:	e8 fa 00 00 00       	call   3904 <block>
    380a:	83 c4 10             	add    $0x10,%esp
    380d:	b8 00 00 00 00       	mov    $0x0,%eax
    3812:	eb 02                	jmp    3816 <sys_receive_msg+0x4bd>
    3814:	90                   	nop
    3815:	90                   	nop
    3816:	c9                   	leave  
    3817:	c3                   	ret    

00003818 <disp_str_colour_debug>:
    3818:	55                   	push   %ebp
    3819:	89 e5                	mov    %esp,%ebp
    381b:	90                   	nop
    381c:	5d                   	pop    %ebp
    381d:	c3                   	ret    

0000381e <send_rec>:
    381e:	55                   	push   %ebp
    381f:	89 e5                	mov    %esp,%ebp
    3821:	83 ec 18             	sub    $0x18,%esp
    3824:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    3828:	74 28                	je     3852 <send_rec+0x34>
    382a:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    382e:	74 22                	je     3852 <send_rec+0x34>
    3830:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    3834:	74 1c                	je     3852 <send_rec+0x34>
    3836:	68 71 06 00 00       	push   $0x671
    383b:	68 6a 8c 00 00       	push   $0x8c6a
    3840:	68 6a 8c 00 00       	push   $0x8c6a
    3845:	68 00 8e 00 00       	push   $0x8e00
    384a:	e8 63 f7 ff ff       	call   2fb2 <assertion_failure>
    384f:	83 c4 10             	add    $0x10,%esp
    3852:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    3856:	75 12                	jne    386a <send_rec+0x4c>
    3858:	83 ec 04             	sub    $0x4,%esp
    385b:	6a 6c                	push   $0x6c
    385d:	6a 00                	push   $0x0
    385f:	ff 75 0c             	pushl  0xc(%ebp)
    3862:	e8 72 59 00 00       	call   91d9 <Memset>
    3867:	83 c4 10             	add    $0x10,%esp
    386a:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    386e:	74 22                	je     3892 <send_rec+0x74>
    3870:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    3874:	74 32                	je     38a8 <send_rec+0x8a>
    3876:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    387a:	75 6e                	jne    38ea <send_rec+0xcc>
    387c:	83 ec 08             	sub    $0x8,%esp
    387f:	ff 75 10             	pushl  0x10(%ebp)
    3882:	ff 75 0c             	pushl  0xc(%ebp)
    3885:	e8 9e 0f 00 00       	call   4828 <send_msg>
    388a:	83 c4 10             	add    $0x10,%esp
    388d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3890:	eb 6b                	jmp    38fd <send_rec+0xdf>
    3892:	83 ec 08             	sub    $0x8,%esp
    3895:	ff 75 10             	pushl  0x10(%ebp)
    3898:	ff 75 0c             	pushl  0xc(%ebp)
    389b:	e8 ae 0f 00 00       	call   484e <receive_msg>
    38a0:	83 c4 10             	add    $0x10,%esp
    38a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38a6:	eb 55                	jmp    38fd <send_rec+0xdf>
    38a8:	83 ec 08             	sub    $0x8,%esp
    38ab:	ff 75 10             	pushl  0x10(%ebp)
    38ae:	ff 75 0c             	pushl  0xc(%ebp)
    38b1:	e8 72 0f 00 00       	call   4828 <send_msg>
    38b6:	83 c4 10             	add    $0x10,%esp
    38b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    38c0:	75 3a                	jne    38fc <send_rec+0xde>
    38c2:	83 ec 04             	sub    $0x4,%esp
    38c5:	6a 6c                	push   $0x6c
    38c7:	6a 00                	push   $0x0
    38c9:	ff 75 0c             	pushl  0xc(%ebp)
    38cc:	e8 08 59 00 00       	call   91d9 <Memset>
    38d1:	83 c4 10             	add    $0x10,%esp
    38d4:	83 ec 08             	sub    $0x8,%esp
    38d7:	ff 75 10             	pushl  0x10(%ebp)
    38da:	ff 75 0c             	pushl  0xc(%ebp)
    38dd:	e8 6c 0f 00 00       	call   484e <receive_msg>
    38e2:	83 c4 10             	add    $0x10,%esp
    38e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38e8:	eb 12                	jmp    38fc <send_rec+0xde>
    38ea:	83 ec 0c             	sub    $0xc,%esp
    38ed:	68 3c 8e 00 00       	push   $0x8e3c
    38f2:	e8 9d f6 ff ff       	call   2f94 <panic>
    38f7:	83 c4 10             	add    $0x10,%esp
    38fa:	eb 01                	jmp    38fd <send_rec+0xdf>
    38fc:	90                   	nop
    38fd:	b8 00 00 00 00       	mov    $0x0,%eax
    3902:	c9                   	leave  
    3903:	c3                   	ret    

00003904 <block>:
    3904:	55                   	push   %ebp
    3905:	89 e5                	mov    %esp,%ebp
    3907:	83 ec 08             	sub    $0x8,%esp
    390a:	e8 92 2e 00 00       	call   67a1 <schedule_process>
    390f:	b8 00 00 00 00       	mov    $0x0,%eax
    3914:	c9                   	leave  
    3915:	c3                   	ret    

00003916 <unblock>:
    3916:	55                   	push   %ebp
    3917:	89 e5                	mov    %esp,%ebp
    3919:	83 ec 08             	sub    $0x8,%esp
    391c:	8b 45 08             	mov    0x8(%ebp),%eax
    391f:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3926:	84 c0                	test   %al,%al
    3928:	74 1c                	je     3946 <unblock+0x30>
    392a:	68 a9 06 00 00       	push   $0x6a9
    392f:	68 6a 8c 00 00       	push   $0x8c6a
    3934:	68 6a 8c 00 00       	push   $0x8c6a
    3939:	68 51 8e 00 00       	push   $0x8e51
    393e:	e8 6f f6 ff ff       	call   2fb2 <assertion_failure>
    3943:	83 c4 10             	add    $0x10,%esp
    3946:	b8 00 00 00 00       	mov    $0x0,%eax
    394b:	c9                   	leave  
    394c:	c3                   	ret    

0000394d <get_ticks_ipc>:
    394d:	55                   	push   %ebp
    394e:	89 e5                	mov    %esp,%ebp
    3950:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3956:	83 ec 04             	sub    $0x4,%esp
    3959:	6a 6c                	push   $0x6c
    395b:	6a 00                	push   $0x0
    395d:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3960:	50                   	push   %eax
    3961:	e8 73 58 00 00       	call   91d9 <Memset>
    3966:	83 c4 10             	add    $0x10,%esp
    3969:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
    3970:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    3977:	83 ec 04             	sub    $0x4,%esp
    397a:	6a 01                	push   $0x1
    397c:	8d 45 84             	lea    -0x7c(%ebp),%eax
    397f:	50                   	push   %eax
    3980:	6a 03                	push   $0x3
    3982:	e8 97 fe ff ff       	call   381e <send_rec>
    3987:	83 c4 10             	add    $0x10,%esp
    398a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    398d:	8b 45 8c             	mov    -0x74(%ebp),%eax
    3990:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3993:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3996:	c9                   	leave  
    3997:	c3                   	ret    

00003998 <itoa>:
    3998:	55                   	push   %ebp
    3999:	89 e5                	mov    %esp,%ebp
    399b:	53                   	push   %ebx
    399c:	83 ec 14             	sub    $0x14,%esp
    399f:	8b 45 08             	mov    0x8(%ebp),%eax
    39a2:	99                   	cltd   
    39a3:	f7 7d 10             	idivl  0x10(%ebp)
    39a6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    39a9:	8b 45 08             	mov    0x8(%ebp),%eax
    39ac:	99                   	cltd   
    39ad:	f7 7d 10             	idivl  0x10(%ebp)
    39b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    39b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    39b7:	74 14                	je     39cd <itoa+0x35>
    39b9:	83 ec 04             	sub    $0x4,%esp
    39bc:	ff 75 10             	pushl  0x10(%ebp)
    39bf:	ff 75 0c             	pushl  0xc(%ebp)
    39c2:	ff 75 f0             	pushl  -0x10(%ebp)
    39c5:	e8 ce ff ff ff       	call   3998 <itoa>
    39ca:	83 c4 10             	add    $0x10,%esp
    39cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39d0:	8d 58 30             	lea    0x30(%eax),%ebx
    39d3:	8b 45 0c             	mov    0xc(%ebp),%eax
    39d6:	8b 00                	mov    (%eax),%eax
    39d8:	8d 48 01             	lea    0x1(%eax),%ecx
    39db:	8b 55 0c             	mov    0xc(%ebp),%edx
    39de:	89 0a                	mov    %ecx,(%edx)
    39e0:	89 da                	mov    %ebx,%edx
    39e2:	88 10                	mov    %dl,(%eax)
    39e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    39e7:	8b 00                	mov    (%eax),%eax
    39e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    39ec:	c9                   	leave  
    39ed:	c3                   	ret    

000039ee <i2a>:
    39ee:	55                   	push   %ebp
    39ef:	89 e5                	mov    %esp,%ebp
    39f1:	53                   	push   %ebx
    39f2:	83 ec 14             	sub    $0x14,%esp
    39f5:	8b 45 08             	mov    0x8(%ebp),%eax
    39f8:	99                   	cltd   
    39f9:	f7 7d 0c             	idivl  0xc(%ebp)
    39fc:	89 55 f4             	mov    %edx,-0xc(%ebp)
    39ff:	8b 45 08             	mov    0x8(%ebp),%eax
    3a02:	99                   	cltd   
    3a03:	f7 7d 0c             	idivl  0xc(%ebp)
    3a06:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3a09:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3a0d:	74 14                	je     3a23 <i2a+0x35>
    3a0f:	83 ec 04             	sub    $0x4,%esp
    3a12:	ff 75 10             	pushl  0x10(%ebp)
    3a15:	ff 75 0c             	pushl  0xc(%ebp)
    3a18:	ff 75 f0             	pushl  -0x10(%ebp)
    3a1b:	e8 ce ff ff ff       	call   39ee <i2a>
    3a20:	83 c4 10             	add    $0x10,%esp
    3a23:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    3a27:	7f 0a                	jg     3a33 <i2a+0x45>
    3a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a2c:	83 c0 30             	add    $0x30,%eax
    3a2f:	89 c3                	mov    %eax,%ebx
    3a31:	eb 08                	jmp    3a3b <i2a+0x4d>
    3a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a36:	83 c0 37             	add    $0x37,%eax
    3a39:	89 c3                	mov    %eax,%ebx
    3a3b:	8b 45 10             	mov    0x10(%ebp),%eax
    3a3e:	8b 00                	mov    (%eax),%eax
    3a40:	8d 48 01             	lea    0x1(%eax),%ecx
    3a43:	8b 55 10             	mov    0x10(%ebp),%edx
    3a46:	89 0a                	mov    %ecx,(%edx)
    3a48:	88 18                	mov    %bl,(%eax)
    3a4a:	8b 45 10             	mov    0x10(%ebp),%eax
    3a4d:	8b 00                	mov    (%eax),%eax
    3a4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3a52:	c9                   	leave  
    3a53:	c3                   	ret    

00003a54 <inform_int>:
    3a54:	55                   	push   %ebp
    3a55:	89 e5                	mov    %esp,%ebp
    3a57:	83 ec 18             	sub    $0x18,%esp
    3a5a:	83 ec 0c             	sub    $0xc,%esp
    3a5d:	ff 75 08             	pushl  0x8(%ebp)
    3a60:	e8 73 2e 00 00       	call   68d8 <pid2proc>
    3a65:	83 c4 10             	add    $0x10,%esp
    3a68:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a6e:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    3a75:	0f be c0             	movsbl %al,%eax
    3a78:	83 e0 02             	and    $0x2,%eax
    3a7b:	85 c0                	test   %eax,%eax
    3a7d:	74 7e                	je     3afd <inform_int+0xa9>
    3a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a82:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    3a88:	3d 13 02 00 00       	cmp    $0x213,%eax
    3a8d:	74 0e                	je     3a9d <inform_int+0x49>
    3a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a92:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    3a98:	83 f8 10             	cmp    $0x10,%eax
    3a9b:	75 6d                	jne    3b0a <inform_int+0xb6>
    3a9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aa0:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3aa6:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
    3aac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aaf:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    3ab5:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
    3abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3abf:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    3ac6:	00 00 00 
    3ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3acc:	c7 80 88 01 00 00 1f 	movl   $0x1f,0x188(%eax)
    3ad3:	00 00 00 
    3ad6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ad9:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    3ae0:	00 00 00 
    3ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ae6:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    3aed:	83 ec 0c             	sub    $0xc,%esp
    3af0:	ff 75 f4             	pushl  -0xc(%ebp)
    3af3:	e8 1e fe ff ff       	call   3916 <unblock>
    3af8:	83 c4 10             	add    $0x10,%esp
    3afb:	eb 0d                	jmp    3b0a <inform_int+0xb6>
    3afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b00:	c7 80 94 01 00 00 01 	movl   $0x1,0x194(%eax)
    3b07:	00 00 00 
    3b0a:	90                   	nop
    3b0b:	c9                   	leave  
    3b0c:	c3                   	ret    

00003b0d <strcmp>:
    3b0d:	55                   	push   %ebp
    3b0e:	89 e5                	mov    %esp,%ebp
    3b10:	83 ec 10             	sub    $0x10,%esp
    3b13:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3b17:	74 06                	je     3b1f <strcmp+0x12>
    3b19:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3b1d:	75 08                	jne    3b27 <strcmp+0x1a>
    3b1f:	8b 45 08             	mov    0x8(%ebp),%eax
    3b22:	2b 45 0c             	sub    0xc(%ebp),%eax
    3b25:	eb 53                	jmp    3b7a <strcmp+0x6d>
    3b27:	8b 45 08             	mov    0x8(%ebp),%eax
    3b2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3b2d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b30:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3b33:	eb 18                	jmp    3b4d <strcmp+0x40>
    3b35:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b38:	0f b6 10             	movzbl (%eax),%edx
    3b3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3b3e:	0f b6 00             	movzbl (%eax),%eax
    3b41:	38 c2                	cmp    %al,%dl
    3b43:	75 1e                	jne    3b63 <strcmp+0x56>
    3b45:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3b49:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3b4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b50:	0f b6 00             	movzbl (%eax),%eax
    3b53:	84 c0                	test   %al,%al
    3b55:	74 0d                	je     3b64 <strcmp+0x57>
    3b57:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3b5a:	0f b6 00             	movzbl (%eax),%eax
    3b5d:	84 c0                	test   %al,%al
    3b5f:	75 d4                	jne    3b35 <strcmp+0x28>
    3b61:	eb 01                	jmp    3b64 <strcmp+0x57>
    3b63:	90                   	nop
    3b64:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b67:	0f b6 00             	movzbl (%eax),%eax
    3b6a:	0f be d0             	movsbl %al,%edx
    3b6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3b70:	0f b6 00             	movzbl (%eax),%eax
    3b73:	0f be c0             	movsbl %al,%eax
    3b76:	29 c2                	sub    %eax,%edx
    3b78:	89 d0                	mov    %edx,%eax
    3b7a:	c9                   	leave  
    3b7b:	c3                   	ret    

00003b7c <TaskHD>:
    3b7c:	55                   	push   %ebp
    3b7d:	89 e5                	mov    %esp,%ebp
    3b7f:	83 ec 08             	sub    $0x8,%esp
    3b82:	e8 07 00 00 00       	call   3b8e <init_hd>
    3b87:	e8 1c 00 00 00       	call   3ba8 <hd_handle>
    3b8c:	eb f9                	jmp    3b87 <TaskHD+0xb>

00003b8e <init_hd>:
    3b8e:	55                   	push   %ebp
    3b8f:	89 e5                	mov    %esp,%ebp
    3b91:	83 ec 18             	sub    $0x18,%esp
    3b94:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
    3b9b:	e8 f9 d7 ff ff       	call   1399 <enable_8259A_casecade_irq>
    3ba0:	e8 08 d8 ff ff       	call   13ad <enable_8259A_slave_winchester_irq>
    3ba5:	90                   	nop
    3ba6:	c9                   	leave  
    3ba7:	c3                   	ret    

00003ba8 <hd_handle>:
    3ba8:	55                   	push   %ebp
    3ba9:	89 e5                	mov    %esp,%ebp
    3bab:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3bb1:	83 ec 04             	sub    $0x4,%esp
    3bb4:	6a 10                	push   $0x10
    3bb6:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3bb9:	50                   	push   %eax
    3bba:	6a 02                	push   $0x2
    3bbc:	e8 5d fc ff ff       	call   381e <send_rec>
    3bc1:	83 c4 10             	add    $0x10,%esp
    3bc4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3bc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3bca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3bce:	0f 84 96 00 00 00    	je     3c6a <hd_handle+0xc2>
    3bd4:	8b 45 84             	mov    -0x7c(%ebp),%eax
    3bd7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3bda:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3bde:	74 23                	je     3c03 <hd_handle+0x5b>
    3be0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3be4:	77 08                	ja     3bee <hd_handle+0x46>
    3be6:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    3bea:	74 10                	je     3bfc <hd_handle+0x54>
    3bec:	eb 35                	jmp    3c23 <hd_handle+0x7b>
    3bee:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    3bf2:	74 0f                	je     3c03 <hd_handle+0x5b>
    3bf4:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    3bf8:	74 1a                	je     3c14 <hd_handle+0x6c>
    3bfa:	eb 27                	jmp    3c23 <hd_handle+0x7b>
    3bfc:	e8 18 07 00 00       	call   4319 <hd_open>
    3c01:	eb 31                	jmp    3c34 <hd_handle+0x8c>
    3c03:	83 ec 0c             	sub    $0xc,%esp
    3c06:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3c09:	50                   	push   %eax
    3c0a:	e8 02 08 00 00       	call   4411 <hd_rdwt>
    3c0f:	83 c4 10             	add    $0x10,%esp
    3c12:	eb 20                	jmp    3c34 <hd_handle+0x8c>
    3c14:	83 ec 0c             	sub    $0xc,%esp
    3c17:	6a 00                	push   $0x0
    3c19:	e8 4a 07 00 00       	call   4368 <get_hd_ioctl>
    3c1e:	83 c4 10             	add    $0x10,%esp
    3c21:	eb 11                	jmp    3c34 <hd_handle+0x8c>
    3c23:	83 ec 0c             	sub    $0xc,%esp
    3c26:	68 69 8e 00 00       	push   $0x8e69
    3c2b:	e8 5f f3 ff ff       	call   2f8f <spin>
    3c30:	83 c4 10             	add    $0x10,%esp
    3c33:	90                   	nop
    3c34:	83 ec 04             	sub    $0x4,%esp
    3c37:	6a 6c                	push   $0x6c
    3c39:	6a 00                	push   $0x0
    3c3b:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3c3e:	50                   	push   %eax
    3c3f:	e8 95 55 00 00       	call   91d9 <Memset>
    3c44:	83 c4 10             	add    $0x10,%esp
    3c47:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
    3c4e:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
    3c55:	83 ec 04             	sub    $0x4,%esp
    3c58:	6a 03                	push   $0x3
    3c5a:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3c5d:	50                   	push   %eax
    3c5e:	6a 01                	push   $0x1
    3c60:	e8 b9 fb ff ff       	call   381e <send_rec>
    3c65:	83 c4 10             	add    $0x10,%esp
    3c68:	eb 01                	jmp    3c6b <hd_handle+0xc3>
    3c6a:	90                   	nop
    3c6b:	c9                   	leave  
    3c6c:	c3                   	ret    

00003c6d <hd_cmd_out>:
    3c6d:	55                   	push   %ebp
    3c6e:	89 e5                	mov    %esp,%ebp
    3c70:	83 ec 08             	sub    $0x8,%esp
    3c73:	83 ec 04             	sub    $0x4,%esp
    3c76:	68 98 3a 00 00       	push   $0x3a98
    3c7b:	6a 00                	push   $0x0
    3c7d:	68 80 00 00 00       	push   $0x80
    3c82:	e8 e8 09 00 00       	call   466f <waitfor>
    3c87:	83 c4 10             	add    $0x10,%esp
    3c8a:	85 c0                	test   %eax,%eax
    3c8c:	75 10                	jne    3c9e <hd_cmd_out+0x31>
    3c8e:	83 ec 0c             	sub    $0xc,%esp
    3c91:	68 7b 8e 00 00       	push   $0x8e7b
    3c96:	e8 f9 f2 ff ff       	call   2f94 <panic>
    3c9b:	83 c4 10             	add    $0x10,%esp
    3c9e:	83 ec 08             	sub    $0x8,%esp
    3ca1:	6a 00                	push   $0x0
    3ca3:	68 f6 03 00 00       	push   $0x3f6
    3ca8:	e8 32 d6 ff ff       	call   12df <out_byte>
    3cad:	83 c4 10             	add    $0x10,%esp
    3cb0:	8b 45 08             	mov    0x8(%ebp),%eax
    3cb3:	0f b6 00             	movzbl (%eax),%eax
    3cb6:	0f b6 c0             	movzbl %al,%eax
    3cb9:	83 ec 08             	sub    $0x8,%esp
    3cbc:	50                   	push   %eax
    3cbd:	68 f1 01 00 00       	push   $0x1f1
    3cc2:	e8 18 d6 ff ff       	call   12df <out_byte>
    3cc7:	83 c4 10             	add    $0x10,%esp
    3cca:	8b 45 08             	mov    0x8(%ebp),%eax
    3ccd:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3cd1:	0f b6 c0             	movzbl %al,%eax
    3cd4:	83 ec 08             	sub    $0x8,%esp
    3cd7:	50                   	push   %eax
    3cd8:	68 f2 01 00 00       	push   $0x1f2
    3cdd:	e8 fd d5 ff ff       	call   12df <out_byte>
    3ce2:	83 c4 10             	add    $0x10,%esp
    3ce5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ce8:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3cec:	0f b6 c0             	movzbl %al,%eax
    3cef:	83 ec 08             	sub    $0x8,%esp
    3cf2:	50                   	push   %eax
    3cf3:	68 f3 01 00 00       	push   $0x1f3
    3cf8:	e8 e2 d5 ff ff       	call   12df <out_byte>
    3cfd:	83 c4 10             	add    $0x10,%esp
    3d00:	8b 45 08             	mov    0x8(%ebp),%eax
    3d03:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    3d07:	0f b6 c0             	movzbl %al,%eax
    3d0a:	83 ec 08             	sub    $0x8,%esp
    3d0d:	50                   	push   %eax
    3d0e:	68 f4 01 00 00       	push   $0x1f4
    3d13:	e8 c7 d5 ff ff       	call   12df <out_byte>
    3d18:	83 c4 10             	add    $0x10,%esp
    3d1b:	8b 45 08             	mov    0x8(%ebp),%eax
    3d1e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3d22:	0f b6 c0             	movzbl %al,%eax
    3d25:	83 ec 08             	sub    $0x8,%esp
    3d28:	50                   	push   %eax
    3d29:	68 f5 01 00 00       	push   $0x1f5
    3d2e:	e8 ac d5 ff ff       	call   12df <out_byte>
    3d33:	83 c4 10             	add    $0x10,%esp
    3d36:	8b 45 08             	mov    0x8(%ebp),%eax
    3d39:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    3d3d:	0f b6 c0             	movzbl %al,%eax
    3d40:	83 ec 08             	sub    $0x8,%esp
    3d43:	50                   	push   %eax
    3d44:	68 f6 01 00 00       	push   $0x1f6
    3d49:	e8 91 d5 ff ff       	call   12df <out_byte>
    3d4e:	83 c4 10             	add    $0x10,%esp
    3d51:	8b 45 08             	mov    0x8(%ebp),%eax
    3d54:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    3d58:	0f b6 c0             	movzbl %al,%eax
    3d5b:	83 ec 08             	sub    $0x8,%esp
    3d5e:	50                   	push   %eax
    3d5f:	68 f7 01 00 00       	push   $0x1f7
    3d64:	e8 76 d5 ff ff       	call   12df <out_byte>
    3d69:	83 c4 10             	add    $0x10,%esp
    3d6c:	90                   	nop
    3d6d:	c9                   	leave  
    3d6e:	c3                   	ret    

00003d6f <hd_identify>:
    3d6f:	55                   	push   %ebp
    3d70:	89 e5                	mov    %esp,%ebp
    3d72:	53                   	push   %ebx
    3d73:	83 ec 24             	sub    $0x24,%esp
    3d76:	89 e0                	mov    %esp,%eax
    3d78:	89 c3                	mov    %eax,%ebx
    3d7a:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    3d7e:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
    3d82:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    3d86:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    3d8a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    3d8e:	8b 45 08             	mov    0x8(%ebp),%eax
    3d91:	c1 e0 04             	shl    $0x4,%eax
    3d94:	83 c8 e0             	or     $0xffffffe0,%eax
    3d97:	88 45 ea             	mov    %al,-0x16(%ebp)
    3d9a:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
    3d9e:	83 ec 0c             	sub    $0xc,%esp
    3da1:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3da4:	50                   	push   %eax
    3da5:	e8 c3 fe ff ff       	call   3c6d <hd_cmd_out>
    3daa:	83 c4 10             	add    $0x10,%esp
    3dad:	e8 40 06 00 00       	call   43f2 <interrupt_wait>
    3db2:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
    3db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3dbc:	8d 50 ff             	lea    -0x1(%eax),%edx
    3dbf:	89 55 f0             	mov    %edx,-0x10(%ebp)
    3dc2:	89 c2                	mov    %eax,%edx
    3dc4:	b8 10 00 00 00       	mov    $0x10,%eax
    3dc9:	83 e8 01             	sub    $0x1,%eax
    3dcc:	01 d0                	add    %edx,%eax
    3dce:	b9 10 00 00 00       	mov    $0x10,%ecx
    3dd3:	ba 00 00 00 00       	mov    $0x0,%edx
    3dd8:	f7 f1                	div    %ecx
    3dda:	6b c0 10             	imul   $0x10,%eax,%eax
    3ddd:	29 c4                	sub    %eax,%esp
    3ddf:	89 e0                	mov    %esp,%eax
    3de1:	83 c0 00             	add    $0x0,%eax
    3de4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3de7:	83 ec 04             	sub    $0x4,%esp
    3dea:	ff 75 f4             	pushl  -0xc(%ebp)
    3ded:	6a 00                	push   $0x0
    3def:	ff 75 ec             	pushl  -0x14(%ebp)
    3df2:	e8 e2 53 00 00       	call   91d9 <Memset>
    3df7:	83 c4 10             	add    $0x10,%esp
    3dfa:	83 ec 04             	sub    $0x4,%esp
    3dfd:	ff 75 f4             	pushl  -0xc(%ebp)
    3e00:	ff 75 ec             	pushl  -0x14(%ebp)
    3e03:	68 f0 01 00 00       	push   $0x1f0
    3e08:	e8 20 54 00 00       	call   922d <read_port>
    3e0d:	83 c4 10             	add    $0x10,%esp
    3e10:	83 ec 0c             	sub    $0xc,%esp
    3e13:	ff 75 ec             	pushl  -0x14(%ebp)
    3e16:	e8 0b 00 00 00       	call   3e26 <print_hdinfo>
    3e1b:	83 c4 10             	add    $0x10,%esp
    3e1e:	89 dc                	mov    %ebx,%esp
    3e20:	90                   	nop
    3e21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3e24:	c9                   	leave  
    3e25:	c3                   	ret    

00003e26 <print_hdinfo>:
    3e26:	55                   	push   %ebp
    3e27:	89 e5                	mov    %esp,%ebp
    3e29:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3e2f:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
    3e35:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
    3e3b:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
    3e42:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
    3e49:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
    3e50:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
    3e57:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    3e5e:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
    3e64:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
    3e6a:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
    3e71:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
    3e78:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
    3e7f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    3e86:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    3e8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e94:	e9 8f 00 00 00       	jmp    3f28 <print_hdinfo+0x102>
    3e99:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3ea0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3ea3:	89 d0                	mov    %edx,%eax
    3ea5:	01 c0                	add    %eax,%eax
    3ea7:	01 d0                	add    %edx,%eax
    3ea9:	c1 e0 03             	shl    $0x3,%eax
    3eac:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3eaf:	01 c8                	add    %ecx,%eax
    3eb1:	83 e8 44             	sub    $0x44,%eax
    3eb4:	0f b7 00             	movzwl (%eax),%eax
    3eb7:	0f b7 c0             	movzwl %ax,%eax
    3eba:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3ebd:	8b 45 08             	mov    0x8(%ebp),%eax
    3ec0:	01 d0                	add    %edx,%eax
    3ec2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3ec5:	eb 30                	jmp    3ef7 <print_hdinfo+0xd1>
    3ec7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3eca:	8d 50 01             	lea    0x1(%eax),%edx
    3ecd:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3ed0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3ed3:	83 c2 01             	add    $0x1,%edx
    3ed6:	0f b6 00             	movzbl (%eax),%eax
    3ed9:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
    3edd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ee0:	8d 50 01             	lea    0x1(%eax),%edx
    3ee3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3ee6:	0f b6 00             	movzbl (%eax),%eax
    3ee9:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
    3eec:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3eef:	01 ca                	add    %ecx,%edx
    3ef1:	88 02                	mov    %al,(%edx)
    3ef3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3ef7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3efa:	89 d0                	mov    %edx,%eax
    3efc:	01 c0                	add    %eax,%eax
    3efe:	01 d0                	add    %edx,%eax
    3f00:	c1 e0 03             	shl    $0x3,%eax
    3f03:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3f06:	01 c8                	add    %ecx,%eax
    3f08:	83 e8 42             	sub    $0x42,%eax
    3f0b:	0f b7 00             	movzwl (%eax),%eax
    3f0e:	66 d1 e8             	shr    %ax
    3f11:	0f b7 c0             	movzwl %ax,%eax
    3f14:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    3f17:	7c ae                	jl     3ec7 <print_hdinfo+0xa1>
    3f19:	8d 55 81             	lea    -0x7f(%ebp),%edx
    3f1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f1f:	01 d0                	add    %edx,%eax
    3f21:	c6 00 00             	movb   $0x0,(%eax)
    3f24:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3f28:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    3f2c:	0f 8e 67 ff ff ff    	jle    3e99 <print_hdinfo+0x73>
    3f32:	8b 45 08             	mov    0x8(%ebp),%eax
    3f35:	0f b7 40 62          	movzwl 0x62(%eax),%eax
    3f39:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    3f3d:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    3f41:	66 c1 e8 08          	shr    $0x8,%ax
    3f45:	66 85 c0             	test   %ax,%ax
    3f48:	0f 95 c0             	setne  %al
    3f4b:	88 45 e9             	mov    %al,-0x17(%ebp)
    3f4e:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
    3f55:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
    3f5b:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
    3f5f:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
    3f63:	75 15                	jne    3f7a <print_hdinfo+0x154>
    3f65:	83 ec 08             	sub    $0x8,%esp
    3f68:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3f6b:	50                   	push   %eax
    3f6c:	8d 45 b0             	lea    -0x50(%ebp),%eax
    3f6f:	50                   	push   %eax
    3f70:	e8 83 52 00 00       	call   91f8 <Strcpy>
    3f75:	83 c4 10             	add    $0x10,%esp
    3f78:	eb 13                	jmp    3f8d <print_hdinfo+0x167>
    3f7a:	83 ec 08             	sub    $0x8,%esp
    3f7d:	8d 45 a9             	lea    -0x57(%ebp),%eax
    3f80:	50                   	push   %eax
    3f81:	8d 45 b0             	lea    -0x50(%ebp),%eax
    3f84:	50                   	push   %eax
    3f85:	e8 6e 52 00 00       	call   91f8 <Strcpy>
    3f8a:	83 c4 10             	add    $0x10,%esp
    3f8d:	8b 45 08             	mov    0x8(%ebp),%eax
    3f90:	83 c0 7a             	add    $0x7a,%eax
    3f93:	0f b7 00             	movzwl (%eax),%eax
    3f96:	0f b7 d0             	movzwl %ax,%edx
    3f99:	8b 45 08             	mov    0x8(%ebp),%eax
    3f9c:	83 c0 78             	add    $0x78,%eax
    3f9f:	0f b7 00             	movzwl (%eax),%eax
    3fa2:	0f b7 c0             	movzwl %ax,%eax
    3fa5:	83 c0 10             	add    $0x10,%eax
    3fa8:	89 c1                	mov    %eax,%ecx
    3faa:	d3 e2                	shl    %cl,%edx
    3fac:	89 d0                	mov    %edx,%eax
    3fae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3fb1:	90                   	nop
    3fb2:	c9                   	leave  
    3fb3:	c3                   	ret    

00003fb4 <print_dpt_entry>:
    3fb4:	55                   	push   %ebp
    3fb5:	89 e5                	mov    %esp,%ebp
    3fb7:	83 ec 08             	sub    $0x8,%esp
    3fba:	8b 45 08             	mov    0x8(%ebp),%eax
    3fbd:	8b 40 08             	mov    0x8(%eax),%eax
    3fc0:	83 ec 08             	sub    $0x8,%esp
    3fc3:	50                   	push   %eax
    3fc4:	68 85 8e 00 00       	push   $0x8e85
    3fc9:	e8 95 ec ff ff       	call   2c63 <Printf>
    3fce:	83 c4 10             	add    $0x10,%esp
    3fd1:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd4:	8b 40 0c             	mov    0xc(%eax),%eax
    3fd7:	83 ec 08             	sub    $0x8,%esp
    3fda:	50                   	push   %eax
    3fdb:	68 8d 8e 00 00       	push   $0x8e8d
    3fe0:	e8 7e ec ff ff       	call   2c63 <Printf>
    3fe5:	83 c4 10             	add    $0x10,%esp
    3fe8:	8b 45 08             	mov    0x8(%ebp),%eax
    3feb:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3fef:	0f b6 c0             	movzbl %al,%eax
    3ff2:	83 ec 08             	sub    $0x8,%esp
    3ff5:	50                   	push   %eax
    3ff6:	68 9e 8e 00 00       	push   $0x8e9e
    3ffb:	e8 63 ec ff ff       	call   2c63 <Printf>
    4000:	83 c4 10             	add    $0x10,%esp
    4003:	8b 45 08             	mov    0x8(%ebp),%eax
    4006:	0f b6 00             	movzbl (%eax),%eax
    4009:	0f b6 c0             	movzbl %al,%eax
    400c:	83 ec 08             	sub    $0x8,%esp
    400f:	50                   	push   %eax
    4010:	68 ac 8e 00 00       	push   $0x8eac
    4015:	e8 49 ec ff ff       	call   2c63 <Printf>
    401a:	83 c4 10             	add    $0x10,%esp
    401d:	90                   	nop
    401e:	c9                   	leave  
    401f:	c3                   	ret    

00004020 <get_partition_table>:
    4020:	55                   	push   %ebp
    4021:	89 e5                	mov    %esp,%ebp
    4023:	53                   	push   %ebx
    4024:	83 ec 24             	sub    $0x24,%esp
    4027:	89 e0                	mov    %esp,%eax
    4029:	89 c3                	mov    %eax,%ebx
    402b:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    402f:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
    4033:	8b 45 0c             	mov    0xc(%ebp),%eax
    4036:	88 45 e3             	mov    %al,-0x1d(%ebp)
    4039:	8b 45 0c             	mov    0xc(%ebp),%eax
    403c:	c1 f8 08             	sar    $0x8,%eax
    403f:	88 45 e4             	mov    %al,-0x1c(%ebp)
    4042:	8b 45 0c             	mov    0xc(%ebp),%eax
    4045:	c1 f8 10             	sar    $0x10,%eax
    4048:	88 45 e5             	mov    %al,-0x1b(%ebp)
    404b:	8b 45 0c             	mov    0xc(%ebp),%eax
    404e:	c1 f8 18             	sar    $0x18,%eax
    4051:	89 c2                	mov    %eax,%edx
    4053:	8b 45 08             	mov    0x8(%ebp),%eax
    4056:	c1 e0 04             	shl    $0x4,%eax
    4059:	09 d0                	or     %edx,%eax
    405b:	83 c8 e0             	or     $0xffffffe0,%eax
    405e:	88 45 e6             	mov    %al,-0x1a(%ebp)
    4061:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
    4065:	83 ec 0c             	sub    $0xc,%esp
    4068:	8d 45 e1             	lea    -0x1f(%ebp),%eax
    406b:	50                   	push   %eax
    406c:	e8 fc fb ff ff       	call   3c6d <hd_cmd_out>
    4071:	83 c4 10             	add    $0x10,%esp
    4074:	e8 79 03 00 00       	call   43f2 <interrupt_wait>
    4079:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
    4080:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4083:	8d 50 ff             	lea    -0x1(%eax),%edx
    4086:	89 55 f0             	mov    %edx,-0x10(%ebp)
    4089:	89 c2                	mov    %eax,%edx
    408b:	b8 10 00 00 00       	mov    $0x10,%eax
    4090:	83 e8 01             	sub    $0x1,%eax
    4093:	01 d0                	add    %edx,%eax
    4095:	b9 10 00 00 00       	mov    $0x10,%ecx
    409a:	ba 00 00 00 00       	mov    $0x0,%edx
    409f:	f7 f1                	div    %ecx
    40a1:	6b c0 10             	imul   $0x10,%eax,%eax
    40a4:	29 c4                	sub    %eax,%esp
    40a6:	89 e0                	mov    %esp,%eax
    40a8:	83 c0 00             	add    $0x0,%eax
    40ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
    40ae:	83 ec 04             	sub    $0x4,%esp
    40b1:	ff 75 f4             	pushl  -0xc(%ebp)
    40b4:	6a 00                	push   $0x0
    40b6:	ff 75 ec             	pushl  -0x14(%ebp)
    40b9:	e8 1b 51 00 00       	call   91d9 <Memset>
    40be:	83 c4 10             	add    $0x10,%esp
    40c1:	83 ec 04             	sub    $0x4,%esp
    40c4:	ff 75 f4             	pushl  -0xc(%ebp)
    40c7:	ff 75 ec             	pushl  -0x14(%ebp)
    40ca:	68 f0 01 00 00       	push   $0x1f0
    40cf:	e8 59 51 00 00       	call   922d <read_port>
    40d4:	83 c4 10             	add    $0x10,%esp
    40d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    40da:	05 be 01 00 00       	add    $0x1be,%eax
    40df:	83 ec 04             	sub    $0x4,%esp
    40e2:	6a 40                	push   $0x40
    40e4:	50                   	push   %eax
    40e5:	ff 75 10             	pushl  0x10(%ebp)
    40e8:	e8 be 50 00 00       	call   91ab <Memcpy>
    40ed:	83 c4 10             	add    $0x10,%esp
    40f0:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
    40f7:	89 dc                	mov    %ebx,%esp
    40f9:	90                   	nop
    40fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    40fd:	c9                   	leave  
    40fe:	c3                   	ret    

000040ff <partition>:
    40ff:	55                   	push   %ebp
    4100:	89 e5                	mov    %esp,%ebp
    4102:	81 ec 88 00 00 00    	sub    $0x88,%esp
    4108:	8b 45 0c             	mov    0xc(%ebp),%eax
    410b:	88 45 84             	mov    %al,-0x7c(%ebp)
    410e:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    4112:	7f 19                	jg     412d <partition+0x2e>
    4114:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4117:	ba 67 66 66 66       	mov    $0x66666667,%edx
    411c:	89 c8                	mov    %ecx,%eax
    411e:	f7 ea                	imul   %edx
    4120:	d1 fa                	sar    %edx
    4122:	89 c8                	mov    %ecx,%eax
    4124:	c1 f8 1f             	sar    $0x1f,%eax
    4127:	29 c2                	sub    %eax,%edx
    4129:	89 d0                	mov    %edx,%eax
    412b:	eb 11                	jmp    413e <partition+0x3f>
    412d:	8b 45 08             	mov    0x8(%ebp),%eax
    4130:	83 e8 10             	sub    $0x10,%eax
    4133:	8d 50 3f             	lea    0x3f(%eax),%edx
    4136:	85 c0                	test   %eax,%eax
    4138:	0f 48 c2             	cmovs  %edx,%eax
    413b:	c1 f8 06             	sar    $0x6,%eax
    413e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4141:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
    4145:	0f 85 cc 00 00 00    	jne    4217 <partition+0x118>
    414b:	83 ec 04             	sub    $0x4,%esp
    414e:	6a 40                	push   $0x40
    4150:	6a 00                	push   $0x0
    4152:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4155:	50                   	push   %eax
    4156:	e8 7e 50 00 00       	call   91d9 <Memset>
    415b:	83 c4 10             	add    $0x10,%esp
    415e:	83 ec 04             	sub    $0x4,%esp
    4161:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4164:	50                   	push   %eax
    4165:	6a 00                	push   $0x0
    4167:	ff 75 e8             	pushl  -0x18(%ebp)
    416a:	e8 b1 fe ff ff       	call   4020 <get_partition_table>
    416f:	83 c4 10             	add    $0x10,%esp
    4172:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4179:	e9 8a 00 00 00       	jmp    4208 <partition+0x109>
    417e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4181:	83 c0 01             	add    $0x1,%eax
    4184:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4187:	8b 45 f4             	mov    -0xc(%ebp),%eax
    418a:	c1 e0 04             	shl    $0x4,%eax
    418d:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    4190:	01 c8                	add    %ecx,%eax
    4192:	83 e8 5c             	sub    $0x5c,%eax
    4195:	8b 00                	mov    (%eax),%eax
    4197:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    419a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    419d:	c1 e1 03             	shl    $0x3,%ecx
    41a0:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    41a6:	01 ca                	add    %ecx,%edx
    41a8:	81 c2 e4 fe 00 00    	add    $0xfee4,%edx
    41ae:	89 02                	mov    %eax,(%edx)
    41b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41b3:	c1 e0 04             	shl    $0x4,%eax
    41b6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    41b9:	01 c8                	add    %ecx,%eax
    41bb:	83 e8 58             	sub    $0x58,%eax
    41be:	8b 00                	mov    (%eax),%eax
    41c0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    41c3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    41c6:	c1 e1 03             	shl    $0x3,%ecx
    41c9:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    41cf:	01 ca                	add    %ecx,%edx
    41d1:	81 c2 e8 fe 00 00    	add    $0xfee8,%edx
    41d7:	89 02                	mov    %eax,(%edx)
    41d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41dc:	c1 e0 04             	shl    $0x4,%eax
    41df:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    41e2:	01 c8                	add    %ecx,%eax
    41e4:	83 e8 60             	sub    $0x60,%eax
    41e7:	0f b6 00             	movzbl (%eax),%eax
    41ea:	3c 05                	cmp    $0x5,%al
    41ec:	75 16                	jne    4204 <partition+0x105>
    41ee:	8b 55 08             	mov    0x8(%ebp),%edx
    41f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41f4:	01 d0                	add    %edx,%eax
    41f6:	83 ec 08             	sub    $0x8,%esp
    41f9:	6a 01                	push   $0x1
    41fb:	50                   	push   %eax
    41fc:	e8 fe fe ff ff       	call   40ff <partition>
    4201:	83 c4 10             	add    $0x10,%esp
    4204:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4208:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    420c:	0f 8e 6c ff ff ff    	jle    417e <partition+0x7f>
    4212:	e9 ff 00 00 00       	jmp    4316 <partition+0x217>
    4217:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
    421b:	0f 85 f5 00 00 00    	jne    4316 <partition+0x217>
    4221:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4224:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4229:	89 c8                	mov    %ecx,%eax
    422b:	f7 ea                	imul   %edx
    422d:	d1 fa                	sar    %edx
    422f:	89 c8                	mov    %ecx,%eax
    4231:	c1 f8 1f             	sar    $0x1f,%eax
    4234:	29 c2                	sub    %eax,%edx
    4236:	89 d0                	mov    %edx,%eax
    4238:	c1 e0 02             	shl    $0x2,%eax
    423b:	01 d0                	add    %edx,%eax
    423d:	29 c1                	sub    %eax,%ecx
    423f:	89 c8                	mov    %ecx,%eax
    4241:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4244:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4247:	8b 45 e8             	mov    -0x18(%ebp),%eax
    424a:	c1 e2 03             	shl    $0x3,%edx
    424d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    4253:	01 d0                	add    %edx,%eax
    4255:	05 e4 fe 00 00       	add    $0xfee4,%eax
    425a:	8b 00                	mov    (%eax),%eax
    425c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    425f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4262:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4265:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4268:	83 e8 01             	sub    $0x1,%eax
    426b:	c1 e0 04             	shl    $0x4,%eax
    426e:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4271:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4278:	e9 8c 00 00 00       	jmp    4309 <partition+0x20a>
    427d:	83 ec 04             	sub    $0x4,%esp
    4280:	6a 40                	push   $0x40
    4282:	6a 00                	push   $0x0
    4284:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4287:	50                   	push   %eax
    4288:	e8 4c 4f 00 00       	call   91d9 <Memset>
    428d:	83 c4 10             	add    $0x10,%esp
    4290:	83 ec 04             	sub    $0x4,%esp
    4293:	8d 45 94             	lea    -0x6c(%ebp),%eax
    4296:	50                   	push   %eax
    4297:	ff 75 f0             	pushl  -0x10(%ebp)
    429a:	ff 75 e8             	pushl  -0x18(%ebp)
    429d:	e8 7e fd ff ff       	call   4020 <get_partition_table>
    42a2:	83 c4 10             	add    $0x10,%esp
    42a5:	8b 55 d8             	mov    -0x28(%ebp),%edx
    42a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42ab:	01 d0                	add    %edx,%eax
    42ad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    42b0:	8b 55 9c             	mov    -0x64(%ebp),%edx
    42b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42b6:	01 c2                	add    %eax,%edx
    42b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    42bb:	8d 48 04             	lea    0x4(%eax),%ecx
    42be:	8b 45 e8             	mov    -0x18(%ebp),%eax
    42c1:	c1 e1 03             	shl    $0x3,%ecx
    42c4:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    42ca:	01 c8                	add    %ecx,%eax
    42cc:	05 e4 fe 00 00       	add    $0xfee4,%eax
    42d1:	89 10                	mov    %edx,(%eax)
    42d3:	8b 45 a0             	mov    -0x60(%ebp),%eax
    42d6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    42d9:	8d 4a 04             	lea    0x4(%edx),%ecx
    42dc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    42df:	c1 e1 03             	shl    $0x3,%ecx
    42e2:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    42e8:	01 ca                	add    %ecx,%edx
    42ea:	81 c2 e8 fe 00 00    	add    $0xfee8,%edx
    42f0:	89 02                	mov    %eax,(%edx)
    42f2:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
    42f6:	84 c0                	test   %al,%al
    42f8:	74 1b                	je     4315 <partition+0x216>
    42fa:	8b 55 ac             	mov    -0x54(%ebp),%edx
    42fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4300:	01 d0                	add    %edx,%eax
    4302:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4305:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4309:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
    430d:	0f 8e 6a ff ff ff    	jle    427d <partition+0x17e>
    4313:	eb 01                	jmp    4316 <partition+0x217>
    4315:	90                   	nop
    4316:	90                   	nop
    4317:	c9                   	leave  
    4318:	c3                   	ret    

00004319 <hd_open>:
    4319:	55                   	push   %ebp
    431a:	89 e5                	mov    %esp,%ebp
    431c:	83 ec 18             	sub    $0x18,%esp
    431f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4326:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4329:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    432f:	05 e0 fe 00 00       	add    $0xfee0,%eax
    4334:	8b 00                	mov    (%eax),%eax
    4336:	8d 50 01             	lea    0x1(%eax),%edx
    4339:	8b 45 f4             	mov    -0xc(%ebp),%eax
    433c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    4342:	05 e0 fe 00 00       	add    $0xfee0,%eax
    4347:	89 10                	mov    %edx,(%eax)
    4349:	83 ec 0c             	sub    $0xc,%esp
    434c:	6a 00                	push   $0x0
    434e:	e8 1c fa ff ff       	call   3d6f <hd_identify>
    4353:	83 c4 10             	add    $0x10,%esp
    4356:	83 ec 08             	sub    $0x8,%esp
    4359:	6a 00                	push   $0x0
    435b:	6a 00                	push   $0x0
    435d:	e8 9d fd ff ff       	call   40ff <partition>
    4362:	83 c4 10             	add    $0x10,%esp
    4365:	90                   	nop
    4366:	c9                   	leave  
    4367:	c3                   	ret    

00004368 <get_hd_ioctl>:
    4368:	55                   	push   %ebp
    4369:	89 e5                	mov    %esp,%ebp
    436b:	83 ec 10             	sub    $0x10,%esp
    436e:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    4372:	7f 19                	jg     438d <get_hd_ioctl+0x25>
    4374:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4377:	ba 67 66 66 66       	mov    $0x66666667,%edx
    437c:	89 c8                	mov    %ecx,%eax
    437e:	f7 ea                	imul   %edx
    4380:	d1 fa                	sar    %edx
    4382:	89 c8                	mov    %ecx,%eax
    4384:	c1 f8 1f             	sar    $0x1f,%eax
    4387:	29 c2                	sub    %eax,%edx
    4389:	89 d0                	mov    %edx,%eax
    438b:	eb 11                	jmp    439e <get_hd_ioctl+0x36>
    438d:	8b 45 08             	mov    0x8(%ebp),%eax
    4390:	83 e8 10             	sub    $0x10,%eax
    4393:	8d 50 3f             	lea    0x3f(%eax),%edx
    4396:	85 c0                	test   %eax,%eax
    4398:	0f 48 c2             	cmovs  %edx,%eax
    439b:	c1 f8 06             	sar    $0x6,%eax
    439e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    43a1:	8b 55 08             	mov    0x8(%ebp),%edx
    43a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43a7:	c1 e2 03             	shl    $0x3,%edx
    43aa:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    43b0:	01 d0                	add    %edx,%eax
    43b2:	05 e8 fe 00 00       	add    $0xfee8,%eax
    43b7:	8b 00                	mov    (%eax),%eax
    43b9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    43bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43bf:	c9                   	leave  
    43c0:	c3                   	ret    

000043c1 <wait_for>:
    43c1:	55                   	push   %ebp
    43c2:	89 e5                	mov    %esp,%ebp
    43c4:	83 ec 08             	sub    $0x8,%esp
    43c7:	83 ec 04             	sub    $0x4,%esp
    43ca:	68 40 42 0f 00       	push   $0xf4240
    43cf:	6a 08                	push   $0x8
    43d1:	6a 08                	push   $0x8
    43d3:	e8 97 02 00 00       	call   466f <waitfor>
    43d8:	83 c4 10             	add    $0x10,%esp
    43db:	85 c0                	test   %eax,%eax
    43dd:	75 10                	jne    43ef <wait_for+0x2e>
    43df:	83 ec 0c             	sub    $0xc,%esp
    43e2:	68 b7 8e 00 00       	push   $0x8eb7
    43e7:	e8 a8 eb ff ff       	call   2f94 <panic>
    43ec:	83 c4 10             	add    $0x10,%esp
    43ef:	90                   	nop
    43f0:	c9                   	leave  
    43f1:	c3                   	ret    

000043f2 <interrupt_wait>:
    43f2:	55                   	push   %ebp
    43f3:	89 e5                	mov    %esp,%ebp
    43f5:	83 ec 78             	sub    $0x78,%esp
    43f8:	83 ec 04             	sub    $0x4,%esp
    43fb:	68 13 02 00 00       	push   $0x213
    4400:	8d 45 8c             	lea    -0x74(%ebp),%eax
    4403:	50                   	push   %eax
    4404:	6a 02                	push   $0x2
    4406:	e8 13 f4 ff ff       	call   381e <send_rec>
    440b:	83 c4 10             	add    $0x10,%esp
    440e:	90                   	nop
    440f:	c9                   	leave  
    4410:	c3                   	ret    

00004411 <hd_rdwt>:
    4411:	55                   	push   %ebp
    4412:	89 e5                	mov    %esp,%ebp
    4414:	83 ec 48             	sub    $0x48,%esp
    4417:	8b 45 08             	mov    0x8(%ebp),%eax
    441a:	8b 40 18             	mov    0x18(%eax),%eax
    441d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4420:	8b 45 08             	mov    0x8(%ebp),%eax
    4423:	8b 40 14             	mov    0x14(%eax),%eax
    4426:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4429:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
    442d:	7f 19                	jg     4448 <hd_rdwt+0x37>
    442f:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    4432:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4437:	89 c8                	mov    %ecx,%eax
    4439:	f7 ea                	imul   %edx
    443b:	d1 fa                	sar    %edx
    443d:	89 c8                	mov    %ecx,%eax
    443f:	c1 f8 1f             	sar    $0x1f,%eax
    4442:	29 c2                	sub    %eax,%edx
    4444:	89 d0                	mov    %edx,%eax
    4446:	eb 11                	jmp    4459 <hd_rdwt+0x48>
    4448:	8b 45 e8             	mov    -0x18(%ebp),%eax
    444b:	83 e8 10             	sub    $0x10,%eax
    444e:	8d 50 3f             	lea    0x3f(%eax),%edx
    4451:	85 c0                	test   %eax,%eax
    4453:	0f 48 c2             	cmovs  %edx,%eax
    4456:	c1 f8 06             	sar    $0x6,%eax
    4459:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    445c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    445f:	8d 50 f0             	lea    -0x10(%eax),%edx
    4462:	89 d0                	mov    %edx,%eax
    4464:	c1 f8 1f             	sar    $0x1f,%eax
    4467:	c1 e8 1a             	shr    $0x1a,%eax
    446a:	01 c2                	add    %eax,%edx
    446c:	83 e2 3f             	and    $0x3f,%edx
    446f:	29 c2                	sub    %eax,%edx
    4471:	89 d0                	mov    %edx,%eax
    4473:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4476:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4479:	c1 e8 09             	shr    $0x9,%eax
    447c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    447f:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
    4483:	7f 1a                	jg     449f <hd_rdwt+0x8e>
    4485:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4488:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    448b:	c1 e2 03             	shl    $0x3,%edx
    448e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    4494:	01 d0                	add    %edx,%eax
    4496:	05 e4 fe 00 00       	add    $0xfee4,%eax
    449b:	8b 00                	mov    (%eax),%eax
    449d:	eb 1b                	jmp    44ba <hd_rdwt+0xa9>
    449f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    44a2:	8d 50 04             	lea    0x4(%eax),%edx
    44a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44a8:	c1 e2 03             	shl    $0x3,%edx
    44ab:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    44b1:	01 d0                	add    %edx,%eax
    44b3:	05 e4 fe 00 00       	add    $0xfee4,%eax
    44b8:	8b 00                	mov    (%eax),%eax
    44ba:	8b 55 dc             	mov    -0x24(%ebp),%edx
    44bd:	01 d0                	add    %edx,%eax
    44bf:	89 45 dc             	mov    %eax,-0x24(%ebp)
    44c2:	8b 45 08             	mov    0x8(%ebp),%eax
    44c5:	8b 40 0c             	mov    0xc(%eax),%eax
    44c8:	89 45 d8             	mov    %eax,-0x28(%ebp)
    44cb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    44ce:	05 ff 01 00 00       	add    $0x1ff,%eax
    44d3:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    44d9:	85 c0                	test   %eax,%eax
    44db:	0f 48 c2             	cmovs  %edx,%eax
    44de:	c1 f8 09             	sar    $0x9,%eax
    44e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    44e4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    44e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    44ea:	8b 45 08             	mov    0x8(%ebp),%eax
    44ed:	8b 40 10             	mov    0x10(%eax),%eax
    44f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    44f3:	8b 45 08             	mov    0x8(%ebp),%eax
    44f6:	8b 00                	mov    (%eax),%eax
    44f8:	89 45 cc             	mov    %eax,-0x34(%ebp)
    44fb:	83 ec 08             	sub    $0x8,%esp
    44fe:	ff 75 d0             	pushl  -0x30(%ebp)
    4501:	ff 75 cc             	pushl  -0x34(%ebp)
    4504:	e8 12 25 00 00       	call   6a1b <v2l>
    4509:	83 c4 10             	add    $0x10,%esp
    450c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    450f:	8b 45 08             	mov    0x8(%ebp),%eax
    4512:	8b 40 68             	mov    0x68(%eax),%eax
    4515:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4518:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    451c:	74 22                	je     4540 <hd_rdwt+0x12f>
    451e:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    4522:	74 1c                	je     4540 <hd_rdwt+0x12f>
    4524:	68 9f 01 00 00       	push   $0x19f
    4529:	68 c9 8e 00 00       	push   $0x8ec9
    452e:	68 c9 8e 00 00       	push   $0x8ec9
    4533:	68 d1 8e 00 00       	push   $0x8ed1
    4538:	e8 75 ea ff ff       	call   2fb2 <assertion_failure>
    453d:	83 c4 10             	add    $0x10,%esp
    4540:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    4544:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4547:	88 45 be             	mov    %al,-0x42(%ebp)
    454a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    454d:	88 45 bf             	mov    %al,-0x41(%ebp)
    4550:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4553:	c1 f8 08             	sar    $0x8,%eax
    4556:	88 45 c0             	mov    %al,-0x40(%ebp)
    4559:	8b 45 dc             	mov    -0x24(%ebp),%eax
    455c:	c1 f8 10             	sar    $0x10,%eax
    455f:	88 45 c1             	mov    %al,-0x3f(%ebp)
    4562:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4565:	c1 f8 18             	sar    $0x18,%eax
    4568:	83 e0 0f             	and    $0xf,%eax
    456b:	83 c8 e0             	or     $0xffffffe0,%eax
    456e:	88 45 c2             	mov    %al,-0x3e(%ebp)
    4571:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    4575:	75 07                	jne    457e <hd_rdwt+0x16d>
    4577:	b8 20 00 00 00       	mov    $0x20,%eax
    457c:	eb 05                	jmp    4583 <hd_rdwt+0x172>
    457e:	b8 30 00 00 00       	mov    $0x30,%eax
    4583:	88 45 c3             	mov    %al,-0x3d(%ebp)
    4586:	83 ec 0c             	sub    $0xc,%esp
    4589:	8d 45 bd             	lea    -0x43(%ebp),%eax
    458c:	50                   	push   %eax
    458d:	e8 db f6 ff ff       	call   3c6d <hd_cmd_out>
    4592:	83 c4 10             	add    $0x10,%esp
    4595:	e9 9c 00 00 00       	jmp    4636 <hd_rdwt+0x225>
    459a:	b8 00 02 00 00       	mov    $0x200,%eax
    459f:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
    45a6:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
    45aa:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    45ad:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    45b1:	75 51                	jne    4604 <hd_rdwt+0x1f3>
    45b3:	e8 09 fe ff ff       	call   43c1 <wait_for>
    45b8:	e8 35 fe ff ff       	call   43f2 <interrupt_wait>
    45bd:	83 ec 04             	sub    $0x4,%esp
    45c0:	ff 75 c4             	pushl  -0x3c(%ebp)
    45c3:	6a 00                	push   $0x0
    45c5:	68 20 01 01 00       	push   $0x10120
    45ca:	e8 0a 4c 00 00       	call   91d9 <Memset>
    45cf:	83 c4 10             	add    $0x10,%esp
    45d2:	83 ec 04             	sub    $0x4,%esp
    45d5:	68 00 02 00 00       	push   $0x200
    45da:	68 20 01 01 00       	push   $0x10120
    45df:	68 f0 01 00 00       	push   $0x1f0
    45e4:	e8 44 4c 00 00       	call   922d <read_port>
    45e9:	83 c4 10             	add    $0x10,%esp
    45ec:	83 ec 04             	sub    $0x4,%esp
    45ef:	ff 75 c4             	pushl  -0x3c(%ebp)
    45f2:	68 20 01 01 00       	push   $0x10120
    45f7:	ff 75 f0             	pushl  -0x10(%ebp)
    45fa:	e8 ac 4b 00 00       	call   91ab <Memcpy>
    45ff:	83 c4 10             	add    $0x10,%esp
    4602:	eb 26                	jmp    462a <hd_rdwt+0x219>
    4604:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    4608:	75 20                	jne    462a <hd_rdwt+0x219>
    460a:	e8 b2 fd ff ff       	call   43c1 <wait_for>
    460f:	83 ec 04             	sub    $0x4,%esp
    4612:	ff 75 c4             	pushl  -0x3c(%ebp)
    4615:	ff 75 f0             	pushl  -0x10(%ebp)
    4618:	68 f0 01 00 00       	push   $0x1f0
    461d:	e8 1f 4c 00 00       	call   9241 <write_port>
    4622:	83 c4 10             	add    $0x10,%esp
    4625:	e8 c8 fd ff ff       	call   43f2 <interrupt_wait>
    462a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    462d:	29 45 f4             	sub    %eax,-0xc(%ebp)
    4630:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4633:	01 45 f0             	add    %eax,-0x10(%ebp)
    4636:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    463a:	0f 85 5a ff ff ff    	jne    459a <hd_rdwt+0x189>
    4640:	90                   	nop
    4641:	c9                   	leave  
    4642:	c3                   	ret    

00004643 <hd_handler>:
    4643:	55                   	push   %ebp
    4644:	89 e5                	mov    %esp,%ebp
    4646:	83 ec 18             	sub    $0x18,%esp
    4649:	83 ec 0c             	sub    $0xc,%esp
    464c:	68 f7 01 00 00       	push   $0x1f7
    4651:	e8 7d cc ff ff       	call   12d3 <in_byte>
    4656:	83 c4 10             	add    $0x10,%esp
    4659:	0f b6 c0             	movzbl %al,%eax
    465c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    465f:	83 ec 0c             	sub    $0xc,%esp
    4662:	6a 02                	push   $0x2
    4664:	e8 eb f3 ff ff       	call   3a54 <inform_int>
    4669:	83 c4 10             	add    $0x10,%esp
    466c:	90                   	nop
    466d:	c9                   	leave  
    466e:	c3                   	ret    

0000466f <waitfor>:
    466f:	55                   	push   %ebp
    4670:	89 e5                	mov    %esp,%ebp
    4672:	83 ec 18             	sub    $0x18,%esp
    4675:	e8 d3 f2 ff ff       	call   394d <get_ticks_ipc>
    467a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    467d:	eb 22                	jmp    46a1 <waitfor+0x32>
    467f:	83 ec 0c             	sub    $0xc,%esp
    4682:	68 f7 01 00 00       	push   $0x1f7
    4687:	e8 47 cc ff ff       	call   12d3 <in_byte>
    468c:	83 c4 10             	add    $0x10,%esp
    468f:	0f b6 c0             	movzbl %al,%eax
    4692:	23 45 08             	and    0x8(%ebp),%eax
    4695:	39 45 0c             	cmp    %eax,0xc(%ebp)
    4698:	75 07                	jne    46a1 <waitfor+0x32>
    469a:	b8 01 00 00 00       	mov    $0x1,%eax
    469f:	eb 1d                	jmp    46be <waitfor+0x4f>
    46a1:	e8 a7 f2 ff ff       	call   394d <get_ticks_ipc>
    46a6:	2b 45 f4             	sub    -0xc(%ebp),%eax
    46a9:	89 c2                	mov    %eax,%edx
    46ab:	89 d0                	mov    %edx,%eax
    46ad:	c1 e0 02             	shl    $0x2,%eax
    46b0:	01 d0                	add    %edx,%eax
    46b2:	01 c0                	add    %eax,%eax
    46b4:	39 45 10             	cmp    %eax,0x10(%ebp)
    46b7:	7f c6                	jg     467f <waitfor+0x10>
    46b9:	b8 00 00 00 00       	mov    $0x0,%eax
    46be:	c9                   	leave  
    46bf:	c3                   	ret    

000046c0 <print_hd_info>:
    46c0:	55                   	push   %ebp
    46c1:	89 e5                	mov    %esp,%ebp
    46c3:	83 ec 18             	sub    $0x18,%esp
    46c6:	83 ec 0c             	sub    $0xc,%esp
    46c9:	68 ef 8e 00 00       	push   $0x8eef
    46ce:	e8 90 e5 ff ff       	call   2c63 <Printf>
    46d3:	83 c4 10             	add    $0x10,%esp
    46d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    46dd:	eb 3b                	jmp    471a <print_hd_info+0x5a>
    46df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46e2:	8b 04 c5 e8 fe 00 00 	mov    0xfee8(,%eax,8),%eax
    46e9:	85 c0                	test   %eax,%eax
    46eb:	74 28                	je     4715 <print_hd_info+0x55>
    46ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46f0:	8b 14 c5 e8 fe 00 00 	mov    0xfee8(,%eax,8),%edx
    46f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46fa:	8b 04 c5 e4 fe 00 00 	mov    0xfee4(,%eax,8),%eax
    4701:	ff 75 f4             	pushl  -0xc(%ebp)
    4704:	52                   	push   %edx
    4705:	50                   	push   %eax
    4706:	68 0c 8f 00 00       	push   $0x8f0c
    470b:	e8 53 e5 ff ff       	call   2c63 <Printf>
    4710:	83 c4 10             	add    $0x10,%esp
    4713:	eb 01                	jmp    4716 <print_hd_info+0x56>
    4715:	90                   	nop
    4716:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    471a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    471e:	7e bf                	jle    46df <print_hd_info+0x1f>
    4720:	83 ec 0c             	sub    $0xc,%esp
    4723:	68 24 8f 00 00       	push   $0x8f24
    4728:	e8 36 e5 ff ff       	call   2c63 <Printf>
    472d:	83 c4 10             	add    $0x10,%esp
    4730:	83 ec 0c             	sub    $0xc,%esp
    4733:	68 3f 8f 00 00       	push   $0x8f3f
    4738:	e8 26 e5 ff ff       	call   2c63 <Printf>
    473d:	83 c4 10             	add    $0x10,%esp
    4740:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
    4747:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    474e:	eb 44                	jmp    4794 <print_hd_info+0xd4>
    4750:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4753:	83 c0 04             	add    $0x4,%eax
    4756:	8b 04 c5 e8 fe 00 00 	mov    0xfee8(,%eax,8),%eax
    475d:	85 c0                	test   %eax,%eax
    475f:	74 2e                	je     478f <print_hd_info+0xcf>
    4761:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4764:	83 c0 04             	add    $0x4,%eax
    4767:	8b 14 c5 e8 fe 00 00 	mov    0xfee8(,%eax,8),%edx
    476e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4771:	83 c0 04             	add    $0x4,%eax
    4774:	8b 04 c5 e4 fe 00 00 	mov    0xfee4(,%eax,8),%eax
    477b:	ff 75 f0             	pushl  -0x10(%ebp)
    477e:	52                   	push   %edx
    477f:	50                   	push   %eax
    4780:	68 0c 8f 00 00       	push   $0x8f0c
    4785:	e8 d9 e4 ff ff       	call   2c63 <Printf>
    478a:	83 c4 10             	add    $0x10,%esp
    478d:	eb 01                	jmp    4790 <print_hd_info+0xd0>
    478f:	90                   	nop
    4790:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4794:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    4798:	7e b6                	jle    4750 <print_hd_info+0x90>
    479a:	83 ec 0c             	sub    $0xc,%esp
    479d:	68 5c 8f 00 00       	push   $0x8f5c
    47a2:	e8 bc e4 ff ff       	call   2c63 <Printf>
    47a7:	83 c4 10             	add    $0x10,%esp
    47aa:	90                   	nop
    47ab:	c9                   	leave  
    47ac:	c3                   	ret    

000047ad <is_empty>:
    47ad:	55                   	push   %ebp
    47ae:	89 e5                	mov    %esp,%ebp
    47b0:	83 ec 10             	sub    $0x10,%esp
    47b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    47ba:	eb 1a                	jmp    47d6 <is_empty+0x29>
    47bc:	8b 55 fc             	mov    -0x4(%ebp),%edx
    47bf:	8b 45 08             	mov    0x8(%ebp),%eax
    47c2:	01 d0                	add    %edx,%eax
    47c4:	0f b6 00             	movzbl (%eax),%eax
    47c7:	84 c0                	test   %al,%al
    47c9:	74 07                	je     47d2 <is_empty+0x25>
    47cb:	b8 00 00 00 00       	mov    $0x0,%eax
    47d0:	eb 11                	jmp    47e3 <is_empty+0x36>
    47d2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    47d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    47d9:	3b 45 0c             	cmp    0xc(%ebp),%eax
    47dc:	7c de                	jl     47bc <is_empty+0xf>
    47de:	b8 01 00 00 00       	mov    $0x1,%eax
    47e3:	c9                   	leave  
    47e4:	c3                   	ret    
    47e5:	66 90                	xchg   %ax,%ax
    47e7:	66 90                	xchg   %ax,%ax
    47e9:	66 90                	xchg   %ax,%ax
    47eb:	66 90                	xchg   %ax,%ax
    47ed:	66 90                	xchg   %ax,%ax
    47ef:	90                   	nop

000047f0 <get_ticks>:
    47f0:	b8 00 00 00 00       	mov    $0x0,%eax
    47f5:	cd 90                	int    $0x90
    47f7:	c3                   	ret    

000047f8 <write2>:
    47f8:	b8 01 00 00 00       	mov    $0x1,%eax
    47fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4801:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4805:	cd 90                	int    $0x90
    4807:	c3                   	ret    

00004808 <write_debug>:
    4808:	b8 02 00 00 00       	mov    $0x2,%eax
    480d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4811:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4815:	cd 90                	int    $0x90
    4817:	c3                   	ret    

00004818 <send_msg2>:
    4818:	b8 03 00 00 00       	mov    $0x3,%eax
    481d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4821:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    4825:	cd 90                	int    $0x90
    4827:	c3                   	ret    

00004828 <send_msg>:
    4828:	55                   	push   %ebp
    4829:	89 e5                	mov    %esp,%ebp
    482b:	53                   	push   %ebx
    482c:	51                   	push   %ecx
    482d:	b8 03 00 00 00       	mov    $0x3,%eax
    4832:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    4835:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4838:	cd 90                	int    $0x90
    483a:	59                   	pop    %ecx
    483b:	5b                   	pop    %ebx
    483c:	5d                   	pop    %ebp
    483d:	c3                   	ret    

0000483e <receive_msg2>:
    483e:	b8 04 00 00 00       	mov    $0x4,%eax
    4843:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    4847:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    484b:	cd 90                	int    $0x90
    484d:	c3                   	ret    

0000484e <receive_msg>:
    484e:	55                   	push   %ebp
    484f:	89 e5                	mov    %esp,%ebp
    4851:	53                   	push   %ebx
    4852:	51                   	push   %ecx
    4853:	b8 04 00 00 00       	mov    $0x4,%eax
    4858:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    485b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    485e:	cd 90                	int    $0x90
    4860:	59                   	pop    %ecx
    4861:	5b                   	pop    %ebx
    4862:	5d                   	pop    %ebp
    4863:	c3                   	ret    

00004864 <task_fs>:
    4864:	55                   	push   %ebp
    4865:	89 e5                	mov    %esp,%ebp
    4867:	81 ec 08 01 00 00    	sub    $0x108,%esp
    486d:	e8 91 07 00 00       	call   5003 <init_fs>
    4872:	83 ec 04             	sub    $0x4,%esp
    4875:	6a 6c                	push   $0x6c
    4877:	6a 00                	push   $0x0
    4879:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    487f:	50                   	push   %eax
    4880:	e8 54 49 00 00       	call   91d9 <Memset>
    4885:	83 c4 10             	add    $0x10,%esp
    4888:	83 ec 04             	sub    $0x4,%esp
    488b:	6a 10                	push   $0x10
    488d:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    4893:	50                   	push   %eax
    4894:	6a 02                	push   $0x2
    4896:	e8 83 ef ff ff       	call   381e <send_rec>
    489b:	83 c4 10             	add    $0x10,%esp
    489e:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    48a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    48a7:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
    48ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
    48b0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
    48b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    48b9:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
    48bf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    48c2:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
    48c8:	85 c0                	test   %eax,%eax
    48ca:	75 07                	jne    48d3 <task_fs+0x6f>
    48cc:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
    48d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    48d6:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    48dc:	05 60 11 08 00       	add    $0x81160,%eax
    48e1:	a3 44 db 00 00       	mov    %eax,0xdb44
    48e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    48ed:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
    48f1:	74 1c                	je     490f <task_fs+0xab>
    48f3:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
    48f7:	7f 08                	jg     4901 <task_fs+0x9d>
    48f9:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    48fd:	74 3e                	je     493d <task_fs+0xd9>
    48ff:	eb 4b                	jmp    494c <task_fs+0xe8>
    4901:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
    4905:	74 1f                	je     4926 <task_fs+0xc2>
    4907:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
    490b:	74 19                	je     4926 <task_fs+0xc2>
    490d:	eb 3d                	jmp    494c <task_fs+0xe8>
    490f:	83 ec 0c             	sub    $0xc,%esp
    4912:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    4918:	50                   	push   %eax
    4919:	e8 14 07 00 00       	call   5032 <do_open>
    491e:	83 c4 10             	add    $0x10,%esp
    4921:	89 45 b0             	mov    %eax,-0x50(%ebp)
    4924:	eb 26                	jmp    494c <task_fs+0xe8>
    4926:	83 ec 0c             	sub    $0xc,%esp
    4929:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
    492f:	50                   	push   %eax
    4930:	e8 3b 18 00 00       	call   6170 <do_rdwt>
    4935:	83 c4 10             	add    $0x10,%esp
    4938:	89 45 f4             	mov    %eax,-0xc(%ebp)
    493b:	eb 0f                	jmp    494c <task_fs+0xe8>
    493d:	83 ec 0c             	sub    $0xc,%esp
    4940:	ff 75 e4             	pushl  -0x1c(%ebp)
    4943:	e8 2a 1d 00 00       	call   6672 <do_close>
    4948:	83 c4 10             	add    $0x10,%esp
    494b:	90                   	nop
    494c:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    4952:	83 f8 67             	cmp    $0x67,%eax
    4955:	74 36                	je     498d <task_fs+0x129>
    4957:	8b 45 e8             	mov    -0x18(%ebp),%eax
    495a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    495d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
    4961:	75 06                	jne    4969 <task_fs+0x105>
    4963:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4966:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4969:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
    4970:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4973:	89 45 c0             	mov    %eax,-0x40(%ebp)
    4976:	83 ec 04             	sub    $0x4,%esp
    4979:	ff 75 f0             	pushl  -0x10(%ebp)
    497c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    4982:	50                   	push   %eax
    4983:	6a 01                	push   $0x1
    4985:	e8 94 ee ff ff       	call   381e <send_rec>
    498a:	83 c4 10             	add    $0x10,%esp
    498d:	a1 00 d7 00 00       	mov    0xd700,%eax
    4992:	83 c0 01             	add    $0x1,%eax
    4995:	a3 00 d7 00 00       	mov    %eax,0xd700
    499a:	e9 d3 fe ff ff       	jmp    4872 <task_fs+0xe>

0000499f <rd_wt>:
    499f:	55                   	push   %ebp
    49a0:	89 e5                	mov    %esp,%ebp
    49a2:	83 ec 78             	sub    $0x78,%esp
    49a5:	83 ec 04             	sub    $0x4,%esp
    49a8:	6a 6c                	push   $0x6c
    49aa:	6a 00                	push   $0x0
    49ac:	8d 45 8c             	lea    -0x74(%ebp),%eax
    49af:	50                   	push   %eax
    49b0:	e8 24 48 00 00       	call   91d9 <Memset>
    49b5:	83 c4 10             	add    $0x10,%esp
    49b8:	8b 45 18             	mov    0x18(%ebp),%eax
    49bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    49be:	8b 45 0c             	mov    0xc(%ebp),%eax
    49c1:	89 45 a0             	mov    %eax,-0x60(%ebp)
    49c4:	8b 45 10             	mov    0x10(%ebp),%eax
    49c7:	89 45 9c             	mov    %eax,-0x64(%ebp)
    49ca:	8b 45 14             	mov    0x14(%ebp),%eax
    49cd:	89 45 98             	mov    %eax,-0x68(%ebp)
    49d0:	8b 45 08             	mov    0x8(%ebp),%eax
    49d3:	c1 e0 09             	shl    $0x9,%eax
    49d6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    49d9:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
    49dd:	74 22                	je     4a01 <rd_wt+0x62>
    49df:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
    49e3:	74 1c                	je     4a01 <rd_wt+0x62>
    49e5:	68 d1 00 00 00       	push   $0xd1
    49ea:	68 7c 8f 00 00       	push   $0x8f7c
    49ef:	68 7c 8f 00 00       	push   $0x8f7c
    49f4:	68 89 8f 00 00       	push   $0x8f89
    49f9:	e8 b4 e5 ff ff       	call   2fb2 <assertion_failure>
    49fe:	83 c4 10             	add    $0x10,%esp
    4a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a04:	83 f8 07             	cmp    $0x7,%eax
    4a07:	74 24                	je     4a2d <rd_wt+0x8e>
    4a09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a0c:	83 f8 0a             	cmp    $0xa,%eax
    4a0f:	74 1c                	je     4a2d <rd_wt+0x8e>
    4a11:	68 d2 00 00 00       	push   $0xd2
    4a16:	68 7c 8f 00 00       	push   $0x8f7c
    4a1b:	68 7c 8f 00 00       	push   $0x8f7c
    4a20:	68 a8 8f 00 00       	push   $0x8fa8
    4a25:	e8 88 e5 ff ff       	call   2fb2 <assertion_failure>
    4a2a:	83 c4 10             	add    $0x10,%esp
    4a2d:	83 ec 04             	sub    $0x4,%esp
    4a30:	6a 02                	push   $0x2
    4a32:	8d 45 8c             	lea    -0x74(%ebp),%eax
    4a35:	50                   	push   %eax
    4a36:	6a 03                	push   $0x3
    4a38:	e8 e1 ed ff ff       	call   381e <send_rec>
    4a3d:	83 c4 10             	add    $0x10,%esp
    4a40:	90                   	nop
    4a41:	c9                   	leave  
    4a42:	c3                   	ret    

00004a43 <mkfs>:
    4a43:	55                   	push   %ebp
    4a44:	89 e5                	mov    %esp,%ebp
    4a46:	57                   	push   %edi
    4a47:	81 ec d4 00 00 00    	sub    $0xd4,%esp
    4a4d:	a1 20 c0 00 00       	mov    0xc020,%eax
    4a52:	83 ec 04             	sub    $0x4,%esp
    4a55:	68 00 02 00 00       	push   $0x200
    4a5a:	6a 00                	push   $0x0
    4a5c:	50                   	push   %eax
    4a5d:	e8 77 47 00 00       	call   91d9 <Memset>
    4a62:	83 c4 10             	add    $0x10,%esp
    4a65:	a1 20 c0 00 00       	mov    0xc020,%eax
    4a6a:	83 ec 0c             	sub    $0xc,%esp
    4a6d:	6a 0a                	push   $0xa
    4a6f:	68 00 02 00 00       	push   $0x200
    4a74:	50                   	push   %eax
    4a75:	6a 20                	push   $0x20
    4a77:	6a 00                	push   $0x0
    4a79:	e8 21 ff ff ff       	call   499f <rd_wt>
    4a7e:	83 c4 20             	add    $0x20,%esp
    4a81:	a1 20 c0 00 00       	mov    0xc020,%eax
    4a86:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4a89:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a8c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    4a93:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a96:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
    4a9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4aa0:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
    4aa7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4aaa:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
    4ab1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4ab4:	8b 40 04             	mov    0x4(%eax),%eax
    4ab7:	8d 50 02             	lea    0x2(%eax),%edx
    4aba:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4abd:	8b 40 08             	mov    0x8(%eax),%eax
    4ac0:	01 c2                	add    %eax,%edx
    4ac2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4ac5:	8b 40 0c             	mov    0xc(%eax),%eax
    4ac8:	01 c2                	add    %eax,%edx
    4aca:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4acd:	89 10                	mov    %edx,(%eax)
    4acf:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    4ad6:	b8 00 02 00 00       	mov    $0x200,%eax
    4adb:	2b 45 d8             	sub    -0x28(%ebp),%eax
    4ade:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    4ae4:	8b 55 d8             	mov    -0x28(%ebp),%edx
    4ae7:	01 ca                	add    %ecx,%edx
    4ae9:	83 ec 04             	sub    $0x4,%esp
    4aec:	50                   	push   %eax
    4aed:	6a 80                	push   $0xffffff80
    4aef:	52                   	push   %edx
    4af0:	e8 e4 46 00 00       	call   91d9 <Memset>
    4af5:	83 c4 10             	add    $0x10,%esp
    4af8:	a1 20 c0 00 00       	mov    0xc020,%eax
    4afd:	83 ec 0c             	sub    $0xc,%esp
    4b00:	6a 0a                	push   $0xa
    4b02:	68 00 02 00 00       	push   $0x200
    4b07:	50                   	push   %eax
    4b08:	6a 20                	push   $0x20
    4b0a:	6a 01                	push   $0x1
    4b0c:	e8 8e fe ff ff       	call   499f <rd_wt>
    4b11:	83 c4 20             	add    $0x20,%esp
    4b14:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4b17:	8b 10                	mov    (%eax),%edx
    4b19:	89 55 98             	mov    %edx,-0x68(%ebp)
    4b1c:	8b 50 04             	mov    0x4(%eax),%edx
    4b1f:	89 55 9c             	mov    %edx,-0x64(%ebp)
    4b22:	8b 50 08             	mov    0x8(%eax),%edx
    4b25:	89 55 a0             	mov    %edx,-0x60(%ebp)
    4b28:	8b 50 0c             	mov    0xc(%eax),%edx
    4b2b:	89 55 a4             	mov    %edx,-0x5c(%ebp)
    4b2e:	8b 50 10             	mov    0x10(%eax),%edx
    4b31:	89 55 a8             	mov    %edx,-0x58(%ebp)
    4b34:	8b 50 14             	mov    0x14(%eax),%edx
    4b37:	89 55 ac             	mov    %edx,-0x54(%ebp)
    4b3a:	8b 50 18             	mov    0x18(%eax),%edx
    4b3d:	89 55 b0             	mov    %edx,-0x50(%ebp)
    4b40:	8b 50 1c             	mov    0x1c(%eax),%edx
    4b43:	89 55 b4             	mov    %edx,-0x4c(%ebp)
    4b46:	8b 40 20             	mov    0x20(%eax),%eax
    4b49:	89 45 b8             	mov    %eax,-0x48(%ebp)
    4b4c:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
    4b50:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
    4b54:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b59:	83 ec 04             	sub    $0x4,%esp
    4b5c:	6a 01                	push   $0x1
    4b5e:	52                   	push   %edx
    4b5f:	50                   	push   %eax
    4b60:	e8 74 46 00 00       	call   91d9 <Memset>
    4b65:	83 c4 10             	add    $0x10,%esp
    4b68:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b6d:	83 c0 01             	add    $0x1,%eax
    4b70:	83 ec 04             	sub    $0x4,%esp
    4b73:	68 ff 01 00 00       	push   $0x1ff
    4b78:	6a 80                	push   $0xffffff80
    4b7a:	50                   	push   %eax
    4b7b:	e8 59 46 00 00       	call   91d9 <Memset>
    4b80:	83 c4 10             	add    $0x10,%esp
    4b83:	a1 20 c0 00 00       	mov    0xc020,%eax
    4b88:	83 ec 0c             	sub    $0xc,%esp
    4b8b:	6a 0a                	push   $0xa
    4b8d:	68 00 02 00 00       	push   $0x200
    4b92:	50                   	push   %eax
    4b93:	6a 20                	push   $0x20
    4b95:	6a 02                	push   $0x2
    4b97:	e8 03 fe ff ff       	call   499f <rd_wt>
    4b9c:	83 c4 20             	add    $0x20,%esp
    4b9f:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
    4ba6:	a1 20 c0 00 00       	mov    0xc020,%eax
    4bab:	83 ec 04             	sub    $0x4,%esp
    4bae:	68 00 02 00 00       	push   $0x200
    4bb3:	6a ff                	push   $0xffffffff
    4bb5:	50                   	push   %eax
    4bb6:	e8 1e 46 00 00       	call   91d9 <Memset>
    4bbb:	83 c4 10             	add    $0x10,%esp
    4bbe:	a1 20 c0 00 00       	mov    0xc020,%eax
    4bc3:	83 ec 0c             	sub    $0xc,%esp
    4bc6:	6a 0a                	push   $0xa
    4bc8:	68 00 02 00 00       	push   $0x200
    4bcd:	50                   	push   %eax
    4bce:	6a 20                	push   $0x20
    4bd0:	ff 75 d0             	pushl  -0x30(%ebp)
    4bd3:	e8 c7 fd ff ff       	call   499f <rd_wt>
    4bd8:	83 c4 20             	add    $0x20,%esp
    4bdb:	a1 20 c0 00 00       	mov    0xc020,%eax
    4be0:	83 ec 04             	sub    $0x4,%esp
    4be3:	6a 01                	push   $0x1
    4be5:	6a 01                	push   $0x1
    4be7:	50                   	push   %eax
    4be8:	e8 ec 45 00 00       	call   91d9 <Memset>
    4bed:	83 c4 10             	add    $0x10,%esp
    4bf0:	a1 20 c0 00 00       	mov    0xc020,%eax
    4bf5:	83 c0 01             	add    $0x1,%eax
    4bf8:	83 ec 04             	sub    $0x4,%esp
    4bfb:	68 ff 01 00 00       	push   $0x1ff
    4c00:	6a 00                	push   $0x0
    4c02:	50                   	push   %eax
    4c03:	e8 d1 45 00 00       	call   91d9 <Memset>
    4c08:	83 c4 10             	add    $0x10,%esp
    4c0b:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c10:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4c13:	83 c2 01             	add    $0x1,%edx
    4c16:	83 ec 0c             	sub    $0xc,%esp
    4c19:	6a 0a                	push   $0xa
    4c1b:	68 00 02 00 00       	push   $0x200
    4c20:	50                   	push   %eax
    4c21:	6a 20                	push   $0x20
    4c23:	52                   	push   %edx
    4c24:	e8 76 fd ff ff       	call   499f <rd_wt>
    4c29:	83 c4 20             	add    $0x20,%esp
    4c2c:	8b 45 a0             	mov    -0x60(%ebp),%eax
    4c2f:	83 e8 02             	sub    $0x2,%eax
    4c32:	89 45 cc             	mov    %eax,-0x34(%ebp)
    4c35:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
    4c3c:	eb 3f                	jmp    4c7d <mkfs+0x23a>
    4c3e:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c43:	83 ec 04             	sub    $0x4,%esp
    4c46:	68 00 02 00 00       	push   $0x200
    4c4b:	6a 00                	push   $0x0
    4c4d:	50                   	push   %eax
    4c4e:	e8 86 45 00 00       	call   91d9 <Memset>
    4c53:	83 c4 10             	add    $0x10,%esp
    4c56:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c5b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    4c5e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4c61:	01 ca                	add    %ecx,%edx
    4c63:	83 ec 0c             	sub    $0xc,%esp
    4c66:	6a 0a                	push   $0xa
    4c68:	68 00 02 00 00       	push   $0x200
    4c6d:	50                   	push   %eax
    4c6e:	6a 20                	push   $0x20
    4c70:	52                   	push   %edx
    4c71:	e8 29 fd ff ff       	call   499f <rd_wt>
    4c76:	83 c4 20             	add    $0x20,%esp
    4c79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4c7d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4c80:	83 c0 01             	add    $0x1,%eax
    4c83:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4c86:	7e b6                	jle    4c3e <mkfs+0x1fb>
    4c88:	a1 20 c0 00 00       	mov    0xc020,%eax
    4c8d:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4c90:	83 c2 03             	add    $0x3,%edx
    4c93:	83 ec 0c             	sub    $0xc,%esp
    4c96:	6a 0a                	push   $0xa
    4c98:	68 00 02 00 00       	push   $0x200
    4c9d:	50                   	push   %eax
    4c9e:	6a 20                	push   $0x20
    4ca0:	52                   	push   %edx
    4ca1:	e8 f9 fc ff ff       	call   499f <rd_wt>
    4ca6:	83 c4 20             	add    $0x20,%esp
    4ca9:	a1 20 c0 00 00       	mov    0xc020,%eax
    4cae:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4cb1:	83 c2 03             	add    $0x3,%edx
    4cb4:	83 ec 0c             	sub    $0xc,%esp
    4cb7:	6a 07                	push   $0x7
    4cb9:	68 00 02 00 00       	push   $0x200
    4cbe:	50                   	push   %eax
    4cbf:	6a 20                	push   $0x20
    4cc1:	52                   	push   %edx
    4cc2:	e8 d8 fc ff ff       	call   499f <rd_wt>
    4cc7:	83 c4 20             	add    $0x20,%esp
    4cca:	a1 20 c0 00 00       	mov    0xc020,%eax
    4ccf:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4cd2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cd5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    4cdb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cde:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
    4ce5:	8b 55 98             	mov    -0x68(%ebp),%edx
    4ce8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4ceb:	89 50 08             	mov    %edx,0x8(%eax)
    4cee:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cf1:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4cf8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cfb:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
    4d02:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d05:	8b 10                	mov    (%eax),%edx
    4d07:	89 15 20 11 01 00    	mov    %edx,0x11120
    4d0d:	8b 50 04             	mov    0x4(%eax),%edx
    4d10:	89 15 24 11 01 00    	mov    %edx,0x11124
    4d16:	8b 50 08             	mov    0x8(%eax),%edx
    4d19:	89 15 28 11 01 00    	mov    %edx,0x11128
    4d1f:	8b 50 0c             	mov    0xc(%eax),%edx
    4d22:	89 15 2c 11 01 00    	mov    %edx,0x1112c
    4d28:	8b 50 10             	mov    0x10(%eax),%edx
    4d2b:	89 15 30 11 01 00    	mov    %edx,0x11130
    4d31:	8b 50 14             	mov    0x14(%eax),%edx
    4d34:	89 15 34 11 01 00    	mov    %edx,0x11134
    4d3a:	8b 50 18             	mov    0x18(%eax),%edx
    4d3d:	89 15 38 11 01 00    	mov    %edx,0x11138
    4d43:	8b 50 1c             	mov    0x1c(%eax),%edx
    4d46:	89 15 3c 11 01 00    	mov    %edx,0x1113c
    4d4c:	8b 50 20             	mov    0x20(%eax),%edx
    4d4f:	89 15 40 11 01 00    	mov    %edx,0x11140
    4d55:	8b 40 24             	mov    0x24(%eax),%eax
    4d58:	a3 44 11 01 00       	mov    %eax,0x11144
    4d5d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4d64:	eb 4c                	jmp    4db2 <mkfs+0x36f>
    4d66:	a1 20 c0 00 00       	mov    0xc020,%eax
    4d6b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4d6e:	83 c2 01             	add    $0x1,%edx
    4d71:	c1 e2 05             	shl    $0x5,%edx
    4d74:	01 d0                	add    %edx,%eax
    4d76:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4d79:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d7c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    4d82:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d85:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    4d8c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d8f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    4d96:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    4d9d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4da0:	c1 e0 08             	shl    $0x8,%eax
    4da3:	0b 45 f0             	or     -0x10(%ebp),%eax
    4da6:	89 c2                	mov    %eax,%edx
    4da8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4dab:	89 50 08             	mov    %edx,0x8(%eax)
    4dae:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4db2:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    4db6:	7e ae                	jle    4d66 <mkfs+0x323>
    4db8:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    4dbf:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
    4dc5:	b8 00 00 00 00       	mov    $0x0,%eax
    4dca:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4dcf:	89 d7                	mov    %edx,%edi
    4dd1:	f3 ab                	rep stos %eax,%es:(%edi)
    4dd3:	c7 85 70 ff ff ff ce 	movl   $0x8fce,-0x90(%ebp)
    4dda:	8f 00 00 
    4ddd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4de4:	eb 54                	jmp    4e3a <mkfs+0x3f7>
    4de6:	a1 20 c0 00 00       	mov    0xc020,%eax
    4deb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4dee:	83 c2 04             	add    $0x4,%edx
    4df1:	c1 e2 05             	shl    $0x5,%edx
    4df4:	01 d0                	add    %edx,%eax
    4df6:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4df9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4dfc:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    4e02:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e05:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
    4e0c:	8b 45 98             	mov    -0x68(%ebp),%eax
    4e0f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4e12:	83 c2 01             	add    $0x1,%edx
    4e15:	c1 e2 0b             	shl    $0xb,%edx
    4e18:	01 c2                	add    %eax,%edx
    4e1a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e1d:	89 50 08             	mov    %edx,0x8(%eax)
    4e20:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e23:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4e2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4e2d:	8d 50 05             	lea    0x5(%eax),%edx
    4e30:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e33:	89 50 10             	mov    %edx,0x10(%eax)
    4e36:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4e3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4e3d:	3b 45 c0             	cmp    -0x40(%ebp),%eax
    4e40:	7c a4                	jl     4de6 <mkfs+0x3a3>
    4e42:	a1 20 c0 00 00       	mov    0xc020,%eax
    4e47:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4e4a:	83 c2 03             	add    $0x3,%edx
    4e4d:	83 ec 0c             	sub    $0xc,%esp
    4e50:	6a 0a                	push   $0xa
    4e52:	68 00 02 00 00       	push   $0x200
    4e57:	50                   	push   %eax
    4e58:	6a 20                	push   $0x20
    4e5a:	52                   	push   %edx
    4e5b:	e8 3f fb ff ff       	call   499f <rd_wt>
    4e60:	83 c4 20             	add    $0x20,%esp
    4e63:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    4e69:	8b 45 98             	mov    -0x68(%ebp),%eax
    4e6c:	83 ec 0c             	sub    $0xc,%esp
    4e6f:	6a 07                	push   $0x7
    4e71:	68 00 02 00 00       	push   $0x200
    4e76:	52                   	push   %edx
    4e77:	6a 20                	push   $0x20
    4e79:	50                   	push   %eax
    4e7a:	e8 20 fb ff ff       	call   499f <rd_wt>
    4e7f:	83 c4 20             	add    $0x20,%esp
    4e82:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
    4e89:	00 00 00 
    4e8c:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
    4e93:	2e 00 
    4e95:	a1 20 c0 00 00       	mov    0xc020,%eax
    4e9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4e9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4ea0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    4ea6:	83 ec 0c             	sub    $0xc,%esp
    4ea9:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
    4eaf:	50                   	push   %eax
    4eb0:	e8 5d 43 00 00       	call   9212 <Strlen>
    4eb5:	83 c4 10             	add    $0x10,%esp
    4eb8:	89 c1                	mov    %eax,%ecx
    4eba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4ebd:	8d 50 04             	lea    0x4(%eax),%edx
    4ec0:	83 ec 04             	sub    $0x4,%esp
    4ec3:	51                   	push   %ecx
    4ec4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
    4eca:	50                   	push   %eax
    4ecb:	52                   	push   %edx
    4ecc:	e8 da 42 00 00       	call   91ab <Memcpy>
    4ed1:	83 c4 10             	add    $0x10,%esp
    4ed4:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
    4eda:	b8 00 00 00 00       	mov    $0x0,%eax
    4edf:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4ee4:	89 d7                	mov    %edx,%edi
    4ee6:	f3 ab                	rep stos %eax,%es:(%edi)
    4ee8:	c7 85 34 ff ff ff da 	movl   $0x8fda,-0xcc(%ebp)
    4eef:	8f 00 00 
    4ef2:	c7 85 38 ff ff ff e3 	movl   $0x8fe3,-0xc8(%ebp)
    4ef9:	8f 00 00 
    4efc:	c7 85 3c ff ff ff ec 	movl   $0x8fec,-0xc4(%ebp)
    4f03:	8f 00 00 
    4f06:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
    4f0d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4f14:	eb 49                	jmp    4f5f <mkfs+0x51c>
    4f16:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
    4f1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f1d:	8d 50 02             	lea    0x2(%eax),%edx
    4f20:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f23:	89 10                	mov    %edx,(%eax)
    4f25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f28:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
    4f2f:	83 ec 0c             	sub    $0xc,%esp
    4f32:	50                   	push   %eax
    4f33:	e8 da 42 00 00       	call   9212 <Strlen>
    4f38:	83 c4 10             	add    $0x10,%esp
    4f3b:	89 c1                	mov    %eax,%ecx
    4f3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f40:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
    4f47:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4f4a:	83 c2 04             	add    $0x4,%edx
    4f4d:	83 ec 04             	sub    $0x4,%esp
    4f50:	51                   	push   %ecx
    4f51:	50                   	push   %eax
    4f52:	52                   	push   %edx
    4f53:	e8 53 42 00 00       	call   91ab <Memcpy>
    4f58:	83 c4 10             	add    $0x10,%esp
    4f5b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4f5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4f62:	3b 45 bc             	cmp    -0x44(%ebp),%eax
    4f65:	7c af                	jl     4f16 <mkfs+0x4d3>
    4f67:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    4f6e:	eb 66                	jmp    4fd6 <mkfs+0x593>
    4f70:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4f73:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4f7a:	83 ec 0c             	sub    $0xc,%esp
    4f7d:	50                   	push   %eax
    4f7e:	e8 8f 42 00 00       	call   9212 <Strlen>
    4f83:	83 c4 10             	add    $0x10,%esp
    4f86:	85 c0                	test   %eax,%eax
    4f88:	74 47                	je     4fd1 <mkfs+0x58e>
    4f8a:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
    4f8e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4f91:	8d 50 05             	lea    0x5(%eax),%edx
    4f94:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f97:	89 10                	mov    %edx,(%eax)
    4f99:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4f9c:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4fa3:	83 ec 0c             	sub    $0xc,%esp
    4fa6:	50                   	push   %eax
    4fa7:	e8 66 42 00 00       	call   9212 <Strlen>
    4fac:	83 c4 10             	add    $0x10,%esp
    4faf:	89 c1                	mov    %eax,%ecx
    4fb1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4fb4:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
    4fbb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4fbe:	83 c2 04             	add    $0x4,%edx
    4fc1:	83 ec 04             	sub    $0x4,%esp
    4fc4:	51                   	push   %ecx
    4fc5:	50                   	push   %eax
    4fc6:	52                   	push   %edx
    4fc7:	e8 df 41 00 00       	call   91ab <Memcpy>
    4fcc:	83 c4 10             	add    $0x10,%esp
    4fcf:	eb 01                	jmp    4fd2 <mkfs+0x58f>
    4fd1:	90                   	nop
    4fd2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    4fd6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4fd9:	3b 45 c0             	cmp    -0x40(%ebp),%eax
    4fdc:	7c 92                	jl     4f70 <mkfs+0x52d>
    4fde:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    4fe4:	8b 45 98             	mov    -0x68(%ebp),%eax
    4fe7:	83 ec 0c             	sub    $0xc,%esp
    4fea:	6a 0a                	push   $0xa
    4fec:	68 00 02 00 00       	push   $0x200
    4ff1:	52                   	push   %edx
    4ff2:	6a 20                	push   $0x20
    4ff4:	50                   	push   %eax
    4ff5:	e8 a5 f9 ff ff       	call   499f <rd_wt>
    4ffa:	83 c4 20             	add    $0x20,%esp
    4ffd:	90                   	nop
    4ffe:	8b 7d fc             	mov    -0x4(%ebp),%edi
    5001:	c9                   	leave  
    5002:	c3                   	ret    

00005003 <init_fs>:
    5003:	55                   	push   %ebp
    5004:	89 e5                	mov    %esp,%ebp
    5006:	83 ec 78             	sub    $0x78,%esp
    5009:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    5010:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
    5017:	83 ec 04             	sub    $0x4,%esp
    501a:	6a 02                	push   $0x2
    501c:	8d 45 8c             	lea    -0x74(%ebp),%eax
    501f:	50                   	push   %eax
    5020:	6a 03                	push   $0x3
    5022:	e8 f7 e7 ff ff       	call   381e <send_rec>
    5027:	83 c4 10             	add    $0x10,%esp
    502a:	e8 14 fa ff ff       	call   4a43 <mkfs>
    502f:	90                   	nop
    5030:	c9                   	leave  
    5031:	c3                   	ret    

00005032 <do_open>:
    5032:	55                   	push   %ebp
    5033:	89 e5                	mov    %esp,%ebp
    5035:	56                   	push   %esi
    5036:	53                   	push   %ebx
    5037:	83 ec 60             	sub    $0x60,%esp
    503a:	83 ec 04             	sub    $0x4,%esp
    503d:	6a 0c                	push   $0xc
    503f:	6a 00                	push   $0x0
    5041:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5044:	50                   	push   %eax
    5045:	e8 8f 41 00 00       	call   91d9 <Memset>
    504a:	83 c4 10             	add    $0x10,%esp
    504d:	8b 45 08             	mov    0x8(%ebp),%eax
    5050:	8b 40 30             	mov    0x30(%eax),%eax
    5053:	89 c6                	mov    %eax,%esi
    5055:	8b 45 08             	mov    0x8(%ebp),%eax
    5058:	8b 40 34             	mov    0x34(%eax),%eax
    505b:	89 c2                	mov    %eax,%edx
    505d:	8b 45 08             	mov    0x8(%ebp),%eax
    5060:	8b 00                	mov    (%eax),%eax
    5062:	83 ec 08             	sub    $0x8,%esp
    5065:	52                   	push   %edx
    5066:	50                   	push   %eax
    5067:	e8 af 19 00 00       	call   6a1b <v2l>
    506c:	83 c4 10             	add    $0x10,%esp
    506f:	89 c3                	mov    %eax,%ebx
    5071:	83 ec 08             	sub    $0x8,%esp
    5074:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5077:	50                   	push   %eax
    5078:	6a 03                	push   $0x3
    507a:	e8 9c 19 00 00       	call   6a1b <v2l>
    507f:	83 c4 10             	add    $0x10,%esp
    5082:	83 ec 04             	sub    $0x4,%esp
    5085:	56                   	push   %esi
    5086:	53                   	push   %ebx
    5087:	50                   	push   %eax
    5088:	e8 1e 41 00 00       	call   91ab <Memcpy>
    508d:	83 c4 10             	add    $0x10,%esp
    5090:	8b 45 08             	mov    0x8(%ebp),%eax
    5093:	8b 40 30             	mov    0x30(%eax),%eax
    5096:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
    509b:	8b 45 08             	mov    0x8(%ebp),%eax
    509e:	8b 40 64             	mov    0x64(%eax),%eax
    50a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    50a4:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
    50ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    50b2:	eb 1f                	jmp    50d3 <do_open+0xa1>
    50b4:	a1 44 db 00 00       	mov    0xdb44,%eax
    50b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    50bc:	83 c2 1c             	add    $0x1c,%edx
    50bf:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    50c3:	85 c0                	test   %eax,%eax
    50c5:	75 08                	jne    50cf <do_open+0x9d>
    50c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    50ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    50cd:	eb 0a                	jmp    50d9 <do_open+0xa7>
    50cf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    50d3:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    50d7:	7e db                	jle    50b4 <do_open+0x82>
    50d9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    50dd:	75 1c                	jne    50fb <do_open+0xc9>
    50df:	68 d8 01 00 00       	push   $0x1d8
    50e4:	68 7c 8f 00 00       	push   $0x8f7c
    50e9:	68 7c 8f 00 00       	push   $0x8f7c
    50ee:	68 f5 8f 00 00       	push   $0x8ff5
    50f3:	e8 ba de ff ff       	call   2fb2 <assertion_failure>
    50f8:	83 c4 10             	add    $0x10,%esp
    50fb:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
    5102:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5109:	eb 1d                	jmp    5128 <do_open+0xf6>
    510b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    510e:	c1 e0 04             	shl    $0x4,%eax
    5111:	05 28 03 01 00       	add    $0x10328,%eax
    5116:	8b 00                	mov    (%eax),%eax
    5118:	85 c0                	test   %eax,%eax
    511a:	75 08                	jne    5124 <do_open+0xf2>
    511c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    511f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5122:	eb 0a                	jmp    512e <do_open+0xfc>
    5124:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    5128:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
    512c:	7e dd                	jle    510b <do_open+0xd9>
    512e:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
    5132:	75 1c                	jne    5150 <do_open+0x11e>
    5134:	68 e4 01 00 00       	push   $0x1e4
    5139:	68 7c 8f 00 00       	push   $0x8f7c
    513e:	68 7c 8f 00 00       	push   $0x8f7c
    5143:	68 fd 8f 00 00       	push   $0x8ffd
    5148:	e8 65 de ff ff       	call   2fb2 <assertion_failure>
    514d:	83 c4 10             	add    $0x10,%esp
    5150:	83 ec 0c             	sub    $0xc,%esp
    5153:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5156:	50                   	push   %eax
    5157:	e8 b7 00 00 00       	call   5213 <search_file>
    515c:	83 c4 10             	add    $0x10,%esp
    515f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5162:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
    5166:	75 2b                	jne    5193 <do_open+0x161>
    5168:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    516c:	7e 10                	jle    517e <do_open+0x14c>
    516e:	83 ec 0c             	sub    $0xc,%esp
    5171:	68 05 90 00 00       	push   $0x9005
    5176:	e8 19 de ff ff       	call   2f94 <panic>
    517b:	83 c4 10             	add    $0x10,%esp
    517e:	83 ec 08             	sub    $0x8,%esp
    5181:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5184:	50                   	push   %eax
    5185:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5188:	50                   	push   %eax
    5189:	e8 43 04 00 00       	call   55d1 <create_file>
    518e:	83 c4 10             	add    $0x10,%esp
    5191:	eb 22                	jmp    51b5 <do_open+0x183>
    5193:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    5197:	75 07                	jne    51a0 <do_open+0x16e>
    5199:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    519e:	eb 6c                	jmp    520c <do_open+0x1da>
    51a0:	83 ec 08             	sub    $0x8,%esp
    51a3:	ff 75 e0             	pushl  -0x20(%ebp)
    51a6:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    51a9:	50                   	push   %eax
    51aa:	e8 60 02 00 00       	call   540f <get_inode>
    51af:	83 c4 10             	add    $0x10,%esp
    51b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
    51b5:	a1 44 db 00 00       	mov    0xdb44,%eax
    51ba:	8b 55 ec             	mov    -0x14(%ebp),%edx
    51bd:	c1 e2 04             	shl    $0x4,%edx
    51c0:	8d 8a 20 03 01 00    	lea    0x10320(%edx),%ecx
    51c6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    51c9:	83 c2 1c             	add    $0x1c,%edx
    51cc:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
    51d0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    51d3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    51d6:	c1 e2 04             	shl    $0x4,%edx
    51d9:	81 c2 28 03 01 00    	add    $0x10328,%edx
    51df:	89 02                	mov    %eax,(%edx)
    51e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51e4:	c1 e0 04             	shl    $0x4,%eax
    51e7:	05 24 03 01 00       	add    $0x10324,%eax
    51ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    51f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51f5:	c1 e0 04             	shl    $0x4,%eax
    51f8:	05 20 03 01 00       	add    $0x10320,%eax
    51fd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    5203:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5206:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5209:	8b 45 d8             	mov    -0x28(%ebp),%eax
    520c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    520f:	5b                   	pop    %ebx
    5210:	5e                   	pop    %esi
    5211:	5d                   	pop    %ebp
    5212:	c3                   	ret    

00005213 <search_file>:
    5213:	55                   	push   %ebp
    5214:	89 e5                	mov    %esp,%ebp
    5216:	83 ec 68             	sub    $0x68,%esp
    5219:	83 ec 04             	sub    $0x4,%esp
    521c:	6a 0c                	push   $0xc
    521e:	6a 00                	push   $0x0
    5220:	8d 45 c0             	lea    -0x40(%ebp),%eax
    5223:	50                   	push   %eax
    5224:	e8 b0 3f 00 00       	call   91d9 <Memset>
    5229:	83 c4 10             	add    $0x10,%esp
    522c:	83 ec 04             	sub    $0x4,%esp
    522f:	6a 28                	push   $0x28
    5231:	6a 00                	push   $0x0
    5233:	8d 45 98             	lea    -0x68(%ebp),%eax
    5236:	50                   	push   %eax
    5237:	e8 9d 3f 00 00       	call   91d9 <Memset>
    523c:	83 c4 10             	add    $0x10,%esp
    523f:	83 ec 04             	sub    $0x4,%esp
    5242:	8d 45 98             	lea    -0x68(%ebp),%eax
    5245:	50                   	push   %eax
    5246:	ff 75 08             	pushl  0x8(%ebp)
    5249:	8d 45 c0             	lea    -0x40(%ebp),%eax
    524c:	50                   	push   %eax
    524d:	e8 f1 00 00 00       	call   5343 <strip_path>
    5252:	83 c4 10             	add    $0x10,%esp
    5255:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5258:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
    525c:	75 0a                	jne    5268 <search_file+0x55>
    525e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5263:	e9 d9 00 00 00       	jmp    5341 <search_file+0x12e>
    5268:	8b 45 9c             	mov    -0x64(%ebp),%eax
    526b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    526e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5271:	05 00 02 00 00       	add    $0x200,%eax
    5276:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    527c:	85 c0                	test   %eax,%eax
    527e:	0f 48 c2             	cmovs  %edx,%eax
    5281:	c1 f8 09             	sar    $0x9,%eax
    5284:	89 45 dc             	mov    %eax,-0x24(%ebp)
    5287:	8b 45 9c             	mov    -0x64(%ebp),%eax
    528a:	c1 e8 04             	shr    $0x4,%eax
    528d:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5290:	e8 2f 14 00 00       	call   66c4 <get_super_block>
    5295:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5298:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    529b:	8b 00                	mov    (%eax),%eax
    529d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    52a0:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
    52a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    52ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    52b5:	eb 79                	jmp    5330 <search_file+0x11d>
    52b7:	a1 20 c0 00 00       	mov    0xc020,%eax
    52bc:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    52bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    52c2:	01 ca                	add    %ecx,%edx
    52c4:	83 ec 0c             	sub    $0xc,%esp
    52c7:	6a 07                	push   $0x7
    52c9:	68 00 02 00 00       	push   $0x200
    52ce:	50                   	push   %eax
    52cf:	ff 75 cc             	pushl  -0x34(%ebp)
    52d2:	52                   	push   %edx
    52d3:	e8 c7 f6 ff ff       	call   499f <rd_wt>
    52d8:	83 c4 20             	add    $0x20,%esp
    52db:	a1 20 c0 00 00       	mov    0xc020,%eax
    52e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    52e3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    52ea:	eb 35                	jmp    5321 <search_file+0x10e>
    52ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    52f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52f3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    52f6:	7f 33                	jg     532b <search_file+0x118>
    52f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    52fb:	83 c0 04             	add    $0x4,%eax
    52fe:	83 ec 08             	sub    $0x8,%esp
    5301:	50                   	push   %eax
    5302:	8d 45 c0             	lea    -0x40(%ebp),%eax
    5305:	50                   	push   %eax
    5306:	e8 02 e8 ff ff       	call   3b0d <strcmp>
    530b:	83 c4 10             	add    $0x10,%esp
    530e:	85 c0                	test   %eax,%eax
    5310:	75 07                	jne    5319 <search_file+0x106>
    5312:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5315:	8b 00                	mov    (%eax),%eax
    5317:	eb 28                	jmp    5341 <search_file+0x12e>
    5319:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    531d:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
    5321:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5324:	83 f8 1f             	cmp    $0x1f,%eax
    5327:	76 c3                	jbe    52ec <search_file+0xd9>
    5329:	eb 01                	jmp    532c <search_file+0x119>
    532b:	90                   	nop
    532c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5330:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5333:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    5336:	0f 8c 7b ff ff ff    	jl     52b7 <search_file+0xa4>
    533c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5341:	c9                   	leave  
    5342:	c3                   	ret    

00005343 <strip_path>:
    5343:	55                   	push   %ebp
    5344:	89 e5                	mov    %esp,%ebp
    5346:	83 ec 10             	sub    $0x10,%esp
    5349:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    534d:	75 0a                	jne    5359 <strip_path+0x16>
    534f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5354:	e9 b4 00 00 00       	jmp    540d <strip_path+0xca>
    5359:	8b 45 08             	mov    0x8(%ebp),%eax
    535c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    535f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5362:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5365:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5368:	0f b6 00             	movzbl (%eax),%eax
    536b:	3c 2f                	cmp    $0x2f,%al
    536d:	75 2d                	jne    539c <strip_path+0x59>
    536f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    5373:	eb 27                	jmp    539c <strip_path+0x59>
    5375:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5378:	0f b6 00             	movzbl (%eax),%eax
    537b:	3c 2f                	cmp    $0x2f,%al
    537d:	75 0a                	jne    5389 <strip_path+0x46>
    537f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5384:	e9 84 00 00 00       	jmp    540d <strip_path+0xca>
    5389:	8b 45 f8             	mov    -0x8(%ebp),%eax
    538c:	0f b6 10             	movzbl (%eax),%edx
    538f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5392:	88 10                	mov    %dl,(%eax)
    5394:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    5398:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    539c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    539f:	0f b6 00             	movzbl (%eax),%eax
    53a2:	84 c0                	test   %al,%al
    53a4:	75 cf                	jne    5375 <strip_path+0x32>
    53a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    53a9:	c6 00 00             	movb   $0x0,(%eax)
    53ac:	8b 45 10             	mov    0x10(%ebp),%eax
    53af:	8b 15 20 11 01 00    	mov    0x11120,%edx
    53b5:	89 10                	mov    %edx,(%eax)
    53b7:	8b 15 24 11 01 00    	mov    0x11124,%edx
    53bd:	89 50 04             	mov    %edx,0x4(%eax)
    53c0:	8b 15 28 11 01 00    	mov    0x11128,%edx
    53c6:	89 50 08             	mov    %edx,0x8(%eax)
    53c9:	8b 15 2c 11 01 00    	mov    0x1112c,%edx
    53cf:	89 50 0c             	mov    %edx,0xc(%eax)
    53d2:	8b 15 30 11 01 00    	mov    0x11130,%edx
    53d8:	89 50 10             	mov    %edx,0x10(%eax)
    53db:	8b 15 34 11 01 00    	mov    0x11134,%edx
    53e1:	89 50 14             	mov    %edx,0x14(%eax)
    53e4:	8b 15 38 11 01 00    	mov    0x11138,%edx
    53ea:	89 50 18             	mov    %edx,0x18(%eax)
    53ed:	8b 15 3c 11 01 00    	mov    0x1113c,%edx
    53f3:	89 50 1c             	mov    %edx,0x1c(%eax)
    53f6:	8b 15 40 11 01 00    	mov    0x11140,%edx
    53fc:	89 50 20             	mov    %edx,0x20(%eax)
    53ff:	8b 15 44 11 01 00    	mov    0x11144,%edx
    5405:	89 50 24             	mov    %edx,0x24(%eax)
    5408:	b8 00 00 00 00       	mov    $0x0,%eax
    540d:	c9                   	leave  
    540e:	c3                   	ret    

0000540f <get_inode>:
    540f:	55                   	push   %ebp
    5410:	89 e5                	mov    %esp,%ebp
    5412:	56                   	push   %esi
    5413:	53                   	push   %ebx
    5414:	83 ec 20             	sub    $0x20,%esp
    5417:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    541b:	75 0a                	jne    5427 <get_inode+0x18>
    541d:	b8 00 00 00 00       	mov    $0x0,%eax
    5422:	e9 a3 01 00 00       	jmp    55ca <get_inode+0x1bb>
    5427:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    542e:	c7 45 f0 20 07 01 00 	movl   $0x10720,-0x10(%ebp)
    5435:	eb 69                	jmp    54a0 <get_inode+0x91>
    5437:	8b 45 f0             	mov    -0x10(%ebp),%eax
    543a:	8b 40 24             	mov    0x24(%eax),%eax
    543d:	85 c0                	test   %eax,%eax
    543f:	7e 53                	jle    5494 <get_inode+0x85>
    5441:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5444:	8b 40 10             	mov    0x10(%eax),%eax
    5447:	39 45 0c             	cmp    %eax,0xc(%ebp)
    544a:	75 50                	jne    549c <get_inode+0x8d>
    544c:	8b 45 08             	mov    0x8(%ebp),%eax
    544f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5452:	8b 0a                	mov    (%edx),%ecx
    5454:	89 08                	mov    %ecx,(%eax)
    5456:	8b 4a 04             	mov    0x4(%edx),%ecx
    5459:	89 48 04             	mov    %ecx,0x4(%eax)
    545c:	8b 4a 08             	mov    0x8(%edx),%ecx
    545f:	89 48 08             	mov    %ecx,0x8(%eax)
    5462:	8b 4a 0c             	mov    0xc(%edx),%ecx
    5465:	89 48 0c             	mov    %ecx,0xc(%eax)
    5468:	8b 4a 10             	mov    0x10(%edx),%ecx
    546b:	89 48 10             	mov    %ecx,0x10(%eax)
    546e:	8b 4a 14             	mov    0x14(%edx),%ecx
    5471:	89 48 14             	mov    %ecx,0x14(%eax)
    5474:	8b 4a 18             	mov    0x18(%edx),%ecx
    5477:	89 48 18             	mov    %ecx,0x18(%eax)
    547a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    547d:	89 48 1c             	mov    %ecx,0x1c(%eax)
    5480:	8b 4a 20             	mov    0x20(%edx),%ecx
    5483:	89 48 20             	mov    %ecx,0x20(%eax)
    5486:	8b 52 24             	mov    0x24(%edx),%edx
    5489:	89 50 24             	mov    %edx,0x24(%eax)
    548c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    548f:	e9 36 01 00 00       	jmp    55ca <get_inode+0x1bb>
    5494:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5497:	89 45 f4             	mov    %eax,-0xc(%ebp)
    549a:	eb 0d                	jmp    54a9 <get_inode+0x9a>
    549c:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
    54a0:	81 7d f0 20 11 01 00 	cmpl   $0x11120,-0x10(%ebp)
    54a7:	76 8e                	jbe    5437 <get_inode+0x28>
    54a9:	e8 16 12 00 00       	call   66c4 <get_super_block>
    54ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
    54b1:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    54b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    54bb:	8b 40 04             	mov    0x4(%eax),%eax
    54be:	8d 50 02             	lea    0x2(%eax),%edx
    54c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    54c4:	8b 40 08             	mov    0x8(%eax),%eax
    54c7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    54ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    54cd:	8d 48 ff             	lea    -0x1(%eax),%ecx
    54d0:	b8 00 02 00 00       	mov    $0x200,%eax
    54d5:	99                   	cltd   
    54d6:	f7 7d e8             	idivl  -0x18(%ebp)
    54d9:	89 c6                	mov    %eax,%esi
    54db:	89 c8                	mov    %ecx,%eax
    54dd:	99                   	cltd   
    54de:	f7 fe                	idiv   %esi
    54e0:	01 d8                	add    %ebx,%eax
    54e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    54e5:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
    54ec:	a1 20 c0 00 00       	mov    0xc020,%eax
    54f1:	83 ec 0c             	sub    $0xc,%esp
    54f4:	6a 07                	push   $0x7
    54f6:	68 00 02 00 00       	push   $0x200
    54fb:	50                   	push   %eax
    54fc:	ff 75 e0             	pushl  -0x20(%ebp)
    54ff:	ff 75 e4             	pushl  -0x1c(%ebp)
    5502:	e8 98 f4 ff ff       	call   499f <rd_wt>
    5507:	83 c4 20             	add    $0x20,%esp
    550a:	8b 45 0c             	mov    0xc(%ebp),%eax
    550d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5510:	b8 00 02 00 00       	mov    $0x200,%eax
    5515:	99                   	cltd   
    5516:	f7 7d e8             	idivl  -0x18(%ebp)
    5519:	89 c3                	mov    %eax,%ebx
    551b:	89 c8                	mov    %ecx,%eax
    551d:	99                   	cltd   
    551e:	f7 fb                	idiv   %ebx
    5520:	89 55 dc             	mov    %edx,-0x24(%ebp)
    5523:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5529:	8b 45 e8             	mov    -0x18(%ebp),%eax
    552c:	0f af 45 dc          	imul   -0x24(%ebp),%eax
    5530:	01 d0                	add    %edx,%eax
    5532:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5535:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5538:	8b 55 d8             	mov    -0x28(%ebp),%edx
    553b:	8b 0a                	mov    (%edx),%ecx
    553d:	89 08                	mov    %ecx,(%eax)
    553f:	8b 4a 04             	mov    0x4(%edx),%ecx
    5542:	89 48 04             	mov    %ecx,0x4(%eax)
    5545:	8b 4a 08             	mov    0x8(%edx),%ecx
    5548:	89 48 08             	mov    %ecx,0x8(%eax)
    554b:	8b 4a 0c             	mov    0xc(%edx),%ecx
    554e:	89 48 0c             	mov    %ecx,0xc(%eax)
    5551:	8b 4a 10             	mov    0x10(%edx),%ecx
    5554:	89 48 10             	mov    %ecx,0x10(%eax)
    5557:	8b 4a 14             	mov    0x14(%edx),%ecx
    555a:	89 48 14             	mov    %ecx,0x14(%eax)
    555d:	8b 4a 18             	mov    0x18(%edx),%ecx
    5560:	89 48 18             	mov    %ecx,0x18(%eax)
    5563:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    5566:	89 48 1c             	mov    %ecx,0x1c(%eax)
    5569:	8b 4a 20             	mov    0x20(%edx),%ecx
    556c:	89 48 20             	mov    %ecx,0x20(%eax)
    556f:	8b 52 24             	mov    0x24(%edx),%edx
    5572:	89 50 24             	mov    %edx,0x24(%eax)
    5575:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5578:	8b 55 0c             	mov    0xc(%ebp),%edx
    557b:	89 50 10             	mov    %edx,0x10(%eax)
    557e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5581:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5584:	89 50 20             	mov    %edx,0x20(%eax)
    5587:	8b 45 08             	mov    0x8(%ebp),%eax
    558a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    558d:	8b 0a                	mov    (%edx),%ecx
    558f:	89 08                	mov    %ecx,(%eax)
    5591:	8b 4a 04             	mov    0x4(%edx),%ecx
    5594:	89 48 04             	mov    %ecx,0x4(%eax)
    5597:	8b 4a 08             	mov    0x8(%edx),%ecx
    559a:	89 48 08             	mov    %ecx,0x8(%eax)
    559d:	8b 4a 0c             	mov    0xc(%edx),%ecx
    55a0:	89 48 0c             	mov    %ecx,0xc(%eax)
    55a3:	8b 4a 10             	mov    0x10(%edx),%ecx
    55a6:	89 48 10             	mov    %ecx,0x10(%eax)
    55a9:	8b 4a 14             	mov    0x14(%edx),%ecx
    55ac:	89 48 14             	mov    %ecx,0x14(%eax)
    55af:	8b 4a 18             	mov    0x18(%edx),%ecx
    55b2:	89 48 18             	mov    %ecx,0x18(%eax)
    55b5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    55b8:	89 48 1c             	mov    %ecx,0x1c(%eax)
    55bb:	8b 4a 20             	mov    0x20(%edx),%ecx
    55be:	89 48 20             	mov    %ecx,0x20(%eax)
    55c1:	8b 52 24             	mov    0x24(%edx),%edx
    55c4:	89 50 24             	mov    %edx,0x24(%eax)
    55c7:	8b 45 08             	mov    0x8(%ebp),%eax
    55ca:	8d 65 f8             	lea    -0x8(%ebp),%esp
    55cd:	5b                   	pop    %ebx
    55ce:	5e                   	pop    %esi
    55cf:	5d                   	pop    %ebp
    55d0:	c3                   	ret    

000055d1 <create_file>:
    55d1:	55                   	push   %ebp
    55d2:	89 e5                	mov    %esp,%ebp
    55d4:	81 ec 98 00 00 00    	sub    $0x98,%esp
    55da:	8d 45 b8             	lea    -0x48(%ebp),%eax
    55dd:	50                   	push   %eax
    55de:	ff 75 0c             	pushl  0xc(%ebp)
    55e1:	8d 45 ac             	lea    -0x54(%ebp),%eax
    55e4:	50                   	push   %eax
    55e5:	e8 59 fd ff ff       	call   5343 <strip_path>
    55ea:	83 c4 0c             	add    $0xc,%esp
    55ed:	83 f8 ff             	cmp    $0xffffffff,%eax
    55f0:	75 0a                	jne    55fc <create_file+0x2b>
    55f2:	b8 00 00 00 00       	mov    $0x0,%eax
    55f7:	e9 de 00 00 00       	jmp    56da <create_file+0x109>
    55fc:	e8 db 00 00 00       	call   56dc <alloc_imap_bit>
    5601:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5604:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5608:	75 0a                	jne    5614 <create_file+0x43>
    560a:	b8 00 00 00 00       	mov    $0x0,%eax
    560f:	e9 c6 00 00 00       	jmp    56da <create_file+0x109>
    5614:	e8 ab 10 00 00       	call   66c4 <get_super_block>
    5619:	89 45 f0             	mov    %eax,-0x10(%ebp)
    561c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    561f:	8b 40 10             	mov    0x10(%eax),%eax
    5622:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5625:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5628:	83 ec 08             	sub    $0x8,%esp
    562b:	50                   	push   %eax
    562c:	ff 75 f4             	pushl  -0xc(%ebp)
    562f:	e8 a5 01 00 00       	call   57d9 <alloc_smap_bit>
    5634:	83 c4 10             	add    $0x10,%esp
    5637:	89 45 e8             	mov    %eax,-0x18(%ebp)
    563a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    563e:	75 0a                	jne    564a <create_file+0x79>
    5640:	b8 00 00 00 00       	mov    $0x0,%eax
    5645:	e9 90 00 00 00       	jmp    56da <create_file+0x109>
    564a:	83 ec 04             	sub    $0x4,%esp
    564d:	ff 75 e8             	pushl  -0x18(%ebp)
    5650:	ff 75 f4             	pushl  -0xc(%ebp)
    5653:	8d 45 84             	lea    -0x7c(%ebp),%eax
    5656:	50                   	push   %eax
    5657:	e8 1e 03 00 00       	call   597a <new_inode>
    565c:	83 c4 10             	add    $0x10,%esp
    565f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5662:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    5666:	75 07                	jne    566f <create_file+0x9e>
    5668:	b8 00 00 00 00       	mov    $0x0,%eax
    566d:	eb 6b                	jmp    56da <create_file+0x109>
    566f:	ff 75 f4             	pushl  -0xc(%ebp)
    5672:	8d 45 ac             	lea    -0x54(%ebp),%eax
    5675:	50                   	push   %eax
    5676:	8d 45 b8             	lea    -0x48(%ebp),%eax
    5679:	50                   	push   %eax
    567a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
    5680:	50                   	push   %eax
    5681:	e8 12 04 00 00       	call   5a98 <new_dir_entry>
    5686:	83 c4 10             	add    $0x10,%esp
    5689:	89 45 e0             	mov    %eax,-0x20(%ebp)
    568c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    5690:	75 07                	jne    5699 <create_file+0xc8>
    5692:	b8 00 00 00 00       	mov    $0x0,%eax
    5697:	eb 41                	jmp    56da <create_file+0x109>
    5699:	8b 45 08             	mov    0x8(%ebp),%eax
    569c:	8b 55 84             	mov    -0x7c(%ebp),%edx
    569f:	89 10                	mov    %edx,(%eax)
    56a1:	8b 55 88             	mov    -0x78(%ebp),%edx
    56a4:	89 50 04             	mov    %edx,0x4(%eax)
    56a7:	8b 55 8c             	mov    -0x74(%ebp),%edx
    56aa:	89 50 08             	mov    %edx,0x8(%eax)
    56ad:	8b 55 90             	mov    -0x70(%ebp),%edx
    56b0:	89 50 0c             	mov    %edx,0xc(%eax)
    56b3:	8b 55 94             	mov    -0x6c(%ebp),%edx
    56b6:	89 50 10             	mov    %edx,0x10(%eax)
    56b9:	8b 55 98             	mov    -0x68(%ebp),%edx
    56bc:	89 50 14             	mov    %edx,0x14(%eax)
    56bf:	8b 55 9c             	mov    -0x64(%ebp),%edx
    56c2:	89 50 18             	mov    %edx,0x18(%eax)
    56c5:	8b 55 a0             	mov    -0x60(%ebp),%edx
    56c8:	89 50 1c             	mov    %edx,0x1c(%eax)
    56cb:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    56ce:	89 50 20             	mov    %edx,0x20(%eax)
    56d1:	8b 55 a8             	mov    -0x58(%ebp),%edx
    56d4:	89 50 24             	mov    %edx,0x24(%eax)
    56d7:	8b 45 08             	mov    0x8(%ebp),%eax
    56da:	c9                   	leave  
    56db:	c3                   	ret    

000056dc <alloc_imap_bit>:
    56dc:	55                   	push   %ebp
    56dd:	89 e5                	mov    %esp,%ebp
    56df:	53                   	push   %ebx
    56e0:	83 ec 24             	sub    $0x24,%esp
    56e3:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
    56ea:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    56f1:	a1 20 c0 00 00       	mov    0xc020,%eax
    56f6:	83 ec 0c             	sub    $0xc,%esp
    56f9:	6a 07                	push   $0x7
    56fb:	68 00 02 00 00       	push   $0x200
    5700:	50                   	push   %eax
    5701:	ff 75 e8             	pushl  -0x18(%ebp)
    5704:	ff 75 ec             	pushl  -0x14(%ebp)
    5707:	e8 93 f2 ff ff       	call   499f <rd_wt>
    570c:	83 c4 20             	add    $0x20,%esp
    570f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5716:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    571d:	e9 a5 00 00 00       	jmp    57c7 <alloc_imap_bit+0xeb>
    5722:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5729:	e9 8b 00 00 00       	jmp    57b9 <alloc_imap_bit+0xdd>
    572e:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5734:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5737:	01 d0                	add    %edx,%eax
    5739:	0f b6 00             	movzbl (%eax),%eax
    573c:	0f be d0             	movsbl %al,%edx
    573f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5742:	89 c1                	mov    %eax,%ecx
    5744:	d3 fa                	sar    %cl,%edx
    5746:	89 d0                	mov    %edx,%eax
    5748:	83 e0 01             	and    $0x1,%eax
    574b:	85 c0                	test   %eax,%eax
    574d:	74 06                	je     5755 <alloc_imap_bit+0x79>
    574f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5753:	eb 64                	jmp    57b9 <alloc_imap_bit+0xdd>
    5755:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    575b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    575e:	01 d0                	add    %edx,%eax
    5760:	0f b6 18             	movzbl (%eax),%ebx
    5763:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5766:	ba 01 00 00 00       	mov    $0x1,%edx
    576b:	89 c1                	mov    %eax,%ecx
    576d:	d3 e2                	shl    %cl,%edx
    576f:	89 d0                	mov    %edx,%eax
    5771:	89 c1                	mov    %eax,%ecx
    5773:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5779:	8b 45 f4             	mov    -0xc(%ebp),%eax
    577c:	01 d0                	add    %edx,%eax
    577e:	09 cb                	or     %ecx,%ebx
    5780:	89 da                	mov    %ebx,%edx
    5782:	88 10                	mov    %dl,(%eax)
    5784:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5787:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    578e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5791:	01 d0                	add    %edx,%eax
    5793:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    5796:	a1 20 c0 00 00       	mov    0xc020,%eax
    579b:	83 ec 0c             	sub    $0xc,%esp
    579e:	6a 0a                	push   $0xa
    57a0:	68 00 02 00 00       	push   $0x200
    57a5:	50                   	push   %eax
    57a6:	ff 75 e8             	pushl  -0x18(%ebp)
    57a9:	ff 75 ec             	pushl  -0x14(%ebp)
    57ac:	e8 ee f1 ff ff       	call   499f <rd_wt>
    57b1:	83 c4 20             	add    $0x20,%esp
    57b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    57b7:	eb 1b                	jmp    57d4 <alloc_imap_bit+0xf8>
    57b9:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    57bd:	0f 8e 6b ff ff ff    	jle    572e <alloc_imap_bit+0x52>
    57c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    57c7:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    57ce:	0f 8e 4e ff ff ff    	jle    5722 <alloc_imap_bit+0x46>
    57d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    57d7:	c9                   	leave  
    57d8:	c3                   	ret    

000057d9 <alloc_smap_bit>:
    57d9:	55                   	push   %ebp
    57da:	89 e5                	mov    %esp,%ebp
    57dc:	53                   	push   %ebx
    57dd:	83 ec 34             	sub    $0x34,%esp
    57e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    57e4:	75 1c                	jne    5802 <alloc_smap_bit+0x29>
    57e6:	68 0e 03 00 00       	push   $0x30e
    57eb:	68 7c 8f 00 00       	push   $0x8f7c
    57f0:	68 7c 8f 00 00       	push   $0x8f7c
    57f5:	68 12 90 00 00       	push   $0x9012
    57fa:	e8 b3 d7 ff ff       	call   2fb2 <assertion_failure>
    57ff:	83 c4 10             	add    $0x10,%esp
    5802:	e8 bd 0e 00 00       	call   66c4 <get_super_block>
    5807:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    580a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    580d:	8b 40 08             	mov    0x8(%eax),%eax
    5810:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5813:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5816:	8b 40 04             	mov    0x4(%eax),%eax
    5819:	83 c0 02             	add    $0x2,%eax
    581c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    581f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5826:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    582d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5834:	e9 20 01 00 00       	jmp    5959 <alloc_smap_bit+0x180>
    5839:	8b 55 dc             	mov    -0x24(%ebp),%edx
    583c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    583f:	01 d0                	add    %edx,%eax
    5841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5844:	a1 20 c0 00 00       	mov    0xc020,%eax
    5849:	83 ec 0c             	sub    $0xc,%esp
    584c:	6a 07                	push   $0x7
    584e:	68 00 02 00 00       	push   $0x200
    5853:	50                   	push   %eax
    5854:	ff 75 d8             	pushl  -0x28(%ebp)
    5857:	ff 75 d4             	pushl  -0x2c(%ebp)
    585a:	e8 40 f1 ff ff       	call   499f <rd_wt>
    585f:	83 c4 20             	add    $0x20,%esp
    5862:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5869:	e9 b0 00 00 00       	jmp    591e <alloc_smap_bit+0x145>
    586e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5875:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5879:	0f 85 8c 00 00 00    	jne    590b <alloc_smap_bit+0x132>
    587f:	eb 45                	jmp    58c6 <alloc_smap_bit+0xed>
    5881:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5887:	8b 45 ec             	mov    -0x14(%ebp),%eax
    588a:	01 d0                	add    %edx,%eax
    588c:	0f b6 00             	movzbl (%eax),%eax
    588f:	0f be d0             	movsbl %al,%edx
    5892:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5895:	89 c1                	mov    %eax,%ecx
    5897:	d3 fa                	sar    %cl,%edx
    5899:	89 d0                	mov    %edx,%eax
    589b:	83 e0 01             	and    $0x1,%eax
    589e:	85 c0                	test   %eax,%eax
    58a0:	74 06                	je     58a8 <alloc_smap_bit+0xcf>
    58a2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    58a6:	eb 1e                	jmp    58c6 <alloc_smap_bit+0xed>
    58a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    58ab:	c1 e0 09             	shl    $0x9,%eax
    58ae:	89 c2                	mov    %eax,%edx
    58b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    58b3:	01 d0                	add    %edx,%eax
    58b5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    58bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58bf:	01 d0                	add    %edx,%eax
    58c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    58c4:	eb 06                	jmp    58cc <alloc_smap_bit+0xf3>
    58c6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    58ca:	7e b5                	jle    5881 <alloc_smap_bit+0xa8>
    58cc:	eb 3d                	jmp    590b <alloc_smap_bit+0x132>
    58ce:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    58d2:	74 45                	je     5919 <alloc_smap_bit+0x140>
    58d4:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    58da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    58dd:	01 d0                	add    %edx,%eax
    58df:	0f b6 18             	movzbl (%eax),%ebx
    58e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58e5:	ba 01 00 00 00       	mov    $0x1,%edx
    58ea:	89 c1                	mov    %eax,%ecx
    58ec:	d3 e2                	shl    %cl,%edx
    58ee:	89 d0                	mov    %edx,%eax
    58f0:	89 c1                	mov    %eax,%ecx
    58f2:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    58f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    58fb:	01 d0                	add    %edx,%eax
    58fd:	09 cb                	or     %ecx,%ebx
    58ff:	89 da                	mov    %ebx,%edx
    5901:	88 10                	mov    %dl,(%eax)
    5903:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    5907:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    590b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    590f:	74 09                	je     591a <alloc_smap_bit+0x141>
    5911:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    5915:	7e b7                	jle    58ce <alloc_smap_bit+0xf5>
    5917:	eb 01                	jmp    591a <alloc_smap_bit+0x141>
    5919:	90                   	nop
    591a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    591e:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
    5925:	0f 8e 43 ff ff ff    	jle    586e <alloc_smap_bit+0x95>
    592b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    592f:	74 1e                	je     594f <alloc_smap_bit+0x176>
    5931:	a1 20 c0 00 00       	mov    0xc020,%eax
    5936:	83 ec 0c             	sub    $0xc,%esp
    5939:	6a 0a                	push   $0xa
    593b:	68 00 02 00 00       	push   $0x200
    5940:	50                   	push   %eax
    5941:	ff 75 d8             	pushl  -0x28(%ebp)
    5944:	ff 75 d4             	pushl  -0x2c(%ebp)
    5947:	e8 53 f0 ff ff       	call   499f <rd_wt>
    594c:	83 c4 20             	add    $0x20,%esp
    594f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5953:	74 12                	je     5967 <alloc_smap_bit+0x18e>
    5955:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5959:	8b 45 f0             	mov    -0x10(%ebp),%eax
    595c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    595f:	0f 8c d4 fe ff ff    	jl     5839 <alloc_smap_bit+0x60>
    5965:	eb 01                	jmp    5968 <alloc_smap_bit+0x18f>
    5967:	90                   	nop
    5968:	8b 45 f4             	mov    -0xc(%ebp),%eax
    596b:	8d 50 ff             	lea    -0x1(%eax),%edx
    596e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5971:	8b 00                	mov    (%eax),%eax
    5973:	01 d0                	add    %edx,%eax
    5975:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5978:	c9                   	leave  
    5979:	c3                   	ret    

0000597a <new_inode>:
    597a:	55                   	push   %ebp
    597b:	89 e5                	mov    %esp,%ebp
    597d:	83 ec 38             	sub    $0x38,%esp
    5980:	83 ec 08             	sub    $0x8,%esp
    5983:	ff 75 0c             	pushl  0xc(%ebp)
    5986:	8d 45 c8             	lea    -0x38(%ebp),%eax
    5989:	50                   	push   %eax
    598a:	e8 80 fa ff ff       	call   540f <get_inode>
    598f:	83 c4 10             	add    $0x10,%esp
    5992:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5995:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5999:	75 0a                	jne    59a5 <new_inode+0x2b>
    599b:	b8 00 00 00 00       	mov    $0x0,%eax
    59a0:	e9 f1 00 00 00       	jmp    5a96 <new_inode+0x11c>
    59a5:	8b 45 10             	mov    0x10(%ebp),%eax
    59a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
    59ab:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
    59b2:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    59b9:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
    59c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    59c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    59c6:	83 ec 0c             	sub    $0xc,%esp
    59c9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    59cc:	50                   	push   %eax
    59cd:	e8 0e 0b 00 00       	call   64e0 <sync_inode>
    59d2:	83 c4 10             	add    $0x10,%esp
    59d5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    59dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    59e3:	eb 1d                	jmp    5a02 <new_inode+0x88>
    59e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    59e8:	89 d0                	mov    %edx,%eax
    59ea:	c1 e0 02             	shl    $0x2,%eax
    59ed:	01 d0                	add    %edx,%eax
    59ef:	c1 e0 03             	shl    $0x3,%eax
    59f2:	05 30 07 01 00       	add    $0x10730,%eax
    59f7:	8b 00                	mov    (%eax),%eax
    59f9:	39 45 0c             	cmp    %eax,0xc(%ebp)
    59fc:	74 0c                	je     5a0a <new_inode+0x90>
    59fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5a02:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    5a06:	7e dd                	jle    59e5 <new_inode+0x6b>
    5a08:	eb 01                	jmp    5a0b <new_inode+0x91>
    5a0a:	90                   	nop
    5a0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5a0e:	89 d0                	mov    %edx,%eax
    5a10:	c1 e0 02             	shl    $0x2,%eax
    5a13:	01 d0                	add    %edx,%eax
    5a15:	c1 e0 03             	shl    $0x3,%eax
    5a18:	05 20 07 01 00       	add    $0x10720,%eax
    5a1d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    5a20:	89 10                	mov    %edx,(%eax)
    5a22:	8b 55 cc             	mov    -0x34(%ebp),%edx
    5a25:	89 50 04             	mov    %edx,0x4(%eax)
    5a28:	8b 55 d0             	mov    -0x30(%ebp),%edx
    5a2b:	89 50 08             	mov    %edx,0x8(%eax)
    5a2e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    5a31:	89 50 0c             	mov    %edx,0xc(%eax)
    5a34:	8b 55 d8             	mov    -0x28(%ebp),%edx
    5a37:	89 50 10             	mov    %edx,0x10(%eax)
    5a3a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    5a3d:	89 50 14             	mov    %edx,0x14(%eax)
    5a40:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5a43:	89 50 18             	mov    %edx,0x18(%eax)
    5a46:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    5a49:	89 50 1c             	mov    %edx,0x1c(%eax)
    5a4c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5a4f:	89 50 20             	mov    %edx,0x20(%eax)
    5a52:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a55:	89 50 24             	mov    %edx,0x24(%eax)
    5a58:	8b 45 08             	mov    0x8(%ebp),%eax
    5a5b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    5a5e:	89 10                	mov    %edx,(%eax)
    5a60:	8b 55 cc             	mov    -0x34(%ebp),%edx
    5a63:	89 50 04             	mov    %edx,0x4(%eax)
    5a66:	8b 55 d0             	mov    -0x30(%ebp),%edx
    5a69:	89 50 08             	mov    %edx,0x8(%eax)
    5a6c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    5a6f:	89 50 0c             	mov    %edx,0xc(%eax)
    5a72:	8b 55 d8             	mov    -0x28(%ebp),%edx
    5a75:	89 50 10             	mov    %edx,0x10(%eax)
    5a78:	8b 55 dc             	mov    -0x24(%ebp),%edx
    5a7b:	89 50 14             	mov    %edx,0x14(%eax)
    5a7e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5a81:	89 50 18             	mov    %edx,0x18(%eax)
    5a84:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    5a87:	89 50 1c             	mov    %edx,0x1c(%eax)
    5a8a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5a8d:	89 50 20             	mov    %edx,0x20(%eax)
    5a90:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a93:	89 50 24             	mov    %edx,0x24(%eax)
    5a96:	c9                   	leave  
    5a97:	c3                   	ret    

00005a98 <new_dir_entry>:
    5a98:	55                   	push   %ebp
    5a99:	89 e5                	mov    %esp,%ebp
    5a9b:	83 ec 48             	sub    $0x48,%esp
    5a9e:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
    5aa5:	8b 45 0c             	mov    0xc(%ebp),%eax
    5aa8:	8b 40 04             	mov    0x4(%eax),%eax
    5aab:	99                   	cltd   
    5aac:	f7 7d dc             	idivl  -0x24(%ebp)
    5aaf:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5ab2:	8b 45 0c             	mov    0xc(%ebp),%eax
    5ab5:	8b 40 0c             	mov    0xc(%eax),%eax
    5ab8:	99                   	cltd   
    5ab9:	f7 7d dc             	idivl  -0x24(%ebp)
    5abc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    5abf:	e8 00 0c 00 00       	call   66c4 <get_super_block>
    5ac4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5ac7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5aca:	8b 00                	mov    (%eax),%eax
    5acc:	89 45 cc             	mov    %eax,-0x34(%ebp)
    5acf:	8b 45 0c             	mov    0xc(%ebp),%eax
    5ad2:	8b 40 0c             	mov    0xc(%eax),%eax
    5ad5:	05 00 02 00 00       	add    $0x200,%eax
    5ada:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5ae0:	85 c0                	test   %eax,%eax
    5ae2:	0f 48 c2             	cmovs  %edx,%eax
    5ae5:	c1 f8 09             	sar    $0x9,%eax
    5ae8:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5aeb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5af2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5af9:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
    5b00:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    5b07:	eb 7d                	jmp    5b86 <new_dir_entry+0xee>
    5b09:	a1 20 c0 00 00       	mov    0xc020,%eax
    5b0e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    5b11:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5b14:	01 ca                	add    %ecx,%edx
    5b16:	83 ec 0c             	sub    $0xc,%esp
    5b19:	6a 07                	push   $0x7
    5b1b:	68 00 02 00 00       	push   $0x200
    5b20:	50                   	push   %eax
    5b21:	ff 75 c4             	pushl  -0x3c(%ebp)
    5b24:	52                   	push   %edx
    5b25:	e8 75 ee ff ff       	call   499f <rd_wt>
    5b2a:	83 c4 20             	add    $0x20,%esp
    5b2d:	a1 20 c0 00 00       	mov    0xc020,%eax
    5b32:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5b35:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5b3c:	eb 25                	jmp    5b63 <new_dir_entry+0xcb>
    5b3e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5b42:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5b45:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5b48:	7f 29                	jg     5b73 <new_dir_entry+0xdb>
    5b4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b4d:	8b 00                	mov    (%eax),%eax
    5b4f:	85 c0                	test   %eax,%eax
    5b51:	75 08                	jne    5b5b <new_dir_entry+0xc3>
    5b53:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b56:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5b59:	eb 19                	jmp    5b74 <new_dir_entry+0xdc>
    5b5b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    5b5f:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
    5b63:	b8 00 02 00 00       	mov    $0x200,%eax
    5b68:	99                   	cltd   
    5b69:	f7 7d dc             	idivl  -0x24(%ebp)
    5b6c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    5b6f:	7c cd                	jl     5b3e <new_dir_entry+0xa6>
    5b71:	eb 01                	jmp    5b74 <new_dir_entry+0xdc>
    5b73:	90                   	nop
    5b74:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5b77:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5b7a:	7f 16                	jg     5b92 <new_dir_entry+0xfa>
    5b7c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5b80:	75 10                	jne    5b92 <new_dir_entry+0xfa>
    5b82:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    5b86:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5b89:	3b 45 c8             	cmp    -0x38(%ebp),%eax
    5b8c:	0f 8c 77 ff ff ff    	jl     5b09 <new_dir_entry+0x71>
    5b92:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5b95:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    5b98:	75 0a                	jne    5ba4 <new_dir_entry+0x10c>
    5b9a:	b8 00 00 00 00       	mov    $0x0,%eax
    5b9f:	e9 fa 00 00 00       	jmp    5c9e <new_dir_entry+0x206>
    5ba4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    5bab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5baf:	75 1e                	jne    5bcf <new_dir_entry+0x137>
    5bb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5bb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5bb7:	8b 45 0c             	mov    0xc(%ebp),%eax
    5bba:	8b 50 04             	mov    0x4(%eax),%edx
    5bbd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5bc0:	01 c2                	add    %eax,%edx
    5bc2:	8b 45 0c             	mov    0xc(%ebp),%eax
    5bc5:	89 50 04             	mov    %edx,0x4(%eax)
    5bc8:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
    5bcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bd2:	8b 55 14             	mov    0x14(%ebp),%edx
    5bd5:	89 10                	mov    %edx,(%eax)
    5bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bda:	83 c0 04             	add    $0x4,%eax
    5bdd:	83 ec 08             	sub    $0x8,%esp
    5be0:	ff 75 10             	pushl  0x10(%ebp)
    5be3:	50                   	push   %eax
    5be4:	e8 0f 36 00 00       	call   91f8 <Strcpy>
    5be9:	83 c4 10             	add    $0x10,%esp
    5bec:	8b 45 08             	mov    0x8(%ebp),%eax
    5bef:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5bf2:	8b 0a                	mov    (%edx),%ecx
    5bf4:	89 08                	mov    %ecx,(%eax)
    5bf6:	8b 4a 04             	mov    0x4(%edx),%ecx
    5bf9:	89 48 04             	mov    %ecx,0x4(%eax)
    5bfc:	8b 4a 08             	mov    0x8(%edx),%ecx
    5bff:	89 48 08             	mov    %ecx,0x8(%eax)
    5c02:	8b 52 0c             	mov    0xc(%edx),%edx
    5c05:	89 50 0c             	mov    %edx,0xc(%eax)
    5c08:	a1 20 c0 00 00       	mov    0xc020,%eax
    5c0d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    5c10:	8b 55 e8             	mov    -0x18(%ebp),%edx
    5c13:	01 ca                	add    %ecx,%edx
    5c15:	83 ec 0c             	sub    $0xc,%esp
    5c18:	6a 0a                	push   $0xa
    5c1a:	68 00 02 00 00       	push   $0x200
    5c1f:	50                   	push   %eax
    5c20:	ff 75 c4             	pushl  -0x3c(%ebp)
    5c23:	52                   	push   %edx
    5c24:	e8 76 ed ff ff       	call   499f <rd_wt>
    5c29:	83 c4 20             	add    $0x20,%esp
    5c2c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    5c30:	74 69                	je     5c9b <new_dir_entry+0x203>
    5c32:	8b 45 0c             	mov    0xc(%ebp),%eax
    5c35:	8b 10                	mov    (%eax),%edx
    5c37:	89 15 20 11 01 00    	mov    %edx,0x11120
    5c3d:	8b 50 04             	mov    0x4(%eax),%edx
    5c40:	89 15 24 11 01 00    	mov    %edx,0x11124
    5c46:	8b 50 08             	mov    0x8(%eax),%edx
    5c49:	89 15 28 11 01 00    	mov    %edx,0x11128
    5c4f:	8b 50 0c             	mov    0xc(%eax),%edx
    5c52:	89 15 2c 11 01 00    	mov    %edx,0x1112c
    5c58:	8b 50 10             	mov    0x10(%eax),%edx
    5c5b:	89 15 30 11 01 00    	mov    %edx,0x11130
    5c61:	8b 50 14             	mov    0x14(%eax),%edx
    5c64:	89 15 34 11 01 00    	mov    %edx,0x11134
    5c6a:	8b 50 18             	mov    0x18(%eax),%edx
    5c6d:	89 15 38 11 01 00    	mov    %edx,0x11138
    5c73:	8b 50 1c             	mov    0x1c(%eax),%edx
    5c76:	89 15 3c 11 01 00    	mov    %edx,0x1113c
    5c7c:	8b 50 20             	mov    0x20(%eax),%edx
    5c7f:	89 15 40 11 01 00    	mov    %edx,0x11140
    5c85:	8b 40 24             	mov    0x24(%eax),%eax
    5c88:	a3 44 11 01 00       	mov    %eax,0x11144
    5c8d:	83 ec 0c             	sub    $0xc,%esp
    5c90:	ff 75 0c             	pushl  0xc(%ebp)
    5c93:	e8 48 08 00 00       	call   64e0 <sync_inode>
    5c98:	83 c4 10             	add    $0x10,%esp
    5c9b:	8b 45 08             	mov    0x8(%ebp),%eax
    5c9e:	c9                   	leave  
    5c9f:	c3                   	ret    

00005ca0 <do_unlink>:
    5ca0:	55                   	push   %ebp
    5ca1:	89 e5                	mov    %esp,%ebp
    5ca3:	53                   	push   %ebx
    5ca4:	81 ec a4 00 00 00    	sub    $0xa4,%esp
    5caa:	83 ec 08             	sub    $0x8,%esp
    5cad:	ff 75 08             	pushl  0x8(%ebp)
    5cb0:	68 27 90 00 00       	push   $0x9027
    5cb5:	e8 53 de ff ff       	call   3b0d <strcmp>
    5cba:	83 c4 10             	add    $0x10,%esp
    5cbd:	85 c0                	test   %eax,%eax
    5cbf:	75 10                	jne    5cd1 <do_unlink+0x31>
    5cc1:	83 ec 0c             	sub    $0xc,%esp
    5cc4:	68 29 90 00 00       	push   $0x9029
    5cc9:	e8 c6 d2 ff ff       	call   2f94 <panic>
    5cce:	83 c4 10             	add    $0x10,%esp
    5cd1:	83 ec 0c             	sub    $0xc,%esp
    5cd4:	ff 75 08             	pushl  0x8(%ebp)
    5cd7:	e8 37 f5 ff ff       	call   5213 <search_file>
    5cdc:	83 c4 10             	add    $0x10,%esp
    5cdf:	89 45 d0             	mov    %eax,-0x30(%ebp)
    5ce2:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    5ce6:	75 10                	jne    5cf8 <do_unlink+0x58>
    5ce8:	83 ec 0c             	sub    $0xc,%esp
    5ceb:	68 45 90 00 00       	push   $0x9045
    5cf0:	e8 9f d2 ff ff       	call   2f94 <panic>
    5cf5:	83 c4 10             	add    $0x10,%esp
    5cf8:	83 ec 08             	sub    $0x8,%esp
    5cfb:	ff 75 d0             	pushl  -0x30(%ebp)
    5cfe:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5d04:	50                   	push   %eax
    5d05:	e8 05 f7 ff ff       	call   540f <get_inode>
    5d0a:	83 c4 10             	add    $0x10,%esp
    5d0d:	89 45 cc             	mov    %eax,-0x34(%ebp)
    5d10:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    5d14:	75 10                	jne    5d26 <do_unlink+0x86>
    5d16:	83 ec 0c             	sub    $0xc,%esp
    5d19:	68 45 90 00 00       	push   $0x9045
    5d1e:	e8 71 d2 ff ff       	call   2f94 <panic>
    5d23:	83 c4 10             	add    $0x10,%esp
    5d26:	8b 45 88             	mov    -0x78(%ebp),%eax
    5d29:	85 c0                	test   %eax,%eax
    5d2b:	7e 10                	jle    5d3d <do_unlink+0x9d>
    5d2d:	83 ec 0c             	sub    $0xc,%esp
    5d30:	68 60 90 00 00       	push   $0x9060
    5d35:	e8 5a d2 ff ff       	call   2f94 <panic>
    5d3a:	83 c4 10             	add    $0x10,%esp
    5d3d:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    5d43:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5d46:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5d49:	8d 50 07             	lea    0x7(%eax),%edx
    5d4c:	85 c0                	test   %eax,%eax
    5d4e:	0f 48 c2             	cmovs  %edx,%eax
    5d51:	c1 f8 03             	sar    $0x3,%eax
    5d54:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    5d57:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5d5a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5d60:	85 c0                	test   %eax,%eax
    5d62:	0f 48 c2             	cmovs  %edx,%eax
    5d65:	c1 f8 09             	sar    $0x9,%eax
    5d68:	89 45 c0             	mov    %eax,-0x40(%ebp)
    5d6b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5d6e:	99                   	cltd   
    5d6f:	c1 ea 1d             	shr    $0x1d,%edx
    5d72:	01 d0                	add    %edx,%eax
    5d74:	83 e0 07             	and    $0x7,%eax
    5d77:	29 d0                	sub    %edx,%eax
    5d79:	89 45 bc             	mov    %eax,-0x44(%ebp)
    5d7c:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
    5d83:	a1 20 c0 00 00       	mov    0xc020,%eax
    5d88:	8b 55 c0             	mov    -0x40(%ebp),%edx
    5d8b:	83 c2 02             	add    $0x2,%edx
    5d8e:	83 ec 0c             	sub    $0xc,%esp
    5d91:	6a 07                	push   $0x7
    5d93:	68 00 02 00 00       	push   $0x200
    5d98:	50                   	push   %eax
    5d99:	ff 75 b8             	pushl  -0x48(%ebp)
    5d9c:	52                   	push   %edx
    5d9d:	e8 fd eb ff ff       	call   499f <rd_wt>
    5da2:	83 c4 20             	add    $0x20,%esp
    5da5:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5dab:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5dae:	01 d0                	add    %edx,%eax
    5db0:	0f b6 10             	movzbl (%eax),%edx
    5db3:	8b 45 bc             	mov    -0x44(%ebp),%eax
    5db6:	bb 01 00 00 00       	mov    $0x1,%ebx
    5dbb:	89 c1                	mov    %eax,%ecx
    5dbd:	d3 e3                	shl    %cl,%ebx
    5dbf:	89 d8                	mov    %ebx,%eax
    5dc1:	f7 d0                	not    %eax
    5dc3:	89 c3                	mov    %eax,%ebx
    5dc5:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5dcb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5dce:	01 c8                	add    %ecx,%eax
    5dd0:	21 da                	and    %ebx,%edx
    5dd2:	88 10                	mov    %dl,(%eax)
    5dd4:	a1 20 c0 00 00       	mov    0xc020,%eax
    5dd9:	8b 55 c0             	mov    -0x40(%ebp),%edx
    5ddc:	83 c2 02             	add    $0x2,%edx
    5ddf:	83 ec 0c             	sub    $0xc,%esp
    5de2:	6a 0a                	push   $0xa
    5de4:	68 00 02 00 00       	push   $0x200
    5de9:	50                   	push   %eax
    5dea:	ff 75 b8             	pushl  -0x48(%ebp)
    5ded:	52                   	push   %edx
    5dee:	e8 ac eb ff ff       	call   499f <rd_wt>
    5df3:	83 c4 20             	add    $0x20,%esp
    5df6:	e8 c9 08 00 00       	call   66c4 <get_super_block>
    5dfb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    5dfe:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    5e04:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    5e07:	8b 00                	mov    (%eax),%eax
    5e09:	29 c2                	sub    %eax,%edx
    5e0b:	89 d0                	mov    %edx,%eax
    5e0d:	83 c0 01             	add    $0x1,%eax
    5e10:	89 45 b0             	mov    %eax,-0x50(%ebp)
    5e13:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5e16:	8d 50 07             	lea    0x7(%eax),%edx
    5e19:	85 c0                	test   %eax,%eax
    5e1b:	0f 48 c2             	cmovs  %edx,%eax
    5e1e:	c1 f8 03             	sar    $0x3,%eax
    5e21:	89 45 ac             	mov    %eax,-0x54(%ebp)
    5e24:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5e27:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    5e2d:	85 c0                	test   %eax,%eax
    5e2f:	0f 48 c2             	cmovs  %edx,%eax
    5e32:	c1 f8 09             	sar    $0x9,%eax
    5e35:	89 45 a8             	mov    %eax,-0x58(%ebp)
    5e38:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5e3b:	99                   	cltd   
    5e3c:	c1 ea 1d             	shr    $0x1d,%edx
    5e3f:	01 d0                	add    %edx,%eax
    5e41:	83 e0 07             	and    $0x7,%eax
    5e44:	29 d0                	sub    %edx,%eax
    5e46:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    5e49:	b8 08 00 00 00       	mov    $0x8,%eax
    5e4e:	2b 45 a4             	sub    -0x5c(%ebp),%eax
    5e51:	8b 55 b0             	mov    -0x50(%ebp),%edx
    5e54:	29 c2                	sub    %eax,%edx
    5e56:	89 d0                	mov    %edx,%eax
    5e58:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5e5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e5e:	8d 50 07             	lea    0x7(%eax),%edx
    5e61:	85 c0                	test   %eax,%eax
    5e63:	0f 48 c2             	cmovs  %edx,%eax
    5e66:	c1 f8 03             	sar    $0x3,%eax
    5e69:	89 45 a0             	mov    %eax,-0x60(%ebp)
    5e6c:	a1 20 c0 00 00       	mov    0xc020,%eax
    5e71:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    5e74:	8b 52 04             	mov    0x4(%edx),%edx
    5e77:	8d 4a 02             	lea    0x2(%edx),%ecx
    5e7a:	8b 55 a8             	mov    -0x58(%ebp),%edx
    5e7d:	01 ca                	add    %ecx,%edx
    5e7f:	83 ec 0c             	sub    $0xc,%esp
    5e82:	6a 07                	push   $0x7
    5e84:	68 00 02 00 00       	push   $0x200
    5e89:	50                   	push   %eax
    5e8a:	ff 75 b8             	pushl  -0x48(%ebp)
    5e8d:	52                   	push   %edx
    5e8e:	e8 0c eb ff ff       	call   499f <rd_wt>
    5e93:	83 c4 20             	add    $0x20,%esp
    5e96:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5e9c:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5e9f:	01 d0                	add    %edx,%eax
    5ea1:	0f b6 10             	movzbl (%eax),%edx
    5ea4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5ea7:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    5eac:	89 c1                	mov    %eax,%ecx
    5eae:	d3 e3                	shl    %cl,%ebx
    5eb0:	89 d8                	mov    %ebx,%eax
    5eb2:	f7 d0                	not    %eax
    5eb4:	89 c3                	mov    %eax,%ebx
    5eb6:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5ebc:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5ebf:	01 c8                	add    %ecx,%eax
    5ec1:	21 da                	and    %ebx,%edx
    5ec3:	88 10                	mov    %dl,(%eax)
    5ec5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    5ecc:	8b 45 a8             	mov    -0x58(%ebp),%eax
    5ecf:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5ed2:	eb 6a                	jmp    5f3e <do_unlink+0x29e>
    5ed4:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    5edb:	75 4b                	jne    5f28 <do_unlink+0x288>
    5edd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5ee4:	a1 20 c0 00 00       	mov    0xc020,%eax
    5ee9:	83 ec 0c             	sub    $0xc,%esp
    5eec:	6a 0a                	push   $0xa
    5eee:	68 00 02 00 00       	push   $0x200
    5ef3:	50                   	push   %eax
    5ef4:	ff 75 b8             	pushl  -0x48(%ebp)
    5ef7:	ff 75 ec             	pushl  -0x14(%ebp)
    5efa:	e8 a0 ea ff ff       	call   499f <rd_wt>
    5eff:	83 c4 20             	add    $0x20,%esp
    5f02:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5f08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5f0b:	8d 48 01             	lea    0x1(%eax),%ecx
    5f0e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    5f11:	83 ec 0c             	sub    $0xc,%esp
    5f14:	6a 07                	push   $0x7
    5f16:	68 00 02 00 00       	push   $0x200
    5f1b:	52                   	push   %edx
    5f1c:	ff 75 b8             	pushl  -0x48(%ebp)
    5f1f:	50                   	push   %eax
    5f20:	e8 7a ea ff ff       	call   499f <rd_wt>
    5f25:	83 c4 20             	add    $0x20,%esp
    5f28:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5f2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f31:	01 d0                	add    %edx,%eax
    5f33:	c6 00 00             	movb   $0x0,(%eax)
    5f36:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5f3a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
    5f3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f41:	3b 45 a0             	cmp    -0x60(%ebp),%eax
    5f44:	7c 8e                	jl     5ed4 <do_unlink+0x234>
    5f46:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    5f4d:	75 4b                	jne    5f9a <do_unlink+0x2fa>
    5f4f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5f56:	a1 20 c0 00 00       	mov    0xc020,%eax
    5f5b:	83 ec 0c             	sub    $0xc,%esp
    5f5e:	6a 0a                	push   $0xa
    5f60:	68 00 02 00 00       	push   $0x200
    5f65:	50                   	push   %eax
    5f66:	ff 75 b8             	pushl  -0x48(%ebp)
    5f69:	ff 75 ec             	pushl  -0x14(%ebp)
    5f6c:	e8 2e ea ff ff       	call   499f <rd_wt>
    5f71:	83 c4 20             	add    $0x20,%esp
    5f74:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5f7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5f7d:	8d 48 01             	lea    0x1(%eax),%ecx
    5f80:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    5f83:	83 ec 0c             	sub    $0xc,%esp
    5f86:	6a 07                	push   $0x7
    5f88:	68 00 02 00 00       	push   $0x200
    5f8d:	52                   	push   %edx
    5f8e:	ff 75 b8             	pushl  -0x48(%ebp)
    5f91:	50                   	push   %eax
    5f92:	e8 08 ea ff ff       	call   499f <rd_wt>
    5f97:	83 c4 20             	add    $0x20,%esp
    5f9a:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    5fa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5fa3:	01 d0                	add    %edx,%eax
    5fa5:	0f b6 10             	movzbl (%eax),%edx
    5fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5fab:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    5fb0:	89 c1                	mov    %eax,%ecx
    5fb2:	d3 e3                	shl    %cl,%ebx
    5fb4:	89 d8                	mov    %ebx,%eax
    5fb6:	89 c3                	mov    %eax,%ebx
    5fb8:	8b 0d 20 c0 00 00    	mov    0xc020,%ecx
    5fbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5fc1:	01 c8                	add    %ecx,%eax
    5fc3:	21 da                	and    %ebx,%edx
    5fc5:	88 10                	mov    %dl,(%eax)
    5fc7:	a1 20 c0 00 00       	mov    0xc020,%eax
    5fcc:	83 ec 0c             	sub    $0xc,%esp
    5fcf:	6a 0a                	push   $0xa
    5fd1:	68 00 02 00 00       	push   $0x200
    5fd6:	50                   	push   %eax
    5fd7:	ff 75 b8             	pushl  -0x48(%ebp)
    5fda:	ff 75 ec             	pushl  -0x14(%ebp)
    5fdd:	e8 bd e9 ff ff       	call   499f <rd_wt>
    5fe2:	83 c4 20             	add    $0x20,%esp
    5fe5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
    5fec:	00 00 00 
    5fef:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
    5ff6:	00 00 00 
    5ff9:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
    6000:	00 00 00 
    6003:	83 ec 0c             	sub    $0xc,%esp
    6006:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    600c:	50                   	push   %eax
    600d:	e8 ce 04 00 00       	call   64e0 <sync_inode>
    6012:	83 c4 10             	add    $0x10,%esp
    6015:	83 ec 0c             	sub    $0xc,%esp
    6018:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    601e:	50                   	push   %eax
    601f:	e8 10 06 00 00       	call   6634 <put_inode>
    6024:	83 c4 10             	add    $0x10,%esp
    6027:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    602a:	8b 00                	mov    (%eax),%eax
    602c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    602f:	c7 45 98 20 11 01 00 	movl   $0x11120,-0x68(%ebp)
    6036:	8b 45 98             	mov    -0x68(%ebp),%eax
    6039:	8b 40 04             	mov    0x4(%eax),%eax
    603c:	89 45 94             	mov    %eax,-0x6c(%ebp)
    603f:	8b 45 98             	mov    -0x68(%ebp),%eax
    6042:	8b 40 0c             	mov    0xc(%eax),%eax
    6045:	89 45 90             	mov    %eax,-0x70(%ebp)
    6048:	8b 45 94             	mov    -0x6c(%ebp),%eax
    604b:	c1 e8 04             	shr    $0x4,%eax
    604e:	89 45 8c             	mov    %eax,-0x74(%ebp)
    6051:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    6058:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    605f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6066:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    606d:	e9 a3 00 00 00       	jmp    6115 <do_unlink+0x475>
    6072:	a1 20 c0 00 00       	mov    0xc020,%eax
    6077:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    607a:	8b 55 d8             	mov    -0x28(%ebp),%edx
    607d:	01 ca                	add    %ecx,%edx
    607f:	83 ec 0c             	sub    $0xc,%esp
    6082:	6a 07                	push   $0x7
    6084:	68 00 02 00 00       	push   $0x200
    6089:	50                   	push   %eax
    608a:	ff 75 b8             	pushl  -0x48(%ebp)
    608d:	52                   	push   %edx
    608e:	e8 0c e9 ff ff       	call   499f <rd_wt>
    6093:	83 c4 20             	add    $0x20,%esp
    6096:	a1 20 c0 00 00       	mov    0xc020,%eax
    609b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    609e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    60a5:	eb 51                	jmp    60f8 <do_unlink+0x458>
    60a7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    60ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    60ae:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    60b1:	7f 4f                	jg     6102 <do_unlink+0x462>
    60b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    60b6:	83 c0 10             	add    $0x10,%eax
    60b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    60bc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    60bf:	83 c0 04             	add    $0x4,%eax
    60c2:	83 ec 08             	sub    $0x8,%esp
    60c5:	ff 75 08             	pushl  0x8(%ebp)
    60c8:	50                   	push   %eax
    60c9:	e8 3f da ff ff       	call   3b0d <strcmp>
    60ce:	83 c4 10             	add    $0x10,%esp
    60d1:	85 c0                	test   %eax,%eax
    60d3:	75 1b                	jne    60f0 <do_unlink+0x450>
    60d5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    60dc:	83 ec 04             	sub    $0x4,%esp
    60df:	6a 10                	push   $0x10
    60e1:	6a 00                	push   $0x0
    60e3:	ff 75 d4             	pushl  -0x2c(%ebp)
    60e6:	e8 ee 30 00 00       	call   91d9 <Memset>
    60eb:	83 c4 10             	add    $0x10,%esp
    60ee:	eb 13                	jmp    6103 <do_unlink+0x463>
    60f0:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    60f4:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
    60f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    60fb:	3b 45 90             	cmp    -0x70(%ebp),%eax
    60fe:	7c a7                	jl     60a7 <do_unlink+0x407>
    6100:	eb 01                	jmp    6103 <do_unlink+0x463>
    6102:	90                   	nop
    6103:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6106:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    6109:	7f 16                	jg     6121 <do_unlink+0x481>
    610b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    610f:	75 10                	jne    6121 <do_unlink+0x481>
    6111:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6115:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6118:	3b 45 90             	cmp    -0x70(%ebp),%eax
    611b:	0f 8c 51 ff ff ff    	jl     6072 <do_unlink+0x3d2>
    6121:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6124:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    6127:	75 17                	jne    6140 <do_unlink+0x4a0>
    6129:	8b 45 98             	mov    -0x68(%ebp),%eax
    612c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    612f:	89 50 04             	mov    %edx,0x4(%eax)
    6132:	83 ec 0c             	sub    $0xc,%esp
    6135:	ff 75 98             	pushl  -0x68(%ebp)
    6138:	e8 a3 03 00 00       	call   64e0 <sync_inode>
    613d:	83 c4 10             	add    $0x10,%esp
    6140:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    6144:	74 24                	je     616a <do_unlink+0x4ca>
    6146:	a1 20 c0 00 00       	mov    0xc020,%eax
    614b:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    614e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6151:	01 ca                	add    %ecx,%edx
    6153:	83 ec 0c             	sub    $0xc,%esp
    6156:	6a 0a                	push   $0xa
    6158:	68 00 02 00 00       	push   $0x200
    615d:	50                   	push   %eax
    615e:	ff 75 b8             	pushl  -0x48(%ebp)
    6161:	52                   	push   %edx
    6162:	e8 38 e8 ff ff       	call   499f <rd_wt>
    6167:	83 c4 20             	add    $0x20,%esp
    616a:	90                   	nop
    616b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    616e:	c9                   	leave  
    616f:	c3                   	ret    

00006170 <do_rdwt>:
    6170:	55                   	push   %ebp
    6171:	89 e5                	mov    %esp,%ebp
    6173:	81 ec a8 00 00 00    	sub    $0xa8,%esp
    6179:	8b 45 08             	mov    0x8(%ebp),%eax
    617c:	8b 40 68             	mov    0x68(%eax),%eax
    617f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    6182:	8b 45 08             	mov    0x8(%ebp),%eax
    6185:	8b 40 50             	mov    0x50(%eax),%eax
    6188:	89 45 d8             	mov    %eax,-0x28(%ebp)
    618b:	8b 45 08             	mov    0x8(%ebp),%eax
    618e:	8b 40 5c             	mov    0x5c(%eax),%eax
    6191:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    6194:	8b 45 08             	mov    0x8(%ebp),%eax
    6197:	8b 00                	mov    (%eax),%eax
    6199:	89 45 d0             	mov    %eax,-0x30(%ebp)
    619c:	8b 45 08             	mov    0x8(%ebp),%eax
    619f:	8b 40 10             	mov    0x10(%eax),%eax
    61a2:	89 45 cc             	mov    %eax,-0x34(%ebp)
    61a5:	8b 45 08             	mov    0x8(%ebp),%eax
    61a8:	8b 40 40             	mov    0x40(%eax),%eax
    61ab:	89 45 c8             	mov    %eax,-0x38(%ebp)
    61ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
    61b1:	6b d0 68             	imul   $0x68,%eax,%edx
    61b4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    61b7:	01 d0                	add    %edx,%eax
    61b9:	83 c0 1c             	add    $0x1c,%eax
    61bc:	8b 04 85 6c 11 08 00 	mov    0x8116c(,%eax,4),%eax
    61c3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    61c6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    61c9:	8b 40 08             	mov    0x8(%eax),%eax
    61cc:	89 45 c0             	mov    %eax,-0x40(%ebp)
    61cf:	8b 45 08             	mov    0x8(%ebp),%eax
    61d2:	8b 00                	mov    (%eax),%eax
    61d4:	89 45 bc             	mov    %eax,-0x44(%ebp)
    61d7:	83 ec 08             	sub    $0x8,%esp
    61da:	ff 75 c0             	pushl  -0x40(%ebp)
    61dd:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    61e3:	50                   	push   %eax
    61e4:	e8 26 f2 ff ff       	call   540f <get_inode>
    61e9:	83 c4 10             	add    $0x10,%esp
    61ec:	89 45 b8             	mov    %eax,-0x48(%ebp)
    61ef:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
    61f3:	75 10                	jne    6205 <do_rdwt+0x95>
    61f5:	83 ec 0c             	sub    $0xc,%esp
    61f8:	68 98 90 00 00       	push   $0x9098
    61fd:	e8 92 cd ff ff       	call   2f94 <panic>
    6202:	83 c4 10             	add    $0x10,%esp
    6205:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    620b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    620e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    6211:	8b 40 04             	mov    0x4(%eax),%eax
    6214:	89 45 b0             	mov    %eax,-0x50(%ebp)
    6217:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    621b:	74 22                	je     623f <do_rdwt+0xcf>
    621d:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    6221:	74 1c                	je     623f <do_rdwt+0xcf>
    6223:	68 ba 04 00 00       	push   $0x4ba
    6228:	68 7c 8f 00 00       	push   $0x8f7c
    622d:	68 7c 8f 00 00       	push   $0x8f7c
    6232:	68 a8 90 00 00       	push   $0x90a8
    6237:	e8 76 cd ff ff       	call   2fb2 <assertion_failure>
    623c:	83 c4 10             	add    $0x10,%esp
    623f:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
    6245:	83 f8 01             	cmp    $0x1,%eax
    6248:	75 4a                	jne    6294 <do_rdwt+0x124>
    624a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    624e:	75 09                	jne    6259 <do_rdwt+0xe9>
    6250:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
    6257:	eb 0d                	jmp    6266 <do_rdwt+0xf6>
    6259:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    625d:	75 07                	jne    6266 <do_rdwt+0xf6>
    625f:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
    6266:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6269:	8b 45 08             	mov    0x8(%ebp),%eax
    626c:	89 50 68             	mov    %edx,0x68(%eax)
    626f:	8b 55 bc             	mov    -0x44(%ebp),%edx
    6272:	8b 45 08             	mov    0x8(%ebp),%eax
    6275:	89 50 58             	mov    %edx,0x58(%eax)
    6278:	83 ec 04             	sub    $0x4,%esp
    627b:	6a 00                	push   $0x0
    627d:	ff 75 08             	pushl  0x8(%ebp)
    6280:	6a 03                	push   $0x3
    6282:	e8 97 d5 ff ff       	call   381e <send_rec>
    6287:	83 c4 10             	add    $0x10,%esp
    628a:	b8 00 00 00 00       	mov    $0x0,%eax
    628f:	e9 4a 02 00 00       	jmp    64de <do_rdwt+0x36e>
    6294:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    6298:	75 12                	jne    62ac <do_rdwt+0x13c>
    629a:	8b 45 b0             	mov    -0x50(%ebp),%eax
    629d:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
    62a0:	75 0a                	jne    62ac <do_rdwt+0x13c>
    62a2:	b8 00 00 00 00       	mov    $0x0,%eax
    62a7:	e9 32 02 00 00       	jmp    64de <do_rdwt+0x36e>
    62ac:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
    62b0:	75 18                	jne    62ca <do_rdwt+0x15a>
    62b2:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    62b8:	c1 e0 09             	shl    $0x9,%eax
    62bb:	39 45 b0             	cmp    %eax,-0x50(%ebp)
    62be:	75 0a                	jne    62ca <do_rdwt+0x15a>
    62c0:	b8 00 00 00 00       	mov    $0x0,%eax
    62c5:	e9 14 02 00 00       	jmp    64de <do_rdwt+0x36e>
    62ca:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    62ce:	75 14                	jne    62e4 <do_rdwt+0x174>
    62d0:	8b 55 b0             	mov    -0x50(%ebp),%edx
    62d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    62d6:	01 d0                	add    %edx,%eax
    62d8:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
    62db:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
    62df:	89 45 f0             	mov    %eax,-0x10(%ebp)
    62e2:	eb 19                	jmp    62fd <do_rdwt+0x18d>
    62e4:	8b 55 b0             	mov    -0x50(%ebp),%edx
    62e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    62ea:	01 c2                	add    %eax,%edx
    62ec:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    62f2:	c1 e0 09             	shl    $0x9,%eax
    62f5:	39 c2                	cmp    %eax,%edx
    62f7:	0f 4e c2             	cmovle %edx,%eax
    62fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    62fd:	8b 45 b0             	mov    -0x50(%ebp),%eax
    6300:	99                   	cltd   
    6301:	c1 ea 17             	shr    $0x17,%edx
    6304:	01 d0                	add    %edx,%eax
    6306:	25 ff 01 00 00       	and    $0x1ff,%eax
    630b:	29 d0                	sub    %edx,%eax
    630d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6310:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    6316:	8b 45 b0             	mov    -0x50(%ebp),%eax
    6319:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    631f:	85 c0                	test   %eax,%eax
    6321:	0f 48 c1             	cmovs  %ecx,%eax
    6324:	c1 f8 09             	sar    $0x9,%eax
    6327:	01 d0                	add    %edx,%eax
    6329:	89 45 ac             	mov    %eax,-0x54(%ebp)
    632c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
    6332:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6335:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    633b:	85 c0                	test   %eax,%eax
    633d:	0f 48 c1             	cmovs  %ecx,%eax
    6340:	c1 f8 09             	sar    $0x9,%eax
    6343:	01 d0                	add    %edx,%eax
    6345:	89 45 a8             	mov    %eax,-0x58(%ebp)
    6348:	8b 45 a8             	mov    -0x58(%ebp),%eax
    634b:	2b 45 ac             	sub    -0x54(%ebp),%eax
    634e:	ba 00 00 10 00       	mov    $0x100000,%edx
    6353:	39 d0                	cmp    %edx,%eax
    6355:	7d 0b                	jge    6362 <do_rdwt+0x1f2>
    6357:	8b 45 a8             	mov    -0x58(%ebp),%eax
    635a:	2b 45 ac             	sub    -0x54(%ebp),%eax
    635d:	83 c0 01             	add    $0x1,%eax
    6360:	eb 05                	jmp    6367 <do_rdwt+0x1f7>
    6362:	b8 00 00 10 00       	mov    $0x100000,%eax
    6367:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    636a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    636d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6370:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    6377:	8b 45 08             	mov    0x8(%ebp),%eax
    637a:	8b 00                	mov    (%eax),%eax
    637c:	83 ec 0c             	sub    $0xc,%esp
    637f:	50                   	push   %eax
    6380:	e8 53 05 00 00       	call   68d8 <pid2proc>
    6385:	83 c4 10             	add    $0x10,%esp
    6388:	89 45 a0             	mov    %eax,-0x60(%ebp)
    638b:	8b 45 a0             	mov    -0x60(%ebp),%eax
    638e:	8b 40 0c             	mov    0xc(%eax),%eax
    6391:	89 45 9c             	mov    %eax,-0x64(%ebp)
    6394:	8b 45 9c             	mov    -0x64(%ebp),%eax
    6397:	83 ec 08             	sub    $0x8,%esp
    639a:	ff 75 a0             	pushl  -0x60(%ebp)
    639d:	50                   	push   %eax
    639e:	e8 1e 06 00 00       	call   69c1 <Seg2PhyAddrLDT>
    63a3:	83 c4 10             	add    $0x10,%esp
    63a6:	89 45 98             	mov    %eax,-0x68(%ebp)
    63a9:	8b 55 98             	mov    -0x68(%ebp),%edx
    63ac:	8b 45 cc             	mov    -0x34(%ebp),%eax
    63af:	01 d0                	add    %edx,%eax
    63b1:	89 45 94             	mov    %eax,-0x6c(%ebp)
    63b4:	8b 45 ac             	mov    -0x54(%ebp),%eax
    63b7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    63ba:	e9 c7 00 00 00       	jmp    6486 <do_rdwt+0x316>
    63bf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    63c2:	c1 e0 09             	shl    $0x9,%eax
    63c5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    63c8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    63cb:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
    63cf:	89 45 90             	mov    %eax,-0x70(%ebp)
    63d2:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
    63d9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    63dc:	c1 e0 09             	shl    $0x9,%eax
    63df:	89 c2                	mov    %eax,%edx
    63e1:	a1 20 c0 00 00       	mov    0xc020,%eax
    63e6:	83 ec 0c             	sub    $0xc,%esp
    63e9:	6a 07                	push   $0x7
    63eb:	52                   	push   %edx
    63ec:	50                   	push   %eax
    63ed:	ff 75 8c             	pushl  -0x74(%ebp)
    63f0:	ff 75 e0             	pushl  -0x20(%ebp)
    63f3:	e8 a7 e5 ff ff       	call   499f <rd_wt>
    63f8:	83 c4 20             	add    $0x20,%esp
    63fb:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    63ff:	75 25                	jne    6426 <do_rdwt+0x2b6>
    6401:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    6407:	8b 45 ec             	mov    -0x14(%ebp),%eax
    640a:	01 d0                	add    %edx,%eax
    640c:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
    640f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    6412:	01 ca                	add    %ecx,%edx
    6414:	83 ec 04             	sub    $0x4,%esp
    6417:	ff 75 90             	pushl  -0x70(%ebp)
    641a:	50                   	push   %eax
    641b:	52                   	push   %edx
    641c:	e8 8a 2d 00 00       	call   91ab <Memcpy>
    6421:	83 c4 10             	add    $0x10,%esp
    6424:	eb 47                	jmp    646d <do_rdwt+0x2fd>
    6426:	8b 55 94             	mov    -0x6c(%ebp),%edx
    6429:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    642c:	01 d0                	add    %edx,%eax
    642e:	89 c1                	mov    %eax,%ecx
    6430:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    6436:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6439:	01 d0                	add    %edx,%eax
    643b:	83 ec 04             	sub    $0x4,%esp
    643e:	ff 75 90             	pushl  -0x70(%ebp)
    6441:	51                   	push   %ecx
    6442:	50                   	push   %eax
    6443:	e8 63 2d 00 00       	call   91ab <Memcpy>
    6448:	83 c4 10             	add    $0x10,%esp
    644b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    644e:	c1 e0 09             	shl    $0x9,%eax
    6451:	89 c2                	mov    %eax,%edx
    6453:	a1 20 c0 00 00       	mov    0xc020,%eax
    6458:	83 ec 0c             	sub    $0xc,%esp
    645b:	6a 0a                	push   $0xa
    645d:	52                   	push   %edx
    645e:	50                   	push   %eax
    645f:	ff 75 8c             	pushl  -0x74(%ebp)
    6462:	ff 75 e0             	pushl  -0x20(%ebp)
    6465:	e8 35 e5 ff ff       	call   499f <rd_wt>
    646a:	83 c4 20             	add    $0x20,%esp
    646d:	8b 45 90             	mov    -0x70(%ebp),%eax
    6470:	29 45 e8             	sub    %eax,-0x18(%ebp)
    6473:	8b 45 90             	mov    -0x70(%ebp),%eax
    6476:	01 45 e4             	add    %eax,-0x1c(%ebp)
    6479:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6480:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    6483:	01 45 e0             	add    %eax,-0x20(%ebp)
    6486:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6489:	3b 45 a8             	cmp    -0x58(%ebp),%eax
    648c:	7f 0a                	jg     6498 <do_rdwt+0x328>
    648e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    6492:	0f 85 27 ff ff ff    	jne    63bf <do_rdwt+0x24f>
    6498:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    649b:	8b 50 04             	mov    0x4(%eax),%edx
    649e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    64a1:	01 c2                	add    %eax,%edx
    64a3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    64a6:	89 50 04             	mov    %edx,0x4(%eax)
    64a9:	8b 55 b0             	mov    -0x50(%ebp),%edx
    64ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
    64af:	01 c2                	add    %eax,%edx
    64b1:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    64b7:	39 c2                	cmp    %eax,%edx
    64b9:	7e 20                	jle    64db <do_rdwt+0x36b>
    64bb:	8b 55 b0             	mov    -0x50(%ebp),%edx
    64be:	8b 45 d8             	mov    -0x28(%ebp),%eax
    64c1:	01 d0                	add    %edx,%eax
    64c3:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
    64c9:	83 ec 0c             	sub    $0xc,%esp
    64cc:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    64d2:	50                   	push   %eax
    64d3:	e8 08 00 00 00       	call   64e0 <sync_inode>
    64d8:	83 c4 10             	add    $0x10,%esp
    64db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    64de:	c9                   	leave  
    64df:	c3                   	ret    

000064e0 <sync_inode>:
    64e0:	55                   	push   %ebp
    64e1:	89 e5                	mov    %esp,%ebp
    64e3:	53                   	push   %ebx
    64e4:	83 ec 34             	sub    $0x34,%esp
    64e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    64ee:	eb 74                	jmp    6564 <sync_inode+0x84>
    64f0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    64f3:	89 d0                	mov    %edx,%eax
    64f5:	c1 e0 02             	shl    $0x2,%eax
    64f8:	01 d0                	add    %edx,%eax
    64fa:	c1 e0 03             	shl    $0x3,%eax
    64fd:	05 30 07 01 00       	add    $0x10730,%eax
    6502:	8b 10                	mov    (%eax),%edx
    6504:	8b 45 08             	mov    0x8(%ebp),%eax
    6507:	8b 40 10             	mov    0x10(%eax),%eax
    650a:	39 c2                	cmp    %eax,%edx
    650c:	75 52                	jne    6560 <sync_inode+0x80>
    650e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6511:	89 d0                	mov    %edx,%eax
    6513:	c1 e0 02             	shl    $0x2,%eax
    6516:	01 d0                	add    %edx,%eax
    6518:	c1 e0 03             	shl    $0x3,%eax
    651b:	8d 90 20 07 01 00    	lea    0x10720(%eax),%edx
    6521:	8b 45 08             	mov    0x8(%ebp),%eax
    6524:	8b 08                	mov    (%eax),%ecx
    6526:	89 0a                	mov    %ecx,(%edx)
    6528:	8b 48 04             	mov    0x4(%eax),%ecx
    652b:	89 4a 04             	mov    %ecx,0x4(%edx)
    652e:	8b 48 08             	mov    0x8(%eax),%ecx
    6531:	89 4a 08             	mov    %ecx,0x8(%edx)
    6534:	8b 48 0c             	mov    0xc(%eax),%ecx
    6537:	89 4a 0c             	mov    %ecx,0xc(%edx)
    653a:	8b 48 10             	mov    0x10(%eax),%ecx
    653d:	89 4a 10             	mov    %ecx,0x10(%edx)
    6540:	8b 48 14             	mov    0x14(%eax),%ecx
    6543:	89 4a 14             	mov    %ecx,0x14(%edx)
    6546:	8b 48 18             	mov    0x18(%eax),%ecx
    6549:	89 4a 18             	mov    %ecx,0x18(%edx)
    654c:	8b 48 1c             	mov    0x1c(%eax),%ecx
    654f:	89 4a 1c             	mov    %ecx,0x1c(%edx)
    6552:	8b 48 20             	mov    0x20(%eax),%ecx
    6555:	89 4a 20             	mov    %ecx,0x20(%edx)
    6558:	8b 40 24             	mov    0x24(%eax),%eax
    655b:	89 42 24             	mov    %eax,0x24(%edx)
    655e:	eb 0a                	jmp    656a <sync_inode+0x8a>
    6560:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6564:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    6568:	7e 86                	jle    64f0 <sync_inode+0x10>
    656a:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
    6571:	8b 45 08             	mov    0x8(%ebp),%eax
    6574:	8b 40 10             	mov    0x10(%eax),%eax
    6577:	89 45 ec             	mov    %eax,-0x14(%ebp)
    657a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    657d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6580:	b8 00 02 00 00       	mov    $0x200,%eax
    6585:	99                   	cltd   
    6586:	f7 7d f0             	idivl  -0x10(%ebp)
    6589:	89 c3                	mov    %eax,%ebx
    658b:	89 c8                	mov    %ecx,%eax
    658d:	99                   	cltd   
    658e:	f7 fb                	idiv   %ebx
    6590:	89 55 e8             	mov    %edx,-0x18(%ebp)
    6593:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6596:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6599:	b8 00 02 00 00       	mov    $0x200,%eax
    659e:	99                   	cltd   
    659f:	f7 7d f0             	idivl  -0x10(%ebp)
    65a2:	89 c3                	mov    %eax,%ebx
    65a4:	89 c8                	mov    %ecx,%eax
    65a6:	99                   	cltd   
    65a7:	f7 fb                	idiv   %ebx
    65a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    65ac:	8b 45 08             	mov    0x8(%ebp),%eax
    65af:	8b 40 20             	mov    0x20(%eax),%eax
    65b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    65b5:	e8 0a 01 00 00       	call   66c4 <get_super_block>
    65ba:	89 45 dc             	mov    %eax,-0x24(%ebp)
    65bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    65c0:	8b 40 04             	mov    0x4(%eax),%eax
    65c3:	8d 50 02             	lea    0x2(%eax),%edx
    65c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    65c9:	8b 40 08             	mov    0x8(%eax),%eax
    65cc:	01 c2                	add    %eax,%edx
    65ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    65d1:	01 d0                	add    %edx,%eax
    65d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    65d6:	a1 20 c0 00 00       	mov    0xc020,%eax
    65db:	83 ec 0c             	sub    $0xc,%esp
    65de:	6a 07                	push   $0x7
    65e0:	68 00 02 00 00       	push   $0x200
    65e5:	50                   	push   %eax
    65e6:	ff 75 e0             	pushl  -0x20(%ebp)
    65e9:	ff 75 d8             	pushl  -0x28(%ebp)
    65ec:	e8 ae e3 ff ff       	call   499f <rd_wt>
    65f1:	83 c4 20             	add    $0x20,%esp
    65f4:	a1 20 c0 00 00       	mov    0xc020,%eax
    65f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    65fc:	83 ec 04             	sub    $0x4,%esp
    65ff:	ff 75 f0             	pushl  -0x10(%ebp)
    6602:	ff 75 08             	pushl  0x8(%ebp)
    6605:	ff 75 d4             	pushl  -0x2c(%ebp)
    6608:	e8 9e 2b 00 00       	call   91ab <Memcpy>
    660d:	83 c4 10             	add    $0x10,%esp
    6610:	a1 20 c0 00 00       	mov    0xc020,%eax
    6615:	83 ec 0c             	sub    $0xc,%esp
    6618:	6a 0a                	push   $0xa
    661a:	68 00 02 00 00       	push   $0x200
    661f:	50                   	push   %eax
    6620:	ff 75 e0             	pushl  -0x20(%ebp)
    6623:	ff 75 d8             	pushl  -0x28(%ebp)
    6626:	e8 74 e3 ff ff       	call   499f <rd_wt>
    662b:	83 c4 20             	add    $0x20,%esp
    662e:	90                   	nop
    662f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    6632:	c9                   	leave  
    6633:	c3                   	ret    

00006634 <put_inode>:
    6634:	55                   	push   %ebp
    6635:	89 e5                	mov    %esp,%ebp
    6637:	83 ec 08             	sub    $0x8,%esp
    663a:	8b 45 08             	mov    0x8(%ebp),%eax
    663d:	8b 40 24             	mov    0x24(%eax),%eax
    6640:	85 c0                	test   %eax,%eax
    6642:	7f 1c                	jg     6660 <put_inode+0x2c>
    6644:	68 54 05 00 00       	push   $0x554
    6649:	68 7c 8f 00 00       	push   $0x8f7c
    664e:	68 7c 8f 00 00       	push   $0x8f7c
    6653:	68 dc 90 00 00       	push   $0x90dc
    6658:	e8 55 c9 ff ff       	call   2fb2 <assertion_failure>
    665d:	83 c4 10             	add    $0x10,%esp
    6660:	8b 45 08             	mov    0x8(%ebp),%eax
    6663:	8b 40 24             	mov    0x24(%eax),%eax
    6666:	8d 50 ff             	lea    -0x1(%eax),%edx
    6669:	8b 45 08             	mov    0x8(%ebp),%eax
    666c:	89 50 24             	mov    %edx,0x24(%eax)
    666f:	90                   	nop
    6670:	c9                   	leave  
    6671:	c3                   	ret    

00006672 <do_close>:
    6672:	55                   	push   %ebp
    6673:	89 e5                	mov    %esp,%ebp
    6675:	a1 44 db 00 00       	mov    0xdb44,%eax
    667a:	8b 55 08             	mov    0x8(%ebp),%edx
    667d:	83 c2 1c             	add    $0x1c,%edx
    6680:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    6684:	8b 50 0c             	mov    0xc(%eax),%edx
    6687:	83 ea 01             	sub    $0x1,%edx
    668a:	89 50 0c             	mov    %edx,0xc(%eax)
    668d:	8b 40 0c             	mov    0xc(%eax),%eax
    6690:	85 c0                	test   %eax,%eax
    6692:	75 16                	jne    66aa <do_close+0x38>
    6694:	a1 44 db 00 00       	mov    0xdb44,%eax
    6699:	8b 55 08             	mov    0x8(%ebp),%edx
    669c:	83 c2 1c             	add    $0x1c,%edx
    669f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    66a3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    66aa:	a1 44 db 00 00       	mov    0xdb44,%eax
    66af:	8b 55 08             	mov    0x8(%ebp),%edx
    66b2:	83 c2 1c             	add    $0x1c,%edx
    66b5:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    66bc:	00 
    66bd:	b8 00 00 00 00       	mov    $0x0,%eax
    66c2:	5d                   	pop    %ebp
    66c3:	c3                   	ret    

000066c4 <get_super_block>:
    66c4:	55                   	push   %ebp
    66c5:	89 e5                	mov    %esp,%ebp
    66c7:	83 ec 08             	sub    $0x8,%esp
    66ca:	a1 20 c0 00 00       	mov    0xc020,%eax
    66cf:	83 ec 0c             	sub    $0xc,%esp
    66d2:	6a 07                	push   $0x7
    66d4:	68 00 02 00 00       	push   $0x200
    66d9:	50                   	push   %eax
    66da:	6a 20                	push   $0x20
    66dc:	6a 01                	push   $0x1
    66de:	e8 bc e2 ff ff       	call   499f <rd_wt>
    66e3:	83 c4 20             	add    $0x20,%esp
    66e6:	8b 15 20 c0 00 00    	mov    0xc020,%edx
    66ec:	a1 24 c0 00 00       	mov    0xc024,%eax
    66f1:	8b 0a                	mov    (%edx),%ecx
    66f3:	89 08                	mov    %ecx,(%eax)
    66f5:	8b 4a 04             	mov    0x4(%edx),%ecx
    66f8:	89 48 04             	mov    %ecx,0x4(%eax)
    66fb:	8b 4a 08             	mov    0x8(%edx),%ecx
    66fe:	89 48 08             	mov    %ecx,0x8(%eax)
    6701:	8b 4a 0c             	mov    0xc(%edx),%ecx
    6704:	89 48 0c             	mov    %ecx,0xc(%eax)
    6707:	8b 4a 10             	mov    0x10(%edx),%ecx
    670a:	89 48 10             	mov    %ecx,0x10(%eax)
    670d:	8b 4a 14             	mov    0x14(%edx),%ecx
    6710:	89 48 14             	mov    %ecx,0x14(%eax)
    6713:	8b 4a 18             	mov    0x18(%edx),%ecx
    6716:	89 48 18             	mov    %ecx,0x18(%eax)
    6719:	8b 4a 1c             	mov    0x1c(%edx),%ecx
    671c:	89 48 1c             	mov    %ecx,0x1c(%eax)
    671f:	8b 52 20             	mov    0x20(%edx),%edx
    6722:	89 50 20             	mov    %edx,0x20(%eax)
    6725:	a1 24 c0 00 00       	mov    0xc024,%eax
    672a:	c9                   	leave  
    672b:	c3                   	ret    

0000672c <check>:
    672c:	55                   	push   %ebp
    672d:	89 e5                	mov    %esp,%ebp
    672f:	83 ec 18             	sub    $0x18,%esp
    6732:	c7 45 f4 60 11 08 00 	movl   $0x81160,-0xc(%ebp)
    6739:	eb 59                	jmp    6794 <check+0x68>
    673b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    673e:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    6744:	85 c0                	test   %eax,%eax
    6746:	74 45                	je     678d <check+0x61>
    6748:	8b 45 f4             	mov    -0xc(%ebp),%eax
    674b:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    6751:	83 f8 01             	cmp    $0x1,%eax
    6754:	74 37                	je     678d <check+0x61>
    6756:	c7 05 30 d7 00 00 02 	movl   $0x2802,0xd730
    675d:	28 00 00 
    6760:	83 ec 08             	sub    $0x8,%esp
    6763:	6a 0a                	push   $0xa
    6765:	68 eb 90 00 00       	push   $0x90eb
    676a:	e8 58 a9 ff ff       	call   10c7 <disp_str_colour>
    676f:	83 c4 10             	add    $0x10,%esp
    6772:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6775:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    677c:	0f be c0             	movsbl %al,%eax
    677f:	83 ec 0c             	sub    $0xc,%esp
    6782:	50                   	push   %eax
    6783:	e8 e9 ae ff ff       	call   1671 <disp_int>
    6788:	83 c4 10             	add    $0x10,%esp
    678b:	eb fe                	jmp    678b <check+0x5f>
    678d:	81 45 f4 a0 01 00 00 	addl   $0x1a0,-0xc(%ebp)
    6794:	b8 80 19 08 00       	mov    $0x81980,%eax
    6799:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    679c:	72 9d                	jb     673b <check+0xf>
    679e:	90                   	nop
    679f:	c9                   	leave  
    67a0:	c3                   	ret    

000067a1 <schedule_process>:
    67a1:	55                   	push   %ebp
    67a2:	89 e5                	mov    %esp,%ebp
    67a4:	83 ec 10             	sub    $0x10,%esp
    67a7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    67ae:	eb 7e                	jmp    682e <schedule_process+0x8d>
    67b0:	c7 45 fc 60 11 08 00 	movl   $0x81160,-0x4(%ebp)
    67b7:	eb 31                	jmp    67ea <schedule_process+0x49>
    67b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67bc:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    67c3:	84 c0                	test   %al,%al
    67c5:	75 1c                	jne    67e3 <schedule_process+0x42>
    67c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67ca:	8b 40 5c             	mov    0x5c(%eax),%eax
    67cd:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    67d0:	73 11                	jae    67e3 <schedule_process+0x42>
    67d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67d5:	8b 40 5c             	mov    0x5c(%eax),%eax
    67d8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    67db:	8b 45 fc             	mov    -0x4(%ebp),%eax
    67de:	a3 40 db 00 00       	mov    %eax,0xdb40
    67e3:	81 45 fc a0 01 00 00 	addl   $0x1a0,-0x4(%ebp)
    67ea:	b8 60 1e 08 00       	mov    $0x81e60,%eax
    67ef:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    67f2:	72 c5                	jb     67b9 <schedule_process+0x18>
    67f4:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    67f8:	75 34                	jne    682e <schedule_process+0x8d>
    67fa:	c7 45 fc 60 11 08 00 	movl   $0x81160,-0x4(%ebp)
    6801:	eb 21                	jmp    6824 <schedule_process+0x83>
    6803:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6806:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    680d:	84 c0                	test   %al,%al
    680f:	75 0c                	jne    681d <schedule_process+0x7c>
    6811:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6814:	8b 50 60             	mov    0x60(%eax),%edx
    6817:	8b 45 fc             	mov    -0x4(%ebp),%eax
    681a:	89 50 5c             	mov    %edx,0x5c(%eax)
    681d:	81 45 fc a0 01 00 00 	addl   $0x1a0,-0x4(%ebp)
    6824:	b8 60 1e 08 00       	mov    $0x81e60,%eax
    6829:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    682c:	72 d5                	jb     6803 <schedule_process+0x62>
    682e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    6832:	0f 84 78 ff ff ff    	je     67b0 <schedule_process+0xf>
    6838:	a1 40 db 00 00       	mov    0xdb40,%eax
    683d:	8b 40 58             	mov    0x58(%eax),%eax
    6840:	83 f8 07             	cmp    $0x7,%eax
    6843:	75 07                	jne    684c <schedule_process+0xab>
    6845:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
    684c:	90                   	nop
    684d:	c9                   	leave  
    684e:	c3                   	ret    

0000684f <clock_handler>:
    684f:	55                   	push   %ebp
    6850:	89 e5                	mov    %esp,%ebp
    6852:	83 ec 08             	sub    $0x8,%esp
    6855:	a1 40 db 00 00       	mov    0xdb40,%eax
    685a:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    6861:	3c 02                	cmp    $0x2,%al
    6863:	a1 80 fe 00 00       	mov    0xfe80,%eax
    6868:	83 c0 01             	add    $0x1,%eax
    686b:	a3 80 fe 00 00       	mov    %eax,0xfe80
    6870:	a1 80 fe 00 00       	mov    0xfe80,%eax
    6875:	3d cc ab ff 7f       	cmp    $0x7fffabcc,%eax
    687a:	76 0a                	jbe    6886 <clock_handler+0x37>
    687c:	c7 05 80 fe 00 00 00 	movl   $0x0,0xfe80
    6883:	00 00 00 
    6886:	a1 40 db 00 00       	mov    0xdb40,%eax
    688b:	8b 40 5c             	mov    0x5c(%eax),%eax
    688e:	85 c0                	test   %eax,%eax
    6890:	74 0e                	je     68a0 <clock_handler+0x51>
    6892:	a1 40 db 00 00       	mov    0xdb40,%eax
    6897:	8b 50 5c             	mov    0x5c(%eax),%edx
    689a:	83 ea 01             	sub    $0x1,%edx
    689d:	89 50 5c             	mov    %edx,0x5c(%eax)
    68a0:	a1 70 f6 00 00       	mov    0xf670,%eax
    68a5:	85 c0                	test   %eax,%eax
    68a7:	74 0d                	je     68b6 <clock_handler+0x67>
    68a9:	83 ec 0c             	sub    $0xc,%esp
    68ac:	6a 00                	push   $0x0
    68ae:	e8 a1 d1 ff ff       	call   3a54 <inform_int>
    68b3:	83 c4 10             	add    $0x10,%esp
    68b6:	a1 34 d7 00 00       	mov    0xd734,%eax
    68bb:	85 c0                	test   %eax,%eax
    68bd:	75 13                	jne    68d2 <clock_handler+0x83>
    68bf:	a1 40 db 00 00       	mov    0xdb40,%eax
    68c4:	8b 40 5c             	mov    0x5c(%eax),%eax
    68c7:	85 c0                	test   %eax,%eax
    68c9:	75 0a                	jne    68d5 <clock_handler+0x86>
    68cb:	e8 d1 fe ff ff       	call   67a1 <schedule_process>
    68d0:	eb 04                	jmp    68d6 <clock_handler+0x87>
    68d2:	90                   	nop
    68d3:	eb 01                	jmp    68d6 <clock_handler+0x87>
    68d5:	90                   	nop
    68d6:	c9                   	leave  
    68d7:	c3                   	ret    

000068d8 <pid2proc>:
    68d8:	55                   	push   %ebp
    68d9:	89 e5                	mov    %esp,%ebp
    68db:	83 ec 10             	sub    $0x10,%esp
    68de:	8b 45 08             	mov    0x8(%ebp),%eax
    68e1:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    68e7:	05 60 11 08 00       	add    $0x81160,%eax
    68ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
    68ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
    68f2:	c9                   	leave  
    68f3:	c3                   	ret    

000068f4 <proc2pid>:
    68f4:	55                   	push   %ebp
    68f5:	89 e5                	mov    %esp,%ebp
    68f7:	83 ec 10             	sub    $0x10,%esp
    68fa:	8b 45 08             	mov    0x8(%ebp),%eax
    68fd:	2d 60 11 08 00       	sub    $0x81160,%eax
    6902:	c1 f8 05             	sar    $0x5,%eax
    6905:	69 c0 c5 4e ec c4    	imul   $0xc4ec4ec5,%eax,%eax
    690b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    690e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6911:	c9                   	leave  
    6912:	c3                   	ret    

00006913 <InitDescriptor>:
    6913:	55                   	push   %ebp
    6914:	89 e5                	mov    %esp,%ebp
    6916:	83 ec 04             	sub    $0x4,%esp
    6919:	8b 45 14             	mov    0x14(%ebp),%eax
    691c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
    6920:	8b 45 10             	mov    0x10(%ebp),%eax
    6923:	89 c2                	mov    %eax,%edx
    6925:	8b 45 08             	mov    0x8(%ebp),%eax
    6928:	66 89 10             	mov    %dx,(%eax)
    692b:	8b 45 0c             	mov    0xc(%ebp),%eax
    692e:	89 c2                	mov    %eax,%edx
    6930:	8b 45 08             	mov    0x8(%ebp),%eax
    6933:	66 89 50 02          	mov    %dx,0x2(%eax)
    6937:	8b 45 0c             	mov    0xc(%ebp),%eax
    693a:	c1 e8 10             	shr    $0x10,%eax
    693d:	89 c2                	mov    %eax,%edx
    693f:	8b 45 08             	mov    0x8(%ebp),%eax
    6942:	88 50 04             	mov    %dl,0x4(%eax)
    6945:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    6949:	89 c2                	mov    %eax,%edx
    694b:	8b 45 08             	mov    0x8(%ebp),%eax
    694e:	88 50 05             	mov    %dl,0x5(%eax)
    6951:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    6955:	66 c1 e8 08          	shr    $0x8,%ax
    6959:	c1 e0 04             	shl    $0x4,%eax
    695c:	89 c2                	mov    %eax,%edx
    695e:	8b 45 10             	mov    0x10(%ebp),%eax
    6961:	c1 e8 10             	shr    $0x10,%eax
    6964:	83 e0 0f             	and    $0xf,%eax
    6967:	09 c2                	or     %eax,%edx
    6969:	8b 45 08             	mov    0x8(%ebp),%eax
    696c:	88 50 06             	mov    %dl,0x6(%eax)
    696f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6972:	c1 e8 18             	shr    $0x18,%eax
    6975:	89 c2                	mov    %eax,%edx
    6977:	8b 45 08             	mov    0x8(%ebp),%eax
    697a:	88 50 07             	mov    %dl,0x7(%eax)
    697d:	90                   	nop
    697e:	c9                   	leave  
    697f:	c3                   	ret    

00006980 <Seg2PhyAddr>:
    6980:	55                   	push   %ebp
    6981:	89 e5                	mov    %esp,%ebp
    6983:	83 ec 10             	sub    $0x10,%esp
    6986:	8b 45 08             	mov    0x8(%ebp),%eax
    6989:	c1 e8 03             	shr    $0x3,%eax
    698c:	8b 14 c5 44 d7 00 00 	mov    0xd744(,%eax,8),%edx
    6993:	8b 04 c5 40 d7 00 00 	mov    0xd740(,%eax,8),%eax
    699a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    699d:	89 55 f8             	mov    %edx,-0x8(%ebp)
    69a0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    69a4:	0f b7 c0             	movzwl %ax,%eax
    69a7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    69ab:	0f b6 d2             	movzbl %dl,%edx
    69ae:	c1 e2 10             	shl    $0x10,%edx
    69b1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    69b7:	09 d0                	or     %edx,%eax
    69b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    69bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    69bf:	c9                   	leave  
    69c0:	c3                   	ret    

000069c1 <Seg2PhyAddrLDT>:
    69c1:	55                   	push   %ebp
    69c2:	89 e5                	mov    %esp,%ebp
    69c4:	83 ec 10             	sub    $0x10,%esp
    69c7:	8b 45 08             	mov    0x8(%ebp),%eax
    69ca:	c1 e8 03             	shr    $0x3,%eax
    69cd:	89 c2                	mov    %eax,%edx
    69cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    69d2:	83 c2 08             	add    $0x8,%edx
    69d5:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
    69d9:	8b 02                	mov    (%edx),%eax
    69db:	8b 52 04             	mov    0x4(%edx),%edx
    69de:	89 45 f4             	mov    %eax,-0xc(%ebp)
    69e1:	89 55 f8             	mov    %edx,-0x8(%ebp)
    69e4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    69e8:	0f b7 c0             	movzwl %ax,%eax
    69eb:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    69ef:	0f b6 d2             	movzbl %dl,%edx
    69f2:	c1 e2 10             	shl    $0x10,%edx
    69f5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    69fb:	09 d0                	or     %edx,%eax
    69fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6a00:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6a03:	c9                   	leave  
    6a04:	c3                   	ret    

00006a05 <VirAddr2PhyAddr>:
    6a05:	55                   	push   %ebp
    6a06:	89 e5                	mov    %esp,%ebp
    6a08:	83 ec 10             	sub    $0x10,%esp
    6a0b:	8b 55 0c             	mov    0xc(%ebp),%edx
    6a0e:	8b 45 08             	mov    0x8(%ebp),%eax
    6a11:	01 d0                	add    %edx,%eax
    6a13:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6a16:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6a19:	c9                   	leave  
    6a1a:	c3                   	ret    

00006a1b <v2l>:
    6a1b:	55                   	push   %ebp
    6a1c:	89 e5                	mov    %esp,%ebp
    6a1e:	83 ec 18             	sub    $0x18,%esp
    6a21:	83 ec 0c             	sub    $0xc,%esp
    6a24:	ff 75 08             	pushl  0x8(%ebp)
    6a27:	e8 ac fe ff ff       	call   68d8 <pid2proc>
    6a2c:	83 c4 10             	add    $0x10,%esp
    6a2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6a32:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    6a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6a3c:	83 ec 08             	sub    $0x8,%esp
    6a3f:	ff 75 f4             	pushl  -0xc(%ebp)
    6a42:	50                   	push   %eax
    6a43:	e8 79 ff ff ff       	call   69c1 <Seg2PhyAddrLDT>
    6a48:	83 c4 10             	add    $0x10,%esp
    6a4b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6a4e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6a51:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a54:	01 d0                	add    %edx,%eax
    6a56:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6a59:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6a5c:	c9                   	leave  
    6a5d:	c3                   	ret    

00006a5e <init_propt>:
    6a5e:	55                   	push   %ebp
    6a5f:	89 e5                	mov    %esp,%ebp
    6a61:	53                   	push   %ebx
    6a62:	83 ec 24             	sub    $0x24,%esp
    6a65:	6a 0e                	push   $0xe
    6a67:	6a 08                	push   $0x8
    6a69:	68 6a 11 00 00       	push   $0x116a
    6a6e:	6a 20                	push   $0x20
    6a70:	e8 53 01 00 00       	call   6bc8 <InitInterruptDesc>
    6a75:	83 c4 10             	add    $0x10,%esp
    6a78:	6a 0e                	push   $0xe
    6a7a:	6a 08                	push   $0x8
    6a7c:	68 b3 11 00 00       	push   $0x11b3
    6a81:	6a 21                	push   $0x21
    6a83:	e8 40 01 00 00       	call   6bc8 <InitInterruptDesc>
    6a88:	83 c4 10             	add    $0x10,%esp
    6a8b:	6a 0e                	push   $0xe
    6a8d:	6a 08                	push   $0x8
    6a8f:	68 fc 11 00 00       	push   $0x11fc
    6a94:	6a 2e                	push   $0x2e
    6a96:	e8 2d 01 00 00       	call   6bc8 <InitInterruptDesc>
    6a9b:	83 c4 10             	add    $0x10,%esp
    6a9e:	83 ec 04             	sub    $0x4,%esp
    6aa1:	68 c0 09 00 00       	push   $0x9c0
    6aa6:	6a 00                	push   $0x0
    6aa8:	68 60 11 08 00       	push   $0x81160
    6aad:	e8 27 27 00 00       	call   91d9 <Memset>
    6ab2:	83 c4 10             	add    $0x10,%esp
    6ab5:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
    6abc:	83 ec 04             	sub    $0x4,%esp
    6abf:	ff 75 f0             	pushl  -0x10(%ebp)
    6ac2:	6a 00                	push   $0x0
    6ac4:	68 00 f6 00 00       	push   $0xf600
    6ac9:	e8 0b 27 00 00       	call   91d9 <Memset>
    6ace:	83 c4 10             	add    $0x10,%esp
    6ad1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ad4:	a3 68 f6 00 00       	mov    %eax,0xf668
    6ad9:	c7 05 08 f6 00 00 30 	movl   $0x30,0xf608
    6ae0:	00 00 00 
    6ae3:	83 ec 0c             	sub    $0xc,%esp
    6ae6:	6a 30                	push   $0x30
    6ae8:	e8 93 fe ff ff       	call   6980 <Seg2PhyAddr>
    6aed:	83 c4 10             	add    $0x10,%esp
    6af0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    6af3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6af6:	83 ec 08             	sub    $0x8,%esp
    6af9:	68 00 f6 00 00       	push   $0xf600
    6afe:	50                   	push   %eax
    6aff:	e8 01 ff ff ff       	call   6a05 <VirAddr2PhyAddr>
    6b04:	83 c4 10             	add    $0x10,%esp
    6b07:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6b0a:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
    6b11:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6b14:	0f b7 d0             	movzwl %ax,%edx
    6b17:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b1a:	83 e8 01             	sub    $0x1,%eax
    6b1d:	89 c1                	mov    %eax,%ecx
    6b1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6b22:	52                   	push   %edx
    6b23:	51                   	push   %ecx
    6b24:	50                   	push   %eax
    6b25:	68 80 d7 00 00       	push   $0xd780
    6b2a:	e8 e4 fd ff ff       	call   6913 <InitDescriptor>
    6b2f:	83 c4 10             	add    $0x10,%esp
    6b32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6b39:	eb 65                	jmp    6ba0 <init_propt+0x142>
    6b3b:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
    6b42:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
    6b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b4c:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    6b52:	83 c0 40             	add    $0x40,%eax
    6b55:	05 60 11 08 00       	add    $0x81160,%eax
    6b5a:	8d 50 06             	lea    0x6(%eax),%edx
    6b5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6b60:	83 ec 08             	sub    $0x8,%esp
    6b63:	52                   	push   %edx
    6b64:	50                   	push   %eax
    6b65:	e8 9b fe ff ff       	call   6a05 <VirAddr2PhyAddr>
    6b6a:	83 c4 10             	add    $0x10,%esp
    6b6d:	89 45 d8             	mov    %eax,-0x28(%ebp)
    6b70:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6b73:	0f b7 d0             	movzwl %ax,%edx
    6b76:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6b79:	83 e8 01             	sub    $0x1,%eax
    6b7c:	89 c3                	mov    %eax,%ebx
    6b7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6b81:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b84:	83 c1 09             	add    $0x9,%ecx
    6b87:	c1 e1 03             	shl    $0x3,%ecx
    6b8a:	81 c1 40 d7 00 00    	add    $0xd740,%ecx
    6b90:	52                   	push   %edx
    6b91:	53                   	push   %ebx
    6b92:	50                   	push   %eax
    6b93:	51                   	push   %ecx
    6b94:	e8 7a fd ff ff       	call   6913 <InitDescriptor>
    6b99:	83 c4 10             	add    $0x10,%esp
    6b9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6ba0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    6ba4:	7e 95                	jle    6b3b <init_propt+0xdd>
    6ba6:	68 f2 00 00 00       	push   $0xf2
    6bab:	68 ff ff 00 00       	push   $0xffff
    6bb0:	68 00 80 0b 00       	push   $0xb8000
    6bb5:	68 78 d7 00 00       	push   $0xd778
    6bba:	e8 54 fd ff ff       	call   6913 <InitDescriptor>
    6bbf:	83 c4 10             	add    $0x10,%esp
    6bc2:	90                   	nop
    6bc3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    6bc6:	c9                   	leave  
    6bc7:	c3                   	ret    

00006bc8 <InitInterruptDesc>:
    6bc8:	55                   	push   %ebp
    6bc9:	89 e5                	mov    %esp,%ebp
    6bcb:	83 ec 10             	sub    $0x10,%esp
    6bce:	8b 45 08             	mov    0x8(%ebp),%eax
    6bd1:	c1 e0 03             	shl    $0x3,%eax
    6bd4:	05 80 f6 00 00       	add    $0xf680,%eax
    6bd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6bdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6bdf:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    6be3:	8b 45 0c             	mov    0xc(%ebp),%eax
    6be6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    6be9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6bec:	89 c2                	mov    %eax,%edx
    6bee:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6bf1:	66 89 10             	mov    %dx,(%eax)
    6bf4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6bf7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
    6bfd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6c00:	c1 f8 10             	sar    $0x10,%eax
    6c03:	89 c2                	mov    %eax,%edx
    6c05:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6c08:	66 89 50 06          	mov    %dx,0x6(%eax)
    6c0c:	8b 45 10             	mov    0x10(%ebp),%eax
    6c0f:	c1 e0 04             	shl    $0x4,%eax
    6c12:	89 c2                	mov    %eax,%edx
    6c14:	8b 45 14             	mov    0x14(%ebp),%eax
    6c17:	09 d0                	or     %edx,%eax
    6c19:	89 c2                	mov    %eax,%edx
    6c1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6c1e:	88 50 05             	mov    %dl,0x5(%eax)
    6c21:	90                   	nop
    6c22:	c9                   	leave  
    6c23:	c3                   	ret    

00006c24 <ReloadGDT>:
    6c24:	55                   	push   %ebp
    6c25:	89 e5                	mov    %esp,%ebp
    6c27:	83 ec 28             	sub    $0x28,%esp
    6c2a:	b8 78 f6 00 00       	mov    $0xf678,%eax
    6c2f:	0f b7 00             	movzwl (%eax),%eax
    6c32:	98                   	cwtl   
    6c33:	ba 7a f6 00 00       	mov    $0xf67a,%edx
    6c38:	8b 12                	mov    (%edx),%edx
    6c3a:	83 ec 04             	sub    $0x4,%esp
    6c3d:	50                   	push   %eax
    6c3e:	52                   	push   %edx
    6c3f:	68 40 d7 00 00       	push   $0xd740
    6c44:	e8 62 25 00 00       	call   91ab <Memcpy>
    6c49:	83 c4 10             	add    $0x10,%esp
    6c4c:	c7 45 f0 78 f6 00 00 	movl   $0xf678,-0x10(%ebp)
    6c53:	c7 45 ec 7a f6 00 00 	movl   $0xf67a,-0x14(%ebp)
    6c5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c5d:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
    6c62:	ba 40 d7 00 00       	mov    $0xd740,%edx
    6c67:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6c6a:	89 10                	mov    %edx,(%eax)
    6c6c:	c7 45 e8 28 d7 00 00 	movl   $0xd728,-0x18(%ebp)
    6c73:	c7 45 e4 2a d7 00 00 	movl   $0xd72a,-0x1c(%ebp)
    6c7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6c7d:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
    6c82:	ba 80 f6 00 00       	mov    $0xf680,%edx
    6c87:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6c8a:	89 10                	mov    %edx,(%eax)
    6c8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6c93:	eb 04                	jmp    6c99 <ReloadGDT+0x75>
    6c95:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6c99:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    6ca0:	7e f3                	jle    6c95 <ReloadGDT+0x71>
    6ca2:	e8 94 ab ff ff       	call   183b <init_internal_interrupt>
    6ca7:	e8 b2 fd ff ff       	call   6a5e <init_propt>
    6cac:	90                   	nop
    6cad:	c9                   	leave  
    6cae:	c3                   	ret    

00006caf <select_console>:
    6caf:	55                   	push   %ebp
    6cb0:	89 e5                	mov    %esp,%ebp
    6cb2:	83 ec 18             	sub    $0x18,%esp
    6cb5:	8b 45 08             	mov    0x8(%ebp),%eax
    6cb8:	88 45 f4             	mov    %al,-0xc(%ebp)
    6cbb:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
    6cbf:	77 27                	ja     6ce8 <select_console+0x39>
    6cc1:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
    6cc5:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
    6ccb:	05 80 dd 00 00       	add    $0xdd80,%eax
    6cd0:	a3 20 d7 00 00       	mov    %eax,0xd720
    6cd5:	a1 20 d7 00 00       	mov    0xd720,%eax
    6cda:	83 ec 0c             	sub    $0xc,%esp
    6cdd:	50                   	push   %eax
    6cde:	e8 08 00 00 00       	call   6ceb <flush>
    6ce3:	83 c4 10             	add    $0x10,%esp
    6ce6:	eb 01                	jmp    6ce9 <select_console+0x3a>
    6ce8:	90                   	nop
    6ce9:	c9                   	leave  
    6cea:	c3                   	ret    

00006ceb <flush>:
    6ceb:	55                   	push   %ebp
    6cec:	89 e5                	mov    %esp,%ebp
    6cee:	83 ec 08             	sub    $0x8,%esp
    6cf1:	8b 45 08             	mov    0x8(%ebp),%eax
    6cf4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6cfa:	8b 40 0c             	mov    0xc(%eax),%eax
    6cfd:	83 ec 0c             	sub    $0xc,%esp
    6d00:	50                   	push   %eax
    6d01:	e8 1e 00 00 00       	call   6d24 <set_cursor>
    6d06:	83 c4 10             	add    $0x10,%esp
    6d09:	8b 45 08             	mov    0x8(%ebp),%eax
    6d0c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6d12:	8b 40 08             	mov    0x8(%eax),%eax
    6d15:	83 ec 0c             	sub    $0xc,%esp
    6d18:	50                   	push   %eax
    6d19:	e8 64 00 00 00       	call   6d82 <set_console_start_video_addr>
    6d1e:	83 c4 10             	add    $0x10,%esp
    6d21:	90                   	nop
    6d22:	c9                   	leave  
    6d23:	c3                   	ret    

00006d24 <set_cursor>:
    6d24:	55                   	push   %ebp
    6d25:	89 e5                	mov    %esp,%ebp
    6d27:	83 ec 08             	sub    $0x8,%esp
    6d2a:	83 ec 08             	sub    $0x8,%esp
    6d2d:	6a 0e                	push   $0xe
    6d2f:	68 d4 03 00 00       	push   $0x3d4
    6d34:	e8 a6 a5 ff ff       	call   12df <out_byte>
    6d39:	83 c4 10             	add    $0x10,%esp
    6d3c:	8b 45 08             	mov    0x8(%ebp),%eax
    6d3f:	c1 e8 08             	shr    $0x8,%eax
    6d42:	0f b7 c0             	movzwl %ax,%eax
    6d45:	83 ec 08             	sub    $0x8,%esp
    6d48:	50                   	push   %eax
    6d49:	68 d5 03 00 00       	push   $0x3d5
    6d4e:	e8 8c a5 ff ff       	call   12df <out_byte>
    6d53:	83 c4 10             	add    $0x10,%esp
    6d56:	83 ec 08             	sub    $0x8,%esp
    6d59:	6a 0f                	push   $0xf
    6d5b:	68 d4 03 00 00       	push   $0x3d4
    6d60:	e8 7a a5 ff ff       	call   12df <out_byte>
    6d65:	83 c4 10             	add    $0x10,%esp
    6d68:	8b 45 08             	mov    0x8(%ebp),%eax
    6d6b:	0f b7 c0             	movzwl %ax,%eax
    6d6e:	83 ec 08             	sub    $0x8,%esp
    6d71:	50                   	push   %eax
    6d72:	68 d5 03 00 00       	push   $0x3d5
    6d77:	e8 63 a5 ff ff       	call   12df <out_byte>
    6d7c:	83 c4 10             	add    $0x10,%esp
    6d7f:	90                   	nop
    6d80:	c9                   	leave  
    6d81:	c3                   	ret    

00006d82 <set_console_start_video_addr>:
    6d82:	55                   	push   %ebp
    6d83:	89 e5                	mov    %esp,%ebp
    6d85:	83 ec 08             	sub    $0x8,%esp
    6d88:	83 ec 08             	sub    $0x8,%esp
    6d8b:	6a 0c                	push   $0xc
    6d8d:	68 d4 03 00 00       	push   $0x3d4
    6d92:	e8 48 a5 ff ff       	call   12df <out_byte>
    6d97:	83 c4 10             	add    $0x10,%esp
    6d9a:	8b 45 08             	mov    0x8(%ebp),%eax
    6d9d:	c1 e8 08             	shr    $0x8,%eax
    6da0:	0f b7 c0             	movzwl %ax,%eax
    6da3:	83 ec 08             	sub    $0x8,%esp
    6da6:	50                   	push   %eax
    6da7:	68 d5 03 00 00       	push   $0x3d5
    6dac:	e8 2e a5 ff ff       	call   12df <out_byte>
    6db1:	83 c4 10             	add    $0x10,%esp
    6db4:	83 ec 08             	sub    $0x8,%esp
    6db7:	6a 0d                	push   $0xd
    6db9:	68 d4 03 00 00       	push   $0x3d4
    6dbe:	e8 1c a5 ff ff       	call   12df <out_byte>
    6dc3:	83 c4 10             	add    $0x10,%esp
    6dc6:	8b 45 08             	mov    0x8(%ebp),%eax
    6dc9:	0f b7 c0             	movzwl %ax,%eax
    6dcc:	83 ec 08             	sub    $0x8,%esp
    6dcf:	50                   	push   %eax
    6dd0:	68 d5 03 00 00       	push   $0x3d5
    6dd5:	e8 05 a5 ff ff       	call   12df <out_byte>
    6dda:	83 c4 10             	add    $0x10,%esp
    6ddd:	90                   	nop
    6dde:	c9                   	leave  
    6ddf:	c3                   	ret    

00006de0 <put_key>:
    6de0:	55                   	push   %ebp
    6de1:	89 e5                	mov    %esp,%ebp
    6de3:	83 ec 04             	sub    $0x4,%esp
    6de6:	8b 45 0c             	mov    0xc(%ebp),%eax
    6de9:	88 45 fc             	mov    %al,-0x4(%ebp)
    6dec:	8b 45 08             	mov    0x8(%ebp),%eax
    6def:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6df5:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    6dfa:	77 4d                	ja     6e49 <put_key+0x69>
    6dfc:	8b 45 08             	mov    0x8(%ebp),%eax
    6dff:	8b 00                	mov    (%eax),%eax
    6e01:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
    6e05:	89 10                	mov    %edx,(%eax)
    6e07:	8b 45 08             	mov    0x8(%ebp),%eax
    6e0a:	8b 00                	mov    (%eax),%eax
    6e0c:	8d 50 04             	lea    0x4(%eax),%edx
    6e0f:	8b 45 08             	mov    0x8(%ebp),%eax
    6e12:	89 10                	mov    %edx,(%eax)
    6e14:	8b 45 08             	mov    0x8(%ebp),%eax
    6e17:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    6e1d:	8d 50 01             	lea    0x1(%eax),%edx
    6e20:	8b 45 08             	mov    0x8(%ebp),%eax
    6e23:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
    6e29:	8b 45 08             	mov    0x8(%ebp),%eax
    6e2c:	8b 00                	mov    (%eax),%eax
    6e2e:	8b 55 08             	mov    0x8(%ebp),%edx
    6e31:	83 c2 08             	add    $0x8,%edx
    6e34:	81 c2 00 08 00 00    	add    $0x800,%edx
    6e3a:	39 d0                	cmp    %edx,%eax
    6e3c:	75 0b                	jne    6e49 <put_key+0x69>
    6e3e:	8b 45 08             	mov    0x8(%ebp),%eax
    6e41:	8d 50 08             	lea    0x8(%eax),%edx
    6e44:	8b 45 08             	mov    0x8(%ebp),%eax
    6e47:	89 10                	mov    %edx,(%eax)
    6e49:	90                   	nop
    6e4a:	c9                   	leave  
    6e4b:	c3                   	ret    

00006e4c <scroll_up>:
    6e4c:	55                   	push   %ebp
    6e4d:	89 e5                	mov    %esp,%ebp
    6e4f:	83 ec 08             	sub    $0x8,%esp
    6e52:	8b 45 08             	mov    0x8(%ebp),%eax
    6e55:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e5b:	8b 40 08             	mov    0x8(%eax),%eax
    6e5e:	8d 50 b0             	lea    -0x50(%eax),%edx
    6e61:	8b 45 08             	mov    0x8(%ebp),%eax
    6e64:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e6a:	8b 00                	mov    (%eax),%eax
    6e6c:	39 c2                	cmp    %eax,%edx
    6e6e:	76 1b                	jbe    6e8b <scroll_up+0x3f>
    6e70:	8b 45 08             	mov    0x8(%ebp),%eax
    6e73:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e79:	8b 40 08             	mov    0x8(%eax),%eax
    6e7c:	83 e8 50             	sub    $0x50,%eax
    6e7f:	83 ec 0c             	sub    $0xc,%esp
    6e82:	50                   	push   %eax
    6e83:	e8 fa fe ff ff       	call   6d82 <set_console_start_video_addr>
    6e88:	83 c4 10             	add    $0x10,%esp
    6e8b:	90                   	nop
    6e8c:	c9                   	leave  
    6e8d:	c3                   	ret    

00006e8e <scroll_down>:
    6e8e:	55                   	push   %ebp
    6e8f:	89 e5                	mov    %esp,%ebp
    6e91:	83 ec 08             	sub    $0x8,%esp
    6e94:	8b 45 08             	mov    0x8(%ebp),%eax
    6e97:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6e9d:	8b 40 08             	mov    0x8(%eax),%eax
    6ea0:	8d 48 50             	lea    0x50(%eax),%ecx
    6ea3:	8b 45 08             	mov    0x8(%ebp),%eax
    6ea6:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6eac:	8b 10                	mov    (%eax),%edx
    6eae:	8b 45 08             	mov    0x8(%ebp),%eax
    6eb1:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6eb7:	8b 40 04             	mov    0x4(%eax),%eax
    6eba:	01 d0                	add    %edx,%eax
    6ebc:	39 c1                	cmp    %eax,%ecx
    6ebe:	73 36                	jae    6ef6 <scroll_down+0x68>
    6ec0:	8b 45 08             	mov    0x8(%ebp),%eax
    6ec3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ec9:	8b 40 08             	mov    0x8(%eax),%eax
    6ecc:	83 c0 50             	add    $0x50,%eax
    6ecf:	83 ec 0c             	sub    $0xc,%esp
    6ed2:	50                   	push   %eax
    6ed3:	e8 aa fe ff ff       	call   6d82 <set_console_start_video_addr>
    6ed8:	83 c4 10             	add    $0x10,%esp
    6edb:	8b 45 08             	mov    0x8(%ebp),%eax
    6ede:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ee4:	8b 50 08             	mov    0x8(%eax),%edx
    6ee7:	8b 45 08             	mov    0x8(%ebp),%eax
    6eea:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6ef0:	83 c2 50             	add    $0x50,%edx
    6ef3:	89 50 08             	mov    %edx,0x8(%eax)
    6ef6:	90                   	nop
    6ef7:	c9                   	leave  
    6ef8:	c3                   	ret    

00006ef9 <out_char>:
    6ef9:	55                   	push   %ebp
    6efa:	89 e5                	mov    %esp,%ebp
    6efc:	83 ec 28             	sub    $0x28,%esp
    6eff:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f02:	88 45 e4             	mov    %al,-0x1c(%ebp)
    6f05:	8b 45 08             	mov    0x8(%ebp),%eax
    6f08:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f0e:	8b 40 0c             	mov    0xc(%eax),%eax
    6f11:	05 00 c0 05 00       	add    $0x5c000,%eax
    6f16:	01 c0                	add    %eax,%eax
    6f18:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6f1b:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    6f1f:	83 f8 08             	cmp    $0x8,%eax
    6f22:	0f 84 8d 00 00 00    	je     6fb5 <out_char+0xbc>
    6f28:	83 f8 0a             	cmp    $0xa,%eax
    6f2b:	0f 85 c9 00 00 00    	jne    6ffa <out_char+0x101>
    6f31:	8b 45 08             	mov    0x8(%ebp),%eax
    6f34:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f3a:	8b 50 0c             	mov    0xc(%eax),%edx
    6f3d:	8b 45 08             	mov    0x8(%ebp),%eax
    6f40:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f46:	8b 08                	mov    (%eax),%ecx
    6f48:	8b 45 08             	mov    0x8(%ebp),%eax
    6f4b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f51:	8b 40 04             	mov    0x4(%eax),%eax
    6f54:	01 c8                	add    %ecx,%eax
    6f56:	83 e8 50             	sub    $0x50,%eax
    6f59:	39 c2                	cmp    %eax,%edx
    6f5b:	0f 83 f4 00 00 00    	jae    7055 <out_char+0x15c>
    6f61:	8b 45 08             	mov    0x8(%ebp),%eax
    6f64:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f6a:	8b 08                	mov    (%eax),%ecx
    6f6c:	8b 45 08             	mov    0x8(%ebp),%eax
    6f6f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f75:	8b 50 0c             	mov    0xc(%eax),%edx
    6f78:	8b 45 08             	mov    0x8(%ebp),%eax
    6f7b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6f81:	8b 00                	mov    (%eax),%eax
    6f83:	29 c2                	sub    %eax,%edx
    6f85:	89 d0                	mov    %edx,%eax
    6f87:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    6f8c:	f7 e2                	mul    %edx
    6f8e:	89 d0                	mov    %edx,%eax
    6f90:	c1 e8 06             	shr    $0x6,%eax
    6f93:	8d 50 01             	lea    0x1(%eax),%edx
    6f96:	89 d0                	mov    %edx,%eax
    6f98:	c1 e0 02             	shl    $0x2,%eax
    6f9b:	01 d0                	add    %edx,%eax
    6f9d:	c1 e0 04             	shl    $0x4,%eax
    6fa0:	89 c2                	mov    %eax,%edx
    6fa2:	8b 45 08             	mov    0x8(%ebp),%eax
    6fa5:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6fab:	01 ca                	add    %ecx,%edx
    6fad:	89 50 0c             	mov    %edx,0xc(%eax)
    6fb0:	e9 a0 00 00 00       	jmp    7055 <out_char+0x15c>
    6fb5:	8b 45 08             	mov    0x8(%ebp),%eax
    6fb8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6fbe:	8b 50 0c             	mov    0xc(%eax),%edx
    6fc1:	8b 45 08             	mov    0x8(%ebp),%eax
    6fc4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6fca:	8b 00                	mov    (%eax),%eax
    6fcc:	39 c2                	cmp    %eax,%edx
    6fce:	0f 86 84 00 00 00    	jbe    7058 <out_char+0x15f>
    6fd4:	8b 45 08             	mov    0x8(%ebp),%eax
    6fd7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    6fdd:	8b 50 0c             	mov    0xc(%eax),%edx
    6fe0:	83 ea 01             	sub    $0x1,%edx
    6fe3:	89 50 0c             	mov    %edx,0xc(%eax)
    6fe6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6fe9:	83 e8 02             	sub    $0x2,%eax
    6fec:	c6 00 20             	movb   $0x20,(%eax)
    6fef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ff2:	83 e8 01             	sub    $0x1,%eax
    6ff5:	c6 00 00             	movb   $0x0,(%eax)
    6ff8:	eb 5e                	jmp    7058 <out_char+0x15f>
    6ffa:	8b 45 08             	mov    0x8(%ebp),%eax
    6ffd:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7003:	8b 40 0c             	mov    0xc(%eax),%eax
    7006:	8d 48 01             	lea    0x1(%eax),%ecx
    7009:	8b 45 08             	mov    0x8(%ebp),%eax
    700c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7012:	8b 10                	mov    (%eax),%edx
    7014:	8b 45 08             	mov    0x8(%ebp),%eax
    7017:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    701d:	8b 40 04             	mov    0x4(%eax),%eax
    7020:	01 d0                	add    %edx,%eax
    7022:	39 c1                	cmp    %eax,%ecx
    7024:	73 35                	jae    705b <out_char+0x162>
    7026:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7029:	8d 50 01             	lea    0x1(%eax),%edx
    702c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    702f:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
    7033:	88 10                	mov    %dl,(%eax)
    7035:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7038:	8d 50 01             	lea    0x1(%eax),%edx
    703b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    703e:	c6 00 0a             	movb   $0xa,(%eax)
    7041:	8b 45 08             	mov    0x8(%ebp),%eax
    7044:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    704a:	8b 50 0c             	mov    0xc(%eax),%edx
    704d:	83 c2 01             	add    $0x1,%edx
    7050:	89 50 0c             	mov    %edx,0xc(%eax)
    7053:	eb 06                	jmp    705b <out_char+0x162>
    7055:	90                   	nop
    7056:	eb 14                	jmp    706c <out_char+0x173>
    7058:	90                   	nop
    7059:	eb 11                	jmp    706c <out_char+0x173>
    705b:	90                   	nop
    705c:	eb 0e                	jmp    706c <out_char+0x173>
    705e:	83 ec 0c             	sub    $0xc,%esp
    7061:	ff 75 08             	pushl  0x8(%ebp)
    7064:	e8 25 fe ff ff       	call   6e8e <scroll_down>
    7069:	83 c4 10             	add    $0x10,%esp
    706c:	8b 45 08             	mov    0x8(%ebp),%eax
    706f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7075:	8b 50 0c             	mov    0xc(%eax),%edx
    7078:	8b 45 08             	mov    0x8(%ebp),%eax
    707b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7081:	8b 40 08             	mov    0x8(%eax),%eax
    7084:	29 c2                	sub    %eax,%edx
    7086:	89 d0                	mov    %edx,%eax
    7088:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    708d:	77 cf                	ja     705e <out_char+0x165>
    708f:	83 ec 0c             	sub    $0xc,%esp
    7092:	ff 75 08             	pushl  0x8(%ebp)
    7095:	e8 51 fc ff ff       	call   6ceb <flush>
    709a:	83 c4 10             	add    $0x10,%esp
    709d:	90                   	nop
    709e:	c9                   	leave  
    709f:	c3                   	ret    

000070a0 <tty_dev_read>:
    70a0:	55                   	push   %ebp
    70a1:	89 e5                	mov    %esp,%ebp
    70a3:	83 ec 08             	sub    $0x8,%esp
    70a6:	a1 20 d7 00 00       	mov    0xd720,%eax
    70ab:	39 45 08             	cmp    %eax,0x8(%ebp)
    70ae:	75 17                	jne    70c7 <tty_dev_read+0x27>
    70b0:	a1 68 db 00 00       	mov    0xdb68,%eax
    70b5:	85 c0                	test   %eax,%eax
    70b7:	7e 0e                	jle    70c7 <tty_dev_read+0x27>
    70b9:	83 ec 0c             	sub    $0xc,%esp
    70bc:	ff 75 08             	pushl  0x8(%ebp)
    70bf:	e8 f5 06 00 00       	call   77b9 <keyboard_read>
    70c4:	83 c4 10             	add    $0x10,%esp
    70c7:	90                   	nop
    70c8:	c9                   	leave  
    70c9:	c3                   	ret    

000070ca <tty_dev_write>:
    70ca:	55                   	push   %ebp
    70cb:	89 e5                	mov    %esp,%ebp
    70cd:	81 ec 88 00 00 00    	sub    $0x88,%esp
    70d3:	8b 45 08             	mov    0x8(%ebp),%eax
    70d6:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    70dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    70df:	e9 da 01 00 00       	jmp    72be <tty_dev_write+0x1f4>
    70e4:	8b 45 08             	mov    0x8(%ebp),%eax
    70e7:	8b 40 04             	mov    0x4(%eax),%eax
    70ea:	8b 00                	mov    (%eax),%eax
    70ec:	88 45 f3             	mov    %al,-0xd(%ebp)
    70ef:	8b 45 08             	mov    0x8(%ebp),%eax
    70f2:	8b 40 04             	mov    0x4(%eax),%eax
    70f5:	8d 50 04             	lea    0x4(%eax),%edx
    70f8:	8b 45 08             	mov    0x8(%ebp),%eax
    70fb:	89 50 04             	mov    %edx,0x4(%eax)
    70fe:	8b 45 08             	mov    0x8(%ebp),%eax
    7101:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    7107:	8d 50 ff             	lea    -0x1(%eax),%edx
    710a:	8b 45 08             	mov    0x8(%ebp),%eax
    710d:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
    7113:	8b 45 08             	mov    0x8(%ebp),%eax
    7116:	8b 40 04             	mov    0x4(%eax),%eax
    7119:	8b 55 08             	mov    0x8(%ebp),%edx
    711c:	83 c2 08             	add    $0x8,%edx
    711f:	81 c2 00 08 00 00    	add    $0x800,%edx
    7125:	39 d0                	cmp    %edx,%eax
    7127:	75 0c                	jne    7135 <tty_dev_write+0x6b>
    7129:	8b 45 08             	mov    0x8(%ebp),%eax
    712c:	8d 50 08             	lea    0x8(%eax),%edx
    712f:	8b 45 08             	mov    0x8(%ebp),%eax
    7132:	89 50 04             	mov    %edx,0x4(%eax)
    7135:	8b 45 08             	mov    0x8(%ebp),%eax
    7138:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    713e:	85 c0                	test   %eax,%eax
    7140:	0f 84 78 01 00 00    	je     72be <tty_dev_write+0x1f4>
    7146:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    714a:	3c 20                	cmp    $0x20,%al
    714c:	76 08                	jbe    7156 <tty_dev_write+0x8c>
    714e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7152:	3c 7e                	cmp    $0x7e,%al
    7154:	76 10                	jbe    7166 <tty_dev_write+0x9c>
    7156:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    715a:	3c 20                	cmp    $0x20,%al
    715c:	74 08                	je     7166 <tty_dev_write+0x9c>
    715e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7162:	84 c0                	test   %al,%al
    7164:	75 7b                	jne    71e1 <tty_dev_write+0x117>
    7166:	83 ec 08             	sub    $0x8,%esp
    7169:	8d 45 f3             	lea    -0xd(%ebp),%eax
    716c:	50                   	push   %eax
    716d:	6a 00                	push   $0x0
    716f:	e8 a7 f8 ff ff       	call   6a1b <v2l>
    7174:	83 c4 10             	add    $0x10,%esp
    7177:	89 c1                	mov    %eax,%ecx
    7179:	8b 45 08             	mov    0x8(%ebp),%eax
    717c:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
    7182:	8b 45 08             	mov    0x8(%ebp),%eax
    7185:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    718b:	01 d0                	add    %edx,%eax
    718d:	83 ec 04             	sub    $0x4,%esp
    7190:	6a 01                	push   $0x1
    7192:	51                   	push   %ecx
    7193:	50                   	push   %eax
    7194:	e8 12 20 00 00       	call   91ab <Memcpy>
    7199:	83 c4 10             	add    $0x10,%esp
    719c:	8b 45 08             	mov    0x8(%ebp),%eax
    719f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    71a5:	8d 50 ff             	lea    -0x1(%eax),%edx
    71a8:	8b 45 08             	mov    0x8(%ebp),%eax
    71ab:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    71b1:	8b 45 08             	mov    0x8(%ebp),%eax
    71b4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    71ba:	8d 50 01             	lea    0x1(%eax),%edx
    71bd:	8b 45 08             	mov    0x8(%ebp),%eax
    71c0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    71c6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    71ca:	0f b6 c0             	movzbl %al,%eax
    71cd:	83 ec 08             	sub    $0x8,%esp
    71d0:	50                   	push   %eax
    71d1:	ff 75 08             	pushl  0x8(%ebp)
    71d4:	e8 20 fd ff ff       	call   6ef9 <out_char>
    71d9:	83 c4 10             	add    $0x10,%esp
    71dc:	e9 dd 00 00 00       	jmp    72be <tty_dev_write+0x1f4>
    71e1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    71e5:	3c 08                	cmp    $0x8,%al
    71e7:	75 45                	jne    722e <tty_dev_write+0x164>
    71e9:	8b 45 08             	mov    0x8(%ebp),%eax
    71ec:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
    71f2:	8d 50 01             	lea    0x1(%eax),%edx
    71f5:	8b 45 08             	mov    0x8(%ebp),%eax
    71f8:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    71fe:	8b 45 08             	mov    0x8(%ebp),%eax
    7201:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    7207:	8d 50 ff             	lea    -0x1(%eax),%edx
    720a:	8b 45 08             	mov    0x8(%ebp),%eax
    720d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    7213:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7217:	0f b6 c0             	movzbl %al,%eax
    721a:	83 ec 08             	sub    $0x8,%esp
    721d:	50                   	push   %eax
    721e:	ff 75 08             	pushl  0x8(%ebp)
    7221:	e8 d3 fc ff ff       	call   6ef9 <out_char>
    7226:	83 c4 10             	add    $0x10,%esp
    7229:	e9 90 00 00 00       	jmp    72be <tty_dev_write+0x1f4>
    722e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    7232:	3c 0a                	cmp    $0xa,%al
    7234:	74 10                	je     7246 <tty_dev_write+0x17c>
    7236:	8b 45 08             	mov    0x8(%ebp),%eax
    7239:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
    723f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7242:	39 c2                	cmp    %eax,%edx
    7244:	75 78                	jne    72be <tty_dev_write+0x1f4>
    7246:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    724a:	0f b6 c0             	movzbl %al,%eax
    724d:	83 ec 08             	sub    $0x8,%esp
    7250:	50                   	push   %eax
    7251:	ff 75 08             	pushl  0x8(%ebp)
    7254:	e8 a0 fc ff ff       	call   6ef9 <out_char>
    7259:	83 c4 10             	add    $0x10,%esp
    725c:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
    7263:	8b 45 08             	mov    0x8(%ebp),%eax
    7266:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    726c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    726f:	8b 45 08             	mov    0x8(%ebp),%eax
    7272:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
    7278:	89 45 dc             	mov    %eax,-0x24(%ebp)
    727b:	8b 45 08             	mov    0x8(%ebp),%eax
    727e:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
    7284:	89 45 94             	mov    %eax,-0x6c(%ebp)
    7287:	8b 45 08             	mov    0x8(%ebp),%eax
    728a:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
    7291:	00 00 00 
    7294:	8b 45 08             	mov    0x8(%ebp),%eax
    7297:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    729e:	00 00 00 
    72a1:	8b 45 08             	mov    0x8(%ebp),%eax
    72a4:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
    72aa:	83 ec 04             	sub    $0x4,%esp
    72ad:	50                   	push   %eax
    72ae:	8d 45 84             	lea    -0x7c(%ebp),%eax
    72b1:	50                   	push   %eax
    72b2:	6a 01                	push   $0x1
    72b4:	e8 65 c5 ff ff       	call   381e <send_rec>
    72b9:	83 c4 10             	add    $0x10,%esp
    72bc:	eb 11                	jmp    72cf <tty_dev_write+0x205>
    72be:	8b 45 08             	mov    0x8(%ebp),%eax
    72c1:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    72c7:	85 c0                	test   %eax,%eax
    72c9:	0f 85 15 fe ff ff    	jne    70e4 <tty_dev_write+0x1a>
    72cf:	c9                   	leave  
    72d0:	c3                   	ret    

000072d1 <tty_do_read>:
    72d1:	55                   	push   %ebp
    72d2:	89 e5                	mov    %esp,%ebp
    72d4:	83 ec 08             	sub    $0x8,%esp
    72d7:	8b 45 08             	mov    0x8(%ebp),%eax
    72da:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    72e1:	00 00 00 
    72e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    72e7:	8b 50 58             	mov    0x58(%eax),%edx
    72ea:	8b 45 08             	mov    0x8(%ebp),%eax
    72ed:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
    72f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    72f6:	8b 00                	mov    (%eax),%eax
    72f8:	89 c2                	mov    %eax,%edx
    72fa:	8b 45 08             	mov    0x8(%ebp),%eax
    72fd:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
    7303:	8b 45 0c             	mov    0xc(%ebp),%eax
    7306:	8b 50 50             	mov    0x50(%eax),%edx
    7309:	8b 45 08             	mov    0x8(%ebp),%eax
    730c:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
    7312:	8b 45 0c             	mov    0xc(%ebp),%eax
    7315:	8b 40 10             	mov    0x10(%eax),%eax
    7318:	89 c2                	mov    %eax,%edx
    731a:	8b 45 08             	mov    0x8(%ebp),%eax
    731d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
    7323:	83 ec 08             	sub    $0x8,%esp
    7326:	52                   	push   %edx
    7327:	50                   	push   %eax
    7328:	e8 ee f6 ff ff       	call   6a1b <v2l>
    732d:	83 c4 10             	add    $0x10,%esp
    7330:	89 c2                	mov    %eax,%edx
    7332:	8b 45 08             	mov    0x8(%ebp),%eax
    7335:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
    733b:	8b 45 0c             	mov    0xc(%ebp),%eax
    733e:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
    7345:	8b 45 08             	mov    0x8(%ebp),%eax
    7348:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
    734e:	83 ec 04             	sub    $0x4,%esp
    7351:	50                   	push   %eax
    7352:	ff 75 0c             	pushl  0xc(%ebp)
    7355:	6a 01                	push   $0x1
    7357:	e8 c2 c4 ff ff       	call   381e <send_rec>
    735c:	83 c4 10             	add    $0x10,%esp
    735f:	90                   	nop
    7360:	c9                   	leave  
    7361:	c3                   	ret    

00007362 <tty_do_write>:
    7362:	55                   	push   %ebp
    7363:	89 e5                	mov    %esp,%ebp
    7365:	53                   	push   %ebx
    7366:	81 ec 94 00 00 00    	sub    $0x94,%esp
    736c:	89 e0                	mov    %esp,%eax
    736e:	89 c3                	mov    %eax,%ebx
    7370:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
    7377:	8b 45 e8             	mov    -0x18(%ebp),%eax
    737a:	8d 50 ff             	lea    -0x1(%eax),%edx
    737d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    7380:	89 c2                	mov    %eax,%edx
    7382:	b8 10 00 00 00       	mov    $0x10,%eax
    7387:	83 e8 01             	sub    $0x1,%eax
    738a:	01 d0                	add    %edx,%eax
    738c:	b9 10 00 00 00       	mov    $0x10,%ecx
    7391:	ba 00 00 00 00       	mov    $0x0,%edx
    7396:	f7 f1                	div    %ecx
    7398:	6b c0 10             	imul   $0x10,%eax,%eax
    739b:	29 c4                	sub    %eax,%esp
    739d:	89 e0                	mov    %esp,%eax
    739f:	83 c0 00             	add    $0x0,%eax
    73a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    73a5:	83 ec 04             	sub    $0x4,%esp
    73a8:	ff 75 e8             	pushl  -0x18(%ebp)
    73ab:	6a 00                	push   $0x0
    73ad:	ff 75 e0             	pushl  -0x20(%ebp)
    73b0:	e8 24 1e 00 00       	call   91d9 <Memset>
    73b5:	83 c4 10             	add    $0x10,%esp
    73b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    73bb:	8b 40 50             	mov    0x50(%eax),%eax
    73be:	89 45 ec             	mov    %eax,-0x14(%ebp)
    73c1:	8b 45 08             	mov    0x8(%ebp),%eax
    73c4:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
    73cb:	00 00 00 
    73ce:	e9 98 00 00 00       	jmp    746b <tty_do_write+0x109>
    73d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    73d6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    73d9:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
    73dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    73e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    73e3:	8b 40 10             	mov    0x10(%eax),%eax
    73e6:	89 c2                	mov    %eax,%edx
    73e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    73eb:	8b 40 58             	mov    0x58(%eax),%eax
    73ee:	83 ec 08             	sub    $0x8,%esp
    73f1:	52                   	push   %edx
    73f2:	50                   	push   %eax
    73f3:	e8 23 f6 ff ff       	call   6a1b <v2l>
    73f8:	83 c4 10             	add    $0x10,%esp
    73fb:	89 c2                	mov    %eax,%edx
    73fd:	8b 45 08             	mov    0x8(%ebp),%eax
    7400:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    7406:	01 d0                	add    %edx,%eax
    7408:	83 ec 04             	sub    $0x4,%esp
    740b:	ff 75 f0             	pushl  -0x10(%ebp)
    740e:	50                   	push   %eax
    740f:	ff 75 e0             	pushl  -0x20(%ebp)
    7412:	e8 94 1d 00 00       	call   91ab <Memcpy>
    7417:	83 c4 10             	add    $0x10,%esp
    741a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    741d:	29 45 ec             	sub    %eax,-0x14(%ebp)
    7420:	8b 45 08             	mov    0x8(%ebp),%eax
    7423:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
    7429:	8b 45 f0             	mov    -0x10(%ebp),%eax
    742c:	01 c2                	add    %eax,%edx
    742e:	8b 45 08             	mov    0x8(%ebp),%eax
    7431:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
    7437:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    743e:	eb 25                	jmp    7465 <tty_do_write+0x103>
    7440:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7443:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7446:	01 d0                	add    %edx,%eax
    7448:	0f b6 00             	movzbl (%eax),%eax
    744b:	0f b6 c0             	movzbl %al,%eax
    744e:	83 ec 08             	sub    $0x8,%esp
    7451:	50                   	push   %eax
    7452:	ff 75 08             	pushl  0x8(%ebp)
    7455:	e8 9f fa ff ff       	call   6ef9 <out_char>
    745a:	83 c4 10             	add    $0x10,%esp
    745d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7461:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    7465:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    7469:	75 d5                	jne    7440 <tty_do_write+0xde>
    746b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    746f:	0f 85 5e ff ff ff    	jne    73d3 <tty_do_write+0x71>
    7475:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
    747c:	8b 45 08             	mov    0x8(%ebp),%eax
    747f:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
    7485:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7488:	8b 45 0c             	mov    0xc(%ebp),%eax
    748b:	8b 00                	mov    (%eax),%eax
    748d:	83 ec 04             	sub    $0x4,%esp
    7490:	50                   	push   %eax
    7491:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
    7497:	50                   	push   %eax
    7498:	6a 01                	push   $0x1
    749a:	e8 7f c3 ff ff       	call   381e <send_rec>
    749f:	83 c4 10             	add    $0x10,%esp
    74a2:	89 dc                	mov    %ebx,%esp
    74a4:	90                   	nop
    74a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    74a8:	c9                   	leave  
    74a9:	c3                   	ret    

000074aa <init_screen>:
    74aa:	55                   	push   %ebp
    74ab:	89 e5                	mov    %esp,%ebp
    74ad:	83 ec 10             	sub    $0x10,%esp
    74b0:	8b 45 08             	mov    0x8(%ebp),%eax
    74b3:	2d 80 dd 00 00       	sub    $0xdd80,%eax
    74b8:	c1 f8 02             	sar    $0x2,%eax
    74bb:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
    74c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    74c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    74c7:	c1 e0 04             	shl    $0x4,%eax
    74ca:	8d 90 a0 fe 00 00    	lea    0xfea0(%eax),%edx
    74d0:	8b 45 08             	mov    0x8(%ebp),%eax
    74d3:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
    74d9:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
    74e0:	8b 45 08             	mov    0x8(%ebp),%eax
    74e3:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
    74e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    74ec:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    74f1:	f7 e2                	mul    %edx
    74f3:	89 d0                	mov    %edx,%eax
    74f5:	d1 e8                	shr    %eax
    74f7:	89 41 04             	mov    %eax,0x4(%ecx)
    74fa:	8b 45 08             	mov    0x8(%ebp),%eax
    74fd:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7503:	8b 50 04             	mov    0x4(%eax),%edx
    7506:	8b 45 08             	mov    0x8(%ebp),%eax
    7509:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    750f:	0f af 55 fc          	imul   -0x4(%ebp),%edx
    7513:	89 10                	mov    %edx,(%eax)
    7515:	8b 45 08             	mov    0x8(%ebp),%eax
    7518:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
    751e:	8b 45 08             	mov    0x8(%ebp),%eax
    7521:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
    7527:	8b 12                	mov    (%edx),%edx
    7529:	89 50 08             	mov    %edx,0x8(%eax)
    752c:	8b 55 08             	mov    0x8(%ebp),%edx
    752f:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
    7535:	8b 40 08             	mov    0x8(%eax),%eax
    7538:	89 42 0c             	mov    %eax,0xc(%edx)
    753b:	90                   	nop
    753c:	c9                   	leave  
    753d:	c3                   	ret    

0000753e <init_tty>:
    753e:	55                   	push   %ebp
    753f:	89 e5                	mov    %esp,%ebp
    7541:	83 ec 18             	sub    $0x18,%esp
    7544:	c7 45 f4 80 dd 00 00 	movl   $0xdd80,-0xc(%ebp)
    754b:	eb 7a                	jmp    75c7 <init_tty+0x89>
    754d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7550:	8d 50 08             	lea    0x8(%eax),%edx
    7553:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7556:	89 50 04             	mov    %edx,0x4(%eax)
    7559:	8b 45 f4             	mov    -0xc(%ebp),%eax
    755c:	8b 50 04             	mov    0x4(%eax),%edx
    755f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7562:	89 10                	mov    %edx,(%eax)
    7564:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7567:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
    756e:	00 00 00 
    7571:	ff 75 f4             	pushl  -0xc(%ebp)
    7574:	e8 31 ff ff ff       	call   74aa <init_screen>
    7579:	83 c4 04             	add    $0x4,%esp
    757c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    757f:	2d 80 dd 00 00       	sub    $0xdd80,%eax
    7584:	85 c0                	test   %eax,%eax
    7586:	7e 38                	jle    75c0 <init_tty+0x82>
    7588:	83 ec 08             	sub    $0x8,%esp
    758b:	6a 23                	push   $0x23
    758d:	ff 75 f4             	pushl  -0xc(%ebp)
    7590:	e8 64 f9 ff ff       	call   6ef9 <out_char>
    7595:	83 c4 10             	add    $0x10,%esp
    7598:	8b 45 f4             	mov    -0xc(%ebp),%eax
    759b:	05 e4 8e 01 00       	add    $0x18ee4,%eax
    75a0:	2d 80 dd 00 00       	sub    $0xdd80,%eax
    75a5:	c1 f8 02             	sar    $0x2,%eax
    75a8:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
    75ae:	0f b6 c0             	movzbl %al,%eax
    75b1:	83 ec 08             	sub    $0x8,%esp
    75b4:	50                   	push   %eax
    75b5:	ff 75 f4             	pushl  -0xc(%ebp)
    75b8:	e8 3c f9 ff ff       	call   6ef9 <out_char>
    75bd:	83 c4 10             	add    $0x10,%esp
    75c0:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
    75c7:	b8 ec f5 00 00       	mov    $0xf5ec,%eax
    75cc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    75cf:	0f 82 78 ff ff ff    	jb     754d <init_tty+0xf>
    75d5:	90                   	nop
    75d6:	c9                   	leave  
    75d7:	c3                   	ret    

000075d8 <TaskTTY>:
    75d8:	55                   	push   %ebp
    75d9:	89 e5                	mov    %esp,%ebp
    75db:	81 ec 88 00 00 00    	sub    $0x88,%esp
    75e1:	e8 58 ff ff ff       	call   753e <init_tty>
    75e6:	83 ec 0c             	sub    $0xc,%esp
    75e9:	6a 01                	push   $0x1
    75eb:	e8 bf f6 ff ff       	call   6caf <select_console>
    75f0:	83 c4 10             	add    $0x10,%esp
    75f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    75fa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7601:	c7 45 f4 80 dd 00 00 	movl   $0xdd80,-0xc(%ebp)
    7608:	eb 30                	jmp    763a <TaskTTY+0x62>
    760a:	83 ec 0c             	sub    $0xc,%esp
    760d:	ff 75 f4             	pushl  -0xc(%ebp)
    7610:	e8 8b fa ff ff       	call   70a0 <tty_dev_read>
    7615:	83 c4 10             	add    $0x10,%esp
    7618:	83 ec 0c             	sub    $0xc,%esp
    761b:	ff 75 f4             	pushl  -0xc(%ebp)
    761e:	e8 a7 fa ff ff       	call   70ca <tty_dev_write>
    7623:	83 c4 10             	add    $0x10,%esp
    7626:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7629:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
    762f:	85 c0                	test   %eax,%eax
    7631:	75 d7                	jne    760a <TaskTTY+0x32>
    7633:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
    763a:	b8 ec f5 00 00       	mov    $0xf5ec,%eax
    763f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    7642:	72 c6                	jb     760a <TaskTTY+0x32>
    7644:	83 ec 04             	sub    $0x4,%esp
    7647:	6a 10                	push   $0x10
    7649:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    764f:	50                   	push   %eax
    7650:	6a 02                	push   $0x2
    7652:	e8 c7 c1 ff ff       	call   381e <send_rec>
    7657:	83 c4 10             	add    $0x10,%esp
    765a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    765d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7660:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
    7667:	74 28                	je     7691 <TaskTTY+0xb9>
    7669:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
    7670:	7f 0b                	jg     767d <TaskTTY+0xa5>
    7672:	81 7d e8 d1 07 00 00 	cmpl   $0x7d1,-0x18(%ebp)
    7679:	74 56                	je     76d1 <TaskTTY+0xf9>
    767b:	eb 55                	jmp    76d2 <TaskTTY+0xfa>
    767d:	81 7d e8 d3 07 00 00 	cmpl   $0x7d3,-0x18(%ebp)
    7684:	74 25                	je     76ab <TaskTTY+0xd3>
    7686:	81 7d e8 d5 07 00 00 	cmpl   $0x7d5,-0x18(%ebp)
    768d:	74 36                	je     76c5 <TaskTTY+0xed>
    768f:	eb 41                	jmp    76d2 <TaskTTY+0xfa>
    7691:	a1 20 d7 00 00       	mov    0xd720,%eax
    7696:	83 ec 08             	sub    $0x8,%esp
    7699:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
    769f:	52                   	push   %edx
    76a0:	50                   	push   %eax
    76a1:	e8 2b fc ff ff       	call   72d1 <tty_do_read>
    76a6:	83 c4 10             	add    $0x10,%esp
    76a9:	eb 27                	jmp    76d2 <TaskTTY+0xfa>
    76ab:	a1 20 d7 00 00       	mov    0xd720,%eax
    76b0:	83 ec 08             	sub    $0x8,%esp
    76b3:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
    76b9:	52                   	push   %edx
    76ba:	50                   	push   %eax
    76bb:	e8 a2 fc ff ff       	call   7362 <tty_do_write>
    76c0:	83 c4 10             	add    $0x10,%esp
    76c3:	eb 0d                	jmp    76d2 <TaskTTY+0xfa>
    76c5:	c7 05 70 f6 00 00 00 	movl   $0x0,0xf670
    76cc:	00 00 00 
    76cf:	eb 01                	jmp    76d2 <TaskTTY+0xfa>
    76d1:	90                   	nop
    76d2:	e9 2a ff ff ff       	jmp    7601 <TaskTTY+0x29>

000076d7 <keyboard_handler>:
    76d7:	55                   	push   %ebp
    76d8:	89 e5                	mov    %esp,%ebp
    76da:	83 ec 18             	sub    $0x18,%esp
    76dd:	c7 05 70 f6 00 00 01 	movl   $0x1,0xf670
    76e4:	00 00 00 
    76e7:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
    76ee:	a1 68 db 00 00       	mov    0xdb68,%eax
    76f3:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    76f8:	7f 5c                	jg     7756 <keyboard_handler+0x7f>
    76fa:	e8 02 9c ff ff       	call   1301 <disable_int>
    76ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7702:	0f b7 c0             	movzwl %ax,%eax
    7705:	83 ec 0c             	sub    $0xc,%esp
    7708:	50                   	push   %eax
    7709:	e8 c5 9b ff ff       	call   12d3 <in_byte>
    770e:	83 c4 10             	add    $0x10,%esp
    7711:	88 45 f3             	mov    %al,-0xd(%ebp)
    7714:	a1 60 db 00 00       	mov    0xdb60,%eax
    7719:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
    771d:	88 10                	mov    %dl,(%eax)
    771f:	a1 60 db 00 00       	mov    0xdb60,%eax
    7724:	83 c0 01             	add    $0x1,%eax
    7727:	a3 60 db 00 00       	mov    %eax,0xdb60
    772c:	a1 68 db 00 00       	mov    0xdb68,%eax
    7731:	83 c0 01             	add    $0x1,%eax
    7734:	a3 68 db 00 00       	mov    %eax,0xdb68
    7739:	a1 60 db 00 00       	mov    0xdb60,%eax
    773e:	ba 6c dd 00 00       	mov    $0xdd6c,%edx
    7743:	39 d0                	cmp    %edx,%eax
    7745:	72 0a                	jb     7751 <keyboard_handler+0x7a>
    7747:	c7 05 60 db 00 00 6c 	movl   $0xdb6c,0xdb60
    774e:	db 00 00 
    7751:	e8 ad 9b ff ff       	call   1303 <enable_int>
    7756:	90                   	nop
    7757:	c9                   	leave  
    7758:	c3                   	ret    

00007759 <read_from_keyboard_buf>:
    7759:	55                   	push   %ebp
    775a:	89 e5                	mov    %esp,%ebp
    775c:	83 ec 18             	sub    $0x18,%esp
    775f:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
    7763:	a1 68 db 00 00       	mov    0xdb68,%eax
    7768:	85 c0                	test   %eax,%eax
    776a:	7e 47                	jle    77b3 <read_from_keyboard_buf+0x5a>
    776c:	e8 90 9b ff ff       	call   1301 <disable_int>
    7771:	a1 64 db 00 00       	mov    0xdb64,%eax
    7776:	0f b6 00             	movzbl (%eax),%eax
    7779:	88 45 f7             	mov    %al,-0x9(%ebp)
    777c:	a1 64 db 00 00       	mov    0xdb64,%eax
    7781:	83 c0 01             	add    $0x1,%eax
    7784:	a3 64 db 00 00       	mov    %eax,0xdb64
    7789:	a1 68 db 00 00       	mov    0xdb68,%eax
    778e:	83 e8 01             	sub    $0x1,%eax
    7791:	a3 68 db 00 00       	mov    %eax,0xdb68
    7796:	a1 64 db 00 00       	mov    0xdb64,%eax
    779b:	ba 6c dd 00 00       	mov    $0xdd6c,%edx
    77a0:	39 d0                	cmp    %edx,%eax
    77a2:	72 0a                	jb     77ae <read_from_keyboard_buf+0x55>
    77a4:	c7 05 64 db 00 00 6c 	movl   $0xdb6c,0xdb64
    77ab:	db 00 00 
    77ae:	e8 50 9b ff ff       	call   1303 <enable_int>
    77b3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    77b7:	c9                   	leave  
    77b8:	c3                   	ret    

000077b9 <keyboard_read>:
    77b9:	55                   	push   %ebp
    77ba:	89 e5                	mov    %esp,%ebp
    77bc:	83 ec 28             	sub    $0x28,%esp
    77bf:	90                   	nop
    77c0:	a1 68 db 00 00       	mov    0xdb68,%eax
    77c5:	85 c0                	test   %eax,%eax
    77c7:	7e f7                	jle    77c0 <keyboard_read+0x7>
    77c9:	e8 8b ff ff ff       	call   7759 <read_from_keyboard_buf>
    77ce:	88 45 ea             	mov    %al,-0x16(%ebp)
    77d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    77d8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    77dc:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
    77e0:	75 5a                	jne    783c <keyboard_read+0x83>
    77e2:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
    77e6:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
    77ea:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
    77ee:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
    77f2:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
    77f6:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
    77fa:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
    77fe:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    7805:	eb 20                	jmp    7827 <keyboard_read+0x6e>
    7807:	e8 4d ff ff ff       	call   7759 <read_from_keyboard_buf>
    780c:	89 c1                	mov    %eax,%ecx
    780e:	8d 55 e3             	lea    -0x1d(%ebp),%edx
    7811:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7814:	01 d0                	add    %edx,%eax
    7816:	0f b6 00             	movzbl (%eax),%eax
    7819:	38 c1                	cmp    %al,%cl
    781b:	74 06                	je     7823 <keyboard_read+0x6a>
    781d:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    7821:	eb 0a                	jmp    782d <keyboard_read+0x74>
    7823:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7827:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
    782b:	7e da                	jle    7807 <keyboard_read+0x4e>
    782d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
    7831:	74 68                	je     789b <keyboard_read+0xe2>
    7833:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
    783a:	eb 5f                	jmp    789b <keyboard_read+0xe2>
    783c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
    7840:	75 59                	jne    789b <keyboard_read+0xe2>
    7842:	e8 12 ff ff ff       	call   7759 <read_from_keyboard_buf>
    7847:	3c 2a                	cmp    $0x2a,%al
    7849:	75 1d                	jne    7868 <keyboard_read+0xaf>
    784b:	e8 09 ff ff ff       	call   7759 <read_from_keyboard_buf>
    7850:	3c e0                	cmp    $0xe0,%al
    7852:	75 14                	jne    7868 <keyboard_read+0xaf>
    7854:	e8 00 ff ff ff       	call   7759 <read_from_keyboard_buf>
    7859:	3c 37                	cmp    $0x37,%al
    785b:	75 0b                	jne    7868 <keyboard_read+0xaf>
    785d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    7864:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    7868:	e8 ec fe ff ff       	call   7759 <read_from_keyboard_buf>
    786d:	3c b7                	cmp    $0xb7,%al
    786f:	75 1d                	jne    788e <keyboard_read+0xd5>
    7871:	e8 e3 fe ff ff       	call   7759 <read_from_keyboard_buf>
    7876:	3c e0                	cmp    $0xe0,%al
    7878:	75 14                	jne    788e <keyboard_read+0xd5>
    787a:	e8 da fe ff ff       	call   7759 <read_from_keyboard_buf>
    787f:	3c aa                	cmp    $0xaa,%al
    7881:	75 0b                	jne    788e <keyboard_read+0xd5>
    7883:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    788a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    788e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7892:	75 07                	jne    789b <keyboard_read+0xe2>
    7894:	c6 05 24 d7 00 00 01 	movb   $0x1,0xd724
    789b:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
    78a2:	0f 84 8d 00 00 00    	je     7935 <keyboard_read+0x17c>
    78a8:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
    78af:	0f 84 80 00 00 00    	je     7935 <keyboard_read+0x17c>
    78b5:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
    78b9:	0f 94 c2             	sete   %dl
    78bc:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
    78c0:	0f 94 c0             	sete   %al
    78c3:	09 d0                	or     %edx,%eax
    78c5:	84 c0                	test   %al,%al
    78c7:	74 07                	je     78d0 <keyboard_read+0x117>
    78c9:	c6 05 74 f6 00 00 01 	movb   $0x1,0xf674
    78d0:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    78d4:	f7 d0                	not    %eax
    78d6:	c0 e8 07             	shr    $0x7,%al
    78d9:	88 45 e9             	mov    %al,-0x17(%ebp)
    78dc:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
    78e0:	74 53                	je     7935 <keyboard_read+0x17c>
    78e2:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
    78e6:	74 4d                	je     7935 <keyboard_read+0x17c>
    78e8:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
    78ec:	0f b6 05 74 f6 00 00 	movzbl 0xf674,%eax
    78f3:	3c 01                	cmp    $0x1,%al
    78f5:	75 04                	jne    78fb <keyboard_read+0x142>
    78f7:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    78fb:	0f b6 05 24 d7 00 00 	movzbl 0xd724,%eax
    7902:	84 c0                	test   %al,%al
    7904:	74 04                	je     790a <keyboard_read+0x151>
    7906:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
    790a:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
    790e:	89 d0                	mov    %edx,%eax
    7910:	01 c0                	add    %eax,%eax
    7912:	01 c2                	add    %eax,%edx
    7914:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    7918:	01 d0                	add    %edx,%eax
    791a:	8b 04 85 00 c1 00 00 	mov    0xc100(,%eax,4),%eax
    7921:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7924:	83 ec 08             	sub    $0x8,%esp
    7927:	ff 75 f4             	pushl  -0xc(%ebp)
    792a:	ff 75 08             	pushl  0x8(%ebp)
    792d:	e8 1a 00 00 00       	call   794c <in_process>
    7932:	83 c4 10             	add    $0x10,%esp
    7935:	90                   	nop
    7936:	c9                   	leave  
    7937:	c3                   	ret    

00007938 <init_keyboard_handler>:
    7938:	55                   	push   %ebp
    7939:	89 e5                	mov    %esp,%ebp
    793b:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    7942:	c6 05 74 f6 00 00 00 	movb   $0x0,0xf674
    7949:	90                   	nop
    794a:	5d                   	pop    %ebp
    794b:	c3                   	ret    

0000794c <in_process>:
    794c:	55                   	push   %ebp
    794d:	89 e5                	mov    %esp,%ebp
    794f:	83 ec 18             	sub    $0x18,%esp
    7952:	83 ec 04             	sub    $0x4,%esp
    7955:	6a 02                	push   $0x2
    7957:	6a 00                	push   $0x0
    7959:	8d 45 f6             	lea    -0xa(%ebp),%eax
    795c:	50                   	push   %eax
    795d:	e8 77 18 00 00       	call   91d9 <Memset>
    7962:	83 c4 10             	add    $0x10,%esp
    7965:	8b 45 0c             	mov    0xc(%ebp),%eax
    7968:	25 00 01 00 00       	and    $0x100,%eax
    796d:	85 c0                	test   %eax,%eax
    796f:	75 28                	jne    7999 <in_process+0x4d>
    7971:	8b 45 0c             	mov    0xc(%ebp),%eax
    7974:	0f b6 c0             	movzbl %al,%eax
    7977:	83 ec 08             	sub    $0x8,%esp
    797a:	50                   	push   %eax
    797b:	ff 75 08             	pushl  0x8(%ebp)
    797e:	e8 5d f4 ff ff       	call   6de0 <put_key>
    7983:	83 c4 10             	add    $0x10,%esp
    7986:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    798d:	c6 05 74 f6 00 00 00 	movb   $0x0,0xf674
    7994:	e9 42 01 00 00       	jmp    7adb <in_process+0x18f>
    7999:	0f b6 05 74 f6 00 00 	movzbl 0xf674,%eax
    79a0:	84 c0                	test   %al,%al
    79a2:	0f 84 a9 00 00 00    	je     7a51 <in_process+0x105>
    79a8:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
    79ac:	0f 84 9f 00 00 00    	je     7a51 <in_process+0x105>
    79b2:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
    79b6:	0f 84 95 00 00 00    	je     7a51 <in_process+0x105>
    79bc:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    79c3:	74 64                	je     7a29 <in_process+0xdd>
    79c5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    79cc:	77 0b                	ja     79d9 <in_process+0x8d>
    79ce:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    79d5:	74 64                	je     7a3b <in_process+0xef>
    79d7:	eb 73                	jmp    7a4c <in_process+0x100>
    79d9:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
    79e0:	74 0b                	je     79ed <in_process+0xa1>
    79e2:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
    79e9:	74 20                	je     7a0b <in_process+0xbf>
    79eb:	eb 5f                	jmp    7a4c <in_process+0x100>
    79ed:	83 ec 0c             	sub    $0xc,%esp
    79f0:	ff 75 08             	pushl  0x8(%ebp)
    79f3:	e8 54 f4 ff ff       	call   6e4c <scroll_up>
    79f8:	83 c4 10             	add    $0x10,%esp
    79fb:	c6 05 74 f6 00 00 00 	movb   $0x0,0xf674
    7a02:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    7a09:	eb 41                	jmp    7a4c <in_process+0x100>
    7a0b:	83 ec 0c             	sub    $0xc,%esp
    7a0e:	ff 75 08             	pushl  0x8(%ebp)
    7a11:	e8 78 f4 ff ff       	call   6e8e <scroll_down>
    7a16:	83 c4 10             	add    $0x10,%esp
    7a19:	c6 05 74 f6 00 00 00 	movb   $0x0,0xf674
    7a20:	c6 05 24 d7 00 00 00 	movb   $0x0,0xd724
    7a27:	eb 23                	jmp    7a4c <in_process+0x100>
    7a29:	83 ec 08             	sub    $0x8,%esp
    7a2c:	6a 0a                	push   $0xa
    7a2e:	ff 75 08             	pushl  0x8(%ebp)
    7a31:	e8 c3 f4 ff ff       	call   6ef9 <out_char>
    7a36:	83 c4 10             	add    $0x10,%esp
    7a39:	eb 11                	jmp    7a4c <in_process+0x100>
    7a3b:	83 ec 08             	sub    $0x8,%esp
    7a3e:	6a 08                	push   $0x8
    7a40:	ff 75 08             	pushl  0x8(%ebp)
    7a43:	e8 b1 f4 ff ff       	call   6ef9 <out_char>
    7a48:	83 c4 10             	add    $0x10,%esp
    7a4b:	90                   	nop
    7a4c:	e9 8a 00 00 00       	jmp    7adb <in_process+0x18f>
    7a51:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    7a58:	74 55                	je     7aaf <in_process+0x163>
    7a5a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    7a61:	77 14                	ja     7a77 <in_process+0x12b>
    7a63:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    7a6a:	74 31                	je     7a9d <in_process+0x151>
    7a6c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    7a73:	74 16                	je     7a8b <in_process+0x13f>
    7a75:	eb 64                	jmp    7adb <in_process+0x18f>
    7a77:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
    7a7e:	74 3e                	je     7abe <in_process+0x172>
    7a80:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
    7a87:	74 44                	je     7acd <in_process+0x181>
    7a89:	eb 50                	jmp    7adb <in_process+0x18f>
    7a8b:	83 ec 08             	sub    $0x8,%esp
    7a8e:	6a 0a                	push   $0xa
    7a90:	ff 75 08             	pushl  0x8(%ebp)
    7a93:	e8 48 f3 ff ff       	call   6de0 <put_key>
    7a98:	83 c4 10             	add    $0x10,%esp
    7a9b:	eb 3e                	jmp    7adb <in_process+0x18f>
    7a9d:	83 ec 08             	sub    $0x8,%esp
    7aa0:	6a 08                	push   $0x8
    7aa2:	ff 75 08             	pushl  0x8(%ebp)
    7aa5:	e8 36 f3 ff ff       	call   6de0 <put_key>
    7aaa:	83 c4 10             	add    $0x10,%esp
    7aad:	eb 2c                	jmp    7adb <in_process+0x18f>
    7aaf:	83 ec 0c             	sub    $0xc,%esp
    7ab2:	6a 00                	push   $0x0
    7ab4:	e8 f6 f1 ff ff       	call   6caf <select_console>
    7ab9:	83 c4 10             	add    $0x10,%esp
    7abc:	eb 1d                	jmp    7adb <in_process+0x18f>
    7abe:	83 ec 0c             	sub    $0xc,%esp
    7ac1:	6a 01                	push   $0x1
    7ac3:	e8 e7 f1 ff ff       	call   6caf <select_console>
    7ac8:	83 c4 10             	add    $0x10,%esp
    7acb:	eb 0e                	jmp    7adb <in_process+0x18f>
    7acd:	83 ec 0c             	sub    $0xc,%esp
    7ad0:	6a 02                	push   $0x2
    7ad2:	e8 d8 f1 ff ff       	call   6caf <select_console>
    7ad7:	83 c4 10             	add    $0x10,%esp
    7ada:	90                   	nop
    7adb:	90                   	nop
    7adc:	c9                   	leave  
    7add:	c3                   	ret    

00007ade <open>:
    7ade:	55                   	push   %ebp
    7adf:	89 e5                	mov    %esp,%ebp
    7ae1:	83 ec 78             	sub    $0x78,%esp
    7ae4:	83 ec 04             	sub    $0x4,%esp
    7ae7:	6a 6c                	push   $0x6c
    7ae9:	6a 00                	push   $0x0
    7aeb:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7aee:	50                   	push   %eax
    7aef:	e8 e5 16 00 00       	call   91d9 <Memset>
    7af4:	83 c4 10             	add    $0x10,%esp
    7af7:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7afe:	8b 45 08             	mov    0x8(%ebp),%eax
    7b01:	89 45 c0             	mov    %eax,-0x40(%ebp)
    7b04:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b07:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7b0a:	83 ec 0c             	sub    $0xc,%esp
    7b0d:	ff 75 08             	pushl  0x8(%ebp)
    7b10:	e8 fd 16 00 00       	call   9212 <Strlen>
    7b15:	83 c4 10             	add    $0x10,%esp
    7b18:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7b1b:	83 ec 04             	sub    $0x4,%esp
    7b1e:	6a 03                	push   $0x3
    7b20:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7b23:	50                   	push   %eax
    7b24:	6a 03                	push   $0x3
    7b26:	e8 f3 bc ff ff       	call   381e <send_rec>
    7b2b:	83 c4 10             	add    $0x10,%esp
    7b2e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7b31:	c9                   	leave  
    7b32:	c3                   	ret    

00007b33 <read>:
    7b33:	55                   	push   %ebp
    7b34:	89 e5                	mov    %esp,%ebp
    7b36:	83 ec 78             	sub    $0x78,%esp
    7b39:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
    7b40:	8b 45 08             	mov    0x8(%ebp),%eax
    7b43:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7b46:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b49:	89 45 9c             	mov    %eax,-0x64(%ebp)
    7b4c:	8b 45 10             	mov    0x10(%ebp),%eax
    7b4f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    7b52:	83 ec 04             	sub    $0x4,%esp
    7b55:	6a 03                	push   $0x3
    7b57:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7b5a:	50                   	push   %eax
    7b5b:	6a 03                	push   $0x3
    7b5d:	e8 bc bc ff ff       	call   381e <send_rec>
    7b62:	83 c4 10             	add    $0x10,%esp
    7b65:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b68:	c9                   	leave  
    7b69:	c3                   	ret    

00007b6a <write>:
    7b6a:	55                   	push   %ebp
    7b6b:	89 e5                	mov    %esp,%ebp
    7b6d:	83 ec 78             	sub    $0x78,%esp
    7b70:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
    7b77:	8b 45 08             	mov    0x8(%ebp),%eax
    7b7a:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7b7d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b80:	89 45 9c             	mov    %eax,-0x64(%ebp)
    7b83:	8b 45 10             	mov    0x10(%ebp),%eax
    7b86:	89 45 dc             	mov    %eax,-0x24(%ebp)
    7b89:	83 ec 04             	sub    $0x4,%esp
    7b8c:	6a 03                	push   $0x3
    7b8e:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7b91:	50                   	push   %eax
    7b92:	6a 03                	push   $0x3
    7b94:	e8 85 bc ff ff       	call   381e <send_rec>
    7b99:	83 c4 10             	add    $0x10,%esp
    7b9c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b9f:	c9                   	leave  
    7ba0:	c3                   	ret    

00007ba1 <close>:
    7ba1:	55                   	push   %ebp
    7ba2:	89 e5                	mov    %esp,%ebp
    7ba4:	83 ec 78             	sub    $0x78,%esp
    7ba7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    7bae:	8b 45 08             	mov    0x8(%ebp),%eax
    7bb1:	89 45 cc             	mov    %eax,-0x34(%ebp)
    7bb4:	83 ec 04             	sub    $0x4,%esp
    7bb7:	6a 03                	push   $0x3
    7bb9:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7bbc:	50                   	push   %eax
    7bbd:	6a 03                	push   $0x3
    7bbf:	e8 5a bc ff ff       	call   381e <send_rec>
    7bc4:	83 c4 10             	add    $0x10,%esp
    7bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bca:	83 f8 65             	cmp    $0x65,%eax
    7bcd:	74 19                	je     7be8 <close+0x47>
    7bcf:	6a 14                	push   $0x14
    7bd1:	68 f1 90 00 00       	push   $0x90f1
    7bd6:	68 f1 90 00 00       	push   $0x90f1
    7bdb:	68 fd 90 00 00       	push   $0x90fd
    7be0:	e8 cd b3 ff ff       	call   2fb2 <assertion_failure>
    7be5:	83 c4 10             	add    $0x10,%esp
    7be8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7beb:	c9                   	leave  
    7bec:	c3                   	ret    

00007bed <wait>:
    7bed:	55                   	push   %ebp
    7bee:	89 e5                	mov    %esp,%ebp
    7bf0:	83 ec 78             	sub    $0x78,%esp
    7bf3:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
    7bfa:	83 ec 04             	sub    $0x4,%esp
    7bfd:	6a 04                	push   $0x4
    7bff:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7c02:	50                   	push   %eax
    7c03:	6a 03                	push   $0x3
    7c05:	e8 14 bc ff ff       	call   381e <send_rec>
    7c0a:	83 c4 10             	add    $0x10,%esp
    7c0d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7c10:	89 c2                	mov    %eax,%edx
    7c12:	8b 45 08             	mov    0x8(%ebp),%eax
    7c15:	89 10                	mov    %edx,(%eax)
    7c17:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7c1a:	83 f8 1f             	cmp    $0x1f,%eax
    7c1d:	74 05                	je     7c24 <wait+0x37>
    7c1f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7c22:	eb 05                	jmp    7c29 <wait+0x3c>
    7c24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    7c29:	c9                   	leave  
    7c2a:	c3                   	ret    

00007c2b <exit>:
    7c2b:	55                   	push   %ebp
    7c2c:	89 e5                	mov    %esp,%ebp
    7c2e:	83 ec 78             	sub    $0x78,%esp
    7c31:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    7c38:	8b 45 08             	mov    0x8(%ebp),%eax
    7c3b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    7c3e:	83 ec 04             	sub    $0x4,%esp
    7c41:	6a 04                	push   $0x4
    7c43:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7c46:	50                   	push   %eax
    7c47:	6a 03                	push   $0x3
    7c49:	e8 d0 bb ff ff       	call   381e <send_rec>
    7c4e:	83 c4 10             	add    $0x10,%esp
    7c51:	90                   	nop
    7c52:	c9                   	leave  
    7c53:	c3                   	ret    

00007c54 <fork>:
    7c54:	55                   	push   %ebp
    7c55:	89 e5                	mov    %esp,%ebp
    7c57:	83 ec 78             	sub    $0x78,%esp
    7c5a:	83 ec 04             	sub    $0x4,%esp
    7c5d:	6a 6c                	push   $0x6c
    7c5f:	6a 00                	push   $0x0
    7c61:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7c64:	50                   	push   %eax
    7c65:	e8 6f 15 00 00       	call   91d9 <Memset>
    7c6a:	83 c4 10             	add    $0x10,%esp
    7c6d:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
    7c74:	83 ec 04             	sub    $0x4,%esp
    7c77:	6a 04                	push   $0x4
    7c79:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7c7c:	50                   	push   %eax
    7c7d:	6a 03                	push   $0x3
    7c7f:	e8 9a bb ff ff       	call   381e <send_rec>
    7c84:	83 c4 10             	add    $0x10,%esp
    7c87:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
    7c8e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7c91:	85 c0                	test   %eax,%eax
    7c93:	74 19                	je     7cae <fork+0x5a>
    7c95:	6a 15                	push   $0x15
    7c97:	68 15 91 00 00       	push   $0x9115
    7c9c:	68 15 91 00 00       	push   $0x9115
    7ca1:	68 20 91 00 00       	push   $0x9120
    7ca6:	e8 07 b3 ff ff       	call   2fb2 <assertion_failure>
    7cab:	83 c4 10             	add    $0x10,%esp
    7cae:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7cb1:	c9                   	leave  
    7cb2:	c3                   	ret    

00007cb3 <getpid>:
    7cb3:	55                   	push   %ebp
    7cb4:	89 e5                	mov    %esp,%ebp
    7cb6:	83 ec 78             	sub    $0x78,%esp
    7cb9:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
    7cc0:	83 ec 04             	sub    $0x4,%esp
    7cc3:	6a 01                	push   $0x1
    7cc5:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7cc8:	50                   	push   %eax
    7cc9:	6a 03                	push   $0x3
    7ccb:	e8 4e bb ff ff       	call   381e <send_rec>
    7cd0:	83 c4 10             	add    $0x10,%esp
    7cd3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7cd6:	c9                   	leave  
    7cd7:	c3                   	ret    

00007cd8 <exec>:
    7cd8:	55                   	push   %ebp
    7cd9:	89 e5                	mov    %esp,%ebp
    7cdb:	83 ec 78             	sub    $0x78,%esp
    7cde:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
    7ce5:	8b 45 08             	mov    0x8(%ebp),%eax
    7ce8:	89 45 c0             	mov    %eax,-0x40(%ebp)
    7ceb:	83 ec 0c             	sub    $0xc,%esp
    7cee:	ff 75 08             	pushl  0x8(%ebp)
    7cf1:	e8 1c 15 00 00       	call   9212 <Strlen>
    7cf6:	83 c4 10             	add    $0x10,%esp
    7cf9:	89 45 bc             	mov    %eax,-0x44(%ebp)
    7cfc:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
    7d03:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
    7d0a:	83 ec 04             	sub    $0x4,%esp
    7d0d:	6a 04                	push   $0x4
    7d0f:	8d 45 8c             	lea    -0x74(%ebp),%eax
    7d12:	50                   	push   %eax
    7d13:	6a 03                	push   $0x3
    7d15:	e8 04 bb ff ff       	call   381e <send_rec>
    7d1a:	83 c4 10             	add    $0x10,%esp
    7d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d20:	83 f8 65             	cmp    $0x65,%eax
    7d23:	74 19                	je     7d3e <exec+0x66>
    7d25:	6a 1a                	push   $0x1a
    7d27:	68 30 91 00 00       	push   $0x9130
    7d2c:	68 30 91 00 00       	push   $0x9130
    7d31:	68 3b 91 00 00       	push   $0x913b
    7d36:	e8 77 b2 ff ff       	call   2fb2 <assertion_failure>
    7d3b:	83 c4 10             	add    $0x10,%esp
    7d3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7d41:	c9                   	leave  
    7d42:	c3                   	ret    

00007d43 <execv>:
    7d43:	55                   	push   %ebp
    7d44:	89 e5                	mov    %esp,%ebp
    7d46:	57                   	push   %edi
    7d47:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
    7d4d:	83 ec 04             	sub    $0x4,%esp
    7d50:	68 00 80 00 00       	push   $0x8000
    7d55:	6a 00                	push   $0x0
    7d57:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7d5d:	50                   	push   %eax
    7d5e:	e8 76 14 00 00       	call   91d9 <Memset>
    7d63:	83 c4 10             	add    $0x10,%esp
    7d66:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d69:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7d6c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7d73:	eb 0d                	jmp    7d82 <execv+0x3f>
    7d75:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    7d79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d7c:	83 c0 04             	add    $0x4,%eax
    7d7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d85:	8b 00                	mov    (%eax),%eax
    7d87:	85 c0                	test   %eax,%eax
    7d89:	75 ea                	jne    7d75 <execv+0x32>
    7d8b:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7d91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d94:	01 d0                	add    %edx,%eax
    7d96:	c6 00 00             	movb   $0x0,(%eax)
    7d99:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d9c:	83 c0 04             	add    $0x4,%eax
    7d9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7da2:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7da8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    7dab:	8b 45 0c             	mov    0xc(%ebp),%eax
    7dae:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7db1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7db8:	eb 64                	jmp    7e1e <execv+0xdb>
    7dba:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7dc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7dc3:	01 c2                	add    %eax,%edx
    7dc5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7dc8:	89 10                	mov    %edx,(%eax)
    7dca:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7dcd:	8b 00                	mov    (%eax),%eax
    7dcf:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
    7dd5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7dd8:	01 ca                	add    %ecx,%edx
    7dda:	83 ec 08             	sub    $0x8,%esp
    7ddd:	50                   	push   %eax
    7dde:	52                   	push   %edx
    7ddf:	e8 14 14 00 00       	call   91f8 <Strcpy>
    7de4:	83 c4 10             	add    $0x10,%esp
    7de7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7dea:	8b 00                	mov    (%eax),%eax
    7dec:	83 ec 0c             	sub    $0xc,%esp
    7def:	50                   	push   %eax
    7df0:	e8 1d 14 00 00       	call   9212 <Strlen>
    7df5:	83 c4 10             	add    $0x10,%esp
    7df8:	01 45 f0             	add    %eax,-0x10(%ebp)
    7dfb:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
    7e01:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e04:	01 d0                	add    %edx,%eax
    7e06:	c6 00 00             	movb   $0x0,(%eax)
    7e09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e0c:	83 c0 01             	add    $0x1,%eax
    7e0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7e12:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    7e16:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
    7e1a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7e1e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7e21:	8b 00                	mov    (%eax),%eax
    7e23:	85 c0                	test   %eax,%eax
    7e25:	75 93                	jne    7dba <execv+0x77>
    7e27:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7e2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7e30:	eb 04                	jmp    7e36 <execv+0xf3>
    7e32:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
    7e36:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7e39:	8b 00                	mov    (%eax),%eax
    7e3b:	85 c0                	test   %eax,%eax
    7e3d:	75 f3                	jne    7e32 <execv+0xef>
    7e3f:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
    7e45:	b8 00 00 00 00       	mov    $0x0,%eax
    7e4a:	b9 0a 00 00 00       	mov    $0xa,%ecx
    7e4f:	89 d7                	mov    %edx,%edi
    7e51:	f3 ab                	rep stos %eax,%es:(%edi)
    7e53:	c7 85 4c 7f ff ff 53 	movl   $0x9153,-0x80b4(%ebp)
    7e5a:	91 00 00 
    7e5d:	c7 85 50 7f ff ff 5a 	movl   $0x915a,-0x80b0(%ebp)
    7e64:	91 00 00 
    7e67:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
    7e6e:	00 00 00 
    7e71:	8b 45 08             	mov    0x8(%ebp),%eax
    7e74:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
    7e7a:	83 ec 0c             	sub    $0xc,%esp
    7e7d:	ff 75 08             	pushl  0x8(%ebp)
    7e80:	e8 8d 13 00 00       	call   9212 <Strlen>
    7e85:	83 c4 10             	add    $0x10,%esp
    7e88:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
    7e8e:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
    7e94:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
    7e9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e9d:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
    7ea3:	83 ec 04             	sub    $0x4,%esp
    7ea6:	6a 04                	push   $0x4
    7ea8:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
    7eae:	50                   	push   %eax
    7eaf:	6a 03                	push   $0x3
    7eb1:	e8 68 b9 ff ff       	call   381e <send_rec>
    7eb6:	83 c4 10             	add    $0x10,%esp
    7eb9:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
    7ebf:	83 f8 65             	cmp    $0x65,%eax
    7ec2:	74 19                	je     7edd <execv+0x19a>
    7ec4:	6a 73                	push   $0x73
    7ec6:	68 30 91 00 00       	push   $0x9130
    7ecb:	68 30 91 00 00       	push   $0x9130
    7ed0:	68 3b 91 00 00       	push   $0x913b
    7ed5:	e8 d8 b0 ff ff       	call   2fb2 <assertion_failure>
    7eda:	83 c4 10             	add    $0x10,%esp
    7edd:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
    7ee3:	8b 7d fc             	mov    -0x4(%ebp),%edi
    7ee6:	c9                   	leave  
    7ee7:	c3                   	ret    

00007ee8 <execl>:
    7ee8:	55                   	push   %ebp
    7ee9:	89 e5                	mov    %esp,%ebp
    7eeb:	83 ec 18             	sub    $0x18,%esp
    7eee:	8d 45 0c             	lea    0xc(%ebp),%eax
    7ef1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ef7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7efa:	83 ec 08             	sub    $0x8,%esp
    7efd:	ff 75 f0             	pushl  -0x10(%ebp)
    7f00:	ff 75 08             	pushl  0x8(%ebp)
    7f03:	e8 3b fe ff ff       	call   7d43 <execv>
    7f08:	83 c4 10             	add    $0x10,%esp
    7f0b:	c9                   	leave  
    7f0c:	c3                   	ret    

00007f0d <TaskMM>:
    7f0d:	55                   	push   %ebp
    7f0e:	89 e5                	mov    %esp,%ebp
    7f10:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    7f16:	83 ec 04             	sub    $0x4,%esp
    7f19:	6a 10                	push   $0x10
    7f1b:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7f21:	50                   	push   %eax
    7f22:	6a 02                	push   $0x2
    7f24:	e8 f5 b8 ff ff       	call   381e <send_rec>
    7f29:	83 c4 10             	add    $0x10,%esp
    7f2c:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    7f32:	89 45 f0             	mov    %eax,-0x10(%ebp)
    7f35:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
    7f3b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    7f3e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    7f45:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
    7f4c:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
    7f53:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
    7f5a:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7f5e:	74 4e                	je     7fae <TaskMM+0xa1>
    7f60:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7f64:	7f 08                	jg     7f6e <TaskMM+0x61>
    7f66:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    7f6a:	74 27                	je     7f93 <TaskMM+0x86>
    7f6c:	eb 79                	jmp    7fe7 <TaskMM+0xda>
    7f6e:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    7f72:	74 08                	je     7f7c <TaskMM+0x6f>
    7f74:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    7f78:	74 52                	je     7fcc <TaskMM+0xbf>
    7f7a:	eb 6b                	jmp    7fe7 <TaskMM+0xda>
    7f7c:	83 ec 0c             	sub    $0xc,%esp
    7f7f:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7f85:	50                   	push   %eax
    7f86:	e8 f6 03 00 00       	call   8381 <do_fork>
    7f8b:	83 c4 10             	add    $0x10,%esp
    7f8e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    7f91:	eb 65                	jmp    7ff8 <TaskMM+0xeb>
    7f93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7f9a:	83 ec 0c             	sub    $0xc,%esp
    7f9d:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7fa3:	50                   	push   %eax
    7fa4:	e8 a8 00 00 00       	call   8051 <do_exec>
    7fa9:	83 c4 10             	add    $0x10,%esp
    7fac:	eb 4a                	jmp    7ff8 <TaskMM+0xeb>
    7fae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fb5:	83 ec 08             	sub    $0x8,%esp
    7fb8:	ff 75 e4             	pushl  -0x1c(%ebp)
    7fbb:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7fc1:	50                   	push   %eax
    7fc2:	e8 c4 05 00 00       	call   858b <do_exit>
    7fc7:	83 c4 10             	add    $0x10,%esp
    7fca:	eb 2c                	jmp    7ff8 <TaskMM+0xeb>
    7fcc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fd3:	83 ec 0c             	sub    $0xc,%esp
    7fd6:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
    7fdc:	50                   	push   %eax
    7fdd:	e8 a5 06 00 00       	call   8687 <do_wait>
    7fe2:	83 c4 10             	add    $0x10,%esp
    7fe5:	eb 11                	jmp    7ff8 <TaskMM+0xeb>
    7fe7:	83 ec 0c             	sub    $0xc,%esp
    7fea:	68 61 91 00 00       	push   $0x9161
    7fef:	e8 a0 af ff ff       	call   2f94 <panic>
    7ff4:	83 c4 10             	add    $0x10,%esp
    7ff7:	90                   	nop
    7ff8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7ffc:	0f 84 14 ff ff ff    	je     7f16 <TaskMM+0x9>
    8002:	83 ec 04             	sub    $0x4,%esp
    8005:	ff 75 ec             	pushl  -0x14(%ebp)
    8008:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    800e:	50                   	push   %eax
    800f:	6a 01                	push   $0x1
    8011:	e8 08 b8 ff ff       	call   381e <send_rec>
    8016:	83 c4 10             	add    $0x10,%esp
    8019:	e9 f8 fe ff ff       	jmp    7f16 <TaskMM+0x9>

0000801e <alloc_mem>:
    801e:	55                   	push   %ebp
    801f:	89 e5                	mov    %esp,%ebp
    8021:	83 ec 10             	sub    $0x10,%esp
    8024:	8b 45 08             	mov    0x8(%ebp),%eax
    8027:	83 e8 06             	sub    $0x6,%eax
    802a:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
    8030:	05 00 00 a0 00       	add    $0xa00000,%eax
    8035:	89 45 fc             	mov    %eax,-0x4(%ebp)
    8038:	8b 45 fc             	mov    -0x4(%ebp),%eax
    803b:	c9                   	leave  
    803c:	c3                   	ret    

0000803d <do_exec2>:
    803d:	55                   	push   %ebp
    803e:	89 e5                	mov    %esp,%ebp
    8040:	83 ec 10             	sub    $0x10,%esp
    8043:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
    804a:	b8 00 00 00 00       	mov    $0x0,%eax
    804f:	c9                   	leave  
    8050:	c3                   	ret    

00008051 <do_exec>:
    8051:	55                   	push   %ebp
    8052:	89 e5                	mov    %esp,%ebp
    8054:	56                   	push   %esi
    8055:	53                   	push   %ebx
    8056:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
    805c:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
    8063:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
    806a:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
    8070:	83 ec 08             	sub    $0x8,%esp
    8073:	6a 00                	push   $0x0
    8075:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    8078:	50                   	push   %eax
    8079:	e8 60 fa ff ff       	call   7ade <open>
    807e:	83 c4 10             	add    $0x10,%esp
    8081:	89 45 dc             	mov    %eax,-0x24(%ebp)
    8084:	8b 45 08             	mov    0x8(%ebp),%eax
    8087:	8b 00                	mov    (%eax),%eax
    8089:	89 45 d8             	mov    %eax,-0x28(%ebp)
    808c:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
    8093:	83 ec 04             	sub    $0x4,%esp
    8096:	6a 0c                	push   $0xc
    8098:	6a 00                	push   $0x0
    809a:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    80a0:	50                   	push   %eax
    80a1:	e8 33 11 00 00       	call   91d9 <Memset>
    80a6:	83 c4 10             	add    $0x10,%esp
    80a9:	8b 45 08             	mov    0x8(%ebp),%eax
    80ac:	8b 40 30             	mov    0x30(%eax),%eax
    80af:	89 c6                	mov    %eax,%esi
    80b1:	8b 45 08             	mov    0x8(%ebp),%eax
    80b4:	8b 40 34             	mov    0x34(%eax),%eax
    80b7:	83 ec 08             	sub    $0x8,%esp
    80ba:	50                   	push   %eax
    80bb:	ff 75 d8             	pushl  -0x28(%ebp)
    80be:	e8 58 e9 ff ff       	call   6a1b <v2l>
    80c3:	83 c4 10             	add    $0x10,%esp
    80c6:	89 c3                	mov    %eax,%ebx
    80c8:	83 ec 08             	sub    $0x8,%esp
    80cb:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    80d1:	50                   	push   %eax
    80d2:	6a 04                	push   $0x4
    80d4:	e8 42 e9 ff ff       	call   6a1b <v2l>
    80d9:	83 c4 10             	add    $0x10,%esp
    80dc:	83 ec 04             	sub    $0x4,%esp
    80df:	56                   	push   %esi
    80e0:	53                   	push   %ebx
    80e1:	50                   	push   %eax
    80e2:	e8 c4 10 00 00       	call   91ab <Memcpy>
    80e7:	83 c4 10             	add    $0x10,%esp
    80ea:	83 ec 08             	sub    $0x8,%esp
    80ed:	6a 00                	push   $0x0
    80ef:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
    80f5:	50                   	push   %eax
    80f6:	e8 e3 f9 ff ff       	call   7ade <open>
    80fb:	83 c4 10             	add    $0x10,%esp
    80fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
    8101:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8108:	8b 45 f4             	mov    -0xc(%ebp),%eax
    810b:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
    8111:	01 d0                	add    %edx,%eax
    8113:	83 ec 04             	sub    $0x4,%esp
    8116:	68 00 02 00 00       	push   $0x200
    811b:	50                   	push   %eax
    811c:	ff 75 d0             	pushl  -0x30(%ebp)
    811f:	e8 0f fa ff ff       	call   7b33 <read>
    8124:	83 c4 10             	add    $0x10,%esp
    8127:	89 45 cc             	mov    %eax,-0x34(%ebp)
    812a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    812d:	01 45 f4             	add    %eax,-0xc(%ebp)
    8130:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    8134:	74 02                	je     8138 <do_exec+0xe7>
    8136:	eb d0                	jmp    8108 <do_exec+0xb7>
    8138:	90                   	nop
    8139:	83 ec 0c             	sub    $0xc,%esp
    813c:	ff 75 d0             	pushl  -0x30(%ebp)
    813f:	e8 5d fa ff ff       	call   7ba1 <close>
    8144:	83 c4 10             	add    $0x10,%esp
    8147:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
    814d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8150:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8157:	eb 72                	jmp    81cb <do_exec+0x17a>
    8159:	8b 45 c8             	mov    -0x38(%ebp),%eax
    815c:	0f b7 40 28          	movzwl 0x28(%eax),%eax
    8160:	0f b7 d0             	movzwl %ax,%edx
    8163:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8166:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
    816a:	0f b7 c0             	movzwl %ax,%eax
    816d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    8171:	01 c2                	add    %eax,%edx
    8173:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
    8179:	01 d0                	add    %edx,%eax
    817b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    817e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    8181:	8b 40 10             	mov    0x10(%eax),%eax
    8184:	89 c6                	mov    %eax,%esi
    8186:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    8189:	8b 40 04             	mov    0x4(%eax),%eax
    818c:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
    8192:	01 d0                	add    %edx,%eax
    8194:	83 ec 08             	sub    $0x8,%esp
    8197:	50                   	push   %eax
    8198:	6a 04                	push   $0x4
    819a:	e8 7c e8 ff ff       	call   6a1b <v2l>
    819f:	83 c4 10             	add    $0x10,%esp
    81a2:	89 c3                	mov    %eax,%ebx
    81a4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    81a7:	8b 40 08             	mov    0x8(%eax),%eax
    81aa:	83 ec 08             	sub    $0x8,%esp
    81ad:	50                   	push   %eax
    81ae:	ff 75 d8             	pushl  -0x28(%ebp)
    81b1:	e8 65 e8 ff ff       	call   6a1b <v2l>
    81b6:	83 c4 10             	add    $0x10,%esp
    81b9:	83 ec 04             	sub    $0x4,%esp
    81bc:	56                   	push   %esi
    81bd:	53                   	push   %ebx
    81be:	50                   	push   %eax
    81bf:	e8 e7 0f 00 00       	call   91ab <Memcpy>
    81c4:	83 c4 10             	add    $0x10,%esp
    81c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    81cb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    81ce:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    81d2:	0f b7 c0             	movzwl %ax,%eax
    81d5:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    81d8:	0f 8c 7b ff ff ff    	jl     8159 <do_exec+0x108>
    81de:	8b 45 08             	mov    0x8(%ebp),%eax
    81e1:	8b 40 10             	mov    0x10(%eax),%eax
    81e4:	89 45 c0             	mov    %eax,-0x40(%ebp)
    81e7:	8b 45 08             	mov    0x8(%ebp),%eax
    81ea:	8b 40 1c             	mov    0x1c(%eax),%eax
    81ed:	89 45 bc             	mov    %eax,-0x44(%ebp)
    81f0:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
    81f7:	83 ec 08             	sub    $0x8,%esp
    81fa:	ff 75 c0             	pushl  -0x40(%ebp)
    81fd:	ff 75 d8             	pushl  -0x28(%ebp)
    8200:	e8 16 e8 ff ff       	call   6a1b <v2l>
    8205:	83 c4 10             	add    $0x10,%esp
    8208:	89 c3                	mov    %eax,%ebx
    820a:	83 ec 08             	sub    $0x8,%esp
    820d:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    8213:	50                   	push   %eax
    8214:	6a 04                	push   $0x4
    8216:	e8 00 e8 ff ff       	call   6a1b <v2l>
    821b:	83 c4 10             	add    $0x10,%esp
    821e:	83 ec 04             	sub    $0x4,%esp
    8221:	ff 75 bc             	pushl  -0x44(%ebp)
    8224:	53                   	push   %ebx
    8225:	50                   	push   %eax
    8226:	e8 80 0f 00 00       	call   91ab <Memcpy>
    822b:	83 c4 10             	add    $0x10,%esp
    822e:	83 ec 08             	sub    $0x8,%esp
    8231:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    8237:	50                   	push   %eax
    8238:	6a 04                	push   $0x4
    823a:	e8 dc e7 ff ff       	call   6a1b <v2l>
    823f:	83 c4 10             	add    $0x10,%esp
    8242:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    8245:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    8248:	89 45 ec             	mov    %eax,-0x14(%ebp)
    824b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8252:	eb 08                	jmp    825c <do_exec+0x20b>
    8254:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8258:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
    825c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    825f:	8b 00                	mov    (%eax),%eax
    8261:	85 c0                	test   %eax,%eax
    8263:	75 ef                	jne    8254 <do_exec+0x203>
    8265:	8b 45 b8             	mov    -0x48(%ebp),%eax
    8268:	2b 45 c0             	sub    -0x40(%ebp),%eax
    826b:	89 45 b0             	mov    %eax,-0x50(%ebp)
    826e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8275:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    827b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    827e:	eb 17                	jmp    8297 <do_exec+0x246>
    8280:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8284:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8287:	8b 10                	mov    (%eax),%edx
    8289:	8b 45 b0             	mov    -0x50(%ebp),%eax
    828c:	01 c2                	add    %eax,%edx
    828e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8291:	89 10                	mov    %edx,(%eax)
    8293:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
    8297:	8b 45 e0             	mov    -0x20(%ebp),%eax
    829a:	8b 00                	mov    (%eax),%eax
    829c:	85 c0                	test   %eax,%eax
    829e:	75 e0                	jne    8280 <do_exec+0x22f>
    82a0:	83 ec 08             	sub    $0x8,%esp
    82a3:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
    82a9:	50                   	push   %eax
    82aa:	6a 04                	push   $0x4
    82ac:	e8 6a e7 ff ff       	call   6a1b <v2l>
    82b1:	83 c4 10             	add    $0x10,%esp
    82b4:	89 c3                	mov    %eax,%ebx
    82b6:	83 ec 08             	sub    $0x8,%esp
    82b9:	ff 75 b8             	pushl  -0x48(%ebp)
    82bc:	ff 75 d8             	pushl  -0x28(%ebp)
    82bf:	e8 57 e7 ff ff       	call   6a1b <v2l>
    82c4:	83 c4 10             	add    $0x10,%esp
    82c7:	83 ec 04             	sub    $0x4,%esp
    82ca:	ff 75 bc             	pushl  -0x44(%ebp)
    82cd:	53                   	push   %ebx
    82ce:	50                   	push   %eax
    82cf:	e8 d7 0e 00 00       	call   91ab <Memcpy>
    82d4:	83 c4 10             	add    $0x10,%esp
    82d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    82da:	89 45 ac             	mov    %eax,-0x54(%ebp)
    82dd:	8b 45 b8             	mov    -0x48(%ebp),%eax
    82e0:	8b 55 ac             	mov    -0x54(%ebp),%edx
    82e3:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    82e9:	81 c2 8c 11 08 00    	add    $0x8118c,%edx
    82ef:	89 02                	mov    %eax,(%edx)
    82f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    82f4:	8b 55 ac             	mov    -0x54(%ebp),%edx
    82f7:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    82fd:	81 c2 88 11 08 00    	add    $0x81188,%edx
    8303:	89 02                	mov    %eax,(%edx)
    8305:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8308:	8b 40 18             	mov    0x18(%eax),%eax
    830b:	8b 55 ac             	mov    -0x54(%ebp),%edx
    830e:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    8314:	81 c2 90 11 08 00    	add    $0x81190,%edx
    831a:	89 02                	mov    %eax,(%edx)
    831c:	8b 45 b8             	mov    -0x48(%ebp),%eax
    831f:	8b 55 ac             	mov    -0x54(%ebp),%edx
    8322:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    8328:	81 c2 9c 11 08 00    	add    $0x8119c,%edx
    832e:	89 02                	mov    %eax,(%edx)
    8330:	8b 45 ac             	mov    -0x54(%ebp),%eax
    8333:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8339:	05 e4 12 08 00       	add    $0x812e4,%eax
    833e:	c7 00 1f 00 00 00    	movl   $0x1f,(%eax)
    8344:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
    834b:	00 00 00 
    834e:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
    8355:	00 00 00 
    8358:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
    835f:	00 00 00 
    8362:	83 ec 04             	sub    $0x4,%esp
    8365:	ff 75 d8             	pushl  -0x28(%ebp)
    8368:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
    836e:	50                   	push   %eax
    836f:	6a 01                	push   $0x1
    8371:	e8 a8 b4 ff ff       	call   381e <send_rec>
    8376:	83 c4 10             	add    $0x10,%esp
    8379:	90                   	nop
    837a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    837d:	5b                   	pop    %ebx
    837e:	5e                   	pop    %esi
    837f:	5d                   	pop    %ebp
    8380:	c3                   	ret    

00008381 <do_fork>:
    8381:	55                   	push   %ebp
    8382:	89 e5                	mov    %esp,%ebp
    8384:	57                   	push   %edi
    8385:	56                   	push   %esi
    8386:	53                   	push   %ebx
    8387:	81 ec ac 00 00 00    	sub    $0xac,%esp
    838d:	c7 45 e4 20 1b 08 00 	movl   $0x81b20,-0x1c(%ebp)
    8394:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    839b:	c7 45 dc 06 00 00 00 	movl   $0x6,-0x24(%ebp)
    83a2:	eb 21                	jmp    83c5 <do_fork+0x44>
    83a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    83a7:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    83ae:	3c ff                	cmp    $0xff,%al
    83b0:	75 08                	jne    83ba <do_fork+0x39>
    83b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    83b8:	eb 11                	jmp    83cb <do_fork+0x4a>
    83ba:	81 45 e4 a0 01 00 00 	addl   $0x1a0,-0x1c(%ebp)
    83c1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    83c5:	83 7d dc 02          	cmpl   $0x2,-0x24(%ebp)
    83c9:	7e d9                	jle    83a4 <do_fork+0x23>
    83cb:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
    83cf:	7f 19                	jg     83ea <do_fork+0x69>
    83d1:	6a 26                	push   $0x26
    83d3:	68 74 91 00 00       	push   $0x9174
    83d8:	68 74 91 00 00       	push   $0x9174
    83dd:	68 84 91 00 00       	push   $0x9184
    83e2:	e8 cb ab ff ff       	call   2fb2 <assertion_failure>
    83e7:	83 c4 10             	add    $0x10,%esp
    83ea:	8b 45 08             	mov    0x8(%ebp),%eax
    83ed:	8b 00                	mov    (%eax),%eax
    83ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
    83f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    83f5:	0f b7 40 44          	movzwl 0x44(%eax),%eax
    83f9:	0f b7 c0             	movzwl %ax,%eax
    83fc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    83ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8402:	8b 55 d8             	mov    -0x28(%ebp),%edx
    8405:	69 d2 a0 01 00 00    	imul   $0x1a0,%edx,%edx
    840b:	8d 8a 60 11 08 00    	lea    0x81160(%edx),%ecx
    8411:	89 c2                	mov    %eax,%edx
    8413:	89 cb                	mov    %ecx,%ebx
    8415:	b8 68 00 00 00       	mov    $0x68,%eax
    841a:	89 d7                	mov    %edx,%edi
    841c:	89 de                	mov    %ebx,%esi
    841e:	89 c1                	mov    %eax,%ecx
    8420:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    8422:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8425:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8428:	89 50 58             	mov    %edx,0x58(%eax)
    842b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    842e:	89 c2                	mov    %eax,%edx
    8430:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8433:	66 89 50 44          	mov    %dx,0x44(%eax)
    8437:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    843a:	8b 55 d8             	mov    -0x28(%ebp),%edx
    843d:	89 90 98 01 00 00    	mov    %edx,0x198(%eax)
    8443:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8446:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    844c:	83 c0 40             	add    $0x40,%eax
    844f:	05 60 11 08 00       	add    $0x81160,%eax
    8454:	83 c0 06             	add    $0x6,%eax
    8457:	89 45 d0             	mov    %eax,-0x30(%ebp)
    845a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    845d:	0f b6 40 07          	movzbl 0x7(%eax),%eax
    8461:	0f b6 c0             	movzbl %al,%eax
    8464:	c1 e0 18             	shl    $0x18,%eax
    8467:	89 c2                	mov    %eax,%edx
    8469:	8b 45 d0             	mov    -0x30(%ebp),%eax
    846c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    8470:	0f b6 c0             	movzbl %al,%eax
    8473:	c1 e0 10             	shl    $0x10,%eax
    8476:	01 c2                	add    %eax,%edx
    8478:	8b 45 d0             	mov    -0x30(%ebp),%eax
    847b:	0f b7 40 02          	movzwl 0x2(%eax),%eax
    847f:	0f b7 c0             	movzwl %ax,%eax
    8482:	01 d0                	add    %edx,%eax
    8484:	89 45 cc             	mov    %eax,-0x34(%ebp)
    8487:	8b 45 d0             	mov    -0x30(%ebp),%eax
    848a:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    848e:	0f b6 c0             	movzbl %al,%eax
    8491:	25 00 00 0f 00       	and    $0xf0000,%eax
    8496:	89 c2                	mov    %eax,%edx
    8498:	8b 45 d0             	mov    -0x30(%ebp),%eax
    849b:	0f b7 00             	movzwl (%eax),%eax
    849e:	0f b7 c0             	movzwl %ax,%eax
    84a1:	01 d0                	add    %edx,%eax
    84a3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    84a6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    84a9:	83 c0 01             	add    $0x1,%eax
    84ac:	c1 e0 0c             	shl    $0xc,%eax
    84af:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    84b2:	83 ec 08             	sub    $0x8,%esp
    84b5:	ff 75 c4             	pushl  -0x3c(%ebp)
    84b8:	ff 75 e0             	pushl  -0x20(%ebp)
    84bb:	e8 5e fb ff ff       	call   801e <alloc_mem>
    84c0:	83 c4 10             	add    $0x10,%esp
    84c3:	89 45 c0             	mov    %eax,-0x40(%ebp)
    84c6:	8b 55 cc             	mov    -0x34(%ebp),%edx
    84c9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    84cc:	83 ec 04             	sub    $0x4,%esp
    84cf:	ff 75 c4             	pushl  -0x3c(%ebp)
    84d2:	52                   	push   %edx
    84d3:	50                   	push   %eax
    84d4:	e8 d2 0c 00 00       	call   91ab <Memcpy>
    84d9:	83 c4 10             	add    $0x10,%esp
    84dc:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
    84e3:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
    84ea:	8b 45 b8             	mov    -0x48(%ebp),%eax
    84ed:	0f b7 c8             	movzwl %ax,%ecx
    84f0:	8b 55 c8             	mov    -0x38(%ebp),%edx
    84f3:	8b 45 c0             	mov    -0x40(%ebp),%eax
    84f6:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    84f9:	69 db a0 01 00 00    	imul   $0x1a0,%ebx,%ebx
    84ff:	83 c3 40             	add    $0x40,%ebx
    8502:	81 c3 60 11 08 00    	add    $0x81160,%ebx
    8508:	83 c3 06             	add    $0x6,%ebx
    850b:	51                   	push   %ecx
    850c:	52                   	push   %edx
    850d:	50                   	push   %eax
    850e:	53                   	push   %ebx
    850f:	e8 ff e3 ff ff       	call   6913 <InitDescriptor>
    8514:	83 c4 10             	add    $0x10,%esp
    8517:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
    851e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    8521:	0f b7 c8             	movzwl %ax,%ecx
    8524:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8527:	8b 45 c0             	mov    -0x40(%ebp),%eax
    852a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
    852d:	69 db a0 01 00 00    	imul   $0x1a0,%ebx,%ebx
    8533:	83 c3 48             	add    $0x48,%ebx
    8536:	81 c3 60 11 08 00    	add    $0x81160,%ebx
    853c:	83 c3 06             	add    $0x6,%ebx
    853f:	51                   	push   %ecx
    8540:	52                   	push   %edx
    8541:	50                   	push   %eax
    8542:	53                   	push   %ebx
    8543:	e8 cb e3 ff ff       	call   6913 <InitDescriptor>
    8548:	83 c4 10             	add    $0x10,%esp
    854b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    854e:	8b 45 08             	mov    0x8(%ebp),%eax
    8551:	89 50 4c             	mov    %edx,0x4c(%eax)
    8554:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
    855b:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
    8562:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
    8569:	83 ec 04             	sub    $0x4,%esp
    856c:	ff 75 e0             	pushl  -0x20(%ebp)
    856f:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
    8575:	50                   	push   %eax
    8576:	6a 01                	push   $0x1
    8578:	e8 a1 b2 ff ff       	call   381e <send_rec>
    857d:	83 c4 10             	add    $0x10,%esp
    8580:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8583:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8586:	5b                   	pop    %ebx
    8587:	5e                   	pop    %esi
    8588:	5f                   	pop    %edi
    8589:	5d                   	pop    %ebp
    858a:	c3                   	ret    

0000858b <do_exit>:
    858b:	55                   	push   %ebp
    858c:	89 e5                	mov    %esp,%ebp
    858e:	83 ec 18             	sub    $0x18,%esp
    8591:	8b 45 08             	mov    0x8(%ebp),%eax
    8594:	8b 00                	mov    (%eax),%eax
    8596:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8599:	8b 45 f0             	mov    -0x10(%ebp),%eax
    859c:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    85a2:	05 60 11 08 00       	add    $0x81160,%eax
    85a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    85aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85ad:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    85b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    85b6:	8b 45 08             	mov    0x8(%ebp),%eax
    85b9:	8b 40 44             	mov    0x44(%eax),%eax
    85bc:	89 c2                	mov    %eax,%edx
    85be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85c1:	89 90 9c 01 00 00    	mov    %edx,0x19c(%eax)
    85c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85ca:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    85d0:	05 dd 12 08 00       	add    $0x812dd,%eax
    85d5:	0f b6 00             	movzbl (%eax),%eax
    85d8:	3c 04                	cmp    $0x4,%al
    85da:	75 21                	jne    85fd <do_exit+0x72>
    85dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    85df:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    85e5:	05 dd 12 08 00       	add    $0x812dd,%eax
    85ea:	c6 00 fb             	movb   $0xfb,(%eax)
    85ed:	83 ec 0c             	sub    $0xc,%esp
    85f0:	ff 75 ec             	pushl  -0x14(%ebp)
    85f3:	e8 59 01 00 00       	call   8751 <cleanup>
    85f8:	83 c4 10             	add    $0x10,%esp
    85fb:	eb 0a                	jmp    8607 <do_exit+0x7c>
    85fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8600:	c6 80 7c 01 00 00 03 	movb   $0x3,0x17c(%eax)
    8607:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    860e:	eb 6e                	jmp    867e <do_exit+0xf3>
    8610:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8613:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8619:	05 f8 12 08 00       	add    $0x812f8,%eax
    861e:	8b 00                	mov    (%eax),%eax
    8620:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    8623:	75 55                	jne    867a <do_exit+0xef>
    8625:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8628:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    862e:	05 f8 12 08 00       	add    $0x812f8,%eax
    8633:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
    8639:	0f b6 05 9d 1c 08 00 	movzbl 0x81c9d,%eax
    8640:	3c 04                	cmp    $0x4,%al
    8642:	75 36                	jne    867a <do_exit+0xef>
    8644:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8647:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    864d:	05 dd 12 08 00       	add    $0x812dd,%eax
    8652:	0f b6 00             	movzbl (%eax),%eax
    8655:	3c 03                	cmp    $0x3,%al
    8657:	75 21                	jne    867a <do_exit+0xef>
    8659:	c6 05 9d 1c 08 00 fb 	movb   $0xfb,0x81c9d
    8660:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8663:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    8669:	05 60 11 08 00       	add    $0x81160,%eax
    866e:	83 ec 0c             	sub    $0xc,%esp
    8671:	50                   	push   %eax
    8672:	e8 da 00 00 00       	call   8751 <cleanup>
    8677:	83 c4 10             	add    $0x10,%esp
    867a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    867e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    8682:	7e 8c                	jle    8610 <do_exit+0x85>
    8684:	90                   	nop
    8685:	c9                   	leave  
    8686:	c3                   	ret    

00008687 <do_wait>:
    8687:	55                   	push   %ebp
    8688:	89 e5                	mov    %esp,%ebp
    868a:	81 ec 88 00 00 00    	sub    $0x88,%esp
    8690:	8b 45 08             	mov    0x8(%ebp),%eax
    8693:	8b 00                	mov    (%eax),%eax
    8695:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8698:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    869f:	c7 45 f0 06 00 00 00 	movl   $0x6,-0x10(%ebp)
    86a6:	eb 5f                	jmp    8707 <do_wait+0x80>
    86a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86ab:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86b1:	05 f8 12 08 00       	add    $0x812f8,%eax
    86b6:	8b 00                	mov    (%eax),%eax
    86b8:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    86bb:	75 46                	jne    8703 <do_wait+0x7c>
    86bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    86c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86c4:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86ca:	05 dd 12 08 00       	add    $0x812dd,%eax
    86cf:	0f b6 00             	movzbl (%eax),%eax
    86d2:	3c 03                	cmp    $0x3,%al
    86d4:	75 2d                	jne    8703 <do_wait+0x7c>
    86d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    86d9:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86df:	05 dd 12 08 00       	add    $0x812dd,%eax
    86e4:	c6 00 fb             	movb   $0xfb,(%eax)
    86e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86ea:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    86f0:	05 60 11 08 00       	add    $0x81160,%eax
    86f5:	83 ec 0c             	sub    $0xc,%esp
    86f8:	50                   	push   %eax
    86f9:	e8 53 00 00 00       	call   8751 <cleanup>
    86fe:	83 c4 10             	add    $0x10,%esp
    8701:	eb 4c                	jmp    874f <do_wait+0xc8>
    8703:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8707:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    870b:	7e 9b                	jle    86a8 <do_wait+0x21>
    870d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8711:	74 13                	je     8726 <do_wait+0x9f>
    8713:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8716:	69 c0 a0 01 00 00    	imul   $0x1a0,%eax,%eax
    871c:	05 dd 12 08 00       	add    $0x812dd,%eax
    8721:	c6 00 04             	movb   $0x4,(%eax)
    8724:	eb 29                	jmp    874f <do_wait+0xc8>
    8726:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
    872d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    8734:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    873b:	83 ec 04             	sub    $0x4,%esp
    873e:	ff 75 ec             	pushl  -0x14(%ebp)
    8741:	8d 45 80             	lea    -0x80(%ebp),%eax
    8744:	50                   	push   %eax
    8745:	6a 01                	push   $0x1
    8747:	e8 d2 b0 ff ff       	call   381e <send_rec>
    874c:	83 c4 10             	add    $0x10,%esp
    874f:	c9                   	leave  
    8750:	c3                   	ret    

00008751 <cleanup>:
    8751:	55                   	push   %ebp
    8752:	89 e5                	mov    %esp,%ebp
    8754:	83 ec 78             	sub    $0x78,%esp
    8757:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
    875e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8765:	8b 45 08             	mov    0x8(%ebp),%eax
    8768:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    876e:	89 45 d8             	mov    %eax,-0x28(%ebp)
    8771:	8b 45 08             	mov    0x8(%ebp),%eax
    8774:	8b 80 9c 01 00 00    	mov    0x19c(%eax),%eax
    877a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    877d:	8b 45 08             	mov    0x8(%ebp),%eax
    8780:	8b 80 98 01 00 00    	mov    0x198(%eax),%eax
    8786:	83 ec 04             	sub    $0x4,%esp
    8789:	50                   	push   %eax
    878a:	8d 45 8c             	lea    -0x74(%ebp),%eax
    878d:	50                   	push   %eax
    878e:	6a 01                	push   $0x1
    8790:	e8 89 b0 ff ff       	call   381e <send_rec>
    8795:	83 c4 10             	add    $0x10,%esp
    8798:	8b 45 08             	mov    0x8(%ebp),%eax
    879b:	c6 80 7c 01 00 00 ff 	movb   $0xff,0x17c(%eax)
    87a2:	90                   	nop
    87a3:	c9                   	leave  
    87a4:	c3                   	ret    
