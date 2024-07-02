section .data
    wNumA dw 20
    wNumB dw 3
    wAns dw 0
    wMod dw 0

section .text
global _start
_start:
    mov ax, word[wNumA]
    mov dx, 0
    div word[wNumB]

    mov word[wAns], ax
    mov word[wMod], dx

    mov rax, 60
    mov rdi, 0
    syscall