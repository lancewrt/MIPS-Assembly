# Title: 
# Author: Lance Bernal
# Date: 
# Description: 
# Input: 
# Output: 
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
	li $v0, 4
	la $a0, str0
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 5
	syscall
	move $t1, $v0
	beq $t0, $t1, equal
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 10
	syscall				# system call to exit program

equal: 
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 10
	syscall				# system call to exit program
