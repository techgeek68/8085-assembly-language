; Program 21: Find the Largest Number in an Array
        LXI  H, 9000H   ; base of the array
        MVI  C, 0AH     ; ten elements
        MOV  A, M       ; assume the first element is the largest
LOOP2:  INX  H
        CMP  M          ; compare current maximum with the next element
        JNC  SKIP       ; A is still the largest, no change
        MOV  A, M       ; otherwise, this element becomes the new maximum
SKIP:   DCR  C
        JNZ  LOOP2
        STA  9100H      ; store the result
        HLT
