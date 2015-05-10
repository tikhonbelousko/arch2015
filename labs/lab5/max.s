.SECT .TEXT

!!!
! MAX of two numbers
!!!
MAX:
        PUSH    BP
        MOV     BP, SP
        MOV     AX, 4(BP)
        CMP     AX, 6(BP)
        JGE     MAX_EPILOGUE
        MOV     AX, 6(BP)

MAX_EPILOGUE:
        POP     BP
        RET

.SECT .DATA

.SECT .BSS
