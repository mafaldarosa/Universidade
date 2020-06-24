# input and output
# using global data
.data
S: .space 10

.text
la $a0, S
li $a1, 10
li $v0, 8
syscall 

li $v0, 4
la $a0, S
syscall
