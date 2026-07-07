; Program 4: Exchange Contents of Two Memory Locations (indirect addressing)
        LXI  H, 2000H   ; HL points to first location
        LXI  D, 4000H   ; DE points to second location
        MOV  B, M       ; B gets (2000H)
        LDAX D          ; A gets (4000H)
        MOV  M, A       ; (2000H) gets the second value
        MOV  A, B       ; A gets back the saved first value
        STAX D          ; (4000H) gets the first value
        HLT
