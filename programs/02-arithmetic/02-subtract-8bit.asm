; Program 6 Subtraction of Two 8 bit Numbers
        LXI  H, 4000H   ; HL points to the minuend
        MOV  A, M       ; A gets the minuend
        INX  H          ; HL points to the subtrahend
        SUB  M          ; A gets minuend minus subtrahend
        INX  H          ; HL points to the result location
        MOV  M, A
        HLT
