; Program 32 Multiplication of Two 16-bit Numbers
; Multiplicand at 4000H (low) / 4001H (high)
; Multiplier at 2001H (low) / 2002H (high)
; High word of product stored at 2050H/2051H
; Low word of product stored at 4052H/4053H

        LHLD 4000H     ; HL gets the multiplicand
        MOV  B, H
        MOV  C, L      ; BC keeps the multiplicand fixed for the whole routine

        LHLD 2001H     ; HL gets the multiplier
        XCHG           ; DE gets the multiplier

        LXI  H, 0000H  ; HL is the product's high word

        MVI  A, 10H    ; Sixteen iterations
        STA  20FFH     ; Temporary loop counter

MLOOP:  MOV  A, E
        ANI  01H       ; Test LSB of multiplier
        JZ   NOADD

        DAD  B         ; HL = HL + BC
        JMP  SHIFT

NOADD:  ORA  A         ; Clear carry

SHIFT:  MOV  A, H
        RAR
        MOV  H, A

        MOV  A, L
        RAR
        MOV  L, A

        MOV  A, D
        RAR
        MOV  D, A

        MOV  A, E
        RAR
        MOV  E, A

        LDA  20FFH
        DCR  A
        STA  20FFH
        JNZ  MLOOP

        SHLD 2050H     ; Store high word

        XCHG
        SHLD 4052H     ; Store low word

        HLT
