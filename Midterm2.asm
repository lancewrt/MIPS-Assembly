# Title: Getting Sum of Integers from an Array
# Author: Lance Bernal
# Date: 11-23-2022
# Description: Get 10 integers from user, store them in an array, then dispay the sum
# Input: 10 integers
# Output: The sum of all integers
################### Data segment #####################
.data
ints:		.space		40
str:		.asciiz		"Enter 10 integers: \n"
str1: 		.asciiz		"\nThe sum is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
   li $t0, 0				# initialize $t0(the sum) to 0
   li $v0, 4				# syscall for printing string
   la $a0, str				# load address of str to $a0 for printing
   syscall				# print string
   la $t1, ints				# load address of ints(array) to $t1
   la $t6, str				# laod starting address of str for checking loop
   
loop:
   li $v0, 5				# syscall for reading integer
   syscall				# read input
   move $t2, $v0			# move to $t2 the input
   sb $t2, 0($t1)			# load input to $t1 ( the array ints)
   addu $t0, $t0, $t2			# add $t0 and $t2 then store sum to $t0
   addi $t1, $t1, 4			# increment $t1 by 4 to start the next input in the next block
   blt $t1, $t6, loop			# brach to loop if value of $t1 is less than $t6
   
   li $v0, 4				# syscall for printing string
   la $a0, str1				# load address of str1 to $a0 for printing
   syscall				# print string
   
   li $v0, 1				# syscall for printing integer
   move $a0, $t0			# move the value of $t0(the sum) to $a0 for printing
   syscall				# print string
   
   li $v0, 10				# syscall to exit program
   syscall
	
	
	
