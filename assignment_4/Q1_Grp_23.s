#########################################
## COA LAB Assignment 4 Q1             ##
## Group Number 23                     ##
## Ashwani Kumar Kamal (20CS10011)     ##
## Astitva (20CS30007)                 ##
#########################################

# This program computes the determinant of a matrix after populating with parameters a, r and m
# where a and r are first term and common ratio of a gp series and m is mod value entered by the user.
# 
    .globl main

    .data
# program output text constants

prompt:
    .asciiz "Enter four positive integers (n, a, r and m): "
print_matrix:
    .asciiz "Matrix A:"
err:
    .asciiz "All the four integers are not positive. Try again." 
output:
    .asciiz "Final determinant of the matrix A is: "
whitespace:
    .asciiz " "
newline:
    .asciiz "\n"

    .text

# main program
main:

    # Since we need the stack for many variables, owing to repeatedly mallocing matrices,it will be helpful to store stack initial pointer to a register and use that

    jal     initialize_sp                       # initialise stack 
    move    $s0, $sp                            # $s0 stores current stack pointer

    li      $v0, 4
    la      $a0, prompt                         # issue prompt 
    syscall

    li		$v0, 4
    la		$a0, newline
    syscall

    li      $v0, 5
	syscall
	move    $s1, $v0                            # input n

    li      $v0, 5
	syscall
	move    $s2, $v0                            # input a

    li      $v0, 5
	syscall
	move    $s3, $v0                            # input r

    li      $v0, 5
	syscall
	move    $s4, $v0                            # input m

    # Handling sanity checking (question states to only allow positive integers)

    ble     $s1, $zero, error                   # if n <= 0, jump to error
    ble     $s2, $zero, error                   # if a <= 0, jump to error
    ble     $s3, $zero, error                   # if r <= 0, jump to error
    ble     $s4, $zero, error                   # if m <= 0, jump to error

    move    $a0, $s1
    jal     push_sp                         # push n to stack

    move    $a0, $s2
    jal     push_sp                         # push a to stack

    move    $a0, $s3
    jal     push_sp                         # push r to stack

    move    $a0, $s4
    jal     push_sp                         # push m to stack

    # $s1 <- n  | -4($s0)
    # $s2 <- a  | -8($s0)
    # $s3 <- r  | -12($s0)
    # $s4 <- m  | -16($s0)

    # Allocate memory for matrix A  
    lw      $a0, -4($s0)                        # $a0 <- n
    mul     $a0, $a0, $a0                       # $a0 <- n * n
    jal     malloc_sp                           # malloc space
    move    $s1, $v0                            # $s1 <- &A[0][0]

fill_up_A:
    lw      $t0, -4($s0)                        # $t0 <- n
    mul     $t0, $t0, $t0                       # $t0 <- n * n

    lw      $t1, -8($s0)                        # $t1 <- a
    lw      $t2, -12($s0)                       # $t2 <- r
    lw      $t3, -16($s0)                       # $t3 <- m 

    li      $t4, 0                              # $t4 = i <- 0
    move    $t5, $s1                            # $t5 <- &A[0][0]

traversal_loop:
    bge     $t4, $t0, print_A                   # if i >= n * n, start printing A

    div		$t1, $t3			                # $t1 / $t3 (ar^x / m)
    mfhi	$t1					                # $t1 <- $t1 mod $t3 

    sw      $t1, 0($t5)                         # store the value in $t1 (ar^x % m) to the current matrix element 
    mul     $t1, $t1, $t2                       # $t1 <- $t1 * r (get next term of GP)
    addi    $t5, -4                             # $t6 -= 4, next element of matrix
    addi    $t4, 1                              # i++
    j       traversal_loop                      # continue the loop

print_A:  
    li      $v0, 4
    la      $a0, print_matrix                   # print print_matrix string on console
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall   

    # reusing printMatrix function from assignment_2
    # pass arguments as (n, n, &A[0][0])
    lw      $a0, -4($s0)                        # $a0 <- n
    lw      $a1, -4($s0)                        # $a1 <- n
    move    $a2, $s1                            # $a2 <- &A[0][0]
    jal     printMatrix                         # call the printMatrix function 

    # call the function to compute determinant
    lw    $a0, -4($s0)                          # $a0 <- n
    move  $a1, $s1                              # $a1 <- &A[0][0]
    jal   recursive_determinant

    move    $s0, $v0                            # $s0 <- det(A)

    li      $v0, 4                              
    la      $a0, output                         # print output string on console
    syscall                                     

    move    $a0, $s0                            # a0 <- det(A)
    la      $v0, 1                              # print value of det(A) on console
    syscall

    move    $sp, $fp                            # free stack by setting $sp <- $fp (orginal stack pointer location)
    j       endf                                # Jump to terminate program segment

