_EXIT   = 1

.SECT .TEXT
        MOV     BX, end - arr
        SHR     BX, 1

        PUSH    arr
        PUSH    8
        CALL    FIBONACCI
        ADD     SP, 4

        PUSH    arr
        PUSH    BX
        CALL    PRINT_ARR
        ADD     SP, 4

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

FIBONACCI:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX
        PUSH    CX
        PUSH    SI
        PUSH    AX


        MOV     CX, 4(BP)       ! N
        MOV     BX, 6(BP)       ! BX
        MOV     SI, 0

        ! N = 1
        CMP     CX, 0
        JE      EPILOGUE
        MOV     (BX)(SI), 1
        ADD     SI, 2
        DEC     CX

        ! N = 2
        CMP     CX, 0
        JE      EPILOGUE
        MOV     (BX)(SI), 1
        ADD     SI, 2
        DEC     CX

ITER:
        CMP     CX, 0
        JE      EPILOGUE

        MOV     AX, -2(SI)
        ADD     AX, -4(SI)
        MOV     (BX)(SI), AX
        ADD     SI, 2
        DEC     CX
        JMP     ITER


EPILOGUE:
        POP     AX
        POP     SI
        POP     CX
        POP     BX
        POP     BP
        RET


.SECT .DATA
arr:    .SPACE  32
end:    .BYTE   0

.SECT .BSS
