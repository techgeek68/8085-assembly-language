; Program 19: Set a Bit for Numbers Greater than a Given Value
        LXI  H, 3080H
        MVI  C, 0AH
LOOP2:  MOV  A, M
        CPI  81H        ; test for strictly greater than 80H
        JC   LOOP1      ; if A is 80H or below, leave it unchanged
        XRI  20H        ; otherwise toggle bit D5
        MOV  M, A
LOOP1:  INX  H
        DCR  C
        JNZ  LOOP2
        HLT
