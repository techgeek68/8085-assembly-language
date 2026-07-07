; Program 30: Check Whether a Number is a Palindrome
        LXI  H, 9000H   ; address of the number to test
        MOV  A, M       ; A gets the original number
        MOV  B, A       ; B keeps a copy of the original for later comparison
        MVI  C, 08H     ; eight bits to process
        MVI  D, 00H     ; D will hold the bit reversed number
REV:    RAR             ; the next bit of the original moves into carry
        MOV  E, A       ; keep the rest of A safe for the next round
        MOV  A, D
        RAL             ; bring that bit into D, from the low end
        MOV  D, A
        MOV  A, E       ; bring back A so the next RAR continues correctly
        DCR  C
        JNZ  REV
        MOV  A, D       ; A now holds the fully reversed number
        CMP  B          ; compare with the original
        JZ   ISPALIN
        LXI  H, 0000H   ; not a palindrome
        JMP  STOREFLAG
ISPALIN:
        LXI  H, 0FFFFH  ; a palindrome
STOREFLAG:
        SHLD 9001H
        HLT
