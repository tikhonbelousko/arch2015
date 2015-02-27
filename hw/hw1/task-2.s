!!!
!  4x^4 - 3x^2 + x%4
!!!

.SECT .TEXT
        MOV     CX, 3
        MOV     (x), 2

L1:
        !!! BX := x%4
        MOV     AX, (x)
        MOV     DI, 4
        DIV     DI
        MOV     BX, DX

        !!! BX := -3x^2 + x%4
        MOV     AX, (x)
        MUL     AX
        MOV     DI, 3
        MUL     DI
        SUB     BX, AX

        !!! BX := 4x^4 - 3x^2 + x%4
        MOV     AX, (x)
        MUL     AX
        MUL     AX
        MOV     DI, 4
        MUL     DI
        ADD     BX, AX

        PUSH    BX
        ADD     (x), 2
        LOOP    L1

.SECT .DATA

.SECT .BSS
x:      .SPACE  2
