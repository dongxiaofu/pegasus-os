
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
    1023:	0f 01 05 78 cc 00 00 	sgdtl  0xcc78
    102a:	e8 77 41 00 00       	call   51a6 <ReloadGDT>
    102f:	0f 01 15 78 cc 00 00 	lgdtl  0xcc78
    1036:	0f 01 1d 88 9e 00 00 	lidtl  0x9e88
    103d:	ea 44 10 00 00 08 00 	ljmp   $0x8,$0x1044

00001044 <csinit>:
    1044:	31 c0                	xor    %eax,%eax
    1046:	66 b8 40 00          	mov    $0x40,%ax
    104a:	0f 00 d8             	ltr    %ax
    104d:	e9 5b 0a 00 00       	jmp    1aad <kernel_main>
    1052:	eb fe                	jmp    1052 <csinit+0xe>
    1054:	fb                   	sti    
    1055:	b4 0b                	mov    $0xb,%ah
    1057:	b0 4d                	mov    $0x4d,%al
    1059:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
    1060:	eb fe                	jmp    1060 <csinit+0x1c>
    1062:	f4                   	hlt    
    1063:	6a 00                	push   $0x0
    1065:	9d                   	popf   
    1066:	eb fe                	jmp    1066 <csinit+0x22>
    1068:	e8 6c 08 00 00       	call   18d9 <test>
    106d:	6a 01                	push   $0x1
    106f:	6a 02                	push   $0x2
    1071:	6a 03                	push   $0x3
    1073:	f4                   	hlt    

00001074 <InterruptTest>:
    1074:	b4 0d                	mov    $0xd,%ah
    1076:	b0 54                	mov    $0x54,%al
    1078:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
    107f:	c3                   	ret    

00001080 <disp_str>:
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	b4 0d                	mov    $0xd,%ah
    1085:	8b 75 08             	mov    0x8(%ebp),%esi
    1088:	8b 3d 90 9e 00 00    	mov    0x9e90,%edi

0000108e <disp_str.1>:
    108e:	ac                   	lods   %ds:(%esi),%al
    108f:	84 c0                	test   %al,%al
    1091:	74 1e                	je     10b1 <disp_str.4>
    1093:	3c 0a                	cmp    $0xa,%al
    1095:	75 11                	jne    10a8 <disp_str.3>
    1097:	50                   	push   %eax
    1098:	89 f8                	mov    %edi,%eax
    109a:	b3 a0                	mov    $0xa0,%bl
    109c:	f6 f3                	div    %bl
    109e:	40                   	inc    %eax
    109f:	b3 a0                	mov    $0xa0,%bl
    10a1:	f6 e3                	mul    %bl
    10a3:	89 c7                	mov    %eax,%edi
    10a5:	58                   	pop    %eax
    10a6:	eb e6                	jmp    108e <disp_str.1>

000010a8 <disp_str.3>:
    10a8:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10ac:	83 c7 02             	add    $0x2,%edi
    10af:	eb dd                	jmp    108e <disp_str.1>

000010b1 <disp_str.4>:
    10b1:	89 3d 90 9e 00 00    	mov    %edi,0x9e90
    10b7:	89 ec                	mov    %ebp,%esp
    10b9:	5d                   	pop    %ebp
    10ba:	c3                   	ret    

000010bb <disp_str_colour>:
    10bb:	55                   	push   %ebp
    10bc:	89 e5                	mov    %esp,%ebp
    10be:	8b 75 08             	mov    0x8(%ebp),%esi
    10c1:	8a 65 0c             	mov    0xc(%ebp),%ah
    10c4:	8b 3d 90 9e 00 00    	mov    0x9e90,%edi

000010ca <disp_str_colour.1>:
    10ca:	ac                   	lods   %ds:(%esi),%al
    10cb:	84 c0                	test   %al,%al
    10cd:	74 1e                	je     10ed <disp_str_colour.4>
    10cf:	3c 0a                	cmp    $0xa,%al
    10d1:	75 11                	jne    10e4 <disp_str_colour.3>
    10d3:	50                   	push   %eax
    10d4:	89 f8                	mov    %edi,%eax
    10d6:	b3 a0                	mov    $0xa0,%bl
    10d8:	f6 f3                	div    %bl
    10da:	40                   	inc    %eax
    10db:	b3 a0                	mov    $0xa0,%bl
    10dd:	f6 e3                	mul    %bl
    10df:	89 c7                	mov    %eax,%edi
    10e1:	58                   	pop    %eax
    10e2:	eb e6                	jmp    10ca <disp_str_colour.1>

000010e4 <disp_str_colour.3>:
    10e4:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10e8:	83 c7 02             	add    $0x2,%edi
    10eb:	eb dd                	jmp    10ca <disp_str_colour.1>

000010ed <disp_str_colour.4>:
    10ed:	89 3d 90 9e 00 00    	mov    %edi,0x9e90
    10f3:	89 ec                	mov    %ebp,%esp
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    

000010f7 <divide_zero_fault>:
    10f7:	6a ff                	push   $0xffffffff
    10f9:	6a 00                	push   $0x0
    10fb:	eb 58                	jmp    1155 <exception>

000010fd <single_step_fault>:
    10fd:	6a ff                	push   $0xffffffff
    10ff:	6a 01                	push   $0x1
    1101:	eb 52                	jmp    1155 <exception>

00001103 <non_maskable_interrupt>:
    1103:	6a ff                	push   $0xffffffff
    1105:	6a 02                	push   $0x2
    1107:	eb 4c                	jmp    1155 <exception>

00001109 <breakpoint_trap>:
    1109:	6a ff                	push   $0xffffffff
    110b:	6a 03                	push   $0x3
    110d:	eb 46                	jmp    1155 <exception>

0000110f <overflow_trap>:
    110f:	6a ff                	push   $0xffffffff
    1111:	6a 04                	push   $0x4
    1113:	eb 40                	jmp    1155 <exception>

00001115 <bound_range_exceeded_fault>:
    1115:	6a ff                	push   $0xffffffff
    1117:	6a 05                	push   $0x5
    1119:	eb 3a                	jmp    1155 <exception>

0000111b <invalid_opcode_fault>:
    111b:	6a ff                	push   $0xffffffff
    111d:	6a 06                	push   $0x6
    111f:	eb 34                	jmp    1155 <exception>

00001121 <coprocessor_not_available_fault>:
    1121:	6a ff                	push   $0xffffffff
    1123:	6a 07                	push   $0x7
    1125:	eb 2e                	jmp    1155 <exception>

00001127 <double_fault_exception_abort>:
    1127:	6a 08                	push   $0x8
    1129:	eb 2a                	jmp    1155 <exception>

0000112b <coprocessor_segment_overrun>:
    112b:	6a ff                	push   $0xffffffff
    112d:	6a 09                	push   $0x9
    112f:	eb 24                	jmp    1155 <exception>

00001131 <invalid_task_state_segment_fault>:
    1131:	6a 0a                	push   $0xa
    1133:	eb 20                	jmp    1155 <exception>

00001135 <segment_not_present_fault>:
    1135:	6a 0b                	push   $0xb
    1137:	eb 1c                	jmp    1155 <exception>

00001139 <stack_exception_fault>:
    1139:	6a 0c                	push   $0xc
    113b:	eb 18                	jmp    1155 <exception>

0000113d <general_protection_exception_fault>:
    113d:	6a 0d                	push   $0xd
    113f:	eb 14                	jmp    1155 <exception>

00001141 <page_fault>:
    1141:	6a 0e                	push   $0xe
    1143:	eb 10                	jmp    1155 <exception>

00001145 <coprocessor_error_fault>:
    1145:	6a ff                	push   $0xffffffff
    1147:	6a 10                	push   $0x10
    1149:	eb 0a                	jmp    1155 <exception>

0000114b <align_check_fault>:
    114b:	6a 11                	push   $0x11
    114d:	eb 06                	jmp    1155 <exception>

0000114f <simd_float_exception_fault>:
    114f:	6a ff                	push   $0xffffffff
    1151:	6a 12                	push   $0x12
    1153:	eb 00                	jmp    1155 <exception>

00001155 <exception>:
    1155:	e8 7c 04 00 00       	call   15d6 <exception_handler>
    115a:	83 c4 08             	add    $0x8,%esp
    115d:	f4                   	hlt    

0000115e <hwint0>:
    115e:	60                   	pusha  
    115f:	1e                   	push   %ds
    1160:	06                   	push   %es
    1161:	0f a0                	push   %fs
    1163:	0f a8                	push   %gs
    1165:	66 8c d2             	mov    %ss,%dx
    1168:	8e da                	mov    %edx,%ds
    116a:	8e c2                	mov    %edx,%es
    116c:	8e e2                	mov    %edx,%fs
    116e:	b0 fd                	mov    $0xfd,%al
    1170:	e6 21                	out    %al,$0x21
    1172:	b0 20                	mov    $0x20,%al
    1174:	e6 20                	out    %al,$0x20
    1176:	ff 05 94 9e 00 00    	incl   0x9e94
    117c:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    1183:	75 05                	jne    118a <hwint0.2>

00001185 <hwint0.1>:
    1185:	bc 80 9e 00 00       	mov    $0x9e80,%esp

0000118a <hwint0.2>:
    118a:	fb                   	sti    
    118b:	e8 7c 3c 00 00       	call   4e0c <clock_handler>
    1190:	b0 fc                	mov    $0xfc,%al
    1192:	e6 21                	out    %al,$0x21
    1194:	fa                   	cli    
    1195:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    119c:	0f 85 1a 01 00 00    	jne    12bc <reenter_restore>
    11a2:	e9 01 01 00 00       	jmp    12a8 <restore>

000011a7 <hwint1>:
    11a7:	60                   	pusha  
    11a8:	1e                   	push   %ds
    11a9:	06                   	push   %es
    11aa:	0f a0                	push   %fs
    11ac:	0f a8                	push   %gs
    11ae:	66 8c d2             	mov    %ss,%dx
    11b1:	8e da                	mov    %edx,%ds
    11b3:	8e c2                	mov    %edx,%es
    11b5:	8e e2                	mov    %edx,%fs
    11b7:	b0 fe                	mov    $0xfe,%al
    11b9:	e6 21                	out    %al,$0x21
    11bb:	b0 20                	mov    $0x20,%al
    11bd:	e6 20                	out    %al,$0x20
    11bf:	ff 05 94 9e 00 00    	incl   0x9e94
    11c5:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    11cc:	75 05                	jne    11d3 <hwint1.2>

000011ce <hwint1.1>:
    11ce:	bc 80 9e 00 00       	mov    $0x9e80,%esp

000011d3 <hwint1.2>:
    11d3:	fb                   	sti    
    11d4:	e8 ee 49 00 00       	call   5bc7 <keyboard_handler>
    11d9:	b0 fc                	mov    $0xfc,%al
    11db:	e6 21                	out    %al,$0x21
    11dd:	fa                   	cli    
    11de:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    11e5:	0f 85 d1 00 00 00    	jne    12bc <reenter_restore>
    11eb:	e9 b8 00 00 00       	jmp    12a8 <restore>

000011f0 <hwint14>:
    11f0:	60                   	pusha  
    11f1:	1e                   	push   %ds
    11f2:	06                   	push   %es
    11f3:	0f a0                	push   %fs
    11f5:	0f a8                	push   %gs
    11f7:	66 8c d2             	mov    %ss,%dx
    11fa:	8e da                	mov    %edx,%ds
    11fc:	8e c2                	mov    %edx,%es
    11fe:	8e e2                	mov    %edx,%fs
    1200:	66 87 db             	xchg   %bx,%bx
    1203:	b0 ff                	mov    $0xff,%al
    1205:	e6 a1                	out    %al,$0xa1
    1207:	b0 20                	mov    $0x20,%al
    1209:	e6 20                	out    %al,$0x20
    120b:	90                   	nop
    120c:	90                   	nop
    120d:	e6 a0                	out    %al,$0xa0
    120f:	ff 05 94 9e 00 00    	incl   0x9e94
    1215:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    121c:	75 05                	jne    1223 <hwint14.2>

0000121e <hwint14.1>:
    121e:	bc 80 9e 00 00       	mov    $0x9e80,%esp

00001223 <hwint14.2>:
    1223:	fb                   	sti    
    1224:	e8 82 25 00 00       	call   37ab <hd_handler>
    1229:	fa                   	cli    
    122a:	b0 bf                	mov    $0xbf,%al
    122c:	e6 a1                	out    %al,$0xa1
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
    1319:	e8 62 fd ff ff       	call   1080 <disp_str>
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
    13c9:	e8 f6 4b 00 00       	call   5fc4 <open>
    13ce:	83 c4 10             	add    $0x10,%esp
    13d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    13d4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    13db:	c7 45 e0 00 20 00 00 	movl   $0x2000,-0x20(%ebp)
    13e2:	83 ec 04             	sub    $0x4,%esp
    13e5:	68 00 02 00 00       	push   $0x200
    13ea:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    13f0:	50                   	push   %eax
    13f1:	ff 75 e8             	pushl  -0x18(%ebp)
    13f4:	e8 2e 4c 00 00       	call   6027 <read>
    13f9:	83 c4 10             	add    $0x10,%esp
    13fc:	83 ec 0c             	sub    $0xc,%esp
    13ff:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    1405:	50                   	push   %eax
    1406:	e8 ea 54 00 00       	call   68f5 <Strlen>
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
    142d:	e8 92 4b 00 00       	call   5fc4 <open>
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
    14b6:	e8 6c 4b 00 00       	call   6027 <read>
    14bb:	83 c4 10             	add    $0x10,%esp
    14be:	83 ec 04             	sub    $0x4,%esp
    14c1:	ff 75 cc             	pushl  -0x34(%ebp)
    14c4:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    14ca:	50                   	push   %eax
    14cb:	ff 75 d4             	pushl  -0x2c(%ebp)
    14ce:	e8 8b 4b 00 00       	call   605e <write>
    14d3:	83 c4 10             	add    $0x10,%esp
    14d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    14d9:	29 45 ec             	sub    %eax,-0x14(%ebp)
    14dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14e0:	75 9f                	jne    1481 <untar+0xc9>
    14e2:	83 ec 0c             	sub    $0xc,%esp
    14e5:	ff 75 d4             	pushl  -0x2c(%ebp)
    14e8:	e8 a8 4b 00 00       	call   6095 <close>
    14ed:	83 c4 10             	add    $0x10,%esp
    14f0:	e9 ed fe ff ff       	jmp    13e2 <untar+0x2a>
    14f5:	90                   	nop
    14f6:	83 ec 0c             	sub    $0xc,%esp
    14f9:	ff 75 e8             	pushl  -0x18(%ebp)
    14fc:	e8 94 4b 00 00       	call   6095 <close>
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
    15cb:	e8 eb fa ff ff       	call   10bb <disp_str_colour>
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
    15e2:	bb 20 63 00 00       	mov    $0x6320,%ebx
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
    160a:	68 00 61 00 00       	push   $0x6100
    160f:	e8 6c fa ff ff       	call   1080 <disp_str>
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
    1648:	e8 6e fa ff ff       	call   10bb <disp_str_colour>
    164d:	83 c4 10             	add    $0x10,%esp
    1650:	83 ec 0c             	sub    $0xc,%esp
    1653:	68 02 61 00 00       	push   $0x6102
    1658:	e8 23 fa ff ff       	call   1080 <disp_str>
    165d:	83 c4 10             	add    $0x10,%esp
    1660:	83 ec 08             	sub    $0x8,%esp
    1663:	ff 75 e0             	pushl  -0x20(%ebp)
    1666:	68 05 61 00 00       	push   $0x6105
    166b:	e8 4b fa ff ff       	call   10bb <disp_str_colour>
    1670:	83 c4 10             	add    $0x10,%esp
    1673:	83 ec 0c             	sub    $0xc,%esp
    1676:	ff 75 08             	pushl  0x8(%ebp)
    1679:	e8 2f ff ff ff       	call   15ad <disp_int>
    167e:	83 c4 10             	add    $0x10,%esp
    1681:	83 ec 0c             	sub    $0xc,%esp
    1684:	68 02 61 00 00       	push   $0x6102
    1689:	e8 f2 f9 ff ff       	call   1080 <disp_str>
    168e:	83 c4 10             	add    $0x10,%esp
    1691:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
    1695:	74 31                	je     16c8 <exception_handler+0xf2>
    1697:	83 ec 08             	sub    $0x8,%esp
    169a:	ff 75 e0             	pushl  -0x20(%ebp)
    169d:	68 0d 61 00 00       	push   $0x610d
    16a2:	e8 14 fa ff ff       	call   10bb <disp_str_colour>
    16a7:	83 c4 10             	add    $0x10,%esp
    16aa:	83 ec 0c             	sub    $0xc,%esp
    16ad:	ff 75 0c             	pushl  0xc(%ebp)
    16b0:	e8 f8 fe ff ff       	call   15ad <disp_int>
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	83 ec 0c             	sub    $0xc,%esp
    16bb:	68 02 61 00 00       	push   $0x6102
    16c0:	e8 bb f9 ff ff       	call   1080 <disp_str>
    16c5:	83 c4 10             	add    $0x10,%esp
    16c8:	83 ec 08             	sub    $0x8,%esp
    16cb:	ff 75 e0             	pushl  -0x20(%ebp)
    16ce:	68 17 61 00 00       	push   $0x6117
    16d3:	e8 e3 f9 ff ff       	call   10bb <disp_str_colour>
    16d8:	83 c4 10             	add    $0x10,%esp
    16db:	83 ec 0c             	sub    $0xc,%esp
    16de:	ff 75 14             	pushl  0x14(%ebp)
    16e1:	e8 c7 fe ff ff       	call   15ad <disp_int>
    16e6:	83 c4 10             	add    $0x10,%esp
    16e9:	83 ec 0c             	sub    $0xc,%esp
    16ec:	68 02 61 00 00       	push   $0x6102
    16f1:	e8 8a f9 ff ff       	call   1080 <disp_str>
    16f6:	83 c4 10             	add    $0x10,%esp
    16f9:	83 ec 08             	sub    $0x8,%esp
    16fc:	ff 75 e0             	pushl  -0x20(%ebp)
    16ff:	68 1b 61 00 00       	push   $0x611b
    1704:	e8 b2 f9 ff ff       	call   10bb <disp_str_colour>
    1709:	83 c4 10             	add    $0x10,%esp
    170c:	83 ec 0c             	sub    $0xc,%esp
    170f:	ff 75 10             	pushl  0x10(%ebp)
    1712:	e8 96 fe ff ff       	call   15ad <disp_int>
    1717:	83 c4 10             	add    $0x10,%esp
    171a:	83 ec 0c             	sub    $0xc,%esp
    171d:	68 02 61 00 00       	push   $0x6102
    1722:	e8 59 f9 ff ff       	call   1080 <disp_str>
    1727:	83 c4 10             	add    $0x10,%esp
    172a:	83 ec 08             	sub    $0x8,%esp
    172d:	ff 75 e0             	pushl  -0x20(%ebp)
    1730:	68 20 61 00 00       	push   $0x6120
    1735:	e8 81 f9 ff ff       	call   10bb <disp_str_colour>
    173a:	83 c4 10             	add    $0x10,%esp
    173d:	83 ec 0c             	sub    $0xc,%esp
    1740:	ff 75 18             	pushl  0x18(%ebp)
    1743:	e8 65 fe ff ff       	call   15ad <disp_int>
    1748:	83 c4 10             	add    $0x10,%esp
    174b:	83 ec 0c             	sub    $0xc,%esp
    174e:	68 02 61 00 00       	push   $0x6102
    1753:	e8 28 f9 ff ff       	call   1080 <disp_str>
    1758:	83 c4 10             	add    $0x10,%esp
    175b:	90                   	nop
    175c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    175f:	5b                   	pop    %ebx
    1760:	5e                   	pop    %esi
    1761:	5f                   	pop    %edi
    1762:	5d                   	pop    %ebp
    1763:	c3                   	ret    

00001764 <init_internal_interrupt>:
    1764:	55                   	push   %ebp
    1765:	89 e5                	mov    %esp,%ebp
    1767:	83 ec 08             	sub    $0x8,%esp
    176a:	6a 0e                	push   $0xe
    176c:	6a 08                	push   $0x8
    176e:	68 f7 10 00 00       	push   $0x10f7
    1773:	6a 00                	push   $0x0
    1775:	e8 d0 39 00 00       	call   514a <InitInterruptDesc>
    177a:	83 c4 10             	add    $0x10,%esp
    177d:	6a 0e                	push   $0xe
    177f:	6a 08                	push   $0x8
    1781:	68 fd 10 00 00       	push   $0x10fd
    1786:	6a 01                	push   $0x1
    1788:	e8 bd 39 00 00       	call   514a <InitInterruptDesc>
    178d:	83 c4 10             	add    $0x10,%esp
    1790:	6a 0e                	push   $0xe
    1792:	6a 08                	push   $0x8
    1794:	68 03 11 00 00       	push   $0x1103
    1799:	6a 02                	push   $0x2
    179b:	e8 aa 39 00 00       	call   514a <InitInterruptDesc>
    17a0:	83 c4 10             	add    $0x10,%esp
    17a3:	6a 0e                	push   $0xe
    17a5:	6a 08                	push   $0x8
    17a7:	68 09 11 00 00       	push   $0x1109
    17ac:	6a 03                	push   $0x3
    17ae:	e8 97 39 00 00       	call   514a <InitInterruptDesc>
    17b3:	83 c4 10             	add    $0x10,%esp
    17b6:	6a 0e                	push   $0xe
    17b8:	6a 08                	push   $0x8
    17ba:	68 0f 11 00 00       	push   $0x110f
    17bf:	6a 04                	push   $0x4
    17c1:	e8 84 39 00 00       	call   514a <InitInterruptDesc>
    17c6:	83 c4 10             	add    $0x10,%esp
    17c9:	6a 0e                	push   $0xe
    17cb:	6a 08                	push   $0x8
    17cd:	68 15 11 00 00       	push   $0x1115
    17d2:	6a 05                	push   $0x5
    17d4:	e8 71 39 00 00       	call   514a <InitInterruptDesc>
    17d9:	83 c4 10             	add    $0x10,%esp
    17dc:	6a 0e                	push   $0xe
    17de:	6a 08                	push   $0x8
    17e0:	68 1b 11 00 00       	push   $0x111b
    17e5:	6a 06                	push   $0x6
    17e7:	e8 5e 39 00 00       	call   514a <InitInterruptDesc>
    17ec:	83 c4 10             	add    $0x10,%esp
    17ef:	6a 0e                	push   $0xe
    17f1:	6a 08                	push   $0x8
    17f3:	68 21 11 00 00       	push   $0x1121
    17f8:	6a 07                	push   $0x7
    17fa:	e8 4b 39 00 00       	call   514a <InitInterruptDesc>
    17ff:	83 c4 10             	add    $0x10,%esp
    1802:	6a 0e                	push   $0xe
    1804:	6a 08                	push   $0x8
    1806:	68 27 11 00 00       	push   $0x1127
    180b:	6a 08                	push   $0x8
    180d:	e8 38 39 00 00       	call   514a <InitInterruptDesc>
    1812:	83 c4 10             	add    $0x10,%esp
    1815:	6a 0e                	push   $0xe
    1817:	6a 08                	push   $0x8
    1819:	68 2b 11 00 00       	push   $0x112b
    181e:	6a 09                	push   $0x9
    1820:	e8 25 39 00 00       	call   514a <InitInterruptDesc>
    1825:	83 c4 10             	add    $0x10,%esp
    1828:	6a 0e                	push   $0xe
    182a:	6a 08                	push   $0x8
    182c:	68 31 11 00 00       	push   $0x1131
    1831:	6a 0a                	push   $0xa
    1833:	e8 12 39 00 00       	call   514a <InitInterruptDesc>
    1838:	83 c4 10             	add    $0x10,%esp
    183b:	6a 0e                	push   $0xe
    183d:	6a 08                	push   $0x8
    183f:	68 35 11 00 00       	push   $0x1135
    1844:	6a 0b                	push   $0xb
    1846:	e8 ff 38 00 00       	call   514a <InitInterruptDesc>
    184b:	83 c4 10             	add    $0x10,%esp
    184e:	6a 0e                	push   $0xe
    1850:	6a 08                	push   $0x8
    1852:	68 39 11 00 00       	push   $0x1139
    1857:	6a 0c                	push   $0xc
    1859:	e8 ec 38 00 00       	call   514a <InitInterruptDesc>
    185e:	83 c4 10             	add    $0x10,%esp
    1861:	6a 0e                	push   $0xe
    1863:	6a 08                	push   $0x8
    1865:	68 3d 11 00 00       	push   $0x113d
    186a:	6a 0d                	push   $0xd
    186c:	e8 d9 38 00 00       	call   514a <InitInterruptDesc>
    1871:	83 c4 10             	add    $0x10,%esp
    1874:	6a 0e                	push   $0xe
    1876:	6a 08                	push   $0x8
    1878:	68 41 11 00 00       	push   $0x1141
    187d:	6a 0e                	push   $0xe
    187f:	e8 c6 38 00 00       	call   514a <InitInterruptDesc>
    1884:	83 c4 10             	add    $0x10,%esp
    1887:	6a 0e                	push   $0xe
    1889:	6a 08                	push   $0x8
    188b:	68 45 11 00 00       	push   $0x1145
    1890:	6a 10                	push   $0x10
    1892:	e8 b3 38 00 00       	call   514a <InitInterruptDesc>
    1897:	83 c4 10             	add    $0x10,%esp
    189a:	6a 0e                	push   $0xe
    189c:	6a 08                	push   $0x8
    189e:	68 4b 11 00 00       	push   $0x114b
    18a3:	6a 11                	push   $0x11
    18a5:	e8 a0 38 00 00       	call   514a <InitInterruptDesc>
    18aa:	83 c4 10             	add    $0x10,%esp
    18ad:	6a 0e                	push   $0xe
    18af:	6a 08                	push   $0x8
    18b1:	68 4f 11 00 00       	push   $0x114f
    18b6:	6a 12                	push   $0x12
    18b8:	e8 8d 38 00 00       	call   514a <InitInterruptDesc>
    18bd:	83 c4 10             	add    $0x10,%esp
    18c0:	6a 0e                	push   $0xe
    18c2:	6a 0e                	push   $0xe
    18c4:	68 3d 12 00 00       	push   $0x123d
    18c9:	68 90 00 00 00       	push   $0x90
    18ce:	e8 77 38 00 00       	call   514a <InitInterruptDesc>
    18d3:	83 c4 10             	add    $0x10,%esp
    18d6:	90                   	nop
    18d7:	c9                   	leave  
    18d8:	c3                   	ret    

000018d9 <test>:
    18d9:	55                   	push   %ebp
    18da:	89 e5                	mov    %esp,%ebp
    18dc:	83 ec 18             	sub    $0x18,%esp
    18df:	83 ec 0c             	sub    $0xc,%esp
    18e2:	68 6c 63 00 00       	push   $0x636c
    18e7:	e8 94 f7 ff ff       	call   1080 <disp_str>
    18ec:	83 c4 10             	add    $0x10,%esp
    18ef:	83 ec 0c             	sub    $0xc,%esp
    18f2:	6a 06                	push   $0x6
    18f4:	e8 b4 fc ff ff       	call   15ad <disp_int>
    18f9:	83 c4 10             	add    $0x10,%esp
    18fc:	83 ec 0c             	sub    $0xc,%esp
    18ff:	68 6e 63 00 00       	push   $0x636e
    1904:	e8 77 f7 ff ff       	call   1080 <disp_str>
    1909:	83 c4 10             	add    $0x10,%esp
    190c:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1913:	00 00 00 
    1916:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    191d:	eb 14                	jmp    1933 <test+0x5a>
    191f:	83 ec 0c             	sub    $0xc,%esp
    1922:	68 00 61 00 00       	push   $0x6100
    1927:	e8 54 f7 ff ff       	call   1080 <disp_str>
    192c:	83 c4 10             	add    $0x10,%esp
    192f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1933:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    193a:	7e e3                	jle    191f <test+0x46>
    193c:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1943:	00 00 00 
    1946:	83 ec 08             	sub    $0x8,%esp
    1949:	6a 0f                	push   $0xf
    194b:	68 70 63 00 00       	push   $0x6370
    1950:	e8 66 f7 ff ff       	call   10bb <disp_str_colour>
    1955:	83 c4 10             	add    $0x10,%esp
    1958:	83 ec 0c             	sub    $0xc,%esp
    195b:	68 6e 63 00 00       	push   $0x636e
    1960:	e8 1b f7 ff ff       	call   1080 <disp_str>
    1965:	83 c4 10             	add    $0x10,%esp
    1968:	83 ec 0c             	sub    $0xc,%esp
    196b:	68 89 00 00 00       	push   $0x89
    1970:	e8 38 fc ff ff       	call   15ad <disp_int>
    1975:	83 c4 10             	add    $0x10,%esp
    1978:	83 ec 0c             	sub    $0xc,%esp
    197b:	68 6e 63 00 00       	push   $0x636e
    1980:	e8 fb f6 ff ff       	call   1080 <disp_str>
    1985:	83 c4 10             	add    $0x10,%esp
    1988:	83 ec 08             	sub    $0x8,%esp
    198b:	6a 0f                	push   $0xf
    198d:	68 70 63 00 00       	push   $0x6370
    1992:	e8 24 f7 ff ff       	call   10bb <disp_str_colour>
    1997:	83 c4 10             	add    $0x10,%esp
    199a:	83 ec 08             	sub    $0x8,%esp
    199d:	6a 74                	push   $0x74
    199f:	68 70 63 00 00       	push   $0x6370
    19a4:	e8 12 f7 ff ff       	call   10bb <disp_str_colour>
    19a9:	83 c4 10             	add    $0x10,%esp
    19ac:	83 ec 0c             	sub    $0xc,%esp
    19af:	68 6e 63 00 00       	push   $0x636e
    19b4:	e8 c7 f6 ff ff       	call   1080 <disp_str>
    19b9:	83 c4 10             	add    $0x10,%esp
    19bc:	83 ec 08             	sub    $0x8,%esp
    19bf:	6a 0f                	push   $0xf
    19c1:	68 80 63 00 00       	push   $0x6380
    19c6:	e8 f0 f6 ff ff       	call   10bb <disp_str_colour>
    19cb:	83 c4 10             	add    $0x10,%esp
    19ce:	83 ec 0c             	sub    $0xc,%esp
    19d1:	68 a9 63 00 00       	push   $0x63a9
    19d6:	e8 a5 f6 ff ff       	call   1080 <disp_str>
    19db:	83 c4 10             	add    $0x10,%esp
    19de:	83 ec 0c             	sub    $0xc,%esp
    19e1:	68 bd 63 00 00       	push   $0x63bd
    19e6:	e8 95 f6 ff ff       	call   1080 <disp_str>
    19eb:	83 c4 10             	add    $0x10,%esp
    19ee:	83 ec 0c             	sub    $0xc,%esp
    19f1:	6a 17                	push   $0x17
    19f3:	e8 b5 fb ff ff       	call   15ad <disp_int>
    19f8:	83 c4 10             	add    $0x10,%esp
    19fb:	83 ec 0c             	sub    $0xc,%esp
    19fe:	68 6e 63 00 00       	push   $0x636e
    1a03:	e8 78 f6 ff ff       	call   1080 <disp_str>
    1a08:	83 c4 10             	add    $0x10,%esp
    1a0b:	83 ec 0c             	sub    $0xc,%esp
    1a0e:	68 0a 02 00 00       	push   $0x20a
    1a13:	e8 95 fb ff ff       	call   15ad <disp_int>
    1a18:	83 c4 10             	add    $0x10,%esp
    1a1b:	83 ec 0c             	sub    $0xc,%esp
    1a1e:	68 6e 63 00 00       	push   $0x636e
    1a23:	e8 58 f6 ff ff       	call   1080 <disp_str>
    1a28:	83 c4 10             	add    $0x10,%esp
    1a2b:	90                   	nop
    1a2c:	c9                   	leave  
    1a2d:	c3                   	ret    

00001a2e <disp_str_colour3>:
    1a2e:	55                   	push   %ebp
    1a2f:	89 e5                	mov    %esp,%ebp
    1a31:	90                   	nop
    1a32:	5d                   	pop    %ebp
    1a33:	c3                   	ret    

00001a34 <spurious_irq>:
    1a34:	55                   	push   %ebp
    1a35:	89 e5                	mov    %esp,%ebp
    1a37:	83 ec 08             	sub    $0x8,%esp
    1a3a:	83 ec 08             	sub    $0x8,%esp
    1a3d:	6a 0b                	push   $0xb
    1a3f:	68 cc 63 00 00       	push   $0x63cc
    1a44:	e8 72 f6 ff ff       	call   10bb <disp_str_colour>
    1a49:	83 c4 10             	add    $0x10,%esp
    1a4c:	83 ec 0c             	sub    $0xc,%esp
    1a4f:	ff 75 08             	pushl  0x8(%ebp)
    1a52:	e8 56 fb ff ff       	call   15ad <disp_int>
    1a57:	83 c4 10             	add    $0x10,%esp
    1a5a:	a1 80 d4 00 00       	mov    0xd480,%eax
    1a5f:	83 c0 01             	add    $0x1,%eax
    1a62:	a3 80 d4 00 00       	mov    %eax,0xd480
    1a67:	83 ec 0c             	sub    $0xc,%esp
    1a6a:	68 f3 63 00 00       	push   $0x63f3
    1a6f:	e8 0c f6 ff ff       	call   1080 <disp_str>
    1a74:	83 c4 10             	add    $0x10,%esp
    1a77:	a1 80 d4 00 00       	mov    0xd480,%eax
    1a7c:	83 ec 0c             	sub    $0xc,%esp
    1a7f:	50                   	push   %eax
    1a80:	e8 28 fb ff ff       	call   15ad <disp_int>
    1a85:	83 c4 10             	add    $0x10,%esp
    1a88:	83 ec 0c             	sub    $0xc,%esp
    1a8b:	68 f5 63 00 00       	push   $0x63f5
    1a90:	e8 eb f5 ff ff       	call   1080 <disp_str>
    1a95:	83 c4 10             	add    $0x10,%esp
    1a98:	83 ec 08             	sub    $0x8,%esp
    1a9b:	6a 0c                	push   $0xc
    1a9d:	68 f8 63 00 00       	push   $0x63f8
    1aa2:	e8 14 f6 ff ff       	call   10bb <disp_str_colour>
    1aa7:	83 c4 10             	add    $0x10,%esp
    1aaa:	90                   	nop
    1aab:	c9                   	leave  
    1aac:	c3                   	ret    

00001aad <kernel_main>:
    1aad:	55                   	push   %ebp
    1aae:	89 e5                	mov    %esp,%ebp
    1ab0:	83 ec 28             	sub    $0x28,%esp
    1ab3:	c7 05 80 d4 00 00 00 	movl   $0x0,0xd480
    1aba:	00 00 00 
    1abd:	c7 05 70 cc 00 00 00 	movl   $0x0,0xcc70
    1ac4:	00 00 00 
    1ac7:	c7 05 94 9e 00 00 00 	movl   $0x0,0x9e94
    1ace:	00 00 00 
    1ad1:	c7 45 e8 20 4f 01 00 	movl   $0x14f20,-0x18(%ebp)
    1ad8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1adf:	e9 90 01 00 00       	jmp    1c74 <kernel_main+0x1c7>
    1ae4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ae7:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    1aed:	05 20 4f 01 00       	add    $0x14f20,%eax
    1af2:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1af5:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
    1af9:	7f 3f                	jg     1b3a <kernel_main+0x8d>
    1afb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1afe:	c1 e0 03             	shl    $0x3,%eax
    1b01:	05 40 90 00 00       	add    $0x9040,%eax
    1b06:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b09:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
    1b10:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    1b14:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
    1b18:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b1b:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
    1b22:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b25:	8b 50 60             	mov    0x60(%eax),%edx
    1b28:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b2b:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b2e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b31:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
    1b38:	eb 46                	jmp    1b80 <kernel_main+0xd3>
    1b3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b3d:	05 fc ff ff 1f       	add    $0x1ffffffc,%eax
    1b42:	c1 e0 03             	shl    $0x3,%eax
    1b45:	05 20 90 00 00       	add    $0x9020,%eax
    1b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b4d:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
    1b54:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
    1b58:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
    1b5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b5f:	c7 40 60 0a 00 00 00 	movl   $0xa,0x60(%eax)
    1b66:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b69:	8b 50 60             	mov    0x60(%eax),%edx
    1b6c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b6f:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b72:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b75:	83 e8 04             	sub    $0x4,%eax
    1b78:	89 c2                	mov    %eax,%edx
    1b7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b7d:	89 50 64             	mov    %edx,0x64(%eax)
    1b80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b83:	83 c0 09             	add    $0x9,%eax
    1b86:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1b8d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b90:	66 89 50 44          	mov    %dx,0x44(%eax)
    1b94:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1b97:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b9a:	89 50 58             	mov    %edx,0x58(%eax)
    1b9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ba0:	83 c0 46             	add    $0x46,%eax
    1ba3:	83 ec 04             	sub    $0x4,%esp
    1ba6:	6a 08                	push   $0x8
    1ba8:	68 a8 9e 00 00       	push   $0x9ea8
    1bad:	50                   	push   %eax
    1bae:	e8 db 4c 00 00       	call   688e <Memcpy>
    1bb3:	83 c4 10             	add    $0x10,%esp
    1bb6:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1bba:	c1 e0 05             	shl    $0x5,%eax
    1bbd:	83 c8 9a             	or     $0xffffff9a,%eax
    1bc0:	89 c2                	mov    %eax,%edx
    1bc2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bc5:	88 50 4b             	mov    %dl,0x4b(%eax)
    1bc8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bcb:	83 c0 4e             	add    $0x4e,%eax
    1bce:	83 ec 04             	sub    $0x4,%esp
    1bd1:	6a 08                	push   $0x8
    1bd3:	68 d0 9e 00 00       	push   $0x9ed0
    1bd8:	50                   	push   %eax
    1bd9:	e8 b0 4c 00 00       	call   688e <Memcpy>
    1bde:	83 c4 10             	add    $0x10,%esp
    1be1:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1be5:	c1 e0 05             	shl    $0x5,%eax
    1be8:	83 c8 92             	or     $0xffffff92,%eax
    1beb:	89 c2                	mov    %eax,%edx
    1bed:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bf0:	88 50 53             	mov    %dl,0x53(%eax)
    1bf3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1bf7:	83 c8 04             	or     $0x4,%eax
    1bfa:	0f b6 c0             	movzbl %al,%eax
    1bfd:	66 89 45 da          	mov    %ax,-0x26(%ebp)
    1c01:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c05:	83 c8 0c             	or     $0xc,%eax
    1c08:	0f b6 c0             	movzbl %al,%eax
    1c0b:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
    1c0f:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
    1c13:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c16:	89 50 34             	mov    %edx,0x34(%eax)
    1c19:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c1d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c20:	89 50 0c             	mov    %edx,0xc(%eax)
    1c23:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c27:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c2a:	89 50 04             	mov    %edx,0x4(%eax)
    1c2d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c31:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c34:	89 50 08             	mov    %edx,0x8(%eax)
    1c37:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c3e:	89 50 40             	mov    %edx,0x40(%eax)
    1c41:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c44:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
    1c4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c4d:	8b 00                	mov    (%eax),%eax
    1c4f:	89 c2                	mov    %eax,%edx
    1c51:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c54:	89 50 30             	mov    %edx,0x30(%eax)
    1c57:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1c5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c5d:	89 50 3c             	mov    %edx,0x3c(%eax)
    1c60:	81 6d e8 00 04 00 00 	subl   $0x400,-0x18(%ebp)
    1c67:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c6a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c6d:	89 50 38             	mov    %edx,0x38(%eax)
    1c70:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1c74:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
    1c78:	0f 8e 66 fe ff ff    	jle    1ae4 <kernel_main+0x37>
    1c7e:	c7 05 a0 a2 00 00 20 	movl   $0x14f20,0xa2a0
    1c85:	4f 01 00 
    1c88:	83 ec 04             	sub    $0x4,%esp
    1c8b:	68 20 03 00 00       	push   $0x320
    1c90:	6a 00                	push   $0x0
    1c92:	68 cc a2 00 00       	push   $0xa2cc
    1c97:	e8 20 4c 00 00       	call   68bc <Memset>
    1c9c:	83 c4 10             	add    $0x10,%esp
    1c9f:	c7 05 c0 a2 00 00 cc 	movl   $0xa2cc,0xa2c0
    1ca6:	a2 00 00 
    1ca9:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    1cae:	a3 c4 a2 00 00       	mov    %eax,0xa2c4
    1cb3:	c7 05 c8 a2 00 00 00 	movl   $0x0,0xa2c8
    1cba:	00 00 00 
    1cbd:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1cc4:	00 00 00 
    1cc7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1cce:	eb 14                	jmp    1ce4 <kernel_main+0x237>
    1cd0:	83 ec 0c             	sub    $0xc,%esp
    1cd3:	68 00 61 00 00       	push   $0x6100
    1cd8:	e8 a3 f3 ff ff       	call   1080 <disp_str>
    1cdd:	83 c4 10             	add    $0x10,%esp
    1ce0:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1ce4:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
    1ceb:	7e e3                	jle    1cd0 <kernel_main+0x223>
    1ced:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1cf4:	00 00 00 
    1cf7:	e8 22 41 00 00       	call   5e1e <init_keyboard_handler>
    1cfc:	e8 85 f5 ff ff       	call   1286 <restart>
    1d01:	eb fe                	jmp    1d01 <kernel_main+0x254>

00001d03 <TestA>:
    1d03:	55                   	push   %ebp
    1d04:	89 e5                	mov    %esp,%ebp
    1d06:	83 ec 18             	sub    $0x18,%esp
    1d09:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d10:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d14:	74 1c                	je     1d32 <TestA+0x2f>
    1d16:	68 8b 01 00 00       	push   $0x18b
    1d1b:	68 1d 64 00 00       	push   $0x641d
    1d20:	68 1d 64 00 00       	push   $0x641d
    1d25:	68 24 64 00 00       	push   $0x6424
    1d2a:	e8 1f 05 00 00       	call   224e <assertion_failure>
    1d2f:	83 c4 10             	add    $0x10,%esp
    1d32:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1d36:	77 16                	ja     1d4e <TestA+0x4b>
    1d38:	e8 ed 0c 00 00       	call   2a2a <get_ticks_ipc>
    1d3d:	83 ec 08             	sub    $0x8,%esp
    1d40:	50                   	push   %eax
    1d41:	68 2b 64 00 00       	push   $0x642b
    1d46:	e8 b6 01 00 00       	call   1f01 <Printf>
    1d4b:	83 c4 10             	add    $0x10,%esp
    1d4e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d52:	eb de                	jmp    1d32 <TestA+0x2f>

00001d54 <delay>:
    1d54:	55                   	push   %ebp
    1d55:	89 e5                	mov    %esp,%ebp
    1d57:	83 ec 10             	sub    $0x10,%esp
    1d5a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1d61:	eb 2d                	jmp    1d90 <delay+0x3c>
    1d63:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1d6a:	eb 1a                	jmp    1d86 <delay+0x32>
    1d6c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d73:	eb 04                	jmp    1d79 <delay+0x25>
    1d75:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d79:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    1d80:	7e f3                	jle    1d75 <delay+0x21>
    1d82:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1d86:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
    1d8a:	7e e0                	jle    1d6c <delay+0x18>
    1d8c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1d90:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1d93:	3b 45 08             	cmp    0x8(%ebp),%eax
    1d96:	7c cb                	jl     1d63 <delay+0xf>
    1d98:	90                   	nop
    1d99:	c9                   	leave  
    1d9a:	c3                   	ret    

00001d9b <TestB>:
    1d9b:	55                   	push   %ebp
    1d9c:	89 e5                	mov    %esp,%ebp
    1d9e:	83 ec 18             	sub    $0x18,%esp
    1da1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1da8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1dac:	77 16                	ja     1dc4 <TestB+0x29>
    1dae:	e8 77 0c 00 00       	call   2a2a <get_ticks_ipc>
    1db3:	83 ec 08             	sub    $0x8,%esp
    1db6:	50                   	push   %eax
    1db7:	68 2e 64 00 00       	push   $0x642e
    1dbc:	e8 40 01 00 00       	call   1f01 <Printf>
    1dc1:	83 c4 10             	add    $0x10,%esp
    1dc4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1dc8:	eb de                	jmp    1da8 <TestB+0xd>

00001dca <TestC>:
    1dca:	55                   	push   %ebp
    1dcb:	89 e5                	mov    %esp,%ebp
    1dcd:	83 ec 18             	sub    $0x18,%esp
    1dd0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1dd7:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1ddb:	77 1a                	ja     1df7 <TestC+0x2d>
    1ddd:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
    1de4:	83 ec 08             	sub    $0x8,%esp
    1de7:	ff 75 f0             	pushl  -0x10(%ebp)
    1dea:	68 35 64 00 00       	push   $0x6435
    1def:	e8 0d 01 00 00       	call   1f01 <Printf>
    1df4:	83 c4 10             	add    $0x10,%esp
    1df7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1dfb:	eb da                	jmp    1dd7 <TestC+0xd>

00001dfd <sys_get_ticks>:
    1dfd:	55                   	push   %ebp
    1dfe:	89 e5                	mov    %esp,%ebp
    1e00:	a1 80 d4 00 00       	mov    0xd480,%eax
    1e05:	5d                   	pop    %ebp
    1e06:	c3                   	ret    

00001e07 <sys_write>:
    1e07:	55                   	push   %ebp
    1e08:	89 e5                	mov    %esp,%ebp
    1e0a:	83 ec 18             	sub    $0x18,%esp
    1e0d:	8b 45 10             	mov    0x10(%ebp),%eax
    1e10:	8b 40 64             	mov    0x64(%eax),%eax
    1e13:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    1e19:	05 00 a6 00 00       	add    $0xa600,%eax
    1e1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1e21:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e24:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1e27:	8b 45 08             	mov    0x8(%ebp),%eax
    1e2a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e2d:	eb 20                	jmp    1e4f <sys_write+0x48>
    1e2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e32:	0f b6 00             	movzbl (%eax),%eax
    1e35:	0f b6 c0             	movzbl %al,%eax
    1e38:	83 ec 08             	sub    $0x8,%esp
    1e3b:	50                   	push   %eax
    1e3c:	ff 75 ec             	pushl  -0x14(%ebp)
    1e3f:	e8 3e 36 00 00       	call   5482 <out_char>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1e4b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1e4f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e53:	7f da                	jg     1e2f <sys_write+0x28>
    1e55:	90                   	nop
    1e56:	c9                   	leave  
    1e57:	c3                   	ret    

00001e58 <milli_delay>:
    1e58:	55                   	push   %ebp
    1e59:	89 e5                	mov    %esp,%ebp
    1e5b:	83 ec 18             	sub    $0x18,%esp
    1e5e:	e8 c7 0b 00 00       	call   2a2a <get_ticks_ipc>
    1e63:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1e66:	90                   	nop
    1e67:	e8 be 0b 00 00       	call   2a2a <get_ticks_ipc>
    1e6c:	2b 45 f4             	sub    -0xc(%ebp),%eax
    1e6f:	89 c1                	mov    %eax,%ecx
    1e71:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1e76:	89 c8                	mov    %ecx,%eax
    1e78:	f7 ea                	imul   %edx
    1e7a:	c1 fa 05             	sar    $0x5,%edx
    1e7d:	89 c8                	mov    %ecx,%eax
    1e7f:	c1 f8 1f             	sar    $0x1f,%eax
    1e82:	29 c2                	sub    %eax,%edx
    1e84:	89 d0                	mov    %edx,%eax
    1e86:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
    1e8c:	39 45 08             	cmp    %eax,0x8(%ebp)
    1e8f:	77 d6                	ja     1e67 <milli_delay+0xf>
    1e91:	90                   	nop
    1e92:	c9                   	leave  
    1e93:	c3                   	ret    

00001e94 <TaskSys>:
    1e94:	55                   	push   %ebp
    1e95:	89 e5                	mov    %esp,%ebp
    1e97:	81 ec 88 00 00 00    	sub    $0x88,%esp
    1e9d:	83 ec 04             	sub    $0x4,%esp
    1ea0:	6a 68                	push   $0x68
    1ea2:	6a 00                	push   $0x0
    1ea4:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1ea7:	50                   	push   %eax
    1ea8:	e8 0f 4a 00 00       	call   68bc <Memset>
    1ead:	83 c4 10             	add    $0x10,%esp
    1eb0:	83 ec 08             	sub    $0x8,%esp
    1eb3:	6a 11                	push   $0x11
    1eb5:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1eb8:	50                   	push   %eax
    1eb9:	e8 aa 19 00 00       	call   3868 <receive_msg>
    1ebe:	83 c4 10             	add    $0x10,%esp
    1ec1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1ec4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ec8:	75 34                	jne    1efe <TaskSys+0x6a>
    1eca:	8b 45 88             	mov    -0x78(%ebp),%eax
    1ecd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1ed0:	8b 45 84             	mov    -0x7c(%ebp),%eax
    1ed3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1ed6:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1eda:	75 1f                	jne    1efb <TaskSys+0x67>
    1edc:	a1 80 d4 00 00       	mov    0xd480,%eax
    1ee1:	89 45 8c             	mov    %eax,-0x74(%ebp)
    1ee4:	83 ec 08             	sub    $0x8,%esp
    1ee7:	ff 75 ec             	pushl  -0x14(%ebp)
    1eea:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1eed:	50                   	push   %eax
    1eee:	e8 65 19 00 00       	call   3858 <send_msg>
    1ef3:	83 c4 10             	add    $0x10,%esp
    1ef6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1ef9:	eb 01                	jmp    1efc <TaskSys+0x68>
    1efb:	90                   	nop
    1efc:	eb 9f                	jmp    1e9d <TaskSys+0x9>
    1efe:	90                   	nop
    1eff:	c9                   	leave  
    1f00:	c3                   	ret    

00001f01 <Printf>:
    1f01:	55                   	push   %ebp
    1f02:	89 e5                	mov    %esp,%ebp
    1f04:	81 ec 18 01 00 00    	sub    $0x118,%esp
    1f0a:	83 ec 04             	sub    $0x4,%esp
    1f0d:	68 00 01 00 00       	push   $0x100
    1f12:	6a 00                	push   $0x0
    1f14:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f1a:	50                   	push   %eax
    1f1b:	e8 9c 49 00 00       	call   68bc <Memset>
    1f20:	83 c4 10             	add    $0x10,%esp
    1f23:	8d 45 0c             	lea    0xc(%ebp),%eax
    1f26:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1f29:	8b 45 08             	mov    0x8(%ebp),%eax
    1f2c:	83 ec 04             	sub    $0x4,%esp
    1f2f:	ff 75 f4             	pushl  -0xc(%ebp)
    1f32:	50                   	push   %eax
    1f33:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f39:	50                   	push   %eax
    1f3a:	e8 1e 00 00 00       	call   1f5d <vsprintf>
    1f3f:	83 c4 10             	add    $0x10,%esp
    1f42:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1f45:	83 ec 08             	sub    $0x8,%esp
    1f48:	ff 75 f0             	pushl  -0x10(%ebp)
    1f4b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f51:	50                   	push   %eax
    1f52:	e8 e1 18 00 00       	call   3838 <write2>
    1f57:	83 c4 10             	add    $0x10,%esp
    1f5a:	90                   	nop
    1f5b:	c9                   	leave  
    1f5c:	c3                   	ret    

00001f5d <vsprintf>:
    1f5d:	55                   	push   %ebp
    1f5e:	89 e5                	mov    %esp,%ebp
    1f60:	81 ec 68 02 00 00    	sub    $0x268,%esp
    1f66:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    1f6c:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
    1f72:	83 ec 04             	sub    $0x4,%esp
    1f75:	6a 40                	push   $0x40
    1f77:	6a 00                	push   $0x0
    1f79:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    1f7f:	50                   	push   %eax
    1f80:	e8 37 49 00 00       	call   68bc <Memset>
    1f85:	83 c4 10             	add    $0x10,%esp
    1f88:	8b 45 10             	mov    0x10(%ebp),%eax
    1f8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1f8e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1f95:	8b 45 08             	mov    0x8(%ebp),%eax
    1f98:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1f9b:	e9 53 01 00 00       	jmp    20f3 <vsprintf+0x196>
    1fa0:	8b 45 0c             	mov    0xc(%ebp),%eax
    1fa3:	0f b6 00             	movzbl (%eax),%eax
    1fa6:	3c 25                	cmp    $0x25,%al
    1fa8:	74 16                	je     1fc0 <vsprintf+0x63>
    1faa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fad:	8d 50 01             	lea    0x1(%eax),%edx
    1fb0:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1fb3:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fb6:	0f b6 12             	movzbl (%edx),%edx
    1fb9:	88 10                	mov    %dl,(%eax)
    1fbb:	e9 2f 01 00 00       	jmp    20ef <vsprintf+0x192>
    1fc0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1fc4:	8b 45 0c             	mov    0xc(%ebp),%eax
    1fc7:	0f b6 00             	movzbl (%eax),%eax
    1fca:	0f be c0             	movsbl %al,%eax
    1fcd:	83 f8 64             	cmp    $0x64,%eax
    1fd0:	74 26                	je     1ff8 <vsprintf+0x9b>
    1fd2:	83 f8 64             	cmp    $0x64,%eax
    1fd5:	7f 0e                	jg     1fe5 <vsprintf+0x88>
    1fd7:	83 f8 63             	cmp    $0x63,%eax
    1fda:	0f 84 f2 00 00 00    	je     20d2 <vsprintf+0x175>
    1fe0:	e9 0a 01 00 00       	jmp    20ef <vsprintf+0x192>
    1fe5:	83 f8 73             	cmp    $0x73,%eax
    1fe8:	0f 84 b0 00 00 00    	je     209e <vsprintf+0x141>
    1fee:	83 f8 78             	cmp    $0x78,%eax
    1ff1:	74 5d                	je     2050 <vsprintf+0xf3>
    1ff3:	e9 f7 00 00 00       	jmp    20ef <vsprintf+0x192>
    1ff8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ffb:	8b 00                	mov    (%eax),%eax
    1ffd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2000:	83 ec 04             	sub    $0x4,%esp
    2003:	6a 0a                	push   $0xa
    2005:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    200b:	50                   	push   %eax
    200c:	ff 75 e8             	pushl  -0x18(%ebp)
    200f:	e8 57 0a 00 00       	call   2a6b <itoa>
    2014:	83 c4 10             	add    $0x10,%esp
    2017:	83 ec 08             	sub    $0x8,%esp
    201a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2020:	50                   	push   %eax
    2021:	ff 75 f4             	pushl  -0xc(%ebp)
    2024:	e8 b2 48 00 00       	call   68db <Strcpy>
    2029:	83 c4 10             	add    $0x10,%esp
    202c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2030:	83 ec 0c             	sub    $0xc,%esp
    2033:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2039:	50                   	push   %eax
    203a:	e8 b6 48 00 00       	call   68f5 <Strlen>
    203f:	83 c4 10             	add    $0x10,%esp
    2042:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2045:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2048:	01 45 f4             	add    %eax,-0xc(%ebp)
    204b:	e9 9f 00 00 00       	jmp    20ef <vsprintf+0x192>
    2050:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2053:	8b 00                	mov    (%eax),%eax
    2055:	83 ec 08             	sub    $0x8,%esp
    2058:	50                   	push   %eax
    2059:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    205f:	50                   	push   %eax
    2060:	e8 a2 f4 ff ff       	call   1507 <atoi>
    2065:	83 c4 10             	add    $0x10,%esp
    2068:	83 ec 08             	sub    $0x8,%esp
    206b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2071:	50                   	push   %eax
    2072:	ff 75 f4             	pushl  -0xc(%ebp)
    2075:	e8 61 48 00 00       	call   68db <Strcpy>
    207a:	83 c4 10             	add    $0x10,%esp
    207d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    2081:	83 ec 0c             	sub    $0xc,%esp
    2084:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    208a:	50                   	push   %eax
    208b:	e8 65 48 00 00       	call   68f5 <Strlen>
    2090:	83 c4 10             	add    $0x10,%esp
    2093:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2096:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2099:	01 45 f4             	add    %eax,-0xc(%ebp)
    209c:	eb 51                	jmp    20ef <vsprintf+0x192>
    209e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20a1:	8b 00                	mov    (%eax),%eax
    20a3:	83 ec 08             	sub    $0x8,%esp
    20a6:	50                   	push   %eax
    20a7:	ff 75 f4             	pushl  -0xc(%ebp)
    20aa:	e8 2c 48 00 00       	call   68db <Strcpy>
    20af:	83 c4 10             	add    $0x10,%esp
    20b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20b5:	8b 00                	mov    (%eax),%eax
    20b7:	83 ec 0c             	sub    $0xc,%esp
    20ba:	50                   	push   %eax
    20bb:	e8 35 48 00 00       	call   68f5 <Strlen>
    20c0:	83 c4 10             	add    $0x10,%esp
    20c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    20c6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    20ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20cd:	01 45 f4             	add    %eax,-0xc(%ebp)
    20d0:	eb 1d                	jmp    20ef <vsprintf+0x192>
    20d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20d5:	0f b6 10             	movzbl (%eax),%edx
    20d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20db:	88 10                	mov    %dl,(%eax)
    20dd:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    20e1:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    20e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20eb:	01 45 f4             	add    %eax,-0xc(%ebp)
    20ee:	90                   	nop
    20ef:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    20f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    20f6:	0f b6 00             	movzbl (%eax),%eax
    20f9:	84 c0                	test   %al,%al
    20fb:	0f 85 9f fe ff ff    	jne    1fa0 <vsprintf+0x43>
    2101:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2104:	2b 45 08             	sub    0x8(%ebp),%eax
    2107:	c9                   	leave  
    2108:	c3                   	ret    

00002109 <printx>:
    2109:	55                   	push   %ebp
    210a:	89 e5                	mov    %esp,%ebp
    210c:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2112:	8d 45 0c             	lea    0xc(%ebp),%eax
    2115:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2118:	8b 45 08             	mov    0x8(%ebp),%eax
    211b:	83 ec 04             	sub    $0x4,%esp
    211e:	ff 75 f4             	pushl  -0xc(%ebp)
    2121:	50                   	push   %eax
    2122:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2128:	50                   	push   %eax
    2129:	e8 2f fe ff ff       	call   1f5d <vsprintf>
    212e:	83 c4 10             	add    $0x10,%esp
    2131:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2134:	83 ec 08             	sub    $0x8,%esp
    2137:	ff 75 f0             	pushl  -0x10(%ebp)
    213a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2140:	50                   	push   %eax
    2141:	e8 02 17 00 00       	call   3848 <write_debug>
    2146:	83 c4 10             	add    $0x10,%esp
    2149:	90                   	nop
    214a:	c9                   	leave  
    214b:	c3                   	ret    

0000214c <sys_printx>:
    214c:	55                   	push   %ebp
    214d:	89 e5                	mov    %esp,%ebp
    214f:	83 ec 28             	sub    $0x28,%esp
    2152:	a1 94 9e 00 00       	mov    0x9e94,%eax
    2157:	85 c0                	test   %eax,%eax
    2159:	75 20                	jne    217b <sys_printx+0x2f>
    215b:	8b 45 10             	mov    0x10(%ebp),%eax
    215e:	8b 40 0c             	mov    0xc(%eax),%eax
    2161:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2164:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2167:	83 ec 08             	sub    $0x8,%esp
    216a:	ff 75 10             	pushl  0x10(%ebp)
    216d:	50                   	push   %eax
    216e:	e8 ce 2d 00 00       	call   4f41 <Seg2PhyAddrLDT>
    2173:	83 c4 10             	add    $0x10,%esp
    2176:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2179:	eb 19                	jmp    2194 <sys_printx+0x48>
    217b:	a1 94 9e 00 00       	mov    0x9e94,%eax
    2180:	85 c0                	test   %eax,%eax
    2182:	74 10                	je     2194 <sys_printx+0x48>
    2184:	83 ec 0c             	sub    $0xc,%esp
    2187:	6a 30                	push   $0x30
    2189:	e8 72 2d 00 00       	call   4f00 <Seg2PhyAddr>
    218e:	83 c4 10             	add    $0x10,%esp
    2191:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2194:	8b 55 08             	mov    0x8(%ebp),%edx
    2197:	8b 45 f4             	mov    -0xc(%ebp),%eax
    219a:	01 d0                	add    %edx,%eax
    219c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    219f:	8b 45 10             	mov    0x10(%ebp),%eax
    21a2:	8b 40 64             	mov    0x64(%eax),%eax
    21a5:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    21ab:	05 00 a6 00 00       	add    $0xa600,%eax
    21b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    21b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    21b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21bc:	0f b6 00             	movzbl (%eax),%eax
    21bf:	88 45 e3             	mov    %al,-0x1d(%ebp)
    21c2:	eb 3a                	jmp    21fe <sys_printx+0xb2>
    21c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21c7:	0f b6 00             	movzbl (%eax),%eax
    21ca:	3c 3b                	cmp    $0x3b,%al
    21cc:	74 0a                	je     21d8 <sys_printx+0x8c>
    21ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21d1:	0f b6 00             	movzbl (%eax),%eax
    21d4:	3c 3a                	cmp    $0x3a,%al
    21d6:	75 06                	jne    21de <sys_printx+0x92>
    21d8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    21dc:	eb 20                	jmp    21fe <sys_printx+0xb2>
    21de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21e1:	0f b6 00             	movzbl (%eax),%eax
    21e4:	0f b6 c0             	movzbl %al,%eax
    21e7:	83 ec 08             	sub    $0x8,%esp
    21ea:	50                   	push   %eax
    21eb:	ff 75 e4             	pushl  -0x1c(%ebp)
    21ee:	e8 8f 32 00 00       	call   5482 <out_char>
    21f3:	83 c4 10             	add    $0x10,%esp
    21f6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    21fa:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    21fe:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2202:	7f c0                	jg     21c4 <sys_printx+0x78>
    2204:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
    2208:	75 11                	jne    221b <sys_printx+0xcf>
    220a:	a1 94 9e 00 00       	mov    0x9e94,%eax
    220f:	85 c0                	test   %eax,%eax
    2211:	74 15                	je     2228 <sys_printx+0xdc>
    2213:	e8 e0 f0 ff ff       	call   12f8 <disable_int>
    2218:	f4                   	hlt    
    2219:	eb 0d                	jmp    2228 <sys_printx+0xdc>
    221b:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
    221f:	75 07                	jne    2228 <sys_printx+0xdc>
    2221:	e8 d2 f0 ff ff       	call   12f8 <disable_int>
    2226:	f4                   	hlt    
    2227:	90                   	nop
    2228:	90                   	nop
    2229:	c9                   	leave  
    222a:	c3                   	ret    

0000222b <spin>:
    222b:	55                   	push   %ebp
    222c:	89 e5                	mov    %esp,%ebp
    222e:	eb fe                	jmp    222e <spin+0x3>

00002230 <panic>:
    2230:	55                   	push   %ebp
    2231:	89 e5                	mov    %esp,%ebp
    2233:	83 ec 08             	sub    $0x8,%esp
    2236:	83 ec 04             	sub    $0x4,%esp
    2239:	ff 75 08             	pushl  0x8(%ebp)
    223c:	6a 3a                	push   $0x3a
    223e:	68 42 64 00 00       	push   $0x6442
    2243:	e8 c1 fe ff ff       	call   2109 <printx>
    2248:	83 c4 10             	add    $0x10,%esp
    224b:	90                   	nop
    224c:	c9                   	leave  
    224d:	c3                   	ret    

0000224e <assertion_failure>:
    224e:	55                   	push   %ebp
    224f:	89 e5                	mov    %esp,%ebp
    2251:	83 ec 08             	sub    $0x8,%esp
    2254:	83 ec 08             	sub    $0x8,%esp
    2257:	ff 75 14             	pushl  0x14(%ebp)
    225a:	ff 75 10             	pushl  0x10(%ebp)
    225d:	ff 75 0c             	pushl  0xc(%ebp)
    2260:	ff 75 08             	pushl  0x8(%ebp)
    2263:	6a 3b                	push   $0x3b
    2265:	68 48 64 00 00       	push   $0x6448
    226a:	e8 9a fe ff ff       	call   2109 <printx>
    226f:	83 c4 20             	add    $0x20,%esp
    2272:	83 ec 0c             	sub    $0xc,%esp
    2275:	68 7b 64 00 00       	push   $0x647b
    227a:	e8 ac ff ff ff       	call   222b <spin>
    227f:	83 c4 10             	add    $0x10,%esp
    2282:	90                   	nop
    2283:	c9                   	leave  
    2284:	c3                   	ret    

00002285 <dead_lock>:
    2285:	55                   	push   %ebp
    2286:	89 e5                	mov    %esp,%ebp
    2288:	83 ec 18             	sub    $0x18,%esp
    228b:	83 ec 0c             	sub    $0xc,%esp
    228e:	ff 75 08             	pushl  0x8(%ebp)
    2291:	e8 c2 2b 00 00       	call   4e58 <pid2proc>
    2296:	83 c4 10             	add    $0x10,%esp
    2299:	89 45 ec             	mov    %eax,-0x14(%ebp)
    229c:	83 ec 0c             	sub    $0xc,%esp
    229f:	ff 75 0c             	pushl  0xc(%ebp)
    22a2:	e8 b1 2b 00 00       	call   4e58 <pid2proc>
    22a7:	83 c4 10             	add    $0x10,%esp
    22aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    22ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22b0:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    22b7:	3c 01                	cmp    $0x1,%al
    22b9:	75 5a                	jne    2315 <dead_lock+0x90>
    22bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22be:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    22c4:	39 45 08             	cmp    %eax,0x8(%ebp)
    22c7:	75 32                	jne    22fb <dead_lock+0x76>
    22c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22d2:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    22d8:	83 ec 0c             	sub    $0xc,%esp
    22db:	50                   	push   %eax
    22dc:	e8 77 2b 00 00       	call   4e58 <pid2proc>
    22e1:	83 c4 10             	add    $0x10,%esp
    22e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22ea:	8b 50 58             	mov    0x58(%eax),%edx
    22ed:	8b 45 08             	mov    0x8(%ebp),%eax
    22f0:	39 c2                	cmp    %eax,%edx
    22f2:	75 db                	jne    22cf <dead_lock+0x4a>
    22f4:	b8 01 00 00 00       	mov    $0x1,%eax
    22f9:	eb 20                	jmp    231b <dead_lock+0x96>
    22fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22fe:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2304:	83 ec 0c             	sub    $0xc,%esp
    2307:	50                   	push   %eax
    2308:	e8 4b 2b 00 00       	call   4e58 <pid2proc>
    230d:	83 c4 10             	add    $0x10,%esp
    2310:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2313:	eb 98                	jmp    22ad <dead_lock+0x28>
    2315:	90                   	nop
    2316:	b8 00 00 00 00       	mov    $0x0,%eax
    231b:	c9                   	leave  
    231c:	c3                   	ret    

0000231d <sys_send_msg>:
    231d:	55                   	push   %ebp
    231e:	89 e5                	mov    %esp,%ebp
    2320:	83 ec 38             	sub    $0x38,%esp
    2323:	83 ec 0c             	sub    $0xc,%esp
    2326:	ff 75 0c             	pushl  0xc(%ebp)
    2329:	e8 2a 2b 00 00       	call   4e58 <pid2proc>
    232e:	83 c4 10             	add    $0x10,%esp
    2331:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2334:	83 ec 0c             	sub    $0xc,%esp
    2337:	ff 75 10             	pushl  0x10(%ebp)
    233a:	e8 35 2b 00 00       	call   4e74 <proc2pid>
    233f:	83 c4 10             	add    $0x10,%esp
    2342:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2345:	8b 45 08             	mov    0x8(%ebp),%eax
    2348:	8b 55 e8             	mov    -0x18(%ebp),%edx
    234b:	89 10                	mov    %edx,(%eax)
    234d:	83 ec 08             	sub    $0x8,%esp
    2350:	ff 75 0c             	pushl  0xc(%ebp)
    2353:	ff 75 e8             	pushl  -0x18(%ebp)
    2356:	e8 2a ff ff ff       	call   2285 <dead_lock>
    235b:	83 c4 10             	add    $0x10,%esp
    235e:	83 f8 01             	cmp    $0x1,%eax
    2361:	75 10                	jne    2373 <sys_send_msg+0x56>
    2363:	83 ec 0c             	sub    $0xc,%esp
    2366:	68 87 64 00 00       	push   $0x6487
    236b:	e8 c0 fe ff ff       	call   2230 <panic>
    2370:	83 c4 10             	add    $0x10,%esp
    2373:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2376:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    237d:	3c 02                	cmp    $0x2,%al
    237f:	0f 85 92 01 00 00    	jne    2517 <sys_send_msg+0x1fa>
    2385:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2388:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    238e:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    2391:	74 12                	je     23a5 <sys_send_msg+0x88>
    2393:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2396:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    239c:	83 f8 11             	cmp    $0x11,%eax
    239f:	0f 85 72 01 00 00    	jne    2517 <sys_send_msg+0x1fa>
    23a5:	8b 45 10             	mov    0x10(%ebp),%eax
    23a8:	8b 40 0c             	mov    0xc(%eax),%eax
    23ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    23ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    23b1:	83 ec 08             	sub    $0x8,%esp
    23b4:	ff 75 10             	pushl  0x10(%ebp)
    23b7:	50                   	push   %eax
    23b8:	e8 84 2b 00 00       	call   4f41 <Seg2PhyAddrLDT>
    23bd:	83 c4 10             	add    $0x10,%esp
    23c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    23c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    23c6:	6b d0 68             	imul   $0x68,%eax,%edx
    23c9:	8b 45 08             	mov    0x8(%ebp),%eax
    23cc:	01 d0                	add    %edx,%eax
    23ce:	89 45 dc             	mov    %eax,-0x24(%ebp)
    23d1:	c7 45 d8 68 00 00 00 	movl   $0x68,-0x28(%ebp)
    23d8:	8b 55 dc             	mov    -0x24(%ebp),%edx
    23db:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23de:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    23e4:	83 ec 04             	sub    $0x4,%esp
    23e7:	ff 75 d8             	pushl  -0x28(%ebp)
    23ea:	52                   	push   %edx
    23eb:	50                   	push   %eax
    23ec:	e8 9d 44 00 00       	call   688e <Memcpy>
    23f1:	83 c4 10             	add    $0x10,%esp
    23f4:	8b 45 10             	mov    0x10(%ebp),%eax
    23f7:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    23fe:	00 00 00 
    2401:	8b 45 10             	mov    0x10(%ebp),%eax
    2404:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
    240b:	00 00 00 
    240e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2411:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    2418:	00 00 00 
    241b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    241e:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    2425:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2428:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    242f:	00 00 00 
    2432:	83 ec 0c             	sub    $0xc,%esp
    2435:	ff 75 ec             	pushl  -0x14(%ebp)
    2438:	e8 e3 05 00 00       	call   2a20 <unblock>
    243d:	83 c4 10             	add    $0x10,%esp
    2440:	8b 45 10             	mov    0x10(%ebp),%eax
    2443:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2449:	85 c0                	test   %eax,%eax
    244b:	74 1c                	je     2469 <sys_send_msg+0x14c>
    244d:	68 29 03 00 00       	push   $0x329
    2452:	68 1d 64 00 00       	push   $0x641d
    2457:	68 1d 64 00 00       	push   $0x641d
    245c:	68 92 64 00 00       	push   $0x6492
    2461:	e8 e8 fd ff ff       	call   224e <assertion_failure>
    2466:	83 c4 10             	add    $0x10,%esp
    2469:	8b 45 10             	mov    0x10(%ebp),%eax
    246c:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2472:	85 c0                	test   %eax,%eax
    2474:	74 1c                	je     2492 <sys_send_msg+0x175>
    2476:	68 2a 03 00 00       	push   $0x32a
    247b:	68 1d 64 00 00       	push   $0x641d
    2480:	68 1d 64 00 00       	push   $0x641d
    2485:	68 a5 64 00 00       	push   $0x64a5
    248a:	e8 bf fd ff ff       	call   224e <assertion_failure>
    248f:	83 c4 10             	add    $0x10,%esp
    2492:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2495:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    249b:	85 c0                	test   %eax,%eax
    249d:	74 1c                	je     24bb <sys_send_msg+0x19e>
    249f:	68 2b 03 00 00       	push   $0x32b
    24a4:	68 1d 64 00 00       	push   $0x641d
    24a9:	68 1d 64 00 00       	push   $0x641d
    24ae:	68 bc 64 00 00       	push   $0x64bc
    24b3:	e8 96 fd ff ff       	call   224e <assertion_failure>
    24b8:	83 c4 10             	add    $0x10,%esp
    24bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24be:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    24c5:	84 c0                	test   %al,%al
    24c7:	74 1c                	je     24e5 <sys_send_msg+0x1c8>
    24c9:	68 2c 03 00 00       	push   $0x32c
    24ce:	68 1d 64 00 00       	push   $0x641d
    24d3:	68 1d 64 00 00       	push   $0x641d
    24d8:	68 d1 64 00 00       	push   $0x64d1
    24dd:	e8 6c fd ff ff       	call   224e <assertion_failure>
    24e2:	83 c4 10             	add    $0x10,%esp
    24e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24e8:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    24ee:	85 c0                	test   %eax,%eax
    24f0:	0f 84 45 01 00 00    	je     263b <sys_send_msg+0x31e>
    24f6:	68 2d 03 00 00       	push   $0x32d
    24fb:	68 1d 64 00 00       	push   $0x641d
    2500:	68 1d 64 00 00       	push   $0x641d
    2505:	68 e7 64 00 00       	push   $0x64e7
    250a:	e8 3f fd ff ff       	call   224e <assertion_failure>
    250f:	83 c4 10             	add    $0x10,%esp
    2512:	e9 24 01 00 00       	jmp    263b <sys_send_msg+0x31e>
    2517:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    251e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2521:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2524:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2527:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    252d:	85 c0                	test   %eax,%eax
    252f:	75 1b                	jne    254c <sys_send_msg+0x22f>
    2531:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2534:	8b 55 10             	mov    0x10(%ebp),%edx
    2537:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    253d:	8b 45 10             	mov    0x10(%ebp),%eax
    2540:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    2547:	00 00 00 
    254a:	eb 3f                	jmp    258b <sys_send_msg+0x26e>
    254c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    254f:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2555:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2558:	eb 12                	jmp    256c <sys_send_msg+0x24f>
    255a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    255d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2560:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2563:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    2569:	89 45 f0             	mov    %eax,-0x10(%ebp)
    256c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2570:	75 e8                	jne    255a <sys_send_msg+0x23d>
    2572:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2575:	8b 55 10             	mov    0x10(%ebp),%edx
    2578:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    257e:	8b 45 10             	mov    0x10(%ebp),%eax
    2581:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    2588:	00 00 00 
    258b:	8b 45 10             	mov    0x10(%ebp),%eax
    258e:	8b 55 08             	mov    0x8(%ebp),%edx
    2591:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    2597:	8b 45 10             	mov    0x10(%ebp),%eax
    259a:	8b 55 0c             	mov    0xc(%ebp),%edx
    259d:	89 90 84 01 00 00    	mov    %edx,0x184(%eax)
    25a3:	8b 45 10             	mov    0x10(%ebp),%eax
    25a6:	c6 80 7c 01 00 00 01 	movb   $0x1,0x17c(%eax)
    25ad:	8b 45 10             	mov    0x10(%ebp),%eax
    25b0:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    25b7:	3c 01                	cmp    $0x1,%al
    25b9:	74 1c                	je     25d7 <sys_send_msg+0x2ba>
    25bb:	68 48 03 00 00       	push   $0x348
    25c0:	68 1d 64 00 00       	push   $0x641d
    25c5:	68 1d 64 00 00       	push   $0x641d
    25ca:	68 05 65 00 00       	push   $0x6505
    25cf:	e8 7a fc ff ff       	call   224e <assertion_failure>
    25d4:	83 c4 10             	add    $0x10,%esp
    25d7:	8b 45 10             	mov    0x10(%ebp),%eax
    25da:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    25e0:	39 45 0c             	cmp    %eax,0xc(%ebp)
    25e3:	74 1c                	je     2601 <sys_send_msg+0x2e4>
    25e5:	68 49 03 00 00       	push   $0x349
    25ea:	68 1d 64 00 00       	push   $0x641d
    25ef:	68 1d 64 00 00       	push   $0x641d
    25f4:	68 20 65 00 00       	push   $0x6520
    25f9:	e8 50 fc ff ff       	call   224e <assertion_failure>
    25fe:	83 c4 10             	add    $0x10,%esp
    2601:	8b 45 10             	mov    0x10(%ebp),%eax
    2604:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    260a:	39 45 08             	cmp    %eax,0x8(%ebp)
    260d:	74 1c                	je     262b <sys_send_msg+0x30e>
    260f:	68 4a 03 00 00       	push   $0x34a
    2614:	68 1d 64 00 00       	push   $0x641d
    2619:	68 1d 64 00 00       	push   $0x641d
    261e:	68 42 65 00 00       	push   $0x6542
    2623:	e8 26 fc ff ff       	call   224e <assertion_failure>
    2628:	83 c4 10             	add    $0x10,%esp
    262b:	83 ec 0c             	sub    $0xc,%esp
    262e:	ff 75 10             	pushl  0x10(%ebp)
    2631:	e8 d8 03 00 00       	call   2a0e <block>
    2636:	83 c4 10             	add    $0x10,%esp
    2639:	eb 01                	jmp    263c <sys_send_msg+0x31f>
    263b:	90                   	nop
    263c:	b8 00 00 00 00       	mov    $0x0,%eax
    2641:	c9                   	leave  
    2642:	c3                   	ret    

00002643 <sys_receive_msg>:
    2643:	55                   	push   %ebp
    2644:	89 e5                	mov    %esp,%ebp
    2646:	83 ec 38             	sub    $0x38,%esp
    2649:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2650:	83 ec 0c             	sub    $0xc,%esp
    2653:	ff 75 0c             	pushl  0xc(%ebp)
    2656:	e8 fd 27 00 00       	call   4e58 <pid2proc>
    265b:	83 c4 10             	add    $0x10,%esp
    265e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2661:	83 ec 0c             	sub    $0xc,%esp
    2664:	ff 75 10             	pushl  0x10(%ebp)
    2667:	e8 08 28 00 00       	call   4e74 <proc2pid>
    266c:	83 c4 10             	add    $0x10,%esp
    266f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2672:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    2676:	75 26                	jne    269e <sys_receive_msg+0x5b>
    2678:	8b 45 10             	mov    0x10(%ebp),%eax
    267b:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2681:	85 c0                	test   %eax,%eax
    2683:	0f 84 87 00 00 00    	je     2710 <sys_receive_msg+0xcd>
    2689:	8b 45 10             	mov    0x10(%ebp),%eax
    268c:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2692:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2695:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    269c:	eb 72                	jmp    2710 <sys_receive_msg+0xcd>
    269e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    26a2:	78 6c                	js     2710 <sys_receive_msg+0xcd>
    26a4:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
    26a8:	7f 66                	jg     2710 <sys_receive_msg+0xcd>
    26aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26ad:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    26b4:	3c 01                	cmp    $0x1,%al
    26b6:	75 58                	jne    2710 <sys_receive_msg+0xcd>
    26b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26bb:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    26c1:	83 f8 11             	cmp    $0x11,%eax
    26c4:	74 0e                	je     26d4 <sys_receive_msg+0x91>
    26c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26c9:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    26cf:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    26d2:	75 3c                	jne    2710 <sys_receive_msg+0xcd>
    26d4:	8b 45 10             	mov    0x10(%ebp),%eax
    26d7:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    26dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    26e0:	eb 28                	jmp    270a <sys_receive_msg+0xc7>
    26e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    26e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26eb:	8b 50 58             	mov    0x58(%eax),%edx
    26ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    26f1:	39 c2                	cmp    %eax,%edx
    26f3:	75 09                	jne    26fe <sys_receive_msg+0xbb>
    26f5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    26fc:	eb 12                	jmp    2710 <sys_receive_msg+0xcd>
    26fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2701:	8b 80 90 01 00 00    	mov    0x190(%eax),%eax
    2707:	89 45 f0             	mov    %eax,-0x10(%ebp)
    270a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    270e:	75 d2                	jne    26e2 <sys_receive_msg+0x9f>
    2710:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    2714:	0f 85 c6 01 00 00    	jne    28e0 <sys_receive_msg+0x29d>
    271a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    271d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2720:	8b 45 10             	mov    0x10(%ebp),%eax
    2723:	8b 40 0c             	mov    0xc(%eax),%eax
    2726:	89 45 dc             	mov    %eax,-0x24(%ebp)
    2729:	8b 45 dc             	mov    -0x24(%ebp),%eax
    272c:	83 ec 08             	sub    $0x8,%esp
    272f:	ff 75 10             	pushl  0x10(%ebp)
    2732:	50                   	push   %eax
    2733:	e8 09 28 00 00       	call   4f41 <Seg2PhyAddrLDT>
    2738:	83 c4 10             	add    $0x10,%esp
    273b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    273e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2741:	6b d0 68             	imul   $0x68,%eax,%edx
    2744:	8b 45 08             	mov    0x8(%ebp),%eax
    2747:	01 d0                	add    %edx,%eax
    2749:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    274c:	c7 45 d0 68 00 00 00 	movl   $0x68,-0x30(%ebp)
    2753:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2756:	8b 90 80 01 00 00    	mov    0x180(%eax),%edx
    275c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    275f:	83 ec 04             	sub    $0x4,%esp
    2762:	ff 75 d0             	pushl  -0x30(%ebp)
    2765:	52                   	push   %edx
    2766:	50                   	push   %eax
    2767:	e8 22 41 00 00       	call   688e <Memcpy>
    276c:	83 c4 10             	add    $0x10,%esp
    276f:	8b 45 10             	mov    0x10(%ebp),%eax
    2772:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2778:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    277b:	75 21                	jne    279e <sys_receive_msg+0x15b>
    277d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2780:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    2786:	8b 45 10             	mov    0x10(%ebp),%eax
    2789:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    278f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2792:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    2799:	00 00 00 
    279c:	eb 1f                	jmp    27bd <sys_receive_msg+0x17a>
    279e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27a1:	8b 90 90 01 00 00    	mov    0x190(%eax),%edx
    27a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27aa:	89 90 90 01 00 00    	mov    %edx,0x190(%eax)
    27b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27b3:	c7 80 90 01 00 00 00 	movl   $0x0,0x190(%eax)
    27ba:	00 00 00 
    27bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    27c0:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    27c7:	00 00 00 
    27ca:	8b 45 e0             	mov    -0x20(%ebp),%eax
    27cd:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    27d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    27d7:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
    27de:	00 00 00 
    27e1:	8b 45 10             	mov    0x10(%ebp),%eax
    27e4:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    27eb:	00 00 00 
    27ee:	8b 45 10             	mov    0x10(%ebp),%eax
    27f1:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    27f8:	00 00 00 
    27fb:	83 ec 0c             	sub    $0xc,%esp
    27fe:	ff 75 e0             	pushl  -0x20(%ebp)
    2801:	e8 1a 02 00 00       	call   2a20 <unblock>
    2806:	83 c4 10             	add    $0x10,%esp
    2809:	8b 45 e0             	mov    -0x20(%ebp),%eax
    280c:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2812:	85 c0                	test   %eax,%eax
    2814:	74 1c                	je     2832 <sys_receive_msg+0x1ef>
    2816:	68 9c 03 00 00       	push   $0x39c
    281b:	68 1d 64 00 00       	push   $0x641d
    2820:	68 1d 64 00 00       	push   $0x641d
    2825:	68 57 65 00 00       	push   $0x6557
    282a:	e8 1f fa ff ff       	call   224e <assertion_failure>
    282f:	83 c4 10             	add    $0x10,%esp
    2832:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2835:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    283c:	84 c0                	test   %al,%al
    283e:	74 1c                	je     285c <sys_receive_msg+0x219>
    2840:	68 9d 03 00 00       	push   $0x39d
    2845:	68 1d 64 00 00       	push   $0x641d
    284a:	68 1d 64 00 00       	push   $0x641d
    284f:	68 70 65 00 00       	push   $0x6570
    2854:	e8 f5 f9 ff ff       	call   224e <assertion_failure>
    2859:	83 c4 10             	add    $0x10,%esp
    285c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    285f:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2865:	85 c0                	test   %eax,%eax
    2867:	74 1c                	je     2885 <sys_receive_msg+0x242>
    2869:	68 9e 03 00 00       	push   $0x39e
    286e:	68 1d 64 00 00       	push   $0x641d
    2873:	68 1d 64 00 00       	push   $0x641d
    2878:	68 8f 65 00 00       	push   $0x658f
    287d:	e8 cc f9 ff ff       	call   224e <assertion_failure>
    2882:	83 c4 10             	add    $0x10,%esp
    2885:	8b 45 10             	mov    0x10(%ebp),%eax
    2888:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    288e:	85 c0                	test   %eax,%eax
    2890:	74 1c                	je     28ae <sys_receive_msg+0x26b>
    2892:	68 a0 03 00 00       	push   $0x3a0
    2897:	68 1d 64 00 00       	push   $0x641d
    289c:	68 1d 64 00 00       	push   $0x641d
    28a1:	68 bc 64 00 00       	push   $0x64bc
    28a6:	e8 a3 f9 ff ff       	call   224e <assertion_failure>
    28ab:	83 c4 10             	add    $0x10,%esp
    28ae:	8b 45 10             	mov    0x10(%ebp),%eax
    28b1:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    28b7:	85 c0                	test   %eax,%eax
    28b9:	0f 84 ba 00 00 00    	je     2979 <sys_receive_msg+0x336>
    28bf:	68 a1 03 00 00       	push   $0x3a1
    28c4:	68 1d 64 00 00       	push   $0x641d
    28c9:	68 1d 64 00 00       	push   $0x641d
    28ce:	68 e7 64 00 00       	push   $0x64e7
    28d3:	e8 76 f9 ff ff       	call   224e <assertion_failure>
    28d8:	83 c4 10             	add    $0x10,%esp
    28db:	e9 99 00 00 00       	jmp    2979 <sys_receive_msg+0x336>
    28e0:	8b 45 10             	mov    0x10(%ebp),%eax
    28e3:	c6 80 7c 01 00 00 02 	movb   $0x2,0x17c(%eax)
    28ea:	8b 45 10             	mov    0x10(%ebp),%eax
    28ed:	8b 55 08             	mov    0x8(%ebp),%edx
    28f0:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    28f6:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    28fa:	75 0f                	jne    290b <sys_receive_msg+0x2c8>
    28fc:	8b 45 10             	mov    0x10(%ebp),%eax
    28ff:	c7 80 88 01 00 00 11 	movl   $0x11,0x188(%eax)
    2906:	00 00 00 
    2909:	eb 0c                	jmp    2917 <sys_receive_msg+0x2d4>
    290b:	8b 45 10             	mov    0x10(%ebp),%eax
    290e:	8b 55 0c             	mov    0xc(%ebp),%edx
    2911:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
    2917:	8b 45 10             	mov    0x10(%ebp),%eax
    291a:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2921:	3c 02                	cmp    $0x2,%al
    2923:	74 1c                	je     2941 <sys_receive_msg+0x2fe>
    2925:	68 ae 03 00 00       	push   $0x3ae
    292a:	68 1d 64 00 00       	push   $0x641d
    292f:	68 1d 64 00 00       	push   $0x641d
    2934:	68 ab 65 00 00       	push   $0x65ab
    2939:	e8 10 f9 ff ff       	call   224e <assertion_failure>
    293e:	83 c4 10             	add    $0x10,%esp
    2941:	8b 45 10             	mov    0x10(%ebp),%eax
    2944:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    294a:	39 45 08             	cmp    %eax,0x8(%ebp)
    294d:	74 1c                	je     296b <sys_receive_msg+0x328>
    294f:	68 af 03 00 00       	push   $0x3af
    2954:	68 1d 64 00 00       	push   $0x641d
    2959:	68 1d 64 00 00       	push   $0x641d
    295e:	68 c9 65 00 00       	push   $0x65c9
    2963:	e8 e6 f8 ff ff       	call   224e <assertion_failure>
    2968:	83 c4 10             	add    $0x10,%esp
    296b:	83 ec 0c             	sub    $0xc,%esp
    296e:	ff 75 10             	pushl  0x10(%ebp)
    2971:	e8 98 00 00 00       	call   2a0e <block>
    2976:	83 c4 10             	add    $0x10,%esp
    2979:	b8 00 00 00 00       	mov    $0x0,%eax
    297e:	c9                   	leave  
    297f:	c3                   	ret    

00002980 <send_rec>:
    2980:	55                   	push   %ebp
    2981:	89 e5                	mov    %esp,%ebp
    2983:	83 ec 18             	sub    $0x18,%esp
    2986:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    298a:	74 22                	je     29ae <send_rec+0x2e>
    298c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    2990:	74 32                	je     29c4 <send_rec+0x44>
    2992:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    2996:	75 5c                	jne    29f4 <send_rec+0x74>
    2998:	83 ec 08             	sub    $0x8,%esp
    299b:	ff 75 10             	pushl  0x10(%ebp)
    299e:	ff 75 0c             	pushl  0xc(%ebp)
    29a1:	e8 b2 0e 00 00       	call   3858 <send_msg>
    29a6:	83 c4 10             	add    $0x10,%esp
    29a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    29ac:	eb 59                	jmp    2a07 <send_rec+0x87>
    29ae:	83 ec 08             	sub    $0x8,%esp
    29b1:	ff 75 10             	pushl  0x10(%ebp)
    29b4:	ff 75 0c             	pushl  0xc(%ebp)
    29b7:	e8 ac 0e 00 00       	call   3868 <receive_msg>
    29bc:	83 c4 10             	add    $0x10,%esp
    29bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    29c2:	eb 43                	jmp    2a07 <send_rec+0x87>
    29c4:	83 ec 08             	sub    $0x8,%esp
    29c7:	ff 75 10             	pushl  0x10(%ebp)
    29ca:	ff 75 0c             	pushl  0xc(%ebp)
    29cd:	e8 86 0e 00 00       	call   3858 <send_msg>
    29d2:	83 c4 10             	add    $0x10,%esp
    29d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    29d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    29dc:	75 28                	jne    2a06 <send_rec+0x86>
    29de:	83 ec 08             	sub    $0x8,%esp
    29e1:	ff 75 10             	pushl  0x10(%ebp)
    29e4:	ff 75 0c             	pushl  0xc(%ebp)
    29e7:	e8 7c 0e 00 00       	call   3868 <receive_msg>
    29ec:	83 c4 10             	add    $0x10,%esp
    29ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
    29f2:	eb 12                	jmp    2a06 <send_rec+0x86>
    29f4:	83 ec 0c             	sub    $0xc,%esp
    29f7:	68 e0 65 00 00       	push   $0x65e0
    29fc:	e8 2f f8 ff ff       	call   2230 <panic>
    2a01:	83 c4 10             	add    $0x10,%esp
    2a04:	eb 01                	jmp    2a07 <send_rec+0x87>
    2a06:	90                   	nop
    2a07:	b8 00 00 00 00       	mov    $0x0,%eax
    2a0c:	c9                   	leave  
    2a0d:	c3                   	ret    

00002a0e <block>:
    2a0e:	55                   	push   %ebp
    2a0f:	89 e5                	mov    %esp,%ebp
    2a11:	83 ec 08             	sub    $0x8,%esp
    2a14:	e8 59 23 00 00       	call   4d72 <schedule_process>
    2a19:	b8 00 00 00 00       	mov    $0x0,%eax
    2a1e:	c9                   	leave  
    2a1f:	c3                   	ret    

00002a20 <unblock>:
    2a20:	55                   	push   %ebp
    2a21:	89 e5                	mov    %esp,%ebp
    2a23:	b8 00 00 00 00       	mov    $0x0,%eax
    2a28:	5d                   	pop    %ebp
    2a29:	c3                   	ret    

00002a2a <get_ticks_ipc>:
    2a2a:	55                   	push   %ebp
    2a2b:	89 e5                	mov    %esp,%ebp
    2a2d:	83 ec 78             	sub    $0x78,%esp
    2a30:	83 ec 04             	sub    $0x4,%esp
    2a33:	6a 68                	push   $0x68
    2a35:	6a 00                	push   $0x0
    2a37:	8d 45 88             	lea    -0x78(%ebp),%eax
    2a3a:	50                   	push   %eax
    2a3b:	e8 7c 3e 00 00       	call   68bc <Memset>
    2a40:	83 c4 10             	add    $0x10,%esp
    2a43:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
    2a4a:	83 ec 04             	sub    $0x4,%esp
    2a4d:	6a 01                	push   $0x1
    2a4f:	8d 45 88             	lea    -0x78(%ebp),%eax
    2a52:	50                   	push   %eax
    2a53:	6a 03                	push   $0x3
    2a55:	e8 26 ff ff ff       	call   2980 <send_rec>
    2a5a:	83 c4 10             	add    $0x10,%esp
    2a5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a60:	8b 45 90             	mov    -0x70(%ebp),%eax
    2a63:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a69:	c9                   	leave  
    2a6a:	c3                   	ret    

00002a6b <itoa>:
    2a6b:	55                   	push   %ebp
    2a6c:	89 e5                	mov    %esp,%ebp
    2a6e:	53                   	push   %ebx
    2a6f:	83 ec 14             	sub    $0x14,%esp
    2a72:	8b 45 08             	mov    0x8(%ebp),%eax
    2a75:	99                   	cltd   
    2a76:	f7 7d 10             	idivl  0x10(%ebp)
    2a79:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2a7c:	8b 45 08             	mov    0x8(%ebp),%eax
    2a7f:	99                   	cltd   
    2a80:	f7 7d 10             	idivl  0x10(%ebp)
    2a83:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2a86:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2a8a:	74 14                	je     2aa0 <itoa+0x35>
    2a8c:	83 ec 04             	sub    $0x4,%esp
    2a8f:	ff 75 10             	pushl  0x10(%ebp)
    2a92:	ff 75 0c             	pushl  0xc(%ebp)
    2a95:	ff 75 f0             	pushl  -0x10(%ebp)
    2a98:	e8 ce ff ff ff       	call   2a6b <itoa>
    2a9d:	83 c4 10             	add    $0x10,%esp
    2aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2aa3:	8d 58 30             	lea    0x30(%eax),%ebx
    2aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
    2aa9:	8b 00                	mov    (%eax),%eax
    2aab:	8d 48 01             	lea    0x1(%eax),%ecx
    2aae:	8b 55 0c             	mov    0xc(%ebp),%edx
    2ab1:	89 0a                	mov    %ecx,(%edx)
    2ab3:	89 da                	mov    %ebx,%edx
    2ab5:	88 10                	mov    %dl,(%eax)
    2ab7:	8b 45 0c             	mov    0xc(%ebp),%eax
    2aba:	8b 00                	mov    (%eax),%eax
    2abc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2abf:	c9                   	leave  
    2ac0:	c3                   	ret    

00002ac1 <i2a>:
    2ac1:	55                   	push   %ebp
    2ac2:	89 e5                	mov    %esp,%ebp
    2ac4:	53                   	push   %ebx
    2ac5:	83 ec 14             	sub    $0x14,%esp
    2ac8:	8b 45 08             	mov    0x8(%ebp),%eax
    2acb:	99                   	cltd   
    2acc:	f7 7d 0c             	idivl  0xc(%ebp)
    2acf:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2ad2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ad5:	99                   	cltd   
    2ad6:	f7 7d 0c             	idivl  0xc(%ebp)
    2ad9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2adc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2ae0:	74 14                	je     2af6 <i2a+0x35>
    2ae2:	83 ec 04             	sub    $0x4,%esp
    2ae5:	ff 75 10             	pushl  0x10(%ebp)
    2ae8:	ff 75 0c             	pushl  0xc(%ebp)
    2aeb:	ff 75 f0             	pushl  -0x10(%ebp)
    2aee:	e8 ce ff ff ff       	call   2ac1 <i2a>
    2af3:	83 c4 10             	add    $0x10,%esp
    2af6:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2afa:	7f 0a                	jg     2b06 <i2a+0x45>
    2afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2aff:	83 c0 30             	add    $0x30,%eax
    2b02:	89 c3                	mov    %eax,%ebx
    2b04:	eb 08                	jmp    2b0e <i2a+0x4d>
    2b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b09:	83 c0 37             	add    $0x37,%eax
    2b0c:	89 c3                	mov    %eax,%ebx
    2b0e:	8b 45 10             	mov    0x10(%ebp),%eax
    2b11:	8b 00                	mov    (%eax),%eax
    2b13:	8d 48 01             	lea    0x1(%eax),%ecx
    2b16:	8b 55 10             	mov    0x10(%ebp),%edx
    2b19:	89 0a                	mov    %ecx,(%edx)
    2b1b:	88 18                	mov    %bl,(%eax)
    2b1d:	8b 45 10             	mov    0x10(%ebp),%eax
    2b20:	8b 00                	mov    (%eax),%eax
    2b22:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b25:	c9                   	leave  
    2b26:	c3                   	ret    

00002b27 <inform_int>:
    2b27:	55                   	push   %ebp
    2b28:	89 e5                	mov    %esp,%ebp
    2b2a:	83 ec 18             	sub    $0x18,%esp
    2b2d:	83 ec 0c             	sub    $0xc,%esp
    2b30:	ff 75 08             	pushl  0x8(%ebp)
    2b33:	e8 20 23 00 00       	call   4e58 <pid2proc>
    2b38:	83 c4 10             	add    $0x10,%esp
    2b3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b41:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2b48:	0f b6 c0             	movzbl %al,%eax
    2b4b:	83 e0 02             	and    $0x2,%eax
    2b4e:	85 c0                	test   %eax,%eax
    2b50:	74 5d                	je     2baf <inform_int+0x88>
    2b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b55:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2b5b:	83 f8 f6             	cmp    $0xfffffff6,%eax
    2b5e:	74 0e                	je     2b6e <inform_int+0x47>
    2b60:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b63:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    2b69:	83 f8 11             	cmp    $0x11,%eax
    2b6c:	75 4e                	jne    2bbc <inform_int+0x95>
    2b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b71:	c7 80 94 01 00 00 00 	movl   $0x0,0x194(%eax)
    2b78:	00 00 00 
    2b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b7e:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    2b85:	00 00 00 
    2b88:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b8b:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    2b92:	00 00 00 
    2b95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b98:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    2b9f:	83 ec 0c             	sub    $0xc,%esp
    2ba2:	ff 75 f4             	pushl  -0xc(%ebp)
    2ba5:	e8 76 fe ff ff       	call   2a20 <unblock>
    2baa:	83 c4 10             	add    $0x10,%esp
    2bad:	eb 0d                	jmp    2bbc <inform_int+0x95>
    2baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bb2:	c7 80 94 01 00 00 01 	movl   $0x1,0x194(%eax)
    2bb9:	00 00 00 
    2bbc:	90                   	nop
    2bbd:	c9                   	leave  
    2bbe:	c3                   	ret    

00002bbf <TaskHD>:
    2bbf:	55                   	push   %ebp
    2bc0:	89 e5                	mov    %esp,%ebp
    2bc2:	83 ec 08             	sub    $0x8,%esp
    2bc5:	83 ec 08             	sub    $0x8,%esp
    2bc8:	68 f5 65 00 00       	push   $0x65f5
    2bcd:	68 0b 66 00 00       	push   $0x660b
    2bd2:	e8 2a f3 ff ff       	call   1f01 <Printf>
    2bd7:	83 c4 10             	add    $0x10,%esp
    2bda:	e8 07 00 00 00       	call   2be6 <init_hd>
    2bdf:	e8 36 00 00 00       	call   2c1a <hd_handle>
    2be4:	eb f9                	jmp    2bdf <TaskHD+0x20>

00002be6 <init_hd>:
    2be6:	55                   	push   %ebp
    2be7:	89 e5                	mov    %esp,%ebp
    2be9:	83 ec 18             	sub    $0x18,%esp
    2bec:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
    2bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bf6:	0f b6 00             	movzbl (%eax),%eax
    2bf9:	0f be c0             	movsbl %al,%eax
    2bfc:	83 ec 08             	sub    $0x8,%esp
    2bff:	50                   	push   %eax
    2c00:	68 0f 66 00 00       	push   $0x660f
    2c05:	e8 f7 f2 ff ff       	call   1f01 <Printf>
    2c0a:	83 c4 10             	add    $0x10,%esp
    2c0d:	e8 7e e7 ff ff       	call   1390 <enable_8259A_casecade_irq>
    2c12:	e8 8d e7 ff ff       	call   13a4 <enable_8259A_slave_winchester_irq>
    2c17:	90                   	nop
    2c18:	c9                   	leave  
    2c19:	c3                   	ret    

00002c1a <hd_handle>:
    2c1a:	55                   	push   %ebp
    2c1b:	89 e5                	mov    %esp,%ebp
    2c1d:	83 ec 78             	sub    $0x78,%esp
    2c20:	83 ec 08             	sub    $0x8,%esp
    2c23:	68 17 66 00 00       	push   $0x6617
    2c28:	68 0b 66 00 00       	push   $0x660b
    2c2d:	e8 cf f2 ff ff       	call   1f01 <Printf>
    2c32:	83 c4 10             	add    $0x10,%esp
    2c35:	83 ec 04             	sub    $0x4,%esp
    2c38:	6a 68                	push   $0x68
    2c3a:	6a 00                	push   $0x0
    2c3c:	8d 45 88             	lea    -0x78(%ebp),%eax
    2c3f:	50                   	push   %eax
    2c40:	e8 77 3c 00 00       	call   68bc <Memset>
    2c45:	83 c4 10             	add    $0x10,%esp
    2c48:	83 ec 04             	sub    $0x4,%esp
    2c4b:	6a 11                	push   $0x11
    2c4d:	8d 45 88             	lea    -0x78(%ebp),%eax
    2c50:	50                   	push   %eax
    2c51:	6a 02                	push   $0x2
    2c53:	e8 28 fd ff ff       	call   2980 <send_rec>
    2c58:	83 c4 10             	add    $0x10,%esp
    2c5b:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2c5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c61:	8b 45 88             	mov    -0x78(%ebp),%eax
    2c64:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2c67:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2c6b:	74 59                	je     2cc6 <hd_handle+0xac>
    2c6d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2c71:	77 0b                	ja     2c7e <hd_handle+0x64>
    2c73:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2c77:	74 16                	je     2c8f <hd_handle+0x75>
    2c79:	e9 98 00 00 00       	jmp    2d16 <hd_handle+0xfc>
    2c7e:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    2c82:	74 42                	je     2cc6 <hd_handle+0xac>
    2c84:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    2c88:	74 65                	je     2cef <hd_handle+0xd5>
    2c8a:	e9 87 00 00 00       	jmp    2d16 <hd_handle+0xfc>
    2c8f:	83 ec 04             	sub    $0x4,%esp
    2c92:	ff 75 f0             	pushl  -0x10(%ebp)
    2c95:	68 2d 66 00 00       	push   $0x662d
    2c9a:	68 35 66 00 00       	push   $0x6635
    2c9f:	e8 5d f2 ff ff       	call   1f01 <Printf>
    2ca4:	83 c4 10             	add    $0x10,%esp
    2ca7:	e8 b6 07 00 00       	call   3462 <hd_open>
    2cac:	83 ec 04             	sub    $0x4,%esp
    2caf:	ff 75 f0             	pushl  -0x10(%ebp)
    2cb2:	68 3c 66 00 00       	push   $0x663c
    2cb7:	68 35 66 00 00       	push   $0x6635
    2cbc:	e8 40 f2 ff ff       	call   1f01 <Printf>
    2cc1:	83 c4 10             	add    $0x10,%esp
    2cc4:	eb 66                	jmp    2d2c <hd_handle+0x112>
    2cc6:	83 ec 04             	sub    $0x4,%esp
    2cc9:	ff 75 f0             	pushl  -0x10(%ebp)
    2ccc:	68 48 66 00 00       	push   $0x6648
    2cd1:	68 35 66 00 00       	push   $0x6635
    2cd6:	e8 26 f2 ff ff       	call   1f01 <Printf>
    2cdb:	83 c4 10             	add    $0x10,%esp
    2cde:	83 ec 0c             	sub    $0xc,%esp
    2ce1:	8d 45 88             	lea    -0x78(%ebp),%eax
    2ce4:	50                   	push   %eax
    2ce5:	e8 80 08 00 00       	call   356a <hd_rdwt>
    2cea:	83 c4 10             	add    $0x10,%esp
    2ced:	eb 3d                	jmp    2d2c <hd_handle+0x112>
    2cef:	83 ec 0c             	sub    $0xc,%esp
    2cf2:	6a 00                	push   $0x0
    2cf4:	e8 b8 07 00 00       	call   34b1 <get_hd_ioctl>
    2cf9:	83 c4 10             	add    $0x10,%esp
    2cfc:	83 ec 04             	sub    $0x4,%esp
    2cff:	ff 75 f0             	pushl  -0x10(%ebp)
    2d02:	68 51 66 00 00       	push   $0x6651
    2d07:	68 35 66 00 00       	push   $0x6635
    2d0c:	e8 f0 f1 ff ff       	call   1f01 <Printf>
    2d11:	83 c4 10             	add    $0x10,%esp
    2d14:	eb 16                	jmp    2d2c <hd_handle+0x112>
    2d16:	83 ec 08             	sub    $0x8,%esp
    2d19:	68 5e 66 00 00       	push   $0x665e
    2d1e:	68 0b 66 00 00       	push   $0x660b
    2d23:	e8 d9 f1 ff ff       	call   1f01 <Printf>
    2d28:	83 c4 10             	add    $0x10,%esp
    2d2b:	90                   	nop
    2d2c:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
    2d33:	83 ec 08             	sub    $0x8,%esp
    2d36:	68 70 66 00 00       	push   $0x6670
    2d3b:	68 0b 66 00 00       	push   $0x660b
    2d40:	e8 bc f1 ff ff       	call   1f01 <Printf>
    2d45:	83 c4 10             	add    $0x10,%esp
    2d48:	83 ec 04             	sub    $0x4,%esp
    2d4b:	6a 03                	push   $0x3
    2d4d:	8d 45 88             	lea    -0x78(%ebp),%eax
    2d50:	50                   	push   %eax
    2d51:	6a 01                	push   $0x1
    2d53:	e8 28 fc ff ff       	call   2980 <send_rec>
    2d58:	83 c4 10             	add    $0x10,%esp
    2d5b:	83 ec 08             	sub    $0x8,%esp
    2d5e:	68 82 66 00 00       	push   $0x6682
    2d63:	68 0b 66 00 00       	push   $0x660b
    2d68:	e8 94 f1 ff ff       	call   1f01 <Printf>
    2d6d:	83 c4 10             	add    $0x10,%esp
    2d70:	90                   	nop
    2d71:	c9                   	leave  
    2d72:	c3                   	ret    

00002d73 <hd_cmd_out>:
    2d73:	55                   	push   %ebp
    2d74:	89 e5                	mov    %esp,%ebp
    2d76:	83 ec 08             	sub    $0x8,%esp
    2d79:	83 ec 04             	sub    $0x4,%esp
    2d7c:	68 10 27 00 00       	push   $0x2710
    2d81:	6a 00                	push   $0x0
    2d83:	68 80 00 00 00       	push   $0x80
    2d88:	e8 4a 0a 00 00       	call   37d7 <waitfor>
    2d8d:	83 c4 10             	add    $0x10,%esp
    2d90:	85 c0                	test   %eax,%eax
    2d92:	75 10                	jne    2da4 <hd_cmd_out+0x31>
    2d94:	83 ec 0c             	sub    $0xc,%esp
    2d97:	68 8e 66 00 00       	push   $0x668e
    2d9c:	e8 8f f4 ff ff       	call   2230 <panic>
    2da1:	83 c4 10             	add    $0x10,%esp
    2da4:	83 ec 08             	sub    $0x8,%esp
    2da7:	6a 00                	push   $0x0
    2da9:	68 f6 03 00 00       	push   $0x3f6
    2dae:	e8 23 e5 ff ff       	call   12d6 <out_byte>
    2db3:	83 c4 10             	add    $0x10,%esp
    2db6:	8b 45 08             	mov    0x8(%ebp),%eax
    2db9:	0f b6 00             	movzbl (%eax),%eax
    2dbc:	0f b6 c0             	movzbl %al,%eax
    2dbf:	83 ec 08             	sub    $0x8,%esp
    2dc2:	50                   	push   %eax
    2dc3:	68 f1 01 00 00       	push   $0x1f1
    2dc8:	e8 09 e5 ff ff       	call   12d6 <out_byte>
    2dcd:	83 c4 10             	add    $0x10,%esp
    2dd0:	8b 45 08             	mov    0x8(%ebp),%eax
    2dd3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    2dd7:	0f b6 c0             	movzbl %al,%eax
    2dda:	83 ec 08             	sub    $0x8,%esp
    2ddd:	50                   	push   %eax
    2dde:	68 f2 01 00 00       	push   $0x1f2
    2de3:	e8 ee e4 ff ff       	call   12d6 <out_byte>
    2de8:	83 c4 10             	add    $0x10,%esp
    2deb:	8b 45 08             	mov    0x8(%ebp),%eax
    2dee:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    2df2:	0f b6 c0             	movzbl %al,%eax
    2df5:	83 ec 08             	sub    $0x8,%esp
    2df8:	50                   	push   %eax
    2df9:	68 f3 01 00 00       	push   $0x1f3
    2dfe:	e8 d3 e4 ff ff       	call   12d6 <out_byte>
    2e03:	83 c4 10             	add    $0x10,%esp
    2e06:	8b 45 08             	mov    0x8(%ebp),%eax
    2e09:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    2e0d:	0f b6 c0             	movzbl %al,%eax
    2e10:	83 ec 08             	sub    $0x8,%esp
    2e13:	50                   	push   %eax
    2e14:	68 f4 01 00 00       	push   $0x1f4
    2e19:	e8 b8 e4 ff ff       	call   12d6 <out_byte>
    2e1e:	83 c4 10             	add    $0x10,%esp
    2e21:	8b 45 08             	mov    0x8(%ebp),%eax
    2e24:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    2e28:	0f b6 c0             	movzbl %al,%eax
    2e2b:	83 ec 08             	sub    $0x8,%esp
    2e2e:	50                   	push   %eax
    2e2f:	68 f5 01 00 00       	push   $0x1f5
    2e34:	e8 9d e4 ff ff       	call   12d6 <out_byte>
    2e39:	83 c4 10             	add    $0x10,%esp
    2e3c:	8b 45 08             	mov    0x8(%ebp),%eax
    2e3f:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    2e43:	0f b6 c0             	movzbl %al,%eax
    2e46:	83 ec 08             	sub    $0x8,%esp
    2e49:	50                   	push   %eax
    2e4a:	68 f6 01 00 00       	push   $0x1f6
    2e4f:	e8 82 e4 ff ff       	call   12d6 <out_byte>
    2e54:	83 c4 10             	add    $0x10,%esp
    2e57:	8b 45 08             	mov    0x8(%ebp),%eax
    2e5a:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    2e5e:	0f b6 c0             	movzbl %al,%eax
    2e61:	83 ec 08             	sub    $0x8,%esp
    2e64:	50                   	push   %eax
    2e65:	68 f7 01 00 00       	push   $0x1f7
    2e6a:	e8 67 e4 ff ff       	call   12d6 <out_byte>
    2e6f:	83 c4 10             	add    $0x10,%esp
    2e72:	90                   	nop
    2e73:	c9                   	leave  
    2e74:	c3                   	ret    

00002e75 <hd_identify>:
    2e75:	55                   	push   %ebp
    2e76:	89 e5                	mov    %esp,%ebp
    2e78:	81 ec 18 04 00 00    	sub    $0x418,%esp
    2e7e:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    2e82:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
    2e86:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    2e8a:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
    2e8e:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
    2e92:	8b 45 08             	mov    0x8(%ebp),%eax
    2e95:	c1 e0 04             	shl    $0x4,%eax
    2e98:	83 c8 e0             	or     $0xffffffe0,%eax
    2e9b:	88 45 f6             	mov    %al,-0xa(%ebp)
    2e9e:	c6 45 f7 ec          	movb   $0xec,-0x9(%ebp)
    2ea2:	83 ec 0c             	sub    $0xc,%esp
    2ea5:	8d 45 f1             	lea    -0xf(%ebp),%eax
    2ea8:	50                   	push   %eax
    2ea9:	e8 c5 fe ff ff       	call   2d73 <hd_cmd_out>
    2eae:	83 c4 10             	add    $0x10,%esp
    2eb1:	e8 98 06 00 00       	call   354e <interrupt_wait>
    2eb6:	83 ec 0c             	sub    $0xc,%esp
    2eb9:	68 20 03 00 00       	push   $0x320
    2ebe:	e8 91 ee ff ff       	call   1d54 <delay>
    2ec3:	83 c4 10             	add    $0x10,%esp
    2ec6:	83 ec 0c             	sub    $0xc,%esp
    2ec9:	68 20 03 00 00       	push   $0x320
    2ece:	e8 81 ee ff ff       	call   1d54 <delay>
    2ed3:	83 c4 10             	add    $0x10,%esp
    2ed6:	83 ec 04             	sub    $0x4,%esp
    2ed9:	68 00 04 00 00       	push   $0x400
    2ede:	6a 00                	push   $0x0
    2ee0:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2ee6:	50                   	push   %eax
    2ee7:	e8 d0 39 00 00       	call   68bc <Memset>
    2eec:	83 c4 10             	add    $0x10,%esp
    2eef:	83 ec 04             	sub    $0x4,%esp
    2ef2:	68 00 02 00 00       	push   $0x200
    2ef7:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2efd:	50                   	push   %eax
    2efe:	68 f0 01 00 00       	push   $0x1f0
    2f03:	e8 08 3a 00 00       	call   6910 <read_port>
    2f08:	83 c4 10             	add    $0x10,%esp
    2f0b:	83 ec 0c             	sub    $0xc,%esp
    2f0e:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2f14:	50                   	push   %eax
    2f15:	e8 32 00 00 00       	call   2f4c <print_hdinfo>
    2f1a:	83 c4 10             	add    $0x10,%esp
    2f1d:	83 ec 08             	sub    $0x8,%esp
    2f20:	68 98 66 00 00       	push   $0x6698
    2f25:	68 0b 66 00 00       	push   $0x660b
    2f2a:	e8 d2 ef ff ff       	call   1f01 <Printf>
    2f2f:	83 c4 10             	add    $0x10,%esp
    2f32:	83 ec 08             	sub    $0x8,%esp
    2f35:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2f3b:	50                   	push   %eax
    2f3c:	68 a4 66 00 00       	push   $0x66a4
    2f41:	e8 bb ef ff ff       	call   1f01 <Printf>
    2f46:	83 c4 10             	add    $0x10,%esp
    2f49:	90                   	nop
    2f4a:	c9                   	leave  
    2f4b:	c3                   	ret    

00002f4c <print_hdinfo>:
    2f4c:	55                   	push   %ebp
    2f4d:	89 e5                	mov    %esp,%ebp
    2f4f:	81 ec 88 00 00 00    	sub    $0x88,%esp
    2f55:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
    2f5b:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
    2f61:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
    2f68:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
    2f6f:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
    2f76:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
    2f7d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    2f84:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
    2f8a:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
    2f90:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
    2f97:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
    2f9e:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
    2fa5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    2fac:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    2fb3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2fba:	e9 b8 00 00 00       	jmp    3077 <print_hdinfo+0x12b>
    2fbf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2fc6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2fc9:	89 d0                	mov    %edx,%eax
    2fcb:	01 c0                	add    %eax,%eax
    2fcd:	01 d0                	add    %edx,%eax
    2fcf:	c1 e0 03             	shl    $0x3,%eax
    2fd2:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    2fd5:	01 c8                	add    %ecx,%eax
    2fd7:	83 e8 44             	sub    $0x44,%eax
    2fda:	0f b7 00             	movzwl (%eax),%eax
    2fdd:	0f b7 c0             	movzwl %ax,%eax
    2fe0:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2fe3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe6:	01 d0                	add    %edx,%eax
    2fe8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2feb:	eb 30                	jmp    301d <print_hdinfo+0xd1>
    2fed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ff0:	8d 50 01             	lea    0x1(%eax),%edx
    2ff3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    2ff6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2ff9:	83 c2 01             	add    $0x1,%edx
    2ffc:	0f b6 00             	movzbl (%eax),%eax
    2fff:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
    3003:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3006:	8d 50 01             	lea    0x1(%eax),%edx
    3009:	89 55 ec             	mov    %edx,-0x14(%ebp)
    300c:	0f b6 00             	movzbl (%eax),%eax
    300f:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
    3012:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3015:	01 ca                	add    %ecx,%edx
    3017:	88 02                	mov    %al,(%edx)
    3019:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    301d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3020:	89 d0                	mov    %edx,%eax
    3022:	01 c0                	add    %eax,%eax
    3024:	01 d0                	add    %edx,%eax
    3026:	c1 e0 03             	shl    $0x3,%eax
    3029:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    302c:	01 c8                	add    %ecx,%eax
    302e:	83 e8 42             	sub    $0x42,%eax
    3031:	0f b7 00             	movzwl (%eax),%eax
    3034:	66 d1 e8             	shr    %ax
    3037:	0f b7 c0             	movzwl %ax,%eax
    303a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    303d:	7c ae                	jl     2fed <print_hdinfo+0xa1>
    303f:	8d 55 81             	lea    -0x7f(%ebp),%edx
    3042:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3045:	01 d0                	add    %edx,%eax
    3047:	c6 00 00             	movb   $0x0,(%eax)
    304a:	8d 4d b4             	lea    -0x4c(%ebp),%ecx
    304d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3050:	89 d0                	mov    %edx,%eax
    3052:	01 c0                	add    %eax,%eax
    3054:	01 d0                	add    %edx,%eax
    3056:	c1 e0 03             	shl    $0x3,%eax
    3059:	01 c8                	add    %ecx,%eax
    305b:	8d 50 04             	lea    0x4(%eax),%edx
    305e:	83 ec 04             	sub    $0x4,%esp
    3061:	8d 45 81             	lea    -0x7f(%ebp),%eax
    3064:	50                   	push   %eax
    3065:	52                   	push   %edx
    3066:	68 ac 66 00 00       	push   $0x66ac
    306b:	e8 91 ee ff ff       	call   1f01 <Printf>
    3070:	83 c4 10             	add    $0x10,%esp
    3073:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3077:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    307b:	0f 8e 3e ff ff ff    	jle    2fbf <print_hdinfo+0x73>
    3081:	8b 45 08             	mov    0x8(%ebp),%eax
    3084:	0f b7 40 62          	movzwl 0x62(%eax),%eax
    3088:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    308c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    3090:	66 c1 e8 08          	shr    $0x8,%ax
    3094:	66 85 c0             	test   %ax,%ax
    3097:	0f 95 c0             	setne  %al
    309a:	88 45 e9             	mov    %al,-0x17(%ebp)
    309d:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
    30a4:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
    30aa:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
    30ae:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
    30b2:	75 15                	jne    30c9 <print_hdinfo+0x17d>
    30b4:	83 ec 08             	sub    $0x8,%esp
    30b7:	8d 45 ac             	lea    -0x54(%ebp),%eax
    30ba:	50                   	push   %eax
    30bb:	8d 45 b0             	lea    -0x50(%ebp),%eax
    30be:	50                   	push   %eax
    30bf:	e8 17 38 00 00       	call   68db <Strcpy>
    30c4:	83 c4 10             	add    $0x10,%esp
    30c7:	eb 13                	jmp    30dc <print_hdinfo+0x190>
    30c9:	83 ec 08             	sub    $0x8,%esp
    30cc:	8d 45 a9             	lea    -0x57(%ebp),%eax
    30cf:	50                   	push   %eax
    30d0:	8d 45 b0             	lea    -0x50(%ebp),%eax
    30d3:	50                   	push   %eax
    30d4:	e8 02 38 00 00       	call   68db <Strcpy>
    30d9:	83 c4 10             	add    $0x10,%esp
    30dc:	83 ec 08             	sub    $0x8,%esp
    30df:	8d 45 b0             	lea    -0x50(%ebp),%eax
    30e2:	50                   	push   %eax
    30e3:	68 b3 66 00 00       	push   $0x66b3
    30e8:	e8 14 ee ff ff       	call   1f01 <Printf>
    30ed:	83 c4 10             	add    $0x10,%esp
    30f0:	8b 45 08             	mov    0x8(%ebp),%eax
    30f3:	83 c0 7a             	add    $0x7a,%eax
    30f6:	0f b7 00             	movzwl (%eax),%eax
    30f9:	0f b7 d0             	movzwl %ax,%edx
    30fc:	8b 45 08             	mov    0x8(%ebp),%eax
    30ff:	83 c0 78             	add    $0x78,%eax
    3102:	0f b7 00             	movzwl (%eax),%eax
    3105:	0f b7 c0             	movzwl %ax,%eax
    3108:	83 c0 10             	add    $0x10,%eax
    310b:	89 c1                	mov    %eax,%ecx
    310d:	d3 e2                	shl    %cl,%edx
    310f:	89 d0                	mov    %edx,%eax
    3111:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3114:	83 ec 08             	sub    $0x8,%esp
    3117:	ff 75 e4             	pushl  -0x1c(%ebp)
    311a:	68 c3 66 00 00       	push   $0x66c3
    311f:	e8 dd ed ff ff       	call   1f01 <Printf>
    3124:	83 c4 10             	add    $0x10,%esp
    3127:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    312a:	89 c2                	mov    %eax,%edx
    312c:	c1 ea 1f             	shr    $0x1f,%edx
    312f:	01 d0                	add    %edx,%eax
    3131:	d1 f8                	sar    %eax
    3133:	c1 e0 0a             	shl    $0xa,%eax
    3136:	83 ec 08             	sub    $0x8,%esp
    3139:	50                   	push   %eax
    313a:	68 d6 66 00 00       	push   $0x66d6
    313f:	e8 bd ed ff ff       	call   1f01 <Printf>
    3144:	83 c4 10             	add    $0x10,%esp
    3147:	90                   	nop
    3148:	c9                   	leave  
    3149:	c3                   	ret    

0000314a <print_dpt_entry>:
    314a:	55                   	push   %ebp
    314b:	89 e5                	mov    %esp,%ebp
    314d:	83 ec 08             	sub    $0x8,%esp
    3150:	8b 45 08             	mov    0x8(%ebp),%eax
    3153:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    3157:	0f b6 c0             	movzbl %al,%eax
    315a:	83 ec 08             	sub    $0x8,%esp
    315d:	50                   	push   %eax
    315e:	68 e3 66 00 00       	push   $0x66e3
    3163:	e8 99 ed ff ff       	call   1f01 <Printf>
    3168:	83 c4 10             	add    $0x10,%esp
    316b:	90                   	nop
    316c:	c9                   	leave  
    316d:	c3                   	ret    

0000316e <get_partition_table>:
    316e:	55                   	push   %ebp
    316f:	89 e5                	mov    %esp,%ebp
    3171:	81 ec 18 04 00 00    	sub    $0x418,%esp
    3177:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    317b:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
    317f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3182:	88 45 f3             	mov    %al,-0xd(%ebp)
    3185:	8b 45 0c             	mov    0xc(%ebp),%eax
    3188:	c1 f8 08             	sar    $0x8,%eax
    318b:	88 45 f4             	mov    %al,-0xc(%ebp)
    318e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3191:	c1 f8 10             	sar    $0x10,%eax
    3194:	88 45 f5             	mov    %al,-0xb(%ebp)
    3197:	8b 45 0c             	mov    0xc(%ebp),%eax
    319a:	c1 f8 18             	sar    $0x18,%eax
    319d:	89 c2                	mov    %eax,%edx
    319f:	8b 45 08             	mov    0x8(%ebp),%eax
    31a2:	c1 e0 04             	shl    $0x4,%eax
    31a5:	09 d0                	or     %edx,%eax
    31a7:	83 c8 e0             	or     $0xffffffe0,%eax
    31aa:	88 45 f6             	mov    %al,-0xa(%ebp)
    31ad:	c6 45 f7 20          	movb   $0x20,-0x9(%ebp)
    31b1:	83 ec 0c             	sub    $0xc,%esp
    31b4:	8d 45 f1             	lea    -0xf(%ebp),%eax
    31b7:	50                   	push   %eax
    31b8:	e8 b6 fb ff ff       	call   2d73 <hd_cmd_out>
    31bd:	83 c4 10             	add    $0x10,%esp
    31c0:	e8 89 03 00 00       	call   354e <interrupt_wait>
    31c5:	83 ec 04             	sub    $0x4,%esp
    31c8:	68 00 04 00 00       	push   $0x400
    31cd:	6a 00                	push   $0x0
    31cf:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    31d5:	50                   	push   %eax
    31d6:	e8 e1 36 00 00       	call   68bc <Memset>
    31db:	83 c4 10             	add    $0x10,%esp
    31de:	83 ec 04             	sub    $0x4,%esp
    31e1:	68 00 02 00 00       	push   $0x200
    31e6:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    31ec:	50                   	push   %eax
    31ed:	68 f0 01 00 00       	push   $0x1f0
    31f2:	e8 19 37 00 00       	call   6910 <read_port>
    31f7:	83 c4 10             	add    $0x10,%esp
    31fa:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    3200:	05 be 01 00 00       	add    $0x1be,%eax
    3205:	83 ec 04             	sub    $0x4,%esp
    3208:	6a 40                	push   $0x40
    320a:	50                   	push   %eax
    320b:	ff 75 10             	pushl  0x10(%ebp)
    320e:	e8 7b 36 00 00       	call   688e <Memcpy>
    3213:	83 c4 10             	add    $0x10,%esp
    3216:	90                   	nop
    3217:	c9                   	leave  
    3218:	c3                   	ret    

00003219 <partition>:
    3219:	55                   	push   %ebp
    321a:	89 e5                	mov    %esp,%ebp
    321c:	81 ec 98 00 00 00    	sub    $0x98,%esp
    3222:	8b 45 0c             	mov    0xc(%ebp),%eax
    3225:	88 85 74 ff ff ff    	mov    %al,-0x8c(%ebp)
    322b:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    322f:	7f 19                	jg     324a <partition+0x31>
    3231:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3234:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3239:	89 c8                	mov    %ecx,%eax
    323b:	f7 ea                	imul   %edx
    323d:	d1 fa                	sar    %edx
    323f:	89 c8                	mov    %ecx,%eax
    3241:	c1 f8 1f             	sar    $0x1f,%eax
    3244:	29 c2                	sub    %eax,%edx
    3246:	89 d0                	mov    %edx,%eax
    3248:	eb 11                	jmp    325b <partition+0x42>
    324a:	8b 45 08             	mov    0x8(%ebp),%eax
    324d:	83 e8 10             	sub    $0x10,%eax
    3250:	8d 50 3f             	lea    0x3f(%eax),%edx
    3253:	85 c0                	test   %eax,%eax
    3255:	0f 48 c2             	cmovs  %edx,%eax
    3258:	c1 f8 06             	sar    $0x6,%eax
    325b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    325e:	80 bd 74 ff ff ff 00 	cmpb   $0x0,-0x8c(%ebp)
    3265:	0f 85 cc 00 00 00    	jne    3337 <partition+0x11e>
    326b:	83 ec 04             	sub    $0x4,%esp
    326e:	6a 50                	push   $0x50
    3270:	6a 00                	push   $0x0
    3272:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3275:	50                   	push   %eax
    3276:	e8 41 36 00 00       	call   68bc <Memset>
    327b:	83 c4 10             	add    $0x10,%esp
    327e:	83 ec 04             	sub    $0x4,%esp
    3281:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3284:	50                   	push   %eax
    3285:	6a 00                	push   $0x0
    3287:	ff 75 e8             	pushl  -0x18(%ebp)
    328a:	e8 df fe ff ff       	call   316e <get_partition_table>
    328f:	83 c4 10             	add    $0x10,%esp
    3292:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3299:	e9 8a 00 00 00       	jmp    3328 <partition+0x10f>
    329e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32a1:	83 c0 01             	add    $0x1,%eax
    32a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    32a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32aa:	c1 e0 04             	shl    $0x4,%eax
    32ad:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    32b0:	01 c8                	add    %ecx,%eax
    32b2:	83 e8 6c             	sub    $0x6c,%eax
    32b5:	8b 00                	mov    (%eax),%eax
    32b7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    32ba:	8b 55 e8             	mov    -0x18(%ebp),%edx
    32bd:	c1 e1 03             	shl    $0x3,%ecx
    32c0:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    32c6:	01 ca                	add    %ecx,%edx
    32c8:	81 c2 e4 d4 00 00    	add    $0xd4e4,%edx
    32ce:	89 02                	mov    %eax,(%edx)
    32d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d3:	c1 e0 04             	shl    $0x4,%eax
    32d6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    32d9:	01 c8                	add    %ecx,%eax
    32db:	83 e8 68             	sub    $0x68,%eax
    32de:	8b 00                	mov    (%eax),%eax
    32e0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    32e3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    32e6:	c1 e1 03             	shl    $0x3,%ecx
    32e9:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    32ef:	01 ca                	add    %ecx,%edx
    32f1:	81 c2 e8 d4 00 00    	add    $0xd4e8,%edx
    32f7:	89 02                	mov    %eax,(%edx)
    32f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32fc:	c1 e0 04             	shl    $0x4,%eax
    32ff:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3302:	01 c8                	add    %ecx,%eax
    3304:	83 e8 70             	sub    $0x70,%eax
    3307:	0f b6 00             	movzbl (%eax),%eax
    330a:	3c 05                	cmp    $0x5,%al
    330c:	75 16                	jne    3324 <partition+0x10b>
    330e:	8b 55 08             	mov    0x8(%ebp),%edx
    3311:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3314:	01 d0                	add    %edx,%eax
    3316:	83 ec 08             	sub    $0x8,%esp
    3319:	6a 01                	push   $0x1
    331b:	50                   	push   %eax
    331c:	e8 f8 fe ff ff       	call   3219 <partition>
    3321:	83 c4 10             	add    $0x10,%esp
    3324:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3328:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    332c:	0f 8e 6c ff ff ff    	jle    329e <partition+0x85>
    3332:	e9 28 01 00 00       	jmp    345f <partition+0x246>
    3337:	80 bd 74 ff ff ff 01 	cmpb   $0x1,-0x8c(%ebp)
    333e:	0f 85 03 01 00 00    	jne    3447 <partition+0x22e>
    3344:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3347:	ba 67 66 66 66       	mov    $0x66666667,%edx
    334c:	89 c8                	mov    %ecx,%eax
    334e:	f7 ea                	imul   %edx
    3350:	d1 fa                	sar    %edx
    3352:	89 c8                	mov    %ecx,%eax
    3354:	c1 f8 1f             	sar    $0x1f,%eax
    3357:	29 c2                	sub    %eax,%edx
    3359:	89 d0                	mov    %edx,%eax
    335b:	c1 e0 02             	shl    $0x2,%eax
    335e:	01 d0                	add    %edx,%eax
    3360:	29 c1                	sub    %eax,%ecx
    3362:	89 c8                	mov    %ecx,%eax
    3364:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3367:	8b 55 e0             	mov    -0x20(%ebp),%edx
    336a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    336d:	c1 e2 03             	shl    $0x3,%edx
    3370:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3376:	01 d0                	add    %edx,%eax
    3378:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    337d:	8b 00                	mov    (%eax),%eax
    337f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3382:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3385:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3388:	8b 45 e0             	mov    -0x20(%ebp),%eax
    338b:	83 e8 01             	sub    $0x1,%eax
    338e:	c1 e0 04             	shl    $0x4,%eax
    3391:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3394:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    339b:	e9 9b 00 00 00       	jmp    343b <partition+0x222>
    33a0:	83 ec 04             	sub    $0x4,%esp
    33a3:	6a 50                	push   $0x50
    33a5:	6a 00                	push   $0x0
    33a7:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33aa:	50                   	push   %eax
    33ab:	e8 0c 35 00 00       	call   68bc <Memset>
    33b0:	83 c4 10             	add    $0x10,%esp
    33b3:	83 ec 04             	sub    $0x4,%esp
    33b6:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33b9:	50                   	push   %eax
    33ba:	ff 75 f0             	pushl  -0x10(%ebp)
    33bd:	ff 75 e8             	pushl  -0x18(%ebp)
    33c0:	e8 a9 fd ff ff       	call   316e <get_partition_table>
    33c5:	83 c4 10             	add    $0x10,%esp
    33c8:	83 ec 0c             	sub    $0xc,%esp
    33cb:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33ce:	50                   	push   %eax
    33cf:	e8 76 fd ff ff       	call   314a <print_dpt_entry>
    33d4:	83 c4 10             	add    $0x10,%esp
    33d7:	8b 55 d8             	mov    -0x28(%ebp),%edx
    33da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33dd:	01 d0                	add    %edx,%eax
    33df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    33e2:	8b 55 8c             	mov    -0x74(%ebp),%edx
    33e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33e8:	01 c2                	add    %eax,%edx
    33ea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    33ed:	8d 48 04             	lea    0x4(%eax),%ecx
    33f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    33f3:	c1 e1 03             	shl    $0x3,%ecx
    33f6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    33fc:	01 c8                	add    %ecx,%eax
    33fe:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    3403:	89 10                	mov    %edx,(%eax)
    3405:	8b 45 90             	mov    -0x70(%ebp),%eax
    3408:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    340b:	8d 4a 04             	lea    0x4(%edx),%ecx
    340e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3411:	c1 e1 03             	shl    $0x3,%ecx
    3414:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    341a:	01 ca                	add    %ecx,%edx
    341c:	81 c2 e8 d4 00 00    	add    $0xd4e8,%edx
    3422:	89 02                	mov    %eax,(%edx)
    3424:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
    3428:	84 c0                	test   %al,%al
    342a:	74 32                	je     345e <partition+0x245>
    342c:	8b 55 9c             	mov    -0x64(%ebp),%edx
    342f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3432:	01 d0                	add    %edx,%eax
    3434:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3437:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    343b:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
    343f:	0f 8e 5b ff ff ff    	jle    33a0 <partition+0x187>
    3445:	eb 18                	jmp    345f <partition+0x246>
    3447:	83 ec 08             	sub    $0x8,%esp
    344a:	68 f1 66 00 00       	push   $0x66f1
    344f:	68 0b 66 00 00       	push   $0x660b
    3454:	e8 a8 ea ff ff       	call   1f01 <Printf>
    3459:	83 c4 10             	add    $0x10,%esp
    345c:	eb 01                	jmp    345f <partition+0x246>
    345e:	90                   	nop
    345f:	90                   	nop
    3460:	c9                   	leave  
    3461:	c3                   	ret    

00003462 <hd_open>:
    3462:	55                   	push   %ebp
    3463:	89 e5                	mov    %esp,%ebp
    3465:	83 ec 18             	sub    $0x18,%esp
    3468:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    346f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3472:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3478:	05 e0 d4 00 00       	add    $0xd4e0,%eax
    347d:	8b 00                	mov    (%eax),%eax
    347f:	8d 50 01             	lea    0x1(%eax),%edx
    3482:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3485:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    348b:	05 e0 d4 00 00       	add    $0xd4e0,%eax
    3490:	89 10                	mov    %edx,(%eax)
    3492:	83 ec 0c             	sub    $0xc,%esp
    3495:	6a 00                	push   $0x0
    3497:	e8 d9 f9 ff ff       	call   2e75 <hd_identify>
    349c:	83 c4 10             	add    $0x10,%esp
    349f:	83 ec 08             	sub    $0x8,%esp
    34a2:	6a 00                	push   $0x0
    34a4:	6a 00                	push   $0x0
    34a6:	e8 6e fd ff ff       	call   3219 <partition>
    34ab:	83 c4 10             	add    $0x10,%esp
    34ae:	90                   	nop
    34af:	c9                   	leave  
    34b0:	c3                   	ret    

000034b1 <get_hd_ioctl>:
    34b1:	55                   	push   %ebp
    34b2:	89 e5                	mov    %esp,%ebp
    34b4:	83 ec 18             	sub    $0x18,%esp
    34b7:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    34bb:	7f 19                	jg     34d6 <get_hd_ioctl+0x25>
    34bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    34c0:	ba 67 66 66 66       	mov    $0x66666667,%edx
    34c5:	89 c8                	mov    %ecx,%eax
    34c7:	f7 ea                	imul   %edx
    34c9:	d1 fa                	sar    %edx
    34cb:	89 c8                	mov    %ecx,%eax
    34cd:	c1 f8 1f             	sar    $0x1f,%eax
    34d0:	29 c2                	sub    %eax,%edx
    34d2:	89 d0                	mov    %edx,%eax
    34d4:	eb 11                	jmp    34e7 <get_hd_ioctl+0x36>
    34d6:	8b 45 08             	mov    0x8(%ebp),%eax
    34d9:	83 e8 10             	sub    $0x10,%eax
    34dc:	8d 50 3f             	lea    0x3f(%eax),%edx
    34df:	85 c0                	test   %eax,%eax
    34e1:	0f 48 c2             	cmovs  %edx,%eax
    34e4:	c1 f8 06             	sar    $0x6,%eax
    34e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    34ea:	8b 55 08             	mov    0x8(%ebp),%edx
    34ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34f0:	c1 e2 03             	shl    $0x3,%edx
    34f3:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    34f9:	01 d0                	add    %edx,%eax
    34fb:	05 e8 d4 00 00       	add    $0xd4e8,%eax
    3500:	8b 00                	mov    (%eax),%eax
    3502:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3505:	83 ec 08             	sub    $0x8,%esp
    3508:	ff 75 f0             	pushl  -0x10(%ebp)
    350b:	68 fc 66 00 00       	push   $0x66fc
    3510:	e8 ec e9 ff ff       	call   1f01 <Printf>
    3515:	83 c4 10             	add    $0x10,%esp
    3518:	8b 45 f0             	mov    -0x10(%ebp),%eax
    351b:	c9                   	leave  
    351c:	c3                   	ret    

0000351d <wait_for>:
    351d:	55                   	push   %ebp
    351e:	89 e5                	mov    %esp,%ebp
    3520:	83 ec 08             	sub    $0x8,%esp
    3523:	83 ec 04             	sub    $0x4,%esp
    3526:	68 10 27 00 00       	push   $0x2710
    352b:	6a 08                	push   $0x8
    352d:	6a 08                	push   $0x8
    352f:	e8 a3 02 00 00       	call   37d7 <waitfor>
    3534:	83 c4 10             	add    $0x10,%esp
    3537:	85 c0                	test   %eax,%eax
    3539:	75 10                	jne    354b <wait_for+0x2e>
    353b:	83 ec 0c             	sub    $0xc,%esp
    353e:	68 09 67 00 00       	push   $0x6709
    3543:	e8 e8 ec ff ff       	call   2230 <panic>
    3548:	83 c4 10             	add    $0x10,%esp
    354b:	90                   	nop
    354c:	c9                   	leave  
    354d:	c3                   	ret    

0000354e <interrupt_wait>:
    354e:	55                   	push   %ebp
    354f:	89 e5                	mov    %esp,%ebp
    3551:	83 ec 78             	sub    $0x78,%esp
    3554:	83 ec 04             	sub    $0x4,%esp
    3557:	6a f6                	push   $0xfffffff6
    3559:	8d 45 90             	lea    -0x70(%ebp),%eax
    355c:	50                   	push   %eax
    355d:	6a 02                	push   $0x2
    355f:	e8 1c f4 ff ff       	call   2980 <send_rec>
    3564:	83 c4 10             	add    $0x10,%esp
    3567:	90                   	nop
    3568:	c9                   	leave  
    3569:	c3                   	ret    

0000356a <hd_rdwt>:
    356a:	55                   	push   %ebp
    356b:	89 e5                	mov    %esp,%ebp
    356d:	53                   	push   %ebx
    356e:	83 ec 44             	sub    $0x44,%esp
    3571:	8b 45 08             	mov    0x8(%ebp),%eax
    3574:	8b 40 18             	mov    0x18(%eax),%eax
    3577:	89 45 e8             	mov    %eax,-0x18(%ebp)
    357a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    3581:	8b 45 08             	mov    0x8(%ebp),%eax
    3584:	8b 40 14             	mov    0x14(%eax),%eax
    3587:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    358a:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
    358e:	7f 19                	jg     35a9 <hd_rdwt+0x3f>
    3590:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3593:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3598:	89 c8                	mov    %ecx,%eax
    359a:	f7 ea                	imul   %edx
    359c:	d1 fa                	sar    %edx
    359e:	89 c8                	mov    %ecx,%eax
    35a0:	c1 f8 1f             	sar    $0x1f,%eax
    35a3:	29 c2                	sub    %eax,%edx
    35a5:	89 d0                	mov    %edx,%eax
    35a7:	eb 11                	jmp    35ba <hd_rdwt+0x50>
    35a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35ac:	83 e8 10             	sub    $0x10,%eax
    35af:	8d 50 3f             	lea    0x3f(%eax),%edx
    35b2:	85 c0                	test   %eax,%eax
    35b4:	0f 48 c2             	cmovs  %edx,%eax
    35b7:	c1 f8 06             	sar    $0x6,%eax
    35ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
    35bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35c0:	8d 50 f0             	lea    -0x10(%eax),%edx
    35c3:	89 d0                	mov    %edx,%eax
    35c5:	c1 f8 1f             	sar    $0x1f,%eax
    35c8:	c1 e8 1a             	shr    $0x1a,%eax
    35cb:	01 c2                	add    %eax,%edx
    35cd:	83 e2 3f             	and    $0x3f,%edx
    35d0:	29 c2                	sub    %eax,%edx
    35d2:	89 d0                	mov    %edx,%eax
    35d4:	89 45 dc             	mov    %eax,-0x24(%ebp)
    35d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35da:	8b 55 ec             	mov    -0x14(%ebp),%edx
    35dd:	0f ac d0 09          	shrd   $0x9,%edx,%eax
    35e1:	c1 ea 09             	shr    $0x9,%edx
    35e4:	89 c1                	mov    %eax,%ecx
    35e6:	89 d3                	mov    %edx,%ebx
    35e8:	89 4d d8             	mov    %ecx,-0x28(%ebp)
    35eb:	83 7d e4 08          	cmpl   $0x8,-0x1c(%ebp)
    35ef:	7f 1a                	jg     360b <hd_rdwt+0xa1>
    35f1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    35f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35f7:	c1 e2 03             	shl    $0x3,%edx
    35fa:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3600:	01 d0                	add    %edx,%eax
    3602:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    3607:	8b 00                	mov    (%eax),%eax
    3609:	eb 1b                	jmp    3626 <hd_rdwt+0xbc>
    360b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    360e:	8d 50 04             	lea    0x4(%eax),%edx
    3611:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3614:	c1 e2 03             	shl    $0x3,%edx
    3617:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    361d:	01 d0                	add    %edx,%eax
    361f:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    3624:	8b 00                	mov    (%eax),%eax
    3626:	8b 55 d8             	mov    -0x28(%ebp),%edx
    3629:	01 d0                	add    %edx,%eax
    362b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    362e:	8b 45 08             	mov    0x8(%ebp),%eax
    3631:	8b 40 0c             	mov    0xc(%eax),%eax
    3634:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3637:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    363a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    363d:	8b 45 08             	mov    0x8(%ebp),%eax
    3640:	8b 40 10             	mov    0x10(%eax),%eax
    3643:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3646:	8b 45 08             	mov    0x8(%ebp),%eax
    3649:	8b 00                	mov    (%eax),%eax
    364b:	89 45 cc             	mov    %eax,-0x34(%ebp)
    364e:	83 ec 08             	sub    $0x8,%esp
    3651:	ff 75 d0             	pushl  -0x30(%ebp)
    3654:	ff 75 cc             	pushl  -0x34(%ebp)
    3657:	e8 3f 19 00 00       	call   4f9b <v2l>
    365c:	83 c4 10             	add    $0x10,%esp
    365f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3662:	8b 45 08             	mov    0x8(%ebp),%eax
    3665:	8b 40 04             	mov    0x4(%eax),%eax
    3668:	89 45 c8             	mov    %eax,-0x38(%ebp)
    366b:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    366f:	74 22                	je     3693 <hd_rdwt+0x129>
    3671:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    3675:	74 1c                	je     3693 <hd_rdwt+0x129>
    3677:	68 71 01 00 00       	push   $0x171
    367c:	68 1b 67 00 00       	push   $0x671b
    3681:	68 1b 67 00 00       	push   $0x671b
    3686:	68 23 67 00 00       	push   $0x6723
    368b:	e8 be eb ff ff       	call   224e <assertion_failure>
    3690:	83 c4 10             	add    $0x10,%esp
    3693:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    3697:	c6 45 be 01          	movb   $0x1,-0x42(%ebp)
    369b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    369e:	88 45 bf             	mov    %al,-0x41(%ebp)
    36a1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    36a4:	c1 f8 08             	sar    $0x8,%eax
    36a7:	88 45 c0             	mov    %al,-0x40(%ebp)
    36aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
    36ad:	c1 f8 10             	sar    $0x10,%eax
    36b0:	88 45 c1             	mov    %al,-0x3f(%ebp)
    36b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    36b6:	c1 f8 18             	sar    $0x18,%eax
    36b9:	83 e0 0f             	and    $0xf,%eax
    36bc:	83 c8 e0             	or     $0xffffffe0,%eax
    36bf:	88 45 c2             	mov    %al,-0x3e(%ebp)
    36c2:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    36c6:	75 07                	jne    36cf <hd_rdwt+0x165>
    36c8:	b8 20 00 00 00       	mov    $0x20,%eax
    36cd:	eb 05                	jmp    36d4 <hd_rdwt+0x16a>
    36cf:	b8 30 00 00 00       	mov    $0x30,%eax
    36d4:	88 45 c3             	mov    %al,-0x3d(%ebp)
    36d7:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    36db:	c6 45 be 01          	movb   $0x1,-0x42(%ebp)
    36df:	c6 45 bf 4f          	movb   $0x4f,-0x41(%ebp)
    36e3:	c6 45 c1 00          	movb   $0x0,-0x3f(%ebp)
    36e7:	c6 45 c2 e0          	movb   $0xe0,-0x3e(%ebp)
    36eb:	c6 45 c3 30          	movb   $0x30,-0x3d(%ebp)
    36ef:	83 ec 0c             	sub    $0xc,%esp
    36f2:	8d 45 bd             	lea    -0x43(%ebp),%eax
    36f5:	50                   	push   %eax
    36f6:	e8 78 f6 ff ff       	call   2d73 <hd_cmd_out>
    36fb:	83 c4 10             	add    $0x10,%esp
    36fe:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
    3705:	e9 91 00 00 00       	jmp    379b <hd_rdwt+0x231>
    370a:	b8 00 02 00 00       	mov    $0x200,%eax
    370f:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
    3716:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
    371a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    371d:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    3721:	75 31                	jne    3754 <hd_rdwt+0x1ea>
    3723:	e8 26 fe ff ff       	call   354e <interrupt_wait>
    3728:	83 ec 04             	sub    $0x4,%esp
    372b:	6a 64                	push   $0x64
    372d:	6a 00                	push   $0x0
    372f:	ff 75 f0             	pushl  -0x10(%ebp)
    3732:	e8 85 31 00 00       	call   68bc <Memset>
    3737:	83 c4 10             	add    $0x10,%esp
    373a:	83 ec 04             	sub    $0x4,%esp
    373d:	68 00 02 00 00       	push   $0x200
    3742:	ff 75 f0             	pushl  -0x10(%ebp)
    3745:	68 f0 01 00 00       	push   $0x1f0
    374a:	e8 c1 31 00 00       	call   6910 <read_port>
    374f:	83 c4 10             	add    $0x10,%esp
    3752:	eb 3b                	jmp    378f <hd_rdwt+0x225>
    3754:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    3758:	75 35                	jne    378f <hd_rdwt+0x225>
    375a:	e8 be fd ff ff       	call   351d <wait_for>
    375f:	83 ec 04             	sub    $0x4,%esp
    3762:	68 00 02 00 00       	push   $0x200
    3767:	6a ff                	push   $0xffffffff
    3769:	ff 75 f0             	pushl  -0x10(%ebp)
    376c:	e8 4b 31 00 00       	call   68bc <Memset>
    3771:	83 c4 10             	add    $0x10,%esp
    3774:	83 ec 04             	sub    $0x4,%esp
    3777:	ff 75 c4             	pushl  -0x3c(%ebp)
    377a:	ff 75 f0             	pushl  -0x10(%ebp)
    377d:	68 f0 01 00 00       	push   $0x1f0
    3782:	e8 9d 31 00 00       	call   6924 <write_port>
    3787:	83 c4 10             	add    $0x10,%esp
    378a:	e8 bf fd ff ff       	call   354e <interrupt_wait>
    378f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3792:	29 45 f4             	sub    %eax,-0xc(%ebp)
    3795:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3798:	01 45 f0             	add    %eax,-0x10(%ebp)
    379b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    379f:	0f 85 65 ff ff ff    	jne    370a <hd_rdwt+0x1a0>
    37a5:	90                   	nop
    37a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    37a9:	c9                   	leave  
    37aa:	c3                   	ret    

000037ab <hd_handler>:
    37ab:	55                   	push   %ebp
    37ac:	89 e5                	mov    %esp,%ebp
    37ae:	83 ec 18             	sub    $0x18,%esp
    37b1:	83 ec 0c             	sub    $0xc,%esp
    37b4:	68 f7 01 00 00       	push   $0x1f7
    37b9:	e8 0c db ff ff       	call   12ca <in_byte>
    37be:	83 c4 10             	add    $0x10,%esp
    37c1:	0f b6 c0             	movzbl %al,%eax
    37c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    37c7:	83 ec 0c             	sub    $0xc,%esp
    37ca:	6a 02                	push   $0x2
    37cc:	e8 56 f3 ff ff       	call   2b27 <inform_int>
    37d1:	83 c4 10             	add    $0x10,%esp
    37d4:	90                   	nop
    37d5:	c9                   	leave  
    37d6:	c3                   	ret    

000037d7 <waitfor>:
    37d7:	55                   	push   %ebp
    37d8:	89 e5                	mov    %esp,%ebp
    37da:	83 ec 18             	sub    $0x18,%esp
    37dd:	e8 4e 00 00 00       	call   3830 <get_ticks>
    37e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    37e5:	eb 22                	jmp    3809 <waitfor+0x32>
    37e7:	83 ec 0c             	sub    $0xc,%esp
    37ea:	68 f7 01 00 00       	push   $0x1f7
    37ef:	e8 d6 da ff ff       	call   12ca <in_byte>
    37f4:	83 c4 10             	add    $0x10,%esp
    37f7:	0f b6 c0             	movzbl %al,%eax
    37fa:	23 45 08             	and    0x8(%ebp),%eax
    37fd:	39 45 0c             	cmp    %eax,0xc(%ebp)
    3800:	75 07                	jne    3809 <waitfor+0x32>
    3802:	b8 01 00 00 00       	mov    $0x1,%eax
    3807:	eb 1d                	jmp    3826 <waitfor+0x4f>
    3809:	e8 22 00 00 00       	call   3830 <get_ticks>
    380e:	2b 45 f4             	sub    -0xc(%ebp),%eax
    3811:	89 c2                	mov    %eax,%edx
    3813:	89 d0                	mov    %edx,%eax
    3815:	c1 e0 02             	shl    $0x2,%eax
    3818:	01 d0                	add    %edx,%eax
    381a:	01 c0                	add    %eax,%eax
    381c:	39 45 10             	cmp    %eax,0x10(%ebp)
    381f:	7f c6                	jg     37e7 <waitfor+0x10>
    3821:	b8 00 00 00 00       	mov    $0x0,%eax
    3826:	c9                   	leave  
    3827:	c3                   	ret    
    3828:	66 90                	xchg   %ax,%ax
    382a:	66 90                	xchg   %ax,%ax
    382c:	66 90                	xchg   %ax,%ax
    382e:	66 90                	xchg   %ax,%ax

00003830 <get_ticks>:
    3830:	b8 00 00 00 00       	mov    $0x0,%eax
    3835:	cd 90                	int    $0x90
    3837:	c3                   	ret    

00003838 <write2>:
    3838:	b8 01 00 00 00       	mov    $0x1,%eax
    383d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    3841:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3845:	cd 90                	int    $0x90
    3847:	c3                   	ret    

00003848 <write_debug>:
    3848:	b8 02 00 00 00       	mov    $0x2,%eax
    384d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    3851:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3855:	cd 90                	int    $0x90
    3857:	c3                   	ret    

00003858 <send_msg>:
    3858:	b8 03 00 00 00       	mov    $0x3,%eax
    385d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    3861:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3865:	cd 90                	int    $0x90
    3867:	c3                   	ret    

00003868 <receive_msg>:
    3868:	b8 04 00 00 00       	mov    $0x4,%eax
    386d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    3871:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3875:	cd 90                	int    $0x90
    3877:	c3                   	ret    

00003878 <task_fs>:
    3878:	55                   	push   %ebp
    3879:	89 e5                	mov    %esp,%ebp
    387b:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    3881:	83 ec 08             	sub    $0x8,%esp
    3884:	68 48 67 00 00       	push   $0x6748
    3889:	68 56 67 00 00       	push   $0x6756
    388e:	e8 6e e6 ff ff       	call   1f01 <Printf>
    3893:	83 c4 10             	add    $0x10,%esp
    3896:	e8 5b 01 00 00       	call   39f6 <init_fs>
    389b:	83 ec 04             	sub    $0x4,%esp
    389e:	6a 11                	push   $0x11
    38a0:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
    38a6:	50                   	push   %eax
    38a7:	6a 02                	push   $0x2
    38a9:	e8 d2 f0 ff ff       	call   2980 <send_rec>
    38ae:	83 c4 10             	add    $0x10,%esp
    38b1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
    38b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    38ba:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    38c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    38c3:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
    38c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    38cc:	8b 85 48 ff ff ff    	mov    -0xb8(%ebp),%eax
    38d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    38d5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    38db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    38de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    38e1:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    38e7:	05 20 4f 01 00       	add    $0x14f20,%eax
    38ec:	a3 a4 a2 00 00       	mov    %eax,0xa2a4
    38f1:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    38f5:	74 1c                	je     3913 <task_fs+0x9b>
    38f7:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    38fb:	7f 08                	jg     3905 <task_fs+0x8d>
    38fd:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    3901:	74 3a                	je     393d <task_fs+0xc5>
    3903:	eb 48                	jmp    394d <task_fs+0xd5>
    3905:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3909:	74 1e                	je     3929 <task_fs+0xb1>
    390b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    390f:	74 18                	je     3929 <task_fs+0xb1>
    3911:	eb 3a                	jmp    394d <task_fs+0xd5>
    3913:	83 ec 08             	sub    $0x8,%esp
    3916:	ff 75 e4             	pushl  -0x1c(%ebp)
    3919:	ff 75 e8             	pushl  -0x18(%ebp)
    391c:	e8 fe 00 00 00       	call   3a1f <do_open>
    3921:	83 c4 10             	add    $0x10,%esp
    3924:	89 45 bc             	mov    %eax,-0x44(%ebp)
    3927:	eb 35                	jmp    395e <task_fs+0xe6>
    3929:	83 ec 0c             	sub    $0xc,%esp
    392c:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
    3932:	50                   	push   %eax
    3933:	e8 b4 0f 00 00       	call   48ec <do_rdwt>
    3938:	83 c4 10             	add    $0x10,%esp
    393b:	eb 21                	jmp    395e <task_fs+0xe6>
    393d:	83 ec 0c             	sub    $0xc,%esp
    3940:	ff 75 ec             	pushl  -0x14(%ebp)
    3943:	e8 85 13 00 00       	call   4ccd <do_close>
    3948:	83 c4 10             	add    $0x10,%esp
    394b:	eb 11                	jmp    395e <task_fs+0xe6>
    394d:	83 ec 0c             	sub    $0xc,%esp
    3950:	68 5a 67 00 00       	push   $0x675a
    3955:	e8 d6 e8 ff ff       	call   2230 <panic>
    395a:	83 c4 10             	add    $0x10,%esp
    395d:	90                   	nop
    395e:	c7 45 80 65 00 00 00 	movl   $0x65,-0x80(%ebp)
    3965:	83 ec 04             	sub    $0x4,%esp
    3968:	ff 75 f0             	pushl  -0x10(%ebp)
    396b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    3971:	50                   	push   %eax
    3972:	6a 01                	push   $0x1
    3974:	e8 07 f0 ff ff       	call   2980 <send_rec>
    3979:	83 c4 10             	add    $0x10,%esp
    397c:	e9 1a ff ff ff       	jmp    389b <task_fs+0x23>

00003981 <rd_wt>:
    3981:	55                   	push   %ebp
    3982:	89 e5                	mov    %esp,%ebp
    3984:	83 ec 78             	sub    $0x78,%esp
    3987:	83 ec 04             	sub    $0x4,%esp
    398a:	6a 68                	push   $0x68
    398c:	6a 00                	push   $0x0
    398e:	8d 45 90             	lea    -0x70(%ebp),%eax
    3991:	50                   	push   %eax
    3992:	e8 25 2f 00 00       	call   68bc <Memset>
    3997:	83 c4 10             	add    $0x10,%esp
    399a:	8b 45 18             	mov    0x18(%ebp),%eax
    399d:	89 45 94             	mov    %eax,-0x6c(%ebp)
    39a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    39a3:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    39a6:	8b 45 10             	mov    0x10(%ebp),%eax
    39a9:	89 45 a0             	mov    %eax,-0x60(%ebp)
    39ac:	8b 45 14             	mov    0x14(%ebp),%eax
    39af:	89 45 9c             	mov    %eax,-0x64(%ebp)
    39b2:	8b 45 08             	mov    0x8(%ebp),%eax
    39b5:	89 45 a8             	mov    %eax,-0x58(%ebp)
    39b8:	83 ec 04             	sub    $0x4,%esp
    39bb:	6a 02                	push   $0x2
    39bd:	8d 45 90             	lea    -0x70(%ebp),%eax
    39c0:	50                   	push   %eax
    39c1:	6a 03                	push   $0x3
    39c3:	e8 b8 ef ff ff       	call   2980 <send_rec>
    39c8:	83 c4 10             	add    $0x10,%esp
    39cb:	90                   	nop
    39cc:	c9                   	leave  
    39cd:	c3                   	ret    

000039ce <mkfs>:
    39ce:	55                   	push   %ebp
    39cf:	89 e5                	mov    %esp,%ebp
    39d1:	83 ec 28             	sub    $0x28,%esp
    39d4:	a1 10 90 00 00       	mov    0x9010,%eax
    39d9:	83 ec 0c             	sub    $0xc,%esp
    39dc:	6a 07                	push   $0x7
    39de:	68 00 02 00 00       	push   $0x200
    39e3:	50                   	push   %eax
    39e4:	6a 20                	push   $0x20
    39e6:	68 00 02 00 00       	push   $0x200
    39eb:	e8 91 ff ff ff       	call   3981 <rd_wt>
    39f0:	83 c4 20             	add    $0x20,%esp
    39f3:	90                   	nop
    39f4:	c9                   	leave  
    39f5:	c3                   	ret    

000039f6 <init_fs>:
    39f6:	55                   	push   %ebp
    39f7:	89 e5                	mov    %esp,%ebp
    39f9:	83 ec 78             	sub    $0x78,%esp
    39fc:	c7 45 94 06 00 00 00 	movl   $0x6,-0x6c(%ebp)
    3a03:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
    3a0a:	83 ec 04             	sub    $0x4,%esp
    3a0d:	6a 02                	push   $0x2
    3a0f:	8d 45 90             	lea    -0x70(%ebp),%eax
    3a12:	50                   	push   %eax
    3a13:	6a 03                	push   $0x3
    3a15:	e8 66 ef ff ff       	call   2980 <send_rec>
    3a1a:	83 c4 10             	add    $0x10,%esp
    3a1d:	c9                   	leave  
    3a1e:	c3                   	ret    

00003a1f <do_open>:
    3a1f:	55                   	push   %ebp
    3a20:	89 e5                	mov    %esp,%ebp
    3a22:	83 ec 28             	sub    $0x28,%esp
    3a25:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
    3a2c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3a33:	eb 1f                	jmp    3a54 <do_open+0x35>
    3a35:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    3a3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3a3d:	83 c2 1c             	add    $0x1c,%edx
    3a40:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    3a44:	85 c0                	test   %eax,%eax
    3a46:	75 08                	jne    3a50 <do_open+0x31>
    3a48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3a4e:	eb 0a                	jmp    3a5a <do_open+0x3b>
    3a50:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3a54:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    3a58:	7e db                	jle    3a35 <do_open+0x16>
    3a5a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    3a5e:	75 1c                	jne    3a7c <do_open+0x5d>
    3a60:	68 24 01 00 00       	push   $0x124
    3a65:	68 6a 67 00 00       	push   $0x676a
    3a6a:	68 6a 67 00 00       	push   $0x676a
    3a6f:	68 77 67 00 00       	push   $0x6777
    3a74:	e8 d5 e7 ff ff       	call   224e <assertion_failure>
    3a79:	83 c4 10             	add    $0x10,%esp
    3a7c:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
    3a83:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3a8a:	eb 1d                	jmp    3aa9 <do_open+0x8a>
    3a8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3a8f:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3a96:	8b 40 08             	mov    0x8(%eax),%eax
    3a99:	85 c0                	test   %eax,%eax
    3a9b:	75 08                	jne    3aa5 <do_open+0x86>
    3a9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3aa0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3aa3:	eb 0a                	jmp    3aaf <do_open+0x90>
    3aa5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3aa9:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
    3aad:	7e dd                	jle    3a8c <do_open+0x6d>
    3aaf:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
    3ab3:	75 1c                	jne    3ad1 <do_open+0xb2>
    3ab5:	68 2e 01 00 00       	push   $0x12e
    3aba:	68 6a 67 00 00       	push   $0x676a
    3abf:	68 6a 67 00 00       	push   $0x676a
    3ac4:	68 7f 67 00 00       	push   $0x677f
    3ac9:	e8 80 e7 ff ff       	call   224e <assertion_failure>
    3ace:	83 c4 10             	add    $0x10,%esp
    3ad1:	83 ec 0c             	sub    $0xc,%esp
    3ad4:	ff 75 08             	pushl  0x8(%ebp)
    3ad7:	e8 ab 00 00 00       	call   3b87 <search_file>
    3adc:	83 c4 10             	add    $0x10,%esp
    3adf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3ae2:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
    3ae6:	75 29                	jne    3b11 <do_open+0xf2>
    3ae8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3aec:	7e 10                	jle    3afe <do_open+0xdf>
    3aee:	83 ec 0c             	sub    $0xc,%esp
    3af1:	68 87 67 00 00       	push   $0x6787
    3af6:	e8 35 e7 ff ff       	call   2230 <panic>
    3afb:	83 c4 10             	add    $0x10,%esp
    3afe:	83 ec 0c             	sub    $0xc,%esp
    3b01:	ff 75 08             	pushl  0x8(%ebp)
    3b04:	e8 bf 03 00 00       	call   3ec8 <create_file>
    3b09:	83 c4 10             	add    $0x10,%esp
    3b0c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3b0f:	eb 11                	jmp    3b22 <do_open+0x103>
    3b11:	83 ec 0c             	sub    $0xc,%esp
    3b14:	ff 75 e0             	pushl  -0x20(%ebp)
    3b17:	e8 78 02 00 00       	call   3d94 <get_inode>
    3b1c:	83 c4 10             	add    $0x10,%esp
    3b1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3b22:	83 ec 0c             	sub    $0xc,%esp
    3b25:	68 94 67 00 00       	push   $0x6794
    3b2a:	e8 01 e7 ff ff       	call   2230 <panic>
    3b2f:	83 c4 10             	add    $0x10,%esp
    3b32:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    3b37:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3b3a:	8b 14 95 20 d7 00 00 	mov    0xd720(,%edx,4),%edx
    3b41:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3b44:	83 c1 1c             	add    $0x1c,%ecx
    3b47:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    3b4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b4e:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3b55:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    3b58:	89 50 08             	mov    %edx,0x8(%eax)
    3b5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b5e:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3b65:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    3b6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b6f:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3b76:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    3b7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b7f:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3b82:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3b85:	c9                   	leave  
    3b86:	c3                   	ret    

00003b87 <search_file>:
    3b87:	55                   	push   %ebp
    3b88:	89 e5                	mov    %esp,%ebp
    3b8a:	83 ec 48             	sub    $0x48,%esp
    3b8d:	83 ec 04             	sub    $0x4,%esp
    3b90:	ff 75 e4             	pushl  -0x1c(%ebp)
    3b93:	ff 75 08             	pushl  0x8(%ebp)
    3b96:	8d 45 ba             	lea    -0x46(%ebp),%eax
    3b99:	50                   	push   %eax
    3b9a:	e8 18 01 00 00       	call   3cb7 <strip_path>
    3b9f:	83 c4 10             	add    $0x10,%esp
    3ba2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3ba5:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3ba9:	75 1c                	jne    3bc7 <search_file+0x40>
    3bab:	68 53 01 00 00       	push   $0x153
    3bb0:	68 6a 67 00 00       	push   $0x676a
    3bb5:	68 6a 67 00 00       	push   $0x676a
    3bba:	68 a7 67 00 00       	push   $0x67a7
    3bbf:	e8 8a e6 ff ff       	call   224e <assertion_failure>
    3bc4:	83 c4 10             	add    $0x10,%esp
    3bc7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3bca:	8b 40 04             	mov    0x4(%eax),%eax
    3bcd:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3bd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3bd3:	05 00 02 00 00       	add    $0x200,%eax
    3bd8:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    3bde:	85 c0                	test   %eax,%eax
    3be0:	0f 48 c2             	cmovs  %edx,%eax
    3be3:	c1 f8 09             	sar    $0x9,%eax
    3be6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3be9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3bec:	8b 40 04             	mov    0x4(%eax),%eax
    3bef:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    3bf4:	f7 e2                	mul    %edx
    3bf6:	89 d0                	mov    %edx,%eax
    3bf8:	c1 e8 02             	shr    $0x2,%eax
    3bfb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3bfe:	e8 3d 11 00 00       	call   4d40 <get_super_block>
    3c03:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3c06:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3c09:	8b 00                	mov    (%eax),%eax
    3c0b:	89 45 cc             	mov    %eax,-0x34(%ebp)
    3c0e:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    3c13:	89 45 c8             	mov    %eax,-0x38(%ebp)
    3c16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3c1d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3c24:	eb 7e                	jmp    3ca4 <search_file+0x11d>
    3c26:	a1 10 90 00 00       	mov    0x9010,%eax
    3c2b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3c2e:	89 d1                	mov    %edx,%ecx
    3c30:	c1 e1 09             	shl    $0x9,%ecx
    3c33:	8b 55 cc             	mov    -0x34(%ebp),%edx
    3c36:	01 ca                	add    %ecx,%edx
    3c38:	83 ec 0c             	sub    $0xc,%esp
    3c3b:	6a 07                	push   $0x7
    3c3d:	68 00 02 00 00       	push   $0x200
    3c42:	50                   	push   %eax
    3c43:	ff 75 c8             	pushl  -0x38(%ebp)
    3c46:	52                   	push   %edx
    3c47:	e8 35 fd ff ff       	call   3981 <rd_wt>
    3c4c:	83 c4 20             	add    $0x20,%esp
    3c4f:	a1 10 90 00 00       	mov    0x9010,%eax
    3c54:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3c57:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3c5e:	eb 35                	jmp    3c95 <search_file+0x10e>
    3c60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3c64:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c67:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3c6a:	7f 33                	jg     3c9f <search_file+0x118>
    3c6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c6f:	83 c0 04             	add    $0x4,%eax
    3c72:	83 ec 08             	sub    $0x8,%esp
    3c75:	50                   	push   %eax
    3c76:	8d 45 ba             	lea    -0x46(%ebp),%eax
    3c79:	50                   	push   %eax
    3c7a:	e8 a6 00 00 00       	call   3d25 <strcmp>
    3c7f:	83 c4 10             	add    $0x10,%esp
    3c82:	85 c0                	test   %eax,%eax
    3c84:	75 07                	jne    3c8d <search_file+0x106>
    3c86:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c89:	8b 00                	mov    (%eax),%eax
    3c8b:	eb 28                	jmp    3cb5 <search_file+0x12e>
    3c8d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3c91:	83 45 ec 14          	addl   $0x14,-0x14(%ebp)
    3c95:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c98:	83 f8 1b             	cmp    $0x1b,%eax
    3c9b:	76 c3                	jbe    3c60 <search_file+0xd9>
    3c9d:	eb 01                	jmp    3ca0 <search_file+0x119>
    3c9f:	90                   	nop
    3ca0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3ca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ca7:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    3caa:	0f 8c 76 ff ff ff    	jl     3c26 <search_file+0x9f>
    3cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3cb5:	c9                   	leave  
    3cb6:	c3                   	ret    

00003cb7 <strip_path>:
    3cb7:	55                   	push   %ebp
    3cb8:	89 e5                	mov    %esp,%ebp
    3cba:	83 ec 10             	sub    $0x10,%esp
    3cbd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3cc1:	75 07                	jne    3cca <strip_path+0x13>
    3cc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3cc8:	eb 59                	jmp    3d23 <strip_path+0x6c>
    3cca:	8b 45 08             	mov    0x8(%ebp),%eax
    3ccd:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cd3:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3cd6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3cd9:	0f b6 00             	movzbl (%eax),%eax
    3cdc:	3c 2f                	cmp    $0x2f,%al
    3cde:	75 2a                	jne    3d0a <strip_path+0x53>
    3ce0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3ce4:	eb 24                	jmp    3d0a <strip_path+0x53>
    3ce6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ce9:	0f b6 00             	movzbl (%eax),%eax
    3cec:	3c 2f                	cmp    $0x2f,%al
    3cee:	75 07                	jne    3cf7 <strip_path+0x40>
    3cf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3cf5:	eb 2c                	jmp    3d23 <strip_path+0x6c>
    3cf7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3cfa:	0f b6 10             	movzbl (%eax),%edx
    3cfd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d00:	88 10                	mov    %dl,(%eax)
    3d02:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3d06:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3d0a:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    3d0e:	75 d6                	jne    3ce6 <strip_path+0x2f>
    3d10:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d13:	c6 00 00             	movb   $0x0,(%eax)
    3d16:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    3d1b:	89 45 10             	mov    %eax,0x10(%ebp)
    3d1e:	b8 00 00 00 00       	mov    $0x0,%eax
    3d23:	c9                   	leave  
    3d24:	c3                   	ret    

00003d25 <strcmp>:
    3d25:	55                   	push   %ebp
    3d26:	89 e5                	mov    %esp,%ebp
    3d28:	83 ec 10             	sub    $0x10,%esp
    3d2b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3d2f:	74 06                	je     3d37 <strcmp+0x12>
    3d31:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3d35:	75 08                	jne    3d3f <strcmp+0x1a>
    3d37:	8b 45 08             	mov    0x8(%ebp),%eax
    3d3a:	2b 45 0c             	sub    0xc(%ebp),%eax
    3d3d:	eb 53                	jmp    3d92 <strcmp+0x6d>
    3d3f:	8b 45 08             	mov    0x8(%ebp),%eax
    3d42:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3d45:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d48:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3d4b:	eb 18                	jmp    3d65 <strcmp+0x40>
    3d4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d50:	0f b6 10             	movzbl (%eax),%edx
    3d53:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d56:	0f b6 00             	movzbl (%eax),%eax
    3d59:	38 c2                	cmp    %al,%dl
    3d5b:	75 1e                	jne    3d7b <strcmp+0x56>
    3d5d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3d61:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3d65:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d68:	0f b6 00             	movzbl (%eax),%eax
    3d6b:	84 c0                	test   %al,%al
    3d6d:	74 0d                	je     3d7c <strcmp+0x57>
    3d6f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d72:	0f b6 00             	movzbl (%eax),%eax
    3d75:	84 c0                	test   %al,%al
    3d77:	75 d4                	jne    3d4d <strcmp+0x28>
    3d79:	eb 01                	jmp    3d7c <strcmp+0x57>
    3d7b:	90                   	nop
    3d7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d7f:	0f b6 00             	movzbl (%eax),%eax
    3d82:	0f be d0             	movsbl %al,%edx
    3d85:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d88:	0f b6 00             	movzbl (%eax),%eax
    3d8b:	0f be c0             	movsbl %al,%eax
    3d8e:	29 c2                	sub    %eax,%edx
    3d90:	89 d0                	mov    %edx,%eax
    3d92:	c9                   	leave  
    3d93:	c3                   	ret    

00003d94 <get_inode>:
    3d94:	55                   	push   %ebp
    3d95:	89 e5                	mov    %esp,%ebp
    3d97:	56                   	push   %esi
    3d98:	53                   	push   %ebx
    3d99:	83 ec 20             	sub    $0x20,%esp
    3d9c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3da0:	75 0a                	jne    3dac <get_inode+0x18>
    3da2:	b8 00 00 00 00       	mov    $0x0,%eax
    3da7:	e9 15 01 00 00       	jmp    3ec1 <get_inode+0x12d>
    3dac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3db3:	c7 45 f0 20 d8 00 00 	movl   $0xd820,-0x10(%ebp)
    3dba:	eb 29                	jmp    3de5 <get_inode+0x51>
    3dbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3dbf:	8b 40 18             	mov    0x18(%eax),%eax
    3dc2:	85 c0                	test   %eax,%eax
    3dc4:	7e 13                	jle    3dd9 <get_inode+0x45>
    3dc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3dc9:	8b 40 10             	mov    0x10(%eax),%eax
    3dcc:	39 45 08             	cmp    %eax,0x8(%ebp)
    3dcf:	75 10                	jne    3de1 <get_inode+0x4d>
    3dd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3dd4:	e9 e8 00 00 00       	jmp    3ec1 <get_inode+0x12d>
    3dd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ddc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3ddf:	eb 0d                	jmp    3dee <get_inode+0x5a>
    3de1:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
    3de5:	81 7d f0 20 df 00 00 	cmpl   $0xdf20,-0x10(%ebp)
    3dec:	76 ce                	jbe    3dbc <get_inode+0x28>
    3dee:	e8 4d 0f 00 00       	call   4d40 <get_super_block>
    3df3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3df6:	c7 45 e8 1c 00 00 00 	movl   $0x1c,-0x18(%ebp)
    3dfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e00:	8b 40 04             	mov    0x4(%eax),%eax
    3e03:	8d 50 02             	lea    0x2(%eax),%edx
    3e06:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e09:	8b 40 08             	mov    0x8(%eax),%eax
    3e0c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    3e0f:	8b 45 08             	mov    0x8(%ebp),%eax
    3e12:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3e15:	b8 00 02 00 00       	mov    $0x200,%eax
    3e1a:	99                   	cltd   
    3e1b:	f7 7d e8             	idivl  -0x18(%ebp)
    3e1e:	89 c6                	mov    %eax,%esi
    3e20:	89 c8                	mov    %ecx,%eax
    3e22:	99                   	cltd   
    3e23:	f7 fe                	idiv   %esi
    3e25:	01 d8                	add    %ebx,%eax
    3e27:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3e2a:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
    3e31:	a1 10 90 00 00       	mov    0x9010,%eax
    3e36:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    3e39:	c1 e2 09             	shl    $0x9,%edx
    3e3c:	83 ec 0c             	sub    $0xc,%esp
    3e3f:	6a 07                	push   $0x7
    3e41:	68 00 02 00 00       	push   $0x200
    3e46:	50                   	push   %eax
    3e47:	ff 75 e0             	pushl  -0x20(%ebp)
    3e4a:	52                   	push   %edx
    3e4b:	e8 31 fb ff ff       	call   3981 <rd_wt>
    3e50:	83 c4 20             	add    $0x20,%esp
    3e53:	8b 45 08             	mov    0x8(%ebp),%eax
    3e56:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3e59:	b8 00 02 00 00       	mov    $0x200,%eax
    3e5e:	99                   	cltd   
    3e5f:	f7 7d e8             	idivl  -0x18(%ebp)
    3e62:	89 c3                	mov    %eax,%ebx
    3e64:	89 c8                	mov    %ecx,%eax
    3e66:	99                   	cltd   
    3e67:	f7 fb                	idiv   %ebx
    3e69:	89 55 dc             	mov    %edx,-0x24(%ebp)
    3e6c:	8b 15 10 90 00 00    	mov    0x9010,%edx
    3e72:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e75:	0f af 45 dc          	imul   -0x24(%ebp),%eax
    3e79:	01 d0                	add    %edx,%eax
    3e7b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3e7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e81:	8b 55 08             	mov    0x8(%ebp),%edx
    3e84:	89 50 10             	mov    %edx,0x10(%eax)
    3e87:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3e8a:	8b 50 04             	mov    0x4(%eax),%edx
    3e8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e90:	89 50 04             	mov    %edx,0x4(%eax)
    3e93:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3e96:	8b 50 08             	mov    0x8(%eax),%edx
    3e99:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e9c:	89 50 08             	mov    %edx,0x8(%eax)
    3e9f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3ea2:	8b 10                	mov    (%eax),%edx
    3ea4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ea7:	89 10                	mov    %edx,(%eax)
    3ea9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3eac:	8b 50 0c             	mov    0xc(%eax),%edx
    3eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3eb2:	89 50 0c             	mov    %edx,0xc(%eax)
    3eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3eb8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    3ebb:	89 50 14             	mov    %edx,0x14(%eax)
    3ebe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ec1:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3ec4:	5b                   	pop    %ebx
    3ec5:	5e                   	pop    %esi
    3ec6:	5d                   	pop    %ebp
    3ec7:	c3                   	ret    

00003ec8 <create_file>:
    3ec8:	55                   	push   %ebp
    3ec9:	89 e5                	mov    %esp,%ebp
    3ecb:	83 ec 38             	sub    $0x38,%esp
    3ece:	ff 75 f4             	pushl  -0xc(%ebp)
    3ed1:	ff 75 08             	pushl  0x8(%ebp)
    3ed4:	8d 45 ce             	lea    -0x32(%ebp),%eax
    3ed7:	50                   	push   %eax
    3ed8:	e8 da fd ff ff       	call   3cb7 <strip_path>
    3edd:	83 c4 0c             	add    $0xc,%esp
    3ee0:	83 f8 ff             	cmp    $0xffffffff,%eax
    3ee3:	75 0a                	jne    3eef <create_file+0x27>
    3ee5:	b8 00 00 00 00       	mov    $0x0,%eax
    3eea:	e9 90 00 00 00       	jmp    3f7f <create_file+0xb7>
    3eef:	e8 8d 00 00 00       	call   3f81 <alloc_imap_bit>
    3ef4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3ef7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3efb:	75 07                	jne    3f04 <create_file+0x3c>
    3efd:	b8 00 00 00 00       	mov    $0x0,%eax
    3f02:	eb 7b                	jmp    3f7f <create_file+0xb7>
    3f04:	e8 37 0e 00 00       	call   4d40 <get_super_block>
    3f09:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3f0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3f0f:	8b 40 10             	mov    0x10(%eax),%eax
    3f12:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3f15:	83 ec 08             	sub    $0x8,%esp
    3f18:	ff 75 e8             	pushl  -0x18(%ebp)
    3f1b:	ff 75 f0             	pushl  -0x10(%ebp)
    3f1e:	e8 63 01 00 00       	call   4086 <alloc_smap_bit>
    3f23:	83 c4 10             	add    $0x10,%esp
    3f26:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3f29:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3f2d:	75 07                	jne    3f36 <create_file+0x6e>
    3f2f:	b8 00 00 00 00       	mov    $0x0,%eax
    3f34:	eb 49                	jmp    3f7f <create_file+0xb7>
    3f36:	83 ec 08             	sub    $0x8,%esp
    3f39:	ff 75 e4             	pushl  -0x1c(%ebp)
    3f3c:	ff 75 f0             	pushl  -0x10(%ebp)
    3f3f:	e8 d9 02 00 00       	call   421d <new_inode>
    3f44:	83 c4 10             	add    $0x10,%esp
    3f47:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3f4a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3f4e:	75 07                	jne    3f57 <create_file+0x8f>
    3f50:	b8 00 00 00 00       	mov    $0x0,%eax
    3f55:	eb 28                	jmp    3f7f <create_file+0xb7>
    3f57:	83 ec 04             	sub    $0x4,%esp
    3f5a:	ff 75 f0             	pushl  -0x10(%ebp)
    3f5d:	8d 45 ce             	lea    -0x32(%ebp),%eax
    3f60:	50                   	push   %eax
    3f61:	ff 75 f4             	pushl  -0xc(%ebp)
    3f64:	e8 08 03 00 00       	call   4271 <new_dir_entry>
    3f69:	83 c4 10             	add    $0x10,%esp
    3f6c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3f6f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    3f73:	75 07                	jne    3f7c <create_file+0xb4>
    3f75:	b8 00 00 00 00       	mov    $0x0,%eax
    3f7a:	eb 03                	jmp    3f7f <create_file+0xb7>
    3f7c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3f7f:	c9                   	leave  
    3f80:	c3                   	ret    

00003f81 <alloc_imap_bit>:
    3f81:	55                   	push   %ebp
    3f82:	89 e5                	mov    %esp,%ebp
    3f84:	53                   	push   %ebx
    3f85:	83 ec 24             	sub    $0x24,%esp
    3f88:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
    3f8f:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    3f96:	a1 10 90 00 00       	mov    0x9010,%eax
    3f9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3f9e:	c1 e2 09             	shl    $0x9,%edx
    3fa1:	83 ec 0c             	sub    $0xc,%esp
    3fa4:	6a 07                	push   $0x7
    3fa6:	68 00 02 00 00       	push   $0x200
    3fab:	50                   	push   %eax
    3fac:	ff 75 e8             	pushl  -0x18(%ebp)
    3faf:	52                   	push   %edx
    3fb0:	e8 cc f9 ff ff       	call   3981 <rd_wt>
    3fb5:	83 c4 20             	add    $0x20,%esp
    3fb8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    3fbf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3fc6:	e9 a9 00 00 00       	jmp    4074 <alloc_imap_bit+0xf3>
    3fcb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3fd2:	e9 8f 00 00 00       	jmp    4066 <alloc_imap_bit+0xe5>
    3fd7:	8b 15 10 90 00 00    	mov    0x9010,%edx
    3fdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fe0:	01 d0                	add    %edx,%eax
    3fe2:	0f b6 00             	movzbl (%eax),%eax
    3fe5:	0f be d0             	movsbl %al,%edx
    3fe8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3fec:	0f 94 c0             	sete   %al
    3fef:	0f b6 c0             	movzbl %al,%eax
    3ff2:	21 d0                	and    %edx,%eax
    3ff4:	85 c0                	test   %eax,%eax
    3ff6:	74 06                	je     3ffe <alloc_imap_bit+0x7d>
    3ff8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3ffc:	eb 68                	jmp    4066 <alloc_imap_bit+0xe5>
    3ffe:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4004:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4007:	01 d0                	add    %edx,%eax
    4009:	0f b6 18             	movzbl (%eax),%ebx
    400c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    400f:	ba 01 00 00 00       	mov    $0x1,%edx
    4014:	89 c1                	mov    %eax,%ecx
    4016:	d3 e2                	shl    %cl,%edx
    4018:	89 d0                	mov    %edx,%eax
    401a:	89 c1                	mov    %eax,%ecx
    401c:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4022:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4025:	01 d0                	add    %edx,%eax
    4027:	09 cb                	or     %ecx,%ebx
    4029:	89 da                	mov    %ebx,%edx
    402b:	88 10                	mov    %dl,(%eax)
    402d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4030:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4037:	8b 45 f0             	mov    -0x10(%ebp),%eax
    403a:	01 d0                	add    %edx,%eax
    403c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    403f:	a1 10 90 00 00       	mov    0x9010,%eax
    4044:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4047:	c1 e2 09             	shl    $0x9,%edx
    404a:	83 ec 0c             	sub    $0xc,%esp
    404d:	6a 0a                	push   $0xa
    404f:	68 00 02 00 00       	push   $0x200
    4054:	50                   	push   %eax
    4055:	ff 75 e8             	pushl  -0x18(%ebp)
    4058:	52                   	push   %edx
    4059:	e8 23 f9 ff ff       	call   3981 <rd_wt>
    405e:	83 c4 20             	add    $0x20,%esp
    4061:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4064:	eb 1b                	jmp    4081 <alloc_imap_bit+0x100>
    4066:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    406a:	0f 8e 67 ff ff ff    	jle    3fd7 <alloc_imap_bit+0x56>
    4070:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4074:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    407b:	0f 8e 4a ff ff ff    	jle    3fcb <alloc_imap_bit+0x4a>
    4081:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4084:	c9                   	leave  
    4085:	c3                   	ret    

00004086 <alloc_smap_bit>:
    4086:	55                   	push   %ebp
    4087:	89 e5                	mov    %esp,%ebp
    4089:	53                   	push   %ebx
    408a:	83 ec 34             	sub    $0x34,%esp
    408d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4091:	7f 1c                	jg     40af <alloc_smap_bit+0x29>
    4093:	68 11 02 00 00       	push   $0x211
    4098:	68 6a 67 00 00       	push   $0x676a
    409d:	68 6a 67 00 00       	push   $0x676a
    40a2:	68 b1 67 00 00       	push   $0x67b1
    40a7:	e8 a2 e1 ff ff       	call   224e <assertion_failure>
    40ac:	83 c4 10             	add    $0x10,%esp
    40af:	e8 8c 0c 00 00       	call   4d40 <get_super_block>
    40b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    40b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40ba:	8b 40 08             	mov    0x8(%eax),%eax
    40bd:	89 45 e0             	mov    %eax,-0x20(%ebp)
    40c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40c3:	8b 40 04             	mov    0x4(%eax),%eax
    40c6:	83 c0 02             	add    $0x2,%eax
    40c9:	89 45 dc             	mov    %eax,-0x24(%ebp)
    40cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    40d3:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    40da:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    40e1:	e9 20 01 00 00       	jmp    4206 <alloc_smap_bit+0x180>
    40e6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    40e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40ec:	01 d0                	add    %edx,%eax
    40ee:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    40f1:	a1 10 90 00 00       	mov    0x9010,%eax
    40f6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    40f9:	c1 e2 09             	shl    $0x9,%edx
    40fc:	83 ec 0c             	sub    $0xc,%esp
    40ff:	6a 07                	push   $0x7
    4101:	68 00 02 00 00       	push   $0x200
    4106:	50                   	push   %eax
    4107:	ff 75 d8             	pushl  -0x28(%ebp)
    410a:	52                   	push   %edx
    410b:	e8 71 f8 ff ff       	call   3981 <rd_wt>
    4110:	83 c4 20             	add    $0x20,%esp
    4113:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    411a:	e9 a8 00 00 00       	jmp    41c7 <alloc_smap_bit+0x141>
    411f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    4126:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    412a:	0f 85 8a 00 00 00    	jne    41ba <alloc_smap_bit+0x134>
    4130:	eb 45                	jmp    4177 <alloc_smap_bit+0xf1>
    4132:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4138:	8b 45 ec             	mov    -0x14(%ebp),%eax
    413b:	01 d0                	add    %edx,%eax
    413d:	0f b6 00             	movzbl (%eax),%eax
    4140:	0f be d0             	movsbl %al,%edx
    4143:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4147:	0f 94 c0             	sete   %al
    414a:	0f b6 c0             	movzbl %al,%eax
    414d:	21 d0                	and    %edx,%eax
    414f:	85 c0                	test   %eax,%eax
    4151:	74 06                	je     4159 <alloc_smap_bit+0xd3>
    4153:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4157:	eb 1e                	jmp    4177 <alloc_smap_bit+0xf1>
    4159:	8b 45 f0             	mov    -0x10(%ebp),%eax
    415c:	c1 e0 09             	shl    $0x9,%eax
    415f:	89 c2                	mov    %eax,%edx
    4161:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4164:	01 d0                	add    %edx,%eax
    4166:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    416d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4170:	01 d0                	add    %edx,%eax
    4172:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4175:	eb 06                	jmp    417d <alloc_smap_bit+0xf7>
    4177:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    417b:	7e b5                	jle    4132 <alloc_smap_bit+0xac>
    417d:	eb 3b                	jmp    41ba <alloc_smap_bit+0x134>
    417f:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4185:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4188:	01 d0                	add    %edx,%eax
    418a:	0f b6 10             	movzbl (%eax),%edx
    418d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4190:	bb 01 00 00 00       	mov    $0x1,%ebx
    4195:	89 c1                	mov    %eax,%ecx
    4197:	d3 e3                	shl    %cl,%ebx
    4199:	89 d8                	mov    %ebx,%eax
    419b:	89 c3                	mov    %eax,%ebx
    419d:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    41a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    41a6:	01 c8                	add    %ecx,%eax
    41a8:	21 da                	and    %ebx,%edx
    41aa:	88 10                	mov    %dl,(%eax)
    41ac:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    41b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    41b4:	74 0c                	je     41c2 <alloc_smap_bit+0x13c>
    41b6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    41ba:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    41be:	7e bf                	jle    417f <alloc_smap_bit+0xf9>
    41c0:	eb 01                	jmp    41c3 <alloc_smap_bit+0x13d>
    41c2:	90                   	nop
    41c3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    41c7:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
    41ce:	0f 8e 4b ff ff ff    	jle    411f <alloc_smap_bit+0x99>
    41d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    41d8:	74 22                	je     41fc <alloc_smap_bit+0x176>
    41da:	a1 10 90 00 00       	mov    0x9010,%eax
    41df:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    41e2:	c1 e2 09             	shl    $0x9,%edx
    41e5:	83 ec 0c             	sub    $0xc,%esp
    41e8:	6a 0a                	push   $0xa
    41ea:	68 00 02 00 00       	push   $0x200
    41ef:	50                   	push   %eax
    41f0:	ff 75 d8             	pushl  -0x28(%ebp)
    41f3:	52                   	push   %edx
    41f4:	e8 88 f7 ff ff       	call   3981 <rd_wt>
    41f9:	83 c4 20             	add    $0x20,%esp
    41fc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4200:	74 12                	je     4214 <alloc_smap_bit+0x18e>
    4202:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4206:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4209:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    420c:	0f 8c d4 fe ff ff    	jl     40e6 <alloc_smap_bit+0x60>
    4212:	eb 01                	jmp    4215 <alloc_smap_bit+0x18f>
    4214:	90                   	nop
    4215:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4218:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    421b:	c9                   	leave  
    421c:	c3                   	ret    

0000421d <new_inode>:
    421d:	55                   	push   %ebp
    421e:	89 e5                	mov    %esp,%ebp
    4220:	83 ec 18             	sub    $0x18,%esp
    4223:	83 ec 0c             	sub    $0xc,%esp
    4226:	ff 75 08             	pushl  0x8(%ebp)
    4229:	e8 66 fb ff ff       	call   3d94 <get_inode>
    422e:	83 c4 10             	add    $0x10,%esp
    4231:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4234:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4238:	75 07                	jne    4241 <new_inode+0x24>
    423a:	b8 00 00 00 00       	mov    $0x0,%eax
    423f:	eb 2e                	jmp    426f <new_inode+0x52>
    4241:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4244:	8b 55 0c             	mov    0xc(%ebp),%edx
    4247:	89 50 08             	mov    %edx,0x8(%eax)
    424a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    424d:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    4254:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4257:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    425e:	83 ec 0c             	sub    $0xc,%esp
    4261:	ff 75 f4             	pushl  -0xc(%ebp)
    4264:	e8 4d 09 00 00       	call   4bb6 <sync_inode>
    4269:	83 c4 10             	add    $0x10,%esp
    426c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    426f:	c9                   	leave  
    4270:	c3                   	ret    

00004271 <new_dir_entry>:
    4271:	55                   	push   %ebp
    4272:	89 e5                	mov    %esp,%ebp
    4274:	83 ec 38             	sub    $0x38,%esp
    4277:	c7 45 e0 14 00 00 00 	movl   $0x14,-0x20(%ebp)
    427e:	8b 45 08             	mov    0x8(%ebp),%eax
    4281:	8b 50 04             	mov    0x4(%eax),%edx
    4284:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4287:	89 c1                	mov    %eax,%ecx
    4289:	d3 fa                	sar    %cl,%edx
    428b:	89 d0                	mov    %edx,%eax
    428d:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4290:	8b 45 08             	mov    0x8(%ebp),%eax
    4293:	8b 50 0c             	mov    0xc(%eax),%edx
    4296:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4299:	89 c1                	mov    %eax,%ecx
    429b:	d3 fa                	sar    %cl,%edx
    429d:	89 d0                	mov    %edx,%eax
    429f:	89 45 d8             	mov    %eax,-0x28(%ebp)
    42a2:	e8 99 0a 00 00       	call   4d40 <get_super_block>
    42a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    42aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    42ad:	8b 00                	mov    (%eax),%eax
    42af:	89 45 d0             	mov    %eax,-0x30(%ebp)
    42b2:	8b 45 08             	mov    0x8(%ebp),%eax
    42b5:	8b 40 0c             	mov    0xc(%eax),%eax
    42b8:	05 00 02 00 00       	add    $0x200,%eax
    42bd:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    42c3:	85 c0                	test   %eax,%eax
    42c5:	0f 48 c2             	cmovs  %edx,%eax
    42c8:	c1 f8 09             	sar    $0x9,%eax
    42cb:	89 45 cc             	mov    %eax,-0x34(%ebp)
    42ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    42d5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    42dc:	c7 45 c8 20 00 00 00 	movl   $0x20,-0x38(%ebp)
    42e3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    42ea:	e9 82 00 00 00       	jmp    4371 <new_dir_entry+0x100>
    42ef:	a1 10 90 00 00       	mov    0x9010,%eax
    42f4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    42f7:	89 d1                	mov    %edx,%ecx
    42f9:	c1 e1 09             	shl    $0x9,%ecx
    42fc:	8b 55 d0             	mov    -0x30(%ebp),%edx
    42ff:	01 ca                	add    %ecx,%edx
    4301:	83 ec 0c             	sub    $0xc,%esp
    4304:	6a 07                	push   $0x7
    4306:	68 00 02 00 00       	push   $0x200
    430b:	50                   	push   %eax
    430c:	ff 75 c8             	pushl  -0x38(%ebp)
    430f:	52                   	push   %edx
    4310:	e8 6c f6 ff ff       	call   3981 <rd_wt>
    4315:	83 c4 20             	add    $0x20,%esp
    4318:	a1 10 90 00 00       	mov    0x9010,%eax
    431d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4320:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4327:	eb 25                	jmp    434e <new_dir_entry+0xdd>
    4329:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    432d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4330:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    4333:	7f 29                	jg     435e <new_dir_entry+0xed>
    4335:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4338:	8b 00                	mov    (%eax),%eax
    433a:	85 c0                	test   %eax,%eax
    433c:	75 08                	jne    4346 <new_dir_entry+0xd5>
    433e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4341:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4344:	eb 19                	jmp    435f <new_dir_entry+0xee>
    4346:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    434a:	83 45 f0 14          	addl   $0x14,-0x10(%ebp)
    434e:	b8 00 02 00 00       	mov    $0x200,%eax
    4353:	99                   	cltd   
    4354:	f7 7d e0             	idivl  -0x20(%ebp)
    4357:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    435a:	7c cd                	jl     4329 <new_dir_entry+0xb8>
    435c:	eb 01                	jmp    435f <new_dir_entry+0xee>
    435e:	90                   	nop
    435f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4362:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    4365:	7f 16                	jg     437d <new_dir_entry+0x10c>
    4367:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    436b:	75 10                	jne    437d <new_dir_entry+0x10c>
    436d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4371:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4374:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    4377:	0f 8c 72 ff ff ff    	jl     42ef <new_dir_entry+0x7e>
    437d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4380:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    4383:	75 07                	jne    438c <new_dir_entry+0x11b>
    4385:	b8 00 00 00 00       	mov    $0x0,%eax
    438a:	eb 71                	jmp    43fd <new_dir_entry+0x18c>
    438c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4390:	75 25                	jne    43b7 <new_dir_entry+0x146>
    4392:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4395:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4398:	8b 45 08             	mov    0x8(%ebp),%eax
    439b:	8b 50 04             	mov    0x4(%eax),%edx
    439e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    43a1:	01 c2                	add    %eax,%edx
    43a3:	8b 45 08             	mov    0x8(%ebp),%eax
    43a6:	89 50 04             	mov    %edx,0x4(%eax)
    43a9:	83 ec 0c             	sub    $0xc,%esp
    43ac:	ff 75 08             	pushl  0x8(%ebp)
    43af:	e8 02 08 00 00       	call   4bb6 <sync_inode>
    43b4:	83 c4 10             	add    $0x10,%esp
    43b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43ba:	8b 55 10             	mov    0x10(%ebp),%edx
    43bd:	89 10                	mov    %edx,(%eax)
    43bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43c2:	83 c0 04             	add    $0x4,%eax
    43c5:	83 ec 08             	sub    $0x8,%esp
    43c8:	ff 75 0c             	pushl  0xc(%ebp)
    43cb:	50                   	push   %eax
    43cc:	e8 0a 25 00 00       	call   68db <Strcpy>
    43d1:	83 c4 10             	add    $0x10,%esp
    43d4:	a1 10 90 00 00       	mov    0x9010,%eax
    43d9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    43dc:	89 d1                	mov    %edx,%ecx
    43de:	c1 e1 09             	shl    $0x9,%ecx
    43e1:	8b 55 d0             	mov    -0x30(%ebp),%edx
    43e4:	01 ca                	add    %ecx,%edx
    43e6:	83 ec 0c             	sub    $0xc,%esp
    43e9:	6a 0a                	push   $0xa
    43eb:	68 00 02 00 00       	push   $0x200
    43f0:	50                   	push   %eax
    43f1:	ff 75 c8             	pushl  -0x38(%ebp)
    43f4:	52                   	push   %edx
    43f5:	e8 87 f5 ff ff       	call   3981 <rd_wt>
    43fa:	83 c4 20             	add    $0x20,%esp
    43fd:	c9                   	leave  
    43fe:	c3                   	ret    

000043ff <do_unlink>:
    43ff:	55                   	push   %ebp
    4400:	89 e5                	mov    %esp,%ebp
    4402:	53                   	push   %ebx
    4403:	83 ec 74             	sub    $0x74,%esp
    4406:	ff 75 08             	pushl  0x8(%ebp)
    4409:	68 c6 67 00 00       	push   $0x67c6
    440e:	e8 12 f9 ff ff       	call   3d25 <strcmp>
    4413:	83 c4 08             	add    $0x8,%esp
    4416:	85 c0                	test   %eax,%eax
    4418:	75 10                	jne    442a <do_unlink+0x2b>
    441a:	83 ec 0c             	sub    $0xc,%esp
    441d:	68 c8 67 00 00       	push   $0x67c8
    4422:	e8 09 de ff ff       	call   2230 <panic>
    4427:	83 c4 10             	add    $0x10,%esp
    442a:	83 ec 0c             	sub    $0xc,%esp
    442d:	ff 75 08             	pushl  0x8(%ebp)
    4430:	e8 52 f7 ff ff       	call   3b87 <search_file>
    4435:	83 c4 10             	add    $0x10,%esp
    4438:	89 45 d0             	mov    %eax,-0x30(%ebp)
    443b:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    443f:	75 10                	jne    4451 <do_unlink+0x52>
    4441:	83 ec 0c             	sub    $0xc,%esp
    4444:	68 e4 67 00 00       	push   $0x67e4
    4449:	e8 e2 dd ff ff       	call   2230 <panic>
    444e:	83 c4 10             	add    $0x10,%esp
    4451:	83 ec 0c             	sub    $0xc,%esp
    4454:	ff 75 d0             	pushl  -0x30(%ebp)
    4457:	e8 38 f9 ff ff       	call   3d94 <get_inode>
    445c:	83 c4 10             	add    $0x10,%esp
    445f:	89 45 cc             	mov    %eax,-0x34(%ebp)
    4462:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    4466:	75 10                	jne    4478 <do_unlink+0x79>
    4468:	83 ec 0c             	sub    $0xc,%esp
    446b:	68 e4 67 00 00       	push   $0x67e4
    4470:	e8 bb dd ff ff       	call   2230 <panic>
    4475:	83 c4 10             	add    $0x10,%esp
    4478:	8b 45 cc             	mov    -0x34(%ebp),%eax
    447b:	8b 40 18             	mov    0x18(%eax),%eax
    447e:	85 c0                	test   %eax,%eax
    4480:	7e 10                	jle    4492 <do_unlink+0x93>
    4482:	83 ec 0c             	sub    $0xc,%esp
    4485:	68 00 68 00 00       	push   $0x6800
    448a:	e8 a1 dd ff ff       	call   2230 <panic>
    448f:	83 c4 10             	add    $0x10,%esp
    4492:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4495:	8b 40 10             	mov    0x10(%eax),%eax
    4498:	89 45 c8             	mov    %eax,-0x38(%ebp)
    449b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    449e:	8d 50 07             	lea    0x7(%eax),%edx
    44a1:	85 c0                	test   %eax,%eax
    44a3:	0f 48 c2             	cmovs  %edx,%eax
    44a6:	c1 f8 03             	sar    $0x3,%eax
    44a9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    44ac:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    44af:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    44b5:	85 c0                	test   %eax,%eax
    44b7:	0f 48 c2             	cmovs  %edx,%eax
    44ba:	c1 f8 09             	sar    $0x9,%eax
    44bd:	89 45 c0             	mov    %eax,-0x40(%ebp)
    44c0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    44c3:	99                   	cltd   
    44c4:	c1 ea 1d             	shr    $0x1d,%edx
    44c7:	01 d0                	add    %edx,%eax
    44c9:	83 e0 07             	and    $0x7,%eax
    44cc:	29 d0                	sub    %edx,%eax
    44ce:	89 45 bc             	mov    %eax,-0x44(%ebp)
    44d1:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
    44d8:	a1 10 90 00 00       	mov    0x9010,%eax
    44dd:	8b 55 c0             	mov    -0x40(%ebp),%edx
    44e0:	c1 e2 09             	shl    $0x9,%edx
    44e3:	83 c2 02             	add    $0x2,%edx
    44e6:	83 ec 0c             	sub    $0xc,%esp
    44e9:	6a 07                	push   $0x7
    44eb:	68 00 02 00 00       	push   $0x200
    44f0:	50                   	push   %eax
    44f1:	ff 75 b8             	pushl  -0x48(%ebp)
    44f4:	52                   	push   %edx
    44f5:	e8 87 f4 ff ff       	call   3981 <rd_wt>
    44fa:	83 c4 20             	add    $0x20,%esp
    44fd:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4503:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4506:	01 d0                	add    %edx,%eax
    4508:	0f b6 10             	movzbl (%eax),%edx
    450b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    450e:	bb 01 00 00 00       	mov    $0x1,%ebx
    4513:	89 c1                	mov    %eax,%ecx
    4515:	d3 e3                	shl    %cl,%ebx
    4517:	89 d8                	mov    %ebx,%eax
    4519:	f7 d0                	not    %eax
    451b:	89 c3                	mov    %eax,%ebx
    451d:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    4523:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4526:	01 c8                	add    %ecx,%eax
    4528:	21 da                	and    %ebx,%edx
    452a:	88 10                	mov    %dl,(%eax)
    452c:	a1 10 90 00 00       	mov    0x9010,%eax
    4531:	8b 55 c0             	mov    -0x40(%ebp),%edx
    4534:	c1 e2 09             	shl    $0x9,%edx
    4537:	83 c2 02             	add    $0x2,%edx
    453a:	83 ec 0c             	sub    $0xc,%esp
    453d:	6a 0a                	push   $0xa
    453f:	68 00 02 00 00       	push   $0x200
    4544:	50                   	push   %eax
    4545:	ff 75 b8             	pushl  -0x48(%ebp)
    4548:	52                   	push   %edx
    4549:	e8 33 f4 ff ff       	call   3981 <rd_wt>
    454e:	83 c4 20             	add    $0x20,%esp
    4551:	e8 ea 07 00 00       	call   4d40 <get_super_block>
    4556:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    4559:	8b 45 cc             	mov    -0x34(%ebp),%eax
    455c:	8b 50 08             	mov    0x8(%eax),%edx
    455f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4562:	8b 00                	mov    (%eax),%eax
    4564:	29 c2                	sub    %eax,%edx
    4566:	89 d0                	mov    %edx,%eax
    4568:	83 c0 01             	add    $0x1,%eax
    456b:	89 45 b0             	mov    %eax,-0x50(%ebp)
    456e:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4571:	8d 50 07             	lea    0x7(%eax),%edx
    4574:	85 c0                	test   %eax,%eax
    4576:	0f 48 c2             	cmovs  %edx,%eax
    4579:	c1 f8 03             	sar    $0x3,%eax
    457c:	89 45 ac             	mov    %eax,-0x54(%ebp)
    457f:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4582:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    4588:	85 c0                	test   %eax,%eax
    458a:	0f 48 c2             	cmovs  %edx,%eax
    458d:	c1 f8 09             	sar    $0x9,%eax
    4590:	89 45 a8             	mov    %eax,-0x58(%ebp)
    4593:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4596:	99                   	cltd   
    4597:	c1 ea 1d             	shr    $0x1d,%edx
    459a:	01 d0                	add    %edx,%eax
    459c:	83 e0 07             	and    $0x7,%eax
    459f:	29 d0                	sub    %edx,%eax
    45a1:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    45a4:	b8 08 00 00 00       	mov    $0x8,%eax
    45a9:	2b 45 a4             	sub    -0x5c(%ebp),%eax
    45ac:	8b 55 b0             	mov    -0x50(%ebp),%edx
    45af:	29 c2                	sub    %eax,%edx
    45b1:	89 d0                	mov    %edx,%eax
    45b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    45b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45b9:	8d 50 07             	lea    0x7(%eax),%edx
    45bc:	85 c0                	test   %eax,%eax
    45be:	0f 48 c2             	cmovs  %edx,%eax
    45c1:	c1 f8 03             	sar    $0x3,%eax
    45c4:	89 45 a0             	mov    %eax,-0x60(%ebp)
    45c7:	a1 10 90 00 00       	mov    0x9010,%eax
    45cc:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    45cf:	8b 52 04             	mov    0x4(%edx),%edx
    45d2:	8d 4a 02             	lea    0x2(%edx),%ecx
    45d5:	8b 55 a8             	mov    -0x58(%ebp),%edx
    45d8:	c1 e2 09             	shl    $0x9,%edx
    45db:	01 ca                	add    %ecx,%edx
    45dd:	83 ec 0c             	sub    $0xc,%esp
    45e0:	6a 07                	push   $0x7
    45e2:	68 00 02 00 00       	push   $0x200
    45e7:	50                   	push   %eax
    45e8:	ff 75 b8             	pushl  -0x48(%ebp)
    45eb:	52                   	push   %edx
    45ec:	e8 90 f3 ff ff       	call   3981 <rd_wt>
    45f1:	83 c4 20             	add    $0x20,%esp
    45f4:	8b 15 10 90 00 00    	mov    0x9010,%edx
    45fa:	8b 45 ac             	mov    -0x54(%ebp),%eax
    45fd:	01 d0                	add    %edx,%eax
    45ff:	0f b6 10             	movzbl (%eax),%edx
    4602:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4605:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    460a:	89 c1                	mov    %eax,%ecx
    460c:	d3 e3                	shl    %cl,%ebx
    460e:	89 d8                	mov    %ebx,%eax
    4610:	f7 d0                	not    %eax
    4612:	89 c3                	mov    %eax,%ebx
    4614:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    461a:	8b 45 ac             	mov    -0x54(%ebp),%eax
    461d:	01 c8                	add    %ecx,%eax
    461f:	21 da                	and    %ebx,%edx
    4621:	88 10                	mov    %dl,(%eax)
    4623:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    462a:	8b 45 a8             	mov    -0x58(%ebp),%eax
    462d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4630:	eb 71                	jmp    46a3 <do_unlink+0x2a4>
    4632:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    4639:	75 52                	jne    468d <do_unlink+0x28e>
    463b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4642:	a1 10 90 00 00       	mov    0x9010,%eax
    4647:	8b 55 ec             	mov    -0x14(%ebp),%edx
    464a:	c1 e2 09             	shl    $0x9,%edx
    464d:	83 ec 0c             	sub    $0xc,%esp
    4650:	6a 0a                	push   $0xa
    4652:	68 00 02 00 00       	push   $0x200
    4657:	50                   	push   %eax
    4658:	ff 75 b8             	pushl  -0x48(%ebp)
    465b:	52                   	push   %edx
    465c:	e8 20 f3 ff ff       	call   3981 <rd_wt>
    4661:	83 c4 20             	add    $0x20,%esp
    4664:	8b 15 10 90 00 00    	mov    0x9010,%edx
    466a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    466d:	8d 48 01             	lea    0x1(%eax),%ecx
    4670:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    4673:	c1 e0 09             	shl    $0x9,%eax
    4676:	83 ec 0c             	sub    $0xc,%esp
    4679:	6a 07                	push   $0x7
    467b:	68 00 02 00 00       	push   $0x200
    4680:	52                   	push   %edx
    4681:	ff 75 b8             	pushl  -0x48(%ebp)
    4684:	50                   	push   %eax
    4685:	e8 f7 f2 ff ff       	call   3981 <rd_wt>
    468a:	83 c4 20             	add    $0x20,%esp
    468d:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4693:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4696:	01 d0                	add    %edx,%eax
    4698:	c6 00 00             	movb   $0x0,(%eax)
    469b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    469f:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
    46a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46a6:	3b 45 a0             	cmp    -0x60(%ebp),%eax
    46a9:	7c 87                	jl     4632 <do_unlink+0x233>
    46ab:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    46b2:	75 52                	jne    4706 <do_unlink+0x307>
    46b4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    46bb:	a1 10 90 00 00       	mov    0x9010,%eax
    46c0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    46c3:	c1 e2 09             	shl    $0x9,%edx
    46c6:	83 ec 0c             	sub    $0xc,%esp
    46c9:	6a 0a                	push   $0xa
    46cb:	68 00 02 00 00       	push   $0x200
    46d0:	50                   	push   %eax
    46d1:	ff 75 b8             	pushl  -0x48(%ebp)
    46d4:	52                   	push   %edx
    46d5:	e8 a7 f2 ff ff       	call   3981 <rd_wt>
    46da:	83 c4 20             	add    $0x20,%esp
    46dd:	8b 15 10 90 00 00    	mov    0x9010,%edx
    46e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    46e6:	8d 48 01             	lea    0x1(%eax),%ecx
    46e9:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    46ec:	c1 e0 09             	shl    $0x9,%eax
    46ef:	83 ec 0c             	sub    $0xc,%esp
    46f2:	6a 07                	push   $0x7
    46f4:	68 00 02 00 00       	push   $0x200
    46f9:	52                   	push   %edx
    46fa:	ff 75 b8             	pushl  -0x48(%ebp)
    46fd:	50                   	push   %eax
    46fe:	e8 7e f2 ff ff       	call   3981 <rd_wt>
    4703:	83 c4 20             	add    $0x20,%esp
    4706:	8b 15 10 90 00 00    	mov    0x9010,%edx
    470c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    470f:	01 d0                	add    %edx,%eax
    4711:	0f b6 10             	movzbl (%eax),%edx
    4714:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4717:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    471c:	89 c1                	mov    %eax,%ecx
    471e:	d3 e3                	shl    %cl,%ebx
    4720:	89 d8                	mov    %ebx,%eax
    4722:	89 c3                	mov    %eax,%ebx
    4724:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    472a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    472d:	01 c8                	add    %ecx,%eax
    472f:	21 da                	and    %ebx,%edx
    4731:	88 10                	mov    %dl,(%eax)
    4733:	a1 10 90 00 00       	mov    0x9010,%eax
    4738:	8b 55 ec             	mov    -0x14(%ebp),%edx
    473b:	c1 e2 09             	shl    $0x9,%edx
    473e:	83 ec 0c             	sub    $0xc,%esp
    4741:	6a 0a                	push   $0xa
    4743:	68 00 02 00 00       	push   $0x200
    4748:	50                   	push   %eax
    4749:	ff 75 b8             	pushl  -0x48(%ebp)
    474c:	52                   	push   %edx
    474d:	e8 2f f2 ff ff       	call   3981 <rd_wt>
    4752:	83 c4 20             	add    $0x20,%esp
    4755:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4758:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    475f:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4762:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    4769:	8b 45 cc             	mov    -0x34(%ebp),%eax
    476c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    4773:	83 ec 0c             	sub    $0xc,%esp
    4776:	ff 75 cc             	pushl  -0x34(%ebp)
    4779:	e8 38 04 00 00       	call   4bb6 <sync_inode>
    477e:	83 c4 10             	add    $0x10,%esp
    4781:	83 ec 0c             	sub    $0xc,%esp
    4784:	ff 75 cc             	pushl  -0x34(%ebp)
    4787:	e8 03 05 00 00       	call   4c8f <put_inode>
    478c:	83 c4 10             	add    $0x10,%esp
    478f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4792:	8b 00                	mov    (%eax),%eax
    4794:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4797:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    479c:	89 45 98             	mov    %eax,-0x68(%ebp)
    479f:	8b 45 98             	mov    -0x68(%ebp),%eax
    47a2:	8b 40 04             	mov    0x4(%eax),%eax
    47a5:	89 45 94             	mov    %eax,-0x6c(%ebp)
    47a8:	8b 45 98             	mov    -0x68(%ebp),%eax
    47ab:	8b 40 0c             	mov    0xc(%eax),%eax
    47ae:	89 45 90             	mov    %eax,-0x70(%ebp)
    47b1:	8b 45 94             	mov    -0x6c(%ebp),%eax
    47b4:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    47b9:	f7 e2                	mul    %edx
    47bb:	89 d0                	mov    %edx,%eax
    47bd:	c1 e8 04             	shr    $0x4,%eax
    47c0:	89 45 8c             	mov    %eax,-0x74(%ebp)
    47c3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    47ca:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    47d1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    47d8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    47df:	e9 a8 00 00 00       	jmp    488c <do_unlink+0x48d>
    47e4:	a1 10 90 00 00       	mov    0x9010,%eax
    47e9:	8b 55 d8             	mov    -0x28(%ebp),%edx
    47ec:	89 d1                	mov    %edx,%ecx
    47ee:	c1 e1 09             	shl    $0x9,%ecx
    47f1:	8b 55 9c             	mov    -0x64(%ebp),%edx
    47f4:	01 ca                	add    %ecx,%edx
    47f6:	83 ec 0c             	sub    $0xc,%esp
    47f9:	6a 07                	push   $0x7
    47fb:	68 00 02 00 00       	push   $0x200
    4800:	50                   	push   %eax
    4801:	ff 75 b8             	pushl  -0x48(%ebp)
    4804:	52                   	push   %edx
    4805:	e8 77 f1 ff ff       	call   3981 <rd_wt>
    480a:	83 c4 20             	add    $0x20,%esp
    480d:	a1 10 90 00 00       	mov    0x9010,%eax
    4812:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4815:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    481c:	eb 51                	jmp    486f <do_unlink+0x470>
    481e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4822:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4825:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    4828:	7f 4f                	jg     4879 <do_unlink+0x47a>
    482a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    482d:	83 c0 14             	add    $0x14,%eax
    4830:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4833:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4836:	83 c0 04             	add    $0x4,%eax
    4839:	83 ec 08             	sub    $0x8,%esp
    483c:	ff 75 08             	pushl  0x8(%ebp)
    483f:	50                   	push   %eax
    4840:	e8 e0 f4 ff ff       	call   3d25 <strcmp>
    4845:	83 c4 10             	add    $0x10,%esp
    4848:	85 c0                	test   %eax,%eax
    484a:	75 1b                	jne    4867 <do_unlink+0x468>
    484c:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    4853:	83 ec 04             	sub    $0x4,%esp
    4856:	6a 14                	push   $0x14
    4858:	6a 00                	push   $0x0
    485a:	ff 75 d4             	pushl  -0x2c(%ebp)
    485d:	e8 5a 20 00 00       	call   68bc <Memset>
    4862:	83 c4 10             	add    $0x10,%esp
    4865:	eb 13                	jmp    487a <do_unlink+0x47b>
    4867:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    486b:	83 45 d4 14          	addl   $0x14,-0x2c(%ebp)
    486f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4872:	3b 45 90             	cmp    -0x70(%ebp),%eax
    4875:	7c a7                	jl     481e <do_unlink+0x41f>
    4877:	eb 01                	jmp    487a <do_unlink+0x47b>
    4879:	90                   	nop
    487a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    487d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    4880:	7f 16                	jg     4898 <do_unlink+0x499>
    4882:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4886:	75 10                	jne    4898 <do_unlink+0x499>
    4888:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    488c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    488f:	3b 45 90             	cmp    -0x70(%ebp),%eax
    4892:	0f 8c 4c ff ff ff    	jl     47e4 <do_unlink+0x3e5>
    4898:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    489b:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    489e:	75 17                	jne    48b7 <do_unlink+0x4b8>
    48a0:	8b 45 98             	mov    -0x68(%ebp),%eax
    48a3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    48a6:	89 50 04             	mov    %edx,0x4(%eax)
    48a9:	83 ec 0c             	sub    $0xc,%esp
    48ac:	ff 75 98             	pushl  -0x68(%ebp)
    48af:	e8 02 03 00 00       	call   4bb6 <sync_inode>
    48b4:	83 c4 10             	add    $0x10,%esp
    48b7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    48bb:	74 29                	je     48e6 <do_unlink+0x4e7>
    48bd:	a1 10 90 00 00       	mov    0x9010,%eax
    48c2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    48c5:	89 d1                	mov    %edx,%ecx
    48c7:	c1 e1 09             	shl    $0x9,%ecx
    48ca:	8b 55 9c             	mov    -0x64(%ebp),%edx
    48cd:	01 ca                	add    %ecx,%edx
    48cf:	83 ec 0c             	sub    $0xc,%esp
    48d2:	6a 0a                	push   $0xa
    48d4:	68 00 02 00 00       	push   $0x200
    48d9:	50                   	push   %eax
    48da:	ff 75 b8             	pushl  -0x48(%ebp)
    48dd:	52                   	push   %edx
    48de:	e8 9e f0 ff ff       	call   3981 <rd_wt>
    48e3:	83 c4 20             	add    $0x20,%esp
    48e6:	90                   	nop
    48e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    48ea:	c9                   	leave  
    48eb:	c3                   	ret    

000048ec <do_rdwt>:
    48ec:	55                   	push   %ebp
    48ed:	89 e5                	mov    %esp,%ebp
    48ef:	83 ec 78             	sub    $0x78,%esp
    48f2:	8b 45 08             	mov    0x8(%ebp),%eax
    48f5:	8b 40 04             	mov    0x4(%eax),%eax
    48f8:	89 45 dc             	mov    %eax,-0x24(%ebp)
    48fb:	8b 45 08             	mov    0x8(%ebp),%eax
    48fe:	8b 40 1c             	mov    0x1c(%eax),%eax
    4901:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4904:	8b 45 08             	mov    0x8(%ebp),%eax
    4907:	8b 40 5c             	mov    0x5c(%eax),%eax
    490a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    490d:	8b 45 08             	mov    0x8(%ebp),%eax
    4910:	8b 00                	mov    (%eax),%eax
    4912:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4915:	8b 45 08             	mov    0x8(%ebp),%eax
    4918:	8b 40 10             	mov    0x10(%eax),%eax
    491b:	89 45 cc             	mov    %eax,-0x34(%ebp)
    491e:	8b 45 08             	mov    0x8(%ebp),%eax
    4921:	8b 40 40             	mov    0x40(%eax),%eax
    4924:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4927:	8b 45 08             	mov    0x8(%ebp),%eax
    492a:	8b 40 60             	mov    0x60(%eax),%eax
    492d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4930:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4933:	6b d0 66             	imul   $0x66,%eax,%edx
    4936:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4939:	01 d0                	add    %edx,%eax
    493b:	83 c0 1c             	add    $0x1c,%eax
    493e:	8b 04 85 2c 4f 01 00 	mov    0x14f2c(,%eax,4),%eax
    4945:	8b 40 08             	mov    0x8(%eax),%eax
    4948:	89 45 c0             	mov    %eax,-0x40(%ebp)
    494b:	8b 45 c0             	mov    -0x40(%ebp),%eax
    494e:	8b 40 04             	mov    0x4(%eax),%eax
    4951:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4954:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4957:	8b 00                	mov    (%eax),%eax
    4959:	85 c0                	test   %eax,%eax
    495b:	75 5b                	jne    49b8 <do_rdwt+0xcc>
    495d:	8b 45 08             	mov    0x8(%ebp),%eax
    4960:	8b 40 04             	mov    0x4(%eax),%eax
    4963:	83 f8 07             	cmp    $0x7,%eax
    4966:	75 09                	jne    4971 <do_rdwt+0x85>
    4968:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
    496f:	eb 12                	jmp    4983 <do_rdwt+0x97>
    4971:	8b 45 08             	mov    0x8(%ebp),%eax
    4974:	8b 40 04             	mov    0x4(%eax),%eax
    4977:	83 f8 0a             	cmp    $0xa,%eax
    497a:	75 07                	jne    4983 <do_rdwt+0x97>
    497c:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
    4983:	8b 45 08             	mov    0x8(%ebp),%eax
    4986:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4989:	89 50 04             	mov    %edx,0x4(%eax)
    498c:	8b 45 08             	mov    0x8(%ebp),%eax
    498f:	8b 00                	mov    (%eax),%eax
    4991:	89 c2                	mov    %eax,%edx
    4993:	8b 45 08             	mov    0x8(%ebp),%eax
    4996:	89 50 58             	mov    %edx,0x58(%eax)
    4999:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
    49a0:	83 ec 04             	sub    $0x4,%esp
    49a3:	ff 75 b8             	pushl  -0x48(%ebp)
    49a6:	ff 75 08             	pushl  0x8(%ebp)
    49a9:	6a 03                	push   $0x3
    49ab:	e8 d0 df ff ff       	call   2980 <send_rec>
    49b0:	83 c4 10             	add    $0x10,%esp
    49b3:	e9 fc 01 00 00       	jmp    4bb4 <do_rdwt+0x2c8>
    49b8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    49bc:	75 14                	jne    49d2 <do_rdwt+0xe6>
    49be:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    49c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    49c4:	01 d0                	add    %edx,%eax
    49c6:	39 45 bc             	cmp    %eax,-0x44(%ebp)
    49c9:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
    49cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    49d0:	eb 19                	jmp    49eb <do_rdwt+0xff>
    49d2:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    49d5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    49d8:	01 c2                	add    %eax,%edx
    49da:	8b 45 c0             	mov    -0x40(%ebp),%eax
    49dd:	8b 40 0c             	mov    0xc(%eax),%eax
    49e0:	c1 e0 09             	shl    $0x9,%eax
    49e3:	39 c2                	cmp    %eax,%edx
    49e5:	0f 4e c2             	cmovle %edx,%eax
    49e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    49eb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    49ee:	99                   	cltd   
    49ef:	c1 ea 17             	shr    $0x17,%edx
    49f2:	01 d0                	add    %edx,%eax
    49f4:	25 ff 01 00 00       	and    $0x1ff,%eax
    49f9:	29 d0                	sub    %edx,%eax
    49fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
    49fe:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4a01:	8b 50 08             	mov    0x8(%eax),%edx
    4a04:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4a07:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    4a0d:	85 c0                	test   %eax,%eax
    4a0f:	0f 48 c1             	cmovs  %ecx,%eax
    4a12:	c1 f8 09             	sar    $0x9,%eax
    4a15:	01 d0                	add    %edx,%eax
    4a17:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    4a1a:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4a1d:	8b 50 08             	mov    0x8(%eax),%edx
    4a20:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a23:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    4a29:	85 c0                	test   %eax,%eax
    4a2b:	0f 48 c1             	cmovs  %ecx,%eax
    4a2e:	c1 f8 09             	sar    $0x9,%eax
    4a31:	01 d0                	add    %edx,%eax
    4a33:	89 45 b0             	mov    %eax,-0x50(%ebp)
    4a36:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4a39:	2b 45 b4             	sub    -0x4c(%ebp),%eax
    4a3c:	ba 00 00 10 00       	mov    $0x100000,%edx
    4a41:	39 d0                	cmp    %edx,%eax
    4a43:	7d 0b                	jge    4a50 <do_rdwt+0x164>
    4a45:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4a48:	2b 45 b4             	sub    -0x4c(%ebp),%eax
    4a4b:	83 c0 01             	add    $0x1,%eax
    4a4e:	eb 05                	jmp    4a55 <do_rdwt+0x169>
    4a50:	b8 00 00 10 00       	mov    $0x100000,%eax
    4a55:	89 45 ac             	mov    %eax,-0x54(%ebp)
    4a58:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4a5b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4a5e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4a65:	8b 45 08             	mov    0x8(%ebp),%eax
    4a68:	8b 00                	mov    (%eax),%eax
    4a6a:	83 ec 0c             	sub    $0xc,%esp
    4a6d:	50                   	push   %eax
    4a6e:	e8 e5 03 00 00       	call   4e58 <pid2proc>
    4a73:	83 c4 10             	add    $0x10,%esp
    4a76:	89 45 a8             	mov    %eax,-0x58(%ebp)
    4a79:	8b 45 a8             	mov    -0x58(%ebp),%eax
    4a7c:	8b 40 0c             	mov    0xc(%eax),%eax
    4a7f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    4a82:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4a85:	83 ec 08             	sub    $0x8,%esp
    4a88:	ff 75 a8             	pushl  -0x58(%ebp)
    4a8b:	50                   	push   %eax
    4a8c:	e8 b0 04 00 00       	call   4f41 <Seg2PhyAddrLDT>
    4a91:	83 c4 10             	add    $0x10,%esp
    4a94:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4a97:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4a9a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4a9d:	01 d0                	add    %edx,%eax
    4a9f:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4aa2:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4aa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4aa8:	e9 c7 00 00 00       	jmp    4b74 <do_rdwt+0x288>
    4aad:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4ab0:	c1 e0 09             	shl    $0x9,%eax
    4ab3:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4ab6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    4ab9:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
    4abd:	89 45 98             	mov    %eax,-0x68(%ebp)
    4ac0:	c7 45 94 20 00 00 00 	movl   $0x20,-0x6c(%ebp)
    4ac7:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4aca:	c1 e0 09             	shl    $0x9,%eax
    4acd:	89 c2                	mov    %eax,%edx
    4acf:	a1 10 90 00 00       	mov    0x9010,%eax
    4ad4:	83 ec 0c             	sub    $0xc,%esp
    4ad7:	6a 07                	push   $0x7
    4ad9:	52                   	push   %edx
    4ada:	50                   	push   %eax
    4adb:	ff 75 94             	pushl  -0x6c(%ebp)
    4ade:	ff 75 e0             	pushl  -0x20(%ebp)
    4ae1:	e8 9b ee ff ff       	call   3981 <rd_wt>
    4ae6:	83 c4 20             	add    $0x20,%esp
    4ae9:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    4aed:	75 25                	jne    4b14 <do_rdwt+0x228>
    4aef:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4af5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4af8:	01 d0                	add    %edx,%eax
    4afa:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    4afd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    4b00:	01 ca                	add    %ecx,%edx
    4b02:	83 ec 04             	sub    $0x4,%esp
    4b05:	ff 75 98             	pushl  -0x68(%ebp)
    4b08:	50                   	push   %eax
    4b09:	52                   	push   %edx
    4b0a:	e8 7f 1d 00 00       	call   688e <Memcpy>
    4b0f:	83 c4 10             	add    $0x10,%esp
    4b12:	eb 47                	jmp    4b5b <do_rdwt+0x26f>
    4b14:	8b 55 9c             	mov    -0x64(%ebp),%edx
    4b17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b1a:	01 d0                	add    %edx,%eax
    4b1c:	89 c1                	mov    %eax,%ecx
    4b1e:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4b24:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4b27:	01 d0                	add    %edx,%eax
    4b29:	83 ec 04             	sub    $0x4,%esp
    4b2c:	ff 75 98             	pushl  -0x68(%ebp)
    4b2f:	51                   	push   %ecx
    4b30:	50                   	push   %eax
    4b31:	e8 58 1d 00 00       	call   688e <Memcpy>
    4b36:	83 c4 10             	add    $0x10,%esp
    4b39:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4b3c:	c1 e0 09             	shl    $0x9,%eax
    4b3f:	89 c2                	mov    %eax,%edx
    4b41:	a1 10 90 00 00       	mov    0x9010,%eax
    4b46:	83 ec 0c             	sub    $0xc,%esp
    4b49:	6a 0a                	push   $0xa
    4b4b:	52                   	push   %edx
    4b4c:	50                   	push   %eax
    4b4d:	ff 75 94             	pushl  -0x6c(%ebp)
    4b50:	ff 75 e0             	pushl  -0x20(%ebp)
    4b53:	e8 29 ee ff ff       	call   3981 <rd_wt>
    4b58:	83 c4 20             	add    $0x20,%esp
    4b5b:	8b 45 98             	mov    -0x68(%ebp),%eax
    4b5e:	29 45 e8             	sub    %eax,-0x18(%ebp)
    4b61:	8b 45 98             	mov    -0x68(%ebp),%eax
    4b64:	01 45 e4             	add    %eax,-0x1c(%ebp)
    4b67:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4b6e:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4b71:	01 45 e0             	add    %eax,-0x20(%ebp)
    4b74:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4b77:	3b 45 b0             	cmp    -0x50(%ebp),%eax
    4b7a:	7f 0a                	jg     4b86 <do_rdwt+0x29a>
    4b7c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4b80:	0f 85 27 ff ff ff    	jne    4aad <do_rdwt+0x1c1>
    4b86:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4b89:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4b8c:	01 c2                	add    %eax,%edx
    4b8e:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4b91:	8b 40 04             	mov    0x4(%eax),%eax
    4b94:	39 c2                	cmp    %eax,%edx
    4b96:	7e 1c                	jle    4bb4 <do_rdwt+0x2c8>
    4b98:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4b9b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4b9e:	01 c2                	add    %eax,%edx
    4ba0:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4ba3:	89 50 04             	mov    %edx,0x4(%eax)
    4ba6:	83 ec 0c             	sub    $0xc,%esp
    4ba9:	ff 75 c0             	pushl  -0x40(%ebp)
    4bac:	e8 05 00 00 00       	call   4bb6 <sync_inode>
    4bb1:	83 c4 10             	add    $0x10,%esp
    4bb4:	c9                   	leave  
    4bb5:	c3                   	ret    

00004bb6 <sync_inode>:
    4bb6:	55                   	push   %ebp
    4bb7:	89 e5                	mov    %esp,%ebp
    4bb9:	53                   	push   %ebx
    4bba:	83 ec 24             	sub    $0x24,%esp
    4bbd:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
    4bc4:	8b 45 08             	mov    0x8(%ebp),%eax
    4bc7:	8b 40 10             	mov    0x10(%eax),%eax
    4bca:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4bcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4bd0:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4bd3:	b8 00 02 00 00       	mov    $0x200,%eax
    4bd8:	99                   	cltd   
    4bd9:	f7 7d f4             	idivl  -0xc(%ebp)
    4bdc:	89 c3                	mov    %eax,%ebx
    4bde:	89 c8                	mov    %ecx,%eax
    4be0:	99                   	cltd   
    4be1:	f7 fb                	idiv   %ebx
    4be3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    4be6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4be9:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4bec:	b8 00 02 00 00       	mov    $0x200,%eax
    4bf1:	99                   	cltd   
    4bf2:	f7 7d f4             	idivl  -0xc(%ebp)
    4bf5:	89 c3                	mov    %eax,%ebx
    4bf7:	89 c8                	mov    %ecx,%eax
    4bf9:	99                   	cltd   
    4bfa:	f7 fb                	idiv   %ebx
    4bfc:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4bff:	8b 45 08             	mov    0x8(%ebp),%eax
    4c02:	8b 40 14             	mov    0x14(%eax),%eax
    4c05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4c08:	e8 33 01 00 00       	call   4d40 <get_super_block>
    4c0d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4c10:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4c13:	8b 40 04             	mov    0x4(%eax),%eax
    4c16:	8d 50 02             	lea    0x2(%eax),%edx
    4c19:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4c1c:	8b 40 08             	mov    0x8(%eax),%eax
    4c1f:	01 c2                	add    %eax,%edx
    4c21:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4c24:	01 d0                	add    %edx,%eax
    4c26:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4c29:	a1 10 90 00 00       	mov    0x9010,%eax
    4c2e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    4c31:	c1 e2 09             	shl    $0x9,%edx
    4c34:	83 ec 0c             	sub    $0xc,%esp
    4c37:	6a 07                	push   $0x7
    4c39:	68 00 02 00 00       	push   $0x200
    4c3e:	50                   	push   %eax
    4c3f:	ff 75 e4             	pushl  -0x1c(%ebp)
    4c42:	52                   	push   %edx
    4c43:	e8 39 ed ff ff       	call   3981 <rd_wt>
    4c48:	83 c4 20             	add    $0x20,%esp
    4c4b:	a1 10 90 00 00       	mov    0x9010,%eax
    4c50:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4c53:	83 ec 04             	sub    $0x4,%esp
    4c56:	ff 75 f4             	pushl  -0xc(%ebp)
    4c59:	ff 75 08             	pushl  0x8(%ebp)
    4c5c:	ff 75 d8             	pushl  -0x28(%ebp)
    4c5f:	e8 2a 1c 00 00       	call   688e <Memcpy>
    4c64:	83 c4 10             	add    $0x10,%esp
    4c67:	a1 10 90 00 00       	mov    0x9010,%eax
    4c6c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    4c6f:	c1 e2 09             	shl    $0x9,%edx
    4c72:	83 ec 0c             	sub    $0xc,%esp
    4c75:	6a 0a                	push   $0xa
    4c77:	68 00 02 00 00       	push   $0x200
    4c7c:	50                   	push   %eax
    4c7d:	ff 75 e4             	pushl  -0x1c(%ebp)
    4c80:	52                   	push   %edx
    4c81:	e8 fb ec ff ff       	call   3981 <rd_wt>
    4c86:	83 c4 20             	add    $0x20,%esp
    4c89:	90                   	nop
    4c8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4c8d:	c9                   	leave  
    4c8e:	c3                   	ret    

00004c8f <put_inode>:
    4c8f:	55                   	push   %ebp
    4c90:	89 e5                	mov    %esp,%ebp
    4c92:	83 ec 08             	sub    $0x8,%esp
    4c95:	8b 45 08             	mov    0x8(%ebp),%eax
    4c98:	8b 40 18             	mov    0x18(%eax),%eax
    4c9b:	85 c0                	test   %eax,%eax
    4c9d:	7f 1c                	jg     4cbb <put_inode+0x2c>
    4c9f:	68 ae 03 00 00       	push   $0x3ae
    4ca4:	68 6a 67 00 00       	push   $0x676a
    4ca9:	68 6a 67 00 00       	push   $0x676a
    4cae:	68 38 68 00 00       	push   $0x6838
    4cb3:	e8 96 d5 ff ff       	call   224e <assertion_failure>
    4cb8:	83 c4 10             	add    $0x10,%esp
    4cbb:	8b 45 08             	mov    0x8(%ebp),%eax
    4cbe:	8b 40 18             	mov    0x18(%eax),%eax
    4cc1:	8d 50 ff             	lea    -0x1(%eax),%edx
    4cc4:	8b 45 08             	mov    0x8(%ebp),%eax
    4cc7:	89 50 18             	mov    %edx,0x18(%eax)
    4cca:	90                   	nop
    4ccb:	c9                   	leave  
    4ccc:	c3                   	ret    

00004ccd <do_close>:
    4ccd:	55                   	push   %ebp
    4cce:	89 e5                	mov    %esp,%ebp
    4cd0:	83 ec 08             	sub    $0x8,%esp
    4cd3:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4cd8:	8b 55 08             	mov    0x8(%ebp),%edx
    4cdb:	83 c2 1c             	add    $0x1c,%edx
    4cde:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4ce2:	8b 40 08             	mov    0x8(%eax),%eax
    4ce5:	83 ec 0c             	sub    $0xc,%esp
    4ce8:	50                   	push   %eax
    4ce9:	e8 a1 ff ff ff       	call   4c8f <put_inode>
    4cee:	83 c4 10             	add    $0x10,%esp
    4cf1:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4cf6:	8b 55 08             	mov    0x8(%ebp),%edx
    4cf9:	83 c2 1c             	add    $0x1c,%edx
    4cfc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4d00:	8b 50 0c             	mov    0xc(%eax),%edx
    4d03:	83 ea 01             	sub    $0x1,%edx
    4d06:	89 50 0c             	mov    %edx,0xc(%eax)
    4d09:	8b 40 0c             	mov    0xc(%eax),%eax
    4d0c:	85 c0                	test   %eax,%eax
    4d0e:	75 16                	jne    4d26 <do_close+0x59>
    4d10:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4d15:	8b 55 08             	mov    0x8(%ebp),%edx
    4d18:	83 c2 1c             	add    $0x1c,%edx
    4d1b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4d1f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    4d26:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4d2b:	8b 55 08             	mov    0x8(%ebp),%edx
    4d2e:	83 c2 1c             	add    $0x1c,%edx
    4d31:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    4d38:	00 
    4d39:	b8 00 00 00 00       	mov    $0x0,%eax
    4d3e:	c9                   	leave  
    4d3f:	c3                   	ret    

00004d40 <get_super_block>:
    4d40:	55                   	push   %ebp
    4d41:	89 e5                	mov    %esp,%ebp
    4d43:	83 ec 18             	sub    $0x18,%esp
    4d46:	a1 10 90 00 00       	mov    0x9010,%eax
    4d4b:	83 ec 0c             	sub    $0xc,%esp
    4d4e:	6a 07                	push   $0x7
    4d50:	68 00 02 00 00       	push   $0x200
    4d55:	50                   	push   %eax
    4d56:	6a 20                	push   $0x20
    4d58:	68 00 02 00 00       	push   $0x200
    4d5d:	e8 1f ec ff ff       	call   3981 <rd_wt>
    4d62:	83 c4 20             	add    $0x20,%esp
    4d65:	a1 10 90 00 00       	mov    0x9010,%eax
    4d6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4d6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d70:	c9                   	leave  
    4d71:	c3                   	ret    

00004d72 <schedule_process>:
    4d72:	55                   	push   %ebp
    4d73:	89 e5                	mov    %esp,%ebp
    4d75:	83 ec 10             	sub    $0x10,%esp
    4d78:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4d7f:	eb 7e                	jmp    4dff <schedule_process+0x8d>
    4d81:	c7 45 fc 20 4f 01 00 	movl   $0x14f20,-0x4(%ebp)
    4d88:	eb 31                	jmp    4dbb <schedule_process+0x49>
    4d8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4d8d:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    4d94:	84 c0                	test   %al,%al
    4d96:	75 1c                	jne    4db4 <schedule_process+0x42>
    4d98:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4d9b:	8b 40 5c             	mov    0x5c(%eax),%eax
    4d9e:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    4da1:	73 11                	jae    4db4 <schedule_process+0x42>
    4da3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4da6:	8b 40 5c             	mov    0x5c(%eax),%eax
    4da9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4dac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4daf:	a3 a0 a2 00 00       	mov    %eax,0xa2a0
    4db4:	81 45 fc 98 01 00 00 	addl   $0x198,-0x4(%ebp)
    4dbb:	b8 80 55 01 00       	mov    $0x15580,%eax
    4dc0:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    4dc3:	72 c5                	jb     4d8a <schedule_process+0x18>
    4dc5:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    4dc9:	75 34                	jne    4dff <schedule_process+0x8d>
    4dcb:	c7 45 fc 20 4f 01 00 	movl   $0x14f20,-0x4(%ebp)
    4dd2:	eb 21                	jmp    4df5 <schedule_process+0x83>
    4dd4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4dd7:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    4dde:	84 c0                	test   %al,%al
    4de0:	75 0c                	jne    4dee <schedule_process+0x7c>
    4de2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4de5:	8b 50 60             	mov    0x60(%eax),%edx
    4de8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4deb:	89 50 5c             	mov    %edx,0x5c(%eax)
    4dee:	81 45 fc 98 01 00 00 	addl   $0x198,-0x4(%ebp)
    4df5:	b8 80 55 01 00       	mov    $0x15580,%eax
    4dfa:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    4dfd:	72 d5                	jb     4dd4 <schedule_process+0x62>
    4dff:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    4e03:	0f 84 78 ff ff ff    	je     4d81 <schedule_process+0xf>
    4e09:	90                   	nop
    4e0a:	c9                   	leave  
    4e0b:	c3                   	ret    

00004e0c <clock_handler>:
    4e0c:	55                   	push   %ebp
    4e0d:	89 e5                	mov    %esp,%ebp
    4e0f:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4e14:	8b 40 5c             	mov    0x5c(%eax),%eax
    4e17:	85 c0                	test   %eax,%eax
    4e19:	74 0e                	je     4e29 <clock_handler+0x1d>
    4e1b:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4e20:	8b 50 5c             	mov    0x5c(%eax),%edx
    4e23:	83 ea 01             	sub    $0x1,%edx
    4e26:	89 50 5c             	mov    %edx,0x5c(%eax)
    4e29:	a1 80 d4 00 00       	mov    0xd480,%eax
    4e2e:	83 c0 01             	add    $0x1,%eax
    4e31:	a3 80 d4 00 00       	mov    %eax,0xd480
    4e36:	a1 94 9e 00 00       	mov    0x9e94,%eax
    4e3b:	85 c0                	test   %eax,%eax
    4e3d:	75 13                	jne    4e52 <clock_handler+0x46>
    4e3f:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4e44:	8b 40 5c             	mov    0x5c(%eax),%eax
    4e47:	85 c0                	test   %eax,%eax
    4e49:	75 0a                	jne    4e55 <clock_handler+0x49>
    4e4b:	e8 22 ff ff ff       	call   4d72 <schedule_process>
    4e50:	eb 04                	jmp    4e56 <clock_handler+0x4a>
    4e52:	90                   	nop
    4e53:	eb 01                	jmp    4e56 <clock_handler+0x4a>
    4e55:	90                   	nop
    4e56:	5d                   	pop    %ebp
    4e57:	c3                   	ret    

00004e58 <pid2proc>:
    4e58:	55                   	push   %ebp
    4e59:	89 e5                	mov    %esp,%ebp
    4e5b:	83 ec 10             	sub    $0x10,%esp
    4e5e:	8b 45 08             	mov    0x8(%ebp),%eax
    4e61:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    4e67:	05 20 4f 01 00       	add    $0x14f20,%eax
    4e6c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4e6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4e72:	c9                   	leave  
    4e73:	c3                   	ret    

00004e74 <proc2pid>:
    4e74:	55                   	push   %ebp
    4e75:	89 e5                	mov    %esp,%ebp
    4e77:	83 ec 10             	sub    $0x10,%esp
    4e7a:	8b 45 08             	mov    0x8(%ebp),%eax
    4e7d:	2d 20 4f 01 00       	sub    $0x14f20,%eax
    4e82:	c1 f8 03             	sar    $0x3,%eax
    4e85:	69 c0 fb fa fa fa    	imul   $0xfafafafb,%eax,%eax
    4e8b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4e8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4e91:	c9                   	leave  
    4e92:	c3                   	ret    

00004e93 <InitDescriptor>:
    4e93:	55                   	push   %ebp
    4e94:	89 e5                	mov    %esp,%ebp
    4e96:	83 ec 04             	sub    $0x4,%esp
    4e99:	8b 45 14             	mov    0x14(%ebp),%eax
    4e9c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
    4ea0:	8b 45 10             	mov    0x10(%ebp),%eax
    4ea3:	89 c2                	mov    %eax,%edx
    4ea5:	8b 45 08             	mov    0x8(%ebp),%eax
    4ea8:	66 89 10             	mov    %dx,(%eax)
    4eab:	8b 45 0c             	mov    0xc(%ebp),%eax
    4eae:	89 c2                	mov    %eax,%edx
    4eb0:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb3:	66 89 50 02          	mov    %dx,0x2(%eax)
    4eb7:	8b 45 0c             	mov    0xc(%ebp),%eax
    4eba:	c1 e8 10             	shr    $0x10,%eax
    4ebd:	89 c2                	mov    %eax,%edx
    4ebf:	8b 45 08             	mov    0x8(%ebp),%eax
    4ec2:	88 50 04             	mov    %dl,0x4(%eax)
    4ec5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    4ec9:	89 c2                	mov    %eax,%edx
    4ecb:	8b 45 08             	mov    0x8(%ebp),%eax
    4ece:	88 50 05             	mov    %dl,0x5(%eax)
    4ed1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    4ed5:	66 c1 e8 08          	shr    $0x8,%ax
    4ed9:	c1 e0 04             	shl    $0x4,%eax
    4edc:	89 c2                	mov    %eax,%edx
    4ede:	8b 45 10             	mov    0x10(%ebp),%eax
    4ee1:	c1 e8 10             	shr    $0x10,%eax
    4ee4:	83 e0 0f             	and    $0xf,%eax
    4ee7:	09 c2                	or     %eax,%edx
    4ee9:	8b 45 08             	mov    0x8(%ebp),%eax
    4eec:	88 50 06             	mov    %dl,0x6(%eax)
    4eef:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ef2:	c1 e8 18             	shr    $0x18,%eax
    4ef5:	89 c2                	mov    %eax,%edx
    4ef7:	8b 45 08             	mov    0x8(%ebp),%eax
    4efa:	88 50 07             	mov    %dl,0x7(%eax)
    4efd:	90                   	nop
    4efe:	c9                   	leave  
    4eff:	c3                   	ret    

00004f00 <Seg2PhyAddr>:
    4f00:	55                   	push   %ebp
    4f01:	89 e5                	mov    %esp,%ebp
    4f03:	83 ec 10             	sub    $0x10,%esp
    4f06:	8b 45 08             	mov    0x8(%ebp),%eax
    4f09:	c1 e8 03             	shr    $0x3,%eax
    4f0c:	8b 14 c5 a4 9e 00 00 	mov    0x9ea4(,%eax,8),%edx
    4f13:	8b 04 c5 a0 9e 00 00 	mov    0x9ea0(,%eax,8),%eax
    4f1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4f1d:	89 55 f8             	mov    %edx,-0x8(%ebp)
    4f20:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    4f24:	0f b7 c0             	movzwl %ax,%eax
    4f27:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    4f2b:	0f b6 d2             	movzbl %dl,%edx
    4f2e:	c1 e2 10             	shl    $0x10,%edx
    4f31:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    4f37:	09 d0                	or     %edx,%eax
    4f39:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4f3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f3f:	c9                   	leave  
    4f40:	c3                   	ret    

00004f41 <Seg2PhyAddrLDT>:
    4f41:	55                   	push   %ebp
    4f42:	89 e5                	mov    %esp,%ebp
    4f44:	83 ec 10             	sub    $0x10,%esp
    4f47:	8b 45 08             	mov    0x8(%ebp),%eax
    4f4a:	c1 e8 03             	shr    $0x3,%eax
    4f4d:	89 c2                	mov    %eax,%edx
    4f4f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f52:	83 c2 08             	add    $0x8,%edx
    4f55:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
    4f59:	8b 02                	mov    (%edx),%eax
    4f5b:	8b 52 04             	mov    0x4(%edx),%edx
    4f5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4f61:	89 55 f8             	mov    %edx,-0x8(%ebp)
    4f64:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    4f68:	0f b7 c0             	movzwl %ax,%eax
    4f6b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    4f6f:	0f b6 d2             	movzbl %dl,%edx
    4f72:	c1 e2 10             	shl    $0x10,%edx
    4f75:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    4f7b:	09 d0                	or     %edx,%eax
    4f7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4f80:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f83:	c9                   	leave  
    4f84:	c3                   	ret    

00004f85 <VirAddr2PhyAddr>:
    4f85:	55                   	push   %ebp
    4f86:	89 e5                	mov    %esp,%ebp
    4f88:	83 ec 10             	sub    $0x10,%esp
    4f8b:	8b 55 0c             	mov    0xc(%ebp),%edx
    4f8e:	8b 45 08             	mov    0x8(%ebp),%eax
    4f91:	01 d0                	add    %edx,%eax
    4f93:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4f96:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f99:	c9                   	leave  
    4f9a:	c3                   	ret    

00004f9b <v2l>:
    4f9b:	55                   	push   %ebp
    4f9c:	89 e5                	mov    %esp,%ebp
    4f9e:	83 ec 18             	sub    $0x18,%esp
    4fa1:	83 ec 0c             	sub    $0xc,%esp
    4fa4:	ff 75 08             	pushl  0x8(%ebp)
    4fa7:	e8 ac fe ff ff       	call   4e58 <pid2proc>
    4fac:	83 c4 10             	add    $0x10,%esp
    4faf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4fb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fb5:	8b 40 0c             	mov    0xc(%eax),%eax
    4fb8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4fbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4fbe:	83 ec 08             	sub    $0x8,%esp
    4fc1:	ff 75 f4             	pushl  -0xc(%ebp)
    4fc4:	50                   	push   %eax
    4fc5:	e8 77 ff ff ff       	call   4f41 <Seg2PhyAddrLDT>
    4fca:	83 c4 10             	add    $0x10,%esp
    4fcd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4fd0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4fd3:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fd6:	01 d0                	add    %edx,%eax
    4fd8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4fdb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4fde:	c9                   	leave  
    4fdf:	c3                   	ret    

00004fe0 <init_propt>:
    4fe0:	55                   	push   %ebp
    4fe1:	89 e5                	mov    %esp,%ebp
    4fe3:	53                   	push   %ebx
    4fe4:	83 ec 24             	sub    $0x24,%esp
    4fe7:	6a 0e                	push   $0xe
    4fe9:	6a 08                	push   $0x8
    4feb:	68 5e 11 00 00       	push   $0x115e
    4ff0:	6a 20                	push   $0x20
    4ff2:	e8 53 01 00 00       	call   514a <InitInterruptDesc>
    4ff7:	83 c4 10             	add    $0x10,%esp
    4ffa:	6a 0e                	push   $0xe
    4ffc:	6a 08                	push   $0x8
    4ffe:	68 a7 11 00 00       	push   $0x11a7
    5003:	6a 21                	push   $0x21
    5005:	e8 40 01 00 00       	call   514a <InitInterruptDesc>
    500a:	83 c4 10             	add    $0x10,%esp
    500d:	6a 0e                	push   $0xe
    500f:	6a 08                	push   $0x8
    5011:	68 f0 11 00 00       	push   $0x11f0
    5016:	6a 2e                	push   $0x2e
    5018:	e8 2d 01 00 00       	call   514a <InitInterruptDesc>
    501d:	83 c4 10             	add    $0x10,%esp
    5020:	83 ec 04             	sub    $0x4,%esp
    5023:	68 28 0b 00 00       	push   $0xb28
    5028:	6a 00                	push   $0x0
    502a:	68 20 4f 01 00       	push   $0x14f20
    502f:	e8 88 18 00 00       	call   68bc <Memset>
    5034:	83 c4 10             	add    $0x10,%esp
    5037:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
    503e:	83 ec 04             	sub    $0x4,%esp
    5041:	ff 75 f0             	pushl  -0x10(%ebp)
    5044:	6a 00                	push   $0x0
    5046:	68 00 cc 00 00       	push   $0xcc00
    504b:	e8 6c 18 00 00       	call   68bc <Memset>
    5050:	83 c4 10             	add    $0x10,%esp
    5053:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5056:	a3 68 cc 00 00       	mov    %eax,0xcc68
    505b:	c7 05 08 cc 00 00 30 	movl   $0x30,0xcc08
    5062:	00 00 00 
    5065:	83 ec 0c             	sub    $0xc,%esp
    5068:	6a 30                	push   $0x30
    506a:	e8 91 fe ff ff       	call   4f00 <Seg2PhyAddr>
    506f:	83 c4 10             	add    $0x10,%esp
    5072:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5075:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5078:	83 ec 08             	sub    $0x8,%esp
    507b:	68 00 cc 00 00       	push   $0xcc00
    5080:	50                   	push   %eax
    5081:	e8 ff fe ff ff       	call   4f85 <VirAddr2PhyAddr>
    5086:	83 c4 10             	add    $0x10,%esp
    5089:	89 45 e8             	mov    %eax,-0x18(%ebp)
    508c:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
    5093:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5096:	0f b7 d0             	movzwl %ax,%edx
    5099:	8b 45 f0             	mov    -0x10(%ebp),%eax
    509c:	83 e8 01             	sub    $0x1,%eax
    509f:	89 c1                	mov    %eax,%ecx
    50a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    50a4:	52                   	push   %edx
    50a5:	51                   	push   %ecx
    50a6:	50                   	push   %eax
    50a7:	68 e0 9e 00 00       	push   $0x9ee0
    50ac:	e8 e2 fd ff ff       	call   4e93 <InitDescriptor>
    50b1:	83 c4 10             	add    $0x10,%esp
    50b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    50bb:	eb 65                	jmp    5122 <init_propt+0x142>
    50bd:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
    50c4:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
    50cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50ce:	69 c0 98 01 00 00    	imul   $0x198,%eax,%eax
    50d4:	83 c0 40             	add    $0x40,%eax
    50d7:	05 20 4f 01 00       	add    $0x14f20,%eax
    50dc:	8d 50 06             	lea    0x6(%eax),%edx
    50df:	8b 45 ec             	mov    -0x14(%ebp),%eax
    50e2:	83 ec 08             	sub    $0x8,%esp
    50e5:	52                   	push   %edx
    50e6:	50                   	push   %eax
    50e7:	e8 99 fe ff ff       	call   4f85 <VirAddr2PhyAddr>
    50ec:	83 c4 10             	add    $0x10,%esp
    50ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
    50f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    50f5:	0f b7 d0             	movzwl %ax,%edx
    50f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    50fb:	83 e8 01             	sub    $0x1,%eax
    50fe:	89 c3                	mov    %eax,%ebx
    5100:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5103:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5106:	83 c1 09             	add    $0x9,%ecx
    5109:	c1 e1 03             	shl    $0x3,%ecx
    510c:	81 c1 a0 9e 00 00    	add    $0x9ea0,%ecx
    5112:	52                   	push   %edx
    5113:	53                   	push   %ebx
    5114:	50                   	push   %eax
    5115:	51                   	push   %ecx
    5116:	e8 78 fd ff ff       	call   4e93 <InitDescriptor>
    511b:	83 c4 10             	add    $0x10,%esp
    511e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5122:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    5126:	7e 95                	jle    50bd <init_propt+0xdd>
    5128:	68 f2 00 00 00       	push   $0xf2
    512d:	68 ff ff 00 00       	push   $0xffff
    5132:	68 00 80 0b 00       	push   $0xb8000
    5137:	68 d8 9e 00 00       	push   $0x9ed8
    513c:	e8 52 fd ff ff       	call   4e93 <InitDescriptor>
    5141:	83 c4 10             	add    $0x10,%esp
    5144:	90                   	nop
    5145:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5148:	c9                   	leave  
    5149:	c3                   	ret    

0000514a <InitInterruptDesc>:
    514a:	55                   	push   %ebp
    514b:	89 e5                	mov    %esp,%ebp
    514d:	83 ec 10             	sub    $0x10,%esp
    5150:	8b 45 08             	mov    0x8(%ebp),%eax
    5153:	c1 e0 03             	shl    $0x3,%eax
    5156:	05 80 cc 00 00       	add    $0xcc80,%eax
    515b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    515e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5161:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    5165:	8b 45 0c             	mov    0xc(%ebp),%eax
    5168:	89 45 f8             	mov    %eax,-0x8(%ebp)
    516b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    516e:	89 c2                	mov    %eax,%edx
    5170:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5173:	66 89 10             	mov    %dx,(%eax)
    5176:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5179:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
    517f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5182:	c1 f8 10             	sar    $0x10,%eax
    5185:	89 c2                	mov    %eax,%edx
    5187:	8b 45 fc             	mov    -0x4(%ebp),%eax
    518a:	66 89 50 06          	mov    %dx,0x6(%eax)
    518e:	8b 45 10             	mov    0x10(%ebp),%eax
    5191:	c1 e0 04             	shl    $0x4,%eax
    5194:	89 c2                	mov    %eax,%edx
    5196:	8b 45 14             	mov    0x14(%ebp),%eax
    5199:	09 d0                	or     %edx,%eax
    519b:	89 c2                	mov    %eax,%edx
    519d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    51a0:	88 50 05             	mov    %dl,0x5(%eax)
    51a3:	90                   	nop
    51a4:	c9                   	leave  
    51a5:	c3                   	ret    

000051a6 <ReloadGDT>:
    51a6:	55                   	push   %ebp
    51a7:	89 e5                	mov    %esp,%ebp
    51a9:	83 ec 28             	sub    $0x28,%esp
    51ac:	b8 78 cc 00 00       	mov    $0xcc78,%eax
    51b1:	0f b7 00             	movzwl (%eax),%eax
    51b4:	98                   	cwtl   
    51b5:	ba 7a cc 00 00       	mov    $0xcc7a,%edx
    51ba:	8b 12                	mov    (%edx),%edx
    51bc:	83 ec 04             	sub    $0x4,%esp
    51bf:	50                   	push   %eax
    51c0:	52                   	push   %edx
    51c1:	68 a0 9e 00 00       	push   $0x9ea0
    51c6:	e8 c3 16 00 00       	call   688e <Memcpy>
    51cb:	83 c4 10             	add    $0x10,%esp
    51ce:	c7 45 f0 78 cc 00 00 	movl   $0xcc78,-0x10(%ebp)
    51d5:	c7 45 ec 7a cc 00 00 	movl   $0xcc7a,-0x14(%ebp)
    51dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51df:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
    51e4:	ba a0 9e 00 00       	mov    $0x9ea0,%edx
    51e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    51ec:	89 10                	mov    %edx,(%eax)
    51ee:	c7 45 e8 88 9e 00 00 	movl   $0x9e88,-0x18(%ebp)
    51f5:	c7 45 e4 8a 9e 00 00 	movl   $0x9e8a,-0x1c(%ebp)
    51fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    51ff:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
    5204:	ba 80 cc 00 00       	mov    $0xcc80,%edx
    5209:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    520c:	89 10                	mov    %edx,(%eax)
    520e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5215:	eb 04                	jmp    521b <ReloadGDT+0x75>
    5217:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    521b:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    5222:	7e f3                	jle    5217 <ReloadGDT+0x71>
    5224:	e8 3b c5 ff ff       	call   1764 <init_internal_interrupt>
    5229:	e8 b2 fd ff ff       	call   4fe0 <init_propt>
    522e:	90                   	nop
    522f:	c9                   	leave  
    5230:	c3                   	ret    

00005231 <select_console>:
    5231:	55                   	push   %ebp
    5232:	89 e5                	mov    %esp,%ebp
    5234:	83 ec 18             	sub    $0x18,%esp
    5237:	8b 45 08             	mov    0x8(%ebp),%eax
    523a:	88 45 f4             	mov    %al,-0xc(%ebp)
    523d:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
    5241:	77 27                	ja     526a <select_console+0x39>
    5243:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
    5247:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    524d:	05 00 a6 00 00       	add    $0xa600,%eax
    5252:	a3 80 9e 00 00       	mov    %eax,0x9e80
    5257:	a1 80 9e 00 00       	mov    0x9e80,%eax
    525c:	83 ec 0c             	sub    $0xc,%esp
    525f:	50                   	push   %eax
    5260:	e8 08 00 00 00       	call   526d <flush>
    5265:	83 c4 10             	add    $0x10,%esp
    5268:	eb 01                	jmp    526b <select_console+0x3a>
    526a:	90                   	nop
    526b:	c9                   	leave  
    526c:	c3                   	ret    

0000526d <flush>:
    526d:	55                   	push   %ebp
    526e:	89 e5                	mov    %esp,%ebp
    5270:	83 ec 08             	sub    $0x8,%esp
    5273:	8b 45 08             	mov    0x8(%ebp),%eax
    5276:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    527c:	8b 40 0c             	mov    0xc(%eax),%eax
    527f:	83 ec 0c             	sub    $0xc,%esp
    5282:	50                   	push   %eax
    5283:	e8 1e 00 00 00       	call   52a6 <set_cursor>
    5288:	83 c4 10             	add    $0x10,%esp
    528b:	8b 45 08             	mov    0x8(%ebp),%eax
    528e:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5294:	8b 40 08             	mov    0x8(%eax),%eax
    5297:	83 ec 0c             	sub    $0xc,%esp
    529a:	50                   	push   %eax
    529b:	e8 64 00 00 00       	call   5304 <set_console_start_video_addr>
    52a0:	83 c4 10             	add    $0x10,%esp
    52a3:	90                   	nop
    52a4:	c9                   	leave  
    52a5:	c3                   	ret    

000052a6 <set_cursor>:
    52a6:	55                   	push   %ebp
    52a7:	89 e5                	mov    %esp,%ebp
    52a9:	83 ec 08             	sub    $0x8,%esp
    52ac:	83 ec 08             	sub    $0x8,%esp
    52af:	6a 0e                	push   $0xe
    52b1:	68 d4 03 00 00       	push   $0x3d4
    52b6:	e8 1b c0 ff ff       	call   12d6 <out_byte>
    52bb:	83 c4 10             	add    $0x10,%esp
    52be:	8b 45 08             	mov    0x8(%ebp),%eax
    52c1:	c1 e8 08             	shr    $0x8,%eax
    52c4:	0f b7 c0             	movzwl %ax,%eax
    52c7:	83 ec 08             	sub    $0x8,%esp
    52ca:	50                   	push   %eax
    52cb:	68 d5 03 00 00       	push   $0x3d5
    52d0:	e8 01 c0 ff ff       	call   12d6 <out_byte>
    52d5:	83 c4 10             	add    $0x10,%esp
    52d8:	83 ec 08             	sub    $0x8,%esp
    52db:	6a 0f                	push   $0xf
    52dd:	68 d4 03 00 00       	push   $0x3d4
    52e2:	e8 ef bf ff ff       	call   12d6 <out_byte>
    52e7:	83 c4 10             	add    $0x10,%esp
    52ea:	8b 45 08             	mov    0x8(%ebp),%eax
    52ed:	0f b7 c0             	movzwl %ax,%eax
    52f0:	83 ec 08             	sub    $0x8,%esp
    52f3:	50                   	push   %eax
    52f4:	68 d5 03 00 00       	push   $0x3d5
    52f9:	e8 d8 bf ff ff       	call   12d6 <out_byte>
    52fe:	83 c4 10             	add    $0x10,%esp
    5301:	90                   	nop
    5302:	c9                   	leave  
    5303:	c3                   	ret    

00005304 <set_console_start_video_addr>:
    5304:	55                   	push   %ebp
    5305:	89 e5                	mov    %esp,%ebp
    5307:	83 ec 08             	sub    $0x8,%esp
    530a:	83 ec 08             	sub    $0x8,%esp
    530d:	6a 0c                	push   $0xc
    530f:	68 d4 03 00 00       	push   $0x3d4
    5314:	e8 bd bf ff ff       	call   12d6 <out_byte>
    5319:	83 c4 10             	add    $0x10,%esp
    531c:	8b 45 08             	mov    0x8(%ebp),%eax
    531f:	c1 e8 08             	shr    $0x8,%eax
    5322:	0f b7 c0             	movzwl %ax,%eax
    5325:	83 ec 08             	sub    $0x8,%esp
    5328:	50                   	push   %eax
    5329:	68 d5 03 00 00       	push   $0x3d5
    532e:	e8 a3 bf ff ff       	call   12d6 <out_byte>
    5333:	83 c4 10             	add    $0x10,%esp
    5336:	83 ec 08             	sub    $0x8,%esp
    5339:	6a 0d                	push   $0xd
    533b:	68 d4 03 00 00       	push   $0x3d4
    5340:	e8 91 bf ff ff       	call   12d6 <out_byte>
    5345:	83 c4 10             	add    $0x10,%esp
    5348:	8b 45 08             	mov    0x8(%ebp),%eax
    534b:	0f b7 c0             	movzwl %ax,%eax
    534e:	83 ec 08             	sub    $0x8,%esp
    5351:	50                   	push   %eax
    5352:	68 d5 03 00 00       	push   $0x3d5
    5357:	e8 7a bf ff ff       	call   12d6 <out_byte>
    535c:	83 c4 10             	add    $0x10,%esp
    535f:	90                   	nop
    5360:	c9                   	leave  
    5361:	c3                   	ret    

00005362 <put_key>:
    5362:	55                   	push   %ebp
    5363:	89 e5                	mov    %esp,%ebp
    5365:	83 ec 04             	sub    $0x4,%esp
    5368:	8b 45 0c             	mov    0xc(%ebp),%eax
    536b:	88 45 fc             	mov    %al,-0x4(%ebp)
    536e:	8b 45 08             	mov    0x8(%ebp),%eax
    5371:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    5377:	3d 1f 03 00 00       	cmp    $0x31f,%eax
    537c:	77 4d                	ja     53cb <put_key+0x69>
    537e:	8b 45 08             	mov    0x8(%ebp),%eax
    5381:	8b 00                	mov    (%eax),%eax
    5383:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
    5387:	89 10                	mov    %edx,(%eax)
    5389:	8b 45 08             	mov    0x8(%ebp),%eax
    538c:	8b 00                	mov    (%eax),%eax
    538e:	8d 50 04             	lea    0x4(%eax),%edx
    5391:	8b 45 08             	mov    0x8(%ebp),%eax
    5394:	89 10                	mov    %edx,(%eax)
    5396:	8b 45 08             	mov    0x8(%ebp),%eax
    5399:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    539f:	8d 50 01             	lea    0x1(%eax),%edx
    53a2:	8b 45 08             	mov    0x8(%ebp),%eax
    53a5:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
    53ab:	8b 45 08             	mov    0x8(%ebp),%eax
    53ae:	8b 00                	mov    (%eax),%eax
    53b0:	8b 55 08             	mov    0x8(%ebp),%edx
    53b3:	83 c2 08             	add    $0x8,%edx
    53b6:	81 c2 80 0c 00 00    	add    $0xc80,%edx
    53bc:	39 d0                	cmp    %edx,%eax
    53be:	75 0b                	jne    53cb <put_key+0x69>
    53c0:	8b 45 08             	mov    0x8(%ebp),%eax
    53c3:	8d 50 08             	lea    0x8(%eax),%edx
    53c6:	8b 45 08             	mov    0x8(%ebp),%eax
    53c9:	89 10                	mov    %edx,(%eax)
    53cb:	90                   	nop
    53cc:	c9                   	leave  
    53cd:	c3                   	ret    

000053ce <scroll_up>:
    53ce:	55                   	push   %ebp
    53cf:	89 e5                	mov    %esp,%ebp
    53d1:	83 ec 08             	sub    $0x8,%esp
    53d4:	8b 45 08             	mov    0x8(%ebp),%eax
    53d7:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    53dd:	8b 50 08             	mov    0x8(%eax),%edx
    53e0:	8b 45 08             	mov    0x8(%ebp),%eax
    53e3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    53e9:	8b 00                	mov    (%eax),%eax
    53eb:	39 c2                	cmp    %eax,%edx
    53ed:	76 1d                	jbe    540c <scroll_up+0x3e>
    53ef:	8b 45 08             	mov    0x8(%ebp),%eax
    53f2:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    53f8:	8b 40 08             	mov    0x8(%eax),%eax
    53fb:	2d d0 07 00 00       	sub    $0x7d0,%eax
    5400:	83 ec 0c             	sub    $0xc,%esp
    5403:	50                   	push   %eax
    5404:	e8 fb fe ff ff       	call   5304 <set_console_start_video_addr>
    5409:	83 c4 10             	add    $0x10,%esp
    540c:	90                   	nop
    540d:	c9                   	leave  
    540e:	c3                   	ret    

0000540f <scroll_down>:
    540f:	55                   	push   %ebp
    5410:	89 e5                	mov    %esp,%ebp
    5412:	83 ec 08             	sub    $0x8,%esp
    5415:	8b 45 08             	mov    0x8(%ebp),%eax
    5418:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    541e:	8b 40 08             	mov    0x8(%eax),%eax
    5421:	8d 88 a0 0f 00 00    	lea    0xfa0(%eax),%ecx
    5427:	8b 45 08             	mov    0x8(%ebp),%eax
    542a:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5430:	8b 10                	mov    (%eax),%edx
    5432:	8b 45 08             	mov    0x8(%ebp),%eax
    5435:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    543b:	8b 40 04             	mov    0x4(%eax),%eax
    543e:	01 d0                	add    %edx,%eax
    5440:	39 c1                	cmp    %eax,%ecx
    5442:	73 3b                	jae    547f <scroll_down+0x70>
    5444:	8b 45 08             	mov    0x8(%ebp),%eax
    5447:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    544d:	8b 40 08             	mov    0x8(%eax),%eax
    5450:	05 d0 07 00 00       	add    $0x7d0,%eax
    5455:	83 ec 0c             	sub    $0xc,%esp
    5458:	50                   	push   %eax
    5459:	e8 a6 fe ff ff       	call   5304 <set_console_start_video_addr>
    545e:	83 c4 10             	add    $0x10,%esp
    5461:	8b 45 08             	mov    0x8(%ebp),%eax
    5464:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    546a:	8b 50 08             	mov    0x8(%eax),%edx
    546d:	8b 45 08             	mov    0x8(%ebp),%eax
    5470:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5476:	81 c2 d0 07 00 00    	add    $0x7d0,%edx
    547c:	89 50 08             	mov    %edx,0x8(%eax)
    547f:	90                   	nop
    5480:	c9                   	leave  
    5481:	c3                   	ret    

00005482 <out_char>:
    5482:	55                   	push   %ebp
    5483:	89 e5                	mov    %esp,%ebp
    5485:	83 ec 28             	sub    $0x28,%esp
    5488:	8b 45 0c             	mov    0xc(%ebp),%eax
    548b:	88 45 e4             	mov    %al,-0x1c(%ebp)
    548e:	8b 45 08             	mov    0x8(%ebp),%eax
    5491:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5497:	8b 40 0c             	mov    0xc(%eax),%eax
    549a:	05 00 c0 05 00       	add    $0x5c000,%eax
    549f:	01 c0                	add    %eax,%eax
    54a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    54a4:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    54a8:	83 f8 08             	cmp    $0x8,%eax
    54ab:	0f 84 8d 00 00 00    	je     553e <out_char+0xbc>
    54b1:	83 f8 0a             	cmp    $0xa,%eax
    54b4:	0f 85 c9 00 00 00    	jne    5583 <out_char+0x101>
    54ba:	8b 45 08             	mov    0x8(%ebp),%eax
    54bd:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    54c3:	8b 50 0c             	mov    0xc(%eax),%edx
    54c6:	8b 45 08             	mov    0x8(%ebp),%eax
    54c9:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    54cf:	8b 08                	mov    (%eax),%ecx
    54d1:	8b 45 08             	mov    0x8(%ebp),%eax
    54d4:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    54da:	8b 40 04             	mov    0x4(%eax),%eax
    54dd:	01 c8                	add    %ecx,%eax
    54df:	83 e8 50             	sub    $0x50,%eax
    54e2:	39 c2                	cmp    %eax,%edx
    54e4:	0f 83 f4 00 00 00    	jae    55de <out_char+0x15c>
    54ea:	8b 45 08             	mov    0x8(%ebp),%eax
    54ed:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    54f3:	8b 08                	mov    (%eax),%ecx
    54f5:	8b 45 08             	mov    0x8(%ebp),%eax
    54f8:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    54fe:	8b 50 0c             	mov    0xc(%eax),%edx
    5501:	8b 45 08             	mov    0x8(%ebp),%eax
    5504:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    550a:	8b 00                	mov    (%eax),%eax
    550c:	29 c2                	sub    %eax,%edx
    550e:	89 d0                	mov    %edx,%eax
    5510:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    5515:	f7 e2                	mul    %edx
    5517:	89 d0                	mov    %edx,%eax
    5519:	c1 e8 06             	shr    $0x6,%eax
    551c:	8d 50 01             	lea    0x1(%eax),%edx
    551f:	89 d0                	mov    %edx,%eax
    5521:	c1 e0 02             	shl    $0x2,%eax
    5524:	01 d0                	add    %edx,%eax
    5526:	c1 e0 04             	shl    $0x4,%eax
    5529:	89 c2                	mov    %eax,%edx
    552b:	8b 45 08             	mov    0x8(%ebp),%eax
    552e:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5534:	01 ca                	add    %ecx,%edx
    5536:	89 50 0c             	mov    %edx,0xc(%eax)
    5539:	e9 a0 00 00 00       	jmp    55de <out_char+0x15c>
    553e:	8b 45 08             	mov    0x8(%ebp),%eax
    5541:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5547:	8b 50 0c             	mov    0xc(%eax),%edx
    554a:	8b 45 08             	mov    0x8(%ebp),%eax
    554d:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5553:	8b 00                	mov    (%eax),%eax
    5555:	39 c2                	cmp    %eax,%edx
    5557:	0f 86 84 00 00 00    	jbe    55e1 <out_char+0x15f>
    555d:	8b 45 08             	mov    0x8(%ebp),%eax
    5560:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5566:	8b 50 0c             	mov    0xc(%eax),%edx
    5569:	83 ea 01             	sub    $0x1,%edx
    556c:	89 50 0c             	mov    %edx,0xc(%eax)
    556f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5572:	83 e8 02             	sub    $0x2,%eax
    5575:	c6 00 20             	movb   $0x20,(%eax)
    5578:	8b 45 f4             	mov    -0xc(%ebp),%eax
    557b:	83 e8 01             	sub    $0x1,%eax
    557e:	c6 00 00             	movb   $0x0,(%eax)
    5581:	eb 5e                	jmp    55e1 <out_char+0x15f>
    5583:	8b 45 08             	mov    0x8(%ebp),%eax
    5586:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    558c:	8b 40 0c             	mov    0xc(%eax),%eax
    558f:	8d 48 01             	lea    0x1(%eax),%ecx
    5592:	8b 45 08             	mov    0x8(%ebp),%eax
    5595:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    559b:	8b 10                	mov    (%eax),%edx
    559d:	8b 45 08             	mov    0x8(%ebp),%eax
    55a0:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55a6:	8b 40 04             	mov    0x4(%eax),%eax
    55a9:	01 d0                	add    %edx,%eax
    55ab:	39 c1                	cmp    %eax,%ecx
    55ad:	73 35                	jae    55e4 <out_char+0x162>
    55af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    55b2:	8d 50 01             	lea    0x1(%eax),%edx
    55b5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    55b8:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
    55bc:	88 10                	mov    %dl,(%eax)
    55be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    55c1:	8d 50 01             	lea    0x1(%eax),%edx
    55c4:	89 55 f4             	mov    %edx,-0xc(%ebp)
    55c7:	c6 00 0a             	movb   $0xa,(%eax)
    55ca:	8b 45 08             	mov    0x8(%ebp),%eax
    55cd:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55d3:	8b 50 0c             	mov    0xc(%eax),%edx
    55d6:	83 c2 01             	add    $0x1,%edx
    55d9:	89 50 0c             	mov    %edx,0xc(%eax)
    55dc:	eb 06                	jmp    55e4 <out_char+0x162>
    55de:	90                   	nop
    55df:	eb 14                	jmp    55f5 <out_char+0x173>
    55e1:	90                   	nop
    55e2:	eb 11                	jmp    55f5 <out_char+0x173>
    55e4:	90                   	nop
    55e5:	eb 0e                	jmp    55f5 <out_char+0x173>
    55e7:	83 ec 0c             	sub    $0xc,%esp
    55ea:	ff 75 08             	pushl  0x8(%ebp)
    55ed:	e8 1d fe ff ff       	call   540f <scroll_down>
    55f2:	83 c4 10             	add    $0x10,%esp
    55f5:	8b 45 08             	mov    0x8(%ebp),%eax
    55f8:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55fe:	8b 50 0c             	mov    0xc(%eax),%edx
    5601:	8b 45 08             	mov    0x8(%ebp),%eax
    5604:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    560a:	8b 40 08             	mov    0x8(%eax),%eax
    560d:	29 c2                	sub    %eax,%edx
    560f:	89 d0                	mov    %edx,%eax
    5611:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    5616:	77 cf                	ja     55e7 <out_char+0x165>
    5618:	83 ec 0c             	sub    $0xc,%esp
    561b:	ff 75 08             	pushl  0x8(%ebp)
    561e:	e8 4a fc ff ff       	call   526d <flush>
    5623:	83 c4 10             	add    $0x10,%esp
    5626:	90                   	nop
    5627:	c9                   	leave  
    5628:	c3                   	ret    

00005629 <tty_dev_read>:
    5629:	55                   	push   %ebp
    562a:	89 e5                	mov    %esp,%ebp
    562c:	83 ec 08             	sub    $0x8,%esp
    562f:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5634:	39 45 08             	cmp    %eax,0x8(%ebp)
    5637:	75 17                	jne    5650 <tty_dev_read+0x27>
    5639:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    563e:	85 c0                	test   %eax,%eax
    5640:	7e 0e                	jle    5650 <tty_dev_read+0x27>
    5642:	83 ec 0c             	sub    $0xc,%esp
    5645:	ff 75 08             	pushl  0x8(%ebp)
    5648:	e8 52 06 00 00       	call   5c9f <keyboard_read>
    564d:	83 c4 10             	add    $0x10,%esp
    5650:	90                   	nop
    5651:	c9                   	leave  
    5652:	c3                   	ret    

00005653 <tty_dev_write>:
    5653:	55                   	push   %ebp
    5654:	89 e5                	mov    %esp,%ebp
    5656:	83 ec 78             	sub    $0x78,%esp
    5659:	8b 45 08             	mov    0x8(%ebp),%eax
    565c:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    5662:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5665:	e9 ae 01 00 00       	jmp    5818 <tty_dev_write+0x1c5>
    566a:	8b 45 08             	mov    0x8(%ebp),%eax
    566d:	8b 40 04             	mov    0x4(%eax),%eax
    5670:	8b 00                	mov    (%eax),%eax
    5672:	88 45 f3             	mov    %al,-0xd(%ebp)
    5675:	8b 45 08             	mov    0x8(%ebp),%eax
    5678:	8b 40 04             	mov    0x4(%eax),%eax
    567b:	8d 50 04             	lea    0x4(%eax),%edx
    567e:	8b 45 08             	mov    0x8(%ebp),%eax
    5681:	89 50 04             	mov    %edx,0x4(%eax)
    5684:	8b 45 08             	mov    0x8(%ebp),%eax
    5687:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    568d:	8d 50 ff             	lea    -0x1(%eax),%edx
    5690:	8b 45 08             	mov    0x8(%ebp),%eax
    5693:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
    5699:	8b 45 08             	mov    0x8(%ebp),%eax
    569c:	8b 40 04             	mov    0x4(%eax),%eax
    569f:	8b 55 08             	mov    0x8(%ebp),%edx
    56a2:	83 c2 08             	add    $0x8,%edx
    56a5:	81 c2 80 0c 00 00    	add    $0xc80,%edx
    56ab:	39 d0                	cmp    %edx,%eax
    56ad:	75 0c                	jne    56bb <tty_dev_write+0x68>
    56af:	8b 45 08             	mov    0x8(%ebp),%eax
    56b2:	8d 50 08             	lea    0x8(%eax),%edx
    56b5:	8b 45 08             	mov    0x8(%ebp),%eax
    56b8:	89 50 04             	mov    %edx,0x4(%eax)
    56bb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    56bf:	83 ec 08             	sub    $0x8,%esp
    56c2:	50                   	push   %eax
    56c3:	ff 75 08             	pushl  0x8(%ebp)
    56c6:	e8 b7 fd ff ff       	call   5482 <out_char>
    56cb:	83 c4 10             	add    $0x10,%esp
    56ce:	8b 45 08             	mov    0x8(%ebp),%eax
    56d1:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    56d7:	85 c0                	test   %eax,%eax
    56d9:	0f 84 39 01 00 00    	je     5818 <tty_dev_write+0x1c5>
    56df:	80 7d f3 20          	cmpb   $0x20,-0xd(%ebp)
    56e3:	76 71                	jbe    5756 <tty_dev_write+0x103>
    56e5:	80 7d f3 7e          	cmpb   $0x7e,-0xd(%ebp)
    56e9:	77 6b                	ja     5756 <tty_dev_write+0x103>
    56eb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    56ef:	89 c1                	mov    %eax,%ecx
    56f1:	8b 45 08             	mov    0x8(%ebp),%eax
    56f4:	8b 90 94 0c 00 00    	mov    0xc94(%eax),%edx
    56fa:	8b 45 08             	mov    0x8(%ebp),%eax
    56fd:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5703:	01 d0                	add    %edx,%eax
    5705:	83 ec 04             	sub    $0x4,%esp
    5708:	6a 01                	push   $0x1
    570a:	51                   	push   %ecx
    570b:	50                   	push   %eax
    570c:	e8 7d 11 00 00       	call   688e <Memcpy>
    5711:	83 c4 10             	add    $0x10,%esp
    5714:	8b 45 08             	mov    0x8(%ebp),%eax
    5717:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    571d:	8d 50 ff             	lea    -0x1(%eax),%edx
    5720:	8b 45 08             	mov    0x8(%ebp),%eax
    5723:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    5729:	8b 45 08             	mov    0x8(%ebp),%eax
    572c:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5732:	8d 50 01             	lea    0x1(%eax),%edx
    5735:	8b 45 08             	mov    0x8(%ebp),%eax
    5738:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    573e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    5742:	83 ec 08             	sub    $0x8,%esp
    5745:	50                   	push   %eax
    5746:	ff 75 08             	pushl  0x8(%ebp)
    5749:	e8 34 fd ff ff       	call   5482 <out_char>
    574e:	83 c4 10             	add    $0x10,%esp
    5751:	e9 c2 00 00 00       	jmp    5818 <tty_dev_write+0x1c5>
    5756:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
    575a:	75 3f                	jne    579b <tty_dev_write+0x148>
    575c:	8b 45 08             	mov    0x8(%ebp),%eax
    575f:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    5765:	8d 50 01             	lea    0x1(%eax),%edx
    5768:	8b 45 08             	mov    0x8(%ebp),%eax
    576b:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    5771:	8b 45 08             	mov    0x8(%ebp),%eax
    5774:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    577a:	8d 50 ff             	lea    -0x1(%eax),%edx
    577d:	8b 45 08             	mov    0x8(%ebp),%eax
    5780:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    5786:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    578a:	83 ec 08             	sub    $0x8,%esp
    578d:	50                   	push   %eax
    578e:	ff 75 08             	pushl  0x8(%ebp)
    5791:	e8 ec fc ff ff       	call   5482 <out_char>
    5796:	83 c4 10             	add    $0x10,%esp
    5799:	eb 7d                	jmp    5818 <tty_dev_write+0x1c5>
    579b:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
    579f:	74 10                	je     57b1 <tty_dev_write+0x15e>
    57a1:	8b 45 08             	mov    0x8(%ebp),%eax
    57a4:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
    57aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    57ad:	39 c2                	cmp    %eax,%edx
    57af:	75 67                	jne    5818 <tty_dev_write+0x1c5>
    57b1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    57b5:	83 ec 08             	sub    $0x8,%esp
    57b8:	50                   	push   %eax
    57b9:	ff 75 08             	pushl  0x8(%ebp)
    57bc:	e8 c1 fc ff ff       	call   5482 <out_char>
    57c1:	83 c4 10             	add    $0x10,%esp
    57c4:	8b 45 08             	mov    0x8(%ebp),%eax
    57c7:	c7 80 8c 0c 00 00 00 	movl   $0x0,0xc8c(%eax)
    57ce:	00 00 00 
    57d1:	8b 45 08             	mov    0x8(%ebp),%eax
    57d4:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
    57db:	00 00 00 
    57de:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
    57e5:	8b 45 08             	mov    0x8(%ebp),%eax
    57e8:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    57ee:	89 45 d8             	mov    %eax,-0x28(%ebp)
    57f1:	8b 45 08             	mov    0x8(%ebp),%eax
    57f4:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
    57fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
    57fd:	8b 45 08             	mov    0x8(%ebp),%eax
    5800:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
    5806:	83 ec 04             	sub    $0x4,%esp
    5809:	50                   	push   %eax
    580a:	8d 45 88             	lea    -0x78(%ebp),%eax
    580d:	50                   	push   %eax
    580e:	6a 01                	push   $0x1
    5810:	e8 6b d1 ff ff       	call   2980 <send_rec>
    5815:	83 c4 10             	add    $0x10,%esp
    5818:	8b 45 08             	mov    0x8(%ebp),%eax
    581b:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    5821:	85 c0                	test   %eax,%eax
    5823:	0f 85 41 fe ff ff    	jne    566a <tty_dev_write+0x17>
    5829:	90                   	nop
    582a:	c9                   	leave  
    582b:	c3                   	ret    

0000582c <tty_do_read>:
    582c:	55                   	push   %ebp
    582d:	89 e5                	mov    %esp,%ebp
    582f:	83 ec 08             	sub    $0x8,%esp
    5832:	8b 45 08             	mov    0x8(%ebp),%eax
    5835:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
    583c:	00 00 00 
    583f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5842:	8b 50 58             	mov    0x58(%eax),%edx
    5845:	8b 45 08             	mov    0x8(%ebp),%eax
    5848:	89 90 9c 0c 00 00    	mov    %edx,0xc9c(%eax)
    584e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5851:	8b 00                	mov    (%eax),%eax
    5853:	89 c2                	mov    %eax,%edx
    5855:	8b 45 08             	mov    0x8(%ebp),%eax
    5858:	89 90 98 0c 00 00    	mov    %edx,0xc98(%eax)
    585e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5861:	8b 50 1c             	mov    0x1c(%eax),%edx
    5864:	8b 45 08             	mov    0x8(%ebp),%eax
    5867:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    586d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5870:	8b 40 10             	mov    0x10(%eax),%eax
    5873:	89 c2                	mov    %eax,%edx
    5875:	8b 45 08             	mov    0x8(%ebp),%eax
    5878:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
    587e:	83 ec 08             	sub    $0x8,%esp
    5881:	52                   	push   %edx
    5882:	50                   	push   %eax
    5883:	e8 13 f7 ff ff       	call   4f9b <v2l>
    5888:	83 c4 10             	add    $0x10,%esp
    588b:	89 c2                	mov    %eax,%edx
    588d:	8b 45 08             	mov    0x8(%ebp),%eax
    5890:	89 90 94 0c 00 00    	mov    %edx,0xc94(%eax)
    5896:	8b 45 0c             	mov    0xc(%ebp),%eax
    5899:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%eax)
    58a0:	8b 45 08             	mov    0x8(%ebp),%eax
    58a3:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
    58a9:	83 ec 04             	sub    $0x4,%esp
    58ac:	50                   	push   %eax
    58ad:	ff 75 0c             	pushl  0xc(%ebp)
    58b0:	6a 01                	push   $0x1
    58b2:	e8 c9 d0 ff ff       	call   2980 <send_rec>
    58b7:	83 c4 10             	add    $0x10,%esp
    58ba:	90                   	nop
    58bb:	c9                   	leave  
    58bc:	c3                   	ret    

000058bd <tty_do_write>:
    58bd:	55                   	push   %ebp
    58be:	89 e5                	mov    %esp,%ebp
    58c0:	53                   	push   %ebx
    58c1:	81 ec 84 00 00 00    	sub    $0x84,%esp
    58c7:	89 e0                	mov    %esp,%eax
    58c9:	89 c3                	mov    %eax,%ebx
    58cb:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
    58d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58d5:	8d 50 ff             	lea    -0x1(%eax),%edx
    58d8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    58db:	89 c2                	mov    %eax,%edx
    58dd:	b8 10 00 00 00       	mov    $0x10,%eax
    58e2:	83 e8 01             	sub    $0x1,%eax
    58e5:	01 d0                	add    %edx,%eax
    58e7:	b9 10 00 00 00       	mov    $0x10,%ecx
    58ec:	ba 00 00 00 00       	mov    $0x0,%edx
    58f1:	f7 f1                	div    %ecx
    58f3:	6b c0 10             	imul   $0x10,%eax,%eax
    58f6:	29 c4                	sub    %eax,%esp
    58f8:	89 e0                	mov    %esp,%eax
    58fa:	83 c0 00             	add    $0x0,%eax
    58fd:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5900:	8b 45 0c             	mov    0xc(%ebp),%eax
    5903:	8b 40 50             	mov    0x50(%eax),%eax
    5906:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5909:	e9 9b 00 00 00       	jmp    59a9 <tty_do_write+0xec>
    590e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5911:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    5914:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
    5918:	89 45 f0             	mov    %eax,-0x10(%ebp)
    591b:	8b 45 0c             	mov    0xc(%ebp),%eax
    591e:	8b 40 10             	mov    0x10(%eax),%eax
    5921:	89 c2                	mov    %eax,%edx
    5923:	8b 45 0c             	mov    0xc(%ebp),%eax
    5926:	8b 40 58             	mov    0x58(%eax),%eax
    5929:	83 ec 08             	sub    $0x8,%esp
    592c:	52                   	push   %edx
    592d:	50                   	push   %eax
    592e:	e8 68 f6 ff ff       	call   4f9b <v2l>
    5933:	83 c4 10             	add    $0x10,%esp
    5936:	89 c2                	mov    %eax,%edx
    5938:	8b 45 08             	mov    0x8(%ebp),%eax
    593b:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5941:	01 d0                	add    %edx,%eax
    5943:	89 c2                	mov    %eax,%edx
    5945:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5948:	83 ec 04             	sub    $0x4,%esp
    594b:	ff 75 f0             	pushl  -0x10(%ebp)
    594e:	52                   	push   %edx
    594f:	50                   	push   %eax
    5950:	e8 39 0f 00 00       	call   688e <Memcpy>
    5955:	83 c4 10             	add    $0x10,%esp
    5958:	8b 45 f0             	mov    -0x10(%ebp),%eax
    595b:	29 45 ec             	sub    %eax,-0x14(%ebp)
    595e:	8b 45 08             	mov    0x8(%ebp),%eax
    5961:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
    5967:	8b 45 f0             	mov    -0x10(%ebp),%eax
    596a:	01 c2                	add    %eax,%edx
    596c:	8b 45 08             	mov    0x8(%ebp),%eax
    596f:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    5975:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    597c:	eb 25                	jmp    59a3 <tty_do_write+0xe6>
    597e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5981:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5984:	01 d0                	add    %edx,%eax
    5986:	0f b6 00             	movzbl (%eax),%eax
    5989:	0f b6 c0             	movzbl %al,%eax
    598c:	83 ec 08             	sub    $0x8,%esp
    598f:	50                   	push   %eax
    5990:	ff 75 08             	pushl  0x8(%ebp)
    5993:	e8 ea fa ff ff       	call   5482 <out_char>
    5998:	83 c4 10             	add    $0x10,%esp
    599b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    599f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    59a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    59a7:	75 d5                	jne    597e <tty_do_write+0xc1>
    59a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    59ad:	0f 85 5b ff ff ff    	jne    590e <tty_do_write+0x51>
    59b3:	c7 85 7c ff ff ff 65 	movl   $0x65,-0x84(%ebp)
    59ba:	00 00 00 
    59bd:	8b 45 08             	mov    0x8(%ebp),%eax
    59c0:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    59c6:	89 45 c0             	mov    %eax,-0x40(%ebp)
    59c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    59cc:	8b 00                	mov    (%eax),%eax
    59ce:	83 ec 04             	sub    $0x4,%esp
    59d1:	50                   	push   %eax
    59d2:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    59d8:	50                   	push   %eax
    59d9:	6a 01                	push   $0x1
    59db:	e8 a0 cf ff ff       	call   2980 <send_rec>
    59e0:	83 c4 10             	add    $0x10,%esp
    59e3:	89 dc                	mov    %ebx,%esp
    59e5:	90                   	nop
    59e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    59e9:	c9                   	leave  
    59ea:	c3                   	ret    

000059eb <init_screen>:
    59eb:	55                   	push   %ebp
    59ec:	89 e5                	mov    %esp,%ebp
    59ee:	83 ec 10             	sub    $0x10,%esp
    59f1:	8b 45 08             	mov    0x8(%ebp),%eax
    59f4:	2d 00 a6 00 00       	sub    $0xa600,%eax
    59f9:	c1 f8 02             	sar    $0x2,%eax
    59fc:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
    5a02:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5a05:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5a08:	c1 e0 04             	shl    $0x4,%eax
    5a0b:	8d 90 a0 d4 00 00    	lea    0xd4a0(%eax),%edx
    5a11:	8b 45 08             	mov    0x8(%ebp),%eax
    5a14:	89 90 a0 0c 00 00    	mov    %edx,0xca0(%eax)
    5a1a:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
    5a21:	8b 45 08             	mov    0x8(%ebp),%eax
    5a24:	8b 88 a0 0c 00 00    	mov    0xca0(%eax),%ecx
    5a2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5a2d:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    5a32:	f7 e2                	mul    %edx
    5a34:	89 d0                	mov    %edx,%eax
    5a36:	d1 e8                	shr    %eax
    5a38:	89 41 04             	mov    %eax,0x4(%ecx)
    5a3b:	8b 45 08             	mov    0x8(%ebp),%eax
    5a3e:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5a44:	8b 50 04             	mov    0x4(%eax),%edx
    5a47:	8b 45 08             	mov    0x8(%ebp),%eax
    5a4a:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5a50:	0f af 55 fc          	imul   -0x4(%ebp),%edx
    5a54:	89 10                	mov    %edx,(%eax)
    5a56:	8b 45 08             	mov    0x8(%ebp),%eax
    5a59:	8b 90 a0 0c 00 00    	mov    0xca0(%eax),%edx
    5a5f:	8b 45 08             	mov    0x8(%ebp),%eax
    5a62:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5a68:	8b 12                	mov    (%edx),%edx
    5a6a:	89 50 08             	mov    %edx,0x8(%eax)
    5a6d:	8b 55 08             	mov    0x8(%ebp),%edx
    5a70:	8b 92 a0 0c 00 00    	mov    0xca0(%edx),%edx
    5a76:	8b 40 08             	mov    0x8(%eax),%eax
    5a79:	89 42 0c             	mov    %eax,0xc(%edx)
    5a7c:	90                   	nop
    5a7d:	c9                   	leave  
    5a7e:	c3                   	ret    

00005a7f <init_tty>:
    5a7f:	55                   	push   %ebp
    5a80:	89 e5                	mov    %esp,%ebp
    5a82:	83 ec 18             	sub    $0x18,%esp
    5a85:	c7 45 f4 00 a6 00 00 	movl   $0xa600,-0xc(%ebp)
    5a8c:	eb 7a                	jmp    5b08 <init_tty+0x89>
    5a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a91:	8d 50 08             	lea    0x8(%eax),%edx
    5a94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a97:	89 50 04             	mov    %edx,0x4(%eax)
    5a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a9d:	8b 50 04             	mov    0x4(%eax),%edx
    5aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5aa3:	89 10                	mov    %edx,(%eax)
    5aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5aa8:	c7 80 88 0c 00 00 00 	movl   $0x0,0xc88(%eax)
    5aaf:	00 00 00 
    5ab2:	ff 75 f4             	pushl  -0xc(%ebp)
    5ab5:	e8 31 ff ff ff       	call   59eb <init_screen>
    5aba:	83 c4 04             	add    $0x4,%esp
    5abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5ac0:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5ac5:	85 c0                	test   %eax,%eax
    5ac7:	7e 38                	jle    5b01 <init_tty+0x82>
    5ac9:	83 ec 08             	sub    $0x8,%esp
    5acc:	6a 23                	push   $0x23
    5ace:	ff 75 f4             	pushl  -0xc(%ebp)
    5ad1:	e8 ac f9 ff ff       	call   5482 <out_char>
    5ad6:	83 c4 10             	add    $0x10,%esp
    5ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5adc:	05 64 6b 02 00       	add    $0x26b64,%eax
    5ae1:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5ae6:	c1 f8 02             	sar    $0x2,%eax
    5ae9:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
    5aef:	0f b6 c0             	movzbl %al,%eax
    5af2:	83 ec 08             	sub    $0x8,%esp
    5af5:	50                   	push   %eax
    5af6:	ff 75 f4             	pushl  -0xc(%ebp)
    5af9:	e8 84 f9 ff ff       	call   5482 <out_char>
    5afe:	83 c4 10             	add    $0x10,%esp
    5b01:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
    5b08:	b8 ec cb 00 00       	mov    $0xcbec,%eax
    5b0d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5b10:	0f 82 78 ff ff ff    	jb     5a8e <init_tty+0xf>
    5b16:	90                   	nop
    5b17:	c9                   	leave  
    5b18:	c3                   	ret    

00005b19 <TaskTTY>:
    5b19:	55                   	push   %ebp
    5b1a:	89 e5                	mov    %esp,%ebp
    5b1c:	83 ec 78             	sub    $0x78,%esp
    5b1f:	e8 5b ff ff ff       	call   5a7f <init_tty>
    5b24:	83 ec 0c             	sub    $0xc,%esp
    5b27:	6a 00                	push   $0x0
    5b29:	e8 03 f7 ff ff       	call   5231 <select_console>
    5b2e:	83 c4 10             	add    $0x10,%esp
    5b31:	c7 45 f4 00 a6 00 00 	movl   $0xa600,-0xc(%ebp)
    5b38:	eb 30                	jmp    5b6a <TaskTTY+0x51>
    5b3a:	83 ec 0c             	sub    $0xc,%esp
    5b3d:	ff 75 f4             	pushl  -0xc(%ebp)
    5b40:	e8 e4 fa ff ff       	call   5629 <tty_dev_read>
    5b45:	83 c4 10             	add    $0x10,%esp
    5b48:	83 ec 0c             	sub    $0xc,%esp
    5b4b:	ff 75 f4             	pushl  -0xc(%ebp)
    5b4e:	e8 00 fb ff ff       	call   5653 <tty_dev_write>
    5b53:	83 c4 10             	add    $0x10,%esp
    5b56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b59:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    5b5f:	85 c0                	test   %eax,%eax
    5b61:	75 d7                	jne    5b3a <TaskTTY+0x21>
    5b63:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
    5b6a:	b8 ec cb 00 00       	mov    $0xcbec,%eax
    5b6f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5b72:	72 c6                	jb     5b3a <TaskTTY+0x21>
    5b74:	8b 45 8c             	mov    -0x74(%ebp),%eax
    5b77:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5b7a:	81 7d f0 d2 07 00 00 	cmpl   $0x7d2,-0x10(%ebp)
    5b81:	74 12                	je     5b95 <TaskTTY+0x7c>
    5b83:	81 7d f0 d3 07 00 00 	cmpl   $0x7d3,-0x10(%ebp)
    5b8a:	74 20                	je     5bac <TaskTTY+0x93>
    5b8c:	81 7d f0 d1 07 00 00 	cmpl   $0x7d1,-0x10(%ebp)
    5b93:	eb 2d                	jmp    5bc2 <TaskTTY+0xa9>
    5b95:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5b9a:	83 ec 08             	sub    $0x8,%esp
    5b9d:	8d 55 88             	lea    -0x78(%ebp),%edx
    5ba0:	52                   	push   %edx
    5ba1:	50                   	push   %eax
    5ba2:	e8 85 fc ff ff       	call   582c <tty_do_read>
    5ba7:	83 c4 10             	add    $0x10,%esp
    5baa:	eb 16                	jmp    5bc2 <TaskTTY+0xa9>
    5bac:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5bb1:	83 ec 08             	sub    $0x8,%esp
    5bb4:	8d 55 88             	lea    -0x78(%ebp),%edx
    5bb7:	52                   	push   %edx
    5bb8:	50                   	push   %eax
    5bb9:	e8 ff fc ff ff       	call   58bd <tty_do_write>
    5bbe:	83 c4 10             	add    $0x10,%esp
    5bc1:	90                   	nop
    5bc2:	e9 6a ff ff ff       	jmp    5b31 <TaskTTY+0x18>

00005bc7 <keyboard_handler>:
    5bc7:	55                   	push   %ebp
    5bc8:	89 e5                	mov    %esp,%ebp
    5bca:	83 ec 18             	sub    $0x18,%esp
    5bcd:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
    5bd4:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5bd9:	3d 1f 03 00 00       	cmp    $0x31f,%eax
    5bde:	7f 5c                	jg     5c3c <keyboard_handler+0x75>
    5be0:	e8 13 b7 ff ff       	call   12f8 <disable_int>
    5be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5be8:	0f b7 c0             	movzwl %ax,%eax
    5beb:	83 ec 0c             	sub    $0xc,%esp
    5bee:	50                   	push   %eax
    5bef:	e8 d6 b6 ff ff       	call   12ca <in_byte>
    5bf4:	83 c4 10             	add    $0x10,%esp
    5bf7:	88 45 f3             	mov    %al,-0xd(%ebp)
    5bfa:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5bff:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
    5c03:	88 10                	mov    %dl,(%eax)
    5c05:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5c0a:	83 c0 01             	add    $0x1,%eax
    5c0d:	a3 c0 a2 00 00       	mov    %eax,0xa2c0
    5c12:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5c17:	83 c0 01             	add    $0x1,%eax
    5c1a:	a3 c8 a2 00 00       	mov    %eax,0xa2c8
    5c1f:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5c24:	ba ec a5 00 00       	mov    $0xa5ec,%edx
    5c29:	39 d0                	cmp    %edx,%eax
    5c2b:	72 0a                	jb     5c37 <keyboard_handler+0x70>
    5c2d:	c7 05 c0 a2 00 00 cc 	movl   $0xa2cc,0xa2c0
    5c34:	a2 00 00 
    5c37:	e8 be b6 ff ff       	call   12fa <enable_int>
    5c3c:	90                   	nop
    5c3d:	c9                   	leave  
    5c3e:	c3                   	ret    

00005c3f <read_from_keyboard_buf>:
    5c3f:	55                   	push   %ebp
    5c40:	89 e5                	mov    %esp,%ebp
    5c42:	83 ec 18             	sub    $0x18,%esp
    5c45:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
    5c49:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5c4e:	85 c0                	test   %eax,%eax
    5c50:	7e 47                	jle    5c99 <read_from_keyboard_buf+0x5a>
    5c52:	e8 a1 b6 ff ff       	call   12f8 <disable_int>
    5c57:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5c5c:	0f b6 00             	movzbl (%eax),%eax
    5c5f:	88 45 f7             	mov    %al,-0x9(%ebp)
    5c62:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5c67:	83 c0 01             	add    $0x1,%eax
    5c6a:	a3 c4 a2 00 00       	mov    %eax,0xa2c4
    5c6f:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5c74:	83 e8 01             	sub    $0x1,%eax
    5c77:	a3 c8 a2 00 00       	mov    %eax,0xa2c8
    5c7c:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5c81:	ba ec a5 00 00       	mov    $0xa5ec,%edx
    5c86:	39 d0                	cmp    %edx,%eax
    5c88:	72 0a                	jb     5c94 <read_from_keyboard_buf+0x55>
    5c8a:	c7 05 c4 a2 00 00 cc 	movl   $0xa2cc,0xa2c4
    5c91:	a2 00 00 
    5c94:	e8 61 b6 ff ff       	call   12fa <enable_int>
    5c99:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    5c9d:	c9                   	leave  
    5c9e:	c3                   	ret    

00005c9f <keyboard_read>:
    5c9f:	55                   	push   %ebp
    5ca0:	89 e5                	mov    %esp,%ebp
    5ca2:	83 ec 28             	sub    $0x28,%esp
    5ca5:	90                   	nop
    5ca6:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5cab:	85 c0                	test   %eax,%eax
    5cad:	7e f7                	jle    5ca6 <keyboard_read+0x7>
    5caf:	e8 8b ff ff ff       	call   5c3f <read_from_keyboard_buf>
    5cb4:	88 45 ea             	mov    %al,-0x16(%ebp)
    5cb7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5cbe:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5cc2:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
    5cc6:	75 5a                	jne    5d22 <keyboard_read+0x83>
    5cc8:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
    5ccc:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
    5cd0:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
    5cd4:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
    5cd8:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
    5cdc:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
    5ce0:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
    5ce4:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    5ceb:	eb 20                	jmp    5d0d <keyboard_read+0x6e>
    5ced:	e8 4d ff ff ff       	call   5c3f <read_from_keyboard_buf>
    5cf2:	89 c1                	mov    %eax,%ecx
    5cf4:	8d 55 e3             	lea    -0x1d(%ebp),%edx
    5cf7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5cfa:	01 d0                	add    %edx,%eax
    5cfc:	0f b6 00             	movzbl (%eax),%eax
    5cff:	38 c1                	cmp    %al,%cl
    5d01:	74 06                	je     5d09 <keyboard_read+0x6a>
    5d03:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    5d07:	eb 0a                	jmp    5d13 <keyboard_read+0x74>
    5d09:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5d0d:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
    5d11:	7e da                	jle    5ced <keyboard_read+0x4e>
    5d13:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
    5d17:	74 68                	je     5d81 <keyboard_read+0xe2>
    5d19:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
    5d20:	eb 5f                	jmp    5d81 <keyboard_read+0xe2>
    5d22:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
    5d26:	75 59                	jne    5d81 <keyboard_read+0xe2>
    5d28:	e8 12 ff ff ff       	call   5c3f <read_from_keyboard_buf>
    5d2d:	3c 2a                	cmp    $0x2a,%al
    5d2f:	75 1d                	jne    5d4e <keyboard_read+0xaf>
    5d31:	e8 09 ff ff ff       	call   5c3f <read_from_keyboard_buf>
    5d36:	3c e0                	cmp    $0xe0,%al
    5d38:	75 14                	jne    5d4e <keyboard_read+0xaf>
    5d3a:	e8 00 ff ff ff       	call   5c3f <read_from_keyboard_buf>
    5d3f:	3c 37                	cmp    $0x37,%al
    5d41:	75 0b                	jne    5d4e <keyboard_read+0xaf>
    5d43:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    5d4a:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    5d4e:	e8 ec fe ff ff       	call   5c3f <read_from_keyboard_buf>
    5d53:	3c b7                	cmp    $0xb7,%al
    5d55:	75 1d                	jne    5d74 <keyboard_read+0xd5>
    5d57:	e8 e3 fe ff ff       	call   5c3f <read_from_keyboard_buf>
    5d5c:	3c e0                	cmp    $0xe0,%al
    5d5e:	75 14                	jne    5d74 <keyboard_read+0xd5>
    5d60:	e8 da fe ff ff       	call   5c3f <read_from_keyboard_buf>
    5d65:	3c aa                	cmp    $0xaa,%al
    5d67:	75 0b                	jne    5d74 <keyboard_read+0xd5>
    5d69:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    5d70:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5d74:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5d78:	75 07                	jne    5d81 <keyboard_read+0xe2>
    5d7a:	c6 05 84 9e 00 00 01 	movb   $0x1,0x9e84
    5d81:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
    5d88:	0f 84 8d 00 00 00    	je     5e1b <keyboard_read+0x17c>
    5d8e:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
    5d95:	0f 84 80 00 00 00    	je     5e1b <keyboard_read+0x17c>
    5d9b:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
    5d9f:	0f 94 c2             	sete   %dl
    5da2:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
    5da6:	0f 94 c0             	sete   %al
    5da9:	09 d0                	or     %edx,%eax
    5dab:	84 c0                	test   %al,%al
    5dad:	74 07                	je     5db6 <keyboard_read+0x117>
    5daf:	c6 05 74 cc 00 00 01 	movb   $0x1,0xcc74
    5db6:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    5dba:	f7 d0                	not    %eax
    5dbc:	c0 e8 07             	shr    $0x7,%al
    5dbf:	88 45 e9             	mov    %al,-0x17(%ebp)
    5dc2:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
    5dc6:	74 53                	je     5e1b <keyboard_read+0x17c>
    5dc8:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
    5dcc:	74 4d                	je     5e1b <keyboard_read+0x17c>
    5dce:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
    5dd2:	0f b6 05 74 cc 00 00 	movzbl 0xcc74,%eax
    5dd9:	3c 01                	cmp    $0x1,%al
    5ddb:	75 04                	jne    5de1 <keyboard_read+0x142>
    5ddd:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    5de1:	0f b6 05 84 9e 00 00 	movzbl 0x9e84,%eax
    5de8:	84 c0                	test   %al,%al
    5dea:	74 04                	je     5df0 <keyboard_read+0x151>
    5dec:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
    5df0:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
    5df4:	89 d0                	mov    %edx,%eax
    5df6:	01 c0                	add    %eax,%eax
    5df8:	01 c2                	add    %eax,%edx
    5dfa:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    5dfe:	01 d0                	add    %edx,%eax
    5e00:	8b 04 85 80 90 00 00 	mov    0x9080(,%eax,4),%eax
    5e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5e0a:	83 ec 08             	sub    $0x8,%esp
    5e0d:	ff 75 f4             	pushl  -0xc(%ebp)
    5e10:	ff 75 08             	pushl  0x8(%ebp)
    5e13:	e8 1a 00 00 00       	call   5e32 <in_process>
    5e18:	83 c4 10             	add    $0x10,%esp
    5e1b:	90                   	nop
    5e1c:	c9                   	leave  
    5e1d:	c3                   	ret    

00005e1e <init_keyboard_handler>:
    5e1e:	55                   	push   %ebp
    5e1f:	89 e5                	mov    %esp,%ebp
    5e21:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    5e28:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    5e2f:	90                   	nop
    5e30:	5d                   	pop    %ebp
    5e31:	c3                   	ret    

00005e32 <in_process>:
    5e32:	55                   	push   %ebp
    5e33:	89 e5                	mov    %esp,%ebp
    5e35:	83 ec 18             	sub    $0x18,%esp
    5e38:	83 ec 04             	sub    $0x4,%esp
    5e3b:	6a 02                	push   $0x2
    5e3d:	6a 00                	push   $0x0
    5e3f:	8d 45 f6             	lea    -0xa(%ebp),%eax
    5e42:	50                   	push   %eax
    5e43:	e8 74 0a 00 00       	call   68bc <Memset>
    5e48:	83 c4 10             	add    $0x10,%esp
    5e4b:	8b 45 0c             	mov    0xc(%ebp),%eax
    5e4e:	25 00 01 00 00       	and    $0x100,%eax
    5e53:	85 c0                	test   %eax,%eax
    5e55:	75 28                	jne    5e7f <in_process+0x4d>
    5e57:	8b 45 0c             	mov    0xc(%ebp),%eax
    5e5a:	0f b6 c0             	movzbl %al,%eax
    5e5d:	83 ec 08             	sub    $0x8,%esp
    5e60:	50                   	push   %eax
    5e61:	ff 75 08             	pushl  0x8(%ebp)
    5e64:	e8 f9 f4 ff ff       	call   5362 <put_key>
    5e69:	83 c4 10             	add    $0x10,%esp
    5e6c:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    5e73:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    5e7a:	e9 42 01 00 00       	jmp    5fc1 <in_process+0x18f>
    5e7f:	0f b6 05 74 cc 00 00 	movzbl 0xcc74,%eax
    5e86:	84 c0                	test   %al,%al
    5e88:	0f 84 a9 00 00 00    	je     5f37 <in_process+0x105>
    5e8e:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
    5e92:	0f 84 9f 00 00 00    	je     5f37 <in_process+0x105>
    5e98:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
    5e9c:	0f 84 95 00 00 00    	je     5f37 <in_process+0x105>
    5ea2:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    5ea9:	74 64                	je     5f0f <in_process+0xdd>
    5eab:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    5eb2:	77 0b                	ja     5ebf <in_process+0x8d>
    5eb4:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    5ebb:	74 64                	je     5f21 <in_process+0xef>
    5ebd:	eb 73                	jmp    5f32 <in_process+0x100>
    5ebf:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
    5ec6:	74 0b                	je     5ed3 <in_process+0xa1>
    5ec8:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
    5ecf:	74 20                	je     5ef1 <in_process+0xbf>
    5ed1:	eb 5f                	jmp    5f32 <in_process+0x100>
    5ed3:	83 ec 0c             	sub    $0xc,%esp
    5ed6:	ff 75 08             	pushl  0x8(%ebp)
    5ed9:	e8 f0 f4 ff ff       	call   53ce <scroll_up>
    5ede:	83 c4 10             	add    $0x10,%esp
    5ee1:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    5ee8:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    5eef:	eb 41                	jmp    5f32 <in_process+0x100>
    5ef1:	83 ec 0c             	sub    $0xc,%esp
    5ef4:	ff 75 08             	pushl  0x8(%ebp)
    5ef7:	e8 13 f5 ff ff       	call   540f <scroll_down>
    5efc:	83 c4 10             	add    $0x10,%esp
    5eff:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    5f06:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    5f0d:	eb 23                	jmp    5f32 <in_process+0x100>
    5f0f:	83 ec 08             	sub    $0x8,%esp
    5f12:	6a 0a                	push   $0xa
    5f14:	ff 75 08             	pushl  0x8(%ebp)
    5f17:	e8 66 f5 ff ff       	call   5482 <out_char>
    5f1c:	83 c4 10             	add    $0x10,%esp
    5f1f:	eb 11                	jmp    5f32 <in_process+0x100>
    5f21:	83 ec 08             	sub    $0x8,%esp
    5f24:	6a 08                	push   $0x8
    5f26:	ff 75 08             	pushl  0x8(%ebp)
    5f29:	e8 54 f5 ff ff       	call   5482 <out_char>
    5f2e:	83 c4 10             	add    $0x10,%esp
    5f31:	90                   	nop
    5f32:	e9 8a 00 00 00       	jmp    5fc1 <in_process+0x18f>
    5f37:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    5f3e:	74 55                	je     5f95 <in_process+0x163>
    5f40:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    5f47:	77 14                	ja     5f5d <in_process+0x12b>
    5f49:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    5f50:	74 31                	je     5f83 <in_process+0x151>
    5f52:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    5f59:	74 16                	je     5f71 <in_process+0x13f>
    5f5b:	eb 64                	jmp    5fc1 <in_process+0x18f>
    5f5d:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
    5f64:	74 3e                	je     5fa4 <in_process+0x172>
    5f66:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
    5f6d:	74 44                	je     5fb3 <in_process+0x181>
    5f6f:	eb 50                	jmp    5fc1 <in_process+0x18f>
    5f71:	83 ec 08             	sub    $0x8,%esp
    5f74:	6a 0a                	push   $0xa
    5f76:	ff 75 08             	pushl  0x8(%ebp)
    5f79:	e8 e4 f3 ff ff       	call   5362 <put_key>
    5f7e:	83 c4 10             	add    $0x10,%esp
    5f81:	eb 3e                	jmp    5fc1 <in_process+0x18f>
    5f83:	83 ec 08             	sub    $0x8,%esp
    5f86:	6a 08                	push   $0x8
    5f88:	ff 75 08             	pushl  0x8(%ebp)
    5f8b:	e8 d2 f3 ff ff       	call   5362 <put_key>
    5f90:	83 c4 10             	add    $0x10,%esp
    5f93:	eb 2c                	jmp    5fc1 <in_process+0x18f>
    5f95:	83 ec 0c             	sub    $0xc,%esp
    5f98:	6a 00                	push   $0x0
    5f9a:	e8 92 f2 ff ff       	call   5231 <select_console>
    5f9f:	83 c4 10             	add    $0x10,%esp
    5fa2:	eb 1d                	jmp    5fc1 <in_process+0x18f>
    5fa4:	83 ec 0c             	sub    $0xc,%esp
    5fa7:	6a 01                	push   $0x1
    5fa9:	e8 83 f2 ff ff       	call   5231 <select_console>
    5fae:	83 c4 10             	add    $0x10,%esp
    5fb1:	eb 0e                	jmp    5fc1 <in_process+0x18f>
    5fb3:	83 ec 0c             	sub    $0xc,%esp
    5fb6:	6a 02                	push   $0x2
    5fb8:	e8 74 f2 ff ff       	call   5231 <select_console>
    5fbd:	83 c4 10             	add    $0x10,%esp
    5fc0:	90                   	nop
    5fc1:	90                   	nop
    5fc2:	c9                   	leave  
    5fc3:	c3                   	ret    

00005fc4 <open>:
    5fc4:	55                   	push   %ebp
    5fc5:	89 e5                	mov    %esp,%ebp
    5fc7:	83 ec 78             	sub    $0x78,%esp
    5fca:	c7 45 94 06 00 00 00 	movl   $0x6,-0x6c(%ebp)
    5fd1:	8b 45 08             	mov    0x8(%ebp),%eax
    5fd4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    5fd7:	8b 45 0c             	mov    0xc(%ebp),%eax
    5fda:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5fdd:	83 ec 0c             	sub    $0xc,%esp
    5fe0:	ff 75 08             	pushl  0x8(%ebp)
    5fe3:	e8 0d 09 00 00       	call   68f5 <Strlen>
    5fe8:	83 c4 10             	add    $0x10,%esp
    5feb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    5fee:	83 ec 04             	sub    $0x4,%esp
    5ff1:	6a 03                	push   $0x3
    5ff3:	8d 45 90             	lea    -0x70(%ebp),%eax
    5ff6:	50                   	push   %eax
    5ff7:	6a 03                	push   $0x3
    5ff9:	e8 82 c9 ff ff       	call   2980 <send_rec>
    5ffe:	83 c4 10             	add    $0x10,%esp
    6001:	8b 45 94             	mov    -0x6c(%ebp),%eax
    6004:	83 f8 65             	cmp    $0x65,%eax
    6007:	74 19                	je     6022 <open+0x5e>
    6009:	6a 17                	push   $0x17
    600b:	68 47 68 00 00       	push   $0x6847
    6010:	68 47 68 00 00       	push   $0x6847
    6015:	68 52 68 00 00       	push   $0x6852
    601a:	e8 2f c2 ff ff       	call   224e <assertion_failure>
    601f:	83 c4 10             	add    $0x10,%esp
    6022:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6025:	c9                   	leave  
    6026:	c3                   	ret    

00006027 <read>:
    6027:	55                   	push   %ebp
    6028:	89 e5                	mov    %esp,%ebp
    602a:	83 ec 78             	sub    $0x78,%esp
    602d:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%ebp)
    6034:	8b 45 08             	mov    0x8(%ebp),%eax
    6037:	89 45 d0             	mov    %eax,-0x30(%ebp)
    603a:	8b 45 0c             	mov    0xc(%ebp),%eax
    603d:	89 45 a0             	mov    %eax,-0x60(%ebp)
    6040:	8b 45 10             	mov    0x10(%ebp),%eax
    6043:	89 45 e0             	mov    %eax,-0x20(%ebp)
    6046:	83 ec 04             	sub    $0x4,%esp
    6049:	6a 03                	push   $0x3
    604b:	8d 45 90             	lea    -0x70(%ebp),%eax
    604e:	50                   	push   %eax
    604f:	6a 03                	push   $0x3
    6051:	e8 2a c9 ff ff       	call   2980 <send_rec>
    6056:	83 c4 10             	add    $0x10,%esp
    6059:	8b 45 e0             	mov    -0x20(%ebp),%eax
    605c:	c9                   	leave  
    605d:	c3                   	ret    

0000605e <write>:
    605e:	55                   	push   %ebp
    605f:	89 e5                	mov    %esp,%ebp
    6061:	83 ec 78             	sub    $0x78,%esp
    6064:	c7 45 94 0a 00 00 00 	movl   $0xa,-0x6c(%ebp)
    606b:	8b 45 08             	mov    0x8(%ebp),%eax
    606e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6071:	8b 45 0c             	mov    0xc(%ebp),%eax
    6074:	89 45 a0             	mov    %eax,-0x60(%ebp)
    6077:	8b 45 10             	mov    0x10(%ebp),%eax
    607a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    607d:	83 ec 04             	sub    $0x4,%esp
    6080:	6a 03                	push   $0x3
    6082:	8d 45 90             	lea    -0x70(%ebp),%eax
    6085:	50                   	push   %eax
    6086:	6a 03                	push   $0x3
    6088:	e8 f3 c8 ff ff       	call   2980 <send_rec>
    608d:	83 c4 10             	add    $0x10,%esp
    6090:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6093:	c9                   	leave  
    6094:	c3                   	ret    

00006095 <close>:
    6095:	55                   	push   %ebp
    6096:	89 e5                	mov    %esp,%ebp
    6098:	83 ec 78             	sub    $0x78,%esp
    609b:	c7 45 94 01 00 00 00 	movl   $0x1,-0x6c(%ebp)
    60a2:	8b 45 08             	mov    0x8(%ebp),%eax
    60a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    60a8:	83 ec 04             	sub    $0x4,%esp
    60ab:	6a 03                	push   $0x3
    60ad:	8d 45 90             	lea    -0x70(%ebp),%eax
    60b0:	50                   	push   %eax
    60b1:	6a 03                	push   $0x3
    60b3:	e8 c8 c8 ff ff       	call   2980 <send_rec>
    60b8:	83 c4 10             	add    $0x10,%esp
    60bb:	8b 45 94             	mov    -0x6c(%ebp),%eax
    60be:	83 f8 65             	cmp    $0x65,%eax
    60c1:	74 19                	je     60dc <close+0x47>
    60c3:	6a 14                	push   $0x14
    60c5:	68 6a 68 00 00       	push   $0x686a
    60ca:	68 6a 68 00 00       	push   $0x686a
    60cf:	68 76 68 00 00       	push   $0x6876
    60d4:	e8 75 c1 ff ff       	call   224e <assertion_failure>
    60d9:	83 c4 10             	add    $0x10,%esp
    60dc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    60df:	c9                   	leave  
    60e0:	c3                   	ret    
