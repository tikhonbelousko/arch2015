!!!
! 5x^2 + x / 5
!!!

.SECT .TEXT
        MOV     AX, (x)
        MUL     AX
        MOV     CX, 5
        MUL     CX
        MOV     BX, AX          ! BX = x^2*5

        MOV     AX, (x)
        DIV     CX

        ADD     BX, AX          ! BX = 5x^2 + x / 5

        MOV     (res), BX

.SECT .DATA
x:        .WORD   13

.SECT .BSS
res:    .SPACE  2
