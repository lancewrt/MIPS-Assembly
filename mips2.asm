.data
array:      .word       23,-2,45,67,89,12,-100,0,120,6
arrend:

sumMessage: .asciiz     "The sum of the array(sign) is: "
squareMessage:  .asciiz "The sum of the squares(sign) is: "
newLine:    .asciiz     "\n"

    # array = {23,-2,45,67,89,12,-100,0,120,6}
    # the sum of the integers (in array) is 0
    # the square sum of the integers (in array) is 0

    # Algorithm being implemented to sum an array
    # sum = 0 (use $t0 for sum)
    # squarSum = 0 (use %t5 for squarSum)
    # for i = 0 to length-1 do (use $t1 for i)
    # sum = sum + array[i] (use $t2 for length-1)
    # squareSum = squareSum + array[i]*array[i]
    # end for (use $t3 for base addr. of array)

    # registers:
    #   t0 -- sum
    #   t5 -- squarSum
    #
    #   t3 -- pointer to current array element (e.g. arrptr)
    #   t2 -- pointer to end of array
    #
    #   t4 -- current value fetched from array
    #   t6 -- temp to hold squared value

    .text

main:
    li      $t0,0                   # sum = 0
    li      $t5,0                   # squarSum = 0

    la      $t3,array               # load base addr. of array
    la      $t2,arrend              # load address of array end
    j       test

loop:
    lw      $t4,0($t3)              # load array[i]
    addi    $t3,$t3,4               # increment array pointer

    add     $t0,$t0,$t4             # update sum

test:
    blt     $t3,$t2,loop            # more to do? if yes, loop

    # print sum message
    li      $v0,4
    la      $a0,sumMessage
    syscall

    # print value of sum
    li      $v0,1
    addi    $a0,$t0,0
    syscall

    # print new line
    li      $v0,4
    la      $a0,newLine
    syscall

    # print square sum message
    li      $v0,4
    la      $a0,squareMessage
    syscall

    # print value of squareSum
    li      $v0,1
    addi    $a0,$t5,0
    syscall

    li      $v0,10
    syscall