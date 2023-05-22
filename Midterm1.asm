# Title: Getting Factorial of an Integer
# Author: Lance Bernal
# Date: 11-23-2022
# Description: Get input integer from then compute for the factorial then display the product. Identify the maximum 32-bit value 
# Input: Integer
# Output: The factorial of the integer
################### Data segment #####################
.data
str:		.asciiz		"Enter an integer: "
str1:		.asciiz		"\nThe factorial is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
   li $v0, 4				# syscall for printing string
   la $a0, str				# load address of str to $a0 for printing
   syscall				# print string
   li $v0, 5				# syscall for reading integer
   syscall				# read integer
   move $s0, $v0			# copy input to $s0
   move $t1, $v0			# copy input to $t1
   li $t0, 1				# load 1 to $t0 

loop:
   mulo $t0, $t0, $s0			# multipy $s0 and $t0 then store to $t0
   addi $s0, $s0, -1			# decrement 1 from $s0
   bgtz	$s0, loop				# brach to loop while $s0 is greater than 0
   
   li $v0, 4				# syscall for printing string
   la $a0, str1   			# load address of str1 to $a0 for printing
   syscall				# print string
   li $v0, 1				# syscall for printing integer
   move $a0, $t0			# move $t0 to $a0 for printing
   syscall				# print integer
   
   li $v0, 10				# syscall to exit program
   syscall
	
	
	
