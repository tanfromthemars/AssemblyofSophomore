.model small
.stack 100h
.data

TBao1 db 10, 13, "Nhap so thu nhat: $"
TBao2 db 10, 13, "Nhap so thu hai: $"
TBao3 db 10, 13, "Tong cua 2 chu so la: $"     
Num1  db ?
Num2  db ?
Tong  db ?
.code

;lay du lieu tu data vao ds
mov ax, @data
mov ds, ax

Input1:
;xuat thong bao yeu cau nguoi dung nhap
    mov ah, 9h
    lea dx, TBao1
    int 21h

;Nhap 1 ky tu tu ban phim
    mov ah, 1h
    int 21h

;kiem tra dieu kien
    cmp al, '0'
    jb  Input1

    cmp al, '9'
    ja Input1

;xu ly ki tu va luu ket qua
    sub al, 30h
    mov Num1, al

Input2:
;xuat thong bao yeu cau nguoi dung nhap
    mov ah, 9h
    lea dx, Tbao2
    int 21h

;Nhap 1 ki tu tu ban phim
    mov ah, 1h
    int 21h
           
;Kiem tra dieu kien
    cmp al, '0'
    jb  Input2

    cmp al, '9'
    ja Input2

;xu ly ki tu va luu ket qua
    sub al, 30h
    mov Num2, al

;xuat thong bao tinh tong
    mov ah, 9h
    lea dx, TBao3
    int 21h

;Tinh tong 
mov al, Num1
mov bl, Num2
add al, bl

add al, 30h
mov Tong, al

;xuat tong ra man hinh
mov ah, 2h
mov dl, tong 
int 21h

;thoat chuong trinh
mov ah, 4ch
int 21h     

END