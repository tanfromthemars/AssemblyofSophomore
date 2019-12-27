.MODEL
.STACK 100h
.DATA
    TBAO1 DB 13, 10, "Nhap so hang 1: $"
    TBAO2 DB 13, 10, "Nhap so hang 2: $"
    TBAO DB 13, 10, "Tong: $"
    SO1 DB ?
    SO2 DB ?
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, TBAO1
    MOV AH, 9
    INT 21h
    
    POP AX
    
    CALL INPUT
    PUSH BX
    
    LEA DX, TBAO2
    MOV AH, 9
    INT 21h
    
    CALL INPUT
    PUSH BX
    
    POP AX
    POP BX
    ADD BX, AX
    
    CALL OUTPUT
    
    MOV AH, 4Ch
    INT 21h
    
INPUT PROC
    BATDAU:
;Khoi tao gia tri
        XOR BX, BX
        XOR CX, CX
;Nhap 1 ky tu
        MOV AH, 1
        INT 21h
;So sanh ky tu do
        CMP AL, '-'
        JE DAUTRU
        CMP AL, '+'
        JE DAUCONG
;Neu khong nhap dau
        JMP TIEPTUC
   
    DAUTRU:
        MOV CX, 1
        
    DAUCONG:
        INT 21h 
        
    TIEPTUC:
;So sanh neu nho hon so 0
    CMP AL, '0'
    JNGE KHONGPHAISO
    CMP AL, '9'

;So sanh neu lon hon so 9
    JNLE KHONGPHAISO

;Doi ky so thanh tri
    AND AX, 000Fh
    PUSH AX

;Tinh tong = 10 * Tong + tri
    MOV AX, 10
    MUL BX
    MOV BX, AX
    POP AX
    ADD BX, AX

;Nhap 1 ky tu
    MOV AH, 1
    INT 21h
    
;So sanh voi ENTER, neu khong phai thi tiep tuc lap
    CMP AL, 13
    JNE TIEPTUC
    
;Kiem tra CX co gia tri (1 neu am)
    CMP CX, 1
    JNE TRAVE
    NEG BX
    
    TRAVE:
        RET
    KHONGPHAISO:
        JMP BATDAU
INPUT ENDP

OUTPUT PROC
    PUSH BX
    LEA DX, TBAO
    MOV AH, 9
    INT 21h

;Lay lai gia tri cho BX
    POP BX

;So sanh tong voi so 0
    CMP BX, 0
    JGE DOIRATHAPPHAN

;Neu nho hon 0
    MOV DL, '-'
    MOV AH, 2
    INT 21h
    NEG BX
    
;Lap chia cho 10
    DOIRATHAPPHAN:
        MOV AX, BX
        XOR CX, CX
        MOV BX, 10
        CHIA:
            XOR DX, DX
            DIV BX
;So du cho vao ngan xep
            PUSH DX
            INC CX
;Lap cho den khi thuong bang 0
            CMP AX, 0
            JNE CHIA
            MOV AH, 2
        DOI:
;Doi so thap phan -> ky so
            POP DX
            OR DL, 30h
            INT 21h
            LOOP DOI
     RET  
OUTPUT ENDP

END