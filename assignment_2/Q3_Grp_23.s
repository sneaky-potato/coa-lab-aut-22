#########################################
## COA LAB Assignment 2 Q3             ##
## Group Number 23                     ##
## Ashwani Kumar Kamal (20CS10011)     ##
## Astitva (20CS30007)                 ##
#########################################

# This program computes the transpose of a matrix after populating with parameters a and r
# where a and r are first term and common ratio of a gp series entered by the user.
# 
    .globl main

    .data
# program output text constants

prompt:
    .asciiz "Enter four positive integers m, n, a and r: "
print_matrix_a:
    .asciiz "Matrix A:"
print_matrix_b:
    .asciiz "Matrix B:"
err:
    .asciiz "All the four integers are not positive. Try again." 
whitespace:
    .asciiz " "
newline:
    .asciiz "\n"


    .text
# main program
# 
  
main:
    jal     initStack                           # initialise stack and frame pointer 
    move    $s4, $sp                            # save stack pointer in $s4


    li		$v0, 4
    la		$a0, prompt                         # issue prompt
    syscall

    li		$v0, 4
    la		$a0, newline
    syscall

    li      $v0, 5
	syscall
	move    $s0, $v0                            # input m

    li      $v0, 5
	syscall
	move    $s1, $v0                            # input n

    li      $v0, 5
	syscall
	move    $s2, $v0                            # input a

    li      $v0, 5
	syscall
	move    $s3, $v0                            # input r

    ble     $s0, $zero, error                   # if m <= 0, jump to error
    ble     $s1, $zero, error                   # if n <= 0, jump to error
    ble     $s2, $zero, error                   # if a <= 0, jump to error
    ble     $s3, $zero, error                   # if r <= 0, jump to error

    # Pushing parameters onto stack

    move    $a0, $s0
    jal     pushToStack                         # push m to stack

    move    $a0, $s1
    jal     pushToStack                         # push n to stack

    move    $a0, $s2
    jal     pushToStack                         # push a to stack

    move    $a0, $s3
    jal     pushToStack                         # push r to stack

    # $s0 <- m  | 0($sp)
    # $s1 <- n  | -4($sp)
    # $s2 <- a  | -8($sp)
    # $s3 <- r  | -12($sp)

    # Allocate memory for matrix A
    lw      $t0, 0($s4)
    lw      $t1, -4($s4)

    mul     $a0, $t0, $t1                       # $a0 = m * n
    jal     mallocInStack                       # call mallocInStack
    move    $s1, $v0                            # $s1 = address of first element of matrix A

    # Allocate memory for matrix B  
    lw      $t0, 0($s4)
    lw      $t1, -4($s4)

    mul     $a0, $t0, $t1                       # $a0 = m * n
    jal     mallocInStack                       # call mallocInStack
    move    $s2, $v0                            # $s2 = address of first element of matrix B

    j       fill_up_A                           # call fill_up_A with gp series with parameters a and r

initStack:
    addi    $sp $sp -4                          # subtract stack pointer by 1 to store jump address
    sw      $fp 4($sp)
    move    $fp $sp
    jr      $ra

pushToStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $a0, 4($sp)                         # Store $a0 in stack
    jr      $ra                                 # return to main

mallocInStack:
    sll     $t0, $a0, 2                         # $t0 = 4*$a0 (stores 4*m*n)
    move    $v0, $sp                            # beginning address in $v0 for returning
    sub     $sp, $sp, $t0                       # Decrement stack pointer to allocate memory
    jr      $ra                                 # return 

fill_up_A:
    # get argument values
    lw      $t1, -4($s4)                        # $t1 = n
    lw      $t0, 0($s4)                         # $t0 = m
    mul     $t2, $t0, $t1                       # $t2 = m * n

    lw      $t4, -8($s4)                        # $t4 = a
    lw      $t5, -12($s4)                       # $t5 = r

    li      $t3, 0                              # $t3 = i = 0
    move    $t6, $s1                            # $t6 = address of first element of A

