.data
arr:    .space 40
msg:    .asciiz "Enter a number: "
newline: .asciiz "\n"
result: .asciiz "Average is: "

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
    add $t2, $t2, $v0

    addi $t0, $t0, 4
    subi $t1, $t1, 1
    bgtz $t1, input_loop

    j calculate_average

calculate_average:
    mtc1 $t2, $f2
    cvt.s.w $f2, $f2
    li $t3, 10
    mtc1 $t3, $f4
    cvt.s.w $f4, $f4
    div.s $f0, $f2, $f4
    j print_result

print_result:
    li $v0, 4
    la $a0, result
    syscall

    mov.s $f12, $f0
    li $v0, 2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall