# Title: Compute Address of Array
# Author: Lance Bernal
# Date: 10-26-2022
# Description: Compute the addresses of given array
# Input: none
# Output: none
################### Data segment #####################
.data
arr1: .word 5:20 
arr2: .half 7, -2, 8, -6 
arr3: .space 100 
str1: .asciiz "This is a message" 
str2: .asciiz "Another important string" 
################### Code segment #####################
.text
.globl 	main
main:					# main function entry

