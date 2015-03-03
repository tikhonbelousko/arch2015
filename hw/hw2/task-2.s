.SECT .TEXT
        ! CX := arr.length
        MOV     CX, end - arr
        SHR     CX, 1

        MOV     BX, arr
L1:
        MOV     AX, (BX)
        MOV     DI, 3
        DIV     DI
        CMP     DX, 0
        JNE     SKIP
        INC     (BX)
SKIP:
        XOR     DX, DX
        ADD     BX, 2
        LOOP    L1

.SECT .DATA
arr:    .WORD   1, 3, 2, 6, -2, 5, 9, 1, 6, 7
end:    .BYTE   0

.SECT .BSS
