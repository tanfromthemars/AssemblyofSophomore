.MODEL small
.STACK
.DATA
    TBao01  db              "Nhap ky tu thu nhat: $"
    TBao02  db   13, 10,  "Nhap ky tu thu hai: $"      
    TBao03  db   13, 10,  "Ky tu tong: $"
    char1   db   ?
    char2   db   ?
    charsum db   ?
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
    LEA dx, TBao01
    MOV ah, 9
    INT 21h
    
    MOV ah, 1
    MOV char1, al
    INT 21h

    
    LEA dx, TBao02
    MOV ah, 9
    INT 21h
    
    MOV ah, 1
    MOV char2, al
    INT 21h
    
    MOV al, char1
    ADD al, char2
    MOV charsum, al
    
    LEA dx, TBao03
    MOV ah, 9
    INT 21h
    
    MOV ah, 2
    MOV dl, charsum
    INT 21h
    
    MOV ah, 4ch
    INT 21h
END    