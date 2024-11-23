section .text
bits 64
default rel
global asmaccel

asmaccel:
    mov rax, rcxd
    sub rax, rdx
    ret