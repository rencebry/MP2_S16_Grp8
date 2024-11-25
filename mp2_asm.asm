section .data
var1 dq 3.6

section .text
bits 64
default rel
global asmaccel

asmaccel:
  
    ; divisor for conversion
    movsd xmm2, [var1]
    
    ; convert each register's value
    
    divsd xmm0, xmm2
    divsd xmm1, xmm2
    
    ; calculate numerator
    
    subsd xmm1, xmm0 
    
    ; divide by time
    cvtsi2sd xmm2, edi
    divsd xmm1, xmm2
    
    ; round and convert to int
    roundsd xmm1, xmm1, 0
    cvttsd2si eax, xmm1
       
    ret