	.file	"testovf.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	testovf
	.type	testovf, @function
testovf:
	pushq	%rbp
	pushq	%rbx
	movabsq	$9223372036854775807, %rdx
	subq	$8, %rsp
	movq	big(%rip), %rbx
	movq	%rbx, %rbp
	addq	%rdx, %rbp
	jo	.L6
.L2:
	cmpq	%rbp, %rbx
	setg	%al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L6:
	movq	%rbx, %rsi
	movl	$.Lubsan_data0, %edi
	call	__ubsan_handle_add_overflow
	jmp	.L2
	.size	testovf, .-testovf
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"testovf.c"
	.data
	.align 16
	.type	.Lubsan_data0, @object
	.size	.Lubsan_data0, 24
.Lubsan_data0:
	.quad	.LC1
	.long	7
	.long	14
	.quad	.Lubsan_type0
	.align 2
	.type	.Lubsan_type0, @object
	.size	.Lubsan_type0, 15
.Lubsan_type0:
	.value	0
	.value	13
	.string	"'long int'"
	.globl	big
	.align 8
	.type	big, @object
	.size	big, 8
big:
	.quad	9223372036854775807
	.ident	"GCC: (GNU) 5.2.0"
	.section	.note.GNU-stack,"",@progbits
