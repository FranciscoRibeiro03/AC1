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
	
if:	blt	$t1, 'A', endif
	bgt	$t1, 'Z', endif			#   if (*p >= 'A' && *p <= 'Z') {
	
	li	$t2, 'A'
	subu	$t1, $t1, $t2
	addiu	$t1, $t1, 'a'			#     *p = *p - 'A' + 'a'
	
	sb	$t1, 0($t0)			#   }
	
endif:	addiu	$t0, $t0, 1			#   p++;
	j	while				# }

endw:	li	$v0, PRINT_STR
	la	$a0, str
	syscall
	
	jr	$ra
