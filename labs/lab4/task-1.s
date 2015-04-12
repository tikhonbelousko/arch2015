_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH w1
        PUSH w2
        CALL SWAP
        ADD  SP, 4

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

SWAP:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX

        MOV     BX, 4(BP)
        MOV     CX, (BX)

        MOV     BX, 6(BP)
        MOV     DX, (BX)

        MOV     (BX), CX

        MOV     BX, 4(BP)
        MOV     (BX), DX

        POP     BX

        POP     BP
        RET

.SECT .DATA
w1:  .WORD    2
w2:  .WORD    3

.SECT .BSS
