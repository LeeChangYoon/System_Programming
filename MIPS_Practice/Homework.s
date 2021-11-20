.data
msg: .asciiz "\nSuccess!\n"
save: .space 10

.text
main:	
	# i -> $s3
	# k -> $s5
	# save -> $s6
	addi	$s3,	$zero,	0
	addi 	$s5,	$zero,	5
	sb	$s6,	save($zero)
	 
	loop:
		sll	$t1,	$s3,	2	# $t1 = i * 4
		add	$t1,	$t1,	$s6	# $t1 = address of save[i] 
		lw	$t0,	0($t1)		# $t0 = value of save[i]
		bne 	$t0,	$s5,	exit	# if (save[i] != k) -> exit
		addi	$s3,	$s3,	1	# i += 1
		j	loop			# go back to the loop
			
	exit:
		li $v0, 4
		la $a0, msg
		syscall

		li $v0, 10
		syscall
			
