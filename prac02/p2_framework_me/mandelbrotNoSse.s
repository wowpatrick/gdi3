	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	4611974203767543342     ## double 2.12798
LCPI0_1:
	.quad	-4622844317008146140    ## double -0.38059
LCPI0_2:
	.quad	-4626464310388626544    ## double -0.21482
LCPI0_3:
	.quad	4608444912883558179     ## double 1.28033
LCPI0_4:
	.quad	4602678819172646912     ## double 0.5
	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI0_5:
	.long	1045220557              ## float 0.2
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_colorMapYUV
	.align	4, 0x90
_colorMapYUV:                           ## @colorMapYUV
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	movabsq	$255, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	LCPI0_0(%rip), %xmm1
	movsd	LCPI0_1(%rip), %xmm2
	movsd	LCPI0_2(%rip), %xmm3
	movsd	LCPI0_3(%rip), %xmm4
	movsd	LCPI0_4(%rip), %xmm5
	movabsq	$-1, %rax
	cvtsi2ssq	%rax, %xmm6
	movabsq	$2, %rax
	cvtsi2ssq	%rax, %xmm7
	movss	LCPI0_5(%rip), %xmm8
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movss	%xmm8, -20(%rbp)
	cvtsi2ssl	-4(%rbp), %xmm8
	cvtsi2ssl	-8(%rbp), %xmm9
	divss	%xmm9, %xmm8
	mulss	%xmm8, %xmm7
	addss	%xmm7, %xmm6
	movss	%xmm6, -24(%rbp)
	cvtsi2ssl	-4(%rbp), %xmm6
	cvtsi2ssl	-8(%rbp), %xmm7
	divss	%xmm7, %xmm6
	cvtss2sd	%xmm6, %xmm6
	subsd	%xmm6, %xmm5
	cvtsd2ss	%xmm5, %xmm5
	movss	%xmm5, -28(%rbp)
	cvtss2sd	-20(%rbp), %xmm5
	cvtss2sd	-28(%rbp), %xmm6
	mulsd	%xmm6, %xmm4
	addsd	%xmm4, %xmm5
	movaps	%xmm0, %xmm4
	mulsd	%xmm5, %xmm4
	cvtsd2ss	%xmm4, %xmm4
	movss	%xmm4, -32(%rbp)
	cvtss2sd	-20(%rbp), %xmm4
	cvtss2sd	-24(%rbp), %xmm5
	mulsd	%xmm5, %xmm3
	addsd	%xmm3, %xmm4
	cvtss2sd	-28(%rbp), %xmm3
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm4
	movaps	%xmm0, %xmm2
	mulsd	%xmm4, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	movss	%xmm2, -36(%rbp)
	cvtss2sd	-20(%rbp), %xmm2
	cvtss2sd	-24(%rbp), %xmm3
	mulsd	%xmm3, %xmm1
	addsd	%xmm1, %xmm2
	mulsd	%xmm2, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -40(%rbp)
	movl	-4(%rbp), %esi
	cmpl	-8(%rbp), %esi
	jne	LBB0_2
## BB#1:
	movl	$0, %eax
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB0_3
LBB0_2:
	cvttss2si	-32(%rbp), %eax
	movb	%al, %cl
	movzbl	%cl, %eax
	movl	%eax, -44(%rbp)         ## 4-byte Spill
LBB0_3:
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movb	%al, %cl
	movq	-16(%rbp), %rdx
	movb	%cl, (%rdx)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	LBB0_5
## BB#4:
	movl	$0, %eax
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB0_6
LBB0_5:
	cvttss2si	-36(%rbp), %eax
	movb	%al, %cl
	movzbl	%cl, %eax
	movl	%eax, -48(%rbp)         ## 4-byte Spill
LBB0_6:
	movl	-48(%rbp), %eax         ## 4-byte Reload
	movb	%al, %cl
	movq	-16(%rbp), %rdx
	movb	%cl, 1(%rdx)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	LBB0_8
## BB#7:
	movl	$0, %eax
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	jmp	LBB0_9
LBB0_8:
	cvttss2si	-40(%rbp), %eax
	movb	%al, %cl
	movzbl	%cl, %eax
	movl	%eax, -52(%rbp)         ## 4-byte Spill
LBB0_9:
	movl	-52(%rbp), %eax         ## 4-byte Reload
	movb	%al, %cl
	movq	-16(%rbp), %rdx
	movb	%cl, 2(%rdx)
	popq	%rbp
	ret
	.cfi_endproc

	.globl	_testEscapeSeriesForPoint
	.align	4, 0x90
