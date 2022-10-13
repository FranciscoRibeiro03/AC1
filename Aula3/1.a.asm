	.eqv	READ_INT, 5
	.eqv	PRINT_STR, 4
	.eqv	PRINT_INT10, 1
	
	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos e: "

	.text
	.globl 	main
	
# Mapa de registos
# $t0 -> soma
# $t1 -> value
# $t2 -> i
	
main:	li	$t2, 0			# i = 0
	li	$t0, 0			# soma = 0
	li	$t1, 0
	
for:	bge	$t2, 5, endfor

	li	$v0, PRINT_STR
	la	$a0, str1
	syscall				# print_str(str1)
	
	li	$v0, READ_INT
	syscall
	
	or	$t1, $v0, $0		# read_int()
	
if:	ble	$t1, 0, else
	add	$t0, $t0, $t1 		# soma += value
	j	endif
	
else:	la	$a0, str2
	li	$v0, PRINT_STR
	syscall				# print_str(str2)
	
endif:	addi	$t2, $t2, 1		# i++
	j 	for

endfor:	la	$a0, str3
	li	$v0, PRINT_STR
	syscall				# print_str(str3)
	li	$v0, PRINT_INT10
	move	$a0, $t0
	syscall				# print_int10(soma)
	jr	$ra