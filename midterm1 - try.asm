# Title: 
# Author: Lance Bernal
# Date: 10-19-2022
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
str:		.asciiz		"Enter an integer: "
str1:		.asciiz		"\nThe factorial is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
   li $v0, 4				# sys code for printing string
   la $a0, str				# load address of str to $a0 for printing
   syscall				# print string
   li $v0, 5				# syscode for reading integer
   syscall				# read integer
   move $s0, $v0			# move integer to $s0
   move $t1, $v0			# move integer to $t1
   li $t0, 1				# load 1 to $t0
loop:
   mulo $t0, $t0, $s0			# multiply $t0, to $s0
   addi $s0, $s0, -1			# decrement 1 from $s0
   bgtz $s0, loop			# brach to loop while $s0 is greater than 0
   
   li $v0, 4				# syscode for printing string
   la $a0, str1				# move str1 to $a0 for printing
   syscall				# print string
   
   li $v0, 1				# syscode for printitng integer
   move $a0, $t0			# move $t0 to $a0 for printitn
   syscall				# print integer
  
   li $v0, 10				# syscall to exit program
   syscall
	
	
	
