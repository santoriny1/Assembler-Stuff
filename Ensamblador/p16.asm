        ORG 100h
        
        JMP inicio    
        
texto DB "Introduce un numero: ", 10, 13, "$" 
igual DB "LE ATINASTE!!!! ", 10, 13, "$"
menor DB "El numero que ingresate es menor ", 10, 13, "$"
mayor DB "El numero que ingresate es mayor ", 10, 13, "$"
salto DB 10, 13, "$"
otrav DB "Introduce un numero otra vez: ", 10, 13, "$" 
const DB 035h
        
inicio: MOV al, 00
        MOV ah, 0
        INT 10h
        
        MOV ah, 9
        MOV dx, offset texto
        INT 21h 
        
ciclo:  MOV ah, 1
        INT 21h
        
        MOV bh, al
        MOV ah, 9
        MOV dx, offset salto
        INT 21h
        
        MOV bl, const
        CMP bh, bl
        JE fin
        JA may
        JB men
        
men:    MOV ah, 9
        MOV dx, offset menor
        INT 21h
        JMP otra        
        
may:    MOV ah, 9
        MOV dx, offset mayor
        INT 21h
        JMP otra
        
otra:   MOV ah, 9
        MOV dx, offset otrav
        INT 21h
        JMP ciclo                    
        
fin:    MOV ah, 9
        MOV dx, offset igual
        INT 21h         
        RET