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
    jal     initStack                           # initialise stack and frame pointer 
    move    $s0, $sp                            # save stack pointer in $s0

    li      $v0, 4
    la      $a0, prompt                         # load address of input prompt in $a0
    syscall                                     # syscall to print input prompt

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

    ble     $s1, $zero, error                   # if n <= 0, jump to error
    ble     $s2, $zero, error                   # if a <= 0, jump to error
    ble     $s3, $zero, error                   # if r <= 0, jump to error
    ble     $s4, $zero, error                   # if m <= 0, jump to error

    move    $a0, $s1
    jal     pushToStack                         # push n to stack

    move    $a0, $s2
    jal     pushToStack                         # push a to stack

    move    $a0, $s3
    jal     pushToStack                         # push r to stack

    move    $a0, $s4
    jal     pushToStack                         # push m to stack

    # $s0 <- n  | -4($s4)
    # $s1 <- a  | -8($s4)
    # $s2 <- r  | -12($s4)
    # $s3 <- m  | -16($s4)

    # Allocate memory for matrix A  
    lw      $t0, -4($s0)                        # $t0 = n
    mul     $a0, $t0, $t0                       # $a0 = n * n
    jal     mallocInStack                       # call mallocInStack with $a0 as argument
    move    $s1, $v0                            # $s1 = address of first element of matrix A

fill_up_A:
    lw      $t0, -4($s0)                         # $t0 = n
    mul     $t0, $t0, $t0                       # $t0 = m * n

    lw      $t1, -8($s0)                        # $t1 = a
    lw      $t2, -12($s0)                       # $t2 = r
    lw      $t3, -16($s0)                       # $t3 = m 

    li      $t4, 0                              # $t4 = i = 0
    move    $t5, $s1                            # $t5 = address of first element of A

traversal_loop:
    bge     $t4, $t0, print_A                   # if i >= n * n, start printing A

    div		$t1, $t3			                # $t1 / $t3 (ar^x / m)
    mfhi	$t1					                # $t1 = $t1 mod $t3 

    sw      $t1, 0($t5)                         # store the value in $t1 (ar^x) to the current matrix element 
    mul     $t1, $t1, $t2                       # $t1 = $t1 * r (get next term of GP)
    addi    $t5, -4                             # $t6 -= 4 to point to next element
    addi    $t4, 1                              # i = i + 1
    j       traversal_loop                      # continue the loop

print_A:  
    li      $v0, 4                              # system call code for printing a string to console
    la      $a0, print_matrix
    syscall                                     # print print_matrix on the console

    li      $v0, 4
    la      $a0, newline
    syscall   

    lw      $a0, -4($s0)                        # $a0 = n
    lw      $a1, -4($s0)                        # $a1 = n
    move    $a2, $s1                            # $a2 = address of first element of A
    jal     printMatrix                         # call the printMatrix function 

    lw    $a0, -4($s0)                          # $a0 = n
    move  $a1, $s1                              # $a1 = address of first element of matrix A
    jal   recursive_determinant

    move    $t0, $v0                            # $t0 = $v0, $v0 stores determinant of A.
    li      $v0, 4                              # Loads value 4 in $v0, 4 is the system call code for printing a string to console
    la      $a0, output                         # Loads address of output_msg in a0
    syscall                                     # print output_msg on the console

    move    $a0, $t0                            # a0 = det(A)
    la      $v0, 1                              # Loads value 1 in $v0, 1 is the system call code for printing an integer to console
    syscall                                     # print det(A) on the console

    move    $sp, $fp                            # before ending the program, restore the stack pointer
    j       endf                                # unconditional jump to exit


# Function to initialise the stack and frame pointers
initStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $fp, 0($sp)                         # Store $fp in stack
    move    $fp, $sp                            # Make $fp point to current stack top before program execution
    jr      $ra                                 # jump to return address


# Function to push an element (in $a0) to the stack
pushToStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $a0, 0($sp)                         # Store $a0 in stack
    jr      $ra                                 # jump to return address


