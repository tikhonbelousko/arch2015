.SECT .TEXT
        MOV     DX, 0
        MOV     AX, 55
        MOV     BX, 10
        DIV     BX
        ADD     AX, DX
        MOV     (res), AX

.SECT .DATA

.SECT .BSS
res:    .SPACE  2
