_EXIT   = 1
_PRINTF = 127

.SECT .TEXT
        PUSH 4
        PUSH 27
        CALL DIVIDES_2_TO_N
        ADD  SP, 4

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

DIVIDES_2_TO_N:
        PUSH    BP
        MOV     BP, SP

        PUSH    BX

        MOV     BX, 6(BP) ! N
        MOV     AX, 4(BP) ! X
        MOVB    CL, 1

ITER:
        CMP     BX, 0
        JE      SUCCESS

        SHR     AX, CL
        JC      FAIL

        DEC     BX
        JMP     ITER


SUCCESS:
        MOV     AX, 1
        POP     BX
        POP     BP
        RET

FAIL:
        MOV     AX, 0
        POP     BX
        POP     BP
        RET

.SECT .DATA

.SECT .BSS
