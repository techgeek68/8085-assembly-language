; Program 25: Binary to BCD Conversion
        LDA  9000H      ; A gets the binary number
        MOV  B, A       ; B keeps a working copy
        MVI  C, 00H     ; C counts the tens digit
TENS:   MOV  A, B
        SUI  0AH        ; subtract ten
        JC   DONE       ; a borrow means fewer than ten remain
        MOV  B, A       ; otherwise update the remainder
        INR  C          ; and count one more group of ten
        JMP  TENS
DONE:   MOV  A, C       ; the tens digit
        RLC
        RLC
        RLC
        RLC             ; move it into the upper nibble
        ORA  B          ; combine with the units digit, in B
        STA  9101H
        HLT

; Note: an 8 bit binary number can reach 255 decimal, so the tens count
; can reach 25, which no longer fits alongside the units digit in one
; nibble. For a full three digit result, extend this routine to first
; extract a hundreds digit using the same subtract and count pattern
; against 100 before repeating it against 10.
