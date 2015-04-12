_EXIT   = 1
_PRINTF = 127
_PUTCHAR = 122

.SECT .TEXT
        MOV     BX, e1 - a1
        SHR     BX, 1

        PUSH    a1
        PUSH    a2
        PUSH    BX
        CALL    SWAP_ARRAYS
        ADD     SP, 6

        PUSH    a1
        PUSH    BX
        CALL    PRINT_ARR
        ADD     SP, 4

        PUSH '\n'
        PUSH _PUTCHAR
        SYS
        ADD     SP, 4

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

!!!
! Swapping
!!!
SWAP:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX

        MOV     BX, 4(BP)
        MOV     CX, (BX)

        MOV     BX, 6(BP)
        MOV     DX, (BX)

        MOV     (BX), CX

        MOV     BX, 4(BP)
        MOV     (BX), DX

        POP     BX

        POP     BP
        RET


!!!
! Swapping arrays
!!!
SWAP_ARRAYS:
        PUSH    BP
        MOV     BP, SP

        MOV     CX, 4(BP)
        MOV     DX, 6(BP)
        MOV     AX, 8(BP)
1:
        CMP     CX, 0
        JE      BREAK

        PUSH    CX
        PUSH    AX
        PUSH    DX

        PUSH    AX
        PUSH    DX
        CALL    SWAP
        ADD     SP, 4

        POP    DX
        POP    AX
        POP    CX

        ADD     AX, 2
        ADD     DX, 2
        DEC     CX

        JMP     1b


BREAK:
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
a1:     .WORD   2, 2, 3, 4
e1:     .BYTE   0

a2:     .WORD   5, 6, 7, 8
e2:     .BYTE   0

format:         .ASCIZ          "%d "

.SECT .BSS
