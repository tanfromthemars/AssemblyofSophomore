.MODEL SMALL
.STACK
.DATA
    MESSAGE DW 13, 10, "Nhap so thu tu chuc nang: $"
    ;Cai dat trang thai BAT cua moi den
    ;Vi tri cac bit 7654_3210
    all_on  equ 0000_1111b
    first_light equ 0000_0001b
    second_light equ 0000_0010b
    third_light equ 0000_0100b
    fourth_light equ 0000_1000b
    
    OUTPUT_MESSAGE MACRO INPUT
        MOV AH, 9
        LEA DX, INPUT
        INT 21h
    ENDM

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MAIN:
        #start = Traffic_lights.exe#
        
        OUTPUT_MESSAGE MESSAGE
        
        MOV AH, 1
        INT 21h
        
        ;Neu ky tu nhap vao nho hon 0 hoac lon hon 5 thi do la nhap sai
        CMP AL, '0'
        JB ERROR
        
        CMP AL, '5'
        JA ERROR
        
        ;Nguoc lai thi thuc hien chuc nang do
        CMP AL, '0'
        JE TURN_OFF_ALL
        
        CMP AL, '1'
        JE FIRST
        
        CMP AL, '2'
        JE SECOND
        
        CMP AL, '3'
        JE THIRD
        
        CMP AL, '4'
        JE FOURTH
        
        JMP TURN_ON_ALL
        ;Phai dung tam thanh ghi BX roi moi chuyen vao ax la vi khi lap lai, gia tri thanh ghi AX bi thay doi do dung ham 1 ngat 21h khong con mang gia tri cu (den nao Bat, den nao Tat) nua. Nhu vay, BX se giu chuc nang luu trang thai cua cac den
        TURN_OFF_ALL:
            XOR BX, BX
            JMP _LOOP
        TURN_ON_ALL:
            MOV BX, all_on
            JMP _LOOP
        FIRST:
            XOR BX, first_light
            JMP _LOOP
        SECOND:
            XOR BX, second_light
            JMP _LOOP
        THIRD:
            XOR BX, third_light
            JMP _LOOP
        FOURTH:
            XOR BX, fourth_light
    _LOOP:
        MOV AX, BX
        OUT 4, AX
        ERROR:
            JMP MAIN
END                                