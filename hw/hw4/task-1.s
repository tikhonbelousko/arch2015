_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        MOV     AX, end - arr
        SHR     AX, 1

        MOV     BX, arr

L:
        SUB     AX, 1
        PUSH    (BX)
        ADD     BX, 2
        CMP     AX, 0
        JG      L

        MOV     AX, end - arr
        SHR     AX, 1
        PUSH    AX
        CALL    PRINT
        MOV     AX, end - arr
        SHR     AX, 1
        ADD     AX, 1
        ADD     SP, AX

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

PRINT:
        PUSH    BP
        MOV     BP, SP
        PUSH    SI
        PUSH    BX

        MOV     DX, 2
        MOV     AX, 4(BP)
        MUL     DX
        ADD     AX, 4

        MOV     SI, AX

ITER:
        CMP     SI, 6
        JL      BREAK

        MOV     DX, (BP)(SI)

        PUSH    DX
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        SUB     SI, 2
        JMP     ITER


BREAK:

        POP     BX
        POP     SI
        POP     BP
        RET

.SECT .DATA
format:         .ASCIZ          "%d\n"
arr:    .WORD   1,2,3,4
end:    .BYTE   0

.SECT .BSS
