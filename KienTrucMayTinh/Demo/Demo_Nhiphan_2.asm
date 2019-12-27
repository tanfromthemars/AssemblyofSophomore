.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 10,13,'Nhap vao day nhi phan: $'
    MSG2 DB 10,13,'Chuoi nhi phan vua nhap la: $'
    EMSG1 DB 10,13,'Nhap sai! Vui long xem lai.$'
    ERMSG1 DB 10,13,'Da du 16bit!$'
        
.CODE
    ;Lay dia chi tu DATA vao thanh ghi DS
    MOV AX,@DATA
    MOV DS,AX
    
    XOR BX,BX ;MOV BL,0
    XOR CX,CX ;MOV CX,0
    
INPUT:
    ;Xuat thong bao yeu cau nguoi dung nhap chuoi nhi phan
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE BREAK
    
    CMP AL,'0'
    JE XULY
    
    CMP AL,'1'
    JE XULY
    
    MOV AH,9
    LEA DX,EMSG1
    INT 21H
    
    JMP INPUT
    
XULY:
    AND AL,0Fh
    SHL BX,1
    OR BL,AL
    
    INC CX
    
    CMP CX,16
    JB INPUT
    
    ;Xuat thong bao nguoi dung nhap qua so luong ibt
    MOV AH,9
    LEA DX,ERMSG1
    INT 21H
BREAK:
    ;Xuat thong bao ket qua
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV CX,16
PRINT:
    SHL BX,1
    JNC PRINT_0 ;In bit so 0 (JNC nhay khi CF=0)
    JC PRINT_1 ;In bit so 1 (JC nhay khi CF=1)
PRINT_0:
    MOV AH,2
    MOV DL,'0'
    INT 21H
    JMP CONTINUE
PRINT_1:
    MOV AH,2
    MOV DL,'1'
    INT 21H
CONTINUE:
    LOOP PRINT

;Thoat chuong trinh
MOV AH,4Ch
INT 21h

END