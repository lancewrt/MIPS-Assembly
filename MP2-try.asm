# Title: MP1 Doubling the Entered Integer
# Author: Lance Bernal
# Date: 10-05-2022
# Description: Double the integer entered by the user
# Input: An integer from user
# Output: The integer and the integer doubled
################### Data segment #####################
.data
str1:		.asciiz		"\nEnter an integer value: "
str2:		.asciiz		"You entered "
str3: 		.asciiz		"\nThe integer doubled is "
str4:		.asciiz		"\nDo you want to repeat? [y/n]" 
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 4			# service code for printing sring
	la $a0, str1			# load address of str1 into $a0
	syscall				# print str1 string
	li $v0, 5			# service code for reading an integer entered by the user
	syscall				# read integer input into $v0
	move $s0, $v0			# save entered integer to $s0
	li $v0, 4			# service code for printing a string
	la $a0, str2			# load address of str2 into $a0
	syscall				# print str2 string 
	li $v0, 1			# service code for print integer
	move $a0, $s0			# copy integer value of $s0, into $a0
	syscall				# print the integer
	li $v0, 4			# service code for print string
	la $a0, str3			# load the sring from str3 into $a0
	syscall				# print the string
	addu $s0, $s0, $s0		# store the sum of the integer
	li $v0, 1			# service code for print integer
	move $a0, $s0			# copy value of $s0 into $a0 for print integer
	syscall 			# print the integer
	li $v0, 4
	la $a0, str4
	syscall
	li $t0, 'y'
	li $v0, 12
	syscall
	move $t1, $v0
	beq $t0, $t1,main

	
	
	
	li $v0, 10
	syscall				# system call to exit program


