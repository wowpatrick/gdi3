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
	subq	$1616, %rsp             ## imm = 0x650
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -1160(%rbp)
	movl	%esi, -1164(%rbp)
	movq	%rdx, -1176(%rbp)
	movq	-1160(%rbp), %rax
	cvtsi2ssl	12(%rax), %xmm0
	cvtsi2ssl	8(%rax), %xmm1
	cvtsi2ssl	4(%rax), %xmm2
	cvtsi2ssl	(%rax), %xmm3
	movss	%xmm0, -1124(%rbp)
	movss	%xmm1, -1128(%rbp)
	movss	%xmm2, -1132(%rbp)
	movss	%xmm3, -1136(%rbp)
	movss	-1124(%rbp), %xmm0
	movss	-1132(%rbp), %xmm1
	unpcklps	%xmm0, %xmm1    ## xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movss	-1128(%rbp), %xmm0
	unpcklps	%xmm0, %xmm3    ## xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	unpcklps	%xmm1, %xmm3    ## xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
	movaps	%xmm3, -1152(%rbp)
	movaps	%xmm3, -1200(%rbp)
	cvtsi2ssl	-1164(%rbp), %xmm0
	movss	%xmm0, -1204(%rbp)
	leaq	-1204(%rbp), %rax
	movq	%rax, -16(%rbp)
	movss	-1204(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	pshufd	$0, %xmm0, %xmm0        ## xmm0 = xmm0[0,0,0,0]
	movaps	%xmm0, -48(%rbp)
	movaps	%xmm0, -1232(%rbp)
	movaps	-1200(%rbp), %xmm1
	movaps	%xmm1, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	movaps	-64(%rbp), %xmm1
	cmpeqps	%xmm0, %xmm1
	movaps	%xmm1, -1248(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -96(%rbp)
	movaps	%xmm0, -1264(%rbp)
	movaps	-1248(%rbp), %xmm1
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	-112(%rbp), %xmm1
	cmpeqps	%xmm0, %xmm1
	movaps	%xmm1, -1280(%rbp)
	leaq	-1296(%rbp), %rax
	movaps	L_colorMapYUV.yuv_constant(%rip), %xmm1
	movaps	%xmm1, -1296(%rbp)
	movq	%rax, -136(%rbp)
	movss	-1296(%rbp), %xmm1
	movss	%xmm1, -140(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -160(%rbp)
	movaps	%xmm1, -1312(%rbp)
	leaq	-1292(%rbp), %rax
	movq	%rax, -168(%rbp)
	movss	-1292(%rbp), %xmm1
	movss	%xmm1, -172(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -192(%rbp)
	movaps	%xmm1, -1328(%rbp)
	leaq	-1288(%rbp), %rax
	movq	%rax, -200(%rbp)
	movss	-1288(%rbp), %xmm1
	movss	%xmm1, -204(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -224(%rbp)
	movaps	%xmm1, -1344(%rbp)
	leaq	-1284(%rbp), %rax
	movq	%rax, -232(%rbp)
	movss	-1284(%rbp), %xmm1
	movss	%xmm1, -236(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -256(%rbp)
	movaps	%xmm1, -1360(%rbp)
	movaps	-1200(%rbp), %xmm1
	movaps	-1232(%rbp), %xmm2
	movaps	%xmm1, -272(%rbp)
	movaps	%xmm2, -288(%rbp)
	movaps	-272(%rbp), %xmm1
	divps	%xmm2, %xmm1
	movaps	-1312(%rbp), %xmm2
	movaps	%xmm1, -304(%rbp)
	movaps	%xmm2, -320(%rbp)
	movaps	-304(%rbp), %xmm1
	mulps	%xmm2, %xmm1
	movaps	-1328(%rbp), %xmm2
	movaps	%xmm1, -336(%rbp)
	movaps	%xmm2, -352(%rbp)
	movaps	-336(%rbp), %xmm1
	subps	%xmm2, %xmm1
	movaps	%xmm1, -1376(%rbp)
	movaps	-1344(%rbp), %xmm1
	movaps	-1200(%rbp), %xmm2
	movaps	-1232(%rbp), %xmm3
	movaps	%xmm2, -368(%rbp)
	movaps	%xmm3, -384(%rbp)
	movaps	-368(%rbp), %xmm2
	divps	%xmm3, %xmm2
	movaps	%xmm1, -400(%rbp)
	movaps	%xmm2, -416(%rbp)
	movaps	-400(%rbp), %xmm1
	subps	%xmm2, %xmm1
	movaps	%xmm1, -1392(%rbp)
	leaq	-1424(%rbp), %rax
	movl	L_colorMapYUV.rgb_constant+16(%rip), %esi
	movl	%esi, -1408(%rbp)
	movaps	L_colorMapYUV.rgb_constant(%rip), %xmm1
	movaps	%xmm1, -1424(%rbp)
	movq	%rax, -424(%rbp)
	leaq	-1408(%rbp), %rax
	movss	-1424(%rbp), %xmm1
	movss	%xmm1, -428(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -448(%rbp)
	movaps	%xmm1, -1440(%rbp)
	leaq	-1420(%rbp), %rdx
	movq	%rdx, -456(%rbp)
	movss	-1420(%rbp), %xmm1
	movss	%xmm1, -460(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -480(%rbp)
	movaps	%xmm1, -1456(%rbp)
	leaq	-1416(%rbp), %rdx
	movq	%rdx, -488(%rbp)
	movss	-1416(%rbp), %xmm1
	movss	%xmm1, -492(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -512(%rbp)
	movaps	%xmm1, -1472(%rbp)
	leaq	-1412(%rbp), %rdx
	movq	%rdx, -520(%rbp)
	movss	-1412(%rbp), %xmm1
	movss	%xmm1, -524(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -544(%rbp)
	movaps	%xmm1, -1488(%rbp)
	movq	%rax, -552(%rbp)
	movss	-1408(%rbp), %xmm1
	movss	%xmm1, -556(%rbp)
	pshufd	$0, %xmm1, %xmm1        ## xmm1 = xmm1[0,0,0,0]
	movaps	%xmm1, -576(%rbp)
	movaps	%xmm1, -1504(%rbp)
	movaps	-1456(%rbp), %xmm1
	movaps	-1360(%rbp), %xmm2
	movaps	-1440(%rbp), %xmm3
	movaps	-1392(%rbp), %xmm4
	movaps	%xmm3, -592(%rbp)
	movaps	%xmm4, -608(%rbp)
	movaps	-592(%rbp), %xmm3
	mulps	%xmm4, %xmm3
	movaps	%xmm2, -624(%rbp)
	movaps	%xmm3, -640(%rbp)
	movaps	-624(%rbp), %xmm2
	addps	%xmm3, %xmm2
	movaps	%xmm1, -656(%rbp)
	movaps	%xmm2, -672(%rbp)
	movaps	-656(%rbp), %xmm1
	mulps	%xmm2, %xmm1
	movaps	%xmm1, -1520(%rbp)
	movaps	-1280(%rbp), %xmm2
	movaps	%xmm2, -688(%rbp)
	movaps	%xmm1, -704(%rbp)
	movaps	-704(%rbp), %xmm1
	movaps	-688(%rbp), %xmm2
	pand	%xmm1, %xmm2
	movaps	%xmm2, -1520(%rbp)
	movaps	-1456(%rbp), %xmm1
	movaps	-1488(%rbp), %xmm2
	movaps	-1392(%rbp), %xmm3
	movaps	%xmm2, -720(%rbp)
	movaps	%xmm3, -736(%rbp)
	movaps	-720(%rbp), %xmm2
	mulps	%xmm3, %xmm2
	movaps	-1360(%rbp), %xmm3
	movaps	-1472(%rbp), %xmm4
	movaps	-1376(%rbp), %xmm5
	movaps	%xmm4, -752(%rbp)
	movaps	%xmm5, -768(%rbp)
	movaps	-752(%rbp), %xmm4
	mulps	%xmm5, %xmm4
	movaps	%xmm3, -784(%rbp)
	movaps	%xmm4, -800(%rbp)
	movaps	-784(%rbp), %xmm3
	addps	%xmm4, %xmm3
	movaps	%xmm2, -816(%rbp)
	movaps	%xmm3, -832(%rbp)
	movaps	-816(%rbp), %xmm2
	addps	%xmm3, %xmm2
	movaps	%xmm1, -848(%rbp)
	movaps	%xmm2, -864(%rbp)
	movaps	-848(%rbp), %xmm1
	mulps	%xmm2, %xmm1
	movaps	%xmm1, -1536(%rbp)
	movaps	-1280(%rbp), %xmm2
	movaps	%xmm2, -880(%rbp)
	movaps	%xmm1, -896(%rbp)
	movaps	-896(%rbp), %xmm1
	movaps	-880(%rbp), %xmm2
	pand	%xmm1, %xmm2
	movaps	%xmm2, -1536(%rbp)
	movaps	-1456(%rbp), %xmm1
	movaps	-1360(%rbp), %xmm2
	movaps	-1504(%rbp), %xmm3
	movaps	-1376(%rbp), %xmm4
	movaps	%xmm3, -912(%rbp)
	movaps	%xmm4, -928(%rbp)
	movaps	-912(%rbp), %xmm3
	mulps	%xmm4, %xmm3
	movaps	%xmm2, -944(%rbp)
	movaps	%xmm3, -960(%rbp)
	movaps	-944(%rbp), %xmm2
	addps	%xmm3, %xmm2
	movaps	%xmm1, -976(%rbp)
	movaps	%xmm2, -992(%rbp)
	movaps	-976(%rbp), %xmm1
	mulps	%xmm2, %xmm1
	movaps	%xmm1, -1552(%rbp)
	movaps	-1280(%rbp), %xmm2
	movaps	%xmm2, -1008(%rbp)
	movaps	%xmm1, -1024(%rbp)
	leaq	-1568(%rbp), %rax
	leaq	-1584(%rbp), %rdx
	leaq	-1600(%rbp), %rdi
	movaps	-1024(%rbp), %xmm1
	movaps	-1008(%rbp), %xmm2
	pand	%xmm1, %xmm2
	movaps	%xmm2, -1552(%rbp)
	movaps	%xmm0, -1568(%rbp)
	movaps	%xmm0, -1584(%rbp)
	movaps	%xmm0, -1600(%rbp)
	movaps	-1520(%rbp), %xmm0
	movq	%rax, -1032(%rbp)
	movaps	%xmm0, -1056(%rbp)
	movq	-1032(%rbp), %rax
	movups	%xmm0, (%rax)
	movaps	-1536(%rbp), %xmm0
	movq	%rdx, -1064(%rbp)
	movaps	%xmm0, -1088(%rbp)
	movq	-1064(%rbp), %rax
	movups	%xmm0, (%rax)
	movaps	-1552(%rbp), %xmm0
	movq	%rdi, -1096(%rbp)
	movaps	%xmm0, -1120(%rbp)
	movq	-1096(%rbp), %rax
	movups	%xmm0, (%rax)
	movl	$0, -1604(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$4, -1604(%rbp)
	jge	LBB0_4
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movslq	-1604(%rbp), %rax
	movl	%eax, %ecx
	leal	(%rcx,%rcx,2), %ecx
	movslq	%ecx, %rdx
	movq	-1176(%rbp), %rsi
	cvttss2si	-1568(%rbp,%rax,4), %ecx
	movb	%cl, %dil
	movb	%dil, (%rsi,%rdx)
	movslq	-1604(%rbp), %rax
	movl	%eax, %ecx
	leal	1(%rcx,%rcx,2), %ecx
	movslq	%ecx, %rdx
	movq	-1176(%rbp), %rsi
	cvttss2si	-1584(%rbp,%rax,4), %ecx
	movb	%cl, %dil
	movb	%dil, (%rsi,%rdx)
	movslq	-1604(%rbp), %rax
	cvttss2si	-1600(%rbp,%rax,4), %ecx
	movb	%cl, %dil
	imull	$3, -1604(%rbp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rax
	movq	-1176(%rbp), %rdx
	movb	%dil, (%rdx,%rax)
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-1604(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1604(%rbp)
	jmp	LBB0_1
LBB0_4:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_6
## BB#5:                                ## %SP_return
	addq	$1616, %rsp             ## imm = 0x650
	popq	%rbp
	ret
LBB0_6:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
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
	subq	$96, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, %ecx
	movabsq	$16, %rax
	leaq	-48(%rbp), %r8
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%r8, %rdi
	movl	%ecx, %esi
	movq	%rax, %rdx
	callq	_memset
	leaq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movl	$0, -60(%rbp)
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	cmpl	$4, -60(%rbp)
	jge	LBB1_9
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_3
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	-60(%rbp), %rax
	movq	-32(%rbp), %rcx
	movss	(%rcx,%rax,8), %xmm0
	movss	4(%rcx,%rax,8), %xmm1
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm1
	movsd	%xmm0, -80(%rbp)
	movsd	%xmm1, -72(%rbp)
	movsd	-80(%rbp), %xmm0
	movsd	-72(%rbp), %xmm1
	callq	_cabs
	movb	$0, %dl
	movabsq	$2, %rax
	cvtsi2sdq	%rax, %xmm1
	ucomisd	%xmm0, %xmm1
	movb	%dl, -81(%rbp)          ## 1-byte Spill
	jb	LBB1_5
## BB#4:                                ##   in Loop: Header=BB1_3 Depth=2
	movslq	-60(%rbp), %rax
	movl	-48(%rbp,%rax,4), %ecx
	cmpl	-20(%rbp), %ecx
	setl	%dl
	movb	%dl, -81(%rbp)          ## 1-byte Spill
LBB1_5:                                 ##   in Loop: Header=BB1_3 Depth=2
	movb	-81(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB1_6
	jmp	LBB1_7
LBB1_6:                                 ##   in Loop: Header=BB1_3 Depth=2
	movslq	-60(%rbp), %rax
	movq	-32(%rbp), %rcx
	movss	(%rcx,%rax,8), %xmm0
	movss	4(%rcx,%rax,8), %xmm1
	movslq	-60(%rbp), %rax
	movq	-32(%rbp), %rcx
	movss	(%rcx,%rax,8), %xmm2
	movss	4(%rcx,%rax,8), %xmm3
	movaps	%xmm0, %xmm4
	mulss	%xmm2, %xmm4
	movaps	%xmm1, %xmm5
	mulss	%xmm3, %xmm5
	subss	%xmm5, %xmm4
	mulss	%xmm2, %xmm1
	mulss	%xmm3, %xmm0
	addss	%xmm0, %xmm1
	movslq	-60(%rbp), %rax
	movq	-16(%rbp), %rcx
	movss	(%rcx,%rax,8), %xmm0
	movss	4(%rcx,%rax,8), %xmm2
	addss	%xmm0, %xmm4
	addss	%xmm2, %xmm1
	movslq	-60(%rbp), %rax
	movq	-32(%rbp), %rcx
	movss	%xmm4, (%rcx,%rax,8)
	movss	%xmm1, 4(%rcx,%rax,8)
	movslq	-60(%rbp), %rax
	movl	-48(%rbp,%rax,4), %edx
	addl	$1, %edx
	movl	%edx, -48(%rbp,%rax,4)
	jmp	LBB1_3
LBB1_7:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_8
LBB1_8:                                 ##   in Loop: Header=BB1_1 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	LBB1_1
LBB1_9:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	-56(%rbp), %rcx
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rax
	movq	%rcx, -96(%rbp)         ## 8-byte Spill
	jne	LBB1_11
## BB#10:                               ## %SP_return
	movq	-96(%rbp), %rax         ## 8-byte Reload
	addq	$96, %rsp
	popq	%rbp
	ret
LBB1_11:                                ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI2_0:
	.long	1069547520              ## float 1.5
LCPI2_1:
	.long	3217031168              ## float -1.5
LCPI2_2:
	.long	3223322624              ## float -2.5
LCPI2_3:
	.long	1077936128              ## float 3
LCPI2_4:
	.long	1073741824              ## float 2
LCPI2_5:
	.long	1065353216              ## float 1
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
	subq	$1056, %rsp             ## imm = 0x420
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movlps	%xmm0, -600(%rbp)
	movlps	%xmm1, -608(%rbp)
	movl	%edi, -612(%rbp)
	movl	%esi, -616(%rbp)
	movl	%edx, -620(%rbp)
	movl	-620(%rbp), %edx
	imull	-616(%rbp), %edx
	imull	$3, %edx, %edx
	movslq	%edx, %rdi
	callq	_malloc
	movss	LCPI2_0(%rip), %xmm0
	movss	LCPI2_1(%rip), %xmm1
	movabsq	$1, %rdi
	cvtsi2ssq	%rdi, %xmm2
	movss	LCPI2_2(%rip), %xmm3
	movq	%rax, -632(%rbp)
	movss	%xmm3, -636(%rbp)
	movss	%xmm2, -640(%rbp)
	movss	%xmm1, -644(%rbp)
	movss	%xmm0, -648(%rbp)
	movl	$0, -652(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
                                        ##       Child Loop BB2_5 Depth 3
                                        ##         Child Loop BB2_7 Depth 4
	movl	-652(%rbp), %eax
	cmpl	-620(%rbp), %eax
	jge	LBB2_18
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	cvtsi2ssl	-652(%rbp), %xmm0
	movss	LCPI2_3(%rip), %xmm1
	movaps	%xmm0, %xmm2
	addss	%xmm1, %xmm2
	movss	LCPI2_4(%rip), %xmm1
	movaps	%xmm0, %xmm3
	addss	%xmm1, %xmm3
	movss	LCPI2_5(%rip), %xmm1
	movaps	%xmm0, %xmm4
	addss	%xmm1, %xmm4
	movss	%xmm2, -564(%rbp)
	movss	%xmm3, -568(%rbp)
	movss	%xmm4, -572(%rbp)
	movss	%xmm0, -576(%rbp)
	movss	-564(%rbp), %xmm1
	movss	-572(%rbp), %xmm2
	unpcklps	%xmm1, %xmm2    ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	movss	-568(%rbp), %xmm1
	unpcklps	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	unpcklps	%xmm2, %xmm0    ## xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	movaps	%xmm0, -592(%rbp)
	movaps	%xmm0, -672(%rbp)
	leaq	-644(%rbp), %rax
	movq	%rax, -536(%rbp)
	movss	-644(%rbp), %xmm0
	movss	%xmm0, -540(%rbp)
	pshufd	$0, %xmm0, %xmm0        ## xmm0 = xmm0[0,0,0,0]
	movaps	%xmm0, -560(%rbp)
	movaps	%xmm0, -688(%rbp)
	leaq	-648(%rbp), %rax
	movq	%rax, -504(%rbp)
	movss	-648(%rbp), %xmm0
	movss	%xmm0, -508(%rbp)
	pshufd	$0, %xmm0, %xmm0        ## xmm0 = xmm0[0,0,0,0]
	movaps	%xmm0, -528(%rbp)
	movaps	%xmm0, -704(%rbp)
	cvtsi2ssl	-620(%rbp), %xmm0
	movss	%xmm0, -12(%rbp)
	movss	%xmm0, -16(%rbp)
	movss	%xmm0, -20(%rbp)
	movss	%xmm0, -24(%rbp)
	movss	-12(%rbp), %xmm1
	movss	-20(%rbp), %xmm2
	unpcklps	%xmm1, %xmm2    ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	movss	-16(%rbp), %xmm1
	unpcklps	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	unpcklps	%xmm2, %xmm0    ## xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	movaps	%xmm0, -48(%rbp)
	movaps	%xmm0, -720(%rbp)
	movaps	-688(%rbp), %xmm0
	movaps	-672(%rbp), %xmm1
	movaps	-704(%rbp), %xmm2
	movaps	%xmm2, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	movaps	-64(%rbp), %xmm2
	subps	%xmm0, %xmm2
	movaps	-720(%rbp), %xmm3
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -112(%rbp)
	movaps	-96(%rbp), %xmm2
	divps	%xmm3, %xmm2
	movaps	%xmm1, -128(%rbp)
	movaps	%xmm2, -144(%rbp)
	movaps	-128(%rbp), %xmm1
	mulps	%xmm2, %xmm1
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm1, -176(%rbp)
	movaps	-160(%rbp), %xmm0
	addps	%xmm1, %xmm0
	movaps	%xmm0, -736(%rbp)
	leaq	-752(%rbp), %rax
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -752(%rbp)
	movaps	-736(%rbp), %xmm0
	movq	%rax, -184(%rbp)
	movaps	%xmm0, -208(%rbp)
	movq	-184(%rbp), %rax
	movups	%xmm0, (%rax)
	movl	$0, -756(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_5 Depth 3
                                        ##         Child Loop BB2_7 Depth 4
	cmpl	$4, -756(%rbp)
	jge	LBB2_16
## BB#4:                                ##   in Loop: Header=BB2_3 Depth=2
	movslq	-756(%rbp), %rax
	movss	-752(%rbp,%rax,4), %xmm0
	movss	%xmm0, -760(%rbp)
	movl	$0, -764(%rbp)
LBB2_5:                                 ##   Parent Loop BB2_1 Depth=1
                                        ##     Parent Loop BB2_3 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB2_7 Depth 4
	movl	-764(%rbp), %eax
	cmpl	-616(%rbp), %eax
	jge	LBB2_14
## BB#6:                                ##   in Loop: Header=BB2_5 Depth=3
	leaq	-640(%rbp), %rax
	movq	%rax, -216(%rbp)
	movss	-640(%rbp), %xmm0
	movss	%xmm0, -220(%rbp)
	pshufd	$0, %xmm0, %xmm0        ## xmm0 = xmm0[0,0,0,0]
	movaps	%xmm0, -240(%rbp)
	movaps	%xmm0, -784(%rbp)
	leaq	-636(%rbp), %rax
	movq	%rax, -248(%rbp)
	movss	-636(%rbp), %xmm0
	movss	%xmm0, -252(%rbp)
	pshufd	$0, %xmm0, %xmm0        ## xmm0 = xmm0[0,0,0,0]
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -800(%rbp)
	cvtsi2ssl	-616(%rbp), %xmm0
	movss	%xmm0, -276(%rbp)
	movss	%xmm0, -280(%rbp)
	movss	%xmm0, -284(%rbp)
	movss	%xmm0, -288(%rbp)
	movss	-276(%rbp), %xmm1
	movss	-284(%rbp), %xmm2
	unpcklps	%xmm1, %xmm2    ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	movss	-280(%rbp), %xmm1
	unpcklps	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	unpcklps	%xmm2, %xmm0    ## xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	movaps	%xmm0, -304(%rbp)
	movaps	%xmm0, -816(%rbp)
	cvtsi2ssl	-764(%rbp), %xmm0
	movss	LCPI2_3(%rip), %xmm1
	movaps	%xmm0, %xmm2
	addss	%xmm1, %xmm2
	movss	LCPI2_4(%rip), %xmm1
	movaps	%xmm0, %xmm3
	addss	%xmm1, %xmm3
	movss	LCPI2_5(%rip), %xmm1
	movaps	%xmm0, %xmm4
	addss	%xmm1, %xmm4
	movss	%xmm2, -308(%rbp)
	movss	%xmm3, -312(%rbp)
	movss	%xmm4, -316(%rbp)
	movss	%xmm0, -320(%rbp)
	movss	-308(%rbp), %xmm1
	movss	-316(%rbp), %xmm2
	unpcklps	%xmm1, %xmm2    ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	movss	-312(%rbp), %xmm1
	unpcklps	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	unpcklps	%xmm2, %xmm0    ## xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	movaps	%xmm0, -336(%rbp)
	movaps	%xmm0, -832(%rbp)
	movaps	-800(%rbp), %xmm1
	movaps	-784(%rbp), %xmm2
	movaps	%xmm2, -352(%rbp)
	movaps	%xmm1, -368(%rbp)
	movaps	-352(%rbp), %xmm2
	subps	%xmm1, %xmm2
	movaps	-816(%rbp), %xmm3
	movaps	%xmm2, -384(%rbp)
	movaps	%xmm3, -400(%rbp)
	movaps	-384(%rbp), %xmm2
	divps	%xmm3, %xmm2
	movaps	%xmm0, -416(%rbp)
	movaps	%xmm2, -432(%rbp)
	movaps	-416(%rbp), %xmm0
	mulps	%xmm2, %xmm0
	movaps	%xmm1, -448(%rbp)
	movaps	%xmm0, -464(%rbp)
	movaps	-448(%rbp), %xmm1
	addps	%xmm0, %xmm1
	movaps	%xmm1, -848(%rbp)
	leaq	-864(%rbp), %rax
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -864(%rbp)
	movaps	-848(%rbp), %xmm0
	movq	%rax, -472(%rbp)
	movaps	%xmm0, -496(%rbp)
	movq	-472(%rbp), %rax
	movups	%xmm0, (%rax)
	leaq	-928(%rbp), %rax
	leaq	-976(%rbp), %rcx
	xorps	%xmm0, %xmm0
	movabsq	$1, %rdx
	cvtsi2ssq	%rdx, %xmm1
	movss	-864(%rbp), %xmm2
	movss	-760(%rbp), %xmm3
	movaps	%xmm3, %xmm4
	mulss	%xmm0, %xmm4
	subss	%xmm0, %xmm4
	mulss	%xmm1, %xmm3
	movaps	%xmm0, %xmm5
	addss	%xmm3, %xmm5
	addss	%xmm4, %xmm2
	movaps	%xmm0, %xmm3
	addss	%xmm5, %xmm3
	movss	%xmm2, -872(%rbp)
	movss	%xmm3, -868(%rbp)
	movss	-860(%rbp), %xmm2
	movss	-760(%rbp), %xmm3
	movaps	%xmm3, %xmm4
	mulss	%xmm0, %xmm4
	subss	%xmm0, %xmm4
	mulss	%xmm1, %xmm3
	movaps	%xmm0, %xmm5
	addss	%xmm3, %xmm5
	addss	%xmm4, %xmm2
	movaps	%xmm0, %xmm3
	addss	%xmm5, %xmm3
	movss	%xmm2, -880(%rbp)
	movss	%xmm3, -876(%rbp)
	movss	-856(%rbp), %xmm2
	movss	-760(%rbp), %xmm3
	movaps	%xmm3, %xmm4
	mulss	%xmm0, %xmm4
	subss	%xmm0, %xmm4
	mulss	%xmm1, %xmm3
	movaps	%xmm0, %xmm5
	addss	%xmm3, %xmm5
	addss	%xmm4, %xmm2
	movaps	%xmm0, %xmm3
	addss	%xmm5, %xmm3
	movss	%xmm2, -888(%rbp)
	movss	%xmm3, -884(%rbp)
	movss	-852(%rbp), %xmm2
	movss	-760(%rbp), %xmm3
	movaps	%xmm3, %xmm4
	mulss	%xmm0, %xmm4
	subss	%xmm0, %xmm4
	mulss	%xmm1, %xmm3
	movaps	%xmm0, %xmm1
	addss	%xmm3, %xmm1
	addss	%xmm4, %xmm2
	movaps	%xmm0, %xmm3
	addss	%xmm1, %xmm3
	movss	%xmm2, -896(%rbp)
	movss	%xmm3, -892(%rbp)
	movss	-872(%rbp), %xmm1
	movss	-868(%rbp), %xmm2
	movss	%xmm1, -928(%rbp)
	movss	%xmm2, -924(%rbp)
	movss	-880(%rbp), %xmm1
	movss	-876(%rbp), %xmm2
	movss	%xmm1, -920(%rbp)
	movss	%xmm2, -916(%rbp)
	movss	-888(%rbp), %xmm1
	movss	-884(%rbp), %xmm2
	movss	%xmm1, -912(%rbp)
	movss	%xmm2, -908(%rbp)
	movss	-896(%rbp), %xmm1
	movss	-892(%rbp), %xmm2
	movss	%xmm1, -904(%rbp)
	movss	%xmm2, -900(%rbp)
	movss	%xmm0, -936(%rbp)
	movss	%xmm0, -932(%rbp)
	movss	-936(%rbp), %xmm0
	movss	-932(%rbp), %xmm1
	movss	%xmm0, -976(%rbp)
	movss	%xmm1, -972(%rbp)
	movss	-936(%rbp), %xmm0
	movss	-932(%rbp), %xmm1
	movss	%xmm0, -968(%rbp)
	movss	%xmm1, -964(%rbp)
	movss	-936(%rbp), %xmm0
	movss	-932(%rbp), %xmm1
	movss	%xmm0, -960(%rbp)
	movss	%xmm1, -956(%rbp)
	movss	-936(%rbp), %xmm0
	movss	-932(%rbp), %xmm1
	movss	%xmm0, -952(%rbp)
	movss	%xmm1, -948(%rbp)
	movq	%rcx, -984(%rbp)
	movq	%rax, -992(%rbp)
	movq	-992(%rbp), %rdi
	movl	-612(%rbp), %esi
	movq	-984(%rbp), %rdx
	callq	_testEscapeSeriesForPoint
	movq	%rax, -1000(%rbp)
	movl	$0, -1004(%rbp)
LBB2_7:                                 ##   Parent Loop BB2_1 Depth=1
                                        ##     Parent Loop BB2_3 Depth=2
                                        ##       Parent Loop BB2_5 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	cmpl	$4, -1004(%rbp)
	jge	LBB2_12
## BB#8:                                ##   in Loop: Header=BB2_7 Depth=4
	movslq	-1004(%rbp), %rax
	movq	-1000(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	cmpl	-612(%rbp), %edx
	jge	LBB2_10
## BB#9:                                ##   in Loop: Header=BB2_7 Depth=4
	movslq	-1004(%rbp), %rax
	movss	-976(%rbp,%rax,8), %xmm0
	movss	-972(%rbp,%rax,8), %xmm1
	cvtss2sd	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm1
	movsd	%xmm0, -1024(%rbp)
	movsd	%xmm1, -1016(%rbp)
	movsd	-1024(%rbp), %xmm0
	movsd	-1016(%rbp), %xmm1
	callq	_cabs
	callq	_log
	movabsq	$2, %rax
	cvtsi2sdq	%rax, %xmm1
	movsd	%xmm0, -1040(%rbp)      ## 8-byte Spill
	movaps	%xmm1, %xmm0
	callq	_log
	movsd	-1040(%rbp), %xmm1      ## 8-byte Reload
	divsd	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	callq	_log
	movabsq	$2, %rax
	cvtsi2sdq	%rax, %xmm1
	movsd	%xmm0, -1048(%rbp)      ## 8-byte Spill
	movaps	%xmm1, %xmm0
	callq	_log
	movsd	-1048(%rbp), %xmm1      ## 8-byte Reload
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, -1008(%rbp)
	movslq	-1004(%rbp), %rax
	movq	-1000(%rbp), %rcx
	movl	(%rcx,%rax,4), %edx
	addl	$1, %edx
	cvtsi2ssl	%edx, %xmm0
	subss	-1008(%rbp), %xmm0
	cvttss2si	%xmm0, %edx
	movslq	-1004(%rbp), %rax
	movq	-1000(%rbp), %rcx
	movl	%edx, (%rcx,%rax,4)
LBB2_10:                                ##   in Loop: Header=BB2_7 Depth=4
	jmp	LBB2_11
LBB2_11:                                ##   in Loop: Header=BB2_7 Depth=4
	movl	-1004(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1004(%rbp)
	jmp	LBB2_7
LBB2_12:                                ##   in Loop: Header=BB2_5 Depth=3
	movl	-652(%rbp), %eax
	addl	-756(%rbp), %eax
	imull	-616(%rbp), %eax
	addl	-764(%rbp), %eax
	imull	$3, %eax, %eax
	movl	%eax, -1028(%rbp)
	movq	-1000(%rbp), %rdi
	movl	-612(%rbp), %esi
	movq	-632(%rbp), %rcx
	movslq	-1028(%rbp), %rdx
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	callq	_colorMapYUV
## BB#13:                               ##   in Loop: Header=BB2_5 Depth=3
	movl	-764(%rbp), %eax
	addl	$4, %eax
	movl	%eax, -764(%rbp)
	jmp	LBB2_5
LBB2_14:                                ##   in Loop: Header=BB2_3 Depth=2
	jmp	LBB2_15
LBB2_15:                                ##   in Loop: Header=BB2_3 Depth=2
	movl	-756(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -756(%rbp)
	jmp	LBB2_3
LBB2_16:                                ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_17
LBB2_17:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-652(%rbp), %eax
	addl	$4, %eax
	movl	%eax, -652(%rbp)
	jmp	LBB2_1
LBB2_18:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	-632(%rbp), %rcx
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rax
	movq	%rcx, -1056(%rbp)       ## 8-byte Spill
	jne	LBB2_20
## BB#19:                               ## %SP_return
	movq	-1056(%rbp), %rax       ## 8-byte Reload
	addq	$1056, %rsp             ## imm = 0x420
	popq	%rbp
	ret
LBB2_20:                                ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	.cfi_endproc

	.section	__TEXT,__const
	.align	4                       ## @colorMapYUV.yuv_constant
L_colorMapYUV.yuv_constant:
	.long	1073741824              ## float 2.000000e+00
	.long	1065353216              ## float 1.000000e+00
	.long	1056964608              ## float 5.000000e-01
	.long	1045220557              ## float 2.000000e-01

	.align	4                       ## @colorMapYUV.rgb_constant
L_colorMapYUV.rgb_constant:
	.long	1067704794              ## float 1.280330e+00
	.long	1132396544              ## float 2.550000e+02
	.long	3193698758              ## float -2.148200e-01
	.long	3200441521              ## float -3.805900e-01
	.long	1074278611              ## float 2.127980e+00


.subsections_via_symbols
