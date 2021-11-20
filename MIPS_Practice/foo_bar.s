.data
	x: 	.asciiz "ABCDEFG\n"
	y: 	.asciiz "abcdefg\n"

.text
main:
	li 	$v0,	4
	la 	$a0,	x
	syscall
	
	li 	$v0,	4
	la 	$a0,	y
	syscall
	
	la 	$a0,	x
	la 	$a1,	y
	jal 	strcpy
	
	li 	$v0,	4
	la 	$a0,	x
	syscall
	li 	$v0,	4
	la 	$a0,	y
	li 	$v0,	10
	syscall
	
strcpy:
	addi 	$sp, 	$sp, 	-4
	sw 	$s0, 	0($sp)
	add 	$s0, 	$zero, 	$zero

L1: 
	add 	$t1, 	$s0, 	$a1
	lb 	$t2, 	0($t1)
	add 	$t3, 	$s0, 	$a0
	sb 	$t2, 	0($t3)
	beq 	$t2, 	$zero, 	L2
	addi 	$s0, 	$s0, 	1
	j 	L1

L2: 
	lw 	$s0, 	0($sp)
	addi 	$sp, 	$sp, 	4
	jr 	$ra