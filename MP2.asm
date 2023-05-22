# Title: MP2 Ask User if They Want to Repeat
# Author: Lance Bernal
# Date: 10-05-2022
# Description: Modified version of MP1 with the addition of giving user the choice of repetition of program
# Input: An integer from user, charater - y to repeat, other for exit
# Output: The integer, the integer doubled, then if user press y - the program will rerun
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
	li $v0, 4			# service code for printing string
	la $a0, str4			# load contents of str4 to $a0
	syscall				# print the sting
	li $t0, 'y'			# assign y as the value of $t0
	li $v0, 12			# service code for reading of character
	syscall				# read the character entered by user
	move $t1, $v0			# copy value of $v0, to $t1
	beq $t0, $t1, main		# check if the contents of $t0 and $t1 are equal, if they are go to main	
	syscall
	li $v0, 10
	syscall				# system call to exit program


