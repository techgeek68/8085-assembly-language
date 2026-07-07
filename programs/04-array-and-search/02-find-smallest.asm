; Program 22: Find the Smallest Number in an Array
        LXI  H, 9000H   ; base of the array
        MVI  C, 0FH     ; fifteen elements
        MOV  A, M       ; assume the first element is the smallest
LOOP2:  INX  H
        CMP  M
        JC   SKIP       ; A is still the smallest, no change
        MOV  A, M       ; otherwise, this element becomes the new minimum
SKIP:   DCR  C
        JNZ  LOOP2
        STA  9100H
        HLT
