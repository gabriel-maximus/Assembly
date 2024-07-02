section .data
    Var dq 1
    Letra dq 'p'
    Divisor dq 4
section .text
global _start
_start:
    mov rcx, 100
    jmp enquanto

escreveP:
    mov rbx, qword[Letra]
    inc qword[Var]
    loop enquanto

enquanto:
    mov rdx, 0
    mov rax, qword[Var]
    div qword[Divisor]
    cmp rdx, 0
    je escreveP
    mov rbx, qword[Var]
    inc qword[Var]
    loop enquanto

last:
    mov rax, 60
    mov rdi, 0
    syscall


