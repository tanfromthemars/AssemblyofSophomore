.MODEL SMALL
.STACK
.DATA
    BUFFER DB 100, ?, 100 DUP(' ')
    NEWLINE DB 13, 10, '$'
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET BUFFER
    MOV AH, 0Ah
    INT 21h
    
    XOR BX, BX
    MOV BL, BUFFER[1]
    MOV BUFFER[BX+2], '$'
    
    MOV AH, 9
    LEA DX, NEWLINE 
    INT 21h
    
    PRINT:
        MOV CX, BX
        MOV DL, BUFFER[BX+1]
        MOV AH, 2
        INT 21h
        DEC BX
        CMP BX, 0
    JG PRINT
    
    MOV AH, 4Ch
    INT 21h
END            