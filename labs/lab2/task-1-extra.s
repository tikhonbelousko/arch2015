! Minimum in array
.SECT .TEXT
        ! CX := arr.length
        MOV     CX, end - arr
        SHR     CX, 1

        MOV     BX, arr
        XOR     AX, (BX)

L1:
        CMP     (BX), AX
        JGE     1f
        MOV     AX, (BX)
1:
        ADD     BX, 2
        LOOP    L1

        NOP


.SECT .DATA
arr:    .WORD   1, 3, 2, 4, -2, 5, 1, 1, 6
end:    .BYTE   0


.SECT .BSS