# Function to pop an element from stack
popFromStack:
    addi    $sp, $sp, 4                         # increment stack pointer by 4
    jr      $ra                                 # jump to return address


# Function to allocate memory for n * n integers on stack
mallocInStack:
    sll     $t0, $a0, 2                         # $t0 = $a0 * 4 = 4*n*n
    addi    $v0, $sp, -4                        # store beginning address in $v0, so that we can return this value
    sub     $sp, $sp, $t0                       # Decrement stack pointer to allocate memory for 4*n*n bytes
    jr      $ra                                 # jump to return address


# Function to print a n x n matrix
# For this function,
# $t0 is address of current matrix element
# $t1 is i
# $t2 is j
# $t3 is n

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

return:
    jr      $ra

# recursive determinant function
recursive_determinant:
    move    $t0, $ra                            # $t0 = $ra
    jal     pushToStack                         # push $a0(n) to stack
    move    $a0, $a1                            # $a0 = $a1, $a1 stores address of first element of matrix A
    jal     pushToStack                         # push $a0 to stack
    move    $a0, $t0                            # $a0 = $t0, $t0 stores return address($ra)
    jal     pushToStack                         # push $a0 to stack
    li      $t0, 1                              # $t0 = 1
    lw      $t1, 8($sp)                         # $t1 = n as ($sp - 8) stores address of n
    beq     $t0, $t1, base_case                # check if n != 1, if n != 1 jump to not_equal1
   
    li      $v0, 0                              # stores determinant value, initialized to det(A) = 0
    move    $a0, $v0                            # $a0 = $v0
    jal     pushToStack                         # push $a0 to stack
    li      $t0, 1                              # stores sign, initialized to 1
    move    $a0, $t0                            # $a0 = $t0
    jal     pushToStack                         # push $a0(currently stores sign) to stack
    lw      $t2, 16($sp)                        # $t2 stores n
    li      $t0, 0                              # $t0 stores loop_counter, initialized to 0

loopDet: 
    beq     $t0, $t2, end_loop                  # check if j == n, if yes exit from loop and jump to end_loop
    move    $t6, $t0                            # $t6 stores j
    move    $a0, $t0                            # $a0 = $t0, $t0 stores loop counter j
    jal     pushToStack                         # pust $a0 (currently stores loop counter) to stack

    lw      $t7, 16($sp)                        # $t7 stores address of 1st element of A
    move    $t1, $t2                            # store n' in $t1
    addi    $t1, $t1,-1                         # $t1 = n' = n-1
    mul     $t1, $t1, $t1                       # $t1 = $t1 * $t1 (i.e., $t1 = (n')*(n') where n' = n-1)
    # allocate memory on stack
    move    $a0, $t1                            # $a0 = (n')*(n')
    jal     mallocInStack                       # call mallocInStack with $a0 as argument
    # populate matrix A'(cofactor matrix)
    move    $t0, $t2                            # $t0 store n
    move    $t1, $v0                            # $t1 stores address of 1st element of A'
    li      $t2, 1                              # stores row
    li      $t3, 0                              # stores col
    li      $t8, -4                             # $t8 = -4 
    mul     $t8, $t8, $t0                       # $t8 = -4*n
    add     $t7, $t7, $t8                       # $t7 points to 1st element of 2nd row in matrix A
    # $t6 stores col to be skipped

outer_fillA:
    beq     $t2, $t0, end_ofillA                # check row == n, if yes, end outer loop of fill A
    move    $t3, $zero                          # col = 0

inner_fillA:
    beq     $t3, $t0, end_ifillA                # check if col == n, if yes, end inner loop of fill A(i.e., end_ifillA)
    beq     $t6, $t3, increment_col             # if col == j, jump to increment col(i.e., increment_col)
    lw      $t4, 0($t7)                         # $t4 = A[row][col]
    sw      $t4, 0($t1)                         # A'[i][j] = A[row][col]
    addi    $t1, $t1, -4                        # $t1 = $t1 - 4
    addi    $t7, $t7, -4                        # $t7 = $t7 - 4
    addi    $t3, $t3, 1                         # $t3 = $t3 + 3, increment col
    j       inner_fillA                         # unconditional jump to inner_fillA

