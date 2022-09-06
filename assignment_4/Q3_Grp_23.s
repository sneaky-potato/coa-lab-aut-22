#########################################
## COA LAB Assignment 4 Q3             ##
## Group Number 23                     ##
## Ashwani Kumar Kamal (20CS10011)     ##
## Astitva (20CS30007)                 ##
#########################################

# This program sorts an array of 10 integers recursively (quick sort algorithm)
# then searches for a key k entered by user
#
    .globl main

    .data
# program output text constants

array: 
    .space  40

prompt:
    .asciiz "Enter 10 integers (one in each line): "
sorted_msg:
    .asciiz "Sorted array: "
key_prompt:
    .asciiz "Enter key to be searched: "
found_label:
    .asciiz "FOUND in the array at index "
not_found_label:
    .asciiz "NOT FOUND in the array."
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
    jal     initStack                       # initialize stack

    li		$v0, 4
    la		$a0, prompt
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

read_array:
    li      $t0, 0                          # count variable
    b       while_read

while_read:
    bge     $t0, 40, exit_read              # if count >= 40, return from function

    li      $v0, 5                          # read int input by user
    syscall 

    sw      $v0, array($t0)                 # store input in array
    addi    $t0, $t0, 4                     # add by 4 to count
    b       while_read                       # continue to loop

exit_read:
    la      $a0, array                      # load array address in $a0
    li      $a1, 0                          # start index in $a1
    li      $a2, 9                          # end index in $a2
    jal     recursive_sort                  # call recursive_sort function

print_array:
    li      $v0, 4
    la      $a0, sorted_msg
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall
    li      $t0, 0                          # i = 0
    
    b       while_print                      # jump to loop

while_print:
    bge     $t0, 40, exit_print                 # if i >= 40, return from printArray function

    li      $v0, 1                          # print integer
    lw      $a0, array($t0)                 # print arr[count]
    syscall

    li      $v0, 4
    la      $a0, whitespace                 # print whitespace for convinience
    syscall

    addi    $t0, $t0, 4                     # add by 4 to count

    b       while_print                      # continue to loop

exit_print:

    li      $v0, 4
    la      $a0, newline
    syscall

    li		$v0, 4
    la		$a0, key_prompt
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 5
    syscall    
    
    la      $a0, array                      # load array address in $a0
    li      $a1, 0                          # start index in $a1
    li      $a2, 9                          # end index in $a2
    move    $a3, $v0                        # key in $a3
    jal     recursive_search                # call recursive_search function

    move    $s0, $v0

    move    $sp, $fp                        # free stack

    blt     $a0, $zero, not_found

    li      $v0, 4
    la      $a0, found_label
    syscall

    move    $a0, $s0
    li      $v0, 1                          # print integer
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                         # terminate program
    syscall                         

not_found:

    li      $v0, 4
    la      $a0, not_found_label
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                         # terminate program
    syscall  

# Functions, segments and loops

initStack:
    addi    $sp, $sp -4                          # subtract stack pointer by 1 to store jump address
    sw      $fp, 0($sp)
    move    $fp, $sp
    jr      $ra

pushToStack:
    addi    $sp, $sp, -4                        # Decrement stack pointer by 4
    sw      $a0, 0($sp)                         # Store $a0 in stack
    jr      $ra                                 # return to main

recursive_sort:
    # temporarily move $ra to $t0 as calling pushToStack will change the value of $ra
    move    $t0, $ra                        # $t0 = $ra

    jal     pushToStack                     # push $a0 (address of A) to stack

    move    $a0, $a1
    jal     pushToStack                     # push $a1 (left) to stack

    move    $a0, $a2
    jal     pushToStack                     # push $a2 (right) to stack

    move    $a0, $t0
    jal     pushToStack                     # push $t0 = original $ra to stack

    move    $a0, $s0
    jal     pushToStack                     # save $s0 in stack

    move    $a0, $s1
    jal     pushToStack                     # save $s1 in stack

    lw      $s0, 16($sp)                    # l = left ($s0 stores l)
    lw      $s1, 12($sp)                    # r = right ($s1 stores r)

