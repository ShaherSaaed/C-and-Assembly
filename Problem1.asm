.data
arr:    .space 40
msg:    .asciiz "Enter a number: "
newline: .asciiz "\n"
result: .asciiz "Minimum Element: "

.text
main:
    la $t0, arr
    li $t1, 10
    li $t2, 2147483647

input_loop:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall

    sw $v0, 0($t0)

    blt $v0, $t2, update_min

    addi $t0, $t0, 4
    subi $t1, $t1, 1
    bgtz $t1, input_loop

    j print_result

update_min:
    move $t2, $v0
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
