_EXIT = 1
_PRINTF = 127
_PUTCHAR = 122

.SECT .TEXT
        ! Print number
        PUSH    (n)
        PUSH    int_format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        ! Add right digit
        PUSH    n
        PUSH    6
        CALL    ADD_RIGHT_DIGIT
        ADD     SP, 4

        ! Print number
        PUSH    (n)
        PUSH    int_format
        PUSH    _PRINTF
        SYS
        ADD     SP, 6

        ! ! Inverse
        ! PUSH    (n)
        ! CALL    INVERSE_INT
        ! ADD     SP, 2


        ! Print inversed number
        ! PUSH    AX
        ! PUSH    int_format
        ! PUSH    _PRINTF
        ! SYS
        ! ADD     SP, 6

        ! Exit program
        PUSH    0
        PUSH    _EXIT
        SYS

!!!
! Inverses order of digits in integer
!!!
! INVERSE_INT:
!         PUSH    BP
!         MOV     BP, SP

!         PUSH    0               ! -2(BP) == 0
!         PUSH    4(BP)           ! -4(BP) == N
!         PUSH    10              ! -6(BP) == 10
!         PUSH    AX
!         PUSH    BX
!         PUSH    CX
!         PUSH    DX


! INVERSE_INT_ITER:
!         CMP     -4(BP), 0
!         JE      INVERSE_INT_EPILOGUE
!         ! DIV     -6(BP)
!         ! MOV     SI, AX

!         ! MOV     CX, BP
!         ! SUB     CX, 2

!         ! ! Print inversed number
!         ! MOV     DI, -4(BP)
!         ! PUSH    DI
!         ! PUSH    int_format
!         ! PUSH    _PRINTF
!         ! SYS
!         ! ADD     SP, 6

!         ! PUSH    CX              ! accumulator
!         ! PUSH    DX              ! digit
!         ! CALL    ADD_RIGHT_DIGIT
!         ! ADD     SP, 4

!         ! JMP     INVERSE_INT_ITER


! INVERSE_INT_EPILOGUE:
!         MOV     AX, 6(BP)

!         POP     BX
!         POP     DX
!         POP     CX
!         POP     AX
!         POP     BP
!         POP     BP
!         POP     BP
!         POP     BP
!         RET

!!!
! Add right digit to number
!!!
ADD_RIGHT_DIGIT:
        PUSH    BP
        MOV     BP, SP

        PUSH    10              ! -2(BP) == 10
        PUSH    AX
        PUSH    DX
        PUSH    BX

        MOV     BX, 6(BP)
        MOV     AX, (BX)
        MUL     -2(BP)
        ADD     AX, 4(BP)
        MOV     (BX), AX


        POP     BX
        POP     DX
        POP     AX
        POP     BP

        POP     BP
        RET




.SECT .DATA
int_format:     .ASCIZ          "%d\n"
n:              .WORD           122
n0:             .WORD           123

.SECT .BSS
