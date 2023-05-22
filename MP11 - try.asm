# Title: 
# Author: Lance Bernal
# Date: 10-19-2022
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
ints:		.space		40
str:		.asciiz		"Please enter 10 integers: \n"
str1:		.asciiz		"\nThe sum is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $t0, 0	# initial sum = 0
	li $v0, 4
	la $a0, str	
	syscall		# print string
	la $t1, ints	# load address of ints to $t1
	la $t6, str	# load starting address of str to $t6 for checking of limit
	
loop:
	li $v0, 5	# get integers
	syscall
	move $t2, $v0 	# move input to $t2
	
	sb $t2, 0($t1)	# load input to $t1 (the array ints)
	addu $t0, $t0, $t2	# add the input and the sum
	addi $t1, $t1, 4  #increment array pointer by 4 to start the input at the next block
	blt $t1, $t6, loop	# if $t1 is less than $t6, it will jump to label loop
	
	li $v0, 4	# system code for printitng string
	la $a0, str1	# load address of str1 to $a0 for printing
	syscall		# print string
	
	li $v0, 1	# system code for printitn integer
	move $a0, $t0	# move $t0 to $a0 for printitn
	syscall		# print integer
	
	li $v0,10	
   	syscall
	
	
	
