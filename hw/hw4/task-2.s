_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        MOV     AX, end - arr
        SHR     AX, 1

        PUSH    SUM
        PUSH    AX
        PUSH    arr
        CALL    REDUCE
        ADD     SP, 6

        PUSH    AX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

!!!
! Reduce(array, length, f)
!!!
REDUCE:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX
        PUSH    DI
        PUSH    SI

        MOV     BX, 4(BP) ! bx := arr
        MOV     CX, 6(BP) ! cx := len
        MOV     DI, (BX)
        DEC     CX
        ADD     BX, 2

ITER:
        CMP     CX, 0
        JLE     BREAK

        PUSH    (BX)
        PUSH    DI
        CALL    8(BP)
        ADD     SP, 4

        DEC     CX
        ADD     BX, 2

        MOV     DI, AX
        JMP     ITER

BREAK:
        MOV     AX, DI

        POP     SI
        POP     DI
        POP     BX

        POP     BP
        RET

!!!
! Sum of two
!!!
SUM:
        PUSH    BP
        MOV     BP, SP

        MOV     AX, 4(BP)
        ADD     AX, 6(BP)

        POP     BP
        RET

.SECT .DATA
format:         .ASCIZ          "%d\n"
arr:    .WORD   1,2,3,4
end:    .BYTE   0

.SECT .BSS
