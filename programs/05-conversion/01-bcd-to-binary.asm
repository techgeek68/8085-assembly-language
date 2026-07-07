; Program 24: BCD to Binary Conversion
        LXI  H, 9100H
        MOV  A, M
        ANI  0FH        ; isolate the units digit
        MOV  C, A       ; C keeps the units digit
        MOV  A, M
        ANI  F0H        ; isolate the tens digit
        RRC
        RRC
        RRC
        RRC             ; move the tens digit into the low nibble
        MOV  D, A       ; D keeps the tens digit
        XRA  A          ; A becomes zero, and carry is cleared
        MVI  E, 0AH     ; multiply the tens digit by ten
SUM:    ADD  D
        DCR  E
        JNZ  SUM
        ADD  C          ; add the units digit
        STA  9101H
        HLT
