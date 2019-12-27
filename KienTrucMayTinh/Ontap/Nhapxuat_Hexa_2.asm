.MODEL 
.STACK
.DATA
    TBAO1 DB 13, 10, "Nhap so thap luc phan: $"
    TBAO2 DB 13, 10, "Xuat so thap luc phan: $"
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, TBAO1
    
    MOV AH, 9
    INT 21h
    
    XOR BX, BX
    MOV AH, 1
    FOR1:
        INT 21h
        CMP AL, 0Dh
        JE END_FOR
        
        CMP AL, 41h
        JGE LETTER
        
        SUB AL, 48
        JMP SHIFT
        
        LETTER:
            SUB AL, 37h
            
        SHIFT:
            SHL BX, 4
            OR BL, AL
        JMP FOR1
        
    END_FOR:
        MOV AH, 9
        LEA DX, TBAO2
        INT 21h
        
    PRINT:
        MOV CX, 4
        MOV AH, 2
    
    FOR:
        MOV DL, BH
        SHR DL, 4
        
        CMP DL, 10
        JB NUM
        JAE LETTER2
        
    NUM:
        ADD DL, 48
        INT 21h
        JMP END_OF_LOOP2
        
        LETTER2:
            ADD DL, 55
            INT 21h
        
        END_OF_LOOP2:
            ROL BX, 4
            LOOP FOR   
    MOV AH, 4Ch
    INT 21h
END                         