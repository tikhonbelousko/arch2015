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

        _FUNC    = 4(BP)

        POP     BP
        RET

!!!
! MAX of two numbers
!!!
MAX:
        PUSH    BP
        MOV     BP, SP


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
