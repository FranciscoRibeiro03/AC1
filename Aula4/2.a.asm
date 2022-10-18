	.eqv	PRINT_10, 1
	.eqv	READ_STR, 8
	.eqv	SIZE, 20
	
	.data
str:	.space 21			# static char str[21]

	.text
	.globl 	main
	
# Mapa de registos
# $t0 -> num
# $t1 -> p

main:	la	$a0, str
	li	$a1, SIZE
	li	$v0, READ_STR
	syscall
	
	li	$t0, 0			# $t0 = 0
	la	$t1, str		# $t1 = p

while:	lb	$t2, 0($t1)		# $t2 = *p
	beq	$t2, '\0', endw

if:	blt	$t2, '0', endif
	bgt	$t2, '9', endif
	addi	$t0, $t0, 1

endif:	addi	$t1, $t1, 1		# p++
	j	while

endw:	move	$a0, $t0
	li	$v0, PRINT_10
	syscall

	jr	$ra