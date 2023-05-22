# Title: 
# Author: Lance Bernal
# Date: 
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
str0:		.asciiz		"Please enter two integers: \n"
str1:		.asciiz		"\nThe answer is: "
number1:	.float		5.2
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
# A + 2B - 5. 2
	lwc1 $f1, number1		# load contents of number 1 to $f1
	li $v0, 4			# service code for printing string
	la $a0, str0			# load address of str0 to $a0 for printing
	syscall				# print string
	li $v0, 5			# service code for reading integer
	syscall				# read integer
	move $s0, $v0			# move contents of $v0 to $s0 
	li $v0, 5			# service code for reading integer
	syscall				# read integer
	move $s1, $v0			# move contents of $v0 to $s1
	
	addu $s1, $s1, $s1		# add the second integer by itself and store to $s1
	addu $s2, $s0, $s1		# add $s1 to the first input and store to $s2
	
	mtc1 $s2, $f2			# move value of $s2 to coprocessor 1 in register $f2
	cvt.s.w $f2, $f2		# service code for converting wors to single precision or float
	
	sub.s $f2, $f2, $f1		# for subtracting single precision or float
	li $v0, 4			# service code for printing a string
	la $a0, str1			# load address of str1 to $a0 for printing
	syscall				# print string
	li $v0, 2			# service code for printing a single precision or fl
	mov.s $f12, $f2			# mode contents of $f2 to $f12 for printing 
	syscall				# print float
	
	li $v0, 10
	syscall				# system call to exit program
