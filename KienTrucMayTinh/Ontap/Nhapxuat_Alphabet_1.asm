.MODEL SMALL
.STACK
.DATA
    TBAO DB "Nhap vao 1 ky tu chu: $"
    LOI DB "Khong phai la chu!$"
    KETQUA DB 13, 10, "Ket qua: $"
    KYTU DB ?                                         
    
    XUAT_TBAO MACRO THONGBAO
        LEA DX, THONGBAO
        MOV AH, 9
        INT 21h
    ENDM
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    XUAT_TBAO TBAO
    
    MOV AH, 1
    INT 21h
    MOV KYTU, AL
    
    XUAT_TBAO KETQUA
    
    XOR AX, AX
    MOV AL, KYTU
    CMP AL, 'A'
    JB KHONGPHAICHU
    CMP AL, 'Z'
    JBE CHUHOA 
    CMP AL, 'a'
    JB KHONGPHAICHU
    CMP AL, 'z'
    JBE CHUTHUONG
    JMP KHONGPHAICHU
    
CHUHOA:
    ADD AL, 32
    JMP XUATCHU
    
CHUTHUONG:
    SUB AL, 32
    
XUATCHU:
    XOR CX, CX
    MOV CL, AL
    MOV AH, 2
    MOV DL, CL
    INT 21h
    JMP KETTHUC
    
KHONGPHAICHU:
    XUAT_TBAO LOI
    
KETTHUC:
    MOV AH, 4Ch
    INT 21h
    
END                