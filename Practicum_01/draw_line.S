.global draw_line

.data
/* {{{{{{{ */
// Fuegen Sie gegebenenfalls hier Variablen hinzu.
/* }}}}}}} */

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

/* {{{{{{{ */
// Implementieren Sie hier Ihre Loesung.
// Lassen Sie das Register %ebp unveraendert.
/* }}}}}}} */

	movl %ebp, %esp
	popa
	ret
