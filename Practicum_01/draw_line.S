.global draw_line

.data
    dx: .long 0
    dy: .long 0
    sx: .long 0
    sy: .long 0
    err: .long 0
    x: .long 0
    y: .long 0
    e2: .long 0

.text
draw_line:
	pusha
	movl %esp, %ebp

// Mit diesen Makros koennen Sie auf die Parameter zugreifen.
// Beispiel: mov x0, %eax

#define x0 36(%ebp)
#define y0 40(%ebp)
#define x1 44(%ebp)
#define y1 48(%ebp)

# dx #
    movl x0, %eax
    movl x1, %ebx
    subl %eax, %ebx
    cmpl $0, %ebx
    jge no_neg
    negl %ebx
no_neg:
    movl %ebx, dx
# sx #
    movl x0, %eax
    movl x1, %ebx
    cmpl %eax, %ebx
    jg x1greater
    jmp c1
x1greater:
    movl $1, sx
c1:
    movl $-1, sx
# dy #
     movl y0, %eax
     movl y1, %ebx
     subl %eax, %ebx
     cmpl $0, %ebx
     jge make_neg
     jmp c2
make_neg:
    negl %ebx
c2:
    movl %ebx, dy
# sy #
    movl y0, %eax
    movl y1, %ebx
    cmpl %eax, %ebx
    jg y1greater
    jmp c3
y1greater:
    movl $1, sy
c3:
    movl $-1, sy
# err #
    movl dx, %eax
    movl dy, %ebx
    addl %eax, %ebx
    movl %ebx, err
# x & y #
    movl x0, %eax
    movl %eax, x
    movl y0, %ebx
    movl %ebx, y
# while #
while:
    # setpixel (x, y)
    movl y, %eax
    imull width, %eax
    addl x, %eax
    movb $255, buf(%eax) 
    # (x == x1 && y == y1) #
    movl x1, %eax
    movl x, %ebx
    cmpl %eax, %ebx
    jne c4
    movl y1, %eax
    movl y, %ebx
    cmpl %eax, %ebx
    je break
c4:
    # e2 #
    movl err, %eax
    imull $2, %eax
    movl %eax, e2
    # (e2 > dy) #
    movl e2, %eax
    movl dy, %ebx
    cmpl %eax, %ebx
    jl e2greater
    jmp c5
e2greater:
   movl err, %eax
   movl dy, %ebx
   addl %eax, %ebx
   movl %ebx, err
   movl x, %eax
   movl sx, %ebx
   addl %eax, %ebx
   movl %ebx, x
c5:
    # (e2 < dx) #
    movl e2, %eax
    movl dx, %ebx
    cmpl %eax, %ebx
    jg dxgreater
    jmp c6
dxgreater:
    movl err, %eax
    movl dx, %ebx
    addl %eax, %ebx
    movl %ebx, err
    movl y, %eax
    movl sy, %ebx
    addl %eax, %ebx
    movl %ebx, y
c6:
    jmp while    
break:
	movl %ebp, %esp
	popa
	ret
