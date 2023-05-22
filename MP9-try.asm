# Title: 
# Author: Lance Bernal
# Date: 10-19-2022
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
str:		.asciiz		"Please enter an integer: "
str1:		.asciiz		"Please enter an integer greater than the previous: "
str2: 		.asciiz		"\nThe sum is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 4			# service code for printing a string
	la $a0, str			# load address of str to $a0 for printing
	syscall				# print string
	li $v0, 5			# service code for reading integer
	syscall				# read integer
	move $t0, $v0			# move the input to $t0
	li $v0, 4			# service code for printing a string
	la $a0, str1			# load address of str1 to $a0 for printing
	syscall				# print string
	li $v0, 5			# service code for reading integer
	syscall				# read integer
	move $t1, $v0			# move the input to $t1
	
	move $s0, $t0			# move the value of $t1 t0 to $s0 - this will be the counter
	li $s1, 0			# assign 0 as value of $s1 - this will be the sum

adding:
	addu $s1, $s1, $s0		# add the value of $s1 and $s0 then store the sum on $s1
	addi $s0, $s0, 1		# add value of $s0 and 1 then store to $s0 (increment the counter)
	ble $s0, $t1, adding		# brance to adding if value of $so is less than or equal to $t1
	
	li $v0, 4			# service code for printing string	
	la $a0, str2			# load address of str2 to $a0 for printing
	syscall				# print string
	li $v0, 1			# service code for printing integer
	move $a0, $s1			# move value of $s1 to $a0 for printing
	syscall				# print integer

	li $v0, 10
	syscall				# syscall for exiting the program
