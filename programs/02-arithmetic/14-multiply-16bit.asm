; Program 32: Multiplication of Two 16-bit Numbers
; Multiplicand at 4000H (low) / 4001H (high)
; Multiplier at 4002H (low) / 4003H (high)
; High word of product stored at 2000H/2001H, low word at 2002H/2003H
        LHLD 4000H     ; HL gets the multiplicand
        MOV  B, H
        MOV  C, L      ; BC keeps the multiplicand fixed for the whole routine
        LHLD 4002H     ; HL gets the multiplier
        MOV  D, H
        MOV  E, L      ; DE gets the multiplier, doubling as the product's low word
        LXI  H, 0000H  ; HL is the product's high word, starting at zero
        MVI  A, 10H    ; sixteen iterations, one per bit
        STA  35FFH     ; a spare memory byte used as the loop counter
MLOOP:  MOV  A, E
        ANI  01H       ; test the current least significant bit of the multiplier
        JZ   NOADD
        DAD  B         ; HL gets HL plus the multiplicand, carry set on overflow
        JMP  SHIFT
NOADD:  ORA  A         ; explicitly clear carry, since nothing was added this time
SHIFT:  MOV  A, H
        RAR
        MOV  H, A      ; shift the combined HL and DE pair right by one bit,
        MOV  A, L      ; with the carry chained through from H down to E
        RAR
        MOV  L, A
        MOV  A, D
        RAR
        MOV  D, A
        MOV  A, E
        RAR
        MOV  E, A
        LDA  35FFH
        DCR  A
        STA  35FFH
        JNZ  MLOOP
        SHLD 2000H     ; store the product's high word
        XCHG
        SHLD 2002H     ; store the product's low word
        HLT
