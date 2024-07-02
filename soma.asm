section .data
    bNum1 db 42
    bNum2 db 73
    bAns db 0
    wNum1 dw 4321
    wNum2 dw 1234
    wAns dw 0
    dNum1 dd 42000
    dNum2 dd 73000
    dAns dd 0
    qNum1 dq 42000000
    qNum2 dq 73000000
    qAns dq 0

section .text

global _start

_start:
    ; bAns = bNum1 + bNum2
    mov al, byte [bNum1]
    add al, byte [bNum2]
    mov byte [bAns], al
    ; wAns = wNum1 + wNum2
    mov ax, word [wNum1]
    add ax, word [wNum2]
    mov word [wAns], ax
    ; dAns = dNum1 + dNum2
    mov eax, dword [dNum1]
    add eax, dword [dNum2]
    mov dword [dAns], eax
    ; qAns = qNum1 + qNum2
    mov rax, qword [qNum1]
    add rax, qword [qNum2]
    mov qword [qAns], rax
    
    mov rax, 60
    mov rdi, 0
    syscall