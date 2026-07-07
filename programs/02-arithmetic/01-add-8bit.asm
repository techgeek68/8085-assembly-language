; Program 5: Addition of Two 8 bit Numbers
        LXI  H, 4000H   ; HL points to first operand
        MOV  A, M       ; A gets the first operand
        INX  H          ; HL points to second operand
        ADD  M          ; A gets first plus second operand
        INX  H          ; HL points to the result location
        MOV  M, A       ; store the result
        HLT
