_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH 10
        PUSH 20
        CALL SUM
        ADD  SP, 4

        ! Print sum
        PUSH    AX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        ! Print new line
        PUSH newline
        PUSH _PRINTF
        SYS
        ADD     SP, 4


        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

SUM:
        PUSH    BP
        MOV     BP, SP

        MOV     AX, 4(BP)
        ADD     AX, 6(BP)

        POP     BP
        RET

.SECT .DATA
newline:        .ASCIZ          "\n"
format:         .ASCIZ          "%d "

.SECT .BSS
