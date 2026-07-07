; Program 11: Multiplication of Two 8 bit Numbers by Repeated Addition
        LDA  9000H      ; A gets the multiplicand
        MOV  C, A       ; C keeps the multiplicand safe
        LDA  9001H      ; A gets the multiplier
        MOV  B, A       ; B is the loop counter
        MVI  A, 00H     ; A becomes the running sum, low byte
        MVI  D, 00H     ; D counts overflow, the high byte
UP:     ADD  C          ; add the multiplicand into the sum
        JNC  SKIP
        INR  D          ; count the overflow
SKIP:   DCR  B
        JNZ  UP
        STA  9002H      ; product, low byte
        MOV  A, D
        STA  9003H      ; product, high byte
        HLT
