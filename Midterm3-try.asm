# Title: Display nth Fibonacci Number
# Author: Lance Bernal
# Date: 11-23-2022
# Description: Get integer from user then display the corresponding number in fibonacci sequence
# Input: An integer
# Output: The corresponding number in Fibonacci Sequence
################### Data segment #####################
.data
str:		.asciiz		"Enter the index number: "
str1:		.asciiz		"\nThe nth number is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
   li $v0, 4				# syscall for printing string
   la $a0, str				# load address of str to $a0 for printing
   syscall				# print string
   li $v0, 5				# syscall for reading integer
   syscall				# read input
   move $t0, $v0			# copy the input to $t0
   beqz $t0, end			# if input is 0, brach to end
   li $t1, 0				# load 0 to $t1
   li $t2, 1				# load 1 to $t2
   addi $t0, $t0, -2			# deduct 2 from the index to accommodate the first 2 numbers of fibonacci sequence
   
loop:
   move $t3, $t1			# move $t1 to $t3(temp)
   move $t1, $t2				# move $t2 to $t1
   addu $t2, $t3, $t2			# add $t2 and $t3 then store to $t2
   addi $t0, $t0, -1			# decrement index
   bgtz	$t0, loop			# branch to loop while $t0 is not equal to 0
   
   li $v0, 4				# syscall for printing string
   la $a0, str1				# load address of str1 to $a0 for printing
   syscall				# print string
   li $v0, 1				# syscall for printing integer
   move $a0, $t2			# move $t2(accumulated sum) to $a0 for printing
   syscall				# print integer
   
   li $v0, 10				# syscall to exit program
   syscall
   
end:
   li $v0, 4				# syscall for printing string
   la $a0, str1				# load address of str1 to $a0 for printing
   syscall				# print string
   li $v0, 1				# syscall for printing integer
   move $a0, $t2			# move $t2(accumulated sum) to $a0 for printing
   syscall				# print integer
   
   li $v0, 10				# syscall to exit program
   syscall
	
	
