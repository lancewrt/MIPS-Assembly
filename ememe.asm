.data    
 myarray:.space 40        
 st:.asciiz "Enter the 10 Elements\n"    
 st1: .asciiz "\nThe sum is: "  
 
.text 
 
 main:         
   li $v0,4     
   la $a0,st     
   syscall     
   jal fun     
   li $v0,10    
    syscall 
     
 fun:    
	beq $t0,40,exit         
    li $v0,5    
    syscall    
       
    sw $v0,myarray($t0)   
    add $t0,$t0,4     
    add $t1, $t1, $v0     
    sub $t2, $t2, $v0   
    j fun  
           
    exit:     
    
    li $v0, 4
    la $a0, st1
    syscall   
    add $a0, $zero, $t1  
    li  $v0, 1     
    syscall     
    jr $ra