.data
	str: .string "Next prim of 23: %d \n"
	a: .long 23
    b: .long 2
.globl main
main:
	movl a, %ebx	    # a = 23
	incl %ebx           # next(eax) = a+1 	
myprint:
	pushl %eax
	pushl $str
	call printf 	    # output contents of stack according to out string
	popl %ebx	        # Clean up the stack, remove the parameters of print
	jmp end
end: 
	movl $1, %eax 	    # Exit call
	movl $0, %ebx	    # Exit call
	int $0x80	        # Interrupt - end execturion of programm
