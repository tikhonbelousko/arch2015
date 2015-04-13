_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH 5
        PUSH 6
        CALL MAX

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

MAX:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX


        MOV     AX, 6(BP)
        MOV     BX, 4(BP)

        CMP     AX, BX
        JGE     RETURN
        MOV     AX, BX


RETURN:
        MOV     6(BP), AX
        POP     BX

        POP     BP
        RET     2

.SECT .DATA

.SECT .BSS
