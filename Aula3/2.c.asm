	.eqv	READ_INT, 5
	.eqv	PRINT_STR, 4
	.eqv	PRINT_CHAR, 11
	
	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "\nO valor em binario e:"

	.text
	.globl 	main
	
# Mapa de registos
# $t0 -> value
# $t1 -> bit
# $t2 -> i
# $t3 -> remainder
	
main:	li	$t0, 0			# value = 0
	li	$t1, 0			# bit = 0
	li	$t2, 0			# i = 0
	
	li	$v0, PRINT_STR
	la	$a0, str1
	syscall				# print_str(str1)
	
	li	$v0, READ_INT
	syscall
	or	$t0, $v0, $0		# value = read_int()
	
	li	$v0, PRINT_STR
	la	$a0, str2
	syscall				# print_str(str2)
	
for:	bge	$t2, 32, endfor
	andi	$t1, $t0, 0x80000000	# bit = value & 0x80000000
	srl	$t1, $t1, 31		# bit = bit >> 31
	
if:	rem	$t3, $t2, 4		# remainder = i % 4
	bnez	$t3, endif
	li	$v0, PRINT_CHAR
	li	$a0, ' '
	syscall				# print_char(' ')

endif:	addi	$a0, $t1, '0'
	li	$v0, PRINT_CHAR
	syscall				# print_char('0' + bit)
	sll	$t0, $t0, 1		# value = value << 1
	addi	$t2, $t2, 1		# i++
	
	j	for
	
endfor:	jr	$ra
