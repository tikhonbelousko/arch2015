_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH 10
        CALL PRINT_K
        ADD  SP, 2

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

PRINT_K:
        PUSH    BP
        MOV     BP, SP
        PUSH    AX
        PUSH    BX

        MOV     AX, 0   ! SUM[k]
        MOV     BX, 0   ! K
L:
        INC     BX
        ADD     AX, BX
        CMP     AX, 4(BP)
        JLE     L

        SUB     AX, BX
        DEC     BX

        PUSH    AX
        PUSH    BX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 8

        POP     BX
        POP     AX
        POP     BP
        RET

.SECT .DATA
format:         .ASCIZ          "K = %d; SUM = %d;\n"

.SECT .BSS
