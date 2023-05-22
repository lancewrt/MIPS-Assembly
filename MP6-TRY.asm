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
	
	li $s1, 0x12345678 
	li $s2, 0xffff9a00
	
	and $s3,$s1,$s2
	or $s4,$s1,$s2
	xor $s5,$s1,$s2
	nor $s6,$s1,$s2

	li $v0, 10
	syscall				# system call to exit program
