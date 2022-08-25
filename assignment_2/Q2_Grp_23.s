#########################################
## COA LAB Assignment 2 Q2             ##
## Group Number 23                     ##
## Ashwani Kumar Kamal (20CS10011)     ##
## Astitva (20CS30007)                 ##
#########################################
# This program computes the kth largest number in an array of 10 integers,
# where integers and integer k are entered by the user.
#
    .globl main

    .data
# program output text constants

array: 
    .space  40

prompt1:
    .asciiz "Enter 10 positive integer (one in each line): "
promptk:
    .asciiz "Enter the value of k: "
output_msg:
    .asciiz "k-th largest number is: "
sorted_msg:
    .asciiz "Sorted array: "
err:
    .asciiz "k must be between 1 and n (1 <= k <= n). Try again"
whitespace:
    .asciiz " "
newline:
    .asciiz "\n"

    .text

# main program
#
# program variables
# 
#

main:
    li      $s2, 40                         # store limit of array (40 bytes)

    li		$v0, 4
    la		$a0, prompt1
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    jal readArray                           # call readArray function

    li      $v0, 4
    la      $a0, promptk
    syscall

    li      $v0, 5
    syscall
    move    $s3, $v0                        # input k

    sll		$s3, $s3, 2                     # k = 4*k

    sub     $s3, $s2, $s3                   # k = 40 - k

    
    blt     $s3, $zero error                # if k < 0, jump to error
    bge     $s3, $s2, error                 # if k >= 40, jump to error

    # sw      $a0, array                      # pass array as argument

    jal     sort_array                      # call sort_array function

    jal     printArray                      # print sorted array

    li      $v0, 4
    la      $a0, newline
    syscall

    move    $a0, $s3                        # pass k as argument 
    jal     find_k_largest                  # call find_k_largest function 

    move    $s4, $v0                        # return answer and store in $s4

    li      $v0, 4
    la      $a0, output_msg
    syscall

    li      $v0, 1
    move    $a0, $s4                        # print answer
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    j endf                          

# Functions, segments and loops

readArray:
    la      $t0, 0                          # count variable
    b       whileRead

return:
    jr      $ra

whileRead:
    bge     $t0, 40, return                 # if count >= 40, return from function

    li      $v0, 5                          # read int input by user
    syscall 

    sw      $v0, array($t0)                 # store input in array
    addi    $t0, $t0, 4                     # add by 4 to count
    b       whileRead                       # continue to loop

printArray:
    li      $v0, 4
    la      $a0, sorted_msg
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall
    la      $t0, 0                          # i = 0
    
    b       whilePrint                      # jump to loop

whilePrint:
    bge     $t0, 40, return                 # if i >= 40, return from printArray function

    li      $v0, 1                          # print integer
    lw      $a0, array($t0)                 # print arr[count]
    syscall

    li      $v0, 4
    la      $a0, whitespace                 # print whitespace for convinience
    syscall

    addi    $t0, $t0, 4                     # add by 4 to count

    b       whilePrint                      # continue to loop

sort_array:
    # Had to take array as paramter and then using lw and sw, operate on that array by reference
    
    li      $t0, -4                         # i = -4
    b       outer_for                       # jump to loop

outer_for:
    bge     $t0, 40, return                 # if i >= 40, jump to return from sort function

    addi    $t0, $t0, 4                     # add by 4 to count, i += 4  

    li      $t1, 0                          # j = 0
    b       inner_for                       # jump to nested loop

inner_for:  
    li		$t5, 40		                    # $t5 = 40 
    
    sub	    $t2, $t5, $t0		            # $t2 = $t5 - $t0, l = n - i

    bge     $t1, $t2, outer_for             # if($t1 >= $t2) (or if j >= n - i) go to outer loop 
    addi	$t3, $t1, 4   	                # $t3 = $t1 + 4 (k = j + 1)

    lw      $s1, array($t1)                 # $s1 = arr[j]
    lw      $s2, array($t3)                 # $s2 = arr[j+1]
    
    bgt		$s1, $s2, swap                  # if arr[j] > arr[j+1], swap the numbers

    addi    $t1, $t1, 4                     # j += 1
    b inner_for

swap:

    lw		$t4, array($t1)                 # int temp = arr[j]
    lw		$t5, array($t3)	

    sw		$t5, array($t1)		            # arr[j] = arr[j+1]
    sw      $t4, array($t3)                 # arr[j+1] = temp

    addi    $t1, $t1, 4                     # j += 1
    b inner_for                             # continue to nested loop

find_k_largest:

    move    $t0, $a0                        # get first argument, k

    lw      $v0, array($t0)                 # $v0 = arr[k]

    jr      $ra                             # return from function

error:
    li      $v0, 4
    la      $a0, err                        # print error message
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    j main                                  # restart program

endf:
    li      $v0, 4
    la      $a0, newline
    syscall
    
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                         # terminate program
    syscall