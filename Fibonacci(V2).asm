.data
	msg1: .asciiz "\nResultado do trigesimo termo da sequencia de fibonacci: "
	msg2: .asciiz "\nResultado do quadragesimo termo da sequencia de fibonacci: "
	msg3: .asciiz "\nResultado do quadragesimo primeiro  termo da sequencia de fibonacci: "
	msg4: .asciiz "\nResultado da Razao aurea entre o F40 e o F41: "
.text
.globl main
main:
	li $a0, 30
	jal calculoFibonacci
	move $s1, $v0
	
	li $a0, 40
	jal calculoFibonacci
	move $s3, $v0
	
	li $a0, 41
	jal calculoFibonacci
	move $s2, $v0
	
	move $a0, $s2
	move $a1, $s3
	jal razaoAurea
	
	#Mensagens finais
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 2
	mov.s $f12, $f0
	syscall
	
	
	
	#Fim da execucao
	li $v0, 10
	syscall

#CALCULOS	
calculoFibonacci:
	beqz $a0, fibonacciZero
	li $v0, 1
	beq $a0, 1, encerrarCalculo
	
	li $v0, 1
	li $v1, 1
	li $t0, 2
	
iniciarCalculo:
	add $t1, $v0, $v1
	move $v0, $v1
	move $v1, $t1
	addi $t0, $t0, 1
	bne $t0, $a0, iniciarCalculo

encerrarCalculo:
	jr $ra

fibonacciZero:
	move $v0, $zero
	jr $ra
razaoAurea:
	mtc1 $a0, $f12  
    	mtc1 $a1, $f14  
    	cvt.s.w $f12, $f12 
    	cvt.s.w $f14, $f14
    	div.s $f0, $f12, $f14
	
	jr $ra
	
	
