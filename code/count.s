
# print the numbers from 1 to 100
.data
	mystr: .asciiz "Done"

.text
main:
	li $s0 0
	li $t0 10

LOOP:   addi $s0 $s0 1

	move $a0 $s0
	li $v0 1
	syscall # print int

	beq $s0 $t0 END
	j LOOP
END:	nop

	li $v0 4
	la $a0 mystr
	syscall # print string

	li $v0 10
	syscall
