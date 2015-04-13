_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH    2
        PUSH    3
        PUSH    4
        PUSH    3
        CALL    SUM
        ADD     SP, 8

        PUSH    AX
        PUSH    format
        PUSH    _PRINTF
        SYS

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

SUM:
        PUSH    BP
        MOV     BP, SP

        PUSH    SI
        PUSH    BX
        MOV     BX, 0

        MOV     AX, 4(BP)
        MOV     DX, 2
        MUL     DX
        ADD     AX, 4
        MOV     SI, AX

L1:
        CMP     SI, 4
        JE      BREAK

        ADD     BX, (BP)(SI)
        SUB     SI, 2

        JMP     L1

BREAK:
        MOV     AX, BX

        POP     BX
        POP     SI
        POP     BP
        RET

.SECT .DATA

format:         .ASCIZ          "%d\n"

.SECT .BSS
