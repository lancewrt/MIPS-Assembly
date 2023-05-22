# Title: Displaying Number of 1s
# Author: Lance Bernal
# Date: 10-19-2022
# Description: Gets integer from user and read how many 1s are in the binary form f that integer
# Input: An integer
# Output: Number of 1s
################### Data segment #####################
.data
str:		.asciiz		"Please enter an integer: "
str1:		.asciiz		"\nThe number of 1s is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
	li $v0, 4			# service code for printing string
	la $a0, str			# load address of str to $a0 for printing
	syscall				# print string
	li $v0, 5			# service code for reding an integer
	syscall				# read the input
	move $t0, $v0			# move the input to $t0
	
	li $t1, 0			# initialize $t1 to 0 for counting of 1s
	
	j count				# jump to count
	
count: # for counting the 1s
	beq $t0, 0, display		# if the $t0 is equal to 0, branch to diplay
	and $t2, $t0, 1			# perform AND to the user input and store it to $t2
	beq $t2, 0, shift		# if $t2 is equal to 0, branch to shift
	add $t1, $t1, 1 		# increment count	

shift: # for sifting the binary
	srl $t0, $t0, 1			# shift the binary to right by 1 then store to $t0
	j count				# jump to count
	
display:
	#display the results
	la $a0, str1
	li $v0, 4
	syscall
    
	#print int
	move $a0, $t1
	li $v0, 1
	syscall

	li $v0, 10
	syscall				# system call to exit program
