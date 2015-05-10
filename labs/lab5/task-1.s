_EXIT   = 1

.SECT .TEXT
        MOV     BX, end - arr
        SHR     BX, 1

        PUSH    arr
        PUSH    BX
        CALL    PRINT_ARR

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

.SECT .DATA
arr:    .WORD   0, 1, 2, 3, 4, 5, 6, 7, 8, 9
end:    .BYTE   0

.SECT .BSS