_testEscapeSeriesForPoint:              ## @testEscapeSeriesForPoint
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp7:
	.cfi_def_cfa_offset 16
Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp9:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movlps	%xmm0, -8(%rbp)
	movl	%edi, -12(%rbp)
	movq	%rsi, -24(%rbp)
	movl	$0, -28(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	movss	4(%rax), %xmm1
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm1
	movsd	%xmm0, -48(%rbp)
	movsd	%xmm1, -40(%rbp)
	movsd	-48(%rbp), %xmm0
	movsd	-40(%rbp), %xmm1
	callq	_cabs
	movb	$0, %cl
	movabsq	$2, %rax
	cvtsi2sdq	%rax, %xmm1
	ucomisd	%xmm0, %xmm1
	movb	%cl, -49(%rbp)          ## 1-byte Spill
	jb	LBB1_3
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	setl	%cl
	movb	%cl, -49(%rbp)          ## 1-byte Spill
LBB1_3:                                 ##   in Loop: Header=BB1_1 Depth=1
	movb	-49(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB1_4
	jmp	LBB1_5
LBB1_4:                                 ##   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	movss	4(%rax), %xmm1
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm2
	movss	4(%rax), %xmm3
	movaps	%xmm0, %xmm4
	mulss	%xmm2, %xmm4
	movaps	%xmm1, %xmm5
	mulss	%xmm3, %xmm5
	subss	%xmm5, %xmm4
	mulss	%xmm2, %xmm1
	mulss	%xmm3, %xmm0
	addss	%xmm0, %xmm1
	movss	-8(%rbp), %xmm0
	movss	-4(%rbp), %xmm2
	addss	%xmm0, %xmm4
	addss	%xmm2, %xmm1
	movq	-24(%rbp), %rax
	movss	%xmm4, (%rax)
	movss	%xmm1, 4(%rax)
	movl	-28(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -28(%rbp)
	jmp	LBB1_1
LBB1_5:
	movl	-28(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI2_0:
	.long	1069547520              ## float 1.5
LCPI2_1:
	.long	3217031168              ## float -1.5
LCPI2_2:
	.long	3223322624              ## float -2.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_generateMandelbrot
	.align	4, 0x90
_generateMandelbrot:                    ## @generateMandelbrot
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movlps	%xmm0, -8(%rbp)
	movlps	%xmm1, -16(%rbp)
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %edx
	imull	-24(%rbp), %edx
	imull	$3, %edx, %edx
	movslq	%edx, %rdi
	callq	_malloc
	movss	LCPI2_0(%rip), %xmm0
	movss	LCPI2_1(%rip), %xmm1
	movabsq	$1, %rdi
	cvtsi2ssq	%rdi, %xmm2
	movss	LCPI2_2(%rip), %xmm3
	movq	%rax, -40(%rbp)
	movss	%xmm3, -44(%rbp)
	movss	%xmm2, -48(%rbp)
	movss	%xmm1, -52(%rbp)
	movss	%xmm0, -56(%rbp)
	movl	$0, -60(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	movl	-60(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	LBB2_10
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movss	-52(%rbp), %xmm0
	cvtsi2ssl	-60(%rbp), %xmm1
	movss	-56(%rbp), %xmm2
	subss	-52(%rbp), %xmm2
	mulss	%xmm2, %xmm1
	cvtsi2ssl	-28(%rbp), %xmm2
	divss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -64(%rbp)
	movl	$0, -68(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-68(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	LBB2_8
## BB#4:                                ##   in Loop: Header=BB2_3 Depth=2
	movss	-44(%rbp), %xmm0
	cvtsi2ssl	-68(%rbp), %xmm1
	movss	-48(%rbp), %xmm2
	subss	%xmm0, %xmm2
	mulss	%xmm2, %xmm1
	cvtsi2ssl	-24(%rbp), %xmm2
	divss	%xmm2, %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -72(%rbp)
	movss	-64(%rbp), %xmm1
	xorps	%xmm2, %xmm2
	movaps	%xmm1, %xmm3
	mulss	%xmm2, %xmm3
	subss	%xmm2, %xmm3
	addss	%xmm2, %xmm1
	addss	%xmm3, %xmm0
	addss	%xmm2, %xmm1
	movss	%xmm0, -80(%rbp)
	movss	%xmm1, -76(%rbp)
	movl	$0, -88(%rbp)
	movl	$0, -84(%rbp)
	movl	-20(%rbp), %edi
	movq	-80(%rbp), %rax
	movq	%rax, -104(%rbp)
	movd	%rax, %xmm0
	leaq	-88(%rbp), %rsi
	callq	_testEscapeSeriesForPoint
	movl	%eax, -92(%rbp)
	movl	-92(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB2_6
## BB#5:                                ##   in Loop: Header=BB2_3 Depth=2
	movss	-88(%rbp), %xmm0
	movss	-84(%rbp), %xmm1
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm1
	movsd	%xmm0, -128(%rbp)
	movsd	%xmm1, -120(%rbp)
	movsd	-128(%rbp), %xmm0
	movsd	-120(%rbp), %xmm1
	callq	_cabs
	callq	_log
	movabsq	$2, %rax
	cvtsi2sdq	%rax, %xmm1
	movsd	%xmm0, -144(%rbp)       ## 8-byte Spill
	movaps	%xmm1, %xmm0
	callq	_log
	movsd	-144(%rbp), %xmm1       ## 8-byte Reload
	divsd	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	callq	_log
	movabsq	$2, %rax
	cvtsi2sdq	%rax, %xmm1
	movsd	%xmm0, -152(%rbp)       ## 8-byte Spill
	movaps	%xmm1, %xmm0
	callq	_log
	movsd	-152(%rbp), %xmm1       ## 8-byte Reload
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, -108(%rbp)
	movl	-92(%rbp), %ecx
	addl	$1, %ecx
	cvtsi2ssl	%ecx, %xmm0
	subss	-108(%rbp), %xmm0
	cvttss2si	%xmm0, %ecx
	movl	%ecx, -92(%rbp)
LBB2_6:                                 ##   in Loop: Header=BB2_3 Depth=2
	movl	-60(%rbp), %eax
	imull	-24(%rbp), %eax
	addl	-68(%rbp), %eax
	imull	$3, %eax, %eax
	movl	%eax, -132(%rbp)
	movl	-92(%rbp), %edi
	movl	-20(%rbp), %esi
	movq	-40(%rbp), %rcx
	movslq	-132(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	callq	_colorMapYUV
## BB#7:                                ##   in Loop: Header=BB2_3 Depth=2
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB2_3
LBB2_8:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_9
LBB2_9:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	LBB2_1
LBB2_10:
	movq	-40(%rbp), %rax
	addq	$160, %rsp
	popq	%rbp
	ret
	.cfi_endproc


.subsections_via_symbols
