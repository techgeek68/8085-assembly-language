; Program 8 Two's Complement of a Number
        LDA  2000H      ; A gets the number
        CMA             ; A gets the one's complement
        ADI  01H        ; add one to get the two's complement
        STA  2003H      ; store the result
        HLT
