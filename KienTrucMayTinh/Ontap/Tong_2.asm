.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "Nhap so dau tien: $"
    TBAO2 DB 13, 10, "Nhap so tiep theo: $"
    TBAO DB 13, 10, "Tong: $"
.CODE
    INCLUDE "emu8086.inc"
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, TBAO1
    INT 21h
    
    POP AX
    
    CALL SCAN_NUM
    PUSH CX
    
    MOV AH, 9
    LEA DX, TBAO2
    INT 21h
    
    CALL SCAN_NUM
    PUSH CX
    
    XOR AX, AX
    XOR BX, BX
    POP AX
    POP BX
    ADD AX, BX
    PUSH AX
    
    LEA DX, TBAO
    MOV AH, 9
    INT 21h
    
    POP AX
    CALL PRINT_NUM
    
    MOV AH, 4Ch
    INT 21h
    
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    
END      