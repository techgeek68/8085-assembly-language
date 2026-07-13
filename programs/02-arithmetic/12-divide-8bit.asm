; Program 16 Division of Two 8 bit Numbers
        LDA  4000H      ; A gets the dividend
        MOV  E, A       ; E holds the running remainder
        LDA  2000H      ; A gets the divisor
        MOV  D, A       ; D holds the divisor
        MVI  C, 00H     ; C is the quotient
LOOP:   MOV  A, E
        CMP  D          ; compare remainder with divisor
        JC   DONE       ; if remainder is smaller, we are done
        SUB  D          ; remainder becomes remainder minus divisor
        MOV  E, A
        INR  C          ; one more successful subtraction
        JMP  LOOP
DONE:   MOV  A, C
        STA  4015H      ; quotient
        MOV  A, E
        STA  2015H      ; remainder
        HLT
