	.file	"struct-demo.c"
# GNU C17 (GCC) version 8.3.1 20191121 (Red Hat 8.3.1-5) (x86_64-redhat-linux)
#	compiled by GNU C version 8.3.1 20191121 (Red Hat 8.3.1-5), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.0.2, isl version none
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultilib 32 struct-demo.c -m32 -mtune=generic
# -march=x86-64 -fverbose-asm
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcommon -fdelete-null-pointer-checks
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -ffp-int-builtin-inexact -ffunction-cse -fgcse-lm -fgnu-runtime
# -fgnu-unique -fident -finline-atomics -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-debug-strings
# -fpcc-struct-return -fpeephole -fplt -fprefetch-loop-arrays
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap-separate -fsigned-zeros
# -fsplit-ivs-in-unroller -fssa-backprop -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math -ftree-cselim
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m32 -m80387 -m96bit-long-double
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-red-zone -mno-sse4
# -mpush-args -msahf -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.section	.rodata
.LC0:
	.string	"\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx	#,
	.cfi_def_cfa 1, 0
	andl	$-16, %esp	#,
	pushl	-4(%ecx)	#
	pushl	%ebp	#
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp	#,
	pushl	%ecx	#
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$116, %esp	#,
# struct-demo.c:18: 	struct Node node2 = {"node2", 2, NULL};
	movl	$1701080942, -36(%ebp)	#, node2.name
	movl	$50, -32(%ebp)	#, node2.name
	movl	$0, -28(%ebp)	#, node2.name
	movl	$0, -24(%ebp)	#, node2.name
	movl	$0, -20(%ebp)	#, node2.name
	movl	$2, -16(%ebp)	#, node2.val
	movl	$0, -12(%ebp)	#, node2.next
# struct-demo.c:19: 	struct Node node1 = {"node1", 1, &node2};
	movl	$1701080942, -64(%ebp)	#, node1.name
	movl	$49, -60(%ebp)	#, node1.name
	movl	$0, -56(%ebp)	#, node1.name
	movl	$0, -52(%ebp)	#, node1.name
	movl	$0, -48(%ebp)	#, node1.name
	movl	$1, -44(%ebp)	#, node1.val
	leal	-36(%ebp), %eax	#, tmp89
	movl	%eax, -40(%ebp)	# tmp89, node1.next
# struct-demo.c:21: 	struct Node arr[2] = {node2, node1};	
	movl	-36(%ebp), %eax	# node2, tmp90
	movl	%eax, -120(%ebp)	# tmp90, arr
	movl	-32(%ebp), %eax	# node2, tmp91
	movl	%eax, -116(%ebp)	# tmp91, arr
	movl	-28(%ebp), %eax	# node2, tmp92
	movl	%eax, -112(%ebp)	# tmp92, arr
	movl	-24(%ebp), %eax	# node2, tmp93
	movl	%eax, -108(%ebp)	# tmp93, arr
	movl	-20(%ebp), %eax	# node2, tmp94
	movl	%eax, -104(%ebp)	# tmp94, arr
	movl	-16(%ebp), %eax	# node2, tmp95
	movl	%eax, -100(%ebp)	# tmp95, arr
	movl	-12(%ebp), %eax	# node2, tmp96
	movl	%eax, -96(%ebp)	# tmp96, arr
	movl	-64(%ebp), %eax	# node1, tmp97
	movl	%eax, -92(%ebp)	# tmp97, arr
	movl	-60(%ebp), %eax	# node1, tmp98
	movl	%eax, -88(%ebp)	# tmp98, arr
	movl	-56(%ebp), %eax	# node1, tmp99
	movl	%eax, -84(%ebp)	# tmp99, arr
	movl	-52(%ebp), %eax	# node1, tmp100
	movl	%eax, -80(%ebp)	# tmp100, arr
	movl	-48(%ebp), %eax	# node1, tmp101
	movl	%eax, -76(%ebp)	# tmp101, arr
	movl	-44(%ebp), %eax	# node1, tmp102
	movl	%eax, -72(%ebp)	# tmp102, arr
	movl	-40(%ebp), %eax	# node1, tmp103
	movl	%eax, -68(%ebp)	# tmp103, arr
# struct-demo.c:23: 	dump_node2(node1);
	subl	$4, %esp	#,
	pushl	-40(%ebp)	# node1
	pushl	-44(%ebp)	# node1
	pushl	-48(%ebp)	# node1
	pushl	-52(%ebp)	# node1
	pushl	-56(%ebp)	# node1
	pushl	-60(%ebp)	# node1
	pushl	-64(%ebp)	# node1
	call	dump_node2	#
	addl	$32, %esp	#,
