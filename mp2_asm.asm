
section .text
bits 64
default rel
global asmaccel

asmaccel:
  
    ; divisor for conversion
    movsd xmm2, 3.6
    
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
    
; for reference only

; asmvecsub:
    ; n@rcx, vec1@rdx, vec2@r8, vec3@r9
  ;  L1:
   ;     mov rax, [rdx]
   ;    mov rbx, [r8]
   ;    sub rax, rbx
   ;    mov [r9], rax
   ;    add rdx, 4
   ;    add r8, 4
   ;    add r9, 4
   ;    loop L1
        
    ;ret