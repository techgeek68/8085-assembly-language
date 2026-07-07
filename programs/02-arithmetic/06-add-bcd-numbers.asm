; Program 10: Addition of Ten BCD Numbers
        LXI  H, 9100H   ; base of ten BCD bytes
        MVI  C, 0AH     ; ten elements
        MVI  D, 00H     ; carry or overflow counter
        MVI  E, 00H     ; running BCD sum
LOOP:   MOV  A, M
        ADD  E
        DAA             ; keep the result valid BCD
        MOV  E, A
        JNC  SKIP
        INR  D          ; count the overflow
SKIP:   INX  H
        DCR  C
        JNZ  LOOP
        MOV  A, E
        STA  9200H      ; BCD sum, low byte
        MOV  A, D
        STA  9201H      ; overflow byte
        HLT
