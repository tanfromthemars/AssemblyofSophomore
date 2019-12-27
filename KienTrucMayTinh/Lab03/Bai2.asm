.MODEL small
.STACK
.DATA
    TBao1 db 13, 10, "Nhap mot ky tu:$ "
    TBao2 db 13, 10, "Ky tu da nhap la chu$"
    TBao3 db 13, 10, "Ky tu da nhap la so$"
    TBao4 db 13, 10, "Ky tu da nhap khac chu/so$"
    Kytu  db ?
.CODE
    MOV ax, @DATA
    MOV ds, ax
   
    MOV ah, 9
    LEA dx, TBao1
    INT 21h
        
    MOV ah, 1
    INT 21h
        
    CMP al, '0'
    JB Khac
        
    CMP al, '9'
    JBE So
        
    CMP al, 'A'
    JB Khac
    
    CMP al, 'Z'
    JBE Chu
        
    CMP al, 'a'
    JB Khac
    
    CMP al, 'z'
    JBE Chu
    
    JMP Khac
        
    So:
    MOV ah, 9
    LEA dx, TBao3
    INT 21h
    JMP Ketthuc
    
    Chu:
    MOV ah, 9
    LEA dx, TBao2
    INT 21h
    JMP Ketthuc   
       
    Khac:
    MOV ah, 9
    LEA dx, TBao4
    INT 21h
       
    Ketthuc:
    MOV ah, 4ch
    INT 21h
END                             