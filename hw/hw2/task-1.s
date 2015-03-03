.SECT .TEXT
        ! CX := arr.length
        MOV     CX, end - arr
        SHR     CX, 1

        ! AX := 0; BX := 0; DX := n; DI := arr*
        MOV     AX, 1
        MOV     BX, arr
L1:
        CMP     (BX), 0
        JLE     1f
        MUL     (BX)
1:
        ADD     BX, 2
        LOOP    L1
        NOP

.SECT .DATA
arr:    .WORD   1, 3, 2, 4, -2, 5, 1, 1, 6
end:    .BYTE   0

.SECT .BSS
