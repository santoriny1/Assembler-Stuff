
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

ORG 100h

MOV [120h], 0700h
MOV DS, [120h]      ;Direccionamiento directo
MOV [0000h], 0500h
MOV DS, [000h]

MOV AX, 0700h     ;Direccionamiento inmediato
MOV DS, AX        ;Direccionamiento registro a registro
MOV AX, 0500h
MOV DS, AX

MOV [SI], 120h
MOV DS, [SI]
MOV [SI], 0000h      ;Direccionamiento indirecto
MOV DS, [SI]

 
RET 




