.MODEL small
.STACK
.DATA
    MSG1 db "Hello, world$"
    MSG2 db 13, 10, "Hello, Solar System!$"
    MSG3 db 13, 10, "Hello, Universe!$"
.CODE
    MOV ax, @DATA
    MOV ds, ax
    
    MOV ah, 09h
    LEA dx, MSG1
    INT 21h
    LEA dx, MSG2
    INT 21h
    LEA dx, MSG3
    INT 21h
    
    MOV ah, 4ch
    INT 21h
END