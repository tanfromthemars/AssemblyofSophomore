.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13, 10, "Hom nay la ngay $"
    TBAO2 DB " thang $"
    TBAO3 DB " nam $"
    TBAO4 DB " gio $"
    TBAO5 DB " phut $"
    XUONGDONG DB 13, 10, '$'

    XUAT_TBAO MACRO THONGBAO
        LEA DX, THONGBAO
        MOV AH, 9
        INT 21h
    ENDM
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    XUAT_TBAO TBAO1
    MOV AH, 2Ah
    INT 21h
    
    POP AX
    XOR AX, AX
    PUSH CX
    PUSH DX
    
    XOR CX, CX
    POP CX
    XOR BX, BX
    MOV BL, CL
    PUSH CX
    
    CALL OUTPUT
    
    XUAT_TBAO TBAO2
    
    POP CX
    XOR BX, BX
    MOV BL, CH
    
    CALL OUTPUT
    
    XUAT_TBAO TBAO3
    
    POP BX
    CALL OUTPUT
    
    XUAT_TBAO XUONGDONG
    MOV AH, 2Ch
    INT 21h
    PUSH CX
    
    POP CX
    XOR BX, BX
    MOV BL, CH
    PUSH CX
    CALL OUTPUT
    
    XUAT_TBAO TBAO4
    
    POP CX
    XOR BX, BX
    MOV BL, CL
    CALL OUTPUT
    
    XUAT_TBAO TBAO5
    
    MOV AH, 4Ch
    INT 21h
    OUTPUT PROC
            CMP BX, 0
            JGE DOIRATHAPPHAN
            MOV DL, '-'
            MOV AH, 2
            INT 21h
            NEG BX
            DOIRATHAPPHAN:
                MOV AX, BX
                XOR CX, CX
                MOV BX, 10
                CHIA:
                    XOR DX, DX
                    DIV BX
                    PUSH DX
                    INC CX
                    CMP AX, 0
                    JNE CHIA
                    MOV AH, 2
                DOI:
                    POP DX
                    OR DL, 30h
                    INT 21h
                    LOOP DOI
            RET
    OUTPUT ENDP
END    