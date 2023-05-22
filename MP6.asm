# Title: Logical Bitwise Instructions
# Author: Lance Bernal
# Date: 10-12-2022
# Description: For testing of logical bitwise instruction 
# Input: none
# Output: none
################### Data segment #####################
.data

################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $s1, 0x12345678		# load to $s1 the address 0x12345678
	li $s2, 0xffff9a00		# load to $s2 the address 0xffff9a00
	
	and $s3, $s1, $s2		# store the result in $s3
	or $s4, $s1, $s2		# store the result in $s4
	xor $s5, $s1, $s2		# store the result in $s5
	nor $s6, $s1, $2		# store the result in $s6
	
	li $v0, 10
	syscall				# system call to exit program
