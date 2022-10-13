	.data
	.text
	.globl main
	
main:	ori	$t0, $0, 0x78	# Valor em gray

	or	$t1, $0, $t0	# num = gray
	
	srl	$t3, $t1, 4	# num >> 4
	xor	$t1, $t1, $t3	# num = num ^ (num >> 4)
	
	srl	$t3, $t1, 2	# num >> 2
	xor	$t1, $t1, $t3	# num = num ^ (num >> 2)
	
	srl	$t3, $t1, 1	# num >> 1
	xor	$t1, $t1, $t3	# num = num ^ (num >> 1)
	
	or	$t2, $0, $t1	# bin = num
	
	jr	$ra