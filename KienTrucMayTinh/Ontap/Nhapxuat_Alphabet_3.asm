.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "Nhap 1 ky tu thuong: $"
    TBAO2 DB 13, 10, "Ky tu in hoa: $"
    TBAO3 DB 13, 10, "Nhap 1 ky tu hoa: $"
    TBAO4 DB 13, 10, "Ky tu in thuong: $"
    KYTU1 DB ?
    KYTU2 DB ?
    KYTU3 DB ?
    KYTU4 DB ?
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
    
    MOV AH, 9
    LEA DX, TBAO3
    INT 21h
    
    MOV AH, 1
    INT 21h
    MOV KYTU3, AL
    
    MOV AL, KYTU3
    ADD AL, 32
    MOV KYTU4, AL
    
    MOV AH, 9
    LEA DX, TBAO4
    INT 21h
    
    MOV AH, 2
    MOV DL, KYTU4
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
    
END        