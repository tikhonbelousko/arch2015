_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH 5
        PUSH 6
        CALL MAX
        ADD  SP, 4

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

MAX:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX


        MOV     BX, 4(BP)
        MOV     AX, 6(BP)

        CMP     AX, BX
        JGE     RETURN
        MOV     AX, BX


RETURN:
        POP     BX

        POP     BP
        RET

.SECT .DATA

.SECT .BSS
