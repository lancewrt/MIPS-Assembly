# Title: 
# Author: Lance Bernal
# Date: 10-19-2022
# Description: 
# Input: 
# Output: 
################### Data segment #####################
.data

################### Code segment #####################
.text
.globl 	main
main:					# main function entry
   
   li $v0, 10				# syscall to exit program
   syscall
	
	
	
