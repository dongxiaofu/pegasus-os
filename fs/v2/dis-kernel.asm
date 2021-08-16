
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00001000 <_start>:
    1000:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1007:	00 00 00 
    100a:	b4 0b                	mov    $0xb,%ah
    100c:	b0 4c                	mov    $0x4c,%al
    100e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
    1015:	bc 80 9e 00 00       	mov    $0x9e80,%esp
    101a:	66 c7 05 90 9e 00 00 	movw   $0x0,0x9e90
    1021:	00 00 
    1023:	0f 01 05 7c cc 00 00 	sgdtl  0xcc7c
    102a:	e8 c5 42 00 00       	call   52f4 <ReloadGDT>
    102f:	0f 01 15 7c cc 00 00 	lgdtl  0xcc7c
    1036:	0f 01 1d 88 9e 00 00 	lidtl  0x9e88
    103d:	ea 44 10 00 00 08 00 	ljmp   $0x8,$0x1044

00001044 <csinit>:
    1044:	31 c0                	xor    %eax,%eax
    1046:	66 b8 40 00          	mov    $0x40,%ax
    104a:	0f 00 d8             	ltr    %ax
    104d:	e9 6e 0a 00 00       	jmp    1ac0 <kernel_main>
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
    1069:	e8 7e 08 00 00       	call   18ec <test>
    106e:	6a 01                	push   $0x1
    1070:	6a 02                	push   $0x2
    1072:	6a 03                	push   $0x3
    1074:	f4                   	hlt    

00001075 <InterruptTest>:
    1075:	b4 0d                	mov    $0xd,%ah
    1077:	b0 54                	mov    $0x54,%al
    1079:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
    1080:	c3                   	ret    

00001081 <disp_str>:
    1081:	55                   	push   %ebp
    1082:	89 e5                	mov    %esp,%ebp
    1084:	b4 0d                	mov    $0xd,%ah
    1086:	8b 75 08             	mov    0x8(%ebp),%esi
    1089:	8b 3d 90 9e 00 00    	mov    0x9e90,%edi

0000108f <disp_str.1>:
    108f:	ac                   	lods   %ds:(%esi),%al
    1090:	84 c0                	test   %al,%al
    1092:	74 1e                	je     10b2 <disp_str.4>
    1094:	3c 0a                	cmp    $0xa,%al
    1096:	75 11                	jne    10a9 <disp_str.3>
    1098:	50                   	push   %eax
    1099:	89 f8                	mov    %edi,%eax
    109b:	b3 a0                	mov    $0xa0,%bl
    109d:	f6 f3                	div    %bl
    109f:	40                   	inc    %eax
    10a0:	b3 a0                	mov    $0xa0,%bl
    10a2:	f6 e3                	mul    %bl
    10a4:	89 c7                	mov    %eax,%edi
    10a6:	58                   	pop    %eax
    10a7:	eb e6                	jmp    108f <disp_str.1>

000010a9 <disp_str.3>:
    10a9:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10ad:	83 c7 02             	add    $0x2,%edi
    10b0:	eb dd                	jmp    108f <disp_str.1>

000010b2 <disp_str.4>:
    10b2:	89 3d 90 9e 00 00    	mov    %edi,0x9e90
    10b8:	89 ec                	mov    %ebp,%esp
    10ba:	5d                   	pop    %ebp
    10bb:	c3                   	ret    

000010bc <disp_str_colour>:
    10bc:	55                   	push   %ebp
    10bd:	89 e5                	mov    %esp,%ebp
    10bf:	8b 75 08             	mov    0x8(%ebp),%esi
    10c2:	8a 65 0c             	mov    0xc(%ebp),%ah
    10c5:	8b 3d 90 9e 00 00    	mov    0x9e90,%edi

000010cb <disp_str_colour.1>:
    10cb:	ac                   	lods   %ds:(%esi),%al
    10cc:	84 c0                	test   %al,%al
    10ce:	74 1e                	je     10ee <disp_str_colour.4>
    10d0:	3c 0a                	cmp    $0xa,%al
    10d2:	75 11                	jne    10e5 <disp_str_colour.3>
    10d4:	50                   	push   %eax
    10d5:	89 f8                	mov    %edi,%eax
    10d7:	b3 a0                	mov    $0xa0,%bl
    10d9:	f6 f3                	div    %bl
    10db:	40                   	inc    %eax
    10dc:	b3 a0                	mov    $0xa0,%bl
    10de:	f6 e3                	mul    %bl
    10e0:	89 c7                	mov    %eax,%edi
    10e2:	58                   	pop    %eax
    10e3:	eb e6                	jmp    10cb <disp_str_colour.1>

000010e5 <disp_str_colour.3>:
    10e5:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10e9:	83 c7 02             	add    $0x2,%edi
    10ec:	eb dd                	jmp    10cb <disp_str_colour.1>

000010ee <disp_str_colour.4>:
    10ee:	89 3d 90 9e 00 00    	mov    %edi,0x9e90
    10f4:	89 ec                	mov    %ebp,%esp
    10f6:	5d                   	pop    %ebp
    10f7:	c3                   	ret    

000010f8 <divide_zero_fault>:
    10f8:	6a ff                	push   $0xffffffff
    10fa:	6a 00                	push   $0x0
    10fc:	eb 58                	jmp    1156 <exception>

000010fe <single_step_fault>:
    10fe:	6a ff                	push   $0xffffffff
    1100:	6a 01                	push   $0x1
    1102:	eb 52                	jmp    1156 <exception>

00001104 <non_maskable_interrupt>:
    1104:	6a ff                	push   $0xffffffff
    1106:	6a 02                	push   $0x2
    1108:	eb 4c                	jmp    1156 <exception>

0000110a <breakpoint_trap>:
    110a:	6a ff                	push   $0xffffffff
    110c:	6a 03                	push   $0x3
    110e:	eb 46                	jmp    1156 <exception>

00001110 <overflow_trap>:
    1110:	6a ff                	push   $0xffffffff
    1112:	6a 04                	push   $0x4
    1114:	eb 40                	jmp    1156 <exception>

00001116 <bound_range_exceeded_fault>:
    1116:	6a ff                	push   $0xffffffff
    1118:	6a 05                	push   $0x5
    111a:	eb 3a                	jmp    1156 <exception>

0000111c <invalid_opcode_fault>:
    111c:	6a ff                	push   $0xffffffff
    111e:	6a 06                	push   $0x6
    1120:	eb 34                	jmp    1156 <exception>

00001122 <coprocessor_not_available_fault>:
    1122:	6a ff                	push   $0xffffffff
    1124:	6a 07                	push   $0x7
    1126:	eb 2e                	jmp    1156 <exception>

00001128 <double_fault_exception_abort>:
    1128:	6a 08                	push   $0x8
    112a:	eb 2a                	jmp    1156 <exception>

0000112c <coprocessor_segment_overrun>:
    112c:	6a ff                	push   $0xffffffff
    112e:	6a 09                	push   $0x9
    1130:	eb 24                	jmp    1156 <exception>

00001132 <invalid_task_state_segment_fault>:
    1132:	6a 0a                	push   $0xa
    1134:	eb 20                	jmp    1156 <exception>

00001136 <segment_not_present_fault>:
    1136:	6a 0b                	push   $0xb
    1138:	eb 1c                	jmp    1156 <exception>

0000113a <stack_exception_fault>:
    113a:	6a 0c                	push   $0xc
    113c:	eb 18                	jmp    1156 <exception>

0000113e <general_protection_exception_fault>:
    113e:	6a 0d                	push   $0xd
    1140:	eb 14                	jmp    1156 <exception>

00001142 <page_fault>:
    1142:	6a 0e                	push   $0xe
    1144:	eb 10                	jmp    1156 <exception>

00001146 <coprocessor_error_fault>:
    1146:	6a ff                	push   $0xffffffff
    1148:	6a 10                	push   $0x10
    114a:	eb 0a                	jmp    1156 <exception>

0000114c <align_check_fault>:
    114c:	6a 11                	push   $0x11
    114e:	eb 06                	jmp    1156 <exception>

00001150 <simd_float_exception_fault>:
    1150:	6a ff                	push   $0xffffffff
    1152:	6a 12                	push   $0x12
    1154:	eb 00                	jmp    1156 <exception>

00001156 <exception>:
    1156:	e8 7b 04 00 00       	call   15d6 <exception_handler>
    115b:	83 c4 08             	add    $0x8,%esp
    115e:	f4                   	hlt    

0000115f <hwint0>:
    115f:	60                   	pusha  
    1160:	1e                   	push   %ds
    1161:	06                   	push   %es
    1162:	0f a0                	push   %fs
    1164:	0f a8                	push   %gs
    1166:	66 8c d2             	mov    %ss,%dx
    1169:	8e da                	mov    %edx,%ds
    116b:	8e c2                	mov    %edx,%es
    116d:	8e e2                	mov    %edx,%fs
    116f:	b0 f9                	mov    $0xf9,%al
    1171:	e6 21                	out    %al,$0x21
    1173:	b0 20                	mov    $0x20,%al
    1175:	e6 20                	out    %al,$0x20
    1177:	ff 05 94 9e 00 00    	incl   0x9e94
    117d:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    1184:	75 05                	jne    118b <hwint0.2>

00001186 <hwint0.1>:
    1186:	bc 80 9e 00 00       	mov    $0x9e80,%esp

0000118b <hwint0.2>:
    118b:	fb                   	sti    
    118c:	e8 9a 3d 00 00       	call   4f2b <clock_handler>
    1191:	b0 f8                	mov    $0xf8,%al
    1193:	e6 21                	out    %al,$0x21
    1195:	fa                   	cli    
    1196:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    119d:	0f 85 19 01 00 00    	jne    12bc <reenter_restore>
    11a3:	e9 00 01 00 00       	jmp    12a8 <restore>

000011a8 <hwint1>:
    11a8:	60                   	pusha  
    11a9:	1e                   	push   %ds
    11aa:	06                   	push   %es
    11ab:	0f a0                	push   %fs
    11ad:	0f a8                	push   %gs
    11af:	66 8c d2             	mov    %ss,%dx
    11b2:	8e da                	mov    %edx,%ds
    11b4:	8e c2                	mov    %edx,%es
    11b6:	8e e2                	mov    %edx,%fs
    11b8:	b0 fa                	mov    $0xfa,%al
    11ba:	e6 21                	out    %al,$0x21
    11bc:	b0 20                	mov    $0x20,%al
    11be:	e6 20                	out    %al,$0x20
    11c0:	ff 05 94 9e 00 00    	incl   0x9e94
    11c6:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    11cd:	75 05                	jne    11d4 <hwint1.2>

000011cf <hwint1.1>:
    11cf:	bc 80 9e 00 00       	mov    $0x9e80,%esp

000011d4 <hwint1.2>:
    11d4:	fb                   	sti    
    11d5:	e8 3b 4b 00 00       	call   5d15 <keyboard_handler>
    11da:	b0 f8                	mov    $0xf8,%al
    11dc:	e6 21                	out    %al,$0x21
    11de:	fa                   	cli    
    11df:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    11e6:	0f 85 d0 00 00 00    	jne    12bc <reenter_restore>
    11ec:	e9 b7 00 00 00       	jmp    12a8 <restore>

000011f1 <hwint14>:
    11f1:	60                   	pusha  
    11f2:	1e                   	push   %ds
    11f3:	06                   	push   %es
    11f4:	0f a0                	push   %fs
    11f6:	0f a8                	push   %gs
    11f8:	66 8c d2             	mov    %ss,%dx
    11fb:	8e da                	mov    %edx,%ds
    11fd:	8e c2                	mov    %edx,%es
    11ff:	8e e2                	mov    %edx,%fs
    1201:	66 87 db             	xchg   %bx,%bx
    1204:	b0 ff                	mov    $0xff,%al
    1206:	e6 a1                	out    %al,$0xa1
    1208:	b0 20                	mov    $0x20,%al
    120a:	e6 20                	out    %al,$0x20
    120c:	90                   	nop
    120d:	e6 a0                	out    %al,$0xa0
    120f:	ff 05 94 9e 00 00    	incl   0x9e94
    1215:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    121c:	75 05                	jne    1223 <hwint14.2>

0000121e <hwint14.1>:
    121e:	bc 80 9e 00 00       	mov    $0x9e80,%esp

00001223 <hwint14.2>:
    1223:	fb                   	sti    
    1224:	e8 ff 25 00 00       	call   3828 <hd_handler>
    1229:	b0 bf                	mov    $0xbf,%al
    122b:	e6 a1                	out    %al,$0xa1
    122d:	fa                   	cli    
    122e:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    1235:	0f 85 81 00 00 00    	jne    12bc <reenter_restore>
    123b:	eb 6b                	jmp    12a8 <restore>

0000123d <sys_call>:
    123d:	60                   	pusha  
    123e:	1e                   	push   %ds
    123f:	06                   	push   %es
    1240:	0f a0                	push   %fs
    1242:	0f a8                	push   %gs
    1244:	89 e6                	mov    %esp,%esi
    1246:	66 8c d2             	mov    %ss,%dx
    1249:	8e da                	mov    %edx,%ds
    124b:	8e c2                	mov    %edx,%es
    124d:	8e e2                	mov    %edx,%fs
    124f:	ff 05 94 9e 00 00    	incl   0x9e94
    1255:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    125c:	75 05                	jne    1263 <sys_call.2>

0000125e <sys_call.1>:
    125e:	bc 80 9e 00 00       	mov    $0x9e80,%esp

00001263 <sys_call.2>:
    1263:	fb                   	sti    
    1264:	56                   	push   %esi
    1265:	ff 35 a0 a2 00 00    	pushl  0xa2a0
    126b:	53                   	push   %ebx
    126c:	51                   	push   %ecx
    126d:	ff 14 85 60 90 00 00 	call   *0x9060(,%eax,4)
    1274:	83 c4 0c             	add    $0xc,%esp
    1277:	5e                   	pop    %esi
    1278:	89 46 2c             	mov    %eax,0x2c(%esi)
    127b:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    1282:	75 38                	jne    12bc <reenter_restore>
    1284:	eb 22                	jmp    12a8 <restore>

00001286 <restart>:
    1286:	ff 0d 94 9e 00 00    	decl   0x9e94
    128c:	8b 25 a0 a2 00 00    	mov    0xa2a0,%esp
    1292:	0f 00 54 24 44       	lldt   0x44(%esp)
    1297:	8d 44 24 44          	lea    0x44(%esp),%eax
    129b:	a3 04 cc 00 00       	mov    %eax,0xcc04
    12a0:	0f a9                	pop    %gs
    12a2:	0f a1                	pop    %fs
    12a4:	07                   	pop    %es
    12a5:	1f                   	pop    %ds
    12a6:	61                   	popa   
    12a7:	cf                   	iret   

000012a8 <restore>:
    12a8:	8b 25 a0 a2 00 00    	mov    0xa2a0,%esp
    12ae:	0f 00 54 24 44       	lldt   0x44(%esp)
    12b3:	8d 44 24 44          	lea    0x44(%esp),%eax
    12b7:	a3 04 cc 00 00       	mov    %eax,0xcc04

000012bc <reenter_restore>:
    12bc:	ff 0d 94 9e 00 00    	decl   0x9e94
    12c2:	0f a9                	pop    %gs
    12c4:	0f a1                	pop    %fs
    12c6:	07                   	pop    %es
    12c7:	1f                   	pop    %ds
    12c8:	61                   	popa   
    12c9:	cf                   	iret   

000012ca <in_byte>:
    12ca:	31 d2                	xor    %edx,%edx
    12cc:	8b 54 24 04          	mov    0x4(%esp),%edx
    12d0:	31 c0                	xor    %eax,%eax
    12d2:	ec                   	in     (%dx),%al
    12d3:	90                   	nop
    12d4:	90                   	nop
    12d5:	c3                   	ret    

000012d6 <out_byte>:
    12d6:	31 d2                	xor    %edx,%edx
    12d8:	31 c0                	xor    %eax,%eax
    12da:	8b 54 24 04          	mov    0x4(%esp),%edx
    12de:	8a 44 24 08          	mov    0x8(%esp),%al
    12e2:	ee                   	out    %al,(%dx)
    12e3:	90                   	nop
    12e4:	90                   	nop
    12e5:	c3                   	ret    

000012e6 <in_byte2>:
    12e6:	55                   	push   %ebp
    12e7:	89 e5                	mov    %esp,%ebp
    12e9:	52                   	push   %edx
    12ea:	31 d2                	xor    %edx,%edx
    12ec:	66 8b 55 08          	mov    0x8(%ebp),%dx
    12f0:	31 c0                	xor    %eax,%eax
    12f2:	ec                   	in     (%dx),%al
    12f3:	90                   	nop
    12f4:	90                   	nop
    12f5:	5b                   	pop    %ebx
    12f6:	5d                   	pop    %ebp
    12f7:	c3                   	ret    

000012f8 <disable_int>:
    12f8:	fa                   	cli    
    12f9:	c3                   	ret    

000012fa <enable_int>:
    12fa:	fb                   	sti    
    12fb:	c3                   	ret    

000012fc <check_tss_esp0>:
    12fc:	55                   	push   %ebp
    12fd:	89 e5                	mov    %esp,%ebp
    12ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1302:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    1305:	83 c0 44             	add    $0x44,%eax
    1308:	8b 15 04 cc 00 00    	mov    0xcc04,%edx
    130e:	39 d0                	cmp    %edx,%eax
    1310:	74 7c                	je     138e <check_tss_esp0.2>

00001312 <check_tss_esp0.1>:
    1312:	50                   	push   %eax
    1313:	52                   	push   %edx
    1314:	68 00 90 00 00       	push   $0x9000
    1319:	e8 63 fd ff ff       	call   1081 <disp_str>
    131e:	83 c4 04             	add    $0x4,%esp
    1321:	5a                   	pop    %edx
    1322:	58                   	pop    %eax
    1323:	52                   	push   %edx
    1324:	50                   	push   %eax
    1325:	53                   	push   %ebx
    1326:	e8 82 02 00 00       	call   15ad <disp_int>
    132b:	83 c4 04             	add    $0x4,%esp
    132e:	58                   	pop    %eax
    132f:	5a                   	pop    %edx
    1330:	52                   	push   %edx
    1331:	50                   	push   %eax
    1332:	e8 76 02 00 00       	call   15ad <disp_int>
    1337:	58                   	pop    %eax
    1338:	5a                   	pop    %edx
    1339:	52                   	push   %edx
    133a:	50                   	push   %eax
    133b:	ff 35 94 9e 00 00    	pushl  0x9e94
    1341:	e8 67 02 00 00       	call   15ad <disp_int>
    1346:	83 c4 04             	add    $0x4,%esp
    1349:	58                   	pop    %eax
    134a:	5a                   	pop    %edx
    134b:	52                   	push   %edx
    134c:	50                   	push   %eax
    134d:	ff 72 ec             	pushl  -0x14(%edx)
    1350:	e8 58 02 00 00       	call   15ad <disp_int>
    1355:	83 c4 04             	add    $0x4,%esp
    1358:	58                   	pop    %eax
    1359:	5a                   	pop    %edx
    135a:	52                   	push   %edx
    135b:	50                   	push   %eax
    135c:	ff 70 ec             	pushl  -0x14(%eax)
    135f:	e8 49 02 00 00       	call   15ad <disp_int>
    1364:	83 c4 04             	add    $0x4,%esp
    1367:	58                   	pop    %eax
    1368:	5a                   	pop    %edx
    1369:	52                   	push   %edx
    136a:	50                   	push   %eax
    136b:	ff 35 a0 a2 00 00    	pushl  0xa2a0
    1371:	e8 37 02 00 00       	call   15ad <disp_int>
    1376:	83 c4 04             	add    $0x4,%esp
    1379:	58                   	pop    %eax
    137a:	5a                   	pop    %edx
    137b:	52                   	push   %edx
    137c:	50                   	push   %eax
    137d:	68 80 9e 00 00       	push   $0x9e80
    1382:	e8 26 02 00 00       	call   15ad <disp_int>
    1387:	83 c4 04             	add    $0x4,%esp
    138a:	58                   	pop    %eax
    138b:	5a                   	pop    %edx
    138c:	5d                   	pop    %ebp
    138d:	c3                   	ret    

0000138e <check_tss_esp0.2>:
    138e:	5d                   	pop    %ebp
    138f:	c3                   	ret    

00001390 <enable_8259A_casecade_irq>:
    1390:	9c                   	pushf  
    1391:	fa                   	cli    
    1392:	e4 21                	in     $0x21,%al
    1394:	24 fb                	and    $0xfb,%al
    1396:	e6 21                	out    %al,$0x21
    1398:	9d                   	popf   
    1399:	c3                   	ret    

0000139a <disable_8259A_casecade_irq>:
    139a:	9c                   	pushf  
    139b:	fa                   	cli    
    139c:	e4 21                	in     $0x21,%al
    139e:	0c 04                	or     $0x4,%al
    13a0:	e6 21                	out    %al,$0x21
    13a2:	9c                   	pushf  
    13a3:	c3                   	ret    

000013a4 <enable_8259A_slave_winchester_irq>:
    13a4:	9c                   	pushf  
    13a5:	fa                   	cli    
    13a6:	e4 a1                	in     $0xa1,%al
    13a8:	24 bf                	and    $0xbf,%al
    13aa:	e6 a1                	out    %al,$0xa1
    13ac:	9d                   	popf   
    13ad:	c3                   	ret    

000013ae <disable_8259A_slave_winchester_irq>:
    13ae:	9c                   	pushf  
    13af:	fa                   	cli    
    13b0:	e4 a1                	in     $0xa1,%al
    13b2:	0c 40                	or     $0x40,%al
    13b4:	e6 a1                	out    %al,$0xa1
    13b6:	9d                   	popf   
    13b7:	c3                   	ret    

000013b8 <untar>:
    13b8:	55                   	push   %ebp
    13b9:	89 e5                	mov    %esp,%ebp
    13bb:	81 ec 38 20 00 00    	sub    $0x2038,%esp
    13c1:	83 ec 08             	sub    $0x8,%esp
    13c4:	6a 00                	push   $0x0
    13c6:	ff 75 08             	pushl  0x8(%ebp)
    13c9:	e8 58 4d 00 00       	call   6126 <open>
    13ce:	83 c4 10             	add    $0x10,%esp
    13d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    13d4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    13db:	c7 45 e0 00 20 00 00 	movl   $0x2000,-0x20(%ebp)
    13e2:	83 ec 04             	sub    $0x4,%esp
    13e5:	68 00 02 00 00       	push   $0x200
    13ea:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    13f0:	50                   	push   %eax
    13f1:	ff 75 e8             	pushl  -0x18(%ebp)
    13f4:	e8 90 4d 00 00       	call   6189 <read>
    13f9:	83 c4 10             	add    $0x10,%esp
    13fc:	83 ec 0c             	sub    $0xc,%esp
    13ff:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    1405:	50                   	push   %eax
    1406:	e8 4e 56 00 00       	call   6a59 <Strlen>
    140b:	83 c4 10             	add    $0x10,%esp
    140e:	85 c0                	test   %eax,%eax
    1410:	0f 84 df 00 00 00    	je     14f5 <untar+0x13d>
    1416:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    141c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    141f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1422:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1425:	83 ec 08             	sub    $0x8,%esp
    1428:	6a 01                	push   $0x1
    142a:	ff 75 d8             	pushl  -0x28(%ebp)
    142d:	e8 f4 4c 00 00       	call   6126 <open>
    1432:	83 c4 10             	add    $0x10,%esp
    1435:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1438:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    143f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1442:	83 c0 7c             	add    $0x7c,%eax
    1445:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1448:	8b 45 d0             	mov    -0x30(%ebp),%eax
    144b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    144e:	eb 1f                	jmp    146f <untar+0xb7>
    1450:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1453:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    145a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    145d:	0f b6 00             	movzbl (%eax),%eax
    1460:	0f be c0             	movsbl %al,%eax
    1463:	83 e8 30             	sub    $0x30,%eax
    1466:	01 d0                	add    %edx,%eax
    1468:	89 45 f4             	mov    %eax,-0xc(%ebp)
    146b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    146f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1472:	0f b6 00             	movzbl (%eax),%eax
    1475:	84 c0                	test   %al,%al
    1477:	75 d7                	jne    1450 <untar+0x98>
    1479:	8b 45 f4             	mov    -0xc(%ebp),%eax
    147c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    147f:	eb 5b                	jmp    14dc <untar+0x124>
    1481:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1484:	39 45 e0             	cmp    %eax,-0x20(%ebp)
    1487:	0f 4e 45 e0          	cmovle -0x20(%ebp),%eax
    148b:	89 45 cc             	mov    %eax,-0x34(%ebp)
    148e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1491:	83 e8 01             	sub    $0x1,%eax
    1494:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    149a:	85 c0                	test   %eax,%eax
    149c:	0f 48 c2             	cmovs  %edx,%eax
    149f:	c1 f8 09             	sar    $0x9,%eax
    14a2:	83 c0 01             	add    $0x1,%eax
    14a5:	c1 e0 09             	shl    $0x9,%eax
    14a8:	83 ec 04             	sub    $0x4,%esp
    14ab:	50                   	push   %eax
    14ac:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    14b2:	50                   	push   %eax
    14b3:	ff 75 e8             	pushl  -0x18(%ebp)
    14b6:	e8 ce 4c 00 00       	call   6189 <read>
    14bb:	83 c4 10             	add    $0x10,%esp
    14be:	83 ec 04             	sub    $0x4,%esp
    14c1:	ff 75 cc             	pushl  -0x34(%ebp)
    14c4:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    14ca:	50                   	push   %eax
    14cb:	ff 75 d4             	pushl  -0x2c(%ebp)
    14ce:	e8 ed 4c 00 00       	call   61c0 <write>
    14d3:	83 c4 10             	add    $0x10,%esp
    14d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    14d9:	29 45 ec             	sub    %eax,-0x14(%ebp)
    14dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14e0:	75 9f                	jne    1481 <untar+0xc9>
    14e2:	83 ec 0c             	sub    $0xc,%esp
    14e5:	ff 75 d4             	pushl  -0x2c(%ebp)
    14e8:	e8 0a 4d 00 00       	call   61f7 <close>
    14ed:	83 c4 10             	add    $0x10,%esp
    14f0:	e9 ed fe ff ff       	jmp    13e2 <untar+0x2a>
    14f5:	90                   	nop
    14f6:	83 ec 0c             	sub    $0xc,%esp
    14f9:	ff 75 e8             	pushl  -0x18(%ebp)
    14fc:	e8 f6 4c 00 00       	call   61f7 <close>
    1501:	83 c4 10             	add    $0x10,%esp
    1504:	90                   	nop
    1505:	c9                   	leave  
    1506:	c3                   	ret    

00001507 <atoi>:
    1507:	55                   	push   %ebp
    1508:	89 e5                	mov    %esp,%ebp
    150a:	83 ec 10             	sub    $0x10,%esp
    150d:	8b 45 08             	mov    0x8(%ebp),%eax
    1510:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1513:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1516:	8d 50 01             	lea    0x1(%eax),%edx
    1519:	89 55 fc             	mov    %edx,-0x4(%ebp)
    151c:	c6 00 30             	movb   $0x30,(%eax)
    151f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1522:	8d 50 01             	lea    0x1(%eax),%edx
    1525:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1528:	c6 00 78             	movb   $0x78,(%eax)
    152b:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
    152f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1533:	75 0e                	jne    1543 <atoi+0x3c>
    1535:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1538:	8d 50 01             	lea    0x1(%eax),%edx
    153b:	89 55 fc             	mov    %edx,-0x4(%ebp)
    153e:	c6 00 30             	movb   $0x30,(%eax)
    1541:	eb 61                	jmp    15a4 <atoi+0x9d>
    1543:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
    154a:	eb 52                	jmp    159e <atoi+0x97>
    154c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    154f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1552:	89 c1                	mov    %eax,%ecx
    1554:	d3 fa                	sar    %cl,%edx
    1556:	89 d0                	mov    %edx,%eax
    1558:	83 e0 0f             	and    $0xf,%eax
    155b:	88 45 fb             	mov    %al,-0x5(%ebp)
    155e:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
    1562:	75 06                	jne    156a <atoi+0x63>
    1564:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
    1568:	74 2f                	je     1599 <atoi+0x92>
    156a:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
    156e:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1572:	83 c0 30             	add    $0x30,%eax
    1575:	88 45 fb             	mov    %al,-0x5(%ebp)
    1578:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
    157c:	7e 0a                	jle    1588 <atoi+0x81>
    157e:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1582:	83 c0 07             	add    $0x7,%eax
    1585:	88 45 fb             	mov    %al,-0x5(%ebp)
    1588:	8b 45 fc             	mov    -0x4(%ebp),%eax
    158b:	8d 50 01             	lea    0x1(%eax),%edx
    158e:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1591:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
    1595:	88 10                	mov    %dl,(%eax)
    1597:	eb 01                	jmp    159a <atoi+0x93>
    1599:	90                   	nop
    159a:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
    159e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15a2:	79 a8                	jns    154c <atoi+0x45>
    15a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15a7:	c6 00 00             	movb   $0x0,(%eax)
    15aa:	90                   	nop
    15ab:	c9                   	leave  
    15ac:	c3                   	ret    

000015ad <disp_int>:
    15ad:	55                   	push   %ebp
    15ae:	89 e5                	mov    %esp,%ebp
    15b0:	83 ec 18             	sub    $0x18,%esp
    15b3:	ff 75 08             	pushl  0x8(%ebp)
    15b6:	8d 45 e8             	lea    -0x18(%ebp),%eax
    15b9:	50                   	push   %eax
    15ba:	e8 48 ff ff ff       	call   1507 <atoi>
    15bf:	83 c4 08             	add    $0x8,%esp
    15c2:	83 ec 08             	sub    $0x8,%esp
    15c5:	6a 0b                	push   $0xb
    15c7:	8d 45 e8             	lea    -0x18(%ebp),%eax
    15ca:	50                   	push   %eax
    15cb:	e8 ec fa ff ff       	call   10bc <disp_str_colour>
    15d0:	83 c4 10             	add    $0x10,%esp
    15d3:	90                   	nop
    15d4:	c9                   	leave  
    15d5:	c3                   	ret    

000015d6 <exception_handler>:
    15d6:	55                   	push   %ebp
    15d7:	89 e5                	mov    %esp,%ebp
    15d9:	57                   	push   %edi
    15da:	56                   	push   %esi
    15db:	53                   	push   %ebx
    15dc:	83 ec 6c             	sub    $0x6c,%esp
    15df:	8d 45 90             	lea    -0x70(%ebp),%eax
    15e2:	bb 80 64 00 00       	mov    $0x6480,%ebx
    15e7:	ba 13 00 00 00       	mov    $0x13,%edx
    15ec:	89 c7                	mov    %eax,%edi
    15ee:	89 de                	mov    %ebx,%esi
    15f0:	89 d1                	mov    %edx,%ecx
    15f2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    15f4:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    15fb:	00 00 00 
    15fe:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1605:	eb 14                	jmp    161b <exception_handler+0x45>
    1607:	83 ec 0c             	sub    $0xc,%esp
    160a:	68 60 62 00 00       	push   $0x6260
    160f:	e8 6d fa ff ff       	call   1081 <disp_str>
    1614:	83 c4 10             	add    $0x10,%esp
    1617:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    161b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
    1622:	7e e3                	jle    1607 <exception_handler+0x31>
    1624:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    162b:	00 00 00 
    162e:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
    1635:	8b 45 08             	mov    0x8(%ebp),%eax
    1638:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
    163c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    163f:	83 ec 08             	sub    $0x8,%esp
    1642:	ff 75 e0             	pushl  -0x20(%ebp)
    1645:	ff 75 dc             	pushl  -0x24(%ebp)
    1648:	e8 6f fa ff ff       	call   10bc <disp_str_colour>
    164d:	83 c4 10             	add    $0x10,%esp
    1650:	83 ec 0c             	sub    $0xc,%esp
    1653:	68 62 62 00 00       	push   $0x6262
    1658:	e8 24 fa ff ff       	call   1081 <disp_str>
    165d:	83 c4 10             	add    $0x10,%esp
    1660:	83 ec 08             	sub    $0x8,%esp
    1663:	ff 75 e0             	pushl  -0x20(%ebp)
    1666:	68 65 62 00 00       	push   $0x6265
    166b:	e8 4c fa ff ff       	call   10bc <disp_str_colour>
    1670:	83 c4 10             	add    $0x10,%esp
    1673:	83 ec 0c             	sub    $0xc,%esp
    1676:	ff 75 08             	pushl  0x8(%ebp)
    1679:	e8 2f ff ff ff       	call   15ad <disp_int>
    167e:	83 c4 10             	add    $0x10,%esp
    1681:	83 ec 0c             	sub    $0xc,%esp
    1684:	68 62 62 00 00       	push   $0x6262
    1689:	e8 f3 f9 ff ff       	call   1081 <disp_str>
    168e:	83 c4 10             	add    $0x10,%esp
    1691:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
    1695:	74 44                	je     16db <exception_handler+0x105>
    1697:	83 ec 08             	sub    $0x8,%esp
    169a:	ff 75 e0             	pushl  -0x20(%ebp)
    169d:	68 6d 62 00 00       	push   $0x626d
    16a2:	e8 15 fa ff ff       	call   10bc <disp_str_colour>
    16a7:	83 c4 10             	add    $0x10,%esp
    16aa:	83 ec 08             	sub    $0x8,%esp
    16ad:	ff 75 e0             	pushl  -0x20(%ebp)
    16b0:	68 6d 62 00 00       	push   $0x626d
    16b5:	e8 02 fa ff ff       	call   10bc <disp_str_colour>
    16ba:	83 c4 10             	add    $0x10,%esp
    16bd:	83 ec 0c             	sub    $0xc,%esp
    16c0:	ff 75 0c             	pushl  0xc(%ebp)
    16c3:	e8 e5 fe ff ff       	call   15ad <disp_int>
    16c8:	83 c4 10             	add    $0x10,%esp
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	68 62 62 00 00       	push   $0x6262
    16d3:	e8 a9 f9 ff ff       	call   1081 <disp_str>
    16d8:	83 c4 10             	add    $0x10,%esp
    16db:	83 ec 08             	sub    $0x8,%esp
    16de:	ff 75 e0             	pushl  -0x20(%ebp)
    16e1:	68 77 62 00 00       	push   $0x6277
    16e6:	e8 d1 f9 ff ff       	call   10bc <disp_str_colour>
    16eb:	83 c4 10             	add    $0x10,%esp
    16ee:	83 ec 0c             	sub    $0xc,%esp
    16f1:	ff 75 14             	pushl  0x14(%ebp)
    16f4:	e8 b4 fe ff ff       	call   15ad <disp_int>
    16f9:	83 c4 10             	add    $0x10,%esp
    16fc:	83 ec 0c             	sub    $0xc,%esp
    16ff:	68 62 62 00 00       	push   $0x6262
    1704:	e8 78 f9 ff ff       	call   1081 <disp_str>
    1709:	83 c4 10             	add    $0x10,%esp
    170c:	83 ec 08             	sub    $0x8,%esp
    170f:	ff 75 e0             	pushl  -0x20(%ebp)
    1712:	68 7b 62 00 00       	push   $0x627b
    1717:	e8 a0 f9 ff ff       	call   10bc <disp_str_colour>
    171c:	83 c4 10             	add    $0x10,%esp
    171f:	83 ec 0c             	sub    $0xc,%esp
    1722:	ff 75 10             	pushl  0x10(%ebp)
    1725:	e8 83 fe ff ff       	call   15ad <disp_int>
    172a:	83 c4 10             	add    $0x10,%esp
    172d:	83 ec 0c             	sub    $0xc,%esp
    1730:	68 62 62 00 00       	push   $0x6262
    1735:	e8 47 f9 ff ff       	call   1081 <disp_str>
    173a:	83 c4 10             	add    $0x10,%esp
    173d:	83 ec 08             	sub    $0x8,%esp
    1740:	ff 75 e0             	pushl  -0x20(%ebp)
    1743:	68 80 62 00 00       	push   $0x6280
    1748:	e8 6f f9 ff ff       	call   10bc <disp_str_colour>
    174d:	83 c4 10             	add    $0x10,%esp
    1750:	83 ec 0c             	sub    $0xc,%esp
    1753:	ff 75 18             	pushl  0x18(%ebp)
    1756:	e8 52 fe ff ff       	call   15ad <disp_int>
    175b:	83 c4 10             	add    $0x10,%esp
    175e:	83 ec 0c             	sub    $0xc,%esp
    1761:	68 62 62 00 00       	push   $0x6262
    1766:	e8 16 f9 ff ff       	call   1081 <disp_str>
    176b:	83 c4 10             	add    $0x10,%esp
    176e:	90                   	nop
    176f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1772:	5b                   	pop    %ebx
    1773:	5e                   	pop    %esi
    1774:	5f                   	pop    %edi
    1775:	5d                   	pop    %ebp
    1776:	c3                   	ret    

00001777 <init_internal_interrupt>:
    1777:	55                   	push   %ebp
    1778:	89 e5                	mov    %esp,%ebp
    177a:	83 ec 08             	sub    $0x8,%esp
    177d:	6a 0e                	push   $0xe
    177f:	6a 08                	push   $0x8
    1781:	68 f8 10 00 00       	push   $0x10f8
    1786:	6a 00                	push   $0x0
    1788:	e8 0b 3b 00 00       	call   5298 <InitInterruptDesc>
    178d:	83 c4 10             	add    $0x10,%esp
    1790:	6a 0e                	push   $0xe
    1792:	6a 08                	push   $0x8
    1794:	68 fe 10 00 00       	push   $0x10fe
    1799:	6a 01                	push   $0x1
    179b:	e8 f8 3a 00 00       	call   5298 <InitInterruptDesc>
    17a0:	83 c4 10             	add    $0x10,%esp
    17a3:	6a 0e                	push   $0xe
    17a5:	6a 08                	push   $0x8
    17a7:	68 04 11 00 00       	push   $0x1104
    17ac:	6a 02                	push   $0x2
    17ae:	e8 e5 3a 00 00       	call   5298 <InitInterruptDesc>
    17b3:	83 c4 10             	add    $0x10,%esp
    17b6:	6a 0e                	push   $0xe
    17b8:	6a 08                	push   $0x8
    17ba:	68 0a 11 00 00       	push   $0x110a
    17bf:	6a 03                	push   $0x3
    17c1:	e8 d2 3a 00 00       	call   5298 <InitInterruptDesc>
    17c6:	83 c4 10             	add    $0x10,%esp
    17c9:	6a 0e                	push   $0xe
    17cb:	6a 08                	push   $0x8
    17cd:	68 10 11 00 00       	push   $0x1110
    17d2:	6a 04                	push   $0x4
    17d4:	e8 bf 3a 00 00       	call   5298 <InitInterruptDesc>
    17d9:	83 c4 10             	add    $0x10,%esp
    17dc:	6a 0e                	push   $0xe
    17de:	6a 08                	push   $0x8
    17e0:	68 16 11 00 00       	push   $0x1116
    17e5:	6a 05                	push   $0x5
    17e7:	e8 ac 3a 00 00       	call   5298 <InitInterruptDesc>
    17ec:	83 c4 10             	add    $0x10,%esp
    17ef:	6a 0e                	push   $0xe
    17f1:	6a 08                	push   $0x8
    17f3:	68 1c 11 00 00       	push   $0x111c
    17f8:	6a 06                	push   $0x6
    17fa:	e8 99 3a 00 00       	call   5298 <InitInterruptDesc>
    17ff:	83 c4 10             	add    $0x10,%esp
    1802:	6a 0e                	push   $0xe
    1804:	6a 08                	push   $0x8
    1806:	68 22 11 00 00       	push   $0x1122
    180b:	6a 07                	push   $0x7
    180d:	e8 86 3a 00 00       	call   5298 <InitInterruptDesc>
    1812:	83 c4 10             	add    $0x10,%esp
    1815:	6a 0e                	push   $0xe
    1817:	6a 08                	push   $0x8
    1819:	68 28 11 00 00       	push   $0x1128
    181e:	6a 08                	push   $0x8
    1820:	e8 73 3a 00 00       	call   5298 <InitInterruptDesc>
    1825:	83 c4 10             	add    $0x10,%esp
    1828:	6a 0e                	push   $0xe
    182a:	6a 08                	push   $0x8
    182c:	68 2c 11 00 00       	push   $0x112c
    1831:	6a 09                	push   $0x9
    1833:	e8 60 3a 00 00       	call   5298 <InitInterruptDesc>
    1838:	83 c4 10             	add    $0x10,%esp
    183b:	6a 0e                	push   $0xe
    183d:	6a 08                	push   $0x8
    183f:	68 32 11 00 00       	push   $0x1132
    1844:	6a 0a                	push   $0xa
    1846:	e8 4d 3a 00 00       	call   5298 <InitInterruptDesc>
    184b:	83 c4 10             	add    $0x10,%esp
    184e:	6a 0e                	push   $0xe
    1850:	6a 08                	push   $0x8
    1852:	68 36 11 00 00       	push   $0x1136
    1857:	6a 0b                	push   $0xb
    1859:	e8 3a 3a 00 00       	call   5298 <InitInterruptDesc>
    185e:	83 c4 10             	add    $0x10,%esp
    1861:	6a 0e                	push   $0xe
    1863:	6a 08                	push   $0x8
    1865:	68 3a 11 00 00       	push   $0x113a
    186a:	6a 0c                	push   $0xc
    186c:	e8 27 3a 00 00       	call   5298 <InitInterruptDesc>
    1871:	83 c4 10             	add    $0x10,%esp
    1874:	6a 0e                	push   $0xe
    1876:	6a 08                	push   $0x8
    1878:	68 3e 11 00 00       	push   $0x113e
    187d:	6a 0d                	push   $0xd
    187f:	e8 14 3a 00 00       	call   5298 <InitInterruptDesc>
    1884:	83 c4 10             	add    $0x10,%esp
    1887:	6a 0e                	push   $0xe
    1889:	6a 08                	push   $0x8
    188b:	68 42 11 00 00       	push   $0x1142
    1890:	6a 0e                	push   $0xe
    1892:	e8 01 3a 00 00       	call   5298 <InitInterruptDesc>
    1897:	83 c4 10             	add    $0x10,%esp
    189a:	6a 0e                	push   $0xe
    189c:	6a 08                	push   $0x8
    189e:	68 46 11 00 00       	push   $0x1146
    18a3:	6a 10                	push   $0x10
    18a5:	e8 ee 39 00 00       	call   5298 <InitInterruptDesc>
    18aa:	83 c4 10             	add    $0x10,%esp
    18ad:	6a 0e                	push   $0xe
    18af:	6a 08                	push   $0x8
    18b1:	68 4c 11 00 00       	push   $0x114c
    18b6:	6a 11                	push   $0x11
    18b8:	e8 db 39 00 00       	call   5298 <InitInterruptDesc>
    18bd:	83 c4 10             	add    $0x10,%esp
    18c0:	6a 0e                	push   $0xe
    18c2:	6a 08                	push   $0x8
    18c4:	68 50 11 00 00       	push   $0x1150
    18c9:	6a 12                	push   $0x12
    18cb:	e8 c8 39 00 00       	call   5298 <InitInterruptDesc>
    18d0:	83 c4 10             	add    $0x10,%esp
    18d3:	6a 0e                	push   $0xe
    18d5:	6a 0e                	push   $0xe
    18d7:	68 3d 12 00 00       	push   $0x123d
    18dc:	68 90 00 00 00       	push   $0x90
    18e1:	e8 b2 39 00 00       	call   5298 <InitInterruptDesc>
    18e6:	83 c4 10             	add    $0x10,%esp
    18e9:	90                   	nop
    18ea:	c9                   	leave  
    18eb:	c3                   	ret    

000018ec <test>:
    18ec:	55                   	push   %ebp
    18ed:	89 e5                	mov    %esp,%ebp
    18ef:	83 ec 18             	sub    $0x18,%esp
    18f2:	83 ec 0c             	sub    $0xc,%esp
    18f5:	68 cc 64 00 00       	push   $0x64cc
    18fa:	e8 82 f7 ff ff       	call   1081 <disp_str>
    18ff:	83 c4 10             	add    $0x10,%esp
    1902:	83 ec 0c             	sub    $0xc,%esp
    1905:	6a 06                	push   $0x6
    1907:	e8 a1 fc ff ff       	call   15ad <disp_int>
    190c:	83 c4 10             	add    $0x10,%esp
    190f:	83 ec 0c             	sub    $0xc,%esp
    1912:	68 ce 64 00 00       	push   $0x64ce
    1917:	e8 65 f7 ff ff       	call   1081 <disp_str>
    191c:	83 c4 10             	add    $0x10,%esp
    191f:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1926:	00 00 00 
    1929:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1930:	eb 14                	jmp    1946 <test+0x5a>
    1932:	83 ec 0c             	sub    $0xc,%esp
    1935:	68 60 62 00 00       	push   $0x6260
    193a:	e8 42 f7 ff ff       	call   1081 <disp_str>
    193f:	83 c4 10             	add    $0x10,%esp
    1942:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1946:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    194d:	7e e3                	jle    1932 <test+0x46>
    194f:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1956:	00 00 00 
    1959:	83 ec 08             	sub    $0x8,%esp
    195c:	6a 0f                	push   $0xf
    195e:	68 d0 64 00 00       	push   $0x64d0
    1963:	e8 54 f7 ff ff       	call   10bc <disp_str_colour>
    1968:	83 c4 10             	add    $0x10,%esp
    196b:	83 ec 0c             	sub    $0xc,%esp
    196e:	68 ce 64 00 00       	push   $0x64ce
    1973:	e8 09 f7 ff ff       	call   1081 <disp_str>
    1978:	83 c4 10             	add    $0x10,%esp
    197b:	83 ec 0c             	sub    $0xc,%esp
    197e:	68 89 00 00 00       	push   $0x89
    1983:	e8 25 fc ff ff       	call   15ad <disp_int>
    1988:	83 c4 10             	add    $0x10,%esp
    198b:	83 ec 0c             	sub    $0xc,%esp
    198e:	68 ce 64 00 00       	push   $0x64ce
    1993:	e8 e9 f6 ff ff       	call   1081 <disp_str>
    1998:	83 c4 10             	add    $0x10,%esp
    199b:	83 ec 08             	sub    $0x8,%esp
    199e:	6a 0f                	push   $0xf
    19a0:	68 d0 64 00 00       	push   $0x64d0
    19a5:	e8 12 f7 ff ff       	call   10bc <disp_str_colour>
    19aa:	83 c4 10             	add    $0x10,%esp
    19ad:	83 ec 08             	sub    $0x8,%esp
    19b0:	6a 74                	push   $0x74
    19b2:	68 d0 64 00 00       	push   $0x64d0
    19b7:	e8 00 f7 ff ff       	call   10bc <disp_str_colour>
    19bc:	83 c4 10             	add    $0x10,%esp
    19bf:	83 ec 0c             	sub    $0xc,%esp
    19c2:	68 ce 64 00 00       	push   $0x64ce
    19c7:	e8 b5 f6 ff ff       	call   1081 <disp_str>
    19cc:	83 c4 10             	add    $0x10,%esp
    19cf:	83 ec 08             	sub    $0x8,%esp
    19d2:	6a 0f                	push   $0xf
    19d4:	68 e0 64 00 00       	push   $0x64e0
    19d9:	e8 de f6 ff ff       	call   10bc <disp_str_colour>
    19de:	83 c4 10             	add    $0x10,%esp
    19e1:	83 ec 0c             	sub    $0xc,%esp
    19e4:	68 09 65 00 00       	push   $0x6509
    19e9:	e8 93 f6 ff ff       	call   1081 <disp_str>
    19ee:	83 c4 10             	add    $0x10,%esp
    19f1:	83 ec 0c             	sub    $0xc,%esp
    19f4:	68 1d 65 00 00       	push   $0x651d
    19f9:	e8 83 f6 ff ff       	call   1081 <disp_str>
    19fe:	83 c4 10             	add    $0x10,%esp
    1a01:	83 ec 0c             	sub    $0xc,%esp
    1a04:	6a 17                	push   $0x17
    1a06:	e8 a2 fb ff ff       	call   15ad <disp_int>
    1a0b:	83 c4 10             	add    $0x10,%esp
    1a0e:	83 ec 0c             	sub    $0xc,%esp
    1a11:	68 ce 64 00 00       	push   $0x64ce
    1a16:	e8 66 f6 ff ff       	call   1081 <disp_str>
    1a1b:	83 c4 10             	add    $0x10,%esp
    1a1e:	83 ec 0c             	sub    $0xc,%esp
    1a21:	68 0a 02 00 00       	push   $0x20a
    1a26:	e8 82 fb ff ff       	call   15ad <disp_int>
    1a2b:	83 c4 10             	add    $0x10,%esp
    1a2e:	83 ec 0c             	sub    $0xc,%esp
    1a31:	68 ce 64 00 00       	push   $0x64ce
    1a36:	e8 46 f6 ff ff       	call   1081 <disp_str>
    1a3b:	83 c4 10             	add    $0x10,%esp
    1a3e:	90                   	nop
    1a3f:	c9                   	leave  
    1a40:	c3                   	ret    

00001a41 <disp_str_colour3>:
    1a41:	55                   	push   %ebp
    1a42:	89 e5                	mov    %esp,%ebp
    1a44:	90                   	nop
    1a45:	5d                   	pop    %ebp
    1a46:	c3                   	ret    

00001a47 <spurious_irq>:
    1a47:	55                   	push   %ebp
    1a48:	89 e5                	mov    %esp,%ebp
    1a4a:	83 ec 08             	sub    $0x8,%esp
    1a4d:	83 ec 08             	sub    $0x8,%esp
    1a50:	6a 0b                	push   $0xb
    1a52:	68 2c 65 00 00       	push   $0x652c
    1a57:	e8 60 f6 ff ff       	call   10bc <disp_str_colour>
    1a5c:	83 c4 10             	add    $0x10,%esp
    1a5f:	83 ec 0c             	sub    $0xc,%esp
    1a62:	ff 75 08             	pushl  0x8(%ebp)
    1a65:	e8 43 fb ff ff       	call   15ad <disp_int>
    1a6a:	83 c4 10             	add    $0x10,%esp
    1a6d:	a1 a0 d4 00 00       	mov    0xd4a0,%eax
    1a72:	83 c0 01             	add    $0x1,%eax
    1a75:	a3 a0 d4 00 00       	mov    %eax,0xd4a0
    1a7a:	83 ec 0c             	sub    $0xc,%esp
    1a7d:	68 53 65 00 00       	push   $0x6553
    1a82:	e8 fa f5 ff ff       	call   1081 <disp_str>
    1a87:	83 c4 10             	add    $0x10,%esp
    1a8a:	a1 a0 d4 00 00       	mov    0xd4a0,%eax
    1a8f:	83 ec 0c             	sub    $0xc,%esp
    1a92:	50                   	push   %eax
    1a93:	e8 15 fb ff ff       	call   15ad <disp_int>
    1a98:	83 c4 10             	add    $0x10,%esp
    1a9b:	83 ec 0c             	sub    $0xc,%esp
    1a9e:	68 55 65 00 00       	push   $0x6555
    1aa3:	e8 d9 f5 ff ff       	call   1081 <disp_str>
    1aa8:	83 c4 10             	add    $0x10,%esp
    1aab:	83 ec 08             	sub    $0x8,%esp
    1aae:	6a 0c                	push   $0xc
    1ab0:	68 58 65 00 00       	push   $0x6558
    1ab5:	e8 02 f6 ff ff       	call   10bc <disp_str_colour>
    1aba:	83 c4 10             	add    $0x10,%esp
    1abd:	90                   	nop
    1abe:	c9                   	leave  
    1abf:	c3                   	ret    

00001ac0 <kernel_main>:
    1ac0:	55                   	push   %ebp
    1ac1:	89 e5                	mov    %esp,%ebp
    1ac3:	83 ec 28             	sub    $0x28,%esp
    1ac6:	c7 05 a0 d4 00 00 00 	movl   $0x0,0xd4a0
    1acd:	00 00 00 
    1ad0:	c7 05 70 cc 00 00 00 	movl   $0x0,0xcc70
    1ad7:	00 00 00 
    1ada:	c7 05 94 9e 00 00 00 	movl   $0x0,0x9e94
    1ae1:	00 00 00 
    1ae4:	c7 45 e8 40 4f 01 00 	movl   $0x14f40,-0x18(%ebp)
    1aeb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1af2:	e9 90 01 00 00       	jmp    1c87 <kernel_main+0x1c7>
    1af7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1afa:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    1b00:	05 40 4f 01 00       	add    $0x14f40,%eax
    1b05:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1b08:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
    1b0c:	7f 3f                	jg     1b4d <kernel_main+0x8d>
    1b0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b11:	c1 e0 03             	shl    $0x3,%eax
    1b14:	05 40 90 00 00       	add    $0x9040,%eax
    1b19:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b1c:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
    1b23:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    1b27:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
    1b2b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b2e:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
    1b35:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b38:	8b 50 60             	mov    0x60(%eax),%edx
    1b3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b3e:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b41:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b44:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
    1b4b:	eb 46                	jmp    1b93 <kernel_main+0xd3>
    1b4d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b50:	05 fc ff ff 1f       	add    $0x1ffffffc,%eax
    1b55:	c1 e0 03             	shl    $0x3,%eax
    1b58:	05 20 90 00 00       	add    $0x9020,%eax
    1b5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b60:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
    1b67:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
    1b6b:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
    1b6f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b72:	c7 40 60 0a 00 00 00 	movl   $0xa,0x60(%eax)
    1b79:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b7c:	8b 50 60             	mov    0x60(%eax),%edx
    1b7f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b82:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b88:	83 e8 04             	sub    $0x4,%eax
    1b8b:	89 c2                	mov    %eax,%edx
    1b8d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b90:	89 50 64             	mov    %edx,0x64(%eax)
    1b93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b96:	83 c0 09             	add    $0x9,%eax
    1b99:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1ba0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ba3:	66 89 50 44          	mov    %dx,0x44(%eax)
    1ba7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1baa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bad:	89 50 58             	mov    %edx,0x58(%eax)
    1bb0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bb3:	83 c0 46             	add    $0x46,%eax
    1bb6:	83 ec 04             	sub    $0x4,%esp
    1bb9:	6a 08                	push   $0x8
    1bbb:	68 a8 9e 00 00       	push   $0x9ea8
    1bc0:	50                   	push   %eax
    1bc1:	e8 2c 4e 00 00       	call   69f2 <Memcpy>
    1bc6:	83 c4 10             	add    $0x10,%esp
    1bc9:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1bcd:	c1 e0 05             	shl    $0x5,%eax
    1bd0:	83 c8 9a             	or     $0xffffff9a,%eax
    1bd3:	89 c2                	mov    %eax,%edx
    1bd5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bd8:	88 50 4b             	mov    %dl,0x4b(%eax)
    1bdb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bde:	83 c0 4e             	add    $0x4e,%eax
    1be1:	83 ec 04             	sub    $0x4,%esp
    1be4:	6a 08                	push   $0x8
    1be6:	68 d0 9e 00 00       	push   $0x9ed0
    1beb:	50                   	push   %eax
    1bec:	e8 01 4e 00 00       	call   69f2 <Memcpy>
    1bf1:	83 c4 10             	add    $0x10,%esp
    1bf4:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1bf8:	c1 e0 05             	shl    $0x5,%eax
    1bfb:	83 c8 92             	or     $0xffffff92,%eax
    1bfe:	89 c2                	mov    %eax,%edx
    1c00:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c03:	88 50 53             	mov    %dl,0x53(%eax)
    1c06:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c0a:	83 c8 04             	or     $0x4,%eax
    1c0d:	0f b6 c0             	movzbl %al,%eax
    1c10:	66 89 45 da          	mov    %ax,-0x26(%ebp)
    1c14:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c18:	83 c8 0c             	or     $0xc,%eax
    1c1b:	0f b6 c0             	movzbl %al,%eax
    1c1e:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
    1c22:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
    1c26:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c29:	89 50 34             	mov    %edx,0x34(%eax)
    1c2c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c30:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c33:	89 50 0c             	mov    %edx,0xc(%eax)
    1c36:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c3d:	89 50 04             	mov    %edx,0x4(%eax)
    1c40:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c44:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c47:	89 50 08             	mov    %edx,0x8(%eax)
    1c4a:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c4e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c51:	89 50 40             	mov    %edx,0x40(%eax)
    1c54:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c57:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
    1c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c60:	8b 00                	mov    (%eax),%eax
    1c62:	89 c2                	mov    %eax,%edx
    1c64:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c67:	89 50 30             	mov    %edx,0x30(%eax)
    1c6a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1c6d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c70:	89 50 3c             	mov    %edx,0x3c(%eax)
    1c73:	81 6d e8 00 04 00 00 	subl   $0x400,-0x18(%ebp)
    1c7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c7d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c80:	89 50 38             	mov    %edx,0x38(%eax)
    1c83:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1c87:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
    1c8b:	0f 8e 66 fe ff ff    	jle    1af7 <kernel_main+0x37>
    1c91:	c7 05 a0 a2 00 00 40 	movl   $0x14f40,0xa2a0
    1c98:	4f 01 00 
    1c9b:	83 ec 04             	sub    $0x4,%esp
    1c9e:	68 20 03 00 00       	push   $0x320
    1ca3:	6a 00                	push   $0x0
    1ca5:	68 cc a2 00 00       	push   $0xa2cc
    1caa:	e8 71 4d 00 00       	call   6a20 <Memset>
    1caf:	83 c4 10             	add    $0x10,%esp
    1cb2:	c7 05 c0 a2 00 00 cc 	movl   $0xa2cc,0xa2c0
    1cb9:	a2 00 00 
    1cbc:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    1cc1:	a3 c4 a2 00 00       	mov    %eax,0xa2c4
    1cc6:	c7 05 c8 a2 00 00 00 	movl   $0x0,0xa2c8
    1ccd:	00 00 00 
    1cd0:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1cd7:	00 00 00 
    1cda:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1ce1:	eb 14                	jmp    1cf7 <kernel_main+0x237>
    1ce3:	83 ec 0c             	sub    $0xc,%esp
    1ce6:	68 60 62 00 00       	push   $0x6260
    1ceb:	e8 91 f3 ff ff       	call   1081 <disp_str>
    1cf0:	83 c4 10             	add    $0x10,%esp
    1cf3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1cf7:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
    1cfe:	7e e3                	jle    1ce3 <kernel_main+0x223>
    1d00:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1d07:	00 00 00 
    1d0a:	e8 67 42 00 00       	call   5f76 <init_keyboard_handler>
    1d0f:	e8 72 f5 ff ff       	call   1286 <restart>
    1d14:	eb fe                	jmp    1d14 <kernel_main+0x254>

00001d16 <TestA>:
    1d16:	55                   	push   %ebp
    1d17:	89 e5                	mov    %esp,%ebp
    1d19:	83 ec 18             	sub    $0x18,%esp
    1d1c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d23:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d27:	74 1c                	je     1d45 <TestA+0x2f>
    1d29:	68 90 01 00 00       	push   $0x190
    1d2e:	68 7d 65 00 00       	push   $0x657d
    1d33:	68 7d 65 00 00       	push   $0x657d
    1d38:	68 84 65 00 00       	push   $0x6584
    1d3d:	e8 1f 05 00 00       	call   2261 <assertion_failure>
    1d42:	83 c4 10             	add    $0x10,%esp
    1d45:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1d49:	77 16                	ja     1d61 <TestA+0x4b>
    1d4b:	e8 c0 0d 00 00       	call   2b10 <get_ticks_ipc>
    1d50:	83 ec 08             	sub    $0x8,%esp
    1d53:	50                   	push   %eax
    1d54:	68 8b 65 00 00       	push   $0x658b
    1d59:	e8 b6 01 00 00       	call   1f14 <Printf>
    1d5e:	83 c4 10             	add    $0x10,%esp
    1d61:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d65:	eb de                	jmp    1d45 <TestA+0x2f>

00001d67 <delay>:
    1d67:	55                   	push   %ebp
    1d68:	89 e5                	mov    %esp,%ebp
    1d6a:	83 ec 10             	sub    $0x10,%esp
    1d6d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1d74:	eb 2d                	jmp    1da3 <delay+0x3c>
    1d76:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1d7d:	eb 1a                	jmp    1d99 <delay+0x32>
    1d7f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d86:	eb 04                	jmp    1d8c <delay+0x25>
    1d88:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d8c:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    1d93:	7e f3                	jle    1d88 <delay+0x21>
    1d95:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1d99:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
    1d9d:	7e e0                	jle    1d7f <delay+0x18>
    1d9f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1da3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1da6:	3b 45 08             	cmp    0x8(%ebp),%eax
    1da9:	7c cb                	jl     1d76 <delay+0xf>
    1dab:	90                   	nop
    1dac:	c9                   	leave  
    1dad:	c3                   	ret    

00001dae <TestB>:
    1dae:	55                   	push   %ebp
    1daf:	89 e5                	mov    %esp,%ebp
    1db1:	83 ec 18             	sub    $0x18,%esp
    1db4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1dbb:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1dbf:	77 16                	ja     1dd7 <TestB+0x29>
    1dc1:	e8 4a 0d 00 00       	call   2b10 <get_ticks_ipc>
    1dc6:	83 ec 08             	sub    $0x8,%esp
    1dc9:	50                   	push   %eax
    1dca:	68 8e 65 00 00       	push   $0x658e
    1dcf:	e8 40 01 00 00       	call   1f14 <Printf>
    1dd4:	83 c4 10             	add    $0x10,%esp
    1dd7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1ddb:	eb de                	jmp    1dbb <TestB+0xd>

00001ddd <TestC>:
    1ddd:	55                   	push   %ebp
    1dde:	89 e5                	mov    %esp,%ebp
    1de0:	83 ec 18             	sub    $0x18,%esp
    1de3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1dea:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1dee:	77 1a                	ja     1e0a <TestC+0x2d>
    1df0:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
    1df7:	83 ec 08             	sub    $0x8,%esp
    1dfa:	ff 75 f0             	pushl  -0x10(%ebp)
    1dfd:	68 95 65 00 00       	push   $0x6595
    1e02:	e8 0d 01 00 00       	call   1f14 <Printf>
    1e07:	83 c4 10             	add    $0x10,%esp
    1e0a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1e0e:	eb da                	jmp    1dea <TestC+0xd>

00001e10 <sys_get_ticks>:
    1e10:	55                   	push   %ebp
    1e11:	89 e5                	mov    %esp,%ebp
    1e13:	a1 a0 d4 00 00       	mov    0xd4a0,%eax
    1e18:	5d                   	pop    %ebp
    1e19:	c3                   	ret    

00001e1a <sys_write>:
    1e1a:	55                   	push   %ebp
    1e1b:	89 e5                	mov    %esp,%ebp
    1e1d:	83 ec 18             	sub    $0x18,%esp
    1e20:	8b 45 10             	mov    0x10(%ebp),%eax
    1e23:	8b 40 64             	mov    0x64(%eax),%eax
    1e26:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    1e2c:	05 00 a6 00 00       	add    $0xa600,%eax
    1e31:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1e34:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e37:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1e3a:	8b 45 08             	mov    0x8(%ebp),%eax
    1e3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e40:	eb 20                	jmp    1e62 <sys_write+0x48>
    1e42:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e45:	0f b6 00             	movzbl (%eax),%eax
    1e48:	0f b6 c0             	movzbl %al,%eax
    1e4b:	83 ec 08             	sub    $0x8,%esp
    1e4e:	50                   	push   %eax
    1e4f:	ff 75 ec             	pushl  -0x14(%ebp)
    1e52:	e8 79 37 00 00       	call   55d0 <out_char>
    1e57:	83 c4 10             	add    $0x10,%esp
    1e5a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1e5e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1e62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e66:	7f da                	jg     1e42 <sys_write+0x28>
    1e68:	90                   	nop
    1e69:	c9                   	leave  
    1e6a:	c3                   	ret    

00001e6b <milli_delay>:
    1e6b:	55                   	push   %ebp
    1e6c:	89 e5                	mov    %esp,%ebp
    1e6e:	83 ec 18             	sub    $0x18,%esp
    1e71:	e8 9a 0c 00 00       	call   2b10 <get_ticks_ipc>
    1e76:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1e79:	90                   	nop
    1e7a:	e8 91 0c 00 00       	call   2b10 <get_ticks_ipc>
    1e7f:	2b 45 f4             	sub    -0xc(%ebp),%eax
    1e82:	89 c1                	mov    %eax,%ecx
    1e84:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1e89:	89 c8                	mov    %ecx,%eax
    1e8b:	f7 ea                	imul   %edx
    1e8d:	c1 fa 05             	sar    $0x5,%edx
    1e90:	89 c8                	mov    %ecx,%eax
    1e92:	c1 f8 1f             	sar    $0x1f,%eax
    1e95:	29 c2                	sub    %eax,%edx
    1e97:	89 d0                	mov    %edx,%eax
    1e99:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
    1e9f:	39 45 08             	cmp    %eax,0x8(%ebp)
    1ea2:	77 d6                	ja     1e7a <milli_delay+0xf>
    1ea4:	90                   	nop
    1ea5:	c9                   	leave  
    1ea6:	c3                   	ret    

00001ea7 <TaskSys>:
    1ea7:	55                   	push   %ebp
    1ea8:	89 e5                	mov    %esp,%ebp
    1eaa:	81 ec 88 00 00 00    	sub    $0x88,%esp
    1eb0:	83 ec 04             	sub    $0x4,%esp
    1eb3:	6a 68                	push   $0x68
    1eb5:	6a 00                	push   $0x0
    1eb7:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1eba:	50                   	push   %eax
    1ebb:	e8 60 4b 00 00       	call   6a20 <Memset>
    1ec0:	83 c4 10             	add    $0x10,%esp
    1ec3:	83 ec 08             	sub    $0x8,%esp
    1ec6:	6a 11                	push   $0x11
    1ec8:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1ecb:	50                   	push   %eax
    1ecc:	e8 17 1a 00 00       	call   38e8 <receive_msg>
    1ed1:	83 c4 10             	add    $0x10,%esp
    1ed4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1ed7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1edb:	75 34                	jne    1f11 <TaskSys+0x6a>
    1edd:	8b 45 88             	mov    -0x78(%ebp),%eax
    1ee0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1ee3:	8b 45 84             	mov    -0x7c(%ebp),%eax
    1ee6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1ee9:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1eed:	75 1f                	jne    1f0e <TaskSys+0x67>
    1eef:	a1 a0 d4 00 00       	mov    0xd4a0,%eax
    1ef4:	89 45 8c             	mov    %eax,-0x74(%ebp)
    1ef7:	83 ec 08             	sub    $0x8,%esp
    1efa:	ff 75 ec             	pushl  -0x14(%ebp)
    1efd:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1f00:	50                   	push   %eax
    1f01:	e8 d2 19 00 00       	call   38d8 <send_msg>
    1f06:	83 c4 10             	add    $0x10,%esp
    1f09:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1f0c:	eb 01                	jmp    1f0f <TaskSys+0x68>
    1f0e:	90                   	nop
    1f0f:	eb 9f                	jmp    1eb0 <TaskSys+0x9>
    1f11:	90                   	nop
    1f12:	c9                   	leave  
    1f13:	c3                   	ret    

00001f14 <Printf>:
    1f14:	55                   	push   %ebp
    1f15:	89 e5                	mov    %esp,%ebp
    1f17:	81 ec 18 01 00 00    	sub    $0x118,%esp
    1f1d:	83 ec 04             	sub    $0x4,%esp
    1f20:	68 00 01 00 00       	push   $0x100
    1f25:	6a 00                	push   $0x0
    1f27:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f2d:	50                   	push   %eax
    1f2e:	e8 ed 4a 00 00       	call   6a20 <Memset>
    1f33:	83 c4 10             	add    $0x10,%esp
    1f36:	8d 45 0c             	lea    0xc(%ebp),%eax
    1f39:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1f3c:	8b 45 08             	mov    0x8(%ebp),%eax
    1f3f:	83 ec 04             	sub    $0x4,%esp
    1f42:	ff 75 f4             	pushl  -0xc(%ebp)
    1f45:	50                   	push   %eax
    1f46:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f4c:	50                   	push   %eax
    1f4d:	e8 1e 00 00 00       	call   1f70 <vsprintf>
    1f52:	83 c4 10             	add    $0x10,%esp
    1f55:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1f58:	83 ec 08             	sub    $0x8,%esp
    1f5b:	ff 75 f0             	pushl  -0x10(%ebp)
    1f5e:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f64:	50                   	push   %eax
    1f65:	e8 4e 19 00 00       	call   38b8 <write2>
    1f6a:	83 c4 10             	add    $0x10,%esp
    1f6d:	90                   	nop
    1f6e:	c9                   	leave  
    1f6f:	c3                   	ret    

00001f70 <vsprintf>:
    1f70:	55                   	push   %ebp
    1f71:	89 e5                	mov    %esp,%ebp
    1f73:	81 ec 68 02 00 00    	sub    $0x268,%esp
    1f79:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    1f7f:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
    1f85:	83 ec 04             	sub    $0x4,%esp
    1f88:	6a 40                	push   $0x40
    1f8a:	6a 00                	push   $0x0
    1f8c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    1f92:	50                   	push   %eax
    1f93:	e8 88 4a 00 00       	call   6a20 <Memset>
    1f98:	83 c4 10             	add    $0x10,%esp
    1f9b:	8b 45 10             	mov    0x10(%ebp),%eax
    1f9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1fa1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1fa8:	8b 45 08             	mov    0x8(%ebp),%eax
    1fab:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1fae:	e9 53 01 00 00       	jmp    2106 <vsprintf+0x196>
    1fb3:	8b 45 0c             	mov    0xc(%ebp),%eax
    1fb6:	0f b6 00             	movzbl (%eax),%eax
    1fb9:	3c 25                	cmp    $0x25,%al
    1fbb:	74 16                	je     1fd3 <vsprintf+0x63>
    1fbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fc0:	8d 50 01             	lea    0x1(%eax),%edx
    1fc3:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1fc6:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fc9:	0f b6 12             	movzbl (%edx),%edx
    1fcc:	88 10                	mov    %dl,(%eax)
    1fce:	e9 2f 01 00 00       	jmp    2102 <vsprintf+0x192>
    1fd3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1fd7:	8b 45 0c             	mov    0xc(%ebp),%eax
    1fda:	0f b6 00             	movzbl (%eax),%eax
    1fdd:	0f be c0             	movsbl %al,%eax
    1fe0:	83 f8 64             	cmp    $0x64,%eax
    1fe3:	74 26                	je     200b <vsprintf+0x9b>
    1fe5:	83 f8 64             	cmp    $0x64,%eax
    1fe8:	7f 0e                	jg     1ff8 <vsprintf+0x88>
    1fea:	83 f8 63             	cmp    $0x63,%eax
    1fed:	0f 84 f2 00 00 00    	je     20e5 <vsprintf+0x175>
    1ff3:	e9 0a 01 00 00       	jmp    2102 <vsprintf+0x192>
    1ff8:	83 f8 73             	cmp    $0x73,%eax
    1ffb:	0f 84 b0 00 00 00    	je     20b1 <vsprintf+0x141>
    2001:	83 f8 78             	cmp    $0x78,%eax
    2004:	74 5d                	je     2063 <vsprintf+0xf3>
    2006:	e9 f7 00 00 00       	jmp    2102 <vsprintf+0x192>
    200b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    200e:	8b 00                	mov    (%eax),%eax
    2010:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2013:	83 ec 04             	sub    $0x4,%esp
    2016:	6a 0a                	push   $0xa
    2018:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    201e:	50                   	push   %eax
    201f:	ff 75 e8             	pushl  -0x18(%ebp)
    2022:	e8 2a 0b 00 00       	call   2b51 <itoa>
    2027:	83 c4 10             	add    $0x10,%esp
    202a:	83 ec 08             	sub    $0x8,%esp
    202d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2033:	50                   	push   %eax
    2034:	ff 75 f4             	pushl  -0xc(%ebp)
    2037:	e8 03 4a 00 00       	call   6a3f <Strcpy>
    203c:	83 c4 10             	add    $0x10,%esp
    203f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2043:	83 ec 0c             	sub    $0xc,%esp
    2046:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    204c:	50                   	push   %eax
    204d:	e8 07 4a 00 00       	call   6a59 <Strlen>
    2052:	83 c4 10             	add    $0x10,%esp
    2055:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2058:	8b 45 ec             	mov    -0x14(%ebp),%eax
    205b:	01 45 f4             	add    %eax,-0xc(%ebp)
    205e:	e9 9f 00 00 00       	jmp    2102 <vsprintf+0x192>
    2063:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2066:	8b 00                	mov    (%eax),%eax
    2068:	83 ec 08             	sub    $0x8,%esp
    206b:	50                   	push   %eax
    206c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2072:	50                   	push   %eax
    2073:	e8 8f f4 ff ff       	call   1507 <atoi>
    2078:	83 c4 10             	add    $0x10,%esp
    207b:	83 ec 08             	sub    $0x8,%esp
    207e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2084:	50                   	push   %eax
    2085:	ff 75 f4             	pushl  -0xc(%ebp)
    2088:	e8 b2 49 00 00       	call   6a3f <Strcpy>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2094:	83 ec 0c             	sub    $0xc,%esp
    2097:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    209d:	50                   	push   %eax
    209e:	e8 b6 49 00 00       	call   6a59 <Strlen>
    20a3:	83 c4 10             	add    $0x10,%esp
    20a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    20a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20ac:	01 45 f4             	add    %eax,-0xc(%ebp)
    20af:	eb 51                	jmp    2102 <vsprintf+0x192>
    20b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20b4:	8b 00                	mov    (%eax),%eax
    20b6:	83 ec 08             	sub    $0x8,%esp
    20b9:	50                   	push   %eax
    20ba:	ff 75 f4             	pushl  -0xc(%ebp)
    20bd:	e8 7d 49 00 00       	call   6a3f <Strcpy>
    20c2:	83 c4 10             	add    $0x10,%esp
    20c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20c8:	8b 00                	mov    (%eax),%eax
    20ca:	83 ec 0c             	sub    $0xc,%esp
    20cd:	50                   	push   %eax
    20ce:	e8 86 49 00 00       	call   6a59 <Strlen>
    20d3:	83 c4 10             	add    $0x10,%esp
    20d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    20d9:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    20dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20e0:	01 45 f4             	add    %eax,-0xc(%ebp)
    20e3:	eb 1d                	jmp    2102 <vsprintf+0x192>
    20e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20e8:	0f b6 10             	movzbl (%eax),%edx
    20eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20ee:	88 10                	mov    %dl,(%eax)
    20f0:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    20f4:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    20fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20fe:	01 45 f4             	add    %eax,-0xc(%ebp)
    2101:	90                   	nop
    2102:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2106:	8b 45 0c             	mov    0xc(%ebp),%eax
    2109:	0f b6 00             	movzbl (%eax),%eax
    210c:	84 c0                	test   %al,%al
    210e:	0f 85 9f fe ff ff    	jne    1fb3 <vsprintf+0x43>
    2114:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2117:	2b 45 08             	sub    0x8(%ebp),%eax
    211a:	c9                   	leave  
    211b:	c3                   	ret    

0000211c <printx>:
    211c:	55                   	push   %ebp
    211d:	89 e5                	mov    %esp,%ebp
    211f:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2125:	8d 45 0c             	lea    0xc(%ebp),%eax
    2128:	89 45 f4             	mov    %eax,-0xc(%ebp)
    212b:	8b 45 08             	mov    0x8(%ebp),%eax
    212e:	83 ec 04             	sub    $0x4,%esp
    2131:	ff 75 f4             	pushl  -0xc(%ebp)
    2134:	50                   	push   %eax
    2135:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    213b:	50                   	push   %eax
    213c:	e8 2f fe ff ff       	call   1f70 <vsprintf>
    2141:	83 c4 10             	add    $0x10,%esp
    2144:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2147:	83 ec 08             	sub    $0x8,%esp
    214a:	ff 75 f0             	pushl  -0x10(%ebp)
    214d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2153:	50                   	push   %eax
    2154:	e8 6f 17 00 00       	call   38c8 <write_debug>
    2159:	83 c4 10             	add    $0x10,%esp
    215c:	90                   	nop
    215d:	c9                   	leave  
    215e:	c3                   	ret    

0000215f <sys_printx>:
    215f:	55                   	push   %ebp
    2160:	89 e5                	mov    %esp,%ebp
    2162:	83 ec 28             	sub    $0x28,%esp
    2165:	a1 94 9e 00 00       	mov    0x9e94,%eax
    216a:	85 c0                	test   %eax,%eax
    216c:	75 20                	jne    218e <sys_printx+0x2f>
    216e:	8b 45 10             	mov    0x10(%ebp),%eax
    2171:	8b 40 0c             	mov    0xc(%eax),%eax
    2174:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2177:	8b 45 ec             	mov    -0x14(%ebp),%eax
    217a:	83 ec 08             	sub    $0x8,%esp
    217d:	ff 75 10             	pushl  0x10(%ebp)
    2180:	50                   	push   %eax
    2181:	e8 09 2f 00 00       	call   508f <Seg2PhyAddrLDT>
    2186:	83 c4 10             	add    $0x10,%esp
    2189:	89 45 f4             	mov    %eax,-0xc(%ebp)
    218c:	eb 19                	jmp    21a7 <sys_printx+0x48>
    218e:	a1 94 9e 00 00       	mov    0x9e94,%eax
    2193:	85 c0                	test   %eax,%eax
    2195:	74 10                	je     21a7 <sys_printx+0x48>
    2197:	83 ec 0c             	sub    $0xc,%esp
    219a:	6a 30                	push   $0x30
    219c:	e8 ad 2e 00 00       	call   504e <Seg2PhyAddr>
    21a1:	83 c4 10             	add    $0x10,%esp
    21a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    21a7:	8b 55 08             	mov    0x8(%ebp),%edx
    21aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21ad:	01 d0                	add    %edx,%eax
    21af:	89 45 e8             	mov    %eax,-0x18(%ebp)
    21b2:	8b 45 10             	mov    0x10(%ebp),%eax
    21b5:	8b 40 64             	mov    0x64(%eax),%eax
    21b8:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    21be:	05 00 a6 00 00       	add    $0xa600,%eax
    21c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    21c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    21cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21cf:	0f b6 00             	movzbl (%eax),%eax
    21d2:	88 45 e3             	mov    %al,-0x1d(%ebp)
    21d5:	eb 3a                	jmp    2211 <sys_printx+0xb2>
    21d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21da:	0f b6 00             	movzbl (%eax),%eax
    21dd:	3c 3b                	cmp    $0x3b,%al
    21df:	74 0a                	je     21eb <sys_printx+0x8c>
    21e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21e4:	0f b6 00             	movzbl (%eax),%eax
    21e7:	3c 3a                	cmp    $0x3a,%al
    21e9:	75 06                	jne    21f1 <sys_printx+0x92>
    21eb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    21ef:	eb 20                	jmp    2211 <sys_printx+0xb2>
    21f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21f4:	0f b6 00             	movzbl (%eax),%eax
    21f7:	0f b6 c0             	movzbl %al,%eax
    21fa:	83 ec 08             	sub    $0x8,%esp
    21fd:	50                   	push   %eax
    21fe:	ff 75 e4             	pushl  -0x1c(%ebp)
    2201:	e8 ca 33 00 00       	call   55d0 <out_char>
    2206:	83 c4 10             	add    $0x10,%esp
    2209:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    220d:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    2211:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2215:	7f c0                	jg     21d7 <sys_printx+0x78>
    2217:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
    221b:	75 11                	jne    222e <sys_printx+0xcf>
    221d:	a1 94 9e 00 00       	mov    0x9e94,%eax
    2222:	85 c0                	test   %eax,%eax
    2224:	74 15                	je     223b <sys_printx+0xdc>
    2226:	e8 cd f0 ff ff       	call   12f8 <disable_int>
    222b:	f4                   	hlt    
    222c:	eb 0d                	jmp    223b <sys_printx+0xdc>
    222e:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
    2232:	75 07                	jne    223b <sys_printx+0xdc>
    2234:	e8 bf f0 ff ff       	call   12f8 <disable_int>
    2239:	f4                   	hlt    
    223a:	90                   	nop
    223b:	90                   	nop
    223c:	c9                   	leave  
    223d:	c3                   	ret    

0000223e <spin>:
    223e:	55                   	push   %ebp
    223f:	89 e5                	mov    %esp,%ebp
    2241:	eb fe                	jmp    2241 <spin+0x3>

00002243 <panic>:
    2243:	55                   	push   %ebp
    2244:	89 e5                	mov    %esp,%ebp
    2246:	83 ec 08             	sub    $0x8,%esp
    2249:	83 ec 04             	sub    $0x4,%esp
    224c:	ff 75 08             	pushl  0x8(%ebp)
    224f:	6a 3a                	push   $0x3a
    2251:	68 a2 65 00 00       	push   $0x65a2
    2256:	e8 c1 fe ff ff       	call   211c <printx>
    225b:	83 c4 10             	add    $0x10,%esp
    225e:	90                   	nop
    225f:	c9                   	leave  
    2260:	c3                   	ret    

00002261 <assertion_failure>:
    2261:	55                   	push   %ebp
    2262:	89 e5                	mov    %esp,%ebp
    2264:	83 ec 08             	sub    $0x8,%esp
    2267:	83 ec 08             	sub    $0x8,%esp
    226a:	ff 75 14             	pushl  0x14(%ebp)
    226d:	ff 75 10             	pushl  0x10(%ebp)
    2270:	ff 75 0c             	pushl  0xc(%ebp)
    2273:	ff 75 08             	pushl  0x8(%ebp)
    2276:	6a 3b                	push   $0x3b
    2278:	68 a8 65 00 00       	push   $0x65a8
    227d:	e8 9a fe ff ff       	call   211c <printx>
    2282:	83 c4 20             	add    $0x20,%esp
    2285:	83 ec 0c             	sub    $0xc,%esp
    2288:	68 db 65 00 00       	push   $0x65db
    228d:	e8 ac ff ff ff       	call   223e <spin>
    2292:	83 c4 10             	add    $0x10,%esp
    2295:	90                   	nop
    2296:	c9                   	leave  
    2297:	c3                   	ret    

00002298 <dead_lock>:
    2298:	55                   	push   %ebp
    2299:	89 e5                	mov    %esp,%ebp
    229b:	83 ec 18             	sub    $0x18,%esp
    229e:	83 ec 0c             	sub    $0xc,%esp
    22a1:	ff 75 08             	pushl  0x8(%ebp)
    22a4:	e8 fd 2c 00 00       	call   4fa6 <pid2proc>
    22a9:	83 c4 10             	add    $0x10,%esp
    22ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
    22af:	83 ec 0c             	sub    $0xc,%esp
    22b2:	ff 75 0c             	pushl  0xc(%ebp)
    22b5:	e8 ec 2c 00 00       	call   4fa6 <pid2proc>
    22ba:	83 c4 10             	add    $0x10,%esp
    22bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    22c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22c3:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    22ca:	3c 01                	cmp    $0x1,%al
    22cc:	75 5a                	jne    2328 <dead_lock+0x90>
    22ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22d1:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    22d7:	39 45 08             	cmp    %eax,0x8(%ebp)
    22da:	75 32                	jne    230e <dead_lock+0x76>
    22dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22df:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22e5:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    22eb:	83 ec 0c             	sub    $0xc,%esp
    22ee:	50                   	push   %eax
    22ef:	e8 b2 2c 00 00       	call   4fa6 <pid2proc>
    22f4:	83 c4 10             	add    $0x10,%esp
    22f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22fd:	8b 50 58             	mov    0x58(%eax),%edx
    2300:	8b 45 08             	mov    0x8(%ebp),%eax
    2303:	39 c2                	cmp    %eax,%edx
    2305:	75 db                	jne    22e2 <dead_lock+0x4a>
    2307:	b8 01 00 00 00       	mov    $0x1,%eax
    230c:	eb 20                	jmp    232e <dead_lock+0x96>
    230e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2311:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2317:	83 ec 0c             	sub    $0xc,%esp
    231a:	50                   	push   %eax
    231b:	e8 86 2c 00 00       	call   4fa6 <pid2proc>
    2320:	83 c4 10             	add    $0x10,%esp
    2323:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2326:	eb 98                	jmp    22c0 <dead_lock+0x28>
    2328:	90                   	nop
    2329:	b8 00 00 00 00       	mov    $0x0,%eax
    232e:	c9                   	leave  
    232f:	c3                   	ret    

00002330 <sys_send_msg>:
    2330:	55                   	push   %ebp
    2331:	89 e5                	mov    %esp,%ebp
    2333:	83 ec 38             	sub    $0x38,%esp
    2336:	83 ec 0c             	sub    $0xc,%esp
    2339:	ff 75 0c             	pushl  0xc(%ebp)
    233c:	e8 65 2c 00 00       	call   4fa6 <pid2proc>
    2341:	83 c4 10             	add    $0x10,%esp
    2344:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2347:	83 ec 0c             	sub    $0xc,%esp
    234a:	ff 75 10             	pushl  0x10(%ebp)
    234d:	e8 70 2c 00 00       	call   4fc2 <proc2pid>
    2352:	83 c4 10             	add    $0x10,%esp
    2355:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2358:	8b 45 08             	mov    0x8(%ebp),%eax
    235b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    235e:	89 10                	mov    %edx,(%eax)
    2360:	83 ec 08             	sub    $0x8,%esp
    2363:	ff 75 0c             	pushl  0xc(%ebp)
    2366:	ff 75 e8             	pushl  -0x18(%ebp)
    2369:	e8 2a ff ff ff       	call   2298 <dead_lock>
    236e:	83 c4 10             	add    $0x10,%esp
    2371:	83 f8 01             	cmp    $0x1,%eax
    2374:	75 10                	jne    2386 <sys_send_msg+0x56>
    2376:	83 ec 0c             	sub    $0xc,%esp
    2379:	68 e7 65 00 00       	push   $0x65e7
    237e:	e8 c0 fe ff ff       	call   2243 <panic>
    2383:	83 c4 10             	add    $0x10,%esp
    2386:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2389:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2390:	3c 02                	cmp    $0x2,%al
    2392:	0f 85 92 01 00 00    	jne    252a <sys_send_msg+0x1fa>
    2398:	8b 45 ec             	mov    -0x14(%ebp),%eax
    239b:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    23a1:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    23a4:	74 12                	je     23b8 <sys_send_msg+0x88>
    23a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23a9:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    23af:	83 f8 11             	cmp    $0x11,%eax
    23b2:	0f 85 72 01 00 00    	jne    252a <sys_send_msg+0x1fa>
    23b8:	8b 45 10             	mov    0x10(%ebp),%eax
    23bb:	8b 40 0c             	mov    0xc(%eax),%eax
    23be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    23c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    23c4:	83 ec 08             	sub    $0x8,%esp
    23c7:	ff 75 10             	pushl  0x10(%ebp)
    23ca:	50                   	push   %eax
    23cb:	e8 bf 2c 00 00       	call   508f <Seg2PhyAddrLDT>
    23d0:	83 c4 10             	add    $0x10,%esp
    23d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    23d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    23d9:	6b d0 68             	imul   $0x68,%eax,%edx
    23dc:	8b 45 08             	mov    0x8(%ebp),%eax
    23df:	01 d0                	add    %edx,%eax
    23e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
    23e4:	c7 45 d8 68 00 00 00 	movl   $0x68,-0x28(%ebp)
    23eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
    23ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23f1:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    23f7:	83 ec 04             	sub    $0x4,%esp
    23fa:	ff 75 d8             	pushl  -0x28(%ebp)
    23fd:	52                   	push   %edx
    23fe:	50                   	push   %eax
    23ff:	e8 ee 45 00 00       	call   69f2 <Memcpy>
    2404:	83 c4 10             	add    $0x10,%esp
    2407:	8b 45 10             	mov    0x10(%ebp),%eax
    240a:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    2411:	00 00 00 
    2414:	8b 45 10             	mov    0x10(%ebp),%eax
    2417:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
    241e:	00 00 00 
    2421:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2424:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    242b:	00 00 00 
    242e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2431:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    2438:	8b 45 ec             	mov    -0x14(%ebp),%eax
    243b:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    2442:	00 00 00 
    2445:	83 ec 0c             	sub    $0xc,%esp
    2448:	ff 75 ec             	pushl  -0x14(%ebp)
    244b:	e8 b6 06 00 00       	call   2b06 <unblock>
    2450:	83 c4 10             	add    $0x10,%esp
    2453:	8b 45 10             	mov    0x10(%ebp),%eax
    2456:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    245c:	85 c0                	test   %eax,%eax
    245e:	74 1c                	je     247c <sys_send_msg+0x14c>
    2460:	68 2e 03 00 00       	push   $0x32e
    2465:	68 7d 65 00 00       	push   $0x657d
    246a:	68 7d 65 00 00       	push   $0x657d
    246f:	68 f2 65 00 00       	push   $0x65f2
    2474:	e8 e8 fd ff ff       	call   2261 <assertion_failure>
    2479:	83 c4 10             	add    $0x10,%esp
    247c:	8b 45 10             	mov    0x10(%ebp),%eax
    247f:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2485:	85 c0                	test   %eax,%eax
    2487:	74 1c                	je     24a5 <sys_send_msg+0x175>
    2489:	68 2f 03 00 00       	push   $0x32f
    248e:	68 7d 65 00 00       	push   $0x657d
    2493:	68 7d 65 00 00       	push   $0x657d
    2498:	68 05 66 00 00       	push   $0x6605
    249d:	e8 bf fd ff ff       	call   2261 <assertion_failure>
    24a2:	83 c4 10             	add    $0x10,%esp
    24a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a8:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    24ae:	85 c0                	test   %eax,%eax
    24b0:	74 1c                	je     24ce <sys_send_msg+0x19e>
    24b2:	68 30 03 00 00       	push   $0x330
    24b7:	68 7d 65 00 00       	push   $0x657d
    24bc:	68 7d 65 00 00       	push   $0x657d
    24c1:	68 1c 66 00 00       	push   $0x661c
    24c6:	e8 96 fd ff ff       	call   2261 <assertion_failure>
    24cb:	83 c4 10             	add    $0x10,%esp
    24ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24d1:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    24d8:	84 c0                	test   %al,%al
    24da:	74 1c                	je     24f8 <sys_send_msg+0x1c8>
    24dc:	68 31 03 00 00       	push   $0x331
    24e1:	68 7d 65 00 00       	push   $0x657d
    24e6:	68 7d 65 00 00       	push   $0x657d
    24eb:	68 31 66 00 00       	push   $0x6631
    24f0:	e8 6c fd ff ff       	call   2261 <assertion_failure>
    24f5:	83 c4 10             	add    $0x10,%esp
    24f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24fb:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2501:	85 c0                	test   %eax,%eax
    2503:	0f 84 45 01 00 00    	je     264e <sys_send_msg+0x31e>
    2509:	68 32 03 00 00       	push   $0x332
    250e:	68 7d 65 00 00       	push   $0x657d
    2513:	68 7d 65 00 00       	push   $0x657d
    2518:	68 47 66 00 00       	push   $0x6647
    251d:	e8 3f fd ff ff       	call   2261 <assertion_failure>
    2522:	83 c4 10             	add    $0x10,%esp
    2525:	e9 24 01 00 00       	jmp    264e <sys_send_msg+0x31e>
    252a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2531:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2534:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2537:	8b 45 ec             	mov    -0x14(%ebp),%eax
    253a:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2540:	85 c0                	test   %eax,%eax
    2542:	75 1b                	jne    255f <sys_send_msg+0x22f>
    2544:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2547:	8b 55 10             	mov    0x10(%ebp),%edx
    254a:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    2550:	8b 45 10             	mov    0x10(%ebp),%eax
    2553:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    255a:	00 00 00 
    255d:	eb 3f                	jmp    259e <sys_send_msg+0x26e>
    255f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2562:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2568:	89 45 f0             	mov    %eax,-0x10(%ebp)
    256b:	eb 12                	jmp    257f <sys_send_msg+0x24f>
    256d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2570:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2573:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2576:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    257c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    257f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2583:	75 e8                	jne    256d <sys_send_msg+0x23d>
    2585:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2588:	8b 55 10             	mov    0x10(%ebp),%edx
    258b:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    2591:	8b 45 10             	mov    0x10(%ebp),%eax
    2594:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    259b:	00 00 00 
    259e:	8b 45 10             	mov    0x10(%ebp),%eax
    25a1:	8b 55 08             	mov    0x8(%ebp),%edx
    25a4:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    25aa:	8b 45 10             	mov    0x10(%ebp),%eax
    25ad:	8b 55 0c             	mov    0xc(%ebp),%edx
    25b0:	89 90 84 01 00 00    	mov    %edx,0x184(%eax)
    25b6:	8b 45 10             	mov    0x10(%ebp),%eax
    25b9:	c6 80 7c 01 00 00 01 	movb   $0x1,0x17c(%eax)
    25c0:	8b 45 10             	mov    0x10(%ebp),%eax
    25c3:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    25ca:	3c 01                	cmp    $0x1,%al
    25cc:	74 1c                	je     25ea <sys_send_msg+0x2ba>
    25ce:	68 4d 03 00 00       	push   $0x34d
    25d3:	68 7d 65 00 00       	push   $0x657d
    25d8:	68 7d 65 00 00       	push   $0x657d
    25dd:	68 65 66 00 00       	push   $0x6665
    25e2:	e8 7a fc ff ff       	call   2261 <assertion_failure>
    25e7:	83 c4 10             	add    $0x10,%esp
    25ea:	8b 45 10             	mov    0x10(%ebp),%eax
    25ed:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    25f3:	39 45 0c             	cmp    %eax,0xc(%ebp)
    25f6:	74 1c                	je     2614 <sys_send_msg+0x2e4>
    25f8:	68 4e 03 00 00       	push   $0x34e
    25fd:	68 7d 65 00 00       	push   $0x657d
    2602:	68 7d 65 00 00       	push   $0x657d
    2607:	68 80 66 00 00       	push   $0x6680
    260c:	e8 50 fc ff ff       	call   2261 <assertion_failure>
    2611:	83 c4 10             	add    $0x10,%esp
    2614:	8b 45 10             	mov    0x10(%ebp),%eax
    2617:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    261d:	39 45 08             	cmp    %eax,0x8(%ebp)
    2620:	74 1c                	je     263e <sys_send_msg+0x30e>
    2622:	68 4f 03 00 00       	push   $0x34f
    2627:	68 7d 65 00 00       	push   $0x657d
    262c:	68 7d 65 00 00       	push   $0x657d
    2631:	68 a2 66 00 00       	push   $0x66a2
    2636:	e8 26 fc ff ff       	call   2261 <assertion_failure>
    263b:	83 c4 10             	add    $0x10,%esp
    263e:	83 ec 0c             	sub    $0xc,%esp
    2641:	ff 75 10             	pushl  0x10(%ebp)
    2644:	e8 ab 04 00 00       	call   2af4 <block>
    2649:	83 c4 10             	add    $0x10,%esp
    264c:	eb 01                	jmp    264f <sys_send_msg+0x31f>
    264e:	90                   	nop
    264f:	b8 00 00 00 00       	mov    $0x0,%eax
    2654:	c9                   	leave  
    2655:	c3                   	ret    

00002656 <sys_receive_msg>:
    2656:	55                   	push   %ebp
    2657:	89 e5                	mov    %esp,%ebp
    2659:	81 ec 98 00 00 00    	sub    $0x98,%esp
    265f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2666:	83 ec 0c             	sub    $0xc,%esp
    2669:	ff 75 0c             	pushl  0xc(%ebp)
    266c:	e8 35 29 00 00       	call   4fa6 <pid2proc>
    2671:	83 c4 10             	add    $0x10,%esp
    2674:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2677:	83 ec 0c             	sub    $0xc,%esp
    267a:	ff 75 10             	pushl  0x10(%ebp)
    267d:	e8 40 29 00 00       	call   4fc2 <proc2pid>
    2682:	83 c4 10             	add    $0x10,%esp
    2685:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2688:	8b 45 10             	mov    0x10(%ebp),%eax
    268b:	8b 80 94 01 00 00    	mov    0x194(%eax),%eax
    2691:	85 c0                	test   %eax,%eax
    2693:	0f 84 bf 00 00 00    	je     2758 <sys_receive_msg+0x102>
    2699:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    269d:	74 0a                	je     26a9 <sys_receive_msg+0x53>
    269f:	83 7d 0c f6          	cmpl   $0xfffffff6,0xc(%ebp)
    26a3:	0f 85 af 00 00 00    	jne    2758 <sys_receive_msg+0x102>
    26a9:	83 ec 04             	sub    $0x4,%esp
    26ac:	6a 68                	push   $0x68
    26ae:	6a 00                	push   $0x0
    26b0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    26b6:	50                   	push   %eax
    26b7:	e8 64 43 00 00       	call   6a20 <Memset>
    26bc:	83 c4 10             	add    $0x10,%esp
    26bf:	c7 85 68 ff ff ff f6 	movl   $0xfffffff6,-0x98(%ebp)
    26c6:	ff ff ff 
    26c9:	c7 85 6c ff ff ff 01 	movl   $0x1,-0x94(%ebp)
    26d0:	00 00 00 
    26d3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    26d7:	75 1c                	jne    26f5 <sys_receive_msg+0x9f>
    26d9:	68 6e 03 00 00       	push   $0x36e
    26de:	68 7d 65 00 00       	push   $0x657d
    26e3:	68 7d 65 00 00       	push   $0x657d
    26e8:	68 b7 66 00 00       	push   $0x66b7
    26ed:	e8 6f fb ff ff       	call   2261 <assertion_failure>
    26f2:	83 c4 10             	add    $0x10,%esp
    26f5:	83 ec 08             	sub    $0x8,%esp
    26f8:	ff 75 08             	pushl  0x8(%ebp)
    26fb:	ff 75 e4             	pushl  -0x1c(%ebp)
    26fe:	e8 e6 29 00 00       	call   50e9 <v2l>
    2703:	83 c4 10             	add    $0x10,%esp
    2706:	89 c2                	mov    %eax,%edx
    2708:	83 ec 04             	sub    $0x4,%esp
    270b:	6a 68                	push   $0x68
    270d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    2713:	50                   	push   %eax
    2714:	52                   	push   %edx
    2715:	e8 d8 42 00 00       	call   69f2 <Memcpy>
    271a:	83 c4 10             	add    $0x10,%esp
    271d:	8b 45 10             	mov    0x10(%ebp),%eax
    2720:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    2727:	00 00 00 
    272a:	8b 45 10             	mov    0x10(%ebp),%eax
    272d:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    2734:	00 00 00 
    2737:	8b 45 10             	mov    0x10(%ebp),%eax
    273a:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
    2741:	00 00 00 
    2744:	8b 45 10             	mov    0x10(%ebp),%eax
    2747:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    274e:	b8 00 00 00 00       	mov    $0x0,%eax
    2753:	e9 0c 03 00 00       	jmp    2a64 <sys_receive_msg+0x40e>
    2758:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    275c:	75 26                	jne    2784 <sys_receive_msg+0x12e>
    275e:	8b 45 10             	mov    0x10(%ebp),%eax
    2761:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2767:	85 c0                	test   %eax,%eax
    2769:	0f 84 87 00 00 00    	je     27f6 <sys_receive_msg+0x1a0>
    276f:	8b 45 10             	mov    0x10(%ebp),%eax
    2772:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2778:	89 45 f0             	mov    %eax,-0x10(%ebp)
    277b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    2782:	eb 72                	jmp    27f6 <sys_receive_msg+0x1a0>
    2784:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2788:	78 6c                	js     27f6 <sys_receive_msg+0x1a0>
    278a:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
    278e:	7f 66                	jg     27f6 <sys_receive_msg+0x1a0>
    2790:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2793:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    279a:	3c 01                	cmp    $0x1,%al
    279c:	75 58                	jne    27f6 <sys_receive_msg+0x1a0>
    279e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27a1:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    27a7:	83 f8 11             	cmp    $0x11,%eax
    27aa:	74 0e                	je     27ba <sys_receive_msg+0x164>
    27ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27af:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    27b5:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    27b8:	75 3c                	jne    27f6 <sys_receive_msg+0x1a0>
    27ba:	8b 45 10             	mov    0x10(%ebp),%eax
    27bd:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    27c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    27c6:	eb 28                	jmp    27f0 <sys_receive_msg+0x19a>
    27c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
    27ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27d1:	8b 50 58             	mov    0x58(%eax),%edx
    27d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    27d7:	39 c2                	cmp    %eax,%edx
    27d9:	75 09                	jne    27e4 <sys_receive_msg+0x18e>
    27db:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    27e2:	eb 12                	jmp    27f6 <sys_receive_msg+0x1a0>
    27e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27e7:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    27ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    27f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    27f4:	75 d2                	jne    27c8 <sys_receive_msg+0x172>
    27f6:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    27fa:	0f 85 c6 01 00 00    	jne    29c6 <sys_receive_msg+0x370>
    2800:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2803:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2806:	8b 45 10             	mov    0x10(%ebp),%eax
    2809:	8b 40 0c             	mov    0xc(%eax),%eax
    280c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    280f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2812:	83 ec 08             	sub    $0x8,%esp
    2815:	ff 75 10             	pushl  0x10(%ebp)
    2818:	50                   	push   %eax
    2819:	e8 71 28 00 00       	call   508f <Seg2PhyAddrLDT>
    281e:	83 c4 10             	add    $0x10,%esp
    2821:	89 45 d8             	mov    %eax,-0x28(%ebp)
    2824:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2827:	6b d0 68             	imul   $0x68,%eax,%edx
    282a:	8b 45 08             	mov    0x8(%ebp),%eax
    282d:	01 d0                	add    %edx,%eax
    282f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2832:	c7 45 d0 68 00 00 00 	movl   $0x68,-0x30(%ebp)
    2839:	8b 45 e0             	mov    -0x20(%ebp),%eax
    283c:	8b 90 80 01 00 00    	mov    0x180(%eax),%edx
    2842:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2845:	83 ec 04             	sub    $0x4,%esp
    2848:	ff 75 d0             	pushl  -0x30(%ebp)
    284b:	52                   	push   %edx
    284c:	50                   	push   %eax
    284d:	e8 a0 41 00 00       	call   69f2 <Memcpy>
    2852:	83 c4 10             	add    $0x10,%esp
    2855:	8b 45 10             	mov    0x10(%ebp),%eax
    2858:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    285e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    2861:	75 21                	jne    2884 <sys_receive_msg+0x22e>
    2863:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2866:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    286c:	8b 45 10             	mov    0x10(%ebp),%eax
    286f:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    2875:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2878:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    287f:	00 00 00 
    2882:	eb 1f                	jmp    28a3 <sys_receive_msg+0x24d>
    2884:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2887:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    288d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2890:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    2896:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2899:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    28a0:	00 00 00 
    28a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    28a6:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    28ad:	00 00 00 
    28b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    28b3:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    28ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
    28bd:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
    28c4:	00 00 00 
    28c7:	8b 45 10             	mov    0x10(%ebp),%eax
    28ca:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    28d1:	00 00 00 
    28d4:	8b 45 10             	mov    0x10(%ebp),%eax
    28d7:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    28de:	00 00 00 
    28e1:	83 ec 0c             	sub    $0xc,%esp
    28e4:	ff 75 e0             	pushl  -0x20(%ebp)
    28e7:	e8 1a 02 00 00       	call   2b06 <unblock>
    28ec:	83 c4 10             	add    $0x10,%esp
    28ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
    28f2:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    28f8:	85 c0                	test   %eax,%eax
    28fa:	74 1c                	je     2918 <sys_receive_msg+0x2c2>
    28fc:	68 b5 03 00 00       	push   $0x3b5
    2901:	68 7d 65 00 00       	push   $0x657d
    2906:	68 7d 65 00 00       	push   $0x657d
    290b:	68 bb 66 00 00       	push   $0x66bb
    2910:	e8 4c f9 ff ff       	call   2261 <assertion_failure>
    2915:	83 c4 10             	add    $0x10,%esp
    2918:	8b 45 e0             	mov    -0x20(%ebp),%eax
    291b:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2922:	84 c0                	test   %al,%al
    2924:	74 1c                	je     2942 <sys_receive_msg+0x2ec>
    2926:	68 b6 03 00 00       	push   $0x3b6
    292b:	68 7d 65 00 00       	push   $0x657d
    2930:	68 7d 65 00 00       	push   $0x657d
    2935:	68 d4 66 00 00       	push   $0x66d4
    293a:	e8 22 f9 ff ff       	call   2261 <assertion_failure>
    293f:	83 c4 10             	add    $0x10,%esp
    2942:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2945:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    294b:	85 c0                	test   %eax,%eax
    294d:	74 1c                	je     296b <sys_receive_msg+0x315>
    294f:	68 b7 03 00 00       	push   $0x3b7
    2954:	68 7d 65 00 00       	push   $0x657d
    2959:	68 7d 65 00 00       	push   $0x657d
    295e:	68 f3 66 00 00       	push   $0x66f3
    2963:	e8 f9 f8 ff ff       	call   2261 <assertion_failure>
    2968:	83 c4 10             	add    $0x10,%esp
    296b:	8b 45 10             	mov    0x10(%ebp),%eax
    296e:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2974:	85 c0                	test   %eax,%eax
    2976:	74 1c                	je     2994 <sys_receive_msg+0x33e>
    2978:	68 b9 03 00 00       	push   $0x3b9
    297d:	68 7d 65 00 00       	push   $0x657d
    2982:	68 7d 65 00 00       	push   $0x657d
    2987:	68 1c 66 00 00       	push   $0x661c
    298c:	e8 d0 f8 ff ff       	call   2261 <assertion_failure>
    2991:	83 c4 10             	add    $0x10,%esp
    2994:	8b 45 10             	mov    0x10(%ebp),%eax
    2997:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    299d:	85 c0                	test   %eax,%eax
    299f:	0f 84 ba 00 00 00    	je     2a5f <sys_receive_msg+0x409>
    29a5:	68 ba 03 00 00       	push   $0x3ba
    29aa:	68 7d 65 00 00       	push   $0x657d
    29af:	68 7d 65 00 00       	push   $0x657d
    29b4:	68 47 66 00 00       	push   $0x6647
    29b9:	e8 a3 f8 ff ff       	call   2261 <assertion_failure>
    29be:	83 c4 10             	add    $0x10,%esp
    29c1:	e9 99 00 00 00       	jmp    2a5f <sys_receive_msg+0x409>
    29c6:	8b 45 10             	mov    0x10(%ebp),%eax
    29c9:	c6 80 7c 01 00 00 02 	movb   $0x2,0x17c(%eax)
    29d0:	8b 45 10             	mov    0x10(%ebp),%eax
    29d3:	8b 55 08             	mov    0x8(%ebp),%edx
    29d6:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    29dc:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    29e0:	75 0f                	jne    29f1 <sys_receive_msg+0x39b>
    29e2:	8b 45 10             	mov    0x10(%ebp),%eax
    29e5:	c7 80 88 01 00 00 11 	movl   $0x11,0x188(%eax)
    29ec:	00 00 00 
    29ef:	eb 0c                	jmp    29fd <sys_receive_msg+0x3a7>
    29f1:	8b 45 10             	mov    0x10(%ebp),%eax
    29f4:	8b 55 0c             	mov    0xc(%ebp),%edx
    29f7:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
    29fd:	8b 45 10             	mov    0x10(%ebp),%eax
    2a00:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2a07:	3c 02                	cmp    $0x2,%al
    2a09:	74 1c                	je     2a27 <sys_receive_msg+0x3d1>
    2a0b:	68 c7 03 00 00       	push   $0x3c7
    2a10:	68 7d 65 00 00       	push   $0x657d
    2a15:	68 7d 65 00 00       	push   $0x657d
    2a1a:	68 0f 67 00 00       	push   $0x670f
    2a1f:	e8 3d f8 ff ff       	call   2261 <assertion_failure>
    2a24:	83 c4 10             	add    $0x10,%esp
    2a27:	8b 45 10             	mov    0x10(%ebp),%eax
    2a2a:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2a30:	39 45 08             	cmp    %eax,0x8(%ebp)
    2a33:	74 1c                	je     2a51 <sys_receive_msg+0x3fb>
    2a35:	68 c8 03 00 00       	push   $0x3c8
    2a3a:	68 7d 65 00 00       	push   $0x657d
    2a3f:	68 7d 65 00 00       	push   $0x657d
    2a44:	68 2d 67 00 00       	push   $0x672d
    2a49:	e8 13 f8 ff ff       	call   2261 <assertion_failure>
    2a4e:	83 c4 10             	add    $0x10,%esp
    2a51:	83 ec 0c             	sub    $0xc,%esp
    2a54:	ff 75 10             	pushl  0x10(%ebp)
    2a57:	e8 98 00 00 00       	call   2af4 <block>
    2a5c:	83 c4 10             	add    $0x10,%esp
    2a5f:	b8 00 00 00 00       	mov    $0x0,%eax
    2a64:	c9                   	leave  
    2a65:	c3                   	ret    

00002a66 <send_rec>:
    2a66:	55                   	push   %ebp
    2a67:	89 e5                	mov    %esp,%ebp
    2a69:	83 ec 18             	sub    $0x18,%esp
    2a6c:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    2a70:	74 22                	je     2a94 <send_rec+0x2e>
    2a72:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    2a76:	74 32                	je     2aaa <send_rec+0x44>
    2a78:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    2a7c:	75 5c                	jne    2ada <send_rec+0x74>
    2a7e:	83 ec 08             	sub    $0x8,%esp
    2a81:	ff 75 10             	pushl  0x10(%ebp)
    2a84:	ff 75 0c             	pushl  0xc(%ebp)
    2a87:	e8 4c 0e 00 00       	call   38d8 <send_msg>
    2a8c:	83 c4 10             	add    $0x10,%esp
    2a8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a92:	eb 59                	jmp    2aed <send_rec+0x87>
    2a94:	83 ec 08             	sub    $0x8,%esp
    2a97:	ff 75 10             	pushl  0x10(%ebp)
    2a9a:	ff 75 0c             	pushl  0xc(%ebp)
    2a9d:	e8 46 0e 00 00       	call   38e8 <receive_msg>
    2aa2:	83 c4 10             	add    $0x10,%esp
    2aa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2aa8:	eb 43                	jmp    2aed <send_rec+0x87>
    2aaa:	83 ec 08             	sub    $0x8,%esp
    2aad:	ff 75 10             	pushl  0x10(%ebp)
    2ab0:	ff 75 0c             	pushl  0xc(%ebp)
    2ab3:	e8 20 0e 00 00       	call   38d8 <send_msg>
    2ab8:	83 c4 10             	add    $0x10,%esp
    2abb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2abe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ac2:	75 28                	jne    2aec <send_rec+0x86>
    2ac4:	83 ec 08             	sub    $0x8,%esp
    2ac7:	ff 75 10             	pushl  0x10(%ebp)
    2aca:	ff 75 0c             	pushl  0xc(%ebp)
    2acd:	e8 16 0e 00 00       	call   38e8 <receive_msg>
    2ad2:	83 c4 10             	add    $0x10,%esp
    2ad5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2ad8:	eb 12                	jmp    2aec <send_rec+0x86>
    2ada:	83 ec 0c             	sub    $0xc,%esp
    2add:	68 44 67 00 00       	push   $0x6744
    2ae2:	e8 5c f7 ff ff       	call   2243 <panic>
    2ae7:	83 c4 10             	add    $0x10,%esp
    2aea:	eb 01                	jmp    2aed <send_rec+0x87>
    2aec:	90                   	nop
    2aed:	b8 00 00 00 00       	mov    $0x0,%eax
    2af2:	c9                   	leave  
    2af3:	c3                   	ret    

00002af4 <block>:
    2af4:	55                   	push   %ebp
    2af5:	89 e5                	mov    %esp,%ebp
    2af7:	83 ec 08             	sub    $0x8,%esp
    2afa:	e8 92 23 00 00       	call   4e91 <schedule_process>
    2aff:	b8 00 00 00 00       	mov    $0x0,%eax
    2b04:	c9                   	leave  
    2b05:	c3                   	ret    

00002b06 <unblock>:
    2b06:	55                   	push   %ebp
    2b07:	89 e5                	mov    %esp,%ebp
    2b09:	b8 00 00 00 00       	mov    $0x0,%eax
    2b0e:	5d                   	pop    %ebp
    2b0f:	c3                   	ret    

00002b10 <get_ticks_ipc>:
    2b10:	55                   	push   %ebp
    2b11:	89 e5                	mov    %esp,%ebp
    2b13:	83 ec 78             	sub    $0x78,%esp
    2b16:	83 ec 04             	sub    $0x4,%esp
    2b19:	6a 68                	push   $0x68
    2b1b:	6a 00                	push   $0x0
    2b1d:	8d 45 88             	lea    -0x78(%ebp),%eax
    2b20:	50                   	push   %eax
    2b21:	e8 fa 3e 00 00       	call   6a20 <Memset>
    2b26:	83 c4 10             	add    $0x10,%esp
    2b29:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
    2b30:	83 ec 04             	sub    $0x4,%esp
    2b33:	6a 01                	push   $0x1
    2b35:	8d 45 88             	lea    -0x78(%ebp),%eax
    2b38:	50                   	push   %eax
    2b39:	6a 03                	push   $0x3
    2b3b:	e8 26 ff ff ff       	call   2a66 <send_rec>
    2b40:	83 c4 10             	add    $0x10,%esp
    2b43:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b46:	8b 45 90             	mov    -0x70(%ebp),%eax
    2b49:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2b4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2b4f:	c9                   	leave  
    2b50:	c3                   	ret    

00002b51 <itoa>:
    2b51:	55                   	push   %ebp
    2b52:	89 e5                	mov    %esp,%ebp
    2b54:	53                   	push   %ebx
    2b55:	83 ec 14             	sub    $0x14,%esp
    2b58:	8b 45 08             	mov    0x8(%ebp),%eax
    2b5b:	99                   	cltd   
    2b5c:	f7 7d 10             	idivl  0x10(%ebp)
    2b5f:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2b62:	8b 45 08             	mov    0x8(%ebp),%eax
    2b65:	99                   	cltd   
    2b66:	f7 7d 10             	idivl  0x10(%ebp)
    2b69:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2b6c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b70:	74 14                	je     2b86 <itoa+0x35>
    2b72:	83 ec 04             	sub    $0x4,%esp
    2b75:	ff 75 10             	pushl  0x10(%ebp)
    2b78:	ff 75 0c             	pushl  0xc(%ebp)
    2b7b:	ff 75 f0             	pushl  -0x10(%ebp)
    2b7e:	e8 ce ff ff ff       	call   2b51 <itoa>
    2b83:	83 c4 10             	add    $0x10,%esp
    2b86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b89:	8d 58 30             	lea    0x30(%eax),%ebx
    2b8c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b8f:	8b 00                	mov    (%eax),%eax
    2b91:	8d 48 01             	lea    0x1(%eax),%ecx
    2b94:	8b 55 0c             	mov    0xc(%ebp),%edx
    2b97:	89 0a                	mov    %ecx,(%edx)
    2b99:	89 da                	mov    %ebx,%edx
    2b9b:	88 10                	mov    %dl,(%eax)
    2b9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ba0:	8b 00                	mov    (%eax),%eax
    2ba2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ba5:	c9                   	leave  
    2ba6:	c3                   	ret    

00002ba7 <i2a>:
    2ba7:	55                   	push   %ebp
    2ba8:	89 e5                	mov    %esp,%ebp
    2baa:	53                   	push   %ebx
    2bab:	83 ec 14             	sub    $0x14,%esp
    2bae:	8b 45 08             	mov    0x8(%ebp),%eax
    2bb1:	99                   	cltd   
    2bb2:	f7 7d 0c             	idivl  0xc(%ebp)
    2bb5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2bb8:	8b 45 08             	mov    0x8(%ebp),%eax
    2bbb:	99                   	cltd   
    2bbc:	f7 7d 0c             	idivl  0xc(%ebp)
    2bbf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2bc2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2bc6:	74 14                	je     2bdc <i2a+0x35>
    2bc8:	83 ec 04             	sub    $0x4,%esp
    2bcb:	ff 75 10             	pushl  0x10(%ebp)
    2bce:	ff 75 0c             	pushl  0xc(%ebp)
    2bd1:	ff 75 f0             	pushl  -0x10(%ebp)
    2bd4:	e8 ce ff ff ff       	call   2ba7 <i2a>
    2bd9:	83 c4 10             	add    $0x10,%esp
    2bdc:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2be0:	7f 0a                	jg     2bec <i2a+0x45>
    2be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2be5:	83 c0 30             	add    $0x30,%eax
    2be8:	89 c3                	mov    %eax,%ebx
    2bea:	eb 08                	jmp    2bf4 <i2a+0x4d>
    2bec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bef:	83 c0 37             	add    $0x37,%eax
    2bf2:	89 c3                	mov    %eax,%ebx
    2bf4:	8b 45 10             	mov    0x10(%ebp),%eax
    2bf7:	8b 00                	mov    (%eax),%eax
    2bf9:	8d 48 01             	lea    0x1(%eax),%ecx
    2bfc:	8b 55 10             	mov    0x10(%ebp),%edx
    2bff:	89 0a                	mov    %ecx,(%edx)
    2c01:	88 18                	mov    %bl,(%eax)
    2c03:	8b 45 10             	mov    0x10(%ebp),%eax
    2c06:	8b 00                	mov    (%eax),%eax
    2c08:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c0b:	c9                   	leave  
    2c0c:	c3                   	ret    

00002c0d <inform_int>:
    2c0d:	55                   	push   %ebp
    2c0e:	89 e5                	mov    %esp,%ebp
    2c10:	83 ec 18             	sub    $0x18,%esp
    2c13:	83 ec 0c             	sub    $0xc,%esp
    2c16:	ff 75 08             	pushl  0x8(%ebp)
    2c19:	e8 88 23 00 00       	call   4fa6 <pid2proc>
    2c1e:	83 c4 10             	add    $0x10,%esp
    2c21:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c24:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c27:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2c2e:	0f b6 c0             	movzbl %al,%eax
    2c31:	83 e0 02             	and    $0x2,%eax
    2c34:	85 c0                	test   %eax,%eax
    2c36:	74 5d                	je     2c95 <inform_int+0x88>
    2c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c3b:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2c41:	83 f8 f6             	cmp    $0xfffffff6,%eax
    2c44:	74 0e                	je     2c54 <inform_int+0x47>
    2c46:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c49:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2c4f:	83 f8 11             	cmp    $0x11,%eax
    2c52:	75 4e                	jne    2ca2 <inform_int+0x95>
    2c54:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c57:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    2c5e:	00 00 00 
    2c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c64:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    2c6b:	00 00 00 
    2c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c71:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    2c78:	00 00 00 
    2c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c7e:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    2c85:	83 ec 0c             	sub    $0xc,%esp
    2c88:	ff 75 f4             	pushl  -0xc(%ebp)
    2c8b:	e8 76 fe ff ff       	call   2b06 <unblock>
    2c90:	83 c4 10             	add    $0x10,%esp
    2c93:	eb 0d                	jmp    2ca2 <inform_int+0x95>
    2c95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c98:	c7 80 94 01 00 00 01 	movl   $0x1,0x194(%eax)
    2c9f:	00 00 00 
    2ca2:	90                   	nop
    2ca3:	c9                   	leave  
    2ca4:	c3                   	ret    

00002ca5 <TaskHD>:
    2ca5:	55                   	push   %ebp
    2ca6:	89 e5                	mov    %esp,%ebp
    2ca8:	83 ec 08             	sub    $0x8,%esp
    2cab:	83 ec 08             	sub    $0x8,%esp
    2cae:	68 59 67 00 00       	push   $0x6759
    2cb3:	68 6f 67 00 00       	push   $0x676f
    2cb8:	e8 57 f2 ff ff       	call   1f14 <Printf>
    2cbd:	83 c4 10             	add    $0x10,%esp
    2cc0:	e8 07 00 00 00       	call   2ccc <init_hd>
    2cc5:	e8 36 00 00 00       	call   2d00 <hd_handle>
    2cca:	eb fe                	jmp    2cca <TaskHD+0x25>

00002ccc <init_hd>:
    2ccc:	55                   	push   %ebp
    2ccd:	89 e5                	mov    %esp,%ebp
    2ccf:	83 ec 18             	sub    $0x18,%esp
    2cd2:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
    2cd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cdc:	0f b6 00             	movzbl (%eax),%eax
    2cdf:	0f be c0             	movsbl %al,%eax
    2ce2:	83 ec 08             	sub    $0x8,%esp
    2ce5:	50                   	push   %eax
    2ce6:	68 73 67 00 00       	push   $0x6773
    2ceb:	e8 24 f2 ff ff       	call   1f14 <Printf>
    2cf0:	83 c4 10             	add    $0x10,%esp
    2cf3:	e8 98 e6 ff ff       	call   1390 <enable_8259A_casecade_irq>
    2cf8:	e8 a7 e6 ff ff       	call   13a4 <enable_8259A_slave_winchester_irq>
    2cfd:	90                   	nop
    2cfe:	c9                   	leave  
    2cff:	c3                   	ret    

00002d00 <hd_handle>:
    2d00:	55                   	push   %ebp
    2d01:	89 e5                	mov    %esp,%ebp
    2d03:	83 ec 78             	sub    $0x78,%esp
    2d06:	83 ec 08             	sub    $0x8,%esp
    2d09:	68 7b 67 00 00       	push   $0x677b
    2d0e:	68 6f 67 00 00       	push   $0x676f
    2d13:	e8 fc f1 ff ff       	call   1f14 <Printf>
    2d18:	83 c4 10             	add    $0x10,%esp
    2d1b:	83 ec 04             	sub    $0x4,%esp
    2d1e:	6a 68                	push   $0x68
    2d20:	6a 00                	push   $0x0
    2d22:	8d 45 88             	lea    -0x78(%ebp),%eax
    2d25:	50                   	push   %eax
    2d26:	e8 f5 3c 00 00       	call   6a20 <Memset>
    2d2b:	83 c4 10             	add    $0x10,%esp
    2d2e:	83 ec 04             	sub    $0x4,%esp
    2d31:	6a 11                	push   $0x11
    2d33:	8d 45 88             	lea    -0x78(%ebp),%eax
    2d36:	50                   	push   %eax
    2d37:	6a 02                	push   $0x2
    2d39:	e8 28 fd ff ff       	call   2a66 <send_rec>
    2d3e:	83 c4 10             	add    $0x10,%esp
    2d41:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2d44:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2d47:	8b 45 88             	mov    -0x78(%ebp),%eax
    2d4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2d4d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2d51:	74 59                	je     2dac <hd_handle+0xac>
    2d53:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2d57:	77 0b                	ja     2d64 <hd_handle+0x64>
    2d59:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2d5d:	74 16                	je     2d75 <hd_handle+0x75>
    2d5f:	e9 98 00 00 00       	jmp    2dfc <hd_handle+0xfc>
    2d64:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    2d68:	74 42                	je     2dac <hd_handle+0xac>
    2d6a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    2d6e:	74 65                	je     2dd5 <hd_handle+0xd5>
    2d70:	e9 87 00 00 00       	jmp    2dfc <hd_handle+0xfc>
    2d75:	83 ec 04             	sub    $0x4,%esp
    2d78:	ff 75 f0             	pushl  -0x10(%ebp)
    2d7b:	68 91 67 00 00       	push   $0x6791
    2d80:	68 99 67 00 00       	push   $0x6799
    2d85:	e8 8a f1 ff ff       	call   1f14 <Printf>
    2d8a:	83 c4 10             	add    $0x10,%esp
    2d8d:	e8 90 07 00 00       	call   3522 <hd_open>
    2d92:	83 ec 04             	sub    $0x4,%esp
    2d95:	ff 75 f0             	pushl  -0x10(%ebp)
    2d98:	68 a0 67 00 00       	push   $0x67a0
    2d9d:	68 99 67 00 00       	push   $0x6799
    2da2:	e8 6d f1 ff ff       	call   1f14 <Printf>
    2da7:	83 c4 10             	add    $0x10,%esp
    2daa:	eb 61                	jmp    2e0d <hd_handle+0x10d>
    2dac:	83 ec 04             	sub    $0x4,%esp
    2daf:	ff 75 f0             	pushl  -0x10(%ebp)
    2db2:	68 ac 67 00 00       	push   $0x67ac
    2db7:	68 99 67 00 00       	push   $0x6799
    2dbc:	e8 53 f1 ff ff       	call   1f14 <Printf>
    2dc1:	83 c4 10             	add    $0x10,%esp
    2dc4:	83 ec 0c             	sub    $0xc,%esp
    2dc7:	8d 45 88             	lea    -0x78(%ebp),%eax
    2dca:	50                   	push   %eax
    2dcb:	e8 4b 08 00 00       	call   361b <hd_rdwt>
    2dd0:	83 c4 10             	add    $0x10,%esp
    2dd3:	eb 38                	jmp    2e0d <hd_handle+0x10d>
    2dd5:	83 ec 0c             	sub    $0xc,%esp
    2dd8:	6a 00                	push   $0x0
    2dda:	e8 83 07 00 00       	call   3562 <get_hd_ioctl>
    2ddf:	83 c4 10             	add    $0x10,%esp
    2de2:	83 ec 04             	sub    $0x4,%esp
    2de5:	ff 75 f0             	pushl  -0x10(%ebp)
    2de8:	68 b5 67 00 00       	push   $0x67b5
    2ded:	68 99 67 00 00       	push   $0x6799
    2df2:	e8 1d f1 ff ff       	call   1f14 <Printf>
    2df7:	83 c4 10             	add    $0x10,%esp
    2dfa:	eb 11                	jmp    2e0d <hd_handle+0x10d>
    2dfc:	83 ec 0c             	sub    $0xc,%esp
    2dff:	68 c2 67 00 00       	push   $0x67c2
    2e04:	e8 3a f4 ff ff       	call   2243 <panic>
    2e09:	83 c4 10             	add    $0x10,%esp
    2e0c:	90                   	nop
    2e0d:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
    2e14:	83 ec 08             	sub    $0x8,%esp
    2e17:	68 d4 67 00 00       	push   $0x67d4
    2e1c:	68 6f 67 00 00       	push   $0x676f
    2e21:	e8 ee f0 ff ff       	call   1f14 <Printf>
    2e26:	83 c4 10             	add    $0x10,%esp
    2e29:	83 ec 04             	sub    $0x4,%esp
    2e2c:	6a 03                	push   $0x3
    2e2e:	8d 45 88             	lea    -0x78(%ebp),%eax
    2e31:	50                   	push   %eax
    2e32:	6a 01                	push   $0x1
    2e34:	e8 2d fc ff ff       	call   2a66 <send_rec>
    2e39:	83 c4 10             	add    $0x10,%esp
    2e3c:	83 ec 08             	sub    $0x8,%esp
    2e3f:	68 e6 67 00 00       	push   $0x67e6
    2e44:	68 6f 67 00 00       	push   $0x676f
    2e49:	e8 c6 f0 ff ff       	call   1f14 <Printf>
    2e4e:	83 c4 10             	add    $0x10,%esp
    2e51:	eb fe                	jmp    2e51 <hd_handle+0x151>

00002e53 <hd_cmd_out>:
    2e53:	55                   	push   %ebp
    2e54:	89 e5                	mov    %esp,%ebp
    2e56:	83 ec 08             	sub    $0x8,%esp
    2e59:	83 ec 04             	sub    $0x4,%esp
    2e5c:	68 10 27 00 00       	push   $0x2710
    2e61:	6a 00                	push   $0x0
    2e63:	68 80 00 00 00       	push   $0x80
    2e68:	e8 e7 09 00 00       	call   3854 <waitfor>
    2e6d:	83 c4 10             	add    $0x10,%esp
    2e70:	85 c0                	test   %eax,%eax
    2e72:	75 10                	jne    2e84 <hd_cmd_out+0x31>
    2e74:	83 ec 0c             	sub    $0xc,%esp
    2e77:	68 f2 67 00 00       	push   $0x67f2
    2e7c:	e8 c2 f3 ff ff       	call   2243 <panic>
    2e81:	83 c4 10             	add    $0x10,%esp
    2e84:	83 ec 08             	sub    $0x8,%esp
    2e87:	6a 00                	push   $0x0
    2e89:	68 f6 03 00 00       	push   $0x3f6
    2e8e:	e8 43 e4 ff ff       	call   12d6 <out_byte>
    2e93:	83 c4 10             	add    $0x10,%esp
    2e96:	8b 45 08             	mov    0x8(%ebp),%eax
    2e99:	0f b6 00             	movzbl (%eax),%eax
    2e9c:	0f b6 c0             	movzbl %al,%eax
    2e9f:	83 ec 08             	sub    $0x8,%esp
    2ea2:	50                   	push   %eax
    2ea3:	68 f1 01 00 00       	push   $0x1f1
    2ea8:	e8 29 e4 ff ff       	call   12d6 <out_byte>
    2ead:	83 c4 10             	add    $0x10,%esp
    2eb0:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    2eb7:	0f b6 c0             	movzbl %al,%eax
    2eba:	83 ec 08             	sub    $0x8,%esp
    2ebd:	50                   	push   %eax
    2ebe:	68 f2 01 00 00       	push   $0x1f2
    2ec3:	e8 0e e4 ff ff       	call   12d6 <out_byte>
    2ec8:	83 c4 10             	add    $0x10,%esp
    2ecb:	8b 45 08             	mov    0x8(%ebp),%eax
    2ece:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    2ed2:	0f b6 c0             	movzbl %al,%eax
    2ed5:	83 ec 08             	sub    $0x8,%esp
    2ed8:	50                   	push   %eax
    2ed9:	68 f3 01 00 00       	push   $0x1f3
    2ede:	e8 f3 e3 ff ff       	call   12d6 <out_byte>
    2ee3:	83 c4 10             	add    $0x10,%esp
    2ee6:	8b 45 08             	mov    0x8(%ebp),%eax
    2ee9:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    2eed:	0f b6 c0             	movzbl %al,%eax
    2ef0:	83 ec 08             	sub    $0x8,%esp
    2ef3:	50                   	push   %eax
    2ef4:	68 f4 01 00 00       	push   $0x1f4
    2ef9:	e8 d8 e3 ff ff       	call   12d6 <out_byte>
    2efe:	83 c4 10             	add    $0x10,%esp
    2f01:	8b 45 08             	mov    0x8(%ebp),%eax
    2f04:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    2f08:	0f b6 c0             	movzbl %al,%eax
    2f0b:	83 ec 08             	sub    $0x8,%esp
    2f0e:	50                   	push   %eax
    2f0f:	68 f5 01 00 00       	push   $0x1f5
    2f14:	e8 bd e3 ff ff       	call   12d6 <out_byte>
    2f19:	83 c4 10             	add    $0x10,%esp
    2f1c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f1f:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    2f23:	0f b6 c0             	movzbl %al,%eax
    2f26:	83 ec 08             	sub    $0x8,%esp
    2f29:	50                   	push   %eax
    2f2a:	68 f6 01 00 00       	push   $0x1f6
    2f2f:	e8 a2 e3 ff ff       	call   12d6 <out_byte>
    2f34:	83 c4 10             	add    $0x10,%esp
    2f37:	8b 45 08             	mov    0x8(%ebp),%eax
    2f3a:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    2f3e:	0f b6 c0             	movzbl %al,%eax
    2f41:	83 ec 08             	sub    $0x8,%esp
    2f44:	50                   	push   %eax
    2f45:	68 f7 01 00 00       	push   $0x1f7
    2f4a:	e8 87 e3 ff ff       	call   12d6 <out_byte>
    2f4f:	83 c4 10             	add    $0x10,%esp
    2f52:	90                   	nop
    2f53:	c9                   	leave  
    2f54:	c3                   	ret    

00002f55 <hd_identify>:
    2f55:	55                   	push   %ebp
    2f56:	89 e5                	mov    %esp,%ebp
    2f58:	81 ec 18 04 00 00    	sub    $0x418,%esp
    2f5e:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    2f62:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
    2f66:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    2f6a:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
    2f6e:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
    2f72:	8b 45 08             	mov    0x8(%ebp),%eax
    2f75:	c1 e0 04             	shl    $0x4,%eax
    2f78:	83 c8 e0             	or     $0xffffffe0,%eax
    2f7b:	88 45 f6             	mov    %al,-0xa(%ebp)
    2f7e:	c6 45 f7 ec          	movb   $0xec,-0x9(%ebp)
    2f82:	83 ec 0c             	sub    $0xc,%esp
    2f85:	8d 45 f1             	lea    -0xf(%ebp),%eax
    2f88:	50                   	push   %eax
    2f89:	e8 c5 fe ff ff       	call   2e53 <hd_cmd_out>
    2f8e:	83 c4 10             	add    $0x10,%esp
    2f91:	e8 69 06 00 00       	call   35ff <interrupt_wait>
    2f96:	83 ec 04             	sub    $0x4,%esp
    2f99:	68 00 04 00 00       	push   $0x400
    2f9e:	6a 00                	push   $0x0
    2fa0:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2fa6:	50                   	push   %eax
    2fa7:	e8 74 3a 00 00       	call   6a20 <Memset>
    2fac:	83 c4 10             	add    $0x10,%esp
    2faf:	83 ec 04             	sub    $0x4,%esp
    2fb2:	68 00 02 00 00       	push   $0x200
    2fb7:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2fbd:	50                   	push   %eax
    2fbe:	68 f0 01 00 00       	push   $0x1f0
    2fc3:	e8 ac 3a 00 00       	call   6a74 <read_port>
    2fc8:	83 c4 10             	add    $0x10,%esp
    2fcb:	83 ec 0c             	sub    $0xc,%esp
    2fce:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2fd4:	50                   	push   %eax
    2fd5:	e8 32 00 00 00       	call   300c <print_hdinfo>
    2fda:	83 c4 10             	add    $0x10,%esp
    2fdd:	83 ec 08             	sub    $0x8,%esp
    2fe0:	68 fc 67 00 00       	push   $0x67fc
    2fe5:	68 6f 67 00 00       	push   $0x676f
    2fea:	e8 25 ef ff ff       	call   1f14 <Printf>
    2fef:	83 c4 10             	add    $0x10,%esp
    2ff2:	83 ec 08             	sub    $0x8,%esp
    2ff5:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2ffb:	50                   	push   %eax
    2ffc:	68 08 68 00 00       	push   $0x6808
    3001:	e8 0e ef ff ff       	call   1f14 <Printf>
    3006:	83 c4 10             	add    $0x10,%esp
    3009:	90                   	nop
    300a:	c9                   	leave  
    300b:	c3                   	ret    

0000300c <print_hdinfo>:
    300c:	55                   	push   %ebp
    300d:	89 e5                	mov    %esp,%ebp
    300f:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3015:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
    301b:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
    3021:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
    3028:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
    302f:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
    3036:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
    303d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    3044:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
    304a:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
    3050:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
    3057:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
    305e:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
    3065:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    306c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    3073:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    307a:	e9 b8 00 00 00       	jmp    3137 <print_hdinfo+0x12b>
    307f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3086:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3089:	89 d0                	mov    %edx,%eax
    308b:	01 c0                	add    %eax,%eax
    308d:	01 d0                	add    %edx,%eax
    308f:	c1 e0 03             	shl    $0x3,%eax
    3092:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3095:	01 c8                	add    %ecx,%eax
    3097:	83 e8 44             	sub    $0x44,%eax
    309a:	0f b7 00             	movzwl (%eax),%eax
    309d:	0f b7 c0             	movzwl %ax,%eax
    30a0:	8d 14 00             	lea    (%eax,%eax,1),%edx
    30a3:	8b 45 08             	mov    0x8(%ebp),%eax
    30a6:	01 d0                	add    %edx,%eax
    30a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    30ab:	eb 30                	jmp    30dd <print_hdinfo+0xd1>
    30ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30b0:	8d 50 01             	lea    0x1(%eax),%edx
    30b3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    30b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    30b9:	83 c2 01             	add    $0x1,%edx
    30bc:	0f b6 00             	movzbl (%eax),%eax
    30bf:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
    30c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30c6:	8d 50 01             	lea    0x1(%eax),%edx
    30c9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    30cc:	0f b6 00             	movzbl (%eax),%eax
    30cf:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
    30d2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    30d5:	01 ca                	add    %ecx,%edx
    30d7:	88 02                	mov    %al,(%edx)
    30d9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    30dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    30e0:	89 d0                	mov    %edx,%eax
    30e2:	01 c0                	add    %eax,%eax
    30e4:	01 d0                	add    %edx,%eax
    30e6:	c1 e0 03             	shl    $0x3,%eax
    30e9:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    30ec:	01 c8                	add    %ecx,%eax
    30ee:	83 e8 42             	sub    $0x42,%eax
    30f1:	0f b7 00             	movzwl (%eax),%eax
    30f4:	66 d1 e8             	shr    %ax
    30f7:	0f b7 c0             	movzwl %ax,%eax
    30fa:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    30fd:	7c ae                	jl     30ad <print_hdinfo+0xa1>
    30ff:	8d 55 81             	lea    -0x7f(%ebp),%edx
    3102:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3105:	01 d0                	add    %edx,%eax
    3107:	c6 00 00             	movb   $0x0,(%eax)
    310a:	8d 4d b4             	lea    -0x4c(%ebp),%ecx
    310d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3110:	89 d0                	mov    %edx,%eax
    3112:	01 c0                	add    %eax,%eax
    3114:	01 d0                	add    %edx,%eax
    3116:	c1 e0 03             	shl    $0x3,%eax
    3119:	01 c8                	add    %ecx,%eax
    311b:	8d 50 04             	lea    0x4(%eax),%edx
    311e:	83 ec 04             	sub    $0x4,%esp
    3121:	8d 45 81             	lea    -0x7f(%ebp),%eax
    3124:	50                   	push   %eax
    3125:	52                   	push   %edx
    3126:	68 10 68 00 00       	push   $0x6810
    312b:	e8 e4 ed ff ff       	call   1f14 <Printf>
    3130:	83 c4 10             	add    $0x10,%esp
    3133:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3137:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    313b:	0f 8e 3e ff ff ff    	jle    307f <print_hdinfo+0x73>
    3141:	8b 45 08             	mov    0x8(%ebp),%eax
    3144:	0f b7 40 62          	movzwl 0x62(%eax),%eax
    3148:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    314c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    3150:	66 c1 e8 08          	shr    $0x8,%ax
    3154:	66 85 c0             	test   %ax,%ax
    3157:	0f 95 c0             	setne  %al
    315a:	88 45 e9             	mov    %al,-0x17(%ebp)
    315d:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
    3164:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
    316a:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
    316e:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
    3172:	75 15                	jne    3189 <print_hdinfo+0x17d>
    3174:	83 ec 08             	sub    $0x8,%esp
    3177:	8d 45 ac             	lea    -0x54(%ebp),%eax
    317a:	50                   	push   %eax
    317b:	8d 45 b0             	lea    -0x50(%ebp),%eax
    317e:	50                   	push   %eax
    317f:	e8 bb 38 00 00       	call   6a3f <Strcpy>
    3184:	83 c4 10             	add    $0x10,%esp
    3187:	eb 13                	jmp    319c <print_hdinfo+0x190>
    3189:	83 ec 08             	sub    $0x8,%esp
    318c:	8d 45 a9             	lea    -0x57(%ebp),%eax
    318f:	50                   	push   %eax
    3190:	8d 45 b0             	lea    -0x50(%ebp),%eax
    3193:	50                   	push   %eax
    3194:	e8 a6 38 00 00       	call   6a3f <Strcpy>
    3199:	83 c4 10             	add    $0x10,%esp
    319c:	83 ec 08             	sub    $0x8,%esp
    319f:	8d 45 b0             	lea    -0x50(%ebp),%eax
    31a2:	50                   	push   %eax
    31a3:	68 17 68 00 00       	push   $0x6817
    31a8:	e8 67 ed ff ff       	call   1f14 <Printf>
    31ad:	83 c4 10             	add    $0x10,%esp
    31b0:	8b 45 08             	mov    0x8(%ebp),%eax
    31b3:	83 c0 7a             	add    $0x7a,%eax
    31b6:	0f b7 00             	movzwl (%eax),%eax
    31b9:	0f b7 d0             	movzwl %ax,%edx
    31bc:	8b 45 08             	mov    0x8(%ebp),%eax
    31bf:	83 c0 78             	add    $0x78,%eax
    31c2:	0f b7 00             	movzwl (%eax),%eax
    31c5:	0f b7 c0             	movzwl %ax,%eax
    31c8:	83 c0 10             	add    $0x10,%eax
    31cb:	89 c1                	mov    %eax,%ecx
    31cd:	d3 e2                	shl    %cl,%edx
    31cf:	89 d0                	mov    %edx,%eax
    31d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    31d4:	83 ec 08             	sub    $0x8,%esp
    31d7:	ff 75 e4             	pushl  -0x1c(%ebp)
    31da:	68 27 68 00 00       	push   $0x6827
    31df:	e8 30 ed ff ff       	call   1f14 <Printf>
    31e4:	83 c4 10             	add    $0x10,%esp
    31e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31ea:	89 c2                	mov    %eax,%edx
    31ec:	c1 ea 1f             	shr    $0x1f,%edx
    31ef:	01 d0                	add    %edx,%eax
    31f1:	d1 f8                	sar    %eax
    31f3:	c1 e0 0a             	shl    $0xa,%eax
    31f6:	83 ec 08             	sub    $0x8,%esp
    31f9:	50                   	push   %eax
    31fa:	68 3a 68 00 00       	push   $0x683a
    31ff:	e8 10 ed ff ff       	call   1f14 <Printf>
    3204:	83 c4 10             	add    $0x10,%esp
    3207:	90                   	nop
    3208:	c9                   	leave  
    3209:	c3                   	ret    

0000320a <print_dpt_entry>:
    320a:	55                   	push   %ebp
    320b:	89 e5                	mov    %esp,%ebp
    320d:	83 ec 08             	sub    $0x8,%esp
    3210:	8b 45 08             	mov    0x8(%ebp),%eax
    3213:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3217:	0f b6 c0             	movzbl %al,%eax
    321a:	83 ec 08             	sub    $0x8,%esp
    321d:	50                   	push   %eax
    321e:	68 47 68 00 00       	push   $0x6847
    3223:	e8 ec ec ff ff       	call   1f14 <Printf>
    3228:	83 c4 10             	add    $0x10,%esp
    322b:	90                   	nop
    322c:	c9                   	leave  
    322d:	c3                   	ret    

0000322e <get_partition_table>:
    322e:	55                   	push   %ebp
    322f:	89 e5                	mov    %esp,%ebp
    3231:	81 ec 18 04 00 00    	sub    $0x418,%esp
    3237:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    323b:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
    323f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3242:	88 45 f3             	mov    %al,-0xd(%ebp)
    3245:	8b 45 0c             	mov    0xc(%ebp),%eax
    3248:	c1 f8 08             	sar    $0x8,%eax
    324b:	88 45 f4             	mov    %al,-0xc(%ebp)
    324e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3251:	c1 f8 10             	sar    $0x10,%eax
    3254:	88 45 f5             	mov    %al,-0xb(%ebp)
    3257:	8b 45 0c             	mov    0xc(%ebp),%eax
    325a:	c1 f8 18             	sar    $0x18,%eax
    325d:	89 c2                	mov    %eax,%edx
    325f:	8b 45 08             	mov    0x8(%ebp),%eax
    3262:	c1 e0 04             	shl    $0x4,%eax
    3265:	09 d0                	or     %edx,%eax
    3267:	83 c8 e0             	or     $0xffffffe0,%eax
    326a:	88 45 f6             	mov    %al,-0xa(%ebp)
    326d:	c6 45 f7 20          	movb   $0x20,-0x9(%ebp)
    3271:	83 ec 0c             	sub    $0xc,%esp
    3274:	8d 45 f1             	lea    -0xf(%ebp),%eax
    3277:	50                   	push   %eax
    3278:	e8 d6 fb ff ff       	call   2e53 <hd_cmd_out>
    327d:	83 c4 10             	add    $0x10,%esp
    3280:	e8 7a 03 00 00       	call   35ff <interrupt_wait>
    3285:	83 ec 04             	sub    $0x4,%esp
    3288:	68 00 04 00 00       	push   $0x400
    328d:	6a 00                	push   $0x0
    328f:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    3295:	50                   	push   %eax
    3296:	e8 85 37 00 00       	call   6a20 <Memset>
    329b:	83 c4 10             	add    $0x10,%esp
    329e:	83 ec 04             	sub    $0x4,%esp
    32a1:	68 00 02 00 00       	push   $0x200
    32a6:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    32ac:	50                   	push   %eax
    32ad:	68 f0 01 00 00       	push   $0x1f0
    32b2:	e8 bd 37 00 00       	call   6a74 <read_port>
    32b7:	83 c4 10             	add    $0x10,%esp
    32ba:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    32c0:	05 be 01 00 00       	add    $0x1be,%eax
    32c5:	83 ec 04             	sub    $0x4,%esp
    32c8:	6a 40                	push   $0x40
    32ca:	50                   	push   %eax
    32cb:	ff 75 10             	pushl  0x10(%ebp)
    32ce:	e8 1f 37 00 00       	call   69f2 <Memcpy>
    32d3:	83 c4 10             	add    $0x10,%esp
    32d6:	90                   	nop
    32d7:	c9                   	leave  
    32d8:	c3                   	ret    

000032d9 <partition>:
    32d9:	55                   	push   %ebp
    32da:	89 e5                	mov    %esp,%ebp
    32dc:	81 ec 98 00 00 00    	sub    $0x98,%esp
    32e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    32e5:	88 85 74 ff ff ff    	mov    %al,-0x8c(%ebp)
    32eb:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    32ef:	7f 19                	jg     330a <partition+0x31>
    32f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    32f4:	ba 67 66 66 66       	mov    $0x66666667,%edx
    32f9:	89 c8                	mov    %ecx,%eax
    32fb:	f7 ea                	imul   %edx
    32fd:	d1 fa                	sar    %edx
    32ff:	89 c8                	mov    %ecx,%eax
    3301:	c1 f8 1f             	sar    $0x1f,%eax
    3304:	29 c2                	sub    %eax,%edx
    3306:	89 d0                	mov    %edx,%eax
    3308:	eb 11                	jmp    331b <partition+0x42>
    330a:	8b 45 08             	mov    0x8(%ebp),%eax
    330d:	83 e8 10             	sub    $0x10,%eax
    3310:	8d 50 3f             	lea    0x3f(%eax),%edx
    3313:	85 c0                	test   %eax,%eax
    3315:	0f 48 c2             	cmovs  %edx,%eax
    3318:	c1 f8 06             	sar    $0x6,%eax
    331b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    331e:	80 bd 74 ff ff ff 00 	cmpb   $0x0,-0x8c(%ebp)
    3325:	0f 85 cc 00 00 00    	jne    33f7 <partition+0x11e>
    332b:	83 ec 04             	sub    $0x4,%esp
    332e:	6a 50                	push   $0x50
    3330:	6a 00                	push   $0x0
    3332:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3335:	50                   	push   %eax
    3336:	e8 e5 36 00 00       	call   6a20 <Memset>
    333b:	83 c4 10             	add    $0x10,%esp
    333e:	83 ec 04             	sub    $0x4,%esp
    3341:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3344:	50                   	push   %eax
    3345:	6a 00                	push   $0x0
    3347:	ff 75 e8             	pushl  -0x18(%ebp)
    334a:	e8 df fe ff ff       	call   322e <get_partition_table>
    334f:	83 c4 10             	add    $0x10,%esp
    3352:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3359:	e9 8a 00 00 00       	jmp    33e8 <partition+0x10f>
    335e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3361:	83 c0 01             	add    $0x1,%eax
    3364:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3367:	8b 45 f4             	mov    -0xc(%ebp),%eax
    336a:	c1 e0 04             	shl    $0x4,%eax
    336d:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3370:	01 c8                	add    %ecx,%eax
    3372:	83 e8 6c             	sub    $0x6c,%eax
    3375:	8b 00                	mov    (%eax),%eax
    3377:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    337a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    337d:	c1 e1 03             	shl    $0x3,%ecx
    3380:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    3386:	01 ca                	add    %ecx,%edx
    3388:	81 c2 04 d5 00 00    	add    $0xd504,%edx
    338e:	89 02                	mov    %eax,(%edx)
    3390:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3393:	c1 e0 04             	shl    $0x4,%eax
    3396:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3399:	01 c8                	add    %ecx,%eax
    339b:	83 e8 68             	sub    $0x68,%eax
    339e:	8b 00                	mov    (%eax),%eax
    33a0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    33a3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    33a6:	c1 e1 03             	shl    $0x3,%ecx
    33a9:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    33af:	01 ca                	add    %ecx,%edx
    33b1:	81 c2 08 d5 00 00    	add    $0xd508,%edx
    33b7:	89 02                	mov    %eax,(%edx)
    33b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33bc:	c1 e0 04             	shl    $0x4,%eax
    33bf:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    33c2:	01 c8                	add    %ecx,%eax
    33c4:	83 e8 70             	sub    $0x70,%eax
    33c7:	0f b6 00             	movzbl (%eax),%eax
    33ca:	3c 05                	cmp    $0x5,%al
    33cc:	75 16                	jne    33e4 <partition+0x10b>
    33ce:	8b 55 08             	mov    0x8(%ebp),%edx
    33d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33d4:	01 d0                	add    %edx,%eax
    33d6:	83 ec 08             	sub    $0x8,%esp
    33d9:	6a 01                	push   $0x1
    33db:	50                   	push   %eax
    33dc:	e8 f8 fe ff ff       	call   32d9 <partition>
    33e1:	83 c4 10             	add    $0x10,%esp
    33e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    33e8:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    33ec:	0f 8e 6c ff ff ff    	jle    335e <partition+0x85>
    33f2:	e9 28 01 00 00       	jmp    351f <partition+0x246>
    33f7:	80 bd 74 ff ff ff 01 	cmpb   $0x1,-0x8c(%ebp)
    33fe:	0f 85 03 01 00 00    	jne    3507 <partition+0x22e>
    3404:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3407:	ba 67 66 66 66       	mov    $0x66666667,%edx
    340c:	89 c8                	mov    %ecx,%eax
    340e:	f7 ea                	imul   %edx
    3410:	d1 fa                	sar    %edx
    3412:	89 c8                	mov    %ecx,%eax
    3414:	c1 f8 1f             	sar    $0x1f,%eax
    3417:	29 c2                	sub    %eax,%edx
    3419:	89 d0                	mov    %edx,%eax
    341b:	c1 e0 02             	shl    $0x2,%eax
    341e:	01 d0                	add    %edx,%eax
    3420:	29 c1                	sub    %eax,%ecx
    3422:	89 c8                	mov    %ecx,%eax
    3424:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3427:	8b 55 e0             	mov    -0x20(%ebp),%edx
    342a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    342d:	c1 e2 03             	shl    $0x3,%edx
    3430:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3436:	01 d0                	add    %edx,%eax
    3438:	05 04 d5 00 00       	add    $0xd504,%eax
    343d:	8b 00                	mov    (%eax),%eax
    343f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3442:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3445:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3448:	8b 45 e0             	mov    -0x20(%ebp),%eax
    344b:	83 e8 01             	sub    $0x1,%eax
    344e:	c1 e0 04             	shl    $0x4,%eax
    3451:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3454:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    345b:	e9 9b 00 00 00       	jmp    34fb <partition+0x222>
    3460:	83 ec 04             	sub    $0x4,%esp
    3463:	6a 50                	push   $0x50
    3465:	6a 00                	push   $0x0
    3467:	8d 45 84             	lea    -0x7c(%ebp),%eax
    346a:	50                   	push   %eax
    346b:	e8 b0 35 00 00       	call   6a20 <Memset>
    3470:	83 c4 10             	add    $0x10,%esp
    3473:	83 ec 04             	sub    $0x4,%esp
    3476:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3479:	50                   	push   %eax
    347a:	ff 75 f0             	pushl  -0x10(%ebp)
    347d:	ff 75 e8             	pushl  -0x18(%ebp)
    3480:	e8 a9 fd ff ff       	call   322e <get_partition_table>
    3485:	83 c4 10             	add    $0x10,%esp
    3488:	83 ec 0c             	sub    $0xc,%esp
    348b:	8d 45 84             	lea    -0x7c(%ebp),%eax
    348e:	50                   	push   %eax
    348f:	e8 76 fd ff ff       	call   320a <print_dpt_entry>
    3494:	83 c4 10             	add    $0x10,%esp
    3497:	8b 55 d8             	mov    -0x28(%ebp),%edx
    349a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    349d:	01 d0                	add    %edx,%eax
    349f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    34a2:	8b 55 8c             	mov    -0x74(%ebp),%edx
    34a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34a8:	01 c2                	add    %eax,%edx
    34aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    34ad:	8d 48 04             	lea    0x4(%eax),%ecx
    34b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    34b3:	c1 e1 03             	shl    $0x3,%ecx
    34b6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    34bc:	01 c8                	add    %ecx,%eax
    34be:	05 04 d5 00 00       	add    $0xd504,%eax
    34c3:	89 10                	mov    %edx,(%eax)
    34c5:	8b 45 90             	mov    -0x70(%ebp),%eax
    34c8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    34cb:	8d 4a 04             	lea    0x4(%edx),%ecx
    34ce:	8b 55 e8             	mov    -0x18(%ebp),%edx
    34d1:	c1 e1 03             	shl    $0x3,%ecx
    34d4:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    34da:	01 ca                	add    %ecx,%edx
    34dc:	81 c2 08 d5 00 00    	add    $0xd508,%edx
    34e2:	89 02                	mov    %eax,(%edx)
    34e4:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
    34e8:	84 c0                	test   %al,%al
    34ea:	74 32                	je     351e <partition+0x245>
    34ec:	8b 55 9c             	mov    -0x64(%ebp),%edx
    34ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
    34f2:	01 d0                	add    %edx,%eax
    34f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    34f7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    34fb:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
    34ff:	0f 8e 5b ff ff ff    	jle    3460 <partition+0x187>
    3505:	eb 18                	jmp    351f <partition+0x246>
    3507:	83 ec 08             	sub    $0x8,%esp
    350a:	68 55 68 00 00       	push   $0x6855
    350f:	68 6f 67 00 00       	push   $0x676f
    3514:	e8 fb e9 ff ff       	call   1f14 <Printf>
    3519:	83 c4 10             	add    $0x10,%esp
    351c:	eb 01                	jmp    351f <partition+0x246>
    351e:	90                   	nop
    351f:	90                   	nop
    3520:	c9                   	leave  
    3521:	c3                   	ret    

00003522 <hd_open>:
    3522:	55                   	push   %ebp
    3523:	89 e5                	mov    %esp,%ebp
    3525:	83 ec 18             	sub    $0x18,%esp
    3528:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    352f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3532:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3538:	05 00 d5 00 00       	add    $0xd500,%eax
    353d:	8b 00                	mov    (%eax),%eax
    353f:	8d 50 01             	lea    0x1(%eax),%edx
    3542:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3545:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    354b:	05 00 d5 00 00       	add    $0xd500,%eax
    3550:	89 10                	mov    %edx,(%eax)
    3552:	83 ec 0c             	sub    $0xc,%esp
    3555:	6a 00                	push   $0x0
    3557:	e8 f9 f9 ff ff       	call   2f55 <hd_identify>
    355c:	83 c4 10             	add    $0x10,%esp
    355f:	90                   	nop
    3560:	c9                   	leave  
    3561:	c3                   	ret    

00003562 <get_hd_ioctl>:
    3562:	55                   	push   %ebp
    3563:	89 e5                	mov    %esp,%ebp
    3565:	83 ec 18             	sub    $0x18,%esp
    3568:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    356c:	7f 19                	jg     3587 <get_hd_ioctl+0x25>
    356e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3571:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3576:	89 c8                	mov    %ecx,%eax
    3578:	f7 ea                	imul   %edx
    357a:	d1 fa                	sar    %edx
    357c:	89 c8                	mov    %ecx,%eax
    357e:	c1 f8 1f             	sar    $0x1f,%eax
    3581:	29 c2                	sub    %eax,%edx
    3583:	89 d0                	mov    %edx,%eax
    3585:	eb 11                	jmp    3598 <get_hd_ioctl+0x36>
    3587:	8b 45 08             	mov    0x8(%ebp),%eax
    358a:	83 e8 10             	sub    $0x10,%eax
    358d:	8d 50 3f             	lea    0x3f(%eax),%edx
    3590:	85 c0                	test   %eax,%eax
    3592:	0f 48 c2             	cmovs  %edx,%eax
    3595:	c1 f8 06             	sar    $0x6,%eax
    3598:	89 45 f4             	mov    %eax,-0xc(%ebp)
    359b:	8b 55 08             	mov    0x8(%ebp),%edx
    359e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35a1:	c1 e2 03             	shl    $0x3,%edx
    35a4:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    35aa:	01 d0                	add    %edx,%eax
    35ac:	05 08 d5 00 00       	add    $0xd508,%eax
    35b1:	8b 00                	mov    (%eax),%eax
    35b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    35b6:	83 ec 08             	sub    $0x8,%esp
    35b9:	ff 75 f0             	pushl  -0x10(%ebp)
    35bc:	68 60 68 00 00       	push   $0x6860
    35c1:	e8 4e e9 ff ff       	call   1f14 <Printf>
    35c6:	83 c4 10             	add    $0x10,%esp
    35c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35cc:	c9                   	leave  
    35cd:	c3                   	ret    

000035ce <wait_for>:
    35ce:	55                   	push   %ebp
    35cf:	89 e5                	mov    %esp,%ebp
    35d1:	83 ec 08             	sub    $0x8,%esp
    35d4:	83 ec 04             	sub    $0x4,%esp
    35d7:	68 10 27 00 00       	push   $0x2710
    35dc:	6a 08                	push   $0x8
    35de:	6a 08                	push   $0x8
    35e0:	e8 6f 02 00 00       	call   3854 <waitfor>
    35e5:	83 c4 10             	add    $0x10,%esp
    35e8:	85 c0                	test   %eax,%eax
    35ea:	75 10                	jne    35fc <wait_for+0x2e>
    35ec:	83 ec 0c             	sub    $0xc,%esp
    35ef:	68 6d 68 00 00       	push   $0x686d
    35f4:	e8 4a ec ff ff       	call   2243 <panic>
    35f9:	83 c4 10             	add    $0x10,%esp
    35fc:	90                   	nop
    35fd:	c9                   	leave  
    35fe:	c3                   	ret    

000035ff <interrupt_wait>:
    35ff:	55                   	push   %ebp
    3600:	89 e5                	mov    %esp,%ebp
    3602:	83 ec 78             	sub    $0x78,%esp
    3605:	83 ec 04             	sub    $0x4,%esp
    3608:	6a f6                	push   $0xfffffff6
    360a:	8d 45 90             	lea    -0x70(%ebp),%eax
    360d:	50                   	push   %eax
    360e:	6a 02                	push   $0x2
    3610:	e8 51 f4 ff ff       	call   2a66 <send_rec>
    3615:	83 c4 10             	add    $0x10,%esp
    3618:	90                   	nop
    3619:	c9                   	leave  
    361a:	c3                   	ret    

0000361b <hd_rdwt>:
    361b:	55                   	push   %ebp
    361c:	89 e5                	mov    %esp,%ebp
    361e:	53                   	push   %ebx
    361f:	83 ec 44             	sub    $0x44,%esp
    3622:	8b 45 08             	mov    0x8(%ebp),%eax
    3625:	8b 40 18             	mov    0x18(%eax),%eax
    3628:	89 45 e8             	mov    %eax,-0x18(%ebp)
    362b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    3632:	8b 45 08             	mov    0x8(%ebp),%eax
    3635:	8b 40 14             	mov    0x14(%eax),%eax
    3638:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    363b:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
    363f:	7f 19                	jg     365a <hd_rdwt+0x3f>
    3641:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3644:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3649:	89 c8                	mov    %ecx,%eax
    364b:	f7 ea                	imul   %edx
    364d:	d1 fa                	sar    %edx
    364f:	89 c8                	mov    %ecx,%eax
    3651:	c1 f8 1f             	sar    $0x1f,%eax
    3654:	29 c2                	sub    %eax,%edx
    3656:	89 d0                	mov    %edx,%eax
    3658:	eb 11                	jmp    366b <hd_rdwt+0x50>
    365a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    365d:	83 e8 10             	sub    $0x10,%eax
    3660:	8d 50 3f             	lea    0x3f(%eax),%edx
    3663:	85 c0                	test   %eax,%eax
    3665:	0f 48 c2             	cmovs  %edx,%eax
    3668:	c1 f8 06             	sar    $0x6,%eax
    366b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    366e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3671:	8d 50 f0             	lea    -0x10(%eax),%edx
    3674:	89 d0                	mov    %edx,%eax
    3676:	c1 f8 1f             	sar    $0x1f,%eax
    3679:	c1 e8 1a             	shr    $0x1a,%eax
    367c:	01 c2                	add    %eax,%edx
    367e:	83 e2 3f             	and    $0x3f,%edx
    3681:	29 c2                	sub    %eax,%edx
    3683:	89 d0                	mov    %edx,%eax
    3685:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3688:	8b 45 e8             	mov    -0x18(%ebp),%eax
    368b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    368e:	0f ac d0 09          	shrd   $0x9,%edx,%eax
    3692:	c1 ea 09             	shr    $0x9,%edx
    3695:	89 c1                	mov    %eax,%ecx
    3697:	89 d3                	mov    %edx,%ebx
    3699:	89 4d d8             	mov    %ecx,-0x28(%ebp)
    369c:	83 7d e4 08          	cmpl   $0x8,-0x1c(%ebp)
    36a0:	7f 1a                	jg     36bc <hd_rdwt+0xa1>
    36a2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    36a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36a8:	c1 e2 03             	shl    $0x3,%edx
    36ab:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    36b1:	01 d0                	add    %edx,%eax
    36b3:	05 04 d5 00 00       	add    $0xd504,%eax
    36b8:	8b 00                	mov    (%eax),%eax
    36ba:	eb 1b                	jmp    36d7 <hd_rdwt+0xbc>
    36bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    36bf:	8d 50 04             	lea    0x4(%eax),%edx
    36c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36c5:	c1 e2 03             	shl    $0x3,%edx
    36c8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    36ce:	01 d0                	add    %edx,%eax
    36d0:	05 04 d5 00 00       	add    $0xd504,%eax
    36d5:	8b 00                	mov    (%eax),%eax
    36d7:	8b 55 d8             	mov    -0x28(%ebp),%edx
    36da:	01 d0                	add    %edx,%eax
    36dc:	89 45 d8             	mov    %eax,-0x28(%ebp)
    36df:	8b 45 08             	mov    0x8(%ebp),%eax
    36e2:	8b 40 0c             	mov    0xc(%eax),%eax
    36e5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    36e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    36eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    36ee:	8b 45 08             	mov    0x8(%ebp),%eax
    36f1:	8b 40 10             	mov    0x10(%eax),%eax
    36f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    36f7:	8b 45 08             	mov    0x8(%ebp),%eax
    36fa:	8b 00                	mov    (%eax),%eax
    36fc:	89 45 cc             	mov    %eax,-0x34(%ebp)
    36ff:	83 ec 08             	sub    $0x8,%esp
    3702:	ff 75 d0             	pushl  -0x30(%ebp)
    3705:	ff 75 cc             	pushl  -0x34(%ebp)
    3708:	e8 dc 19 00 00       	call   50e9 <v2l>
    370d:	83 c4 10             	add    $0x10,%esp
    3710:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3713:	8b 45 08             	mov    0x8(%ebp),%eax
    3716:	8b 40 04             	mov    0x4(%eax),%eax
    3719:	89 45 c8             	mov    %eax,-0x38(%ebp)
    371c:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    3720:	74 22                	je     3744 <hd_rdwt+0x129>
    3722:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    3726:	74 1c                	je     3744 <hd_rdwt+0x129>
    3728:	68 76 01 00 00       	push   $0x176
    372d:	68 7f 68 00 00       	push   $0x687f
    3732:	68 7f 68 00 00       	push   $0x687f
    3737:	68 87 68 00 00       	push   $0x6887
    373c:	e8 20 eb ff ff       	call   2261 <assertion_failure>
    3741:	83 c4 10             	add    $0x10,%esp
    3744:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    3748:	c6 45 be 01          	movb   $0x1,-0x42(%ebp)
    374c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    374f:	88 45 bf             	mov    %al,-0x41(%ebp)
    3752:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3755:	c1 f8 08             	sar    $0x8,%eax
    3758:	88 45 c0             	mov    %al,-0x40(%ebp)
    375b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    375e:	c1 f8 10             	sar    $0x10,%eax
    3761:	88 45 c1             	mov    %al,-0x3f(%ebp)
    3764:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3767:	c1 f8 18             	sar    $0x18,%eax
    376a:	83 e0 0f             	and    $0xf,%eax
    376d:	83 c8 e0             	or     $0xffffffe0,%eax
    3770:	88 45 c2             	mov    %al,-0x3e(%ebp)
    3773:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    3777:	75 07                	jne    3780 <hd_rdwt+0x165>
    3779:	b8 20 00 00 00       	mov    $0x20,%eax
    377e:	eb 05                	jmp    3785 <hd_rdwt+0x16a>
    3780:	b8 30 00 00 00       	mov    $0x30,%eax
    3785:	88 45 c3             	mov    %al,-0x3d(%ebp)
    3788:	83 ec 0c             	sub    $0xc,%esp
    378b:	8d 45 bd             	lea    -0x43(%ebp),%eax
    378e:	50                   	push   %eax
    378f:	e8 bf f6 ff ff       	call   2e53 <hd_cmd_out>
    3794:	83 c4 10             	add    $0x10,%esp
    3797:	eb 7f                	jmp    3818 <hd_rdwt+0x1fd>
    3799:	b8 00 02 00 00       	mov    $0x200,%eax
    379e:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
    37a5:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
    37a9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    37ac:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    37b0:	75 1f                	jne    37d1 <hd_rdwt+0x1b6>
    37b2:	e8 48 fe ff ff       	call   35ff <interrupt_wait>
    37b7:	83 ec 04             	sub    $0x4,%esp
    37ba:	68 00 02 00 00       	push   $0x200
    37bf:	ff 75 f0             	pushl  -0x10(%ebp)
    37c2:	68 f0 01 00 00       	push   $0x1f0
    37c7:	e8 a8 32 00 00       	call   6a74 <read_port>
    37cc:	83 c4 10             	add    $0x10,%esp
    37cf:	eb 3b                	jmp    380c <hd_rdwt+0x1f1>
    37d1:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    37d5:	75 35                	jne    380c <hd_rdwt+0x1f1>
    37d7:	e8 f2 fd ff ff       	call   35ce <wait_for>
    37dc:	83 ec 04             	sub    $0x4,%esp
    37df:	68 00 02 00 00       	push   $0x200
    37e4:	6a 00                	push   $0x0
    37e6:	ff 75 f0             	pushl  -0x10(%ebp)
    37e9:	e8 32 32 00 00       	call   6a20 <Memset>
    37ee:	83 c4 10             	add    $0x10,%esp
    37f1:	83 ec 04             	sub    $0x4,%esp
    37f4:	ff 75 c4             	pushl  -0x3c(%ebp)
    37f7:	ff 75 f0             	pushl  -0x10(%ebp)
    37fa:	68 f0 01 00 00       	push   $0x1f0
    37ff:	e8 84 32 00 00       	call   6a88 <write_port>
    3804:	83 c4 10             	add    $0x10,%esp
    3807:	e8 f3 fd ff ff       	call   35ff <interrupt_wait>
    380c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    380f:	29 45 f4             	sub    %eax,-0xc(%ebp)
    3812:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3815:	01 45 f0             	add    %eax,-0x10(%ebp)
    3818:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    381c:	0f 85 77 ff ff ff    	jne    3799 <hd_rdwt+0x17e>
    3822:	90                   	nop
    3823:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3826:	c9                   	leave  
    3827:	c3                   	ret    

00003828 <hd_handler>:
    3828:	55                   	push   %ebp
    3829:	89 e5                	mov    %esp,%ebp
    382b:	83 ec 18             	sub    $0x18,%esp
    382e:	83 ec 0c             	sub    $0xc,%esp
    3831:	68 f7 01 00 00       	push   $0x1f7
    3836:	e8 8f da ff ff       	call   12ca <in_byte>
    383b:	83 c4 10             	add    $0x10,%esp
    383e:	0f b6 c0             	movzbl %al,%eax
    3841:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3844:	83 ec 0c             	sub    $0xc,%esp
    3847:	6a 02                	push   $0x2
    3849:	e8 bf f3 ff ff       	call   2c0d <inform_int>
    384e:	83 c4 10             	add    $0x10,%esp
    3851:	90                   	nop
    3852:	c9                   	leave  
    3853:	c3                   	ret    

00003854 <waitfor>:
    3854:	55                   	push   %ebp
    3855:	89 e5                	mov    %esp,%ebp
    3857:	83 ec 18             	sub    $0x18,%esp
    385a:	e8 b1 f2 ff ff       	call   2b10 <get_ticks_ipc>
    385f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3862:	eb 22                	jmp    3886 <waitfor+0x32>
    3864:	83 ec 0c             	sub    $0xc,%esp
    3867:	68 f7 01 00 00       	push   $0x1f7
    386c:	e8 59 da ff ff       	call   12ca <in_byte>
    3871:	83 c4 10             	add    $0x10,%esp
    3874:	0f b6 c0             	movzbl %al,%eax
    3877:	23 45 08             	and    0x8(%ebp),%eax
    387a:	39 45 0c             	cmp    %eax,0xc(%ebp)
    387d:	75 07                	jne    3886 <waitfor+0x32>
    387f:	b8 01 00 00 00       	mov    $0x1,%eax
    3884:	eb 1d                	jmp    38a3 <waitfor+0x4f>
    3886:	e8 85 f2 ff ff       	call   2b10 <get_ticks_ipc>
    388b:	2b 45 f4             	sub    -0xc(%ebp),%eax
    388e:	89 c2                	mov    %eax,%edx
    3890:	89 d0                	mov    %edx,%eax
    3892:	c1 e0 02             	shl    $0x2,%eax
    3895:	01 d0                	add    %edx,%eax
    3897:	01 c0                	add    %eax,%eax
    3899:	39 45 10             	cmp    %eax,0x10(%ebp)
    389c:	7f c6                	jg     3864 <waitfor+0x10>
    389e:	b8 01 00 00 00       	mov    $0x1,%eax
    38a3:	c9                   	leave  
    38a4:	c3                   	ret    
    38a5:	66 90                	xchg   %ax,%ax
    38a7:	66 90                	xchg   %ax,%ax
    38a9:	66 90                	xchg   %ax,%ax
    38ab:	66 90                	xchg   %ax,%ax
    38ad:	66 90                	xchg   %ax,%ax
    38af:	90                   	nop

000038b0 <get_ticks>:
    38b0:	b8 00 00 00 00       	mov    $0x0,%eax
    38b5:	cd 90                	int    $0x90
    38b7:	c3                   	ret    

000038b8 <write2>:
    38b8:	b8 01 00 00 00       	mov    $0x1,%eax
    38bd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    38c1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    38c5:	cd 90                	int    $0x90
    38c7:	c3                   	ret    

000038c8 <write_debug>:
    38c8:	b8 02 00 00 00       	mov    $0x2,%eax
    38cd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    38d1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    38d5:	cd 90                	int    $0x90
    38d7:	c3                   	ret    

000038d8 <send_msg>:
    38d8:	b8 03 00 00 00       	mov    $0x3,%eax
    38dd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    38e1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    38e5:	cd 90                	int    $0x90
    38e7:	c3                   	ret    

000038e8 <receive_msg>:
    38e8:	b8 04 00 00 00       	mov    $0x4,%eax
    38ed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    38f1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    38f5:	cd 90                	int    $0x90
    38f7:	c3                   	ret    

000038f8 <task_fs>:
    38f8:	55                   	push   %ebp
    38f9:	89 e5                	mov    %esp,%ebp
    38fb:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    3901:	83 ec 08             	sub    $0x8,%esp
    3904:	68 ac 68 00 00       	push   $0x68ac
    3909:	68 ba 68 00 00       	push   $0x68ba
    390e:	e8 01 e6 ff ff       	call   1f14 <Printf>
    3913:	83 c4 10             	add    $0x10,%esp
    3916:	e8 ea 01 00 00       	call   3b05 <init_fs>
    391b:	83 ec 04             	sub    $0x4,%esp
    391e:	6a 11                	push   $0x11
    3920:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
    3926:	50                   	push   %eax
    3927:	6a 02                	push   $0x2
    3929:	e8 38 f1 ff ff       	call   2a66 <send_rec>
    392e:	83 c4 10             	add    $0x10,%esp
    3931:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
    3937:	89 45 f4             	mov    %eax,-0xc(%ebp)
    393a:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    3940:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3943:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
    3949:	89 45 ec             	mov    %eax,-0x14(%ebp)
    394c:	8b 85 48 ff ff ff    	mov    -0xb8(%ebp),%eax
    3952:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3955:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    395b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    395e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3961:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    3967:	05 40 4f 01 00       	add    $0x14f40,%eax
    396c:	a3 a4 a2 00 00       	mov    %eax,0xa2a4
    3971:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    3975:	74 1c                	je     3993 <task_fs+0x9b>
    3977:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    397b:	7f 08                	jg     3985 <task_fs+0x8d>
    397d:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    3981:	74 3a                	je     39bd <task_fs+0xc5>
    3983:	eb 48                	jmp    39cd <task_fs+0xd5>
    3985:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3989:	74 1e                	je     39a9 <task_fs+0xb1>
    398b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    398f:	74 18                	je     39a9 <task_fs+0xb1>
    3991:	eb 3a                	jmp    39cd <task_fs+0xd5>
    3993:	83 ec 08             	sub    $0x8,%esp
    3996:	ff 75 e4             	pushl  -0x1c(%ebp)
    3999:	ff 75 e8             	pushl  -0x18(%ebp)
    399c:	e8 9d 01 00 00       	call   3b3e <do_open>
    39a1:	83 c4 10             	add    $0x10,%esp
    39a4:	89 45 bc             	mov    %eax,-0x44(%ebp)
    39a7:	eb 35                	jmp    39de <task_fs+0xe6>
    39a9:	83 ec 0c             	sub    $0xc,%esp
    39ac:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
    39b2:	50                   	push   %eax
    39b3:	e8 53 10 00 00       	call   4a0b <do_rdwt>
    39b8:	83 c4 10             	add    $0x10,%esp
    39bb:	eb 21                	jmp    39de <task_fs+0xe6>
    39bd:	83 ec 0c             	sub    $0xc,%esp
    39c0:	ff 75 ec             	pushl  -0x14(%ebp)
    39c3:	e8 24 14 00 00       	call   4dec <do_close>
    39c8:	83 c4 10             	add    $0x10,%esp
    39cb:	eb 11                	jmp    39de <task_fs+0xe6>
    39cd:	83 ec 0c             	sub    $0xc,%esp
    39d0:	68 be 68 00 00       	push   $0x68be
    39d5:	e8 69 e8 ff ff       	call   2243 <panic>
    39da:	83 c4 10             	add    $0x10,%esp
    39dd:	90                   	nop
    39de:	c7 45 80 65 00 00 00 	movl   $0x65,-0x80(%ebp)
    39e5:	83 ec 04             	sub    $0x4,%esp
    39e8:	ff 75 f0             	pushl  -0x10(%ebp)
    39eb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    39f1:	50                   	push   %eax
    39f2:	6a 01                	push   $0x1
    39f4:	e8 6d f0 ff ff       	call   2a66 <send_rec>
    39f9:	83 c4 10             	add    $0x10,%esp
    39fc:	e9 1a ff ff ff       	jmp    391b <task_fs+0x23>

00003a01 <rd_wt>:
    3a01:	55                   	push   %ebp
    3a02:	89 e5                	mov    %esp,%ebp
    3a04:	83 ec 78             	sub    $0x78,%esp
    3a07:	83 ec 04             	sub    $0x4,%esp
    3a0a:	6a 68                	push   $0x68
    3a0c:	6a 00                	push   $0x0
    3a0e:	8d 45 90             	lea    -0x70(%ebp),%eax
    3a11:	50                   	push   %eax
    3a12:	e8 09 30 00 00       	call   6a20 <Memset>
    3a17:	83 c4 10             	add    $0x10,%esp
    3a1a:	8b 45 18             	mov    0x18(%ebp),%eax
    3a1d:	89 45 94             	mov    %eax,-0x6c(%ebp)
    3a20:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a23:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    3a26:	8b 45 10             	mov    0x10(%ebp),%eax
    3a29:	89 45 a0             	mov    %eax,-0x60(%ebp)
    3a2c:	8b 45 14             	mov    0x14(%ebp),%eax
    3a2f:	89 45 9c             	mov    %eax,-0x64(%ebp)
    3a32:	8b 45 08             	mov    0x8(%ebp),%eax
    3a35:	89 45 a8             	mov    %eax,-0x58(%ebp)
    3a38:	83 ec 04             	sub    $0x4,%esp
    3a3b:	6a 02                	push   $0x2
    3a3d:	8d 45 90             	lea    -0x70(%ebp),%eax
    3a40:	50                   	push   %eax
    3a41:	6a 03                	push   $0x3
    3a43:	e8 1e f0 ff ff       	call   2a66 <send_rec>
    3a48:	83 c4 10             	add    $0x10,%esp
    3a4b:	90                   	nop
    3a4c:	c9                   	leave  
    3a4d:	c3                   	ret    

00003a4e <mkfs>:
    3a4e:	55                   	push   %ebp
    3a4f:	89 e5                	mov    %esp,%ebp
    3a51:	83 ec 28             	sub    $0x28,%esp
    3a54:	a1 10 90 00 00       	mov    0x9010,%eax
    3a59:	83 ec 0c             	sub    $0xc,%esp
    3a5c:	6a 07                	push   $0x7
    3a5e:	68 00 02 00 00       	push   $0x200
    3a63:	50                   	push   %eax
    3a64:	6a 20                	push   $0x20
    3a66:	68 00 02 00 00       	push   $0x200
    3a6b:	e8 91 ff ff ff       	call   3a01 <rd_wt>
    3a70:	83 c4 20             	add    $0x20,%esp
    3a73:	83 ec 04             	sub    $0x4,%esp
    3a76:	68 00 02 00 00       	push   $0x200
    3a7b:	6a 00                	push   $0x0
    3a7d:	8d 45 e0             	lea    -0x20(%ebp),%eax
    3a80:	50                   	push   %eax
    3a81:	e8 9a 2f 00 00       	call   6a20 <Memset>
    3a86:	83 c4 10             	add    $0x10,%esp
    3a89:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    3a90:	c7 45 e8 00 40 00 00 	movl   $0x4000,-0x18(%ebp)
    3a97:	c7 45 ec 80 00 00 00 	movl   $0x80,-0x14(%ebp)
    3a9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3aa1:	8d 50 02             	lea    0x2(%eax),%edx
    3aa4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3aa7:	01 c2                	add    %eax,%edx
    3aa9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3aac:	01 d0                	add    %edx,%eax
    3aae:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3ab1:	a1 10 90 00 00       	mov    0x9010,%eax
    3ab6:	83 ec 04             	sub    $0x4,%esp
    3ab9:	68 00 02 00 00       	push   $0x200
    3abe:	8d 55 e0             	lea    -0x20(%ebp),%edx
    3ac1:	52                   	push   %edx
    3ac2:	50                   	push   %eax
    3ac3:	e8 2a 2f 00 00       	call   69f2 <Memcpy>
    3ac8:	83 c4 10             	add    $0x10,%esp
    3acb:	a1 10 90 00 00       	mov    0x9010,%eax
    3ad0:	83 ec 04             	sub    $0x4,%esp
    3ad3:	68 00 02 00 00       	push   $0x200
    3ad8:	6a ff                	push   $0xffffffff
    3ada:	50                   	push   %eax
    3adb:	e8 40 2f 00 00       	call   6a20 <Memset>
    3ae0:	83 c4 10             	add    $0x10,%esp
    3ae3:	a1 10 90 00 00       	mov    0x9010,%eax
    3ae8:	83 ec 0c             	sub    $0xc,%esp
    3aeb:	6a 0a                	push   $0xa
    3aed:	68 00 02 00 00       	push   $0x200
    3af2:	50                   	push   %eax
    3af3:	6a 20                	push   $0x20
    3af5:	68 00 02 00 00       	push   $0x200
    3afa:	e8 02 ff ff ff       	call   3a01 <rd_wt>
    3aff:	83 c4 20             	add    $0x20,%esp
    3b02:	90                   	nop
    3b03:	c9                   	leave  
    3b04:	c3                   	ret    

00003b05 <init_fs>:
    3b05:	55                   	push   %ebp
    3b06:	89 e5                	mov    %esp,%ebp
    3b08:	83 ec 78             	sub    $0x78,%esp
    3b0b:	c7 45 94 06 00 00 00 	movl   $0x6,-0x6c(%ebp)
    3b12:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
    3b19:	83 ec 04             	sub    $0x4,%esp
    3b1c:	6a 02                	push   $0x2
    3b1e:	8d 45 90             	lea    -0x70(%ebp),%eax
    3b21:	50                   	push   %eax
    3b22:	6a 03                	push   $0x3
    3b24:	e8 3d ef ff ff       	call   2a66 <send_rec>
    3b29:	83 c4 10             	add    $0x10,%esp
    3b2c:	83 ec 0c             	sub    $0xc,%esp
    3b2f:	68 f4 01 00 00       	push   $0x1f4
    3b34:	e8 2e e2 ff ff       	call   1d67 <delay>
    3b39:	83 c4 10             	add    $0x10,%esp
    3b3c:	eb ee                	jmp    3b2c <init_fs+0x27>

00003b3e <do_open>:
    3b3e:	55                   	push   %ebp
    3b3f:	89 e5                	mov    %esp,%ebp
    3b41:	83 ec 28             	sub    $0x28,%esp
    3b44:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
    3b4b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3b52:	eb 1f                	jmp    3b73 <do_open+0x35>
    3b54:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    3b59:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3b5c:	83 c2 1c             	add    $0x1c,%edx
    3b5f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    3b63:	85 c0                	test   %eax,%eax
    3b65:	75 08                	jne    3b6f <do_open+0x31>
    3b67:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3b6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3b6d:	eb 0a                	jmp    3b79 <do_open+0x3b>
    3b6f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3b73:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    3b77:	7e db                	jle    3b54 <do_open+0x16>
    3b79:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    3b7d:	75 1c                	jne    3b9b <do_open+0x5d>
    3b7f:	68 2b 01 00 00       	push   $0x12b
    3b84:	68 ce 68 00 00       	push   $0x68ce
    3b89:	68 ce 68 00 00       	push   $0x68ce
    3b8e:	68 db 68 00 00       	push   $0x68db
    3b93:	e8 c9 e6 ff ff       	call   2261 <assertion_failure>
    3b98:	83 c4 10             	add    $0x10,%esp
    3b9b:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
    3ba2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3ba9:	eb 1d                	jmp    3bc8 <do_open+0x8a>
    3bab:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3bae:	8b 04 85 40 d7 00 00 	mov    0xd740(,%eax,4),%eax
    3bb5:	8b 40 08             	mov    0x8(%eax),%eax
    3bb8:	85 c0                	test   %eax,%eax
    3bba:	75 08                	jne    3bc4 <do_open+0x86>
    3bbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3bbf:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3bc2:	eb 0a                	jmp    3bce <do_open+0x90>
    3bc4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3bc8:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
    3bcc:	7e dd                	jle    3bab <do_open+0x6d>
    3bce:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
    3bd2:	75 1c                	jne    3bf0 <do_open+0xb2>
    3bd4:	68 35 01 00 00       	push   $0x135
    3bd9:	68 ce 68 00 00       	push   $0x68ce
    3bde:	68 ce 68 00 00       	push   $0x68ce
    3be3:	68 e3 68 00 00       	push   $0x68e3
    3be8:	e8 74 e6 ff ff       	call   2261 <assertion_failure>
    3bed:	83 c4 10             	add    $0x10,%esp
    3bf0:	83 ec 0c             	sub    $0xc,%esp
    3bf3:	ff 75 08             	pushl  0x8(%ebp)
    3bf6:	e8 ab 00 00 00       	call   3ca6 <search_file>
    3bfb:	83 c4 10             	add    $0x10,%esp
    3bfe:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3c01:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
    3c05:	75 29                	jne    3c30 <do_open+0xf2>
    3c07:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3c0b:	7e 10                	jle    3c1d <do_open+0xdf>
    3c0d:	83 ec 0c             	sub    $0xc,%esp
    3c10:	68 eb 68 00 00       	push   $0x68eb
    3c15:	e8 29 e6 ff ff       	call   2243 <panic>
    3c1a:	83 c4 10             	add    $0x10,%esp
    3c1d:	83 ec 0c             	sub    $0xc,%esp
    3c20:	ff 75 08             	pushl  0x8(%ebp)
    3c23:	e8 bf 03 00 00       	call   3fe7 <create_file>
    3c28:	83 c4 10             	add    $0x10,%esp
    3c2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3c2e:	eb 11                	jmp    3c41 <do_open+0x103>
    3c30:	83 ec 0c             	sub    $0xc,%esp
    3c33:	ff 75 e0             	pushl  -0x20(%ebp)
    3c36:	e8 78 02 00 00       	call   3eb3 <get_inode>
    3c3b:	83 c4 10             	add    $0x10,%esp
    3c3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3c41:	83 ec 0c             	sub    $0xc,%esp
    3c44:	68 f8 68 00 00       	push   $0x68f8
    3c49:	e8 f5 e5 ff ff       	call   2243 <panic>
    3c4e:	83 c4 10             	add    $0x10,%esp
    3c51:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    3c56:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3c59:	8b 14 95 40 d7 00 00 	mov    0xd740(,%edx,4),%edx
    3c60:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3c63:	83 c1 1c             	add    $0x1c,%ecx
    3c66:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    3c6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c6d:	8b 04 85 40 d7 00 00 	mov    0xd740(,%eax,4),%eax
    3c74:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    3c77:	89 50 08             	mov    %edx,0x8(%eax)
    3c7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c7d:	8b 04 85 40 d7 00 00 	mov    0xd740(,%eax,4),%eax
    3c84:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    3c8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c8e:	8b 04 85 40 d7 00 00 	mov    0xd740(,%eax,4),%eax
    3c95:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    3c9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c9e:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3ca1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3ca4:	c9                   	leave  
    3ca5:	c3                   	ret    

00003ca6 <search_file>:
    3ca6:	55                   	push   %ebp
    3ca7:	89 e5                	mov    %esp,%ebp
    3ca9:	83 ec 48             	sub    $0x48,%esp
    3cac:	83 ec 04             	sub    $0x4,%esp
    3caf:	ff 75 e4             	pushl  -0x1c(%ebp)
    3cb2:	ff 75 08             	pushl  0x8(%ebp)
    3cb5:	8d 45 ba             	lea    -0x46(%ebp),%eax
    3cb8:	50                   	push   %eax
    3cb9:	e8 18 01 00 00       	call   3dd6 <strip_path>
    3cbe:	83 c4 10             	add    $0x10,%esp
    3cc1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3cc4:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3cc8:	75 1c                	jne    3ce6 <search_file+0x40>
    3cca:	68 5a 01 00 00       	push   $0x15a
    3ccf:	68 ce 68 00 00       	push   $0x68ce
    3cd4:	68 ce 68 00 00       	push   $0x68ce
    3cd9:	68 0b 69 00 00       	push   $0x690b
    3cde:	e8 7e e5 ff ff       	call   2261 <assertion_failure>
    3ce3:	83 c4 10             	add    $0x10,%esp
    3ce6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ce9:	8b 40 04             	mov    0x4(%eax),%eax
    3cec:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3cef:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3cf2:	05 00 02 00 00       	add    $0x200,%eax
    3cf7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    3cfd:	85 c0                	test   %eax,%eax
    3cff:	0f 48 c2             	cmovs  %edx,%eax
    3d02:	c1 f8 09             	sar    $0x9,%eax
    3d05:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3d08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d0b:	8b 40 04             	mov    0x4(%eax),%eax
    3d0e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    3d13:	f7 e2                	mul    %edx
    3d15:	89 d0                	mov    %edx,%eax
    3d17:	c1 e8 02             	shr    $0x2,%eax
    3d1a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3d1d:	e8 3d 11 00 00       	call   4e5f <get_super_block>
    3d22:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3d25:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3d28:	8b 00                	mov    (%eax),%eax
    3d2a:	89 45 cc             	mov    %eax,-0x34(%ebp)
    3d2d:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    3d32:	89 45 c8             	mov    %eax,-0x38(%ebp)
    3d35:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3d3c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3d43:	eb 7e                	jmp    3dc3 <search_file+0x11d>
    3d45:	a1 10 90 00 00       	mov    0x9010,%eax
    3d4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3d4d:	89 d1                	mov    %edx,%ecx
    3d4f:	c1 e1 09             	shl    $0x9,%ecx
    3d52:	8b 55 cc             	mov    -0x34(%ebp),%edx
    3d55:	01 ca                	add    %ecx,%edx
    3d57:	83 ec 0c             	sub    $0xc,%esp
    3d5a:	6a 07                	push   $0x7
    3d5c:	68 00 02 00 00       	push   $0x200
    3d61:	50                   	push   %eax
    3d62:	ff 75 c8             	pushl  -0x38(%ebp)
    3d65:	52                   	push   %edx
    3d66:	e8 96 fc ff ff       	call   3a01 <rd_wt>
    3d6b:	83 c4 20             	add    $0x20,%esp
    3d6e:	a1 10 90 00 00       	mov    0x9010,%eax
    3d73:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d76:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3d7d:	eb 35                	jmp    3db4 <search_file+0x10e>
    3d7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3d83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d86:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3d89:	7f 33                	jg     3dbe <search_file+0x118>
    3d8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d8e:	83 c0 04             	add    $0x4,%eax
    3d91:	83 ec 08             	sub    $0x8,%esp
    3d94:	50                   	push   %eax
    3d95:	8d 45 ba             	lea    -0x46(%ebp),%eax
    3d98:	50                   	push   %eax
    3d99:	e8 a6 00 00 00       	call   3e44 <strcmp>
    3d9e:	83 c4 10             	add    $0x10,%esp
    3da1:	85 c0                	test   %eax,%eax
    3da3:	75 07                	jne    3dac <search_file+0x106>
    3da5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3da8:	8b 00                	mov    (%eax),%eax
    3daa:	eb 28                	jmp    3dd4 <search_file+0x12e>
    3dac:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3db0:	83 45 ec 14          	addl   $0x14,-0x14(%ebp)
    3db4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3db7:	83 f8 1b             	cmp    $0x1b,%eax
    3dba:	76 c3                	jbe    3d7f <search_file+0xd9>
    3dbc:	eb 01                	jmp    3dbf <search_file+0x119>
    3dbe:	90                   	nop
    3dbf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3dc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3dc6:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    3dc9:	0f 8c 76 ff ff ff    	jl     3d45 <search_file+0x9f>
    3dcf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3dd4:	c9                   	leave  
    3dd5:	c3                   	ret    

00003dd6 <strip_path>:
    3dd6:	55                   	push   %ebp
    3dd7:	89 e5                	mov    %esp,%ebp
    3dd9:	83 ec 10             	sub    $0x10,%esp
    3ddc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3de0:	75 07                	jne    3de9 <strip_path+0x13>
    3de2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3de7:	eb 59                	jmp    3e42 <strip_path+0x6c>
    3de9:	8b 45 08             	mov    0x8(%ebp),%eax
    3dec:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3def:	8b 45 0c             	mov    0xc(%ebp),%eax
    3df2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3df5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3df8:	0f b6 00             	movzbl (%eax),%eax
    3dfb:	3c 2f                	cmp    $0x2f,%al
    3dfd:	75 2a                	jne    3e29 <strip_path+0x53>
    3dff:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3e03:	eb 24                	jmp    3e29 <strip_path+0x53>
    3e05:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3e08:	0f b6 00             	movzbl (%eax),%eax
    3e0b:	3c 2f                	cmp    $0x2f,%al
    3e0d:	75 07                	jne    3e16 <strip_path+0x40>
    3e0f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3e14:	eb 2c                	jmp    3e42 <strip_path+0x6c>
    3e16:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3e19:	0f b6 10             	movzbl (%eax),%edx
    3e1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3e1f:	88 10                	mov    %dl,(%eax)
    3e21:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3e25:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3e29:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    3e2d:	75 d6                	jne    3e05 <strip_path+0x2f>
    3e2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3e32:	c6 00 00             	movb   $0x0,(%eax)
    3e35:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    3e3a:	89 45 10             	mov    %eax,0x10(%ebp)
    3e3d:	b8 00 00 00 00       	mov    $0x0,%eax
    3e42:	c9                   	leave  
    3e43:	c3                   	ret    

00003e44 <strcmp>:
    3e44:	55                   	push   %ebp
    3e45:	89 e5                	mov    %esp,%ebp
    3e47:	83 ec 10             	sub    $0x10,%esp
    3e4a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3e4e:	74 06                	je     3e56 <strcmp+0x12>
    3e50:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3e54:	75 08                	jne    3e5e <strcmp+0x1a>
    3e56:	8b 45 08             	mov    0x8(%ebp),%eax
    3e59:	2b 45 0c             	sub    0xc(%ebp),%eax
    3e5c:	eb 53                	jmp    3eb1 <strcmp+0x6d>
    3e5e:	8b 45 08             	mov    0x8(%ebp),%eax
    3e61:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3e64:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e67:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3e6a:	eb 18                	jmp    3e84 <strcmp+0x40>
    3e6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3e6f:	0f b6 10             	movzbl (%eax),%edx
    3e72:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3e75:	0f b6 00             	movzbl (%eax),%eax
    3e78:	38 c2                	cmp    %al,%dl
    3e7a:	75 1e                	jne    3e9a <strcmp+0x56>
    3e7c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3e80:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3e84:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3e87:	0f b6 00             	movzbl (%eax),%eax
    3e8a:	84 c0                	test   %al,%al
    3e8c:	74 0d                	je     3e9b <strcmp+0x57>
    3e8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3e91:	0f b6 00             	movzbl (%eax),%eax
    3e94:	84 c0                	test   %al,%al
    3e96:	75 d4                	jne    3e6c <strcmp+0x28>
    3e98:	eb 01                	jmp    3e9b <strcmp+0x57>
    3e9a:	90                   	nop
    3e9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3e9e:	0f b6 00             	movzbl (%eax),%eax
    3ea1:	0f be d0             	movsbl %al,%edx
    3ea4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ea7:	0f b6 00             	movzbl (%eax),%eax
    3eaa:	0f be c0             	movsbl %al,%eax
    3ead:	29 c2                	sub    %eax,%edx
    3eaf:	89 d0                	mov    %edx,%eax
    3eb1:	c9                   	leave  
    3eb2:	c3                   	ret    

00003eb3 <get_inode>:
    3eb3:	55                   	push   %ebp
    3eb4:	89 e5                	mov    %esp,%ebp
    3eb6:	56                   	push   %esi
    3eb7:	53                   	push   %ebx
    3eb8:	83 ec 20             	sub    $0x20,%esp
    3ebb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3ebf:	75 0a                	jne    3ecb <get_inode+0x18>
    3ec1:	b8 00 00 00 00       	mov    $0x0,%eax
    3ec6:	e9 15 01 00 00       	jmp    3fe0 <get_inode+0x12d>
    3ecb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3ed2:	c7 45 f0 40 d8 00 00 	movl   $0xd840,-0x10(%ebp)
    3ed9:	eb 29                	jmp    3f04 <get_inode+0x51>
    3edb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ede:	8b 40 18             	mov    0x18(%eax),%eax
    3ee1:	85 c0                	test   %eax,%eax
    3ee3:	7e 13                	jle    3ef8 <get_inode+0x45>
    3ee5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ee8:	8b 40 10             	mov    0x10(%eax),%eax
    3eeb:	39 45 08             	cmp    %eax,0x8(%ebp)
    3eee:	75 10                	jne    3f00 <get_inode+0x4d>
    3ef0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ef3:	e9 e8 00 00 00       	jmp    3fe0 <get_inode+0x12d>
    3ef8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3efb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3efe:	eb 0d                	jmp    3f0d <get_inode+0x5a>
    3f00:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
    3f04:	81 7d f0 40 df 00 00 	cmpl   $0xdf40,-0x10(%ebp)
    3f0b:	76 ce                	jbe    3edb <get_inode+0x28>
    3f0d:	e8 4d 0f 00 00       	call   4e5f <get_super_block>
    3f12:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3f15:	c7 45 e8 1c 00 00 00 	movl   $0x1c,-0x18(%ebp)
    3f1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3f1f:	8b 40 04             	mov    0x4(%eax),%eax
    3f22:	8d 50 02             	lea    0x2(%eax),%edx
    3f25:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3f28:	8b 40 08             	mov    0x8(%eax),%eax
    3f2b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    3f2e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f31:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3f34:	b8 00 02 00 00       	mov    $0x200,%eax
    3f39:	99                   	cltd   
    3f3a:	f7 7d e8             	idivl  -0x18(%ebp)
    3f3d:	89 c6                	mov    %eax,%esi
    3f3f:	89 c8                	mov    %ecx,%eax
    3f41:	99                   	cltd   
    3f42:	f7 fe                	idiv   %esi
    3f44:	01 d8                	add    %ebx,%eax
    3f46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3f49:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
    3f50:	a1 10 90 00 00       	mov    0x9010,%eax
    3f55:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    3f58:	c1 e2 09             	shl    $0x9,%edx
    3f5b:	83 ec 0c             	sub    $0xc,%esp
    3f5e:	6a 07                	push   $0x7
    3f60:	68 00 02 00 00       	push   $0x200
    3f65:	50                   	push   %eax
    3f66:	ff 75 e0             	pushl  -0x20(%ebp)
    3f69:	52                   	push   %edx
    3f6a:	e8 92 fa ff ff       	call   3a01 <rd_wt>
    3f6f:	83 c4 20             	add    $0x20,%esp
    3f72:	8b 45 08             	mov    0x8(%ebp),%eax
    3f75:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3f78:	b8 00 02 00 00       	mov    $0x200,%eax
    3f7d:	99                   	cltd   
    3f7e:	f7 7d e8             	idivl  -0x18(%ebp)
    3f81:	89 c3                	mov    %eax,%ebx
    3f83:	89 c8                	mov    %ecx,%eax
    3f85:	99                   	cltd   
    3f86:	f7 fb                	idiv   %ebx
    3f88:	89 55 dc             	mov    %edx,-0x24(%ebp)
    3f8b:	8b 15 10 90 00 00    	mov    0x9010,%edx
    3f91:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f94:	0f af 45 dc          	imul   -0x24(%ebp),%eax
    3f98:	01 d0                	add    %edx,%eax
    3f9a:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3f9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fa0:	8b 55 08             	mov    0x8(%ebp),%edx
    3fa3:	89 50 10             	mov    %edx,0x10(%eax)
    3fa6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3fa9:	8b 50 04             	mov    0x4(%eax),%edx
    3fac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3faf:	89 50 04             	mov    %edx,0x4(%eax)
    3fb2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3fb5:	8b 50 08             	mov    0x8(%eax),%edx
    3fb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fbb:	89 50 08             	mov    %edx,0x8(%eax)
    3fbe:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3fc1:	8b 10                	mov    (%eax),%edx
    3fc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fc6:	89 10                	mov    %edx,(%eax)
    3fc8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3fcb:	8b 50 0c             	mov    0xc(%eax),%edx
    3fce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fd1:	89 50 0c             	mov    %edx,0xc(%eax)
    3fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fd7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    3fda:	89 50 14             	mov    %edx,0x14(%eax)
    3fdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fe0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3fe3:	5b                   	pop    %ebx
    3fe4:	5e                   	pop    %esi
    3fe5:	5d                   	pop    %ebp
    3fe6:	c3                   	ret    

00003fe7 <create_file>:
    3fe7:	55                   	push   %ebp
    3fe8:	89 e5                	mov    %esp,%ebp
    3fea:	83 ec 38             	sub    $0x38,%esp
    3fed:	ff 75 f4             	pushl  -0xc(%ebp)
    3ff0:	ff 75 08             	pushl  0x8(%ebp)
    3ff3:	8d 45 ce             	lea    -0x32(%ebp),%eax
    3ff6:	50                   	push   %eax
    3ff7:	e8 da fd ff ff       	call   3dd6 <strip_path>
    3ffc:	83 c4 0c             	add    $0xc,%esp
    3fff:	83 f8 ff             	cmp    $0xffffffff,%eax
    4002:	75 0a                	jne    400e <create_file+0x27>
    4004:	b8 00 00 00 00       	mov    $0x0,%eax
    4009:	e9 90 00 00 00       	jmp    409e <create_file+0xb7>
    400e:	e8 8d 00 00 00       	call   40a0 <alloc_imap_bit>
    4013:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4016:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    401a:	75 07                	jne    4023 <create_file+0x3c>
    401c:	b8 00 00 00 00       	mov    $0x0,%eax
    4021:	eb 7b                	jmp    409e <create_file+0xb7>
    4023:	e8 37 0e 00 00       	call   4e5f <get_super_block>
    4028:	89 45 ec             	mov    %eax,-0x14(%ebp)
    402b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    402e:	8b 40 10             	mov    0x10(%eax),%eax
    4031:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4034:	83 ec 08             	sub    $0x8,%esp
    4037:	ff 75 e8             	pushl  -0x18(%ebp)
    403a:	ff 75 f0             	pushl  -0x10(%ebp)
    403d:	e8 63 01 00 00       	call   41a5 <alloc_smap_bit>
    4042:	83 c4 10             	add    $0x10,%esp
    4045:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4048:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    404c:	75 07                	jne    4055 <create_file+0x6e>
    404e:	b8 00 00 00 00       	mov    $0x0,%eax
    4053:	eb 49                	jmp    409e <create_file+0xb7>
    4055:	83 ec 08             	sub    $0x8,%esp
    4058:	ff 75 e4             	pushl  -0x1c(%ebp)
    405b:	ff 75 f0             	pushl  -0x10(%ebp)
    405e:	e8 d9 02 00 00       	call   433c <new_inode>
    4063:	83 c4 10             	add    $0x10,%esp
    4066:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4069:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    406d:	75 07                	jne    4076 <create_file+0x8f>
    406f:	b8 00 00 00 00       	mov    $0x0,%eax
    4074:	eb 28                	jmp    409e <create_file+0xb7>
    4076:	83 ec 04             	sub    $0x4,%esp
    4079:	ff 75 f0             	pushl  -0x10(%ebp)
    407c:	8d 45 ce             	lea    -0x32(%ebp),%eax
    407f:	50                   	push   %eax
    4080:	ff 75 f4             	pushl  -0xc(%ebp)
    4083:	e8 08 03 00 00       	call   4390 <new_dir_entry>
    4088:	83 c4 10             	add    $0x10,%esp
    408b:	89 45 dc             	mov    %eax,-0x24(%ebp)
    408e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    4092:	75 07                	jne    409b <create_file+0xb4>
    4094:	b8 00 00 00 00       	mov    $0x0,%eax
    4099:	eb 03                	jmp    409e <create_file+0xb7>
    409b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    409e:	c9                   	leave  
    409f:	c3                   	ret    

000040a0 <alloc_imap_bit>:
    40a0:	55                   	push   %ebp
    40a1:	89 e5                	mov    %esp,%ebp
    40a3:	53                   	push   %ebx
    40a4:	83 ec 24             	sub    $0x24,%esp
    40a7:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
    40ae:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    40b5:	a1 10 90 00 00       	mov    0x9010,%eax
    40ba:	8b 55 ec             	mov    -0x14(%ebp),%edx
    40bd:	c1 e2 09             	shl    $0x9,%edx
    40c0:	83 ec 0c             	sub    $0xc,%esp
    40c3:	6a 07                	push   $0x7
    40c5:	68 00 02 00 00       	push   $0x200
    40ca:	50                   	push   %eax
    40cb:	ff 75 e8             	pushl  -0x18(%ebp)
    40ce:	52                   	push   %edx
    40cf:	e8 2d f9 ff ff       	call   3a01 <rd_wt>
    40d4:	83 c4 20             	add    $0x20,%esp
    40d7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    40de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    40e5:	e9 a9 00 00 00       	jmp    4193 <alloc_imap_bit+0xf3>
    40ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    40f1:	e9 8f 00 00 00       	jmp    4185 <alloc_imap_bit+0xe5>
    40f6:	8b 15 10 90 00 00    	mov    0x9010,%edx
    40fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40ff:	01 d0                	add    %edx,%eax
    4101:	0f b6 00             	movzbl (%eax),%eax
    4104:	0f be d0             	movsbl %al,%edx
    4107:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    410b:	0f 94 c0             	sete   %al
    410e:	0f b6 c0             	movzbl %al,%eax
    4111:	21 d0                	and    %edx,%eax
    4113:	85 c0                	test   %eax,%eax
    4115:	74 06                	je     411d <alloc_imap_bit+0x7d>
    4117:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    411b:	eb 68                	jmp    4185 <alloc_imap_bit+0xe5>
    411d:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4123:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4126:	01 d0                	add    %edx,%eax
    4128:	0f b6 18             	movzbl (%eax),%ebx
    412b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    412e:	ba 01 00 00 00       	mov    $0x1,%edx
    4133:	89 c1                	mov    %eax,%ecx
    4135:	d3 e2                	shl    %cl,%edx
    4137:	89 d0                	mov    %edx,%eax
    4139:	89 c1                	mov    %eax,%ecx
    413b:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4141:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4144:	01 d0                	add    %edx,%eax
    4146:	09 cb                	or     %ecx,%ebx
    4148:	89 da                	mov    %ebx,%edx
    414a:	88 10                	mov    %dl,(%eax)
    414c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    414f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4156:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4159:	01 d0                	add    %edx,%eax
    415b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    415e:	a1 10 90 00 00       	mov    0x9010,%eax
    4163:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4166:	c1 e2 09             	shl    $0x9,%edx
    4169:	83 ec 0c             	sub    $0xc,%esp
    416c:	6a 0a                	push   $0xa
    416e:	68 00 02 00 00       	push   $0x200
    4173:	50                   	push   %eax
    4174:	ff 75 e8             	pushl  -0x18(%ebp)
    4177:	52                   	push   %edx
    4178:	e8 84 f8 ff ff       	call   3a01 <rd_wt>
    417d:	83 c4 20             	add    $0x20,%esp
    4180:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4183:	eb 1b                	jmp    41a0 <alloc_imap_bit+0x100>
    4185:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    4189:	0f 8e 67 ff ff ff    	jle    40f6 <alloc_imap_bit+0x56>
    418f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4193:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    419a:	0f 8e 4a ff ff ff    	jle    40ea <alloc_imap_bit+0x4a>
    41a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    41a3:	c9                   	leave  
    41a4:	c3                   	ret    

000041a5 <alloc_smap_bit>:
    41a5:	55                   	push   %ebp
    41a6:	89 e5                	mov    %esp,%ebp
    41a8:	53                   	push   %ebx
    41a9:	83 ec 34             	sub    $0x34,%esp
    41ac:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    41b0:	7f 1c                	jg     41ce <alloc_smap_bit+0x29>
    41b2:	68 18 02 00 00       	push   $0x218
    41b7:	68 ce 68 00 00       	push   $0x68ce
    41bc:	68 ce 68 00 00       	push   $0x68ce
    41c1:	68 15 69 00 00       	push   $0x6915
    41c6:	e8 96 e0 ff ff       	call   2261 <assertion_failure>
    41cb:	83 c4 10             	add    $0x10,%esp
    41ce:	e8 8c 0c 00 00       	call   4e5f <get_super_block>
    41d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    41d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41d9:	8b 40 08             	mov    0x8(%eax),%eax
    41dc:	89 45 e0             	mov    %eax,-0x20(%ebp)
    41df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41e2:	8b 40 04             	mov    0x4(%eax),%eax
    41e5:	83 c0 02             	add    $0x2,%eax
    41e8:	89 45 dc             	mov    %eax,-0x24(%ebp)
    41eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    41f2:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    41f9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4200:	e9 20 01 00 00       	jmp    4325 <alloc_smap_bit+0x180>
    4205:	8b 55 dc             	mov    -0x24(%ebp),%edx
    4208:	8b 45 f0             	mov    -0x10(%ebp),%eax
    420b:	01 d0                	add    %edx,%eax
    420d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4210:	a1 10 90 00 00       	mov    0x9010,%eax
    4215:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4218:	c1 e2 09             	shl    $0x9,%edx
    421b:	83 ec 0c             	sub    $0xc,%esp
    421e:	6a 07                	push   $0x7
    4220:	68 00 02 00 00       	push   $0x200
    4225:	50                   	push   %eax
    4226:	ff 75 d8             	pushl  -0x28(%ebp)
    4229:	52                   	push   %edx
    422a:	e8 d2 f7 ff ff       	call   3a01 <rd_wt>
    422f:	83 c4 20             	add    $0x20,%esp
    4232:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4239:	e9 a8 00 00 00       	jmp    42e6 <alloc_smap_bit+0x141>
    423e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    4245:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4249:	0f 85 8a 00 00 00    	jne    42d9 <alloc_smap_bit+0x134>
    424f:	eb 45                	jmp    4296 <alloc_smap_bit+0xf1>
    4251:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4257:	8b 45 ec             	mov    -0x14(%ebp),%eax
    425a:	01 d0                	add    %edx,%eax
    425c:	0f b6 00             	movzbl (%eax),%eax
    425f:	0f be d0             	movsbl %al,%edx
    4262:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4266:	0f 94 c0             	sete   %al
    4269:	0f b6 c0             	movzbl %al,%eax
    426c:	21 d0                	and    %edx,%eax
    426e:	85 c0                	test   %eax,%eax
    4270:	74 06                	je     4278 <alloc_smap_bit+0xd3>
    4272:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4276:	eb 1e                	jmp    4296 <alloc_smap_bit+0xf1>
    4278:	8b 45 f0             	mov    -0x10(%ebp),%eax
    427b:	c1 e0 09             	shl    $0x9,%eax
    427e:	89 c2                	mov    %eax,%edx
    4280:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4283:	01 d0                	add    %edx,%eax
    4285:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    428c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    428f:	01 d0                	add    %edx,%eax
    4291:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4294:	eb 06                	jmp    429c <alloc_smap_bit+0xf7>
    4296:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    429a:	7e b5                	jle    4251 <alloc_smap_bit+0xac>
    429c:	eb 3b                	jmp    42d9 <alloc_smap_bit+0x134>
    429e:	8b 15 10 90 00 00    	mov    0x9010,%edx
    42a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42a7:	01 d0                	add    %edx,%eax
    42a9:	0f b6 10             	movzbl (%eax),%edx
    42ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    42af:	bb 01 00 00 00       	mov    $0x1,%ebx
    42b4:	89 c1                	mov    %eax,%ecx
    42b6:	d3 e3                	shl    %cl,%ebx
    42b8:	89 d8                	mov    %ebx,%eax
    42ba:	89 c3                	mov    %eax,%ebx
    42bc:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    42c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42c5:	01 c8                	add    %ecx,%eax
    42c7:	21 da                	and    %ebx,%edx
    42c9:	88 10                	mov    %dl,(%eax)
    42cb:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    42cf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    42d3:	74 0c                	je     42e1 <alloc_smap_bit+0x13c>
    42d5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    42d9:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    42dd:	7e bf                	jle    429e <alloc_smap_bit+0xf9>
    42df:	eb 01                	jmp    42e2 <alloc_smap_bit+0x13d>
    42e1:	90                   	nop
    42e2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    42e6:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
    42ed:	0f 8e 4b ff ff ff    	jle    423e <alloc_smap_bit+0x99>
    42f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    42f7:	74 22                	je     431b <alloc_smap_bit+0x176>
    42f9:	a1 10 90 00 00       	mov    0x9010,%eax
    42fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4301:	c1 e2 09             	shl    $0x9,%edx
    4304:	83 ec 0c             	sub    $0xc,%esp
    4307:	6a 0a                	push   $0xa
    4309:	68 00 02 00 00       	push   $0x200
    430e:	50                   	push   %eax
    430f:	ff 75 d8             	pushl  -0x28(%ebp)
    4312:	52                   	push   %edx
    4313:	e8 e9 f6 ff ff       	call   3a01 <rd_wt>
    4318:	83 c4 20             	add    $0x20,%esp
    431b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    431f:	74 12                	je     4333 <alloc_smap_bit+0x18e>
    4321:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4325:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4328:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    432b:	0f 8c d4 fe ff ff    	jl     4205 <alloc_smap_bit+0x60>
    4331:	eb 01                	jmp    4334 <alloc_smap_bit+0x18f>
    4333:	90                   	nop
    4334:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4337:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    433a:	c9                   	leave  
    433b:	c3                   	ret    

0000433c <new_inode>:
    433c:	55                   	push   %ebp
    433d:	89 e5                	mov    %esp,%ebp
    433f:	83 ec 18             	sub    $0x18,%esp
    4342:	83 ec 0c             	sub    $0xc,%esp
    4345:	ff 75 08             	pushl  0x8(%ebp)
    4348:	e8 66 fb ff ff       	call   3eb3 <get_inode>
    434d:	83 c4 10             	add    $0x10,%esp
    4350:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4353:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4357:	75 07                	jne    4360 <new_inode+0x24>
    4359:	b8 00 00 00 00       	mov    $0x0,%eax
    435e:	eb 2e                	jmp    438e <new_inode+0x52>
    4360:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4363:	8b 55 0c             	mov    0xc(%ebp),%edx
    4366:	89 50 08             	mov    %edx,0x8(%eax)
    4369:	8b 45 f4             	mov    -0xc(%ebp),%eax
    436c:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4373:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4376:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    437d:	83 ec 0c             	sub    $0xc,%esp
    4380:	ff 75 f4             	pushl  -0xc(%ebp)
    4383:	e8 4d 09 00 00       	call   4cd5 <sync_inode>
    4388:	83 c4 10             	add    $0x10,%esp
    438b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    438e:	c9                   	leave  
    438f:	c3                   	ret    

00004390 <new_dir_entry>:
    4390:	55                   	push   %ebp
    4391:	89 e5                	mov    %esp,%ebp
    4393:	83 ec 38             	sub    $0x38,%esp
    4396:	c7 45 e0 14 00 00 00 	movl   $0x14,-0x20(%ebp)
    439d:	8b 45 08             	mov    0x8(%ebp),%eax
    43a0:	8b 50 04             	mov    0x4(%eax),%edx
    43a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    43a6:	89 c1                	mov    %eax,%ecx
    43a8:	d3 fa                	sar    %cl,%edx
    43aa:	89 d0                	mov    %edx,%eax
    43ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
    43af:	8b 45 08             	mov    0x8(%ebp),%eax
    43b2:	8b 50 0c             	mov    0xc(%eax),%edx
    43b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    43b8:	89 c1                	mov    %eax,%ecx
    43ba:	d3 fa                	sar    %cl,%edx
    43bc:	89 d0                	mov    %edx,%eax
    43be:	89 45 d8             	mov    %eax,-0x28(%ebp)
    43c1:	e8 99 0a 00 00       	call   4e5f <get_super_block>
    43c6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    43c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    43cc:	8b 00                	mov    (%eax),%eax
    43ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
    43d1:	8b 45 08             	mov    0x8(%ebp),%eax
    43d4:	8b 40 0c             	mov    0xc(%eax),%eax
    43d7:	05 00 02 00 00       	add    $0x200,%eax
    43dc:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    43e2:	85 c0                	test   %eax,%eax
    43e4:	0f 48 c2             	cmovs  %edx,%eax
    43e7:	c1 f8 09             	sar    $0x9,%eax
    43ea:	89 45 cc             	mov    %eax,-0x34(%ebp)
    43ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    43f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    43fb:	c7 45 c8 20 00 00 00 	movl   $0x20,-0x38(%ebp)
    4402:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    4409:	e9 82 00 00 00       	jmp    4490 <new_dir_entry+0x100>
    440e:	a1 10 90 00 00       	mov    0x9010,%eax
    4413:	8b 55 e8             	mov    -0x18(%ebp),%edx
    4416:	89 d1                	mov    %edx,%ecx
    4418:	c1 e1 09             	shl    $0x9,%ecx
    441b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    441e:	01 ca                	add    %ecx,%edx
    4420:	83 ec 0c             	sub    $0xc,%esp
    4423:	6a 07                	push   $0x7
    4425:	68 00 02 00 00       	push   $0x200
    442a:	50                   	push   %eax
    442b:	ff 75 c8             	pushl  -0x38(%ebp)
    442e:	52                   	push   %edx
    442f:	e8 cd f5 ff ff       	call   3a01 <rd_wt>
    4434:	83 c4 20             	add    $0x20,%esp
    4437:	a1 10 90 00 00       	mov    0x9010,%eax
    443c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    443f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4446:	eb 25                	jmp    446d <new_dir_entry+0xdd>
    4448:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    444c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    444f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    4452:	7f 29                	jg     447d <new_dir_entry+0xed>
    4454:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4457:	8b 00                	mov    (%eax),%eax
    4459:	85 c0                	test   %eax,%eax
    445b:	75 08                	jne    4465 <new_dir_entry+0xd5>
    445d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4460:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4463:	eb 19                	jmp    447e <new_dir_entry+0xee>
    4465:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4469:	83 45 f0 14          	addl   $0x14,-0x10(%ebp)
    446d:	b8 00 02 00 00       	mov    $0x200,%eax
    4472:	99                   	cltd   
    4473:	f7 7d e0             	idivl  -0x20(%ebp)
    4476:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    4479:	7c cd                	jl     4448 <new_dir_entry+0xb8>
    447b:	eb 01                	jmp    447e <new_dir_entry+0xee>
    447d:	90                   	nop
    447e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4481:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    4484:	7f 16                	jg     449c <new_dir_entry+0x10c>
    4486:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    448a:	75 10                	jne    449c <new_dir_entry+0x10c>
    448c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4490:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4493:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    4496:	0f 8c 72 ff ff ff    	jl     440e <new_dir_entry+0x7e>
    449c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    449f:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    44a2:	75 07                	jne    44ab <new_dir_entry+0x11b>
    44a4:	b8 00 00 00 00       	mov    $0x0,%eax
    44a9:	eb 71                	jmp    451c <new_dir_entry+0x18c>
    44ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    44af:	75 25                	jne    44d6 <new_dir_entry+0x146>
    44b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    44b7:	8b 45 08             	mov    0x8(%ebp),%eax
    44ba:	8b 50 04             	mov    0x4(%eax),%edx
    44bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    44c0:	01 c2                	add    %eax,%edx
    44c2:	8b 45 08             	mov    0x8(%ebp),%eax
    44c5:	89 50 04             	mov    %edx,0x4(%eax)
    44c8:	83 ec 0c             	sub    $0xc,%esp
    44cb:	ff 75 08             	pushl  0x8(%ebp)
    44ce:	e8 02 08 00 00       	call   4cd5 <sync_inode>
    44d3:	83 c4 10             	add    $0x10,%esp
    44d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44d9:	8b 55 10             	mov    0x10(%ebp),%edx
    44dc:	89 10                	mov    %edx,(%eax)
    44de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44e1:	83 c0 04             	add    $0x4,%eax
    44e4:	83 ec 08             	sub    $0x8,%esp
    44e7:	ff 75 0c             	pushl  0xc(%ebp)
    44ea:	50                   	push   %eax
    44eb:	e8 4f 25 00 00       	call   6a3f <Strcpy>
    44f0:	83 c4 10             	add    $0x10,%esp
    44f3:	a1 10 90 00 00       	mov    0x9010,%eax
    44f8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    44fb:	89 d1                	mov    %edx,%ecx
    44fd:	c1 e1 09             	shl    $0x9,%ecx
    4500:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4503:	01 ca                	add    %ecx,%edx
    4505:	83 ec 0c             	sub    $0xc,%esp
    4508:	6a 0a                	push   $0xa
    450a:	68 00 02 00 00       	push   $0x200
    450f:	50                   	push   %eax
    4510:	ff 75 c8             	pushl  -0x38(%ebp)
    4513:	52                   	push   %edx
    4514:	e8 e8 f4 ff ff       	call   3a01 <rd_wt>
    4519:	83 c4 20             	add    $0x20,%esp
    451c:	c9                   	leave  
    451d:	c3                   	ret    

0000451e <do_unlink>:
    451e:	55                   	push   %ebp
    451f:	89 e5                	mov    %esp,%ebp
    4521:	53                   	push   %ebx
    4522:	83 ec 74             	sub    $0x74,%esp
    4525:	ff 75 08             	pushl  0x8(%ebp)
    4528:	68 2a 69 00 00       	push   $0x692a
    452d:	e8 12 f9 ff ff       	call   3e44 <strcmp>
    4532:	83 c4 08             	add    $0x8,%esp
    4535:	85 c0                	test   %eax,%eax
    4537:	75 10                	jne    4549 <do_unlink+0x2b>
    4539:	83 ec 0c             	sub    $0xc,%esp
    453c:	68 2c 69 00 00       	push   $0x692c
    4541:	e8 fd dc ff ff       	call   2243 <panic>
    4546:	83 c4 10             	add    $0x10,%esp
    4549:	83 ec 0c             	sub    $0xc,%esp
    454c:	ff 75 08             	pushl  0x8(%ebp)
    454f:	e8 52 f7 ff ff       	call   3ca6 <search_file>
    4554:	83 c4 10             	add    $0x10,%esp
    4557:	89 45 d0             	mov    %eax,-0x30(%ebp)
    455a:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    455e:	75 10                	jne    4570 <do_unlink+0x52>
    4560:	83 ec 0c             	sub    $0xc,%esp
    4563:	68 48 69 00 00       	push   $0x6948
    4568:	e8 d6 dc ff ff       	call   2243 <panic>
    456d:	83 c4 10             	add    $0x10,%esp
    4570:	83 ec 0c             	sub    $0xc,%esp
    4573:	ff 75 d0             	pushl  -0x30(%ebp)
    4576:	e8 38 f9 ff ff       	call   3eb3 <get_inode>
    457b:	83 c4 10             	add    $0x10,%esp
    457e:	89 45 cc             	mov    %eax,-0x34(%ebp)
    4581:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    4585:	75 10                	jne    4597 <do_unlink+0x79>
    4587:	83 ec 0c             	sub    $0xc,%esp
    458a:	68 48 69 00 00       	push   $0x6948
    458f:	e8 af dc ff ff       	call   2243 <panic>
    4594:	83 c4 10             	add    $0x10,%esp
    4597:	8b 45 cc             	mov    -0x34(%ebp),%eax
    459a:	8b 40 18             	mov    0x18(%eax),%eax
    459d:	85 c0                	test   %eax,%eax
    459f:	7e 10                	jle    45b1 <do_unlink+0x93>
    45a1:	83 ec 0c             	sub    $0xc,%esp
    45a4:	68 64 69 00 00       	push   $0x6964
    45a9:	e8 95 dc ff ff       	call   2243 <panic>
    45ae:	83 c4 10             	add    $0x10,%esp
    45b1:	8b 45 cc             	mov    -0x34(%ebp),%eax
    45b4:	8b 40 10             	mov    0x10(%eax),%eax
    45b7:	89 45 c8             	mov    %eax,-0x38(%ebp)
    45ba:	8b 45 c8             	mov    -0x38(%ebp),%eax
    45bd:	8d 50 07             	lea    0x7(%eax),%edx
    45c0:	85 c0                	test   %eax,%eax
    45c2:	0f 48 c2             	cmovs  %edx,%eax
    45c5:	c1 f8 03             	sar    $0x3,%eax
    45c8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    45cb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    45ce:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    45d4:	85 c0                	test   %eax,%eax
    45d6:	0f 48 c2             	cmovs  %edx,%eax
    45d9:	c1 f8 09             	sar    $0x9,%eax
    45dc:	89 45 c0             	mov    %eax,-0x40(%ebp)
    45df:	8b 45 c8             	mov    -0x38(%ebp),%eax
    45e2:	99                   	cltd   
    45e3:	c1 ea 1d             	shr    $0x1d,%edx
    45e6:	01 d0                	add    %edx,%eax
    45e8:	83 e0 07             	and    $0x7,%eax
    45eb:	29 d0                	sub    %edx,%eax
    45ed:	89 45 bc             	mov    %eax,-0x44(%ebp)
    45f0:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
    45f7:	a1 10 90 00 00       	mov    0x9010,%eax
    45fc:	8b 55 c0             	mov    -0x40(%ebp),%edx
    45ff:	c1 e2 09             	shl    $0x9,%edx
    4602:	83 c2 02             	add    $0x2,%edx
    4605:	83 ec 0c             	sub    $0xc,%esp
    4608:	6a 07                	push   $0x7
    460a:	68 00 02 00 00       	push   $0x200
    460f:	50                   	push   %eax
    4610:	ff 75 b8             	pushl  -0x48(%ebp)
    4613:	52                   	push   %edx
    4614:	e8 e8 f3 ff ff       	call   3a01 <rd_wt>
    4619:	83 c4 20             	add    $0x20,%esp
    461c:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4622:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4625:	01 d0                	add    %edx,%eax
    4627:	0f b6 10             	movzbl (%eax),%edx
    462a:	8b 45 bc             	mov    -0x44(%ebp),%eax
    462d:	bb 01 00 00 00       	mov    $0x1,%ebx
    4632:	89 c1                	mov    %eax,%ecx
    4634:	d3 e3                	shl    %cl,%ebx
    4636:	89 d8                	mov    %ebx,%eax
    4638:	f7 d0                	not    %eax
    463a:	89 c3                	mov    %eax,%ebx
    463c:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    4642:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4645:	01 c8                	add    %ecx,%eax
    4647:	21 da                	and    %ebx,%edx
    4649:	88 10                	mov    %dl,(%eax)
    464b:	a1 10 90 00 00       	mov    0x9010,%eax
    4650:	8b 55 c0             	mov    -0x40(%ebp),%edx
    4653:	c1 e2 09             	shl    $0x9,%edx
    4656:	83 c2 02             	add    $0x2,%edx
    4659:	83 ec 0c             	sub    $0xc,%esp
    465c:	6a 0a                	push   $0xa
    465e:	68 00 02 00 00       	push   $0x200
    4663:	50                   	push   %eax
    4664:	ff 75 b8             	pushl  -0x48(%ebp)
    4667:	52                   	push   %edx
    4668:	e8 94 f3 ff ff       	call   3a01 <rd_wt>
    466d:	83 c4 20             	add    $0x20,%esp
    4670:	e8 ea 07 00 00       	call   4e5f <get_super_block>
    4675:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    4678:	8b 45 cc             	mov    -0x34(%ebp),%eax
    467b:	8b 50 08             	mov    0x8(%eax),%edx
    467e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4681:	8b 00                	mov    (%eax),%eax
    4683:	29 c2                	sub    %eax,%edx
    4685:	89 d0                	mov    %edx,%eax
    4687:	83 c0 01             	add    $0x1,%eax
    468a:	89 45 b0             	mov    %eax,-0x50(%ebp)
    468d:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4690:	8d 50 07             	lea    0x7(%eax),%edx
    4693:	85 c0                	test   %eax,%eax
    4695:	0f 48 c2             	cmovs  %edx,%eax
    4698:	c1 f8 03             	sar    $0x3,%eax
    469b:	89 45 ac             	mov    %eax,-0x54(%ebp)
    469e:	8b 45 ac             	mov    -0x54(%ebp),%eax
    46a1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    46a7:	85 c0                	test   %eax,%eax
    46a9:	0f 48 c2             	cmovs  %edx,%eax
    46ac:	c1 f8 09             	sar    $0x9,%eax
    46af:	89 45 a8             	mov    %eax,-0x58(%ebp)
    46b2:	8b 45 b0             	mov    -0x50(%ebp),%eax
    46b5:	99                   	cltd   
    46b6:	c1 ea 1d             	shr    $0x1d,%edx
    46b9:	01 d0                	add    %edx,%eax
    46bb:	83 e0 07             	and    $0x7,%eax
    46be:	29 d0                	sub    %edx,%eax
    46c0:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    46c3:	b8 08 00 00 00       	mov    $0x8,%eax
    46c8:	2b 45 a4             	sub    -0x5c(%ebp),%eax
    46cb:	8b 55 b0             	mov    -0x50(%ebp),%edx
    46ce:	29 c2                	sub    %eax,%edx
    46d0:	89 d0                	mov    %edx,%eax
    46d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    46d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46d8:	8d 50 07             	lea    0x7(%eax),%edx
    46db:	85 c0                	test   %eax,%eax
    46dd:	0f 48 c2             	cmovs  %edx,%eax
    46e0:	c1 f8 03             	sar    $0x3,%eax
    46e3:	89 45 a0             	mov    %eax,-0x60(%ebp)
    46e6:	a1 10 90 00 00       	mov    0x9010,%eax
    46eb:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    46ee:	8b 52 04             	mov    0x4(%edx),%edx
    46f1:	8d 4a 02             	lea    0x2(%edx),%ecx
    46f4:	8b 55 a8             	mov    -0x58(%ebp),%edx
    46f7:	c1 e2 09             	shl    $0x9,%edx
    46fa:	01 ca                	add    %ecx,%edx
    46fc:	83 ec 0c             	sub    $0xc,%esp
    46ff:	6a 07                	push   $0x7
    4701:	68 00 02 00 00       	push   $0x200
    4706:	50                   	push   %eax
    4707:	ff 75 b8             	pushl  -0x48(%ebp)
    470a:	52                   	push   %edx
    470b:	e8 f1 f2 ff ff       	call   3a01 <rd_wt>
    4710:	83 c4 20             	add    $0x20,%esp
    4713:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4719:	8b 45 ac             	mov    -0x54(%ebp),%eax
    471c:	01 d0                	add    %edx,%eax
    471e:	0f b6 10             	movzbl (%eax),%edx
    4721:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4724:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    4729:	89 c1                	mov    %eax,%ecx
    472b:	d3 e3                	shl    %cl,%ebx
    472d:	89 d8                	mov    %ebx,%eax
    472f:	f7 d0                	not    %eax
    4731:	89 c3                	mov    %eax,%ebx
    4733:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    4739:	8b 45 ac             	mov    -0x54(%ebp),%eax
    473c:	01 c8                	add    %ecx,%eax
    473e:	21 da                	and    %ebx,%edx
    4740:	88 10                	mov    %dl,(%eax)
    4742:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    4749:	8b 45 a8             	mov    -0x58(%ebp),%eax
    474c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    474f:	eb 71                	jmp    47c2 <do_unlink+0x2a4>
    4751:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    4758:	75 52                	jne    47ac <do_unlink+0x28e>
    475a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4761:	a1 10 90 00 00       	mov    0x9010,%eax
    4766:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4769:	c1 e2 09             	shl    $0x9,%edx
    476c:	83 ec 0c             	sub    $0xc,%esp
    476f:	6a 0a                	push   $0xa
    4771:	68 00 02 00 00       	push   $0x200
    4776:	50                   	push   %eax
    4777:	ff 75 b8             	pushl  -0x48(%ebp)
    477a:	52                   	push   %edx
    477b:	e8 81 f2 ff ff       	call   3a01 <rd_wt>
    4780:	83 c4 20             	add    $0x20,%esp
    4783:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4789:	8b 45 ec             	mov    -0x14(%ebp),%eax
    478c:	8d 48 01             	lea    0x1(%eax),%ecx
    478f:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    4792:	c1 e0 09             	shl    $0x9,%eax
    4795:	83 ec 0c             	sub    $0xc,%esp
    4798:	6a 07                	push   $0x7
    479a:	68 00 02 00 00       	push   $0x200
    479f:	52                   	push   %edx
    47a0:	ff 75 b8             	pushl  -0x48(%ebp)
    47a3:	50                   	push   %eax
    47a4:	e8 58 f2 ff ff       	call   3a01 <rd_wt>
    47a9:	83 c4 20             	add    $0x20,%esp
    47ac:	8b 15 10 90 00 00    	mov    0x9010,%edx
    47b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    47b5:	01 d0                	add    %edx,%eax
    47b7:	c6 00 00             	movb   $0x0,(%eax)
    47ba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    47be:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
    47c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    47c5:	3b 45 a0             	cmp    -0x60(%ebp),%eax
    47c8:	7c 87                	jl     4751 <do_unlink+0x233>
    47ca:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    47d1:	75 52                	jne    4825 <do_unlink+0x307>
    47d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    47da:	a1 10 90 00 00       	mov    0x9010,%eax
    47df:	8b 55 ec             	mov    -0x14(%ebp),%edx
    47e2:	c1 e2 09             	shl    $0x9,%edx
    47e5:	83 ec 0c             	sub    $0xc,%esp
    47e8:	6a 0a                	push   $0xa
    47ea:	68 00 02 00 00       	push   $0x200
    47ef:	50                   	push   %eax
    47f0:	ff 75 b8             	pushl  -0x48(%ebp)
    47f3:	52                   	push   %edx
    47f4:	e8 08 f2 ff ff       	call   3a01 <rd_wt>
    47f9:	83 c4 20             	add    $0x20,%esp
    47fc:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4802:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4805:	8d 48 01             	lea    0x1(%eax),%ecx
    4808:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    480b:	c1 e0 09             	shl    $0x9,%eax
    480e:	83 ec 0c             	sub    $0xc,%esp
    4811:	6a 07                	push   $0x7
    4813:	68 00 02 00 00       	push   $0x200
    4818:	52                   	push   %edx
    4819:	ff 75 b8             	pushl  -0x48(%ebp)
    481c:	50                   	push   %eax
    481d:	e8 df f1 ff ff       	call   3a01 <rd_wt>
    4822:	83 c4 20             	add    $0x20,%esp
    4825:	8b 15 10 90 00 00    	mov    0x9010,%edx
    482b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    482e:	01 d0                	add    %edx,%eax
    4830:	0f b6 10             	movzbl (%eax),%edx
    4833:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4836:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    483b:	89 c1                	mov    %eax,%ecx
    483d:	d3 e3                	shl    %cl,%ebx
    483f:	89 d8                	mov    %ebx,%eax
    4841:	89 c3                	mov    %eax,%ebx
    4843:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    4849:	8b 45 f0             	mov    -0x10(%ebp),%eax
    484c:	01 c8                	add    %ecx,%eax
    484e:	21 da                	and    %ebx,%edx
    4850:	88 10                	mov    %dl,(%eax)
    4852:	a1 10 90 00 00       	mov    0x9010,%eax
    4857:	8b 55 ec             	mov    -0x14(%ebp),%edx
    485a:	c1 e2 09             	shl    $0x9,%edx
    485d:	83 ec 0c             	sub    $0xc,%esp
    4860:	6a 0a                	push   $0xa
    4862:	68 00 02 00 00       	push   $0x200
    4867:	50                   	push   %eax
    4868:	ff 75 b8             	pushl  -0x48(%ebp)
    486b:	52                   	push   %edx
    486c:	e8 90 f1 ff ff       	call   3a01 <rd_wt>
    4871:	83 c4 20             	add    $0x20,%esp
    4874:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4877:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    487e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4881:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    4888:	8b 45 cc             	mov    -0x34(%ebp),%eax
    488b:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    4892:	83 ec 0c             	sub    $0xc,%esp
    4895:	ff 75 cc             	pushl  -0x34(%ebp)
    4898:	e8 38 04 00 00       	call   4cd5 <sync_inode>
    489d:	83 c4 10             	add    $0x10,%esp
    48a0:	83 ec 0c             	sub    $0xc,%esp
    48a3:	ff 75 cc             	pushl  -0x34(%ebp)
    48a6:	e8 03 05 00 00       	call   4dae <put_inode>
    48ab:	83 c4 10             	add    $0x10,%esp
    48ae:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    48b1:	8b 00                	mov    (%eax),%eax
    48b3:	89 45 9c             	mov    %eax,-0x64(%ebp)
    48b6:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    48bb:	89 45 98             	mov    %eax,-0x68(%ebp)
    48be:	8b 45 98             	mov    -0x68(%ebp),%eax
    48c1:	8b 40 04             	mov    0x4(%eax),%eax
    48c4:	89 45 94             	mov    %eax,-0x6c(%ebp)
    48c7:	8b 45 98             	mov    -0x68(%ebp),%eax
    48ca:	8b 40 0c             	mov    0xc(%eax),%eax
    48cd:	89 45 90             	mov    %eax,-0x70(%ebp)
    48d0:	8b 45 94             	mov    -0x6c(%ebp),%eax
    48d3:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    48d8:	f7 e2                	mul    %edx
    48da:	89 d0                	mov    %edx,%eax
    48dc:	c1 e8 04             	shr    $0x4,%eax
    48df:	89 45 8c             	mov    %eax,-0x74(%ebp)
    48e2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    48e9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    48f0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    48f7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    48fe:	e9 a8 00 00 00       	jmp    49ab <do_unlink+0x48d>
    4903:	a1 10 90 00 00       	mov    0x9010,%eax
    4908:	8b 55 d8             	mov    -0x28(%ebp),%edx
    490b:	89 d1                	mov    %edx,%ecx
    490d:	c1 e1 09             	shl    $0x9,%ecx
    4910:	8b 55 9c             	mov    -0x64(%ebp),%edx
    4913:	01 ca                	add    %ecx,%edx
    4915:	83 ec 0c             	sub    $0xc,%esp
    4918:	6a 07                	push   $0x7
    491a:	68 00 02 00 00       	push   $0x200
    491f:	50                   	push   %eax
    4920:	ff 75 b8             	pushl  -0x48(%ebp)
    4923:	52                   	push   %edx
    4924:	e8 d8 f0 ff ff       	call   3a01 <rd_wt>
    4929:	83 c4 20             	add    $0x20,%esp
    492c:	a1 10 90 00 00       	mov    0x9010,%eax
    4931:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4934:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    493b:	eb 51                	jmp    498e <do_unlink+0x470>
    493d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4941:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4944:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    4947:	7f 4f                	jg     4998 <do_unlink+0x47a>
    4949:	8b 45 e0             	mov    -0x20(%ebp),%eax
    494c:	83 c0 14             	add    $0x14,%eax
    494f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4952:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4955:	83 c0 04             	add    $0x4,%eax
    4958:	83 ec 08             	sub    $0x8,%esp
    495b:	ff 75 08             	pushl  0x8(%ebp)
    495e:	50                   	push   %eax
    495f:	e8 e0 f4 ff ff       	call   3e44 <strcmp>
    4964:	83 c4 10             	add    $0x10,%esp
    4967:	85 c0                	test   %eax,%eax
    4969:	75 1b                	jne    4986 <do_unlink+0x468>
    496b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    4972:	83 ec 04             	sub    $0x4,%esp
    4975:	6a 14                	push   $0x14
    4977:	6a 00                	push   $0x0
    4979:	ff 75 d4             	pushl  -0x2c(%ebp)
    497c:	e8 9f 20 00 00       	call   6a20 <Memset>
    4981:	83 c4 10             	add    $0x10,%esp
    4984:	eb 13                	jmp    4999 <do_unlink+0x47b>
    4986:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    498a:	83 45 d4 14          	addl   $0x14,-0x2c(%ebp)
    498e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4991:	3b 45 90             	cmp    -0x70(%ebp),%eax
    4994:	7c a7                	jl     493d <do_unlink+0x41f>
    4996:	eb 01                	jmp    4999 <do_unlink+0x47b>
    4998:	90                   	nop
    4999:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    499c:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    499f:	7f 16                	jg     49b7 <do_unlink+0x499>
    49a1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    49a5:	75 10                	jne    49b7 <do_unlink+0x499>
    49a7:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    49ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
    49ae:	3b 45 90             	cmp    -0x70(%ebp),%eax
    49b1:	0f 8c 4c ff ff ff    	jl     4903 <do_unlink+0x3e5>
    49b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    49ba:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    49bd:	75 17                	jne    49d6 <do_unlink+0x4b8>
    49bf:	8b 45 98             	mov    -0x68(%ebp),%eax
    49c2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    49c5:	89 50 04             	mov    %edx,0x4(%eax)
    49c8:	83 ec 0c             	sub    $0xc,%esp
    49cb:	ff 75 98             	pushl  -0x68(%ebp)
    49ce:	e8 02 03 00 00       	call   4cd5 <sync_inode>
    49d3:	83 c4 10             	add    $0x10,%esp
    49d6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    49da:	74 29                	je     4a05 <do_unlink+0x4e7>
    49dc:	a1 10 90 00 00       	mov    0x9010,%eax
    49e1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    49e4:	89 d1                	mov    %edx,%ecx
    49e6:	c1 e1 09             	shl    $0x9,%ecx
    49e9:	8b 55 9c             	mov    -0x64(%ebp),%edx
    49ec:	01 ca                	add    %ecx,%edx
    49ee:	83 ec 0c             	sub    $0xc,%esp
    49f1:	6a 0a                	push   $0xa
    49f3:	68 00 02 00 00       	push   $0x200
    49f8:	50                   	push   %eax
    49f9:	ff 75 b8             	pushl  -0x48(%ebp)
    49fc:	52                   	push   %edx
    49fd:	e8 ff ef ff ff       	call   3a01 <rd_wt>
    4a02:	83 c4 20             	add    $0x20,%esp
    4a05:	90                   	nop
    4a06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4a09:	c9                   	leave  
    4a0a:	c3                   	ret    

00004a0b <do_rdwt>:
    4a0b:	55                   	push   %ebp
    4a0c:	89 e5                	mov    %esp,%ebp
    4a0e:	83 ec 78             	sub    $0x78,%esp
    4a11:	8b 45 08             	mov    0x8(%ebp),%eax
    4a14:	8b 40 04             	mov    0x4(%eax),%eax
    4a17:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4a1a:	8b 45 08             	mov    0x8(%ebp),%eax
    4a1d:	8b 40 1c             	mov    0x1c(%eax),%eax
    4a20:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4a23:	8b 45 08             	mov    0x8(%ebp),%eax
    4a26:	8b 40 5c             	mov    0x5c(%eax),%eax
    4a29:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4a2c:	8b 45 08             	mov    0x8(%ebp),%eax
    4a2f:	8b 00                	mov    (%eax),%eax
    4a31:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4a34:	8b 45 08             	mov    0x8(%ebp),%eax
    4a37:	8b 40 10             	mov    0x10(%eax),%eax
    4a3a:	89 45 cc             	mov    %eax,-0x34(%ebp)
    4a3d:	8b 45 08             	mov    0x8(%ebp),%eax
    4a40:	8b 40 40             	mov    0x40(%eax),%eax
    4a43:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4a46:	8b 45 08             	mov    0x8(%ebp),%eax
    4a49:	8b 40 60             	mov    0x60(%eax),%eax
    4a4c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4a4f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4a52:	6b d0 66             	imul   $0x66,%eax,%edx
    4a55:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4a58:	01 d0                	add    %edx,%eax
    4a5a:	83 c0 1c             	add    $0x1c,%eax
    4a5d:	8b 04 85 4c 4f 01 00 	mov    0x14f4c(,%eax,4),%eax
    4a64:	8b 40 08             	mov    0x8(%eax),%eax
    4a67:	89 45 c0             	mov    %eax,-0x40(%ebp)
    4a6a:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4a6d:	8b 40 04             	mov    0x4(%eax),%eax
    4a70:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4a73:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4a76:	8b 00                	mov    (%eax),%eax
    4a78:	85 c0                	test   %eax,%eax
    4a7a:	75 5b                	jne    4ad7 <do_rdwt+0xcc>
    4a7c:	8b 45 08             	mov    0x8(%ebp),%eax
    4a7f:	8b 40 04             	mov    0x4(%eax),%eax
    4a82:	83 f8 07             	cmp    $0x7,%eax
    4a85:	75 09                	jne    4a90 <do_rdwt+0x85>
    4a87:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
    4a8e:	eb 12                	jmp    4aa2 <do_rdwt+0x97>
    4a90:	8b 45 08             	mov    0x8(%ebp),%eax
    4a93:	8b 40 04             	mov    0x4(%eax),%eax
    4a96:	83 f8 0a             	cmp    $0xa,%eax
    4a99:	75 07                	jne    4aa2 <do_rdwt+0x97>
    4a9b:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
    4aa2:	8b 45 08             	mov    0x8(%ebp),%eax
    4aa5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4aa8:	89 50 04             	mov    %edx,0x4(%eax)
    4aab:	8b 45 08             	mov    0x8(%ebp),%eax
    4aae:	8b 00                	mov    (%eax),%eax
    4ab0:	89 c2                	mov    %eax,%edx
    4ab2:	8b 45 08             	mov    0x8(%ebp),%eax
    4ab5:	89 50 58             	mov    %edx,0x58(%eax)
    4ab8:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
    4abf:	83 ec 04             	sub    $0x4,%esp
    4ac2:	ff 75 b8             	pushl  -0x48(%ebp)
    4ac5:	ff 75 08             	pushl  0x8(%ebp)
    4ac8:	6a 03                	push   $0x3
    4aca:	e8 97 df ff ff       	call   2a66 <send_rec>
    4acf:	83 c4 10             	add    $0x10,%esp
    4ad2:	e9 fc 01 00 00       	jmp    4cd3 <do_rdwt+0x2c8>
    4ad7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    4adb:	75 14                	jne    4af1 <do_rdwt+0xe6>
    4add:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4ae0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4ae3:	01 d0                	add    %edx,%eax
    4ae5:	39 45 bc             	cmp    %eax,-0x44(%ebp)
    4ae8:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
    4aec:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4aef:	eb 19                	jmp    4b0a <do_rdwt+0xff>
    4af1:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4af4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4af7:	01 c2                	add    %eax,%edx
    4af9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4afc:	8b 40 0c             	mov    0xc(%eax),%eax
    4aff:	c1 e0 09             	shl    $0x9,%eax
    4b02:	39 c2                	cmp    %eax,%edx
    4b04:	0f 4e c2             	cmovle %edx,%eax
    4b07:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4b0a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4b0d:	99                   	cltd   
    4b0e:	c1 ea 17             	shr    $0x17,%edx
    4b11:	01 d0                	add    %edx,%eax
    4b13:	25 ff 01 00 00       	and    $0x1ff,%eax
    4b18:	29 d0                	sub    %edx,%eax
    4b1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4b1d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4b20:	8b 50 08             	mov    0x8(%eax),%edx
    4b23:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4b26:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    4b2c:	85 c0                	test   %eax,%eax
    4b2e:	0f 48 c1             	cmovs  %ecx,%eax
    4b31:	c1 f8 09             	sar    $0x9,%eax
    4b34:	01 d0                	add    %edx,%eax
    4b36:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    4b39:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4b3c:	8b 50 08             	mov    0x8(%eax),%edx
    4b3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b42:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    4b48:	85 c0                	test   %eax,%eax
    4b4a:	0f 48 c1             	cmovs  %ecx,%eax
    4b4d:	c1 f8 09             	sar    $0x9,%eax
    4b50:	01 d0                	add    %edx,%eax
    4b52:	89 45 b0             	mov    %eax,-0x50(%ebp)
    4b55:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4b58:	2b 45 b4             	sub    -0x4c(%ebp),%eax
    4b5b:	ba 00 00 10 00       	mov    $0x100000,%edx
    4b60:	39 d0                	cmp    %edx,%eax
    4b62:	7d 0b                	jge    4b6f <do_rdwt+0x164>
    4b64:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4b67:	2b 45 b4             	sub    -0x4c(%ebp),%eax
    4b6a:	83 c0 01             	add    $0x1,%eax
    4b6d:	eb 05                	jmp    4b74 <do_rdwt+0x169>
    4b6f:	b8 00 00 10 00       	mov    $0x100000,%eax
    4b74:	89 45 ac             	mov    %eax,-0x54(%ebp)
    4b77:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4b7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4b7d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4b84:	8b 45 08             	mov    0x8(%ebp),%eax
    4b87:	8b 00                	mov    (%eax),%eax
    4b89:	83 ec 0c             	sub    $0xc,%esp
    4b8c:	50                   	push   %eax
    4b8d:	e8 14 04 00 00       	call   4fa6 <pid2proc>
    4b92:	83 c4 10             	add    $0x10,%esp
    4b95:	89 45 a8             	mov    %eax,-0x58(%ebp)
    4b98:	8b 45 a8             	mov    -0x58(%ebp),%eax
    4b9b:	8b 40 0c             	mov    0xc(%eax),%eax
    4b9e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    4ba1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4ba4:	83 ec 08             	sub    $0x8,%esp
    4ba7:	ff 75 a8             	pushl  -0x58(%ebp)
    4baa:	50                   	push   %eax
    4bab:	e8 df 04 00 00       	call   508f <Seg2PhyAddrLDT>
    4bb0:	83 c4 10             	add    $0x10,%esp
    4bb3:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4bb6:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4bb9:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4bbc:	01 d0                	add    %edx,%eax
    4bbe:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4bc1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4bc4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4bc7:	e9 c7 00 00 00       	jmp    4c93 <do_rdwt+0x288>
    4bcc:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4bcf:	c1 e0 09             	shl    $0x9,%eax
    4bd2:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4bd5:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    4bd8:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
    4bdc:	89 45 98             	mov    %eax,-0x68(%ebp)
    4bdf:	c7 45 94 20 00 00 00 	movl   $0x20,-0x6c(%ebp)
    4be6:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4be9:	c1 e0 09             	shl    $0x9,%eax
    4bec:	89 c2                	mov    %eax,%edx
    4bee:	a1 10 90 00 00       	mov    0x9010,%eax
    4bf3:	83 ec 0c             	sub    $0xc,%esp
    4bf6:	6a 07                	push   $0x7
    4bf8:	52                   	push   %edx
    4bf9:	50                   	push   %eax
    4bfa:	ff 75 94             	pushl  -0x6c(%ebp)
    4bfd:	ff 75 e0             	pushl  -0x20(%ebp)
    4c00:	e8 fc ed ff ff       	call   3a01 <rd_wt>
    4c05:	83 c4 20             	add    $0x20,%esp
    4c08:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    4c0c:	75 25                	jne    4c33 <do_rdwt+0x228>
    4c0e:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4c14:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4c17:	01 d0                	add    %edx,%eax
    4c19:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    4c1c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    4c1f:	01 ca                	add    %ecx,%edx
    4c21:	83 ec 04             	sub    $0x4,%esp
    4c24:	ff 75 98             	pushl  -0x68(%ebp)
    4c27:	50                   	push   %eax
    4c28:	52                   	push   %edx
    4c29:	e8 c4 1d 00 00       	call   69f2 <Memcpy>
    4c2e:	83 c4 10             	add    $0x10,%esp
    4c31:	eb 47                	jmp    4c7a <do_rdwt+0x26f>
    4c33:	8b 55 9c             	mov    -0x64(%ebp),%edx
    4c36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c39:	01 d0                	add    %edx,%eax
    4c3b:	89 c1                	mov    %eax,%ecx
    4c3d:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4c43:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4c46:	01 d0                	add    %edx,%eax
    4c48:	83 ec 04             	sub    $0x4,%esp
    4c4b:	ff 75 98             	pushl  -0x68(%ebp)
    4c4e:	51                   	push   %ecx
    4c4f:	50                   	push   %eax
    4c50:	e8 9d 1d 00 00       	call   69f2 <Memcpy>
    4c55:	83 c4 10             	add    $0x10,%esp
    4c58:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4c5b:	c1 e0 09             	shl    $0x9,%eax
    4c5e:	89 c2                	mov    %eax,%edx
    4c60:	a1 10 90 00 00       	mov    0x9010,%eax
    4c65:	83 ec 0c             	sub    $0xc,%esp
    4c68:	6a 0a                	push   $0xa
    4c6a:	52                   	push   %edx
    4c6b:	50                   	push   %eax
    4c6c:	ff 75 94             	pushl  -0x6c(%ebp)
    4c6f:	ff 75 e0             	pushl  -0x20(%ebp)
    4c72:	e8 8a ed ff ff       	call   3a01 <rd_wt>
    4c77:	83 c4 20             	add    $0x20,%esp
    4c7a:	8b 45 98             	mov    -0x68(%ebp),%eax
    4c7d:	29 45 e8             	sub    %eax,-0x18(%ebp)
    4c80:	8b 45 98             	mov    -0x68(%ebp),%eax
    4c83:	01 45 e4             	add    %eax,-0x1c(%ebp)
    4c86:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4c8d:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4c90:	01 45 e0             	add    %eax,-0x20(%ebp)
    4c93:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4c96:	3b 45 b0             	cmp    -0x50(%ebp),%eax
    4c99:	7f 0a                	jg     4ca5 <do_rdwt+0x29a>
    4c9b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4c9f:	0f 85 27 ff ff ff    	jne    4bcc <do_rdwt+0x1c1>
    4ca5:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4ca8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4cab:	01 c2                	add    %eax,%edx
    4cad:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4cb0:	8b 40 04             	mov    0x4(%eax),%eax
    4cb3:	39 c2                	cmp    %eax,%edx
    4cb5:	7e 1c                	jle    4cd3 <do_rdwt+0x2c8>
    4cb7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4cba:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4cbd:	01 c2                	add    %eax,%edx
    4cbf:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4cc2:	89 50 04             	mov    %edx,0x4(%eax)
    4cc5:	83 ec 0c             	sub    $0xc,%esp
    4cc8:	ff 75 c0             	pushl  -0x40(%ebp)
    4ccb:	e8 05 00 00 00       	call   4cd5 <sync_inode>
    4cd0:	83 c4 10             	add    $0x10,%esp
    4cd3:	c9                   	leave  
    4cd4:	c3                   	ret    

00004cd5 <sync_inode>:
    4cd5:	55                   	push   %ebp
    4cd6:	89 e5                	mov    %esp,%ebp
    4cd8:	53                   	push   %ebx
    4cd9:	83 ec 24             	sub    $0x24,%esp
    4cdc:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
    4ce3:	8b 45 08             	mov    0x8(%ebp),%eax
    4ce6:	8b 40 10             	mov    0x10(%eax),%eax
    4ce9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4cec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4cef:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4cf2:	b8 00 02 00 00       	mov    $0x200,%eax
    4cf7:	99                   	cltd   
    4cf8:	f7 7d f4             	idivl  -0xc(%ebp)
    4cfb:	89 c3                	mov    %eax,%ebx
    4cfd:	89 c8                	mov    %ecx,%eax
    4cff:	99                   	cltd   
    4d00:	f7 fb                	idiv   %ebx
    4d02:	89 55 ec             	mov    %edx,-0x14(%ebp)
    4d05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4d08:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4d0b:	b8 00 02 00 00       	mov    $0x200,%eax
    4d10:	99                   	cltd   
    4d11:	f7 7d f4             	idivl  -0xc(%ebp)
    4d14:	89 c3                	mov    %eax,%ebx
    4d16:	89 c8                	mov    %ecx,%eax
    4d18:	99                   	cltd   
    4d19:	f7 fb                	idiv   %ebx
    4d1b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4d1e:	8b 45 08             	mov    0x8(%ebp),%eax
    4d21:	8b 40 14             	mov    0x14(%eax),%eax
    4d24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4d27:	e8 33 01 00 00       	call   4e5f <get_super_block>
    4d2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4d2f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4d32:	8b 40 04             	mov    0x4(%eax),%eax
    4d35:	8d 50 02             	lea    0x2(%eax),%edx
    4d38:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4d3b:	8b 40 08             	mov    0x8(%eax),%eax
    4d3e:	01 c2                	add    %eax,%edx
    4d40:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4d43:	01 d0                	add    %edx,%eax
    4d45:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4d48:	a1 10 90 00 00       	mov    0x9010,%eax
    4d4d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    4d50:	c1 e2 09             	shl    $0x9,%edx
    4d53:	83 ec 0c             	sub    $0xc,%esp
    4d56:	6a 07                	push   $0x7
    4d58:	68 00 02 00 00       	push   $0x200
    4d5d:	50                   	push   %eax
    4d5e:	ff 75 e4             	pushl  -0x1c(%ebp)
    4d61:	52                   	push   %edx
    4d62:	e8 9a ec ff ff       	call   3a01 <rd_wt>
    4d67:	83 c4 20             	add    $0x20,%esp
    4d6a:	a1 10 90 00 00       	mov    0x9010,%eax
    4d6f:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4d72:	83 ec 04             	sub    $0x4,%esp
    4d75:	ff 75 f4             	pushl  -0xc(%ebp)
    4d78:	ff 75 08             	pushl  0x8(%ebp)
    4d7b:	ff 75 d8             	pushl  -0x28(%ebp)
    4d7e:	e8 6f 1c 00 00       	call   69f2 <Memcpy>
    4d83:	83 c4 10             	add    $0x10,%esp
    4d86:	a1 10 90 00 00       	mov    0x9010,%eax
    4d8b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    4d8e:	c1 e2 09             	shl    $0x9,%edx
    4d91:	83 ec 0c             	sub    $0xc,%esp
    4d94:	6a 0a                	push   $0xa
    4d96:	68 00 02 00 00       	push   $0x200
    4d9b:	50                   	push   %eax
    4d9c:	ff 75 e4             	pushl  -0x1c(%ebp)
    4d9f:	52                   	push   %edx
    4da0:	e8 5c ec ff ff       	call   3a01 <rd_wt>
    4da5:	83 c4 20             	add    $0x20,%esp
    4da8:	90                   	nop
    4da9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4dac:	c9                   	leave  
    4dad:	c3                   	ret    

00004dae <put_inode>:
    4dae:	55                   	push   %ebp
    4daf:	89 e5                	mov    %esp,%ebp
    4db1:	83 ec 08             	sub    $0x8,%esp
    4db4:	8b 45 08             	mov    0x8(%ebp),%eax
    4db7:	8b 40 18             	mov    0x18(%eax),%eax
    4dba:	85 c0                	test   %eax,%eax
    4dbc:	7f 1c                	jg     4dda <put_inode+0x2c>
    4dbe:	68 b5 03 00 00       	push   $0x3b5
    4dc3:	68 ce 68 00 00       	push   $0x68ce
    4dc8:	68 ce 68 00 00       	push   $0x68ce
    4dcd:	68 9c 69 00 00       	push   $0x699c
    4dd2:	e8 8a d4 ff ff       	call   2261 <assertion_failure>
    4dd7:	83 c4 10             	add    $0x10,%esp
    4dda:	8b 45 08             	mov    0x8(%ebp),%eax
    4ddd:	8b 40 18             	mov    0x18(%eax),%eax
    4de0:	8d 50 ff             	lea    -0x1(%eax),%edx
    4de3:	8b 45 08             	mov    0x8(%ebp),%eax
    4de6:	89 50 18             	mov    %edx,0x18(%eax)
    4de9:	90                   	nop
    4dea:	c9                   	leave  
    4deb:	c3                   	ret    

00004dec <do_close>:
    4dec:	55                   	push   %ebp
    4ded:	89 e5                	mov    %esp,%ebp
    4def:	83 ec 08             	sub    $0x8,%esp
    4df2:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4df7:	8b 55 08             	mov    0x8(%ebp),%edx
    4dfa:	83 c2 1c             	add    $0x1c,%edx
    4dfd:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4e01:	8b 40 08             	mov    0x8(%eax),%eax
    4e04:	83 ec 0c             	sub    $0xc,%esp
    4e07:	50                   	push   %eax
    4e08:	e8 a1 ff ff ff       	call   4dae <put_inode>
    4e0d:	83 c4 10             	add    $0x10,%esp
    4e10:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4e15:	8b 55 08             	mov    0x8(%ebp),%edx
    4e18:	83 c2 1c             	add    $0x1c,%edx
    4e1b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4e1f:	8b 50 0c             	mov    0xc(%eax),%edx
    4e22:	83 ea 01             	sub    $0x1,%edx
    4e25:	89 50 0c             	mov    %edx,0xc(%eax)
    4e28:	8b 40 0c             	mov    0xc(%eax),%eax
    4e2b:	85 c0                	test   %eax,%eax
    4e2d:	75 16                	jne    4e45 <do_close+0x59>
    4e2f:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4e34:	8b 55 08             	mov    0x8(%ebp),%edx
    4e37:	83 c2 1c             	add    $0x1c,%edx
    4e3a:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4e3e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    4e45:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4e4a:	8b 55 08             	mov    0x8(%ebp),%edx
    4e4d:	83 c2 1c             	add    $0x1c,%edx
    4e50:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    4e57:	00 
    4e58:	b8 00 00 00 00       	mov    $0x0,%eax
    4e5d:	c9                   	leave  
    4e5e:	c3                   	ret    

00004e5f <get_super_block>:
    4e5f:	55                   	push   %ebp
    4e60:	89 e5                	mov    %esp,%ebp
    4e62:	83 ec 18             	sub    $0x18,%esp
    4e65:	a1 10 90 00 00       	mov    0x9010,%eax
    4e6a:	83 ec 0c             	sub    $0xc,%esp
    4e6d:	6a 07                	push   $0x7
    4e6f:	68 00 02 00 00       	push   $0x200
    4e74:	50                   	push   %eax
    4e75:	6a 20                	push   $0x20
    4e77:	68 00 02 00 00       	push   $0x200
    4e7c:	e8 80 eb ff ff       	call   3a01 <rd_wt>
    4e81:	83 c4 20             	add    $0x20,%esp
    4e84:	a1 10 90 00 00       	mov    0x9010,%eax
    4e89:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e8f:	c9                   	leave  
    4e90:	c3                   	ret    

00004e91 <schedule_process>:
    4e91:	55                   	push   %ebp
    4e92:	89 e5                	mov    %esp,%ebp
    4e94:	83 ec 10             	sub    $0x10,%esp
    4e97:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4e9e:	eb 7e                	jmp    4f1e <schedule_process+0x8d>
    4ea0:	c7 45 fc 40 4f 01 00 	movl   $0x14f40,-0x4(%ebp)
    4ea7:	eb 31                	jmp    4eda <schedule_process+0x49>
    4ea9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4eac:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    4eb3:	84 c0                	test   %al,%al
    4eb5:	75 1c                	jne    4ed3 <schedule_process+0x42>
    4eb7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4eba:	8b 40 5c             	mov    0x5c(%eax),%eax
    4ebd:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    4ec0:	73 11                	jae    4ed3 <schedule_process+0x42>
    4ec2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4ec5:	8b 40 5c             	mov    0x5c(%eax),%eax
    4ec8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4ecb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4ece:	a3 a0 a2 00 00       	mov    %eax,0xa2a0
    4ed3:	81 45 fc 98 01 00 00 	addl   $0x198,-0x4(%ebp)
    4eda:	b8 a0 55 01 00       	mov    $0x155a0,%eax
    4edf:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    4ee2:	72 c5                	jb     4ea9 <schedule_process+0x18>
    4ee4:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    4ee8:	75 34                	jne    4f1e <schedule_process+0x8d>
    4eea:	c7 45 fc 40 4f 01 00 	movl   $0x14f40,-0x4(%ebp)
    4ef1:	eb 21                	jmp    4f14 <schedule_process+0x83>
    4ef3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4ef6:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    4efd:	84 c0                	test   %al,%al
    4eff:	75 0c                	jne    4f0d <schedule_process+0x7c>
    4f01:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f04:	8b 50 60             	mov    0x60(%eax),%edx
    4f07:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f0a:	89 50 5c             	mov    %edx,0x5c(%eax)
    4f0d:	81 45 fc 98 01 00 00 	addl   $0x198,-0x4(%ebp)
    4f14:	b8 a0 55 01 00       	mov    $0x155a0,%eax
    4f19:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    4f1c:	72 d5                	jb     4ef3 <schedule_process+0x62>
    4f1e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    4f22:	0f 84 78 ff ff ff    	je     4ea0 <schedule_process+0xf>
    4f28:	90                   	nop
    4f29:	c9                   	leave  
    4f2a:	c3                   	ret    

00004f2b <clock_handler>:
    4f2b:	55                   	push   %ebp
    4f2c:	89 e5                	mov    %esp,%ebp
    4f2e:	83 ec 08             	sub    $0x8,%esp
    4f31:	a1 a0 d4 00 00       	mov    0xd4a0,%eax
    4f36:	83 c0 01             	add    $0x1,%eax
    4f39:	a3 a0 d4 00 00       	mov    %eax,0xd4a0
    4f3e:	a1 a0 d4 00 00       	mov    0xd4a0,%eax
    4f43:	3d cc ab ff 7f       	cmp    $0x7fffabcc,%eax
    4f48:	76 0a                	jbe    4f54 <clock_handler+0x29>
    4f4a:	c7 05 a0 d4 00 00 00 	movl   $0x0,0xd4a0
    4f51:	00 00 00 
    4f54:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4f59:	8b 40 5c             	mov    0x5c(%eax),%eax
    4f5c:	85 c0                	test   %eax,%eax
    4f5e:	74 0e                	je     4f6e <clock_handler+0x43>
    4f60:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4f65:	8b 50 5c             	mov    0x5c(%eax),%edx
    4f68:	83 ea 01             	sub    $0x1,%edx
    4f6b:	89 50 5c             	mov    %edx,0x5c(%eax)
    4f6e:	a1 74 cc 00 00       	mov    0xcc74,%eax
    4f73:	85 c0                	test   %eax,%eax
    4f75:	74 0d                	je     4f84 <clock_handler+0x59>
    4f77:	83 ec 0c             	sub    $0xc,%esp
    4f7a:	6a 00                	push   $0x0
    4f7c:	e8 8c dc ff ff       	call   2c0d <inform_int>
    4f81:	83 c4 10             	add    $0x10,%esp
    4f84:	a1 94 9e 00 00       	mov    0x9e94,%eax
    4f89:	85 c0                	test   %eax,%eax
    4f8b:	75 13                	jne    4fa0 <clock_handler+0x75>
    4f8d:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4f92:	8b 40 5c             	mov    0x5c(%eax),%eax
    4f95:	85 c0                	test   %eax,%eax
    4f97:	75 0a                	jne    4fa3 <clock_handler+0x78>
    4f99:	e8 f3 fe ff ff       	call   4e91 <schedule_process>
    4f9e:	eb 04                	jmp    4fa4 <clock_handler+0x79>
    4fa0:	90                   	nop
    4fa1:	eb 01                	jmp    4fa4 <clock_handler+0x79>
    4fa3:	90                   	nop
    4fa4:	c9                   	leave  
    4fa5:	c3                   	ret    

00004fa6 <pid2proc>:
    4fa6:	55                   	push   %ebp
    4fa7:	89 e5                	mov    %esp,%ebp
    4fa9:	83 ec 10             	sub    $0x10,%esp
    4fac:	8b 45 08             	mov    0x8(%ebp),%eax
    4faf:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    4fb5:	05 40 4f 01 00       	add    $0x14f40,%eax
    4fba:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4fbd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fc0:	c9                   	leave  
    4fc1:	c3                   	ret    

00004fc2 <proc2pid>:
    4fc2:	55                   	push   %ebp
    4fc3:	89 e5                	mov    %esp,%ebp
    4fc5:	83 ec 10             	sub    $0x10,%esp
    4fc8:	8b 45 08             	mov    0x8(%ebp),%eax
    4fcb:	2d 40 4f 01 00       	sub    $0x14f40,%eax
    4fd0:	c1 f8 03             	sar    $0x3,%eax
    4fd3:	69 c0 fb fa fa fa    	imul   $0xfafafafb,%eax,%eax
    4fd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4fdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fdf:	c9                   	leave  
    4fe0:	c3                   	ret    

00004fe1 <InitDescriptor>:
    4fe1:	55                   	push   %ebp
    4fe2:	89 e5                	mov    %esp,%ebp
    4fe4:	83 ec 04             	sub    $0x4,%esp
    4fe7:	8b 45 14             	mov    0x14(%ebp),%eax
    4fea:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
    4fee:	8b 45 10             	mov    0x10(%ebp),%eax
    4ff1:	89 c2                	mov    %eax,%edx
    4ff3:	8b 45 08             	mov    0x8(%ebp),%eax
    4ff6:	66 89 10             	mov    %dx,(%eax)
    4ff9:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ffc:	89 c2                	mov    %eax,%edx
    4ffe:	8b 45 08             	mov    0x8(%ebp),%eax
    5001:	66 89 50 02          	mov    %dx,0x2(%eax)
    5005:	8b 45 0c             	mov    0xc(%ebp),%eax
    5008:	c1 e8 10             	shr    $0x10,%eax
    500b:	89 c2                	mov    %eax,%edx
    500d:	8b 45 08             	mov    0x8(%ebp),%eax
    5010:	88 50 04             	mov    %dl,0x4(%eax)
    5013:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    5017:	89 c2                	mov    %eax,%edx
    5019:	8b 45 08             	mov    0x8(%ebp),%eax
    501c:	88 50 05             	mov    %dl,0x5(%eax)
    501f:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    5023:	66 c1 e8 08          	shr    $0x8,%ax
    5027:	c1 e0 04             	shl    $0x4,%eax
    502a:	89 c2                	mov    %eax,%edx
    502c:	8b 45 10             	mov    0x10(%ebp),%eax
    502f:	c1 e8 10             	shr    $0x10,%eax
    5032:	83 e0 0f             	and    $0xf,%eax
    5035:	09 c2                	or     %eax,%edx
    5037:	8b 45 08             	mov    0x8(%ebp),%eax
    503a:	88 50 06             	mov    %dl,0x6(%eax)
    503d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5040:	c1 e8 18             	shr    $0x18,%eax
    5043:	89 c2                	mov    %eax,%edx
    5045:	8b 45 08             	mov    0x8(%ebp),%eax
    5048:	88 50 07             	mov    %dl,0x7(%eax)
    504b:	90                   	nop
    504c:	c9                   	leave  
    504d:	c3                   	ret    

0000504e <Seg2PhyAddr>:
    504e:	55                   	push   %ebp
    504f:	89 e5                	mov    %esp,%ebp
    5051:	83 ec 10             	sub    $0x10,%esp
    5054:	8b 45 08             	mov    0x8(%ebp),%eax
    5057:	c1 e8 03             	shr    $0x3,%eax
    505a:	8b 14 c5 a4 9e 00 00 	mov    0x9ea4(,%eax,8),%edx
    5061:	8b 04 c5 a0 9e 00 00 	mov    0x9ea0(,%eax,8),%eax
    5068:	89 45 f4             	mov    %eax,-0xc(%ebp)
    506b:	89 55 f8             	mov    %edx,-0x8(%ebp)
    506e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    5072:	0f b7 c0             	movzwl %ax,%eax
    5075:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    5079:	0f b6 d2             	movzbl %dl,%edx
    507c:	c1 e2 10             	shl    $0x10,%edx
    507f:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    5085:	09 d0                	or     %edx,%eax
    5087:	89 45 fc             	mov    %eax,-0x4(%ebp)
    508a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    508d:	c9                   	leave  
    508e:	c3                   	ret    

0000508f <Seg2PhyAddrLDT>:
    508f:	55                   	push   %ebp
    5090:	89 e5                	mov    %esp,%ebp
    5092:	83 ec 10             	sub    $0x10,%esp
    5095:	8b 45 08             	mov    0x8(%ebp),%eax
    5098:	c1 e8 03             	shr    $0x3,%eax
    509b:	89 c2                	mov    %eax,%edx
    509d:	8b 45 0c             	mov    0xc(%ebp),%eax
    50a0:	83 c2 08             	add    $0x8,%edx
    50a3:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
    50a7:	8b 02                	mov    (%edx),%eax
    50a9:	8b 52 04             	mov    0x4(%edx),%edx
    50ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    50af:	89 55 f8             	mov    %edx,-0x8(%ebp)
    50b2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    50b6:	0f b7 c0             	movzwl %ax,%eax
    50b9:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    50bd:	0f b6 d2             	movzbl %dl,%edx
    50c0:	c1 e2 10             	shl    $0x10,%edx
    50c3:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    50c9:	09 d0                	or     %edx,%eax
    50cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
    50ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    50d1:	c9                   	leave  
    50d2:	c3                   	ret    

000050d3 <VirAddr2PhyAddr>:
    50d3:	55                   	push   %ebp
    50d4:	89 e5                	mov    %esp,%ebp
    50d6:	83 ec 10             	sub    $0x10,%esp
    50d9:	8b 55 0c             	mov    0xc(%ebp),%edx
    50dc:	8b 45 08             	mov    0x8(%ebp),%eax
    50df:	01 d0                	add    %edx,%eax
    50e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    50e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    50e7:	c9                   	leave  
    50e8:	c3                   	ret    

000050e9 <v2l>:
    50e9:	55                   	push   %ebp
    50ea:	89 e5                	mov    %esp,%ebp
    50ec:	83 ec 18             	sub    $0x18,%esp
    50ef:	83 ec 0c             	sub    $0xc,%esp
    50f2:	ff 75 08             	pushl  0x8(%ebp)
    50f5:	e8 ac fe ff ff       	call   4fa6 <pid2proc>
    50fa:	83 c4 10             	add    $0x10,%esp
    50fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5100:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5103:	8b 40 0c             	mov    0xc(%eax),%eax
    5106:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5109:	8b 45 f0             	mov    -0x10(%ebp),%eax
    510c:	83 ec 08             	sub    $0x8,%esp
    510f:	ff 75 f4             	pushl  -0xc(%ebp)
    5112:	50                   	push   %eax
    5113:	e8 77 ff ff ff       	call   508f <Seg2PhyAddrLDT>
    5118:	83 c4 10             	add    $0x10,%esp
    511b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    511e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5121:	8b 45 0c             	mov    0xc(%ebp),%eax
    5124:	01 d0                	add    %edx,%eax
    5126:	89 45 e8             	mov    %eax,-0x18(%ebp)
    5129:	8b 45 e8             	mov    -0x18(%ebp),%eax
    512c:	c9                   	leave  
    512d:	c3                   	ret    

0000512e <init_propt>:
    512e:	55                   	push   %ebp
    512f:	89 e5                	mov    %esp,%ebp
    5131:	53                   	push   %ebx
    5132:	83 ec 24             	sub    $0x24,%esp
    5135:	6a 0e                	push   $0xe
    5137:	6a 08                	push   $0x8
    5139:	68 5f 11 00 00       	push   $0x115f
    513e:	6a 20                	push   $0x20
    5140:	e8 53 01 00 00       	call   5298 <InitInterruptDesc>
    5145:	83 c4 10             	add    $0x10,%esp
    5148:	6a 0e                	push   $0xe
    514a:	6a 08                	push   $0x8
    514c:	68 a8 11 00 00       	push   $0x11a8
    5151:	6a 21                	push   $0x21
    5153:	e8 40 01 00 00       	call   5298 <InitInterruptDesc>
    5158:	83 c4 10             	add    $0x10,%esp
    515b:	6a 0e                	push   $0xe
    515d:	6a 08                	push   $0x8
    515f:	68 f1 11 00 00       	push   $0x11f1
    5164:	6a 2e                	push   $0x2e
    5166:	e8 2d 01 00 00       	call   5298 <InitInterruptDesc>
    516b:	83 c4 10             	add    $0x10,%esp
    516e:	83 ec 04             	sub    $0x4,%esp
    5171:	68 28 0b 00 00       	push   $0xb28
    5176:	6a 00                	push   $0x0
    5178:	68 40 4f 01 00       	push   $0x14f40
    517d:	e8 9e 18 00 00       	call   6a20 <Memset>
    5182:	83 c4 10             	add    $0x10,%esp
    5185:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
    518c:	83 ec 04             	sub    $0x4,%esp
    518f:	ff 75 f0             	pushl  -0x10(%ebp)
    5192:	6a 00                	push   $0x0
    5194:	68 00 cc 00 00       	push   $0xcc00
    5199:	e8 82 18 00 00       	call   6a20 <Memset>
    519e:	83 c4 10             	add    $0x10,%esp
    51a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51a4:	a3 68 cc 00 00       	mov    %eax,0xcc68
    51a9:	c7 05 08 cc 00 00 30 	movl   $0x30,0xcc08
    51b0:	00 00 00 
    51b3:	83 ec 0c             	sub    $0xc,%esp
    51b6:	6a 30                	push   $0x30
    51b8:	e8 91 fe ff ff       	call   504e <Seg2PhyAddr>
    51bd:	83 c4 10             	add    $0x10,%esp
    51c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    51c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51c6:	83 ec 08             	sub    $0x8,%esp
    51c9:	68 00 cc 00 00       	push   $0xcc00
    51ce:	50                   	push   %eax
    51cf:	e8 ff fe ff ff       	call   50d3 <VirAddr2PhyAddr>
    51d4:	83 c4 10             	add    $0x10,%esp
    51d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    51da:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
    51e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51e4:	0f b7 d0             	movzwl %ax,%edx
    51e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51ea:	83 e8 01             	sub    $0x1,%eax
    51ed:	89 c1                	mov    %eax,%ecx
    51ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    51f2:	52                   	push   %edx
    51f3:	51                   	push   %ecx
    51f4:	50                   	push   %eax
    51f5:	68 e0 9e 00 00       	push   $0x9ee0
    51fa:	e8 e2 fd ff ff       	call   4fe1 <InitDescriptor>
    51ff:	83 c4 10             	add    $0x10,%esp
    5202:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5209:	eb 65                	jmp    5270 <init_propt+0x142>
    520b:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
    5212:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
    5219:	8b 45 f4             	mov    -0xc(%ebp),%eax
    521c:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    5222:	83 c0 40             	add    $0x40,%eax
    5225:	05 40 4f 01 00       	add    $0x14f40,%eax
    522a:	8d 50 06             	lea    0x6(%eax),%edx
    522d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5230:	83 ec 08             	sub    $0x8,%esp
    5233:	52                   	push   %edx
    5234:	50                   	push   %eax
    5235:	e8 99 fe ff ff       	call   50d3 <VirAddr2PhyAddr>
    523a:	83 c4 10             	add    $0x10,%esp
    523d:	89 45 d8             	mov    %eax,-0x28(%ebp)
    5240:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5243:	0f b7 d0             	movzwl %ax,%edx
    5246:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5249:	83 e8 01             	sub    $0x1,%eax
    524c:	89 c3                	mov    %eax,%ebx
    524e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5251:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5254:	83 c1 09             	add    $0x9,%ecx
    5257:	c1 e1 03             	shl    $0x3,%ecx
    525a:	81 c1 a0 9e 00 00    	add    $0x9ea0,%ecx
    5260:	52                   	push   %edx
    5261:	53                   	push   %ebx
    5262:	50                   	push   %eax
    5263:	51                   	push   %ecx
    5264:	e8 78 fd ff ff       	call   4fe1 <InitDescriptor>
    5269:	83 c4 10             	add    $0x10,%esp
    526c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5270:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    5274:	7e 95                	jle    520b <init_propt+0xdd>
    5276:	68 f2 00 00 00       	push   $0xf2
    527b:	68 ff ff 00 00       	push   $0xffff
    5280:	68 00 80 0b 00       	push   $0xb8000
    5285:	68 d8 9e 00 00       	push   $0x9ed8
    528a:	e8 52 fd ff ff       	call   4fe1 <InitDescriptor>
    528f:	83 c4 10             	add    $0x10,%esp
    5292:	90                   	nop
    5293:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5296:	c9                   	leave  
    5297:	c3                   	ret    

00005298 <InitInterruptDesc>:
    5298:	55                   	push   %ebp
    5299:	89 e5                	mov    %esp,%ebp
    529b:	83 ec 10             	sub    $0x10,%esp
    529e:	8b 45 08             	mov    0x8(%ebp),%eax
    52a1:	c1 e0 03             	shl    $0x3,%eax
    52a4:	05 a0 cc 00 00       	add    $0xcca0,%eax
    52a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    52ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    52af:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    52b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    52b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    52b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    52bc:	89 c2                	mov    %eax,%edx
    52be:	8b 45 fc             	mov    -0x4(%ebp),%eax
    52c1:	66 89 10             	mov    %dx,(%eax)
    52c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    52c7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
    52cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    52d0:	c1 f8 10             	sar    $0x10,%eax
    52d3:	89 c2                	mov    %eax,%edx
    52d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    52d8:	66 89 50 06          	mov    %dx,0x6(%eax)
    52dc:	8b 45 10             	mov    0x10(%ebp),%eax
    52df:	c1 e0 04             	shl    $0x4,%eax
    52e2:	89 c2                	mov    %eax,%edx
    52e4:	8b 45 14             	mov    0x14(%ebp),%eax
    52e7:	09 d0                	or     %edx,%eax
    52e9:	89 c2                	mov    %eax,%edx
    52eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    52ee:	88 50 05             	mov    %dl,0x5(%eax)
    52f1:	90                   	nop
    52f2:	c9                   	leave  
    52f3:	c3                   	ret    

000052f4 <ReloadGDT>:
    52f4:	55                   	push   %ebp
    52f5:	89 e5                	mov    %esp,%ebp
    52f7:	83 ec 28             	sub    $0x28,%esp
    52fa:	b8 7c cc 00 00       	mov    $0xcc7c,%eax
    52ff:	0f b7 00             	movzwl (%eax),%eax
    5302:	98                   	cwtl   
    5303:	ba 7e cc 00 00       	mov    $0xcc7e,%edx
    5308:	8b 12                	mov    (%edx),%edx
    530a:	83 ec 04             	sub    $0x4,%esp
    530d:	50                   	push   %eax
    530e:	52                   	push   %edx
    530f:	68 a0 9e 00 00       	push   $0x9ea0
    5314:	e8 d9 16 00 00       	call   69f2 <Memcpy>
    5319:	83 c4 10             	add    $0x10,%esp
    531c:	c7 45 f0 7c cc 00 00 	movl   $0xcc7c,-0x10(%ebp)
    5323:	c7 45 ec 7e cc 00 00 	movl   $0xcc7e,-0x14(%ebp)
    532a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    532d:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
    5332:	ba a0 9e 00 00       	mov    $0x9ea0,%edx
    5337:	8b 45 ec             	mov    -0x14(%ebp),%eax
    533a:	89 10                	mov    %edx,(%eax)
    533c:	c7 45 e8 88 9e 00 00 	movl   $0x9e88,-0x18(%ebp)
    5343:	c7 45 e4 8a 9e 00 00 	movl   $0x9e8a,-0x1c(%ebp)
    534a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    534d:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
    5352:	ba a0 cc 00 00       	mov    $0xcca0,%edx
    5357:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    535a:	89 10                	mov    %edx,(%eax)
    535c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5363:	eb 04                	jmp    5369 <ReloadGDT+0x75>
    5365:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5369:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    5370:	7e f3                	jle    5365 <ReloadGDT+0x71>
    5372:	e8 00 c4 ff ff       	call   1777 <init_internal_interrupt>
    5377:	e8 b2 fd ff ff       	call   512e <init_propt>
    537c:	90                   	nop
    537d:	c9                   	leave  
    537e:	c3                   	ret    

0000537f <select_console>:
    537f:	55                   	push   %ebp
    5380:	89 e5                	mov    %esp,%ebp
    5382:	83 ec 18             	sub    $0x18,%esp
    5385:	8b 45 08             	mov    0x8(%ebp),%eax
    5388:	88 45 f4             	mov    %al,-0xc(%ebp)
    538b:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
    538f:	77 27                	ja     53b8 <select_console+0x39>
    5391:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
    5395:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    539b:	05 00 a6 00 00       	add    $0xa600,%eax
    53a0:	a3 80 9e 00 00       	mov    %eax,0x9e80
    53a5:	a1 80 9e 00 00       	mov    0x9e80,%eax
    53aa:	83 ec 0c             	sub    $0xc,%esp
    53ad:	50                   	push   %eax
    53ae:	e8 08 00 00 00       	call   53bb <flush>
    53b3:	83 c4 10             	add    $0x10,%esp
    53b6:	eb 01                	jmp    53b9 <select_console+0x3a>
    53b8:	90                   	nop
    53b9:	c9                   	leave  
    53ba:	c3                   	ret    

000053bb <flush>:
    53bb:	55                   	push   %ebp
    53bc:	89 e5                	mov    %esp,%ebp
    53be:	83 ec 08             	sub    $0x8,%esp
    53c1:	8b 45 08             	mov    0x8(%ebp),%eax
    53c4:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    53ca:	8b 40 0c             	mov    0xc(%eax),%eax
    53cd:	83 ec 0c             	sub    $0xc,%esp
    53d0:	50                   	push   %eax
    53d1:	e8 1e 00 00 00       	call   53f4 <set_cursor>
    53d6:	83 c4 10             	add    $0x10,%esp
    53d9:	8b 45 08             	mov    0x8(%ebp),%eax
    53dc:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    53e2:	8b 40 08             	mov    0x8(%eax),%eax
    53e5:	83 ec 0c             	sub    $0xc,%esp
    53e8:	50                   	push   %eax
    53e9:	e8 64 00 00 00       	call   5452 <set_console_start_video_addr>
    53ee:	83 c4 10             	add    $0x10,%esp
    53f1:	90                   	nop
    53f2:	c9                   	leave  
    53f3:	c3                   	ret    

000053f4 <set_cursor>:
    53f4:	55                   	push   %ebp
    53f5:	89 e5                	mov    %esp,%ebp
    53f7:	83 ec 08             	sub    $0x8,%esp
    53fa:	83 ec 08             	sub    $0x8,%esp
    53fd:	6a 0e                	push   $0xe
    53ff:	68 d4 03 00 00       	push   $0x3d4
    5404:	e8 cd be ff ff       	call   12d6 <out_byte>
    5409:	83 c4 10             	add    $0x10,%esp
    540c:	8b 45 08             	mov    0x8(%ebp),%eax
    540f:	c1 e8 08             	shr    $0x8,%eax
    5412:	0f b7 c0             	movzwl %ax,%eax
    5415:	83 ec 08             	sub    $0x8,%esp
    5418:	50                   	push   %eax
    5419:	68 d5 03 00 00       	push   $0x3d5
    541e:	e8 b3 be ff ff       	call   12d6 <out_byte>
    5423:	83 c4 10             	add    $0x10,%esp
    5426:	83 ec 08             	sub    $0x8,%esp
    5429:	6a 0f                	push   $0xf
    542b:	68 d4 03 00 00       	push   $0x3d4
    5430:	e8 a1 be ff ff       	call   12d6 <out_byte>
    5435:	83 c4 10             	add    $0x10,%esp
    5438:	8b 45 08             	mov    0x8(%ebp),%eax
    543b:	0f b7 c0             	movzwl %ax,%eax
    543e:	83 ec 08             	sub    $0x8,%esp
    5441:	50                   	push   %eax
    5442:	68 d5 03 00 00       	push   $0x3d5
    5447:	e8 8a be ff ff       	call   12d6 <out_byte>
    544c:	83 c4 10             	add    $0x10,%esp
    544f:	90                   	nop
    5450:	c9                   	leave  
    5451:	c3                   	ret    

00005452 <set_console_start_video_addr>:
    5452:	55                   	push   %ebp
    5453:	89 e5                	mov    %esp,%ebp
    5455:	83 ec 08             	sub    $0x8,%esp
    5458:	83 ec 08             	sub    $0x8,%esp
    545b:	6a 0c                	push   $0xc
    545d:	68 d4 03 00 00       	push   $0x3d4
    5462:	e8 6f be ff ff       	call   12d6 <out_byte>
    5467:	83 c4 10             	add    $0x10,%esp
    546a:	8b 45 08             	mov    0x8(%ebp),%eax
    546d:	c1 e8 08             	shr    $0x8,%eax
    5470:	0f b7 c0             	movzwl %ax,%eax
    5473:	83 ec 08             	sub    $0x8,%esp
    5476:	50                   	push   %eax
    5477:	68 d5 03 00 00       	push   $0x3d5
    547c:	e8 55 be ff ff       	call   12d6 <out_byte>
    5481:	83 c4 10             	add    $0x10,%esp
    5484:	83 ec 08             	sub    $0x8,%esp
    5487:	6a 0d                	push   $0xd
    5489:	68 d4 03 00 00       	push   $0x3d4
    548e:	e8 43 be ff ff       	call   12d6 <out_byte>
    5493:	83 c4 10             	add    $0x10,%esp
    5496:	8b 45 08             	mov    0x8(%ebp),%eax
    5499:	0f b7 c0             	movzwl %ax,%eax
    549c:	83 ec 08             	sub    $0x8,%esp
    549f:	50                   	push   %eax
    54a0:	68 d5 03 00 00       	push   $0x3d5
    54a5:	e8 2c be ff ff       	call   12d6 <out_byte>
    54aa:	83 c4 10             	add    $0x10,%esp
    54ad:	90                   	nop
    54ae:	c9                   	leave  
    54af:	c3                   	ret    

000054b0 <put_key>:
    54b0:	55                   	push   %ebp
    54b1:	89 e5                	mov    %esp,%ebp
    54b3:	83 ec 04             	sub    $0x4,%esp
    54b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    54b9:	88 45 fc             	mov    %al,-0x4(%ebp)
    54bc:	8b 45 08             	mov    0x8(%ebp),%eax
    54bf:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    54c5:	3d 1f 03 00 00       	cmp    $0x31f,%eax
    54ca:	77 4d                	ja     5519 <put_key+0x69>
    54cc:	8b 45 08             	mov    0x8(%ebp),%eax
    54cf:	8b 00                	mov    (%eax),%eax
    54d1:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
    54d5:	89 10                	mov    %edx,(%eax)
    54d7:	8b 45 08             	mov    0x8(%ebp),%eax
    54da:	8b 00                	mov    (%eax),%eax
    54dc:	8d 50 04             	lea    0x4(%eax),%edx
    54df:	8b 45 08             	mov    0x8(%ebp),%eax
    54e2:	89 10                	mov    %edx,(%eax)
    54e4:	8b 45 08             	mov    0x8(%ebp),%eax
    54e7:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    54ed:	8d 50 01             	lea    0x1(%eax),%edx
    54f0:	8b 45 08             	mov    0x8(%ebp),%eax
    54f3:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
    54f9:	8b 45 08             	mov    0x8(%ebp),%eax
    54fc:	8b 00                	mov    (%eax),%eax
    54fe:	8b 55 08             	mov    0x8(%ebp),%edx
    5501:	83 c2 08             	add    $0x8,%edx
    5504:	81 c2 80 0c 00 00    	add    $0xc80,%edx
    550a:	39 d0                	cmp    %edx,%eax
    550c:	75 0b                	jne    5519 <put_key+0x69>
    550e:	8b 45 08             	mov    0x8(%ebp),%eax
    5511:	8d 50 08             	lea    0x8(%eax),%edx
    5514:	8b 45 08             	mov    0x8(%ebp),%eax
    5517:	89 10                	mov    %edx,(%eax)
    5519:	90                   	nop
    551a:	c9                   	leave  
    551b:	c3                   	ret    

0000551c <scroll_up>:
    551c:	55                   	push   %ebp
    551d:	89 e5                	mov    %esp,%ebp
    551f:	83 ec 08             	sub    $0x8,%esp
    5522:	8b 45 08             	mov    0x8(%ebp),%eax
    5525:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    552b:	8b 50 08             	mov    0x8(%eax),%edx
    552e:	8b 45 08             	mov    0x8(%ebp),%eax
    5531:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5537:	8b 00                	mov    (%eax),%eax
    5539:	39 c2                	cmp    %eax,%edx
    553b:	76 1d                	jbe    555a <scroll_up+0x3e>
    553d:	8b 45 08             	mov    0x8(%ebp),%eax
    5540:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5546:	8b 40 08             	mov    0x8(%eax),%eax
    5549:	2d d0 07 00 00       	sub    $0x7d0,%eax
    554e:	83 ec 0c             	sub    $0xc,%esp
    5551:	50                   	push   %eax
    5552:	e8 fb fe ff ff       	call   5452 <set_console_start_video_addr>
    5557:	83 c4 10             	add    $0x10,%esp
    555a:	90                   	nop
    555b:	c9                   	leave  
    555c:	c3                   	ret    

0000555d <scroll_down>:
    555d:	55                   	push   %ebp
    555e:	89 e5                	mov    %esp,%ebp
    5560:	83 ec 08             	sub    $0x8,%esp
    5563:	8b 45 08             	mov    0x8(%ebp),%eax
    5566:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    556c:	8b 40 08             	mov    0x8(%eax),%eax
    556f:	8d 88 a0 0f 00 00    	lea    0xfa0(%eax),%ecx
    5575:	8b 45 08             	mov    0x8(%ebp),%eax
    5578:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    557e:	8b 10                	mov    (%eax),%edx
    5580:	8b 45 08             	mov    0x8(%ebp),%eax
    5583:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5589:	8b 40 04             	mov    0x4(%eax),%eax
    558c:	01 d0                	add    %edx,%eax
    558e:	39 c1                	cmp    %eax,%ecx
    5590:	73 3b                	jae    55cd <scroll_down+0x70>
    5592:	8b 45 08             	mov    0x8(%ebp),%eax
    5595:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    559b:	8b 40 08             	mov    0x8(%eax),%eax
    559e:	05 d0 07 00 00       	add    $0x7d0,%eax
    55a3:	83 ec 0c             	sub    $0xc,%esp
    55a6:	50                   	push   %eax
    55a7:	e8 a6 fe ff ff       	call   5452 <set_console_start_video_addr>
    55ac:	83 c4 10             	add    $0x10,%esp
    55af:	8b 45 08             	mov    0x8(%ebp),%eax
    55b2:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55b8:	8b 50 08             	mov    0x8(%eax),%edx
    55bb:	8b 45 08             	mov    0x8(%ebp),%eax
    55be:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55c4:	81 c2 d0 07 00 00    	add    $0x7d0,%edx
    55ca:	89 50 08             	mov    %edx,0x8(%eax)
    55cd:	90                   	nop
    55ce:	c9                   	leave  
    55cf:	c3                   	ret    

000055d0 <out_char>:
    55d0:	55                   	push   %ebp
    55d1:	89 e5                	mov    %esp,%ebp
    55d3:	83 ec 28             	sub    $0x28,%esp
    55d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    55d9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    55dc:	8b 45 08             	mov    0x8(%ebp),%eax
    55df:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55e5:	8b 40 0c             	mov    0xc(%eax),%eax
    55e8:	05 00 c0 05 00       	add    $0x5c000,%eax
    55ed:	01 c0                	add    %eax,%eax
    55ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
    55f2:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    55f6:	83 f8 08             	cmp    $0x8,%eax
    55f9:	0f 84 8d 00 00 00    	je     568c <out_char+0xbc>
    55ff:	83 f8 0a             	cmp    $0xa,%eax
    5602:	0f 85 c9 00 00 00    	jne    56d1 <out_char+0x101>
    5608:	8b 45 08             	mov    0x8(%ebp),%eax
    560b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5611:	8b 50 0c             	mov    0xc(%eax),%edx
    5614:	8b 45 08             	mov    0x8(%ebp),%eax
    5617:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    561d:	8b 08                	mov    (%eax),%ecx
    561f:	8b 45 08             	mov    0x8(%ebp),%eax
    5622:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5628:	8b 40 04             	mov    0x4(%eax),%eax
    562b:	01 c8                	add    %ecx,%eax
    562d:	83 e8 50             	sub    $0x50,%eax
    5630:	39 c2                	cmp    %eax,%edx
    5632:	0f 83 f4 00 00 00    	jae    572c <out_char+0x15c>
    5638:	8b 45 08             	mov    0x8(%ebp),%eax
    563b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5641:	8b 08                	mov    (%eax),%ecx
    5643:	8b 45 08             	mov    0x8(%ebp),%eax
    5646:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    564c:	8b 50 0c             	mov    0xc(%eax),%edx
    564f:	8b 45 08             	mov    0x8(%ebp),%eax
    5652:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5658:	8b 00                	mov    (%eax),%eax
    565a:	29 c2                	sub    %eax,%edx
    565c:	89 d0                	mov    %edx,%eax
    565e:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    5663:	f7 e2                	mul    %edx
    5665:	89 d0                	mov    %edx,%eax
    5667:	c1 e8 06             	shr    $0x6,%eax
    566a:	8d 50 01             	lea    0x1(%eax),%edx
    566d:	89 d0                	mov    %edx,%eax
    566f:	c1 e0 02             	shl    $0x2,%eax
    5672:	01 d0                	add    %edx,%eax
    5674:	c1 e0 04             	shl    $0x4,%eax
    5677:	89 c2                	mov    %eax,%edx
    5679:	8b 45 08             	mov    0x8(%ebp),%eax
    567c:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5682:	01 ca                	add    %ecx,%edx
    5684:	89 50 0c             	mov    %edx,0xc(%eax)
    5687:	e9 a0 00 00 00       	jmp    572c <out_char+0x15c>
    568c:	8b 45 08             	mov    0x8(%ebp),%eax
    568f:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5695:	8b 50 0c             	mov    0xc(%eax),%edx
    5698:	8b 45 08             	mov    0x8(%ebp),%eax
    569b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56a1:	8b 00                	mov    (%eax),%eax
    56a3:	39 c2                	cmp    %eax,%edx
    56a5:	0f 86 84 00 00 00    	jbe    572f <out_char+0x15f>
    56ab:	8b 45 08             	mov    0x8(%ebp),%eax
    56ae:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56b4:	8b 50 0c             	mov    0xc(%eax),%edx
    56b7:	83 ea 01             	sub    $0x1,%edx
    56ba:	89 50 0c             	mov    %edx,0xc(%eax)
    56bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56c0:	83 e8 02             	sub    $0x2,%eax
    56c3:	c6 00 20             	movb   $0x20,(%eax)
    56c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56c9:	83 e8 01             	sub    $0x1,%eax
    56cc:	c6 00 00             	movb   $0x0,(%eax)
    56cf:	eb 5e                	jmp    572f <out_char+0x15f>
    56d1:	8b 45 08             	mov    0x8(%ebp),%eax
    56d4:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56da:	8b 40 0c             	mov    0xc(%eax),%eax
    56dd:	8d 48 01             	lea    0x1(%eax),%ecx
    56e0:	8b 45 08             	mov    0x8(%ebp),%eax
    56e3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56e9:	8b 10                	mov    (%eax),%edx
    56eb:	8b 45 08             	mov    0x8(%ebp),%eax
    56ee:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56f4:	8b 40 04             	mov    0x4(%eax),%eax
    56f7:	01 d0                	add    %edx,%eax
    56f9:	39 c1                	cmp    %eax,%ecx
    56fb:	73 35                	jae    5732 <out_char+0x162>
    56fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5700:	8d 50 01             	lea    0x1(%eax),%edx
    5703:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5706:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
    570a:	88 10                	mov    %dl,(%eax)
    570c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    570f:	8d 50 01             	lea    0x1(%eax),%edx
    5712:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5715:	c6 00 0a             	movb   $0xa,(%eax)
    5718:	8b 45 08             	mov    0x8(%ebp),%eax
    571b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5721:	8b 50 0c             	mov    0xc(%eax),%edx
    5724:	83 c2 01             	add    $0x1,%edx
    5727:	89 50 0c             	mov    %edx,0xc(%eax)
    572a:	eb 06                	jmp    5732 <out_char+0x162>
    572c:	90                   	nop
    572d:	eb 14                	jmp    5743 <out_char+0x173>
    572f:	90                   	nop
    5730:	eb 11                	jmp    5743 <out_char+0x173>
    5732:	90                   	nop
    5733:	eb 0e                	jmp    5743 <out_char+0x173>
    5735:	83 ec 0c             	sub    $0xc,%esp
    5738:	ff 75 08             	pushl  0x8(%ebp)
    573b:	e8 1d fe ff ff       	call   555d <scroll_down>
    5740:	83 c4 10             	add    $0x10,%esp
    5743:	8b 45 08             	mov    0x8(%ebp),%eax
    5746:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    574c:	8b 50 0c             	mov    0xc(%eax),%edx
    574f:	8b 45 08             	mov    0x8(%ebp),%eax
    5752:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5758:	8b 40 08             	mov    0x8(%eax),%eax
    575b:	29 c2                	sub    %eax,%edx
    575d:	89 d0                	mov    %edx,%eax
    575f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    5764:	77 cf                	ja     5735 <out_char+0x165>
    5766:	83 ec 0c             	sub    $0xc,%esp
    5769:	ff 75 08             	pushl  0x8(%ebp)
    576c:	e8 4a fc ff ff       	call   53bb <flush>
    5771:	83 c4 10             	add    $0x10,%esp
    5774:	90                   	nop
    5775:	c9                   	leave  
    5776:	c3                   	ret    

00005777 <tty_dev_read>:
    5777:	55                   	push   %ebp
    5778:	89 e5                	mov    %esp,%ebp
    577a:	83 ec 08             	sub    $0x8,%esp
    577d:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5782:	39 45 08             	cmp    %eax,0x8(%ebp)
    5785:	75 17                	jne    579e <tty_dev_read+0x27>
    5787:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    578c:	85 c0                	test   %eax,%eax
    578e:	7e 0e                	jle    579e <tty_dev_read+0x27>
    5790:	83 ec 0c             	sub    $0xc,%esp
    5793:	ff 75 08             	pushl  0x8(%ebp)
    5796:	e8 5c 06 00 00       	call   5df7 <keyboard_read>
    579b:	83 c4 10             	add    $0x10,%esp
    579e:	90                   	nop
    579f:	c9                   	leave  
    57a0:	c3                   	ret    

000057a1 <tty_dev_write>:
    57a1:	55                   	push   %ebp
    57a2:	89 e5                	mov    %esp,%ebp
    57a4:	83 ec 78             	sub    $0x78,%esp
    57a7:	8b 45 08             	mov    0x8(%ebp),%eax
    57aa:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    57b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    57b3:	e9 ae 01 00 00       	jmp    5966 <tty_dev_write+0x1c5>
    57b8:	8b 45 08             	mov    0x8(%ebp),%eax
    57bb:	8b 40 04             	mov    0x4(%eax),%eax
    57be:	8b 00                	mov    (%eax),%eax
    57c0:	88 45 f3             	mov    %al,-0xd(%ebp)
    57c3:	8b 45 08             	mov    0x8(%ebp),%eax
    57c6:	8b 40 04             	mov    0x4(%eax),%eax
    57c9:	8d 50 04             	lea    0x4(%eax),%edx
    57cc:	8b 45 08             	mov    0x8(%ebp),%eax
    57cf:	89 50 04             	mov    %edx,0x4(%eax)
    57d2:	8b 45 08             	mov    0x8(%ebp),%eax
    57d5:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    57db:	8d 50 ff             	lea    -0x1(%eax),%edx
    57de:	8b 45 08             	mov    0x8(%ebp),%eax
    57e1:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
    57e7:	8b 45 08             	mov    0x8(%ebp),%eax
    57ea:	8b 40 04             	mov    0x4(%eax),%eax
    57ed:	8b 55 08             	mov    0x8(%ebp),%edx
    57f0:	83 c2 08             	add    $0x8,%edx
    57f3:	81 c2 80 0c 00 00    	add    $0xc80,%edx
    57f9:	39 d0                	cmp    %edx,%eax
    57fb:	75 0c                	jne    5809 <tty_dev_write+0x68>
    57fd:	8b 45 08             	mov    0x8(%ebp),%eax
    5800:	8d 50 08             	lea    0x8(%eax),%edx
    5803:	8b 45 08             	mov    0x8(%ebp),%eax
    5806:	89 50 04             	mov    %edx,0x4(%eax)
    5809:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    580d:	83 ec 08             	sub    $0x8,%esp
    5810:	50                   	push   %eax
    5811:	ff 75 08             	pushl  0x8(%ebp)
    5814:	e8 b7 fd ff ff       	call   55d0 <out_char>
    5819:	83 c4 10             	add    $0x10,%esp
    581c:	8b 45 08             	mov    0x8(%ebp),%eax
    581f:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    5825:	85 c0                	test   %eax,%eax
    5827:	0f 84 39 01 00 00    	je     5966 <tty_dev_write+0x1c5>
    582d:	80 7d f3 20          	cmpb   $0x20,-0xd(%ebp)
    5831:	76 71                	jbe    58a4 <tty_dev_write+0x103>
    5833:	80 7d f3 7e          	cmpb   $0x7e,-0xd(%ebp)
    5837:	77 6b                	ja     58a4 <tty_dev_write+0x103>
    5839:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    583d:	89 c1                	mov    %eax,%ecx
    583f:	8b 45 08             	mov    0x8(%ebp),%eax
    5842:	8b 90 94 0c 00 00    	mov    0xc94(%eax),%edx
    5848:	8b 45 08             	mov    0x8(%ebp),%eax
    584b:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5851:	01 d0                	add    %edx,%eax
    5853:	83 ec 04             	sub    $0x4,%esp
    5856:	6a 01                	push   $0x1
    5858:	51                   	push   %ecx
    5859:	50                   	push   %eax
    585a:	e8 93 11 00 00       	call   69f2 <Memcpy>
    585f:	83 c4 10             	add    $0x10,%esp
    5862:	8b 45 08             	mov    0x8(%ebp),%eax
    5865:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    586b:	8d 50 ff             	lea    -0x1(%eax),%edx
    586e:	8b 45 08             	mov    0x8(%ebp),%eax
    5871:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    5877:	8b 45 08             	mov    0x8(%ebp),%eax
    587a:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5880:	8d 50 01             	lea    0x1(%eax),%edx
    5883:	8b 45 08             	mov    0x8(%ebp),%eax
    5886:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    588c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    5890:	83 ec 08             	sub    $0x8,%esp
    5893:	50                   	push   %eax
    5894:	ff 75 08             	pushl  0x8(%ebp)
    5897:	e8 34 fd ff ff       	call   55d0 <out_char>
    589c:	83 c4 10             	add    $0x10,%esp
    589f:	e9 c2 00 00 00       	jmp    5966 <tty_dev_write+0x1c5>
    58a4:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
    58a8:	75 3f                	jne    58e9 <tty_dev_write+0x148>
    58aa:	8b 45 08             	mov    0x8(%ebp),%eax
    58ad:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    58b3:	8d 50 01             	lea    0x1(%eax),%edx
    58b6:	8b 45 08             	mov    0x8(%ebp),%eax
    58b9:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    58bf:	8b 45 08             	mov    0x8(%ebp),%eax
    58c2:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    58c8:	8d 50 ff             	lea    -0x1(%eax),%edx
    58cb:	8b 45 08             	mov    0x8(%ebp),%eax
    58ce:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    58d4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    58d8:	83 ec 08             	sub    $0x8,%esp
    58db:	50                   	push   %eax
    58dc:	ff 75 08             	pushl  0x8(%ebp)
    58df:	e8 ec fc ff ff       	call   55d0 <out_char>
    58e4:	83 c4 10             	add    $0x10,%esp
    58e7:	eb 7d                	jmp    5966 <tty_dev_write+0x1c5>
    58e9:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
    58ed:	74 10                	je     58ff <tty_dev_write+0x15e>
    58ef:	8b 45 08             	mov    0x8(%ebp),%eax
    58f2:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
    58f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58fb:	39 c2                	cmp    %eax,%edx
    58fd:	75 67                	jne    5966 <tty_dev_write+0x1c5>
    58ff:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    5903:	83 ec 08             	sub    $0x8,%esp
    5906:	50                   	push   %eax
    5907:	ff 75 08             	pushl  0x8(%ebp)
    590a:	e8 c1 fc ff ff       	call   55d0 <out_char>
    590f:	83 c4 10             	add    $0x10,%esp
    5912:	8b 45 08             	mov    0x8(%ebp),%eax
    5915:	c7 80 8c 0c 00 00 00 	movl   $0x0,0xc8c(%eax)
    591c:	00 00 00 
    591f:	8b 45 08             	mov    0x8(%ebp),%eax
    5922:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
    5929:	00 00 00 
    592c:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
    5933:	8b 45 08             	mov    0x8(%ebp),%eax
    5936:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    593c:	89 45 d8             	mov    %eax,-0x28(%ebp)
    593f:	8b 45 08             	mov    0x8(%ebp),%eax
    5942:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
    5948:	89 45 e0             	mov    %eax,-0x20(%ebp)
    594b:	8b 45 08             	mov    0x8(%ebp),%eax
    594e:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
    5954:	83 ec 04             	sub    $0x4,%esp
    5957:	50                   	push   %eax
    5958:	8d 45 88             	lea    -0x78(%ebp),%eax
    595b:	50                   	push   %eax
    595c:	6a 01                	push   $0x1
    595e:	e8 03 d1 ff ff       	call   2a66 <send_rec>
    5963:	83 c4 10             	add    $0x10,%esp
    5966:	8b 45 08             	mov    0x8(%ebp),%eax
    5969:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    596f:	85 c0                	test   %eax,%eax
    5971:	0f 85 41 fe ff ff    	jne    57b8 <tty_dev_write+0x17>
    5977:	90                   	nop
    5978:	c9                   	leave  
    5979:	c3                   	ret    

0000597a <tty_do_read>:
    597a:	55                   	push   %ebp
    597b:	89 e5                	mov    %esp,%ebp
    597d:	83 ec 08             	sub    $0x8,%esp
    5980:	8b 45 08             	mov    0x8(%ebp),%eax
    5983:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
    598a:	00 00 00 
    598d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5990:	8b 50 58             	mov    0x58(%eax),%edx
    5993:	8b 45 08             	mov    0x8(%ebp),%eax
    5996:	89 90 9c 0c 00 00    	mov    %edx,0xc9c(%eax)
    599c:	8b 45 0c             	mov    0xc(%ebp),%eax
    599f:	8b 00                	mov    (%eax),%eax
    59a1:	89 c2                	mov    %eax,%edx
    59a3:	8b 45 08             	mov    0x8(%ebp),%eax
    59a6:	89 90 98 0c 00 00    	mov    %edx,0xc98(%eax)
    59ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    59af:	8b 50 1c             	mov    0x1c(%eax),%edx
    59b2:	8b 45 08             	mov    0x8(%ebp),%eax
    59b5:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    59bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    59be:	8b 40 10             	mov    0x10(%eax),%eax
    59c1:	89 c2                	mov    %eax,%edx
    59c3:	8b 45 08             	mov    0x8(%ebp),%eax
    59c6:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
    59cc:	83 ec 08             	sub    $0x8,%esp
    59cf:	52                   	push   %edx
    59d0:	50                   	push   %eax
    59d1:	e8 13 f7 ff ff       	call   50e9 <v2l>
    59d6:	83 c4 10             	add    $0x10,%esp
    59d9:	89 c2                	mov    %eax,%edx
    59db:	8b 45 08             	mov    0x8(%ebp),%eax
    59de:	89 90 94 0c 00 00    	mov    %edx,0xc94(%eax)
    59e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    59e7:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%eax)
    59ee:	8b 45 08             	mov    0x8(%ebp),%eax
    59f1:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
    59f7:	83 ec 04             	sub    $0x4,%esp
    59fa:	50                   	push   %eax
    59fb:	ff 75 0c             	pushl  0xc(%ebp)
    59fe:	6a 01                	push   $0x1
    5a00:	e8 61 d0 ff ff       	call   2a66 <send_rec>
    5a05:	83 c4 10             	add    $0x10,%esp
    5a08:	90                   	nop
    5a09:	c9                   	leave  
    5a0a:	c3                   	ret    

00005a0b <tty_do_write>:
    5a0b:	55                   	push   %ebp
    5a0c:	89 e5                	mov    %esp,%ebp
    5a0e:	53                   	push   %ebx
    5a0f:	81 ec 84 00 00 00    	sub    $0x84,%esp
    5a15:	89 e0                	mov    %esp,%eax
    5a17:	89 c3                	mov    %eax,%ebx
    5a19:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
    5a20:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5a23:	8d 50 ff             	lea    -0x1(%eax),%edx
    5a26:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    5a29:	89 c2                	mov    %eax,%edx
    5a2b:	b8 10 00 00 00       	mov    $0x10,%eax
    5a30:	83 e8 01             	sub    $0x1,%eax
    5a33:	01 d0                	add    %edx,%eax
    5a35:	b9 10 00 00 00       	mov    $0x10,%ecx
    5a3a:	ba 00 00 00 00       	mov    $0x0,%edx
    5a3f:	f7 f1                	div    %ecx
    5a41:	6b c0 10             	imul   $0x10,%eax,%eax
    5a44:	29 c4                	sub    %eax,%esp
    5a46:	89 e0                	mov    %esp,%eax
    5a48:	83 c0 00             	add    $0x0,%eax
    5a4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5a4e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a51:	8b 40 50             	mov    0x50(%eax),%eax
    5a54:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5a57:	e9 9b 00 00 00       	jmp    5af7 <tty_do_write+0xec>
    5a5c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5a5f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    5a62:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
    5a66:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5a69:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a6c:	8b 40 10             	mov    0x10(%eax),%eax
    5a6f:	89 c2                	mov    %eax,%edx
    5a71:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a74:	8b 40 58             	mov    0x58(%eax),%eax
    5a77:	83 ec 08             	sub    $0x8,%esp
    5a7a:	52                   	push   %edx
    5a7b:	50                   	push   %eax
    5a7c:	e8 68 f6 ff ff       	call   50e9 <v2l>
    5a81:	83 c4 10             	add    $0x10,%esp
    5a84:	89 c2                	mov    %eax,%edx
    5a86:	8b 45 08             	mov    0x8(%ebp),%eax
    5a89:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5a8f:	01 d0                	add    %edx,%eax
    5a91:	89 c2                	mov    %eax,%edx
    5a93:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5a96:	83 ec 04             	sub    $0x4,%esp
    5a99:	ff 75 f0             	pushl  -0x10(%ebp)
    5a9c:	52                   	push   %edx
    5a9d:	50                   	push   %eax
    5a9e:	e8 4f 0f 00 00       	call   69f2 <Memcpy>
    5aa3:	83 c4 10             	add    $0x10,%esp
    5aa6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5aa9:	29 45 ec             	sub    %eax,-0x14(%ebp)
    5aac:	8b 45 08             	mov    0x8(%ebp),%eax
    5aaf:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
    5ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ab8:	01 c2                	add    %eax,%edx
    5aba:	8b 45 08             	mov    0x8(%ebp),%eax
    5abd:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    5ac3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5aca:	eb 25                	jmp    5af1 <tty_do_write+0xe6>
    5acc:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5ad2:	01 d0                	add    %edx,%eax
    5ad4:	0f b6 00             	movzbl (%eax),%eax
    5ad7:	0f b6 c0             	movzbl %al,%eax
    5ada:	83 ec 08             	sub    $0x8,%esp
    5add:	50                   	push   %eax
    5ade:	ff 75 08             	pushl  0x8(%ebp)
    5ae1:	e8 ea fa ff ff       	call   55d0 <out_char>
    5ae6:	83 c4 10             	add    $0x10,%esp
    5ae9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5aed:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    5af1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5af5:	75 d5                	jne    5acc <tty_do_write+0xc1>
    5af7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5afb:	0f 85 5b ff ff ff    	jne    5a5c <tty_do_write+0x51>
    5b01:	c7 85 7c ff ff ff 65 	movl   $0x65,-0x84(%ebp)
    5b08:	00 00 00 
    5b0b:	8b 45 08             	mov    0x8(%ebp),%eax
    5b0e:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5b14:	89 45 c0             	mov    %eax,-0x40(%ebp)
    5b17:	8b 45 0c             	mov    0xc(%ebp),%eax
    5b1a:	8b 00                	mov    (%eax),%eax
    5b1c:	83 ec 04             	sub    $0x4,%esp
    5b1f:	50                   	push   %eax
    5b20:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    5b26:	50                   	push   %eax
    5b27:	6a 01                	push   $0x1
    5b29:	e8 38 cf ff ff       	call   2a66 <send_rec>
    5b2e:	83 c4 10             	add    $0x10,%esp
    5b31:	89 dc                	mov    %ebx,%esp
    5b33:	90                   	nop
    5b34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5b37:	c9                   	leave  
    5b38:	c3                   	ret    

00005b39 <init_screen>:
    5b39:	55                   	push   %ebp
    5b3a:	89 e5                	mov    %esp,%ebp
    5b3c:	83 ec 10             	sub    $0x10,%esp
    5b3f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b42:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5b47:	c1 f8 02             	sar    $0x2,%eax
    5b4a:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
    5b50:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5b53:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5b56:	c1 e0 04             	shl    $0x4,%eax
    5b59:	8d 90 c0 d4 00 00    	lea    0xd4c0(%eax),%edx
    5b5f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b62:	89 90 a0 0c 00 00    	mov    %edx,0xca0(%eax)
    5b68:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
    5b6f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b72:	8b 88 a0 0c 00 00    	mov    0xca0(%eax),%ecx
    5b78:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5b7b:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    5b80:	f7 e2                	mul    %edx
    5b82:	89 d0                	mov    %edx,%eax
    5b84:	d1 e8                	shr    %eax
    5b86:	89 41 04             	mov    %eax,0x4(%ecx)
    5b89:	8b 45 08             	mov    0x8(%ebp),%eax
    5b8c:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5b92:	8b 50 04             	mov    0x4(%eax),%edx
    5b95:	8b 45 08             	mov    0x8(%ebp),%eax
    5b98:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5b9e:	0f af 55 fc          	imul   -0x4(%ebp),%edx
    5ba2:	89 10                	mov    %edx,(%eax)
    5ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    5ba7:	8b 90 a0 0c 00 00    	mov    0xca0(%eax),%edx
    5bad:	8b 45 08             	mov    0x8(%ebp),%eax
    5bb0:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5bb6:	8b 12                	mov    (%edx),%edx
    5bb8:	89 50 08             	mov    %edx,0x8(%eax)
    5bbb:	8b 55 08             	mov    0x8(%ebp),%edx
    5bbe:	8b 92 a0 0c 00 00    	mov    0xca0(%edx),%edx
    5bc4:	8b 40 08             	mov    0x8(%eax),%eax
    5bc7:	89 42 0c             	mov    %eax,0xc(%edx)
    5bca:	90                   	nop
    5bcb:	c9                   	leave  
    5bcc:	c3                   	ret    

00005bcd <init_tty>:
    5bcd:	55                   	push   %ebp
    5bce:	89 e5                	mov    %esp,%ebp
    5bd0:	83 ec 18             	sub    $0x18,%esp
    5bd3:	c7 45 f4 00 a6 00 00 	movl   $0xa600,-0xc(%ebp)
    5bda:	eb 7a                	jmp    5c56 <init_tty+0x89>
    5bdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bdf:	8d 50 08             	lea    0x8(%eax),%edx
    5be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5be5:	89 50 04             	mov    %edx,0x4(%eax)
    5be8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5beb:	8b 50 04             	mov    0x4(%eax),%edx
    5bee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bf1:	89 10                	mov    %edx,(%eax)
    5bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bf6:	c7 80 88 0c 00 00 00 	movl   $0x0,0xc88(%eax)
    5bfd:	00 00 00 
    5c00:	ff 75 f4             	pushl  -0xc(%ebp)
    5c03:	e8 31 ff ff ff       	call   5b39 <init_screen>
    5c08:	83 c4 04             	add    $0x4,%esp
    5c0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c0e:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5c13:	85 c0                	test   %eax,%eax
    5c15:	7e 38                	jle    5c4f <init_tty+0x82>
    5c17:	83 ec 08             	sub    $0x8,%esp
    5c1a:	6a 23                	push   $0x23
    5c1c:	ff 75 f4             	pushl  -0xc(%ebp)
    5c1f:	e8 ac f9 ff ff       	call   55d0 <out_char>
    5c24:	83 c4 10             	add    $0x10,%esp
    5c27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c2a:	05 64 6b 02 00       	add    $0x26b64,%eax
    5c2f:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5c34:	c1 f8 02             	sar    $0x2,%eax
    5c37:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
    5c3d:	0f b6 c0             	movzbl %al,%eax
    5c40:	83 ec 08             	sub    $0x8,%esp
    5c43:	50                   	push   %eax
    5c44:	ff 75 f4             	pushl  -0xc(%ebp)
    5c47:	e8 84 f9 ff ff       	call   55d0 <out_char>
    5c4c:	83 c4 10             	add    $0x10,%esp
    5c4f:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
    5c56:	b8 ec cb 00 00       	mov    $0xcbec,%eax
    5c5b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5c5e:	0f 82 78 ff ff ff    	jb     5bdc <init_tty+0xf>
    5c64:	90                   	nop
    5c65:	c9                   	leave  
    5c66:	c3                   	ret    

00005c67 <TaskTTY>:
    5c67:	55                   	push   %ebp
    5c68:	89 e5                	mov    %esp,%ebp
    5c6a:	83 ec 78             	sub    $0x78,%esp
    5c6d:	e8 5b ff ff ff       	call   5bcd <init_tty>
    5c72:	83 ec 0c             	sub    $0xc,%esp
    5c75:	6a 00                	push   $0x0
    5c77:	e8 03 f7 ff ff       	call   537f <select_console>
    5c7c:	83 c4 10             	add    $0x10,%esp
    5c7f:	c7 45 f4 00 a6 00 00 	movl   $0xa600,-0xc(%ebp)
    5c86:	eb 30                	jmp    5cb8 <TaskTTY+0x51>
    5c88:	83 ec 0c             	sub    $0xc,%esp
    5c8b:	ff 75 f4             	pushl  -0xc(%ebp)
    5c8e:	e8 e4 fa ff ff       	call   5777 <tty_dev_read>
    5c93:	83 c4 10             	add    $0x10,%esp
    5c96:	83 ec 0c             	sub    $0xc,%esp
    5c99:	ff 75 f4             	pushl  -0xc(%ebp)
    5c9c:	e8 00 fb ff ff       	call   57a1 <tty_dev_write>
    5ca1:	83 c4 10             	add    $0x10,%esp
    5ca4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5ca7:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    5cad:	85 c0                	test   %eax,%eax
    5caf:	75 d7                	jne    5c88 <TaskTTY+0x21>
    5cb1:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
    5cb8:	b8 ec cb 00 00       	mov    $0xcbec,%eax
    5cbd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5cc0:	72 c6                	jb     5c88 <TaskTTY+0x21>
    5cc2:	8b 45 8c             	mov    -0x74(%ebp),%eax
    5cc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5cc8:	81 7d f0 d2 07 00 00 	cmpl   $0x7d2,-0x10(%ebp)
    5ccf:	74 12                	je     5ce3 <TaskTTY+0x7c>
    5cd1:	81 7d f0 d3 07 00 00 	cmpl   $0x7d3,-0x10(%ebp)
    5cd8:	74 20                	je     5cfa <TaskTTY+0x93>
    5cda:	81 7d f0 d1 07 00 00 	cmpl   $0x7d1,-0x10(%ebp)
    5ce1:	eb 2d                	jmp    5d10 <TaskTTY+0xa9>
    5ce3:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5ce8:	83 ec 08             	sub    $0x8,%esp
    5ceb:	8d 55 88             	lea    -0x78(%ebp),%edx
    5cee:	52                   	push   %edx
    5cef:	50                   	push   %eax
    5cf0:	e8 85 fc ff ff       	call   597a <tty_do_read>
    5cf5:	83 c4 10             	add    $0x10,%esp
    5cf8:	eb 16                	jmp    5d10 <TaskTTY+0xa9>
    5cfa:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5cff:	83 ec 08             	sub    $0x8,%esp
    5d02:	8d 55 88             	lea    -0x78(%ebp),%edx
    5d05:	52                   	push   %edx
    5d06:	50                   	push   %eax
    5d07:	e8 ff fc ff ff       	call   5a0b <tty_do_write>
    5d0c:	83 c4 10             	add    $0x10,%esp
    5d0f:	90                   	nop
    5d10:	e9 6a ff ff ff       	jmp    5c7f <TaskTTY+0x18>

00005d15 <keyboard_handler>:
    5d15:	55                   	push   %ebp
    5d16:	89 e5                	mov    %esp,%ebp
    5d18:	83 ec 18             	sub    $0x18,%esp
    5d1b:	c7 05 74 cc 00 00 01 	movl   $0x1,0xcc74
    5d22:	00 00 00 
    5d25:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
    5d2c:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5d31:	3d 1f 03 00 00       	cmp    $0x31f,%eax
    5d36:	7f 5c                	jg     5d94 <keyboard_handler+0x7f>
    5d38:	e8 bb b5 ff ff       	call   12f8 <disable_int>
    5d3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d40:	0f b7 c0             	movzwl %ax,%eax
    5d43:	83 ec 0c             	sub    $0xc,%esp
    5d46:	50                   	push   %eax
    5d47:	e8 7e b5 ff ff       	call   12ca <in_byte>
    5d4c:	83 c4 10             	add    $0x10,%esp
    5d4f:	88 45 f3             	mov    %al,-0xd(%ebp)
    5d52:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5d57:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
    5d5b:	88 10                	mov    %dl,(%eax)
    5d5d:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5d62:	83 c0 01             	add    $0x1,%eax
    5d65:	a3 c0 a2 00 00       	mov    %eax,0xa2c0
    5d6a:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5d6f:	83 c0 01             	add    $0x1,%eax
    5d72:	a3 c8 a2 00 00       	mov    %eax,0xa2c8
    5d77:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5d7c:	ba ec a5 00 00       	mov    $0xa5ec,%edx
    5d81:	39 d0                	cmp    %edx,%eax
    5d83:	72 0a                	jb     5d8f <keyboard_handler+0x7a>
    5d85:	c7 05 c0 a2 00 00 cc 	movl   $0xa2cc,0xa2c0
    5d8c:	a2 00 00 
    5d8f:	e8 66 b5 ff ff       	call   12fa <enable_int>
    5d94:	90                   	nop
    5d95:	c9                   	leave  
    5d96:	c3                   	ret    

00005d97 <read_from_keyboard_buf>:
    5d97:	55                   	push   %ebp
    5d98:	89 e5                	mov    %esp,%ebp
    5d9a:	83 ec 18             	sub    $0x18,%esp
    5d9d:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
    5da1:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5da6:	85 c0                	test   %eax,%eax
    5da8:	7e 47                	jle    5df1 <read_from_keyboard_buf+0x5a>
    5daa:	e8 49 b5 ff ff       	call   12f8 <disable_int>
    5daf:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5db4:	0f b6 00             	movzbl (%eax),%eax
    5db7:	88 45 f7             	mov    %al,-0x9(%ebp)
    5dba:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5dbf:	83 c0 01             	add    $0x1,%eax
    5dc2:	a3 c4 a2 00 00       	mov    %eax,0xa2c4
    5dc7:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5dcc:	83 e8 01             	sub    $0x1,%eax
    5dcf:	a3 c8 a2 00 00       	mov    %eax,0xa2c8
    5dd4:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5dd9:	ba ec a5 00 00       	mov    $0xa5ec,%edx
    5dde:	39 d0                	cmp    %edx,%eax
    5de0:	72 0a                	jb     5dec <read_from_keyboard_buf+0x55>
    5de2:	c7 05 c4 a2 00 00 cc 	movl   $0xa2cc,0xa2c4
    5de9:	a2 00 00 
    5dec:	e8 09 b5 ff ff       	call   12fa <enable_int>
    5df1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    5df5:	c9                   	leave  
    5df6:	c3                   	ret    

00005df7 <keyboard_read>:
    5df7:	55                   	push   %ebp
    5df8:	89 e5                	mov    %esp,%ebp
    5dfa:	83 ec 28             	sub    $0x28,%esp
    5dfd:	90                   	nop
    5dfe:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5e03:	85 c0                	test   %eax,%eax
    5e05:	7e f7                	jle    5dfe <keyboard_read+0x7>
    5e07:	e8 8b ff ff ff       	call   5d97 <read_from_keyboard_buf>
    5e0c:	88 45 ea             	mov    %al,-0x16(%ebp)
    5e0f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5e16:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5e1a:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
    5e1e:	75 5a                	jne    5e7a <keyboard_read+0x83>
    5e20:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
    5e24:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
    5e28:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
    5e2c:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
    5e30:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
    5e34:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
    5e38:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
    5e3c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    5e43:	eb 20                	jmp    5e65 <keyboard_read+0x6e>
    5e45:	e8 4d ff ff ff       	call   5d97 <read_from_keyboard_buf>
    5e4a:	89 c1                	mov    %eax,%ecx
    5e4c:	8d 55 e3             	lea    -0x1d(%ebp),%edx
    5e4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5e52:	01 d0                	add    %edx,%eax
    5e54:	0f b6 00             	movzbl (%eax),%eax
    5e57:	38 c1                	cmp    %al,%cl
    5e59:	74 06                	je     5e61 <keyboard_read+0x6a>
    5e5b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    5e5f:	eb 0a                	jmp    5e6b <keyboard_read+0x74>
    5e61:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5e65:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
    5e69:	7e da                	jle    5e45 <keyboard_read+0x4e>
    5e6b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
    5e6f:	74 68                	je     5ed9 <keyboard_read+0xe2>
    5e71:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
    5e78:	eb 5f                	jmp    5ed9 <keyboard_read+0xe2>
    5e7a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
    5e7e:	75 59                	jne    5ed9 <keyboard_read+0xe2>
    5e80:	e8 12 ff ff ff       	call   5d97 <read_from_keyboard_buf>
    5e85:	3c 2a                	cmp    $0x2a,%al
    5e87:	75 1d                	jne    5ea6 <keyboard_read+0xaf>
    5e89:	e8 09 ff ff ff       	call   5d97 <read_from_keyboard_buf>
    5e8e:	3c e0                	cmp    $0xe0,%al
    5e90:	75 14                	jne    5ea6 <keyboard_read+0xaf>
    5e92:	e8 00 ff ff ff       	call   5d97 <read_from_keyboard_buf>
    5e97:	3c 37                	cmp    $0x37,%al
    5e99:	75 0b                	jne    5ea6 <keyboard_read+0xaf>
    5e9b:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    5ea2:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    5ea6:	e8 ec fe ff ff       	call   5d97 <read_from_keyboard_buf>
    5eab:	3c b7                	cmp    $0xb7,%al
    5ead:	75 1d                	jne    5ecc <keyboard_read+0xd5>
    5eaf:	e8 e3 fe ff ff       	call   5d97 <read_from_keyboard_buf>
    5eb4:	3c e0                	cmp    $0xe0,%al
    5eb6:	75 14                	jne    5ecc <keyboard_read+0xd5>
    5eb8:	e8 da fe ff ff       	call   5d97 <read_from_keyboard_buf>
    5ebd:	3c aa                	cmp    $0xaa,%al
    5ebf:	75 0b                	jne    5ecc <keyboard_read+0xd5>
    5ec1:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    5ec8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5ecc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5ed0:	75 07                	jne    5ed9 <keyboard_read+0xe2>
    5ed2:	c6 05 84 9e 00 00 01 	movb   $0x1,0x9e84
    5ed9:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
    5ee0:	0f 84 8d 00 00 00    	je     5f73 <keyboard_read+0x17c>
    5ee6:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
    5eed:	0f 84 80 00 00 00    	je     5f73 <keyboard_read+0x17c>
    5ef3:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
    5ef7:	0f 94 c2             	sete   %dl
    5efa:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
    5efe:	0f 94 c0             	sete   %al
    5f01:	09 d0                	or     %edx,%eax
    5f03:	84 c0                	test   %al,%al
    5f05:	74 07                	je     5f0e <keyboard_read+0x117>
    5f07:	c6 05 78 cc 00 00 01 	movb   $0x1,0xcc78
    5f0e:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    5f12:	f7 d0                	not    %eax
    5f14:	c0 e8 07             	shr    $0x7,%al
    5f17:	88 45 e9             	mov    %al,-0x17(%ebp)
    5f1a:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
    5f1e:	74 53                	je     5f73 <keyboard_read+0x17c>
    5f20:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
    5f24:	74 4d                	je     5f73 <keyboard_read+0x17c>
    5f26:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
    5f2a:	0f b6 05 78 cc 00 00 	movzbl 0xcc78,%eax
    5f31:	3c 01                	cmp    $0x1,%al
    5f33:	75 04                	jne    5f39 <keyboard_read+0x142>
    5f35:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    5f39:	0f b6 05 84 9e 00 00 	movzbl 0x9e84,%eax
    5f40:	84 c0                	test   %al,%al
    5f42:	74 04                	je     5f48 <keyboard_read+0x151>
    5f44:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
    5f48:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
    5f4c:	89 d0                	mov    %edx,%eax
    5f4e:	01 c0                	add    %eax,%eax
    5f50:	01 c2                	add    %eax,%edx
    5f52:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    5f56:	01 d0                	add    %edx,%eax
    5f58:	8b 04 85 80 90 00 00 	mov    0x9080(,%eax,4),%eax
    5f5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5f62:	83 ec 08             	sub    $0x8,%esp
    5f65:	ff 75 f4             	pushl  -0xc(%ebp)
    5f68:	ff 75 08             	pushl  0x8(%ebp)
    5f6b:	e8 1a 00 00 00       	call   5f8a <in_process>
    5f70:	83 c4 10             	add    $0x10,%esp
    5f73:	90                   	nop
    5f74:	c9                   	leave  
    5f75:	c3                   	ret    

00005f76 <init_keyboard_handler>:
    5f76:	55                   	push   %ebp
    5f77:	89 e5                	mov    %esp,%ebp
    5f79:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    5f80:	c6 05 78 cc 00 00 00 	movb   $0x0,0xcc78
    5f87:	90                   	nop
    5f88:	5d                   	pop    %ebp
    5f89:	c3                   	ret    

00005f8a <in_process>:
    5f8a:	55                   	push   %ebp
    5f8b:	89 e5                	mov    %esp,%ebp
    5f8d:	83 ec 18             	sub    $0x18,%esp
    5f90:	83 ec 04             	sub    $0x4,%esp
    5f93:	6a 02                	push   $0x2
    5f95:	6a 00                	push   $0x0
    5f97:	8d 45 f6             	lea    -0xa(%ebp),%eax
    5f9a:	50                   	push   %eax
    5f9b:	e8 80 0a 00 00       	call   6a20 <Memset>
    5fa0:	83 c4 10             	add    $0x10,%esp
    5fa3:	8b 45 0c             	mov    0xc(%ebp),%eax
    5fa6:	25 00 01 00 00       	and    $0x100,%eax
    5fab:	85 c0                	test   %eax,%eax
    5fad:	75 28                	jne    5fd7 <in_process+0x4d>
    5faf:	8b 45 0c             	mov    0xc(%ebp),%eax
    5fb2:	0f b6 c0             	movzbl %al,%eax
    5fb5:	83 ec 08             	sub    $0x8,%esp
    5fb8:	50                   	push   %eax
    5fb9:	ff 75 08             	pushl  0x8(%ebp)
    5fbc:	e8 ef f4 ff ff       	call   54b0 <put_key>
    5fc1:	83 c4 10             	add    $0x10,%esp
    5fc4:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    5fcb:	c6 05 78 cc 00 00 00 	movb   $0x0,0xcc78
    5fd2:	e9 42 01 00 00       	jmp    6119 <in_process+0x18f>
    5fd7:	0f b6 05 78 cc 00 00 	movzbl 0xcc78,%eax
    5fde:	84 c0                	test   %al,%al
    5fe0:	0f 84 a9 00 00 00    	je     608f <in_process+0x105>
    5fe6:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
    5fea:	0f 84 9f 00 00 00    	je     608f <in_process+0x105>
    5ff0:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
    5ff4:	0f 84 95 00 00 00    	je     608f <in_process+0x105>
    5ffa:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    6001:	74 64                	je     6067 <in_process+0xdd>
    6003:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    600a:	77 0b                	ja     6017 <in_process+0x8d>
    600c:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    6013:	74 64                	je     6079 <in_process+0xef>
    6015:	eb 73                	jmp    608a <in_process+0x100>
    6017:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
    601e:	74 0b                	je     602b <in_process+0xa1>
    6020:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
    6027:	74 20                	je     6049 <in_process+0xbf>
    6029:	eb 5f                	jmp    608a <in_process+0x100>
    602b:	83 ec 0c             	sub    $0xc,%esp
    602e:	ff 75 08             	pushl  0x8(%ebp)
    6031:	e8 e6 f4 ff ff       	call   551c <scroll_up>
    6036:	83 c4 10             	add    $0x10,%esp
    6039:	c6 05 78 cc 00 00 00 	movb   $0x0,0xcc78
    6040:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    6047:	eb 41                	jmp    608a <in_process+0x100>
    6049:	83 ec 0c             	sub    $0xc,%esp
    604c:	ff 75 08             	pushl  0x8(%ebp)
    604f:	e8 09 f5 ff ff       	call   555d <scroll_down>
    6054:	83 c4 10             	add    $0x10,%esp
    6057:	c6 05 78 cc 00 00 00 	movb   $0x0,0xcc78
    605e:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    6065:	eb 23                	jmp    608a <in_process+0x100>
    6067:	83 ec 08             	sub    $0x8,%esp
    606a:	6a 0a                	push   $0xa
    606c:	ff 75 08             	pushl  0x8(%ebp)
    606f:	e8 5c f5 ff ff       	call   55d0 <out_char>
    6074:	83 c4 10             	add    $0x10,%esp
    6077:	eb 11                	jmp    608a <in_process+0x100>
    6079:	83 ec 08             	sub    $0x8,%esp
    607c:	6a 08                	push   $0x8
    607e:	ff 75 08             	pushl  0x8(%ebp)
    6081:	e8 4a f5 ff ff       	call   55d0 <out_char>
    6086:	83 c4 10             	add    $0x10,%esp
    6089:	90                   	nop
    608a:	e9 8a 00 00 00       	jmp    6119 <in_process+0x18f>
    608f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    6096:	74 55                	je     60ed <in_process+0x163>
    6098:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    609f:	77 14                	ja     60b5 <in_process+0x12b>
    60a1:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    60a8:	74 31                	je     60db <in_process+0x151>
    60aa:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    60b1:	74 16                	je     60c9 <in_process+0x13f>
    60b3:	eb 64                	jmp    6119 <in_process+0x18f>
    60b5:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
    60bc:	74 3e                	je     60fc <in_process+0x172>
    60be:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
    60c5:	74 44                	je     610b <in_process+0x181>
    60c7:	eb 50                	jmp    6119 <in_process+0x18f>
    60c9:	83 ec 08             	sub    $0x8,%esp
    60cc:	6a 0a                	push   $0xa
    60ce:	ff 75 08             	pushl  0x8(%ebp)
    60d1:	e8 da f3 ff ff       	call   54b0 <put_key>
    60d6:	83 c4 10             	add    $0x10,%esp
    60d9:	eb 3e                	jmp    6119 <in_process+0x18f>
    60db:	83 ec 08             	sub    $0x8,%esp
    60de:	6a 08                	push   $0x8
    60e0:	ff 75 08             	pushl  0x8(%ebp)
    60e3:	e8 c8 f3 ff ff       	call   54b0 <put_key>
    60e8:	83 c4 10             	add    $0x10,%esp
    60eb:	eb 2c                	jmp    6119 <in_process+0x18f>
    60ed:	83 ec 0c             	sub    $0xc,%esp
    60f0:	6a 00                	push   $0x0
    60f2:	e8 88 f2 ff ff       	call   537f <select_console>
    60f7:	83 c4 10             	add    $0x10,%esp
    60fa:	eb 1d                	jmp    6119 <in_process+0x18f>
    60fc:	83 ec 0c             	sub    $0xc,%esp
    60ff:	6a 01                	push   $0x1
    6101:	e8 79 f2 ff ff       	call   537f <select_console>
    6106:	83 c4 10             	add    $0x10,%esp
    6109:	eb 0e                	jmp    6119 <in_process+0x18f>
    610b:	83 ec 0c             	sub    $0xc,%esp
    610e:	6a 02                	push   $0x2
    6110:	e8 6a f2 ff ff       	call   537f <select_console>
    6115:	83 c4 10             	add    $0x10,%esp
    6118:	90                   	nop
    6119:	c7 05 74 cc 00 00 00 	movl   $0x0,0xcc74
    6120:	00 00 00 
    6123:	90                   	nop
    6124:	c9                   	leave  
    6125:	c3                   	ret    

00006126 <open>:
    6126:	55                   	push   %ebp
    6127:	89 e5                	mov    %esp,%ebp
    6129:	83 ec 78             	sub    $0x78,%esp
    612c:	c7 45 94 06 00 00 00 	movl   $0x6,-0x6c(%ebp)
    6133:	8b 45 08             	mov    0x8(%ebp),%eax
    6136:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    6139:	8b 45 0c             	mov    0xc(%ebp),%eax
    613c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    613f:	83 ec 0c             	sub    $0xc,%esp
    6142:	ff 75 08             	pushl  0x8(%ebp)
    6145:	e8 0f 09 00 00       	call   6a59 <Strlen>
    614a:	83 c4 10             	add    $0x10,%esp
    614d:	89 45 c0             	mov    %eax,-0x40(%ebp)
    6150:	83 ec 04             	sub    $0x4,%esp
    6153:	6a 03                	push   $0x3
    6155:	8d 45 90             	lea    -0x70(%ebp),%eax
    6158:	50                   	push   %eax
    6159:	6a 03                	push   $0x3
    615b:	e8 06 c9 ff ff       	call   2a66 <send_rec>
    6160:	83 c4 10             	add    $0x10,%esp
    6163:	8b 45 94             	mov    -0x6c(%ebp),%eax
    6166:	83 f8 65             	cmp    $0x65,%eax
    6169:	74 19                	je     6184 <open+0x5e>
    616b:	6a 17                	push   $0x17
    616d:	68 ab 69 00 00       	push   $0x69ab
    6172:	68 ab 69 00 00       	push   $0x69ab
    6177:	68 b6 69 00 00       	push   $0x69b6
    617c:	e8 e0 c0 ff ff       	call   2261 <assertion_failure>
    6181:	83 c4 10             	add    $0x10,%esp
    6184:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6187:	c9                   	leave  
    6188:	c3                   	ret    

00006189 <read>:
    6189:	55                   	push   %ebp
    618a:	89 e5                	mov    %esp,%ebp
    618c:	83 ec 78             	sub    $0x78,%esp
    618f:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%ebp)
    6196:	8b 45 08             	mov    0x8(%ebp),%eax
    6199:	89 45 d0             	mov    %eax,-0x30(%ebp)
    619c:	8b 45 0c             	mov    0xc(%ebp),%eax
    619f:	89 45 a0             	mov    %eax,-0x60(%ebp)
    61a2:	8b 45 10             	mov    0x10(%ebp),%eax
    61a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    61a8:	83 ec 04             	sub    $0x4,%esp
    61ab:	6a 03                	push   $0x3
    61ad:	8d 45 90             	lea    -0x70(%ebp),%eax
    61b0:	50                   	push   %eax
    61b1:	6a 03                	push   $0x3
    61b3:	e8 ae c8 ff ff       	call   2a66 <send_rec>
    61b8:	83 c4 10             	add    $0x10,%esp
    61bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    61be:	c9                   	leave  
    61bf:	c3                   	ret    

000061c0 <write>:
    61c0:	55                   	push   %ebp
    61c1:	89 e5                	mov    %esp,%ebp
    61c3:	83 ec 78             	sub    $0x78,%esp
    61c6:	c7 45 94 0a 00 00 00 	movl   $0xa,-0x6c(%ebp)
    61cd:	8b 45 08             	mov    0x8(%ebp),%eax
    61d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    61d3:	8b 45 0c             	mov    0xc(%ebp),%eax
    61d6:	89 45 a0             	mov    %eax,-0x60(%ebp)
    61d9:	8b 45 10             	mov    0x10(%ebp),%eax
    61dc:	89 45 e0             	mov    %eax,-0x20(%ebp)
    61df:	83 ec 04             	sub    $0x4,%esp
    61e2:	6a 03                	push   $0x3
    61e4:	8d 45 90             	lea    -0x70(%ebp),%eax
    61e7:	50                   	push   %eax
    61e8:	6a 03                	push   $0x3
    61ea:	e8 77 c8 ff ff       	call   2a66 <send_rec>
    61ef:	83 c4 10             	add    $0x10,%esp
    61f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    61f5:	c9                   	leave  
    61f6:	c3                   	ret    

000061f7 <close>:
    61f7:	55                   	push   %ebp
    61f8:	89 e5                	mov    %esp,%ebp
    61fa:	83 ec 78             	sub    $0x78,%esp
    61fd:	c7 45 94 01 00 00 00 	movl   $0x1,-0x6c(%ebp)
    6204:	8b 45 08             	mov    0x8(%ebp),%eax
    6207:	89 45 d0             	mov    %eax,-0x30(%ebp)
    620a:	83 ec 04             	sub    $0x4,%esp
    620d:	6a 03                	push   $0x3
    620f:	8d 45 90             	lea    -0x70(%ebp),%eax
    6212:	50                   	push   %eax
    6213:	6a 03                	push   $0x3
    6215:	e8 4c c8 ff ff       	call   2a66 <send_rec>
    621a:	83 c4 10             	add    $0x10,%esp
    621d:	8b 45 94             	mov    -0x6c(%ebp),%eax
    6220:	83 f8 65             	cmp    $0x65,%eax
    6223:	74 19                	je     623e <close+0x47>
    6225:	6a 14                	push   $0x14
    6227:	68 ce 69 00 00       	push   $0x69ce
    622c:	68 ce 69 00 00       	push   $0x69ce
    6231:	68 da 69 00 00       	push   $0x69da
    6236:	e8 26 c0 ff ff       	call   2261 <assertion_failure>
    623b:	83 c4 10             	add    $0x10,%esp
    623e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6241:	c9                   	leave  
    6242:	c3                   	ret    
