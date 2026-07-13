; Program 3 Exchange Contents of Two Memory Locations (direct addressing)
        LDA  2000H      ; A gets (2000H)
        MOV  B, A       ; save it in B
        LDA  4000H      ; A gets (4000H)
        STA  2000H      ; (2000H) gets the second value
        MOV  A, B       ; A gets back the saved first value
        STA  4000H      ; (4000H) gets the first value
        HLT
