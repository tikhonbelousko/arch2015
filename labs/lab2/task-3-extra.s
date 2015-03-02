! First (mod4) = 0
.SECT .TEXT
        MOV     BX, arr
        MOV     AX, 0

MAINLOOP:
        ! Check if mod4
        MOV     DX, (BX)
        SHR     DX, 1
        JC      SKIP
        SHR     DX, 1
        JC      SKIP
        MOV     AX, (BX)
        JMP     FOUND

SKIP:
        ADD     BX, 2
        CMP     BX, end
        JNE     MAINLOOP
FOUND:
        NOP


.SECT .DATA
arr:    .WORD   1, -3, 2, 4, -2, 5, 1, 1, 6
end:    .BYTE   0


.SECT .BSS
