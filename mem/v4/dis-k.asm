
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001000 <_start>:
c0001000:	c7 05 9c ce 00 c0 00 	movl   $0x0,0xc000ce9c
c0001007:	00 00 00 
c000100a:	b4 0b                	mov    $0xb,%ah
c000100c:	b0 4c                	mov    $0x4c,%al
c000100e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001015:	bc 60 ca 00 c0       	mov    $0xc000ca60,%esp
c000101a:	66 c7 05 9c ce 00 c0 	movw   $0x0,0xc000ce9c
c0001021:	00 00 
c0001023:	0f 01 05 08 ee 00 c0 	sgdtl  0xc000ee08
c000102a:	e8 a1 5a 00 00       	call   c0006ad0 <ReloadGDT>
c000102f:	0f 01 15 08 ee 00 c0 	lgdtl  0xc000ee08
c0001036:	0f 01 1d 88 ce 00 c0 	lidtl  0xc000ce88
c000103d:	ea 44 10 00 c0 08 00 	ljmp   $0x8,$0xc0001044

c0001044 <csinit>:
c0001044:	31 c0                	xor    %eax,%eax
c0001046:	66 b8 40 00          	mov    $0x40,%ax
c000104a:	0f 00 d8             	ltr    %ax
c000104d:	e9 e7 0b 00 00       	jmp    c0001c39 <kernel_main>
c0001052:	f4                   	hlt    
c0001053:	eb fe                	jmp    c0001053 <csinit+0xf>
c0001055:	fb                   	sti    
c0001056:	b4 0b                	mov    $0xb,%ah
c0001058:	b0 4d                	mov    $0x4d,%al
c000105a:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001061:	eb fe                	jmp    c0001061 <csinit+0x1d>
c0001063:	f4                   	hlt    
c0001064:	6a 00                	push   $0x0
c0001066:	9d                   	popf   
c0001067:	eb fe                	jmp    c0001067 <csinit+0x23>
c0001069:	e8 68 0a 00 00       	call   c0001ad6 <test>
c000106e:	6a 01                	push   $0x1
c0001070:	6a 02                	push   $0x2
c0001072:	6a 03                	push   $0x3
c0001074:	f4                   	hlt    
c0001075:	66 90                	xchg   %ax,%ax
c0001077:	66 90                	xchg   %ax,%ax
c0001079:	66 90                	xchg   %ax,%ax
c000107b:	66 90                	xchg   %ax,%ax
c000107d:	66 90                	xchg   %ax,%ax
c000107f:	90                   	nop

c0001080 <InterruptTest>:
c0001080:	b4 0d                	mov    $0xd,%ah
c0001082:	b0 54                	mov    $0x54,%al
c0001084:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
c000108b:	c3                   	ret    

c000108c <disp_str>:
c000108c:	55                   	push   %ebp
c000108d:	89 e5                	mov    %esp,%ebp
c000108f:	b4 0d                	mov    $0xd,%ah
c0001091:	8b 75 08             	mov    0x8(%ebp),%esi
c0001094:	8b 3d 9c ce 00 c0    	mov    0xc000ce9c,%edi

c000109a <disp_str.1>:
c000109a:	ac                   	lods   %ds:(%esi),%al
c000109b:	84 c0                	test   %al,%al
c000109d:	74 1e                	je     c00010bd <disp_str.4>
c000109f:	3c 0a                	cmp    $0xa,%al
c00010a1:	75 11                	jne    c00010b4 <disp_str.3>
c00010a3:	50                   	push   %eax
c00010a4:	89 f8                	mov    %edi,%eax
c00010a6:	b3 a0                	mov    $0xa0,%bl
c00010a8:	f6 f3                	div    %bl
c00010aa:	40                   	inc    %eax
c00010ab:	b3 a0                	mov    $0xa0,%bl
c00010ad:	f6 e3                	mul    %bl
c00010af:	89 c7                	mov    %eax,%edi
c00010b1:	58                   	pop    %eax
c00010b2:	eb e6                	jmp    c000109a <disp_str.1>

c00010b4 <disp_str.3>:
c00010b4:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00010b8:	83 c7 02             	add    $0x2,%edi
c00010bb:	eb dd                	jmp    c000109a <disp_str.1>

c00010bd <disp_str.4>:
c00010bd:	89 3d 9c ce 00 c0    	mov    %edi,0xc000ce9c
c00010c3:	89 ec                	mov    %ebp,%esp
c00010c5:	5d                   	pop    %ebp
c00010c6:	c3                   	ret    

c00010c7 <disp_str_colour>:
c00010c7:	55                   	push   %ebp
c00010c8:	89 e5                	mov    %esp,%ebp
c00010ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00010cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00010d0:	8b 3d 9c ce 00 c0    	mov    0xc000ce9c,%edi

c00010d6 <disp_str_colour.1>:
c00010d6:	ac                   	lods   %ds:(%esi),%al
c00010d7:	84 c0                	test   %al,%al
c00010d9:	74 1e                	je     c00010f9 <disp_str_colour.4>
c00010db:	3c 0a                	cmp    $0xa,%al
c00010dd:	75 11                	jne    c00010f0 <disp_str_colour.3>
c00010df:	50                   	push   %eax
c00010e0:	89 f8                	mov    %edi,%eax
c00010e2:	b3 a0                	mov    $0xa0,%bl
c00010e4:	f6 f3                	div    %bl
c00010e6:	40                   	inc    %eax
c00010e7:	b3 a0                	mov    $0xa0,%bl
c00010e9:	f6 e3                	mul    %bl
c00010eb:	89 c7                	mov    %eax,%edi
c00010ed:	58                   	pop    %eax
c00010ee:	eb e6                	jmp    c00010d6 <disp_str_colour.1>

c00010f0 <disp_str_colour.3>:
c00010f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00010f4:	83 c7 02             	add    $0x2,%edi
c00010f7:	eb dd                	jmp    c00010d6 <disp_str_colour.1>

c00010f9 <disp_str_colour.4>:
c00010f9:	89 3d 9c ce 00 c0    	mov    %edi,0xc000ce9c
c00010ff:	89 ec                	mov    %ebp,%esp
c0001101:	5d                   	pop    %ebp
c0001102:	c3                   	ret    

c0001103 <divide_zero_fault>:
c0001103:	6a ff                	push   $0xffffffff
c0001105:	6a 00                	push   $0x0
c0001107:	eb 58                	jmp    c0001161 <exception>

c0001109 <single_step_fault>:
c0001109:	6a ff                	push   $0xffffffff
c000110b:	6a 01                	push   $0x1
c000110d:	eb 52                	jmp    c0001161 <exception>

c000110f <non_maskable_interrupt>:
c000110f:	6a ff                	push   $0xffffffff
c0001111:	6a 02                	push   $0x2
c0001113:	eb 4c                	jmp    c0001161 <exception>

c0001115 <breakpoint_trap>:
c0001115:	6a ff                	push   $0xffffffff
c0001117:	6a 03                	push   $0x3
c0001119:	eb 46                	jmp    c0001161 <exception>

c000111b <overflow_trap>:
c000111b:	6a ff                	push   $0xffffffff
c000111d:	6a 04                	push   $0x4
c000111f:	eb 40                	jmp    c0001161 <exception>

c0001121 <bound_range_exceeded_fault>:
c0001121:	6a ff                	push   $0xffffffff
c0001123:	6a 05                	push   $0x5
c0001125:	eb 3a                	jmp    c0001161 <exception>

c0001127 <invalid_opcode_fault>:
c0001127:	6a ff                	push   $0xffffffff
c0001129:	6a 06                	push   $0x6
c000112b:	eb 34                	jmp    c0001161 <exception>

c000112d <coprocessor_not_available_fault>:
c000112d:	6a ff                	push   $0xffffffff
c000112f:	6a 07                	push   $0x7
c0001131:	eb 2e                	jmp    c0001161 <exception>

c0001133 <double_fault_exception_abort>:
c0001133:	6a 08                	push   $0x8
c0001135:	eb 2a                	jmp    c0001161 <exception>

c0001137 <coprocessor_segment_overrun>:
c0001137:	6a ff                	push   $0xffffffff
c0001139:	6a 09                	push   $0x9
c000113b:	eb 24                	jmp    c0001161 <exception>

c000113d <invalid_task_state_segment_fault>:
c000113d:	6a 0a                	push   $0xa
c000113f:	eb 20                	jmp    c0001161 <exception>

c0001141 <segment_not_present_fault>:
c0001141:	6a 0b                	push   $0xb
c0001143:	eb 1c                	jmp    c0001161 <exception>

c0001145 <stack_exception_fault>:
c0001145:	6a 0c                	push   $0xc
c0001147:	eb 18                	jmp    c0001161 <exception>

c0001149 <general_protection_exception_fault>:
c0001149:	6a 0d                	push   $0xd
c000114b:	eb 14                	jmp    c0001161 <exception>

c000114d <page_fault>:
c000114d:	6a 0e                	push   $0xe
c000114f:	eb 10                	jmp    c0001161 <exception>

c0001151 <coprocessor_error_fault>:
c0001151:	6a ff                	push   $0xffffffff
c0001153:	6a 10                	push   $0x10
c0001155:	eb 0a                	jmp    c0001161 <exception>

c0001157 <align_check_fault>:
c0001157:	6a 11                	push   $0x11
c0001159:	eb 06                	jmp    c0001161 <exception>

c000115b <simd_float_exception_fault>:
c000115b:	6a ff                	push   $0xffffffff
c000115d:	6a 12                	push   $0x12
c000115f:	eb 00                	jmp    c0001161 <exception>

c0001161 <exception>:
c0001161:	e8 6e 06 00 00       	call   c00017d4 <exception_handler>
c0001166:	83 c4 08             	add    $0x8,%esp
c0001169:	f4                   	hlt    

c000116a <hwint0005>:
c000116a:	cf                   	iret   

c000116b <hwint0>:
c000116b:	60                   	pusha  
c000116c:	1e                   	push   %ds
c000116d:	06                   	push   %es
c000116e:	0f a0                	push   %fs
c0001170:	0f a8                	push   %gs
c0001172:	66 8c d2             	mov    %ss,%dx
c0001175:	8e da                	mov    %edx,%ds
c0001177:	8e c2                	mov    %edx,%es
c0001179:	8e e2                	mov    %edx,%fs
c000117b:	b0 f9                	mov    $0xf9,%al
c000117d:	e6 21                	out    %al,$0x21
c000117f:	b0 20                	mov    $0x20,%al
c0001181:	e6 20                	out    %al,$0x20
c0001183:	ff 05 a0 ce 00 c0    	incl   0xc000cea0
c0001189:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c0001190:	75 05                	jne    c0001197 <hwint0.2>

c0001192 <hwint0.1>:
c0001192:	bc 60 ce 00 c0       	mov    $0xc000ce60,%esp

c0001197 <hwint0.2>:
c0001197:	fb                   	sti    
c0001198:	e8 de 55 00 00       	call   c000677b <clock_handler>
c000119d:	b0 f8                	mov    $0xf8,%al
c000119f:	e6 21                	out    %al,$0x21
c00011a1:	fa                   	cli    
c00011a2:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c00011a9:	0f 85 eb 00 00 00    	jne    c000129a <reenter_restore>
c00011af:	e9 e6 00 00 00       	jmp    c000129a <reenter_restore>

c00011b4 <hwint1>:
c00011b4:	60                   	pusha  
c00011b5:	1e                   	push   %ds
c00011b6:	06                   	push   %es
c00011b7:	0f a0                	push   %fs
c00011b9:	0f a8                	push   %gs
c00011bb:	66 8c d2             	mov    %ss,%dx
c00011be:	8e da                	mov    %edx,%ds
c00011c0:	8e c2                	mov    %edx,%es
c00011c2:	8e e2                	mov    %edx,%fs
c00011c4:	b0 fa                	mov    $0xfa,%al
c00011c6:	e6 21                	out    %al,$0x21
c00011c8:	b0 20                	mov    $0x20,%al
c00011ca:	e6 20                	out    %al,$0x20
c00011cc:	ff 05 a0 ce 00 c0    	incl   0xc000cea0
c00011d2:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c00011d9:	75 05                	jne    c00011e0 <hwint1.2>

c00011db <hwint1.1>:
c00011db:	bc 60 ce 00 c0       	mov    $0xc000ce60,%esp

c00011e0 <hwint1.2>:
c00011e0:	fb                   	sti    
c00011e1:	e8 ad 63 00 00       	call   c0007593 <keyboard_handler>
c00011e6:	b0 f8                	mov    $0xf8,%al
c00011e8:	e6 21                	out    %al,$0x21
c00011ea:	fa                   	cli    
c00011eb:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c00011f2:	0f 85 a2 00 00 00    	jne    c000129a <reenter_restore>
c00011f8:	e9 9d 00 00 00       	jmp    c000129a <reenter_restore>

c00011fd <hwint14>:
c00011fd:	60                   	pusha  
c00011fe:	1e                   	push   %ds
c00011ff:	06                   	push   %es
c0001200:	0f a0                	push   %fs
c0001202:	0f a8                	push   %gs
c0001204:	66 8c d2             	mov    %ss,%dx
c0001207:	8e da                	mov    %edx,%ds
c0001209:	8e c2                	mov    %edx,%es
c000120b:	8e e2                	mov    %edx,%fs
c000120d:	b0 ff                	mov    $0xff,%al
c000120f:	e6 a1                	out    %al,$0xa1
c0001211:	b0 20                	mov    $0x20,%al
c0001213:	e6 20                	out    %al,$0x20
c0001215:	90                   	nop
c0001216:	e6 a0                	out    %al,$0xa0
c0001218:	ff 05 a0 ce 00 c0    	incl   0xc000cea0
c000121e:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c0001225:	75 05                	jne    c000122c <hwint14.2>

c0001227 <hwint14.1>:
c0001227:	bc 60 ce 00 c0       	mov    $0xc000ce60,%esp

c000122c <hwint14.2>:
c000122c:	fb                   	sti    
c000122d:	e8 9d 33 00 00       	call   c00045cf <hd_handler>
c0001232:	b0 bf                	mov    $0xbf,%al
c0001234:	e6 a1                	out    %al,$0xa1
c0001236:	fa                   	cli    
c0001237:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c000123e:	75 5a                	jne    c000129a <reenter_restore>
c0001240:	eb 58                	jmp    c000129a <reenter_restore>

c0001242 <sys_call>:
c0001242:	60                   	pusha  
c0001243:	1e                   	push   %ds
c0001244:	06                   	push   %es
c0001245:	0f a0                	push   %fs
c0001247:	0f a8                	push   %gs
c0001249:	89 e6                	mov    %esp,%esi
c000124b:	66 8c d2             	mov    %ss,%dx
c000124e:	8e da                	mov    %edx,%ds
c0001250:	8e c2                	mov    %edx,%es
c0001252:	8e e2                	mov    %edx,%fs
c0001254:	ff 05 a0 ce 00 c0    	incl   0xc000cea0
c000125a:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c0001261:	75 05                	jne    c0001268 <sys_call.2>

c0001263 <sys_call.1>:
c0001263:	bc 60 ce 00 c0       	mov    $0xc000ce60,%esp

c0001268 <sys_call.2>:
c0001268:	fb                   	sti    
c0001269:	56                   	push   %esi
c000126a:	ff 35 c0 d2 00 c0    	pushl  0xc000d2c0
c0001270:	53                   	push   %ebx
c0001271:	51                   	push   %ecx
c0001272:	ff 14 85 44 c0 00 c0 	call   *-0x3fff3fbc(,%eax,4)
c0001279:	83 c4 0c             	add    $0xc,%esp
c000127c:	5e                   	pop    %esi
c000127d:	89 46 2c             	mov    %eax,0x2c(%esi)
c0001280:	fa                   	cli    
c0001281:	83 3d a0 ce 00 c0 00 	cmpl   $0x0,0xc000cea0
c0001288:	75 10                	jne    c000129a <reenter_restore>
c000128a:	eb 0e                	jmp    c000129a <reenter_restore>

c000128c <restart>:
c000128c:	ff 0d a0 ce 00 c0    	decl   0xc000cea0

c0001292 <restart.notLoadLDT>:
c0001292:	0f a9                	pop    %gs
c0001294:	0f a1                	pop    %fs
c0001296:	07                   	pop    %es
c0001297:	1f                   	pop    %ds
c0001298:	61                   	popa   
c0001299:	cf                   	iret   

c000129a <reenter_restore>:
c000129a:	ff 0d a0 ce 00 c0    	decl   0xc000cea0
c00012a0:	0f a9                	pop    %gs
c00012a2:	0f a1                	pop    %fs
c00012a4:	07                   	pop    %es
c00012a5:	1f                   	pop    %ds
c00012a6:	61                   	popa   
c00012a7:	cf                   	iret   

c00012a8 <in_byte>:
c00012a8:	31 d2                	xor    %edx,%edx
c00012aa:	8b 54 24 04          	mov    0x4(%esp),%edx
c00012ae:	31 c0                	xor    %eax,%eax
c00012b0:	ec                   	in     (%dx),%al
c00012b1:	90                   	nop
c00012b2:	90                   	nop
c00012b3:	c3                   	ret    

c00012b4 <out_byte>:
c00012b4:	31 d2                	xor    %edx,%edx
c00012b6:	31 c0                	xor    %eax,%eax
c00012b8:	8b 54 24 04          	mov    0x4(%esp),%edx
c00012bc:	8a 44 24 08          	mov    0x8(%esp),%al
c00012c0:	ee                   	out    %al,(%dx)
c00012c1:	90                   	nop
c00012c2:	90                   	nop
c00012c3:	c3                   	ret    

c00012c4 <in_byte2>:
c00012c4:	55                   	push   %ebp
c00012c5:	89 e5                	mov    %esp,%ebp
c00012c7:	52                   	push   %edx
c00012c8:	31 d2                	xor    %edx,%edx
c00012ca:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00012ce:	31 c0                	xor    %eax,%eax
c00012d0:	ec                   	in     (%dx),%al
c00012d1:	90                   	nop
c00012d2:	90                   	nop
c00012d3:	5b                   	pop    %ebx
c00012d4:	5d                   	pop    %ebp
c00012d5:	c3                   	ret    

c00012d6 <disable_int>:
c00012d6:	fa                   	cli    
c00012d7:	c3                   	ret    

c00012d8 <enable_int>:
c00012d8:	fb                   	sti    
c00012d9:	c3                   	ret    

c00012da <check_tss_esp0>:
c00012da:	55                   	push   %ebp
c00012db:	89 e5                	mov    %esp,%ebp
c00012dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00012e0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00012e3:	83 c0 44             	add    $0x44,%eax
c00012e6:	8b 15 84 ed 00 c0    	mov    0xc000ed84,%edx
c00012ec:	39 d0                	cmp    %edx,%eax
c00012ee:	74 7c                	je     c000136c <check_tss_esp0.2>

c00012f0 <check_tss_esp0.1>:
c00012f0:	50                   	push   %eax
c00012f1:	52                   	push   %edx
c00012f2:	68 10 c0 00 c0       	push   $0xc000c010
c00012f7:	e8 90 fd ff ff       	call   c000108c <disp_str>
c00012fc:	83 c4 04             	add    $0x4,%esp
c00012ff:	5a                   	pop    %edx
c0001300:	58                   	pop    %eax
c0001301:	52                   	push   %edx
c0001302:	50                   	push   %eax
c0001303:	53                   	push   %ebx
c0001304:	e8 3d 03 00 00       	call   c0001646 <disp_int>
c0001309:	83 c4 04             	add    $0x4,%esp
c000130c:	58                   	pop    %eax
c000130d:	5a                   	pop    %edx
c000130e:	52                   	push   %edx
c000130f:	50                   	push   %eax
c0001310:	e8 31 03 00 00       	call   c0001646 <disp_int>
c0001315:	58                   	pop    %eax
c0001316:	5a                   	pop    %edx
c0001317:	52                   	push   %edx
c0001318:	50                   	push   %eax
c0001319:	ff 35 a0 ce 00 c0    	pushl  0xc000cea0
c000131f:	e8 22 03 00 00       	call   c0001646 <disp_int>
c0001324:	83 c4 04             	add    $0x4,%esp
c0001327:	58                   	pop    %eax
c0001328:	5a                   	pop    %edx
c0001329:	52                   	push   %edx
c000132a:	50                   	push   %eax
c000132b:	ff 72 ec             	pushl  -0x14(%edx)
c000132e:	e8 13 03 00 00       	call   c0001646 <disp_int>
c0001333:	83 c4 04             	add    $0x4,%esp
c0001336:	58                   	pop    %eax
c0001337:	5a                   	pop    %edx
c0001338:	52                   	push   %edx
c0001339:	50                   	push   %eax
c000133a:	ff 70 ec             	pushl  -0x14(%eax)
c000133d:	e8 04 03 00 00       	call   c0001646 <disp_int>
c0001342:	83 c4 04             	add    $0x4,%esp
c0001345:	58                   	pop    %eax
c0001346:	5a                   	pop    %edx
c0001347:	52                   	push   %edx
c0001348:	50                   	push   %eax
c0001349:	ff 35 c0 d2 00 c0    	pushl  0xc000d2c0
c000134f:	e8 f2 02 00 00       	call   c0001646 <disp_int>
c0001354:	83 c4 04             	add    $0x4,%esp
c0001357:	58                   	pop    %eax
c0001358:	5a                   	pop    %edx
c0001359:	52                   	push   %edx
c000135a:	50                   	push   %eax
c000135b:	68 60 ce 00 c0       	push   $0xc000ce60
c0001360:	e8 e1 02 00 00       	call   c0001646 <disp_int>
c0001365:	83 c4 04             	add    $0x4,%esp
c0001368:	58                   	pop    %eax
c0001369:	5a                   	pop    %edx
c000136a:	5d                   	pop    %ebp
c000136b:	c3                   	ret    

c000136c <check_tss_esp0.2>:
c000136c:	5d                   	pop    %ebp
c000136d:	c3                   	ret    

c000136e <enable_8259A_casecade_irq>:
c000136e:	9c                   	pushf  
c000136f:	fa                   	cli    
c0001370:	e4 21                	in     $0x21,%al
c0001372:	24 fb                	and    $0xfb,%al
c0001374:	e6 21                	out    %al,$0x21
c0001376:	9d                   	popf   
c0001377:	c3                   	ret    

c0001378 <disable_8259A_casecade_irq>:
c0001378:	9c                   	pushf  
c0001379:	fa                   	cli    
c000137a:	e4 21                	in     $0x21,%al
c000137c:	0c 04                	or     $0x4,%al
c000137e:	e6 21                	out    %al,$0x21
c0001380:	9c                   	pushf  
c0001381:	c3                   	ret    

c0001382 <enable_8259A_slave_winchester_irq>:
c0001382:	9c                   	pushf  
c0001383:	fa                   	cli    
c0001384:	e4 a1                	in     $0xa1,%al
c0001386:	24 bf                	and    $0xbf,%al
c0001388:	e6 a1                	out    %al,$0xa1
c000138a:	9d                   	popf   
c000138b:	c3                   	ret    

c000138c <disable_8259A_slave_winchester_irq>:
c000138c:	9c                   	pushf  
c000138d:	fa                   	cli    
c000138e:	e4 a1                	in     $0xa1,%al
c0001390:	0c 40                	or     $0x40,%al
c0001392:	e6 a1                	out    %al,$0xa1
c0001394:	9d                   	popf   
c0001395:	c3                   	ret    

c0001396 <untar>:
c0001396:	55                   	push   %ebp
c0001397:	89 e5                	mov    %esp,%ebp
c0001399:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c000139f:	83 ec 08             	sub    $0x8,%esp
c00013a2:	6a 00                	push   $0x0
c00013a4:	ff 75 08             	pushl  0x8(%ebp)
c00013a7:	e8 ee 65 00 00       	call   c000799a <open>
c00013ac:	83 c4 10             	add    $0x10,%esp
c00013af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00013b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00013b9:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00013c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00013c7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00013ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00013d2:	7e 58                	jle    c000142c <untar+0x96>
c00013d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00013d7:	05 ff 01 00 00       	add    $0x1ff,%eax
c00013dc:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00013e2:	85 c0                	test   %eax,%eax
c00013e4:	0f 48 c2             	cmovs  %edx,%eax
c00013e7:	c1 f8 09             	sar    $0x9,%eax
c00013ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00013ed:	83 ec 04             	sub    $0x4,%esp
c00013f0:	68 00 20 00 00       	push   $0x2000
c00013f5:	6a 00                	push   $0x0
c00013f7:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00013fd:	50                   	push   %eax
c00013fe:	e8 8d 85 00 00       	call   c0009990 <Memset>
c0001403:	83 c4 10             	add    $0x10,%esp
c0001406:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0001409:	c1 e0 09             	shl    $0x9,%eax
c000140c:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000140f:	83 ec 04             	sub    $0x4,%esp
c0001412:	50                   	push   %eax
c0001413:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001419:	50                   	push   %eax
c000141a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000141d:	e8 cd 65 00 00       	call   c00079ef <read>
c0001422:	83 c4 10             	add    $0x10,%esp
c0001425:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000142c:	83 ec 04             	sub    $0x4,%esp
c000142f:	68 00 20 00 00       	push   $0x2000
c0001434:	6a 00                	push   $0x0
c0001436:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000143c:	50                   	push   %eax
c000143d:	e8 4e 85 00 00       	call   c0009990 <Memset>
c0001442:	83 c4 10             	add    $0x10,%esp
c0001445:	83 ec 04             	sub    $0x4,%esp
c0001448:	68 00 02 00 00       	push   $0x200
c000144d:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001453:	50                   	push   %eax
c0001454:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001457:	e8 93 65 00 00       	call   c00079ef <read>
c000145c:	83 c4 10             	add    $0x10,%esp
c000145f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0001462:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0001466:	0f 84 1f 01 00 00    	je     c000158b <untar+0x1f5>
c000146c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000146f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0001472:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0001479:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000147f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0001482:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0001485:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0001488:	83 ec 08             	sub    $0x8,%esp
c000148b:	6a 07                	push   $0x7
c000148d:	ff 75 cc             	pushl  -0x34(%ebp)
c0001490:	e8 05 65 00 00       	call   c000799a <open>
c0001495:	83 c4 10             	add    $0x10,%esp
c0001498:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000149b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00014a2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00014a5:	83 c0 7c             	add    $0x7c,%eax
c00014a8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00014ab:	83 ec 0c             	sub    $0xc,%esp
c00014ae:	ff 75 cc             	pushl  -0x34(%ebp)
c00014b1:	e8 13 85 00 00       	call   c00099c9 <Strlen>
c00014b6:	83 c4 10             	add    $0x10,%esp
c00014b9:	85 c0                	test   %eax,%eax
c00014bb:	75 16                	jne    c00014d3 <untar+0x13d>
c00014bd:	83 ec 0c             	sub    $0xc,%esp
c00014c0:	ff 75 c4             	pushl  -0x3c(%ebp)
c00014c3:	e8 01 85 00 00       	call   c00099c9 <Strlen>
c00014c8:	83 c4 10             	add    $0x10,%esp
c00014cb:	85 c0                	test   %eax,%eax
c00014cd:	0f 84 bb 00 00 00    	je     c000158e <untar+0x1f8>
c00014d3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00014d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00014d9:	eb 1f                	jmp    c00014fa <untar+0x164>
c00014db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00014de:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00014e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00014e8:	0f b6 00             	movzbl (%eax),%eax
c00014eb:	0f be c0             	movsbl %al,%eax
c00014ee:	83 e8 30             	sub    $0x30,%eax
c00014f1:	01 d0                	add    %edx,%eax
c00014f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00014f6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00014fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00014fd:	0f b6 00             	movzbl (%eax),%eax
c0001500:	84 c0                	test   %al,%al
c0001502:	75 d7                	jne    c00014db <untar+0x145>
c0001504:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001507:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000150a:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0001511:	eb 5f                	jmp    c0001572 <untar+0x1dc>
c0001513:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001516:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0001519:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c000151d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0001520:	83 ec 04             	sub    $0x4,%esp
c0001523:	68 00 02 00 00       	push   $0x200
c0001528:	6a 00                	push   $0x0
c000152a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001530:	50                   	push   %eax
c0001531:	e8 5a 84 00 00       	call   c0009990 <Memset>
c0001536:	83 c4 10             	add    $0x10,%esp
c0001539:	83 ec 04             	sub    $0x4,%esp
c000153c:	ff 75 bc             	pushl  -0x44(%ebp)
c000153f:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001545:	50                   	push   %eax
c0001546:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001549:	e8 a1 64 00 00       	call   c00079ef <read>
c000154e:	83 c4 10             	add    $0x10,%esp
c0001551:	01 45 f4             	add    %eax,-0xc(%ebp)
c0001554:	83 ec 04             	sub    $0x4,%esp
c0001557:	ff 75 bc             	pushl  -0x44(%ebp)
c000155a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0001560:	50                   	push   %eax
c0001561:	ff 75 c8             	pushl  -0x38(%ebp)
c0001564:	e8 bd 64 00 00       	call   c0007a26 <write>
c0001569:	83 c4 10             	add    $0x10,%esp
c000156c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000156f:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0001572:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0001576:	75 9b                	jne    c0001513 <untar+0x17d>
c0001578:	83 ec 0c             	sub    $0xc,%esp
c000157b:	ff 75 c8             	pushl  -0x38(%ebp)
c000157e:	e8 da 64 00 00       	call   c0007a5d <close>
c0001583:	83 c4 10             	add    $0x10,%esp
c0001586:	e9 43 fe ff ff       	jmp    c00013ce <untar+0x38>
c000158b:	90                   	nop
c000158c:	eb 01                	jmp    c000158f <untar+0x1f9>
c000158e:	90                   	nop
c000158f:	83 ec 0c             	sub    $0xc,%esp
c0001592:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001595:	e8 c3 64 00 00       	call   c0007a5d <close>
c000159a:	83 c4 10             	add    $0x10,%esp
c000159d:	90                   	nop
c000159e:	c9                   	leave  
c000159f:	c3                   	ret    

c00015a0 <atoi>:
c00015a0:	55                   	push   %ebp
c00015a1:	89 e5                	mov    %esp,%ebp
c00015a3:	83 ec 10             	sub    $0x10,%esp
c00015a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00015a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00015ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00015af:	8d 50 01             	lea    0x1(%eax),%edx
c00015b2:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00015b5:	c6 00 30             	movb   $0x30,(%eax)
c00015b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00015bb:	8d 50 01             	lea    0x1(%eax),%edx
c00015be:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00015c1:	c6 00 78             	movb   $0x78,(%eax)
c00015c4:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00015c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00015cc:	75 0e                	jne    c00015dc <atoi+0x3c>
c00015ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00015d1:	8d 50 01             	lea    0x1(%eax),%edx
c00015d4:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00015d7:	c6 00 30             	movb   $0x30,(%eax)
c00015da:	eb 61                	jmp    c000163d <atoi+0x9d>
c00015dc:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00015e3:	eb 52                	jmp    c0001637 <atoi+0x97>
c00015e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00015e8:	8b 55 0c             	mov    0xc(%ebp),%edx
c00015eb:	89 c1                	mov    %eax,%ecx
c00015ed:	d3 fa                	sar    %cl,%edx
c00015ef:	89 d0                	mov    %edx,%eax
c00015f1:	83 e0 0f             	and    $0xf,%eax
c00015f4:	88 45 fb             	mov    %al,-0x5(%ebp)
c00015f7:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c00015fb:	75 06                	jne    c0001603 <atoi+0x63>
c00015fd:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0001601:	74 2f                	je     c0001632 <atoi+0x92>
c0001603:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0001607:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c000160b:	83 c0 30             	add    $0x30,%eax
c000160e:	88 45 fb             	mov    %al,-0x5(%ebp)
c0001611:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0001615:	7e 0a                	jle    c0001621 <atoi+0x81>
c0001617:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c000161b:	83 c0 07             	add    $0x7,%eax
c000161e:	88 45 fb             	mov    %al,-0x5(%ebp)
c0001621:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0001624:	8d 50 01             	lea    0x1(%eax),%edx
c0001627:	89 55 fc             	mov    %edx,-0x4(%ebp)
c000162a:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c000162e:	88 10                	mov    %dl,(%eax)
c0001630:	eb 01                	jmp    c0001633 <atoi+0x93>
c0001632:	90                   	nop
c0001633:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0001637:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000163b:	79 a8                	jns    c00015e5 <atoi+0x45>
c000163d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0001640:	c6 00 00             	movb   $0x0,(%eax)
c0001643:	90                   	nop
c0001644:	c9                   	leave  
c0001645:	c3                   	ret    

c0001646 <disp_int>:
c0001646:	55                   	push   %ebp
c0001647:	89 e5                	mov    %esp,%ebp
c0001649:	83 ec 18             	sub    $0x18,%esp
c000164c:	ff 75 08             	pushl  0x8(%ebp)
c000164f:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0001652:	50                   	push   %eax
c0001653:	e8 48 ff ff ff       	call   c00015a0 <atoi>
c0001658:	83 c4 08             	add    $0x8,%esp
c000165b:	83 ec 08             	sub    $0x8,%esp
c000165e:	6a 0b                	push   $0xb
c0001660:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0001663:	50                   	push   %eax
c0001664:	e8 5e fa ff ff       	call   c00010c7 <disp_str_colour>
c0001669:	83 c4 10             	add    $0x10,%esp
c000166c:	90                   	nop
c000166d:	c9                   	leave  
c000166e:	c3                   	ret    

c000166f <do_page_fault>:
c000166f:	55                   	push   %ebp
c0001670:	89 e5                	mov    %esp,%ebp
c0001672:	83 ec 28             	sub    $0x28,%esp
c0001675:	0f 20 d0             	mov    %cr2,%eax
c0001678:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000167b:	83 ec 0c             	sub    $0xc,%esp
c000167e:	68 e0 8e 00 c0       	push   $0xc0008ee0
c0001683:	e8 04 fa ff ff       	call   c000108c <disp_str>
c0001688:	83 c4 10             	add    $0x10,%esp
c000168b:	83 ec 0c             	sub    $0xc,%esp
c000168e:	68 ef 8e 00 c0       	push   $0xc0008eef
c0001693:	e8 f4 f9 ff ff       	call   c000108c <disp_str>
c0001698:	83 c4 10             	add    $0x10,%esp
c000169b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000169e:	83 ec 0c             	sub    $0xc,%esp
c00016a1:	50                   	push   %eax
c00016a2:	e8 9f ff ff ff       	call   c0001646 <disp_int>
c00016a7:	83 c4 10             	add    $0x10,%esp
c00016aa:	83 ec 0c             	sub    $0xc,%esp
c00016ad:	68 f4 8e 00 c0       	push   $0xc0008ef4
c00016b2:	e8 d5 f9 ff ff       	call   c000108c <disp_str>
c00016b7:	83 c4 10             	add    $0x10,%esp
c00016ba:	83 ec 0c             	sub    $0xc,%esp
c00016bd:	ff 75 f4             	pushl  -0xc(%ebp)
c00016c0:	e8 18 73 00 00       	call   c00089dd <ptr_pde>
c00016c5:	83 c4 10             	add    $0x10,%esp
c00016c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00016cb:	83 ec 0c             	sub    $0xc,%esp
c00016ce:	ff 75 f4             	pushl  -0xc(%ebp)
c00016d1:	e8 d7 72 00 00       	call   c00089ad <ptr_pte>
c00016d6:	83 c4 10             	add    $0x10,%esp
c00016d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00016dc:	83 ec 0c             	sub    $0xc,%esp
c00016df:	68 f6 8e 00 c0       	push   $0xc0008ef6
c00016e4:	e8 a3 f9 ff ff       	call   c000108c <disp_str>
c00016e9:	83 c4 10             	add    $0x10,%esp
c00016ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00016ef:	83 ec 0c             	sub    $0xc,%esp
c00016f2:	50                   	push   %eax
c00016f3:	e8 4e ff ff ff       	call   c0001646 <disp_int>
c00016f8:	83 c4 10             	add    $0x10,%esp
c00016fb:	83 ec 0c             	sub    $0xc,%esp
c00016fe:	68 fb 8e 00 c0       	push   $0xc0008efb
c0001703:	e8 84 f9 ff ff       	call   c000108c <disp_str>
c0001708:	83 c4 10             	add    $0x10,%esp
c000170b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000170e:	8b 00                	mov    (%eax),%eax
c0001710:	83 ec 0c             	sub    $0xc,%esp
c0001713:	50                   	push   %eax
c0001714:	e8 2d ff ff ff       	call   c0001646 <disp_int>
c0001719:	83 c4 10             	add    $0x10,%esp
c000171c:	83 ec 0c             	sub    $0xc,%esp
c000171f:	68 f4 8e 00 c0       	push   $0xc0008ef4
c0001724:	e8 63 f9 ff ff       	call   c000108c <disp_str>
c0001729:	83 c4 10             	add    $0x10,%esp
c000172c:	83 ec 0c             	sub    $0xc,%esp
c000172f:	68 04 8f 00 c0       	push   $0xc0008f04
c0001734:	e8 53 f9 ff ff       	call   c000108c <disp_str>
c0001739:	83 c4 10             	add    $0x10,%esp
c000173c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000173f:	83 ec 0c             	sub    $0xc,%esp
c0001742:	50                   	push   %eax
c0001743:	e8 fe fe ff ff       	call   c0001646 <disp_int>
c0001748:	83 c4 10             	add    $0x10,%esp
c000174b:	83 ec 0c             	sub    $0xc,%esp
c000174e:	68 09 8f 00 c0       	push   $0xc0008f09
c0001753:	e8 34 f9 ff ff       	call   c000108c <disp_str>
c0001758:	83 c4 10             	add    $0x10,%esp
c000175b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000175e:	8b 00                	mov    (%eax),%eax
c0001760:	83 ec 0c             	sub    $0xc,%esp
c0001763:	50                   	push   %eax
c0001764:	e8 dd fe ff ff       	call   c0001646 <disp_int>
c0001769:	83 c4 10             	add    $0x10,%esp
c000176c:	83 ec 0c             	sub    $0xc,%esp
c000176f:	68 f4 8e 00 c0       	push   $0xc0008ef4
c0001774:	e8 13 f9 ff ff       	call   c000108c <disp_str>
c0001779:	83 c4 10             	add    $0x10,%esp
c000177c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000177f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0001784:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001787:	83 ec 0c             	sub    $0xc,%esp
c000178a:	6a 00                	push   $0x0
c000178c:	e8 01 71 00 00       	call   c0008892 <get_a_page>
c0001791:	83 c4 10             	add    $0x10,%esp
c0001794:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001797:	83 ec 08             	sub    $0x8,%esp
c000179a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000179d:	ff 75 e8             	pushl  -0x18(%ebp)
c00017a0:	e8 54 72 00 00       	call   c00089f9 <add_map_entry>
c00017a5:	83 c4 10             	add    $0x10,%esp
c00017a8:	c7 45 e0 00 00 10 00 	movl   $0x100000,-0x20(%ebp)
c00017af:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00017b2:	0f 22 d8             	mov    %eax,%cr3
c00017b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00017b8:	8b 00                	mov    (%eax),%eax
c00017ba:	83 e0 01             	and    $0x1,%eax
c00017bd:	85 c0                	test   %eax,%eax
c00017bf:	74 09                	je     c00017ca <do_page_fault+0x15b>
c00017c1:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
c00017c8:	eb 07                	jmp    c00017d1 <do_page_fault+0x162>
c00017ca:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00017d1:	90                   	nop
c00017d2:	c9                   	leave  
c00017d3:	c3                   	ret    

c00017d4 <exception_handler>:
c00017d4:	55                   	push   %ebp
c00017d5:	89 e5                	mov    %esp,%ebp
c00017d7:	57                   	push   %edi
c00017d8:	56                   	push   %esi
c00017d9:	53                   	push   %ebx
c00017da:	83 ec 6c             	sub    $0x6c,%esp
c00017dd:	8d 45 90             	lea    -0x70(%ebp),%eax
c00017e0:	bb 60 91 00 c0       	mov    $0xc0009160,%ebx
c00017e5:	ba 13 00 00 00       	mov    $0x13,%edx
c00017ea:	89 c7                	mov    %eax,%edi
c00017ec:	89 de                	mov    %ebx,%esi
c00017ee:	89 d1                	mov    %edx,%ecx
c00017f0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00017f2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00017f9:	eb 04                	jmp    c00017ff <exception_handler+0x2b>
c00017fb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00017ff:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0001806:	7e f3                	jle    c00017fb <exception_handler+0x27>
c0001808:	83 ec 0c             	sub    $0xc,%esp
c000180b:	68 12 8f 00 c0       	push   $0xc0008f12
c0001810:	e8 77 f8 ff ff       	call   c000108c <disp_str>
c0001815:	83 c4 10             	add    $0x10,%esp
c0001818:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000181f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001822:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0001826:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001829:	83 ec 0c             	sub    $0xc,%esp
c000182c:	ff 75 dc             	pushl  -0x24(%ebp)
c000182f:	e8 58 f8 ff ff       	call   c000108c <disp_str>
c0001834:	83 c4 10             	add    $0x10,%esp
c0001837:	83 ec 0c             	sub    $0xc,%esp
c000183a:	68 20 8f 00 c0       	push   $0xc0008f20
c000183f:	e8 48 f8 ff ff       	call   c000108c <disp_str>
c0001844:	83 c4 10             	add    $0x10,%esp
c0001847:	83 ec 0c             	sub    $0xc,%esp
c000184a:	68 23 8f 00 c0       	push   $0xc0008f23
c000184f:	e8 38 f8 ff ff       	call   c000108c <disp_str>
c0001854:	83 c4 10             	add    $0x10,%esp
c0001857:	8b 45 08             	mov    0x8(%ebp),%eax
c000185a:	83 ec 0c             	sub    $0xc,%esp
c000185d:	50                   	push   %eax
c000185e:	e8 e3 fd ff ff       	call   c0001646 <disp_int>
c0001863:	83 c4 10             	add    $0x10,%esp
c0001866:	83 ec 0c             	sub    $0xc,%esp
c0001869:	68 20 8f 00 c0       	push   $0xc0008f20
c000186e:	e8 19 f8 ff ff       	call   c000108c <disp_str>
c0001873:	83 c4 10             	add    $0x10,%esp
c0001876:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c000187a:	74 2f                	je     c00018ab <exception_handler+0xd7>
c000187c:	83 ec 0c             	sub    $0xc,%esp
c000187f:	68 2b 8f 00 c0       	push   $0xc0008f2b
c0001884:	e8 03 f8 ff ff       	call   c000108c <disp_str>
c0001889:	83 c4 10             	add    $0x10,%esp
c000188c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000188f:	83 ec 0c             	sub    $0xc,%esp
c0001892:	50                   	push   %eax
c0001893:	e8 ae fd ff ff       	call   c0001646 <disp_int>
c0001898:	83 c4 10             	add    $0x10,%esp
c000189b:	83 ec 0c             	sub    $0xc,%esp
c000189e:	68 20 8f 00 c0       	push   $0xc0008f20
c00018a3:	e8 e4 f7 ff ff       	call   c000108c <disp_str>
c00018a8:	83 c4 10             	add    $0x10,%esp
c00018ab:	83 ec 0c             	sub    $0xc,%esp
c00018ae:	68 35 8f 00 c0       	push   $0xc0008f35
c00018b3:	e8 d4 f7 ff ff       	call   c000108c <disp_str>
c00018b8:	83 c4 10             	add    $0x10,%esp
c00018bb:	83 ec 0c             	sub    $0xc,%esp
c00018be:	ff 75 14             	pushl  0x14(%ebp)
c00018c1:	e8 80 fd ff ff       	call   c0001646 <disp_int>
c00018c6:	83 c4 10             	add    $0x10,%esp
c00018c9:	83 ec 0c             	sub    $0xc,%esp
c00018cc:	68 20 8f 00 c0       	push   $0xc0008f20
c00018d1:	e8 b6 f7 ff ff       	call   c000108c <disp_str>
c00018d6:	83 c4 10             	add    $0x10,%esp
c00018d9:	83 ec 0c             	sub    $0xc,%esp
c00018dc:	68 39 8f 00 c0       	push   $0xc0008f39
c00018e1:	e8 a6 f7 ff ff       	call   c000108c <disp_str>
c00018e6:	83 c4 10             	add    $0x10,%esp
c00018e9:	8b 45 10             	mov    0x10(%ebp),%eax
c00018ec:	83 ec 0c             	sub    $0xc,%esp
c00018ef:	50                   	push   %eax
c00018f0:	e8 51 fd ff ff       	call   c0001646 <disp_int>
c00018f5:	83 c4 10             	add    $0x10,%esp
c00018f8:	83 ec 0c             	sub    $0xc,%esp
c00018fb:	68 20 8f 00 c0       	push   $0xc0008f20
c0001900:	e8 87 f7 ff ff       	call   c000108c <disp_str>
c0001905:	83 c4 10             	add    $0x10,%esp
c0001908:	83 ec 0c             	sub    $0xc,%esp
c000190b:	68 3e 8f 00 c0       	push   $0xc0008f3e
c0001910:	e8 77 f7 ff ff       	call   c000108c <disp_str>
c0001915:	83 c4 10             	add    $0x10,%esp
c0001918:	83 ec 0c             	sub    $0xc,%esp
c000191b:	ff 75 18             	pushl  0x18(%ebp)
c000191e:	e8 23 fd ff ff       	call   c0001646 <disp_int>
c0001923:	83 c4 10             	add    $0x10,%esp
c0001926:	83 ec 0c             	sub    $0xc,%esp
c0001929:	68 20 8f 00 c0       	push   $0xc0008f20
c000192e:	e8 59 f7 ff ff       	call   c000108c <disp_str>
c0001933:	83 c4 10             	add    $0x10,%esp
c0001936:	83 ec 0c             	sub    $0xc,%esp
c0001939:	68 48 8f 00 c0       	push   $0xc0008f48
c000193e:	e8 49 f7 ff ff       	call   c000108c <disp_str>
c0001943:	83 c4 10             	add    $0x10,%esp
c0001946:	e8 24 fd ff ff       	call   c000166f <do_page_fault>
c000194b:	90                   	nop
c000194c:	90                   	nop
c000194d:	90                   	nop
c000194e:	8b 45 10             	mov    0x10(%ebp),%eax
c0001951:	89 45 04             	mov    %eax,0x4(%ebp)
c0001954:	fb                   	sti    
c0001955:	66 87 db             	xchg   %bx,%bx
c0001958:	90                   	nop
c0001959:	8d 65 f4             	lea    -0xc(%ebp),%esp
c000195c:	5b                   	pop    %ebx
c000195d:	5e                   	pop    %esi
c000195e:	5f                   	pop    %edi
c000195f:	5d                   	pop    %ebp
c0001960:	c3                   	ret    

c0001961 <init_internal_interrupt>:
c0001961:	55                   	push   %ebp
c0001962:	89 e5                	mov    %esp,%ebp
c0001964:	83 ec 08             	sub    $0x8,%esp
c0001967:	6a 0e                	push   $0xe
c0001969:	6a 08                	push   $0x8
c000196b:	68 03 11 00 c0       	push   $0xc0001103
c0001970:	6a 00                	push   $0x0
c0001972:	e8 fd 50 00 00       	call   c0006a74 <InitInterruptDesc>
c0001977:	83 c4 10             	add    $0x10,%esp
c000197a:	6a 0e                	push   $0xe
c000197c:	6a 08                	push   $0x8
c000197e:	68 09 11 00 c0       	push   $0xc0001109
c0001983:	6a 01                	push   $0x1
c0001985:	e8 ea 50 00 00       	call   c0006a74 <InitInterruptDesc>
c000198a:	83 c4 10             	add    $0x10,%esp
c000198d:	6a 0e                	push   $0xe
c000198f:	6a 08                	push   $0x8
c0001991:	68 0f 11 00 c0       	push   $0xc000110f
c0001996:	6a 02                	push   $0x2
c0001998:	e8 d7 50 00 00       	call   c0006a74 <InitInterruptDesc>
c000199d:	83 c4 10             	add    $0x10,%esp
c00019a0:	6a 0e                	push   $0xe
c00019a2:	6a 08                	push   $0x8
c00019a4:	68 15 11 00 c0       	push   $0xc0001115
c00019a9:	6a 03                	push   $0x3
c00019ab:	e8 c4 50 00 00       	call   c0006a74 <InitInterruptDesc>
c00019b0:	83 c4 10             	add    $0x10,%esp
c00019b3:	6a 0e                	push   $0xe
c00019b5:	6a 08                	push   $0x8
c00019b7:	68 1b 11 00 c0       	push   $0xc000111b
c00019bc:	6a 04                	push   $0x4
c00019be:	e8 b1 50 00 00       	call   c0006a74 <InitInterruptDesc>
c00019c3:	83 c4 10             	add    $0x10,%esp
c00019c6:	6a 0e                	push   $0xe
c00019c8:	6a 08                	push   $0x8
c00019ca:	68 21 11 00 c0       	push   $0xc0001121
c00019cf:	6a 05                	push   $0x5
c00019d1:	e8 9e 50 00 00       	call   c0006a74 <InitInterruptDesc>
c00019d6:	83 c4 10             	add    $0x10,%esp
c00019d9:	6a 0e                	push   $0xe
c00019db:	6a 08                	push   $0x8
c00019dd:	68 27 11 00 c0       	push   $0xc0001127
c00019e2:	6a 06                	push   $0x6
c00019e4:	e8 8b 50 00 00       	call   c0006a74 <InitInterruptDesc>
c00019e9:	83 c4 10             	add    $0x10,%esp
c00019ec:	6a 0e                	push   $0xe
c00019ee:	6a 08                	push   $0x8
c00019f0:	68 2d 11 00 c0       	push   $0xc000112d
c00019f5:	6a 07                	push   $0x7
c00019f7:	e8 78 50 00 00       	call   c0006a74 <InitInterruptDesc>
c00019fc:	83 c4 10             	add    $0x10,%esp
c00019ff:	6a 0e                	push   $0xe
c0001a01:	6a 08                	push   $0x8
c0001a03:	68 33 11 00 c0       	push   $0xc0001133
c0001a08:	6a 08                	push   $0x8
c0001a0a:	e8 65 50 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a0f:	83 c4 10             	add    $0x10,%esp
c0001a12:	6a 0e                	push   $0xe
c0001a14:	6a 08                	push   $0x8
c0001a16:	68 37 11 00 c0       	push   $0xc0001137
c0001a1b:	6a 09                	push   $0x9
c0001a1d:	e8 52 50 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a22:	83 c4 10             	add    $0x10,%esp
c0001a25:	6a 0e                	push   $0xe
c0001a27:	6a 08                	push   $0x8
c0001a29:	68 3d 11 00 c0       	push   $0xc000113d
c0001a2e:	6a 0a                	push   $0xa
c0001a30:	e8 3f 50 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a35:	83 c4 10             	add    $0x10,%esp
c0001a38:	6a 0e                	push   $0xe
c0001a3a:	6a 08                	push   $0x8
c0001a3c:	68 41 11 00 c0       	push   $0xc0001141
c0001a41:	6a 0b                	push   $0xb
c0001a43:	e8 2c 50 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a48:	83 c4 10             	add    $0x10,%esp
c0001a4b:	6a 0e                	push   $0xe
c0001a4d:	6a 08                	push   $0x8
c0001a4f:	68 45 11 00 c0       	push   $0xc0001145
c0001a54:	6a 0c                	push   $0xc
c0001a56:	e8 19 50 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a5b:	83 c4 10             	add    $0x10,%esp
c0001a5e:	6a 0e                	push   $0xe
c0001a60:	6a 08                	push   $0x8
c0001a62:	68 49 11 00 c0       	push   $0xc0001149
c0001a67:	6a 0d                	push   $0xd
c0001a69:	e8 06 50 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a6e:	83 c4 10             	add    $0x10,%esp
c0001a71:	6a 0e                	push   $0xe
c0001a73:	6a 08                	push   $0x8
c0001a75:	68 4d 11 00 c0       	push   $0xc000114d
c0001a7a:	6a 0e                	push   $0xe
c0001a7c:	e8 f3 4f 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a81:	83 c4 10             	add    $0x10,%esp
c0001a84:	6a 0e                	push   $0xe
c0001a86:	6a 08                	push   $0x8
c0001a88:	68 51 11 00 c0       	push   $0xc0001151
c0001a8d:	6a 10                	push   $0x10
c0001a8f:	e8 e0 4f 00 00       	call   c0006a74 <InitInterruptDesc>
c0001a94:	83 c4 10             	add    $0x10,%esp
c0001a97:	6a 0e                	push   $0xe
c0001a99:	6a 08                	push   $0x8
c0001a9b:	68 57 11 00 c0       	push   $0xc0001157
c0001aa0:	6a 11                	push   $0x11
c0001aa2:	e8 cd 4f 00 00       	call   c0006a74 <InitInterruptDesc>
c0001aa7:	83 c4 10             	add    $0x10,%esp
c0001aaa:	6a 0e                	push   $0xe
c0001aac:	6a 08                	push   $0x8
c0001aae:	68 5b 11 00 c0       	push   $0xc000115b
c0001ab3:	6a 12                	push   $0x12
c0001ab5:	e8 ba 4f 00 00       	call   c0006a74 <InitInterruptDesc>
c0001aba:	83 c4 10             	add    $0x10,%esp
c0001abd:	6a 0e                	push   $0xe
c0001abf:	6a 0e                	push   $0xe
c0001ac1:	68 42 12 00 c0       	push   $0xc0001242
c0001ac6:	68 90 00 00 00       	push   $0x90
c0001acb:	e8 a4 4f 00 00       	call   c0006a74 <InitInterruptDesc>
c0001ad0:	83 c4 10             	add    $0x10,%esp
c0001ad3:	90                   	nop
c0001ad4:	c9                   	leave  
c0001ad5:	c3                   	ret    

c0001ad6 <test>:
c0001ad6:	55                   	push   %ebp
c0001ad7:	89 e5                	mov    %esp,%ebp
c0001ad9:	83 ec 08             	sub    $0x8,%esp
c0001adc:	83 ec 0c             	sub    $0xc,%esp
c0001adf:	68 ac 91 00 c0       	push   $0xc00091ac
c0001ae4:	e8 a3 f5 ff ff       	call   c000108c <disp_str>
c0001ae9:	83 c4 10             	add    $0x10,%esp
c0001aec:	83 ec 0c             	sub    $0xc,%esp
c0001aef:	6a 06                	push   $0x6
c0001af1:	e8 50 fb ff ff       	call   c0001646 <disp_int>
c0001af6:	83 c4 10             	add    $0x10,%esp
c0001af9:	83 ec 0c             	sub    $0xc,%esp
c0001afc:	68 f4 8e 00 c0       	push   $0xc0008ef4
c0001b01:	e8 86 f5 ff ff       	call   c000108c <disp_str>
c0001b06:	83 c4 10             	add    $0x10,%esp
c0001b09:	90                   	nop
c0001b0a:	c9                   	leave  
c0001b0b:	c3                   	ret    

c0001b0c <disp_str_colour3>:
c0001b0c:	55                   	push   %ebp
c0001b0d:	89 e5                	mov    %esp,%ebp
c0001b0f:	90                   	nop
c0001b10:	5d                   	pop    %ebp
c0001b11:	c3                   	ret    

c0001b12 <spurious_irq>:
c0001b12:	55                   	push   %ebp
c0001b13:	89 e5                	mov    %esp,%ebp
c0001b15:	83 ec 08             	sub    $0x8,%esp
c0001b18:	83 ec 08             	sub    $0x8,%esp
c0001b1b:	6a 0b                	push   $0xb
c0001b1d:	68 b0 91 00 c0       	push   $0xc00091b0
c0001b22:	e8 a0 f5 ff ff       	call   c00010c7 <disp_str_colour>
c0001b27:	83 c4 10             	add    $0x10,%esp
c0001b2a:	83 ec 0c             	sub    $0xc,%esp
c0001b2d:	ff 75 08             	pushl  0x8(%ebp)
c0001b30:	e8 11 fb ff ff       	call   c0001646 <disp_int>
c0001b35:	83 c4 10             	add    $0x10,%esp
c0001b38:	a1 20 f6 00 c0       	mov    0xc000f620,%eax
c0001b3d:	83 c0 01             	add    $0x1,%eax
c0001b40:	a3 20 f6 00 c0       	mov    %eax,0xc000f620
c0001b45:	83 ec 0c             	sub    $0xc,%esp
c0001b48:	68 d7 91 00 c0       	push   $0xc00091d7
c0001b4d:	e8 3a f5 ff ff       	call   c000108c <disp_str>
c0001b52:	83 c4 10             	add    $0x10,%esp
c0001b55:	a1 20 f6 00 c0       	mov    0xc000f620,%eax
c0001b5a:	83 ec 0c             	sub    $0xc,%esp
c0001b5d:	50                   	push   %eax
c0001b5e:	e8 e3 fa ff ff       	call   c0001646 <disp_int>
c0001b63:	83 c4 10             	add    $0x10,%esp
c0001b66:	83 ec 0c             	sub    $0xc,%esp
c0001b69:	68 d9 91 00 c0       	push   $0xc00091d9
c0001b6e:	e8 19 f5 ff ff       	call   c000108c <disp_str>
c0001b73:	83 c4 10             	add    $0x10,%esp
c0001b76:	83 ec 08             	sub    $0x8,%esp
c0001b79:	6a 0c                	push   $0xc
c0001b7b:	68 dc 91 00 c0       	push   $0xc00091dc
c0001b80:	e8 42 f5 ff ff       	call   c00010c7 <disp_str_colour>
c0001b85:	83 c4 10             	add    $0x10,%esp
c0001b88:	90                   	nop
c0001b89:	c9                   	leave  
c0001b8a:	c3                   	ret    

c0001b8b <init_keyboard>:
c0001b8b:	55                   	push   %ebp
c0001b8c:	89 e5                	mov    %esp,%ebp
c0001b8e:	83 ec 18             	sub    $0x18,%esp
c0001b91:	83 ec 04             	sub    $0x4,%esp
c0001b94:	68 00 02 00 00       	push   $0x200
c0001b99:	6a 00                	push   $0x0
c0001b9b:	68 ec d2 00 c0       	push   $0xc000d2ec
c0001ba0:	e8 eb 7d 00 00       	call   c0009990 <Memset>
c0001ba5:	83 c4 10             	add    $0x10,%esp
c0001ba8:	c7 05 e0 d2 00 c0 ec 	movl   $0xc000d2ec,0xc000d2e0
c0001baf:	d2 00 c0 
c0001bb2:	a1 e0 d2 00 c0       	mov    0xc000d2e0,%eax
c0001bb7:	a3 e4 d2 00 c0       	mov    %eax,0xc000d2e4
c0001bbc:	c7 05 e8 d2 00 c0 00 	movl   $0x0,0xc000d2e8
c0001bc3:	00 00 00 
c0001bc6:	c7 05 9c ce 00 c0 00 	movl   $0x0,0xc000ce9c
c0001bcd:	00 00 00 
c0001bd0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001bd7:	eb 14                	jmp    c0001bed <init_keyboard+0x62>
c0001bd9:	83 ec 0c             	sub    $0xc,%esp
c0001bdc:	68 01 92 00 c0       	push   $0xc0009201
c0001be1:	e8 a6 f4 ff ff       	call   c000108c <disp_str>
c0001be6:	83 c4 10             	add    $0x10,%esp
c0001be9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001bed:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001bf4:	7e e3                	jle    c0001bd9 <init_keyboard+0x4e>
c0001bf6:	c7 05 9c ce 00 c0 00 	movl   $0x0,0xc000ce9c
c0001bfd:	00 00 00 
c0001c00:	e8 ef 5b 00 00       	call   c00077f4 <init_keyboard_handler>
c0001c05:	90                   	nop
c0001c06:	c9                   	leave  
c0001c07:	c3                   	ret    

c0001c08 <init>:
c0001c08:	55                   	push   %ebp
c0001c09:	89 e5                	mov    %esp,%ebp
c0001c0b:	83 ec 08             	sub    $0x8,%esp
c0001c0e:	66 87 db             	xchg   %bx,%bx
c0001c11:	83 ec 0c             	sub    $0xc,%esp
c0001c14:	68 03 92 00 c0       	push   $0xc0009203
c0001c19:	e8 6e f4 ff ff       	call   c000108c <disp_str>
c0001c1e:	83 c4 10             	add    $0x10,%esp
c0001c21:	e8 65 ff ff ff       	call   c0001b8b <init_keyboard>
c0001c26:	83 ec 0c             	sub    $0xc,%esp
c0001c29:	68 00 00 00 02       	push   $0x2000000
c0001c2e:	e8 5f 71 00 00       	call   c0008d92 <init_memory>
c0001c33:	83 c4 10             	add    $0x10,%esp
c0001c36:	90                   	nop
c0001c37:	c9                   	leave  
c0001c38:	c3                   	ret    

c0001c39 <kernel_main>:
c0001c39:	55                   	push   %ebp
c0001c3a:	89 e5                	mov    %esp,%ebp
c0001c3c:	83 ec 38             	sub    $0x38,%esp
c0001c3f:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001c46:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
c0001c4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001c50:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0001c53:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0001c56:	83 ec 0c             	sub    $0xc,%esp
c0001c59:	68 09 92 00 c0       	push   $0xc0009209
c0001c5e:	e8 29 f4 ff ff       	call   c000108c <disp_str>
c0001c63:	83 c4 10             	add    $0x10,%esp
c0001c66:	e8 9d ff ff ff       	call   c0001c08 <init>
c0001c6b:	c7 05 20 f6 00 c0 00 	movl   $0x0,0xc000f620
c0001c72:	00 00 00 
c0001c75:	c7 05 fc ed 00 c0 00 	movl   $0x0,0xc000edfc
c0001c7c:	00 00 00 
c0001c7f:	c7 05 a0 ce 00 c0 00 	movl   $0x0,0xc000cea0
c0001c86:	00 00 00 
c0001c89:	c7 45 dc 00 79 01 c0 	movl   $0xc0017900,-0x24(%ebp)
c0001c90:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0001c97:	e9 b3 01 00 00       	jmp    c0001e4f <kernel_main+0x216>
c0001c9c:	83 ec 08             	sub    $0x8,%esp
c0001c9f:	6a 00                	push   $0x0
c0001ca1:	6a 02                	push   $0x2
c0001ca3:	e8 11 6e 00 00       	call   c0008ab9 <alloc_memory>
c0001ca8:	83 c4 10             	add    $0x10,%esp
c0001cab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001cae:	83 ec 04             	sub    $0x4,%esp
c0001cb1:	68 b0 00 00 00       	push   $0xb0
c0001cb6:	6a 00                	push   $0x0
c0001cb8:	ff 75 f4             	pushl  -0xc(%ebp)
c0001cbb:	e8 d0 7c 00 00       	call   c0009990 <Memset>
c0001cc0:	83 c4 10             	add    $0x10,%esp
c0001cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cc6:	05 00 10 00 00       	add    $0x1000,%eax
c0001ccb:	89 c2                	mov    %eax,%edx
c0001ccd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cd0:	89 10                	mov    %edx,(%eax)
c0001cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cd5:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
c0001cdb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0001cde:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ce1:	89 50 18             	mov    %edx,0x18(%eax)
c0001ce4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ce7:	c7 40 40 00 00 00 00 	movl   $0x0,0x40(%eax)
c0001cee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0001cf2:	7e 0c                	jle    c0001d00 <kernel_main+0xc7>
c0001cf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cf7:	c6 40 48 ff          	movb   $0xff,0x48(%eax)
c0001cfb:	e9 4b 01 00 00       	jmp    c0001e4b <kernel_main+0x212>
c0001d00:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d03:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c0001d07:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0001d0b:	7f 71                	jg     c0001d7e <kernel_main+0x145>
c0001d0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001d10:	6b c0 1c             	imul   $0x1c,%eax,%eax
c0001d13:	05 28 c0 00 c0       	add    $0xc000c028,%eax
c0001d18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001d1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d1e:	8b 00                	mov    (%eax),%eax
c0001d20:	83 e8 44             	sub    $0x44,%eax
c0001d23:	89 c2                	mov    %eax,%edx
c0001d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d28:	89 10                	mov    %edx,(%eax)
c0001d2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d2d:	8b 00                	mov    (%eax),%eax
c0001d2f:	83 e8 14             	sub    $0x14,%eax
c0001d32:	89 c2                	mov    %eax,%edx
c0001d34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d37:	89 10                	mov    %edx,(%eax)
c0001d39:	66 87 db             	xchg   %bx,%bx
c0001d3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d3f:	8b 00                	mov    (%eax),%eax
c0001d41:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0001d44:	66 87 db             	xchg   %bx,%bx
c0001d47:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d4a:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
c0001d50:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d53:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0001d5a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d5d:	8b 50 04             	mov    0x4(%eax),%edx
c0001d60:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d63:	89 50 08             	mov    %edx,0x8(%eax)
c0001d66:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d69:	8b 50 08             	mov    0x8(%eax),%edx
c0001d6c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d6f:	89 50 0c             	mov    %edx,0xc(%eax)
c0001d72:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d75:	8b 50 0c             	mov    0xc(%eax),%edx
c0001d78:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0001d7b:	89 50 10             	mov    %edx,0x10(%eax)
c0001d7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001d81:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001d84:	83 c2 28             	add    $0x28,%edx
c0001d87:	83 ec 08             	sub    $0x8,%esp
c0001d8a:	50                   	push   %eax
c0001d8b:	52                   	push   %edx
c0001d8c:	e8 1e 7c 00 00       	call   c00099af <Strcpy>
c0001d91:	83 c4 10             	add    $0x10,%esp
c0001d94:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
c0001d98:	83 c8 04             	or     $0x4,%eax
c0001d9b:	0f b6 c0             	movzbl %al,%eax
c0001d9e:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
c0001da2:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
c0001da6:	83 c8 0c             	or     $0xc,%eax
c0001da9:	0f b6 c0             	movzbl %al,%eax
c0001dac:	66 89 45 d2          	mov    %ax,-0x2e(%ebp)
c0001db0:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0001db4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001db7:	89 90 a0 00 00 00    	mov    %edx,0xa0(%eax)
c0001dbd:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
c0001dc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dc4:	89 50 78             	mov    %edx,0x78(%eax)
c0001dc7:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
c0001dcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dce:	89 50 70             	mov    %edx,0x70(%eax)
c0001dd1:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
c0001dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dd8:	89 50 74             	mov    %edx,0x74(%eax)
c0001ddb:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
c0001ddf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001de2:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
c0001de8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001deb:	c7 40 6c 39 00 00 00 	movl   $0x39,0x6c(%eax)
c0001df2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001df5:	8b 40 14             	mov    0x14(%eax),%eax
c0001df8:	89 c2                	mov    %eax,%edx
c0001dfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dfd:	89 90 9c 00 00 00    	mov    %edx,0x9c(%eax)
c0001e03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e06:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0001e09:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
c0001e0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e12:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
c0001e19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e1c:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0001e23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e26:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c0001e2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e30:	c7 40 54 1a 00 00 00 	movl   $0x1a,0x54(%eax)
c0001e37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e3a:	c7 40 50 1a 00 00 00 	movl   $0x1a,0x50(%eax)
c0001e41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e44:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c0001e4b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0001e4f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0001e53:	0f 8e 43 fe ff ff    	jle    c0001c9c <kernel_main+0x63>
c0001e59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e5c:	a3 c0 d2 00 c0       	mov    %eax,0xc000d2c0
c0001e61:	66 87 db             	xchg   %bx,%bx
c0001e64:	fb                   	sti    
c0001e65:	eb fe                	jmp    c0001e65 <kernel_main+0x22c>

c0001e67 <TestFS>:
c0001e67:	55                   	push   %ebp
c0001e68:	89 e5                	mov    %esp,%ebp
c0001e6a:	81 ec f8 02 00 00    	sub    $0x2f8,%esp
c0001e70:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0001e77:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c0001e7e:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0001e84:	83 ec 08             	sub    $0x8,%esp
c0001e87:	6a 02                	push   $0x2
c0001e89:	8d 45 be             	lea    -0x42(%ebp),%eax
c0001e8c:	50                   	push   %eax
c0001e8d:	e8 08 5b 00 00       	call   c000799a <open>
c0001e92:	83 c4 10             	add    $0x10,%esp
c0001e95:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e98:	83 ec 08             	sub    $0x8,%esp
c0001e9b:	6a 02                	push   $0x2
c0001e9d:	8d 45 be             	lea    -0x42(%ebp),%eax
c0001ea0:	50                   	push   %eax
c0001ea1:	e8 f4 5a 00 00       	call   c000799a <open>
c0001ea6:	83 c4 10             	add    $0x10,%esp
c0001ea9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001eac:	83 ec 0c             	sub    $0xc,%esp
c0001eaf:	68 15 92 00 c0       	push   $0xc0009215
c0001eb4:	e8 1f 0e 00 00       	call   c0002cd8 <Printf>
c0001eb9:	83 c4 10             	add    $0x10,%esp
c0001ebc:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0001ec3:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0001ec7:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0001ece:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0001ed2:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0001ed9:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0001ee0:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0001ee6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0001eed:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001ef1:	75 fa                	jne    c0001eed <TestFS+0x86>
c0001ef3:	83 ec 08             	sub    $0x8,%esp
c0001ef6:	6a 07                	push   $0x7
c0001ef8:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0001efb:	50                   	push   %eax
c0001efc:	e8 99 5a 00 00       	call   c000799a <open>
c0001f01:	83 c4 10             	add    $0x10,%esp
c0001f04:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001f07:	83 ec 08             	sub    $0x8,%esp
c0001f0a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001f0d:	68 27 92 00 c0       	push   $0xc0009227
c0001f12:	e8 c1 0d 00 00       	call   c0002cd8 <Printf>
c0001f17:	83 c4 10             	add    $0x10,%esp
c0001f1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001f21:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0001f28:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0001f2f:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0001f36:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0001f3d:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0001f44:	83 ec 0c             	sub    $0xc,%esp
c0001f47:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0001f4a:	50                   	push   %eax
c0001f4b:	e8 79 7a 00 00       	call   c00099c9 <Strlen>
c0001f50:	83 c4 10             	add    $0x10,%esp
c0001f53:	83 ec 04             	sub    $0x4,%esp
c0001f56:	50                   	push   %eax
c0001f57:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0001f5a:	50                   	push   %eax
c0001f5b:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001f5e:	e8 c3 5a 00 00       	call   c0007a26 <write>
c0001f63:	83 c4 10             	add    $0x10,%esp
c0001f66:	83 ec 04             	sub    $0x4,%esp
c0001f69:	6a 14                	push   $0x14
c0001f6b:	6a 00                	push   $0x0
c0001f6d:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0001f70:	50                   	push   %eax
c0001f71:	e8 1a 7a 00 00       	call   c0009990 <Memset>
c0001f76:	83 c4 10             	add    $0x10,%esp
c0001f79:	83 ec 04             	sub    $0x4,%esp
c0001f7c:	6a 12                	push   $0x12
c0001f7e:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0001f81:	50                   	push   %eax
c0001f82:	ff 75 e4             	pushl  -0x1c(%ebp)
c0001f85:	e8 65 5a 00 00       	call   c00079ef <read>
c0001f8a:	83 c4 10             	add    $0x10,%esp
c0001f8d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0001f90:	83 ec 08             	sub    $0x8,%esp
c0001f93:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0001f96:	50                   	push   %eax
c0001f97:	68 30 92 00 c0       	push   $0xc0009230
c0001f9c:	e8 37 0d 00 00       	call   c0002cd8 <Printf>
c0001fa1:	83 c4 10             	add    $0x10,%esp
c0001fa4:	83 ec 0c             	sub    $0xc,%esp
c0001fa7:	6a 0a                	push   $0xa
c0001fa9:	e8 6a 0b 00 00       	call   c0002b18 <delay>
c0001fae:	83 c4 10             	add    $0x10,%esp
c0001fb1:	83 ec 08             	sub    $0x8,%esp
c0001fb4:	6a 07                	push   $0x7
c0001fb6:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0001fb9:	50                   	push   %eax
c0001fba:	e8 db 59 00 00       	call   c000799a <open>
c0001fbf:	83 c4 10             	add    $0x10,%esp
c0001fc2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001fc5:	83 ec 08             	sub    $0x8,%esp
c0001fc8:	ff 75 dc             	pushl  -0x24(%ebp)
c0001fcb:	68 3b 92 00 c0       	push   $0xc000923b
c0001fd0:	e8 03 0d 00 00       	call   c0002cd8 <Printf>
c0001fd5:	83 c4 10             	add    $0x10,%esp
c0001fd8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001fdf:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0001fe6:	67 3a 68 
c0001fe9:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0001ff0:	77 20 61 
c0001ff3:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0001ffa:	65 20 79 
c0001ffd:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0002004:	75 3f 00 
c0002007:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c000200e:	00 00 00 
c0002011:	83 ec 0c             	sub    $0xc,%esp
c0002014:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c000201a:	50                   	push   %eax
c000201b:	e8 a9 79 00 00       	call   c00099c9 <Strlen>
c0002020:	83 c4 10             	add    $0x10,%esp
c0002023:	83 ec 04             	sub    $0x4,%esp
c0002026:	50                   	push   %eax
c0002027:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c000202d:	50                   	push   %eax
c000202e:	ff 75 dc             	pushl  -0x24(%ebp)
c0002031:	e8 f0 59 00 00       	call   c0007a26 <write>
c0002036:	83 c4 10             	add    $0x10,%esp
c0002039:	83 ec 04             	sub    $0x4,%esp
c000203c:	6a 14                	push   $0x14
c000203e:	6a 00                	push   $0x0
c0002040:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0002046:	50                   	push   %eax
c0002047:	e8 44 79 00 00       	call   c0009990 <Memset>
c000204c:	83 c4 10             	add    $0x10,%esp
c000204f:	83 ec 04             	sub    $0x4,%esp
c0002052:	6a 12                	push   $0x12
c0002054:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c000205a:	50                   	push   %eax
c000205b:	ff 75 dc             	pushl  -0x24(%ebp)
c000205e:	e8 8c 59 00 00       	call   c00079ef <read>
c0002063:	83 c4 10             	add    $0x10,%esp
c0002066:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002069:	83 ec 08             	sub    $0x8,%esp
c000206c:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0002072:	50                   	push   %eax
c0002073:	68 45 92 00 c0       	push   $0xc0009245
c0002078:	e8 5b 0c 00 00       	call   c0002cd8 <Printf>
c000207d:	83 c4 10             	add    $0x10,%esp
c0002080:	83 ec 08             	sub    $0x8,%esp
c0002083:	6a 07                	push   $0x7
c0002085:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0002088:	50                   	push   %eax
c0002089:	e8 0c 59 00 00       	call   c000799a <open>
c000208e:	83 c4 10             	add    $0x10,%esp
c0002091:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0002094:	83 ec 08             	sub    $0x8,%esp
c0002097:	ff 75 dc             	pushl  -0x24(%ebp)
c000209a:	68 3b 92 00 c0       	push   $0xc000923b
c000209f:	e8 34 0c 00 00       	call   c0002cd8 <Printf>
c00020a4:	83 c4 10             	add    $0x10,%esp
c00020a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00020ae:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c00020b5:	20 77 69 
c00020b8:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c00020bf:	6c 20 73 
c00020c2:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c00020c9:	63 63 65 
c00020cc:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c00020d3:	73 20 61 
c00020d6:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c00020dd:	20 6c 61 
c00020e0:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c00020e7:	74 2e 00 
c00020ea:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c00020f1:	00 00 00 
c00020f4:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c00020fb:	00 00 
c00020fd:	83 ec 0c             	sub    $0xc,%esp
c0002100:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0002106:	50                   	push   %eax
c0002107:	e8 bd 78 00 00       	call   c00099c9 <Strlen>
c000210c:	83 c4 10             	add    $0x10,%esp
c000210f:	83 ec 04             	sub    $0x4,%esp
c0002112:	50                   	push   %eax
c0002113:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0002119:	50                   	push   %eax
c000211a:	ff 75 d4             	pushl  -0x2c(%ebp)
c000211d:	e8 04 59 00 00       	call   c0007a26 <write>
c0002122:	83 c4 10             	add    $0x10,%esp
c0002125:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000212c:	eb 5c                	jmp    c000218a <TestFS+0x323>
c000212e:	83 ec 04             	sub    $0x4,%esp
c0002131:	6a 1e                	push   $0x1e
c0002133:	6a 00                	push   $0x0
c0002135:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c000213b:	50                   	push   %eax
c000213c:	e8 4f 78 00 00       	call   c0009990 <Memset>
c0002141:	83 c4 10             	add    $0x10,%esp
c0002144:	83 ec 0c             	sub    $0xc,%esp
c0002147:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000214d:	50                   	push   %eax
c000214e:	e8 76 78 00 00       	call   c00099c9 <Strlen>
c0002153:	83 c4 10             	add    $0x10,%esp
c0002156:	83 ec 04             	sub    $0x4,%esp
c0002159:	50                   	push   %eax
c000215a:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0002160:	50                   	push   %eax
c0002161:	ff 75 d4             	pushl  -0x2c(%ebp)
c0002164:	e8 86 58 00 00       	call   c00079ef <read>
c0002169:	83 c4 10             	add    $0x10,%esp
c000216c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000216f:	83 ec 08             	sub    $0x8,%esp
c0002172:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0002178:	50                   	push   %eax
c0002179:	68 50 92 00 c0       	push   $0xc0009250
c000217e:	e8 55 0b 00 00       	call   c0002cd8 <Printf>
c0002183:	83 c4 10             	add    $0x10,%esp
c0002186:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000218a:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
c000218e:	7e 9e                	jle    c000212e <TestFS+0x2c7>
c0002190:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0002197:	6e 73 74 
c000219a:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c00021a1:	6c 6c 2e 
c00021a4:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c00021ab:	61 72 00 
c00021ae:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c00021b5:	00 00 00 
c00021b8:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c00021bf:	00 00 00 
c00021c2:	83 ec 08             	sub    $0x8,%esp
c00021c5:	6a 00                	push   $0x0
c00021c7:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c00021cd:	50                   	push   %eax
c00021ce:	e8 c7 57 00 00       	call   c000799a <open>
c00021d3:	83 c4 10             	add    $0x10,%esp
c00021d6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00021d9:	83 ec 08             	sub    $0x8,%esp
c00021dc:	ff 75 cc             	pushl  -0x34(%ebp)
c00021df:	68 5b 92 00 c0       	push   $0xc000925b
c00021e4:	e8 ef 0a 00 00       	call   c0002cd8 <Printf>
c00021e9:	83 c4 10             	add    $0x10,%esp
c00021ec:	83 ec 04             	sub    $0x4,%esp
c00021ef:	6a 14                	push   $0x14
c00021f1:	6a 00                	push   $0x0
c00021f3:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c00021f9:	50                   	push   %eax
c00021fa:	e8 91 77 00 00       	call   c0009990 <Memset>
c00021ff:	83 c4 10             	add    $0x10,%esp
c0002202:	83 ec 04             	sub    $0x4,%esp
c0002205:	68 00 02 00 00       	push   $0x200
c000220a:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0002210:	50                   	push   %eax
c0002211:	ff 75 cc             	pushl  -0x34(%ebp)
c0002214:	e8 d6 57 00 00       	call   c00079ef <read>
c0002219:	83 c4 10             	add    $0x10,%esp
c000221c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000221f:	83 ec 08             	sub    $0x8,%esp
c0002222:	8d 85 0a fd ff ff    	lea    -0x2f6(%ebp),%eax
c0002228:	50                   	push   %eax
c0002229:	68 65 92 00 c0       	push   $0xc0009265
c000222e:	e8 a5 0a 00 00       	call   c0002cd8 <Printf>
c0002233:	83 c4 10             	add    $0x10,%esp
c0002236:	e9 b2 fc ff ff       	jmp    c0001eed <TestFS+0x86>

c000223b <wait_exit>:
c000223b:	55                   	push   %ebp
c000223c:	89 e5                	mov    %esp,%ebp
c000223e:	83 ec 28             	sub    $0x28,%esp
c0002241:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0002248:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000224f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0002255:	83 ec 08             	sub    $0x8,%esp
c0002258:	6a 02                	push   $0x2
c000225a:	8d 45 de             	lea    -0x22(%ebp),%eax
c000225d:	50                   	push   %eax
c000225e:	e8 37 57 00 00       	call   c000799a <open>
c0002263:	83 c4 10             	add    $0x10,%esp
c0002266:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002269:	83 ec 08             	sub    $0x8,%esp
c000226c:	6a 02                	push   $0x2
c000226e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0002271:	50                   	push   %eax
c0002272:	e8 23 57 00 00       	call   c000799a <open>
c0002277:	83 c4 10             	add    $0x10,%esp
c000227a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000227d:	e8 8e 58 00 00       	call   c0007b10 <fork>
c0002282:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002285:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002289:	7e 25                	jle    c00022b0 <wait_exit+0x75>
c000228b:	83 ec 0c             	sub    $0xc,%esp
c000228e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0002291:	50                   	push   %eax
c0002292:	e8 12 58 00 00       	call   c0007aa9 <wait>
c0002297:	83 c4 10             	add    $0x10,%esp
c000229a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000229d:	83 ec 08             	sub    $0x8,%esp
c00022a0:	50                   	push   %eax
c00022a1:	68 70 92 00 c0       	push   $0xc0009270
c00022a6:	e8 2d 0a 00 00       	call   c0002cd8 <Printf>
c00022ab:	83 c4 10             	add    $0x10,%esp
c00022ae:	eb fe                	jmp    c00022ae <wait_exit+0x73>
c00022b0:	83 ec 0c             	sub    $0xc,%esp
c00022b3:	68 8b 92 00 c0       	push   $0xc000928b
c00022b8:	e8 1b 0a 00 00       	call   c0002cd8 <Printf>
c00022bd:	83 c4 10             	add    $0x10,%esp
c00022c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022ca:	8d 50 01             	lea    0x1(%eax),%edx
c00022cd:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00022d0:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c00022d5:	7f 02                	jg     c00022d9 <wait_exit+0x9e>
c00022d7:	eb ee                	jmp    c00022c7 <wait_exit+0x8c>
c00022d9:	90                   	nop
c00022da:	83 ec 0c             	sub    $0xc,%esp
c00022dd:	68 97 92 00 c0       	push   $0xc0009297
c00022e2:	e8 f1 09 00 00       	call   c0002cd8 <Printf>
c00022e7:	83 c4 10             	add    $0x10,%esp
c00022ea:	83 ec 0c             	sub    $0xc,%esp
c00022ed:	6a 09                	push   $0x9
c00022ef:	e8 f3 57 00 00       	call   c0007ae7 <exit>
c00022f4:	83 c4 10             	add    $0x10,%esp
c00022f7:	83 ec 0c             	sub    $0xc,%esp
c00022fa:	68 a5 92 00 c0       	push   $0xc00092a5
c00022ff:	e8 d4 09 00 00       	call   c0002cd8 <Printf>
c0002304:	83 c4 10             	add    $0x10,%esp
c0002307:	eb fe                	jmp    c0002307 <wait_exit+0xcc>

c0002309 <INIT_fork>:
c0002309:	55                   	push   %ebp
c000230a:	89 e5                	mov    %esp,%ebp
c000230c:	53                   	push   %ebx
c000230d:	81 ec 84 00 00 00    	sub    $0x84,%esp
c0002313:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c000231a:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0002321:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0002327:	83 ec 08             	sub    $0x8,%esp
c000232a:	6a 02                	push   $0x2
c000232c:	8d 45 da             	lea    -0x26(%ebp),%eax
c000232f:	50                   	push   %eax
c0002330:	e8 65 56 00 00       	call   c000799a <open>
c0002335:	83 c4 10             	add    $0x10,%esp
c0002338:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000233b:	83 ec 08             	sub    $0x8,%esp
c000233e:	6a 02                	push   $0x2
c0002340:	8d 45 da             	lea    -0x26(%ebp),%eax
c0002343:	50                   	push   %eax
c0002344:	e8 51 56 00 00       	call   c000799a <open>
c0002349:	83 c4 10             	add    $0x10,%esp
c000234c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000234f:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c0002356:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c000235d:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c0002364:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c000236b:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c0002372:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0002379:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0002380:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0002387:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c000238e:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0002395:	83 ec 0c             	sub    $0xc,%esp
c0002398:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c000239b:	50                   	push   %eax
c000239c:	e8 28 76 00 00       	call   c00099c9 <Strlen>
c00023a1:	83 c4 10             	add    $0x10,%esp
c00023a4:	83 ec 04             	sub    $0x4,%esp
c00023a7:	50                   	push   %eax
c00023a8:	6a 00                	push   $0x0
c00023aa:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00023ad:	50                   	push   %eax
c00023ae:	e8 dd 75 00 00       	call   c0009990 <Memset>
c00023b3:	83 c4 10             	add    $0x10,%esp
c00023b6:	83 ec 04             	sub    $0x4,%esp
c00023b9:	6a 28                	push   $0x28
c00023bb:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00023be:	50                   	push   %eax
c00023bf:	ff 75 e8             	pushl  -0x18(%ebp)
c00023c2:	e8 28 56 00 00       	call   c00079ef <read>
c00023c7:	83 c4 10             	add    $0x10,%esp
c00023ca:	83 ec 04             	sub    $0x4,%esp
c00023cd:	6a 28                	push   $0x28
c00023cf:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00023d2:	50                   	push   %eax
c00023d3:	ff 75 ec             	pushl  -0x14(%ebp)
c00023d6:	e8 4b 56 00 00       	call   c0007a26 <write>
c00023db:	83 c4 10             	add    $0x10,%esp
c00023de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00023e5:	e8 26 57 00 00       	call   c0007b10 <fork>
c00023ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00023ed:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00023f1:	0f 8e dd 00 00 00    	jle    c00024d4 <INIT_fork+0x1cb>
c00023f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00023fb:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
c0002402:	61 72 65 
c0002405:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
c000240c:	8d 45 87             	lea    -0x79(%ebp),%eax
c000240f:	b9 20 00 00 00       	mov    $0x20,%ecx
c0002414:	bb 00 00 00 00       	mov    $0x0,%ebx
c0002419:	89 18                	mov    %ebx,(%eax)
c000241b:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c000241f:	8d 50 04             	lea    0x4(%eax),%edx
c0002422:	83 e2 fc             	and    $0xfffffffc,%edx
c0002425:	29 d0                	sub    %edx,%eax
c0002427:	01 c1                	add    %eax,%ecx
c0002429:	83 e1 fc             	and    $0xfffffffc,%ecx
c000242c:	83 e1 fc             	and    $0xfffffffc,%ecx
c000242f:	b8 00 00 00 00       	mov    $0x0,%eax
c0002434:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0002437:	83 c0 04             	add    $0x4,%eax
c000243a:	39 c8                	cmp    %ecx,%eax
c000243c:	72 f6                	jb     c0002434 <INIT_fork+0x12b>
c000243e:	01 c2                	add    %eax,%edx
c0002440:	83 ec 0c             	sub    $0xc,%esp
c0002443:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002449:	50                   	push   %eax
c000244a:	e8 7a 75 00 00       	call   c00099c9 <Strlen>
c000244f:	83 c4 10             	add    $0x10,%esp
c0002452:	83 ec 04             	sub    $0x4,%esp
c0002455:	50                   	push   %eax
c0002456:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000245c:	50                   	push   %eax
c000245d:	ff 75 ec             	pushl  -0x14(%ebp)
c0002460:	e8 c1 55 00 00       	call   c0007a26 <write>
c0002465:	83 c4 10             	add    $0x10,%esp
c0002468:	83 ec 0c             	sub    $0xc,%esp
c000246b:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002471:	50                   	push   %eax
c0002472:	e8 52 75 00 00       	call   c00099c9 <Strlen>
c0002477:	83 c4 10             	add    $0x10,%esp
c000247a:	83 ec 04             	sub    $0x4,%esp
c000247d:	50                   	push   %eax
c000247e:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002484:	50                   	push   %eax
c0002485:	ff 75 ec             	pushl  -0x14(%ebp)
c0002488:	e8 99 55 00 00       	call   c0007a26 <write>
c000248d:	83 c4 10             	add    $0x10,%esp
c0002490:	83 ec 0c             	sub    $0xc,%esp
c0002493:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002499:	50                   	push   %eax
c000249a:	e8 2a 75 00 00       	call   c00099c9 <Strlen>
c000249f:	83 c4 10             	add    $0x10,%esp
c00024a2:	83 ec 04             	sub    $0x4,%esp
c00024a5:	50                   	push   %eax
c00024a6:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00024ac:	50                   	push   %eax
c00024ad:	ff 75 ec             	pushl  -0x14(%ebp)
c00024b0:	e8 71 55 00 00       	call   c0007a26 <write>
c00024b5:	83 c4 10             	add    $0x10,%esp
c00024b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00024bf:	eb 08                	jmp    c00024c9 <INIT_fork+0x1c0>
c00024c1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00024c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00024c9:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c00024cd:	7e f2                	jle    c00024c1 <INIT_fork+0x1b8>
c00024cf:	e9 0f 01 00 00       	jmp    c00025e3 <INIT_fork+0x2da>
c00024d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00024d8:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c00024dc:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
c00024e3:	68 69 6c 
c00024e6:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
c00024ed:	8d 45 87             	lea    -0x79(%ebp),%eax
c00024f0:	b9 20 00 00 00       	mov    $0x20,%ecx
c00024f5:	bb 00 00 00 00       	mov    $0x0,%ebx
c00024fa:	89 18                	mov    %ebx,(%eax)
c00024fc:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0002500:	8d 50 04             	lea    0x4(%eax),%edx
c0002503:	83 e2 fc             	and    $0xfffffffc,%edx
c0002506:	29 d0                	sub    %edx,%eax
c0002508:	01 c1                	add    %eax,%ecx
c000250a:	83 e1 fc             	and    $0xfffffffc,%ecx
c000250d:	83 e1 fc             	and    $0xfffffffc,%ecx
c0002510:	b8 00 00 00 00       	mov    $0x0,%eax
c0002515:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0002518:	83 c0 04             	add    $0x4,%eax
c000251b:	39 c8                	cmp    %ecx,%eax
c000251d:	72 f6                	jb     c0002515 <INIT_fork+0x20c>
c000251f:	01 c2                	add    %eax,%edx
c0002521:	83 ec 0c             	sub    $0xc,%esp
c0002524:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000252a:	50                   	push   %eax
c000252b:	e8 99 74 00 00       	call   c00099c9 <Strlen>
c0002530:	83 c4 10             	add    $0x10,%esp
c0002533:	83 ec 04             	sub    $0x4,%esp
c0002536:	50                   	push   %eax
c0002537:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000253d:	50                   	push   %eax
c000253e:	ff 75 ec             	pushl  -0x14(%ebp)
c0002541:	e8 e0 54 00 00       	call   c0007a26 <write>
c0002546:	83 c4 10             	add    $0x10,%esp
c0002549:	83 ec 0c             	sub    $0xc,%esp
c000254c:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002552:	50                   	push   %eax
c0002553:	e8 71 74 00 00       	call   c00099c9 <Strlen>
c0002558:	83 c4 10             	add    $0x10,%esp
c000255b:	83 ec 04             	sub    $0x4,%esp
c000255e:	50                   	push   %eax
c000255f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0002565:	50                   	push   %eax
c0002566:	ff 75 ec             	pushl  -0x14(%ebp)
c0002569:	e8 b8 54 00 00       	call   c0007a26 <write>
c000256e:	83 c4 10             	add    $0x10,%esp
c0002571:	83 ec 0c             	sub    $0xc,%esp
c0002574:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000257a:	50                   	push   %eax
c000257b:	e8 49 74 00 00       	call   c00099c9 <Strlen>
c0002580:	83 c4 10             	add    $0x10,%esp
c0002583:	83 ec 04             	sub    $0x4,%esp
c0002586:	50                   	push   %eax
c0002587:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000258d:	50                   	push   %eax
c000258e:	ff 75 ec             	pushl  -0x14(%ebp)
c0002591:	e8 90 54 00 00       	call   c0007a26 <write>
c0002596:	83 c4 10             	add    $0x10,%esp
c0002599:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
c00025a0:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
c00025a7:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
c00025ad:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
c00025b1:	83 ec 0c             	sub    $0xc,%esp
c00025b4:	8d 45 a7             	lea    -0x59(%ebp),%eax
c00025b7:	50                   	push   %eax
c00025b8:	e8 0c 74 00 00       	call   c00099c9 <Strlen>
c00025bd:	83 c4 10             	add    $0x10,%esp
c00025c0:	83 ec 04             	sub    $0x4,%esp
c00025c3:	50                   	push   %eax
c00025c4:	8d 45 a7             	lea    -0x59(%ebp),%eax
c00025c7:	50                   	push   %eax
c00025c8:	ff 75 ec             	pushl  -0x14(%ebp)
c00025cb:	e8 56 54 00 00       	call   c0007a26 <write>
c00025d0:	83 c4 10             	add    $0x10,%esp
c00025d3:	83 ec 0c             	sub    $0xc,%esp
c00025d6:	68 b3 92 00 c0       	push   $0xc00092b3
c00025db:	e8 24 0a 00 00       	call   c0003004 <spin>
c00025e0:	83 c4 10             	add    $0x10,%esp
c00025e3:	83 ec 0c             	sub    $0xc,%esp
c00025e6:	68 ba 92 00 c0       	push   $0xc00092ba
c00025eb:	e8 14 0a 00 00       	call   c0003004 <spin>
c00025f0:	83 c4 10             	add    $0x10,%esp
c00025f3:	90                   	nop
c00025f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00025f7:	c9                   	leave  
c00025f8:	c3                   	ret    

c00025f9 <simple_shell>:
c00025f9:	55                   	push   %ebp
c00025fa:	89 e5                	mov    %esp,%ebp
c00025fc:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0002602:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0002609:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0002610:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0002616:	83 ec 08             	sub    $0x8,%esp
c0002619:	6a 02                	push   $0x2
c000261b:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000261e:	50                   	push   %eax
c000261f:	e8 76 53 00 00       	call   c000799a <open>
c0002624:	83 c4 10             	add    $0x10,%esp
c0002627:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000262a:	83 ec 08             	sub    $0x8,%esp
c000262d:	6a 02                	push   $0x2
c000262f:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0002632:	50                   	push   %eax
c0002633:	e8 62 53 00 00       	call   c000799a <open>
c0002638:	83 c4 10             	add    $0x10,%esp
c000263b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000263e:	83 ec 04             	sub    $0x4,%esp
c0002641:	68 80 00 00 00       	push   $0x80
c0002646:	6a 00                	push   $0x0
c0002648:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000264e:	50                   	push   %eax
c000264f:	e8 3c 73 00 00       	call   c0009990 <Memset>
c0002654:	83 c4 10             	add    $0x10,%esp
c0002657:	83 ec 04             	sub    $0x4,%esp
c000265a:	68 80 00 00 00       	push   $0x80
c000265f:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002665:	50                   	push   %eax
c0002666:	ff 75 e0             	pushl  -0x20(%ebp)
c0002669:	e8 81 53 00 00       	call   c00079ef <read>
c000266e:	83 c4 10             	add    $0x10,%esp
c0002671:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002678:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000267f:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0002685:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002688:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000268b:	0f b6 00             	movzbl (%eax),%eax
c000268e:	88 45 db             	mov    %al,-0x25(%ebp)
c0002691:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002694:	0f b6 00             	movzbl (%eax),%eax
c0002697:	3c 20                	cmp    $0x20,%al
c0002699:	74 1d                	je     c00026b8 <simple_shell+0xbf>
c000269b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000269e:	0f b6 00             	movzbl (%eax),%eax
c00026a1:	84 c0                	test   %al,%al
c00026a3:	74 13                	je     c00026b8 <simple_shell+0xbf>
c00026a5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00026a9:	75 0d                	jne    c00026b8 <simple_shell+0xbf>
c00026ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00026ae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00026b1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00026b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00026bb:	0f b6 00             	movzbl (%eax),%eax
c00026be:	3c 20                	cmp    $0x20,%al
c00026c0:	74 0a                	je     c00026cc <simple_shell+0xd3>
c00026c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00026c5:	0f b6 00             	movzbl (%eax),%eax
c00026c8:	84 c0                	test   %al,%al
c00026ca:	75 26                	jne    c00026f2 <simple_shell+0xf9>
c00026cc:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00026d0:	75 20                	jne    c00026f2 <simple_shell+0xf9>
c00026d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026d5:	8d 50 01             	lea    0x1(%eax),%edx
c00026d8:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00026db:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00026de:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c00026e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00026e8:	c6 00 00             	movb   $0x0,(%eax)
c00026eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00026f2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00026f6:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c00026fa:	75 8c                	jne    c0002688 <simple_shell+0x8f>
c00026fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026ff:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0002706:	00 00 00 00 
c000270a:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0002711:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0002717:	83 ec 08             	sub    $0x8,%esp
c000271a:	6a 02                	push   $0x2
c000271c:	50                   	push   %eax
c000271d:	e8 78 52 00 00       	call   c000799a <open>
c0002722:	83 c4 10             	add    $0x10,%esp
c0002725:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002728:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c000272c:	75 54                	jne    c0002782 <simple_shell+0x189>
c000272e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002735:	eb 29                	jmp    c0002760 <simple_shell+0x167>
c0002737:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c000273d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002740:	01 d0                	add    %edx,%eax
c0002742:	0f b6 00             	movzbl (%eax),%eax
c0002745:	0f be c0             	movsbl %al,%eax
c0002748:	83 ec 04             	sub    $0x4,%esp
c000274b:	50                   	push   %eax
c000274c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000274f:	68 c2 92 00 c0       	push   $0xc00092c2
c0002754:	e8 7f 05 00 00       	call   c0002cd8 <Printf>
c0002759:	83 c4 10             	add    $0x10,%esp
c000275c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002760:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0002764:	7e d1                	jle    c0002737 <simple_shell+0x13e>
c0002766:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c000276c:	83 ec 08             	sub    $0x8,%esp
c000276f:	50                   	push   %eax
c0002770:	68 c9 92 00 c0       	push   $0xc00092c9
c0002775:	e8 5e 05 00 00       	call   c0002cd8 <Printf>
c000277a:	83 c4 10             	add    $0x10,%esp
c000277d:	e9 bc fe ff ff       	jmp    c000263e <simple_shell+0x45>
c0002782:	e8 89 53 00 00       	call   c0007b10 <fork>
c0002787:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000278a:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c000278e:	7e 17                	jle    c00027a7 <simple_shell+0x1ae>
c0002790:	83 ec 0c             	sub    $0xc,%esp
c0002793:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0002799:	50                   	push   %eax
c000279a:	e8 0a 53 00 00       	call   c0007aa9 <wait>
c000279f:	83 c4 10             	add    $0x10,%esp
c00027a2:	e9 97 fe ff ff       	jmp    c000263e <simple_shell+0x45>
c00027a7:	83 ec 0c             	sub    $0xc,%esp
c00027aa:	ff 75 d0             	pushl  -0x30(%ebp)
c00027ad:	e8 ab 52 00 00       	call   c0007a5d <close>
c00027b2:	83 c4 10             	add    $0x10,%esp
c00027b5:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00027bb:	83 ec 08             	sub    $0x8,%esp
c00027be:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c00027c4:	52                   	push   %edx
c00027c5:	50                   	push   %eax
c00027c6:	e8 34 54 00 00       	call   c0007bff <execv>
c00027cb:	83 c4 10             	add    $0x10,%esp
c00027ce:	eb fe                	jmp    c00027ce <simple_shell+0x1d5>

c00027d0 <test_split_str>:
c00027d0:	55                   	push   %ebp
c00027d1:	89 e5                	mov    %esp,%ebp
c00027d3:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c00027d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00027e7:	c7 45 ec cf 92 00 c0 	movl   $0xc00092cf,-0x14(%ebp)
c00027ee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00027f2:	75 1a                	jne    c000280e <test_split_str+0x3e>
c00027f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00027f7:	0f b6 00             	movzbl (%eax),%eax
c00027fa:	0f be c0             	movsbl %al,%eax
c00027fd:	83 ec 08             	sub    $0x8,%esp
c0002800:	50                   	push   %eax
c0002801:	68 e0 92 00 c0       	push   $0xc00092e0
c0002806:	e8 cd 04 00 00       	call   c0002cd8 <Printf>
c000280b:	83 c4 10             	add    $0x10,%esp
c000280e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002811:	0f b6 00             	movzbl (%eax),%eax
c0002814:	3c 20                	cmp    $0x20,%al
c0002816:	75 0a                	jne    c0002822 <test_split_str+0x52>
c0002818:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000281b:	0f b6 00             	movzbl (%eax),%eax
c000281e:	84 c0                	test   %al,%al
c0002820:	74 13                	je     c0002835 <test_split_str+0x65>
c0002822:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002826:	75 0d                	jne    c0002835 <test_split_str+0x65>
c0002828:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000282b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000282e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0002835:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002838:	0f b6 00             	movzbl (%eax),%eax
c000283b:	3c 20                	cmp    $0x20,%al
c000283d:	74 0a                	je     c0002849 <test_split_str+0x79>
c000283f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002842:	0f b6 00             	movzbl (%eax),%eax
c0002845:	84 c0                	test   %al,%al
c0002847:	75 26                	jne    c000286f <test_split_str+0x9f>
c0002849:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c000284d:	75 20                	jne    c000286f <test_split_str+0x9f>
c000284f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002852:	8d 50 01             	lea    0x1(%eax),%edx
c0002855:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0002858:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000285b:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0002862:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002865:	c6 00 00             	movb   $0x0,(%eax)
c0002868:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000286f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002873:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002876:	0f b6 00             	movzbl (%eax),%eax
c0002879:	84 c0                	test   %al,%al
c000287b:	0f 85 6d ff ff ff    	jne    c00027ee <test_split_str+0x1e>
c0002881:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002884:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002887:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c000288e:	83 ec 08             	sub    $0x8,%esp
c0002891:	ff 75 f4             	pushl  -0xc(%ebp)
c0002894:	68 e9 92 00 c0       	push   $0xc00092e9
c0002899:	e8 3a 04 00 00       	call   c0002cd8 <Printf>
c000289e:	83 c4 10             	add    $0x10,%esp
c00028a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00028a8:	eb 22                	jmp    c00028cc <test_split_str+0xfc>
c00028aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00028ad:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c00028b4:	83 ec 04             	sub    $0x4,%esp
c00028b7:	50                   	push   %eax
c00028b8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00028bb:	68 00 93 00 c0       	push   $0xc0009300
c00028c0:	e8 13 04 00 00       	call   c0002cd8 <Printf>
c00028c5:	83 c4 10             	add    $0x10,%esp
c00028c8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00028cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00028cf:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c00028d2:	7e d6                	jle    c00028aa <test_split_str+0xda>
c00028d4:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00028da:	83 ec 08             	sub    $0x8,%esp
c00028dd:	68 0f 93 00 c0       	push   $0xc000930f
c00028e2:	50                   	push   %eax
c00028e3:	e8 b1 11 00 00       	call   c0003a99 <strcmp>
c00028e8:	83 c4 10             	add    $0x10,%esp
c00028eb:	85 c0                	test   %eax,%eax
c00028ed:	75 10                	jne    c00028ff <test_split_str+0x12f>
c00028ef:	83 ec 0c             	sub    $0xc,%esp
c00028f2:	68 14 93 00 c0       	push   $0xc0009314
c00028f7:	e8 dc 03 00 00       	call   c0002cd8 <Printf>
c00028fc:	83 c4 10             	add    $0x10,%esp
c00028ff:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0002905:	83 ec 08             	sub    $0x8,%esp
c0002908:	50                   	push   %eax
c0002909:	68 20 93 00 c0       	push   $0xc0009320
c000290e:	e8 c5 03 00 00       	call   c0002cd8 <Printf>
c0002913:	83 c4 10             	add    $0x10,%esp
c0002916:	83 ec 0c             	sub    $0xc,%esp
c0002919:	68 2e 93 00 c0       	push   $0xc000932e
c000291e:	e8 b5 03 00 00       	call   c0002cd8 <Printf>
c0002923:	83 c4 10             	add    $0x10,%esp
c0002926:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000292d:	eb 26                	jmp    c0002955 <test_split_str+0x185>
c000292f:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0002935:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002938:	01 d0                	add    %edx,%eax
c000293a:	0f b6 00             	movzbl (%eax),%eax
c000293d:	0f be c0             	movsbl %al,%eax
c0002940:	83 ec 08             	sub    $0x8,%esp
c0002943:	50                   	push   %eax
c0002944:	68 3d 93 00 c0       	push   $0xc000933d
c0002949:	e8 8a 03 00 00       	call   c0002cd8 <Printf>
c000294e:	83 c4 10             	add    $0x10,%esp
c0002951:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002955:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0002959:	7e d4                	jle    c000292f <test_split_str+0x15f>
c000295b:	c9                   	leave  
c000295c:	c3                   	ret    

c000295d <test_shell>:
c000295d:	55                   	push   %ebp
c000295e:	89 e5                	mov    %esp,%ebp
c0002960:	83 ec 48             	sub    $0x48,%esp
c0002963:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c000296a:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0002971:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0002977:	83 ec 08             	sub    $0x8,%esp
c000297a:	6a 02                	push   $0x2
c000297c:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c000297f:	50                   	push   %eax
c0002980:	e8 15 50 00 00       	call   c000799a <open>
c0002985:	83 c4 10             	add    $0x10,%esp
c0002988:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000298b:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0002992:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0002999:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c00029a0:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c00029a7:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c00029ae:	83 ec 0c             	sub    $0xc,%esp
c00029b1:	8d 45 ce             	lea    -0x32(%ebp),%eax
c00029b4:	50                   	push   %eax
c00029b5:	e8 dc e9 ff ff       	call   c0001396 <untar>
c00029ba:	83 c4 10             	add    $0x10,%esp
c00029bd:	e8 4e 51 00 00       	call   c0007b10 <fork>
c00029c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00029c5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00029c9:	7e 25                	jle    c00029f0 <test_shell+0x93>
c00029cb:	83 ec 0c             	sub    $0xc,%esp
c00029ce:	8d 45 c8             	lea    -0x38(%ebp),%eax
c00029d1:	50                   	push   %eax
c00029d2:	e8 d2 50 00 00       	call   c0007aa9 <wait>
c00029d7:	83 c4 10             	add    $0x10,%esp
c00029da:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00029dd:	83 ec 08             	sub    $0x8,%esp
c00029e0:	50                   	push   %eax
c00029e1:	68 46 93 00 c0       	push   $0xc0009346
c00029e6:	e8 ed 02 00 00       	call   c0002cd8 <Printf>
c00029eb:	83 c4 10             	add    $0x10,%esp
c00029ee:	eb 23                	jmp    c0002a13 <test_shell+0xb6>
c00029f0:	83 ec 0c             	sub    $0xc,%esp
c00029f3:	68 58 93 00 c0       	push   $0xc0009358
c00029f8:	e8 db 02 00 00       	call   c0002cd8 <Printf>
c00029fd:	83 c4 10             	add    $0x10,%esp
c0002a00:	83 ec 0c             	sub    $0xc,%esp
c0002a03:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a06:	e8 52 50 00 00       	call   c0007a5d <close>
c0002a0b:	83 c4 10             	add    $0x10,%esp
c0002a0e:	e8 e6 fb ff ff       	call   c00025f9 <simple_shell>
c0002a13:	83 ec 0c             	sub    $0xc,%esp
c0002a16:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002a19:	50                   	push   %eax
c0002a1a:	e8 8a 50 00 00       	call   c0007aa9 <wait>
c0002a1f:	83 c4 10             	add    $0x10,%esp
c0002a22:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002a25:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002a28:	83 ec 08             	sub    $0x8,%esp
c0002a2b:	50                   	push   %eax
c0002a2c:	68 66 93 00 c0       	push   $0xc0009366
c0002a31:	e8 a2 02 00 00       	call   c0002cd8 <Printf>
c0002a36:	83 c4 10             	add    $0x10,%esp
c0002a39:	eb d8                	jmp    c0002a13 <test_shell+0xb6>

c0002a3b <test_exec>:
c0002a3b:	55                   	push   %ebp
c0002a3c:	89 e5                	mov    %esp,%ebp
c0002a3e:	83 ec 38             	sub    $0x38,%esp
c0002a41:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0002a48:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0002a4f:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0002a55:	83 ec 08             	sub    $0x8,%esp
c0002a58:	6a 02                	push   $0x2
c0002a5a:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0002a5d:	50                   	push   %eax
c0002a5e:	e8 37 4f 00 00       	call   c000799a <open>
c0002a63:	83 c4 10             	add    $0x10,%esp
c0002a66:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002a69:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0002a70:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0002a77:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0002a7e:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0002a85:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0002a8c:	83 ec 0c             	sub    $0xc,%esp
c0002a8f:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0002a92:	50                   	push   %eax
c0002a93:	e8 fe e8 ff ff       	call   c0001396 <untar>
c0002a98:	83 c4 10             	add    $0x10,%esp
c0002a9b:	e8 70 50 00 00       	call   c0007b10 <fork>
c0002aa0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002aa3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0002aa7:	7e 25                	jle    c0002ace <test_exec+0x93>
c0002aa9:	83 ec 0c             	sub    $0xc,%esp
c0002aac:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0002aaf:	50                   	push   %eax
c0002ab0:	e8 f4 4f 00 00       	call   c0007aa9 <wait>
c0002ab5:	83 c4 10             	add    $0x10,%esp
c0002ab8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002abb:	83 ec 08             	sub    $0x8,%esp
c0002abe:	50                   	push   %eax
c0002abf:	68 46 93 00 c0       	push   $0xc0009346
c0002ac4:	e8 0f 02 00 00       	call   c0002cd8 <Printf>
c0002ac9:	83 c4 10             	add    $0x10,%esp
c0002acc:	eb 33                	jmp    c0002b01 <test_exec+0xc6>
c0002ace:	83 ec 0c             	sub    $0xc,%esp
c0002ad1:	68 58 93 00 c0       	push   $0xc0009358
c0002ad6:	e8 fd 01 00 00       	call   c0002cd8 <Printf>
c0002adb:	83 c4 10             	add    $0x10,%esp
c0002ade:	83 ec 0c             	sub    $0xc,%esp
c0002ae1:	6a 00                	push   $0x0
c0002ae3:	68 81 93 00 c0       	push   $0xc0009381
c0002ae8:	68 87 93 00 c0       	push   $0xc0009387
c0002aed:	68 0f 93 00 c0       	push   $0xc000930f
c0002af2:	68 8d 93 00 c0       	push   $0xc000938d
c0002af7:	e8 a8 52 00 00       	call   c0007da4 <execl>
c0002afc:	83 c4 20             	add    $0x20,%esp
c0002aff:	eb fe                	jmp    c0002aff <test_exec+0xc4>
c0002b01:	c9                   	leave  
c0002b02:	c3                   	ret    

c0002b03 <INIT>:
c0002b03:	55                   	push   %ebp
c0002b04:	89 e5                	mov    %esp,%ebp
c0002b06:	83 ec 08             	sub    $0x8,%esp
c0002b09:	e8 4f fe ff ff       	call   c000295d <test_shell>
c0002b0e:	eb fe                	jmp    c0002b0e <INIT+0xb>

c0002b10 <TestA>:
c0002b10:	55                   	push   %ebp
c0002b11:	89 e5                	mov    %esp,%ebp
c0002b13:	66 87 db             	xchg   %bx,%bx
c0002b16:	eb fe                	jmp    c0002b16 <TestA+0x6>

c0002b18 <delay>:
c0002b18:	55                   	push   %ebp
c0002b19:	89 e5                	mov    %esp,%ebp
c0002b1b:	83 ec 10             	sub    $0x10,%esp
c0002b1e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0002b25:	eb 2d                	jmp    c0002b54 <delay+0x3c>
c0002b27:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0002b2e:	eb 1a                	jmp    c0002b4a <delay+0x32>
c0002b30:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002b37:	eb 04                	jmp    c0002b3d <delay+0x25>
c0002b39:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002b3d:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0002b44:	7e f3                	jle    c0002b39 <delay+0x21>
c0002b46:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0002b4a:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0002b4e:	7e e0                	jle    c0002b30 <delay+0x18>
c0002b50:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002b54:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002b57:	3b 45 08             	cmp    0x8(%ebp),%eax
c0002b5a:	7c cb                	jl     c0002b27 <delay+0xf>
c0002b5c:	90                   	nop
c0002b5d:	c9                   	leave  
c0002b5e:	c3                   	ret    

c0002b5f <TestB>:
c0002b5f:	55                   	push   %ebp
c0002b60:	89 e5                	mov    %esp,%ebp
c0002b62:	83 ec 18             	sub    $0x18,%esp
c0002b65:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002b6c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0002b70:	77 16                	ja     c0002b88 <TestB+0x29>
c0002b72:	e8 80 0d 00 00       	call   c00038f7 <get_ticks_ipc>
c0002b77:	83 ec 08             	sub    $0x8,%esp
c0002b7a:	50                   	push   %eax
c0002b7b:	68 93 93 00 c0       	push   $0xc0009393
c0002b80:	e8 53 01 00 00       	call   c0002cd8 <Printf>
c0002b85:	83 c4 10             	add    $0x10,%esp
c0002b88:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002b8c:	eb de                	jmp    c0002b6c <TestB+0xd>

c0002b8e <TestC>:
c0002b8e:	55                   	push   %ebp
c0002b8f:	89 e5                	mov    %esp,%ebp
c0002b91:	83 ec 18             	sub    $0x18,%esp
c0002b94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002b9b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0002b9f:	77 1a                	ja     c0002bbb <TestC+0x2d>
c0002ba1:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0002ba8:	83 ec 08             	sub    $0x8,%esp
c0002bab:	ff 75 f0             	pushl  -0x10(%ebp)
c0002bae:	68 9a 93 00 c0       	push   $0xc000939a
c0002bb3:	e8 20 01 00 00       	call   c0002cd8 <Printf>
c0002bb8:	83 c4 10             	add    $0x10,%esp
c0002bbb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002bbf:	eb da                	jmp    c0002b9b <TestC+0xd>

c0002bc1 <sys_get_ticks>:
c0002bc1:	55                   	push   %ebp
c0002bc2:	89 e5                	mov    %esp,%ebp
c0002bc4:	a1 20 f6 00 c0       	mov    0xc000f620,%eax
c0002bc9:	5d                   	pop    %ebp
c0002bca:	c3                   	ret    

c0002bcb <sys_write>:
c0002bcb:	55                   	push   %ebp
c0002bcc:	89 e5                	mov    %esp,%ebp
c0002bce:	83 ec 18             	sub    $0x18,%esp
c0002bd1:	8b 45 10             	mov    0x10(%ebp),%eax
c0002bd4:	8b 40 24             	mov    0x24(%eax),%eax
c0002bd7:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0002bdd:	05 00 d5 00 c0       	add    $0xc000d500,%eax
c0002be2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002be5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002be8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002beb:	8b 45 08             	mov    0x8(%ebp),%eax
c0002bee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002bf1:	eb 20                	jmp    c0002c13 <sys_write+0x48>
c0002bf3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002bf6:	0f b6 00             	movzbl (%eax),%eax
c0002bf9:	0f b6 c0             	movzbl %al,%eax
c0002bfc:	83 ec 08             	sub    $0x8,%esp
c0002bff:	50                   	push   %eax
c0002c00:	ff 75 ec             	pushl  -0x14(%ebp)
c0002c03:	e8 9d 41 00 00       	call   c0006da5 <out_char>
c0002c08:	83 c4 10             	add    $0x10,%esp
c0002c0b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002c0f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0002c13:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002c17:	7f da                	jg     c0002bf3 <sys_write+0x28>
c0002c19:	90                   	nop
c0002c1a:	c9                   	leave  
c0002c1b:	c3                   	ret    

c0002c1c <milli_delay>:
c0002c1c:	55                   	push   %ebp
c0002c1d:	89 e5                	mov    %esp,%ebp
c0002c1f:	83 ec 18             	sub    $0x18,%esp
c0002c22:	e8 d0 0c 00 00       	call   c00038f7 <get_ticks_ipc>
c0002c27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002c2a:	90                   	nop
c0002c2b:	e8 c7 0c 00 00       	call   c00038f7 <get_ticks_ipc>
c0002c30:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0002c33:	89 c1                	mov    %eax,%ecx
c0002c35:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0002c3a:	89 c8                	mov    %ecx,%eax
c0002c3c:	f7 ea                	imul   %edx
c0002c3e:	c1 fa 05             	sar    $0x5,%edx
c0002c41:	89 c8                	mov    %ecx,%eax
c0002c43:	c1 f8 1f             	sar    $0x1f,%eax
c0002c46:	29 c2                	sub    %eax,%edx
c0002c48:	89 d0                	mov    %edx,%eax
c0002c4a:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0002c50:	39 45 08             	cmp    %eax,0x8(%ebp)
c0002c53:	77 d6                	ja     c0002c2b <milli_delay+0xf>
c0002c55:	90                   	nop
c0002c56:	c9                   	leave  
c0002c57:	c3                   	ret    

c0002c58 <TaskSys>:
c0002c58:	55                   	push   %ebp
c0002c59:	89 e5                	mov    %esp,%ebp
c0002c5b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0002c61:	66 87 db             	xchg   %bx,%bx
c0002c64:	83 ec 0c             	sub    $0xc,%esp
c0002c67:	68 a7 93 00 c0       	push   $0xc00093a7
c0002c6c:	e8 1b e4 ff ff       	call   c000108c <disp_str>
c0002c71:	83 c4 10             	add    $0x10,%esp
c0002c74:	83 ec 04             	sub    $0x4,%esp
c0002c77:	6a 6c                	push   $0x6c
c0002c79:	6a 00                	push   $0x0
c0002c7b:	8d 45 80             	lea    -0x80(%ebp),%eax
c0002c7e:	50                   	push   %eax
c0002c7f:	e8 0c 6d 00 00       	call   c0009990 <Memset>
c0002c84:	83 c4 10             	add    $0x10,%esp
c0002c87:	83 ec 08             	sub    $0x8,%esp
c0002c8a:	6a 0b                	push   $0xb
c0002c8c:	8d 45 80             	lea    -0x80(%ebp),%eax
c0002c8f:	50                   	push   %eax
c0002c90:	e8 49 1b 00 00       	call   c00047de <receive_msg>
c0002c95:	83 c4 10             	add    $0x10,%esp
c0002c98:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002c9b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002c9f:	75 34                	jne    c0002cd5 <TaskSys+0x7d>
c0002ca1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002ca4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002ca7:	8b 45 80             	mov    -0x80(%ebp),%eax
c0002caa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002cad:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0002cb1:	75 1f                	jne    c0002cd2 <TaskSys+0x7a>
c0002cb3:	a1 20 f6 00 c0       	mov    0xc000f620,%eax
c0002cb8:	89 45 88             	mov    %eax,-0x78(%ebp)
c0002cbb:	83 ec 08             	sub    $0x8,%esp
c0002cbe:	ff 75 ec             	pushl  -0x14(%ebp)
c0002cc1:	8d 45 80             	lea    -0x80(%ebp),%eax
c0002cc4:	50                   	push   %eax
c0002cc5:	e8 ee 1a 00 00       	call   c00047b8 <send_msg>
c0002cca:	83 c4 10             	add    $0x10,%esp
c0002ccd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002cd0:	eb 01                	jmp    c0002cd3 <TaskSys+0x7b>
c0002cd2:	90                   	nop
c0002cd3:	eb 9f                	jmp    c0002c74 <TaskSys+0x1c>
c0002cd5:	90                   	nop
c0002cd6:	c9                   	leave  
c0002cd7:	c3                   	ret    

c0002cd8 <Printf>:
c0002cd8:	55                   	push   %ebp
c0002cd9:	89 e5                	mov    %esp,%ebp
c0002cdb:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0002ce1:	83 ec 04             	sub    $0x4,%esp
c0002ce4:	68 00 01 00 00       	push   $0x100
c0002ce9:	6a 00                	push   $0x0
c0002ceb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0002cf1:	50                   	push   %eax
c0002cf2:	e8 99 6c 00 00       	call   c0009990 <Memset>
c0002cf7:	83 c4 10             	add    $0x10,%esp
c0002cfa:	8d 45 0c             	lea    0xc(%ebp),%eax
c0002cfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002d00:	8b 45 08             	mov    0x8(%ebp),%eax
c0002d03:	83 ec 04             	sub    $0x4,%esp
c0002d06:	ff 75 f4             	pushl  -0xc(%ebp)
c0002d09:	50                   	push   %eax
c0002d0a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0002d10:	50                   	push   %eax
c0002d11:	e8 20 00 00 00       	call   c0002d36 <vsprintf>
c0002d16:	83 c4 10             	add    $0x10,%esp
c0002d19:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002d1c:	83 ec 04             	sub    $0x4,%esp
c0002d1f:	ff 75 f0             	pushl  -0x10(%ebp)
c0002d22:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0002d28:	50                   	push   %eax
c0002d29:	6a 00                	push   $0x0
c0002d2b:	e8 f6 4c 00 00       	call   c0007a26 <write>
c0002d30:	83 c4 10             	add    $0x10,%esp
c0002d33:	90                   	nop
c0002d34:	c9                   	leave  
c0002d35:	c3                   	ret    

c0002d36 <vsprintf>:
c0002d36:	55                   	push   %ebp
c0002d37:	89 e5                	mov    %esp,%ebp
c0002d39:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0002d3f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0002d45:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0002d4b:	83 ec 04             	sub    $0x4,%esp
c0002d4e:	6a 40                	push   $0x40
c0002d50:	6a 00                	push   $0x0
c0002d52:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0002d58:	50                   	push   %eax
c0002d59:	e8 32 6c 00 00       	call   c0009990 <Memset>
c0002d5e:	83 c4 10             	add    $0x10,%esp
c0002d61:	8b 45 10             	mov    0x10(%ebp),%eax
c0002d64:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002d67:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002d6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0002d71:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002d74:	e9 53 01 00 00       	jmp    c0002ecc <vsprintf+0x196>
c0002d79:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002d7c:	0f b6 00             	movzbl (%eax),%eax
c0002d7f:	3c 25                	cmp    $0x25,%al
c0002d81:	74 16                	je     c0002d99 <vsprintf+0x63>
c0002d83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002d86:	8d 50 01             	lea    0x1(%eax),%edx
c0002d89:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0002d8c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002d8f:	0f b6 12             	movzbl (%edx),%edx
c0002d92:	88 10                	mov    %dl,(%eax)
c0002d94:	e9 2f 01 00 00       	jmp    c0002ec8 <vsprintf+0x192>
c0002d99:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0002d9d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002da0:	0f b6 00             	movzbl (%eax),%eax
c0002da3:	0f be c0             	movsbl %al,%eax
c0002da6:	83 f8 64             	cmp    $0x64,%eax
c0002da9:	74 26                	je     c0002dd1 <vsprintf+0x9b>
c0002dab:	83 f8 64             	cmp    $0x64,%eax
c0002dae:	7f 0e                	jg     c0002dbe <vsprintf+0x88>
c0002db0:	83 f8 63             	cmp    $0x63,%eax
c0002db3:	0f 84 f2 00 00 00    	je     c0002eab <vsprintf+0x175>
c0002db9:	e9 0a 01 00 00       	jmp    c0002ec8 <vsprintf+0x192>
c0002dbe:	83 f8 73             	cmp    $0x73,%eax
c0002dc1:	0f 84 b0 00 00 00    	je     c0002e77 <vsprintf+0x141>
c0002dc7:	83 f8 78             	cmp    $0x78,%eax
c0002dca:	74 5d                	je     c0002e29 <vsprintf+0xf3>
c0002dcc:	e9 f7 00 00 00       	jmp    c0002ec8 <vsprintf+0x192>
c0002dd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002dd4:	8b 00                	mov    (%eax),%eax
c0002dd6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002dd9:	83 ec 04             	sub    $0x4,%esp
c0002ddc:	6a 0a                	push   $0xa
c0002dde:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0002de4:	50                   	push   %eax
c0002de5:	ff 75 e8             	pushl  -0x18(%ebp)
c0002de8:	e8 55 0b 00 00       	call   c0003942 <itoa>
c0002ded:	83 c4 10             	add    $0x10,%esp
c0002df0:	83 ec 08             	sub    $0x8,%esp
c0002df3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0002df9:	50                   	push   %eax
c0002dfa:	ff 75 f4             	pushl  -0xc(%ebp)
c0002dfd:	e8 ad 6b 00 00       	call   c00099af <Strcpy>
c0002e02:	83 c4 10             	add    $0x10,%esp
c0002e05:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0002e09:	83 ec 0c             	sub    $0xc,%esp
c0002e0c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0002e12:	50                   	push   %eax
c0002e13:	e8 b1 6b 00 00       	call   c00099c9 <Strlen>
c0002e18:	83 c4 10             	add    $0x10,%esp
c0002e1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002e1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002e21:	01 45 f4             	add    %eax,-0xc(%ebp)
c0002e24:	e9 9f 00 00 00       	jmp    c0002ec8 <vsprintf+0x192>
c0002e29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002e2c:	8b 00                	mov    (%eax),%eax
c0002e2e:	83 ec 08             	sub    $0x8,%esp
c0002e31:	50                   	push   %eax
c0002e32:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0002e38:	50                   	push   %eax
c0002e39:	e8 62 e7 ff ff       	call   c00015a0 <atoi>
c0002e3e:	83 c4 10             	add    $0x10,%esp
c0002e41:	83 ec 08             	sub    $0x8,%esp
c0002e44:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0002e4a:	50                   	push   %eax
c0002e4b:	ff 75 f4             	pushl  -0xc(%ebp)
c0002e4e:	e8 5c 6b 00 00       	call   c00099af <Strcpy>
c0002e53:	83 c4 10             	add    $0x10,%esp
c0002e56:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0002e5a:	83 ec 0c             	sub    $0xc,%esp
c0002e5d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0002e63:	50                   	push   %eax
c0002e64:	e8 60 6b 00 00       	call   c00099c9 <Strlen>
c0002e69:	83 c4 10             	add    $0x10,%esp
c0002e6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002e6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002e72:	01 45 f4             	add    %eax,-0xc(%ebp)
c0002e75:	eb 51                	jmp    c0002ec8 <vsprintf+0x192>
c0002e77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002e7a:	8b 00                	mov    (%eax),%eax
c0002e7c:	83 ec 08             	sub    $0x8,%esp
c0002e7f:	50                   	push   %eax
c0002e80:	ff 75 f4             	pushl  -0xc(%ebp)
c0002e83:	e8 27 6b 00 00       	call   c00099af <Strcpy>
c0002e88:	83 c4 10             	add    $0x10,%esp
c0002e8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002e8e:	8b 00                	mov    (%eax),%eax
c0002e90:	83 ec 0c             	sub    $0xc,%esp
c0002e93:	50                   	push   %eax
c0002e94:	e8 30 6b 00 00       	call   c00099c9 <Strlen>
c0002e99:	83 c4 10             	add    $0x10,%esp
c0002e9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002e9f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0002ea3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ea6:	01 45 f4             	add    %eax,-0xc(%ebp)
c0002ea9:	eb 1d                	jmp    c0002ec8 <vsprintf+0x192>
c0002eab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002eae:	0f b6 10             	movzbl (%eax),%edx
c0002eb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002eb4:	88 10                	mov    %dl,(%eax)
c0002eb6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0002eba:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0002ec1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ec4:	01 45 f4             	add    %eax,-0xc(%ebp)
c0002ec7:	90                   	nop
c0002ec8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0002ecc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002ecf:	0f b6 00             	movzbl (%eax),%eax
c0002ed2:	84 c0                	test   %al,%al
c0002ed4:	0f 85 9f fe ff ff    	jne    c0002d79 <vsprintf+0x43>
c0002eda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002edd:	2b 45 08             	sub    0x8(%ebp),%eax
c0002ee0:	c9                   	leave  
c0002ee1:	c3                   	ret    

c0002ee2 <printx>:
c0002ee2:	55                   	push   %ebp
c0002ee3:	89 e5                	mov    %esp,%ebp
c0002ee5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0002eeb:	8d 45 0c             	lea    0xc(%ebp),%eax
c0002eee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002ef1:	8b 45 08             	mov    0x8(%ebp),%eax
c0002ef4:	83 ec 04             	sub    $0x4,%esp
c0002ef7:	ff 75 f4             	pushl  -0xc(%ebp)
c0002efa:	50                   	push   %eax
c0002efb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0002f01:	50                   	push   %eax
c0002f02:	e8 2f fe ff ff       	call   c0002d36 <vsprintf>
c0002f07:	83 c4 10             	add    $0x10,%esp
c0002f0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002f0d:	83 ec 08             	sub    $0x8,%esp
c0002f10:	ff 75 f0             	pushl  -0x10(%ebp)
c0002f13:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0002f19:	50                   	push   %eax
c0002f1a:	e8 79 18 00 00       	call   c0004798 <write_debug>
c0002f1f:	83 c4 10             	add    $0x10,%esp
c0002f22:	90                   	nop
c0002f23:	c9                   	leave  
c0002f24:	c3                   	ret    

c0002f25 <sys_printx>:
c0002f25:	55                   	push   %ebp
c0002f26:	89 e5                	mov    %esp,%ebp
c0002f28:	83 ec 28             	sub    $0x28,%esp
c0002f2b:	a1 a0 ce 00 c0       	mov    0xc000cea0,%eax
c0002f30:	85 c0                	test   %eax,%eax
c0002f32:	75 20                	jne    c0002f54 <sys_printx+0x2f>
c0002f34:	8b 45 10             	mov    0x10(%ebp),%eax
c0002f37:	8b 40 78             	mov    0x78(%eax),%eax
c0002f3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002f3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f40:	83 ec 08             	sub    $0x8,%esp
c0002f43:	ff 75 10             	pushl  0x10(%ebp)
c0002f46:	50                   	push   %eax
c0002f47:	e8 a3 39 00 00       	call   c00068ef <Seg2PhyAddrLDT>
c0002f4c:	83 c4 10             	add    $0x10,%esp
c0002f4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002f52:	eb 19                	jmp    c0002f6d <sys_printx+0x48>
c0002f54:	a1 a0 ce 00 c0       	mov    0xc000cea0,%eax
c0002f59:	85 c0                	test   %eax,%eax
c0002f5b:	74 10                	je     c0002f6d <sys_printx+0x48>
c0002f5d:	83 ec 0c             	sub    $0xc,%esp
c0002f60:	6a 30                	push   $0x30
c0002f62:	e8 47 39 00 00       	call   c00068ae <Seg2PhyAddr>
c0002f67:	83 c4 10             	add    $0x10,%esp
c0002f6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002f6d:	8b 55 08             	mov    0x8(%ebp),%edx
c0002f70:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002f73:	01 d0                	add    %edx,%eax
c0002f75:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002f78:	8b 45 10             	mov    0x10(%ebp),%eax
c0002f7b:	8b 40 24             	mov    0x24(%eax),%eax
c0002f7e:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0002f84:	05 00 d5 00 c0       	add    $0xc000d500,%eax
c0002f89:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002f8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002f92:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002f95:	0f b6 00             	movzbl (%eax),%eax
c0002f98:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0002f9b:	eb 3a                	jmp    c0002fd7 <sys_printx+0xb2>
c0002f9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002fa0:	0f b6 00             	movzbl (%eax),%eax
c0002fa3:	3c 3b                	cmp    $0x3b,%al
c0002fa5:	74 0a                	je     c0002fb1 <sys_printx+0x8c>
c0002fa7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002faa:	0f b6 00             	movzbl (%eax),%eax
c0002fad:	3c 3a                	cmp    $0x3a,%al
c0002faf:	75 06                	jne    c0002fb7 <sys_printx+0x92>
c0002fb1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002fb5:	eb 20                	jmp    c0002fd7 <sys_printx+0xb2>
c0002fb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002fba:	0f b6 00             	movzbl (%eax),%eax
c0002fbd:	0f b6 c0             	movzbl %al,%eax
c0002fc0:	83 ec 08             	sub    $0x8,%esp
c0002fc3:	50                   	push   %eax
c0002fc4:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002fc7:	e8 d9 3d 00 00       	call   c0006da5 <out_char>
c0002fcc:	83 c4 10             	add    $0x10,%esp
c0002fcf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002fd3:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0002fd7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0002fdb:	7f c0                	jg     c0002f9d <sys_printx+0x78>
c0002fdd:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0002fe1:	75 11                	jne    c0002ff4 <sys_printx+0xcf>
c0002fe3:	a1 a0 ce 00 c0       	mov    0xc000cea0,%eax
c0002fe8:	85 c0                	test   %eax,%eax
c0002fea:	74 15                	je     c0003001 <sys_printx+0xdc>
c0002fec:	e8 e5 e2 ff ff       	call   c00012d6 <disable_int>
c0002ff1:	f4                   	hlt    
c0002ff2:	eb 0d                	jmp    c0003001 <sys_printx+0xdc>
c0002ff4:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0002ff8:	75 07                	jne    c0003001 <sys_printx+0xdc>
c0002ffa:	e8 d7 e2 ff ff       	call   c00012d6 <disable_int>
c0002fff:	f4                   	hlt    
c0003000:	90                   	nop
c0003001:	90                   	nop
c0003002:	c9                   	leave  
c0003003:	c3                   	ret    

c0003004 <spin>:
c0003004:	55                   	push   %ebp
c0003005:	89 e5                	mov    %esp,%ebp
c0003007:	eb fe                	jmp    c0003007 <spin+0x3>

c0003009 <panic>:
c0003009:	55                   	push   %ebp
c000300a:	89 e5                	mov    %esp,%ebp
c000300c:	83 ec 08             	sub    $0x8,%esp
c000300f:	83 ec 04             	sub    $0x4,%esp
c0003012:	ff 75 08             	pushl  0x8(%ebp)
c0003015:	6a 3a                	push   $0x3a
c0003017:	68 b0 93 00 c0       	push   $0xc00093b0
c000301c:	e8 c1 fe ff ff       	call   c0002ee2 <printx>
c0003021:	83 c4 10             	add    $0x10,%esp
c0003024:	90                   	nop
c0003025:	c9                   	leave  
c0003026:	c3                   	ret    

c0003027 <assertion_failure>:
c0003027:	55                   	push   %ebp
c0003028:	89 e5                	mov    %esp,%ebp
c000302a:	83 ec 08             	sub    $0x8,%esp
c000302d:	83 ec 08             	sub    $0x8,%esp
c0003030:	ff 75 14             	pushl  0x14(%ebp)
c0003033:	ff 75 10             	pushl  0x10(%ebp)
c0003036:	ff 75 0c             	pushl  0xc(%ebp)
c0003039:	ff 75 08             	pushl  0x8(%ebp)
c000303c:	6a 3b                	push   $0x3b
c000303e:	68 b8 93 00 c0       	push   $0xc00093b8
c0003043:	e8 9a fe ff ff       	call   c0002ee2 <printx>
c0003048:	83 c4 20             	add    $0x20,%esp
c000304b:	83 ec 0c             	sub    $0xc,%esp
c000304e:	68 eb 93 00 c0       	push   $0xc00093eb
c0003053:	e8 ac ff ff ff       	call   c0003004 <spin>
c0003058:	83 c4 10             	add    $0x10,%esp
c000305b:	90                   	nop
c000305c:	c9                   	leave  
c000305d:	c3                   	ret    

c000305e <dead_lock>:
c000305e:	55                   	push   %ebp
c000305f:	89 e5                	mov    %esp,%ebp
c0003061:	b8 00 00 00 00       	mov    $0x0,%eax
c0003066:	5d                   	pop    %ebp
c0003067:	c3                   	ret    

c0003068 <sys_send_msg>:
c0003068:	55                   	push   %ebp
c0003069:	89 e5                	mov    %esp,%ebp
c000306b:	83 ec 48             	sub    $0x48,%esp
c000306e:	83 ec 0c             	sub    $0xc,%esp
c0003071:	ff 75 0c             	pushl  0xc(%ebp)
c0003074:	e8 8d 37 00 00       	call   c0006806 <pid2proc>
c0003079:	83 c4 10             	add    $0x10,%esp
c000307c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000307f:	83 ec 0c             	sub    $0xc,%esp
c0003082:	ff 75 10             	pushl  0x10(%ebp)
c0003085:	e8 98 37 00 00       	call   c0006822 <proc2pid>
c000308a:	83 c4 10             	add    $0x10,%esp
c000308d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003090:	8b 45 10             	mov    0x10(%ebp),%eax
c0003093:	8b 40 78             	mov    0x78(%eax),%eax
c0003096:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003099:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000309c:	83 ec 08             	sub    $0x8,%esp
c000309f:	ff 75 10             	pushl  0x10(%ebp)
c00030a2:	50                   	push   %eax
c00030a3:	e8 47 38 00 00       	call   c00068ef <Seg2PhyAddrLDT>
c00030a8:	83 c4 10             	add    $0x10,%esp
c00030ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00030ae:	8b 55 08             	mov    0x8(%ebp),%edx
c00030b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00030b4:	01 d0                	add    %edx,%eax
c00030b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00030b9:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c00030c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00030c3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00030c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00030c9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00030cc:	89 10                	mov    %edx,(%eax)
c00030ce:	83 ec 08             	sub    $0x8,%esp
c00030d1:	ff 75 0c             	pushl  0xc(%ebp)
c00030d4:	ff 75 e8             	pushl  -0x18(%ebp)
c00030d7:	e8 82 ff ff ff       	call   c000305e <dead_lock>
c00030dc:	83 c4 10             	add    $0x10,%esp
c00030df:	83 f8 01             	cmp    $0x1,%eax
c00030e2:	75 10                	jne    c00030f4 <sys_send_msg+0x8c>
c00030e4:	83 ec 0c             	sub    $0xc,%esp
c00030e7:	68 f7 93 00 c0       	push   $0xc00093f7
c00030ec:	e8 18 ff ff ff       	call   c0003009 <panic>
c00030f1:	83 c4 10             	add    $0x10,%esp
c00030f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030f7:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00030fb:	3c 02                	cmp    $0x2,%al
c00030fd:	0f 85 78 01 00 00    	jne    c000327b <sys_send_msg+0x213>
c0003103:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003106:	8b 40 54             	mov    0x54(%eax),%eax
c0003109:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000310c:	74 0f                	je     c000311d <sys_send_msg+0xb5>
c000310e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003111:	8b 40 54             	mov    0x54(%eax),%eax
c0003114:	83 f8 0b             	cmp    $0xb,%eax
c0003117:	0f 85 5e 01 00 00    	jne    c000327b <sys_send_msg+0x213>
c000311d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003120:	8b 40 78             	mov    0x78(%eax),%eax
c0003123:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003126:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003129:	83 ec 08             	sub    $0x8,%esp
c000312c:	ff 75 ec             	pushl  -0x14(%ebp)
c000312f:	50                   	push   %eax
c0003130:	e8 ba 37 00 00       	call   c00068ef <Seg2PhyAddrLDT>
c0003135:	83 c4 10             	add    $0x10,%esp
c0003138:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000313b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000313e:	8b 40 4c             	mov    0x4c(%eax),%eax
c0003141:	89 c2                	mov    %eax,%edx
c0003143:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0003146:	01 d0                	add    %edx,%eax
c0003148:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000314b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000314e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003151:	83 ec 04             	sub    $0x4,%esp
c0003154:	ff 75 d8             	pushl  -0x28(%ebp)
c0003157:	52                   	push   %edx
c0003158:	50                   	push   %eax
c0003159:	e8 04 68 00 00       	call   c0009962 <Memcpy>
c000315e:	83 c4 10             	add    $0x10,%esp
c0003161:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003164:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c000316b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000316e:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c0003172:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003175:	c7 40 54 1a 00 00 00 	movl   $0x1a,0x54(%eax)
c000317c:	83 ec 0c             	sub    $0xc,%esp
c000317f:	ff 75 ec             	pushl  -0x14(%ebp)
c0003182:	e8 3c 07 00 00       	call   c00038c3 <unblock>
c0003187:	83 c4 10             	add    $0x10,%esp
c000318a:	8b 45 10             	mov    0x10(%ebp),%eax
c000318d:	8b 40 4c             	mov    0x4c(%eax),%eax
c0003190:	85 c0                	test   %eax,%eax
c0003192:	74 1c                	je     c00031b0 <sys_send_msg+0x148>
c0003194:	68 2a 05 00 00       	push   $0x52a
c0003199:	68 02 94 00 c0       	push   $0xc0009402
c000319e:	68 02 94 00 c0       	push   $0xc0009402
c00031a3:	68 09 94 00 c0       	push   $0xc0009409
c00031a8:	e8 7a fe ff ff       	call   c0003027 <assertion_failure>
c00031ad:	83 c4 10             	add    $0x10,%esp
c00031b0:	8b 45 10             	mov    0x10(%ebp),%eax
c00031b3:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00031b7:	84 c0                	test   %al,%al
c00031b9:	74 1c                	je     c00031d7 <sys_send_msg+0x16f>
c00031bb:	68 2b 05 00 00       	push   $0x52b
c00031c0:	68 02 94 00 c0       	push   $0xc0009402
c00031c5:	68 02 94 00 c0       	push   $0xc0009402
c00031ca:	68 1c 94 00 c0       	push   $0xc000941c
c00031cf:	e8 53 fe ff ff       	call   c0003027 <assertion_failure>
c00031d4:	83 c4 10             	add    $0x10,%esp
c00031d7:	8b 45 10             	mov    0x10(%ebp),%eax
c00031da:	8b 40 50             	mov    0x50(%eax),%eax
c00031dd:	83 f8 1a             	cmp    $0x1a,%eax
c00031e0:	74 1c                	je     c00031fe <sys_send_msg+0x196>
c00031e2:	68 2c 05 00 00       	push   $0x52c
c00031e7:	68 02 94 00 c0       	push   $0xc0009402
c00031ec:	68 02 94 00 c0       	push   $0xc0009402
c00031f1:	68 30 94 00 c0       	push   $0xc0009430
c00031f6:	e8 2c fe ff ff       	call   c0003027 <assertion_failure>
c00031fb:	83 c4 10             	add    $0x10,%esp
c00031fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003201:	8b 40 4c             	mov    0x4c(%eax),%eax
c0003204:	85 c0                	test   %eax,%eax
c0003206:	74 1c                	je     c0003224 <sys_send_msg+0x1bc>
c0003208:	68 2e 05 00 00       	push   $0x52e
c000320d:	68 02 94 00 c0       	push   $0xc0009402
c0003212:	68 02 94 00 c0       	push   $0xc0009402
c0003217:	68 4d 94 00 c0       	push   $0xc000944d
c000321c:	e8 06 fe ff ff       	call   c0003027 <assertion_failure>
c0003221:	83 c4 10             	add    $0x10,%esp
c0003224:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003227:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c000322b:	84 c0                	test   %al,%al
c000322d:	74 1c                	je     c000324b <sys_send_msg+0x1e3>
c000322f:	68 2f 05 00 00       	push   $0x52f
c0003234:	68 02 94 00 c0       	push   $0xc0009402
c0003239:	68 02 94 00 c0       	push   $0xc0009402
c000323e:	68 62 94 00 c0       	push   $0xc0009462
c0003243:	e8 df fd ff ff       	call   c0003027 <assertion_failure>
c0003248:	83 c4 10             	add    $0x10,%esp
c000324b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000324e:	8b 40 54             	mov    0x54(%eax),%eax
c0003251:	83 f8 1a             	cmp    $0x1a,%eax
c0003254:	0f 84 1e 01 00 00    	je     c0003378 <sys_send_msg+0x310>
c000325a:	68 30 05 00 00       	push   $0x530
c000325f:	68 02 94 00 c0       	push   $0xc0009402
c0003264:	68 02 94 00 c0       	push   $0xc0009402
c0003269:	68 78 94 00 c0       	push   $0xc0009478
c000326e:	e8 b4 fd ff ff       	call   c0003027 <assertion_failure>
c0003273:	83 c4 10             	add    $0x10,%esp
c0003276:	e9 fd 00 00 00       	jmp    c0003378 <sys_send_msg+0x310>
c000327b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003282:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003285:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003288:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000328b:	8b 40 58             	mov    0x58(%eax),%eax
c000328e:	85 c0                	test   %eax,%eax
c0003290:	75 15                	jne    c00032a7 <sys_send_msg+0x23f>
c0003292:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003295:	8b 55 10             	mov    0x10(%ebp),%edx
c0003298:	89 50 58             	mov    %edx,0x58(%eax)
c000329b:	8b 45 10             	mov    0x10(%ebp),%eax
c000329e:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c00032a5:	eb 33                	jmp    c00032da <sys_send_msg+0x272>
c00032a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032aa:	8b 40 58             	mov    0x58(%eax),%eax
c00032ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00032b0:	eb 0f                	jmp    c00032c1 <sys_send_msg+0x259>
c00032b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00032b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00032b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00032bb:	8b 40 5c             	mov    0x5c(%eax),%eax
c00032be:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00032c1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00032c5:	75 eb                	jne    c00032b2 <sys_send_msg+0x24a>
c00032c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032ca:	8b 55 10             	mov    0x10(%ebp),%edx
c00032cd:	89 50 5c             	mov    %edx,0x5c(%eax)
c00032d0:	8b 45 10             	mov    0x10(%ebp),%eax
c00032d3:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c00032da:	8b 45 10             	mov    0x10(%ebp),%eax
c00032dd:	8b 55 08             	mov    0x8(%ebp),%edx
c00032e0:	89 50 4c             	mov    %edx,0x4c(%eax)
c00032e3:	8b 45 10             	mov    0x10(%ebp),%eax
c00032e6:	8b 55 0c             	mov    0xc(%ebp),%edx
c00032e9:	89 50 50             	mov    %edx,0x50(%eax)
c00032ec:	8b 45 10             	mov    0x10(%ebp),%eax
c00032ef:	c6 40 48 01          	movb   $0x1,0x48(%eax)
c00032f3:	8b 45 10             	mov    0x10(%ebp),%eax
c00032f6:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00032fa:	3c 01                	cmp    $0x1,%al
c00032fc:	74 1c                	je     c000331a <sys_send_msg+0x2b2>
c00032fe:	68 51 05 00 00       	push   $0x551
c0003303:	68 02 94 00 c0       	push   $0xc0009402
c0003308:	68 02 94 00 c0       	push   $0xc0009402
c000330d:	68 9c 94 00 c0       	push   $0xc000949c
c0003312:	e8 10 fd ff ff       	call   c0003027 <assertion_failure>
c0003317:	83 c4 10             	add    $0x10,%esp
c000331a:	8b 45 10             	mov    0x10(%ebp),%eax
c000331d:	8b 40 50             	mov    0x50(%eax),%eax
c0003320:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003323:	74 1c                	je     c0003341 <sys_send_msg+0x2d9>
c0003325:	68 52 05 00 00       	push   $0x552
c000332a:	68 02 94 00 c0       	push   $0xc0009402
c000332f:	68 02 94 00 c0       	push   $0xc0009402
c0003334:	68 b8 94 00 c0       	push   $0xc00094b8
c0003339:	e8 e9 fc ff ff       	call   c0003027 <assertion_failure>
c000333e:	83 c4 10             	add    $0x10,%esp
c0003341:	8b 45 10             	mov    0x10(%ebp),%eax
c0003344:	8b 40 4c             	mov    0x4c(%eax),%eax
c0003347:	39 45 08             	cmp    %eax,0x8(%ebp)
c000334a:	74 1c                	je     c0003368 <sys_send_msg+0x300>
c000334c:	68 53 05 00 00       	push   $0x553
c0003351:	68 02 94 00 c0       	push   $0xc0009402
c0003356:	68 02 94 00 c0       	push   $0xc0009402
c000335b:	68 da 94 00 c0       	push   $0xc00094da
c0003360:	e8 c2 fc ff ff       	call   c0003027 <assertion_failure>
c0003365:	83 c4 10             	add    $0x10,%esp
c0003368:	83 ec 0c             	sub    $0xc,%esp
c000336b:	ff 75 10             	pushl  0x10(%ebp)
c000336e:	e8 3e 05 00 00       	call   c00038b1 <block>
c0003373:	83 c4 10             	add    $0x10,%esp
c0003376:	eb 01                	jmp    c0003379 <sys_send_msg+0x311>
c0003378:	90                   	nop
c0003379:	b8 00 00 00 00       	mov    $0x0,%eax
c000337e:	c9                   	leave  
c000337f:	c3                   	ret    

c0003380 <sys_receive_msg>:
c0003380:	55                   	push   %ebp
c0003381:	89 e5                	mov    %esp,%ebp
c0003383:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0003389:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003390:	83 ec 0c             	sub    $0xc,%esp
c0003393:	ff 75 0c             	pushl  0xc(%ebp)
c0003396:	e8 6b 34 00 00       	call   c0006806 <pid2proc>
c000339b:	83 c4 10             	add    $0x10,%esp
c000339e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00033a1:	83 ec 0c             	sub    $0xc,%esp
c00033a4:	ff 75 10             	pushl  0x10(%ebp)
c00033a7:	e8 76 34 00 00       	call   c0006822 <proc2pid>
c00033ac:	83 c4 10             	add    $0x10,%esp
c00033af:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00033b2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00033b9:	8b 45 10             	mov    0x10(%ebp),%eax
c00033bc:	8b 40 60             	mov    0x60(%eax),%eax
c00033bf:	85 c0                	test   %eax,%eax
c00033c1:	0f 84 8a 00 00 00    	je     c0003451 <sys_receive_msg+0xd1>
c00033c7:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
c00033cb:	74 09                	je     c00033d6 <sys_receive_msg+0x56>
c00033cd:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c00033d4:	75 7b                	jne    c0003451 <sys_receive_msg+0xd1>
c00033d6:	83 ec 04             	sub    $0x4,%esp
c00033d9:	6a 6c                	push   $0x6c
c00033db:	6a 00                	push   $0x0
c00033dd:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c00033e3:	50                   	push   %eax
c00033e4:	e8 a7 65 00 00       	call   c0009990 <Memset>
c00033e9:	83 c4 10             	add    $0x10,%esp
c00033ec:	c7 85 50 ff ff ff 13 	movl   $0x213,-0xb0(%ebp)
c00033f3:	02 00 00 
c00033f6:	c7 45 b8 d5 07 00 00 	movl   $0x7d5,-0x48(%ebp)
c00033fd:	83 ec 08             	sub    $0x8,%esp
c0003400:	ff 75 08             	pushl  0x8(%ebp)
c0003403:	ff 75 e0             	pushl  -0x20(%ebp)
c0003406:	e8 3b 35 00 00       	call   c0006946 <v2l>
c000340b:	83 c4 10             	add    $0x10,%esp
c000340e:	89 c2                	mov    %eax,%edx
c0003410:	83 ec 04             	sub    $0x4,%esp
c0003413:	6a 6c                	push   $0x6c
c0003415:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c000341b:	50                   	push   %eax
c000341c:	52                   	push   %edx
c000341d:	e8 40 65 00 00       	call   c0009962 <Memcpy>
c0003422:	83 c4 10             	add    $0x10,%esp
c0003425:	8b 45 10             	mov    0x10(%ebp),%eax
c0003428:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
c000342f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003432:	c7 40 54 1a 00 00 00 	movl   $0x1a,0x54(%eax)
c0003439:	8b 45 10             	mov    0x10(%ebp),%eax
c000343c:	c7 40 50 1a 00 00 00 	movl   $0x1a,0x50(%eax)
c0003443:	8b 45 10             	mov    0x10(%ebp),%eax
c0003446:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c000344a:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003451:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0003455:	0f 84 66 03 00 00    	je     c00037c1 <sys_receive_msg+0x441>
c000345b:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
c000345f:	75 1c                	jne    c000347d <sys_receive_msg+0xfd>
c0003461:	8b 45 10             	mov    0x10(%ebp),%eax
c0003464:	8b 40 58             	mov    0x58(%eax),%eax
c0003467:	85 c0                	test   %eax,%eax
c0003469:	74 75                	je     c00034e0 <sys_receive_msg+0x160>
c000346b:	8b 45 10             	mov    0x10(%ebp),%eax
c000346e:	8b 40 58             	mov    0x58(%eax),%eax
c0003471:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003474:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000347b:	eb 63                	jmp    c00034e0 <sys_receive_msg+0x160>
c000347d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003481:	78 5d                	js     c00034e0 <sys_receive_msg+0x160>
c0003483:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003487:	7f 57                	jg     c00034e0 <sys_receive_msg+0x160>
c0003489:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000348c:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0003490:	3c 01                	cmp    $0x1,%al
c0003492:	75 4c                	jne    c00034e0 <sys_receive_msg+0x160>
c0003494:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003497:	8b 40 50             	mov    0x50(%eax),%eax
c000349a:	83 f8 0b             	cmp    $0xb,%eax
c000349d:	74 0b                	je     c00034aa <sys_receive_msg+0x12a>
c000349f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00034a2:	8b 40 50             	mov    0x50(%eax),%eax
c00034a5:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c00034a8:	75 36                	jne    c00034e0 <sys_receive_msg+0x160>
c00034aa:	8b 45 10             	mov    0x10(%ebp),%eax
c00034ad:	8b 40 58             	mov    0x58(%eax),%eax
c00034b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00034b3:	eb 25                	jmp    c00034da <sys_receive_msg+0x15a>
c00034b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00034bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034be:	8b 50 18             	mov    0x18(%eax),%edx
c00034c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00034c4:	39 c2                	cmp    %eax,%edx
c00034c6:	75 09                	jne    c00034d1 <sys_receive_msg+0x151>
c00034c8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00034cf:	eb 0f                	jmp    c00034e0 <sys_receive_msg+0x160>
c00034d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034d4:	8b 40 5c             	mov    0x5c(%eax),%eax
c00034d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00034da:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00034de:	75 d5                	jne    c00034b5 <sys_receive_msg+0x135>
c00034e0:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c00034e4:	0f 85 43 02 00 00    	jne    c000372d <sys_receive_msg+0x3ad>
c00034ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034ed:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00034f0:	8b 45 10             	mov    0x10(%ebp),%eax
c00034f3:	8b 40 78             	mov    0x78(%eax),%eax
c00034f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00034f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00034fc:	83 ec 08             	sub    $0x8,%esp
c00034ff:	ff 75 10             	pushl  0x10(%ebp)
c0003502:	50                   	push   %eax
c0003503:	e8 e7 33 00 00       	call   c00068ef <Seg2PhyAddrLDT>
c0003508:	83 c4 10             	add    $0x10,%esp
c000350b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000350e:	8b 55 08             	mov    0x8(%ebp),%edx
c0003511:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003514:	01 d0                	add    %edx,%eax
c0003516:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003519:	c7 45 cc 6c 00 00 00 	movl   $0x6c,-0x34(%ebp)
c0003520:	8b 45 10             	mov    0x10(%ebp),%eax
c0003523:	8b 40 78             	mov    0x78(%eax),%eax
c0003526:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003529:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000352c:	83 ec 08             	sub    $0x8,%esp
c000352f:	ff 75 dc             	pushl  -0x24(%ebp)
c0003532:	50                   	push   %eax
c0003533:	e8 b7 33 00 00       	call   c00068ef <Seg2PhyAddrLDT>
c0003538:	83 c4 10             	add    $0x10,%esp
c000353b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000353e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003541:	8b 40 4c             	mov    0x4c(%eax),%eax
c0003544:	89 c2                	mov    %eax,%edx
c0003546:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003549:	01 d0                	add    %edx,%eax
c000354b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000354e:	83 ec 04             	sub    $0x4,%esp
c0003551:	ff 75 cc             	pushl  -0x34(%ebp)
c0003554:	ff 75 c0             	pushl  -0x40(%ebp)
c0003557:	ff 75 d0             	pushl  -0x30(%ebp)
c000355a:	e8 03 64 00 00       	call   c0009962 <Memcpy>
c000355f:	83 c4 10             	add    $0x10,%esp
c0003562:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003565:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003568:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
c000356c:	75 27                	jne    c0003595 <sys_receive_msg+0x215>
c000356e:	8b 45 08             	mov    0x8(%ebp),%eax
c0003571:	8b 40 68             	mov    0x68(%eax),%eax
c0003574:	83 f8 06             	cmp    $0x6,%eax
c0003577:	74 1c                	je     c0003595 <sys_receive_msg+0x215>
c0003579:	68 e0 05 00 00       	push   $0x5e0
c000357e:	68 02 94 00 c0       	push   $0xc0009402
c0003583:	68 02 94 00 c0       	push   $0xc0009402
c0003588:	68 ef 94 00 c0       	push   $0xc00094ef
c000358d:	e8 95 fa ff ff       	call   c0003027 <assertion_failure>
c0003592:	83 c4 10             	add    $0x10,%esp
c0003595:	8b 45 10             	mov    0x10(%ebp),%eax
c0003598:	8b 40 58             	mov    0x58(%eax),%eax
c000359b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000359e:	75 18                	jne    c00035b8 <sys_receive_msg+0x238>
c00035a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035a3:	8b 50 5c             	mov    0x5c(%eax),%edx
c00035a6:	8b 45 10             	mov    0x10(%ebp),%eax
c00035a9:	89 50 58             	mov    %edx,0x58(%eax)
c00035ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035af:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c00035b6:	eb 16                	jmp    c00035ce <sys_receive_msg+0x24e>
c00035b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035bb:	8b 50 5c             	mov    0x5c(%eax),%edx
c00035be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035c1:	89 50 5c             	mov    %edx,0x5c(%eax)
c00035c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035c7:	c7 40 5c 00 00 00 00 	movl   $0x0,0x5c(%eax)
c00035ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00035d1:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c00035d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00035db:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c00035df:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00035e2:	c7 40 50 1a 00 00 00 	movl   $0x1a,0x50(%eax)
c00035e9:	8b 45 10             	mov    0x10(%ebp),%eax
c00035ec:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c00035f3:	8b 45 10             	mov    0x10(%ebp),%eax
c00035f6:	c7 40 54 1a 00 00 00 	movl   $0x1a,0x54(%eax)
c00035fd:	8b 45 10             	mov    0x10(%ebp),%eax
c0003600:	c7 40 50 1a 00 00 00 	movl   $0x1a,0x50(%eax)
c0003607:	83 ec 0c             	sub    $0xc,%esp
c000360a:	ff 75 dc             	pushl  -0x24(%ebp)
c000360d:	e8 b1 02 00 00       	call   c00038c3 <unblock>
c0003612:	83 c4 10             	add    $0x10,%esp
c0003615:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003618:	8b 40 4c             	mov    0x4c(%eax),%eax
c000361b:	85 c0                	test   %eax,%eax
c000361d:	74 1c                	je     c000363b <sys_receive_msg+0x2bb>
c000361f:	68 01 06 00 00       	push   $0x601
c0003624:	68 02 94 00 c0       	push   $0xc0009402
c0003629:	68 02 94 00 c0       	push   $0xc0009402
c000362e:	68 01 95 00 c0       	push   $0xc0009501
c0003633:	e8 ef f9 ff ff       	call   c0003027 <assertion_failure>
c0003638:	83 c4 10             	add    $0x10,%esp
c000363b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000363e:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0003642:	84 c0                	test   %al,%al
c0003644:	74 1c                	je     c0003662 <sys_receive_msg+0x2e2>
c0003646:	68 02 06 00 00       	push   $0x602
c000364b:	68 02 94 00 c0       	push   $0xc0009402
c0003650:	68 02 94 00 c0       	push   $0xc0009402
c0003655:	68 19 95 00 c0       	push   $0xc0009519
c000365a:	e8 c8 f9 ff ff       	call   c0003027 <assertion_failure>
c000365f:	83 c4 10             	add    $0x10,%esp
c0003662:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003665:	8b 40 50             	mov    0x50(%eax),%eax
c0003668:	83 f8 1a             	cmp    $0x1a,%eax
c000366b:	74 1c                	je     c0003689 <sys_receive_msg+0x309>
c000366d:	68 03 06 00 00       	push   $0x603
c0003672:	68 02 94 00 c0       	push   $0xc0009402
c0003677:	68 02 94 00 c0       	push   $0xc0009402
c000367c:	68 34 95 00 c0       	push   $0xc0009534
c0003681:	e8 a1 f9 ff ff       	call   c0003027 <assertion_failure>
c0003686:	83 c4 10             	add    $0x10,%esp
c0003689:	8b 45 10             	mov    0x10(%ebp),%eax
c000368c:	8b 40 4c             	mov    0x4c(%eax),%eax
c000368f:	85 c0                	test   %eax,%eax
c0003691:	74 1c                	je     c00036af <sys_receive_msg+0x32f>
c0003693:	68 05 06 00 00       	push   $0x605
c0003698:	68 02 94 00 c0       	push   $0xc0009402
c000369d:	68 02 94 00 c0       	push   $0xc0009402
c00036a2:	68 4d 94 00 c0       	push   $0xc000944d
c00036a7:	e8 7b f9 ff ff       	call   c0003027 <assertion_failure>
c00036ac:	83 c4 10             	add    $0x10,%esp
c00036af:	8b 45 10             	mov    0x10(%ebp),%eax
c00036b2:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00036b6:	84 c0                	test   %al,%al
c00036b8:	74 1c                	je     c00036d6 <sys_receive_msg+0x356>
c00036ba:	68 06 06 00 00       	push   $0x606
c00036bf:	68 02 94 00 c0       	push   $0xc0009402
c00036c4:	68 02 94 00 c0       	push   $0xc0009402
c00036c9:	68 62 94 00 c0       	push   $0xc0009462
c00036ce:	e8 54 f9 ff ff       	call   c0003027 <assertion_failure>
c00036d3:	83 c4 10             	add    $0x10,%esp
c00036d6:	8b 45 10             	mov    0x10(%ebp),%eax
c00036d9:	8b 40 54             	mov    0x54(%eax),%eax
c00036dc:	83 f8 1a             	cmp    $0x1a,%eax
c00036df:	74 1c                	je     c00036fd <sys_receive_msg+0x37d>
c00036e1:	68 07 06 00 00       	push   $0x607
c00036e6:	68 02 94 00 c0       	push   $0xc0009402
c00036eb:	68 02 94 00 c0       	push   $0xc0009402
c00036f0:	68 78 94 00 c0       	push   $0xc0009478
c00036f5:	e8 2d f9 ff ff       	call   c0003027 <assertion_failure>
c00036fa:	83 c4 10             	add    $0x10,%esp
c00036fd:	8b 45 10             	mov    0x10(%ebp),%eax
c0003700:	8b 40 50             	mov    0x50(%eax),%eax
c0003703:	83 f8 1a             	cmp    $0x1a,%eax
c0003706:	0f 84 ae 00 00 00    	je     c00037ba <sys_receive_msg+0x43a>
c000370c:	68 08 06 00 00       	push   $0x608
c0003711:	68 02 94 00 c0       	push   $0xc0009402
c0003716:	68 02 94 00 c0       	push   $0xc0009402
c000371b:	68 58 95 00 c0       	push   $0xc0009558
c0003720:	e8 02 f9 ff ff       	call   c0003027 <assertion_failure>
c0003725:	83 c4 10             	add    $0x10,%esp
c0003728:	e9 8d 00 00 00       	jmp    c00037ba <sys_receive_msg+0x43a>
c000372d:	8b 45 10             	mov    0x10(%ebp),%eax
c0003730:	c6 40 48 02          	movb   $0x2,0x48(%eax)
c0003734:	8b 45 10             	mov    0x10(%ebp),%eax
c0003737:	8b 55 08             	mov    0x8(%ebp),%edx
c000373a:	89 50 4c             	mov    %edx,0x4c(%eax)
c000373d:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
c0003741:	75 0c                	jne    c000374f <sys_receive_msg+0x3cf>
c0003743:	8b 45 10             	mov    0x10(%ebp),%eax
c0003746:	c7 40 54 0b 00 00 00 	movl   $0xb,0x54(%eax)
c000374d:	eb 09                	jmp    c0003758 <sys_receive_msg+0x3d8>
c000374f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003752:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003755:	89 50 54             	mov    %edx,0x54(%eax)
c0003758:	8b 0d 9c ce 00 c0    	mov    0xc000ce9c,%ecx
c000375e:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0003763:	89 c8                	mov    %ecx,%eax
c0003765:	f7 ea                	imul   %edx
c0003767:	c1 fa 06             	sar    $0x6,%edx
c000376a:	89 c8                	mov    %ecx,%eax
c000376c:	c1 f8 1f             	sar    $0x1f,%eax
c000376f:	29 c2                	sub    %eax,%edx
c0003771:	89 d0                	mov    %edx,%eax
c0003773:	8d 50 01             	lea    0x1(%eax),%edx
c0003776:	89 d0                	mov    %edx,%eax
c0003778:	c1 e0 02             	shl    $0x2,%eax
c000377b:	01 d0                	add    %edx,%eax
c000377d:	c1 e0 05             	shl    $0x5,%eax
c0003780:	a3 9c ce 00 c0       	mov    %eax,0xc000ce9c
c0003785:	8b 45 10             	mov    0x10(%ebp),%eax
c0003788:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c000378c:	3c 02                	cmp    $0x2,%al
c000378e:	74 1c                	je     c00037ac <sys_receive_msg+0x42c>
c0003790:	68 3d 06 00 00       	push   $0x63d
c0003795:	68 02 94 00 c0       	push   $0xc0009402
c000379a:	68 02 94 00 c0       	push   $0xc0009402
c000379f:	68 77 95 00 c0       	push   $0xc0009577
c00037a4:	e8 7e f8 ff ff       	call   c0003027 <assertion_failure>
c00037a9:	83 c4 10             	add    $0x10,%esp
c00037ac:	83 ec 0c             	sub    $0xc,%esp
c00037af:	ff 75 10             	pushl  0x10(%ebp)
c00037b2:	e8 fa 00 00 00       	call   c00038b1 <block>
c00037b7:	83 c4 10             	add    $0x10,%esp
c00037ba:	b8 00 00 00 00       	mov    $0x0,%eax
c00037bf:	eb 02                	jmp    c00037c3 <sys_receive_msg+0x443>
c00037c1:	90                   	nop
c00037c2:	90                   	nop
c00037c3:	c9                   	leave  
c00037c4:	c3                   	ret    

c00037c5 <disp_str_colour_debug>:
c00037c5:	55                   	push   %ebp
c00037c6:	89 e5                	mov    %esp,%ebp
c00037c8:	90                   	nop
c00037c9:	5d                   	pop    %ebp
c00037ca:	c3                   	ret    

c00037cb <send_rec>:
c00037cb:	55                   	push   %ebp
c00037cc:	89 e5                	mov    %esp,%ebp
c00037ce:	83 ec 18             	sub    $0x18,%esp
c00037d1:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c00037d5:	74 28                	je     c00037ff <send_rec+0x34>
c00037d7:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c00037db:	74 22                	je     c00037ff <send_rec+0x34>
c00037dd:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c00037e1:	74 1c                	je     c00037ff <send_rec+0x34>
c00037e3:	68 66 06 00 00       	push   $0x666
c00037e8:	68 02 94 00 c0       	push   $0xc0009402
c00037ed:	68 02 94 00 c0       	push   $0xc0009402
c00037f2:	68 98 95 00 c0       	push   $0xc0009598
c00037f7:	e8 2b f8 ff ff       	call   c0003027 <assertion_failure>
c00037fc:	83 c4 10             	add    $0x10,%esp
c00037ff:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0003803:	75 12                	jne    c0003817 <send_rec+0x4c>
c0003805:	83 ec 04             	sub    $0x4,%esp
c0003808:	6a 6c                	push   $0x6c
c000380a:	6a 00                	push   $0x0
c000380c:	ff 75 0c             	pushl  0xc(%ebp)
c000380f:	e8 7c 61 00 00       	call   c0009990 <Memset>
c0003814:	83 c4 10             	add    $0x10,%esp
c0003817:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000381b:	74 22                	je     c000383f <send_rec+0x74>
c000381d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0003821:	74 32                	je     c0003855 <send_rec+0x8a>
c0003823:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0003827:	75 6e                	jne    c0003897 <send_rec+0xcc>
c0003829:	83 ec 08             	sub    $0x8,%esp
c000382c:	ff 75 10             	pushl  0x10(%ebp)
c000382f:	ff 75 0c             	pushl  0xc(%ebp)
c0003832:	e8 81 0f 00 00       	call   c00047b8 <send_msg>
c0003837:	83 c4 10             	add    $0x10,%esp
c000383a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000383d:	eb 6b                	jmp    c00038aa <send_rec+0xdf>
c000383f:	83 ec 08             	sub    $0x8,%esp
c0003842:	ff 75 10             	pushl  0x10(%ebp)
c0003845:	ff 75 0c             	pushl  0xc(%ebp)
c0003848:	e8 91 0f 00 00       	call   c00047de <receive_msg>
c000384d:	83 c4 10             	add    $0x10,%esp
c0003850:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003853:	eb 55                	jmp    c00038aa <send_rec+0xdf>
c0003855:	83 ec 08             	sub    $0x8,%esp
c0003858:	ff 75 10             	pushl  0x10(%ebp)
c000385b:	ff 75 0c             	pushl  0xc(%ebp)
c000385e:	e8 55 0f 00 00       	call   c00047b8 <send_msg>
c0003863:	83 c4 10             	add    $0x10,%esp
c0003866:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003869:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000386d:	75 3a                	jne    c00038a9 <send_rec+0xde>
c000386f:	83 ec 04             	sub    $0x4,%esp
c0003872:	6a 6c                	push   $0x6c
c0003874:	6a 00                	push   $0x0
c0003876:	ff 75 0c             	pushl  0xc(%ebp)
c0003879:	e8 12 61 00 00       	call   c0009990 <Memset>
c000387e:	83 c4 10             	add    $0x10,%esp
c0003881:	83 ec 08             	sub    $0x8,%esp
c0003884:	ff 75 10             	pushl  0x10(%ebp)
c0003887:	ff 75 0c             	pushl  0xc(%ebp)
c000388a:	e8 4f 0f 00 00       	call   c00047de <receive_msg>
c000388f:	83 c4 10             	add    $0x10,%esp
c0003892:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003895:	eb 12                	jmp    c00038a9 <send_rec+0xde>
c0003897:	83 ec 0c             	sub    $0xc,%esp
c000389a:	68 d4 95 00 c0       	push   $0xc00095d4
c000389f:	e8 65 f7 ff ff       	call   c0003009 <panic>
c00038a4:	83 c4 10             	add    $0x10,%esp
c00038a7:	eb 01                	jmp    c00038aa <send_rec+0xdf>
c00038a9:	90                   	nop
c00038aa:	b8 00 00 00 00       	mov    $0x0,%eax
c00038af:	c9                   	leave  
c00038b0:	c3                   	ret    

c00038b1 <block>:
c00038b1:	55                   	push   %ebp
c00038b2:	89 e5                	mov    %esp,%ebp
c00038b4:	83 ec 08             	sub    $0x8,%esp
c00038b7:	e8 6c 2e 00 00       	call   c0006728 <schedule_process>
c00038bc:	b8 00 00 00 00       	mov    $0x0,%eax
c00038c1:	c9                   	leave  
c00038c2:	c3                   	ret    

c00038c3 <unblock>:
c00038c3:	55                   	push   %ebp
c00038c4:	89 e5                	mov    %esp,%ebp
c00038c6:	83 ec 08             	sub    $0x8,%esp
c00038c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00038cc:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c00038d0:	84 c0                	test   %al,%al
c00038d2:	74 1c                	je     c00038f0 <unblock+0x2d>
c00038d4:	68 9e 06 00 00       	push   $0x69e
c00038d9:	68 02 94 00 c0       	push   $0xc0009402
c00038de:	68 02 94 00 c0       	push   $0xc0009402
c00038e3:	68 e9 95 00 c0       	push   $0xc00095e9
c00038e8:	e8 3a f7 ff ff       	call   c0003027 <assertion_failure>
c00038ed:	83 c4 10             	add    $0x10,%esp
c00038f0:	b8 00 00 00 00       	mov    $0x0,%eax
c00038f5:	c9                   	leave  
c00038f6:	c3                   	ret    

c00038f7 <get_ticks_ipc>:
c00038f7:	55                   	push   %ebp
c00038f8:	89 e5                	mov    %esp,%ebp
c00038fa:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0003900:	83 ec 04             	sub    $0x4,%esp
c0003903:	6a 6c                	push   $0x6c
c0003905:	6a 00                	push   $0x0
c0003907:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000390a:	50                   	push   %eax
c000390b:	e8 80 60 00 00       	call   c0009990 <Memset>
c0003910:	83 c4 10             	add    $0x10,%esp
c0003913:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000391a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003921:	83 ec 04             	sub    $0x4,%esp
c0003924:	6a 01                	push   $0x1
c0003926:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003929:	50                   	push   %eax
c000392a:	6a 03                	push   $0x3
c000392c:	e8 9a fe ff ff       	call   c00037cb <send_rec>
c0003931:	83 c4 10             	add    $0x10,%esp
c0003934:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003937:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000393a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000393d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003940:	c9                   	leave  
c0003941:	c3                   	ret    

c0003942 <itoa>:
c0003942:	55                   	push   %ebp
c0003943:	89 e5                	mov    %esp,%ebp
c0003945:	53                   	push   %ebx
c0003946:	83 ec 14             	sub    $0x14,%esp
c0003949:	8b 45 08             	mov    0x8(%ebp),%eax
c000394c:	99                   	cltd   
c000394d:	f7 7d 10             	idivl  0x10(%ebp)
c0003950:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0003953:	8b 45 08             	mov    0x8(%ebp),%eax
c0003956:	99                   	cltd   
c0003957:	f7 7d 10             	idivl  0x10(%ebp)
c000395a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000395d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003961:	74 14                	je     c0003977 <itoa+0x35>
c0003963:	83 ec 04             	sub    $0x4,%esp
c0003966:	ff 75 10             	pushl  0x10(%ebp)
c0003969:	ff 75 0c             	pushl  0xc(%ebp)
c000396c:	ff 75 f0             	pushl  -0x10(%ebp)
c000396f:	e8 ce ff ff ff       	call   c0003942 <itoa>
c0003974:	83 c4 10             	add    $0x10,%esp
c0003977:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000397a:	8d 58 30             	lea    0x30(%eax),%ebx
c000397d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003980:	8b 00                	mov    (%eax),%eax
c0003982:	8d 48 01             	lea    0x1(%eax),%ecx
c0003985:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003988:	89 0a                	mov    %ecx,(%edx)
c000398a:	89 da                	mov    %ebx,%edx
c000398c:	88 10                	mov    %dl,(%eax)
c000398e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003991:	8b 00                	mov    (%eax),%eax
c0003993:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003996:	c9                   	leave  
c0003997:	c3                   	ret    

c0003998 <i2a>:
c0003998:	55                   	push   %ebp
c0003999:	89 e5                	mov    %esp,%ebp
c000399b:	53                   	push   %ebx
c000399c:	83 ec 14             	sub    $0x14,%esp
c000399f:	8b 45 08             	mov    0x8(%ebp),%eax
c00039a2:	99                   	cltd   
c00039a3:	f7 7d 0c             	idivl  0xc(%ebp)
c00039a6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00039a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00039ac:	99                   	cltd   
c00039ad:	f7 7d 0c             	idivl  0xc(%ebp)
c00039b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00039b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00039b7:	74 14                	je     c00039cd <i2a+0x35>
c00039b9:	83 ec 04             	sub    $0x4,%esp
c00039bc:	ff 75 10             	pushl  0x10(%ebp)
c00039bf:	ff 75 0c             	pushl  0xc(%ebp)
c00039c2:	ff 75 f0             	pushl  -0x10(%ebp)
c00039c5:	e8 ce ff ff ff       	call   c0003998 <i2a>
c00039ca:	83 c4 10             	add    $0x10,%esp
c00039cd:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00039d1:	7f 0a                	jg     c00039dd <i2a+0x45>
c00039d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039d6:	83 c0 30             	add    $0x30,%eax
c00039d9:	89 c3                	mov    %eax,%ebx
c00039db:	eb 08                	jmp    c00039e5 <i2a+0x4d>
c00039dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039e0:	83 c0 37             	add    $0x37,%eax
c00039e3:	89 c3                	mov    %eax,%ebx
c00039e5:	8b 45 10             	mov    0x10(%ebp),%eax
c00039e8:	8b 00                	mov    (%eax),%eax
c00039ea:	8d 48 01             	lea    0x1(%eax),%ecx
c00039ed:	8b 55 10             	mov    0x10(%ebp),%edx
c00039f0:	89 0a                	mov    %ecx,(%edx)
c00039f2:	88 18                	mov    %bl,(%eax)
c00039f4:	8b 45 10             	mov    0x10(%ebp),%eax
c00039f7:	8b 00                	mov    (%eax),%eax
c00039f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00039fc:	c9                   	leave  
c00039fd:	c3                   	ret    

c00039fe <inform_int>:
c00039fe:	55                   	push   %ebp
c00039ff:	89 e5                	mov    %esp,%ebp
c0003a01:	83 ec 18             	sub    $0x18,%esp
c0003a04:	83 ec 0c             	sub    $0xc,%esp
c0003a07:	ff 75 08             	pushl  0x8(%ebp)
c0003a0a:	e8 f7 2d 00 00       	call   c0006806 <pid2proc>
c0003a0f:	83 c4 10             	add    $0x10,%esp
c0003a12:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a18:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0003a1c:	0f be c0             	movsbl %al,%eax
c0003a1f:	83 e0 02             	and    $0x2,%eax
c0003a22:	85 c0                	test   %eax,%eax
c0003a24:	74 66                	je     c0003a8c <inform_int+0x8e>
c0003a26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a29:	8b 40 54             	mov    0x54(%eax),%eax
c0003a2c:	3d 13 02 00 00       	cmp    $0x213,%eax
c0003a31:	74 0b                	je     c0003a3e <inform_int+0x40>
c0003a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a36:	8b 40 54             	mov    0x54(%eax),%eax
c0003a39:	83 f8 0b             	cmp    $0xb,%eax
c0003a3c:	75 58                	jne    c0003a96 <inform_int+0x98>
c0003a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a41:	8b 40 4c             	mov    0x4c(%eax),%eax
c0003a44:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0003a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a4d:	8b 40 4c             	mov    0x4c(%eax),%eax
c0003a50:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0003a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a5a:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
c0003a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a64:	c7 40 54 1a 00 00 00 	movl   $0x1a,0x54(%eax)
c0003a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a6e:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
c0003a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a78:	c6 40 48 00          	movb   $0x0,0x48(%eax)
c0003a7c:	83 ec 0c             	sub    $0xc,%esp
c0003a7f:	ff 75 f4             	pushl  -0xc(%ebp)
c0003a82:	e8 3c fe ff ff       	call   c00038c3 <unblock>
c0003a87:	83 c4 10             	add    $0x10,%esp
c0003a8a:	eb 0a                	jmp    c0003a96 <inform_int+0x98>
c0003a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a8f:	c7 40 60 01 00 00 00 	movl   $0x1,0x60(%eax)
c0003a96:	90                   	nop
c0003a97:	c9                   	leave  
c0003a98:	c3                   	ret    

c0003a99 <strcmp>:
c0003a99:	55                   	push   %ebp
c0003a9a:	89 e5                	mov    %esp,%ebp
c0003a9c:	83 ec 10             	sub    $0x10,%esp
c0003a9f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0003aa3:	74 06                	je     c0003aab <strcmp+0x12>
c0003aa5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003aa9:	75 08                	jne    c0003ab3 <strcmp+0x1a>
c0003aab:	8b 45 08             	mov    0x8(%ebp),%eax
c0003aae:	2b 45 0c             	sub    0xc(%ebp),%eax
c0003ab1:	eb 53                	jmp    c0003b06 <strcmp+0x6d>
c0003ab3:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ab6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003ab9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003abc:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003abf:	eb 18                	jmp    c0003ad9 <strcmp+0x40>
c0003ac1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003ac4:	0f b6 10             	movzbl (%eax),%edx
c0003ac7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003aca:	0f b6 00             	movzbl (%eax),%eax
c0003acd:	38 c2                	cmp    %al,%dl
c0003acf:	75 1e                	jne    c0003aef <strcmp+0x56>
c0003ad1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003ad5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003ad9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003adc:	0f b6 00             	movzbl (%eax),%eax
c0003adf:	84 c0                	test   %al,%al
c0003ae1:	74 0d                	je     c0003af0 <strcmp+0x57>
c0003ae3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003ae6:	0f b6 00             	movzbl (%eax),%eax
c0003ae9:	84 c0                	test   %al,%al
c0003aeb:	75 d4                	jne    c0003ac1 <strcmp+0x28>
c0003aed:	eb 01                	jmp    c0003af0 <strcmp+0x57>
c0003aef:	90                   	nop
c0003af0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003af3:	0f b6 00             	movzbl (%eax),%eax
c0003af6:	0f be d0             	movsbl %al,%edx
c0003af9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003afc:	0f b6 00             	movzbl (%eax),%eax
c0003aff:	0f be c0             	movsbl %al,%eax
c0003b02:	29 c2                	sub    %eax,%edx
c0003b04:	89 d0                	mov    %edx,%eax
c0003b06:	c9                   	leave  
c0003b07:	c3                   	ret    

c0003b08 <TaskHD>:
c0003b08:	55                   	push   %ebp
c0003b09:	89 e5                	mov    %esp,%ebp
c0003b0b:	83 ec 08             	sub    $0x8,%esp
c0003b0e:	e8 07 00 00 00       	call   c0003b1a <init_hd>
c0003b13:	e8 1c 00 00 00       	call   c0003b34 <hd_handle>
c0003b18:	eb f9                	jmp    c0003b13 <TaskHD+0xb>

c0003b1a <init_hd>:
c0003b1a:	55                   	push   %ebp
c0003b1b:	89 e5                	mov    %esp,%ebp
c0003b1d:	83 ec 18             	sub    $0x18,%esp
c0003b20:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0003b27:	e8 42 d8 ff ff       	call   c000136e <enable_8259A_casecade_irq>
c0003b2c:	e8 51 d8 ff ff       	call   c0001382 <enable_8259A_slave_winchester_irq>
c0003b31:	90                   	nop
c0003b32:	c9                   	leave  
c0003b33:	c3                   	ret    

c0003b34 <hd_handle>:
c0003b34:	55                   	push   %ebp
c0003b35:	89 e5                	mov    %esp,%ebp
c0003b37:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0003b3d:	83 ec 04             	sub    $0x4,%esp
c0003b40:	6a 0b                	push   $0xb
c0003b42:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003b45:	50                   	push   %eax
c0003b46:	6a 02                	push   $0x2
c0003b48:	e8 7e fc ff ff       	call   c00037cb <send_rec>
c0003b4d:	83 c4 10             	add    $0x10,%esp
c0003b50:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b53:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003b56:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b5a:	0f 84 96 00 00 00    	je     c0003bf6 <hd_handle+0xc2>
c0003b60:	8b 45 84             	mov    -0x7c(%ebp),%eax
c0003b63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003b66:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0003b6a:	74 23                	je     c0003b8f <hd_handle+0x5b>
c0003b6c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0003b70:	77 08                	ja     c0003b7a <hd_handle+0x46>
c0003b72:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0003b76:	74 10                	je     c0003b88 <hd_handle+0x54>
c0003b78:	eb 35                	jmp    c0003baf <hd_handle+0x7b>
c0003b7a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0003b7e:	74 0f                	je     c0003b8f <hd_handle+0x5b>
c0003b80:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0003b84:	74 1a                	je     c0003ba0 <hd_handle+0x6c>
c0003b86:	eb 27                	jmp    c0003baf <hd_handle+0x7b>
c0003b88:	e8 18 07 00 00       	call   c00042a5 <hd_open>
c0003b8d:	eb 31                	jmp    c0003bc0 <hd_handle+0x8c>
c0003b8f:	83 ec 0c             	sub    $0xc,%esp
c0003b92:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003b95:	50                   	push   %eax
c0003b96:	e8 02 08 00 00       	call   c000439d <hd_rdwt>
c0003b9b:	83 c4 10             	add    $0x10,%esp
c0003b9e:	eb 20                	jmp    c0003bc0 <hd_handle+0x8c>
c0003ba0:	83 ec 0c             	sub    $0xc,%esp
c0003ba3:	6a 00                	push   $0x0
c0003ba5:	e8 4a 07 00 00       	call   c00042f4 <get_hd_ioctl>
c0003baa:	83 c4 10             	add    $0x10,%esp
c0003bad:	eb 11                	jmp    c0003bc0 <hd_handle+0x8c>
c0003baf:	83 ec 0c             	sub    $0xc,%esp
c0003bb2:	68 01 96 00 c0       	push   $0xc0009601
c0003bb7:	e8 48 f4 ff ff       	call   c0003004 <spin>
c0003bbc:	83 c4 10             	add    $0x10,%esp
c0003bbf:	90                   	nop
c0003bc0:	83 ec 04             	sub    $0x4,%esp
c0003bc3:	6a 6c                	push   $0x6c
c0003bc5:	6a 00                	push   $0x0
c0003bc7:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003bca:	50                   	push   %eax
c0003bcb:	e8 c0 5d 00 00       	call   c0009990 <Memset>
c0003bd0:	83 c4 10             	add    $0x10,%esp
c0003bd3:	c7 45 ec 64 00 00 00 	movl   $0x64,-0x14(%ebp)
c0003bda:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0003be1:	83 ec 04             	sub    $0x4,%esp
c0003be4:	6a 03                	push   $0x3
c0003be6:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003be9:	50                   	push   %eax
c0003bea:	6a 01                	push   $0x1
c0003bec:	e8 da fb ff ff       	call   c00037cb <send_rec>
c0003bf1:	83 c4 10             	add    $0x10,%esp
c0003bf4:	eb 01                	jmp    c0003bf7 <hd_handle+0xc3>
c0003bf6:	90                   	nop
c0003bf7:	c9                   	leave  
c0003bf8:	c3                   	ret    

c0003bf9 <hd_cmd_out>:
c0003bf9:	55                   	push   %ebp
c0003bfa:	89 e5                	mov    %esp,%ebp
c0003bfc:	83 ec 08             	sub    $0x8,%esp
c0003bff:	83 ec 04             	sub    $0x4,%esp
c0003c02:	68 98 3a 00 00       	push   $0x3a98
c0003c07:	6a 00                	push   $0x0
c0003c09:	68 80 00 00 00       	push   $0x80
c0003c0e:	e8 e8 09 00 00       	call   c00045fb <waitfor>
c0003c13:	83 c4 10             	add    $0x10,%esp
c0003c16:	85 c0                	test   %eax,%eax
c0003c18:	75 10                	jne    c0003c2a <hd_cmd_out+0x31>
c0003c1a:	83 ec 0c             	sub    $0xc,%esp
c0003c1d:	68 13 96 00 c0       	push   $0xc0009613
c0003c22:	e8 e2 f3 ff ff       	call   c0003009 <panic>
c0003c27:	83 c4 10             	add    $0x10,%esp
c0003c2a:	83 ec 08             	sub    $0x8,%esp
c0003c2d:	6a 00                	push   $0x0
c0003c2f:	68 f6 03 00 00       	push   $0x3f6
c0003c34:	e8 7b d6 ff ff       	call   c00012b4 <out_byte>
c0003c39:	83 c4 10             	add    $0x10,%esp
c0003c3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c3f:	0f b6 00             	movzbl (%eax),%eax
c0003c42:	0f b6 c0             	movzbl %al,%eax
c0003c45:	83 ec 08             	sub    $0x8,%esp
c0003c48:	50                   	push   %eax
c0003c49:	68 f1 01 00 00       	push   $0x1f1
c0003c4e:	e8 61 d6 ff ff       	call   c00012b4 <out_byte>
c0003c53:	83 c4 10             	add    $0x10,%esp
c0003c56:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c59:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0003c5d:	0f b6 c0             	movzbl %al,%eax
c0003c60:	83 ec 08             	sub    $0x8,%esp
c0003c63:	50                   	push   %eax
c0003c64:	68 f2 01 00 00       	push   $0x1f2
c0003c69:	e8 46 d6 ff ff       	call   c00012b4 <out_byte>
c0003c6e:	83 c4 10             	add    $0x10,%esp
c0003c71:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c74:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0003c78:	0f b6 c0             	movzbl %al,%eax
c0003c7b:	83 ec 08             	sub    $0x8,%esp
c0003c7e:	50                   	push   %eax
c0003c7f:	68 f3 01 00 00       	push   $0x1f3
c0003c84:	e8 2b d6 ff ff       	call   c00012b4 <out_byte>
c0003c89:	83 c4 10             	add    $0x10,%esp
c0003c8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c8f:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0003c93:	0f b6 c0             	movzbl %al,%eax
c0003c96:	83 ec 08             	sub    $0x8,%esp
c0003c99:	50                   	push   %eax
c0003c9a:	68 f4 01 00 00       	push   $0x1f4
c0003c9f:	e8 10 d6 ff ff       	call   c00012b4 <out_byte>
c0003ca4:	83 c4 10             	add    $0x10,%esp
c0003ca7:	8b 45 08             	mov    0x8(%ebp),%eax
c0003caa:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0003cae:	0f b6 c0             	movzbl %al,%eax
c0003cb1:	83 ec 08             	sub    $0x8,%esp
c0003cb4:	50                   	push   %eax
c0003cb5:	68 f5 01 00 00       	push   $0x1f5
c0003cba:	e8 f5 d5 ff ff       	call   c00012b4 <out_byte>
c0003cbf:	83 c4 10             	add    $0x10,%esp
c0003cc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0003cc5:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0003cc9:	0f b6 c0             	movzbl %al,%eax
c0003ccc:	83 ec 08             	sub    $0x8,%esp
c0003ccf:	50                   	push   %eax
c0003cd0:	68 f6 01 00 00       	push   $0x1f6
c0003cd5:	e8 da d5 ff ff       	call   c00012b4 <out_byte>
c0003cda:	83 c4 10             	add    $0x10,%esp
c0003cdd:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ce0:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0003ce4:	0f b6 c0             	movzbl %al,%eax
c0003ce7:	83 ec 08             	sub    $0x8,%esp
c0003cea:	50                   	push   %eax
c0003ceb:	68 f7 01 00 00       	push   $0x1f7
c0003cf0:	e8 bf d5 ff ff       	call   c00012b4 <out_byte>
c0003cf5:	83 c4 10             	add    $0x10,%esp
c0003cf8:	90                   	nop
c0003cf9:	c9                   	leave  
c0003cfa:	c3                   	ret    

c0003cfb <hd_identify>:
c0003cfb:	55                   	push   %ebp
c0003cfc:	89 e5                	mov    %esp,%ebp
c0003cfe:	53                   	push   %ebx
c0003cff:	83 ec 24             	sub    $0x24,%esp
c0003d02:	89 e0                	mov    %esp,%eax
c0003d04:	89 c3                	mov    %eax,%ebx
c0003d06:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0003d0a:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0003d0e:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0003d12:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0003d16:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0003d1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0003d1d:	c1 e0 04             	shl    $0x4,%eax
c0003d20:	83 c8 e0             	or     $0xffffffe0,%eax
c0003d23:	88 45 ea             	mov    %al,-0x16(%ebp)
c0003d26:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0003d2a:	83 ec 0c             	sub    $0xc,%esp
c0003d2d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0003d30:	50                   	push   %eax
c0003d31:	e8 c3 fe ff ff       	call   c0003bf9 <hd_cmd_out>
c0003d36:	83 c4 10             	add    $0x10,%esp
c0003d39:	e8 40 06 00 00       	call   c000437e <interrupt_wait>
c0003d3e:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0003d45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003d48:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003d4b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0003d4e:	89 c2                	mov    %eax,%edx
c0003d50:	b8 10 00 00 00       	mov    $0x10,%eax
c0003d55:	83 e8 01             	sub    $0x1,%eax
c0003d58:	01 d0                	add    %edx,%eax
c0003d5a:	b9 10 00 00 00       	mov    $0x10,%ecx
c0003d5f:	ba 00 00 00 00       	mov    $0x0,%edx
c0003d64:	f7 f1                	div    %ecx
c0003d66:	6b c0 10             	imul   $0x10,%eax,%eax
c0003d69:	29 c4                	sub    %eax,%esp
c0003d6b:	89 e0                	mov    %esp,%eax
c0003d6d:	83 c0 00             	add    $0x0,%eax
c0003d70:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003d73:	83 ec 04             	sub    $0x4,%esp
c0003d76:	ff 75 f4             	pushl  -0xc(%ebp)
c0003d79:	6a 00                	push   $0x0
c0003d7b:	ff 75 ec             	pushl  -0x14(%ebp)
c0003d7e:	e8 0d 5c 00 00       	call   c0009990 <Memset>
c0003d83:	83 c4 10             	add    $0x10,%esp
c0003d86:	83 ec 04             	sub    $0x4,%esp
c0003d89:	ff 75 f4             	pushl  -0xc(%ebp)
c0003d8c:	ff 75 ec             	pushl  -0x14(%ebp)
c0003d8f:	68 f0 01 00 00       	push   $0x1f0
c0003d94:	e8 4b 5c 00 00       	call   c00099e4 <read_port>
c0003d99:	83 c4 10             	add    $0x10,%esp
c0003d9c:	83 ec 0c             	sub    $0xc,%esp
c0003d9f:	ff 75 ec             	pushl  -0x14(%ebp)
c0003da2:	e8 0b 00 00 00       	call   c0003db2 <print_hdinfo>
c0003da7:	83 c4 10             	add    $0x10,%esp
c0003daa:	89 dc                	mov    %ebx,%esp
c0003dac:	90                   	nop
c0003dad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003db0:	c9                   	leave  
c0003db1:	c3                   	ret    

c0003db2 <print_hdinfo>:
c0003db2:	55                   	push   %ebp
c0003db3:	89 e5                	mov    %esp,%ebp
c0003db5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0003dbb:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0003dc1:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0003dc7:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0003dce:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0003dd5:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0003ddc:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0003de3:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0003dea:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0003df0:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0003df6:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0003dfd:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0003e04:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0003e0b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0003e12:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003e19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003e20:	e9 8f 00 00 00       	jmp    c0003eb4 <print_hdinfo+0x102>
c0003e25:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003e2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003e2f:	89 d0                	mov    %edx,%eax
c0003e31:	01 c0                	add    %eax,%eax
c0003e33:	01 d0                	add    %edx,%eax
c0003e35:	c1 e0 03             	shl    $0x3,%eax
c0003e38:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0003e3b:	01 c8                	add    %ecx,%eax
c0003e3d:	83 e8 44             	sub    $0x44,%eax
c0003e40:	0f b7 00             	movzwl (%eax),%eax
c0003e43:	0f b7 c0             	movzwl %ax,%eax
c0003e46:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0003e49:	8b 45 08             	mov    0x8(%ebp),%eax
c0003e4c:	01 d0                	add    %edx,%eax
c0003e4e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003e51:	eb 30                	jmp    c0003e83 <print_hdinfo+0xd1>
c0003e53:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003e56:	8d 50 01             	lea    0x1(%eax),%edx
c0003e59:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003e5c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003e5f:	83 c2 01             	add    $0x1,%edx
c0003e62:	0f b6 00             	movzbl (%eax),%eax
c0003e65:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0003e69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003e6c:	8d 50 01             	lea    0x1(%eax),%edx
c0003e6f:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003e72:	0f b6 00             	movzbl (%eax),%eax
c0003e75:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0003e78:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003e7b:	01 ca                	add    %ecx,%edx
c0003e7d:	88 02                	mov    %al,(%edx)
c0003e7f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003e83:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003e86:	89 d0                	mov    %edx,%eax
c0003e88:	01 c0                	add    %eax,%eax
c0003e8a:	01 d0                	add    %edx,%eax
c0003e8c:	c1 e0 03             	shl    $0x3,%eax
c0003e8f:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0003e92:	01 c8                	add    %ecx,%eax
c0003e94:	83 e8 42             	sub    $0x42,%eax
c0003e97:	0f b7 00             	movzwl (%eax),%eax
c0003e9a:	66 d1 e8             	shr    %ax
c0003e9d:	0f b7 c0             	movzwl %ax,%eax
c0003ea0:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0003ea3:	7c ae                	jl     c0003e53 <print_hdinfo+0xa1>
c0003ea5:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0003ea8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003eab:	01 d0                	add    %edx,%eax
c0003ead:	c6 00 00             	movb   $0x0,(%eax)
c0003eb0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003eb4:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0003eb8:	0f 8e 67 ff ff ff    	jle    c0003e25 <print_hdinfo+0x73>
c0003ebe:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ec1:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0003ec5:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0003ec9:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0003ecd:	66 c1 e8 08          	shr    $0x8,%ax
c0003ed1:	66 85 c0             	test   %ax,%ax
c0003ed4:	0f 95 c0             	setne  %al
c0003ed7:	88 45 e9             	mov    %al,-0x17(%ebp)
c0003eda:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0003ee1:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0003ee7:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0003eeb:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0003eef:	75 15                	jne    c0003f06 <print_hdinfo+0x154>
c0003ef1:	83 ec 08             	sub    $0x8,%esp
c0003ef4:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003ef7:	50                   	push   %eax
c0003ef8:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0003efb:	50                   	push   %eax
c0003efc:	e8 ae 5a 00 00       	call   c00099af <Strcpy>
c0003f01:	83 c4 10             	add    $0x10,%esp
c0003f04:	eb 13                	jmp    c0003f19 <print_hdinfo+0x167>
c0003f06:	83 ec 08             	sub    $0x8,%esp
c0003f09:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0003f0c:	50                   	push   %eax
c0003f0d:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0003f10:	50                   	push   %eax
c0003f11:	e8 99 5a 00 00       	call   c00099af <Strcpy>
c0003f16:	83 c4 10             	add    $0x10,%esp
c0003f19:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f1c:	83 c0 7a             	add    $0x7a,%eax
c0003f1f:	0f b7 00             	movzwl (%eax),%eax
c0003f22:	0f b7 d0             	movzwl %ax,%edx
c0003f25:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f28:	83 c0 78             	add    $0x78,%eax
c0003f2b:	0f b7 00             	movzwl (%eax),%eax
c0003f2e:	0f b7 c0             	movzwl %ax,%eax
c0003f31:	83 c0 10             	add    $0x10,%eax
c0003f34:	89 c1                	mov    %eax,%ecx
c0003f36:	d3 e2                	shl    %cl,%edx
c0003f38:	89 d0                	mov    %edx,%eax
c0003f3a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003f3d:	90                   	nop
c0003f3e:	c9                   	leave  
c0003f3f:	c3                   	ret    

c0003f40 <print_dpt_entry>:
c0003f40:	55                   	push   %ebp
c0003f41:	89 e5                	mov    %esp,%ebp
c0003f43:	83 ec 08             	sub    $0x8,%esp
c0003f46:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f49:	8b 40 08             	mov    0x8(%eax),%eax
c0003f4c:	83 ec 08             	sub    $0x8,%esp
c0003f4f:	50                   	push   %eax
c0003f50:	68 1d 96 00 c0       	push   $0xc000961d
c0003f55:	e8 7e ed ff ff       	call   c0002cd8 <Printf>
c0003f5a:	83 c4 10             	add    $0x10,%esp
c0003f5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f60:	8b 40 0c             	mov    0xc(%eax),%eax
c0003f63:	83 ec 08             	sub    $0x8,%esp
c0003f66:	50                   	push   %eax
c0003f67:	68 25 96 00 c0       	push   $0xc0009625
c0003f6c:	e8 67 ed ff ff       	call   c0002cd8 <Printf>
c0003f71:	83 c4 10             	add    $0x10,%esp
c0003f74:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f77:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0003f7b:	0f b6 c0             	movzbl %al,%eax
c0003f7e:	83 ec 08             	sub    $0x8,%esp
c0003f81:	50                   	push   %eax
c0003f82:	68 36 96 00 c0       	push   $0xc0009636
c0003f87:	e8 4c ed ff ff       	call   c0002cd8 <Printf>
c0003f8c:	83 c4 10             	add    $0x10,%esp
c0003f8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f92:	0f b6 00             	movzbl (%eax),%eax
c0003f95:	0f b6 c0             	movzbl %al,%eax
c0003f98:	83 ec 08             	sub    $0x8,%esp
c0003f9b:	50                   	push   %eax
c0003f9c:	68 44 96 00 c0       	push   $0xc0009644
c0003fa1:	e8 32 ed ff ff       	call   c0002cd8 <Printf>
c0003fa6:	83 c4 10             	add    $0x10,%esp
c0003fa9:	90                   	nop
c0003faa:	c9                   	leave  
c0003fab:	c3                   	ret    

c0003fac <get_partition_table>:
c0003fac:	55                   	push   %ebp
c0003fad:	89 e5                	mov    %esp,%ebp
c0003faf:	53                   	push   %ebx
c0003fb0:	83 ec 24             	sub    $0x24,%esp
c0003fb3:	89 e0                	mov    %esp,%eax
c0003fb5:	89 c3                	mov    %eax,%ebx
c0003fb7:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0003fbb:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0003fbf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003fc2:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0003fc5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003fc8:	c1 f8 08             	sar    $0x8,%eax
c0003fcb:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0003fce:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003fd1:	c1 f8 10             	sar    $0x10,%eax
c0003fd4:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0003fd7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003fda:	c1 f8 18             	sar    $0x18,%eax
c0003fdd:	89 c2                	mov    %eax,%edx
c0003fdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0003fe2:	c1 e0 04             	shl    $0x4,%eax
c0003fe5:	09 d0                	or     %edx,%eax
c0003fe7:	83 c8 e0             	or     $0xffffffe0,%eax
c0003fea:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0003fed:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0003ff1:	83 ec 0c             	sub    $0xc,%esp
c0003ff4:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0003ff7:	50                   	push   %eax
c0003ff8:	e8 fc fb ff ff       	call   c0003bf9 <hd_cmd_out>
c0003ffd:	83 c4 10             	add    $0x10,%esp
c0004000:	e8 79 03 00 00       	call   c000437e <interrupt_wait>
c0004005:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c000400c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000400f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004012:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004015:	89 c2                	mov    %eax,%edx
c0004017:	b8 10 00 00 00       	mov    $0x10,%eax
c000401c:	83 e8 01             	sub    $0x1,%eax
c000401f:	01 d0                	add    %edx,%eax
c0004021:	b9 10 00 00 00       	mov    $0x10,%ecx
c0004026:	ba 00 00 00 00       	mov    $0x0,%edx
c000402b:	f7 f1                	div    %ecx
c000402d:	6b c0 10             	imul   $0x10,%eax,%eax
c0004030:	29 c4                	sub    %eax,%esp
c0004032:	89 e0                	mov    %esp,%eax
c0004034:	83 c0 00             	add    $0x0,%eax
c0004037:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000403a:	83 ec 04             	sub    $0x4,%esp
c000403d:	ff 75 f4             	pushl  -0xc(%ebp)
c0004040:	6a 00                	push   $0x0
c0004042:	ff 75 ec             	pushl  -0x14(%ebp)
c0004045:	e8 46 59 00 00       	call   c0009990 <Memset>
c000404a:	83 c4 10             	add    $0x10,%esp
c000404d:	83 ec 04             	sub    $0x4,%esp
c0004050:	ff 75 f4             	pushl  -0xc(%ebp)
c0004053:	ff 75 ec             	pushl  -0x14(%ebp)
c0004056:	68 f0 01 00 00       	push   $0x1f0
c000405b:	e8 84 59 00 00       	call   c00099e4 <read_port>
c0004060:	83 c4 10             	add    $0x10,%esp
c0004063:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004066:	05 be 01 00 00       	add    $0x1be,%eax
c000406b:	83 ec 04             	sub    $0x4,%esp
c000406e:	6a 40                	push   $0x40
c0004070:	50                   	push   %eax
c0004071:	ff 75 10             	pushl  0x10(%ebp)
c0004074:	e8 e9 58 00 00       	call   c0009962 <Memcpy>
c0004079:	83 c4 10             	add    $0x10,%esp
c000407c:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0004083:	89 dc                	mov    %ebx,%esp
c0004085:	90                   	nop
c0004086:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004089:	c9                   	leave  
c000408a:	c3                   	ret    

c000408b <partition>:
c000408b:	55                   	push   %ebp
c000408c:	89 e5                	mov    %esp,%ebp
c000408e:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0004094:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004097:	88 45 84             	mov    %al,-0x7c(%ebp)
c000409a:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c000409e:	7f 19                	jg     c00040b9 <partition+0x2e>
c00040a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00040a3:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00040a8:	89 c8                	mov    %ecx,%eax
c00040aa:	f7 ea                	imul   %edx
c00040ac:	d1 fa                	sar    %edx
c00040ae:	89 c8                	mov    %ecx,%eax
c00040b0:	c1 f8 1f             	sar    $0x1f,%eax
c00040b3:	29 c2                	sub    %eax,%edx
c00040b5:	89 d0                	mov    %edx,%eax
c00040b7:	eb 11                	jmp    c00040ca <partition+0x3f>
c00040b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00040bc:	83 e8 10             	sub    $0x10,%eax
c00040bf:	8d 50 3f             	lea    0x3f(%eax),%edx
c00040c2:	85 c0                	test   %eax,%eax
c00040c4:	0f 48 c2             	cmovs  %edx,%eax
c00040c7:	c1 f8 06             	sar    $0x6,%eax
c00040ca:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00040cd:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c00040d1:	0f 85 cc 00 00 00    	jne    c00041a3 <partition+0x118>
c00040d7:	83 ec 04             	sub    $0x4,%esp
c00040da:	6a 40                	push   $0x40
c00040dc:	6a 00                	push   $0x0
c00040de:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00040e1:	50                   	push   %eax
c00040e2:	e8 a9 58 00 00       	call   c0009990 <Memset>
c00040e7:	83 c4 10             	add    $0x10,%esp
c00040ea:	83 ec 04             	sub    $0x4,%esp
c00040ed:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00040f0:	50                   	push   %eax
c00040f1:	6a 00                	push   $0x0
c00040f3:	ff 75 e8             	pushl  -0x18(%ebp)
c00040f6:	e8 b1 fe ff ff       	call   c0003fac <get_partition_table>
c00040fb:	83 c4 10             	add    $0x10,%esp
c00040fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004105:	e9 8a 00 00 00       	jmp    c0004194 <partition+0x109>
c000410a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000410d:	83 c0 01             	add    $0x1,%eax
c0004110:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004113:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004116:	c1 e0 04             	shl    $0x4,%eax
c0004119:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000411c:	01 c8                	add    %ecx,%eax
c000411e:	83 e8 5c             	sub    $0x5c,%eax
c0004121:	8b 00                	mov    (%eax),%eax
c0004123:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0004126:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004129:	c1 e1 03             	shl    $0x3,%ecx
c000412c:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0004132:	01 ca                	add    %ecx,%edx
c0004134:	81 c2 84 f6 00 c0    	add    $0xc000f684,%edx
c000413a:	89 02                	mov    %eax,(%edx)
c000413c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000413f:	c1 e0 04             	shl    $0x4,%eax
c0004142:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0004145:	01 c8                	add    %ecx,%eax
c0004147:	83 e8 58             	sub    $0x58,%eax
c000414a:	8b 00                	mov    (%eax),%eax
c000414c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c000414f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004152:	c1 e1 03             	shl    $0x3,%ecx
c0004155:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000415b:	01 ca                	add    %ecx,%edx
c000415d:	81 c2 88 f6 00 c0    	add    $0xc000f688,%edx
c0004163:	89 02                	mov    %eax,(%edx)
c0004165:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004168:	c1 e0 04             	shl    $0x4,%eax
c000416b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000416e:	01 c8                	add    %ecx,%eax
c0004170:	83 e8 60             	sub    $0x60,%eax
c0004173:	0f b6 00             	movzbl (%eax),%eax
c0004176:	3c 05                	cmp    $0x5,%al
c0004178:	75 16                	jne    c0004190 <partition+0x105>
c000417a:	8b 55 08             	mov    0x8(%ebp),%edx
c000417d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004180:	01 d0                	add    %edx,%eax
c0004182:	83 ec 08             	sub    $0x8,%esp
c0004185:	6a 01                	push   $0x1
c0004187:	50                   	push   %eax
c0004188:	e8 fe fe ff ff       	call   c000408b <partition>
c000418d:	83 c4 10             	add    $0x10,%esp
c0004190:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004194:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0004198:	0f 8e 6c ff ff ff    	jle    c000410a <partition+0x7f>
c000419e:	e9 ff 00 00 00       	jmp    c00042a2 <partition+0x217>
c00041a3:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c00041a7:	0f 85 f5 00 00 00    	jne    c00042a2 <partition+0x217>
c00041ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00041b0:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00041b5:	89 c8                	mov    %ecx,%eax
c00041b7:	f7 ea                	imul   %edx
c00041b9:	d1 fa                	sar    %edx
c00041bb:	89 c8                	mov    %ecx,%eax
c00041bd:	c1 f8 1f             	sar    $0x1f,%eax
c00041c0:	29 c2                	sub    %eax,%edx
c00041c2:	89 d0                	mov    %edx,%eax
c00041c4:	c1 e0 02             	shl    $0x2,%eax
c00041c7:	01 d0                	add    %edx,%eax
c00041c9:	29 c1                	sub    %eax,%ecx
c00041cb:	89 c8                	mov    %ecx,%eax
c00041cd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00041d0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00041d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00041d6:	c1 e2 03             	shl    $0x3,%edx
c00041d9:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00041df:	01 d0                	add    %edx,%eax
c00041e1:	05 84 f6 00 c0       	add    $0xc000f684,%eax
c00041e6:	8b 00                	mov    (%eax),%eax
c00041e8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00041eb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00041ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00041f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00041f4:	83 e8 01             	sub    $0x1,%eax
c00041f7:	c1 e0 04             	shl    $0x4,%eax
c00041fa:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00041fd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004204:	e9 8c 00 00 00       	jmp    c0004295 <partition+0x20a>
c0004209:	83 ec 04             	sub    $0x4,%esp
c000420c:	6a 40                	push   $0x40
c000420e:	6a 00                	push   $0x0
c0004210:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0004213:	50                   	push   %eax
c0004214:	e8 77 57 00 00       	call   c0009990 <Memset>
c0004219:	83 c4 10             	add    $0x10,%esp
c000421c:	83 ec 04             	sub    $0x4,%esp
c000421f:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0004222:	50                   	push   %eax
c0004223:	ff 75 f0             	pushl  -0x10(%ebp)
c0004226:	ff 75 e8             	pushl  -0x18(%ebp)
c0004229:	e8 7e fd ff ff       	call   c0003fac <get_partition_table>
c000422e:	83 c4 10             	add    $0x10,%esp
c0004231:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0004234:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004237:	01 d0                	add    %edx,%eax
c0004239:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000423c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000423f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004242:	01 c2                	add    %eax,%edx
c0004244:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004247:	8d 48 04             	lea    0x4(%eax),%ecx
c000424a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000424d:	c1 e1 03             	shl    $0x3,%ecx
c0004250:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004256:	01 c8                	add    %ecx,%eax
c0004258:	05 84 f6 00 c0       	add    $0xc000f684,%eax
c000425d:	89 10                	mov    %edx,(%eax)
c000425f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004262:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0004265:	8d 4a 04             	lea    0x4(%edx),%ecx
c0004268:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000426b:	c1 e1 03             	shl    $0x3,%ecx
c000426e:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0004274:	01 ca                	add    %ecx,%edx
c0004276:	81 c2 88 f6 00 c0    	add    $0xc000f688,%edx
c000427c:	89 02                	mov    %eax,(%edx)
c000427e:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0004282:	84 c0                	test   %al,%al
c0004284:	74 1b                	je     c00042a1 <partition+0x216>
c0004286:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0004289:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000428c:	01 d0                	add    %edx,%eax
c000428e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004291:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0004295:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0004299:	0f 8e 6a ff ff ff    	jle    c0004209 <partition+0x17e>
c000429f:	eb 01                	jmp    c00042a2 <partition+0x217>
c00042a1:	90                   	nop
c00042a2:	90                   	nop
c00042a3:	c9                   	leave  
c00042a4:	c3                   	ret    

c00042a5 <hd_open>:
c00042a5:	55                   	push   %ebp
c00042a6:	89 e5                	mov    %esp,%ebp
c00042a8:	83 ec 18             	sub    $0x18,%esp
c00042ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00042b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00042b5:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00042bb:	05 80 f6 00 c0       	add    $0xc000f680,%eax
c00042c0:	8b 00                	mov    (%eax),%eax
c00042c2:	8d 50 01             	lea    0x1(%eax),%edx
c00042c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00042c8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00042ce:	05 80 f6 00 c0       	add    $0xc000f680,%eax
c00042d3:	89 10                	mov    %edx,(%eax)
c00042d5:	83 ec 0c             	sub    $0xc,%esp
c00042d8:	6a 00                	push   $0x0
c00042da:	e8 1c fa ff ff       	call   c0003cfb <hd_identify>
c00042df:	83 c4 10             	add    $0x10,%esp
c00042e2:	83 ec 08             	sub    $0x8,%esp
c00042e5:	6a 00                	push   $0x0
c00042e7:	6a 00                	push   $0x0
c00042e9:	e8 9d fd ff ff       	call   c000408b <partition>
c00042ee:	83 c4 10             	add    $0x10,%esp
c00042f1:	90                   	nop
c00042f2:	c9                   	leave  
c00042f3:	c3                   	ret    

c00042f4 <get_hd_ioctl>:
c00042f4:	55                   	push   %ebp
c00042f5:	89 e5                	mov    %esp,%ebp
c00042f7:	83 ec 10             	sub    $0x10,%esp
c00042fa:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00042fe:	7f 19                	jg     c0004319 <get_hd_ioctl+0x25>
c0004300:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0004303:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0004308:	89 c8                	mov    %ecx,%eax
c000430a:	f7 ea                	imul   %edx
c000430c:	d1 fa                	sar    %edx
c000430e:	89 c8                	mov    %ecx,%eax
c0004310:	c1 f8 1f             	sar    $0x1f,%eax
c0004313:	29 c2                	sub    %eax,%edx
c0004315:	89 d0                	mov    %edx,%eax
c0004317:	eb 11                	jmp    c000432a <get_hd_ioctl+0x36>
c0004319:	8b 45 08             	mov    0x8(%ebp),%eax
c000431c:	83 e8 10             	sub    $0x10,%eax
c000431f:	8d 50 3f             	lea    0x3f(%eax),%edx
c0004322:	85 c0                	test   %eax,%eax
c0004324:	0f 48 c2             	cmovs  %edx,%eax
c0004327:	c1 f8 06             	sar    $0x6,%eax
c000432a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000432d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004330:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004333:	c1 e2 03             	shl    $0x3,%edx
c0004336:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000433c:	01 d0                	add    %edx,%eax
c000433e:	05 88 f6 00 c0       	add    $0xc000f688,%eax
c0004343:	8b 00                	mov    (%eax),%eax
c0004345:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004348:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000434b:	c9                   	leave  
c000434c:	c3                   	ret    

c000434d <wait_for>:
c000434d:	55                   	push   %ebp
c000434e:	89 e5                	mov    %esp,%ebp
c0004350:	83 ec 08             	sub    $0x8,%esp
c0004353:	83 ec 04             	sub    $0x4,%esp
c0004356:	68 40 42 0f 00       	push   $0xf4240
c000435b:	6a 08                	push   $0x8
c000435d:	6a 08                	push   $0x8
c000435f:	e8 97 02 00 00       	call   c00045fb <waitfor>
c0004364:	83 c4 10             	add    $0x10,%esp
c0004367:	85 c0                	test   %eax,%eax
c0004369:	75 10                	jne    c000437b <wait_for+0x2e>
c000436b:	83 ec 0c             	sub    $0xc,%esp
c000436e:	68 4f 96 00 c0       	push   $0xc000964f
c0004373:	e8 91 ec ff ff       	call   c0003009 <panic>
c0004378:	83 c4 10             	add    $0x10,%esp
c000437b:	90                   	nop
c000437c:	c9                   	leave  
c000437d:	c3                   	ret    

c000437e <interrupt_wait>:
c000437e:	55                   	push   %ebp
c000437f:	89 e5                	mov    %esp,%ebp
c0004381:	83 ec 78             	sub    $0x78,%esp
c0004384:	83 ec 04             	sub    $0x4,%esp
c0004387:	68 13 02 00 00       	push   $0x213
c000438c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000438f:	50                   	push   %eax
c0004390:	6a 02                	push   $0x2
c0004392:	e8 34 f4 ff ff       	call   c00037cb <send_rec>
c0004397:	83 c4 10             	add    $0x10,%esp
c000439a:	90                   	nop
c000439b:	c9                   	leave  
c000439c:	c3                   	ret    

c000439d <hd_rdwt>:
c000439d:	55                   	push   %ebp
c000439e:	89 e5                	mov    %esp,%ebp
c00043a0:	83 ec 48             	sub    $0x48,%esp
c00043a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00043a6:	8b 40 18             	mov    0x18(%eax),%eax
c00043a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00043ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00043af:	8b 40 14             	mov    0x14(%eax),%eax
c00043b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00043b5:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00043b9:	7f 19                	jg     c00043d4 <hd_rdwt+0x37>
c00043bb:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c00043be:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00043c3:	89 c8                	mov    %ecx,%eax
c00043c5:	f7 ea                	imul   %edx
c00043c7:	d1 fa                	sar    %edx
c00043c9:	89 c8                	mov    %ecx,%eax
c00043cb:	c1 f8 1f             	sar    $0x1f,%eax
c00043ce:	29 c2                	sub    %eax,%edx
c00043d0:	89 d0                	mov    %edx,%eax
c00043d2:	eb 11                	jmp    c00043e5 <hd_rdwt+0x48>
c00043d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00043d7:	83 e8 10             	sub    $0x10,%eax
c00043da:	8d 50 3f             	lea    0x3f(%eax),%edx
c00043dd:	85 c0                	test   %eax,%eax
c00043df:	0f 48 c2             	cmovs  %edx,%eax
c00043e2:	c1 f8 06             	sar    $0x6,%eax
c00043e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00043e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00043eb:	8d 50 f0             	lea    -0x10(%eax),%edx
c00043ee:	89 d0                	mov    %edx,%eax
c00043f0:	c1 f8 1f             	sar    $0x1f,%eax
c00043f3:	c1 e8 1a             	shr    $0x1a,%eax
c00043f6:	01 c2                	add    %eax,%edx
c00043f8:	83 e2 3f             	and    $0x3f,%edx
c00043fb:	29 c2                	sub    %eax,%edx
c00043fd:	89 d0                	mov    %edx,%eax
c00043ff:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004402:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004405:	c1 e8 09             	shr    $0x9,%eax
c0004408:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000440b:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c000440f:	7f 1a                	jg     c000442b <hd_rdwt+0x8e>
c0004411:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004414:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004417:	c1 e2 03             	shl    $0x3,%edx
c000441a:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0004420:	01 d0                	add    %edx,%eax
c0004422:	05 84 f6 00 c0       	add    $0xc000f684,%eax
c0004427:	8b 00                	mov    (%eax),%eax
c0004429:	eb 1b                	jmp    c0004446 <hd_rdwt+0xa9>
c000442b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000442e:	8d 50 04             	lea    0x4(%eax),%edx
c0004431:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004434:	c1 e2 03             	shl    $0x3,%edx
c0004437:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000443d:	01 d0                	add    %edx,%eax
c000443f:	05 84 f6 00 c0       	add    $0xc000f684,%eax
c0004444:	8b 00                	mov    (%eax),%eax
c0004446:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0004449:	01 d0                	add    %edx,%eax
c000444b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000444e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004451:	8b 40 0c             	mov    0xc(%eax),%eax
c0004454:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004457:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000445a:	05 ff 01 00 00       	add    $0x1ff,%eax
c000445f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0004465:	85 c0                	test   %eax,%eax
c0004467:	0f 48 c2             	cmovs  %edx,%eax
c000446a:	c1 f8 09             	sar    $0x9,%eax
c000446d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004470:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004473:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004476:	8b 45 08             	mov    0x8(%ebp),%eax
c0004479:	8b 40 10             	mov    0x10(%eax),%eax
c000447c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000447f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004482:	8b 00                	mov    (%eax),%eax
c0004484:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004487:	83 ec 08             	sub    $0x8,%esp
c000448a:	ff 75 d0             	pushl  -0x30(%ebp)
c000448d:	ff 75 cc             	pushl  -0x34(%ebp)
c0004490:	e8 b1 24 00 00       	call   c0006946 <v2l>
c0004495:	83 c4 10             	add    $0x10,%esp
c0004498:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000449b:	8b 45 08             	mov    0x8(%ebp),%eax
c000449e:	8b 40 68             	mov    0x68(%eax),%eax
c00044a1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00044a4:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00044a8:	74 22                	je     c00044cc <hd_rdwt+0x12f>
c00044aa:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00044ae:	74 1c                	je     c00044cc <hd_rdwt+0x12f>
c00044b0:	68 9f 01 00 00       	push   $0x19f
c00044b5:	68 61 96 00 c0       	push   $0xc0009661
c00044ba:	68 61 96 00 c0       	push   $0xc0009661
c00044bf:	68 69 96 00 c0       	push   $0xc0009669
c00044c4:	e8 5e eb ff ff       	call   c0003027 <assertion_failure>
c00044c9:	83 c4 10             	add    $0x10,%esp
c00044cc:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c00044d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044d3:	88 45 be             	mov    %al,-0x42(%ebp)
c00044d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044d9:	88 45 bf             	mov    %al,-0x41(%ebp)
c00044dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044df:	c1 f8 08             	sar    $0x8,%eax
c00044e2:	88 45 c0             	mov    %al,-0x40(%ebp)
c00044e5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044e8:	c1 f8 10             	sar    $0x10,%eax
c00044eb:	88 45 c1             	mov    %al,-0x3f(%ebp)
c00044ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044f1:	c1 f8 18             	sar    $0x18,%eax
c00044f4:	83 e0 0f             	and    $0xf,%eax
c00044f7:	83 c8 e0             	or     $0xffffffe0,%eax
c00044fa:	88 45 c2             	mov    %al,-0x3e(%ebp)
c00044fd:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0004501:	75 07                	jne    c000450a <hd_rdwt+0x16d>
c0004503:	b8 20 00 00 00       	mov    $0x20,%eax
c0004508:	eb 05                	jmp    c000450f <hd_rdwt+0x172>
c000450a:	b8 30 00 00 00       	mov    $0x30,%eax
c000450f:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0004512:	83 ec 0c             	sub    $0xc,%esp
c0004515:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0004518:	50                   	push   %eax
c0004519:	e8 db f6 ff ff       	call   c0003bf9 <hd_cmd_out>
c000451e:	83 c4 10             	add    $0x10,%esp
c0004521:	e9 9c 00 00 00       	jmp    c00045c2 <hd_rdwt+0x225>
c0004526:	b8 00 02 00 00       	mov    $0x200,%eax
c000452b:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0004532:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c0004536:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004539:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000453d:	75 51                	jne    c0004590 <hd_rdwt+0x1f3>
c000453f:	e8 09 fe ff ff       	call   c000434d <wait_for>
c0004544:	e8 35 fe ff ff       	call   c000437e <interrupt_wait>
c0004549:	83 ec 04             	sub    $0x4,%esp
c000454c:	ff 75 c4             	pushl  -0x3c(%ebp)
c000454f:	6a 00                	push   $0x0
c0004551:	68 c0 f8 00 c0       	push   $0xc000f8c0
c0004556:	e8 35 54 00 00       	call   c0009990 <Memset>
c000455b:	83 c4 10             	add    $0x10,%esp
c000455e:	83 ec 04             	sub    $0x4,%esp
c0004561:	68 00 02 00 00       	push   $0x200
c0004566:	68 c0 f8 00 c0       	push   $0xc000f8c0
c000456b:	68 f0 01 00 00       	push   $0x1f0
c0004570:	e8 6f 54 00 00       	call   c00099e4 <read_port>
c0004575:	83 c4 10             	add    $0x10,%esp
c0004578:	83 ec 04             	sub    $0x4,%esp
c000457b:	ff 75 c4             	pushl  -0x3c(%ebp)
c000457e:	68 c0 f8 00 c0       	push   $0xc000f8c0
c0004583:	ff 75 f0             	pushl  -0x10(%ebp)
c0004586:	e8 d7 53 00 00       	call   c0009962 <Memcpy>
c000458b:	83 c4 10             	add    $0x10,%esp
c000458e:	eb 26                	jmp    c00045b6 <hd_rdwt+0x219>
c0004590:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0004594:	75 20                	jne    c00045b6 <hd_rdwt+0x219>
c0004596:	e8 b2 fd ff ff       	call   c000434d <wait_for>
c000459b:	83 ec 04             	sub    $0x4,%esp
c000459e:	ff 75 c4             	pushl  -0x3c(%ebp)
c00045a1:	ff 75 f0             	pushl  -0x10(%ebp)
c00045a4:	68 f0 01 00 00       	push   $0x1f0
c00045a9:	e8 4a 54 00 00       	call   c00099f8 <write_port>
c00045ae:	83 c4 10             	add    $0x10,%esp
c00045b1:	e8 c8 fd ff ff       	call   c000437e <interrupt_wait>
c00045b6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00045b9:	29 45 f4             	sub    %eax,-0xc(%ebp)
c00045bc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00045bf:	01 45 f0             	add    %eax,-0x10(%ebp)
c00045c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00045c6:	0f 85 5a ff ff ff    	jne    c0004526 <hd_rdwt+0x189>
c00045cc:	90                   	nop
c00045cd:	c9                   	leave  
c00045ce:	c3                   	ret    

c00045cf <hd_handler>:
c00045cf:	55                   	push   %ebp
c00045d0:	89 e5                	mov    %esp,%ebp
c00045d2:	83 ec 18             	sub    $0x18,%esp
c00045d5:	83 ec 0c             	sub    $0xc,%esp
c00045d8:	68 f7 01 00 00       	push   $0x1f7
c00045dd:	e8 c6 cc ff ff       	call   c00012a8 <in_byte>
c00045e2:	83 c4 10             	add    $0x10,%esp
c00045e5:	0f b6 c0             	movzbl %al,%eax
c00045e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00045eb:	83 ec 0c             	sub    $0xc,%esp
c00045ee:	6a 02                	push   $0x2
c00045f0:	e8 09 f4 ff ff       	call   c00039fe <inform_int>
c00045f5:	83 c4 10             	add    $0x10,%esp
c00045f8:	90                   	nop
c00045f9:	c9                   	leave  
c00045fa:	c3                   	ret    

c00045fb <waitfor>:
c00045fb:	55                   	push   %ebp
c00045fc:	89 e5                	mov    %esp,%ebp
c00045fe:	83 ec 18             	sub    $0x18,%esp
c0004601:	e8 f1 f2 ff ff       	call   c00038f7 <get_ticks_ipc>
c0004606:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004609:	eb 22                	jmp    c000462d <waitfor+0x32>
c000460b:	83 ec 0c             	sub    $0xc,%esp
c000460e:	68 f7 01 00 00       	push   $0x1f7
c0004613:	e8 90 cc ff ff       	call   c00012a8 <in_byte>
c0004618:	83 c4 10             	add    $0x10,%esp
c000461b:	0f b6 c0             	movzbl %al,%eax
c000461e:	23 45 08             	and    0x8(%ebp),%eax
c0004621:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0004624:	75 07                	jne    c000462d <waitfor+0x32>
c0004626:	b8 01 00 00 00       	mov    $0x1,%eax
c000462b:	eb 1d                	jmp    c000464a <waitfor+0x4f>
c000462d:	e8 c5 f2 ff ff       	call   c00038f7 <get_ticks_ipc>
c0004632:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0004635:	89 c2                	mov    %eax,%edx
c0004637:	89 d0                	mov    %edx,%eax
c0004639:	c1 e0 02             	shl    $0x2,%eax
c000463c:	01 d0                	add    %edx,%eax
c000463e:	01 c0                	add    %eax,%eax
c0004640:	39 45 10             	cmp    %eax,0x10(%ebp)
c0004643:	7f c6                	jg     c000460b <waitfor+0x10>
c0004645:	b8 00 00 00 00       	mov    $0x0,%eax
c000464a:	c9                   	leave  
c000464b:	c3                   	ret    

c000464c <print_hd_info>:
c000464c:	55                   	push   %ebp
c000464d:	89 e5                	mov    %esp,%ebp
c000464f:	83 ec 18             	sub    $0x18,%esp
c0004652:	83 ec 0c             	sub    $0xc,%esp
c0004655:	68 87 96 00 c0       	push   $0xc0009687
c000465a:	e8 79 e6 ff ff       	call   c0002cd8 <Printf>
c000465f:	83 c4 10             	add    $0x10,%esp
c0004662:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004669:	eb 3b                	jmp    c00046a6 <print_hd_info+0x5a>
c000466b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000466e:	8b 04 c5 88 f6 00 c0 	mov    -0x3fff0978(,%eax,8),%eax
c0004675:	85 c0                	test   %eax,%eax
c0004677:	74 28                	je     c00046a1 <print_hd_info+0x55>
c0004679:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000467c:	8b 14 c5 88 f6 00 c0 	mov    -0x3fff0978(,%eax,8),%edx
c0004683:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004686:	8b 04 c5 84 f6 00 c0 	mov    -0x3fff097c(,%eax,8),%eax
c000468d:	ff 75 f4             	pushl  -0xc(%ebp)
c0004690:	52                   	push   %edx
c0004691:	50                   	push   %eax
c0004692:	68 a4 96 00 c0       	push   $0xc00096a4
c0004697:	e8 3c e6 ff ff       	call   c0002cd8 <Printf>
c000469c:	83 c4 10             	add    $0x10,%esp
c000469f:	eb 01                	jmp    c00046a2 <print_hd_info+0x56>
c00046a1:	90                   	nop
c00046a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00046a6:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00046aa:	7e bf                	jle    c000466b <print_hd_info+0x1f>
c00046ac:	83 ec 0c             	sub    $0xc,%esp
c00046af:	68 bc 96 00 c0       	push   $0xc00096bc
c00046b4:	e8 1f e6 ff ff       	call   c0002cd8 <Printf>
c00046b9:	83 c4 10             	add    $0x10,%esp
c00046bc:	83 ec 0c             	sub    $0xc,%esp
c00046bf:	68 d7 96 00 c0       	push   $0xc00096d7
c00046c4:	e8 0f e6 ff ff       	call   c0002cd8 <Printf>
c00046c9:	83 c4 10             	add    $0x10,%esp
c00046cc:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c00046d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00046da:	eb 44                	jmp    c0004720 <print_hd_info+0xd4>
c00046dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00046df:	83 c0 04             	add    $0x4,%eax
c00046e2:	8b 04 c5 88 f6 00 c0 	mov    -0x3fff0978(,%eax,8),%eax
c00046e9:	85 c0                	test   %eax,%eax
c00046eb:	74 2e                	je     c000471b <print_hd_info+0xcf>
c00046ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00046f0:	83 c0 04             	add    $0x4,%eax
c00046f3:	8b 14 c5 88 f6 00 c0 	mov    -0x3fff0978(,%eax,8),%edx
c00046fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00046fd:	83 c0 04             	add    $0x4,%eax
c0004700:	8b 04 c5 84 f6 00 c0 	mov    -0x3fff097c(,%eax,8),%eax
c0004707:	ff 75 f0             	pushl  -0x10(%ebp)
c000470a:	52                   	push   %edx
c000470b:	50                   	push   %eax
c000470c:	68 a4 96 00 c0       	push   $0xc00096a4
c0004711:	e8 c2 e5 ff ff       	call   c0002cd8 <Printf>
c0004716:	83 c4 10             	add    $0x10,%esp
c0004719:	eb 01                	jmp    c000471c <print_hd_info+0xd0>
c000471b:	90                   	nop
c000471c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004720:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0004724:	7e b6                	jle    c00046dc <print_hd_info+0x90>
c0004726:	83 ec 0c             	sub    $0xc,%esp
c0004729:	68 f4 96 00 c0       	push   $0xc00096f4
c000472e:	e8 a5 e5 ff ff       	call   c0002cd8 <Printf>
c0004733:	83 c4 10             	add    $0x10,%esp
c0004736:	90                   	nop
c0004737:	c9                   	leave  
c0004738:	c3                   	ret    

c0004739 <is_empty>:
c0004739:	55                   	push   %ebp
c000473a:	89 e5                	mov    %esp,%ebp
c000473c:	83 ec 10             	sub    $0x10,%esp
c000473f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0004746:	eb 1a                	jmp    c0004762 <is_empty+0x29>
c0004748:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000474b:	8b 45 08             	mov    0x8(%ebp),%eax
c000474e:	01 d0                	add    %edx,%eax
c0004750:	0f b6 00             	movzbl (%eax),%eax
c0004753:	84 c0                	test   %al,%al
c0004755:	74 07                	je     c000475e <is_empty+0x25>
c0004757:	b8 00 00 00 00       	mov    $0x0,%eax
c000475c:	eb 11                	jmp    c000476f <is_empty+0x36>
c000475e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0004762:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004765:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0004768:	7c de                	jl     c0004748 <is_empty+0xf>
c000476a:	b8 01 00 00 00       	mov    $0x1,%eax
c000476f:	c9                   	leave  
c0004770:	c3                   	ret    
c0004771:	66 90                	xchg   %ax,%ax
c0004773:	66 90                	xchg   %ax,%ax
c0004775:	66 90                	xchg   %ax,%ax
c0004777:	66 90                	xchg   %ax,%ax
c0004779:	66 90                	xchg   %ax,%ax
c000477b:	66 90                	xchg   %ax,%ax
c000477d:	66 90                	xchg   %ax,%ax
c000477f:	90                   	nop

c0004780 <get_ticks>:
c0004780:	b8 00 00 00 00       	mov    $0x0,%eax
c0004785:	cd 90                	int    $0x90
c0004787:	c3                   	ret    

c0004788 <write2>:
c0004788:	b8 01 00 00 00       	mov    $0x1,%eax
c000478d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0004791:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0004795:	cd 90                	int    $0x90
c0004797:	c3                   	ret    

c0004798 <write_debug>:
c0004798:	b8 02 00 00 00       	mov    $0x2,%eax
c000479d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00047a1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00047a5:	cd 90                	int    $0x90
c00047a7:	c3                   	ret    

c00047a8 <send_msg2>:
c00047a8:	b8 03 00 00 00       	mov    $0x3,%eax
c00047ad:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00047b1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00047b5:	cd 90                	int    $0x90
c00047b7:	c3                   	ret    

c00047b8 <send_msg>:
c00047b8:	55                   	push   %ebp
c00047b9:	89 e5                	mov    %esp,%ebp
c00047bb:	53                   	push   %ebx
c00047bc:	51                   	push   %ecx
c00047bd:	b8 03 00 00 00       	mov    $0x3,%eax
c00047c2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00047c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00047c8:	cd 90                	int    $0x90
c00047ca:	59                   	pop    %ecx
c00047cb:	5b                   	pop    %ebx
c00047cc:	5d                   	pop    %ebp
c00047cd:	c3                   	ret    

c00047ce <receive_msg2>:
c00047ce:	b8 04 00 00 00       	mov    $0x4,%eax
c00047d3:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00047d7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00047db:	cd 90                	int    $0x90
c00047dd:	c3                   	ret    

c00047de <receive_msg>:
c00047de:	55                   	push   %ebp
c00047df:	89 e5                	mov    %esp,%ebp
c00047e1:	53                   	push   %ebx
c00047e2:	51                   	push   %ecx
c00047e3:	b8 04 00 00 00       	mov    $0x4,%eax
c00047e8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00047eb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00047ee:	cd 90                	int    $0x90
c00047f0:	59                   	pop    %ecx
c00047f1:	5b                   	pop    %ebx
c00047f2:	5d                   	pop    %ebp
c00047f3:	c3                   	ret    

c00047f4 <task_fs>:
c00047f4:	55                   	push   %ebp
c00047f5:	89 e5                	mov    %esp,%ebp
c00047f7:	81 ec 08 01 00 00    	sub    $0x108,%esp
c00047fd:	e8 91 07 00 00       	call   c0004f93 <init_fs>
c0004802:	83 ec 04             	sub    $0x4,%esp
c0004805:	6a 6c                	push   $0x6c
c0004807:	6a 00                	push   $0x0
c0004809:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c000480f:	50                   	push   %eax
c0004810:	e8 7b 51 00 00       	call   c0009990 <Memset>
c0004815:	83 c4 10             	add    $0x10,%esp
c0004818:	83 ec 04             	sub    $0x4,%esp
c000481b:	6a 0b                	push   $0xb
c000481d:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c0004823:	50                   	push   %eax
c0004824:	6a 02                	push   $0x2
c0004826:	e8 a0 ef ff ff       	call   c00037cb <send_rec>
c000482b:	83 c4 10             	add    $0x10,%esp
c000482e:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004834:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004837:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c000483d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004840:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0004846:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004849:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c000484f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004852:	8b 85 04 ff ff ff    	mov    -0xfc(%ebp),%eax
c0004858:	85 c0                	test   %eax,%eax
c000485a:	75 07                	jne    c0004863 <task_fs+0x6f>
c000485c:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0004863:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004866:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000486c:	05 20 79 01 c0       	add    $0xc0017920,%eax
c0004871:	a3 c4 d2 00 c0       	mov    %eax,0xc000d2c4
c0004876:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000487d:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0004881:	74 1c                	je     c000489f <task_fs+0xab>
c0004883:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0004887:	7f 08                	jg     c0004891 <task_fs+0x9d>
c0004889:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c000488d:	74 3e                	je     c00048cd <task_fs+0xd9>
c000488f:	eb 4b                	jmp    c00048dc <task_fs+0xe8>
c0004891:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0004895:	74 1f                	je     c00048b6 <task_fs+0xc2>
c0004897:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c000489b:	74 19                	je     c00048b6 <task_fs+0xc2>
c000489d:	eb 3d                	jmp    c00048dc <task_fs+0xe8>
c000489f:	83 ec 0c             	sub    $0xc,%esp
c00048a2:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c00048a8:	50                   	push   %eax
c00048a9:	e8 14 07 00 00       	call   c0004fc2 <do_open>
c00048ae:	83 c4 10             	add    $0x10,%esp
c00048b1:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00048b4:	eb 26                	jmp    c00048dc <task_fs+0xe8>
c00048b6:	83 ec 0c             	sub    $0xc,%esp
c00048b9:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
c00048bf:	50                   	push   %eax
c00048c0:	e8 3b 18 00 00       	call   c0006100 <do_rdwt>
c00048c5:	83 c4 10             	add    $0x10,%esp
c00048c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00048cb:	eb 0f                	jmp    c00048dc <task_fs+0xe8>
c00048cd:	83 ec 0c             	sub    $0xc,%esp
c00048d0:	ff 75 e4             	pushl  -0x1c(%ebp)
c00048d3:	e8 2a 1d 00 00       	call   c0006602 <do_close>
c00048d8:	83 c4 10             	add    $0x10,%esp
c00048db:	90                   	nop
c00048dc:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00048e2:	83 f8 67             	cmp    $0x67,%eax
c00048e5:	74 36                	je     c000491d <task_fs+0x129>
c00048e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00048ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048ed:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c00048f1:	75 06                	jne    c00048f9 <task_fs+0x105>
c00048f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00048f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048f9:	c7 45 d8 65 00 00 00 	movl   $0x65,-0x28(%ebp)
c0004900:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004903:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004906:	83 ec 04             	sub    $0x4,%esp
c0004909:	ff 75 f0             	pushl  -0x10(%ebp)
c000490c:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0004912:	50                   	push   %eax
c0004913:	6a 01                	push   $0x1
c0004915:	e8 b1 ee ff ff       	call   c00037cb <send_rec>
c000491a:	83 c4 10             	add    $0x10,%esp
c000491d:	a1 60 ce 00 c0       	mov    0xc000ce60,%eax
c0004922:	83 c0 01             	add    $0x1,%eax
c0004925:	a3 60 ce 00 c0       	mov    %eax,0xc000ce60
c000492a:	e9 d3 fe ff ff       	jmp    c0004802 <task_fs+0xe>

c000492f <rd_wt>:
c000492f:	55                   	push   %ebp
c0004930:	89 e5                	mov    %esp,%ebp
c0004932:	83 ec 78             	sub    $0x78,%esp
c0004935:	83 ec 04             	sub    $0x4,%esp
c0004938:	6a 6c                	push   $0x6c
c000493a:	6a 00                	push   $0x0
c000493c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000493f:	50                   	push   %eax
c0004940:	e8 4b 50 00 00       	call   c0009990 <Memset>
c0004945:	83 c4 10             	add    $0x10,%esp
c0004948:	8b 45 18             	mov    0x18(%ebp),%eax
c000494b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000494e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004951:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004954:	8b 45 10             	mov    0x10(%ebp),%eax
c0004957:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000495a:	8b 45 14             	mov    0x14(%ebp),%eax
c000495d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004960:	8b 45 08             	mov    0x8(%ebp),%eax
c0004963:	c1 e0 09             	shl    $0x9,%eax
c0004966:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004969:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c000496d:	74 22                	je     c0004991 <rd_wt+0x62>
c000496f:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0004973:	74 1c                	je     c0004991 <rd_wt+0x62>
c0004975:	68 d1 00 00 00       	push   $0xd1
c000497a:	68 14 97 00 c0       	push   $0xc0009714
c000497f:	68 14 97 00 c0       	push   $0xc0009714
c0004984:	68 21 97 00 c0       	push   $0xc0009721
c0004989:	e8 99 e6 ff ff       	call   c0003027 <assertion_failure>
c000498e:	83 c4 10             	add    $0x10,%esp
c0004991:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004994:	83 f8 07             	cmp    $0x7,%eax
c0004997:	74 24                	je     c00049bd <rd_wt+0x8e>
c0004999:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000499c:	83 f8 0a             	cmp    $0xa,%eax
c000499f:	74 1c                	je     c00049bd <rd_wt+0x8e>
c00049a1:	68 d2 00 00 00       	push   $0xd2
c00049a6:	68 14 97 00 c0       	push   $0xc0009714
c00049ab:	68 14 97 00 c0       	push   $0xc0009714
c00049b0:	68 40 97 00 c0       	push   $0xc0009740
c00049b5:	e8 6d e6 ff ff       	call   c0003027 <assertion_failure>
c00049ba:	83 c4 10             	add    $0x10,%esp
c00049bd:	83 ec 04             	sub    $0x4,%esp
c00049c0:	6a 02                	push   $0x2
c00049c2:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00049c5:	50                   	push   %eax
c00049c6:	6a 03                	push   $0x3
c00049c8:	e8 fe ed ff ff       	call   c00037cb <send_rec>
c00049cd:	83 c4 10             	add    $0x10,%esp
c00049d0:	90                   	nop
c00049d1:	c9                   	leave  
c00049d2:	c3                   	ret    

c00049d3 <mkfs>:
c00049d3:	55                   	push   %ebp
c00049d4:	89 e5                	mov    %esp,%ebp
c00049d6:	57                   	push   %edi
c00049d7:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c00049dd:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c00049e2:	83 ec 04             	sub    $0x4,%esp
c00049e5:	68 00 02 00 00       	push   $0x200
c00049ea:	6a 00                	push   $0x0
c00049ec:	50                   	push   %eax
c00049ed:	e8 9e 4f 00 00       	call   c0009990 <Memset>
c00049f2:	83 c4 10             	add    $0x10,%esp
c00049f5:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c00049fa:	83 ec 0c             	sub    $0xc,%esp
c00049fd:	6a 0a                	push   $0xa
c00049ff:	68 00 02 00 00       	push   $0x200
c0004a04:	50                   	push   %eax
c0004a05:	6a 20                	push   $0x20
c0004a07:	6a 00                	push   $0x0
c0004a09:	e8 21 ff ff ff       	call   c000492f <rd_wt>
c0004a0e:	83 c4 20             	add    $0x20,%esp
c0004a11:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004a16:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004a19:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a1c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0004a23:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a26:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0004a2d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a30:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0004a37:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a3a:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0004a41:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a44:	8b 40 04             	mov    0x4(%eax),%eax
c0004a47:	8d 50 02             	lea    0x2(%eax),%edx
c0004a4a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a4d:	8b 40 08             	mov    0x8(%eax),%eax
c0004a50:	01 c2                	add    %eax,%edx
c0004a52:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a55:	8b 40 0c             	mov    0xc(%eax),%eax
c0004a58:	01 c2                	add    %eax,%edx
c0004a5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004a5d:	89 10                	mov    %edx,(%eax)
c0004a5f:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0004a66:	b8 00 02 00 00       	mov    $0x200,%eax
c0004a6b:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0004a6e:	8b 0d 20 c0 00 c0    	mov    0xc000c020,%ecx
c0004a74:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0004a77:	01 ca                	add    %ecx,%edx
c0004a79:	83 ec 04             	sub    $0x4,%esp
c0004a7c:	50                   	push   %eax
c0004a7d:	6a 80                	push   $0xffffff80
c0004a7f:	52                   	push   %edx
c0004a80:	e8 0b 4f 00 00       	call   c0009990 <Memset>
c0004a85:	83 c4 10             	add    $0x10,%esp
c0004a88:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004a8d:	83 ec 0c             	sub    $0xc,%esp
c0004a90:	6a 0a                	push   $0xa
c0004a92:	68 00 02 00 00       	push   $0x200
c0004a97:	50                   	push   %eax
c0004a98:	6a 20                	push   $0x20
c0004a9a:	6a 01                	push   $0x1
c0004a9c:	e8 8e fe ff ff       	call   c000492f <rd_wt>
c0004aa1:	83 c4 20             	add    $0x20,%esp
c0004aa4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004aa7:	8b 10                	mov    (%eax),%edx
c0004aa9:	89 55 98             	mov    %edx,-0x68(%ebp)
c0004aac:	8b 50 04             	mov    0x4(%eax),%edx
c0004aaf:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0004ab2:	8b 50 08             	mov    0x8(%eax),%edx
c0004ab5:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0004ab8:	8b 50 0c             	mov    0xc(%eax),%edx
c0004abb:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0004abe:	8b 50 10             	mov    0x10(%eax),%edx
c0004ac1:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0004ac4:	8b 50 14             	mov    0x14(%eax),%edx
c0004ac7:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0004aca:	8b 50 18             	mov    0x18(%eax),%edx
c0004acd:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0004ad0:	8b 50 1c             	mov    0x1c(%eax),%edx
c0004ad3:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0004ad6:	8b 40 20             	mov    0x20(%eax),%eax
c0004ad9:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0004adc:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0004ae0:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0004ae4:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004ae9:	83 ec 04             	sub    $0x4,%esp
c0004aec:	6a 01                	push   $0x1
c0004aee:	52                   	push   %edx
c0004aef:	50                   	push   %eax
c0004af0:	e8 9b 4e 00 00       	call   c0009990 <Memset>
c0004af5:	83 c4 10             	add    $0x10,%esp
c0004af8:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004afd:	83 c0 01             	add    $0x1,%eax
c0004b00:	83 ec 04             	sub    $0x4,%esp
c0004b03:	68 ff 01 00 00       	push   $0x1ff
c0004b08:	6a 80                	push   $0xffffff80
c0004b0a:	50                   	push   %eax
c0004b0b:	e8 80 4e 00 00       	call   c0009990 <Memset>
c0004b10:	83 c4 10             	add    $0x10,%esp
c0004b13:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004b18:	83 ec 0c             	sub    $0xc,%esp
c0004b1b:	6a 0a                	push   $0xa
c0004b1d:	68 00 02 00 00       	push   $0x200
c0004b22:	50                   	push   %eax
c0004b23:	6a 20                	push   $0x20
c0004b25:	6a 02                	push   $0x2
c0004b27:	e8 03 fe ff ff       	call   c000492f <rd_wt>
c0004b2c:	83 c4 20             	add    $0x20,%esp
c0004b2f:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0004b36:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004b3b:	83 ec 04             	sub    $0x4,%esp
c0004b3e:	68 00 02 00 00       	push   $0x200
c0004b43:	6a ff                	push   $0xffffffff
c0004b45:	50                   	push   %eax
c0004b46:	e8 45 4e 00 00       	call   c0009990 <Memset>
c0004b4b:	83 c4 10             	add    $0x10,%esp
c0004b4e:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004b53:	83 ec 0c             	sub    $0xc,%esp
c0004b56:	6a 0a                	push   $0xa
c0004b58:	68 00 02 00 00       	push   $0x200
c0004b5d:	50                   	push   %eax
c0004b5e:	6a 20                	push   $0x20
c0004b60:	ff 75 d0             	pushl  -0x30(%ebp)
c0004b63:	e8 c7 fd ff ff       	call   c000492f <rd_wt>
c0004b68:	83 c4 20             	add    $0x20,%esp
c0004b6b:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004b70:	83 ec 04             	sub    $0x4,%esp
c0004b73:	6a 01                	push   $0x1
c0004b75:	6a 01                	push   $0x1
c0004b77:	50                   	push   %eax
c0004b78:	e8 13 4e 00 00       	call   c0009990 <Memset>
c0004b7d:	83 c4 10             	add    $0x10,%esp
c0004b80:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004b85:	83 c0 01             	add    $0x1,%eax
c0004b88:	83 ec 04             	sub    $0x4,%esp
c0004b8b:	68 ff 01 00 00       	push   $0x1ff
c0004b90:	6a 00                	push   $0x0
c0004b92:	50                   	push   %eax
c0004b93:	e8 f8 4d 00 00       	call   c0009990 <Memset>
c0004b98:	83 c4 10             	add    $0x10,%esp
c0004b9b:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004ba0:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0004ba3:	83 c2 01             	add    $0x1,%edx
c0004ba6:	83 ec 0c             	sub    $0xc,%esp
c0004ba9:	6a 0a                	push   $0xa
c0004bab:	68 00 02 00 00       	push   $0x200
c0004bb0:	50                   	push   %eax
c0004bb1:	6a 20                	push   $0x20
c0004bb3:	52                   	push   %edx
c0004bb4:	e8 76 fd ff ff       	call   c000492f <rd_wt>
c0004bb9:	83 c4 20             	add    $0x20,%esp
c0004bbc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004bbf:	83 e8 02             	sub    $0x2,%eax
c0004bc2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004bc5:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0004bcc:	eb 3f                	jmp    c0004c0d <mkfs+0x23a>
c0004bce:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004bd3:	83 ec 04             	sub    $0x4,%esp
c0004bd6:	68 00 02 00 00       	push   $0x200
c0004bdb:	6a 00                	push   $0x0
c0004bdd:	50                   	push   %eax
c0004bde:	e8 ad 4d 00 00       	call   c0009990 <Memset>
c0004be3:	83 c4 10             	add    $0x10,%esp
c0004be6:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004beb:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0004bee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004bf1:	01 ca                	add    %ecx,%edx
c0004bf3:	83 ec 0c             	sub    $0xc,%esp
c0004bf6:	6a 0a                	push   $0xa
c0004bf8:	68 00 02 00 00       	push   $0x200
c0004bfd:	50                   	push   %eax
c0004bfe:	6a 20                	push   $0x20
c0004c00:	52                   	push   %edx
c0004c01:	e8 29 fd ff ff       	call   c000492f <rd_wt>
c0004c06:	83 c4 20             	add    $0x20,%esp
c0004c09:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004c0d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0004c10:	83 c0 01             	add    $0x1,%eax
c0004c13:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0004c16:	7e b6                	jle    c0004bce <mkfs+0x1fb>
c0004c18:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004c1d:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0004c20:	83 c2 03             	add    $0x3,%edx
c0004c23:	83 ec 0c             	sub    $0xc,%esp
c0004c26:	6a 0a                	push   $0xa
c0004c28:	68 00 02 00 00       	push   $0x200
c0004c2d:	50                   	push   %eax
c0004c2e:	6a 20                	push   $0x20
c0004c30:	52                   	push   %edx
c0004c31:	e8 f9 fc ff ff       	call   c000492f <rd_wt>
c0004c36:	83 c4 20             	add    $0x20,%esp
c0004c39:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004c3e:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0004c41:	83 c2 03             	add    $0x3,%edx
c0004c44:	83 ec 0c             	sub    $0xc,%esp
c0004c47:	6a 07                	push   $0x7
c0004c49:	68 00 02 00 00       	push   $0x200
c0004c4e:	50                   	push   %eax
c0004c4f:	6a 20                	push   $0x20
c0004c51:	52                   	push   %edx
c0004c52:	e8 d8 fc ff ff       	call   c000492f <rd_wt>
c0004c57:	83 c4 20             	add    $0x20,%esp
c0004c5a:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004c5f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004c62:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c65:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0004c6b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c6e:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0004c75:	8b 55 98             	mov    -0x68(%ebp),%edx
c0004c78:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c7b:	89 50 08             	mov    %edx,0x8(%eax)
c0004c7e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c81:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0004c88:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c8b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0004c92:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004c95:	8b 10                	mov    (%eax),%edx
c0004c97:	89 15 c0 08 01 c0    	mov    %edx,0xc00108c0
c0004c9d:	8b 50 04             	mov    0x4(%eax),%edx
c0004ca0:	89 15 c4 08 01 c0    	mov    %edx,0xc00108c4
c0004ca6:	8b 50 08             	mov    0x8(%eax),%edx
c0004ca9:	89 15 c8 08 01 c0    	mov    %edx,0xc00108c8
c0004caf:	8b 50 0c             	mov    0xc(%eax),%edx
c0004cb2:	89 15 cc 08 01 c0    	mov    %edx,0xc00108cc
c0004cb8:	8b 50 10             	mov    0x10(%eax),%edx
c0004cbb:	89 15 d0 08 01 c0    	mov    %edx,0xc00108d0
c0004cc1:	8b 50 14             	mov    0x14(%eax),%edx
c0004cc4:	89 15 d4 08 01 c0    	mov    %edx,0xc00108d4
c0004cca:	8b 50 18             	mov    0x18(%eax),%edx
c0004ccd:	89 15 d8 08 01 c0    	mov    %edx,0xc00108d8
c0004cd3:	8b 50 1c             	mov    0x1c(%eax),%edx
c0004cd6:	89 15 dc 08 01 c0    	mov    %edx,0xc00108dc
c0004cdc:	8b 50 20             	mov    0x20(%eax),%edx
c0004cdf:	89 15 e0 08 01 c0    	mov    %edx,0xc00108e0
c0004ce5:	8b 40 24             	mov    0x24(%eax),%eax
c0004ce8:	a3 e4 08 01 c0       	mov    %eax,0xc00108e4
c0004ced:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004cf4:	eb 4c                	jmp    c0004d42 <mkfs+0x36f>
c0004cf6:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004cfb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004cfe:	83 c2 01             	add    $0x1,%edx
c0004d01:	c1 e2 05             	shl    $0x5,%edx
c0004d04:	01 d0                	add    %edx,%eax
c0004d06:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004d09:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004d0c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0004d12:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004d15:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0004d1c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004d1f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0004d26:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0004d2d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004d30:	c1 e0 08             	shl    $0x8,%eax
c0004d33:	0b 45 f0             	or     -0x10(%ebp),%eax
c0004d36:	89 c2                	mov    %eax,%edx
c0004d38:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004d3b:	89 50 08             	mov    %edx,0x8(%eax)
c0004d3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004d42:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0004d46:	7e ae                	jle    c0004cf6 <mkfs+0x323>
c0004d48:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0004d4f:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0004d55:	b8 00 00 00 00       	mov    $0x0,%eax
c0004d5a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0004d5f:	89 d7                	mov    %edx,%edi
c0004d61:	f3 ab                	rep stos %eax,%es:(%edi)
c0004d63:	c7 85 70 ff ff ff 66 	movl   $0xc0009766,-0x90(%ebp)
c0004d6a:	97 00 c0 
c0004d6d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004d74:	eb 54                	jmp    c0004dca <mkfs+0x3f7>
c0004d76:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004d7b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004d7e:	83 c2 04             	add    $0x4,%edx
c0004d81:	c1 e2 05             	shl    $0x5,%edx
c0004d84:	01 d0                	add    %edx,%eax
c0004d86:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004d89:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004d8c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0004d92:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004d95:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0004d9c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004d9f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004da2:	83 c2 01             	add    $0x1,%edx
c0004da5:	c1 e2 0b             	shl    $0xb,%edx
c0004da8:	01 c2                	add    %eax,%edx
c0004daa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004dad:	89 50 08             	mov    %edx,0x8(%eax)
c0004db0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004db3:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0004dba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004dbd:	8d 50 05             	lea    0x5(%eax),%edx
c0004dc0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004dc3:	89 50 10             	mov    %edx,0x10(%eax)
c0004dc6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0004dca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004dcd:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0004dd0:	7c a4                	jl     c0004d76 <mkfs+0x3a3>
c0004dd2:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004dd7:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0004dda:	83 c2 03             	add    $0x3,%edx
c0004ddd:	83 ec 0c             	sub    $0xc,%esp
c0004de0:	6a 0a                	push   $0xa
c0004de2:	68 00 02 00 00       	push   $0x200
c0004de7:	50                   	push   %eax
c0004de8:	6a 20                	push   $0x20
c0004dea:	52                   	push   %edx
c0004deb:	e8 3f fb ff ff       	call   c000492f <rd_wt>
c0004df0:	83 c4 20             	add    $0x20,%esp
c0004df3:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0004df9:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004dfc:	83 ec 0c             	sub    $0xc,%esp
c0004dff:	6a 07                	push   $0x7
c0004e01:	68 00 02 00 00       	push   $0x200
c0004e06:	52                   	push   %edx
c0004e07:	6a 20                	push   $0x20
c0004e09:	50                   	push   %eax
c0004e0a:	e8 20 fb ff ff       	call   c000492f <rd_wt>
c0004e0f:	83 c4 20             	add    $0x20,%esp
c0004e12:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0004e19:	00 00 00 
c0004e1c:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0004e23:	2e 00 
c0004e25:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0004e2a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004e2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004e30:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0004e36:	83 ec 0c             	sub    $0xc,%esp
c0004e39:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0004e3f:	50                   	push   %eax
c0004e40:	e8 84 4b 00 00       	call   c00099c9 <Strlen>
c0004e45:	83 c4 10             	add    $0x10,%esp
c0004e48:	89 c1                	mov    %eax,%ecx
c0004e4a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004e4d:	8d 50 04             	lea    0x4(%eax),%edx
c0004e50:	83 ec 04             	sub    $0x4,%esp
c0004e53:	51                   	push   %ecx
c0004e54:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0004e5a:	50                   	push   %eax
c0004e5b:	52                   	push   %edx
c0004e5c:	e8 01 4b 00 00       	call   c0009962 <Memcpy>
c0004e61:	83 c4 10             	add    $0x10,%esp
c0004e64:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0004e6a:	b8 00 00 00 00       	mov    $0x0,%eax
c0004e6f:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0004e74:	89 d7                	mov    %edx,%edi
c0004e76:	f3 ab                	rep stos %eax,%es:(%edi)
c0004e78:	c7 85 34 ff ff ff 72 	movl   $0xc0009772,-0xcc(%ebp)
c0004e7f:	97 00 c0 
c0004e82:	c7 85 38 ff ff ff 7b 	movl   $0xc000977b,-0xc8(%ebp)
c0004e89:	97 00 c0 
c0004e8c:	c7 85 3c ff ff ff 84 	movl   $0xc0009784,-0xc4(%ebp)
c0004e93:	97 00 c0 
c0004e96:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0004e9d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004ea4:	eb 49                	jmp    c0004eef <mkfs+0x51c>
c0004ea6:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0004eaa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004ead:	8d 50 02             	lea    0x2(%eax),%edx
c0004eb0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004eb3:	89 10                	mov    %edx,(%eax)
c0004eb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004eb8:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0004ebf:	83 ec 0c             	sub    $0xc,%esp
c0004ec2:	50                   	push   %eax
c0004ec3:	e8 01 4b 00 00       	call   c00099c9 <Strlen>
c0004ec8:	83 c4 10             	add    $0x10,%esp
c0004ecb:	89 c1                	mov    %eax,%ecx
c0004ecd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004ed0:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0004ed7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004eda:	83 c2 04             	add    $0x4,%edx
c0004edd:	83 ec 04             	sub    $0x4,%esp
c0004ee0:	51                   	push   %ecx
c0004ee1:	50                   	push   %eax
c0004ee2:	52                   	push   %edx
c0004ee3:	e8 7a 4a 00 00       	call   c0009962 <Memcpy>
c0004ee8:	83 c4 10             	add    $0x10,%esp
c0004eeb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0004eef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004ef2:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0004ef5:	7c af                	jl     c0004ea6 <mkfs+0x4d3>
c0004ef7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004efe:	eb 66                	jmp    c0004f66 <mkfs+0x593>
c0004f00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004f03:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0004f0a:	83 ec 0c             	sub    $0xc,%esp
c0004f0d:	50                   	push   %eax
c0004f0e:	e8 b6 4a 00 00       	call   c00099c9 <Strlen>
c0004f13:	83 c4 10             	add    $0x10,%esp
c0004f16:	85 c0                	test   %eax,%eax
c0004f18:	74 47                	je     c0004f61 <mkfs+0x58e>
c0004f1a:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0004f1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004f21:	8d 50 05             	lea    0x5(%eax),%edx
c0004f24:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004f27:	89 10                	mov    %edx,(%eax)
c0004f29:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004f2c:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0004f33:	83 ec 0c             	sub    $0xc,%esp
c0004f36:	50                   	push   %eax
c0004f37:	e8 8d 4a 00 00       	call   c00099c9 <Strlen>
c0004f3c:	83 c4 10             	add    $0x10,%esp
c0004f3f:	89 c1                	mov    %eax,%ecx
c0004f41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004f44:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0004f4b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0004f4e:	83 c2 04             	add    $0x4,%edx
c0004f51:	83 ec 04             	sub    $0x4,%esp
c0004f54:	51                   	push   %ecx
c0004f55:	50                   	push   %eax
c0004f56:	52                   	push   %edx
c0004f57:	e8 06 4a 00 00       	call   c0009962 <Memcpy>
c0004f5c:	83 c4 10             	add    $0x10,%esp
c0004f5f:	eb 01                	jmp    c0004f62 <mkfs+0x58f>
c0004f61:	90                   	nop
c0004f62:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0004f66:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004f69:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0004f6c:	7c 92                	jl     c0004f00 <mkfs+0x52d>
c0004f6e:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0004f74:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004f77:	83 ec 0c             	sub    $0xc,%esp
c0004f7a:	6a 0a                	push   $0xa
c0004f7c:	68 00 02 00 00       	push   $0x200
c0004f81:	52                   	push   %edx
c0004f82:	6a 20                	push   $0x20
c0004f84:	50                   	push   %eax
c0004f85:	e8 a5 f9 ff ff       	call   c000492f <rd_wt>
c0004f8a:	83 c4 20             	add    $0x20,%esp
c0004f8d:	90                   	nop
c0004f8e:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0004f91:	c9                   	leave  
c0004f92:	c3                   	ret    

c0004f93 <init_fs>:
c0004f93:	55                   	push   %ebp
c0004f94:	89 e5                	mov    %esp,%ebp
c0004f96:	83 ec 78             	sub    $0x78,%esp
c0004f99:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c0004fa0:	c7 45 a0 20 00 00 00 	movl   $0x20,-0x60(%ebp)
c0004fa7:	83 ec 04             	sub    $0x4,%esp
c0004faa:	6a 02                	push   $0x2
c0004fac:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0004faf:	50                   	push   %eax
c0004fb0:	6a 03                	push   $0x3
c0004fb2:	e8 14 e8 ff ff       	call   c00037cb <send_rec>
c0004fb7:	83 c4 10             	add    $0x10,%esp
c0004fba:	e8 14 fa ff ff       	call   c00049d3 <mkfs>
c0004fbf:	90                   	nop
c0004fc0:	c9                   	leave  
c0004fc1:	c3                   	ret    

c0004fc2 <do_open>:
c0004fc2:	55                   	push   %ebp
c0004fc3:	89 e5                	mov    %esp,%ebp
c0004fc5:	56                   	push   %esi
c0004fc6:	53                   	push   %ebx
c0004fc7:	83 ec 60             	sub    $0x60,%esp
c0004fca:	83 ec 04             	sub    $0x4,%esp
c0004fcd:	6a 0c                	push   $0xc
c0004fcf:	6a 00                	push   $0x0
c0004fd1:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0004fd4:	50                   	push   %eax
c0004fd5:	e8 b6 49 00 00       	call   c0009990 <Memset>
c0004fda:	83 c4 10             	add    $0x10,%esp
c0004fdd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe0:	8b 40 30             	mov    0x30(%eax),%eax
c0004fe3:	89 c6                	mov    %eax,%esi
c0004fe5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe8:	8b 40 34             	mov    0x34(%eax),%eax
c0004feb:	89 c2                	mov    %eax,%edx
c0004fed:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff0:	8b 00                	mov    (%eax),%eax
c0004ff2:	83 ec 08             	sub    $0x8,%esp
c0004ff5:	52                   	push   %edx
c0004ff6:	50                   	push   %eax
c0004ff7:	e8 4a 19 00 00       	call   c0006946 <v2l>
c0004ffc:	83 c4 10             	add    $0x10,%esp
c0004fff:	89 c3                	mov    %eax,%ebx
c0005001:	83 ec 08             	sub    $0x8,%esp
c0005004:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0005007:	50                   	push   %eax
c0005008:	6a 03                	push   $0x3
c000500a:	e8 37 19 00 00       	call   c0006946 <v2l>
c000500f:	83 c4 10             	add    $0x10,%esp
c0005012:	83 ec 04             	sub    $0x4,%esp
c0005015:	56                   	push   %esi
c0005016:	53                   	push   %ebx
c0005017:	50                   	push   %eax
c0005018:	e8 45 49 00 00       	call   c0009962 <Memcpy>
c000501d:	83 c4 10             	add    $0x10,%esp
c0005020:	8b 45 08             	mov    0x8(%ebp),%eax
c0005023:	8b 40 30             	mov    0x30(%eax),%eax
c0005026:	c6 44 05 cc 00       	movb   $0x0,-0x34(%ebp,%eax,1)
c000502b:	8b 45 08             	mov    0x8(%ebp),%eax
c000502e:	8b 40 64             	mov    0x64(%eax),%eax
c0005031:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005034:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c000503b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005042:	eb 1f                	jmp    c0005063 <do_open+0xa1>
c0005044:	a1 c4 d2 00 c0       	mov    0xc000d2c4,%eax
c0005049:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000504c:	83 c2 0c             	add    $0xc,%edx
c000504f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0005053:	85 c0                	test   %eax,%eax
c0005055:	75 08                	jne    c000505f <do_open+0x9d>
c0005057:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000505a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000505d:	eb 0a                	jmp    c0005069 <do_open+0xa7>
c000505f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005063:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005067:	7e db                	jle    c0005044 <do_open+0x82>
c0005069:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c000506d:	75 1c                	jne    c000508b <do_open+0xc9>
c000506f:	68 d8 01 00 00       	push   $0x1d8
c0005074:	68 14 97 00 c0       	push   $0xc0009714
c0005079:	68 14 97 00 c0       	push   $0xc0009714
c000507e:	68 8d 97 00 c0       	push   $0xc000978d
c0005083:	e8 9f df ff ff       	call   c0003027 <assertion_failure>
c0005088:	83 c4 10             	add    $0x10,%esp
c000508b:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0005092:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005099:	eb 1d                	jmp    c00050b8 <do_open+0xf6>
c000509b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000509e:	c1 e0 04             	shl    $0x4,%eax
c00050a1:	05 c8 fa 00 c0       	add    $0xc000fac8,%eax
c00050a6:	8b 00                	mov    (%eax),%eax
c00050a8:	85 c0                	test   %eax,%eax
c00050aa:	75 08                	jne    c00050b4 <do_open+0xf2>
c00050ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00050af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00050b2:	eb 0a                	jmp    c00050be <do_open+0xfc>
c00050b4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00050b8:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c00050bc:	7e dd                	jle    c000509b <do_open+0xd9>
c00050be:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c00050c2:	75 1c                	jne    c00050e0 <do_open+0x11e>
c00050c4:	68 e4 01 00 00       	push   $0x1e4
c00050c9:	68 14 97 00 c0       	push   $0xc0009714
c00050ce:	68 14 97 00 c0       	push   $0xc0009714
c00050d3:	68 95 97 00 c0       	push   $0xc0009795
c00050d8:	e8 4a df ff ff       	call   c0003027 <assertion_failure>
c00050dd:	83 c4 10             	add    $0x10,%esp
c00050e0:	83 ec 0c             	sub    $0xc,%esp
c00050e3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00050e6:	50                   	push   %eax
c00050e7:	e8 b7 00 00 00       	call   c00051a3 <search_file>
c00050ec:	83 c4 10             	add    $0x10,%esp
c00050ef:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00050f2:	83 7d e4 07          	cmpl   $0x7,-0x1c(%ebp)
c00050f6:	75 2b                	jne    c0005123 <do_open+0x161>
c00050f8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00050fc:	7e 10                	jle    c000510e <do_open+0x14c>
c00050fe:	83 ec 0c             	sub    $0xc,%esp
c0005101:	68 9d 97 00 c0       	push   $0xc000979d
c0005106:	e8 fe de ff ff       	call   c0003009 <panic>
c000510b:	83 c4 10             	add    $0x10,%esp
c000510e:	83 ec 08             	sub    $0x8,%esp
c0005111:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0005114:	50                   	push   %eax
c0005115:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0005118:	50                   	push   %eax
c0005119:	e8 43 04 00 00       	call   c0005561 <create_file>
c000511e:	83 c4 10             	add    $0x10,%esp
c0005121:	eb 22                	jmp    c0005145 <do_open+0x183>
c0005123:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0005127:	75 07                	jne    c0005130 <do_open+0x16e>
c0005129:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000512e:	eb 6c                	jmp    c000519c <do_open+0x1da>
c0005130:	83 ec 08             	sub    $0x8,%esp
c0005133:	ff 75 e0             	pushl  -0x20(%ebp)
c0005136:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0005139:	50                   	push   %eax
c000513a:	e8 60 02 00 00       	call   c000539f <get_inode>
c000513f:	83 c4 10             	add    $0x10,%esp
c0005142:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005145:	a1 c4 d2 00 c0       	mov    0xc000d2c4,%eax
c000514a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000514d:	c1 e2 04             	shl    $0x4,%edx
c0005150:	8d 8a c0 fa 00 c0    	lea    -0x3fff0540(%edx),%ecx
c0005156:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005159:	83 c2 0c             	add    $0xc,%edx
c000515c:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0005160:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0005163:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005166:	c1 e2 04             	shl    $0x4,%edx
c0005169:	81 c2 c8 fa 00 c0    	add    $0xc000fac8,%edx
c000516f:	89 02                	mov    %eax,(%edx)
c0005171:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005174:	c1 e0 04             	shl    $0x4,%eax
c0005177:	05 c4 fa 00 c0       	add    $0xc000fac4,%eax
c000517c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0005182:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005185:	c1 e0 04             	shl    $0x4,%eax
c0005188:	05 c0 fa 00 c0       	add    $0xc000fac0,%eax
c000518d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0005193:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005196:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005199:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000519c:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000519f:	5b                   	pop    %ebx
c00051a0:	5e                   	pop    %esi
c00051a1:	5d                   	pop    %ebp
c00051a2:	c3                   	ret    

c00051a3 <search_file>:
c00051a3:	55                   	push   %ebp
c00051a4:	89 e5                	mov    %esp,%ebp
c00051a6:	83 ec 68             	sub    $0x68,%esp
c00051a9:	83 ec 04             	sub    $0x4,%esp
c00051ac:	6a 0c                	push   $0xc
c00051ae:	6a 00                	push   $0x0
c00051b0:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00051b3:	50                   	push   %eax
c00051b4:	e8 d7 47 00 00       	call   c0009990 <Memset>
c00051b9:	83 c4 10             	add    $0x10,%esp
c00051bc:	83 ec 04             	sub    $0x4,%esp
c00051bf:	6a 28                	push   $0x28
c00051c1:	6a 00                	push   $0x0
c00051c3:	8d 45 98             	lea    -0x68(%ebp),%eax
c00051c6:	50                   	push   %eax
c00051c7:	e8 c4 47 00 00       	call   c0009990 <Memset>
c00051cc:	83 c4 10             	add    $0x10,%esp
c00051cf:	83 ec 04             	sub    $0x4,%esp
c00051d2:	8d 45 98             	lea    -0x68(%ebp),%eax
c00051d5:	50                   	push   %eax
c00051d6:	ff 75 08             	pushl  0x8(%ebp)
c00051d9:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00051dc:	50                   	push   %eax
c00051dd:	e8 f1 00 00 00       	call   c00052d3 <strip_path>
c00051e2:	83 c4 10             	add    $0x10,%esp
c00051e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00051e8:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c00051ec:	75 0a                	jne    c00051f8 <search_file+0x55>
c00051ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00051f3:	e9 d9 00 00 00       	jmp    c00052d1 <search_file+0x12e>
c00051f8:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00051fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00051fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005201:	05 00 02 00 00       	add    $0x200,%eax
c0005206:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000520c:	85 c0                	test   %eax,%eax
c000520e:	0f 48 c2             	cmovs  %edx,%eax
c0005211:	c1 f8 09             	sar    $0x9,%eax
c0005214:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005217:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000521a:	c1 e8 04             	shr    $0x4,%eax
c000521d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005220:	e8 2f 14 00 00       	call   c0006654 <get_super_block>
c0005225:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005228:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000522b:	8b 00                	mov    (%eax),%eax
c000522d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005230:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0005237:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000523e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005245:	eb 79                	jmp    c00052c0 <search_file+0x11d>
c0005247:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c000524c:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c000524f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005252:	01 ca                	add    %ecx,%edx
c0005254:	83 ec 0c             	sub    $0xc,%esp
c0005257:	6a 07                	push   $0x7
c0005259:	68 00 02 00 00       	push   $0x200
c000525e:	50                   	push   %eax
c000525f:	ff 75 cc             	pushl  -0x34(%ebp)
c0005262:	52                   	push   %edx
c0005263:	e8 c7 f6 ff ff       	call   c000492f <rd_wt>
c0005268:	83 c4 20             	add    $0x20,%esp
c000526b:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005270:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005273:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000527a:	eb 35                	jmp    c00052b1 <search_file+0x10e>
c000527c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005280:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005283:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0005286:	7f 33                	jg     c00052bb <search_file+0x118>
c0005288:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000528b:	83 c0 04             	add    $0x4,%eax
c000528e:	83 ec 08             	sub    $0x8,%esp
c0005291:	50                   	push   %eax
c0005292:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0005295:	50                   	push   %eax
c0005296:	e8 fe e7 ff ff       	call   c0003a99 <strcmp>
c000529b:	83 c4 10             	add    $0x10,%esp
c000529e:	85 c0                	test   %eax,%eax
c00052a0:	75 07                	jne    c00052a9 <search_file+0x106>
c00052a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00052a5:	8b 00                	mov    (%eax),%eax
c00052a7:	eb 28                	jmp    c00052d1 <search_file+0x12e>
c00052a9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00052ad:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00052b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00052b4:	83 f8 1f             	cmp    $0x1f,%eax
c00052b7:	76 c3                	jbe    c000527c <search_file+0xd9>
c00052b9:	eb 01                	jmp    c00052bc <search_file+0x119>
c00052bb:	90                   	nop
c00052bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00052c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00052c3:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00052c6:	0f 8c 7b ff ff ff    	jl     c0005247 <search_file+0xa4>
c00052cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00052d1:	c9                   	leave  
c00052d2:	c3                   	ret    

c00052d3 <strip_path>:
c00052d3:	55                   	push   %ebp
c00052d4:	89 e5                	mov    %esp,%ebp
c00052d6:	83 ec 10             	sub    $0x10,%esp
c00052d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00052dd:	75 0a                	jne    c00052e9 <strip_path+0x16>
c00052df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00052e4:	e9 b4 00 00 00       	jmp    c000539d <strip_path+0xca>
c00052e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00052ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052f2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00052f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00052f8:	0f b6 00             	movzbl (%eax),%eax
c00052fb:	3c 2f                	cmp    $0x2f,%al
c00052fd:	75 2d                	jne    c000532c <strip_path+0x59>
c00052ff:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0005303:	eb 27                	jmp    c000532c <strip_path+0x59>
c0005305:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0005308:	0f b6 00             	movzbl (%eax),%eax
c000530b:	3c 2f                	cmp    $0x2f,%al
c000530d:	75 0a                	jne    c0005319 <strip_path+0x46>
c000530f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005314:	e9 84 00 00 00       	jmp    c000539d <strip_path+0xca>
c0005319:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000531c:	0f b6 10             	movzbl (%eax),%edx
c000531f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005322:	88 10                	mov    %dl,(%eax)
c0005324:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0005328:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000532c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000532f:	0f b6 00             	movzbl (%eax),%eax
c0005332:	84 c0                	test   %al,%al
c0005334:	75 cf                	jne    c0005305 <strip_path+0x32>
c0005336:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005339:	c6 00 00             	movb   $0x0,(%eax)
c000533c:	8b 45 10             	mov    0x10(%ebp),%eax
c000533f:	8b 15 c0 08 01 c0    	mov    0xc00108c0,%edx
c0005345:	89 10                	mov    %edx,(%eax)
c0005347:	8b 15 c4 08 01 c0    	mov    0xc00108c4,%edx
c000534d:	89 50 04             	mov    %edx,0x4(%eax)
c0005350:	8b 15 c8 08 01 c0    	mov    0xc00108c8,%edx
c0005356:	89 50 08             	mov    %edx,0x8(%eax)
c0005359:	8b 15 cc 08 01 c0    	mov    0xc00108cc,%edx
c000535f:	89 50 0c             	mov    %edx,0xc(%eax)
c0005362:	8b 15 d0 08 01 c0    	mov    0xc00108d0,%edx
c0005368:	89 50 10             	mov    %edx,0x10(%eax)
c000536b:	8b 15 d4 08 01 c0    	mov    0xc00108d4,%edx
c0005371:	89 50 14             	mov    %edx,0x14(%eax)
c0005374:	8b 15 d8 08 01 c0    	mov    0xc00108d8,%edx
c000537a:	89 50 18             	mov    %edx,0x18(%eax)
c000537d:	8b 15 dc 08 01 c0    	mov    0xc00108dc,%edx
c0005383:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005386:	8b 15 e0 08 01 c0    	mov    0xc00108e0,%edx
c000538c:	89 50 20             	mov    %edx,0x20(%eax)
c000538f:	8b 15 e4 08 01 c0    	mov    0xc00108e4,%edx
c0005395:	89 50 24             	mov    %edx,0x24(%eax)
c0005398:	b8 00 00 00 00       	mov    $0x0,%eax
c000539d:	c9                   	leave  
c000539e:	c3                   	ret    

c000539f <get_inode>:
c000539f:	55                   	push   %ebp
c00053a0:	89 e5                	mov    %esp,%ebp
c00053a2:	56                   	push   %esi
c00053a3:	53                   	push   %ebx
c00053a4:	83 ec 20             	sub    $0x20,%esp
c00053a7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00053ab:	75 0a                	jne    c00053b7 <get_inode+0x18>
c00053ad:	b8 00 00 00 00       	mov    $0x0,%eax
c00053b2:	e9 a3 01 00 00       	jmp    c000555a <get_inode+0x1bb>
c00053b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00053be:	c7 45 f0 c0 fe 00 c0 	movl   $0xc000fec0,-0x10(%ebp)
c00053c5:	eb 69                	jmp    c0005430 <get_inode+0x91>
c00053c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00053ca:	8b 40 24             	mov    0x24(%eax),%eax
c00053cd:	85 c0                	test   %eax,%eax
c00053cf:	7e 53                	jle    c0005424 <get_inode+0x85>
c00053d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00053d4:	8b 40 10             	mov    0x10(%eax),%eax
c00053d7:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00053da:	75 50                	jne    c000542c <get_inode+0x8d>
c00053dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00053df:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00053e2:	8b 0a                	mov    (%edx),%ecx
c00053e4:	89 08                	mov    %ecx,(%eax)
c00053e6:	8b 4a 04             	mov    0x4(%edx),%ecx
c00053e9:	89 48 04             	mov    %ecx,0x4(%eax)
c00053ec:	8b 4a 08             	mov    0x8(%edx),%ecx
c00053ef:	89 48 08             	mov    %ecx,0x8(%eax)
c00053f2:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00053f5:	89 48 0c             	mov    %ecx,0xc(%eax)
c00053f8:	8b 4a 10             	mov    0x10(%edx),%ecx
c00053fb:	89 48 10             	mov    %ecx,0x10(%eax)
c00053fe:	8b 4a 14             	mov    0x14(%edx),%ecx
c0005401:	89 48 14             	mov    %ecx,0x14(%eax)
c0005404:	8b 4a 18             	mov    0x18(%edx),%ecx
c0005407:	89 48 18             	mov    %ecx,0x18(%eax)
c000540a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000540d:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0005410:	8b 4a 20             	mov    0x20(%edx),%ecx
c0005413:	89 48 20             	mov    %ecx,0x20(%eax)
c0005416:	8b 52 24             	mov    0x24(%edx),%edx
c0005419:	89 50 24             	mov    %edx,0x24(%eax)
c000541c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000541f:	e9 36 01 00 00       	jmp    c000555a <get_inode+0x1bb>
c0005424:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005427:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000542a:	eb 0d                	jmp    c0005439 <get_inode+0x9a>
c000542c:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0005430:	81 7d f0 c0 08 01 c0 	cmpl   $0xc00108c0,-0x10(%ebp)
c0005437:	76 8e                	jbe    c00053c7 <get_inode+0x28>
c0005439:	e8 16 12 00 00       	call   c0006654 <get_super_block>
c000543e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005441:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0005448:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000544b:	8b 40 04             	mov    0x4(%eax),%eax
c000544e:	8d 50 02             	lea    0x2(%eax),%edx
c0005451:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005454:	8b 40 08             	mov    0x8(%eax),%eax
c0005457:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c000545a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000545d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0005460:	b8 00 02 00 00       	mov    $0x200,%eax
c0005465:	99                   	cltd   
c0005466:	f7 7d e8             	idivl  -0x18(%ebp)
c0005469:	89 c6                	mov    %eax,%esi
c000546b:	89 c8                	mov    %ecx,%eax
c000546d:	99                   	cltd   
c000546e:	f7 fe                	idiv   %esi
c0005470:	01 d8                	add    %ebx,%eax
c0005472:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005475:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000547c:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005481:	83 ec 0c             	sub    $0xc,%esp
c0005484:	6a 07                	push   $0x7
c0005486:	68 00 02 00 00       	push   $0x200
c000548b:	50                   	push   %eax
c000548c:	ff 75 e0             	pushl  -0x20(%ebp)
c000548f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0005492:	e8 98 f4 ff ff       	call   c000492f <rd_wt>
c0005497:	83 c4 20             	add    $0x20,%esp
c000549a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000549d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00054a0:	b8 00 02 00 00       	mov    $0x200,%eax
c00054a5:	99                   	cltd   
c00054a6:	f7 7d e8             	idivl  -0x18(%ebp)
c00054a9:	89 c3                	mov    %eax,%ebx
c00054ab:	89 c8                	mov    %ecx,%eax
c00054ad:	99                   	cltd   
c00054ae:	f7 fb                	idiv   %ebx
c00054b0:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00054b3:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c00054b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00054bc:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00054c0:	01 d0                	add    %edx,%eax
c00054c2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00054c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00054c8:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00054cb:	8b 0a                	mov    (%edx),%ecx
c00054cd:	89 08                	mov    %ecx,(%eax)
c00054cf:	8b 4a 04             	mov    0x4(%edx),%ecx
c00054d2:	89 48 04             	mov    %ecx,0x4(%eax)
c00054d5:	8b 4a 08             	mov    0x8(%edx),%ecx
c00054d8:	89 48 08             	mov    %ecx,0x8(%eax)
c00054db:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00054de:	89 48 0c             	mov    %ecx,0xc(%eax)
c00054e1:	8b 4a 10             	mov    0x10(%edx),%ecx
c00054e4:	89 48 10             	mov    %ecx,0x10(%eax)
c00054e7:	8b 4a 14             	mov    0x14(%edx),%ecx
c00054ea:	89 48 14             	mov    %ecx,0x14(%eax)
c00054ed:	8b 4a 18             	mov    0x18(%edx),%ecx
c00054f0:	89 48 18             	mov    %ecx,0x18(%eax)
c00054f3:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00054f6:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00054f9:	8b 4a 20             	mov    0x20(%edx),%ecx
c00054fc:	89 48 20             	mov    %ecx,0x20(%eax)
c00054ff:	8b 52 24             	mov    0x24(%edx),%edx
c0005502:	89 50 24             	mov    %edx,0x24(%eax)
c0005505:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005508:	8b 55 0c             	mov    0xc(%ebp),%edx
c000550b:	89 50 10             	mov    %edx,0x10(%eax)
c000550e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005511:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005514:	89 50 20             	mov    %edx,0x20(%eax)
c0005517:	8b 45 08             	mov    0x8(%ebp),%eax
c000551a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000551d:	8b 0a                	mov    (%edx),%ecx
c000551f:	89 08                	mov    %ecx,(%eax)
c0005521:	8b 4a 04             	mov    0x4(%edx),%ecx
c0005524:	89 48 04             	mov    %ecx,0x4(%eax)
c0005527:	8b 4a 08             	mov    0x8(%edx),%ecx
c000552a:	89 48 08             	mov    %ecx,0x8(%eax)
c000552d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0005530:	89 48 0c             	mov    %ecx,0xc(%eax)
c0005533:	8b 4a 10             	mov    0x10(%edx),%ecx
c0005536:	89 48 10             	mov    %ecx,0x10(%eax)
c0005539:	8b 4a 14             	mov    0x14(%edx),%ecx
c000553c:	89 48 14             	mov    %ecx,0x14(%eax)
c000553f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0005542:	89 48 18             	mov    %ecx,0x18(%eax)
c0005545:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0005548:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000554b:	8b 4a 20             	mov    0x20(%edx),%ecx
c000554e:	89 48 20             	mov    %ecx,0x20(%eax)
c0005551:	8b 52 24             	mov    0x24(%edx),%edx
c0005554:	89 50 24             	mov    %edx,0x24(%eax)
c0005557:	8b 45 08             	mov    0x8(%ebp),%eax
c000555a:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000555d:	5b                   	pop    %ebx
c000555e:	5e                   	pop    %esi
c000555f:	5d                   	pop    %ebp
c0005560:	c3                   	ret    

c0005561 <create_file>:
c0005561:	55                   	push   %ebp
c0005562:	89 e5                	mov    %esp,%ebp
c0005564:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000556a:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000556d:	50                   	push   %eax
c000556e:	ff 75 0c             	pushl  0xc(%ebp)
c0005571:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0005574:	50                   	push   %eax
c0005575:	e8 59 fd ff ff       	call   c00052d3 <strip_path>
c000557a:	83 c4 0c             	add    $0xc,%esp
c000557d:	83 f8 ff             	cmp    $0xffffffff,%eax
c0005580:	75 0a                	jne    c000558c <create_file+0x2b>
c0005582:	b8 00 00 00 00       	mov    $0x0,%eax
c0005587:	e9 de 00 00 00       	jmp    c000566a <create_file+0x109>
c000558c:	e8 db 00 00 00       	call   c000566c <alloc_imap_bit>
c0005591:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005594:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005598:	75 0a                	jne    c00055a4 <create_file+0x43>
c000559a:	b8 00 00 00 00       	mov    $0x0,%eax
c000559f:	e9 c6 00 00 00       	jmp    c000566a <create_file+0x109>
c00055a4:	e8 ab 10 00 00       	call   c0006654 <get_super_block>
c00055a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00055ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055af:	8b 40 10             	mov    0x10(%eax),%eax
c00055b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00055b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00055b8:	83 ec 08             	sub    $0x8,%esp
c00055bb:	50                   	push   %eax
c00055bc:	ff 75 f4             	pushl  -0xc(%ebp)
c00055bf:	e8 a5 01 00 00       	call   c0005769 <alloc_smap_bit>
c00055c4:	83 c4 10             	add    $0x10,%esp
c00055c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00055ca:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00055ce:	75 0a                	jne    c00055da <create_file+0x79>
c00055d0:	b8 00 00 00 00       	mov    $0x0,%eax
c00055d5:	e9 90 00 00 00       	jmp    c000566a <create_file+0x109>
c00055da:	83 ec 04             	sub    $0x4,%esp
c00055dd:	ff 75 e8             	pushl  -0x18(%ebp)
c00055e0:	ff 75 f4             	pushl  -0xc(%ebp)
c00055e3:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00055e6:	50                   	push   %eax
c00055e7:	e8 1e 03 00 00       	call   c000590a <new_inode>
c00055ec:	83 c4 10             	add    $0x10,%esp
c00055ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00055f2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00055f6:	75 07                	jne    c00055ff <create_file+0x9e>
c00055f8:	b8 00 00 00 00       	mov    $0x0,%eax
c00055fd:	eb 6b                	jmp    c000566a <create_file+0x109>
c00055ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0005602:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0005605:	50                   	push   %eax
c0005606:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0005609:	50                   	push   %eax
c000560a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0005610:	50                   	push   %eax
c0005611:	e8 12 04 00 00       	call   c0005a28 <new_dir_entry>
c0005616:	83 c4 10             	add    $0x10,%esp
c0005619:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000561c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0005620:	75 07                	jne    c0005629 <create_file+0xc8>
c0005622:	b8 00 00 00 00       	mov    $0x0,%eax
c0005627:	eb 41                	jmp    c000566a <create_file+0x109>
c0005629:	8b 45 08             	mov    0x8(%ebp),%eax
c000562c:	8b 55 84             	mov    -0x7c(%ebp),%edx
c000562f:	89 10                	mov    %edx,(%eax)
c0005631:	8b 55 88             	mov    -0x78(%ebp),%edx
c0005634:	89 50 04             	mov    %edx,0x4(%eax)
c0005637:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000563a:	89 50 08             	mov    %edx,0x8(%eax)
c000563d:	8b 55 90             	mov    -0x70(%ebp),%edx
c0005640:	89 50 0c             	mov    %edx,0xc(%eax)
c0005643:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0005646:	89 50 10             	mov    %edx,0x10(%eax)
c0005649:	8b 55 98             	mov    -0x68(%ebp),%edx
c000564c:	89 50 14             	mov    %edx,0x14(%eax)
c000564f:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0005652:	89 50 18             	mov    %edx,0x18(%eax)
c0005655:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0005658:	89 50 1c             	mov    %edx,0x1c(%eax)
c000565b:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c000565e:	89 50 20             	mov    %edx,0x20(%eax)
c0005661:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0005664:	89 50 24             	mov    %edx,0x24(%eax)
c0005667:	8b 45 08             	mov    0x8(%ebp),%eax
c000566a:	c9                   	leave  
c000566b:	c3                   	ret    

c000566c <alloc_imap_bit>:
c000566c:	55                   	push   %ebp
c000566d:	89 e5                	mov    %esp,%ebp
c000566f:	53                   	push   %ebx
c0005670:	83 ec 24             	sub    $0x24,%esp
c0005673:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000567a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0005681:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005686:	83 ec 0c             	sub    $0xc,%esp
c0005689:	6a 07                	push   $0x7
c000568b:	68 00 02 00 00       	push   $0x200
c0005690:	50                   	push   %eax
c0005691:	ff 75 e8             	pushl  -0x18(%ebp)
c0005694:	ff 75 ec             	pushl  -0x14(%ebp)
c0005697:	e8 93 f2 ff ff       	call   c000492f <rd_wt>
c000569c:	83 c4 20             	add    $0x20,%esp
c000569f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00056a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00056ad:	e9 a5 00 00 00       	jmp    c0005757 <alloc_imap_bit+0xeb>
c00056b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00056b9:	e9 8b 00 00 00       	jmp    c0005749 <alloc_imap_bit+0xdd>
c00056be:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c00056c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056c7:	01 d0                	add    %edx,%eax
c00056c9:	0f b6 00             	movzbl (%eax),%eax
c00056cc:	0f be d0             	movsbl %al,%edx
c00056cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00056d2:	89 c1                	mov    %eax,%ecx
c00056d4:	d3 fa                	sar    %cl,%edx
c00056d6:	89 d0                	mov    %edx,%eax
c00056d8:	83 e0 01             	and    $0x1,%eax
c00056db:	85 c0                	test   %eax,%eax
c00056dd:	74 06                	je     c00056e5 <alloc_imap_bit+0x79>
c00056df:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00056e3:	eb 64                	jmp    c0005749 <alloc_imap_bit+0xdd>
c00056e5:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c00056eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056ee:	01 d0                	add    %edx,%eax
c00056f0:	0f b6 18             	movzbl (%eax),%ebx
c00056f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00056f6:	ba 01 00 00 00       	mov    $0x1,%edx
c00056fb:	89 c1                	mov    %eax,%ecx
c00056fd:	d3 e2                	shl    %cl,%edx
c00056ff:	89 d0                	mov    %edx,%eax
c0005701:	89 c1                	mov    %eax,%ecx
c0005703:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005709:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000570c:	01 d0                	add    %edx,%eax
c000570e:	09 cb                	or     %ecx,%ebx
c0005710:	89 da                	mov    %ebx,%edx
c0005712:	88 10                	mov    %dl,(%eax)
c0005714:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005717:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000571e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005721:	01 d0                	add    %edx,%eax
c0005723:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005726:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c000572b:	83 ec 0c             	sub    $0xc,%esp
c000572e:	6a 0a                	push   $0xa
c0005730:	68 00 02 00 00       	push   $0x200
c0005735:	50                   	push   %eax
c0005736:	ff 75 e8             	pushl  -0x18(%ebp)
c0005739:	ff 75 ec             	pushl  -0x14(%ebp)
c000573c:	e8 ee f1 ff ff       	call   c000492f <rd_wt>
c0005741:	83 c4 20             	add    $0x20,%esp
c0005744:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005747:	eb 1b                	jmp    c0005764 <alloc_imap_bit+0xf8>
c0005749:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c000574d:	0f 8e 6b ff ff ff    	jle    c00056be <alloc_imap_bit+0x52>
c0005753:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005757:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c000575e:	0f 8e 4e ff ff ff    	jle    c00056b2 <alloc_imap_bit+0x46>
c0005764:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005767:	c9                   	leave  
c0005768:	c3                   	ret    

c0005769 <alloc_smap_bit>:
c0005769:	55                   	push   %ebp
c000576a:	89 e5                	mov    %esp,%ebp
c000576c:	53                   	push   %ebx
c000576d:	83 ec 34             	sub    $0x34,%esp
c0005770:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005774:	75 1c                	jne    c0005792 <alloc_smap_bit+0x29>
c0005776:	68 0e 03 00 00       	push   $0x30e
c000577b:	68 14 97 00 c0       	push   $0xc0009714
c0005780:	68 14 97 00 c0       	push   $0xc0009714
c0005785:	68 aa 97 00 c0       	push   $0xc00097aa
c000578a:	e8 98 d8 ff ff       	call   c0003027 <assertion_failure>
c000578f:	83 c4 10             	add    $0x10,%esp
c0005792:	e8 bd 0e 00 00       	call   c0006654 <get_super_block>
c0005797:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000579a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000579d:	8b 40 08             	mov    0x8(%eax),%eax
c00057a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00057a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00057a6:	8b 40 04             	mov    0x4(%eax),%eax
c00057a9:	83 c0 02             	add    $0x2,%eax
c00057ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00057af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00057b6:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00057bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00057c4:	e9 20 01 00 00       	jmp    c00058e9 <alloc_smap_bit+0x180>
c00057c9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00057cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00057cf:	01 d0                	add    %edx,%eax
c00057d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00057d4:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c00057d9:	83 ec 0c             	sub    $0xc,%esp
c00057dc:	6a 07                	push   $0x7
c00057de:	68 00 02 00 00       	push   $0x200
c00057e3:	50                   	push   %eax
c00057e4:	ff 75 d8             	pushl  -0x28(%ebp)
c00057e7:	ff 75 d4             	pushl  -0x2c(%ebp)
c00057ea:	e8 40 f1 ff ff       	call   c000492f <rd_wt>
c00057ef:	83 c4 20             	add    $0x20,%esp
c00057f2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00057f9:	e9 b0 00 00 00       	jmp    c00058ae <alloc_smap_bit+0x145>
c00057fe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005805:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005809:	0f 85 8c 00 00 00    	jne    c000589b <alloc_smap_bit+0x132>
c000580f:	eb 45                	jmp    c0005856 <alloc_smap_bit+0xed>
c0005811:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005817:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000581a:	01 d0                	add    %edx,%eax
c000581c:	0f b6 00             	movzbl (%eax),%eax
c000581f:	0f be d0             	movsbl %al,%edx
c0005822:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005825:	89 c1                	mov    %eax,%ecx
c0005827:	d3 fa                	sar    %cl,%edx
c0005829:	89 d0                	mov    %edx,%eax
c000582b:	83 e0 01             	and    $0x1,%eax
c000582e:	85 c0                	test   %eax,%eax
c0005830:	74 06                	je     c0005838 <alloc_smap_bit+0xcf>
c0005832:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005836:	eb 1e                	jmp    c0005856 <alloc_smap_bit+0xed>
c0005838:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000583b:	c1 e0 09             	shl    $0x9,%eax
c000583e:	89 c2                	mov    %eax,%edx
c0005840:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005843:	01 d0                	add    %edx,%eax
c0005845:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000584c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000584f:	01 d0                	add    %edx,%eax
c0005851:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005854:	eb 06                	jmp    c000585c <alloc_smap_bit+0xf3>
c0005856:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000585a:	7e b5                	jle    c0005811 <alloc_smap_bit+0xa8>
c000585c:	eb 3d                	jmp    c000589b <alloc_smap_bit+0x132>
c000585e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0005862:	74 45                	je     c00058a9 <alloc_smap_bit+0x140>
c0005864:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c000586a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000586d:	01 d0                	add    %edx,%eax
c000586f:	0f b6 18             	movzbl (%eax),%ebx
c0005872:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005875:	ba 01 00 00 00       	mov    $0x1,%edx
c000587a:	89 c1                	mov    %eax,%ecx
c000587c:	d3 e2                	shl    %cl,%edx
c000587e:	89 d0                	mov    %edx,%eax
c0005880:	89 c1                	mov    %eax,%ecx
c0005882:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005888:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000588b:	01 d0                	add    %edx,%eax
c000588d:	09 cb                	or     %ecx,%ebx
c000588f:	89 da                	mov    %ebx,%edx
c0005891:	88 10                	mov    %dl,(%eax)
c0005893:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0005897:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000589b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000589f:	74 09                	je     c00058aa <alloc_smap_bit+0x141>
c00058a1:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00058a5:	7e b7                	jle    c000585e <alloc_smap_bit+0xf5>
c00058a7:	eb 01                	jmp    c00058aa <alloc_smap_bit+0x141>
c00058a9:	90                   	nop
c00058aa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00058ae:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c00058b5:	0f 8e 43 ff ff ff    	jle    c00057fe <alloc_smap_bit+0x95>
c00058bb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00058bf:	74 1e                	je     c00058df <alloc_smap_bit+0x176>
c00058c1:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c00058c6:	83 ec 0c             	sub    $0xc,%esp
c00058c9:	6a 0a                	push   $0xa
c00058cb:	68 00 02 00 00       	push   $0x200
c00058d0:	50                   	push   %eax
c00058d1:	ff 75 d8             	pushl  -0x28(%ebp)
c00058d4:	ff 75 d4             	pushl  -0x2c(%ebp)
c00058d7:	e8 53 f0 ff ff       	call   c000492f <rd_wt>
c00058dc:	83 c4 20             	add    $0x20,%esp
c00058df:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00058e3:	74 12                	je     c00058f7 <alloc_smap_bit+0x18e>
c00058e5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00058e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00058ec:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c00058ef:	0f 8c d4 fe ff ff    	jl     c00057c9 <alloc_smap_bit+0x60>
c00058f5:	eb 01                	jmp    c00058f8 <alloc_smap_bit+0x18f>
c00058f7:	90                   	nop
c00058f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058fb:	8d 50 ff             	lea    -0x1(%eax),%edx
c00058fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005901:	8b 00                	mov    (%eax),%eax
c0005903:	01 d0                	add    %edx,%eax
c0005905:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005908:	c9                   	leave  
c0005909:	c3                   	ret    

c000590a <new_inode>:
c000590a:	55                   	push   %ebp
c000590b:	89 e5                	mov    %esp,%ebp
c000590d:	83 ec 38             	sub    $0x38,%esp
c0005910:	83 ec 08             	sub    $0x8,%esp
c0005913:	ff 75 0c             	pushl  0xc(%ebp)
c0005916:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0005919:	50                   	push   %eax
c000591a:	e8 80 fa ff ff       	call   c000539f <get_inode>
c000591f:	83 c4 10             	add    $0x10,%esp
c0005922:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005925:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005929:	75 0a                	jne    c0005935 <new_inode+0x2b>
c000592b:	b8 00 00 00 00       	mov    $0x0,%eax
c0005930:	e9 f1 00 00 00       	jmp    c0005a26 <new_inode+0x11c>
c0005935:	8b 45 10             	mov    0x10(%ebp),%eax
c0005938:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000593b:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0005942:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0005949:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0005950:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005953:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005956:	83 ec 0c             	sub    $0xc,%esp
c0005959:	8d 45 c8             	lea    -0x38(%ebp),%eax
c000595c:	50                   	push   %eax
c000595d:	e8 0e 0b 00 00       	call   c0006470 <sync_inode>
c0005962:	83 c4 10             	add    $0x10,%esp
c0005965:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000596c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005973:	eb 1d                	jmp    c0005992 <new_inode+0x88>
c0005975:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005978:	89 d0                	mov    %edx,%eax
c000597a:	c1 e0 02             	shl    $0x2,%eax
c000597d:	01 d0                	add    %edx,%eax
c000597f:	c1 e0 03             	shl    $0x3,%eax
c0005982:	05 d0 fe 00 c0       	add    $0xc000fed0,%eax
c0005987:	8b 00                	mov    (%eax),%eax
c0005989:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000598c:	74 0c                	je     c000599a <new_inode+0x90>
c000598e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005992:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0005996:	7e dd                	jle    c0005975 <new_inode+0x6b>
c0005998:	eb 01                	jmp    c000599b <new_inode+0x91>
c000599a:	90                   	nop
c000599b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000599e:	89 d0                	mov    %edx,%eax
c00059a0:	c1 e0 02             	shl    $0x2,%eax
c00059a3:	01 d0                	add    %edx,%eax
c00059a5:	c1 e0 03             	shl    $0x3,%eax
c00059a8:	05 c0 fe 00 c0       	add    $0xc000fec0,%eax
c00059ad:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00059b0:	89 10                	mov    %edx,(%eax)
c00059b2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00059b5:	89 50 04             	mov    %edx,0x4(%eax)
c00059b8:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00059bb:	89 50 08             	mov    %edx,0x8(%eax)
c00059be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00059c1:	89 50 0c             	mov    %edx,0xc(%eax)
c00059c4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00059c7:	89 50 10             	mov    %edx,0x10(%eax)
c00059ca:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00059cd:	89 50 14             	mov    %edx,0x14(%eax)
c00059d0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00059d3:	89 50 18             	mov    %edx,0x18(%eax)
c00059d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00059d9:	89 50 1c             	mov    %edx,0x1c(%eax)
c00059dc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00059df:	89 50 20             	mov    %edx,0x20(%eax)
c00059e2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00059e5:	89 50 24             	mov    %edx,0x24(%eax)
c00059e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00059eb:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00059ee:	89 10                	mov    %edx,(%eax)
c00059f0:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00059f3:	89 50 04             	mov    %edx,0x4(%eax)
c00059f6:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00059f9:	89 50 08             	mov    %edx,0x8(%eax)
c00059fc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00059ff:	89 50 0c             	mov    %edx,0xc(%eax)
c0005a02:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0005a05:	89 50 10             	mov    %edx,0x10(%eax)
c0005a08:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0005a0b:	89 50 14             	mov    %edx,0x14(%eax)
c0005a0e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005a11:	89 50 18             	mov    %edx,0x18(%eax)
c0005a14:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0005a17:	89 50 1c             	mov    %edx,0x1c(%eax)
c0005a1a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0005a1d:	89 50 20             	mov    %edx,0x20(%eax)
c0005a20:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005a23:	89 50 24             	mov    %edx,0x24(%eax)
c0005a26:	c9                   	leave  
c0005a27:	c3                   	ret    

c0005a28 <new_dir_entry>:
c0005a28:	55                   	push   %ebp
c0005a29:	89 e5                	mov    %esp,%ebp
c0005a2b:	83 ec 48             	sub    $0x48,%esp
c0005a2e:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0005a35:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a38:	8b 40 04             	mov    0x4(%eax),%eax
c0005a3b:	99                   	cltd   
c0005a3c:	f7 7d dc             	idivl  -0x24(%ebp)
c0005a3f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005a42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a45:	8b 40 0c             	mov    0xc(%eax),%eax
c0005a48:	99                   	cltd   
c0005a49:	f7 7d dc             	idivl  -0x24(%ebp)
c0005a4c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005a4f:	e8 00 0c 00 00       	call   c0006654 <get_super_block>
c0005a54:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005a57:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005a5a:	8b 00                	mov    (%eax),%eax
c0005a5c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005a5f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a62:	8b 40 0c             	mov    0xc(%eax),%eax
c0005a65:	05 00 02 00 00       	add    $0x200,%eax
c0005a6a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0005a70:	85 c0                	test   %eax,%eax
c0005a72:	0f 48 c2             	cmovs  %edx,%eax
c0005a75:	c1 f8 09             	sar    $0x9,%eax
c0005a78:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005a7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005a82:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005a89:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0005a90:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005a97:	eb 7d                	jmp    c0005b16 <new_dir_entry+0xee>
c0005a99:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005a9e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0005aa1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0005aa4:	01 ca                	add    %ecx,%edx
c0005aa6:	83 ec 0c             	sub    $0xc,%esp
c0005aa9:	6a 07                	push   $0x7
c0005aab:	68 00 02 00 00       	push   $0x200
c0005ab0:	50                   	push   %eax
c0005ab1:	ff 75 c4             	pushl  -0x3c(%ebp)
c0005ab4:	52                   	push   %edx
c0005ab5:	e8 75 ee ff ff       	call   c000492f <rd_wt>
c0005aba:	83 c4 20             	add    $0x20,%esp
c0005abd:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005ac2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005ac5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005acc:	eb 25                	jmp    c0005af3 <new_dir_entry+0xcb>
c0005ace:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005ad2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005ad5:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0005ad8:	7f 29                	jg     c0005b03 <new_dir_entry+0xdb>
c0005ada:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005add:	8b 00                	mov    (%eax),%eax
c0005adf:	85 c0                	test   %eax,%eax
c0005ae1:	75 08                	jne    c0005aeb <new_dir_entry+0xc3>
c0005ae3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ae6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005ae9:	eb 19                	jmp    c0005b04 <new_dir_entry+0xdc>
c0005aeb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005aef:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0005af3:	b8 00 02 00 00       	mov    $0x200,%eax
c0005af8:	99                   	cltd   
c0005af9:	f7 7d dc             	idivl  -0x24(%ebp)
c0005afc:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0005aff:	7c cd                	jl     c0005ace <new_dir_entry+0xa6>
c0005b01:	eb 01                	jmp    c0005b04 <new_dir_entry+0xdc>
c0005b03:	90                   	nop
c0005b04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005b07:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0005b0a:	7f 16                	jg     c0005b22 <new_dir_entry+0xfa>
c0005b0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005b10:	75 10                	jne    c0005b22 <new_dir_entry+0xfa>
c0005b12:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0005b16:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005b19:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0005b1c:	0f 8c 77 ff ff ff    	jl     c0005a99 <new_dir_entry+0x71>
c0005b22:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b25:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0005b28:	75 0a                	jne    c0005b34 <new_dir_entry+0x10c>
c0005b2a:	b8 00 00 00 00       	mov    $0x0,%eax
c0005b2f:	e9 fa 00 00 00       	jmp    c0005c2e <new_dir_entry+0x206>
c0005b34:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0005b3b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005b3f:	75 1e                	jne    c0005b5f <new_dir_entry+0x137>
c0005b41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b44:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b4a:	8b 50 04             	mov    0x4(%eax),%edx
c0005b4d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005b50:	01 c2                	add    %eax,%edx
c0005b52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b55:	89 50 04             	mov    %edx,0x4(%eax)
c0005b58:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0005b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b62:	8b 55 14             	mov    0x14(%ebp),%edx
c0005b65:	89 10                	mov    %edx,(%eax)
c0005b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b6a:	83 c0 04             	add    $0x4,%eax
c0005b6d:	83 ec 08             	sub    $0x8,%esp
c0005b70:	ff 75 10             	pushl  0x10(%ebp)
c0005b73:	50                   	push   %eax
c0005b74:	e8 36 3e 00 00       	call   c00099af <Strcpy>
c0005b79:	83 c4 10             	add    $0x10,%esp
c0005b7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0005b7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0005b82:	8b 0a                	mov    (%edx),%ecx
c0005b84:	89 08                	mov    %ecx,(%eax)
c0005b86:	8b 4a 04             	mov    0x4(%edx),%ecx
c0005b89:	89 48 04             	mov    %ecx,0x4(%eax)
c0005b8c:	8b 4a 08             	mov    0x8(%edx),%ecx
c0005b8f:	89 48 08             	mov    %ecx,0x8(%eax)
c0005b92:	8b 52 0c             	mov    0xc(%edx),%edx
c0005b95:	89 50 0c             	mov    %edx,0xc(%eax)
c0005b98:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005b9d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c0005ba0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0005ba3:	01 ca                	add    %ecx,%edx
c0005ba5:	83 ec 0c             	sub    $0xc,%esp
c0005ba8:	6a 0a                	push   $0xa
c0005baa:	68 00 02 00 00       	push   $0x200
c0005baf:	50                   	push   %eax
c0005bb0:	ff 75 c4             	pushl  -0x3c(%ebp)
c0005bb3:	52                   	push   %edx
c0005bb4:	e8 76 ed ff ff       	call   c000492f <rd_wt>
c0005bb9:	83 c4 20             	add    $0x20,%esp
c0005bbc:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0005bc0:	74 69                	je     c0005c2b <new_dir_entry+0x203>
c0005bc2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005bc5:	8b 10                	mov    (%eax),%edx
c0005bc7:	89 15 c0 08 01 c0    	mov    %edx,0xc00108c0
c0005bcd:	8b 50 04             	mov    0x4(%eax),%edx
c0005bd0:	89 15 c4 08 01 c0    	mov    %edx,0xc00108c4
c0005bd6:	8b 50 08             	mov    0x8(%eax),%edx
c0005bd9:	89 15 c8 08 01 c0    	mov    %edx,0xc00108c8
c0005bdf:	8b 50 0c             	mov    0xc(%eax),%edx
c0005be2:	89 15 cc 08 01 c0    	mov    %edx,0xc00108cc
c0005be8:	8b 50 10             	mov    0x10(%eax),%edx
c0005beb:	89 15 d0 08 01 c0    	mov    %edx,0xc00108d0
c0005bf1:	8b 50 14             	mov    0x14(%eax),%edx
c0005bf4:	89 15 d4 08 01 c0    	mov    %edx,0xc00108d4
c0005bfa:	8b 50 18             	mov    0x18(%eax),%edx
c0005bfd:	89 15 d8 08 01 c0    	mov    %edx,0xc00108d8
c0005c03:	8b 50 1c             	mov    0x1c(%eax),%edx
c0005c06:	89 15 dc 08 01 c0    	mov    %edx,0xc00108dc
c0005c0c:	8b 50 20             	mov    0x20(%eax),%edx
c0005c0f:	89 15 e0 08 01 c0    	mov    %edx,0xc00108e0
c0005c15:	8b 40 24             	mov    0x24(%eax),%eax
c0005c18:	a3 e4 08 01 c0       	mov    %eax,0xc00108e4
c0005c1d:	83 ec 0c             	sub    $0xc,%esp
c0005c20:	ff 75 0c             	pushl  0xc(%ebp)
c0005c23:	e8 48 08 00 00       	call   c0006470 <sync_inode>
c0005c28:	83 c4 10             	add    $0x10,%esp
c0005c2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c2e:	c9                   	leave  
c0005c2f:	c3                   	ret    

c0005c30 <do_unlink>:
c0005c30:	55                   	push   %ebp
c0005c31:	89 e5                	mov    %esp,%ebp
c0005c33:	53                   	push   %ebx
c0005c34:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0005c3a:	83 ec 08             	sub    $0x8,%esp
c0005c3d:	ff 75 08             	pushl  0x8(%ebp)
c0005c40:	68 bf 97 00 c0       	push   $0xc00097bf
c0005c45:	e8 4f de ff ff       	call   c0003a99 <strcmp>
c0005c4a:	83 c4 10             	add    $0x10,%esp
c0005c4d:	85 c0                	test   %eax,%eax
c0005c4f:	75 10                	jne    c0005c61 <do_unlink+0x31>
c0005c51:	83 ec 0c             	sub    $0xc,%esp
c0005c54:	68 c1 97 00 c0       	push   $0xc00097c1
c0005c59:	e8 ab d3 ff ff       	call   c0003009 <panic>
c0005c5e:	83 c4 10             	add    $0x10,%esp
c0005c61:	83 ec 0c             	sub    $0xc,%esp
c0005c64:	ff 75 08             	pushl  0x8(%ebp)
c0005c67:	e8 37 f5 ff ff       	call   c00051a3 <search_file>
c0005c6c:	83 c4 10             	add    $0x10,%esp
c0005c6f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005c72:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0005c76:	75 10                	jne    c0005c88 <do_unlink+0x58>
c0005c78:	83 ec 0c             	sub    $0xc,%esp
c0005c7b:	68 dd 97 00 c0       	push   $0xc00097dd
c0005c80:	e8 84 d3 ff ff       	call   c0003009 <panic>
c0005c85:	83 c4 10             	add    $0x10,%esp
c0005c88:	83 ec 08             	sub    $0x8,%esp
c0005c8b:	ff 75 d0             	pushl  -0x30(%ebp)
c0005c8e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0005c94:	50                   	push   %eax
c0005c95:	e8 05 f7 ff ff       	call   c000539f <get_inode>
c0005c9a:	83 c4 10             	add    $0x10,%esp
c0005c9d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005ca0:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0005ca4:	75 10                	jne    c0005cb6 <do_unlink+0x86>
c0005ca6:	83 ec 0c             	sub    $0xc,%esp
c0005ca9:	68 dd 97 00 c0       	push   $0xc00097dd
c0005cae:	e8 56 d3 ff ff       	call   c0003009 <panic>
c0005cb3:	83 c4 10             	add    $0x10,%esp
c0005cb6:	8b 45 88             	mov    -0x78(%ebp),%eax
c0005cb9:	85 c0                	test   %eax,%eax
c0005cbb:	7e 10                	jle    c0005ccd <do_unlink+0x9d>
c0005cbd:	83 ec 0c             	sub    $0xc,%esp
c0005cc0:	68 f8 97 00 c0       	push   $0xc00097f8
c0005cc5:	e8 3f d3 ff ff       	call   c0003009 <panic>
c0005cca:	83 c4 10             	add    $0x10,%esp
c0005ccd:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0005cd3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0005cd6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005cd9:	8d 50 07             	lea    0x7(%eax),%edx
c0005cdc:	85 c0                	test   %eax,%eax
c0005cde:	0f 48 c2             	cmovs  %edx,%eax
c0005ce1:	c1 f8 03             	sar    $0x3,%eax
c0005ce4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0005ce7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005cea:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0005cf0:	85 c0                	test   %eax,%eax
c0005cf2:	0f 48 c2             	cmovs  %edx,%eax
c0005cf5:	c1 f8 09             	sar    $0x9,%eax
c0005cf8:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005cfb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0005cfe:	99                   	cltd   
c0005cff:	c1 ea 1d             	shr    $0x1d,%edx
c0005d02:	01 d0                	add    %edx,%eax
c0005d04:	83 e0 07             	and    $0x7,%eax
c0005d07:	29 d0                	sub    %edx,%eax
c0005d09:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005d0c:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0005d13:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005d18:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0005d1b:	83 c2 02             	add    $0x2,%edx
c0005d1e:	83 ec 0c             	sub    $0xc,%esp
c0005d21:	6a 07                	push   $0x7
c0005d23:	68 00 02 00 00       	push   $0x200
c0005d28:	50                   	push   %eax
c0005d29:	ff 75 b8             	pushl  -0x48(%ebp)
c0005d2c:	52                   	push   %edx
c0005d2d:	e8 fd eb ff ff       	call   c000492f <rd_wt>
c0005d32:	83 c4 20             	add    $0x20,%esp
c0005d35:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005d3b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005d3e:	01 d0                	add    %edx,%eax
c0005d40:	0f b6 10             	movzbl (%eax),%edx
c0005d43:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0005d46:	bb 01 00 00 00       	mov    $0x1,%ebx
c0005d4b:	89 c1                	mov    %eax,%ecx
c0005d4d:	d3 e3                	shl    %cl,%ebx
c0005d4f:	89 d8                	mov    %ebx,%eax
c0005d51:	f7 d0                	not    %eax
c0005d53:	89 c3                	mov    %eax,%ebx
c0005d55:	8b 0d 20 c0 00 c0    	mov    0xc000c020,%ecx
c0005d5b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0005d5e:	01 c8                	add    %ecx,%eax
c0005d60:	21 da                	and    %ebx,%edx
c0005d62:	88 10                	mov    %dl,(%eax)
c0005d64:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005d69:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0005d6c:	83 c2 02             	add    $0x2,%edx
c0005d6f:	83 ec 0c             	sub    $0xc,%esp
c0005d72:	6a 0a                	push   $0xa
c0005d74:	68 00 02 00 00       	push   $0x200
c0005d79:	50                   	push   %eax
c0005d7a:	ff 75 b8             	pushl  -0x48(%ebp)
c0005d7d:	52                   	push   %edx
c0005d7e:	e8 ac eb ff ff       	call   c000492f <rd_wt>
c0005d83:	83 c4 20             	add    $0x20,%esp
c0005d86:	e8 c9 08 00 00       	call   c0006654 <get_super_block>
c0005d8b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0005d8e:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0005d94:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0005d97:	8b 00                	mov    (%eax),%eax
c0005d99:	29 c2                	sub    %eax,%edx
c0005d9b:	89 d0                	mov    %edx,%eax
c0005d9d:	83 c0 01             	add    $0x1,%eax
c0005da0:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0005da3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0005da6:	8d 50 07             	lea    0x7(%eax),%edx
c0005da9:	85 c0                	test   %eax,%eax
c0005dab:	0f 48 c2             	cmovs  %edx,%eax
c0005dae:	c1 f8 03             	sar    $0x3,%eax
c0005db1:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0005db4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0005db7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0005dbd:	85 c0                	test   %eax,%eax
c0005dbf:	0f 48 c2             	cmovs  %edx,%eax
c0005dc2:	c1 f8 09             	sar    $0x9,%eax
c0005dc5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0005dc8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0005dcb:	99                   	cltd   
c0005dcc:	c1 ea 1d             	shr    $0x1d,%edx
c0005dcf:	01 d0                	add    %edx,%eax
c0005dd1:	83 e0 07             	and    $0x7,%eax
c0005dd4:	29 d0                	sub    %edx,%eax
c0005dd6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0005dd9:	b8 08 00 00 00       	mov    $0x8,%eax
c0005dde:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0005de1:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0005de4:	29 c2                	sub    %eax,%edx
c0005de6:	89 d0                	mov    %edx,%eax
c0005de8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005deb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005dee:	8d 50 07             	lea    0x7(%eax),%edx
c0005df1:	85 c0                	test   %eax,%eax
c0005df3:	0f 48 c2             	cmovs  %edx,%eax
c0005df6:	c1 f8 03             	sar    $0x3,%eax
c0005df9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0005dfc:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005e01:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0005e04:	8b 52 04             	mov    0x4(%edx),%edx
c0005e07:	8d 4a 02             	lea    0x2(%edx),%ecx
c0005e0a:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0005e0d:	01 ca                	add    %ecx,%edx
c0005e0f:	83 ec 0c             	sub    $0xc,%esp
c0005e12:	6a 07                	push   $0x7
c0005e14:	68 00 02 00 00       	push   $0x200
c0005e19:	50                   	push   %eax
c0005e1a:	ff 75 b8             	pushl  -0x48(%ebp)
c0005e1d:	52                   	push   %edx
c0005e1e:	e8 0c eb ff ff       	call   c000492f <rd_wt>
c0005e23:	83 c4 20             	add    $0x20,%esp
c0005e26:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005e2c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0005e2f:	01 d0                	add    %edx,%eax
c0005e31:	0f b6 10             	movzbl (%eax),%edx
c0005e34:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0005e37:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0005e3c:	89 c1                	mov    %eax,%ecx
c0005e3e:	d3 e3                	shl    %cl,%ebx
c0005e40:	89 d8                	mov    %ebx,%eax
c0005e42:	f7 d0                	not    %eax
c0005e44:	89 c3                	mov    %eax,%ebx
c0005e46:	8b 0d 20 c0 00 c0    	mov    0xc000c020,%ecx
c0005e4c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0005e4f:	01 c8                	add    %ecx,%eax
c0005e51:	21 da                	and    %ebx,%edx
c0005e53:	88 10                	mov    %dl,(%eax)
c0005e55:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0005e5c:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0005e5f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005e62:	eb 6a                	jmp    c0005ece <do_unlink+0x29e>
c0005e64:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0005e6b:	75 4b                	jne    c0005eb8 <do_unlink+0x288>
c0005e6d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005e74:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005e79:	83 ec 0c             	sub    $0xc,%esp
c0005e7c:	6a 0a                	push   $0xa
c0005e7e:	68 00 02 00 00       	push   $0x200
c0005e83:	50                   	push   %eax
c0005e84:	ff 75 b8             	pushl  -0x48(%ebp)
c0005e87:	ff 75 ec             	pushl  -0x14(%ebp)
c0005e8a:	e8 a0 ea ff ff       	call   c000492f <rd_wt>
c0005e8f:	83 c4 20             	add    $0x20,%esp
c0005e92:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005e98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e9b:	8d 48 01             	lea    0x1(%eax),%ecx
c0005e9e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0005ea1:	83 ec 0c             	sub    $0xc,%esp
c0005ea4:	6a 07                	push   $0x7
c0005ea6:	68 00 02 00 00       	push   $0x200
c0005eab:	52                   	push   %edx
c0005eac:	ff 75 b8             	pushl  -0x48(%ebp)
c0005eaf:	50                   	push   %eax
c0005eb0:	e8 7a ea ff ff       	call   c000492f <rd_wt>
c0005eb5:	83 c4 20             	add    $0x20,%esp
c0005eb8:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005ebe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ec1:	01 d0                	add    %edx,%eax
c0005ec3:	c6 00 00             	movb   $0x0,(%eax)
c0005ec6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0005eca:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0005ece:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ed1:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0005ed4:	7c 8e                	jl     c0005e64 <do_unlink+0x234>
c0005ed6:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0005edd:	75 4b                	jne    c0005f2a <do_unlink+0x2fa>
c0005edf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005ee6:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005eeb:	83 ec 0c             	sub    $0xc,%esp
c0005eee:	6a 0a                	push   $0xa
c0005ef0:	68 00 02 00 00       	push   $0x200
c0005ef5:	50                   	push   %eax
c0005ef6:	ff 75 b8             	pushl  -0x48(%ebp)
c0005ef9:	ff 75 ec             	pushl  -0x14(%ebp)
c0005efc:	e8 2e ea ff ff       	call   c000492f <rd_wt>
c0005f01:	83 c4 20             	add    $0x20,%esp
c0005f04:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005f0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005f0d:	8d 48 01             	lea    0x1(%eax),%ecx
c0005f10:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c0005f13:	83 ec 0c             	sub    $0xc,%esp
c0005f16:	6a 07                	push   $0x7
c0005f18:	68 00 02 00 00       	push   $0x200
c0005f1d:	52                   	push   %edx
c0005f1e:	ff 75 b8             	pushl  -0x48(%ebp)
c0005f21:	50                   	push   %eax
c0005f22:	e8 08 ea ff ff       	call   c000492f <rd_wt>
c0005f27:	83 c4 20             	add    $0x20,%esp
c0005f2a:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0005f30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f33:	01 d0                	add    %edx,%eax
c0005f35:	0f b6 10             	movzbl (%eax),%edx
c0005f38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f3b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0005f40:	89 c1                	mov    %eax,%ecx
c0005f42:	d3 e3                	shl    %cl,%ebx
c0005f44:	89 d8                	mov    %ebx,%eax
c0005f46:	89 c3                	mov    %eax,%ebx
c0005f48:	8b 0d 20 c0 00 c0    	mov    0xc000c020,%ecx
c0005f4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f51:	01 c8                	add    %ecx,%eax
c0005f53:	21 da                	and    %ebx,%edx
c0005f55:	88 10                	mov    %dl,(%eax)
c0005f57:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0005f5c:	83 ec 0c             	sub    $0xc,%esp
c0005f5f:	6a 0a                	push   $0xa
c0005f61:	68 00 02 00 00       	push   $0x200
c0005f66:	50                   	push   %eax
c0005f67:	ff 75 b8             	pushl  -0x48(%ebp)
c0005f6a:	ff 75 ec             	pushl  -0x14(%ebp)
c0005f6d:	e8 bd e9 ff ff       	call   c000492f <rd_wt>
c0005f72:	83 c4 20             	add    $0x20,%esp
c0005f75:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0005f7c:	00 00 00 
c0005f7f:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0005f86:	00 00 00 
c0005f89:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0005f90:	00 00 00 
c0005f93:	83 ec 0c             	sub    $0xc,%esp
c0005f96:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0005f9c:	50                   	push   %eax
c0005f9d:	e8 ce 04 00 00       	call   c0006470 <sync_inode>
c0005fa2:	83 c4 10             	add    $0x10,%esp
c0005fa5:	83 ec 0c             	sub    $0xc,%esp
c0005fa8:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0005fae:	50                   	push   %eax
c0005faf:	e8 10 06 00 00       	call   c00065c4 <put_inode>
c0005fb4:	83 c4 10             	add    $0x10,%esp
c0005fb7:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0005fba:	8b 00                	mov    (%eax),%eax
c0005fbc:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0005fbf:	c7 45 98 c0 08 01 c0 	movl   $0xc00108c0,-0x68(%ebp)
c0005fc6:	8b 45 98             	mov    -0x68(%ebp),%eax
c0005fc9:	8b 40 04             	mov    0x4(%eax),%eax
c0005fcc:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0005fcf:	8b 45 98             	mov    -0x68(%ebp),%eax
c0005fd2:	8b 40 0c             	mov    0xc(%eax),%eax
c0005fd5:	89 45 90             	mov    %eax,-0x70(%ebp)
c0005fd8:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0005fdb:	c1 e8 04             	shr    $0x4,%eax
c0005fde:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0005fe1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005fe8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005fef:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0005ff6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0005ffd:	e9 a3 00 00 00       	jmp    c00060a5 <do_unlink+0x475>
c0006002:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0006007:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c000600a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000600d:	01 ca                	add    %ecx,%edx
c000600f:	83 ec 0c             	sub    $0xc,%esp
c0006012:	6a 07                	push   $0x7
c0006014:	68 00 02 00 00       	push   $0x200
c0006019:	50                   	push   %eax
c000601a:	ff 75 b8             	pushl  -0x48(%ebp)
c000601d:	52                   	push   %edx
c000601e:	e8 0c e9 ff ff       	call   c000492f <rd_wt>
c0006023:	83 c4 20             	add    $0x20,%esp
c0006026:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c000602b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000602e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0006035:	eb 51                	jmp    c0006088 <do_unlink+0x458>
c0006037:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000603b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000603e:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0006041:	7f 4f                	jg     c0006092 <do_unlink+0x462>
c0006043:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006046:	83 c0 10             	add    $0x10,%eax
c0006049:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000604c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000604f:	83 c0 04             	add    $0x4,%eax
c0006052:	83 ec 08             	sub    $0x8,%esp
c0006055:	ff 75 08             	pushl  0x8(%ebp)
c0006058:	50                   	push   %eax
c0006059:	e8 3b da ff ff       	call   c0003a99 <strcmp>
c000605e:	83 c4 10             	add    $0x10,%esp
c0006061:	85 c0                	test   %eax,%eax
c0006063:	75 1b                	jne    c0006080 <do_unlink+0x450>
c0006065:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000606c:	83 ec 04             	sub    $0x4,%esp
c000606f:	6a 10                	push   $0x10
c0006071:	6a 00                	push   $0x0
c0006073:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006076:	e8 15 39 00 00       	call   c0009990 <Memset>
c000607b:	83 c4 10             	add    $0x10,%esp
c000607e:	eb 13                	jmp    c0006093 <do_unlink+0x463>
c0006080:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0006084:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0006088:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000608b:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000608e:	7c a7                	jl     c0006037 <do_unlink+0x407>
c0006090:	eb 01                	jmp    c0006093 <do_unlink+0x463>
c0006092:	90                   	nop
c0006093:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006096:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0006099:	7f 16                	jg     c00060b1 <do_unlink+0x481>
c000609b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000609f:	75 10                	jne    c00060b1 <do_unlink+0x481>
c00060a1:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00060a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00060a8:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00060ab:	0f 8c 51 ff ff ff    	jl     c0006002 <do_unlink+0x3d2>
c00060b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00060b4:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00060b7:	75 17                	jne    c00060d0 <do_unlink+0x4a0>
c00060b9:	8b 45 98             	mov    -0x68(%ebp),%eax
c00060bc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00060bf:	89 50 04             	mov    %edx,0x4(%eax)
c00060c2:	83 ec 0c             	sub    $0xc,%esp
c00060c5:	ff 75 98             	pushl  -0x68(%ebp)
c00060c8:	e8 a3 03 00 00       	call   c0006470 <sync_inode>
c00060cd:	83 c4 10             	add    $0x10,%esp
c00060d0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00060d4:	74 24                	je     c00060fa <do_unlink+0x4ca>
c00060d6:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c00060db:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c00060de:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00060e1:	01 ca                	add    %ecx,%edx
c00060e3:	83 ec 0c             	sub    $0xc,%esp
c00060e6:	6a 0a                	push   $0xa
c00060e8:	68 00 02 00 00       	push   $0x200
c00060ed:	50                   	push   %eax
c00060ee:	ff 75 b8             	pushl  -0x48(%ebp)
c00060f1:	52                   	push   %edx
c00060f2:	e8 38 e8 ff ff       	call   c000492f <rd_wt>
c00060f7:	83 c4 20             	add    $0x20,%esp
c00060fa:	90                   	nop
c00060fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00060fe:	c9                   	leave  
c00060ff:	c3                   	ret    

c0006100 <do_rdwt>:
c0006100:	55                   	push   %ebp
c0006101:	89 e5                	mov    %esp,%ebp
c0006103:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0006109:	8b 45 08             	mov    0x8(%ebp),%eax
c000610c:	8b 40 68             	mov    0x68(%eax),%eax
c000610f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006112:	8b 45 08             	mov    0x8(%ebp),%eax
c0006115:	8b 40 50             	mov    0x50(%eax),%eax
c0006118:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000611b:	8b 45 08             	mov    0x8(%ebp),%eax
c000611e:	8b 40 5c             	mov    0x5c(%eax),%eax
c0006121:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006124:	8b 45 08             	mov    0x8(%ebp),%eax
c0006127:	8b 00                	mov    (%eax),%eax
c0006129:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000612c:	8b 45 08             	mov    0x8(%ebp),%eax
c000612f:	8b 40 10             	mov    0x10(%eax),%eax
c0006132:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006135:	8b 45 08             	mov    0x8(%ebp),%eax
c0006138:	8b 40 40             	mov    0x40(%eax),%eax
c000613b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000613e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006141:	6b d0 2c             	imul   $0x2c,%eax,%edx
c0006144:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006147:	01 d0                	add    %edx,%eax
c0006149:	83 c0 0c             	add    $0xc,%eax
c000614c:	8b 04 85 2c 79 01 c0 	mov    -0x3ffe86d4(,%eax,4),%eax
c0006153:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006156:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006159:	8b 40 08             	mov    0x8(%eax),%eax
c000615c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000615f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006162:	8b 00                	mov    (%eax),%eax
c0006164:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006167:	83 ec 08             	sub    $0x8,%esp
c000616a:	ff 75 c0             	pushl  -0x40(%ebp)
c000616d:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0006173:	50                   	push   %eax
c0006174:	e8 26 f2 ff ff       	call   c000539f <get_inode>
c0006179:	83 c4 10             	add    $0x10,%esp
c000617c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000617f:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c0006183:	75 10                	jne    c0006195 <do_rdwt+0x95>
c0006185:	83 ec 0c             	sub    $0xc,%esp
c0006188:	68 30 98 00 c0       	push   $0xc0009830
c000618d:	e8 77 ce ff ff       	call   c0003009 <panic>
c0006192:	83 c4 10             	add    $0x10,%esp
c0006195:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000619b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000619e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00061a1:	8b 40 04             	mov    0x4(%eax),%eax
c00061a4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00061a7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00061ab:	74 22                	je     c00061cf <do_rdwt+0xcf>
c00061ad:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00061b1:	74 1c                	je     c00061cf <do_rdwt+0xcf>
c00061b3:	68 ba 04 00 00       	push   $0x4ba
c00061b8:	68 14 97 00 c0       	push   $0xc0009714
c00061bd:	68 14 97 00 c0       	push   $0xc0009714
c00061c2:	68 40 98 00 c0       	push   $0xc0009840
c00061c7:	e8 5b ce ff ff       	call   c0003027 <assertion_failure>
c00061cc:	83 c4 10             	add    $0x10,%esp
c00061cf:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c00061d5:	83 f8 01             	cmp    $0x1,%eax
c00061d8:	75 4a                	jne    c0006224 <do_rdwt+0x124>
c00061da:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00061de:	75 09                	jne    c00061e9 <do_rdwt+0xe9>
c00061e0:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c00061e7:	eb 0d                	jmp    c00061f6 <do_rdwt+0xf6>
c00061e9:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00061ed:	75 07                	jne    c00061f6 <do_rdwt+0xf6>
c00061ef:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c00061f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00061f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00061fc:	89 50 68             	mov    %edx,0x68(%eax)
c00061ff:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0006202:	8b 45 08             	mov    0x8(%ebp),%eax
c0006205:	89 50 58             	mov    %edx,0x58(%eax)
c0006208:	83 ec 04             	sub    $0x4,%esp
c000620b:	6a 00                	push   $0x0
c000620d:	ff 75 08             	pushl  0x8(%ebp)
c0006210:	6a 03                	push   $0x3
c0006212:	e8 b4 d5 ff ff       	call   c00037cb <send_rec>
c0006217:	83 c4 10             	add    $0x10,%esp
c000621a:	b8 00 00 00 00       	mov    $0x0,%eax
c000621f:	e9 4a 02 00 00       	jmp    c000646e <do_rdwt+0x36e>
c0006224:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0006228:	75 12                	jne    c000623c <do_rdwt+0x13c>
c000622a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000622d:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
c0006230:	75 0a                	jne    c000623c <do_rdwt+0x13c>
c0006232:	b8 00 00 00 00       	mov    $0x0,%eax
c0006237:	e9 32 02 00 00       	jmp    c000646e <do_rdwt+0x36e>
c000623c:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0006240:	75 18                	jne    c000625a <do_rdwt+0x15a>
c0006242:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006248:	c1 e0 09             	shl    $0x9,%eax
c000624b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c000624e:	75 0a                	jne    c000625a <do_rdwt+0x15a>
c0006250:	b8 00 00 00 00       	mov    $0x0,%eax
c0006255:	e9 14 02 00 00       	jmp    c000646e <do_rdwt+0x36e>
c000625a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000625e:	75 14                	jne    c0006274 <do_rdwt+0x174>
c0006260:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006263:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006266:	01 d0                	add    %edx,%eax
c0006268:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c000626b:	0f 4e 45 b4          	cmovle -0x4c(%ebp),%eax
c000626f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006272:	eb 19                	jmp    c000628d <do_rdwt+0x18d>
c0006274:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0006277:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000627a:	01 c2                	add    %eax,%edx
c000627c:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006282:	c1 e0 09             	shl    $0x9,%eax
c0006285:	39 c2                	cmp    %eax,%edx
c0006287:	0f 4e c2             	cmovle %edx,%eax
c000628a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000628d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006290:	99                   	cltd   
c0006291:	c1 ea 17             	shr    $0x17,%edx
c0006294:	01 d0                	add    %edx,%eax
c0006296:	25 ff 01 00 00       	and    $0x1ff,%eax
c000629b:	29 d0                	sub    %edx,%eax
c000629d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00062a0:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c00062a6:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00062a9:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00062af:	85 c0                	test   %eax,%eax
c00062b1:	0f 48 c1             	cmovs  %ecx,%eax
c00062b4:	c1 f8 09             	sar    $0x9,%eax
c00062b7:	01 d0                	add    %edx,%eax
c00062b9:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00062bc:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c00062c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00062c5:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00062cb:	85 c0                	test   %eax,%eax
c00062cd:	0f 48 c1             	cmovs  %ecx,%eax
c00062d0:	c1 f8 09             	sar    $0x9,%eax
c00062d3:	01 d0                	add    %edx,%eax
c00062d5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00062d8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00062db:	2b 45 ac             	sub    -0x54(%ebp),%eax
c00062de:	ba 00 00 10 00       	mov    $0x100000,%edx
c00062e3:	39 d0                	cmp    %edx,%eax
c00062e5:	7d 0b                	jge    c00062f2 <do_rdwt+0x1f2>
c00062e7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00062ea:	2b 45 ac             	sub    -0x54(%ebp),%eax
c00062ed:	83 c0 01             	add    $0x1,%eax
c00062f0:	eb 05                	jmp    c00062f7 <do_rdwt+0x1f7>
c00062f2:	b8 00 00 10 00       	mov    $0x100000,%eax
c00062f7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00062fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00062fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006300:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006307:	8b 45 08             	mov    0x8(%ebp),%eax
c000630a:	8b 00                	mov    (%eax),%eax
c000630c:	83 ec 0c             	sub    $0xc,%esp
c000630f:	50                   	push   %eax
c0006310:	e8 f1 04 00 00       	call   c0006806 <pid2proc>
c0006315:	83 c4 10             	add    $0x10,%esp
c0006318:	89 45 a0             	mov    %eax,-0x60(%ebp)
c000631b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000631e:	8b 40 78             	mov    0x78(%eax),%eax
c0006321:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006324:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0006327:	83 ec 08             	sub    $0x8,%esp
c000632a:	ff 75 a0             	pushl  -0x60(%ebp)
c000632d:	50                   	push   %eax
c000632e:	e8 bc 05 00 00       	call   c00068ef <Seg2PhyAddrLDT>
c0006333:	83 c4 10             	add    $0x10,%esp
c0006336:	89 45 98             	mov    %eax,-0x68(%ebp)
c0006339:	8b 55 98             	mov    -0x68(%ebp),%edx
c000633c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000633f:	01 d0                	add    %edx,%eax
c0006341:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0006344:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006347:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000634a:	e9 c7 00 00 00       	jmp    c0006416 <do_rdwt+0x316>
c000634f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006352:	c1 e0 09             	shl    $0x9,%eax
c0006355:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0006358:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000635b:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c000635f:	89 45 90             	mov    %eax,-0x70(%ebp)
c0006362:	c7 45 8c 20 00 00 00 	movl   $0x20,-0x74(%ebp)
c0006369:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000636c:	c1 e0 09             	shl    $0x9,%eax
c000636f:	89 c2                	mov    %eax,%edx
c0006371:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0006376:	83 ec 0c             	sub    $0xc,%esp
c0006379:	6a 07                	push   $0x7
c000637b:	52                   	push   %edx
c000637c:	50                   	push   %eax
c000637d:	ff 75 8c             	pushl  -0x74(%ebp)
c0006380:	ff 75 e0             	pushl  -0x20(%ebp)
c0006383:	e8 a7 e5 ff ff       	call   c000492f <rd_wt>
c0006388:	83 c4 20             	add    $0x20,%esp
c000638b:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000638f:	75 25                	jne    c00063b6 <do_rdwt+0x2b6>
c0006391:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c0006397:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000639a:	01 d0                	add    %edx,%eax
c000639c:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c000639f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00063a2:	01 ca                	add    %ecx,%edx
c00063a4:	83 ec 04             	sub    $0x4,%esp
c00063a7:	ff 75 90             	pushl  -0x70(%ebp)
c00063aa:	50                   	push   %eax
c00063ab:	52                   	push   %edx
c00063ac:	e8 b1 35 00 00       	call   c0009962 <Memcpy>
c00063b1:	83 c4 10             	add    $0x10,%esp
c00063b4:	eb 47                	jmp    c00063fd <do_rdwt+0x2fd>
c00063b6:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00063b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00063bc:	01 d0                	add    %edx,%eax
c00063be:	89 c1                	mov    %eax,%ecx
c00063c0:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c00063c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00063c9:	01 d0                	add    %edx,%eax
c00063cb:	83 ec 04             	sub    $0x4,%esp
c00063ce:	ff 75 90             	pushl  -0x70(%ebp)
c00063d1:	51                   	push   %ecx
c00063d2:	50                   	push   %eax
c00063d3:	e8 8a 35 00 00       	call   c0009962 <Memcpy>
c00063d8:	83 c4 10             	add    $0x10,%esp
c00063db:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00063de:	c1 e0 09             	shl    $0x9,%eax
c00063e1:	89 c2                	mov    %eax,%edx
c00063e3:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c00063e8:	83 ec 0c             	sub    $0xc,%esp
c00063eb:	6a 0a                	push   $0xa
c00063ed:	52                   	push   %edx
c00063ee:	50                   	push   %eax
c00063ef:	ff 75 8c             	pushl  -0x74(%ebp)
c00063f2:	ff 75 e0             	pushl  -0x20(%ebp)
c00063f5:	e8 35 e5 ff ff       	call   c000492f <rd_wt>
c00063fa:	83 c4 20             	add    $0x20,%esp
c00063fd:	8b 45 90             	mov    -0x70(%ebp),%eax
c0006400:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0006403:	8b 45 90             	mov    -0x70(%ebp),%eax
c0006406:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006409:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006410:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006413:	01 45 e0             	add    %eax,-0x20(%ebp)
c0006416:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006419:	3b 45 a8             	cmp    -0x58(%ebp),%eax
c000641c:	7f 0a                	jg     c0006428 <do_rdwt+0x328>
c000641e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006422:	0f 85 27 ff ff ff    	jne    c000634f <do_rdwt+0x24f>
c0006428:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000642b:	8b 50 04             	mov    0x4(%eax),%edx
c000642e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006431:	01 c2                	add    %eax,%edx
c0006433:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006436:	89 50 04             	mov    %edx,0x4(%eax)
c0006439:	8b 55 b0             	mov    -0x50(%ebp),%edx
c000643c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000643f:	01 c2                	add    %eax,%edx
c0006441:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0006447:	39 c2                	cmp    %eax,%edx
c0006449:	7e 20                	jle    c000646b <do_rdwt+0x36b>
c000644b:	8b 55 b0             	mov    -0x50(%ebp),%edx
c000644e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006451:	01 d0                	add    %edx,%eax
c0006453:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0006459:	83 ec 0c             	sub    $0xc,%esp
c000645c:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0006462:	50                   	push   %eax
c0006463:	e8 08 00 00 00       	call   c0006470 <sync_inode>
c0006468:	83 c4 10             	add    $0x10,%esp
c000646b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000646e:	c9                   	leave  
c000646f:	c3                   	ret    

c0006470 <sync_inode>:
c0006470:	55                   	push   %ebp
c0006471:	89 e5                	mov    %esp,%ebp
c0006473:	53                   	push   %ebx
c0006474:	83 ec 34             	sub    $0x34,%esp
c0006477:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000647e:	eb 74                	jmp    c00064f4 <sync_inode+0x84>
c0006480:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006483:	89 d0                	mov    %edx,%eax
c0006485:	c1 e0 02             	shl    $0x2,%eax
c0006488:	01 d0                	add    %edx,%eax
c000648a:	c1 e0 03             	shl    $0x3,%eax
c000648d:	05 d0 fe 00 c0       	add    $0xc000fed0,%eax
c0006492:	8b 10                	mov    (%eax),%edx
c0006494:	8b 45 08             	mov    0x8(%ebp),%eax
c0006497:	8b 40 10             	mov    0x10(%eax),%eax
c000649a:	39 c2                	cmp    %eax,%edx
c000649c:	75 52                	jne    c00064f0 <sync_inode+0x80>
c000649e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00064a1:	89 d0                	mov    %edx,%eax
c00064a3:	c1 e0 02             	shl    $0x2,%eax
c00064a6:	01 d0                	add    %edx,%eax
c00064a8:	c1 e0 03             	shl    $0x3,%eax
c00064ab:	8d 90 c0 fe 00 c0    	lea    -0x3fff0140(%eax),%edx
c00064b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00064b4:	8b 08                	mov    (%eax),%ecx
c00064b6:	89 0a                	mov    %ecx,(%edx)
c00064b8:	8b 48 04             	mov    0x4(%eax),%ecx
c00064bb:	89 4a 04             	mov    %ecx,0x4(%edx)
c00064be:	8b 48 08             	mov    0x8(%eax),%ecx
c00064c1:	89 4a 08             	mov    %ecx,0x8(%edx)
c00064c4:	8b 48 0c             	mov    0xc(%eax),%ecx
c00064c7:	89 4a 0c             	mov    %ecx,0xc(%edx)
c00064ca:	8b 48 10             	mov    0x10(%eax),%ecx
c00064cd:	89 4a 10             	mov    %ecx,0x10(%edx)
c00064d0:	8b 48 14             	mov    0x14(%eax),%ecx
c00064d3:	89 4a 14             	mov    %ecx,0x14(%edx)
c00064d6:	8b 48 18             	mov    0x18(%eax),%ecx
c00064d9:	89 4a 18             	mov    %ecx,0x18(%edx)
c00064dc:	8b 48 1c             	mov    0x1c(%eax),%ecx
c00064df:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c00064e2:	8b 48 20             	mov    0x20(%eax),%ecx
c00064e5:	89 4a 20             	mov    %ecx,0x20(%edx)
c00064e8:	8b 40 24             	mov    0x24(%eax),%eax
c00064eb:	89 42 24             	mov    %eax,0x24(%edx)
c00064ee:	eb 0a                	jmp    c00064fa <sync_inode+0x8a>
c00064f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00064f4:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00064f8:	7e 86                	jle    c0006480 <sync_inode+0x10>
c00064fa:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0006501:	8b 45 08             	mov    0x8(%ebp),%eax
c0006504:	8b 40 10             	mov    0x10(%eax),%eax
c0006507:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000650a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000650d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0006510:	b8 00 02 00 00       	mov    $0x200,%eax
c0006515:	99                   	cltd   
c0006516:	f7 7d f0             	idivl  -0x10(%ebp)
c0006519:	89 c3                	mov    %eax,%ebx
c000651b:	89 c8                	mov    %ecx,%eax
c000651d:	99                   	cltd   
c000651e:	f7 fb                	idiv   %ebx
c0006520:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0006523:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006526:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0006529:	b8 00 02 00 00       	mov    $0x200,%eax
c000652e:	99                   	cltd   
c000652f:	f7 7d f0             	idivl  -0x10(%ebp)
c0006532:	89 c3                	mov    %eax,%ebx
c0006534:	89 c8                	mov    %ecx,%eax
c0006536:	99                   	cltd   
c0006537:	f7 fb                	idiv   %ebx
c0006539:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000653c:	8b 45 08             	mov    0x8(%ebp),%eax
c000653f:	8b 40 20             	mov    0x20(%eax),%eax
c0006542:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006545:	e8 0a 01 00 00       	call   c0006654 <get_super_block>
c000654a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000654d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006550:	8b 40 04             	mov    0x4(%eax),%eax
c0006553:	8d 50 02             	lea    0x2(%eax),%edx
c0006556:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006559:	8b 40 08             	mov    0x8(%eax),%eax
c000655c:	01 c2                	add    %eax,%edx
c000655e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006561:	01 d0                	add    %edx,%eax
c0006563:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006566:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c000656b:	83 ec 0c             	sub    $0xc,%esp
c000656e:	6a 07                	push   $0x7
c0006570:	68 00 02 00 00       	push   $0x200
c0006575:	50                   	push   %eax
c0006576:	ff 75 e0             	pushl  -0x20(%ebp)
c0006579:	ff 75 d8             	pushl  -0x28(%ebp)
c000657c:	e8 ae e3 ff ff       	call   c000492f <rd_wt>
c0006581:	83 c4 20             	add    $0x20,%esp
c0006584:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c0006589:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000658c:	83 ec 04             	sub    $0x4,%esp
c000658f:	ff 75 f0             	pushl  -0x10(%ebp)
c0006592:	ff 75 08             	pushl  0x8(%ebp)
c0006595:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006598:	e8 c5 33 00 00       	call   c0009962 <Memcpy>
c000659d:	83 c4 10             	add    $0x10,%esp
c00065a0:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c00065a5:	83 ec 0c             	sub    $0xc,%esp
c00065a8:	6a 0a                	push   $0xa
c00065aa:	68 00 02 00 00       	push   $0x200
c00065af:	50                   	push   %eax
c00065b0:	ff 75 e0             	pushl  -0x20(%ebp)
c00065b3:	ff 75 d8             	pushl  -0x28(%ebp)
c00065b6:	e8 74 e3 ff ff       	call   c000492f <rd_wt>
c00065bb:	83 c4 20             	add    $0x20,%esp
c00065be:	90                   	nop
c00065bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00065c2:	c9                   	leave  
c00065c3:	c3                   	ret    

c00065c4 <put_inode>:
c00065c4:	55                   	push   %ebp
c00065c5:	89 e5                	mov    %esp,%ebp
c00065c7:	83 ec 08             	sub    $0x8,%esp
c00065ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00065cd:	8b 40 24             	mov    0x24(%eax),%eax
c00065d0:	85 c0                	test   %eax,%eax
c00065d2:	7f 1c                	jg     c00065f0 <put_inode+0x2c>
c00065d4:	68 54 05 00 00       	push   $0x554
c00065d9:	68 14 97 00 c0       	push   $0xc0009714
c00065de:	68 14 97 00 c0       	push   $0xc0009714
c00065e3:	68 74 98 00 c0       	push   $0xc0009874
c00065e8:	e8 3a ca ff ff       	call   c0003027 <assertion_failure>
c00065ed:	83 c4 10             	add    $0x10,%esp
c00065f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00065f3:	8b 40 24             	mov    0x24(%eax),%eax
c00065f6:	8d 50 ff             	lea    -0x1(%eax),%edx
c00065f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00065fc:	89 50 24             	mov    %edx,0x24(%eax)
c00065ff:	90                   	nop
c0006600:	c9                   	leave  
c0006601:	c3                   	ret    

c0006602 <do_close>:
c0006602:	55                   	push   %ebp
c0006603:	89 e5                	mov    %esp,%ebp
c0006605:	a1 c4 d2 00 c0       	mov    0xc000d2c4,%eax
c000660a:	8b 55 08             	mov    0x8(%ebp),%edx
c000660d:	83 c2 0c             	add    $0xc,%edx
c0006610:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0006614:	8b 50 0c             	mov    0xc(%eax),%edx
c0006617:	83 ea 01             	sub    $0x1,%edx
c000661a:	89 50 0c             	mov    %edx,0xc(%eax)
c000661d:	8b 40 0c             	mov    0xc(%eax),%eax
c0006620:	85 c0                	test   %eax,%eax
c0006622:	75 16                	jne    c000663a <do_close+0x38>
c0006624:	a1 c4 d2 00 c0       	mov    0xc000d2c4,%eax
c0006629:	8b 55 08             	mov    0x8(%ebp),%edx
c000662c:	83 c2 0c             	add    $0xc,%edx
c000662f:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0006633:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000663a:	a1 c4 d2 00 c0       	mov    0xc000d2c4,%eax
c000663f:	8b 55 08             	mov    0x8(%ebp),%edx
c0006642:	83 c2 0c             	add    $0xc,%edx
c0006645:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c000664c:	00 
c000664d:	b8 00 00 00 00       	mov    $0x0,%eax
c0006652:	5d                   	pop    %ebp
c0006653:	c3                   	ret    

c0006654 <get_super_block>:
c0006654:	55                   	push   %ebp
c0006655:	89 e5                	mov    %esp,%ebp
c0006657:	83 ec 08             	sub    $0x8,%esp
c000665a:	a1 20 c0 00 c0       	mov    0xc000c020,%eax
c000665f:	83 ec 0c             	sub    $0xc,%esp
c0006662:	6a 07                	push   $0x7
c0006664:	68 00 02 00 00       	push   $0x200
c0006669:	50                   	push   %eax
c000666a:	6a 20                	push   $0x20
c000666c:	6a 01                	push   $0x1
c000666e:	e8 bc e2 ff ff       	call   c000492f <rd_wt>
c0006673:	83 c4 20             	add    $0x20,%esp
c0006676:	8b 15 20 c0 00 c0    	mov    0xc000c020,%edx
c000667c:	a1 24 c0 00 c0       	mov    0xc000c024,%eax
c0006681:	8b 0a                	mov    (%edx),%ecx
c0006683:	89 08                	mov    %ecx,(%eax)
c0006685:	8b 4a 04             	mov    0x4(%edx),%ecx
c0006688:	89 48 04             	mov    %ecx,0x4(%eax)
c000668b:	8b 4a 08             	mov    0x8(%edx),%ecx
c000668e:	89 48 08             	mov    %ecx,0x8(%eax)
c0006691:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0006694:	89 48 0c             	mov    %ecx,0xc(%eax)
c0006697:	8b 4a 10             	mov    0x10(%edx),%ecx
c000669a:	89 48 10             	mov    %ecx,0x10(%eax)
c000669d:	8b 4a 14             	mov    0x14(%edx),%ecx
c00066a0:	89 48 14             	mov    %ecx,0x14(%eax)
c00066a3:	8b 4a 18             	mov    0x18(%edx),%ecx
c00066a6:	89 48 18             	mov    %ecx,0x18(%eax)
c00066a9:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00066ac:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00066af:	8b 52 20             	mov    0x20(%edx),%edx
c00066b2:	89 50 20             	mov    %edx,0x20(%eax)
c00066b5:	a1 24 c0 00 c0       	mov    0xc000c024,%eax
c00066ba:	c9                   	leave  
c00066bb:	c3                   	ret    

c00066bc <check>:
c00066bc:	55                   	push   %ebp
c00066bd:	89 e5                	mov    %esp,%ebp
c00066bf:	83 ec 18             	sub    $0x18,%esp
c00066c2:	c7 45 f4 20 79 01 c0 	movl   $0xc0017920,-0xc(%ebp)
c00066c9:	eb 50                	jmp    c000671b <check+0x5f>
c00066cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066ce:	8b 40 60             	mov    0x60(%eax),%eax
c00066d1:	85 c0                	test   %eax,%eax
c00066d3:	74 3f                	je     c0006714 <check+0x58>
c00066d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066d8:	8b 40 60             	mov    0x60(%eax),%eax
c00066db:	83 f8 01             	cmp    $0x1,%eax
c00066de:	74 34                	je     c0006714 <check+0x58>
c00066e0:	c7 05 9c ce 00 c0 02 	movl   $0x2802,0xc000ce9c
c00066e7:	28 00 00 
c00066ea:	83 ec 08             	sub    $0x8,%esp
c00066ed:	6a 0a                	push   $0xa
c00066ef:	68 83 98 00 c0       	push   $0xc0009883
c00066f4:	e8 ce a9 ff ff       	call   c00010c7 <disp_str_colour>
c00066f9:	83 c4 10             	add    $0x10,%esp
c00066fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066ff:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0006703:	0f be c0             	movsbl %al,%eax
c0006706:	83 ec 0c             	sub    $0xc,%esp
c0006709:	50                   	push   %eax
c000670a:	e8 37 af ff ff       	call   c0001646 <disp_int>
c000670f:	83 c4 10             	add    $0x10,%esp
c0006712:	eb fe                	jmp    c0006712 <check+0x56>
c0006714:	81 45 f4 b0 00 00 00 	addl   $0xb0,-0xc(%ebp)
c000671b:	b8 d0 79 01 c0       	mov    $0xc00179d0,%eax
c0006720:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0006723:	72 a6                	jb     c00066cb <check+0xf>
c0006725:	90                   	nop
c0006726:	c9                   	leave  
c0006727:	c3                   	ret    

c0006728 <schedule_process>:
c0006728:	55                   	push   %ebp
c0006729:	89 e5                	mov    %esp,%ebp
c000672b:	83 ec 10             	sub    $0x10,%esp
c000672e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006735:	a1 a0 ce 00 c0       	mov    0xc000cea0,%eax
c000673a:	83 e0 01             	and    $0x1,%eax
c000673d:	8b 04 85 00 79 01 c0 	mov    -0x3ffe8700(,%eax,4),%eax
c0006744:	a3 c0 d2 00 c0       	mov    %eax,0xc000d2c0
c0006749:	90                   	nop
c000674a:	a1 c0 d2 00 c0       	mov    0xc000d2c0,%eax
c000674f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006752:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0006759:	a1 c0 d2 00 c0       	mov    0xc000d2c0,%eax
c000675e:	8b 40 40             	mov    0x40(%eax),%eax
c0006761:	85 c0                	test   %eax,%eax
c0006763:	74 0d                	je     c0006772 <schedule_process+0x4a>
c0006765:	a1 c0 d2 00 c0       	mov    0xc000d2c0,%eax
c000676a:	8b 40 40             	mov    0x40(%eax),%eax
c000676d:	0f 22 d8             	mov    %eax,%cr3
c0006770:	eb 06                	jmp    c0006778 <schedule_process+0x50>
c0006772:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006775:	0f 22 d8             	mov    %eax,%cr3
c0006778:	90                   	nop
c0006779:	c9                   	leave  
c000677a:	c3                   	ret    

c000677b <clock_handler>:
c000677b:	55                   	push   %ebp
c000677c:	89 e5                	mov    %esp,%ebp
c000677e:	83 ec 08             	sub    $0x8,%esp
c0006781:	e8 a2 ff ff ff       	call   c0006728 <schedule_process>
c0006786:	a1 c0 d2 00 c0       	mov    0xc000d2c0,%eax
c000678b:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c000678f:	3c 02                	cmp    $0x2,%al
c0006791:	a1 20 f6 00 c0       	mov    0xc000f620,%eax
c0006796:	83 c0 01             	add    $0x1,%eax
c0006799:	a3 20 f6 00 c0       	mov    %eax,0xc000f620
c000679e:	a1 20 f6 00 c0       	mov    0xc000f620,%eax
c00067a3:	3d cc ab ff 7f       	cmp    $0x7fffabcc,%eax
c00067a8:	76 0a                	jbe    c00067b4 <clock_handler+0x39>
c00067aa:	c7 05 20 f6 00 c0 00 	movl   $0x0,0xc000f620
c00067b1:	00 00 00 
c00067b4:	a1 c0 d2 00 c0       	mov    0xc000d2c0,%eax
c00067b9:	8b 40 1c             	mov    0x1c(%eax),%eax
c00067bc:	85 c0                	test   %eax,%eax
c00067be:	74 0e                	je     c00067ce <clock_handler+0x53>
c00067c0:	a1 c0 d2 00 c0       	mov    0xc000d2c0,%eax
c00067c5:	8b 50 1c             	mov    0x1c(%eax),%edx
c00067c8:	83 ea 01             	sub    $0x1,%edx
c00067cb:	89 50 1c             	mov    %edx,0x1c(%eax)
c00067ce:	a1 00 ee 00 c0       	mov    0xc000ee00,%eax
c00067d3:	85 c0                	test   %eax,%eax
c00067d5:	74 0d                	je     c00067e4 <clock_handler+0x69>
c00067d7:	83 ec 0c             	sub    $0xc,%esp
c00067da:	6a 00                	push   $0x0
c00067dc:	e8 1d d2 ff ff       	call   c00039fe <inform_int>
c00067e1:	83 c4 10             	add    $0x10,%esp
c00067e4:	a1 a0 ce 00 c0       	mov    0xc000cea0,%eax
c00067e9:	85 c0                	test   %eax,%eax
c00067eb:	75 13                	jne    c0006800 <clock_handler+0x85>
c00067ed:	a1 c0 d2 00 c0       	mov    0xc000d2c0,%eax
c00067f2:	8b 40 1c             	mov    0x1c(%eax),%eax
c00067f5:	85 c0                	test   %eax,%eax
c00067f7:	75 0a                	jne    c0006803 <clock_handler+0x88>
c00067f9:	e8 2a ff ff ff       	call   c0006728 <schedule_process>
c00067fe:	eb 04                	jmp    c0006804 <clock_handler+0x89>
c0006800:	90                   	nop
c0006801:	eb 01                	jmp    c0006804 <clock_handler+0x89>
c0006803:	90                   	nop
c0006804:	c9                   	leave  
c0006805:	c3                   	ret    

c0006806 <pid2proc>:
c0006806:	55                   	push   %ebp
c0006807:	89 e5                	mov    %esp,%ebp
c0006809:	83 ec 10             	sub    $0x10,%esp
c000680c:	8b 45 08             	mov    0x8(%ebp),%eax
c000680f:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0006815:	05 20 79 01 c0       	add    $0xc0017920,%eax
c000681a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000681d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006820:	c9                   	leave  
c0006821:	c3                   	ret    

c0006822 <proc2pid>:
c0006822:	55                   	push   %ebp
c0006823:	89 e5                	mov    %esp,%ebp
c0006825:	83 ec 10             	sub    $0x10,%esp
c0006828:	8b 45 08             	mov    0x8(%ebp),%eax
c000682b:	2d 20 79 01 c0       	sub    $0xc0017920,%eax
c0006830:	c1 f8 04             	sar    $0x4,%eax
c0006833:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
c0006839:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000683c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000683f:	c9                   	leave  
c0006840:	c3                   	ret    

c0006841 <InitDescriptor>:
c0006841:	55                   	push   %ebp
c0006842:	89 e5                	mov    %esp,%ebp
c0006844:	83 ec 04             	sub    $0x4,%esp
c0006847:	8b 45 14             	mov    0x14(%ebp),%eax
c000684a:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c000684e:	8b 45 10             	mov    0x10(%ebp),%eax
c0006851:	89 c2                	mov    %eax,%edx
c0006853:	8b 45 08             	mov    0x8(%ebp),%eax
c0006856:	66 89 10             	mov    %dx,(%eax)
c0006859:	8b 45 0c             	mov    0xc(%ebp),%eax
c000685c:	89 c2                	mov    %eax,%edx
c000685e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006861:	66 89 50 02          	mov    %dx,0x2(%eax)
c0006865:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006868:	c1 e8 10             	shr    $0x10,%eax
c000686b:	89 c2                	mov    %eax,%edx
c000686d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006870:	88 50 04             	mov    %dl,0x4(%eax)
c0006873:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0006877:	89 c2                	mov    %eax,%edx
c0006879:	8b 45 08             	mov    0x8(%ebp),%eax
c000687c:	88 50 05             	mov    %dl,0x5(%eax)
c000687f:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0006883:	66 c1 e8 08          	shr    $0x8,%ax
c0006887:	c1 e0 04             	shl    $0x4,%eax
c000688a:	89 c2                	mov    %eax,%edx
c000688c:	8b 45 10             	mov    0x10(%ebp),%eax
c000688f:	c1 e8 10             	shr    $0x10,%eax
c0006892:	83 e0 0f             	and    $0xf,%eax
c0006895:	09 c2                	or     %eax,%edx
c0006897:	8b 45 08             	mov    0x8(%ebp),%eax
c000689a:	88 50 06             	mov    %dl,0x6(%eax)
c000689d:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068a0:	c1 e8 18             	shr    $0x18,%eax
c00068a3:	89 c2                	mov    %eax,%edx
c00068a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00068a8:	88 50 07             	mov    %dl,0x7(%eax)
c00068ab:	90                   	nop
c00068ac:	c9                   	leave  
c00068ad:	c3                   	ret    

c00068ae <Seg2PhyAddr>:
c00068ae:	55                   	push   %ebp
c00068af:	89 e5                	mov    %esp,%ebp
c00068b1:	83 ec 10             	sub    $0x10,%esp
c00068b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00068b7:	c1 e8 03             	shr    $0x3,%eax
c00068ba:	8b 14 c5 c4 ce 00 c0 	mov    -0x3fff313c(,%eax,8),%edx
c00068c1:	8b 04 c5 c0 ce 00 c0 	mov    -0x3fff3140(,%eax,8),%eax
c00068c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068cb:	89 55 f8             	mov    %edx,-0x8(%ebp)
c00068ce:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00068d2:	0f b7 c0             	movzwl %ax,%eax
c00068d5:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c00068d9:	0f b6 d2             	movzbl %dl,%edx
c00068dc:	c1 e2 10             	shl    $0x10,%edx
c00068df:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c00068e5:	09 d0                	or     %edx,%eax
c00068e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00068ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00068ed:	c9                   	leave  
c00068ee:	c3                   	ret    

c00068ef <Seg2PhyAddrLDT>:
c00068ef:	55                   	push   %ebp
c00068f0:	89 e5                	mov    %esp,%ebp
c00068f2:	83 ec 10             	sub    $0x10,%esp
c00068f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00068f8:	c1 e8 03             	shr    $0x3,%eax
c00068fb:	89 c2                	mov    %eax,%edx
c00068fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006900:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
c0006904:	8b 02                	mov    (%edx),%eax
c0006906:	8b 52 04             	mov    0x4(%edx),%edx
c0006909:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000690c:	89 55 f8             	mov    %edx,-0x8(%ebp)
c000690f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0006913:	0f b7 c0             	movzwl %ax,%eax
c0006916:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c000691a:	0f b6 d2             	movzbl %dl,%edx
c000691d:	c1 e2 10             	shl    $0x10,%edx
c0006920:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0006926:	09 d0                	or     %edx,%eax
c0006928:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000692b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000692e:	c9                   	leave  
c000692f:	c3                   	ret    

c0006930 <VirAddr2PhyAddr>:
c0006930:	55                   	push   %ebp
c0006931:	89 e5                	mov    %esp,%ebp
c0006933:	83 ec 10             	sub    $0x10,%esp
c0006936:	8b 55 0c             	mov    0xc(%ebp),%edx
c0006939:	8b 45 08             	mov    0x8(%ebp),%eax
c000693c:	01 d0                	add    %edx,%eax
c000693e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006941:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006944:	c9                   	leave  
c0006945:	c3                   	ret    

c0006946 <v2l>:
c0006946:	55                   	push   %ebp
c0006947:	89 e5                	mov    %esp,%ebp
c0006949:	83 ec 18             	sub    $0x18,%esp
c000694c:	83 ec 0c             	sub    $0xc,%esp
c000694f:	ff 75 08             	pushl  0x8(%ebp)
c0006952:	e8 af fe ff ff       	call   c0006806 <pid2proc>
c0006957:	83 c4 10             	add    $0x10,%esp
c000695a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000695d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006964:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006967:	83 ec 08             	sub    $0x8,%esp
c000696a:	ff 75 f4             	pushl  -0xc(%ebp)
c000696d:	50                   	push   %eax
c000696e:	e8 7c ff ff ff       	call   c00068ef <Seg2PhyAddrLDT>
c0006973:	83 c4 10             	add    $0x10,%esp
c0006976:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006979:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000697c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000697f:	01 d0                	add    %edx,%eax
c0006981:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006984:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006987:	c9                   	leave  
c0006988:	c3                   	ret    

c0006989 <init_propt>:
c0006989:	55                   	push   %ebp
c000698a:	89 e5                	mov    %esp,%ebp
c000698c:	83 ec 28             	sub    $0x28,%esp
c000698f:	6a 0e                	push   $0xe
c0006991:	6a 08                	push   $0x8
c0006993:	68 6b 11 00 c0       	push   $0xc000116b
c0006998:	6a 20                	push   $0x20
c000699a:	e8 d5 00 00 00       	call   c0006a74 <InitInterruptDesc>
c000699f:	83 c4 10             	add    $0x10,%esp
c00069a2:	6a 0e                	push   $0xe
c00069a4:	6a 08                	push   $0x8
c00069a6:	68 b4 11 00 c0       	push   $0xc00011b4
c00069ab:	6a 21                	push   $0x21
c00069ad:	e8 c2 00 00 00       	call   c0006a74 <InitInterruptDesc>
c00069b2:	83 c4 10             	add    $0x10,%esp
c00069b5:	6a 0e                	push   $0xe
c00069b7:	6a 08                	push   $0x8
c00069b9:	68 fd 11 00 c0       	push   $0xc00011fd
c00069be:	6a 2e                	push   $0x2e
c00069c0:	e8 af 00 00 00       	call   c0006a74 <InitInterruptDesc>
c00069c5:	83 c4 10             	add    $0x10,%esp
c00069c8:	83 ec 04             	sub    $0x4,%esp
c00069cb:	68 b0 00 00 00       	push   $0xb0
c00069d0:	6a 00                	push   $0x0
c00069d2:	68 20 79 01 c0       	push   $0xc0017920
c00069d7:	e8 b4 2f 00 00       	call   c0009990 <Memset>
c00069dc:	83 c4 10             	add    $0x10,%esp
c00069df:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00069e6:	83 ec 04             	sub    $0x4,%esp
c00069e9:	ff 75 f4             	pushl  -0xc(%ebp)
c00069ec:	6a 00                	push   $0x0
c00069ee:	68 80 ed 00 c0       	push   $0xc000ed80
c00069f3:	e8 98 2f 00 00       	call   c0009990 <Memset>
c00069f8:	83 c4 10             	add    $0x10,%esp
c00069fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069fe:	a3 e8 ed 00 c0       	mov    %eax,0xc000ede8
c0006a03:	c7 05 88 ed 00 c0 30 	movl   $0x30,0xc000ed88
c0006a0a:	00 00 00 
c0006a0d:	83 ec 0c             	sub    $0xc,%esp
c0006a10:	6a 30                	push   $0x30
c0006a12:	e8 97 fe ff ff       	call   c00068ae <Seg2PhyAddr>
c0006a17:	83 c4 10             	add    $0x10,%esp
c0006a1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a1d:	c7 45 ec 80 ed 00 c0 	movl   $0xc000ed80,-0x14(%ebp)
c0006a24:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0006a2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006a2e:	0f b7 c0             	movzwl %ax,%eax
c0006a31:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a34:	83 ea 01             	sub    $0x1,%edx
c0006a37:	50                   	push   %eax
c0006a38:	52                   	push   %edx
c0006a39:	ff 75 ec             	pushl  -0x14(%ebp)
c0006a3c:	68 00 cf 00 c0       	push   $0xc000cf00
c0006a41:	e8 fb fd ff ff       	call   c0006841 <InitDescriptor>
c0006a46:	83 c4 10             	add    $0x10,%esp
c0006a49:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0006a50:	c7 45 e0 00 80 0b 0c 	movl   $0xc0b8000,-0x20(%ebp)
c0006a57:	68 f2 00 00 00       	push   $0xf2
c0006a5c:	68 ff ff 00 00       	push   $0xffff
c0006a61:	ff 75 e0             	pushl  -0x20(%ebp)
c0006a64:	68 f8 ce 00 c0       	push   $0xc000cef8
c0006a69:	e8 d3 fd ff ff       	call   c0006841 <InitDescriptor>
c0006a6e:	83 c4 10             	add    $0x10,%esp
c0006a71:	90                   	nop
c0006a72:	c9                   	leave  
c0006a73:	c3                   	ret    

c0006a74 <InitInterruptDesc>:
c0006a74:	55                   	push   %ebp
c0006a75:	89 e5                	mov    %esp,%ebp
c0006a77:	83 ec 10             	sub    $0x10,%esp
c0006a7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a7d:	c1 e0 03             	shl    $0x3,%eax
c0006a80:	05 20 ee 00 c0       	add    $0xc000ee20,%eax
c0006a85:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a88:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a8b:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0006a8f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a92:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a95:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a98:	89 c2                	mov    %eax,%edx
c0006a9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a9d:	66 89 10             	mov    %dx,(%eax)
c0006aa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006aa3:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0006aa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006aac:	c1 e8 10             	shr    $0x10,%eax
c0006aaf:	89 c2                	mov    %eax,%edx
c0006ab1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ab4:	66 89 50 06          	mov    %dx,0x6(%eax)
c0006ab8:	8b 45 10             	mov    0x10(%ebp),%eax
c0006abb:	c1 e0 04             	shl    $0x4,%eax
c0006abe:	89 c2                	mov    %eax,%edx
c0006ac0:	8b 45 14             	mov    0x14(%ebp),%eax
c0006ac3:	09 d0                	or     %edx,%eax
c0006ac5:	89 c2                	mov    %eax,%edx
c0006ac7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006aca:	88 50 05             	mov    %dl,0x5(%eax)
c0006acd:	90                   	nop
c0006ace:	c9                   	leave  
c0006acf:	c3                   	ret    

c0006ad0 <ReloadGDT>:
c0006ad0:	55                   	push   %ebp
c0006ad1:	89 e5                	mov    %esp,%ebp
c0006ad3:	83 ec 28             	sub    $0x28,%esp
c0006ad6:	b8 08 ee 00 c0       	mov    $0xc000ee08,%eax
c0006adb:	0f b7 00             	movzwl (%eax),%eax
c0006ade:	98                   	cwtl   
c0006adf:	ba 0a ee 00 c0       	mov    $0xc000ee0a,%edx
c0006ae4:	8b 12                	mov    (%edx),%edx
c0006ae6:	83 ec 04             	sub    $0x4,%esp
c0006ae9:	50                   	push   %eax
c0006aea:	52                   	push   %edx
c0006aeb:	68 c0 ce 00 c0       	push   $0xc000cec0
c0006af0:	e8 6d 2e 00 00       	call   c0009962 <Memcpy>
c0006af5:	83 c4 10             	add    $0x10,%esp
c0006af8:	c7 45 f0 08 ee 00 c0 	movl   $0xc000ee08,-0x10(%ebp)
c0006aff:	c7 45 ec 0a ee 00 c0 	movl   $0xc000ee0a,-0x14(%ebp)
c0006b06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b09:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0006b0e:	ba c0 ce 00 c0       	mov    $0xc000cec0,%edx
c0006b13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b16:	89 10                	mov    %edx,(%eax)
c0006b18:	c7 45 e8 88 ce 00 c0 	movl   $0xc000ce88,-0x18(%ebp)
c0006b1f:	c7 45 e4 8a ce 00 c0 	movl   $0xc000ce8a,-0x1c(%ebp)
c0006b26:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b29:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0006b2e:	ba 20 ee 00 c0       	mov    $0xc000ee20,%edx
c0006b33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006b36:	89 10                	mov    %edx,(%eax)
c0006b38:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006b3f:	eb 04                	jmp    c0006b45 <ReloadGDT+0x75>
c0006b41:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b45:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0006b4c:	7e f3                	jle    c0006b41 <ReloadGDT+0x71>
c0006b4e:	e8 0e ae ff ff       	call   c0001961 <init_internal_interrupt>
c0006b53:	e8 31 fe ff ff       	call   c0006989 <init_propt>
c0006b58:	90                   	nop
c0006b59:	c9                   	leave  
c0006b5a:	c3                   	ret    

c0006b5b <select_console>:
c0006b5b:	55                   	push   %ebp
c0006b5c:	89 e5                	mov    %esp,%ebp
c0006b5e:	83 ec 18             	sub    $0x18,%esp
c0006b61:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b64:	88 45 f4             	mov    %al,-0xc(%ebp)
c0006b67:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0006b6b:	77 27                	ja     c0006b94 <select_console+0x39>
c0006b6d:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0006b71:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0006b77:	05 00 d5 00 c0       	add    $0xc000d500,%eax
c0006b7c:	a3 80 ce 00 c0       	mov    %eax,0xc000ce80
c0006b81:	a1 80 ce 00 c0       	mov    0xc000ce80,%eax
c0006b86:	83 ec 0c             	sub    $0xc,%esp
c0006b89:	50                   	push   %eax
c0006b8a:	e8 08 00 00 00       	call   c0006b97 <flush>
c0006b8f:	83 c4 10             	add    $0x10,%esp
c0006b92:	eb 01                	jmp    c0006b95 <select_console+0x3a>
c0006b94:	90                   	nop
c0006b95:	c9                   	leave  
c0006b96:	c3                   	ret    

c0006b97 <flush>:
c0006b97:	55                   	push   %ebp
c0006b98:	89 e5                	mov    %esp,%ebp
c0006b9a:	83 ec 08             	sub    $0x8,%esp
c0006b9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ba0:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006ba6:	8b 40 0c             	mov    0xc(%eax),%eax
c0006ba9:	83 ec 0c             	sub    $0xc,%esp
c0006bac:	50                   	push   %eax
c0006bad:	e8 1e 00 00 00       	call   c0006bd0 <set_cursor>
c0006bb2:	83 c4 10             	add    $0x10,%esp
c0006bb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bb8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006bbe:	8b 40 08             	mov    0x8(%eax),%eax
c0006bc1:	83 ec 0c             	sub    $0xc,%esp
c0006bc4:	50                   	push   %eax
c0006bc5:	e8 64 00 00 00       	call   c0006c2e <set_console_start_video_addr>
c0006bca:	83 c4 10             	add    $0x10,%esp
c0006bcd:	90                   	nop
c0006bce:	c9                   	leave  
c0006bcf:	c3                   	ret    

c0006bd0 <set_cursor>:
c0006bd0:	55                   	push   %ebp
c0006bd1:	89 e5                	mov    %esp,%ebp
c0006bd3:	83 ec 08             	sub    $0x8,%esp
c0006bd6:	83 ec 08             	sub    $0x8,%esp
c0006bd9:	6a 0e                	push   $0xe
c0006bdb:	68 d4 03 00 00       	push   $0x3d4
c0006be0:	e8 cf a6 ff ff       	call   c00012b4 <out_byte>
c0006be5:	83 c4 10             	add    $0x10,%esp
c0006be8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006beb:	c1 e8 08             	shr    $0x8,%eax
c0006bee:	0f b7 c0             	movzwl %ax,%eax
c0006bf1:	83 ec 08             	sub    $0x8,%esp
c0006bf4:	50                   	push   %eax
c0006bf5:	68 d5 03 00 00       	push   $0x3d5
c0006bfa:	e8 b5 a6 ff ff       	call   c00012b4 <out_byte>
c0006bff:	83 c4 10             	add    $0x10,%esp
c0006c02:	83 ec 08             	sub    $0x8,%esp
c0006c05:	6a 0f                	push   $0xf
c0006c07:	68 d4 03 00 00       	push   $0x3d4
c0006c0c:	e8 a3 a6 ff ff       	call   c00012b4 <out_byte>
c0006c11:	83 c4 10             	add    $0x10,%esp
c0006c14:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c17:	0f b7 c0             	movzwl %ax,%eax
c0006c1a:	83 ec 08             	sub    $0x8,%esp
c0006c1d:	50                   	push   %eax
c0006c1e:	68 d5 03 00 00       	push   $0x3d5
c0006c23:	e8 8c a6 ff ff       	call   c00012b4 <out_byte>
c0006c28:	83 c4 10             	add    $0x10,%esp
c0006c2b:	90                   	nop
c0006c2c:	c9                   	leave  
c0006c2d:	c3                   	ret    

c0006c2e <set_console_start_video_addr>:
c0006c2e:	55                   	push   %ebp
c0006c2f:	89 e5                	mov    %esp,%ebp
c0006c31:	83 ec 08             	sub    $0x8,%esp
c0006c34:	83 ec 08             	sub    $0x8,%esp
c0006c37:	6a 0c                	push   $0xc
c0006c39:	68 d4 03 00 00       	push   $0x3d4
c0006c3e:	e8 71 a6 ff ff       	call   c00012b4 <out_byte>
c0006c43:	83 c4 10             	add    $0x10,%esp
c0006c46:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c49:	c1 e8 08             	shr    $0x8,%eax
c0006c4c:	0f b7 c0             	movzwl %ax,%eax
c0006c4f:	83 ec 08             	sub    $0x8,%esp
c0006c52:	50                   	push   %eax
c0006c53:	68 d5 03 00 00       	push   $0x3d5
c0006c58:	e8 57 a6 ff ff       	call   c00012b4 <out_byte>
c0006c5d:	83 c4 10             	add    $0x10,%esp
c0006c60:	83 ec 08             	sub    $0x8,%esp
c0006c63:	6a 0d                	push   $0xd
c0006c65:	68 d4 03 00 00       	push   $0x3d4
c0006c6a:	e8 45 a6 ff ff       	call   c00012b4 <out_byte>
c0006c6f:	83 c4 10             	add    $0x10,%esp
c0006c72:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c75:	0f b7 c0             	movzwl %ax,%eax
c0006c78:	83 ec 08             	sub    $0x8,%esp
c0006c7b:	50                   	push   %eax
c0006c7c:	68 d5 03 00 00       	push   $0x3d5
c0006c81:	e8 2e a6 ff ff       	call   c00012b4 <out_byte>
c0006c86:	83 c4 10             	add    $0x10,%esp
c0006c89:	90                   	nop
c0006c8a:	c9                   	leave  
c0006c8b:	c3                   	ret    

c0006c8c <put_key>:
c0006c8c:	55                   	push   %ebp
c0006c8d:	89 e5                	mov    %esp,%ebp
c0006c8f:	83 ec 04             	sub    $0x4,%esp
c0006c92:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c95:	88 45 fc             	mov    %al,-0x4(%ebp)
c0006c98:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c9b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0006ca1:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0006ca6:	77 4d                	ja     c0006cf5 <put_key+0x69>
c0006ca8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cab:	8b 00                	mov    (%eax),%eax
c0006cad:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0006cb1:	89 10                	mov    %edx,(%eax)
c0006cb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cb6:	8b 00                	mov    (%eax),%eax
c0006cb8:	8d 50 04             	lea    0x4(%eax),%edx
c0006cbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cbe:	89 10                	mov    %edx,(%eax)
c0006cc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cc3:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0006cc9:	8d 50 01             	lea    0x1(%eax),%edx
c0006ccc:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ccf:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0006cd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cd8:	8b 00                	mov    (%eax),%eax
c0006cda:	8b 55 08             	mov    0x8(%ebp),%edx
c0006cdd:	83 c2 08             	add    $0x8,%edx
c0006ce0:	81 c2 00 08 00 00    	add    $0x800,%edx
c0006ce6:	39 d0                	cmp    %edx,%eax
c0006ce8:	75 0b                	jne    c0006cf5 <put_key+0x69>
c0006cea:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ced:	8d 50 08             	lea    0x8(%eax),%edx
c0006cf0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cf3:	89 10                	mov    %edx,(%eax)
c0006cf5:	90                   	nop
c0006cf6:	c9                   	leave  
c0006cf7:	c3                   	ret    

c0006cf8 <scroll_up>:
c0006cf8:	55                   	push   %ebp
c0006cf9:	89 e5                	mov    %esp,%ebp
c0006cfb:	83 ec 08             	sub    $0x8,%esp
c0006cfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d01:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d07:	8b 40 08             	mov    0x8(%eax),%eax
c0006d0a:	8d 50 b0             	lea    -0x50(%eax),%edx
c0006d0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d10:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d16:	8b 00                	mov    (%eax),%eax
c0006d18:	39 c2                	cmp    %eax,%edx
c0006d1a:	76 1b                	jbe    c0006d37 <scroll_up+0x3f>
c0006d1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d1f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d25:	8b 40 08             	mov    0x8(%eax),%eax
c0006d28:	83 e8 50             	sub    $0x50,%eax
c0006d2b:	83 ec 0c             	sub    $0xc,%esp
c0006d2e:	50                   	push   %eax
c0006d2f:	e8 fa fe ff ff       	call   c0006c2e <set_console_start_video_addr>
c0006d34:	83 c4 10             	add    $0x10,%esp
c0006d37:	90                   	nop
c0006d38:	c9                   	leave  
c0006d39:	c3                   	ret    

c0006d3a <scroll_down>:
c0006d3a:	55                   	push   %ebp
c0006d3b:	89 e5                	mov    %esp,%ebp
c0006d3d:	83 ec 08             	sub    $0x8,%esp
c0006d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d43:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d49:	8b 40 08             	mov    0x8(%eax),%eax
c0006d4c:	8d 48 50             	lea    0x50(%eax),%ecx
c0006d4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d52:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d58:	8b 10                	mov    (%eax),%edx
c0006d5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d5d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d63:	8b 40 04             	mov    0x4(%eax),%eax
c0006d66:	01 d0                	add    %edx,%eax
c0006d68:	39 c1                	cmp    %eax,%ecx
c0006d6a:	73 36                	jae    c0006da2 <scroll_down+0x68>
c0006d6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d6f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d75:	8b 40 08             	mov    0x8(%eax),%eax
c0006d78:	83 c0 50             	add    $0x50,%eax
c0006d7b:	83 ec 0c             	sub    $0xc,%esp
c0006d7e:	50                   	push   %eax
c0006d7f:	e8 aa fe ff ff       	call   c0006c2e <set_console_start_video_addr>
c0006d84:	83 c4 10             	add    $0x10,%esp
c0006d87:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d8a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d90:	8b 50 08             	mov    0x8(%eax),%edx
c0006d93:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d96:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006d9c:	83 c2 50             	add    $0x50,%edx
c0006d9f:	89 50 08             	mov    %edx,0x8(%eax)
c0006da2:	90                   	nop
c0006da3:	c9                   	leave  
c0006da4:	c3                   	ret    

c0006da5 <out_char>:
c0006da5:	55                   	push   %ebp
c0006da6:	89 e5                	mov    %esp,%ebp
c0006da8:	83 ec 28             	sub    $0x28,%esp
c0006dab:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006dae:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0006db1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006db4:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006dba:	8b 40 0c             	mov    0xc(%eax),%eax
c0006dbd:	05 00 c0 05 00       	add    $0x5c000,%eax
c0006dc2:	01 c0                	add    %eax,%eax
c0006dc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006dc7:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0006dcb:	83 f8 08             	cmp    $0x8,%eax
c0006dce:	0f 84 8d 00 00 00    	je     c0006e61 <out_char+0xbc>
c0006dd4:	83 f8 0a             	cmp    $0xa,%eax
c0006dd7:	0f 85 c9 00 00 00    	jne    c0006ea6 <out_char+0x101>
c0006ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006de0:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006de6:	8b 50 0c             	mov    0xc(%eax),%edx
c0006de9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dec:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006df2:	8b 08                	mov    (%eax),%ecx
c0006df4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006df7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006dfd:	8b 40 04             	mov    0x4(%eax),%eax
c0006e00:	01 c8                	add    %ecx,%eax
c0006e02:	83 e8 50             	sub    $0x50,%eax
c0006e05:	39 c2                	cmp    %eax,%edx
c0006e07:	0f 83 f4 00 00 00    	jae    c0006f01 <out_char+0x15c>
c0006e0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e10:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006e16:	8b 08                	mov    (%eax),%ecx
c0006e18:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e1b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006e21:	8b 50 0c             	mov    0xc(%eax),%edx
c0006e24:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e27:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006e2d:	8b 00                	mov    (%eax),%eax
c0006e2f:	29 c2                	sub    %eax,%edx
c0006e31:	89 d0                	mov    %edx,%eax
c0006e33:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0006e38:	f7 e2                	mul    %edx
c0006e3a:	89 d0                	mov    %edx,%eax
c0006e3c:	c1 e8 06             	shr    $0x6,%eax
c0006e3f:	8d 50 01             	lea    0x1(%eax),%edx
c0006e42:	89 d0                	mov    %edx,%eax
c0006e44:	c1 e0 02             	shl    $0x2,%eax
c0006e47:	01 d0                	add    %edx,%eax
c0006e49:	c1 e0 04             	shl    $0x4,%eax
c0006e4c:	89 c2                	mov    %eax,%edx
c0006e4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e51:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006e57:	01 ca                	add    %ecx,%edx
c0006e59:	89 50 0c             	mov    %edx,0xc(%eax)
c0006e5c:	e9 a0 00 00 00       	jmp    c0006f01 <out_char+0x15c>
c0006e61:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e64:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006e6a:	8b 50 0c             	mov    0xc(%eax),%edx
c0006e6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e70:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006e76:	8b 00                	mov    (%eax),%eax
c0006e78:	39 c2                	cmp    %eax,%edx
c0006e7a:	0f 86 84 00 00 00    	jbe    c0006f04 <out_char+0x15f>
c0006e80:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e83:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006e89:	8b 50 0c             	mov    0xc(%eax),%edx
c0006e8c:	83 ea 01             	sub    $0x1,%edx
c0006e8f:	89 50 0c             	mov    %edx,0xc(%eax)
c0006e92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e95:	83 e8 02             	sub    $0x2,%eax
c0006e98:	c6 00 20             	movb   $0x20,(%eax)
c0006e9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e9e:	83 e8 01             	sub    $0x1,%eax
c0006ea1:	c6 00 00             	movb   $0x0,(%eax)
c0006ea4:	eb 5e                	jmp    c0006f04 <out_char+0x15f>
c0006ea6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ea9:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006eaf:	8b 40 0c             	mov    0xc(%eax),%eax
c0006eb2:	8d 48 01             	lea    0x1(%eax),%ecx
c0006eb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006eb8:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006ebe:	8b 10                	mov    (%eax),%edx
c0006ec0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ec3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006ec9:	8b 40 04             	mov    0x4(%eax),%eax
c0006ecc:	01 d0                	add    %edx,%eax
c0006ece:	39 c1                	cmp    %eax,%ecx
c0006ed0:	73 35                	jae    c0006f07 <out_char+0x162>
c0006ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ed5:	8d 50 01             	lea    0x1(%eax),%edx
c0006ed8:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0006edb:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0006edf:	88 10                	mov    %dl,(%eax)
c0006ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ee4:	8d 50 01             	lea    0x1(%eax),%edx
c0006ee7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0006eea:	c6 00 0a             	movb   $0xa,(%eax)
c0006eed:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ef0:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006ef6:	8b 50 0c             	mov    0xc(%eax),%edx
c0006ef9:	83 c2 01             	add    $0x1,%edx
c0006efc:	89 50 0c             	mov    %edx,0xc(%eax)
c0006eff:	eb 06                	jmp    c0006f07 <out_char+0x162>
c0006f01:	90                   	nop
c0006f02:	eb 14                	jmp    c0006f18 <out_char+0x173>
c0006f04:	90                   	nop
c0006f05:	eb 11                	jmp    c0006f18 <out_char+0x173>
c0006f07:	90                   	nop
c0006f08:	eb 0e                	jmp    c0006f18 <out_char+0x173>
c0006f0a:	83 ec 0c             	sub    $0xc,%esp
c0006f0d:	ff 75 08             	pushl  0x8(%ebp)
c0006f10:	e8 25 fe ff ff       	call   c0006d3a <scroll_down>
c0006f15:	83 c4 10             	add    $0x10,%esp
c0006f18:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f1b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006f21:	8b 50 0c             	mov    0xc(%eax),%edx
c0006f24:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f27:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0006f2d:	8b 40 08             	mov    0x8(%eax),%eax
c0006f30:	29 c2                	sub    %eax,%edx
c0006f32:	89 d0                	mov    %edx,%eax
c0006f34:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0006f39:	77 cf                	ja     c0006f0a <out_char+0x165>
c0006f3b:	83 ec 0c             	sub    $0xc,%esp
c0006f3e:	ff 75 08             	pushl  0x8(%ebp)
c0006f41:	e8 51 fc ff ff       	call   c0006b97 <flush>
c0006f46:	83 c4 10             	add    $0x10,%esp
c0006f49:	90                   	nop
c0006f4a:	c9                   	leave  
c0006f4b:	c3                   	ret    

c0006f4c <tty_dev_read>:
c0006f4c:	55                   	push   %ebp
c0006f4d:	89 e5                	mov    %esp,%ebp
c0006f4f:	83 ec 08             	sub    $0x8,%esp
c0006f52:	a1 80 ce 00 c0       	mov    0xc000ce80,%eax
c0006f57:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006f5a:	75 17                	jne    c0006f73 <tty_dev_read+0x27>
c0006f5c:	a1 e8 d2 00 c0       	mov    0xc000d2e8,%eax
c0006f61:	85 c0                	test   %eax,%eax
c0006f63:	7e 0e                	jle    c0006f73 <tty_dev_read+0x27>
c0006f65:	83 ec 0c             	sub    $0xc,%esp
c0006f68:	ff 75 08             	pushl  0x8(%ebp)
c0006f6b:	e8 05 07 00 00       	call   c0007675 <keyboard_read>
c0006f70:	83 c4 10             	add    $0x10,%esp
c0006f73:	90                   	nop
c0006f74:	c9                   	leave  
c0006f75:	c3                   	ret    

c0006f76 <tty_dev_write>:
c0006f76:	55                   	push   %ebp
c0006f77:	89 e5                	mov    %esp,%ebp
c0006f79:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006f7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f82:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0006f88:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f8b:	e9 da 01 00 00       	jmp    c000716a <tty_dev_write+0x1f4>
c0006f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f93:	8b 40 04             	mov    0x4(%eax),%eax
c0006f96:	8b 00                	mov    (%eax),%eax
c0006f98:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006f9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f9e:	8b 40 04             	mov    0x4(%eax),%eax
c0006fa1:	8d 50 04             	lea    0x4(%eax),%edx
c0006fa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fa7:	89 50 04             	mov    %edx,0x4(%eax)
c0006faa:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fad:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0006fb3:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006fb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fb9:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0006fbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fc2:	8b 40 04             	mov    0x4(%eax),%eax
c0006fc5:	8b 55 08             	mov    0x8(%ebp),%edx
c0006fc8:	83 c2 08             	add    $0x8,%edx
c0006fcb:	81 c2 00 08 00 00    	add    $0x800,%edx
c0006fd1:	39 d0                	cmp    %edx,%eax
c0006fd3:	75 0c                	jne    c0006fe1 <tty_dev_write+0x6b>
c0006fd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fd8:	8d 50 08             	lea    0x8(%eax),%edx
c0006fdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fde:	89 50 04             	mov    %edx,0x4(%eax)
c0006fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fe4:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0006fea:	85 c0                	test   %eax,%eax
c0006fec:	0f 84 78 01 00 00    	je     c000716a <tty_dev_write+0x1f4>
c0006ff2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0006ff6:	3c 20                	cmp    $0x20,%al
c0006ff8:	76 08                	jbe    c0007002 <tty_dev_write+0x8c>
c0006ffa:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0006ffe:	3c 7e                	cmp    $0x7e,%al
c0007000:	76 10                	jbe    c0007012 <tty_dev_write+0x9c>
c0007002:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007006:	3c 20                	cmp    $0x20,%al
c0007008:	74 08                	je     c0007012 <tty_dev_write+0x9c>
c000700a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c000700e:	84 c0                	test   %al,%al
c0007010:	75 7b                	jne    c000708d <tty_dev_write+0x117>
c0007012:	83 ec 08             	sub    $0x8,%esp
c0007015:	8d 45 f3             	lea    -0xd(%ebp),%eax
c0007018:	50                   	push   %eax
c0007019:	6a 00                	push   $0x0
c000701b:	e8 26 f9 ff ff       	call   c0006946 <v2l>
c0007020:	83 c4 10             	add    $0x10,%esp
c0007023:	89 c1                	mov    %eax,%ecx
c0007025:	8b 45 08             	mov    0x8(%ebp),%eax
c0007028:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c000702e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007031:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007037:	01 d0                	add    %edx,%eax
c0007039:	83 ec 04             	sub    $0x4,%esp
c000703c:	6a 01                	push   $0x1
c000703e:	51                   	push   %ecx
c000703f:	50                   	push   %eax
c0007040:	e8 1d 29 00 00       	call   c0009962 <Memcpy>
c0007045:	83 c4 10             	add    $0x10,%esp
c0007048:	8b 45 08             	mov    0x8(%ebp),%eax
c000704b:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0007051:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007054:	8b 45 08             	mov    0x8(%ebp),%eax
c0007057:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000705d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007060:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007066:	8d 50 01             	lea    0x1(%eax),%edx
c0007069:	8b 45 08             	mov    0x8(%ebp),%eax
c000706c:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0007072:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007076:	0f b6 c0             	movzbl %al,%eax
c0007079:	83 ec 08             	sub    $0x8,%esp
c000707c:	50                   	push   %eax
c000707d:	ff 75 08             	pushl  0x8(%ebp)
c0007080:	e8 20 fd ff ff       	call   c0006da5 <out_char>
c0007085:	83 c4 10             	add    $0x10,%esp
c0007088:	e9 dd 00 00 00       	jmp    c000716a <tty_dev_write+0x1f4>
c000708d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0007091:	3c 08                	cmp    $0x8,%al
c0007093:	75 45                	jne    c00070da <tty_dev_write+0x164>
c0007095:	8b 45 08             	mov    0x8(%ebp),%eax
c0007098:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000709e:	8d 50 01             	lea    0x1(%eax),%edx
c00070a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00070a4:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00070aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00070ad:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00070b3:	8d 50 ff             	lea    -0x1(%eax),%edx
c00070b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00070b9:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00070bf:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00070c3:	0f b6 c0             	movzbl %al,%eax
c00070c6:	83 ec 08             	sub    $0x8,%esp
c00070c9:	50                   	push   %eax
c00070ca:	ff 75 08             	pushl  0x8(%ebp)
c00070cd:	e8 d3 fc ff ff       	call   c0006da5 <out_char>
c00070d2:	83 c4 10             	add    $0x10,%esp
c00070d5:	e9 90 00 00 00       	jmp    c000716a <tty_dev_write+0x1f4>
c00070da:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00070de:	3c 0a                	cmp    $0xa,%al
c00070e0:	74 10                	je     c00070f2 <tty_dev_write+0x17c>
c00070e2:	8b 45 08             	mov    0x8(%ebp),%eax
c00070e5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00070eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070ee:	39 c2                	cmp    %eax,%edx
c00070f0:	75 78                	jne    c000716a <tty_dev_write+0x1f4>
c00070f2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c00070f6:	0f b6 c0             	movzbl %al,%eax
c00070f9:	83 ec 08             	sub    $0x8,%esp
c00070fc:	50                   	push   %eax
c00070fd:	ff 75 08             	pushl  0x8(%ebp)
c0007100:	e8 a0 fc ff ff       	call   c0006da5 <out_char>
c0007105:	83 c4 10             	add    $0x10,%esp
c0007108:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
c000710f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007112:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007118:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000711b:	8b 45 08             	mov    0x8(%ebp),%eax
c000711e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0007124:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007127:	8b 45 08             	mov    0x8(%ebp),%eax
c000712a:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0007130:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0007133:	8b 45 08             	mov    0x8(%ebp),%eax
c0007136:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c000713d:	00 00 00 
c0007140:	8b 45 08             	mov    0x8(%ebp),%eax
c0007143:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000714a:	00 00 00 
c000714d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007150:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c0007156:	83 ec 04             	sub    $0x4,%esp
c0007159:	50                   	push   %eax
c000715a:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000715d:	50                   	push   %eax
c000715e:	6a 01                	push   $0x1
c0007160:	e8 66 c6 ff ff       	call   c00037cb <send_rec>
c0007165:	83 c4 10             	add    $0x10,%esp
c0007168:	eb 11                	jmp    c000717b <tty_dev_write+0x205>
c000716a:	8b 45 08             	mov    0x8(%ebp),%eax
c000716d:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0007173:	85 c0                	test   %eax,%eax
c0007175:	0f 85 15 fe ff ff    	jne    c0006f90 <tty_dev_write+0x1a>
c000717b:	c9                   	leave  
c000717c:	c3                   	ret    

c000717d <tty_do_read>:
c000717d:	55                   	push   %ebp
c000717e:	89 e5                	mov    %esp,%ebp
c0007180:	83 ec 08             	sub    $0x8,%esp
c0007183:	8b 45 08             	mov    0x8(%ebp),%eax
c0007186:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000718d:	00 00 00 
c0007190:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007193:	8b 50 58             	mov    0x58(%eax),%edx
c0007196:	8b 45 08             	mov    0x8(%ebp),%eax
c0007199:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000719f:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071a2:	8b 00                	mov    (%eax),%eax
c00071a4:	89 c2                	mov    %eax,%edx
c00071a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00071a9:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00071af:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071b2:	8b 50 50             	mov    0x50(%eax),%edx
c00071b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00071b8:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00071be:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071c1:	8b 40 10             	mov    0x10(%eax),%eax
c00071c4:	89 c2                	mov    %eax,%edx
c00071c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00071c9:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00071cf:	83 ec 08             	sub    $0x8,%esp
c00071d2:	52                   	push   %edx
c00071d3:	50                   	push   %eax
c00071d4:	e8 6d f7 ff ff       	call   c0006946 <v2l>
c00071d9:	83 c4 10             	add    $0x10,%esp
c00071dc:	89 c2                	mov    %eax,%edx
c00071de:	8b 45 08             	mov    0x8(%ebp),%eax
c00071e1:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00071e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071ea:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00071f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00071f4:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c00071fa:	83 ec 04             	sub    $0x4,%esp
c00071fd:	50                   	push   %eax
c00071fe:	ff 75 0c             	pushl  0xc(%ebp)
c0007201:	6a 01                	push   $0x1
c0007203:	e8 c3 c5 ff ff       	call   c00037cb <send_rec>
c0007208:	83 c4 10             	add    $0x10,%esp
c000720b:	90                   	nop
c000720c:	c9                   	leave  
c000720d:	c3                   	ret    

c000720e <tty_do_write>:
c000720e:	55                   	push   %ebp
c000720f:	89 e5                	mov    %esp,%ebp
c0007211:	53                   	push   %ebx
c0007212:	81 ec 94 00 00 00    	sub    $0x94,%esp
c0007218:	89 e0                	mov    %esp,%eax
c000721a:	89 c3                	mov    %eax,%ebx
c000721c:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0007223:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007226:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007229:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c000722c:	89 c2                	mov    %eax,%edx
c000722e:	b8 10 00 00 00       	mov    $0x10,%eax
c0007233:	83 e8 01             	sub    $0x1,%eax
c0007236:	01 d0                	add    %edx,%eax
c0007238:	b9 10 00 00 00       	mov    $0x10,%ecx
c000723d:	ba 00 00 00 00       	mov    $0x0,%edx
c0007242:	f7 f1                	div    %ecx
c0007244:	6b c0 10             	imul   $0x10,%eax,%eax
c0007247:	29 c4                	sub    %eax,%esp
c0007249:	89 e0                	mov    %esp,%eax
c000724b:	83 c0 00             	add    $0x0,%eax
c000724e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007251:	83 ec 04             	sub    $0x4,%esp
c0007254:	ff 75 e8             	pushl  -0x18(%ebp)
c0007257:	6a 00                	push   $0x0
c0007259:	ff 75 e0             	pushl  -0x20(%ebp)
c000725c:	e8 2f 27 00 00       	call   c0009990 <Memset>
c0007261:	83 c4 10             	add    $0x10,%esp
c0007264:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007267:	8b 40 50             	mov    0x50(%eax),%eax
c000726a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000726d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007270:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0007277:	00 00 00 
c000727a:	e9 98 00 00 00       	jmp    c0007317 <tty_do_write+0x109>
c000727f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007282:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0007285:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0007289:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000728c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000728f:	8b 40 10             	mov    0x10(%eax),%eax
c0007292:	89 c2                	mov    %eax,%edx
c0007294:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007297:	8b 40 58             	mov    0x58(%eax),%eax
c000729a:	83 ec 08             	sub    $0x8,%esp
c000729d:	52                   	push   %edx
c000729e:	50                   	push   %eax
c000729f:	e8 a2 f6 ff ff       	call   c0006946 <v2l>
c00072a4:	83 c4 10             	add    $0x10,%esp
c00072a7:	89 c2                	mov    %eax,%edx
c00072a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00072ac:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00072b2:	01 d0                	add    %edx,%eax
c00072b4:	83 ec 04             	sub    $0x4,%esp
c00072b7:	ff 75 f0             	pushl  -0x10(%ebp)
c00072ba:	50                   	push   %eax
c00072bb:	ff 75 e0             	pushl  -0x20(%ebp)
c00072be:	e8 9f 26 00 00       	call   c0009962 <Memcpy>
c00072c3:	83 c4 10             	add    $0x10,%esp
c00072c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072c9:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00072cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00072cf:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00072d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072d8:	01 c2                	add    %eax,%edx
c00072da:	8b 45 08             	mov    0x8(%ebp),%eax
c00072dd:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00072e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00072ea:	eb 25                	jmp    c0007311 <tty_do_write+0x103>
c00072ec:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00072ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00072f2:	01 d0                	add    %edx,%eax
c00072f4:	0f b6 00             	movzbl (%eax),%eax
c00072f7:	0f b6 c0             	movzbl %al,%eax
c00072fa:	83 ec 08             	sub    $0x8,%esp
c00072fd:	50                   	push   %eax
c00072fe:	ff 75 08             	pushl  0x8(%ebp)
c0007301:	e8 9f fa ff ff       	call   c0006da5 <out_char>
c0007306:	83 c4 10             	add    $0x10,%esp
c0007309:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000730d:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007311:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007315:	75 d5                	jne    c00072ec <tty_do_write+0xde>
c0007317:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000731b:	0f 85 5e ff ff ff    	jne    c000727f <tty_do_write+0x71>
c0007321:	c7 45 dc 65 00 00 00 	movl   $0x65,-0x24(%ebp)
c0007328:	8b 45 08             	mov    0x8(%ebp),%eax
c000732b:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0007331:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007334:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007337:	8b 00                	mov    (%eax),%eax
c0007339:	83 ec 04             	sub    $0x4,%esp
c000733c:	50                   	push   %eax
c000733d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0007343:	50                   	push   %eax
c0007344:	6a 01                	push   $0x1
c0007346:	e8 80 c4 ff ff       	call   c00037cb <send_rec>
c000734b:	83 c4 10             	add    $0x10,%esp
c000734e:	89 dc                	mov    %ebx,%esp
c0007350:	90                   	nop
c0007351:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0007354:	c9                   	leave  
c0007355:	c3                   	ret    

c0007356 <init_screen>:
c0007356:	55                   	push   %ebp
c0007357:	89 e5                	mov    %esp,%ebp
c0007359:	83 ec 10             	sub    $0x10,%esp
c000735c:	8b 45 08             	mov    0x8(%ebp),%eax
c000735f:	2d 00 d5 00 c0       	sub    $0xc000d500,%eax
c0007364:	c1 f8 02             	sar    $0x2,%eax
c0007367:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c000736d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007370:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007373:	c1 e0 04             	shl    $0x4,%eax
c0007376:	8d 90 40 f6 00 c0    	lea    -0x3fff09c0(%eax),%edx
c000737c:	8b 45 08             	mov    0x8(%ebp),%eax
c000737f:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0007385:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c000738c:	8b 45 08             	mov    0x8(%ebp),%eax
c000738f:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
c0007395:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007398:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c000739d:	f7 e2                	mul    %edx
c000739f:	89 d0                	mov    %edx,%eax
c00073a1:	d1 e8                	shr    %eax
c00073a3:	89 41 04             	mov    %eax,0x4(%ecx)
c00073a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00073a9:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00073af:	8b 50 04             	mov    0x4(%eax),%edx
c00073b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00073b5:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00073bb:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00073bf:	89 10                	mov    %edx,(%eax)
c00073c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00073c4:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c00073ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00073cd:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00073d3:	8b 12                	mov    (%edx),%edx
c00073d5:	89 50 08             	mov    %edx,0x8(%eax)
c00073d8:	8b 55 08             	mov    0x8(%ebp),%edx
c00073db:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
c00073e1:	8b 40 08             	mov    0x8(%eax),%eax
c00073e4:	89 42 0c             	mov    %eax,0xc(%edx)
c00073e7:	90                   	nop
c00073e8:	c9                   	leave  
c00073e9:	c3                   	ret    

c00073ea <init_tty>:
c00073ea:	55                   	push   %ebp
c00073eb:	89 e5                	mov    %esp,%ebp
c00073ed:	83 ec 18             	sub    $0x18,%esp
c00073f0:	c7 45 f4 00 d5 00 c0 	movl   $0xc000d500,-0xc(%ebp)
c00073f7:	eb 7a                	jmp    c0007473 <init_tty+0x89>
c00073f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00073fc:	8d 50 08             	lea    0x8(%eax),%edx
c00073ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007402:	89 50 04             	mov    %edx,0x4(%eax)
c0007405:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007408:	8b 50 04             	mov    0x4(%eax),%edx
c000740b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000740e:	89 10                	mov    %edx,(%eax)
c0007410:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007413:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000741a:	00 00 00 
c000741d:	ff 75 f4             	pushl  -0xc(%ebp)
c0007420:	e8 31 ff ff ff       	call   c0007356 <init_screen>
c0007425:	83 c4 04             	add    $0x4,%esp
c0007428:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000742b:	2d 00 d5 00 c0       	sub    $0xc000d500,%eax
c0007430:	85 c0                	test   %eax,%eax
c0007432:	7e 38                	jle    c000746c <init_tty+0x82>
c0007434:	83 ec 08             	sub    $0x8,%esp
c0007437:	6a 23                	push   $0x23
c0007439:	ff 75 f4             	pushl  -0xc(%ebp)
c000743c:	e8 64 f9 ff ff       	call   c0006da5 <out_char>
c0007441:	83 c4 10             	add    $0x10,%esp
c0007444:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007447:	05 e4 8e 01 00       	add    $0x18ee4,%eax
c000744c:	2d 00 d5 00 c0       	sub    $0xc000d500,%eax
c0007451:	c1 f8 02             	sar    $0x2,%eax
c0007454:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c000745a:	0f b6 c0             	movzbl %al,%eax
c000745d:	83 ec 08             	sub    $0x8,%esp
c0007460:	50                   	push   %eax
c0007461:	ff 75 f4             	pushl  -0xc(%ebp)
c0007464:	e8 3c f9 ff ff       	call   c0006da5 <out_char>
c0007469:	83 c4 10             	add    $0x10,%esp
c000746c:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0007473:	b8 6c ed 00 c0       	mov    $0xc000ed6c,%eax
c0007478:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000747b:	0f 82 78 ff ff ff    	jb     c00073f9 <init_tty+0xf>
c0007481:	90                   	nop
c0007482:	c9                   	leave  
c0007483:	c3                   	ret    

c0007484 <TaskTTY>:
c0007484:	55                   	push   %ebp
c0007485:	89 e5                	mov    %esp,%ebp
c0007487:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000748d:	83 ec 0c             	sub    $0xc,%esp
c0007490:	68 89 98 00 c0       	push   $0xc0009889
c0007495:	e8 f2 9b ff ff       	call   c000108c <disp_str>
c000749a:	83 c4 10             	add    $0x10,%esp
c000749d:	e8 48 ff ff ff       	call   c00073ea <init_tty>
c00074a2:	83 ec 0c             	sub    $0xc,%esp
c00074a5:	6a 01                	push   $0x1
c00074a7:	e8 af f6 ff ff       	call   c0006b5b <select_console>
c00074ac:	83 c4 10             	add    $0x10,%esp
c00074af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00074b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00074bd:	c7 45 f4 00 d5 00 c0 	movl   $0xc000d500,-0xc(%ebp)
c00074c4:	eb 30                	jmp    c00074f6 <TaskTTY+0x72>
c00074c6:	83 ec 0c             	sub    $0xc,%esp
c00074c9:	ff 75 f4             	pushl  -0xc(%ebp)
c00074cc:	e8 7b fa ff ff       	call   c0006f4c <tty_dev_read>
c00074d1:	83 c4 10             	add    $0x10,%esp
c00074d4:	83 ec 0c             	sub    $0xc,%esp
c00074d7:	ff 75 f4             	pushl  -0xc(%ebp)
c00074da:	e8 97 fa ff ff       	call   c0006f76 <tty_dev_write>
c00074df:	83 c4 10             	add    $0x10,%esp
c00074e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00074e5:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00074eb:	85 c0                	test   %eax,%eax
c00074ed:	75 d7                	jne    c00074c6 <TaskTTY+0x42>
c00074ef:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c00074f6:	b8 6c ed 00 c0       	mov    $0xc000ed6c,%eax
c00074fb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00074fe:	72 c6                	jb     c00074c6 <TaskTTY+0x42>
c0007500:	83 ec 04             	sub    $0x4,%esp
c0007503:	6a 0b                	push   $0xb
c0007505:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c000750b:	50                   	push   %eax
c000750c:	6a 02                	push   $0x2
c000750e:	e8 b8 c2 ff ff       	call   c00037cb <send_rec>
c0007513:	83 c4 10             	add    $0x10,%esp
c0007516:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007519:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000751c:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
c0007523:	74 28                	je     c000754d <TaskTTY+0xc9>
c0007525:	81 7d e8 d2 07 00 00 	cmpl   $0x7d2,-0x18(%ebp)
c000752c:	7f 0b                	jg     c0007539 <TaskTTY+0xb5>
c000752e:	81 7d e8 d1 07 00 00 	cmpl   $0x7d1,-0x18(%ebp)
c0007535:	74 56                	je     c000758d <TaskTTY+0x109>
c0007537:	eb 55                	jmp    c000758e <TaskTTY+0x10a>
c0007539:	81 7d e8 d3 07 00 00 	cmpl   $0x7d3,-0x18(%ebp)
c0007540:	74 25                	je     c0007567 <TaskTTY+0xe3>
c0007542:	81 7d e8 d5 07 00 00 	cmpl   $0x7d5,-0x18(%ebp)
c0007549:	74 36                	je     c0007581 <TaskTTY+0xfd>
c000754b:	eb 41                	jmp    c000758e <TaskTTY+0x10a>
c000754d:	a1 80 ce 00 c0       	mov    0xc000ce80,%eax
c0007552:	83 ec 08             	sub    $0x8,%esp
c0007555:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
c000755b:	52                   	push   %edx
c000755c:	50                   	push   %eax
c000755d:	e8 1b fc ff ff       	call   c000717d <tty_do_read>
c0007562:	83 c4 10             	add    $0x10,%esp
c0007565:	eb 27                	jmp    c000758e <TaskTTY+0x10a>
c0007567:	a1 80 ce 00 c0       	mov    0xc000ce80,%eax
c000756c:	83 ec 08             	sub    $0x8,%esp
c000756f:	8d 95 7c ff ff ff    	lea    -0x84(%ebp),%edx
c0007575:	52                   	push   %edx
c0007576:	50                   	push   %eax
c0007577:	e8 92 fc ff ff       	call   c000720e <tty_do_write>
c000757c:	83 c4 10             	add    $0x10,%esp
c000757f:	eb 0d                	jmp    c000758e <TaskTTY+0x10a>
c0007581:	c7 05 00 ee 00 c0 00 	movl   $0x0,0xc000ee00
c0007588:	00 00 00 
c000758b:	eb 01                	jmp    c000758e <TaskTTY+0x10a>
c000758d:	90                   	nop
c000758e:	e9 2a ff ff ff       	jmp    c00074bd <TaskTTY+0x39>

c0007593 <keyboard_handler>:
c0007593:	55                   	push   %ebp
c0007594:	89 e5                	mov    %esp,%ebp
c0007596:	83 ec 18             	sub    $0x18,%esp
c0007599:	c7 05 00 ee 00 c0 01 	movl   $0x1,0xc000ee00
c00075a0:	00 00 00 
c00075a3:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00075aa:	a1 e8 d2 00 c0       	mov    0xc000d2e8,%eax
c00075af:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00075b4:	7f 5c                	jg     c0007612 <keyboard_handler+0x7f>
c00075b6:	e8 1b 9d ff ff       	call   c00012d6 <disable_int>
c00075bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00075be:	0f b7 c0             	movzwl %ax,%eax
c00075c1:	83 ec 0c             	sub    $0xc,%esp
c00075c4:	50                   	push   %eax
c00075c5:	e8 de 9c ff ff       	call   c00012a8 <in_byte>
c00075ca:	83 c4 10             	add    $0x10,%esp
c00075cd:	88 45 f3             	mov    %al,-0xd(%ebp)
c00075d0:	a1 e0 d2 00 c0       	mov    0xc000d2e0,%eax
c00075d5:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c00075d9:	88 10                	mov    %dl,(%eax)
c00075db:	a1 e0 d2 00 c0       	mov    0xc000d2e0,%eax
c00075e0:	83 c0 01             	add    $0x1,%eax
c00075e3:	a3 e0 d2 00 c0       	mov    %eax,0xc000d2e0
c00075e8:	a1 e8 d2 00 c0       	mov    0xc000d2e8,%eax
c00075ed:	83 c0 01             	add    $0x1,%eax
c00075f0:	a3 e8 d2 00 c0       	mov    %eax,0xc000d2e8
c00075f5:	a1 e0 d2 00 c0       	mov    0xc000d2e0,%eax
c00075fa:	ba ec d4 00 c0       	mov    $0xc000d4ec,%edx
c00075ff:	39 d0                	cmp    %edx,%eax
c0007601:	72 0a                	jb     c000760d <keyboard_handler+0x7a>
c0007603:	c7 05 e0 d2 00 c0 ec 	movl   $0xc000d2ec,0xc000d2e0
c000760a:	d2 00 c0 
c000760d:	e8 c6 9c ff ff       	call   c00012d8 <enable_int>
c0007612:	90                   	nop
c0007613:	c9                   	leave  
c0007614:	c3                   	ret    

c0007615 <read_from_keyboard_buf>:
c0007615:	55                   	push   %ebp
c0007616:	89 e5                	mov    %esp,%ebp
c0007618:	83 ec 18             	sub    $0x18,%esp
c000761b:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000761f:	a1 e8 d2 00 c0       	mov    0xc000d2e8,%eax
c0007624:	85 c0                	test   %eax,%eax
c0007626:	7e 47                	jle    c000766f <read_from_keyboard_buf+0x5a>
c0007628:	e8 a9 9c ff ff       	call   c00012d6 <disable_int>
c000762d:	a1 e4 d2 00 c0       	mov    0xc000d2e4,%eax
c0007632:	0f b6 00             	movzbl (%eax),%eax
c0007635:	88 45 f7             	mov    %al,-0x9(%ebp)
c0007638:	a1 e4 d2 00 c0       	mov    0xc000d2e4,%eax
c000763d:	83 c0 01             	add    $0x1,%eax
c0007640:	a3 e4 d2 00 c0       	mov    %eax,0xc000d2e4
c0007645:	a1 e8 d2 00 c0       	mov    0xc000d2e8,%eax
c000764a:	83 e8 01             	sub    $0x1,%eax
c000764d:	a3 e8 d2 00 c0       	mov    %eax,0xc000d2e8
c0007652:	a1 e4 d2 00 c0       	mov    0xc000d2e4,%eax
c0007657:	ba ec d4 00 c0       	mov    $0xc000d4ec,%edx
c000765c:	39 d0                	cmp    %edx,%eax
c000765e:	72 0a                	jb     c000766a <read_from_keyboard_buf+0x55>
c0007660:	c7 05 e4 d2 00 c0 ec 	movl   $0xc000d2ec,0xc000d2e4
c0007667:	d2 00 c0 
c000766a:	e8 69 9c ff ff       	call   c00012d8 <enable_int>
c000766f:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0007673:	c9                   	leave  
c0007674:	c3                   	ret    

c0007675 <keyboard_read>:
c0007675:	55                   	push   %ebp
c0007676:	89 e5                	mov    %esp,%ebp
c0007678:	83 ec 28             	sub    $0x28,%esp
c000767b:	90                   	nop
c000767c:	a1 e8 d2 00 c0       	mov    0xc000d2e8,%eax
c0007681:	85 c0                	test   %eax,%eax
c0007683:	7e f7                	jle    c000767c <keyboard_read+0x7>
c0007685:	e8 8b ff ff ff       	call   c0007615 <read_from_keyboard_buf>
c000768a:	88 45 ea             	mov    %al,-0x16(%ebp)
c000768d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007694:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0007698:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c000769c:	75 5a                	jne    c00076f8 <keyboard_read+0x83>
c000769e:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00076a2:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00076a6:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00076aa:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00076ae:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00076b2:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00076b6:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00076ba:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00076c1:	eb 20                	jmp    c00076e3 <keyboard_read+0x6e>
c00076c3:	e8 4d ff ff ff       	call   c0007615 <read_from_keyboard_buf>
c00076c8:	89 c1                	mov    %eax,%ecx
c00076ca:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00076cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00076d0:	01 d0                	add    %edx,%eax
c00076d2:	0f b6 00             	movzbl (%eax),%eax
c00076d5:	38 c1                	cmp    %al,%cl
c00076d7:	74 06                	je     c00076df <keyboard_read+0x6a>
c00076d9:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c00076dd:	eb 0a                	jmp    c00076e9 <keyboard_read+0x74>
c00076df:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00076e3:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c00076e7:	7e da                	jle    c00076c3 <keyboard_read+0x4e>
c00076e9:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c00076ed:	74 68                	je     c0007757 <keyboard_read+0xe2>
c00076ef:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c00076f6:	eb 5f                	jmp    c0007757 <keyboard_read+0xe2>
c00076f8:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c00076fc:	75 59                	jne    c0007757 <keyboard_read+0xe2>
c00076fe:	e8 12 ff ff ff       	call   c0007615 <read_from_keyboard_buf>
c0007703:	3c 2a                	cmp    $0x2a,%al
c0007705:	75 1d                	jne    c0007724 <keyboard_read+0xaf>
c0007707:	e8 09 ff ff ff       	call   c0007615 <read_from_keyboard_buf>
c000770c:	3c e0                	cmp    $0xe0,%al
c000770e:	75 14                	jne    c0007724 <keyboard_read+0xaf>
c0007710:	e8 00 ff ff ff       	call   c0007615 <read_from_keyboard_buf>
c0007715:	3c 37                	cmp    $0x37,%al
c0007717:	75 0b                	jne    c0007724 <keyboard_read+0xaf>
c0007719:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0007720:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0007724:	e8 ec fe ff ff       	call   c0007615 <read_from_keyboard_buf>
c0007729:	3c b7                	cmp    $0xb7,%al
c000772b:	75 1d                	jne    c000774a <keyboard_read+0xd5>
c000772d:	e8 e3 fe ff ff       	call   c0007615 <read_from_keyboard_buf>
c0007732:	3c e0                	cmp    $0xe0,%al
c0007734:	75 14                	jne    c000774a <keyboard_read+0xd5>
c0007736:	e8 da fe ff ff       	call   c0007615 <read_from_keyboard_buf>
c000773b:	3c aa                	cmp    $0xaa,%al
c000773d:	75 0b                	jne    c000774a <keyboard_read+0xd5>
c000773f:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0007746:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c000774a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000774e:	75 07                	jne    c0007757 <keyboard_read+0xe2>
c0007750:	c6 05 84 ce 00 c0 01 	movb   $0x1,0xc000ce84
c0007757:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c000775e:	0f 84 8d 00 00 00    	je     c00077f1 <keyboard_read+0x17c>
c0007764:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c000776b:	0f 84 80 00 00 00    	je     c00077f1 <keyboard_read+0x17c>
c0007771:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0007775:	0f 94 c2             	sete   %dl
c0007778:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c000777c:	0f 94 c0             	sete   %al
c000777f:	09 d0                	or     %edx,%eax
c0007781:	84 c0                	test   %al,%al
c0007783:	74 07                	je     c000778c <keyboard_read+0x117>
c0007785:	c6 05 04 ee 00 c0 01 	movb   $0x1,0xc000ee04
c000778c:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0007790:	f7 d0                	not    %eax
c0007792:	c0 e8 07             	shr    $0x7,%al
c0007795:	88 45 e9             	mov    %al,-0x17(%ebp)
c0007798:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c000779c:	74 53                	je     c00077f1 <keyboard_read+0x17c>
c000779e:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c00077a2:	74 4d                	je     c00077f1 <keyboard_read+0x17c>
c00077a4:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c00077a8:	0f b6 05 04 ee 00 c0 	movzbl 0xc000ee04,%eax
c00077af:	3c 01                	cmp    $0x1,%al
c00077b1:	75 04                	jne    c00077b7 <keyboard_read+0x142>
c00077b3:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c00077b7:	0f b6 05 84 ce 00 c0 	movzbl 0xc000ce84,%eax
c00077be:	84 c0                	test   %al,%al
c00077c0:	74 04                	je     c00077c6 <keyboard_read+0x151>
c00077c2:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c00077c6:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c00077ca:	89 d0                	mov    %edx,%eax
c00077cc:	01 c0                	add    %eax,%eax
c00077ce:	01 c2                	add    %eax,%edx
c00077d0:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00077d4:	01 d0                	add    %edx,%eax
c00077d6:	8b 04 85 60 c0 00 c0 	mov    -0x3fff3fa0(,%eax,4),%eax
c00077dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00077e0:	83 ec 08             	sub    $0x8,%esp
c00077e3:	ff 75 f4             	pushl  -0xc(%ebp)
c00077e6:	ff 75 08             	pushl  0x8(%ebp)
c00077e9:	e8 1a 00 00 00       	call   c0007808 <in_process>
c00077ee:	83 c4 10             	add    $0x10,%esp
c00077f1:	90                   	nop
c00077f2:	c9                   	leave  
c00077f3:	c3                   	ret    

c00077f4 <init_keyboard_handler>:
c00077f4:	55                   	push   %ebp
c00077f5:	89 e5                	mov    %esp,%ebp
c00077f7:	c6 05 84 ce 00 c0 00 	movb   $0x0,0xc000ce84
c00077fe:	c6 05 04 ee 00 c0 00 	movb   $0x0,0xc000ee04
c0007805:	90                   	nop
c0007806:	5d                   	pop    %ebp
c0007807:	c3                   	ret    

c0007808 <in_process>:
c0007808:	55                   	push   %ebp
c0007809:	89 e5                	mov    %esp,%ebp
c000780b:	83 ec 18             	sub    $0x18,%esp
c000780e:	83 ec 04             	sub    $0x4,%esp
c0007811:	6a 02                	push   $0x2
c0007813:	6a 00                	push   $0x0
c0007815:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0007818:	50                   	push   %eax
c0007819:	e8 72 21 00 00       	call   c0009990 <Memset>
c000781e:	83 c4 10             	add    $0x10,%esp
c0007821:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007824:	25 00 01 00 00       	and    $0x100,%eax
c0007829:	85 c0                	test   %eax,%eax
c000782b:	75 28                	jne    c0007855 <in_process+0x4d>
c000782d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007830:	0f b6 c0             	movzbl %al,%eax
c0007833:	83 ec 08             	sub    $0x8,%esp
c0007836:	50                   	push   %eax
c0007837:	ff 75 08             	pushl  0x8(%ebp)
c000783a:	e8 4d f4 ff ff       	call   c0006c8c <put_key>
c000783f:	83 c4 10             	add    $0x10,%esp
c0007842:	c6 05 84 ce 00 c0 00 	movb   $0x0,0xc000ce84
c0007849:	c6 05 04 ee 00 c0 00 	movb   $0x0,0xc000ee04
c0007850:	e9 42 01 00 00       	jmp    c0007997 <in_process+0x18f>
c0007855:	0f b6 05 04 ee 00 c0 	movzbl 0xc000ee04,%eax
c000785c:	84 c0                	test   %al,%al
c000785e:	0f 84 a9 00 00 00    	je     c000790d <in_process+0x105>
c0007864:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0007868:	0f 84 9f 00 00 00    	je     c000790d <in_process+0x105>
c000786e:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0007872:	0f 84 95 00 00 00    	je     c000790d <in_process+0x105>
c0007878:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000787f:	74 64                	je     c00078e5 <in_process+0xdd>
c0007881:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0007888:	77 0b                	ja     c0007895 <in_process+0x8d>
c000788a:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0007891:	74 64                	je     c00078f7 <in_process+0xef>
c0007893:	eb 73                	jmp    c0007908 <in_process+0x100>
c0007895:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c000789c:	74 0b                	je     c00078a9 <in_process+0xa1>
c000789e:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c00078a5:	74 20                	je     c00078c7 <in_process+0xbf>
c00078a7:	eb 5f                	jmp    c0007908 <in_process+0x100>
c00078a9:	83 ec 0c             	sub    $0xc,%esp
c00078ac:	ff 75 08             	pushl  0x8(%ebp)
c00078af:	e8 44 f4 ff ff       	call   c0006cf8 <scroll_up>
c00078b4:	83 c4 10             	add    $0x10,%esp
c00078b7:	c6 05 04 ee 00 c0 00 	movb   $0x0,0xc000ee04
c00078be:	c6 05 84 ce 00 c0 00 	movb   $0x0,0xc000ce84
c00078c5:	eb 41                	jmp    c0007908 <in_process+0x100>
c00078c7:	83 ec 0c             	sub    $0xc,%esp
c00078ca:	ff 75 08             	pushl  0x8(%ebp)
c00078cd:	e8 68 f4 ff ff       	call   c0006d3a <scroll_down>
c00078d2:	83 c4 10             	add    $0x10,%esp
c00078d5:	c6 05 04 ee 00 c0 00 	movb   $0x0,0xc000ee04
c00078dc:	c6 05 84 ce 00 c0 00 	movb   $0x0,0xc000ce84
c00078e3:	eb 23                	jmp    c0007908 <in_process+0x100>
c00078e5:	83 ec 08             	sub    $0x8,%esp
c00078e8:	6a 0a                	push   $0xa
c00078ea:	ff 75 08             	pushl  0x8(%ebp)
c00078ed:	e8 b3 f4 ff ff       	call   c0006da5 <out_char>
c00078f2:	83 c4 10             	add    $0x10,%esp
c00078f5:	eb 11                	jmp    c0007908 <in_process+0x100>
c00078f7:	83 ec 08             	sub    $0x8,%esp
c00078fa:	6a 08                	push   $0x8
c00078fc:	ff 75 08             	pushl  0x8(%ebp)
c00078ff:	e8 a1 f4 ff ff       	call   c0006da5 <out_char>
c0007904:	83 c4 10             	add    $0x10,%esp
c0007907:	90                   	nop
c0007908:	e9 8a 00 00 00       	jmp    c0007997 <in_process+0x18f>
c000790d:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0007914:	74 55                	je     c000796b <in_process+0x163>
c0007916:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c000791d:	77 14                	ja     c0007933 <in_process+0x12b>
c000791f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0007926:	74 31                	je     c0007959 <in_process+0x151>
c0007928:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000792f:	74 16                	je     c0007947 <in_process+0x13f>
c0007931:	eb 64                	jmp    c0007997 <in_process+0x18f>
c0007933:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c000793a:	74 3e                	je     c000797a <in_process+0x172>
c000793c:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0007943:	74 44                	je     c0007989 <in_process+0x181>
c0007945:	eb 50                	jmp    c0007997 <in_process+0x18f>
c0007947:	83 ec 08             	sub    $0x8,%esp
c000794a:	6a 0a                	push   $0xa
c000794c:	ff 75 08             	pushl  0x8(%ebp)
c000794f:	e8 38 f3 ff ff       	call   c0006c8c <put_key>
c0007954:	83 c4 10             	add    $0x10,%esp
c0007957:	eb 3e                	jmp    c0007997 <in_process+0x18f>
c0007959:	83 ec 08             	sub    $0x8,%esp
c000795c:	6a 08                	push   $0x8
c000795e:	ff 75 08             	pushl  0x8(%ebp)
c0007961:	e8 26 f3 ff ff       	call   c0006c8c <put_key>
c0007966:	83 c4 10             	add    $0x10,%esp
c0007969:	eb 2c                	jmp    c0007997 <in_process+0x18f>
c000796b:	83 ec 0c             	sub    $0xc,%esp
c000796e:	6a 00                	push   $0x0
c0007970:	e8 e6 f1 ff ff       	call   c0006b5b <select_console>
c0007975:	83 c4 10             	add    $0x10,%esp
c0007978:	eb 1d                	jmp    c0007997 <in_process+0x18f>
c000797a:	83 ec 0c             	sub    $0xc,%esp
c000797d:	6a 01                	push   $0x1
c000797f:	e8 d7 f1 ff ff       	call   c0006b5b <select_console>
c0007984:	83 c4 10             	add    $0x10,%esp
c0007987:	eb 0e                	jmp    c0007997 <in_process+0x18f>
c0007989:	83 ec 0c             	sub    $0xc,%esp
c000798c:	6a 02                	push   $0x2
c000798e:	e8 c8 f1 ff ff       	call   c0006b5b <select_console>
c0007993:	83 c4 10             	add    $0x10,%esp
c0007996:	90                   	nop
c0007997:	90                   	nop
c0007998:	c9                   	leave  
c0007999:	c3                   	ret    

c000799a <open>:
c000799a:	55                   	push   %ebp
c000799b:	89 e5                	mov    %esp,%ebp
c000799d:	83 ec 78             	sub    $0x78,%esp
c00079a0:	83 ec 04             	sub    $0x4,%esp
c00079a3:	6a 6c                	push   $0x6c
c00079a5:	6a 00                	push   $0x0
c00079a7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00079aa:	50                   	push   %eax
c00079ab:	e8 e0 1f 00 00       	call   c0009990 <Memset>
c00079b0:	83 c4 10             	add    $0x10,%esp
c00079b3:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
c00079ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00079bd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00079c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00079c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00079c6:	83 ec 0c             	sub    $0xc,%esp
c00079c9:	ff 75 08             	pushl  0x8(%ebp)
c00079cc:	e8 f8 1f 00 00       	call   c00099c9 <Strlen>
c00079d1:	83 c4 10             	add    $0x10,%esp
c00079d4:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00079d7:	83 ec 04             	sub    $0x4,%esp
c00079da:	6a 03                	push   $0x3
c00079dc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00079df:	50                   	push   %eax
c00079e0:	6a 03                	push   $0x3
c00079e2:	e8 e4 bd ff ff       	call   c00037cb <send_rec>
c00079e7:	83 c4 10             	add    $0x10,%esp
c00079ea:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00079ed:	c9                   	leave  
c00079ee:	c3                   	ret    

c00079ef <read>:
c00079ef:	55                   	push   %ebp
c00079f0:	89 e5                	mov    %esp,%ebp
c00079f2:	83 ec 78             	sub    $0x78,%esp
c00079f5:	c7 45 f4 07 00 00 00 	movl   $0x7,-0xc(%ebp)
c00079fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00079ff:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007a02:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a05:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0007a08:	8b 45 10             	mov    0x10(%ebp),%eax
c0007a0b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a0e:	83 ec 04             	sub    $0x4,%esp
c0007a11:	6a 03                	push   $0x3
c0007a13:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007a16:	50                   	push   %eax
c0007a17:	6a 03                	push   $0x3
c0007a19:	e8 ad bd ff ff       	call   c00037cb <send_rec>
c0007a1e:	83 c4 10             	add    $0x10,%esp
c0007a21:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a24:	c9                   	leave  
c0007a25:	c3                   	ret    

c0007a26 <write>:
c0007a26:	55                   	push   %ebp
c0007a27:	89 e5                	mov    %esp,%ebp
c0007a29:	83 ec 78             	sub    $0x78,%esp
c0007a2c:	c7 45 f4 0a 00 00 00 	movl   $0xa,-0xc(%ebp)
c0007a33:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a36:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007a39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007a3c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0007a3f:	8b 45 10             	mov    0x10(%ebp),%eax
c0007a42:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a45:	83 ec 04             	sub    $0x4,%esp
c0007a48:	6a 03                	push   $0x3
c0007a4a:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007a4d:	50                   	push   %eax
c0007a4e:	6a 03                	push   $0x3
c0007a50:	e8 76 bd ff ff       	call   c00037cb <send_rec>
c0007a55:	83 c4 10             	add    $0x10,%esp
c0007a58:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a5b:	c9                   	leave  
c0007a5c:	c3                   	ret    

c0007a5d <close>:
c0007a5d:	55                   	push   %ebp
c0007a5e:	89 e5                	mov    %esp,%ebp
c0007a60:	83 ec 78             	sub    $0x78,%esp
c0007a63:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007a6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a6d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007a70:	83 ec 04             	sub    $0x4,%esp
c0007a73:	6a 03                	push   $0x3
c0007a75:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007a78:	50                   	push   %eax
c0007a79:	6a 03                	push   $0x3
c0007a7b:	e8 4b bd ff ff       	call   c00037cb <send_rec>
c0007a80:	83 c4 10             	add    $0x10,%esp
c0007a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a86:	83 f8 65             	cmp    $0x65,%eax
c0007a89:	74 19                	je     c0007aa4 <close+0x47>
c0007a8b:	6a 14                	push   $0x14
c0007a8d:	68 92 98 00 c0       	push   $0xc0009892
c0007a92:	68 92 98 00 c0       	push   $0xc0009892
c0007a97:	68 9e 98 00 c0       	push   $0xc000989e
c0007a9c:	e8 86 b5 ff ff       	call   c0003027 <assertion_failure>
c0007aa1:	83 c4 10             	add    $0x10,%esp
c0007aa4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007aa7:	c9                   	leave  
c0007aa8:	c3                   	ret    

c0007aa9 <wait>:
c0007aa9:	55                   	push   %ebp
c0007aaa:	89 e5                	mov    %esp,%ebp
c0007aac:	83 ec 78             	sub    $0x78,%esp
c0007aaf:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0007ab6:	83 ec 04             	sub    $0x4,%esp
c0007ab9:	6a 04                	push   $0x4
c0007abb:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007abe:	50                   	push   %eax
c0007abf:	6a 03                	push   $0x3
c0007ac1:	e8 05 bd ff ff       	call   c00037cb <send_rec>
c0007ac6:	83 c4 10             	add    $0x10,%esp
c0007ac9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007acc:	89 c2                	mov    %eax,%edx
c0007ace:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ad1:	89 10                	mov    %edx,(%eax)
c0007ad3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007ad6:	83 f8 1a             	cmp    $0x1a,%eax
c0007ad9:	74 05                	je     c0007ae0 <wait+0x37>
c0007adb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007ade:	eb 05                	jmp    c0007ae5 <wait+0x3c>
c0007ae0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0007ae5:	c9                   	leave  
c0007ae6:	c3                   	ret    

c0007ae7 <exit>:
c0007ae7:	55                   	push   %ebp
c0007ae8:	89 e5                	mov    %esp,%ebp
c0007aea:	83 ec 78             	sub    $0x78,%esp
c0007aed:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0007af4:	8b 45 08             	mov    0x8(%ebp),%eax
c0007af7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007afa:	83 ec 04             	sub    $0x4,%esp
c0007afd:	6a 04                	push   $0x4
c0007aff:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007b02:	50                   	push   %eax
c0007b03:	6a 03                	push   $0x3
c0007b05:	e8 c1 bc ff ff       	call   c00037cb <send_rec>
c0007b0a:	83 c4 10             	add    $0x10,%esp
c0007b0d:	90                   	nop
c0007b0e:	c9                   	leave  
c0007b0f:	c3                   	ret    

c0007b10 <fork>:
c0007b10:	55                   	push   %ebp
c0007b11:	89 e5                	mov    %esp,%ebp
c0007b13:	83 ec 78             	sub    $0x78,%esp
c0007b16:	83 ec 04             	sub    $0x4,%esp
c0007b19:	6a 6c                	push   $0x6c
c0007b1b:	6a 00                	push   $0x0
c0007b1d:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007b20:	50                   	push   %eax
c0007b21:	e8 6a 1e 00 00       	call   c0009990 <Memset>
c0007b26:	83 c4 10             	add    $0x10,%esp
c0007b29:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0007b30:	83 ec 04             	sub    $0x4,%esp
c0007b33:	6a 04                	push   $0x4
c0007b35:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007b38:	50                   	push   %eax
c0007b39:	6a 03                	push   $0x3
c0007b3b:	e8 8b bc ff ff       	call   c00037cb <send_rec>
c0007b40:	83 c4 10             	add    $0x10,%esp
c0007b43:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0007b4a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007b4d:	85 c0                	test   %eax,%eax
c0007b4f:	74 19                	je     c0007b6a <fork+0x5a>
c0007b51:	6a 15                	push   $0x15
c0007b53:	68 b6 98 00 c0       	push   $0xc00098b6
c0007b58:	68 b6 98 00 c0       	push   $0xc00098b6
c0007b5d:	68 c1 98 00 c0       	push   $0xc00098c1
c0007b62:	e8 c0 b4 ff ff       	call   c0003027 <assertion_failure>
c0007b67:	83 c4 10             	add    $0x10,%esp
c0007b6a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b6d:	c9                   	leave  
c0007b6e:	c3                   	ret    

c0007b6f <getpid>:
c0007b6f:	55                   	push   %ebp
c0007b70:	89 e5                	mov    %esp,%ebp
c0007b72:	83 ec 78             	sub    $0x78,%esp
c0007b75:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0007b7c:	83 ec 04             	sub    $0x4,%esp
c0007b7f:	6a 01                	push   $0x1
c0007b81:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007b84:	50                   	push   %eax
c0007b85:	6a 03                	push   $0x3
c0007b87:	e8 3f bc ff ff       	call   c00037cb <send_rec>
c0007b8c:	83 c4 10             	add    $0x10,%esp
c0007b8f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b92:	c9                   	leave  
c0007b93:	c3                   	ret    

c0007b94 <exec>:
c0007b94:	55                   	push   %ebp
c0007b95:	89 e5                	mov    %esp,%ebp
c0007b97:	83 ec 78             	sub    $0x78,%esp
c0007b9a:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0007ba1:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ba4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007ba7:	83 ec 0c             	sub    $0xc,%esp
c0007baa:	ff 75 08             	pushl  0x8(%ebp)
c0007bad:	e8 17 1e 00 00       	call   c00099c9 <Strlen>
c0007bb2:	83 c4 10             	add    $0x10,%esp
c0007bb5:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007bb8:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0007bbf:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0007bc6:	83 ec 04             	sub    $0x4,%esp
c0007bc9:	6a 04                	push   $0x4
c0007bcb:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007bce:	50                   	push   %eax
c0007bcf:	6a 03                	push   $0x3
c0007bd1:	e8 f5 bb ff ff       	call   c00037cb <send_rec>
c0007bd6:	83 c4 10             	add    $0x10,%esp
c0007bd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007bdc:	83 f8 65             	cmp    $0x65,%eax
c0007bdf:	74 19                	je     c0007bfa <exec+0x66>
c0007be1:	6a 1a                	push   $0x1a
c0007be3:	68 d1 98 00 c0       	push   $0xc00098d1
c0007be8:	68 d1 98 00 c0       	push   $0xc00098d1
c0007bed:	68 dc 98 00 c0       	push   $0xc00098dc
c0007bf2:	e8 30 b4 ff ff       	call   c0003027 <assertion_failure>
c0007bf7:	83 c4 10             	add    $0x10,%esp
c0007bfa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007bfd:	c9                   	leave  
c0007bfe:	c3                   	ret    

c0007bff <execv>:
c0007bff:	55                   	push   %ebp
c0007c00:	89 e5                	mov    %esp,%ebp
c0007c02:	57                   	push   %edi
c0007c03:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0007c09:	83 ec 04             	sub    $0x4,%esp
c0007c0c:	68 00 80 00 00       	push   $0x8000
c0007c11:	6a 00                	push   $0x0
c0007c13:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0007c19:	50                   	push   %eax
c0007c1a:	e8 71 1d 00 00       	call   c0009990 <Memset>
c0007c1f:	83 c4 10             	add    $0x10,%esp
c0007c22:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007c25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007c28:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007c2f:	eb 0d                	jmp    c0007c3e <execv+0x3f>
c0007c31:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0007c35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007c38:	83 c0 04             	add    $0x4,%eax
c0007c3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007c3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c41:	8b 00                	mov    (%eax),%eax
c0007c43:	85 c0                	test   %eax,%eax
c0007c45:	75 ea                	jne    c0007c31 <execv+0x32>
c0007c47:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0007c4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007c50:	01 d0                	add    %edx,%eax
c0007c52:	c6 00 00             	movb   $0x0,(%eax)
c0007c55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007c58:	83 c0 04             	add    $0x4,%eax
c0007c5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007c5e:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0007c64:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007c67:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007c6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007c6d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007c74:	eb 64                	jmp    c0007cda <execv+0xdb>
c0007c76:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0007c7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007c7f:	01 c2                	add    %eax,%edx
c0007c81:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007c84:	89 10                	mov    %edx,(%eax)
c0007c86:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007c89:	8b 00                	mov    (%eax),%eax
c0007c8b:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0007c91:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0007c94:	01 ca                	add    %ecx,%edx
c0007c96:	83 ec 08             	sub    $0x8,%esp
c0007c99:	50                   	push   %eax
c0007c9a:	52                   	push   %edx
c0007c9b:	e8 0f 1d 00 00       	call   c00099af <Strcpy>
c0007ca0:	83 c4 10             	add    $0x10,%esp
c0007ca3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007ca6:	8b 00                	mov    (%eax),%eax
c0007ca8:	83 ec 0c             	sub    $0xc,%esp
c0007cab:	50                   	push   %eax
c0007cac:	e8 18 1d 00 00       	call   c00099c9 <Strlen>
c0007cb1:	83 c4 10             	add    $0x10,%esp
c0007cb4:	01 45 f0             	add    %eax,-0x10(%ebp)
c0007cb7:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0007cbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007cc0:	01 d0                	add    %edx,%eax
c0007cc2:	c6 00 00             	movb   $0x0,(%eax)
c0007cc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007cc8:	83 c0 01             	add    $0x1,%eax
c0007ccb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007cce:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0007cd2:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0007cd6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007cda:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007cdd:	8b 00                	mov    (%eax),%eax
c0007cdf:	85 c0                	test   %eax,%eax
c0007ce1:	75 93                	jne    c0007c76 <execv+0x77>
c0007ce3:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0007ce9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007cec:	eb 04                	jmp    c0007cf2 <execv+0xf3>
c0007cee:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0007cf2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007cf5:	8b 00                	mov    (%eax),%eax
c0007cf7:	85 c0                	test   %eax,%eax
c0007cf9:	75 f3                	jne    c0007cee <execv+0xef>
c0007cfb:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0007d01:	b8 00 00 00 00       	mov    $0x0,%eax
c0007d06:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0007d0b:	89 d7                	mov    %edx,%edi
c0007d0d:	f3 ab                	rep stos %eax,%es:(%edi)
c0007d0f:	c7 85 4c 7f ff ff f4 	movl   $0xc00098f4,-0x80b4(%ebp)
c0007d16:	98 00 c0 
c0007d19:	c7 85 50 7f ff ff fb 	movl   $0xc00098fb,-0x80b0(%ebp)
c0007d20:	98 00 c0 
c0007d23:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0007d2a:	00 00 00 
c0007d2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007d30:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0007d36:	83 ec 0c             	sub    $0xc,%esp
c0007d39:	ff 75 08             	pushl  0x8(%ebp)
c0007d3c:	e8 88 1c 00 00       	call   c00099c9 <Strlen>
c0007d41:	83 c4 10             	add    $0x10,%esp
c0007d44:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0007d4a:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0007d50:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0007d56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007d59:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0007d5f:	83 ec 04             	sub    $0x4,%esp
c0007d62:	6a 04                	push   $0x4
c0007d64:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0007d6a:	50                   	push   %eax
c0007d6b:	6a 03                	push   $0x3
c0007d6d:	e8 59 ba ff ff       	call   c00037cb <send_rec>
c0007d72:	83 c4 10             	add    $0x10,%esp
c0007d75:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0007d7b:	83 f8 65             	cmp    $0x65,%eax
c0007d7e:	74 19                	je     c0007d99 <execv+0x19a>
c0007d80:	6a 73                	push   $0x73
c0007d82:	68 d1 98 00 c0       	push   $0xc00098d1
c0007d87:	68 d1 98 00 c0       	push   $0xc00098d1
c0007d8c:	68 dc 98 00 c0       	push   $0xc00098dc
c0007d91:	e8 91 b2 ff ff       	call   c0003027 <assertion_failure>
c0007d96:	83 c4 10             	add    $0x10,%esp
c0007d99:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0007d9f:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0007da2:	c9                   	leave  
c0007da3:	c3                   	ret    

c0007da4 <execl>:
c0007da4:	55                   	push   %ebp
c0007da5:	89 e5                	mov    %esp,%ebp
c0007da7:	83 ec 18             	sub    $0x18,%esp
c0007daa:	8d 45 0c             	lea    0xc(%ebp),%eax
c0007dad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007db3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007db6:	83 ec 08             	sub    $0x8,%esp
c0007db9:	ff 75 f0             	pushl  -0x10(%ebp)
c0007dbc:	ff 75 08             	pushl  0x8(%ebp)
c0007dbf:	e8 3b fe ff ff       	call   c0007bff <execv>
c0007dc4:	83 c4 10             	add    $0x10,%esp
c0007dc7:	c9                   	leave  
c0007dc8:	c3                   	ret    

c0007dc9 <TaskMM>:
c0007dc9:	55                   	push   %ebp
c0007dca:	89 e5                	mov    %esp,%ebp
c0007dcc:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0007dd2:	83 ec 04             	sub    $0x4,%esp
c0007dd5:	6a 0b                	push   $0xb
c0007dd7:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0007ddd:	50                   	push   %eax
c0007dde:	6a 02                	push   $0x2
c0007de0:	e8 e6 b9 ff ff       	call   c00037cb <send_rec>
c0007de5:	83 c4 10             	add    $0x10,%esp
c0007de8:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0007dee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007df1:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0007df7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007dfa:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007e01:	c7 45 e0 65 00 00 00 	movl   $0x65,-0x20(%ebp)
c0007e08:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0007e0f:	c7 45 e8 73 d0 a6 00 	movl   $0xa6d073,-0x18(%ebp)
c0007e16:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0007e1a:	74 4e                	je     c0007e6a <TaskMM+0xa1>
c0007e1c:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
c0007e20:	7f 08                	jg     c0007e2a <TaskMM+0x61>
c0007e22:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0007e26:	74 27                	je     c0007e4f <TaskMM+0x86>
c0007e28:	eb 79                	jmp    c0007ea3 <TaskMM+0xda>
c0007e2a:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0007e2e:	74 08                	je     c0007e38 <TaskMM+0x6f>
c0007e30:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
c0007e34:	74 52                	je     c0007e88 <TaskMM+0xbf>
c0007e36:	eb 6b                	jmp    c0007ea3 <TaskMM+0xda>
c0007e38:	83 ec 0c             	sub    $0xc,%esp
c0007e3b:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0007e41:	50                   	push   %eax
c0007e42:	e8 f6 03 00 00       	call   c000823d <do_fork>
c0007e47:	83 c4 10             	add    $0x10,%esp
c0007e4a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007e4d:	eb 65                	jmp    c0007eb4 <TaskMM+0xeb>
c0007e4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007e56:	83 ec 0c             	sub    $0xc,%esp
c0007e59:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0007e5f:	50                   	push   %eax
c0007e60:	e8 a8 00 00 00       	call   c0007f0d <do_exec>
c0007e65:	83 c4 10             	add    $0x10,%esp
c0007e68:	eb 4a                	jmp    c0007eb4 <TaskMM+0xeb>
c0007e6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007e71:	83 ec 08             	sub    $0x8,%esp
c0007e74:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e77:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0007e7d:	50                   	push   %eax
c0007e7e:	e8 b8 05 00 00       	call   c000843b <do_exit>
c0007e83:	83 c4 10             	add    $0x10,%esp
c0007e86:	eb 2c                	jmp    c0007eb4 <TaskMM+0xeb>
c0007e88:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007e8f:	83 ec 0c             	sub    $0xc,%esp
c0007e92:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
c0007e98:	50                   	push   %eax
c0007e99:	e8 90 06 00 00       	call   c000852e <do_wait>
c0007e9e:	83 c4 10             	add    $0x10,%esp
c0007ea1:	eb 11                	jmp    c0007eb4 <TaskMM+0xeb>
c0007ea3:	83 ec 0c             	sub    $0xc,%esp
c0007ea6:	68 02 99 00 c0       	push   $0xc0009902
c0007eab:	e8 59 b1 ff ff       	call   c0003009 <panic>
c0007eb0:	83 c4 10             	add    $0x10,%esp
c0007eb3:	90                   	nop
c0007eb4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007eb8:	0f 84 14 ff ff ff    	je     c0007dd2 <TaskMM+0x9>
c0007ebe:	83 ec 04             	sub    $0x4,%esp
c0007ec1:	ff 75 ec             	pushl  -0x14(%ebp)
c0007ec4:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
c0007eca:	50                   	push   %eax
c0007ecb:	6a 01                	push   $0x1
c0007ecd:	e8 f9 b8 ff ff       	call   c00037cb <send_rec>
c0007ed2:	83 c4 10             	add    $0x10,%esp
c0007ed5:	e9 f8 fe ff ff       	jmp    c0007dd2 <TaskMM+0x9>

c0007eda <alloc_mem>:
c0007eda:	55                   	push   %ebp
c0007edb:	89 e5                	mov    %esp,%ebp
c0007edd:	83 ec 10             	sub    $0x10,%esp
c0007ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ee3:	83 e8 01             	sub    $0x1,%eax
c0007ee6:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0007eec:	05 00 00 a0 00       	add    $0xa00000,%eax
c0007ef1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007ef4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ef7:	c9                   	leave  
c0007ef8:	c3                   	ret    

c0007ef9 <do_exec2>:
c0007ef9:	55                   	push   %ebp
c0007efa:	89 e5                	mov    %esp,%ebp
c0007efc:	83 ec 10             	sub    $0x10,%esp
c0007eff:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0007f06:	b8 00 00 00 00       	mov    $0x0,%eax
c0007f0b:	c9                   	leave  
c0007f0c:	c3                   	ret    

c0007f0d <do_exec>:
c0007f0d:	55                   	push   %ebp
c0007f0e:	89 e5                	mov    %esp,%ebp
c0007f10:	56                   	push   %esi
c0007f11:	53                   	push   %ebx
c0007f12:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0007f18:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0007f1f:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0007f26:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c0007f2c:	83 ec 08             	sub    $0x8,%esp
c0007f2f:	6a 00                	push   $0x0
c0007f31:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c0007f34:	50                   	push   %eax
c0007f35:	e8 60 fa ff ff       	call   c000799a <open>
c0007f3a:	83 c4 10             	add    $0x10,%esp
c0007f3d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0007f43:	8b 00                	mov    (%eax),%eax
c0007f45:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007f48:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0007f4f:	83 ec 04             	sub    $0x4,%esp
c0007f52:	6a 0c                	push   $0xc
c0007f54:	6a 00                	push   $0x0
c0007f56:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0007f5c:	50                   	push   %eax
c0007f5d:	e8 2e 1a 00 00       	call   c0009990 <Memset>
c0007f62:	83 c4 10             	add    $0x10,%esp
c0007f65:	8b 45 08             	mov    0x8(%ebp),%eax
c0007f68:	8b 40 30             	mov    0x30(%eax),%eax
c0007f6b:	89 c6                	mov    %eax,%esi
c0007f6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007f70:	8b 40 34             	mov    0x34(%eax),%eax
c0007f73:	83 ec 08             	sub    $0x8,%esp
c0007f76:	50                   	push   %eax
c0007f77:	ff 75 d8             	pushl  -0x28(%ebp)
c0007f7a:	e8 c7 e9 ff ff       	call   c0006946 <v2l>
c0007f7f:	83 c4 10             	add    $0x10,%esp
c0007f82:	89 c3                	mov    %eax,%ebx
c0007f84:	83 ec 08             	sub    $0x8,%esp
c0007f87:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0007f8d:	50                   	push   %eax
c0007f8e:	6a 04                	push   $0x4
c0007f90:	e8 b1 e9 ff ff       	call   c0006946 <v2l>
c0007f95:	83 c4 10             	add    $0x10,%esp
c0007f98:	83 ec 04             	sub    $0x4,%esp
c0007f9b:	56                   	push   %esi
c0007f9c:	53                   	push   %ebx
c0007f9d:	50                   	push   %eax
c0007f9e:	e8 bf 19 00 00       	call   c0009962 <Memcpy>
c0007fa3:	83 c4 10             	add    $0x10,%esp
c0007fa6:	83 ec 08             	sub    $0x8,%esp
c0007fa9:	6a 00                	push   $0x0
c0007fab:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0007fb1:	50                   	push   %eax
c0007fb2:	e8 e3 f9 ff ff       	call   c000799a <open>
c0007fb7:	83 c4 10             	add    $0x10,%esp
c0007fba:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007fbd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007fc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007fc7:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c0007fcd:	01 d0                	add    %edx,%eax
c0007fcf:	83 ec 04             	sub    $0x4,%esp
c0007fd2:	68 00 02 00 00       	push   $0x200
c0007fd7:	50                   	push   %eax
c0007fd8:	ff 75 d0             	pushl  -0x30(%ebp)
c0007fdb:	e8 0f fa ff ff       	call   c00079ef <read>
c0007fe0:	83 c4 10             	add    $0x10,%esp
c0007fe3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007fe6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007fe9:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007fec:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0007ff0:	74 02                	je     c0007ff4 <do_exec+0xe7>
c0007ff2:	eb d0                	jmp    c0007fc4 <do_exec+0xb7>
c0007ff4:	90                   	nop
c0007ff5:	83 ec 0c             	sub    $0xc,%esp
c0007ff8:	ff 75 d0             	pushl  -0x30(%ebp)
c0007ffb:	e8 5d fa ff ff       	call   c0007a5d <close>
c0008000:	83 c4 10             	add    $0x10,%esp
c0008003:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0008009:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000800c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008013:	eb 72                	jmp    c0008087 <do_exec+0x17a>
c0008015:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008018:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c000801c:	0f b7 d0             	movzwl %ax,%edx
c000801f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008022:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0008026:	0f b7 c0             	movzwl %ax,%eax
c0008029:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c000802d:	01 c2                	add    %eax,%edx
c000802f:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0008035:	01 d0                	add    %edx,%eax
c0008037:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000803a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000803d:	8b 40 10             	mov    0x10(%eax),%eax
c0008040:	89 c6                	mov    %eax,%esi
c0008042:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008045:	8b 40 04             	mov    0x4(%eax),%eax
c0008048:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000804e:	01 d0                	add    %edx,%eax
c0008050:	83 ec 08             	sub    $0x8,%esp
c0008053:	50                   	push   %eax
c0008054:	6a 04                	push   $0x4
c0008056:	e8 eb e8 ff ff       	call   c0006946 <v2l>
c000805b:	83 c4 10             	add    $0x10,%esp
c000805e:	89 c3                	mov    %eax,%ebx
c0008060:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008063:	8b 40 08             	mov    0x8(%eax),%eax
c0008066:	83 ec 08             	sub    $0x8,%esp
c0008069:	50                   	push   %eax
c000806a:	ff 75 d8             	pushl  -0x28(%ebp)
c000806d:	e8 d4 e8 ff ff       	call   c0006946 <v2l>
c0008072:	83 c4 10             	add    $0x10,%esp
c0008075:	83 ec 04             	sub    $0x4,%esp
c0008078:	56                   	push   %esi
c0008079:	53                   	push   %ebx
c000807a:	50                   	push   %eax
c000807b:	e8 e2 18 00 00       	call   c0009962 <Memcpy>
c0008080:	83 c4 10             	add    $0x10,%esp
c0008083:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008087:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000808a:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c000808e:	0f b7 c0             	movzwl %ax,%eax
c0008091:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0008094:	0f 8c 7b ff ff ff    	jl     c0008015 <do_exec+0x108>
c000809a:	8b 45 08             	mov    0x8(%ebp),%eax
c000809d:	8b 40 10             	mov    0x10(%eax),%eax
c00080a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00080a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00080a6:	8b 40 1c             	mov    0x1c(%eax),%eax
c00080a9:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00080ac:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c00080b3:	83 ec 08             	sub    $0x8,%esp
c00080b6:	ff 75 c0             	pushl  -0x40(%ebp)
c00080b9:	ff 75 d8             	pushl  -0x28(%ebp)
c00080bc:	e8 85 e8 ff ff       	call   c0006946 <v2l>
c00080c1:	83 c4 10             	add    $0x10,%esp
c00080c4:	89 c3                	mov    %eax,%ebx
c00080c6:	83 ec 08             	sub    $0x8,%esp
c00080c9:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00080cf:	50                   	push   %eax
c00080d0:	6a 04                	push   $0x4
c00080d2:	e8 6f e8 ff ff       	call   c0006946 <v2l>
c00080d7:	83 c4 10             	add    $0x10,%esp
c00080da:	83 ec 04             	sub    $0x4,%esp
c00080dd:	ff 75 bc             	pushl  -0x44(%ebp)
c00080e0:	53                   	push   %ebx
c00080e1:	50                   	push   %eax
c00080e2:	e8 7b 18 00 00       	call   c0009962 <Memcpy>
c00080e7:	83 c4 10             	add    $0x10,%esp
c00080ea:	83 ec 08             	sub    $0x8,%esp
c00080ed:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00080f3:	50                   	push   %eax
c00080f4:	6a 04                	push   $0x4
c00080f6:	e8 4b e8 ff ff       	call   c0006946 <v2l>
c00080fb:	83 c4 10             	add    $0x10,%esp
c00080fe:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0008101:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0008104:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008107:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000810e:	eb 08                	jmp    c0008118 <do_exec+0x20b>
c0008110:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0008114:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0008118:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000811b:	8b 00                	mov    (%eax),%eax
c000811d:	85 c0                	test   %eax,%eax
c000811f:	75 ef                	jne    c0008110 <do_exec+0x203>
c0008121:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0008124:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0008127:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000812a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008131:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0008137:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000813a:	eb 17                	jmp    c0008153 <do_exec+0x246>
c000813c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008140:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008143:	8b 10                	mov    (%eax),%edx
c0008145:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0008148:	01 c2                	add    %eax,%edx
c000814a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000814d:	89 10                	mov    %edx,(%eax)
c000814f:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0008153:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008156:	8b 00                	mov    (%eax),%eax
c0008158:	85 c0                	test   %eax,%eax
c000815a:	75 e0                	jne    c000813c <do_exec+0x22f>
c000815c:	83 ec 08             	sub    $0x8,%esp
c000815f:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0008165:	50                   	push   %eax
c0008166:	6a 04                	push   $0x4
c0008168:	e8 d9 e7 ff ff       	call   c0006946 <v2l>
c000816d:	83 c4 10             	add    $0x10,%esp
c0008170:	89 c3                	mov    %eax,%ebx
c0008172:	83 ec 08             	sub    $0x8,%esp
c0008175:	ff 75 b8             	pushl  -0x48(%ebp)
c0008178:	ff 75 d8             	pushl  -0x28(%ebp)
c000817b:	e8 c6 e7 ff ff       	call   c0006946 <v2l>
c0008180:	83 c4 10             	add    $0x10,%esp
c0008183:	83 ec 04             	sub    $0x4,%esp
c0008186:	ff 75 bc             	pushl  -0x44(%ebp)
c0008189:	53                   	push   %ebx
c000818a:	50                   	push   %eax
c000818b:	e8 d2 17 00 00       	call   c0009962 <Memcpy>
c0008190:	83 c4 10             	add    $0x10,%esp
c0008193:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008196:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0008199:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000819c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000819f:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c00081a5:	81 c2 b8 79 01 c0    	add    $0xc00179b8,%edx
c00081ab:	89 02                	mov    %eax,(%edx)
c00081ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00081b0:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00081b3:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c00081b9:	81 c2 b4 79 01 c0    	add    $0xc00179b4,%edx
c00081bf:	89 02                	mov    %eax,(%edx)
c00081c1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00081c4:	8b 40 18             	mov    0x18(%eax),%eax
c00081c7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00081ca:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c00081d0:	81 c2 bc 79 01 c0    	add    $0xc00179bc,%edx
c00081d6:	89 02                	mov    %eax,(%edx)
c00081d8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00081db:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00081de:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c00081e4:	81 c2 c8 79 01 c0    	add    $0xc00179c8,%edx
c00081ea:	89 02                	mov    %eax,(%edx)
c00081ec:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00081ef:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00081f5:	05 70 79 01 c0       	add    $0xc0017970,%eax
c00081fa:	c7 00 1a 00 00 00    	movl   $0x1a,(%eax)
c0008200:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c0008207:	00 00 00 
c000820a:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0008211:	00 00 00 
c0008214:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c000821b:	00 00 00 
c000821e:	83 ec 04             	sub    $0x4,%esp
c0008221:	ff 75 d8             	pushl  -0x28(%ebp)
c0008224:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c000822a:	50                   	push   %eax
c000822b:	6a 01                	push   $0x1
c000822d:	e8 99 b5 ff ff       	call   c00037cb <send_rec>
c0008232:	83 c4 10             	add    $0x10,%esp
c0008235:	90                   	nop
c0008236:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0008239:	5b                   	pop    %ebx
c000823a:	5e                   	pop    %esi
c000823b:	5d                   	pop    %ebp
c000823c:	c3                   	ret    

c000823d <do_fork>:
c000823d:	55                   	push   %ebp
c000823e:	89 e5                	mov    %esp,%ebp
c0008240:	57                   	push   %edi
c0008241:	56                   	push   %esi
c0008242:	53                   	push   %ebx
c0008243:	81 ec ac 00 00 00    	sub    $0xac,%esp
c0008249:	c7 45 e4 d0 79 01 c0 	movl   $0xc00179d0,-0x1c(%ebp)
c0008250:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008257:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
c000825e:	eb 1e                	jmp    c000827e <do_fork+0x41>
c0008260:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008263:	0f b6 40 48          	movzbl 0x48(%eax),%eax
c0008267:	3c ff                	cmp    $0xff,%al
c0008269:	75 08                	jne    c0008273 <do_fork+0x36>
c000826b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000826e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008271:	eb 11                	jmp    c0008284 <do_fork+0x47>
c0008273:	81 45 e4 b0 00 00 00 	addl   $0xb0,-0x1c(%ebp)
c000827a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c000827e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0008282:	7e dc                	jle    c0008260 <do_fork+0x23>
c0008284:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0008288:	7f 19                	jg     c00082a3 <do_fork+0x66>
c000828a:	6a 26                	push   $0x26
c000828c:	68 14 99 00 c0       	push   $0xc0009914
c0008291:	68 14 99 00 c0       	push   $0xc0009914
c0008296:	68 24 99 00 c0       	push   $0xc0009924
c000829b:	e8 87 ad ff ff       	call   c0003027 <assertion_failure>
c00082a0:	83 c4 10             	add    $0x10,%esp
c00082a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00082a6:	8b 00                	mov    (%eax),%eax
c00082a8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00082ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082ae:	0f b7 40 04          	movzwl 0x4(%eax),%eax
c00082b2:	0f b7 c0             	movzwl %ax,%eax
c00082b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00082b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082bb:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00082be:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
c00082c4:	8d 8a 20 79 01 c0    	lea    -0x3ffe86e0(%edx),%ecx
c00082ca:	89 c2                	mov    %eax,%edx
c00082cc:	89 cb                	mov    %ecx,%ebx
c00082ce:	b8 2c 00 00 00       	mov    $0x2c,%eax
c00082d3:	89 d7                	mov    %edx,%edi
c00082d5:	89 de                	mov    %ebx,%esi
c00082d7:	89 c1                	mov    %eax,%ecx
c00082d9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00082db:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00082de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082e1:	89 50 18             	mov    %edx,0x18(%eax)
c00082e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00082e7:	89 c2                	mov    %eax,%edx
c00082e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082ec:	66 89 50 04          	mov    %dx,0x4(%eax)
c00082f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082f3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00082f6:	89 50 64             	mov    %edx,0x64(%eax)
c00082f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082fc:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0008302:	05 20 79 01 c0       	add    $0xc0017920,%eax
c0008307:	83 c0 06             	add    $0x6,%eax
c000830a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000830d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0008310:	0f b6 40 07          	movzbl 0x7(%eax),%eax
c0008314:	0f b6 c0             	movzbl %al,%eax
c0008317:	c1 e0 18             	shl    $0x18,%eax
c000831a:	89 c2                	mov    %eax,%edx
c000831c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000831f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0008323:	0f b6 c0             	movzbl %al,%eax
c0008326:	c1 e0 10             	shl    $0x10,%eax
c0008329:	01 c2                	add    %eax,%edx
c000832b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000832e:	0f b7 40 02          	movzwl 0x2(%eax),%eax
c0008332:	0f b7 c0             	movzwl %ax,%eax
c0008335:	01 d0                	add    %edx,%eax
c0008337:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000833a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000833d:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0008341:	0f b6 c0             	movzbl %al,%eax
c0008344:	25 00 00 0f 00       	and    $0xf0000,%eax
c0008349:	89 c2                	mov    %eax,%edx
c000834b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000834e:	0f b7 00             	movzwl (%eax),%eax
c0008351:	0f b7 c0             	movzwl %ax,%eax
c0008354:	01 d0                	add    %edx,%eax
c0008356:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008359:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000835c:	83 c0 01             	add    $0x1,%eax
c000835f:	c1 e0 0c             	shl    $0xc,%eax
c0008362:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0008365:	83 ec 08             	sub    $0x8,%esp
c0008368:	ff 75 c4             	pushl  -0x3c(%ebp)
c000836b:	ff 75 e0             	pushl  -0x20(%ebp)
c000836e:	e8 67 fb ff ff       	call   c0007eda <alloc_mem>
c0008373:	83 c4 10             	add    $0x10,%esp
c0008376:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0008379:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000837c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000837f:	83 ec 04             	sub    $0x4,%esp
c0008382:	ff 75 c4             	pushl  -0x3c(%ebp)
c0008385:	52                   	push   %edx
c0008386:	50                   	push   %eax
c0008387:	e8 d6 15 00 00       	call   c0009962 <Memcpy>
c000838c:	83 c4 10             	add    $0x10,%esp
c000838f:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0008396:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
c000839d:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00083a0:	0f b7 c8             	movzwl %ax,%ecx
c00083a3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00083a6:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00083a9:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c00083ac:	69 db b0 00 00 00    	imul   $0xb0,%ebx,%ebx
c00083b2:	81 c3 20 79 01 c0    	add    $0xc0017920,%ebx
c00083b8:	83 c3 06             	add    $0x6,%ebx
c00083bb:	51                   	push   %ecx
c00083bc:	52                   	push   %edx
c00083bd:	50                   	push   %eax
c00083be:	53                   	push   %ebx
c00083bf:	e8 7d e4 ff ff       	call   c0006841 <InitDescriptor>
c00083c4:	83 c4 10             	add    $0x10,%esp
c00083c7:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
c00083ce:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00083d1:	0f b7 c8             	movzwl %ax,%ecx
c00083d4:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00083d7:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00083da:	8b 5d e0             	mov    -0x20(%ebp),%ebx
c00083dd:	69 db b0 00 00 00    	imul   $0xb0,%ebx,%ebx
c00083e3:	83 c3 08             	add    $0x8,%ebx
c00083e6:	81 c3 20 79 01 c0    	add    $0xc0017920,%ebx
c00083ec:	83 c3 06             	add    $0x6,%ebx
c00083ef:	51                   	push   %ecx
c00083f0:	52                   	push   %edx
c00083f1:	50                   	push   %eax
c00083f2:	53                   	push   %ebx
c00083f3:	e8 49 e4 ff ff       	call   c0006841 <InitDescriptor>
c00083f8:	83 c4 10             	add    $0x10,%esp
c00083fb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00083fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0008401:	89 50 4c             	mov    %edx,0x4c(%eax)
c0008404:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
c000840b:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c0008412:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0008419:	83 ec 04             	sub    $0x4,%esp
c000841c:	ff 75 e0             	pushl  -0x20(%ebp)
c000841f:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
c0008425:	50                   	push   %eax
c0008426:	6a 01                	push   $0x1
c0008428:	e8 9e b3 ff ff       	call   c00037cb <send_rec>
c000842d:	83 c4 10             	add    $0x10,%esp
c0008430:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008433:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008436:	5b                   	pop    %ebx
c0008437:	5e                   	pop    %esi
c0008438:	5f                   	pop    %edi
c0008439:	5d                   	pop    %ebp
c000843a:	c3                   	ret    

c000843b <do_exit>:
c000843b:	55                   	push   %ebp
c000843c:	89 e5                	mov    %esp,%ebp
c000843e:	83 ec 18             	sub    $0x18,%esp
c0008441:	8b 45 08             	mov    0x8(%ebp),%eax
c0008444:	8b 00                	mov    (%eax),%eax
c0008446:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008449:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000844c:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0008452:	05 20 79 01 c0       	add    $0xc0017920,%eax
c0008457:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000845a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000845d:	8b 40 64             	mov    0x64(%eax),%eax
c0008460:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008463:	8b 45 08             	mov    0x8(%ebp),%eax
c0008466:	8b 40 44             	mov    0x44(%eax),%eax
c0008469:	89 c2                	mov    %eax,%edx
c000846b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000846e:	89 50 68             	mov    %edx,0x68(%eax)
c0008471:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008474:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000847a:	05 69 79 01 c0       	add    $0xc0017969,%eax
c000847f:	0f b6 00             	movzbl (%eax),%eax
c0008482:	3c 04                	cmp    $0x4,%al
c0008484:	75 21                	jne    c00084a7 <do_exit+0x6c>
c0008486:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008489:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c000848f:	05 69 79 01 c0       	add    $0xc0017969,%eax
c0008494:	c6 00 fb             	movb   $0xfb,(%eax)
c0008497:	83 ec 0c             	sub    $0xc,%esp
c000849a:	ff 75 ec             	pushl  -0x14(%ebp)
c000849d:	e8 56 01 00 00       	call   c00085f8 <cleanup>
c00084a2:	83 c4 10             	add    $0x10,%esp
c00084a5:	eb 07                	jmp    c00084ae <do_exit+0x73>
c00084a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00084aa:	c6 40 48 03          	movb   $0x3,0x48(%eax)
c00084ae:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00084b5:	eb 6e                	jmp    c0008525 <do_exit+0xea>
c00084b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00084ba:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00084c0:	05 84 79 01 c0       	add    $0xc0017984,%eax
c00084c5:	8b 00                	mov    (%eax),%eax
c00084c7:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00084ca:	75 55                	jne    c0008521 <do_exit+0xe6>
c00084cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00084cf:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00084d5:	05 84 79 01 c0       	add    $0xc0017984,%eax
c00084da:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00084e0:	0f b6 05 89 7d 01 c0 	movzbl 0xc0017d89,%eax
c00084e7:	3c 04                	cmp    $0x4,%al
c00084e9:	75 36                	jne    c0008521 <do_exit+0xe6>
c00084eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00084ee:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00084f4:	05 69 79 01 c0       	add    $0xc0017969,%eax
c00084f9:	0f b6 00             	movzbl (%eax),%eax
c00084fc:	3c 03                	cmp    $0x3,%al
c00084fe:	75 21                	jne    c0008521 <do_exit+0xe6>
c0008500:	c6 05 89 7d 01 c0 fb 	movb   $0xfb,0xc0017d89
c0008507:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000850a:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0008510:	05 20 79 01 c0       	add    $0xc0017920,%eax
c0008515:	83 ec 0c             	sub    $0xc,%esp
c0008518:	50                   	push   %eax
c0008519:	e8 da 00 00 00       	call   c00085f8 <cleanup>
c000851e:	83 c4 10             	add    $0x10,%esp
c0008521:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008525:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008529:	7e 8c                	jle    c00084b7 <do_exit+0x7c>
c000852b:	90                   	nop
c000852c:	c9                   	leave  
c000852d:	c3                   	ret    

c000852e <do_wait>:
c000852e:	55                   	push   %ebp
c000852f:	89 e5                	mov    %esp,%ebp
c0008531:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0008537:	8b 45 08             	mov    0x8(%ebp),%eax
c000853a:	8b 00                	mov    (%eax),%eax
c000853c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000853f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008546:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000854d:	eb 5f                	jmp    c00085ae <do_wait+0x80>
c000854f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008552:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0008558:	05 84 79 01 c0       	add    $0xc0017984,%eax
c000855d:	8b 00                	mov    (%eax),%eax
c000855f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0008562:	75 46                	jne    c00085aa <do_wait+0x7c>
c0008564:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008568:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000856b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0008571:	05 69 79 01 c0       	add    $0xc0017969,%eax
c0008576:	0f b6 00             	movzbl (%eax),%eax
c0008579:	3c 03                	cmp    $0x3,%al
c000857b:	75 2d                	jne    c00085aa <do_wait+0x7c>
c000857d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008580:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0008586:	05 69 79 01 c0       	add    $0xc0017969,%eax
c000858b:	c6 00 fb             	movb   $0xfb,(%eax)
c000858e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008591:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c0008597:	05 20 79 01 c0       	add    $0xc0017920,%eax
c000859c:	83 ec 0c             	sub    $0xc,%esp
c000859f:	50                   	push   %eax
c00085a0:	e8 53 00 00 00       	call   c00085f8 <cleanup>
c00085a5:	83 c4 10             	add    $0x10,%esp
c00085a8:	eb 4c                	jmp    c00085f6 <do_wait+0xc8>
c00085aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00085ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00085b2:	7e 9b                	jle    c000854f <do_wait+0x21>
c00085b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00085b8:	74 13                	je     c00085cd <do_wait+0x9f>
c00085ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00085bd:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
c00085c3:	05 69 79 01 c0       	add    $0xc0017969,%eax
c00085c8:	c6 00 04             	movb   $0x4,(%eax)
c00085cb:	eb 29                	jmp    c00085f6 <do_wait+0xc8>
c00085cd:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00085d4:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00085db:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00085e2:	83 ec 04             	sub    $0x4,%esp
c00085e5:	ff 75 ec             	pushl  -0x14(%ebp)
c00085e8:	8d 45 80             	lea    -0x80(%ebp),%eax
c00085eb:	50                   	push   %eax
c00085ec:	6a 01                	push   $0x1
c00085ee:	e8 d8 b1 ff ff       	call   c00037cb <send_rec>
c00085f3:	83 c4 10             	add    $0x10,%esp
c00085f6:	c9                   	leave  
c00085f7:	c3                   	ret    

c00085f8 <cleanup>:
c00085f8:	55                   	push   %ebp
c00085f9:	89 e5                	mov    %esp,%ebp
c00085fb:	83 ec 78             	sub    $0x78,%esp
c00085fe:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0008605:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c000860c:	8b 45 08             	mov    0x8(%ebp),%eax
c000860f:	8b 40 64             	mov    0x64(%eax),%eax
c0008612:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008615:	8b 45 08             	mov    0x8(%ebp),%eax
c0008618:	8b 40 68             	mov    0x68(%eax),%eax
c000861b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000861e:	8b 45 08             	mov    0x8(%ebp),%eax
c0008621:	8b 40 64             	mov    0x64(%eax),%eax
c0008624:	83 ec 04             	sub    $0x4,%esp
c0008627:	50                   	push   %eax
c0008628:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000862b:	50                   	push   %eax
c000862c:	6a 01                	push   $0x1
c000862e:	e8 98 b1 ff ff       	call   c00037cb <send_rec>
c0008633:	83 c4 10             	add    $0x10,%esp
c0008636:	8b 45 08             	mov    0x8(%ebp),%eax
c0008639:	c6 40 48 ff          	movb   $0xff,0x48(%eax)
c000863d:	90                   	nop
c000863e:	c9                   	leave  
c000863f:	c3                   	ret    

c0008640 <test_bit_val>:
c0008640:	55                   	push   %ebp
c0008641:	89 e5                	mov    %esp,%ebp
c0008643:	53                   	push   %ebx
c0008644:	83 ec 10             	sub    $0x10,%esp
c0008647:	8b 45 0c             	mov    0xc(%ebp),%eax
c000864a:	8d 50 07             	lea    0x7(%eax),%edx
c000864d:	85 c0                	test   %eax,%eax
c000864f:	0f 48 c2             	cmovs  %edx,%eax
c0008652:	c1 f8 03             	sar    $0x3,%eax
c0008655:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008658:	8b 45 0c             	mov    0xc(%ebp),%eax
c000865b:	99                   	cltd   
c000865c:	c1 ea 1d             	shr    $0x1d,%edx
c000865f:	01 d0                	add    %edx,%eax
c0008661:	83 e0 07             	and    $0x7,%eax
c0008664:	29 d0                	sub    %edx,%eax
c0008666:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008669:	8b 45 08             	mov    0x8(%ebp),%eax
c000866c:	8b 10                	mov    (%eax),%edx
c000866e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008671:	01 d0                	add    %edx,%eax
c0008673:	0f b6 00             	movzbl (%eax),%eax
c0008676:	88 45 f3             	mov    %al,-0xd(%ebp)
c0008679:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c000867d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008680:	bb 01 00 00 00       	mov    $0x1,%ebx
c0008685:	89 c1                	mov    %eax,%ecx
c0008687:	d3 e3                	shl    %cl,%ebx
c0008689:	89 d8                	mov    %ebx,%eax
c000868b:	21 c2                	and    %eax,%edx
c000868d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008690:	89 c1                	mov    %eax,%ecx
c0008692:	d3 fa                	sar    %cl,%edx
c0008694:	89 d0                	mov    %edx,%eax
c0008696:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008699:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000869d:	0f 9f c0             	setg   %al
c00086a0:	0f b6 c0             	movzbl %al,%eax
c00086a3:	83 c4 10             	add    $0x10,%esp
c00086a6:	5b                   	pop    %ebx
c00086a7:	5d                   	pop    %ebp
c00086a8:	c3                   	ret    

c00086a9 <set_bit_val>:
c00086a9:	55                   	push   %ebp
c00086aa:	89 e5                	mov    %esp,%ebp
c00086ac:	83 ec 10             	sub    $0x10,%esp
c00086af:	8b 45 0c             	mov    0xc(%ebp),%eax
c00086b2:	8d 50 07             	lea    0x7(%eax),%edx
c00086b5:	85 c0                	test   %eax,%eax
c00086b7:	0f 48 c2             	cmovs  %edx,%eax
c00086ba:	c1 f8 03             	sar    $0x3,%eax
c00086bd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00086c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00086c3:	99                   	cltd   
c00086c4:	c1 ea 1d             	shr    $0x1d,%edx
c00086c7:	01 d0                	add    %edx,%eax
c00086c9:	83 e0 07             	and    $0x7,%eax
c00086cc:	29 d0                	sub    %edx,%eax
c00086ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00086d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00086d4:	8b 10                	mov    (%eax),%edx
c00086d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00086d9:	01 d0                	add    %edx,%eax
c00086db:	0f b6 00             	movzbl (%eax),%eax
c00086de:	88 45 ff             	mov    %al,-0x1(%ebp)
c00086e1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00086e5:	7e 13                	jle    c00086fa <set_bit_val+0x51>
c00086e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00086ea:	ba 01 00 00 00       	mov    $0x1,%edx
c00086ef:	89 c1                	mov    %eax,%ecx
c00086f1:	d3 e2                	shl    %cl,%edx
c00086f3:	89 d0                	mov    %edx,%eax
c00086f5:	08 45 ff             	or     %al,-0x1(%ebp)
c00086f8:	eb 13                	jmp    c000870d <set_bit_val+0x64>
c00086fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00086fd:	ba 01 00 00 00       	mov    $0x1,%edx
c0008702:	89 c1                	mov    %eax,%ecx
c0008704:	d3 e2                	shl    %cl,%edx
c0008706:	89 d0                	mov    %edx,%eax
c0008708:	f7 d0                	not    %eax
c000870a:	20 45 ff             	and    %al,-0x1(%ebp)
c000870d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008710:	8b 10                	mov    (%eax),%edx
c0008712:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008715:	01 c2                	add    %eax,%edx
c0008717:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c000871b:	88 02                	mov    %al,(%edx)
c000871d:	b8 01 00 00 00       	mov    $0x1,%eax
c0008722:	c9                   	leave  
c0008723:	c3                   	ret    

c0008724 <set_bits>:
c0008724:	55                   	push   %ebp
c0008725:	89 e5                	mov    %esp,%ebp
c0008727:	83 ec 10             	sub    $0x10,%esp
c000872a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008731:	eb 1c                	jmp    c000874f <set_bits+0x2b>
c0008733:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008736:	8d 50 01             	lea    0x1(%eax),%edx
c0008739:	89 55 0c             	mov    %edx,0xc(%ebp)
c000873c:	ff 75 10             	pushl  0x10(%ebp)
c000873f:	50                   	push   %eax
c0008740:	ff 75 08             	pushl  0x8(%ebp)
c0008743:	e8 61 ff ff ff       	call   c00086a9 <set_bit_val>
c0008748:	83 c4 0c             	add    $0xc,%esp
c000874b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000874f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008752:	3b 45 14             	cmp    0x14(%ebp),%eax
c0008755:	7c dc                	jl     c0008733 <set_bits+0xf>
c0008757:	b8 01 00 00 00       	mov    $0x1,%eax
c000875c:	c9                   	leave  
c000875d:	c3                   	ret    

c000875e <get_first_free_bit>:
c000875e:	55                   	push   %ebp
c000875f:	89 e5                	mov    %esp,%ebp
c0008761:	83 ec 10             	sub    $0x10,%esp
c0008764:	8b 45 08             	mov    0x8(%ebp),%eax
c0008767:	8b 40 04             	mov    0x4(%eax),%eax
c000876a:	c1 e0 03             	shl    $0x3,%eax
c000876d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008770:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008773:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008776:	eb 1b                	jmp    c0008793 <get_first_free_bit+0x35>
c0008778:	ff 75 fc             	pushl  -0x4(%ebp)
c000877b:	ff 75 08             	pushl  0x8(%ebp)
c000877e:	e8 bd fe ff ff       	call   c0008640 <test_bit_val>
c0008783:	83 c4 08             	add    $0x8,%esp
c0008786:	85 c0                	test   %eax,%eax
c0008788:	75 05                	jne    c000878f <get_first_free_bit+0x31>
c000878a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000878d:	eb 11                	jmp    c00087a0 <get_first_free_bit+0x42>
c000878f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008793:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008796:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0008799:	7c dd                	jl     c0008778 <get_first_free_bit+0x1a>
c000879b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00087a0:	c9                   	leave  
c00087a1:	c3                   	ret    

c00087a2 <get_bits>:
c00087a2:	55                   	push   %ebp
c00087a3:	89 e5                	mov    %esp,%ebp
c00087a5:	83 ec 20             	sub    $0x20,%esp
c00087a8:	c7 45 f0 02 01 00 00 	movl   $0x102,-0x10(%ebp)
c00087af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00087b6:	ff 75 f0             	pushl  -0x10(%ebp)
c00087b9:	ff 75 08             	pushl  0x8(%ebp)
c00087bc:	e8 9d ff ff ff       	call   c000875e <get_first_free_bit>
c00087c1:	83 c4 08             	add    $0x8,%esp
c00087c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00087c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00087ca:	8b 40 04             	mov    0x4(%eax),%eax
c00087cd:	c1 e0 03             	shl    $0x3,%eax
c00087d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00087d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00087d6:	83 e8 01             	sub    $0x1,%eax
c00087d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00087dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087df:	83 c0 01             	add    $0x1,%eax
c00087e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00087e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00087eb:	eb 58                	jmp    c0008845 <get_bits+0xa3>
c00087ed:	ff 75 f8             	pushl  -0x8(%ebp)
c00087f0:	ff 75 08             	pushl  0x8(%ebp)
c00087f3:	e8 48 fe ff ff       	call   c0008640 <test_bit_val>
c00087f8:	83 c4 08             	add    $0x8,%esp
c00087fb:	85 c0                	test   %eax,%eax
c00087fd:	75 0a                	jne    c0008809 <get_bits+0x67>
c00087ff:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008803:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008807:	eb 2b                	jmp    c0008834 <get_bits+0x92>
c0008809:	6a 00                	push   $0x0
c000880b:	ff 75 08             	pushl  0x8(%ebp)
c000880e:	e8 4b ff ff ff       	call   c000875e <get_first_free_bit>
c0008813:	83 c4 08             	add    $0x8,%esp
c0008816:	83 c0 01             	add    $0x1,%eax
c0008819:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000881c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000881f:	83 c0 01             	add    $0x1,%eax
c0008822:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008825:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008828:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000882b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000882e:	83 e8 01             	sub    $0x1,%eax
c0008831:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008834:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008837:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c000883a:	7c 09                	jl     c0008845 <get_bits+0xa3>
c000883c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0008843:	eb 0d                	jmp    c0008852 <get_bits+0xb0>
c0008845:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008848:	8d 50 ff             	lea    -0x1(%eax),%edx
c000884b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c000884e:	85 c0                	test   %eax,%eax
c0008850:	7f 9b                	jg     c00087ed <get_bits+0x4b>
c0008852:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008855:	2b 45 0c             	sub    0xc(%ebp),%eax
c0008858:	83 c0 01             	add    $0x1,%eax
c000885b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000885e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008861:	c9                   	leave  
c0008862:	c3                   	ret    

c0008863 <get_a_page2>:
c0008863:	55                   	push   %ebp
c0008864:	89 e5                	mov    %esp,%ebp
c0008866:	83 ec 18             	sub    $0x18,%esp
c0008869:	83 ec 0c             	sub    $0xc,%esp
c000886c:	ff 75 0c             	pushl  0xc(%ebp)
c000886f:	e8 1e 00 00 00       	call   c0008892 <get_a_page>
c0008874:	83 c4 10             	add    $0x10,%esp
c0008877:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000887a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000887d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008880:	83 ec 08             	sub    $0x8,%esp
c0008883:	52                   	push   %edx
c0008884:	50                   	push   %eax
c0008885:	e8 6f 01 00 00       	call   c00089f9 <add_map_entry>
c000888a:	83 c4 10             	add    $0x10,%esp
c000888d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008890:	c9                   	leave  
c0008891:	c3                   	ret    

c0008892 <get_a_page>:
c0008892:	55                   	push   %ebp
c0008893:	89 e5                	mov    %esp,%ebp
c0008895:	83 ec 20             	sub    $0x20,%esp
c0008898:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000889c:	75 22                	jne    c00088c0 <get_a_page+0x2e>
c000889e:	a1 ec ed 00 c0       	mov    0xc000edec,%eax
c00088a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00088a6:	a1 f0 ed 00 c0       	mov    0xc000edf0,%eax
c00088ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00088ae:	a1 f4 ed 00 c0       	mov    0xc000edf4,%eax
c00088b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00088b6:	a1 f8 ed 00 c0       	mov    0xc000edf8,%eax
c00088bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00088be:	eb 20                	jmp    c00088e0 <get_a_page+0x4e>
c00088c0:	a1 24 f6 00 c0       	mov    0xc000f624,%eax
c00088c5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00088c8:	a1 28 f6 00 c0       	mov    0xc000f628,%eax
c00088cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00088d0:	a1 2c f6 00 c0       	mov    0xc000f62c,%eax
c00088d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00088d8:	a1 30 f6 00 c0       	mov    0xc000f630,%eax
c00088dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00088e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00088e3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00088e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00088e9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00088ec:	6a 01                	push   $0x1
c00088ee:	8d 45 e0             	lea    -0x20(%ebp),%eax
c00088f1:	50                   	push   %eax
c00088f2:	e8 ab fe ff ff       	call   c00087a2 <get_bits>
c00088f7:	83 c4 08             	add    $0x8,%esp
c00088fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00088fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008900:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0008903:	c1 e2 0c             	shl    $0xc,%edx
c0008906:	01 d0                	add    %edx,%eax
c0008908:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000890b:	6a 01                	push   $0x1
c000890d:	ff 75 fc             	pushl  -0x4(%ebp)
c0008910:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0008913:	50                   	push   %eax
c0008914:	e8 90 fd ff ff       	call   c00086a9 <set_bit_val>
c0008919:	83 c4 0c             	add    $0xc,%esp
c000891c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000891f:	c9                   	leave  
c0008920:	c3                   	ret    

c0008921 <get_virtual_address>:
c0008921:	55                   	push   %ebp
c0008922:	89 e5                	mov    %esp,%ebp
c0008924:	83 ec 28             	sub    $0x28,%esp
c0008927:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000892b:	75 18                	jne    c0008945 <get_virtual_address+0x24>
c000892d:	a1 90 ce 00 c0       	mov    0xc000ce90,%eax
c0008932:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008935:	a1 94 ce 00 c0       	mov    0xc000ce94,%eax
c000893a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000893d:	a1 98 ce 00 c0       	mov    0xc000ce98,%eax
c0008942:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008945:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008948:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000894b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000894e:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0008951:	8b 45 08             	mov    0x8(%ebp),%eax
c0008954:	50                   	push   %eax
c0008955:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0008958:	50                   	push   %eax
c0008959:	e8 44 fe ff ff       	call   c00087a2 <get_bits>
c000895e:	83 c4 08             	add    $0x8,%esp
c0008961:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008964:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008967:	8b 55 08             	mov    0x8(%ebp),%edx
c000896a:	81 c2 ff ff 0f 00    	add    $0xfffff,%edx
c0008970:	c1 e2 0c             	shl    $0xc,%edx
c0008973:	01 d0                	add    %edx,%eax
c0008975:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008978:	81 7d f0 a0 3e 20 c0 	cmpl   $0xc0203ea0,-0x10(%ebp)
c000897f:	75 12                	jne    c0008993 <get_virtual_address+0x72>
c0008981:	83 ec 0c             	sub    $0xc,%esp
c0008984:	68 4b 99 00 c0       	push   $0xc000994b
c0008989:	e8 fe 86 ff ff       	call   c000108c <disp_str>
c000898e:	83 c4 10             	add    $0x10,%esp
c0008991:	eb fe                	jmp    c0008991 <get_virtual_address+0x70>
c0008993:	8b 45 08             	mov    0x8(%ebp),%eax
c0008996:	50                   	push   %eax
c0008997:	6a 01                	push   $0x1
c0008999:	ff 75 f4             	pushl  -0xc(%ebp)
c000899c:	8d 45 dc             	lea    -0x24(%ebp),%eax
c000899f:	50                   	push   %eax
c00089a0:	e8 7f fd ff ff       	call   c0008724 <set_bits>
c00089a5:	83 c4 10             	add    $0x10,%esp
c00089a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00089ab:	c9                   	leave  
c00089ac:	c3                   	ret    

c00089ad <ptr_pte>:
c00089ad:	55                   	push   %ebp
c00089ae:	89 e5                	mov    %esp,%ebp
c00089b0:	83 ec 10             	sub    $0x10,%esp
c00089b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00089b6:	c1 e8 0a             	shr    $0xa,%eax
c00089b9:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c00089be:	89 c2                	mov    %eax,%edx
c00089c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00089c3:	c1 e8 0c             	shr    $0xc,%eax
c00089c6:	25 ff 03 00 00       	and    $0x3ff,%eax
c00089cb:	c1 e0 02             	shl    $0x2,%eax
c00089ce:	01 d0                	add    %edx,%eax
c00089d0:	2d 00 00 40 00       	sub    $0x400000,%eax
c00089d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00089d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00089db:	c9                   	leave  
c00089dc:	c3                   	ret    

c00089dd <ptr_pde>:
c00089dd:	55                   	push   %ebp
c00089de:	89 e5                	mov    %esp,%ebp
c00089e0:	83 ec 10             	sub    $0x10,%esp
c00089e3:	8b 45 08             	mov    0x8(%ebp),%eax
c00089e6:	c1 e8 16             	shr    $0x16,%eax
c00089e9:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c00089ee:	c1 e0 02             	shl    $0x2,%eax
c00089f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00089f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00089f7:	c9                   	leave  
c00089f8:	c3                   	ret    

c00089f9 <add_map_entry>:
c00089f9:	55                   	push   %ebp
c00089fa:	89 e5                	mov    %esp,%ebp
c00089fc:	83 ec 18             	sub    $0x18,%esp
c00089ff:	ff 75 08             	pushl  0x8(%ebp)
c0008a02:	e8 d6 ff ff ff       	call   c00089dd <ptr_pde>
c0008a07:	83 c4 04             	add    $0x4,%esp
c0008a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008a0d:	ff 75 08             	pushl  0x8(%ebp)
c0008a10:	e8 98 ff ff ff       	call   c00089ad <ptr_pte>
c0008a15:	83 c4 04             	add    $0x4,%esp
c0008a18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a1e:	8b 00                	mov    (%eax),%eax
c0008a20:	83 e0 01             	and    $0x1,%eax
c0008a23:	85 c0                	test   %eax,%eax
c0008a25:	74 1b                	je     c0008a42 <add_map_entry+0x49>
c0008a27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008a2a:	8b 00                	mov    (%eax),%eax
c0008a2c:	83 e0 01             	and    $0x1,%eax
c0008a2f:	85 c0                	test   %eax,%eax
c0008a31:	75 51                	jne    c0008a84 <add_map_entry+0x8b>
c0008a33:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008a36:	83 c8 07             	or     $0x7,%eax
c0008a39:	89 c2                	mov    %eax,%edx
c0008a3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008a3e:	89 10                	mov    %edx,(%eax)
c0008a40:	eb 42                	jmp    c0008a84 <add_map_entry+0x8b>
c0008a42:	6a 00                	push   $0x0
c0008a44:	e8 49 fe ff ff       	call   c0008892 <get_a_page>
c0008a49:	83 c4 04             	add    $0x4,%esp
c0008a4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a52:	83 c8 07             	or     $0x7,%eax
c0008a55:	89 c2                	mov    %eax,%edx
c0008a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a5a:	89 10                	mov    %edx,(%eax)
c0008a5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008a5f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0008a64:	83 ec 04             	sub    $0x4,%esp
c0008a67:	68 00 10 00 00       	push   $0x1000
c0008a6c:	6a 00                	push   $0x0
c0008a6e:	50                   	push   %eax
c0008a6f:	e8 1c 0f 00 00       	call   c0009990 <Memset>
c0008a74:	83 c4 10             	add    $0x10,%esp
c0008a77:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008a7a:	83 c8 07             	or     $0x7,%eax
c0008a7d:	89 c2                	mov    %eax,%edx
c0008a7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008a82:	89 10                	mov    %edx,(%eax)
c0008a84:	90                   	nop
c0008a85:	c9                   	leave  
c0008a86:	c3                   	ret    

c0008a87 <get_physical_address>:
c0008a87:	55                   	push   %ebp
c0008a88:	89 e5                	mov    %esp,%ebp
c0008a8a:	83 ec 10             	sub    $0x10,%esp
c0008a8d:	ff 75 08             	pushl  0x8(%ebp)
c0008a90:	e8 18 ff ff ff       	call   c00089ad <ptr_pte>
c0008a95:	83 c4 04             	add    $0x4,%esp
c0008a98:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008a9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008a9e:	8b 00                	mov    (%eax),%eax
c0008aa0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0008aa5:	89 c2                	mov    %eax,%edx
c0008aa7:	8b 45 08             	mov    0x8(%ebp),%eax
c0008aaa:	25 ff 0f 00 00       	and    $0xfff,%eax
c0008aaf:	09 d0                	or     %edx,%eax
c0008ab1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0008ab4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0008ab7:	c9                   	leave  
c0008ab8:	c3                   	ret    

c0008ab9 <alloc_memory>:
c0008ab9:	55                   	push   %ebp
c0008aba:	89 e5                	mov    %esp,%ebp
c0008abc:	83 ec 18             	sub    $0x18,%esp
c0008abf:	83 ec 08             	sub    $0x8,%esp
c0008ac2:	ff 75 0c             	pushl  0xc(%ebp)
c0008ac5:	ff 75 08             	pushl  0x8(%ebp)
c0008ac8:	e8 54 fe ff ff       	call   c0008921 <get_virtual_address>
c0008acd:	83 c4 10             	add    $0x10,%esp
c0008ad0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ad3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ad6:	2d 00 10 00 00       	sub    $0x1000,%eax
c0008adb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ade:	eb 29                	jmp    c0008b09 <alloc_memory+0x50>
c0008ae0:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0008ae7:	83 ec 0c             	sub    $0xc,%esp
c0008aea:	ff 75 0c             	pushl  0xc(%ebp)
c0008aed:	e8 a0 fd ff ff       	call   c0008892 <get_a_page>
c0008af2:	83 c4 10             	add    $0x10,%esp
c0008af5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008af8:	83 ec 08             	sub    $0x8,%esp
c0008afb:	ff 75 ec             	pushl  -0x14(%ebp)
c0008afe:	ff 75 f4             	pushl  -0xc(%ebp)
c0008b01:	e8 f3 fe ff ff       	call   c00089f9 <add_map_entry>
c0008b06:	83 c4 10             	add    $0x10,%esp
c0008b09:	8b 45 08             	mov    0x8(%ebp),%eax
c0008b0c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0008b0f:	89 55 08             	mov    %edx,0x8(%ebp)
c0008b12:	85 c0                	test   %eax,%eax
c0008b14:	75 ca                	jne    c0008ae0 <alloc_memory+0x27>
c0008b16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008b19:	c9                   	leave  
c0008b1a:	c3                   	ret    

c0008b1b <init_memory2>:
c0008b1b:	55                   	push   %ebp
c0008b1c:	89 e5                	mov    %esp,%ebp
c0008b1e:	83 ec 38             	sub    $0x38,%esp
c0008b21:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0008b28:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0008b2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008b32:	a3 f4 ed 00 c0       	mov    %eax,0xc000edf4
c0008b37:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0008b3a:	a1 f4 ed 00 c0       	mov    0xc000edf4,%eax
c0008b3f:	29 c2                	sub    %eax,%edx
c0008b41:	89 d0                	mov    %edx,%eax
c0008b43:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008b49:	89 c2                	mov    %eax,%edx
c0008b4b:	c1 ea 1f             	shr    $0x1f,%edx
c0008b4e:	01 d0                	add    %edx,%eax
c0008b50:	d1 f8                	sar    %eax
c0008b52:	a3 f8 ed 00 c0       	mov    %eax,0xc000edf8
c0008b57:	a1 f8 ed 00 c0       	mov    0xc000edf8,%eax
c0008b5c:	83 ec 0c             	sub    $0xc,%esp
c0008b5f:	50                   	push   %eax
c0008b60:	e8 e1 8a ff ff       	call   c0001646 <disp_int>
c0008b65:	83 c4 10             	add    $0x10,%esp
c0008b68:	a1 f8 ed 00 c0       	mov    0xc000edf8,%eax
c0008b6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0008b70:	29 c2                	sub    %eax,%edx
c0008b72:	89 d0                	mov    %edx,%eax
c0008b74:	a3 30 f6 00 c0       	mov    %eax,0xc000f630
c0008b79:	83 ec 0c             	sub    $0xc,%esp
c0008b7c:	68 60 99 00 c0       	push   $0xc0009960
c0008b81:	e8 06 85 ff ff       	call   c000108c <disp_str>
c0008b86:	83 c4 10             	add    $0x10,%esp
c0008b89:	a1 30 f6 00 c0       	mov    0xc000f630,%eax
c0008b8e:	83 ec 0c             	sub    $0xc,%esp
c0008b91:	50                   	push   %eax
c0008b92:	e8 af 8a ff ff       	call   c0001646 <disp_int>
c0008b97:	83 c4 10             	add    $0x10,%esp
c0008b9a:	83 ec 0c             	sub    $0xc,%esp
c0008b9d:	68 60 99 00 c0       	push   $0xc0009960
c0008ba2:	e8 e5 84 ff ff       	call   c000108c <disp_str>
c0008ba7:	83 c4 10             	add    $0x10,%esp
c0008baa:	a1 f8 ed 00 c0       	mov    0xc000edf8,%eax
c0008baf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0008bb4:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0008bba:	85 c0                	test   %eax,%eax
c0008bbc:	0f 48 c2             	cmovs  %edx,%eax
c0008bbf:	c1 f8 0c             	sar    $0xc,%eax
c0008bc2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008bc5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008bc8:	83 c0 07             	add    $0x7,%eax
c0008bcb:	8d 50 07             	lea    0x7(%eax),%edx
c0008bce:	85 c0                	test   %eax,%eax
c0008bd0:	0f 48 c2             	cmovs  %edx,%eax
c0008bd3:	c1 f8 03             	sar    $0x3,%eax
c0008bd6:	a3 f0 ed 00 c0       	mov    %eax,0xc000edf0
c0008bdb:	a1 f4 ed 00 c0       	mov    0xc000edf4,%eax
c0008be0:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0008be5:	a3 ec ed 00 c0       	mov    %eax,0xc000edec
c0008bea:	8b 15 f0 ed 00 c0    	mov    0xc000edf0,%edx
c0008bf0:	a1 ec ed 00 c0       	mov    0xc000edec,%eax
c0008bf5:	83 ec 04             	sub    $0x4,%esp
c0008bf8:	52                   	push   %edx
c0008bf9:	6a 00                	push   $0x0
c0008bfb:	50                   	push   %eax
c0008bfc:	e8 8f 0d 00 00       	call   c0009990 <Memset>
c0008c01:	83 c4 10             	add    $0x10,%esp
c0008c04:	a1 f0 ed 00 c0       	mov    0xc000edf0,%eax
c0008c09:	05 ff 0f 00 00       	add    $0xfff,%eax
c0008c0e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0008c14:	85 c0                	test   %eax,%eax
c0008c16:	0f 48 c2             	cmovs  %edx,%eax
c0008c19:	c1 f8 0c             	sar    $0xc,%eax
c0008c1c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008c1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008c22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008c25:	ff 75 e8             	pushl  -0x18(%ebp)
c0008c28:	6a 01                	push   $0x1
c0008c2a:	6a 00                	push   $0x0
c0008c2c:	68 ec ed 00 c0       	push   $0xc000edec
c0008c31:	e8 ee fa ff ff       	call   c0008724 <set_bits>
c0008c36:	83 c4 10             	add    $0x10,%esp
c0008c39:	a1 30 f6 00 c0       	mov    0xc000f630,%eax
c0008c3e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0008c43:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0008c49:	85 c0                	test   %eax,%eax
c0008c4b:	0f 48 c2             	cmovs  %edx,%eax
c0008c4e:	c1 f8 0c             	sar    $0xc,%eax
c0008c51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008c54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008c57:	83 c0 07             	add    $0x7,%eax
c0008c5a:	8d 50 07             	lea    0x7(%eax),%edx
c0008c5d:	85 c0                	test   %eax,%eax
c0008c5f:	0f 48 c2             	cmovs  %edx,%eax
c0008c62:	c1 f8 03             	sar    $0x3,%eax
c0008c65:	a3 28 f6 00 c0       	mov    %eax,0xc000f628
c0008c6a:	a1 f4 ed 00 c0       	mov    0xc000edf4,%eax
c0008c6f:	8b 15 f0 ed 00 c0    	mov    0xc000edf0,%edx
c0008c75:	01 d0                	add    %edx,%eax
c0008c77:	a3 24 f6 00 c0       	mov    %eax,0xc000f624
c0008c7c:	8b 15 28 f6 00 c0    	mov    0xc000f628,%edx
c0008c82:	a1 24 f6 00 c0       	mov    0xc000f624,%eax
c0008c87:	83 ec 04             	sub    $0x4,%esp
c0008c8a:	52                   	push   %edx
c0008c8b:	6a 00                	push   $0x0
c0008c8d:	50                   	push   %eax
c0008c8e:	e8 fd 0c 00 00       	call   c0009990 <Memset>
c0008c93:	83 c4 10             	add    $0x10,%esp
c0008c96:	a1 28 f6 00 c0       	mov    0xc000f628,%eax
c0008c9b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0008ca0:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0008ca6:	85 c0                	test   %eax,%eax
c0008ca8:	0f 48 c2             	cmovs  %edx,%eax
c0008cab:	c1 f8 0c             	sar    $0xc,%eax
c0008cae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008cb1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008cb4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008cb7:	ff 75 e8             	pushl  -0x18(%ebp)
c0008cba:	6a 01                	push   $0x1
c0008cbc:	ff 75 e0             	pushl  -0x20(%ebp)
c0008cbf:	68 ec ed 00 c0       	push   $0xc000edec
c0008cc4:	e8 5b fa ff ff       	call   c0008724 <set_bits>
c0008cc9:	83 c4 10             	add    $0x10,%esp
c0008ccc:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0008cd3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0008cd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008cd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008cdc:	83 c0 07             	add    $0x7,%eax
c0008cdf:	8d 50 07             	lea    0x7(%eax),%edx
c0008ce2:	85 c0                	test   %eax,%eax
c0008ce4:	0f 48 c2             	cmovs  %edx,%eax
c0008ce7:	c1 f8 03             	sar    $0x3,%eax
c0008cea:	a3 94 ce 00 c0       	mov    %eax,0xc000ce94
c0008cef:	a1 f4 ed 00 c0       	mov    0xc000edf4,%eax
c0008cf4:	8b 15 f0 ed 00 c0    	mov    0xc000edf0,%edx
c0008cfa:	01 c2                	add    %eax,%edx
c0008cfc:	a1 28 f6 00 c0       	mov    0xc000f628,%eax
c0008d01:	01 d0                	add    %edx,%eax
c0008d03:	a3 90 ce 00 c0       	mov    %eax,0xc000ce90
c0008d08:	8b 15 94 ce 00 c0    	mov    0xc000ce94,%edx
c0008d0e:	a1 90 ce 00 c0       	mov    0xc000ce90,%eax
c0008d13:	83 ec 04             	sub    $0x4,%esp
c0008d16:	52                   	push   %edx
c0008d17:	6a 00                	push   $0x0
c0008d19:	50                   	push   %eax
c0008d1a:	e8 71 0c 00 00       	call   c0009990 <Memset>
c0008d1f:	83 c4 10             	add    $0x10,%esp
c0008d22:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0008d25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008d28:	01 d0                	add    %edx,%eax
c0008d2a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008d2d:	a1 94 ce 00 c0       	mov    0xc000ce94,%eax
c0008d32:	05 ff 0f 00 00       	add    $0xfff,%eax
c0008d37:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0008d3d:	85 c0                	test   %eax,%eax
c0008d3f:	0f 48 c2             	cmovs  %edx,%eax
c0008d42:	c1 f8 0c             	sar    $0xc,%eax
c0008d45:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008d48:	ff 75 e8             	pushl  -0x18(%ebp)
c0008d4b:	6a 01                	push   $0x1
c0008d4d:	ff 75 e0             	pushl  -0x20(%ebp)
c0008d50:	68 ec ed 00 c0       	push   $0xc000edec
c0008d55:	e8 ca f9 ff ff       	call   c0008724 <set_bits>
c0008d5a:	83 c4 10             	add    $0x10,%esp
c0008d5d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008d60:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008d63:	01 d0                	add    %edx,%eax
c0008d65:	c1 e0 0c             	shl    $0xc,%eax
c0008d68:	a3 98 ce 00 c0       	mov    %eax,0xc000ce98
c0008d6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008d70:	83 c0 02             	add    $0x2,%eax
c0008d73:	c1 e0 0c             	shl    $0xc,%eax
c0008d76:	89 c2                	mov    %eax,%edx
c0008d78:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008d7b:	01 d0                	add    %edx,%eax
c0008d7d:	a3 98 ce 00 c0       	mov    %eax,0xc000ce98
c0008d82:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0008d89:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008d8c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008d8f:	90                   	nop
c0008d90:	c9                   	leave  
c0008d91:	c3                   	ret    

c0008d92 <init_memory>:
c0008d92:	55                   	push   %ebp
c0008d93:	89 e5                	mov    %esp,%ebp
c0008d95:	83 ec 38             	sub    $0x38,%esp
c0008d98:	c7 45 f4 00 a0 0f c0 	movl   $0xc00fa000,-0xc(%ebp)
c0008d9f:	c7 45 f0 00 00 20 c0 	movl   $0xc0200000,-0x10(%ebp)
c0008da6:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0008dad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008db0:	05 00 00 20 00       	add    $0x200000,%eax
c0008db5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008db8:	8b 45 08             	mov    0x8(%ebp),%eax
c0008dbb:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0008dbe:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0008dc4:	85 c0                	test   %eax,%eax
c0008dc6:	0f 48 c2             	cmovs  %edx,%eax
c0008dc9:	c1 f8 0c             	sar    $0xc,%eax
c0008dcc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008dcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008dd2:	89 c2                	mov    %eax,%edx
c0008dd4:	c1 ea 1f             	shr    $0x1f,%edx
c0008dd7:	01 d0                	add    %edx,%eax
c0008dd9:	d1 f8                	sar    %eax
c0008ddb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008dde:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008de1:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0008de4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008de7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008dea:	8d 50 07             	lea    0x7(%eax),%edx
c0008ded:	85 c0                	test   %eax,%eax
c0008def:	0f 48 c2             	cmovs  %edx,%eax
c0008df2:	c1 f8 03             	sar    $0x3,%eax
c0008df5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008df8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0008dfb:	8d 50 07             	lea    0x7(%eax),%edx
c0008dfe:	85 c0                	test   %eax,%eax
c0008e00:	0f 48 c2             	cmovs  %edx,%eax
c0008e03:	c1 f8 03             	sar    $0x3,%eax
c0008e06:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008e09:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0008e0c:	a3 f4 ed 00 c0       	mov    %eax,0xc000edf4
c0008e11:	a1 f4 ed 00 c0       	mov    0xc000edf4,%eax
c0008e16:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008e19:	c1 e2 0c             	shl    $0xc,%edx
c0008e1c:	01 d0                	add    %edx,%eax
c0008e1e:	a3 2c f6 00 c0       	mov    %eax,0xc000f62c
c0008e23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008e26:	a3 ec ed 00 c0       	mov    %eax,0xc000edec
c0008e2b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008e2e:	a3 f0 ed 00 c0       	mov    %eax,0xc000edf0
c0008e33:	a1 ec ed 00 c0       	mov    0xc000edec,%eax
c0008e38:	83 ec 04             	sub    $0x4,%esp
c0008e3b:	ff 75 d8             	pushl  -0x28(%ebp)
c0008e3e:	6a 00                	push   $0x0
c0008e40:	50                   	push   %eax
c0008e41:	e8 4a 0b 00 00       	call   c0009990 <Memset>
c0008e46:	83 c4 10             	add    $0x10,%esp
c0008e49:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0008e4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008e4f:	01 d0                	add    %edx,%eax
c0008e51:	a3 24 f6 00 c0       	mov    %eax,0xc000f624
c0008e56:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008e59:	a3 28 f6 00 c0       	mov    %eax,0xc000f628
c0008e5e:	a1 24 f6 00 c0       	mov    0xc000f624,%eax
c0008e63:	83 ec 04             	sub    $0x4,%esp
c0008e66:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008e69:	6a 00                	push   $0x0
c0008e6b:	50                   	push   %eax
c0008e6c:	e8 1f 0b 00 00       	call   c0009990 <Memset>
c0008e71:	83 c4 10             	add    $0x10,%esp
c0008e74:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008e77:	a3 94 ce 00 c0       	mov    %eax,0xc000ce94
c0008e7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0008e7f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008e82:	01 c2                	add    %eax,%edx
c0008e84:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0008e87:	01 d0                	add    %edx,%eax
c0008e89:	a3 90 ce 00 c0       	mov    %eax,0xc000ce90
c0008e8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e91:	a3 98 ce 00 c0       	mov    %eax,0xc000ce98
c0008e96:	a1 90 ce 00 c0       	mov    0xc000ce90,%eax
c0008e9b:	83 ec 04             	sub    $0x4,%esp
c0008e9e:	ff 75 d8             	pushl  -0x28(%ebp)
c0008ea1:	6a 00                	push   $0x0
c0008ea3:	50                   	push   %eax
c0008ea4:	e8 e7 0a 00 00       	call   c0009990 <Memset>
c0008ea9:	83 c4 10             	add    $0x10,%esp
c0008eac:	66 87 db             	xchg   %bx,%bx
c0008eaf:	90                   	nop
c0008eb0:	c9                   	leave  
c0008eb1:	c3                   	ret    
c0008eb2:	66 90                	xchg   %ax,%ax
c0008eb4:	66 90                	xchg   %ax,%ax
c0008eb6:	66 90                	xchg   %ax,%ax
c0008eb8:	66 90                	xchg   %ax,%ax
c0008eba:	66 90                	xchg   %ax,%ax
c0008ebc:	66 90                	xchg   %ax,%ax
c0008ebe:	66 90                	xchg   %ax,%ax

c0008ec0 <switch_to>:
c0008ec0:	56                   	push   %esi
c0008ec1:	57                   	push   %edi
c0008ec2:	53                   	push   %ebx
c0008ec3:	55                   	push   %ebp
c0008ec4:	89 e5                	mov    %esp,%ebp
c0008ec6:	8b 45 14             	mov    0x14(%ebp),%eax
c0008ec9:	89 c4                	mov    %eax,%esp
c0008ecb:	5d                   	pop    %ebp
c0008ecc:	5b                   	pop    %ebx
c0008ecd:	5f                   	pop    %edi
c0008ece:	5e                   	pop    %esi
c0008ecf:	c3                   	ret    
