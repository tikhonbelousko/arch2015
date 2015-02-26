.SECT .TEXT
        MOV     BX, 5
        MOV     CX, 5
        MOV     AX, 0

L1:
        ADD     AX, BX
        ADD     BX, 5
        LOOP    L1]

        MOV     (res), AX

.SECT .DATA

.SECT .BSS
res:    .SPACE  2
