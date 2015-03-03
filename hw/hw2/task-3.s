ARR_LEN_BYTES = 10

.SECT .TEXT
        ! CX := arr.length
        MOV     CX, end - arr
        SHR     CX, 1

        MOV     BX, arr
        MOV     (BX), 1
        ADD     BX, 2
        MOV     (BX), 1
        ADD     BX, 2
        SUB     CX, 2

L1:
        ! BX := 0; AX == a[i]
        MOV     (BX), 0
        MOV     DI, BX
        SUB     DI, 2
        MOV     DX, (DI)
        ADD     (BX), DX
        SUB     DI, 2
        MOV     DX, (DI)
        ADD     (BX), DX
        ADD     BX, 2
        LOOP    L1


.SECT .DATA

.SECT .BSS
arr:      .SPACE  ARR_LEN_BYTES
end:
