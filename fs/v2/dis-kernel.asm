
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00001000 <_start>:
    1000:	66 87 db             	xchg   %bx,%bx
    1003:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    100a:	00 00 00 
    100d:	b4 0b                	mov    $0xb,%ah
    100f:	b0 4c                	mov    $0x4c,%al
    1011:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
    1018:	bc 80 9e 00 00       	mov    $0x9e80,%esp
    101d:	66 c7 05 90 9e 00 00 	movw   $0x0,0x9e90
    1024:	00 00 
    1026:	66 87 db             	xchg   %bx,%bx
    1029:	0f 01 05 78 cc 00 00 	sgdtl  0xcc78
    1030:	e8 4c 43 00 00       	call   5381 <ReloadGDT>
    1035:	0f 01 15 78 cc 00 00 	lgdtl  0xcc78
    103c:	0f 01 1d 88 9e 00 00 	lidtl  0x9e88
    1043:	ea 4a 10 00 00 08 00 	ljmp   $0x8,$0x104a

0000104a <csinit>:
    104a:	31 c0                	xor    %eax,%eax
    104c:	66 b8 40 00          	mov    $0x40,%ax
    1050:	0f 00 d8             	ltr    %ax
    1053:	66 87 db             	xchg   %bx,%bx
    1056:	e9 60 0a 00 00       	jmp    1abb <kernel_main>
    105b:	eb fe                	jmp    105b <csinit+0x11>
    105d:	fb                   	sti    
    105e:	b4 0b                	mov    $0xb,%ah
    1060:	b0 4d                	mov    $0x4d,%al
    1062:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
    1069:	eb fe                	jmp    1069 <csinit+0x1f>
    106b:	f4                   	hlt    
    106c:	6a 00                	push   $0x0
    106e:	9d                   	popf   
    106f:	eb fe                	jmp    106f <csinit+0x25>
    1071:	e8 71 08 00 00       	call   18e7 <test>
    1076:	6a 01                	push   $0x1
    1078:	6a 02                	push   $0x2
    107a:	6a 03                	push   $0x3
    107c:	f4                   	hlt    

0000107d <InterruptTest>:
    107d:	b4 0d                	mov    $0xd,%ah
    107f:	b0 54                	mov    $0x54,%al
    1081:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
    1088:	c3                   	ret    

00001089 <disp_str>:
    1089:	55                   	push   %ebp
    108a:	89 e5                	mov    %esp,%ebp
    108c:	b4 0d                	mov    $0xd,%ah
    108e:	8b 75 08             	mov    0x8(%ebp),%esi
    1091:	8b 3d 90 9e 00 00    	mov    0x9e90,%edi

00001097 <disp_str.1>:
    1097:	ac                   	lods   %ds:(%esi),%al
    1098:	84 c0                	test   %al,%al
    109a:	74 1e                	je     10ba <disp_str.4>
    109c:	3c 0a                	cmp    $0xa,%al
    109e:	75 11                	jne    10b1 <disp_str.3>
    10a0:	50                   	push   %eax
    10a1:	89 f8                	mov    %edi,%eax
    10a3:	b3 a0                	mov    $0xa0,%bl
    10a5:	f6 f3                	div    %bl
    10a7:	40                   	inc    %eax
    10a8:	b3 a0                	mov    $0xa0,%bl
    10aa:	f6 e3                	mul    %bl
    10ac:	89 c7                	mov    %eax,%edi
    10ae:	58                   	pop    %eax
    10af:	eb e6                	jmp    1097 <disp_str.1>

000010b1 <disp_str.3>:
    10b1:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10b5:	83 c7 02             	add    $0x2,%edi
    10b8:	eb dd                	jmp    1097 <disp_str.1>

000010ba <disp_str.4>:
    10ba:	89 3d 90 9e 00 00    	mov    %edi,0x9e90
    10c0:	89 ec                	mov    %ebp,%esp
    10c2:	5d                   	pop    %ebp
    10c3:	c3                   	ret    

000010c4 <disp_str_colour>:
    10c4:	55                   	push   %ebp
    10c5:	89 e5                	mov    %esp,%ebp
    10c7:	8b 75 08             	mov    0x8(%ebp),%esi
    10ca:	8a 65 0c             	mov    0xc(%ebp),%ah
    10cd:	8b 3d 90 9e 00 00    	mov    0x9e90,%edi

000010d3 <disp_str_colour.1>:
    10d3:	ac                   	lods   %ds:(%esi),%al
    10d4:	84 c0                	test   %al,%al
    10d6:	74 1e                	je     10f6 <disp_str_colour.4>
    10d8:	3c 0a                	cmp    $0xa,%al
    10da:	75 11                	jne    10ed <disp_str_colour.3>
    10dc:	50                   	push   %eax
    10dd:	89 f8                	mov    %edi,%eax
    10df:	b3 a0                	mov    $0xa0,%bl
    10e1:	f6 f3                	div    %bl
    10e3:	40                   	inc    %eax
    10e4:	b3 a0                	mov    $0xa0,%bl
    10e6:	f6 e3                	mul    %bl
    10e8:	89 c7                	mov    %eax,%edi
    10ea:	58                   	pop    %eax
    10eb:	eb e6                	jmp    10d3 <disp_str_colour.1>

000010ed <disp_str_colour.3>:
    10ed:	65 66 89 07          	mov    %ax,%gs:(%edi)
    10f1:	83 c7 02             	add    $0x2,%edi
    10f4:	eb dd                	jmp    10d3 <disp_str_colour.1>

000010f6 <disp_str_colour.4>:
    10f6:	89 3d 90 9e 00 00    	mov    %edi,0x9e90
    10fc:	89 ec                	mov    %ebp,%esp
    10fe:	5d                   	pop    %ebp
    10ff:	c3                   	ret    

00001100 <divide_zero_fault>:
    1100:	6a ff                	push   $0xffffffff
    1102:	6a 00                	push   $0x0
    1104:	eb 58                	jmp    115e <exception>

00001106 <single_step_fault>:
    1106:	6a ff                	push   $0xffffffff
    1108:	6a 01                	push   $0x1
    110a:	eb 52                	jmp    115e <exception>

0000110c <non_maskable_interrupt>:
    110c:	6a ff                	push   $0xffffffff
    110e:	6a 02                	push   $0x2
    1110:	eb 4c                	jmp    115e <exception>

00001112 <breakpoint_trap>:
    1112:	6a ff                	push   $0xffffffff
    1114:	6a 03                	push   $0x3
    1116:	eb 46                	jmp    115e <exception>

00001118 <overflow_trap>:
    1118:	6a ff                	push   $0xffffffff
    111a:	6a 04                	push   $0x4
    111c:	eb 40                	jmp    115e <exception>

0000111e <bound_range_exceeded_fault>:
    111e:	6a ff                	push   $0xffffffff
    1120:	6a 05                	push   $0x5
    1122:	eb 3a                	jmp    115e <exception>

00001124 <invalid_opcode_fault>:
    1124:	6a ff                	push   $0xffffffff
    1126:	6a 06                	push   $0x6
    1128:	eb 34                	jmp    115e <exception>

0000112a <coprocessor_not_available_fault>:
    112a:	6a ff                	push   $0xffffffff
    112c:	6a 07                	push   $0x7
    112e:	eb 2e                	jmp    115e <exception>

00001130 <double_fault_exception_abort>:
    1130:	6a 08                	push   $0x8
    1132:	eb 2a                	jmp    115e <exception>

00001134 <coprocessor_segment_overrun>:
    1134:	6a ff                	push   $0xffffffff
    1136:	6a 09                	push   $0x9
    1138:	eb 24                	jmp    115e <exception>

0000113a <invalid_task_state_segment_fault>:
    113a:	6a 0a                	push   $0xa
    113c:	eb 20                	jmp    115e <exception>

0000113e <segment_not_present_fault>:
    113e:	6a 0b                	push   $0xb
    1140:	eb 1c                	jmp    115e <exception>

00001142 <stack_exception_fault>:
    1142:	6a 0c                	push   $0xc
    1144:	eb 18                	jmp    115e <exception>

00001146 <general_protection_exception_fault>:
    1146:	6a 0d                	push   $0xd
    1148:	eb 14                	jmp    115e <exception>

0000114a <page_fault>:
    114a:	6a 0e                	push   $0xe
    114c:	eb 10                	jmp    115e <exception>

0000114e <coprocessor_error_fault>:
    114e:	6a ff                	push   $0xffffffff
    1150:	6a 10                	push   $0x10
    1152:	eb 0a                	jmp    115e <exception>

00001154 <align_check_fault>:
    1154:	6a 11                	push   $0x11
    1156:	eb 06                	jmp    115e <exception>

00001158 <simd_float_exception_fault>:
    1158:	6a ff                	push   $0xffffffff
    115a:	6a 12                	push   $0x12
    115c:	eb 00                	jmp    115e <exception>

0000115e <exception>:
    115e:	e8 81 04 00 00       	call   15e4 <exception_handler>
    1163:	83 c4 08             	add    $0x8,%esp
    1166:	f4                   	hlt    

00001167 <hwint0>:
    1167:	60                   	pusha  
    1168:	1e                   	push   %ds
    1169:	06                   	push   %es
    116a:	0f a0                	push   %fs
    116c:	0f a8                	push   %gs
    116e:	66 8c d2             	mov    %ss,%dx
    1171:	8e da                	mov    %edx,%ds
    1173:	8e c2                	mov    %edx,%es
    1175:	8e e2                	mov    %edx,%fs
    1177:	b0 fd                	mov    $0xfd,%al
    1179:	e6 21                	out    %al,$0x21
    117b:	b0 20                	mov    $0x20,%al
    117d:	e6 20                	out    %al,$0x20
    117f:	ff 05 94 9e 00 00    	incl   0x9e94
    1185:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    118c:	75 05                	jne    1193 <hwint0.2>

0000118e <hwint0.1>:
    118e:	bc 80 9e 00 00       	mov    $0x9e80,%esp

00001193 <hwint0.2>:
    1193:	fb                   	sti    
    1194:	e8 4e 3e 00 00       	call   4fe7 <clock_handler>
    1199:	b0 fc                	mov    $0xfc,%al
    119b:	e6 21                	out    %al,$0x21
    119d:	fa                   	cli    
    119e:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    11a5:	0f 85 19 01 00 00    	jne    12c4 <reenter_restore>
    11ab:	e9 00 01 00 00       	jmp    12b0 <restore>

000011b0 <hwint1>:
    11b0:	60                   	pusha  
    11b1:	1e                   	push   %ds
    11b2:	06                   	push   %es
    11b3:	0f a0                	push   %fs
    11b5:	0f a8                	push   %gs
    11b7:	66 8c d2             	mov    %ss,%dx
    11ba:	8e da                	mov    %edx,%ds
    11bc:	8e c2                	mov    %edx,%es
    11be:	8e e2                	mov    %edx,%fs
    11c0:	b0 fe                	mov    $0xfe,%al
    11c2:	e6 21                	out    %al,$0x21
    11c4:	b0 20                	mov    $0x20,%al
    11c6:	e6 20                	out    %al,$0x20
    11c8:	ff 05 94 9e 00 00    	incl   0x9e94
    11ce:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    11d5:	75 05                	jne    11dc <hwint1.2>

000011d7 <hwint1.1>:
    11d7:	bc 80 9e 00 00       	mov    $0x9e80,%esp

000011dc <hwint1.2>:
    11dc:	fb                   	sti    
    11dd:	e8 d4 4b 00 00       	call   5db6 <keyboard_handler>
    11e2:	b0 fc                	mov    $0xfc,%al
    11e4:	e6 21                	out    %al,$0x21
    11e6:	fa                   	cli    
    11e7:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    11ee:	0f 85 d0 00 00 00    	jne    12c4 <reenter_restore>
    11f4:	e9 b7 00 00 00       	jmp    12b0 <restore>

000011f9 <hwint14>:
    11f9:	60                   	pusha  
    11fa:	1e                   	push   %ds
    11fb:	06                   	push   %es
    11fc:	0f a0                	push   %fs
    11fe:	0f a8                	push   %gs
    1200:	66 8c d2             	mov    %ss,%dx
    1203:	8e da                	mov    %edx,%ds
    1205:	8e c2                	mov    %edx,%es
    1207:	8e e2                	mov    %edx,%fs
    1209:	e8 ad 01 00 00       	call   13bb <disable_8259A_slave_winchester_irq>
    120e:	b0 20                	mov    $0x20,%al
    1210:	e6 20                	out    %al,$0x20
    1212:	b0 a0                	mov    $0xa0,%al
    1214:	e6 a0                	out    %al,$0xa0
    1216:	ff 05 94 9e 00 00    	incl   0x9e94
    121c:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    1223:	75 05                	jne    122a <hwint14.2>

00001225 <hwint14.1>:
    1225:	bc 80 9e 00 00       	mov    $0x9e80,%esp

0000122a <hwint14.2>:
    122a:	fb                   	sti    
    122b:	e8 af 19 00 00       	call   2bdf <hd_handle>
    1230:	e8 7b 01 00 00       	call   13b0 <enable_8259A_slave_winchester_irq>
    1235:	fa                   	cli    
    1236:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    123d:	0f 85 81 00 00 00    	jne    12c4 <reenter_restore>
    1243:	eb 6b                	jmp    12b0 <restore>

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
    1257:	ff 05 94 9e 00 00    	incl   0x9e94
    125d:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    1264:	75 05                	jne    126b <sys_call.2>

00001266 <sys_call.1>:
    1266:	bc 80 9e 00 00       	mov    $0x9e80,%esp

0000126b <sys_call.2>:
    126b:	fb                   	sti    
    126c:	56                   	push   %esi
    126d:	ff 35 a0 a2 00 00    	pushl  0xa2a0
    1273:	53                   	push   %ebx
    1274:	51                   	push   %ecx
    1275:	ff 14 85 60 90 00 00 	call   *0x9060(,%eax,4)
    127c:	83 c4 0c             	add    $0xc,%esp
    127f:	5e                   	pop    %esi
    1280:	89 46 2c             	mov    %eax,0x2c(%esi)
    1283:	83 3d 94 9e 00 00 00 	cmpl   $0x0,0x9e94
    128a:	75 38                	jne    12c4 <reenter_restore>
    128c:	eb 22                	jmp    12b0 <restore>

0000128e <restart>:
    128e:	ff 0d 94 9e 00 00    	decl   0x9e94
    1294:	8b 25 a0 a2 00 00    	mov    0xa2a0,%esp
    129a:	0f 00 54 24 44       	lldt   0x44(%esp)
    129f:	8d 44 24 44          	lea    0x44(%esp),%eax
    12a3:	a3 04 cc 00 00       	mov    %eax,0xcc04
    12a8:	0f a9                	pop    %gs
    12aa:	0f a1                	pop    %fs
    12ac:	07                   	pop    %es
    12ad:	1f                   	pop    %ds
    12ae:	61                   	popa   
    12af:	cf                   	iret   

000012b0 <restore>:
    12b0:	8b 25 a0 a2 00 00    	mov    0xa2a0,%esp
    12b6:	0f 00 54 24 44       	lldt   0x44(%esp)
    12bb:	8d 44 24 44          	lea    0x44(%esp),%eax
    12bf:	a3 04 cc 00 00       	mov    %eax,0xcc04

000012c4 <reenter_restore>:
    12c4:	ff 0d 94 9e 00 00    	decl   0x9e94
    12ca:	0f a9                	pop    %gs
    12cc:	0f a1                	pop    %fs
    12ce:	07                   	pop    %es
    12cf:	1f                   	pop    %ds
    12d0:	61                   	popa   
    12d1:	cf                   	iret   

000012d2 <in_byte>:
    12d2:	31 d2                	xor    %edx,%edx
    12d4:	8b 54 24 04          	mov    0x4(%esp),%edx
    12d8:	31 c0                	xor    %eax,%eax
    12da:	ec                   	in     (%dx),%al
    12db:	90                   	nop
    12dc:	90                   	nop
    12dd:	c3                   	ret    

000012de <out_byte>:
    12de:	31 d2                	xor    %edx,%edx
    12e0:	31 c0                	xor    %eax,%eax
    12e2:	8b 54 24 04          	mov    0x4(%esp),%edx
    12e6:	8b 44 24 08          	mov    0x8(%esp),%eax
    12ea:	ee                   	out    %al,(%dx)
    12eb:	90                   	nop
    12ec:	90                   	nop
    12ed:	90                   	nop
    12ee:	90                   	nop
    12ef:	c3                   	ret    

000012f0 <in_byte2>:
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	52                   	push   %edx
    12f4:	31 d2                	xor    %edx,%edx
    12f6:	66 8b 55 08          	mov    0x8(%ebp),%dx
    12fa:	31 c0                	xor    %eax,%eax
    12fc:	ec                   	in     (%dx),%al
    12fd:	90                   	nop
    12fe:	90                   	nop
    12ff:	5b                   	pop    %ebx
    1300:	5d                   	pop    %ebp
    1301:	c3                   	ret    

00001302 <disable_int>:
    1302:	fa                   	cli    
    1303:	c3                   	ret    

00001304 <enable_int>:
    1304:	fb                   	sti    
    1305:	c3                   	ret    

00001306 <check_tss_esp0>:
    1306:	55                   	push   %ebp
    1307:	89 e5                	mov    %esp,%ebp
    1309:	8b 45 08             	mov    0x8(%ebp),%eax
    130c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    130f:	83 c0 44             	add    $0x44,%eax
    1312:	8b 15 04 cc 00 00    	mov    0xcc04,%edx
    1318:	39 d0                	cmp    %edx,%eax
    131a:	74 7c                	je     1398 <check_tss_esp0.2>

0000131c <check_tss_esp0.1>:
    131c:	50                   	push   %eax
    131d:	52                   	push   %edx
    131e:	68 00 90 00 00       	push   $0x9000
    1323:	e8 61 fd ff ff       	call   1089 <disp_str>
    1328:	83 c4 04             	add    $0x4,%esp
    132b:	5a                   	pop    %edx
    132c:	58                   	pop    %eax
    132d:	52                   	push   %edx
    132e:	50                   	push   %eax
    132f:	53                   	push   %ebx
    1330:	e8 86 02 00 00       	call   15bb <disp_int>
    1335:	83 c4 04             	add    $0x4,%esp
    1338:	58                   	pop    %eax
    1339:	5a                   	pop    %edx
    133a:	52                   	push   %edx
    133b:	50                   	push   %eax
    133c:	e8 7a 02 00 00       	call   15bb <disp_int>
    1341:	58                   	pop    %eax
    1342:	5a                   	pop    %edx
    1343:	52                   	push   %edx
    1344:	50                   	push   %eax
    1345:	ff 35 94 9e 00 00    	pushl  0x9e94
    134b:	e8 6b 02 00 00       	call   15bb <disp_int>
    1350:	83 c4 04             	add    $0x4,%esp
    1353:	58                   	pop    %eax
    1354:	5a                   	pop    %edx
    1355:	52                   	push   %edx
    1356:	50                   	push   %eax
    1357:	ff 72 ec             	pushl  -0x14(%edx)
    135a:	e8 5c 02 00 00       	call   15bb <disp_int>
    135f:	83 c4 04             	add    $0x4,%esp
    1362:	58                   	pop    %eax
    1363:	5a                   	pop    %edx
    1364:	52                   	push   %edx
    1365:	50                   	push   %eax
    1366:	ff 70 ec             	pushl  -0x14(%eax)
    1369:	e8 4d 02 00 00       	call   15bb <disp_int>
    136e:	83 c4 04             	add    $0x4,%esp
    1371:	58                   	pop    %eax
    1372:	5a                   	pop    %edx
    1373:	52                   	push   %edx
    1374:	50                   	push   %eax
    1375:	ff 35 a0 a2 00 00    	pushl  0xa2a0
    137b:	e8 3b 02 00 00       	call   15bb <disp_int>
    1380:	83 c4 04             	add    $0x4,%esp
    1383:	58                   	pop    %eax
    1384:	5a                   	pop    %edx
    1385:	52                   	push   %edx
    1386:	50                   	push   %eax
    1387:	68 80 9e 00 00       	push   $0x9e80
    138c:	e8 2a 02 00 00       	call   15bb <disp_int>
    1391:	83 c4 04             	add    $0x4,%esp
    1394:	58                   	pop    %eax
    1395:	5a                   	pop    %edx
    1396:	5d                   	pop    %ebp
    1397:	c3                   	ret    

00001398 <check_tss_esp0.2>:
    1398:	5d                   	pop    %ebp
    1399:	c3                   	ret    

0000139a <enable_8259A_casecade_irq>:
    139a:	66 50                	push   %ax
    139c:	e4 21                	in     $0x21,%al
    139e:	24 fb                	and    $0xfb,%al
    13a0:	e6 21                	out    %al,$0x21
    13a2:	66 58                	pop    %ax
    13a4:	c3                   	ret    

000013a5 <disable_8259A_casecade_irq>:
    13a5:	66 50                	push   %ax
    13a7:	e4 21                	in     $0x21,%al
    13a9:	0c 04                	or     $0x4,%al
    13ab:	e6 21                	out    %al,$0x21
    13ad:	66 58                	pop    %ax
    13af:	c3                   	ret    

000013b0 <enable_8259A_slave_winchester_irq>:
    13b0:	66 50                	push   %ax
    13b2:	e4 a1                	in     $0xa1,%al
    13b4:	0c bf                	or     $0xbf,%al
    13b6:	e6 a1                	out    %al,$0xa1
    13b8:	66 58                	pop    %ax
    13ba:	c3                   	ret    

000013bb <disable_8259A_slave_winchester_irq>:
    13bb:	66 50                	push   %ax
    13bd:	e4 a1                	in     $0xa1,%al
    13bf:	0c 40                	or     $0x40,%al
    13c1:	e6 a1                	out    %al,$0xa1
    13c3:	66 58                	pop    %ax
    13c5:	c3                   	ret    

000013c6 <untar>:
    13c6:	55                   	push   %ebp
    13c7:	89 e5                	mov    %esp,%ebp
    13c9:	81 ec 38 20 00 00    	sub    $0x2038,%esp
    13cf:	83 ec 08             	sub    $0x8,%esp
    13d2:	6a 00                	push   $0x0
    13d4:	ff 75 08             	pushl  0x8(%ebp)
    13d7:	e8 d7 4d 00 00       	call   61b3 <open>
    13dc:	83 c4 10             	add    $0x10,%esp
    13df:	89 45 e8             	mov    %eax,-0x18(%ebp)
    13e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    13e9:	c7 45 e0 00 20 00 00 	movl   $0x2000,-0x20(%ebp)
    13f0:	83 ec 04             	sub    $0x4,%esp
    13f3:	68 00 02 00 00       	push   $0x200
    13f8:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    13fe:	50                   	push   %eax
    13ff:	ff 75 e8             	pushl  -0x18(%ebp)
    1402:	e8 0f 4e 00 00       	call   6216 <read>
    1407:	83 c4 10             	add    $0x10,%esp
    140a:	83 ec 0c             	sub    $0xc,%esp
    140d:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    1413:	50                   	push   %eax
    1414:	e8 d5 56 00 00       	call   6aee <Strlen>
    1419:	83 c4 10             	add    $0x10,%esp
    141c:	85 c0                	test   %eax,%eax
    141e:	0f 84 df 00 00 00    	je     1503 <untar+0x13d>
    1424:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    142a:	89 45 dc             	mov    %eax,-0x24(%ebp)
    142d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1430:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1433:	83 ec 08             	sub    $0x8,%esp
    1436:	6a 01                	push   $0x1
    1438:	ff 75 d8             	pushl  -0x28(%ebp)
    143b:	e8 73 4d 00 00       	call   61b3 <open>
    1440:	83 c4 10             	add    $0x10,%esp
    1443:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1446:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    144d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1450:	83 c0 7c             	add    $0x7c,%eax
    1453:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1456:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1459:	89 45 f0             	mov    %eax,-0x10(%ebp)
    145c:	eb 1f                	jmp    147d <untar+0xb7>
    145e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1461:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1468:	8b 45 f0             	mov    -0x10(%ebp),%eax
    146b:	0f b6 00             	movzbl (%eax),%eax
    146e:	0f be c0             	movsbl %al,%eax
    1471:	83 e8 30             	sub    $0x30,%eax
    1474:	01 d0                	add    %edx,%eax
    1476:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1479:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    147d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1480:	0f b6 00             	movzbl (%eax),%eax
    1483:	84 c0                	test   %al,%al
    1485:	75 d7                	jne    145e <untar+0x98>
    1487:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    148d:	eb 5b                	jmp    14ea <untar+0x124>
    148f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1492:	39 45 e0             	cmp    %eax,-0x20(%ebp)
    1495:	0f 4e 45 e0          	cmovle -0x20(%ebp),%eax
    1499:	89 45 cc             	mov    %eax,-0x34(%ebp)
    149c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    149f:	83 e8 01             	sub    $0x1,%eax
    14a2:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    14a8:	85 c0                	test   %eax,%eax
    14aa:	0f 48 c2             	cmovs  %edx,%eax
    14ad:	c1 f8 09             	sar    $0x9,%eax
    14b0:	83 c0 01             	add    $0x1,%eax
    14b3:	c1 e0 09             	shl    $0x9,%eax
    14b6:	83 ec 04             	sub    $0x4,%esp
    14b9:	50                   	push   %eax
    14ba:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    14c0:	50                   	push   %eax
    14c1:	ff 75 e8             	pushl  -0x18(%ebp)
    14c4:	e8 4d 4d 00 00       	call   6216 <read>
    14c9:	83 c4 10             	add    $0x10,%esp
    14cc:	83 ec 04             	sub    $0x4,%esp
    14cf:	ff 75 cc             	pushl  -0x34(%ebp)
    14d2:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
    14d8:	50                   	push   %eax
    14d9:	ff 75 d4             	pushl  -0x2c(%ebp)
    14dc:	e8 6c 4d 00 00       	call   624d <write>
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    14e7:	29 45 ec             	sub    %eax,-0x14(%ebp)
    14ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14ee:	75 9f                	jne    148f <untar+0xc9>
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	ff 75 d4             	pushl  -0x2c(%ebp)
    14f6:	e8 89 4d 00 00       	call   6284 <close>
    14fb:	83 c4 10             	add    $0x10,%esp
    14fe:	e9 ed fe ff ff       	jmp    13f0 <untar+0x2a>
    1503:	90                   	nop
    1504:	83 ec 0c             	sub    $0xc,%esp
    1507:	ff 75 e8             	pushl  -0x18(%ebp)
    150a:	e8 75 4d 00 00       	call   6284 <close>
    150f:	83 c4 10             	add    $0x10,%esp
    1512:	90                   	nop
    1513:	c9                   	leave  
    1514:	c3                   	ret    

00001515 <atoi>:
    1515:	55                   	push   %ebp
    1516:	89 e5                	mov    %esp,%ebp
    1518:	83 ec 10             	sub    $0x10,%esp
    151b:	8b 45 08             	mov    0x8(%ebp),%eax
    151e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1521:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1524:	8d 50 01             	lea    0x1(%eax),%edx
    1527:	89 55 fc             	mov    %edx,-0x4(%ebp)
    152a:	c6 00 30             	movb   $0x30,(%eax)
    152d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1530:	8d 50 01             	lea    0x1(%eax),%edx
    1533:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1536:	c6 00 78             	movb   $0x78,(%eax)
    1539:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
    153d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1541:	75 0e                	jne    1551 <atoi+0x3c>
    1543:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1546:	8d 50 01             	lea    0x1(%eax),%edx
    1549:	89 55 fc             	mov    %edx,-0x4(%ebp)
    154c:	c6 00 30             	movb   $0x30,(%eax)
    154f:	eb 61                	jmp    15b2 <atoi+0x9d>
    1551:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
    1558:	eb 52                	jmp    15ac <atoi+0x97>
    155a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    155d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1560:	89 c1                	mov    %eax,%ecx
    1562:	d3 fa                	sar    %cl,%edx
    1564:	89 d0                	mov    %edx,%eax
    1566:	83 e0 0f             	and    $0xf,%eax
    1569:	88 45 fb             	mov    %al,-0x5(%ebp)
    156c:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
    1570:	75 06                	jne    1578 <atoi+0x63>
    1572:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
    1576:	74 2f                	je     15a7 <atoi+0x92>
    1578:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
    157c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1580:	83 c0 30             	add    $0x30,%eax
    1583:	88 45 fb             	mov    %al,-0x5(%ebp)
    1586:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
    158a:	7e 0a                	jle    1596 <atoi+0x81>
    158c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
    1590:	83 c0 07             	add    $0x7,%eax
    1593:	88 45 fb             	mov    %al,-0x5(%ebp)
    1596:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1599:	8d 50 01             	lea    0x1(%eax),%edx
    159c:	89 55 fc             	mov    %edx,-0x4(%ebp)
    159f:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
    15a3:	88 10                	mov    %dl,(%eax)
    15a5:	eb 01                	jmp    15a8 <atoi+0x93>
    15a7:	90                   	nop
    15a8:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
    15ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15b0:	79 a8                	jns    155a <atoi+0x45>
    15b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15b5:	c6 00 00             	movb   $0x0,(%eax)
    15b8:	90                   	nop
    15b9:	c9                   	leave  
    15ba:	c3                   	ret    

000015bb <disp_int>:
    15bb:	55                   	push   %ebp
    15bc:	89 e5                	mov    %esp,%ebp
    15be:	83 ec 18             	sub    $0x18,%esp
    15c1:	ff 75 08             	pushl  0x8(%ebp)
    15c4:	8d 45 e8             	lea    -0x18(%ebp),%eax
    15c7:	50                   	push   %eax
    15c8:	e8 48 ff ff ff       	call   1515 <atoi>
    15cd:	83 c4 08             	add    $0x8,%esp
    15d0:	83 ec 08             	sub    $0x8,%esp
    15d3:	6a 0b                	push   $0xb
    15d5:	8d 45 e8             	lea    -0x18(%ebp),%eax
    15d8:	50                   	push   %eax
    15d9:	e8 e6 fa ff ff       	call   10c4 <disp_str_colour>
    15de:	83 c4 10             	add    $0x10,%esp
    15e1:	90                   	nop
    15e2:	c9                   	leave  
    15e3:	c3                   	ret    

000015e4 <exception_handler>:
    15e4:	55                   	push   %ebp
    15e5:	89 e5                	mov    %esp,%ebp
    15e7:	57                   	push   %edi
    15e8:	56                   	push   %esi
    15e9:	53                   	push   %ebx
    15ea:	83 ec 6c             	sub    $0x6c,%esp
    15ed:	8d 45 90             	lea    -0x70(%ebp),%eax
    15f0:	bb 00 65 00 00       	mov    $0x6500,%ebx
    15f5:	ba 13 00 00 00       	mov    $0x13,%edx
    15fa:	89 c7                	mov    %eax,%edi
    15fc:	89 de                	mov    %ebx,%esi
    15fe:	89 d1                	mov    %edx,%ecx
    1600:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    1602:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1609:	00 00 00 
    160c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1613:	eb 14                	jmp    1629 <exception_handler+0x45>
    1615:	83 ec 0c             	sub    $0xc,%esp
    1618:	68 e0 62 00 00       	push   $0x62e0
    161d:	e8 67 fa ff ff       	call   1089 <disp_str>
    1622:	83 c4 10             	add    $0x10,%esp
    1625:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1629:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
    1630:	7e e3                	jle    1615 <exception_handler+0x31>
    1632:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1639:	00 00 00 
    163c:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
    1643:	8b 45 08             	mov    0x8(%ebp),%eax
    1646:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
    164a:	89 45 dc             	mov    %eax,-0x24(%ebp)
    164d:	83 ec 08             	sub    $0x8,%esp
    1650:	ff 75 e0             	pushl  -0x20(%ebp)
    1653:	ff 75 dc             	pushl  -0x24(%ebp)
    1656:	e8 69 fa ff ff       	call   10c4 <disp_str_colour>
    165b:	83 c4 10             	add    $0x10,%esp
    165e:	83 ec 0c             	sub    $0xc,%esp
    1661:	68 e2 62 00 00       	push   $0x62e2
    1666:	e8 1e fa ff ff       	call   1089 <disp_str>
    166b:	83 c4 10             	add    $0x10,%esp
    166e:	83 ec 08             	sub    $0x8,%esp
    1671:	ff 75 e0             	pushl  -0x20(%ebp)
    1674:	68 e5 62 00 00       	push   $0x62e5
    1679:	e8 46 fa ff ff       	call   10c4 <disp_str_colour>
    167e:	83 c4 10             	add    $0x10,%esp
    1681:	83 ec 0c             	sub    $0xc,%esp
    1684:	ff 75 08             	pushl  0x8(%ebp)
    1687:	e8 2f ff ff ff       	call   15bb <disp_int>
    168c:	83 c4 10             	add    $0x10,%esp
    168f:	83 ec 0c             	sub    $0xc,%esp
    1692:	68 e2 62 00 00       	push   $0x62e2
    1697:	e8 ed f9 ff ff       	call   1089 <disp_str>
    169c:	83 c4 10             	add    $0x10,%esp
    169f:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
    16a3:	74 31                	je     16d6 <exception_handler+0xf2>
    16a5:	83 ec 08             	sub    $0x8,%esp
    16a8:	ff 75 e0             	pushl  -0x20(%ebp)
    16ab:	68 ed 62 00 00       	push   $0x62ed
    16b0:	e8 0f fa ff ff       	call   10c4 <disp_str_colour>
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	83 ec 0c             	sub    $0xc,%esp
    16bb:	ff 75 0c             	pushl  0xc(%ebp)
    16be:	e8 f8 fe ff ff       	call   15bb <disp_int>
    16c3:	83 c4 10             	add    $0x10,%esp
    16c6:	83 ec 0c             	sub    $0xc,%esp
    16c9:	68 e2 62 00 00       	push   $0x62e2
    16ce:	e8 b6 f9 ff ff       	call   1089 <disp_str>
    16d3:	83 c4 10             	add    $0x10,%esp
    16d6:	83 ec 08             	sub    $0x8,%esp
    16d9:	ff 75 e0             	pushl  -0x20(%ebp)
    16dc:	68 f7 62 00 00       	push   $0x62f7
    16e1:	e8 de f9 ff ff       	call   10c4 <disp_str_colour>
    16e6:	83 c4 10             	add    $0x10,%esp
    16e9:	83 ec 0c             	sub    $0xc,%esp
    16ec:	ff 75 14             	pushl  0x14(%ebp)
    16ef:	e8 c7 fe ff ff       	call   15bb <disp_int>
    16f4:	83 c4 10             	add    $0x10,%esp
    16f7:	83 ec 0c             	sub    $0xc,%esp
    16fa:	68 e2 62 00 00       	push   $0x62e2
    16ff:	e8 85 f9 ff ff       	call   1089 <disp_str>
    1704:	83 c4 10             	add    $0x10,%esp
    1707:	83 ec 08             	sub    $0x8,%esp
    170a:	ff 75 e0             	pushl  -0x20(%ebp)
    170d:	68 fb 62 00 00       	push   $0x62fb
    1712:	e8 ad f9 ff ff       	call   10c4 <disp_str_colour>
    1717:	83 c4 10             	add    $0x10,%esp
    171a:	83 ec 0c             	sub    $0xc,%esp
    171d:	ff 75 10             	pushl  0x10(%ebp)
    1720:	e8 96 fe ff ff       	call   15bb <disp_int>
    1725:	83 c4 10             	add    $0x10,%esp
    1728:	83 ec 0c             	sub    $0xc,%esp
    172b:	68 e2 62 00 00       	push   $0x62e2
    1730:	e8 54 f9 ff ff       	call   1089 <disp_str>
    1735:	83 c4 10             	add    $0x10,%esp
    1738:	83 ec 08             	sub    $0x8,%esp
    173b:	ff 75 e0             	pushl  -0x20(%ebp)
    173e:	68 00 63 00 00       	push   $0x6300
    1743:	e8 7c f9 ff ff       	call   10c4 <disp_str_colour>
    1748:	83 c4 10             	add    $0x10,%esp
    174b:	83 ec 0c             	sub    $0xc,%esp
    174e:	ff 75 18             	pushl  0x18(%ebp)
    1751:	e8 65 fe ff ff       	call   15bb <disp_int>
    1756:	83 c4 10             	add    $0x10,%esp
    1759:	83 ec 0c             	sub    $0xc,%esp
    175c:	68 e2 62 00 00       	push   $0x62e2
    1761:	e8 23 f9 ff ff       	call   1089 <disp_str>
    1766:	83 c4 10             	add    $0x10,%esp
    1769:	90                   	nop
    176a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    176d:	5b                   	pop    %ebx
    176e:	5e                   	pop    %esi
    176f:	5f                   	pop    %edi
    1770:	5d                   	pop    %ebp
    1771:	c3                   	ret    

00001772 <init_internal_interrupt>:
    1772:	55                   	push   %ebp
    1773:	89 e5                	mov    %esp,%ebp
    1775:	83 ec 08             	sub    $0x8,%esp
    1778:	6a 0e                	push   $0xe
    177a:	6a 08                	push   $0x8
    177c:	68 00 11 00 00       	push   $0x1100
    1781:	6a 00                	push   $0x0
    1783:	e8 9d 3b 00 00       	call   5325 <InitInterruptDesc>
    1788:	83 c4 10             	add    $0x10,%esp
    178b:	6a 0e                	push   $0xe
    178d:	6a 08                	push   $0x8
    178f:	68 06 11 00 00       	push   $0x1106
    1794:	6a 01                	push   $0x1
    1796:	e8 8a 3b 00 00       	call   5325 <InitInterruptDesc>
    179b:	83 c4 10             	add    $0x10,%esp
    179e:	6a 0e                	push   $0xe
    17a0:	6a 08                	push   $0x8
    17a2:	68 0c 11 00 00       	push   $0x110c
    17a7:	6a 02                	push   $0x2
    17a9:	e8 77 3b 00 00       	call   5325 <InitInterruptDesc>
    17ae:	83 c4 10             	add    $0x10,%esp
    17b1:	6a 0e                	push   $0xe
    17b3:	6a 08                	push   $0x8
    17b5:	68 12 11 00 00       	push   $0x1112
    17ba:	6a 03                	push   $0x3
    17bc:	e8 64 3b 00 00       	call   5325 <InitInterruptDesc>
    17c1:	83 c4 10             	add    $0x10,%esp
    17c4:	6a 0e                	push   $0xe
    17c6:	6a 08                	push   $0x8
    17c8:	68 18 11 00 00       	push   $0x1118
    17cd:	6a 04                	push   $0x4
    17cf:	e8 51 3b 00 00       	call   5325 <InitInterruptDesc>
    17d4:	83 c4 10             	add    $0x10,%esp
    17d7:	6a 0e                	push   $0xe
    17d9:	6a 08                	push   $0x8
    17db:	68 1e 11 00 00       	push   $0x111e
    17e0:	6a 05                	push   $0x5
    17e2:	e8 3e 3b 00 00       	call   5325 <InitInterruptDesc>
    17e7:	83 c4 10             	add    $0x10,%esp
    17ea:	6a 0e                	push   $0xe
    17ec:	6a 08                	push   $0x8
    17ee:	68 24 11 00 00       	push   $0x1124
    17f3:	6a 06                	push   $0x6
    17f5:	e8 2b 3b 00 00       	call   5325 <InitInterruptDesc>
    17fa:	83 c4 10             	add    $0x10,%esp
    17fd:	6a 0e                	push   $0xe
    17ff:	6a 08                	push   $0x8
    1801:	68 2a 11 00 00       	push   $0x112a
    1806:	6a 07                	push   $0x7
    1808:	e8 18 3b 00 00       	call   5325 <InitInterruptDesc>
    180d:	83 c4 10             	add    $0x10,%esp
    1810:	6a 0e                	push   $0xe
    1812:	6a 08                	push   $0x8
    1814:	68 30 11 00 00       	push   $0x1130
    1819:	6a 08                	push   $0x8
    181b:	e8 05 3b 00 00       	call   5325 <InitInterruptDesc>
    1820:	83 c4 10             	add    $0x10,%esp
    1823:	6a 0e                	push   $0xe
    1825:	6a 08                	push   $0x8
    1827:	68 34 11 00 00       	push   $0x1134
    182c:	6a 09                	push   $0x9
    182e:	e8 f2 3a 00 00       	call   5325 <InitInterruptDesc>
    1833:	83 c4 10             	add    $0x10,%esp
    1836:	6a 0e                	push   $0xe
    1838:	6a 08                	push   $0x8
    183a:	68 3a 11 00 00       	push   $0x113a
    183f:	6a 0a                	push   $0xa
    1841:	e8 df 3a 00 00       	call   5325 <InitInterruptDesc>
    1846:	83 c4 10             	add    $0x10,%esp
    1849:	6a 0e                	push   $0xe
    184b:	6a 08                	push   $0x8
    184d:	68 3e 11 00 00       	push   $0x113e
    1852:	6a 0b                	push   $0xb
    1854:	e8 cc 3a 00 00       	call   5325 <InitInterruptDesc>
    1859:	83 c4 10             	add    $0x10,%esp
    185c:	6a 0e                	push   $0xe
    185e:	6a 08                	push   $0x8
    1860:	68 42 11 00 00       	push   $0x1142
    1865:	6a 0c                	push   $0xc
    1867:	e8 b9 3a 00 00       	call   5325 <InitInterruptDesc>
    186c:	83 c4 10             	add    $0x10,%esp
    186f:	6a 0e                	push   $0xe
    1871:	6a 08                	push   $0x8
    1873:	68 46 11 00 00       	push   $0x1146
    1878:	6a 0d                	push   $0xd
    187a:	e8 a6 3a 00 00       	call   5325 <InitInterruptDesc>
    187f:	83 c4 10             	add    $0x10,%esp
    1882:	6a 0e                	push   $0xe
    1884:	6a 08                	push   $0x8
    1886:	68 4a 11 00 00       	push   $0x114a
    188b:	6a 0e                	push   $0xe
    188d:	e8 93 3a 00 00       	call   5325 <InitInterruptDesc>
    1892:	83 c4 10             	add    $0x10,%esp
    1895:	6a 0e                	push   $0xe
    1897:	6a 08                	push   $0x8
    1899:	68 4e 11 00 00       	push   $0x114e
    189e:	6a 10                	push   $0x10
    18a0:	e8 80 3a 00 00       	call   5325 <InitInterruptDesc>
    18a5:	83 c4 10             	add    $0x10,%esp
    18a8:	6a 0e                	push   $0xe
    18aa:	6a 08                	push   $0x8
    18ac:	68 54 11 00 00       	push   $0x1154
    18b1:	6a 11                	push   $0x11
    18b3:	e8 6d 3a 00 00       	call   5325 <InitInterruptDesc>
    18b8:	83 c4 10             	add    $0x10,%esp
    18bb:	6a 0e                	push   $0xe
    18bd:	6a 08                	push   $0x8
    18bf:	68 58 11 00 00       	push   $0x1158
    18c4:	6a 12                	push   $0x12
    18c6:	e8 5a 3a 00 00       	call   5325 <InitInterruptDesc>
    18cb:	83 c4 10             	add    $0x10,%esp
    18ce:	6a 0e                	push   $0xe
    18d0:	6a 0e                	push   $0xe
    18d2:	68 45 12 00 00       	push   $0x1245
    18d7:	68 90 00 00 00       	push   $0x90
    18dc:	e8 44 3a 00 00       	call   5325 <InitInterruptDesc>
    18e1:	83 c4 10             	add    $0x10,%esp
    18e4:	90                   	nop
    18e5:	c9                   	leave  
    18e6:	c3                   	ret    

000018e7 <test>:
    18e7:	55                   	push   %ebp
    18e8:	89 e5                	mov    %esp,%ebp
    18ea:	83 ec 18             	sub    $0x18,%esp
    18ed:	83 ec 0c             	sub    $0xc,%esp
    18f0:	68 4c 65 00 00       	push   $0x654c
    18f5:	e8 8f f7 ff ff       	call   1089 <disp_str>
    18fa:	83 c4 10             	add    $0x10,%esp
    18fd:	83 ec 0c             	sub    $0xc,%esp
    1900:	6a 06                	push   $0x6
    1902:	e8 b4 fc ff ff       	call   15bb <disp_int>
    1907:	83 c4 10             	add    $0x10,%esp
    190a:	83 ec 0c             	sub    $0xc,%esp
    190d:	68 4e 65 00 00       	push   $0x654e
    1912:	e8 72 f7 ff ff       	call   1089 <disp_str>
    1917:	83 c4 10             	add    $0x10,%esp
    191a:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1921:	00 00 00 
    1924:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    192b:	eb 14                	jmp    1941 <test+0x5a>
    192d:	83 ec 0c             	sub    $0xc,%esp
    1930:	68 e0 62 00 00       	push   $0x62e0
    1935:	e8 4f f7 ff ff       	call   1089 <disp_str>
    193a:	83 c4 10             	add    $0x10,%esp
    193d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1941:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    1948:	7e e3                	jle    192d <test+0x46>
    194a:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1951:	00 00 00 
    1954:	83 ec 08             	sub    $0x8,%esp
    1957:	6a 0f                	push   $0xf
    1959:	68 50 65 00 00       	push   $0x6550
    195e:	e8 61 f7 ff ff       	call   10c4 <disp_str_colour>
    1963:	83 c4 10             	add    $0x10,%esp
    1966:	83 ec 0c             	sub    $0xc,%esp
    1969:	68 4e 65 00 00       	push   $0x654e
    196e:	e8 16 f7 ff ff       	call   1089 <disp_str>
    1973:	83 c4 10             	add    $0x10,%esp
    1976:	83 ec 0c             	sub    $0xc,%esp
    1979:	68 89 00 00 00       	push   $0x89
    197e:	e8 38 fc ff ff       	call   15bb <disp_int>
    1983:	83 c4 10             	add    $0x10,%esp
    1986:	83 ec 0c             	sub    $0xc,%esp
    1989:	68 4e 65 00 00       	push   $0x654e
    198e:	e8 f6 f6 ff ff       	call   1089 <disp_str>
    1993:	83 c4 10             	add    $0x10,%esp
    1996:	83 ec 08             	sub    $0x8,%esp
    1999:	6a 0f                	push   $0xf
    199b:	68 50 65 00 00       	push   $0x6550
    19a0:	e8 1f f7 ff ff       	call   10c4 <disp_str_colour>
    19a5:	83 c4 10             	add    $0x10,%esp
    19a8:	83 ec 08             	sub    $0x8,%esp
    19ab:	6a 74                	push   $0x74
    19ad:	68 50 65 00 00       	push   $0x6550
    19b2:	e8 0d f7 ff ff       	call   10c4 <disp_str_colour>
    19b7:	83 c4 10             	add    $0x10,%esp
    19ba:	83 ec 0c             	sub    $0xc,%esp
    19bd:	68 4e 65 00 00       	push   $0x654e
    19c2:	e8 c2 f6 ff ff       	call   1089 <disp_str>
    19c7:	83 c4 10             	add    $0x10,%esp
    19ca:	83 ec 08             	sub    $0x8,%esp
    19cd:	6a 0f                	push   $0xf
    19cf:	68 60 65 00 00       	push   $0x6560
    19d4:	e8 eb f6 ff ff       	call   10c4 <disp_str_colour>
    19d9:	83 c4 10             	add    $0x10,%esp
    19dc:	83 ec 0c             	sub    $0xc,%esp
    19df:	68 89 65 00 00       	push   $0x6589
    19e4:	e8 a0 f6 ff ff       	call   1089 <disp_str>
    19e9:	83 c4 10             	add    $0x10,%esp
    19ec:	83 ec 0c             	sub    $0xc,%esp
    19ef:	68 9d 65 00 00       	push   $0x659d
    19f4:	e8 90 f6 ff ff       	call   1089 <disp_str>
    19f9:	83 c4 10             	add    $0x10,%esp
    19fc:	83 ec 0c             	sub    $0xc,%esp
    19ff:	6a 17                	push   $0x17
    1a01:	e8 b5 fb ff ff       	call   15bb <disp_int>
    1a06:	83 c4 10             	add    $0x10,%esp
    1a09:	83 ec 0c             	sub    $0xc,%esp
    1a0c:	68 4e 65 00 00       	push   $0x654e
    1a11:	e8 73 f6 ff ff       	call   1089 <disp_str>
    1a16:	83 c4 10             	add    $0x10,%esp
    1a19:	83 ec 0c             	sub    $0xc,%esp
    1a1c:	68 0a 02 00 00       	push   $0x20a
    1a21:	e8 95 fb ff ff       	call   15bb <disp_int>
    1a26:	83 c4 10             	add    $0x10,%esp
    1a29:	83 ec 0c             	sub    $0xc,%esp
    1a2c:	68 4e 65 00 00       	push   $0x654e
    1a31:	e8 53 f6 ff ff       	call   1089 <disp_str>
    1a36:	83 c4 10             	add    $0x10,%esp
    1a39:	90                   	nop
    1a3a:	c9                   	leave  
    1a3b:	c3                   	ret    

00001a3c <disp_str_colour3>:
    1a3c:	55                   	push   %ebp
    1a3d:	89 e5                	mov    %esp,%ebp
    1a3f:	90                   	nop
    1a40:	5d                   	pop    %ebp
    1a41:	c3                   	ret    

00001a42 <spurious_irq>:
    1a42:	55                   	push   %ebp
    1a43:	89 e5                	mov    %esp,%ebp
    1a45:	83 ec 08             	sub    $0x8,%esp
    1a48:	83 ec 08             	sub    $0x8,%esp
    1a4b:	6a 0b                	push   $0xb
    1a4d:	68 ac 65 00 00       	push   $0x65ac
    1a52:	e8 6d f6 ff ff       	call   10c4 <disp_str_colour>
    1a57:	83 c4 10             	add    $0x10,%esp
    1a5a:	83 ec 0c             	sub    $0xc,%esp
    1a5d:	ff 75 08             	pushl  0x8(%ebp)
    1a60:	e8 56 fb ff ff       	call   15bb <disp_int>
    1a65:	83 c4 10             	add    $0x10,%esp
    1a68:	a1 80 d4 00 00       	mov    0xd480,%eax
    1a6d:	83 c0 01             	add    $0x1,%eax
    1a70:	a3 80 d4 00 00       	mov    %eax,0xd480
    1a75:	83 ec 0c             	sub    $0xc,%esp
    1a78:	68 d3 65 00 00       	push   $0x65d3
    1a7d:	e8 07 f6 ff ff       	call   1089 <disp_str>
    1a82:	83 c4 10             	add    $0x10,%esp
    1a85:	a1 80 d4 00 00       	mov    0xd480,%eax
    1a8a:	83 ec 0c             	sub    $0xc,%esp
    1a8d:	50                   	push   %eax
    1a8e:	e8 28 fb ff ff       	call   15bb <disp_int>
    1a93:	83 c4 10             	add    $0x10,%esp
    1a96:	83 ec 0c             	sub    $0xc,%esp
    1a99:	68 d5 65 00 00       	push   $0x65d5
    1a9e:	e8 e6 f5 ff ff       	call   1089 <disp_str>
    1aa3:	83 c4 10             	add    $0x10,%esp
    1aa6:	83 ec 08             	sub    $0x8,%esp
    1aa9:	6a 0c                	push   $0xc
    1aab:	68 d8 65 00 00       	push   $0x65d8
    1ab0:	e8 0f f6 ff ff       	call   10c4 <disp_str_colour>
    1ab5:	83 c4 10             	add    $0x10,%esp
    1ab8:	90                   	nop
    1ab9:	c9                   	leave  
    1aba:	c3                   	ret    

00001abb <kernel_main>:
    1abb:	55                   	push   %ebp
    1abc:	89 e5                	mov    %esp,%ebp
    1abe:	83 ec 28             	sub    $0x28,%esp
    1ac1:	c7 05 80 d4 00 00 00 	movl   $0x0,0xd480
    1ac8:	00 00 00 
    1acb:	c7 05 70 cc 00 00 00 	movl   $0x0,0xcc70
    1ad2:	00 00 00 
    1ad5:	c7 05 94 9e 00 00 00 	movl   $0x0,0x9e94
    1adc:	00 00 00 
    1adf:	c7 45 e8 20 4f 01 00 	movl   $0x14f20,-0x18(%ebp)
    1ae6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1aed:	e9 90 01 00 00       	jmp    1c82 <kernel_main+0x1c7>
    1af2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1af5:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
    1afb:	05 20 4f 01 00       	add    $0x14f20,%eax
    1b00:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1b03:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
    1b07:	7f 3f                	jg     1b48 <kernel_main+0x8d>
    1b09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b0c:	c1 e0 03             	shl    $0x3,%eax
    1b0f:	05 40 90 00 00       	add    $0x9040,%eax
    1b14:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b17:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
    1b1e:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    1b22:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
    1b26:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b29:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
    1b30:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b33:	8b 50 60             	mov    0x60(%eax),%edx
    1b36:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b39:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b3f:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
    1b46:	eb 46                	jmp    1b8e <kernel_main+0xd3>
    1b48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b4b:	05 fc ff ff 1f       	add    $0x1ffffffc,%eax
    1b50:	c1 e0 03             	shl    $0x3,%eax
    1b53:	05 20 90 00 00       	add    $0x9020,%eax
    1b58:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b5b:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
    1b62:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
    1b66:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
    1b6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b6d:	c7 40 60 0a 00 00 00 	movl   $0xa,0x60(%eax)
    1b74:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b77:	8b 50 60             	mov    0x60(%eax),%edx
    1b7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b7d:	89 50 5c             	mov    %edx,0x5c(%eax)
    1b80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b83:	83 e8 04             	sub    $0x4,%eax
    1b86:	89 c2                	mov    %eax,%edx
    1b88:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b8b:	89 50 64             	mov    %edx,0x64(%eax)
    1b8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b91:	83 c0 09             	add    $0x9,%eax
    1b94:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1b9b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b9e:	66 89 50 44          	mov    %dx,0x44(%eax)
    1ba2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1ba5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ba8:	89 50 58             	mov    %edx,0x58(%eax)
    1bab:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bae:	83 c0 46             	add    $0x46,%eax
    1bb1:	83 ec 04             	sub    $0x4,%esp
    1bb4:	6a 08                	push   $0x8
    1bb6:	68 a8 9e 00 00       	push   $0x9ea8
    1bbb:	50                   	push   %eax
    1bbc:	e8 c6 4e 00 00       	call   6a87 <Memcpy>
    1bc1:	83 c4 10             	add    $0x10,%esp
    1bc4:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1bc8:	c1 e0 05             	shl    $0x5,%eax
    1bcb:	83 c8 9a             	or     $0xffffff9a,%eax
    1bce:	89 c2                	mov    %eax,%edx
    1bd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bd3:	88 50 4b             	mov    %dl,0x4b(%eax)
    1bd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bd9:	83 c0 4e             	add    $0x4e,%eax
    1bdc:	83 ec 04             	sub    $0x4,%esp
    1bdf:	6a 08                	push   $0x8
    1be1:	68 d0 9e 00 00       	push   $0x9ed0
    1be6:	50                   	push   %eax
    1be7:	e8 9b 4e 00 00       	call   6a87 <Memcpy>
    1bec:	83 c4 10             	add    $0x10,%esp
    1bef:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1bf3:	c1 e0 05             	shl    $0x5,%eax
    1bf6:	83 c8 92             	or     $0xffffff92,%eax
    1bf9:	89 c2                	mov    %eax,%edx
    1bfb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1bfe:	88 50 53             	mov    %dl,0x53(%eax)
    1c01:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c05:	83 c8 04             	or     $0x4,%eax
    1c08:	0f b6 c0             	movzbl %al,%eax
    1c0b:	66 89 45 da          	mov    %ax,-0x26(%ebp)
    1c0f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1c13:	83 c8 0c             	or     $0xc,%eax
    1c16:	0f b6 c0             	movzbl %al,%eax
    1c19:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
    1c1d:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
    1c21:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c24:	89 50 34             	mov    %edx,0x34(%eax)
    1c27:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c2b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c2e:	89 50 0c             	mov    %edx,0xc(%eax)
    1c31:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c35:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c38:	89 50 04             	mov    %edx,0x4(%eax)
    1c3b:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c3f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c42:	89 50 08             	mov    %edx,0x8(%eax)
    1c45:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
    1c49:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c4c:	89 50 40             	mov    %edx,0x40(%eax)
    1c4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c52:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
    1c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c5b:	8b 00                	mov    (%eax),%eax
    1c5d:	89 c2                	mov    %eax,%edx
    1c5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c62:	89 50 30             	mov    %edx,0x30(%eax)
    1c65:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1c68:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c6b:	89 50 3c             	mov    %edx,0x3c(%eax)
    1c6e:	81 6d e8 00 04 00 00 	subl   $0x400,-0x18(%ebp)
    1c75:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1c78:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c7b:	89 50 38             	mov    %edx,0x38(%eax)
    1c7e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1c82:	83 7d e4 06          	cmpl   $0x6,-0x1c(%ebp)
    1c86:	0f 8e 66 fe ff ff    	jle    1af2 <kernel_main+0x37>
    1c8c:	c7 05 a0 a2 00 00 20 	movl   $0x14f20,0xa2a0
    1c93:	4f 01 00 
    1c96:	83 ec 04             	sub    $0x4,%esp
    1c99:	68 20 03 00 00       	push   $0x320
    1c9e:	6a 00                	push   $0x0
    1ca0:	68 cc a2 00 00       	push   $0xa2cc
    1ca5:	e8 0b 4e 00 00       	call   6ab5 <Memset>
    1caa:	83 c4 10             	add    $0x10,%esp
    1cad:	c7 05 c0 a2 00 00 cc 	movl   $0xa2cc,0xa2c0
    1cb4:	a2 00 00 
    1cb7:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    1cbc:	a3 c4 a2 00 00       	mov    %eax,0xa2c4
    1cc1:	c7 05 c8 a2 00 00 00 	movl   $0x0,0xa2c8
    1cc8:	00 00 00 
    1ccb:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1cd2:	00 00 00 
    1cd5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1cdc:	eb 14                	jmp    1cf2 <kernel_main+0x237>
    1cde:	83 ec 0c             	sub    $0xc,%esp
    1ce1:	68 e0 62 00 00       	push   $0x62e0
    1ce6:	e8 9e f3 ff ff       	call   1089 <disp_str>
    1ceb:	83 c4 10             	add    $0x10,%esp
    1cee:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1cf2:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
    1cf9:	7e e3                	jle    1cde <kernel_main+0x223>
    1cfb:	c7 05 90 9e 00 00 00 	movl   $0x0,0x9e90
    1d02:	00 00 00 
    1d05:	e8 03 43 00 00       	call   600d <init_keyboard_handler>
    1d0a:	e8 7f f5 ff ff       	call   128e <restart>
    1d0f:	eb fe                	jmp    1d0f <kernel_main+0x254>

00001d11 <TestA>:
    1d11:	55                   	push   %ebp
    1d12:	89 e5                	mov    %esp,%ebp
    1d14:	83 ec 18             	sub    $0x18,%esp
    1d17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d1e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d22:	74 1c                	je     1d40 <TestA+0x2f>
    1d24:	68 8a 01 00 00       	push   $0x18a
    1d29:	68 fd 65 00 00       	push   $0x65fd
    1d2e:	68 fd 65 00 00       	push   $0x65fd
    1d33:	68 04 66 00 00       	push   $0x6604
    1d38:	e8 1f 05 00 00       	call   225c <assertion_failure>
    1d3d:	83 c4 10             	add    $0x10,%esp
    1d40:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1d44:	77 16                	ja     1d5c <TestA+0x4b>
    1d46:	e8 3c 0d 00 00       	call   2a87 <get_ticks_ipc>
    1d4b:	83 ec 08             	sub    $0x8,%esp
    1d4e:	50                   	push   %eax
    1d4f:	68 0b 66 00 00       	push   $0x660b
    1d54:	e8 b6 01 00 00       	call   1f0f <Printf>
    1d59:	83 c4 10             	add    $0x10,%esp
    1d5c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d60:	eb de                	jmp    1d40 <TestA+0x2f>

00001d62 <delay>:
    1d62:	55                   	push   %ebp
    1d63:	89 e5                	mov    %esp,%ebp
    1d65:	83 ec 10             	sub    $0x10,%esp
    1d68:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1d6f:	eb 2d                	jmp    1d9e <delay+0x3c>
    1d71:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1d78:	eb 1a                	jmp    1d94 <delay+0x32>
    1d7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d81:	eb 04                	jmp    1d87 <delay+0x25>
    1d83:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d87:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    1d8e:	7e f3                	jle    1d83 <delay+0x21>
    1d90:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1d94:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
    1d98:	7e e0                	jle    1d7a <delay+0x18>
    1d9a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1d9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1da1:	3b 45 08             	cmp    0x8(%ebp),%eax
    1da4:	7c cb                	jl     1d71 <delay+0xf>
    1da6:	90                   	nop
    1da7:	c9                   	leave  
    1da8:	c3                   	ret    

00001da9 <TestB>:
    1da9:	55                   	push   %ebp
    1daa:	89 e5                	mov    %esp,%ebp
    1dac:	83 ec 18             	sub    $0x18,%esp
    1daf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1db6:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1dba:	77 16                	ja     1dd2 <TestB+0x29>
    1dbc:	e8 c6 0c 00 00       	call   2a87 <get_ticks_ipc>
    1dc1:	83 ec 08             	sub    $0x8,%esp
    1dc4:	50                   	push   %eax
    1dc5:	68 0e 66 00 00       	push   $0x660e
    1dca:	e8 40 01 00 00       	call   1f0f <Printf>
    1dcf:	83 c4 10             	add    $0x10,%esp
    1dd2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1dd6:	eb de                	jmp    1db6 <TestB+0xd>

00001dd8 <TestC>:
    1dd8:	55                   	push   %ebp
    1dd9:	89 e5                	mov    %esp,%ebp
    1ddb:	83 ec 18             	sub    $0x18,%esp
    1dde:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1de5:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    1de9:	77 1a                	ja     1e05 <TestC+0x2d>
    1deb:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
    1df2:	83 ec 08             	sub    $0x8,%esp
    1df5:	ff 75 f0             	pushl  -0x10(%ebp)
    1df8:	68 15 66 00 00       	push   $0x6615
    1dfd:	e8 0d 01 00 00       	call   1f0f <Printf>
    1e02:	83 c4 10             	add    $0x10,%esp
    1e05:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1e09:	eb da                	jmp    1de5 <TestC+0xd>

00001e0b <sys_get_ticks>:
    1e0b:	55                   	push   %ebp
    1e0c:	89 e5                	mov    %esp,%ebp
    1e0e:	a1 80 d4 00 00       	mov    0xd480,%eax
    1e13:	5d                   	pop    %ebp
    1e14:	c3                   	ret    

00001e15 <sys_write>:
    1e15:	55                   	push   %ebp
    1e16:	89 e5                	mov    %esp,%ebp
    1e18:	83 ec 18             	sub    $0x18,%esp
    1e1b:	8b 45 10             	mov    0x10(%ebp),%eax
    1e1e:	8b 40 64             	mov    0x64(%eax),%eax
    1e21:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    1e27:	05 00 a6 00 00       	add    $0xa600,%eax
    1e2c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1e2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e32:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1e35:	8b 45 08             	mov    0x8(%ebp),%eax
    1e38:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e3b:	eb 20                	jmp    1e5d <sys_write+0x48>
    1e3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e40:	0f b6 00             	movzbl (%eax),%eax
    1e43:	0f b6 c0             	movzbl %al,%eax
    1e46:	83 ec 08             	sub    $0x8,%esp
    1e49:	50                   	push   %eax
    1e4a:	ff 75 ec             	pushl  -0x14(%ebp)
    1e4d:	e8 0b 38 00 00       	call   565d <out_char>
    1e52:	83 c4 10             	add    $0x10,%esp
    1e55:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1e59:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1e5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e61:	7f da                	jg     1e3d <sys_write+0x28>
    1e63:	90                   	nop
    1e64:	c9                   	leave  
    1e65:	c3                   	ret    

00001e66 <milli_delay>:
    1e66:	55                   	push   %ebp
    1e67:	89 e5                	mov    %esp,%ebp
    1e69:	83 ec 18             	sub    $0x18,%esp
    1e6c:	e8 16 0c 00 00       	call   2a87 <get_ticks_ipc>
    1e71:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1e74:	90                   	nop
    1e75:	e8 0d 0c 00 00       	call   2a87 <get_ticks_ipc>
    1e7a:	2b 45 f4             	sub    -0xc(%ebp),%eax
    1e7d:	89 c1                	mov    %eax,%ecx
    1e7f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1e84:	89 c8                	mov    %ecx,%eax
    1e86:	f7 ea                	imul   %edx
    1e88:	c1 fa 05             	sar    $0x5,%edx
    1e8b:	89 c8                	mov    %ecx,%eax
    1e8d:	c1 f8 1f             	sar    $0x1f,%eax
    1e90:	29 c2                	sub    %eax,%edx
    1e92:	89 d0                	mov    %edx,%eax
    1e94:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
    1e9a:	39 45 08             	cmp    %eax,0x8(%ebp)
    1e9d:	77 d6                	ja     1e75 <milli_delay+0xf>
    1e9f:	90                   	nop
    1ea0:	c9                   	leave  
    1ea1:	c3                   	ret    

00001ea2 <TaskSys>:
    1ea2:	55                   	push   %ebp
    1ea3:	89 e5                	mov    %esp,%ebp
    1ea5:	81 ec 88 00 00 00    	sub    $0x88,%esp
    1eab:	83 ec 04             	sub    $0x4,%esp
    1eae:	6a 68                	push   $0x68
    1eb0:	6a 00                	push   $0x0
    1eb2:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1eb5:	50                   	push   %eax
    1eb6:	e8 fa 4b 00 00       	call   6ab5 <Memset>
    1ebb:	83 c4 10             	add    $0x10,%esp
    1ebe:	83 ec 08             	sub    $0x8,%esp
    1ec1:	6a 11                	push   $0x11
    1ec3:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1ec6:	50                   	push   %eax
    1ec7:	e8 dc 18 00 00       	call   37a8 <receive_msg>
    1ecc:	83 c4 10             	add    $0x10,%esp
    1ecf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1ed2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ed6:	75 34                	jne    1f0c <TaskSys+0x6a>
    1ed8:	8b 45 88             	mov    -0x78(%ebp),%eax
    1edb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1ede:	8b 45 84             	mov    -0x7c(%ebp),%eax
    1ee1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1ee4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    1ee8:	75 1f                	jne    1f09 <TaskSys+0x67>
    1eea:	a1 80 d4 00 00       	mov    0xd480,%eax
    1eef:	89 45 8c             	mov    %eax,-0x74(%ebp)
    1ef2:	83 ec 08             	sub    $0x8,%esp
    1ef5:	ff 75 ec             	pushl  -0x14(%ebp)
    1ef8:	8d 45 84             	lea    -0x7c(%ebp),%eax
    1efb:	50                   	push   %eax
    1efc:	e8 97 18 00 00       	call   3798 <send_msg>
    1f01:	83 c4 10             	add    $0x10,%esp
    1f04:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1f07:	eb 01                	jmp    1f0a <TaskSys+0x68>
    1f09:	90                   	nop
    1f0a:	eb 9f                	jmp    1eab <TaskSys+0x9>
    1f0c:	90                   	nop
    1f0d:	c9                   	leave  
    1f0e:	c3                   	ret    

00001f0f <Printf>:
    1f0f:	55                   	push   %ebp
    1f10:	89 e5                	mov    %esp,%ebp
    1f12:	81 ec 18 01 00 00    	sub    $0x118,%esp
    1f18:	83 ec 04             	sub    $0x4,%esp
    1f1b:	68 00 01 00 00       	push   $0x100
    1f20:	6a 00                	push   $0x0
    1f22:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f28:	50                   	push   %eax
    1f29:	e8 87 4b 00 00       	call   6ab5 <Memset>
    1f2e:	83 c4 10             	add    $0x10,%esp
    1f31:	8d 45 0c             	lea    0xc(%ebp),%eax
    1f34:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1f37:	8b 45 08             	mov    0x8(%ebp),%eax
    1f3a:	83 ec 04             	sub    $0x4,%esp
    1f3d:	ff 75 f4             	pushl  -0xc(%ebp)
    1f40:	50                   	push   %eax
    1f41:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f47:	50                   	push   %eax
    1f48:	e8 1e 00 00 00       	call   1f6b <vsprintf>
    1f4d:	83 c4 10             	add    $0x10,%esp
    1f50:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1f53:	83 ec 08             	sub    $0x8,%esp
    1f56:	ff 75 f0             	pushl  -0x10(%ebp)
    1f59:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    1f5f:	50                   	push   %eax
    1f60:	e8 13 18 00 00       	call   3778 <write2>
    1f65:	83 c4 10             	add    $0x10,%esp
    1f68:	90                   	nop
    1f69:	c9                   	leave  
    1f6a:	c3                   	ret    

00001f6b <vsprintf>:
    1f6b:	55                   	push   %ebp
    1f6c:	89 e5                	mov    %esp,%ebp
    1f6e:	81 ec 68 02 00 00    	sub    $0x268,%esp
    1f74:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    1f7a:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
    1f80:	83 ec 04             	sub    $0x4,%esp
    1f83:	6a 40                	push   $0x40
    1f85:	6a 00                	push   $0x0
    1f87:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    1f8d:	50                   	push   %eax
    1f8e:	e8 22 4b 00 00       	call   6ab5 <Memset>
    1f93:	83 c4 10             	add    $0x10,%esp
    1f96:	8b 45 10             	mov    0x10(%ebp),%eax
    1f99:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1f9c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1fa3:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1fa9:	e9 53 01 00 00       	jmp    2101 <vsprintf+0x196>
    1fae:	8b 45 0c             	mov    0xc(%ebp),%eax
    1fb1:	0f b6 00             	movzbl (%eax),%eax
    1fb4:	3c 25                	cmp    $0x25,%al
    1fb6:	74 16                	je     1fce <vsprintf+0x63>
    1fb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fbb:	8d 50 01             	lea    0x1(%eax),%edx
    1fbe:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1fc1:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fc4:	0f b6 12             	movzbl (%edx),%edx
    1fc7:	88 10                	mov    %dl,(%eax)
    1fc9:	e9 2f 01 00 00       	jmp    20fd <vsprintf+0x192>
    1fce:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1fd2:	8b 45 0c             	mov    0xc(%ebp),%eax
    1fd5:	0f b6 00             	movzbl (%eax),%eax
    1fd8:	0f be c0             	movsbl %al,%eax
    1fdb:	83 f8 64             	cmp    $0x64,%eax
    1fde:	74 26                	je     2006 <vsprintf+0x9b>
    1fe0:	83 f8 64             	cmp    $0x64,%eax
    1fe3:	7f 0e                	jg     1ff3 <vsprintf+0x88>
    1fe5:	83 f8 63             	cmp    $0x63,%eax
    1fe8:	0f 84 f2 00 00 00    	je     20e0 <vsprintf+0x175>
    1fee:	e9 0a 01 00 00       	jmp    20fd <vsprintf+0x192>
    1ff3:	83 f8 73             	cmp    $0x73,%eax
    1ff6:	0f 84 b0 00 00 00    	je     20ac <vsprintf+0x141>
    1ffc:	83 f8 78             	cmp    $0x78,%eax
    1fff:	74 5d                	je     205e <vsprintf+0xf3>
    2001:	e9 f7 00 00 00       	jmp    20fd <vsprintf+0x192>
    2006:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2009:	8b 00                	mov    (%eax),%eax
    200b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    200e:	83 ec 04             	sub    $0x4,%esp
    2011:	6a 0a                	push   $0xa
    2013:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
    2019:	50                   	push   %eax
    201a:	ff 75 e8             	pushl  -0x18(%ebp)
    201d:	e8 a6 0a 00 00       	call   2ac8 <itoa>
    2022:	83 c4 10             	add    $0x10,%esp
    2025:	83 ec 08             	sub    $0x8,%esp
    2028:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    202e:	50                   	push   %eax
    202f:	ff 75 f4             	pushl  -0xc(%ebp)
    2032:	e8 9d 4a 00 00       	call   6ad4 <Strcpy>
    2037:	83 c4 10             	add    $0x10,%esp
    203a:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    203e:	83 ec 0c             	sub    $0xc,%esp
    2041:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
    2047:	50                   	push   %eax
    2048:	e8 a1 4a 00 00       	call   6aee <Strlen>
    204d:	83 c4 10             	add    $0x10,%esp
    2050:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2053:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2056:	01 45 f4             	add    %eax,-0xc(%ebp)
    2059:	e9 9f 00 00 00       	jmp    20fd <vsprintf+0x192>
    205e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2061:	8b 00                	mov    (%eax),%eax
    2063:	83 ec 08             	sub    $0x8,%esp
    2066:	50                   	push   %eax
    2067:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    206d:	50                   	push   %eax
    206e:	e8 a2 f4 ff ff       	call   1515 <atoi>
    2073:	83 c4 10             	add    $0x10,%esp
    2076:	83 ec 08             	sub    $0x8,%esp
    2079:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    207f:	50                   	push   %eax
    2080:	ff 75 f4             	pushl  -0xc(%ebp)
    2083:	e8 4c 4a 00 00       	call   6ad4 <Strcpy>
    2088:	83 c4 10             	add    $0x10,%esp
    208b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    208f:	83 ec 0c             	sub    $0xc,%esp
    2092:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
    2098:	50                   	push   %eax
    2099:	e8 50 4a 00 00       	call   6aee <Strlen>
    209e:	83 c4 10             	add    $0x10,%esp
    20a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    20a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20a7:	01 45 f4             	add    %eax,-0xc(%ebp)
    20aa:	eb 51                	jmp    20fd <vsprintf+0x192>
    20ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20af:	8b 00                	mov    (%eax),%eax
    20b1:	83 ec 08             	sub    $0x8,%esp
    20b4:	50                   	push   %eax
    20b5:	ff 75 f4             	pushl  -0xc(%ebp)
    20b8:	e8 17 4a 00 00       	call   6ad4 <Strcpy>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20c3:	8b 00                	mov    (%eax),%eax
    20c5:	83 ec 0c             	sub    $0xc,%esp
    20c8:	50                   	push   %eax
    20c9:	e8 20 4a 00 00       	call   6aee <Strlen>
    20ce:	83 c4 10             	add    $0x10,%esp
    20d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    20d4:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    20d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20db:	01 45 f4             	add    %eax,-0xc(%ebp)
    20de:	eb 1d                	jmp    20fd <vsprintf+0x192>
    20e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20e3:	0f b6 10             	movzbl (%eax),%edx
    20e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20e9:	88 10                	mov    %dl,(%eax)
    20eb:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
    20ef:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    20f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20f9:	01 45 f4             	add    %eax,-0xc(%ebp)
    20fc:	90                   	nop
    20fd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    2101:	8b 45 0c             	mov    0xc(%ebp),%eax
    2104:	0f b6 00             	movzbl (%eax),%eax
    2107:	84 c0                	test   %al,%al
    2109:	0f 85 9f fe ff ff    	jne    1fae <vsprintf+0x43>
    210f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2112:	2b 45 08             	sub    0x8(%ebp),%eax
    2115:	c9                   	leave  
    2116:	c3                   	ret    

00002117 <printx>:
    2117:	55                   	push   %ebp
    2118:	89 e5                	mov    %esp,%ebp
    211a:	81 ec 18 01 00 00    	sub    $0x118,%esp
    2120:	8d 45 0c             	lea    0xc(%ebp),%eax
    2123:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2126:	8b 45 08             	mov    0x8(%ebp),%eax
    2129:	83 ec 04             	sub    $0x4,%esp
    212c:	ff 75 f4             	pushl  -0xc(%ebp)
    212f:	50                   	push   %eax
    2130:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    2136:	50                   	push   %eax
    2137:	e8 2f fe ff ff       	call   1f6b <vsprintf>
    213c:	83 c4 10             	add    $0x10,%esp
    213f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2142:	83 ec 08             	sub    $0x8,%esp
    2145:	ff 75 f0             	pushl  -0x10(%ebp)
    2148:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
    214e:	50                   	push   %eax
    214f:	e8 34 16 00 00       	call   3788 <write_debug>
    2154:	83 c4 10             	add    $0x10,%esp
    2157:	90                   	nop
    2158:	c9                   	leave  
    2159:	c3                   	ret    

0000215a <sys_printx>:
    215a:	55                   	push   %ebp
    215b:	89 e5                	mov    %esp,%ebp
    215d:	83 ec 28             	sub    $0x28,%esp
    2160:	a1 94 9e 00 00       	mov    0x9e94,%eax
    2165:	85 c0                	test   %eax,%eax
    2167:	75 20                	jne    2189 <sys_printx+0x2f>
    2169:	8b 45 10             	mov    0x10(%ebp),%eax
    216c:	8b 40 0c             	mov    0xc(%eax),%eax
    216f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2172:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2175:	83 ec 08             	sub    $0x8,%esp
    2178:	ff 75 10             	pushl  0x10(%ebp)
    217b:	50                   	push   %eax
    217c:	e8 9b 2f 00 00       	call   511c <Seg2PhyAddrLDT>
    2181:	83 c4 10             	add    $0x10,%esp
    2184:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2187:	eb 19                	jmp    21a2 <sys_printx+0x48>
    2189:	a1 94 9e 00 00       	mov    0x9e94,%eax
    218e:	85 c0                	test   %eax,%eax
    2190:	74 10                	je     21a2 <sys_printx+0x48>
    2192:	83 ec 0c             	sub    $0xc,%esp
    2195:	6a 30                	push   $0x30
    2197:	e8 3f 2f 00 00       	call   50db <Seg2PhyAddr>
    219c:	83 c4 10             	add    $0x10,%esp
    219f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    21a2:	8b 55 08             	mov    0x8(%ebp),%edx
    21a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21a8:	01 d0                	add    %edx,%eax
    21aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
    21ad:	8b 45 10             	mov    0x10(%ebp),%eax
    21b0:	8b 40 64             	mov    0x64(%eax),%eax
    21b3:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    21b9:	05 00 a6 00 00       	add    $0xa600,%eax
    21be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    21c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    21c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21ca:	0f b6 00             	movzbl (%eax),%eax
    21cd:	88 45 e3             	mov    %al,-0x1d(%ebp)
    21d0:	eb 3a                	jmp    220c <sys_printx+0xb2>
    21d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21d5:	0f b6 00             	movzbl (%eax),%eax
    21d8:	3c 3b                	cmp    $0x3b,%al
    21da:	74 0a                	je     21e6 <sys_printx+0x8c>
    21dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21df:	0f b6 00             	movzbl (%eax),%eax
    21e2:	3c 3a                	cmp    $0x3a,%al
    21e4:	75 06                	jne    21ec <sys_printx+0x92>
    21e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    21ea:	eb 20                	jmp    220c <sys_printx+0xb2>
    21ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21ef:	0f b6 00             	movzbl (%eax),%eax
    21f2:	0f b6 c0             	movzbl %al,%eax
    21f5:	83 ec 08             	sub    $0x8,%esp
    21f8:	50                   	push   %eax
    21f9:	ff 75 e4             	pushl  -0x1c(%ebp)
    21fc:	e8 5c 34 00 00       	call   565d <out_char>
    2201:	83 c4 10             	add    $0x10,%esp
    2204:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2208:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    220c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2210:	7f c0                	jg     21d2 <sys_printx+0x78>
    2212:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
    2216:	75 11                	jne    2229 <sys_printx+0xcf>
    2218:	a1 94 9e 00 00       	mov    0x9e94,%eax
    221d:	85 c0                	test   %eax,%eax
    221f:	74 15                	je     2236 <sys_printx+0xdc>
    2221:	e8 dc f0 ff ff       	call   1302 <disable_int>
    2226:	f4                   	hlt    
    2227:	eb 0d                	jmp    2236 <sys_printx+0xdc>
    2229:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
    222d:	75 07                	jne    2236 <sys_printx+0xdc>
    222f:	e8 ce f0 ff ff       	call   1302 <disable_int>
    2234:	f4                   	hlt    
    2235:	90                   	nop
    2236:	90                   	nop
    2237:	c9                   	leave  
    2238:	c3                   	ret    

00002239 <spin>:
    2239:	55                   	push   %ebp
    223a:	89 e5                	mov    %esp,%ebp
    223c:	eb fe                	jmp    223c <spin+0x3>

0000223e <panic>:
    223e:	55                   	push   %ebp
    223f:	89 e5                	mov    %esp,%ebp
    2241:	83 ec 08             	sub    $0x8,%esp
    2244:	83 ec 04             	sub    $0x4,%esp
    2247:	ff 75 08             	pushl  0x8(%ebp)
    224a:	6a 3a                	push   $0x3a
    224c:	68 22 66 00 00       	push   $0x6622
    2251:	e8 c1 fe ff ff       	call   2117 <printx>
    2256:	83 c4 10             	add    $0x10,%esp
    2259:	90                   	nop
    225a:	c9                   	leave  
    225b:	c3                   	ret    

0000225c <assertion_failure>:
    225c:	55                   	push   %ebp
    225d:	89 e5                	mov    %esp,%ebp
    225f:	83 ec 08             	sub    $0x8,%esp
    2262:	83 ec 08             	sub    $0x8,%esp
    2265:	68 08 21 00 00       	push   $0x2108
    226a:	ff 75 10             	pushl  0x10(%ebp)
    226d:	ff 75 0c             	pushl  0xc(%ebp)
    2270:	ff 75 08             	pushl  0x8(%ebp)
    2273:	6a 3b                	push   $0x3b
    2275:	68 28 66 00 00       	push   $0x6628
    227a:	e8 98 fe ff ff       	call   2117 <printx>
    227f:	83 c4 20             	add    $0x20,%esp
    2282:	83 ec 0c             	sub    $0xc,%esp
    2285:	68 5b 66 00 00       	push   $0x665b
    228a:	e8 aa ff ff ff       	call   2239 <spin>
    228f:	83 c4 10             	add    $0x10,%esp
    2292:	90                   	nop
    2293:	c9                   	leave  
    2294:	c3                   	ret    

00002295 <dead_lock>:
    2295:	55                   	push   %ebp
    2296:	89 e5                	mov    %esp,%ebp
    2298:	83 ec 18             	sub    $0x18,%esp
    229b:	83 ec 0c             	sub    $0xc,%esp
    229e:	ff 75 08             	pushl  0x8(%ebp)
    22a1:	e8 8d 2d 00 00       	call   5033 <pid2proc>
    22a6:	83 c4 10             	add    $0x10,%esp
    22a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    22ac:	83 ec 0c             	sub    $0xc,%esp
    22af:	ff 75 0c             	pushl  0xc(%ebp)
    22b2:	e8 7c 2d 00 00       	call   5033 <pid2proc>
    22b7:	83 c4 10             	add    $0x10,%esp
    22ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    22bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22c0:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    22c7:	3c 01                	cmp    $0x1,%al
    22c9:	75 5a                	jne    2325 <dead_lock+0x90>
    22cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22ce:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    22d4:	39 45 08             	cmp    %eax,0x8(%ebp)
    22d7:	75 32                	jne    230b <dead_lock+0x76>
    22d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22e2:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    22e8:	83 ec 0c             	sub    $0xc,%esp
    22eb:	50                   	push   %eax
    22ec:	e8 42 2d 00 00       	call   5033 <pid2proc>
    22f1:	83 c4 10             	add    $0x10,%esp
    22f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22fa:	8b 50 58             	mov    0x58(%eax),%edx
    22fd:	8b 45 08             	mov    0x8(%ebp),%eax
    2300:	39 c2                	cmp    %eax,%edx
    2302:	75 db                	jne    22df <dead_lock+0x4a>
    2304:	b8 01 00 00 00       	mov    $0x1,%eax
    2309:	eb 20                	jmp    232b <dead_lock+0x96>
    230b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    230e:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2314:	83 ec 0c             	sub    $0xc,%esp
    2317:	50                   	push   %eax
    2318:	e8 16 2d 00 00       	call   5033 <pid2proc>
    231d:	83 c4 10             	add    $0x10,%esp
    2320:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2323:	eb 98                	jmp    22bd <dead_lock+0x28>
    2325:	90                   	nop
    2326:	b8 00 00 00 00       	mov    $0x0,%eax
    232b:	c9                   	leave  
    232c:	c3                   	ret    

0000232d <sys_send_msg>:
    232d:	55                   	push   %ebp
    232e:	89 e5                	mov    %esp,%ebp
    2330:	83 ec 38             	sub    $0x38,%esp
    2333:	83 ec 0c             	sub    $0xc,%esp
    2336:	ff 75 0c             	pushl  0xc(%ebp)
    2339:	e8 f5 2c 00 00       	call   5033 <pid2proc>
    233e:	83 c4 10             	add    $0x10,%esp
    2341:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2344:	83 ec 0c             	sub    $0xc,%esp
    2347:	ff 75 10             	pushl  0x10(%ebp)
    234a:	e8 00 2d 00 00       	call   504f <proc2pid>
    234f:	83 c4 10             	add    $0x10,%esp
    2352:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2355:	8b 45 08             	mov    0x8(%ebp),%eax
    2358:	8b 55 e8             	mov    -0x18(%ebp),%edx
    235b:	89 10                	mov    %edx,(%eax)
    235d:	83 ec 08             	sub    $0x8,%esp
    2360:	ff 75 0c             	pushl  0xc(%ebp)
    2363:	ff 75 e8             	pushl  -0x18(%ebp)
    2366:	e8 2a ff ff ff       	call   2295 <dead_lock>
    236b:	83 c4 10             	add    $0x10,%esp
    236e:	83 f8 01             	cmp    $0x1,%eax
    2371:	75 10                	jne    2383 <sys_send_msg+0x56>
    2373:	83 ec 0c             	sub    $0xc,%esp
    2376:	68 67 66 00 00       	push   $0x6667
    237b:	e8 be fe ff ff       	call   223e <panic>
    2380:	83 c4 10             	add    $0x10,%esp
    2383:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2386:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    238d:	3c 02                	cmp    $0x2,%al
    238f:	0f 85 92 01 00 00    	jne    2527 <sys_send_msg+0x1fa>
    2395:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2398:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    239e:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    23a1:	74 12                	je     23b5 <sys_send_msg+0x88>
    23a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23a6:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    23ac:	83 f8 11             	cmp    $0x11,%eax
    23af:	0f 85 72 01 00 00    	jne    2527 <sys_send_msg+0x1fa>
    23b5:	8b 45 10             	mov    0x10(%ebp),%eax
    23b8:	8b 40 0c             	mov    0xc(%eax),%eax
    23bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    23be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    23c1:	83 ec 08             	sub    $0x8,%esp
    23c4:	ff 75 10             	pushl  0x10(%ebp)
    23c7:	50                   	push   %eax
    23c8:	e8 4f 2d 00 00       	call   511c <Seg2PhyAddrLDT>
    23cd:	83 c4 10             	add    $0x10,%esp
    23d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    23d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    23d6:	6b d0 68             	imul   $0x68,%eax,%edx
    23d9:	8b 45 08             	mov    0x8(%ebp),%eax
    23dc:	01 d0                	add    %edx,%eax
    23de:	89 45 dc             	mov    %eax,-0x24(%ebp)
    23e1:	c7 45 d8 68 00 00 00 	movl   $0x68,-0x28(%ebp)
    23e8:	8b 55 dc             	mov    -0x24(%ebp),%edx
    23eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23ee:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    23f4:	83 ec 04             	sub    $0x4,%esp
    23f7:	ff 75 d8             	pushl  -0x28(%ebp)
    23fa:	52                   	push   %edx
    23fb:	50                   	push   %eax
    23fc:	e8 86 46 00 00       	call   6a87 <Memcpy>
    2401:	83 c4 10             	add    $0x10,%esp
    2404:	8b 45 10             	mov    0x10(%ebp),%eax
    2407:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    240e:	00 00 00 
    2411:	8b 45 10             	mov    0x10(%ebp),%eax
    2414:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
    241b:	00 00 00 
    241e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2421:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    2428:	00 00 00 
    242b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    242e:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    2435:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2438:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    243f:	00 00 00 
    2442:	83 ec 0c             	sub    $0xc,%esp
    2445:	ff 75 ec             	pushl  -0x14(%ebp)
    2448:	e8 30 06 00 00       	call   2a7d <unblock>
    244d:	83 c4 10             	add    $0x10,%esp
    2450:	8b 45 10             	mov    0x10(%ebp),%eax
    2453:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2459:	85 c0                	test   %eax,%eax
    245b:	74 1c                	je     2479 <sys_send_msg+0x14c>
    245d:	68 27 03 00 00       	push   $0x327
    2462:	68 fd 65 00 00       	push   $0x65fd
    2467:	68 fd 65 00 00       	push   $0x65fd
    246c:	68 72 66 00 00       	push   $0x6672
    2471:	e8 e6 fd ff ff       	call   225c <assertion_failure>
    2476:	83 c4 10             	add    $0x10,%esp
    2479:	8b 45 10             	mov    0x10(%ebp),%eax
    247c:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2482:	85 c0                	test   %eax,%eax
    2484:	74 1c                	je     24a2 <sys_send_msg+0x175>
    2486:	68 28 03 00 00       	push   $0x328
    248b:	68 fd 65 00 00       	push   $0x65fd
    2490:	68 fd 65 00 00       	push   $0x65fd
    2495:	68 85 66 00 00       	push   $0x6685
    249a:	e8 bd fd ff ff       	call   225c <assertion_failure>
    249f:	83 c4 10             	add    $0x10,%esp
    24a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a5:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    24ab:	85 c0                	test   %eax,%eax
    24ad:	74 1c                	je     24cb <sys_send_msg+0x19e>
    24af:	68 29 03 00 00       	push   $0x329
    24b4:	68 fd 65 00 00       	push   $0x65fd
    24b9:	68 fd 65 00 00       	push   $0x65fd
    24be:	68 9c 66 00 00       	push   $0x669c
    24c3:	e8 94 fd ff ff       	call   225c <assertion_failure>
    24c8:	83 c4 10             	add    $0x10,%esp
    24cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24ce:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    24d5:	84 c0                	test   %al,%al
    24d7:	74 1c                	je     24f5 <sys_send_msg+0x1c8>
    24d9:	68 2a 03 00 00       	push   $0x32a
    24de:	68 fd 65 00 00       	push   $0x65fd
    24e3:	68 fd 65 00 00       	push   $0x65fd
    24e8:	68 b1 66 00 00       	push   $0x66b1
    24ed:	e8 6a fd ff ff       	call   225c <assertion_failure>
    24f2:	83 c4 10             	add    $0x10,%esp
    24f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24f8:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    24fe:	85 c0                	test   %eax,%eax
    2500:	0f 84 69 01 00 00    	je     266f <sys_send_msg+0x342>
    2506:	68 2b 03 00 00       	push   $0x32b
    250b:	68 fd 65 00 00       	push   $0x65fd
    2510:	68 fd 65 00 00       	push   $0x65fd
    2515:	68 c7 66 00 00       	push   $0x66c7
    251a:	e8 3d fd ff ff       	call   225c <assertion_failure>
    251f:	83 c4 10             	add    $0x10,%esp
    2522:	e9 48 01 00 00       	jmp    266f <sys_send_msg+0x342>
    2527:	8b 45 10             	mov    0x10(%ebp),%eax
    252a:	8b 55 08             	mov    0x8(%ebp),%edx
    252d:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    2533:	8b 45 10             	mov    0x10(%ebp),%eax
    2536:	8b 55 0c             	mov    0xc(%ebp),%edx
    2539:	89 90 84 01 00 00    	mov    %edx,0x184(%eax)
    253f:	8b 45 10             	mov    0x10(%ebp),%eax
    2542:	c6 80 7c 01 00 00 01 	movb   $0x1,0x17c(%eax)
    2549:	8b 45 ec             	mov    -0x14(%ebp),%eax
    254c:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2552:	85 c0                	test   %eax,%eax
    2554:	75 1b                	jne    2571 <sys_send_msg+0x244>
    2556:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2559:	89 45 d0             	mov    %eax,-0x30(%ebp)
    255c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    2563:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2566:	8d 55 d0             	lea    -0x30(%ebp),%edx
    2569:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    256f:	eb 47                	jmp    25b8 <sys_send_msg+0x28b>
    2571:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2574:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    257a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    257d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2580:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2586:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2589:	eb 0f                	jmp    259a <sys_send_msg+0x26d>
    258b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    258e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2591:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2594:	8b 40 04             	mov    0x4(%eax),%eax
    2597:	89 45 f4             	mov    %eax,-0xc(%ebp)
    259a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    259e:	75 eb                	jne    258b <sys_send_msg+0x25e>
    25a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    25a3:	8b 40 04             	mov    0x4(%eax),%eax
    25a6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    25a9:	89 10                	mov    %edx,(%eax)
    25ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    25ae:	8b 40 04             	mov    0x4(%eax),%eax
    25b1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    25b8:	8b 45 10             	mov    0x10(%ebp),%eax
    25bb:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    25c2:	3c 01                	cmp    $0x1,%al
    25c4:	74 1c                	je     25e2 <sys_send_msg+0x2b5>
    25c6:	68 59 03 00 00       	push   $0x359
    25cb:	68 fd 65 00 00       	push   $0x65fd
    25d0:	68 fd 65 00 00       	push   $0x65fd
    25d5:	68 e5 66 00 00       	push   $0x66e5
    25da:	e8 7d fc ff ff       	call   225c <assertion_failure>
    25df:	83 c4 10             	add    $0x10,%esp
    25e2:	8b 45 10             	mov    0x10(%ebp),%eax
    25e5:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    25eb:	39 45 0c             	cmp    %eax,0xc(%ebp)
    25ee:	74 1c                	je     260c <sys_send_msg+0x2df>
    25f0:	68 5a 03 00 00       	push   $0x35a
    25f5:	68 fd 65 00 00       	push   $0x65fd
    25fa:	68 fd 65 00 00       	push   $0x65fd
    25ff:	68 00 67 00 00       	push   $0x6700
    2604:	e8 53 fc ff ff       	call   225c <assertion_failure>
    2609:	83 c4 10             	add    $0x10,%esp
    260c:	8b 45 10             	mov    0x10(%ebp),%eax
    260f:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2615:	39 45 08             	cmp    %eax,0x8(%ebp)
    2618:	74 1c                	je     2636 <sys_send_msg+0x309>
    261a:	68 5b 03 00 00       	push   $0x35b
    261f:	68 fd 65 00 00       	push   $0x65fd
    2624:	68 fd 65 00 00       	push   $0x65fd
    2629:	68 22 67 00 00       	push   $0x6722
    262e:	e8 29 fc ff ff       	call   225c <assertion_failure>
    2633:	83 c4 10             	add    $0x10,%esp
    2636:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2639:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    263f:	85 c0                	test   %eax,%eax
    2641:	75 1c                	jne    265f <sys_send_msg+0x332>
    2643:	68 5d 03 00 00       	push   $0x35d
    2648:	68 fd 65 00 00       	push   $0x65fd
    264d:	68 fd 65 00 00       	push   $0x65fd
    2652:	68 37 67 00 00       	push   $0x6737
    2657:	e8 00 fc ff ff       	call   225c <assertion_failure>
    265c:	83 c4 10             	add    $0x10,%esp
    265f:	83 ec 0c             	sub    $0xc,%esp
    2662:	ff 75 10             	pushl  0x10(%ebp)
    2665:	e8 01 04 00 00       	call   2a6b <block>
    266a:	83 c4 10             	add    $0x10,%esp
    266d:	eb 01                	jmp    2670 <sys_send_msg+0x343>
    266f:	90                   	nop
    2670:	b8 00 00 00 00       	mov    $0x0,%eax
    2675:	c9                   	leave  
    2676:	c3                   	ret    

00002677 <sys_receive_msg>:
    2677:	55                   	push   %ebp
    2678:	89 e5                	mov    %esp,%ebp
    267a:	83 ec 38             	sub    $0x38,%esp
    267d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2684:	83 ec 0c             	sub    $0xc,%esp
    2687:	ff 75 0c             	pushl  0xc(%ebp)
    268a:	e8 a4 29 00 00       	call   5033 <pid2proc>
    268f:	83 c4 10             	add    $0x10,%esp
    2692:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2695:	83 ec 0c             	sub    $0xc,%esp
    2698:	ff 75 10             	pushl  0x10(%ebp)
    269b:	e8 af 29 00 00       	call   504f <proc2pid>
    26a0:	83 c4 10             	add    $0x10,%esp
    26a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    26a6:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    26aa:	75 40                	jne    26ec <sys_receive_msg+0x75>
    26ac:	8b 45 10             	mov    0x10(%ebp),%eax
    26af:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    26b5:	85 c0                	test   %eax,%eax
    26b7:	0f 84 c9 00 00 00    	je     2786 <sys_receive_msg+0x10f>
    26bd:	8b 45 10             	mov    0x10(%ebp),%eax
    26c0:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    26c6:	8b 00                	mov    (%eax),%eax
    26c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    26cb:	8b 45 10             	mov    0x10(%ebp),%eax
    26ce:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    26d4:	8b 50 04             	mov    0x4(%eax),%edx
    26d7:	8b 45 10             	mov    0x10(%ebp),%eax
    26da:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
    26e0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    26e7:	e9 9a 00 00 00       	jmp    2786 <sys_receive_msg+0x10f>
    26ec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    26f0:	0f 88 90 00 00 00    	js     2786 <sys_receive_msg+0x10f>
    26f6:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
    26fa:	0f 8f 86 00 00 00    	jg     2786 <sys_receive_msg+0x10f>
    2700:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2703:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    270a:	3c 01                	cmp    $0x1,%al
    270c:	75 78                	jne    2786 <sys_receive_msg+0x10f>
    270e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2711:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2717:	83 f8 11             	cmp    $0x11,%eax
    271a:	74 0e                	je     272a <sys_receive_msg+0xb3>
    271c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    271f:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2725:	39 45 e0             	cmp    %eax,-0x20(%ebp)
    2728:	75 5c                	jne    2786 <sys_receive_msg+0x10f>
    272a:	8b 45 10             	mov    0x10(%ebp),%eax
    272d:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    2733:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2736:	8b 45 10             	mov    0x10(%ebp),%eax
    2739:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
    273f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2742:	eb 24                	jmp    2768 <sys_receive_msg+0xf1>
    2744:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2747:	8b 10                	mov    (%eax),%edx
    2749:	8b 45 0c             	mov    0xc(%ebp),%eax
    274c:	39 c2                	cmp    %eax,%edx
    274e:	75 09                	jne    2759 <sys_receive_msg+0xe2>
    2750:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    2757:	eb 15                	jmp    276e <sys_receive_msg+0xf7>
    2759:	8b 45 ec             	mov    -0x14(%ebp),%eax
    275c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    275f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2762:	8b 40 04             	mov    0x4(%eax),%eax
    2765:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2768:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    276c:	75 d6                	jne    2744 <sys_receive_msg+0xcd>
    276e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    2772:	75 12                	jne    2786 <sys_receive_msg+0x10f>
    2774:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2777:	8b 50 04             	mov    0x4(%eax),%edx
    277a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    277d:	89 50 04             	mov    %edx,0x4(%eax)
    2780:	8b 45 0c             	mov    0xc(%ebp),%eax
    2783:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2786:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    278a:	0f 85 83 01 00 00    	jne    2913 <sys_receive_msg+0x29c>
    2790:	83 ec 0c             	sub    $0xc,%esp
    2793:	ff 75 f0             	pushl  -0x10(%ebp)
    2796:	e8 98 28 00 00       	call   5033 <pid2proc>
    279b:	83 c4 10             	add    $0x10,%esp
    279e:	89 45 dc             	mov    %eax,-0x24(%ebp)
    27a1:	8b 45 10             	mov    0x10(%ebp),%eax
    27a4:	8b 40 0c             	mov    0xc(%eax),%eax
    27a7:	89 45 d8             	mov    %eax,-0x28(%ebp)
    27aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
    27ad:	83 ec 08             	sub    $0x8,%esp
    27b0:	ff 75 10             	pushl  0x10(%ebp)
    27b3:	50                   	push   %eax
    27b4:	e8 63 29 00 00       	call   511c <Seg2PhyAddrLDT>
    27b9:	83 c4 10             	add    $0x10,%esp
    27bc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    27bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    27c2:	6b d0 68             	imul   $0x68,%eax,%edx
    27c5:	8b 45 08             	mov    0x8(%ebp),%eax
    27c8:	01 d0                	add    %edx,%eax
    27ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
    27cd:	c7 45 cc 68 00 00 00 	movl   $0x68,-0x34(%ebp)
    27d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    27d7:	8b 90 80 01 00 00    	mov    0x180(%eax),%edx
    27dd:	8b 45 d0             	mov    -0x30(%ebp),%eax
    27e0:	83 ec 04             	sub    $0x4,%esp
    27e3:	ff 75 cc             	pushl  -0x34(%ebp)
    27e6:	52                   	push   %edx
    27e7:	50                   	push   %eax
    27e8:	e8 9a 42 00 00       	call   6a87 <Memcpy>
    27ed:	83 c4 10             	add    $0x10,%esp
    27f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    27f3:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    27fa:	00 00 00 
    27fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2800:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
    2807:	8b 45 dc             	mov    -0x24(%ebp),%eax
    280a:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
    2811:	00 00 00 
    2814:	8b 45 10             	mov    0x10(%ebp),%eax
    2817:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
    281e:	00 00 00 
    2821:	8b 45 10             	mov    0x10(%ebp),%eax
    2824:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
    282b:	00 00 00 
    282e:	83 ec 0c             	sub    $0xc,%esp
    2831:	ff 75 dc             	pushl  -0x24(%ebp)
    2834:	e8 44 02 00 00       	call   2a7d <unblock>
    2839:	83 c4 10             	add    $0x10,%esp
    283c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    283f:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    2845:	85 c0                	test   %eax,%eax
    2847:	74 1c                	je     2865 <sys_receive_msg+0x1ee>
    2849:	68 b2 03 00 00       	push   $0x3b2
    284e:	68 fd 65 00 00       	push   $0x65fd
    2853:	68 fd 65 00 00       	push   $0x65fd
    2858:	68 4f 67 00 00       	push   $0x674f
    285d:	e8 fa f9 ff ff       	call   225c <assertion_failure>
    2862:	83 c4 10             	add    $0x10,%esp
    2865:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2868:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    286f:	84 c0                	test   %al,%al
    2871:	74 1c                	je     288f <sys_receive_msg+0x218>
    2873:	68 b3 03 00 00       	push   $0x3b3
    2878:	68 fd 65 00 00       	push   $0x65fd
    287d:	68 fd 65 00 00       	push   $0x65fd
    2882:	68 68 67 00 00       	push   $0x6768
    2887:	e8 d0 f9 ff ff       	call   225c <assertion_failure>
    288c:	83 c4 10             	add    $0x10,%esp
    288f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2892:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
    2898:	85 c0                	test   %eax,%eax
    289a:	74 1c                	je     28b8 <sys_receive_msg+0x241>
    289c:	68 b4 03 00 00       	push   $0x3b4
    28a1:	68 fd 65 00 00       	push   $0x65fd
    28a6:	68 fd 65 00 00       	push   $0x65fd
    28ab:	68 87 67 00 00       	push   $0x6787
    28b0:	e8 a7 f9 ff ff       	call   225c <assertion_failure>
    28b5:	83 c4 10             	add    $0x10,%esp
    28b8:	8b 45 10             	mov    0x10(%ebp),%eax
    28bb:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    28c1:	85 c0                	test   %eax,%eax
    28c3:	74 1c                	je     28e1 <sys_receive_msg+0x26a>
    28c5:	68 b6 03 00 00       	push   $0x3b6
    28ca:	68 fd 65 00 00       	push   $0x65fd
    28cf:	68 fd 65 00 00       	push   $0x65fd
    28d4:	68 9c 66 00 00       	push   $0x669c
    28d9:	e8 7e f9 ff ff       	call   225c <assertion_failure>
    28de:	83 c4 10             	add    $0x10,%esp
    28e1:	8b 45 10             	mov    0x10(%ebp),%eax
    28e4:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
    28ea:	85 c0                	test   %eax,%eax
    28ec:	0f 84 ba 00 00 00    	je     29ac <sys_receive_msg+0x335>
    28f2:	68 b7 03 00 00       	push   $0x3b7
    28f7:	68 fd 65 00 00       	push   $0x65fd
    28fc:	68 fd 65 00 00       	push   $0x65fd
    2901:	68 c7 66 00 00       	push   $0x66c7
    2906:	e8 51 f9 ff ff       	call   225c <assertion_failure>
    290b:	83 c4 10             	add    $0x10,%esp
    290e:	e9 99 00 00 00       	jmp    29ac <sys_receive_msg+0x335>
    2913:	8b 45 10             	mov    0x10(%ebp),%eax
    2916:	c6 80 7c 01 00 00 02 	movb   $0x2,0x17c(%eax)
    291d:	8b 45 10             	mov    0x10(%ebp),%eax
    2920:	8b 55 08             	mov    0x8(%ebp),%edx
    2923:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
    2929:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
    292d:	75 0f                	jne    293e <sys_receive_msg+0x2c7>
    292f:	8b 45 10             	mov    0x10(%ebp),%eax
    2932:	c7 80 88 01 00 00 11 	movl   $0x11,0x188(%eax)
    2939:	00 00 00 
    293c:	eb 0c                	jmp    294a <sys_receive_msg+0x2d3>
    293e:	8b 45 10             	mov    0x10(%ebp),%eax
    2941:	8b 55 0c             	mov    0xc(%ebp),%edx
    2944:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
    294a:	8b 45 10             	mov    0x10(%ebp),%eax
    294d:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    2954:	3c 02                	cmp    $0x2,%al
    2956:	74 1c                	je     2974 <sys_receive_msg+0x2fd>
    2958:	68 c4 03 00 00       	push   $0x3c4
    295d:	68 fd 65 00 00       	push   $0x65fd
    2962:	68 fd 65 00 00       	push   $0x65fd
    2967:	68 a3 67 00 00       	push   $0x67a3
    296c:	e8 eb f8 ff ff       	call   225c <assertion_failure>
    2971:	83 c4 10             	add    $0x10,%esp
    2974:	8b 45 10             	mov    0x10(%ebp),%eax
    2977:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
    297d:	39 45 08             	cmp    %eax,0x8(%ebp)
    2980:	74 1c                	je     299e <sys_receive_msg+0x327>
    2982:	68 c5 03 00 00       	push   $0x3c5
    2987:	68 fd 65 00 00       	push   $0x65fd
    298c:	68 fd 65 00 00       	push   $0x65fd
    2991:	68 c1 67 00 00       	push   $0x67c1
    2996:	e8 c1 f8 ff ff       	call   225c <assertion_failure>
    299b:	83 c4 10             	add    $0x10,%esp
    299e:	83 ec 0c             	sub    $0xc,%esp
    29a1:	ff 75 10             	pushl  0x10(%ebp)
    29a4:	e8 c2 00 00 00       	call   2a6b <block>
    29a9:	83 c4 10             	add    $0x10,%esp
    29ac:	b8 00 00 00 00       	mov    $0x0,%eax
    29b1:	c9                   	leave  
    29b2:	c3                   	ret    

000029b3 <send_rec>:
    29b3:	55                   	push   %ebp
    29b4:	89 e5                	mov    %esp,%ebp
    29b6:	83 ec 18             	sub    $0x18,%esp
    29b9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    29bd:	74 26                	je     29e5 <send_rec+0x32>
    29bf:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    29c3:	74 36                	je     29fb <send_rec+0x48>
    29c5:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    29c9:	0f 85 82 00 00 00    	jne    2a51 <send_rec+0x9e>
    29cf:	83 ec 08             	sub    $0x8,%esp
    29d2:	ff 75 10             	pushl  0x10(%ebp)
    29d5:	ff 75 0c             	pushl  0xc(%ebp)
    29d8:	e8 bb 0d 00 00       	call   3798 <send_msg>
    29dd:	83 c4 10             	add    $0x10,%esp
    29e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    29e3:	eb 7f                	jmp    2a64 <send_rec+0xb1>
    29e5:	83 ec 08             	sub    $0x8,%esp
    29e8:	ff 75 10             	pushl  0x10(%ebp)
    29eb:	ff 75 0c             	pushl  0xc(%ebp)
    29ee:	e8 b5 0d 00 00       	call   37a8 <receive_msg>
    29f3:	83 c4 10             	add    $0x10,%esp
    29f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    29f9:	eb 69                	jmp    2a64 <send_rec+0xb1>
    29fb:	83 ec 08             	sub    $0x8,%esp
    29fe:	ff 75 10             	pushl  0x10(%ebp)
    2a01:	ff 75 0c             	pushl  0xc(%ebp)
    2a04:	e8 8f 0d 00 00       	call   3798 <send_msg>
    2a09:	83 c4 10             	add    $0x10,%esp
    2a0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a13:	75 4e                	jne    2a63 <send_rec+0xb0>
    2a15:	83 ec 08             	sub    $0x8,%esp
    2a18:	ff 75 10             	pushl  0x10(%ebp)
    2a1b:	ff 75 0c             	pushl  0xc(%ebp)
    2a1e:	e8 85 0d 00 00       	call   37a8 <receive_msg>
    2a23:	83 c4 10             	add    $0x10,%esp
    2a26:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a29:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a2c:	8b 40 08             	mov    0x8(%eax),%eax
    2a2f:	85 c0                	test   %eax,%eax
    2a31:	75 30                	jne    2a63 <send_rec+0xb0>
    2a33:	68 ef 03 00 00       	push   $0x3ef
    2a38:	68 fd 65 00 00       	push   $0x65fd
    2a3d:	68 fd 65 00 00       	push   $0x65fd
    2a42:	68 d8 67 00 00       	push   $0x67d8
    2a47:	e8 10 f8 ff ff       	call   225c <assertion_failure>
    2a4c:	83 c4 10             	add    $0x10,%esp
    2a4f:	eb 12                	jmp    2a63 <send_rec+0xb0>
    2a51:	83 ec 0c             	sub    $0xc,%esp
    2a54:	68 e6 67 00 00       	push   $0x67e6
    2a59:	e8 e0 f7 ff ff       	call   223e <panic>
    2a5e:	83 c4 10             	add    $0x10,%esp
    2a61:	eb 01                	jmp    2a64 <send_rec+0xb1>
    2a63:	90                   	nop
    2a64:	b8 00 00 00 00       	mov    $0x0,%eax
    2a69:	c9                   	leave  
    2a6a:	c3                   	ret    

00002a6b <block>:
    2a6b:	55                   	push   %ebp
    2a6c:	89 e5                	mov    %esp,%ebp
    2a6e:	83 ec 08             	sub    $0x8,%esp
    2a71:	e8 d7 24 00 00       	call   4f4d <schedule_process>
    2a76:	b8 00 00 00 00       	mov    $0x0,%eax
    2a7b:	c9                   	leave  
    2a7c:	c3                   	ret    

00002a7d <unblock>:
    2a7d:	55                   	push   %ebp
    2a7e:	89 e5                	mov    %esp,%ebp
    2a80:	b8 00 00 00 00       	mov    $0x0,%eax
    2a85:	5d                   	pop    %ebp
    2a86:	c3                   	ret    

00002a87 <get_ticks_ipc>:
    2a87:	55                   	push   %ebp
    2a88:	89 e5                	mov    %esp,%ebp
    2a8a:	83 ec 78             	sub    $0x78,%esp
    2a8d:	83 ec 04             	sub    $0x4,%esp
    2a90:	6a 68                	push   $0x68
    2a92:	6a 00                	push   $0x0
    2a94:	8d 45 88             	lea    -0x78(%ebp),%eax
    2a97:	50                   	push   %eax
    2a98:	e8 18 40 00 00       	call   6ab5 <Memset>
    2a9d:	83 c4 10             	add    $0x10,%esp
    2aa0:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
    2aa7:	83 ec 04             	sub    $0x4,%esp
    2aaa:	6a 01                	push   $0x1
    2aac:	8d 45 88             	lea    -0x78(%ebp),%eax
    2aaf:	50                   	push   %eax
    2ab0:	6a 03                	push   $0x3
    2ab2:	e8 fc fe ff ff       	call   29b3 <send_rec>
    2ab7:	83 c4 10             	add    $0x10,%esp
    2aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2abd:	8b 45 90             	mov    -0x70(%ebp),%eax
    2ac0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2ac3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ac6:	c9                   	leave  
    2ac7:	c3                   	ret    

00002ac8 <itoa>:
    2ac8:	55                   	push   %ebp
    2ac9:	89 e5                	mov    %esp,%ebp
    2acb:	53                   	push   %ebx
    2acc:	83 ec 14             	sub    $0x14,%esp
    2acf:	8b 45 08             	mov    0x8(%ebp),%eax
    2ad2:	99                   	cltd   
    2ad3:	f7 7d 10             	idivl  0x10(%ebp)
    2ad6:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2ad9:	8b 45 08             	mov    0x8(%ebp),%eax
    2adc:	99                   	cltd   
    2add:	f7 7d 10             	idivl  0x10(%ebp)
    2ae0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2ae3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2ae7:	74 14                	je     2afd <itoa+0x35>
    2ae9:	83 ec 04             	sub    $0x4,%esp
    2aec:	ff 75 10             	pushl  0x10(%ebp)
    2aef:	ff 75 0c             	pushl  0xc(%ebp)
    2af2:	ff 75 f0             	pushl  -0x10(%ebp)
    2af5:	e8 ce ff ff ff       	call   2ac8 <itoa>
    2afa:	83 c4 10             	add    $0x10,%esp
    2afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b00:	8d 58 30             	lea    0x30(%eax),%ebx
    2b03:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b06:	8b 00                	mov    (%eax),%eax
    2b08:	8d 48 01             	lea    0x1(%eax),%ecx
    2b0b:	8b 55 0c             	mov    0xc(%ebp),%edx
    2b0e:	89 0a                	mov    %ecx,(%edx)
    2b10:	89 da                	mov    %ebx,%edx
    2b12:	88 10                	mov    %dl,(%eax)
    2b14:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b17:	8b 00                	mov    (%eax),%eax
    2b19:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b1c:	c9                   	leave  
    2b1d:	c3                   	ret    

00002b1e <i2a>:
    2b1e:	55                   	push   %ebp
    2b1f:	89 e5                	mov    %esp,%ebp
    2b21:	53                   	push   %ebx
    2b22:	83 ec 14             	sub    $0x14,%esp
    2b25:	8b 45 08             	mov    0x8(%ebp),%eax
    2b28:	99                   	cltd   
    2b29:	f7 7d 0c             	idivl  0xc(%ebp)
    2b2c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2b2f:	8b 45 08             	mov    0x8(%ebp),%eax
    2b32:	99                   	cltd   
    2b33:	f7 7d 0c             	idivl  0xc(%ebp)
    2b36:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2b39:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b3d:	74 14                	je     2b53 <i2a+0x35>
    2b3f:	83 ec 04             	sub    $0x4,%esp
    2b42:	ff 75 10             	pushl  0x10(%ebp)
    2b45:	ff 75 0c             	pushl  0xc(%ebp)
    2b48:	ff 75 f0             	pushl  -0x10(%ebp)
    2b4b:	e8 ce ff ff ff       	call   2b1e <i2a>
    2b50:	83 c4 10             	add    $0x10,%esp
    2b53:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    2b57:	7f 0a                	jg     2b63 <i2a+0x45>
    2b59:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b5c:	83 c0 30             	add    $0x30,%eax
    2b5f:	89 c3                	mov    %eax,%ebx
    2b61:	eb 08                	jmp    2b6b <i2a+0x4d>
    2b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b66:	83 c0 37             	add    $0x37,%eax
    2b69:	89 c3                	mov    %eax,%ebx
    2b6b:	8b 45 10             	mov    0x10(%ebp),%eax
    2b6e:	8b 00                	mov    (%eax),%eax
    2b70:	8d 48 01             	lea    0x1(%eax),%ecx
    2b73:	8b 55 10             	mov    0x10(%ebp),%edx
    2b76:	89 0a                	mov    %ecx,(%edx)
    2b78:	88 18                	mov    %bl,(%eax)
    2b7a:	8b 45 10             	mov    0x10(%ebp),%eax
    2b7d:	8b 00                	mov    (%eax),%eax
    2b7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b82:	c9                   	leave  
    2b83:	c3                   	ret    

00002b84 <TaskHD>:
    2b84:	55                   	push   %ebp
    2b85:	89 e5                	mov    %esp,%ebp
    2b87:	83 ec 08             	sub    $0x8,%esp
    2b8a:	83 ec 08             	sub    $0x8,%esp
    2b8d:	68 fb 67 00 00       	push   $0x67fb
    2b92:	68 11 68 00 00       	push   $0x6811
    2b97:	e8 73 f3 ff ff       	call   1f0f <Printf>
    2b9c:	83 c4 10             	add    $0x10,%esp
    2b9f:	e8 07 00 00 00       	call   2bab <init_hd>
    2ba4:	e8 36 00 00 00       	call   2bdf <hd_handle>
    2ba9:	eb f9                	jmp    2ba4 <TaskHD+0x20>

00002bab <init_hd>:
    2bab:	55                   	push   %ebp
    2bac:	89 e5                	mov    %esp,%ebp
    2bae:	83 ec 18             	sub    $0x18,%esp
    2bb1:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
    2bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bbb:	0f b6 00             	movzbl (%eax),%eax
    2bbe:	0f be c0             	movsbl %al,%eax
    2bc1:	83 ec 08             	sub    $0x8,%esp
    2bc4:	50                   	push   %eax
    2bc5:	68 15 68 00 00       	push   $0x6815
    2bca:	e8 40 f3 ff ff       	call   1f0f <Printf>
    2bcf:	83 c4 10             	add    $0x10,%esp
    2bd2:	e8 c3 e7 ff ff       	call   139a <enable_8259A_casecade_irq>
    2bd7:	e8 d4 e7 ff ff       	call   13b0 <enable_8259A_slave_winchester_irq>
    2bdc:	90                   	nop
    2bdd:	c9                   	leave  
    2bde:	c3                   	ret    

00002bdf <hd_handle>:
    2bdf:	55                   	push   %ebp
    2be0:	89 e5                	mov    %esp,%ebp
    2be2:	83 ec 78             	sub    $0x78,%esp
    2be5:	83 ec 08             	sub    $0x8,%esp
    2be8:	68 1d 68 00 00       	push   $0x681d
    2bed:	68 11 68 00 00       	push   $0x6811
    2bf2:	e8 18 f3 ff ff       	call   1f0f <Printf>
    2bf7:	83 c4 10             	add    $0x10,%esp
    2bfa:	83 ec 04             	sub    $0x4,%esp
    2bfd:	6a 11                	push   $0x11
    2bff:	8d 45 88             	lea    -0x78(%ebp),%eax
    2c02:	50                   	push   %eax
    2c03:	6a 02                	push   $0x2
    2c05:	e8 a9 fd ff ff       	call   29b3 <send_rec>
    2c0a:	83 c4 10             	add    $0x10,%esp
    2c0d:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2c10:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c13:	8b 45 88             	mov    -0x78(%ebp),%eax
    2c16:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2c19:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2c1d:	74 3b                	je     2c5a <hd_handle+0x7b>
    2c1f:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2c23:	77 08                	ja     2c2d <hd_handle+0x4e>
    2c25:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    2c29:	74 10                	je     2c3b <hd_handle+0x5c>
    2c2b:	eb 7d                	jmp    2caa <hd_handle+0xcb>
    2c2d:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    2c31:	74 27                	je     2c5a <hd_handle+0x7b>
    2c33:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    2c37:	74 4a                	je     2c83 <hd_handle+0xa4>
    2c39:	eb 6f                	jmp    2caa <hd_handle+0xcb>
    2c3b:	e8 33 08 00 00       	call   3473 <hd_open>
    2c40:	83 ec 04             	sub    $0x4,%esp
    2c43:	ff 75 f0             	pushl  -0x10(%ebp)
    2c46:	68 33 68 00 00       	push   $0x6833
    2c4b:	68 3b 68 00 00       	push   $0x683b
    2c50:	e8 ba f2 ff ff       	call   1f0f <Printf>
    2c55:	83 c4 10             	add    $0x10,%esp
    2c58:	eb 66                	jmp    2cc0 <hd_handle+0xe1>
    2c5a:	83 ec 0c             	sub    $0xc,%esp
    2c5d:	8d 45 88             	lea    -0x78(%ebp),%eax
    2c60:	50                   	push   %eax
    2c61:	e8 09 09 00 00       	call   356f <hd_rdwt>
    2c66:	83 c4 10             	add    $0x10,%esp
    2c69:	83 ec 04             	sub    $0x4,%esp
    2c6c:	ff 75 f0             	pushl  -0x10(%ebp)
    2c6f:	68 42 68 00 00       	push   $0x6842
    2c74:	68 3b 68 00 00       	push   $0x683b
    2c79:	e8 91 f2 ff ff       	call   1f0f <Printf>
    2c7e:	83 c4 10             	add    $0x10,%esp
    2c81:	eb 3d                	jmp    2cc0 <hd_handle+0xe1>
    2c83:	83 ec 0c             	sub    $0xc,%esp
    2c86:	6a 00                	push   $0x0
    2c88:	e8 4a 08 00 00       	call   34d7 <get_hd_ioctl>
    2c8d:	83 c4 10             	add    $0x10,%esp
    2c90:	83 ec 04             	sub    $0x4,%esp
    2c93:	ff 75 f0             	pushl  -0x10(%ebp)
    2c96:	68 4b 68 00 00       	push   $0x684b
    2c9b:	68 3b 68 00 00       	push   $0x683b
    2ca0:	e8 6a f2 ff ff       	call   1f0f <Printf>
    2ca5:	83 c4 10             	add    $0x10,%esp
    2ca8:	eb 16                	jmp    2cc0 <hd_handle+0xe1>
    2caa:	83 ec 08             	sub    $0x8,%esp
    2cad:	68 58 68 00 00       	push   $0x6858
    2cb2:	68 11 68 00 00       	push   $0x6811
    2cb7:	e8 53 f2 ff ff       	call   1f0f <Printf>
    2cbc:	83 c4 10             	add    $0x10,%esp
    2cbf:	90                   	nop
    2cc0:	c7 45 88 02 00 00 00 	movl   $0x2,-0x78(%ebp)
    2cc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cca:	83 ec 04             	sub    $0x4,%esp
    2ccd:	50                   	push   %eax
    2cce:	8d 45 88             	lea    -0x78(%ebp),%eax
    2cd1:	50                   	push   %eax
    2cd2:	6a 01                	push   $0x1
    2cd4:	e8 da fc ff ff       	call   29b3 <send_rec>
    2cd9:	83 c4 10             	add    $0x10,%esp
    2cdc:	90                   	nop
    2cdd:	c9                   	leave  
    2cde:	c3                   	ret    

00002cdf <hd_cmd_out>:
    2cdf:	55                   	push   %ebp
    2ce0:	89 e5                	mov    %esp,%ebp
    2ce2:	83 ec 18             	sub    $0x18,%esp
    2ce5:	eb 29                	jmp    2d10 <hd_cmd_out+0x31>
    2ce7:	83 ec 0c             	sub    $0xc,%esp
    2cea:	68 f7 01 00 00       	push   $0x1f7
    2cef:	e8 de e5 ff ff       	call   12d2 <in_byte>
    2cf4:	83 c4 10             	add    $0x10,%esp
    2cf7:	0f b6 c0             	movzbl %al,%eax
    2cfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2cfd:	83 ec 08             	sub    $0x8,%esp
    2d00:	ff 75 f4             	pushl  -0xc(%ebp)
    2d03:	68 6a 68 00 00       	push   $0x686a
    2d08:	e8 02 f2 ff ff       	call   1f0f <Printf>
    2d0d:	83 c4 10             	add    $0x10,%esp
    2d10:	83 ec 0c             	sub    $0xc,%esp
    2d13:	68 f7 01 00 00       	push   $0x1f7
    2d18:	e8 b5 e5 ff ff       	call   12d2 <in_byte>
    2d1d:	83 c4 10             	add    $0x10,%esp
    2d20:	0f b6 c0             	movzbl %al,%eax
    2d23:	83 e0 01             	and    $0x1,%eax
    2d26:	85 c0                	test   %eax,%eax
    2d28:	75 bd                	jne    2ce7 <hd_cmd_out+0x8>
    2d2a:	83 ec 0c             	sub    $0xc,%esp
    2d2d:	68 f7 01 00 00       	push   $0x1f7
    2d32:	e8 9b e5 ff ff       	call   12d2 <in_byte>
    2d37:	83 c4 10             	add    $0x10,%esp
    2d3a:	0f b6 c0             	movzbl %al,%eax
    2d3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2d40:	83 ec 08             	sub    $0x8,%esp
    2d43:	ff 75 f0             	pushl  -0x10(%ebp)
    2d46:	68 74 68 00 00       	push   $0x6874
    2d4b:	e8 bf f1 ff ff       	call   1f0f <Printf>
    2d50:	83 c4 10             	add    $0x10,%esp
    2d53:	83 ec 08             	sub    $0x8,%esp
    2d56:	6a 00                	push   $0x0
    2d58:	68 f6 03 00 00       	push   $0x3f6
    2d5d:	e8 7c e5 ff ff       	call   12de <out_byte>
    2d62:	83 c4 10             	add    $0x10,%esp
    2d65:	83 ec 08             	sub    $0x8,%esp
    2d68:	6a 17                	push   $0x17
    2d6a:	68 7a 68 00 00       	push   $0x687a
    2d6f:	e8 9b f1 ff ff       	call   1f0f <Printf>
    2d74:	83 c4 10             	add    $0x10,%esp
    2d77:	8b 45 08             	mov    0x8(%ebp),%eax
    2d7a:	0f b6 00             	movzbl (%eax),%eax
    2d7d:	0f b6 c0             	movzbl %al,%eax
    2d80:	83 ec 08             	sub    $0x8,%esp
    2d83:	50                   	push   %eax
    2d84:	68 f1 01 00 00       	push   $0x1f1
    2d89:	e8 50 e5 ff ff       	call   12de <out_byte>
    2d8e:	83 c4 10             	add    $0x10,%esp
    2d91:	8b 45 08             	mov    0x8(%ebp),%eax
    2d94:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    2d98:	0f b6 c0             	movzbl %al,%eax
    2d9b:	83 ec 08             	sub    $0x8,%esp
    2d9e:	50                   	push   %eax
    2d9f:	68 f2 01 00 00       	push   $0x1f2
    2da4:	e8 35 e5 ff ff       	call   12de <out_byte>
    2da9:	83 c4 10             	add    $0x10,%esp
    2dac:	8b 45 08             	mov    0x8(%ebp),%eax
    2daf:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    2db3:	0f b6 c0             	movzbl %al,%eax
    2db6:	83 ec 08             	sub    $0x8,%esp
    2db9:	50                   	push   %eax
    2dba:	68 f3 01 00 00       	push   $0x1f3
    2dbf:	e8 1a e5 ff ff       	call   12de <out_byte>
    2dc4:	83 c4 10             	add    $0x10,%esp
    2dc7:	8b 45 08             	mov    0x8(%ebp),%eax
    2dca:	0f b6 40 03          	movzbl 0x3(%eax),%eax
    2dce:	0f b6 c0             	movzbl %al,%eax
    2dd1:	83 ec 08             	sub    $0x8,%esp
    2dd4:	50                   	push   %eax
    2dd5:	68 f4 01 00 00       	push   $0x1f4
    2dda:	e8 ff e4 ff ff       	call   12de <out_byte>
    2ddf:	83 c4 10             	add    $0x10,%esp
    2de2:	83 ec 08             	sub    $0x8,%esp
    2de5:	6a 17                	push   $0x17
    2de7:	68 7a 68 00 00       	push   $0x687a
    2dec:	e8 1e f1 ff ff       	call   1f0f <Printf>
    2df1:	83 c4 10             	add    $0x10,%esp
    2df4:	8b 45 08             	mov    0x8(%ebp),%eax
    2df7:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    2dfb:	0f b6 c0             	movzbl %al,%eax
    2dfe:	83 ec 08             	sub    $0x8,%esp
    2e01:	50                   	push   %eax
    2e02:	68 f5 01 00 00       	push   $0x1f5
    2e07:	e8 d2 e4 ff ff       	call   12de <out_byte>
    2e0c:	83 c4 10             	add    $0x10,%esp
    2e0f:	83 ec 08             	sub    $0x8,%esp
    2e12:	6a 17                	push   $0x17
    2e14:	68 7a 68 00 00       	push   $0x687a
    2e19:	e8 f1 f0 ff ff       	call   1f0f <Printf>
    2e1e:	83 c4 10             	add    $0x10,%esp
    2e21:	8b 45 08             	mov    0x8(%ebp),%eax
    2e24:	0f b6 40 05          	movzbl 0x5(%eax),%eax
    2e28:	0f b6 c0             	movzbl %al,%eax
    2e2b:	83 ec 08             	sub    $0x8,%esp
    2e2e:	50                   	push   %eax
    2e2f:	68 f6 01 00 00       	push   $0x1f6
    2e34:	e8 a5 e4 ff ff       	call   12de <out_byte>
    2e39:	83 c4 10             	add    $0x10,%esp
    2e3c:	83 ec 08             	sub    $0x8,%esp
    2e3f:	6a 17                	push   $0x17
    2e41:	68 7a 68 00 00       	push   $0x687a
    2e46:	e8 c4 f0 ff ff       	call   1f0f <Printf>
    2e4b:	83 c4 10             	add    $0x10,%esp
    2e4e:	8b 45 08             	mov    0x8(%ebp),%eax
    2e51:	0f b6 40 06          	movzbl 0x6(%eax),%eax
    2e55:	0f b6 c0             	movzbl %al,%eax
    2e58:	83 ec 08             	sub    $0x8,%esp
    2e5b:	50                   	push   %eax
    2e5c:	68 f7 01 00 00       	push   $0x1f7
    2e61:	e8 78 e4 ff ff       	call   12de <out_byte>
    2e66:	83 c4 10             	add    $0x10,%esp
    2e69:	83 ec 08             	sub    $0x8,%esp
    2e6c:	6a 17                	push   $0x17
    2e6e:	68 7a 68 00 00       	push   $0x687a
    2e73:	e8 97 f0 ff ff       	call   1f0f <Printf>
    2e78:	83 c4 10             	add    $0x10,%esp
    2e7b:	90                   	nop
    2e7c:	c9                   	leave  
    2e7d:	c3                   	ret    

00002e7e <hd_identify>:
    2e7e:	55                   	push   %ebp
    2e7f:	89 e5                	mov    %esp,%ebp
    2e81:	81 ec 18 04 00 00    	sub    $0x418,%esp
    2e87:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    2e8b:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
    2e8f:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    2e93:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
    2e97:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
    2e9b:	8b 45 08             	mov    0x8(%ebp),%eax
    2e9e:	c1 e0 04             	shl    $0x4,%eax
    2ea1:	83 c8 e0             	or     $0xffffffe0,%eax
    2ea4:	88 45 f6             	mov    %al,-0xa(%ebp)
    2ea7:	c6 45 f7 ec          	movb   $0xec,-0x9(%ebp)
    2eab:	83 ec 0c             	sub    $0xc,%esp
    2eae:	8d 45 f1             	lea    -0xf(%ebp),%eax
    2eb1:	50                   	push   %eax
    2eb2:	e8 28 fe ff ff       	call   2cdf <hd_cmd_out>
    2eb7:	83 c4 10             	add    $0x10,%esp
    2eba:	83 ec 0c             	sub    $0xc,%esp
    2ebd:	6a 01                	push   $0x1
    2ebf:	e8 9e ee ff ff       	call   1d62 <delay>
    2ec4:	83 c4 10             	add    $0x10,%esp
    2ec7:	83 ec 08             	sub    $0x8,%esp
    2eca:	68 81 68 00 00       	push   $0x6881
    2ecf:	68 11 68 00 00       	push   $0x6811
    2ed4:	e8 36 f0 ff ff       	call   1f0f <Printf>
    2ed9:	83 c4 10             	add    $0x10,%esp
    2edc:	83 ec 04             	sub    $0x4,%esp
    2edf:	68 00 04 00 00       	push   $0x400
    2ee4:	6a 00                	push   $0x0
    2ee6:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2eec:	50                   	push   %eax
    2eed:	e8 c3 3b 00 00       	call   6ab5 <Memset>
    2ef2:	83 c4 10             	add    $0x10,%esp
    2ef5:	83 ec 04             	sub    $0x4,%esp
    2ef8:	68 00 02 00 00       	push   $0x200
    2efd:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2f03:	50                   	push   %eax
    2f04:	68 f0 01 00 00       	push   $0x1f0
    2f09:	e8 fb 3b 00 00       	call   6b09 <read_port>
    2f0e:	83 c4 10             	add    $0x10,%esp
    2f11:	83 ec 0c             	sub    $0xc,%esp
    2f14:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2f1a:	50                   	push   %eax
    2f1b:	e8 32 00 00 00       	call   2f52 <print_hdinfo>
    2f20:	83 c4 10             	add    $0x10,%esp
    2f23:	83 ec 08             	sub    $0x8,%esp
    2f26:	68 8c 68 00 00       	push   $0x688c
    2f2b:	68 11 68 00 00       	push   $0x6811
    2f30:	e8 da ef ff ff       	call   1f0f <Printf>
    2f35:	83 c4 10             	add    $0x10,%esp
    2f38:	83 ec 08             	sub    $0x8,%esp
    2f3b:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    2f41:	50                   	push   %eax
    2f42:	68 98 68 00 00       	push   $0x6898
    2f47:	e8 c3 ef ff ff       	call   1f0f <Printf>
    2f4c:	83 c4 10             	add    $0x10,%esp
    2f4f:	90                   	nop
    2f50:	c9                   	leave  
    2f51:	c3                   	ret    

00002f52 <print_hdinfo>:
    2f52:	55                   	push   %ebp
    2f53:	89 e5                	mov    %esp,%ebp
    2f55:	81 ec 88 00 00 00    	sub    $0x88,%esp
    2f5b:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
    2f61:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
    2f67:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
    2f6e:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
    2f75:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
    2f7c:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
    2f83:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
    2f8a:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
    2f90:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
    2f96:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
    2f9d:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
    2fa4:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
    2fab:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    2fb2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    2fb9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2fc0:	e9 b8 00 00 00       	jmp    307d <print_hdinfo+0x12b>
    2fc5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2fcc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2fcf:	89 d0                	mov    %edx,%eax
    2fd1:	01 c0                	add    %eax,%eax
    2fd3:	01 d0                	add    %edx,%eax
    2fd5:	c1 e0 03             	shl    $0x3,%eax
    2fd8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    2fdb:	01 c8                	add    %ecx,%eax
    2fdd:	83 e8 44             	sub    $0x44,%eax
    2fe0:	0f b7 00             	movzwl (%eax),%eax
    2fe3:	0f b7 c0             	movzwl %ax,%eax
    2fe6:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2fe9:	8b 45 08             	mov    0x8(%ebp),%eax
    2fec:	01 d0                	add    %edx,%eax
    2fee:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2ff1:	eb 30                	jmp    3023 <print_hdinfo+0xd1>
    2ff3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ff6:	8d 50 01             	lea    0x1(%eax),%edx
    2ff9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    2ffc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2fff:	83 c2 01             	add    $0x1,%edx
    3002:	0f b6 00             	movzbl (%eax),%eax
    3005:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
    3009:	8b 45 ec             	mov    -0x14(%ebp),%eax
    300c:	8d 50 01             	lea    0x1(%eax),%edx
    300f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    3012:	0f b6 00             	movzbl (%eax),%eax
    3015:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
    3018:	8b 55 f0             	mov    -0x10(%ebp),%edx
    301b:	01 ca                	add    %ecx,%edx
    301d:	88 02                	mov    %al,(%edx)
    301f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3023:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3026:	89 d0                	mov    %edx,%eax
    3028:	01 c0                	add    %eax,%eax
    302a:	01 d0                	add    %edx,%eax
    302c:	c1 e0 03             	shl    $0x3,%eax
    302f:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3032:	01 c8                	add    %ecx,%eax
    3034:	83 e8 42             	sub    $0x42,%eax
    3037:	0f b7 00             	movzwl (%eax),%eax
    303a:	66 d1 e8             	shr    %ax
    303d:	0f b7 c0             	movzwl %ax,%eax
    3040:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    3043:	7c ae                	jl     2ff3 <print_hdinfo+0xa1>
    3045:	8d 55 81             	lea    -0x7f(%ebp),%edx
    3048:	8b 45 f0             	mov    -0x10(%ebp),%eax
    304b:	01 d0                	add    %edx,%eax
    304d:	c6 00 00             	movb   $0x0,(%eax)
    3050:	8d 4d b4             	lea    -0x4c(%ebp),%ecx
    3053:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3056:	89 d0                	mov    %edx,%eax
    3058:	01 c0                	add    %eax,%eax
    305a:	01 d0                	add    %edx,%eax
    305c:	c1 e0 03             	shl    $0x3,%eax
    305f:	01 c8                	add    %ecx,%eax
    3061:	8d 50 04             	lea    0x4(%eax),%edx
    3064:	83 ec 04             	sub    $0x4,%esp
    3067:	8d 45 81             	lea    -0x7f(%ebp),%eax
    306a:	50                   	push   %eax
    306b:	52                   	push   %edx
    306c:	68 a0 68 00 00       	push   $0x68a0
    3071:	e8 99 ee ff ff       	call   1f0f <Printf>
    3076:	83 c4 10             	add    $0x10,%esp
    3079:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    307d:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    3081:	0f 8e 3e ff ff ff    	jle    2fc5 <print_hdinfo+0x73>
    3087:	8b 45 08             	mov    0x8(%ebp),%eax
    308a:	0f b7 40 62          	movzwl 0x62(%eax),%eax
    308e:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    3092:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    3096:	66 c1 e8 08          	shr    $0x8,%ax
    309a:	66 85 c0             	test   %ax,%ax
    309d:	0f 95 c0             	setne  %al
    30a0:	88 45 e9             	mov    %al,-0x17(%ebp)
    30a3:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
    30aa:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
    30b0:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
    30b4:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
    30b8:	75 15                	jne    30cf <print_hdinfo+0x17d>
    30ba:	83 ec 08             	sub    $0x8,%esp
    30bd:	8d 45 ac             	lea    -0x54(%ebp),%eax
    30c0:	50                   	push   %eax
    30c1:	8d 45 b0             	lea    -0x50(%ebp),%eax
    30c4:	50                   	push   %eax
    30c5:	e8 0a 3a 00 00       	call   6ad4 <Strcpy>
    30ca:	83 c4 10             	add    $0x10,%esp
    30cd:	eb 13                	jmp    30e2 <print_hdinfo+0x190>
    30cf:	83 ec 08             	sub    $0x8,%esp
    30d2:	8d 45 a9             	lea    -0x57(%ebp),%eax
    30d5:	50                   	push   %eax
    30d6:	8d 45 b0             	lea    -0x50(%ebp),%eax
    30d9:	50                   	push   %eax
    30da:	e8 f5 39 00 00       	call   6ad4 <Strcpy>
    30df:	83 c4 10             	add    $0x10,%esp
    30e2:	83 ec 08             	sub    $0x8,%esp
    30e5:	8d 45 b0             	lea    -0x50(%ebp),%eax
    30e8:	50                   	push   %eax
    30e9:	68 a7 68 00 00       	push   $0x68a7
    30ee:	e8 1c ee ff ff       	call   1f0f <Printf>
    30f3:	83 c4 10             	add    $0x10,%esp
    30f6:	8b 45 08             	mov    0x8(%ebp),%eax
    30f9:	83 c0 7a             	add    $0x7a,%eax
    30fc:	0f b7 00             	movzwl (%eax),%eax
    30ff:	0f b7 d0             	movzwl %ax,%edx
    3102:	8b 45 08             	mov    0x8(%ebp),%eax
    3105:	83 c0 78             	add    $0x78,%eax
    3108:	0f b7 00             	movzwl (%eax),%eax
    310b:	0f b7 c0             	movzwl %ax,%eax
    310e:	83 c0 10             	add    $0x10,%eax
    3111:	89 c1                	mov    %eax,%ecx
    3113:	d3 e2                	shl    %cl,%edx
    3115:	89 d0                	mov    %edx,%eax
    3117:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    311a:	83 ec 08             	sub    $0x8,%esp
    311d:	ff 75 e4             	pushl  -0x1c(%ebp)
    3120:	68 b7 68 00 00       	push   $0x68b7
    3125:	e8 e5 ed ff ff       	call   1f0f <Printf>
    312a:	83 c4 10             	add    $0x10,%esp
    312d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3130:	89 c2                	mov    %eax,%edx
    3132:	c1 ea 1f             	shr    $0x1f,%edx
    3135:	01 d0                	add    %edx,%eax
    3137:	d1 f8                	sar    %eax
    3139:	c1 e0 0a             	shl    $0xa,%eax
    313c:	83 ec 08             	sub    $0x8,%esp
    313f:	50                   	push   %eax
    3140:	68 ca 68 00 00       	push   $0x68ca
    3145:	e8 c5 ed ff ff       	call   1f0f <Printf>
    314a:	83 c4 10             	add    $0x10,%esp
    314d:	90                   	nop
    314e:	c9                   	leave  
    314f:	c3                   	ret    

00003150 <print_dpt_entry>:
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	83 ec 08             	sub    $0x8,%esp
    3156:	8b 45 08             	mov    0x8(%ebp),%eax
    3159:	0f b6 40 04          	movzbl 0x4(%eax),%eax
    315d:	0f b6 c0             	movzbl %al,%eax
    3160:	83 ec 08             	sub    $0x8,%esp
    3163:	50                   	push   %eax
    3164:	68 d7 68 00 00       	push   $0x68d7
    3169:	e8 a1 ed ff ff       	call   1f0f <Printf>
    316e:	83 c4 10             	add    $0x10,%esp
    3171:	90                   	nop
    3172:	c9                   	leave  
    3173:	c3                   	ret    

00003174 <get_partition_table>:
    3174:	55                   	push   %ebp
    3175:	89 e5                	mov    %esp,%ebp
    3177:	81 ec 18 04 00 00    	sub    $0x418,%esp
    317d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    3181:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
    3185:	8b 45 0c             	mov    0xc(%ebp),%eax
    3188:	88 45 f3             	mov    %al,-0xd(%ebp)
    318b:	8b 45 0c             	mov    0xc(%ebp),%eax
    318e:	c1 f8 08             	sar    $0x8,%eax
    3191:	88 45 f4             	mov    %al,-0xc(%ebp)
    3194:	8b 45 0c             	mov    0xc(%ebp),%eax
    3197:	c1 f8 10             	sar    $0x10,%eax
    319a:	88 45 f5             	mov    %al,-0xb(%ebp)
    319d:	8b 45 0c             	mov    0xc(%ebp),%eax
    31a0:	c1 f8 18             	sar    $0x18,%eax
    31a3:	89 c2                	mov    %eax,%edx
    31a5:	8b 45 08             	mov    0x8(%ebp),%eax
    31a8:	c1 e0 04             	shl    $0x4,%eax
    31ab:	09 d0                	or     %edx,%eax
    31ad:	83 c8 e0             	or     $0xffffffe0,%eax
    31b0:	88 45 f6             	mov    %al,-0xa(%ebp)
    31b3:	c6 45 f7 20          	movb   $0x20,-0x9(%ebp)
    31b7:	83 ec 0c             	sub    $0xc,%esp
    31ba:	8d 45 f1             	lea    -0xf(%ebp),%eax
    31bd:	50                   	push   %eax
    31be:	e8 1c fb ff ff       	call   2cdf <hd_cmd_out>
    31c3:	83 c4 10             	add    $0x10,%esp
    31c6:	83 ec 0c             	sub    $0xc,%esp
    31c9:	68 f4 01 00 00       	push   $0x1f4
    31ce:	e8 8f eb ff ff       	call   1d62 <delay>
    31d3:	83 c4 10             	add    $0x10,%esp
    31d6:	83 ec 04             	sub    $0x4,%esp
    31d9:	68 00 04 00 00       	push   $0x400
    31de:	6a 00                	push   $0x0
    31e0:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    31e6:	50                   	push   %eax
    31e7:	e8 c9 38 00 00       	call   6ab5 <Memset>
    31ec:	83 c4 10             	add    $0x10,%esp
    31ef:	83 ec 04             	sub    $0x4,%esp
    31f2:	68 00 02 00 00       	push   $0x200
    31f7:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    31fd:	50                   	push   %eax
    31fe:	68 f0 01 00 00       	push   $0x1f0
    3203:	e8 01 39 00 00       	call   6b09 <read_port>
    3208:	83 c4 10             	add    $0x10,%esp
    320b:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
    3211:	05 be 01 00 00       	add    $0x1be,%eax
    3216:	83 ec 04             	sub    $0x4,%esp
    3219:	6a 40                	push   $0x40
    321b:	50                   	push   %eax
    321c:	ff 75 10             	pushl  0x10(%ebp)
    321f:	e8 63 38 00 00       	call   6a87 <Memcpy>
    3224:	83 c4 10             	add    $0x10,%esp
    3227:	90                   	nop
    3228:	c9                   	leave  
    3229:	c3                   	ret    

0000322a <partition>:
    322a:	55                   	push   %ebp
    322b:	89 e5                	mov    %esp,%ebp
    322d:	81 ec 98 00 00 00    	sub    $0x98,%esp
    3233:	8b 45 0c             	mov    0xc(%ebp),%eax
    3236:	88 85 74 ff ff ff    	mov    %al,-0x8c(%ebp)
    323c:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    3240:	7f 19                	jg     325b <partition+0x31>
    3242:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3245:	ba 67 66 66 66       	mov    $0x66666667,%edx
    324a:	89 c8                	mov    %ecx,%eax
    324c:	f7 ea                	imul   %edx
    324e:	d1 fa                	sar    %edx
    3250:	89 c8                	mov    %ecx,%eax
    3252:	c1 f8 1f             	sar    $0x1f,%eax
    3255:	29 c2                	sub    %eax,%edx
    3257:	89 d0                	mov    %edx,%eax
    3259:	eb 11                	jmp    326c <partition+0x42>
    325b:	8b 45 08             	mov    0x8(%ebp),%eax
    325e:	83 e8 10             	sub    $0x10,%eax
    3261:	8d 50 3f             	lea    0x3f(%eax),%edx
    3264:	85 c0                	test   %eax,%eax
    3266:	0f 48 c2             	cmovs  %edx,%eax
    3269:	c1 f8 06             	sar    $0x6,%eax
    326c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    326f:	80 bd 74 ff ff ff 00 	cmpb   $0x0,-0x8c(%ebp)
    3276:	0f 85 cc 00 00 00    	jne    3348 <partition+0x11e>
    327c:	83 ec 04             	sub    $0x4,%esp
    327f:	6a 50                	push   $0x50
    3281:	6a 00                	push   $0x0
    3283:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3286:	50                   	push   %eax
    3287:	e8 29 38 00 00       	call   6ab5 <Memset>
    328c:	83 c4 10             	add    $0x10,%esp
    328f:	83 ec 04             	sub    $0x4,%esp
    3292:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3295:	50                   	push   %eax
    3296:	6a 00                	push   $0x0
    3298:	ff 75 e8             	pushl  -0x18(%ebp)
    329b:	e8 d4 fe ff ff       	call   3174 <get_partition_table>
    32a0:	83 c4 10             	add    $0x10,%esp
    32a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    32aa:	e9 8a 00 00 00       	jmp    3339 <partition+0x10f>
    32af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b2:	83 c0 01             	add    $0x1,%eax
    32b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    32b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32bb:	c1 e0 04             	shl    $0x4,%eax
    32be:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    32c1:	01 c8                	add    %ecx,%eax
    32c3:	83 e8 6c             	sub    $0x6c,%eax
    32c6:	8b 00                	mov    (%eax),%eax
    32c8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    32cb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    32ce:	c1 e1 03             	shl    $0x3,%ecx
    32d1:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    32d7:	01 ca                	add    %ecx,%edx
    32d9:	81 c2 e4 d4 00 00    	add    $0xd4e4,%edx
    32df:	89 02                	mov    %eax,(%edx)
    32e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32e4:	c1 e0 04             	shl    $0x4,%eax
    32e7:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    32ea:	01 c8                	add    %ecx,%eax
    32ec:	83 e8 68             	sub    $0x68,%eax
    32ef:	8b 00                	mov    (%eax),%eax
    32f1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    32f4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    32f7:	c1 e1 03             	shl    $0x3,%ecx
    32fa:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    3300:	01 ca                	add    %ecx,%edx
    3302:	81 c2 e8 d4 00 00    	add    $0xd4e8,%edx
    3308:	89 02                	mov    %eax,(%edx)
    330a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    330d:	c1 e0 04             	shl    $0x4,%eax
    3310:	8d 4d f8             	lea    -0x8(%ebp),%ecx
    3313:	01 c8                	add    %ecx,%eax
    3315:	83 e8 70             	sub    $0x70,%eax
    3318:	0f b6 00             	movzbl (%eax),%eax
    331b:	3c 05                	cmp    $0x5,%al
    331d:	75 16                	jne    3335 <partition+0x10b>
    331f:	8b 55 08             	mov    0x8(%ebp),%edx
    3322:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3325:	01 d0                	add    %edx,%eax
    3327:	83 ec 08             	sub    $0x8,%esp
    332a:	6a 01                	push   $0x1
    332c:	50                   	push   %eax
    332d:	e8 f8 fe ff ff       	call   322a <partition>
    3332:	83 c4 10             	add    $0x10,%esp
    3335:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3339:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    333d:	0f 8e 6c ff ff ff    	jle    32af <partition+0x85>
    3343:	e9 28 01 00 00       	jmp    3470 <partition+0x246>
    3348:	80 bd 74 ff ff ff 01 	cmpb   $0x1,-0x8c(%ebp)
    334f:	0f 85 03 01 00 00    	jne    3458 <partition+0x22e>
    3355:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3358:	ba 67 66 66 66       	mov    $0x66666667,%edx
    335d:	89 c8                	mov    %ecx,%eax
    335f:	f7 ea                	imul   %edx
    3361:	d1 fa                	sar    %edx
    3363:	89 c8                	mov    %ecx,%eax
    3365:	c1 f8 1f             	sar    $0x1f,%eax
    3368:	29 c2                	sub    %eax,%edx
    336a:	89 d0                	mov    %edx,%eax
    336c:	c1 e0 02             	shl    $0x2,%eax
    336f:	01 d0                	add    %edx,%eax
    3371:	29 c1                	sub    %eax,%ecx
    3373:	89 c8                	mov    %ecx,%eax
    3375:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3378:	8b 55 e0             	mov    -0x20(%ebp),%edx
    337b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    337e:	c1 e2 03             	shl    $0x3,%edx
    3381:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3387:	01 d0                	add    %edx,%eax
    3389:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    338e:	8b 00                	mov    (%eax),%eax
    3390:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3393:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3396:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3399:	8b 45 e0             	mov    -0x20(%ebp),%eax
    339c:	83 e8 01             	sub    $0x1,%eax
    339f:	c1 e0 04             	shl    $0x4,%eax
    33a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    33a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    33ac:	e9 9b 00 00 00       	jmp    344c <partition+0x222>
    33b1:	83 ec 04             	sub    $0x4,%esp
    33b4:	6a 50                	push   $0x50
    33b6:	6a 00                	push   $0x0
    33b8:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33bb:	50                   	push   %eax
    33bc:	e8 f4 36 00 00       	call   6ab5 <Memset>
    33c1:	83 c4 10             	add    $0x10,%esp
    33c4:	83 ec 04             	sub    $0x4,%esp
    33c7:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33ca:	50                   	push   %eax
    33cb:	ff 75 f0             	pushl  -0x10(%ebp)
    33ce:	ff 75 e8             	pushl  -0x18(%ebp)
    33d1:	e8 9e fd ff ff       	call   3174 <get_partition_table>
    33d6:	83 c4 10             	add    $0x10,%esp
    33d9:	83 ec 0c             	sub    $0xc,%esp
    33dc:	8d 45 84             	lea    -0x7c(%ebp),%eax
    33df:	50                   	push   %eax
    33e0:	e8 6b fd ff ff       	call   3150 <print_dpt_entry>
    33e5:	83 c4 10             	add    $0x10,%esp
    33e8:	8b 55 d8             	mov    -0x28(%ebp),%edx
    33eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33ee:	01 d0                	add    %edx,%eax
    33f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    33f3:	8b 55 8c             	mov    -0x74(%ebp),%edx
    33f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33f9:	01 c2                	add    %eax,%edx
    33fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    33fe:	8d 48 04             	lea    0x4(%eax),%ecx
    3401:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3404:	c1 e1 03             	shl    $0x3,%ecx
    3407:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    340d:	01 c8                	add    %ecx,%eax
    340f:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    3414:	89 10                	mov    %edx,(%eax)
    3416:	8b 45 90             	mov    -0x70(%ebp),%eax
    3419:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    341c:	8d 4a 04             	lea    0x4(%edx),%ecx
    341f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3422:	c1 e1 03             	shl    $0x3,%ecx
    3425:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
    342b:	01 ca                	add    %ecx,%edx
    342d:	81 c2 e8 d4 00 00    	add    $0xd4e8,%edx
    3433:	89 02                	mov    %eax,(%edx)
    3435:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
    3439:	84 c0                	test   %al,%al
    343b:	74 32                	je     346f <partition+0x245>
    343d:	8b 55 9c             	mov    -0x64(%ebp),%edx
    3440:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3443:	01 d0                	add    %edx,%eax
    3445:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3448:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    344c:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
    3450:	0f 8e 5b ff ff ff    	jle    33b1 <partition+0x187>
    3456:	eb 18                	jmp    3470 <partition+0x246>
    3458:	83 ec 08             	sub    $0x8,%esp
    345b:	68 e5 68 00 00       	push   $0x68e5
    3460:	68 11 68 00 00       	push   $0x6811
    3465:	e8 a5 ea ff ff       	call   1f0f <Printf>
    346a:	83 c4 10             	add    $0x10,%esp
    346d:	eb 01                	jmp    3470 <partition+0x246>
    346f:	90                   	nop
    3470:	90                   	nop
    3471:	c9                   	leave  
    3472:	c3                   	ret    

00003473 <hd_open>:
    3473:	55                   	push   %ebp
    3474:	89 e5                	mov    %esp,%ebp
    3476:	83 ec 18             	sub    $0x18,%esp
    3479:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3480:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3483:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3489:	05 e0 d4 00 00       	add    $0xd4e0,%eax
    348e:	8b 00                	mov    (%eax),%eax
    3490:	8d 50 01             	lea    0x1(%eax),%edx
    3493:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3496:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    349c:	05 e0 d4 00 00       	add    $0xd4e0,%eax
    34a1:	89 10                	mov    %edx,(%eax)
    34a3:	83 ec 08             	sub    $0x8,%esp
    34a6:	6a 00                	push   $0x0
    34a8:	6a 00                	push   $0x0
    34aa:	e8 7b fd ff ff       	call   322a <partition>
    34af:	83 c4 10             	add    $0x10,%esp
    34b2:	83 ec 0c             	sub    $0xc,%esp
    34b5:	6a 02                	push   $0x2
    34b7:	e8 1b 00 00 00       	call   34d7 <get_hd_ioctl>
    34bc:	83 c4 10             	add    $0x10,%esp
    34bf:	83 ec 08             	sub    $0x8,%esp
    34c2:	68 f0 68 00 00       	push   $0x68f0
    34c7:	68 11 68 00 00       	push   $0x6811
    34cc:	e8 3e ea ff ff       	call   1f0f <Printf>
    34d1:	83 c4 10             	add    $0x10,%esp
    34d4:	90                   	nop
    34d5:	c9                   	leave  
    34d6:	c3                   	ret    

000034d7 <get_hd_ioctl>:
    34d7:	55                   	push   %ebp
    34d8:	89 e5                	mov    %esp,%ebp
    34da:	83 ec 18             	sub    $0x18,%esp
    34dd:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
    34e1:	7f 19                	jg     34fc <get_hd_ioctl+0x25>
    34e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    34e6:	ba 67 66 66 66       	mov    $0x66666667,%edx
    34eb:	89 c8                	mov    %ecx,%eax
    34ed:	f7 ea                	imul   %edx
    34ef:	d1 fa                	sar    %edx
    34f1:	89 c8                	mov    %ecx,%eax
    34f3:	c1 f8 1f             	sar    $0x1f,%eax
    34f6:	29 c2                	sub    %eax,%edx
    34f8:	89 d0                	mov    %edx,%eax
    34fa:	eb 11                	jmp    350d <get_hd_ioctl+0x36>
    34fc:	8b 45 08             	mov    0x8(%ebp),%eax
    34ff:	83 e8 10             	sub    $0x10,%eax
    3502:	8d 50 3f             	lea    0x3f(%eax),%edx
    3505:	85 c0                	test   %eax,%eax
    3507:	0f 48 c2             	cmovs  %edx,%eax
    350a:	c1 f8 06             	sar    $0x6,%eax
    350d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3510:	8b 55 08             	mov    0x8(%ebp),%edx
    3513:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3516:	c1 e2 03             	shl    $0x3,%edx
    3519:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    351f:	01 d0                	add    %edx,%eax
    3521:	05 e8 d4 00 00       	add    $0xd4e8,%eax
    3526:	8b 00                	mov    (%eax),%eax
    3528:	89 45 f0             	mov    %eax,-0x10(%ebp)
    352b:	83 ec 08             	sub    $0x8,%esp
    352e:	ff 75 f0             	pushl  -0x10(%ebp)
    3531:	68 f5 68 00 00       	push   $0x68f5
    3536:	e8 d4 e9 ff ff       	call   1f0f <Printf>
    353b:	83 c4 10             	add    $0x10,%esp
    353e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3541:	c9                   	leave  
    3542:	c3                   	ret    

00003543 <wait_for>:
    3543:	55                   	push   %ebp
    3544:	89 e5                	mov    %esp,%ebp
    3546:	83 ec 08             	sub    $0x8,%esp
    3549:	83 ec 0c             	sub    $0xc,%esp
    354c:	6a 04                	push   $0x4
    354e:	e8 0f e8 ff ff       	call   1d62 <delay>
    3553:	83 c4 10             	add    $0x10,%esp
    3556:	90                   	nop
    3557:	c9                   	leave  
    3558:	c3                   	ret    

00003559 <interrupt_wait>:
    3559:	55                   	push   %ebp
    355a:	89 e5                	mov    %esp,%ebp
    355c:	83 ec 08             	sub    $0x8,%esp
    355f:	83 ec 0c             	sub    $0xc,%esp
    3562:	6a 04                	push   $0x4
    3564:	e8 f9 e7 ff ff       	call   1d62 <delay>
    3569:	83 c4 10             	add    $0x10,%esp
    356c:	90                   	nop
    356d:	c9                   	leave  
    356e:	c3                   	ret    

0000356f <hd_rdwt>:
    356f:	55                   	push   %ebp
    3570:	89 e5                	mov    %esp,%ebp
    3572:	53                   	push   %ebx
    3573:	83 ec 44             	sub    $0x44,%esp
    3576:	8b 45 08             	mov    0x8(%ebp),%eax
    3579:	8b 40 18             	mov    0x18(%eax),%eax
    357c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    357f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    3586:	8b 45 08             	mov    0x8(%ebp),%eax
    3589:	8b 40 14             	mov    0x14(%eax),%eax
    358c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    358f:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
    3593:	7f 19                	jg     35ae <hd_rdwt+0x3f>
    3595:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3598:	ba 67 66 66 66       	mov    $0x66666667,%edx
    359d:	89 c8                	mov    %ecx,%eax
    359f:	f7 ea                	imul   %edx
    35a1:	d1 fa                	sar    %edx
    35a3:	89 c8                	mov    %ecx,%eax
    35a5:	c1 f8 1f             	sar    $0x1f,%eax
    35a8:	29 c2                	sub    %eax,%edx
    35aa:	89 d0                	mov    %edx,%eax
    35ac:	eb 11                	jmp    35bf <hd_rdwt+0x50>
    35ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35b1:	83 e8 10             	sub    $0x10,%eax
    35b4:	8d 50 3f             	lea    0x3f(%eax),%edx
    35b7:	85 c0                	test   %eax,%eax
    35b9:	0f 48 c2             	cmovs  %edx,%eax
    35bc:	c1 f8 06             	sar    $0x6,%eax
    35bf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    35c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35c5:	8d 50 f0             	lea    -0x10(%eax),%edx
    35c8:	89 d0                	mov    %edx,%eax
    35ca:	c1 f8 1f             	sar    $0x1f,%eax
    35cd:	c1 e8 1a             	shr    $0x1a,%eax
    35d0:	01 c2                	add    %eax,%edx
    35d2:	83 e2 3f             	and    $0x3f,%edx
    35d5:	29 c2                	sub    %eax,%edx
    35d7:	89 d0                	mov    %edx,%eax
    35d9:	89 45 dc             	mov    %eax,-0x24(%ebp)
    35dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35df:	8b 55 ec             	mov    -0x14(%ebp),%edx
    35e2:	0f ac d0 09          	shrd   $0x9,%edx,%eax
    35e6:	c1 ea 09             	shr    $0x9,%edx
    35e9:	89 c1                	mov    %eax,%ecx
    35eb:	89 d3                	mov    %edx,%ebx
    35ed:	89 4d d8             	mov    %ecx,-0x28(%ebp)
    35f0:	83 7d e4 08          	cmpl   $0x8,-0x1c(%ebp)
    35f4:	7f 1a                	jg     3610 <hd_rdwt+0xa1>
    35f6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    35f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35fc:	c1 e2 03             	shl    $0x3,%edx
    35ff:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3605:	01 d0                	add    %edx,%eax
    3607:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    360c:	8b 00                	mov    (%eax),%eax
    360e:	eb 1b                	jmp    362b <hd_rdwt+0xbc>
    3610:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3613:	8d 50 04             	lea    0x4(%eax),%edx
    3616:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3619:	c1 e2 03             	shl    $0x3,%edx
    361c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
    3622:	01 d0                	add    %edx,%eax
    3624:	05 e4 d4 00 00       	add    $0xd4e4,%eax
    3629:	8b 00                	mov    (%eax),%eax
    362b:	8b 55 d8             	mov    -0x28(%ebp),%edx
    362e:	01 d0                	add    %edx,%eax
    3630:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3633:	8b 45 08             	mov    0x8(%ebp),%eax
    3636:	8b 40 0c             	mov    0xc(%eax),%eax
    3639:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    363c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    363f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3642:	8b 45 08             	mov    0x8(%ebp),%eax
    3645:	8b 40 10             	mov    0x10(%eax),%eax
    3648:	89 45 d0             	mov    %eax,-0x30(%ebp)
    364b:	8b 45 08             	mov    0x8(%ebp),%eax
    364e:	8b 00                	mov    (%eax),%eax
    3650:	89 45 cc             	mov    %eax,-0x34(%ebp)
    3653:	83 ec 08             	sub    $0x8,%esp
    3656:	ff 75 d0             	pushl  -0x30(%ebp)
    3659:	ff 75 cc             	pushl  -0x34(%ebp)
    365c:	e8 15 1b 00 00       	call   5176 <v2l>
    3661:	83 c4 10             	add    $0x10,%esp
    3664:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3667:	8b 45 08             	mov    0x8(%ebp),%eax
    366a:	8b 40 04             	mov    0x4(%eax),%eax
    366d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    3670:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    3674:	74 22                	je     3698 <hd_rdwt+0x129>
    3676:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    367a:	74 1c                	je     3698 <hd_rdwt+0x129>
    367c:	68 61 01 00 00       	push   $0x161
    3681:	68 02 69 00 00       	push   $0x6902
    3686:	68 02 69 00 00       	push   $0x6902
    368b:	68 0a 69 00 00       	push   $0x690a
    3690:	e8 c7 eb ff ff       	call   225c <assertion_failure>
    3695:	83 c4 10             	add    $0x10,%esp
    3698:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
    369c:	c6 45 be 01          	movb   $0x1,-0x42(%ebp)
    36a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    36a3:	88 45 bf             	mov    %al,-0x41(%ebp)
    36a6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    36a9:	c1 f8 08             	sar    $0x8,%eax
    36ac:	88 45 c0             	mov    %al,-0x40(%ebp)
    36af:	8b 45 d8             	mov    -0x28(%ebp),%eax
    36b2:	c1 f8 10             	sar    $0x10,%eax
    36b5:	88 45 c1             	mov    %al,-0x3f(%ebp)
    36b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36bb:	c1 f8 18             	sar    $0x18,%eax
    36be:	89 c2                	mov    %eax,%edx
    36c0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    36c3:	c1 e0 04             	shl    $0x4,%eax
    36c6:	09 d0                	or     %edx,%eax
    36c8:	83 c8 e0             	or     $0xffffffe0,%eax
    36cb:	88 45 c2             	mov    %al,-0x3e(%ebp)
    36ce:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    36d2:	75 07                	jne    36db <hd_rdwt+0x16c>
    36d4:	b8 20 00 00 00       	mov    $0x20,%eax
    36d9:	eb 05                	jmp    36e0 <hd_rdwt+0x171>
    36db:	b8 30 00 00 00       	mov    $0x30,%eax
    36e0:	88 45 c3             	mov    %al,-0x3d(%ebp)
    36e3:	83 ec 0c             	sub    $0xc,%esp
    36e6:	8d 45 bd             	lea    -0x43(%ebp),%eax
    36e9:	50                   	push   %eax
    36ea:	e8 f0 f5 ff ff       	call   2cdf <hd_cmd_out>
    36ef:	83 c4 10             	add    $0x10,%esp
    36f2:	eb 6e                	jmp    3762 <hd_rdwt+0x1f3>
    36f4:	b8 00 02 00 00       	mov    $0x200,%eax
    36f9:	81 7d d4 00 02 00 00 	cmpl   $0x200,-0x2c(%ebp)
    3700:	0f 4e 45 d4          	cmovle -0x2c(%ebp),%eax
    3704:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3707:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
    370b:	75 1f                	jne    372c <hd_rdwt+0x1bd>
    370d:	e8 47 fe ff ff       	call   3559 <interrupt_wait>
    3712:	83 ec 04             	sub    $0x4,%esp
    3715:	68 00 02 00 00       	push   $0x200
    371a:	ff 75 f0             	pushl  -0x10(%ebp)
    371d:	68 f0 01 00 00       	push   $0x1f0
    3722:	e8 e2 33 00 00       	call   6b09 <read_port>
    3727:	83 c4 10             	add    $0x10,%esp
    372a:	eb 28                	jmp    3754 <hd_rdwt+0x1e5>
    372c:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
    3730:	75 22                	jne    3754 <hd_rdwt+0x1e5>
    3732:	e8 0c fe ff ff       	call   3543 <wait_for>
    3737:	83 ec 04             	sub    $0x4,%esp
    373a:	68 00 02 00 00       	push   $0x200
    373f:	ff 75 f0             	pushl  -0x10(%ebp)
    3742:	68 f0 01 00 00       	push   $0x1f0
    3747:	e8 d1 33 00 00       	call   6b1d <write_port>
    374c:	83 c4 10             	add    $0x10,%esp
    374f:	e8 05 fe ff ff       	call   3559 <interrupt_wait>
    3754:	81 6d f4 00 02 00 00 	subl   $0x200,-0xc(%ebp)
    375b:	81 45 f0 00 02 00 00 	addl   $0x200,-0x10(%ebp)
    3762:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3766:	75 8c                	jne    36f4 <hd_rdwt+0x185>
    3768:	90                   	nop
    3769:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    376c:	c9                   	leave  
    376d:	c3                   	ret    
    376e:	66 90                	xchg   %ax,%ax

00003770 <get_ticks>:
    3770:	b8 00 00 00 00       	mov    $0x0,%eax
    3775:	cd 90                	int    $0x90
    3777:	c3                   	ret    

00003778 <write2>:
    3778:	b8 01 00 00 00       	mov    $0x1,%eax
    377d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    3781:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3785:	cd 90                	int    $0x90
    3787:	c3                   	ret    

00003788 <write_debug>:
    3788:	b8 02 00 00 00       	mov    $0x2,%eax
    378d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    3791:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3795:	cd 90                	int    $0x90
    3797:	c3                   	ret    

00003798 <send_msg>:
    3798:	b8 03 00 00 00       	mov    $0x3,%eax
    379d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    37a1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    37a5:	cd 90                	int    $0x90
    37a7:	c3                   	ret    

000037a8 <receive_msg>:
    37a8:	b8 04 00 00 00       	mov    $0x4,%eax
    37ad:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    37b1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    37b5:	cd 90                	int    $0x90
    37b7:	c3                   	ret    

000037b8 <task_fs>:
    37b8:	55                   	push   %ebp
    37b9:	89 e5                	mov    %esp,%ebp
    37bb:	81 ec f8 00 00 00    	sub    $0xf8,%esp
    37c1:	83 ec 08             	sub    $0x8,%esp
    37c4:	68 2c 69 00 00       	push   $0x692c
    37c9:	68 3a 69 00 00       	push   $0x693a
    37ce:	e8 3c e7 ff ff       	call   1f0f <Printf>
    37d3:	83 c4 10             	add    $0x10,%esp
    37d6:	83 ec 04             	sub    $0x4,%esp
    37d9:	6a 11                	push   $0x11
    37db:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
    37e1:	50                   	push   %eax
    37e2:	6a 02                	push   $0x2
    37e4:	e8 ca f1 ff ff       	call   29b3 <send_rec>
    37e9:	83 c4 10             	add    $0x10,%esp
    37ec:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
    37f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    37f5:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
    37fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    37fe:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
    3804:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3807:	8b 85 48 ff ff ff    	mov    -0xb8(%ebp),%eax
    380d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3810:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    3816:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3819:	8b 45 f0             	mov    -0x10(%ebp),%eax
    381c:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
    3822:	05 20 4f 01 00       	add    $0x14f20,%eax
    3827:	a3 a4 a2 00 00       	mov    %eax,0xa2a4
    382c:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    3830:	74 1c                	je     384e <task_fs+0x96>
    3832:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    3836:	7f 08                	jg     3840 <task_fs+0x88>
    3838:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    383c:	74 3a                	je     3878 <task_fs+0xc0>
    383e:	eb 48                	jmp    3888 <task_fs+0xd0>
    3840:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3844:	74 1e                	je     3864 <task_fs+0xac>
    3846:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
    384a:	74 18                	je     3864 <task_fs+0xac>
    384c:	eb 3a                	jmp    3888 <task_fs+0xd0>
    384e:	83 ec 08             	sub    $0x8,%esp
    3851:	ff 75 e4             	pushl  -0x1c(%ebp)
    3854:	ff 75 e8             	pushl  -0x18(%ebp)
    3857:	e8 f4 03 00 00       	call   3c50 <do_open>
    385c:	83 c4 10             	add    $0x10,%esp
    385f:	89 45 bc             	mov    %eax,-0x44(%ebp)
    3862:	eb 35                	jmp    3899 <task_fs+0xe1>
    3864:	83 ec 0c             	sub    $0xc,%esp
    3867:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
    386d:	50                   	push   %eax
    386e:	e8 5f 12 00 00       	call   4ad2 <do_rdwt>
    3873:	83 c4 10             	add    $0x10,%esp
    3876:	eb 21                	jmp    3899 <task_fs+0xe1>
    3878:	83 ec 0c             	sub    $0xc,%esp
    387b:	ff 75 ec             	pushl  -0x14(%ebp)
    387e:	e8 28 16 00 00       	call   4eab <do_close>
    3883:	83 c4 10             	add    $0x10,%esp
    3886:	eb 11                	jmp    3899 <task_fs+0xe1>
    3888:	83 ec 0c             	sub    $0xc,%esp
    388b:	68 3e 69 00 00       	push   $0x693e
    3890:	e8 a9 e9 ff ff       	call   223e <panic>
    3895:	83 c4 10             	add    $0x10,%esp
    3898:	90                   	nop
    3899:	c7 45 80 65 00 00 00 	movl   $0x65,-0x80(%ebp)
    38a0:	83 ec 04             	sub    $0x4,%esp
    38a3:	ff 75 f0             	pushl  -0x10(%ebp)
    38a6:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
    38ac:	50                   	push   %eax
    38ad:	6a 01                	push   $0x1
    38af:	e8 ff f0 ff ff       	call   29b3 <send_rec>
    38b4:	83 c4 10             	add    $0x10,%esp
    38b7:	e9 1a ff ff ff       	jmp    37d6 <task_fs+0x1e>

000038bc <rd_wt>:
    38bc:	55                   	push   %ebp
    38bd:	89 e5                	mov    %esp,%ebp
    38bf:	83 ec 78             	sub    $0x78,%esp
    38c2:	83 ec 04             	sub    $0x4,%esp
    38c5:	6a 68                	push   $0x68
    38c7:	6a 00                	push   $0x0
    38c9:	8d 45 90             	lea    -0x70(%ebp),%eax
    38cc:	50                   	push   %eax
    38cd:	e8 e3 31 00 00       	call   6ab5 <Memset>
    38d2:	83 c4 10             	add    $0x10,%esp
    38d5:	8b 45 18             	mov    0x18(%ebp),%eax
    38d8:	89 45 94             	mov    %eax,-0x6c(%ebp)
    38db:	8b 45 0c             	mov    0xc(%ebp),%eax
    38de:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    38e1:	8b 45 10             	mov    0x10(%ebp),%eax
    38e4:	89 45 a0             	mov    %eax,-0x60(%ebp)
    38e7:	8b 45 14             	mov    0x14(%ebp),%eax
    38ea:	89 45 9c             	mov    %eax,-0x64(%ebp)
    38ed:	8b 45 08             	mov    0x8(%ebp),%eax
    38f0:	89 45 a8             	mov    %eax,-0x58(%ebp)
    38f3:	c7 45 90 03 00 00 00 	movl   $0x3,-0x70(%ebp)
    38fa:	83 ec 04             	sub    $0x4,%esp
    38fd:	6a 02                	push   $0x2
    38ff:	8d 45 90             	lea    -0x70(%ebp),%eax
    3902:	50                   	push   %eax
    3903:	6a 03                	push   $0x3
    3905:	e8 a9 f0 ff ff       	call   29b3 <send_rec>
    390a:	83 c4 10             	add    $0x10,%esp
    390d:	90                   	nop
    390e:	c9                   	leave  
    390f:	c3                   	ret    

00003910 <mkfs>:
    3910:	55                   	push   %ebp
    3911:	89 e5                	mov    %esp,%ebp
    3913:	83 ec 78             	sub    $0x78,%esp
    3916:	83 ec 04             	sub    $0x4,%esp
    3919:	68 00 02 00 00       	push   $0x200
    391e:	6a 00                	push   $0x0
    3920:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    3923:	50                   	push   %eax
    3924:	e8 8c 31 00 00       	call   6ab5 <Memset>
    3929:	83 c4 10             	add    $0x10,%esp
    392c:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
    3933:	c7 45 cc 00 40 00 00 	movl   $0x4000,-0x34(%ebp)
    393a:	c7 45 d0 80 00 00 00 	movl   $0x80,-0x30(%ebp)
    3941:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3944:	8d 50 02             	lea    0x2(%eax),%edx
    3947:	8b 45 cc             	mov    -0x34(%ebp),%eax
    394a:	01 c2                	add    %eax,%edx
    394c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    394f:	01 d0                	add    %edx,%eax
    3951:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3954:	a1 10 90 00 00       	mov    0x9010,%eax
    3959:	83 ec 04             	sub    $0x4,%esp
    395c:	68 00 02 00 00       	push   $0x200
    3961:	8d 55 c4             	lea    -0x3c(%ebp),%edx
    3964:	52                   	push   %edx
    3965:	50                   	push   %eax
    3966:	e8 1c 31 00 00       	call   6a87 <Memcpy>
    396b:	83 c4 10             	add    $0x10,%esp
    396e:	a1 10 90 00 00       	mov    0x9010,%eax
    3973:	83 ec 0c             	sub    $0xc,%esp
    3976:	6a 02                	push   $0x2
    3978:	68 00 02 00 00       	push   $0x200
    397d:	50                   	push   %eax
    397e:	6a 20                	push   $0x20
    3980:	6a 01                	push   $0x1
    3982:	e8 35 ff ff ff       	call   38bc <rd_wt>
    3987:	83 c4 20             	add    $0x20,%esp
    398a:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
    398e:	0f be 45 ef          	movsbl -0x11(%ebp),%eax
    3992:	89 c2                	mov    %eax,%edx
    3994:	a1 10 90 00 00       	mov    0x9010,%eax
    3999:	83 ec 04             	sub    $0x4,%esp
    399c:	6a 01                	push   $0x1
    399e:	52                   	push   %edx
    399f:	50                   	push   %eax
    39a0:	e8 e2 30 00 00       	call   6a87 <Memcpy>
    39a5:	83 c4 10             	add    $0x10,%esp
    39a8:	a1 10 90 00 00       	mov    0x9010,%eax
    39ad:	83 c0 01             	add    $0x1,%eax
    39b0:	83 ec 04             	sub    $0x4,%esp
    39b3:	68 ff 01 00 00       	push   $0x1ff
    39b8:	6a 00                	push   $0x0
    39ba:	50                   	push   %eax
    39bb:	e8 c7 30 00 00       	call   6a87 <Memcpy>
    39c0:	83 c4 10             	add    $0x10,%esp
    39c3:	a1 10 90 00 00       	mov    0x9010,%eax
    39c8:	83 ec 0c             	sub    $0xc,%esp
    39cb:	6a 02                	push   $0x2
    39cd:	68 00 02 00 00       	push   $0x200
    39d2:	50                   	push   %eax
    39d3:	6a 20                	push   $0x20
    39d5:	6a 02                	push   $0x2
    39d7:	e8 e0 fe ff ff       	call   38bc <rd_wt>
    39dc:	83 c4 20             	add    $0x20,%esp
    39df:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
    39e6:	a1 10 90 00 00       	mov    0x9010,%eax
    39eb:	83 ec 04             	sub    $0x4,%esp
    39ee:	68 00 01 00 00       	push   $0x100
    39f3:	6a ff                	push   $0xffffffff
    39f5:	50                   	push   %eax
    39f6:	e8 ba 30 00 00       	call   6ab5 <Memset>
    39fb:	83 c4 10             	add    $0x10,%esp
    39fe:	a1 10 90 00 00       	mov    0x9010,%eax
    3a03:	05 00 01 00 00       	add    $0x100,%eax
    3a08:	83 ec 04             	sub    $0x4,%esp
    3a0b:	6a 01                	push   $0x1
    3a0d:	6a 01                	push   $0x1
    3a0f:	50                   	push   %eax
    3a10:	e8 a0 30 00 00       	call   6ab5 <Memset>
    3a15:	83 c4 10             	add    $0x10,%esp
    3a18:	a1 10 90 00 00       	mov    0x9010,%eax
    3a1d:	05 01 01 00 00       	add    $0x101,%eax
    3a22:	83 ec 04             	sub    $0x4,%esp
    3a25:	68 00 02 00 00       	push   $0x200
    3a2a:	6a 00                	push   $0x0
    3a2c:	50                   	push   %eax
    3a2d:	e8 83 30 00 00       	call   6ab5 <Memset>
    3a32:	83 c4 10             	add    $0x10,%esp
    3a35:	a1 10 90 00 00       	mov    0x9010,%eax
    3a3a:	83 ec 0c             	sub    $0xc,%esp
    3a3d:	6a 02                	push   $0x2
    3a3f:	68 00 02 00 00       	push   $0x200
    3a44:	50                   	push   %eax
    3a45:	6a 20                	push   $0x20
    3a47:	ff 75 e8             	pushl  -0x18(%ebp)
    3a4a:	e8 6d fe ff ff       	call   38bc <rd_wt>
    3a4f:	83 c4 20             	add    $0x20,%esp
    3a52:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3a55:	83 e8 01             	sub    $0x1,%eax
    3a58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3a5b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    3a62:	eb 3f                	jmp    3aa3 <mkfs+0x193>
    3a64:	a1 10 90 00 00       	mov    0x9010,%eax
    3a69:	83 ec 04             	sub    $0x4,%esp
    3a6c:	68 00 02 00 00       	push   $0x200
    3a71:	6a 00                	push   $0x0
    3a73:	50                   	push   %eax
    3a74:	e8 3c 30 00 00       	call   6ab5 <Memset>
    3a79:	83 c4 10             	add    $0x10,%esp
    3a7c:	a1 10 90 00 00       	mov    0x9010,%eax
    3a81:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    3a84:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3a87:	01 ca                	add    %ecx,%edx
    3a89:	83 ec 0c             	sub    $0xc,%esp
    3a8c:	6a 02                	push   $0x2
    3a8e:	68 00 02 00 00       	push   $0x200
    3a93:	50                   	push   %eax
    3a94:	6a 20                	push   $0x20
    3a96:	52                   	push   %edx
    3a97:	e8 20 fe ff ff       	call   38bc <rd_wt>
    3a9c:	83 c4 20             	add    $0x20,%esp
    3a9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3aa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aa6:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3aa9:	7e b9                	jle    3a64 <mkfs+0x154>
    3aab:	a1 10 90 00 00       	mov    0x9010,%eax
    3ab0:	83 ec 04             	sub    $0x4,%esp
    3ab3:	68 00 02 00 00       	push   $0x200
    3ab8:	6a 00                	push   $0x0
    3aba:	50                   	push   %eax
    3abb:	e8 f5 2f 00 00       	call   6ab5 <Memset>
    3ac0:	83 c4 10             	add    $0x10,%esp
    3ac3:	c7 45 a8 02 00 00 00 	movl   $0x2,-0x58(%ebp)
    3aca:	c7 45 ac 14 00 00 00 	movl   $0x14,-0x54(%ebp)
    3ad1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3ad4:	89 45 b0             	mov    %eax,-0x50(%ebp)
    3ad7:	c7 45 b4 00 08 00 00 	movl   $0x800,-0x4c(%ebp)
    3ade:	a1 10 90 00 00       	mov    0x9010,%eax
    3ae3:	83 ec 04             	sub    $0x4,%esp
    3ae6:	6a 10                	push   $0x10
    3ae8:	8d 55 a8             	lea    -0x58(%ebp),%edx
    3aeb:	52                   	push   %edx
    3aec:	50                   	push   %eax
    3aed:	e8 95 2f 00 00       	call   6a87 <Memcpy>
    3af2:	83 c4 10             	add    $0x10,%esp
    3af5:	a1 10 90 00 00       	mov    0x9010,%eax
    3afa:	8b 55 cc             	mov    -0x34(%ebp),%edx
    3afd:	83 c2 03             	add    $0x3,%edx
    3b00:	83 ec 0c             	sub    $0xc,%esp
    3b03:	6a 02                	push   $0x2
    3b05:	68 00 02 00 00       	push   $0x200
    3b0a:	50                   	push   %eax
    3b0b:	6a 20                	push   $0x20
    3b0d:	52                   	push   %edx
    3b0e:	e8 a9 fd ff ff       	call   38bc <rd_wt>
    3b13:	83 c4 20             	add    $0x20,%esp
    3b16:	a1 10 90 00 00       	mov    0x9010,%eax
    3b1b:	8b 55 cc             	mov    -0x34(%ebp),%edx
    3b1e:	83 c2 03             	add    $0x3,%edx
    3b21:	83 ec 0c             	sub    $0xc,%esp
    3b24:	6a 01                	push   $0x1
    3b26:	68 00 02 00 00       	push   $0x200
    3b2b:	50                   	push   %eax
    3b2c:	6a 20                	push   $0x20
    3b2e:	52                   	push   %edx
    3b2f:	e8 88 fd ff ff       	call   38bc <rd_wt>
    3b34:	83 c4 20             	add    $0x20,%esp
    3b37:	a1 10 90 00 00       	mov    0x9010,%eax
    3b3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3b3f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3b42:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    3b48:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3b4b:	c7 40 04 14 00 00 00 	movl   $0x14,0x4(%eax)
    3b52:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    3b55:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3b58:	89 50 08             	mov    %edx,0x8(%eax)
    3b5b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3b5e:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    3b65:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3b6c:	eb 4d                	jmp    3bbb <mkfs+0x2ab>
    3b6e:	8b 15 10 90 00 00    	mov    0x9010,%edx
    3b74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3b77:	83 c0 01             	add    $0x1,%eax
    3b7a:	6b c0 1c             	imul   $0x1c,%eax,%eax
    3b7d:	01 d0                	add    %edx,%eax
    3b7f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3b82:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3b85:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    3b8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3b8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    3b95:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3b98:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    3b9f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    3ba6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3ba9:	c1 e0 08             	shl    $0x8,%eax
    3bac:	0b 45 f0             	or     -0x10(%ebp),%eax
    3baf:	89 c2                	mov    %eax,%edx
    3bb1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3bb4:	89 50 08             	mov    %edx,0x8(%eax)
    3bb7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3bbb:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    3bbf:	7e ad                	jle    3b6e <mkfs+0x25e>
    3bc1:	a1 10 90 00 00       	mov    0x9010,%eax
    3bc6:	8b 55 cc             	mov    -0x34(%ebp),%edx
    3bc9:	83 c2 03             	add    $0x3,%edx
    3bcc:	83 ec 0c             	sub    $0xc,%esp
    3bcf:	6a 02                	push   $0x2
    3bd1:	68 00 02 00 00       	push   $0x200
    3bd6:	50                   	push   %eax
    3bd7:	6a 20                	push   $0x20
    3bd9:	52                   	push   %edx
    3bda:	e8 dd fc ff ff       	call   38bc <rd_wt>
    3bdf:	83 c4 20             	add    $0x20,%esp
    3be2:	c7 45 94 01 00 00 00 	movl   $0x1,-0x6c(%ebp)
    3be9:	c6 45 92 2e          	movb   $0x2e,-0x6e(%ebp)
    3bed:	c6 45 93 30          	movb   $0x30,-0x6d(%ebp)
    3bf1:	83 ec 04             	sub    $0x4,%esp
    3bf4:	6a 02                	push   $0x2
    3bf6:	8d 45 92             	lea    -0x6e(%ebp),%eax
    3bf9:	50                   	push   %eax
    3bfa:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3bfd:	83 c0 04             	add    $0x4,%eax
    3c00:	50                   	push   %eax
    3c01:	e8 81 2e 00 00       	call   6a87 <Memcpy>
    3c06:	83 c4 10             	add    $0x10,%esp
    3c09:	a1 10 90 00 00       	mov    0x9010,%eax
    3c0e:	83 ec 04             	sub    $0x4,%esp
    3c11:	6a 14                	push   $0x14
    3c13:	8d 55 94             	lea    -0x6c(%ebp),%edx
    3c16:	52                   	push   %edx
    3c17:	50                   	push   %eax
    3c18:	e8 6a 2e 00 00       	call   6a87 <Memcpy>
    3c1d:	83 c4 10             	add    $0x10,%esp
    3c20:	8b 15 10 90 00 00    	mov    0x9010,%edx
    3c26:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3c29:	83 ec 0c             	sub    $0xc,%esp
    3c2c:	6a 02                	push   $0x2
    3c2e:	68 00 02 00 00       	push   $0x200
    3c33:	52                   	push   %edx
    3c34:	6a 20                	push   $0x20
    3c36:	50                   	push   %eax
    3c37:	e8 80 fc ff ff       	call   38bc <rd_wt>
    3c3c:	83 c4 20             	add    $0x20,%esp
    3c3f:	90                   	nop
    3c40:	c9                   	leave  
    3c41:	c3                   	ret    

00003c42 <init_fs>:
    3c42:	55                   	push   %ebp
    3c43:	89 e5                	mov    %esp,%ebp
    3c45:	83 ec 08             	sub    $0x8,%esp
    3c48:	e8 c3 fc ff ff       	call   3910 <mkfs>
    3c4d:	90                   	nop
    3c4e:	c9                   	leave  
    3c4f:	c3                   	ret    

00003c50 <do_open>:
    3c50:	55                   	push   %ebp
    3c51:	89 e5                	mov    %esp,%ebp
    3c53:	83 ec 28             	sub    $0x28,%esp
    3c56:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
    3c5d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3c64:	eb 1f                	jmp    3c85 <do_open+0x35>
    3c66:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    3c6b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3c6e:	83 c2 1c             	add    $0x1c,%edx
    3c71:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    3c75:	85 c0                	test   %eax,%eax
    3c77:	75 08                	jne    3c81 <do_open+0x31>
    3c79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3c7f:	eb 0a                	jmp    3c8b <do_open+0x3b>
    3c81:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3c85:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
    3c89:	7e db                	jle    3c66 <do_open+0x16>
    3c8b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    3c8f:	75 1c                	jne    3cad <do_open+0x5d>
    3c91:	68 f4 00 00 00       	push   $0xf4
    3c96:	68 4e 69 00 00       	push   $0x694e
    3c9b:	68 4e 69 00 00       	push   $0x694e
    3ca0:	68 5b 69 00 00       	push   $0x695b
    3ca5:	e8 b2 e5 ff ff       	call   225c <assertion_failure>
    3caa:	83 c4 10             	add    $0x10,%esp
    3cad:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
    3cb4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3cbb:	eb 1d                	jmp    3cda <do_open+0x8a>
    3cbd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3cc0:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3cc7:	8b 40 08             	mov    0x8(%eax),%eax
    3cca:	85 c0                	test   %eax,%eax
    3ccc:	75 08                	jne    3cd6 <do_open+0x86>
    3cce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3cd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3cd4:	eb 0a                	jmp    3ce0 <do_open+0x90>
    3cd6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3cda:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
    3cde:	7e dd                	jle    3cbd <do_open+0x6d>
    3ce0:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
    3ce4:	75 1c                	jne    3d02 <do_open+0xb2>
    3ce6:	68 fe 00 00 00       	push   $0xfe
    3ceb:	68 4e 69 00 00       	push   $0x694e
    3cf0:	68 4e 69 00 00       	push   $0x694e
    3cf5:	68 63 69 00 00       	push   $0x6963
    3cfa:	e8 5d e5 ff ff       	call   225c <assertion_failure>
    3cff:	83 c4 10             	add    $0x10,%esp
    3d02:	83 ec 0c             	sub    $0xc,%esp
    3d05:	ff 75 08             	pushl  0x8(%ebp)
    3d08:	e8 ab 00 00 00       	call   3db8 <search_file>
    3d0d:	83 c4 10             	add    $0x10,%esp
    3d10:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3d13:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
    3d17:	75 29                	jne    3d42 <do_open+0xf2>
    3d19:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3d1d:	7e 10                	jle    3d2f <do_open+0xdf>
    3d1f:	83 ec 0c             	sub    $0xc,%esp
    3d22:	68 6b 69 00 00       	push   $0x696b
    3d27:	e8 12 e5 ff ff       	call   223e <panic>
    3d2c:	83 c4 10             	add    $0x10,%esp
    3d2f:	83 ec 0c             	sub    $0xc,%esp
    3d32:	ff 75 08             	pushl  0x8(%ebp)
    3d35:	e8 b6 03 00 00       	call   40f0 <create_file>
    3d3a:	83 c4 10             	add    $0x10,%esp
    3d3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3d40:	eb 11                	jmp    3d53 <do_open+0x103>
    3d42:	83 ec 0c             	sub    $0xc,%esp
    3d45:	ff 75 e0             	pushl  -0x20(%ebp)
    3d48:	e8 73 02 00 00       	call   3fc0 <get_inode>
    3d4d:	83 c4 10             	add    $0x10,%esp
    3d50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3d53:	83 ec 0c             	sub    $0xc,%esp
    3d56:	68 78 69 00 00       	push   $0x6978
    3d5b:	e8 de e4 ff ff       	call   223e <panic>
    3d60:	83 c4 10             	add    $0x10,%esp
    3d63:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    3d68:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3d6b:	8b 14 95 20 d7 00 00 	mov    0xd720(,%edx,4),%edx
    3d72:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3d75:	83 c1 1c             	add    $0x1c,%ecx
    3d78:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    3d7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d7f:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3d86:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    3d89:	89 50 08             	mov    %edx,0x8(%eax)
    3d8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d8f:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3d96:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    3d9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3da0:	8b 04 85 20 d7 00 00 	mov    0xd720(,%eax,4),%eax
    3da7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    3dad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3db0:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3db3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3db6:	c9                   	leave  
    3db7:	c3                   	ret    

00003db8 <search_file>:
    3db8:	55                   	push   %ebp
    3db9:	89 e5                	mov    %esp,%ebp
    3dbb:	83 ec 48             	sub    $0x48,%esp
    3dbe:	83 ec 04             	sub    $0x4,%esp
    3dc1:	ff 75 e4             	pushl  -0x1c(%ebp)
    3dc4:	ff 75 08             	pushl  0x8(%ebp)
    3dc7:	8d 45 ba             	lea    -0x46(%ebp),%eax
    3dca:	50                   	push   %eax
    3dcb:	e8 13 01 00 00       	call   3ee3 <strip_path>
    3dd0:	83 c4 10             	add    $0x10,%esp
    3dd3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3dd6:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3dda:	75 1c                	jne    3df8 <search_file+0x40>
    3ddc:	68 23 01 00 00       	push   $0x123
    3de1:	68 4e 69 00 00       	push   $0x694e
    3de6:	68 4e 69 00 00       	push   $0x694e
    3deb:	68 8b 69 00 00       	push   $0x698b
    3df0:	e8 67 e4 ff ff       	call   225c <assertion_failure>
    3df5:	83 c4 10             	add    $0x10,%esp
    3df8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3dfb:	8b 40 04             	mov    0x4(%eax),%eax
    3dfe:	89 45 dc             	mov    %eax,-0x24(%ebp)
    3e01:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3e04:	05 00 02 00 00       	add    $0x200,%eax
    3e09:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    3e0f:	85 c0                	test   %eax,%eax
    3e11:	0f 48 c2             	cmovs  %edx,%eax
    3e14:	c1 f8 09             	sar    $0x9,%eax
    3e17:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3e1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e1d:	8b 40 04             	mov    0x4(%eax),%eax
    3e20:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    3e25:	f7 e2                	mul    %edx
    3e27:	89 d0                	mov    %edx,%eax
    3e29:	c1 e8 02             	shr    $0x2,%eax
    3e2c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3e2f:	e8 ea 10 00 00       	call   4f1e <get_super_block>
    3e34:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3e37:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3e3a:	8b 00                	mov    (%eax),%eax
    3e3c:	89 45 cc             	mov    %eax,-0x34(%ebp)
    3e3f:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    3e44:	89 45 c8             	mov    %eax,-0x38(%ebp)
    3e47:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e4e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3e55:	eb 79                	jmp    3ed0 <search_file+0x118>
    3e57:	a1 10 90 00 00       	mov    0x9010,%eax
    3e5c:	8b 4d cc             	mov    -0x34(%ebp),%ecx
    3e5f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3e62:	01 ca                	add    %ecx,%edx
    3e64:	83 ec 0c             	sub    $0xc,%esp
    3e67:	6a 01                	push   $0x1
    3e69:	68 00 02 00 00       	push   $0x200
    3e6e:	50                   	push   %eax
    3e6f:	ff 75 c8             	pushl  -0x38(%ebp)
    3e72:	52                   	push   %edx
    3e73:	e8 44 fa ff ff       	call   38bc <rd_wt>
    3e78:	83 c4 20             	add    $0x20,%esp
    3e7b:	a1 10 90 00 00       	mov    0x9010,%eax
    3e80:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3e83:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    3e8a:	eb 35                	jmp    3ec1 <search_file+0x109>
    3e8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3e90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e93:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    3e96:	7f 33                	jg     3ecb <search_file+0x113>
    3e98:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e9b:	83 c0 04             	add    $0x4,%eax
    3e9e:	83 ec 08             	sub    $0x8,%esp
    3ea1:	50                   	push   %eax
    3ea2:	8d 45 ba             	lea    -0x46(%ebp),%eax
    3ea5:	50                   	push   %eax
    3ea6:	e8 a6 00 00 00       	call   3f51 <strcmp>
    3eab:	83 c4 10             	add    $0x10,%esp
    3eae:	85 c0                	test   %eax,%eax
    3eb0:	75 07                	jne    3eb9 <search_file+0x101>
    3eb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3eb5:	8b 00                	mov    (%eax),%eax
    3eb7:	eb 28                	jmp    3ee1 <search_file+0x129>
    3eb9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    3ebd:	83 45 ec 14          	addl   $0x14,-0x14(%ebp)
    3ec1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ec4:	83 f8 1b             	cmp    $0x1b,%eax
    3ec7:	76 c3                	jbe    3e8c <search_file+0xd4>
    3ec9:	eb 01                	jmp    3ecc <search_file+0x114>
    3ecb:	90                   	nop
    3ecc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3ed0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ed3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    3ed6:	0f 8c 7b ff ff ff    	jl     3e57 <search_file+0x9f>
    3edc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3ee1:	c9                   	leave  
    3ee2:	c3                   	ret    

00003ee3 <strip_path>:
    3ee3:	55                   	push   %ebp
    3ee4:	89 e5                	mov    %esp,%ebp
    3ee6:	83 ec 10             	sub    $0x10,%esp
    3ee9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3eed:	75 07                	jne    3ef6 <strip_path+0x13>
    3eef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3ef4:	eb 59                	jmp    3f4f <strip_path+0x6c>
    3ef6:	8b 45 08             	mov    0x8(%ebp),%eax
    3ef9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3efc:	8b 45 0c             	mov    0xc(%ebp),%eax
    3eff:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3f02:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f05:	0f b6 00             	movzbl (%eax),%eax
    3f08:	3c 2f                	cmp    $0x2f,%al
    3f0a:	75 2a                	jne    3f36 <strip_path+0x53>
    3f0c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3f10:	eb 24                	jmp    3f36 <strip_path+0x53>
    3f12:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f15:	0f b6 00             	movzbl (%eax),%eax
    3f18:	3c 2f                	cmp    $0x2f,%al
    3f1a:	75 07                	jne    3f23 <strip_path+0x40>
    3f1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3f21:	eb 2c                	jmp    3f4f <strip_path+0x6c>
    3f23:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f26:	0f b6 10             	movzbl (%eax),%edx
    3f29:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f2c:	88 10                	mov    %dl,(%eax)
    3f2e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3f32:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3f36:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    3f3a:	75 d6                	jne    3f12 <strip_path+0x2f>
    3f3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f3f:	c6 00 00             	movb   $0x0,(%eax)
    3f42:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    3f47:	89 45 10             	mov    %eax,0x10(%ebp)
    3f4a:	b8 00 00 00 00       	mov    $0x0,%eax
    3f4f:	c9                   	leave  
    3f50:	c3                   	ret    

00003f51 <strcmp>:
    3f51:	55                   	push   %ebp
    3f52:	89 e5                	mov    %esp,%ebp
    3f54:	83 ec 10             	sub    $0x10,%esp
    3f57:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3f5b:	74 06                	je     3f63 <strcmp+0x12>
    3f5d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3f61:	75 08                	jne    3f6b <strcmp+0x1a>
    3f63:	8b 45 08             	mov    0x8(%ebp),%eax
    3f66:	2b 45 0c             	sub    0xc(%ebp),%eax
    3f69:	eb 53                	jmp    3fbe <strcmp+0x6d>
    3f6b:	8b 45 08             	mov    0x8(%ebp),%eax
    3f6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f71:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f74:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3f77:	eb 18                	jmp    3f91 <strcmp+0x40>
    3f79:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f7c:	0f b6 10             	movzbl (%eax),%edx
    3f7f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f82:	0f b6 00             	movzbl (%eax),%eax
    3f85:	38 c2                	cmp    %al,%dl
    3f87:	75 1e                	jne    3fa7 <strcmp+0x56>
    3f89:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3f8d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3f91:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f94:	0f b6 00             	movzbl (%eax),%eax
    3f97:	84 c0                	test   %al,%al
    3f99:	74 0d                	je     3fa8 <strcmp+0x57>
    3f9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f9e:	0f b6 00             	movzbl (%eax),%eax
    3fa1:	84 c0                	test   %al,%al
    3fa3:	75 d4                	jne    3f79 <strcmp+0x28>
    3fa5:	eb 01                	jmp    3fa8 <strcmp+0x57>
    3fa7:	90                   	nop
    3fa8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fab:	0f b6 00             	movzbl (%eax),%eax
    3fae:	0f be d0             	movsbl %al,%edx
    3fb1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fb4:	0f b6 00             	movzbl (%eax),%eax
    3fb7:	0f be c0             	movsbl %al,%eax
    3fba:	29 c2                	sub    %eax,%edx
    3fbc:	89 d0                	mov    %edx,%eax
    3fbe:	c9                   	leave  
    3fbf:	c3                   	ret    

00003fc0 <get_inode>:
    3fc0:	55                   	push   %ebp
    3fc1:	89 e5                	mov    %esp,%ebp
    3fc3:	56                   	push   %esi
    3fc4:	53                   	push   %ebx
    3fc5:	83 ec 20             	sub    $0x20,%esp
    3fc8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3fcc:	75 0a                	jne    3fd8 <get_inode+0x18>
    3fce:	b8 00 00 00 00       	mov    $0x0,%eax
    3fd3:	e9 11 01 00 00       	jmp    40e9 <get_inode+0x129>
    3fd8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3fdf:	c7 45 f0 20 d8 00 00 	movl   $0xd820,-0x10(%ebp)
    3fe6:	eb 29                	jmp    4011 <get_inode+0x51>
    3fe8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3feb:	8b 40 18             	mov    0x18(%eax),%eax
    3fee:	85 c0                	test   %eax,%eax
    3ff0:	7e 13                	jle    4005 <get_inode+0x45>
    3ff2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ff5:	8b 40 10             	mov    0x10(%eax),%eax
    3ff8:	39 45 08             	cmp    %eax,0x8(%ebp)
    3ffb:	75 10                	jne    400d <get_inode+0x4d>
    3ffd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4000:	e9 e4 00 00 00       	jmp    40e9 <get_inode+0x129>
    4005:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4008:	89 45 f4             	mov    %eax,-0xc(%ebp)
    400b:	eb 0d                	jmp    401a <get_inode+0x5a>
    400d:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
    4011:	81 7d f0 20 df 00 00 	cmpl   $0xdf20,-0x10(%ebp)
    4018:	76 ce                	jbe    3fe8 <get_inode+0x28>
    401a:	e8 ff 0e 00 00       	call   4f1e <get_super_block>
    401f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4022:	c7 45 e8 1c 00 00 00 	movl   $0x1c,-0x18(%ebp)
    4029:	8b 45 ec             	mov    -0x14(%ebp),%eax
    402c:	8b 40 04             	mov    0x4(%eax),%eax
    402f:	8d 50 02             	lea    0x2(%eax),%edx
    4032:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4035:	8b 40 08             	mov    0x8(%eax),%eax
    4038:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    403b:	8b 45 08             	mov    0x8(%ebp),%eax
    403e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4041:	b8 00 02 00 00       	mov    $0x200,%eax
    4046:	99                   	cltd   
    4047:	f7 7d e8             	idivl  -0x18(%ebp)
    404a:	89 c6                	mov    %eax,%esi
    404c:	89 c8                	mov    %ecx,%eax
    404e:	99                   	cltd   
    404f:	f7 fe                	idiv   %esi
    4051:	01 d8                	add    %ebx,%eax
    4053:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4056:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
    405d:	a1 10 90 00 00       	mov    0x9010,%eax
    4062:	83 ec 0c             	sub    $0xc,%esp
    4065:	6a 01                	push   $0x1
    4067:	68 00 02 00 00       	push   $0x200
    406c:	50                   	push   %eax
    406d:	ff 75 e0             	pushl  -0x20(%ebp)
    4070:	ff 75 e4             	pushl  -0x1c(%ebp)
    4073:	e8 44 f8 ff ff       	call   38bc <rd_wt>
    4078:	83 c4 20             	add    $0x20,%esp
    407b:	8b 45 08             	mov    0x8(%ebp),%eax
    407e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4081:	b8 00 02 00 00       	mov    $0x200,%eax
    4086:	99                   	cltd   
    4087:	f7 7d e8             	idivl  -0x18(%ebp)
    408a:	89 c3                	mov    %eax,%ebx
    408c:	89 c8                	mov    %ecx,%eax
    408e:	99                   	cltd   
    408f:	f7 fb                	idiv   %ebx
    4091:	89 55 dc             	mov    %edx,-0x24(%ebp)
    4094:	8b 15 10 90 00 00    	mov    0x9010,%edx
    409a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    409d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
    40a1:	01 d0                	add    %edx,%eax
    40a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
    40a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40a9:	8b 55 08             	mov    0x8(%ebp),%edx
    40ac:	89 50 10             	mov    %edx,0x10(%eax)
    40af:	8b 45 d8             	mov    -0x28(%ebp),%eax
    40b2:	8b 50 04             	mov    0x4(%eax),%edx
    40b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40b8:	89 50 04             	mov    %edx,0x4(%eax)
    40bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    40be:	8b 50 08             	mov    0x8(%eax),%edx
    40c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40c4:	89 50 08             	mov    %edx,0x8(%eax)
    40c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    40ca:	8b 10                	mov    (%eax),%edx
    40cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40cf:	89 10                	mov    %edx,(%eax)
    40d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    40d4:	8b 50 0c             	mov    0xc(%eax),%edx
    40d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40da:	89 50 0c             	mov    %edx,0xc(%eax)
    40dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    40e3:	89 50 14             	mov    %edx,0x14(%eax)
    40e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
    40ec:	5b                   	pop    %ebx
    40ed:	5e                   	pop    %esi
    40ee:	5d                   	pop    %ebp
    40ef:	c3                   	ret    

000040f0 <create_file>:
    40f0:	55                   	push   %ebp
    40f1:	89 e5                	mov    %esp,%ebp
    40f3:	83 ec 38             	sub    $0x38,%esp
    40f6:	ff 75 f4             	pushl  -0xc(%ebp)
    40f9:	ff 75 08             	pushl  0x8(%ebp)
    40fc:	8d 45 ce             	lea    -0x32(%ebp),%eax
    40ff:	50                   	push   %eax
    4100:	e8 de fd ff ff       	call   3ee3 <strip_path>
    4105:	83 c4 0c             	add    $0xc,%esp
    4108:	83 f8 ff             	cmp    $0xffffffff,%eax
    410b:	75 0a                	jne    4117 <create_file+0x27>
    410d:	b8 00 00 00 00       	mov    $0x0,%eax
    4112:	e9 90 00 00 00       	jmp    41a7 <create_file+0xb7>
    4117:	e8 8d 00 00 00       	call   41a9 <alloc_imap_bit>
    411c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    411f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4123:	75 07                	jne    412c <create_file+0x3c>
    4125:	b8 00 00 00 00       	mov    $0x0,%eax
    412a:	eb 7b                	jmp    41a7 <create_file+0xb7>
    412c:	e8 ed 0d 00 00       	call   4f1e <get_super_block>
    4131:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4134:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4137:	8b 40 10             	mov    0x10(%eax),%eax
    413a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    413d:	83 ec 08             	sub    $0x8,%esp
    4140:	ff 75 e8             	pushl  -0x18(%ebp)
    4143:	ff 75 f0             	pushl  -0x10(%ebp)
    4146:	e8 5b 01 00 00       	call   42a6 <alloc_smap_bit>
    414b:	83 c4 10             	add    $0x10,%esp
    414e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4151:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    4155:	75 07                	jne    415e <create_file+0x6e>
    4157:	b8 00 00 00 00       	mov    $0x0,%eax
    415c:	eb 49                	jmp    41a7 <create_file+0xb7>
    415e:	83 ec 08             	sub    $0x8,%esp
    4161:	ff 75 e4             	pushl  -0x1c(%ebp)
    4164:	ff 75 f0             	pushl  -0x10(%ebp)
    4167:	e8 c9 02 00 00       	call   4435 <new_inode>
    416c:	83 c4 10             	add    $0x10,%esp
    416f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4172:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    4176:	75 07                	jne    417f <create_file+0x8f>
    4178:	b8 00 00 00 00       	mov    $0x0,%eax
    417d:	eb 28                	jmp    41a7 <create_file+0xb7>
    417f:	83 ec 04             	sub    $0x4,%esp
    4182:	ff 75 f0             	pushl  -0x10(%ebp)
    4185:	8d 45 ce             	lea    -0x32(%ebp),%eax
    4188:	50                   	push   %eax
    4189:	ff 75 f4             	pushl  -0xc(%ebp)
    418c:	e8 f8 02 00 00       	call   4489 <new_dir_entry>
    4191:	83 c4 10             	add    $0x10,%esp
    4194:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4197:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    419b:	75 07                	jne    41a4 <create_file+0xb4>
    419d:	b8 00 00 00 00       	mov    $0x0,%eax
    41a2:	eb 03                	jmp    41a7 <create_file+0xb7>
    41a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    41a7:	c9                   	leave  
    41a8:	c3                   	ret    

000041a9 <alloc_imap_bit>:
    41a9:	55                   	push   %ebp
    41aa:	89 e5                	mov    %esp,%ebp
    41ac:	53                   	push   %ebx
    41ad:	83 ec 24             	sub    $0x24,%esp
    41b0:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
    41b7:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
    41be:	a1 10 90 00 00       	mov    0x9010,%eax
    41c3:	83 ec 0c             	sub    $0xc,%esp
    41c6:	6a 01                	push   $0x1
    41c8:	68 00 02 00 00       	push   $0x200
    41cd:	50                   	push   %eax
    41ce:	ff 75 e8             	pushl  -0x18(%ebp)
    41d1:	ff 75 ec             	pushl  -0x14(%ebp)
    41d4:	e8 e3 f6 ff ff       	call   38bc <rd_wt>
    41d9:	83 c4 20             	add    $0x20,%esp
    41dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    41e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    41ea:	e9 a5 00 00 00       	jmp    4294 <alloc_imap_bit+0xeb>
    41ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    41f6:	e9 8b 00 00 00       	jmp    4286 <alloc_imap_bit+0xdd>
    41fb:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4201:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4204:	01 d0                	add    %edx,%eax
    4206:	0f b6 00             	movzbl (%eax),%eax
    4209:	0f be d0             	movsbl %al,%edx
    420c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4210:	0f 94 c0             	sete   %al
    4213:	0f b6 c0             	movzbl %al,%eax
    4216:	21 d0                	and    %edx,%eax
    4218:	85 c0                	test   %eax,%eax
    421a:	74 06                	je     4222 <alloc_imap_bit+0x79>
    421c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4220:	eb 64                	jmp    4286 <alloc_imap_bit+0xdd>
    4222:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4228:	8b 45 f4             	mov    -0xc(%ebp),%eax
    422b:	01 d0                	add    %edx,%eax
    422d:	0f b6 18             	movzbl (%eax),%ebx
    4230:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4233:	ba 01 00 00 00       	mov    $0x1,%edx
    4238:	89 c1                	mov    %eax,%ecx
    423a:	d3 e2                	shl    %cl,%edx
    423c:	89 d0                	mov    %edx,%eax
    423e:	89 c1                	mov    %eax,%ecx
    4240:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4246:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4249:	01 d0                	add    %edx,%eax
    424b:	09 cb                	or     %ecx,%ebx
    424d:	89 da                	mov    %ebx,%edx
    424f:	88 10                	mov    %dl,(%eax)
    4251:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4254:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    425b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    425e:	01 d0                	add    %edx,%eax
    4260:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4263:	a1 10 90 00 00       	mov    0x9010,%eax
    4268:	83 ec 0c             	sub    $0xc,%esp
    426b:	6a 02                	push   $0x2
    426d:	68 00 02 00 00       	push   $0x200
    4272:	50                   	push   %eax
    4273:	ff 75 e8             	pushl  -0x18(%ebp)
    4276:	ff 75 ec             	pushl  -0x14(%ebp)
    4279:	e8 3e f6 ff ff       	call   38bc <rd_wt>
    427e:	83 c4 20             	add    $0x20,%esp
    4281:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4284:	eb 1b                	jmp    42a1 <alloc_imap_bit+0xf8>
    4286:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    428a:	0f 8e 6b ff ff ff    	jle    41fb <alloc_imap_bit+0x52>
    4290:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4294:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    429b:	0f 8e 4e ff ff ff    	jle    41ef <alloc_imap_bit+0x46>
    42a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    42a4:	c9                   	leave  
    42a5:	c3                   	ret    

000042a6 <alloc_smap_bit>:
    42a6:	55                   	push   %ebp
    42a7:	89 e5                	mov    %esp,%ebp
    42a9:	53                   	push   %ebx
    42aa:	83 ec 34             	sub    $0x34,%esp
    42ad:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    42b1:	7f 1c                	jg     42cf <alloc_smap_bit+0x29>
    42b3:	68 e1 01 00 00       	push   $0x1e1
    42b8:	68 4e 69 00 00       	push   $0x694e
    42bd:	68 4e 69 00 00       	push   $0x694e
    42c2:	68 95 69 00 00       	push   $0x6995
    42c7:	e8 90 df ff ff       	call   225c <assertion_failure>
    42cc:	83 c4 10             	add    $0x10,%esp
    42cf:	e8 4a 0c 00 00       	call   4f1e <get_super_block>
    42d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    42d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    42da:	8b 40 08             	mov    0x8(%eax),%eax
    42dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
    42e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    42e3:	8b 40 04             	mov    0x4(%eax),%eax
    42e6:	83 c0 02             	add    $0x2,%eax
    42e9:	89 45 dc             	mov    %eax,-0x24(%ebp)
    42ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    42f3:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
    42fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4301:	e9 18 01 00 00       	jmp    441e <alloc_smap_bit+0x178>
    4306:	8b 55 dc             	mov    -0x24(%ebp),%edx
    4309:	8b 45 f0             	mov    -0x10(%ebp),%eax
    430c:	01 d0                	add    %edx,%eax
    430e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4311:	a1 10 90 00 00       	mov    0x9010,%eax
    4316:	83 ec 0c             	sub    $0xc,%esp
    4319:	6a 01                	push   $0x1
    431b:	68 00 02 00 00       	push   $0x200
    4320:	50                   	push   %eax
    4321:	ff 75 d8             	pushl  -0x28(%ebp)
    4324:	ff 75 d4             	pushl  -0x2c(%ebp)
    4327:	e8 90 f5 ff ff       	call   38bc <rd_wt>
    432c:	83 c4 20             	add    $0x20,%esp
    432f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4336:	e9 a8 00 00 00       	jmp    43e3 <alloc_smap_bit+0x13d>
    433b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    4342:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4346:	0f 85 8a 00 00 00    	jne    43d6 <alloc_smap_bit+0x130>
    434c:	eb 45                	jmp    4393 <alloc_smap_bit+0xed>
    434e:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4354:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4357:	01 d0                	add    %edx,%eax
    4359:	0f b6 00             	movzbl (%eax),%eax
    435c:	0f be d0             	movsbl %al,%edx
    435f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4363:	0f 94 c0             	sete   %al
    4366:	0f b6 c0             	movzbl %al,%eax
    4369:	21 d0                	and    %edx,%eax
    436b:	85 c0                	test   %eax,%eax
    436d:	74 06                	je     4375 <alloc_smap_bit+0xcf>
    436f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4373:	eb 1e                	jmp    4393 <alloc_smap_bit+0xed>
    4375:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4378:	c1 e0 09             	shl    $0x9,%eax
    437b:	89 c2                	mov    %eax,%edx
    437d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4380:	01 d0                	add    %edx,%eax
    4382:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4389:	8b 45 e8             	mov    -0x18(%ebp),%eax
    438c:	01 d0                	add    %edx,%eax
    438e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4391:	eb 06                	jmp    4399 <alloc_smap_bit+0xf3>
    4393:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    4397:	7e b5                	jle    434e <alloc_smap_bit+0xa8>
    4399:	eb 3b                	jmp    43d6 <alloc_smap_bit+0x130>
    439b:	8b 15 10 90 00 00    	mov    0x9010,%edx
    43a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    43a4:	01 d0                	add    %edx,%eax
    43a6:	0f b6 10             	movzbl (%eax),%edx
    43a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    43ac:	bb 01 00 00 00       	mov    $0x1,%ebx
    43b1:	89 c1                	mov    %eax,%ecx
    43b3:	d3 e3                	shl    %cl,%ebx
    43b5:	89 d8                	mov    %ebx,%eax
    43b7:	89 c3                	mov    %eax,%ebx
    43b9:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    43bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    43c2:	01 c8                	add    %ecx,%eax
    43c4:	21 da                	and    %ebx,%edx
    43c6:	88 10                	mov    %dl,(%eax)
    43c8:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
    43cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    43d0:	74 0c                	je     43de <alloc_smap_bit+0x138>
    43d2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    43d6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    43da:	7e bf                	jle    439b <alloc_smap_bit+0xf5>
    43dc:	eb 01                	jmp    43df <alloc_smap_bit+0x139>
    43de:	90                   	nop
    43df:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    43e3:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
    43ea:	0f 8e 4b ff ff ff    	jle    433b <alloc_smap_bit+0x95>
    43f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    43f4:	74 1e                	je     4414 <alloc_smap_bit+0x16e>
    43f6:	a1 10 90 00 00       	mov    0x9010,%eax
    43fb:	83 ec 0c             	sub    $0xc,%esp
    43fe:	6a 02                	push   $0x2
    4400:	68 00 02 00 00       	push   $0x200
    4405:	50                   	push   %eax
    4406:	ff 75 d8             	pushl  -0x28(%ebp)
    4409:	ff 75 d4             	pushl  -0x2c(%ebp)
    440c:	e8 ab f4 ff ff       	call   38bc <rd_wt>
    4411:	83 c4 20             	add    $0x20,%esp
    4414:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4418:	74 12                	je     442c <alloc_smap_bit+0x186>
    441a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    441e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4421:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    4424:	0f 8c dc fe ff ff    	jl     4306 <alloc_smap_bit+0x60>
    442a:	eb 01                	jmp    442d <alloc_smap_bit+0x187>
    442c:	90                   	nop
    442d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4430:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4433:	c9                   	leave  
    4434:	c3                   	ret    

00004435 <new_inode>:
    4435:	55                   	push   %ebp
    4436:	89 e5                	mov    %esp,%ebp
    4438:	83 ec 18             	sub    $0x18,%esp
    443b:	83 ec 0c             	sub    $0xc,%esp
    443e:	ff 75 08             	pushl  0x8(%ebp)
    4441:	e8 7a fb ff ff       	call   3fc0 <get_inode>
    4446:	83 c4 10             	add    $0x10,%esp
    4449:	89 45 f4             	mov    %eax,-0xc(%ebp)
    444c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4450:	75 07                	jne    4459 <new_inode+0x24>
    4452:	b8 00 00 00 00       	mov    $0x0,%eax
    4457:	eb 2e                	jmp    4487 <new_inode+0x52>
    4459:	8b 45 f4             	mov    -0xc(%ebp),%eax
    445c:	8b 55 0c             	mov    0xc(%ebp),%edx
    445f:	89 50 08             	mov    %edx,0x8(%eax)
    4462:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4465:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
    446c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    446f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    4476:	83 ec 0c             	sub    $0xc,%esp
    4479:	ff 75 f4             	pushl  -0xc(%ebp)
    447c:	e8 1b 09 00 00       	call   4d9c <sync_inode>
    4481:	83 c4 10             	add    $0x10,%esp
    4484:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4487:	c9                   	leave  
    4488:	c3                   	ret    

00004489 <new_dir_entry>:
    4489:	55                   	push   %ebp
    448a:	89 e5                	mov    %esp,%ebp
    448c:	83 ec 38             	sub    $0x38,%esp
    448f:	c7 45 e0 14 00 00 00 	movl   $0x14,-0x20(%ebp)
    4496:	8b 45 08             	mov    0x8(%ebp),%eax
    4499:	8b 50 04             	mov    0x4(%eax),%edx
    449c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    449f:	89 c1                	mov    %eax,%ecx
    44a1:	d3 fa                	sar    %cl,%edx
    44a3:	89 d0                	mov    %edx,%eax
    44a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
    44a8:	8b 45 08             	mov    0x8(%ebp),%eax
    44ab:	8b 50 0c             	mov    0xc(%eax),%edx
    44ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
    44b1:	89 c1                	mov    %eax,%ecx
    44b3:	d3 fa                	sar    %cl,%edx
    44b5:	89 d0                	mov    %edx,%eax
    44b7:	89 45 d8             	mov    %eax,-0x28(%ebp)
    44ba:	e8 5f 0a 00 00       	call   4f1e <get_super_block>
    44bf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    44c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    44c5:	8b 00                	mov    (%eax),%eax
    44c7:	89 45 d0             	mov    %eax,-0x30(%ebp)
    44ca:	8b 45 08             	mov    0x8(%ebp),%eax
    44cd:	8b 40 0c             	mov    0xc(%eax),%eax
    44d0:	05 00 02 00 00       	add    $0x200,%eax
    44d5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    44db:	85 c0                	test   %eax,%eax
    44dd:	0f 48 c2             	cmovs  %edx,%eax
    44e0:	c1 f8 09             	sar    $0x9,%eax
    44e3:	89 45 cc             	mov    %eax,-0x34(%ebp)
    44e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    44ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    44f4:	c7 45 c8 20 00 00 00 	movl   $0x20,-0x38(%ebp)
    44fb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    4502:	eb 7d                	jmp    4581 <new_dir_entry+0xf8>
    4504:	a1 10 90 00 00       	mov    0x9010,%eax
    4509:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    450c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    450f:	01 ca                	add    %ecx,%edx
    4511:	83 ec 0c             	sub    $0xc,%esp
    4514:	6a 01                	push   $0x1
    4516:	68 00 02 00 00       	push   $0x200
    451b:	50                   	push   %eax
    451c:	ff 75 c8             	pushl  -0x38(%ebp)
    451f:	52                   	push   %edx
    4520:	e8 97 f3 ff ff       	call   38bc <rd_wt>
    4525:	83 c4 20             	add    $0x20,%esp
    4528:	a1 10 90 00 00       	mov    0x9010,%eax
    452d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4530:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4537:	eb 25                	jmp    455e <new_dir_entry+0xd5>
    4539:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    453d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4540:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    4543:	7f 29                	jg     456e <new_dir_entry+0xe5>
    4545:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4548:	8b 00                	mov    (%eax),%eax
    454a:	85 c0                	test   %eax,%eax
    454c:	75 08                	jne    4556 <new_dir_entry+0xcd>
    454e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4551:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4554:	eb 19                	jmp    456f <new_dir_entry+0xe6>
    4556:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    455a:	83 45 f0 14          	addl   $0x14,-0x10(%ebp)
    455e:	b8 00 02 00 00       	mov    $0x200,%eax
    4563:	99                   	cltd   
    4564:	f7 7d e0             	idivl  -0x20(%ebp)
    4567:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    456a:	7c cd                	jl     4539 <new_dir_entry+0xb0>
    456c:	eb 01                	jmp    456f <new_dir_entry+0xe6>
    456e:	90                   	nop
    456f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4572:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    4575:	7f 16                	jg     458d <new_dir_entry+0x104>
    4577:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    457b:	75 10                	jne    458d <new_dir_entry+0x104>
    457d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4581:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4584:	3b 45 cc             	cmp    -0x34(%ebp),%eax
    4587:	0f 8c 77 ff ff ff    	jl     4504 <new_dir_entry+0x7b>
    458d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4590:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    4593:	75 07                	jne    459c <new_dir_entry+0x113>
    4595:	b8 00 00 00 00       	mov    $0x0,%eax
    459a:	eb 6c                	jmp    4608 <new_dir_entry+0x17f>
    459c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    45a0:	75 25                	jne    45c7 <new_dir_entry+0x13e>
    45a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    45a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    45a8:	8b 45 08             	mov    0x8(%ebp),%eax
    45ab:	8b 50 04             	mov    0x4(%eax),%edx
    45ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
    45b1:	01 c2                	add    %eax,%edx
    45b3:	8b 45 08             	mov    0x8(%ebp),%eax
    45b6:	89 50 04             	mov    %edx,0x4(%eax)
    45b9:	83 ec 0c             	sub    $0xc,%esp
    45bc:	ff 75 08             	pushl  0x8(%ebp)
    45bf:	e8 d8 07 00 00       	call   4d9c <sync_inode>
    45c4:	83 c4 10             	add    $0x10,%esp
    45c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45ca:	8b 55 10             	mov    0x10(%ebp),%edx
    45cd:	89 10                	mov    %edx,(%eax)
    45cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45d2:	83 c0 04             	add    $0x4,%eax
    45d5:	83 ec 08             	sub    $0x8,%esp
    45d8:	ff 75 0c             	pushl  0xc(%ebp)
    45db:	50                   	push   %eax
    45dc:	e8 f3 24 00 00       	call   6ad4 <Strcpy>
    45e1:	83 c4 10             	add    $0x10,%esp
    45e4:	a1 10 90 00 00       	mov    0x9010,%eax
    45e9:	8b 4d d0             	mov    -0x30(%ebp),%ecx
    45ec:	8b 55 e8             	mov    -0x18(%ebp),%edx
    45ef:	01 ca                	add    %ecx,%edx
    45f1:	83 ec 0c             	sub    $0xc,%esp
    45f4:	6a 02                	push   $0x2
    45f6:	68 00 02 00 00       	push   $0x200
    45fb:	50                   	push   %eax
    45fc:	ff 75 c8             	pushl  -0x38(%ebp)
    45ff:	52                   	push   %edx
    4600:	e8 b7 f2 ff ff       	call   38bc <rd_wt>
    4605:	83 c4 20             	add    $0x20,%esp
    4608:	c9                   	leave  
    4609:	c3                   	ret    

0000460a <do_unlink>:
    460a:	55                   	push   %ebp
    460b:	89 e5                	mov    %esp,%ebp
    460d:	53                   	push   %ebx
    460e:	83 ec 74             	sub    $0x74,%esp
    4611:	ff 75 08             	pushl  0x8(%ebp)
    4614:	68 aa 69 00 00       	push   $0x69aa
    4619:	e8 33 f9 ff ff       	call   3f51 <strcmp>
    461e:	83 c4 08             	add    $0x8,%esp
    4621:	85 c0                	test   %eax,%eax
    4623:	75 10                	jne    4635 <do_unlink+0x2b>
    4625:	83 ec 0c             	sub    $0xc,%esp
    4628:	68 ac 69 00 00       	push   $0x69ac
    462d:	e8 0c dc ff ff       	call   223e <panic>
    4632:	83 c4 10             	add    $0x10,%esp
    4635:	83 ec 0c             	sub    $0xc,%esp
    4638:	ff 75 08             	pushl  0x8(%ebp)
    463b:	e8 78 f7 ff ff       	call   3db8 <search_file>
    4640:	83 c4 10             	add    $0x10,%esp
    4643:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4646:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
    464a:	75 10                	jne    465c <do_unlink+0x52>
    464c:	83 ec 0c             	sub    $0xc,%esp
    464f:	68 c8 69 00 00       	push   $0x69c8
    4654:	e8 e5 db ff ff       	call   223e <panic>
    4659:	83 c4 10             	add    $0x10,%esp
    465c:	83 ec 0c             	sub    $0xc,%esp
    465f:	ff 75 d0             	pushl  -0x30(%ebp)
    4662:	e8 59 f9 ff ff       	call   3fc0 <get_inode>
    4667:	83 c4 10             	add    $0x10,%esp
    466a:	89 45 cc             	mov    %eax,-0x34(%ebp)
    466d:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    4671:	75 10                	jne    4683 <do_unlink+0x79>
    4673:	83 ec 0c             	sub    $0xc,%esp
    4676:	68 c8 69 00 00       	push   $0x69c8
    467b:	e8 be db ff ff       	call   223e <panic>
    4680:	83 c4 10             	add    $0x10,%esp
    4683:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4686:	8b 40 18             	mov    0x18(%eax),%eax
    4689:	85 c0                	test   %eax,%eax
    468b:	7e 10                	jle    469d <do_unlink+0x93>
    468d:	83 ec 0c             	sub    $0xc,%esp
    4690:	68 e4 69 00 00       	push   $0x69e4
    4695:	e8 a4 db ff ff       	call   223e <panic>
    469a:	83 c4 10             	add    $0x10,%esp
    469d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    46a0:	8b 40 10             	mov    0x10(%eax),%eax
    46a3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    46a6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    46a9:	8d 50 07             	lea    0x7(%eax),%edx
    46ac:	85 c0                	test   %eax,%eax
    46ae:	0f 48 c2             	cmovs  %edx,%eax
    46b1:	c1 f8 03             	sar    $0x3,%eax
    46b4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    46b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    46ba:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    46c0:	85 c0                	test   %eax,%eax
    46c2:	0f 48 c2             	cmovs  %edx,%eax
    46c5:	c1 f8 09             	sar    $0x9,%eax
    46c8:	89 45 c0             	mov    %eax,-0x40(%ebp)
    46cb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    46ce:	99                   	cltd   
    46cf:	c1 ea 1d             	shr    $0x1d,%edx
    46d2:	01 d0                	add    %edx,%eax
    46d4:	83 e0 07             	and    $0x7,%eax
    46d7:	29 d0                	sub    %edx,%eax
    46d9:	89 45 bc             	mov    %eax,-0x44(%ebp)
    46dc:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
    46e3:	a1 10 90 00 00       	mov    0x9010,%eax
    46e8:	8b 55 c0             	mov    -0x40(%ebp),%edx
    46eb:	83 c2 02             	add    $0x2,%edx
    46ee:	83 ec 0c             	sub    $0xc,%esp
    46f1:	6a 01                	push   $0x1
    46f3:	68 00 02 00 00       	push   $0x200
    46f8:	50                   	push   %eax
    46f9:	ff 75 b8             	pushl  -0x48(%ebp)
    46fc:	52                   	push   %edx
    46fd:	e8 ba f1 ff ff       	call   38bc <rd_wt>
    4702:	83 c4 20             	add    $0x20,%esp
    4705:	8b 15 10 90 00 00    	mov    0x9010,%edx
    470b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    470e:	01 d0                	add    %edx,%eax
    4710:	0f b6 10             	movzbl (%eax),%edx
    4713:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4716:	bb 01 00 00 00       	mov    $0x1,%ebx
    471b:	89 c1                	mov    %eax,%ecx
    471d:	d3 e3                	shl    %cl,%ebx
    471f:	89 d8                	mov    %ebx,%eax
    4721:	f7 d0                	not    %eax
    4723:	89 c3                	mov    %eax,%ebx
    4725:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    472b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    472e:	01 c8                	add    %ecx,%eax
    4730:	21 da                	and    %ebx,%edx
    4732:	88 10                	mov    %dl,(%eax)
    4734:	a1 10 90 00 00       	mov    0x9010,%eax
    4739:	8b 55 c0             	mov    -0x40(%ebp),%edx
    473c:	83 c2 02             	add    $0x2,%edx
    473f:	83 ec 0c             	sub    $0xc,%esp
    4742:	6a 02                	push   $0x2
    4744:	68 00 02 00 00       	push   $0x200
    4749:	50                   	push   %eax
    474a:	ff 75 b8             	pushl  -0x48(%ebp)
    474d:	52                   	push   %edx
    474e:	e8 69 f1 ff ff       	call   38bc <rd_wt>
    4753:	83 c4 20             	add    $0x20,%esp
    4756:	e8 c3 07 00 00       	call   4f1e <get_super_block>
    475b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    475e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4761:	8b 50 08             	mov    0x8(%eax),%edx
    4764:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4767:	8b 00                	mov    (%eax),%eax
    4769:	29 c2                	sub    %eax,%edx
    476b:	89 d0                	mov    %edx,%eax
    476d:	83 c0 01             	add    $0x1,%eax
    4770:	89 45 b0             	mov    %eax,-0x50(%ebp)
    4773:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4776:	8d 50 07             	lea    0x7(%eax),%edx
    4779:	85 c0                	test   %eax,%eax
    477b:	0f 48 c2             	cmovs  %edx,%eax
    477e:	c1 f8 03             	sar    $0x3,%eax
    4781:	89 45 ac             	mov    %eax,-0x54(%ebp)
    4784:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4787:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
    478d:	85 c0                	test   %eax,%eax
    478f:	0f 48 c2             	cmovs  %edx,%eax
    4792:	c1 f8 09             	sar    $0x9,%eax
    4795:	89 45 a8             	mov    %eax,-0x58(%ebp)
    4798:	8b 45 b0             	mov    -0x50(%ebp),%eax
    479b:	99                   	cltd   
    479c:	c1 ea 1d             	shr    $0x1d,%edx
    479f:	01 d0                	add    %edx,%eax
    47a1:	83 e0 07             	and    $0x7,%eax
    47a4:	29 d0                	sub    %edx,%eax
    47a6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    47a9:	b8 08 00 00 00       	mov    $0x8,%eax
    47ae:	2b 45 a4             	sub    -0x5c(%ebp),%eax
    47b1:	8b 55 b0             	mov    -0x50(%ebp),%edx
    47b4:	29 c2                	sub    %eax,%edx
    47b6:	89 d0                	mov    %edx,%eax
    47b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    47bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47be:	8d 50 07             	lea    0x7(%eax),%edx
    47c1:	85 c0                	test   %eax,%eax
    47c3:	0f 48 c2             	cmovs  %edx,%eax
    47c6:	c1 f8 03             	sar    $0x3,%eax
    47c9:	89 45 a0             	mov    %eax,-0x60(%ebp)
    47cc:	a1 10 90 00 00       	mov    0x9010,%eax
    47d1:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    47d4:	8b 52 04             	mov    0x4(%edx),%edx
    47d7:	8d 4a 02             	lea    0x2(%edx),%ecx
    47da:	8b 55 a8             	mov    -0x58(%ebp),%edx
    47dd:	01 ca                	add    %ecx,%edx
    47df:	83 ec 0c             	sub    $0xc,%esp
    47e2:	6a 01                	push   $0x1
    47e4:	68 00 02 00 00       	push   $0x200
    47e9:	50                   	push   %eax
    47ea:	ff 75 b8             	pushl  -0x48(%ebp)
    47ed:	52                   	push   %edx
    47ee:	e8 c9 f0 ff ff       	call   38bc <rd_wt>
    47f3:	83 c4 20             	add    $0x20,%esp
    47f6:	8b 15 10 90 00 00    	mov    0x9010,%edx
    47fc:	8b 45 ac             	mov    -0x54(%ebp),%eax
    47ff:	01 d0                	add    %edx,%eax
    4801:	0f b6 10             	movzbl (%eax),%edx
    4804:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4807:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    480c:	89 c1                	mov    %eax,%ecx
    480e:	d3 e3                	shl    %cl,%ebx
    4810:	89 d8                	mov    %ebx,%eax
    4812:	f7 d0                	not    %eax
    4814:	89 c3                	mov    %eax,%ebx
    4816:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    481c:	8b 45 ac             	mov    -0x54(%ebp),%eax
    481f:	01 c8                	add    %ecx,%eax
    4821:	21 da                	and    %ebx,%edx
    4823:	88 10                	mov    %dl,(%eax)
    4825:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    482c:	8b 45 a8             	mov    -0x58(%ebp),%eax
    482f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4832:	eb 6a                	jmp    489e <do_unlink+0x294>
    4834:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    483b:	75 4b                	jne    4888 <do_unlink+0x27e>
    483d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4844:	a1 10 90 00 00       	mov    0x9010,%eax
    4849:	83 ec 0c             	sub    $0xc,%esp
    484c:	6a 02                	push   $0x2
    484e:	68 00 02 00 00       	push   $0x200
    4853:	50                   	push   %eax
    4854:	ff 75 b8             	pushl  -0x48(%ebp)
    4857:	ff 75 ec             	pushl  -0x14(%ebp)
    485a:	e8 5d f0 ff ff       	call   38bc <rd_wt>
    485f:	83 c4 20             	add    $0x20,%esp
    4862:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4868:	8b 45 ec             	mov    -0x14(%ebp),%eax
    486b:	8d 48 01             	lea    0x1(%eax),%ecx
    486e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    4871:	83 ec 0c             	sub    $0xc,%esp
    4874:	6a 01                	push   $0x1
    4876:	68 00 02 00 00       	push   $0x200
    487b:	52                   	push   %edx
    487c:	ff 75 b8             	pushl  -0x48(%ebp)
    487f:	50                   	push   %eax
    4880:	e8 37 f0 ff ff       	call   38bc <rd_wt>
    4885:	83 c4 20             	add    $0x20,%esp
    4888:	8b 15 10 90 00 00    	mov    0x9010,%edx
    488e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4891:	01 d0                	add    %edx,%eax
    4893:	c6 00 00             	movb   $0x0,(%eax)
    4896:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    489a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
    489e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    48a1:	3b 45 a0             	cmp    -0x60(%ebp),%eax
    48a4:	7c 8e                	jl     4834 <do_unlink+0x22a>
    48a6:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
    48ad:	75 4b                	jne    48fa <do_unlink+0x2f0>
    48af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    48b6:	a1 10 90 00 00       	mov    0x9010,%eax
    48bb:	83 ec 0c             	sub    $0xc,%esp
    48be:	6a 02                	push   $0x2
    48c0:	68 00 02 00 00       	push   $0x200
    48c5:	50                   	push   %eax
    48c6:	ff 75 b8             	pushl  -0x48(%ebp)
    48c9:	ff 75 ec             	pushl  -0x14(%ebp)
    48cc:	e8 eb ef ff ff       	call   38bc <rd_wt>
    48d1:	83 c4 20             	add    $0x20,%esp
    48d4:	8b 15 10 90 00 00    	mov    0x9010,%edx
    48da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    48dd:	8d 48 01             	lea    0x1(%eax),%ecx
    48e0:	89 4d ec             	mov    %ecx,-0x14(%ebp)
    48e3:	83 ec 0c             	sub    $0xc,%esp
    48e6:	6a 01                	push   $0x1
    48e8:	68 00 02 00 00       	push   $0x200
    48ed:	52                   	push   %edx
    48ee:	ff 75 b8             	pushl  -0x48(%ebp)
    48f1:	50                   	push   %eax
    48f2:	e8 c5 ef ff ff       	call   38bc <rd_wt>
    48f7:	83 c4 20             	add    $0x20,%esp
    48fa:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4900:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4903:	01 d0                	add    %edx,%eax
    4905:	0f b6 10             	movzbl (%eax),%edx
    4908:	8b 45 f4             	mov    -0xc(%ebp),%eax
    490b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    4910:	89 c1                	mov    %eax,%ecx
    4912:	d3 e3                	shl    %cl,%ebx
    4914:	89 d8                	mov    %ebx,%eax
    4916:	89 c3                	mov    %eax,%ebx
    4918:	8b 0d 10 90 00 00    	mov    0x9010,%ecx
    491e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4921:	01 c8                	add    %ecx,%eax
    4923:	21 da                	and    %ebx,%edx
    4925:	88 10                	mov    %dl,(%eax)
    4927:	a1 10 90 00 00       	mov    0x9010,%eax
    492c:	83 ec 0c             	sub    $0xc,%esp
    492f:	6a 02                	push   $0x2
    4931:	68 00 02 00 00       	push   $0x200
    4936:	50                   	push   %eax
    4937:	ff 75 b8             	pushl  -0x48(%ebp)
    493a:	ff 75 ec             	pushl  -0x14(%ebp)
    493d:	e8 7a ef ff ff       	call   38bc <rd_wt>
    4942:	83 c4 20             	add    $0x20,%esp
    4945:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4948:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    494f:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4952:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    4959:	8b 45 cc             	mov    -0x34(%ebp),%eax
    495c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    4963:	83 ec 0c             	sub    $0xc,%esp
    4966:	ff 75 cc             	pushl  -0x34(%ebp)
    4969:	e8 2e 04 00 00       	call   4d9c <sync_inode>
    496e:	83 c4 10             	add    $0x10,%esp
    4971:	83 ec 0c             	sub    $0xc,%esp
    4974:	ff 75 cc             	pushl  -0x34(%ebp)
    4977:	e8 f1 04 00 00       	call   4e6d <put_inode>
    497c:	83 c4 10             	add    $0x10,%esp
    497f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4982:	8b 00                	mov    (%eax),%eax
    4984:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4987:	a1 6c cc 00 00       	mov    0xcc6c,%eax
    498c:	89 45 98             	mov    %eax,-0x68(%ebp)
    498f:	8b 45 98             	mov    -0x68(%ebp),%eax
    4992:	8b 40 04             	mov    0x4(%eax),%eax
    4995:	89 45 94             	mov    %eax,-0x6c(%ebp)
    4998:	8b 45 98             	mov    -0x68(%ebp),%eax
    499b:	8b 40 0c             	mov    0xc(%eax),%eax
    499e:	89 45 90             	mov    %eax,-0x70(%ebp)
    49a1:	8b 45 94             	mov    -0x6c(%ebp),%eax
    49a4:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    49a9:	f7 e2                	mul    %edx
    49ab:	89 d0                	mov    %edx,%eax
    49ad:	c1 e8 04             	shr    $0x4,%eax
    49b0:	89 45 8c             	mov    %eax,-0x74(%ebp)
    49b3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    49ba:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    49c1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    49c8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    49cf:	e9 a3 00 00 00       	jmp    4a77 <do_unlink+0x46d>
    49d4:	a1 10 90 00 00       	mov    0x9010,%eax
    49d9:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    49dc:	8b 55 d8             	mov    -0x28(%ebp),%edx
    49df:	01 ca                	add    %ecx,%edx
    49e1:	83 ec 0c             	sub    $0xc,%esp
    49e4:	6a 01                	push   $0x1
    49e6:	68 00 02 00 00       	push   $0x200
    49eb:	50                   	push   %eax
    49ec:	ff 75 b8             	pushl  -0x48(%ebp)
    49ef:	52                   	push   %edx
    49f0:	e8 c7 ee ff ff       	call   38bc <rd_wt>
    49f5:	83 c4 20             	add    $0x20,%esp
    49f8:	a1 10 90 00 00       	mov    0x9010,%eax
    49fd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4a00:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    4a07:	eb 51                	jmp    4a5a <do_unlink+0x450>
    4a09:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4a0d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4a10:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    4a13:	7f 4f                	jg     4a64 <do_unlink+0x45a>
    4a15:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4a18:	83 c0 14             	add    $0x14,%eax
    4a1b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4a1e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4a21:	83 c0 04             	add    $0x4,%eax
    4a24:	83 ec 08             	sub    $0x8,%esp
    4a27:	ff 75 08             	pushl  0x8(%ebp)
    4a2a:	50                   	push   %eax
    4a2b:	e8 21 f5 ff ff       	call   3f51 <strcmp>
    4a30:	83 c4 10             	add    $0x10,%esp
    4a33:	85 c0                	test   %eax,%eax
    4a35:	75 1b                	jne    4a52 <do_unlink+0x448>
    4a37:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    4a3e:	83 ec 04             	sub    $0x4,%esp
    4a41:	6a 14                	push   $0x14
    4a43:	6a 00                	push   $0x0
    4a45:	ff 75 d4             	pushl  -0x2c(%ebp)
    4a48:	e8 68 20 00 00       	call   6ab5 <Memset>
    4a4d:	83 c4 10             	add    $0x10,%esp
    4a50:	eb 13                	jmp    4a65 <do_unlink+0x45b>
    4a52:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    4a56:	83 45 d4 14          	addl   $0x14,-0x2c(%ebp)
    4a5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4a5d:	3b 45 90             	cmp    -0x70(%ebp),%eax
    4a60:	7c a7                	jl     4a09 <do_unlink+0x3ff>
    4a62:	eb 01                	jmp    4a65 <do_unlink+0x45b>
    4a64:	90                   	nop
    4a65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4a68:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    4a6b:	7f 16                	jg     4a83 <do_unlink+0x479>
    4a6d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4a71:	75 10                	jne    4a83 <do_unlink+0x479>
    4a73:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    4a77:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4a7a:	3b 45 90             	cmp    -0x70(%ebp),%eax
    4a7d:	0f 8c 51 ff ff ff    	jl     49d4 <do_unlink+0x3ca>
    4a83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4a86:	3b 45 8c             	cmp    -0x74(%ebp),%eax
    4a89:	75 17                	jne    4aa2 <do_unlink+0x498>
    4a8b:	8b 45 98             	mov    -0x68(%ebp),%eax
    4a8e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4a91:	89 50 04             	mov    %edx,0x4(%eax)
    4a94:	83 ec 0c             	sub    $0xc,%esp
    4a97:	ff 75 98             	pushl  -0x68(%ebp)
    4a9a:	e8 fd 02 00 00       	call   4d9c <sync_inode>
    4a9f:	83 c4 10             	add    $0x10,%esp
    4aa2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4aa6:	74 24                	je     4acc <do_unlink+0x4c2>
    4aa8:	a1 10 90 00 00       	mov    0x9010,%eax
    4aad:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    4ab0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ab3:	01 ca                	add    %ecx,%edx
    4ab5:	83 ec 0c             	sub    $0xc,%esp
    4ab8:	6a 02                	push   $0x2
    4aba:	68 00 02 00 00       	push   $0x200
    4abf:	50                   	push   %eax
    4ac0:	ff 75 b8             	pushl  -0x48(%ebp)
    4ac3:	52                   	push   %edx
    4ac4:	e8 f3 ed ff ff       	call   38bc <rd_wt>
    4ac9:	83 c4 20             	add    $0x20,%esp
    4acc:	90                   	nop
    4acd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4ad0:	c9                   	leave  
    4ad1:	c3                   	ret    

00004ad2 <do_rdwt>:
    4ad2:	55                   	push   %ebp
    4ad3:	89 e5                	mov    %esp,%ebp
    4ad5:	83 ec 78             	sub    $0x78,%esp
    4ad8:	8b 45 08             	mov    0x8(%ebp),%eax
    4adb:	8b 40 04             	mov    0x4(%eax),%eax
    4ade:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4ae1:	8b 45 08             	mov    0x8(%ebp),%eax
    4ae4:	8b 40 1c             	mov    0x1c(%eax),%eax
    4ae7:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4aea:	8b 45 08             	mov    0x8(%ebp),%eax
    4aed:	8b 40 5c             	mov    0x5c(%eax),%eax
    4af0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4af3:	8b 45 08             	mov    0x8(%ebp),%eax
    4af6:	8b 00                	mov    (%eax),%eax
    4af8:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4afb:	8b 45 08             	mov    0x8(%ebp),%eax
    4afe:	8b 40 10             	mov    0x10(%eax),%eax
    4b01:	89 45 cc             	mov    %eax,-0x34(%ebp)
    4b04:	8b 45 08             	mov    0x8(%ebp),%eax
    4b07:	8b 40 40             	mov    0x40(%eax),%eax
    4b0a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4b0d:	8b 45 08             	mov    0x8(%ebp),%eax
    4b10:	8b 40 60             	mov    0x60(%eax),%eax
    4b13:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4b16:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4b19:	6b d0 64             	imul   $0x64,%eax,%edx
    4b1c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4b1f:	01 d0                	add    %edx,%eax
    4b21:	83 c0 1c             	add    $0x1c,%eax
    4b24:	8b 04 85 2c 4f 01 00 	mov    0x14f2c(,%eax,4),%eax
    4b2b:	8b 40 08             	mov    0x8(%eax),%eax
    4b2e:	89 45 c0             	mov    %eax,-0x40(%ebp)
    4b31:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4b34:	8b 40 04             	mov    0x4(%eax),%eax
    4b37:	89 45 bc             	mov    %eax,-0x44(%ebp)
    4b3a:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4b3d:	8b 00                	mov    (%eax),%eax
    4b3f:	85 c0                	test   %eax,%eax
    4b41:	75 5b                	jne    4b9e <do_rdwt+0xcc>
    4b43:	8b 45 08             	mov    0x8(%ebp),%eax
    4b46:	8b 40 04             	mov    0x4(%eax),%eax
    4b49:	83 f8 07             	cmp    $0x7,%eax
    4b4c:	75 09                	jne    4b57 <do_rdwt+0x85>
    4b4e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
    4b55:	eb 12                	jmp    4b69 <do_rdwt+0x97>
    4b57:	8b 45 08             	mov    0x8(%ebp),%eax
    4b5a:	8b 40 04             	mov    0x4(%eax),%eax
    4b5d:	83 f8 0a             	cmp    $0xa,%eax
    4b60:	75 07                	jne    4b69 <do_rdwt+0x97>
    4b62:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
    4b69:	8b 45 08             	mov    0x8(%ebp),%eax
    4b6c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4b6f:	89 50 04             	mov    %edx,0x4(%eax)
    4b72:	8b 45 08             	mov    0x8(%ebp),%eax
    4b75:	8b 00                	mov    (%eax),%eax
    4b77:	89 c2                	mov    %eax,%edx
    4b79:	8b 45 08             	mov    0x8(%ebp),%eax
    4b7c:	89 50 58             	mov    %edx,0x58(%eax)
    4b7f:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
    4b86:	83 ec 04             	sub    $0x4,%esp
    4b89:	ff 75 b8             	pushl  -0x48(%ebp)
    4b8c:	ff 75 08             	pushl  0x8(%ebp)
    4b8f:	6a 03                	push   $0x3
    4b91:	e8 1d de ff ff       	call   29b3 <send_rec>
    4b96:	83 c4 10             	add    $0x10,%esp
    4b99:	e9 fc 01 00 00       	jmp    4d9a <do_rdwt+0x2c8>
    4b9e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    4ba2:	75 14                	jne    4bb8 <do_rdwt+0xe6>
    4ba4:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4ba7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4baa:	01 d0                	add    %edx,%eax
    4bac:	39 45 bc             	cmp    %eax,-0x44(%ebp)
    4baf:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
    4bb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4bb6:	eb 19                	jmp    4bd1 <do_rdwt+0xff>
    4bb8:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4bbb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4bbe:	01 c2                	add    %eax,%edx
    4bc0:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4bc3:	8b 40 0c             	mov    0xc(%eax),%eax
    4bc6:	c1 e0 09             	shl    $0x9,%eax
    4bc9:	39 c2                	cmp    %eax,%edx
    4bcb:	0f 4e c2             	cmovle %edx,%eax
    4bce:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4bd1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4bd4:	99                   	cltd   
    4bd5:	c1 ea 17             	shr    $0x17,%edx
    4bd8:	01 d0                	add    %edx,%eax
    4bda:	25 ff 01 00 00       	and    $0x1ff,%eax
    4bdf:	29 d0                	sub    %edx,%eax
    4be1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4be4:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4be7:	8b 50 08             	mov    0x8(%eax),%edx
    4bea:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4bed:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    4bf3:	85 c0                	test   %eax,%eax
    4bf5:	0f 48 c1             	cmovs  %ecx,%eax
    4bf8:	c1 f8 09             	sar    $0x9,%eax
    4bfb:	01 d0                	add    %edx,%eax
    4bfd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    4c00:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4c03:	8b 50 08             	mov    0x8(%eax),%edx
    4c06:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4c09:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
    4c0f:	85 c0                	test   %eax,%eax
    4c11:	0f 48 c1             	cmovs  %ecx,%eax
    4c14:	c1 f8 09             	sar    $0x9,%eax
    4c17:	01 d0                	add    %edx,%eax
    4c19:	89 45 b0             	mov    %eax,-0x50(%ebp)
    4c1c:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4c1f:	2b 45 b4             	sub    -0x4c(%ebp),%eax
    4c22:	ba 00 00 10 00       	mov    $0x100000,%edx
    4c27:	39 d0                	cmp    %edx,%eax
    4c29:	7d 0b                	jge    4c36 <do_rdwt+0x164>
    4c2b:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4c2e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
    4c31:	83 c0 01             	add    $0x1,%eax
    4c34:	eb 05                	jmp    4c3b <do_rdwt+0x169>
    4c36:	b8 00 00 10 00       	mov    $0x100000,%eax
    4c3b:	89 45 ac             	mov    %eax,-0x54(%ebp)
    4c3e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4c41:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4c44:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    4c4b:	8b 45 08             	mov    0x8(%ebp),%eax
    4c4e:	8b 00                	mov    (%eax),%eax
    4c50:	83 ec 0c             	sub    $0xc,%esp
    4c53:	50                   	push   %eax
    4c54:	e8 da 03 00 00       	call   5033 <pid2proc>
    4c59:	83 c4 10             	add    $0x10,%esp
    4c5c:	89 45 a8             	mov    %eax,-0x58(%ebp)
    4c5f:	8b 45 a8             	mov    -0x58(%ebp),%eax
    4c62:	8b 40 0c             	mov    0xc(%eax),%eax
    4c65:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    4c68:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4c6b:	83 ec 08             	sub    $0x8,%esp
    4c6e:	ff 75 a8             	pushl  -0x58(%ebp)
    4c71:	50                   	push   %eax
    4c72:	e8 a5 04 00 00       	call   511c <Seg2PhyAddrLDT>
    4c77:	83 c4 10             	add    $0x10,%esp
    4c7a:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4c7d:	8b 55 a0             	mov    -0x60(%ebp),%edx
    4c80:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4c83:	01 d0                	add    %edx,%eax
    4c85:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4c88:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4c8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4c8e:	e9 c7 00 00 00       	jmp    4d5a <do_rdwt+0x288>
    4c93:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4c96:	c1 e0 09             	shl    $0x9,%eax
    4c99:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4c9c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
    4c9f:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
    4ca3:	89 45 98             	mov    %eax,-0x68(%ebp)
    4ca6:	c7 45 94 20 00 00 00 	movl   $0x20,-0x6c(%ebp)
    4cad:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4cb0:	c1 e0 09             	shl    $0x9,%eax
    4cb3:	89 c2                	mov    %eax,%edx
    4cb5:	a1 10 90 00 00       	mov    0x9010,%eax
    4cba:	83 ec 0c             	sub    $0xc,%esp
    4cbd:	6a 07                	push   $0x7
    4cbf:	52                   	push   %edx
    4cc0:	50                   	push   %eax
    4cc1:	ff 75 94             	pushl  -0x6c(%ebp)
    4cc4:	ff 75 e0             	pushl  -0x20(%ebp)
    4cc7:	e8 f0 eb ff ff       	call   38bc <rd_wt>
    4ccc:	83 c4 20             	add    $0x20,%esp
    4ccf:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
    4cd3:	75 25                	jne    4cfa <do_rdwt+0x228>
    4cd5:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4cdb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4cde:	01 d0                	add    %edx,%eax
    4ce0:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
    4ce3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    4ce6:	01 ca                	add    %ecx,%edx
    4ce8:	83 ec 04             	sub    $0x4,%esp
    4ceb:	ff 75 98             	pushl  -0x68(%ebp)
    4cee:	50                   	push   %eax
    4cef:	52                   	push   %edx
    4cf0:	e8 92 1d 00 00       	call   6a87 <Memcpy>
    4cf5:	83 c4 10             	add    $0x10,%esp
    4cf8:	eb 47                	jmp    4d41 <do_rdwt+0x26f>
    4cfa:	8b 55 9c             	mov    -0x64(%ebp),%edx
    4cfd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d00:	01 d0                	add    %edx,%eax
    4d02:	89 c1                	mov    %eax,%ecx
    4d04:	8b 15 10 90 00 00    	mov    0x9010,%edx
    4d0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4d0d:	01 d0                	add    %edx,%eax
    4d0f:	83 ec 04             	sub    $0x4,%esp
    4d12:	ff 75 98             	pushl  -0x68(%ebp)
    4d15:	51                   	push   %ecx
    4d16:	50                   	push   %eax
    4d17:	e8 6b 1d 00 00       	call   6a87 <Memcpy>
    4d1c:	83 c4 10             	add    $0x10,%esp
    4d1f:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4d22:	c1 e0 09             	shl    $0x9,%eax
    4d25:	89 c2                	mov    %eax,%edx
    4d27:	a1 10 90 00 00       	mov    0x9010,%eax
    4d2c:	83 ec 0c             	sub    $0xc,%esp
    4d2f:	6a 0a                	push   $0xa
    4d31:	52                   	push   %edx
    4d32:	50                   	push   %eax
    4d33:	ff 75 94             	pushl  -0x6c(%ebp)
    4d36:	ff 75 e0             	pushl  -0x20(%ebp)
    4d39:	e8 7e eb ff ff       	call   38bc <rd_wt>
    4d3e:	83 c4 20             	add    $0x20,%esp
    4d41:	8b 45 98             	mov    -0x68(%ebp),%eax
    4d44:	29 45 e8             	sub    %eax,-0x18(%ebp)
    4d47:	8b 45 98             	mov    -0x68(%ebp),%eax
    4d4a:	01 45 e4             	add    %eax,-0x1c(%ebp)
    4d4d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4d54:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4d57:	01 45 e0             	add    %eax,-0x20(%ebp)
    4d5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4d5d:	3b 45 b0             	cmp    -0x50(%ebp),%eax
    4d60:	7f 0a                	jg     4d6c <do_rdwt+0x29a>
    4d62:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4d66:	0f 85 27 ff ff ff    	jne    4c93 <do_rdwt+0x1c1>
    4d6c:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4d6f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4d72:	01 c2                	add    %eax,%edx
    4d74:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4d77:	8b 40 04             	mov    0x4(%eax),%eax
    4d7a:	39 c2                	cmp    %eax,%edx
    4d7c:	7e 1c                	jle    4d9a <do_rdwt+0x2c8>
    4d7e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    4d81:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4d84:	01 c2                	add    %eax,%edx
    4d86:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4d89:	89 50 04             	mov    %edx,0x4(%eax)
    4d8c:	83 ec 0c             	sub    $0xc,%esp
    4d8f:	ff 75 c0             	pushl  -0x40(%ebp)
    4d92:	e8 05 00 00 00       	call   4d9c <sync_inode>
    4d97:	83 c4 10             	add    $0x10,%esp
    4d9a:	c9                   	leave  
    4d9b:	c3                   	ret    

00004d9c <sync_inode>:
    4d9c:	55                   	push   %ebp
    4d9d:	89 e5                	mov    %esp,%ebp
    4d9f:	53                   	push   %ebx
    4da0:	83 ec 24             	sub    $0x24,%esp
    4da3:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
    4daa:	8b 45 08             	mov    0x8(%ebp),%eax
    4dad:	8b 40 10             	mov    0x10(%eax),%eax
    4db0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4db3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4db6:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4db9:	b8 00 02 00 00       	mov    $0x200,%eax
    4dbe:	99                   	cltd   
    4dbf:	f7 7d f4             	idivl  -0xc(%ebp)
    4dc2:	89 c3                	mov    %eax,%ebx
    4dc4:	89 c8                	mov    %ecx,%eax
    4dc6:	99                   	cltd   
    4dc7:	f7 fb                	idiv   %ebx
    4dc9:	89 55 ec             	mov    %edx,-0x14(%ebp)
    4dcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4dcf:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4dd2:	b8 00 02 00 00       	mov    $0x200,%eax
    4dd7:	99                   	cltd   
    4dd8:	f7 7d f4             	idivl  -0xc(%ebp)
    4ddb:	89 c3                	mov    %eax,%ebx
    4ddd:	89 c8                	mov    %ecx,%eax
    4ddf:	99                   	cltd   
    4de0:	f7 fb                	idiv   %ebx
    4de2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4de5:	8b 45 08             	mov    0x8(%ebp),%eax
    4de8:	8b 40 14             	mov    0x14(%eax),%eax
    4deb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4dee:	e8 2b 01 00 00       	call   4f1e <get_super_block>
    4df3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4df6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4df9:	8b 40 04             	mov    0x4(%eax),%eax
    4dfc:	8d 50 02             	lea    0x2(%eax),%edx
    4dff:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4e02:	8b 40 08             	mov    0x8(%eax),%eax
    4e05:	01 c2                	add    %eax,%edx
    4e07:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e0a:	01 d0                	add    %edx,%eax
    4e0c:	89 45 dc             	mov    %eax,-0x24(%ebp)
    4e0f:	a1 10 90 00 00       	mov    0x9010,%eax
    4e14:	83 ec 0c             	sub    $0xc,%esp
    4e17:	6a 01                	push   $0x1
    4e19:	68 00 02 00 00       	push   $0x200
    4e1e:	50                   	push   %eax
    4e1f:	ff 75 e4             	pushl  -0x1c(%ebp)
    4e22:	ff 75 dc             	pushl  -0x24(%ebp)
    4e25:	e8 92 ea ff ff       	call   38bc <rd_wt>
    4e2a:	83 c4 20             	add    $0x20,%esp
    4e2d:	a1 10 90 00 00       	mov    0x9010,%eax
    4e32:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4e35:	83 ec 04             	sub    $0x4,%esp
    4e38:	ff 75 f4             	pushl  -0xc(%ebp)
    4e3b:	ff 75 08             	pushl  0x8(%ebp)
    4e3e:	ff 75 d8             	pushl  -0x28(%ebp)
    4e41:	e8 41 1c 00 00       	call   6a87 <Memcpy>
    4e46:	83 c4 10             	add    $0x10,%esp
    4e49:	a1 10 90 00 00       	mov    0x9010,%eax
    4e4e:	83 ec 0c             	sub    $0xc,%esp
    4e51:	6a 02                	push   $0x2
    4e53:	68 00 02 00 00       	push   $0x200
    4e58:	50                   	push   %eax
    4e59:	ff 75 e4             	pushl  -0x1c(%ebp)
    4e5c:	ff 75 dc             	pushl  -0x24(%ebp)
    4e5f:	e8 58 ea ff ff       	call   38bc <rd_wt>
    4e64:	83 c4 20             	add    $0x20,%esp
    4e67:	90                   	nop
    4e68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4e6b:	c9                   	leave  
    4e6c:	c3                   	ret    

00004e6d <put_inode>:
    4e6d:	55                   	push   %ebp
    4e6e:	89 e5                	mov    %esp,%ebp
    4e70:	83 ec 08             	sub    $0x8,%esp
    4e73:	8b 45 08             	mov    0x8(%ebp),%eax
    4e76:	8b 40 18             	mov    0x18(%eax),%eax
    4e79:	85 c0                	test   %eax,%eax
    4e7b:	7f 1c                	jg     4e99 <put_inode+0x2c>
    4e7d:	68 7e 03 00 00       	push   $0x37e
    4e82:	68 4e 69 00 00       	push   $0x694e
    4e87:	68 4e 69 00 00       	push   $0x694e
    4e8c:	68 1c 6a 00 00       	push   $0x6a1c
    4e91:	e8 c6 d3 ff ff       	call   225c <assertion_failure>
    4e96:	83 c4 10             	add    $0x10,%esp
    4e99:	8b 45 08             	mov    0x8(%ebp),%eax
    4e9c:	8b 40 18             	mov    0x18(%eax),%eax
    4e9f:	8d 50 ff             	lea    -0x1(%eax),%edx
    4ea2:	8b 45 08             	mov    0x8(%ebp),%eax
    4ea5:	89 50 18             	mov    %edx,0x18(%eax)
    4ea8:	90                   	nop
    4ea9:	c9                   	leave  
    4eaa:	c3                   	ret    

00004eab <do_close>:
    4eab:	55                   	push   %ebp
    4eac:	89 e5                	mov    %esp,%ebp
    4eae:	83 ec 08             	sub    $0x8,%esp
    4eb1:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4eb6:	8b 55 08             	mov    0x8(%ebp),%edx
    4eb9:	83 c2 1c             	add    $0x1c,%edx
    4ebc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4ec0:	8b 40 08             	mov    0x8(%eax),%eax
    4ec3:	83 ec 0c             	sub    $0xc,%esp
    4ec6:	50                   	push   %eax
    4ec7:	e8 a1 ff ff ff       	call   4e6d <put_inode>
    4ecc:	83 c4 10             	add    $0x10,%esp
    4ecf:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4ed4:	8b 55 08             	mov    0x8(%ebp),%edx
    4ed7:	83 c2 1c             	add    $0x1c,%edx
    4eda:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4ede:	8b 50 0c             	mov    0xc(%eax),%edx
    4ee1:	83 ea 01             	sub    $0x1,%edx
    4ee4:	89 50 0c             	mov    %edx,0xc(%eax)
    4ee7:	8b 40 0c             	mov    0xc(%eax),%eax
    4eea:	85 c0                	test   %eax,%eax
    4eec:	75 16                	jne    4f04 <do_close+0x59>
    4eee:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4ef3:	8b 55 08             	mov    0x8(%ebp),%edx
    4ef6:	83 c2 1c             	add    $0x1c,%edx
    4ef9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    4efd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    4f04:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
    4f09:	8b 55 08             	mov    0x8(%ebp),%edx
    4f0c:	83 c2 1c             	add    $0x1c,%edx
    4f0f:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    4f16:	00 
    4f17:	b8 00 00 00 00       	mov    $0x0,%eax
    4f1c:	c9                   	leave  
    4f1d:	c3                   	ret    

00004f1e <get_super_block>:
    4f1e:	55                   	push   %ebp
    4f1f:	89 e5                	mov    %esp,%ebp
    4f21:	83 ec 18             	sub    $0x18,%esp
    4f24:	a1 10 90 00 00       	mov    0x9010,%eax
    4f29:	83 ec 0c             	sub    $0xc,%esp
    4f2c:	6a 01                	push   $0x1
    4f2e:	68 00 02 00 00       	push   $0x200
    4f33:	50                   	push   %eax
    4f34:	6a 20                	push   $0x20
    4f36:	6a 01                	push   $0x1
    4f38:	e8 7f e9 ff ff       	call   38bc <rd_wt>
    4f3d:	83 c4 20             	add    $0x20,%esp
    4f40:	a1 10 90 00 00       	mov    0x9010,%eax
    4f45:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f4b:	c9                   	leave  
    4f4c:	c3                   	ret    

00004f4d <schedule_process>:
    4f4d:	55                   	push   %ebp
    4f4e:	89 e5                	mov    %esp,%ebp
    4f50:	83 ec 10             	sub    $0x10,%esp
    4f53:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4f5a:	eb 7e                	jmp    4fda <schedule_process+0x8d>
    4f5c:	c7 45 fc 20 4f 01 00 	movl   $0x14f20,-0x4(%ebp)
    4f63:	eb 31                	jmp    4f96 <schedule_process+0x49>
    4f65:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f68:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    4f6f:	84 c0                	test   %al,%al
    4f71:	75 1c                	jne    4f8f <schedule_process+0x42>
    4f73:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f76:	8b 40 5c             	mov    0x5c(%eax),%eax
    4f79:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    4f7c:	73 11                	jae    4f8f <schedule_process+0x42>
    4f7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f81:	8b 40 5c             	mov    0x5c(%eax),%eax
    4f84:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4f87:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f8a:	a3 a0 a2 00 00       	mov    %eax,0xa2a0
    4f8f:	81 45 fc 90 01 00 00 	addl   $0x190,-0x4(%ebp)
    4f96:	b8 10 5a 01 00       	mov    $0x15a10,%eax
    4f9b:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    4f9e:	72 c5                	jb     4f65 <schedule_process+0x18>
    4fa0:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    4fa4:	75 34                	jne    4fda <schedule_process+0x8d>
    4fa6:	c7 45 fc 20 4f 01 00 	movl   $0x14f20,-0x4(%ebp)
    4fad:	eb 21                	jmp    4fd0 <schedule_process+0x83>
    4faf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fb2:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
    4fb9:	84 c0                	test   %al,%al
    4fbb:	75 0c                	jne    4fc9 <schedule_process+0x7c>
    4fbd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fc0:	8b 50 60             	mov    0x60(%eax),%edx
    4fc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fc6:	89 50 5c             	mov    %edx,0x5c(%eax)
    4fc9:	81 45 fc 90 01 00 00 	addl   $0x190,-0x4(%ebp)
    4fd0:	b8 10 5a 01 00       	mov    $0x15a10,%eax
    4fd5:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    4fd8:	72 d5                	jb     4faf <schedule_process+0x62>
    4fda:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
    4fde:	0f 84 78 ff ff ff    	je     4f5c <schedule_process+0xf>
    4fe4:	90                   	nop
    4fe5:	c9                   	leave  
    4fe6:	c3                   	ret    

00004fe7 <clock_handler>:
    4fe7:	55                   	push   %ebp
    4fe8:	89 e5                	mov    %esp,%ebp
    4fea:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4fef:	8b 40 5c             	mov    0x5c(%eax),%eax
    4ff2:	85 c0                	test   %eax,%eax
    4ff4:	74 0e                	je     5004 <clock_handler+0x1d>
    4ff6:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    4ffb:	8b 50 5c             	mov    0x5c(%eax),%edx
    4ffe:	83 ea 01             	sub    $0x1,%edx
    5001:	89 50 5c             	mov    %edx,0x5c(%eax)
    5004:	a1 80 d4 00 00       	mov    0xd480,%eax
    5009:	83 c0 01             	add    $0x1,%eax
    500c:	a3 80 d4 00 00       	mov    %eax,0xd480
    5011:	a1 94 9e 00 00       	mov    0x9e94,%eax
    5016:	85 c0                	test   %eax,%eax
    5018:	75 13                	jne    502d <clock_handler+0x46>
    501a:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    501f:	8b 40 5c             	mov    0x5c(%eax),%eax
    5022:	85 c0                	test   %eax,%eax
    5024:	75 0a                	jne    5030 <clock_handler+0x49>
    5026:	e8 22 ff ff ff       	call   4f4d <schedule_process>
    502b:	eb 04                	jmp    5031 <clock_handler+0x4a>
    502d:	90                   	nop
    502e:	eb 01                	jmp    5031 <clock_handler+0x4a>
    5030:	90                   	nop
    5031:	5d                   	pop    %ebp
    5032:	c3                   	ret    

00005033 <pid2proc>:
    5033:	55                   	push   %ebp
    5034:	89 e5                	mov    %esp,%ebp
    5036:	83 ec 10             	sub    $0x10,%esp
    5039:	8b 45 08             	mov    0x8(%ebp),%eax
    503c:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
    5042:	05 20 4f 01 00       	add    $0x14f20,%eax
    5047:	89 45 fc             	mov    %eax,-0x4(%ebp)
    504a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    504d:	c9                   	leave  
    504e:	c3                   	ret    

0000504f <proc2pid>:
    504f:	55                   	push   %ebp
    5050:	89 e5                	mov    %esp,%ebp
    5052:	83 ec 10             	sub    $0x10,%esp
    5055:	8b 45 08             	mov    0x8(%ebp),%eax
    5058:	2d 20 4f 01 00       	sub    $0x14f20,%eax
    505d:	c1 f8 04             	sar    $0x4,%eax
    5060:	69 c0 29 5c 8f c2    	imul   $0xc28f5c29,%eax,%eax
    5066:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5069:	8b 45 fc             	mov    -0x4(%ebp),%eax
    506c:	c9                   	leave  
    506d:	c3                   	ret    

0000506e <InitDescriptor>:
    506e:	55                   	push   %ebp
    506f:	89 e5                	mov    %esp,%ebp
    5071:	83 ec 04             	sub    $0x4,%esp
    5074:	8b 45 14             	mov    0x14(%ebp),%eax
    5077:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
    507b:	8b 45 10             	mov    0x10(%ebp),%eax
    507e:	89 c2                	mov    %eax,%edx
    5080:	8b 45 08             	mov    0x8(%ebp),%eax
    5083:	66 89 10             	mov    %dx,(%eax)
    5086:	8b 45 0c             	mov    0xc(%ebp),%eax
    5089:	89 c2                	mov    %eax,%edx
    508b:	8b 45 08             	mov    0x8(%ebp),%eax
    508e:	66 89 50 02          	mov    %dx,0x2(%eax)
    5092:	8b 45 0c             	mov    0xc(%ebp),%eax
    5095:	c1 e8 10             	shr    $0x10,%eax
    5098:	89 c2                	mov    %eax,%edx
    509a:	8b 45 08             	mov    0x8(%ebp),%eax
    509d:	88 50 04             	mov    %dl,0x4(%eax)
    50a0:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    50a4:	89 c2                	mov    %eax,%edx
    50a6:	8b 45 08             	mov    0x8(%ebp),%eax
    50a9:	88 50 05             	mov    %dl,0x5(%eax)
    50ac:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    50b0:	66 c1 e8 08          	shr    $0x8,%ax
    50b4:	c1 e0 04             	shl    $0x4,%eax
    50b7:	89 c2                	mov    %eax,%edx
    50b9:	8b 45 10             	mov    0x10(%ebp),%eax
    50bc:	c1 e8 10             	shr    $0x10,%eax
    50bf:	83 e0 0f             	and    $0xf,%eax
    50c2:	09 c2                	or     %eax,%edx
    50c4:	8b 45 08             	mov    0x8(%ebp),%eax
    50c7:	88 50 06             	mov    %dl,0x6(%eax)
    50ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    50cd:	c1 e8 18             	shr    $0x18,%eax
    50d0:	89 c2                	mov    %eax,%edx
    50d2:	8b 45 08             	mov    0x8(%ebp),%eax
    50d5:	88 50 07             	mov    %dl,0x7(%eax)
    50d8:	90                   	nop
    50d9:	c9                   	leave  
    50da:	c3                   	ret    

000050db <Seg2PhyAddr>:
    50db:	55                   	push   %ebp
    50dc:	89 e5                	mov    %esp,%ebp
    50de:	83 ec 10             	sub    $0x10,%esp
    50e1:	8b 45 08             	mov    0x8(%ebp),%eax
    50e4:	c1 e8 03             	shr    $0x3,%eax
    50e7:	8b 14 c5 a4 9e 00 00 	mov    0x9ea4(,%eax,8),%edx
    50ee:	8b 04 c5 a0 9e 00 00 	mov    0x9ea0(,%eax,8),%eax
    50f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    50f8:	89 55 f8             	mov    %edx,-0x8(%ebp)
    50fb:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    50ff:	0f b7 c0             	movzwl %ax,%eax
    5102:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    5106:	0f b6 d2             	movzbl %dl,%edx
    5109:	c1 e2 10             	shl    $0x10,%edx
    510c:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    5112:	09 d0                	or     %edx,%eax
    5114:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5117:	8b 45 fc             	mov    -0x4(%ebp),%eax
    511a:	c9                   	leave  
    511b:	c3                   	ret    

0000511c <Seg2PhyAddrLDT>:
    511c:	55                   	push   %ebp
    511d:	89 e5                	mov    %esp,%ebp
    511f:	83 ec 10             	sub    $0x10,%esp
    5122:	8b 45 08             	mov    0x8(%ebp),%eax
    5125:	c1 e8 03             	shr    $0x3,%eax
    5128:	89 c2                	mov    %eax,%edx
    512a:	8b 45 0c             	mov    0xc(%ebp),%eax
    512d:	83 c2 08             	add    $0x8,%edx
    5130:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
    5134:	8b 02                	mov    (%edx),%eax
    5136:	8b 52 04             	mov    0x4(%edx),%edx
    5139:	89 45 f4             	mov    %eax,-0xc(%ebp)
    513c:	89 55 f8             	mov    %edx,-0x8(%ebp)
    513f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
    5143:	0f b7 c0             	movzwl %ax,%eax
    5146:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
    514a:	0f b6 d2             	movzbl %dl,%edx
    514d:	c1 e2 10             	shl    $0x10,%edx
    5150:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
    5156:	09 d0                	or     %edx,%eax
    5158:	89 45 fc             	mov    %eax,-0x4(%ebp)
    515b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    515e:	c9                   	leave  
    515f:	c3                   	ret    

00005160 <VirAddr2PhyAddr>:
    5160:	55                   	push   %ebp
    5161:	89 e5                	mov    %esp,%ebp
    5163:	83 ec 10             	sub    $0x10,%esp
    5166:	8b 55 0c             	mov    0xc(%ebp),%edx
    5169:	8b 45 08             	mov    0x8(%ebp),%eax
    516c:	01 d0                	add    %edx,%eax
    516e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5171:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5174:	c9                   	leave  
    5175:	c3                   	ret    

00005176 <v2l>:
    5176:	55                   	push   %ebp
    5177:	89 e5                	mov    %esp,%ebp
    5179:	83 ec 18             	sub    $0x18,%esp
    517c:	83 ec 0c             	sub    $0xc,%esp
    517f:	ff 75 08             	pushl  0x8(%ebp)
    5182:	e8 ac fe ff ff       	call   5033 <pid2proc>
    5187:	83 c4 10             	add    $0x10,%esp
    518a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    518d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5190:	8b 40 0c             	mov    0xc(%eax),%eax
    5193:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5196:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5199:	83 ec 08             	sub    $0x8,%esp
    519c:	ff 75 f4             	pushl  -0xc(%ebp)
    519f:	50                   	push   %eax
    51a0:	e8 77 ff ff ff       	call   511c <Seg2PhyAddrLDT>
    51a5:	83 c4 10             	add    $0x10,%esp
    51a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    51ab:	8b 55 ec             	mov    -0x14(%ebp),%edx
    51ae:	8b 45 0c             	mov    0xc(%ebp),%eax
    51b1:	01 d0                	add    %edx,%eax
    51b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    51b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    51b9:	c9                   	leave  
    51ba:	c3                   	ret    

000051bb <init_propt>:
    51bb:	55                   	push   %ebp
    51bc:	89 e5                	mov    %esp,%ebp
    51be:	53                   	push   %ebx
    51bf:	83 ec 24             	sub    $0x24,%esp
    51c2:	6a 0e                	push   $0xe
    51c4:	6a 08                	push   $0x8
    51c6:	68 67 11 00 00       	push   $0x1167
    51cb:	6a 20                	push   $0x20
    51cd:	e8 53 01 00 00       	call   5325 <InitInterruptDesc>
    51d2:	83 c4 10             	add    $0x10,%esp
    51d5:	6a 0e                	push   $0xe
    51d7:	6a 08                	push   $0x8
    51d9:	68 b0 11 00 00       	push   $0x11b0
    51de:	6a 21                	push   $0x21
    51e0:	e8 40 01 00 00       	call   5325 <InitInterruptDesc>
    51e5:	83 c4 10             	add    $0x10,%esp
    51e8:	6a 0e                	push   $0xe
    51ea:	6a 08                	push   $0x8
    51ec:	68 f9 11 00 00       	push   $0x11f9
    51f1:	6a 2e                	push   $0x2e
    51f3:	e8 2d 01 00 00       	call   5325 <InitInterruptDesc>
    51f8:	83 c4 10             	add    $0x10,%esp
    51fb:	83 ec 04             	sub    $0x4,%esp
    51fe:	68 f0 0a 00 00       	push   $0xaf0
    5203:	6a 00                	push   $0x0
    5205:	68 20 4f 01 00       	push   $0x14f20
    520a:	e8 a6 18 00 00       	call   6ab5 <Memset>
    520f:	83 c4 10             	add    $0x10,%esp
    5212:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
    5219:	83 ec 04             	sub    $0x4,%esp
    521c:	ff 75 f0             	pushl  -0x10(%ebp)
    521f:	6a 00                	push   $0x0
    5221:	68 00 cc 00 00       	push   $0xcc00
    5226:	e8 8a 18 00 00       	call   6ab5 <Memset>
    522b:	83 c4 10             	add    $0x10,%esp
    522e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5231:	a3 68 cc 00 00       	mov    %eax,0xcc68
    5236:	c7 05 08 cc 00 00 30 	movl   $0x30,0xcc08
    523d:	00 00 00 
    5240:	83 ec 0c             	sub    $0xc,%esp
    5243:	6a 30                	push   $0x30
    5245:	e8 91 fe ff ff       	call   50db <Seg2PhyAddr>
    524a:	83 c4 10             	add    $0x10,%esp
    524d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5250:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5253:	83 ec 08             	sub    $0x8,%esp
    5256:	68 00 cc 00 00       	push   $0xcc00
    525b:	50                   	push   %eax
    525c:	e8 ff fe ff ff       	call   5160 <VirAddr2PhyAddr>
    5261:	83 c4 10             	add    $0x10,%esp
    5264:	89 45 e8             	mov    %eax,-0x18(%ebp)
    5267:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
    526e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5271:	0f b7 d0             	movzwl %ax,%edx
    5274:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5277:	83 e8 01             	sub    $0x1,%eax
    527a:	89 c1                	mov    %eax,%ecx
    527c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    527f:	52                   	push   %edx
    5280:	51                   	push   %ecx
    5281:	50                   	push   %eax
    5282:	68 e0 9e 00 00       	push   $0x9ee0
    5287:	e8 e2 fd ff ff       	call   506e <InitDescriptor>
    528c:	83 c4 10             	add    $0x10,%esp
    528f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5296:	eb 65                	jmp    52fd <init_propt+0x142>
    5298:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
    529f:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
    52a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52a9:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
    52af:	83 c0 40             	add    $0x40,%eax
    52b2:	05 20 4f 01 00       	add    $0x14f20,%eax
    52b7:	8d 50 06             	lea    0x6(%eax),%edx
    52ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    52bd:	83 ec 08             	sub    $0x8,%esp
    52c0:	52                   	push   %edx
    52c1:	50                   	push   %eax
    52c2:	e8 99 fe ff ff       	call   5160 <VirAddr2PhyAddr>
    52c7:	83 c4 10             	add    $0x10,%esp
    52ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
    52cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    52d0:	0f b7 d0             	movzwl %ax,%edx
    52d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    52d6:	83 e8 01             	sub    $0x1,%eax
    52d9:	89 c3                	mov    %eax,%ebx
    52db:	8b 45 d8             	mov    -0x28(%ebp),%eax
    52de:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    52e1:	83 c1 09             	add    $0x9,%ecx
    52e4:	c1 e1 03             	shl    $0x3,%ecx
    52e7:	81 c1 a0 9e 00 00    	add    $0x9ea0,%ecx
    52ed:	52                   	push   %edx
    52ee:	53                   	push   %ebx
    52ef:	50                   	push   %eax
    52f0:	51                   	push   %ecx
    52f1:	e8 78 fd ff ff       	call   506e <InitDescriptor>
    52f6:	83 c4 10             	add    $0x10,%esp
    52f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    52fd:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
    5301:	7e 95                	jle    5298 <init_propt+0xdd>
    5303:	68 f2 00 00 00       	push   $0xf2
    5308:	68 ff ff 00 00       	push   $0xffff
    530d:	68 00 80 0b 00       	push   $0xb8000
    5312:	68 d8 9e 00 00       	push   $0x9ed8
    5317:	e8 52 fd ff ff       	call   506e <InitDescriptor>
    531c:	83 c4 10             	add    $0x10,%esp
    531f:	90                   	nop
    5320:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5323:	c9                   	leave  
    5324:	c3                   	ret    

00005325 <InitInterruptDesc>:
    5325:	55                   	push   %ebp
    5326:	89 e5                	mov    %esp,%ebp
    5328:	83 ec 10             	sub    $0x10,%esp
    532b:	8b 45 08             	mov    0x8(%ebp),%eax
    532e:	c1 e0 03             	shl    $0x3,%eax
    5331:	05 80 cc 00 00       	add    $0xcc80,%eax
    5336:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5339:	8b 45 fc             	mov    -0x4(%ebp),%eax
    533c:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    5340:	8b 45 0c             	mov    0xc(%ebp),%eax
    5343:	89 45 f8             	mov    %eax,-0x8(%ebp)
    5346:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5349:	89 c2                	mov    %eax,%edx
    534b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    534e:	66 89 10             	mov    %dx,(%eax)
    5351:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5354:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
    535a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    535d:	c1 f8 10             	sar    $0x10,%eax
    5360:	89 c2                	mov    %eax,%edx
    5362:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5365:	66 89 50 06          	mov    %dx,0x6(%eax)
    5369:	8b 45 10             	mov    0x10(%ebp),%eax
    536c:	c1 e0 04             	shl    $0x4,%eax
    536f:	89 c2                	mov    %eax,%edx
    5371:	8b 45 14             	mov    0x14(%ebp),%eax
    5374:	09 d0                	or     %edx,%eax
    5376:	89 c2                	mov    %eax,%edx
    5378:	8b 45 fc             	mov    -0x4(%ebp),%eax
    537b:	88 50 05             	mov    %dl,0x5(%eax)
    537e:	90                   	nop
    537f:	c9                   	leave  
    5380:	c3                   	ret    

00005381 <ReloadGDT>:
    5381:	55                   	push   %ebp
    5382:	89 e5                	mov    %esp,%ebp
    5384:	83 ec 28             	sub    $0x28,%esp
    5387:	b8 78 cc 00 00       	mov    $0xcc78,%eax
    538c:	0f b7 00             	movzwl (%eax),%eax
    538f:	98                   	cwtl   
    5390:	ba 7a cc 00 00       	mov    $0xcc7a,%edx
    5395:	8b 12                	mov    (%edx),%edx
    5397:	83 ec 04             	sub    $0x4,%esp
    539a:	50                   	push   %eax
    539b:	52                   	push   %edx
    539c:	68 a0 9e 00 00       	push   $0x9ea0
    53a1:	e8 e1 16 00 00       	call   6a87 <Memcpy>
    53a6:	83 c4 10             	add    $0x10,%esp
    53a9:	c7 45 f0 78 cc 00 00 	movl   $0xcc78,-0x10(%ebp)
    53b0:	c7 45 ec 7a cc 00 00 	movl   $0xcc7a,-0x14(%ebp)
    53b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53ba:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
    53bf:	ba a0 9e 00 00       	mov    $0x9ea0,%edx
    53c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    53c7:	89 10                	mov    %edx,(%eax)
    53c9:	c7 45 e8 88 9e 00 00 	movl   $0x9e88,-0x18(%ebp)
    53d0:	c7 45 e4 8a 9e 00 00 	movl   $0x9e8a,-0x1c(%ebp)
    53d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    53da:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
    53df:	ba 80 cc 00 00       	mov    $0xcc80,%edx
    53e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    53e7:	89 10                	mov    %edx,(%eax)
    53e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    53f0:	eb 04                	jmp    53f6 <ReloadGDT+0x75>
    53f2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    53f6:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
    53fd:	7e f3                	jle    53f2 <ReloadGDT+0x71>
    53ff:	e8 6e c3 ff ff       	call   1772 <init_internal_interrupt>
    5404:	e8 b2 fd ff ff       	call   51bb <init_propt>
    5409:	90                   	nop
    540a:	c9                   	leave  
    540b:	c3                   	ret    

0000540c <select_console>:
    540c:	55                   	push   %ebp
    540d:	89 e5                	mov    %esp,%ebp
    540f:	83 ec 18             	sub    $0x18,%esp
    5412:	8b 45 08             	mov    0x8(%ebp),%eax
    5415:	88 45 f4             	mov    %al,-0xc(%ebp)
    5418:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
    541c:	77 27                	ja     5445 <select_console+0x39>
    541e:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
    5422:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
    5428:	05 00 a6 00 00       	add    $0xa600,%eax
    542d:	a3 80 9e 00 00       	mov    %eax,0x9e80
    5432:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5437:	83 ec 0c             	sub    $0xc,%esp
    543a:	50                   	push   %eax
    543b:	e8 08 00 00 00       	call   5448 <flush>
    5440:	83 c4 10             	add    $0x10,%esp
    5443:	eb 01                	jmp    5446 <select_console+0x3a>
    5445:	90                   	nop
    5446:	c9                   	leave  
    5447:	c3                   	ret    

00005448 <flush>:
    5448:	55                   	push   %ebp
    5449:	89 e5                	mov    %esp,%ebp
    544b:	83 ec 08             	sub    $0x8,%esp
    544e:	8b 45 08             	mov    0x8(%ebp),%eax
    5451:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5457:	8b 40 0c             	mov    0xc(%eax),%eax
    545a:	83 ec 0c             	sub    $0xc,%esp
    545d:	50                   	push   %eax
    545e:	e8 1e 00 00 00       	call   5481 <set_cursor>
    5463:	83 c4 10             	add    $0x10,%esp
    5466:	8b 45 08             	mov    0x8(%ebp),%eax
    5469:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    546f:	8b 40 08             	mov    0x8(%eax),%eax
    5472:	83 ec 0c             	sub    $0xc,%esp
    5475:	50                   	push   %eax
    5476:	e8 64 00 00 00       	call   54df <set_console_start_video_addr>
    547b:	83 c4 10             	add    $0x10,%esp
    547e:	90                   	nop
    547f:	c9                   	leave  
    5480:	c3                   	ret    

00005481 <set_cursor>:
    5481:	55                   	push   %ebp
    5482:	89 e5                	mov    %esp,%ebp
    5484:	83 ec 08             	sub    $0x8,%esp
    5487:	83 ec 08             	sub    $0x8,%esp
    548a:	6a 0e                	push   $0xe
    548c:	68 d4 03 00 00       	push   $0x3d4
    5491:	e8 48 be ff ff       	call   12de <out_byte>
    5496:	83 c4 10             	add    $0x10,%esp
    5499:	8b 45 08             	mov    0x8(%ebp),%eax
    549c:	c1 e8 08             	shr    $0x8,%eax
    549f:	0f b7 c0             	movzwl %ax,%eax
    54a2:	83 ec 08             	sub    $0x8,%esp
    54a5:	50                   	push   %eax
    54a6:	68 d5 03 00 00       	push   $0x3d5
    54ab:	e8 2e be ff ff       	call   12de <out_byte>
    54b0:	83 c4 10             	add    $0x10,%esp
    54b3:	83 ec 08             	sub    $0x8,%esp
    54b6:	6a 0f                	push   $0xf
    54b8:	68 d4 03 00 00       	push   $0x3d4
    54bd:	e8 1c be ff ff       	call   12de <out_byte>
    54c2:	83 c4 10             	add    $0x10,%esp
    54c5:	8b 45 08             	mov    0x8(%ebp),%eax
    54c8:	0f b7 c0             	movzwl %ax,%eax
    54cb:	83 ec 08             	sub    $0x8,%esp
    54ce:	50                   	push   %eax
    54cf:	68 d5 03 00 00       	push   $0x3d5
    54d4:	e8 05 be ff ff       	call   12de <out_byte>
    54d9:	83 c4 10             	add    $0x10,%esp
    54dc:	90                   	nop
    54dd:	c9                   	leave  
    54de:	c3                   	ret    

000054df <set_console_start_video_addr>:
    54df:	55                   	push   %ebp
    54e0:	89 e5                	mov    %esp,%ebp
    54e2:	83 ec 08             	sub    $0x8,%esp
    54e5:	83 ec 08             	sub    $0x8,%esp
    54e8:	6a 0c                	push   $0xc
    54ea:	68 d4 03 00 00       	push   $0x3d4
    54ef:	e8 ea bd ff ff       	call   12de <out_byte>
    54f4:	83 c4 10             	add    $0x10,%esp
    54f7:	8b 45 08             	mov    0x8(%ebp),%eax
    54fa:	c1 e8 08             	shr    $0x8,%eax
    54fd:	0f b7 c0             	movzwl %ax,%eax
    5500:	83 ec 08             	sub    $0x8,%esp
    5503:	50                   	push   %eax
    5504:	68 d5 03 00 00       	push   $0x3d5
    5509:	e8 d0 bd ff ff       	call   12de <out_byte>
    550e:	83 c4 10             	add    $0x10,%esp
    5511:	83 ec 08             	sub    $0x8,%esp
    5514:	6a 0d                	push   $0xd
    5516:	68 d4 03 00 00       	push   $0x3d4
    551b:	e8 be bd ff ff       	call   12de <out_byte>
    5520:	83 c4 10             	add    $0x10,%esp
    5523:	8b 45 08             	mov    0x8(%ebp),%eax
    5526:	0f b7 c0             	movzwl %ax,%eax
    5529:	83 ec 08             	sub    $0x8,%esp
    552c:	50                   	push   %eax
    552d:	68 d5 03 00 00       	push   $0x3d5
    5532:	e8 a7 bd ff ff       	call   12de <out_byte>
    5537:	83 c4 10             	add    $0x10,%esp
    553a:	90                   	nop
    553b:	c9                   	leave  
    553c:	c3                   	ret    

0000553d <put_key>:
    553d:	55                   	push   %ebp
    553e:	89 e5                	mov    %esp,%ebp
    5540:	83 ec 04             	sub    $0x4,%esp
    5543:	8b 45 0c             	mov    0xc(%ebp),%eax
    5546:	88 45 fc             	mov    %al,-0x4(%ebp)
    5549:	8b 45 08             	mov    0x8(%ebp),%eax
    554c:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    5552:	3d 1f 03 00 00       	cmp    $0x31f,%eax
    5557:	77 4d                	ja     55a6 <put_key+0x69>
    5559:	8b 45 08             	mov    0x8(%ebp),%eax
    555c:	8b 00                	mov    (%eax),%eax
    555e:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
    5562:	89 10                	mov    %edx,(%eax)
    5564:	8b 45 08             	mov    0x8(%ebp),%eax
    5567:	8b 00                	mov    (%eax),%eax
    5569:	8d 50 04             	lea    0x4(%eax),%edx
    556c:	8b 45 08             	mov    0x8(%ebp),%eax
    556f:	89 10                	mov    %edx,(%eax)
    5571:	8b 45 08             	mov    0x8(%ebp),%eax
    5574:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    557a:	8d 50 01             	lea    0x1(%eax),%edx
    557d:	8b 45 08             	mov    0x8(%ebp),%eax
    5580:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
    5586:	8b 45 08             	mov    0x8(%ebp),%eax
    5589:	8b 00                	mov    (%eax),%eax
    558b:	8b 55 08             	mov    0x8(%ebp),%edx
    558e:	83 c2 08             	add    $0x8,%edx
    5591:	81 c2 80 0c 00 00    	add    $0xc80,%edx
    5597:	39 d0                	cmp    %edx,%eax
    5599:	75 0b                	jne    55a6 <put_key+0x69>
    559b:	8b 45 08             	mov    0x8(%ebp),%eax
    559e:	8d 50 08             	lea    0x8(%eax),%edx
    55a1:	8b 45 08             	mov    0x8(%ebp),%eax
    55a4:	89 10                	mov    %edx,(%eax)
    55a6:	90                   	nop
    55a7:	c9                   	leave  
    55a8:	c3                   	ret    

000055a9 <scroll_up>:
    55a9:	55                   	push   %ebp
    55aa:	89 e5                	mov    %esp,%ebp
    55ac:	83 ec 08             	sub    $0x8,%esp
    55af:	8b 45 08             	mov    0x8(%ebp),%eax
    55b2:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55b8:	8b 50 08             	mov    0x8(%eax),%edx
    55bb:	8b 45 08             	mov    0x8(%ebp),%eax
    55be:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55c4:	8b 00                	mov    (%eax),%eax
    55c6:	39 c2                	cmp    %eax,%edx
    55c8:	76 1d                	jbe    55e7 <scroll_up+0x3e>
    55ca:	8b 45 08             	mov    0x8(%ebp),%eax
    55cd:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55d3:	8b 40 08             	mov    0x8(%eax),%eax
    55d6:	2d d0 07 00 00       	sub    $0x7d0,%eax
    55db:	83 ec 0c             	sub    $0xc,%esp
    55de:	50                   	push   %eax
    55df:	e8 fb fe ff ff       	call   54df <set_console_start_video_addr>
    55e4:	83 c4 10             	add    $0x10,%esp
    55e7:	90                   	nop
    55e8:	c9                   	leave  
    55e9:	c3                   	ret    

000055ea <scroll_down>:
    55ea:	55                   	push   %ebp
    55eb:	89 e5                	mov    %esp,%ebp
    55ed:	83 ec 08             	sub    $0x8,%esp
    55f0:	8b 45 08             	mov    0x8(%ebp),%eax
    55f3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    55f9:	8b 40 08             	mov    0x8(%eax),%eax
    55fc:	8d 88 a0 0f 00 00    	lea    0xfa0(%eax),%ecx
    5602:	8b 45 08             	mov    0x8(%ebp),%eax
    5605:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    560b:	8b 10                	mov    (%eax),%edx
    560d:	8b 45 08             	mov    0x8(%ebp),%eax
    5610:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5616:	8b 40 04             	mov    0x4(%eax),%eax
    5619:	01 d0                	add    %edx,%eax
    561b:	39 c1                	cmp    %eax,%ecx
    561d:	73 3b                	jae    565a <scroll_down+0x70>
    561f:	8b 45 08             	mov    0x8(%ebp),%eax
    5622:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5628:	8b 40 08             	mov    0x8(%eax),%eax
    562b:	05 d0 07 00 00       	add    $0x7d0,%eax
    5630:	83 ec 0c             	sub    $0xc,%esp
    5633:	50                   	push   %eax
    5634:	e8 a6 fe ff ff       	call   54df <set_console_start_video_addr>
    5639:	83 c4 10             	add    $0x10,%esp
    563c:	8b 45 08             	mov    0x8(%ebp),%eax
    563f:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5645:	8b 50 08             	mov    0x8(%eax),%edx
    5648:	8b 45 08             	mov    0x8(%ebp),%eax
    564b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5651:	81 c2 d0 07 00 00    	add    $0x7d0,%edx
    5657:	89 50 08             	mov    %edx,0x8(%eax)
    565a:	90                   	nop
    565b:	c9                   	leave  
    565c:	c3                   	ret    

0000565d <out_char>:
    565d:	55                   	push   %ebp
    565e:	89 e5                	mov    %esp,%ebp
    5660:	83 ec 28             	sub    $0x28,%esp
    5663:	8b 45 0c             	mov    0xc(%ebp),%eax
    5666:	88 45 e4             	mov    %al,-0x1c(%ebp)
    5669:	8b 45 08             	mov    0x8(%ebp),%eax
    566c:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5672:	8b 40 0c             	mov    0xc(%eax),%eax
    5675:	05 00 c0 05 00       	add    $0x5c000,%eax
    567a:	01 c0                	add    %eax,%eax
    567c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    567f:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
    5683:	83 f8 08             	cmp    $0x8,%eax
    5686:	0f 84 8d 00 00 00    	je     5719 <out_char+0xbc>
    568c:	83 f8 0a             	cmp    $0xa,%eax
    568f:	0f 85 c9 00 00 00    	jne    575e <out_char+0x101>
    5695:	8b 45 08             	mov    0x8(%ebp),%eax
    5698:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    569e:	8b 50 0c             	mov    0xc(%eax),%edx
    56a1:	8b 45 08             	mov    0x8(%ebp),%eax
    56a4:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56aa:	8b 08                	mov    (%eax),%ecx
    56ac:	8b 45 08             	mov    0x8(%ebp),%eax
    56af:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56b5:	8b 40 04             	mov    0x4(%eax),%eax
    56b8:	01 c8                	add    %ecx,%eax
    56ba:	83 e8 50             	sub    $0x50,%eax
    56bd:	39 c2                	cmp    %eax,%edx
    56bf:	0f 83 f4 00 00 00    	jae    57b9 <out_char+0x15c>
    56c5:	8b 45 08             	mov    0x8(%ebp),%eax
    56c8:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56ce:	8b 08                	mov    (%eax),%ecx
    56d0:	8b 45 08             	mov    0x8(%ebp),%eax
    56d3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56d9:	8b 50 0c             	mov    0xc(%eax),%edx
    56dc:	8b 45 08             	mov    0x8(%ebp),%eax
    56df:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    56e5:	8b 00                	mov    (%eax),%eax
    56e7:	29 c2                	sub    %eax,%edx
    56e9:	89 d0                	mov    %edx,%eax
    56eb:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    56f0:	f7 e2                	mul    %edx
    56f2:	89 d0                	mov    %edx,%eax
    56f4:	c1 e8 06             	shr    $0x6,%eax
    56f7:	8d 50 01             	lea    0x1(%eax),%edx
    56fa:	89 d0                	mov    %edx,%eax
    56fc:	c1 e0 02             	shl    $0x2,%eax
    56ff:	01 d0                	add    %edx,%eax
    5701:	c1 e0 04             	shl    $0x4,%eax
    5704:	89 c2                	mov    %eax,%edx
    5706:	8b 45 08             	mov    0x8(%ebp),%eax
    5709:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    570f:	01 ca                	add    %ecx,%edx
    5711:	89 50 0c             	mov    %edx,0xc(%eax)
    5714:	e9 a0 00 00 00       	jmp    57b9 <out_char+0x15c>
    5719:	8b 45 08             	mov    0x8(%ebp),%eax
    571c:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5722:	8b 50 0c             	mov    0xc(%eax),%edx
    5725:	8b 45 08             	mov    0x8(%ebp),%eax
    5728:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    572e:	8b 00                	mov    (%eax),%eax
    5730:	39 c2                	cmp    %eax,%edx
    5732:	0f 86 84 00 00 00    	jbe    57bc <out_char+0x15f>
    5738:	8b 45 08             	mov    0x8(%ebp),%eax
    573b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5741:	8b 50 0c             	mov    0xc(%eax),%edx
    5744:	83 ea 01             	sub    $0x1,%edx
    5747:	89 50 0c             	mov    %edx,0xc(%eax)
    574a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    574d:	83 e8 02             	sub    $0x2,%eax
    5750:	c6 00 20             	movb   $0x20,(%eax)
    5753:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5756:	83 e8 01             	sub    $0x1,%eax
    5759:	c6 00 00             	movb   $0x0,(%eax)
    575c:	eb 5e                	jmp    57bc <out_char+0x15f>
    575e:	8b 45 08             	mov    0x8(%ebp),%eax
    5761:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5767:	8b 40 0c             	mov    0xc(%eax),%eax
    576a:	8d 48 01             	lea    0x1(%eax),%ecx
    576d:	8b 45 08             	mov    0x8(%ebp),%eax
    5770:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5776:	8b 10                	mov    (%eax),%edx
    5778:	8b 45 08             	mov    0x8(%ebp),%eax
    577b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5781:	8b 40 04             	mov    0x4(%eax),%eax
    5784:	01 d0                	add    %edx,%eax
    5786:	39 c1                	cmp    %eax,%ecx
    5788:	73 35                	jae    57bf <out_char+0x162>
    578a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    578d:	8d 50 01             	lea    0x1(%eax),%edx
    5790:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5793:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
    5797:	88 10                	mov    %dl,(%eax)
    5799:	8b 45 f4             	mov    -0xc(%ebp),%eax
    579c:	8d 50 01             	lea    0x1(%eax),%edx
    579f:	89 55 f4             	mov    %edx,-0xc(%ebp)
    57a2:	c6 00 0a             	movb   $0xa,(%eax)
    57a5:	8b 45 08             	mov    0x8(%ebp),%eax
    57a8:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    57ae:	8b 50 0c             	mov    0xc(%eax),%edx
    57b1:	83 c2 01             	add    $0x1,%edx
    57b4:	89 50 0c             	mov    %edx,0xc(%eax)
    57b7:	eb 06                	jmp    57bf <out_char+0x162>
    57b9:	90                   	nop
    57ba:	eb 14                	jmp    57d0 <out_char+0x173>
    57bc:	90                   	nop
    57bd:	eb 11                	jmp    57d0 <out_char+0x173>
    57bf:	90                   	nop
    57c0:	eb 0e                	jmp    57d0 <out_char+0x173>
    57c2:	83 ec 0c             	sub    $0xc,%esp
    57c5:	ff 75 08             	pushl  0x8(%ebp)
    57c8:	e8 1d fe ff ff       	call   55ea <scroll_down>
    57cd:	83 c4 10             	add    $0x10,%esp
    57d0:	8b 45 08             	mov    0x8(%ebp),%eax
    57d3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    57d9:	8b 50 0c             	mov    0xc(%eax),%edx
    57dc:	8b 45 08             	mov    0x8(%ebp),%eax
    57df:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    57e5:	8b 40 08             	mov    0x8(%eax),%eax
    57e8:	29 c2                	sub    %eax,%edx
    57ea:	89 d0                	mov    %edx,%eax
    57ec:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    57f1:	77 cf                	ja     57c2 <out_char+0x165>
    57f3:	83 ec 0c             	sub    $0xc,%esp
    57f6:	ff 75 08             	pushl  0x8(%ebp)
    57f9:	e8 4a fc ff ff       	call   5448 <flush>
    57fe:	83 c4 10             	add    $0x10,%esp
    5801:	90                   	nop
    5802:	c9                   	leave  
    5803:	c3                   	ret    

00005804 <tty_dev_read>:
    5804:	55                   	push   %ebp
    5805:	89 e5                	mov    %esp,%ebp
    5807:	83 ec 08             	sub    $0x8,%esp
    580a:	a1 80 9e 00 00       	mov    0x9e80,%eax
    580f:	39 45 08             	cmp    %eax,0x8(%ebp)
    5812:	75 17                	jne    582b <tty_dev_read+0x27>
    5814:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5819:	85 c0                	test   %eax,%eax
    581b:	7e 0e                	jle    582b <tty_dev_read+0x27>
    581d:	83 ec 0c             	sub    $0xc,%esp
    5820:	ff 75 08             	pushl  0x8(%ebp)
    5823:	e8 66 06 00 00       	call   5e8e <keyboard_read>
    5828:	83 c4 10             	add    $0x10,%esp
    582b:	90                   	nop
    582c:	c9                   	leave  
    582d:	c3                   	ret    

0000582e <tty_dev_write>:
    582e:	55                   	push   %ebp
    582f:	89 e5                	mov    %esp,%ebp
    5831:	83 ec 78             	sub    $0x78,%esp
    5834:	8b 45 08             	mov    0x8(%ebp),%eax
    5837:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    583d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5840:	e9 9b 01 00 00       	jmp    59e0 <tty_dev_write+0x1b2>
    5845:	8b 45 08             	mov    0x8(%ebp),%eax
    5848:	8b 40 04             	mov    0x4(%eax),%eax
    584b:	8b 00                	mov    (%eax),%eax
    584d:	88 45 f3             	mov    %al,-0xd(%ebp)
    5850:	8b 45 08             	mov    0x8(%ebp),%eax
    5853:	8b 40 04             	mov    0x4(%eax),%eax
    5856:	8d 50 04             	lea    0x4(%eax),%edx
    5859:	8b 45 08             	mov    0x8(%ebp),%eax
    585c:	89 50 04             	mov    %edx,0x4(%eax)
    585f:	8b 45 08             	mov    0x8(%ebp),%eax
    5862:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    5868:	8d 50 ff             	lea    -0x1(%eax),%edx
    586b:	8b 45 08             	mov    0x8(%ebp),%eax
    586e:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
    5874:	8b 45 08             	mov    0x8(%ebp),%eax
    5877:	8b 40 04             	mov    0x4(%eax),%eax
    587a:	8b 55 08             	mov    0x8(%ebp),%edx
    587d:	83 c2 08             	add    $0x8,%edx
    5880:	81 c2 80 0c 00 00    	add    $0xc80,%edx
    5886:	39 d0                	cmp    %edx,%eax
    5888:	75 0c                	jne    5896 <tty_dev_write+0x68>
    588a:	8b 45 08             	mov    0x8(%ebp),%eax
    588d:	8d 50 08             	lea    0x8(%eax),%edx
    5890:	8b 45 08             	mov    0x8(%ebp),%eax
    5893:	89 50 04             	mov    %edx,0x4(%eax)
    5896:	8b 45 08             	mov    0x8(%ebp),%eax
    5899:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    589f:	85 c0                	test   %eax,%eax
    58a1:	0f 84 39 01 00 00    	je     59e0 <tty_dev_write+0x1b2>
    58a7:	80 7d f3 20          	cmpb   $0x20,-0xd(%ebp)
    58ab:	76 71                	jbe    591e <tty_dev_write+0xf0>
    58ad:	80 7d f3 7e          	cmpb   $0x7e,-0xd(%ebp)
    58b1:	77 6b                	ja     591e <tty_dev_write+0xf0>
    58b3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    58b7:	89 c1                	mov    %eax,%ecx
    58b9:	8b 45 08             	mov    0x8(%ebp),%eax
    58bc:	8b 90 94 0c 00 00    	mov    0xc94(%eax),%edx
    58c2:	8b 45 08             	mov    0x8(%ebp),%eax
    58c5:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    58cb:	01 d0                	add    %edx,%eax
    58cd:	83 ec 04             	sub    $0x4,%esp
    58d0:	6a 01                	push   $0x1
    58d2:	51                   	push   %ecx
    58d3:	50                   	push   %eax
    58d4:	e8 ae 11 00 00       	call   6a87 <Memcpy>
    58d9:	83 c4 10             	add    $0x10,%esp
    58dc:	8b 45 08             	mov    0x8(%ebp),%eax
    58df:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    58e5:	8d 50 ff             	lea    -0x1(%eax),%edx
    58e8:	8b 45 08             	mov    0x8(%ebp),%eax
    58eb:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    58f1:	8b 45 08             	mov    0x8(%ebp),%eax
    58f4:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    58fa:	8d 50 01             	lea    0x1(%eax),%edx
    58fd:	8b 45 08             	mov    0x8(%ebp),%eax
    5900:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    5906:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    590a:	83 ec 08             	sub    $0x8,%esp
    590d:	50                   	push   %eax
    590e:	ff 75 08             	pushl  0x8(%ebp)
    5911:	e8 47 fd ff ff       	call   565d <out_char>
    5916:	83 c4 10             	add    $0x10,%esp
    5919:	e9 c2 00 00 00       	jmp    59e0 <tty_dev_write+0x1b2>
    591e:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
    5922:	75 3f                	jne    5963 <tty_dev_write+0x135>
    5924:	8b 45 08             	mov    0x8(%ebp),%eax
    5927:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
    592d:	8d 50 01             	lea    0x1(%eax),%edx
    5930:	8b 45 08             	mov    0x8(%ebp),%eax
    5933:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    5939:	8b 45 08             	mov    0x8(%ebp),%eax
    593c:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5942:	8d 50 ff             	lea    -0x1(%eax),%edx
    5945:	8b 45 08             	mov    0x8(%ebp),%eax
    5948:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    594e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    5952:	83 ec 08             	sub    $0x8,%esp
    5955:	50                   	push   %eax
    5956:	ff 75 08             	pushl  0x8(%ebp)
    5959:	e8 ff fc ff ff       	call   565d <out_char>
    595e:	83 c4 10             	add    $0x10,%esp
    5961:	eb 7d                	jmp    59e0 <tty_dev_write+0x1b2>
    5963:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
    5967:	74 10                	je     5979 <tty_dev_write+0x14b>
    5969:	8b 45 08             	mov    0x8(%ebp),%eax
    596c:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
    5972:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5975:	39 c2                	cmp    %eax,%edx
    5977:	75 67                	jne    59e0 <tty_dev_write+0x1b2>
    5979:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
    597d:	83 ec 08             	sub    $0x8,%esp
    5980:	50                   	push   %eax
    5981:	ff 75 08             	pushl  0x8(%ebp)
    5984:	e8 d4 fc ff ff       	call   565d <out_char>
    5989:	83 c4 10             	add    $0x10,%esp
    598c:	8b 45 08             	mov    0x8(%ebp),%eax
    598f:	c7 80 8c 0c 00 00 00 	movl   $0x0,0xc8c(%eax)
    5996:	00 00 00 
    5999:	8b 45 08             	mov    0x8(%ebp),%eax
    599c:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
    59a3:	00 00 00 
    59a6:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
    59ad:	8b 45 08             	mov    0x8(%ebp),%eax
    59b0:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    59b6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    59b9:	8b 45 08             	mov    0x8(%ebp),%eax
    59bc:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
    59c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    59c5:	8b 45 08             	mov    0x8(%ebp),%eax
    59c8:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
    59ce:	83 ec 04             	sub    $0x4,%esp
    59d1:	50                   	push   %eax
    59d2:	8d 45 88             	lea    -0x78(%ebp),%eax
    59d5:	50                   	push   %eax
    59d6:	6a 01                	push   $0x1
    59d8:	e8 d6 cf ff ff       	call   29b3 <send_rec>
    59dd:	83 c4 10             	add    $0x10,%esp
    59e0:	8b 45 08             	mov    0x8(%ebp),%eax
    59e3:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    59e9:	85 c0                	test   %eax,%eax
    59eb:	0f 85 54 fe ff ff    	jne    5845 <tty_dev_write+0x17>
    59f1:	90                   	nop
    59f2:	c9                   	leave  
    59f3:	c3                   	ret    

000059f4 <tty_do_read>:
    59f4:	55                   	push   %ebp
    59f5:	89 e5                	mov    %esp,%ebp
    59f7:	83 ec 08             	sub    $0x8,%esp
    59fa:	8b 45 08             	mov    0x8(%ebp),%eax
    59fd:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
    5a04:	00 00 00 
    5a07:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a0a:	8b 50 58             	mov    0x58(%eax),%edx
    5a0d:	8b 45 08             	mov    0x8(%ebp),%eax
    5a10:	89 90 9c 0c 00 00    	mov    %edx,0xc9c(%eax)
    5a16:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a19:	8b 00                	mov    (%eax),%eax
    5a1b:	89 c2                	mov    %eax,%edx
    5a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    5a20:	89 90 98 0c 00 00    	mov    %edx,0xc98(%eax)
    5a26:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a29:	8b 50 1c             	mov    0x1c(%eax),%edx
    5a2c:	8b 45 08             	mov    0x8(%ebp),%eax
    5a2f:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
    5a35:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a38:	8b 40 10             	mov    0x10(%eax),%eax
    5a3b:	89 c2                	mov    %eax,%edx
    5a3d:	8b 45 08             	mov    0x8(%ebp),%eax
    5a40:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
    5a46:	83 ec 08             	sub    $0x8,%esp
    5a49:	52                   	push   %edx
    5a4a:	50                   	push   %eax
    5a4b:	e8 26 f7 ff ff       	call   5176 <v2l>
    5a50:	83 c4 10             	add    $0x10,%esp
    5a53:	89 c2                	mov    %eax,%edx
    5a55:	8b 45 08             	mov    0x8(%ebp),%eax
    5a58:	89 90 94 0c 00 00    	mov    %edx,0xc94(%eax)
    5a5e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a61:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%eax)
    5a68:	8b 45 08             	mov    0x8(%ebp),%eax
    5a6b:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
    5a71:	83 ec 04             	sub    $0x4,%esp
    5a74:	50                   	push   %eax
    5a75:	ff 75 0c             	pushl  0xc(%ebp)
    5a78:	6a 01                	push   $0x1
    5a7a:	e8 34 cf ff ff       	call   29b3 <send_rec>
    5a7f:	83 c4 10             	add    $0x10,%esp
    5a82:	90                   	nop
    5a83:	c9                   	leave  
    5a84:	c3                   	ret    

00005a85 <tty_do_write>:
    5a85:	55                   	push   %ebp
    5a86:	89 e5                	mov    %esp,%ebp
    5a88:	53                   	push   %ebx
    5a89:	81 ec 84 00 00 00    	sub    $0x84,%esp
    5a8f:	89 e0                	mov    %esp,%eax
    5a91:	89 c3                	mov    %eax,%ebx
    5a93:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
    5a9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5a9d:	8d 50 ff             	lea    -0x1(%eax),%edx
    5aa0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    5aa3:	89 c2                	mov    %eax,%edx
    5aa5:	b8 10 00 00 00       	mov    $0x10,%eax
    5aaa:	83 e8 01             	sub    $0x1,%eax
    5aad:	01 d0                	add    %edx,%eax
    5aaf:	b9 10 00 00 00       	mov    $0x10,%ecx
    5ab4:	ba 00 00 00 00       	mov    $0x0,%edx
    5ab9:	f7 f1                	div    %ecx
    5abb:	6b c0 10             	imul   $0x10,%eax,%eax
    5abe:	29 c4                	sub    %eax,%esp
    5ac0:	89 e0                	mov    %esp,%eax
    5ac2:	83 c0 00             	add    $0x0,%eax
    5ac5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5ac8:	8b 45 0c             	mov    0xc(%ebp),%eax
    5acb:	8b 40 50             	mov    0x50(%eax),%eax
    5ace:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5ad1:	e9 9b 00 00 00       	jmp    5b71 <tty_do_write+0xec>
    5ad6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5ad9:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    5adc:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
    5ae0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5ae3:	8b 45 0c             	mov    0xc(%ebp),%eax
    5ae6:	8b 40 10             	mov    0x10(%eax),%eax
    5ae9:	89 c2                	mov    %eax,%edx
    5aeb:	8b 45 0c             	mov    0xc(%ebp),%eax
    5aee:	8b 40 58             	mov    0x58(%eax),%eax
    5af1:	83 ec 08             	sub    $0x8,%esp
    5af4:	52                   	push   %edx
    5af5:	50                   	push   %eax
    5af6:	e8 7b f6 ff ff       	call   5176 <v2l>
    5afb:	83 c4 10             	add    $0x10,%esp
    5afe:	89 c2                	mov    %eax,%edx
    5b00:	8b 45 08             	mov    0x8(%ebp),%eax
    5b03:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5b09:	01 d0                	add    %edx,%eax
    5b0b:	89 c2                	mov    %eax,%edx
    5b0d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5b10:	83 ec 04             	sub    $0x4,%esp
    5b13:	ff 75 f0             	pushl  -0x10(%ebp)
    5b16:	52                   	push   %edx
    5b17:	50                   	push   %eax
    5b18:	e8 6a 0f 00 00       	call   6a87 <Memcpy>
    5b1d:	83 c4 10             	add    $0x10,%esp
    5b20:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b23:	29 45 ec             	sub    %eax,-0x14(%ebp)
    5b26:	8b 45 08             	mov    0x8(%ebp),%eax
    5b29:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
    5b2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b32:	01 c2                	add    %eax,%edx
    5b34:	8b 45 08             	mov    0x8(%ebp),%eax
    5b37:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
    5b3d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5b44:	eb 25                	jmp    5b6b <tty_do_write+0xe6>
    5b46:	8b 55 e0             	mov    -0x20(%ebp),%edx
    5b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b4c:	01 d0                	add    %edx,%eax
    5b4e:	0f b6 00             	movzbl (%eax),%eax
    5b51:	0f b6 c0             	movzbl %al,%eax
    5b54:	83 ec 08             	sub    $0x8,%esp
    5b57:	50                   	push   %eax
    5b58:	ff 75 08             	pushl  0x8(%ebp)
    5b5b:	e8 fd fa ff ff       	call   565d <out_char>
    5b60:	83 c4 10             	add    $0x10,%esp
    5b63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5b67:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    5b6b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5b6f:	75 d5                	jne    5b46 <tty_do_write+0xc1>
    5b71:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5b75:	0f 85 5b ff ff ff    	jne    5ad6 <tty_do_write+0x51>
    5b7b:	c7 85 7c ff ff ff 65 	movl   $0x65,-0x84(%ebp)
    5b82:	00 00 00 
    5b85:	8b 45 08             	mov    0x8(%ebp),%eax
    5b88:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
    5b8e:	89 45 c0             	mov    %eax,-0x40(%ebp)
    5b91:	8b 45 0c             	mov    0xc(%ebp),%eax
    5b94:	8b 00                	mov    (%eax),%eax
    5b96:	83 ec 04             	sub    $0x4,%esp
    5b99:	50                   	push   %eax
    5b9a:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    5ba0:	50                   	push   %eax
    5ba1:	6a 01                	push   $0x1
    5ba3:	e8 0b ce ff ff       	call   29b3 <send_rec>
    5ba8:	83 c4 10             	add    $0x10,%esp
    5bab:	89 dc                	mov    %ebx,%esp
    5bad:	90                   	nop
    5bae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    5bb1:	c9                   	leave  
    5bb2:	c3                   	ret    

00005bb3 <init_screen>:
    5bb3:	55                   	push   %ebp
    5bb4:	89 e5                	mov    %esp,%ebp
    5bb6:	83 ec 10             	sub    $0x10,%esp
    5bb9:	8b 45 08             	mov    0x8(%ebp),%eax
    5bbc:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5bc1:	c1 f8 02             	sar    $0x2,%eax
    5bc4:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
    5bca:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5bcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5bd0:	c1 e0 04             	shl    $0x4,%eax
    5bd3:	8d 90 a0 d4 00 00    	lea    0xd4a0(%eax),%edx
    5bd9:	8b 45 08             	mov    0x8(%ebp),%eax
    5bdc:	89 90 a0 0c 00 00    	mov    %edx,0xca0(%eax)
    5be2:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
    5be9:	8b 45 08             	mov    0x8(%ebp),%eax
    5bec:	8b 88 a0 0c 00 00    	mov    0xca0(%eax),%ecx
    5bf2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5bf5:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    5bfa:	f7 e2                	mul    %edx
    5bfc:	89 d0                	mov    %edx,%eax
    5bfe:	d1 e8                	shr    %eax
    5c00:	89 41 04             	mov    %eax,0x4(%ecx)
    5c03:	8b 45 08             	mov    0x8(%ebp),%eax
    5c06:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5c0c:	8b 50 04             	mov    0x4(%eax),%edx
    5c0f:	8b 45 08             	mov    0x8(%ebp),%eax
    5c12:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5c18:	0f af 55 fc          	imul   -0x4(%ebp),%edx
    5c1c:	89 10                	mov    %edx,(%eax)
    5c1e:	8b 45 08             	mov    0x8(%ebp),%eax
    5c21:	8b 90 a0 0c 00 00    	mov    0xca0(%eax),%edx
    5c27:	8b 45 08             	mov    0x8(%ebp),%eax
    5c2a:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
    5c30:	8b 12                	mov    (%edx),%edx
    5c32:	89 50 08             	mov    %edx,0x8(%eax)
    5c35:	8b 55 08             	mov    0x8(%ebp),%edx
    5c38:	8b 92 a0 0c 00 00    	mov    0xca0(%edx),%edx
    5c3e:	8b 40 08             	mov    0x8(%eax),%eax
    5c41:	89 42 0c             	mov    %eax,0xc(%edx)
    5c44:	90                   	nop
    5c45:	c9                   	leave  
    5c46:	c3                   	ret    

00005c47 <init_tty>:
    5c47:	55                   	push   %ebp
    5c48:	89 e5                	mov    %esp,%ebp
    5c4a:	83 ec 18             	sub    $0x18,%esp
    5c4d:	c7 45 f4 00 a6 00 00 	movl   $0xa600,-0xc(%ebp)
    5c54:	eb 7a                	jmp    5cd0 <init_tty+0x89>
    5c56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c59:	8d 50 08             	lea    0x8(%eax),%edx
    5c5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c5f:	89 50 04             	mov    %edx,0x4(%eax)
    5c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c65:	8b 50 04             	mov    0x4(%eax),%edx
    5c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c6b:	89 10                	mov    %edx,(%eax)
    5c6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c70:	c7 80 88 0c 00 00 00 	movl   $0x0,0xc88(%eax)
    5c77:	00 00 00 
    5c7a:	ff 75 f4             	pushl  -0xc(%ebp)
    5c7d:	e8 31 ff ff ff       	call   5bb3 <init_screen>
    5c82:	83 c4 04             	add    $0x4,%esp
    5c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c88:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5c8d:	85 c0                	test   %eax,%eax
    5c8f:	7e 38                	jle    5cc9 <init_tty+0x82>
    5c91:	83 ec 08             	sub    $0x8,%esp
    5c94:	6a 23                	push   $0x23
    5c96:	ff 75 f4             	pushl  -0xc(%ebp)
    5c99:	e8 bf f9 ff ff       	call   565d <out_char>
    5c9e:	83 c4 10             	add    $0x10,%esp
    5ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5ca4:	05 64 6b 02 00       	add    $0x26b64,%eax
    5ca9:	2d 00 a6 00 00       	sub    $0xa600,%eax
    5cae:	c1 f8 02             	sar    $0x2,%eax
    5cb1:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
    5cb7:	0f b6 c0             	movzbl %al,%eax
    5cba:	83 ec 08             	sub    $0x8,%esp
    5cbd:	50                   	push   %eax
    5cbe:	ff 75 f4             	pushl  -0xc(%ebp)
    5cc1:	e8 97 f9 ff ff       	call   565d <out_char>
    5cc6:	83 c4 10             	add    $0x10,%esp
    5cc9:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
    5cd0:	b8 ec cb 00 00       	mov    $0xcbec,%eax
    5cd5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5cd8:	0f 82 78 ff ff ff    	jb     5c56 <init_tty+0xf>
    5cde:	90                   	nop
    5cdf:	c9                   	leave  
    5ce0:	c3                   	ret    

00005ce1 <TaskTTY>:
    5ce1:	55                   	push   %ebp
    5ce2:	89 e5                	mov    %esp,%ebp
    5ce4:	83 ec 78             	sub    $0x78,%esp
    5ce7:	e8 5b ff ff ff       	call   5c47 <init_tty>
    5cec:	83 ec 0c             	sub    $0xc,%esp
    5cef:	6a 00                	push   $0x0
    5cf1:	e8 16 f7 ff ff       	call   540c <select_console>
    5cf6:	83 c4 10             	add    $0x10,%esp
    5cf9:	c7 45 f4 00 a6 00 00 	movl   $0xa600,-0xc(%ebp)
    5d00:	eb 30                	jmp    5d32 <TaskTTY+0x51>
    5d02:	83 ec 0c             	sub    $0xc,%esp
    5d05:	ff 75 f4             	pushl  -0xc(%ebp)
    5d08:	e8 f7 fa ff ff       	call   5804 <tty_dev_read>
    5d0d:	83 c4 10             	add    $0x10,%esp
    5d10:	83 ec 0c             	sub    $0xc,%esp
    5d13:	ff 75 f4             	pushl  -0xc(%ebp)
    5d16:	e8 13 fb ff ff       	call   582e <tty_dev_write>
    5d1b:	83 c4 10             	add    $0x10,%esp
    5d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5d21:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
    5d27:	85 c0                	test   %eax,%eax
    5d29:	75 d7                	jne    5d02 <TaskTTY+0x21>
    5d2b:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
    5d32:	b8 ec cb 00 00       	mov    $0xcbec,%eax
    5d37:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5d3a:	72 c6                	jb     5d02 <TaskTTY+0x21>
    5d3c:	83 ec 04             	sub    $0x4,%esp
    5d3f:	6a 11                	push   $0x11
    5d41:	8d 45 88             	lea    -0x78(%ebp),%eax
    5d44:	50                   	push   %eax
    5d45:	6a 02                	push   $0x2
    5d47:	e8 67 cc ff ff       	call   29b3 <send_rec>
    5d4c:	83 c4 10             	add    $0x10,%esp
    5d4f:	8b 45 8c             	mov    -0x74(%ebp),%eax
    5d52:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5d55:	81 7d f0 d2 07 00 00 	cmpl   $0x7d2,-0x10(%ebp)
    5d5c:	74 14                	je     5d72 <TaskTTY+0x91>
    5d5e:	81 7d f0 d3 07 00 00 	cmpl   $0x7d3,-0x10(%ebp)
    5d65:	74 22                	je     5d89 <TaskTTY+0xa8>
    5d67:	81 7d f0 d1 07 00 00 	cmpl   $0x7d1,-0x10(%ebp)
    5d6e:	75 30                	jne    5da0 <TaskTTY+0xbf>
    5d70:	eb 3f                	jmp    5db1 <TaskTTY+0xd0>
    5d72:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5d77:	83 ec 08             	sub    $0x8,%esp
    5d7a:	8d 55 88             	lea    -0x78(%ebp),%edx
    5d7d:	52                   	push   %edx
    5d7e:	50                   	push   %eax
    5d7f:	e8 70 fc ff ff       	call   59f4 <tty_do_read>
    5d84:	83 c4 10             	add    $0x10,%esp
    5d87:	eb 28                	jmp    5db1 <TaskTTY+0xd0>
    5d89:	a1 80 9e 00 00       	mov    0x9e80,%eax
    5d8e:	83 ec 08             	sub    $0x8,%esp
    5d91:	8d 55 88             	lea    -0x78(%ebp),%edx
    5d94:	52                   	push   %edx
    5d95:	50                   	push   %eax
    5d96:	e8 ea fc ff ff       	call   5a85 <tty_do_write>
    5d9b:	83 c4 10             	add    $0x10,%esp
    5d9e:	eb 11                	jmp    5db1 <TaskTTY+0xd0>
    5da0:	83 ec 0c             	sub    $0xc,%esp
    5da3:	68 2b 6a 00 00       	push   $0x6a2b
    5da8:	e8 91 c4 ff ff       	call   223e <panic>
    5dad:	83 c4 10             	add    $0x10,%esp
    5db0:	90                   	nop
    5db1:	e9 43 ff ff ff       	jmp    5cf9 <TaskTTY+0x18>

00005db6 <keyboard_handler>:
    5db6:	55                   	push   %ebp
    5db7:	89 e5                	mov    %esp,%ebp
    5db9:	83 ec 18             	sub    $0x18,%esp
    5dbc:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
    5dc3:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5dc8:	3d 1f 03 00 00       	cmp    $0x31f,%eax
    5dcd:	7f 5c                	jg     5e2b <keyboard_handler+0x75>
    5dcf:	e8 2e b5 ff ff       	call   1302 <disable_int>
    5dd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5dd7:	0f b7 c0             	movzwl %ax,%eax
    5dda:	83 ec 0c             	sub    $0xc,%esp
    5ddd:	50                   	push   %eax
    5dde:	e8 ef b4 ff ff       	call   12d2 <in_byte>
    5de3:	83 c4 10             	add    $0x10,%esp
    5de6:	88 45 f3             	mov    %al,-0xd(%ebp)
    5de9:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5dee:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
    5df2:	88 10                	mov    %dl,(%eax)
    5df4:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5df9:	83 c0 01             	add    $0x1,%eax
    5dfc:	a3 c0 a2 00 00       	mov    %eax,0xa2c0
    5e01:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5e06:	83 c0 01             	add    $0x1,%eax
    5e09:	a3 c8 a2 00 00       	mov    %eax,0xa2c8
    5e0e:	a1 c0 a2 00 00       	mov    0xa2c0,%eax
    5e13:	ba ec a5 00 00       	mov    $0xa5ec,%edx
    5e18:	39 d0                	cmp    %edx,%eax
    5e1a:	72 0a                	jb     5e26 <keyboard_handler+0x70>
    5e1c:	c7 05 c0 a2 00 00 cc 	movl   $0xa2cc,0xa2c0
    5e23:	a2 00 00 
    5e26:	e8 d9 b4 ff ff       	call   1304 <enable_int>
    5e2b:	90                   	nop
    5e2c:	c9                   	leave  
    5e2d:	c3                   	ret    

00005e2e <read_from_keyboard_buf>:
    5e2e:	55                   	push   %ebp
    5e2f:	89 e5                	mov    %esp,%ebp
    5e31:	83 ec 18             	sub    $0x18,%esp
    5e34:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
    5e38:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5e3d:	85 c0                	test   %eax,%eax
    5e3f:	7e 47                	jle    5e88 <read_from_keyboard_buf+0x5a>
    5e41:	e8 bc b4 ff ff       	call   1302 <disable_int>
    5e46:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5e4b:	0f b6 00             	movzbl (%eax),%eax
    5e4e:	88 45 f7             	mov    %al,-0x9(%ebp)
    5e51:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5e56:	83 c0 01             	add    $0x1,%eax
    5e59:	a3 c4 a2 00 00       	mov    %eax,0xa2c4
    5e5e:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5e63:	83 e8 01             	sub    $0x1,%eax
    5e66:	a3 c8 a2 00 00       	mov    %eax,0xa2c8
    5e6b:	a1 c4 a2 00 00       	mov    0xa2c4,%eax
    5e70:	ba ec a5 00 00       	mov    $0xa5ec,%edx
    5e75:	39 d0                	cmp    %edx,%eax
    5e77:	72 0a                	jb     5e83 <read_from_keyboard_buf+0x55>
    5e79:	c7 05 c4 a2 00 00 cc 	movl   $0xa2cc,0xa2c4
    5e80:	a2 00 00 
    5e83:	e8 7c b4 ff ff       	call   1304 <enable_int>
    5e88:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    5e8c:	c9                   	leave  
    5e8d:	c3                   	ret    

00005e8e <keyboard_read>:
    5e8e:	55                   	push   %ebp
    5e8f:	89 e5                	mov    %esp,%ebp
    5e91:	83 ec 28             	sub    $0x28,%esp
    5e94:	90                   	nop
    5e95:	a1 c8 a2 00 00       	mov    0xa2c8,%eax
    5e9a:	85 c0                	test   %eax,%eax
    5e9c:	7e f7                	jle    5e95 <keyboard_read+0x7>
    5e9e:	e8 8b ff ff ff       	call   5e2e <read_from_keyboard_buf>
    5ea3:	88 45 ea             	mov    %al,-0x16(%ebp)
    5ea6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5ead:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5eb1:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
    5eb5:	75 5a                	jne    5f11 <keyboard_read+0x83>
    5eb7:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
    5ebb:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
    5ebf:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
    5ec3:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
    5ec7:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
    5ecb:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
    5ecf:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
    5ed3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    5eda:	eb 20                	jmp    5efc <keyboard_read+0x6e>
    5edc:	e8 4d ff ff ff       	call   5e2e <read_from_keyboard_buf>
    5ee1:	89 c1                	mov    %eax,%ecx
    5ee3:	8d 55 e3             	lea    -0x1d(%ebp),%edx
    5ee6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5ee9:	01 d0                	add    %edx,%eax
    5eeb:	0f b6 00             	movzbl (%eax),%eax
    5eee:	38 c1                	cmp    %al,%cl
    5ef0:	74 06                	je     5ef8 <keyboard_read+0x6a>
    5ef2:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
    5ef6:	eb 0a                	jmp    5f02 <keyboard_read+0x74>
    5ef8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5efc:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
    5f00:	7e da                	jle    5edc <keyboard_read+0x4e>
    5f02:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
    5f06:	74 68                	je     5f70 <keyboard_read+0xe2>
    5f08:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
    5f0f:	eb 5f                	jmp    5f70 <keyboard_read+0xe2>
    5f11:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
    5f15:	75 59                	jne    5f70 <keyboard_read+0xe2>
    5f17:	e8 12 ff ff ff       	call   5e2e <read_from_keyboard_buf>
    5f1c:	3c 2a                	cmp    $0x2a,%al
    5f1e:	75 1d                	jne    5f3d <keyboard_read+0xaf>
    5f20:	e8 09 ff ff ff       	call   5e2e <read_from_keyboard_buf>
    5f25:	3c e0                	cmp    $0xe0,%al
    5f27:	75 14                	jne    5f3d <keyboard_read+0xaf>
    5f29:	e8 00 ff ff ff       	call   5e2e <read_from_keyboard_buf>
    5f2e:	3c 37                	cmp    $0x37,%al
    5f30:	75 0b                	jne    5f3d <keyboard_read+0xaf>
    5f32:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    5f39:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    5f3d:	e8 ec fe ff ff       	call   5e2e <read_from_keyboard_buf>
    5f42:	3c b7                	cmp    $0xb7,%al
    5f44:	75 1d                	jne    5f63 <keyboard_read+0xd5>
    5f46:	e8 e3 fe ff ff       	call   5e2e <read_from_keyboard_buf>
    5f4b:	3c e0                	cmp    $0xe0,%al
    5f4d:	75 14                	jne    5f63 <keyboard_read+0xd5>
    5f4f:	e8 da fe ff ff       	call   5e2e <read_from_keyboard_buf>
    5f54:	3c aa                	cmp    $0xaa,%al
    5f56:	75 0b                	jne    5f63 <keyboard_read+0xd5>
    5f58:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
    5f5f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5f63:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5f67:	75 07                	jne    5f70 <keyboard_read+0xe2>
    5f69:	c6 05 84 9e 00 00 01 	movb   $0x1,0x9e84
    5f70:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
    5f77:	0f 84 8d 00 00 00    	je     600a <keyboard_read+0x17c>
    5f7d:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
    5f84:	0f 84 80 00 00 00    	je     600a <keyboard_read+0x17c>
    5f8a:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
    5f8e:	0f 94 c2             	sete   %dl
    5f91:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
    5f95:	0f 94 c0             	sete   %al
    5f98:	09 d0                	or     %edx,%eax
    5f9a:	84 c0                	test   %al,%al
    5f9c:	74 07                	je     5fa5 <keyboard_read+0x117>
    5f9e:	c6 05 74 cc 00 00 01 	movb   $0x1,0xcc74
    5fa5:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    5fa9:	f7 d0                	not    %eax
    5fab:	c0 e8 07             	shr    $0x7,%al
    5fae:	88 45 e9             	mov    %al,-0x17(%ebp)
    5fb1:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
    5fb5:	74 53                	je     600a <keyboard_read+0x17c>
    5fb7:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
    5fbb:	74 4d                	je     600a <keyboard_read+0x17c>
    5fbd:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
    5fc1:	0f b6 05 74 cc 00 00 	movzbl 0xcc74,%eax
    5fc8:	3c 01                	cmp    $0x1,%al
    5fca:	75 04                	jne    5fd0 <keyboard_read+0x142>
    5fcc:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    5fd0:	0f b6 05 84 9e 00 00 	movzbl 0x9e84,%eax
    5fd7:	84 c0                	test   %al,%al
    5fd9:	74 04                	je     5fdf <keyboard_read+0x151>
    5fdb:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
    5fdf:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
    5fe3:	89 d0                	mov    %edx,%eax
    5fe5:	01 c0                	add    %eax,%eax
    5fe7:	01 c2                	add    %eax,%edx
    5fe9:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    5fed:	01 d0                	add    %edx,%eax
    5fef:	8b 04 85 80 90 00 00 	mov    0x9080(,%eax,4),%eax
    5ff6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5ff9:	83 ec 08             	sub    $0x8,%esp
    5ffc:	ff 75 f4             	pushl  -0xc(%ebp)
    5fff:	ff 75 08             	pushl  0x8(%ebp)
    6002:	e8 1a 00 00 00       	call   6021 <in_process>
    6007:	83 c4 10             	add    $0x10,%esp
    600a:	90                   	nop
    600b:	c9                   	leave  
    600c:	c3                   	ret    

0000600d <init_keyboard_handler>:
    600d:	55                   	push   %ebp
    600e:	89 e5                	mov    %esp,%ebp
    6010:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    6017:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    601e:	90                   	nop
    601f:	5d                   	pop    %ebp
    6020:	c3                   	ret    

00006021 <in_process>:
    6021:	55                   	push   %ebp
    6022:	89 e5                	mov    %esp,%ebp
    6024:	83 ec 18             	sub    $0x18,%esp
    6027:	83 ec 04             	sub    $0x4,%esp
    602a:	6a 02                	push   $0x2
    602c:	6a 00                	push   $0x0
    602e:	8d 45 f6             	lea    -0xa(%ebp),%eax
    6031:	50                   	push   %eax
    6032:	e8 7e 0a 00 00       	call   6ab5 <Memset>
    6037:	83 c4 10             	add    $0x10,%esp
    603a:	8b 45 0c             	mov    0xc(%ebp),%eax
    603d:	25 00 01 00 00       	and    $0x100,%eax
    6042:	85 c0                	test   %eax,%eax
    6044:	75 28                	jne    606e <in_process+0x4d>
    6046:	8b 45 0c             	mov    0xc(%ebp),%eax
    6049:	0f b6 c0             	movzbl %al,%eax
    604c:	83 ec 08             	sub    $0x8,%esp
    604f:	50                   	push   %eax
    6050:	ff 75 08             	pushl  0x8(%ebp)
    6053:	e8 e5 f4 ff ff       	call   553d <put_key>
    6058:	83 c4 10             	add    $0x10,%esp
    605b:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    6062:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    6069:	e9 42 01 00 00       	jmp    61b0 <in_process+0x18f>
    606e:	0f b6 05 74 cc 00 00 	movzbl 0xcc74,%eax
    6075:	84 c0                	test   %al,%al
    6077:	0f 84 a9 00 00 00    	je     6126 <in_process+0x105>
    607d:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
    6081:	0f 84 9f 00 00 00    	je     6126 <in_process+0x105>
    6087:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
    608b:	0f 84 95 00 00 00    	je     6126 <in_process+0x105>
    6091:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    6098:	74 64                	je     60fe <in_process+0xdd>
    609a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    60a1:	77 0b                	ja     60ae <in_process+0x8d>
    60a3:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    60aa:	74 64                	je     6110 <in_process+0xef>
    60ac:	eb 73                	jmp    6121 <in_process+0x100>
    60ae:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
    60b5:	74 0b                	je     60c2 <in_process+0xa1>
    60b7:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
    60be:	74 20                	je     60e0 <in_process+0xbf>
    60c0:	eb 5f                	jmp    6121 <in_process+0x100>
    60c2:	83 ec 0c             	sub    $0xc,%esp
    60c5:	ff 75 08             	pushl  0x8(%ebp)
    60c8:	e8 dc f4 ff ff       	call   55a9 <scroll_up>
    60cd:	83 c4 10             	add    $0x10,%esp
    60d0:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    60d7:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    60de:	eb 41                	jmp    6121 <in_process+0x100>
    60e0:	83 ec 0c             	sub    $0xc,%esp
    60e3:	ff 75 08             	pushl  0x8(%ebp)
    60e6:	e8 ff f4 ff ff       	call   55ea <scroll_down>
    60eb:	83 c4 10             	add    $0x10,%esp
    60ee:	c6 05 74 cc 00 00 00 	movb   $0x0,0xcc74
    60f5:	c6 05 84 9e 00 00 00 	movb   $0x0,0x9e84
    60fc:	eb 23                	jmp    6121 <in_process+0x100>
    60fe:	83 ec 08             	sub    $0x8,%esp
    6101:	6a 0a                	push   $0xa
    6103:	ff 75 08             	pushl  0x8(%ebp)
    6106:	e8 52 f5 ff ff       	call   565d <out_char>
    610b:	83 c4 10             	add    $0x10,%esp
    610e:	eb 11                	jmp    6121 <in_process+0x100>
    6110:	83 ec 08             	sub    $0x8,%esp
    6113:	6a 08                	push   $0x8
    6115:	ff 75 08             	pushl  0x8(%ebp)
    6118:	e8 40 f5 ff ff       	call   565d <out_char>
    611d:	83 c4 10             	add    $0x10,%esp
    6120:	90                   	nop
    6121:	e9 8a 00 00 00       	jmp    61b0 <in_process+0x18f>
    6126:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    612d:	74 55                	je     6184 <in_process+0x163>
    612f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
    6136:	77 14                	ja     614c <in_process+0x12b>
    6138:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
    613f:	74 31                	je     6172 <in_process+0x151>
    6141:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
    6148:	74 16                	je     6160 <in_process+0x13f>
    614a:	eb 64                	jmp    61b0 <in_process+0x18f>
    614c:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
    6153:	74 3e                	je     6193 <in_process+0x172>
    6155:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
    615c:	74 44                	je     61a2 <in_process+0x181>
    615e:	eb 50                	jmp    61b0 <in_process+0x18f>
    6160:	83 ec 08             	sub    $0x8,%esp
    6163:	6a 0a                	push   $0xa
    6165:	ff 75 08             	pushl  0x8(%ebp)
    6168:	e8 d0 f3 ff ff       	call   553d <put_key>
    616d:	83 c4 10             	add    $0x10,%esp
    6170:	eb 3e                	jmp    61b0 <in_process+0x18f>
    6172:	83 ec 08             	sub    $0x8,%esp
    6175:	6a 08                	push   $0x8
    6177:	ff 75 08             	pushl  0x8(%ebp)
    617a:	e8 be f3 ff ff       	call   553d <put_key>
    617f:	83 c4 10             	add    $0x10,%esp
    6182:	eb 2c                	jmp    61b0 <in_process+0x18f>
    6184:	83 ec 0c             	sub    $0xc,%esp
    6187:	6a 00                	push   $0x0
    6189:	e8 7e f2 ff ff       	call   540c <select_console>
    618e:	83 c4 10             	add    $0x10,%esp
    6191:	eb 1d                	jmp    61b0 <in_process+0x18f>
    6193:	83 ec 0c             	sub    $0xc,%esp
    6196:	6a 01                	push   $0x1
    6198:	e8 6f f2 ff ff       	call   540c <select_console>
    619d:	83 c4 10             	add    $0x10,%esp
    61a0:	eb 0e                	jmp    61b0 <in_process+0x18f>
    61a2:	83 ec 0c             	sub    $0xc,%esp
    61a5:	6a 02                	push   $0x2
    61a7:	e8 60 f2 ff ff       	call   540c <select_console>
    61ac:	83 c4 10             	add    $0x10,%esp
    61af:	90                   	nop
    61b0:	90                   	nop
    61b1:	c9                   	leave  
    61b2:	c3                   	ret    

000061b3 <open>:
    61b3:	55                   	push   %ebp
    61b4:	89 e5                	mov    %esp,%ebp
    61b6:	83 ec 78             	sub    $0x78,%esp
    61b9:	c7 45 94 06 00 00 00 	movl   $0x6,-0x6c(%ebp)
    61c0:	8b 45 08             	mov    0x8(%ebp),%eax
    61c3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    61c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    61c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    61cc:	83 ec 0c             	sub    $0xc,%esp
    61cf:	ff 75 08             	pushl  0x8(%ebp)
    61d2:	e8 17 09 00 00       	call   6aee <Strlen>
    61d7:	83 c4 10             	add    $0x10,%esp
    61da:	89 45 c0             	mov    %eax,-0x40(%ebp)
    61dd:	83 ec 04             	sub    $0x4,%esp
    61e0:	6a 03                	push   $0x3
    61e2:	8d 45 90             	lea    -0x70(%ebp),%eax
    61e5:	50                   	push   %eax
    61e6:	6a 03                	push   $0x3
    61e8:	e8 c6 c7 ff ff       	call   29b3 <send_rec>
    61ed:	83 c4 10             	add    $0x10,%esp
    61f0:	8b 45 94             	mov    -0x6c(%ebp),%eax
    61f3:	83 f8 65             	cmp    $0x65,%eax
    61f6:	74 19                	je     6211 <open+0x5e>
    61f8:	6a 17                	push   $0x17
    61fa:	68 40 6a 00 00       	push   $0x6a40
    61ff:	68 40 6a 00 00       	push   $0x6a40
    6204:	68 4b 6a 00 00       	push   $0x6a4b
    6209:	e8 4e c0 ff ff       	call   225c <assertion_failure>
    620e:	83 c4 10             	add    $0x10,%esp
    6211:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6214:	c9                   	leave  
    6215:	c3                   	ret    

00006216 <read>:
    6216:	55                   	push   %ebp
    6217:	89 e5                	mov    %esp,%ebp
    6219:	83 ec 78             	sub    $0x78,%esp
    621c:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%ebp)
    6223:	8b 45 08             	mov    0x8(%ebp),%eax
    6226:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6229:	8b 45 0c             	mov    0xc(%ebp),%eax
    622c:	89 45 a0             	mov    %eax,-0x60(%ebp)
    622f:	8b 45 10             	mov    0x10(%ebp),%eax
    6232:	89 45 e0             	mov    %eax,-0x20(%ebp)
    6235:	83 ec 04             	sub    $0x4,%esp
    6238:	6a 03                	push   $0x3
    623a:	8d 45 90             	lea    -0x70(%ebp),%eax
    623d:	50                   	push   %eax
    623e:	6a 03                	push   $0x3
    6240:	e8 6e c7 ff ff       	call   29b3 <send_rec>
    6245:	83 c4 10             	add    $0x10,%esp
    6248:	8b 45 e0             	mov    -0x20(%ebp),%eax
    624b:	c9                   	leave  
    624c:	c3                   	ret    

0000624d <write>:
    624d:	55                   	push   %ebp
    624e:	89 e5                	mov    %esp,%ebp
    6250:	83 ec 78             	sub    $0x78,%esp
    6253:	c7 45 94 0a 00 00 00 	movl   $0xa,-0x6c(%ebp)
    625a:	8b 45 08             	mov    0x8(%ebp),%eax
    625d:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6260:	8b 45 0c             	mov    0xc(%ebp),%eax
    6263:	89 45 a0             	mov    %eax,-0x60(%ebp)
    6266:	8b 45 10             	mov    0x10(%ebp),%eax
    6269:	89 45 e0             	mov    %eax,-0x20(%ebp)
    626c:	83 ec 04             	sub    $0x4,%esp
    626f:	6a 03                	push   $0x3
    6271:	8d 45 90             	lea    -0x70(%ebp),%eax
    6274:	50                   	push   %eax
    6275:	6a 03                	push   $0x3
    6277:	e8 37 c7 ff ff       	call   29b3 <send_rec>
    627c:	83 c4 10             	add    $0x10,%esp
    627f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6282:	c9                   	leave  
    6283:	c3                   	ret    

00006284 <close>:
    6284:	55                   	push   %ebp
    6285:	89 e5                	mov    %esp,%ebp
    6287:	83 ec 78             	sub    $0x78,%esp
    628a:	c7 45 94 01 00 00 00 	movl   $0x1,-0x6c(%ebp)
    6291:	8b 45 08             	mov    0x8(%ebp),%eax
    6294:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6297:	83 ec 04             	sub    $0x4,%esp
    629a:	6a 03                	push   $0x3
    629c:	8d 45 90             	lea    -0x70(%ebp),%eax
    629f:	50                   	push   %eax
    62a0:	6a 03                	push   $0x3
    62a2:	e8 0c c7 ff ff       	call   29b3 <send_rec>
    62a7:	83 c4 10             	add    $0x10,%esp
    62aa:	8b 45 94             	mov    -0x6c(%ebp),%eax
    62ad:	83 f8 65             	cmp    $0x65,%eax
    62b0:	74 19                	je     62cb <close+0x47>
    62b2:	6a 14                	push   $0x14
    62b4:	68 63 6a 00 00       	push   $0x6a63
    62b9:	68 63 6a 00 00       	push   $0x6a63
    62be:	68 6f 6a 00 00       	push   $0x6a6f
    62c3:	e8 94 bf ff ff       	call   225c <assertion_failure>
    62c8:	83 c4 10             	add    $0x10,%esp
    62cb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    62ce:	c9                   	leave  
    62cf:	c3                   	ret    
