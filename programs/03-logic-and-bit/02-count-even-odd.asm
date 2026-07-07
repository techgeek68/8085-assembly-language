; Program 18: Count Even and Odd Numbers in an Array
        MVI  B, 00H     ; even count
        MVI  C, 00H     ; odd count
        MVI  D, 10H     ; sixteen elements
        LXI  H, 2500H
UP:     MOV  A, M
        ANI  01H        ; isolate the least significant bit
        JZ   EVEN
        INR  C          ; odd
        JMP  SKIP
EVEN:   INR  B          ; even
SKIP:   INX  H
        DCR  D
        JNZ  UP
        HLT