initialize_sp:
    addi    $sp, $sp, -4                        # make space for 1 word
    sw      $fp, 0($sp)                         # push $fp in stack
    move    $fp, $sp                            # $fp <- $sp (for freeing stack later)
    jr      $ra


push_sp:
    addi    $sp, $sp, -4                        # make space for 1 word
    sw      $a0, 0($sp)                         # push $a0 in stack
    jr      $ra

# Function to allocate memory (malloc) in stack
malloc_sp:
    sll     $t0, $a0, 2                         # $t0 = $a0 * 4 <- 4*n*n
    addi    $v0, $sp, -4                        # $v0 <- beginning address
    sub     $sp, $sp, $t0                       # push 4*n*n amount of space in stack
    jr      $ra

# Reusing printMatrix function from assignment_2
printMatrix:
    move    $t3, $a0                            # $t3 <- n
    move    $t4, $a1                            # $t4 <-  n
    move    $t0, $a2                            # $t0 <- $A[0][0]

    li      $t1, 0                              # $t1 = i <- 0
    
outer_for:
    bge     $t1, $t3, return                    # if i >= n, printing done, return  from function
    li      $t2, 0                              # $t2 = j <- 0

inner_for:
    bge     $t2, $t4, inc_outer_for             # if j >= n, exit from inner loop, increment outer loop

    li      $v0, 1
    lw      $a0, 0($t0)                         # print the array element
    syscall                                     

    li      $v0, 4  
    la      $a0, whitespace                     # print whitespace
    syscall                                     

    addi    $t0, -4;                            # next array element
    addi    $t2, 1                              # j++
    j       inner_for                           # continue inner loop
    
inc_outer_for:      
    li      $v0, 4  
    la      $a0, newline                        # print "\n"
    syscall

    addi    $t1, 1                              # i++
    j       outer_for                           # continue outer loop

return:
    jr      $ra


recursive_determinant:
    # temporarily move $ra to $t0 as calling push_sp will change the value of $ra
    move    $t0, $ra

    # push required arguments to stack
    jal     push_sp

    move    $a0, $a1                            # $a0 <- &A[0][0]
    jal     push_sp                             # push address of first element of matrix

    move    $a0, $t0                            # $a0 <- $ra
    jal     push_sp                             # push return address

    li      $t0, 1                              # $t0 <- 1
    lw      $t1, 8($sp)                         # $t1 <- n

    # check for base case
    beq     $t0, $t1, base_case                 # if(n == 1) return the base case value
   
    li      $v0, 0                              # $v0 <- 0

    move    $a0, $v0                            # $a0 <- $v0
    jal     push_sp                             # push $v0 to stack

    # logic: use stack to store the determinant computed so far and add to it as and when required 
    # we will need to alternate between arithmetic signs while computing the determinant
    # store the initialize sign value in some register and push to stack for later

    # sign register
    li      $t0, 1                              # $t0 <- 1
    move    $a0, $t0                            # $a0 <- $t0
    jal     push_sp                             # push $t0 to stack
    
    lw      $t2, 16($sp)                        # $t2 <- n
    li      $t0, 0                              # $t0 = i <- 0

for_loop_determinant: 
    bge     $t0, $t2, exit_for_loop             # if i >= n, exit from the loop body

    # t6 will store the col to be skipped
    move    $t6, $t0                            # $t6 <- i
    move    $a0, $t0                            # $a0 <- i
    jal     push_sp                             # push i to stack

    lw      $t7, 16($sp)                        # $t7 <- &A[0][0]
    move    $t1, $t2                            # $t1 <- n
    addi    $t1, $t1,-1                         # $t1 <- n-1
    
    mul     $t1, $t1, $t1                       # $t1 <- (n-1)*(n-1)
    move    $a0, $t1                            # $a0 <- (n-1)*(n-1)
    jal     malloc_sp                           # malloc space
    move    $t1, $v0                            # $t1 <- &A'[0][0]

    move    $t0, $t2                            # $t0 <- n
    li      $t2, 1                              # stores row
    li      $t3, 0                              # stores col
    li      $t8, -4                             # $t8 <- -4 
    mul     $t8, $t8, $t0                       # $t8 <- -4*n
    add     $t7, $t7, $t8                       # $t7 <- &A[1][0]

