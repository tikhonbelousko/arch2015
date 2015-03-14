_EXIT    = 1
_PRINTF  = 127
_PUTCHAR = 122

.SECT .TEXT
        MOV     AX, end - arr
        SHR     AX, 1

        PUSH    arr
        PUSH    AX
        CALL    SUM_ARR
        ADD     SP, 4

        ! Print sum
        PUSH    AX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        ! Print new line
        PUSH '\n'
        PUSH _PUTCHAR
        SYS
        ADD     SP, 4

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

SUM_ARR:
        PUSH    BP
        MOV     BP, SP
        PUSH    BX
        PUSH    CX

        MOV     CX, 4(BP)
        MOV     BX, 6(BP)
        MOV     AX, 0
L:
        ADD     AX, (BX)
        ADD     BX, 2

        DEC     CX
        CMP     CX, 0
        JNE     L

        ! Free BX, CX
        POP     BX
        POP     CX
        POP     BP
        RET
.SECT .DATA
arr:            .WORD           1,2,3,4,5
end:            .BYTE           0

format:         .ASCIZ          "%d "

.SECT .BSS
