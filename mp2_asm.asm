section .data
km dq 1000
hr dq 3600

section .text
bits 64
default rel
global asmaccel

asmaccel:
    ; initialvel@xmm0, finalvel@xmm1, time@xmm2
    
    ; calculate numerator
    subsd xmm1, xmm0 
    
    ; convert to m/s
    movsd xmm3, [km]
    mulsd xmm1, xmm3
    movsd xmm3, [hr]
    divsd xmm1, xmm3
    
    ; divide by time
    divsd xmm1, xmm2
    
    ; round and convert to int
    roundsd xmm1, xmm1, 0
    cvttsd2si rax, xmm1
       
    ret
    
