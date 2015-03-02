.SECT .TEXT
        MOV     DI, (x)
1:
        XOR     BX, BX
        MOV     AX, DI
        MOV     SI, 3
        DIV     SI
        SUB     BX, DX          ! BX := -x%3
        MOV     AX, DI
        MUL     AX
        MOVB    CL, 2
        SHL     AX, CL
        ADD     BX, AX
        PUSH    BX
        ADD     DI, 4
        CMP     DI, 12
        JLE     1b

.SECT .DATA
x:    .WORD   4

.SECT .BSS
