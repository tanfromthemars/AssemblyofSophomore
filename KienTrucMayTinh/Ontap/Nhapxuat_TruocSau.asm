.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "Hay nhap mot ky tu: $"
    TBAO2 DB 0Dh, 0Ah, "Ky tu da nhap: $"
    TBAO3 DB 0Dh, 0Ah, "Ky tu truoc ky tu da nhap: $"
    TBAO4 DB 0Dh, 0Ah, "Ky tu sau ky tu da nhap: $"
    KYTU DB ?
.CODE

PROGRAMSTART:
    MOV AX, @DATA
    MOV DS, AX
    
;Xuat thong bao nhap mot ky tu
    LEA DX, TBAO1
    MOV AH, 9
    INT 21h
    
;Nhap 1 ky tu
    MOV AH, 1
    INT 21h
    MOV KYTU, AL
    
;Xuat thong bao ket qua
    LEA DX, TBAO2
    MOV AH, 9
    INT 21h
    
;Hien thi ky tu da nhap
    MOV AH, 2
    MOV DL, KYTU
    INT 21h
    
;Hien thi ky tu truoc ky tu nhap
    LEA DX, TBAO3
    MOV AH, 9
    INT 21h
    MOV AH, 2
    MOV DL, KYTU
    DEC DL ;giam mot don vi
    INT 21h

;Hien thi ky tu sau ky tu nhap
    LEA DX, TBAO4
    MOV AH, 9
    INT 21h
    MOV AH, 2
    MOV DL, KYTU
    INC DL ;tang 1 don vi
    INT 21h
    
;Tra quyen dieu hanh cho DOS
    MOV AH, 4Ch
    INT 21h

END                            