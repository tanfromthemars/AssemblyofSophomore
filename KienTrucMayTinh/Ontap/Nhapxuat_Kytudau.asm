.MODEL SMALL
.STACK
.DATA
    MSG DB "Please enter a char: $"
    MSG1 DB 13, 10, "Char has just typed: $"
    CHAR DB ?
.CODE
    MOV AX, @DATA
    MOV DS, AX
;Xuat dong dau tien
    MOV AH, 09h
    MOV DX, OFFSET MSG
    INT 21h
;Nhap ky tu
    MOV AH, 1
    INT 21h
    MOV CHAR, AL
    INT 21h
;Xuat dong ke tiep + ky tu vua nhap
    MOV AH, 09h
    LEA DX, MSG1
    INT 21h
    
    MOV AH, 2
    MOV DL, CHAR
    INT 21h
;Tra quyen dieu hanh
    MOV AH, 4Ch
    INT 21h
END                        