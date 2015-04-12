_EXIT   = 1
_PRINTF = 127
_PUTCHAR = 122

.SECT .TEXT
        MOV     BX, e1 - a1
        SHR     BX, 1

        PUSH    a1
        PUSH    a2
        PUSH    BX
        PUSH    F
        CALL    MAP
        ADD     SP, 8

        PUSH    a2
        PUSH    BX
        CALL    PRINT_ARR
        ADD     SP, 4

        PUSH '\n'
        PUSH _PUTCHAR
        SYS
        ADD     SP, 4

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

MAP:
        PUSH    BP
        MOV     BP, SP
        PUSH    BX
        PUSH    SI

        MOV     DX, 4(BP)
        MOV     CX, 6(BP)
        MOV     BX, 8(BP)
        MOV     SI, 10(BP)

1:
        CMP     CX, 0
        JE      BREAK

        PUSH    CX
        PUSH    DX

        PUSH    (SI)
        CALL    DX
        ADD     SP, 2

        POP    DX
        POP    CX

        MOV     (BX), AX

        ADD     BX, 2
        ADD     SI, 2
        DEC     CX

        JMP     1b


BREAK:
        POP     SI
        POP     BX
        POP     BP
        RET

!!!
! Printing array
!!!
PRINT_ARR:
        PUSH    BP
        MOV     BP, SP
        PUSH    BX
        PUSH    CX

        MOV     CX, 4(BP)
        MOV     BX, 6(BP)
L1:
        PUSH    (BX)
        PUSH    format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6
        ADD     BX, 2

        DEC     CX
        CMP     CX, 0
        JNE     L1

        ! Free BX, CX
        POP     CX
        POP     BX
        POP     BP
        RET

.SECT .DATA
format:         .ASCIZ          "%d\n"

a1:     .WORD   1, 2, 3, 4
e1:     .BYTE   0

a2:     .WORD   0, 0, 0, 0
e2:     .BYTE   0

.SECT .BSS
