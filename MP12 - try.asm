# Title: 
# Author: Lance Bernal
# Date: 10-19-2022
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data
str:		.asciiz		"\nThe value of LO register is: "
str1:		.asciiz		"\nThe value of HI register is: "
################### Code segment #####################
.text
.globl 	main
main:					# main function entry
   li $s0, 98765       #s0 register stores the value 98765
   li $s1, 54321       #s1 register stores the value 54321     
   mult $s0, $s1      #s0 will be multiplied by s1     
   mfhi $t0            #high 32 bits of the product register will be stored in register t0
   mflo $t1            #low 32 bits of the product register will be stored in register t1
   
   li, $v0, 4
   la $a0, str
   syscall
   li $v0, 1
   move $a0, $t1
   syscall
   li $v0, 4
   la $a0, str1
   syscall
   li $v0, 1
   move $a0, $t0
   syscall
   
   #add $a0, $t0, $t1
   #li $v0, 1
   #syscall
   li $v0, 10
   syscall
	
	
	
