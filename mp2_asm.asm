section .text
bits 64
default rel
global asmaccel

asmaccel:
    ; n@rcx, matrix@xmm0, results@r8
    ; matrix - [0]=initial vel, [1]=final vel, [2]=time
    ; compute acceleration: (Vf - Vi)/T
    ; convert km/h to m/s
    ; convert final answer ato int
    L1:
        
        
        
        add r8, 4
        loop L1
    ret
    
; for reference only

asmvecsub:
    ; n@rcx, vec1@rdx, vec2@r8, vec3@r9
    L1:
        mov rax, [rdx]
        mov rbx, [r8]
        sub rax, rbx
        mov [r9], rax
        add rdx, 4
        add r8, 4
        add r9, 4
        loop L1
        
    ret