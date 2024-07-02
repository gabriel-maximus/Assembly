section .data
    A1 dq 1
    Resultado dq 1
    N dq 6
section .text
global _start

_start:
    mov rax, qword[N]
    cmp rax, 1
    je resultado
    cmp rax, 2
    je resultado

    mov rcx, qword[N]
    sub rcx, 2
enquanto:
    mov rax, qword[Resultado]
    mov rdx, qword[Resultado]
    add rax, qword[A1]
    mov qword[A1], rdx
    mov qword[Resultado], rax
    loop enquanto

resultado:
    mov rbx, qword[Resultado]

last:
    mov rax, 60
    mov rdi, 0
    syscall