; Program 2 Store 8 bit Data in Memory (indirect addressing)
        LXI  H, 4000H   ; HL points to 4000H
        MVI  M, 40H     ; store 40H at the address HL points to
        HLT             ; stop
