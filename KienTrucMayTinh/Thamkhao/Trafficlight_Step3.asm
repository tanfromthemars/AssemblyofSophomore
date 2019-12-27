#start = Traffic_Light.exe#

name "Traffic_Lights_for_Pedestrians"

start:
nop

;Den giao thong dan o trang thanh Xanh - Do - Xanh - Do
mov ax, 030Ch ;030Ch <=> 0000_0011_0000_1100b
out 4, ax

;Den danh cho nguoi di bo se o trang thai Do - Xanh - Do - Xanh
xor ax, ax
mov ax, 66h ;66h <=> 0000_0000_0110_0110b
out 10, ax
                                         
;Cho chuyen tin hieu
mov cx, 4Ch ;Chuyen 2bit cao vao thanh ghi CX
mov dx, 4840h ;Chuyen 4bit thap vao thanh ghi DX
;Goi ham cho BIOS voi dau vao la CX:DX (Don vi micro giay)
mov ah, 86h
int 15h

;Den giao thong dang o trang thai Do - Xanh - Do - Xanh
mov ax, 0861h ;0861h <=> 0000_1000_0110_0001b
out 4, ax

;Den danh cho nguoi di bo se o trang thai Xanh - Do - Xanh - Do
xor ax, ax
mov ax, 99h ;99h <=> 0000_0000_1001_1001b
out 10, ax

mov cx, 4Ch ;Chuyen 2bit cao vao thanh ghi CX
mov dx, 4B40h ;Chuyen 4bit thap vao thanh ghi DX
;Goi ham cho BIOS voi dau vao la CX:DX (Don vi micro giay) 
mov ah, 86h
int 15h

;Quay lai tu dau
jmp start                                        