outer_while:
    blt     $s0, $s1, inner_while_l         # if l < r, jump to inner_while_1
    j       return                          # jump to return

inner_while_l:
    lw      $t0, 12($sp)                    # $t0 = right
    bge     $s0, $t0, inner_while_r         # if l >= right,then jump to inner_while_2

    lw      $t0, 20($sp)                    # $t0 = address of A

    sll     $t1, $s0, 2                     # $t1 = 4 * l
    add     $t1, $t0, $t1                   # $t1 = A + 4*l
    lw      $t2, 0($t1)                     # $t2 = A[l]

    lw      $t1, 16($sp)                    # $t1 = p = left
    sll     $t1, $t1, 2                     # $t1 = 4 * p
    add     $t1, $t0, $t1                   # $t1 = A + 4*p
    lw      $t3, 0($t1)                     # $t3 = A[p]

    bgt     $t2, $t3, inner_while_r        # if A[l] > A[p], then jump to inner_while_2

    addi    $s0, $s0, 1                     # l++
    j       inner_while_l                   # continue inner_while_1 loop

inner_while_r:
    lw      $t0, 16($sp)                    # $t0 = right
    ble     $s1, $t0, recurse               # if r <= left, then jump to recurse

    lw      $t0, 20($sp)                    # $t0 = address of A

    sll     $t1, $s1, 2                     # $t1 = 4 * r
    add     $t1, $t0, $t1                   # $t1 = A + 4*r
    lw      $t2, 0($t1)                     # $t2 = A[r]

    lw      $t1, 16($sp)                    # $t1 = p = left
    sll     $t1, $t1, 2                     # $t1 = 4 * p
    add     $t1, $t0, $t1                   # $t1 = A + 4*p
    lw      $t3, 0($t1)                     # $t3 = A[p]

    blt     $t2, $t3, recurse               # if A[r] < A[p], then jump to recurse

    addi    $s1, $s1, -1                    # r--
    j       inner_while_r                   # continue inner_while_2 loop

recurse:
    blt     $s0, $s1, swap_lr               # if l < r, jump to swap_lr
    lw      $t0, 20($sp)                    # $t0 = address of A

    lw      $t1, 16($sp)                    # p = left
    sll     $t1, $t1, 2                     # $t1 = 4 * p
    add     $a0, $t0, $t1                   # $a0 = address of A[p]

    sll     $t1, $s1, 2                     # $t1 = 4 * r
    add     $a1, $t0, $t1                   # $a1 = address of A[r]

    jal     swap                            # call the swap function with $a0 and $a1 as arguments, swap(A[p], A[r])

    lw      $a0, 20($sp)                    # $a0 = address of A
    lw      $a1, 16($sp)                    # $a1 = left
    addi    $a2, $s1, -1                    # $a2 = r - 1
    jal     recursive_sort                  # call recursive_sort(A, left, r - 1)

    lw      $a0, 20($sp)                    # $a0 = address of A
    addi    $a1, $s1, 1                     # $a1 = r + 1
    lw      $a2, 12($sp)                    # $a2 = right
    jal     recursive_sort                  # call recursive_sort(A, r + 1, right)

    j       return                          # jump to return

swap_lr:
    lw      $t0, 20($sp)                    # $t0 = address of A

    sll     $t1, $s0, 2                     # $t1 = 4 * l
    add     $a0, $t0, $t1                   # $a0 = address of A[l]

    sll     $t1, $s1, 2                     # $t1 = 4 * r
    add     $a1, $t0, $t1                   # $a1 = address of A[r]

    jal     swap                            # call the swap function with $a0 and $a1 as arguments, swap(A[l], A[r])
    j       outer_while                     # jump to the outer_while loop

swap:
    lw      $t0, 0($a0)                     # $t0 = array element with address $a0
    lw      $t1, 0($a1)                     # $t1 = array element with address $a1
    sw      $t1, 0($a0)                     # updates value of array element at address $a0
    sw      $t0, 0($a1)                     # updates value of array element at address $a1
    jr      $ra                             # jump to return address

