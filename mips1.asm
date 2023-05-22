.data
prompt: .asciiz "\nPlease Enter A :  " 
prompt1: .asciiz "\nPlease Enter B :  "
prompt2: .asciiz "\nThe answer is: "
number: .float 5.2 

.globl main
.text
main:
li $v0,4
la $a0,prompt   #it will print prompt
syscall
li $v0,5
syscall  #ask user input
move $t1,$v0  #save a to t1

li $v0,4
la $a0,prompt1   #it will print prompt
syscall
li $v0,5
syscall  #ask user input
move $t2,$v0  #save a to t1

lwc1 $f1, number
#li $v0,4
#la $a0,prompt 
#syscall

addu $t2,$t2, $t2 #get 2B
addu $t3,$t1,$t2 #get A+2B

mtc1 $t3, $f2
cvt.s.w  $f2, $f2
sub.s $f3, $f2, $f1
#sub $a0,$a0,5 #get A+2B-5

li $v0,4
la $a0,prompt2   #it will print prompt
syscall
li $v0,2
mov.s $f12,$f3 
syscall

li $v0,10
syscall  #print