# Calculate next prim of 23
# eax = prim
# ebx = div
# ecx = counter
.data
	str: .string "Next prim of 23: %d \n"
	a: .long 23
.globl main
main:
	movl a, %eax	# ebx = a 
	incl %eax	
outer_loop:
	movl $2, %ecx 	# ecx = 2
inner_loop:
	cltd		# convert long to double (edx:eax)
	divl %ebx	# eax / ebx	
	# teiler eax, rest edx (immer) parameter:eax / x 
	cmpl $0, %ebx
	je if
	#else
	incl %ecx
	cmpl %ecx, %eax
	jmp print
print:
	pushl %eax
	pushl $str
	call printf 	# output contents of stack according to out string
	popl %eax	# Clean up the stack, remove the parameters of print
	jmp end
end: 
	movl $1, %eax 	# Exit call
	movl $0, %ebx	# Exit call
	int $0x80	# Interrupt - end execturion of programm
