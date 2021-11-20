#################################################################
## File       	: strcpy.s
## Author  	: LeeChangYoon
## Written 	: 11.20.2021

## Simple strcpy function written in MIPS assembly.

## Copyright (C) 2021 Dankook.Univ
##################################################################


#######################	strcpy.c #################################
## int strcpy(char x[], char y[]) {
## 	int i;
##	i = 0;
## 	while((x[i] = y[i]) != '\0') i += 1;
## }
###################################################################


#######################	strcpy.s ##################################
.data
x: .asciiz "qwer"
y: .asciiz "qwer1234"

.text
main:
	la	$a1,	x		# base address of x is in $a1
	la	$a2,	y		# base address of y is in $a2
	jal	strcpy			# call function 'strcpy'
	
	li	$v0,	4
	la	$a0,	0($a1)
	syscall
	
	li	$v0,	10
	syscall
	
strcpy:
	addi	$sp,	$sp,	-8
	sw	$ra,	0($sp)
	sw	$s0,	4($sp)		# int i;
	add	$s0,	$zero,	$zero	# i = 0;
	
L1:
	add	$t1,	$a2,	$s0
	lb	$t2,	0($t1)
	
	add 	$t3,	$a1,	$s0
	sb	$t2,	0($t3)		# x[i] = y[i]s
	
	beq	$t2,	$zero,	L2	# ((x[i] = y[i]) == '\0')?
	addi	$s0,	$s0,	1	# i += 1;
	jal 	L1
	
L2:
	lw	$ra,	0($sp)
	lw	$s0,	4($sp)
	addi	$sp,	$sp,	4
	jr	$ra
