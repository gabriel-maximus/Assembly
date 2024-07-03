section .data
    bNum1 db 20
    bNum2 db 3
    wAns dw 0

    wNum3 dw 20
    wNum4 dw 3
    wAns2 dw 0

section .text
global _start
_start:
    mov al, byte[bNum1]
    mul byte[bNum2]
    mov word[wAns], ax

    mov ax, word[wNum3]
    imul ax, word[wNum4]
    mov word[wAns2], ax

    mov rax, 60
    mov rdi, 0
    syscall