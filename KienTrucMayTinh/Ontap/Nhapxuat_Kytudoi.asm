.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "Nhap 1 ky tu: $"
    TBAO2 DB 13, 10, "Ky tu doi cua ky tu tren: $"
    CHAR1 DB ?
    CHAR2 DB ?
    TEMP DB ?
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, TBAO1
    INT 21h
    
    MOV AH, 1
    INT 21h
    MOV CHAR1, AL
    
    MOV AH, 9
    LEA DX, TBAO2
    INT 21h
    
    MOV AL, CHAR1
    SUB AL, 97
    MOV TEMP, AL
    
    MOV AL, CHAR1
    ADD AL, 25
    SUB AL, TEMP
    SUB AL, TEMP
    MOV CHAR2, AL
    
    MOV AH, 2
    MOV DL, CHAR2
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
END    