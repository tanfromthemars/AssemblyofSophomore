.MODEL SMALL
.STACK
.DATA
    TBAO DB 13, 10, "Thoi gian hien tai la: $"
    TIME DB '00:00:00$'
    
.CODE       
    MOV AX, @DATA
    MOV DS, AX
    
    LEA BX, TIME
    
    CALL GET_TIME
    
    LEA DX, TBAO
    MOV AH, 9
    INT 21h
    
    LEA DX, TIME
    MOV AH, 9
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
    
    GET_TIME PROC
        PUSH AX
        PUSH CX
        
        MOV AH, 2Ch
        INT 21h
        
        MOV AL, CH
        CALL CONVERT
        MOV [BX], AX
        
        MOV AL, CL
        CALL CONVERT
        MOV [BX+3], AX
        
        POP CX
        POP AX
        
        RET
    GET_TIME ENDP
    
    CONVERT PROC
        PUSH DX
        
        MOV AH, 0
        MOV DL, 10
        DIV DL
        OR AX, 3030h
        
        POP DX
        
        RET
    CONVERT ENDP
    
END    