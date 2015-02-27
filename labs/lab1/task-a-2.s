.SECT .TEXT
        MOV     CX, 3
        MOV     (x), 3

L1:
        MOV     BX, -1          ! -1
        ADD     BX, (x)         ! x - 1

        MOV     AX, (x)         !!! forming -x^3/5
        MUL     (x)
        MUL     (x)
        DIV     (five)

        SUB     BX, DX          ! -x^3%5 + x - 1

        !!! forming 3x^4/8
        MOV     AX, (x)         !!! forming 3x^5/8
        MUL     AX
        MUL     AX
        MUL     (three)
        DIV     (eight)

        ADD     BX, AX          ! 3x^5/8 - x^3%5 + x - 1
        MOV     (res), BX

        ADD     (x), 3
        LOOP    L1

.SECT .DATA
three:  .WORD   3
five:   .WORD   5
eight:  .WORD   8


.SECT .BSS
x:      .SPACE  2
res:    .SPACE  2
