# David Möller					1697593
# Wei-Hung Hsu					1771312
# Patrick Dorrington			1945025
#.........................................

.data
		n:		.long		1
		x:		.long		2
		y:		.long		4
		intout:		.string		"Result:\t%d\n"
.text
.global main

### SUDAN: LONG, LONG, LONG -> LONG
sudan:		pushl %ebp			# save ebp
		movl %esp, %ebp			# set current base
		pushl %eax			# save eax
		pushl %ebx			# save ebx
		pushl %ecx			# save ecx

		movl 20(%ebp), %ecx		# ecx holds n
		movl 16(%ebp), %ebx		# ebx holds x
		movl 12(%ebp), %eax		# eax holds y

		cmpl $0, %ecx			# n == 0?
		je .RET_XY			# return x + y
		cmpl $0, %eax			# y == 0?
		je .RET_X			# return x

		decl %eax			# y--
		pushl %ecx			# param: n
		pushl %ebx			# param: x
		pushl %eax			# param: y - 1
		subl $4, %esp			# reserve space for return value
		call sudan			# recursive call of sudan
		popl %ebx			# ebx holds return value: t1
		addl $12, %esp			# remove parameter from stack

		decl %ecx			# n--
		incl %eax			# restore y (y++)
		addl %ebx, %eax			# y + t1
		pushl %ecx			# param: n - 1
		pushl %ebx			# param: t1
		pushl %eax			# param: t1 + y
		subl $4, %esp			# reserve space for return value
		call sudan			# recursive call of sudan
		popl %eax			# eax holds return value: t2
		addl $12, %esp			# remove parameter from stack

		movl %eax, 8(%ebp)		# return t2
		jmp .END_SUDAN			# leave function
.RET_XY:	addl %eax, %ebx			# x + y
.RET_X:		movl %ebx, 8(%ebp)		# return x (or x + y)
.END_SUDAN:	popl %ecx			# restore ecx
		popl %ebx			# restore ebx
		popl %eax			# restore eax
		popl %ebp			# restore ebx
		ret

### MAIN
main:		pushl n				# param: n
		pushl x				# param: x
		pushl y				# param: y
		subl $4, %esp			# reserve space for return value
		call sudan			# main call of sudan
		popl %eax			# eax holds return value
		addl $12, %esp			# remove parameter from stack
.PRINT:		pushl %ecx			# save ecx
		pushl %eax			# value for print
		pushl $intout			# string for print
		call printf			# call print
		addl $8, %esp			# restore stack
		popl %ecx			# restore ecx
.QUIT:		movl $1, %eax
		xorl %ebx, %ebx
		int $0x80
