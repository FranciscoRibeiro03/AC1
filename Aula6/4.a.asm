	.eqv PRINT_STR, 4
	.eqv PRINT_INT10, 1
	
	.data
str1:	.asciiz	"Nr. de parametros: "
str2:	.asciiz	"\nP"
str3:	.asciiz	": "

	.text
	.globl main
	
# Mapa de registos:
# i    : $t0
# argc : $t1
# argv : $t2
	
main:	li	$t0, 0
	move	$t1, $a0
	move	$t2, $a1
	
	li	$v0, PRINT_STR
	la	$a0, str1
	syscall
	
	li	$v0, PRINT_INT10
	move	$a0, $t1
	syscall
	
for:	bge	$t0, $t1, endf

	li	$v0, PRINT_STR
	la	$a0, str2
	syscall
	
	li	$v0, PRINT_INT10
	move	$a0, $t0
	syscall
	
	li	$v0, PRINT_STR
	la	$a0, str3
	syscall
	
	sll	$a0, $t0, 2
	addu	$a0, $a0, $t2
	lw	$a0, 0($a0)
	syscall
	
	addiu	$t0, $t0, 1
	j	for

endf:	jr	$ra