; Program 9 Addition of a Block of 8 bit Numbers with Carry
        LXI  H, 2000H   ; base of the ten byte array
        MVI  B, 00H     ; carry counter, becomes the high byte
        MVI  C, 09H     ; nine more additions follow the first byte
        MOV  A, M       ; A gets the first element
UP:     INX  H          ; move to the next element
        ADD  M          ; A gets A plus the next element
        JNC  SKIP       ; if there was no carry, skip ahead
        INR  B          ; otherwise count the overflow
SKIP:   DCR  C
        JNZ  UP
        STA  4000H      ; low byte of the sum
        MOV  A, B
        STA  4005H      ; high byte, the carry count
        HLT
