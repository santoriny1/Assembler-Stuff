;Segmento de constantes
        x EQU 0 ;posicion en x
        y EQU 0 ;posicion en y       


;Segmento de datos
        datos SEGMENT 
            
        cadena DB "HOLA ", x+30h, ", ", y+30h, 10, 13, "$"
            
        datos ENDS    

                       
                    
;Segmento de pila
        pila SEGMENT stack  
            
            DB 128 DUP(0)
            
        pila ENDS    


;Segmento de codigo
        codigo SEGMENT
            
            prac19 PROC FAR
                
            assume cs:codigo, ds:datos, ss:pila
                
                PUSH ds
                MOV ax, 0
                PUSH ax
                
            ;instrucciones
                MOV dh, y
                MOV dl, x
                CALL posicion
                
                MOV dx, OFFSET ds:cadena
                CALL escribir
            
                RET
                
            prac19 ENDP
            
            posicion PROC
            
                PUSH dx
                PUSH cx
                PUSH bx
                PUSH ax
                
                MOV bh, 0
                MOV ah, 2
                INT 10h
                
                POP ax
                POP bx
                POP cx
                POP dx
                
                RET    
                
            posicion ENDP
            
            escribir PROC
            
                PUSH dx
                PUSH cx
                PUSH bx
                PUSH ax
                
                MOV ah, 9
                INT 21h
                
                POP ax
                POP bx
                POP cx
                POP dx
                
                RET    
                
            escribir ENDP

        codigo ENDS
        END prac19
        