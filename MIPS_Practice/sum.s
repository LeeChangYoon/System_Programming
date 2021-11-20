.text
main:
	addi 	$s0,	$zero,	0	# sum -> $s0
	addi	$s1,	$zero,	0	# count -> $s1
	
	loop:
		bgt	$s1,	10,	exit	#if (count > 0), exit the loop
		add	$s0,	$s0,	$s1
		addi 	$s1,	$s1,	1
		j	loop
		
	exit:
		li 	$v0, 	1			# give print intger command and execute syscall
		addi 	$a0,	$s0, 	0
		syscall
	
		li 	$v0, 	10			# give exit command and execute syscall
		syscall
	