increment_col:
    addi    $t3, $t3, 1                         # $t3 = $t3  + 1, increment col
    addi    $t7, $t7, -4                        # $t7 = A[row][col+1]
    j       inner_fillA                         # unconditional jump to inner_fillA

end_ifillA:
    addi    $t2, $t2, 1                         # $t2 = $t2 + 1, increment row
    j       outer_fillA                         # unconditional jump to outer_fillA

end_ofillA:
    addi    $t0, $t0, -1                        # $t0 = n-1
    move    $a0, $t0                            # $a0 = $t0, $a0 stores n-1
    jal     pushToStack                         # push $a0 to stack
    move    $a0, $t0                            # $a0 = n-1 as $t0 stores n-1
    move    $a1, $v0                            # $a1 stores address of 1st element of cofactor matrix A'
    jal     recursive_determinant                       # call the recursive_Det function with $a0, $a1 as arguments

    lw      $t2, 0($sp)                         # $t2 stores n-1
    move    $t0, $t2                            # $t0 = n-1
    mul     $t0, $t0, $t0                       # $t0 stores (n-1)*(n-1)
    jal     popFromStack                        # pop top element (i.e., n-1) from stack
    sll     $t0, $t0, 2                         # $t0 = 4*(n-1)*(n-1)
    add     $sp, $sp, $t0                       # pop matrix A' from stack
    lw      $t0, 0($sp)                         # load loop counter back in $t0
    jal     popFromStack                        # pop loop counter from stack
    lw      $t1, 0($sp)                         # load sign from stack
    jal     popFromStack                        # pop sign from stack

    lw      $t3, 0($sp)                         # load current value of det from loop
    jal     popFromStack                        # pop current value of det from stack
    mul     $t4, $v0, $t1                       # $t4 = recursiveDet(A', n-1)*sign
    lw      $t5, 4($sp)                         # load address of 1st element of A in $t5
    move    $t6, $t0                            # $t6 = j(loop counter)
    li      $t8, -4                             # $t8 = -4
    mul     $t6, $t6, $t8                       # $t6 = -4*j
    add     $t5, $t5, $t6                       # $t5 now stores address of jth element of 1st row
    lw      $t5, 0($t5)                         # $t5 stores jth element of 1st row
    mul     $t4, $t4, $t5                       # $t4 = recursiveDet(A', n-1) * sign * A[0][j]
    add     $t4, $t4, $t3                       # $t4 = $t4 + $t3, equivalent to so_far_Det(A) += $t4
    move    $a0, $t4                            # $a0 = so_far_Det(A)
    jal     pushToStack                         # push $a0(so_far_Det(A)) to stack
    
    li      $t8, -1                             # $t8 = -1
    mul     $t1, $t1, $t8                       # sign = -sign
    move    $a0, $t1                            # $a0 = -sign
    jal     pushToStack                         # push $a0(sign) to stack
    
    addi    $t2, $t2, 1                         # $t2 = n
    addi    $t0, $t0, 1                         # $t0 = j+1
    j       loopDet                             # unconditional jump to loopDet

end_loop:
    jal     popFromStack                        # pop sign from stack
    lw      $v0, 0($sp)                         # $v0 = Det(A)
    jal     popFromStack                        # pop determinant value from stack
    lw      $ra, 0($sp)                         # restore return address
    addi    $sp, $sp, 12                        # pop 3 elements from stack
    jr      $ra                                 # jump to return address

base_case:
    lw      $v0, 0($a1)                         # $v0 = A[0][0], $a1 stores address of first element of matrix A 
    lw      $ra, 0($sp)                         # restore return address from stack
    addi    $sp, $sp, 12                        # pop 3 elements from stack
    jr      $ra                                 # jump to ra

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

    j main  

endf:
    li      $v0, 4
    la      $a0, newline
    syscall
    
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                             # terminate program
    syscall