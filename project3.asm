# Title: Sum of Three Integers
# Author: Lance Bernal
# Date: 10-05-2022
# Description: Get three integers from user and display the sum of the three integers
# Input: The three integers from user
# Output: The sum of the three integers
################### Data segment #####################
.data
prompt: 	.asciiz		"Please enter three numbers: \n"
sum_msg:	.asciiz		"The sum is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	la $a0, prompt			# display prompt string
	li $v0, 4
	syscall
	li $v0, 5			# read first integer from user into $t0
	syscall
	move $t0, $v0
	
	li $v0, 5			# read second integer fro user into $t1
	syscall
	move $t1, $v0
	
	li $v0, 5			# read third integer from user into $t2
	syscall
	move $t2, $v0
	
	addu $t0, $t0, $t1		# get the sum of $t0 and $t1 then store it back in $t0
	addu $t0, $t0, $t2		# get the sum of $t0 and $t2 then store it back to $t0
	
	la $a0, sum_msg			# write the sum message
	li $v0, 4
	syscall
	move $a0, $t0			# output sum
	li $v0, 1
	syscall

	li $v0, 10
	syscall				# system call to exit program


