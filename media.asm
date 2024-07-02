section .data
    P1 dq 3
    P2 dq 1
    Divisor dq 2
    Media dq 0
    Pass dq 'Passou',10
    TamPass equ $-Pass
    ProvaF dq 'Prova Final',10
    TamProvaF equ $-ProvaF
    Reprova dq 'Reprovado',10
    TamReprova equ $-Reprova

section .text
global _start

_start:

    mov rax, qword[P1]
    add rax, qword[P2]
    
    mov rdx, 0
    div qword[Divisor]
    mov qword[Media], rax

    cmp qword[Media], 7
    jge passou

    cmp qword[Media], 4
    jge pf
    jmp reprovado


passou:
    mov rax, 1
    mov rdi, 1
    mov rsi, Pass
    mov rdx, TamPass
    syscall
    jmp last

pf:
    mov rax, 1
    mov rdi, 1
    mov rsi, ProvaF
    mov rdx, TamProvaF
    syscall
    jmp last 

reprovado: 
    mov rax, 1
    mov rdi, 1
    mov rsi, Reprova
    mov rdx, TamReprova
    syscall
    jmp last

last:
    mov rax, 60
    mov rdi, 0
    syscall
