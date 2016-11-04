.data
.align 2
.text
.globl main
main:

li $t3, 8
li $t1, 5
li $t2, 3

add $t3, $t3, $t2

sub $t3, $t3, $t1

add $t2, $t3, $t1