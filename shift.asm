section .data
    wNumA dw 20
    wNumB dw 3

section .text
global _start
_start:
    ;divide por 2
    shr word[wNumA], 1
    ;multiplica por 2
    shl word[wNumB], 1

teste:
    mov cx, word[wNumA]
    mov dx, word[wNumB]

    mov rax, 60
    mov rdi, 0
    syscall