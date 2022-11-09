	.eqv SIZE, 3
	.eqv PRINT_STR, 4
	.eqv PRINT_CHAR, 11
	
	.data
array:	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"

	.text
	.globl main
	
main:	li	$t0, 0
	
for:	bge	$t0, SIZE, endfor

	la	$t1, array
	sll	$t2, $t0, 2
	addu	$t2, $t2, $t1
	lw	$a0, 0($t2)
	li	$v0, PRINT_STR
	syscall
	
	li	$v0, PRINT_CHAR
	li	$a0, '\n'
	syscall

	addiu	$t0, $t0, 1
	j	for

endfor:	jr	$ra