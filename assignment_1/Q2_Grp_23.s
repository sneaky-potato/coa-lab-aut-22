
    .globl main

    .data

prompt1:
    .asciiz "Enter the first positive integer: "
prompt2:
    .asciiz "Enter the second positive integer: "
result:
    .asciiz "GCD of the two integers is: "
error:
    .asciiz "Please enter positive integers."
newline:
    .asciiz "\n"

    .text
        
main:
    li		$v0, 4
    la		$a0, prompt1
    syscall

    li      $v0, 5 		
    syscall
    move 	$s0, $v0	# input a

    li		$v0, 4
    la      $a0, prompt2
    syscall

    li      $v0, 5
    syscall
    move    $s1, $v0    # input b

    # s0 <- a
    # s1 <- b
    # s2 <- 0

    li      $s2, 0      # assign s2 <- 0

    ble		$s0, $s2, err	# if a < 0 
    ble     $s1, $s2, err   # if b < 0

    beq     $s0, $s2, endfb # check for a == 0

for:
    beq     $s1, $s2, endfa # end when b == 0

    bgt		$s0, $s1, subtracta
    ble		$s0, $s1, subtractb

subtracta:
    sub		$s0, $s0, $s1 # a = a - b
    b		for
        
subtractb:
    sub     $s1, $s1, $s0 # b = b - a
    b		for

endfa:
    move    $s3, $s0
    j show_result

endfb:
    move    $s3, $s1
    j show_result

show_result:

    li      $v0, 4
    la      $a0, result
    syscall

    li      $v0, 1
    move    $a0, $s3
    syscall

    j endf

err:
    li      $v0, 4
    la      $a0, error
    syscall

    j endf


endf:
    li      $v0, 4
    la      $a0, newline
    syscall
    
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10
    syscall