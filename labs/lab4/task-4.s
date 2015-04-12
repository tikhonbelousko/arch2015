_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH    2
        CALL    F
        ADD     SP, 2

        PUSH    AX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

F:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX
        MOV     BX, 0

        ! 4x^4
        MOV     AX, 4(BP)
        MUL     AX
        MUL     AX
        MOVB    CL, 2
        SHL     AX, CL

        ADD     BX, AX

        ! 4x^4 - 9x^2
        MOV     AX, 4(BP)
        MUL     AX
        MOV     CX, 9
        MUL     CX

        SUB     BX, AX
        SUB     BX, 5

        MOV     AX, BX

        POP     BX

        POP     BP
        RET



.SECT .DATA
format:         .ASCIZ          "%d\n"

.SECT .BSS
