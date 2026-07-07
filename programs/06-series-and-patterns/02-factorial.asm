; Program 28: Factorial of a Number
; Computes n factorial for n stored at 9000H, assuming n is five or less
        LDA  9000H      ; A gets n
        MOV  B, A       ; B is a counter that will count down to one
        MVI  C, 01H     ; C is the running result, starting at one
        MOV  A, B
        CPI  02H
        JC   DONE       ; if n is less than two, the result is already one
MULLOOP:
        MOV  A, C       ; A gets the running result
        MOV  D, A       ; D keeps a copy, the multiplicand for this step
        MVI  E, 00H     ; E accumulates the product for this step
        MOV  A, B       ; A gets the current multiplier
ADDLOOP:
        PUSH PSW        ; save the multiplier count while A is used elsewhere
        MOV  A, E
        ADD  D
        MOV  E, A
        POP  PSW        ; restore the multiplier count
        DCR  A
        JNZ  ADDLOOP
        MOV  C, E       ; update the running result
        DCR  B
        MOV  A, B
        CPI  01H
        JNZ  MULLOOP
DONE:   MOV  A, C
        STA  9001H
        HLT
