.SECT .TEXT
        ! CX := arr.length
        MOV     CX, end - arr
        SHR     CX, 1

        ! BX := arr*
        MOV     AX, 0
        MOV     DX, (n)
        MOV     BX, arr

L1:
        CMP     (BX), DX
        JL      SKIP
        ADD     AX, (BX)
SKIP:
        ADD     BX, 2
        LOOP    L1


.SECT .DATA
arr:    .WORD   1, 3, 2, 4, -2, 5, 1, 1, 6
end:    .BYTE   0
n:      .WORD   3


.SECT .BSS
res:    .SPACE  2