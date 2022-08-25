
    .globl main

    .data

prompt:
    .asciiz "Enter a positive integer greater than equals to 10: "
result_prime:
    .asciiz "Entered number is a PRIME number."
result_composite:
    .asciiz "Entered number is a COMPOSITE number."
error:
    .asciiz "Please enter positive integer (>= 10)."
newline:
    .asciiz "\n"

    .text

incre:
    addi	$s1, $s1, 1
    b       for

prime:
    li      $v0, 4
    la      $a0, result_prime
    syscall

    b		endf2
    
composite:
    li		$v0, 4
    la      $a0, result_composite
    syscall

    b		endf2
    
main:
    li		$v0, 4
    la		$a0, prompt
    syscall

    li      $v0, 5 		
    syscall
    move 	$s0, $v0

    li      $s1, 2 # i <- 2
    li      $s2, 0 # assign s2 <- 0
    li      $s3, 10 # assign N <- 10

    blt		$s0, $s3, err	# if(n < 10) then goto err

for:

    bge		$s1, $s0, endf1 # if(i >= n) exit loop
    div     $s0, $s1 # store quotient and remainder of n / i
    mfhi    $s3 # store remainder to $s3

    beq     $s3, $s2, endf1 # if(remainder == 0) exit loop
    bne		$s3, $s2, incre  # if(remainder != 0) increment i

endf1:
    bge     $s1, $s0, prime # if i == n then goto prime
    blt		$s1, $s0, composite # if i < n then goto composite
    
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

    li      $v0, 10 # terminate program
    syscall