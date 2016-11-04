# Simple MIPS code that reads in 2 numbers, adds them, and prints the answer

### Standard header information	
	.data
	.align 2

### Define strings	
input:  .asciiz "\nEnter a number>"
input2:	.asciiz "\nEnter another number>"
cr: 	.asciiz "\n"

### Standard preliminaries
        .text
        .globl main
main:
	
# Prompt for first input	
        li 	$v0,4;			# System call code 4 for print string
        la 	$a0,input;		# Argument string as input
        syscall;			# Print the string
# Read first input 
        li 	$v0,5;			# System call code 5 to read int input
        syscall;			# Read it
	move 	$s0,$v0;	# move number into s0
# Prompt for second input
        li 	$v0,4;			# System call code 4 for print string
        la 	$a0,input2;		# Argument string as input
        syscall;			# Print the string
# Read second input
        li 	$v0,5;			# System call code 5 to read int input
        syscall;			# Read it
	move 	$s1,$v0;	# move number into s1
# Add the two numbers, put the result in s0
	add 	$s0,$s0,$s1;		# do sum, result into s0
# Print the result
	li 	$v0, 1;       		# System call 1 code for print int
	move $a0, $s0;    	# put s0 in a0 to pass to syscall
	syscall;			# print the results
# Print a carriage return
	li	$v0,4;			# System call code 4 for print string
	la	$a0,cr;			# Argument string as input
	syscall;			# Print the string

### Make a clean exit from the program
        li 	$v0,10;			# System call code for exit
        syscall                         # exit
