.SECT .TEXT
        ! CX := arr.length
        MOV     CX, end - arr
        SHR     CX, 1

        ! AX := 0; BX := 0; DX := n; DI := arr*
        XOR     AX, AX
        XOR     BX, BX
        MOV     DX, (n)
        MOV     DI, arr

L1:
        CMP     (DI), DX
        JL      1f
        ADD     AX, (DI)        ! if arr[i] > 3
        JMP     2f
1:
        ADD     BX, (DI)
2:
        ADD     DI, 2
        LOOP    L1


.SECT .DATA
arr:    .WORD   1, 3, 2, 4, -2, 5, 1, 1, 6
end:    .BYTE   0
n:      .WORD   3


.SECT .BSS
res:    .SPACE  2
