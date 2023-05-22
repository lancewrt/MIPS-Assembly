# Title: Storing Inputs to an Array
# Author: Lance Bernal
# Date: 10-27-2022
# Description: Get 10 integers from user, then store them in an array, then get the sum
# Input: 10 integers
# Output: The sum
################### Data segment #####################
.data
ints:		.space		40
str:		.asciiz		"Please enter 10 integers: \n"
str1:		.asciiz		"\nThe sum is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $t0, 0			# initialize sum to 0
	li $v0, 4			# system code for printing string
	la $a0, str			# load address of str to $a0 for printing
	syscall				# print string	
	la $t1, ints			# load address of ints to $t1
	la $t6, str			# load starting address of str to $t6 for checking of loop iteration
	
loop:
	li $v0, 5			# system code for reading an integer
	syscall				# read the input
	move $t2, $v0			# move input to $t2
	sb $t2, 0($t1)			# load input to $t1 ( the array ints ) 
	addu $t0, $t0, $t2		# add the sum and the current input of user then store it in $t0
	addi $t1, $t1, 4		# increment $t1 by 4 so that the next inout will start at the next block
	blt $t1, $t6, loop		# brach if the value of $t1 is less than the value of $t6
	
	li $v0, 4			# system code for printing string
	la $a0, str1			# load address of str1 to $a0 for printing
	syscall				# print string
	
	li $v0, 1			# system code for printing of integer
	move $a0, $t0			# move the sum to $a0 for printing
	syscall				# print integer
	
	li $v0,10			# system code for ending program
   	syscall				# exit program
	
	
	
