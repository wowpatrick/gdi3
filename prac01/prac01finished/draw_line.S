# 1771312 Wei-Hung Hsu
# 1945025 Patrick Dorrington
# 1697593 David Möller

.global draw_line

.data
dx: .long -1
dy: .long -1
sx: .long -1
sy: .long -1
err: .long -1
x: .long -1
y: .long -1
e2: .long -1

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


// My Code
movl x1, %ebx
movl x0, %ecx
subl %ecx, %ebx		# ebx - ecx = ebx    <=>      x1 - x0 = ebx
cmpl $0, %ebx		# >0 means a negative number, <0 means a positive number
jge aboveOrEqualZero	# if the number is positive then a negation is not necessary
negl %ebx		# (ebx is negative => 2k-negation) <=> abs() 

aboveOrEqualZero:
movl %ebx, dx		# dx = abs (...)
movl x1, %ebx		# rewriting x1 to ebx, since ebx was overwritten priviously
cmpl %ebx, %ecx
jge greater		# jump when (ecx >= ebx) <=> (x0 >= x1) | else-statement

movl $1, sx		# if-statement <=> sx = 1
jmp skipGreater

greater:		# else-statement  <=> sx = -1

movl $-1, sx

skipGreater:



# At this point sx and dx are both set


movl y1, %ebx
movl y0, %ecx
subl %ecx, %ebx		# ebx - ecx = ebx <=> y1 - y0 = ebx
cmpl $0, %ebx
jl lessThanZero		# if the number is negative then a negation is not necessary
negl %ebx		# (ebx is positive => 2k-negation) <=> -abs()



lessThanZero:
movl %ebx, dy		# dy = -abs(...)
movl y1, %ebx		# rewriting y1 to ebx, since ebx was overwritten priviously
cmpl %ebx, %ecx
jge greater2		# jump when (ecx >= ebx) <=> (y0 >= y1)

movl $1, sy		# if-statement <=> sy = 1
jmp skipGreater2


greater2:
movl $-1, sy		# else-statement <=> sy = -1


skipGreater2:


# At this point sy and dy are both set


movl dx, %eax
movl dy, %ebx

addl %eax, %ebx		# dx + dy = ebx
movl %ebx, err		# ebx = err


# At this point err is set

movl x0, %eax
movl %eax, x		# x = x0
movl y0, %eax
movl %eax, y		# y = y0


# At this point x and y are both set


startWhile:


movl y, %eax		# setPixel(...)
imull width, %eax	# y * width = eax
addl x, %eax		# x + eax = eax
movb $255, buf(%eax)


# At this point setpixel() has been executed

movl x1, %eax
movl x, %ebx
cmpl %eax, %ebx
jne ConditionFailed


movl y, %ebx
movl y1, %ecx
cmpl %ebx, %ecx
jne ConditionFailed


# (x == x1 && y == y1), if this point is reached
jmp breakWhile


ConditionFailed:

movl err, %eax
shll $1, %eax
movl %eax, e2 		# 2 * err = e2


movl e2, %eax
movl dy, %ebx
cmpl %eax, %ebx
jge EndCondition1	# jump when dy >= e2

movl err, %eax
# dy is already in ebx

addl %eax, %ebx
movl %ebx, err		# err = err + dy

movl x, %eax
movl sx, %ebx
addl %eax, %ebx
movl %ebx, x		# x= x + sx


EndCondition1:


movl e2, %eax
movl dx, %ebx
cmpl %eax, %ebx
jle  EndCondition2	# jump when dx <= e2

movl err, %eax
movl dx, %ebx
addl %eax, %ebx
movl %ebx, err		# err = err + dx

movl y, %eax
movl sy, %ebx
addl %eax, %ebx
movl %ebx, y		# y = y + sy




EndCondition2: 







jmp startWhile
breakWhile:






	movl %ebp, %esp
	popa
	ret
