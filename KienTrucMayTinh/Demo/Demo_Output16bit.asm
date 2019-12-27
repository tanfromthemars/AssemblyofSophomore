.model small
.stack 100h
.data

.code

;lay du lieu tu data vao ds
mov ax, @data
mov ds, ax

mov bx, 05h
mov cx, 16

Print:
    shl bx, 1    
    jnc Print0    
    jc  Print1

    
Print0:
    mov ah, 2
    mov dl,'0'
    int 21h
    jmp Exit

Print1:
    mov ah, 2
    mov dl, '1'
    int 21h    

Exit:    
loop Print    
;thoat chuong trinh
mov  ah, 4ch
int  21h     

END