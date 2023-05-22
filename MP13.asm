# Title: Performing Division Instruction 
# Author: Lance Bernal
# Date: 11-09-2022
# Description: Perform division instruction and check the value of HI and LO registers
# Input: None
# Output: The value of HI and LO registers
################### Data segment #####################
.data
str:		.asciiz		"The value of HI register is: "
str1:		.asciiz		"\nThe value of LO register is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
   #li $s0, 98765			# load to $s0 the given number (98765)
   #li $s1, 54321			# load to $s1 the given number (54321)
   li $s0, -98765			# load to $s0 the given number (-98765)
   li $s1, -54321			# load to $s1 the given number (-54321)
   #divu $s0, $s1			# multiply the value of $s1 and $s0
   div $s0, $s1			# multiply the value of $s1 and $s0
   mfhi $t0				# move the value of HI register to $t0
   mflo $t1				# move the value of LO register to $t1
   
   li $v0, 4				# system code for printing string
   la $a0, str				# move str to $a0 for printing
   syscall				# print string
   li $v0, 1				# system code for printing integer
   move $a0, $t0			# move $t0 to $a0 for printing
   syscall				# print integer
   
   li $v0, 4				# system code for printing string
   la $a0, str1				# move str1 to $a0 for printing
   syscall				# print string
   li $v0, 1				# system code for printing integer
   move $a0, $t1			# move $t1 to $a0 for printing
   syscall				# print integer
   
   li $v0, 10				# syscall to exit program
   syscall
	
	
	
