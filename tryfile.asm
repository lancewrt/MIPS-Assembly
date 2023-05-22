# Title: 
# Author: Lance Bernal
# Date: 10-19-2022
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
outfile:	.asciiz		"out.txt"
msg:		.asciiz		"Sir exempted po ako sa project no. 3. Ako po yung nag present sa class heheh"
################### Code segment #####################
.text
	li $v0, 13
	la $a0, outfile
	li $a1, 1
	syscall
	move $s0, $v0
	li $v0, 15
	move $a0, $s0
	la $a1, msg
	li $a2, 76
	syscall
	li $v0, 16
	move $a0, $s0
	syscall
.globl 	main
main:					# main function entry

	
