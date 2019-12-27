.MODEL small
.STACK
.DATA
    TBao1 db 13, 10, "Nhap mot ky tu: $ "
    TBao2 db 13, 10, "Nam ky tu dung truoc: $"
    TBao3 db 13, 10, "Nam ky tu dung sau: $"
    Kytu  db ?
    Kytu1 db ?
    Kytu2 db ?
.CODE
    
    MOV ax, @DATA
    MOV ds, ax
   
    MOV ah, 9
    LEA dx, TBao1
    INT 21h
        
    MOV ah, 1
    INT 21h
    MOV Kytu, al
    
    MOV ah, 9
    LEA dx, TBao2
    INT 21h
    
    MOV al, Kytu
    SUB al, 5
    MOV Kytu1, al
    
    MOV ah, 2
    MOV cx, 5
    MOV dl, Kytu1
   
    Vonglap1:
    INT 21h
    INC dl
    LOOP Vonglap1
    
    MOV ah, 9
    LEA dx, TBao3
    INT 21h
    
    MOV al, Kytu
    INC al
    MOV Kytu2, al
    
    MOV ah, 2
    MOV cx, 5
    MOV dl, Kytu2
    
    Vonglap2:
    INT 21h
    INC dl
    LOOP Vonglap2
    
    MOV ah, 4ch
    INT 21h    
END                             