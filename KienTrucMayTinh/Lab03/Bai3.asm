.MODEL small
.STACK
.DATA
    TBao1 db 13, 10, "Chu in hoa trong bo ma ASCII: $ "
.CODE
    
    MOV ax, @DATA
    MOV ds, ax
   
    MOV ah, 9
    LEA dx, TBao1
    INT 21h
        
    MOV ah, 2
    MOV cx, 26
    MOV dl, 65
    
    Vonglap:
    INT 21h
    INC dl
    LOOP Vonglap
    
    MOV ah, 4ch
    INT 21h
END                             