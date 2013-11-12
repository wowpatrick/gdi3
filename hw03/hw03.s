.data
    inout: .string "Wert %d\n"
    n: .long 1
    x: .long 2
    y: .long 4
    .text

.globl main
main:
    pushl n
    pushl x 
    pushl y 
rec:
    popl %ecx
    popl %ebx
    popl %eax
    cmpl $0, %eax
    je returnA
    cmpl $0, %ecx
    je returnB
    pushl %eax
    pushl %ebx
    decl %ecx
    pushl %ecx
    jmp rec 
returnA:
    addl %ebx, %ecx
    pushl %eax,
    pushl %ebx
    pushl %ecx 
returnB: 

# Wert im %eax ausgeben
pushl %eax
pusl $inout
call printf
addl $8, %esp

# Exit
movl $1, %eax
int $0x80
