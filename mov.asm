section .data
    bNum db 5
    wNum dw 5000
    dNum dd 5000000
    qNum dq 50000000000000
    bAns db 0
    wAns dw 0
    dAns dd 0
    qAns dq 0

section .text
global _start

_start:
    mov al, byte[bNum]
    mov byte[bAns], al

    mov ax, word[wNum]
    mov word[wAns], ax

    mov eax, dword[dNum]
    mov dword[dAns], eax

    mov rax, qword[qNum]
    mov qword[qAns], rax

    mov rax, 60
    mov rdi, 0
    syscall