traversal_loop:
    bge     $t3, $t2, print_A                   # if i >= m * n, start printing A
    sw      $t4, 0($t6)                         # store the value in $t4 to the current matrix element 
    mul     $t4, $t4, $t5                       # $ t4 = $t4 * r (get next term of GP)
    addi    $t6, -4                             # $t6 -= 4 to point to next element
    addi    $t3, 1                              # i = i + 1
    j       traversal_loop                      # continue the loop


print_A:  
    li      $v0, 4  
    la      $a0, print_matrix_a                 # print_matrix_a message
    syscall

    li      $v0, 4  
    la      $a0, newline
    syscall    

    lw      $a0, 0($s4)                         # $a0 = m
    lw      $a1, -4($s4)                        # $a1 = n
    move    $a2, $s1                            # $a2 = address of first element of A
    jal     printMatrix                         # call the printMatrix function 

    li      $v0, 4;
    la      $a0, newline
    syscall

    lw      $a0, 0($s4)                         # $a0 = m
    lw      $a1, -4($s4)                        # $a1 = n
    move    $a2, $s1                            # $a2 = address of first element of A
    move    $a3, $s2                            # $a3 = address of first element of B
    jal     transposeMatrix                     # call the transposeMatrix function

print_B:  
    li      $v0, 4  
    la      $a0, print_matrix_b                 # print_matrix_a message
    syscall

    li      $v0, 4  
    la      $a0, newline
    syscall 

    lw      $a0, -4($s4)                        # $a0 = n
    lw      $a1, 0($s4)                         # $a1 = m
    move    $a2, $s2                            # $a2 = address of first element of B
    jal     printMatrix                         # call the printMatrix function

free_stack: 
    move    $sp, $fp                            # restore stack pointer
    j       endf                                # unconditional jump to exit

printMatrix:

    move    $t0, $a2                            # address of first element A
    move    $t3, $a0                            # $t3 = m
    move    $t4, $a1                            # $t4 = n

    li      $t1, 0                              # $t1 = row number (i)
    
outer_for:
    beq     $t1, $t3, return                    # if i == m, exit from the outer loop
    li      $t2, 0                              # $t2 = column number (j)

inner_for:
    beq     $t2, $t4, inc_outer_for             # if j == n, exit from inner loop, increment outer loop

    li      $v0, 1
    lw      $a0, 0($t0)
    syscall                                     # print the array element

    li      $v0, 4  
    la      $a0, whitespace 
    syscall                                     # print whitespace

    addi    $t0, -4;                            # next array element
    addi    $t2, 1                              # j = j + 1
    j       inner_for                           # continue inner loop
    
inc_outer_for:      
    li      $v0, 4  
    la      $a0, newline    
    syscall

    addi    $t1, 1                              # i = i + 1
    j       outer_for                           # continue outer loop
    
transposeMatrix:    
    move    $t0, $a2                            # address of first element of A
    move    $t1, $a3                            # address of first element of B
    move    $t2, $a0                            # $t2 = m
    move    $t3, $a1                            # $t3 = n
    
    li      $t4, 0                              # $t4 = i = 0
    
tr_outer_for:   
    beq     $t4, $t2, return                    # if i == m, exit from the outer loop
    li      $t5, 0                              # $t5 = j = 0

tr_inner_for:
    beq     $t5, $t3, inc_tr_outer_for          # if j == n, exit from inner loop
    lw      $t6, 0($t0)                         # A[i][j]

    mul     $t7, $t2, $t5                       # $t7 = m * j
    add     $t7, $t7, $t4                       # $t7 = $t7 + i

    sll     $t7, $t7, 2                         # $t7 = 4 * ($t7) (now stores 4*(m*j + i)
    sub     $t7, $t1, $t7

    sw      $t6, 0($t7)                         # set B[j][i] = A[i][j]

    addi    $t0, -4;                            # next element of matrix A
    addi    $t5, 1                              # j = j + 1
    j       tr_inner_for                        # continue inner loop

inc_tr_outer_for:    
    addi    $t4, 1                              # i = i + 1
    j       tr_outer_for                        # continue outer loop

return:
    jr      $ra                                 # return 

error:
    li      $v0, 4
    la      $a0, err                            # print error message
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall
    
    li      $v0, 4
    la      $a0, newline
    syscall

    j main                                      # restart program

endf:
    li      $v0, 4
    la      $a0, newline
    syscall
    
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                             # terminate program
    syscall