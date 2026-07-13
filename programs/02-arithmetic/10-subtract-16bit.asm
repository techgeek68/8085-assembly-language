; Program 14 Subtraction of Two 16 bit Numbers
        LHLD 4000H      ; HL gets the minuend
        XCHG            ; DE keeps the minuend
        LHLD 4002H      ; HL gets the subtrahend
        MOV  A, E
        SUB  L          ; low byte, minuend minus subtrahend
        MOV  L, A
        MOV  A, D
        SBB  H          ; high byte, including any borrow
        MOV  H, A
        SHLD 4004H
        HLT
