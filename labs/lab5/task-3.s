_EXIT = 1
_PRINTF = 127

.SECT .TEXT

        ! Inverse
        PUSH    (n)
        CALL    INVERSE_INT
        ADD     SP, 2


        ! Print inversed number
        PUSH    AX
        PUSH    int_format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS


.SECT .DATA
int_format:     .ASCIZ          "%d\n"
n:              .WORD           1234

.SECT .BSS
