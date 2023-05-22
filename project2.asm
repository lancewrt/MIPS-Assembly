# Title: Reading and Printing an Integer
# Author: Lance Bernal
# Date: 10-05-2022
# Description: For getting an input from user and diplaying the input
# Input: An integer from user
# Output: The integer entered by the user
################### Data segment #####################
.data

################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 5			# Read integer
	syscall				# %v0 = value read
	
	move $a0, $v0			#$a0 = value to print
	li $v0, 1			#print the integer
	syscall

	li $v0, 10
	syscall				# system call to exit program


