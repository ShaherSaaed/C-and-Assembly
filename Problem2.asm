.data
arr:    .space 40
msg:    .asciiz "Enter a number: "
newline: .asciiz "\n"
result: .asciiz "Count of even numbers is: "

.text

main:
    la $t0, arr
    li $t1, 10
    li $t2, 0

input_loop:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall

    sw $v0, 0($t0)

    rem $t3, $v0, 2
    beqz $t3, increment_count

    addi $t0, $t0, 4
    subi $t1, $t1, 1
    bgtz $t1, input_loop

    j print_result

increment_count:
    addi $t2, $t2, 1
    addi $t0, $t0, 4
    subi $t1, $t1, 1
    bgtz $t1, input_loop

print_result:
    li $v0, 4
    la $a0, result
    syscall

    move $a0, $t2
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