return:
    lw      $ra, 8($sp)                     # retrieve value of $ra from stack
    lw      $s0, 4($sp)                     # restore value of $s0
    lw      $s1, 0($sp)                     # restore value of $1
    addi    $sp, $sp, 24                    # restore stack pointer
    jr      $ra                             # jump to return address
    

recursive_search:
    move    $t0, $ra                        # $t0 = $ra

    jal     pushToStack                     # push $a0 (address of A) to stack
    move    $a0, $a1
    jal     pushToStack                     # push $a1 (start) to stack
    move    $a0, $a2
    jal     pushToStack                     # push $a2 (end) to stack
    move    $a0, $a3
    jal     pushToStack                     # push $a3 (key) to stack
    move    $a0, $t0
    jal     pushToStack                     # push $t0 = original $ra to stack

    lw      $t0, 12($sp)                    # $t0 = start
    lw      $t1, 8($sp)                     # $t1 = end
    lw      $t3, 4($sp)                     # $t3 = key

    li      $v0, -1                         # set return value = -1

    bgt     $t0, $t1, return_from_search    # if start > end, go to return

while_search:
    sub     $t2, $t1, $t0                   # $t2 = end - start
    li      $t4, 3                          # $t4 = 3
    div     $t2, $t2, $t4                   # $t2 = (end - start) / 3

    add     $t4, $t0, $t2                   # $t4 = mid1 = start + (end - start) / 3
    sub     $t5, $t1, $t2                   # $t5 = mid2 = end - (end - start) / 3

    sll     $t6, $t4, 2

    lw      $t0, 16($sp)
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 = A[mid1]

    bne		$t0, $t3, check_mid2

    move    $v0, $t4
    j       return_from_search              # jump to return_from_search

check_mid2:
    lw      $t0, 16($sp)
    sll     $t6, $t5, 2
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 = A[mid2]

    bne		$t0, $t3, check_less_mid1 

    move    $v0, $t5
    j       return_from_search              # jump to return_from_search

check_less_mid1:
    lw      $t0, 16($sp)
    sll     $t6, $t4, 2
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 = A[mid1]

    bgt		$t3, $t0, check_more_mid2       # check key > A[mid1]
    
    lw      $a0, 16($sp)                    # $a0 = address of A
    lw      $a1, 12($sp)                    # $a1 = start
    addi    $a2, $t4, -1                    # $a2 = mid1 - 1
    move    $a3, $t3                        # $a3 = key
    jal     recursive_search                # call recursive_search with $a0, $a1, $a2 and $a3 as arguments

    j       return_from_search              # jump to return_from_search

check_more_mid2:
    lw      $t0, 16($sp)
    sll     $t6, $t5, 2
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 = A[mid2]

    blt		$t3, $t0, check_mid_recurse       # check key < A[mid2]
    
    lw      $a0, 16($sp)                    # $a0 = address of A
    addi    $a1, $t5, 1                     # $a1 = mid2 + 1
    lw      $a2, 8($sp)                     # $a2 = end
    move    $a3, $t3                        # $a3 = key
    jal     recursive_search                # call recursive_search with $a0, $a1, $a2 and $a3 as arguments

    j       return_from_search              # jump to return_from_search

check_mid_recurse:
    
    lw      $a0, 16($sp)                    # $a0 = address of A
    addi    $a1, $t4, 1                     # $a1 = mid1 + 1
    addi    $a2, $t5, -1                    # $a2 = mid2 - 1
    move    $a3, $t3                        # $a3 = key
    jal     recursive_search                # call recursive_search with $a0, $a1, $a2 and $a3 as arguments
    j       return_from_search              # jump to return_from_search

return_from_search:
    lw      $ra, 0($sp)                     # retrieve value of $ra from stack
    addi    $sp, $sp, 20                    # restore stack pointer

    jr      $ra                             # jump to return address
    