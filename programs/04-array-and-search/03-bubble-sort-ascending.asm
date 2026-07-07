; Program 23: Sort an Array in Ascending Order (Bubble Sort)
        MVI  B, 09H     ; nine passes
TOP:    LXI  H, 9100H   ; reset the pointer at the start of every pass
        MVI  C, 09H     ; nine comparisons per pass
UP:     MOV  A, M       ; current element
        INX  H          ; point to the next element
        CMP  M          ; compare the two
        JC   DOWN       ; already in order, no swap needed
        MOV  D, M       ; otherwise swap the two elements
        MOV  M, A
        DCX  H
        MOV  M, D
        INX  H
DOWN:   DCR  C
        JNZ  UP
        DCR  B
        JNZ  TOP
        HLT
