_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        MOV     CX, 0

        ! fill stack
        PUSH    1
        PUSH    format
        PUSH    _PRINTF

        MOV     BP, SP
        ! main loop
L:
        INC     CX
        SYS

        INC     4(BP)
        CMP     CX, 10
        JNE     L

        ! clear stack
        ADD     SP, 6

        ! print line
        PUSH newline
        PUSH _PRINTF
        SYS
        ADD     SP, 4

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

.SECT .DATA
newline:        .ASCIZ          "\n"
format:         .ASCIZ          "%d "

.SECT .BSS
