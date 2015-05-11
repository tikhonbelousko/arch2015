.SECT .TEXT

!!!
! Inverses order of digits in integer
!!!
INVERSE_INT:
        PUSH    BP
        MOV     BP, SP

        PUSH    0              ! -2(BP) == 0
        PUSH    4(BP)           ! -4(BP) == N
        PUSH    10              ! -6(BP) == 10
        PUSH    BX
        PUSH    CX
        PUSH    DX

        MOV     AX, -4(BP)

INVERSE_INT_ITER:
        CMP     AX, 0
        JE      INVERSE_INT_EPILOGUE
        DIV     -6(BP)                          ! AX % 10
        MOV     -4(BP), AX                      ! n = AX / 10


        MOV     BX, BP
        SUB     BX, 2


        PUSH    BX              ! accumulator address on stack
        PUSH    DX              ! digit
        CALL    ADD_RIGHT_DIGIT
        ADD     SP, 4


        JMP     INVERSE_INT_ITER


INVERSE_INT_EPILOGUE:
        MOV     AX, -2(BP)

        POP     BX
        POP     DX
        POP     CX
        POP     BP
        POP     BP
        POP     BP
        POP     BP
        RET

!!!
! Add right digit to number
!!!
ADD_RIGHT_DIGIT:
        PUSH    BP
        MOV     BP, SP

        ! Fill stack
        PUSH    AX
        PUSH    BX
        PUSH    10              ! -6(BP) == 10

        ! use (6(BP))
        MOV     BX, 6(BP)
        PUSH    BP
        MOV     BP, BX
        MOV     AX, (BP)
        POP     BP

        ! Mult
        MUL     -6(BP)
        ADD     AX, 4(BP)

        ! use (6(BP))
        PUSH    BP
        MOV     BP, BX
        MOV     (BP), AX
        POP     BP

        ! Epilogue
        POP     BX
        POP     BX
        POP     AX

        POP     BP
        RET

.SECT .DATA

.SECT .BSS
