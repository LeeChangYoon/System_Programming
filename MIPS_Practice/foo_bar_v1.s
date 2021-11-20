.text
main:
	jal 	foo	
	li 	$v0,	10
	syscall
	
foo:
	addi	$sp,	$sp,	-4
	sw 	$ra,	0($sp)
	jal 	bar
	
	lw 	$ra, 	0($sp)
	addi	$sp,	$sp,	4
	jr	$ra
	
bar:
	jr	$ra