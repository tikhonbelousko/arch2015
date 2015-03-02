! Minimum even in array
.SECT .TEXT
        MOV     BX, arr
        MOV     AX, 0x7fff

MAINLOOP:
        ! Check if less
        CMP     (BX), AX
        JGE     SKIP
        ! Check if even
        MOV     DX, (BX)
        SHR     DX, 1
        JC      SKIP
        MOV     AX, (BX)

SKIP:
        ADD     BX, 2
        CMP     BX, end
        JNE     MAINLOOP

        NOP


.SECT .DATA
arr:    .WORD   1, -3, 2, 4, -2, 5, 1, 1, 6
end:    .BYTE   0


.SECT .BSS
