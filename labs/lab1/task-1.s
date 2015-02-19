.SECT .TEXT
        MOV     AX, (x)
        SUB     AX, (y)

.SECT .DATA
x:      .WORD   3
y:      .WORD   2

.SECT .BSS
