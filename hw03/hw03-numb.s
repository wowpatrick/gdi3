# David Möller			1697593
# Wei-Hung Hsu			1771312
# Patrick Dorrington		1945025
#.........................................

.data
	a:		.long		1
	b:		.long		5
	c:		.long		5
	d:		.long		0
	e:		.long		5
	f:		.long		10
	intout:		.string		"Result:\t%d\n"
.text
.global main

main:	movl b, %eax				# eax holds b
	movl a, %ebx				# ebx holds c
	subl %ebx, %eax				# b - a
	pushl %eax
	movl e, %eax				# eax holds e
	movl f, %ebx				# ebx holds f
	addl %ebx, %eax				# e + f
	popl %ebx				# ebx holds (b - a)
	imull %ebx, %eax			# eax holds (b - a) * (e + f)
	pushl %eax				# push (b - a) * (e + f)
	pushl a					# push a
	pushl d					# push d
	movl b, %eax				# eax holds b
	movl c, %ebx				# ebx holds c
	addl %ebx, %eax				# eax holds (b + c)
	popl %ebx				# ebx holds d
	imull %ebx, %eax			# eax holds (b + c) * d
	popl %ebx				# ebx holds a
	addl %eax, %ebx				# eax holds a + (b + c) * d
	popl %eax				# ebx holds (b - a) * (e + f)
	cltd					# edx:eax
	idivl %ebx				# eax holds [(b - a) * (e + f)] / [a + (b + c) * d]
.PRINT:	pushl %ecx
	pushl %eax
	pushl $intout
	call printf
	addl  $8, %esp
	popl %ecx
.END:	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
