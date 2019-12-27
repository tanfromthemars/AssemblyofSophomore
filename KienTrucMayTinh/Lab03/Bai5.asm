.MODEL small
.STACK
.DATA
    TBao1 db 13, 10, "Nhap mot ky tu: $ "
    TBao2 db 13, 10, "Nam ky ut ke tiep: $"
    Kytu  db ?
    NL    db 13, 10, '$'
.CODE
    
    MOV ax, @DATA
    MOV ds, ax
   
    MOV ah, 9
    LEA dx, TBao1
    INT 21h
        
    MOV ah, 1
    INT 21h
    MOV Kytu, al
    
    MOV al, Kytu
    SUB al, 6
    MOV Kytu, al
    
    MOV ah, 9
    LEA dx, TBao2
    INT 21h
    
    MOV cx, 5
    
    Vonglap:
    MOV ah, 2
    INC Kytu
    MOV dl, Kytu
    INT 21h
    DEC cx
    
    MOV ah, 9
    LEA dx, nl
    INT 21h
    
    JNZ Vonglap
    
    MOV ah, 4ch
    INT 21h    
END                             