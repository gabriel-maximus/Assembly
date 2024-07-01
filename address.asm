section .data
    Var dq 5

section .text
global _start

_start:
    ;printa endereço (errado)
    mov rax, Var
    ;printa variavel
    mov rax, qword[Var]
    ;printa endereço (certo)
    lea rax, qword[Var]