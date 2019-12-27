.MODEL small
.STACK
.DATA
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
    MOV ax, 2143H
    MOV bx, 1986H
    SUB ax, bx
    
    MOV ax, 81FEH
    MOV bx, 1986H
    SUB ax, bx   
    
    MOV ax, 19BCH
    MOV bx, 81FEH
    SUB ax, bx
    
    MOV ax, 0002H
    ;MOV bx, FE0FH
    SUB ax, bx
    
    MOV ax, 8BCDH
    MOV bx, 71ABH
    SUB ax, bx
    
    MOV ah, 4CH
    INT 21h
END    