# Title: Reading a String 
# Author: Lance Bernal
# Date: 10-06-2022
# Description: Get the name of user then dispay "Hello" before it
# Input: Name of user
# Output: Hello followed by the name of user
################### Data segment #####################
.data
name:		.space		20
str0:		.asciiz		"\nPlease Enter your name: "
str1:		.asciiz		"\nHello, "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 4			# service code for printing a string
	la $a0, str0			# load contents of str0 into $a0 for printing
	syscall				# print the string
	li $v0, 8			# service code for reading a string
	la $a0, name			# load the spcae allocated fron name into $a0
	li $a1, 20			# maximum character the user can enter (20)
	move $t0, $a0			# copy contents of $a0 into $t0
	syscall		
	li $v0, 4			# service code for printing a string
	la $a0, str1			# load contents of str1 into $a0 for printing
	syscall				# print the string
	li $v0, 4			# service code for printing a string
	move $a0, $t0			# copy contents of $t0 into $a0
	syscall
	

	li $v0, 10
	syscall				# system call to exit program


