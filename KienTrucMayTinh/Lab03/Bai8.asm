.MODEL Small
.STACK
.DATA
    TBao1 db 13, 10, "Nhap mot ky tu chu thuong (a-z>: $"
    TBao2 db 13, 10, "Chu hoa tuong ung la: $"
    Kytu  db ?
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
Kiemtra:
    MOV ah, 9
    LEA dx, TBao1
    INT 21h

    MOV ah, 9
    LEA dx, TBao1
    INT 21h
    
    MOV ah, 8
    INT 21h
    CMP al, 'a'
    JL  Kiemtra
    CMP al, 'z'
    JG  Kiemtra
    SUB al, 32
    MOV Kytu, al
    
    
    MOV ah, 9
    LEA dx, TBao2
    INT 21h
    
    MOV ah, 2
    MOV dl, Kytu
    INT 21h
    
    MOV ah, 4ch
    INT 21h
END
