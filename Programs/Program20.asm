; Program 20: Conditional Data Transfer Within a Range
        MVI  C, 0AH
        LXI  H, 5050H
        LXI  D, 5060H
UP:     MOV  A, M
        CPI  30H
        JC   REJECT     ; below range
        CPI  70H
        JNC  REJECT     ; at or above the upper bound
        STAX D          ; in range, transfer as is
        JMP  NEXT
REJECT: MVI  A, 00H
        STAX D          ; explicitly store zero
NEXT:   INX  H
        INX  D
        DCR  C
        JNZ  UP
        HLT
