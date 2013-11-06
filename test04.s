.data
	str: .string "Output: %d \n"
    a: .long 10
.globl main
main:
    pushl a
loop:
    popl %eax
    imull $10, %eax
    pushl %eax
    cmpl $100, %eax
    je print    
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
