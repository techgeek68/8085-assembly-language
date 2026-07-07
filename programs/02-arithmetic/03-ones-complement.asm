; Program 7: One's Complement of a Number
        LDA  4400H      ; A gets the number
        CMA             ; A gets the one's complement of A
        STA  4300H      ; store the result
        HLT
