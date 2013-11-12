.data
inout:	.string	"Wert %d\n"
n:	.long	1
x:	.long	2
y:	.long	4
.text
.globl main
main:
pushl n
pushl x
pushl y
subl $4, %esp 
call sudan_function


popl %eax			# Das Ergebnis in eax
addl $12, %esp			# 3 Parameter entfernen
jmp output



sudan_function:
pushl %ebp			# ebp sichern
movl %esp, %ebp			# ebp verschieben
pushl %eax			# alle drei register sichern
pushl %ebx
pushl %ecx

# stack status: [n, x, y, result, ret, ebp, eax, ebx, ecx ]

movl 12(%ebp), %eax		# y in %eax
movl 16(%ebp), %ebx		# x in %ebx
movl 20(%ebp), %ecx		# n in %ecx

cmpl $0, %ecx			# n == 0
jne n_not_equal_zero
addl  %eax, %ebx                # y + x = ebx
movl %ebx, 8(%ebp)              # Ergebnis auf den Stack legen
jmp return

n_not_equal_zero:

cmpl $0, %eax			# y == 0
jne y_not_equal_zero
movl %ebx, 8(%ebp)		# x auf den Stack legen
jmp return

y_not_equal_zero:

// erster Funktionsaufruf
decl %eax			# y - 1 = eax
pushl %ecx			# n wird als Parameter auf den Stack gelegt
pushl %ebx			# x wird als Parameter auf den Stack gelegt
pushl %eax			# y -1 wird als Parameter auf den Stack gelegt
subl $4, %esp			# Slot for das Ergebnis
call sudan_function		# Funktionsaufruf Sudan um t1 zu bestimmen

// Parameter vorbereiten
incl %eax			# y + 1 um y zurückzusetzen
decl %ecx			# n - 1 = ecx
popl %ebx			# t1 = ebx
addl %ebx, %eax			# t1 + y = eax
addl $12, %esp			# 3 Parameter entfernen


// zweiter Funktionsaufruf
pushl %ecx			# n -1  auf den Stack
pushl %ebx			# t1 auf den Stack
pushl %eax			# t1 + y auf den Stack
subl $4, %esp			# Ergebnisslot
call sudan_function


popl %eax			# Ergebnis in eax
addl $12, %esp			# 3 Parameter entfernen
movl %eax, 8(%ebp)		# eax ist im Ergebnisslot



return:
popl %ecx
popl %ebx
popl %eax
popl %ebp
ret



output:
# Wert im %eax ausgeben
pushl	%eax
pushl	$inout
call	printf
addl	$8, %esp

movl	$1, %eax
int	$0x80
