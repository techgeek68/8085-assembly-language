; Program 15 Addition of Corresponding Elements of Two 16 bit Tables
        LXI  H, 4000   ; table 1 pointer
        LXI  B, 2000   ; table 2 pointer
        LXI  D, 4010   ; result table pointer
        MVI  A, 0AH     ; ten 16 bit elements
UP:     PUSH PSW        ; A is needed as a counter, so save it
        LDAX B          ; A gets table 2's low byte
        ADD  M          ; A gets table 2 low plus table 1 low
        STAX D          ; store the low byte of the result
        INX  H
        INX  B
        INX  D
        LDAX B          ; A gets table 2's high byte
        ADC  M          ; add table 1 high byte plus any carry
        STAX D          ; store the high byte of the result
        INX  H
        INX  B
        INX  D
        POP  PSW        ; restore the loop counter
        DCR  A
        JNZ  UP
        HLT
