.MODEL small
.STACK
.DATA
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
    MOV ax, 512CH
    MOV bx, 4185H
    ADD ax, bx
    
    ;MOV ax, FE12H
    MOV bx, 1ACBH
    ADD ax, bx   
    
    ;MOV ax, E1E4H
    ;MOV bx, DAB3H
    ADD ax, bx
    
    MOV ax, 7132H
    MOV bx, 7000H
    SUB ax, bx
    
    MOV ax, 6389H
    MOV bx, 1176H
    ADD ax, bx
    
    MOV ah, 4CH
    INT 21h
END    