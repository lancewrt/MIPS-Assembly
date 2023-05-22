# Title: Getting the sum from range of integer
# Author: Lance Bernal
# Date: 10-19-2022
# Description: The program will ask for two integers, this will be the range from when will the addition start and end
# Input: Two integers of different values
# Output: The sum from n1 to n2
################### Data segment #####################
.data
str: 		.asciiz		"Please enter an integer: "
str1:		.asciiz		"Please enter an intger greater than the previous: "
str2:		.asciiz		"\nThe sum is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 4			# service code for printing string
	la $a0, str			# load address of str to $a0 for printing
	syscall				# print string
	li $v0, 5			# service code for reading an integer
	syscall				# read an integer
	move $t0, $v0			# store to $t0 the input of user
	li $v0, 4			# service code for printing string
	la $a0, str1			# load address of str1 to $a0 for printing
	syscall				# print string
	li $v0, 5			# service code for reading an integer
	syscall				# read an integer
	move $t1, $v0			# store to $t1 the input of user
	
	move $s0, $t0			# move the value of $t0 to $s0 - this will be the start of counter
	li $s1, 0			# assign 0 as value of $s1 - this will be use for storing the sum

adding:
	addu $s1, $s1, $s0		# add the value of $s1 and $s0 then store the sum to $s1
	addi $s0, $s0, 1		# add 1 to the value of $s0 which is our counter
	ble $s0, $t1, adding		# brach to adding if the value of %s0 is less or equal than $t1
	
	li $v0, 4			# service code for printing string
	la $a0, str2			# load address of str2 to $ao for printing
	syscall				# print the string
	li $v0, 1			# service code for printing an integer
	move $a0, $s1			# move to $a0 the value of $s1(sum)
	syscall				# print the integer

	li $v0, 10
	syscall				# system call to exit program