# struct-demo.c:25: 	dump_node(&node1);
	subl	$12, %esp	#,
	leal	-64(%ebp), %eax	#, tmp104
	pushl	%eax	# tmp104
	call	dump_node	#
	addl	$16, %esp	#,
# struct-demo.c:26: 	dump_node(&node2);
	subl	$12, %esp	#,
	leal	-36(%ebp), %eax	#, tmp105
	pushl	%eax	# tmp105
	call	dump_node	#
	addl	$16, %esp	#,
# struct-demo.c:27: 	printf("\n\n");
	subl	$12, %esp	#,
	pushl	$.LC0	#
	call	puts	#
	addl	$16, %esp	#,
# struct-demo.c:28: 	traverse(&node1);	
	subl	$12, %esp	#,
	leal	-64(%ebp), %eax	#, tmp106
	pushl	%eax	# tmp106
	call	traverse	#
	addl	$16, %esp	#,
# struct-demo.c:30: 	return 0;
	movl	$0, %eax	#, _15
# struct-demo.c:31: }
	movl	-4(%ebp), %ecx	#,
	.cfi_def_cfa 1, 0
	leave	
	.cfi_restore 5
	leal	-4(%ecx), %esp	#,
	.cfi_def_cfa 4, 4
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
.LC1:
	.string	"node:%s,%d\n"
	.text
	.globl	dump_node
	.type	dump_node, @function
dump_node:
.LFB1:
	.cfi_startproc
	pushl	%ebp	#
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp	#,
	.cfi_def_cfa_register 5
	subl	$8, %esp	#,
# struct-demo.c:36: 	printf("node:%s,%d\n", node->name, node->val);
	movl	8(%ebp), %eax	# node, tmp89
	movl	20(%eax), %edx	# node_4(D)->val, _1
# struct-demo.c:36: 	printf("node:%s,%d\n", node->name, node->val);
	movl	8(%ebp), %eax	# node, _2
# struct-demo.c:36: 	printf("node:%s,%d\n", node->name, node->val);
	subl	$4, %esp	#,
	pushl	%edx	# _1
	pushl	%eax	# _2
	pushl	$.LC1	#
	call	printf	#
	addl	$16, %esp	#,
# struct-demo.c:37: 	return;
	nop	
# struct-demo.c:38: }
	leave	
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	
	.cfi_endproc
.LFE1:
	.size	dump_node, .-dump_node
	.globl	dump_node2
	.type	dump_node2, @function
dump_node2:
.LFB2:
	.cfi_startproc
	pushl	%ebp	#
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp	#,
	.cfi_def_cfa_register 5
	subl	$8, %esp	#,
# struct-demo.c:42: 	printf("node:%s,%d\n", node.name, node.val);
	movl	28(%ebp), %eax	# node.val, _1
	subl	$4, %esp	#,
	pushl	%eax	# _1
	leal	8(%ebp), %eax	#, tmp88
	pushl	%eax	# tmp88
	pushl	$.LC1	#
	call	printf	#
	addl	$16, %esp	#,
# struct-demo.c:43: 	return;
	nop	
# struct-demo.c:44: }
	leave	
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	
	.cfi_endproc
.LFE2:
	.size	dump_node2, .-dump_node2
	.globl	traverse
	.type	traverse, @function
traverse:
.LFB3:
	.cfi_startproc
	pushl	%ebp	#
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp	#,
	.cfi_def_cfa_register 5
	subl	$24, %esp	#,
# struct-demo.c:48: 	struct Node *current = node;
	movl	8(%ebp), %eax	# node, tmp87
	movl	%eax, -12(%ebp)	# tmp87, current
# struct-demo.c:49: 	while(current != NULL){
	jmp	.L8	#
.L9:
# struct-demo.c:51: 		dump_node(current);
	subl	$12, %esp	#,
	pushl	-12(%ebp)	# current
	call	dump_node	#
	addl	$16, %esp	#,
# struct-demo.c:52: 		current = current->next;
	movl	-12(%ebp), %eax	# current, tmp88
	movl	24(%eax), %eax	# current_1->next, tmp89
	movl	%eax, -12(%ebp)	# tmp89, current
.L8:
# struct-demo.c:49: 	while(current != NULL){
	cmpl	$0, -12(%ebp)	#, current
	jne	.L9	#,
# struct-demo.c:54: 	return;
	nop	
# struct-demo.c:55: }
	leave	
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	
	.cfi_endproc
.LFE3:
	.size	traverse, .-traverse
	.ident	"GCC: (GNU) 8.3.1 20191121 (Red Hat 8.3.1-5)"
	.section	.note.GNU-stack,"",@progbits
