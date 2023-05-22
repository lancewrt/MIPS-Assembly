# Title: 
# Author: Lance Bernal
# Date: 
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
str1:		.asciiz		"Enter an integer value: "
str2:		.asciiz		"You entered "
str3: 		.asciiz		"\nThe integer doubled is "
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
	li $v0, 4			# service code for printing sring
	la $a0, str3			# load address of str3 into $a0
	syscall
	addu $s0, $s0, $s0
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 10
	syscall				# system call to exit program


