#################################################################
## File       	: fibo.s
## Author  	: LeeChangYoon
## Written 	: 09.02.2021

## Simple fibonacci function written in MIPS assembly.

## Copyright (C) 2021 Dankook.Univ
##################################################################


#######################	fibo.c ###################################
## int fib(int n) {
## 	if (n <= 1)
## 		return n
## 	else
## 		return fibo(n - 1) + fibo(n - 2)
## }
###################################################################


#######################	fibo.s ####################################
.text
main:
	addi 	$a0, 	$zero, 5
	jal  	fib				# call function 'fibo'
	
	li 	$v0, 	1			# give print intger command and execute syscall
	addi 	$a0,	$v1, 	0
	syscall
	
	li 	$v0, 	10			# give exit command and execute syscall
	syscall


fib:
	bgt	$a0,	1, 	fib_recurse	# if (n > 1), then call fib_recurse
	move 	$v1, 	$a0			#  store $a0 in $v1
	jr	$ra 	
	 
fib_recurse:
	addi 	$sp, 	$sp,	 -12		# we need total 12bytes for int svariables
	sw 	$ra,	0($sp)				
  	sw	$a0, 	4($sp)
  	
  	addi	$a0,	$a0,	-1		
  	jal 	fib				# fib(n - 1)
  	
  	lw 	$a0, 	4($sp)
  	sw	$v1, 	8($sp)
  	
  	add	$a0,	$a0,	-2		
  	jal	fib				# fib(n - 2)
  	
  	lw 	$t0,	8($sp)
  	add	$v1, 	$t0, 	$v1 		# $v1 = fib(n - 1) + fib(n - 2)
  	
  	lw	$ra, 	0($sp)
  	addi 	$sp, 	$sp, 	12
	jr 	$ra  	
  	
  	
  	
  	
  	
  	
  	
