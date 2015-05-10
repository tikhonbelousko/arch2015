_EXIT   = 1

!!!
! Main program
!!!
.SECT .TEXT
        MOV     BX, e1 - a1
        SHR     BX, 1

        PUSH    MAX
        PUSH    a2
        PUSH    a1
        PUSH    res
        PUSH    BX

        CALL    ZIP_WITH
        ADD     SP, 8

        PUSH    res
        PUSH    BX
        CALL    PRINT_ARR
        ADD     SP, 4

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

!!!
! Zip two arrays with function
!!!
ZIP_WITH:
        PUSH    BP
        MOV     BP, SP

        PUSH    CX
        PUSH    BX
        PUSH    SI
        PUSH    DI
        PUSH    AX

        MOV     CX, 4(BP)
        MOV     BX, 6(BP)
        MOV     SI, 8(BP)
        MOV     DI, 10(BP)
        !       12(BP) - function

ZIP_WITH_ITER:
        CMP     CX, 0
        JLE     ZIP_WITH_EPILOGUE
        PUSH    (SI)
        PUSH    (DI)
        CALL    12(BP)
        ADD     SP, 4

        MOV     (BX), AX
        ADD     BX, 2
        ADD     SI, 2
        ADD     DI, 2

        DEC     CX
        JMP     ZIP_WITH_ITER

ZIP_WITH_EPILOGUE:
        POP     AX
        POP     DI
        POP     SI
        POP     BX
        POP     CX

        POP     BP
        RET


.SECT .DATA
a1:     .WORD   1,2,3,4,5,6,6,7,8
e1:     .BYTE   0

a2:     .WORD   9,8,7,6,5,4,3,2,1
e2:     .BYTE   0

res:    .WORD   0,0,0,0,0,0,0,0,0
end:    .BYTE   0

.SECT .BSS
