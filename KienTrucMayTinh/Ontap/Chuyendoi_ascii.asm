.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13, 10, "Nhap mot ky tu: $"
    TBAO2 DB 13, 10, "Ma thap luc phan tuong ung: $"
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, TBAO1
    MOV AH, 9
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    MOV BL, AL
    
    LEA DX, TBAO2
    MOV AH, 9
    INT 21h
    
    MOV CX, 4
    MOV AH, 2
LAP:
    MOV DL, BH
    SHR DL, 4
    
    CMP DL, 10
    JB NUM
    JAE LETTER
    
NUM:
    ADD DL, 48
    INT 21h
    JMP ENDNUM
        
LETTER:
    ADD DL, 55
    INT 21h

ENDNUM:
    ROL BX, 4
    LOOP LAP
    
    MOV AH, 4Ch
    INT 21h
END                    