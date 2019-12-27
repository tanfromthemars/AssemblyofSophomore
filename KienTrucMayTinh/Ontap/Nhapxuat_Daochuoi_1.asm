.MODEL SMALL
.STACK 100h
.DATA

.CODE
    MOV AH, 2
    MOV DL, '?'
    INT 21h
    
    CALL NHAP
    CALL XUAT
;Ket thuc
    MOV AH, 4Ch
    INT 21h
    
;Nhap ky tu vao stack
NHAP PROC
    POP BX
    XOR CX, CX
        
    REPEAT:
        MOV AH, 1
        INT 21h
;So sanh
        CMP AL, 13
        JE UNTIL 
        PUSH AX
        INC CX
        JMP REPEAT
        UNTIL:
        PUSH BX
        RET
NHAP ENDP

;Xuat
XUAT PROC
    POP BX
    
    MOV AH, 2
    MOV DL, 13
    INT 21h
    
    MOV AH, 2
    MOV DL, 10
    INT 21h
    
    JCXZ ENDFORL
    FORL:
        POP DX
        INT 21h
        LOOP FORL
        
    ENDFORL:
        PUSH BX
        RET
XUAT ENDP

END