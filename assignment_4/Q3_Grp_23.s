#########################################
## COA LAB Assignment 4 Q3             ##
## Group Number 23                     ##
## Ashwani Kumar Kamal (20CS10011)     ##
## Astitva (20CS30007)                 ##
#########################################

# This program sorts an array of 10 integers recursively (quick sort algorithm)
# then searches for array key k entered by user
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
main:
    jal     initialize_sp                       # initialize stack

    li		$v0, 4
    la		$a0, prompt
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

read_array:
    li      $t0, 0                              # count variable <- 0
    b       while_read

while_read:
    bge     $t0, 40, exit_read                  # if count >= 40, exit from read

    li      $v0, 5                              # read int input by user
    syscall 

    sw      $v0, array($t0)                     # store input in array
    addi    $t0, $t0, 4                         # count++
    b       while_read                          # continue to reading loop

exit_read:
    la      $a0, array                          # $a0 <- $array
    li      $a1, 0                              # $a1 <- 0
    li      $a2, 9                              # $a2 <- 9
    jal     recursive_sort                      # call recursive_sort function

print_array:
    li      $v0, 4
    la      $a0, sorted_msg                     # print sorted_msg string
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall
    li      $t0, 0                              # i <- 0
    
    b       while_print                         # continue to print loop

while_print:
    bge     $t0, 40, exit_print                 # if i >= 40, exit from print

    li      $v0, 1
    lw      $a0, array($t0)                     # print arr[count]
    syscall

    li      $v0, 4
    la      $a0, whitespace                     # print whitespace for convinience
    syscall

    addi    $t0, $t0, 4                         # count++

    b       while_print                         # continue to print loop

exit_print:

    li      $v0, 4
    la      $a0, newline
    syscall

    li		$v0, 4
    la		$a0, key_prompt                     # issue prompt for key input
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 5
    syscall    

    move    $s3, $v0                            #$s3 <- key
    
    la      $a0, array                          # $a0 <- &array[0]
    li      $a1, 0                              # $a1 <- 0
    li      $a2, 9                              # $a2 <- 9
    move    $a3, $v0                            # $a3 <- key
    jal     recursive_search                    # call recursive_search function

    move    $s0, $v0                            # get return index result

    move    $sp, $fp                            # free stack

    move    $a0, $s3
    li      $v0, 1                              # print key
    syscall

    li      $v0, 4
    la      $a0, whitespace
    syscall    

    blt     $s0, $zero, not_found               # if index < 0, go to not_found

    li      $v0, 4
    la      $a0, found_label                    # print found_label string
    syscall

    move    $a0, $s0
    li      $v0, 1                              # print index
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                             # terminate program
    syscall                         

not_found:

    li      $v0, 4
    la      $a0, not_found_label                # print not_found_label string
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10                             # terminate program
    syscall  

# Functions, segments and loops

# Since we need the stack for small number of variables, we will push to stack normally and use base addressing to retrieve
initialize_sp:
    addi    $sp, $sp -4                         # make space for 1 word
    sw      $fp, 0($sp)                         # push $fp in stack
    move    $fp, $sp                            # $fp <- $sp (for freeing stack later)
    jr      $ra

push_sp:
    addi    $sp, $sp, -4                        # make space for 1 word
    sw      $a0, 0($sp)                         # push $a0 in stack
    jr      $ra

recursive_sort:
    # temporarily move $ra to $t0 as calling push_sp will change the value of $ra
    move    $t0, $ra

    # push required arguments to stack
    jal     push_sp

    move    $a0, $a1
    jal     push_sp                             # push left to stack

    move    $a0, $a2
    jal     push_sp                             # push right to stack

    move    $a0, $t0
    jal     push_sp                             # push $ra to stack

    # need to push $s0 and $s1 to stack for next recursive calls
    # l and r values

    move    $a0, $s0
    jal     push_sp                             # save left in stack

    move    $a0, $s1
    jal     push_sp                             # save right in stack

    lw      $s0, 16($sp)                        # l <- left
    lw      $s1, 12($sp)                        # r <- right

