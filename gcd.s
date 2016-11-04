.data
.align 2

input: .asciiz "\nEnter first number:"
input2: .asciiz "\nEnter second number:"
error: .asciiz "\nError - type in a positive integer"
blank: .asciiz "\n"

.text
.globl main

main:

INPUT1:
#Read first input
    li $v0,4;
    la $a0,input;
    syscall;
    li $v0,5;
    syscall;
    move $a0,$v0;
    bgtz $a0,INPUT2;
    li $v0,4;
    la $a0,error;
    syscall;
    j INPUT1;
    
INPUT2:
#Read second input
    li $v0,4;
    la $a0,input2;
    syscall;
    li $v0,5;
    syscall;
    move $a1,$v0;
    bgtz $a1,GCD;
    li $v0,4;
    la $a0,error;
    syscall;
    move $s0,$a0;
    move $s1,$a1;
    j INPUT2;
    

GCD:
beq $a1,$zero,EQ;
addi $t0,$s1,0; #make $t0 equal to $s1
add $s2,$s2,$zero;

j ST

UP:
addi $s2,$s2,1;

MOD:
mult $s2,$s1;
mflo $s4;
sub $s4,$s0,$s4;
bgez $s4,UP;

move $s1,$t1;
add $s0,$t0,$zero;

EQ:



ST:
li $v0,1;
syscall;
li $v0,4;
la $a0,blank;
syscall;
li $v0,10;
syscall;