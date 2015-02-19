.SECT .TEXT
        !ADD     (res), (x)
        !SUB     (res), (y)

.SECT .DATA
x:      .WORD   3
y:      .WORD   2

.SECT .BSS
res:    .SPACE  2
