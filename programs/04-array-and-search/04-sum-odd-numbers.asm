; Program 33: Sum of Only the Odd Numbers in an Array
        LXI  H, 6000H
        MVI  C, 0AH     ; ten elements to scan
        MVI  D, 00H     ; carry or overflow byte for the sum
        MVI  E, 00H     ; running sum, low byte
UP:     MOV  A, M
        ANI  01H        ; is this element odd?
        JZ   SKIP
        MOV  A, M
        ADD  E
        MOV  E, A
        JNC  SKIP
        INR  D          ; count the overflow
SKIP:   INX  H
        DCR  C
        JNZ  UP
        MOV  A, E
        STA  6010H      ; sum, low byte
        MOV  A, D
        STA  6011H      ; sum, high byte
        HLT
