
    .globl main

    .data

prompt:
    .asciiz "Enter a positive integer: "
result1:
    .asciiz "Entered number is a perfect number."
result2:
    .asciiz "Entered number is not a perfect number."
error:
    .asciiz "Please enter positive integer."
newline:
    .asciiz "\n"

    .text

incre:
    add     $s2, $s2, $s1 # sum <- sum + i
    addi    $s1, $s1, 1 # i <- i + 1
    b		for

perfect:
    li      $v0, 4
    la      $a0, result1 # print perfect number
    syscall

    b		endf2

not_perfect:
    li      $v0, 4
    la      $a0, result2 # print NOT a perfect number
    syscall

    b		endf2
    
main:
    li		$v0, 4
    la		$a0, prompt
    syscall

    li      $v0, 5 		
    syscall
    move 	$s0, $v0 # input n

    li      $s1, 1 # i <- 1
    li      $s2, 0 # sum <- 0
    li      $s4, 0 # assign $s4 <- 0

    ble		$s0, $s4, err	# if(n <= 0) then goto err
    

for:
    bge     $s1, $s0, endf1 # if(i >= n) exit loop
    div     $s0, $s1 # store quotient and remainder of n / i
    mfhi    $s3 # store remainder to $s3
    beq     $s3, $s4, incre # if(remainder == 0) increment sum
    addi    $s1, $s1, 1 # i <- i + 1
    b		for # continue

endf1:
    beq     $s0, $s2, perfect # if(n == sum) output perfect number
    bne     $s0, $s2, not_perfect # if(n != sum) output NOT perfect number

err: 
    li      $v0, 4
    la      $a0, error # print error message
    syscall

    j endf2

endf2:
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10 # Terminate program
    syscall