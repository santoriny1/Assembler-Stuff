ORG 100h    

;SUMA SIN ACARREO 8 bits
MOV al, [00h]
MOV bl, [01h]
ADD al, bl   
MOV [02h], al

;SUMA SIN ACARREO 16 bits
MOV ax, [0000h]
MOV bx, [0000h]
ADD ax, bx
MOV [0000h], ax    

;SUMA CON ACARREO 8 bits
MOV al, [00h]
MOV bl, [01h] 
STC
ADC al, bl
JNC fin
MOV ah, 1h 

;SUMA CON ACARREO 16 bits
MOV ax, [0000h]
MOV bx, [0000h] 
STC
ADC ax, bx
JNC fin
MOV ah,1h
 
;RESTA SIN ACARREO 8 bits
MOV al, [00h]
MOV bl, [01h]
SUB al, bl   
MOV [02h], al

;RESTA SIN ACARREO 16 bits
MOV ax, [0000h]
MOV bx, [0000h]
SUB ax, bx
MOV [0000h], ax

;RESTA CON ACARREO 8 bits
MOV al, [00h]
MOV bl, [01h] 
STC
SBB al, bl
JNC fin
MOV ah, 1h

;RESTA CON ACARREO 16 bits
MOV ax, [0000h]
MOV bx, [0000h] 
STC
SBB ax, bx
JNC fin
MOV ah,1h

;MULTIPLICACION 8 bits
MOV al, [00h]
MOV bl, [01h]
MUL bl
MOV [02h], ax 
  
;MULTIPLICACION 16 bits
MOV ax, [0000h]
MOV bx, [0000h]
MUL bx
MOV [0000h], ax  

;DIVISION 8 bits
MOV al, [00h]
MOV bl, [01h]
DIV bl
MOV [02h], ax

;DIVISION 16 bits
MOV ax, [0000h]
MOV bx, [0000h]
DIV bx
MOV [0000h], ax

fin: RET