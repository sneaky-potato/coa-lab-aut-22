#########################################
## COA LAB Assignment 2 Q1             ##
## Group Number 23                     ##
## Ashwani Kumar Kamal (20CS10011)     ##
## Astitva (20CS30007)                 ##
#########################################

# This program computes the product of twp 16 bit signed integers a and b using Booth's Multiplication Algorithm
# where a and b are entered by the user.
# 
    .globl main

    .data
# program output text constants
prompta:
    .asciiz "Enter first number:"
promptb:
    .asciiz "Enter second number:"
err:                                                               
    .asciiz "Both the numbers are not in proper numerical range (16 bit). Try again."
output:
    .asciiz "Product of the two numbers are: "

newline:
    .asciiz "\n"

    .text 

# main program
#
# program variables
#   a:              $s0
#   b:              $s1
#   lastBit:        $s3
#   counter:        $s5
#   result product: $s1
#


main:
    li      $t0, -32768                             # minimum possible 16-bit number
    li      $t1, 32767                              # maximum possible 16-bit number  

    li      $v0, 4
    la      $a0, prompta
    syscall

    li      $v0, 5
    syscall
    move    $s0, $v0                                # input a

    li      $v0, 4
    la      $a0, promptb
    syscall

    li      $v0, 5
    syscall
    move    $s1, $v0                                # input b


    blt     $s0, $t0, error                         # if a < -32768, jump to error
    blt     $t1, $s0, error                         # if a > 32767, jump to error

    blt     $s1, $t0, error                         # if b < -32768, jump to error
    blt     $t1, $s1, error                         # if b > 32767, jump to error

    andi    $s1, $s1, 0x0000ffff                    # b & 0x0000ffff (take last 16 bits)

    sll     $s0, $s0, 16                            # shift into upper halfword (for addition) (left shift by 16)
    
    li      $s4, 0                                  # saving the additional bit (last bit)
    li      $s5, 16                                 # counter (n bits == 16 bits in this case)

loop:
    andi    $s3, $s1, 1                             # $s3 = LSB($s1)
    beq     $s3, $s4, endloop                       # 00 or 11 -> continue to arithmetic shift
    beq     $s3, $zero, increment                   # 01 -> proceed to increment (b = b + a)
    sub     $s1, $s1, $s0                           # proceed to decrement (b = b - a)
    j       endloop                                 # continue to arithmetic shift

increment:
    add     $s1, $s1, $s0                           # b = b + a

endloop:
    sra     $s1, $s1, 1                             # arithmetic right shift
    addi    $s5, -1                                 # decrease counter by 1
    move    $s4, $s3                    
    bgt     $s5, $zero, loop                        # continue loop if counter > 0
    
    li      $v0, 4
    la      $a0, output                             # issue output prompt
    syscall

    li      $v0, 1              
    move    $a0, $s1                                # print answer
    syscall 

    j endf

error:
    li      $v0, 4
    la      $a0, err                                # Sanity check, print error message
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    j       main                                    # restart program

endf:
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                                 # terminate program
    syscall