outer_while:
    bge     $s0, $s1, return                    # if l >= r, return from sort

inner_while_l:
    lw      $t0, 12($sp)                        # $t0 <- right
    bge     $s0, $t0, inner_while_r             # if l >= right, go to inner_while_r

    lw      $t0, 20($sp)                        # $t0 <- &array[0]

    sll     $t1, $s0, 2                         # $t1 <- 4 * l
    add     $t1, $t0, $t1                       # $t1 <- &array[l]
    lw      $t2, 0($t1)                         # $t2 <- array[l]

    lw      $t1, 16($sp)                        # $t1 = p <- left
    sll     $t1, $t1, 2                         # $t1 <- 4 * p
    add     $t1, $t0, $t1                       # $t1 <- &array[p]
    lw      $t3, 0($t1)                         # $t3 <- array[p]

    bgt     $t2, $t3, inner_while_r             # if array[l] > array[p], go to inner_while_r

    addi    $s0, $s0, 1                         # l++
    j       inner_while_l                       # continue inner_while_l

inner_while_r:
    lw      $t0, 16($sp)                        # $t0 <- left
    ble     $s1, $t0, swap_and_recurse          # if r <= left, go to call function again recursively

    lw      $t0, 20($sp)                        # $t0 <- &array[0]

    sll     $t1, $s1, 2                         # $t1 <- 4 * r
    add     $t1, $t0, $t1                       # $t1 <- &array[r]
    lw      $t2, 0($t1)                         # $t2 <- array[r]

    lw      $t1, 16($sp)                        # $t1 = p <- left
    sll     $t1, $t1, 2                         # $t1 <- 4 * p
    add     $t1, $t0, $t1                       # $t1 <- &array[p]
    lw      $t3, 0($t1)                         # $t3 <- array[p]

    blt     $t2, $t3, swap_and_recurse          # if array[r] < array[p], call function again recursively

    addi    $s1, $s1, -1                        # r--
    j       inner_while_r                       # continue inner_while_r loop

swap_and_recurse:
    blt     $s0, $s1, exit_loop_swap            # if l < r, go to exit loop and swap
    lw      $t0, 20($sp)                        # $t0 <- &array[0]

    lw      $t1, 16($sp)                        # p <- left
    sll     $t1, $t1, 2                         # $t1 <- 4 * p
    add     $a0, $t0, $t1                       # $a0 <- &array[p]

    sll     $t1, $s1, 2                         # $t1 <- 4 * r
    add     $a1, $t0, $t1                       # $a1 <- &array[r]

    jal     swap                                # call the swap function (swap(array[p], array[r])

    lw      $a0, 20($sp)                        # $a0 <- &array[0]
    lw      $a1, 16($sp)                        # $a1 <- left
    addi    $a2, $s1, -1                        # $a2 <- r - 1
    jal     recursive_sort                      # call recursive_sort(array, left, r - 1)

    lw      $a0, 20($sp)                        # $a0 <- &array[0]
    addi    $a1, $s1, 1                         # $a1 <- r + 1
    lw      $a2, 12($sp)                        # $a2 <- right
    jal     recursive_sort                      # call recursive_sort(array, r + 1, right)

    j       return                              # jump to return

exit_loop_swap:
    lw      $t0, 20($sp)                        # $t0 <- &array[0]

    sll     $t1, $s0, 2                         # $t1 <- 4 * l
    add     $a0, $t0, $t1                       # $a0 <- &array[l]

    sll     $t1, $s1, 2                         # $t1 <- 4 * r
    add     $a1, $t0, $t1                       # $a1 <- &array[r]

    jal     swap                                # call the swap function (swap(array[l], array[r])
    j       outer_while                         # continue outer_while loop

# swap procedure to swap elements as address stored in $a0 and $a1

swap:
    lw      $t0, 0($a0)
    lw      $t1, 0($a1)
    sw      $t1, 0($a0)
    sw      $t0, 0($a1)
    jr      $ra                             

