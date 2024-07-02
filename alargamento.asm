section .data
    Var db 10

section .text
global _start

_start:
    ;move byte para rax
    movzx rax, byte[Var]

    mov rax, 60
    mov rdi, 0
    syscall
