# Title: Counting 1s of an Integer
# Author: Lance Bernal
# Date: 10-19-2022
# Description: Get integer from user and display how many 1s there are based on it value in binary
# Input: An integer
# Output: Number of 1s
################### Data segment #####################
.data
str:		.asciiz		"Please enter an integer: "
str1:		.asciiz		"\nThe number of 1s is/are: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 4			# service code for printing a string
	la $a0, str			# load address of str to $a0 
	syscall				# print the string
	li $v0, 5			# service code for reading an integer
	syscall				# read integer
	move $t0, $v0			# move the input to $t0

	li $t1, 0			# initialize $t1 to 0
	
count: 					# for counting of 1s
	beq $t0, 0, display		# if $t0 is equal to 0, branch to display
	and $t2, $t0, 1			# perform AND to $t0 and 1
	beq $t2, 0, shift		# if $t2 is equal to 0, branch to shift
	add $t1, $t1, 1			# increment $t1
	
shift: 					# for shifting the binary to right
	srl $t0, $t0, 1			# shift 1 to $t0 to the right
	j count				# jump to count
	
display:				# for displaying the number of 1s
	li $v0, 4			# service code for printing a string
	la $a0, str1			# load address of str1 to $a0 for printitn
	syscall				# print string
	
	li $v0, 1			# service code for printing an integer
	move $a0, $t1			# move to $a0 the value of counter($t1)
	syscall				# print integer
	
	li $v0, 10
	syscall				# syscall to exit the program
	
