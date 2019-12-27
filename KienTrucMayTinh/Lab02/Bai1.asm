.MODEL small
.STACK
.DATA
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
    MOV ax, 7FFFH
    MOV bx, 1
    ADD ax, bx
    
    MOV al, 1
    MOV bl, 00FFh
    SUB al, bl
    
    MOV al, 0
    DEC al
    
    MOV al, 7FH
    NEG al
    
    MOV ax, 1ABCH
    MOV bx, 712AH
    XCHG ax, bx   
    
    MOV al, 80H
    MOV bl, 0FFH
    ADD al, bl
    
    MOV ax, 0
    MOV bx, 8000H
    SUB ax, bx
    
    MOV ax, 1
    NEG ax
    
    MOV ah, 4CH
    INT 21h
END    