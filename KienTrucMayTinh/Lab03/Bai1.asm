.MODEL small
.STACK
.DATA
    TBao1 db 13, 10, "Bay gio la (S)ang, (C)hieu, (T)oi?$ "
    TBao2 db 13, 10, "Chao buoi sang$"
    TBao3 db 13, 10, "Chao buoi chieu$"
    TBao4 db 13, 10, "Chao buoi toi$"
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
    Vonglap:
        LEA dx, TBao1
        MOV ah, 9
        INT 21h
        
        MOV ah, 1
        INT 21h
        
        CMP al, 'S'
        JE Sang
        CMP al, 's'
        JE Sang
        
        CMP al, 'C'
        JE Chieu
        CMP al, 'c'
        JE Chieu
        
        CMP al, 'T'
        JE Toi
        CMP al, 't'
        JE Toi
        JMP Vonglap
        
       Sang:
       LEA dx, TBao2
       JMP Loichao
       Chieu:
       LEA dx, TBao3
       JMP Loichao
       Toi:
       LEA DX, TBao4
       JMP Loichao
       
       Loichao:
       MOV ah, 9
       INT 21h
END                             