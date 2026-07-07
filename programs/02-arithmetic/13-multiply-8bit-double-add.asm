; Program 29: Multiplication of Two 8 bit Numbers by the Double and Add Method
        LXI  H, 9100H
        MOV  E, M       ; E gets the multiplicand
        MVI  D, 00H     ; DE now holds the multiplicand as a 16 bit value
        INX  H
        MOV  A, M       ; A gets the multiplier
        MVI  B, 08H     ; eight iterations, one per bit
        LXI  H, 0000H   ; HL is the running product
LOOP:   RAR             ; the next bit of the multiplier moves into carry
        JNC  L1
        DAD  D          ; if that bit was one, add the multiplicand in
L1:     XCHG            ; bring the multiplicand into HL
        DAD  H          ; double it, ready for the next bit's weight
        XCHG            ; put the product back into HL, doubled multiplicand into DE
        DCR  B
        JNZ  LOOP
        SHLD 9102H      ; store the sixteen bit product
        HLT
