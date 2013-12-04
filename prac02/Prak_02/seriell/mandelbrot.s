	.file	"mandelbrot.c"
	.text
.globl colorMapYUV
	.type	colorMapYUV, @function
colorMapYUV:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movl	$0x3e4ccccd, %eax
	movl	%eax, -24(%rbp)
	cvtsi2ss	-36(%rbp), %xmm0
	cvtsi2ss	-40(%rbp), %xmm1
	divss	%xmm1, %xmm0
	addss	%xmm0, %xmm0
	movss	.LC1(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -20(%rbp)
	cvtsi2ss	-36(%rbp), %xmm0
	cvtsi2ss	-40(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	.LC2(%rip), %xmm1
	movaps	%xmm1, %xmm2
	subss	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	movss	%xmm0, -16(%rbp)
	movss	-24(%rbp), %xmm1
	cvtps2pd	%xmm1, %xmm1
	movss	-16(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC4(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	movss	-24(%rbp), %xmm1
	cvtps2pd	%xmm1, %xmm1
	movss	-20(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC5(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movss	-16(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC6(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC4(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-24(%rbp), %xmm1
	cvtps2pd	%xmm1, %xmm1
	movss	-20(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC7(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC4(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	je	.L2
	cvttss2si	-12(%rbp), %eax
	jmp	.L3
.L2:
	movl	$0, %eax
.L3:
	movq	-48(%rbp), %rdx
	movb	%al, (%rdx)
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rdx
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	je	.L4
	cvttss2si	-8(%rbp), %eax
	jmp	.L5
.L4:
	movl	$0, %eax
.L5:
	movb	%al, (%rdx)
	movq	-48(%rbp), %rax
	leaq	2(%rax), %rdx
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	je	.L6
	cvttss2si	-4(%rbp), %eax
	jmp	.L7
.L6:
	movl	$0, %eax
.L7:
	movb	%al, (%rdx)
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	colorMapYUV, .-colorMapYUV
.globl testEscapeSeriesForPoint
	.type	testEscapeSeriesForPoint, @function
testEscapeSeriesForPoint:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	movq	%xmm0, -40(%rbp)
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	%edx, -48(%rbp)
	movl	%eax, -44(%rbp)
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L10
	.cfi_offset 3, -24
.L12:
	movq	-64(%rbp), %rax
	movl	(%rax), %ebx
	movl	4(%rax), %ecx
	movq	-64(%rbp), %rax
	movl	(%rax), %edx
	movl	4(%rax), %eax
	movl	%ebx, -84(%rbp)
	movss	-84(%rbp), %xmm0
	movl	%ecx, -84(%rbp)
	movss	-84(%rbp), %xmm1
	movl	%edx, -84(%rbp)
	movss	-84(%rbp), %xmm2
	movl	%eax, -84(%rbp)
	movss	-84(%rbp), %xmm3
	call	__mulsc3
	movq	%xmm0, -72(%rbp)
	movl	-72(%rbp), %edx
	movl	-68(%rbp), %eax
	movl	%edx, -84(%rbp)
	movss	-84(%rbp), %xmm3
	movl	%eax, -84(%rbp)
	movss	-84(%rbp), %xmm2
	movss	-48(%rbp), %xmm1
	movss	-44(%rbp), %xmm0
	addss	%xmm3, %xmm1
	addss	%xmm2, %xmm0
	movq	-64(%rbp), %rax
	movss	%xmm1, (%rax)
	movss	%xmm0, 4(%rax)
	addl	$1, -20(%rbp)
.L10:
	movq	-64(%rbp), %rax
	movl	(%rax), %edx
	movl	4(%rax), %eax
	movl	%edx, -84(%rbp)
	movss	-84(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm1
	movl	%eax, -84(%rbp)
	movss	-84(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm1, -96(%rbp)
	movq	-96(%rbp), %rdx
	movsd	%xmm0, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rdx, -96(%rbp)
	movsd	-96(%rbp), %xmm0
	movq	%rax, -96(%rbp)
	movsd	-96(%rbp), %xmm1
	call	cabs
	movsd	.LC8(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	setae	%al
	testb	%al, %al
	je	.L11
	movl	-20(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L12
.L11:
	movl	-20(%rbp), %eax
	addq	$88, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE1:
	.size	testEscapeSeriesForPoint, .-testEscapeSeriesForPoint
.globl generateMandelbrot
	.type	generateMandelbrot, @function
generateMandelbrot:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$176, %rsp
	movq	%xmm0, -104(%rbp)
	movl	-104(%rbp), %ecx
	movl	-100(%rbp), %eax
	movl	%ecx, -112(%rbp)
	movl	%eax, -108(%rbp)
	movq	%xmm1, -168(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -120(%rbp)
	movl	-120(%rbp), %ecx
	movl	-116(%rbp), %eax
	movl	%ecx, -128(%rbp)
	movl	%eax, -124(%rbp)
	movl	%edi, -132(%rbp)
	movl	%esi, -136(%rbp)
	movl	%edx, -140(%rbp)
	movl	-140(%rbp), %eax
	movl	%eax, %edx
	imull	-136(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	cltq
	movq	%rax, %rdi
	.cfi_offset 3, -32
	.cfi_offset 12, -24
	call	malloc
	movq	%rax, -72(%rbp)
	movl	-112(%rbp), %eax
	movl	%eax, -60(%rbp)
	movl	-128(%rbp), %eax
	movl	%eax, -56(%rbp)
	movl	-124(%rbp), %eax
	movl	%eax, -52(%rbp)
	movl	-108(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L15
.L19:
	cvtsi2ss	-44(%rbp), %xmm1
	movss	-48(%rbp), %xmm0
	subss	-52(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	cvtsi2ss	-140(%rbp), %xmm1
	divss	%xmm1, %xmm0
	addss	-52(%rbp), %xmm0
	movss	%xmm0, -40(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L16
.L18:
	cvtsi2ss	-36(%rbp), %xmm1
	movss	-56(%rbp), %xmm0
	subss	-60(%rbp), %xmm0
	mulss	%xmm1, %xmm0
	cvtsi2ss	-136(%rbp), %xmm1
	divss	%xmm1, %xmm0
	addss	-60(%rbp), %xmm0
	movss	%xmm0, -32(%rbp)
	movl	-32(%rbp), %r12d
	movl	$0x00000000, %ebx
	movl	-40(%rbp), %edx
	movl	$0x00000000, %eax
	movl	%edx, -172(%rbp)
	movss	-172(%rbp), %xmm0
	movl	%eax, -172(%rbp)
	movss	-172(%rbp), %xmm1
	movss	.LC1(%rip), %xmm3
	xorps	%xmm2, %xmm2
	call	__mulsc3
	movq	%xmm0, -148(%rbp)
	movl	-148(%rbp), %edx
	movl	-144(%rbp), %eax
	movl	%r12d, -172(%rbp)
	movss	-172(%rbp), %xmm3
	movl	%ebx, -172(%rbp)
	movss	-172(%rbp), %xmm2
	movl	%edx, -172(%rbp)
	movss	-172(%rbp), %xmm1
	movl	%eax, -172(%rbp)
	movss	-172(%rbp), %xmm0
	addss	%xmm3, %xmm1
	addss	%xmm2, %xmm0
	movss	%xmm1, -80(%rbp)
	movss	%xmm0, -76(%rbp)
	movl	$0x00000000, %eax
	movl	%eax, -88(%rbp)
	movl	$0x00000000, %eax
	movl	%eax, -84(%rbp)
	leaq	-88(%rbp), %rdx
	movl	-132(%rbp), %eax
	movq	-80(%rbp), %xmm0
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	testEscapeSeriesForPoint
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-132(%rbp), %eax
	jge	.L17
	movl	-88(%rbp), %edx
	movl	-84(%rbp), %eax
	movl	%edx, -172(%rbp)
	movss	-172(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm1
	movl	%eax, -172(%rbp)
	movss	-172(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm1, -184(%rbp)
	movq	-184(%rbp), %rdx
	movsd	%xmm0, -184(%rbp)
	movq	-184(%rbp), %rax
	movq	%rdx, -184(%rbp)
	movsd	-184(%rbp), %xmm0
	movq	%rax, -184(%rbp)
	movsd	-184(%rbp), %xmm1
	call	cabs
	call	log
	movsd	.LC11(%rip), %xmm1
	divsd	%xmm1, %xmm0
	call	log
	movsd	.LC11(%rip), %xmm1
	divsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, -20(%rbp)
	movl	-28(%rbp), %eax
	addl	$1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	-20(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, -28(%rbp)
.L17:
	movl	-44(%rbp), %eax
	imull	-136(%rbp), %eax
	movl	%eax, %edx
	addl	-36(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	cltq
	movq	%rax, %rdx
	addq	-72(%rbp), %rdx
	movl	-132(%rbp), %ecx
	movl	-28(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	colorMapYUV
	addl	$1, -36(%rbp)
.L16:
	movl	-36(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L18
	addl	$1, -44(%rbp)
.L15:
	movl	-44(%rbp), %eax
	cmpl	-140(%rbp), %eax
	jl	.L19
	movq	-72(%rbp), %rax
	addq	$176, %rsp
	popq	%rbx
	popq	%r12
	leave
	ret
	.cfi_endproc
.LFE2:
	.size	generateMandelbrot, .-generateMandelbrot
	.section	.rodata
	.align 4
.LC1:
	.long	1065353216
	.align 4
.LC2:
	.long	1056964608
	.align 8
.LC3:
	.long	1331783459
	.long	1072987195
	.align 8
.LC4:
	.long	0
	.long	1081073664
	.align 8
.LC5:
	.long	3309530000
	.long	-1077182664
	.align 8
.LC6:
	.long	684445988
	.long	-1076339818
	.align 8
.LC7:
	.long	1624528430
	.long	1073808922
	.align 8
.LC8:
	.long	0
	.long	1073741824
	.align 8
.LC11:
	.long	4277811695
	.long	1072049730
	.ident	"GCC: (Debian 4.4.5-8) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
