# Title: Performing an Equation
# Author: Lance Bernal
# Date: 10-12-2022
# Description: Perform (A + 2B - 5. 2) using the input of user
# Input: Two integers
# Output: The product of the equation
################### Data segment #####################
.data
str0:		.asciiz		"Please enter two integers: \n"
str1:		.asciiz		"The answer is: "
number:		.float		5.2
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	lwc1 $f1, number		# load number into coprocessor in register $f1
	li $v0, 4			# service code for printing string
	la $a0, str0			# load address of str0 to $a0 for printing
	syscall				# print string
	li $v0, 5			# service code for reafing integer
	syscall				# read integer
	move $s0, $v0			# copy contents of $v0 to $s0
	li $v0, 5			# service code for reafing integer
	syscall				# read integer
	move $s1, $v0			# copy contents of $v0 to $s1
	
	addu $s1, $s1, $s1		# add the second integer to itself then store to $s1
	addu $s2, $s1, $s0		# add the sum of $s1 to $s0, then store to $s2
	
	mtc1 $s2, $f2			# move $s2 to coprocessor in register $f2
	cvt.s.w $f2, $f2		# convert the integer into single precision float

	sub.s $f3, $f2, $f1		# subtract $f1 to $f2 and store the difference in $f3
	
	li $v0, 4			# service code for printing string
	la $a0, str1			# load address of str1 to $a0 for printing
	syscall				# print string
	li $v0, 2			# service code for printing float
	mov.s $f12, $f3			# move contents of $f2 to $f12 for printing
	syscall				# print float	
	
	
	li $v0, 10
	syscall				# system call to exit program
