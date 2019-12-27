.MODEL small
.STACK
.DATA
    TBao01  db               "Hay nhap mot ky tu: $"
    TBao02  db   0dh, 0ah,   "Ky tu dung truoc: $"
    TBao03  db   0dh, 0ah,   "Ky tu dung sau: $"
    char    db   ?
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
    LEA dx, TBao01
    MOV ah, 9
    INT 21h
    
    MOV ah, 1
    INT 21h
    MOV char, al
    
    LEA dx, TBao02
    MOV ah, 9
    INT 21h
    
    MOV ah, 2
    MOV dl, char
    DEC dl
    INT 21h
    
    LEA dx, TBao03
    MOV ah, 9
    INT 21h
    
    MOV ah, 2
    MOV dl, char
    INC dl
    INT 21h
    
    MOV ah, 4ch
    INT 21h
END 