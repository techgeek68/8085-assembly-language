; Program 17: Count Positive and Negative Numbers in an Array
        MVI  B, 00H     ; positive count
        MVI  D, 00H     ; negative count
        MVI  C, 10H     ; sixteen elements
        LXI  H, 2500H
UP:     MOV  A, M
        ANI  80H        ; isolate the sign bit
        JZ   POS
        INR  D          ; negative
        JMP  SKIP
POS:    INR  B          ; positive
SKIP:   INX  H
        DCR  C
        JNZ  UP
        MOV  A, B
        STA  2514H
        MOV  A, D
        STA  2512H
        HLT
