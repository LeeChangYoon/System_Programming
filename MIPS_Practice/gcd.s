#################################################################
## File       	: gcd.s
## Author  	: LeeChangYoon
## Written 	: 11.20.2021

## Simple gcd function written in MIPS assembly.

## Copyright (C) 2021 Dankook.Univ
##################################################################


#######################	gcd.c ####################################
## int gcd(int a, int b) {
## 	if (a < b) 
##		return gcd(b - a, a);
##	else if (b < a) 
##		return gcd(a - b, b);
##	else	
##		return b;
## }
###################################################################


#######################	gcd.s ####################################
.text
main:
	addi	$a1, 	$zero,	24	# a = 24
	addi	$a2,	$zero,	18	# b = 18
	jal	gcd			# function call gcd
	
	li	$v0,	1		# give print intger command and execute syscall
	add	$a0,	$v1,	$zero
	syscall
	
	li	$v0,	10		# give exit command and execute syscall
	syscall

gcd:
	addi	$sp,	$sp,	-4
	sw	$ra,	0($sp)		# store the return register
	
	slt	$t0,	$a1,	$a2	# (a < b)?
	bne	$t0,	$zero,	L1	# return gcd(b - a, a)
	
	slt 	$t1,	$a2,	$a1	# (b < a)?
	bne	$t1,	$zero,	L2	# return gcd(a - b, b)
	
	add	$v1,	$a2,	$zero	# return b
	lw	$ra,	0($sp)
	addi	$sp,	$sp,	4
	jr	$ra

L1:
	sub	$t2,	$a2,	$a1	# a = b - a, b = a
	add	$t3,	$a1,	$zero
	add	$a1,	$t2,	$zero	
	add	$a2,	$t3,	$zero
	jal	gcd
	
	lw	$ra,	0($sp)
	addi	$sp,	$sp,	4
	jr	$ra

L2:
	sub	$t2,	$a1,	$a2	# a = a - b, b = b
	add	$t3,	$a2,	$zero
	add	$a1,	$t2,	$zero
	add	$a2,	$t3,	$zero
	jal	gcd
	
	lw	$ra,	0($sp)
	addi	$sp,	$sp,	4
	jr	$ra