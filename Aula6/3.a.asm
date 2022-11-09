	.eqv SIZE, 3
	.eqv PRINT_STR, 4
	.eqv PRINT_CHAR, 11
	.eqv PRINT_INT10, 1
	
	.data
array:	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
str4:	.asciiz "\nString #"
str5:	.asciiz ": "

	.text
	.globl main
	
# Mapa de registos:
# i : $t0
# j : $t1
	
main:	li	$t0, 0
	la	$t2, array
	
for:	bge	$t0, SIZE, endfor
	
	li	$v0, PRINT_STR
	la	$a0, str4
	syscall
	
	li	$v0, PRINT_INT10
	move	$a0, $t0
	syscall
	
	li	$v0, PRINT_STR
	la	$a0, str5
	syscall
	
	li	$t1, 0
	
while:	sll	$t3, $t0, 2
	addu	$t3, $t2, $t3
	lw	$t3, 0($t3)
	addu	$t3, $t3, $t1
	lb	$a0, 0($t3)
	beq	$a0, '\0', endw
	
	li	$v0, PRINT_CHAR
	syscall
	
	li	$a0, '-'
	syscall
	
	addiu	$t1, $t1, 1
	
	j	while

endw:	addiu	$t0, $t0, 1
	j	for

endfor:	jr	$ra
