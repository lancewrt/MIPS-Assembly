# Title: Comparing two Integers
# Author: Lance Bernal
# Date: 10-06-2022
# Description: Get two integers from user and check if they are equal or not
# Input: Two integers from user
# Output: Equal or not equal
################### Data segment #####################
.data
str0:		.asciiz		"\nPlease enter two integers: \n"
str1:		.asciiz		"\nEqual"
str2:		.asciiz		"\nNot Equal"
################### Code segment #####################
.text
.globl 	main
.globl equal
main:					# main function entry
	li $v0, 4			# service code for printing a string
	la $a0, str0			# load address of str0 into $a0 for printing
	syscall				# print the string
	li $v0, 5			# service code for reading an integer
	syscall				# read the first integer from user
	move $t0, $v0			# copy the value of $v0, into $t0
	li $v0, 5			# service code for reading an integer
	syscall				# read second integer from user
	move $t1, $v0			# copy the value of $v0 into $t1
	beq $t0, $t1, equal 		# compare the value of $t0 and $t1, if they are equal jump to equal
	li $v0, 4			# service code for printing a string
	la $a0, str2			# load address of str2 into $a0 for printing
	syscall
	
	li $v0, 10
	syscall				# system call to exit program

equal:
	li $v0, 4			# service code for printing a string
	la $a0, str1			# load address of str1 into $a0 for printing
	syscall				# print the string
	
	li $v0, 10
	syscall				# system call to exit program