outer_cofactor_loop:
    beq     $t2, $t0, exit_outer_loop           # if row == n, end outer_cofactor_loop
    move    $t3, $zero                          # col <- 0

inner_cofactor_loop:
    beq     $t3, $t0, exit_inner_loop           # if col == n, end inner loop of fill A
    beq     $t6, $t3, increment_col             # if col == j, increment col
    lw      $t4, 0($t7)                         # $t4 <- A[row][col]

    # assign the cofactor matrix
    sw      $t4, 0($t1)                         # A'[i][j] <- A[row][col]
    addi    $t1, $t1, -4                        # $t1 = $t1 - 4
    addi    $t7, $t7, -4                        # $t7 <- &A[row][col+1]
    addi    $t3, $t3, 1                         # $t3 <- $t3 + 1, increment col
    j       inner_cofactor_loop                 # continue to inner_cofactor_loop

increment_col:
    addi    $t3, $t3, 1                         # $t3 = $t3 + 1, increment col
    addi    $t7, $t7, -4                        # $t7 <- &A[row][col+1] (next element)
    j       inner_cofactor_loop                 # continue to inner_cofactor_loop

exit_inner_loop:
    addi    $t2, $t2, 1                         # $t2 = $t2 + 1, increment row
    j       outer_cofactor_loop                 # continue to outer_cofactor_loop

exit_outer_loop:
    addi    $t0, $t0, -1                        # $t0 <- n-1
    move    $a0, $t0                            # $a0 <- n-1
    jal     push_sp                             # push n-1 to stack

    move    $a0, $t0                            # $a0 <- n-1
    move    $a1, $v0                            # $a1 <- &A'[0][0]
    jal     recursive_determinant               # recursively call determinant function of cofactor matrix

    lw      $t2, 0($sp)                         # $t2 <- n-1
    move    $t0, $t2                            # $t0 <- n-1
    mul     $t0, $t0, $t0                       # $t0 <- (n-1)*(n-1)

    # pop elements to retain stack pointer assignment at the end of function

    addi    $sp, $sp, 4                         # pop n-1 from stack
    sll     $t0, $t0, 2                         # $t0 <- 4*(n-1)*(n-1)
    add     $sp, $sp, $t0                       # pop A' from stack

    lw      $t0, 0($sp)                         # $t0 <- i
    addi    $sp, $sp, 4                         # pop i from stack

    lw      $t1, 0($sp)                         # &t1 <- sign
    addi    $sp, $sp, 4                         # pop sign from stack

    lw      $t3, 0($sp)                         # $t3 <- $v0 (current det value)
    addi    $sp, $sp, 4                         # pop det from stack

    # assign det value
    mul     $t4, $v0, $t1                       # $t4 <- sign * det(A')
    lw      $t5, 4($sp)                         # $t5 <- &A[0][0]

    move    $t6, $t0                            # $t6 <- i
    li      $t8, -4                             # $t8 <- -4
    mul     $t6, $t6, $t8                       # $t6 <- -4*j
    add     $t5, $t5, $t6                       # $t5 <- &A[0][i]
    lw      $t5, 0($t5)                         # $t5 <- A[0][i]

    # assign det value
    mul     $t4, $t4, $t5                       # $t4 <- sign * det(A') * A[0][i]
    add     $t4, $t4, $t3                       # update to increment total det value

    move    $a0, $t4                            # $a0 <- det_current(A)
    jal     push_sp                             # push det_current(A) to stack
    
    li      $t8, -1                             # $t8 <- -1

    # flip sign of register storing sign
    mul     $t1, $t1, $t8                       # sign <- -sign
    move    $a0, $t1                            # $a0 <- -sign
    jal     push_sp                             # push sign to stack
    
    addi    $t2, $t2, 1                         # $t2 <- n
    addi    $t0, $t0, 1                         # $t0 <- i+1
    j       for_loop_determinant                # continue to next iteration of calculating the determinant

# final returning from determinant function
exit_for_loop:
    addi    $sp, $sp, 4                         # pop sign from stack
    lw      $v0, 0($sp)                         # $v0 <- det(A)
    addi    $sp, $sp, 4                         # pop determinant value from stack

    lw      $ra, 0($sp)                         # get return address

    # pop elements to retain stack pointer assignment at the end of function

    addi    $sp, $sp, 12                        # pop 3 elements from stack
    jr      $ra                                 # jump to return address

# base case of recursion
base_case:
    lw      $v0, 0($a1)                         # $v0 <- A[0][0]
    lw      $ra, 0($sp)                         # get return address
    addi    $sp, $sp, 12                        # pop 3 elements to retain stack pointer
    jr      $ra

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