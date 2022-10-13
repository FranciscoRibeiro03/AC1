	.data
	.text
	.globl main

main:	ori	$t0, $0, 6	# Valor em binário
	
	srl	$t1, $t0, 1	# Shift lógico para a direita (bin >> 1)
	xor	$t1, $t0, $t1	# Xor (bin ^ (bin >> 1))
	
	jr	$ra