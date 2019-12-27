.MODEL SMALL
.STACK 100h
.DATA
    SO10 DW 10
    NUMB DW 0
    THEADD DW ?
    ENDL DB 13, 10, '$'
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    XOR BX, BX
    XOR CX, CX
    MOV CX, 5

NHAP:
    MOV AH, 8
    INT 21h
    CMP AL, 13
    JZ PNEXT
    CMP AL, '0'
    JB NHAP 
    CMP AL, '9'
    JA NHAP
    
GETIN:
    MOV DL, AL
    MOV AH, 2
    INT 21h
    SUB AL, 48
    MOV AH, 0
    MOV THEADD, AX
    MOV AX, BX
    MUL SO10
    MOV BX, AX
    ADD BX, THEADD
    LOOP NHAP

PNEXT:
    LEA DX, ENDL
    MOV AH, 9
    INT 21h
    XOR AX, AX
    XOR DX, DX
    MOV THEADD, BX

XUAT:
    INC NUMB
    XOR AX, AX
    MOV AX, BX
    DIV SO10
    MOV BX, AX
    ADD DL, 48
    PUSH DX
    XOR DX, DX
    CMP BX, 0
    JNZ XUAT 
    XOR CX, CX
    MOV CX, NUMB
    
XNEXT:
    POP DX
    MOV AH, 2
    INT 21h
    LOOP XNEXT
    
EXIT:
    MOV AH, 4Ch
    INT 21h

END                                