return:
    # restore values stored in stack and deallocate

    lw      $ra, 8($sp)                     # get $ra from stack
    lw      $s0, 4($sp)                     # restore value of $s0
    lw      $s1, 0($sp)                     # restore value of $1

    # pop elements to retain stack pointer assignment at the end of function

    addi    $sp, $sp, 24
    jr      $ra                             # jump to return address
    

recursive_search:
    # temporarily move $ra to $t0 as calling push_sp will change the value of $ra
    move    $t0, $ra

    # push required arguments to stack
    jal     push_sp

    move    $a0, $a1
    jal     push_sp                         # push start to stack

    move    $a0, $a2
    jal     push_sp                         # push end to stack

    move    $a0, $a3
    jal     push_sp                         # push key to stack

    move    $a0, $t0
    jal     push_sp                         # push $ra to stack

    lw      $t0, 12($sp)                    # $t0 <- start
    lw      $t1, 8($sp)                     # $t1 <- end
    lw      $t3, 4($sp)                     # $t3 <- key

    li      $v0, -1                         # set return value <- -1

    bgt     $t0, $t1, return_from_search    # if start > end, go to return

while_search:
    li      $t4, 3                          # $t4 <- 3
    sub     $t2, $t1, $t0                   # $t2 <- end - start
    div     $t2, $t2, $t4                   # $t2 <- (end - start) / 3

    add     $t4, $t0, $t2                   # $t4 = mid1 <- start + (end - start) / 3
    sub     $t5, $t1, $t2                   # $t5 = mid2 <- end - (end - start) / 3

    sll     $t6, $t4, 2                     # $t6 <- mid1 * 4

    lw      $t0, 16($sp)
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 <- array[mid1]

    bne		$t0, $t3, check_mid2            # if array[mid1] != key, continue to check mid2

    move    $v0, $t4                        # $v0 <- mid1
    j       return_from_search              # return_from_search

check_mid2:
    lw      $t0, 16($sp)
    sll     $t6, $t5, 2                     # $t6 <- mid2 * 4
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 <- array[mid2]

    bne		$t0, $t3, check_less_mid1       # if array[mid2] != key, continue to check if value less than mid1

    move    $v0, $t5                        # $v0 <- mid2
    j       return_from_search              # return_from_search

check_less_mid1:
    lw      $t0, 16($sp)
    sll     $t6, $t4, 2                     # $t6 <- mid1 * 4
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 <- array[mid1]

    bgt		$t3, $t0, check_more_mid2       # if key > array[mid1], continue to check if value is more than mid2
    
    lw      $a0, 16($sp)                    # $a0 <- &array[0]
    lw      $a1, 12($sp)                    # $a1 <- start
    addi    $a2, $t4, -1                    # $a2 <- mid1 - 1
    move    $a3, $t3                        # $a3 <- key
    jal     recursive_search                # call recursive_search

    j       return_from_search              # return_from_search

check_more_mid2:
    lw      $t0, 16($sp)
    sll     $t6, $t5, 2                     # $t6 <- mid2 * 4
    add     $t0, $t0, $t6
    lw      $t0, 0($t0)                     # $t0 <- array[mid2]

    blt		$t3, $t0, check_mid_recurse     # if key < array[mid2], continue to search between mid1 and mid2
    
    lw      $a0, 16($sp)                    # $a0 <- &array[0]
    addi    $a1, $t5, 1                     # $a1 <- mid2 + 1
    lw      $a2, 8($sp)                     # $a2 <- end
    move    $a3, $t3                        # $a3 <- key
    jal     recursive_search                # call recursive_search

    j       return_from_search              # return_from_search

check_mid_recurse:
    
    lw      $a0, 16($sp)                    # $a0 <- &array[0]
    addi    $a1, $t4, 1                     # $a1 <- mid1 + 1
    addi    $a2, $t5, -1                    # $a2 <- mid2 - 1
    move    $a3, $t3                        # $a3 <- key
    jal     recursive_search                # call recursive_search

    j       return_from_search              # return_from_search

return_from_search:
    # restore values stored in stack and deallocate

    lw      $ra, 0($sp)                     # get $ra from stack

    # pop elements to retain stack pointer assignment at the end of function

    addi    $sp, $sp, 20
    jr      $ra                             # jump to return address
    