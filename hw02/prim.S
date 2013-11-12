# 1771312 Wei-Hung Hsu
# 1697593 Darvid Möller
# 1945025 Patrick Dorrington

.data
a:		.long		23
intout:		.string		"Naechste Primzahl: %d\n"

.text
.globl main
main:


# Task
			movl a, %ebx 		# a = 23 = ebx
			incl %ebx		# incrementing ebx by 1
						# ebx = next
.firstwhile: 		movl $2, %ecx		# ecx = 2 <=> i = 2

.secondwhile:		cmpl %ebx, %ecx		# i < next
			jge .endsecondwhile	# if ecx is greater equal ecx => jump (break point for the second while)

			movl %ebx, %eax		# eax = next = ebx
			cltd			# edx:eax
			divl %ecx		# eax = next / i <=>  eax = eax / ecx 
						# (next mod i) = edx
			cmpl $0, %edx		# (next mod i) == 0 <=> eax mod ecx == 0
			jne .elseS		# if not equal => jump to else statement


			incl %ebx		# increment next 
			jmp .firstwhile		# break

.elseS:
			incl %ecx		# increment i
			jmp .secondwhile

.endsecondwhile:	cmpl %ecx, %ebx		# i == next
			jne .firstwhile		# keep going
						# -else break
.endfirstwhile:		movl %ebx, %eax		# move result (next) to eax



pushl %eax
pushl $intout
call printf
popl %eax
popl %eax
movl $1, %eax
int $0x80
