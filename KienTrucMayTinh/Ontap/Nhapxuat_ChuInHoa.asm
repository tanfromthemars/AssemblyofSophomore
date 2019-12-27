.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "Nhap 1 ky tu thuong: $"
    TBAO2 DB 13, 10, "Ky tu in hoa: $"
    KYTU1 DB ?
    KYTU2 DB ?
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09h
    LEA DX, TBAO1
    INT 21h
    
    MOV AH, 1
    INT 21h
    MOV KYTU1, AL
    
    MOV AH, 09h
    LEA DX, TBAO2
    INT 21h
    
    MOV AL, KYTU1
    SUB AL, 32
    MOV KYTU2, AL
    
    MOV AH, 2
    MOV DL, KYTU2
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
END        