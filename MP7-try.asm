# Title: 
# Author: Lance Bernal
# Date: 
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data

################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $s1, 0x87654321
	sll $s2, $s1, 16
	srl $s3, $s1, 8
	sra $s4, $s1, 12
	
	li $v0, 10
	syscall				# system call to exit program
