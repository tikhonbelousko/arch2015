.SECT .TEXT
        MOV     BX, 0           ! 0
        SUB     BX, 5           ! 5
        ADD     BX, (x)         ! x - 5

        MOV     AX, (x)         !!! forming -3x^2
        MUL     AX
        MOV     (x2), AX
        MUL     (three)

        SUB     BX, AX          ! -3x^2 + x - 5

        MOV     AX, (x2)        !!! forming 2x^4
        MUL     AX
        MUL     (two)

        ADD     BX, AX          ! 2x^4 - 3x^2 + x - 5

        MOV     (res), AX       ! Result



.SECT .DATA
x:      .WORD   7
two:    .WORD   2
three:  .WORD   3


.SECT .BSS
res:    .SPACE  2
x2:     .SPACE  2
