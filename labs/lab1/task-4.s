!!!
! Op. 1
! AH:00 AL:00 AX:     0
! BH:00 BL:02 BX:     2
! CH:00 CL:04 CX:     4
!!!

!!!
! Op. 2
! AH:00 AL:00 AX:     0
! BH:00 BL:02 BX:     4
! CH:00 CL:04 CX:     6
!!!
.SECT .TEXT
        MOV     AX, x
        MOV     BX, y
        MOV     CX, res

.SECT .DATA
x:      .WORD   3
x1:     .WORD   42
y:      .WORD   2

.SECT .BSS
res:    .SPACE  2
