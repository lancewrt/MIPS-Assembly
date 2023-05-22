# Title: 
# Author: Lance Bernal
# Date: 
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
name: 		.space		20
str0:		.asciiz		"\nPlease Enter your name: "
str1:		.asciiz		"\nHello, "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 4			# system code for printing a string
	la $a0, str0			# load contents of str0 into $a0 for printing
	syscall				# print the string
	li $v0, 8			# system code for reading string 
	la $a0, name			# load the space allocated from name into $a0

	li $a1, 20			# allot the space (20) from string - so, the maximum string to read is 20
	move $t0, $a0			# copy contents of $a0 into $t0
	syscall				
	li $v0, 4			# system code for printing a string
	la $a0, str1			# load contents of str1 into $a0 for printing
	syscall				# print the string
	li $v0, 4			# system code for printing a string
	la $a0, name			# load the space allocated from name into $a0 for printing 
	move $a0, $t0			# copy the contents of $t0 into $a0
	syscall				# print the string
		
	li $v0, 10
	syscall				# system call to exit program
	


