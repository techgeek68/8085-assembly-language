; Program 26: Convert a Hexadecimal Digit to its ASCII Code
        LDA  9100H      ; A gets the hex digit
        CPI  0AH        ; is it 0 through 9, or A through F?
        JC   L1
        ADI  07H        ; skip the ASCII gap for letters
L1:     ADI  30H        ; add the ASCII base for digits
        STA  9101H
        HLT
