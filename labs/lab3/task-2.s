_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        MOV     CX, 0
L:
        INC     CX
        PUSH    CX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6
        CMP     CX, 10
        JNE     L

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
