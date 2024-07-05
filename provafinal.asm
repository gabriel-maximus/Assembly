section .data
    PrimeiroNumero dq 'Digite o primeiro numero',10
    TamPrimeiroNumero equ $-PrimeiroNumero
    SegundoNumero dq 'Digite o segundo numero',10
    TamSegundoNumero equ $-SegundoNumero
    Operacao dq 'Digite a operacao',10
    TamOperacao equ $-Operacao

    Input1 dq '0'
    TamInput1 equ $-Input1
    Input2 dq '0'
    TamInput2 equ $-Input2
    InputOp dq '0'
    TamInputOp equ $-InputOp

    Resultado dq '0'
    TamResultado equ $-Resultado

    DivisaoZero dq 'Erro divisao por zero', 10
    TamDivisaoZero equ $-DivisaoZero

section .bss
    ;Input1 resb TamInput1
    ;Input2 resb TamInput2
    ;InputOp resb TamInputOp
section .text
global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, PrimeiroNumero
    mov rdx, TamPrimeiroNumero
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, Input1
    mov rdx, TamInput1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, SegundoNumero
    mov rdx, TamSegundoNumero
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, Input2
    mov rdx, TamInput2
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, Operacao
    mov rdx, TamOperacao
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, InputOp
    mov rdx, TamInputOp
    syscall

    movzx rax, byte[InputOp]
    cmp rax, "+"
    je soma
    cmp rax, "-"
    je subtracao
    cmp rax, "*"
    je multiplicacao
    cmp rax, "/"
    je divisao
    jmp last

soma:
    movzx rax, byte[Input1]
    movzx rbx, byte[Input2]
    sub rax, '0'
    sub rbx, '0'

    add rax, rbx

    add rax, '0'
    
    mov qword[Resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, Resultado
    mov rdx, TamResultado
    syscall
    jmp last

subtracao:
    movzx rax, byte[Input1]
    movzx rbx, byte[Input2]
    sub rax, '0'
    sub rbx, '0'

    sub rax, rbx

    add rax, '0'
    
    mov qword[Resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, Resultado
    mov rdx, TamResultado
    syscall
    jmp last

multiplicacao:
    movzx rax, byte[Input1]
    movzx rbx, byte[Input2]
    sub rax, '0'
    sub rbx, '0'

    mul rbx

    add rax, '0'
    
    mov qword[Resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, Resultado
    mov rdx, TamResultado
    syscall
    jmp last

divisao:
    movzx rax, byte[Input1]
    movzx rbx, byte[Input2]
    sub rax, '0'
    sub rbx, '0'

    cmp rbx, 0
    je errodivisao

    mov rdx, 0
    div rbx

    add rax, '0'
    
    mov qword[Resultado], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, Resultado
    mov rdx, TamResultado
    syscall
    jmp last

errodivisao:
    mov rax, 1
    mov rdi, 1
    mov rsi, DivisaoZero
    mov rdx, TamDivisaoZero
    syscall
    jmp last

last:
    mov rax, 60
    mov rdi, 0
    syscall
