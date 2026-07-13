; Program 1 Store 8 bit Data in Memory
; Method 1, direct addressing
        MVI  A, 40H     ; A gets 40H
        STA  9000      ; store A at address 9000H
        HLT             ; stop
