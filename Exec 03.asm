.data
prompt1: .asciiz "Digite a idade: "
prompt2: .asciiz "Digite o tempo de serviço: "
yes: .asciiz "sim"
no: .asciiz "nao"

.text

.globl main

main:
    # Imprime o prompt para a idade
    li $v0, 4
    la $a0, prompt1
    syscall

    # Lê a idade
    li $v0, 5
    syscall
    move $t0, $v0

    # Imprime o prompt para o tempo de serviço
    li $v0, 4
    la $a0, prompt2
    syscall

    # Lê o tempo de serviço
    li $v0, 5
    syscall
    move $t1, $v0

    # Verifica as condições de aposentadoria
    li $t2, 65
    bge $t0, $t2, print_yes

    li $t2, 35
    bge $t1, $t2, print_yes

    li $t2, 60
    blt $t0, $t2, print_no

    li $t2, 30
    bge $t1, $t2, print_yes

print_no:
    # Imprime "nao"
    li $v0, 4
    la $a0, no
    syscall
    j end

print_yes:
    # Imprime "sim"
    li $v0, 4
    la $a0, yes
    syscall

end:
    # Termina o programa
    li $v0, 10
    syscall
