.MODEL SMALL
.STACK 100h
.DATA

    TBAO1 DB 10,13, 'Nhap vao 1 day thap luc phan: $'
    TBAO2 DB 10,13, 'Day thap luc phan vua nhap la: $'
    ERROR1 DB 10,13, 'Nhap sai! Vui long nhap lai.$'
    ERROR2 DB 10,13, 'Da du 4 gia tri hexa!$'

    
.CODE 
;Lay du lieu data vao ds
    MOV AX, @DATA
    MOV DS,AX

RESET:
;Hien thi thong bao nhap chuoi hexa
    MOV AH, 9
    LEA DX, TBAO1
    INT 21h
    
;Khoi tao gia tri
    XOR BX, BX
    XOR CX, CX

INPUT:
    MOV AH, 1
    INT 21h
    
;Kiem tra ENTER -> Hien thi day hexa
    CMP AL, 0Dh
    JE BREAK
    
    CMP AL, '0'
    JB XULY_LOI
    CMP AL, '9'
    JBE XULY_SO
    CMP AL, 'A'
    JB XULY_LOI
    CMP AL, 'F'
    JBE XULY_CHU
    
XULY_LOI:
    MOV AH, 9
    LEA DX, ERROR1
    INT 21h
    JMP RESET
    
XULY_SO:
    AND AL,0Fh
    JMP LUU   
    
XULY_CHU:
    SUB AL, 37h
    
LUU:
    SHL BX, 4
    OR BL, AL
    
    INC CX
    
;Kiem tra CX va thoat chuong trinh
    CMP CX, 4
    JB INPUT
    
;Xuat thong bao da nhap du 4 ki tu
    MOV AH, 9
    LEA DX, ERROR2
    INT 21h
    
BREAK:
;Xuat thong bao ket qua
    MOV AH, 9
    LEA DX, TBAO2
    INT 21h
    
PRINT:
    MOV DL, BH
    SHR DL, 4
    
    CMP DL, 9
    JBE XUAT_SO
    JA XUAT_CHU
    
XUAT_SO:
    MOV AH, 2
    OR DL, 30h
    INT 21h
    JMP CONTINUE
    
XUAT_CHU:
    MOV AH, 2
    ADD DL, 37h
    INT 21h
    
CONTINUE:
    ROL BX, 4
    LOOP PRINT
    
;Dung man hinh, xem ket qua
    MOV AH, 9
    INT 21h
    
;Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
    
END                           