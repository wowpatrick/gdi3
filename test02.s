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
	movl a, %ebx	    # a = 23
	incl %ebx           # next(eax) = a+1 	
outer_loop:
	movl b, %ecx 	    # i(ecx) = 2
inner_loop:
    cmpl %ebx, %ecx
    jge outer_end       # while(i(ecx) < next(eax))
    movl %ebx, %eax
	cltd		        # convert long to double (edx:eax)
	divl %ecx	        # eax / ecx	teiler kommt in eax, rest in edx; Operation eax / parameter 
	cmpl $0, %edx       # edx === 0 (rest der division)
	je if_inner
    jmp else_inner
myprint:
	pushl %ebx
	pushl $str
	call printf 	    # output contents of stack according to out string
	popl %ebx	        # Clean up the stack, remove the parameters of print
	jmp end
end: 
	movl $1, %eax 	    # Exit call
	movl $0, %ebx	    # Exit call
	int $0x80	        # Interrupt - end execturion of programm
if_inner:
    incl %ebx
    jmp outer_end 
else_inner:
    incl %ecx
    jmp inner_loop
outer_end:
    cmpl %ecx, %ebx
    je myprint
    jmp outer_loop
