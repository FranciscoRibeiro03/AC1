	.eqv PRINT_STR, 4
	.eqv READ_STR, 8
	.eqv SIZE, 20
	
	.data
str1:	.asciiz "Introduza uma string: "
str:	.space 21				# static char str[SIZE+1];

	.text
	.globl main
	
# Mapa de registos
#  p -> $t0
# *p -> $t1

main:	li	$v0, PRINT_STR
	la	$a0, str1
	syscall					# print_string("Introduza uma string: ");
	
	li	$v0, READ_STR
	la	$a0, str
	li	$a1, SIZE
	syscall					# read_string(str, SIZE);
	
	la	$t0, str			# p = str;
	
while:	lb	$t1, 0($t0)			# *p
	beq	$t1, '\0', endw			# while (*p != '\0') {
	
	li	$t2, 'a'
	subu	$t1, $t1, $t2
	addiu	$t1, $t1, 'A'			#   *p = *p - 'a' + 'A'
	
	sb	$t1, 0($t0)
	addiu	$t0, $t0, 1			#   p++;
	j	while				# }

endw:	li	$v0, PRINT_STR
	la	$a0, str
	syscall
	
	jr	$ra