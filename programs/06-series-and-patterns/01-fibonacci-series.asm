; Program 27: Generate the Fibonacci Series up to Eight Terms
        LXI  H, C000H
        MVI  M, 00H     ; first term
        INX  H
        MVI  M, 01H     ; second term
        MVI  C, 06H     ; six more terms are needed to reach eight
UP:     DCX  H
        MOV  A, M       ; previous term
        INX  H
        ADD  M          ; previous plus current
        INX  H
        MOV  M, A       ; store the new term
        DCR  C
        JNZ  UP
        HLT
