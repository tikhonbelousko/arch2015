.SECT .TEXT
        ! CX := arr.length
        MOV     CX, end - arr
        SHR     CX, 1

        ! BX := arr*
        MOV     AX, 0
        MOV     BX, arr
L1:
        ADD     AX, (BX)
        ADD     BX, 2
        LOOP    L1


.SECT .DATA
arr:    .WORD   1, 2, 3, 4, 5, 6, 7
end:    .BYTE   0


.SECT .BSS
res:    .SPACE  2