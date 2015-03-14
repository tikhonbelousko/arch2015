_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH 10
        CALL PRINT_N
        ADD  SP, 2

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

PRINT_N:
        PUSH    BP
        MOV     BP, SP

        PUSH    CX
        MOV     CX, 0
L:
        INC     CX
        PUSH    CX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6
        CMP     CX, 4(BP)
        JNE     L

        PUSH newline
        PUSH _PRINTF
        SYS
        ADD     SP, 4

        ! Release CX
        ADD     SP, 2
        POP     BP
        RET

.SECT .DATA
newline:        .ASCIZ          "\n"
format:         .ASCIZ          "%d "

.SECT .BSS
