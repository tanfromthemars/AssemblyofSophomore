.MODEL SMALL
.STACK
.DATA

.CODE
    DAY:
        MOV AH, 2Ah
        INT 21h 
        MOV AL, DL
        AAM
        MOV BX, AX
        CALL DISP
        
        MOV DL, '/'
        MOV AH, 02h
        INT 21h
        
    MONTH:
        MOV AH, 2Ah
        INT 21h
        MOV AL, DH
        AAM
        MOV BX, AX
        CALL DISP
        
        MOV DL, '/'
        MOV AH, 02h
        INT 21h
    
    YEAR:
        MOV AH, 2Ah
        INT 21h  
        ADD CX, 0F830h
        MOV AX, CX
        AAM
        MOV BX, AX
        CALL DISP
        
    MOV AH, 4Ch
    INT 21h
    
    DISP PROC
        MOV DL, BH
        ADD DL, 30h
        MOV AH, 02h
        INT 21h
        MOV DL, BL
        ADD DL, 30h
        MOV AH, 02h
        INT 21h
        RET
    DISP ENDP
    
END    