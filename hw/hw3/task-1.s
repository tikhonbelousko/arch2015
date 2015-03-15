_EXIT   = 1
_PRINTF = 127
_PUTCHAR = 122

.SECT .TEXT
        PUSH 10
        CALL SUM
        ADD  SP, 4

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

SUM:
        PUSH    BP
        MOV     BP, SP

        PUSH    CX
        PUSH    BX
        PUSH    DX

        MOV     AX, 0
        MOV     CX, 4(BP)
        MOV     BX, 1

L:
        ! IF ODD
        MOV     DX, CX
        SHR     DX, 1
        JC      IFODD
!IFEVEN:
        ADD     AX, BX
        JMP     ENDIF
IFODD:
        SUB     AX, BX
ENDIF:

        ADD     BX, 2
        DEC     CX
        CMP     CX, 0
        JNE     L


        POP     DX
        POP     BX
        POP     CX
        POP     BP
        RET

.SECT .DATA
newline:        .ASCIZ          "\n"
format:         .ASCIZ          "%d "

.SECT .BSS
