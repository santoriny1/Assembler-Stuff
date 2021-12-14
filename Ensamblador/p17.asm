        ORG 100h
        
        MOV ah, 9
        MOV si, 0
        LEA dx, mensaje
        INT 21h
        MOV cl, 1
        CMP cl, bool
        JE var
        
;Guardar leyendo caracter por carcter
ciclo:  MOV ah, 1
	    INT 21h
	    MOV b2[si], al
	    INC si
	    CMP al, '$'
	    JE cxc
	    JMP ciclo
	    
cxc:    MOV ah, 9
        LEA dx, b2
        INT 21h   	                

;Guardar cadena en variable buffer        
var:    MOV cx, 0
        MOV ax, 0

        MOV dx, offset buffer 
        MOV ah, 0Ah
        INT 21h
        
        XOR bx, bx
        MOV bl, buffer[1]
        MOV buffer[bx+2], '$'
        MOV dx, offset buffer+2
        MOV ah, 9
        INT 21h        
        
        RET
        
mensaje DB "Ingresa texto: ", 10, 13, "$"
bool DB 6
buffer DB 100 dup('')
b2 DB ? 



