# Calculate next prim of 23
# eax = prim
# ebx = div
# ecx = counter
.data
	str: .string "Next prim of 23: %d \n"
	a: .long 23
    b: .long 2
.globl main
main:
	movl a, %eax	    # a = 23
	incl %eax           # next(eax) = a+1 	
outer_loop:
	movl b, %ecx 	    # i(ecx) = 2
inner_loop:
    cmpl %ecx, %eax
    jge outer_end       # while(i(ecx) < next(eax))
	cltd		        # convert long to double (edx:eax)
	divl %ecx	    # eax / ebx	teiler kommt in eax, rest in edx; Operation eax / parameter 
	cmpl $0, %ebx       # ebx === 0 (rest der division)
	je if_inner
    jmp else_inner
myprint:
	pushl %eax
	pushl $str
	call printf 	    # output contents of stack according to out string
	popl %eax	        # Clean up the stack, remove the parameters of print
	jmp end
end: 
	movl $1, %eax 	    # Exit call
	movl $0, %ebx	    # Exit call
	int $0x80	        # Interrupt - end execturion of programm
if_inner:
    incl %eax
    jmp myprint
else_inner:
    incl %ecx
    jmp inner_loop
outer_end:
    cmpl %ecx, %eax
    je myprint
    jmp outer_loop
