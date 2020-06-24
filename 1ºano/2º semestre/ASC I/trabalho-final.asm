.data 
S: .space 256    # INPUT
E: .data
.asciiz "Erro"

PI: 
.ascii "Pilha:"
PE:.byte 0x0a, 0x00

M: 
.ascii "*** Calculadora polaca inversa ***"
.byte 0x0a
.ascii "*** Autores: ***"
.byte 0x0a
.ascii "*** ASC1 2017/2018 ***"
.byte 0x0a, 0x0a, 0x00

#--------------------------------------------------#

.text
addi $sp, $sp, 4

#Intr
li $v0, 4 
la $a0, M
syscall

jal EST_PILHA
nop

MAIN:		#LOOP
INPUT:
.text

la $a0, S
li $a1, 256
li $v0, 8
syscall

#STRING_ANALISE

la $s2, S

LER_STRING:
li $t7, 0x0a
addi $t0, $zero, 0x20
lb $s1, 0($s2)		#t1 - pos do null
addi $s2, $s2, 1
beq $s1, $t7, ENTER
nop
bne $s1,$t0, LER_STRING
nop	
j ANALISE
nop

ANALISE:
lb $s1, -2($s2)
li $t2, 0x63
li $t3, 0x40
li $t4, 0x29
li $t5, 0x64
li $t6, 0x6f
ble $s1, $t4, ERROS 
nop
bge $s1, $t3, ERROS
nop
srl $s3, $s3, 8
beq $t2, $s3, CLEAR
nop
beq $t5, $t3, DUP
nop
beq $t6, $s3, OFF
nop
sub $s1, $s1, 48
addi $sp, $sp, -4
sw $s1, ($sp)
j LER_STRING
nop


#FUNC


EST_PILHA:
move $t2 ,$sp
li $v0, 4 
la $a0, PI
syscall
addi $t0, $zero, 0x7fffeffc
loop2:
lw $a0, 0($t0)
beqz $a0, loop3
addi $v0, $zero, 1
syscall
loop3:
li $v0, 4 
la $a0, PE
syscall
subi $t0,$t0,4
ble $t2, $t0, loop2
jr $ra
nop


ERROS:
sub $s4, $sp, 0x7fffeffc
li $t1, 0x1
li $t2, 0x2
beq $t3, $t1, Op1
nop
bge $t3, $t2, Op2
nop
jr $ra
nop

Op1:

li $t1, 0x6e
or $t1, $t1, $s1
li $t2, 0x64
or $t2, $t2, $s1
beq $t1, $t1, NEG
nop
beq $t2, $s1, DUP
nop
li $v0, 4
la $a0, E
syscall
jr $ra
nop

Op2: #adicionar erro de poucos dados. melhor por o swap em op1 e colocar uma comparacao de varias letras
li $t1,0x2b
li $t2, 0x2d
li $t3, 0x2a
li $t4,0x2f
li $t5, 0x73776170
beq $t1, $s1, SOMA
nop
beq $t2, $s1, SUBT
nop
beq $t3, $s1, MULT
nop
beq $t4, $s1, DIV
nop
beq $t5, $s1, SWAP
nop
li $v0, 4
la $a0, E
syscall
jr $ra
nop

MULT:
addi $t1, $zero, 0
addi $t2, $zero, 0
lw $t1, 0($sp)
lw $t2, 4($sp)
mul $t1, $t1, $t2
sw $zero, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($sp)
j LER_STRING
nop

DIV:
addi $t1, $zero, 0
addi $t2, $zero, 0
lw $t1, 0($sp)
lw $t2, 4($sp)
div $t1, $t1, $t2
sw $zero, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($sp)
j LER_STRING
nop

SOMA:
addi $t1, $zero, 0
addi $t2, $zero, 0
lw $t1, 0($sp)
lw $t2, 4($sp)
add $t1, $t1, $t2
sw $zero, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($sp)
j LER_STRING
nop

SUBT:
addi $t1, $zero, 0
addi $t2, $zero, 0
lw $t1, 0($sp)
lw $t2, 4($sp)
sub $t1, $t1, $t2
sw $zero, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($sp)
j LER_STRING
nop

NEG:
addi $t1, $zero, 0
lw $t1, 0($sp)
sub $t1, $zero, $t1
nop
j LER_STRING
nop

DUP:
addi $t3, $zero, 0x7fffeffc
ciclo:
lw $t1, 36($sp)
sw $t2, 32($sp)
addi $sp, $sp, -4
ble $sp, $t3, ciclo
nop
add $t1, $zero, $t2
j LER_STRING
nop

CLEAR:
li $t1, 0x7fffeffc
addi, $sp, $sp, -4
beq $sp, $t1, LER_STRING
add $sp, $zero, $zero    #lw $sp, $zero
j CLEAR
nop

DEL:
addi $sp, $sp, -4
j LER_STRING
nop

SWAP:
lw $t1, 0($sp)
lw $t2, 4($sp)
sw $t2, 0($sp)
sw $t1, 4($sp)
j LER_STRING
nop

OFF:
li $t1, 0x7fffeffc
addi $sp, $sp, -4
beq $sp, $t1, FIM
nop
add $sp, $zero, $zero    #lw $sp, $zero
j OFF
nop

ENTER:
jal EST_PILHA 
nop
jal INPUT
nop

FIM:
