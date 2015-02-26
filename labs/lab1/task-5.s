.SECT .TEXT
        MOV     AX, 3
        MOV     BX, 2
        MUL     BX
        MOV     (res), AX

.SECT .DATA

.SECT .BSS
res:    .SPACE  2
