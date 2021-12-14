ORG 100h
JMP inicio

var1 DB 02h
var2 DW 0ffffh
var3 DB 01h, 02h, 03h, 04h, 00h
var4 DW 0ffffh, 0fffeh, 00h 

const EQU 0ffffh

inicio: MOV al, var1
        MOV ax, var2
        MOV al, var3[2]
        MOV ax, var4[0]
        MOV ax, const
        
MOV cx, 00004h
ciclo:  MOV bx, cx 
        MOV dl, var1
        MOV dx, var2
        MOV dl, var3[bx]
        MOV dx, var4[bx]
        MOV dx, const 
        LOOP ciclo       
        



RET


