; Program 12: Addition of Two 16 bit Numbers (recommended method, using DAD)
        LHLD 4000H      ; HL gets the first 16 bit number
        XCHG            ; DE keeps the first number
        LHLD 4002H      ; HL gets the second 16 bit number
        DAD  D          ; HL becomes HL plus DE, carry set on overflow
        SHLD 4004H      ; store the 16 bit result
        HLT
