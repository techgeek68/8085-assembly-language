; Program 31: Generate a Square Wave Using a Delay Subroutine
        MVI  A, 00H
LOOP:   XRI  10H        ; toggle the output bit
        OUT  01H        ; send it to the output port
        CALL DELAY      ; wait for half the period
        JMP  LOOP

DELAY:  LXI  D, 0018H   ; tuned for roughly 125 microseconds at 0.33 us/T-state
BACK:   DCX  D
        MOV  A, D
        ORA  E
        JNZ  BACK
        RET
