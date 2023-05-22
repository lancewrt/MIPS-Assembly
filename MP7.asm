# Title: Shift Instructions
# Author: Lance Bernal
# Date: 10-13-2022
# Description: For trying shift instructions (sll, srl, sra)
# Input: none
# Output: none
################### Data segment #####################
.data

################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $s1, 0x87654321		# load to $s1 the value 0x87654321
	
	sll $s2,$s1, 16			# shift logical to the left 16 times
	srl $s3,$s1, 8			# shift logical to the right logical
	sra $s4,$s1, 12 		# shift to the right 12 times arithmetic
	
	li $v0, 10
	syscall				# system call to exit program
