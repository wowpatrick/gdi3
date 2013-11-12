# Calculate next prim of 23
.data
	str: .string "Next prim of 23: 20^4: %d \n"
	a: .long 20 
    b: .long 10
.globl main
loop:
    cltd
	divl %ecx, %eax
	incl %ebx 
	jmp print
main:
	movl a, %eax
	movl b, %ecx
	movl $0, %ebx
	jmp loop
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
